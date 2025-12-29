# Fork Simulation Test
# 模拟 fork 子进程的场景：
# 1. M-mode -> S-mode 切换
# 2. 启用 Sv32 分页
# 3. 将代码从一个页复制到另一个页（模拟 fork 的 copy_range）
# 4. 执行 fence.i 刷新缓存
# 5. 设置 sepc 指向复制后的代码，然后 sret（模拟 forkrets -> __trapret -> sret）
#
# 预期输出: "MSPCRXY\n"
#   M = M-mode start
#   S = S-mode entered
#   P = Paging enabled
#   C = Code copied
#   R = Ready to sret
#   X = Original function (before copy)
#   Y = Copied function executed via sret (SUCCESS!)

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000

# PTE flags
.equ PTE_V, 0x01
.equ PTE_R, 0x02
.equ PTE_W, 0x04
.equ PTE_X, 0x08
.equ PTE_U, 0x10    # User mode accessible
.equ PTE_G, 0x20
.equ PTE_A, 0x40
.equ PTE_D, 0x80
.equ PTE_ALL, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_G | PTE_A | PTE_D)
.equ PTE_USER, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_U | PTE_A | PTE_D)

# 地址布局:
# 0x80000000 - 代码段 (内核代码)
# 0x80100000 - 页表 (4KB)
# 0x80200000 - 原始用户代码页 (将被复制)
# 0x80300000 - 目标用户代码页 (子进程代码)
# 0x90000000 - UART/魔术打印地址

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
    # 构建页表 (Sv32 megapages)
    # 页表基址 0x80100000
    # ============================================
    lui     t2, 0x80100         # t2 = 0x80100000 (页表基址)
    
    # Entry 512 (offset 0x800): VA 0x80000000 -> PA 0x80000000
    lui     t3, 0x20000         # PPN for PA=0x80000000
    ori     t3, t3, PTE_ALL
    li      t4, 0x800           # offset for entry 512
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # Entry 513 (offset 0x804): VA 0x80400000 -> PA 0x80400000
    lui     t3, 0x20100         # PPN for PA=0x80400000
    ori     t3, t3, PTE_ALL
    sw      t3, 4(t5)
    
    # Entry 514 (offset 0x808): VA 0x80800000 -> PA 0x80300000 (for sret target, using same megapage)
    # 实际上不需要，因为 0x80300000 在 Entry 512 覆盖的范围内 (0x80000000-0x803FFFFF)
    
    # Entry 576 (offset 0x900): VA 0x90000000 -> PA 0x90000000 (UART)
    lui     t3, 0x24000         # PPN for PA=0x90000000
    ori     t3, t3, PTE_ALL
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # ============================================
    # 切换到 S-mode
    # ============================================
    # 设置 mstatus.MPP = S-mode (01)
    csrr    t6, mstatus
    li      t5, ~(3 << 11)      # 清除 MPP
    and     t6, t6, t5
    li      t5, (1 << 11)       # MPP = S-mode
    or      t6, t6, t5
    csrw    mstatus, t6
    
    # 设置 mepc
    la      t6, s_mode_entry
    csrw    mepc, t6
    
    # 跳转到 S-mode
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
    # 启用分页
    # ============================================
    sfence.vma  zero, zero
    
    lui     t3, 0x80080         # MODE=1 (Sv32)
    ori     t3, t3, 0x100       # PPN = 0x80100 (页表物理地址 >> 12)
    csrw    satp, t3
    
    fence.i
    sfence.vma  zero, zero
    
    # === 'P' - Paging enabled ===
    li      t1, 'P'
    sw      t1, 0(t0)
    
    # ============================================
    # 首先调用原始函数验证它工作正常
    # ============================================
    jal     ra, user_func       # 应输出 'X'
    
    # ============================================
    # 模拟 fork 的 copy_range: 
    # 将 sret_target 复制到 0x80300000
    # 这模拟了 ucore 中 memcpy 将代码复制到新页
    # ============================================
    la      a0, sret_target     # 源地址 (sret_target 而不是 user_func)
    lui     a1, 0x80300         # 目标地址 0x80300000
    
    # 复制足够的指令 (48 bytes = 12 instructions)
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
    
    # 修改复制后的代码：将 'X' 改为 'Y'
    li      t3, 0x05900293      # li t0, 'Y' (注意: 使用 t0 而不是 t1)
    sw      t3, 0(a1)
    
    # === 'C' - Code copied ===
    li      t0, MAGIC_PRINT
    li      t1, 'C'
    sw      t1, 0(t0)
    
    # ============================================
    # 执行 fence.i (这是关键!)
    # 这应该 flush DCache 并 invalidate ICache
    # ============================================
    fence.i
    
    # === 'R' - Ready to sret ===
    li      t1, 'R'
    sw      t1, 0(t0)
    
    # ============================================
    # 模拟 forkrets -> __trapret -> sret
    # 设置 sepc 指向复制后的代码
    # 设置 sstatus.SPP = S-mode (我们继续在 S-mode 运行)
    # ============================================
    lui     t3, 0x80300         # sepc = 0x80300000
    csrw    sepc, t3
    
    # 设置 sstatus.SPP = 1 (S-mode)，以便 sret 返回到 S-mode
    csrr    t3, sstatus
    li      t4, (1 << 8)        # SPP bit
    or      t3, t3, t4
    csrw    sstatus, t3
    
    # ============================================
    # SRET! 这应该跳转到 0x80300000 执行复制后的代码
    # ============================================
    sret

# ============================================
# 原始用户函数 (将被复制)
# 只打印一个字符然后返回
# ============================================
.align 4
user_func:
    li      t0, 'X'             # 这会被修改为 'Y'
    li      t1, MAGIC_PRINT
    sw      t0, 0(t1)
    ret                         # 返回调用者

# ============================================
# sret 目标代码 (会被复制到 0x80300000)
# 复制后会修改 'X' -> 'Y'
# 执行后打印换行并无限循环
# ============================================
.align 4
sret_target:
    li      t0, 'X'             # 这会被修改为 'Y' 
    li      t1, MAGIC_PRINT
    sw      t0, 0(t1)
    
    # 打印换行
    li      t0, '\n'
    sw      t0, 0(t1)
    
done:
    j       done

# ============================================
# S-mode trap handler (用于调试)
# ============================================
s_trap_handler:
    li      t0, MAGIC_PRINT
    
    # 打印 'T' 表示 trap
    li      t1, 'T'
    sw      t1, 0(t0)
    
    # 打印 scause 的低4位
    csrr    t2, scause
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, print_digit
    addi    t3, t3, ('A' - 10)
    j       print_cause
print_digit:
    addi    t3, t3, '0'
print_cause:
    sw      t3, 0(t0)
    
    # 打印 '='
    li      t1, '='
    sw      t1, 0(t0)
    
    # 打印 stval 的高16位（简化）
    csrr    t2, stval
    srli    t2, t2, 16
    # 打印高8位的高4位
    srli    t3, t2, 12
    andi    t3, t3, 0xF
    li      t4, 10
    blt     t3, t4, p1_digit
    addi    t3, t3, ('A' - 10)
    j       p1_out
p1_digit:
    addi    t3, t3, '0'
p1_out:
    sw      t3, 0(t0)
    
    # 打印换行
    li      t1, '\n'
    sw      t1, 0(t0)
    
trap_loop:
    j       trap_loop
