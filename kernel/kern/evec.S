    .p2align 2
    .section .text.init
    // 监控程序的入口点，是最先执行的代码
    // .text.init 段放在内存的 0x80000000 位置
INITLOCATE:
/*
    la s1, monitor_version
    la s2, 0x10
.LT:	
	lb	a0,0(s1)
	addi a0,a0,0
    addi s2, s2, -1
	jal WRITE_SERIAL
	addi s1,s1,1
    bne s2, zero, .LT
*/

    // 跳转到 init.S:START
    la s10, START
    jr s10
