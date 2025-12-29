# FENCE.I Test in S-Mode
# 测试 fence.i 在 S-mode 下是否正常工作
# 这模拟了 ucore 的实际运行环境
#
# 预期输出: "MSPXY"  (M-mode start, S-mode setup, Paging, X, Y after fence.i)

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
.equ PTE_ALL, (PTE_V | PTE_R | PTE_W | PTE_X | PTE_G | PTE_A | PTE_D)

# sstatus 位
.equ SSTATUS_SPP, 0x100           # Previous privilege = S

_start:
    li      t0, MAGIC_PRINT
    
    # === 'M' - M-mode start ===
    li      t1, 'M'
    sw      t1, 0(t0)
    
    # ============================================
    # 设置页表 (与之前相同)
    # ============================================
    lui     t2, 0x80100         # 页表基址
    lui     t3, 0x20000
    ori     t3, t3, PTE_ALL
    li      t4, 0x800
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    lui     t3, 0x20100
    ori     t3, t3, PTE_ALL
    sw      t3, 4(t5)
    
    lui     t3, 0x24000
    ori     t3, t3, PTE_ALL
    li      t4, 0x900
    add     t5, t2, t4
    sw      t3, 0(t5)
    
    # ============================================
    # 设置 S-mode trap handler (mtvec)
    # ============================================
    la      t6, s_mode_trap_handler
    csrw    mtvec, t6
    
    # ============================================
    # 委托异常到 S-mode (medeleg)
    # ============================================
    li      t6, 0               # 暂时不委托
    csrw    medeleg, t6
    
    # ============================================
    # 设置 S-mode
    # ============================================
    # 清除 mstatus.MPP, 设置为 S-mode (01)
    csrr    t6, mstatus
    li      t5, ~(3 << 11)      # 清除 MPP
    and     t6, t6, t5
    li      t5, (1 << 11)       # MPP = S-mode
    or      t6, t6, t5
    csrw    mstatus, t6
    
    # 设置 mepc 指向 s_mode_entry
    la      t6, s_mode_entry
    csrw    mepc, t6
    
    # === 'S' - About to enter S-mode ===
    li      t1, 'S'
    sw      t1, 0(t0)
    
    # 跳转到 S-mode
    mret

# ============================================
# S-Mode 入口
# ============================================
s_mode_entry:
    li      t0, MAGIC_PRINT
    
    # ============================================
    # 在 S-mode 下启用分页
    # ============================================
    sfence.vma  zero, zero
    
    lui     t3, 0x80080
    ori     t3, t3, 0x100
    csrw    satp, t3
    
    fence.i
    sfence.vma  zero, zero
    
    # === 'P' - Paging enabled in S-mode ===
    li      t1, 'P'
    sw      t1, 0(t0)
    
    # ============================================
    # 调用原始函数
    # ============================================
    jal     ra, modifiable_func     # 应输出 'X'
    
    # ============================================
    # 修改代码
    # ============================================
    la      t2, modifiable_func
    li      t3, 0x05900313          # li t1, 'Y'
    sw      t3, 0(t2)
    
    # ============================================
    # 执行 fence.i (在 S-mode, 分页下)
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

# ============================================
# S-mode trap handler (for debugging)
# ============================================
s_mode_trap_handler:
    li      t0, MAGIC_PRINT
    li      t1, 'T'                 # Trap occurred!
    sw      t1, 0(t0)
    
    # 读取 mcause
    csrr    t2, mcause
    # 输出 mcause 的低4位作为十六进制
    andi    t3, t2, 0xF
    addi    t3, t3, '0'
    sw      t3, 0(t0)
    
    li      t1, '\n'
    sw      t1, 0(t0)
trap_loop:
    j       trap_loop

# ============================================
# 可修改函数
# ============================================
.align 4
modifiable_func:
    li      t1, 'X'
    sw      t1, 0(t0)
    ret
