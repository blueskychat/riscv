`include "defines.sv"

module dcache (
    input  logic        clk,
    input  logic        rst,

    // CPU Interface
    input  logic [31:0] mem_req_addr_i,
    input  logic [31:0] mem_req_wdata_i,
    input  logic        mem_req_we_i,
    input  logic [3:0]  mem_req_be_i,
    input  logic        mem_req_valid_i,

    output logic [31:0] mem_resp_data_o,
    output logic        mem_req_ready_o,

    // Wishbone Master Interface
    output logic [31:0] wb_adr_o,
    output logic [31:0] wb_dat_o,
    input  logic [31:0] wb_dat_i,
    output logic        wb_we_o,
    output logic [3:0]  wb_sel_o,
    output logic        wb_stb_o,
    input  logic        wb_ack_i,
    output logic        wb_cyc_o,
    input  logic        wb_rty_i,
    input  logic        wb_err_i
);

    // Simple pass-through implementation
    assign wb_adr_o = mem_req_addr_i;
    assign wb_dat_o = mem_req_wdata_i;
    assign wb_we_o  = mem_req_we_i;
    assign wb_sel_o = mem_req_be_i;
    
    // Pass valid signal to Wishbone strobe and cycle
    assign wb_stb_o = mem_req_valid_i;
    assign wb_cyc_o = mem_req_valid_i;

    // Pass Wishbone response back to CPU
    assign mem_resp_data_o = wb_dat_i;
    assign mem_req_ready_o = wb_ack_i;

endmodule
