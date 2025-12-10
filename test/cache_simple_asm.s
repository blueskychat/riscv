# Simplified cache test - manual xorshift expansion (no macros)
# 10 iterations for quick testing

_start:
    # Print START
    li t5, 0x90000000
    li t6, 'S'
    sb t6, 0(t5)
    li t6, 'T'
    sb t6, 0(t5)
    li t6, 'A'
    sb t6, 0(t5)
    li t6, 'R'
    sb t6, 0(t5)
    li t6, 'T'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
    # Initialize
    li a0, 0x80400000    # base address
    li a3, 10            # only 10 iterations for debugging
    li a4, 0x1FFFFC      # mask
    li s0, 1             # s0 = seed
    li a2, 0             # counter
    li t0, 0             # t0
    li t1, 0             # t1
    
    # Main loop
main_loop:
    # Print dot each iteration
    li t5, 0x90000000
    li t6, '.'
    sb t6, 0(t5)
    
    # Calculate read address: addr = base + (s0 & mask)
    and t0, s0, a4
    add t0, a0, t0
    
    # Read from memory
    lw t0, 0(t0)
    
    # XOR operations
    xor t0, t0, t1
    xor s0, s0, t0
    
    # Update s0 with xorshift - MANUALLY EXPANDED
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    # Calculate write address
    and t1, s0, a4
    add t1, a0, t1
    
    # Write to memory
    sw t0, 0(t1)
    
    # Save t0 for next iteration
    mv t1, t0
    
    # Update s0 again - xorshift manually expanded
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    # Increment counter
    addi a2, a2, 1
    bne a2, a3, main_loop
    
    # Print newline and DONE
    li t5, 0x90000000
    li t6, 10
    sb t6, 0(t5)
    li t6, 'D'
    sb t6, 0(t5)
    li t6, 'O'
    sb t6, 0(t5)
    li t6, 'N'
    sb t6, 0(t5)
    li t6, 'E'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
done:
    j done
