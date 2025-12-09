`include "defines.sv"

// =============================================================================
// DCache - Phase 2: L1 Write-Through Cache
// =============================================================================
// L1: 1KB, Direct-Mapped, LUTRAM, 16-byte lines
// - Read operations: cache enabled (from Phase 1)
// - Write hit: update L1 data AND write-through to memory
// - Write miss: only write to memory (no write-allocate)
// =============================================================================

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
    // L1 Cache Parameters
    // ========================================================================
    // 1KB = 64 sets × 16 bytes/line, Direct-Mapped
    localparam L1_SETS = 64;
    localparam L1_LINE_SIZE = 16;       // 16 bytes = 4 words
    localparam L1_INDEX_WIDTH = 6;      // log2(64)
    localparam L1_OFFSET_WIDTH = 4;     // log2(16)
    localparam L1_TAG_WIDTH = 22;       // 32 - 6 - 4
    localparam L1_WORD_OFFSET_WIDTH = 2;

    // ========================================================================
    // Address Breakdown
    // ========================================================================
    // [31:10] Tag (22 bits) | [9:4] Index (6 bits) | [3:2] Word (2 bits) | [1:0] Byte (2 bits)
    wire [L1_TAG_WIDTH-1:0]        l1_tag   = mem_req_addr_i[31:10];
    wire [L1_INDEX_WIDTH-1:0]      l1_index = mem_req_addr_i[9:4];
    wire [L1_WORD_OFFSET_WIDTH-1:0] l1_word  = mem_req_addr_i[3:2];

    // ========================================================================
    // Address Classification
    // ========================================================================
`ifdef SIMU
    wire is_magic_addr = (mem_req_addr_i[31:28] == 4'h9);
`else
    wire is_magic_addr = 1'b0;
`endif

    // Cacheable range: 0x80000000~0x807fffff (8MB)
    wire is_cacheable = (mem_req_addr_i[31:23] == 9'b1000_0000_0);
    
    // Bypass: all other addresses (UART, etc.)
    wire is_bypass = !is_magic_addr && !is_cacheable;

    // ========================================================================
    // L1 Cache Storage (LUTRAM - Distributed RAM)
    // ========================================================================
    (* ram_style = "distributed" *) logic [127:0] l1_data [L1_SETS-1:0];
    (* ram_style = "distributed" *) logic [L1_TAG_WIDTH-1:0] l1_tag_array [L1_SETS-1:0];
    logic l1_valid [L1_SETS-1:0];

    // ========================================================================
    // L1 Cache Lookup (Combinational - for single-cycle hit)
    // ========================================================================
    wire l1_tag_match = (l1_tag_array[l1_index] == l1_tag);
    wire l1_hit = l1_valid[l1_index] && l1_tag_match && is_cacheable;
    
    // Extract word from cache line
    logic [31:0] l1_hit_data;
    always_comb begin
        case (l1_word)
            2'b00: l1_hit_data = l1_data[l1_index][31:0];
            2'b01: l1_hit_data = l1_data[l1_index][63:32];
            2'b10: l1_hit_data = l1_data[l1_index][95:64];
            2'b11: l1_hit_data = l1_data[l1_index][127:96];
        endcase
    end

    // ========================================================================
    // FSM States
    // ========================================================================
    typedef enum logic [2:0] {
        IDLE,
        REFILL,         // Fetching cache line from memory (4 beats)
        BYPASS_OP,      // Bypass operation (non-cacheable or write miss)
        WRITE_THROUGH   // Phase 2: Write-through (update L1 + write to memory)
    } state_t;
    
    state_t state, next_state;

    // ========================================================================
    // Refill Logic
    // ========================================================================
    logic [1:0] refill_counter;
    logic [127:0] refill_data;

    // Latched request info (for multi-cycle operations)
    logic [31:0] latched_addr;
    logic [31:0] latched_wdata;
    logic        latched_we;
    logic [3:0]  latched_be;
    logic [L1_INDEX_WIDTH-1:0] latched_index;
    logic [L1_TAG_WIDTH-1:0]   latched_tag;
    logic [L1_WORD_OFFSET_WIDTH-1:0] latched_word;
    
    // Refill address - use latched address for multi-cycle safety
    // CRITICAL: Must use latched_addr, not mem_req_addr_i, because CPU may
    // change the address during multi-cycle REFILL operation
    wire [31:0] refill_addr = {latched_addr[31:4], 4'b0000};

    // ========================================================================
    // Magic Address Handling (Simulation Only)
    // ========================================================================
`ifdef SIMU
    wire magic_ack = is_magic_addr && mem_req_valid_i && (state == IDLE);
    
    // Edge detection to print only once per request
    // Track previous magic_ack to detect rising edge
    logic magic_ack_prev;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            magic_ack_prev <= 1'b0;
        else
            magic_ack_prev <= magic_ack && mem_req_we_i;
    end
    
    // Print character only on first cycle of magic write (rising edge)
    always @(posedge clk) begin
        if (magic_ack && mem_req_we_i && !magic_ack_prev) begin
            $write("%c", mem_req_wdata_i[7:0]);
            $fflush();
        end
    end
    
    // Debug disabled for user testing
    // Re-enable by uncommenting the always block below if needed
`else
    wire magic_ack = 1'b0;
`endif

    // ========================================================================
    // FSM State Register
    // ========================================================================
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // ========================================================================
    // Request Latching
    // ========================================================================
    // Latch on:
    // 1. Cache miss (read or write)
    // 2. Write hit (for write-through operation)
    wire need_latch = mem_req_valid_i && !is_magic_addr && 
                      (!l1_hit || (l1_hit && mem_req_we_i));
    
    always_ff @(posedge clk) begin
        if (state == IDLE && need_latch) begin
            latched_addr  <= mem_req_addr_i;
            latched_wdata <= mem_req_wdata_i;
            latched_we    <= mem_req_we_i;
            latched_be    <= mem_req_be_i;
            latched_index <= l1_index;
            latched_tag   <= l1_tag;
            latched_word  <= l1_word;
        end
    end

    // ========================================================================
    // FSM Next State Logic
    // ========================================================================
    always_comb begin
        next_state = state;
        
        case (state)
            IDLE: begin
                if (mem_req_valid_i && !is_magic_addr) begin
                    if (mem_req_we_i) begin
                        // Phase 2: Distinguish write hit vs write miss
                        if (l1_hit) begin
                            // Write hit - update L1 and write-through to memory
                            next_state = WRITE_THROUGH;
                        end else begin
                            // Write miss - only write to memory (no write-allocate)
                            next_state = BYPASS_OP;
                        end
                    end else if (l1_hit) begin
                        // Read hit - stay in IDLE, return data immediately
                        next_state = IDLE;
                    end else if (is_cacheable) begin
                        // Read miss on cacheable address - start refill
                        next_state = REFILL;
                    end else begin
                        // Read from bypass region
                        next_state = BYPASS_OP;
                    end
                end
            end
            
            REFILL: begin
                if (wb_ack_i && refill_counter == 2'b11) begin
                    next_state = IDLE;
                end
            end
            
            BYPASS_OP: begin
                if (wb_ack_i) begin
                    next_state = IDLE;
                end
            end
            
            WRITE_THROUGH: begin
                // Wait for memory write to complete
                if (wb_ack_i) begin
                    next_state = IDLE;
                end
            end
            
            default: next_state = IDLE;
        endcase
    end

    // ========================================================================
    // Refill Counter
    // ========================================================================
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            refill_counter <= 2'b00;
        end else if (state != REFILL) begin
            refill_counter <= 2'b00;
        end else if (state == REFILL && wb_ack_i) begin
            refill_counter <= refill_counter + 2'b01;
        end
    end

    // ========================================================================
    // Refill Data Accumulation
    // ========================================================================
    always_ff @(posedge clk) begin
        if (state == REFILL && wb_ack_i) begin
            case (refill_counter)
                2'b00: refill_data[31:0]   <= wb_dat_i;
                2'b01: refill_data[63:32]  <= wb_dat_i;
                2'b10: refill_data[95:64]  <= wb_dat_i;
                2'b11: refill_data[127:96] <= wb_dat_i;
            endcase
        end
    end

    // ========================================================================
    // L1 Cache Update (on refill complete OR write-through)
    // ========================================================================
    
    // Compute new cache line for write-through (apply byte-enable mask)
    // NOTE: Use LIVE request signals (not latched) for immediate cache update
    logic [127:0] write_through_line;
    logic [31:0]  write_through_word;
    
    always_comb begin
        // Apply byte-enable to create the new word
        // Use l1_hit_data (from current address) and current request data
        write_through_word = l1_hit_data;  // Start with current cache data
        if (mem_req_be_i[0]) write_through_word[7:0]   = mem_req_wdata_i[7:0];
        if (mem_req_be_i[1]) write_through_word[15:8]  = mem_req_wdata_i[15:8];
        if (mem_req_be_i[2]) write_through_word[23:16] = mem_req_wdata_i[23:16];
        if (mem_req_be_i[3]) write_through_word[31:24] = mem_req_wdata_i[31:24];
        
        // Insert the modified word into the cache line
        // Use l1_index (current address), not latched_index
        write_through_line = l1_data[l1_index];
        case (l1_word)
            2'b00: write_through_line[31:0]   = write_through_word;
            2'b01: write_through_line[63:32]  = write_through_word;
            2'b10: write_through_line[95:64]  = write_through_word;
            2'b11: write_through_line[127:96] = write_through_word;
        endcase
    end
    
    integer i;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < L1_SETS; i = i + 1) begin
                l1_valid[i] <= 1'b0;
            end
        end else if (state == REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // Refill complete - write cache line
            l1_data[latched_index] <= {wb_dat_i, refill_data[95:0]};
            l1_tag_array[latched_index] <= latched_tag;
            l1_valid[latched_index] <= 1'b1;
        end else if (state == IDLE && next_state == WRITE_THROUGH) begin
            // Write-through: update L1 cache line immediately
            // Use l1_index (current address), not latched_index
            l1_data[l1_index] <= write_through_line;
            // Tag and valid remain unchanged (already valid and matching)
        end
    end

    // ========================================================================
    // Wishbone Interface
    // ========================================================================
    always_comb begin
        wb_we_o  = 1'b0;
        wb_sel_o = 4'b1111;
        wb_stb_o = 1'b0;
        wb_cyc_o = 1'b0;
        wb_adr_o = 32'h0;
        wb_dat_o = 32'h0;
        
        case (state)
            REFILL: begin
                wb_adr_o = refill_addr + {28'b0, refill_counter, 2'b00};
                wb_we_o  = 1'b0;
                wb_sel_o = 4'b1111;
                wb_stb_o = 1'b1;
                wb_cyc_o = 1'b1;
            end
            
            BYPASS_OP: begin
                wb_adr_o = latched_addr;
                wb_dat_o = latched_wdata;
                wb_we_o  = latched_we;
                wb_sel_o = latched_be;
                wb_stb_o = 1'b1;
                wb_cyc_o = 1'b1;
            end
            
            WRITE_THROUGH: begin
                // Write to memory (same as bypass write)
                wb_adr_o = latched_addr;
                wb_dat_o = latched_wdata;
                wb_we_o  = 1'b1;
                wb_sel_o = latched_be;
                wb_stb_o = 1'b1;
                wb_cyc_o = 1'b1;
            end
            
            default: begin
                // IDLE - no wishbone activity
            end
        endcase
    end

    // ========================================================================
    // Response Data Selection
    // ========================================================================
    // CRITICAL: refill_data has been updated in previous cycles via non-blocking
    // assignment, so it's valid to read. For word 3 on beat 3, use wb_dat_i directly.
    logic [31:0] refill_word;
    always_comb begin
        case (latched_word)
            2'b00: refill_word = refill_data[31:0];     // Word 0 was loaded at beat 0
            2'b01: refill_word = refill_data[63:32];    // Word 1 was loaded at beat 1
            2'b10: refill_word = refill_data[95:64];    // Word 2 was loaded at beat 2
            2'b11: refill_word = wb_dat_i;              // Word 3 is current beat (beat 3)
        endcase
    end

    // ========================================================================
    // Output Mux
    // ========================================================================
    always_comb begin
        mem_resp_data_o = 32'h0;
        mem_req_ready_o = 1'b0;
        
        if (is_magic_addr && mem_req_valid_i && state == IDLE) begin
            // Magic address - immediate ACK
            mem_resp_data_o = 32'h0;
            mem_req_ready_o = 1'b1;
        end else if (state == IDLE && mem_req_valid_i && l1_hit && !mem_req_we_i) begin
            // L1 read hit - immediate response
            mem_resp_data_o = l1_hit_data;
            mem_req_ready_o = 1'b1;
        end else if (state == REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // Refill complete - return requested word
            mem_resp_data_o = refill_word;
            mem_req_ready_o = 1'b1;
        end else if (state == BYPASS_OP && wb_ack_i) begin
            // Bypass operation complete
            mem_resp_data_o = wb_dat_i;
            mem_req_ready_o = 1'b1;
        end else if (state == WRITE_THROUGH && wb_ack_i) begin
            // Write-through complete - acknowledge write
            mem_resp_data_o = 32'h0;  // Write response doesn't need data
            mem_req_ready_o = 1'b1;
        end
    end

endmodule
