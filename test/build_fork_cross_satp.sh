#!/bin/bash
set -e
echo "Building fork_cross_satp.s..."
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 fork_cross_satp.s -o fork_cross_satp.o

cat > fork_cross_satp_link.ld <<EOF
SECTIONS
{
    . = 0x80000000;
    .text : { *(.text*) }
    .data : { *(.data*) }
}
EOF

riscv64-unknown-elf-ld -m elf32lriscv -T fork_cross_satp_link.ld fork_cross_satp.o -o fork_cross_satp.elf
riscv64-unknown-elf-objcopy -O binary fork_cross_satp.elf fork_cross_satp.bin
riscv64-unknown-elf-objdump -d fork_cross_satp.elf > fork_cross_satp.dis
cp fork_cross_satp.bin ../rbl.img
echo "Build complete!"
ls -lh fork_cross_satp.bin
