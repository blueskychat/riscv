# Fork Cross-Satp Test
# 精确模拟 ucore 的 fork 场景:
# 1. 在页表 A (内核) 上下文中复制代码
# 2. 切换到页表 B (子进程)
# 3. 在页表 B 下执行 fence.i
# 4. sret 到用户地址
#
# 这模拟 ucore 的流程：
# - copy_mm 在内核 satp 下复制
# - proc_run 切换到子进程 satp
# - forkrets 执行 fence.i
# - sret
#
# 预期输出: "MSPABswfUY\n"

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000

.equ PTE_V, 0x01
.equ PTE_R, 0x02
.equ PTE_W, 0x04
.equ PTE_X, 0x08
.equ PTE_U, 0x10
.equ PTE_A, 0x40
.equ PTE_D, 0x80
.equ PTE_ALL, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_A | PTE_D)
.equ PTE_USER, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_U | PTE_A | PTE_D)

# 页表地址
.equ PT_KERNEL, 0x80100000    # 内核页表 (用于复制)
.equ PT_CHILD, 0x80101000     # 子进程页表 (用于执行)
.equ PT_L2_USER, 0x80102000   # Level 2 页表 (子进程用户地址)

_start:
    li      t0, MAGIC_PRINT
    li      t1, 'M'
    sw      t1, 0(t0)
    
    la      t6, s_trap_handler
    csrw    stvec, t6
    
    # ============================================
    # 构建内核页表 (PT_KERNEL) - 只有内核地址
    # ============================================
    lui     t2, 0x80100
    
    # Entry 512: VA 0x80000000 -> PA 0x80000000
    lui     t3, 0x20000
    ori     t3, t3, PTE_ALL
    li      t4, 0x800
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # Entry 513: VA 0x80400000 -> PA 0x80400000
    lui     t3, 0x20100
    ori     t3, t3, PTE_ALL
    sw      t3, 4(t5)
    
    # Entry 576: VA 0x90000000 -> PA 0x90000000 (UART)
    lui     t3, 0x24000
    ori     t3, t3, PTE_ALL
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # ============================================
    # 构建子进程页表 (PT_CHILD) - 有用户地址
    # ============================================
    lui     t2, 0x80101
    
    # Entry 2: VA 0x00800000 -> Level 2 页表
    # PTE = (0x80102 << 10) | V = 0x20040800 | 1 = 0x20040801
    li      t3, 0x20040801      # PPN = 0x80102, V=1
    sw      t3, 8(t2)
    
    # Entry 512: VA 0x80000000 -> PA 0x80000000 (内核)
    lui     t3, 0x20000
    ori     t3, t3, PTE_ALL
    li      t4, 0x800
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # Entry 513
    lui     t3, 0x20100
    ori     t3, t3, PTE_ALL
    sw      t3, 4(t5)
    
    # Entry 576: UART
    lui     t3, 0x24000
    ori     t3, t3, PTE_USER    # 用户也能访问
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # ============================================
    # 构建 Level 2 页表 (PT_L2_USER)
    # ============================================
    lui     t2, 0x80102
    
    # Entry 0: VA 0x00800000 -> PA 0x80300000
    lui     t3, 0x200C0
    ori     t3, t3, PTE_USER
    sw      t3, 0(t2)
    
    # 设置 medeleg
    li      t3, (1 << 12) | (1 << 13) | (1 << 15)
    csrw    medeleg, t3
    
    # 切换到 S-mode
    csrr    t6, mstatus
    li      t5, ~(3 << 11)
    and     t6, t6, t5
    li      t5, (1 << 11)
    or      t6, t6, t5
    csrw    mstatus, t6
    
    la      t6, s_mode_entry
    csrw    mepc, t6
    mret

