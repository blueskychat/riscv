`include "defines.sv"

// =============================================================================
// DCache - Phase 4: Two-Level Cache (L2 Read-Only)
// =============================================================================
// L1: 1KB, Direct-Mapped, LUTRAM, 16-byte lines
// - Read operations: cache enabled
// - Write hit: update L1 data, set dirty=1 (no write to memory yet)
// - Write miss: write-allocate (evict -> L2 lookup -> refill -> write to L1)
// - Eviction: if dirty, writeback to memory (Phase 3 behavior, L2 write in Phase 5)
// 
// L2: 32KB, 4-Way Set-Associative, BRAM, 16-byte lines
// - L1 miss -> L2 lookup (1 cycle BRAM latency)
// - L2 hit -> fill L1, return data
// - L2 miss -> fetch from memory, fill L2 (pseudo-LRU), fill L1
// - Write operations: Bypass L2 for now (Phase 5 will add L1->L2 writeback)
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
    // L2 Cache Parameters (Phase 4)
    // ========================================================================
    // 32KB = 512 sets × 4 ways × 16 bytes/line
    localparam L2_SETS = 512;
    localparam L2_WAYS = 4;
    localparam L2_LINE_SIZE = 16;       // 16 bytes = 4 words
    localparam L2_INDEX_WIDTH = 9;      // log2(512)
    localparam L2_TAG_WIDTH = 19;       // 32 - 9 - 4
    localparam L2_WORD_OFFSET_WIDTH = 2;

    // ========================================================================
    // Address Breakdown
    // ========================================================================
    // L1: [31:10] Tag (22 bits) | [9:4] Index (6 bits) | [3:2] Word (2 bits) | [1:0] Byte (2 bits)
    wire [L1_TAG_WIDTH-1:0]        l1_tag   = mem_req_addr_i[31:10];
    wire [L1_INDEX_WIDTH-1:0]      l1_index = mem_req_addr_i[9:4];
    wire [L1_WORD_OFFSET_WIDTH-1:0] l1_word  = mem_req_addr_i[3:2];
    
    // L2: [31:13] Tag (19 bits) | [12:4] Index (9 bits) | [3:2] Word (2 bits) | [1:0] Byte (2 bits)
    wire [L2_TAG_WIDTH-1:0]        l2_tag   = mem_req_addr_i[31:13];
    wire [L2_INDEX_WIDTH-1:0]      l2_index = mem_req_addr_i[12:4];
    wire [L2_WORD_OFFSET_WIDTH-1:0] l2_word  = mem_req_addr_i[3:2];

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
    logic l1_dirty [L1_SETS-1:0];  // Dirty bits for write-back

    // ========================================================================
    // L2 Cache Storage (BRAM - Block RAM)
    // ========================================================================
    (* ram_style = "block" *) logic [127:0] l2_data [L2_WAYS-1:0][L2_SETS-1:0];
    (* ram_style = "block" *) logic [L2_TAG_WIDTH-1:0] l2_tag_array [L2_WAYS-1:0][L2_SETS-1:0];
    logic l2_valid [L2_WAYS-1:0][L2_SETS-1:0];
    logic [2:0] l2_lru [L2_SETS-1:0];  // 3-bit pseudo-LRU per set

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
    // L2 Cache Lookup Logic (Phase 4)
    // ========================================================================
    // L2 BRAM has 1-cycle read latency. We latch the lookup index/tag and 
    // check against BRAM outputs in next cycle.
    
    logic [L2_INDEX_WIDTH-1:0] l2_lookup_index;
    logic [L2_TAG_WIDTH-1:0]   l2_lookup_tag;
    logic [L2_WORD_OFFSET_WIDTH-1:0] l2_lookup_word;
    
    // BRAM read outputs (registered)
    logic [127:0] l2_data_read [L2_WAYS-1:0];
    logic [L2_TAG_WIDTH-1:0] l2_tag_read [L2_WAYS-1:0];
    logic l2_valid_read [L2_WAYS-1:0];
    
    // L2 hit detection (combinational on registered BRAM outputs)
    logic [L2_WAYS-1:0] l2_way_hit;
    logic l2_hit;
    logic [1:0] l2_hit_way;
    logic [127:0] l2_hit_data;
    
    always_comb begin
        l2_hit = 1'b0;
        l2_hit_way = 2'b00;
        l2_hit_data = 128'h0;
        
        for (int w = 0; w < L2_WAYS; w++) begin
            l2_way_hit[w] = l2_valid_read[w] && (l2_tag_read[w] == l2_lookup_tag);
            if (l2_way_hit[w]) begin
                l2_hit = 1'b1;
                l2_hit_way = w[1:0];
                l2_hit_data = l2_data_read[w];
            end
        end
    end
    
    // ========================================================================
    // Pseudo-LRU Functions (3-bit tree for 4-way)
    // ========================================================================
    // Tree structure:     [2]
    //                    /   \
    //                  [1]   [0]
    //                 /  \   /  \
    //              Way0 Way1 Way2 Way3
    
    function automatic logic [1:0] get_lru_victim(input logic [2:0] lru);
        if (lru[2] == 0) begin  // Go left subtree
            return lru[1] ? 2'b00 : 2'b01;
        end else begin          // Go right subtree
            return lru[0] ? 2'b10 : 2'b11;
        end
    endfunction
    
    function automatic logic [2:0] update_lru(input logic [2:0] old_lru, input logic [1:0] way);
        logic [2:0] new_lru;
        new_lru = old_lru;
        case (way)
            2'b00: begin new_lru[2] = 1'b1; new_lru[1] = 1'b1; end  // Way 0: point away
            2'b01: begin new_lru[2] = 1'b1; new_lru[1] = 1'b0; end  // Way 1: point away
            2'b10: begin new_lru[2] = 1'b0; new_lru[0] = 1'b1; end  // Way 2: point away
            2'b11: begin new_lru[2] = 1'b0; new_lru[0] = 1'b0; end  // Way 3: point away
        endcase
        return new_lru;
    endfunction


    // ========================================================================
    // FSM States
    // ========================================================================
    typedef enum logic [2:0] {
        IDLE,
        REFILL,         // Phase 1-3: Fetching cache line from memory (4 beats)
        BYPASS_OP,      // Bypass operation (non-cacheable)
        WRITEBACK,      // Phase 3: Write dirty L1 line back to memory
        L2_LOOKUP,      // Phase 4: Wait for L2 BRAM read (1 cycle)
        L2_REFILL       // Phase 4: Fetch from memory to fill L2 (4 beats)
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
    
    // Eviction address info
    logic [L1_TAG_WIDTH-1:0] old_tag;
    logic                    is_dirty_eviction;
    
    // Refill address - use latched address for multi-cycle safety
    // CRITICAL: Must use latched_addr, not mem_req_addr_i, because CPU may
    // change the address during multi-cycle REFILL operation
    wire [31:0] refill_addr = {latched_addr[31:4], 4'b0000};
    
    // Writeback address - use old tag and latched index
    wire [31:0] wb_evict_addr = {old_tag, latched_index, 4'b0000};

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
            
            // Capture victim info for potential eviction
            old_tag       <= l1_tag_array[l1_index];
            is_dirty_eviction <= l1_valid[l1_index] && l1_dirty[l1_index];
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
                    if (is_cacheable) begin
                        if (l1_hit) begin
                            if (mem_req_we_i) begin
                                // Write hit: Update L1 immediately (done in IDLE), set dirty
                                // No state change needed, ready_o will be 1
                                next_state = IDLE; 
                            end else begin
                                // Read hit: Return data immediately
                                next_state = IDLE;
                            end
                        end else begin
                            // L1 Miss (Read or Write)
                            // Phase 4: Check for dirty eviction, then go to L2
                            if (l1_valid[l1_index] && l1_dirty[l1_index]) begin
                                next_state = WRITEBACK; // Write back dirty line first
                            end else begin
                                next_state = L2_LOOKUP;  // Clean miss, check L2
                            end
                        end
                    end else begin
                        // Non-cacheable access -> Bypass
                        next_state = BYPASS_OP;
                    end
                end
            end
            
            L2_LOOKUP: begin
                // Wait 1 cycle for L2 BRAM read, then check hit/miss
                if (l2_hit) begin
                    // L2 hit: Fill L1 from L2, complete immediately
                    next_state = IDLE;
                end else begin
                    // L2 miss: Fetch from memory
                    next_state = L2_REFILL;
                end
            end
            
            L2_REFILL: begin
                // Fetching from memory to fill L2 (4 beats)
                if (wb_ack_i && refill_counter == 2'b11) begin
                    // L2 refill complete, also fill L1, return to IDLE
                    next_state = IDLE;
                end
            end
            
            REFILL: begin
                // Phase 3 legacy path (direct L1 refill from memory)
                // This is still used for some scen arios
                if (wb_ack_i && refill_counter == 2'b11) begin
                    next_state = IDLE;
                end
            end
            
            BYPASS_OP: begin
                if (wb_ack_i) begin
                    next_state = IDLE;
                end
            end
            
            WRITEBACK: begin
                if (wb_ack_i && refill_counter == 2'b11) begin
                    // Writeback done, now check L2
                    next_state = L2_LOOKUP;
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
        end else if (state != REFILL && state != WRITEBACK && state != L2_REFILL) begin
            refill_counter <= 2'b00;
        end else if ((state == REFILL || state == WRITEBACK || state == L2_REFILL) && wb_ack_i) begin
            refill_counter <= refill_counter + 2'b01;
        end
    end

    // ========================================================================
    // Refill Data Accumulation
    // ========================================================================
    always_ff @(posedge clk) begin
        if ((state == REFILL || state == L2_REFILL) && wb_ack_i) begin
            case (refill_counter)
                2'b00: refill_data[31:0]   <= wb_dat_i;
                2'b01: refill_data[63:32]  <= wb_dat_i;
                2'b10: refill_data[95:64]  <= wb_dat_i;
                2'b11: refill_data[127:96] <= wb_dat_i;
            endcase
        end
    end
    
    // ========================================================================
    // L2 BRAM Read Logic (Phase 4)
    // ========================================================================
    // When entering L2_LOOKUP state, we latch the lookup parameters and
    // read from all 4 ways. Results are available next cycle for hit detection.
    
    always_ff @(posedge clk) begin
        if (state == IDLE && next_state == L2_LOOKUP) begin
            // Latch lookup parameters when starting L2 lookup
            l2_lookup_index <= l2_index;
            l2_lookup_tag   <= l2_tag;
            l2_lookup_word  <= l2_word;
        end
    end
    
    // BRAM read: synchronous read
    always_ff @(posedge clk) begin
        if (state == IDLE && next_state == L2_LOOKUP) begin
            // Read all 4 ways at the target index
            for (int w = 0; w < L2_WAYS; w++) begin
                l2_data_read[w]  <= l2_data[w][l2_index];
                l2_tag_read[w]   <= l2_tag_array[w][l2_index];
                l2_valid_read[w] <= l2_valid[w][l2_index];
            end
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
    
    // Refill data with write-allocate merge
    logic [127:0] refill_line_merged;
    logic [31:0]  refill_word_merged;
    logic [127:0] refill_line_full;  // Complete refill line
    
    always_comb begin
        // First, construct the COMPLETE refill line (including last beat)
        refill_line_full = {wb_dat_i, refill_data[95:0]};
        
        // Extract the target word from the complete line
        case (latched_word)
            2'b00: refill_word_merged = refill_line_full[31:0];
            2'b01: refill_word_merged = refill_line_full[63:32];
            2'b10: refill_word_merged = refill_line_full[95:64];
            2'b11: refill_word_merged = refill_line_full[127:96];
        endcase
        
        // Apply byte-enable mask for write-allocate
        if (latched_we) begin
             if (latched_be[0]) refill_word_merged[7:0]   = latched_wdata[7:0];
             if (latched_be[1]) refill_word_merged[15:8]  = latched_wdata[15:8];
             if (latched_be[2]) refill_word_merged[23:16] = latched_wdata[23:16];
             if (latched_be[3]) refill_word_merged[31:24] = latched_wdata[31:24];
        end
        
        // Construct the final merged line
        refill_line_merged = refill_line_full;
        if (latched_we) begin
             case (latched_word)
                 2'b00: refill_line_merged[31:0]   = refill_word_merged;
                 2'b01: refill_line_merged[63:32]  = refill_word_merged;
                 2'b10: refill_line_merged[95:64]  = refill_word_merged;
                 2'b11: refill_line_merged[127:96] = refill_word_merged;
             endcase
        end
    end
    
    
    integer i, j;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < L1_SETS; i = i + 1) begin
                l1_valid[i] <= 1'b0;
                l1_dirty[i] <= 1'b0;
            end
        end else if (state == L2_LOOKUP && l2_hit) begin
            // L2 Hit: Fill L1 from L2
            l1_data[latched_index]      <= l2_hit_data;
            l1_tag_array[latched_index] <= latched_tag;
            l1_valid[latched_index]     <= 1'b1;
            l1_dirty[latched_index]     <= 1'b0;  // Clean from L2
            
        end else if (state == L2_REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // L2 Refill complete - Fill L1 from refilled data
            // Also handle write-allocate if needed
            if (latched_we) begin
                l1_data[latched_index]  <= refill_line_merged;
                l1_dirty[latched_index] <= 1'b1;  // Dirty because we modified it
            end else begin
                l1_data[latched_index]  <= {wb_dat_i, refill_data[95:0]};
                l1_dirty[latched_index] <= 1'b0;  // Clean (fresh from memory)
            end
            l1_tag_array[latched_index] <= latched_tag;
            l1_valid[latched_index]     <= 1'b1;
            
        end else if (state == REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // Legacy REFILL path (Phase 3 compatibility)
            // Refill complete - write cache line
            // If Write-Allocate (latched_we=1), we write the MERGED line and set DIRTY
            if (latched_we) begin
                l1_data[latched_index]  <= refill_line_merged;
                l1_dirty[latched_index] <= 1'b1;  // Dirty because we modified it
            end else begin
                l1_data[latched_index]  <= {wb_dat_i, refill_data[95:0]};
                l1_dirty[latched_index] <= 1'b0;  // Clean (fresh from memory)
            end
            l1_tag_array[latched_index] <= latched_tag;
            l1_valid[latched_index]     <= 1'b1;
            
        end else if (state == IDLE && mem_req_valid_i && l1_hit && mem_req_we_i) begin
            // Write Hit: update L1 cache line immediately
            l1_data[l1_index] <= write_through_line;
            l1_dirty[l1_index] <= 1'b1; // Mark as dirty
        end
    end
    
    // ========================================================================
    // L2 Cache Update Logic (Phase 4)
    // ========================================================================
    // L2 is updated on L2_REFILL completion (memory fetch)
    // L2 is also updated on L2 hit (LRU update)
    
    logic [1:0] l2_victim_way;
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < L2_SETS; i = i + 1) begin
                l2_lru[i] <= 3'b000;
                for (j = 0; j < L2_WAYS; j = j + 1) begin
                    l2_valid[j][i] <= 1'b0;
                end
            end
        end else if (state == L2_LOOKUP && l2_hit) begin
            // L2 Hit: Update LRU
            l2_lru[l2_lookup_index] <= update_lru(l2_lru[l2_lookup_index], l2_hit_way);
            
        end else if (state == L2_REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // L2 Refill complete: Write new line to L2
            l2_victim_way = get_lru_victim(l2_lru[l2_lookup_index]);
            
            // Fill the victim way
            l2_data[l2_victim_way][l2_lookup_index]      <= {wb_dat_i, refill_data[95:0]};
            l2_tag_array[l2_victim_way][l2_lookup_index] <= l2_lookup_tag;
            l2_valid[l2_victim_way][l2_lookup_index]     <= 1'b1;
            
            // Update LRU
            l2_lru[l2_lookup_index] <= update_lru(l2_lru[l2_lookup_index], l2_victim_way);
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
           
            L2_REFILL: begin
                // Fetch from memory to fill L2 (Phase 4)
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
            
            WRITEBACK: begin
                // Write dirty line back to memory
                wb_adr_o = wb_evict_addr + {28'b0, refill_counter, 2'b00};
                wb_we_o  = 1'b1;
                wb_sel_o = 4'b1111;
                wb_stb_o = 1'b1;
                wb_cyc_o = 1'b1;
                
                // Select word to write
                case (refill_counter)
                    2'b00: wb_dat_o = l1_data[latched_index][31:0];
                    2'b01: wb_dat_o = l1_data[latched_index][63:32];
                    2'b10: wb_dat_o = l1_data[latched_index][95:64];
                    2'b11: wb_dat_o = l1_data[latched_index][127:96];
                endcase
            end
            
            default: begin
                // IDLE + L2_LOOKUP - no wishbone activity
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
        end else if (state == IDLE && mem_req_valid_i && l1_hit && mem_req_we_i) begin
            // Write hit - immediate completion (L1 updated in FF)
            mem_resp_data_o = 32'h0;
            mem_req_ready_o = 1'b1;
        end else if (state == L2_LOOKUP && l2_hit) begin
            // L2 hit - return requested word from L2
            logic [31:0] l2_hit_word;
            case (l2_lookup_word)
                2'b00: l2_hit_word = l2_hit_data[31:0];
                2'b01: l2_hit_word = l2_hit_data[63:32];
                2'b10: l2_hit_word = l2_hit_data[95:64];
                2'b11: l2_hit_word = l2_hit_data[127:96];
            endcase
            mem_resp_data_o = l2_hit_word;
            mem_req_ready_o = 1'b1;
        end else if (state == L2_REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // L2 Refill complete - return requested word
            mem_resp_data_o = refill_word;
            mem_req_ready_o = 1'b1;
        end else if (state == REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // Legacy REFILL complete - return requested word
            mem_resp_data_o = refill_word;
            mem_req_ready_o = 1'b1;
        end else if (state == BYPASS_OP && wb_ack_i) begin
            // Bypass operation complete
            mem_resp_data_o = wb_dat_i;
            mem_req_ready_o = 1'b1;
        end
    end

endmodule
