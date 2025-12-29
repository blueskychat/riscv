# Fork Dual Page Table Test
# 更精确地模拟 ucore fork 场景：
# 1. 创建两个独立的页表 (模拟父进程和子进程)
# 2. 在"父进程"页表下复制代码到新位置
# 3. 执行 fence.i
# 4. 切换到"子进程"页表 (sfence.vma + 写 satp)
# 5. sret 到子进程页表映射的代码
#
# 内存布局:
# 0x80000000 - 内核代码
# 0x80100000 - 页表 A (父进程) 
# 0x80101000 - 页表 B (子进程)
# 0x80300000 - 复制的用户代码
# 0x90000000 - UART
#
# 预期输出: "MSPABCRY\n"
#   M = M-mode start
#   S = S-mode entered  
#   P = Paging enabled (page table A)
#   A = Page table A active
#   B = Code copied, fence.i done
#   C = Switching to page table B (child)
#   R = Ready to sret
#   Y = sret SUCCESS - child code executed!

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000

# PTE flags
.equ PTE_V, 0x01
.equ PTE_R, 0x02
.equ PTE_W, 0x04
.equ PTE_X, 0x08
.equ PTE_U, 0x10
.equ PTE_G, 0x20
.equ PTE_A, 0x40
.equ PTE_D, 0x80
.equ PTE_ALL, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_G | PTE_A | PTE_D)

# 页表基址
.equ PT_A_BASE, 0x80100000  # 父进程页表
.equ PT_B_BASE, 0x80101000  # 子进程页表

_start:
    li      t0, MAGIC_PRINT
    
    # === 'M' - M-mode start ===
    li      t1, 'M'
    sw      t1, 0(t0)
    
    # ============================================
    # 设置 S-mode trap handler
    # ============================================
    la      t6, s_trap_handler
    csrw    stvec, t6
    
    # ============================================
    # 构建页表 A (父进程) - 基址 0x80100000
    # ============================================
    lui     t2, 0x80100         # t2 = PT_A_BASE
    
    # Entry 512 (offset 0x800): VA 0x80000000 -> PA 0x80000000
    lui     t3, 0x20000         # PPN for PA=0x80000000
    ori     t3, t3, PTE_ALL
    li      t4, 0x800
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # Entry 513 (offset 0x804): VA 0x80400000 -> PA 0x80400000
    lui     t3, 0x20100
    ori     t3, t3, PTE_ALL
    sw      t3, 4(t5)
    
    # Entry 576 (offset 0x900): VA 0x90000000 -> PA 0x90000000 (UART)
    lui     t3, 0x24000
    ori     t3, t3, PTE_ALL
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # ============================================
    # 构建页表 B (子进程) - 基址 0x80101000
    # 与页表 A 相同的映射，但这是独立的页表
    # ============================================
    lui     t2, 0x80101         # t2 = PT_B_BASE
    
    # Entry 512 (offset 0x800): VA 0x80000000 -> PA 0x80000000
    lui     t3, 0x20000
    ori     t3, t3, PTE_ALL
    li      t4, 0x800
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # Entry 513 (offset 0x804): VA 0x80400000 -> PA 0x80400000
    lui     t3, 0x20100
    ori     t3, t3, PTE_ALL
    sw      t3, 4(t5)
    
    # Entry 576 (offset 0x900): VA 0x90000000 -> PA 0x90000000 (UART)
    lui     t3, 0x24000
    ori     t3, t3, PTE_ALL
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # ============================================
    # 切换到 S-mode
    # ============================================
    csrr    t6, mstatus
    li      t5, ~(3 << 11)
    and     t6, t6, t5
    li      t5, (1 << 11)       # MPP = S-mode
    or      t6, t6, t5
    csrw    mstatus, t6
    
    la      t6, s_mode_entry
    csrw    mepc, t6
    mret

