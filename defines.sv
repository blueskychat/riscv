// defines.sv - 系统参数和常量定义
`ifndef DEFINES_SV
`define DEFINES_SV
`default_nettype none

// 基础参数
parameter XLEN = 32;                    // RV32I架构
parameter INST_WIDTH = 32;              // 指令宽度
parameter REG_ADDR_WIDTH = 5;           // 寄存器地址宽度
parameter NUM_REGS = 32;                // 寄存器数量

// 内存映射
parameter BASERAM_BASE = 32'h80000000;  // BaseRAM起始地址（指令+部分数据）
parameter EXTRAM_BASE  = 32'h80400000;  // ExtRAM起始地址（数据）
parameter OUTPUT_ADDR  = 32'h80300000;  // 输出结果地址
parameter UART_BASE    = 32'h10000000;  // UART基地址

// SRAM参数
parameter SRAM_ADDR_WIDTH = 20;         // SRAM地址宽度(4MB = 2^20 * 4bytes)
parameter SRAM_DATA_WIDTH = 32;         // SRAM数据宽度

// BTB参数
parameter BTB_SIZE = 64;              // BTB表项数量
parameter BTB_INDEX_WIDTH = 6;         // BTB索引宽度

// 指令操作码
typedef enum logic [6:0] {
    OP_LUI    = 7'b0110111,  // U-type: Load Upper Immediate
    OP_AUIPC  = 7'b0010111,  // U-type: Add Upper Immediate to PC
    OP_JAL    = 7'b1101111,  // J-type: Jump and Link
    OP_JALR   = 7'b1100111,  // I-type: Jump and Link Register
    OP_BRANCH = 7'b1100011,  // B-type: Branch
    OP_LOAD   = 7'b0000011,  // I-type: Load
    OP_STORE  = 7'b0100011,  // S-type: Store
    OP_IMM    = 7'b0010011,  // I-type: Immediate arithmetic
    OP_REG    = 7'b0110011,  // R-type: Register arithmetic
    OP_FENCE  = 7'b0001111,  // Fence
    OP_SYSTEM = 7'b1110011   // System
} opcode_t;

// ALU操作码
typedef enum logic [3:0] {
    ALU_ADD  = 4'b0000,
    ALU_SUB  = 4'b0001,
    ALU_SLL  = 4'b0010,
    ALU_SLT  = 4'b0011,
    ALU_SLTU = 4'b0100,
    ALU_XOR  = 4'b0101,
    ALU_SRL  = 4'b0110,
    ALU_SRA  = 4'b0111,
    ALU_OR   = 4'b1000,
    ALU_AND  = 4'b1001,
    ALU_LUI  = 4'b1010,
    ALU_AUIPC= 4'b1011,
    ALU_NONE = 4'b1111
} alu_op_t;

// 分支类型
typedef enum logic [2:0] {
    BR_NONE = 3'b000,
    BR_EQ   = 3'b001,  // BEQ
    BR_NE   = 3'b010,  // BNE
    BR_LT   = 3'b011,  // BLT
    BR_GE   = 3'b100,  // BGE
    BR_LTU  = 3'b101,  // BLTU
    BR_GEU  = 3'b110   // BGEU
} branch_t;

// Load/Store宽度
typedef enum logic [1:0] {
    MEM_BYTE = 2'b00,
    MEM_HALF = 2'b01,
    MEM_WORD = 2'b10
} mem_width_t;

// ==================== CSR 定义 ====================

// CSR 地址定义 (Machine Mode)
parameter CSR_MSTATUS   = 12'h300;  // Machine Status
parameter CSR_MIE       = 12'h304;  // Machine Interrupt Enable
parameter CSR_MTVEC     = 12'h305;  // Machine Trap Vector
parameter CSR_MSCRATCH  = 12'h340;  // Machine Scratch
parameter CSR_MEPC      = 12'h341;  // Machine Exception PC
parameter CSR_MCAUSE    = 12'h342;  // Machine Cause
parameter CSR_MTVAL     = 12'h343;  // Machine Trap Value
parameter CSR_MIP       = 12'h344;  // Machine Interrupt Pending

// PMP CSR 地址
parameter CSR_PMPCFG0   = 12'h3A0;  // PMP Config 0
parameter CSR_PMPADDR0  = 12'h3B0;  // PMP Address 0

// Supervisor CSR 地址 (用于分页)
parameter CSR_SATP      = 12'h180;  // Supervisor Address Translation and Protection

// Zicntr 扩展: 用户模式只读时间计数器
parameter CSR_TIME      = 12'hC01;  // time: mtime 低32位 (只读)
parameter CSR_TIMEH     = 12'hC81;  // timeh: mtime 高32位 (只读, RV32)

// CSR 操作类型
typedef enum logic [2:0] {
    CSR_OP_NONE  = 3'b000,  // 无CSR操作
    CSR_OP_RW    = 3'b001,  // CSRRW: 读后写
    CSR_OP_RS    = 3'b010,  // CSRRS: 读后置位
    CSR_OP_RC    = 3'b011,  // CSRRC: 读后清位
    CSR_OP_RWI   = 3'b101,  // CSRRWI: 立即数写
    CSR_OP_RSI   = 3'b110,  // CSRRSI: 立即数置位
    CSR_OP_RCI   = 3'b111   // CSRRCI: 立即数清位
} csr_op_t;

// 异常代码定义
parameter EX_INST_MISALIGN    = 32'd0;   // 指令地址未对齐
parameter EX_INST_FAULT       = 32'd1;   // 指令访问错误
parameter EX_ILLEGAL_INST     = 32'd2;   // 非法指令
parameter EX_BREAKPOINT       = 32'd3;   // 断点 (ebreak)
parameter EX_LOAD_MISALIGN    = 32'd4;   // Load地址未对齐
parameter EX_LOAD_FAULT       = 32'd5;   // Load访问错误
parameter EX_STORE_MISALIGN   = 32'd6;   // Store地址未对齐
parameter EX_STORE_FAULT      = 32'd7;   // Store访问错误
parameter EX_ECALL_U          = 32'd8;   // 用户模式ecall
parameter EX_ECALL_S          = 32'd9;   // 监管模式ecall
parameter EX_ECALL_M          = 32'd11;  // 机器模式ecall
parameter EX_INST_PAGE_FAULT  = 32'd12;  // 指令页故障
parameter EX_LOAD_PAGE_FAULT  = 32'd13;  // Load页故障
parameter EX_STORE_PAGE_FAULT = 32'd15;  // Store/AMO页故障

// 中断代码定义 (最高位为1表示中断)
parameter INT_M_SOFT          = 32'h80000003;  // 机器模式软中断
parameter INT_M_TIMER         = 32'h80000007;  // 机器模式定时器中断
parameter INT_M_EXT           = 32'h8000000B;  // 机器模式外部中断

// mstatus 字段定义
parameter MSTATUS_MIE_BIT     = 3;   // Machine Interrupt Enable
parameter MSTATUS_MPIE_BIT    = 7;   // Machine Previous Interrupt Enable
parameter MSTATUS_MPP_LO      = 11;  // Machine Previous Privilege (低位)
parameter MSTATUS_MPP_HI      = 12;  // Machine Previous Privilege (高位)

// mie 字段定义
parameter MIE_MTIE_BIT        = 7;   // Machine Timer Interrupt Enable

// 特权模式
parameter PRIV_U = 2'b00;  // User mode
parameter PRIV_S = 2'b01;  // Supervisor mode
parameter PRIV_M = 2'b11;  // Machine mode

`endif
