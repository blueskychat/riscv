# L2 DCache Flush Bug 重现测试
# 
# 核心策略:
# 1. 构建页表 PTE 通过 DCache 写入
# 2. 写入大量数据，迫使 L1 中的 PTE 被 evict 到 L2
# 3. 执行 fence.i
# 4. 启用分页 - IMMU 做 PTW，直接从 SRAM 读取 PTE
# 5. 如果 L2 没有刷新到 SRAM，PTW 读到垃圾，触发 page fault
#
# L1 Cache: 1KB = 64 sets × 16 bytes/line
# 页表地址: 0x80100000，L1 index = (0x80100000 >> 4) & 0x3F = 0
#
# 关键: 写入足够多的数据来 evict 页表所在的 L1 lines
#
# 预期输出:
# - 修复后: "MSPEY\n" (成功启用分页并执行代码)
# - 修复前: "MSPExxx" (启用分页时 page fault，因为 PTW 读到垃圾)

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000
.equ PT_BASE, 0x80100000        # 页表基址
.equ EVICT_BASE, 0x80200000     # 用于 eviction 的数据区

# PTE flags (Sv32 格式)
.equ PTE_V, 0x01
.equ PTE_R, 0x02
.equ PTE_W, 0x04
.equ PTE_X, 0x08
.equ PTE_U, 0x10
.equ PTE_G, 0x20
.equ PTE_A, 0x40
.equ PTE_D, 0x80
.equ PTE_KERNEL, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_G | PTE_A | PTE_D)

_start:
    li      s0, MAGIC_PRINT
    
    # === 'M' - M-mode start ===
    li      t0, 'M'
    sw      t0, 0(s0)
    
    # ================================================================
    # 设置 M-mode 和 S-mode trap handlers
    # ================================================================
    la      t0, m_trap_handler
    csrw    mtvec, t0
    la      t0, s_trap_handler
    csrw    stvec, t0
    
    # 委托 page faults 到 S-mode (可选)
    li      t0, 0x0             # 不委托，便于调试
    csrw    medeleg, t0
    
    # ================================================================
    # Step 1: 构建页表 (Sv32 megapage 格式)
    # ================================================================
    lui     t2, 0x80100         # t2 = PT_BASE
    
    # Entry 512 (VA 0x80000000-0x803FFFFF -> PA 0x80000000)  
    # Offset = 512 * 4 = 0x800
    # PTE = (PA >> 12) << 10 | flags = 0x80000 << 10 | 0xFF = 0x20000000 | 0xFF
    lui     t3, 0x20000
    ori     t3, t3, PTE_KERNEL
    li      t4, 0x800
    add     t5, t2, t4
    sw      t3, 0(t5)           # PTE[512] 写入
    
    # Entry 576 (VA 0x90000000 -> PA 0x90000000, for UART)
    # Offset = 576 * 4 = 0x900  
    lui     t3, 0x24000
    ori     t3, t3, PTE_KERNEL
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)           # PTE[576] 写入
    
    # 此时 PTE 在 L1 DCache 中 (dirty)
    
    # ================================================================
    # Step 2: 强制 eviction - 写入大量数据到 L1 同一 set
    #
    # L1 是 direct-mapped，64 sets，索引 = addr[9:4]
    # PT_BASE = 0x80100000，PTE[512] 在 0x80100800
    # L1 index = (0x800 >> 4) & 0x3F = 0
    # 
    # 要 evict 这个 line，写入另一个地址，其 L1 index 也是 0
    # 即 addr[9:4] = 0，addr[3:0] = 任意
    # 例如 0x80200000, 0x80200400, 0x80200800, ...
    # (每隔 1KB 会映射到同一 L1 set)
    #
    # 为了确保 eviction，写入 128 个 lines (每个 16 bytes, 隔开 1KB)
    # ================================================================
    
    lui     t1, 0x80200         # t1 = EVICT_BASE = 0x80200000
    li      t2, 0               # 计数器
    li      t3, 128             # 写入 128 个 conflicting lines

