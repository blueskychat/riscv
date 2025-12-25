# uCore 实验需求对照检查表

根据清华大学计算机组成原理 2025 实验文档，对照你的 RISC-V CPU 实现情况。

---

## 1. 指令实现检查

| 需求 | 状态 | 说明 |
|------|------|------|
| RV32I 基础指令集 | ✅ 已完成 | `id_stage.sv` 中实现了所有必需指令 |
| `FENCE` | ✅ 已完成 | 作为 NOP 处理（符合文档要求：可不实现） |
| `FENCE.I` | ✅ 已完成 | `is_fence_i` 信号触发 cache 同步 |
| Zicsr 6条指令 | ✅ 已完成 | CSRRW/CSRRS/CSRRC/CSRRWI/CSRRSI/CSRRCI |
| `RDTIME` (CSR 0xC01) | ✅ 已完成 | `csr_regfile.sv` 读取 `mtime_i[31:0]` |
| `RDTIMEH` (CSR 0xC81) | ✅ 已完成 | `csr_regfile.sv` 读取 `mtime_i[63:32]` |
| `SRET` | ✅ 已完成 | `id_stage.sv` 译码 + `csr_regfile.sv` 实现 |
| `SFENCE.VMA` | ✅ 已完成 | `id_stage.sv` 译码为 `is_sfence_vma`（如无 TLB 可作为 NOP） |
| `WFI` | ✅ 已完成 | 实现为 Illegal Instruction 异常（符合文档建议） |

---

## 2. CSR 寄存器检查

### Machine Mode CSRs

| CSR | 地址 | 需求字段 | 状态 | 说明 |
|-----|------|----------|------|------|
| `mhartid` | 0xF14 | Hart ID | ❌ **未实现** | 需要添加，返回 0 即可 |
| `mstatus` | 0x300 | MIE, MPIE, MPP | ✅ 已完成 | |
| `mstatus` | 0x300 | SPP, SPIE, SIE, SUM | ⚠️ **部分缺失** | SPP/SPIE/SIE 在 sstatus 中,但 mstatus 未映射; **SUM 未实现** |
| `mie` | 0x304 | MTIE | ✅ 已完成 | |
| `mie` | 0x304 | **STIE** | ❌ **未实现** | 需要添加 bit 5 |
| `mtvec` | 0x305 | BASE, MODE | ✅ 已完成 | |
| `mscratch` | 0x340 | - | ✅ 已完成 | |
| `mepc` | 0x341 | - | ✅ 已完成 | |
| `mcause` | 0x342 | Interrupt, Code | ✅ 已完成 | |
| `mtval` | 0x343 | - | ✅ 已完成 | |
| `mip` | 0x344 | MTIP | ✅ 已完成 | 硬件设置 |
| `mip` | 0x344 | **STIP** | ❌ **未实现** | M模式可读写，S模式只读 |
| `mideleg` | 0x303 | Interrupts | ❌ **未实现** | 中断委托寄存器 |
| `medeleg` | 0x302 | Exceptions | ❌ **未实现** | 异常委托寄存器 |

### Supervisor Mode CSRs

| CSR | 地址 | 需求字段 | 状态 | 说明 |
|-----|------|----------|------|------|
| `sstatus` | 0x100 | SPP, SPIE, SIE | ✅ 已完成 | |
| `sstatus` | 0x100 | **SUM** | ❌ **未实现** | Supervisor User Memory access |
| `sie` | 0x104 | STIE | ❌ **未实现** | S模式中断使能（是 mie 的子集视图） |
| `sip` | 0x144 | STIP | ❌ **未实现** | S模式中断挂起（是 mip 的子集视图） |
| `stvec` | 0x105 | BASE, MODE | ✅ 已完成 | |
| `sscratch` | 0x140 | - | ✅ 已完成 | |
| `sepc` | 0x141 | - | ✅ 已完成 | |
| `scause` | 0x142 | Interrupt, Code | ✅ 已完成 | |
| `stval` | 0x143 | - | ✅ 已完成 | |
| `satp` | 0x180 | MODE, PPN | ✅ 已完成 | |

### PMP CSRs (仅需接受写入)

| CSR | 地址 | 状态 | 说明 |
|-----|------|------|------|
| `pmpcfg0` | 0x3A0 | ✅ 已完成 | 可读写，但不执行权限检查 |
| `pmpaddr0` | 0x3B0 | ✅ 已完成 | 可读写，但不执行权限检查 |

---

## 3. 异常处理检查

| 需求 | 状态 | 说明 |
|------|------|------|
| Instruction Page Fault (12) | ✅ 已完成 | `defines.sv` 有定义 |
| Load Page Fault (13) | ✅ 已完成 | `defines.sv` 有定义 |
| Store Page Fault (15) | ✅ 已完成 | `defines.sv` 有定义 |
| ECALL from S-mode (9) | ✅ 已完成 | `defines.sv` 有定义 |
| Illegal Instruction (2) | ✅ 已完成 | `is_illegal` 标志 |
| **异常委托到 S 模式** | ❌ **未实现** | 需要 medeleg 支持 |
| **中断委托到 S 模式** | ❌ **未实现** | 需要 mideleg 支持 |
| **S 模式异常入口** | ❌ **未实现** | 当前所有异常都进入 M 模式 |

---

## 4. 时钟中断检查

| 需求 | 状态 | 说明 |
|------|------|------|
| `mtime` MMIO (0x200BFF8) | ✅ 已完成 | `clint.sv` 实现 |
| `mtimecmp` MMIO (0x2004000) | ✅ 已完成 | `clint.sv` 实现 |
| `MTIP := mtime >= mtimecmp` | ✅ 已完成 | `clint.sv` 生成 `timer_interrupt` |
| M 模式时钟中断响应 | ✅ 已完成 | 当 MTIP=1 && MTIE=1 && (MIE=1 \|\| Mode<M) |
| **STIP 位 (M模式可写)** | ❌ **未实现** | M模式软件设置，用于转发给S模式 |
| **S 模式时钟中断响应** | ❌ **未实现** | 需要 STIP + STIE + 中断委托 |

