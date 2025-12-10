#include "debug.h"

#define TEST_BASE 0x80002000
#define L1_SIZE 2048
#define L2_SIZE 32768

int main() {
    debug_init();
    debug_puts("\n=== Comprehensive Cache Test ===\n\n");
    
    // Test 1: Basic Read/Write
    debug_puts("T1: Basic RW... ");
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    ptr[0] = 0xDEADBEEF;
    if (ptr[0] == 0xDEADBEEF) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 2: Write-Allocate
    debug_puts("T2: Write-Allocate... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x1000);
    ptr[0] = 0x11111111;
    ptr[1] = 0x22222222;
    if (ptr[0] == 0x11111111 && ptr[1] == 0x22222222) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 3: L1 Cache Eviction
    debug_puts("T3: L1 Eviction... ");
    volatile unsigned int* base = (volatile unsigned int*)TEST_BASE;
    base[0] = 0xAAAAAAAA;
    volatile unsigned int* evict = (volatile unsigned int*)(TEST_BASE + L1_SIZE);
    evict[0] = 0xBBBBBBBB;
    if (base[0] == 0xAAAAAAAA) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 4: Dirty Line Writeback
    debug_puts("T4: Writeback... ");
    base = (volatile unsigned int*)(TEST_BASE + 0x2000);
    base[0] = 0xCAFEBABE;
    base[1] = 0xDEADC0DE;
    evict = (volatile unsigned int*)(TEST_BASE + 0x2000 + L1_SIZE);
    evict[0] = 0x12345678;
    if (base[0] == 0xCAFEBABE && base[1] == 0xDEADC0DE) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 5: Cross Cache Line Access
    debug_puts("T5: Cross Line... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x3000);
    ptr[0] = 0x00000000;
    ptr[3] = 0x33333333;
    ptr[4] = 0x44444444;
    if (ptr[0] == 0 && ptr[3] == 0x33333333 && ptr[4] == 0x44444444) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 6: Multiple Sets Access
    debug_puts("T6: Multi Sets... ");
    base = (volatile unsigned int*)(TEST_BASE + 0x4000);
    base[0] = 0xA0;
    base[4] = 0xA1;
    base[8] = 0xA2;
    base[12] = 0xA3;
    if (base[0] == 0xA0 && base[4] == 0xA1 && base[8] == 0xA2 && base[12] == 0xA3) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 7: Sequential Write/Read
    debug_puts("T7: Sequential... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x5000);
    int seq_pass = 1;
    for (int i = 0; i < 16; i++) {
        ptr[i] = 0x50000000 + i;
    }
    for (int i = 0; i < 16; i++) {
        if (ptr[i] != (unsigned int)(0x50000000 + i)) {
            seq_pass = 0;
            break;
        }
    }
    if (seq_pass) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 8: Read-Modify-Write
    debug_puts("T8: RMW... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x6000);
    ptr[0] = 0x12345678;
    unsigned int val = ptr[0];
    ptr[0] = val + 1;
    if (ptr[0] == 0x12345679) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 9: L2 Cache Access (L1 miss, L2 hit)
    debug_puts("T9: L2 Hit... ");
    base = (volatile unsigned int*)(TEST_BASE + 0x7000);
    base[0] = 0x77777777;
    // Force L1 eviction by accessing same set
    evict = (volatile unsigned int*)(TEST_BASE + 0x7000 + L1_SIZE);
    evict[0] = 0x88888888;
    // Read again - should hit in L2
    if (base[0] == 0x77777777) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 10: Write Pattern Test
    debug_puts("T10: Patterns... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x8000);
    ptr[0] = 0xFFFFFFFF;
    ptr[1] = 0x00000000;
    ptr[2] = 0xAAAAAAAA;
    ptr[3] = 0x55555555;
    if (ptr[0] == 0xFFFFFFFF && ptr[1] == 0 && ptr[2] == 0xAAAAAAAA && ptr[3] == 0x55555555) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 11: Cache Line Boundary
    debug_puts("T11: Boundary... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x900C);  // Near 16-byte boundary
    ptr[0] = 0x11111111;
    ptr[1] = 0x22222222;  // Crosses to next line
    if (ptr[0] == 0x11111111 && ptr[1] == 0x22222222) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 12: Repeated Eviction
    debug_puts("T12: Multi-Evict... ");
    base = (volatile unsigned int*)(TEST_BASE + 0xA000);
    base[0] = 0x99999999;
    for (int i = 0; i < 3; i++) {
        evict = (volatile unsigned int*)(TEST_BASE + 0xA000 + L1_SIZE * (i + 1));
        evict[0] = 0x88888880 + i;
    }
    if (base[0] == 0x99999999) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 13: Zero Value Write
    debug_puts("T13: Zero Write... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0xB000);
    ptr[0] = 0x12345678;
    ptr[0] = 0x00000000;
    if (ptr[0] == 0) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 14: Alternating Read/Write
    debug_puts("T14: Alt R/W... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0xC000);
    ptr[0] = 0x10;
    val = ptr[0];
    ptr[1] = val + 1;
    val = ptr[1];
    ptr[2] = val + 1;
    if (ptr[0] == 0x10 && ptr[1] == 0x11 && ptr[2] == 0x12) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    // Test 15: Large Offset Access
    debug_puts("T15: Large Offset... ");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x10000);
    ptr[0] = 0xABCDEF01;
    ptr[1024] = 0xABCDEF02;
    if (ptr[0] == 0xABCDEF01 && ptr[1024] == 0xABCDEF02) debug_puts("PASS\n"); else debug_puts("FAIL\n");
    
    debug_puts("\n=== All Tests Complete ===\n");
    while(1);
    return 0;
}
