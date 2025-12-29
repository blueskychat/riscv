#!/bin/bash

# Build fork_sim.s and copy to riscv.srcs as kernel.bin

set -e

echo "Building fork_sim.s..."

# Assemble
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 fork_sim.s -o fork_sim.o

# Create linker script
cat > fork_sim_link.ld <<EOF
SECTIONS
{
    . = 0x80000000;
    .text : { *(.text*) }
    .data : { *(.data*) }
}
EOF

# Link
riscv64-unknown-elf-ld -m elf32lriscv -T fork_sim_link.ld fork_sim.o -o fork_sim.elf

# Generate binary
riscv64-unknown-elf-objcopy -O binary fork_sim.elf fork_sim.bin

# Disassemble for debugging
riscv64-unknown-elf-objdump -d fork_sim.elf > fork_sim.dis

# Copy to riscv.srcs directory as rbl.img (testbench loads from BASE_RAM_INIT_FILE)
cp fork_sim.bin ../rbl.img

echo ""
echo "Build complete!"
echo "  fork_sim.bin created"
echo "  Copied to ../rbl.img"
echo ""
echo "File size:"
ls -lh fork_sim.bin

echo ""
echo "To run simulation:"
echo "  cd D:/sqw/code/verilogtest/riscv/riscv.srcs"
echo "  iverilog -g 2012 -D SIMU -o sim.vvp -s testbench *.sv *.v"
echo "  vvp -n sim.vvp"
