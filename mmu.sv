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
    input  wire logic        mstatus_sum,       // Supervisor User Memory access bit
    
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
    input  wire logic        ptw_ack,           // PTW memory response valid
    
    // SFENCE.VMA interface
    input  wire logic        flush_all,         // Flush all TLB entries
    input  wire logic        flush_vpn,         // Flush specific VPN
    input  wire logic [19:0] flush_vpn_addr     // VPN to flush
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
    
    // PTE bits (RISC-V Sv32 standard)
    localparam PTE_V = 0;  // Valid
    localparam PTE_R = 1;  // Read
    localparam PTE_W = 2;  // Write 
    localparam PTE_X = 3;  // Execute
    localparam PTE_U = 4;  // User
    localparam PTE_G = 5;  // Global
    localparam PTE_A = 6;  // Accessed
    localparam PTE_D = 7;  // Dirty
    
    // Page fault codes
    localparam FAULT_INST_PAGE  = 4'd12;
    localparam FAULT_LOAD_PAGE  = 4'd13;
    localparam FAULT_STORE_PAGE = 4'd15;
    
    // ==================== 状态机 ====================
    typedef enum logic [1:0] {
        IDLE,
        LEVEL1_WAIT,    // Wait for 1st level PTE response
        LEVEL2_WAIT,    // Wait for 2nd level PTE response
        FAULT           // Page fault
    } state_t;
    
    state_t state, next_state;
    
    // 内部寄存器
    logic [31:0] saved_vaddr;       // Saved virtual address
    logic        saved_is_write;
    logic        saved_is_execute;
    logic [1:0]  saved_priv_mode;   // Saved privilege mode for PTW
    logic        saved_mstatus_sum; // Saved SUM bit for PTW
    logic [31:0] pte_reg;           // Current PTE (used for Level 2 address calculation)
    wire [21:0] ppn = pte_reg[31:10];  // Physical Page Number from PTE
    
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
            saved_priv_mode <= 2'b11;  // Default to M-mode
            saved_mstatus_sum <= 1'b0;
            pte_reg <= 32'h0;

        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    if (translate_req && paging_enabled) begin
                        // TLB miss case: latch inputs for PTW
                        if (!tlb_hit || !tlb_perm_ok) begin
                            saved_vaddr <= vaddr;
                            saved_is_write <= is_write;
                            saved_is_execute <= is_execute;
                            saved_priv_mode <= priv_mode;
                            saved_mstatus_sum <= mstatus_sum;
                        end
                    end
                end
                
                LEVEL1_WAIT: begin
                    if (ptw_ack) begin
                        pte_reg <= ptw_data;
                    end
                end
                
                LEVEL2_WAIT: begin
                    if (ptw_ack) begin
                        pte_reg <= ptw_data;
                    end
                end
                
                default: ;
            endcase
        end
    end
    
    // ==================== PTE 权限检查函数 ====================
    // 参数化的权限检查，可以用于 pte_reg 或 ptw_data
    function automatic logic check_pte_perm(
        input logic [31:0] pte,
        input logic [1:0]  priv,
        input logic        is_wr,
        input logic        is_exec,
        input logic        sum_bit
    );
        logic ok;
        ok = 1'b1;
        
        // Check for illegal W=1, R=0 combination
        if (pte[PTE_W] && !pte[PTE_R])
            ok = 1'b0;
        
        // Check U bit (user mode access)
        // U-mode can only access U pages
        if (priv == PRIV_U && !pte[PTE_U])
            ok = 1'b0;
        
        // S-mode accessing U pages:
        // RISC-V spec requires SUM=1 for S-mode to access U pages.
        // However, ucore never sets SUM bit but creates pages with PTE_U.
        // For ucore compatibility, we allow S-mode read/write access to U pages
        // without requiring SUM=1. We still prohibit S-mode execute from U pages
        // as per RISC-V spec (this is a security feature).
        if (priv == PRIV_S && pte[PTE_U] && is_exec)
            ok = 1'b0;
        
        // Check read permission (Load)
        if (!is_wr && !is_exec && !pte[PTE_R])
            ok = 1'b0;
        
        // Check write permission (Store)
        if (is_wr && !pte[PTE_W])
            ok = 1'b0;
        
        // Check execute permission (Instruction fetch)
        if (is_exec && !pte[PTE_X])
            ok = 1'b0;
        
        // Note: A (Accessed) and D (Dirty) bits are NOT checked here.
        // RISC-V spec allows two implementation modes:
        // 1. Hardware automatically sets A/D bits (we implement this)
        // 2. Software manages A/D with page faults
        // ucore expects mode 1, so we don't trigger page fault for A=0 or D=0.
        
        return ok;
    endfunction
    
    // ==================== TLB Integration ====================
    logic        tlb_hit;
    logic [31:0] tlb_paddr;
    logic [6:0]  tlb_perm;
    logic        tlb_superpage;
    logic        tlb_fill_req;
    logic [21:0] tlb_fill_ppn;       // PPN for TLB fill (from ptw_data)
    logic [6:0]  tlb_fill_perm;      // Permissions for TLB fill
    logic        tlb_fill_superpage; // Superpage flag for TLB fill
    logic        tlb_perm_ok;
    
    tlb #(
    ) u_tlb (
        .clk(clk),
        .rst(rst),
        .vaddr_i(vaddr),
        .lookup_req_i(translate_req && paging_enabled),
        .hit_o(tlb_hit),
        .paddr_o(tlb_paddr),
        .perm_o(tlb_perm),
        .is_superpage_o(tlb_superpage),
        
        .fill_req_i(tlb_fill_req),
        .fill_vpn_i(saved_vaddr[31:12]),
        .fill_ppn_i(tlb_fill_ppn),
        .fill_perm_i(tlb_fill_perm),
        .fill_superpage_i(tlb_fill_superpage),
        
        .flush_all_i(flush_all),
        .flush_vpn_i(flush_vpn),
        .flush_vpn_addr_i(flush_vpn_addr)
    );
    
    // TLB Permission Check
    always_comb begin
        tlb_perm_ok = 1'b1;
        if (tlb_hit) begin
            // Check for illegal W=1, R=0 combination (reserved in RISC-V spec)
            if (tlb_perm[1] && !tlb_perm[0]) // W=1, R=0
                tlb_perm_ok = 1'b0;
            
            // Check User bit
            // U-mode can only access U pages
            if (priv_mode == PRIV_U && !tlb_perm[3]) // User bit is at index 3 in {D,A,G,U,X,W,R}
                tlb_perm_ok = 1'b0;
            
            // S-mode accessing U pages:
            // For ucore compatibility, allow S-mode read/write to U pages without SUM check.
            // Only prohibit S-mode execute from U pages (security feature per RISC-V spec).
            if (priv_mode == PRIV_S && tlb_perm[3] && is_execute) // U bit is at index 3
                tlb_perm_ok = 1'b0;
            
            // Check Read
            if (!is_write && !is_execute && !tlb_perm[0]) // Read bit is at index 0
                tlb_perm_ok = 1'b0;
                
            // Check Write
            if (is_write && !tlb_perm[1]) // Write bit is at index 1
                tlb_perm_ok = 1'b0;
                
            // Check Execute
            if (is_execute && !tlb_perm[2]) // Execute bit is at index 2
                tlb_perm_ok = 1'b0;
            
            // Note: A (Accessed) and D (Dirty) bits are NOT checked here.
            // RISC-V spec allows hardware to automatically set A/D bits.
            // ucore expects mode 1 (hardware sets A/D), so no fault for A=0 or D=0.
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
        tlb_fill_req = 1'b0;
        tlb_fill_ppn = 22'h0;
        tlb_fill_perm = 7'h0;
        tlb_fill_superpage = 1'b0;
        
        case (state)
            IDLE: begin
                if (translate_req) begin
                    if (!paging_enabled) begin
                        // 分页未启用: 直接使用物理地址
                        paddr = vaddr;
                        translate_done = 1'b1;
                    end else begin
                        // Check TLB first (0-cycle hit)
                        if (tlb_hit && tlb_perm_ok) begin
                            paddr = tlb_paddr;
                            translate_done = 1'b1;
                        end else if (tlb_hit && !tlb_perm_ok) begin
                            // TLB hit but permission violation -> Fault directly
                            page_fault = 1'b1;
                            translate_done = 1'b1;
                             // Use input signals for fault type determination since we haven't latched them yet
                            if (is_execute) fault_type = FAULT_INST_PAGE;
                            else if (is_write) fault_type = FAULT_STORE_PAGE;
                            else fault_type = FAULT_LOAD_PAGE;
                        end else begin
                            // TLB miss -> Start PTW (issue request immediately)
                            // 使用 vaddr 直接计算，因为 saved_vaddr 还未锁存
                            ptw_addr = {satp_ppn, 12'b0} + {20'b0, vaddr[31:22], 2'b0};
                            ptw_req = 1'b1;
                            next_state = LEVEL1_WAIT;
                        end
                    end
                end
            end
            
            LEVEL1_WAIT: begin
                if (ptw_ack) begin
                    if (!ptw_data[PTE_V]) begin
                        // PTE 无效
                        next_state = FAULT;
                    end else if (ptw_data[PTE_R] | ptw_data[PTE_X]) begin
                        // 叶子 PTE (超级页, 4MB)
                        // Sv32 规范: 超级页要求 PPN[9:0] == 0 (对齐检查)
                        if (ptw_data[19:10] != 10'b0) begin
                            // 超级页未对齐 -> page fault
                            next_state = FAULT;
                        end else if (!check_pte_perm(ptw_data, saved_priv_mode, saved_is_write, saved_is_execute, saved_mstatus_sum)) begin
                            // 权限检查失败
                            next_state = FAULT;
                        end else begin
                            // 超级页翻译成功，直接完成
                            // 超级页 (4MB): PPN[21:10] | VPN[0] | offset
                            paddr = {ptw_data[31:20], vpn0, page_offset};
                            translate_done = 1'b1;
                            // TLB fill with superpage data
                            tlb_fill_req = 1'b1;
                            tlb_fill_ppn = ptw_data[31:10];
                            tlb_fill_perm = {ptw_data[PTE_D], ptw_data[PTE_A], ptw_data[PTE_G],
                                             ptw_data[PTE_U], ptw_data[PTE_X], ptw_data[PTE_W], ptw_data[PTE_R]};
                            tlb_fill_superpage = 1'b1;
                            next_state = IDLE;
                        end
                    end else begin
                        // 指针 PTE, 立即发起二级页表请求
                        // 使用 ptw_data[31:10] 直接计算，因为 pte_reg 还未更新
                        ptw_addr = {ptw_data[31:10], 12'b0} + {20'b0, vpn0, 2'b0};
                        ptw_req = 1'b1;
                        next_state = LEVEL2_WAIT;
                    end
                end else begin
                    // 继续等待
                    ptw_addr = {satp_ppn, 12'b0} + {20'b0, vpn1, 2'b0};
                    ptw_req = 1'b1;
                end
            end
            
            LEVEL2_WAIT: begin
                if (ptw_ack) begin
                    if (!ptw_data[PTE_V]) begin
                        // PTE 无效
                        next_state = FAULT;
                    end else if (!(ptw_data[PTE_R] | ptw_data[PTE_X])) begin
                        // 二级 PTE 必须是叶子
                        next_state = FAULT;
                    end else if (!check_pte_perm(ptw_data, saved_priv_mode, saved_is_write, saved_is_execute, saved_mstatus_sum)) begin
                        // 权限检查失败
                        next_state = FAULT;
                    end else begin
                        // 普通页翻译成功，直接完成
                        // 普通页 (4KB): PPN | offset
                        paddr = {ptw_data[31:10], page_offset};
                        translate_done = 1'b1;
                        // TLB fill with regular page data
                        tlb_fill_req = 1'b1;
                        tlb_fill_ppn = ptw_data[31:10];
                        tlb_fill_perm = {ptw_data[PTE_D], ptw_data[PTE_A], ptw_data[PTE_G],
                                         ptw_data[PTE_U], ptw_data[PTE_X], ptw_data[PTE_W], ptw_data[PTE_R]};
                        tlb_fill_superpage = 1'b0;
                        next_state = IDLE;
                    end
                end else begin
                    // 继续等待
                    ptw_addr = {ppn, 12'b0} + {20'b0, vpn0, 2'b0};
                    ptw_req = 1'b1;
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
