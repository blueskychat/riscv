#include "sim_print.h"

// Xorshift LFSR
unsigned int xorshift(unsigned int s0) {
    unsigned int s1;
    s1 = s0 << 13; s0 ^= s1;
    s1 = s0 >> 17; s0 ^= s1;
    s1 = s0 << 5; s0 ^= s1;
    return s0;
}

void print_hex(unsigned int val) {
    const char hex[] = "0123456789ABCDEF";
    for (int i = 7; i >= 0; i--) {
        sim_putc(hex[(val >> (i*4)) & 0xF]);
    }
}

int main() {
    unsigned int s0 = 1;
    unsigned int t0 = 0, t1 = 0;
    unsigned int *base = (unsigned int*)0x80400000;
    unsigned int mask = 0x1FFFFC;
    int iterations = 100;
    
    sim_puts("START\n");
    
    // Main loop
    for (int i = 0; i < iterations; i++) {
        if ((i & 0xF) == 0) sim_putc('.');
        
        // Read
        t0 = base[(s0 & mask) >> 2];
        // XOR
        t0 ^= t1;
        s0 ^= t0;
        // Update s0
        s0 = xorshift(s0);
        // Write
        base[(s0 & mask) >> 2] = t0;
        t1 = t0;
        // Update s0 again
        s0 = xorshift(s0);
    }
    
    sim_puts("\ns0=0x");
    print_hex(s0);
    sim_puts("\nDONE\n");
    
    return 0;
}
