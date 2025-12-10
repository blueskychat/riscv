# Debug test - test reading from UART status register

.section .text
.global _start

_start:
    # First output 'R' via Magic Address to confirm start
    lui t0, 0x90000         # t0 = 0x90000000
    li t1, 'R'
    sb t1, 0(t0)
    
    # Now try to read UART status register
    lui t0, 0x10000         # t0 = 0x10000000
    lb t2, 5(t0)            # Read status register  <-- This might hang
    
    # If we get here, output 'D' (for Done)
    lui t0, 0x90000
    li t1, 'D'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)

    # Loop forever
loop:
    j loop
