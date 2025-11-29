`include "defines.sv"

module icache (
    input  wire logic        clk,
    input  wire logic        rst,
    
    // CPU Interface
    input  wire logic [31:0] cpu_req_addr,
    input  wire logic        cpu_req_valid,
    output logic [31:0]      cpu_inst,
    output logic             cpu_ready,
    
    // Wishbone Master Interface (for refill)
    output logic [31:0]      wb_adr_o,
    output logic [31:0]      wb_dat_o,
    input  wire  [31:0]      wb_dat_i,
    output logic             wb_we_o,
    output logic [3:0]       wb_sel_o,
    output logic             wb_stb_o,
    input  wire              wb_ack_i,
    output logic             wb_cyc_o,
    input  wire              wb_rty_i,
    input  wire              wb_err_i
);

    // Cache Parameters
    localparam CACHE_SIZE_BYTES = 4096; // 4KB
    localparam LINE_SIZE_BYTES  = 16;   // 16 Bytes (4 words)
    localparam NUM_LINES        = CACHE_SIZE_BYTES / LINE_SIZE_BYTES; // 256 lines
    
    localparam INDEX_WIDTH      = $clog2(NUM_LINES); // 8 bits
    localparam OFFSET_WIDTH     = $clog2(LINE_SIZE_BYTES); // 4 bits
    localparam TAG_WIDTH        = 32 - INDEX_WIDTH - OFFSET_WIDTH; // 20 bits
    
    // Address Decomposition
    // [31:12] Tag | [11:4] Index | [3:0] Offset
    
    logic [INDEX_WIDTH-1:0]  index;
    logic [TAG_WIDTH-1:0]    tag;
    logic [OFFSET_WIDTH-1:0] offset;
    
    assign index  = cpu_req_addr[INDEX_WIDTH+OFFSET_WIDTH-1 : OFFSET_WIDTH];
    assign tag    = cpu_req_addr[31 : INDEX_WIDTH+OFFSET_WIDTH];
    assign offset = cpu_req_addr[OFFSET_WIDTH-1 : 0];

    // Tag RAM: Stores Tag + Valid Bit
    // Width: TAG_WIDTH + 1 (Valid)
    logic [TAG_WIDTH:0] tag_ram [0:NUM_LINES-1];
    
    // Data RAM: Stores Instructions
    // We organize it as 4 banks of 32-bit words to easily support line refills and word access
    // Or simpler: One large 32-bit wide RAM. 
    // Since we need to read one word at a time for CPU, and write one word at a time from WB (usually),
    // let's use a simple [31:0] ram [0:1023].
    // Depth = NUM_LINES * (LINE_SIZE_BYTES / 4) = 256 * 4 = 1024
    logic [31:0] data_ram [0:NUM_LINES*4-1];

    // Internal Signals
    logic [TAG_WIDTH:0] read_tag_entry;
    logic [31:0]        read_data;
    logic [TAG_WIDTH-1:0] read_tag;
    logic               read_valid;
    logic               cache_hit;
    
    // State Machine
    typedef enum logic [1:0] {
        READ,    // Wait for RAM read
        COMPARE, // Check Hit/Miss
        REFILL
    } state_t;
    
    state_t state, next_state;
    
    // Refill Counter
    logic [1:0] refill_count; // 0..3 for 4 words
    
    // Data Address
    logic [INDEX_WIDTH+2-1:0] data_addr;
    assign data_addr = {index, cpu_req_addr[3:2]};

    // Synchronous RAM Read (Infers BRAM)
    always_ff @(posedge clk) begin
        read_tag_entry <= tag_ram[index];
        read_data      <= data_ram[data_addr];
    end
    
    assign read_valid = read_tag_entry[TAG_WIDTH];
    assign read_tag   = read_tag_entry[TAG_WIDTH-1:0];
    
    // Hit Detection (Valid in COMPARE state)
    // Note: We compare the READ tag with the CURRENT tag.
    // Since pipeline is stalled during READ, cpu_req_addr is stable.
    assign cache_hit = (read_valid && (read_tag == tag));
    
    assign cpu_inst = read_data;
    
    // FSM
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= READ;
            refill_count <= 0;
            for (int i=0; i<NUM_LINES; i++) tag_ram[i] <= '0; 
        end else begin
            state <= next_state;
            
            if (state == REFILL && wb_ack_i) begin
                refill_count <= refill_count + 1;
                // Write to Data RAM
                data_ram[{index, refill_count}] <= wb_dat_i;
                
                // On last word, update Tag RAM
                if (refill_count == 3) begin
                    tag_ram[index] <= {1'b1, tag};
                end
            end else if (state != REFILL) begin
                refill_count <= 0;
            end
        end
    end
    
    always_comb begin
        next_state = state;
        cpu_ready  = 1'b0;
        
        // Wishbone Defaults
        wb_stb_o = 1'b0;
        wb_cyc_o = 1'b0;
        wb_we_o  = 1'b0;
        wb_adr_o = '0;
        wb_dat_o = '0;
        wb_sel_o = 4'b1111;
        
        case (state)
            READ: begin
                // Wait for RAM read
                if (cpu_req_valid) begin
                    next_state = COMPARE;
                end
            end

            COMPARE: begin
                if (cpu_req_valid) begin
                    if (cache_hit) begin
                        cpu_ready = 1'b1;
                        // If pipeline accepts (which it should if we assert ready),
                        // we move back to READ for the next PC.
                        next_state = READ;
                    end else begin
                        next_state = REFILL;
                    end
                end else begin
                    // Request cancelled? Go back to READ
                    next_state = READ;
                end
            end
            
            REFILL: begin
                // Perform Wishbone Burst/Sequential Read
                wb_cyc_o = 1'b1;
                wb_stb_o = 1'b1;
                // Address: Base of the line + refill_count * 4
                // Base of line: {tag, index, 4'b0000}
                wb_adr_o = {tag, index, refill_count, 2'b00};
                
                if (wb_ack_i) begin
                    if (refill_count == 3) begin
                        next_state = READ; // Go back to READ to fetch the new instruction
                    end
                end
            end
            
            default: next_state = READ;
        endcase
    end

endmodule
