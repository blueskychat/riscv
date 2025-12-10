.section .text.start
.global _start

_start:
    # 设置栈指针到SRAM顶部
    lui sp, 0x80800        # sp = 0x80800000
    
    # 清空BSS段（如果有的话）
    la t0, __bss_start
    la t1, __bss_end
bss_loop:
    bgeu t0, t1, bss_done
    sw zero, 0(t0)
    addi t0, t0, 4
    j bss_loop
bss_done:
    
    # 跳转到main函数
    call main
    
    # main返回后进入死循环
_exit:
    j _exit
