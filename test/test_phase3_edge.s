# Edge Case Test: Byte-Level Write-Allocate and Partial Word Writes
# This test focuses on verifying correct behavior with byte enables during write-allocate

.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    
    # Print header
    li   a0, 'E'
    sb   a0, 0(t0)
    li   a0, 'D'
    sb   a0, 0(t0)
    li   a0, 'G'
    sb   a0, 0(t0)
    li   a0, 'E'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    #==========================================================================
    # Test 1: Byte Write-Allocate to Word Offset 0
    #==========================================================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    li   t1, 0x80002400       # New address (set different from comprehensive test)
    
    # Write single byte (Miss -> Allocate -> Merge)
    li   t2, 0xAB
    sb   t2, 0(t1)
    
    # Read back entire word
    lw   t3, 0(t1)
    
    # The word should have 0xAB in byte 0, rest should be from memory (likely 0)
    # Extract byte 0
    andi t4, t3, 0xFF
    bne  t4, t2, test1_fail
    
    # Write another byte to same word
    li   t5, 0xCD
    sb   t5, 1(t1)
    
    # Read back
    lw   t3, 0(t1)
    
    # Check both bytes
    andi t4, t3, 0xFF
    bne  t4, t2, test1_fail
    
    srli t6, t3, 8
    andi t6, t6, 0xFF
    bne  t6, t5, test1_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    test2

test1_fail:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'I'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

    #==========================================================================
    # Test 2: Halfword Write-Allocate to Different Offsets
    #==========================================================================
test2:
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    li   t1, 0x80002500
    
    # Write halfword to offset 0 (Miss -> Allocate)
    li   t2, 0x1234
    sh   t2, 0(t1)
    
    # Read back
    lw   t3, 0(t1)
    li   t4, 0xFFFF
    and  t5, t3, t4
    bne  t5, t2, test2_fail
    
    # Write halfword to offset 2 (upper half of same word)
    li   t2, 0x5678
    sh   t2, 2(t1)
    
    # Read back entire word
    lw   t3, 0(t1)
    
    # Should be 0x56781234
    lui  t4, 0x56781
    addi t4, t4, 0x234
    bne  t3, t4, test2_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    test3

test2_fail:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'I'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

    #==========================================================================
    # Test 3: Write-Allocate to Word Offset 3 (Last Word in Line)
    #==========================================================================
test3:
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '3'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    li   t1, 0x80002600
    
    # Write to word offset 3 (byte offset 12) - last word in cache line
    li   t2, 0x99999999
    sw   t2, 12(t1)
    
    # Read back
    lw   t3, 12(t1)
    bne  t3, t2, test3_fail
    
    # Also verify isolation - write to word 0
    li   t4, 0x12341234
    sw   t4, 0(t1)
    
    # Read word 3 again - should still be 0x99999999
    lw   t5, 12(t1)
    bne  t5, t2, test3_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    test4

test3_fail:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'I'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

    #==========================================================================
    # Test 4: Byte Write to Word Offset 3 During Allocate
    #==========================================================================
test4:
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '4'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    li   t1, 0x80002700
    
    # Byte write to offset 15 (word 3, byte 3) - CRITICAL edge case
    li   t2, 0xEF
    sb   t2, 15(t1)
    
    # Read back word 3
    lw   t3, 12(t1)
    
    # Extract byte 3
    srli t4, t3, 24
    andi t4, t4, 0xFF
    bne  t4, t2, test4_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    test5

test4_fail:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'I'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

    #==========================================================================
    # Test 5: Mixed Operations on Same Cache Line
    #==========================================================================
test5:
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '5'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    li   t1, 0x80002800
    
    # Start with byte write (allocate)
    li   t2, 0x11
    sb   t2, 0(t1)
    
    # Halfword write to offset 4
    li   t3, 0x2233
    sh   t3, 4(t1)
    
    # Word write to offset 8
    li   t4, 0x44556677
    sw   t4, 8(t1)
    
    # Byte write to offset 14
    li   t5, 0x88
    sb   t5, 14(t1)
    
    # Read back and verify each
    lw   s0, 0(t1)
    andi s1, s0, 0xFF
    bne  s1, t2, test5_fail
    
    lw   s0, 4(t1)
    li   s2, 0xFFFF
    and  s1, s0, s2
    bne  s1, t3, test5_fail
    
    lw   s0, 8(t1)
    bne  s0, t4, test5_fail
    
    lw   s0, 12(t1)
    srli s0, s0, 16
    andi s1, s0, 0xFF
    bne  s1, t5, test5_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    pass

test5_fail:
    li   a0, 'F'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'I'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

    #==========================================================================
    # All Tests Passed
    #==========================================================================
pass:
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    li   a0, 'L'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

done:
    j    done
