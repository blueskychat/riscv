
module sram_controller #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,

    parameter SRAM_ADDR_WIDTH = 20,
    parameter SRAM_DATA_WIDTH = 32,

    localparam SRAM_BYTES = SRAM_DATA_WIDTH / 8,
    localparam SRAM_BYTE_WIDTH = $clog2(SRAM_BYTES)
) (
    // clk and reset
    input wire clk_i,
    input wire rst_i,

    // wishbone slave interface
    wishbone_if.slave wb_if,

    // sram interface
    output reg [SRAM_ADDR_WIDTH-1:0] sram_addr,
    inout wire [SRAM_DATA_WIDTH-1:0] sram_data,
    output reg sram_ce_n,
    output reg sram_oe_n,
    output reg sram_we_n,
    output reg [SRAM_BYTES-1:0] sram_be_n
);


    typedef enum logic [2:0] {
      STATE_IDLE = 0,
      STATE_READ = 1,
      STATE_READ_2 = 2,
      STATE_WRITE = 3,
      STATE_WRITE_2 = 4,
      STATE_WRITE_3 = 5,
      STATE_DONE = 6
    } state_t;
    state_t state;

    reg wb_ack_o_reg;
    reg [DATA_WIDTH-1:0] wb_dat_o_reg;

    reg [SRAM_ADDR_WIDTH-1:0] sram_addr_reg;
    wire [SRAM_DATA_WIDTH-1:0] sram_data_i_comb;
    reg [SRAM_DATA_WIDTH-1:0] sram_data_o_reg;
    reg sram_data_t_reg;

    reg [SRAM_BYTES-1:0] sram_be_n_reg;
    reg sram_ce_n_reg;
    reg sram_oe_n_reg;
    reg sram_we_n_reg;
    
/*
    initial begin
        sram_ce_n_reg = 1'b1;
        sram_oe_n_reg = 1'b1;
        sram_we_n_reg = 1'b1;
    end
*/
    assign wb_if.ack = wb_ack_o_reg;
    assign wb_if.dat_i = wb_dat_o_reg;

    assign sram_addr = sram_addr_reg;

    assign sram_data = sram_data_t_reg ? {SRAM_DATA_WIDTH{1'bz}} : sram_data_o_reg;
    assign sram_data_i_comb = sram_data;

    assign sram_be_n = sram_be_n_reg;
    assign sram_ce_n = sram_ce_n_reg;
    assign sram_oe_n = sram_oe_n_reg;
    assign sram_we_n = sram_we_n_reg;

    always_ff @ (posedge clk_i) begin
        if (rst_i) begin
            wb_ack_o_reg <= 1'b0;
            wb_dat_o_reg <= '0;
            sram_addr_reg <= '0;
            sram_data_t_reg <= 1'b1;
            sram_data_o_reg <= '0;
            sram_be_n_reg <= '1;
            sram_ce_n_reg <= 1'b1;
            sram_oe_n_reg <= 1'b1;
            sram_we_n_reg <= 1'b1;
            state <= STATE_IDLE;
        end else begin
            // 默认保持当前值（防止隐式锁存）
            wb_ack_o_reg      <= wb_ack_o_reg;
            wb_dat_o_reg      <= wb_dat_o_reg;
            sram_addr_reg     <= sram_addr_reg;
            sram_be_n_reg     <= sram_be_n_reg;
            sram_ce_n_reg     <= sram_ce_n_reg;
            sram_oe_n_reg     <= sram_oe_n_reg;
            sram_we_n_reg     <= sram_we_n_reg;
            sram_data_t_reg   <= sram_data_t_reg;
            sram_data_o_reg   <= sram_data_o_reg;          
            case (state)
              STATE_IDLE: begin
                if (wb_if.stb && wb_if.cyc ) begin
                    //sram_addr_reg <= wb_adr_i/SRAM_BYTES; wb_adr_i>>SRAM_BYTES;
                    sram_addr_reg <= wb_if.adr[SRAM_ADDR_WIDTH + SRAM_BYTE_WIDTH - 1 : SRAM_BYTE_WIDTH];
                    if (wb_if.we) begin
                        sram_data_t_reg <= 1'b0;
                        sram_data_o_reg <= wb_if.dat_o;
                        sram_be_n_reg <= ~wb_if.sel;
                        sram_ce_n_reg <= 1'b0;
                        sram_oe_n_reg <= 1'b1;
                        sram_we_n_reg <= 1'b1;
                        state <= STATE_WRITE;
                    end else begin
                        sram_data_t_reg <= 1'b1;
                        sram_be_n_reg <= ~wb_if.sel;
                        sram_ce_n_reg <= 1'b0;
                        sram_oe_n_reg <= 1'b0;
                        sram_we_n_reg <= 1'b1;
                        state <= STATE_READ;
                    end
                end
              end
              STATE_READ: begin
                state <= STATE_READ_2;
              end
              STATE_READ_2: begin
                wb_dat_o_reg <= sram_data_i_comb;
                wb_ack_o_reg <= 1'b1;
                sram_be_n_reg <= '1;
                sram_ce_n_reg <= 1'b1;
                sram_oe_n_reg <= 1'b1;
                sram_we_n_reg <= 1'b1;
                state <= STATE_DONE;
              end
              STATE_WRITE: begin
                sram_we_n_reg <= 1'b0;
                state <= STATE_WRITE_2;
              end
              STATE_WRITE_2: begin
                sram_we_n_reg <= 1'b1;
                state <= STATE_WRITE_3;
              end
              STATE_WRITE_3: begin
                wb_ack_o_reg <= 1'b1;
                sram_ce_n_reg <= 1'b1;
                sram_oe_n_reg <= 1'b1;
                sram_we_n_reg <= 1'b1;
                state <= STATE_DONE;
              end
              STATE_DONE: begin
                sram_data_t_reg <= 1'b1;
                sram_data_o_reg <= '0;
                wb_ack_o_reg <= 1'b0;
                state <= STATE_IDLE;
              end
              default: state <= STATE_IDLE;
            endcase
        end
    end
endmodule
