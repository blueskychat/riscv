# Test program for satp CSR and sfence.vma instruction
# Uses magic address 0x90000000 for fast simulation output

.section .text
.globl _start

# Magic address for fast simulation output
.equ MAGIC_ADDR, 0x90000000

_start:
    # ========== Test 1: satp CSR Write/Read ==========
    # Write 0x80001234 to satp (MODE=1/Sv32, PPN=0x1234)
    li t0, 0x80001234
    csrw 0x180, t0          # satp CSR address = 0x180
    
    # Read back satp
    csrr t1, 0x180
    
    # Compare: if equal, output 'P', else 'F'
    li t2, MAGIC_ADDR
    beq t0, t1, satp_pass
    li t3, 'F'              # Fail
    sb t3, 0(t2)
    j satp_done
satp_pass:
    li t3, 'P'              # Pass
    sb t3, 0(t2)
satp_done:

    # ========== Test 2: sfence.vma instruction ==========
    # Just execute sfence.vma - if no exception, it passes
    
    # First clear satp to disable paging
    csrw 0x180, zero
    
    # Execute sfence.vma (opcode: 0x12000073)
    .word 0x12000073        # sfence.vma x0, x0
    
    # If we reach here, sfence.vma executed without exception
    li t2, MAGIC_ADDR
    li t3, 'V'              # sfence.Vma passed
    sb t3, 0(t2)
    
    # ========== Test 3: satp CSR-RW operations ==========
    # Test csrrs (set bits)
    li t0, 0x00000100
    csrw 0x180, t0
    li t1, 0x00000010
    csrs 0x180, t1          # satp = satp | 0x10
    csrr t2, 0x180
    li t3, 0x00000110
    li t4, MAGIC_ADDR
    beq t2, t3, csrs_pass
    li t5, 'f'
    sb t5, 0(t4)
    j csrs_done
csrs_pass:
    li t5, 'S'              # csrS passed
    sb t5, 0(t4)
csrs_done:

    # Test csrrc (clear bits)
    li t0, 0x00000110
    csrw 0x180, t0
    li t1, 0x00000100
    csrc 0x180, t1          # satp = satp & ~0x100
    csrr t2, 0x180
    li t3, 0x00000010
    li t4, MAGIC_ADDR
    beq t2, t3, csrc_pass
    li t5, 'f'
    sb t5, 0(t4)
    j csrc_done
csrc_pass:
    li t5, 'C'              # csrC passed
    sb t5, 0(t4)
csrc_done:

    # ========== Test complete ==========
    li t2, MAGIC_ADDR
    li t3, '\n'
    sb t3, 0(t2)
    li t3, 'O'
    sb t3, 0(t2)
    li t3, 'K'
    sb t3, 0(t2)
    li t3, '\n'
    sb t3, 0(t2)

    # Loop forever
done:
    j done
