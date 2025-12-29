# FENCE.I Debug Test with Paging (v3)
# 简化测试: 仅验证分页下 fence.i 是否工作
# 预期输出: "PAXBY"

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000

# PTE flags
.equ PTE_V, 0x01
.equ PTE_R, 0x02
.equ PTE_W, 0x04
.equ PTE_X, 0x08
.equ PTE_G, 0x20
.equ PTE_A, 0x40
.equ PTE_D, 0x80
.equ PTE_ALL, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_G | PTE_A | PTE_D)  # 0xEF

_start:
    li      t0, MAGIC_PRINT
    
    # === 'P' ===
    li      t1, 'P'
    sw      t1, 0(t0)
    
    # ============================================
    # 构建页表 (Sv32 megapages)
    # 页表基址 0x80100000
    # ============================================
    # Entry 512 (offset 0x800): 0x80000000 -> 0x80000000
    lui     t2, 0x80100         # t2 = 0x80100000
    lui     t3, 0x20000         # PPN[31:12] << 10 for PA=0x80000000
    ori     t3, t3, PTE_ALL
    li      t4, 0x800           # offset for entry 512
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # Entry 513 (offset 0x804): 0x80400000 -> 0x80400000
    lui     t3, 0x20100         # PPN for PA=0x80400000
    ori     t3, t3, PTE_ALL
    sw      t3, 4(t5)
    
    # Entry 576 (offset 0x900): 0x90000000 -> 0x90000000
    lui     t3, 0x24000         # PPN for PA=0x90000000
    ori     t3, t3, PTE_ALL
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # ============================================
    # 启用分页 (Sv32)
    # satp = 0x80000000 | (0x80100000 >> 12)
    # ============================================
    sfence.vma  zero, zero
    
    lui     t3, 0x80080         # 0x80080000
    ori     t3, t3, 0x100       # 0x80080100 = MODE + PPN=0x80100
    csrw    satp, t3
    
    fence.i
    sfence.vma  zero, zero
    
    # === 'A' ===
    li      t1, 'A'
    sw      t1, 0(t0)
    
    # ============================================
    # 调用原始函数
    # ============================================
    jal     ra, modifiable_func     # 应输出 'X'
    
    # === 'B' ===
    li      t1, 'B'
    sw      t1, 0(t0)
    
    # ============================================
    # 修改代码
    # ============================================
    la      t2, modifiable_func
    li      t3, 0x05900313      # li t1, 'Y'
    sw      t3, 0(t2)
    
    # ============================================
    # FENCE.I
    # ============================================
    fence.i
    
    # ============================================
    # 调用修改后的函数
    # ============================================
    jal     ra, modifiable_func     # 应输出 'Y'
    
    # === '\n' ===
    li      t1, '\n'
    sw      t1, 0(t0)

done:
    j       done

.align 4
modifiable_func:
    li      t1, 'X'
    sw      t1, 0(t0)
    ret
