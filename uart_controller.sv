
module uart_controller #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,

    parameter CLK_FREQ = 50_000_000,
    parameter BAUD = 115200
) (
    // clk and reset
    input wire clk_i,
    input wire rst_i,

    // wishbone slave interface
    input  wire [ADDR_WIDTH-1:0] wb_adr_i,
    input  wire [DATA_WIDTH-1:0] wb_dat_i,
    output reg  [DATA_WIDTH-1:0] wb_dat_o,
    input  wire                  wb_we_i,
    input  wire [DATA_WIDTH/8-1:0] wb_sel_i,
    input  wire                  wb_stb_i,
    output reg                   wb_ack_o,
    input  wire                  wb_cyc_i,

    // uart interface
    output reg uart_txd_o,
    input  wire uart_rxd_i
);

  localparam REG_DATA = 8'h00;
  localparam REG_STATUS = 8'h05;

`ifdef SIMU
  // ============================================================================
  // Simulation Mode: Fast TX output via $write, RX with FIFO buffer
  // ============================================================================
  
  // uart receiver - keep real receiver for simulation input from uart_model
  logic rxd_data_ready_raw;
  logic [7:0] rxd_data_raw;
  logic rxd_clear;

  async_receiver #(
      .ClkFrequency(CLK_FREQ),
      .Baud        (BAUD)
  ) u_async_receiver (
      .clk           (clk_i),
      .RxD           (uart_rxd_i),
      .RxD_data_ready(rxd_data_ready_raw),
      .RxD_clear     (rxd_clear),
      .RxD_data      (rxd_data_raw)
  );

  // ============================================================================
  // RX FIFO - 16 bytes to buffer incoming characters
  // ============================================================================
  localparam FIFO_DEPTH = 16;
  localparam FIFO_ADDR_BITS = 4;
  
  logic [7:0] rx_fifo [0:FIFO_DEPTH-1];
  logic [FIFO_ADDR_BITS:0] rx_fifo_wptr = 0;  // Write pointer (extra bit for full detection)
  logic [FIFO_ADDR_BITS:0] rx_fifo_rptr = 0;  // Read pointer
  
  wire rx_fifo_empty = (rx_fifo_wptr == rx_fifo_rptr);
  wire rx_fifo_full = (rx_fifo_wptr[FIFO_ADDR_BITS-1:0] == rx_fifo_rptr[FIFO_ADDR_BITS-1:0]) && 
                      (rx_fifo_wptr[FIFO_ADDR_BITS] != rx_fifo_rptr[FIFO_ADDR_BITS]);
  wire [7:0] rx_fifo_data = rx_fifo[rx_fifo_rptr[FIFO_ADDR_BITS-1:0]];
  
  // Track when we've already captured the current rxd_data_ready pulse
  logic rxd_captured = 0;
  
  // Write to FIFO when receiver has new data
  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      rx_fifo_wptr <= 0;
      rxd_clear <= 1;
      rxd_captured <= 0;
    end else begin
      rxd_clear <= 0;  // Default: don't clear
      
      if (rxd_data_ready_raw && !rxd_captured) begin
        // New data from receiver - push to FIFO
        if (!rx_fifo_full) begin
          rx_fifo[rx_fifo_wptr[FIFO_ADDR_BITS-1:0]] <= rxd_data_raw;
          rx_fifo_wptr <= rx_fifo_wptr + 1;
          //$display("[UART-FIFO] Pushed: 0x%02x '%c' (wptr=%0d, rptr=%0d)", 
                   //rxd_data_raw, rxd_data_raw, rx_fifo_wptr + 1, rx_fifo_rptr);
        end else begin
          //$display("[UART-FIFO] OVERFLOW! Dropping: 0x%02x", rxd_data_raw);
        end
        rxd_clear <= 1;  // Clear receiver to accept next byte
        rxd_captured <= 1;
      end
      
      // Reset captured flag when rxd_data_ready goes low
      if (!rxd_data_ready_raw) begin
        rxd_captured <= 0;
      end
    end
  end
  
  // Read from FIFO when CPU reads REG_DATA
  logic fifo_read_pending = 0;
  
  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      rx_fifo_rptr <= 0;
      fifo_read_pending <= 0;
    end else if (fifo_read_pending) begin
      // Pop from FIFO after read completes
      if (!rx_fifo_empty) begin
        rx_fifo_rptr <= rx_fifo_rptr + 1;
        //$display("[UART-FIFO] Popped: 0x%02x (wptr=%0d, rptr=%0d)", 
                 //rx_fifo_data, rx_fifo_wptr, rx_fifo_rptr + 1);
      end
      fifo_read_pending <= 0;
    end else if (wb_stb_i && !wb_we_i && !wb_ack_o && wb_adr_i[7:0] == REG_DATA) begin
      // CPU is reading data register
      fifo_read_pending <= 1;
    end
  end

  // Status register: TX always ready, RX status from FIFO
  wire [7:0] reg_status_simu = {2'b0, 1'b1, 4'b0, ~rx_fifo_empty};
  
  // Wishbone ACK - immediate response
  always_ff @(posedge clk_i) begin
    if (rst_i)
      wb_ack_o <= 0;
    else if (wb_ack_o)
      wb_ack_o <= 0;
    else
      wb_ack_o <= wb_stb_i;
  end
  
  // Write logic - use $write for instant character output
  always_ff @(posedge clk_i) begin
    if (!rst_i && wb_stb_i && wb_we_i && !wb_ack_o) begin
      case (wb_adr_i[7:0])
        REG_DATA: begin
          if (wb_sel_i[0]) begin
            $write("%c", wb_dat_i[7:0]);
            $fflush();  // Ensure immediate output
          end
        end
        default: ;
      endcase
    end
  end
  
  // Read logic - return FIFO data and status
  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      wb_dat_o <= 32'h0;
    end else if (wb_stb_i && !wb_we_i && !wb_ack_o) begin
      case (wb_adr_i[7:0])
        REG_DATA: begin
          // Return data from FIFO head
          if (wb_sel_i[0]) wb_dat_o[7:0] <= rx_fifo_data;
          if (wb_sel_i[1]) wb_dat_o[15:8] <= rx_fifo_data;
          if (wb_sel_i[2]) wb_dat_o[23:16] <= rx_fifo_data;
          if (wb_sel_i[3]) wb_dat_o[31:24] <= rx_fifo_data;
          //$display("[UART] CPU read DATA: 0x%02x, fifo_empty=%0d", rx_fifo_data, rx_fifo_empty);
        end
        REG_STATUS: begin
          if (wb_sel_i[0]) wb_dat_o[7:0] <= reg_status_simu;
          if (wb_sel_i[1]) wb_dat_o[15:8] <= reg_status_simu;
          if (wb_sel_i[2]) wb_dat_o[23:16] <= reg_status_simu;
          if (wb_sel_i[3]) wb_dat_o[31:24] <= reg_status_simu;
          // Debug: disabled to speed up simulation
          // $display("[UART] CPU read STATUS: 0x%02x (DR=%0d, THRE=%0d)", reg_status_simu, ~rx_fifo_empty, 1'b1);
        end
        default: wb_dat_o <= 32'h0;
      endcase
    end
  end
  
  // TX pin unused in simulation (using $write instead)
  assign uart_txd_o = 1'b1;  // Idle state

`else
  // ============================================================================
  // Synthesis Mode: Real UART with async_transmitter/receiver + RX FIFO
  // ============================================================================

  // uart transmitter
  logic txd_start;
  logic txd_busy;
  logic [7:0] txd_data;

  async_transmitter #(
      .ClkFrequency(CLK_FREQ),
      .Baud        (BAUD)
  ) u_async_transmitter (
      .clk      (clk_i),
      .TxD_start(txd_start),
      .TxD_data (txd_data),
      .TxD      (uart_txd_o),
      .TxD_busy (txd_busy)
  );

  // uart receiver
  logic rxd_data_ready_raw;
  logic [7:0] rxd_data_raw;
  logic rxd_clear;

  async_receiver #(
      .ClkFrequency(CLK_FREQ),
      .Baud        (BAUD)
  ) u_async_receiver (
      .clk           (clk_i),
      .RxD           (uart_rxd_i),
      .RxD_data_ready(rxd_data_ready_raw),
      .RxD_clear     (rxd_clear),
      .RxD_data      (rxd_data_raw)
  );

  // ============================================================================
  // RX FIFO - 16 bytes to buffer incoming characters
  // ============================================================================
  localparam FIFO_DEPTH = 16;
  localparam FIFO_ADDR_BITS = 4;
  
  logic [7:0] rx_fifo [0:FIFO_DEPTH-1];
  logic [FIFO_ADDR_BITS:0] rx_fifo_wptr;  // Write pointer (extra bit for full detection)
  logic [FIFO_ADDR_BITS:0] rx_fifo_rptr;  // Read pointer
  
  wire rx_fifo_empty = (rx_fifo_wptr == rx_fifo_rptr);
  wire rx_fifo_full = (rx_fifo_wptr[FIFO_ADDR_BITS-1:0] == rx_fifo_rptr[FIFO_ADDR_BITS-1:0]) && 
                      (rx_fifo_wptr[FIFO_ADDR_BITS] != rx_fifo_rptr[FIFO_ADDR_BITS]);
  wire [7:0] rx_fifo_data = rx_fifo[rx_fifo_rptr[FIFO_ADDR_BITS-1:0]];
  
  // Edge detection for rxd_data_ready_raw (rising edge = new byte received)
  logic rxd_data_ready_d;  // Delayed version for edge detection
  wire rxd_data_ready_pulse = rxd_data_ready_raw && !rxd_data_ready_d;
  
  // Write to FIFO when receiver has new data (on rising edge of data_ready)
  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      rx_fifo_wptr <= 0;
      rxd_clear <= 1;
      rxd_data_ready_d <= 0;
    end else begin
      // Delay for edge detection
      rxd_data_ready_d <= rxd_data_ready_raw;
      
      // Default: don't clear
      rxd_clear <= 0;
      
      // On rising edge of data_ready, push to FIFO
      if (rxd_data_ready_pulse) begin
        if (!rx_fifo_full) begin
          rx_fifo[rx_fifo_wptr[FIFO_ADDR_BITS-1:0]] <= rxd_data_raw;
          rx_fifo_wptr <= rx_fifo_wptr + 1;
        end
        // Clear receiver immediately to accept next byte
        rxd_clear <= 1;
      end
    end
  end
  
  // Read from FIFO when CPU reads REG_DATA
  // Use wb_ack_o rising edge to detect completed read transaction
  logic wb_ack_d;
  wire read_data_complete = wb_ack_o && !wb_ack_d && 
                            !wb_we_i && (wb_adr_i[7:0] == REG_DATA);
  
  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      rx_fifo_rptr <= 0;
      wb_ack_d <= 0;
    end else begin
      // Delay for edge detection
      wb_ack_d <= wb_ack_o;
      
      // Pop from FIFO after read completes (on ack rising edge)
      if (read_data_complete && !rx_fifo_empty) begin
        rx_fifo_rptr <= rx_fifo_rptr + 1;
      end
    end
  end

  // Status register: TX ready from txd_busy, RX status from FIFO
  wire [7:0] reg_status = {2'b0, ~txd_busy, 4'b0, ~rx_fifo_empty};

  /*-- wishbone fsm --*/
  always_ff @(posedge clk_i) begin
    if (rst_i)
      wb_ack_o <= 0;
    else
      // every request get ACK-ed immediately
      if (wb_ack_o) begin
        wb_ack_o <= 0;
      end else begin
        wb_ack_o <= wb_stb_i;
      end
  end

  // write logic
  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      txd_start <= 0;
    end else if(wb_stb_i && wb_we_i) begin
      case (wb_adr_i[7:0])
        REG_DATA: begin
          if(wb_sel_i[0]) begin
            txd_data  <= wb_dat_i[7:0];
            txd_start <= 1;
          end
        end

        default: ;  // do nothing
      endcase
    end else begin
      txd_start <= 0;
    end
  end

  // read logic - return FIFO data and status
  always_ff @(posedge clk_i) begin
    if(rst_i) begin
      wb_dat_o <= 32'h0;
    end else if(wb_stb_i && !wb_we_i && !wb_ack_o) begin
      case (wb_adr_i[7:0])
        REG_DATA: begin
          // Return data from FIFO head
          if (wb_sel_i[0]) wb_dat_o[7:0] <= rx_fifo_data;
          if (wb_sel_i[1]) wb_dat_o[15:8] <= rx_fifo_data;
          if (wb_sel_i[2]) wb_dat_o[23:16] <= rx_fifo_data;
          if (wb_sel_i[3]) wb_dat_o[31:24] <= rx_fifo_data;
        end

        REG_STATUS: begin
          if (wb_sel_i[0]) wb_dat_o[7:0] <= reg_status;
          if (wb_sel_i[1]) wb_dat_o[15:8] <= reg_status;
          if (wb_sel_i[2]) wb_dat_o[23:16] <= reg_status;
          if (wb_sel_i[3]) wb_dat_o[31:24] <= reg_status;
        end

        default: wb_dat_o <= 32'h0;
      endcase
    end
  end

`endif

endmodule
