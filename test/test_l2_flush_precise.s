# L2-Only Flush Test Program
# 
# Goal: Reproduce the L2 BRAM read timing bug in fence.i flush
#
# Strategy:
# 1. Write data to N addresses that will fill L1 AND spill some to L2
# 2. Clear L1 by accessing different addresses (causes L1 evictions → L2)
# 3. Now L2 has dirty lines that L1 doesn't have
# 4. Execute fence.i
# 5. Read back from the L2-only dirty addresses
# 6. If L2 BRAM read timing is broken, data will be corrupted
#
# L1: 1KB = 64 sets × 16B/line (direct-mapped)
# L2: 32KB = 256 sets × 4 ways × 16B/line
#
# Key insight: Write to addr A, then write to addr B where A and B map to 
# same L1 set but different L2 sets. A's data goes L1→L2, then B in L1.
# fence.i must flush L2 dirty lines correctly.

.section .text
.globl _start

.equ MAGIC_PRINT, 0x90000000
.equ DATA_BASE_A, 0x80100000     # First data region
.equ DATA_BASE_B, 0x80200000     # Second region (different L2 set, same L1 set)
.equ L1_LINE_SIZE, 16
.equ L1_SETS, 64
.equ TEST_LINES, 32              # Test 32 cache lines

_start:
    li      s0, MAGIC_PRINT
    
    # === Output 'T' - Test Start ===
    li      t0, 'T'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 1: Write data to region A (will be in L1)
    # Pattern: store address as data
    # ================================================================
    li      s1, DATA_BASE_A
    li      t2, 0
    li      t3, TEST_LINES
    mv      t1, s1

phase1_loop:
    sw      t1, 0(t1)           # data[addr] = addr
    addi    t1, t1, L1_LINE_SIZE
    addi    t2, t2, 1
    blt     t2, t3, phase1_loop
    
    # === Output '1' - Phase 1 complete ===
    li      t0, '1'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 2: Write data to region B (will evict A's data from L1 → L2)
    # Region B maps to SAME L1 sets but DIFFERENT L2 sets
    # After this: A's data is in L2 only, B's data is in L1
    # ================================================================
    li      s2, DATA_BASE_B
    li      t2, 0
    mv      t1, s2

phase2_loop:
    sw      t1, 0(t1)           # data[addr] = addr
    addi    t1, t1, L1_LINE_SIZE
    addi    t2, t2, 1
    blt     t2, t3, phase2_loop
    
    # === Output '2' - Phase 2 complete ===
    li      t0, '2'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 3: Execute fence.i
    # This should:
    # 1. Flush L1 dirty lines (B's data) - works correctly
    # 2. Flush L2 dirty lines (A's data) - BUG: reads stale BRAM data!
    # ================================================================
    fence.i
    
    # === Output 'F' - Fence complete ===
    li      t0, 'F'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 4: Verify region A data (was in L2 only)
    # If L2 flush is broken, this data will be corrupted/zero
    # ================================================================
    li      t2, 0
    mv      t1, s1              # DATA_BASE_A
    li      s3, 0               # Error count

verify_a_loop:
    lw      t4, 0(t1)           # Read data
    beq     t4, t1, verify_a_ok # Expected: data == addr
    addi    s3, s3, 1           # Error count++
verify_a_ok:
    addi    t1, t1, L1_LINE_SIZE
    addi    t2, t2, 1
    blt     t2, t3, verify_a_loop
    
    # === Output 'A' - Region A verified ===
    li      t0, 'A'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 5: Verify region B data (was in L1, should be fine)
    # ================================================================
    li      t2, 0
    mv      t1, s2              # DATA_BASE_B
    li      s4, 0               # Error count for B

verify_b_loop:
    lw      t4, 0(t1)
    beq     t4, t1, verify_b_ok
    addi    s4, s4, 1
verify_b_ok:
    addi    t1, t1, L1_LINE_SIZE
    addi    t2, t2, 1
    blt     t2, t3, verify_b_loop
    
    # === Output 'B' - Region B verified ===
    li      t0, 'B'
    sw      t0, 0(s0)
    
    # ================================================================
    # Phase 6: Report results
    # ================================================================
    # Check region A errors (L2-only path, should expose bug)
    bnez    s3, test_fail_a
    # Check region B errors (should always pass)
    bnez    s4, test_fail_b
    
test_pass:
    li      t0, 'P'
    sw      t0, 0(s0)
    li      t0, 'A'
    sw      t0, 0(s0)
    li      t0, 'S'
    sw      t0, 0(s0)
    li      t0, 'S'
    sw      t0, 0(s0)
    li      t0, '\n'
    sw      t0, 0(s0)
    j       done

test_fail_a:
    # L2 flush failed (region A corrupted)
    li      t0, 'F'
    sw      t0, 0(s0)
    li      t0, 'A'
    sw      t0, 0(s0)
    li      t0, 'I'
    sw      t0, 0(s0)
    li      t0, 'L'
    sw      t0, 0(s0)
    li      t0, '-'
    sw      t0, 0(s0)
    li      t0, 'L'
    sw      t0, 0(s0)
    li      t0, '2'
    sw      t0, 0(s0)
    li      t0, ':'
    sw      t0, 0(s0)
    # Output error count in hex
    mv      t0, s3
    call    print_hex
    li      t0, '\n'
    sw      t0, 0(s0)
    j       done

test_fail_b:
    # L1 flush failed (region B corrupted) - unexpected
    li      t0, 'F'
    sw      t0, 0(s0)
    li      t0, 'A'
    sw      t0, 0(s0)
    li      t0, 'I'
    sw      t0, 0(s0)
    li      t0, 'L'
    sw      t0, 0(s0)
    li      t0, '-'
    sw      t0, 0(s0)
    li      t0, 'L'
    sw      t0, 0(s0)
    li      t0, '1'
    sw      t0, 0(s0)
    li      t0, ':'
    sw      t0, 0(s0)
    mv      t0, s4
    call    print_hex
    li      t0, '\n'
    sw      t0, 0(s0)
    j       done

# Print hex value in t0 (2 digits)
print_hex:
    mv      t5, t0
    srli    t1, t5, 4
    andi    t1, t1, 0xF
    li      t2, 10
    blt     t1, t2, 1f
    addi    t1, t1, ('A' - 10)
    j       2f
1:  addi    t1, t1, '0'
2:  sw      t1, 0(s0)
    andi    t1, t5, 0xF
    blt     t1, t2, 3f
    addi    t1, t1, ('A' - 10)
    j       4f
3:  addi    t1, t1, '0'
4:  sw      t1, 0(s0)
    ret

done:
    j       done
