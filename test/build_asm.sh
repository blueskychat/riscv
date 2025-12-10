#!/bin/bash

# Assemble and link test.s

echo "Building test.s..."

# Assemble test.s directly (no startup code needed, starts at address 0)
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 test.s -o test_asm.o

# Create simple linker script for raw assembly
cat \u003e test_link.ld \u003c\u003cEOF
SECTIONS
{
    . = 0x80000000;
    .text : { *(.text*) }
}
EOF

# Link
riscv64-unknown-elf-ld -T test_link.ld test_asm.o -o test_asm.elf

# Generate binary
riscv64-unknown-elf-objcopy -O binary test_asm.elf test_asm.bin

# Copy to test name expected by testbench
cp test_asm.bin ../riscv.srcs/test.bin

echo "Build complete! test_asm.bin created and copied to riscv.srcs/test.bin"
ls -lh test_asm.bin
