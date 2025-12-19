# test_sfence_vma.s - SFENCE.VMA Instruction Integration Test
# Tests SFENCE.VMA instruction execution in the CPU pipeline

.section .text
.globl _start

# ============================================================================
# SFENCE.VMA 指令编码:
# funct7[31:25] = 0001001 (7'h09)
# rs2[24:20]    = ASID register (0 for flush all ASIDs)
# rs1[19:15]    = VPN register (0 for flush all addresses)
# funct3[14:12] = 000
# rd[11:7]      = 00000 (always 0)
# opcode[6:0]   = 1110011 (SYSTEM)
#
# SFENCE.VMA x0, x0 = 0001001_00000_00000_000_00000_1110011 = 0x12000073
# SFENCE.VMA rs1, x0 = 0001001_00000_rs1_000_00000_1110011
# ============================================================================

# Magic address for simulation output
.equ MAGIC_ADDR, 0x90000000

_start:
    # ========== Test Setup ==========
    
    # Print test header
    la   t0, msg_start
    jal  ra, print_string
    
    # ========== Test 1: SFENCE.VMA x0, x0 (Flush All) ==========
    la   t0, msg_test1
    jal  ra, print_string
    
    # Execute SFENCE.VMA x0, x0 - flush all TLB entries
    # Encoding: 0x12000073
    .word 0x12000073
    
    # If we get here without exception, test passed
    la   t0, msg_pass
    jal  ra, print_string
    
    # ========== Test 2: SFENCE.VMA rs1, x0 (Selective Flush) ==========
    la   t0, msg_test2
    jal  ra, print_string
    
    # Load a virtual address into t1
    li   t1, 0x12345000      # Example VPN address
    
    # Execute SFENCE.VMA t1, x0 - flush TLB entry for VPN in t1
    # SFENCE.VMA t1, x0 where t1 = x6
    # Encoding: 0001001_00000_00110_000_00000_1110011 = 0x12030073
    .word 0x12030073         # SFENCE.VMA x6, x0
    
    la   t0, msg_pass
    jal  ra, print_string
    
    # ========== Test 3: SFENCE.VMA with different registers ==========
    la   t0, msg_test3
    jal  ra, print_string
    
    # Use a2 (x12) as address register
    li   a2, 0x80000000
    
    # SFENCE.VMA a2, x0
    # Encoding: 0001001_00000_01100_000_00000_1110011 = 0x12060073
    .word 0x12060073
    
    la   t0, msg_pass
    jal  ra, print_string
    
    # ========== Test 4: Multiple SFENCE.VMA in sequence ==========
    la   t0, msg_test4
    jal  ra, print_string
    
    # Execute multiple SFENCE.VMA instructions
    .word 0x12000073         # SFENCE.VMA x0, x0
    .word 0x12000073         # SFENCE.VMA x0, x0
    .word 0x12000073         # SFENCE.VMA x0, x0
    
    la   t0, msg_pass
    jal  ra, print_string
    
    # ========== Test 5: SFENCE.VMA after memory operations ==========
    la   t0, msg_test5
    jal  ra, print_string
    
    # Do some memory operations first
    li   t2, 0x80400000
    sw   zero, 0(t2)
    lw   t3, 0(t2)
    
    # Then flush TLB
    .word 0x12000073         # SFENCE.VMA x0, x0
    
    # More memory operations after flush
    sw   t3, 4(t2)
    lw   t4, 4(t2)
    
    la   t0, msg_pass
    jal  ra, print_string
    
    # ========== All Tests Complete ==========
    la   t0, msg_complete
    jal  ra, print_string
    
test_pass:
    # Indicate success
    li   t0, MAGIC_ADDR
    li   t1, 'P'
    sb   t1, 0(t0)
    li   t1, 'A'
    sb   t1, 0(t0)
    li   t1, 'S'
    sb   t1, 0(t0)
    sb   t1, 0(t0)
    li   t1, '\n'
    sb   t1, 0(t0)

infinite_loop:
    j    infinite_loop

# ============================================================================
# Subroutines
# ============================================================================

# print_string: Print null-terminated string at address in t0
print_string:
    li   t2, MAGIC_ADDR
print_loop:
    lb   t3, 0(t0)
    beqz t3, print_done
    sb   t3, 0(t2)
    addi t0, t0, 1
    j    print_loop
print_done:
    ret

# ============================================================================
# Data Section
# ============================================================================

.section .rodata

msg_start:
    .asciz "=== SFENCE.VMA Test Suite ===\n"

msg_test1:
    .asciz "Test 1: SFENCE.VMA x0, x0 (flush all)... "

msg_test2:
    .asciz "Test 2: SFENCE.VMA rs1, x0 (selective)... "

msg_test3:
    .asciz "Test 3: SFENCE.VMA with a2 register... "

msg_test4:
    .asciz "Test 4: Multiple SFENCE.VMA... "

msg_test5:
    .asciz "Test 5: SFENCE.VMA after memory ops... "

msg_pass:
    .asciz "PASS\n"

msg_complete:
    .asciz "=== All Tests Complete ===\n"

.section .data
    .align 4
test_data:
    .word 0x12345678
