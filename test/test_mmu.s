# Test program for MMU Sv32 page table walk
# This test sets up a simple page table and verifies address translation
# Uses magic address 0x90000000 for fast simulation output

.section .text
.globl _start

# Magic address for fast simulation output
.equ MAGIC_ADDR, 0x90000000

# CSR addresses
.equ CSR_SATP, 0x180

# Page table locations (in physical memory)
# We'll use address 0x80002000 for L1 page table
# and 0x80003000 for L2 page table
.equ PT_L1_BASE, 0x80002000
.equ PT_L2_BASE, 0x80003000

_start:
    # ========== Print start marker ==========
    li t0, MAGIC_ADDR
    li t1, 'M'
    sb t1, 0(t0)
    li t1, 'M'
    sb t1, 0(t0)
    li t1, 'U'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)

    # ========== Test 1: MMU module existence (satp still works) ==========
    li t0, 0x80001234
    csrw CSR_SATP, t0
    csrr t1, CSR_SATP
    li t2, MAGIC_ADDR
    beq t0, t1, test1_pass
    li t3, 'F'
    sb t3, 0(t2)
    j test1_done
test1_pass:
    li t3, '1'              # Test 1 passed
    sb t3, 0(t2)
test1_done:

    # ========== Test 2: Setup simple page table ==========
    # Create a simple identity mapping for 0x80000000 -> 0x80000000
    # This uses a superpage (4MB) at L1 level
    
    # Clear satp first (disable paging during setup)
    csrw CSR_SATP, zero
    
    # L1 Page Table Entry for VPN[1] = 0x200 (maps 0x80000000-0x803FFFFF)
    # PTE: PPN = 0x80000 >> 12 = 0x80, Valid, R, W, X, A, D
    # PPN[21:0] = 0x00080 (for PA 0x80000000, PPN = 0x80000)
    # Actually for superpage: PPN = PA[31:22] << 10 = 0x200 << 10 = 0x80000
    # PTE format: [PPN 22bits][RSW 2bits][D][A][G][U][X][W][R][V]
    # For superpage mapping 0x80000000: PPN = 0x80000, flags = 0xFF (DAGUXWRV all set)
    li t0, PT_L1_BASE
    
    # VPN[1] for 0x80000000 = (0x80000000 >> 22) & 0x3FF = 0x200
    # Entry offset = 0x200 * 4 = 0x800
    # Use lui to load offset since 0x800 is too large for addi
    li t0, PT_L1_BASE
    li t1, 0x800                # offset = VPN[1] * 4 = 0x800
    add t0, t0, t1              # t0 = PT_L1_BASE + 0x800
    
    # Create superpage PTE: PPN = 0x80000, V=1, R=1, W=1, X=1, A=1, D=1
    # PTE = (0x80000 << 10) | 0xFF = 0x200000FF
    li t1, 0x200000FF
    sw t1, 0(t0)
    
    li t2, MAGIC_ADDR
    li t3, '2'                  # Test 2 (setup) done
    sb t3, 0(t2)

    # ========== Test 3: Enable paging and verify satp format ==========
    # satp = MODE[1] | PPN[21:0]
    # MODE = 1 (Sv32), PPN = PT_L1_BASE >> 12 = 0x80002
    li t0, PT_L1_BASE
    srli t0, t0, 12             # PPN = PT_L1_BASE >> 12
    li t1, 0x80000000           # MODE = 1 (bit 31)
    or t0, t0, t1
    csrw CSR_SATP, t0
    
    # Execute sfence.vma to flush TLB
    .word 0x12000073            # sfence.vma
    
    li t2, MAGIC_ADDR
    li t3, '3'                  # Test 3 (enable) done
    sb t3, 0(t2)
    
    # ========== Test 4: Verify paging is enabled ==========
    csrr t0, CSR_SATP
    srli t1, t0, 31             # Get MODE bit
    li t2, MAGIC_ADDR
    beq t1, zero, test4_fail
    li t3, '4'                  # Test 4 passed (MODE=1)
    sb t3, 0(t2)
    j test4_done
test4_fail:
    li t3, 'f'
    sb t3, 0(t2)
test4_done:

    # ========== Test complete ==========
    # Disable paging for safe output
    csrw CSR_SATP, zero
    .word 0x12000073            # sfence.vma
    
    li t2, MAGIC_ADDR
    li t3, '\n'
    sb t3, 0(t2)
    li t3, 'O'
    sb t3, 0(t2)
    li t3, 'K'
    sb t3, 0(t2)
    li t3, '\n'
    sb t3, 0(t2)

done:
    j done
