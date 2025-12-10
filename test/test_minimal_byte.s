# Minimal Debug Test for Byte Write-Allocate
# Simplest possible test to debug the issue

.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    
    # Print START
    li   a0, 'S'
    sb   a0, 0(t0)
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'R'
    sb   a0, 0(t0)
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    li   t1, 0x80002400       # Test address
    
    # Print "WR:"
    li   a0, 'W'
    sb   a0, 0(t0)
    li   a0, 'R'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    
    # Write single byte value 0xAB
    li   t2, 0xAB
    sb   t2, 0(t1)
    
    # Print "RD:"
    li   a0, 'R'
    sb   a0, 0(t0)
    li   a0, 'D'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    
    # Read back word
    lw   t3, 0(t1)
    
    # Extract and check byte 0
    andi t4, t3, 0xFF
    
    # Print result byte in hex (simple version - just check if equal)
    bne  t4, t2, fail
    
    # SUCCESS
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

fail:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'I'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    
    # Print what we expected vs got
    li   a0, ' '
    sb   a0, 0(t0)
    li   a0, 'E'
    sb   a0, 0(t0)
    li   a0, '='
    sb   a0, 0(t0)
    
    # Print expected (0xAB in ASCII hex - simplified)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'B'
    sb   a0, 0(t0)
    
    li   a0, ' '
    sb   a0, 0(t0)
    li   a0, 'G'
    sb   a0, 0(t0)
    li   a0, '='
    sb   a0, 0(t0)
    
    # Print actual (t4 bits)
    # This is tricky without a hex print function
    # Just print marker
    li   a0, '?'
    sb   a0, 0(t0)
    
    li   a0, '\n'
    sb   a0, 0(t0)

done:
    j    done
