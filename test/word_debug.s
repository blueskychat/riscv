# Debug - read UART as full word and print all bytes

.section .text
.global _start

_start:
    lui t0, 0x90000         # Magic address
    
    # Read UART as WORD (4 bytes at offset 4)
    lui t3, 0x10000         # UART base
    lw t2, 4(t3)            # Read word from 0x10000004 (includes status at byte 5)
    
    # Print each byte (MSB first)
    # Byte 3 (bits 31:24)
    li t1, 'W'
    sb t1, 0(t0)
    li t1, '3'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    srli t4, t2, 24
    andi t4, t4, 0xFF
    jal ra, print_hex
    
    # Byte 2 (bits 23:16)
    li t1, ' '
    sb t1, 0(t0)
    li t1, '2'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    srli t4, t2, 16
    andi t4, t4, 0xFF
    jal ra, print_hex
    
    # Byte 1 (bits 15:8) - this should be status at offset 5
    li t1, ' '
    sb t1, 0(t0)
    li t1, '1'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    srli t4, t2, 8
    andi t4, t4, 0xFF
    jal ra, print_hex
    
    # Byte 0 (bits 7:0) - this is at offset 4
    li t1, ' '
    sb t1, 0(t0)
    li t1, '0'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    andi t4, t2, 0xFF
    jal ra, print_hex
    
    li t1, '\n'
    sb t1, 0(t0)
    
loop:
    j loop

# Print t4 as 2-digit hex, clobbers t5, t6
print_hex:
    lui t5, 0x90000
    # High nibble
    srli t6, t4, 4
    andi t6, t6, 0x0F
    li t1, 10
    blt t6, t1, ph_digit1
    addi t6, t6, 'A' - 10
    j ph_out1
ph_digit1:
    addi t6, t6, '0'
ph_out1:
    sb t6, 0(t5)
    # Low nibble
    andi t6, t4, 0x0F
    li t1, 10
    blt t6, t1, ph_digit2
    addi t6, t6, 'A' - 10
    j ph_out2
ph_digit2:
    addi t6, t6, '0'
ph_out2:
    sb t6, 0(t5)
    ret
