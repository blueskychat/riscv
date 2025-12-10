# Super minimal test - just print what happens step by step
.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    li   t1, 0x80002000       # Test address
    
    # Print A
    li   a0, 'A'
    sb   a0, 0(t0)
    
    # Write
    li   t2, 0x12345678
    sw   t2, 0(t1)
    
    # Print B
    li   a0, 'B'
    sb   a0, 0(t0)
    
    # Read
    lw   t3, 0(t1)
    
    # Print C
    li   a0, 'C'
    sb   a0, 0(t0)
    
    # Compare and print result
    li   t4, 0x12345678
    beq  t3, t4, ok
    
    li   a0, 'X'
    sb   a0, 0(t0)
    j    done
    
ok:
    li   a0, 'Y'
    sb   a0, 0(t0)
    
done:
    li   a0, '\n'
    sb   a0, 0(t0)
loop:
    j    loop
