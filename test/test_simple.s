# Minimal test - just print "Hi" and loop
    li t0, 0x90000000
    li t1, 'H'
    sb t1, 0(t0)
    li t1, 'i'
    sb t1, 0(t0)
    li t1, 10
    sb t1, 0(t0)
end:
    beq zero, zero, end
