# Test with NOPs between lw and sw to see if timing helps
_start:
    li t5, 0x90000000
    li t6, 'A'
    sb t6, 0(t5)
    
    li a0, 0x80400000
    li a4, 0x1FFFFC
    li s0, 1
    li t0, 0
    li t1, 0
    
    li t6, 'B'
    sb t6, 0(t5)
    
    # lw
    and t0, s0, a4
    add t0, a0, t0
    lw t0, 0(t0)
    
    li t6, 'C'
    sb t6, 0(t5)
    
    # xorshift - exactly like debug_verbose
    xor t0, t0, t1
    xor s0, s0, t0
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    li t6, 'D'
    sb t6, 0(t5)
    
    # sw to DIFFERENT address
    and t1, s0, a4
    add t1, a0, t1
    
    li t6, 'E'
    sb t6, 0(t5)
    
    # This should hang like debug_verbose
    sw t0, 0(t1)
    
    li t6, 'F'
    sb t6, 0(t5)
    
    li t6, 10
    sb t6, 0(t5)
    li t6, 'O'
    sb t6, 0(t5)
    li t6, 'K'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
done:
    j done
