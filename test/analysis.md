# Store/AMO Page Fault Analysis

## Summary of the Issue

The simulation fails with a **Store/AMO page fault** (cause=0xf=15) during trap entry in `__alltraps`. The faulting address `0xfafed004` indicates the stack pointer (`sp`) has an incorrect value.

## Error Details

```
trapframe at 0xfafecf40
  sp       0xfafecfd0  <- This is the OLD sp (before csrrw swap)
  badvaddr 0xfafed004  <- This is sp + 52, using the OLD sp!
  epc      0x804016d4  <- sw a3, 52(sp) instruction
  cause    0x0000000f  <- Store/AMO page fault
```

## Root Cause Analysis

The failing instruction sequence in `__alltraps` (`trapentry.S`):

```assembly
80401694:   csrrw sp,sscratch,sp     ; Swap sp <-> sscratch
80401698:   bnez sp,804016a0         ; Branch if sp != 0
8040169c:   csrr sp,sscratch         ; Restore sp from sscratch (kernel mode)
804016a0:   addi sp,sp,-144          ; Allocate trap frame
...
804016d4:   sw a3,52(sp)             ; Save a3 - FAULTS HERE!
```

### The Trap Entry Logic

1. `csrrw sp, sscratch, sp` atomically swaps sp and sscratch:
   - If from **user mode**: sscratch has kernel sp → new sp = kernel sp, new sscratch = user sp
   - If from **kernel mode**: sscratch = 0 → new sp = 0, new sscratch = kernel sp

2. When coming from kernel mode:
   - sp becomes 0 after csrrw
   - Branch is NOT taken (sp == 0)
   - `csrr sp, sscratch` reads sscratch (now contains original kernel sp) back into sp

### The Bug

The `sw a3, 52(sp)` is accessing address `0xfafed004 = 0xfafecfd0 + 52`, where `0xfafecfd0` is the **OLD sp value** (before the trap). This means either:

1. **CSR-to-CSR forwarding issue**: `csrrw` writes to `sscratch`, but `csrr` reads the stale value
2. **Branch hazard not detected**: The `bnez` instruction uses sp before csrrw's result is available  
3. **Register forwarding failure**: The `addi sp, sp, -144` result is not forwarded to subsequent stores

## Critical Code Paths to Investigate

### 1. CSR Write Timing (csr_regfile.sv)

The CSR write happens in `always_ff`:
```systemverilog
CSR_SSCRATCH: sscratch <= csr_new_value;  // Line 325
```

The CSR read is combinatorial:
```systemverilog
CSR_SSCRATCH: csr_rdata = sscratch;  // Line 172
```

**Issue**: If `csrrw` sets sscratch in cycle N (written at rising edge of N+1), and `csrr` reads sscratch in cycle N+1's combinatorial logic, the timing might be wrong.

### 2. Hazard Detection for Branches (hazard_unit.sv)

```systemverilog
alu_branch_hazard = if_id_is_branch &&   // Is ID instruction a branch?
                    id_ex_reg_write &&   // Does EX instruction write a register?
                   (id_ex_rd != 5'h0) && 
                   ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2));
```

For the sequence:
- csrrw in EX (id_ex_rd = sp, id_ex_reg_write = 1)
- bnez in ID (if_id_rs1 = sp)

This SHOULD trigger `alu_branch_hazard`, but verify it actually does.

### 3. Register Forwarding (ex_stage.sv)

```systemverilog
if (fwd_ex_valid && fwd_ex_rd != 5'h0 && fwd_ex_rd == id_ex_reg.rs1)
    rs1_forwarded = fwd_ex_data;
```

Where:
- `fwd_ex_data = ex_mem_reg.alu_result`
- For CSR instructions: `ex_mem_next.alu_result = csr_rdata_i`

Verify that CSR result forwarding works correctly.

## Recommended Debugging Steps

1. **Add simulation traces** for the specific instruction sequence:
   - Log PC, instruction, sp value after each instruction from 0x80401694 to 0x804016d4
   - Log CSR read/write operations for sscratch

2. **Check hazard stall signals** during the csrrw → bnez → csrr sequence:
   ```systemverilog
   $display("PC=%h, hazard_stall=%b, alu_branch_hazard=%b", pc, hazard_stall, alu_branch_hazard);
   ```

3. **Verify CSR forwarding** by adding:
   ```systemverilog
   $display("CSR op: csr_op=%d, csr_addr=%h, sscratch_old=%h, sscratch_new=%h", 
            csr_op, csr_addr, sscratch, csr_new_value);
   ```

4. **Check store address calculation**:
   ```systemverilog
   // In mem_stage.sv
   $display("Store: addr=%h, sp=%h, alu_result=%h", dcache_addr, ???, ex_mem_reg.alu_result);
   ```

## Potential Fixes

### Fix 1: Add CSR-Use Hazard Detection

If the issue is CSR read-after-write, add hazard detection for CSR instructions similar to load-use hazards:

```systemverilog
// In hazard_unit.sv
logic csr_use_hazard;
assign csr_use_hazard = id_ex_is_csr &&    // Is the instruction in EX a CSR write?
                        (id_ex_rd != 5'h0) &&
                        ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2));

assign hazard_stall = load_use_hazard || alu_branch_hazard || load_branch_hazard || csr_use_hazard;
```

### Fix 2: CSR Immediate Forwarding

If the CSR module needs to forward the written value immediately within the same cycle, modify `csr_regfile.sv`:

```systemverilog
// Add bypass logic for CSR read immediately after write
always_comb begin
    // Default read from register
    logic [31:0] sscratch_read = sscratch;
    
    // If writing to sscratch in this cycle, forward new value
    if (csr_op != CSR_OP_NONE && csr_addr == CSR_SSCRATCH)
        sscratch_read = csr_new_value;
    
    // Use sscratch_read instead of sscratch in the case statement
end
```

## Next Steps

Run the simulation with added debug logging to identify exactly which signal is incorrect. The most likely culprit is either:

1. Missing hazard stall when `bnez` needs sp from `csrrw`
2. CSR forwarding not working for consecutive CSR operations
