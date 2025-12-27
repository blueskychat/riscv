# ============================================================
# PTW DCache Debug TCL Script for Vivado
# 调查 PTW 通过 DCache 读取页表时返回 0 的问题
# 使用方法: source D:/sqw/code/verilogtest/riscv/riscv.srcs/doc/debug_ptw_dcache.tcl
# ============================================================

# ============================================================
# 1. PTW Arbiter 状态
# ============================================================
add_wave_divider "=== PTW ARBITER ==="
add_wave /testbench/dut/u_ptw_arbiter/state
add_wave /testbench/dut/u_ptw_arbiter/serving_immu
add_wave /testbench/dut/u_ptw_arbiter/serving_dmmu
add_wave /testbench/dut/u_ptw_arbiter/grant_immu
add_wave /testbench/dut/u_ptw_arbiter/grant_dmmu

# IMMU PTW 请求
add_wave -radix hex /testbench/dut/immu_ptw_addr
add_wave /testbench/dut/immu_ptw_req
add_wave -radix hex /testbench/dut/immu_ptw_data
add_wave /testbench/dut/immu_ptw_ack

# DCache PTW 端口
add_wave -radix hex /testbench/dut/dcache_ptw_addr
add_wave /testbench/dut/dcache_ptw_req
add_wave -radix hex /testbench/dut/dcache_ptw_data
add_wave /testbench/dut/dcache_ptw_ack

# ============================================================
# 2. DCache 状态机（关键！）
# ============================================================
add_wave_divider "=== DCACHE STATE ==="
add_wave /testbench/dut/u_dcache/state
add_wave /testbench/dut/u_dcache/next_state
add_wave /testbench/dut/u_dcache/current_req_valid
add_wave /testbench/dut/u_dcache/current_req_is_ptw
add_wave -radix hex /testbench/dut/u_dcache/current_req_addr

# ============================================================
# 3. DCache L1 查找（精确检查 hit/miss）
# ============================================================
add_wave_divider "=== DCACHE L1 LOOKUP ==="
add_wave /testbench/dut/u_dcache/is_cacheable
add_wave /testbench/dut/u_dcache/l1_hit
add_wave /testbench/dut/u_dcache/l1_tag_match
add_wave -radix hex /testbench/dut/u_dcache/l1_index
add_wave -radix hex /testbench/dut/u_dcache/l1_tag
add_wave -radix hex /testbench/dut/u_dcache/l1_hit_data

# L1 存储内容（检查 set 0，因为 PTW 地址 0x804d0008 映射到 index 0）
add_wave /testbench/dut/u_dcache/l1_valid[0]
add_wave /testbench/dut/u_dcache/l1_dirty[0]

# ============================================================
# 4. DCache L2 查找
# ============================================================
add_wave_divider "=== DCACHE L2 LOOKUP ==="
add_wave /testbench/dut/u_dcache/l2_hit
add_wave -radix hex /testbench/dut/u_dcache/l2_hit_way
add_wave -radix hex /testbench/dut/u_dcache/l2_lookup_index
add_wave -radix hex /testbench/dut/u_dcache/l2_lookup_tag

# ============================================================
# 5. DCache PTW 响应（关键！）
# ============================================================
add_wave_divider "=== DCACHE PTW RESPONSE ==="
add_wave -radix hex /testbench/dut/u_dcache/ptw_data_comb
add_wave /testbench/dut/u_dcache/ptw_ack_comb
add_wave -radix hex /testbench/dut/u_dcache/ptw_data_o
add_wave /testbench/dut/u_dcache/ptw_ack_o
add_wave /testbench/dut/u_dcache/latched_is_ptw
add_wave -radix hex /testbench/dut/u_dcache/latched_addr

# ============================================================
# 6. IMMU 状态（查看 PTW 流程）
# ============================================================
add_wave_divider "=== IMMU STATE ==="
add_wave /testbench/dut/u_if_stage/u_immu/state
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/saved_vaddr
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/satp_ppn
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/vpn1
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/vpn0
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/pte_reg
add_wave -radix hex /testbench/dut/u_if_stage/u_immu/ptw_data

# ============================================================
# 7. Wishbone 数据总线（DCache 外部访问）
# ============================================================
add_wave_divider "=== WISHBONE DATA BUS ==="
add_wave -radix hex /testbench/dut/wb_data_adr
add_wave -radix hex /testbench/dut/wb_data_dat_i
add_wave /testbench/dut/wb_data_stb
add_wave /testbench/dut/wb_data_ack

# ============================================================
# 8. CPU 写入页表（追踪软件写 PDE）
# ============================================================
add_wave_divider "=== CPU MEMORY WRITE ==="
add_wave -radix hex /testbench/dut/u_dcache/mem_req_addr_i
add_wave -radix hex /testbench/dut/u_dcache/mem_req_wdata_i
add_wave /testbench/dut/u_dcache/mem_req_we_i
add_wave /testbench/dut/u_dcache/mem_req_valid_i

puts "PTW-DCache debug signals added!"
puts "关键检查点："
puts "1. PTW 请求时 is_cacheable 是否为 1？"
puts "2. L1 hit 还是 miss？"
puts "3. 如果 L1 miss，L2 hit 还是 miss？"
puts "4. ptw_data_comb 和 ptw_ack_comb 的值"
