# L2 DCache Flush 测试程序
# 
# 目标: 验证 fence.i 是否正确刷新 L2 脏行到 SRAM
#
# 测试策略:
# 1. 写入超过 L1 容量 (1KB) 的数据，迫使 L1 脏行被 evict 到 L2
# 2. 执行 fence.i
# 3. 读取数据验证是否正确 (如果 L2 未刷新，PTW 会失败或读到 X)
#
# L1 Cache: 1KB = 64 sets × 16 bytes/line
# L2 Cache: 32KB = 256 sets × 4 ways × 16 bytes/line
#
# 关键: 填满 L1 后继续写入会造成 L1 eviction 到 L2
# 如果 fence.i 不刷新 L2，这些数据不会写回 SRAM
#
# 预期输出:
# - 修复前: 测试失败 (FAIL 或 卡死)
# - 修复后: 输出 "PASS"

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000
.equ DATA_BASE, 0x80100000         # 数据区起始地址 (避开代码区)
.equ L1_SIZE, 1024                 # L1 = 1KB
.equ L1_LINE_SIZE, 16              # L1 line = 16 bytes
.equ L1_LINES, 64                  # L1 = 64 lines
.equ TEST_LINES, 128               # 测试 128 lines (2x L1 容量)

_start:
    li      s0, MAGIC_PRINT
    li      s1, DATA_BASE
    
    # === 输出 'T' - Test Start ===
    li      t0, 'T'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 1: 写入超过 L1 容量的数据
    # 这会导致:
    #   - 前 64 lines 填满 L1 (L1.dirty=1)
    #   - 后 64 lines 写入时, 前面的 lines 被 evict 到 L2 (L2.dirty=1)
    # ================================================================
    li      t2, 0                   # 计数器
    li      t3, TEST_LINES          # 128 lines
    mv      t1, s1                  # 数据地址

phase1_loop:
    # 写入 magic pattern: 地址本身作为数据
    sw      t1, 0(t1)               # data[addr] = addr
    addi    t1, t1, L1_LINE_SIZE    # 下一个 cache line
    addi    t2, t2, 1
    blt     t2, t3, phase1_loop
    
    # === 输出 'W' - Write Complete ===
    li      t0, 'W'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 2: 执行 fence.i
    # 期望: L1 和 L2 的脏行都被刷新到 SRAM
    # BUG: 原实现只刷新 L1，L2 脏行没有写回 SRAM
    # ================================================================
    fence.i
    
    # === 输出 'F' - Fence Complete ===
    li      t0, 'F'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 3: 验证数据
    # 读取所有写入的数据，检查是否正确
    # 如果 L2 没有刷新，某些数据可能读到 X 或错误值
    # ================================================================
    li      t2, 0                   # 计数器
    li      t3, TEST_LINES          # 128 lines
    mv      t1, s1                  # 数据地址
    li      s2, 0                   # 错误计数

verify_loop:
    lw      t4, 0(t1)               # 读取数据
    bne     t4, t1, verify_fail     # 期望 data[addr] == addr
    j       verify_next
    
verify_fail:
    addi    s2, s2, 1               # 错误计数++
    
verify_next:
    addi    t1, t1, L1_LINE_SIZE    # 下一个 cache line
    addi    t2, t2, 1
    blt     t2, t3, verify_loop
    
    # ================================================================
    # Phase 4: 输出结果
    # ================================================================
    bnez    s2, test_fail
    
test_pass:
    # 输出 "PASS\n"
    li      t0, 'P'
    sw      t0, 0(s0)
    li      t0, 'A'
    sw      t0, 0(s0)
    li      t0, 'S'
    sw      t0, 0(s0)
    li      t0, 'S'
    sw      t0, 0(s0)
    li      t0, '\n'
    sw      t0, 0(s0)
    j       done
    
test_fail:
    # 输出 "FAIL:<错误数>\n"
    li      t0, 'F'
    sw      t0, 0(s0)
    li      t0, 'A'
    sw      t0, 0(s0)
    li      t0, 'I'
    sw      t0, 0(s0)
    li      t0, 'L'
    sw      t0, 0(s0)
    li      t0, ':'
    sw      t0, 0(s0)
    # 输出错误数 (十六进制)
    mv      t0, s2
    srli    t1, t0, 4
    andi    t1, t1, 0xF
    li      t2, 10
    blt     t1, t2, 1f
    addi    t1, t1, ('A' - 10)
    j       2f
1:  addi    t1, t1, '0'
2:  sw      t1, 0(s0)
    andi    t1, t0, 0xF
    li      t2, 10
    blt     t1, t2, 3f
    addi    t1, t1, ('A' - 10)
    j       4f
3:  addi    t1, t1, '0'
4:  sw      t1, 0(s0)
    li      t0, '\n'
    sw      t0, 0(s0)
    
done:
    j       done
