# Ultra simple test - just compare two values
.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    li   s0, 0x80002000       # Test address
    
    # A
    li   a0, 'A'
    sb   a0, 0(t0)
    
    # Write miss
    li   s1, 0x12345678
    sw   s1, 0(s0)
    
    # B
    li   a0, 'B'
    sb   a0, 0(t0)
    
    # Read miss
    lw   s2, 0(s0)
    
    # C
    li   a0, 'C'
    sb   a0, 0(t0)
    
    # Write hit
    li   s3, 0xDEADBEEF
    sw   s3, 0(s0)
    
    # D
    li   a0, 'D'
    sb   a0, 0(t0)
    
    # Read hit 
    lw   s4, 0(s0)
    
    # E
    li   a0, 'E'
    sb   a0, 0(t0)
    
    # Check s4 == s3
    beq  s4, s3, pass
    
    # Failed
    li   a0, 'X'
    sb   a0, 0(t0)
    
    # Print low byte of s4 as hex digit
    andi t1, s4, 0xF
    li   t2, 10
    blt  t1, t2, lt10
    addi t1, t1, 39       # 'a' - 10
    j    print
lt10:
    addi t1, t1, 48       # '0'
print:
    sb   t1, 0(t0)
    
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done
    
pass:
    li   a0, 'Y'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
done:
    j    done
