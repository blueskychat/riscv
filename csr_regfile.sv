`include "defines.sv"

// csr_regfile.sv - CSR 寄存器模块
// 实现 Machine 模式 CSR 和 PMP 寄存器
module csr_regfile (
    input  wire logic        clk,
    input  wire logic        rst,
    
    // CSR 读写接口 (来自 EX 阶段)
    input  wire logic [11:0] csr_addr,      // CSR 地址
    input  wire csr_op_t     csr_op,        // CSR 操作类型
    input  wire logic [31:0] csr_wdata,     // 写入数据 (rs1 或 zimm)
    output logic [31:0]      csr_rdata,     // 读取数据
    
    // 异常/中断接口
    input  wire logic        trap_enter,    // 进入异常
    input  wire logic [31:0] trap_cause,    // 异常/中断原因
    input  wire logic [31:0] trap_pc,       // 异常发生时的 PC
    input  wire logic [31:0] trap_val,      // 异常值 (mtval)
    output logic [31:0]      mtvec_out,     // mtvec 输出 (异常入口地址)
    output logic [31:0]      mepc_out,      // mepc 输出 (异常返回地址)
    
    // mret 接口
    input  wire logic        mret_exec,     // 执行 mret 指令
    input  wire logic        sret_exec,     // 执行 sret 指令
    
    // 中断输入
    input  wire logic        timer_interrupt, // Timer 中断信号
    input  wire logic [63:0] mtime_i,         // mtime 值 (Zicntr: time/timeh CSR)
    
    // 中断使能输出
    output logic             mie_mtie,      // Timer 中断使能
    output logic             mstatus_mie,   // 全局中断使能
    
    // 当前特权模式
    output logic [1:0]       priv_mode,     // 当前特权级
    
    //PMP 配置输出 (用于内存访问权限检查)
    output logic [31:0]      pmpcfg0_out,   // PMP 配置寄存器 0
    output logic [31:0]      pmpaddr0_out,  // PMP 地址寄存器 0
    
    // satp 输出 (用于分页)
    output logic [31:0]      satp_out,      // satp 寄存器完整值
    output logic             paging_enabled, // 分页是否启用 (satp.MODE == 1)
    
    // sepc 输出 (用于 SRET)
    output logic [31:0]      sepc_out       // sepc 输出 (S-mode 异常返回地址)
);

    // ==================== CSR 寄存器 ====================
    
    // Machine Mode CSRs
    logic [31:0] mstatus;    // Machine Status
    logic [31:0] mie;        // Machine Interrupt Enable
    logic [31:0] mtvec;      // Machine Trap Vector
    logic [31:0] mscratch;   // Machine Scratch
    logic [31:0] mepc;       // Machine Exception PC
    logic [31:0] mcause;     // Machine Cause
    logic [31:0] mtval;      // Machine Trap Value
    
    // mip (Machine Interrupt Pending) - 部分由硬件设置，部分可软件写入
    logic [31:0] mip_sw;     // 软件可写部分 (STIP, SSIP 等)
    logic [31:0] mip;        // 组合后的 mip (硬件 | 软件)
    
    // 委托寄存器
    logic [31:0] mideleg;    // Machine Interrupt Delegation
    logic [31:0] medeleg;    // Machine Exception Delegation
    
    // PMP CSRs
    logic [31:0] pmpcfg0;    // PMP Config 0
    logic [31:0] pmpaddr0;   // PMP Address 0
    
    // Supervisor CSRs (用于分页和 SRET)
    logic [31:0] satp;       // Supervisor Address Translation and Protection
    logic [31:0] sstatus;    // Supervisor Status
    logic [31:0] stvec;      // Supervisor Trap Vector
    logic [31:0] sscratch;   // Supervisor Scratch
    logic [31:0] sepc;       // Supervisor Exception PC
    logic [31:0] scause;     // Supervisor Cause
    logic [31:0] stval;      // Supervisor Trap Value
    
    // 特权模式 (0=U, 3=M)
    logic [1:0] current_priv;
    
    // ==================== 输出赋值 ====================
    
    assign mtvec_out = mtvec;
    assign mepc_out = mepc;
    assign mie_mtie = mie[MIE_MTIE_BIT];
    assign mstatus_mie = mstatus[MSTATUS_MIE_BIT];
    assign priv_mode = current_priv;
    
    // PMP 输出
    assign pmpcfg0_out = pmpcfg0;
    assign pmpaddr0_out = pmpaddr0;
    
    // satp 输出
    assign satp_out = satp;
    assign paging_enabled = satp[31] && (current_priv != PRIV_M);  // Sv32: bit 31 = MODE (1 = 启用分页), disabled in M-mode
    
    // sepc 输出 (SRET)
    assign sepc_out = sepc;
    
    // ==================== CSR 读取逻辑 ====================
    
    // mip 组合：硬件位 (MTIP) + 软件可写位 (STIP, SSIP)
    always_comb begin
        mip = mip_sw;  // 先取软件写入的值
        mip[MIP_MTIP_BIT] = timer_interrupt;  // MTIP 由硬件覆盖 (只读)
    end
    
    // sie/sip 是 mie/mip 的 S 模式视图 (只显示 S 模式相关的位)
    // S 模式可见的中断位掩码: SSIP(1), STIP(5), SEIP(9)
    localparam S_INT_MASK = (1 << MIP_SSIP_BIT) | (1 << MIP_STIP_BIT) | (1 << MIP_SEIP_BIT);
    
    always_comb begin
        case (csr_addr)
            CSR_MSTATUS:   csr_rdata = mstatus;
            CSR_MIE:       csr_rdata = mie;
            CSR_MTVEC:     csr_rdata = mtvec;
            CSR_MSCRATCH:  csr_rdata = mscratch;
            CSR_MEPC:      csr_rdata = mepc;
            CSR_MCAUSE:    csr_rdata = mcause;
            CSR_MTVAL:     csr_rdata = mtval;
            CSR_MIP:       csr_rdata = mip;
            CSR_MHARTID:   csr_rdata = 32'h0;  // Hart ID, 只读, 恒为 0
            CSR_MIDELEG:   csr_rdata = mideleg;
            CSR_MEDELEG:   csr_rdata = medeleg;
            CSR_PMPCFG0:   csr_rdata = pmpcfg0;
            CSR_PMPADDR0:  csr_rdata = pmpaddr0;
            CSR_SATP:      csr_rdata = satp;
            // Supervisor CSRs
            CSR_SSTATUS:   csr_rdata = sstatus;
            CSR_SIE:       csr_rdata = mie & S_INT_MASK;   // sie 是 mie 的子集视图
            CSR_SIP:       csr_rdata = mip & S_INT_MASK;   // sip 是 mip 的子集视图
            CSR_STVEC:     csr_rdata = stvec;
            CSR_SSCRATCH:  csr_rdata = sscratch;
            CSR_SEPC:      csr_rdata = sepc;
            CSR_SCAUSE:    csr_rdata = scause;
            CSR_STVAL:     csr_rdata = stval;
            // Zicntr: time/timeh (read-only, mapped from mtime)
            CSR_TIME:      csr_rdata = mtime_i[31:0];
            CSR_TIMEH:     csr_rdata = mtime_i[63:32];
            default:       csr_rdata = 32'h0;
        endcase
    end
    
    // ==================== CSR 写入数据计算 ====================
    
    logic [31:0] csr_new_value;
    
    always_comb begin
        case (csr_op)
            CSR_OP_RW, CSR_OP_RWI: csr_new_value = csr_wdata;
            CSR_OP_RS, CSR_OP_RSI: csr_new_value = csr_rdata | csr_wdata;
            CSR_OP_RC, CSR_OP_RCI: csr_new_value = csr_rdata & ~csr_wdata;
            default:               csr_new_value = csr_rdata;
        endcase
    end
    
    // ==================== CSR 写入逻辑 ====================
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // 复位值
            mstatus   <= 32'h0000_1800;  // MPP = M-mode (11)
            mie       <= 32'h0;
            mtvec     <= 32'h0;
            mscratch  <= 32'h0;
            mepc      <= 32'h0;
            mcause    <= 32'h0;
            mtval     <= 32'h0;
            mip_sw    <= 32'h0;          // 软件可写的中断 pending 位
            mideleg   <= 32'h0;          // 中断委托寄存器
            medeleg   <= 32'h0;          // 异常委托寄存器
            pmpcfg0   <= 32'h0;
            pmpaddr0  <= 32'h0;
            satp      <= 32'h0;  // 复位时分页关闭
            // S-mode CSR 复位值
            sstatus   <= 32'h0;
            stvec     <= 32'h0;
            sscratch  <= 32'h0;
            sepc      <= 32'h0;
            scause    <= 32'h0;
            stval     <= 32'h0;
            current_priv <= PRIV_M;  // 复位后进入 M 模式
            
        end else if (trap_enter) begin
            // ========== 进入异常/中断 ==========
            // 保存当前 PC 到 mepc
            mepc <= trap_pc;
            // 保存异常原因到 mcause
            mcause <= trap_cause;
            // 保存异常值到 mtval
            mtval <= trap_val;
            // 保存当前 MIE 到 MPIE，清除 MIE
            mstatus[MSTATUS_MPIE_BIT] <= mstatus[MSTATUS_MIE_BIT];
            mstatus[MSTATUS_MIE_BIT] <= 1'b0;
            // 保存当前特权级到 MPP
            mstatus[MSTATUS_MPP_HI:MSTATUS_MPP_LO] <= current_priv;
            // 切换到 M 模式
            current_priv <= PRIV_M;
            
        end else if (mret_exec) begin
            // ========== mret 返回 ==========
            // 恢复 MIE = MPIE
            mstatus[MSTATUS_MIE_BIT] <= mstatus[MSTATUS_MPIE_BIT];
            // 设置 MPIE = 1
            mstatus[MSTATUS_MPIE_BIT] <= 1'b1;
            // 恢复特权级 = MPP
            current_priv <= mstatus[MSTATUS_MPP_HI:MSTATUS_MPP_LO];
            // 设置 MPP = U (如果支持 U 模式)
            mstatus[MSTATUS_MPP_HI:MSTATUS_MPP_LO] <= PRIV_U;
            
        end else if (sret_exec) begin
            // ========== sret 返回 (S-mode) ==========
            // 恢复 SIE = SPIE
            sstatus[SSTATUS_SIE_BIT] <= sstatus[SSTATUS_SPIE_BIT];
            // 设置 SPIE = 1
            sstatus[SSTATUS_SPIE_BIT] <= 1'b1;
            // 恢复特权级 = SPP (1=S, 0=U)
            current_priv <= {1'b0, sstatus[SSTATUS_SPP_BIT]};
            // 设置 SPP = U
            sstatus[SSTATUS_SPP_BIT] <= 1'b0;
            
        end else if (csr_op != CSR_OP_NONE) begin
            // ========== 正常 CSR 写入 ==========
            case (csr_addr)
                CSR_MSTATUS:  begin
                    // mstatus 只有部分位可写
                    mstatus[MSTATUS_MIE_BIT]  <= csr_new_value[MSTATUS_MIE_BIT];
                    mstatus[MSTATUS_MPIE_BIT] <= csr_new_value[MSTATUS_MPIE_BIT];
                    mstatus[MSTATUS_MPP_HI:MSTATUS_MPP_LO] <= csr_new_value[MSTATUS_MPP_HI:MSTATUS_MPP_LO];
                end
                CSR_MIE:      mie <= csr_new_value;
                CSR_MTVEC:    mtvec <= csr_new_value;  // 保留 MODE 位 (bits 0-1)
                CSR_MSCRATCH: mscratch <= csr_new_value;
                CSR_MEPC:     mepc <= {csr_new_value[31:2], 2'b00};   // 4字节对齐
                CSR_MCAUSE:   mcause <= csr_new_value;
                CSR_MTVAL:    mtval <= csr_new_value;
                CSR_MIP:      begin
                    // mip: 只有 STIP 和 SSIP 可由 M 模式软件写入
                    // MTIP 是硬件只读的
                    mip_sw[MIP_STIP_BIT] <= csr_new_value[MIP_STIP_BIT];
                    mip_sw[MIP_SSIP_BIT] <= csr_new_value[MIP_SSIP_BIT];
                end
                CSR_MIDELEG:  mideleg <= csr_new_value;
                CSR_MEDELEG:  medeleg <= csr_new_value;
                CSR_PMPCFG0:  pmpcfg0 <= csr_new_value;
                CSR_PMPADDR0: pmpaddr0 <= csr_new_value;
                CSR_SATP:     satp <= csr_new_value;
                // Supervisor CSRs
                CSR_SSTATUS:  begin
                    sstatus[SSTATUS_SIE_BIT]  <= csr_new_value[SSTATUS_SIE_BIT];
                    sstatus[SSTATUS_SPIE_BIT] <= csr_new_value[SSTATUS_SPIE_BIT];
                    sstatus[SSTATUS_SPP_BIT]  <= csr_new_value[SSTATUS_SPP_BIT];
                end
                CSR_SIE:      begin
                    // sie 写入实际影响 mie 的 S 模式位
                    mie[MIE_SSIE_BIT] <= csr_new_value[MIE_SSIE_BIT];
                    mie[MIE_STIE_BIT] <= csr_new_value[MIE_STIE_BIT];
                    mie[MIE_SEIE_BIT] <= csr_new_value[MIE_SEIE_BIT];
                end
                CSR_SIP:      begin
                    // sip 写入: 只有 SSIP 可由 S 模式写入
                    mip_sw[MIP_SSIP_BIT] <= csr_new_value[MIP_SSIP_BIT];
                end
                CSR_STVEC:    stvec <= csr_new_value;
                CSR_SSCRATCH: sscratch <= csr_new_value;
                CSR_SEPC:     sepc <= {csr_new_value[31:2], 2'b00};  // 4字节对齐
                CSR_SCAUSE:   scause <= csr_new_value;
                CSR_STVAL:    stval <= csr_new_value;
                default: ;
            endcase
        end
    end

endmodule
