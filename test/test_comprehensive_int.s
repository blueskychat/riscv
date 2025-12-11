# Comprehensive Interrupt and Exception Test
# 测试所有内核需要的中断和异常功能
# 输出到 Magic Address 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR,    0x90000000
.equ CLINT_BASE,    0x02000000
.equ MTIMECMP_LO,   0x02004000
.equ MTIMECMP_HI,   0x02004004
.equ MTIME_LO,      0x0200BFF8
.equ MTIME_HI,      0x0200BFFC

# CSR addresses
.equ CSR_MSTATUS,   0x300
.equ CSR_MIE,       0x304
.equ CSR_MTVEC,     0x305
.equ CSR_MSCRATCH,  0x340
.equ CSR_MEPC,      0x341
.equ CSR_MCAUSE,    0x342
.equ CSR_MTVAL,     0x343
.equ CSR_MIP,       0x344
.equ CSR_PMPCFG0,   0x3A0
.equ CSR_PMPADDR0,  0x3B0

# mstatus bits
.equ MSTATUS_MIE,   0x8
.equ MSTATUS_MPIE,  0x80
.equ MSTATUS_MPP,   0x1800

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出标题 "COMP "
    li t0, 'C'
    sb t0, 0(s0)
    li t0, 'O'
    sb t0, 0(s0)
    li t0, 'M'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== Test 1: mscratch CSR ==========
    li t0, 0xDEADBEEF
    csrw CSR_MSCRATCH, t0
    csrr t1, CSR_MSCRATCH
    bne t0, t1, test1_fail
    
    li t0, '1'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test2
test1_fail:
    li t0, '1'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test2:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 2: mstatus.MPP 读写 ==========
    # 设置 MPP = 11 (Machine mode)
    csrr t0, CSR_MSTATUS
    li t1, MSTATUS_MPP
    or t0, t0, t1
    csrw CSR_MSTATUS, t0
    
    # 读回验证
    csrr t1, CSR_MSTATUS
    li t2, MSTATUS_MPP
    and t1, t1, t2
    bne t1, t2, test2_fail
    
    li t0, '2'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test3
test2_fail:
    li t0, '2'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test3:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 3: PMP CSR 读写 ==========
    li t0, 0x0F              # NAPOT, RWX
    csrw CSR_PMPCFG0, t0
    li t0, 0xFFFFFFFF
    csrw CSR_PMPADDR0, t0
    
    csrr t1, CSR_PMPCFG0
    andi t1, t1, 0x0F
    li t2, 0x0F
    bne t1, t2, test3_fail
    
    li t0, '3'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test4
test3_fail:
    li t0, '3'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test4:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 4: ECALL 异常处理 ==========
    # 设置 mtvec
    la t0, trap_handler_ecall
    csrw CSR_MTVEC, t0
    
    # 清除测试标志
    li s1, 0
    
    # 触发 ecall (hardware saves PC to mepc)
    ecall
    
after_ecall:
    # 检查是否进入了异常处理
    li t0, 1
    bne s1, t0, test4_fail
    
    # 验证 mcause
    csrr t0, CSR_MCAUSE
    li t1, 11               # EX_ECALL_M
    bne t0, t1, test4_fail
    
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test5
test4_fail:
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test5:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 5: EBREAK 异常处理 ==========
    la t0, trap_handler_ebreak
    csrw CSR_MTVEC, t0
    
    li s1, 0
    
    ebreak
    
after_ebreak:
    li t0, 1
    bne s1, t0, test5_fail
    
    csrr t0, CSR_MCAUSE
    li t1, 3                # EX_BREAKPOINT
    bne t0, t1, test5_fail
    
    li t0, '5'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test6
test5_fail:
    li t0, '5'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test6:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 6: 非法指令异常 ==========
    la t0, trap_handler_illegal
    csrw CSR_MTVEC, t0
    
    li s1, 0
    
    # 这是一个非法指令
    .word 0xFFFFFFFF
    
after_illegal:
    li t0, 1
    bne s1, t0, test6_fail
    
    csrr t0, CSR_MCAUSE
    li t1, 2                # EX_ILLEGAL_INST
    bne t0, t1, test6_fail
    
    li t0, '6'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test7
