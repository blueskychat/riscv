# Test: CSR Delegation Registers and S-mode Interrupt Bits
# This test verifies Phase 1-2 of the uCore implementation:
# - mhartid reads as 0
# - mideleg/medeleg can be read/written
# - STIP/STIE bits work correctly
# - sie/sip are proper views of mie/mip
#
# Output uses Magic Address 0x90000000 for fast simulation output

.section .text
.globl _start

# CSR addresses
.equ CSR_MHARTID, 0xF14
.equ CSR_MIDELEG, 0x303
.equ CSR_MEDELEG, 0x302
.equ CSR_MIE,     0x304
.equ CSR_MIP,     0x344
.equ CSR_SIE,     0x104
.equ CSR_SIP,     0x144

# Bit positions
.equ STIE_BIT,    5
.equ STIP_BIT,    5
.equ SSIP_BIT,    1

# Magic Address for simulation output
.equ MAGIC_OUTPUT, 0x90000000

_start:
    # Load magic output address
    lui     a0, 0x90000

    # ========== Test 1: mhartid should be 0 ==========
    li      a1, '1'
    sb      a1, 0(a0)           # Print test number
    
    csrr    t0, CSR_MHARTID
    li      t1, 0
    bne     t0, t1, fail
    
    li      a1, 'P'             # Print 'P' for pass
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
    # ========== Test 2: medeleg read/write ==========
    li      a1, '2'
    sb      a1, 0(a0)
    
    li      t0, 0x0000FFFF      # Write pattern
    csrw    CSR_MEDELEG, t0
    csrr    t1, CSR_MEDELEG
    bne     t0, t1, fail
    
    # Clear and verify
    csrw    CSR_MEDELEG, zero
    csrr    t1, CSR_MEDELEG
    bne     t1, zero, fail
    
    li      a1, 'P'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
    # ========== Test 3: mideleg read/write ==========
    li      a1, '3'
    sb      a1, 0(a0)
    
    li      t0, 0x00000222      # Write pattern (S-mode interrupt bits)
    csrw    CSR_MIDELEG, t0
    csrr    t1, CSR_MIDELEG
    bne     t0, t1, fail
    
    # Clear and verify
    csrw    CSR_MIDELEG, zero
    csrr    t1, CSR_MIDELEG
    bne     t1, zero, fail
    
    li      a1, 'P'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
    # ========== Test 4: STIE bit in mie ==========
    li      a1, '4'
    sb      a1, 0(a0)
    
    li      t0, (1 << STIE_BIT)  # Set STIE
    csrs    CSR_MIE, t0
    csrr    t1, CSR_MIE
    and     t1, t1, t0
    bne     t1, t0, fail
    
    # Verify sie shows STIE
    csrr    t1, CSR_SIE
    and     t1, t1, t0
    bne     t1, t0, fail
    
    li      a1, 'P'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
    # ========== Test 5: STIP bit in mip ==========
    li      a1, '5'
    sb      a1, 0(a0)
    
    li      t0, (1 << STIP_BIT)  # Set STIP
    csrs    CSR_MIP, t0
    csrr    t1, CSR_MIP
    and     t1, t1, t0
    bne     t1, t0, fail
    
    # Verify sip shows STIP
    csrr    t1, CSR_SIP
    and     t1, t1, t0
    bne     t1, t0, fail
    
    # Clear STIP
    csrc    CSR_MIP, t0
    csrr    t1, CSR_MIP
    and     t1, t1, t0
    bne     t1, zero, fail
    
    li      a1, 'P'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
    # ========== Test 6: sie writes to mie ==========
    li      a1, '6'
    sb      a1, 0(a0)
    
    # Clear mie first
    csrw    CSR_MIE, zero
    
    # Write to sie
    li      t0, (1 << STIE_BIT)
    csrs    CSR_SIE, t0
    
    # Verify mie is updated
    csrr    t1, CSR_MIE
    and     t1, t1, t0
    bne     t1, t0, fail
    
    li      a1, 'P'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
    # ========== All tests passed ==========
    li      a1, 'O'
    sb      a1, 0(a0)
    li      a1, 'K'
    sb      a1, 0(a0)
    li      a1, '\n'
    sb      a1, 0(a0)
    
loop:
    j       loop

fail:
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
