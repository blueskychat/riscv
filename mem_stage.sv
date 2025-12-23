`include "defines.sv"
`include "pipeline_regs.sv"

// mem_stage.sv - 访存级
// Phase 1 重构: DCache 抽取到 Top 层，此模块只输出 DCache CPU 接口
module mem_stage (
    input  wire logic        clk,
    input  wire logic        rst,
    input  wire logic        stall,
    input  wire logic        flush,
    
    input  ex_mem_reg_t ex_mem_reg,
    output mem_wb_reg_t mem_wb_next,
    
    // DCache CPU Interface (连接到外部 DCache)
    output logic [31:0] dcache_addr_o,
    output logic [31:0] dcache_wdata_o,
    output logic        dcache_we_o,
    output logic [3:0]  dcache_be_o,
    output logic        dcache_valid_o,
    input  wire  [31:0] dcache_rdata_i,
    input  wire         dcache_ready_i,
    
    // FENCE.I DCache flush interface (直通)
    input  wire logic   dcache_flush_req,
    output logic        dcache_flush_done,
    
    output logic        stall_req // Output for hazard unit
);

    // Internal signals
    logic [31:0] cpu_mem_adr;
    logic [31:0] cpu_mem_dat_o;
    logic [31:0] cpu_mem_dat_i;
    logic        cpu_mem_we;
    logic [3:0]  cpu_mem_sel;
    logic        cpu_mem_stb;
    logic        cpu_mem_ack;
    
    // ========================================================================
    // Magic Address Handling (Simulation Only)
    // ========================================================================
    // Magic address range: 0x90000000~0x9FFFFFFF
    // Used for simulation output ($write) - handled locally, not sent to DCache
`ifdef SIMU
    wire is_magic_addr = (ex_mem_reg.alu_result[31:28] == 4'h9);
    
    // Edge detection to print only once per request
    logic magic_ack_prev;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            magic_ack_prev <= 1'b0;
        else
            magic_ack_prev <= is_magic_addr && ex_mem_reg.mem_write && ex_mem_reg.valid;
    end
    
    // Print character only on first cycle of magic write (rising edge)
    always @(posedge clk) begin
        if (is_magic_addr && ex_mem_reg.mem_write && ex_mem_reg.valid && !magic_ack_prev) begin
            $write("%c", ex_mem_reg.rs2_data[7:0]);
            $fflush();
        end
    end
`else
    wire is_magic_addr = 1'b0;
