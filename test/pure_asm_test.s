# Pure ASM test - no C runtime needed
# Entry point at 0x80000000

    # Print START immediately
    li t0, 0x90000000
    li t1, 'S'
    sb t1, 0(t0)
    li t1, 'T'
    sb t1, 0(t0)
    li t1, 'A'
    sb t1, 0(t0)
    li t1, 'R'
    sb t1, 0(t0)
    li t1, 'T'
    sb t1, 0(t0)
    li t1, 10
    sb t1, 0(t0)
    
    # Test write
    li t2, 0x80400000
    li t3, 0x12345678
    sw t3, 0(t2)
    
    # Print after write
    li t1, 'W'
    sb t1, 0(t0)
    li t1, 10
    sb t1, 0(t0)
    
    # Test read
    lw t4, 0(t2)
    
    # Print after read
    li t1, 'R'
    sb t1, 0(t0)
    li t1, 10
    sb t1, 0(t0)
    
    # Check if value matches
    beq t3, t4, pass
    
    # FAIL
    li t1, 'F'
    sb t1, 0(t0)
    li t1, 'A'
    sb t1, 0(t0)
    li t1, 'I'
    sb t1, 0(t0)
    li t1, 'L'
    sb t1, 0(t0)
    li t1, 10
    sb t1, 0(t0)
    j done
    
pass:
    # PASS
    li t1, 'P'
    sb t1, 0(t0)
    li t1, 'A'
    sb t1, 0(t0)
    li t1, 'S'
    sb t1, 0(t0)
    li t1, 'S'
    sb t1, 0(t0)
    li t1, 10
    sb t1, 0(t0)
    
done:
    j done
