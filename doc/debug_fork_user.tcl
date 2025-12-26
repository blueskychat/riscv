# ============================================================
# Fork User Mode Debug TCL Script for Vivado
# 用于调查 fork 后子进程返回用户态时的 Illegal Instruction 问题
# 使用方法: source D:/sqw/code/verilogtest/riscv/riscv.srcs/doc/debug_fork_user.tcl
# ============================================================

# ============================================================
# 1. 关键触发点：mcause (M-mode trap)
# ============================================================
add_wave_divider "=== M-MODE TRAP ==="
add_wave -radix unsigned /testbench/dut/priv_mode
add_wave -radix hex /testbench/dut/pc

# 如果有 M-mode 相关信号
# add_wave -radix hex /testbench/dut/mcause
# add_wave -radix hex /testbench/dut/mepc

# ============================================================
# 2. sret 执行跟踪
# ============================================================
add_wave_divider "=== SRET EXECUTION ==="
add_wave /testbench/dut/ex_sret
add_wave -radix hex /testbench/dut/sepc_out
add_wave -radix unsigned /testbench/dut/u_csr/current_priv

# ============================================================
# 3. 取指阶段（重点关注）
# ============================================================
add_wave_divider "=== INSTRUCTION FETCH ==="
add_wave -radix hex /testbench/dut/pc
add_wave -radix hex /testbench/dut/if_id_reg.pc
add_wave -radix hex /testbench/dut/if_id_reg.inst

# ICache 详细信号
add_wave -radix hex /testbench/dut/u_if_stage/u_icache/pc_i
add_wave /testbench/dut/u_if_stage/u_icache/fetch_en_i
add_wave -radix hex /testbench/dut/u_if_stage/u_icache/inst_o
add_wave /testbench/dut/u_if_stage/u_icache/ready_o
add_wave /testbench/dut/u_if_stage/u_icache/state

# ============================================================
# 4. IMMU 翻译（检查 VA->PA）
# ============================================================
add_wave_divider "=== IMMU TRANSLATION ==="
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/vaddr
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/paddr
add_wave /testbench/dut/u_if_stage/u_immu/translate_done
add_wave /testbench/dut/u_if_stage/u_immu/page_fault
add_wave /testbench/dut/u_if_stage/u_immu/tlb_hit
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/tlb_paddr

# ============================================================
# 5. Wishbone 指令总线（检查实际取回的数据）
# ============================================================
add_wave_divider "=== WISHBONE INST BUS ==="
add_wave -radix hex /testbench/dut/wb_inst_adr
add_wave -radix hex /testbench/dut/wb_inst_dat_i
add_wave /testbench/dut/wb_inst_stb
add_wave /testbench/dut/wb_inst_ack
add_wave /testbench/dut/wb_inst_cyc

# ============================================================
# 6. 异常检测（关键：什么触发了 illegal）
# ============================================================
add_wave_divider "=== EXCEPTION DETECTION ==="
add_wave /testbench/dut/ex_illegal
add_wave /testbench/dut/trap_enter
add_wave -radix unsigned /testbench/dut/trap_cause
add_wave -radix hex /testbench/dut/trap_pc
add_wave -radix hex /testbench/dut/trap_val

# ID 阶段的指令（解码时看到什么）- 如果信号存在则取消注释
# add_wave -radix hex /testbench/dut/id_ex_reg.inst

# ============================================================
# 7. fence.i 执行跟踪
# ============================================================
add_wave_divider "=== FENCE.I ==="
# 如果有 fence.i 相关信号
# add_wave /testbench/dut/fence_i_exec
# add_wave /testbench/dut/icache_invalidate

# ============================================================
# 8. SATP 和 PTW 页表遍历（关键！）
# ============================================================
add_wave_divider "=== SATP & PTW ==="
add_wave -radix hex /testbench/dut/satp_out
add_wave /testbench/dut/paging_enabled
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/satp
add_wave /testbench/dut/u_if_stage/u_immu/state

# PTW 信号
add_wave -radix hex /testbench/dut/immu_ptw_addr
add_wave /testbench/dut/immu_ptw_req
add_wave -radix hex /testbench/dut/immu_ptw_data
add_wave /testbench/dut/immu_ptw_ack

# IMMU 内部 PTW 状态
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/pte
add_wave -radix unsigned /testbench/dut/u_if_stage/u_immu/ptw_level

puts "PTW signals added! 检查 VA 0x00801xxx 翻译时 PTW 行为"
