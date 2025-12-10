#include "debug.h"

#define TEST_BASE 0x80002000
#define L1_CACHE_SIZE 2048

int main() {
    debug_init();
    debug_puts("\n=== Advanced Cache Tests ===\n\n");
    
    // Test 1: Basic RW
    debug_puts("[TEST] Basic Read/Write\n");
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    ptr[0] = 0xDEADBEEF;
    if (ptr[0] == 0xDEADBEEF) {
        debug_puts("  PASS\n");
    } else {
        debug_puts("  FAIL\n");
    }
    
    // Test 2: Write-Allocate
    debug_puts("[TEST] Write-Allocate\n");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x1000);
    ptr[0] = 0x11111111;
    ptr[1] = 0x22222222;
    if (ptr[0] == 0x11111111 && ptr[1] == 0x22222222) {
        debug_puts("  PASS\n");
    } else {
        debug_puts("  FAIL\n");
    }
    
    // Test 3: Eviction
    debug_puts("[TEST] Cache Eviction\n");
    volatile unsigned int* base = (volatile unsigned int*)TEST_BASE;
    base[0] = 0xAAAAAAAA;
    volatile unsigned int* evict = (volatile unsigned int*)(TEST_BASE + L1_CACHE_SIZE);
    evict[0] = 0xBBBBBBBB;
    if (base[0] == 0xAAAAAAAA) {
        debug_puts("  PASS\n");
    } else {
        debug_puts("  FAIL\n");
    }
    
    // Test 4: Writeback
    debug_puts("[TEST] Dirty Line Writeback\n");
    base = (volatile unsigned int*)(TEST_BASE + 0x2000);
    base[0] = 0xCAFEBABE;
    base[1] = 0xDEADC0DE;
    evict = (volatile unsigned int*)(TEST_BASE + 0x2000 + L1_CACHE_SIZE);
    evict[0] = 0x12345678;
    if (base[0] == 0xCAFEBABE && base[1] == 0xDEADC0DE) {
        debug_puts("  PASS\n");
    } else {
        debug_puts("  FAIL\n");
    }
    
    // Test 5: Cross Line
    debug_puts("[TEST] Cross Cache Line\n");
    ptr = (volatile unsigned int*)(TEST_BASE + 0x3000);
    ptr[0] = 0x00000000;
    ptr[3] = 0x33333333;
    ptr[4] = 0x44444444;
    if (ptr[0] == 0 && ptr[3] == 0x33333333 && ptr[4] == 0x44444444) {
        debug_puts("  PASS\n");
    } else {
        debug_puts("  FAIL\n");
    }
    
    debug_puts("\n=== Tests Complete ===\n");
    while(1);
    return 0;
}
