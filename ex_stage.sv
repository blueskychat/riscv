`include "defines.sv"
`include "pipeline_regs.sv"

// ex_stage.sv - 执行级
module ex_stage (
    input  wire logic        clk,
    input  wire logic        rst,
    input  wire logic        flush,
    
    input  id_ex_reg_t  id_ex_reg,
    output ex_mem_reg_t ex_mem_next,
    
    // 转发单元接口
    input  wire logic [31:0] fwd_ex_data,    // 来自EX/MEM寄存器的结果
    input  wire logic [31:0] fwd_mem_data,   // 来自MEM/WB寄存器的结果
    input  wire logic        fwd_ex_valid,   // EX/MEM中的指令是否有效且写寄存器
    input  wire logic        fwd_mem_valid,  // MEM/WB中的指令是否有效且写寄存器
    input  wire logic [4:0]  fwd_ex_rd,      // EX/MEM中的目标寄存器地址
    input  wire logic [4:0]  fwd_mem_rd,     // MEM/WB中的目标寄存器地址    

    // 分支结果
    output logic        branch_mispredict, // New output for misprediction
    output logic [31:0] correct_pc // New output for correct PC on mispredict
);

    // ALU输入选择（包含转发）
    logic [31:0] alu_src1, alu_src2;
    logic [31:0] rs1_forwarded, rs2_forwarded;
    
    // 数据转发逻辑
    always_comb begin
        // RS1转发
        if (fwd_ex_valid && fwd_ex_rd != 5'h0 && fwd_ex_rd == id_ex_reg.rs1)
            rs1_forwarded = fwd_ex_data;
        else if (fwd_mem_valid && fwd_mem_rd != 5'h0 && fwd_mem_rd == id_ex_reg.rs1)
            rs1_forwarded = fwd_mem_data;
        else
            rs1_forwarded = id_ex_reg.rs1_data;
            
        // RS2转发
        if (fwd_ex_valid && fwd_ex_rd != 5'h0 && fwd_ex_rd == id_ex_reg.rs2)
            rs2_forwarded = fwd_ex_data;
        else if (fwd_mem_valid && fwd_mem_rd != 5'h0 && fwd_mem_rd == id_ex_reg.rs2)
            rs2_forwarded = fwd_mem_data;
        else
            rs2_forwarded = id_ex_reg.rs2_data;
    end
    
    // ALU输入选择
    always_comb begin
        alu_src1 = id_ex_reg.alu_src1_sel ? id_ex_reg.pc : rs1_forwarded;
        alu_src2 = id_ex_reg.alu_src2_sel ? id_ex_reg.imm : rs2_forwarded;
    end
    
    // ALU实例
    logic [31:0] alu_result;
    alu u_alu (
        .op     (id_ex_reg.alu_op),
        .a      (alu_src1),
        .b      (alu_src2),
        .result (alu_result)
    );
    
    // 分支判断逻辑
    logic actual_branch_condition;
    logic actual_branch_taken;
    logic [31:0] actual_branch_target;

    always_comb begin
        case (id_ex_reg.branch_type)
            BR_EQ:  actual_branch_condition = (rs1_forwarded == rs2_forwarded);
            BR_NE:  actual_branch_condition = (rs1_forwarded != rs2_forwarded);
            BR_LT:  actual_branch_condition = ($signed(rs1_forwarded) < $signed(rs2_forwarded));
            BR_GE:  actual_branch_condition = ($signed(rs1_forwarded) >= $signed(rs2_forwarded));
            BR_LTU: actual_branch_condition = (rs1_forwarded < rs2_forwarded);
            BR_GEU: actual_branch_condition = (rs1_forwarded >= rs2_forwarded);
            default: actual_branch_condition = 1'b0;
        endcase

        if (id_ex_reg.is_jump ) begin
            actual_branch_taken = 1'b1;
            actual_branch_target = alu_result & ~32'h1;  // JALR清除最低位
        end else if (id_ex_reg.is_branch && actual_branch_condition) begin
            actual_branch_taken = 1'b1;
            actual_branch_target = alu_result;
        end else begin
            actual_branch_taken = 1'b0;
            actual_branch_target = id_ex_reg.pc + 4;
        end
    end
    
    // 分支预测错误检测
    always_comb begin
        branch_mispredict = 1'b0;
        correct_pc = '0;

        if (id_ex_reg.valid && (id_ex_reg.is_branch || id_ex_reg.is_jump)) begin
            if (id_ex_reg.prediction_valid) begin
                // 有预测，检查是否正确
                if ((actual_branch_taken && actual_branch_target != id_ex_reg.predicted_pc) ||
                    (!actual_branch_taken && id_ex_reg.predicted_pc != id_ex_reg.pc + 4)) begin
                    branch_mispredict = 1'b1;
                    correct_pc = actual_branch_target; // The correct PC to jump to
                end
            end else begin
                // 没有预测，但实际发生了分支，也算作预测错误
                if (actual_branch_taken) begin
                    branch_mispredict = 1'b1;
                    correct_pc = actual_branch_target;
                end
            end
        end
    end
    
    // 准备下一级流水线寄存器
    always_comb begin
        ex_mem_next = '0;
        
        if (!flush && id_ex_reg.valid) begin
            ex_mem_next.alu_result = alu_result;
            ex_mem_next.rs2_data = rs2_forwarded;
            ex_mem_next.pc_plus_4 = id_ex_reg.pc + 4;
            ex_mem_next.rd = id_ex_reg.rd;
            ex_mem_next.mem_read = id_ex_reg.mem_read;
            ex_mem_next.mem_write = id_ex_reg.mem_write;
            ex_mem_next.mem_unsigned = id_ex_reg.mem_unsigned;
            ex_mem_next.mem_width = id_ex_reg.mem_width;
            ex_mem_next.reg_write = id_ex_reg.reg_write;
            ex_mem_next.mem_to_reg = id_ex_reg.mem_read;
            ex_mem_next.valid = 1'b1;
            
            // JAL/JALR指令保存PC+4
            if (id_ex_reg.is_jump)
                ex_mem_next.alu_result = id_ex_reg.pc + 4;
        end
    end

endmodule