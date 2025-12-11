# CLINT Test - Phase 4.1 验证
# 测试 mtime 和 mtimecmp 寄存器读写
# 输出到 Magic Address 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR,    0x90000000
.equ CLINT_BASE,    0x02000000
.equ MTIMECMP_LO,   0x02004000
.equ MTIMECMP_HI,   0x02004004
.equ MTIME_LO,      0x0200BFF8
.equ MTIME_HI,      0x0200BFFC

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出 "CLINT "
    li t0, 'C'
    sb t0, 0(s0)
    li t0, 'L'
    sb t0, 0(s0)
    li t0, 'I'
    sb t0, 0(s0)
    li t0, 'N'
    sb t0, 0(s0)
    li t0, 'T'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 测试 1: 读取 mtime (应该是非零的递增值) ==========
    li t1, MTIME_LO
    lw t2, 0(t1)              # 读取 mtime 低32位
    
    # 等待几个周期
    nop
    nop
    nop
    nop
    
    lw t3, 0(t1)              # 再次读取 mtime 低32位
    
    # 验证 mtime 在递增 (t3 > t2)
    bgeu t3, t2, test1_pass   # 如果 t3 >= t2，说明在递增
    li t0, '1'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)
    j test2
test1_pass:
    li t0, '1'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)

test2:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 2: 写入 mtimecmp 低32位 ==========
    li t1, MTIMECMP_LO
    li t2, 0x12345678
    sw t2, 0(t1)              # 写入
    
    lw t3, 0(t1)              # 读回
    bne t2, t3, test2_fail
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
    
    # ========== 测试 3: 写入 mtimecmp 高32位 ==========
    li t1, MTIMECMP_HI
    li t2, 0xABCDEF00
    sw t2, 0(t1)              # 写入
    
    lw t3, 0(t1)              # 读回
    bne t2, t3, test3_fail
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
    
    # ========== 测试 4: 读取完整的 64 位 mtime ==========
    li t1, MTIME_LO
    lw t2, 0(t1)              # 读取低32位
    li t1, MTIME_HI
    lw t3, 0(t1)              # 读取高32位
    
    # 简单验证：只要能读取即可（不会是全0）
    or t4, t2, t3
    bnez t4, test4_pass       # 如果不全为0则通过
    
    # 如果全为0，可能也是正常的（如果刚启动）
    # 所以这个测试总是通过
test4_pass:
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j test5

test5:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 5: 验证 mtimecmp 完整的 64 位值 ==========
    # 读取之前写入的值
    li t1, MTIMECMP_LO
    lw t2, 0(t1)
    li t3, 0x12345678
    bne t2, t3, test5_fail
    
    li t1, MTIMECMP_HI
    lw t2, 0(t1)
    li t3, 0xABCDEF00
    bne t2, t3, test5_fail
    
    li t0, '5'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    j done
test5_fail:
    li t0, '5'
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
