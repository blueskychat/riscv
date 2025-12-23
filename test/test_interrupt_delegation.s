# Test: Interrupt Delegation to S-mode (Timer)
# This test verifies Phase 4 of the uCore implementation:
# - Set mideleg to delegate S-mode timer interrupt (bit 5)
# - Drop to S-mode, enable STIE
# - M-mode sets STIP to inject timer interrupt
# - Verify trap goes to stvec (not mtvec)
#
# Output uses Magic Address 0x90000000

.section .text
.globl _start

# CSR addresses
.equ CSR_MSTATUS,  0x300
.equ CSR_MIDELEG,  0x303
.equ CSR_MTVEC,    0x305
.equ CSR_MIE,      0x304
.equ CSR_MIP,      0x344
.equ CSR_MEPC,     0x341
.equ CSR_SSTATUS,  0x100
.equ CSR_SIE,      0x104
.equ CSR_STVEC,    0x105
.equ CSR_SEPC,     0x141
.equ CSR_SCAUSE,   0x142

# mstatus/sstatus bits
.equ MSTATUS_MPP_S, (1 << 11)   # MPP = S-mode (01)
.equ SSTATUS_SIE,   (1 << 1)    # S-mode interrupt enable

# mie/sie bits
.equ STIE_BIT, 5
.equ STIP_BIT, 5

# Interrupt codes (bit 31 set)
.equ INT_S_TIMER, 0x80000005

# Magic
.equ MAGIC_OUTPUT, 0x90000000

_start:
    lui     a0, 0x90000

    # ========== Step 1: Set up M-mode trap handler (should NOT be called) ==========
    la      t0, m_trap_handler
    csrw    CSR_MTVEC, t0

    # ========== Step 2: Set up S-mode trap handler ==========
    la      t0, s_trap_handler
    csrw    CSR_STVEC, t0

    # ========== Step 3: Delegate S-mode timer interrupt (bit 5) ==========
    li      t0, (1 << STIE_BIT)
    csrw    CSR_MIDELEG, t0

    # ========== Step 4: Enable STIE in mie ==========
    csrs    CSR_MIE, t0

    li      a1, '1'
    sb      a1, 0(a0)          # Print "1"

    # ========== Step 5: Set MEPC and drop to S-mode ==========
    la      t0, s_mode_code
    csrw    CSR_MEPC, t0
    li      t0, MSTATUS_MPP_S
    csrw    CSR_MSTATUS, t0

    li      a1, '2'
    sb      a1, 0(a0)          # Print "2"

    mret

# S-mode code: enable SIE and wait for interrupt
s_mode_code:
    lui     a0, 0x90000
    li      a1, '3'
    sb      a1, 0(a0)          # Print "3" - in S-mode

    # Enable S-mode interrupt (sstatus.SIE = 1)
    li      t0, SSTATUS_SIE
    csrs    CSR_SSTATUS, t0

    li      a1, '4'
    sb      a1, 0(a0)          # Print "4" - SIE enabled

    # Set STIP (inject S-mode timer interrupt from S-mode context)
    # Note: In real uCore, M-mode handler sets this
    # For testing, we use ecall to return to M-mode to set STIP
    ecall

    # Should NOT reach here - interrupt should fire first
    li      a1, 'X'
    sb      a1, 0(a0)
    j       fail

# S-mode trap handler (for ecall, returns to M-mode to set STIP)
s_ecall_return:
    lui     a0, 0x90000
    li      a1, '5'
    sb      a1, 0(a0)          # Print "5" - setting STIP

    # Set STIP to trigger S-mode timer interrupt
    li      t0, (1 << STIP_BIT)
    csrs    CSR_MIP, t0

    # Set MEPC to return location in S-mode where interrupt will fire
    la      t0, s_wait_int
    csrw    CSR_MEPC, t0
    li      t0, MSTATUS_MPP_S
    csrw    CSR_MSTATUS, t0

    li      a1, '6'
    sb      a1, 0(a0)          # Print "6"

    mret                        # Return to S-mode, STIP should trigger immediately

s_wait_int:
    lui     a0, 0x90000
    li      a1, 'W'
    sb      a1, 0(a0)          # Print "W" - waiting
    j       s_wait_int         # Should be interrupted here

# S-mode timer interrupt handler
s_trap_handler:
    lui     a0, 0x90000
    li      a1, 'S'
    sb      a1, 0(a0)          # Print "S" - S-mode handler

    # Verify scause == INT_S_TIMER (0x80000005)
    csrr    t0, CSR_SCAUSE
    li      t1, INT_S_TIMER
    bne     t0, t1, fail

    li      a1, 'P'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)

    # Clear STIP
    li      t0, (1 << STIP_BIT)
    csrc    CSR_MIP, t0

    # Success!
    li      a1, 'O'
    sb      a1, 0(a0)
    li      a1, 'K'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)

done:
    j       done

# M-mode trap handler - handles ecall from S-mode
m_trap_handler:
    lui     a0, 0x90000

    # Check if this is ecall from S-mode (cause=9), jump to set STIP
    csrr    t0, 0x342          # mcause
    li      t1, 9              # ECALL from S-mode
    beq     t0, t1, s_ecall_return

    # Otherwise it's an unexpected M-mode trap (BAD!)
    li      a1, 'M'
    sb      a1, 0(a0)
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
