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

`endif
