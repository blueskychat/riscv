`include "defines.sv"
`include "pipeline_regs.sv"

// id_stage.sv - 指令译码级
module id_stage (
    input  wire logic        clk,
    input  wire logic        rst,
    input  wire logic        stall,
    input  wire logic        flush,
    
    input  if_id_reg_t  if_id_reg,
    output id_ex_reg_t  id_ex_next,
    
    // 寄存器堆接口
    input  wire logic [4:0]  wb_rd,      // Write back register index
    input  wire logic [31:0] reg_write_data,    // Write back data
    input  wire logic        wb_enable,  // Write back enable
    // Forwarding inputs for early branch resolution
    input  ex_mem_reg_t ex_mem_fwd_in,
    input  mem_wb_reg_t mem_wb_fwd_in,

    // Early branch resolution outputs
    output logic        branch_redirect_id,
    output logic [31:0] branch_target_id
);

    // 寄存器堆
    logic [31:0] reg_file[32];
    logic [31:0] rs1_data, rs2_data;
    
    // 指令字段解析
    logic [6:0]  opcode;
    logic [4:0]  rd, rs1, rs2;
    logic [2:0]  funct3;
    logic [6:0]  funct7;
    logic [31:0] inst;
    
    assign inst = if_id_reg.inst;
    assign opcode = inst[6:0];
    assign rd = inst[11:7];
    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];
    assign funct3 = inst[14:12];
    assign funct7 = inst[31:25];
    
    // 立即数生成
    logic [31:0] imm_i, imm_s, imm_b, imm_u, imm_j, imm;
    
    always_comb begin
        // I-type立即数
        imm_i = {{20{inst[31]}}, inst[31:20]};
        
        // S-type立即数
        imm_s = {{20{inst[31]}}, inst[31:25], inst[11:7]};
        
        // B-type立即数
        imm_b = {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
        
        // U-type立即数
        imm_u = {inst[31:12], 12'b0};
        
        // J-type立即数
        imm_j = {{11{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};
        
        // 选择立即数
        case (opcode)
            OP_LUI, OP_AUIPC:           imm = imm_u;
            OP_JAL:                     imm = imm_j;
            OP_JALR, OP_LOAD, OP_IMM:  imm = imm_i;
            OP_STORE:                   imm = imm_s;
            OP_BRANCH:                  imm = imm_b;
            default:                    imm = 32'h0;
        endcase
    end
    
    // 寄存器堆读取
    always_comb begin
        // 处理x0寄存器始终为0
        // RS1 Read with Forwarding from WB stage (Internal Bypass)
        if (rs1 == 5'h0)
            rs1_data = 32'h0;
        else if (wb_enable && wb_rd == rs1)
            rs1_data = reg_write_data;
        else
            rs1_data = reg_file[rs1];
            
        // RS2 Read with Forwarding from WB stage (Internal Bypass)
        if (rs2 == 5'h0)
            rs2_data = 32'h0;
        else if (wb_enable && wb_rd == rs2)
            rs2_data = reg_write_data;
        else
            rs2_data = reg_file[rs2];
    end
    
    // 寄存器堆写入
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (int i = 0; i < 32; i++)
                reg_file[i] <= 32'h0;
        end else if (wb_enable && wb_rd != 5'h0) begin
            reg_file[wb_rd] <= reg_write_data;
        end
    end
    
    // 控制信号生成
    always_comb begin
        // 默认值
        id_ex_next = '0;
        
        if (!flush && if_id_reg.valid) begin
            id_ex_next.pc = if_id_reg.pc;
            id_ex_next.rs1_data = rs1_data;
            id_ex_next.rs2_data = rs2_data;
            id_ex_next.imm = imm;
            id_ex_next.rd = rd;
            id_ex_next.rs1 = rs1;
            id_ex_next.rs2 = rs2;
            id_ex_next.predicted_pc = if_id_reg.predicted_pc;
            id_ex_next.prediction_valid = if_id_reg.prediction_valid;
            id_ex_next.valid = 1'b1;
            
            // 根据操作码生成控制信号
            case (opcode)
                OP_LUI: begin
                    id_ex_next.alu_op = ALU_LUI;
                    id_ex_next.alu_src1_sel = 1'b0;
                    id_ex_next.alu_src2_sel = 1'b1;
                    id_ex_next.reg_write = 1'b1;
                end
                
                OP_AUIPC: begin
                    id_ex_next.alu_op = ALU_AUIPC;
                    id_ex_next.alu_src1_sel = 1'b1;  // 使用PC
                    id_ex_next.alu_src2_sel = 1'b1;  // 使用立即数
                    id_ex_next.reg_write = 1'b1;
                end
                
                OP_JAL: begin
                    id_ex_next.alu_op = ALU_ADD;
                    id_ex_next.alu_src1_sel = 1'b1;  // PC
                    id_ex_next.alu_src2_sel = 1'b1;  // imm
                    id_ex_next.is_jump = 1'b1;
                    id_ex_next.reg_write = 1'b1;
                end
                
                OP_JALR: begin
                    id_ex_next.alu_op = ALU_ADD;
                    id_ex_next.alu_src1_sel = 1'b0;  // rs1
                    id_ex_next.alu_src2_sel = 1'b1;  // imm
                    id_ex_next.is_jump = 1'b1;
                    id_ex_next.reg_write = 1'b1;
                end
                
                OP_BRANCH: begin
                    id_ex_next.alu_op = ALU_ADD;
                    id_ex_next.alu_src1_sel = 1'b1;  // PC
                    id_ex_next.alu_src2_sel = 1'b1;  // imm
                    id_ex_next.is_branch = 1'b1;
                    case (funct3)
                        3'b000: id_ex_next.branch_type = BR_EQ;
                        3'b001: id_ex_next.branch_type = BR_NE;
                        3'b100: id_ex_next.branch_type = BR_LT;
                        3'b101: id_ex_next.branch_type = BR_GE;
                        3'b110: id_ex_next.branch_type = BR_LTU;
                        3'b111: id_ex_next.branch_type = BR_GEU;
                        default: id_ex_next.branch_type = BR_NONE;
                    endcase
                end
                
                OP_LOAD: begin
                    id_ex_next.alu_op = ALU_ADD;
                    id_ex_next.alu_src1_sel = 1'b0;  // rs1
                    id_ex_next.alu_src2_sel = 1'b1;  // imm
                    id_ex_next.mem_read = 1'b1;
                    id_ex_next.reg_write = 1'b1;
                    case (funct3[1:0])
                        2'b00: id_ex_next.mem_width = MEM_BYTE;
                        2'b01: id_ex_next.mem_width = MEM_HALF;
                        2'b10: id_ex_next.mem_width = MEM_WORD;
                        default: id_ex_next.mem_width = MEM_WORD;
                    endcase
                    id_ex_next.mem_unsigned = funct3[2];
                end
                
                OP_STORE: begin
                    id_ex_next.alu_op = ALU_ADD;
                    id_ex_next.alu_src1_sel = 1'b0;  // rs1
                    id_ex_next.alu_src2_sel = 1'b1;  // imm
                    id_ex_next.mem_write = 1'b1;
                    case (funct3[1:0])
                        2'b00: id_ex_next.mem_width = MEM_BYTE;
                        2'b01: id_ex_next.mem_width = MEM_HALF;
                        2'b10: id_ex_next.mem_width = MEM_WORD;
                        default: id_ex_next.mem_width = MEM_WORD;
                    endcase
                end
                
                OP_IMM: begin
                    id_ex_next.alu_src1_sel = 1'b0;  // rs1
                    id_ex_next.alu_src2_sel = 1'b1;  // imm
                    id_ex_next.reg_write = 1'b1;
                    case (funct3)
                        3'b000: id_ex_next.alu_op = ALU_ADD;   // ADDI
                        3'b010: id_ex_next.alu_op = ALU_SLT;   // SLTI
                        3'b011: id_ex_next.alu_op = ALU_SLTU;  // SLTIU
                        3'b100: id_ex_next.alu_op = ALU_XOR;   // XORI
                        3'b110: id_ex_next.alu_op = ALU_OR;    // ORI
                        3'b111: id_ex_next.alu_op = ALU_AND;   // ANDI
                        3'b001: id_ex_next.alu_op = ALU_SLL;   // SLLI
                        3'b101: begin
                            if (funct7[5])
                                id_ex_next.alu_op = ALU_SRA;   // SRAI
                            else
                                id_ex_next.alu_op = ALU_SRL;   // SRLI
                        end
                    endcase
                end
                
                OP_REG: begin
                    id_ex_next.alu_src1_sel = 1'b0;  // rs1
                    id_ex_next.alu_src2_sel = 1'b0;  // rs2
                    id_ex_next.reg_write = 1'b1;
                    case (funct3)
                        3'b000: begin
                            if (funct7[5])
                                id_ex_next.alu_op = ALU_SUB;   // SUB
                            else
                                id_ex_next.alu_op = ALU_ADD;   // ADD
                        end
                        3'b001: id_ex_next.alu_op = ALU_SLL;   // SLL
                        3'b010: id_ex_next.alu_op = ALU_SLT;   // SLT
                        3'b011: id_ex_next.alu_op = ALU_SLTU;  // SLTU
                        3'b100: id_ex_next.alu_op = ALU_XOR;   // XOR
                        3'b101: begin
                            if (funct7[5])
                                id_ex_next.alu_op = ALU_SRA;   // SRA
                            else
                                id_ex_next.alu_op = ALU_SRL;   // SRL
                        end
                        3'b110: id_ex_next.alu_op = ALU_OR;    // OR
                        3'b111: id_ex_next.alu_op = ALU_AND;   // AND
                    endcase
                end
                
                OP_FENCE: begin
                    // FENCE and FENCE.I instructions
                    id_ex_next.valid = 1'b1;
                    id_ex_next.reg_write = 1'b0;  // No register write
                    id_ex_next.mem_read = 1'b0;
                    id_ex_next.mem_write = 1'b0;
                    id_ex_next.alu_op = ALU_ADD;  // Dummy ALU op
                    if (funct3 == 3'b001) begin
                        // FENCE.I - trigger cache synchronization
                        id_ex_next.is_fence_i = 1'b1;
                    end
                    // else: FENCE - treat as NOP (default is_fence_i = 0)
                end
                
                OP_SYSTEM: begin
                    id_ex_next.valid = 1'b1;
                    id_ex_next.alu_op = ALU_ADD;  // Default ALU op
                    
                    if (funct3 == 3'b000) begin
                        // SYSTEM 指令 (ecall, ebreak, mret, etc.)
                        case (inst[31:20])
                            12'h000: begin
                                // ECALL
                                id_ex_next.is_ecall = 1'b1;
                                id_ex_next.reg_write = 1'b0;
                            end
                            12'h001: begin
                                // EBREAK
                                id_ex_next.is_ebreak = 1'b1;
                                id_ex_next.reg_write = 1'b0;
                            end
                            12'h302: begin
                                // MRET
                                id_ex_next.is_mret = 1'b1;
                                id_ex_next.reg_write = 1'b0;
                            end
                            default: begin
                                // 其他 SYSTEM 指令暂不支持
                                id_ex_next.valid = 1'b0;
                            end
                        endcase
                    end else begin
                        // CSR 指令 (csrrw, csrrs, csrrc, csrrwi, csrrsi, csrrci)
                        id_ex_next.is_csr = 1'b1;
                        id_ex_next.csr_addr = inst[31:20];  // CSR 地址
                        id_ex_next.reg_write = (rd != 5'b0);  // rd != 0 时写回CSR读取值
                        
                        // CSR 操作类型由 funct3 决定
                        case (funct3)
                            3'b001: id_ex_next.csr_op = CSR_OP_RW;   // CSRRW
                            3'b010: id_ex_next.csr_op = CSR_OP_RS;   // CSRRS
                            3'b011: id_ex_next.csr_op = CSR_OP_RC;   // CSRRC
                            3'b101: id_ex_next.csr_op = CSR_OP_RWI;  // CSRRWI
                            3'b110: id_ex_next.csr_op = CSR_OP_RSI;  // CSRRSI
                            3'b111: id_ex_next.csr_op = CSR_OP_RCI;  // CSRRCI
                            default: id_ex_next.csr_op = CSR_OP_NONE;
                        endcase
                        
                        // 对于立即数版本 (funct3[2]=1), rs1 字段作为 zimm
                        // imm 已经被正确设置为 I-type 立即数
                    end
                end
                
                default: begin
                    // 非法指令 - 设置异常标志
                    id_ex_next.valid = 1'b1;
                    id_ex_next.is_illegal = 1'b1;
                end

            endcase
            
        end
                
    end
                
                        
                
    //----------------------------------------------------------------

    //-- Data Forwarding for Early Branch Logic

    //-- 为ID阶段的分支逻辑提供数据前传，解决MEM->ID和WB->ID的数据冒险。

    //-- EX->ID的冒险无法通过前传解决（数据尚未生成），必须由hazard_unit通过暂停流水线来处理。

    //----------------------------------------------------------------

    logic [31:0] branch_rs1_data, branch_rs2_data;

    always_comb begin

        // --- RS1 Forwarding ---

        if (ex_mem_fwd_in.valid && ex_mem_fwd_in.reg_write && ex_mem_fwd_in.rd != 0 && ex_mem_fwd_in.rd == rs1) begin

            // MEM -> ID Forward

            branch_rs1_data = ex_mem_fwd_in.alu_result;

        end else if (mem_wb_fwd_in.valid && mem_wb_fwd_in.reg_write && mem_wb_fwd_in.rd != 0 && mem_wb_fwd_in.rd == rs1) begin

            // WB -> ID Forward

            branch_rs1_data = reg_write_data;

        end else begin

            // No forward, use register file value

            branch_rs1_data = rs1_data;

        end



        // --- RS2 Forwarding ---

        if (ex_mem_fwd_in.valid && ex_mem_fwd_in.reg_write && ex_mem_fwd_in.rd != 0 && ex_mem_fwd_in.rd == rs2) begin

            // MEM -> ID Forward

            branch_rs2_data = ex_mem_fwd_in.alu_result;

        end else if (mem_wb_fwd_in.valid && mem_wb_fwd_in.reg_write && mem_wb_fwd_in.rd != 0 && mem_wb_fwd_in.rd == rs2) begin

            // WB -> ID Forward

            branch_rs2_data = reg_write_data;

        end else begin

            // No forward, use register file value

            branch_rs2_data = rs2_data;

        end

    end



    //----------------------------------------------------------------

    //-- Early Branch Resolution Logic (ID Stage)

    //-- 在ID阶段提前进行分支判断，以减少一拍的流水线停顿。

    //-- 1. 解码B-type指令。

    //-- 2. 比较rs1和rs2的值 (使用前传后的数据)。

    //-- 3. 计算分支目标地址 (PC + imm)。

    //-- 4. 如果分支预测错误（漏报、误报、目标错误），则发出重定向信号(branch_redirect_id)和正确目标地址。
    
    //-- 5. ID阶段可以判断跳转预测是否正确并且决定是否冲刷前一级流水线，但是它不改变分支预测表。分支预测表的修改留给EX阶段进行。

    //----------------------------------------------------------------

    logic branch_condition_met;
    logic [31:0] calculated_target;

    always_comb begin

        // Default to not redirect
        branch_redirect_id = 1'b0;
        branch_target_id = 32'h0;
        branch_condition_met = 1'b0;
        calculated_target = 32'h0;

        if (if_id_reg.valid && opcode == OP_BRANCH) begin

            // Check branch condition using forwarded data
            case (funct3)
                3'b000: branch_condition_met = (branch_rs1_data == branch_rs2_data);           // BEQ
                3'b001: branch_condition_met = (branch_rs1_data != branch_rs2_data);           // BNE
                3'b100: branch_condition_met = ($signed(branch_rs1_data) < $signed(branch_rs2_data));  // BLT
                3'b101: branch_condition_met = ($signed(branch_rs1_data) >= $signed(branch_rs2_data)); // BGE
                3'b110: branch_condition_met = (branch_rs1_data < branch_rs2_data);            // BLTU
                3'b111: branch_condition_met = (branch_rs1_data >= branch_rs2_data);           // BGEU
                default: branch_condition_met = 1'b0;
            endcase

            calculated_target = if_id_reg.pc + imm_b;

            if (branch_condition_met) begin
                // Actual: Taken
                if (!if_id_reg.prediction_valid) begin
                    // Case 1: Predicted Not Taken (or no prediction), Actually Taken -> Redirect to Target
                    branch_redirect_id = 1'b1;
                    branch_target_id = calculated_target;
                end else if (if_id_reg.predicted_pc != calculated_target) begin
                    // Case 3: Predicted Taken but Target Wrong -> Redirect to Correct Target
                    branch_redirect_id = 1'b1;
                    branch_target_id = calculated_target;
                end
                // Else: Predicted Taken and Target Correct -> No Redirect (Continue)
            end else begin
                // Actual: Not Taken
                if (if_id_reg.prediction_valid) begin
                    // Case 2: Predicted Taken, Actually Not Taken -> Redirect to Fallthrough (PC+4)
                    branch_redirect_id = 1'b1;
                    branch_target_id = if_id_reg.pc + 4;
                end
                // Else: Predicted Not Taken, Actually Not Taken -> No Redirect (Continue)
            end

        end

    end



endmodule