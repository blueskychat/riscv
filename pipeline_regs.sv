// pipeline_regs.sv - 流水线寄存器类型定义

`ifndef PIPELINE_REGS_SV
`define PIPELINE_REGS_SV

// IF/ID流水线寄存器
typedef struct packed {
    logic [31:0] pc;
    logic [31:0] inst;
    logic [31:0] predicted_pc;
    logic        prediction_valid;
    logic        valid;
} if_id_reg_t;

// ID/EX流水线寄存器
typedef struct packed {
    logic [31:0] pc;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    logic [31:0] imm;
    logic [4:0]  rd;
    logic [4:0]  rs1;
    logic [4:0]  rs2;
    alu_op_t     alu_op;
    logic        alu_src1_sel;  // 0: rs1, 1: pc
    logic        alu_src2_sel;  // 0: rs2, 1: imm
    logic        mem_read;
    logic        mem_write;
    logic        mem_unsigned;
    mem_width_t  mem_width;
    logic        reg_write;
    branch_t     branch_type;
    logic        is_branch;
    logic        is_jump;
    logic        is_fence_i;      // FENCE.I instruction flag
    logic [31:0] predicted_pc;
    logic        prediction_valid;
    // CSR 相关字段
    csr_op_t     csr_op;          // CSR 操作类型
    logic [11:0] csr_addr;        // CSR 地址
    logic        is_csr;          // 是否为 CSR 指令
    // 特权指令标志
    logic        is_ecall;        // ecall 指令
    logic        is_ebreak;       // ebreak 指令
    logic        is_mret;         // mret 指令
    logic        is_sfence_vma;   // sfence.vma 指令 (TLB flush)
    logic        is_illegal;      // 非法指令
    logic        valid;
} id_ex_reg_t;

// EX/MEM流水线寄存器
typedef struct packed {
    logic [31:0] alu_result;
    logic [31:0] rs2_data;
    logic [31:0] pc_plus_4;
    logic [4:0]  rd;
    logic        mem_read;
    logic        mem_write;
    logic        mem_unsigned;
    mem_width_t  mem_width;
    logic        reg_write;
    logic        mem_to_reg;
    logic        valid;
} ex_mem_reg_t;

// MEM/WB流水线寄存器
typedef struct packed {
    logic [31:0] alu_result;
    logic [31:0] mem_data;
    logic [4:0]  rd;
    logic        reg_write;
    logic        mem_to_reg;
    logic        valid;
} mem_wb_reg_t;

`endif // PIPELINE_REGS_SV
