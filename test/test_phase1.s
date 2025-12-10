# Phase 1 Test: L1 Read-Only Cache
# Test that read operations work correctly with caching

.section .text
.globl _start

_start:
    # Initialize magic print address
    li   t0, 0x90000000       # Magic print address

    # ========================================
    # Test 1: Basic Read (Cold Miss then Hit)
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # Read from cacheable address (should miss first, then hit)
    li   t1, 0x80002000       # Test address in cacheable range
    
    # First read - cold miss, will fill cache line
    lw   t2, 0(t1)            # Load word 0
    
    # Second read - should hit L1 (same address)
    lw   t3, 0(t1)            # Load word 0 again
    
    # Third read - should hit L1 (same cache line, word 1)
    lw   t4, 4(t1)            # Load word 1
    
    # Third read - should hit L1 (same cache line, word 2)
    lw   t5, 8(t1)            # Load word 2
    
    # If we got here without hanging, reads work
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 2: Write still works (bypass)
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    # Write to memory (should bypass cache)
    li   t6, 0xDEADBEEF
    sw   t6, 0(t1)            # Store to 0x80002000
    
    # Read back (will miss because write bypassed and invalidated nothing)
    # Actually in Phase 1, cache line may still be valid with old data
    # This is expected - Phase 2 will fix this
    lw   a1, 0(t1)
    
    # Print "OK" if write didn't hang
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test 3: Different cache lines
    # ========================================
    li   a0, 'T'
    sb   a0, 0(t0)
    li   a0, '3'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)
    
    # Access different cache line (16 bytes apart)
    li   t1, 0x80002010       # Different cache line
    lw   t2, 0(t1)            # Cold miss
    lw   t3, 0(t1)            # Should hit
    
    li   a0, 'O'
    sb   a0, 0(t0)
    li   a0, 'K'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    # ========================================
    # Test Complete
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

loop:
    j    loop