`endif
    
    // Magic address provides immediate ACK, no DCache access needed
    wire magic_ack = is_magic_addr && (ex_mem_reg.mem_read || ex_mem_reg.mem_write) && ex_mem_reg.valid;
    
    // 连接到外部 DCache 端口 (bypass magic addresses)
    assign dcache_addr_o  = cpu_mem_adr;
    assign dcache_wdata_o = cpu_mem_dat_o;
    assign dcache_we_o    = cpu_mem_we;
    assign dcache_be_o    = cpu_mem_sel;
    assign dcache_valid_o = cpu_mem_stb && !is_magic_addr;  // Don't send magic addr to DCache
    assign cpu_mem_dat_i  = dcache_rdata_i;
    assign cpu_mem_ack    = dcache_ready_i || magic_ack;    // Magic addr gives immediate ACK
    
    // FENCE.I flush 直通 (flush_done 从外部 DCache 返回)
    // 注: dcache_flush_req 传给外部 DCache, flush_done 从外部返回
    // 这里只是声明，实际 flush_done 由 riscv_cpu_top 连接
    assign dcache_flush_done = 1'b0; // Placeholder，实际由外部连接
    
    // 内存访问状态机
    typedef enum logic [1:0] {
        MEM_IDLE,
        MEM_WAIT_ACK,
        MEM_DONE     // Wait for pipeline stall to release
    } mem_state_t;
    
    mem_state_t state, next_state;
    logic [31:0] mem_data_raw;
    logic [31:0] mem_data_aligned;
    logic [31:0] read_data_reg; // Latch for read data
    
    // 状态机
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= MEM_IDLE;
        else
            state <= next_state;
    end
    
    // Latch data on ACK (both immediate in IDLE and after wait)
    always_ff @(posedge clk) begin
        if (cpu_mem_ack && (state == MEM_WAIT_ACK || (state == MEM_IDLE && mem_op_pending))) begin
            read_data_reg <= cpu_mem_dat_i;
        end
    end

    logic mem_op_pending;
    // 当有有效的内存读写请求时，mem_op_pending 为高
    assign mem_op_pending = (ex_mem_reg.mem_read || ex_mem_reg.mem_write) && ex_mem_reg.valid;
    // Only assert stb in IDLE (starting) or WAIT_ACK. NOT in DONE.    
    assign cpu_mem_stb = (state == MEM_WAIT_ACK) || (state == MEM_IDLE && mem_op_pending);
    
    // Only stall if operation is pending AND ACK is not immediate
    // Single-cycle operations (magic addr, cache hits) should NOT stall
    assign stall_req = mem_op_pending && !cpu_mem_ack && (state == MEM_IDLE || state == MEM_WAIT_ACK);

 
    always_comb begin
        next_state = state;
        
        case (state)
            MEM_IDLE: begin
                if (mem_op_pending) begin
                    if (cpu_mem_ack)
                        next_state = MEM_IDLE;  // Single-cycle op: stay in IDLE
                    else
                        next_state = MEM_WAIT_ACK;  // Multi-cycle: enter wait
                end
            end
            
            MEM_WAIT_ACK: begin
                if (cpu_mem_ack) begin
                    if (stall) 
                        next_state = MEM_DONE; // If stalled, wait in DONE
                    else 
                        next_state = MEM_IDLE; // If not stalled, finish
                end
            end

            MEM_DONE: begin
                if (!stall)
                    next_state = MEM_IDLE; // Wait for stall to release
            end
        endcase
    end
    
    always_comb begin
        cpu_mem_adr = ex_mem_reg.alu_result;
        cpu_mem_we = ex_mem_reg.mem_write;
        
        // Store data alignment - replicate byte/half to all lanes
        // The byte-enable (cpu_mem_sel) selects which lane is actually written
        case (ex_mem_reg.mem_width)
            MEM_BYTE: begin
                // Replicate byte to all 4 positions
                cpu_mem_dat_o = {4{ex_mem_reg.rs2_data[7:0]}};
                case (ex_mem_reg.alu_result[1:0])
                    2'b00: cpu_mem_sel = 4'b0001;
                    2'b01: cpu_mem_sel = 4'b0010;
                    2'b10: cpu_mem_sel = 4'b0100;
                    2'b11: cpu_mem_sel = 4'b1000;
                endcase
            end
            MEM_HALF: begin
                // Replicate half to both positions
                cpu_mem_dat_o = {2{ex_mem_reg.rs2_data[15:0]}};
                cpu_mem_sel = ex_mem_reg.alu_result[1] ? 4'b1100 : 4'b0011;
            end
            MEM_WORD: begin
                cpu_mem_dat_o = ex_mem_reg.rs2_data;
                cpu_mem_sel = 4'b1111;
            end
            default: begin
                cpu_mem_dat_o = ex_mem_reg.rs2_data;
                cpu_mem_sel = 4'b1111;
            end
        endcase
        
   end

    // Data alignment and sign extension
    assign mem_data_raw = (state == MEM_DONE) ? read_data_reg : cpu_mem_dat_i;
    
    always_comb begin
        case (ex_mem_reg.mem_width)
            MEM_BYTE: begin
                case (ex_mem_reg.alu_result[1:0])
                    2'b00: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[7:0]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[7]}}, mem_data_raw[7:0]};
                    end
                    2'b01: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[15:8]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[15]}}, mem_data_raw[15:8]};
                    end
                    2'b10: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[23:16]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[23]}}, mem_data_raw[23:16]};
                    end
                    2'b11: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[31:24]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[31]}}, mem_data_raw[31:24]};
                    end
                endcase
            end
            MEM_HALF: begin
                if (ex_mem_reg.alu_result[1]) begin
                    if (ex_mem_reg.mem_unsigned)
                        mem_data_aligned = {16'b0, mem_data_raw[31:16]};
                    else
                        mem_data_aligned = {{16{mem_data_raw[31]}}, mem_data_raw[31:16]};
                end else begin
                    if (ex_mem_reg.mem_unsigned)
                        mem_data_aligned = {16'b0, mem_data_raw[15:0]};
                    else
                        mem_data_aligned = {{16{mem_data_raw[15]}}, mem_data_raw[15:0]};
                end
            end
            MEM_WORD: begin
                mem_data_aligned = mem_data_raw;
            end
            default: mem_data_aligned = mem_data_raw;
        endcase
    end
    
    // 准备下一级流水线寄存器
    always_comb begin
        mem_wb_next = '0;
        
        // Output valid if:
        // 1. Not flushing
        // 2. Input is valid
        // 3. AND (We are in DONE state OR we just finished (ack received))
        // Actually, if we are in WAIT_ACK and ack is high, we provide data.
        // If we are in DONE, we provide data.
        // If we are in IDLE and no op pending (e.g. ALU op), we provide data immediately.
        
        if (!flush && ex_mem_reg.valid) begin
            mem_wb_next.alu_result = ex_mem_reg.alu_result;
            mem_wb_next.mem_data = mem_data_aligned;
            mem_wb_next.rd = ex_mem_reg.rd;
            mem_wb_next.reg_write = ex_mem_reg.reg_write;
            mem_wb_next.mem_to_reg = ex_mem_reg.mem_to_reg;
            
            if (ex_mem_reg.mem_read || ex_mem_reg.mem_write) begin
                // Memory op: valid when done or on single-cycle hit
                // - MEM_DONE: waited for stall, now releasing
                // - MEM_WAIT_ACK && ack: multi-cycle op completed
                // - MEM_IDLE && ack && op_pending: single-cycle op (cache hit!)
                mem_wb_next.valid = (state == MEM_DONE) || 
                                    (state == MEM_WAIT_ACK && cpu_mem_ack) ||
                                    (state == MEM_IDLE && cpu_mem_ack && mem_op_pending);
            end else begin
                // ALU op: always valid
                mem_wb_next.valid = 1'b1;
            end
        end
    end

endmodule
