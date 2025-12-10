# Minimal debug: just write miss then read
.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    li   t1, 0x80002000       # Test address
    
    # Print 'S' for start
    li   a0, 'S'
    sb   a0, 0(t0)
    
    # Write to memory (miss)
    li   t2, 0x12345678
    sw   t2, 0(t1)
    
    # Print 'W' for write done
    li   a0, 'W'
    sb   a0, 0(t0)
    
    # Read back
    lw   t3, 0(t1)
    
    # Print 'R' for read done
    li   a0, 'R'
    sb   a0, 0(t0)
    
    # Check value
    li   t4, 0x12345678
    beq  t3, t4, pass
    
    # Fail
    li   a0, 'F'
    sb   a0, 0(t0)
    j    done
    
pass:
    li   a0, 'P'
    sb   a0, 0(t0)
    
done:
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done
