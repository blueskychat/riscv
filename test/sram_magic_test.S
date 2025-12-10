// sram_magic_test.S - 测试 SRAM 访问 + Magic Address
// 在 SRAM 范围内做简单操作，然后输出 Magic Address

    .section .text
    .p2align 2
    .global _start
_start:
    // 首先测试一个简单的 SRAM 写入
    // 使用栈区域: 0x80100000 (在 8MB 范围内)
    lui sp, 0x80100
    
    // 写入一些值到栈
    li t0, 0x12345678
    sw t0, 0(sp)
    
    // 读回来验证
    lw t1, 0(sp)
    
    // 输出 'S' 表示 SRAM 测试
    lui t2, 0x90000
    li a0, 0x53             // 'S'
    sb a0, 0(t2)
    
    // 输出 'R' 
    li a0, 0x52             // 'R'
    sb a0, 0(t2)
    
    // 输出 'A'
    li a0, 0x41             // 'A'
    sb a0, 0(t2)
    
    // 输出 'M'
    li a0, 0x4D             // 'M'
    sb a0, 0(t2)
    
    // 输出换行
    li a0, 0x0A             // '\n'
    sb a0, 0(t2)
    
    // 无限循环
1:  j 1b
