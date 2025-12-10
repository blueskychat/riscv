# Final Verification Test
# 100 iterations of CryptoNight-like algorithm
# Minimal output to avoid testbench hangs

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
    li a3, 100           # iterations
    li a4, 0x1FFFFC      # mask
    li s0, 1             # s0 = seed
    li a2, 0             # counter
    li t0, 0             # t0
    li t1, 0             # t1
    
main_loop:
    # Print dot every 16 iterations
    andi t4, a2, 0xF
    bnez t4, skip_dot
    li t5, 0x90000000
    li t6, '.'
    sb t6, 0(t5)
skip_dot:
    
    # Read
    and t0, s0, a4
    add t0, a0, t0
    lw t0, 0(t0)
    
    # XOR
    xor t0, t0, t1
    xor s0, s0, t0
    
    # Update s0 (xorshift expanded)
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    # Write
    and t1, s0, a4
    add t1, a0, t1
    sw t0, 0(t1)
    
    # Save t0
    mv t1, t0
    
    # Update s0 again
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    # Loop
    addi a2, a2, 1
    bne a2, a3, main_loop
    
    # Print Result
    li t5, 0x90000000
    li t6, 10
    sb t6, 0(t5)
    
    # Check result: 0x7D4CC322
    li t2, 0x7D4CC322
    beq s0, t2, pass
    
fail:
    li t6, 'F'
    sb t6, 0(t5)
    li t6, 'A'
    sb t6, 0(t5)
    li t6, 'I'
    sb t6, 0(t5)
    li t6, 'L'
    sb t6, 0(t5)
    j done

pass:
    li t6, 'P'
    sb t6, 0(t5)
    li t6, 'A'
    sb t6, 0(t5)
    li t6, 'S'
    sb t6, 0(t5)
    li t6, 'S'
    sb t6, 0(t5)
    
done:
    li t6, 10
    sb t6, 0(t5)
    j done
