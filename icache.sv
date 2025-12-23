// icache.sv - BRAM-based Instruction Cache
// 32KB, 4-way set-associative, 16-byte cache lines
module icache (
    input  wire logic        clk,
    input  wire logic        rst,
    
    // CPU Interface
    input  wire logic [31:0] pc_i,          // PC address from IF stage
    input  wire logic        fetch_en_i,    // Fetch enable,  =!rst  Always request if not in reset
    input  wire logic        invalidate_i,  // FENCE.I: Invalidate all cache entries
    output logic [31:0]      inst_o,        // Instruction output
    output logic             ready_o,       // Data ready (cache hit or refill complete)
    
    // Wishbone Master Interface (for cache misses)
    output logic [31:0] wb_adr_o,
    output logic [31:0] wb_dat_o,
    input  wire  [31:0] wb_dat_i,
    output logic        wb_we_o,
    output logic [3:0]  wb_sel_o,
    output logic        wb_stb_o,
    input  wire         wb_ack_i,
    output logic        wb_cyc_o,
    input  wire         wb_rty_i,
    input  wire         wb_err_i
);

    // Cache parameters  4*512*16=32KB (or 4*256*16=16KB if SETS=256)
    // data_bram和tag_bram综合的结果是共占用了10个BRAM
    localparam WAYS = 4;
    localparam SETS = 256;//512;              // <-- 只需修改这里：512 -> 256
    localparam LINE_SIZE = 16;          // 16 bytes = 4 words
    localparam WORDS_PER_LINE = 4;
    
    localparam INDEX_WIDTH = $clog2(SETS);              // 自动计算：log2(SETS)
    localparam OFFSET_WIDTH = $clog2(LINE_SIZE);        // log2(16) = 4
    localparam TAG_WIDTH = 32 - INDEX_WIDTH - OFFSET_WIDTH;  // 自动计算
    localparam WORD_OFFSET_WIDTH = $clog2(WORDS_PER_LINE);   // log2(4) = 2

    // L0 Cache Parameters (1KB = 64 sets * 16 bytes)
    localparam L0_SETS = 64;
    localparam L0_INDEX_WIDTH = $clog2(L0_SETS);        // log2(64) = 6
    localparam L0_TAG_WIDTH = 32 - OFFSET_WIDTH - L0_INDEX_WIDTH;
    
    // Address breakdown (combinational from current PC)
    logic [TAG_WIDTH-1:0]        tag;
    logic [INDEX_WIDTH-1:0]      index;
    logic [WORD_OFFSET_WIDTH-1:0] word_offset;
    
    // 使用参数化的位选择
    assign tag = pc_i[31 : INDEX_WIDTH + OFFSET_WIDTH];
    assign index = pc_i[INDEX_WIDTH + OFFSET_WIDTH - 1 : OFFSET_WIDTH];
    assign word_offset = pc_i[OFFSET_WIDTH - 1 : 2];
    
    // Cache storage - BRAM arrays
    // Data BRAM: 4 ways × 256 sets × 128 bits (4 words)
    // 不可以用多维数组，否则综合后不是BRAM
    (* ram_style = "block" *) logic [127:0] data_bram_way0 [SETS-1:0];
    (* ram_style = "block" *) logic [127:0] data_bram_way1 [SETS-1:0];
    (* ram_style = "block" *) logic [127:0] data_bram_way2 [SETS-1:0];
    (* ram_style = "block" *) logic [127:0] data_bram_way3 [SETS-1:0];
    
    // Tag storage (20-bit tag only) - BRAM
    (* ram_style = "block" *) logic [TAG_WIDTH-1:0] tag_bram_way0 [SETS-1:0];
    (* ram_style = "block" *) logic [TAG_WIDTH-1:0] tag_bram_way1 [SETS-1:0];
    (* ram_style = "block" *) logic [TAG_WIDTH-1:0] tag_bram_way2 [SETS-1:0];
    (* ram_style = "block" *) logic [TAG_WIDTH-1:0] tag_bram_way3 [SETS-1:0];

    // Metadata storage (Valid + LRU) - Distributed RAM / Registers
    logic valid_array [WAYS-1:0][SETS-1:0];
    logic [1:0] lru_array [WAYS-1:0][SETS-1:0];
    
    // FSM states
    typedef enum logic [1:0] {
        IDLE,
        COMPARE,
        REFILL
    } state_t;
    
    state_t state, next_state;
    
    // Cache lookup signals
    logic [WAYS-1:0] way_hit;
    logic            cache_hit;
    logic [1:0]      hit_way;
    logic [127:0]    hit_data;
    
    // Refill signals
    logic [1:0]      refill_counter;
    logic [1:0]      victim_way;
    logic [127:0]    refill_data;
    logic [31:0]     refill_addr;
    
    assign refill_addr = {pc_i[31:4], 4'b0000};
    
    // Read data from BRAMs (registered)
    logic [127:0] data_read [WAYS-1:0];
    logic [TAG_WIDTH-1:0] tag_read [WAYS-1:0];
    logic valid_read [WAYS-1:0];
    logic [1:0] lru_read [WAYS-1:0];
    
    // L0 Cache (Distributed RAM)
    (* ram_style = "distributed" *) logic [127:0] l0_data [L0_SETS-1:0];
    (* ram_style = "distributed" *) logic [L0_TAG_WIDTH-1:0] l0_tag [L0_SETS-1:0];
    logic l0_valid [L0_SETS-1:0];

    logic [L0_INDEX_WIDTH-1:0] l0_index;
    logic [L0_TAG_WIDTH-1:0] l0_tag_req;
    logic l0_hit;
    logic [127:0] l0_hit_data;

    assign l0_index = pc_i[L0_INDEX_WIDTH + OFFSET_WIDTH - 1 : OFFSET_WIDTH];
    assign l0_tag_req = pc_i[31 : L0_INDEX_WIDTH + OFFSET_WIDTH];

    // L0 Hit Detection (Combinational)
    always_comb begin
        l0_hit = l0_valid[l0_index] && (l0_tag[l0_index] == l0_tag_req);
        l0_hit_data = l0_data[l0_index];
    end

    // Logic to detect start of a new fetch
    logic start_new_fetch;
    // Only start a new fetch from IDLE if we don't have a L0 hit.
    assign start_new_fetch = fetch_en_i && (state == IDLE) && !l0_hit;


    
    // BRAM read logic
    // If starting a new fetch, read from the NEW index (current PC).
    // Otherwise, keep reading from the LATCHED index (for ongoing operations).
    always_ff @(posedge clk) begin
        if (start_new_fetch) begin
            data_read[0] <= data_bram_way0[index];
            data_read[1] <= data_bram_way1[index];
            data_read[2] <= data_bram_way2[index];
            data_read[3] <= data_bram_way3[index];
            
            tag_read[0] <= tag_bram_way0[index];
            tag_read[1] <= tag_bram_way1[index];
            tag_read[2] <= tag_bram_way2[index];
            tag_read[3] <= tag_bram_way3[index];

            valid_read[0] <= valid_array[0][index];
            valid_read[1] <= valid_array[1][index];
            valid_read[2] <= valid_array[2][index];
            valid_read[3] <= valid_array[3][index];

            lru_read[0] <= lru_array[0][index];
            lru_read[1] <= lru_array[1][index];
            lru_read[2] <= lru_array[2][index];
            lru_read[3] <= lru_array[3][index];
        end
        // Else: Hold previous values (implicit)
        // We don't need to read from latched_index because if we are not starting a new fetch,
        // we are either:
        // 1. In IDLE with a Buffer Hit (data comes from line_buffer_data combinatorially)
        // 2. In COMPARE/REFILL (data_read holds the values from the initial fetch)
    end
    

    
    // Cache hit detection
    integer j;
    always_comb begin
        for (j = 0; j < WAYS; j = j + 1) begin
            way_hit[j] = valid_read[j] && (tag_read[j] == tag);
        end
        cache_hit = |way_hit;
    end
    
    // Hit way encoder
    integer k;
    always_comb begin
        hit_way = 2'b00;
        for (k = 0; k < WAYS; k = k + 1) begin
            if (way_hit[k]) hit_way = k[1:0];
        end
    end
    
    // Select hit data
    always_comb begin
        hit_data = data_read[hit_way];
    end
    
    // Extract word from cache line
    logic [31:0] selected_word;
    always_comb begin
        if (state == IDLE && l0_hit) begin
            // Fast path: Read from L0 Cache
            case (word_offset) // Use current PC offset
                2'b00: selected_word = l0_hit_data[31:0];
                2'b01: selected_word = l0_hit_data[63:32];
                2'b10: selected_word = l0_hit_data[95:64];
                2'b11: selected_word = l0_hit_data[127:96];
            endcase
        end else begin
            // Slow path: Read from BRAM output
            case (word_offset)
                2'b00: selected_word = hit_data[31:0];
                2'b01: selected_word = hit_data[63:32];
                2'b10: selected_word = hit_data[95:64];
                2'b11: selected_word = hit_data[127:96];
            endcase
        end
    end
    
    // Victim selection (simple LRU)
    logic [1:0] min_lru;
    integer m;
    always_comb begin
        victim_way = 2'b00;
        min_lru = lru_read[0];
        
        for (m = 1; m < WAYS; m = m + 1) begin
            if (lru_read[m] < min_lru) begin
                min_lru = lru_read[m];
                victim_way = m[1:0];
            end
        end
    end
    
    // FSM state transition
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end
    
    // FSM next state logic
    always_comb begin
        next_state = state;
        case (state)
            IDLE: begin
                if (fetch_en_i && !l0_hit) next_state = COMPARE;
            end
            
            COMPARE: begin
                if (cache_hit) begin
                    // Hit! Data is ready. Go back to IDLE for next fetch.
                    next_state = IDLE;
                end else begin
                    next_state = REFILL;
                end
            end
            
            REFILL: begin
                if (wb_ack_i) begin
                    if (refill_counter == 2'b11) begin
                        // After refill completes, go to IDLE to allow BRAM write to complete.
                        next_state = IDLE;
                    end
                end
            end
            
            default: begin
                next_state = IDLE;
            end
        endcase
    end
    
    // Refill counter
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            refill_counter <= 2'b00;
        end else begin
            if (state != REFILL) begin
                refill_counter <= 2'b00;
            end else if (state == REFILL && wb_ack_i) begin
                refill_counter <= refill_counter + 2'b01;
            end
        end
    end
    
    // Refill data accumulation
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
    
    // BRAM write (cache refill)
    always_ff @(posedge clk) begin
        if (state == REFILL && wb_ack_i && refill_counter == 2'b11) begin
            // Write complete cache line to victim way.
            case (victim_way)
                2'b00: begin
                    data_bram_way0[index] <= {wb_dat_i, refill_data[95:0]};
                    tag_bram_way0[index] <= tag;
                end
                2'b01: begin
                    data_bram_way1[index] <= {wb_dat_i, refill_data[95:0]};
                    tag_bram_way1[index] <= tag;
                end
                2'b10: begin
                    data_bram_way2[index] <= {wb_dat_i, refill_data[95:0]};
                    tag_bram_way2[index] <= tag;
                end
                2'b11: begin
                    data_bram_way3[index] <= {wb_dat_i, refill_data[95:0]};
                    tag_bram_way3[index] <= tag;
                end
            endcase
        end
    end
    
    // Update LRU on cache hit

    
    // Wishbone interface
    always_comb begin
        wb_adr_o = refill_addr + {30'b0, refill_counter, 2'b00};
        wb_dat_o = 32'h0;
        wb_we_o = 1'b0;
        wb_sel_o = 4'b1111;
        wb_stb_o = (state == REFILL);
        wb_cyc_o = (state == REFILL);
    end
    
    // Output signals
    always_comb begin
        inst_o = selected_word;
        // Ready when:
        // 1. L0 Hit in IDLE (0 cycle latency)
        // 2. Cache Hit in COMPARE (1 cycle latency)
        ready_o = (state == IDLE && l0_hit) || (state == COMPARE && cache_hit);
    end
    
    // Initialize cache on reset
    // Unified Metadata Update (Reset + Refill + LRU Update)
    // Initialize cache on reset
    // Unified Metadata Update (Reset + Refill + LRU Update)
    integer w, s;
    integer i;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < L0_SETS; i = i + 1) begin
                l0_valid[i] <= 1'b0;
            end
            for (w = 0; w < WAYS; w = w + 1) begin
                for (s = 0; s < SETS; s = s + 1) begin
                    valid_array[w][s] <= 1'b0;
                    lru_array[w][s] <= 2'b00;
                end
            end
        end else if (invalidate_i) begin
            // FENCE.I: Invalidate all cache entries (L0 + L1)
            for (i = 0; i < L0_SETS; i = i + 1) begin
                l0_valid[i] <= 1'b0;
            end
            for (w = 0; w < WAYS; w = w + 1) begin
                for (s = 0; s < SETS; s = s + 1) begin
                    valid_array[w][s] <= 1'b0;
                end
            end
        end else begin
            // Refill Update
            if (state == REFILL && wb_ack_i && refill_counter == 2'b11) begin
                for (w = 0; w < WAYS; w = w + 1) begin
                    if (victim_way == w[1:0]) begin
                        valid_array[w][index] <= 1'b1;
                        lru_array[w][index] <= 2'b11;
                    end
                end
                // Update L0 on Refill
                l0_data[l0_index] <= {wb_dat_i, refill_data[95:0]};
                l0_tag[l0_index] <= l0_tag_req;
                l0_valid[l0_index] <= 1'b1;
            end 
            // LRU Update on Hit
            else if (state == COMPARE && cache_hit) begin
                for (w = 0; w < WAYS; w = w + 1) begin
                    if (w[1:0] == hit_way) begin
                        if (lru_read[w] != 2'b11) lru_array[w][index] <= lru_read[w] + 2'b01;
                    end else begin
                        if (lru_read[w] != 2'b00) lru_array[w][index] <= lru_read[w] - 2'b01;
                    end
                end
                // Update L0 on L1 Cache Hit
                l0_data[l0_index] <= hit_data;
                l0_tag[l0_index] <= l0_tag_req;
                l0_valid[l0_index] <= 1'b1;
            end
        end
    end

endmodule
