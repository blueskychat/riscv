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
    // Wishbone master interface
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
    btb_entry_t entry;
    always_comb begin
        entry = btb_table[btb_index];
        btb_hit = entry.valid && (entry.tag == btb_tag);
        btb_target = entry.target;
        btb_taken = entry.counter[1];  // 计数器高位决定是否预测跳转
        
        // 分支预测结果
        prediction_valid = btb_hit && btb_taken;
        predicted_pc = prediction_valid ? btb_target : pc + 4;
    end
    
    // BTB更新（在分支结果确定后）
    btb_entry_t new_entry, old_entry;  
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (int i = 0; i < BTB_SIZE; i++) begin
                btb_table[i] <= '0;
            end
        end else if (branch_mispredict) begin
            // 更新BTB表项
            old_entry = btb_table[ex_btb_index];

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
    
    // Wishbone总线访问指令存储器
    always_comb begin
        wb_adr_o = pc;
        wb_dat_o = 32'h0;
        wb_we_o = 1'b0;      // 读操作
        wb_sel_o = 4'b1111;  // 读取完整字
        wb_stb_o = !rst;
        wb_cyc_o = !rst;
    end

    always_comb begin
        if_id_next = '0;
        if (!flush) begin
            if_id_next.pc = pc; 
            if_id_next.inst = wb_dat_i;
            if_id_next.predicted_pc = predicted_pc;
            if_id_next.prediction_valid = prediction_valid;
            if_id_next.valid = wb_ack_i; 
        end
    end
endmodule