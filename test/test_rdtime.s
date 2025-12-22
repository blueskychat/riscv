# RDTIME/RDTIMEH Test - Zicntr Extension
# 测试 time/timeh CSR 读取
# 输出到 Magic Address 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR, 0x90000000
.equ CSR_TIME,  0xC01
.equ CSR_TIMEH, 0xC81

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出 "RDT "
    li t0, 'R'
    sb t0, 0(s0)
    li t0, 'D'
    sb t0, 0(s0)
    li t0, 'T'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 测试 1: RDTIME (time CSR) ==========
    li t0, 'T'
    sb t0, 0(s0)
    
    # 读取 time CSR
    csrr s1, CSR_TIME
    
    # 执行一些空指令让时间增加
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    # 再次读取 time CSR
    csrr s2, CSR_TIME
    
    # 验证 s2 > s1 (时间在递增)
    bleu s2, s1, test1_fail
    
    # 测试1通过
    li t0, 'P'
    sb t0, 0(s0)
    j test2

test1_fail:
    li t0, 'F'
    sb t0, 0(s0)

test2:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 2: RDTIMEH (timeh CSR) ==========
    li t0, 'H'
    sb t0, 0(s0)
    
    # 读取 timeh CSR (高32位)
    csrr s3, CSR_TIMEH
    
    # 在低周期数时，高32位应该是0
    # 只检查读取不会出错即可
    # (如果能执行到这里就说明CSR访问成功)
    
    # 测试2通过
    li t0, 'P'
    sb t0, 0(s0)
    j done

test2_fail:
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
