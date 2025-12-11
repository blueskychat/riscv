# Exception Test - Phase 2 验证
# 测试 ecall/ebreak/mret 异常处理
# 输出到 Magic Address 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR, 0x90000000
.equ CSR_MTVEC,    0x305
.equ CSR_MSCRATCH, 0x340
.equ CSR_MEPC,     0x341
.equ CSR_MCAUSE,   0x342

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出 "EXC "
    li t0, 'E'
    sb t0, 0(s0)
    li t0, 'X'
    sb t0, 0(s0)
    li t0, 'C'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 设置 mtvec 指向异常处理程序 ==========
    la t0, trap_handler
    csrw CSR_MTVEC, t0
    
    # 设置 mscratch 用于保存上下文
    li t0, 0x12345678
    csrw CSR_MSCRATCH, t0

    # ========== 测试 1: ecall ==========
    li s1, 0               # s1 = 测试结果标志
    li s2, 0               # s2 = 保存的 mepc 值
    ecall                  # 触发 ecall 异常
    
    # 从异常返回后检查
    li t0, 11              # 期望 mcause = 11 (M-mode ecall)
    bne s1, t0, test1_fail
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
    
    # ========== 测试 2: ebreak ==========
    li s1, 0
    li s2, 0
ebreak_inst:
    ebreak                 # 触发 ebreak 异常
    
    # 从异常返回后检查
    li t0, 3               # 期望 mcause = 3 (breakpoint)
    bne s1, t0, test2_fail
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
    
    # ========== 测试 3: 验证 mepc 保存正确 ==========
    # s2 保存了 trap_handler 中读取的 mepc 值
    # 应该等于 ebreak_inst 的地址
    la t0, ebreak_inst
    bne s2, t0, test3_fail
    li t0, '3'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j done
test3_fail:
    li t0, '3'
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

# ========== 异常处理程序 ==========
.align 4
trap_handler:
    # 读取 mcause 到 s1 (用于测试验证)
    csrr s1, CSR_MCAUSE
    
    # 读取 mepc 到 s2 (用于测试 3 验证)
    csrr s2, CSR_MEPC
    
    # mepc + 4 跳过触发异常的指令
    addi t0, s2, 4
    csrw CSR_MEPC, t0
    
    # 返回
    mret
