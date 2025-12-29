# =============================================================================
# L2 独立脏行测试 - 精确版本
# =============================================================================
# 
# 这个测试精确地创建 L2 独立脏行场景：
# 1. 在地址 A 写入指令
# 2. 在另一个与 A 有相同 L1 index 但不同 L1 tag 的地址 B 写入数据
# 3. 因为 L1 是直接映射，B 会驱逐 A，导致 A 的数据只在 L2 (dirty)
# 4. fence.i
# 5. 跳转到 A 执行
#
# L1 地址分解: [31:10] Tag (22 bits) | [9:4] Index (6 bits) | [3:0] Offset
# 
# 选择地址:
# A = 0x80010000 → tag = 0x200040, index = 0
# B = 0x80010400 → tag = 0x200041, index = 0 (会驱逐 A)
#
# =============================================================================

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000
.equ CODE_TARGET, 0x80010000      # 写入指令的地址
.equ EVICT_ADDR,  0x80010400      # 用于驱逐 CODE_TARGET 的地址

# 我们要写入的指令:
# addi a0, zero, 0x42  → 机器码: 0x04200513
# ret (jalr zero, ra, 0) → 机器码: 0x00008067
.equ INST_ADDI_A0_42, 0x04200513
.equ INST_RET, 0x00008067

_start:
    li      s0, MAGIC_PRINT
    
    # === 输出 '1' - Start ===
    li      t0, '1'
    sw      t0, 0(s0)

    # Phase 1: 在 CODE_TARGET 写入测试指令
    li      t1, CODE_TARGET
    li      t2, INST_ADDI_A0_42
    sw      t2, 0(t1)              # 第一条指令
    li      t2, INST_RET
    sw      t2, 4(t1)              # 第二条指令
    
    # === 输出 '2' - Instructions written ===
    li      t0, '2'
    sw      t0, 0(s0)

    # Phase 2: 写入 EVICT_ADDR，驱逐 CODE_TARGET 到 L2
    # 因为 EVICT_ADDR 与 CODE_TARGET 有相同的 L1 index (0)
    # 但不同的 L1 tag，所以会将 CODE_TARGET 的 cache line 驱逐
    li      t1, EVICT_ADDR
    li      t2, 0xDEADBEEF
    sw      t2, 0(t1)
    
    # 再多写几个地址确保充分驱逐
    li      t1, (EVICT_ADDR + 0x400)    # 0x80010800
    sw      t2, 0(t1)
    li      t1, (EVICT_ADDR + 0x800)    # 0x80010C00
    sw      t2, 0(t1)
    
    # === 输出 '3' - Eviction done ===
    li      t0, '3'
    sw      t0, 0(s0)

    # Phase 3: fence.i
    fence.i

    # === 输出 '4' - Fence done ===
    li      t0, '4'
    sw      t0, 0(s0)

    # Phase 4: 调用动态代码
    li      a0, 0
    li      t1, CODE_TARGET
    jalr    ra, t1, 0

    # === 输出 '5' - Returned ===
    li      t0, '5'
    sw      t0, 0(s0)

    # Phase 5: 检查结果
    li      t0, 0x42
    bne     a0, t0, fail

pass:
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

fail:
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
    # 输出 a0 值
    mv      t5, a0
    srli    t0, t5, 4
    andi    t0, t0, 0xF
    li      t1, 10
    blt     t0, t1, 1f
    addi    t0, t0, ('A' - 10)
    j       2f
1:  addi    t0, t0, '0'
2:  sw      t0, 0(s0)
    andi    t0, t5, 0xF
    li      t1, 10
    blt     t0, t1, 3f
    addi    t0, t0, ('A' - 10)
    j       4f
3:  addi    t0, t0, '0'
4:  sw      t0, 0(s0)
    li      t0, '\n'
    sw      t0, 0(s0)

done:
    j       done
