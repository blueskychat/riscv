# Simplified CryptoNight-style Memory Stress Test
# Based on kernel test.S UTEST_CRYPTONIGHT
# Uses xorshift LFSR for pseudo-random access pattern
# Reduced parameters for debugging: 16KB memory, 32 iterations
# IMPORTANT: Does NOT reset s0 between init and main loop (matches original)

.section .text
.globl _start

_start:
    # Initialize magic print address
    li   t0, 0x90000000       # Magic print address

    # Print header "CN: "
    li   a0, 'C'
    sb   a0, 0(t0)
    li   a0, 'N'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, ' '
    sb   a0, 0(t0)

    # ========================================
    # CryptoNight-style test (matches original)
    # ========================================
    # Parameters:
    #   a0 = base addr (0x80100000)
    #   a1 = end addr
    #   a2 = iteration counter / current addr
    #   a3 = number of iterations
    #   a4 = address mask
    #   s0 = random number (xorshift LFSR state)
    #
    # CRITICAL: s0 is NOT reset between init and main loop!
    
    li   a0, 0x80100000       # base addr
    li   a1, 0x4000           # 16KB size
    li   a3, 32               # 32 iterations
    li   a4, 0x3FFC           # 16KB - 4 mask (word aligned)
    add  a1, a1, a0           # end addr = base + size
    li   s0, 1                # rand seed = 1

    # ========================================
    # PHASE 1: Initialize memory with LFSR values
    # ========================================
    li   a5, 'I'
    sb   a5, 0(t0)            # Print 'I' for init phase

    mv   a2, a0               # a2 = current addr

init_loop:
    sw   s0, 0(a2)            # write random value

    # xorshift LFSR: s0 = s0 ^ (s0 << 13) ^ (s0 >> 17) ^ (s0 << 5)
    slli s1, s0, 13
    xor  s0, s0, s1
    srli s1, s0, 17
    xor  s0, s0, s1
    slli s1, s0, 5
    xor  s0, s0, s1

    addi a2, a2, 4            # next word
    bne  a2, a1, init_loop

    li   a5, 'i'
    sb   a5, 0(t0)            # Print 'i' for init done

    # ========================================
    # PHASE 2: Main cryptonight loop
    # CRITICAL: s0 continues from init phase (not reset!)
    # ========================================
    li   a5, 'M'
    sb   a5, 0(t0)            # Print 'M' for main loop

    # Store initial s0 for verification later
    mv   s2, s0               # s2 = s0 before main loop

    li   a2, 0                # iteration counter
    li   t1, 0                # prev value (t1 in original)

main_loop:
    # Calculate random read address: addr = base + (s0 & mask)
    # Use t2 for addr (original uses t0, but we need t0 for print)
    and  t2, s0, a4
    add  t2, a0, t2
    
    # Read from random address
    lw   t3, 0(t2)
    
    # XOR with previous iteration's value
    xor  t3, t3, t1
    
    # XOR rand with current value (creates dependency chain)
    xor  s0, s0, t3

    # xorshift LFSR update
    slli s1, s0, 13
    xor  s0, s0, s1
    srli s1, s0, 17
    xor  s0, s0, s1
    slli s1, s0, 5
    xor  s0, s0, s1

    # Calculate random write address
    and  t4, s0, a4
    add  t4, a0, t4
    
    # Write current value to random address
    sw   t3, 0(t4)
    
    # Save for next iteration
    mv   t1, t3

    # xorshift LFSR update again
    slli s1, s0, 13
    xor  s0, s0, s1
    srli s1, s0, 17
    xor  s0, s0, s1
    slli s1, s0, 5
    xor  s0, s0, s1

    # Increment and check loop
    addi a2, a2, 1
    bne  a2, a3, main_loop

    li   a5, 'm'
    sb   a5, 0(t0)            # Print 'm' for main done

    # ========================================
    # PHASE 3: Verification
    # ========================================
    li   a5, 'V'
    sb   a5, 0(t0)            # Print 'V' for verify

    # Print final s0 (LFSR state) as hex
    mv   a6, s0
    jal  ra, print_hex

    li   a5, ' '
    sb   a5, 0(t0)

    # Print final t1 (last written value) as hex
    mv   a6, t1
    jal  ra, print_hex

    # ========================================
    # Expected values verification
    # ========================================
    # For 16KB memory, 32 iterations, s0 continues from init:
    # s0 after init = 0x9d2ab30a
    # After 32 iterations:
    # Expected s0 = 0x9c362df5
    # Expected t1 = 0xeb61f940
    
    li   s3, 0x9c362df5
    bne  s0, s3, fail

    li   s3, 0xeb61f940
    bne  t1, s3, fail

pass:
    li   a5, '\n'
    sb   a5, 0(t0)
    li   a5, 'P'
    sb   a5, 0(t0)
    li   a5, 'A'
    sb   a5, 0(t0)
    li   a5, 'S'
    sb   a5, 0(t0)
    li   a5, 'S'
    sb   a5, 0(t0)
    li   a5, '\n'
    sb   a5, 0(t0)
    j    done

fail:
    li   a5, '\n'
    sb   a5, 0(t0)
    li   a5, 'F'
    sb   a5, 0(t0)
    li   a5, 'A'
    sb   a5, 0(t0)
    li   a5, 'I'
    sb   a5, 0(t0)
    li   a5, 'L'
    sb   a5, 0(t0)
    li   a5, '\n'
    sb   a5, 0(t0)
    j    done

done:
    j    done

# ========================================
# print_hex: Print a6 as 8-char hex
# Clobbers: a5, a7, s3
# ========================================
print_hex:
    li   a7, 28               # bit position (28, 24, 20, ... 0)
ph_loop:
    srl  s3, a6, a7           # shift right by a7
    andi s3, s3, 0xF          # mask to get nibble
    li   a5, 10
    blt  s3, a5, ph_digit     # if < 10, it's 0-9
    addi s3, s3, 'A' - 10     # A-F
    j    ph_print
ph_digit:
    addi s3, s3, '0'          # 0-9
ph_print:
    sb   s3, 0(t0)
    addi a7, a7, -4           # next nibble
    bgez a7, ph_loop
    jr   ra
