#!/bin/bash

# Build L2 ICache Flush 测试程序
# 这个测试验证 fence.i 必须刷新 L2 到 SRAM，否则 ICache 会读到错误数据

TEST_NAME="test_l2_icache_flush"

echo "=== Building ${TEST_NAME}.s ==="

# Assemble
riscv64-unknown-elf-as -march=rv32i -mabi=ilp32 ${TEST_NAME}.s -o ${TEST_NAME}.o
if [ $? -ne 0 ]; then
    echo "Assembly failed!"
    exit 1
fi

# Create link script
cat > ${TEST_NAME}_link.ld <<EOF
SECTIONS
{
    . = 0x80000000;
    .text : { *(.text*) }
    .data : { *(.data*) }
}
EOF

# Link
riscv64-unknown-elf-ld -m elf32lriscv -T ${TEST_NAME}_link.ld ${TEST_NAME}.o -o ${TEST_NAME}.elf
if [ $? -ne 0 ]; then
    echo "Linking failed!"
    exit 1
fi

# Generate binary
riscv64-unknown-elf-objcopy -O binary ${TEST_NAME}.elf ${TEST_NAME}.bin
if [ $? -ne 0 ]; then
    echo "Binary generation failed!"
    exit 1
fi

# Show size
echo ""
echo "Generated files:"
ls -lh ${TEST_NAME}.bin

# Disassemble for debugging
riscv64-unknown-elf-objdump -d ${TEST_NAME}.elf > ${TEST_NAME}.dis 2>/dev/null

echo ""
echo "=== To run the test ==="
echo "1. Copy to kernel.bin:"
echo "   cp ${TEST_NAME}.bin ../kernel.bin"
echo ""
echo "2. Compile simulation:"
echo "   cd .."
echo "   iverilog -g 2012 -D SIMU -o sim.vvp -s testbench *.sv *.v"
echo ""
echo "3. Run simulation:"
echo "   vvp -n sim.vvp"
echo ""
echo "=== Expected Results ==="
echo "  - With L2 flush fix:    Output = 12345PASS"
echo "  - Without L2 flush fix: Output = 1234 then hang (or Illegal Instruction)"
