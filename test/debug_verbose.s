# Ultra-verbose debugging - print after EVERY operation
# Only 1 iteration to see exact failure point

_start:
    li t5, 0x90000000
    li t6, '1'
    sb t6, 0(t5)
    
    # Initialize
    li a0, 0x80400000
    li t6, '2'
    sb t6, 0(t5)
    
    li a4, 0x1FFFFC
    li t6, '3'
    sb t6, 0(t5)
    
    li s0, 1
    li t6, '4'
    sb t6, 0(t5)
    
    li t0, 0
    li t6, '5'
    sb t6, 0(t5)
    
    li t1, 0
    li t6, '6'
    sb t6, 0(t5)
    
    # START loop
    li t6, 'A'
    sb t6, 0(t5)
    
    # Calculate read address
    and t0, s0, a4
    li t6, 'B'
    sb t6, 0(t5)
    
    add t0, a0, t0
    li t6, 'C'
    sb t6, 0(t5)
    
    # Try to read - THIS MAY HANG
    lw t0, 0(t0)
    li t6, 'D'
    sb t6, 0(t5)
    
    # XOR
    xor t0, t0, t1
    li t6, 'E'
    sb t6, 0(t5)
    
    xor s0, s0, t0
    li t6, 'F'
    sb t6, 0(t5)
    
    # xorshift line 1
    slli s1, s0, 13
    li t6, 'G'
    sb t6, 0(t5)
    
    xor s0, s0, s1
    li t6, 'H'
    sb t6, 0(t5)
    
    srli s1, s0, 17
    li t6, 'I'
    sb t6, 0(t5)
    
    xor s0, s0, s1
    li t6, 'J'
    sb t6, 0(t5)
    
    slli s1, s0, 5
    li t6, 'K'
    sb t6, 0(t5)
    
    xor s0, s0, s1
    li t6, 'L'
    sb t6, 0(t5)
    
    # Calculate write address
    and t1, s0, a4
    li t6, 'M'
    sb t6, 0(t5)
    
    add t1, a0, t1
    li t6, 'N'
    sb t6, 0(t5)
    
    # Write - THIS MAY ALSO HANG
    sw t0, 0(t1)
    li t6, 'O'
    sb t6, 0(t5)
    
    # mv
    mv t1, t0
    li t6, 'P'
    sb t6, 0(t5)
    
    # Print DONE and halt
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
