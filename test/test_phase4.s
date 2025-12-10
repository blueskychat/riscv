# Phase 4 Test: L2 Cache (Read-Only)
# Test L1 miss -> L2 hit/miss scenarios

.section .text
.globl _start

_start:
    # Initialize magic print address
    li   t0, 0x90000000       # Magic print address

    # ========================================
    # Print "P4: " header
    # ========================================
    li   a0, 'P'
    sb   a0, 0(t0)
    li   a0, '4'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # ========================================
    # Test 1: Cold Miss (L1 miss -> L2 miss -> Memory)
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    li   t1, 0x80002000       # Address A (L1 set 0, L2 set 0)
    
    # Read from A (Cold miss)
    # Expected: L1 miss -> L2 miss -> fetch from memory -> fill L2 -> fill L1
    lw   t2, 0(t1)
    
    # Read again from same address (Should be L1 hit now)
    lw   t3, 0(t1)
    bne  t2, t3, test1_fail
    
    # Test 1 passed
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 2: L1 Eviction -> L2 Hit
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Access Address B which maps to same L1 set but different tag
    # This evicts address A from L1, but A is still in L2
    li   t4, 0x80003000       # Different L1 tag, may be same/different L2 set
    lw   t5, 0(t4)
    
    # Read A again (L1 miss -> L2 should hit -> fillL1)
    lw   t6, 0(t1)
    bne  t2, t6, test2_fail
    
    # Test 2 passed
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 3: L2 Capacity Test (Multiple Addresses)
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '3'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Access several addresses to test L2 capacity
    # L1 is 1KB (64 sets x 16B), L2 is 32KB (512 sets x 4 ways x 16B)
    # Access addresses spanning more than L1 but within L2
    
    li   s0, 0x80002000       # Base
    li   s1, 8                # Counter
    
test3_loop:
    lw   t2, 0(s0)            # Load from current address
    addi s0, s0, 0x400        # Skip 1KB (evict from L1)
    addi s1, s1, -1
    bnez s1, test3_loop
    
    # If we got here without hanging, test passed
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
