# Test program for mstatus.SUM bit (Supervisor User Memory access)
# Tests that S-mode can access U-mode pages when SUM=1, and cannot when SUM=0
# Uses magic address 0x90000000 for simulation output

.section .text
.globl _start

# Constants
.equ MAGIC_ADDR,      0x90000000
.equ SATP_SV32,       0x80000000
.equ PAGE_TABLE_ADDR, 0x80010000  # Physical address for page table (4KB aligned)
.equ USER_PAGE_VA,    0x00001000  # Virtual address with U bit set
.equ USER_PAGE_PA,    0x80020000  # Physical address for user page

# CSR addresses
.equ CSR_MSTATUS, 0x300
.equ CSR_MTVEC,   0x305
.equ CSR_MEPC,    0x341
.equ CSR_MCAUSE,  0x342
.equ CSR_MTVAL,   0x343
.equ CSR_STVEC,   0x105
.equ CSR_SEPC,    0x141
.equ CSR_SCAUSE,  0x142
.equ CSR_SATP,    0x180
.equ CSR_MEDELEG, 0x302

# mstatus bits
.equ MSTATUS_SUM_BIT, 18
.equ MSTATUS_MPP_S,   0x800   # MPP = S-mode (01)

# PTE Bits
.equ PTE_V, 0x01   # Valid
.equ PTE_R, 0x02   # Read
.equ PTE_W, 0x04   # Write
.equ PTE_X, 0x08   # Execute
.equ PTE_U, 0x10   # User
.equ PTE_G, 0x20   # Global
.equ PTE_A, 0x40   # Accessed
.equ PTE_D, 0x80   # Dirty

# Exception codes
.equ EX_LOAD_PAGE_FAULT, 13

_start:
    # ========== Setup M-mode trap handler ==========
    la t0, m_trap_handler
    csrw mtvec, t0
    
    # ========== Setup S-mode trap handler ==========
    la t0, s_trap_handler
    csrw stvec, t0
    
    # ========== Print header ==========
    li t0, MAGIC_ADDR
    li t1, 'S'
    sb t1, 0(t0)
    li t1, 'U'
    sb t1, 0(t0)
    li t1, 'M'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Setup Page Table ==========
    # Clear L1 page table
    li t2, PAGE_TABLE_ADDR
    li t4, 1024
clear_l1:
    beq t4, x0, clear_l1_done
    sw x0, 0(t2)
    addi t2, t2, 4
    addi t4, t4, -1
    j clear_l1
clear_l1_done:

    # L1[512] = megapage for 0x80000000 (identity map for kernel code, NO U bit)
    li t2, PAGE_TABLE_ADDR
    li t5, 2048              # 512 * 4 bytes
    add t2, t2, t5
    li t3, 0x80000000
    srli t3, t3, 2           # PPN = PA >> 2 for megapage PTE
    ori t3, t3, (PTE_D | PTE_A | PTE_G | PTE_X | PTE_W | PTE_R | PTE_V)  # NO PTE_U
    sw t3, 0(t2)
    
    # L1[576] = megapage for 0x90000000 (magic output, NO U bit)
    li t2, PAGE_TABLE_ADDR
    li t5, 2304              # 576 * 4 bytes
    add t2, t2, t5
    li t3, 0x90000000
    srli t3, t3, 2
    ori t3, t3, (PTE_D | PTE_A | PTE_G | PTE_X | PTE_W | PTE_R | PTE_V)  # NO PTE_U
    sw t3, 0(t2)
    
    # L1[0] = megapage for 0x00000000 WITH U bit (user page - maps to 0x80020000)
    # For simplicity, use megapage identity mapping with U bit
    li t2, PAGE_TABLE_ADDR   # L1[0] at offset 0
    li t3, 0x80000000        # Map to 0x80000000 (use existing kernel area)
    srli t3, t3, 2
    ori t3, t3, (PTE_D | PTE_A | PTE_G | PTE_X | PTE_W | PTE_R | PTE_V | PTE_U)  # WITH PTE_U
    sw t3, 0(t2)
    
    # ========== Delegate page faults to S-mode ==========
    li t0, (1 << EX_LOAD_PAGE_FAULT)  # Delegate load page fault
    csrw medeleg, t0
    
    # ========== Enable paging ==========
    li t2, PAGE_TABLE_ADDR
    srli t2, t2, 12          # PPN
    li t3, SATP_SV32
    or t2, t2, t3
    csrw satp, t2
    sfence.vma
    
    li t0, MAGIC_ADDR
    li t1, 'P'               # Page table setup done
    sb t1, 0(t0)
    li t1, 'T'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Test 1: S-mode access U-page with SUM=0 (should fault) ==========
    li t0, MAGIC_ADDR
    li t1, '1'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    
    # Clear SUM bit in mstatus
    li t0, (1 << MSTATUS_SUM_BIT)
    csrc mstatus, t0
    
    # Initialize fault flag
    la t6, fault_occurred
    sw x0, 0(t6)
    
    # Set MPP to S-mode for mret
    li t0, 0x3800             # Clear MPP bits 12:11
    csrc mstatus, t0
    li t0, MSTATUS_MPP_S      # Set MPP = 01 (S-mode)
    csrs mstatus, t0
    
    # Set mepc to s_mode_test1
    la t0, s_mode_test1
    csrw mepc, t0
    
    # Enter S-mode
    mret
    
