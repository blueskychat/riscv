# Debug test - print at every step
    li t0, 0x90000000
    li t1, '1'
    sb t1, 0(t0)
    
    # Setup
    li a0, 0x80400000
    li a3, 5  # Only 5 iterations
    li a4, 0x1FFFFC
    li s0, 1
    li a2, 0
    li t0, 0
    li t1, 0
    
    li t5, 0x90000000
    li t6, '2'
    sb t6, 0(t5)

main_loop:
    li t5, 0x90000000
    li t6, 'A'
    sb t6, 0(t5)
    
    # Calculate address
    and t0, s0, a4
    
    li t5, 0x90000000
    li t6, 'B'
    sb t6, 0(t5)
    
    add t0, a0, t0
    
    li t5, 0x90000000
    li t6, 'C'
    sb t6, 0(t5)
    
    # Read - this might hang
    lw t0, 0(t0)
    
    li t5, 0x90000000
    li t6, 'D'
    sb t6, 0(t5)
    
    # XOR
    xor t0, t0, t1
    xor s0, s0, t0
    
    li t5, 0x90000000
    li t6, 'E'
    sb t6, 0(t5)
    
    # Update s0
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    li t5, 0x90000000
    li t6, 'F'
    sb t6, 0(t5)
    
    # Write
    and t1, s0, a4
    add t1, a0, t1
    sw t0, 0(t1)
    
    li t5, 0x90000000
    li t6, 'G'
    sb t6, 0(t5)
    
    mv t1, t0
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    li t5, 0x90000000
    li t6, 10
    sb t6, 0(t5)
    
    addi a2, a2, 1
    bne a2, a3, main_loop

    li t0, 0x90000000
    li t1, 'O'
    sb t1, 0(t0)
    li t1, 'K'
    sb t1, 0(t0)
    li t1, 10
    sb t1, 0(t0)
done:
    beq zero, zero, done