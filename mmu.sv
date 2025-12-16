`include "defines.sv"

// mmu.sv - Memory Management Unit for Sv32 paging
// Implements Sv32 two-level page table walk for RV32
module mmu (
    input  wire logic        clk,
    input  wire logic        rst,
    
    // satp 寄存器输入
    input  wire logic [31:0] satp,              // satp CSR value
    input  wire logic        paging_enabled,    // satp.MODE == 1
    input  wire logic [1:0]  priv_mode,         // Current privilege mode
    
    // 翻译请求接口
    input  wire logic [31:0] vaddr,             // Virtual address to translate
    input  wire logic        translate_req,     // Translation request valid
    input  wire logic        is_write,          // Write access (for permission check)
    input  wire logic        is_execute,        // Instruction fetch (for permission check)
    
    // 翻译结果输出
    output logic [31:0]      paddr,             // Physical address result
    output logic             translate_done,    // Translation complete
    output logic             page_fault,        // Page fault occurred
    output logic [3:0]       fault_type,        // Fault type: 12=Inst, 13=Load, 15=Store
    
    // 页表遍历内存访问接口
    output logic [31:0]      ptw_addr,          // Page Table Walk memory address
    output logic             ptw_req,           // PTW memory request
    input  wire logic [31:0] ptw_data,          // PTW memory response data
    input  wire logic        ptw_ack            // PTW memory response valid
);

    // ==================== Sv32 格式定义 ====================
    // Virtual Address (32-bit):
    //   [31:22] VPN[1] - 10 bits, index into 1st level page table
    //   [21:12] VPN[0] - 10 bits, index into 2nd level page table
    //   [11:0]  Offset - 12 bits, page offset
    
    // Page Table Entry (32-bit):
    //   [31:10] PPN    - 22 bits, Physical Page Number
    //   [9:8]   RSW    - 2 bits, Reserved for software
    //   [7]     D      - Dirty
    //   [6]     A      - Accessed
    //   [5]     G      - Global
    //   [4]     U      - User accessible
    //   [3]     X      - Executable
    //   [2]     W      - Writable
    //   [1]     R      - Readable
    //   [0]     V      - Valid
    
    // PTE bits
    localparam PTE_V = 0;
    localparam PTE_R = 1;
    localparam PTE_W = 2;
    localparam PTE_X = 3;
    localparam PTE_U = 4;
    localparam PTE_A = 5;
    localparam PTE_D = 6;
    
    // Page fault codes
    localparam FAULT_INST_PAGE  = 4'd12;
    localparam FAULT_LOAD_PAGE  = 4'd13;
    localparam FAULT_STORE_PAGE = 4'd15;
    
    // ==================== 状态机 ====================
    typedef enum logic [2:0] {
        IDLE,
        LEVEL1_REQ,     // Request 1st level PTE
        LEVEL1_WAIT,    // Wait for 1st level PTE response
        LEVEL2_REQ,     // Request 2nd level PTE
        LEVEL2_WAIT,    // Wait for 2nd level PTE response
        DONE,           // Translation complete
        FAULT           // Page fault
    } state_t;
    
    state_t state, next_state;
    
    // 内部寄存器
    logic [31:0] saved_vaddr;       // Saved virtual address
    logic        saved_is_write;
    logic        saved_is_execute;
    logic [31:0] pte_reg;           // Current PTE
    logic [21:0] ppn_reg;           // Physical Page Number from PTE
    
    // ==================== VPN 提取 ====================
    wire [9:0] vpn1 = saved_vaddr[31:22];  // Level 1 VPN
    wire [9:0] vpn0 = saved_vaddr[21:12];  // Level 2 VPN
    wire [11:0] page_offset = saved_vaddr[11:0];
    
    // satp.PPN (页表根目录物理页号)
    wire [21:0] satp_ppn = satp[21:0];
    
    // ==================== 状态机时序逻辑 ====================
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            saved_vaddr <= 32'h0;
            saved_is_write <= 1'b0;
            saved_is_execute <= 1'b0;
            pte_reg <= 32'h0;
            ppn_reg <= 22'h0;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    if (translate_req && paging_enabled) begin
                        saved_vaddr <= vaddr;
                        saved_is_write <= is_write;
                        saved_is_execute <= is_execute;
                    end
                end
                
                LEVEL1_WAIT: begin
                    if (ptw_ack) begin
                        pte_reg <= ptw_data;
                        ppn_reg <= ptw_data[31:10];
                    end
                end
                
                LEVEL2_WAIT: begin
                    if (ptw_ack) begin
                        pte_reg <= ptw_data;
                        ppn_reg <= ptw_data[31:10];
                    end
                end
                
                default: ;
            endcase
        end
    end
    
    // ==================== PTE 有效性和权限检查 ====================
    logic pte_valid;
    logic pte_is_leaf;
    logic perm_ok;
    
    always_comb begin
        // PTE 有效: V=1
        pte_valid = pte_reg[PTE_V];
        
        // 叶子 PTE: R=1 或 X=1 (否则是指向下一级页表的指针)
        pte_is_leaf = pte_reg[PTE_R] | pte_reg[PTE_X];
        
        // 权限检查
        perm_ok = 1'b1;
        
        if (pte_valid && pte_is_leaf) begin
            // 检查 U 位 (用户模式访问)
            if (priv_mode == PRIV_U && !pte_reg[PTE_U]) begin
                perm_ok = 1'b0;
            end
            
            // 检查读权限 (Load)
            if (!saved_is_write && !saved_is_execute && !pte_reg[PTE_R]) begin
                perm_ok = 1'b0;
            end
            
            // 检查写权限 (Store)
            if (saved_is_write && !pte_reg[PTE_W]) begin
                perm_ok = 1'b0;
            end
            
            // 检查执行权限 (Instruction fetch)
            if (saved_is_execute && !pte_reg[PTE_X]) begin
                perm_ok = 1'b0;
            end
        end
    end
    
    // ==================== 状态机组合逻辑 ====================
    always_comb begin
        next_state = state;
        ptw_addr = 32'h0;
        ptw_req = 1'b0;
        paddr = 32'h0;
        translate_done = 1'b0;
        page_fault = 1'b0;
        fault_type = 4'h0;
        
        case (state)
            IDLE: begin
                if (translate_req) begin
                    if (!paging_enabled) begin
                        // 分页未启用: 直接使用物理地址
                        paddr = vaddr;
                        translate_done = 1'b1;
                    end else begin
                        // 开始页表遍历
                        next_state = LEVEL1_REQ;
                    end
                end
            end
            
            LEVEL1_REQ: begin
                // 请求一级页表项
                // PTE地址 = satp.PPN * 4096 + VPN[1] * 4
                ptw_addr = {satp_ppn, 12'b0} + {20'b0, vpn1, 2'b0};
                ptw_req = 1'b1;
                next_state = LEVEL1_WAIT;
            end
            
            LEVEL1_WAIT: begin
                if (ptw_ack) begin
                    if (!ptw_data[PTE_V]) begin
                        // PTE 无效
                        next_state = FAULT;
                    end else if (ptw_data[PTE_R] | ptw_data[PTE_X]) begin
                        // 叶子 PTE (超级页, 4MB)
                        // Sv32 超级页: VPN[0] 和 offset 合并
                        next_state = DONE;
                    end else begin
                        // 指针 PTE, 继续二级遍历
                        next_state = LEVEL2_REQ;
                    end
                end else begin
                    // 继续等待
                    ptw_addr = {satp_ppn, 12'b0} + {20'b0, vpn1, 2'b0};
                    ptw_req = 1'b1;
                end
            end
            
            LEVEL2_REQ: begin
                // 请求二级页表项
                // PTE地址 = PTE.PPN * 4096 + VPN[0] * 4
                ptw_addr = {ppn_reg, 12'b0} + {20'b0, vpn0, 2'b0};
                ptw_req = 1'b1;
                next_state = LEVEL2_WAIT;
            end
            
            LEVEL2_WAIT: begin
                if (ptw_ack) begin
                    if (!ptw_data[PTE_V]) begin
                        // PTE 无效
                        next_state = FAULT;
                    end else if (!(ptw_data[PTE_R] | ptw_data[PTE_X])) begin
                        // 二级 PTE 必须是叶子
                        next_state = FAULT;
                    end else begin
                        // 有效叶子 PTE
                        next_state = DONE;
                    end
                end else begin
                    // 继续等待
                    ptw_addr = {ppn_reg, 12'b0} + {20'b0, vpn0, 2'b0};
                    ptw_req = 1'b1;
                end
            end
            
            DONE: begin
                // 检查权限
                if (!perm_ok) begin
                    next_state = FAULT;
                end else begin
                    // 构造物理地址
                    // paddr = PPN * 4096 + offset
                    paddr = {ppn_reg, page_offset};
                    translate_done = 1'b1;
                    next_state = IDLE;
                end
            end
            
            FAULT: begin
                page_fault = 1'b1;
                translate_done = 1'b1;
                
                // 确定错误类型
                if (saved_is_execute) begin
                    fault_type = FAULT_INST_PAGE;
                end else if (saved_is_write) begin
                    fault_type = FAULT_STORE_PAGE;
                end else begin
                    fault_type = FAULT_LOAD_PAGE;
                end
                
                next_state = IDLE;
            end
            
            default: next_state = IDLE;
        endcase
    end

endmodule
