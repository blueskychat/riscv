`timescale 1 ns / 1 ps


/*
 * Wishbone 4 port multiplexer
 */
module wb_mux_4 #
(
    parameter DATA_WIDTH = 32,                    // width of data bus in bits (8, 16, 32, or 64)
    parameter ADDR_WIDTH = 32,                    // width of address bus in bits
    parameter SELECT_WIDTH = (DATA_WIDTH/8)       // width of word select bus (1, 2, 4, or 8)
)
(
    input  wire                    clk,
    input  wire                    rst,

    /*
     * Wishbone master input (slave interface - receives from master)
     */
    input  wire [ADDR_WIDTH-1:0]   wb_master_adr_i,
    input  wire [DATA_WIDTH-1:0]   wb_master_dat_i,
    output wire [DATA_WIDTH-1:0]   wb_master_dat_o,
    input  wire                    wb_master_we_i,
    input  wire [SELECT_WIDTH-1:0] wb_master_sel_i,
    input  wire                    wb_master_stb_i,
    output wire                    wb_master_ack_o,
    input  wire                    wb_master_cyc_i,
    output wire                    wb_master_rty_o,
    output wire                    wb_master_err_o,

    /*
     * Wishbone slave 0 output (master interface - drives slave)
     */
    output wire [ADDR_WIDTH-1:0]   wb_slave0_adr_o,
    output wire [DATA_WIDTH-1:0]   wb_slave0_dat_o,
    input  wire [DATA_WIDTH-1:0]   wb_slave0_dat_i,
    output wire                    wb_slave0_we_o,
    output wire [SELECT_WIDTH-1:0] wb_slave0_sel_o,
    output wire                    wb_slave0_stb_o,
    input  wire                    wb_slave0_ack_i,
    output wire                    wb_slave0_cyc_o,
    input  wire                    wb_slave0_rty_i,
    input  wire                    wb_slave0_err_i,

    /*
     * Wishbone slave 0 address configuration
     */
    input  wire [ADDR_WIDTH-1:0]   wbs0_addr,     // Slave address prefix
    input  wire [ADDR_WIDTH-1:0]   wbs0_addr_msk, // Slave address prefix mask

    /*
     * Wishbone slave 1 output (master interface - drives slave)
     */
    output wire [ADDR_WIDTH-1:0]   wb_slave1_adr_o,
    output wire [DATA_WIDTH-1:0]   wb_slave1_dat_o,
    input  wire [DATA_WIDTH-1:0]   wb_slave1_dat_i,
    output wire                    wb_slave1_we_o,
    output wire [SELECT_WIDTH-1:0] wb_slave1_sel_o,
    output wire                    wb_slave1_stb_o,
    input  wire                    wb_slave1_ack_i,
    output wire                    wb_slave1_cyc_o,
    input  wire                    wb_slave1_rty_i,
    input  wire                    wb_slave1_err_i,

    /*
     * Wishbone slave 1 address configuration
     */
    input  wire [ADDR_WIDTH-1:0]   wbs1_addr,     // Slave address prefix
    input  wire [ADDR_WIDTH-1:0]   wbs1_addr_msk, // Slave address prefix mask

    /*
     * Wishbone slave 2 output (master interface - drives slave)
     */
    output wire [ADDR_WIDTH-1:0]   wb_slave2_adr_o,
    output wire [DATA_WIDTH-1:0]   wb_slave2_dat_o,
    input  wire [DATA_WIDTH-1:0]   wb_slave2_dat_i,
    output wire                    wb_slave2_we_o,
    output wire [SELECT_WIDTH-1:0] wb_slave2_sel_o,
    output wire                    wb_slave2_stb_o,
    input  wire                    wb_slave2_ack_i,
    output wire                    wb_slave2_cyc_o,
    input  wire                    wb_slave2_rty_i,
    input  wire                    wb_slave2_err_i,

    /*
     * Wishbone slave 2 address configuration
     */
    input  wire [ADDR_WIDTH-1:0]   wbs2_addr,     // Slave address prefix
    input  wire [ADDR_WIDTH-1:0]   wbs2_addr_msk, // Slave address prefix mask

    /*
     * Wishbone slave 3 output (master interface - drives slave)
     */
    output wire [ADDR_WIDTH-1:0]   wb_slave3_adr_o,
    output wire [DATA_WIDTH-1:0]   wb_slave3_dat_o,
    input  wire [DATA_WIDTH-1:0]   wb_slave3_dat_i,
    output wire                    wb_slave3_we_o,
    output wire [SELECT_WIDTH-1:0] wb_slave3_sel_o,
    output wire                    wb_slave3_stb_o,
    input  wire                    wb_slave3_ack_i,
    output wire                    wb_slave3_cyc_o,
    input  wire                    wb_slave3_rty_i,
    input  wire                    wb_slave3_err_i,

    /*
     * Wishbone slave 3 address configuration
     */
    input  wire [ADDR_WIDTH-1:0]   wbs3_addr,     // Slave address prefix
    input  wire [ADDR_WIDTH-1:0]   wbs3_addr_msk  // Slave address prefix mask
);

wire wbs0_match = ~|((wb_master_adr_i ^ wbs0_addr) & wbs0_addr_msk);
wire wbs1_match = ~|((wb_master_adr_i ^ wbs1_addr) & wbs1_addr_msk);
wire wbs2_match = ~|((wb_master_adr_i ^ wbs2_addr) & wbs2_addr_msk);
wire wbs3_match = ~|((wb_master_adr_i ^ wbs3_addr) & wbs3_addr_msk);

wire wbs0_sel = wbs0_match;
wire wbs1_sel = wbs1_match & ~(wbs0_match);
wire wbs2_sel = wbs2_match & ~(wbs0_match | wbs1_match);
wire wbs3_sel = wbs3_match & ~(wbs0_match | wbs1_match | wbs2_match);

wire master_cycle = wb_master_cyc_i & wb_master_stb_i;



wire select_error = ~(wbs0_sel | wbs1_sel | wbs2_sel | wbs3_sel) & master_cycle;

// master
assign wb_master_dat_o = wbs0_sel ? wb_slave0_dat_i :
                   wbs1_sel ? wb_slave1_dat_i :
                   wbs2_sel ? wb_slave2_dat_i :
                   wbs3_sel ? wb_slave3_dat_i :
                   {DATA_WIDTH{1'b0}};

assign wb_master_ack_o = wb_slave0_ack_i |
                   wb_slave1_ack_i |
                   wb_slave2_ack_i |
                   wb_slave3_ack_i;
assign wb_master_err_o = wb_slave0_err_i |
                   wb_slave1_err_i |
                   wb_slave2_err_i |
                   wb_slave3_err_i |
                   select_error;

assign wb_master_rty_o = wb_slave0_rty_i |
                   wb_slave1_rty_i |
                   wb_slave2_rty_i |
                   wb_slave3_rty_i;

// slave 0
assign wb_slave0_adr_o = wb_master_adr_i;
assign wb_slave0_dat_o = wb_master_dat_i;
assign wb_slave0_we_o = wb_master_we_i & wbs0_sel;
assign wb_slave0_sel_o = wb_master_sel_i;
assign wb_slave0_stb_o = wb_master_stb_i & wbs0_sel;
assign wb_slave0_cyc_o = wb_master_cyc_i & wbs0_sel;

// slave 1
assign wb_slave1_adr_o = wb_master_adr_i;
assign wb_slave1_dat_o = wb_master_dat_i;
assign wb_slave1_we_o = wb_master_we_i & wbs1_sel;
assign wb_slave1_sel_o = wb_master_sel_i;
assign wb_slave1_stb_o = wb_master_stb_i & wbs1_sel;
assign wb_slave1_cyc_o = wb_master_cyc_i & wbs1_sel;

// slave 2
assign wb_slave2_adr_o = wb_master_adr_i;
assign wb_slave2_dat_o = wb_master_dat_i;
assign wb_slave2_we_o = wb_master_we_i & wbs2_sel;
assign wb_slave2_sel_o = wb_master_sel_i;
assign wb_slave2_stb_o = wb_master_stb_i & wbs2_sel;
assign wb_slave2_cyc_o = wb_master_cyc_i & wbs2_sel;

// slave 3
assign wb_slave3_adr_o = wb_master_adr_i;
assign wb_slave3_dat_o = wb_master_dat_i;
assign wb_slave3_we_o = wb_master_we_i & wbs3_sel;
assign wb_slave3_sel_o = wb_master_sel_i;
assign wb_slave3_stb_o = wb_master_stb_i & wbs3_sel;
assign wb_slave3_cyc_o = wb_master_cyc_i & wbs3_sel;


endmodule

