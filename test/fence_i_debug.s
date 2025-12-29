# FENCE.I Targeted Debug Test - v2
# 测试 DCache flush + ICache invalidate
#
# 策略: 使用自修改代码技术
# 1. 在 .text 段定义一个会被修改的函数
# 2. 先调用它执行原始代码
# 3. 通过 DCache 写入新指令
# 4. 执行 fence.i
# 5. 再次调用, 验证是否执行新代码
#
# 预期输出: "AXBYN" (X=原始, Y=修改后, 都是'C'则成功)

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000

_start:
    li      t0, MAGIC_PRINT
    
    # === 'A' - Test Start ===
    li      t1, 'A'
    sw      t1, 0(t0)
    
    # === 第一次调用 modifiable_func (应输出 'X') ===
    jal     ra, modifiable_func
    
    # === 'B' - 开始修改代码 ===
    li      t1, 'B'
    sw      t1, 0(t0)
    
    # 修改 modifiable_func 的第一条指令:
    # 原始: li t1, 'X' = 0x05800313
    # 修改: li t1, 'Y' = 0x05900313
    la      t2, modifiable_func
    li      t3, 0x05900313      # li t1, 'Y'
    sw      t3, 0(t2)           # 通过 DCache 写入
    
    # === 执行 FENCE.I ===
    fence.i
    
    # === 如果到达这里, fence.i 没有卡住 ===
    # 第二次调用 modifiable_func
    # 如果 fence.i 成功: 输出 'Y'
    # 如果失败: 输出 'X' (执行旧的缓存代码)
    jal     ra, modifiable_func
    
    # === 'N' - Test Complete ===
    li      t1, '\n'
    sw      t1, 0(t0)

done:
    j       done

# ========================================
# 可修改函数 - 这段代码将被动态修改
# ========================================
.align 4
modifiable_func:
    li      t1, 'X'             # 将被修改为 'Y'
    sw      t1, 0(t0)           # 打印字符
    ret
