# Timer Interrupt Response Test - 完整的 Timer 中断响应测试
# 测试: 使能 Timer 中断 -> 等待中断触发 -> 验证跳转到 mtvec -> 验证 mcause
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
.equ CSR_MTVEC,     0x305
.equ CSR_MEPC,      0x341
.equ CSR_MCAUSE,    0x342

_start:
    lui s0, %hi(MAGIC_ADDR)   # s0 = 0x90000000
    
    # 输出标题 "TIM "
    li t0, 'T'
    sb t0, 0(s0)
    li t0, 'I'
    sb t0, 0(s0)
    li t0, 'M'
    sb t0, 0(s0)
    li t0, ' '
    sb t0, 0(s0)

    # ========== 测试 1: 设置 mtvec 指向中断处理程序 ==========
    la t0, trap_handler
    csrw CSR_MTVEC, t0
    
    # 验证 mtvec 已设置
    csrr t1, CSR_MTVEC
    beq t0, t1, test1_pass
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
    
    # ========== 测试 2: 使能 Timer 中断 ==========
    # 设置 mie.MTIE = 1 (bit 7)
    li t0, 0x80
    csrs CSR_MIE, t0
    
    # 验证 mie.MTIE 已设置
    csrr t1, CSR_MIE
    andi t1, t1, 0x80
    bnez t1, test2_pass
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
    
    # ========== 测试 3: 设置 mtimecmp 让中断快速触发 ==========
    # 读取当前 mtime
    li t1, MTIME_LO
    lw t2, 0(t1)
    
    # 设置 mtimecmp = mtime + 50 (很快触发)
    addi t3, t2, 50
    li t1, MTIMECMP_LO
    sw t3, 0(t1)
    
    # 设置 mtimecmp 高32位为 0
    li t3, 0
    li t1, MTIMECMP_HI
    sw t3, 0(t1)
    
    li t0, '3'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)

test4:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 4: 使能全局中断并等待中断触发 ==========
    # 初始化中断标志
    li s1, 0                  # s1 = 中断发生标志
    
    # 设置 mstatus.MIE = 1 (bit 3)
    li t0, 0x8
    csrs CSR_MSTATUS, t0
    
    # 等待中断触发 (循环最多等待 200 次)
    li t4, 200
wait_int:
    bnez s1, int_received     # 中断已发生
    addi t4, t4, -1
    bnez t4, wait_int

    # 超时，中断未发生
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'F'
    sb t0, 0(s0)
    li t0, 't'                # 't' = timeout
    sb t0, 0(s0)
    j done
    
int_received:
    li t0, '4'
    sb t0, 0(s0)
    li t0, 'P'
    sb t0, 0(s0)

test5:
    li t0, ' '
    sb t0, 0(s0)
    
    # ========== 测试 5: 验证 mcause ==========
    # mcause 应该为 0x80000007 (Timer interrupt)
    csrr t0, CSR_MCAUSE
    li t1, 0x80000007
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

# ==================== 中断处理程序 ====================
.align 4
trap_handler:
    # 设置中断发生标志
    li s1, 1
    
    # 清除中断 (设置 mtimecmp 到很大的值)
    li t0, MTIMECMP_LO
    li t1, -1                 # 0xFFFFFFFF
    sw t1, 0(t0)
    li t0, MTIMECMP_HI
    sw t1, 0(t0)
    
    # 返回到下一条指令 (mepc + 4)
    csrr t0, CSR_MEPC
    addi t0, t0, 4
    csrw CSR_MEPC, t0
    
    mret
