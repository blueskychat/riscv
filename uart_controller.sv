
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
    wishbone_if.slave wb_if,

    // uart interface
    output reg uart_txd_o,
    input  wire uart_rxd_i
);

  localparam REG_DATA = 8'h00;
  localparam REG_STATUS = 8'h05;

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
  logic rxd_data_ready;
  logic [7:0] rxd_data;
  logic rxd_clear;

  async_receiver #(
      .ClkFrequency(CLK_FREQ),
      .Baud        (BAUD)
  ) u_async_receiver (
      .clk           (clk_i),
      .RxD           (uart_rxd_i),
      .RxD_data_ready(rxd_data_ready),
      .RxD_clear     (rxd_clear),
      .RxD_data      (rxd_data)
  );

  /*-- internal registers --*/
  wire [7:0] reg_status = {2'b0, ~txd_busy, 4'b0, rxd_data_ready};

  /*-- wishbone fsm --*/
  always_ff @(posedge clk_i) begin
    if (rst_i)
      wb_if.ack <= 0;
    else
      // every request get ACK-ed immediately
      if (wb_if.ack) begin
        wb_if.ack <= 0;
      end else begin
        wb_if.ack <= wb_if.stb;
      end
  end

  // write logic
  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      txd_start <= 0;
    end else if(wb_if.stb && wb_if.we) begin
      case (wb_if.adr[7:0])
        REG_DATA: begin
          if(wb_if.sel[0]) begin
            txd_data  <= wb_if.dat_o[7:0];
            txd_start <= 1;
          end
        end

        default: ;  // do nothing
      endcase
    end else begin
      txd_start <= 0;
    end
  end

  // read logic
  always_ff @(posedge clk_i) begin
    if(rst_i) begin
      rxd_clear <= 1;  // clear rxd to initialize dataready
    end else if(wb_if.stb && !wb_if.we) begin
      case (wb_if.adr[7:0])
        REG_DATA: begin
          if (wb_if.sel[0]) wb_if.dat_i[7:0] <= rxd_data;
          if (wb_if.sel[1]) wb_if.dat_i[15:8] <= rxd_data;
          if (wb_if.sel[2]) wb_if.dat_i[23:16] <= rxd_data;
          if (wb_if.sel[3]) wb_if.dat_i[31:24] <= rxd_data;

          rxd_clear <= 1;
        end

        REG_STATUS: begin
          if (wb_if.sel[0]) wb_if.dat_i[7:0] <= reg_status;
          if (wb_if.sel[1]) wb_if.dat_i[15:8] <= reg_status;
          if (wb_if.sel[2]) wb_if.dat_i[23:16] <= reg_status;
          if (wb_if.sel[3]) wb_if.dat_i[31:24] <= reg_status;
        end

        default: ;  // do nothing
      endcase
    end else begin
      rxd_clear <= 0;
    end
  end

endmodule
