# Test: Two Consecutive Byte Writes to Same Word
# Specifically tests: Write byte 0, then write byte 1

.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    
    li   t1, 0x80002400       # Test address
    
    # Test A: First byte write (allocate)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    
    li   t2, 0xAB
    sb   t2, 0(t1)           # Write byte 0
    
    # Read back
    lw   t3, 0(t1)
    andi t4, t3, 0xFF
    bne  t4, t2, fail_a
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Test B: Second byte write (hit - same word)
    li   a0, 'B'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    
    li   t5, 0xCD
    sb   t5, 1(t1)           # Write byte 1
    
    # Read back word
    lw   t3, 0(t1)
    
    # Check byte 0 still 0xAB
    andi t4, t3, 0xFF
    bne  t4, t2, fail_b_byte0
    
    # Check byte 1 now 0xCD
    srli t6, t3, 8
    andi t6, t6, 0xFF
    bne  t6, t5, fail_b_byte1
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j done

fail_a:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

fail_b_byte0:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'B'
    sb   a0, 0(t0)
    li   a0, '0'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

fail_b_byte1:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'B'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

done:
    j    done
