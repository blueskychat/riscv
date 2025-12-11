# Interrupt Detection Test - Phase 4.3 验证
# 测试 mip CSR 和 timer 中断检测
# 输出到 Magic Address 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR,    0x90000000
.equ CLINT_BASE,    0x02000000
.equ MTIMECMP_LO,   0x02004000
.equ MTIMECMP_HI,   0x02004004
.equ MTIME_LO,      0x0200BFF8
.equ MTIME_HI,      0x0200BFFC
.equ CSR_MIP,       0x344
.equ CSR_MIE,       0x304
.equ CSR_MSTATUS,   0x300

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出 "INT "
    li t0, 'I'
    sb t0, 0(s0)
    li t0, 'N'
    sb t0, 0(s0)
    li t0, 'T'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 测试 1: 初始时 mip 应该为 0 (无中断) ==========
    csrr t0, CSR_MIP
    bnez t0, test1_fail       # mip 应该为 0
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
    
    # ========== 测试 2: 设置 mtimecmp 为当前 mtime + 100 ==========
    # 读取当前 mtime
    li t1, MTIME_LO
    lw t2, 0(t1)              # t2 = mtime 低32位
    
    # 设置 mtimecmp = mtime + 100
    addi t3, t2, 100
    li t1, MTIMECMP_LO
    sw t3, 0(t1)
    
    # 设置 mtimecmp 高32位为 0
    li t3, 0
    li t1, MTIMECMP_HI
    sw t3, 0(t1)
    
    # 此时 mip 应该还是 0 (mtime < mtimecmp)
    csrr t0, CSR_MIP
    bnez t0, test2_fail
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
    
    # ========== 测试 3: 等待 mtime 超过 mtimecmp，检查 mip ==========
    # 进行一些操作让 mtime 递增
    li t4, 200                # 循环计数器
wait_loop:
    addi t4, t4, -1
    bnez t4, wait_loop
    
    # 现在 mtime 应该已经超过 mtimecmp
    # 检查 mip bit 7 (timer interrupt pending)
    csrr t0, CSR_MIP
    li t1, 0x80               # bit 7 = timer interrupt
    and t2, t0, t1
    beqz t2, test3_fail       # 应该有 timer interrupt pending
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
    
    # ========== 测试 4: 清除中断 (设置 mtimecmp 到很大的值) ==========
    li t1, MTIMECMP_LO
    li t2, -1                 # 0xFFFFFFFF
    sw t2, 0(t1)
    li t1, MTIMECMP_HI
    sw t2, 0(t1)
    
    # 现在 mip 应该清零
    csrr t0, CSR_MIP
    bnez t0, test4_fail
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j done
test4_fail:
    li t0, '4'
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