# ============================================
# S-Mode 入口
# ============================================
s_mode_entry:
    li      t0, MAGIC_PRINT
    
    # === 'S' - S-mode entered ===
    li      t1, 'S'
    sw      t1, 0(t0)
    
    # ============================================
    # 启用分页 - 使用页表 A (父进程)
    # ============================================
    sfence.vma  zero, zero
    
    # satp = MODE(Sv32) | PPN(PT_A_BASE >> 12)
    # = 0x80000000 | 0x80100 = 0x80080100
    lui     t3, 0x80080
    ori     t3, t3, 0x100       # PPN = 0x80100
    csrw    satp, t3
    
    fence.i
    sfence.vma  zero, zero
    
    # === 'P' - Paging enabled ===
    li      t1, 'P'
    sw      t1, 0(t0)
    
    # === 'A' - Page table A active ===
    li      t1, 'A'
    sw      t1, 0(t0)
    
    # ============================================
    # 在 "父进程" 页表下复制代码到 0x80300000
    # 这模拟 ucore 的 copy_mm/copy_range
    # ============================================
    la      a0, child_code      # 源地址
    lui     a1, 0x80300         # 目标地址
    
    # 复制 48 bytes (12 instructions)
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
    
    # ============================================
    # 执行 fence.i (在父进程页表下)
    # 这是 ucore 中 copy_mm 后的 fence.i
    # ============================================
    fence.i
    
    # === 'B' - Code copied, fence.i done (under PT A) ===
    li      t0, MAGIC_PRINT
    li      t1, 'B'
    sw      t1, 0(t0)
    
    # ============================================
    # 关键步骤: 切换到页表 B (子进程)
    # 这模拟 ucore 的 forkret 切换到子进程页表
    # ============================================
    
    # === 'C' - About to switch to page table B ===
    li      t1, 'C'
    sw      t1, 0(t0)
    
    # 切换 satp 到页表 B
    # satp = MODE(Sv32) | PPN(PT_B_BASE >> 12)
    # = 0x80000000 | 0x80101 = 0x80080101
    sfence.vma  zero, zero      # 先刷新 TLB
    
    lui     t3, 0x80080
    ori     t3, t3, 0x101       # PPN = 0x80101 (页表 B)
    csrw    satp, t3
    
    sfence.vma  zero, zero      # 再次刷新 TLB
    fence.i                     # 确保 ICache 也刷新
    
    # === 'R' - Ready to sret (under PT B) ===
    li      t1, 'R'
    sw      t1, 0(t0)
    
    # ============================================
    # 设置 sret 参数
    # ============================================
    lui     t3, 0x80300         # sepc = 0x80300000
    csrw    sepc, t3
    
    # 设置 sstatus.SPP = 1 (S-mode)
    csrr    t3, sstatus
    li      t4, (1 << 8)
    or      t3, t3, t4
    csrw    sstatus, t3
    
    # ============================================
    # SRET!
    # ============================================
    sret

# ============================================
# 子进程代码 (将被复制到 0x80300000)
# ============================================
.align 4
child_code:
    li      t0, 'Y'             # Y = Success!
    li      t1, MAGIC_PRINT
    sw      t0, 0(t1)
    
    # 打印换行
    li      t0, '\n'
    sw      t0, 0(t1)
    
done:
    j       done

# ============================================
# S-mode trap handler
# ============================================
s_trap_handler:
    li      t0, MAGIC_PRINT
    
    # 'T' = Trap
    li      t1, 'T'
    sw      t1, 0(t0)
    
    # 打印 scause
    csrr    t2, scause
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, print_digit
    addi    t3, t3, ('A' - 10)
    j       print_it
print_digit:
    addi    t3, t3, '0'
print_it:
    sw      t3, 0(t0)
    
    # 打印 '='
    li      t1, '='
    sw      t1, 0(t0)
    
    # 打印 sepc 高16位
    csrr    t2, sepc
    srli    t2, t2, 16
    
    # 打印 4 个十六进制数字
    srli    t3, t2, 12
    andi    t3, t3, 0xF
    li      t4, 10
    blt     t3, t4, h1_digit
    addi    t3, t3, ('A' - 10)
    j       h1_out
h1_digit:
    addi    t3, t3, '0'
h1_out:
    sw      t3, 0(t0)
    
    srli    t3, t2, 8
    andi    t3, t3, 0xF
    li      t4, 10
    blt     t3, t4, h2_digit
    addi    t3, t3, ('A' - 10)
    j       h2_out
h2_digit:
    addi    t3, t3, '0'
h2_out:
    sw      t3, 0(t0)
    
    srli    t3, t2, 4
    andi    t3, t3, 0xF
    li      t4, 10
    blt     t3, t4, h3_digit
    addi    t3, t3, ('A' - 10)
    j       h3_out
h3_digit:
    addi    t3, t3, '0'
h3_out:
    sw      t3, 0(t0)
    
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, h4_digit
    addi    t3, t3, ('A' - 10)
    j       h4_out
h4_digit:
    addi    t3, t3, '0'
h4_out:
    sw      t3, 0(t0)
    
    # 打印换行
    li      t1, '\n'
    sw      t1, 0(t0)
    
trap_loop:
    j       trap_loop
