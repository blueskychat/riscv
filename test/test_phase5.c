// Phase 5 Test: L1→L2 Dirty Writeback
// Verifies that dirty L1 data is written to L2 (not memory) on eviction

#define SIM_PRINT_ADDR ((volatile char*)0x90000000)
#define TEST_BASE 0x80100000

void debug_putc(char c) { *SIM_PRINT_ADDR = c; }
void debug_puts(const char* s) { while (*s) debug_putc(*s++); }
void debug_hex(unsigned int v) {
    debug_putc('0'); debug_putc('x');
    for (int i = 28; i >= 0; i -= 4)
        debug_putc("0123456789ABCDEF"[(v >> i) & 0xF]);
}

void fail(const char* t) { debug_puts("FAIL: "); debug_puts(t); debug_puts("\n"); while(1); }
void pass(const char* t) { debug_puts("PASS: "); debug_puts(t); debug_puts("\n"); }

// Test 1: L1 Dirty -> L2 Update -> Read Back
// Write to address, evict from L1 (dirty goes to L2), read back from L2
// Use separate address range to avoid polluting Test 2
void test_l1_to_l2_writeback(void) {
    debug_puts("T1: L1->L2 WB...");
    
    // Use addresses far from Test 2's range
    volatile unsigned int *addr_a = (volatile unsigned int*)(TEST_BASE + 0x40000);
    volatile unsigned int *addr_b = (volatile unsigned int*)(TEST_BASE + 0x40400);
    
    // Write to A (fills L1, dirty)
    *addr_a = 0x12345678;
    
    // Write to B (evicts A from L1, A goes to L2)
    *addr_b = 0xABCDEF00;
    
    // Read A back (should hit L2 with dirty data)
    unsigned int val_a = *addr_a;
    
    if (val_a != 0x12345678) {
        debug_puts(" Got ");
        debug_hex(val_a);
        debug_puts(" Expected ");
        debug_hex(0x12345678);
        debug_puts("\n");
        fail("L1->L2 WB");
    }
    
    pass("L1->L2 WB");
}

// Test 2: Multiple L1 Evictions to L2
void test_multiple_evictions(void) {
    debug_puts("T2: Multi Evict...");
    
    // 4 addresses to same L1 set
    volatile unsigned int *p[4];
    p[0] = (volatile unsigned int*)(TEST_BASE);
    p[1] = (volatile unsigned int*)(TEST_BASE + 0x400);
    p[2] = (volatile unsigned int*)(TEST_BASE + 0x800);
    p[3] = (volatile unsigned int*)(TEST_BASE + 0xC00);
    
    // Write unique values
    for (int i = 0; i < 4; i++) {
        *p[i] = 0x11110000 | i;
    }
    
    // All should be readable (from L2 or memory via L2)
    for (int i = 0; i < 4; i++) {
        unsigned int val = *p[i];
        if (val != (unsigned int)(0x11110000 | i)) {
            debug_puts(" Fail[");
            debug_hex(i);
            debug_puts("] Expected ");
            debug_hex(0x11110000 | i);
            debug_puts(" Got ");
            debug_hex(val);
            debug_puts("\n");
            fail("Multi Evict");
        }
    }
    
    pass("Multi Evict");
}

// Test 3: L2 Dirty Eviction to Memory
void test_l2_dirty_eviction(void) {
    debug_puts("T3: L2 Dirty EV...");
    
    // Need to fill L2 set and trigger L2 eviction with dirty data
    // L2 is 4-way, stride 0x2000 (8KB) puts addresses in same L2 set
    volatile unsigned int *p[6];
    for (int i = 0; i < 6; i++) {
        p[i] = (volatile unsigned int*)(TEST_BASE + 0x10000 + i * 0x2000);
    }
    
    // Write to first 4 (fill L2 set, all dirty)
    for (int i = 0; i < 4; i++) {
        *p[i] = 0x22220000 | i;
    }
    
    // Access 5th and 6th (evict dirty L2 entries to memory)
    *p[4] = 0x22220004;
    *p[5] = 0x22220005;
    
    // Read back all - first 2 should have been evicted to memory and re-fetched
    for (int i = 0; i < 6; i++) {
        if (*p[i] != (unsigned int)(0x22220000 | i)) {
            debug_puts(" Fail at ");
            debug_hex(i);
            debug_puts("\n");
            fail("L2 Dirty EV");
        }
    }
    
    pass("L2 Dirty EV");
}

int main(void) {
    debug_puts("\n=== P5 Test ===\n");
    
    test_l1_to_l2_writeback();
    test_multiple_evictions();
    test_l2_dirty_eviction();
    
    debug_puts("ALL PASS\n");
    
    while(1);
    return 0;
}