evict_loop:
    # 计算地址: EVICT_BASE + (i * 0x400)
    # 每次地址增加 0x400 (1KB)，它们都会映射到 L1 index 0
    slli    t4, t2, 10          # t4 = i * 0x400
    add     t5, t1, t4          # t5 = addr
    sw      t5, 0(t5)           # 写入数据 (任意值)
    addi    t2, t2, 1
    blt     t2, t3, evict_loop
    
    # 此时 PT_BASE+0x800 处的 PTE 应该已经被 evict 到 L2
    # (因为 L1 只有 64 lines，我们写了 128 个 conflicting lines)
    
    # ================================================================
    # Step 3: 执行 fence.i
    # BUG: 原实现只刷新 L1，L2 中的 PTE 不会写回 SRAM
    # ================================================================
    fence.i
    
    # ================================================================
    # Step 4: 切换到 S-mode 并启用分页
    # IMMU 会做 PTW，从 SRAM 读取 PTE
    # 如果 PTE 还在 L2（未刷新），IMMU 读到垃圾 -> page fault
    # ================================================================
    
    # 设置 MPP = S-mode
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
    li      s0, MAGIC_PRINT
    
    # === 'S' - S-mode entered ===
    li      t0, 'S'
    sw      t0, 0(s0)
    
    # 刷新 TLB
    sfence.vma  zero, zero
    
    # ================================================================
    # 启用分页 - satp = MODE(Sv32) | PPN(PT_BASE >> 12)
    # = 0x80000000 | 0x80100 = 0x80080100
    #
    # 此时 IMMU 会做 PTW，从 SRAM 读取 PTE[512]
    # ================================================================
    lui     t3, 0x80080
    ori     t3, t3, 0x100
    csrw    satp, t3
    
    # 刷新 TLB + ICache
    sfence.vma  zero, zero
    fence.i
    
    # ================================================================
    # 如果分页启用成功，说明 PTW 读到了正确的 PTE
    # 如果 PTE 还在 L2，这里会 page fault
    # ================================================================
    
    # === 'P' - Paging enabled successfully ===
    li      t0, 'P'
    sw      t0, 0(s0)
    
    # ================================================================
    # Step 5: 额外测试 - 执行一些在分页模式下的代码
    # 这会触发 IMMU 做更多 PTW
    # ================================================================
    
    # === 'E' - Executing under paging ===
    li      t0, 'E'
    sw      t0, 0(s0)
    
    # 跳转到一个新地址，触发另一次 PTW (如果 TLB miss)
    j       success_code

.align 4
success_code:
    # === 'Y' - All tests passed ===
    li      t0, 'Y'
    sw      t0, 0(s0)
    
    li      t0, '\n'
    sw      t0, 0(s0)
    
done:
    j       done

# ============================================
# M-mode trap handler
# ============================================
m_trap_handler:
    li      t0, MAGIC_PRINT
    li      t1, 'X'             # X = M-mode trap
    sw      t1, 0(t0)
    
    # 打印 mcause
    csrr    t2, mcause
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, m_digit
    addi    t3, t3, ('A' - 10)
    j       m_out
m_digit:
    addi    t3, t3, '0'
m_out:
    sw      t3, 0(t0)
    
    li      t1, '\n'
    sw      t1, 0(t0)
m_loop:
    j       m_loop

# ============================================
# S-mode trap handler  
# ============================================
s_trap_handler:
    li      t0, MAGIC_PRINT
    li      t1, 'E'             # E = S-mode Exception
    sw      t1, 0(t0)
    
    # 打印 scause
    csrr    t2, scause
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, s_digit
    addi    t3, t3, ('A' - 10)
    j       s_out
s_digit:
    addi    t3, t3, '0'
s_out:
    sw      t3, 0(t0)
    
    # 打印 sepc (部分)
    li      t1, '@'
    sw      t1, 0(t0)
    csrr    t2, sepc
    srli    t2, t2, 12
    andi    t3, t2, 0xF
    li      t4, 10
    blt     t3, t4, s2_digit
    addi    t3, t3, ('A' - 10)
    j       s2_out
s2_digit:
    addi    t3, t3, '0'
s2_out:
    sw      t3, 0(t0)
    
    li      t1, '\n'
    sw      t1, 0(t0)
s_loop:
    j       s_loop
