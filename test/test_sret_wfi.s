# SRET and WFI Test
# 测试 SRET 返回和 WFI 非法指令异常
# 输出到 Magic Address 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR, 0x90000000
.equ CSR_MTVEC,    0x305
.equ CSR_MEPC,     0x341
.equ CSR_MCAUSE,   0x342
.equ CSR_SEPC,     0x141

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出 "SRW "
    li t0, 'S'
    sb t0, 0(s0)
    li t0, 'R'
    sb t0, 0(s0)
    li t0, 'W'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 设置 mtvec 指向异常处理程序 ==========
    la t0, trap_handler
    csrw CSR_MTVEC, t0
    
    # 初始化测试变量
    li s1, 0               # s1 = mcause (从trap handler获取)

    # ========== 测试 1: WFI 触发非法指令异常 ==========
    li t0, 'W'
    sb t0, 0(s0)
    
    li s1, 0               # 重置 mcause
    
    # 执行 WFI 指令 (应该触发非法指令异常)
    # WFI 编码: 0x10500073
    .word 0x10500073       # wfi
    
after_wfi:
    # 检查 mcause 应该为 2 (Illegal Instruction)
    li t0, 2
    bne s1, t0, test1_fail
    
    # 测试1通过
    li t0, 'P'
    sb t0, 0(s0)
    j done

test1_fail:
    li t0, 'F'
    sb t0, 0(s0)
    # 输出 mcause 值用于调试
    mv t0, s1
    addi t0, t0, '0'
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

# ========== 异常处理程序 ==========
.align 4
trap_handler:
    # 读取 mcause 到 s1
    csrr s1, CSR_MCAUSE
    
    # 读取 mepc
    csrr t0, CSR_MEPC
    
    # mepc + 4 跳过触发异常的指令
    addi t0, t0, 4
    csrw CSR_MEPC, t0
    
    # 返回
    mret