---

## 5. 分步实施与测试计划 (Step-by-Step Implementation Plan)

为了实现 uCore 所需的剩余功能，我们将工作分为以下几个可独立测试的阶段。

### 阶段 0: 参数定义完善 (Phase 0: Definitions)
首先在 `defines.sv` 中补充缺失的 CSR 和 bit 位定义，这是后续所有工作的基础。
- **任务**:
    - [ ] 定义 `CSR_MHARTID` (0xF14), `CSR_MIDELEG` (0x303), `CSR_MEDELEG` (0x302)。
    - [ ] 定义 `CSR_SIE`, `CSR_SIP` 的地址。
    - [ ] 定义 S 模式下的中断号 (`INT_S_SOFT`, `INT_S_TIMER`, `INT_S_EXT`)。
    - [ ] 定义 `MIE` 和 `MIP` 中的 `STIE` / `STIP` 位掩码。

### 阶段 1: 基础 CSR 补全 (Phase 1: Basic CSRs)
实现缺失的 M 模式寄存器存储，暂时不涉及复杂逻辑。
- **任务**:
    - [ ] 实现 `mhartid` (只读，恒为0)。
    - [ ] 实现 `mideleg` 和 `medeleg` (可读写，复位为0)。
    - [ ] 确保 `mstatus` 中读取时能包含 `sstatus` 的位 (Optional, but good practice).
- **测试**: `test_csr_delegation_rw`
    - 读写 `mideleg`/`medeleg`，验证值能否保持。
    - 读取 `mhartid`，验证为0。

### 阶段 2: S 模式中断位与视图 (Phase 2: Supervisor Interrupt Bits)
实现 M 模式控制 S 模式中断的核心机制（STIP/STIE）。
- **任务**:
    - [ ] 在 `mip` 中实现可写的 `STIP` 位 (bit 5)。注意：`MTIP` (bit 7) 是只读的，但 `STIP` 在 M 模式下通常是可写的（用于 M 模式软件向 S 模式注入中断）。
    - [ ] 在 `mie` 中实现 `STIE` 位 (bit 5)。
    - [ ] 实现 `sip` 寄存器读取：`sip` 是 `mip` 的子集 (只展示 S 模式可见的中断位)。
    - [ ] 实现 `sie` 寄存器读取：`sie` 是 `mie` 的子集。
- **测试**: `test_supervisor_interrupt_bits`
    - M 模式写 `mip` 的 STIP 位。
    - 切换到 S 模式读 `sip`，验证 STIP 位可见。
    - M 模式写 `mie` 的 STIE 位。
    - 切换到 S 模式读 `sie`，验证 STIE 位可见。

### 阶段 3: 异常委托逻辑 (Phase 3: Exception Delegation)
实现硬件自动判断将异常发送给 M 模式还是 S 模式。
- **任务**:
    - [ ] 修改 `csr_regfile.sv` 中的 exceptions logic。
    - [ ] 当发生异常时，检查 `medeleg` 对应的位。
    - [ ] 如果位为 1 (delegated) 且当前模式 <= S-mode，则 trap 到 S-mode：
        - 更新 `scause`, `sepc`, `stval`, `sstatus` (SPP, SPIE, SIE)。
        - PC 跳转到 `stvec`。
        - 模式切换到 S。
    - [ ] 否则（默认），trap 到 M-mode (现有逻辑)。
- **测试**: `test_exception_delegation`
    -设置 `medeleg` 委托 Illegal Instruction 异常。
    - 执行非法指令。
    - 验证是进入了 S 模式 handler (`stvec`) 还是 M 模式 handler。

### 阶段 4: 中断委托逻辑 (Phase 4: Interrupt Delegation)
实现硬件自动判断将中断发送给 M 模式还是 S 模式。
- **任务**:
    - [ ] 修改中断判断逻辑。
    - [ ] 当中断 pending (mip) & enable (mie/mstatus) 满足条件时：
    - [ ] 检查 `mideleg`。
    - [ ] 如果委托给 S 模式：确保当前模式 < S 或 (当前模式=S 且 SIE=1)。Trap 到 S-mode。
    - [ ] 如果未委托 (M 模式)：确保当前模式 < M 或 (当前模式=M 且 MIE=1)。Trap 到 M-mode。
- **测试**: `test_interrupt_delegation`
    - 主动设置 `mip.STIP`。
    - 设置 `mideleg` 委托 STIP。
    - 开启 `sstatus.SIE`。
    - 验证 CPU 是否响应中断并进入 S 模式 handler。

### 阶段 5: 时钟中断全流程整合 (Phase 5: Timer Interrupt Integration)
模拟 uCore 的时钟中断处理流程。
- **任务**:
    - [ ] 确保 `clint` 产生的时钟中断能触发 M 模式 handler。
    - [ ] 编写测试代码：M 模式 handler 响应时钟中断 -> 设置 `mip.STIP` -> `mret` 返回 S 模式。
    - [ ] 验证 S 模式随后立即响应 Timer 中断 (因为 `STIP` 被置位且已委托)。
- **测试**: `test_timer_trap_to_s`
    - 完整的 M-mode timer -> S-mode timer 注入流程验证。

---

## 📅 优先级建议
按顺序执行 Phase 0 -> Phase 5。这是最稳妥的路径，每一步都有明确的测试目标。
完成 Phase 5 后，CPU 将具备运行 uCore 的核心能力（除了外设驱动外）。
