#include "sim_print.h"

int main() {
    sim_puts("Test1\n");
    
    // Test simple loop
    for (int i = 0; i < 3; i++) {
        sim_putc('A' + i);
    }
    sim_putc('\n');
    
    // Test data access to 0x80400000
    unsigned int *ptr = (unsigned int*)0x80400000;
    sim_puts("Before write\n");
    ptr[0] = 0x12345678;
    sim_puts("After write\n");
    unsigned int val = ptr[0];
    sim_puts("After read\n");
    
    if (val == 0x12345678) {
        sim_puts("PASS\n");
    } else {
        sim_puts("FAIL\n");
    }
    
    return 0;
}
