# PMP Test - Phase 3 验证
# 测试 PMP 寄存器读写
# 输出到 Magic Address 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR, 0x90000000
.equ CSR_PMPCFG0,  0x3A0
.equ CSR_PMPADDR0, 0x3B0

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出 "PMP "
    li t0, 'P'
    sb t0, 0(s0)
    li t0, 'M'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 测试 1: 写入 pmpcfg0 ==========
    # 设置 pmpcfg0 = 0x0F (TOR mode, RWX)
    li t0, 0x0F
    csrw CSR_PMPCFG0, t0
    
    # 读回验证
    csrr t1, CSR_PMPCFG0
    li t2, 0x0F
    bne t1, t2, test1_fail
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
    
    # ========== 测试 2: 写入 pmpaddr0 ==========
    # 设置 pmpaddr0 = 0xFFFFFFFF (全地址空间)
    li t0, -1              # -1 = 0xFFFFFFFF
    csrw CSR_PMPADDR0, t0
    
    # 读回验证
    csrr t1, CSR_PMPADDR0
    li t2, -1
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
    
    # ========== 测试 3: 使用 CSRRS 设置 pmpcfg0 位 ==========
    # 清零 pmpcfg0
    csrw CSR_PMPCFG0, zero
    
    # 使用 CSRRS 设置 bit 7 (Lock bit) 和 bit 0 (R)
    li t0, 0x81
    csrrs t1, CSR_PMPCFG0, t0    # 返回旧值 (应为 0)
    
    # 验证旧值
    bne t1, zero, test3_fail
    
    # 验证新值
    csrr t2, CSR_PMPCFG0
    li t3, 0x81
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
    
    # ========== 测试 4: 使用 CSRRC 清除 pmpcfg0 位 ==========
    # pmpcfg0 现在是 0x81, 清除 bit 0
    li t0, 0x01
    csrrc t1, CSR_PMPCFG0, t0    # 返回旧值 (应为 0x81)
    
    # 验证旧值
    li t2, 0x81
    bne t1, t2, test4_fail
    
    # 验证新值 (应为 0x80)
    csrr t2, CSR_PMPCFG0
    li t3, 0x80
    bne t2, t3, test4_fail
    
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
    
    # ========== 测试 5: pmpaddr0 地址变换验证 ==========
    # 设置一个特定地址值并验证读回
    li t0, 0x20000000       # 一个特定地址
    csrw CSR_PMPADDR0, t0
    csrr t1, CSR_PMPADDR0
    bne t0, t1, test5_fail
    
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
