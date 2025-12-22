# Test program for MMU address translation
# Tests actual Sv32 page table walk and address translation
# Uses magic address 0x90000000 for simulation output

.section .text
.globl _start

# Constants
.equ MAGIC_ADDR,      0x90000000
.equ SATP_SV32,       0x80000000
.equ PAGE_TABLE_ADDR, 0x80010000  # Physical address for page table (4KB aligned)
.equ L2_PT_ADDR,      0x80011000  # Second level page table
.equ TEST_VA,         0x00001000  # Virtual address to test (in first megapage)
.equ TEST_PA,         0x80400000  # Physical address we'll map it to (ExtRAM)
.equ TEST_DATA,       0xDEADBEEF  # Test data pattern

# PTE Bits
.equ PTE_V, 0x01   # Valid
.equ PTE_R, 0x02   # Read
.equ PTE_W, 0x04   # Write
.equ PTE_X, 0x08   # Execute
.equ PTE_U, 0x10   # User
.equ PTE_G, 0x20   # Global
.equ PTE_A, 0x40   # Accessed
.equ PTE_D, 0x80   # Dirty

_start:
    # ========== Test Header ==========
    li t0, MAGIC_ADDR
    li t1, 'M'
    sb t1, 0(t0)
    li t1, 'M'
    sb t1, 0(t0)
    li t1, 'U'
    sb t1, 0(t0)
    li t1, ' '
    sb t1, 0(t0)
    li t1, 'T'
    sb t1, 0(t0)
    li t1, 'e'
    sb t1, 0(t0)
    li t1, 's'
    sb t1, 0(t0)
    li t1, 't'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Test 1: Direct Memory Access (No Paging) ==========
    # Write test data to ExtRAM directly (physical address)
    li t0, MAGIC_ADDR
    li t1, '1'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    
    li t2, TEST_PA
    li t3, TEST_DATA
    sw t3, 0(t2)      # Write 0xDEADBEEF to 0x80400000
    
    # Read it back
    lw t4, 0(t2)
    
    # Verify
    beq t3, t4, test1_pass
    li t1, 'F'
    sb t1, 0(t0)
    j test1_done
test1_pass:
    li t1, 'P'
    sb t1, 0(t0)
test1_done:
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Test 2: Setup Page Table ==========
    li t0, MAGIC_ADDR
    li t1, '2'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    
    # Clear page table area first
    li t2, PAGE_TABLE_ADDR
    li t3, 0
    li t4, 1024       # 1024 entries
clear_l1:
    beq t4, x0, clear_l1_done
    sw x0, 0(t2)
    addi t2, t2, 4
    addi t4, t4, -1
    j clear_l1
clear_l1_done:

    # Clear L2 page table
    li t2, L2_PT_ADDR
    li t4, 1024
clear_l2:
    beq t4, x0, clear_l2_done
    sw x0, 0(t2)
    addi t2, t2, 4
    addi t4, t4, -1
    j clear_l2
clear_l2_done:

    # --- Setup L1 Entry for VPN[1]=0 (addresses 0x00000000-0x003FFFFF) ---
    # L1[0] = pointer to L2_PT_ADDR
    # PTE format: PPN[21:0] | RSW[1:0] | D | A | G | U | X | W | R | V
    # For pointer PTE: R=0, W=0, X=0, V=1
    li t2, PAGE_TABLE_ADDR
    li t3, L2_PT_ADDR
    srli t3, t3, 2    # PPN = PA >> 2, then shift to PTE[31:10]
    ori t3, t3, PTE_V # Valid bit only (pointer PTE)
    sw t3, 0(t2)      # L1[0]
    
    # --- Setup L2 Entry for VPN[0]=1 (VA 0x00001000) ---
    # Map VA 0x00001000 -> PA 0x80400000
    # L2[1] = leaf PTE pointing to 0x80400000
    li t2, L2_PT_ADDR
    addi t2, t2, 4    # L2[1] = L2_PT_ADDR + 1*4
    
    li t3, TEST_PA
    srli t3, t3, 2    # PPN = PA >> 2, shift to [31:10]
    # Set permissions: D|A|G|U|X|W|R|V = 0xFF for full access
    ori t3, t3, (PTE_D | PTE_A | PTE_G | PTE_U | PTE_X | PTE_W | PTE_R | PTE_V)
    sw t3, 0(t2)      # L2[1]
    
    # --- Also need identity map for 0x80000000 (kernel code) ---
    # L1[512] = pointer to another L2 or megapage
    # For simplicity, use megapage (4MB) identity map
    li t2, PAGE_TABLE_ADDR
    li t5, 2048             # 512*4 = 2048
    add t2, t2, t5          # L1[512] for VA 0x80000000-0x803FFFFF
    li t3, 0x80000000
    srli t3, t3, 2
    ori t3, t3, (PTE_D | PTE_A | PTE_G | PTE_X | PTE_W | PTE_R | PTE_V)
    sw t3, 0(t2)
    
    # L1[513] for VA 0x80400000-0x807FFFFF (where TEST_PA is)
    li t2, PAGE_TABLE_ADDR
    li t5, 2052             # 513*4 = 2052
    add t2, t2, t5
    li t3, 0x80400000
    srli t3, t3, 2
    ori t3, t3, (PTE_D | PTE_A | PTE_G | PTE_X | PTE_W | PTE_R | PTE_V)
    sw t3, 0(t2)
    
    # --- Also need identity map for 0x90000000 (magic output) ---
    # L1[576] for VA 0x90000000
    li t2, PAGE_TABLE_ADDR
    li t5, 2304             # 576*4 = 2304
    add t2, t2, t5          # L1[576] = 0x90000000 >> 22 = 576
    li t3, 0x90000000
    srli t3, t3, 2
    ori t3, t3, (PTE_D | PTE_A | PTE_G | PTE_X | PTE_W | PTE_R | PTE_V)
    sw t3, 0(t2)
    
    li t1, 'P'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Test 3: Enable Paging ==========
    li t0, MAGIC_ADDR
    li t1, '3'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    
    # Set satp: MODE=1 (Sv32), PPN=PAGE_TABLE_ADDR >> 12
    li t2, PAGE_TABLE_ADDR
    srli t2, t2, 12        # PPN
    li t3, SATP_SV32
    or t2, t2, t3          # MODE=1, ASID=0, PPN
    csrw satp, t2
    
    # Execute sfence.vma to flush TLB
    sfence.vma
    
    # NOTE: We're still in M-mode, so paging should NOT affect us
    # (paging_enabled = satp[31] && priv != M)
    
    li t1, 'P'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Test 4: Verify M-Mode Bypass ==========
    # In M-mode, paging is disabled, so we should still access PA directly
    li t0, MAGIC_ADDR
    li t1, '4'
    sb t1, 0(t0)
    li t1, ':'
    sb t1, 0(t0)
    
    li t2, TEST_PA
    lw t3, 0(t2)          # Read from PA (should work in M-mode)
    li t4, TEST_DATA
    beq t3, t4, test4_pass
    li t1, 'F'
    sb t1, 0(t0)
    j test4_done
test4_pass:
    li t1, 'P'
    sb t1, 0(t0)
test4_done:
    li t1, '\n'
    sb t1, 0(t0)
    
    # ========== Test Complete ==========
    li t0, MAGIC_ADDR
    li t1, 'O'
    sb t1, 0(t0)
    li t1, 'K'
    sb t1, 0(t0)
    li t1, '\n'
    sb t1, 0(t0)
    
done:
    j done
