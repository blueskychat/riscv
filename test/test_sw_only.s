# Test sw instruction isolation
# Try different write scenarios to find which one hangs

_start:
    li t5, 0x90000000
    li t6, '1'
    sb t6, 0(t5)
    
    # Scenario 1: Write to 0x80400000 directly
    li t0, 0x80400000
    li t1, 0x12345678
    
    li t6, '2'
    sb t6, 0(t5)
    
    # THIS IS THE PROBLEMATIC sw
    sw t1, 0(t0)
    
    li t6, '3'
    sb t6, 0(t5)
    
    # If we get here, sw worked!
    li t6, 'O'
    sb t6, 0(t5)
    li t6, 'K'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
done:
    j done
