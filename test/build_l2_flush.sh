#!/bin/bash

# Build L2 flush test program

TEST_NAME="test_l2_flush"

echo "Building ${TEST_NAME}.s..."

# Assemble
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 ${TEST_NAME}.s -o ${TEST_NAME}.o

# Link
cat > ${TEST_NAME}_link.ld <<EOF
SECTIONS
{
    . = 0x80000000;
    .text : { *(.text*) }
}
EOF

riscv64-unknown-elf-ld -T ${TEST_NAME}_link.ld ${TEST_NAME}.o -o ${TEST_NAME}.elf

# Generate binary
riscv64-unknown-elf-objcopy -O binary ${TEST_NAME}.elf ${TEST_NAME}.bin

# Show size
ls -lh ${TEST_NAME}.bin

echo ""
echo "To run the test:"
echo "  1. Copy ${TEST_NAME}.bin to ../kernel.bin"
echo "  2. cd .."
echo "  3. iverilog -g 2012 -D SIMU -o sim.vvp -s testbench *.sv *.v"
echo "  4. vvp -n sim.vvp"
