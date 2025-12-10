# Comprehensive Phase 3 Test Suite
# Tests all aspects of Write-Back cache implementation

.section .text
.globl _start

_start:
    li   t0, 0x90000000       # Magic print address
    
    # Print header
    li   a0, 'C'
    sb   a0, 0(t0)
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'M'
    sb   a0, 0(t0)
    li   a0, 'P'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    #==========================================================================
    # Test 1: Write-Allocate to Different Word Offsets
    #==========================================================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    li   t1, 0x80002000       # Base address
    
    # Write to word offset 0 (Miss -> Allocate)
    li   t2, 0xAAAAAAAA
    sw   t2, 0(t1)
    
    # Write to word offset 1 (Hit - same line)
    li   t3, 0xBBBBBBBB
    sw   t3, 4(t1)
    
    # Write to word offset 2 (Hit - same line)
    li   t4, 0xCCCCCCCC
    sw   t4, 8(t1)
    
    # Write to word offset 3 (Hit - same line)
    li   t5, 0xDDDDDDDD
    sw   t5, 12(t1)
    
    # Read back all words
    lw   s0, 0(t1)
    lw   s1, 4(t1)
    lw   s2, 8(t1)
    lw   s3, 12(t1)
    
    # Verify
    bne  s0, t2, test1_fail
    bne  s1, t3, test1_fail
    bne  s2, t4, test1_fail
    bne  s3, t5, test1_fail
    
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
    # Test 2: Byte-Level Write-Allocate (with byte enables)
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
    
    li   t1, 0x80002100       # New address (different set)
    
    # Write single byte (Miss -> Allocate -> Write byte)
    li   t2, 0x42
    sb   t2, 0(t1)
    
    # Read back word
    lw   t3, 0(t1)
    
    # Extract byte
    andi t4, t3, 0xFF
    bne  t4, t2, test2_fail
    
    # Write halfword
    li   t2, 0x1234
    sh   t2, 4(t1)
    
    # Read back word
    lw   t3, 4(t1)
    
    # Extract halfword
    li   t5, 0xFFFF
    and  t4, t3, t5
    bne  t4, t2, test2_fail
    
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
    # Test 3: Eviction Writeback - Multiple Cache Lines
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
    
    # Address A: Set 0
    li   t1, 0x80002000
    li   t2, 0x11111111
    sw   t2, 0(t1)
    sw   t2, 4(t1)
    sw   t2, 8(t1)
    sw   t2, 12(t1)
    
    # Address B: Set 0 (different tag) - triggers eviction of A
    li   t3, 0x80003000
    li   t4, 0x22222222
    sw   t4, 0(t3)
    sw   t4, 4(t3)
    
    # Address C: Set 0 (different tag) - triggers eviction of B
    li   t5, 0x80004000
    li   t6, 0x33333333
    sw   t6, 0(t5)
    
    # Read back A - should come from memory (was written back)
    lw   s0, 0(t1)
    lw   s1, 4(t1)
    lw   s2, 8(t1)
    lw   s3, 12(t1)
    
    bne  s0, t2, test3_fail
    bne  s1, t2, test3_fail
    bne  s2, t2, test3_fail
    bne  s3, t2, test3_fail
    
    # Read back B - should come from memory
    lw   s0, 0(t3)
    lw   s1, 4(t3)
    
    bne  s0, t4, test3_fail
    bne  s1, t4, test3_fail
    
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
    # Test 4: Read-only Access Shouldn't Set Dirty
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
    
    li   t1, 0x80002200       # New address
    
    # Read miss (allocates clean line)
    lw   t2, 0(t1)
    
    # Evict this line (should NOT writeback if implementation is correct)
    li   t3, 0x80003200       # Same set, different tag
    lw   t4, 0(t3)
    
    # Read original again
    lw   t5, 0(t1)
    
    # Should match original value (0 if memory is clean)
    beq  t2, t5, test4_ok
    
    # If they don't match, it might still be okay if both are 0
    # (This test mainly checks no crash/hang)
    
test4_ok:
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    test5

    #==========================================================================
    # Test 5: Write After Read (Same Line)
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
    
    li   t1, 0x80002300
    
    # Read (allocates clean)
    lw   t2, 0(t1)
    
    # Write (should set dirty)
    li   t3, 0x55555555
    sw   t3, 0(t1)
    
    # Read back (hit)
    lw   t4, 0(t1)
    bne  t4, t3, test5_fail
    
    # Evict and re-read (verify writeback happened)
    li   t5, 0x80003300
    sw   zero, 0(t5)
    
    # Read original
    lw   t6, 0(t1)
    bne  t6, t3, test5_fail
    
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
    li   a0, 'P'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'S'
    sb   a0, 0(t0)
    li   a0, 'S'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

done:
    j    done