test6_fail:
    li t0, '6'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test7:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 7: mtvec Direct 模式 ==========
    la t0, trap_handler_direct
    andi t0, t0, ~3         # 清除低2位，MODE=Direct
    csrw CSR_MTVEC, t0
    
    csrr t1, CSR_MTVEC
    andi t1, t1, 3
    bnez t1, test7_fail     # MODE 应该是 0
    
    li t0, '7'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test8
test7_fail:
    li t0, '7'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test8:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 8: mtvec Vectored 模式 ==========
    la t0, trap_handler_vectored
    ori t0, t0, 1           # MODE=Vectored
    csrw CSR_MTVEC, t0
    
    csrr t1, CSR_MTVEC
    andi t1, t1, 3
    li t2, 1
    bne t1, t2, test8_fail  # MODE 应该是 1
    
    li t0, '8'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test9
test8_fail:
    li t0, '8'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test9:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 9: Timer 中断 (完整流程) ==========
    # 设置 mtvec (Direct mode)
    la t0, trap_handler_timer
    csrw CSR_MTVEC, t0
    
    # 使能 Timer 中断
    li t0, 0x80             # MIE.MTIE
    csrw CSR_MIE, t0
    
    # 设置 mtimecmp
    li t1, MTIME_LO
    lw t2, 0(t1)
    addi t3, t2, 100
    li t1, MTIMECMP_LO
    sw t3, 0(t1)
    li t3, 0
    li t1, MTIMECMP_HI
    sw t3, 0(t1)
    
    # 使能全局中断
    li t0, MSTATUS_MIE
    csrs CSR_MSTATUS, t0
    
    # 清除标志
    li s1, 0
    
    # 等待中断
    li t4, 300
wait_timer:
    bnez s1, timer_received
    addi t4, t4, -1
    bnez t4, wait_timer
    j test9_fail
    
timer_received:
    # 验证 mcause
    csrr t0, CSR_MCAUSE
    li t1, 0x80000007       # Timer interrupt
    bne t0, t1, test9_fail
    
    li t0, '9'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test10
test9_fail:
    li t0, '9'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

test10:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== Test 10: mscratch 上下文切换 ==========
    # 模拟内核的 context switch
    li t0, 0x12345678
    csrw CSR_MSCRATCH, t0
    
    csrrw t1, CSR_MSCRATCH, zero  # 交换
    li t2, 0x12345678
    bne t1, t2, test10_fail
    
    csrr t3, CSR_MSCRATCH
    bnez t3, test10_fail
    
    li t0, 'A'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j done
test10_fail:
    li t0, 'A'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)

done:
    li t0, ' '
    sb t0, 0(s0)
    li t0, 'O'
    sb t0, 0(s0)
    li t0, 'K'
    sb t0, 0(s0)
    li t0, '\n'
    sb t0, 0(s0)

loop:
    j loop

# ==================== 异常处理程序 ====================
.align 4
trap_handler_ecall:
    li s1, 1
    # Skip ecall instruction (4 bytes)
    csrr t0, CSR_MEPC
    addi t0, t0, 4
    csrw CSR_MEPC, t0
    mret

.align 4
trap_handler_ebreak:
    li s1, 1
    # Skip ebreak instruction (4 bytes)
    csrr t0, CSR_MEPC
    addi t0, t0, 4
    csrw CSR_MEPC, t0
    mret

.align 4
trap_handler_illegal:
    li s1, 1
    # 跳过非法指令 (4字节)
    csrr t0, CSR_MEPC
    addi t0, t0, 4
    csrw CSR_MEPC, t0
    mret

.align 4
trap_handler_direct:
    mret

.align 8
trap_handler_vectored:
    .rept 64
    j trap_handler_vectored_entry
    .endr
trap_handler_vectored_entry:
    mret

.align 4
trap_handler_timer:
    li s1, 1
    # 清除 Timer 中断
    li t0, MTIMECMP_LO
    li t1, -1
    sw t1, 0(t0)
    li t0, MTIMECMP_HI
    sw t1, 0(t0)
    mret
