# Test: Exception Delegation to S-mode
# This test verifies Phase 3 of the uCore implementation:
# - Set medeleg to delegate Illegal Instruction (bit 2)
# - Drop to S-mode
# - Execute illegal instruction
# - Verify trap goes to stvec (not mtvec)
#
# Output uses Magic Address 0x90000000

.section .text
.globl _start

# CSR addresses
.equ CSR_MSTATUS,  0x300
.equ CSR_MEDELEG,  0x302
.equ CSR_MTVEC,    0x305
.equ CSR_MEPC,     0x341
.equ CSR_SSTATUS,  0x100
.equ CSR_STVEC,    0x105
.equ CSR_SEPC,     0x141
.equ CSR_SCAUSE,   0x142

# mstatus bits
.equ MSTATUS_MPP_S, (1 << 11)   # MPP = S-mode (01)

# Exception codes
.equ EX_ILLEGAL_INST, 2

# Magic Address for simulation output
.equ MAGIC_OUTPUT, 0x90000000

_start:
    lui     a0, 0x90000        # Magic output address
    
    # ========== Step 1: Set up M-mode trap handler (should NOT be called) ==========
    la      t0, m_trap_handler
    csrw    CSR_MTVEC, t0
    
    # ========== Step 2: Set up S-mode trap handler ==========
    la      t0, s_trap_handler
    csrw    CSR_STVEC, t0
    
    # ========== Step 3: Delegate Illegal Instruction to S-mode ==========
    li      t0, (1 << EX_ILLEGAL_INST)   # Delegate exception code 2
    csrw    CSR_MEDELEG, t0
    
    li      a1, '1'
    sb      a1, 0(a0)          # Print "1" - medeleg set
    
    # ========== Step 4: Set MEPC to test code in S-mode ==========
    la      t0, s_mode_code
    csrw    CSR_MEPC, t0
    
    # ========== Step 5: Set MPP to S-mode (01) and return via MRET ==========
    li      t0, MSTATUS_MPP_S
    csrw    CSR_MSTATUS, t0
    
    li      a1, '2'
    sb      a1, 0(a0)          # Print "2" - about to mret
    
    mret                       # Jump to s_mode_code in S-mode

# Code that runs in S-mode
s_mode_code:
    lui     a0, 0x90000
    li      a1, '3'
    sb      a1, 0(a0)          # Print "3" - now in S-mode
    
    # Execute an illegal instruction (unimp = all zeros)
    .word   0x00000000         # Illegal instruction
    
    # Should NOT reach here
    li      a1, 'X'
    sb      a1, 0(a0)
    j       fail

# S-mode trap handler (should be called for delegated exceptions)
s_trap_handler:
    lui     a0, 0x90000
    li      a1, 'S'
    sb      a1, 0(a0)          # Print "S" - S-mode handler called!
    
    # Verify scause == 2 (Illegal Instruction)
    csrr    t0, CSR_SCAUSE
    li      t1, EX_ILLEGAL_INST
    bne     t0, t1, fail
    
    li      a1, 'P'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
    # Success!
    li      a1, 'O'
    sb      a1, 0(a0)
    li      a1, 'K'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
done:
    j       done

# M-mode trap handler (should NOT be called for delegated exceptions)
m_trap_handler:
    lui     a0, 0x90000
    li      a1, 'M'
    sb      a1, 0(a0)          # Print "M" - M-mode handler called (BAD!)
    li      a1, 'F'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    j       fail

fail:
    lui     a0, 0x90000
    li      a1, 'F'
    sb      a1, 0(a0)
    li      a1, 'A'
    sb      a1, 0(a0)
    li      a1, 'I'
    sb      a1, 0(a0)
    li      a1, 'L'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
fail_loop:
    j       fail_loop
