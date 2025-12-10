#include "debug.h"

#define TEST_BASE 0x80002000
#define L1_CACHE_SIZE 2048
#define L2_CACHE_SIZE 32768

int test_count = 0;
int pass_count = 0;

void run_test(const char* name, int pass) {
    test_count++;
    debug_puts("[TEST ");
    debug_print_hex(test_count);
    debug_puts("] ");
    debug_puts(name);
    debug_puts(": ");
    if (pass) {
        debug_puts("PASS\n");
        pass_count++;
    } else {
        debug_puts("FAIL\n");
    }
}

int main() {
    debug_init();
    debug_puts("\n=== Comprehensive Cache Test Suite ===\n\n");
    
    // Test 1: Basic Read/Write
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    ptr[0] = 0xDEADBEEF;
    run_test("Basic Read/Write", ptr[0] == 0xDEADBEEF);
    
    // Test 2: Write-Allocate
    ptr = (volatile unsigned int*)(TEST_BASE + 0x1000);
    ptr[0] = 0x11111111;
    ptr[1] = 0x22222222;
    run_test("Write-Allocate", ptr[0] == 0x11111111 && ptr[1] == 0x22222222);
    
    // Test 3: L1 Cache Eviction
    volatile unsigned int* base = (volatile unsigned int*)TEST_BASE;
    base[0] = 0xAAAAAAAA;
    volatile unsigned int* evict = (volatile unsigned int*)(TEST_BASE + L1_CACHE_SIZE);
    evict[0] = 0xBBBBBBBB;
    run_test("L1 Cache Eviction", base[0] == 0xAAAAAAAA);
    
    // Test 4: Dirty Line Writeback
    base = (volatile unsigned int*)(TEST_BASE + 0x2000);
    base[0] = 0xCAFEBABE;
    base[1] = 0xDEADC0DE;
    evict = (volatile unsigned int*)(TEST_BASE + 0x2000 + L1_CACHE_SIZE);
    evict[0] = 0x12345678;
    run_test("Dirty Line Writeback", base[0] == 0xCAFEBABE && base[1] == 0xDEADC0DE);
    
    // Test 5: Cross Cache Line Access
    ptr = (volatile unsigned int*)(TEST_BASE + 0x3000);
    ptr[0] = 0x00000000;
    ptr[3] = 0x33333333;
    ptr[4] = 0x44444444;
    run_test("Cross Cache Line", ptr[0] == 0 && ptr[3] == 0x33333333 && ptr[4] == 0x44444444);
    
    // Test 6: Multiple Sets Access
    base = (volatile unsigned int*)(TEST_BASE + 0x4000);
    base[0] = 0xA0;
    base[4] = 0xA1;
    base[8] = 0xA2;
    base[12] = 0xA3;
    run_test("Multiple Sets", base[0] == 0xA0 && base[4] == 0xA1 && base[8] == 0xA2 && base[12] == 0xA3);
    
    // Test 7: Sequential Write/Read
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
    run_test("Sequential Write/Read", seq_pass);
    
    // Test 8: Read-Modify-Write
    ptr = (volatile unsigned int*)(TEST_BASE + 0x6000);
    ptr[0] = 0x12345678;
    unsigned int val = ptr[0];
    ptr[0] = val + 1;
    run_test("Read-Modify-Write", ptr[0] == 0x12345679);
    
    // Test 9: L2 Cache Access (L1 miss, L2 hit)
    base = (volatile unsigned int*)(TEST_BASE + 0x7000);
    base[0] = 0x77777777;
    // Force L1 eviction by accessing same set
    evict = (volatile unsigned int*)(TEST_BASE + 0x7000 + L1_CACHE_SIZE);
    evict[0] = 0x88888888;
    // Read again - should hit in L2
    run_test("L2 Cache Hit", base[0] == 0x77777777);
    
    // Test 10: Write Pattern Test
    ptr = (volatile unsigned int*)(TEST_BASE + 0x8000);
    ptr[0] = 0xFFFFFFFF;
    ptr[1] = 0x00000000;
    ptr[2] = 0xAAAAAAAA;
    ptr[3] = 0x55555555;
    run_test("Write Pattern", ptr[0] == 0xFFFFFFFF && ptr[1] == 0 && 
             ptr[2] == 0xAAAAAAAA && ptr[3] == 0x55555555);
    
    // Test 11: Cache Line Boundary
    ptr = (volatile unsigned int*)(TEST_BASE + 0x900C);  // Near 16-byte boundary
    ptr[0] = 0x11111111;
    ptr[1] = 0x22222222;  // Crosses to next line
    run_test("Cache Line Boundary", ptr[0] == 0x11111111 && ptr[1] == 0x22222222);
    
    // Test 12: Repeated Eviction
    base = (volatile unsigned int*)(TEST_BASE + 0xA000);
    base[0] = 0x99999999;
    for (int i = 0; i < 3; i++) {
        evict = (volatile unsigned int*)(TEST_BASE + 0xA000 + L1_CACHE_SIZE * (i + 1));
        evict[0] = 0x88888888 + i;
    }
    run_test("Repeated Eviction", base[0] == 0x99999999);
    
    // Test 13: Zero Value Write
    ptr = (volatile unsigned int*)(TEST_BASE + 0xB000);
    ptr[0] = 0x12345678;
    ptr[0] = 0x00000000;
    run_test("Zero Value Write", ptr[0] == 0);
    
    // Test 14: Alternating Read/Write
    ptr = (volatile unsigned int*)(TEST_BASE + 0xC000);
    ptr[0] = 0x10;
    val = ptr[0];
    ptr[1] = val + 1;
    val = ptr[1];
    ptr[2] = val + 1;
    run_test("Alternating R/W", ptr[0] == 0x10 && ptr[1] == 0x11 && ptr[2] == 0x12);
    
    // Test 15: Large Offset Access
    ptr = (volatile unsigned int*)(TEST_BASE + 0x10000);
    ptr[0] = 0xABCDEF01;
    ptr[1024] = 0xABCDEF02;
    run_test("Large Offset", ptr[0] == 0xABCDEF01 && ptr[1024] == 0xABCDEF02);
    
    // Summary
    debug_puts("\n=== Test Summary ===\n");
    debug_puts("Total: ");
    debug_print_hex(test_count);
    debug_puts("\nPassed: ");
    debug_print_hex(pass_count);
    debug_puts("\nFailed: ");
    debug_print_hex(test_count - pass_count);
    debug_puts("\n\n");
    
    if (pass_count == test_count) {
        debug_puts("ALL TESTS PASSED!\n");
    } else {
        debug_puts("SOME TESTS FAILED!\n");
    }
    
    while(1);
    return 0;
}
