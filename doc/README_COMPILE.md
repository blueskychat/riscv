# 编译说明

## 仿真模式（快速调试）- 推荐用于开发

使用 magic address 输出，速度**超快**（几百倍于UART）：

```bash
# 添加 -DSIMU 宏定义
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -O2 -DSIMU -c writeback_test.c -o writeback_test.o
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -T link.ld -o writeback_test.elf start.o writeback_test.o
riscv64-unknown-elf-objcopy -O binary writeback_test.elf writeback_test.bin
copy writeback_test.bin kernel.bin
```

输出直接通过 $write 显示在 Vivado TCL Console，瞬时输出！

kernel.bin 复制到仿真目录中。
```bash
iverilog -g2012 -o sim.vvp -D SIMU -s testbench  *.sv *.v
vvp sim.vvp
```

## FPGA模式（实际部署）

使用真实UART，但速度慢（用于验证实际硬件）：

```bash
# 不加 -DSIMU，使用UART
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -O2 -c writeback_test.c -o writeback_test.o
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -T link.ld -o writeback_test.elf start.o writeback_test.o
riscv64-unknown-elf-objcopy -O binary writeback_test.elf writeback_test.bin
```

## 代码修改

所有测试文件只需要：

```c
#include "debug.h"  // 统一的调试库

int main() {
    debug_init();           // 自动选择UART或无操作
    debug_puts("Hello!");   // 自动使用快速或UART输出
    debug_print_hex(0x12345678);
}
```

**不需要修改代码**，只需编译时加/不加 `-DSIMU` 即可切换！
