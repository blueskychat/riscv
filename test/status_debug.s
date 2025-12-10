# Debug test - output the actual UART status register value

.section .text
.global _start

_start:
    # Output 'S' to confirm start
    lui t0, 0x90000         # t0 = 0x90000000
    li t1, 'S'
    sb t1, 0(t0)
    
    # Read UART status register
    lui t3, 0x10000         # t3 = 0x10000000
    lb t2, 5(t3)            # Read status register (offset 5)
    
    # Output status value as hex digit (only lower nibble)
    lui t0, 0x90000
    andi t4, t2, 0x0F       # Get lower nibble
    li t5, 10
    blt t4, t5, is_digit
    addi t4, t4, 'A' - 10   # If >= 10, use A-F
    j output_char
is_digit:
    addi t4, t4, '0'        # If < 10, use 0-9
output_char:
    sb t4, 0(t0)
    
    # Output upper nibble
    srli t4, t2, 4          # Get upper nibble
    andi t4, t4, 0x0F
    li t5, 10
    blt t4, t5, is_digit2
    addi t4, t4, 'A' - 10
    j output_char2
is_digit2:
    addi t4, t4, '0'
output_char2:
    sb t4, 0(t0)
    
    # Newline
    li t1, '\n'
    sb t1, 0(t0)

    # Loop forever
loop:
    j loop