s_mode_entry:
    li      t0, MAGIC_PRINT
    li      t1, 'S'
    sw      t1, 0(t0)
    
    # ============================================
    # 启用分页 - 使用内核页表 (模拟内核执行 copy_mm)
    # ============================================
    sfence.vma  zero, zero
    lui     t3, 0x80080
    ori     t3, t3, 0x100       # PT_KERNEL
    csrw    satp, t3
    fence.i
    sfence.vma  zero, zero
    
    li      t1, 'P'
    sw      t1, 0(t0)
    
    li      t1, 'A'
    sw      t1, 0(t0)
    
    # ============================================
    # 在内核页表下复制代码到 PA 0x80300000
    # (模拟 copy_mm/copy_range)
    # ============================================
    la      a0, user_code
    lui     a1, 0x80300
    
    lw      t3, 0(a0)
    sw      t3, 0(a1)
    lw      t3, 4(a0)
    sw      t3, 4(a1)
    lw      t3, 8(a0)
    sw      t3, 8(a1)
    lw      t3, 12(a0)
    sw      t3, 12(a1)
    lw      t3, 16(a0)
    sw      t3, 16(a1)
    lw      t3, 20(a0)
    sw      t3, 20(a1)
    lw      t3, 24(a0)
    sw      t3, 24(a1)
    lw      t3, 28(a0)
    sw      t3, 28(a1)
    lw      t3, 32(a0)
    sw      t3, 32(a1)
    lw      t3, 36(a0)
    sw      t3, 36(a1)
    lw      t3, 40(a0)
    sw      t3, 40(a1)
    lw      t3, 44(a0)
    sw      t3, 44(a1)
    
    li      t1, 'B'
    sw      t1, 0(t0)
    
    # ============================================
    # 关键步骤: 切换到子进程页表 (模拟 proc_run)
    # 注意: 此时 fence.i 还没执行！
    # ============================================
    li      t1, 's'         # switch
    sw      t1, 0(t0)
    
    sfence.vma  zero, zero
    lui     t3, 0x80080
    ori     t3, t3, 0x101   # PT_CHILD
    csrw    satp, t3
    sfence.vma  zero, zero
    
    li      t1, 'w'         # switched
    sw      t1, 0(t0)
    
    # ============================================
    # 现在在子进程页表下执行 fence.i (模拟 forkrets)
    # ============================================
    li      t1, 'f'         # fence.i
    sw      t1, 0(t0)
    
    fence.i
    sfence.vma  zero, zero
    
    # ============================================
    # 设置 sret 参数
    # ============================================
    lui     t3, 0x00800
    csrw    sepc, t3
    
    csrr    t3, sstatus
    li      t4, ~(1 << 8)
    and     t3, t3, t4
    csrw    sstatus, t3
    
    li      t1, 'U'
    sw      t1, 0(t0)
    
    sret

.align 4
user_code:
    li      t0, 'Y'
    li      t1, MAGIC_PRINT
    sw      t0, 0(t1)
    li      t0, '\n'
    sw      t0, 0(t1)
user_done:
    j       user_done

s_trap_handler:
    li      t0, MAGIC_PRINT
    li      t1, 'T'
    sw      t1, 0(t0)
    
    csrr    t2, scause
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, 1f
    addi    t3, t3, ('A' - 10)
    j       2f
1:  addi    t3, t3, '0'
2:  sw      t3, 0(t0)
    
    li      t1, '='
    sw      t1, 0(t0)
    
    csrr    t2, sepc
    srli    t2, t2, 16
    
    srli    t3, t2, 12
    andi    t3, t3, 0xF
    li      t4, 10
    blt     t3, t4, 3f
    addi    t3, t3, ('A' - 10)
    j       4f
3:  addi    t3, t3, '0'
4:  sw      t3, 0(t0)
    
    srli    t3, t2, 8
    andi    t3, t3, 0xF
    li      t4, 10
    blt     t3, t4, 5f
    addi    t3, t3, ('A' - 10)
    j       6f
5:  addi    t3, t3, '0'
6:  sw      t3, 0(t0)
    
    srli    t3, t2, 4
    andi    t3, t3, 0xF
    li      t4, 10
    blt     t3, t4, 7f
    addi    t3, t3, ('A' - 10)
    j       8f
7:  addi    t3, t3, '0'
8:  sw      t3, 0(t0)
    
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, 9f
    addi    t3, t3, ('A' - 10)
    j       10f
9:  addi    t3, t3, '0'
10: sw      t3, 0(t0)
    
    li      t1, '\n'
    sw      t1, 0(t0)
    
trap_loop:
    j       trap_loop
