# CSR Test - Phase 1 验证 (使用 Magic Address 快速输出)
# 输出到 0x90000000

.section .text
.global _start

.equ MAGIC_ADDR, 0x90000000
.equ CSR_MTVEC,    0x305
.equ CSR_MSCRATCH, 0x340
.equ CSR_MIE,      0x304

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出 "CSR "
    li t0, 'C'
    sb t0, 0(s0)
    li t0, 'S'
    sb t0, 0(s0)
    li t0, 'R'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 测试 1: CSRRW - 写入 mtvec ==========
    li t0, 0x80001000
    nop                         # 添加 NOP 确保 t0 值就绪
    nop
    csrrw t1, CSR_MTVEC, t0     # mtvec = t0
    
    csrr t2, CSR_MTVEC
    li t3, 0x80001000
    beq t2, t3, test1_pass
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
    
    # ========== 测试 2: CSRRS - 置位 ==========
    csrw CSR_MSCRATCH, zero     # 先清零
    li t0, 0x11
    nop
    nop
    csrrs t1, CSR_MSCRATCH, t0  # mscratch |= 0x11
    
    csrr t2, CSR_MSCRATCH
    li t3, 0x11
    beq t2, t3, test2_pass
    li t0, '2'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)
    j test3
test2_pass:
    li t0, '2'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)

test3:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 3: CSRRC - 清位 ==========
    li t0, 0x01
    nop
    nop
    csrrc t1, CSR_MSCRATCH, t0  # mscratch &= ~0x01
    
    csrr t2, CSR_MSCRATCH
    li t3, 0x10
    beq t2, t3, test3_pass
    li t0, '3'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)
    j test4
test3_pass:
    li t0, '3'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)

test4:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 4: CSRRWI - 立即数 ==========
    csrwi CSR_MIE, 0x08
    csrr t2, CSR_MIE
    li t3, 0x08
    beq t2, t3, test4_pass
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)
    j test5
test4_pass:
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)

test5:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 5: CSRRSI - 立即数置位 ==========
    csrrsi t1, CSR_MIE, 0x10
    csrr t2, CSR_MIE
    li t3, 0x18
    beq t2, t3, test5_pass
    li t0, '5'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)
    j done
test5_pass:
    li t0, '5'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)

done:
    li t0, '\n'
    sb t0, 0(s0)

loop:
    j loop
