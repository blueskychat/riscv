#include "uart.h"

#define TEST_BASE 0x80002000

int main() {
    uart_init();
    uart_puts("Start\n");
    
    // Test 1: Simple write/read
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    ptr[0] = 0x12345678;
    
    if (ptr[0] == 0x12345678) {
        uart_puts("PASS\n");
    } else {
        uart_puts("FAIL\n");
    }
    
    uart_puts("Done\n");
    
    // Infinite loop to prevent program from running into undefined memory
    while(1);
    
    return 0;
}
