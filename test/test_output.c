// Test program for UART and Magic Address output
// Verifies single-cycle memory operation support

#include "sim_print.h"
#include "uart.h"

int main(void) {
    // Test 1: Magic Address output (should be single-cycle)
    sim_puts("=== Magic Address Test ===\n");
    sim_puts("HELLO from Magic!\n");
    
    // Test 2: UART output (should also be single-cycle for initial write)
    uart_puts("=== UART Test ===\n");
    uart_puts("HELLO from UART!\n");
    
    // Test 3: Continuous Magic Address writes
    sim_puts("Continuous: ");
    for (int i = 0; i < 10; i++) {
        sim_putc('0' + i);
    }
    sim_putc('\n');
    
    // Test 4: Mixed output
    sim_puts("Test PASS!\n");
    uart_puts("Test PASS!\n");
    
    return 0;
}
