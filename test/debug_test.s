# Debug test - output each step via Magic Address to trace execution

.section .text
.global _start

_start:
    # Confirm start
    lui t0, 0x90000         # t0 = 0x90000000
    li t1, 'S'
    sb t1, 0(t0)
    li t1, 'T'
    sb t1, 0(t0)
    li t1, 'A'
    sb t1, 0(t0)
    li t1, 'R'
    sb t1, 0(t0)
    li t1, 'T'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)

    # Now try UART
    lui t2, 0x10000         # t2 = 0x10000000
    li t1, 'U'
    sb t1, 0(t2)            # Write to UART
    
    # Confirm after UART
    lui t0, 0x90000         # t0 = 0x90000000
    li t1, 'A'
    sb t1, 0(t0)
    li t1, 'F'
    sb t1, 0(t0)
    li t1, 'T'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)

    # Loop forever
loop:
    j loop
