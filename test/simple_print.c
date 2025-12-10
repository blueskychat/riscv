#include "debug.h"

int main() {
    debug_init();
    debug_putc('A');
    debug_putc('B');
    debug_putc('C');
    debug_putc('\n');
    
    while(1);
    return 0;
}