s_mode_test1:
    # Now in S-mode with SUM=0
    # Try to load from user page (VA in range 0x00000000 - 0x00400000 which has U bit)
    li t0, 0x00001000         # VA with U bit
    lw t1, 0(t0)              # This should cause page fault (S-mode, SUM=0, U page)
    
    # If we reach here, fault did NOT occur (BAD)
    j test1_check
    
test1_fault_return:
    # Fault occurred - check flag
test1_check:
    # Back in M-mode after ecall
    la t6, fault_occurred
    lw t5, 0(t6)
    
    li t0, MAGIC_ADDR
    beq t5, x0, test1_fail
    li t1, 'P'               # Pass - fault occurred as expected
    sb t1, 0(t0)
    j test1_done
test1_fail:
    li t1, 'F'               # Fail - no fault
    sb t1, 0(t0)
test1_done:
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Test 2: S-mode access U-page with SUM=1 (should succeed) ==========
    li t0, MAGIC_ADDR
    li t1, '2'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    
    # Set SUM bit in mstatus
    li t0, (1 << MSTATUS_SUM_BIT)
    csrs mstatus, t0
    
    # Clear fault flag
    la t6, fault_occurred
    sw x0, 0(t6)
    
    # Set MPP to S-mode for mret
    li t0, 0x3800
    csrc mstatus, t0
    li t0, MSTATUS_MPP_S
    csrs mstatus, t0
    
    # Set mepc to s_mode_test2
    la t0, s_mode_test2
    csrw mepc, t0
    
    # Enter S-mode
    mret
    
s_mode_test2:
    # Now in S-mode with SUM=1
    # Try to load from user page
    li t0, 0x00001000
    lw t1, 0(t0)              # This should succeed (SUM=1 allows access)
    
    # If we reach here, access succeeded
    # ECALL to return to M-mode
    ecall
    j test2_check
    
test2_check:
    la t6, fault_occurred
    lw t5, 0(t6)
    
    li t0, MAGIC_ADDR
    bne t5, x0, test2_fail
    li t1, 'P'               # Pass - no fault, access succeeded
    sb t1, 0(t0)
    j test2_done
test2_fail:
    li t1, 'F'               # Fail - fault occurred
    sb t1, 0(t0)
test2_done:
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== All tests complete ==========
    li t0, MAGIC_ADDR
    li t1, 'O'
    sb t1, 0(t0)
    li t1, 'K'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)
    
done:
    j done

# ========== M-mode Trap Handler ==========
m_trap_handler:
    csrr t0, mcause
    
    # Check if ECALL from S-mode (cause = 9)
    li t1, 9
    beq t0, t1, ecall_handler
    
    # Check page fault
    li t1, EX_LOAD_PAGE_FAULT
    beq t0, t1, m_page_fault_handler
    
    # Unknown - print X and skip
    li t0, MAGIC_ADDR
    li t1, 'X'
    sb t1, 0(t0)
    csrr t0, mepc
    addi t0, t0, 4
    csrw mepc, t0
    mret
    
m_page_fault_handler:
    # Set fault flag
    la t2, fault_occurred
    li t3, 1
    sw t3, 0(t2)
    
    # Print 'F' for fault
    li t0, MAGIC_ADDR
    li t1, 'f'
    sb t1, 0(t0)
    
    # Skip faulting instruction
    csrr t0, mepc
    addi t0, t0, 4
    csrw mepc, t0
    mret
    
ecall_handler:
    # ECALL from S-mode - return to check code
    csrr t0, mepc
    addi t0, t0, 4
    csrw mepc, t0
    mret

# ========== S-mode Trap Handler ==========
s_trap_handler:
    csrr t0, scause
    
    # Page fault - set flag and return
    la t2, fault_occurred
    li t3, 1
    sw t3, 0(t2)
    
    # Print 's' for S-mode fault
    li t0, MAGIC_ADDR
    li t1, 's'
    sb t1, 0(t0)
    
    # Skip faulting instruction
    csrr t0, sepc
    addi t0, t0, 4
    csrw sepc, t0
    sret

.section .data
    .align 4
fault_occurred:
    .word 0
