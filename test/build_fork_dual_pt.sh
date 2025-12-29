#!/bin/bash

# Build fork_dual_pt.s - dual page table fork test

set -e

echo "Building fork_dual_pt.s..."

# Assemble
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 fork_dual_pt.s -o fork_dual_pt.o

# Create linker script
cat > fork_dual_pt_link.ld <<EOF
SECTIONS
{
    . = 0x80000000;
    .text : { *(.text*) }
    .data : { *(.data*) }
}
EOF

# Link
riscv64-unknown-elf-ld -m elf32lriscv -T fork_dual_pt_link.ld fork_dual_pt.o -o fork_dual_pt.elf

# Generate binary
riscv64-unknown-elf-objcopy -O binary fork_dual_pt.elf fork_dual_pt.bin

# Disassemble
riscv64-unknown-elf-objdump -d fork_dual_pt.elf > fork_dual_pt.dis

# Copy to rbl.img
cp fork_dual_pt.bin ../rbl.img

echo ""
echo "Build complete!"
echo "  fork_dual_pt.bin created and copied to ../rbl.img"
echo ""
ls -lh fork_dual_pt.bin

echo ""
echo "Expected output: MSPABCRY"
echo "  M = M-mode start"
echo "  S = S-mode entered"
echo "  P = Paging enabled (PT A)"
echo "  A = Page table A active"
echo "  B = Code copied, fence.i done"
echo "  C = Switching to PT B (child)"
echo "  R = Ready to sret"
echo "  Y = SUCCESS - child code executed!"
