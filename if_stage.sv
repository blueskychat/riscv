`include "defines.sv"

// if_stage.sv - 取指令级（包含BTB分支预测）
module if_stage (
    input  wire logic        clk,
    input  wire logic        rst,
    input  wire logic        stall,
    input  wire logic        flush,  // 来自流水线控制单元的冲刷信号, 在这里没有什么作用。它在riscv_cpu_top中使用。
    
    output if_id_reg_t if_id_next,

    input  wire logic [31:0] pc,
    input  wire logic [31:0] ex_pc, // PC from EX stage for BTB update
    output logic [31:0] next_pc,
    output logic [31:0] predicted_pc,
    output logic        prediction_valid,
    
    input  wire logic        branch_mispredict,
    input  wire logic [31:0] correct_pc,
    input  wire logic        ex_is_branch,       // New: Is the instruction in EX a B-type branch?
    
    // Inputs for early branch resolution from ID stage
    input  wire logic        branch_redirect_id,
    input  wire logic [31:0] branch_target_id,
    output logic        stall_req,
    wishbone_if.master  wb_master
);

    // BTB结构定义
    typedef struct packed {
        logic        valid;
        // PC高位作为tag，长度为32-2-BTB_INDEX_WIDTH
        logic [32-2-BTB_INDEX_WIDTH-1:0] tag;        
        logic [31:0] target;     // 预测目标地址
        logic [1:0]  counter;    // 2位饱和计数器
    } btb_entry_t;
    
    // BTB存储
    btb_entry_t btb_table[BTB_SIZE];
    
    // BTB访问信号
    logic [BTB_INDEX_WIDTH-1:0]  btb_index;
    logic [32-2-BTB_INDEX_WIDTH-1:0] btb_tag;
    logic        btb_hit;
    logic [31:0] btb_target;
    logic        btb_taken;

    logic [BTB_INDEX_WIDTH-1:0]  ex_btb_index;
    logic [32-2-BTB_INDEX_WIDTH-1:0] ex_btb_tag;
    
    // BTB索引和标签计算
    assign btb_index = pc[BTB_INDEX_WIDTH+1:2];  // 使用PC的[BTB_INDEX_WIDTH+1:2]位作为索引
    assign btb_tag = pc[31:BTB_INDEX_WIDTH+2];   // 使用PC的高位作为标签

    assign ex_btb_index = ex_pc[BTB_INDEX_WIDTH+1:2];
    assign ex_btb_tag = ex_pc[31:BTB_INDEX_WIDTH+2];
    
    // BTB查找
    always_comb begin
        btb_entry_t entry = btb_table[btb_index];
        btb_hit = entry.valid && (entry.tag == btb_tag);
        btb_target = entry.target;
        btb_taken = entry.counter[1];  // 计数器高位决定是否预测跳转
        
        // 分支预测结果
        prediction_valid = btb_hit && btb_taken;
        predicted_pc = prediction_valid ? btb_target : pc + 4;
    end
    
    // BTB更新（在分支结果确定后）
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (int i = 0; i < BTB_SIZE; i++) begin
                btb_table[i] <= '0;
            end
        end else if (branch_mispredict) begin
            // 更新BTB表项
            btb_entry_t new_entry;
            btb_entry_t old_entry = btb_table[ex_btb_index];

            new_entry.valid = 1'b1;
            new_entry.tag = ex_btb_tag;
            //如果target有变化且是跳转，counter直接赋值为2，然后上下加减
            if ((correct_pc != old_entry.target) && (correct_pc != ex_pc + 4)) begin
                new_entry.target = correct_pc;
                new_entry.counter = 2'b10; //中间态
            end else begin
                // 更新2位饱和计数器
                if (correct_pc != ex_pc + 4) begin
                    new_entry.target = correct_pc; //只有跳转的地址才有记录的价值
                    // 真实跳转：饱和加1
                    new_entry.counter = (old_entry.counter == 2'b11) ? 2'b11 : old_entry.counter + 2'b01;
                end else begin
                    new_entry.target = old_entry.target; // 默认保持原目标地址
                    // 未跳转：饱和减1
                    new_entry.counter = (old_entry.counter == 2'b00) ? 2'b00 : old_entry.counter - 2'b01;
                end
            end
            
            btb_table[ex_btb_index] <= new_entry;
        end
    end
    
    // PC更新逻辑
    // 决定下一个周期PC的值，优先级如下：
    // 1. JALR的预测失败修正 (`branch_mispredict && !ex_is_branch`)：最高优先级。
    // 2. ID阶段的B-type分支跳转 (`branch_taken_id`)：用于B-type指令的快速跳转。
    // 3. BTB预测跳转 (`prediction_valid`)：如果无异常，则按预测执行。
    // 4. 顺序执行 (`pc + 4`)：默认行为。
    // NOTE: BTB的更新不受ex_is_branch影响，它会根据所有mispredict进行学习。
    always_comb begin
        if (branch_mispredict && !ex_is_branch) begin
            next_pc = correct_pc;
        end else if (branch_redirect_id) begin
            next_pc = branch_target_id;
        end else if (prediction_valid) begin
            next_pc = predicted_pc;
        end else begin
            next_pc = pc + 4;
        end
    end
    

    // Instruction Cache Signals
    logic [31:0] icache_data;
    logic        icache_hit;
    logic        icache_stall;
    
    assign stall_req = icache_stall;
    
    // Wishbone signals from Cache
    logic        wb_cyc_o;
    logic        wb_stb_o;
    logic        wb_we_o;
    logic [31:0] wb_adr_o;
    logic [31:0] wb_dat_o; // 对于icache来说，写数据没有意义, 但是需要连接
    logic [3:0]  wb_sel_o;

    // Instantiate Instruction Cache
    instruction_cache #(
        .ADDR_WIDTH(32),
        .DATA_WIDTH(32),
        .CACHE_SIZE(4096),
        .LINE_SIZE(16)
    ) u_icache (
        .clk(clk),
        .rst(rst),

        // CPU Interface
        // Use next_pc for 1-cycle fetch!
        // Logic:
        // 1. If Stalled (Reset, Cache Miss, Hazard, etc.): Request 'pc' (Current Address).
        //    This ensures that when stall lifts, we have the instruction for 'pc'.
        //    Also handles the Reset case (stall is high due to miss).
        // 2. If Running: Request 'next_pc' (Next Address).
        //    This achieves 1-cycle throughput (prefetching next instruction).
        .cpu_req_addr(stall ? pc : next_pc), 
        .cpu_data(icache_data),
        .cpu_hit(icache_hit),
        .cache_stall(icache_stall),

        // Wishbone Master Interface
        .wb_cyc(wb_cyc_o),
        .wb_stb(wb_stb_o),
        .wb_we(wb_we_o),
        .wb_adr(wb_adr_o),
        .wb_dat_o(wb_dat_o),
        .wb_sel_o(wb_sel_o),
        .wb_dat_i(wb_master.dat_i),
        .wb_ack(wb_master.ack)
    );

    // Connect Cache Wishbone signals to Interface
    assign wb_master.cyc = wb_cyc_o;
    assign wb_master.stb = wb_stb_o;
    assign wb_master.we  = wb_we_o;
    assign wb_master.adr = wb_adr_o;
    assign wb_master.dat_o = wb_dat_o;
    assign wb_master.sel = wb_sel_o;

    always_comb begin
        if_id_next = '0;
        if (!flush) begin
            if_id_next.pc = pc; 
            // If hit, data is valid. If miss, we stall
            // If cache_stall is high, we must NOT update PC.
            // riscv_cpu_top controls PC update.
            // We need to export 'icache_stall' to the pipeline control!
            
            if_id_next.inst = icache_data;
            if_id_next.predicted_pc = predicted_pc;
            if_id_next.prediction_valid = prediction_valid;
            
            // If Hit, valid=1. If Miss, valid=0 (until refill done).
            if_id_next.valid = icache_hit; 
        end
    end
endmodule