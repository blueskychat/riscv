#!/bin/bash

# 编译启动代码
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -c start.s -o start.o

# 编译测试程序
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -O2 -c cache_test.c -o cache_test.o

# 链接
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -T link.ld -o cache_test.elf start.o cache_test.o

# 生成bin文件
riscv64-unknown-elf-objcopy -O binary cache_test.elf cache_test.bin

# 生成反汇编（用于debug）
riscv64-unknown-elf-objdump -d cache_test.elf > cache_test.dis

echo "Build complete!"
echo "cache_test.bin is ready for simulation"
