# 双 MMU 集成架构方案

## 整体架构图

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                              riscv_cpu_top.sv                                        │
│                                                                                      │
│  ┌─────────────────────────────────── Pipeline ───────────────────────────────────┐ │
│  │                                                                                 │ │
│  │   ┌────────┐    ┌────────┐    ┌────────┐    ┌────────┐    ┌────────┐          │ │
│  │   │   IF   │───►│   ID   │───►│   EX   │───►│  MEM   │───►│   WB   │          │ │
│  │   │ Stage  │    │ Stage  │    │ Stage  │    │ Stage  │    │ Stage  │          │ │
│  │   └───┬────┘    └────────┘    └────────┘    └───┬────┘    └────────┘          │ │
│  │       │ vaddr                                   │ vaddr                        │ │
│  └───────┼─────────────────────────────────────────┼──────────────────────────────┘ │
│          │                                         │                                 │
│          ▼                                         ▼                                 │
│     ┌─────────┐                              ┌─────────┐                            │
│     │  IMMU   │                              │  DMMU   │◄── satp, priv_mode         │
│     │  (TLB)  │                              │  (TLB)  │    paging_enabled          │
│     └────┬────┘                              └────┬────┘                            │
│          │                                        │                                  │
│          │ paddr                                  │ paddr                            │
│          ▼                                        ▼                                  │
│     ┌─────────┐                              ┌─────────┐                            │
│     │ ICache  │                              │  MEM    │ (数据对齐/符号扩展)         │
│     │         │                              │  Logic  │                            │
│     └────┬────┘                              └────┬────┘                            │
│          │                                        │                                  │
│          │                                        │ mem_req                          │
│          │                                        ▼                                  │
│          │    ptw_req  ┌─────────────┐  ptw_req   │                                 │
│          └────────────►│ PTW Arbiter │◄───────────┤                                 │
│                        │             │            │                                  │
│                        └──────┬──────┘            │                                  │
│                               │ ptw_*             │                                  │
│                               ▼                   ▼                                  │
│                        ┌─────────────────────────────┐                              │
│                        │         DCache              │                              │
│                        │                             │                              │
│                        │  - 接收 MEM 请求           │                              │
│                        │  - 接收 PTW 请求           │                              │
│                        │  - PTW 优先级更高          │                              │
│                        │  - 输出 stall 信号         │                              │
│                        └─────────────┬───────────────┘                              │
│                                      │                                               │
│                                      │ wb_data                                       │
│                                      ▼                                               │
│  ┌────────────────────────────────────────────────────────────────────────────────┐ │
│  │                           Wishbone Master                                       │ │
│  │    wb_inst (from ICache)          wb_data (from DCache)                        │ │
│  └────────────────────────────────────────────────────────────────────────────────┘ │
│                                      │                                               │
│                                      ▼                                               │
│  ┌────────────────────────────────────────────────────────────────────────────────┐ │
│  │                             Wishbone MUX                                        │ │
│  │    BaseRAM (0x8000_0000)   ExtRAM (0x8040_0000)   UART   CLINT                 │ │
│  └────────────────────────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 模块说明

### 1. IMMU (Instruction MMU)
| 项目 | 说明 |
|------|------|
| **位置** | IF Stage 和 ICache 之间 |
| **功能** | 指令取址的虚拟→物理地址翻译 |
| **输入** | `pc` (虚拟地址), `satp`, `priv_mode`, `paging_enabled` |
| **输出** | `paddr` (物理地址), `page_fault`, `ptw_req/addr` |
| **TLB** | 内置 ITLB (32 entries) |

### 2. DMMU (Data MMU)
| 项目 | 说明 |
|------|------|
| **位置** | MEM Stage 和 DCache 之间 |
| **功能** | 数据访问的虚拟→物理地址翻译 |
| **输入** | `alu_result` (虚拟地址), `is_write`, `satp`, `priv_mode` |
| **输出** | `paddr` (物理地址), `page_fault`, `ptw_req/addr` |
| **TLB** | 内置 DTLB (32 entries) |

### 3. PTW Arbiter
| 项目 | 说明 |
|------|------|
| **功能** | 仲裁 IMMU 和 DMMU 的 PTW 请求 |
| **优先级** | DMMU > IMMU (MEM 阶段优先) |
| **输出** | 统一的 `ptw_addr`, `ptw_req` 给 DCache |

### 4. DCache (重构后)
| 项目 | 说明 |
|------|------|
| **位置** | Top 层独立模块 |
| **输入源** | MEM Stage (数据访问) + PTW Arbiter (页表遍历) |
| **仲裁** | PTW 优先，PTW 期间 MEM 暂停 |
| **输出** | `ptw_busy` 信号控制流水线 stall |

---

## 信号流说明

### 正常访问流程 (TLB Hit)
```
1. IF/MEM Stage 发出虚拟地址
2. IMMU/DMMU 查询 TLB → Hit
3. 输出物理地址
4. ICache/DCache 使用物理地址访问内存
5. 0 周期额外延迟
```

