#!/bin/bash

# Build UART IO Test Program

set -e  # Exit on error

echo "Building test_uart_io.s..."

# Assemble
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 test_uart_io.s -o test_uart_io.o

# Create linker script
cat > test_uart_io_link.ld <<EOF
SECTIONS
{
    . = 0x80000000;
    .text : { *(.text*) }
    .rodata : { *(.rodata*) }
    .data : { *(.data*) }
    .bss : { *(.bss*) }
}
EOF

# Link
riscv64-unknown-elf-ld -T test_uart_io_link.ld test_uart_io.o -o test_uart_io.elf

# Generate binary
riscv64-unknown-elf-objcopy -O binary test_uart_io.elf test_uart_io.bin

# Disassemble for debugging
riscv64-unknown-elf-objdump -d test_uart_io.elf > test_uart_io.dis

# Copy to rbl.img for testbench
cp test_uart_io.bin ../rbl.img

echo "Build complete!"
echo "Binary: test_uart_io.bin ($(stat -c%s test_uart_io.bin 2>/dev/null || stat -f%z test_uart_io.bin) bytes)"
echo "Copied to ../rbl.img"
