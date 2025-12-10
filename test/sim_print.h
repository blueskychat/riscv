// Fast simulation print - uses magic address to trigger testbench $display
// Much faster than UART for simulation debugging!

#ifndef SIM_PRINT_H
#define SIM_PRINT_H

// Magic address for simulation print
#define SIM_PRINT_ADDR ((volatile char*)0x90000000)

static inline void sim_putc(char c) {
    *SIM_PRINT_ADDR = c;
}

static inline void sim_puts(const char* str) {
    while (*str) {
        sim_putc(*str++);
    }
}

static inline void sim_print_hex(unsigned int val) {
    const char hex[] = "0123456789ABCDEF";
    sim_putc('0');
    sim_putc('x');
    for (int i = 28; i >= 0; i -= 4) {
        sim_putc(hex[(val >> i) & 0xF]);
    }
}

#endif // SIM_PRINT_H
