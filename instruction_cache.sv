
module instruction_cache #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter CACHE_SIZE = 4096, // 4KB
    parameter LINE_SIZE  = 16    // 16 Bytes (4 Words)
) (
    input  wire clk,
    input  wire rst,

    // CPU Interface (Optimized for 1-cycle fetch)
    input  wire [ADDR_WIDTH-1:0] cpu_req_addr, // Should be next_pc
    output reg  [DATA_WIDTH-1:0] cpu_data,
    output reg                   cpu_hit,
    
    // Stall signal to CPU (when miss)
    output reg                   cache_stall,

    // Wishbone Master Interface (for Refill)
    output reg                   wb_cyc,
    output reg                   wb_stb,
    output reg                   wb_we,
    output reg  [ADDR_WIDTH-1:0] wb_adr,
    output reg  [DATA_WIDTH-1:0] wb_dat_o,
    output reg  [3:0]            wb_sel_o,
    input  wire [DATA_WIDTH-1:0] wb_dat_i,
    input  wire                  wb_ack
);

    // Calculate parameters
    localparam NUM_LINES = CACHE_SIZE / LINE_SIZE;
    localparam LINE_WIDTH = $clog2(LINE_SIZE);
    localparam INDEX_WIDTH = $clog2(NUM_LINES);
    localparam TAG_WIDTH = ADDR_WIDTH - INDEX_WIDTH - LINE_WIDTH;

    // 由于是同步读写，tag_ram和data_ram都会自动使用BRAM
    // Cache Storage
    // Tag RAM: Stores Tag + Valid Bit 
    reg [TAG_WIDTH:0] tag_ram [0:NUM_LINES-1]; // Bit 0 is valid, [TAG_WIDTH:1] is tag
    // Data RAM: Stores Data
    // We organize it as 4 words per line for easier indexing
    // Size = CACHE_SIZE / 4 words
    // 但定义存储时并没有分行
    reg [31:0] data_ram [0:(CACHE_SIZE/4)-1];

    // Signals
    logic [INDEX_WIDTH-1:0] req_index;
    logic [TAG_WIDTH-1:0]   req_tag;
    logic [LINE_WIDTH-1:2]  req_offset; // Word offset

    assign req_index  = cpu_req_addr[INDEX_WIDTH+LINE_WIDTH-1 : LINE_WIDTH];
    assign req_tag    = cpu_req_addr[ADDR_WIDTH-1 : ADDR_WIDTH-TAG_WIDTH];
    assign req_offset = cpu_req_addr[LINE_WIDTH-1 : 2];

    // Pipeline Registers (for BRAM output)
    logic [TAG_WIDTH:0]     r_tag_entry;
    logic [31:0]            r_data;
    logic [TAG_WIDTH-1:0]   r_req_tag;
    logic                   r_valid;
    
    // BRAM Read (Synchronous)
    always @(posedge clk) begin
        // We read the specific word based on offset
        // Note: This assumes cpu_req_addr is the NEXT PC.
        // So at posedge, we latch the address and start reading.
        // The data will be available in the NEXT cycle (which is the current PC cycle).
        r_data <= data_ram[{req_index, req_offset}];
        r_tag_entry <= tag_ram[req_index];
        r_req_tag <= req_tag; // Pass tag through pipeline to compare
    end

    // Hit Detection (Combinational, based on latched data)
    wire tag_match = (r_tag_entry[TAG_WIDTH:1] == r_req_tag);
    wire line_valid = r_tag_entry[0];
    
    assign cpu_hit = tag_match && line_valid;
    assign cpu_data = r_data;

    // Stall Logic (Combinational)
    // Stall if not hit, OR if we are refilling.
    // This ensures we stall IMMEDIATELY in the cycle of the miss.
    assign cache_stall = !cpu_hit || (state != IDLE);

    // FSM for Refill
    typedef enum logic [2:0] {
        RESET,
        IDLE,
        REFILL_REQ,
        REFILL_WAIT,
        REFILL_WRITE,
        REFILL_DONE
    } state_t;
    state_t state;

    logic [1:0] refill_count; // 0 to 3
    logic [ADDR_WIDTH-1:0] refill_addr;
    logic [INDEX_WIDTH-1:0] reset_index;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RESET;
            reset_index <= '0;
            wb_cyc <= 1'b0;
            wb_stb <= 1'b0;
            wb_we <= 1'b0;
        end else begin
            case (state)
                RESET: begin
                    tag_ram[reset_index] <= '0;
                    reset_index <= reset_index + 1;
                    if (reset_index == {INDEX_WIDTH{1'b1}}) begin
                        state <= IDLE;
                    end
                end

                IDLE: begin
                    if (!cpu_hit) begin
                        // Miss! Start Refill
                        state <= REFILL_REQ;
                        // Align address to line boundary
                        refill_addr <= {cpu_req_addr[ADDR_WIDTH-1:LINE_WIDTH], {LINE_WIDTH{1'b0}}};
                        refill_count <= 0;
                    end
                end

                REFILL_REQ: begin
                    wb_cyc <= 1'b1;
                    wb_stb <= 1'b1;
                    wb_we <= 1'b0;
                    wb_adr <= refill_addr + (refill_count << 2);
                    wb_sel_o <= 4'b1111; // Full word
                    state <= REFILL_WAIT;
                end

                REFILL_WAIT: begin
                    if (wb_ack) begin
                        // Got data
                        wb_cyc <= 1'b0;
                        wb_stb <= 1'b0;
                        
                        // Write to Data RAM
                        // Note: In Verilog, we can write to array directly
                        data_ram[{refill_addr[INDEX_WIDTH+LINE_WIDTH-1 : LINE_WIDTH], refill_count}] <= wb_dat_i;
                        
                        if (refill_count == 3) begin
                            // Done filling line
                            state <= REFILL_WRITE;
                        end else begin
                            refill_count <= refill_count + 1;
                            state <= REFILL_REQ; // Next word
                        end
                    end
                end

                REFILL_WRITE: begin
                    // Update Tag RAM 
                    // data_ram的write前面已经完成了
                    tag_ram[refill_addr[INDEX_WIDTH+LINE_WIDTH-1 : LINE_WIDTH]] <= {refill_addr[ADDR_WIDTH-1 : ADDR_WIDTH-TAG_WIDTH], 1'b1};
                    // Done
                    state <= REFILL_DONE;
                end

                REFILL_DONE: begin
                    // Wait one cycle for Tag RAM to output new data
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
