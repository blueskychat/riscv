// simple_magic_test.S - 极简Magic Address测试
// 只做 Magic Address 写入，不访问 SRAM

    .section .text
    .p2align 2
    .global _start
_start:
    // 直接写入 Magic Address
    lui t0, 0x90000         // t0 = 0x90000000
    
    li a0, 0x48             // 'H'
    sb a0, 0(t0)
    li a0, 0x45             // 'E'
    sb a0, 0(t0)
    li a0, 0x4C             // 'L'
    sb a0, 0(t0)
    li a0, 0x4C             // 'L'
    sb a0, 0(t0)
    li a0, 0x4F             // 'O'
    sb a0, 0(t0)
    li a0, 0x0A             // '\n'
    sb a0, 0(t0)
    
    // 无限循环
1:  j 1b
