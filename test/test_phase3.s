# Phase 3 Test: L1 Write-Back Cache
# Test Write-Allocate, Dirty Bit, and Eviction Writeback

.section .text
.globl _start

_start:
    # Initialize magic print address
    li   t0, 0x90000000       # Magic print address

    # ========================================
    # Print "P3: " header
    # ========================================
    li   a0, 'P'
    sb   a0, 0(t0)
    li   a0, '3'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # ========================================
    # Test 1: Write-Allocate (Miss -> Refill -> Write)
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    li   t1, 0x80002000       # Address A (Set 0)
    
    # Store to A (Miss). Should trigger Refill, then Write 0x11111111
    li   t2, 0x11111111
    sw   t2, 0(t1)
    
    # Read back immediately (Hit). Should be 0x11111111
    lw   t3, 0(t1)
    bne  t3, t2, test1_fail
    
    # Test 1 passed
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 2: Write Hit (Dirty)
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Store new value to A (Hit). Should update cache, set Dirty=1.
    li   t4, 0x22222222
    sw   t4, 0(t1)
    
    # Read back (Hit). Should be 0x22222222
    lw   t5, 0(t1)
    bne  t5, t4, test2_fail
    
    # Test 2 passed
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 3: Eviction Writeback
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '3'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Use Address B which maps to same set 0 (Index 0), but different Tag
    # 0x80002000 -> Tag 0x200008, Index 0
    # 0x80003000 -> Tag 0x20000C, Index 0
    # Difference is 0x1000 (4KB), which is > 1KB cache size
    li   t6, 0x80003000       # Address B
    
    # Write to B (Miss).
    # This should trigger EVICTION of A.
    # A is Dirty (0x22222222), so it must be written to memory.
    # Then B is refilled and written (0x33333333).
    li   s0, 0x33333333
    sw   s0, 0(t6)
    
    # Read B (Hit). verify B is correct in cache
    lw   s1, 0(t6)
    bne  s1, s0, test3_fail_B

    # Read A (Miss).
    # This should trigger EVICTION of B (Dirty -> Write B to memory).
    # Then Refill A from memory.
    # IMPROTANT: Since A was written back earlier, memory should have 0x22222222.
    lw   s2, 0(t1)
    
    # Verify A has the value we wrote back
    li   s3, 0x22222222
    bne  s2, s3, test3_fail_A
    
    # Test 3 passed
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    pass

test1_fail:
    li   a0, '1'
    j    fail_print
test2_fail:
    li   a0, '2'
    j    fail_print
test3_fail_B:
    li   a0, '3'
    sb   a0, 0(t0) # '3'
    li   a0, 'B'
    j    fail_print
test3_fail_A:
    li   a0, '3'
    sb   a0, 0(t0) # '3'
    li   a0, 'A'
    j    fail_print

fail_print:
    sb   a0, 0(t0) # Print specific fail code
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

pass:
    # PASS message
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
