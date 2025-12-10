# Minimal test for write-through
.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    li   s0, 0x80002000       # Test address (use s0 for stability)
    
    # A - start
    li   a0, 'A'
    sb   a0, 0(t0)
    
    # Write miss
    li   s1, 0x12345678
    sw   s1, 0(s0)
    
    # B - after write miss
    li   a0, 'B'
    sb   a0, 0(t0)
    
    # Read miss (fill cache)
    lw   s2, 0(s0)
    
    # C - after read
    li   a0, 'C'
    sb   a0, 0(t0)
    
    # Check first read
    bne  s2, s1, fail
    
    # D - first check passed
    li   a0, 'D'
    sb   a0, 0(t0)
    
    # Write hit (write-through)
    li   s3, 0xDEADBEEF
    sw   s3, 0(s0)
    
    # E - after write-through
    li   a0, 'E'
    sb   a0, 0(t0)
    
    # Read hit
    lw   s4, 0(s0)
    
    # F - after read hit
    li   a0, 'F'
    sb   a0, 0(t0)
    
    # Check - use s-regs to avoid any conflicts
    bne  s4, s3, fail
    
    # Pass
    li   a0, 'P'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done
    
fail:
    li   a0, 'X'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
done:
    j    done
