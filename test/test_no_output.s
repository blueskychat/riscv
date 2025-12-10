# Test WITHOUT any sb to magic address
# No output at all, just test if it completes

_start:
    # Initialize
    li a0, 0x80400000
    li a4, 0x1FFFFC
    li s0, 1
    li t0, 0
    li t1, 0
    
    # lw - previously this seemed to hang with magic address sb around it
    and t0, s0, a4
    add t0, a0, t0
    lw t0, 0(t0)
    
    # xorshift
    xor t0, t0, t1
    xor s0, s0, t0
    slli s1, s0, 13
    xor s0, s0, s1
    srli s1, s0, 17
    xor s0, s0, s1
    slli s1, s0, 5
    xor s0, s0, s1
    
    # sw - previously this hung
    and t1, s0, a4
    add t1, a0, t1
    sw t0, 0(t1)
    
    # If we got here, SUCCESS! Output only at the end
    li t5, 0x90000000
    li t6, 'O'
    sb t6, 0(t5)
    li t6, 'K'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
done:
    j done
