`timescale 1 ns / 1 ps


/*
 * Wishbone 3 port multiplexer
 */
module wb_mux_3 #
(
    parameter DATA_WIDTH = 32,                    // width of data bus in bits (8, 16, 32, or 64)
    parameter ADDR_WIDTH = 32,                    // width of address bus in bits
    parameter SELECT_WIDTH = (DATA_WIDTH/8)       // width of word select bus (1, 2, 4, or 8)
)
(
    input  wire                    clk,
    input  wire                    rst,

    /*
     * Wishbone master input
     */
    wishbone_if.slave wb_master_if,  // MUX receives signals as a slave from the master device

    /*
     * Wishbone slave 0 output
     */
    wishbone_if.master wb_slave0_if,  // MUX drives signals as a master to slave devices

    /*
     * Wishbone slave 0 address configuration
     */
    input  wire [ADDR_WIDTH-1:0]   wbs0_addr,     // Slave address prefix
    input  wire [ADDR_WIDTH-1:0]   wbs0_addr_msk, // Slave address prefix mask

    /*
     * Wishbone slave 1 output
     */
    wishbone_if.master wb_slave1_if,  // MUX drives signals as a master to slave devices

    /*
     * Wishbone slave 1 address configuration
     */
    input  wire [ADDR_WIDTH-1:0]   wbs1_addr,     // Slave address prefix
    input  wire [ADDR_WIDTH-1:0]   wbs1_addr_msk, // Slave address prefix mask

    /*
     * Wishbone slave 2 output
     */
    wishbone_if.master wb_slave2_if,  // MUX drives signals as a master to slave devices

    /*
     * Wishbone slave 2 address configuration
     */
    input  wire [ADDR_WIDTH-1:0]   wbs2_addr,     // Slave address prefix
    input  wire [ADDR_WIDTH-1:0]   wbs2_addr_msk  // Slave address prefix mask
);

wire wbs0_match = ~|((wb_master_if.adr ^ wbs0_addr) & wbs0_addr_msk);
wire wbs1_match = ~|((wb_master_if.adr ^ wbs1_addr) & wbs1_addr_msk);
wire wbs2_match = ~|((wb_master_if.adr ^ wbs2_addr) & wbs2_addr_msk);

wire wbs0_sel = wbs0_match;
wire wbs1_sel = wbs1_match & ~(wbs0_match);
wire wbs2_sel = wbs2_match & ~(wbs0_match | wbs1_match);

wire master_cycle = wb_master_if.cyc & wb_master_if.stb;



wire select_error = ~(wbs0_sel | wbs1_sel | wbs2_sel) & master_cycle;

// master
assign wb_master_if.dat_i = wbs0_sel ? wb_slave0_if.dat_i :
                   wbs1_sel ? wb_slave1_if.dat_i :
                   wbs2_sel ? wb_slave2_if.dat_i :
                   {DATA_WIDTH{1'b0}};

assign wb_master_if.ack = wb_slave0_if.ack |
                   wb_slave1_if.ack |
                   wb_slave2_if.ack;
assign wb_master_if.err = wb_slave0_if.err |
                   wb_slave1_if.err |
                   wb_slave2_if.err |
                   select_error;

assign wb_master_if.rty = wb_slave0_if.rty |
                   wb_slave1_if.rty |
                   wb_slave2_if.rty;

// slave 0
assign wb_slave0_if.adr = wb_master_if.adr;
assign wb_slave0_if.dat_o = wb_master_if.dat_o;
assign wb_slave0_if.we = wb_master_if.we & wbs0_sel;
assign wb_slave0_if.sel = wb_master_if.sel;
assign wb_slave0_if.stb = wb_master_if.stb & wbs0_sel;
assign wb_slave0_if.cyc = wb_master_if.cyc & wbs0_sel;

// slave 1
assign wb_slave1_if.adr = wb_master_if.adr;
assign wb_slave1_if.dat_o = wb_master_if.dat_o;
assign wb_slave1_if.we = wb_master_if.we & wbs1_sel;
assign wb_slave1_if.sel = wb_master_if.sel;
assign wb_slave1_if.stb = wb_master_if.stb & wbs1_sel;
assign wb_slave1_if.cyc = wb_master_if.cyc & wbs1_sel;

// slave 2
assign wb_slave2_if.adr = wb_master_if.adr;
assign wb_slave2_if.dat_o = wb_master_if.dat_o;
assign wb_slave2_if.we = wb_master_if.we & wbs2_sel;
assign wb_slave2_if.sel = wb_master_if.sel;
assign wb_slave2_if.stb = wb_master_if.stb & wbs2_sel;
assign wb_slave2_if.cyc = wb_master_if.cyc & wbs2_sel;


endmodule

