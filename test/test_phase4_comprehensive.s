# Phase 4 Comprehensive Test: L2 Cache
# Tests: L2 hit/miss, LRU replacement, eviction chains, multi-set access

.section .text
.globl _start

_start:
    # Initialize magic print address
    li   t0, 0x90000000

    # Print "P4C: " header
    li   a0, 'P'
    sb   a0, 0(t0)
    li   a0, '4'
    sb   a0, 0(t0)
    li   a0, 'C'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # ========================================
    # Test 1: L2 4-Way Associativity
    # Fill all 4 ways of one L2 set
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # L2 has 512 sets, each set has 4 ways
    # L2 index = addr[12:4] (9 bits)
    # To map to same L2 set, addresses must have same bits [12:4]
    # Use base 0x80002000, add 0x2000 (8KB) to change tag but keep same L2 set
    
    li   s0, 0x80002000       # Way 0
    li   s1, 0x80004000       # Way 1 (different tag, same L2 set)
    li   s2, 0x80006000       # Way 2
    li   s3, 0x80008000       # Way 3
    
    # Load all 4 ways (cold misses, fill L1 and L2)
    lw   a1, 0(s0)            # Load way 0
    lw   a2, 0(s1)            # Load way 1
    lw   a3, 0(s2)            # Load way 2
    lw   a4, 0(s3)            # Load way 3
    
    # Now all 4 ways of this L2 set should be filled
    # Access way 0 again (should be L1 hit if still in L1, or L2 hit)
    lw   a5, 0(s0)
    bne  a1, a5, test1_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 2: LRU Replacement
    # Fill 4 ways, then access 5th address to trigger LRU eviction
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Use addresses mapping to L2 set 1 (different from previous test)
    li   s0, 0x80002010       # Way 0, L2 set 1
    li   s1, 0x80004010       # Way 1, L2 set 1
    li   s2, 0x80006010       # Way 2, L2 set 1
    li   s3, 0x80008010       # Way 3, L2 set 1
    li   s4, 0x8000A010       # Way 4 (will evict LRU)
    
    # Fill all 4 ways
    lw   a1, 0(s0)
    lw   a2, 0(s1)
    lw   a3, 0(s2)
    lw   a4, 0(s3)
    
    # Access way 0, 1, 2 again to make way 3 LRU
    lw   t1, 0(s0)
    lw   t2, 0(s1)
    lw   t3, 0(s2)
    
    # Now access 5th address (should evict way 3, the LRU)
    lw   a5, 0(s4)
    
    # Access way 3 again (should be L2 miss now, refill from memory)
    lw   a6, 0(s3)
    bne  a4, a6, test2_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 3: L1→L2 Eviction Chain
    # Evict from L1, data should stay in L2
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '3'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # L1 has 64 sets, 1KB total, 16B lines
    # To evict from L1, use addresses with same L1 index but different tag
    # L1 index = addr[9:4] (6 bits)
    
    li   s0, 0x80002000       # L1 set 0
    lw   a1, 0(s0)            # Cold miss, fill L1 and L2
    
    # Access another address mapping to same L1 set (evict s0 from L1)
    li   s1, 0x80003000       # Different L1 tag, same L1 index
    lw   a2, 0(s1)            # Evict s0 from L1
    
    # Access s0 again (L1 miss, but L2 should hit)
    lw   a3, 0(s0)
    bne  a1, a3, test3_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 4: Multi-Set Sequential Access
    # Access sequential addresses crossing multiple sets
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '4'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    li   s0, 0x80002000       # Base
    li   s1, 16               # Counter (16 cache lines = 256 bytes)
    
test4_loop:
    lw   t1, 0(s0)
    addi s0, s0, 16           # Next cache line
    addi s1, s1, -1
    bnez s1, test4_loop
    
    # Read back from middle
    li   s0, 0x80002080       # Offset 128
    lw   t2, 0(s0)
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 5: Write-Read Consistency (L1 dirty→L2)
    # Write to L1, evict to memory, read back
    # Note: Phase 4 L1 dirty still goes to memory, not L2
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '5'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    li   s0, 0x80002100
    li   s1, 0xDEADBEEF
    
    # Write (write-allocate: fetch from memory, modify, mark dirty)
    sw   s1, 0(s0)
    
    # Read back immediately (L1 hit)
    lw   a1, 0(s0)
    bne  a1, s1, test5_fail
    
    # Evict by accessing conflicting address
    li   s2, 0x80003100       # Same L1 set, different tag
    lw   t1, 0(s2)            # Evict s0 (dirty writeback to memory)
    
    # Read s0 again (L1 miss, L2 miss, fetch from memory)
    lw   a2, 0(s0)
    bne  a2, s1, test5_fail
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 6: L2 Capacity Stress
    # Access many addresses to test L2 capacity
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '6'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # L2 is 32KB (512 sets × 4 ways × 16B)
    # Access 128 different cache lines (2KB worth of data, fits in L2)
    li   s0, 0x80002000
    li   s1, 128
    
test6_loop:
    lw   t1, 0(s0)
    addi s0, s0, 16
    addi s1, s1, -1
    bnez s1, test6_loop
    
    # Read back from start (should still be in L2)
    li   s0, 0x80002000
    lw   t2, 0(s0)
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 7: Tag Thrashing (Same L2 Set)
    # Access 5+ addresses mapping to same L2 set
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '7'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Use 6 addresses mapping to same L2 set (2 will thrash)
    li   s0, 0x80002020       # L2 set 2
    li   s1, 0x80004020
    li   s2, 0x80006020
    li   s3, 0x80008020
    li   s4, 0x8000A020
    li   s5, 0x8000C020
    
    lw   a1, 0(s0)
    lw   a2, 0(s1)
    lw   a3, 0(s2)
    lw   a4, 0(s3)
    lw   a5, 0(s4)
    lw   a6, 0(s5)
    
    # First two should have been evicted
    # Access them again
    lw   t1, 0(s0)
    lw   t2, 0(s1)
    
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
test3_fail:
    li   a0, '3'
    j    fail_print
test5_fail:
    li   a0, '5'
    j    fail_print

fail_print:
    sb   a0, 0(t0)
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
