# 

## 找到问题了！ICache Bug 确认

波形图非常清楚地显示了问题：

### 关键观察

| 时间  | pc_i       | inst_o       | ready_o | 问题         |
| --- | ---------- | ------------ | ------- | ---------- |
| T   | 0x804e02e4 | 0x00100513   | 1       | ✅          |
| T+1 | 0x804e02e8 | **XXXXXXXX** | **1**   | ❌ **BUG!** |
| T+2 | 0x804e02ec | 0x00050593   | 1       | ✅          |

### 核心问题

**ICache 在 `inst_o = X` 时仍然报告 `ready_o = 1`！**

这是 ICache 的硬件 Bug：它在没有有效数据时错误地宣称数据已就绪。

### 可能原因

1. **Cache Miss 但 Ready 提前拉高**：ICache 可能在等待内存返回数据时就已经拉高了 ready
2. **Cache Line 边界问题**：地址 0x804e02e8 可能恰好在 Cache Line 边界附近
3. **Refill 逻辑 Bug**：Cache 正在 refill 但状态机错误地报告了 ready

让我看一下 ICache 的实现来定位问题：

*Viewed [icache.sv](file:///D:/sqw/code/verilogtest/riscv/riscv.srcs/icache.sv) *

### Planner Response

## 找到 ICache Bug 了！

看第 **331 行**：

```verilog
ready_o = (state == IDLE && l0_hit) || (state == COMPARE && cache_hit);
```

### 问题分析

根据波形，当 `inst_o = X` 时，`ready_o = 1`。这意味着：

- 要么 `state == IDLE && l0_hit == 1`
- 要么 `state == COMPARE && cache_hit == 1`

但是根据你提供的数据：

- pc_i 在变化：`804e02e4 → 804e02e8 → 804e02ec`
- 这是**连续顺序取指**

### 仔细看问题的根源

在第 **186-204 行**，`selected_word` (也就是 `inst_o`) 的计算：

```verilog
always_comb begin
    if (state == IDLE && l0_hit) begin
        // Fast path: Read from L0 Cache
        case (word_offset)
            2'b00: selected_word = l0_hit_data[31:0];
            ...
        endcase
    end else begin
        // Slow path: Read from BRAM output
        case (word_offset)
            2'b00: selected_word = hit_data[31:0];
            ...
        endcase
    end
end
```

问题是：**当 PC 变化时，`word_offset` 使用的是新 PC 的值，但 `hit_data` 或 `l0_hit_data` 可能还是旧地址的数据！**

### 具体场景

1. **周期 N**：PC = 0x804e02e4, L0 Hit, 输出正确指令
2. **周期 N+1**：PC = 0x804e02e8 (新地址!)
   - `l0_hit` 检测使用**新 PC** 的 `l0_index` 和 `l0_tag_req`
   - 如果新地址也恰好 L0 Hit，`state == IDLE && l0_hit == 1`
   - **但 `l0_hit_data` 可能还是旧值**（因为 L0 是组合逻辑读，需要一个周期更新）
   - 或者更糟：`l0_hit_data` 访问到**未初始化的 cache line**

### 需要检查

请在波形中添加并检查以下 L0 Cache 信号：

```tcl
add_wave -divider "=== L0 CACHE ==="
add_wave /${TOP}/u_if_stage/u_icache/l0_hit
add_wave -radix hexadecimal /${TOP}/u_if_stage/u_icache/l0_index
add_wave -radix hexadecimal /${TOP}/u_if_stage/u_icache/l0_tag_req
add_wave -radix hexadecimal /${TOP}/u_if_stage/u_icache/l0_hit_data
add_wave /${TOP}/u_if_stage/u_icache/state
add_wave /${TOP}/u_if_stage/u_icache/cache_hit
```

特别是当 `inst_o = X` 时：

1. **state** 是什么？(IDLE, COMPARE, REFILL)
2. **l0_hit** 是 0 还是 1？
3. **cache_hit** 是 0 还是 1？

这将帮助我们确定是 L0 Cache 还是 L1 Cache (BRAM) 的问题。

### User Input

### Planner Response

## 找到根本原因了！

从波形来看问题非常清楚：

### 关键观察

| 时间点               | state    | l0_hit | l0_hit_data  | inst_o       | 问题  |
| ----------------- | -------- | ------ | ------------ | ------------ | --- |
| REFILL 结束前        | REFILL   | 1      | 有数据          | 00100513     | ✅   |
| **REFILL → IDLE** | **IDLE** | **1**  | **XXXXXXXX** | **XXXXXXXX** | ❌   |
| 之后                | IDLE     | 1      | 有数据          | 00050593     | ✅   |

### 问题根源

当 **REFILL 完成并转换到 IDLE 状态时**：

1. `state` 变为 **IDLE**
2. `l0_hit` 立即变为 **1** (组合逻辑)
3. 因此 `ready_o = (state == IDLE && l0_hit) = 1` ✅
4. **但是** `l0_hit_data` 是 **X** (未定义)！

### 原因分析

查看 [icache.sv 第 370-373 行](file:///D:/sqw/code/verilogtest/riscv/riscv.srcs/icache.sv#L370-373)：

```verilog
// Update L0 on Refill
l0_data[l0_index] <= {wb_dat_i, refill_data[95:0]};
l0_tag[l0_index] <= l0_tag_req;
l0_valid[l0_index] <= 1'b1;
```

写入发生在 `state == REFILL && wb_ack_i && refill_counter == 2'b11`。

问题是：**`l0_index` 使用的是当前 `pc_i` 计算的值**。但如果在 REFILL 完成的瞬间 PC 发生变化（比如跳转到新地址），写入的 index 和读取的 index 可能不一致！

从波形可以看到：

- REFILL 期间 pc_i = 0x804e02e4, l0_index = 0x2e
- 当 state 变为 IDLE 时，pc_i 立刻变为 0x804e02e8

虽然这两个地址在同一个 cache line (l0_index 都是 0x2e)，但 **`refill_data` 使用的 `l0_index` 可能在时序上出了问题**。

### 修复方案

需要 **锁存 refill 开始时的地址**，确保整个 refill 过程和最终写入都使用同一个 index。修改 icache.sv：

```verilog
// 添加锁存寄存器
logic [L0_INDEX_WIDTH-1:0] latched_l0_index;
logic [L0_TAG_WIDTH-1:0] latched_l0_tag_req;

// 在开始 refill 时锁存地址
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        latched_l0_index <= '0;
        latched_l0_tag_req <= '0;
    end else if (state == COMPARE && !cache_hit) begin
        // 进入 REFILL 时锁存当前地址
        latched_l0_index <= l0_index;
        latched_l0_tag_req <= l0_tag_req;
    end
end

// 修改 L0 写入逻辑 (第 370-373 行)，使用锁存的 index
if (state == REFILL && wb_ack_i && refill_counter == 2'b11) begin
    ...
    l0_data[latched_l0_index] <= {wb_dat_i, refill_data[95:0]};  // 使用锁存的 index
    l0_tag[latched_l0_index] <= latched_l0_tag_req;
    l0_valid[latched_l0_index] <= 1'b1;
end
```

同样，L1 BRAM 的写入也应该使用锁存的 `index` 和 `tag`。

---

**你想让我帮你实现这个修复吗？**

### User Input

修复

*Viewed [icache.sv](file:///D:/sqw/code/verilogtest/riscv/riscv.srcs/icache.sv) *

### Planner Response

现在让我实现修复。我需要：

1. 添加锁存寄存器来保存 refill 开始时的地址
2. 修改 L0 和 L1 的写入逻辑使用锁存的地址

*Edited relevant file*

### Planner Response

修改已完成。让我更新任务状态并通知用户：



### 3. 已做的 ICache 修复

- 添加了地址锁存逻辑（防止 REFILL 期间 PC 变化导致写入错误地址）
- 这是一个正确的 bug 修复，但**不是本次问题的根因**