### PTW 流程 (TLB Miss)
```
1. IF/MEM Stage 发出虚拟地址
2. IMMU/DMMU 查询 TLB → Miss
3. MMU 发起 PTW 请求
4. PTW Arbiter 选择一个 MMU
5. DCache 接收 PTW 请求，暂停 MEM 请求
6. DCache 访问页表 (可能 cache hit!)
7. 返回 PTE 给 MMU
8. MMU 可能需要二级页表遍历 (重复 5-7)
9. MMU 填充 TLB，输出物理地址
10. 恢复正常访问
```

---

## 流水线 Stall 控制

```systemverilog
// 流水线暂停条件
assign pipeline_stall = icache_stall      // ICache miss
                     || dcache_stall      // DCache miss  
                     || immu_ptw_active   // IMMU 正在 PTW
                     || dmmu_ptw_active;  // DMMU 正在 PTW

// IMMU PTW 时需要暂停的阶段
// → IF, ID, EX, MEM 全部暂停

// DMMU PTW 时需要暂停的阶段  
// → MEM 暂停, IF/ID/EX 可以继续 (如果 IMMU 没有 PTW)
```

---

## Page Fault 处理

```systemverilog
// 新增异常类型
assign trap_enter = exception_trigger 
                 || interrupt_trigger
                 || immu_page_fault    // 新增
                 || dmmu_page_fault;   // 新增

// 异常原因
// IMMU fault → FAULT_INST_PAGE (12)
// DMMU fault (load) → FAULT_LOAD_PAGE (13)  
// DMMU fault (store) → FAULT_STORE_PAGE (15)
```

---

## SFENCE.VMA 支持

```systemverilog
// EX Stage 检测到 SFENCE.VMA 时
if (is_sfence_vma) begin
    immu_flush_all <= (rs1 == 0);        // rs1=0: 全部刷新
    dmmu_flush_all <= (rs1 == 0);
    immu_flush_vpn <= (rs1 != 0);        // rs1≠0: 刷新指定 VPN
    dmmu_flush_vpn <= (rs1 != 0);
    flush_vpn_addr <= rs1_data[31:12];
end
```

---

---

## 分阶段实施计划（每步可测试）

### Phase 1: DCache 重构（保持功能不变）

#### Step 1.1: 抽取 DCache 到 Top 层
```
修改前:
  riscv_cpu_top.sv
    └── mem_stage.sv
          └── dcache.sv (内部实例化)

修改后:
  riscv_cpu_top.sv
    ├── mem_stage.sv (输出端口连接 DCache)
    └── dcache.sv (Top 层实例化)
```

**修改文件：**
- `mem_stage.sv`: 移除 DCache 实例化，改为端口输出
- `riscv_cpu_top.sv`: 添加 DCache 实例化和连线

**测试方法：**
- 运行现有 testbench，所有测试应该 PASS
- 波形验证 mem_stage ↔ dcache 信号正确

---

#### Step 1.2: 添加 DCache PTW 接口（空实现）
```systemverilog
// dcache.sv 新增端口
input  logic [31:0] ptw_addr_i,
input  logic        ptw_req_i,
output logic [31:0] ptw_data_o,
output logic        ptw_ack_o,

// 空实现（暂时忽略 PTW 请求）
assign ptw_data_o = 32'h0;
assign ptw_ack_o = 1'b0;
```

**测试方法：**
- 运行现有 testbench，所有测试应该 PASS（PTW 端口未使用）

---

### Phase 2: 添加 DMMU（MEM 阶段地址翻译）

#### Step 2.1: 实例化 DMMU，paging_enabled=0
```
riscv_cpu_top.sv
  ├── mem_stage.sv ──vaddr──► dmmu ──paddr──► dcache
  └── dcache.sv
```

**修改文件：**
- `riscv_cpu_top.sv`: 实例化 `mmu` 作为 DMMU
- 连接 `satp_out`, `priv_mode`, `paging_enabled`（来自 CSR）
- 强制 `paging_enabled = 0`（旁路模式）

**测试方法：**
- 运行现有 testbench，所有测试应该 PASS
- `paging_enabled=0` 时，`paddr == vaddr`（直通）

---

#### Step 2.2: 实现 DMMU PTW 访问 DCache
```systemverilog
// DCache 内部仲裁逻辑
always_comb begin
    if (ptw_req_i) begin
        // PTW 优先
        internal_addr = ptw_addr_i;
        internal_req = 1'b1;
        mem_stall = 1'b1;  // 暂停 MEM 请求
    end else begin
        // 正常 MEM 请求
        internal_addr = mem_req_addr_i;
        internal_req = mem_req_stb_i;
    end
end
```

**测试方法：**
- 创建 PTW 测试：设置页表，启用分页，触发 TLB miss
- 验证 PTW 能正确读取页表并完成翻译

---

