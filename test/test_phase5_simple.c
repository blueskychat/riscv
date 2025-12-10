// Simplified Phase 5 Test: Debug L1→L2
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

// Test with 4 addresses (original Test 2 scenario)
void test_simple_evict(void) {
    debug_puts("Testing 4-addr evict\n");
    
    volatile unsigned int *p0 = (volatile unsigned int*)(TEST_BASE);
    volatile unsigned int *p1 = (volatile unsigned int*)(TEST_BASE + 0x400);
    volatile unsigned int *p2 = (volatile unsigned int*)(TEST_BASE + 0x800);
    volatile unsigned int *p3 = (volatile unsigned int*)(TEST_BASE + 0xC00);
    
    debug_puts("Write p0=0xAAAA0000\n");
    *p0 = 0xAAAA0000;
    
    debug_puts("Write p1=0xBBBB0001\n");
    *p1 = 0xBBBB0001;
    
    debug_puts("Write p2=0xCCCC0002\n");
    *p2 = 0xCCCC0002;
    
    debug_puts("Write p3=0xDDDD0003\n");
    *p3 = 0xDDDD0003;
    
    debug_puts("Read p0: ");
    unsigned int v0 = *p0;
    debug_hex(v0);
    debug_puts(v0 == 0xAAAA0000 ? " OK\n" : " FAIL\n");
    if (v0 != 0xAAAA0000) fail("p0");
    
    debug_puts("Read p1: ");
    unsigned int v1 = *p1;
    debug_hex(v1);
    debug_puts(v1 == 0xBBBB0001 ? " OK\n" : " FAIL\n");
    if (v1 != 0xBBBB0001) fail("p1");
    
    debug_puts("Read p2: ");
    unsigned int v2 = *p2;
    debug_hex(v2);
    debug_puts(v2 == 0xCCCC0002 ? " OK\n" : " FAIL\n");
    if (v2 != 0xCCCC0002) fail("p2");
    
    debug_puts("Read p3: ");
    unsigned int v3 = *p3;
    debug_hex(v3);
    debug_puts(v3 == 0xDDDD0003 ? " OK\n" : " FAIL\n");
    if (v3 != 0xDDDD0003) fail("p3");
    
    pass("4-addr evict");
}

int main(void) {
    debug_puts("\n=== P5 Debug ===\n");
    test_simple_evict();
    debug_puts("ALL PASS\n");
    while(1);
    return 0;
}
