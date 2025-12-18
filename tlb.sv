`include "defines.sv"

// tlb.sv - 32-entry Fully-Associative TLB for Sv32 (Icarus Verilog compatible)
// Simplified version with unpacked struct arrays

module tlb #(
    parameter ENTRIES = 32,
    parameter INDEX_WIDTH = 5  // log2(32)
) (
    input  wire logic        clk,
    input  wire logic        rst,
    
    // Lookup interface
    input  wire logic [31:0] vaddr_i,          // Virtual address to lookup
    input  wire logic        lookup_req_i,      // Lookup request valid
    output logic             hit_o,             // TLB hit
    output logic [31:0]      paddr_o,           // Physical address result
    output logic [6:0]       perm_o,            // Permissions: {D, A, G, U, X, W, R}
    output logic             is_superpage_o,    // Hit entry is superpage (4MB)
    
    // Fill interface (from PTW)
    input  wire logic        fill_req_i,        // Fill request valid
    input  wire logic [19:0] fill_vpn_i,        // Virtual page number [31:12]
    input  wire logic [21:0] fill_ppn_i,        // Physical page number from PTE
    input  wire logic [6:0]  fill_perm_i,       // Permissions {D, A, G, U, X, W, R}
    input  wire logic        fill_superpage_i,  // Is this a superpage entry?
    
    // Invalidation interface (SFENCE.VMA)
    input  wire logic        flush_all_i,       // Invalidate all entries
    input  wire logic        flush_vpn_i,       // Invalidate entry matching VPN
    input  wire logic [19:0] flush_vpn_addr_i   // VPN to invalidate
);

    // ==================== TLB Entry Storage (Unpacked for Icarus) ====================
    logic       valid [0:ENTRIES-1];
    logic       superpage [0:ENTRIES-1];
    logic [9:0] vpn1 [0:ENTRIES-1];
    logic [9:0] vpn0 [0:ENTRIES-1];
    logic [21:0] ppn [0:ENTRIES-1];
    logic [6:0] perm [0:ENTRIES-1];
    
    // FIFO replacement pointer
    logic [INDEX_WIDTH-1:0] next_fill_idx;
    
    // ==================== VPN Extraction ====================
    wire [9:0] lookup_vpn1 = vaddr_i[31:22];
    wire [9:0] lookup_vpn0 = vaddr_i[21:12];
    wire [11:0] page_offset = vaddr_i[11:0];
    
    // ==================== TLB Lookup (Fully Associative) ====================
    logic [ENTRIES-1:0] entry_match;
    logic [INDEX_WIDTH-1:0] hit_idx;
    
    // Parallel tag comparison
    integer i;
    always_comb begin
        entry_match = '0;
        
        for (i = 0; i < ENTRIES; i = i + 1) begin
            if (valid[i]) begin
                if (superpage[i]) begin
                    // Superpage: only compare VPN[1]
                    entry_match[i] = (vpn1[i] == lookup_vpn1);
                end else begin
                    // Regular page: compare both VPN[1] and VPN[0]
                    entry_match[i] = (vpn1[i] == lookup_vpn1) && (vpn0[i] == lookup_vpn0);
                end
            end
        end
    end
    
    // Hit detection and priority encoder
    always_comb begin
        hit_o = |entry_match;
        hit_idx = '0;
        
        // Priority encoder - find first matching entry (lower index has priority)
        // Reverse iteration ensures last assignment wins, giving priority to lower indices
        for (i = ENTRIES-1; i >= 0; i = i - 1) begin
            if (entry_match[i]) begin
                hit_idx = i[INDEX_WIDTH-1:0];
            end
        end
    end
    
    // ==================== Physical Address Generation ====================
    always_comb begin
        paddr_o = 32'h0;
        perm_o = 7'h0;
        is_superpage_o = 1'b0;
        
        if (hit_o) begin
            perm_o = perm[hit_idx];
            is_superpage_o = superpage[hit_idx];
            
            if (superpage[hit_idx]) begin
                // Superpage (4MB): PPN[21:10] | VPN[0] | Offset
                paddr_o = {ppn[hit_idx][21:10], lookup_vpn0, page_offset};
            end else begin
                // Regular page (4KB): PPN | Offset
                paddr_o = {ppn[hit_idx], page_offset};
            end
        end
    end
    
    // ==================== TLB Fill and Invalidation ====================
    integer j;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Invalidate all entries on reset
            for (j = 0; j < ENTRIES; j = j + 1) begin
                valid[j] <= 1'b0;
            end
            next_fill_idx <= '0;
            
        end else if (flush_all_i) begin
            // SFENCE.VMA with no arguments: flush all entries
            for (j = 0; j < ENTRIES; j = j + 1) begin
                valid[j] <= 1'b0;
            end
            
        end else if (flush_vpn_i) begin
            // SFENCE.VMA with VPN: flush matching entry
            for (j = 0; j < ENTRIES; j = j + 1) begin
                if (valid[j]) begin
                    if (superpage[j]) begin
                        if (vpn1[j] == flush_vpn_addr_i[19:10]) begin
                            valid[j] <= 1'b0;
                        end
                    end else begin
                        if ({vpn1[j], vpn0[j]} == flush_vpn_addr_i) begin
                            valid[j] <= 1'b0;  
                        end
                    end
                end
            end
            
        end else if (fill_req_i) begin
            // Fill new entry (FIFO replacement)
            valid[next_fill_idx]     <= 1'b1;
            superpage[next_fill_idx] <= fill_superpage_i;
            vpn1[next_fill_idx]      <= fill_vpn_i[19:10];
            vpn0[next_fill_idx]      <= fill_vpn_i[9:0];
            ppn[next_fill_idx]       <= fill_ppn_i;
            perm[next_fill_idx]      <= fill_perm_i;
            
            // Advance FIFO pointer
            next_fill_idx <= next_fill_idx + 1'b1;
        end
    end

endmodule
