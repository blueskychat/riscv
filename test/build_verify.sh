#!/bin/bash
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -c start.s -o start.o
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -O2 -c cache_verify.c -o cache_verify.o
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -T link.ld -o cache_verify.elf start.o cache_verify.o
riscv64-unknown-elf-objcopy -O binary cache_verify.elf cache_verify.bin
cp cache_verify.bin ../riscv.srcs/test.bin
echo "Built cache_verify.bin and copied to test.bin"
ls -lh cache_verify.bin
