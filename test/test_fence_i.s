# Test FENCE.I instruction
# This test modifies code in memory, executes FENCE.I, then runs the modified code

.section .text
.globl _start

_start:
    # Setup: t0 = magic print address
    li      t0, 0x90000000      # Magic address for simulation output
    
    # Print '1' to show test started
    li      t1, '1'
    sw      t1, 0(t0)
    
    # ========================================
    # Test 1: Simple FENCE (should be NOP)
    # ========================================
    fence                       # Should pass through as NOP
    
    # Print '2' - FENCE passed
    li      t1, '2'
    sw      t1, 0(t0)
    
    # ========================================
    # Test 2: FENCE.I with self-modifying code
    # ========================================
    # We will:
    # 1. Store a new instruction at target_location
    # 2. Execute fence.i to flush DCache and invalidate ICache
    # 3. Jump to target_location and execute the new instruction
    
    # The original instruction at target_location is:
    #   li t1, 'X'  (prints 'X' if unmodified)
    # We will modify it to:
    #   li t1, '3'  (prints '3' if modified correctly)
    
    # First, let's make the DCache dirty by writing some data
    li      t2, 0x80400000      # Address in EXTRAM (cacheable)
    li      t3, 0xDEADBEEF
    sw      t3, 0(t2)
    sw      t3, 4(t2)
    sw      t3, 8(t2)
    sw      t3, 12(t2)
    
    # Now modify the instruction at target_location
    # li t1, '3' = addi t1, x0, '3' = addi x6, x0, 0x33
    # Encoding: imm[11:0] | rs1 | funct3 | rd | opcode
    #           0x033     | 0   | 000    | 6  | 0010011
    # = 0x03300313
    la      t4, target_location
    li      t5, 0x03300313      # li t1, '3'
    sw      t5, 0(t4)           # Write new instruction to memory
    
    # Execute FENCE.I to synchronize instruction memory
    fence.i
    
    # Jump to the modified code
    j       target_location
    
after_modify:
    # Print '4' - test completed
    li      t1, '4'
    sw      t1, 0(t0)
    
    # Print newline
    li      t1, '\n'
    sw      t1, 0(t0)
    
    # Success loop
success_loop:
    j       success_loop

# ========================================
# Target location for self-modification
# ========================================
.align 4
target_location:
    li      t1, 'X'             # Original instruction (will be overwritten)
    sw      t1, 0(t0)           # Print the character
    j       after_modify


.section .data
.align 4
test_data:
    .word 0x11111111
    .word 0x22222222