#### Step 2.3: 添加 DMMU Page Fault 处理
```systemverilog
// riscv_cpu_top.sv 异常逻辑
assign trap_enter = exception_trigger 
                 || interrupt_trigger
                 || dmmu_page_fault;  // 新增

always_comb begin
    if (dmmu_page_fault) begin
        if (dmmu_is_write)
            trap_cause = FAULT_STORE_PAGE;  // 15
        else
            trap_cause = FAULT_LOAD_PAGE;   // 13
    end
    // ... 其他异常
end
```

**测试方法：**
- 测试非法页表访问，验证 trap 到 `mtvec`
- 验证 `mcause` 和 `mtval` 正确

---

### Phase 3: 添加 IMMU（IF 阶段地址翻译）

#### Step 3.1: 实例化 IMMU，paging_enabled=0
```
riscv_cpu_top.sv
  ├── if_stage.sv ──vaddr──► immu ──paddr──► icache
  ├── mem_stage.sv ──vaddr──► dmmu ──paddr──► dcache
  └── dcache.sv
```

**测试方法：**
- 运行现有 testbench，所有测试应该 PASS
- `paging_enabled=0` 时，指令取址直通

---

#### Step 3.2: 创建 PTW Arbiter
```systemverilog
module ptw_arbiter (
    input  logic        immu_ptw_req,
    input  logic [31:0] immu_ptw_addr,
    input  logic        dmmu_ptw_req,
    input  logic [31:0] dmmu_ptw_addr,
    
    output logic        ptw_req,
    output logic [31:0] ptw_addr,
    output logic        immu_ptw_ack,
    output logic        dmmu_ptw_ack,
    
    input  logic [31:0] ptw_data,
    input  logic        ptw_ack
);
    // 优先级: DMMU > IMMU
    always_comb begin
        if (dmmu_ptw_req) begin
            ptw_req = 1'b1;
            ptw_addr = dmmu_ptw_addr;
            dmmu_ptw_ack = ptw_ack;
            immu_ptw_ack = 1'b0;
        end else if (immu_ptw_req) begin
            ptw_req = 1'b1;
            ptw_addr = immu_ptw_addr;
            immu_ptw_ack = ptw_ack;
            dmmu_ptw_ack = 1'b0;
        end else begin
            ptw_req = 1'b0;
            ptw_addr = 32'h0;
            immu_ptw_ack = 1'b0;
            dmmu_ptw_ack = 1'b0;
        end
    end
endmodule
```

**连接：**
```
  immu.ptw_* ──┐
               ├──► ptw_arbiter ──► dcache.ptw_*
  dmmu.ptw_* ──┘
```

**测试方法：**
- 测试 IMMU 和 DMMU 同时 TLB miss，验证仲裁正确

---

#### Step 3.3: 添加 IMMU Page Fault 处理
```systemverilog
assign trap_enter = exception_trigger 
                 || interrupt_trigger
                 || immu_page_fault   // 新增
                 || dmmu_page_fault;

// IMMU fault → trap_cause = FAULT_INST_PAGE (12)
```

**测试方法：**
- 跳转到无效页面，验证 Instruction Page Fault

---

### Phase 4: 完善功能

#### Step 4.1: 添加 SFENCE.VMA 支持
```systemverilog
// id_stage.sv 解码
if (opcode == OP_SYSTEM && funct3 == 3'b000 && funct7 == 7'b0001001) begin
    id_ex_next.is_sfence_vma = 1'b1;
end

// ex_stage.sv 执行
if (is_sfence_vma) begin
    sfence_flush_all = (rs1 == 0);
    sfence_flush_vpn = (rs1 != 0);
    sfence_vpn_addr = rs1_data[31:12];
end
```

**测试方法：**
- 修改页表后执行 SFENCE.VMA，验证 TLB 刷新

---

#### Step 4.2: 完整分页测试
- 测试用户态程序访问内核页面 → Page Fault
- 测试写只读页面 → Page Fault  
- 测试执行不可执行页面 → Page Fault
- 测试 Superpage (4MB) 翻译

---

## 架构演进图

```
Phase 1 (DCache 重构):
┌─────────┐     ┌─────────┐
│mem_stage│────►│ dcache  │───► wishbone
└─────────┘     └─────────┘

Phase 2 (添加 DMMU):
┌─────────┐     ┌──────┐     ┌─────────┐
│mem_stage│────►│ dmmu │────►│ dcache  │───► wishbone
└─────────┘     └──┬───┘     └────▲────┘
                   │              │
                   └──── ptw ─────┘

Phase 3 (添加 IMMU + PTW Arbiter):
┌─────────┐     ┌──────┐     ┌─────────┐
│if_stage │────►│ immu │────►│ icache  │───► wishbone
└─────────┘     └──┬───┘     └─────────┘
                   │
                   ▼
              ┌─────────┐
              │   PTW   │
              │ Arbiter │───────────┐
              └─────────┘           │
                   ▲                ▼
                   │          ┌─────────┐
┌─────────┐     ┌──┴───┐     │ dcache  │───► wishbone
│mem_stage│────►│ dmmu │────►│         │
└─────────┘     └──────┘     └─────────┘
```
