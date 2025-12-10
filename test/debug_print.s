# Debug test - print actual values read from cache
.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    li   s0, 0x80002000       # Test address
    
    # Write miss
    li   s1, 0x12345678
    sw   s1, 0(s0)
    
    # Read miss (fill cache)
    lw   s2, 0(s0)
    
    # Print first byte of s2 (should be 0x78)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    andi a0, s2, 0xFF
    # Convert to hex
    li   t1, 10
    blt  a0, t1, digit1
    addi a0, a0, 7
digit1:
    addi a0, a0, '0'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Write hit (write-through)
    li   s3, 0xDEADBEEF
    sw   s3, 0(s0)
    
    # Read hit
    lw   s4, 0(s0)
    
    # Print first byte of s4 (should be 0xEF)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    andi a0, s4, 0xFF
    li   t1, 10
    blt  a0, t1, digit2
    addi a0, a0, 7
digit2:
    addi a0, a0, '0'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Print expected first byte (should be 0xEF)
    li   a0, 'E'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    andi a0, s3, 0xFF
    li   t1, 10
    blt  a0, t1, digit3
    addi a0, a0, 7
digit3:
    addi a0, a0, '0'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Compare
    beq  s4, s3, pass
    
    li   a0, 'X'
    sb   a0, 0(t0)
    j    done
    
pass:
    li   a0, 'Y'
    sb   a0, 0(t0)
    
done:
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done
