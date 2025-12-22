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
    output logic [31:0] correct_pc, // New output for correct PC on mispredict
    
    // CSR 接口
    output logic [11:0] csr_addr_o,        // CSR 地址
    output csr_op_t     csr_op_o,          // CSR 操作类型
    output logic [31:0] csr_wdata_o,       // CSR 写数据
    input  wire logic [31:0] csr_rdata_i,  // CSR 读数据
    
    // 特权指令信号 (传递给顶层处理)
    output logic        ex_ecall,          // ecall 指令
    output logic        ex_ebreak,         // ebreak 指令
    output logic        ex_mret,           // mret 指令
    output logic        ex_sret,           // sret 指令 (S-mode return)
    output logic        ex_illegal,        // 非法指令
    
    // SFENCE.VMA 信号 (用于 TLB 刷新)
    output logic        ex_sfence_vma,     // sfence.vma 指令
    output logic [31:0] sfence_vaddr_o,    // rs1 值 (用于选择性 VPN 刷新的虚拟地址)
    
    // 分支目标地址未对齐异常
    output logic        ex_branch_misalign // 分支/跳转目标地址未对齐
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
    
    // 分支目标地址对齐检测
    // 当分支/跳转实际发生且目标地址未4字节对齐时触发异常
    assign ex_branch_misalign = id_ex_reg.valid && 
                                (id_ex_reg.is_branch || id_ex_reg.is_jump) && 
                                actual_branch_taken && 
                                (actual_branch_target[1:0] != 2'b00);
    
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
    // ==================== CSR 接口逻辑 ====================
    
    // CSR 地址直接传递
    assign csr_addr_o = id_ex_reg.csr_addr;
    
    // CSR 操作类型
    always_comb begin
        if (id_ex_reg.valid && id_ex_reg.is_csr)
            csr_op_o = id_ex_reg.csr_op;
        else
            csr_op_o = CSR_OP_NONE;
    end
    
    // CSR 写数据计算
    // 对于 CSRRW/CSRRS/CSRRC: 使用 rs1_data (经过转发)
    // 对于 CSRRWI/CSRRSI/CSRRCI: 使用 zimm (rs1字段作为5位立即数)
    always_comb begin
        case (id_ex_reg.csr_op)
            CSR_OP_RWI, CSR_OP_RSI, CSR_OP_RCI: begin
                // 立即数版本: 使用 rs1 字段作为 zimm
                csr_wdata_o = {27'b0, id_ex_reg.rs1};
            end
            default: begin
                // 寄存器版本: 使用 rs1_forwarded
                csr_wdata_o = rs1_forwarded;
            end
        endcase
    end
    
    // ==================== 特权指令信号 ====================
    
    assign ex_ecall = id_ex_reg.valid && id_ex_reg.is_ecall;
    assign ex_ebreak = id_ex_reg.valid && id_ex_reg.is_ebreak;
    assign ex_mret = id_ex_reg.valid && id_ex_reg.is_mret;
    assign ex_sret = id_ex_reg.valid && id_ex_reg.is_sret;
    assign ex_illegal = id_ex_reg.valid && id_ex_reg.is_illegal;
    
    // SFENCE.VMA: 刷新 TLB
    // 当 rs1 = 0 时刷新所有条目，否则刷新匹配的 VPN
    assign ex_sfence_vma = id_ex_reg.valid && id_ex_reg.is_sfence_vma;
    assign sfence_vaddr_o = rs1_forwarded;  // rs1 包含要刷新的虚拟地址
    
    // ==================== 准备下一级流水线寄存器 ====================
    
    always_comb begin
        ex_mem_next = '0;
        
        if (!flush && id_ex_reg.valid) begin
            ex_mem_next.alu_result = alu_result;
            ex_mem_next.rs2_data = rs2_forwarded;
            ex_mem_next.pc_plus_4 = id_ex_reg.pc + 4;
            ex_mem_next.pc = id_ex_reg.pc;
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
            
            // CSR 指令: 将 CSR 读取值作为 ALU 结果写回寄存器
            if (id_ex_reg.is_csr)
                ex_mem_next.alu_result = csr_rdata_i;
        end
    end

endmodule