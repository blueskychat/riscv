# Test lw followed by sw - reproducing the hang
_start:
    li t5, 0x90000000
    li t6, 'A'
    sb t6, 0(t5)
    
    li t0, 0x80400000
    
    # First do lw
    li t6, 'B'
    sb t6, 0(t5)
    lw t1, 0(t0)
    
    li t6, 'C'
    sb t6, 0(t5)
    
    # Then sw - THIS SHOULD HANG
    sw t1, 0(t0)
    
    li t6, 'D'
    sb t6, 0(t5)
    
    li t6, 'O'
    sb t6, 0(t5)
    li t6, 'K'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
done:
    j done
