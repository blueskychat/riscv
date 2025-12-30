# ===========================================================================
# test_uart_io.s - Minimal UART Echo Test (no status check)
# ===========================================================================
# Test: Just print characters to verify UART TX works, then try to read

.equ COM1,           0x10000000
.equ COM_RBR_OFFSET, 0
.equ COM_THR_OFFSET, 0
.equ COM_LSR_OFFSET, 5
.equ COM_LSR_THRE,   0x20
.equ COM_LSR_DR,     0x01
.equ MAGIC_ADDR,     0x90000000

    .section .text
    .global _start
    .p2align 2

_start:
    li sp, 0x80800000

    # Print welcome message to magic address (fast)
    la a0, welcome_msg
    jal magic_puts
    
    # Print to UART (slow but visible)
    la a0, welcome_msg
    jal uart_puts

main_loop:
    # Check if UART has data
    li t0, COM1
    lb t1, COM_LSR_OFFSET(t0)    # Read status register
    andi t2, t1, COM_LSR_DR      # Check DR bit
    beqz t2, main_loop           # No data, keep polling
    
    # Data ready! Read it
    lb s0, COM_RBR_OFFSET(t0)    # Read data register
    
    # Print debug to magic address
    la a0, rx_msg
    jal magic_puts
    
    # Print the received char
    li t0, MAGIC_ADDR
    sb s0, 0(t0)
    
    # Echo via UART too
    mv a0, s0
    jal uart_putc
    
    # Print newline
    li a0, 10
    li t0, MAGIC_ADDR
    sb a0, 0(t0)
    mv a0, s0
    
    j main_loop

# ===========================================================================
# UART Functions
# ===========================================================================

uart_putc:
    li t0, COM1
1:  lb t1, COM_LSR_OFFSET(t0)
    andi t1, t1, COM_LSR_THRE
    beqz t1, 1b
    sb a0, COM_THR_OFFSET(t0)
    ret

uart_puts:
    mv t2, ra
    mv t3, a0
1:  lb a0, 0(t3)
    beqz a0, 2f
    jal uart_putc
    addi t3, t3, 1
    j 1b
2:  mv ra, t2
    ret

magic_putc:
    li t0, MAGIC_ADDR
    sb a0, 0(t0)
    ret

magic_puts:
    mv t2, ra
    mv t3, a0
1:  lb a0, 0(t3)
    beqz a0, 2f
    jal magic_putc
    addi t3, t3, 1
    j 1b
2:  mv ra, t2
    ret

    .section .rodata
    .p2align 2

welcome_msg:
    .asciz "UART Test Ready!\n"

rx_msg:
    .asciz "RX:"
