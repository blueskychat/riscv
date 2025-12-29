# debug_sepc.tcl - 用于调试用户态地址取指问题的波形监控脚本
# 使用方法: 在 Vivado 仿真 Tcl Console 中执行:
#   source D:/sqw/code/verilogtest/riscv/riscv.srcs/debug_sepc.tcl

# 1. 基本信号 - PC 和时钟
add_wave /testbench/clk_50M
add_wave -radix hex /testbench/dut/pc

# 2. CSR 关键寄存器
add_wave -radix hex /testbench/dut/u_csr/sepc
add_wave -radix hex /testbench/dut/u_csr/scause
add_wave -radix hex /testbench/dut/u_csr/stval
add_wave -radix hex /testbench/dut/u_csr/mepc
add_wave -radix hex /testbench/dut/u_csr/mcause

# 3. 分页相关 - 关键！
add_wave -radix hex /testbench/dut/satp_out
add_wave /testbench/dut/paging_enabled
add_wave -radix unsigned /testbench/dut/priv_mode

# 4. IMMU 信号 (在 if_stage 内部)
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/vaddr
add_wave /testbench/dut/u_if_stage/u_immu/translate_req
add_wave /testbench/dut/u_if_stage/u_immu/translate_done
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/paddr
add_wave /testbench/dut/u_if_stage/u_immu/page_fault
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/fault_type
add_wave /testbench/dut/u_if_stage/u_immu/paging_enabled
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/satp

# 5. IMMU 内部状态
add_wave /testbench/dut/u_if_stage/u_immu/state
add_wave /testbench/dut/u_if_stage/u_immu/tlb_hit
add_wave /testbench/dut/u_if_stage/u_immu/tlb_perm_ok
add_wave /testbench/dut/u_if_stage/u_immu/ptw_req
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/ptw_addr
add_wave /testbench/dut/u_if_stage/u_immu/ptw_ack
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/ptw_data

# 6. 寄存器堆关键寄存器
add_wave -radix hex {/testbench/dut/u_id_stage/reg_file[2]}
add_wave -radix hex {/testbench/dut/u_id_stage/reg_file[18]}

# 7. 异常/陷入信号
add_wave /testbench/dut/trap_enter
add_wave -radix hex /testbench/dut/trap_cause
add_wave -radix hex /testbench/dut/trap_pc
add_wave /testbench/dut/u_csr/sret_exec

# 8. ICache Wishbone signals (refill from memory)
add_wave -radix hex /testbench/dut/u_if_stage/u_icache/pc_i
add_wave /testbench/dut/u_if_stage/u_icache/state
add_wave -radix hex /testbench/dut/u_if_stage/u_icache/wb_adr_o
add_wave -radix hex /testbench/dut/u_if_stage/u_icache/wb_dat_i
add_wave /testbench/dut/u_if_stage/u_icache/wb_ack_i
add_wave /testbench/dut/u_if_stage/u_icache/wb_stb_o
add_wave -radix hex /testbench/dut/u_if_stage/u_icache/inst_o
add_wave /testbench/dut/u_if_stage/u_icache/ready_o

# 9. DCache 内存信号
add_wave -radix hex /testbench/dut/dcache_addr
add_wave -radix hex /testbench/dut/dcache_rdata

# 10. fence.i controller
add_wave /testbench/dut/fence_i_state
add_wave /testbench/dut/dcache_flush_req
add_wave /testbench/dut/dcache_flush_done
add_wave /testbench/dut/icache_invalidate

puts "=== Debug waveform loaded ==="
puts "Key signals to watch:"
puts "1. satp_out - should have bit31=1 for Sv32 paging enabled"
puts "2. paging_enabled - should be 1"
puts "3. u_immu/translate_req - should be asserted when fetching from 0x008002d0"
puts "4. u_immu/page_fault - check if page fault occurs"
puts "5. priv_mode - should be 0 (U-mode) after sret"
puts "6. u_icache/wb_dat_i - DATA received from memory during refill"
puts "7. fence_i_state - should go through FLUSH_DCACHE -> INVALIDATE_ICACHE"
