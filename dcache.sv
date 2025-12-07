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

    // ========================================================================
    // Address Classification (Combinational)
    // ========================================================================
    
    // Magic address: 0x9xxxxxxx - simulation print, immediate ACK
`ifdef SIMU
    wire is_magic_addr = (mem_req_addr_i[31:28] == 4'h9);
`else
    wire is_magic_addr = 1'b0;
`endif
    
    // Cacheable range: 0x80000000~0x807fffff (8MB)
    // For now, treated same as bypass (future cache implementation)
    wire is_cacheable = (mem_req_addr_i[31:23] == 9'b1000_0000_0);
    
    // Bypass: all other addresses (UART, etc.) - go directly to wishbone
    wire is_bypass = !is_magic_addr;

    // ========================================================================
    // Magic Address Handling (Simulation Only)
    // ========================================================================
`ifdef SIMU
    // Magic address gets immediate ACK via combinational logic
    // No state machine needed - pure combinational for single-cycle operation
    wire magic_ack = is_magic_addr && mem_req_valid_i;
    
    // Debug print for magic address writes
    always @(posedge clk) begin
        if (magic_ack && mem_req_we_i) begin
            $write("%c", mem_req_wdata_i[7:0]);
        end
    end
`else
    wire magic_ack = 1'b0;
`endif

    // ========================================================================
    // Wishbone Interface (for bypass and cacheable addresses)
    // ========================================================================
    
    // Only drive wishbone for non-magic addresses
    assign wb_adr_o = mem_req_addr_i;
    assign wb_dat_o = mem_req_wdata_i;
    assign wb_we_o  = mem_req_we_i & is_bypass;
    assign wb_sel_o = mem_req_be_i;
    
    // Only assert wishbone signals for bypass addresses
    assign wb_stb_o = mem_req_valid_i & is_bypass;
    assign wb_cyc_o = mem_req_valid_i & is_bypass;

    // ========================================================================
    // Response Mux
    // ========================================================================
    
    // Data: magic address returns 0, others get wishbone data
    assign mem_resp_data_o = is_magic_addr ? 32'h0 : wb_dat_i;
    
    // ACK: magic address is immediate, others wait for wishbone
    assign mem_req_ready_o = magic_ack | (is_bypass & wb_ack_i);

endmodule
