# Complete cache test - CryptoNight algorithm in pure assembly
# 100 iterations, validates against expected s0=0x7D4CC322

# Xorshift macro (inline to avoid call overhead)
.macro xorshift reg tmp
    slli \tmp, \reg, 13
    xor \reg, \reg, \tmp
    srli \tmp, \reg, 17
    xor \reg, \reg, \tmp
    slli \tmp, \reg, 5
    xor \reg, \reg, \tmp
.endm

# Print hex digit macro
.macro print_hex_digit val print_addr tmp
    andi \tmp, \val, 0xF
    li \print_addr, 10
    blt \tmp, \print_addr, 1f
    addi \tmp, \tmp, 55       # 'A'-10
    j 2f
1:  addi \tmp, \tmp, 48       # '0'
2:  li \print_addr, 0x90000000
    sb \tmp, 0(\print_addr)
.endm

_start:
    # Print START
    li t5, 0x90000000
    li t6, 'S'
    sb t6, 0(t5)
    li t6, 'T'
    sb t6, 0(t5)
    li t6, 'A'
    sb t6, 0(t5)
    li t6, 'R'
    sb t6, 0(t5)
    li t6, 'T'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
    # Initialize
    li a0, 0x80400000    # base address
    li a3, 100           # iterations
    li a4, 0x1FFFFC      # mask
    li s0, 1             # s0 = seed
    li a2, 0             # counter
    li t0, 0             # t0
    li t1, 0             # t1
    
    # Main loop
main_loop:
    # Print progress every 16 iterations
    andi t4, a2, 0xF
    bnez t4, skip_dot
    li t5, 0x90000000
    li t6, '.'
    sb t6, 0(t5)
skip_dot:
    
    # Calculate read address: addr = base + (s0 & mask)
    and t0, s0, a4
    add t0, a0, t0
    
    # Read from memory
    lw t0, 0(t0)
    
    # XOR operations
    xor t0, t0, t1
    xor s0, s0, t0
    
    # Update s0 with xorshift
    xorshift s0, s1
    
    # Calculate write address
    and t1, s0, a4
    add t1, a0, t1
    
    # Write to memory
    sw t0, 0(t1)
    
    # Save t0 for next iteration
    mv t1, t0
    
    # Update s0 again
    xorshift s0, s1
    
    # Increment counter
    addi a2, a2, 1
    bne a2, a3, main_loop
    
    # Print newline
    li t5, 0x90000000
    li t6, 10
    sb t6, 0(t5)
    
    # Print "s0=0x"
    li t6, 's'
    sb t6, 0(t5)
    li t6, '0'
    sb t6, 0(t5)
    li t6, '='
    sb t6, 0(t5)
    li t6, '0'
    sb t6, 0(t5)
    li t6, 'x'
    sb t6, 0(t5)
    
    # Print s0 as 8 hex digits
    li a6, 28           # bit position
    li a7, 8            # digit count
print_loop:
    srl a5, s0, a6
    print_hex_digit a5, t5, t6
    addi a6, a6, -4
    addi a7, a7, -1
    bnez a7, print_loop
    
    # Print newline
    li t5, 0x90000000
    li t6, 10
    sb t6, 0(t5)
    
    # Verify result: expected = 0x7D4CC322
    lui t2, 0x7D4CC
    addi t2, t2, 0x322   # Note: sign extension, need to handle
    # Actually construct it properly
    li t2, 0x7D4CC322
    
    beq s0, t2, pass_test
    
fail_test:
    # Print FAIL
    li t5, 0x90000000
    li t6, 'F'
    sb t6, 0(t5)
    li t6, 'A'
    sb t6, 0(t5)
    li t6, 'I'
    sb t6, 0(t5)
    li t6, 'L'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    j done
    
pass_test:
    # Print PASS
    li t5, 0x90000000
    li t6, 'P'
    sb t6, 0(t5)
    li t6, 'A'
    sb t6, 0(t5)
    li t6, 'S'
    sb t6, 0(t5)
    li t6, 'S'
    sb t6, 0(t5)
    li t6, 10
    sb t6, 0(t5)
    
done:
    j done
