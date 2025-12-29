# =============================================================================
# L2 Flush + ICache 测试程序 v2
# =============================================================================
# 
# 目标: 验证 fence.i 必须刷新 L2 到 SRAM，否则 ICache 会读到错误数据
#
# 改进:
# 1. 使用 0x80010000 作为目标地址 (在 BaseRAM 范围内)
# 2. 添加更多调试输出
# 3. 正确处理 L1 eviction 只需要触发相同 index 的不同 tag
#
# 地址布局:
# - 代码区:     0x80000000 ~ 0x80000FFF
# - 数据区:     0x80010000 ~ 0x8001FFFF (用于写入动态代码)
# - 填充区:     用于驱逐 L1 cache
#
# 预期结果:
# - 修复前 (L2 不刷新): 输出 12345，然后跳转失败或错误
# - 修复后 (L2 刷新到 SRAM): 输出 12345PASS
#
# =============================================================================

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000
.equ CODE_TARGET, 0x80010000      # 动态生成代码的目标地址 (在 BaseRAM 范围内)
.equ L1_LINE_SIZE, 16             # L1 cache line = 16 bytes
.equ L1_SETS, 64                  # L1 = 64 sets

# 我们要写入的指令:
# addi a0, zero, 0x42  → 机器码: 0x04200513
# ret (jalr zero, ra, 0) → 机器码: 0x00008067
.equ INST_ADDI_A0_42, 0x04200513
.equ INST_RET, 0x00008067

_start:
    li      s0, MAGIC_PRINT
    li      sp, 0x80080000         # 设置栈指针
    
    # === 输出 '1' - Test Start ===
    li      t0, '1'
    sw      t0, 0(s0)

    # =================================================================
    # Phase 1: 在 CODE_TARGET 写入测试指令
    # =================================================================
    li      t1, CODE_TARGET
    li      t2, INST_ADDI_A0_42
    sw      t2, 0(t1)              # 写入 addi a0, zero, 0x42
    li      t2, INST_RET
    sw      t2, 4(t1)              # 写入 ret
    
    # === 输出 '2' - Instructions Written ===
    li      t0, '2'
    sw      t0, 0(s0)

    # =================================================================
    # Phase 2: 填满 L1 对应的 set，强制 CODE_TARGET 被 evict 到 L2
    #
    # L1 是直接映射: index = addr[9:4]
    # CODE_TARGET = 0x80010000 → index = (0x10000 >> 4) & 0x3F = 0
    # 
    # 我们需要写入多个地址，每个地址与 CODE_TARGET 有相同的 L1 index
    # 但不同的 L1 tag，这样每次写入都会驱逐之前的 line
    #
    # L1 index 是 addr[9:4]，所以要保持 index=0，需要 addr[9:4]=0
    # 不同的 tag 通过改变 addr[31:10] 实现
    # 
    # 例如:
    #   0x80010000 → L1 index = 0, tag = 0x200040
    #   0x80010400 → L1 index = 0, tag = 0x200041 (驱逐上一个)
    #   ... 继续写入更多地址强制多次驱逐
    # =================================================================
    
    # 写入 70 个地址 (远超 L1 容量，确保充分驱逐)
    li      t1, CODE_TARGET
    li      t3, 70
    li      t2, 0

evict_loop:
    # 写入当前地址 (这会将之前在同一 L1 index 的 line 驱逐到 L2)
    sw      t2, 0(t1)
    # 下一个地址: + 0x400 = + 1024 bytes
    # 这保证 L1 index 相同 (addr[9:4] 不变)，但 L1 tag 不同
    li      t4, 0x400
    add     t1, t1, t4
    addi    t2, t2, 1
    blt     t2, t3, evict_loop

    # === 输出 '3' - L1 Eviction Complete ===
    li      t0, '3'
    sw      t0, 0(s0)

    # =================================================================
    # Phase 3: 执行 fence.i
    # 期望: 刷新 L1 + L2 到 SRAM，然后 invalidate ICache
    # BUG: 如果只刷新 L1，CODE_TARGET 的指令在 L2 (dirty)，
    #      不会写回 SRAM，ICache refill 会读到 X 或旧数据
    # =================================================================
    fence.i

    # === 输出 '4' - Fence.i Complete ===
    li      t0, '4'
    sw      t0, 0(s0)

    # =================================================================
    # Phase 4: 调用动态生成的代码
    # 如果成功，a0 应该等于 0x42
    # 如果失败，会触发 Illegal Instruction 或读到错误指令
    # =================================================================
    li      a0, 0                  # 清除 a0
    li      t1, CODE_TARGET
    jalr    ra, t1, 0              # 调用目标代码

    # === 输出 '5' - Returned from dynamic code ===
    li      t0, '5'
    sw      t0, 0(s0)

    # =================================================================
    # Phase 5: 检查结果
    # =================================================================
    li      t0, 0x42
    bne     a0, t0, test_fail

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
    # 输出 "FAIL:a0=XX\n"
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
    li      t0, 'a'
    sw      t0, 0(s0)
    li      t0, '0'
    sw      t0, 0(s0)
    li      t0, '='
    sw      t0, 0(s0)
    # 输出 a0 的值 (十六进制低8位)
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
    # 仿真结束标志
    nop
    nop
    nop
    j       done
