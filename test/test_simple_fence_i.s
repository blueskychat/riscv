# =============================================================================
# 简单 fence.i 自修改代码测试
# =============================================================================
# 
# 目标: 验证 fence.i 基本功能
#
# 这个测试不涉及 L2 驱逐，只是验证：
# 1. 写入代码
# 2. fence.i
# 3. 执行代码
#
# =============================================================================

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000
.equ CODE_TARGET, 0x80010000      # 动态代码地址

# 我们要写入的指令:
# addi a0, zero, 0x42  → 机器码: 0x04200513
# ret (jalr zero, ra, 0) → 机器码: 0x00008067
.equ INST_ADDI_A0_42, 0x04200513
.equ INST_RET, 0x00008067

_start:
    li      s0, MAGIC_PRINT
    
    # === 输出 'A' - Start ===
    li      t0, 'A'
    sw      t0, 0(s0)

    # 写入指令
    li      t1, CODE_TARGET
    li      t2, INST_ADDI_A0_42
    sw      t2, 0(t1)
    li      t2, INST_RET
    sw      t2, 4(t1)
    
    # === 输出 'B' - Written ===
    li      t0, 'B'
    sw      t0, 0(s0)

    # 执行 fence.i
    fence.i

    # === 输出 'C' - Fence done ===
    li      t0, 'C'
    sw      t0, 0(s0)

    # 调用动态代码
    li      a0, 0
    li      t1, CODE_TARGET
    jalr    ra, t1, 0

    # === 输出 'D' - Returned ===
    li      t0, 'D'
    sw      t0, 0(s0)

    # 检查结果
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
    li      t0, '\n'
    sw      t0, 0(s0)

done:
    j       done
