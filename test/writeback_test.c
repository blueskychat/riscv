#include "debug.h"

#define TEST_BASE 0x80002000
#define L1_CACHE_SIZE 2048

void print_hex(unsigned int val) {
    debug_print_hex(val);
}

int main() {
    debug_init();
    
    debug_puts("\n=== Writeback Test ===\n");
    
    volatile unsigned int* base = (volatile unsigned int*)(TEST_BASE);
    
    debug_puts("Step 1: Write to address A...\n");
    base[0] = 0xCAFEBABE;
    base[1] = 0xDEADC0DE;
    debug_puts("  Written: 0xCAFEBABE, 0xDEADC0DE\n");
    
    debug_puts("Step 2: Access same set to trigger eviction...\n");
    volatile unsigned int* evict_addr = (volatile unsigned int*)(TEST_BASE + L1_CACHE_SIZE);
    evict_addr[0] = 0x12345678;
    debug_puts("  Eviction triggered\n");
    
    debug_puts("Step 3: Read back original address A...\n");
    unsigned int val0 = base[0];
    unsigned int val1 = base[1];
    
    debug_puts("  Read back: ");
    print_hex(val0);
    debug_puts(", ");
    print_hex(val1);
    debug_puts("\n");
    
    if (val0 == 0xCAFEBABE && val1 == 0xDEADC0DE) {
        debug_puts("PASS: Writeback successful!\n");
    } else {
        debug_puts("FAIL: Data corrupted!\n");
        debug_puts("  Expected: 0xCAFEBABE, 0xDEADC0DE\n");
    }
    
    debug_puts("\n=== Test Complete ===\n");
    
    while(1);
    
    return 0;
}
