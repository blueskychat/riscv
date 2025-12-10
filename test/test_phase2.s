# Phase 2 Test: L1 Write-Through Cache
# Test that write-hit updates L1 cache AND writes through to memory

.section .text
.globl _start

_start:
    # Initialize magic print address
    li   t0, 0x90000000       # Magic print address

    # ========================================
    # Print "P2: " header
    # ========================================
    li   a0, 'P'
    sb   a0, 0(t0)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # ========================================
    # Test 1: Write Miss -> Read -> Write Hit -> Read
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    li   t1, 0x80002000       # Test address in cacheable range
    
    # Step 1: Write to memory (miss - bypass to memory, no cache update)
    li   t2, 0x12345678
    sw   t2, 0(t1)            # Write miss -> only writes to memory
    
    # Step 2: Read from memory (cache miss, will load into L1)
    lw   t3, 0(t1)            # Should read 0x12345678 from memory
    
    # Verify read value
    li   t4, 0x12345678
    bne  t3, t4, test1_fail
    
    # Step 3: Write again (now it's a hit - write-through: update L1 + memory)
    li   t5, 0xDEADBEEF
    sw   t5, 0(t1)            # Write hit -> update L1 AND write to memory
    
    # Step 4: Read back (should hit L1 with new value)
    lw   t6, 0(t1)            # Should hit L1, read 0xDEADBEEF
    
    # Verify the write-through worked
    li   a1, 0xDEADBEEF
    bne  t6, a1, test1_fail
    
    # Test 1 passed
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

test2:
    # ========================================
    # Test 2: Verify memory also updated (evict and re-read)
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Access different address that maps to same cache line index
    # Cache line index = bits [9:4], so we need addresses 0x400 apart
    # 0x80002000 -> index = 0
    # 0x80002400 -> index = 0 (conflicts, evicts old line)
    li   t1, 0x80002400       # Different tag, same index
    lw   a2, 0(t1)            # This evicts the 0x80002000 line
    
    # Now read back original address (should miss, re-read from memory)
    li   t1, 0x80002000
    lw   t6, 0(t1)            # Cache miss - read from memory
    
    # Memory should have 0xDEADBEEF (written through in test 1)
    li   a1, 0xDEADBEEF
    bne  t6, a1, test2_fail
    
    # Test 2 passed
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    pass

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

pass:
    # ========================================
    # All Tests Passed
    # ========================================
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
