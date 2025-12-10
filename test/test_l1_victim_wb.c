// Test: L1 Dirty with L2 Clean Victim Eviction
// Specifically tests the L1_VICTIM_WB state logic
// Scenario: L2 is clean, L1 has dirty version, L2 victim eviction

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

// Test: L1 dirty + L2 clean victim eviction
// This tests the L1_VICTIM_WB path specifically
void test_l1_dirty_l2_clean_evict(void) {
    debug_puts("T4: L1 dirty L2 clean evict\n");
    
    // Step 1: Setup - fill L2 set with 4 lines (all clean, just read into L2)
    // L2 is 4-way, stride 0x2000 puts addresses in same L2 set
    // These addresses have same L2 index, different L2 tags
    volatile unsigned int *p[5];
    for (int i = 0; i < 5; i++) {
        p[i] = (volatile unsigned int*)(TEST_BASE + 0x20000 + i * 0x2000);
    }
    
    // Read first 4 to fill L2 (cold init with 0)
    debug_puts("  Fill L2 with 4 clean lines\n");
    for (int i = 0; i < 4; i++) {
        volatile unsigned int tmp = *p[i];  // Read to fill L2 (clean)
        (void)tmp;
    }
    
    // Step 2: Write to p[0] - this makes L1 dirty, but L2 is still clean!
    debug_puts("  Write p[0]=0xDEADBEEF (L1 dirty, L2 clean)\n");
    *p[0] = 0xDEADBEEF;  // L1 dirty, L2 clean
    
    // Step 3: Access p[4] - this causes L2 miss and L2 victim eviction
    // L2 victim (LRU) could be p[0]'s line
    // If L1 has dirty p[0], must use L1_VICTIM_WB to save it
    debug_puts("  Access p[4] (triggers L2 eviction)\n");
    *p[4] = 0x44444444;
    
    // Step 4: Read p[0] back - should get 0xDEADBEEF (from memory, via L2)
    debug_puts("  Read p[0] back: ");
    unsigned int val = *p[0];
    debug_hex(val);
    debug_puts("\n");
    
    if (val != 0xDEADBEEF) {
        debug_puts("  Expected 0xDEADBEEF\n");
        fail("L1 dirty L2 clean evict");
    }
    
    pass("L1 dirty L2 clean evict");
}

int main(void) {
    debug_puts("\n=== L1_VICTIM_WB Test ===\n");
    test_l1_dirty_l2_clean_evict();
    debug_puts("ALL PASS\n");
    while(1);
    return 0;
}
