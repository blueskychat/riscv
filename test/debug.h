// Unified debug output library
// Use -DSIMU for fast simulation printing
// Without -DSIMU, uses real UART for FPGA deployment

#ifndef DEBUG_H
#define DEBUG_H

#ifdef SIMU
// ============================================================
// Fast simulation print via magic address
// ============================================================
#define SIM_PRINT_ADDR ((volatile char*)0x90000000)

static inline void debug_putc(char c) {
    *SIM_PRINT_ADDR = c;
}

static inline void debug_init(void) {
    // No init needed for simulation
}

#else
// ============================================================
// Real UART output for FPGA
// ============================================================
#include "uart.h"

static inline void debug_putc(char c) {
    uart_putc(c);
}

static inline void debug_init(void) {
    uart_init();
}

#endif

// ============================================================
// Common functions (work with both modes)
// ============================================================
static inline void debug_puts(const char* str) {
    while (*str) {
        debug_putc(*str++);
    }
}

static inline void debug_print_hex(unsigned int val) {
    const char hex[] = "0123456789ABCDEF";
    debug_putc('0');
    debug_putc('x');
    for (int i = 28; i >= 0; i -= 4) {
        debug_putc(hex[(val >> i) & 0xF]);
    }
}

#endif // DEBUG_H
