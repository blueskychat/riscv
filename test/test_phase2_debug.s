# Phase 2 Debug Test: Minimal write-through verification
# Step by step debug to identify the issue

.section .text
.globl _start

_start:
    # Initialize magic print address
    li   t0, 0x90000000       # Magic print address

    # Print "DBG:" header
    li   a0, 'D'
    sb   a0, 0(t0)
    li   a0, 'B'
    sb   a0, 0(t0)
    li   a0, 'G'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)

    li   t1, 0x80002000       # Test address in cacheable range
    
    # Step 1: Write to memory (miss - should bypass)
    li   a0, '1'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   t2, 0x12345678
    sw   t2, 0(t1)            # Write miss
    li   a0, 'W'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Step 2: Read from memory (should miss, load into L1)
    li   a0, '2'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    lw   t3, 0(t1)            # Read - cold miss, fill L1
    li   a0, 'R'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Print the value read (as hex nibbles of upper byte)
    li   a0, 'V'
    sb   a0, 0(t0)
    li   a0, '='
    sb   a0, 0(t0)
    
    # Extract and print upper nibble of highest byte
    srli t4, t3, 28
    andi t4, t4, 0xF
    li   a0, '0'
    add  a0, a0, t4
    sb   a0, 0(t0)
    
    srli t4, t3, 24
    andi t4, t4, 0xF
    li   a0, '0'
    add  a0, a0, t4
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Verify read value equals 0x12345678
    li   t4, 0x12345678
    beq  t3, t4, step3
    
    # If mismatch, print BADREAD
    li   a0, 'B'
    sb   a0, 0(t0)
    li   a0, 'A'
    sb   a0, 0(t0)
    li   a0, 'D'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    j    done

step3:
    # Step 3: Read again (should hit L1)
    li   a0, '3'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    lw   t5, 0(t1)            # Read - should hit L1
    li   a0, 'H'
    sb   a0, 0(t0)            # H = Hit expected
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Step 4: Write again (should hit L1, write-through)
    li   a0, '4'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    li   t5, 0xDEADBEEF
    sw   t5, 0(t1)            # Write hit -> write-through
    li   a0, 'W'
    sb   a0, 0(t0)
    li   a0, 'T'              # WT = Write-Through
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Step 5: Read back (should hit L1 with new value)
    li   a0, '5'
    sb   a0, 0(t0)
    li   a0, ':'
    sb   a0, 0(t0)
    lw   t6, 0(t1)            # Read - should hit L1 with 0xDEADBEEF
    li   a0, 'R'
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Print read value upper byte
    li   a0, 'V'
    sb   a0, 0(t0)
    li   a0, '='
    sb   a0, 0(t0)
    srli t4, t6, 28
    andi t4, t4, 0xF
    # Convert to hex char (0-9 -> '0'-'9', 10-15 -> 'A'-'F')
    li   a1, 10
    blt  t4, a1, digit1
    addi t4, t4, 7            # Adjust for A-F
digit1:
    li   a0, '0'
    add  a0, a0, t4
    sb   a0, 0(t0)
    
    srli t4, t6, 24
    andi t4, t4, 0xF
    li   a1, 10
    blt  t4, a1, digit2
    addi t4, t4, 7
digit2:
    li   a0, '0'
    add  a0, a0, t4
    sb   a0, 0(t0)
    li   a0, '\n'
    sb   a0, 0(t0)
    
    # Verify
    li   a1, 0xDEADBEEF
    beq  t6, a1, pass
    
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
