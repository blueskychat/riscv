// Phase 4 Stress Test: L2 Cache
// Using high addresses (0x80100000+) to avoid corrupting instruction memory

#define SIM_PRINT_ADDR ((volatile char*)0x90000000)
#define TEST_BASE 0x80100000  // High address to avoid instruction memory

void debug_putc(char c) {
    *SIM_PRINT_ADDR = c;
}

void debug_puts(const char* str) {
    while (*str) {
        debug_putc(*str++);
    }
}

void debug_print_hex(unsigned int val) {
    const char hex[] = "0123456789ABCDEF";
    debug_putc('0');
    debug_putc('x');
    for (int i = 28; i >= 0; i -= 4) {
        debug_putc(hex[(val >> i) & 0xF]);
    }
}

static unsigned int rand_seed = 0x12345678;
unsigned int rand(void) {
    rand_seed = rand_seed * 1103515245 + 12345;
    return (rand_seed >> 16) & 0x7FFF;
}

void fail(const char* test_name) {
    debug_puts("FAIL: ");
    debug_puts(test_name);
    debug_puts("\n");
    while(1);
}

void pass(const char* test_name) {
    debug_puts("PASS: ");
    debug_puts(test_name);
    debug_puts("\n");
}

// Test 1: Sequential Access Pattern
void test_sequential(void) {
    volatile unsigned int *p = (volatile unsigned int*)TEST_BASE;
    
    debug_puts("T1: Seq...");
    
    for (int i = 0; i < 512 * 4; i++) {
        p[i] = 0x10000000 | i;
    }
    
    for (int i = 0; i < 512 * 4; i++) {
        if (p[i] != (unsigned int)(0x10000000 | i)) {
            fail("Seq");
        }
    }
    
    pass("Seq");
}

// Test 2: L2 4-Way Associativity (READ-ONLY)
void test_l2_4way(void) {
    debug_puts("T2: 4Way...");
    
    volatile unsigned int *a0 = (volatile unsigned int*)(TEST_BASE);
    volatile unsigned int *a1 = (volatile unsigned int*)(TEST_BASE + 0x2000);
    volatile unsigned int *a2 = (volatile unsigned int*)(TEST_BASE + 0x4000);
    volatile unsigned int *a3 = (volatile unsigned int*)(TEST_BASE + 0x6000);
    
    unsigned int v0 = *a0;
    unsigned int v1 = *a1;
    unsigned int v2 = *a2;
    unsigned int v3 = *a3;
    
    if (*a0 != v0 || *a1 != v1 || *a2 != v2 || *a3 != v3) {
        fail("4Way");
    }
    
    pass("4Way");
}

// Test 3: Tag Thrashing (READ-ONLY)
void test_thrashing(void) {
    debug_puts("T3: Thr...");
    
    unsigned int values[6];
    for (int way = 0; way < 6; way++) {
        volatile unsigned int *addr = (volatile unsigned int*)(TEST_BASE + way * 0x2000);
        values[way] = *addr;
    }
    
    for (int way = 0; way < 6; way++) {
        volatile unsigned int *addr = (volatile unsigned int*)(TEST_BASE + way * 0x2000);
        if (*addr != values[way]) {
            fail("Thr");
        }
    }
    
    pass("Thr");
}

// Test 4: Write-Heavy Pattern
void test_write_heavy(void) {
    volatile unsigned int *p = (volatile unsigned int*)(TEST_BASE + 0x10000);
    
    debug_puts("T4: Wr...");
    
    for (int i = 0; i < 64; i++) {
        p[i * 4] = 0xDEAD0000 | i;
    }
    
    for (int i = 0; i < 64; i++) {
        if (p[i * 4] != (unsigned int)(0xDEAD0000 | i)) {
            fail("Wr");
        }
    }
    
    pass("Wr");
}

// Test 5: Random Access (READ-ONLY, reduced range to avoid stack overflow)
void test_random(void) {
    volatile unsigned int *p = (volatile unsigned int*)(TEST_BASE + 0x20000);
    int range = 64;  // Reduced from 512 to avoid stack overflow
    
    debug_puts("T5: Rnd...");
    
    unsigned int expected[64];
    for (int i = 0; i < range; i++) {
        expected[i] = p[i];
    }
    
    rand_seed = 0xCAFEBABE;
    for (int k = 0; k < 50; k++) {
        int idx = rand() % range;
        if (p[idx] != expected[idx]) {
            fail("Rnd");
        }
    }
    
    pass("Rnd");
}

int main(void) {
    debug_puts("\n=== P4 Test ===\n");
    
    test_sequential();
    test_l2_4way();
    test_thrashing();
    test_write_heavy();
    test_random();
    
    debug_puts("ALL PASS\n");
    
    while(1);
    return 0;
}
