
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

80400000 <kern_entry>:
80400000:	00019117          	auipc	sp,0x19
80400004:	00010113          	mv	sp,sp
80400008:	0040006f          	j	8040000c <kern_init>

8040000c <kern_init>:
8040000c:	00099517          	auipc	a0,0x99
80400010:	04050513          	addi	a0,a0,64 # 8049904c <edata>
80400014:	0009d617          	auipc	a2,0x9d
80400018:	8a860613          	addi	a2,a2,-1880 # 8049c8bc <end>
8040001c:	ff010113          	addi	sp,sp,-16 # 80418ff0 <bootstack+0x1ff0>
80400020:	40a60633          	sub	a2,a2,a0
80400024:	00000593          	li	a1,0
80400028:	00112623          	sw	ra,12(sp)
8040002c:	78c120ef          	jal	ra,804127b8 <memset>
80400030:	03d000ef          	jal	ra,8040086c <cons_init>
80400034:	00013597          	auipc	a1,0x13
80400038:	8f058593          	addi	a1,a1,-1808 # 80412924 <etext>
8040003c:	00013517          	auipc	a0,0x13
80400040:	90450513          	addi	a0,a0,-1788 # 80412940 <etext+0x1c>
80400044:	1b8000ef          	jal	ra,804001fc <cprintf>
80400048:	294000ef          	jal	ra,804002dc <print_kerninfo>
8040004c:	2b5030ef          	jal	ra,80403b00 <pmm_init>
80400050:	3d5000ef          	jal	ra,80400c24 <pic_init>
80400054:	5b9000ef          	jal	ra,80400e0c <idt_init>
80400058:	281040ef          	jal	ra,80404ad8 <vmm_init>
8040005c:	0ad0c0ef          	jal	ra,8040c908 <sched_init>
80400060:	2b5080ef          	jal	ra,80408b14 <proc_init>
80400064:	161000ef          	jal	ra,804009c4 <ide_init>
80400068:	5d1030ef          	jal	ra,80403e38 <swap_init>
8040006c:	1d8060ef          	jal	ra,80406244 <fs_init>
80400070:	6e0000ef          	jal	ra,80400750 <clock_init>
80400074:	3a1000ef          	jal	ra,80400c14 <intr_enable>
80400078:	481080ef          	jal	ra,80408cf8 <cpu_idle>

8040007c <readline>:
8040007c:	fd010113          	addi	sp,sp,-48
80400080:	02112623          	sw	ra,44(sp)
80400084:	02812423          	sw	s0,40(sp)
80400088:	02912223          	sw	s1,36(sp)
8040008c:	03212023          	sw	s2,32(sp)
80400090:	01312e23          	sw	s3,28(sp)
80400094:	01412c23          	sw	s4,24(sp)
80400098:	01512a23          	sw	s5,20(sp)
8040009c:	01612823          	sw	s6,16(sp)
804000a0:	01712623          	sw	s7,12(sp)
804000a4:	00050a63          	beqz	a0,804000b8 <readline+0x3c>
804000a8:	00050593          	mv	a1,a0
804000ac:	00013517          	auipc	a0,0x13
804000b0:	89c50513          	addi	a0,a0,-1892 # 80412948 <etext+0x24>
804000b4:	148000ef          	jal	ra,804001fc <cprintf>
804000b8:	00000493          	li	s1,0
804000bc:	01f00913          	li	s2,31
804000c0:	00800993          	li	s3,8
804000c4:	00a00a93          	li	s5,10
804000c8:	00d00b13          	li	s6,13
804000cc:	00099b97          	auipc	s7,0x99
804000d0:	f84b8b93          	addi	s7,s7,-124 # 80499050 <buf>
804000d4:	3fe00a13          	li	s4,1022
804000d8:	188000ef          	jal	ra,80400260 <getchar>
804000dc:	00050413          	mv	s0,a0
804000e0:	00054c63          	bltz	a0,804000f8 <readline+0x7c>
804000e4:	00a95e63          	bge	s2,a0,80400100 <readline+0x84>
804000e8:	029a5a63          	bge	s4,s1,8040011c <readline+0xa0>
804000ec:	174000ef          	jal	ra,80400260 <getchar>
804000f0:	00050413          	mv	s0,a0
804000f4:	fe0558e3          	bgez	a0,804000e4 <readline+0x68>
804000f8:	00000513          	li	a0,0
804000fc:	0580006f          	j	80400154 <readline+0xd8>
80400100:	03341a63          	bne	s0,s3,80400134 <readline+0xb8>
80400104:	06049e63          	bnez	s1,80400180 <readline+0x104>
80400108:	158000ef          	jal	ra,80400260 <getchar>
8040010c:	00050413          	mv	s0,a0
80400110:	fe0544e3          	bltz	a0,804000f8 <readline+0x7c>
80400114:	fea956e3          	bge	s2,a0,80400100 <readline+0x84>
80400118:	00000493          	li	s1,0
8040011c:	00040513          	mv	a0,s0
80400120:	13c000ef          	jal	ra,8040025c <cputchar>
80400124:	009b87b3          	add	a5,s7,s1
80400128:	00878023          	sb	s0,0(a5)
8040012c:	00148493          	addi	s1,s1,1
80400130:	fa9ff06f          	j	804000d8 <readline+0x5c>
80400134:	01540463          	beq	s0,s5,8040013c <readline+0xc0>
80400138:	fb6410e3          	bne	s0,s6,804000d8 <readline+0x5c>
8040013c:	00040513          	mv	a0,s0
80400140:	11c000ef          	jal	ra,8040025c <cputchar>
80400144:	00099517          	auipc	a0,0x99
80400148:	f0c50513          	addi	a0,a0,-244 # 80499050 <buf>
8040014c:	009504b3          	add	s1,a0,s1
80400150:	00048023          	sb	zero,0(s1)
80400154:	02c12083          	lw	ra,44(sp)
80400158:	02812403          	lw	s0,40(sp)
8040015c:	02412483          	lw	s1,36(sp)
80400160:	02012903          	lw	s2,32(sp)
80400164:	01c12983          	lw	s3,28(sp)
80400168:	01812a03          	lw	s4,24(sp)
8040016c:	01412a83          	lw	s5,20(sp)
80400170:	01012b03          	lw	s6,16(sp)
80400174:	00c12b83          	lw	s7,12(sp)
80400178:	03010113          	addi	sp,sp,48
8040017c:	00008067          	ret
80400180:	00800513          	li	a0,8
80400184:	0d8000ef          	jal	ra,8040025c <cputchar>
80400188:	fff48493          	addi	s1,s1,-1
8040018c:	f4dff06f          	j	804000d8 <readline+0x5c>

80400190 <cputch>:
80400190:	ff010113          	addi	sp,sp,-16
80400194:	00812423          	sw	s0,8(sp)
80400198:	00112623          	sw	ra,12(sp)
8040019c:	00058413          	mv	s0,a1
804001a0:	6e4000ef          	jal	ra,80400884 <cons_putc>
804001a4:	00042783          	lw	a5,0(s0)
804001a8:	00c12083          	lw	ra,12(sp)
804001ac:	00178793          	addi	a5,a5,1
804001b0:	00f42023          	sw	a5,0(s0)
804001b4:	00812403          	lw	s0,8(sp)
804001b8:	01010113          	addi	sp,sp,16
804001bc:	00008067          	ret

804001c0 <vcprintf>:
804001c0:	fe010113          	addi	sp,sp,-32
804001c4:	00058713          	mv	a4,a1
804001c8:	ffff75b7          	lui	a1,0xffff7
804001cc:	00050693          	mv	a3,a0
804001d0:	00c10613          	addi	a2,sp,12
804001d4:	00000517          	auipc	a0,0x0
804001d8:	fbc50513          	addi	a0,a0,-68 # 80400190 <cputch>
804001dc:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a21d>
804001e0:	00112e23          	sw	ra,28(sp)
804001e4:	00012623          	sw	zero,12(sp)
804001e8:	6f1110ef          	jal	ra,804120d8 <vprintfmt>
804001ec:	01c12083          	lw	ra,28(sp)
804001f0:	00c12503          	lw	a0,12(sp)
804001f4:	02010113          	addi	sp,sp,32
804001f8:	00008067          	ret

804001fc <cprintf>:
804001fc:	fc010113          	addi	sp,sp,-64
80400200:	02410313          	addi	t1,sp,36
80400204:	02b12223          	sw	a1,36(sp)
80400208:	ffff75b7          	lui	a1,0xffff7
8040020c:	02c12423          	sw	a2,40(sp)
80400210:	02d12623          	sw	a3,44(sp)
80400214:	02e12823          	sw	a4,48(sp)
80400218:	00050693          	mv	a3,a0
8040021c:	00c10613          	addi	a2,sp,12
80400220:	00000517          	auipc	a0,0x0
80400224:	f7050513          	addi	a0,a0,-144 # 80400190 <cputch>
80400228:	00030713          	mv	a4,t1
8040022c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a21d>
80400230:	00112e23          	sw	ra,28(sp)
80400234:	02f12a23          	sw	a5,52(sp)
80400238:	03012c23          	sw	a6,56(sp)
8040023c:	03112e23          	sw	a7,60(sp)
80400240:	00612423          	sw	t1,8(sp)
80400244:	00012623          	sw	zero,12(sp)
80400248:	691110ef          	jal	ra,804120d8 <vprintfmt>
8040024c:	01c12083          	lw	ra,28(sp)
80400250:	00c12503          	lw	a0,12(sp)
80400254:	04010113          	addi	sp,sp,64
80400258:	00008067          	ret

8040025c <cputchar>:
8040025c:	6280006f          	j	80400884 <cons_putc>

80400260 <getchar>:
80400260:	ff010113          	addi	sp,sp,-16
80400264:	00112623          	sw	ra,12(sp)
80400268:	690000ef          	jal	ra,804008f8 <cons_getc>
8040026c:	fe050ee3          	beqz	a0,80400268 <getchar+0x8>
80400270:	00c12083          	lw	ra,12(sp)
80400274:	01010113          	addi	sp,sp,16
80400278:	00008067          	ret

8040027c <strdup>:
8040027c:	ff010113          	addi	sp,sp,-16
80400280:	00112623          	sw	ra,12(sp)
80400284:	00812423          	sw	s0,8(sp)
80400288:	00912223          	sw	s1,4(sp)
8040028c:	01212023          	sw	s2,0(sp)
80400290:	00050913          	mv	s2,a0
80400294:	440120ef          	jal	ra,804126d4 <strlen>
80400298:	00050413          	mv	s0,a0
8040029c:	00150513          	addi	a0,a0,1
804002a0:	720020ef          	jal	ra,804029c0 <kmalloc>
804002a4:	00050493          	mv	s1,a0
804002a8:	00050c63          	beqz	a0,804002c0 <strdup+0x44>
804002ac:	00040613          	mv	a2,s0
804002b0:	00090593          	mv	a1,s2
804002b4:	00848433          	add	s0,s1,s0
804002b8:	570120ef          	jal	ra,80412828 <memcpy>
804002bc:	00040023          	sb	zero,0(s0)
804002c0:	00c12083          	lw	ra,12(sp)
804002c4:	00812403          	lw	s0,8(sp)
804002c8:	00048513          	mv	a0,s1
804002cc:	00012903          	lw	s2,0(sp)
804002d0:	00412483          	lw	s1,4(sp)
804002d4:	01010113          	addi	sp,sp,16
804002d8:	00008067          	ret

804002dc <print_kerninfo>:
804002dc:	ff010113          	addi	sp,sp,-16
804002e0:	00012517          	auipc	a0,0x12
804002e4:	69450513          	addi	a0,a0,1684 # 80412974 <etext+0x50>
804002e8:	00112623          	sw	ra,12(sp)
804002ec:	f11ff0ef          	jal	ra,804001fc <cprintf>
804002f0:	00000597          	auipc	a1,0x0
804002f4:	d1c58593          	addi	a1,a1,-740 # 8040000c <kern_init>
804002f8:	00012517          	auipc	a0,0x12
804002fc:	69850513          	addi	a0,a0,1688 # 80412990 <etext+0x6c>
80400300:	efdff0ef          	jal	ra,804001fc <cprintf>
80400304:	00012597          	auipc	a1,0x12
80400308:	62058593          	addi	a1,a1,1568 # 80412924 <etext>
8040030c:	00012517          	auipc	a0,0x12
80400310:	6a050513          	addi	a0,a0,1696 # 804129ac <etext+0x88>
80400314:	ee9ff0ef          	jal	ra,804001fc <cprintf>
80400318:	00099597          	auipc	a1,0x99
8040031c:	d3458593          	addi	a1,a1,-716 # 8049904c <edata>
80400320:	00012517          	auipc	a0,0x12
80400324:	6a850513          	addi	a0,a0,1704 # 804129c8 <etext+0xa4>
80400328:	ed5ff0ef          	jal	ra,804001fc <cprintf>
8040032c:	0009c597          	auipc	a1,0x9c
80400330:	59058593          	addi	a1,a1,1424 # 8049c8bc <end>
80400334:	00012517          	auipc	a0,0x12
80400338:	6b050513          	addi	a0,a0,1712 # 804129e4 <etext+0xc0>
8040033c:	ec1ff0ef          	jal	ra,804001fc <cprintf>
80400340:	0009d597          	auipc	a1,0x9d
80400344:	97b58593          	addi	a1,a1,-1669 # 8049ccbb <end+0x3ff>
80400348:	00000797          	auipc	a5,0x0
8040034c:	cc478793          	addi	a5,a5,-828 # 8040000c <kern_init>
80400350:	40f587b3          	sub	a5,a1,a5
80400354:	41f7d593          	srai	a1,a5,0x1f
80400358:	00c12083          	lw	ra,12(sp)
8040035c:	3ff5f593          	andi	a1,a1,1023
80400360:	00f585b3          	add	a1,a1,a5
80400364:	40a5d593          	srai	a1,a1,0xa
80400368:	00012517          	auipc	a0,0x12
8040036c:	69850513          	addi	a0,a0,1688 # 80412a00 <etext+0xdc>
80400370:	01010113          	addi	sp,sp,16
80400374:	e89ff06f          	j	804001fc <cprintf>

80400378 <print_stackframe>:
80400378:	ff010113          	addi	sp,sp,-16
8040037c:	00012617          	auipc	a2,0x12
80400380:	5d060613          	addi	a2,a2,1488 # 8041294c <etext+0x28>
80400384:	05b00593          	li	a1,91
80400388:	00012517          	auipc	a0,0x12
8040038c:	5d850513          	addi	a0,a0,1496 # 80412960 <etext+0x3c>
80400390:	00112623          	sw	ra,12(sp)
80400394:	290000ef          	jal	ra,80400624 <__panic>

80400398 <mon_help>:
80400398:	ff010113          	addi	sp,sp,-16
8040039c:	00012617          	auipc	a2,0x12
804003a0:	74860613          	addi	a2,a2,1864 # 80412ae4 <commands+0xb8>
804003a4:	00012597          	auipc	a1,0x12
804003a8:	76058593          	addi	a1,a1,1888 # 80412b04 <commands+0xd8>
804003ac:	00012517          	auipc	a0,0x12
804003b0:	76050513          	addi	a0,a0,1888 # 80412b0c <commands+0xe0>
804003b4:	00112623          	sw	ra,12(sp)
804003b8:	e45ff0ef          	jal	ra,804001fc <cprintf>
804003bc:	00012617          	auipc	a2,0x12
804003c0:	75c60613          	addi	a2,a2,1884 # 80412b18 <commands+0xec>
804003c4:	00012597          	auipc	a1,0x12
804003c8:	77c58593          	addi	a1,a1,1916 # 80412b40 <commands+0x114>
804003cc:	00012517          	auipc	a0,0x12
804003d0:	74050513          	addi	a0,a0,1856 # 80412b0c <commands+0xe0>
804003d4:	e29ff0ef          	jal	ra,804001fc <cprintf>
804003d8:	00012617          	auipc	a2,0x12
804003dc:	77460613          	addi	a2,a2,1908 # 80412b4c <commands+0x120>
804003e0:	00012597          	auipc	a1,0x12
804003e4:	78c58593          	addi	a1,a1,1932 # 80412b6c <commands+0x140>
804003e8:	00012517          	auipc	a0,0x12
804003ec:	72450513          	addi	a0,a0,1828 # 80412b0c <commands+0xe0>
804003f0:	e0dff0ef          	jal	ra,804001fc <cprintf>
804003f4:	00c12083          	lw	ra,12(sp)
804003f8:	00000513          	li	a0,0
804003fc:	01010113          	addi	sp,sp,16
80400400:	00008067          	ret

80400404 <mon_kerninfo>:
80400404:	ff010113          	addi	sp,sp,-16
80400408:	00112623          	sw	ra,12(sp)
8040040c:	ed1ff0ef          	jal	ra,804002dc <print_kerninfo>
80400410:	00c12083          	lw	ra,12(sp)
80400414:	00000513          	li	a0,0
80400418:	01010113          	addi	sp,sp,16
8040041c:	00008067          	ret

80400420 <mon_backtrace>:
80400420:	ff010113          	addi	sp,sp,-16
80400424:	00112623          	sw	ra,12(sp)
80400428:	f51ff0ef          	jal	ra,80400378 <print_stackframe>
8040042c:	00c12083          	lw	ra,12(sp)
80400430:	00000513          	li	a0,0
80400434:	01010113          	addi	sp,sp,16
80400438:	00008067          	ret

8040043c <kmonitor>:
8040043c:	f9010113          	addi	sp,sp,-112
80400440:	05812423          	sw	s8,72(sp)
80400444:	00050c13          	mv	s8,a0
80400448:	00012517          	auipc	a0,0x12
8040044c:	60850513          	addi	a0,a0,1544 # 80412a50 <commands+0x24>
80400450:	06112623          	sw	ra,108(sp)
80400454:	06812423          	sw	s0,104(sp)
80400458:	06912223          	sw	s1,100(sp)
8040045c:	07212023          	sw	s2,96(sp)
80400460:	05312e23          	sw	s3,92(sp)
80400464:	05412c23          	sw	s4,88(sp)
80400468:	05512a23          	sw	s5,84(sp)
8040046c:	05612823          	sw	s6,80(sp)
80400470:	05712623          	sw	s7,76(sp)
80400474:	05912223          	sw	s9,68(sp)
80400478:	05a12023          	sw	s10,64(sp)
8040047c:	d81ff0ef          	jal	ra,804001fc <cprintf>
80400480:	00012517          	auipc	a0,0x12
80400484:	5f850513          	addi	a0,a0,1528 # 80412a78 <commands+0x4c>
80400488:	d75ff0ef          	jal	ra,804001fc <cprintf>
8040048c:	000c0663          	beqz	s8,80400498 <kmonitor+0x5c>
80400490:	000c0513          	mv	a0,s8
80400494:	3b5000ef          	jal	ra,80401048 <print_trapframe>
80400498:	00000513          	li	a0,0
8040049c:	00000593          	li	a1,0
804004a0:	00000613          	li	a2,0
804004a4:	00800893          	li	a7,8
804004a8:	00000073          	ecall
804004ac:	00012c97          	auipc	s9,0x12
804004b0:	580c8c93          	addi	s9,s9,1408 # 80412a2c <commands>
804004b4:	00012997          	auipc	s3,0x12
804004b8:	5ec98993          	addi	s3,s3,1516 # 80412aa0 <commands+0x74>
804004bc:	00012917          	auipc	s2,0x12
804004c0:	5e890913          	addi	s2,s2,1512 # 80412aa4 <commands+0x78>
804004c4:	00f00a13          	li	s4,15
804004c8:	00012b17          	auipc	s6,0x12
804004cc:	5e4b0b13          	addi	s6,s6,1508 # 80412aac <commands+0x80>
804004d0:	00012a97          	auipc	s5,0x12
804004d4:	634a8a93          	addi	s5,s5,1588 # 80412b04 <commands+0xd8>
804004d8:	00300b93          	li	s7,3
804004dc:	00098513          	mv	a0,s3
804004e0:	b9dff0ef          	jal	ra,8040007c <readline>
804004e4:	00050413          	mv	s0,a0
804004e8:	fe050ae3          	beqz	a0,804004dc <kmonitor+0xa0>
804004ec:	00054583          	lbu	a1,0(a0)
804004f0:	00000493          	li	s1,0
804004f4:	02058063          	beqz	a1,80400514 <kmonitor+0xd8>
804004f8:	00090513          	mv	a0,s2
804004fc:	290120ef          	jal	ra,8041278c <strchr>
80400500:	0a050a63          	beqz	a0,804005b4 <kmonitor+0x178>
80400504:	00144583          	lbu	a1,1(s0)
80400508:	00040023          	sb	zero,0(s0)
8040050c:	00140413          	addi	s0,s0,1
80400510:	fe0594e3          	bnez	a1,804004f8 <kmonitor+0xbc>
80400514:	fc0484e3          	beqz	s1,804004dc <kmonitor+0xa0>
80400518:	00012583          	lw	a1,0(sp)
8040051c:	00012d17          	auipc	s10,0x12
80400520:	510d0d13          	addi	s10,s10,1296 # 80412a2c <commands>
80400524:	000a8513          	mv	a0,s5
80400528:	00000413          	li	s0,0
8040052c:	00cd0d13          	addi	s10,s10,12
80400530:	22c120ef          	jal	ra,8041275c <strcmp>
80400534:	02050063          	beqz	a0,80400554 <kmonitor+0x118>
80400538:	00140413          	addi	s0,s0,1
8040053c:	0d740a63          	beq	s0,s7,80400610 <kmonitor+0x1d4>
80400540:	000d2503          	lw	a0,0(s10)
80400544:	00012583          	lw	a1,0(sp)
80400548:	00cd0d13          	addi	s10,s10,12
8040054c:	210120ef          	jal	ra,8041275c <strcmp>
80400550:	fe0514e3          	bnez	a0,80400538 <kmonitor+0xfc>
80400554:	00141793          	slli	a5,s0,0x1
80400558:	008787b3          	add	a5,a5,s0
8040055c:	00279793          	slli	a5,a5,0x2
80400560:	00fc87b3          	add	a5,s9,a5
80400564:	0087a783          	lw	a5,8(a5)
80400568:	000c0613          	mv	a2,s8
8040056c:	00410593          	addi	a1,sp,4
80400570:	fff48513          	addi	a0,s1,-1
80400574:	000780e7          	jalr	a5
80400578:	f60552e3          	bgez	a0,804004dc <kmonitor+0xa0>
8040057c:	06c12083          	lw	ra,108(sp)
80400580:	06812403          	lw	s0,104(sp)
80400584:	06412483          	lw	s1,100(sp)
80400588:	06012903          	lw	s2,96(sp)
8040058c:	05c12983          	lw	s3,92(sp)
80400590:	05812a03          	lw	s4,88(sp)
80400594:	05412a83          	lw	s5,84(sp)
80400598:	05012b03          	lw	s6,80(sp)
8040059c:	04c12b83          	lw	s7,76(sp)
804005a0:	04812c03          	lw	s8,72(sp)
804005a4:	04412c83          	lw	s9,68(sp)
804005a8:	04012d03          	lw	s10,64(sp)
804005ac:	07010113          	addi	sp,sp,112
804005b0:	00008067          	ret
804005b4:	00044783          	lbu	a5,0(s0)
804005b8:	f4078ee3          	beqz	a5,80400514 <kmonitor+0xd8>
804005bc:	05448263          	beq	s1,s4,80400600 <kmonitor+0x1c4>
804005c0:	00249793          	slli	a5,s1,0x2
804005c4:	04010713          	addi	a4,sp,64
804005c8:	00f707b3          	add	a5,a4,a5
804005cc:	fc87a023          	sw	s0,-64(a5)
804005d0:	00044583          	lbu	a1,0(s0)
804005d4:	00148493          	addi	s1,s1,1
804005d8:	00059a63          	bnez	a1,804005ec <kmonitor+0x1b0>
804005dc:	f3dff06f          	j	80400518 <kmonitor+0xdc>
804005e0:	00140413          	addi	s0,s0,1
804005e4:	00044583          	lbu	a1,0(s0)
804005e8:	f20588e3          	beqz	a1,80400518 <kmonitor+0xdc>
804005ec:	00090513          	mv	a0,s2
804005f0:	19c120ef          	jal	ra,8041278c <strchr>
804005f4:	fe0506e3          	beqz	a0,804005e0 <kmonitor+0x1a4>
804005f8:	00044583          	lbu	a1,0(s0)
804005fc:	ef9ff06f          	j	804004f4 <kmonitor+0xb8>
80400600:	01000593          	li	a1,16
80400604:	000b0513          	mv	a0,s6
80400608:	bf5ff0ef          	jal	ra,804001fc <cprintf>
8040060c:	fb5ff06f          	j	804005c0 <kmonitor+0x184>
80400610:	00012583          	lw	a1,0(sp)
80400614:	00012517          	auipc	a0,0x12
80400618:	4b850513          	addi	a0,a0,1208 # 80412acc <commands+0xa0>
8040061c:	be1ff0ef          	jal	ra,804001fc <cprintf>
80400620:	ebdff06f          	j	804004dc <kmonitor+0xa0>

80400624 <__panic>:
80400624:	0009c317          	auipc	t1,0x9c
80400628:	15c30313          	addi	t1,t1,348 # 8049c780 <is_panic>
8040062c:	00032303          	lw	t1,0(t1)
80400630:	fc010113          	addi	sp,sp,-64
80400634:	00112e23          	sw	ra,28(sp)
80400638:	00812c23          	sw	s0,24(sp)
8040063c:	02d12623          	sw	a3,44(sp)
80400640:	02e12823          	sw	a4,48(sp)
80400644:	02f12a23          	sw	a5,52(sp)
80400648:	03012c23          	sw	a6,56(sp)
8040064c:	03112e23          	sw	a7,60(sp)
80400650:	04031463          	bnez	t1,80400698 <__panic+0x74>
80400654:	00100793          	li	a5,1
80400658:	00060413          	mv	s0,a2
8040065c:	0009c717          	auipc	a4,0x9c
80400660:	12f72223          	sw	a5,292(a4) # 8049c780 <is_panic>
80400664:	00058613          	mv	a2,a1
80400668:	02c10793          	addi	a5,sp,44
8040066c:	00050593          	mv	a1,a0
80400670:	00012517          	auipc	a0,0x12
80400674:	50850513          	addi	a0,a0,1288 # 80412b78 <commands+0x14c>
80400678:	00f12623          	sw	a5,12(sp)
8040067c:	b81ff0ef          	jal	ra,804001fc <cprintf>
80400680:	00c12583          	lw	a1,12(sp)
80400684:	00040513          	mv	a0,s0
80400688:	b39ff0ef          	jal	ra,804001c0 <vcprintf>
8040068c:	00012517          	auipc	a0,0x12
80400690:	45450513          	addi	a0,a0,1108 # 80412ae0 <commands+0xb4>
80400694:	b69ff0ef          	jal	ra,804001fc <cprintf>
80400698:	584000ef          	jal	ra,80400c1c <intr_disable>
8040069c:	00000513          	li	a0,0
804006a0:	d9dff0ef          	jal	ra,8040043c <kmonitor>
804006a4:	ff9ff06f          	j	8040069c <__panic+0x78>

804006a8 <__warn>:
804006a8:	fc010113          	addi	sp,sp,-64
804006ac:	00812c23          	sw	s0,24(sp)
804006b0:	02f12a23          	sw	a5,52(sp)
804006b4:	00060413          	mv	s0,a2
804006b8:	02c10793          	addi	a5,sp,44
804006bc:	00058613          	mv	a2,a1
804006c0:	00050593          	mv	a1,a0
804006c4:	00012517          	auipc	a0,0x12
804006c8:	4d050513          	addi	a0,a0,1232 # 80412b94 <commands+0x168>
804006cc:	00112e23          	sw	ra,28(sp)
804006d0:	02d12623          	sw	a3,44(sp)
804006d4:	02e12823          	sw	a4,48(sp)
804006d8:	03012c23          	sw	a6,56(sp)
804006dc:	03112e23          	sw	a7,60(sp)
804006e0:	00f12623          	sw	a5,12(sp)
804006e4:	b19ff0ef          	jal	ra,804001fc <cprintf>
804006e8:	00c12583          	lw	a1,12(sp)
804006ec:	00040513          	mv	a0,s0
804006f0:	ad1ff0ef          	jal	ra,804001c0 <vcprintf>
804006f4:	00012517          	auipc	a0,0x12
804006f8:	3ec50513          	addi	a0,a0,1004 # 80412ae0 <commands+0xb4>
804006fc:	b01ff0ef          	jal	ra,804001fc <cprintf>
80400700:	01c12083          	lw	ra,28(sp)
80400704:	01812403          	lw	s0,24(sp)
80400708:	04010113          	addi	sp,sp,64
8040070c:	00008067          	ret

80400710 <clock_set_next_event>:
80400710:	c81027f3          	rdtimeh	a5
80400714:	c01025f3          	rdtime	a1
80400718:	c8102773          	rdtimeh	a4
8040071c:	fee79ae3          	bne	a5,a4,80400710 <clock_set_next_event>
80400720:	0009c717          	auipc	a4,0x9c
80400724:	06870713          	addi	a4,a4,104 # 8049c788 <timebase>
80400728:	00072503          	lw	a0,0(a4)
8040072c:	00472703          	lw	a4,4(a4)
80400730:	00000613          	li	a2,0
80400734:	00a58533          	add	a0,a1,a0
80400738:	00b535b3          	sltu	a1,a0,a1
8040073c:	00e787b3          	add	a5,a5,a4
80400740:	00f585b3          	add	a1,a1,a5
80400744:	00000893          	li	a7,0
80400748:	00000073          	ecall
8040074c:	00008067          	ret

80400750 <clock_init>:
80400750:	ff010113          	addi	sp,sp,-16
80400754:	00018637          	lui	a2,0x18
80400758:	00112623          	sw	ra,12(sp)
8040075c:	0009c797          	auipc	a5,0x9c
80400760:	02c78793          	addi	a5,a5,44 # 8049c788 <timebase>
80400764:	6a060613          	addi	a2,a2,1696 # 186a0 <_binary_bin_swap_img_size+0x106a0>
80400768:	00000693          	li	a3,0
8040076c:	00c7a023          	sw	a2,0(a5)
80400770:	00d7a223          	sw	a3,4(a5)
80400774:	f9dff0ef          	jal	ra,80400710 <clock_set_next_event>
80400778:	02000793          	li	a5,32
8040077c:	1047a7f3          	csrrs	a5,sie,a5
80400780:	00c12083          	lw	ra,12(sp)
80400784:	0009c797          	auipc	a5,0x9c
80400788:	0607a423          	sw	zero,104(a5) # 8049c7ec <ticks>
8040078c:	00012517          	auipc	a0,0x12
80400790:	42850513          	addi	a0,a0,1064 # 80412bb4 <commands+0x188>
80400794:	01010113          	addi	sp,sp,16
80400798:	a65ff06f          	j	804001fc <cprintf>

8040079c <serial_putc.part.0>:
8040079c:	00800513          	li	a0,8
804007a0:	00000593          	li	a1,0
804007a4:	00000613          	li	a2,0
804007a8:	00100893          	li	a7,1
804007ac:	00000073          	ecall
804007b0:	02000513          	li	a0,32
804007b4:	00000073          	ecall
804007b8:	00800513          	li	a0,8
804007bc:	00000073          	ecall
804007c0:	00008067          	ret

804007c4 <serial_proc_data>:
804007c4:	00000513          	li	a0,0
804007c8:	00000593          	li	a1,0
804007cc:	00000613          	li	a2,0
804007d0:	00200893          	li	a7,2
804007d4:	00000073          	ecall
804007d8:	00054c63          	bltz	a0,804007f0 <serial_proc_data+0x2c>
804007dc:	07f00793          	li	a5,127
804007e0:	00f50463          	beq	a0,a5,804007e8 <serial_proc_data+0x24>
804007e4:	00008067          	ret
804007e8:	00800513          	li	a0,8
804007ec:	00008067          	ret
804007f0:	fff00513          	li	a0,-1
804007f4:	00008067          	ret

804007f8 <serial_intr>:
804007f8:	ff010113          	addi	sp,sp,-16
804007fc:	00812423          	sw	s0,8(sp)
80400800:	00912223          	sw	s1,4(sp)
80400804:	01212023          	sw	s2,0(sp)
80400808:	00112623          	sw	ra,12(sp)
8040080c:	fff00413          	li	s0,-1
80400810:	00099497          	auipc	s1,0x99
80400814:	c4048493          	addi	s1,s1,-960 # 80499450 <cons>
80400818:	20000913          	li	s2,512
8040081c:	0080006f          	j	80400824 <serial_intr+0x2c>
80400820:	02051263          	bnez	a0,80400844 <serial_intr+0x4c>
80400824:	fa1ff0ef          	jal	ra,804007c4 <serial_proc_data>
80400828:	fe851ce3          	bne	a0,s0,80400820 <serial_intr+0x28>
8040082c:	00c12083          	lw	ra,12(sp)
80400830:	00812403          	lw	s0,8(sp)
80400834:	00412483          	lw	s1,4(sp)
80400838:	00012903          	lw	s2,0(sp)
8040083c:	01010113          	addi	sp,sp,16
80400840:	00008067          	ret
80400844:	2044a783          	lw	a5,516(s1)
80400848:	00178713          	addi	a4,a5,1
8040084c:	00f487b3          	add	a5,s1,a5
80400850:	00099697          	auipc	a3,0x99
80400854:	e0e6a223          	sw	a4,-508(a3) # 80499654 <cons+0x204>
80400858:	00a78023          	sb	a0,0(a5)
8040085c:	fd2714e3          	bne	a4,s2,80400824 <serial_intr+0x2c>
80400860:	00099797          	auipc	a5,0x99
80400864:	de07aa23          	sw	zero,-524(a5) # 80499654 <cons+0x204>
80400868:	fbdff06f          	j	80400824 <serial_intr+0x2c>

8040086c <cons_init>:
8040086c:	00000513          	li	a0,0
80400870:	00000593          	li	a1,0
80400874:	00000613          	li	a2,0
80400878:	00200893          	li	a7,2
8040087c:	00000073          	ecall
80400880:	00008067          	ret

80400884 <cons_putc>:
80400884:	fe010113          	addi	sp,sp,-32
80400888:	00112e23          	sw	ra,28(sp)
8040088c:	00812c23          	sw	s0,24(sp)
80400890:	100027f3          	csrr	a5,sstatus
80400894:	0027f793          	andi	a5,a5,2
80400898:	00000413          	li	s0,0
8040089c:	04079463          	bnez	a5,804008e4 <cons_putc+0x60>
804008a0:	00800793          	li	a5,8
804008a4:	02f50463          	beq	a0,a5,804008cc <cons_putc+0x48>
804008a8:	00000593          	li	a1,0
804008ac:	00000613          	li	a2,0
804008b0:	00100893          	li	a7,1
804008b4:	00000073          	ecall
804008b8:	00041e63          	bnez	s0,804008d4 <cons_putc+0x50>
804008bc:	01c12083          	lw	ra,28(sp)
804008c0:	01812403          	lw	s0,24(sp)
804008c4:	02010113          	addi	sp,sp,32
804008c8:	00008067          	ret
804008cc:	ed1ff0ef          	jal	ra,8040079c <serial_putc.part.0>
804008d0:	fe0406e3          	beqz	s0,804008bc <cons_putc+0x38>
804008d4:	01812403          	lw	s0,24(sp)
804008d8:	01c12083          	lw	ra,28(sp)
804008dc:	02010113          	addi	sp,sp,32
804008e0:	3340006f          	j	80400c14 <intr_enable>
804008e4:	00a12623          	sw	a0,12(sp)
804008e8:	334000ef          	jal	ra,80400c1c <intr_disable>
804008ec:	00100413          	li	s0,1
804008f0:	00c12503          	lw	a0,12(sp)
804008f4:	fadff06f          	j	804008a0 <cons_putc+0x1c>

804008f8 <cons_getc>:
804008f8:	fe010113          	addi	sp,sp,-32
804008fc:	00112e23          	sw	ra,28(sp)
80400900:	100027f3          	csrr	a5,sstatus
80400904:	0027f793          	andi	a5,a5,2
80400908:	04079463          	bnez	a5,80400950 <cons_getc+0x58>
8040090c:	eedff0ef          	jal	ra,804007f8 <serial_intr>
80400910:	00099797          	auipc	a5,0x99
80400914:	b4078793          	addi	a5,a5,-1216 # 80499450 <cons>
80400918:	2007a703          	lw	a4,512(a5)
8040091c:	2047a683          	lw	a3,516(a5)
80400920:	00000513          	li	a0,0
80400924:	02d70063          	beq	a4,a3,80400944 <cons_getc+0x4c>
80400928:	00170693          	addi	a3,a4,1
8040092c:	00e787b3          	add	a5,a5,a4
80400930:	00099717          	auipc	a4,0x99
80400934:	d2d72023          	sw	a3,-736(a4) # 80499650 <cons+0x200>
80400938:	20000713          	li	a4,512
8040093c:	0007c503          	lbu	a0,0(a5)
80400940:	06e68263          	beq	a3,a4,804009a4 <cons_getc+0xac>
80400944:	01c12083          	lw	ra,28(sp)
80400948:	02010113          	addi	sp,sp,32
8040094c:	00008067          	ret
80400950:	2cc000ef          	jal	ra,80400c1c <intr_disable>
80400954:	ea5ff0ef          	jal	ra,804007f8 <serial_intr>
80400958:	00099797          	auipc	a5,0x99
8040095c:	af878793          	addi	a5,a5,-1288 # 80499450 <cons>
80400960:	2007a703          	lw	a4,512(a5)
80400964:	2047a683          	lw	a3,516(a5)
80400968:	00000513          	li	a0,0
8040096c:	02d70063          	beq	a4,a3,8040098c <cons_getc+0x94>
80400970:	00170693          	addi	a3,a4,1
80400974:	00e787b3          	add	a5,a5,a4
80400978:	00099717          	auipc	a4,0x99
8040097c:	ccd72c23          	sw	a3,-808(a4) # 80499650 <cons+0x200>
80400980:	20000713          	li	a4,512
80400984:	0007c503          	lbu	a0,0(a5)
80400988:	02e68863          	beq	a3,a4,804009b8 <cons_getc+0xc0>
8040098c:	00a12623          	sw	a0,12(sp)
80400990:	284000ef          	jal	ra,80400c14 <intr_enable>
80400994:	01c12083          	lw	ra,28(sp)
80400998:	00c12503          	lw	a0,12(sp)
8040099c:	02010113          	addi	sp,sp,32
804009a0:	00008067          	ret
804009a4:	01c12083          	lw	ra,28(sp)
804009a8:	00099797          	auipc	a5,0x99
804009ac:	ca07a423          	sw	zero,-856(a5) # 80499650 <cons+0x200>
804009b0:	02010113          	addi	sp,sp,32
804009b4:	00008067          	ret
804009b8:	00099797          	auipc	a5,0x99
804009bc:	c807ac23          	sw	zero,-872(a5) # 80499650 <cons+0x200>
804009c0:	fcdff06f          	j	8040098c <cons_getc+0x94>

804009c4 <ide_init>:
804009c4:	ff010113          	addi	sp,sp,-16
804009c8:	00099597          	auipc	a1,0x99
804009cc:	ccc58593          	addi	a1,a1,-820 # 80499694 <ide_devices+0x3c>
804009d0:	00100513          	li	a0,1
804009d4:	00812423          	sw	s0,8(sp)
804009d8:	00099797          	auipc	a5,0x99
804009dc:	c807a023          	sw	zero,-896(a5) # 80499658 <ide_devices>
804009e0:	00099797          	auipc	a5,0x99
804009e4:	ca07aa23          	sw	zero,-844(a5) # 80499694 <ide_devices+0x3c>
804009e8:	00099797          	auipc	a5,0x99
804009ec:	ce07a423          	sw	zero,-792(a5) # 804996d0 <ide_devices+0x78>
804009f0:	00099797          	auipc	a5,0x99
804009f4:	d007ae23          	sw	zero,-740(a5) # 8049970c <ide_devices+0xb4>
804009f8:	00112623          	sw	ra,12(sp)
804009fc:	00099417          	auipc	s0,0x99
80400a00:	c5c40413          	addi	s0,s0,-932 # 80499658 <ide_devices>
80400a04:	2fc000ef          	jal	ra,80400d00 <ramdisk_init>
80400a08:	03c42783          	lw	a5,60(s0)
80400a0c:	02078663          	beqz	a5,80400a38 <ide_init+0x74>
80400a10:	00099597          	auipc	a1,0x99
80400a14:	cc058593          	addi	a1,a1,-832 # 804996d0 <ide_devices+0x78>
80400a18:	00200513          	li	a0,2
80400a1c:	2e4000ef          	jal	ra,80400d00 <ramdisk_init>
80400a20:	07842783          	lw	a5,120(s0)
80400a24:	02078a63          	beqz	a5,80400a58 <ide_init+0x94>
80400a28:	00c12083          	lw	ra,12(sp)
80400a2c:	00812403          	lw	s0,8(sp)
80400a30:	01010113          	addi	sp,sp,16
80400a34:	00008067          	ret
80400a38:	00012697          	auipc	a3,0x12
80400a3c:	19868693          	addi	a3,a3,408 # 80412bd0 <commands+0x1a4>
80400a40:	00012617          	auipc	a2,0x12
80400a44:	1a860613          	addi	a2,a2,424 # 80412be8 <commands+0x1bc>
80400a48:	01100593          	li	a1,17
80400a4c:	00012517          	auipc	a0,0x12
80400a50:	1b450513          	addi	a0,a0,436 # 80412c00 <commands+0x1d4>
80400a54:	bd1ff0ef          	jal	ra,80400624 <__panic>
80400a58:	00012697          	auipc	a3,0x12
80400a5c:	1bc68693          	addi	a3,a3,444 # 80412c14 <commands+0x1e8>
80400a60:	00012617          	auipc	a2,0x12
80400a64:	18860613          	addi	a2,a2,392 # 80412be8 <commands+0x1bc>
80400a68:	01400593          	li	a1,20
80400a6c:	00012517          	auipc	a0,0x12
80400a70:	19450513          	addi	a0,a0,404 # 80412c00 <commands+0x1d4>
80400a74:	bb1ff0ef          	jal	ra,80400624 <__panic>

80400a78 <ide_device_valid>:
80400a78:	00300793          	li	a5,3
80400a7c:	02a7e463          	bltu	a5,a0,80400aa4 <ide_device_valid+0x2c>
80400a80:	00451793          	slli	a5,a0,0x4
80400a84:	40a787b3          	sub	a5,a5,a0
80400a88:	00279793          	slli	a5,a5,0x2
80400a8c:	00099517          	auipc	a0,0x99
80400a90:	bcc50513          	addi	a0,a0,-1076 # 80499658 <ide_devices>
80400a94:	00f507b3          	add	a5,a0,a5
80400a98:	0007a503          	lw	a0,0(a5)
80400a9c:	00a03533          	snez	a0,a0
80400aa0:	00008067          	ret
80400aa4:	00000513          	li	a0,0
80400aa8:	00008067          	ret

80400aac <ide_device_size>:
80400aac:	00300793          	li	a5,3
80400ab0:	02a7e663          	bltu	a5,a0,80400adc <ide_device_size+0x30>
80400ab4:	00451793          	slli	a5,a0,0x4
80400ab8:	40a787b3          	sub	a5,a5,a0
80400abc:	00279793          	slli	a5,a5,0x2
80400ac0:	00099517          	auipc	a0,0x99
80400ac4:	b9850513          	addi	a0,a0,-1128 # 80499658 <ide_devices>
80400ac8:	00f507b3          	add	a5,a0,a5
80400acc:	0007a503          	lw	a0,0(a5)
80400ad0:	00050863          	beqz	a0,80400ae0 <ide_device_size+0x34>
80400ad4:	0087a503          	lw	a0,8(a5)
80400ad8:	00008067          	ret
80400adc:	00000513          	li	a0,0
80400ae0:	00008067          	ret

80400ae4 <ide_read_secs>:
80400ae4:	ff010113          	addi	sp,sp,-16
80400ae8:	00112623          	sw	ra,12(sp)
80400aec:	08000793          	li	a5,128
80400af0:	04d7e663          	bltu	a5,a3,80400b3c <ide_read_secs+0x58>
80400af4:	00300793          	li	a5,3
80400af8:	04a7e263          	bltu	a5,a0,80400b3c <ide_read_secs+0x58>
80400afc:	00451793          	slli	a5,a0,0x4
80400b00:	40a78533          	sub	a0,a5,a0
80400b04:	00251513          	slli	a0,a0,0x2
80400b08:	00099797          	auipc	a5,0x99
80400b0c:	b5078793          	addi	a5,a5,-1200 # 80499658 <ide_devices>
80400b10:	00a78533          	add	a0,a5,a0
80400b14:	00052783          	lw	a5,0(a0)
80400b18:	02078263          	beqz	a5,80400b3c <ide_read_secs+0x58>
80400b1c:	100007b7          	lui	a5,0x10000
80400b20:	02f5fe63          	bgeu	a1,a5,80400b5c <ide_read_secs+0x78>
80400b24:	00b68733          	add	a4,a3,a1
80400b28:	02e7ea63          	bltu	a5,a4,80400b5c <ide_read_secs+0x78>
80400b2c:	00c12083          	lw	ra,12(sp)
80400b30:	03452303          	lw	t1,52(a0)
80400b34:	01010113          	addi	sp,sp,16
80400b38:	00030067          	jr	t1
80400b3c:	00012697          	auipc	a3,0x12
80400b40:	0f068693          	addi	a3,a3,240 # 80412c2c <commands+0x200>
80400b44:	00012617          	auipc	a2,0x12
80400b48:	0a460613          	addi	a2,a2,164 # 80412be8 <commands+0x1bc>
80400b4c:	02200593          	li	a1,34
80400b50:	00012517          	auipc	a0,0x12
80400b54:	0b050513          	addi	a0,a0,176 # 80412c00 <commands+0x1d4>
80400b58:	acdff0ef          	jal	ra,80400624 <__panic>
80400b5c:	00012697          	auipc	a3,0x12
80400b60:	0f868693          	addi	a3,a3,248 # 80412c54 <commands+0x228>
80400b64:	00012617          	auipc	a2,0x12
80400b68:	08460613          	addi	a2,a2,132 # 80412be8 <commands+0x1bc>
80400b6c:	02300593          	li	a1,35
80400b70:	00012517          	auipc	a0,0x12
80400b74:	09050513          	addi	a0,a0,144 # 80412c00 <commands+0x1d4>
80400b78:	aadff0ef          	jal	ra,80400624 <__panic>

80400b7c <ide_write_secs>:
80400b7c:	ff010113          	addi	sp,sp,-16
80400b80:	00112623          	sw	ra,12(sp)
80400b84:	08000793          	li	a5,128
80400b88:	04d7e663          	bltu	a5,a3,80400bd4 <ide_write_secs+0x58>
80400b8c:	00300793          	li	a5,3
80400b90:	04a7e263          	bltu	a5,a0,80400bd4 <ide_write_secs+0x58>
80400b94:	00451793          	slli	a5,a0,0x4
80400b98:	40a78533          	sub	a0,a5,a0
80400b9c:	00251513          	slli	a0,a0,0x2
80400ba0:	00099797          	auipc	a5,0x99
80400ba4:	ab878793          	addi	a5,a5,-1352 # 80499658 <ide_devices>
80400ba8:	00a78533          	add	a0,a5,a0
80400bac:	00052783          	lw	a5,0(a0)
80400bb0:	02078263          	beqz	a5,80400bd4 <ide_write_secs+0x58>
80400bb4:	100007b7          	lui	a5,0x10000
80400bb8:	02f5fe63          	bgeu	a1,a5,80400bf4 <ide_write_secs+0x78>
80400bbc:	00b68733          	add	a4,a3,a1
80400bc0:	02e7ea63          	bltu	a5,a4,80400bf4 <ide_write_secs+0x78>
80400bc4:	00c12083          	lw	ra,12(sp)
80400bc8:	03852303          	lw	t1,56(a0)
80400bcc:	01010113          	addi	sp,sp,16
80400bd0:	00030067          	jr	t1
80400bd4:	00012697          	auipc	a3,0x12
80400bd8:	05868693          	addi	a3,a3,88 # 80412c2c <commands+0x200>
80400bdc:	00012617          	auipc	a2,0x12
80400be0:	00c60613          	addi	a2,a2,12 # 80412be8 <commands+0x1bc>
80400be4:	02900593          	li	a1,41
80400be8:	00012517          	auipc	a0,0x12
80400bec:	01850513          	addi	a0,a0,24 # 80412c00 <commands+0x1d4>
80400bf0:	a35ff0ef          	jal	ra,80400624 <__panic>
80400bf4:	00012697          	auipc	a3,0x12
80400bf8:	06068693          	addi	a3,a3,96 # 80412c54 <commands+0x228>
80400bfc:	00012617          	auipc	a2,0x12
80400c00:	fec60613          	addi	a2,a2,-20 # 80412be8 <commands+0x1bc>
80400c04:	02a00593          	li	a1,42
80400c08:	00012517          	auipc	a0,0x12
80400c0c:	ff850513          	addi	a0,a0,-8 # 80412c00 <commands+0x1d4>
80400c10:	a15ff0ef          	jal	ra,80400624 <__panic>

80400c14 <intr_enable>:
80400c14:	100167f3          	csrrsi	a5,sstatus,2
80400c18:	00008067          	ret

80400c1c <intr_disable>:
80400c1c:	100177f3          	csrrci	a5,sstatus,2
80400c20:	00008067          	ret

80400c24 <pic_init>:
80400c24:	00008067          	ret

80400c28 <ramdisk_write>:
80400c28:	00852783          	lw	a5,8(a0)
80400c2c:	ff010113          	addi	sp,sp,-16
80400c30:	00112623          	sw	ra,12(sp)
80400c34:	40b787b3          	sub	a5,a5,a1
80400c38:	00058713          	mv	a4,a1
80400c3c:	00060593          	mv	a1,a2
80400c40:	00f6f463          	bgeu	a3,a5,80400c48 <ramdisk_write+0x20>
80400c44:	00068793          	mv	a5,a3
80400c48:	00c52503          	lw	a0,12(a0)
80400c4c:	00971713          	slli	a4,a4,0x9
80400c50:	00979613          	slli	a2,a5,0x9
80400c54:	00a70533          	add	a0,a4,a0
80400c58:	3d1110ef          	jal	ra,80412828 <memcpy>
80400c5c:	00c12083          	lw	ra,12(sp)
80400c60:	00000513          	li	a0,0
80400c64:	01010113          	addi	sp,sp,16
80400c68:	00008067          	ret

80400c6c <ramdisk_read>:
80400c6c:	00852783          	lw	a5,8(a0)
80400c70:	ff010113          	addi	sp,sp,-16
80400c74:	00112623          	sw	ra,12(sp)
80400c78:	40b787b3          	sub	a5,a5,a1
80400c7c:	00050713          	mv	a4,a0
80400c80:	00060513          	mv	a0,a2
80400c84:	00f6f463          	bgeu	a3,a5,80400c8c <ramdisk_read+0x20>
80400c88:	00068793          	mv	a5,a3
80400c8c:	00c72703          	lw	a4,12(a4)
80400c90:	00959593          	slli	a1,a1,0x9
80400c94:	00979613          	slli	a2,a5,0x9
80400c98:	00e585b3          	add	a1,a1,a4
80400c9c:	38d110ef          	jal	ra,80412828 <memcpy>
80400ca0:	00c12083          	lw	ra,12(sp)
80400ca4:	00000513          	li	a0,0
80400ca8:	01010113          	addi	sp,sp,16
80400cac:	00008067          	ret

80400cb0 <check_initrd>:
80400cb0:	ff010113          	addi	sp,sp,-16
80400cb4:	00112623          	sw	ra,12(sp)
80400cb8:	02b50663          	beq	a0,a1,80400ce4 <check_initrd+0x34>
80400cbc:	40a586b3          	sub	a3,a1,a0
80400cc0:	fff58613          	addi	a2,a1,-1
80400cc4:	00050593          	mv	a1,a0
80400cc8:	00012517          	auipc	a0,0x12
80400ccc:	fe050513          	addi	a0,a0,-32 # 80412ca8 <commands+0x27c>
80400cd0:	d2cff0ef          	jal	ra,804001fc <cprintf>
80400cd4:	00c12083          	lw	ra,12(sp)
80400cd8:	00100513          	li	a0,1
80400cdc:	01010113          	addi	sp,sp,16
80400ce0:	00008067          	ret
80400ce4:	00012517          	auipc	a0,0x12
80400ce8:	fac50513          	addi	a0,a0,-84 # 80412c90 <commands+0x264>
80400cec:	d10ff0ef          	jal	ra,804001fc <cprintf>
80400cf0:	00c12083          	lw	ra,12(sp)
80400cf4:	00000513          	li	a0,0
80400cf8:	01010113          	addi	sp,sp,16
80400cfc:	00008067          	ret

80400d00 <ramdisk_init>:
80400d00:	fe010113          	addi	sp,sp,-32
80400d04:	00812c23          	sw	s0,24(sp)
80400d08:	00058413          	mv	s0,a1
80400d0c:	01212823          	sw	s2,16(sp)
80400d10:	03c00613          	li	a2,60
80400d14:	00050913          	mv	s2,a0
80400d18:	00000593          	li	a1,0
80400d1c:	00040513          	mv	a0,s0
80400d20:	00112e23          	sw	ra,28(sp)
80400d24:	00912a23          	sw	s1,20(sp)
80400d28:	01312623          	sw	s3,12(sp)
80400d2c:	28d110ef          	jal	ra,804127b8 <memset>
80400d30:	00100793          	li	a5,1
80400d34:	0af90663          	beq	s2,a5,80400de0 <ramdisk_init+0xe0>
80400d38:	00200793          	li	a5,2
80400d3c:	00098497          	auipc	s1,0x98
80400d40:	2c448493          	addi	s1,s1,708 # 80499000 <swap_manager_fifo>
80400d44:	00020997          	auipc	s3,0x20
80400d48:	2bc98993          	addi	s3,s3,700 # 80421000 <_binary_bin_sfs_img_start>
80400d4c:	0af91463          	bne	s2,a5,80400df4 <ramdisk_init+0xf4>
80400d50:	00048593          	mv	a1,s1
80400d54:	00098513          	mv	a0,s3
80400d58:	f59ff0ef          	jal	ra,80400cb0 <check_initrd>
80400d5c:	02051063          	bnez	a0,80400d7c <ramdisk_init+0x7c>
80400d60:	01c12083          	lw	ra,28(sp)
80400d64:	01812403          	lw	s0,24(sp)
80400d68:	01412483          	lw	s1,20(sp)
80400d6c:	01012903          	lw	s2,16(sp)
80400d70:	00c12983          	lw	s3,12(sp)
80400d74:	02010113          	addi	sp,sp,32
80400d78:	00008067          	ret
80400d7c:	413484b3          	sub	s1,s1,s3
80400d80:	00100793          	li	a5,1
80400d84:	00f42023          	sw	a5,0(s0)
80400d88:	0094d493          	srli	s1,s1,0x9
80400d8c:	fff00793          	li	a5,-1
80400d90:	00f42223          	sw	a5,4(s0)
80400d94:	00942423          	sw	s1,8(s0)
80400d98:	01342623          	sw	s3,12(s0)
80400d9c:	01440513          	addi	a0,s0,20
80400da0:	00012597          	auipc	a1,0x12
80400da4:	f5c58593          	addi	a1,a1,-164 # 80412cfc <commands+0x2d0>
80400da8:	199110ef          	jal	ra,80412740 <strcpy>
80400dac:	00000797          	auipc	a5,0x0
80400db0:	ec078793          	addi	a5,a5,-320 # 80400c6c <ramdisk_read>
80400db4:	02f42a23          	sw	a5,52(s0)
80400db8:	00000797          	auipc	a5,0x0
80400dbc:	e7078793          	addi	a5,a5,-400 # 80400c28 <ramdisk_write>
80400dc0:	02f42c23          	sw	a5,56(s0)
80400dc4:	01c12083          	lw	ra,28(sp)
80400dc8:	01812403          	lw	s0,24(sp)
80400dcc:	01412483          	lw	s1,20(sp)
80400dd0:	01012903          	lw	s2,16(sp)
80400dd4:	00c12983          	lw	s3,12(sp)
80400dd8:	02010113          	addi	sp,sp,32
80400ddc:	00008067          	ret
80400de0:	00020497          	auipc	s1,0x20
80400de4:	22048493          	addi	s1,s1,544 # 80421000 <_binary_bin_sfs_img_start>
80400de8:	00018997          	auipc	s3,0x18
80400dec:	21898993          	addi	s3,s3,536 # 80419000 <_binary_bin_swap_img_start>
80400df0:	f61ff06f          	j	80400d50 <ramdisk_init+0x50>
80400df4:	00012617          	auipc	a2,0x12
80400df8:	edc60613          	addi	a2,a2,-292 # 80412cd0 <commands+0x2a4>
80400dfc:	03200593          	li	a1,50
80400e00:	00012517          	auipc	a0,0x12
80400e04:	ee450513          	addi	a0,a0,-284 # 80412ce4 <commands+0x2b8>
80400e08:	81dff0ef          	jal	ra,80400624 <__panic>

80400e0c <idt_init>:
80400e0c:	14005073          	csrwi	sscratch,0
80400e10:	00001797          	auipc	a5,0x1
80400e14:	88478793          	addi	a5,a5,-1916 # 80401694 <__alltraps>
80400e18:	10579073          	csrw	stvec,a5
80400e1c:	000407b7          	lui	a5,0x40
80400e20:	1007a7f3          	csrrs	a5,sstatus,a5
80400e24:	104167f3          	csrrsi	a5,sie,2
80400e28:	00008067          	ret

80400e2c <print_regs>:
80400e2c:	00052583          	lw	a1,0(a0)
80400e30:	ff010113          	addi	sp,sp,-16
80400e34:	00812423          	sw	s0,8(sp)
80400e38:	00050413          	mv	s0,a0
80400e3c:	00012517          	auipc	a0,0x12
80400e40:	2a450513          	addi	a0,a0,676 # 804130e0 <commands+0x6b4>
80400e44:	00112623          	sw	ra,12(sp)
80400e48:	bb4ff0ef          	jal	ra,804001fc <cprintf>
80400e4c:	00442583          	lw	a1,4(s0)
80400e50:	00012517          	auipc	a0,0x12
80400e54:	2a450513          	addi	a0,a0,676 # 804130f4 <commands+0x6c8>
80400e58:	ba4ff0ef          	jal	ra,804001fc <cprintf>
80400e5c:	00842583          	lw	a1,8(s0)
80400e60:	00012517          	auipc	a0,0x12
80400e64:	2a850513          	addi	a0,a0,680 # 80413108 <commands+0x6dc>
80400e68:	b94ff0ef          	jal	ra,804001fc <cprintf>
80400e6c:	00c42583          	lw	a1,12(s0)
80400e70:	00012517          	auipc	a0,0x12
80400e74:	2ac50513          	addi	a0,a0,684 # 8041311c <commands+0x6f0>
80400e78:	b84ff0ef          	jal	ra,804001fc <cprintf>
80400e7c:	01042583          	lw	a1,16(s0)
80400e80:	00012517          	auipc	a0,0x12
80400e84:	2b050513          	addi	a0,a0,688 # 80413130 <commands+0x704>
80400e88:	b74ff0ef          	jal	ra,804001fc <cprintf>
80400e8c:	01442583          	lw	a1,20(s0)
80400e90:	00012517          	auipc	a0,0x12
80400e94:	2b450513          	addi	a0,a0,692 # 80413144 <commands+0x718>
80400e98:	b64ff0ef          	jal	ra,804001fc <cprintf>
80400e9c:	01842583          	lw	a1,24(s0)
80400ea0:	00012517          	auipc	a0,0x12
80400ea4:	2b850513          	addi	a0,a0,696 # 80413158 <commands+0x72c>
80400ea8:	b54ff0ef          	jal	ra,804001fc <cprintf>
80400eac:	01c42583          	lw	a1,28(s0)
80400eb0:	00012517          	auipc	a0,0x12
80400eb4:	2bc50513          	addi	a0,a0,700 # 8041316c <commands+0x740>
80400eb8:	b44ff0ef          	jal	ra,804001fc <cprintf>
80400ebc:	02042583          	lw	a1,32(s0)
80400ec0:	00012517          	auipc	a0,0x12
80400ec4:	2c050513          	addi	a0,a0,704 # 80413180 <commands+0x754>
80400ec8:	b34ff0ef          	jal	ra,804001fc <cprintf>
80400ecc:	02442583          	lw	a1,36(s0)
80400ed0:	00012517          	auipc	a0,0x12
80400ed4:	2c450513          	addi	a0,a0,708 # 80413194 <commands+0x768>
80400ed8:	b24ff0ef          	jal	ra,804001fc <cprintf>
80400edc:	02842583          	lw	a1,40(s0)
80400ee0:	00012517          	auipc	a0,0x12
80400ee4:	2c850513          	addi	a0,a0,712 # 804131a8 <commands+0x77c>
80400ee8:	b14ff0ef          	jal	ra,804001fc <cprintf>
80400eec:	02c42583          	lw	a1,44(s0)
80400ef0:	00012517          	auipc	a0,0x12
80400ef4:	2cc50513          	addi	a0,a0,716 # 804131bc <commands+0x790>
80400ef8:	b04ff0ef          	jal	ra,804001fc <cprintf>
80400efc:	03042583          	lw	a1,48(s0)
80400f00:	00012517          	auipc	a0,0x12
80400f04:	2d050513          	addi	a0,a0,720 # 804131d0 <commands+0x7a4>
80400f08:	af4ff0ef          	jal	ra,804001fc <cprintf>
80400f0c:	03442583          	lw	a1,52(s0)
80400f10:	00012517          	auipc	a0,0x12
80400f14:	2d450513          	addi	a0,a0,724 # 804131e4 <commands+0x7b8>
80400f18:	ae4ff0ef          	jal	ra,804001fc <cprintf>
80400f1c:	03842583          	lw	a1,56(s0)
80400f20:	00012517          	auipc	a0,0x12
80400f24:	2d850513          	addi	a0,a0,728 # 804131f8 <commands+0x7cc>
80400f28:	ad4ff0ef          	jal	ra,804001fc <cprintf>
80400f2c:	03c42583          	lw	a1,60(s0)
80400f30:	00012517          	auipc	a0,0x12
80400f34:	2dc50513          	addi	a0,a0,732 # 8041320c <commands+0x7e0>
80400f38:	ac4ff0ef          	jal	ra,804001fc <cprintf>
80400f3c:	04042583          	lw	a1,64(s0)
80400f40:	00012517          	auipc	a0,0x12
80400f44:	2e050513          	addi	a0,a0,736 # 80413220 <commands+0x7f4>
80400f48:	ab4ff0ef          	jal	ra,804001fc <cprintf>
80400f4c:	04442583          	lw	a1,68(s0)
80400f50:	00012517          	auipc	a0,0x12
80400f54:	2e450513          	addi	a0,a0,740 # 80413234 <commands+0x808>
80400f58:	aa4ff0ef          	jal	ra,804001fc <cprintf>
80400f5c:	04842583          	lw	a1,72(s0)
80400f60:	00012517          	auipc	a0,0x12
80400f64:	2e850513          	addi	a0,a0,744 # 80413248 <commands+0x81c>
80400f68:	a94ff0ef          	jal	ra,804001fc <cprintf>
80400f6c:	04c42583          	lw	a1,76(s0)
80400f70:	00012517          	auipc	a0,0x12
80400f74:	2ec50513          	addi	a0,a0,748 # 8041325c <commands+0x830>
80400f78:	a84ff0ef          	jal	ra,804001fc <cprintf>
80400f7c:	05042583          	lw	a1,80(s0)
80400f80:	00012517          	auipc	a0,0x12
80400f84:	2f050513          	addi	a0,a0,752 # 80413270 <commands+0x844>
80400f88:	a74ff0ef          	jal	ra,804001fc <cprintf>
80400f8c:	05442583          	lw	a1,84(s0)
80400f90:	00012517          	auipc	a0,0x12
80400f94:	2f450513          	addi	a0,a0,756 # 80413284 <commands+0x858>
80400f98:	a64ff0ef          	jal	ra,804001fc <cprintf>
80400f9c:	05842583          	lw	a1,88(s0)
80400fa0:	00012517          	auipc	a0,0x12
80400fa4:	2f850513          	addi	a0,a0,760 # 80413298 <commands+0x86c>
80400fa8:	a54ff0ef          	jal	ra,804001fc <cprintf>
80400fac:	05c42583          	lw	a1,92(s0)
80400fb0:	00012517          	auipc	a0,0x12
80400fb4:	2fc50513          	addi	a0,a0,764 # 804132ac <commands+0x880>
80400fb8:	a44ff0ef          	jal	ra,804001fc <cprintf>
80400fbc:	06042583          	lw	a1,96(s0)
80400fc0:	00012517          	auipc	a0,0x12
80400fc4:	30050513          	addi	a0,a0,768 # 804132c0 <commands+0x894>
80400fc8:	a34ff0ef          	jal	ra,804001fc <cprintf>
80400fcc:	06442583          	lw	a1,100(s0)
80400fd0:	00012517          	auipc	a0,0x12
80400fd4:	30450513          	addi	a0,a0,772 # 804132d4 <commands+0x8a8>
80400fd8:	a24ff0ef          	jal	ra,804001fc <cprintf>
80400fdc:	06842583          	lw	a1,104(s0)
80400fe0:	00012517          	auipc	a0,0x12
80400fe4:	30850513          	addi	a0,a0,776 # 804132e8 <commands+0x8bc>
80400fe8:	a14ff0ef          	jal	ra,804001fc <cprintf>
80400fec:	06c42583          	lw	a1,108(s0)
80400ff0:	00012517          	auipc	a0,0x12
80400ff4:	30c50513          	addi	a0,a0,780 # 804132fc <commands+0x8d0>
80400ff8:	a04ff0ef          	jal	ra,804001fc <cprintf>
80400ffc:	07042583          	lw	a1,112(s0)
80401000:	00012517          	auipc	a0,0x12
80401004:	31050513          	addi	a0,a0,784 # 80413310 <commands+0x8e4>
80401008:	9f4ff0ef          	jal	ra,804001fc <cprintf>
8040100c:	07442583          	lw	a1,116(s0)
80401010:	00012517          	auipc	a0,0x12
80401014:	31450513          	addi	a0,a0,788 # 80413324 <commands+0x8f8>
80401018:	9e4ff0ef          	jal	ra,804001fc <cprintf>
8040101c:	07842583          	lw	a1,120(s0)
80401020:	00012517          	auipc	a0,0x12
80401024:	31850513          	addi	a0,a0,792 # 80413338 <commands+0x90c>
80401028:	9d4ff0ef          	jal	ra,804001fc <cprintf>
8040102c:	07c42583          	lw	a1,124(s0)
80401030:	00812403          	lw	s0,8(sp)
80401034:	00c12083          	lw	ra,12(sp)
80401038:	00012517          	auipc	a0,0x12
8040103c:	31450513          	addi	a0,a0,788 # 8041334c <commands+0x920>
80401040:	01010113          	addi	sp,sp,16
80401044:	9b8ff06f          	j	804001fc <cprintf>

80401048 <print_trapframe>:
80401048:	ff010113          	addi	sp,sp,-16
8040104c:	00812423          	sw	s0,8(sp)
80401050:	00050593          	mv	a1,a0
80401054:	00050413          	mv	s0,a0
80401058:	00012517          	auipc	a0,0x12
8040105c:	30850513          	addi	a0,a0,776 # 80413360 <commands+0x934>
80401060:	00112623          	sw	ra,12(sp)
80401064:	998ff0ef          	jal	ra,804001fc <cprintf>
80401068:	00040513          	mv	a0,s0
8040106c:	dc1ff0ef          	jal	ra,80400e2c <print_regs>
80401070:	08042583          	lw	a1,128(s0)
80401074:	00012517          	auipc	a0,0x12
80401078:	30050513          	addi	a0,a0,768 # 80413374 <commands+0x948>
8040107c:	980ff0ef          	jal	ra,804001fc <cprintf>
80401080:	08442583          	lw	a1,132(s0)
80401084:	00012517          	auipc	a0,0x12
80401088:	30450513          	addi	a0,a0,772 # 80413388 <commands+0x95c>
8040108c:	970ff0ef          	jal	ra,804001fc <cprintf>
80401090:	08842583          	lw	a1,136(s0)
80401094:	00012517          	auipc	a0,0x12
80401098:	30850513          	addi	a0,a0,776 # 8041339c <commands+0x970>
8040109c:	960ff0ef          	jal	ra,804001fc <cprintf>
804010a0:	08c42583          	lw	a1,140(s0)
804010a4:	00812403          	lw	s0,8(sp)
804010a8:	00c12083          	lw	ra,12(sp)
804010ac:	00012517          	auipc	a0,0x12
804010b0:	30450513          	addi	a0,a0,772 # 804133b0 <commands+0x984>
804010b4:	01010113          	addi	sp,sp,16
804010b8:	944ff06f          	j	804001fc <cprintf>

804010bc <pgfault_handler>:
804010bc:	ff010113          	addi	sp,sp,-16
804010c0:	00912223          	sw	s1,4(sp)
804010c4:	0009b497          	auipc	s1,0x9b
804010c8:	7ec48493          	addi	s1,s1,2028 # 8049c8b0 <check_mm_struct>
804010cc:	0004a783          	lw	a5,0(s1)
804010d0:	00812423          	sw	s0,8(sp)
804010d4:	00112623          	sw	ra,12(sp)
804010d8:	00050413          	mv	s0,a0
804010dc:	06078a63          	beqz	a5,80401150 <pgfault_handler+0x94>
804010e0:	08852583          	lw	a1,136(a0)
804010e4:	00012517          	auipc	a0,0x12
804010e8:	f9050513          	addi	a0,a0,-112 # 80413074 <commands+0x648>
804010ec:	910ff0ef          	jal	ra,804001fc <cprintf>
804010f0:	08c42583          	lw	a1,140(s0)
804010f4:	00d00793          	li	a5,13
804010f8:	08f58463          	beq	a1,a5,80401180 <pgfault_handler+0xc4>
804010fc:	00f00793          	li	a5,15
80401100:	08f58863          	beq	a1,a5,80401190 <pgfault_handler+0xd4>
80401104:	00012517          	auipc	a0,0x12
80401108:	f9450513          	addi	a0,a0,-108 # 80413098 <commands+0x66c>
8040110c:	8f0ff0ef          	jal	ra,804001fc <cprintf>
80401110:	0004a503          	lw	a0,0(s1)
80401114:	0009b797          	auipc	a5,0x9b
80401118:	69878793          	addi	a5,a5,1688 # 8049c7ac <current>
8040111c:	0007a703          	lw	a4,0(a5)
80401120:	02050c63          	beqz	a0,80401158 <pgfault_handler+0x9c>
80401124:	0009b797          	auipc	a5,0x9b
80401128:	68c78793          	addi	a5,a5,1676 # 8049c7b0 <idleproc>
8040112c:	0007a783          	lw	a5,0(a5)
80401130:	06e79863          	bne	a5,a4,804011a0 <pgfault_handler+0xe4>
80401134:	08842603          	lw	a2,136(s0)
80401138:	08c42583          	lw	a1,140(s0)
8040113c:	00812403          	lw	s0,8(sp)
80401140:	00c12083          	lw	ra,12(sp)
80401144:	00412483          	lw	s1,4(sp)
80401148:	01010113          	addi	sp,sp,16
8040114c:	1910306f          	j	80404adc <do_pgfault>
80401150:	0009b797          	auipc	a5,0x9b
80401154:	65c78793          	addi	a5,a5,1628 # 8049c7ac <current>
80401158:	0007a783          	lw	a5,0(a5)
8040115c:	06078263          	beqz	a5,804011c0 <pgfault_handler+0x104>
80401160:	08842603          	lw	a2,136(s0)
80401164:	08c42583          	lw	a1,140(s0)
80401168:	00812403          	lw	s0,8(sp)
8040116c:	00c12083          	lw	ra,12(sp)
80401170:	00412483          	lw	s1,4(sp)
80401174:	0187a503          	lw	a0,24(a5)
80401178:	01010113          	addi	sp,sp,16
8040117c:	1610306f          	j	80404adc <do_pgfault>
80401180:	00012517          	auipc	a0,0x12
80401184:	f1050513          	addi	a0,a0,-240 # 80413090 <commands+0x664>
80401188:	874ff0ef          	jal	ra,804001fc <cprintf>
8040118c:	f85ff06f          	j	80401110 <pgfault_handler+0x54>
80401190:	00012517          	auipc	a0,0x12
80401194:	f0450513          	addi	a0,a0,-252 # 80413094 <commands+0x668>
80401198:	864ff0ef          	jal	ra,804001fc <cprintf>
8040119c:	f75ff06f          	j	80401110 <pgfault_handler+0x54>
804011a0:	00012697          	auipc	a3,0x12
804011a4:	f0068693          	addi	a3,a3,-256 # 804130a0 <commands+0x674>
804011a8:	00012617          	auipc	a2,0x12
804011ac:	a4060613          	addi	a2,a2,-1472 # 80412be8 <commands+0x1bc>
804011b0:	08700593          	li	a1,135
804011b4:	00012517          	auipc	a0,0x12
804011b8:	f0050513          	addi	a0,a0,-256 # 804130b4 <commands+0x688>
804011bc:	c68ff0ef          	jal	ra,80400624 <__panic>
804011c0:	00040513          	mv	a0,s0
804011c4:	e85ff0ef          	jal	ra,80401048 <print_trapframe>
804011c8:	08842583          	lw	a1,136(s0)
804011cc:	00012517          	auipc	a0,0x12
804011d0:	ea850513          	addi	a0,a0,-344 # 80413074 <commands+0x648>
804011d4:	828ff0ef          	jal	ra,804001fc <cprintf>
804011d8:	08c42583          	lw	a1,140(s0)
804011dc:	00d00793          	li	a5,13
804011e0:	02f58863          	beq	a1,a5,80401210 <pgfault_handler+0x154>
804011e4:	00f00793          	li	a5,15
804011e8:	02f58c63          	beq	a1,a5,80401220 <pgfault_handler+0x164>
804011ec:	00012517          	auipc	a0,0x12
804011f0:	eac50513          	addi	a0,a0,-340 # 80413098 <commands+0x66c>
804011f4:	808ff0ef          	jal	ra,804001fc <cprintf>
804011f8:	00012617          	auipc	a2,0x12
804011fc:	ed060613          	addi	a2,a2,-304 # 804130c8 <commands+0x69c>
80401200:	08e00593          	li	a1,142
80401204:	00012517          	auipc	a0,0x12
80401208:	eb050513          	addi	a0,a0,-336 # 804130b4 <commands+0x688>
8040120c:	c18ff0ef          	jal	ra,80400624 <__panic>
80401210:	00012517          	auipc	a0,0x12
80401214:	e8050513          	addi	a0,a0,-384 # 80413090 <commands+0x664>
80401218:	fe5fe0ef          	jal	ra,804001fc <cprintf>
8040121c:	fddff06f          	j	804011f8 <pgfault_handler+0x13c>
80401220:	00012517          	auipc	a0,0x12
80401224:	e7450513          	addi	a0,a0,-396 # 80413094 <commands+0x668>
80401228:	fd5fe0ef          	jal	ra,804001fc <cprintf>
8040122c:	fcdff06f          	j	804011f8 <pgfault_handler+0x13c>

80401230 <interrupt_handler>:
80401230:	08c52783          	lw	a5,140(a0)
80401234:	00b00713          	li	a4,11
80401238:	00179793          	slli	a5,a5,0x1
8040123c:	0017d793          	srli	a5,a5,0x1
80401240:	10f76663          	bltu	a4,a5,8040134c <interrupt_handler+0x11c>
80401244:	00012717          	auipc	a4,0x12
80401248:	ac470713          	addi	a4,a4,-1340 # 80412d08 <commands+0x2dc>
8040124c:	00279793          	slli	a5,a5,0x2
80401250:	00e787b3          	add	a5,a5,a4
80401254:	0007a783          	lw	a5,0(a5)
80401258:	ff010113          	addi	sp,sp,-16
8040125c:	00112623          	sw	ra,12(sp)
80401260:	00e787b3          	add	a5,a5,a4
80401264:	00078067          	jr	a5
80401268:	00c12083          	lw	ra,12(sp)
8040126c:	00012517          	auipc	a0,0x12
80401270:	d5c50513          	addi	a0,a0,-676 # 80412fc8 <commands+0x59c>
80401274:	01010113          	addi	sp,sp,16
80401278:	f85fe06f          	j	804001fc <cprintf>
8040127c:	00c12083          	lw	ra,12(sp)
80401280:	00012517          	auipc	a0,0x12
80401284:	d2850513          	addi	a0,a0,-728 # 80412fa8 <commands+0x57c>
80401288:	01010113          	addi	sp,sp,16
8040128c:	f71fe06f          	j	804001fc <cprintf>
80401290:	00012517          	auipc	a0,0x12
80401294:	cf850513          	addi	a0,a0,-776 # 80412f88 <commands+0x55c>
80401298:	f65fe0ef          	jal	ra,804001fc <cprintf>
8040129c:	d5cff0ef          	jal	ra,804007f8 <serial_intr>
804012a0:	e58ff0ef          	jal	ra,804008f8 <cons_getc>
804012a4:	00c12083          	lw	ra,12(sp)
804012a8:	01010113          	addi	sp,sp,16
804012ac:	4c10d06f          	j	8040ef6c <dev_stdin_write>
804012b0:	00c12083          	lw	ra,12(sp)
804012b4:	00012517          	auipc	a0,0x12
804012b8:	d3050513          	addi	a0,a0,-720 # 80412fe4 <commands+0x5b8>
804012bc:	01010113          	addi	sp,sp,16
804012c0:	f3dfe06f          	j	804001fc <cprintf>
804012c4:	00c12083          	lw	ra,12(sp)
804012c8:	00012517          	auipc	a0,0x12
804012cc:	d5050513          	addi	a0,a0,-688 # 80413018 <commands+0x5ec>
804012d0:	01010113          	addi	sp,sp,16
804012d4:	f29fe06f          	j	804001fc <cprintf>
804012d8:	00c12083          	lw	ra,12(sp)
804012dc:	00012517          	auipc	a0,0x12
804012e0:	c9050513          	addi	a0,a0,-880 # 80412f6c <commands+0x540>
804012e4:	01010113          	addi	sp,sp,16
804012e8:	f15fe06f          	j	804001fc <cprintf>
804012ec:	c24ff0ef          	jal	ra,80400710 <clock_set_next_event>
804012f0:	0009b797          	auipc	a5,0x9b
804012f4:	4fc78793          	addi	a5,a5,1276 # 8049c7ec <ticks>
804012f8:	0007a783          	lw	a5,0(a5)
804012fc:	00178793          	addi	a5,a5,1
80401300:	0009b717          	auipc	a4,0x9b
80401304:	4ef72623          	sw	a5,1260(a4) # 8049c7ec <ticks>
80401308:	2810b0ef          	jal	ra,8040cd88 <run_timer_list>
8040130c:	f91ff06f          	j	8040129c <interrupt_handler+0x6c>
80401310:	00c12083          	lw	ra,12(sp)
80401314:	00012517          	auipc	a0,0x12
80401318:	d2450513          	addi	a0,a0,-732 # 80413038 <commands+0x60c>
8040131c:	01010113          	addi	sp,sp,16
80401320:	eddfe06f          	j	804001fc <cprintf>
80401324:	00c12083          	lw	ra,12(sp)
80401328:	00012517          	auipc	a0,0x12
8040132c:	d3050513          	addi	a0,a0,-720 # 80413058 <commands+0x62c>
80401330:	01010113          	addi	sp,sp,16
80401334:	ec9fe06f          	j	804001fc <cprintf>
80401338:	00c12083          	lw	ra,12(sp)
8040133c:	00012517          	auipc	a0,0x12
80401340:	cc050513          	addi	a0,a0,-832 # 80412ffc <commands+0x5d0>
80401344:	01010113          	addi	sp,sp,16
80401348:	eb5fe06f          	j	804001fc <cprintf>
8040134c:	cfdff06f          	j	80401048 <print_trapframe>

80401350 <exception_handler>:
80401350:	08c52783          	lw	a5,140(a0)
80401354:	00f00713          	li	a4,15
80401358:	22f76263          	bltu	a4,a5,8040157c <exception_handler+0x22c>
8040135c:	00012717          	auipc	a4,0x12
80401360:	9dc70713          	addi	a4,a4,-1572 # 80412d38 <commands+0x30c>
80401364:	00279793          	slli	a5,a5,0x2
80401368:	00e787b3          	add	a5,a5,a4
8040136c:	0007a783          	lw	a5,0(a5)
80401370:	ff010113          	addi	sp,sp,-16
80401374:	00812423          	sw	s0,8(sp)
80401378:	00112623          	sw	ra,12(sp)
8040137c:	00912223          	sw	s1,4(sp)
80401380:	00e787b3          	add	a5,a5,a4
80401384:	00050413          	mv	s0,a0
80401388:	00078067          	jr	a5
8040138c:	00012517          	auipc	a0,0x12
80401390:	aac50513          	addi	a0,a0,-1364 # 80412e38 <commands+0x40c>
80401394:	e69fe0ef          	jal	ra,804001fc <cprintf>
80401398:	08442783          	lw	a5,132(s0)
8040139c:	00c12083          	lw	ra,12(sp)
804013a0:	00412483          	lw	s1,4(sp)
804013a4:	00478793          	addi	a5,a5,4
804013a8:	08f42223          	sw	a5,132(s0)
804013ac:	00812403          	lw	s0,8(sp)
804013b0:	01010113          	addi	sp,sp,16
804013b4:	4d90b06f          	j	8040d08c <syscall>
804013b8:	00012517          	auipc	a0,0x12
804013bc:	aa050513          	addi	a0,a0,-1376 # 80412e58 <commands+0x42c>
804013c0:	00812403          	lw	s0,8(sp)
804013c4:	00c12083          	lw	ra,12(sp)
804013c8:	00412483          	lw	s1,4(sp)
804013cc:	01010113          	addi	sp,sp,16
804013d0:	e2dfe06f          	j	804001fc <cprintf>
804013d4:	00012517          	auipc	a0,0x12
804013d8:	aa450513          	addi	a0,a0,-1372 # 80412e78 <commands+0x44c>
804013dc:	fe5ff06f          	j	804013c0 <exception_handler+0x70>
804013e0:	00012517          	auipc	a0,0x12
804013e4:	ab850513          	addi	a0,a0,-1352 # 80412e98 <commands+0x46c>
804013e8:	fd9ff06f          	j	804013c0 <exception_handler+0x70>
804013ec:	00012517          	auipc	a0,0x12
804013f0:	ac450513          	addi	a0,a0,-1340 # 80412eb0 <commands+0x484>
804013f4:	e09fe0ef          	jal	ra,804001fc <cprintf>
804013f8:	00040513          	mv	a0,s0
804013fc:	cc1ff0ef          	jal	ra,804010bc <pgfault_handler>
80401400:	00050493          	mv	s1,a0
80401404:	0e051463          	bnez	a0,804014ec <exception_handler+0x19c>
80401408:	00c12083          	lw	ra,12(sp)
8040140c:	00812403          	lw	s0,8(sp)
80401410:	00412483          	lw	s1,4(sp)
80401414:	01010113          	addi	sp,sp,16
80401418:	00008067          	ret
8040141c:	00012517          	auipc	a0,0x12
80401420:	b3850513          	addi	a0,a0,-1224 # 80412f54 <commands+0x528>
80401424:	dd9fe0ef          	jal	ra,804001fc <cprintf>
80401428:	00040513          	mv	a0,s0
8040142c:	c91ff0ef          	jal	ra,804010bc <pgfault_handler>
80401430:	00050493          	mv	s1,a0
80401434:	fc050ae3          	beqz	a0,80401408 <exception_handler+0xb8>
80401438:	00040513          	mv	a0,s0
8040143c:	c0dff0ef          	jal	ra,80401048 <print_trapframe>
80401440:	0009b797          	auipc	a5,0x9b
80401444:	36c78793          	addi	a5,a5,876 # 8049c7ac <current>
80401448:	0007a783          	lw	a5,0(a5)
8040144c:	14078863          	beqz	a5,8040159c <exception_handler+0x24c>
80401450:	08042783          	lw	a5,128(s0)
80401454:	1007f793          	andi	a5,a5,256
80401458:	0c078a63          	beqz	a5,8040152c <exception_handler+0x1dc>
8040145c:	00048693          	mv	a3,s1
80401460:	00012617          	auipc	a2,0x12
80401464:	a8460613          	addi	a2,a2,-1404 # 80412ee4 <commands+0x4b8>
80401468:	11900593          	li	a1,281
8040146c:	00012517          	auipc	a0,0x12
80401470:	c4850513          	addi	a0,a0,-952 # 804130b4 <commands+0x688>
80401474:	9b0ff0ef          	jal	ra,80400624 <__panic>
80401478:	00012517          	auipc	a0,0x12
8040147c:	90050513          	addi	a0,a0,-1792 # 80412d78 <commands+0x34c>
80401480:	f41ff06f          	j	804013c0 <exception_handler+0x70>
80401484:	00012517          	auipc	a0,0x12
80401488:	91450513          	addi	a0,a0,-1772 # 80412d98 <commands+0x36c>
8040148c:	f35ff06f          	j	804013c0 <exception_handler+0x70>
80401490:	00012517          	auipc	a0,0x12
80401494:	92450513          	addi	a0,a0,-1756 # 80412db4 <commands+0x388>
80401498:	f29ff06f          	j	804013c0 <exception_handler+0x70>
8040149c:	00012517          	auipc	a0,0x12
804014a0:	93050513          	addi	a0,a0,-1744 # 80412dcc <commands+0x3a0>
804014a4:	f1dff06f          	j	804013c0 <exception_handler+0x70>
804014a8:	00012517          	auipc	a0,0x12
804014ac:	93050513          	addi	a0,a0,-1744 # 80412dd8 <commands+0x3ac>
804014b0:	f11ff06f          	j	804013c0 <exception_handler+0x70>
804014b4:	00012517          	auipc	a0,0x12
804014b8:	94050513          	addi	a0,a0,-1728 # 80412df4 <commands+0x3c8>
804014bc:	f05ff06f          	j	804013c0 <exception_handler+0x70>
804014c0:	00012517          	auipc	a0,0x12
804014c4:	94850513          	addi	a0,a0,-1720 # 80412e08 <commands+0x3dc>
804014c8:	ef9ff06f          	j	804013c0 <exception_handler+0x70>
804014cc:	00012517          	auipc	a0,0x12
804014d0:	95450513          	addi	a0,a0,-1708 # 80412e20 <commands+0x3f4>
804014d4:	eedff06f          	j	804013c0 <exception_handler+0x70>
804014d8:	00812403          	lw	s0,8(sp)
804014dc:	00c12083          	lw	ra,12(sp)
804014e0:	00412483          	lw	s1,4(sp)
804014e4:	01010113          	addi	sp,sp,16
804014e8:	b61ff06f          	j	80401048 <print_trapframe>
804014ec:	00040513          	mv	a0,s0
804014f0:	b59ff0ef          	jal	ra,80401048 <print_trapframe>
804014f4:	0009b797          	auipc	a5,0x9b
804014f8:	2b878793          	addi	a5,a5,696 # 8049c7ac <current>
804014fc:	0007a783          	lw	a5,0(a5)
80401500:	08078063          	beqz	a5,80401580 <exception_handler+0x230>
80401504:	08042783          	lw	a5,128(s0)
80401508:	1007f793          	andi	a5,a5,256
8040150c:	04078463          	beqz	a5,80401554 <exception_handler+0x204>
80401510:	00048693          	mv	a3,s1
80401514:	00012617          	auipc	a2,0x12
80401518:	9d060613          	addi	a2,a2,-1584 # 80412ee4 <commands+0x4b8>
8040151c:	10800593          	li	a1,264
80401520:	00012517          	auipc	a0,0x12
80401524:	b9450513          	addi	a0,a0,-1132 # 804130b4 <commands+0x688>
80401528:	8fcff0ef          	jal	ra,80400624 <__panic>
8040152c:	00012517          	auipc	a0,0x12
80401530:	9e850513          	addi	a0,a0,-1560 # 80412f14 <commands+0x4e8>
80401534:	cc9fe0ef          	jal	ra,804001fc <cprintf>
80401538:	00048693          	mv	a3,s1
8040153c:	00012617          	auipc	a2,0x12
80401540:	9ec60613          	addi	a2,a2,-1556 # 80412f28 <commands+0x4fc>
80401544:	11c00593          	li	a1,284
80401548:	00012517          	auipc	a0,0x12
8040154c:	b6c50513          	addi	a0,a0,-1172 # 804130b4 <commands+0x688>
80401550:	8d4ff0ef          	jal	ra,80400624 <__panic>
80401554:	00012517          	auipc	a0,0x12
80401558:	9c050513          	addi	a0,a0,-1600 # 80412f14 <commands+0x4e8>
8040155c:	ca1fe0ef          	jal	ra,804001fc <cprintf>
80401560:	00048693          	mv	a3,s1
80401564:	00012617          	auipc	a2,0x12
80401568:	9c460613          	addi	a2,a2,-1596 # 80412f28 <commands+0x4fc>
8040156c:	10b00593          	li	a1,267
80401570:	00012517          	auipc	a0,0x12
80401574:	b4450513          	addi	a0,a0,-1212 # 804130b4 <commands+0x688>
80401578:	8acff0ef          	jal	ra,80400624 <__panic>
8040157c:	acdff06f          	j	80401048 <print_trapframe>
80401580:	00048693          	mv	a3,s1
80401584:	00012617          	auipc	a2,0x12
80401588:	94060613          	addi	a2,a2,-1728 # 80412ec4 <commands+0x498>
8040158c:	10400593          	li	a1,260
80401590:	00012517          	auipc	a0,0x12
80401594:	b2450513          	addi	a0,a0,-1244 # 804130b4 <commands+0x688>
80401598:	88cff0ef          	jal	ra,80400624 <__panic>
8040159c:	00048693          	mv	a3,s1
804015a0:	00012617          	auipc	a2,0x12
804015a4:	92460613          	addi	a2,a2,-1756 # 80412ec4 <commands+0x498>
804015a8:	11500593          	li	a1,277
804015ac:	00012517          	auipc	a0,0x12
804015b0:	b0850513          	addi	a0,a0,-1272 # 804130b4 <commands+0x688>
804015b4:	870ff0ef          	jal	ra,80400624 <__panic>

804015b8 <trap>:
804015b8:	ff010113          	addi	sp,sp,-16
804015bc:	00812423          	sw	s0,8(sp)
804015c0:	0009b417          	auipc	s0,0x9b
804015c4:	1ec40413          	addi	s0,s0,492 # 8049c7ac <current>
804015c8:	00042703          	lw	a4,0(s0)
804015cc:	00112623          	sw	ra,12(sp)
804015d0:	00912223          	sw	s1,4(sp)
804015d4:	01212023          	sw	s2,0(sp)
804015d8:	08c52683          	lw	a3,140(a0)
804015dc:	04070e63          	beqz	a4,80401638 <trap+0x80>
804015e0:	08052483          	lw	s1,128(a0)
804015e4:	05472903          	lw	s2,84(a4)
804015e8:	04a72a23          	sw	a0,84(a4)
804015ec:	1004f493          	andi	s1,s1,256
804015f0:	0406c063          	bltz	a3,80401630 <trap+0x78>
804015f4:	d5dff0ef          	jal	ra,80401350 <exception_handler>
804015f8:	00042783          	lw	a5,0(s0)
804015fc:	0527aa23          	sw	s2,84(a5)
80401600:	00049c63          	bnez	s1,80401618 <trap+0x60>
80401604:	05c7a703          	lw	a4,92(a5)
80401608:	00177713          	andi	a4,a4,1
8040160c:	06071c63          	bnez	a4,80401684 <trap+0xcc>
80401610:	0107a783          	lw	a5,16(a5)
80401614:	04079c63          	bnez	a5,8040166c <trap+0xb4>
80401618:	00c12083          	lw	ra,12(sp)
8040161c:	00812403          	lw	s0,8(sp)
80401620:	00412483          	lw	s1,4(sp)
80401624:	00012903          	lw	s2,0(sp)
80401628:	01010113          	addi	sp,sp,16
8040162c:	00008067          	ret
80401630:	c01ff0ef          	jal	ra,80401230 <interrupt_handler>
80401634:	fc5ff06f          	j	804015f8 <trap+0x40>
80401638:	0006ce63          	bltz	a3,80401654 <trap+0x9c>
8040163c:	00812403          	lw	s0,8(sp)
80401640:	00c12083          	lw	ra,12(sp)
80401644:	00412483          	lw	s1,4(sp)
80401648:	00012903          	lw	s2,0(sp)
8040164c:	01010113          	addi	sp,sp,16
80401650:	d01ff06f          	j	80401350 <exception_handler>
80401654:	00812403          	lw	s0,8(sp)
80401658:	00c12083          	lw	ra,12(sp)
8040165c:	00412483          	lw	s1,4(sp)
80401660:	00012903          	lw	s2,0(sp)
80401664:	01010113          	addi	sp,sp,16
80401668:	bc9ff06f          	j	80401230 <interrupt_handler>
8040166c:	00812403          	lw	s0,8(sp)
80401670:	00c12083          	lw	ra,12(sp)
80401674:	00412483          	lw	s1,4(sp)
80401678:	00012903          	lw	s2,0(sp)
8040167c:	01010113          	addi	sp,sp,16
80401680:	3f80b06f          	j	8040ca78 <schedule>
80401684:	ff700513          	li	a0,-9
80401688:	314060ef          	jal	ra,8040799c <do_exit>
8040168c:	00042783          	lw	a5,0(s0)
80401690:	f81ff06f          	j	80401610 <trap+0x58>

80401694 <__alltraps>:
80401694:	14011173          	csrrw	sp,sscratch,sp
80401698:	00011463          	bnez	sp,804016a0 <__alltraps+0xc>
8040169c:	14002173          	csrr	sp,sscratch
804016a0:	f7010113          	addi	sp,sp,-144
804016a4:	00012023          	sw	zero,0(sp)
804016a8:	00112223          	sw	ra,4(sp)
804016ac:	00312623          	sw	gp,12(sp)
804016b0:	00412823          	sw	tp,16(sp)
804016b4:	00512a23          	sw	t0,20(sp)
804016b8:	00612c23          	sw	t1,24(sp)
804016bc:	00712e23          	sw	t2,28(sp)
804016c0:	02812023          	sw	s0,32(sp)
804016c4:	02912223          	sw	s1,36(sp)
804016c8:	02a12423          	sw	a0,40(sp)
804016cc:	02b12623          	sw	a1,44(sp)
804016d0:	02c12823          	sw	a2,48(sp)
804016d4:	02d12a23          	sw	a3,52(sp)
804016d8:	02e12c23          	sw	a4,56(sp)
804016dc:	02f12e23          	sw	a5,60(sp)
804016e0:	05012023          	sw	a6,64(sp)
804016e4:	05112223          	sw	a7,68(sp)
804016e8:	05212423          	sw	s2,72(sp)
804016ec:	05312623          	sw	s3,76(sp)
804016f0:	05412823          	sw	s4,80(sp)
804016f4:	05512a23          	sw	s5,84(sp)
804016f8:	05612c23          	sw	s6,88(sp)
804016fc:	05712e23          	sw	s7,92(sp)
80401700:	07812023          	sw	s8,96(sp)
80401704:	07912223          	sw	s9,100(sp)
80401708:	07a12423          	sw	s10,104(sp)
8040170c:	07b12623          	sw	s11,108(sp)
80401710:	07c12823          	sw	t3,112(sp)
80401714:	07d12a23          	sw	t4,116(sp)
80401718:	07e12c23          	sw	t5,120(sp)
8040171c:	07f12e23          	sw	t6,124(sp)
80401720:	14001473          	csrrw	s0,sscratch,zero
80401724:	100024f3          	csrr	s1,sstatus
80401728:	14102973          	csrr	s2,sepc
8040172c:	143029f3          	csrr	s3,stval
80401730:	14202a73          	csrr	s4,scause
80401734:	00812423          	sw	s0,8(sp)
80401738:	08912023          	sw	s1,128(sp)
8040173c:	09212223          	sw	s2,132(sp)
80401740:	09312423          	sw	s3,136(sp)
80401744:	09412623          	sw	s4,140(sp)
80401748:	00010513          	mv	a0,sp
8040174c:	e6dff0ef          	jal	ra,804015b8 <trap>

80401750 <__trapret>:
80401750:	08012483          	lw	s1,128(sp)
80401754:	08412903          	lw	s2,132(sp)
80401758:	1004f413          	andi	s0,s1,256
8040175c:	00041663          	bnez	s0,80401768 <__trapret+0x18>
80401760:	09010413          	addi	s0,sp,144
80401764:	14041073          	csrw	sscratch,s0
80401768:	10049073          	csrw	sstatus,s1
8040176c:	14191073          	csrw	sepc,s2
80401770:	00412083          	lw	ra,4(sp)
80401774:	00c12183          	lw	gp,12(sp)
80401778:	01012203          	lw	tp,16(sp)
8040177c:	01412283          	lw	t0,20(sp)
80401780:	01812303          	lw	t1,24(sp)
80401784:	01c12383          	lw	t2,28(sp)
80401788:	02012403          	lw	s0,32(sp)
8040178c:	02412483          	lw	s1,36(sp)
80401790:	02812503          	lw	a0,40(sp)
80401794:	02c12583          	lw	a1,44(sp)
80401798:	03012603          	lw	a2,48(sp)
8040179c:	03412683          	lw	a3,52(sp)
804017a0:	03812703          	lw	a4,56(sp)
804017a4:	03c12783          	lw	a5,60(sp)
804017a8:	04012803          	lw	a6,64(sp)
804017ac:	04412883          	lw	a7,68(sp)
804017b0:	04812903          	lw	s2,72(sp)
804017b4:	04c12983          	lw	s3,76(sp)
804017b8:	05012a03          	lw	s4,80(sp)
804017bc:	05412a83          	lw	s5,84(sp)
804017c0:	05812b03          	lw	s6,88(sp)
804017c4:	05c12b83          	lw	s7,92(sp)
804017c8:	06012c03          	lw	s8,96(sp)
804017cc:	06412c83          	lw	s9,100(sp)
804017d0:	06812d03          	lw	s10,104(sp)
804017d4:	06c12d83          	lw	s11,108(sp)
804017d8:	07012e03          	lw	t3,112(sp)
804017dc:	07412e83          	lw	t4,116(sp)
804017e0:	07812f03          	lw	t5,120(sp)
804017e4:	07c12f83          	lw	t6,124(sp)
804017e8:	00812103          	lw	sp,8(sp)
804017ec:	0ff0000f          	fence
804017f0:	12000073          	sfence.vma
804017f4:	10200073          	sret

804017f8 <forkrets>:
804017f8:	00050113          	mv	sp,a0
804017fc:	10017073          	csrci	sstatus,2
80401800:	0000100f          	fence.i
80401804:	00000013          	nop
80401808:	00000013          	nop
8040180c:	00000013          	nop
80401810:	00000013          	nop
80401814:	00000013          	nop
80401818:	00000013          	nop
8040181c:	00000013          	nop
80401820:	00000013          	nop
80401824:	0ff0000f          	fence
80401828:	0000100f          	fence.i
8040182c:	12000073          	sfence.vma
80401830:	f21ff06f          	j	80401750 <__trapret>

80401834 <default_init>:
80401834:	0009b797          	auipc	a5,0x9b
80401838:	fbc78793          	addi	a5,a5,-68 # 8049c7f0 <free_area>
8040183c:	00f7a223          	sw	a5,4(a5)
80401840:	00f7a023          	sw	a5,0(a5)
80401844:	0007a423          	sw	zero,8(a5)
80401848:	00008067          	ret

8040184c <default_nr_free_pages>:
8040184c:	0009b797          	auipc	a5,0x9b
80401850:	fa478793          	addi	a5,a5,-92 # 8049c7f0 <free_area>
80401854:	0087a503          	lw	a0,8(a5)
80401858:	00008067          	ret

8040185c <default_check>:
8040185c:	fd010113          	addi	sp,sp,-48
80401860:	03212023          	sw	s2,32(sp)
80401864:	0009b917          	auipc	s2,0x9b
80401868:	f8c90913          	addi	s2,s2,-116 # 8049c7f0 <free_area>
8040186c:	00492783          	lw	a5,4(s2)
80401870:	02112623          	sw	ra,44(sp)
80401874:	02812423          	sw	s0,40(sp)
80401878:	02912223          	sw	s1,36(sp)
8040187c:	01312e23          	sw	s3,28(sp)
80401880:	01412c23          	sw	s4,24(sp)
80401884:	01512a23          	sw	s5,20(sp)
80401888:	01612823          	sw	s6,16(sp)
8040188c:	01712623          	sw	s7,12(sp)
80401890:	01812423          	sw	s8,8(sp)
80401894:	3d278e63          	beq	a5,s2,80401c70 <default_check+0x414>
80401898:	ff87a703          	lw	a4,-8(a5)
8040189c:	00175713          	srli	a4,a4,0x1
804018a0:	00177713          	andi	a4,a4,1
804018a4:	3c070e63          	beqz	a4,80401c80 <default_check+0x424>
804018a8:	00000413          	li	s0,0
804018ac:	00000493          	li	s1,0
804018b0:	0100006f          	j	804018c0 <default_check+0x64>
804018b4:	ff87a703          	lw	a4,-8(a5)
804018b8:	00277713          	andi	a4,a4,2
804018bc:	3c070263          	beqz	a4,80401c80 <default_check+0x424>
804018c0:	ffc7a703          	lw	a4,-4(a5)
804018c4:	0047a783          	lw	a5,4(a5)
804018c8:	00148493          	addi	s1,s1,1
804018cc:	00e40433          	add	s0,s0,a4
804018d0:	00040993          	mv	s3,s0
804018d4:	ff2790e3          	bne	a5,s2,804018b4 <default_check+0x58>
804018d8:	59c010ef          	jal	ra,80402e74 <nr_free_pages>
804018dc:	013512e3          	bne	a0,s3,804020e0 <default_check+0x884>
804018e0:	00100513          	li	a0,1
804018e4:	45c010ef          	jal	ra,80402d40 <alloc_pages>
804018e8:	00050a13          	mv	s4,a0
804018ec:	52050a63          	beqz	a0,80401e20 <default_check+0x5c4>
804018f0:	00100513          	li	a0,1
804018f4:	44c010ef          	jal	ra,80402d40 <alloc_pages>
804018f8:	00050993          	mv	s3,a0
804018fc:	000502e3          	beqz	a0,80402100 <default_check+0x8a4>
80401900:	00100513          	li	a0,1
80401904:	43c010ef          	jal	ra,80402d40 <alloc_pages>
80401908:	00050a93          	mv	s5,a0
8040190c:	58050a63          	beqz	a0,80401ea0 <default_check+0x644>
80401910:	393a0863          	beq	s4,s3,80401ca0 <default_check+0x444>
80401914:	38aa0663          	beq	s4,a0,80401ca0 <default_check+0x444>
80401918:	38a98463          	beq	s3,a0,80401ca0 <default_check+0x444>
8040191c:	000a2783          	lw	a5,0(s4)
80401920:	3a079063          	bnez	a5,80401cc0 <default_check+0x464>
80401924:	0009a783          	lw	a5,0(s3)
80401928:	38079c63          	bnez	a5,80401cc0 <default_check+0x464>
8040192c:	00052783          	lw	a5,0(a0)
80401930:	38079863          	bnez	a5,80401cc0 <default_check+0x464>
80401934:	0009b797          	auipc	a5,0x9b
80401938:	ed478793          	addi	a5,a5,-300 # 8049c808 <pages>
8040193c:	0007a783          	lw	a5,0(a5)
80401940:	00015717          	auipc	a4,0x15
80401944:	84070713          	addi	a4,a4,-1984 # 80416180 <nbase>
80401948:	00072603          	lw	a2,0(a4)
8040194c:	0009b717          	auipc	a4,0x9b
80401950:	e4c70713          	addi	a4,a4,-436 # 8049c798 <npage>
80401954:	00072683          	lw	a3,0(a4)
80401958:	40fa0733          	sub	a4,s4,a5
8040195c:	40575713          	srai	a4,a4,0x5
80401960:	00c70733          	add	a4,a4,a2
80401964:	00c69693          	slli	a3,a3,0xc
80401968:	00c71713          	slli	a4,a4,0xc
8040196c:	36d77a63          	bgeu	a4,a3,80401ce0 <default_check+0x484>
80401970:	40f98733          	sub	a4,s3,a5
80401974:	40575713          	srai	a4,a4,0x5
80401978:	00c70733          	add	a4,a4,a2
8040197c:	00c71713          	slli	a4,a4,0xc
80401980:	5ad77063          	bgeu	a4,a3,80401f20 <default_check+0x6c4>
80401984:	40f507b3          	sub	a5,a0,a5
80401988:	4057d793          	srai	a5,a5,0x5
8040198c:	00c787b3          	add	a5,a5,a2
80401990:	00c79793          	slli	a5,a5,0xc
80401994:	3ed7f663          	bgeu	a5,a3,80401d80 <default_check+0x524>
80401998:	00100513          	li	a0,1
8040199c:	00092c03          	lw	s8,0(s2)
804019a0:	00492b83          	lw	s7,4(s2)
804019a4:	00892b03          	lw	s6,8(s2)
804019a8:	0009b797          	auipc	a5,0x9b
804019ac:	e527a623          	sw	s2,-436(a5) # 8049c7f4 <free_area+0x4>
804019b0:	0009b797          	auipc	a5,0x9b
804019b4:	e527a023          	sw	s2,-448(a5) # 8049c7f0 <free_area>
804019b8:	0009b797          	auipc	a5,0x9b
804019bc:	e407a023          	sw	zero,-448(a5) # 8049c7f8 <free_area+0x8>
804019c0:	380010ef          	jal	ra,80402d40 <alloc_pages>
804019c4:	38051e63          	bnez	a0,80401d60 <default_check+0x504>
804019c8:	00100593          	li	a1,1
804019cc:	000a0513          	mv	a0,s4
804019d0:	438010ef          	jal	ra,80402e08 <free_pages>
804019d4:	00100593          	li	a1,1
804019d8:	00098513          	mv	a0,s3
804019dc:	42c010ef          	jal	ra,80402e08 <free_pages>
804019e0:	00100593          	li	a1,1
804019e4:	000a8513          	mv	a0,s5
804019e8:	420010ef          	jal	ra,80402e08 <free_pages>
804019ec:	00892703          	lw	a4,8(s2)
804019f0:	00300793          	li	a5,3
804019f4:	34f71663          	bne	a4,a5,80401d40 <default_check+0x4e4>
804019f8:	00100513          	li	a0,1
804019fc:	344010ef          	jal	ra,80402d40 <alloc_pages>
80401a00:	00050993          	mv	s3,a0
80401a04:	30050e63          	beqz	a0,80401d20 <default_check+0x4c4>
80401a08:	00100513          	li	a0,1
80401a0c:	334010ef          	jal	ra,80402d40 <alloc_pages>
80401a10:	00050a93          	mv	s5,a0
80401a14:	46050663          	beqz	a0,80401e80 <default_check+0x624>
80401a18:	00100513          	li	a0,1
80401a1c:	324010ef          	jal	ra,80402d40 <alloc_pages>
80401a20:	00050a13          	mv	s4,a0
80401a24:	42050e63          	beqz	a0,80401e60 <default_check+0x604>
80401a28:	00100513          	li	a0,1
80401a2c:	314010ef          	jal	ra,80402d40 <alloc_pages>
80401a30:	40051863          	bnez	a0,80401e40 <default_check+0x5e4>
80401a34:	00100593          	li	a1,1
80401a38:	00098513          	mv	a0,s3
80401a3c:	3cc010ef          	jal	ra,80402e08 <free_pages>
80401a40:	00492783          	lw	a5,4(s2)
80401a44:	2b278e63          	beq	a5,s2,80401d00 <default_check+0x4a4>
80401a48:	00100513          	li	a0,1
80401a4c:	2f4010ef          	jal	ra,80402d40 <alloc_pages>
80401a50:	3aa99863          	bne	s3,a0,80401e00 <default_check+0x5a4>
80401a54:	00100513          	li	a0,1
80401a58:	2e8010ef          	jal	ra,80402d40 <alloc_pages>
80401a5c:	38051263          	bnez	a0,80401de0 <default_check+0x584>
80401a60:	00892783          	lw	a5,8(s2)
80401a64:	34079e63          	bnez	a5,80401dc0 <default_check+0x564>
80401a68:	00098513          	mv	a0,s3
80401a6c:	00100593          	li	a1,1
80401a70:	0009b797          	auipc	a5,0x9b
80401a74:	d987a023          	sw	s8,-640(a5) # 8049c7f0 <free_area>
80401a78:	0009b797          	auipc	a5,0x9b
80401a7c:	d777ae23          	sw	s7,-644(a5) # 8049c7f4 <free_area+0x4>
80401a80:	0009b797          	auipc	a5,0x9b
80401a84:	d767ac23          	sw	s6,-648(a5) # 8049c7f8 <free_area+0x8>
80401a88:	380010ef          	jal	ra,80402e08 <free_pages>
80401a8c:	00100593          	li	a1,1
80401a90:	000a8513          	mv	a0,s5
80401a94:	374010ef          	jal	ra,80402e08 <free_pages>
80401a98:	00100593          	li	a1,1
80401a9c:	000a0513          	mv	a0,s4
80401aa0:	368010ef          	jal	ra,80402e08 <free_pages>
80401aa4:	00500513          	li	a0,5
80401aa8:	298010ef          	jal	ra,80402d40 <alloc_pages>
80401aac:	00050993          	mv	s3,a0
80401ab0:	2e050863          	beqz	a0,80401da0 <default_check+0x544>
80401ab4:	00452783          	lw	a5,4(a0)
80401ab8:	0017d793          	srli	a5,a5,0x1
80401abc:	0017f793          	andi	a5,a5,1
80401ac0:	5c079063          	bnez	a5,80402080 <default_check+0x824>
80401ac4:	00100513          	li	a0,1
80401ac8:	00092b03          	lw	s6,0(s2)
80401acc:	00492a83          	lw	s5,4(s2)
80401ad0:	0009b797          	auipc	a5,0x9b
80401ad4:	d327a023          	sw	s2,-736(a5) # 8049c7f0 <free_area>
80401ad8:	0009b797          	auipc	a5,0x9b
80401adc:	d127ae23          	sw	s2,-740(a5) # 8049c7f4 <free_area+0x4>
80401ae0:	260010ef          	jal	ra,80402d40 <alloc_pages>
80401ae4:	56051e63          	bnez	a0,80402060 <default_check+0x804>
80401ae8:	04098a13          	addi	s4,s3,64
80401aec:	000a0513          	mv	a0,s4
80401af0:	00300593          	li	a1,3
80401af4:	00892b83          	lw	s7,8(s2)
80401af8:	0009b797          	auipc	a5,0x9b
80401afc:	d007a023          	sw	zero,-768(a5) # 8049c7f8 <free_area+0x8>
80401b00:	308010ef          	jal	ra,80402e08 <free_pages>
80401b04:	00400513          	li	a0,4
80401b08:	238010ef          	jal	ra,80402d40 <alloc_pages>
80401b0c:	52051a63          	bnez	a0,80402040 <default_check+0x7e4>
80401b10:	0449a783          	lw	a5,68(s3)
80401b14:	0017d793          	srli	a5,a5,0x1
80401b18:	0017f793          	andi	a5,a5,1
80401b1c:	50078263          	beqz	a5,80402020 <default_check+0x7c4>
80401b20:	0489a703          	lw	a4,72(s3)
80401b24:	00300793          	li	a5,3
80401b28:	4ef71c63          	bne	a4,a5,80402020 <default_check+0x7c4>
80401b2c:	00300513          	li	a0,3
80401b30:	210010ef          	jal	ra,80402d40 <alloc_pages>
80401b34:	00050c13          	mv	s8,a0
80401b38:	4c050463          	beqz	a0,80402000 <default_check+0x7a4>
80401b3c:	00100513          	li	a0,1
80401b40:	200010ef          	jal	ra,80402d40 <alloc_pages>
80401b44:	48051e63          	bnez	a0,80401fe0 <default_check+0x784>
80401b48:	478a1c63          	bne	s4,s8,80401fc0 <default_check+0x764>
80401b4c:	00100593          	li	a1,1
80401b50:	00098513          	mv	a0,s3
80401b54:	2b4010ef          	jal	ra,80402e08 <free_pages>
80401b58:	00300593          	li	a1,3
80401b5c:	000a0513          	mv	a0,s4
80401b60:	2a8010ef          	jal	ra,80402e08 <free_pages>
80401b64:	0049a783          	lw	a5,4(s3)
80401b68:	02098c13          	addi	s8,s3,32
80401b6c:	0017d793          	srli	a5,a5,0x1
80401b70:	0017f793          	andi	a5,a5,1
80401b74:	42078663          	beqz	a5,80401fa0 <default_check+0x744>
80401b78:	0089a703          	lw	a4,8(s3)
80401b7c:	00100793          	li	a5,1
80401b80:	42f71063          	bne	a4,a5,80401fa0 <default_check+0x744>
80401b84:	004a2783          	lw	a5,4(s4)
80401b88:	0017d793          	srli	a5,a5,0x1
80401b8c:	0017f793          	andi	a5,a5,1
80401b90:	3e078863          	beqz	a5,80401f80 <default_check+0x724>
80401b94:	008a2703          	lw	a4,8(s4)
80401b98:	00300793          	li	a5,3
80401b9c:	3ef71263          	bne	a4,a5,80401f80 <default_check+0x724>
80401ba0:	00100513          	li	a0,1
80401ba4:	19c010ef          	jal	ra,80402d40 <alloc_pages>
80401ba8:	3aa99c63          	bne	s3,a0,80401f60 <default_check+0x704>
80401bac:	00100593          	li	a1,1
80401bb0:	258010ef          	jal	ra,80402e08 <free_pages>
80401bb4:	00200513          	li	a0,2
80401bb8:	188010ef          	jal	ra,80402d40 <alloc_pages>
80401bbc:	38aa1263          	bne	s4,a0,80401f40 <default_check+0x6e4>
80401bc0:	00200593          	li	a1,2
80401bc4:	244010ef          	jal	ra,80402e08 <free_pages>
80401bc8:	00100593          	li	a1,1
80401bcc:	000c0513          	mv	a0,s8
80401bd0:	238010ef          	jal	ra,80402e08 <free_pages>
80401bd4:	00500513          	li	a0,5
80401bd8:	168010ef          	jal	ra,80402d40 <alloc_pages>
80401bdc:	00050993          	mv	s3,a0
80401be0:	4c050063          	beqz	a0,804020a0 <default_check+0x844>
80401be4:	00100513          	li	a0,1
80401be8:	158010ef          	jal	ra,80402d40 <alloc_pages>
80401bec:	30051a63          	bnez	a0,80401f00 <default_check+0x6a4>
80401bf0:	00892783          	lw	a5,8(s2)
80401bf4:	2e079663          	bnez	a5,80401ee0 <default_check+0x684>
80401bf8:	00500593          	li	a1,5
80401bfc:	00098513          	mv	a0,s3
80401c00:	0009b797          	auipc	a5,0x9b
80401c04:	bf77ac23          	sw	s7,-1032(a5) # 8049c7f8 <free_area+0x8>
80401c08:	0009b797          	auipc	a5,0x9b
80401c0c:	bf67a423          	sw	s6,-1048(a5) # 8049c7f0 <free_area>
80401c10:	0009b797          	auipc	a5,0x9b
80401c14:	bf57a223          	sw	s5,-1052(a5) # 8049c7f4 <free_area+0x4>
80401c18:	1f0010ef          	jal	ra,80402e08 <free_pages>
80401c1c:	00492783          	lw	a5,4(s2)
80401c20:	01278c63          	beq	a5,s2,80401c38 <default_check+0x3dc>
80401c24:	ffc7a703          	lw	a4,-4(a5)
80401c28:	0047a783          	lw	a5,4(a5)
80401c2c:	fff48493          	addi	s1,s1,-1
80401c30:	40e40433          	sub	s0,s0,a4
80401c34:	ff2798e3          	bne	a5,s2,80401c24 <default_check+0x3c8>
80401c38:	28049463          	bnez	s1,80401ec0 <default_check+0x664>
80401c3c:	48041263          	bnez	s0,804020c0 <default_check+0x864>
80401c40:	02c12083          	lw	ra,44(sp)
80401c44:	02812403          	lw	s0,40(sp)
80401c48:	02412483          	lw	s1,36(sp)
80401c4c:	02012903          	lw	s2,32(sp)
80401c50:	01c12983          	lw	s3,28(sp)
80401c54:	01812a03          	lw	s4,24(sp)
80401c58:	01412a83          	lw	s5,20(sp)
80401c5c:	01012b03          	lw	s6,16(sp)
80401c60:	00c12b83          	lw	s7,12(sp)
80401c64:	00812c03          	lw	s8,8(sp)
80401c68:	03010113          	addi	sp,sp,48
80401c6c:	00008067          	ret
80401c70:	00000993          	li	s3,0
80401c74:	00000413          	li	s0,0
80401c78:	00000493          	li	s1,0
80401c7c:	c5dff06f          	j	804018d8 <default_check+0x7c>
80401c80:	00011697          	auipc	a3,0x11
80401c84:	74468693          	addi	a3,a3,1860 # 804133c4 <commands+0x998>
80401c88:	00011617          	auipc	a2,0x11
80401c8c:	f6060613          	addi	a2,a2,-160 # 80412be8 <commands+0x1bc>
80401c90:	0f000593          	li	a1,240
80401c94:	00011517          	auipc	a0,0x11
80401c98:	74050513          	addi	a0,a0,1856 # 804133d4 <commands+0x9a8>
80401c9c:	989fe0ef          	jal	ra,80400624 <__panic>
80401ca0:	00011697          	auipc	a3,0x11
80401ca4:	7bc68693          	addi	a3,a3,1980 # 8041345c <commands+0xa30>
80401ca8:	00011617          	auipc	a2,0x11
80401cac:	f4060613          	addi	a2,a2,-192 # 80412be8 <commands+0x1bc>
80401cb0:	0bd00593          	li	a1,189
80401cb4:	00011517          	auipc	a0,0x11
80401cb8:	72050513          	addi	a0,a0,1824 # 804133d4 <commands+0x9a8>
80401cbc:	969fe0ef          	jal	ra,80400624 <__panic>
80401cc0:	00011697          	auipc	a3,0x11
80401cc4:	7c068693          	addi	a3,a3,1984 # 80413480 <commands+0xa54>
80401cc8:	00011617          	auipc	a2,0x11
80401ccc:	f2060613          	addi	a2,a2,-224 # 80412be8 <commands+0x1bc>
80401cd0:	0be00593          	li	a1,190
80401cd4:	00011517          	auipc	a0,0x11
80401cd8:	70050513          	addi	a0,a0,1792 # 804133d4 <commands+0x9a8>
80401cdc:	949fe0ef          	jal	ra,80400624 <__panic>
80401ce0:	00011697          	auipc	a3,0x11
80401ce4:	7dc68693          	addi	a3,a3,2012 # 804134bc <commands+0xa90>
80401ce8:	00011617          	auipc	a2,0x11
80401cec:	f0060613          	addi	a2,a2,-256 # 80412be8 <commands+0x1bc>
80401cf0:	0c000593          	li	a1,192
80401cf4:	00011517          	auipc	a0,0x11
80401cf8:	6e050513          	addi	a0,a0,1760 # 804133d4 <commands+0x9a8>
80401cfc:	929fe0ef          	jal	ra,80400624 <__panic>
80401d00:	00012697          	auipc	a3,0x12
80401d04:	84468693          	addi	a3,a3,-1980 # 80413544 <commands+0xb18>
80401d08:	00011617          	auipc	a2,0x11
80401d0c:	ee060613          	addi	a2,a2,-288 # 80412be8 <commands+0x1bc>
80401d10:	0d900593          	li	a1,217
80401d14:	00011517          	auipc	a0,0x11
80401d18:	6c050513          	addi	a0,a0,1728 # 804133d4 <commands+0x9a8>
80401d1c:	909fe0ef          	jal	ra,80400624 <__panic>
80401d20:	00011697          	auipc	a3,0x11
80401d24:	6e868693          	addi	a3,a3,1768 # 80413408 <commands+0x9dc>
80401d28:	00011617          	auipc	a2,0x11
80401d2c:	ec060613          	addi	a2,a2,-320 # 80412be8 <commands+0x1bc>
80401d30:	0d200593          	li	a1,210
80401d34:	00011517          	auipc	a0,0x11
80401d38:	6a050513          	addi	a0,a0,1696 # 804133d4 <commands+0x9a8>
80401d3c:	8e9fe0ef          	jal	ra,80400624 <__panic>
80401d40:	00011697          	auipc	a3,0x11
80401d44:	7f468693          	addi	a3,a3,2036 # 80413534 <commands+0xb08>
80401d48:	00011617          	auipc	a2,0x11
80401d4c:	ea060613          	addi	a2,a2,-352 # 80412be8 <commands+0x1bc>
80401d50:	0d000593          	li	a1,208
80401d54:	00011517          	auipc	a0,0x11
80401d58:	68050513          	addi	a0,a0,1664 # 804133d4 <commands+0x9a8>
80401d5c:	8c9fe0ef          	jal	ra,80400624 <__panic>
80401d60:	00011697          	auipc	a3,0x11
80401d64:	7bc68693          	addi	a3,a3,1980 # 8041351c <commands+0xaf0>
80401d68:	00011617          	auipc	a2,0x11
80401d6c:	e8060613          	addi	a2,a2,-384 # 80412be8 <commands+0x1bc>
80401d70:	0cb00593          	li	a1,203
80401d74:	00011517          	auipc	a0,0x11
80401d78:	66050513          	addi	a0,a0,1632 # 804133d4 <commands+0x9a8>
80401d7c:	8a9fe0ef          	jal	ra,80400624 <__panic>
80401d80:	00011697          	auipc	a3,0x11
80401d84:	77c68693          	addi	a3,a3,1916 # 804134fc <commands+0xad0>
80401d88:	00011617          	auipc	a2,0x11
80401d8c:	e6060613          	addi	a2,a2,-416 # 80412be8 <commands+0x1bc>
80401d90:	0c200593          	li	a1,194
80401d94:	00011517          	auipc	a0,0x11
80401d98:	64050513          	addi	a0,a0,1600 # 804133d4 <commands+0x9a8>
80401d9c:	889fe0ef          	jal	ra,80400624 <__panic>
80401da0:	00011697          	auipc	a3,0x11
80401da4:	7e868693          	addi	a3,a3,2024 # 80413588 <commands+0xb5c>
80401da8:	00011617          	auipc	a2,0x11
80401dac:	e4060613          	addi	a2,a2,-448 # 80412be8 <commands+0x1bc>
80401db0:	0f800593          	li	a1,248
80401db4:	00011517          	auipc	a0,0x11
80401db8:	62050513          	addi	a0,a0,1568 # 804133d4 <commands+0x9a8>
80401dbc:	869fe0ef          	jal	ra,80400624 <__panic>
80401dc0:	00011697          	auipc	a3,0x11
80401dc4:	7b868693          	addi	a3,a3,1976 # 80413578 <commands+0xb4c>
80401dc8:	00011617          	auipc	a2,0x11
80401dcc:	e2060613          	addi	a2,a2,-480 # 80412be8 <commands+0x1bc>
80401dd0:	0df00593          	li	a1,223
80401dd4:	00011517          	auipc	a0,0x11
80401dd8:	60050513          	addi	a0,a0,1536 # 804133d4 <commands+0x9a8>
80401ddc:	849fe0ef          	jal	ra,80400624 <__panic>
80401de0:	00011697          	auipc	a3,0x11
80401de4:	73c68693          	addi	a3,a3,1852 # 8041351c <commands+0xaf0>
80401de8:	00011617          	auipc	a2,0x11
80401dec:	e0060613          	addi	a2,a2,-512 # 80412be8 <commands+0x1bc>
80401df0:	0dd00593          	li	a1,221
80401df4:	00011517          	auipc	a0,0x11
80401df8:	5e050513          	addi	a0,a0,1504 # 804133d4 <commands+0x9a8>
80401dfc:	829fe0ef          	jal	ra,80400624 <__panic>
80401e00:	00011697          	auipc	a3,0x11
80401e04:	75c68693          	addi	a3,a3,1884 # 8041355c <commands+0xb30>
80401e08:	00011617          	auipc	a2,0x11
80401e0c:	de060613          	addi	a2,a2,-544 # 80412be8 <commands+0x1bc>
80401e10:	0dc00593          	li	a1,220
80401e14:	00011517          	auipc	a0,0x11
80401e18:	5c050513          	addi	a0,a0,1472 # 804133d4 <commands+0x9a8>
80401e1c:	809fe0ef          	jal	ra,80400624 <__panic>
80401e20:	00011697          	auipc	a3,0x11
80401e24:	5e868693          	addi	a3,a3,1512 # 80413408 <commands+0x9dc>
80401e28:	00011617          	auipc	a2,0x11
80401e2c:	dc060613          	addi	a2,a2,-576 # 80412be8 <commands+0x1bc>
80401e30:	0b900593          	li	a1,185
80401e34:	00011517          	auipc	a0,0x11
80401e38:	5a050513          	addi	a0,a0,1440 # 804133d4 <commands+0x9a8>
80401e3c:	fe8fe0ef          	jal	ra,80400624 <__panic>
80401e40:	00011697          	auipc	a3,0x11
80401e44:	6dc68693          	addi	a3,a3,1756 # 8041351c <commands+0xaf0>
80401e48:	00011617          	auipc	a2,0x11
80401e4c:	da060613          	addi	a2,a2,-608 # 80412be8 <commands+0x1bc>
80401e50:	0d600593          	li	a1,214
80401e54:	00011517          	auipc	a0,0x11
80401e58:	58050513          	addi	a0,a0,1408 # 804133d4 <commands+0x9a8>
80401e5c:	fc8fe0ef          	jal	ra,80400624 <__panic>
80401e60:	00011697          	auipc	a3,0x11
80401e64:	5e068693          	addi	a3,a3,1504 # 80413440 <commands+0xa14>
80401e68:	00011617          	auipc	a2,0x11
80401e6c:	d8060613          	addi	a2,a2,-640 # 80412be8 <commands+0x1bc>
80401e70:	0d400593          	li	a1,212
80401e74:	00011517          	auipc	a0,0x11
80401e78:	56050513          	addi	a0,a0,1376 # 804133d4 <commands+0x9a8>
80401e7c:	fa8fe0ef          	jal	ra,80400624 <__panic>
80401e80:	00011697          	auipc	a3,0x11
80401e84:	5a468693          	addi	a3,a3,1444 # 80413424 <commands+0x9f8>
80401e88:	00011617          	auipc	a2,0x11
80401e8c:	d6060613          	addi	a2,a2,-672 # 80412be8 <commands+0x1bc>
80401e90:	0d300593          	li	a1,211
80401e94:	00011517          	auipc	a0,0x11
80401e98:	54050513          	addi	a0,a0,1344 # 804133d4 <commands+0x9a8>
80401e9c:	f88fe0ef          	jal	ra,80400624 <__panic>
80401ea0:	00011697          	auipc	a3,0x11
80401ea4:	5a068693          	addi	a3,a3,1440 # 80413440 <commands+0xa14>
80401ea8:	00011617          	auipc	a2,0x11
80401eac:	d4060613          	addi	a2,a2,-704 # 80412be8 <commands+0x1bc>
80401eb0:	0bb00593          	li	a1,187
80401eb4:	00011517          	auipc	a0,0x11
80401eb8:	52050513          	addi	a0,a0,1312 # 804133d4 <commands+0x9a8>
80401ebc:	f68fe0ef          	jal	ra,80400624 <__panic>
80401ec0:	00012697          	auipc	a3,0x12
80401ec4:	80c68693          	addi	a3,a3,-2036 # 804136cc <commands+0xca0>
80401ec8:	00011617          	auipc	a2,0x11
80401ecc:	d2060613          	addi	a2,a2,-736 # 80412be8 <commands+0x1bc>
80401ed0:	12500593          	li	a1,293
80401ed4:	00011517          	auipc	a0,0x11
80401ed8:	50050513          	addi	a0,a0,1280 # 804133d4 <commands+0x9a8>
80401edc:	f48fe0ef          	jal	ra,80400624 <__panic>
80401ee0:	00011697          	auipc	a3,0x11
80401ee4:	69868693          	addi	a3,a3,1688 # 80413578 <commands+0xb4c>
80401ee8:	00011617          	auipc	a2,0x11
80401eec:	d0060613          	addi	a2,a2,-768 # 80412be8 <commands+0x1bc>
80401ef0:	11a00593          	li	a1,282
80401ef4:	00011517          	auipc	a0,0x11
80401ef8:	4e050513          	addi	a0,a0,1248 # 804133d4 <commands+0x9a8>
80401efc:	f28fe0ef          	jal	ra,80400624 <__panic>
80401f00:	00011697          	auipc	a3,0x11
80401f04:	61c68693          	addi	a3,a3,1564 # 8041351c <commands+0xaf0>
80401f08:	00011617          	auipc	a2,0x11
80401f0c:	ce060613          	addi	a2,a2,-800 # 80412be8 <commands+0x1bc>
80401f10:	11800593          	li	a1,280
80401f14:	00011517          	auipc	a0,0x11
80401f18:	4c050513          	addi	a0,a0,1216 # 804133d4 <commands+0x9a8>
80401f1c:	f08fe0ef          	jal	ra,80400624 <__panic>
80401f20:	00011697          	auipc	a3,0x11
80401f24:	5bc68693          	addi	a3,a3,1468 # 804134dc <commands+0xab0>
80401f28:	00011617          	auipc	a2,0x11
80401f2c:	cc060613          	addi	a2,a2,-832 # 80412be8 <commands+0x1bc>
80401f30:	0c100593          	li	a1,193
80401f34:	00011517          	auipc	a0,0x11
80401f38:	4a050513          	addi	a0,a0,1184 # 804133d4 <commands+0x9a8>
80401f3c:	ee8fe0ef          	jal	ra,80400624 <__panic>
80401f40:	00011697          	auipc	a3,0x11
80401f44:	74c68693          	addi	a3,a3,1868 # 8041368c <commands+0xc60>
80401f48:	00011617          	auipc	a2,0x11
80401f4c:	ca060613          	addi	a2,a2,-864 # 80412be8 <commands+0x1bc>
80401f50:	11200593          	li	a1,274
80401f54:	00011517          	auipc	a0,0x11
80401f58:	48050513          	addi	a0,a0,1152 # 804133d4 <commands+0x9a8>
80401f5c:	ec8fe0ef          	jal	ra,80400624 <__panic>
80401f60:	00011697          	auipc	a3,0x11
80401f64:	70c68693          	addi	a3,a3,1804 # 8041366c <commands+0xc40>
80401f68:	00011617          	auipc	a2,0x11
80401f6c:	c8060613          	addi	a2,a2,-896 # 80412be8 <commands+0x1bc>
80401f70:	11000593          	li	a1,272
80401f74:	00011517          	auipc	a0,0x11
80401f78:	46050513          	addi	a0,a0,1120 # 804133d4 <commands+0x9a8>
80401f7c:	ea8fe0ef          	jal	ra,80400624 <__panic>
80401f80:	00011697          	auipc	a3,0x11
80401f84:	6c468693          	addi	a3,a3,1732 # 80413644 <commands+0xc18>
80401f88:	00011617          	auipc	a2,0x11
80401f8c:	c6060613          	addi	a2,a2,-928 # 80412be8 <commands+0x1bc>
80401f90:	10e00593          	li	a1,270
80401f94:	00011517          	auipc	a0,0x11
80401f98:	44050513          	addi	a0,a0,1088 # 804133d4 <commands+0x9a8>
80401f9c:	e88fe0ef          	jal	ra,80400624 <__panic>
80401fa0:	00011697          	auipc	a3,0x11
80401fa4:	67c68693          	addi	a3,a3,1660 # 8041361c <commands+0xbf0>
80401fa8:	00011617          	auipc	a2,0x11
80401fac:	c4060613          	addi	a2,a2,-960 # 80412be8 <commands+0x1bc>
80401fb0:	10d00593          	li	a1,269
80401fb4:	00011517          	auipc	a0,0x11
80401fb8:	42050513          	addi	a0,a0,1056 # 804133d4 <commands+0x9a8>
80401fbc:	e68fe0ef          	jal	ra,80400624 <__panic>
80401fc0:	00011697          	auipc	a3,0x11
80401fc4:	64c68693          	addi	a3,a3,1612 # 8041360c <commands+0xbe0>
80401fc8:	00011617          	auipc	a2,0x11
80401fcc:	c2060613          	addi	a2,a2,-992 # 80412be8 <commands+0x1bc>
80401fd0:	10800593          	li	a1,264
80401fd4:	00011517          	auipc	a0,0x11
80401fd8:	40050513          	addi	a0,a0,1024 # 804133d4 <commands+0x9a8>
80401fdc:	e48fe0ef          	jal	ra,80400624 <__panic>
80401fe0:	00011697          	auipc	a3,0x11
80401fe4:	53c68693          	addi	a3,a3,1340 # 8041351c <commands+0xaf0>
80401fe8:	00011617          	auipc	a2,0x11
80401fec:	c0060613          	addi	a2,a2,-1024 # 80412be8 <commands+0x1bc>
80401ff0:	10700593          	li	a1,263
80401ff4:	00011517          	auipc	a0,0x11
80401ff8:	3e050513          	addi	a0,a0,992 # 804133d4 <commands+0x9a8>
80401ffc:	e28fe0ef          	jal	ra,80400624 <__panic>
80402000:	00011697          	auipc	a3,0x11
80402004:	5ec68693          	addi	a3,a3,1516 # 804135ec <commands+0xbc0>
80402008:	00011617          	auipc	a2,0x11
8040200c:	be060613          	addi	a2,a2,-1056 # 80412be8 <commands+0x1bc>
80402010:	10600593          	li	a1,262
80402014:	00011517          	auipc	a0,0x11
80402018:	3c050513          	addi	a0,a0,960 # 804133d4 <commands+0x9a8>
8040201c:	e08fe0ef          	jal	ra,80400624 <__panic>
80402020:	00011697          	auipc	a3,0x11
80402024:	5a068693          	addi	a3,a3,1440 # 804135c0 <commands+0xb94>
80402028:	00011617          	auipc	a2,0x11
8040202c:	bc060613          	addi	a2,a2,-1088 # 80412be8 <commands+0x1bc>
80402030:	10500593          	li	a1,261
80402034:	00011517          	auipc	a0,0x11
80402038:	3a050513          	addi	a0,a0,928 # 804133d4 <commands+0x9a8>
8040203c:	de8fe0ef          	jal	ra,80400624 <__panic>
80402040:	00011697          	auipc	a3,0x11
80402044:	56868693          	addi	a3,a3,1384 # 804135a8 <commands+0xb7c>
80402048:	00011617          	auipc	a2,0x11
8040204c:	ba060613          	addi	a2,a2,-1120 # 80412be8 <commands+0x1bc>
80402050:	10400593          	li	a1,260
80402054:	00011517          	auipc	a0,0x11
80402058:	38050513          	addi	a0,a0,896 # 804133d4 <commands+0x9a8>
8040205c:	dc8fe0ef          	jal	ra,80400624 <__panic>
80402060:	00011697          	auipc	a3,0x11
80402064:	4bc68693          	addi	a3,a3,1212 # 8041351c <commands+0xaf0>
80402068:	00011617          	auipc	a2,0x11
8040206c:	b8060613          	addi	a2,a2,-1152 # 80412be8 <commands+0x1bc>
80402070:	0fe00593          	li	a1,254
80402074:	00011517          	auipc	a0,0x11
80402078:	36050513          	addi	a0,a0,864 # 804133d4 <commands+0x9a8>
8040207c:	da8fe0ef          	jal	ra,80400624 <__panic>
80402080:	00011697          	auipc	a3,0x11
80402084:	51468693          	addi	a3,a3,1300 # 80413594 <commands+0xb68>
80402088:	00011617          	auipc	a2,0x11
8040208c:	b6060613          	addi	a2,a2,-1184 # 80412be8 <commands+0x1bc>
80402090:	0f900593          	li	a1,249
80402094:	00011517          	auipc	a0,0x11
80402098:	34050513          	addi	a0,a0,832 # 804133d4 <commands+0x9a8>
8040209c:	d88fe0ef          	jal	ra,80400624 <__panic>
804020a0:	00011697          	auipc	a3,0x11
804020a4:	60c68693          	addi	a3,a3,1548 # 804136ac <commands+0xc80>
804020a8:	00011617          	auipc	a2,0x11
804020ac:	b4060613          	addi	a2,a2,-1216 # 80412be8 <commands+0x1bc>
804020b0:	11700593          	li	a1,279
804020b4:	00011517          	auipc	a0,0x11
804020b8:	32050513          	addi	a0,a0,800 # 804133d4 <commands+0x9a8>
804020bc:	d68fe0ef          	jal	ra,80400624 <__panic>
804020c0:	00011697          	auipc	a3,0x11
804020c4:	61868693          	addi	a3,a3,1560 # 804136d8 <commands+0xcac>
804020c8:	00011617          	auipc	a2,0x11
804020cc:	b2060613          	addi	a2,a2,-1248 # 80412be8 <commands+0x1bc>
804020d0:	12600593          	li	a1,294
804020d4:	00011517          	auipc	a0,0x11
804020d8:	30050513          	addi	a0,a0,768 # 804133d4 <commands+0x9a8>
804020dc:	d48fe0ef          	jal	ra,80400624 <__panic>
804020e0:	00011697          	auipc	a3,0x11
804020e4:	30c68693          	addi	a3,a3,780 # 804133ec <commands+0x9c0>
804020e8:	00011617          	auipc	a2,0x11
804020ec:	b0060613          	addi	a2,a2,-1280 # 80412be8 <commands+0x1bc>
804020f0:	0f300593          	li	a1,243
804020f4:	00011517          	auipc	a0,0x11
804020f8:	2e050513          	addi	a0,a0,736 # 804133d4 <commands+0x9a8>
804020fc:	d28fe0ef          	jal	ra,80400624 <__panic>
80402100:	00011697          	auipc	a3,0x11
80402104:	32468693          	addi	a3,a3,804 # 80413424 <commands+0x9f8>
80402108:	00011617          	auipc	a2,0x11
8040210c:	ae060613          	addi	a2,a2,-1312 # 80412be8 <commands+0x1bc>
80402110:	0ba00593          	li	a1,186
80402114:	00011517          	auipc	a0,0x11
80402118:	2c050513          	addi	a0,a0,704 # 804133d4 <commands+0x9a8>
8040211c:	d08fe0ef          	jal	ra,80400624 <__panic>

80402120 <default_free_pages>:
80402120:	ff010113          	addi	sp,sp,-16
80402124:	00112623          	sw	ra,12(sp)
80402128:	1e058863          	beqz	a1,80402318 <default_free_pages+0x1f8>
8040212c:	00559693          	slli	a3,a1,0x5
80402130:	00d506b3          	add	a3,a0,a3
80402134:	04d50863          	beq	a0,a3,80402184 <default_free_pages+0x64>
80402138:	00452783          	lw	a5,4(a0)
8040213c:	0017f793          	andi	a5,a5,1
80402140:	1a079c63          	bnez	a5,804022f8 <default_free_pages+0x1d8>
80402144:	00452783          	lw	a5,4(a0)
80402148:	0017d793          	srli	a5,a5,0x1
8040214c:	0017f793          	andi	a5,a5,1
80402150:	1a079463          	bnez	a5,804022f8 <default_free_pages+0x1d8>
80402154:	00050793          	mv	a5,a0
80402158:	01c0006f          	j	80402174 <default_free_pages+0x54>
8040215c:	0047a703          	lw	a4,4(a5)
80402160:	00177713          	andi	a4,a4,1
80402164:	18071a63          	bnez	a4,804022f8 <default_free_pages+0x1d8>
80402168:	0047a703          	lw	a4,4(a5)
8040216c:	00277713          	andi	a4,a4,2
80402170:	18071463          	bnez	a4,804022f8 <default_free_pages+0x1d8>
80402174:	0007a223          	sw	zero,4(a5)
80402178:	0007a023          	sw	zero,0(a5)
8040217c:	02078793          	addi	a5,a5,32
80402180:	fcd79ee3          	bne	a5,a3,8040215c <default_free_pages+0x3c>
80402184:	00452703          	lw	a4,4(a0)
80402188:	0009a697          	auipc	a3,0x9a
8040218c:	66868693          	addi	a3,a3,1640 # 8049c7f0 <free_area>
80402190:	0046a783          	lw	a5,4(a3)
80402194:	00276713          	ori	a4,a4,2
80402198:	00e52223          	sw	a4,4(a0)
8040219c:	0086a703          	lw	a4,8(a3)
804021a0:	00b52423          	sw	a1,8(a0)
804021a4:	00b70733          	add	a4,a4,a1
804021a8:	0009a617          	auipc	a2,0x9a
804021ac:	64e62823          	sw	a4,1616(a2) # 8049c7f8 <free_area+0x8>
804021b0:	0ed78a63          	beq	a5,a3,804022a4 <default_free_pages+0x184>
804021b4:	ff478713          	addi	a4,a5,-12
804021b8:	0006a803          	lw	a6,0(a3)
804021bc:	00000893          	li	a7,0
804021c0:	00c50613          	addi	a2,a0,12
804021c4:	00e56c63          	bltu	a0,a4,804021dc <default_free_pages+0xbc>
804021c8:	0047a703          	lw	a4,4(a5)
804021cc:	06d70663          	beq	a4,a3,80402238 <default_free_pages+0x118>
804021d0:	00070793          	mv	a5,a4
804021d4:	ff478713          	addi	a4,a5,-12
804021d8:	fee578e3          	bgeu	a0,a4,804021c8 <default_free_pages+0xa8>
804021dc:	00088663          	beqz	a7,804021e8 <default_free_pages+0xc8>
804021e0:	0009a897          	auipc	a7,0x9a
804021e4:	6108a823          	sw	a6,1552(a7) # 8049c7f0 <free_area>
804021e8:	0007a803          	lw	a6,0(a5)
804021ec:	00c7a023          	sw	a2,0(a5)
804021f0:	00c82223          	sw	a2,4(a6)
804021f4:	00f52823          	sw	a5,16(a0)
804021f8:	01052623          	sw	a6,12(a0)
804021fc:	08d80663          	beq	a6,a3,80402288 <default_free_pages+0x168>
80402200:	ffc82883          	lw	a7,-4(a6)
80402204:	ff480613          	addi	a2,a6,-12
80402208:	00589713          	slli	a4,a7,0x5
8040220c:	00e60733          	add	a4,a2,a4
80402210:	06e51863          	bne	a0,a4,80402280 <default_free_pages+0x160>
80402214:	011585b3          	add	a1,a1,a7
80402218:	feb82e23          	sw	a1,-4(a6)
8040221c:	00452703          	lw	a4,4(a0)
80402220:	ffd77713          	andi	a4,a4,-3
80402224:	00e52223          	sw	a4,4(a0)
80402228:	00f82223          	sw	a5,4(a6)
8040222c:	0107a023          	sw	a6,0(a5)
80402230:	00060513          	mv	a0,a2
80402234:	04c0006f          	j	80402280 <default_free_pages+0x160>
80402238:	00c7a223          	sw	a2,4(a5)
8040223c:	00d52823          	sw	a3,16(a0)
80402240:	0047a703          	lw	a4,4(a5)
80402244:	00f52623          	sw	a5,12(a0)
80402248:	00060813          	mv	a6,a2
8040224c:	00d70863          	beq	a4,a3,8040225c <default_free_pages+0x13c>
80402250:	00100893          	li	a7,1
80402254:	00070793          	mv	a5,a4
80402258:	f7dff06f          	j	804021d4 <default_free_pages+0xb4>
8040225c:	00078813          	mv	a6,a5
80402260:	00c6a023          	sw	a2,0(a3)
80402264:	00068793          	mv	a5,a3
80402268:	00d80c63          	beq	a6,a3,80402280 <default_free_pages+0x160>
8040226c:	ffc82883          	lw	a7,-4(a6)
80402270:	ff480613          	addi	a2,a6,-12
80402274:	00589713          	slli	a4,a7,0x5
80402278:	00e60733          	add	a4,a2,a4
8040227c:	f8e50ce3          	beq	a0,a4,80402214 <default_free_pages+0xf4>
80402280:	ff478713          	addi	a4,a5,-12
80402284:	00d78a63          	beq	a5,a3,80402298 <default_free_pages+0x178>
80402288:	00852603          	lw	a2,8(a0)
8040228c:	00561693          	slli	a3,a2,0x5
80402290:	00d506b3          	add	a3,a0,a3
80402294:	02d70863          	beq	a4,a3,804022c4 <default_free_pages+0x1a4>
80402298:	00c12083          	lw	ra,12(sp)
8040229c:	01010113          	addi	sp,sp,16
804022a0:	00008067          	ret
804022a4:	00c12083          	lw	ra,12(sp)
804022a8:	00c50713          	addi	a4,a0,12
804022ac:	00e7a023          	sw	a4,0(a5)
804022b0:	00e7a223          	sw	a4,4(a5)
804022b4:	00f52823          	sw	a5,16(a0)
804022b8:	00f52623          	sw	a5,12(a0)
804022bc:	01010113          	addi	sp,sp,16
804022c0:	00008067          	ret
804022c4:	ffc7a703          	lw	a4,-4(a5)
804022c8:	0007a583          	lw	a1,0(a5)
804022cc:	0047a683          	lw	a3,4(a5)
804022d0:	00c70633          	add	a2,a4,a2
804022d4:	00c52423          	sw	a2,8(a0)
804022d8:	ff87a703          	lw	a4,-8(a5)
804022dc:	00c12083          	lw	ra,12(sp)
804022e0:	ffd77713          	andi	a4,a4,-3
804022e4:	fee7ac23          	sw	a4,-8(a5)
804022e8:	00d5a223          	sw	a3,4(a1)
804022ec:	00b6a023          	sw	a1,0(a3)
804022f0:	01010113          	addi	sp,sp,16
804022f4:	00008067          	ret
804022f8:	00011697          	auipc	a3,0x11
804022fc:	3ec68693          	addi	a3,a3,1004 # 804136e4 <commands+0xcb8>
80402300:	00011617          	auipc	a2,0x11
80402304:	8e860613          	addi	a2,a2,-1816 # 80412be8 <commands+0x1bc>
80402308:	08300593          	li	a1,131
8040230c:	00011517          	auipc	a0,0x11
80402310:	0c850513          	addi	a0,a0,200 # 804133d4 <commands+0x9a8>
80402314:	b10fe0ef          	jal	ra,80400624 <__panic>
80402318:	00011697          	auipc	a3,0x11
8040231c:	3f468693          	addi	a3,a3,1012 # 8041370c <commands+0xce0>
80402320:	00011617          	auipc	a2,0x11
80402324:	8c860613          	addi	a2,a2,-1848 # 80412be8 <commands+0x1bc>
80402328:	08000593          	li	a1,128
8040232c:	00011517          	auipc	a0,0x11
80402330:	0a850513          	addi	a0,a0,168 # 804133d4 <commands+0x9a8>
80402334:	af0fe0ef          	jal	ra,80400624 <__panic>

80402338 <default_alloc_pages>:
80402338:	0a050263          	beqz	a0,804023dc <default_alloc_pages+0xa4>
8040233c:	0009a617          	auipc	a2,0x9a
80402340:	4b460613          	addi	a2,a2,1204 # 8049c7f0 <free_area>
80402344:	00862583          	lw	a1,8(a2)
80402348:	00050693          	mv	a3,a0
8040234c:	00a5ee63          	bltu	a1,a0,80402368 <default_alloc_pages+0x30>
80402350:	00060793          	mv	a5,a2
80402354:	00c0006f          	j	80402360 <default_alloc_pages+0x28>
80402358:	ffc7a703          	lw	a4,-4(a5)
8040235c:	00d77a63          	bgeu	a4,a3,80402370 <default_alloc_pages+0x38>
80402360:	0047a783          	lw	a5,4(a5)
80402364:	fec79ae3          	bne	a5,a2,80402358 <default_alloc_pages+0x20>
80402368:	00000513          	li	a0,0
8040236c:	00008067          	ret
80402370:	ff478513          	addi	a0,a5,-12
80402374:	fe050ce3          	beqz	a0,8040236c <default_alloc_pages+0x34>
80402378:	0007a883          	lw	a7,0(a5)
8040237c:	0047a303          	lw	t1,4(a5)
80402380:	0068a223          	sw	t1,4(a7)
80402384:	01132023          	sw	a7,0(t1)
80402388:	02e6fc63          	bgeu	a3,a4,804023c0 <default_alloc_pages+0x88>
8040238c:	00569813          	slli	a6,a3,0x5
80402390:	01050833          	add	a6,a0,a6
80402394:	00482583          	lw	a1,4(a6)
80402398:	40d70733          	sub	a4,a4,a3
8040239c:	00e82423          	sw	a4,8(a6)
804023a0:	0025e713          	ori	a4,a1,2
804023a4:	00e82223          	sw	a4,4(a6)
804023a8:	00c80713          	addi	a4,a6,12
804023ac:	00e32023          	sw	a4,0(t1)
804023b0:	00862583          	lw	a1,8(a2)
804023b4:	00e8a223          	sw	a4,4(a7)
804023b8:	00682823          	sw	t1,16(a6)
804023bc:	01182623          	sw	a7,12(a6)
804023c0:	40d586b3          	sub	a3,a1,a3
804023c4:	0009a717          	auipc	a4,0x9a
804023c8:	42d72a23          	sw	a3,1076(a4) # 8049c7f8 <free_area+0x8>
804023cc:	ff87a703          	lw	a4,-8(a5)
804023d0:	ffd77713          	andi	a4,a4,-3
804023d4:	fee7ac23          	sw	a4,-8(a5)
804023d8:	00008067          	ret
804023dc:	ff010113          	addi	sp,sp,-16
804023e0:	00011697          	auipc	a3,0x11
804023e4:	32c68693          	addi	a3,a3,812 # 8041370c <commands+0xce0>
804023e8:	00011617          	auipc	a2,0x11
804023ec:	80060613          	addi	a2,a2,-2048 # 80412be8 <commands+0x1bc>
804023f0:	06200593          	li	a1,98
804023f4:	00011517          	auipc	a0,0x11
804023f8:	fe050513          	addi	a0,a0,-32 # 804133d4 <commands+0x9a8>
804023fc:	00112623          	sw	ra,12(sp)
80402400:	a24fe0ef          	jal	ra,80400624 <__panic>

80402404 <default_init_memmap>:
80402404:	ff010113          	addi	sp,sp,-16
80402408:	00112623          	sw	ra,12(sp)
8040240c:	12058e63          	beqz	a1,80402548 <default_init_memmap+0x144>
80402410:	00559693          	slli	a3,a1,0x5
80402414:	00d506b3          	add	a3,a0,a3
80402418:	02d50c63          	beq	a0,a3,80402450 <default_init_memmap+0x4c>
8040241c:	00452703          	lw	a4,4(a0)
80402420:	00050793          	mv	a5,a0
80402424:	00177713          	andi	a4,a4,1
80402428:	00071a63          	bnez	a4,8040243c <default_init_memmap+0x38>
8040242c:	0fc0006f          	j	80402528 <default_init_memmap+0x124>
80402430:	0047a703          	lw	a4,4(a5)
80402434:	00177713          	andi	a4,a4,1
80402438:	0e070863          	beqz	a4,80402528 <default_init_memmap+0x124>
8040243c:	0007a423          	sw	zero,8(a5)
80402440:	0007a223          	sw	zero,4(a5)
80402444:	0007a023          	sw	zero,0(a5)
80402448:	02078793          	addi	a5,a5,32
8040244c:	fed792e3          	bne	a5,a3,80402430 <default_init_memmap+0x2c>
80402450:	00452703          	lw	a4,4(a0)
80402454:	0009a697          	auipc	a3,0x9a
80402458:	39c68693          	addi	a3,a3,924 # 8049c7f0 <free_area>
8040245c:	0046a783          	lw	a5,4(a3)
80402460:	00276713          	ori	a4,a4,2
80402464:	00e52223          	sw	a4,4(a0)
80402468:	0086a703          	lw	a4,8(a3)
8040246c:	00b52423          	sw	a1,8(a0)
80402470:	00b705b3          	add	a1,a4,a1
80402474:	0009a717          	auipc	a4,0x9a
80402478:	38b72223          	sw	a1,900(a4) # 8049c7f8 <free_area+0x8>
8040247c:	06d78e63          	beq	a5,a3,804024f8 <default_init_memmap+0xf4>
80402480:	ff478713          	addi	a4,a5,-12
80402484:	0006a583          	lw	a1,0(a3)
80402488:	00000813          	li	a6,0
8040248c:	00c50613          	addi	a2,a0,12
80402490:	00e56c63          	bltu	a0,a4,804024a8 <default_init_memmap+0xa4>
80402494:	0047a703          	lw	a4,4(a5)
80402498:	02d70e63          	beq	a4,a3,804024d4 <default_init_memmap+0xd0>
8040249c:	00070793          	mv	a5,a4
804024a0:	ff478713          	addi	a4,a5,-12
804024a4:	fee578e3          	bgeu	a0,a4,80402494 <default_init_memmap+0x90>
804024a8:	00080663          	beqz	a6,804024b4 <default_init_memmap+0xb0>
804024ac:	0009a717          	auipc	a4,0x9a
804024b0:	34b72223          	sw	a1,836(a4) # 8049c7f0 <free_area>
804024b4:	0007a703          	lw	a4,0(a5)
804024b8:	00c12083          	lw	ra,12(sp)
804024bc:	00c7a023          	sw	a2,0(a5)
804024c0:	00c72223          	sw	a2,4(a4)
804024c4:	00f52823          	sw	a5,16(a0)
804024c8:	00e52623          	sw	a4,12(a0)
804024cc:	01010113          	addi	sp,sp,16
804024d0:	00008067          	ret
804024d4:	00c7a223          	sw	a2,4(a5)
804024d8:	00d52823          	sw	a3,16(a0)
804024dc:	0047a703          	lw	a4,4(a5)
804024e0:	00f52623          	sw	a5,12(a0)
804024e4:	00060593          	mv	a1,a2
804024e8:	02d70863          	beq	a4,a3,80402518 <default_init_memmap+0x114>
804024ec:	00100813          	li	a6,1
804024f0:	00070793          	mv	a5,a4
804024f4:	fadff06f          	j	804024a0 <default_init_memmap+0x9c>
804024f8:	00c12083          	lw	ra,12(sp)
804024fc:	00c50713          	addi	a4,a0,12
80402500:	00e7a023          	sw	a4,0(a5)
80402504:	00e7a223          	sw	a4,4(a5)
80402508:	00f52823          	sw	a5,16(a0)
8040250c:	00f52623          	sw	a5,12(a0)
80402510:	01010113          	addi	sp,sp,16
80402514:	00008067          	ret
80402518:	00c12083          	lw	ra,12(sp)
8040251c:	00c6a023          	sw	a2,0(a3)
80402520:	01010113          	addi	sp,sp,16
80402524:	00008067          	ret
80402528:	00011697          	auipc	a3,0x11
8040252c:	1ec68693          	addi	a3,a3,492 # 80413714 <commands+0xce8>
80402530:	00010617          	auipc	a2,0x10
80402534:	6b860613          	addi	a2,a2,1720 # 80412be8 <commands+0x1bc>
80402538:	04900593          	li	a1,73
8040253c:	00011517          	auipc	a0,0x11
80402540:	e9850513          	addi	a0,a0,-360 # 804133d4 <commands+0x9a8>
80402544:	8e0fe0ef          	jal	ra,80400624 <__panic>
80402548:	00011697          	auipc	a3,0x11
8040254c:	1c468693          	addi	a3,a3,452 # 8041370c <commands+0xce0>
80402550:	00010617          	auipc	a2,0x10
80402554:	69860613          	addi	a2,a2,1688 # 80412be8 <commands+0x1bc>
80402558:	04600593          	li	a1,70
8040255c:	00011517          	auipc	a0,0x11
80402560:	e7850513          	addi	a0,a0,-392 # 804133d4 <commands+0x9a8>
80402564:	8c0fe0ef          	jal	ra,80400624 <__panic>

80402568 <slob_free>:
80402568:	08050063          	beqz	a0,804025e8 <slob_free+0x80>
8040256c:	08059063          	bnez	a1,804025ec <slob_free+0x84>
80402570:	100027f3          	csrr	a5,sstatus
80402574:	0027f793          	andi	a5,a5,2
80402578:	00000593          	li	a1,0
8040257c:	08079663          	bnez	a5,80402608 <slob_free+0xa0>
80402580:	00097797          	auipc	a5,0x97
80402584:	ac078793          	addi	a5,a5,-1344 # 80499040 <slobfree>
80402588:	0007a783          	lw	a5,0(a5)
8040258c:	0047a703          	lw	a4,4(a5)
80402590:	00a7fc63          	bgeu	a5,a0,804025a8 <slob_free+0x40>
80402594:	00e56e63          	bltu	a0,a4,804025b0 <slob_free+0x48>
80402598:	00e7fc63          	bgeu	a5,a4,804025b0 <slob_free+0x48>
8040259c:	00070793          	mv	a5,a4
804025a0:	0047a703          	lw	a4,4(a5)
804025a4:	fea7e8e3          	bltu	a5,a0,80402594 <slob_free+0x2c>
804025a8:	fee7eae3          	bltu	a5,a4,8040259c <slob_free+0x34>
804025ac:	fee578e3          	bgeu	a0,a4,8040259c <slob_free+0x34>
804025b0:	00052603          	lw	a2,0(a0)
804025b4:	00361693          	slli	a3,a2,0x3
804025b8:	00d506b3          	add	a3,a0,a3
804025bc:	0cd70a63          	beq	a4,a3,80402690 <slob_free+0x128>
804025c0:	0007a683          	lw	a3,0(a5)
804025c4:	00e52223          	sw	a4,4(a0)
804025c8:	00369713          	slli	a4,a3,0x3
804025cc:	00e78733          	add	a4,a5,a4
804025d0:	0ee50263          	beq	a0,a4,804026b4 <slob_free+0x14c>
804025d4:	00a7a223          	sw	a0,4(a5)
804025d8:	00097717          	auipc	a4,0x97
804025dc:	a6f72423          	sw	a5,-1432(a4) # 80499040 <slobfree>
804025e0:	00058463          	beqz	a1,804025e8 <slob_free+0x80>
804025e4:	e30fe06f          	j	80400c14 <intr_enable>
804025e8:	00008067          	ret
804025ec:	00758593          	addi	a1,a1,7
804025f0:	0035d593          	srli	a1,a1,0x3
804025f4:	00b52023          	sw	a1,0(a0)
804025f8:	100027f3          	csrr	a5,sstatus
804025fc:	0027f793          	andi	a5,a5,2
80402600:	00000593          	li	a1,0
80402604:	f6078ee3          	beqz	a5,80402580 <slob_free+0x18>
80402608:	fe010113          	addi	sp,sp,-32
8040260c:	00a12623          	sw	a0,12(sp)
80402610:	00112e23          	sw	ra,28(sp)
80402614:	e08fe0ef          	jal	ra,80400c1c <intr_disable>
80402618:	00097797          	auipc	a5,0x97
8040261c:	a2878793          	addi	a5,a5,-1496 # 80499040 <slobfree>
80402620:	0007a783          	lw	a5,0(a5)
80402624:	00c12503          	lw	a0,12(sp)
80402628:	00100593          	li	a1,1
8040262c:	0047a703          	lw	a4,4(a5)
80402630:	00a7fc63          	bgeu	a5,a0,80402648 <slob_free+0xe0>
80402634:	00e56e63          	bltu	a0,a4,80402650 <slob_free+0xe8>
80402638:	00e7fc63          	bgeu	a5,a4,80402650 <slob_free+0xe8>
8040263c:	00070793          	mv	a5,a4
80402640:	0047a703          	lw	a4,4(a5)
80402644:	fea7e8e3          	bltu	a5,a0,80402634 <slob_free+0xcc>
80402648:	fee7eae3          	bltu	a5,a4,8040263c <slob_free+0xd4>
8040264c:	fee578e3          	bgeu	a0,a4,8040263c <slob_free+0xd4>
80402650:	00052603          	lw	a2,0(a0)
80402654:	00361693          	slli	a3,a2,0x3
80402658:	00d506b3          	add	a3,a0,a3
8040265c:	06d70e63          	beq	a4,a3,804026d8 <slob_free+0x170>
80402660:	00e52223          	sw	a4,4(a0)
80402664:	0007a683          	lw	a3,0(a5)
80402668:	00369713          	slli	a4,a3,0x3
8040266c:	00e78733          	add	a4,a5,a4
80402670:	08e50063          	beq	a0,a4,804026f0 <slob_free+0x188>
80402674:	00a7a223          	sw	a0,4(a5)
80402678:	00097717          	auipc	a4,0x97
8040267c:	9cf72423          	sw	a5,-1592(a4) # 80499040 <slobfree>
80402680:	04059663          	bnez	a1,804026cc <slob_free+0x164>
80402684:	01c12083          	lw	ra,28(sp)
80402688:	02010113          	addi	sp,sp,32
8040268c:	00008067          	ret
80402690:	00072683          	lw	a3,0(a4)
80402694:	00472703          	lw	a4,4(a4)
80402698:	00c68633          	add	a2,a3,a2
8040269c:	00c52023          	sw	a2,0(a0)
804026a0:	0007a683          	lw	a3,0(a5)
804026a4:	00e52223          	sw	a4,4(a0)
804026a8:	00369713          	slli	a4,a3,0x3
804026ac:	00e78733          	add	a4,a5,a4
804026b0:	f2e512e3          	bne	a0,a4,804025d4 <slob_free+0x6c>
804026b4:	00052703          	lw	a4,0(a0)
804026b8:	00452603          	lw	a2,4(a0)
804026bc:	00d706b3          	add	a3,a4,a3
804026c0:	00d7a023          	sw	a3,0(a5)
804026c4:	00c7a223          	sw	a2,4(a5)
804026c8:	f11ff06f          	j	804025d8 <slob_free+0x70>
804026cc:	01c12083          	lw	ra,28(sp)
804026d0:	02010113          	addi	sp,sp,32
804026d4:	d40fe06f          	j	80400c14 <intr_enable>
804026d8:	00072683          	lw	a3,0(a4)
804026dc:	00472703          	lw	a4,4(a4)
804026e0:	00c68633          	add	a2,a3,a2
804026e4:	00c52023          	sw	a2,0(a0)
804026e8:	00e52223          	sw	a4,4(a0)
804026ec:	f79ff06f          	j	80402664 <slob_free+0xfc>
804026f0:	00052703          	lw	a4,0(a0)
804026f4:	00452603          	lw	a2,4(a0)
804026f8:	00d706b3          	add	a3,a4,a3
804026fc:	00d7a023          	sw	a3,0(a5)
80402700:	00c7a223          	sw	a2,4(a5)
80402704:	f75ff06f          	j	80402678 <slob_free+0x110>

80402708 <__slob_get_free_pages.isra.0>:
80402708:	00100793          	li	a5,1
8040270c:	ff010113          	addi	sp,sp,-16
80402710:	00a79533          	sll	a0,a5,a0
80402714:	00112623          	sw	ra,12(sp)
80402718:	628000ef          	jal	ra,80402d40 <alloc_pages>
8040271c:	04050a63          	beqz	a0,80402770 <__slob_get_free_pages.isra.0+0x68>
80402720:	0009a797          	auipc	a5,0x9a
80402724:	0e878793          	addi	a5,a5,232 # 8049c808 <pages>
80402728:	0007a683          	lw	a3,0(a5)
8040272c:	00014797          	auipc	a5,0x14
80402730:	a5478793          	addi	a5,a5,-1452 # 80416180 <nbase>
80402734:	40d50533          	sub	a0,a0,a3
80402738:	0007a683          	lw	a3,0(a5)
8040273c:	40555513          	srai	a0,a0,0x5
80402740:	0009a797          	auipc	a5,0x9a
80402744:	05878793          	addi	a5,a5,88 # 8049c798 <npage>
80402748:	00d50533          	add	a0,a0,a3
8040274c:	0007a703          	lw	a4,0(a5)
80402750:	00c51793          	slli	a5,a0,0xc
80402754:	00c7d793          	srli	a5,a5,0xc
80402758:	00c51513          	slli	a0,a0,0xc
8040275c:	02e7f063          	bgeu	a5,a4,8040277c <__slob_get_free_pages.isra.0+0x74>
80402760:	0009a797          	auipc	a5,0x9a
80402764:	0a078793          	addi	a5,a5,160 # 8049c800 <va_pa_offset>
80402768:	0007a683          	lw	a3,0(a5)
8040276c:	00d50533          	add	a0,a0,a3
80402770:	00c12083          	lw	ra,12(sp)
80402774:	01010113          	addi	sp,sp,16
80402778:	00008067          	ret
8040277c:	00050693          	mv	a3,a0
80402780:	00011617          	auipc	a2,0x11
80402784:	fd460613          	addi	a2,a2,-44 # 80413754 <default_pmm_manager+0x30>
80402788:	06e00593          	li	a1,110
8040278c:	00011517          	auipc	a0,0x11
80402790:	fec50513          	addi	a0,a0,-20 # 80413778 <default_pmm_manager+0x54>
80402794:	e91fd0ef          	jal	ra,80400624 <__panic>

80402798 <slob_alloc.isra.1.constprop.3>:
80402798:	fe010113          	addi	sp,sp,-32
8040279c:	00112e23          	sw	ra,28(sp)
804027a0:	00812c23          	sw	s0,24(sp)
804027a4:	00912a23          	sw	s1,20(sp)
804027a8:	01212823          	sw	s2,16(sp)
804027ac:	01312623          	sw	s3,12(sp)
804027b0:	00850713          	addi	a4,a0,8
804027b4:	000017b7          	lui	a5,0x1
804027b8:	12f77a63          	bgeu	a4,a5,804028ec <slob_alloc.isra.1.constprop.3+0x154>
804027bc:	00750993          	addi	s3,a0,7
804027c0:	0039d913          	srli	s2,s3,0x3
804027c4:	10002673          	csrr	a2,sstatus
804027c8:	00267613          	andi	a2,a2,2
804027cc:	10061463          	bnez	a2,804028d4 <slob_alloc.isra.1.constprop.3+0x13c>
804027d0:	00097497          	auipc	s1,0x97
804027d4:	87048493          	addi	s1,s1,-1936 # 80499040 <slobfree>
804027d8:	0004a683          	lw	a3,0(s1)
804027dc:	0046a783          	lw	a5,4(a3)
804027e0:	0007a703          	lw	a4,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
804027e4:	0f275e63          	bge	a4,s2,804028e0 <slob_alloc.isra.1.constprop.3+0x148>
804027e8:	00d78e63          	beq	a5,a3,80402804 <slob_alloc.isra.1.constprop.3+0x6c>
804027ec:	0047a403          	lw	s0,4(a5)
804027f0:	00042703          	lw	a4,0(s0)
804027f4:	05275463          	bge	a4,s2,8040283c <slob_alloc.isra.1.constprop.3+0xa4>
804027f8:	0004a683          	lw	a3,0(s1)
804027fc:	00040793          	mv	a5,s0
80402800:	fed796e3          	bne	a5,a3,804027ec <slob_alloc.isra.1.constprop.3+0x54>
80402804:	08061c63          	bnez	a2,8040289c <slob_alloc.isra.1.constprop.3+0x104>
80402808:	00000513          	li	a0,0
8040280c:	efdff0ef          	jal	ra,80402708 <__slob_get_free_pages.isra.0>
80402810:	00050413          	mv	s0,a0
80402814:	04050c63          	beqz	a0,8040286c <slob_alloc.isra.1.constprop.3+0xd4>
80402818:	000015b7          	lui	a1,0x1
8040281c:	d4dff0ef          	jal	ra,80402568 <slob_free>
80402820:	10002673          	csrr	a2,sstatus
80402824:	00267613          	andi	a2,a2,2
80402828:	06061263          	bnez	a2,8040288c <slob_alloc.isra.1.constprop.3+0xf4>
8040282c:	0004a783          	lw	a5,0(s1)
80402830:	0047a403          	lw	s0,4(a5)
80402834:	00042703          	lw	a4,0(s0)
80402838:	fd2740e3          	blt	a4,s2,804027f8 <slob_alloc.isra.1.constprop.3+0x60>
8040283c:	08e90663          	beq	s2,a4,804028c8 <slob_alloc.isra.1.constprop.3+0x130>
80402840:	ff89f513          	andi	a0,s3,-8
80402844:	00a40533          	add	a0,s0,a0
80402848:	00a7a223          	sw	a0,4(a5)
8040284c:	00442683          	lw	a3,4(s0)
80402850:	41270733          	sub	a4,a4,s2
80402854:	00e52023          	sw	a4,0(a0)
80402858:	00d52223          	sw	a3,4(a0)
8040285c:	01242023          	sw	s2,0(s0)
80402860:	00096717          	auipc	a4,0x96
80402864:	7ef72023          	sw	a5,2016(a4) # 80499040 <slobfree>
80402868:	02061e63          	bnez	a2,804028a4 <slob_alloc.isra.1.constprop.3+0x10c>
8040286c:	00040513          	mv	a0,s0
80402870:	01c12083          	lw	ra,28(sp)
80402874:	01812403          	lw	s0,24(sp)
80402878:	01412483          	lw	s1,20(sp)
8040287c:	01012903          	lw	s2,16(sp)
80402880:	00c12983          	lw	s3,12(sp)
80402884:	02010113          	addi	sp,sp,32
80402888:	00008067          	ret
8040288c:	b90fe0ef          	jal	ra,80400c1c <intr_disable>
80402890:	00100613          	li	a2,1
80402894:	0004a783          	lw	a5,0(s1)
80402898:	f99ff06f          	j	80402830 <slob_alloc.isra.1.constprop.3+0x98>
8040289c:	b78fe0ef          	jal	ra,80400c14 <intr_enable>
804028a0:	f69ff06f          	j	80402808 <slob_alloc.isra.1.constprop.3+0x70>
804028a4:	b70fe0ef          	jal	ra,80400c14 <intr_enable>
804028a8:	00040513          	mv	a0,s0
804028ac:	01c12083          	lw	ra,28(sp)
804028b0:	01812403          	lw	s0,24(sp)
804028b4:	01412483          	lw	s1,20(sp)
804028b8:	01012903          	lw	s2,16(sp)
804028bc:	00c12983          	lw	s3,12(sp)
804028c0:	02010113          	addi	sp,sp,32
804028c4:	00008067          	ret
804028c8:	00442703          	lw	a4,4(s0)
804028cc:	00e7a223          	sw	a4,4(a5)
804028d0:	f91ff06f          	j	80402860 <slob_alloc.isra.1.constprop.3+0xc8>
804028d4:	b48fe0ef          	jal	ra,80400c1c <intr_disable>
804028d8:	00100613          	li	a2,1
804028dc:	ef5ff06f          	j	804027d0 <slob_alloc.isra.1.constprop.3+0x38>
804028e0:	00078413          	mv	s0,a5
804028e4:	00068793          	mv	a5,a3
804028e8:	f55ff06f          	j	8040283c <slob_alloc.isra.1.constprop.3+0xa4>
804028ec:	00011697          	auipc	a3,0x11
804028f0:	efc68693          	addi	a3,a3,-260 # 804137e8 <default_pmm_manager+0xc4>
804028f4:	00010617          	auipc	a2,0x10
804028f8:	2f460613          	addi	a2,a2,756 # 80412be8 <commands+0x1bc>
804028fc:	06400593          	li	a1,100
80402900:	00011517          	auipc	a0,0x11
80402904:	f0850513          	addi	a0,a0,-248 # 80413808 <default_pmm_manager+0xe4>
80402908:	d1dfd0ef          	jal	ra,80400624 <__panic>

8040290c <slob_init>:
8040290c:	ff010113          	addi	sp,sp,-16
80402910:	00812423          	sw	s0,8(sp)
80402914:	00096417          	auipc	s0,0x96
80402918:	72440413          	addi	s0,s0,1828 # 80499038 <arena>
8040291c:	00096797          	auipc	a5,0x96
80402920:	7287a023          	sw	s0,1824(a5) # 8049903c <arena+0x4>
80402924:	00100793          	li	a5,1
80402928:	00011517          	auipc	a0,0x11
8040292c:	ef450513          	addi	a0,a0,-268 # 8041381c <default_pmm_manager+0xf8>
80402930:	00096717          	auipc	a4,0x96
80402934:	70f72423          	sw	a5,1800(a4) # 80499038 <arena>
80402938:	00112623          	sw	ra,12(sp)
8040293c:	00096797          	auipc	a5,0x96
80402940:	7087a223          	sw	s0,1796(a5) # 80499040 <slobfree>
80402944:	0009a797          	auipc	a5,0x9a
80402948:	e407a623          	sw	zero,-436(a5) # 8049c790 <bigblocks>
8040294c:	8b1fd0ef          	jal	ra,804001fc <cprintf>
80402950:	00442603          	lw	a2,4(s0)
80402954:	00042683          	lw	a3,0(s0)
80402958:	00040593          	mv	a1,s0
8040295c:	00011517          	auipc	a0,0x11
80402960:	ed450513          	addi	a0,a0,-300 # 80413830 <default_pmm_manager+0x10c>
80402964:	899fd0ef          	jal	ra,804001fc <cprintf>
80402968:	00096797          	auipc	a5,0x96
8040296c:	6d878793          	addi	a5,a5,1752 # 80499040 <slobfree>
80402970:	0007a583          	lw	a1,0(a5)
80402974:	00000613          	li	a2,0
80402978:	00058463          	beqz	a1,80402980 <slob_init+0x74>
8040297c:	0045a603          	lw	a2,4(a1) # 1004 <_binary_bin_swap_img_size-0x6ffc>
80402980:	00812403          	lw	s0,8(sp)
80402984:	00c12083          	lw	ra,12(sp)
80402988:	00011517          	auipc	a0,0x11
8040298c:	ed850513          	addi	a0,a0,-296 # 80413860 <default_pmm_manager+0x13c>
80402990:	01010113          	addi	sp,sp,16
80402994:	869fd06f          	j	804001fc <cprintf>

80402998 <kmalloc_init>:
80402998:	ff010113          	addi	sp,sp,-16
8040299c:	00112623          	sw	ra,12(sp)
804029a0:	f6dff0ef          	jal	ra,8040290c <slob_init>
804029a4:	00c12083          	lw	ra,12(sp)
804029a8:	00011517          	auipc	a0,0x11
804029ac:	e2450513          	addi	a0,a0,-476 # 804137cc <default_pmm_manager+0xa8>
804029b0:	01010113          	addi	sp,sp,16
804029b4:	849fd06f          	j	804001fc <cprintf>

804029b8 <kallocated>:
804029b8:	00000513          	li	a0,0
804029bc:	00008067          	ret

804029c0 <kmalloc>:
804029c0:	ff010113          	addi	sp,sp,-16
804029c4:	01212023          	sw	s2,0(sp)
804029c8:	00001937          	lui	s2,0x1
804029cc:	00812423          	sw	s0,8(sp)
804029d0:	00112623          	sw	ra,12(sp)
804029d4:	00912223          	sw	s1,4(sp)
804029d8:	ff790793          	addi	a5,s2,-9 # ff7 <_binary_bin_swap_img_size-0x7009>
804029dc:	00050413          	mv	s0,a0
804029e0:	08a7f263          	bgeu	a5,a0,80402a64 <kmalloc+0xa4>
804029e4:	00c00513          	li	a0,12
804029e8:	db1ff0ef          	jal	ra,80402798 <slob_alloc.isra.1.constprop.3>
804029ec:	00050493          	mv	s1,a0
804029f0:	08050263          	beqz	a0,80402a74 <kmalloc+0xb4>
804029f4:	00040793          	mv	a5,s0
804029f8:	00000513          	li	a0,0
804029fc:	00895a63          	bge	s2,s0,80402a10 <kmalloc+0x50>
80402a00:	00001737          	lui	a4,0x1
80402a04:	4017d793          	srai	a5,a5,0x1
80402a08:	00150513          	addi	a0,a0,1
80402a0c:	fef74ce3          	blt	a4,a5,80402a04 <kmalloc+0x44>
80402a10:	00a4a023          	sw	a0,0(s1)
80402a14:	cf5ff0ef          	jal	ra,80402708 <__slob_get_free_pages.isra.0>
80402a18:	00a4a223          	sw	a0,4(s1)
80402a1c:	00050413          	mv	s0,a0
80402a20:	0a050a63          	beqz	a0,80402ad4 <kmalloc+0x114>
80402a24:	100027f3          	csrr	a5,sstatus
80402a28:	0027f793          	andi	a5,a5,2
80402a2c:	06079463          	bnez	a5,80402a94 <kmalloc+0xd4>
80402a30:	0009a797          	auipc	a5,0x9a
80402a34:	d6078793          	addi	a5,a5,-672 # 8049c790 <bigblocks>
80402a38:	0007a783          	lw	a5,0(a5)
80402a3c:	0009a717          	auipc	a4,0x9a
80402a40:	d4972a23          	sw	s1,-684(a4) # 8049c790 <bigblocks>
80402a44:	00f4a423          	sw	a5,8(s1)
80402a48:	00040513          	mv	a0,s0
80402a4c:	00c12083          	lw	ra,12(sp)
80402a50:	00812403          	lw	s0,8(sp)
80402a54:	00412483          	lw	s1,4(sp)
80402a58:	00012903          	lw	s2,0(sp)
80402a5c:	01010113          	addi	sp,sp,16
80402a60:	00008067          	ret
80402a64:	00850513          	addi	a0,a0,8
80402a68:	d31ff0ef          	jal	ra,80402798 <slob_alloc.isra.1.constprop.3>
80402a6c:	00850413          	addi	s0,a0,8
80402a70:	fc051ce3          	bnez	a0,80402a48 <kmalloc+0x88>
80402a74:	00000413          	li	s0,0
80402a78:	00040513          	mv	a0,s0
80402a7c:	00c12083          	lw	ra,12(sp)
80402a80:	00812403          	lw	s0,8(sp)
80402a84:	00412483          	lw	s1,4(sp)
80402a88:	00012903          	lw	s2,0(sp)
80402a8c:	01010113          	addi	sp,sp,16
80402a90:	00008067          	ret
80402a94:	988fe0ef          	jal	ra,80400c1c <intr_disable>
80402a98:	0009a797          	auipc	a5,0x9a
80402a9c:	cf878793          	addi	a5,a5,-776 # 8049c790 <bigblocks>
80402aa0:	0007a783          	lw	a5,0(a5)
80402aa4:	0009a717          	auipc	a4,0x9a
80402aa8:	ce972623          	sw	s1,-788(a4) # 8049c790 <bigblocks>
80402aac:	00f4a423          	sw	a5,8(s1)
80402ab0:	964fe0ef          	jal	ra,80400c14 <intr_enable>
80402ab4:	0044a403          	lw	s0,4(s1)
80402ab8:	00c12083          	lw	ra,12(sp)
80402abc:	00412483          	lw	s1,4(sp)
80402ac0:	00040513          	mv	a0,s0
80402ac4:	00812403          	lw	s0,8(sp)
80402ac8:	00012903          	lw	s2,0(sp)
80402acc:	01010113          	addi	sp,sp,16
80402ad0:	00008067          	ret
80402ad4:	00c00593          	li	a1,12
80402ad8:	00048513          	mv	a0,s1
80402adc:	a8dff0ef          	jal	ra,80402568 <slob_free>
80402ae0:	f69ff06f          	j	80402a48 <kmalloc+0x88>

80402ae4 <kfree>:
80402ae4:	14050863          	beqz	a0,80402c34 <kfree+0x150>
80402ae8:	ff010113          	addi	sp,sp,-16
80402aec:	00912223          	sw	s1,4(sp)
80402af0:	00112623          	sw	ra,12(sp)
80402af4:	00812423          	sw	s0,8(sp)
80402af8:	01451793          	slli	a5,a0,0x14
80402afc:	00050493          	mv	s1,a0
80402b00:	04079863          	bnez	a5,80402b50 <kfree+0x6c>
80402b04:	100027f3          	csrr	a5,sstatus
80402b08:	0027f793          	andi	a5,a5,2
80402b0c:	0e079263          	bnez	a5,80402bf0 <kfree+0x10c>
80402b10:	0009a797          	auipc	a5,0x9a
80402b14:	c8078793          	addi	a5,a5,-896 # 8049c790 <bigblocks>
80402b18:	0007a683          	lw	a3,0(a5)
80402b1c:	02068a63          	beqz	a3,80402b50 <kfree+0x6c>
80402b20:	0046a783          	lw	a5,4(a3)
80402b24:	0086a403          	lw	s0,8(a3)
80402b28:	10f50863          	beq	a0,a5,80402c38 <kfree+0x154>
80402b2c:	00000613          	li	a2,0
80402b30:	00040e63          	beqz	s0,80402b4c <kfree+0x68>
80402b34:	00442703          	lw	a4,4(s0)
80402b38:	00842783          	lw	a5,8(s0)
80402b3c:	02970863          	beq	a4,s1,80402b6c <kfree+0x88>
80402b40:	00040693          	mv	a3,s0
80402b44:	00078413          	mv	s0,a5
80402b48:	fe0416e3          	bnez	s0,80402b34 <kfree+0x50>
80402b4c:	0c061663          	bnez	a2,80402c18 <kfree+0x134>
80402b50:	00812403          	lw	s0,8(sp)
80402b54:	00c12083          	lw	ra,12(sp)
80402b58:	ff848513          	addi	a0,s1,-8
80402b5c:	00412483          	lw	s1,4(sp)
80402b60:	00000593          	li	a1,0
80402b64:	01010113          	addi	sp,sp,16
80402b68:	a01ff06f          	j	80402568 <slob_free>
80402b6c:	00f6a423          	sw	a5,8(a3)
80402b70:	0a061e63          	bnez	a2,80402c2c <kfree+0x148>
80402b74:	804007b7          	lui	a5,0x80400
80402b78:	00042703          	lw	a4,0(s0)
80402b7c:	0cf4e663          	bltu	s1,a5,80402c48 <kfree+0x164>
80402b80:	0009a797          	auipc	a5,0x9a
80402b84:	c8078793          	addi	a5,a5,-896 # 8049c800 <va_pa_offset>
80402b88:	0007a683          	lw	a3,0(a5)
80402b8c:	0009a797          	auipc	a5,0x9a
80402b90:	c0c78793          	addi	a5,a5,-1012 # 8049c798 <npage>
80402b94:	0007a783          	lw	a5,0(a5)
80402b98:	40d484b3          	sub	s1,s1,a3
80402b9c:	00c4d493          	srli	s1,s1,0xc
80402ba0:	0cf4f263          	bgeu	s1,a5,80402c64 <kfree+0x180>
80402ba4:	00013797          	auipc	a5,0x13
80402ba8:	5dc78793          	addi	a5,a5,1500 # 80416180 <nbase>
80402bac:	0007a783          	lw	a5,0(a5)
80402bb0:	0009a697          	auipc	a3,0x9a
80402bb4:	c5868693          	addi	a3,a3,-936 # 8049c808 <pages>
80402bb8:	0006a503          	lw	a0,0(a3)
80402bbc:	40f484b3          	sub	s1,s1,a5
80402bc0:	00549493          	slli	s1,s1,0x5
80402bc4:	00100593          	li	a1,1
80402bc8:	00950533          	add	a0,a0,s1
80402bcc:	00e595b3          	sll	a1,a1,a4
80402bd0:	238000ef          	jal	ra,80402e08 <free_pages>
80402bd4:	00040513          	mv	a0,s0
80402bd8:	00812403          	lw	s0,8(sp)
80402bdc:	00c12083          	lw	ra,12(sp)
80402be0:	00412483          	lw	s1,4(sp)
80402be4:	00c00593          	li	a1,12
80402be8:	01010113          	addi	sp,sp,16
80402bec:	97dff06f          	j	80402568 <slob_free>
80402bf0:	82cfe0ef          	jal	ra,80400c1c <intr_disable>
80402bf4:	0009a797          	auipc	a5,0x9a
80402bf8:	b9c78793          	addi	a5,a5,-1124 # 8049c790 <bigblocks>
80402bfc:	0007a683          	lw	a3,0(a5)
80402c00:	00068c63          	beqz	a3,80402c18 <kfree+0x134>
80402c04:	0046a783          	lw	a5,4(a3)
80402c08:	0086a403          	lw	s0,8(a3)
80402c0c:	00f48a63          	beq	s1,a5,80402c20 <kfree+0x13c>
80402c10:	00100613          	li	a2,1
80402c14:	f1dff06f          	j	80402b30 <kfree+0x4c>
80402c18:	ffdfd0ef          	jal	ra,80400c14 <intr_enable>
80402c1c:	f35ff06f          	j	80402b50 <kfree+0x6c>
80402c20:	0009a797          	auipc	a5,0x9a
80402c24:	b687a823          	sw	s0,-1168(a5) # 8049c790 <bigblocks>
80402c28:	00068413          	mv	s0,a3
80402c2c:	fe9fd0ef          	jal	ra,80400c14 <intr_enable>
80402c30:	f45ff06f          	j	80402b74 <kfree+0x90>
80402c34:	00008067          	ret
80402c38:	0009a797          	auipc	a5,0x9a
80402c3c:	b487ac23          	sw	s0,-1192(a5) # 8049c790 <bigblocks>
80402c40:	00068413          	mv	s0,a3
80402c44:	f31ff06f          	j	80402b74 <kfree+0x90>
80402c48:	00048693          	mv	a3,s1
80402c4c:	00011617          	auipc	a2,0x11
80402c50:	b3c60613          	addi	a2,a2,-1220 # 80413788 <default_pmm_manager+0x64>
80402c54:	07000593          	li	a1,112
80402c58:	00011517          	auipc	a0,0x11
80402c5c:	b2050513          	addi	a0,a0,-1248 # 80413778 <default_pmm_manager+0x54>
80402c60:	9c5fd0ef          	jal	ra,80400624 <__panic>
80402c64:	00011617          	auipc	a2,0x11
80402c68:	b4860613          	addi	a2,a2,-1208 # 804137ac <default_pmm_manager+0x88>
80402c6c:	06900593          	li	a1,105
80402c70:	00011517          	auipc	a0,0x11
80402c74:	b0850513          	addi	a0,a0,-1272 # 80413778 <default_pmm_manager+0x54>
80402c78:	9adfd0ef          	jal	ra,80400624 <__panic>

80402c7c <get_pgtable_items.isra.4.part.5>:
80402c7c:	04a5f063          	bgeu	a1,a0,80402cbc <get_pgtable_items.isra.4.part.5+0x40>
80402c80:	00259813          	slli	a6,a1,0x2
80402c84:	010608b3          	add	a7,a2,a6
80402c88:	0008a783          	lw	a5,0(a7)
80402c8c:	0017f793          	andi	a5,a5,1
80402c90:	02079c63          	bnez	a5,80402cc8 <get_pgtable_items.isra.4.part.5+0x4c>
80402c94:	00480813          	addi	a6,a6,4
80402c98:	01060833          	add	a6,a2,a6
80402c9c:	0140006f          	j	80402cb0 <get_pgtable_items.isra.4.part.5+0x34>
80402ca0:	00082783          	lw	a5,0(a6)
80402ca4:	00480813          	addi	a6,a6,4
80402ca8:	0017f793          	andi	a5,a5,1
80402cac:	00079e63          	bnez	a5,80402cc8 <get_pgtable_items.isra.4.part.5+0x4c>
80402cb0:	00158593          	addi	a1,a1,1
80402cb4:	00080893          	mv	a7,a6
80402cb8:	fea594e3          	bne	a1,a0,80402ca0 <get_pgtable_items.isra.4.part.5+0x24>
80402cbc:	00000693          	li	a3,0
80402cc0:	00068513          	mv	a0,a3
80402cc4:	00008067          	ret
80402cc8:	00b6a023          	sw	a1,0(a3)
80402ccc:	0008a683          	lw	a3,0(a7)
80402cd0:	00158593          	addi	a1,a1,1
80402cd4:	01f6f693          	andi	a3,a3,31
80402cd8:	02a5fe63          	bgeu	a1,a0,80402d14 <get_pgtable_items.isra.4.part.5+0x98>
80402cdc:	00259793          	slli	a5,a1,0x2
80402ce0:	00f60833          	add	a6,a2,a5
80402ce4:	00082803          	lw	a6,0(a6)
80402ce8:	ffc78793          	addi	a5,a5,-4
80402cec:	00f60633          	add	a2,a2,a5
80402cf0:	01f87813          	andi	a6,a6,31
80402cf4:	00d80c63          	beq	a6,a3,80402d0c <get_pgtable_items.isra.4.part.5+0x90>
80402cf8:	01c0006f          	j	80402d14 <get_pgtable_items.isra.4.part.5+0x98>
80402cfc:	00862783          	lw	a5,8(a2)
80402d00:	00460613          	addi	a2,a2,4
80402d04:	01f7f793          	andi	a5,a5,31
80402d08:	00d79663          	bne	a5,a3,80402d14 <get_pgtable_items.isra.4.part.5+0x98>
80402d0c:	00158593          	addi	a1,a1,1
80402d10:	fea5e6e3          	bltu	a1,a0,80402cfc <get_pgtable_items.isra.4.part.5+0x80>
80402d14:	00b72023          	sw	a1,0(a4)
80402d18:	00068513          	mv	a0,a3
80402d1c:	00008067          	ret

80402d20 <pa2page.part.6>:
80402d20:	ff010113          	addi	sp,sp,-16
80402d24:	00011617          	auipc	a2,0x11
80402d28:	a8860613          	addi	a2,a2,-1400 # 804137ac <default_pmm_manager+0x88>
80402d2c:	06900593          	li	a1,105
80402d30:	00011517          	auipc	a0,0x11
80402d34:	a4850513          	addi	a0,a0,-1464 # 80413778 <default_pmm_manager+0x54>
80402d38:	00112623          	sw	ra,12(sp)
80402d3c:	8e9fd0ef          	jal	ra,80400624 <__panic>

80402d40 <alloc_pages>:
80402d40:	fd010113          	addi	sp,sp,-48
80402d44:	02812423          	sw	s0,40(sp)
80402d48:	02912223          	sw	s1,36(sp)
80402d4c:	03212023          	sw	s2,32(sp)
80402d50:	01312e23          	sw	s3,28(sp)
80402d54:	01412c23          	sw	s4,24(sp)
80402d58:	02112623          	sw	ra,44(sp)
80402d5c:	00050413          	mv	s0,a0
80402d60:	0009a497          	auipc	s1,0x9a
80402d64:	a9c48493          	addi	s1,s1,-1380 # 8049c7fc <pmm_manager>
80402d68:	00100913          	li	s2,1
80402d6c:	0009a997          	auipc	s3,0x9a
80402d70:	a3898993          	addi	s3,s3,-1480 # 8049c7a4 <swap_init_ok>
80402d74:	0009aa17          	auipc	s4,0x9a
80402d78:	b3ca0a13          	addi	s4,s4,-1220 # 8049c8b0 <check_mm_struct>
80402d7c:	0300006f          	j	80402dac <alloc_pages+0x6c>
80402d80:	0004a783          	lw	a5,0(s1)
80402d84:	00c7a783          	lw	a5,12(a5)
80402d88:	000780e7          	jalr	a5
80402d8c:	00000613          	li	a2,0
80402d90:	00040593          	mv	a1,s0
80402d94:	04051a63          	bnez	a0,80402de8 <alloc_pages+0xa8>
80402d98:	04896863          	bltu	s2,s0,80402de8 <alloc_pages+0xa8>
80402d9c:	0009a783          	lw	a5,0(s3)
80402da0:	04078463          	beqz	a5,80402de8 <alloc_pages+0xa8>
80402da4:	000a2503          	lw	a0,0(s4)
80402da8:	16c010ef          	jal	ra,80403f14 <swap_out>
80402dac:	100027f3          	csrr	a5,sstatus
80402db0:	0027f793          	andi	a5,a5,2
80402db4:	00040513          	mv	a0,s0
80402db8:	fc0784e3          	beqz	a5,80402d80 <alloc_pages+0x40>
80402dbc:	e61fd0ef          	jal	ra,80400c1c <intr_disable>
80402dc0:	0004a783          	lw	a5,0(s1)
80402dc4:	00040513          	mv	a0,s0
80402dc8:	00c7a783          	lw	a5,12(a5)
80402dcc:	000780e7          	jalr	a5
80402dd0:	00a12623          	sw	a0,12(sp)
80402dd4:	e41fd0ef          	jal	ra,80400c14 <intr_enable>
80402dd8:	00c12503          	lw	a0,12(sp)
80402ddc:	00000613          	li	a2,0
80402de0:	00040593          	mv	a1,s0
80402de4:	fa050ae3          	beqz	a0,80402d98 <alloc_pages+0x58>
80402de8:	02c12083          	lw	ra,44(sp)
80402dec:	02812403          	lw	s0,40(sp)
80402df0:	02412483          	lw	s1,36(sp)
80402df4:	02012903          	lw	s2,32(sp)
80402df8:	01c12983          	lw	s3,28(sp)
80402dfc:	01812a03          	lw	s4,24(sp)
80402e00:	03010113          	addi	sp,sp,48
80402e04:	00008067          	ret

80402e08 <free_pages>:
80402e08:	100027f3          	csrr	a5,sstatus
80402e0c:	0027f793          	andi	a5,a5,2
80402e10:	00079c63          	bnez	a5,80402e28 <free_pages+0x20>
80402e14:	0009a797          	auipc	a5,0x9a
80402e18:	9e878793          	addi	a5,a5,-1560 # 8049c7fc <pmm_manager>
80402e1c:	0007a783          	lw	a5,0(a5)
80402e20:	0107a303          	lw	t1,16(a5)
80402e24:	00030067          	jr	t1
80402e28:	ff010113          	addi	sp,sp,-16
80402e2c:	00112623          	sw	ra,12(sp)
80402e30:	00812423          	sw	s0,8(sp)
80402e34:	00912223          	sw	s1,4(sp)
80402e38:	00050413          	mv	s0,a0
80402e3c:	00058493          	mv	s1,a1
80402e40:	dddfd0ef          	jal	ra,80400c1c <intr_disable>
80402e44:	0009a797          	auipc	a5,0x9a
80402e48:	9b878793          	addi	a5,a5,-1608 # 8049c7fc <pmm_manager>
80402e4c:	0007a783          	lw	a5,0(a5)
80402e50:	00048593          	mv	a1,s1
80402e54:	00040513          	mv	a0,s0
80402e58:	0107a783          	lw	a5,16(a5)
80402e5c:	000780e7          	jalr	a5
80402e60:	00812403          	lw	s0,8(sp)
80402e64:	00c12083          	lw	ra,12(sp)
80402e68:	00412483          	lw	s1,4(sp)
80402e6c:	01010113          	addi	sp,sp,16
80402e70:	da5fd06f          	j	80400c14 <intr_enable>

80402e74 <nr_free_pages>:
80402e74:	100027f3          	csrr	a5,sstatus
80402e78:	0027f793          	andi	a5,a5,2
80402e7c:	00079c63          	bnez	a5,80402e94 <nr_free_pages+0x20>
80402e80:	0009a797          	auipc	a5,0x9a
80402e84:	97c78793          	addi	a5,a5,-1668 # 8049c7fc <pmm_manager>
80402e88:	0007a783          	lw	a5,0(a5)
80402e8c:	0147a303          	lw	t1,20(a5)
80402e90:	00030067          	jr	t1
80402e94:	ff010113          	addi	sp,sp,-16
80402e98:	00112623          	sw	ra,12(sp)
80402e9c:	00812423          	sw	s0,8(sp)
80402ea0:	d7dfd0ef          	jal	ra,80400c1c <intr_disable>
80402ea4:	0009a797          	auipc	a5,0x9a
80402ea8:	95878793          	addi	a5,a5,-1704 # 8049c7fc <pmm_manager>
80402eac:	0007a783          	lw	a5,0(a5)
80402eb0:	0147a783          	lw	a5,20(a5)
80402eb4:	000780e7          	jalr	a5
80402eb8:	00050413          	mv	s0,a0
80402ebc:	d59fd0ef          	jal	ra,80400c14 <intr_enable>
80402ec0:	00040513          	mv	a0,s0
80402ec4:	00c12083          	lw	ra,12(sp)
80402ec8:	00812403          	lw	s0,8(sp)
80402ecc:	01010113          	addi	sp,sp,16
80402ed0:	00008067          	ret

80402ed4 <get_pte>:
80402ed4:	fe010113          	addi	sp,sp,-32
80402ed8:	01212823          	sw	s2,16(sp)
80402edc:	0165d913          	srli	s2,a1,0x16
80402ee0:	00291913          	slli	s2,s2,0x2
80402ee4:	01250933          	add	s2,a0,s2
80402ee8:	00092683          	lw	a3,0(s2)
80402eec:	00912a23          	sw	s1,20(sp)
80402ef0:	01312623          	sw	s3,12(sp)
80402ef4:	00112e23          	sw	ra,28(sp)
80402ef8:	00812c23          	sw	s0,24(sp)
80402efc:	01412423          	sw	s4,8(sp)
80402f00:	01512223          	sw	s5,4(sp)
80402f04:	0016f793          	andi	a5,a3,1
80402f08:	00058493          	mv	s1,a1
80402f0c:	0009a997          	auipc	s3,0x9a
80402f10:	88c98993          	addi	s3,s3,-1908 # 8049c798 <npage>
80402f14:	08079863          	bnez	a5,80402fa4 <get_pte+0xd0>
80402f18:	0e060463          	beqz	a2,80403000 <get_pte+0x12c>
80402f1c:	00100513          	li	a0,1
80402f20:	e21ff0ef          	jal	ra,80402d40 <alloc_pages>
80402f24:	00050413          	mv	s0,a0
80402f28:	0c050c63          	beqz	a0,80403000 <get_pte+0x12c>
80402f2c:	0009aa97          	auipc	s5,0x9a
80402f30:	8dca8a93          	addi	s5,s5,-1828 # 8049c808 <pages>
80402f34:	000aa503          	lw	a0,0(s5)
80402f38:	00100793          	li	a5,1
80402f3c:	00f42023          	sw	a5,0(s0)
80402f40:	40a40533          	sub	a0,s0,a0
80402f44:	40555513          	srai	a0,a0,0x5
80402f48:	00080a37          	lui	s4,0x80
80402f4c:	0009a997          	auipc	s3,0x9a
80402f50:	84c98993          	addi	s3,s3,-1972 # 8049c798 <npage>
80402f54:	01450533          	add	a0,a0,s4
80402f58:	0009a703          	lw	a4,0(s3)
80402f5c:	00c51793          	slli	a5,a0,0xc
80402f60:	00c7d793          	srli	a5,a5,0xc
80402f64:	00c51513          	slli	a0,a0,0xc
80402f68:	0ae7fc63          	bgeu	a5,a4,80403020 <get_pte+0x14c>
80402f6c:	0009a797          	auipc	a5,0x9a
80402f70:	89478793          	addi	a5,a5,-1900 # 8049c800 <va_pa_offset>
80402f74:	0007a783          	lw	a5,0(a5)
80402f78:	00001637          	lui	a2,0x1
80402f7c:	00000593          	li	a1,0
80402f80:	00f50533          	add	a0,a0,a5
80402f84:	0350f0ef          	jal	ra,804127b8 <memset>
80402f88:	000aa683          	lw	a3,0(s5)
80402f8c:	40d406b3          	sub	a3,s0,a3
80402f90:	4056d693          	srai	a3,a3,0x5
80402f94:	014686b3          	add	a3,a3,s4
80402f98:	00a69693          	slli	a3,a3,0xa
80402f9c:	0116e693          	ori	a3,a3,17
80402fa0:	00d92023          	sw	a3,0(s2)
80402fa4:	00269693          	slli	a3,a3,0x2
80402fa8:	fffff537          	lui	a0,0xfffff
80402fac:	0009a703          	lw	a4,0(s3)
80402fb0:	00a6f6b3          	and	a3,a3,a0
80402fb4:	00c6d793          	srli	a5,a3,0xc
80402fb8:	04e7f863          	bgeu	a5,a4,80403008 <get_pte+0x134>
80402fbc:	0009a797          	auipc	a5,0x9a
80402fc0:	84478793          	addi	a5,a5,-1980 # 8049c800 <va_pa_offset>
80402fc4:	0007a503          	lw	a0,0(a5)
80402fc8:	00c4d493          	srli	s1,s1,0xc
80402fcc:	3ff4f493          	andi	s1,s1,1023
80402fd0:	00a686b3          	add	a3,a3,a0
80402fd4:	00249513          	slli	a0,s1,0x2
80402fd8:	00a68533          	add	a0,a3,a0
80402fdc:	01c12083          	lw	ra,28(sp)
80402fe0:	01812403          	lw	s0,24(sp)
80402fe4:	01412483          	lw	s1,20(sp)
80402fe8:	01012903          	lw	s2,16(sp)
80402fec:	00c12983          	lw	s3,12(sp)
80402ff0:	00812a03          	lw	s4,8(sp)
80402ff4:	00412a83          	lw	s5,4(sp)
80402ff8:	02010113          	addi	sp,sp,32
80402ffc:	00008067          	ret
80403000:	00000513          	li	a0,0
80403004:	fd9ff06f          	j	80402fdc <get_pte+0x108>
80403008:	00010617          	auipc	a2,0x10
8040300c:	74c60613          	addi	a2,a2,1868 # 80413754 <default_pmm_manager+0x30>
80403010:	12100593          	li	a1,289
80403014:	00011517          	auipc	a0,0x11
80403018:	8c450513          	addi	a0,a0,-1852 # 804138d8 <default_pmm_manager+0x1b4>
8040301c:	e08fd0ef          	jal	ra,80400624 <__panic>
80403020:	00050693          	mv	a3,a0
80403024:	00010617          	auipc	a2,0x10
80403028:	73060613          	addi	a2,a2,1840 # 80413754 <default_pmm_manager+0x30>
8040302c:	11e00593          	li	a1,286
80403030:	00011517          	auipc	a0,0x11
80403034:	8a850513          	addi	a0,a0,-1880 # 804138d8 <default_pmm_manager+0x1b4>
80403038:	decfd0ef          	jal	ra,80400624 <__panic>

8040303c <unmap_range>:
8040303c:	fd010113          	addi	sp,sp,-48
80403040:	00c5e7b3          	or	a5,a1,a2
80403044:	02112623          	sw	ra,44(sp)
80403048:	02812423          	sw	s0,40(sp)
8040304c:	02912223          	sw	s1,36(sp)
80403050:	03212023          	sw	s2,32(sp)
80403054:	01312e23          	sw	s3,28(sp)
80403058:	01412c23          	sw	s4,24(sp)
8040305c:	01512a23          	sw	s5,20(sp)
80403060:	01612823          	sw	s6,16(sp)
80403064:	01712623          	sw	s7,12(sp)
80403068:	01812423          	sw	s8,8(sp)
8040306c:	01912223          	sw	s9,4(sp)
80403070:	01479713          	slli	a4,a5,0x14
80403074:	12071463          	bnez	a4,8040319c <unmap_range+0x160>
80403078:	002007b7          	lui	a5,0x200
8040307c:	00058413          	mv	s0,a1
80403080:	0ef5ee63          	bltu	a1,a5,8040317c <unmap_range+0x140>
80403084:	00060913          	mv	s2,a2
80403088:	0ec5fa63          	bgeu	a1,a2,8040317c <unmap_range+0x140>
8040308c:	800007b7          	lui	a5,0x80000
80403090:	0ec7e663          	bltu	a5,a2,8040317c <unmap_range+0x140>
80403094:	00050993          	mv	s3,a0
80403098:	00001a37          	lui	s4,0x1
8040309c:	00099c97          	auipc	s9,0x99
804030a0:	6fcc8c93          	addi	s9,s9,1788 # 8049c798 <npage>
804030a4:	00099c17          	auipc	s8,0x99
804030a8:	764c0c13          	addi	s8,s8,1892 # 8049c808 <pages>
804030ac:	fff80bb7          	lui	s7,0xfff80
804030b0:	00400b37          	lui	s6,0x400
804030b4:	ffc00ab7          	lui	s5,0xffc00
804030b8:	00000613          	li	a2,0
804030bc:	00040593          	mv	a1,s0
804030c0:	00098513          	mv	a0,s3
804030c4:	e11ff0ef          	jal	ra,80402ed4 <get_pte>
804030c8:	00050493          	mv	s1,a0
804030cc:	08050863          	beqz	a0,8040315c <unmap_range+0x120>
804030d0:	00052783          	lw	a5,0(a0)
804030d4:	04079063          	bnez	a5,80403114 <unmap_range+0xd8>
804030d8:	01440433          	add	s0,s0,s4
804030dc:	fd246ee3          	bltu	s0,s2,804030b8 <unmap_range+0x7c>
804030e0:	02c12083          	lw	ra,44(sp)
804030e4:	02812403          	lw	s0,40(sp)
804030e8:	02412483          	lw	s1,36(sp)
804030ec:	02012903          	lw	s2,32(sp)
804030f0:	01c12983          	lw	s3,28(sp)
804030f4:	01812a03          	lw	s4,24(sp)
804030f8:	01412a83          	lw	s5,20(sp)
804030fc:	01012b03          	lw	s6,16(sp)
80403100:	00c12b83          	lw	s7,12(sp)
80403104:	00812c03          	lw	s8,8(sp)
80403108:	00412c83          	lw	s9,4(sp)
8040310c:	03010113          	addi	sp,sp,48
80403110:	00008067          	ret
80403114:	0017f713          	andi	a4,a5,1
80403118:	fc0700e3          	beqz	a4,804030d8 <unmap_range+0x9c>
8040311c:	000ca703          	lw	a4,0(s9)
80403120:	00279793          	slli	a5,a5,0x2
80403124:	00c7d793          	srli	a5,a5,0xc
80403128:	08e7fa63          	bgeu	a5,a4,804031bc <unmap_range+0x180>
8040312c:	000c2503          	lw	a0,0(s8)
80403130:	017787b3          	add	a5,a5,s7
80403134:	00579793          	slli	a5,a5,0x5
80403138:	00f50533          	add	a0,a0,a5
8040313c:	00052783          	lw	a5,0(a0)
80403140:	fff78793          	addi	a5,a5,-1 # 7fffffff <end+0xffb63743>
80403144:	00f52023          	sw	a5,0(a0)
80403148:	02078463          	beqz	a5,80403170 <unmap_range+0x134>
8040314c:	0004a023          	sw	zero,0(s1)
80403150:	12040073          	sfence.vma	s0
80403154:	01440433          	add	s0,s0,s4
80403158:	f85ff06f          	j	804030dc <unmap_range+0xa0>
8040315c:	01640433          	add	s0,s0,s6
80403160:	01547433          	and	s0,s0,s5
80403164:	f6040ee3          	beqz	s0,804030e0 <unmap_range+0xa4>
80403168:	f52468e3          	bltu	s0,s2,804030b8 <unmap_range+0x7c>
8040316c:	f75ff06f          	j	804030e0 <unmap_range+0xa4>
80403170:	00100593          	li	a1,1
80403174:	c95ff0ef          	jal	ra,80402e08 <free_pages>
80403178:	fd5ff06f          	j	8040314c <unmap_range+0x110>
8040317c:	00011697          	auipc	a3,0x11
80403180:	8f468693          	addi	a3,a3,-1804 # 80413a70 <default_pmm_manager+0x34c>
80403184:	00010617          	auipc	a2,0x10
80403188:	a6460613          	addi	a2,a2,-1436 # 80412be8 <commands+0x1bc>
8040318c:	15900593          	li	a1,345
80403190:	00010517          	auipc	a0,0x10
80403194:	74850513          	addi	a0,a0,1864 # 804138d8 <default_pmm_manager+0x1b4>
80403198:	c8cfd0ef          	jal	ra,80400624 <__panic>
8040319c:	00011697          	auipc	a3,0x11
804031a0:	8a868693          	addi	a3,a3,-1880 # 80413a44 <default_pmm_manager+0x320>
804031a4:	00010617          	auipc	a2,0x10
804031a8:	a4460613          	addi	a2,a2,-1468 # 80412be8 <commands+0x1bc>
804031ac:	15800593          	li	a1,344
804031b0:	00010517          	auipc	a0,0x10
804031b4:	72850513          	addi	a0,a0,1832 # 804138d8 <default_pmm_manager+0x1b4>
804031b8:	c6cfd0ef          	jal	ra,80400624 <__panic>
804031bc:	b65ff0ef          	jal	ra,80402d20 <pa2page.part.6>

804031c0 <exit_range>:
804031c0:	fd010113          	addi	sp,sp,-48
804031c4:	00c5e7b3          	or	a5,a1,a2
804031c8:	02112623          	sw	ra,44(sp)
804031cc:	02812423          	sw	s0,40(sp)
804031d0:	02912223          	sw	s1,36(sp)
804031d4:	03212023          	sw	s2,32(sp)
804031d8:	01312e23          	sw	s3,28(sp)
804031dc:	01412c23          	sw	s4,24(sp)
804031e0:	01512a23          	sw	s5,20(sp)
804031e4:	01612823          	sw	s6,16(sp)
804031e8:	01712623          	sw	s7,12(sp)
804031ec:	01479713          	slli	a4,a5,0x14
804031f0:	0e071c63          	bnez	a4,804032e8 <exit_range+0x128>
804031f4:	002007b7          	lui	a5,0x200
804031f8:	0cf5e863          	bltu	a1,a5,804032c8 <exit_range+0x108>
804031fc:	00060913          	mv	s2,a2
80403200:	0cc5f463          	bgeu	a1,a2,804032c8 <exit_range+0x108>
80403204:	ffc004b7          	lui	s1,0xffc00
80403208:	800007b7          	lui	a5,0x80000
8040320c:	0095f4b3          	and	s1,a1,s1
80403210:	0ac7ec63          	bltu	a5,a2,804032c8 <exit_range+0x108>
80403214:	00050a13          	mv	s4,a0
80403218:	00099b17          	auipc	s6,0x99
8040321c:	580b0b13          	addi	s6,s6,1408 # 8049c798 <npage>
80403220:	00099b97          	auipc	s7,0x99
80403224:	5e8b8b93          	addi	s7,s7,1512 # 8049c808 <pages>
80403228:	fff809b7          	lui	s3,0xfff80
8040322c:	00400ab7          	lui	s5,0x400
80403230:	0080006f          	j	80403238 <exit_range+0x78>
80403234:	0524f863          	bgeu	s1,s2,80403284 <exit_range+0xc4>
80403238:	0164d413          	srli	s0,s1,0x16
8040323c:	00241413          	slli	s0,s0,0x2
80403240:	008a0433          	add	s0,s4,s0
80403244:	00042783          	lw	a5,0(s0)
80403248:	0017f713          	andi	a4,a5,1
8040324c:	02070863          	beqz	a4,8040327c <exit_range+0xbc>
80403250:	000b2703          	lw	a4,0(s6)
80403254:	00279793          	slli	a5,a5,0x2
80403258:	00c7d793          	srli	a5,a5,0xc
8040325c:	04e7fa63          	bgeu	a5,a4,804032b0 <exit_range+0xf0>
80403260:	000ba503          	lw	a0,0(s7)
80403264:	013787b3          	add	a5,a5,s3
80403268:	00579793          	slli	a5,a5,0x5
8040326c:	00100593          	li	a1,1
80403270:	00f50533          	add	a0,a0,a5
80403274:	b95ff0ef          	jal	ra,80402e08 <free_pages>
80403278:	00042023          	sw	zero,0(s0)
8040327c:	015484b3          	add	s1,s1,s5
80403280:	fa049ae3          	bnez	s1,80403234 <exit_range+0x74>
80403284:	02c12083          	lw	ra,44(sp)
80403288:	02812403          	lw	s0,40(sp)
8040328c:	02412483          	lw	s1,36(sp)
80403290:	02012903          	lw	s2,32(sp)
80403294:	01c12983          	lw	s3,28(sp)
80403298:	01812a03          	lw	s4,24(sp)
8040329c:	01412a83          	lw	s5,20(sp)
804032a0:	01012b03          	lw	s6,16(sp)
804032a4:	00c12b83          	lw	s7,12(sp)
804032a8:	03010113          	addi	sp,sp,48
804032ac:	00008067          	ret
804032b0:	00010617          	auipc	a2,0x10
804032b4:	4fc60613          	addi	a2,a2,1276 # 804137ac <default_pmm_manager+0x88>
804032b8:	06900593          	li	a1,105
804032bc:	00010517          	auipc	a0,0x10
804032c0:	4bc50513          	addi	a0,a0,1212 # 80413778 <default_pmm_manager+0x54>
804032c4:	b60fd0ef          	jal	ra,80400624 <__panic>
804032c8:	00010697          	auipc	a3,0x10
804032cc:	7a868693          	addi	a3,a3,1960 # 80413a70 <default_pmm_manager+0x34c>
804032d0:	00010617          	auipc	a2,0x10
804032d4:	91860613          	addi	a2,a2,-1768 # 80412be8 <commands+0x1bc>
804032d8:	16a00593          	li	a1,362
804032dc:	00010517          	auipc	a0,0x10
804032e0:	5fc50513          	addi	a0,a0,1532 # 804138d8 <default_pmm_manager+0x1b4>
804032e4:	b40fd0ef          	jal	ra,80400624 <__panic>
804032e8:	00010697          	auipc	a3,0x10
804032ec:	75c68693          	addi	a3,a3,1884 # 80413a44 <default_pmm_manager+0x320>
804032f0:	00010617          	auipc	a2,0x10
804032f4:	8f860613          	addi	a2,a2,-1800 # 80412be8 <commands+0x1bc>
804032f8:	16900593          	li	a1,361
804032fc:	00010517          	auipc	a0,0x10
80403300:	5dc50513          	addi	a0,a0,1500 # 804138d8 <default_pmm_manager+0x1b4>
80403304:	b20fd0ef          	jal	ra,80400624 <__panic>

80403308 <page_insert>:
80403308:	fe010113          	addi	sp,sp,-32
8040330c:	01312623          	sw	s3,12(sp)
80403310:	00060993          	mv	s3,a2
80403314:	00812c23          	sw	s0,24(sp)
80403318:	00100613          	li	a2,1
8040331c:	00058413          	mv	s0,a1
80403320:	00098593          	mv	a1,s3
80403324:	01212823          	sw	s2,16(sp)
80403328:	00112e23          	sw	ra,28(sp)
8040332c:	00912a23          	sw	s1,20(sp)
80403330:	01412423          	sw	s4,8(sp)
80403334:	00068913          	mv	s2,a3
80403338:	b9dff0ef          	jal	ra,80402ed4 <get_pte>
8040333c:	0e050063          	beqz	a0,8040341c <page_insert+0x114>
80403340:	00042683          	lw	a3,0(s0)
80403344:	00050493          	mv	s1,a0
80403348:	00168793          	addi	a5,a3,1
8040334c:	00f42023          	sw	a5,0(s0)
80403350:	00052783          	lw	a5,0(a0)
80403354:	0017f713          	andi	a4,a5,1
80403358:	04071c63          	bnez	a4,804033b0 <page_insert+0xa8>
8040335c:	00099797          	auipc	a5,0x99
80403360:	4ac78793          	addi	a5,a5,1196 # 8049c808 <pages>
80403364:	0007a703          	lw	a4,0(a5)
80403368:	40e40433          	sub	s0,s0,a4
8040336c:	000806b7          	lui	a3,0x80
80403370:	40545413          	srai	s0,s0,0x5
80403374:	00d40433          	add	s0,s0,a3
80403378:	00a41413          	slli	s0,s0,0xa
8040337c:	01246433          	or	s0,s0,s2
80403380:	00146413          	ori	s0,s0,1
80403384:	0084a023          	sw	s0,0(s1) # ffc00000 <end+0x7f763744>
80403388:	12098073          	sfence.vma	s3
8040338c:	00000513          	li	a0,0
80403390:	01c12083          	lw	ra,28(sp)
80403394:	01812403          	lw	s0,24(sp)
80403398:	01412483          	lw	s1,20(sp)
8040339c:	01012903          	lw	s2,16(sp)
804033a0:	00c12983          	lw	s3,12(sp)
804033a4:	00812a03          	lw	s4,8(sp)
804033a8:	02010113          	addi	sp,sp,32
804033ac:	00008067          	ret
804033b0:	00099717          	auipc	a4,0x99
804033b4:	3e870713          	addi	a4,a4,1000 # 8049c798 <npage>
804033b8:	00072703          	lw	a4,0(a4)
804033bc:	00279793          	slli	a5,a5,0x2
804033c0:	00c7d793          	srli	a5,a5,0xc
804033c4:	06e7f063          	bgeu	a5,a4,80403424 <page_insert+0x11c>
804033c8:	00099a17          	auipc	s4,0x99
804033cc:	440a0a13          	addi	s4,s4,1088 # 8049c808 <pages>
804033d0:	000a2703          	lw	a4,0(s4)
804033d4:	fff80537          	lui	a0,0xfff80
804033d8:	00a78533          	add	a0,a5,a0
804033dc:	00551513          	slli	a0,a0,0x5
804033e0:	00a70533          	add	a0,a4,a0
804033e4:	00a40e63          	beq	s0,a0,80403400 <page_insert+0xf8>
804033e8:	00052783          	lw	a5,0(a0) # fff80000 <end+0x7fae3744>
804033ec:	fff78793          	addi	a5,a5,-1
804033f0:	00f52023          	sw	a5,0(a0)
804033f4:	00078a63          	beqz	a5,80403408 <page_insert+0x100>
804033f8:	12098073          	sfence.vma	s3
804033fc:	f6dff06f          	j	80403368 <page_insert+0x60>
80403400:	00d42023          	sw	a3,0(s0)
80403404:	f65ff06f          	j	80403368 <page_insert+0x60>
80403408:	00100593          	li	a1,1
8040340c:	9fdff0ef          	jal	ra,80402e08 <free_pages>
80403410:	000a2703          	lw	a4,0(s4)
80403414:	12098073          	sfence.vma	s3
80403418:	f51ff06f          	j	80403368 <page_insert+0x60>
8040341c:	ffc00513          	li	a0,-4
80403420:	f71ff06f          	j	80403390 <page_insert+0x88>
80403424:	8fdff0ef          	jal	ra,80402d20 <pa2page.part.6>

80403428 <copy_range>:
80403428:	fc010113          	addi	sp,sp,-64
8040342c:	00d667b3          	or	a5,a2,a3
80403430:	02112e23          	sw	ra,60(sp)
80403434:	02812c23          	sw	s0,56(sp)
80403438:	02912a23          	sw	s1,52(sp)
8040343c:	03212823          	sw	s2,48(sp)
80403440:	03312623          	sw	s3,44(sp)
80403444:	03412423          	sw	s4,40(sp)
80403448:	03512223          	sw	s5,36(sp)
8040344c:	03612023          	sw	s6,32(sp)
80403450:	01712e23          	sw	s7,28(sp)
80403454:	01812c23          	sw	s8,24(sp)
80403458:	01912a23          	sw	s9,20(sp)
8040345c:	01a12823          	sw	s10,16(sp)
80403460:	01b12623          	sw	s11,12(sp)
80403464:	01479713          	slli	a4,a5,0x14
80403468:	26071663          	bnez	a4,804036d4 <copy_range+0x2ac>
8040346c:	002007b7          	lui	a5,0x200
80403470:	00060413          	mv	s0,a2
80403474:	1ef66863          	bltu	a2,a5,80403664 <copy_range+0x23c>
80403478:	00068493          	mv	s1,a3
8040347c:	1ed67463          	bgeu	a2,a3,80403664 <copy_range+0x23c>
80403480:	800007b7          	lui	a5,0x80000
80403484:	1ed7e063          	bltu	a5,a3,80403664 <copy_range+0x23c>
80403488:	00100a37          	lui	s4,0x100
8040348c:	00050a93          	mv	s5,a0
80403490:	00058913          	mv	s2,a1
80403494:	000019b7          	lui	s3,0x1
80403498:	00099c17          	auipc	s8,0x99
8040349c:	300c0c13          	addi	s8,s8,768 # 8049c798 <npage>
804034a0:	00099b97          	auipc	s7,0x99
804034a4:	368b8b93          	addi	s7,s7,872 # 8049c808 <pages>
804034a8:	00080b37          	lui	s6,0x80
804034ac:	fffa0a13          	addi	s4,s4,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
804034b0:	00000613          	li	a2,0
804034b4:	00040593          	mv	a1,s0
804034b8:	00090513          	mv	a0,s2
804034bc:	a19ff0ef          	jal	ra,80402ed4 <get_pte>
804034c0:	00050c93          	mv	s9,a0
804034c4:	14050063          	beqz	a0,80403604 <copy_range+0x1dc>
804034c8:	00052783          	lw	a5,0(a0)
804034cc:	0017f793          	andi	a5,a5,1
804034d0:	04079663          	bnez	a5,8040351c <copy_range+0xf4>
804034d4:	01340433          	add	s0,s0,s3
804034d8:	fc946ce3          	bltu	s0,s1,804034b0 <copy_range+0x88>
804034dc:	00000513          	li	a0,0
804034e0:	03c12083          	lw	ra,60(sp)
804034e4:	03812403          	lw	s0,56(sp)
804034e8:	03412483          	lw	s1,52(sp)
804034ec:	03012903          	lw	s2,48(sp)
804034f0:	02c12983          	lw	s3,44(sp)
804034f4:	02812a03          	lw	s4,40(sp)
804034f8:	02412a83          	lw	s5,36(sp)
804034fc:	02012b03          	lw	s6,32(sp)
80403500:	01c12b83          	lw	s7,28(sp)
80403504:	01812c03          	lw	s8,24(sp)
80403508:	01412c83          	lw	s9,20(sp)
8040350c:	01012d03          	lw	s10,16(sp)
80403510:	00c12d83          	lw	s11,12(sp)
80403514:	04010113          	addi	sp,sp,64
80403518:	00008067          	ret
8040351c:	00100613          	li	a2,1
80403520:	00040593          	mv	a1,s0
80403524:	000a8513          	mv	a0,s5
80403528:	9adff0ef          	jal	ra,80402ed4 <get_pte>
8040352c:	0e050a63          	beqz	a0,80403620 <copy_range+0x1f8>
80403530:	000ca783          	lw	a5,0(s9)
80403534:	0017f713          	andi	a4,a5,1
80403538:	01f7fc93          	andi	s9,a5,31
8040353c:	18070063          	beqz	a4,804036bc <copy_range+0x294>
80403540:	000c2683          	lw	a3,0(s8)
80403544:	00279793          	slli	a5,a5,0x2
80403548:	00c7d713          	srli	a4,a5,0xc
8040354c:	14d77c63          	bgeu	a4,a3,804036a4 <copy_range+0x27c>
80403550:	000ba783          	lw	a5,0(s7)
80403554:	fff806b7          	lui	a3,0xfff80
80403558:	00d70733          	add	a4,a4,a3
8040355c:	00571713          	slli	a4,a4,0x5
80403560:	00100513          	li	a0,1
80403564:	00e78db3          	add	s11,a5,a4
80403568:	fd8ff0ef          	jal	ra,80402d40 <alloc_pages>
8040356c:	00050d13          	mv	s10,a0
80403570:	0c0d8a63          	beqz	s11,80403644 <copy_range+0x21c>
80403574:	10050863          	beqz	a0,80403684 <copy_range+0x25c>
80403578:	000ba703          	lw	a4,0(s7)
8040357c:	000c2603          	lw	a2,0(s8)
80403580:	40ed86b3          	sub	a3,s11,a4
80403584:	4056d693          	srai	a3,a3,0x5
80403588:	016686b3          	add	a3,a3,s6
8040358c:	0146f7b3          	and	a5,a3,s4
80403590:	00c69693          	slli	a3,a3,0xc
80403594:	08c7fc63          	bgeu	a5,a2,8040362c <copy_range+0x204>
80403598:	40e507b3          	sub	a5,a0,a4
8040359c:	00099717          	auipc	a4,0x99
804035a0:	26470713          	addi	a4,a4,612 # 8049c800 <va_pa_offset>
804035a4:	00072503          	lw	a0,0(a4)
804035a8:	4057d793          	srai	a5,a5,0x5
804035ac:	016787b3          	add	a5,a5,s6
804035b0:	0147f733          	and	a4,a5,s4
804035b4:	00a685b3          	add	a1,a3,a0
804035b8:	00c79793          	slli	a5,a5,0xc
804035bc:	06c77663          	bgeu	a4,a2,80403628 <copy_range+0x200>
804035c0:	00001637          	lui	a2,0x1
804035c4:	00a78533          	add	a0,a5,a0
804035c8:	2600f0ef          	jal	ra,80412828 <memcpy>
804035cc:	000c8693          	mv	a3,s9
804035d0:	00040613          	mv	a2,s0
804035d4:	000d0593          	mv	a1,s10
804035d8:	000a8513          	mv	a0,s5
804035dc:	d2dff0ef          	jal	ra,80403308 <page_insert>
804035e0:	ee050ae3          	beqz	a0,804034d4 <copy_range+0xac>
804035e4:	00010697          	auipc	a3,0x10
804035e8:	2e868693          	addi	a3,a3,744 # 804138cc <default_pmm_manager+0x1a8>
804035ec:	0000f617          	auipc	a2,0xf
804035f0:	5fc60613          	addi	a2,a2,1532 # 80412be8 <commands+0x1bc>
804035f4:	1b100593          	li	a1,433
804035f8:	00010517          	auipc	a0,0x10
804035fc:	2e050513          	addi	a0,a0,736 # 804138d8 <default_pmm_manager+0x1b4>
80403600:	824fd0ef          	jal	ra,80400624 <__panic>
80403604:	004007b7          	lui	a5,0x400
80403608:	00f40433          	add	s0,s0,a5
8040360c:	ffc007b7          	lui	a5,0xffc00
80403610:	00f47433          	and	s0,s0,a5
80403614:	ec0404e3          	beqz	s0,804034dc <copy_range+0xb4>
80403618:	e8946ce3          	bltu	s0,s1,804034b0 <copy_range+0x88>
8040361c:	ec1ff06f          	j	804034dc <copy_range+0xb4>
80403620:	ffc00513          	li	a0,-4
80403624:	ebdff06f          	j	804034e0 <copy_range+0xb8>
80403628:	00078693          	mv	a3,a5
8040362c:	00010617          	auipc	a2,0x10
80403630:	12860613          	addi	a2,a2,296 # 80413754 <default_pmm_manager+0x30>
80403634:	06e00593          	li	a1,110
80403638:	00010517          	auipc	a0,0x10
8040363c:	14050513          	addi	a0,a0,320 # 80413778 <default_pmm_manager+0x54>
80403640:	fe5fc0ef          	jal	ra,80400624 <__panic>
80403644:	00010697          	auipc	a3,0x10
80403648:	26868693          	addi	a3,a3,616 # 804138ac <default_pmm_manager+0x188>
8040364c:	0000f617          	auipc	a2,0xf
80403650:	59c60613          	addi	a2,a2,1436 # 80412be8 <commands+0x1bc>
80403654:	19600593          	li	a1,406
80403658:	00010517          	auipc	a0,0x10
8040365c:	28050513          	addi	a0,a0,640 # 804138d8 <default_pmm_manager+0x1b4>
80403660:	fc5fc0ef          	jal	ra,80400624 <__panic>
80403664:	00010697          	auipc	a3,0x10
80403668:	40c68693          	addi	a3,a3,1036 # 80413a70 <default_pmm_manager+0x34c>
8040366c:	0000f617          	auipc	a2,0xf
80403670:	57c60613          	addi	a2,a2,1404 # 80412be8 <commands+0x1bc>
80403674:	18200593          	li	a1,386
80403678:	00010517          	auipc	a0,0x10
8040367c:	26050513          	addi	a0,a0,608 # 804138d8 <default_pmm_manager+0x1b4>
80403680:	fa5fc0ef          	jal	ra,80400624 <__panic>
80403684:	00010697          	auipc	a3,0x10
80403688:	23868693          	addi	a3,a3,568 # 804138bc <default_pmm_manager+0x198>
8040368c:	0000f617          	auipc	a2,0xf
80403690:	55c60613          	addi	a2,a2,1372 # 80412be8 <commands+0x1bc>
80403694:	19700593          	li	a1,407
80403698:	00010517          	auipc	a0,0x10
8040369c:	24050513          	addi	a0,a0,576 # 804138d8 <default_pmm_manager+0x1b4>
804036a0:	f85fc0ef          	jal	ra,80400624 <__panic>
804036a4:	00010617          	auipc	a2,0x10
804036a8:	10860613          	addi	a2,a2,264 # 804137ac <default_pmm_manager+0x88>
804036ac:	06900593          	li	a1,105
804036b0:	00010517          	auipc	a0,0x10
804036b4:	0c850513          	addi	a0,a0,200 # 80413778 <default_pmm_manager+0x54>
804036b8:	f6dfc0ef          	jal	ra,80400624 <__panic>
804036bc:	00010617          	auipc	a2,0x10
804036c0:	1cc60613          	addi	a2,a2,460 # 80413888 <default_pmm_manager+0x164>
804036c4:	07400593          	li	a1,116
804036c8:	00010517          	auipc	a0,0x10
804036cc:	0b050513          	addi	a0,a0,176 # 80413778 <default_pmm_manager+0x54>
804036d0:	f55fc0ef          	jal	ra,80400624 <__panic>
804036d4:	00010697          	auipc	a3,0x10
804036d8:	37068693          	addi	a3,a3,880 # 80413a44 <default_pmm_manager+0x320>
804036dc:	0000f617          	auipc	a2,0xf
804036e0:	50c60613          	addi	a2,a2,1292 # 80412be8 <commands+0x1bc>
804036e4:	18100593          	li	a1,385
804036e8:	00010517          	auipc	a0,0x10
804036ec:	1f050513          	addi	a0,a0,496 # 804138d8 <default_pmm_manager+0x1b4>
804036f0:	f35fc0ef          	jal	ra,80400624 <__panic>

804036f4 <tlb_invalidate>:
804036f4:	12058073          	sfence.vma	a1
804036f8:	00008067          	ret

804036fc <pgdir_alloc_page>:
804036fc:	fe010113          	addi	sp,sp,-32
80403700:	01212823          	sw	s2,16(sp)
80403704:	00050913          	mv	s2,a0
80403708:	00100513          	li	a0,1
8040370c:	00812c23          	sw	s0,24(sp)
80403710:	00912a23          	sw	s1,20(sp)
80403714:	01312623          	sw	s3,12(sp)
80403718:	00112e23          	sw	ra,28(sp)
8040371c:	00058493          	mv	s1,a1
80403720:	00060993          	mv	s3,a2
80403724:	e1cff0ef          	jal	ra,80402d40 <alloc_pages>
80403728:	00050413          	mv	s0,a0
8040372c:	04050e63          	beqz	a0,80403788 <pgdir_alloc_page+0x8c>
80403730:	00050593          	mv	a1,a0
80403734:	00098693          	mv	a3,s3
80403738:	00048613          	mv	a2,s1
8040373c:	00090513          	mv	a0,s2
80403740:	bc9ff0ef          	jal	ra,80403308 <page_insert>
80403744:	06051263          	bnez	a0,804037a8 <pgdir_alloc_page+0xac>
80403748:	00099797          	auipc	a5,0x99
8040374c:	05c78793          	addi	a5,a5,92 # 8049c7a4 <swap_init_ok>
80403750:	0007a783          	lw	a5,0(a5)
80403754:	02078a63          	beqz	a5,80403788 <pgdir_alloc_page+0x8c>
80403758:	00099797          	auipc	a5,0x99
8040375c:	15878793          	addi	a5,a5,344 # 8049c8b0 <check_mm_struct>
80403760:	0007a503          	lw	a0,0(a5)
80403764:	02050263          	beqz	a0,80403788 <pgdir_alloc_page+0x8c>
80403768:	00000693          	li	a3,0
8040376c:	00040613          	mv	a2,s0
80403770:	00048593          	mv	a1,s1
80403774:	78c000ef          	jal	ra,80403f00 <swap_map_swappable>
80403778:	00042703          	lw	a4,0(s0)
8040377c:	00942e23          	sw	s1,28(s0)
80403780:	00100793          	li	a5,1
80403784:	02f71c63          	bne	a4,a5,804037bc <pgdir_alloc_page+0xc0>
80403788:	00040513          	mv	a0,s0
8040378c:	01c12083          	lw	ra,28(sp)
80403790:	01812403          	lw	s0,24(sp)
80403794:	01412483          	lw	s1,20(sp)
80403798:	01012903          	lw	s2,16(sp)
8040379c:	00c12983          	lw	s3,12(sp)
804037a0:	02010113          	addi	sp,sp,32
804037a4:	00008067          	ret
804037a8:	00040513          	mv	a0,s0
804037ac:	00100593          	li	a1,1
804037b0:	e58ff0ef          	jal	ra,80402e08 <free_pages>
804037b4:	00000413          	li	s0,0
804037b8:	fd1ff06f          	j	80403788 <pgdir_alloc_page+0x8c>
804037bc:	00010697          	auipc	a3,0x10
804037c0:	12c68693          	addi	a3,a3,300 # 804138e8 <default_pmm_manager+0x1c4>
804037c4:	0000f617          	auipc	a2,0xf
804037c8:	42460613          	addi	a2,a2,1060 # 80412be8 <commands+0x1bc>
804037cc:	1f000593          	li	a1,496
804037d0:	00010517          	auipc	a0,0x10
804037d4:	10850513          	addi	a0,a0,264 # 804138d8 <default_pmm_manager+0x1b4>
804037d8:	e4dfc0ef          	jal	ra,80400624 <__panic>

804037dc <print_pgdir>:
804037dc:	fa010113          	addi	sp,sp,-96
804037e0:	00010517          	auipc	a0,0x10
804037e4:	1b850513          	addi	a0,a0,440 # 80413998 <default_pmm_manager+0x274>
804037e8:	05512223          	sw	s5,68(sp)
804037ec:	04112e23          	sw	ra,92(sp)
804037f0:	04812c23          	sw	s0,88(sp)
804037f4:	04912a23          	sw	s1,84(sp)
804037f8:	05212823          	sw	s2,80(sp)
804037fc:	05312623          	sw	s3,76(sp)
80403800:	05412423          	sw	s4,72(sp)
80403804:	05612023          	sw	s6,64(sp)
80403808:	03712e23          	sw	s7,60(sp)
8040380c:	03812c23          	sw	s8,56(sp)
80403810:	03912a23          	sw	s9,52(sp)
80403814:	03a12823          	sw	s10,48(sp)
80403818:	03b12623          	sw	s11,44(sp)
8040381c:	9e1fc0ef          	jal	ra,804001fc <cprintf>
80403820:	00000593          	li	a1,0
80403824:	00012a23          	sw	zero,20(sp)
80403828:	00099a97          	auipc	s5,0x99
8040382c:	fd8a8a93          	addi	s5,s5,-40 # 8049c800 <va_pa_offset>
80403830:	01410713          	addi	a4,sp,20
80403834:	01010693          	addi	a3,sp,16
80403838:	fafec637          	lui	a2,0xfafec
8040383c:	40000513          	li	a0,1024
80403840:	c3cff0ef          	jal	ra,80402c7c <get_pgtable_items.isra.4.part.5>
80403844:	00050493          	mv	s1,a0
80403848:	08050663          	beqz	a0,804038d4 <print_pgdir+0xf8>
8040384c:	01412683          	lw	a3,20(sp)
80403850:	01012603          	lw	a2,16(sp)
80403854:	01b49313          	slli	t1,s1,0x1b
80403858:	01d49813          	slli	a6,s1,0x1d
8040385c:	41f35313          	srai	t1,t1,0x1f
80403860:	41f85813          	srai	a6,a6,0x1f
80403864:	04837313          	andi	t1,t1,72
80403868:	40c685b3          	sub	a1,a3,a2
8040386c:	02d30313          	addi	t1,t1,45
80403870:	04a87813          	andi	a6,a6,74
80403874:	02d80813          	addi	a6,a6,45
80403878:	00099797          	auipc	a5,0x99
8040387c:	f2478793          	addi	a5,a5,-220 # 8049c79c <str.2046>
80403880:	00099897          	auipc	a7,0x99
80403884:	f0688e23          	sb	t1,-228(a7) # 8049c79c <str.2046>
80403888:	01659713          	slli	a4,a1,0x16
8040388c:	07200313          	li	t1,114
80403890:	01669693          	slli	a3,a3,0x16
80403894:	01661613          	slli	a2,a2,0x16
80403898:	00010517          	auipc	a0,0x10
8040389c:	13450513          	addi	a0,a0,308 # 804139cc <default_pmm_manager+0x2a8>
804038a0:	00099897          	auipc	a7,0x99
804038a4:	ef088f23          	sb	a6,-258(a7) # 8049c79e <str.2046+0x2>
804038a8:	00099897          	auipc	a7,0x99
804038ac:	ee688aa3          	sb	t1,-267(a7) # 8049c79d <str.2046+0x1>
804038b0:	00099817          	auipc	a6,0x99
804038b4:	ee0807a3          	sb	zero,-273(a6) # 8049c79f <str.2046+0x3>
804038b8:	945fc0ef          	jal	ra,804001fc <cprintf>
804038bc:	00f4f493          	andi	s1,s1,15
804038c0:	00100793          	li	a5,1
804038c4:	04f48c63          	beq	s1,a5,8040391c <print_pgdir+0x140>
804038c8:	01412583          	lw	a1,20(sp)
804038cc:	3ff00793          	li	a5,1023
804038d0:	f6b7f0e3          	bgeu	a5,a1,80403830 <print_pgdir+0x54>
804038d4:	00010517          	auipc	a0,0x10
804038d8:	13c50513          	addi	a0,a0,316 # 80413a10 <default_pmm_manager+0x2ec>
804038dc:	921fc0ef          	jal	ra,804001fc <cprintf>
804038e0:	05c12083          	lw	ra,92(sp)
804038e4:	05812403          	lw	s0,88(sp)
804038e8:	05412483          	lw	s1,84(sp)
804038ec:	05012903          	lw	s2,80(sp)
804038f0:	04c12983          	lw	s3,76(sp)
804038f4:	04812a03          	lw	s4,72(sp)
804038f8:	04412a83          	lw	s5,68(sp)
804038fc:	04012b03          	lw	s6,64(sp)
80403900:	03c12b83          	lw	s7,60(sp)
80403904:	03812c03          	lw	s8,56(sp)
80403908:	03412c83          	lw	s9,52(sp)
8040390c:	03012d03          	lw	s10,48(sp)
80403910:	02c12d83          	lw	s11,44(sp)
80403914:	06010113          	addi	sp,sp,96
80403918:	00008067          	ret
8040391c:	01012783          	lw	a5,16(sp)
80403920:	01412583          	lw	a1,20(sp)
80403924:	00000d93          	li	s11,0
80403928:	00a79313          	slli	t1,a5,0xa
8040392c:	00f12423          	sw	a5,8(sp)
80403930:	fafec7b7          	lui	a5,0xfafec
80403934:	ffc78793          	addi	a5,a5,-4 # fafebffc <end+0x7ab4f740>
80403938:	00f12623          	sw	a5,12(sp)
8040393c:	00812783          	lw	a5,8(sp)
80403940:	00612e23          	sw	t1,28(sp)
80403944:	40030c93          	addi	s9,t1,1024
80403948:	12b7fe63          	bgeu	a5,a1,80403a84 <print_pgdir+0x2a8>
8040394c:	00c12703          	lw	a4,12(sp)
80403950:	00178793          	addi	a5,a5,1
80403954:	00279493          	slli	s1,a5,0x2
80403958:	00e484b3          	add	s1,s1,a4
8040395c:	0004a603          	lw	a2,0(s1)
80403960:	00099a17          	auipc	s4,0x99
80403964:	e38a0a13          	addi	s4,s4,-456 # 8049c798 <npage>
80403968:	fffff9b7          	lui	s3,0xfffff
8040396c:	00261613          	slli	a2,a2,0x2
80403970:	000a2703          	lw	a4,0(s4)
80403974:	00f12423          	sw	a5,8(sp)
80403978:	00001937          	lui	s2,0x1
8040397c:	00c79793          	slli	a5,a5,0xc
80403980:	01367633          	and	a2,a2,s3
80403984:	40f90933          	sub	s2,s2,a5
80403988:	00c65793          	srli	a5,a2,0xc
8040398c:	01c12583          	lw	a1,28(sp)
80403990:	07200c13          	li	s8,114
80403994:	00099b97          	auipc	s7,0x99
80403998:	e08b8b93          	addi	s7,s7,-504 # 8049c79c <str.2046>
8040399c:	0ae7fe63          	bgeu	a5,a4,80403a58 <print_pgdir+0x27c>
804039a0:	000aa683          	lw	a3,0(s5)
804039a4:	00d60633          	add	a2,a2,a3
804039a8:	01260633          	add	a2,a2,s2
804039ac:	0d95f463          	bgeu	a1,s9,80403a74 <print_pgdir+0x298>
804039b0:	01c10713          	addi	a4,sp,28
804039b4:	01810693          	addi	a3,sp,24
804039b8:	000c8513          	mv	a0,s9
804039bc:	ac0ff0ef          	jal	ra,80402c7c <get_pgtable_items.isra.4.part.5>
804039c0:	00050b13          	mv	s6,a0
804039c4:	0a050863          	beqz	a0,80403a74 <print_pgdir+0x298>
804039c8:	12ad8663          	beq	s11,a0,80403af4 <print_pgdir+0x318>
804039cc:	060d8263          	beqz	s11,80403a30 <print_pgdir+0x254>
804039d0:	01bd9e13          	slli	t3,s11,0x1b
804039d4:	01dd9d93          	slli	s11,s11,0x1d
804039d8:	41fe5e13          	srai	t3,t3,0x1f
804039dc:	41fddd93          	srai	s11,s11,0x1f
804039e0:	408d05b3          	sub	a1,s10,s0
804039e4:	048e7e13          	andi	t3,t3,72
804039e8:	04adfd93          	andi	s11,s11,74
804039ec:	02de0e13          	addi	t3,t3,45
804039f0:	02dd8d93          	addi	s11,s11,45
804039f4:	000b8793          	mv	a5,s7
804039f8:	00c59713          	slli	a4,a1,0xc
804039fc:	00cd1693          	slli	a3,s10,0xc
80403a00:	00c41613          	slli	a2,s0,0xc
80403a04:	00010517          	auipc	a0,0x10
80403a08:	fe850513          	addi	a0,a0,-24 # 804139ec <default_pmm_manager+0x2c8>
80403a0c:	00099817          	auipc	a6,0x99
80403a10:	d9c80823          	sb	t3,-624(a6) # 8049c79c <str.2046>
80403a14:	00099817          	auipc	a6,0x99
80403a18:	d98804a3          	sb	s8,-631(a6) # 8049c79d <str.2046+0x1>
80403a1c:	00099817          	auipc	a6,0x99
80403a20:	d9b80123          	sb	s11,-638(a6) # 8049c79e <str.2046+0x2>
80403a24:	00099817          	auipc	a6,0x99
80403a28:	d6080da3          	sb	zero,-645(a6) # 8049c79f <str.2046+0x3>
80403a2c:	fd0fc0ef          	jal	ra,804001fc <cprintf>
80403a30:	01c12d03          	lw	s10,28(sp)
80403a34:	01812403          	lw	s0,24(sp)
80403a38:	000b0d93          	mv	s11,s6
80403a3c:	000d0593          	mv	a1,s10
80403a40:	0004a603          	lw	a2,0(s1)
80403a44:	000a2703          	lw	a4,0(s4)
80403a48:	00261613          	slli	a2,a2,0x2
80403a4c:	01367633          	and	a2,a2,s3
80403a50:	00c65793          	srli	a5,a2,0xc
80403a54:	f4e7e6e3          	bltu	a5,a4,804039a0 <print_pgdir+0x1c4>
80403a58:	00060693          	mv	a3,a2
80403a5c:	29e00593          	li	a1,670
80403a60:	00010617          	auipc	a2,0x10
80403a64:	cf460613          	addi	a2,a2,-780 # 80413754 <default_pmm_manager+0x30>
80403a68:	00010517          	auipc	a0,0x10
80403a6c:	e7050513          	addi	a0,a0,-400 # 804138d8 <default_pmm_manager+0x1b4>
80403a70:	bb5fc0ef          	jal	ra,80400624 <__panic>
80403a74:	01412583          	lw	a1,20(sp)
80403a78:	00812783          	lw	a5,8(sp)
80403a7c:	400c8c93          	addi	s9,s9,1024
80403a80:	ecb7e6e3          	bltu	a5,a1,8040394c <print_pgdir+0x170>
80403a84:	e40d84e3          	beqz	s11,804038cc <print_pgdir+0xf0>
80403a88:	01bd9313          	slli	t1,s11,0x1b
80403a8c:	01dd9813          	slli	a6,s11,0x1d
80403a90:	41f35313          	srai	t1,t1,0x1f
80403a94:	41f85813          	srai	a6,a6,0x1f
80403a98:	04837313          	andi	t1,t1,72
80403a9c:	408d05b3          	sub	a1,s10,s0
80403aa0:	02d30313          	addi	t1,t1,45
80403aa4:	04a87813          	andi	a6,a6,74
80403aa8:	02d80813          	addi	a6,a6,45
80403aac:	00099897          	auipc	a7,0x99
80403ab0:	ce688823          	sb	t1,-784(a7) # 8049c79c <str.2046>
80403ab4:	00099797          	auipc	a5,0x99
80403ab8:	ce878793          	addi	a5,a5,-792 # 8049c79c <str.2046>
80403abc:	07200313          	li	t1,114
80403ac0:	00c59713          	slli	a4,a1,0xc
80403ac4:	00cd1693          	slli	a3,s10,0xc
80403ac8:	00c41613          	slli	a2,s0,0xc
80403acc:	00010517          	auipc	a0,0x10
80403ad0:	f2050513          	addi	a0,a0,-224 # 804139ec <default_pmm_manager+0x2c8>
80403ad4:	00099897          	auipc	a7,0x99
80403ad8:	cd088523          	sb	a6,-822(a7) # 8049c79e <str.2046+0x2>
80403adc:	00099897          	auipc	a7,0x99
80403ae0:	cc6880a3          	sb	t1,-831(a7) # 8049c79d <str.2046+0x1>
80403ae4:	00099817          	auipc	a6,0x99
80403ae8:	ca080da3          	sb	zero,-837(a6) # 8049c79f <str.2046+0x3>
80403aec:	f10fc0ef          	jal	ra,804001fc <cprintf>
80403af0:	dd9ff06f          	j	804038c8 <print_pgdir+0xec>
80403af4:	01c12d03          	lw	s10,28(sp)
80403af8:	000d0593          	mv	a1,s10
80403afc:	f45ff06f          	j	80403a40 <print_pgdir+0x264>

80403b00 <pmm_init>:
80403b00:	00010797          	auipc	a5,0x10
80403b04:	c2478793          	addi	a5,a5,-988 # 80413724 <default_pmm_manager>
80403b08:	0007a583          	lw	a1,0(a5)
80403b0c:	fe010113          	addi	sp,sp,-32
80403b10:	00010517          	auipc	a0,0x10
80403b14:	dec50513          	addi	a0,a0,-532 # 804138fc <default_pmm_manager+0x1d8>
80403b18:	00112e23          	sw	ra,28(sp)
80403b1c:	00099717          	auipc	a4,0x99
80403b20:	cef72023          	sw	a5,-800(a4) # 8049c7fc <pmm_manager>
80403b24:	00812c23          	sw	s0,24(sp)
80403b28:	00912a23          	sw	s1,20(sp)
80403b2c:	01212823          	sw	s2,16(sp)
80403b30:	01312623          	sw	s3,12(sp)
80403b34:	01412423          	sw	s4,8(sp)
80403b38:	00099417          	auipc	s0,0x99
80403b3c:	cc440413          	addi	s0,s0,-828 # 8049c7fc <pmm_manager>
80403b40:	ebcfc0ef          	jal	ra,804001fc <cprintf>
80403b44:	00042783          	lw	a5,0(s0)
80403b48:	ffffc497          	auipc	s1,0xffffc
80403b4c:	4b848493          	addi	s1,s1,1208 # 80400000 <kern_entry>
80403b50:	0047a783          	lw	a5,4(a5)
80403b54:	000780e7          	jalr	a5
80403b58:	804007b7          	lui	a5,0x80400
80403b5c:	409787b3          	sub	a5,a5,s1
80403b60:	00010517          	auipc	a0,0x10
80403b64:	db450513          	addi	a0,a0,-588 # 80413914 <default_pmm_manager+0x1f0>
80403b68:	00099717          	auipc	a4,0x99
80403b6c:	c8f72c23          	sw	a5,-872(a4) # 8049c800 <va_pa_offset>
80403b70:	e8cfc0ef          	jal	ra,804001fc <cprintf>
80403b74:	808005b7          	lui	a1,0x80800
80403b78:	fff58693          	addi	a3,a1,-1 # 807fffff <end+0x363743>
80403b7c:	00048613          	mv	a2,s1
80403b80:	409585b3          	sub	a1,a1,s1
80403b84:	00010517          	auipc	a0,0x10
80403b88:	da850513          	addi	a0,a0,-600 # 8041392c <default_pmm_manager+0x208>
80403b8c:	e70fc0ef          	jal	ra,804001fc <cprintf>
80403b90:	fffff737          	lui	a4,0xfffff
80403b94:	0009a797          	auipc	a5,0x9a
80403b98:	d2778793          	addi	a5,a5,-729 # 8049d8bb <end+0xfff>
80403b9c:	00e7f7b3          	and	a5,a5,a4
80403ba0:	00081737          	lui	a4,0x81
80403ba4:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403ba8:	00099697          	auipc	a3,0x99
80403bac:	bee6a823          	sw	a4,-1040(a3) # 8049c798 <npage>
80403bb0:	000106b7          	lui	a3,0x10
80403bb4:	00078513          	mv	a0,a5
80403bb8:	00099717          	auipc	a4,0x99
80403bbc:	c4f72823          	sw	a5,-944(a4) # 8049c808 <pages>
80403bc0:	00d786b3          	add	a3,a5,a3
80403bc4:	0047a703          	lw	a4,4(a5)
80403bc8:	02078793          	addi	a5,a5,32
80403bcc:	00176713          	ori	a4,a4,1
80403bd0:	fee7a223          	sw	a4,-28(a5)
80403bd4:	fef698e3          	bne	a3,a5,80403bc4 <pmm_init+0xc4>
80403bd8:	804007b7          	lui	a5,0x80400
80403bdc:	1cf6ea63          	bltu	a3,a5,80403db0 <pmm_init+0x2b0>
80403be0:	00099497          	auipc	s1,0x99
80403be4:	c2048493          	addi	s1,s1,-992 # 8049c800 <va_pa_offset>
80403be8:	0004a783          	lw	a5,0(s1)
80403bec:	808005b7          	lui	a1,0x80800
80403bf0:	40f686b3          	sub	a3,a3,a5
80403bf4:	14b6e863          	bltu	a3,a1,80403d44 <pmm_init+0x244>
80403bf8:	00100513          	li	a0,1
80403bfc:	944ff0ef          	jal	ra,80402d40 <alloc_pages>
80403c00:	20050e63          	beqz	a0,80403e1c <pmm_init+0x31c>
80403c04:	00099797          	auipc	a5,0x99
80403c08:	c0478793          	addi	a5,a5,-1020 # 8049c808 <pages>
80403c0c:	0007a683          	lw	a3,0(a5)
80403c10:	00099797          	auipc	a5,0x99
80403c14:	b8878793          	addi	a5,a5,-1144 # 8049c798 <npage>
80403c18:	0007a703          	lw	a4,0(a5)
80403c1c:	40d506b3          	sub	a3,a0,a3
80403c20:	4056d693          	srai	a3,a3,0x5
80403c24:	00080537          	lui	a0,0x80
80403c28:	00a686b3          	add	a3,a3,a0
80403c2c:	00c69793          	slli	a5,a3,0xc
80403c30:	00c7d793          	srli	a5,a5,0xc
80403c34:	00c69693          	slli	a3,a3,0xc
80403c38:	1ce7f663          	bgeu	a5,a4,80403e04 <pmm_init+0x304>
80403c3c:	0004a783          	lw	a5,0(s1)
80403c40:	00001637          	lui	a2,0x1
80403c44:	00000593          	li	a1,0
80403c48:	00f686b3          	add	a3,a3,a5
80403c4c:	00068513          	mv	a0,a3
80403c50:	00099797          	auipc	a5,0x99
80403c54:	b4d7a223          	sw	a3,-1212(a5) # 8049c794 <boot_pgdir>
80403c58:	3610e0ef          	jal	ra,804127b8 <memset>
80403c5c:	00099797          	auipc	a5,0x99
80403c60:	b3878793          	addi	a5,a5,-1224 # 8049c794 <boot_pgdir>
80403c64:	0007a903          	lw	s2,0(a5)
80403c68:	80400737          	lui	a4,0x80400
80403c6c:	16e96e63          	bltu	s2,a4,80403de8 <pmm_init+0x2e8>
80403c70:	0004a783          	lw	a5,0(s1)
80403c74:	000016b7          	lui	a3,0x1
80403c78:	00d905b3          	add	a1,s2,a3
80403c7c:	40f90533          	sub	a0,s2,a5
80403c80:	00c55613          	srli	a2,a0,0xc
80403c84:	00a61613          	slli	a2,a2,0xa
80403c88:	40f707b3          	sub	a5,a4,a5
80403c8c:	00166813          	ori	a6,a2,1
80403c90:	00e7c733          	xor	a4,a5,a4
80403c94:	00766613          	ori	a2,a2,7
80403c98:	fff68693          	addi	a3,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403c9c:	00099897          	auipc	a7,0x99
80403ca0:	b6a8a423          	sw	a0,-1176(a7) # 8049c804 <boot_cr3>
80403ca4:	fb05a623          	sw	a6,-84(a1) # 807fffac <end+0x3636f0>
80403ca8:	fac5a823          	sw	a2,-80(a1)
80403cac:	00d77733          	and	a4,a4,a3
80403cb0:	10071c63          	bnez	a4,80403dc8 <pmm_init+0x2c8>
80403cb4:	fffff437          	lui	s0,0xfffff
80403cb8:	0087f7b3          	and	a5,a5,s0
80403cbc:	7fc00437          	lui	s0,0x7fc00
80403cc0:	804004b7          	lui	s1,0x80400
80403cc4:	00878433          	add	s0,a5,s0
80403cc8:	00001a37          	lui	s4,0x1
80403ccc:	80c009b7          	lui	s3,0x80c00
80403cd0:	00100613          	li	a2,1
80403cd4:	00048593          	mv	a1,s1
80403cd8:	00090513          	mv	a0,s2
80403cdc:	9f8ff0ef          	jal	ra,80402ed4 <get_pte>
80403ce0:	009407b3          	add	a5,s0,s1
80403ce4:	0a050663          	beqz	a0,80403d90 <pmm_init+0x290>
80403ce8:	00c7d793          	srli	a5,a5,0xc
80403cec:	00a79793          	slli	a5,a5,0xa
80403cf0:	00f7e793          	ori	a5,a5,15
80403cf4:	00f52023          	sw	a5,0(a0) # 80000 <_binary_bin_sfs_img_size+0x8000>
80403cf8:	014484b3          	add	s1,s1,s4
80403cfc:	fd349ae3          	bne	s1,s3,80403cd0 <pmm_init+0x1d0>
80403d00:	00099797          	auipc	a5,0x99
80403d04:	b0478793          	addi	a5,a5,-1276 # 8049c804 <boot_cr3>
80403d08:	0007a783          	lw	a5,0(a5)
80403d0c:	80000737          	lui	a4,0x80000
80403d10:	00c7d793          	srli	a5,a5,0xc
80403d14:	00e7e7b3          	or	a5,a5,a4
80403d18:	18079073          	csrw	satp,a5
80403d1c:	12000073          	sfence.vma
80403d20:	abdff0ef          	jal	ra,804037dc <print_pgdir>
80403d24:	01812403          	lw	s0,24(sp)
80403d28:	01c12083          	lw	ra,28(sp)
80403d2c:	01412483          	lw	s1,20(sp)
80403d30:	01012903          	lw	s2,16(sp)
80403d34:	00c12983          	lw	s3,12(sp)
80403d38:	00812a03          	lw	s4,8(sp)
80403d3c:	02010113          	addi	sp,sp,32
80403d40:	c59fe06f          	j	80402998 <kmalloc_init>
80403d44:	000017b7          	lui	a5,0x1
80403d48:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403d4c:	00f686b3          	add	a3,a3,a5
80403d50:	00081737          	lui	a4,0x81
80403d54:	00c6d793          	srli	a5,a3,0xc
80403d58:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403d5c:	0ce78c63          	beq	a5,a4,80403e34 <pmm_init+0x334>
80403d60:	00042703          	lw	a4,0(s0) # 7fc00000 <_binary_bin_sfs_img_size+0x7fb88000>
80403d64:	fffff637          	lui	a2,0xfffff
80403d68:	00c6f6b3          	and	a3,a3,a2
80403d6c:	fff80637          	lui	a2,0xfff80
80403d70:	00c787b3          	add	a5,a5,a2
80403d74:	00872703          	lw	a4,8(a4)
80403d78:	40d585b3          	sub	a1,a1,a3
80403d7c:	00579793          	slli	a5,a5,0x5
80403d80:	00c5d593          	srli	a1,a1,0xc
80403d84:	00f50533          	add	a0,a0,a5
80403d88:	000700e7          	jalr	a4
80403d8c:	e6dff06f          	j	80403bf8 <pmm_init+0xf8>
80403d90:	00010697          	auipc	a3,0x10
80403d94:	bf868693          	addi	a3,a3,-1032 # 80413988 <default_pmm_manager+0x264>
80403d98:	0000f617          	auipc	a2,0xf
80403d9c:	e5060613          	addi	a2,a2,-432 # 80412be8 <commands+0x1bc>
80403da0:	0aa00593          	li	a1,170
80403da4:	00010517          	auipc	a0,0x10
80403da8:	b3450513          	addi	a0,a0,-1228 # 804138d8 <default_pmm_manager+0x1b4>
80403dac:	879fc0ef          	jal	ra,80400624 <__panic>
80403db0:	00010617          	auipc	a2,0x10
80403db4:	9d860613          	addi	a2,a2,-1576 # 80413788 <default_pmm_manager+0x64>
80403db8:	08e00593          	li	a1,142
80403dbc:	00010517          	auipc	a0,0x10
80403dc0:	b1c50513          	addi	a0,a0,-1252 # 804138d8 <default_pmm_manager+0x1b4>
80403dc4:	861fc0ef          	jal	ra,80400624 <__panic>
80403dc8:	00010697          	auipc	a3,0x10
80403dcc:	ba868693          	addi	a3,a3,-1112 # 80413970 <default_pmm_manager+0x24c>
80403dd0:	0000f617          	auipc	a2,0xf
80403dd4:	e1860613          	addi	a2,a2,-488 # 80412be8 <commands+0x1bc>
80403dd8:	0a400593          	li	a1,164
80403ddc:	00010517          	auipc	a0,0x10
80403de0:	afc50513          	addi	a0,a0,-1284 # 804138d8 <default_pmm_manager+0x1b4>
80403de4:	841fc0ef          	jal	ra,80400624 <__panic>
80403de8:	00090693          	mv	a3,s2
80403dec:	00010617          	auipc	a2,0x10
80403df0:	99c60613          	addi	a2,a2,-1636 # 80413788 <default_pmm_manager+0x64>
80403df4:	0d400593          	li	a1,212
80403df8:	00010517          	auipc	a0,0x10
80403dfc:	ae050513          	addi	a0,a0,-1312 # 804138d8 <default_pmm_manager+0x1b4>
80403e00:	825fc0ef          	jal	ra,80400624 <__panic>
80403e04:	00010617          	auipc	a2,0x10
80403e08:	95060613          	addi	a2,a2,-1712 # 80413754 <default_pmm_manager+0x30>
80403e0c:	06e00593          	li	a1,110
80403e10:	00010517          	auipc	a0,0x10
80403e14:	96850513          	addi	a0,a0,-1688 # 80413778 <default_pmm_manager+0x54>
80403e18:	80dfc0ef          	jal	ra,80400624 <__panic>
80403e1c:	00010617          	auipc	a2,0x10
80403e20:	b3860613          	addi	a2,a2,-1224 # 80413954 <default_pmm_manager+0x230>
80403e24:	0b600593          	li	a1,182
80403e28:	00010517          	auipc	a0,0x10
80403e2c:	ab050513          	addi	a0,a0,-1360 # 804138d8 <default_pmm_manager+0x1b4>
80403e30:	ff4fc0ef          	jal	ra,80400624 <__panic>
80403e34:	eedfe0ef          	jal	ra,80402d20 <pa2page.part.6>

80403e38 <swap_init>:
80403e38:	ff010113          	addi	sp,sp,-16
80403e3c:	00112623          	sw	ra,12(sp)
80403e40:	00812423          	sw	s0,8(sp)
80403e44:	30c090ef          	jal	ra,8040d150 <swapfs_init>
80403e48:	00099797          	auipc	a5,0x99
80403e4c:	a3878793          	addi	a5,a5,-1480 # 8049c880 <max_swap_offset>
80403e50:	0007a683          	lw	a3,0(a5)
80403e54:	010007b7          	lui	a5,0x1000
80403e58:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf87ff8>
80403e5c:	ff968713          	addi	a4,a3,-7
80403e60:	06e7ea63          	bltu	a5,a4,80403ed4 <swap_init+0x9c>
80403e64:	00095797          	auipc	a5,0x95
80403e68:	19c78793          	addi	a5,a5,412 # 80499000 <swap_manager_fifo>
80403e6c:	0047a703          	lw	a4,4(a5)
80403e70:	00099697          	auipc	a3,0x99
80403e74:	92f6a823          	sw	a5,-1744(a3) # 8049c7a0 <sm>
80403e78:	000700e7          	jalr	a4
80403e7c:	00050413          	mv	s0,a0
80403e80:	00050c63          	beqz	a0,80403e98 <swap_init+0x60>
80403e84:	00040513          	mv	a0,s0
80403e88:	00c12083          	lw	ra,12(sp)
80403e8c:	00812403          	lw	s0,8(sp)
80403e90:	01010113          	addi	sp,sp,16
80403e94:	00008067          	ret
80403e98:	00099797          	auipc	a5,0x99
80403e9c:	90878793          	addi	a5,a5,-1784 # 8049c7a0 <sm>
80403ea0:	0007a783          	lw	a5,0(a5)
80403ea4:	00010517          	auipc	a0,0x10
80403ea8:	c6050513          	addi	a0,a0,-928 # 80413b04 <default_pmm_manager+0x3e0>
80403eac:	0007a583          	lw	a1,0(a5)
80403eb0:	00100793          	li	a5,1
80403eb4:	00099717          	auipc	a4,0x99
80403eb8:	8ef72823          	sw	a5,-1808(a4) # 8049c7a4 <swap_init_ok>
80403ebc:	b40fc0ef          	jal	ra,804001fc <cprintf>
80403ec0:	00040513          	mv	a0,s0
80403ec4:	00c12083          	lw	ra,12(sp)
80403ec8:	00812403          	lw	s0,8(sp)
80403ecc:	01010113          	addi	sp,sp,16
80403ed0:	00008067          	ret
80403ed4:	00010617          	auipc	a2,0x10
80403ed8:	c0460613          	addi	a2,a2,-1020 # 80413ad8 <default_pmm_manager+0x3b4>
80403edc:	02500593          	li	a1,37
80403ee0:	00010517          	auipc	a0,0x10
80403ee4:	c1450513          	addi	a0,a0,-1004 # 80413af4 <default_pmm_manager+0x3d0>
80403ee8:	f3cfc0ef          	jal	ra,80400624 <__panic>

80403eec <swap_init_mm>:
80403eec:	00099797          	auipc	a5,0x99
80403ef0:	8b478793          	addi	a5,a5,-1868 # 8049c7a0 <sm>
80403ef4:	0007a783          	lw	a5,0(a5)
80403ef8:	0087a303          	lw	t1,8(a5)
80403efc:	00030067          	jr	t1

80403f00 <swap_map_swappable>:
80403f00:	00099797          	auipc	a5,0x99
80403f04:	8a078793          	addi	a5,a5,-1888 # 8049c7a0 <sm>
80403f08:	0007a783          	lw	a5,0(a5)
80403f0c:	0107a303          	lw	t1,16(a5)
80403f10:	00030067          	jr	t1

80403f14 <swap_out>:
80403f14:	fc010113          	addi	sp,sp,-64
80403f18:	02112e23          	sw	ra,60(sp)
80403f1c:	02812c23          	sw	s0,56(sp)
80403f20:	02912a23          	sw	s1,52(sp)
80403f24:	03212823          	sw	s2,48(sp)
80403f28:	03312623          	sw	s3,44(sp)
80403f2c:	03412423          	sw	s4,40(sp)
80403f30:	03512223          	sw	s5,36(sp)
80403f34:	03612023          	sw	s6,32(sp)
80403f38:	01712e23          	sw	s7,28(sp)
80403f3c:	01812c23          	sw	s8,24(sp)
80403f40:	14058c63          	beqz	a1,80404098 <swap_out+0x184>
80403f44:	00060a93          	mv	s5,a2
80403f48:	00050913          	mv	s2,a0
80403f4c:	00058a13          	mv	s4,a1
80403f50:	00000413          	li	s0,0
80403f54:	00099997          	auipc	s3,0x99
80403f58:	84c98993          	addi	s3,s3,-1972 # 8049c7a0 <sm>
80403f5c:	00010b17          	auipc	s6,0x10
80403f60:	c1cb0b13          	addi	s6,s6,-996 # 80413b78 <default_pmm_manager+0x454>
80403f64:	00010b97          	auipc	s7,0x10
80403f68:	bfcb8b93          	addi	s7,s7,-1028 # 80413b60 <default_pmm_manager+0x43c>
80403f6c:	0580006f          	j	80403fc4 <swap_out+0xb0>
80403f70:	00c12783          	lw	a5,12(sp)
80403f74:	00048613          	mv	a2,s1
80403f78:	00040593          	mv	a1,s0
80403f7c:	01c7a683          	lw	a3,28(a5)
80403f80:	000b0513          	mv	a0,s6
80403f84:	00140413          	addi	s0,s0,1
80403f88:	00c6d693          	srli	a3,a3,0xc
80403f8c:	00168693          	addi	a3,a3,1
80403f90:	a6cfc0ef          	jal	ra,804001fc <cprintf>
80403f94:	00c12503          	lw	a0,12(sp)
80403f98:	00100593          	li	a1,1
80403f9c:	01c52783          	lw	a5,28(a0)
80403fa0:	00c7d793          	srli	a5,a5,0xc
80403fa4:	00178793          	addi	a5,a5,1
80403fa8:	00879793          	slli	a5,a5,0x8
80403fac:	00fc2023          	sw	a5,0(s8)
80403fb0:	e59fe0ef          	jal	ra,80402e08 <free_pages>
80403fb4:	00c92503          	lw	a0,12(s2) # 100c <_binary_bin_swap_img_size-0x6ff4>
80403fb8:	00048593          	mv	a1,s1
80403fbc:	f38ff0ef          	jal	ra,804036f4 <tlb_invalidate>
80403fc0:	088a0863          	beq	s4,s0,80404050 <swap_out+0x13c>
80403fc4:	0009a783          	lw	a5,0(s3)
80403fc8:	000a8613          	mv	a2,s5
80403fcc:	00c10593          	addi	a1,sp,12
80403fd0:	0187a783          	lw	a5,24(a5)
80403fd4:	00090513          	mv	a0,s2
80403fd8:	000780e7          	jalr	a5
80403fdc:	0a051463          	bnez	a0,80404084 <swap_out+0x170>
80403fe0:	00c12783          	lw	a5,12(sp)
80403fe4:	00c92503          	lw	a0,12(s2)
80403fe8:	00000613          	li	a2,0
80403fec:	01c7a483          	lw	s1,28(a5)
80403ff0:	00048593          	mv	a1,s1
80403ff4:	ee1fe0ef          	jal	ra,80402ed4 <get_pte>
80403ff8:	00052783          	lw	a5,0(a0)
80403ffc:	00050c13          	mv	s8,a0
80404000:	0017f793          	andi	a5,a5,1
80404004:	08078e63          	beqz	a5,804040a0 <swap_out+0x18c>
80404008:	00c12583          	lw	a1,12(sp)
8040400c:	01c5a783          	lw	a5,28(a1)
80404010:	00c7d793          	srli	a5,a5,0xc
80404014:	00178513          	addi	a0,a5,1
80404018:	00851513          	slli	a0,a0,0x8
8040401c:	240090ef          	jal	ra,8040d25c <swapfs_write>
80404020:	f40508e3          	beqz	a0,80403f70 <swap_out+0x5c>
80404024:	000b8513          	mv	a0,s7
80404028:	9d4fc0ef          	jal	ra,804001fc <cprintf>
8040402c:	0009a783          	lw	a5,0(s3)
80404030:	00c12603          	lw	a2,12(sp)
80404034:	00000693          	li	a3,0
80404038:	0107a783          	lw	a5,16(a5)
8040403c:	00048593          	mv	a1,s1
80404040:	00090513          	mv	a0,s2
80404044:	00140413          	addi	s0,s0,1
80404048:	000780e7          	jalr	a5
8040404c:	f68a1ce3          	bne	s4,s0,80403fc4 <swap_out+0xb0>
80404050:	00040513          	mv	a0,s0
80404054:	03c12083          	lw	ra,60(sp)
80404058:	03812403          	lw	s0,56(sp)
8040405c:	03412483          	lw	s1,52(sp)
80404060:	03012903          	lw	s2,48(sp)
80404064:	02c12983          	lw	s3,44(sp)
80404068:	02812a03          	lw	s4,40(sp)
8040406c:	02412a83          	lw	s5,36(sp)
80404070:	02012b03          	lw	s6,32(sp)
80404074:	01c12b83          	lw	s7,28(sp)
80404078:	01812c03          	lw	s8,24(sp)
8040407c:	04010113          	addi	sp,sp,64
80404080:	00008067          	ret
80404084:	00040593          	mv	a1,s0
80404088:	00010517          	auipc	a0,0x10
8040408c:	a9050513          	addi	a0,a0,-1392 # 80413b18 <default_pmm_manager+0x3f4>
80404090:	96cfc0ef          	jal	ra,804001fc <cprintf>
80404094:	fbdff06f          	j	80404050 <swap_out+0x13c>
80404098:	00000413          	li	s0,0
8040409c:	fb5ff06f          	j	80404050 <swap_out+0x13c>
804040a0:	00010697          	auipc	a3,0x10
804040a4:	aa868693          	addi	a3,a3,-1368 # 80413b48 <default_pmm_manager+0x424>
804040a8:	0000f617          	auipc	a2,0xf
804040ac:	b4060613          	addi	a2,a2,-1216 # 80412be8 <commands+0x1bc>
804040b0:	05500593          	li	a1,85
804040b4:	00010517          	auipc	a0,0x10
804040b8:	a4050513          	addi	a0,a0,-1472 # 80413af4 <default_pmm_manager+0x3d0>
804040bc:	d68fc0ef          	jal	ra,80400624 <__panic>

804040c0 <swap_in>:
804040c0:	fe010113          	addi	sp,sp,-32
804040c4:	01212823          	sw	s2,16(sp)
804040c8:	00050913          	mv	s2,a0
804040cc:	00100513          	li	a0,1
804040d0:	00912a23          	sw	s1,20(sp)
804040d4:	01312623          	sw	s3,12(sp)
804040d8:	00112e23          	sw	ra,28(sp)
804040dc:	00812c23          	sw	s0,24(sp)
804040e0:	00058493          	mv	s1,a1
804040e4:	00060993          	mv	s3,a2
804040e8:	c59fe0ef          	jal	ra,80402d40 <alloc_pages>
804040ec:	06050263          	beqz	a0,80404150 <swap_in+0x90>
804040f0:	00050413          	mv	s0,a0
804040f4:	00c92503          	lw	a0,12(s2)
804040f8:	00000613          	li	a2,0
804040fc:	00048593          	mv	a1,s1
80404100:	dd5fe0ef          	jal	ra,80402ed4 <get_pte>
80404104:	00050913          	mv	s2,a0
80404108:	00052503          	lw	a0,0(a0)
8040410c:	00040593          	mv	a1,s0
80404110:	08c090ef          	jal	ra,8040d19c <swapfs_read>
80404114:	00092583          	lw	a1,0(s2)
80404118:	00048613          	mv	a2,s1
8040411c:	00010517          	auipc	a0,0x10
80404120:	97c50513          	addi	a0,a0,-1668 # 80413a98 <default_pmm_manager+0x374>
80404124:	0085d593          	srli	a1,a1,0x8
80404128:	8d4fc0ef          	jal	ra,804001fc <cprintf>
8040412c:	01c12083          	lw	ra,28(sp)
80404130:	0089a023          	sw	s0,0(s3)
80404134:	01812403          	lw	s0,24(sp)
80404138:	01412483          	lw	s1,20(sp)
8040413c:	01012903          	lw	s2,16(sp)
80404140:	00c12983          	lw	s3,12(sp)
80404144:	00000513          	li	a0,0
80404148:	02010113          	addi	sp,sp,32
8040414c:	00008067          	ret
80404150:	00010697          	auipc	a3,0x10
80404154:	93868693          	addi	a3,a3,-1736 # 80413a88 <default_pmm_manager+0x364>
80404158:	0000f617          	auipc	a2,0xf
8040415c:	a9060613          	addi	a2,a2,-1392 # 80412be8 <commands+0x1bc>
80404160:	06b00593          	li	a1,107
80404164:	00010517          	auipc	a0,0x10
80404168:	99050513          	addi	a0,a0,-1648 # 80413af4 <default_pmm_manager+0x3d0>
8040416c:	cb8fc0ef          	jal	ra,80400624 <__panic>

80404170 <_fifo_init_mm>:
80404170:	00098797          	auipc	a5,0x98
80404174:	73878793          	addi	a5,a5,1848 # 8049c8a8 <pra_list_head>
80404178:	00f52a23          	sw	a5,20(a0)
8040417c:	00f7a223          	sw	a5,4(a5)
80404180:	00f7a023          	sw	a5,0(a5)
80404184:	00000513          	li	a0,0
80404188:	00008067          	ret

8040418c <_fifo_init>:
8040418c:	00000513          	li	a0,0
80404190:	00008067          	ret

80404194 <_fifo_set_unswappable>:
80404194:	00000513          	li	a0,0
80404198:	00008067          	ret

8040419c <_fifo_tick_event>:
8040419c:	00000513          	li	a0,0
804041a0:	00008067          	ret

804041a4 <_fifo_check_swap>:
804041a4:	fd010113          	addi	sp,sp,-48
804041a8:	01312e23          	sw	s3,28(sp)
804041ac:	01412c23          	sw	s4,24(sp)
804041b0:	00010517          	auipc	a0,0x10
804041b4:	a0850513          	addi	a0,a0,-1528 # 80413bb8 <default_pmm_manager+0x494>
804041b8:	000039b7          	lui	s3,0x3
804041bc:	00c00a13          	li	s4,12
804041c0:	02812423          	sw	s0,40(sp)
804041c4:	02912223          	sw	s1,36(sp)
804041c8:	02112623          	sw	ra,44(sp)
804041cc:	03212023          	sw	s2,32(sp)
804041d0:	01512a23          	sw	s5,20(sp)
804041d4:	01612823          	sw	s6,16(sp)
804041d8:	01712623          	sw	s7,12(sp)
804041dc:	01812423          	sw	s8,8(sp)
804041e0:	01912223          	sw	s9,4(sp)
804041e4:	00098417          	auipc	s0,0x98
804041e8:	5c440413          	addi	s0,s0,1476 # 8049c7a8 <pgfault_num>
804041ec:	810fc0ef          	jal	ra,804001fc <cprintf>
804041f0:	01498023          	sb	s4,0(s3) # 3000 <_binary_bin_swap_img_size-0x5000>
804041f4:	00042483          	lw	s1,0(s0)
804041f8:	00400793          	li	a5,4
804041fc:	18f49863          	bne	s1,a5,8040438c <_fifo_check_swap+0x1e8>
80404200:	00010517          	auipc	a0,0x10
80404204:	a0850513          	addi	a0,a0,-1528 # 80413c08 <default_pmm_manager+0x4e4>
80404208:	00001b37          	lui	s6,0x1
8040420c:	00a00b93          	li	s7,10
80404210:	fedfb0ef          	jal	ra,804001fc <cprintf>
80404214:	017b0023          	sb	s7,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
80404218:	00042903          	lw	s2,0(s0)
8040421c:	2e991863          	bne	s2,s1,8040450c <_fifo_check_swap+0x368>
80404220:	00010517          	auipc	a0,0x10
80404224:	a1050513          	addi	a0,a0,-1520 # 80413c30 <default_pmm_manager+0x50c>
80404228:	00004c37          	lui	s8,0x4
8040422c:	00d00c93          	li	s9,13
80404230:	fcdfb0ef          	jal	ra,804001fc <cprintf>
80404234:	019c0023          	sb	s9,0(s8) # 4000 <_binary_bin_swap_img_size-0x4000>
80404238:	00042a83          	lw	s5,0(s0)
8040423c:	2b2a9863          	bne	s5,s2,804044ec <_fifo_check_swap+0x348>
80404240:	00010517          	auipc	a0,0x10
80404244:	a1850513          	addi	a0,a0,-1512 # 80413c58 <default_pmm_manager+0x534>
80404248:	000024b7          	lui	s1,0x2
8040424c:	00b00913          	li	s2,11
80404250:	fadfb0ef          	jal	ra,804001fc <cprintf>
80404254:	01248023          	sb	s2,0(s1) # 2000 <_binary_bin_swap_img_size-0x6000>
80404258:	00042783          	lw	a5,0(s0)
8040425c:	27579863          	bne	a5,s5,804044cc <_fifo_check_swap+0x328>
80404260:	00010517          	auipc	a0,0x10
80404264:	a2050513          	addi	a0,a0,-1504 # 80413c80 <default_pmm_manager+0x55c>
80404268:	f95fb0ef          	jal	ra,804001fc <cprintf>
8040426c:	000057b7          	lui	a5,0x5
80404270:	00e00713          	li	a4,14
80404274:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80404278:	00042a83          	lw	s5,0(s0)
8040427c:	00500793          	li	a5,5
80404280:	22fa9663          	bne	s5,a5,804044ac <_fifo_check_swap+0x308>
80404284:	00010517          	auipc	a0,0x10
80404288:	9d450513          	addi	a0,a0,-1580 # 80413c58 <default_pmm_manager+0x534>
8040428c:	f71fb0ef          	jal	ra,804001fc <cprintf>
80404290:	01248023          	sb	s2,0(s1)
80404294:	00042783          	lw	a5,0(s0)
80404298:	1f579a63          	bne	a5,s5,8040448c <_fifo_check_swap+0x2e8>
8040429c:	00010517          	auipc	a0,0x10
804042a0:	96c50513          	addi	a0,a0,-1684 # 80413c08 <default_pmm_manager+0x4e4>
804042a4:	f59fb0ef          	jal	ra,804001fc <cprintf>
804042a8:	017b0023          	sb	s7,0(s6)
804042ac:	00042703          	lw	a4,0(s0)
804042b0:	00600793          	li	a5,6
804042b4:	1af71c63          	bne	a4,a5,8040446c <_fifo_check_swap+0x2c8>
804042b8:	00010517          	auipc	a0,0x10
804042bc:	9a050513          	addi	a0,a0,-1632 # 80413c58 <default_pmm_manager+0x534>
804042c0:	f3dfb0ef          	jal	ra,804001fc <cprintf>
804042c4:	01248023          	sb	s2,0(s1)
804042c8:	00042703          	lw	a4,0(s0)
804042cc:	00700793          	li	a5,7
804042d0:	16f71e63          	bne	a4,a5,8040444c <_fifo_check_swap+0x2a8>
804042d4:	00010517          	auipc	a0,0x10
804042d8:	8e450513          	addi	a0,a0,-1820 # 80413bb8 <default_pmm_manager+0x494>
804042dc:	f21fb0ef          	jal	ra,804001fc <cprintf>
804042e0:	01498023          	sb	s4,0(s3)
804042e4:	00042703          	lw	a4,0(s0)
804042e8:	00800793          	li	a5,8
804042ec:	14f71063          	bne	a4,a5,8040442c <_fifo_check_swap+0x288>
804042f0:	00010517          	auipc	a0,0x10
804042f4:	94050513          	addi	a0,a0,-1728 # 80413c30 <default_pmm_manager+0x50c>
804042f8:	f05fb0ef          	jal	ra,804001fc <cprintf>
804042fc:	019c0023          	sb	s9,0(s8)
80404300:	00042703          	lw	a4,0(s0)
80404304:	00900793          	li	a5,9
80404308:	10f71263          	bne	a4,a5,8040440c <_fifo_check_swap+0x268>
8040430c:	00010517          	auipc	a0,0x10
80404310:	97450513          	addi	a0,a0,-1676 # 80413c80 <default_pmm_manager+0x55c>
80404314:	ee9fb0ef          	jal	ra,804001fc <cprintf>
80404318:	000057b7          	lui	a5,0x5
8040431c:	00e00713          	li	a4,14
80404320:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80404324:	00042483          	lw	s1,0(s0)
80404328:	00a00793          	li	a5,10
8040432c:	0cf49063          	bne	s1,a5,804043ec <_fifo_check_swap+0x248>
80404330:	00010517          	auipc	a0,0x10
80404334:	8d850513          	addi	a0,a0,-1832 # 80413c08 <default_pmm_manager+0x4e4>
80404338:	ec5fb0ef          	jal	ra,804001fc <cprintf>
8040433c:	000017b7          	lui	a5,0x1
80404340:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
80404344:	08979463          	bne	a5,s1,804043cc <_fifo_check_swap+0x228>
80404348:	00042703          	lw	a4,0(s0)
8040434c:	00b00793          	li	a5,11
80404350:	04f71e63          	bne	a4,a5,804043ac <_fifo_check_swap+0x208>
80404354:	02c12083          	lw	ra,44(sp)
80404358:	02812403          	lw	s0,40(sp)
8040435c:	02412483          	lw	s1,36(sp)
80404360:	02012903          	lw	s2,32(sp)
80404364:	01c12983          	lw	s3,28(sp)
80404368:	01812a03          	lw	s4,24(sp)
8040436c:	01412a83          	lw	s5,20(sp)
80404370:	01012b03          	lw	s6,16(sp)
80404374:	00c12b83          	lw	s7,12(sp)
80404378:	00812c03          	lw	s8,8(sp)
8040437c:	00412c83          	lw	s9,4(sp)
80404380:	00000513          	li	a0,0
80404384:	03010113          	addi	sp,sp,48
80404388:	00008067          	ret
8040438c:	00010697          	auipc	a3,0x10
80404390:	85468693          	addi	a3,a3,-1964 # 80413be0 <default_pmm_manager+0x4bc>
80404394:	0000f617          	auipc	a2,0xf
80404398:	85460613          	addi	a2,a2,-1964 # 80412be8 <commands+0x1bc>
8040439c:	05f00593          	li	a1,95
804043a0:	00010517          	auipc	a0,0x10
804043a4:	85450513          	addi	a0,a0,-1964 # 80413bf4 <default_pmm_manager+0x4d0>
804043a8:	a7cfc0ef          	jal	ra,80400624 <__panic>
804043ac:	00010697          	auipc	a3,0x10
804043b0:	99868693          	addi	a3,a3,-1640 # 80413d44 <default_pmm_manager+0x620>
804043b4:	0000f617          	auipc	a2,0xf
804043b8:	83460613          	addi	a2,a2,-1996 # 80412be8 <commands+0x1bc>
804043bc:	08100593          	li	a1,129
804043c0:	00010517          	auipc	a0,0x10
804043c4:	83450513          	addi	a0,a0,-1996 # 80413bf4 <default_pmm_manager+0x4d0>
804043c8:	a5cfc0ef          	jal	ra,80400624 <__panic>
804043cc:	00010697          	auipc	a3,0x10
804043d0:	95468693          	addi	a3,a3,-1708 # 80413d20 <default_pmm_manager+0x5fc>
804043d4:	0000f617          	auipc	a2,0xf
804043d8:	81460613          	addi	a2,a2,-2028 # 80412be8 <commands+0x1bc>
804043dc:	07f00593          	li	a1,127
804043e0:	00010517          	auipc	a0,0x10
804043e4:	81450513          	addi	a0,a0,-2028 # 80413bf4 <default_pmm_manager+0x4d0>
804043e8:	a3cfc0ef          	jal	ra,80400624 <__panic>
804043ec:	00010697          	auipc	a3,0x10
804043f0:	92068693          	addi	a3,a3,-1760 # 80413d0c <default_pmm_manager+0x5e8>
804043f4:	0000e617          	auipc	a2,0xe
804043f8:	7f460613          	addi	a2,a2,2036 # 80412be8 <commands+0x1bc>
804043fc:	07d00593          	li	a1,125
80404400:	0000f517          	auipc	a0,0xf
80404404:	7f450513          	addi	a0,a0,2036 # 80413bf4 <default_pmm_manager+0x4d0>
80404408:	a1cfc0ef          	jal	ra,80400624 <__panic>
8040440c:	00010697          	auipc	a3,0x10
80404410:	8ec68693          	addi	a3,a3,-1812 # 80413cf8 <default_pmm_manager+0x5d4>
80404414:	0000e617          	auipc	a2,0xe
80404418:	7d460613          	addi	a2,a2,2004 # 80412be8 <commands+0x1bc>
8040441c:	07a00593          	li	a1,122
80404420:	0000f517          	auipc	a0,0xf
80404424:	7d450513          	addi	a0,a0,2004 # 80413bf4 <default_pmm_manager+0x4d0>
80404428:	9fcfc0ef          	jal	ra,80400624 <__panic>
8040442c:	00010697          	auipc	a3,0x10
80404430:	8b868693          	addi	a3,a3,-1864 # 80413ce4 <default_pmm_manager+0x5c0>
80404434:	0000e617          	auipc	a2,0xe
80404438:	7b460613          	addi	a2,a2,1972 # 80412be8 <commands+0x1bc>
8040443c:	07700593          	li	a1,119
80404440:	0000f517          	auipc	a0,0xf
80404444:	7b450513          	addi	a0,a0,1972 # 80413bf4 <default_pmm_manager+0x4d0>
80404448:	9dcfc0ef          	jal	ra,80400624 <__panic>
8040444c:	00010697          	auipc	a3,0x10
80404450:	88468693          	addi	a3,a3,-1916 # 80413cd0 <default_pmm_manager+0x5ac>
80404454:	0000e617          	auipc	a2,0xe
80404458:	79460613          	addi	a2,a2,1940 # 80412be8 <commands+0x1bc>
8040445c:	07400593          	li	a1,116
80404460:	0000f517          	auipc	a0,0xf
80404464:	79450513          	addi	a0,a0,1940 # 80413bf4 <default_pmm_manager+0x4d0>
80404468:	9bcfc0ef          	jal	ra,80400624 <__panic>
8040446c:	00010697          	auipc	a3,0x10
80404470:	85068693          	addi	a3,a3,-1968 # 80413cbc <default_pmm_manager+0x598>
80404474:	0000e617          	auipc	a2,0xe
80404478:	77460613          	addi	a2,a2,1908 # 80412be8 <commands+0x1bc>
8040447c:	07100593          	li	a1,113
80404480:	0000f517          	auipc	a0,0xf
80404484:	77450513          	addi	a0,a0,1908 # 80413bf4 <default_pmm_manager+0x4d0>
80404488:	99cfc0ef          	jal	ra,80400624 <__panic>
8040448c:	00010697          	auipc	a3,0x10
80404490:	81c68693          	addi	a3,a3,-2020 # 80413ca8 <default_pmm_manager+0x584>
80404494:	0000e617          	auipc	a2,0xe
80404498:	75460613          	addi	a2,a2,1876 # 80412be8 <commands+0x1bc>
8040449c:	06e00593          	li	a1,110
804044a0:	0000f517          	auipc	a0,0xf
804044a4:	75450513          	addi	a0,a0,1876 # 80413bf4 <default_pmm_manager+0x4d0>
804044a8:	97cfc0ef          	jal	ra,80400624 <__panic>
804044ac:	0000f697          	auipc	a3,0xf
804044b0:	7fc68693          	addi	a3,a3,2044 # 80413ca8 <default_pmm_manager+0x584>
804044b4:	0000e617          	auipc	a2,0xe
804044b8:	73460613          	addi	a2,a2,1844 # 80412be8 <commands+0x1bc>
804044bc:	06b00593          	li	a1,107
804044c0:	0000f517          	auipc	a0,0xf
804044c4:	73450513          	addi	a0,a0,1844 # 80413bf4 <default_pmm_manager+0x4d0>
804044c8:	95cfc0ef          	jal	ra,80400624 <__panic>
804044cc:	0000f697          	auipc	a3,0xf
804044d0:	71468693          	addi	a3,a3,1812 # 80413be0 <default_pmm_manager+0x4bc>
804044d4:	0000e617          	auipc	a2,0xe
804044d8:	71460613          	addi	a2,a2,1812 # 80412be8 <commands+0x1bc>
804044dc:	06800593          	li	a1,104
804044e0:	0000f517          	auipc	a0,0xf
804044e4:	71450513          	addi	a0,a0,1812 # 80413bf4 <default_pmm_manager+0x4d0>
804044e8:	93cfc0ef          	jal	ra,80400624 <__panic>
804044ec:	0000f697          	auipc	a3,0xf
804044f0:	6f468693          	addi	a3,a3,1780 # 80413be0 <default_pmm_manager+0x4bc>
804044f4:	0000e617          	auipc	a2,0xe
804044f8:	6f460613          	addi	a2,a2,1780 # 80412be8 <commands+0x1bc>
804044fc:	06500593          	li	a1,101
80404500:	0000f517          	auipc	a0,0xf
80404504:	6f450513          	addi	a0,a0,1780 # 80413bf4 <default_pmm_manager+0x4d0>
80404508:	91cfc0ef          	jal	ra,80400624 <__panic>
8040450c:	0000f697          	auipc	a3,0xf
80404510:	6d468693          	addi	a3,a3,1748 # 80413be0 <default_pmm_manager+0x4bc>
80404514:	0000e617          	auipc	a2,0xe
80404518:	6d460613          	addi	a2,a2,1748 # 80412be8 <commands+0x1bc>
8040451c:	06200593          	li	a1,98
80404520:	0000f517          	auipc	a0,0xf
80404524:	6d450513          	addi	a0,a0,1748 # 80413bf4 <default_pmm_manager+0x4d0>
80404528:	8fcfc0ef          	jal	ra,80400624 <__panic>

8040452c <_fifo_swap_out_victim>:
8040452c:	01452783          	lw	a5,20(a0)
80404530:	ff010113          	addi	sp,sp,-16
80404534:	00112623          	sw	ra,12(sp)
80404538:	02078a63          	beqz	a5,8040456c <_fifo_swap_out_victim+0x40>
8040453c:	04061863          	bnez	a2,8040458c <_fifo_swap_out_victim+0x60>
80404540:	0047a783          	lw	a5,4(a5)
80404544:	00c12083          	lw	ra,12(sp)
80404548:	00000513          	li	a0,0
8040454c:	0007a683          	lw	a3,0(a5)
80404550:	0047a703          	lw	a4,4(a5)
80404554:	fec78793          	addi	a5,a5,-20
80404558:	00e6a223          	sw	a4,4(a3)
8040455c:	00d72023          	sw	a3,0(a4)
80404560:	00f5a023          	sw	a5,0(a1)
80404564:	01010113          	addi	sp,sp,16
80404568:	00008067          	ret
8040456c:	00010697          	auipc	a3,0x10
80404570:	80c68693          	addi	a3,a3,-2036 # 80413d78 <default_pmm_manager+0x654>
80404574:	0000e617          	auipc	a2,0xe
80404578:	67460613          	addi	a2,a2,1652 # 80412be8 <commands+0x1bc>
8040457c:	05000593          	li	a1,80
80404580:	0000f517          	auipc	a0,0xf
80404584:	67450513          	addi	a0,a0,1652 # 80413bf4 <default_pmm_manager+0x4d0>
80404588:	89cfc0ef          	jal	ra,80400624 <__panic>
8040458c:	0000f697          	auipc	a3,0xf
80404590:	7fc68693          	addi	a3,a3,2044 # 80413d88 <default_pmm_manager+0x664>
80404594:	0000e617          	auipc	a2,0xe
80404598:	65460613          	addi	a2,a2,1620 # 80412be8 <commands+0x1bc>
8040459c:	05100593          	li	a1,81
804045a0:	0000f517          	auipc	a0,0xf
804045a4:	65450513          	addi	a0,a0,1620 # 80413bf4 <default_pmm_manager+0x4d0>
804045a8:	87cfc0ef          	jal	ra,80400624 <__panic>

804045ac <_fifo_map_swappable>:
804045ac:	01460713          	addi	a4,a2,20
804045b0:	01452783          	lw	a5,20(a0)
804045b4:	02070263          	beqz	a4,804045d8 <_fifo_map_swappable+0x2c>
804045b8:	02078063          	beqz	a5,804045d8 <_fifo_map_swappable+0x2c>
804045bc:	0007a683          	lw	a3,0(a5)
804045c0:	00e7a023          	sw	a4,0(a5)
804045c4:	00000513          	li	a0,0
804045c8:	00e6a223          	sw	a4,4(a3)
804045cc:	00f62c23          	sw	a5,24(a2)
804045d0:	00d62a23          	sw	a3,20(a2)
804045d4:	00008067          	ret
804045d8:	ff010113          	addi	sp,sp,-16
804045dc:	0000f697          	auipc	a3,0xf
804045e0:	77c68693          	addi	a3,a3,1916 # 80413d58 <default_pmm_manager+0x634>
804045e4:	0000e617          	auipc	a2,0xe
804045e8:	60460613          	addi	a2,a2,1540 # 80412be8 <commands+0x1bc>
804045ec:	03f00593          	li	a1,63
804045f0:	0000f517          	auipc	a0,0xf
804045f4:	60450513          	addi	a0,a0,1540 # 80413bf4 <default_pmm_manager+0x4d0>
804045f8:	00112623          	sw	ra,12(sp)
804045fc:	828fc0ef          	jal	ra,80400624 <__panic>

80404600 <check_vma_overlap.isra.2.part.3>:
80404600:	ff010113          	addi	sp,sp,-16
80404604:	0000f697          	auipc	a3,0xf
80404608:	7a868693          	addi	a3,a3,1960 # 80413dac <default_pmm_manager+0x688>
8040460c:	0000e617          	auipc	a2,0xe
80404610:	5dc60613          	addi	a2,a2,1500 # 80412be8 <commands+0x1bc>
80404614:	06d00593          	li	a1,109
80404618:	0000f517          	auipc	a0,0xf
8040461c:	7b450513          	addi	a0,a0,1972 # 80413dcc <default_pmm_manager+0x6a8>
80404620:	00112623          	sw	ra,12(sp)
80404624:	800fc0ef          	jal	ra,80400624 <__panic>

80404628 <mm_create>:
80404628:	ff010113          	addi	sp,sp,-16
8040462c:	02c00513          	li	a0,44
80404630:	00812423          	sw	s0,8(sp)
80404634:	00112623          	sw	ra,12(sp)
80404638:	b88fe0ef          	jal	ra,804029c0 <kmalloc>
8040463c:	00050413          	mv	s0,a0
80404640:	02050e63          	beqz	a0,8040467c <mm_create+0x54>
80404644:	00098797          	auipc	a5,0x98
80404648:	16078793          	addi	a5,a5,352 # 8049c7a4 <swap_init_ok>
8040464c:	0007a783          	lw	a5,0(a5)
80404650:	00a42223          	sw	a0,4(s0)
80404654:	00a42023          	sw	a0,0(s0)
80404658:	00052423          	sw	zero,8(a0)
8040465c:	00052623          	sw	zero,12(a0)
80404660:	00052823          	sw	zero,16(a0)
80404664:	02079663          	bnez	a5,80404690 <mm_create+0x68>
80404668:	00052a23          	sw	zero,20(a0)
8040466c:	00042c23          	sw	zero,24(s0)
80404670:	00100593          	li	a1,1
80404674:	01c40513          	addi	a0,s0,28
80404678:	275000ef          	jal	ra,804050ec <sem_init>
8040467c:	00040513          	mv	a0,s0
80404680:	00c12083          	lw	ra,12(sp)
80404684:	00812403          	lw	s0,8(sp)
80404688:	01010113          	addi	sp,sp,16
8040468c:	00008067          	ret
80404690:	85dff0ef          	jal	ra,80403eec <swap_init_mm>
80404694:	fd9ff06f          	j	8040466c <mm_create+0x44>

80404698 <find_vma>:
80404698:	04050263          	beqz	a0,804046dc <find_vma+0x44>
8040469c:	00852783          	lw	a5,8(a0)
804046a0:	00078663          	beqz	a5,804046ac <find_vma+0x14>
804046a4:	0047a703          	lw	a4,4(a5)
804046a8:	04e5f063          	bgeu	a1,a4,804046e8 <find_vma+0x50>
804046ac:	00050793          	mv	a5,a0
804046b0:	0047a783          	lw	a5,4(a5)
804046b4:	02f50463          	beq	a0,a5,804046dc <find_vma+0x44>
804046b8:	ff47a703          	lw	a4,-12(a5)
804046bc:	fee5eae3          	bltu	a1,a4,804046b0 <find_vma+0x18>
804046c0:	ff87a703          	lw	a4,-8(a5)
804046c4:	fee5f6e3          	bgeu	a1,a4,804046b0 <find_vma+0x18>
804046c8:	ff078793          	addi	a5,a5,-16
804046cc:	00078863          	beqz	a5,804046dc <find_vma+0x44>
804046d0:	00f52423          	sw	a5,8(a0)
804046d4:	00078513          	mv	a0,a5
804046d8:	00008067          	ret
804046dc:	00000793          	li	a5,0
804046e0:	00078513          	mv	a0,a5
804046e4:	00008067          	ret
804046e8:	0087a703          	lw	a4,8(a5)
804046ec:	fce5f0e3          	bgeu	a1,a4,804046ac <find_vma+0x14>
804046f0:	00f52423          	sw	a5,8(a0)
804046f4:	fe1ff06f          	j	804046d4 <find_vma+0x3c>

804046f8 <insert_vma_struct>:
804046f8:	0045a603          	lw	a2,4(a1)
804046fc:	0085a803          	lw	a6,8(a1)
80404700:	ff010113          	addi	sp,sp,-16
80404704:	00112623          	sw	ra,12(sp)
80404708:	00050713          	mv	a4,a0
8040470c:	01066a63          	bltu	a2,a6,80404720 <insert_vma_struct+0x28>
80404710:	07c0006f          	j	8040478c <insert_vma_struct+0x94>
80404714:	ff47a683          	lw	a3,-12(a5)
80404718:	06d66463          	bltu	a2,a3,80404780 <insert_vma_struct+0x88>
8040471c:	00078713          	mv	a4,a5
80404720:	00472783          	lw	a5,4(a4)
80404724:	fef518e3          	bne	a0,a5,80404714 <insert_vma_struct+0x1c>
80404728:	02a70463          	beq	a4,a0,80404750 <insert_vma_struct+0x58>
8040472c:	ff872683          	lw	a3,-8(a4)
80404730:	ff472883          	lw	a7,-12(a4)
80404734:	08d8fc63          	bgeu	a7,a3,804047cc <insert_vma_struct+0xd4>
80404738:	06d66a63          	bltu	a2,a3,804047ac <insert_vma_struct+0xb4>
8040473c:	00f50a63          	beq	a0,a5,80404750 <insert_vma_struct+0x58>
80404740:	ff47a683          	lw	a3,-12(a5)
80404744:	0706e463          	bltu	a3,a6,804047ac <insert_vma_struct+0xb4>
80404748:	ff87a603          	lw	a2,-8(a5)
8040474c:	02c6fe63          	bgeu	a3,a2,80404788 <insert_vma_struct+0x90>
80404750:	01052683          	lw	a3,16(a0)
80404754:	00a5a023          	sw	a0,0(a1)
80404758:	01058613          	addi	a2,a1,16
8040475c:	00c7a023          	sw	a2,0(a5)
80404760:	00c72223          	sw	a2,4(a4)
80404764:	00c12083          	lw	ra,12(sp)
80404768:	00f5aa23          	sw	a5,20(a1)
8040476c:	00e5a823          	sw	a4,16(a1)
80404770:	00168693          	addi	a3,a3,1
80404774:	00d52823          	sw	a3,16(a0)
80404778:	01010113          	addi	sp,sp,16
8040477c:	00008067          	ret
80404780:	faa716e3          	bne	a4,a0,8040472c <insert_vma_struct+0x34>
80404784:	fc1ff06f          	j	80404744 <insert_vma_struct+0x4c>
80404788:	e79ff0ef          	jal	ra,80404600 <check_vma_overlap.isra.2.part.3>
8040478c:	0000f697          	auipc	a3,0xf
80404790:	74c68693          	addi	a3,a3,1868 # 80413ed8 <default_pmm_manager+0x7b4>
80404794:	0000e617          	auipc	a2,0xe
80404798:	45460613          	addi	a2,a2,1108 # 80412be8 <commands+0x1bc>
8040479c:	07200593          	li	a1,114
804047a0:	0000f517          	auipc	a0,0xf
804047a4:	62c50513          	addi	a0,a0,1580 # 80413dcc <default_pmm_manager+0x6a8>
804047a8:	e7dfb0ef          	jal	ra,80400624 <__panic>
804047ac:	0000f697          	auipc	a3,0xf
804047b0:	76868693          	addi	a3,a3,1896 # 80413f14 <default_pmm_manager+0x7f0>
804047b4:	0000e617          	auipc	a2,0xe
804047b8:	43460613          	addi	a2,a2,1076 # 80412be8 <commands+0x1bc>
804047bc:	06c00593          	li	a1,108
804047c0:	0000f517          	auipc	a0,0xf
804047c4:	60c50513          	addi	a0,a0,1548 # 80413dcc <default_pmm_manager+0x6a8>
804047c8:	e5dfb0ef          	jal	ra,80400624 <__panic>
804047cc:	0000f697          	auipc	a3,0xf
804047d0:	72868693          	addi	a3,a3,1832 # 80413ef4 <default_pmm_manager+0x7d0>
804047d4:	0000e617          	auipc	a2,0xe
804047d8:	41460613          	addi	a2,a2,1044 # 80412be8 <commands+0x1bc>
804047dc:	06b00593          	li	a1,107
804047e0:	0000f517          	auipc	a0,0xf
804047e4:	5ec50513          	addi	a0,a0,1516 # 80413dcc <default_pmm_manager+0x6a8>
804047e8:	e3dfb0ef          	jal	ra,80400624 <__panic>

804047ec <mm_destroy>:
804047ec:	01852783          	lw	a5,24(a0)
804047f0:	ff010113          	addi	sp,sp,-16
804047f4:	00112623          	sw	ra,12(sp)
804047f8:	00812423          	sw	s0,8(sp)
804047fc:	04079263          	bnez	a5,80404840 <mm_destroy+0x54>
80404800:	00050413          	mv	s0,a0
80404804:	00452503          	lw	a0,4(a0)
80404808:	02a40263          	beq	s0,a0,8040482c <mm_destroy+0x40>
8040480c:	00052703          	lw	a4,0(a0)
80404810:	00452783          	lw	a5,4(a0)
80404814:	ff050513          	addi	a0,a0,-16
80404818:	00f72223          	sw	a5,4(a4)
8040481c:	00e7a023          	sw	a4,0(a5)
80404820:	ac4fe0ef          	jal	ra,80402ae4 <kfree>
80404824:	00442503          	lw	a0,4(s0)
80404828:	fea412e3          	bne	s0,a0,8040480c <mm_destroy+0x20>
8040482c:	00040513          	mv	a0,s0
80404830:	00812403          	lw	s0,8(sp)
80404834:	00c12083          	lw	ra,12(sp)
80404838:	01010113          	addi	sp,sp,16
8040483c:	aa8fe06f          	j	80402ae4 <kfree>
80404840:	0000f697          	auipc	a3,0xf
80404844:	6f468693          	addi	a3,a3,1780 # 80413f34 <default_pmm_manager+0x810>
80404848:	0000e617          	auipc	a2,0xe
8040484c:	3a060613          	addi	a2,a2,928 # 80412be8 <commands+0x1bc>
80404850:	09100593          	li	a1,145
80404854:	0000f517          	auipc	a0,0xf
80404858:	57850513          	addi	a0,a0,1400 # 80413dcc <default_pmm_manager+0x6a8>
8040485c:	dc9fb0ef          	jal	ra,80400624 <__panic>

80404860 <mm_map>:
80404860:	000017b7          	lui	a5,0x1
80404864:	fe010113          	addi	sp,sp,-32
80404868:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040486c:	fffff837          	lui	a6,0xfffff
80404870:	00812c23          	sw	s0,24(sp)
80404874:	00f60433          	add	s0,a2,a5
80404878:	00912a23          	sw	s1,20(sp)
8040487c:	00b40433          	add	s0,s0,a1
80404880:	00112e23          	sw	ra,28(sp)
80404884:	01212823          	sw	s2,16(sp)
80404888:	01312623          	sw	s3,12(sp)
8040488c:	01412423          	sw	s4,8(sp)
80404890:	01512223          	sw	s5,4(sp)
80404894:	0105f4b3          	and	s1,a1,a6
80404898:	002007b7          	lui	a5,0x200
8040489c:	01047433          	and	s0,s0,a6
804048a0:	08f4e863          	bltu	s1,a5,80404930 <mm_map+0xd0>
804048a4:	0884f663          	bgeu	s1,s0,80404930 <mm_map+0xd0>
804048a8:	800007b7          	lui	a5,0x80000
804048ac:	0887e263          	bltu	a5,s0,80404930 <mm_map+0xd0>
804048b0:	00050993          	mv	s3,a0
804048b4:	00070a13          	mv	s4,a4
804048b8:	00068a93          	mv	s5,a3
804048bc:	06050e63          	beqz	a0,80404938 <mm_map+0xd8>
804048c0:	00048593          	mv	a1,s1
804048c4:	dd5ff0ef          	jal	ra,80404698 <find_vma>
804048c8:	00050663          	beqz	a0,804048d4 <mm_map+0x74>
804048cc:	00452783          	lw	a5,4(a0)
804048d0:	0687e063          	bltu	a5,s0,80404930 <mm_map+0xd0>
804048d4:	01800513          	li	a0,24
804048d8:	8e8fe0ef          	jal	ra,804029c0 <kmalloc>
804048dc:	00050913          	mv	s2,a0
804048e0:	ffc00513          	li	a0,-4
804048e4:	02090463          	beqz	s2,8040490c <mm_map+0xac>
804048e8:	00098513          	mv	a0,s3
804048ec:	00992223          	sw	s1,4(s2)
804048f0:	00892423          	sw	s0,8(s2)
804048f4:	01592623          	sw	s5,12(s2)
804048f8:	00090593          	mv	a1,s2
804048fc:	dfdff0ef          	jal	ra,804046f8 <insert_vma_struct>
80404900:	00000513          	li	a0,0
80404904:	000a0463          	beqz	s4,8040490c <mm_map+0xac>
80404908:	012a2023          	sw	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x7000>
8040490c:	01c12083          	lw	ra,28(sp)
80404910:	01812403          	lw	s0,24(sp)
80404914:	01412483          	lw	s1,20(sp)
80404918:	01012903          	lw	s2,16(sp)
8040491c:	00c12983          	lw	s3,12(sp)
80404920:	00812a03          	lw	s4,8(sp)
80404924:	00412a83          	lw	s5,4(sp)
80404928:	02010113          	addi	sp,sp,32
8040492c:	00008067          	ret
80404930:	ffd00513          	li	a0,-3
80404934:	fd9ff06f          	j	8040490c <mm_map+0xac>
80404938:	0000f697          	auipc	a3,0xf
8040493c:	61068693          	addi	a3,a3,1552 # 80413f48 <default_pmm_manager+0x824>
80404940:	0000e617          	auipc	a2,0xe
80404944:	2a860613          	addi	a2,a2,680 # 80412be8 <commands+0x1bc>
80404948:	0a400593          	li	a1,164
8040494c:	0000f517          	auipc	a0,0xf
80404950:	48050513          	addi	a0,a0,1152 # 80413dcc <default_pmm_manager+0x6a8>
80404954:	cd1fb0ef          	jal	ra,80400624 <__panic>

80404958 <dup_mmap>:
80404958:	fe010113          	addi	sp,sp,-32
8040495c:	00112e23          	sw	ra,28(sp)
80404960:	00812c23          	sw	s0,24(sp)
80404964:	00912a23          	sw	s1,20(sp)
80404968:	01212823          	sw	s2,16(sp)
8040496c:	01312623          	sw	s3,12(sp)
80404970:	01412423          	sw	s4,8(sp)
80404974:	01512223          	sw	s5,4(sp)
80404978:	0a050063          	beqz	a0,80404a18 <dup_mmap+0xc0>
8040497c:	00050913          	mv	s2,a0
80404980:	00058493          	mv	s1,a1
80404984:	00058413          	mv	s0,a1
80404988:	02059e63          	bnez	a1,804049c4 <dup_mmap+0x6c>
8040498c:	08c0006f          	j	80404a18 <dup_mmap+0xc0>
80404990:	00050593          	mv	a1,a0
80404994:	0157a223          	sw	s5,4(a5) # 80000004 <end+0xffb63748>
80404998:	00090513          	mv	a0,s2
8040499c:	0147a423          	sw	s4,8(a5)
804049a0:	0137a623          	sw	s3,12(a5)
804049a4:	d55ff0ef          	jal	ra,804046f8 <insert_vma_struct>
804049a8:	ff842683          	lw	a3,-8(s0)
804049ac:	ff442603          	lw	a2,-12(s0)
804049b0:	00c4a583          	lw	a1,12(s1)
804049b4:	00c92503          	lw	a0,12(s2)
804049b8:	00000713          	li	a4,0
804049bc:	a6dfe0ef          	jal	ra,80403428 <copy_range>
804049c0:	02051463          	bnez	a0,804049e8 <dup_mmap+0x90>
804049c4:	00042403          	lw	s0,0(s0)
804049c8:	04848463          	beq	s1,s0,80404a10 <dup_mmap+0xb8>
804049cc:	01800513          	li	a0,24
804049d0:	ff442a83          	lw	s5,-12(s0)
804049d4:	ff842a03          	lw	s4,-8(s0)
804049d8:	ffc42983          	lw	s3,-4(s0)
804049dc:	fe5fd0ef          	jal	ra,804029c0 <kmalloc>
804049e0:	00050793          	mv	a5,a0
804049e4:	fa0516e3          	bnez	a0,80404990 <dup_mmap+0x38>
804049e8:	ffc00513          	li	a0,-4
804049ec:	01c12083          	lw	ra,28(sp)
804049f0:	01812403          	lw	s0,24(sp)
804049f4:	01412483          	lw	s1,20(sp)
804049f8:	01012903          	lw	s2,16(sp)
804049fc:	00c12983          	lw	s3,12(sp)
80404a00:	00812a03          	lw	s4,8(sp)
80404a04:	00412a83          	lw	s5,4(sp)
80404a08:	02010113          	addi	sp,sp,32
80404a0c:	00008067          	ret
80404a10:	00000513          	li	a0,0
80404a14:	fd9ff06f          	j	804049ec <dup_mmap+0x94>
80404a18:	0000f697          	auipc	a3,0xf
80404a1c:	48468693          	addi	a3,a3,1156 # 80413e9c <default_pmm_manager+0x778>
80404a20:	0000e617          	auipc	a2,0xe
80404a24:	1c860613          	addi	a2,a2,456 # 80412be8 <commands+0x1bc>
80404a28:	0bc00593          	li	a1,188
80404a2c:	0000f517          	auipc	a0,0xf
80404a30:	3a050513          	addi	a0,a0,928 # 80413dcc <default_pmm_manager+0x6a8>
80404a34:	bf1fb0ef          	jal	ra,80400624 <__panic>

80404a38 <exit_mmap>:
80404a38:	ff010113          	addi	sp,sp,-16
80404a3c:	00112623          	sw	ra,12(sp)
80404a40:	00812423          	sw	s0,8(sp)
80404a44:	00912223          	sw	s1,4(sp)
80404a48:	01212023          	sw	s2,0(sp)
80404a4c:	06050663          	beqz	a0,80404ab8 <exit_mmap+0x80>
80404a50:	01852783          	lw	a5,24(a0)
80404a54:	00050493          	mv	s1,a0
80404a58:	06079063          	bnez	a5,80404ab8 <exit_mmap+0x80>
80404a5c:	00452403          	lw	s0,4(a0)
80404a60:	00c52903          	lw	s2,12(a0)
80404a64:	02850a63          	beq	a0,s0,80404a98 <exit_mmap+0x60>
80404a68:	ff842603          	lw	a2,-8(s0)
80404a6c:	ff442583          	lw	a1,-12(s0)
80404a70:	00090513          	mv	a0,s2
80404a74:	dc8fe0ef          	jal	ra,8040303c <unmap_range>
80404a78:	00442403          	lw	s0,4(s0)
80404a7c:	fe8496e3          	bne	s1,s0,80404a68 <exit_mmap+0x30>
80404a80:	00442403          	lw	s0,4(s0)
80404a84:	00848e63          	beq	s1,s0,80404aa0 <exit_mmap+0x68>
80404a88:	ff842603          	lw	a2,-8(s0)
80404a8c:	ff442583          	lw	a1,-12(s0)
80404a90:	00090513          	mv	a0,s2
80404a94:	f2cfe0ef          	jal	ra,804031c0 <exit_range>
80404a98:	00442403          	lw	s0,4(s0)
80404a9c:	fe8496e3          	bne	s1,s0,80404a88 <exit_mmap+0x50>
80404aa0:	00c12083          	lw	ra,12(sp)
80404aa4:	00812403          	lw	s0,8(sp)
80404aa8:	00412483          	lw	s1,4(sp)
80404aac:	00012903          	lw	s2,0(sp)
80404ab0:	01010113          	addi	sp,sp,16
80404ab4:	00008067          	ret
80404ab8:	0000f697          	auipc	a3,0xf
80404abc:	40068693          	addi	a3,a3,1024 # 80413eb8 <default_pmm_manager+0x794>
80404ac0:	0000e617          	auipc	a2,0xe
80404ac4:	12860613          	addi	a2,a2,296 # 80412be8 <commands+0x1bc>
80404ac8:	0d200593          	li	a1,210
80404acc:	0000f517          	auipc	a0,0xf
80404ad0:	30050513          	addi	a0,a0,768 # 80413dcc <default_pmm_manager+0x6a8>
80404ad4:	b51fb0ef          	jal	ra,80400624 <__panic>

80404ad8 <vmm_init>:
80404ad8:	00008067          	ret

80404adc <do_pgfault>:
80404adc:	fd010113          	addi	sp,sp,-48
80404ae0:	00060593          	mv	a1,a2
80404ae4:	02912223          	sw	s1,36(sp)
80404ae8:	03212023          	sw	s2,32(sp)
80404aec:	02112623          	sw	ra,44(sp)
80404af0:	02812423          	sw	s0,40(sp)
80404af4:	01312e23          	sw	s3,28(sp)
80404af8:	00060493          	mv	s1,a2
80404afc:	00050913          	mv	s2,a0
80404b00:	b99ff0ef          	jal	ra,80404698 <find_vma>
80404b04:	00098797          	auipc	a5,0x98
80404b08:	ca478793          	addi	a5,a5,-860 # 8049c7a8 <pgfault_num>
80404b0c:	0007a783          	lw	a5,0(a5)
80404b10:	00178793          	addi	a5,a5,1
80404b14:	00098717          	auipc	a4,0x98
80404b18:	c8f72a23          	sw	a5,-876(a4) # 8049c7a8 <pgfault_num>
80404b1c:	10050e63          	beqz	a0,80404c38 <do_pgfault+0x15c>
80404b20:	00452783          	lw	a5,4(a0)
80404b24:	10f4ea63          	bltu	s1,a5,80404c38 <do_pgfault+0x15c>
80404b28:	00c52403          	lw	s0,12(a0)
80404b2c:	fffff637          	lui	a2,0xfffff
80404b30:	00c92503          	lw	a0,12(s2)
80404b34:	00247413          	andi	s0,s0,2
80404b38:	00c4f4b3          	and	s1,s1,a2
80404b3c:	00143413          	seqz	s0,s0
80404b40:	40800433          	neg	s0,s0
80404b44:	00100613          	li	a2,1
80404b48:	00048593          	mv	a1,s1
80404b4c:	ff947413          	andi	s0,s0,-7
80404b50:	b84fe0ef          	jal	ra,80402ed4 <get_pte>
80404b54:	01740413          	addi	s0,s0,23
80404b58:	10050663          	beqz	a0,80404c64 <do_pgfault+0x188>
80404b5c:	00052583          	lw	a1,0(a0)
80404b60:	0a058663          	beqz	a1,80404c0c <do_pgfault+0x130>
80404b64:	00098797          	auipc	a5,0x98
80404b68:	c4078793          	addi	a5,a5,-960 # 8049c7a4 <swap_init_ok>
80404b6c:	0007a783          	lw	a5,0(a5)
80404b70:	0e078063          	beqz	a5,80404c50 <do_pgfault+0x174>
80404b74:	00c10613          	addi	a2,sp,12
80404b78:	00048593          	mv	a1,s1
80404b7c:	00090513          	mv	a0,s2
80404b80:	00012623          	sw	zero,12(sp)
80404b84:	d3cff0ef          	jal	ra,804040c0 <swap_in>
80404b88:	00050993          	mv	s3,a0
80404b8c:	04051a63          	bnez	a0,80404be0 <do_pgfault+0x104>
80404b90:	00c12583          	lw	a1,12(sp)
80404b94:	00c92503          	lw	a0,12(s2)
80404b98:	00040693          	mv	a3,s0
80404b9c:	00048613          	mv	a2,s1
80404ba0:	f68fe0ef          	jal	ra,80403308 <page_insert>
80404ba4:	00c12603          	lw	a2,12(sp)
80404ba8:	00100693          	li	a3,1
80404bac:	00048593          	mv	a1,s1
80404bb0:	00090513          	mv	a0,s2
80404bb4:	b4cff0ef          	jal	ra,80403f00 <swap_map_swappable>
80404bb8:	00c12783          	lw	a5,12(sp)
80404bbc:	0097ae23          	sw	s1,28(a5)
80404bc0:	02c12083          	lw	ra,44(sp)
80404bc4:	02812403          	lw	s0,40(sp)
80404bc8:	00098513          	mv	a0,s3
80404bcc:	02412483          	lw	s1,36(sp)
80404bd0:	02012903          	lw	s2,32(sp)
80404bd4:	01c12983          	lw	s3,28(sp)
80404bd8:	03010113          	addi	sp,sp,48
80404bdc:	00008067          	ret
80404be0:	0000f517          	auipc	a0,0xf
80404be4:	27450513          	addi	a0,a0,628 # 80413e54 <default_pmm_manager+0x730>
80404be8:	e14fb0ef          	jal	ra,804001fc <cprintf>
80404bec:	02c12083          	lw	ra,44(sp)
80404bf0:	02812403          	lw	s0,40(sp)
80404bf4:	00098513          	mv	a0,s3
80404bf8:	02412483          	lw	s1,36(sp)
80404bfc:	02012903          	lw	s2,32(sp)
80404c00:	01c12983          	lw	s3,28(sp)
80404c04:	03010113          	addi	sp,sp,48
80404c08:	00008067          	ret
80404c0c:	00c92503          	lw	a0,12(s2)
80404c10:	00040613          	mv	a2,s0
80404c14:	00048593          	mv	a1,s1
80404c18:	ae5fe0ef          	jal	ra,804036fc <pgdir_alloc_page>
80404c1c:	00000993          	li	s3,0
80404c20:	fa0510e3          	bnez	a0,80404bc0 <do_pgfault+0xe4>
80404c24:	0000f517          	auipc	a0,0xf
80404c28:	20850513          	addi	a0,a0,520 # 80413e2c <default_pmm_manager+0x708>
80404c2c:	dd0fb0ef          	jal	ra,804001fc <cprintf>
80404c30:	ffc00993          	li	s3,-4
80404c34:	f8dff06f          	j	80404bc0 <do_pgfault+0xe4>
80404c38:	00048593          	mv	a1,s1
80404c3c:	0000f517          	auipc	a0,0xf
80404c40:	1a050513          	addi	a0,a0,416 # 80413ddc <default_pmm_manager+0x6b8>
80404c44:	db8fb0ef          	jal	ra,804001fc <cprintf>
80404c48:	ffd00993          	li	s3,-3
80404c4c:	f75ff06f          	j	80404bc0 <do_pgfault+0xe4>
80404c50:	0000f517          	auipc	a0,0xf
80404c54:	22450513          	addi	a0,a0,548 # 80413e74 <default_pmm_manager+0x750>
80404c58:	da4fb0ef          	jal	ra,804001fc <cprintf>
80404c5c:	ffc00993          	li	s3,-4
80404c60:	f61ff06f          	j	80404bc0 <do_pgfault+0xe4>
80404c64:	0000f517          	auipc	a0,0xf
80404c68:	1a850513          	addi	a0,a0,424 # 80413e0c <default_pmm_manager+0x6e8>
80404c6c:	d90fb0ef          	jal	ra,804001fc <cprintf>
80404c70:	ffc00993          	li	s3,-4
80404c74:	f4dff06f          	j	80404bc0 <do_pgfault+0xe4>

80404c78 <user_mem_check>:
80404c78:	fe010113          	addi	sp,sp,-32
80404c7c:	00812c23          	sw	s0,24(sp)
80404c80:	00112e23          	sw	ra,28(sp)
80404c84:	00912a23          	sw	s1,20(sp)
80404c88:	01212823          	sw	s2,16(sp)
80404c8c:	01312623          	sw	s3,12(sp)
80404c90:	01412423          	sw	s4,8(sp)
80404c94:	00058413          	mv	s0,a1
80404c98:	08050c63          	beqz	a0,80404d30 <user_mem_check+0xb8>
80404c9c:	002007b7          	lui	a5,0x200
80404ca0:	06f5e663          	bltu	a1,a5,80404d0c <user_mem_check+0x94>
80404ca4:	00c584b3          	add	s1,a1,a2
80404ca8:	0695f263          	bgeu	a1,s1,80404d0c <user_mem_check+0x94>
80404cac:	800007b7          	lui	a5,0x80000
80404cb0:	0497ee63          	bltu	a5,s1,80404d0c <user_mem_check+0x94>
80404cb4:	00050913          	mv	s2,a0
80404cb8:	00068993          	mv	s3,a3
80404cbc:	00001a37          	lui	s4,0x1
80404cc0:	0240006f          	j	80404ce4 <user_mem_check+0x6c>
80404cc4:	0027f693          	andi	a3,a5,2
80404cc8:	01470733          	add	a4,a4,s4
80404ccc:	0087f793          	andi	a5,a5,8
80404cd0:	02068e63          	beqz	a3,80404d0c <user_mem_check+0x94>
80404cd4:	00078463          	beqz	a5,80404cdc <user_mem_check+0x64>
80404cd8:	02e46a63          	bltu	s0,a4,80404d0c <user_mem_check+0x94>
80404cdc:	00852403          	lw	s0,8(a0)
80404ce0:	06947463          	bgeu	s0,s1,80404d48 <user_mem_check+0xd0>
80404ce4:	00040593          	mv	a1,s0
80404ce8:	00090513          	mv	a0,s2
80404cec:	9adff0ef          	jal	ra,80404698 <find_vma>
80404cf0:	00050e63          	beqz	a0,80404d0c <user_mem_check+0x94>
80404cf4:	00452703          	lw	a4,4(a0)
80404cf8:	00e46a63          	bltu	s0,a4,80404d0c <user_mem_check+0x94>
80404cfc:	00c52783          	lw	a5,12(a0)
80404d00:	fc0992e3          	bnez	s3,80404cc4 <user_mem_check+0x4c>
80404d04:	0017f793          	andi	a5,a5,1
80404d08:	fc079ae3          	bnez	a5,80404cdc <user_mem_check+0x64>
80404d0c:	00000513          	li	a0,0
80404d10:	01c12083          	lw	ra,28(sp)
80404d14:	01812403          	lw	s0,24(sp)
80404d18:	01412483          	lw	s1,20(sp)
80404d1c:	01012903          	lw	s2,16(sp)
80404d20:	00c12983          	lw	s3,12(sp)
80404d24:	00812a03          	lw	s4,8(sp)
80404d28:	02010113          	addi	sp,sp,32
80404d2c:	00008067          	ret
80404d30:	804007b7          	lui	a5,0x80400
80404d34:	fcf5ece3          	bltu	a1,a5,80404d0c <user_mem_check+0x94>
80404d38:	00c58633          	add	a2,a1,a2
80404d3c:	fcc5f8e3          	bgeu	a1,a2,80404d0c <user_mem_check+0x94>
80404d40:	80c007b7          	lui	a5,0x80c00
80404d44:	fcc7e4e3          	bltu	a5,a2,80404d0c <user_mem_check+0x94>
80404d48:	00100513          	li	a0,1
80404d4c:	fc5ff06f          	j	80404d10 <user_mem_check+0x98>

80404d50 <copy_from_user>:
80404d50:	ff010113          	addi	sp,sp,-16
80404d54:	00812423          	sw	s0,8(sp)
80404d58:	00912223          	sw	s1,4(sp)
80404d5c:	00060413          	mv	s0,a2
80404d60:	00068493          	mv	s1,a3
80404d64:	01212023          	sw	s2,0(sp)
80404d68:	00070693          	mv	a3,a4
80404d6c:	00058913          	mv	s2,a1
80404d70:	00048613          	mv	a2,s1
80404d74:	00040593          	mv	a1,s0
80404d78:	00112623          	sw	ra,12(sp)
80404d7c:	efdff0ef          	jal	ra,80404c78 <user_mem_check>
80404d80:	00050c63          	beqz	a0,80404d98 <copy_from_user+0x48>
80404d84:	00048613          	mv	a2,s1
80404d88:	00040593          	mv	a1,s0
80404d8c:	00090513          	mv	a0,s2
80404d90:	2990d0ef          	jal	ra,80412828 <memcpy>
80404d94:	00100513          	li	a0,1
80404d98:	00c12083          	lw	ra,12(sp)
80404d9c:	00812403          	lw	s0,8(sp)
80404da0:	00412483          	lw	s1,4(sp)
80404da4:	00012903          	lw	s2,0(sp)
80404da8:	01010113          	addi	sp,sp,16
80404dac:	00008067          	ret

80404db0 <copy_to_user>:
80404db0:	ff010113          	addi	sp,sp,-16
80404db4:	00812423          	sw	s0,8(sp)
80404db8:	00068413          	mv	s0,a3
80404dbc:	01212023          	sw	s2,0(sp)
80404dc0:	00100693          	li	a3,1
80404dc4:	00060913          	mv	s2,a2
80404dc8:	00040613          	mv	a2,s0
80404dcc:	00912223          	sw	s1,4(sp)
80404dd0:	00112623          	sw	ra,12(sp)
80404dd4:	00058493          	mv	s1,a1
80404dd8:	ea1ff0ef          	jal	ra,80404c78 <user_mem_check>
80404ddc:	00050c63          	beqz	a0,80404df4 <copy_to_user+0x44>
80404de0:	00040613          	mv	a2,s0
80404de4:	00090593          	mv	a1,s2
80404de8:	00048513          	mv	a0,s1
80404dec:	23d0d0ef          	jal	ra,80412828 <memcpy>
80404df0:	00100513          	li	a0,1
80404df4:	00c12083          	lw	ra,12(sp)
80404df8:	00812403          	lw	s0,8(sp)
80404dfc:	00412483          	lw	s1,4(sp)
80404e00:	00012903          	lw	s2,0(sp)
80404e04:	01010113          	addi	sp,sp,16
80404e08:	00008067          	ret

80404e0c <copy_string>:
80404e0c:	fe010113          	addi	sp,sp,-32
80404e10:	01312623          	sw	s3,12(sp)
80404e14:	000019b7          	lui	s3,0x1
80404e18:	013609b3          	add	s3,a2,s3
80404e1c:	fffff7b7          	lui	a5,0xfffff
80404e20:	00f9f9b3          	and	s3,s3,a5
80404e24:	00912a23          	sw	s1,20(sp)
80404e28:	01212823          	sw	s2,16(sp)
80404e2c:	01412423          	sw	s4,8(sp)
80404e30:	01512223          	sw	s5,4(sp)
80404e34:	00112e23          	sw	ra,28(sp)
80404e38:	00812c23          	sw	s0,24(sp)
80404e3c:	00060493          	mv	s1,a2
80404e40:	00050a93          	mv	s5,a0
80404e44:	00058a13          	mv	s4,a1
80404e48:	00068913          	mv	s2,a3
80404e4c:	40c989b3          	sub	s3,s3,a2
80404e50:	0380006f          	j	80404e88 <copy_string+0x7c>
80404e54:	00048513          	mv	a0,s1
80404e58:	0ad0d0ef          	jal	ra,80412704 <strnlen>
80404e5c:	00050793          	mv	a5,a0
80404e60:	00048593          	mv	a1,s1
80404e64:	000a0513          	mv	a0,s4
80404e68:	00040613          	mv	a2,s0
80404e6c:	0687e663          	bltu	a5,s0,80404ed8 <copy_string+0xcc>
80404e70:	0529f063          	bgeu	s3,s2,80404eb0 <copy_string+0xa4>
80404e74:	1b50d0ef          	jal	ra,80412828 <memcpy>
80404e78:	008a0a33          	add	s4,s4,s0
80404e7c:	008484b3          	add	s1,s1,s0
80404e80:	40890933          	sub	s2,s2,s0
80404e84:	000019b7          	lui	s3,0x1
80404e88:	00000693          	li	a3,0
80404e8c:	00048593          	mv	a1,s1
80404e90:	000a8513          	mv	a0,s5
80404e94:	00090413          	mv	s0,s2
80404e98:	0129f463          	bgeu	s3,s2,80404ea0 <copy_string+0x94>
80404e9c:	00098413          	mv	s0,s3
80404ea0:	00040613          	mv	a2,s0
80404ea4:	dd5ff0ef          	jal	ra,80404c78 <user_mem_check>
80404ea8:	00040593          	mv	a1,s0
80404eac:	fa0514e3          	bnez	a0,80404e54 <copy_string+0x48>
80404eb0:	00000513          	li	a0,0
80404eb4:	01c12083          	lw	ra,28(sp)
80404eb8:	01812403          	lw	s0,24(sp)
80404ebc:	01412483          	lw	s1,20(sp)
80404ec0:	01012903          	lw	s2,16(sp)
80404ec4:	00c12983          	lw	s3,12(sp)
80404ec8:	00812a03          	lw	s4,8(sp)
80404ecc:	00412a83          	lw	s5,4(sp)
80404ed0:	02010113          	addi	sp,sp,32
80404ed4:	00008067          	ret
80404ed8:	00178613          	addi	a2,a5,1 # fffff001 <end+0x7fb62745>
80404edc:	14d0d0ef          	jal	ra,80412828 <memcpy>
80404ee0:	00100513          	li	a0,1
80404ee4:	fd1ff06f          	j	80404eb4 <copy_string+0xa8>

80404ee8 <__down.constprop.0>:
80404ee8:	fc010113          	addi	sp,sp,-64
80404eec:	02112e23          	sw	ra,60(sp)
80404ef0:	02812c23          	sw	s0,56(sp)
80404ef4:	02912a23          	sw	s1,52(sp)
80404ef8:	100027f3          	csrr	a5,sstatus
80404efc:	0027f793          	andi	a5,a5,2
80404f00:	08079663          	bnez	a5,80404f8c <__down.constprop.0+0xa4>
80404f04:	00052703          	lw	a4,0(a0)
80404f08:	02e05263          	blez	a4,80404f2c <__down.constprop.0+0x44>
80404f0c:	03c12083          	lw	ra,60(sp)
80404f10:	03812403          	lw	s0,56(sp)
80404f14:	fff70713          	addi	a4,a4,-1
80404f18:	00e52023          	sw	a4,0(a0)
80404f1c:	03412483          	lw	s1,52(sp)
80404f20:	00078513          	mv	a0,a5
80404f24:	04010113          	addi	sp,sp,64
80404f28:	00008067          	ret
80404f2c:	00450413          	addi	s0,a0,4
80404f30:	01c10493          	addi	s1,sp,28
80404f34:	10000613          	li	a2,256
80404f38:	00048593          	mv	a1,s1
80404f3c:	00040513          	mv	a0,s0
80404f40:	3ac000ef          	jal	ra,804052ec <wait_current_set>
80404f44:	335070ef          	jal	ra,8040ca78 <schedule>
80404f48:	100027f3          	csrr	a5,sstatus
80404f4c:	0027f793          	andi	a5,a5,2
80404f50:	0a079463          	bnez	a5,80404ff8 <__down.constprop.0+0x110>
80404f54:	00048513          	mv	a0,s1
80404f58:	29c000ef          	jal	ra,804051f4 <wait_in_queue>
80404f5c:	08051663          	bnez	a0,80404fe8 <__down.constprop.0+0x100>
80404f60:	02012783          	lw	a5,32(sp)
80404f64:	03c12083          	lw	ra,60(sp)
80404f68:	03812403          	lw	s0,56(sp)
80404f6c:	f0078713          	addi	a4,a5,-256
80404f70:	00e03733          	snez	a4,a4
80404f74:	40e00733          	neg	a4,a4
80404f78:	00e7f7b3          	and	a5,a5,a4
80404f7c:	03412483          	lw	s1,52(sp)
80404f80:	00078513          	mv	a0,a5
80404f84:	04010113          	addi	sp,sp,64
80404f88:	00008067          	ret
80404f8c:	00a12623          	sw	a0,12(sp)
80404f90:	c8dfb0ef          	jal	ra,80400c1c <intr_disable>
80404f94:	00c12503          	lw	a0,12(sp)
80404f98:	00052783          	lw	a5,0(a0)
80404f9c:	02f05663          	blez	a5,80404fc8 <__down.constprop.0+0xe0>
80404fa0:	fff78793          	addi	a5,a5,-1
80404fa4:	00f52023          	sw	a5,0(a0)
80404fa8:	c6dfb0ef          	jal	ra,80400c14 <intr_enable>
80404fac:	03c12083          	lw	ra,60(sp)
80404fb0:	03812403          	lw	s0,56(sp)
80404fb4:	00000793          	li	a5,0
80404fb8:	03412483          	lw	s1,52(sp)
80404fbc:	00078513          	mv	a0,a5
80404fc0:	04010113          	addi	sp,sp,64
80404fc4:	00008067          	ret
80404fc8:	00450413          	addi	s0,a0,4
80404fcc:	01c10493          	addi	s1,sp,28
80404fd0:	10000613          	li	a2,256
80404fd4:	00048593          	mv	a1,s1
80404fd8:	00040513          	mv	a0,s0
80404fdc:	310000ef          	jal	ra,804052ec <wait_current_set>
80404fe0:	c35fb0ef          	jal	ra,80400c14 <intr_enable>
80404fe4:	f61ff06f          	j	80404f44 <__down.constprop.0+0x5c>
80404fe8:	00048593          	mv	a1,s1
80404fec:	00040513          	mv	a0,s0
80404ff0:	1a4000ef          	jal	ra,80405194 <wait_queue_del>
80404ff4:	f6dff06f          	j	80404f60 <__down.constprop.0+0x78>
80404ff8:	c25fb0ef          	jal	ra,80400c1c <intr_disable>
80404ffc:	00048513          	mv	a0,s1
80405000:	1f4000ef          	jal	ra,804051f4 <wait_in_queue>
80405004:	00051663          	bnez	a0,80405010 <__down.constprop.0+0x128>
80405008:	c0dfb0ef          	jal	ra,80400c14 <intr_enable>
8040500c:	f55ff06f          	j	80404f60 <__down.constprop.0+0x78>
80405010:	00048593          	mv	a1,s1
80405014:	00040513          	mv	a0,s0
80405018:	17c000ef          	jal	ra,80405194 <wait_queue_del>
8040501c:	fedff06f          	j	80405008 <__down.constprop.0+0x120>

80405020 <__up.constprop.1>:
80405020:	ff010113          	addi	sp,sp,-16
80405024:	00912223          	sw	s1,4(sp)
80405028:	00112623          	sw	ra,12(sp)
8040502c:	00812423          	sw	s0,8(sp)
80405030:	01212023          	sw	s2,0(sp)
80405034:	00050493          	mv	s1,a0
80405038:	100027f3          	csrr	a5,sstatus
8040503c:	0027f793          	andi	a5,a5,2
80405040:	00000913          	li	s2,0
80405044:	06079e63          	bnez	a5,804050c0 <__up.constprop.1+0xa0>
80405048:	00448413          	addi	s0,s1,4
8040504c:	00040513          	mv	a0,s0
80405050:	17c000ef          	jal	ra,804051cc <wait_queue_first>
80405054:	04050e63          	beqz	a0,804050b0 <__up.constprop.1+0x90>
80405058:	00052703          	lw	a4,0(a0)
8040505c:	10000793          	li	a5,256
80405060:	0a872703          	lw	a4,168(a4)
80405064:	06f71463          	bne	a4,a5,804050cc <__up.constprop.1+0xac>
80405068:	00050593          	mv	a1,a0
8040506c:	00100693          	li	a3,1
80405070:	10000613          	li	a2,256
80405074:	00040513          	mv	a0,s0
80405078:	190000ef          	jal	ra,80405208 <wakeup_wait>
8040507c:	00091e63          	bnez	s2,80405098 <__up.constprop.1+0x78>
80405080:	00c12083          	lw	ra,12(sp)
80405084:	00812403          	lw	s0,8(sp)
80405088:	00412483          	lw	s1,4(sp)
8040508c:	00012903          	lw	s2,0(sp)
80405090:	01010113          	addi	sp,sp,16
80405094:	00008067          	ret
80405098:	00812403          	lw	s0,8(sp)
8040509c:	00c12083          	lw	ra,12(sp)
804050a0:	00412483          	lw	s1,4(sp)
804050a4:	00012903          	lw	s2,0(sp)
804050a8:	01010113          	addi	sp,sp,16
804050ac:	b69fb06f          	j	80400c14 <intr_enable>
804050b0:	0004a783          	lw	a5,0(s1)
804050b4:	00178793          	addi	a5,a5,1
804050b8:	00f4a023          	sw	a5,0(s1)
804050bc:	fc1ff06f          	j	8040507c <__up.constprop.1+0x5c>
804050c0:	b5dfb0ef          	jal	ra,80400c1c <intr_disable>
804050c4:	00100913          	li	s2,1
804050c8:	f81ff06f          	j	80405048 <__up.constprop.1+0x28>
804050cc:	0000f697          	auipc	a3,0xf
804050d0:	e8868693          	addi	a3,a3,-376 # 80413f54 <default_pmm_manager+0x830>
804050d4:	0000e617          	auipc	a2,0xe
804050d8:	b1460613          	addi	a2,a2,-1260 # 80412be8 <commands+0x1bc>
804050dc:	01a00593          	li	a1,26
804050e0:	0000f517          	auipc	a0,0xf
804050e4:	e9c50513          	addi	a0,a0,-356 # 80413f7c <default_pmm_manager+0x858>
804050e8:	d3cfb0ef          	jal	ra,80400624 <__panic>

804050ec <sem_init>:
804050ec:	00b52023          	sw	a1,0(a0)
804050f0:	00450513          	addi	a0,a0,4
804050f4:	0940006f          	j	80405188 <wait_queue_init>

804050f8 <up>:
804050f8:	f29ff06f          	j	80405020 <__up.constprop.1>

804050fc <down>:
804050fc:	ff010113          	addi	sp,sp,-16
80405100:	00112623          	sw	ra,12(sp)
80405104:	de5ff0ef          	jal	ra,80404ee8 <__down.constprop.0>
80405108:	00051863          	bnez	a0,80405118 <down+0x1c>
8040510c:	00c12083          	lw	ra,12(sp)
80405110:	01010113          	addi	sp,sp,16
80405114:	00008067          	ret
80405118:	0000f697          	auipc	a3,0xf
8040511c:	e7468693          	addi	a3,a3,-396 # 80413f8c <default_pmm_manager+0x868>
80405120:	0000e617          	auipc	a2,0xe
80405124:	ac860613          	addi	a2,a2,-1336 # 80412be8 <commands+0x1bc>
80405128:	04100593          	li	a1,65
8040512c:	0000f517          	auipc	a0,0xf
80405130:	e5050513          	addi	a0,a0,-432 # 80413f7c <default_pmm_manager+0x858>
80405134:	cf0fb0ef          	jal	ra,80400624 <__panic>

80405138 <wait_queue_del.part.1>:
80405138:	ff010113          	addi	sp,sp,-16
8040513c:	0000f697          	auipc	a3,0xf
80405140:	e6c68693          	addi	a3,a3,-404 # 80413fa8 <default_pmm_manager+0x884>
80405144:	0000e617          	auipc	a2,0xe
80405148:	aa460613          	addi	a2,a2,-1372 # 80412be8 <commands+0x1bc>
8040514c:	01e00593          	li	a1,30
80405150:	0000f517          	auipc	a0,0xf
80405154:	e9850513          	addi	a0,a0,-360 # 80413fe8 <default_pmm_manager+0x8c4>
80405158:	00112623          	sw	ra,12(sp)
8040515c:	cc8fb0ef          	jal	ra,80400624 <__panic>

80405160 <wait_queue_next.part.2>:
80405160:	ff010113          	addi	sp,sp,-16
80405164:	0000f697          	auipc	a3,0xf
80405168:	e4468693          	addi	a3,a3,-444 # 80413fa8 <default_pmm_manager+0x884>
8040516c:	0000e617          	auipc	a2,0xe
80405170:	a7c60613          	addi	a2,a2,-1412 # 80412be8 <commands+0x1bc>
80405174:	02400593          	li	a1,36
80405178:	0000f517          	auipc	a0,0xf
8040517c:	e7050513          	addi	a0,a0,-400 # 80413fe8 <default_pmm_manager+0x8c4>
80405180:	00112623          	sw	ra,12(sp)
80405184:	ca0fb0ef          	jal	ra,80400624 <__panic>

80405188 <wait_queue_init>:
80405188:	00a52223          	sw	a0,4(a0)
8040518c:	00a52023          	sw	a0,0(a0)
80405190:	00008067          	ret

80405194 <wait_queue_del>:
80405194:	0105a703          	lw	a4,16(a1)
80405198:	00c58793          	addi	a5,a1,12
8040519c:	02e78263          	beq	a5,a4,804051c0 <wait_queue_del+0x2c>
804051a0:	0085a683          	lw	a3,8(a1)
804051a4:	00a69e63          	bne	a3,a0,804051c0 <wait_queue_del+0x2c>
804051a8:	00c5a683          	lw	a3,12(a1)
804051ac:	00e6a223          	sw	a4,4(a3)
804051b0:	00d72023          	sw	a3,0(a4)
804051b4:	00f5a823          	sw	a5,16(a1)
804051b8:	00f5a623          	sw	a5,12(a1)
804051bc:	00008067          	ret
804051c0:	ff010113          	addi	sp,sp,-16
804051c4:	00112623          	sw	ra,12(sp)
804051c8:	f71ff0ef          	jal	ra,80405138 <wait_queue_del.part.1>

804051cc <wait_queue_first>:
804051cc:	00452783          	lw	a5,4(a0)
804051d0:	00f50663          	beq	a0,a5,804051dc <wait_queue_first+0x10>
804051d4:	ff478513          	addi	a0,a5,-12
804051d8:	00008067          	ret
804051dc:	00000513          	li	a0,0
804051e0:	00008067          	ret

804051e4 <wait_queue_empty>:
804051e4:	00452783          	lw	a5,4(a0)
804051e8:	40a78533          	sub	a0,a5,a0
804051ec:	00153513          	seqz	a0,a0
804051f0:	00008067          	ret

804051f4 <wait_in_queue>:
804051f4:	01052783          	lw	a5,16(a0)
804051f8:	00c50513          	addi	a0,a0,12
804051fc:	40a78533          	sub	a0,a5,a0
80405200:	00a03533          	snez	a0,a0
80405204:	00008067          	ret

80405208 <wakeup_wait>:
80405208:	02068663          	beqz	a3,80405234 <wakeup_wait+0x2c>
8040520c:	0105a703          	lw	a4,16(a1)
80405210:	00c58793          	addi	a5,a1,12
80405214:	02e78663          	beq	a5,a4,80405240 <wakeup_wait+0x38>
80405218:	0085a683          	lw	a3,8(a1)
8040521c:	02d51263          	bne	a0,a3,80405240 <wakeup_wait+0x38>
80405220:	00c5a683          	lw	a3,12(a1)
80405224:	00e6a223          	sw	a4,4(a3)
80405228:	00d72023          	sw	a3,0(a4)
8040522c:	00f5a823          	sw	a5,16(a1)
80405230:	00f5a623          	sw	a5,12(a1)
80405234:	0005a503          	lw	a0,0(a1)
80405238:	00c5a223          	sw	a2,4(a1)
8040523c:	7400706f          	j	8040c97c <wakeup_proc>
80405240:	ff010113          	addi	sp,sp,-16
80405244:	00112623          	sw	ra,12(sp)
80405248:	ef1ff0ef          	jal	ra,80405138 <wait_queue_del.part.1>

8040524c <wakeup_queue>:
8040524c:	ff010113          	addi	sp,sp,-16
80405250:	00812423          	sw	s0,8(sp)
80405254:	00452403          	lw	s0,4(a0)
80405258:	00112623          	sw	ra,12(sp)
8040525c:	00912223          	sw	s1,4(sp)
80405260:	01212023          	sw	s2,0(sp)
80405264:	04850263          	beq	a0,s0,804052a8 <wakeup_queue+0x5c>
80405268:	ff440413          	addi	s0,s0,-12
8040526c:	02040e63          	beqz	s0,804052a8 <wakeup_queue+0x5c>
80405270:	00058913          	mv	s2,a1
80405274:	00050493          	mv	s1,a0
80405278:	04061463          	bnez	a2,804052c0 <wakeup_queue+0x74>
8040527c:	00042503          	lw	a0,0(s0)
80405280:	01242223          	sw	s2,4(s0)
80405284:	6f8070ef          	jal	ra,8040c97c <wakeup_proc>
80405288:	01042783          	lw	a5,16(s0)
8040528c:	00c40713          	addi	a4,s0,12
80405290:	04e78c63          	beq	a5,a4,804052e8 <wakeup_queue+0x9c>
80405294:	00842703          	lw	a4,8(s0)
80405298:	04e49863          	bne	s1,a4,804052e8 <wakeup_queue+0x9c>
8040529c:	00f48663          	beq	s1,a5,804052a8 <wakeup_queue+0x5c>
804052a0:	ff478413          	addi	s0,a5,-12
804052a4:	fc041ce3          	bnez	s0,8040527c <wakeup_queue+0x30>
804052a8:	00c12083          	lw	ra,12(sp)
804052ac:	00812403          	lw	s0,8(sp)
804052b0:	00412483          	lw	s1,4(sp)
804052b4:	00012903          	lw	s2,0(sp)
804052b8:	01010113          	addi	sp,sp,16
804052bc:	00008067          	ret
804052c0:	00040593          	mv	a1,s0
804052c4:	00100693          	li	a3,1
804052c8:	00090613          	mv	a2,s2
804052cc:	00048513          	mv	a0,s1
804052d0:	f39ff0ef          	jal	ra,80405208 <wakeup_wait>
804052d4:	0044a403          	lw	s0,4(s1)
804052d8:	fc8488e3          	beq	s1,s0,804052a8 <wakeup_queue+0x5c>
804052dc:	ff440413          	addi	s0,s0,-12
804052e0:	fe0410e3          	bnez	s0,804052c0 <wakeup_queue+0x74>
804052e4:	fc5ff06f          	j	804052a8 <wakeup_queue+0x5c>
804052e8:	e79ff0ef          	jal	ra,80405160 <wait_queue_next.part.2>

804052ec <wait_current_set>:
804052ec:	00097797          	auipc	a5,0x97
804052f0:	4c078793          	addi	a5,a5,1216 # 8049c7ac <current>
804052f4:	0007a783          	lw	a5,0(a5)
804052f8:	04078063          	beqz	a5,80405338 <wait_current_set+0x4c>
804052fc:	00c58713          	addi	a4,a1,12
80405300:	800006b7          	lui	a3,0x80000
80405304:	00e5a623          	sw	a4,12(a1)
80405308:	00f5a023          	sw	a5,0(a1)
8040530c:	00d5a223          	sw	a3,4(a1)
80405310:	00100693          	li	a3,1
80405314:	00d7a023          	sw	a3,0(a5)
80405318:	0ac7a423          	sw	a2,168(a5)
8040531c:	00052783          	lw	a5,0(a0)
80405320:	00a5a423          	sw	a0,8(a1)
80405324:	00e52023          	sw	a4,0(a0)
80405328:	00e7a223          	sw	a4,4(a5)
8040532c:	00a5a823          	sw	a0,16(a1)
80405330:	00f5a623          	sw	a5,12(a1)
80405334:	00008067          	ret
80405338:	ff010113          	addi	sp,sp,-16
8040533c:	0000f697          	auipc	a3,0xf
80405340:	c5c68693          	addi	a3,a3,-932 # 80413f98 <default_pmm_manager+0x874>
80405344:	0000e617          	auipc	a2,0xe
80405348:	8a460613          	addi	a2,a2,-1884 # 80412be8 <commands+0x1bc>
8040534c:	07600593          	li	a1,118
80405350:	0000f517          	auipc	a0,0xf
80405354:	c9850513          	addi	a0,a0,-872 # 80413fe8 <default_pmm_manager+0x8c4>
80405358:	00112623          	sw	ra,12(sp)
8040535c:	ac8fb0ef          	jal	ra,80400624 <__panic>

80405360 <get_fd_array.part.4>:
80405360:	ff010113          	addi	sp,sp,-16
80405364:	0000f697          	auipc	a3,0xf
80405368:	fe868693          	addi	a3,a3,-24 # 8041434c <CSWTCH.69+0x344>
8040536c:	0000e617          	auipc	a2,0xe
80405370:	87c60613          	addi	a2,a2,-1924 # 80412be8 <commands+0x1bc>
80405374:	01400593          	li	a1,20
80405378:	0000f517          	auipc	a0,0xf
8040537c:	00050513          	mv	a0,a0
80405380:	00112623          	sw	ra,12(sp)
80405384:	aa0fb0ef          	jal	ra,80400624 <__panic>

80405388 <fd_array_alloc>:
80405388:	00097797          	auipc	a5,0x97
8040538c:	42478793          	addi	a5,a5,1060 # 8049c7ac <current>
80405390:	0007a783          	lw	a5,0(a5)
80405394:	ff010113          	addi	sp,sp,-16
80405398:	00112623          	sw	ra,12(sp)
8040539c:	0dc7a683          	lw	a3,220(a5)
804053a0:	0a068463          	beqz	a3,80405448 <fd_array_alloc+0xc0>
804053a4:	0086a783          	lw	a5,8(a3)
804053a8:	0af05063          	blez	a5,80405448 <fd_array_alloc+0xc0>
804053ac:	ffff7737          	lui	a4,0xffff7
804053b0:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <end+0x7fb5a21d>
804053b4:	0046a683          	lw	a3,4(a3)
804053b8:	04e50463          	beq	a0,a4,80405400 <fd_array_alloc+0x78>
804053bc:	09000793          	li	a5,144
804053c0:	08a7e063          	bltu	a5,a0,80405440 <fd_array_alloc+0xb8>
804053c4:	00351793          	slli	a5,a0,0x3
804053c8:	40a787b3          	sub	a5,a5,a0
804053cc:	00279793          	slli	a5,a5,0x2
804053d0:	00f687b3          	add	a5,a3,a5
804053d4:	0007a703          	lw	a4,0(a5)
804053d8:	06071063          	bnez	a4,80405438 <fd_array_alloc+0xb0>
804053dc:	0187a503          	lw	a0,24(a5)
804053e0:	06051663          	bnez	a0,8040544c <fd_array_alloc+0xc4>
804053e4:	00100713          	li	a4,1
804053e8:	00e7a023          	sw	a4,0(a5)
804053ec:	0007aa23          	sw	zero,20(a5)
804053f0:	00f5a023          	sw	a5,0(a1)
804053f4:	00c12083          	lw	ra,12(sp)
804053f8:	01010113          	addi	sp,sp,16
804053fc:	00008067          	ret
80405400:	0006a783          	lw	a5,0(a3)
80405404:	02078663          	beqz	a5,80405430 <fd_array_alloc+0xa8>
80405408:	00001737          	lui	a4,0x1
8040540c:	fdc70713          	addi	a4,a4,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80405410:	01c68793          	addi	a5,a3,28
80405414:	00e686b3          	add	a3,a3,a4
80405418:	0007a703          	lw	a4,0(a5)
8040541c:	fc0700e3          	beqz	a4,804053dc <fd_array_alloc+0x54>
80405420:	01c78793          	addi	a5,a5,28
80405424:	fef69ae3          	bne	a3,a5,80405418 <fd_array_alloc+0x90>
80405428:	fea00513          	li	a0,-22
8040542c:	fc9ff06f          	j	804053f4 <fd_array_alloc+0x6c>
80405430:	00068793          	mv	a5,a3
80405434:	fa9ff06f          	j	804053dc <fd_array_alloc+0x54>
80405438:	ff100513          	li	a0,-15
8040543c:	fb9ff06f          	j	804053f4 <fd_array_alloc+0x6c>
80405440:	ffd00513          	li	a0,-3
80405444:	fb1ff06f          	j	804053f4 <fd_array_alloc+0x6c>
80405448:	f19ff0ef          	jal	ra,80405360 <get_fd_array.part.4>
8040544c:	0000f697          	auipc	a3,0xf
80405450:	be468693          	addi	a3,a3,-1052 # 80414030 <CSWTCH.69+0x28>
80405454:	0000d617          	auipc	a2,0xd
80405458:	79460613          	addi	a2,a2,1940 # 80412be8 <commands+0x1bc>
8040545c:	03b00593          	li	a1,59
80405460:	0000f517          	auipc	a0,0xf
80405464:	f1850513          	addi	a0,a0,-232 # 80414378 <CSWTCH.69+0x370>
80405468:	9bcfb0ef          	jal	ra,80400624 <__panic>

8040546c <fd_array_free>:
8040546c:	00052783          	lw	a5,0(a0)
80405470:	ff010113          	addi	sp,sp,-16
80405474:	00812423          	sw	s0,8(sp)
80405478:	00112623          	sw	ra,12(sp)
8040547c:	00100713          	li	a4,1
80405480:	00050413          	mv	s0,a0
80405484:	04e78863          	beq	a5,a4,804054d4 <fd_array_free+0x68>
80405488:	00300713          	li	a4,3
8040548c:	06e79263          	bne	a5,a4,804054f0 <fd_array_free+0x84>
80405490:	01852783          	lw	a5,24(a0)
80405494:	02078263          	beqz	a5,804054b8 <fd_array_free+0x4c>
80405498:	0000f697          	auipc	a3,0xf
8040549c:	b9868693          	addi	a3,a3,-1128 # 80414030 <CSWTCH.69+0x28>
804054a0:	0000d617          	auipc	a2,0xd
804054a4:	74860613          	addi	a2,a2,1864 # 80412be8 <commands+0x1bc>
804054a8:	04500593          	li	a1,69
804054ac:	0000f517          	auipc	a0,0xf
804054b0:	ecc50513          	addi	a0,a0,-308 # 80414378 <CSWTCH.69+0x370>
804054b4:	970fb0ef          	jal	ra,80400624 <__panic>
804054b8:	01442503          	lw	a0,20(s0)
804054bc:	321080ef          	jal	ra,8040dfdc <vfs_close>
804054c0:	00c12083          	lw	ra,12(sp)
804054c4:	00042023          	sw	zero,0(s0)
804054c8:	00812403          	lw	s0,8(sp)
804054cc:	01010113          	addi	sp,sp,16
804054d0:	00008067          	ret
804054d4:	01852783          	lw	a5,24(a0)
804054d8:	fc0790e3          	bnez	a5,80405498 <fd_array_free+0x2c>
804054dc:	00042023          	sw	zero,0(s0)
804054e0:	00c12083          	lw	ra,12(sp)
804054e4:	00812403          	lw	s0,8(sp)
804054e8:	01010113          	addi	sp,sp,16
804054ec:	00008067          	ret
804054f0:	0000f697          	auipc	a3,0xf
804054f4:	b8c68693          	addi	a3,a3,-1140 # 8041407c <CSWTCH.69+0x74>
804054f8:	0000d617          	auipc	a2,0xd
804054fc:	6f060613          	addi	a2,a2,1776 # 80412be8 <commands+0x1bc>
80405500:	04400593          	li	a1,68
80405504:	0000f517          	auipc	a0,0xf
80405508:	e7450513          	addi	a0,a0,-396 # 80414378 <CSWTCH.69+0x370>
8040550c:	918fb0ef          	jal	ra,80400624 <__panic>

80405510 <fd_array_release>:
80405510:	00052783          	lw	a5,0(a0)
80405514:	ff010113          	addi	sp,sp,-16
80405518:	00112623          	sw	ra,12(sp)
8040551c:	00100693          	li	a3,1
80405520:	ffe78793          	addi	a5,a5,-2
80405524:	04f6e863          	bltu	a3,a5,80405574 <fd_array_release+0x64>
80405528:	01852783          	lw	a5,24(a0)
8040552c:	02f05463          	blez	a5,80405554 <fd_array_release+0x44>
80405530:	fff78793          	addi	a5,a5,-1
80405534:	00f52c23          	sw	a5,24(a0)
80405538:	00078863          	beqz	a5,80405548 <fd_array_release+0x38>
8040553c:	00c12083          	lw	ra,12(sp)
80405540:	01010113          	addi	sp,sp,16
80405544:	00008067          	ret
80405548:	00c12083          	lw	ra,12(sp)
8040554c:	01010113          	addi	sp,sp,16
80405550:	f1dff06f          	j	8040546c <fd_array_free>
80405554:	0000f697          	auipc	a3,0xf
80405558:	bc868693          	addi	a3,a3,-1080 # 8041411c <CSWTCH.69+0x114>
8040555c:	0000d617          	auipc	a2,0xd
80405560:	68c60613          	addi	a2,a2,1676 # 80412be8 <commands+0x1bc>
80405564:	05600593          	li	a1,86
80405568:	0000f517          	auipc	a0,0xf
8040556c:	e1050513          	addi	a0,a0,-496 # 80414378 <CSWTCH.69+0x370>
80405570:	8b4fb0ef          	jal	ra,80400624 <__panic>
80405574:	0000f697          	auipc	a3,0xf
80405578:	b7068693          	addi	a3,a3,-1168 # 804140e4 <CSWTCH.69+0xdc>
8040557c:	0000d617          	auipc	a2,0xd
80405580:	66c60613          	addi	a2,a2,1644 # 80412be8 <commands+0x1bc>
80405584:	05500593          	li	a1,85
80405588:	0000f517          	auipc	a0,0xf
8040558c:	df050513          	addi	a0,a0,-528 # 80414378 <CSWTCH.69+0x370>
80405590:	894fb0ef          	jal	ra,80400624 <__panic>

80405594 <fd_array_open.part.9>:
80405594:	ff010113          	addi	sp,sp,-16
80405598:	0000f697          	auipc	a3,0xf
8040559c:	b1c68693          	addi	a3,a3,-1252 # 804140b4 <CSWTCH.69+0xac>
804055a0:	0000d617          	auipc	a2,0xd
804055a4:	64860613          	addi	a2,a2,1608 # 80412be8 <commands+0x1bc>
804055a8:	05f00593          	li	a1,95
804055ac:	0000f517          	auipc	a0,0xf
804055b0:	dcc50513          	addi	a0,a0,-564 # 80414378 <CSWTCH.69+0x370>
804055b4:	00112623          	sw	ra,12(sp)
804055b8:	86cfb0ef          	jal	ra,80400624 <__panic>

804055bc <fd_array_init>:
804055bc:	00000793          	li	a5,0
804055c0:	09100713          	li	a4,145
804055c4:	00f52623          	sw	a5,12(a0)
804055c8:	00052c23          	sw	zero,24(a0)
804055cc:	00052023          	sw	zero,0(a0)
804055d0:	00178793          	addi	a5,a5,1
804055d4:	01c50513          	addi	a0,a0,28
804055d8:	fee796e3          	bne	a5,a4,804055c4 <fd_array_init+0x8>
804055dc:	00008067          	ret

804055e0 <fd_array_close>:
804055e0:	00052683          	lw	a3,0(a0)
804055e4:	ff010113          	addi	sp,sp,-16
804055e8:	00112623          	sw	ra,12(sp)
804055ec:	00200793          	li	a5,2
804055f0:	04f69c63          	bne	a3,a5,80405648 <fd_array_close+0x68>
804055f4:	01852783          	lw	a5,24(a0)
804055f8:	02f05863          	blez	a5,80405628 <fd_array_close+0x48>
804055fc:	fff78793          	addi	a5,a5,-1
80405600:	00300693          	li	a3,3
80405604:	00d52023          	sw	a3,0(a0)
80405608:	00f52c23          	sw	a5,24(a0)
8040560c:	00078863          	beqz	a5,8040561c <fd_array_close+0x3c>
80405610:	00c12083          	lw	ra,12(sp)
80405614:	01010113          	addi	sp,sp,16
80405618:	00008067          	ret
8040561c:	00c12083          	lw	ra,12(sp)
80405620:	01010113          	addi	sp,sp,16
80405624:	e49ff06f          	j	8040546c <fd_array_free>
80405628:	0000f697          	auipc	a3,0xf
8040562c:	af468693          	addi	a3,a3,-1292 # 8041411c <CSWTCH.69+0x114>
80405630:	0000d617          	auipc	a2,0xd
80405634:	5b860613          	addi	a2,a2,1464 # 80412be8 <commands+0x1bc>
80405638:	06800593          	li	a1,104
8040563c:	0000f517          	auipc	a0,0xf
80405640:	d3c50513          	addi	a0,a0,-708 # 80414378 <CSWTCH.69+0x370>
80405644:	fe1fa0ef          	jal	ra,80400624 <__panic>
80405648:	0000f697          	auipc	a3,0xf
8040564c:	9cc68693          	addi	a3,a3,-1588 # 80414014 <CSWTCH.69+0xc>
80405650:	0000d617          	auipc	a2,0xd
80405654:	59860613          	addi	a2,a2,1432 # 80412be8 <commands+0x1bc>
80405658:	06700593          	li	a1,103
8040565c:	0000f517          	auipc	a0,0xf
80405660:	d1c50513          	addi	a0,a0,-740 # 80414378 <CSWTCH.69+0x370>
80405664:	fc1fa0ef          	jal	ra,80400624 <__panic>

80405668 <fd_array_dup>:
80405668:	fe010113          	addi	sp,sp,-32
8040566c:	01212823          	sw	s2,16(sp)
80405670:	00052903          	lw	s2,0(a0)
80405674:	00112e23          	sw	ra,28(sp)
80405678:	00812c23          	sw	s0,24(sp)
8040567c:	00912a23          	sw	s1,20(sp)
80405680:	01312623          	sw	s3,12(sp)
80405684:	00100793          	li	a5,1
80405688:	06f91e63          	bne	s2,a5,80405704 <fd_array_dup+0x9c>
8040568c:	0005a983          	lw	s3,0(a1)
80405690:	00200793          	li	a5,2
80405694:	06f99863          	bne	s3,a5,80405704 <fd_array_dup+0x9c>
80405698:	0145a483          	lw	s1,20(a1)
8040569c:	0085a783          	lw	a5,8(a1)
804056a0:	0105a683          	lw	a3,16(a1)
804056a4:	0045a703          	lw	a4,4(a1)
804056a8:	00050413          	mv	s0,a0
804056ac:	00f52423          	sw	a5,8(a0)
804056b0:	00d52823          	sw	a3,16(a0)
804056b4:	00e52223          	sw	a4,4(a0)
804056b8:	00048513          	mv	a0,s1
804056bc:	50d070ef          	jal	ra,8040d3c8 <inode_ref_inc>
804056c0:	00048513          	mv	a0,s1
804056c4:	519070ef          	jal	ra,8040d3dc <inode_open_inc>
804056c8:	00042783          	lw	a5,0(s0)
804056cc:	00942a23          	sw	s1,20(s0)
804056d0:	05279a63          	bne	a5,s2,80405724 <fd_array_dup+0xbc>
804056d4:	04048863          	beqz	s1,80405724 <fd_array_dup+0xbc>
804056d8:	01842783          	lw	a5,24(s0)
804056dc:	01342023          	sw	s3,0(s0)
804056e0:	01c12083          	lw	ra,28(sp)
804056e4:	00178793          	addi	a5,a5,1
804056e8:	00f42c23          	sw	a5,24(s0)
804056ec:	01812403          	lw	s0,24(sp)
804056f0:	01412483          	lw	s1,20(sp)
804056f4:	01012903          	lw	s2,16(sp)
804056f8:	00c12983          	lw	s3,12(sp)
804056fc:	02010113          	addi	sp,sp,32
80405700:	00008067          	ret
80405704:	0000f697          	auipc	a3,0xf
80405708:	94468693          	addi	a3,a3,-1724 # 80414048 <CSWTCH.69+0x40>
8040570c:	0000d617          	auipc	a2,0xd
80405710:	4dc60613          	addi	a2,a2,1244 # 80412be8 <commands+0x1bc>
80405714:	07300593          	li	a1,115
80405718:	0000f517          	auipc	a0,0xf
8040571c:	c6050513          	addi	a0,a0,-928 # 80414378 <CSWTCH.69+0x370>
80405720:	f05fa0ef          	jal	ra,80400624 <__panic>
80405724:	e71ff0ef          	jal	ra,80405594 <fd_array_open.part.9>

80405728 <file_testfd>:
80405728:	09000793          	li	a5,144
8040572c:	06a7e463          	bltu	a5,a0,80405794 <file_testfd+0x6c>
80405730:	00097797          	auipc	a5,0x97
80405734:	07c78793          	addi	a5,a5,124 # 8049c7ac <current>
80405738:	0007a783          	lw	a5,0(a5)
8040573c:	0dc7a703          	lw	a4,220(a5)
80405740:	04070e63          	beqz	a4,8040579c <file_testfd+0x74>
80405744:	00872783          	lw	a5,8(a4)
80405748:	04f05a63          	blez	a5,8040579c <file_testfd+0x74>
8040574c:	00472703          	lw	a4,4(a4)
80405750:	00351793          	slli	a5,a0,0x3
80405754:	40a787b3          	sub	a5,a5,a0
80405758:	00279793          	slli	a5,a5,0x2
8040575c:	00f707b3          	add	a5,a4,a5
80405760:	0007a683          	lw	a3,0(a5)
80405764:	00200713          	li	a4,2
80405768:	02e69663          	bne	a3,a4,80405794 <file_testfd+0x6c>
8040576c:	00c7a703          	lw	a4,12(a5)
80405770:	02e51263          	bne	a0,a4,80405794 <file_testfd+0x6c>
80405774:	00058663          	beqz	a1,80405780 <file_testfd+0x58>
80405778:	0047a503          	lw	a0,4(a5)
8040577c:	00050e63          	beqz	a0,80405798 <file_testfd+0x70>
80405780:	00100513          	li	a0,1
80405784:	00060a63          	beqz	a2,80405798 <file_testfd+0x70>
80405788:	0087a503          	lw	a0,8(a5)
8040578c:	00a03533          	snez	a0,a0
80405790:	00008067          	ret
80405794:	00000513          	li	a0,0
80405798:	00008067          	ret
8040579c:	ff010113          	addi	sp,sp,-16
804057a0:	00112623          	sw	ra,12(sp)
804057a4:	bbdff0ef          	jal	ra,80405360 <get_fd_array.part.4>

804057a8 <file_open>:
804057a8:	fc010113          	addi	sp,sp,-64
804057ac:	02112e23          	sw	ra,60(sp)
804057b0:	02812c23          	sw	s0,56(sp)
804057b4:	02912a23          	sw	s1,52(sp)
804057b8:	03212823          	sw	s2,48(sp)
804057bc:	03312623          	sw	s3,44(sp)
804057c0:	03412423          	sw	s4,40(sp)
804057c4:	0035f793          	andi	a5,a1,3
804057c8:	00300713          	li	a4,3
804057cc:	12e78a63          	beq	a5,a4,80405900 <file_open+0x158>
804057d0:	00279793          	slli	a5,a5,0x2
804057d4:	0000f717          	auipc	a4,0xf
804057d8:	83470713          	addi	a4,a4,-1996 # 80414008 <CSWTCH.69>
804057dc:	00050913          	mv	s2,a0
804057e0:	0000f697          	auipc	a3,0xf
804057e4:	81c68693          	addi	a3,a3,-2020 # 80413ffc <CSWTCH.68>
804057e8:	ffff7537          	lui	a0,0xffff7
804057ec:	00f686b3          	add	a3,a3,a5
804057f0:	00058493          	mv	s1,a1
804057f4:	00f707b3          	add	a5,a4,a5
804057f8:	00810593          	addi	a1,sp,8
804057fc:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <end+0x7fb5a21d>
80405800:	0006aa03          	lw	s4,0(a3)
80405804:	0007a983          	lw	s3,0(a5)
80405808:	b81ff0ef          	jal	ra,80405388 <fd_array_alloc>
8040580c:	00050413          	mv	s0,a0
80405810:	02050463          	beqz	a0,80405838 <file_open+0x90>
80405814:	00040513          	mv	a0,s0
80405818:	03c12083          	lw	ra,60(sp)
8040581c:	03812403          	lw	s0,56(sp)
80405820:	03412483          	lw	s1,52(sp)
80405824:	03012903          	lw	s2,48(sp)
80405828:	02c12983          	lw	s3,44(sp)
8040582c:	02812a03          	lw	s4,40(sp)
80405830:	04010113          	addi	sp,sp,64
80405834:	00008067          	ret
80405838:	00c10613          	addi	a2,sp,12
8040583c:	00048593          	mv	a1,s1
80405840:	00090513          	mv	a0,s2
80405844:	548080ef          	jal	ra,8040dd8c <vfs_open>
80405848:	00050413          	mv	s0,a0
8040584c:	0a051463          	bnez	a0,804058f4 <file_open+0x14c>
80405850:	00812783          	lw	a5,8(sp)
80405854:	0204f593          	andi	a1,s1,32
80405858:	00c12403          	lw	s0,12(sp)
8040585c:	0007a823          	sw	zero,16(a5)
80405860:	04058a63          	beqz	a1,804058b4 <file_open+0x10c>
80405864:	0a040463          	beqz	s0,8040590c <file_open+0x164>
80405868:	03c42783          	lw	a5,60(s0)
8040586c:	0a078063          	beqz	a5,8040590c <file_open+0x164>
80405870:	0147a783          	lw	a5,20(a5)
80405874:	08078c63          	beqz	a5,8040590c <file_open+0x164>
80405878:	00040513          	mv	a0,s0
8040587c:	0000f597          	auipc	a1,0xf
80405880:	9c058593          	addi	a1,a1,-1600 # 8041423c <CSWTCH.69+0x234>
80405884:	36d070ef          	jal	ra,8040d3f0 <inode_check>
80405888:	03c42783          	lw	a5,60(s0)
8040588c:	00c12503          	lw	a0,12(sp)
80405890:	01010593          	addi	a1,sp,16
80405894:	0147a783          	lw	a5,20(a5)
80405898:	000780e7          	jalr	a5
8040589c:	00050413          	mv	s0,a0
804058a0:	04051663          	bnez	a0,804058ec <file_open+0x144>
804058a4:	00812783          	lw	a5,8(sp)
804058a8:	01c12703          	lw	a4,28(sp)
804058ac:	00c12403          	lw	s0,12(sp)
804058b0:	00e7a823          	sw	a4,16(a5)
804058b4:	0007a683          	lw	a3,0(a5)
804058b8:	0087aa23          	sw	s0,20(a5)
804058bc:	0147a223          	sw	s4,4(a5)
804058c0:	0137a423          	sw	s3,8(a5)
804058c4:	00100713          	li	a4,1
804058c8:	04e69063          	bne	a3,a4,80405908 <file_open+0x160>
804058cc:	02040e63          	beqz	s0,80405908 <file_open+0x160>
804058d0:	0187a703          	lw	a4,24(a5)
804058d4:	00200693          	li	a3,2
804058d8:	00d7a023          	sw	a3,0(a5)
804058dc:	00170713          	addi	a4,a4,1
804058e0:	00e7ac23          	sw	a4,24(a5)
804058e4:	00c7a403          	lw	s0,12(a5)
804058e8:	f2dff06f          	j	80405814 <file_open+0x6c>
804058ec:	00c12503          	lw	a0,12(sp)
804058f0:	6ec080ef          	jal	ra,8040dfdc <vfs_close>
804058f4:	00812503          	lw	a0,8(sp)
804058f8:	b75ff0ef          	jal	ra,8040546c <fd_array_free>
804058fc:	f19ff06f          	j	80405814 <file_open+0x6c>
80405900:	ffd00413          	li	s0,-3
80405904:	f11ff06f          	j	80405814 <file_open+0x6c>
80405908:	c8dff0ef          	jal	ra,80405594 <fd_array_open.part.9>
8040590c:	0000f697          	auipc	a3,0xf
80405910:	8e068693          	addi	a3,a3,-1824 # 804141ec <CSWTCH.69+0x1e4>
80405914:	0000d617          	auipc	a2,0xd
80405918:	2d460613          	addi	a2,a2,724 # 80412be8 <commands+0x1bc>
8040591c:	0b800593          	li	a1,184
80405920:	0000f517          	auipc	a0,0xf
80405924:	a5850513          	addi	a0,a0,-1448 # 80414378 <CSWTCH.69+0x370>
80405928:	cfdfa0ef          	jal	ra,80400624 <__panic>

8040592c <file_close>:
8040592c:	09000793          	li	a5,144
80405930:	06a7ec63          	bltu	a5,a0,804059a8 <file_close+0x7c>
80405934:	00097797          	auipc	a5,0x97
80405938:	e7878793          	addi	a5,a5,-392 # 8049c7ac <current>
8040593c:	0007a783          	lw	a5,0(a5)
80405940:	ff010113          	addi	sp,sp,-16
80405944:	00112623          	sw	ra,12(sp)
80405948:	0dc7a683          	lw	a3,220(a5)
8040594c:	00050713          	mv	a4,a0
80405950:	06068063          	beqz	a3,804059b0 <file_close+0x84>
80405954:	0086a783          	lw	a5,8(a3)
80405958:	04f05c63          	blez	a5,804059b0 <file_close+0x84>
8040595c:	00351793          	slli	a5,a0,0x3
80405960:	0046a503          	lw	a0,4(a3)
80405964:	40e787b3          	sub	a5,a5,a4
80405968:	00279793          	slli	a5,a5,0x2
8040596c:	00f50533          	add	a0,a0,a5
80405970:	00052683          	lw	a3,0(a0)
80405974:	00200793          	li	a5,2
80405978:	02f69063          	bne	a3,a5,80405998 <file_close+0x6c>
8040597c:	00c52783          	lw	a5,12(a0)
80405980:	00f71c63          	bne	a4,a5,80405998 <file_close+0x6c>
80405984:	c5dff0ef          	jal	ra,804055e0 <fd_array_close>
80405988:	00c12083          	lw	ra,12(sp)
8040598c:	00000513          	li	a0,0
80405990:	01010113          	addi	sp,sp,16
80405994:	00008067          	ret
80405998:	00c12083          	lw	ra,12(sp)
8040599c:	ffd00513          	li	a0,-3
804059a0:	01010113          	addi	sp,sp,16
804059a4:	00008067          	ret
804059a8:	ffd00513          	li	a0,-3
804059ac:	00008067          	ret
804059b0:	9b1ff0ef          	jal	ra,80405360 <get_fd_array.part.4>

804059b4 <file_read>:
804059b4:	fd010113          	addi	sp,sp,-48
804059b8:	02112623          	sw	ra,44(sp)
804059bc:	02812423          	sw	s0,40(sp)
804059c0:	02912223          	sw	s1,36(sp)
804059c4:	03212023          	sw	s2,32(sp)
804059c8:	01312e23          	sw	s3,28(sp)
804059cc:	01412c23          	sw	s4,24(sp)
804059d0:	0006a023          	sw	zero,0(a3)
804059d4:	09000793          	li	a5,144
804059d8:	10a7e263          	bltu	a5,a0,80405adc <file_read+0x128>
804059dc:	00097797          	auipc	a5,0x97
804059e0:	dd078793          	addi	a5,a5,-560 # 8049c7ac <current>
804059e4:	0007a783          	lw	a5,0(a5)
804059e8:	00068913          	mv	s2,a3
804059ec:	0dc7a703          	lw	a4,220(a5)
804059f0:	0e070a63          	beqz	a4,80405ae4 <file_read+0x130>
804059f4:	00872783          	lw	a5,8(a4)
804059f8:	0ef05663          	blez	a5,80405ae4 <file_read+0x130>
804059fc:	00351793          	slli	a5,a0,0x3
80405a00:	00472403          	lw	s0,4(a4)
80405a04:	40a787b3          	sub	a5,a5,a0
80405a08:	00279793          	slli	a5,a5,0x2
80405a0c:	00f40433          	add	s0,s0,a5
80405a10:	00042983          	lw	s3,0(s0)
80405a14:	00200793          	li	a5,2
80405a18:	0cf99263          	bne	s3,a5,80405adc <file_read+0x128>
80405a1c:	00c42783          	lw	a5,12(s0)
80405a20:	0af51e63          	bne	a0,a5,80405adc <file_read+0x128>
80405a24:	00442783          	lw	a5,4(s0)
80405a28:	0a078a63          	beqz	a5,80405adc <file_read+0x128>
80405a2c:	01842783          	lw	a5,24(s0)
80405a30:	01042683          	lw	a3,16(s0)
80405a34:	00010513          	mv	a0,sp
80405a38:	00178793          	addi	a5,a5,1
80405a3c:	00f42c23          	sw	a5,24(s0)
80405a40:	311000ef          	jal	ra,80406550 <iobuf_init>
80405a44:	01442483          	lw	s1,20(s0)
80405a48:	00050a13          	mv	s4,a0
80405a4c:	08048e63          	beqz	s1,80405ae8 <file_read+0x134>
80405a50:	03c4a783          	lw	a5,60(s1)
80405a54:	08078a63          	beqz	a5,80405ae8 <file_read+0x134>
80405a58:	00c7a783          	lw	a5,12(a5)
80405a5c:	08078663          	beqz	a5,80405ae8 <file_read+0x134>
80405a60:	00048513          	mv	a0,s1
80405a64:	0000f597          	auipc	a1,0xf
80405a68:	83058593          	addi	a1,a1,-2000 # 80414294 <CSWTCH.69+0x28c>
80405a6c:	185070ef          	jal	ra,8040d3f0 <inode_check>
80405a70:	03c4a783          	lw	a5,60(s1)
80405a74:	01442503          	lw	a0,20(s0)
80405a78:	000a0593          	mv	a1,s4
80405a7c:	00c7a783          	lw	a5,12(a5)
80405a80:	000780e7          	jalr	a5
80405a84:	008a2783          	lw	a5,8(s4) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80405a88:	00ca2683          	lw	a3,12(s4)
80405a8c:	00042703          	lw	a4,0(s0)
80405a90:	00050493          	mv	s1,a0
80405a94:	40d787b3          	sub	a5,a5,a3
80405a98:	03370a63          	beq	a4,s3,80405acc <file_read+0x118>
80405a9c:	00f92023          	sw	a5,0(s2)
80405aa0:	00040513          	mv	a0,s0
80405aa4:	a6dff0ef          	jal	ra,80405510 <fd_array_release>
80405aa8:	02c12083          	lw	ra,44(sp)
80405aac:	02812403          	lw	s0,40(sp)
80405ab0:	00048513          	mv	a0,s1
80405ab4:	02012903          	lw	s2,32(sp)
80405ab8:	02412483          	lw	s1,36(sp)
80405abc:	01c12983          	lw	s3,28(sp)
80405ac0:	01812a03          	lw	s4,24(sp)
80405ac4:	03010113          	addi	sp,sp,48
80405ac8:	00008067          	ret
80405acc:	01042703          	lw	a4,16(s0)
80405ad0:	00f70733          	add	a4,a4,a5
80405ad4:	00e42823          	sw	a4,16(s0)
80405ad8:	fc5ff06f          	j	80405a9c <file_read+0xe8>
80405adc:	ffd00493          	li	s1,-3
80405ae0:	fc9ff06f          	j	80405aa8 <file_read+0xf4>
80405ae4:	87dff0ef          	jal	ra,80405360 <get_fd_array.part.4>
80405ae8:	0000e697          	auipc	a3,0xe
80405aec:	75c68693          	addi	a3,a3,1884 # 80414244 <CSWTCH.69+0x23c>
80405af0:	0000d617          	auipc	a2,0xd
80405af4:	0f860613          	addi	a2,a2,248 # 80412be8 <commands+0x1bc>
80405af8:	0e200593          	li	a1,226
80405afc:	0000f517          	auipc	a0,0xf
80405b00:	87c50513          	addi	a0,a0,-1924 # 80414378 <CSWTCH.69+0x370>
80405b04:	b21fa0ef          	jal	ra,80400624 <__panic>

80405b08 <file_write>:
80405b08:	fd010113          	addi	sp,sp,-48
80405b0c:	02112623          	sw	ra,44(sp)
80405b10:	02812423          	sw	s0,40(sp)
80405b14:	02912223          	sw	s1,36(sp)
80405b18:	03212023          	sw	s2,32(sp)
80405b1c:	01312e23          	sw	s3,28(sp)
80405b20:	01412c23          	sw	s4,24(sp)
80405b24:	0006a023          	sw	zero,0(a3)
80405b28:	09000793          	li	a5,144
80405b2c:	10a7e263          	bltu	a5,a0,80405c30 <file_write+0x128>
80405b30:	00097797          	auipc	a5,0x97
80405b34:	c7c78793          	addi	a5,a5,-900 # 8049c7ac <current>
80405b38:	0007a783          	lw	a5,0(a5)
80405b3c:	00068913          	mv	s2,a3
80405b40:	0dc7a703          	lw	a4,220(a5)
80405b44:	0e070a63          	beqz	a4,80405c38 <file_write+0x130>
80405b48:	00872783          	lw	a5,8(a4)
80405b4c:	0ef05663          	blez	a5,80405c38 <file_write+0x130>
80405b50:	00351793          	slli	a5,a0,0x3
80405b54:	00472403          	lw	s0,4(a4)
80405b58:	40a787b3          	sub	a5,a5,a0
80405b5c:	00279793          	slli	a5,a5,0x2
80405b60:	00f40433          	add	s0,s0,a5
80405b64:	00042983          	lw	s3,0(s0)
80405b68:	00200793          	li	a5,2
80405b6c:	0cf99263          	bne	s3,a5,80405c30 <file_write+0x128>
80405b70:	00c42783          	lw	a5,12(s0)
80405b74:	0af51e63          	bne	a0,a5,80405c30 <file_write+0x128>
80405b78:	00842783          	lw	a5,8(s0)
80405b7c:	0a078a63          	beqz	a5,80405c30 <file_write+0x128>
80405b80:	01842783          	lw	a5,24(s0)
80405b84:	01042683          	lw	a3,16(s0)
80405b88:	00010513          	mv	a0,sp
80405b8c:	00178793          	addi	a5,a5,1
80405b90:	00f42c23          	sw	a5,24(s0)
80405b94:	1bd000ef          	jal	ra,80406550 <iobuf_init>
80405b98:	01442483          	lw	s1,20(s0)
80405b9c:	00050a13          	mv	s4,a0
80405ba0:	08048e63          	beqz	s1,80405c3c <file_write+0x134>
80405ba4:	03c4a783          	lw	a5,60(s1)
80405ba8:	08078a63          	beqz	a5,80405c3c <file_write+0x134>
80405bac:	0107a783          	lw	a5,16(a5)
80405bb0:	08078663          	beqz	a5,80405c3c <file_write+0x134>
80405bb4:	00048513          	mv	a0,s1
80405bb8:	0000e597          	auipc	a1,0xe
80405bbc:	78c58593          	addi	a1,a1,1932 # 80414344 <CSWTCH.69+0x33c>
80405bc0:	031070ef          	jal	ra,8040d3f0 <inode_check>
80405bc4:	03c4a783          	lw	a5,60(s1)
80405bc8:	01442503          	lw	a0,20(s0)
80405bcc:	000a0593          	mv	a1,s4
80405bd0:	0107a783          	lw	a5,16(a5)
80405bd4:	000780e7          	jalr	a5
80405bd8:	008a2783          	lw	a5,8(s4)
80405bdc:	00ca2683          	lw	a3,12(s4)
80405be0:	00042703          	lw	a4,0(s0)
80405be4:	00050493          	mv	s1,a0
80405be8:	40d787b3          	sub	a5,a5,a3
80405bec:	03370a63          	beq	a4,s3,80405c20 <file_write+0x118>
80405bf0:	00f92023          	sw	a5,0(s2)
80405bf4:	00040513          	mv	a0,s0
80405bf8:	919ff0ef          	jal	ra,80405510 <fd_array_release>
80405bfc:	02c12083          	lw	ra,44(sp)
80405c00:	02812403          	lw	s0,40(sp)
80405c04:	00048513          	mv	a0,s1
80405c08:	02012903          	lw	s2,32(sp)
80405c0c:	02412483          	lw	s1,36(sp)
80405c10:	01c12983          	lw	s3,28(sp)
80405c14:	01812a03          	lw	s4,24(sp)
80405c18:	03010113          	addi	sp,sp,48
80405c1c:	00008067          	ret
80405c20:	01042703          	lw	a4,16(s0)
80405c24:	00f70733          	add	a4,a4,a5
80405c28:	00e42823          	sw	a4,16(s0)
80405c2c:	fc5ff06f          	j	80405bf0 <file_write+0xe8>
80405c30:	ffd00493          	li	s1,-3
80405c34:	fc9ff06f          	j	80405bfc <file_write+0xf4>
80405c38:	f28ff0ef          	jal	ra,80405360 <get_fd_array.part.4>
80405c3c:	0000e697          	auipc	a3,0xe
80405c40:	6b868693          	addi	a3,a3,1720 # 804142f4 <CSWTCH.69+0x2ec>
80405c44:	0000d617          	auipc	a2,0xd
80405c48:	fa460613          	addi	a2,a2,-92 # 80412be8 <commands+0x1bc>
80405c4c:	0fc00593          	li	a1,252
80405c50:	0000e517          	auipc	a0,0xe
80405c54:	72850513          	addi	a0,a0,1832 # 80414378 <CSWTCH.69+0x370>
80405c58:	9cdfa0ef          	jal	ra,80400624 <__panic>

80405c5c <file_seek>:
80405c5c:	fe010113          	addi	sp,sp,-32
80405c60:	00112e23          	sw	ra,28(sp)
80405c64:	00812c23          	sw	s0,24(sp)
80405c68:	00912a23          	sw	s1,20(sp)
80405c6c:	01212823          	sw	s2,16(sp)
80405c70:	09000793          	li	a5,144
80405c74:	12a7ea63          	bltu	a5,a0,80405da8 <file_seek+0x14c>
80405c78:	00097797          	auipc	a5,0x97
80405c7c:	b3478793          	addi	a5,a5,-1228 # 8049c7ac <current>
80405c80:	0007a783          	lw	a5,0(a5)
80405c84:	0dc7a703          	lw	a4,220(a5)
80405c88:	14070063          	beqz	a4,80405dc8 <file_seek+0x16c>
80405c8c:	00872783          	lw	a5,8(a4)
80405c90:	12f05c63          	blez	a5,80405dc8 <file_seek+0x16c>
80405c94:	00472403          	lw	s0,4(a4)
80405c98:	00351793          	slli	a5,a0,0x3
80405c9c:	40a787b3          	sub	a5,a5,a0
80405ca0:	00279793          	slli	a5,a5,0x2
80405ca4:	00f40433          	add	s0,s0,a5
80405ca8:	00042703          	lw	a4,0(s0)
80405cac:	00200793          	li	a5,2
80405cb0:	0ef71c63          	bne	a4,a5,80405da8 <file_seek+0x14c>
80405cb4:	00c42783          	lw	a5,12(s0)
80405cb8:	0ef51863          	bne	a0,a5,80405da8 <file_seek+0x14c>
80405cbc:	01842783          	lw	a5,24(s0)
80405cc0:	00100693          	li	a3,1
80405cc4:	00058913          	mv	s2,a1
80405cc8:	00178793          	addi	a5,a5,1
80405ccc:	00f42c23          	sw	a5,24(s0)
80405cd0:	0cd60663          	beq	a2,a3,80405d9c <file_seek+0x140>
80405cd4:	02e60863          	beq	a2,a4,80405d04 <file_seek+0xa8>
80405cd8:	ffd00493          	li	s1,-3
80405cdc:	06060a63          	beqz	a2,80405d50 <file_seek+0xf4>
80405ce0:	00040513          	mv	a0,s0
80405ce4:	82dff0ef          	jal	ra,80405510 <fd_array_release>
80405ce8:	01c12083          	lw	ra,28(sp)
80405cec:	01812403          	lw	s0,24(sp)
80405cf0:	00048513          	mv	a0,s1
80405cf4:	01012903          	lw	s2,16(sp)
80405cf8:	01412483          	lw	s1,20(sp)
80405cfc:	02010113          	addi	sp,sp,32
80405d00:	00008067          	ret
80405d04:	01442483          	lw	s1,20(s0)
80405d08:	0e048263          	beqz	s1,80405dec <file_seek+0x190>
80405d0c:	03c4a783          	lw	a5,60(s1)
80405d10:	0c078e63          	beqz	a5,80405dec <file_seek+0x190>
80405d14:	0147a783          	lw	a5,20(a5)
80405d18:	0c078a63          	beqz	a5,80405dec <file_seek+0x190>
80405d1c:	00048513          	mv	a0,s1
80405d20:	0000e597          	auipc	a1,0xe
80405d24:	51c58593          	addi	a1,a1,1308 # 8041423c <CSWTCH.69+0x234>
80405d28:	6c8070ef          	jal	ra,8040d3f0 <inode_check>
80405d2c:	03c4a783          	lw	a5,60(s1)
80405d30:	01442503          	lw	a0,20(s0)
80405d34:	00010593          	mv	a1,sp
80405d38:	0147a783          	lw	a5,20(a5)
80405d3c:	000780e7          	jalr	a5
80405d40:	00050493          	mv	s1,a0
80405d44:	f8051ee3          	bnez	a0,80405ce0 <file_seek+0x84>
80405d48:	00c12783          	lw	a5,12(sp)
80405d4c:	00f90933          	add	s2,s2,a5
80405d50:	01442483          	lw	s1,20(s0)
80405d54:	06048c63          	beqz	s1,80405dcc <file_seek+0x170>
80405d58:	03c4a783          	lw	a5,60(s1)
80405d5c:	06078863          	beqz	a5,80405dcc <file_seek+0x170>
80405d60:	02c7a783          	lw	a5,44(a5)
80405d64:	06078463          	beqz	a5,80405dcc <file_seek+0x170>
80405d68:	00048513          	mv	a0,s1
80405d6c:	0000e597          	auipc	a1,0xe
80405d70:	58058593          	addi	a1,a1,1408 # 804142ec <CSWTCH.69+0x2e4>
80405d74:	67c070ef          	jal	ra,8040d3f0 <inode_check>
80405d78:	03c4a783          	lw	a5,60(s1)
80405d7c:	01442503          	lw	a0,20(s0)
80405d80:	00090593          	mv	a1,s2
80405d84:	02c7a783          	lw	a5,44(a5)
80405d88:	000780e7          	jalr	a5
80405d8c:	00050493          	mv	s1,a0
80405d90:	f40518e3          	bnez	a0,80405ce0 <file_seek+0x84>
80405d94:	01242823          	sw	s2,16(s0)
80405d98:	f49ff06f          	j	80405ce0 <file_seek+0x84>
80405d9c:	01042783          	lw	a5,16(s0)
80405da0:	00f58933          	add	s2,a1,a5
80405da4:	fadff06f          	j	80405d50 <file_seek+0xf4>
80405da8:	01c12083          	lw	ra,28(sp)
80405dac:	01812403          	lw	s0,24(sp)
80405db0:	ffd00493          	li	s1,-3
80405db4:	00048513          	mv	a0,s1
80405db8:	01012903          	lw	s2,16(sp)
80405dbc:	01412483          	lw	s1,20(sp)
80405dc0:	02010113          	addi	sp,sp,32
80405dc4:	00008067          	ret
80405dc8:	d98ff0ef          	jal	ra,80405360 <get_fd_array.part.4>
80405dcc:	0000e697          	auipc	a3,0xe
80405dd0:	4d068693          	addi	a3,a3,1232 # 8041429c <CSWTCH.69+0x294>
80405dd4:	0000d617          	auipc	a2,0xd
80405dd8:	e1460613          	addi	a2,a2,-492 # 80412be8 <commands+0x1bc>
80405ddc:	11e00593          	li	a1,286
80405de0:	0000e517          	auipc	a0,0xe
80405de4:	59850513          	addi	a0,a0,1432 # 80414378 <CSWTCH.69+0x370>
80405de8:	83dfa0ef          	jal	ra,80400624 <__panic>
80405dec:	0000e697          	auipc	a3,0xe
80405df0:	40068693          	addi	a3,a3,1024 # 804141ec <CSWTCH.69+0x1e4>
80405df4:	0000d617          	auipc	a2,0xd
80405df8:	df460613          	addi	a2,a2,-524 # 80412be8 <commands+0x1bc>
80405dfc:	11600593          	li	a1,278
80405e00:	0000e517          	auipc	a0,0xe
80405e04:	57850513          	addi	a0,a0,1400 # 80414378 <CSWTCH.69+0x370>
80405e08:	81dfa0ef          	jal	ra,80400624 <__panic>

80405e0c <file_fstat>:
80405e0c:	ff010113          	addi	sp,sp,-16
80405e10:	00112623          	sw	ra,12(sp)
80405e14:	00812423          	sw	s0,8(sp)
80405e18:	00912223          	sw	s1,4(sp)
80405e1c:	01212023          	sw	s2,0(sp)
80405e20:	09000793          	li	a5,144
80405e24:	0aa7ee63          	bltu	a5,a0,80405ee0 <file_fstat+0xd4>
80405e28:	00097797          	auipc	a5,0x97
80405e2c:	98478793          	addi	a5,a5,-1660 # 8049c7ac <current>
80405e30:	0007a783          	lw	a5,0(a5)
80405e34:	00058913          	mv	s2,a1
80405e38:	0dc7a703          	lw	a4,220(a5)
80405e3c:	0c070263          	beqz	a4,80405f00 <file_fstat+0xf4>
80405e40:	00872783          	lw	a5,8(a4)
80405e44:	0af05e63          	blez	a5,80405f00 <file_fstat+0xf4>
80405e48:	00472403          	lw	s0,4(a4)
80405e4c:	00351793          	slli	a5,a0,0x3
80405e50:	40a787b3          	sub	a5,a5,a0
80405e54:	00279793          	slli	a5,a5,0x2
80405e58:	00f40433          	add	s0,s0,a5
80405e5c:	00042703          	lw	a4,0(s0)
80405e60:	00200793          	li	a5,2
80405e64:	06f71e63          	bne	a4,a5,80405ee0 <file_fstat+0xd4>
80405e68:	00c42783          	lw	a5,12(s0)
80405e6c:	06f51a63          	bne	a0,a5,80405ee0 <file_fstat+0xd4>
80405e70:	01842783          	lw	a5,24(s0)
80405e74:	01442483          	lw	s1,20(s0)
80405e78:	00178793          	addi	a5,a5,1
80405e7c:	00f42c23          	sw	a5,24(s0)
80405e80:	08048263          	beqz	s1,80405f04 <file_fstat+0xf8>
80405e84:	03c4a783          	lw	a5,60(s1)
80405e88:	06078e63          	beqz	a5,80405f04 <file_fstat+0xf8>
80405e8c:	0147a783          	lw	a5,20(a5)
80405e90:	06078a63          	beqz	a5,80405f04 <file_fstat+0xf8>
80405e94:	00048513          	mv	a0,s1
80405e98:	0000e597          	auipc	a1,0xe
80405e9c:	3a458593          	addi	a1,a1,932 # 8041423c <CSWTCH.69+0x234>
80405ea0:	550070ef          	jal	ra,8040d3f0 <inode_check>
80405ea4:	03c4a783          	lw	a5,60(s1)
80405ea8:	01442503          	lw	a0,20(s0)
80405eac:	00090593          	mv	a1,s2
80405eb0:	0147a783          	lw	a5,20(a5)
80405eb4:	000780e7          	jalr	a5
80405eb8:	00050493          	mv	s1,a0
80405ebc:	00040513          	mv	a0,s0
80405ec0:	e50ff0ef          	jal	ra,80405510 <fd_array_release>
80405ec4:	00c12083          	lw	ra,12(sp)
80405ec8:	00812403          	lw	s0,8(sp)
80405ecc:	00048513          	mv	a0,s1
80405ed0:	00012903          	lw	s2,0(sp)
80405ed4:	00412483          	lw	s1,4(sp)
80405ed8:	01010113          	addi	sp,sp,16
80405edc:	00008067          	ret
80405ee0:	00c12083          	lw	ra,12(sp)
80405ee4:	00812403          	lw	s0,8(sp)
80405ee8:	ffd00493          	li	s1,-3
80405eec:	00048513          	mv	a0,s1
80405ef0:	00012903          	lw	s2,0(sp)
80405ef4:	00412483          	lw	s1,4(sp)
80405ef8:	01010113          	addi	sp,sp,16
80405efc:	00008067          	ret
80405f00:	c60ff0ef          	jal	ra,80405360 <get_fd_array.part.4>
80405f04:	0000e697          	auipc	a3,0xe
80405f08:	2e868693          	addi	a3,a3,744 # 804141ec <CSWTCH.69+0x1e4>
80405f0c:	0000d617          	auipc	a2,0xd
80405f10:	cdc60613          	addi	a2,a2,-804 # 80412be8 <commands+0x1bc>
80405f14:	13000593          	li	a1,304
80405f18:	0000e517          	auipc	a0,0xe
80405f1c:	46050513          	addi	a0,a0,1120 # 80414378 <CSWTCH.69+0x370>
80405f20:	f04fa0ef          	jal	ra,80400624 <__panic>

80405f24 <file_fsync>:
80405f24:	ff010113          	addi	sp,sp,-16
80405f28:	00112623          	sw	ra,12(sp)
80405f2c:	00812423          	sw	s0,8(sp)
80405f30:	00912223          	sw	s1,4(sp)
80405f34:	09000793          	li	a5,144
80405f38:	0aa7e863          	bltu	a5,a0,80405fe8 <file_fsync+0xc4>
80405f3c:	00097797          	auipc	a5,0x97
80405f40:	87078793          	addi	a5,a5,-1936 # 8049c7ac <current>
80405f44:	0007a783          	lw	a5,0(a5)
80405f48:	0dc7a703          	lw	a4,220(a5)
80405f4c:	0a070c63          	beqz	a4,80406004 <file_fsync+0xe0>
80405f50:	00872783          	lw	a5,8(a4)
80405f54:	0af05863          	blez	a5,80406004 <file_fsync+0xe0>
80405f58:	00472403          	lw	s0,4(a4)
80405f5c:	00351793          	slli	a5,a0,0x3
80405f60:	40a787b3          	sub	a5,a5,a0
80405f64:	00279793          	slli	a5,a5,0x2
80405f68:	00f40433          	add	s0,s0,a5
80405f6c:	00042703          	lw	a4,0(s0)
80405f70:	00200793          	li	a5,2
80405f74:	06f71a63          	bne	a4,a5,80405fe8 <file_fsync+0xc4>
80405f78:	00c42783          	lw	a5,12(s0)
80405f7c:	06f51663          	bne	a0,a5,80405fe8 <file_fsync+0xc4>
80405f80:	01842783          	lw	a5,24(s0)
80405f84:	01442483          	lw	s1,20(s0)
80405f88:	00178793          	addi	a5,a5,1
80405f8c:	00f42c23          	sw	a5,24(s0)
80405f90:	06048c63          	beqz	s1,80406008 <file_fsync+0xe4>
80405f94:	03c4a783          	lw	a5,60(s1)
80405f98:	06078863          	beqz	a5,80406008 <file_fsync+0xe4>
80405f9c:	0187a783          	lw	a5,24(a5)
80405fa0:	06078463          	beqz	a5,80406008 <file_fsync+0xe4>
80405fa4:	0000e597          	auipc	a1,0xe
80405fa8:	1e058593          	addi	a1,a1,480 # 80414184 <CSWTCH.69+0x17c>
80405fac:	00048513          	mv	a0,s1
80405fb0:	440070ef          	jal	ra,8040d3f0 <inode_check>
80405fb4:	03c4a783          	lw	a5,60(s1)
80405fb8:	01442503          	lw	a0,20(s0)
80405fbc:	0187a783          	lw	a5,24(a5)
80405fc0:	000780e7          	jalr	a5
80405fc4:	00050493          	mv	s1,a0
80405fc8:	00040513          	mv	a0,s0
80405fcc:	d44ff0ef          	jal	ra,80405510 <fd_array_release>
80405fd0:	00c12083          	lw	ra,12(sp)
80405fd4:	00812403          	lw	s0,8(sp)
80405fd8:	00048513          	mv	a0,s1
80405fdc:	00412483          	lw	s1,4(sp)
80405fe0:	01010113          	addi	sp,sp,16
80405fe4:	00008067          	ret
80405fe8:	00c12083          	lw	ra,12(sp)
80405fec:	00812403          	lw	s0,8(sp)
80405ff0:	ffd00493          	li	s1,-3
80405ff4:	00048513          	mv	a0,s1
80405ff8:	00412483          	lw	s1,4(sp)
80405ffc:	01010113          	addi	sp,sp,16
80406000:	00008067          	ret
80406004:	b5cff0ef          	jal	ra,80405360 <get_fd_array.part.4>
80406008:	0000e697          	auipc	a3,0xe
8040600c:	12c68693          	addi	a3,a3,300 # 80414134 <CSWTCH.69+0x12c>
80406010:	0000d617          	auipc	a2,0xd
80406014:	bd860613          	addi	a2,a2,-1064 # 80412be8 <commands+0x1bc>
80406018:	13e00593          	li	a1,318
8040601c:	0000e517          	auipc	a0,0xe
80406020:	35c50513          	addi	a0,a0,860 # 80414378 <CSWTCH.69+0x370>
80406024:	e00fa0ef          	jal	ra,80400624 <__panic>

80406028 <file_getdirentry>:
80406028:	fd010113          	addi	sp,sp,-48
8040602c:	02112623          	sw	ra,44(sp)
80406030:	02812423          	sw	s0,40(sp)
80406034:	02912223          	sw	s1,36(sp)
80406038:	03212023          	sw	s2,32(sp)
8040603c:	01312e23          	sw	s3,28(sp)
80406040:	09000793          	li	a5,144
80406044:	0ea7ec63          	bltu	a5,a0,8040613c <file_getdirentry+0x114>
80406048:	00096797          	auipc	a5,0x96
8040604c:	76478793          	addi	a5,a5,1892 # 8049c7ac <current>
80406050:	0007a783          	lw	a5,0(a5)
80406054:	00058493          	mv	s1,a1
80406058:	0dc7a703          	lw	a4,220(a5)
8040605c:	10070263          	beqz	a4,80406160 <file_getdirentry+0x138>
80406060:	00872783          	lw	a5,8(a4)
80406064:	0ef05e63          	blez	a5,80406160 <file_getdirentry+0x138>
80406068:	00472403          	lw	s0,4(a4)
8040606c:	00351793          	slli	a5,a0,0x3
80406070:	40a787b3          	sub	a5,a5,a0
80406074:	00279793          	slli	a5,a5,0x2
80406078:	00f40433          	add	s0,s0,a5
8040607c:	00042703          	lw	a4,0(s0)
80406080:	00200793          	li	a5,2
80406084:	0af71c63          	bne	a4,a5,8040613c <file_getdirentry+0x114>
80406088:	00c42783          	lw	a5,12(s0)
8040608c:	0af51863          	bne	a0,a5,8040613c <file_getdirentry+0x114>
80406090:	01842783          	lw	a5,24(s0)
80406094:	10000613          	li	a2,256
80406098:	00458593          	addi	a1,a1,4
8040609c:	00178793          	addi	a5,a5,1
804060a0:	00f42c23          	sw	a5,24(s0)
804060a4:	0004a683          	lw	a3,0(s1)
804060a8:	00010513          	mv	a0,sp
804060ac:	4a4000ef          	jal	ra,80406550 <iobuf_init>
804060b0:	01442903          	lw	s2,20(s0)
804060b4:	00050993          	mv	s3,a0
804060b8:	0a090663          	beqz	s2,80406164 <file_getdirentry+0x13c>
804060bc:	03c92783          	lw	a5,60(s2)
804060c0:	0a078263          	beqz	a5,80406164 <file_getdirentry+0x13c>
804060c4:	0207a783          	lw	a5,32(a5)
804060c8:	08078e63          	beqz	a5,80406164 <file_getdirentry+0x13c>
804060cc:	00090513          	mv	a0,s2
804060d0:	0000e597          	auipc	a1,0xe
804060d4:	11058593          	addi	a1,a1,272 # 804141e0 <CSWTCH.69+0x1d8>
804060d8:	318070ef          	jal	ra,8040d3f0 <inode_check>
804060dc:	03c92783          	lw	a5,60(s2)
804060e0:	01442503          	lw	a0,20(s0)
804060e4:	00098593          	mv	a1,s3
804060e8:	0207a783          	lw	a5,32(a5)
804060ec:	000780e7          	jalr	a5
804060f0:	00050913          	mv	s2,a0
804060f4:	02050663          	beqz	a0,80406120 <file_getdirentry+0xf8>
804060f8:	00040513          	mv	a0,s0
804060fc:	c14ff0ef          	jal	ra,80405510 <fd_array_release>
80406100:	02c12083          	lw	ra,44(sp)
80406104:	02812403          	lw	s0,40(sp)
80406108:	00090513          	mv	a0,s2
8040610c:	02412483          	lw	s1,36(sp)
80406110:	02012903          	lw	s2,32(sp)
80406114:	01c12983          	lw	s3,28(sp)
80406118:	03010113          	addi	sp,sp,48
8040611c:	00008067          	ret
80406120:	0004a783          	lw	a5,0(s1)
80406124:	0089a683          	lw	a3,8(s3) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80406128:	00c9a703          	lw	a4,12(s3)
8040612c:	00d787b3          	add	a5,a5,a3
80406130:	40e787b3          	sub	a5,a5,a4
80406134:	00f4a023          	sw	a5,0(s1)
80406138:	fc1ff06f          	j	804060f8 <file_getdirentry+0xd0>
8040613c:	02c12083          	lw	ra,44(sp)
80406140:	02812403          	lw	s0,40(sp)
80406144:	ffd00913          	li	s2,-3
80406148:	00090513          	mv	a0,s2
8040614c:	02412483          	lw	s1,36(sp)
80406150:	02012903          	lw	s2,32(sp)
80406154:	01c12983          	lw	s3,28(sp)
80406158:	03010113          	addi	sp,sp,48
8040615c:	00008067          	ret
80406160:	a00ff0ef          	jal	ra,80405360 <get_fd_array.part.4>
80406164:	0000e697          	auipc	a3,0xe
80406168:	02868693          	addi	a3,a3,40 # 8041418c <CSWTCH.69+0x184>
8040616c:	0000d617          	auipc	a2,0xd
80406170:	a7c60613          	addi	a2,a2,-1412 # 80412be8 <commands+0x1bc>
80406174:	14e00593          	li	a1,334
80406178:	0000e517          	auipc	a0,0xe
8040617c:	20050513          	addi	a0,a0,512 # 80414378 <CSWTCH.69+0x370>
80406180:	ca4fa0ef          	jal	ra,80400624 <__panic>

80406184 <file_dup>:
80406184:	09000793          	li	a5,144
80406188:	0aa7e863          	bltu	a5,a0,80406238 <file_dup+0xb4>
8040618c:	00096797          	auipc	a5,0x96
80406190:	62078793          	addi	a5,a5,1568 # 8049c7ac <current>
80406194:	0007a783          	lw	a5,0(a5)
80406198:	fe010113          	addi	sp,sp,-32
8040619c:	00112e23          	sw	ra,28(sp)
804061a0:	0dc7a683          	lw	a3,220(a5)
804061a4:	00812c23          	sw	s0,24(sp)
804061a8:	00050713          	mv	a4,a0
804061ac:	00058513          	mv	a0,a1
804061b0:	08068863          	beqz	a3,80406240 <file_dup+0xbc>
804061b4:	0086a783          	lw	a5,8(a3)
804061b8:	08f05463          	blez	a5,80406240 <file_dup+0xbc>
804061bc:	0046a403          	lw	s0,4(a3)
804061c0:	00371793          	slli	a5,a4,0x3
804061c4:	40e787b3          	sub	a5,a5,a4
804061c8:	00279793          	slli	a5,a5,0x2
804061cc:	00f40433          	add	s0,s0,a5
804061d0:	00042683          	lw	a3,0(s0)
804061d4:	00200793          	li	a5,2
804061d8:	04f69663          	bne	a3,a5,80406224 <file_dup+0xa0>
804061dc:	00c42783          	lw	a5,12(s0)
804061e0:	04f71263          	bne	a4,a5,80406224 <file_dup+0xa0>
804061e4:	00c10593          	addi	a1,sp,12
804061e8:	9a0ff0ef          	jal	ra,80405388 <fd_array_alloc>
804061ec:	00050a63          	beqz	a0,80406200 <file_dup+0x7c>
804061f0:	01c12083          	lw	ra,28(sp)
804061f4:	01812403          	lw	s0,24(sp)
804061f8:	02010113          	addi	sp,sp,32
804061fc:	00008067          	ret
80406200:	00c12503          	lw	a0,12(sp)
80406204:	00040593          	mv	a1,s0
80406208:	c60ff0ef          	jal	ra,80405668 <fd_array_dup>
8040620c:	00c12783          	lw	a5,12(sp)
80406210:	01c12083          	lw	ra,28(sp)
80406214:	01812403          	lw	s0,24(sp)
80406218:	00c7a503          	lw	a0,12(a5)
8040621c:	02010113          	addi	sp,sp,32
80406220:	00008067          	ret
80406224:	01c12083          	lw	ra,28(sp)
80406228:	01812403          	lw	s0,24(sp)
8040622c:	ffd00513          	li	a0,-3
80406230:	02010113          	addi	sp,sp,32
80406234:	00008067          	ret
80406238:	ffd00513          	li	a0,-3
8040623c:	00008067          	ret
80406240:	920ff0ef          	jal	ra,80405360 <get_fd_array.part.4>

80406244 <fs_init>:
80406244:	ff010113          	addi	sp,sp,-16
80406248:	00112623          	sw	ra,12(sp)
8040624c:	460070ef          	jal	ra,8040d6ac <vfs_init>
80406250:	6fc080ef          	jal	ra,8040e94c <dev_init>
80406254:	00c12083          	lw	ra,12(sp)
80406258:	01010113          	addi	sp,sp,16
8040625c:	35c0906f          	j	8040f5b8 <sfs_init>

80406260 <fs_cleanup>:
80406260:	01d0706f          	j	8040da7c <vfs_cleanup>

80406264 <lock_files>:
80406264:	00c50513          	addi	a0,a0,12
80406268:	e95fe06f          	j	804050fc <down>

8040626c <unlock_files>:
8040626c:	00c50513          	addi	a0,a0,12
80406270:	e89fe06f          	j	804050f8 <up>

80406274 <files_create>:
80406274:	ff010113          	addi	sp,sp,-16
80406278:	00001537          	lui	a0,0x1
8040627c:	00812423          	sw	s0,8(sp)
80406280:	00112623          	sw	ra,12(sp)
80406284:	f3cfc0ef          	jal	ra,804029c0 <kmalloc>
80406288:	00050413          	mv	s0,a0
8040628c:	02050463          	beqz	a0,804062b4 <files_create+0x40>
80406290:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6fe8>
80406294:	00042023          	sw	zero,0(s0)
80406298:	00c50513          	addi	a0,a0,12
8040629c:	00f42223          	sw	a5,4(s0)
804062a0:	00042423          	sw	zero,8(s0)
804062a4:	00100593          	li	a1,1
804062a8:	e45fe0ef          	jal	ra,804050ec <sem_init>
804062ac:	00442503          	lw	a0,4(s0)
804062b0:	b0cff0ef          	jal	ra,804055bc <fd_array_init>
804062b4:	00040513          	mv	a0,s0
804062b8:	00c12083          	lw	ra,12(sp)
804062bc:	00812403          	lw	s0,8(sp)
804062c0:	01010113          	addi	sp,sp,16
804062c4:	00008067          	ret

804062c8 <files_destroy>:
804062c8:	fe010113          	addi	sp,sp,-32
804062cc:	00112e23          	sw	ra,28(sp)
804062d0:	00812c23          	sw	s0,24(sp)
804062d4:	00912a23          	sw	s1,20(sp)
804062d8:	01212823          	sw	s2,16(sp)
804062dc:	01312623          	sw	s3,12(sp)
804062e0:	08050a63          	beqz	a0,80406374 <files_destroy+0xac>
804062e4:	00852783          	lw	a5,8(a0)
804062e8:	00050993          	mv	s3,a0
804062ec:	08079463          	bnez	a5,80406374 <files_destroy+0xac>
804062f0:	00052503          	lw	a0,0(a0)
804062f4:	00050463          	beqz	a0,804062fc <files_destroy+0x34>
804062f8:	1c4070ef          	jal	ra,8040d4bc <inode_ref_dec>
804062fc:	0049a403          	lw	s0,4(s3)
80406300:	000014b7          	lui	s1,0x1
80406304:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406308:	009404b3          	add	s1,s0,s1
8040630c:	00200913          	li	s2,2
80406310:	00042783          	lw	a5,0(s0)
80406314:	03278863          	beq	a5,s2,80406344 <files_destroy+0x7c>
80406318:	02079e63          	bnez	a5,80406354 <files_destroy+0x8c>
8040631c:	01c40413          	addi	s0,s0,28
80406320:	fe8498e3          	bne	s1,s0,80406310 <files_destroy+0x48>
80406324:	01812403          	lw	s0,24(sp)
80406328:	01c12083          	lw	ra,28(sp)
8040632c:	01412483          	lw	s1,20(sp)
80406330:	01012903          	lw	s2,16(sp)
80406334:	00098513          	mv	a0,s3
80406338:	00c12983          	lw	s3,12(sp)
8040633c:	02010113          	addi	sp,sp,32
80406340:	fa4fc06f          	j	80402ae4 <kfree>
80406344:	00040513          	mv	a0,s0
80406348:	a98ff0ef          	jal	ra,804055e0 <fd_array_close>
8040634c:	00042783          	lw	a5,0(s0)
80406350:	fc9ff06f          	j	80406318 <files_destroy+0x50>
80406354:	0000e697          	auipc	a3,0xe
80406358:	0a068693          	addi	a3,a3,160 # 804143f4 <CSWTCH.69+0x3ec>
8040635c:	0000d617          	auipc	a2,0xd
80406360:	88c60613          	addi	a2,a2,-1908 # 80412be8 <commands+0x1bc>
80406364:	03d00593          	li	a1,61
80406368:	0000e517          	auipc	a0,0xe
8040636c:	07c50513          	addi	a0,a0,124 # 804143e4 <CSWTCH.69+0x3dc>
80406370:	ab4fa0ef          	jal	ra,80400624 <__panic>
80406374:	0000e697          	auipc	a3,0xe
80406378:	04468693          	addi	a3,a3,68 # 804143b8 <CSWTCH.69+0x3b0>
8040637c:	0000d617          	auipc	a2,0xd
80406380:	86c60613          	addi	a2,a2,-1940 # 80412be8 <commands+0x1bc>
80406384:	03300593          	li	a1,51
80406388:	0000e517          	auipc	a0,0xe
8040638c:	05c50513          	addi	a0,a0,92 # 804143e4 <CSWTCH.69+0x3dc>
80406390:	a94fa0ef          	jal	ra,80400624 <__panic>

80406394 <files_closeall>:
80406394:	ff010113          	addi	sp,sp,-16
80406398:	00112623          	sw	ra,12(sp)
8040639c:	00812423          	sw	s0,8(sp)
804063a0:	00912223          	sw	s1,4(sp)
804063a4:	01212023          	sw	s2,0(sp)
804063a8:	06050063          	beqz	a0,80406408 <files_closeall+0x74>
804063ac:	00852783          	lw	a5,8(a0)
804063b0:	04f05c63          	blez	a5,80406408 <files_closeall+0x74>
804063b4:	00452483          	lw	s1,4(a0)
804063b8:	000017b7          	lui	a5,0x1
804063bc:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804063c0:	03848413          	addi	s0,s1,56
804063c4:	00200913          	li	s2,2
804063c8:	00f484b3          	add	s1,s1,a5
804063cc:	00c0006f          	j	804063d8 <files_closeall+0x44>
804063d0:	01c40413          	addi	s0,s0,28
804063d4:	00848e63          	beq	s1,s0,804063f0 <files_closeall+0x5c>
804063d8:	00042783          	lw	a5,0(s0)
804063dc:	ff279ae3          	bne	a5,s2,804063d0 <files_closeall+0x3c>
804063e0:	00040513          	mv	a0,s0
804063e4:	01c40413          	addi	s0,s0,28
804063e8:	9f8ff0ef          	jal	ra,804055e0 <fd_array_close>
804063ec:	fe8496e3          	bne	s1,s0,804063d8 <files_closeall+0x44>
804063f0:	00c12083          	lw	ra,12(sp)
804063f4:	00812403          	lw	s0,8(sp)
804063f8:	00412483          	lw	s1,4(sp)
804063fc:	00012903          	lw	s2,0(sp)
80406400:	01010113          	addi	sp,sp,16
80406404:	00008067          	ret
80406408:	0000e697          	auipc	a3,0xe
8040640c:	f4468693          	addi	a3,a3,-188 # 8041434c <CSWTCH.69+0x344>
80406410:	0000c617          	auipc	a2,0xc
80406414:	7d860613          	addi	a2,a2,2008 # 80412be8 <commands+0x1bc>
80406418:	04500593          	li	a1,69
8040641c:	0000e517          	auipc	a0,0xe
80406420:	fc850513          	addi	a0,a0,-56 # 804143e4 <CSWTCH.69+0x3dc>
80406424:	a00fa0ef          	jal	ra,80400624 <__panic>

80406428 <dup_files>:
80406428:	fe010113          	addi	sp,sp,-32
8040642c:	00112e23          	sw	ra,28(sp)
80406430:	00812c23          	sw	s0,24(sp)
80406434:	00912a23          	sw	s1,20(sp)
80406438:	01212823          	sw	s2,16(sp)
8040643c:	01312623          	sw	s3,12(sp)
80406440:	01412423          	sw	s4,8(sp)
80406444:	0a050263          	beqz	a0,804064e8 <dup_files+0xc0>
80406448:	00058413          	mv	s0,a1
8040644c:	08058e63          	beqz	a1,804064e8 <dup_files+0xc0>
80406450:	00852783          	lw	a5,8(a0)
80406454:	00050493          	mv	s1,a0
80406458:	0a079863          	bnez	a5,80406508 <dup_files+0xe0>
8040645c:	0085a783          	lw	a5,8(a1)
80406460:	0af05463          	blez	a5,80406508 <dup_files+0xe0>
80406464:	0005a503          	lw	a0,0(a1)
80406468:	00a4a023          	sw	a0,0(s1)
8040646c:	00050463          	beqz	a0,80406474 <dup_files+0x4c>
80406470:	759060ef          	jal	ra,8040d3c8 <inode_ref_inc>
80406474:	00442403          	lw	s0,4(s0)
80406478:	00001937          	lui	s2,0x1
8040647c:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406480:	0044a483          	lw	s1,4(s1)
80406484:	01240933          	add	s2,s0,s2
80406488:	00200993          	li	s3,2
8040648c:	00100a13          	li	s4,1
80406490:	0100006f          	j	804064a0 <dup_files+0x78>
80406494:	01c40413          	addi	s0,s0,28
80406498:	01c48493          	addi	s1,s1,28
8040649c:	02890463          	beq	s2,s0,804064c4 <dup_files+0x9c>
804064a0:	00042783          	lw	a5,0(s0)
804064a4:	ff3798e3          	bne	a5,s3,80406494 <dup_files+0x6c>
804064a8:	0144a023          	sw	s4,0(s1)
804064ac:	00040593          	mv	a1,s0
804064b0:	00048513          	mv	a0,s1
804064b4:	01c40413          	addi	s0,s0,28
804064b8:	9b0ff0ef          	jal	ra,80405668 <fd_array_dup>
804064bc:	01c48493          	addi	s1,s1,28
804064c0:	fe8910e3          	bne	s2,s0,804064a0 <dup_files+0x78>
804064c4:	01c12083          	lw	ra,28(sp)
804064c8:	01812403          	lw	s0,24(sp)
804064cc:	01412483          	lw	s1,20(sp)
804064d0:	01012903          	lw	s2,16(sp)
804064d4:	00c12983          	lw	s3,12(sp)
804064d8:	00812a03          	lw	s4,8(sp)
804064dc:	00000513          	li	a0,0
804064e0:	02010113          	addi	sp,sp,32
804064e4:	00008067          	ret
804064e8:	0000e697          	auipc	a3,0xe
804064ec:	9b468693          	addi	a3,a3,-1612 # 80413e9c <default_pmm_manager+0x778>
804064f0:	0000c617          	auipc	a2,0xc
804064f4:	6f860613          	addi	a2,a2,1784 # 80412be8 <commands+0x1bc>
804064f8:	05300593          	li	a1,83
804064fc:	0000e517          	auipc	a0,0xe
80406500:	ee850513          	addi	a0,a0,-280 # 804143e4 <CSWTCH.69+0x3dc>
80406504:	920fa0ef          	jal	ra,80400624 <__panic>
80406508:	0000e697          	auipc	a3,0xe
8040650c:	e8068693          	addi	a3,a3,-384 # 80414388 <CSWTCH.69+0x380>
80406510:	0000c617          	auipc	a2,0xc
80406514:	6d860613          	addi	a2,a2,1752 # 80412be8 <commands+0x1bc>
80406518:	05400593          	li	a1,84
8040651c:	0000e517          	auipc	a0,0xe
80406520:	ec850513          	addi	a0,a0,-312 # 804143e4 <CSWTCH.69+0x3dc>
80406524:	900fa0ef          	jal	ra,80400624 <__panic>

80406528 <iobuf_skip.part.0>:
80406528:	ff010113          	addi	sp,sp,-16
8040652c:	0000e697          	auipc	a3,0xe
80406530:	ee068693          	addi	a3,a3,-288 # 8041440c <CSWTCH.69+0x404>
80406534:	0000c617          	auipc	a2,0xc
80406538:	6b460613          	addi	a2,a2,1716 # 80412be8 <commands+0x1bc>
8040653c:	04a00593          	li	a1,74
80406540:	0000e517          	auipc	a0,0xe
80406544:	ee050513          	addi	a0,a0,-288 # 80414420 <CSWTCH.69+0x418>
80406548:	00112623          	sw	ra,12(sp)
8040654c:	8d8fa0ef          	jal	ra,80400624 <__panic>

80406550 <iobuf_init>:
80406550:	00b52023          	sw	a1,0(a0)
80406554:	00d52223          	sw	a3,4(a0)
80406558:	00c52623          	sw	a2,12(a0)
8040655c:	00c52423          	sw	a2,8(a0)
80406560:	00008067          	ret

80406564 <iobuf_move>:
80406564:	fe010113          	addi	sp,sp,-32
80406568:	00812c23          	sw	s0,24(sp)
8040656c:	00c52403          	lw	s0,12(a0)
80406570:	00912a23          	sw	s1,20(sp)
80406574:	01212823          	sw	s2,16(sp)
80406578:	01312623          	sw	s3,12(sp)
8040657c:	00112e23          	sw	ra,28(sp)
80406580:	00050493          	mv	s1,a0
80406584:	00060913          	mv	s2,a2
80406588:	00058513          	mv	a0,a1
8040658c:	00070993          	mv	s3,a4
80406590:	00867463          	bgeu	a2,s0,80406598 <iobuf_move+0x34>
80406594:	00060413          	mv	s0,a2
80406598:	04040063          	beqz	s0,804065d8 <iobuf_move+0x74>
8040659c:	0004a583          	lw	a1,0(s1)
804065a0:	06069263          	bnez	a3,80406604 <iobuf_move+0xa0>
804065a4:	00040613          	mv	a2,s0
804065a8:	22c0c0ef          	jal	ra,804127d4 <memmove>
804065ac:	00c4a783          	lw	a5,12(s1)
804065b0:	0687e663          	bltu	a5,s0,8040661c <iobuf_move+0xb8>
804065b4:	0004a683          	lw	a3,0(s1)
804065b8:	0044a703          	lw	a4,4(s1)
804065bc:	408787b3          	sub	a5,a5,s0
804065c0:	008686b3          	add	a3,a3,s0
804065c4:	00870733          	add	a4,a4,s0
804065c8:	00d4a023          	sw	a3,0(s1)
804065cc:	00e4a223          	sw	a4,4(s1)
804065d0:	00f4a623          	sw	a5,12(s1)
804065d4:	40890933          	sub	s2,s2,s0
804065d8:	00098463          	beqz	s3,804065e0 <iobuf_move+0x7c>
804065dc:	0089a023          	sw	s0,0(s3)
804065e0:	00000513          	li	a0,0
804065e4:	02091863          	bnez	s2,80406614 <iobuf_move+0xb0>
804065e8:	01c12083          	lw	ra,28(sp)
804065ec:	01812403          	lw	s0,24(sp)
804065f0:	01412483          	lw	s1,20(sp)
804065f4:	01012903          	lw	s2,16(sp)
804065f8:	00c12983          	lw	s3,12(sp)
804065fc:	02010113          	addi	sp,sp,32
80406600:	00008067          	ret
80406604:	00058793          	mv	a5,a1
80406608:	00050593          	mv	a1,a0
8040660c:	00078513          	mv	a0,a5
80406610:	f95ff06f          	j	804065a4 <iobuf_move+0x40>
80406614:	ffc00513          	li	a0,-4
80406618:	fd1ff06f          	j	804065e8 <iobuf_move+0x84>
8040661c:	f0dff0ef          	jal	ra,80406528 <iobuf_skip.part.0>

80406620 <iobuf_skip>:
80406620:	00c52783          	lw	a5,12(a0)
80406624:	02b7e463          	bltu	a5,a1,8040664c <iobuf_skip+0x2c>
80406628:	00052683          	lw	a3,0(a0)
8040662c:	00452703          	lw	a4,4(a0)
80406630:	40b787b3          	sub	a5,a5,a1
80406634:	00b686b3          	add	a3,a3,a1
80406638:	00b705b3          	add	a1,a4,a1
8040663c:	00d52023          	sw	a3,0(a0)
80406640:	00b52223          	sw	a1,4(a0)
80406644:	00f52623          	sw	a5,12(a0)
80406648:	00008067          	ret
8040664c:	ff010113          	addi	sp,sp,-16
80406650:	00112623          	sw	ra,12(sp)
80406654:	ed5ff0ef          	jal	ra,80406528 <iobuf_skip.part.0>

80406658 <copy_path>:
80406658:	fe010113          	addi	sp,sp,-32
8040665c:	01212823          	sw	s2,16(sp)
80406660:	00096917          	auipc	s2,0x96
80406664:	14c90913          	addi	s2,s2,332 # 8049c7ac <current>
80406668:	00092783          	lw	a5,0(s2)
8040666c:	01412423          	sw	s4,8(sp)
80406670:	00050a13          	mv	s4,a0
80406674:	00001537          	lui	a0,0x1
80406678:	00912a23          	sw	s1,20(sp)
8040667c:	01312623          	sw	s3,12(sp)
80406680:	00112e23          	sw	ra,28(sp)
80406684:	00812c23          	sw	s0,24(sp)
80406688:	01512223          	sw	s5,4(sp)
8040668c:	00058993          	mv	s3,a1
80406690:	0187a483          	lw	s1,24(a5)
80406694:	b2cfc0ef          	jal	ra,804029c0 <kmalloc>
80406698:	0c050463          	beqz	a0,80406760 <copy_path+0x108>
8040669c:	00050413          	mv	s0,a0
804066a0:	06048863          	beqz	s1,80406710 <copy_path+0xb8>
804066a4:	01c48a93          	addi	s5,s1,28
804066a8:	000a8513          	mv	a0,s5
804066ac:	a51fe0ef          	jal	ra,804050fc <down>
804066b0:	00092783          	lw	a5,0(s2)
804066b4:	08078263          	beqz	a5,80406738 <copy_path+0xe0>
804066b8:	0047a783          	lw	a5,4(a5)
804066bc:	000016b7          	lui	a3,0x1
804066c0:	00098613          	mv	a2,s3
804066c4:	02f4a423          	sw	a5,40(s1)
804066c8:	00040593          	mv	a1,s0
804066cc:	00048513          	mv	a0,s1
804066d0:	f3cfe0ef          	jal	ra,80404e0c <copy_string>
804066d4:	06050e63          	beqz	a0,80406750 <copy_path+0xf8>
804066d8:	000a8513          	mv	a0,s5
804066dc:	a1dfe0ef          	jal	ra,804050f8 <up>
804066e0:	0204a423          	sw	zero,40(s1)
804066e4:	008a2023          	sw	s0,0(s4)
804066e8:	00000513          	li	a0,0
804066ec:	01c12083          	lw	ra,28(sp)
804066f0:	01812403          	lw	s0,24(sp)
804066f4:	01412483          	lw	s1,20(sp)
804066f8:	01012903          	lw	s2,16(sp)
804066fc:	00c12983          	lw	s3,12(sp)
80406700:	00812a03          	lw	s4,8(sp)
80406704:	00412a83          	lw	s5,4(sp)
80406708:	02010113          	addi	sp,sp,32
8040670c:	00008067          	ret
80406710:	00050593          	mv	a1,a0
80406714:	000016b7          	lui	a3,0x1
80406718:	00098613          	mv	a2,s3
8040671c:	00000513          	li	a0,0
80406720:	eecfe0ef          	jal	ra,80404e0c <copy_string>
80406724:	fc0510e3          	bnez	a0,804066e4 <copy_path+0x8c>
80406728:	00040513          	mv	a0,s0
8040672c:	bb8fc0ef          	jal	ra,80402ae4 <kfree>
80406730:	ffd00513          	li	a0,-3
80406734:	fb9ff06f          	j	804066ec <copy_path+0x94>
80406738:	000016b7          	lui	a3,0x1
8040673c:	00098613          	mv	a2,s3
80406740:	00040593          	mv	a1,s0
80406744:	00048513          	mv	a0,s1
80406748:	ec4fe0ef          	jal	ra,80404e0c <copy_string>
8040674c:	f80516e3          	bnez	a0,804066d8 <copy_path+0x80>
80406750:	000a8513          	mv	a0,s5
80406754:	9a5fe0ef          	jal	ra,804050f8 <up>
80406758:	0204a423          	sw	zero,40(s1)
8040675c:	fcdff06f          	j	80406728 <copy_path+0xd0>
80406760:	ffc00513          	li	a0,-4
80406764:	f89ff06f          	j	804066ec <copy_path+0x94>

80406768 <sysfile_open>:
80406768:	fe010113          	addi	sp,sp,-32
8040676c:	00912a23          	sw	s1,20(sp)
80406770:	00058493          	mv	s1,a1
80406774:	00050593          	mv	a1,a0
80406778:	00c10513          	addi	a0,sp,12
8040677c:	00812c23          	sw	s0,24(sp)
80406780:	00112e23          	sw	ra,28(sp)
80406784:	ed5ff0ef          	jal	ra,80406658 <copy_path>
80406788:	00050413          	mv	s0,a0
8040678c:	00051e63          	bnez	a0,804067a8 <sysfile_open+0x40>
80406790:	00c12503          	lw	a0,12(sp)
80406794:	00048593          	mv	a1,s1
80406798:	810ff0ef          	jal	ra,804057a8 <file_open>
8040679c:	00050413          	mv	s0,a0
804067a0:	00c12503          	lw	a0,12(sp)
804067a4:	b40fc0ef          	jal	ra,80402ae4 <kfree>
804067a8:	00040513          	mv	a0,s0
804067ac:	01c12083          	lw	ra,28(sp)
804067b0:	01812403          	lw	s0,24(sp)
804067b4:	01412483          	lw	s1,20(sp)
804067b8:	02010113          	addi	sp,sp,32
804067bc:	00008067          	ret

804067c0 <sysfile_close>:
804067c0:	96cff06f          	j	8040592c <file_close>

804067c4 <sysfile_read>:
804067c4:	fc010113          	addi	sp,sp,-64
804067c8:	02912a23          	sw	s1,52(sp)
804067cc:	02112e23          	sw	ra,60(sp)
804067d0:	02812c23          	sw	s0,56(sp)
804067d4:	03212823          	sw	s2,48(sp)
804067d8:	03312623          	sw	s3,44(sp)
804067dc:	03412423          	sw	s4,40(sp)
804067e0:	03512223          	sw	s5,36(sp)
804067e4:	03612023          	sw	s6,32(sp)
804067e8:	01712e23          	sw	s7,28(sp)
804067ec:	01812c23          	sw	s8,24(sp)
804067f0:	01912a23          	sw	s9,20(sp)
804067f4:	00000493          	li	s1,0
804067f8:	02061e63          	bnez	a2,80406834 <sysfile_read+0x70>
804067fc:	03c12083          	lw	ra,60(sp)
80406800:	03812403          	lw	s0,56(sp)
80406804:	00048513          	mv	a0,s1
80406808:	03012903          	lw	s2,48(sp)
8040680c:	03412483          	lw	s1,52(sp)
80406810:	02c12983          	lw	s3,44(sp)
80406814:	02812a03          	lw	s4,40(sp)
80406818:	02412a83          	lw	s5,36(sp)
8040681c:	02012b03          	lw	s6,32(sp)
80406820:	01c12b83          	lw	s7,28(sp)
80406824:	01812c03          	lw	s8,24(sp)
80406828:	01412c83          	lw	s9,20(sp)
8040682c:	04010113          	addi	sp,sp,64
80406830:	00008067          	ret
80406834:	00096c97          	auipc	s9,0x96
80406838:	f78c8c93          	addi	s9,s9,-136 # 8049c7ac <current>
8040683c:	000ca783          	lw	a5,0(s9)
80406840:	00060413          	mv	s0,a2
80406844:	00058b13          	mv	s6,a1
80406848:	00000613          	li	a2,0
8040684c:	00100593          	li	a1,1
80406850:	00050a93          	mv	s5,a0
80406854:	0187a903          	lw	s2,24(a5)
80406858:	ed1fe0ef          	jal	ra,80405728 <file_testfd>
8040685c:	10050063          	beqz	a0,8040695c <sysfile_read+0x198>
80406860:	00001537          	lui	a0,0x1
80406864:	95cfc0ef          	jal	ra,804029c0 <kmalloc>
80406868:	00050993          	mv	s3,a0
8040686c:	0e050c63          	beqz	a0,80406964 <sysfile_read+0x1a0>
80406870:	00000b93          	li	s7,0
80406874:	00001a37          	lui	s4,0x1
80406878:	01c90c13          	addi	s8,s2,28
8040687c:	0d446663          	bltu	s0,s4,80406948 <sysfile_read+0x184>
80406880:	01412623          	sw	s4,12(sp)
80406884:	00001637          	lui	a2,0x1
80406888:	00c10693          	addi	a3,sp,12
8040688c:	00098593          	mv	a1,s3
80406890:	000a8513          	mv	a0,s5
80406894:	920ff0ef          	jal	ra,804059b4 <file_read>
80406898:	00c12683          	lw	a3,12(sp)
8040689c:	00050493          	mv	s1,a0
804068a0:	08068863          	beqz	a3,80406930 <sysfile_read+0x16c>
804068a4:	02090063          	beqz	s2,804068c4 <sysfile_read+0x100>
804068a8:	000c0513          	mv	a0,s8
804068ac:	851fe0ef          	jal	ra,804050fc <down>
804068b0:	000ca783          	lw	a5,0(s9)
804068b4:	0a078063          	beqz	a5,80406954 <sysfile_read+0x190>
804068b8:	0047a783          	lw	a5,4(a5)
804068bc:	00c12683          	lw	a3,12(sp)
804068c0:	02f92423          	sw	a5,40(s2)
804068c4:	00098613          	mv	a2,s3
804068c8:	000b0593          	mv	a1,s6
804068cc:	00090513          	mv	a0,s2
804068d0:	ce0fe0ef          	jal	ra,80404db0 <copy_to_user>
804068d4:	04050063          	beqz	a0,80406914 <sysfile_read+0x150>
804068d8:	00c12783          	lw	a5,12(sp)
804068dc:	08f46863          	bltu	s0,a5,8040696c <sysfile_read+0x1a8>
804068e0:	00fb0b33          	add	s6,s6,a5
804068e4:	40f40433          	sub	s0,s0,a5
804068e8:	00fb8bb3          	add	s7,s7,a5
804068ec:	02091a63          	bnez	s2,80406920 <sysfile_read+0x15c>
804068f0:	00049863          	bnez	s1,80406900 <sysfile_read+0x13c>
804068f4:	00c12783          	lw	a5,12(sp)
804068f8:	02078e63          	beqz	a5,80406934 <sysfile_read+0x170>
804068fc:	f80410e3          	bnez	s0,8040687c <sysfile_read+0xb8>
80406900:	00098513          	mv	a0,s3
80406904:	9e0fc0ef          	jal	ra,80402ae4 <kfree>
80406908:	ee0b8ae3          	beqz	s7,804067fc <sysfile_read+0x38>
8040690c:	000b8493          	mv	s1,s7
80406910:	eedff06f          	j	804067fc <sysfile_read+0x38>
80406914:	00049463          	bnez	s1,8040691c <sysfile_read+0x158>
80406918:	ffd00493          	li	s1,-3
8040691c:	fe0902e3          	beqz	s2,80406900 <sysfile_read+0x13c>
80406920:	000c0513          	mv	a0,s8
80406924:	fd4fe0ef          	jal	ra,804050f8 <up>
80406928:	02092423          	sw	zero,40(s2)
8040692c:	fc5ff06f          	j	804068f0 <sysfile_read+0x12c>
80406930:	fc0518e3          	bnez	a0,80406900 <sysfile_read+0x13c>
80406934:	00098513          	mv	a0,s3
80406938:	00000493          	li	s1,0
8040693c:	9a8fc0ef          	jal	ra,80402ae4 <kfree>
80406940:	ea0b8ee3          	beqz	s7,804067fc <sysfile_read+0x38>
80406944:	fc9ff06f          	j	8040690c <sysfile_read+0x148>
80406948:	00812623          	sw	s0,12(sp)
8040694c:	00040613          	mv	a2,s0
80406950:	f39ff06f          	j	80406888 <sysfile_read+0xc4>
80406954:	00c12683          	lw	a3,12(sp)
80406958:	f6dff06f          	j	804068c4 <sysfile_read+0x100>
8040695c:	ffd00493          	li	s1,-3
80406960:	e9dff06f          	j	804067fc <sysfile_read+0x38>
80406964:	ffc00493          	li	s1,-4
80406968:	e95ff06f          	j	804067fc <sysfile_read+0x38>
8040696c:	0000e697          	auipc	a3,0xe
80406970:	ac468693          	addi	a3,a3,-1340 # 80414430 <CSWTCH.69+0x428>
80406974:	0000c617          	auipc	a2,0xc
80406978:	27460613          	addi	a2,a2,628 # 80412be8 <commands+0x1bc>
8040697c:	05500593          	li	a1,85
80406980:	0000e517          	auipc	a0,0xe
80406984:	abc50513          	addi	a0,a0,-1348 # 8041443c <CSWTCH.69+0x434>
80406988:	c9df90ef          	jal	ra,80400624 <__panic>

8040698c <sysfile_write>:
8040698c:	fc010113          	addi	sp,sp,-64
80406990:	03512223          	sw	s5,36(sp)
80406994:	02112e23          	sw	ra,60(sp)
80406998:	02812c23          	sw	s0,56(sp)
8040699c:	02912a23          	sw	s1,52(sp)
804069a0:	03212823          	sw	s2,48(sp)
804069a4:	03312623          	sw	s3,44(sp)
804069a8:	03412423          	sw	s4,40(sp)
804069ac:	03612023          	sw	s6,32(sp)
804069b0:	01712e23          	sw	s7,28(sp)
804069b4:	01812c23          	sw	s8,24(sp)
804069b8:	01912a23          	sw	s9,20(sp)
804069bc:	00000a93          	li	s5,0
804069c0:	02061e63          	bnez	a2,804069fc <sysfile_write+0x70>
804069c4:	03c12083          	lw	ra,60(sp)
804069c8:	03812403          	lw	s0,56(sp)
804069cc:	000a8513          	mv	a0,s5
804069d0:	03412483          	lw	s1,52(sp)
804069d4:	03012903          	lw	s2,48(sp)
804069d8:	02c12983          	lw	s3,44(sp)
804069dc:	02812a03          	lw	s4,40(sp)
804069e0:	02412a83          	lw	s5,36(sp)
804069e4:	02012b03          	lw	s6,32(sp)
804069e8:	01c12b83          	lw	s7,28(sp)
804069ec:	01812c03          	lw	s8,24(sp)
804069f0:	01412c83          	lw	s9,20(sp)
804069f4:	04010113          	addi	sp,sp,64
804069f8:	00008067          	ret
804069fc:	00096b97          	auipc	s7,0x96
80406a00:	db0b8b93          	addi	s7,s7,-592 # 8049c7ac <current>
80406a04:	000ba783          	lw	a5,0(s7)
80406a08:	00060413          	mv	s0,a2
80406a0c:	00058a13          	mv	s4,a1
80406a10:	00100613          	li	a2,1
80406a14:	00000593          	li	a1,0
80406a18:	00050c93          	mv	s9,a0
80406a1c:	0187a483          	lw	s1,24(a5)
80406a20:	d09fe0ef          	jal	ra,80405728 <file_testfd>
80406a24:	0e050e63          	beqz	a0,80406b20 <sysfile_write+0x194>
80406a28:	00001537          	lui	a0,0x1
80406a2c:	f95fb0ef          	jal	ra,804029c0 <kmalloc>
80406a30:	00050993          	mv	s3,a0
80406a34:	0e050a63          	beqz	a0,80406b28 <sysfile_write+0x19c>
80406a38:	00000c13          	li	s8,0
80406a3c:	00001937          	lui	s2,0x1
80406a40:	01c48b13          	addi	s6,s1,28
80406a44:	09246063          	bltu	s0,s2,80406ac4 <sysfile_write+0x138>
80406a48:	01212623          	sw	s2,12(sp)
80406a4c:	08048063          	beqz	s1,80406acc <sysfile_write+0x140>
80406a50:	000b0513          	mv	a0,s6
80406a54:	ea8fe0ef          	jal	ra,804050fc <down>
80406a58:	000ba783          	lw	a5,0(s7)
80406a5c:	00078663          	beqz	a5,80406a68 <sysfile_write+0xdc>
80406a60:	0047a783          	lw	a5,4(a5)
80406a64:	02f4a423          	sw	a5,40(s1)
80406a68:	00c12683          	lw	a3,12(sp)
80406a6c:	00000713          	li	a4,0
80406a70:	000a0613          	mv	a2,s4
80406a74:	00098593          	mv	a1,s3
80406a78:	00048513          	mv	a0,s1
80406a7c:	ad4fe0ef          	jal	ra,80404d50 <copy_from_user>
80406a80:	06050863          	beqz	a0,80406af0 <sysfile_write+0x164>
80406a84:	000b0513          	mv	a0,s6
80406a88:	e70fe0ef          	jal	ra,804050f8 <up>
80406a8c:	0204a423          	sw	zero,40(s1)
80406a90:	00c12603          	lw	a2,12(sp)
80406a94:	00c10693          	addi	a3,sp,12
80406a98:	00098593          	mv	a1,s3
80406a9c:	000c8513          	mv	a0,s9
80406aa0:	868ff0ef          	jal	ra,80405b08 <file_write>
80406aa4:	00c12783          	lw	a5,12(sp)
80406aa8:	00050a93          	mv	s5,a0
80406aac:	04079c63          	bnez	a5,80406b04 <sysfile_write+0x178>
80406ab0:	00098513          	mv	a0,s3
80406ab4:	830fc0ef          	jal	ra,80402ae4 <kfree>
80406ab8:	f00c06e3          	beqz	s8,804069c4 <sysfile_write+0x38>
80406abc:	000c0a93          	mv	s5,s8
80406ac0:	f05ff06f          	j	804069c4 <sysfile_write+0x38>
80406ac4:	00812623          	sw	s0,12(sp)
80406ac8:	f80494e3          	bnez	s1,80406a50 <sysfile_write+0xc4>
80406acc:	00c12683          	lw	a3,12(sp)
80406ad0:	00000713          	li	a4,0
80406ad4:	000a0613          	mv	a2,s4
80406ad8:	00098593          	mv	a1,s3
80406adc:	00000513          	li	a0,0
80406ae0:	a70fe0ef          	jal	ra,80404d50 <copy_from_user>
80406ae4:	fa0516e3          	bnez	a0,80406a90 <sysfile_write+0x104>
80406ae8:	ffd00a93          	li	s5,-3
80406aec:	fc5ff06f          	j	80406ab0 <sysfile_write+0x124>
80406af0:	000b0513          	mv	a0,s6
80406af4:	e04fe0ef          	jal	ra,804050f8 <up>
80406af8:	ffd00a93          	li	s5,-3
80406afc:	0204a423          	sw	zero,40(s1)
80406b00:	fb1ff06f          	j	80406ab0 <sysfile_write+0x124>
80406b04:	02f46663          	bltu	s0,a5,80406b30 <sysfile_write+0x1a4>
80406b08:	00fa0a33          	add	s4,s4,a5
80406b0c:	40f40433          	sub	s0,s0,a5
80406b10:	00fc0c33          	add	s8,s8,a5
80406b14:	f8051ee3          	bnez	a0,80406ab0 <sysfile_write+0x124>
80406b18:	f20416e3          	bnez	s0,80406a44 <sysfile_write+0xb8>
80406b1c:	f95ff06f          	j	80406ab0 <sysfile_write+0x124>
80406b20:	ffd00a93          	li	s5,-3
80406b24:	ea1ff06f          	j	804069c4 <sysfile_write+0x38>
80406b28:	ffc00a93          	li	s5,-4
80406b2c:	e99ff06f          	j	804069c4 <sysfile_write+0x38>
80406b30:	0000e697          	auipc	a3,0xe
80406b34:	90068693          	addi	a3,a3,-1792 # 80414430 <CSWTCH.69+0x428>
80406b38:	0000c617          	auipc	a2,0xc
80406b3c:	0b060613          	addi	a2,a2,176 # 80412be8 <commands+0x1bc>
80406b40:	08a00593          	li	a1,138
80406b44:	0000e517          	auipc	a0,0xe
80406b48:	8f850513          	addi	a0,a0,-1800 # 8041443c <CSWTCH.69+0x434>
80406b4c:	ad9f90ef          	jal	ra,80400624 <__panic>

80406b50 <sysfile_seek>:
80406b50:	90cff06f          	j	80405c5c <file_seek>

80406b54 <sysfile_fstat>:
80406b54:	fd010113          	addi	sp,sp,-48
80406b58:	03212023          	sw	s2,32(sp)
80406b5c:	00096917          	auipc	s2,0x96
80406b60:	c5090913          	addi	s2,s2,-944 # 8049c7ac <current>
80406b64:	00092783          	lw	a5,0(s2)
80406b68:	01312e23          	sw	s3,28(sp)
80406b6c:	00058993          	mv	s3,a1
80406b70:	00010593          	mv	a1,sp
80406b74:	02812423          	sw	s0,40(sp)
80406b78:	02912223          	sw	s1,36(sp)
80406b7c:	02112623          	sw	ra,44(sp)
80406b80:	01412c23          	sw	s4,24(sp)
80406b84:	0187a483          	lw	s1,24(a5)
80406b88:	a84ff0ef          	jal	ra,80405e0c <file_fstat>
80406b8c:	00050413          	mv	s0,a0
80406b90:	04051463          	bnez	a0,80406bd8 <sysfile_fstat+0x84>
80406b94:	06048463          	beqz	s1,80406bfc <sysfile_fstat+0xa8>
80406b98:	01c48a13          	addi	s4,s1,28
80406b9c:	000a0513          	mv	a0,s4
80406ba0:	d5cfe0ef          	jal	ra,804050fc <down>
80406ba4:	00092783          	lw	a5,0(s2)
80406ba8:	06078863          	beqz	a5,80406c18 <sysfile_fstat+0xc4>
80406bac:	0047a783          	lw	a5,4(a5)
80406bb0:	01000693          	li	a3,16
80406bb4:	00010613          	mv	a2,sp
80406bb8:	02f4a423          	sw	a5,40(s1)
80406bbc:	00098593          	mv	a1,s3
80406bc0:	00048513          	mv	a0,s1
80406bc4:	9ecfe0ef          	jal	ra,80404db0 <copy_to_user>
80406bc8:	06050463          	beqz	a0,80406c30 <sysfile_fstat+0xdc>
80406bcc:	000a0513          	mv	a0,s4
80406bd0:	d28fe0ef          	jal	ra,804050f8 <up>
80406bd4:	0204a423          	sw	zero,40(s1)
80406bd8:	00040513          	mv	a0,s0
80406bdc:	02c12083          	lw	ra,44(sp)
80406be0:	02812403          	lw	s0,40(sp)
80406be4:	02412483          	lw	s1,36(sp)
80406be8:	02012903          	lw	s2,32(sp)
80406bec:	01c12983          	lw	s3,28(sp)
80406bf0:	01812a03          	lw	s4,24(sp)
80406bf4:	03010113          	addi	sp,sp,48
80406bf8:	00008067          	ret
80406bfc:	01000693          	li	a3,16
80406c00:	00010613          	mv	a2,sp
80406c04:	00098593          	mv	a1,s3
80406c08:	9a8fe0ef          	jal	ra,80404db0 <copy_to_user>
80406c0c:	fc0516e3          	bnez	a0,80406bd8 <sysfile_fstat+0x84>
80406c10:	ffd00413          	li	s0,-3
80406c14:	fc5ff06f          	j	80406bd8 <sysfile_fstat+0x84>
80406c18:	01000693          	li	a3,16
80406c1c:	00010613          	mv	a2,sp
80406c20:	00098593          	mv	a1,s3
80406c24:	00048513          	mv	a0,s1
80406c28:	988fe0ef          	jal	ra,80404db0 <copy_to_user>
80406c2c:	fa0510e3          	bnez	a0,80406bcc <sysfile_fstat+0x78>
80406c30:	000a0513          	mv	a0,s4
80406c34:	cc4fe0ef          	jal	ra,804050f8 <up>
80406c38:	ffd00413          	li	s0,-3
80406c3c:	0204a423          	sw	zero,40(s1)
80406c40:	f99ff06f          	j	80406bd8 <sysfile_fstat+0x84>

80406c44 <sysfile_fsync>:
80406c44:	ae0ff06f          	j	80405f24 <file_fsync>

80406c48 <sysfile_getcwd>:
80406c48:	fd010113          	addi	sp,sp,-48
80406c4c:	01312e23          	sw	s3,28(sp)
80406c50:	00096997          	auipc	s3,0x96
80406c54:	b5c98993          	addi	s3,s3,-1188 # 8049c7ac <current>
80406c58:	0009a783          	lw	a5,0(s3)
80406c5c:	03212023          	sw	s2,32(sp)
80406c60:	02112623          	sw	ra,44(sp)
80406c64:	02812423          	sw	s0,40(sp)
80406c68:	02912223          	sw	s1,36(sp)
80406c6c:	01412c23          	sw	s4,24(sp)
80406c70:	0187a903          	lw	s2,24(a5)
80406c74:	08058863          	beqz	a1,80406d04 <sysfile_getcwd+0xbc>
80406c78:	00050493          	mv	s1,a0
80406c7c:	00058413          	mv	s0,a1
80406c80:	06090663          	beqz	s2,80406cec <sysfile_getcwd+0xa4>
80406c84:	01c90a13          	addi	s4,s2,28
80406c88:	000a0513          	mv	a0,s4
80406c8c:	c70fe0ef          	jal	ra,804050fc <down>
80406c90:	0009a783          	lw	a5,0(s3)
80406c94:	00078663          	beqz	a5,80406ca0 <sysfile_getcwd+0x58>
80406c98:	0047a783          	lw	a5,4(a5)
80406c9c:	02f92423          	sw	a5,40(s2)
80406ca0:	00100693          	li	a3,1
80406ca4:	00040613          	mv	a2,s0
80406ca8:	00048593          	mv	a1,s1
80406cac:	00090513          	mv	a0,s2
80406cb0:	fc9fd0ef          	jal	ra,80404c78 <user_mem_check>
80406cb4:	04051c63          	bnez	a0,80406d0c <sysfile_getcwd+0xc4>
80406cb8:	ffd00413          	li	s0,-3
80406cbc:	000a0513          	mv	a0,s4
80406cc0:	c38fe0ef          	jal	ra,804050f8 <up>
80406cc4:	02092423          	sw	zero,40(s2)
80406cc8:	00040513          	mv	a0,s0
80406ccc:	02c12083          	lw	ra,44(sp)
80406cd0:	02812403          	lw	s0,40(sp)
80406cd4:	02412483          	lw	s1,36(sp)
80406cd8:	02012903          	lw	s2,32(sp)
80406cdc:	01c12983          	lw	s3,28(sp)
80406ce0:	01812a03          	lw	s4,24(sp)
80406ce4:	03010113          	addi	sp,sp,48
80406ce8:	00008067          	ret
80406cec:	00058613          	mv	a2,a1
80406cf0:	00100693          	li	a3,1
80406cf4:	00050593          	mv	a1,a0
80406cf8:	00000513          	li	a0,0
80406cfc:	f7dfd0ef          	jal	ra,80404c78 <user_mem_check>
80406d00:	02051663          	bnez	a0,80406d2c <sysfile_getcwd+0xe4>
80406d04:	ffd00413          	li	s0,-3
80406d08:	fc1ff06f          	j	80406cc8 <sysfile_getcwd+0x80>
80406d0c:	00040613          	mv	a2,s0
80406d10:	00000693          	li	a3,0
80406d14:	00048593          	mv	a1,s1
80406d18:	00010513          	mv	a0,sp
80406d1c:	835ff0ef          	jal	ra,80406550 <iobuf_init>
80406d20:	744070ef          	jal	ra,8040e464 <vfs_getcwd>
80406d24:	00050413          	mv	s0,a0
80406d28:	f95ff06f          	j	80406cbc <sysfile_getcwd+0x74>
80406d2c:	00040613          	mv	a2,s0
80406d30:	00000693          	li	a3,0
80406d34:	00048593          	mv	a1,s1
80406d38:	00010513          	mv	a0,sp
80406d3c:	815ff0ef          	jal	ra,80406550 <iobuf_init>
80406d40:	724070ef          	jal	ra,8040e464 <vfs_getcwd>
80406d44:	00050413          	mv	s0,a0
80406d48:	f81ff06f          	j	80406cc8 <sysfile_getcwd+0x80>

80406d4c <sysfile_getdirentry>:
80406d4c:	fe010113          	addi	sp,sp,-32
80406d50:	01212823          	sw	s2,16(sp)
80406d54:	00096917          	auipc	s2,0x96
80406d58:	a5890913          	addi	s2,s2,-1448 # 8049c7ac <current>
80406d5c:	00092783          	lw	a5,0(s2)
80406d60:	01312623          	sw	s3,12(sp)
80406d64:	00050993          	mv	s3,a0
80406d68:	10400513          	li	a0,260
80406d6c:	00912a23          	sw	s1,20(sp)
80406d70:	01412423          	sw	s4,8(sp)
80406d74:	00112e23          	sw	ra,28(sp)
80406d78:	00812c23          	sw	s0,24(sp)
80406d7c:	01512223          	sw	s5,4(sp)
80406d80:	00058a13          	mv	s4,a1
80406d84:	0187a483          	lw	s1,24(a5)
80406d88:	c39fb0ef          	jal	ra,804029c0 <kmalloc>
80406d8c:	12050a63          	beqz	a0,80406ec0 <sysfile_getdirentry+0x174>
80406d90:	00050413          	mv	s0,a0
80406d94:	0e048063          	beqz	s1,80406e74 <sysfile_getdirentry+0x128>
80406d98:	01c48a93          	addi	s5,s1,28
80406d9c:	000a8513          	mv	a0,s5
80406da0:	b5cfe0ef          	jal	ra,804050fc <down>
80406da4:	00092783          	lw	a5,0(s2)
80406da8:	00078663          	beqz	a5,80406db4 <sysfile_getdirentry+0x68>
80406dac:	0047a783          	lw	a5,4(a5)
80406db0:	02f4a423          	sw	a5,40(s1)
80406db4:	00100713          	li	a4,1
80406db8:	00400693          	li	a3,4
80406dbc:	000a0613          	mv	a2,s4
80406dc0:	00040593          	mv	a1,s0
80406dc4:	00048513          	mv	a0,s1
80406dc8:	f89fd0ef          	jal	ra,80404d50 <copy_from_user>
80406dcc:	04051263          	bnez	a0,80406e10 <sysfile_getdirentry+0xc4>
80406dd0:	000a8513          	mv	a0,s5
80406dd4:	b24fe0ef          	jal	ra,804050f8 <up>
80406dd8:	ffd00993          	li	s3,-3
80406ddc:	0204a423          	sw	zero,40(s1)
80406de0:	00040513          	mv	a0,s0
80406de4:	d01fb0ef          	jal	ra,80402ae4 <kfree>
80406de8:	01c12083          	lw	ra,28(sp)
80406dec:	01812403          	lw	s0,24(sp)
80406df0:	00098513          	mv	a0,s3
80406df4:	01412483          	lw	s1,20(sp)
80406df8:	01012903          	lw	s2,16(sp)
80406dfc:	00c12983          	lw	s3,12(sp)
80406e00:	00812a03          	lw	s4,8(sp)
80406e04:	00412a83          	lw	s5,4(sp)
80406e08:	02010113          	addi	sp,sp,32
80406e0c:	00008067          	ret
80406e10:	000a8513          	mv	a0,s5
80406e14:	ae4fe0ef          	jal	ra,804050f8 <up>
80406e18:	00098513          	mv	a0,s3
80406e1c:	00040593          	mv	a1,s0
80406e20:	0204a423          	sw	zero,40(s1)
80406e24:	a04ff0ef          	jal	ra,80406028 <file_getdirentry>
80406e28:	00050993          	mv	s3,a0
80406e2c:	fa051ae3          	bnez	a0,80406de0 <sysfile_getdirentry+0x94>
80406e30:	000a8513          	mv	a0,s5
80406e34:	ac8fe0ef          	jal	ra,804050fc <down>
80406e38:	00092783          	lw	a5,0(s2)
80406e3c:	00078663          	beqz	a5,80406e48 <sysfile_getdirentry+0xfc>
80406e40:	0047a783          	lw	a5,4(a5)
80406e44:	02f4a423          	sw	a5,40(s1)
80406e48:	10400693          	li	a3,260
80406e4c:	00040613          	mv	a2,s0
80406e50:	000a0593          	mv	a1,s4
80406e54:	00048513          	mv	a0,s1
80406e58:	f59fd0ef          	jal	ra,80404db0 <copy_to_user>
80406e5c:	00051463          	bnez	a0,80406e64 <sysfile_getdirentry+0x118>
80406e60:	ffd00993          	li	s3,-3
80406e64:	000a8513          	mv	a0,s5
80406e68:	a90fe0ef          	jal	ra,804050f8 <up>
80406e6c:	0204a423          	sw	zero,40(s1)
80406e70:	f71ff06f          	j	80406de0 <sysfile_getdirentry+0x94>
80406e74:	00050593          	mv	a1,a0
80406e78:	00100713          	li	a4,1
80406e7c:	00400693          	li	a3,4
80406e80:	000a0613          	mv	a2,s4
80406e84:	00000513          	li	a0,0
80406e88:	ec9fd0ef          	jal	ra,80404d50 <copy_from_user>
80406e8c:	02050663          	beqz	a0,80406eb8 <sysfile_getdirentry+0x16c>
80406e90:	00098513          	mv	a0,s3
80406e94:	00040593          	mv	a1,s0
80406e98:	990ff0ef          	jal	ra,80406028 <file_getdirentry>
80406e9c:	00050993          	mv	s3,a0
80406ea0:	f40510e3          	bnez	a0,80406de0 <sysfile_getdirentry+0x94>
80406ea4:	10400693          	li	a3,260
80406ea8:	00040613          	mv	a2,s0
80406eac:	000a0593          	mv	a1,s4
80406eb0:	f01fd0ef          	jal	ra,80404db0 <copy_to_user>
80406eb4:	f20516e3          	bnez	a0,80406de0 <sysfile_getdirentry+0x94>
80406eb8:	ffd00993          	li	s3,-3
80406ebc:	f25ff06f          	j	80406de0 <sysfile_getdirentry+0x94>
80406ec0:	ffc00993          	li	s3,-4
80406ec4:	f25ff06f          	j	80406de8 <sysfile_getdirentry+0x9c>

80406ec8 <sysfile_dup>:
80406ec8:	abcff06f          	j	80406184 <file_dup>

80406ecc <kernel_thread_entry>:
80406ecc:	00048513          	mv	a0,s1
80406ed0:	000400e7          	jalr	s0
80406ed4:	2c9000ef          	jal	ra,8040799c <do_exit>

80406ed8 <alloc_proc>:
80406ed8:	ff010113          	addi	sp,sp,-16
80406edc:	0e000513          	li	a0,224
80406ee0:	00812423          	sw	s0,8(sp)
80406ee4:	00112623          	sw	ra,12(sp)
80406ee8:	ad9fb0ef          	jal	ra,804029c0 <kmalloc>
80406eec:	00050413          	mv	s0,a0
80406ef0:	08050c63          	beqz	a0,80406f88 <alloc_proc+0xb0>
80406ef4:	fff00793          	li	a5,-1
80406ef8:	00f52223          	sw	a5,4(a0)
80406efc:	03800613          	li	a2,56
80406f00:	00000593          	li	a1,0
80406f04:	00052023          	sw	zero,0(a0)
80406f08:	00052423          	sw	zero,8(a0)
80406f0c:	00052623          	sw	zero,12(a0)
80406f10:	00052823          	sw	zero,16(a0)
80406f14:	00052a23          	sw	zero,20(a0)
80406f18:	00052c23          	sw	zero,24(a0)
80406f1c:	01c50513          	addi	a0,a0,28
80406f20:	0990b0ef          	jal	ra,804127b8 <memset>
80406f24:	00096797          	auipc	a5,0x96
80406f28:	8e078793          	addi	a5,a5,-1824 # 8049c804 <boot_cr3>
80406f2c:	0007a783          	lw	a5,0(a5)
80406f30:	04042a23          	sw	zero,84(s0)
80406f34:	04042e23          	sw	zero,92(s0)
80406f38:	04f42c23          	sw	a5,88(s0)
80406f3c:	03200613          	li	a2,50
80406f40:	00000593          	li	a1,0
80406f44:	06040513          	addi	a0,s0,96
80406f48:	0710b0ef          	jal	ra,804127b8 <memset>
80406f4c:	0bc40793          	addi	a5,s0,188
80406f50:	0a042423          	sw	zero,168(s0)
80406f54:	0a042823          	sw	zero,176(s0)
80406f58:	0a042a23          	sw	zero,180(s0)
80406f5c:	0a042623          	sw	zero,172(s0)
80406f60:	0a042c23          	sw	zero,184(s0)
80406f64:	0cf42023          	sw	a5,192(s0)
80406f68:	0af42e23          	sw	a5,188(s0)
80406f6c:	0c042223          	sw	zero,196(s0)
80406f70:	0c042423          	sw	zero,200(s0)
80406f74:	0c042823          	sw	zero,208(s0)
80406f78:	0c042623          	sw	zero,204(s0)
80406f7c:	0c042a23          	sw	zero,212(s0)
80406f80:	0c042c23          	sw	zero,216(s0)
80406f84:	0c042e23          	sw	zero,220(s0)
80406f88:	00040513          	mv	a0,s0
80406f8c:	00c12083          	lw	ra,12(sp)
80406f90:	00812403          	lw	s0,8(sp)
80406f94:	01010113          	addi	sp,sp,16
80406f98:	00008067          	ret

80406f9c <put_files>:
80406f9c:	0dc52503          	lw	a0,220(a0)
80406fa0:	00050a63          	beqz	a0,80406fb4 <put_files+0x18>
80406fa4:	00852783          	lw	a5,8(a0)
80406fa8:	fff78793          	addi	a5,a5,-1
80406fac:	00f52423          	sw	a5,8(a0)
80406fb0:	00078463          	beqz	a5,80406fb8 <put_files+0x1c>
80406fb4:	00008067          	ret
80406fb8:	b10ff06f          	j	804062c8 <files_destroy>

80406fbc <forkret>:
80406fbc:	00095797          	auipc	a5,0x95
80406fc0:	7f078793          	addi	a5,a5,2032 # 8049c7ac <current>
80406fc4:	0007a783          	lw	a5,0(a5)
80406fc8:	0547a503          	lw	a0,84(a5)
80406fcc:	82dfa06f          	j	804017f8 <forkrets>

80406fd0 <load_icode_read>:
80406fd0:	fe010113          	addi	sp,sp,-32
80406fd4:	00912a23          	sw	s1,20(sp)
80406fd8:	01312623          	sw	s3,12(sp)
80406fdc:	00060493          	mv	s1,a2
80406fe0:	00058993          	mv	s3,a1
80406fe4:	00000613          	li	a2,0
80406fe8:	00068593          	mv	a1,a3
80406fec:	00812c23          	sw	s0,24(sp)
80406ff0:	01212823          	sw	s2,16(sp)
80406ff4:	00112e23          	sw	ra,28(sp)
80406ff8:	00050913          	mv	s2,a0
80406ffc:	b55ff0ef          	jal	ra,80406b50 <sysfile_seek>
80407000:	00050413          	mv	s0,a0
80407004:	02050263          	beqz	a0,80407028 <load_icode_read+0x58>
80407008:	00040513          	mv	a0,s0
8040700c:	01c12083          	lw	ra,28(sp)
80407010:	01812403          	lw	s0,24(sp)
80407014:	01412483          	lw	s1,20(sp)
80407018:	01012903          	lw	s2,16(sp)
8040701c:	00c12983          	lw	s3,12(sp)
80407020:	02010113          	addi	sp,sp,32
80407024:	00008067          	ret
80407028:	00048613          	mv	a2,s1
8040702c:	00098593          	mv	a1,s3
80407030:	00090513          	mv	a0,s2
80407034:	f90ff0ef          	jal	ra,804067c4 <sysfile_read>
80407038:	fca488e3          	beq	s1,a0,80407008 <load_icode_read+0x38>
8040703c:	00050413          	mv	s0,a0
80407040:	fc0544e3          	bltz	a0,80407008 <load_icode_read+0x38>
80407044:	fff00413          	li	s0,-1
80407048:	00040513          	mv	a0,s0
8040704c:	01c12083          	lw	ra,28(sp)
80407050:	01812403          	lw	s0,24(sp)
80407054:	01412483          	lw	s1,20(sp)
80407058:	01012903          	lw	s2,16(sp)
8040705c:	00c12983          	lw	s3,12(sp)
80407060:	02010113          	addi	sp,sp,32
80407064:	00008067          	ret

80407068 <user_main>:
80407068:	00095797          	auipc	a5,0x95
8040706c:	74478793          	addi	a5,a5,1860 # 8049c7ac <current>
80407070:	0007a783          	lw	a5,0(a5)
80407074:	fe010113          	addi	sp,sp,-32
80407078:	00812c23          	sw	s0,24(sp)
8040707c:	0047a583          	lw	a1,4(a5)
80407080:	0000e417          	auipc	s0,0xe
80407084:	83840413          	addi	s0,s0,-1992 # 804148b8 <CSWTCH.69+0x8b0>
80407088:	00040613          	mv	a2,s0
8040708c:	0000e517          	auipc	a0,0xe
80407090:	83050513          	addi	a0,a0,-2000 # 804148bc <CSWTCH.69+0x8b4>
80407094:	00112e23          	sw	ra,28(sp)
80407098:	00812423          	sw	s0,8(sp)
8040709c:	00012623          	sw	zero,12(sp)
804070a0:	95cf90ef          	jal	ra,804001fc <cprintf>
804070a4:	00812783          	lw	a5,8(sp)
804070a8:	06078663          	beqz	a5,80407114 <user_main+0xac>
804070ac:	00c10713          	addi	a4,sp,12
804070b0:	00000793          	li	a5,0
804070b4:	00470713          	addi	a4,a4,4
804070b8:	ffc72683          	lw	a3,-4(a4)
804070bc:	00178793          	addi	a5,a5,1
804070c0:	fe069ae3          	bnez	a3,804070b4 <user_main+0x4c>
804070c4:	10002773          	csrr	a4,sstatus
804070c8:	10076713          	ori	a4,a4,256
804070cc:	10071073          	csrw	sstatus,a4
804070d0:	1424d073          	csrwi	scause,9
804070d4:	00810713          	addi	a4,sp,8
804070d8:	00000517          	auipc	a0,0x0
804070dc:	01c50513          	addi	a0,a0,28 # 804070f4 <user_main+0x8c>
804070e0:	14151073          	csrw	sepc,a0
804070e4:	00400513          	li	a0,4
804070e8:	00040593          	mv	a1,s0
804070ec:	00078613          	mv	a2,a5
804070f0:	00070693          	mv	a3,a4
804070f4:	da0fa06f          	j	80401694 <__alltraps>
804070f8:	00050413          	mv	s0,a0
804070fc:	0000d617          	auipc	a2,0xd
80407100:	7e860613          	addi	a2,a2,2024 # 804148e4 <CSWTCH.69+0x8dc>
80407104:	41600593          	li	a1,1046
80407108:	0000d517          	auipc	a0,0xd
8040710c:	7f850513          	addi	a0,a0,2040 # 80414900 <CSWTCH.69+0x8f8>
80407110:	d14f90ef          	jal	ra,80400624 <__panic>
80407114:	00000793          	li	a5,0
80407118:	fadff06f          	j	804070c4 <user_main+0x5c>

8040711c <setup_pgdir.isra.4>:
8040711c:	fe010113          	addi	sp,sp,-32
80407120:	01212823          	sw	s2,16(sp)
80407124:	00050913          	mv	s2,a0
80407128:	00100513          	li	a0,1
8040712c:	00112e23          	sw	ra,28(sp)
80407130:	00812c23          	sw	s0,24(sp)
80407134:	00912a23          	sw	s1,20(sp)
80407138:	01312623          	sw	s3,12(sp)
8040713c:	01412423          	sw	s4,8(sp)
80407140:	c01fb0ef          	jal	ra,80402d40 <alloc_pages>
80407144:	0c050263          	beqz	a0,80407208 <setup_pgdir.isra.4+0xec>
80407148:	00095a17          	auipc	s4,0x95
8040714c:	6c0a0a13          	addi	s4,s4,1728 # 8049c808 <pages>
80407150:	000a2683          	lw	a3,0(s4)
80407154:	0000f797          	auipc	a5,0xf
80407158:	02c78793          	addi	a5,a5,44 # 80416180 <nbase>
8040715c:	0007a983          	lw	s3,0(a5)
80407160:	40d506b3          	sub	a3,a0,a3
80407164:	00095797          	auipc	a5,0x95
80407168:	63478793          	addi	a5,a5,1588 # 8049c798 <npage>
8040716c:	4056d693          	srai	a3,a3,0x5
80407170:	013686b3          	add	a3,a3,s3
80407174:	0007a703          	lw	a4,0(a5)
80407178:	00c69793          	slli	a5,a3,0xc
8040717c:	00c7d793          	srli	a5,a5,0xc
80407180:	00050413          	mv	s0,a0
80407184:	00c69693          	slli	a3,a3,0xc
80407188:	08e7f463          	bgeu	a5,a4,80407210 <setup_pgdir.isra.4+0xf4>
8040718c:	00095797          	auipc	a5,0x95
80407190:	67478793          	addi	a5,a5,1652 # 8049c800 <va_pa_offset>
80407194:	0007a483          	lw	s1,0(a5)
80407198:	00095797          	auipc	a5,0x95
8040719c:	5fc78793          	addi	a5,a5,1532 # 8049c794 <boot_pgdir>
804071a0:	0007a583          	lw	a1,0(a5)
804071a4:	009684b3          	add	s1,a3,s1
804071a8:	00001637          	lui	a2,0x1
804071ac:	00048513          	mv	a0,s1
804071b0:	6780b0ef          	jal	ra,80412828 <memcpy>
804071b4:	000a2703          	lw	a4,0(s4)
804071b8:	000017b7          	lui	a5,0x1
804071bc:	00f487b3          	add	a5,s1,a5
804071c0:	40e40433          	sub	s0,s0,a4
804071c4:	40545413          	srai	s0,s0,0x5
804071c8:	01340433          	add	s0,s0,s3
804071cc:	00a41413          	slli	s0,s0,0xa
804071d0:	00146713          	ori	a4,s0,1
804071d4:	00746413          	ori	s0,s0,7
804071d8:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x7054>
804071dc:	fa87a823          	sw	s0,-80(a5)
804071e0:	00992023          	sw	s1,0(s2)
804071e4:	00000513          	li	a0,0
804071e8:	01c12083          	lw	ra,28(sp)
804071ec:	01812403          	lw	s0,24(sp)
804071f0:	01412483          	lw	s1,20(sp)
804071f4:	01012903          	lw	s2,16(sp)
804071f8:	00c12983          	lw	s3,12(sp)
804071fc:	00812a03          	lw	s4,8(sp)
80407200:	02010113          	addi	sp,sp,32
80407204:	00008067          	ret
80407208:	ffc00513          	li	a0,-4
8040720c:	fddff06f          	j	804071e8 <setup_pgdir.isra.4+0xcc>
80407210:	0000c617          	auipc	a2,0xc
80407214:	54460613          	addi	a2,a2,1348 # 80413754 <default_pmm_manager+0x30>
80407218:	06e00593          	li	a1,110
8040721c:	0000c517          	auipc	a0,0xc
80407220:	55c50513          	addi	a0,a0,1372 # 80413778 <default_pmm_manager+0x54>
80407224:	c00f90ef          	jal	ra,80400624 <__panic>

80407228 <set_proc_name>:
80407228:	ff010113          	addi	sp,sp,-16
8040722c:	00812423          	sw	s0,8(sp)
80407230:	06050413          	addi	s0,a0,96
80407234:	00912223          	sw	s1,4(sp)
80407238:	03300613          	li	a2,51
8040723c:	00058493          	mv	s1,a1
80407240:	00040513          	mv	a0,s0
80407244:	00000593          	li	a1,0
80407248:	00112623          	sw	ra,12(sp)
8040724c:	56c0b0ef          	jal	ra,804127b8 <memset>
80407250:	00040513          	mv	a0,s0
80407254:	00812403          	lw	s0,8(sp)
80407258:	00c12083          	lw	ra,12(sp)
8040725c:	00048593          	mv	a1,s1
80407260:	00412483          	lw	s1,4(sp)
80407264:	03200613          	li	a2,50
80407268:	01010113          	addi	sp,sp,16
8040726c:	5bc0b06f          	j	80412828 <memcpy>

80407270 <proc_run>:
80407270:	ff010113          	addi	sp,sp,-16
80407274:	00095797          	auipc	a5,0x95
80407278:	53878793          	addi	a5,a5,1336 # 8049c7ac <current>
8040727c:	00912223          	sw	s1,4(sp)
80407280:	0007a483          	lw	s1,0(a5)
80407284:	00112623          	sw	ra,12(sp)
80407288:	00812423          	sw	s0,8(sp)
8040728c:	01212023          	sw	s2,0(sp)
80407290:	04a48463          	beq	s1,a0,804072d8 <proc_run+0x68>
80407294:	00050413          	mv	s0,a0
80407298:	100027f3          	csrr	a5,sstatus
8040729c:	0027f793          	andi	a5,a5,2
804072a0:	00000913          	li	s2,0
804072a4:	06079263          	bnez	a5,80407308 <proc_run+0x98>
804072a8:	05842783          	lw	a5,88(s0)
804072ac:	00095717          	auipc	a4,0x95
804072b0:	50872023          	sw	s0,1280(a4) # 8049c7ac <current>
804072b4:	80000737          	lui	a4,0x80000
804072b8:	00c7d793          	srli	a5,a5,0xc
804072bc:	00e7e7b3          	or	a5,a5,a4
804072c0:	18079073          	csrw	satp,a5
804072c4:	12000073          	sfence.vma
804072c8:	01c40593          	addi	a1,s0,28
804072cc:	01c48513          	addi	a0,s1,28
804072d0:	349010ef          	jal	ra,80408e18 <switch_to>
804072d4:	00091e63          	bnez	s2,804072f0 <proc_run+0x80>
804072d8:	00c12083          	lw	ra,12(sp)
804072dc:	00812403          	lw	s0,8(sp)
804072e0:	00412483          	lw	s1,4(sp)
804072e4:	00012903          	lw	s2,0(sp)
804072e8:	01010113          	addi	sp,sp,16
804072ec:	00008067          	ret
804072f0:	00812403          	lw	s0,8(sp)
804072f4:	00c12083          	lw	ra,12(sp)
804072f8:	00412483          	lw	s1,4(sp)
804072fc:	00012903          	lw	s2,0(sp)
80407300:	01010113          	addi	sp,sp,16
80407304:	911f906f          	j	80400c14 <intr_enable>
80407308:	915f90ef          	jal	ra,80400c1c <intr_disable>
8040730c:	00100913          	li	s2,1
80407310:	f99ff06f          	j	804072a8 <proc_run+0x38>

80407314 <find_proc>:
80407314:	000027b7          	lui	a5,0x2
80407318:	fff50713          	addi	a4,a0,-1
8040731c:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
80407320:	04e7ec63          	bltu	a5,a4,80407378 <find_proc+0x64>
80407324:	ff010113          	addi	sp,sp,-16
80407328:	00a00593          	li	a1,10
8040732c:	00812423          	sw	s0,8(sp)
80407330:	00112623          	sw	ra,12(sp)
80407334:	00050413          	mv	s0,a0
80407338:	4410a0ef          	jal	ra,80411f78 <hash32>
8040733c:	00092797          	auipc	a5,0x92
80407340:	40c78793          	addi	a5,a5,1036 # 80499748 <hash_list>
80407344:	00351513          	slli	a0,a0,0x3
80407348:	00f50533          	add	a0,a0,a5
8040734c:	00050793          	mv	a5,a0
80407350:	00c0006f          	j	8040735c <find_proc+0x48>
80407354:	f687a703          	lw	a4,-152(a5)
80407358:	02870463          	beq	a4,s0,80407380 <find_proc+0x6c>
8040735c:	0047a783          	lw	a5,4(a5)
80407360:	fef51ae3          	bne	a0,a5,80407354 <find_proc+0x40>
80407364:	00c12083          	lw	ra,12(sp)
80407368:	00812403          	lw	s0,8(sp)
8040736c:	00000513          	li	a0,0
80407370:	01010113          	addi	sp,sp,16
80407374:	00008067          	ret
80407378:	00000513          	li	a0,0
8040737c:	00008067          	ret
80407380:	00c12083          	lw	ra,12(sp)
80407384:	00812403          	lw	s0,8(sp)
80407388:	f6478513          	addi	a0,a5,-156
8040738c:	01010113          	addi	sp,sp,16
80407390:	00008067          	ret

80407394 <do_fork>:
80407394:	fc010113          	addi	sp,sp,-64
80407398:	03612023          	sw	s6,32(sp)
8040739c:	00095b17          	auipc	s6,0x95
804073a0:	41cb0b13          	addi	s6,s6,1052 # 8049c7b8 <nr_process>
804073a4:	000b2783          	lw	a5,0(s6)
804073a8:	03212823          	sw	s2,48(sp)
804073ac:	02112e23          	sw	ra,60(sp)
804073b0:	02812c23          	sw	s0,56(sp)
804073b4:	02912a23          	sw	s1,52(sp)
804073b8:	03312623          	sw	s3,44(sp)
804073bc:	03412423          	sw	s4,40(sp)
804073c0:	03512223          	sw	s5,36(sp)
804073c4:	01712e23          	sw	s7,28(sp)
804073c8:	01812c23          	sw	s8,24(sp)
804073cc:	01912a23          	sw	s9,20(sp)
804073d0:	01a12823          	sw	s10,16(sp)
804073d4:	01b12623          	sw	s11,12(sp)
804073d8:	00001937          	lui	s2,0x1
804073dc:	4927de63          	bge	a5,s2,80407878 <do_fork+0x4e4>
804073e0:	00050993          	mv	s3,a0
804073e4:	00058a93          	mv	s5,a1
804073e8:	00060493          	mv	s1,a2
804073ec:	aedff0ef          	jal	ra,80406ed8 <alloc_proc>
804073f0:	00050413          	mv	s0,a0
804073f4:	3c050263          	beqz	a0,804077b8 <do_fork+0x424>
804073f8:	00095a17          	auipc	s4,0x95
804073fc:	3b4a0a13          	addi	s4,s4,948 # 8049c7ac <current>
80407400:	000a2783          	lw	a5,0(s4)
80407404:	0a87a703          	lw	a4,168(a5)
80407408:	00f52a23          	sw	a5,20(a0)
8040740c:	46071a63          	bnez	a4,80407880 <do_fork+0x4ec>
80407410:	00200513          	li	a0,2
80407414:	92dfb0ef          	jal	ra,80402d40 <alloc_pages>
80407418:	38050c63          	beqz	a0,804077b0 <do_fork+0x41c>
8040741c:	00095c17          	auipc	s8,0x95
80407420:	3ecc0c13          	addi	s8,s8,1004 # 8049c808 <pages>
80407424:	000c2683          	lw	a3,0(s8)
80407428:	0000f797          	auipc	a5,0xf
8040742c:	d5878793          	addi	a5,a5,-680 # 80416180 <nbase>
80407430:	0007ab83          	lw	s7,0(a5)
80407434:	40d506b3          	sub	a3,a0,a3
80407438:	4056d693          	srai	a3,a3,0x5
8040743c:	00095c97          	auipc	s9,0x95
80407440:	35cc8c93          	addi	s9,s9,860 # 8049c798 <npage>
80407444:	017686b3          	add	a3,a3,s7
80407448:	000ca703          	lw	a4,0(s9)
8040744c:	00c69793          	slli	a5,a3,0xc
80407450:	00c7d793          	srli	a5,a5,0xc
80407454:	00c69693          	slli	a3,a3,0xc
80407458:	46e7f463          	bgeu	a5,a4,804078c0 <do_fork+0x52c>
8040745c:	00095d17          	auipc	s10,0x95
80407460:	3a4d0d13          	addi	s10,s10,932 # 8049c800 <va_pa_offset>
80407464:	000a2703          	lw	a4,0(s4)
80407468:	000d2783          	lw	a5,0(s10)
8040746c:	0dc72d83          	lw	s11,220(a4) # 800000dc <end+0xffb63820>
80407470:	00d786b3          	add	a3,a5,a3
80407474:	00d42623          	sw	a3,12(s0)
80407478:	420d8463          	beqz	s11,804078a0 <do_fork+0x50c>
8040747c:	80090913          	addi	s2,s2,-2048 # 800 <_binary_bin_swap_img_size-0x7800>
80407480:	0129f933          	and	s2,s3,s2
80407484:	2a090463          	beqz	s2,8040772c <do_fork+0x398>
80407488:	008da783          	lw	a5,8(s11)
8040748c:	01872903          	lw	s2,24(a4)
80407490:	00178793          	addi	a5,a5,1
80407494:	00fda423          	sw	a5,8(s11)
80407498:	0db42e23          	sw	s11,220(s0)
8040749c:	02090a63          	beqz	s2,804074d0 <do_fork+0x13c>
804074a0:	1009f993          	andi	s3,s3,256
804074a4:	2a098663          	beqz	s3,80407750 <do_fork+0x3bc>
804074a8:	01892783          	lw	a5,24(s2)
804074ac:	00c92683          	lw	a3,12(s2)
804074b0:	80400737          	lui	a4,0x80400
804074b4:	00178793          	addi	a5,a5,1
804074b8:	00f92c23          	sw	a5,24(s2)
804074bc:	01242c23          	sw	s2,24(s0)
804074c0:	40e6ec63          	bltu	a3,a4,804078d8 <do_fork+0x544>
804074c4:	000d2783          	lw	a5,0(s10)
804074c8:	40f686b3          	sub	a3,a3,a5
804074cc:	04d42c23          	sw	a3,88(s0)
804074d0:	00c42783          	lw	a5,12(s0)
804074d4:	00002737          	lui	a4,0x2
804074d8:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_bin_swap_img_size-0x6090>
804074dc:	00e787b3          	add	a5,a5,a4
804074e0:	04f42a23          	sw	a5,84(s0)
804074e4:	00078713          	mv	a4,a5
804074e8:	09048813          	addi	a6,s1,144
804074ec:	0004a503          	lw	a0,0(s1)
804074f0:	0044a583          	lw	a1,4(s1)
804074f4:	0084a603          	lw	a2,8(s1)
804074f8:	00c4a683          	lw	a3,12(s1)
804074fc:	00a72023          	sw	a0,0(a4)
80407500:	00b72223          	sw	a1,4(a4)
80407504:	00c72423          	sw	a2,8(a4)
80407508:	00d72623          	sw	a3,12(a4)
8040750c:	01048493          	addi	s1,s1,16
80407510:	01070713          	addi	a4,a4,16
80407514:	fd049ce3          	bne	s1,a6,804074ec <do_fork+0x158>
80407518:	0207a423          	sw	zero,40(a5)
8040751c:	1a0a8663          	beqz	s5,804076c8 <do_fork+0x334>
80407520:	0157a423          	sw	s5,8(a5)
80407524:	00000717          	auipc	a4,0x0
80407528:	a9870713          	addi	a4,a4,-1384 # 80406fbc <forkret>
8040752c:	00e42e23          	sw	a4,28(s0)
80407530:	02f42023          	sw	a5,32(s0)
80407534:	100027f3          	csrr	a5,sstatus
80407538:	0027f793          	andi	a5,a5,2
8040753c:	00000913          	li	s2,0
80407540:	1a079863          	bnez	a5,804076f0 <do_fork+0x35c>
80407544:	00092797          	auipc	a5,0x92
80407548:	b0078793          	addi	a5,a5,-1280 # 80499044 <last_pid>
8040754c:	0007a503          	lw	a0,0(a5)
80407550:	000027b7          	lui	a5,0x2
80407554:	00150513          	addi	a0,a0,1
80407558:	00092717          	auipc	a4,0x92
8040755c:	aea72623          	sw	a0,-1300(a4) # 80499044 <last_pid>
80407560:	1af55c63          	bge	a0,a5,80407718 <do_fork+0x384>
80407564:	00092797          	auipc	a5,0x92
80407568:	ae478793          	addi	a5,a5,-1308 # 80499048 <next_safe>
8040756c:	0007a783          	lw	a5,0(a5)
80407570:	00095497          	auipc	s1,0x95
80407574:	34448493          	addi	s1,s1,836 # 8049c8b4 <proc_list>
80407578:	06f54c63          	blt	a0,a5,804075f0 <do_fork+0x25c>
8040757c:	000027b7          	lui	a5,0x2
80407580:	00092717          	auipc	a4,0x92
80407584:	acf72423          	sw	a5,-1336(a4) # 80499048 <next_safe>
80407588:	00000593          	li	a1,0
8040758c:	00050793          	mv	a5,a0
80407590:	00095497          	auipc	s1,0x95
80407594:	32448493          	addi	s1,s1,804 # 8049c8b4 <proc_list>
80407598:	000028b7          	lui	a7,0x2
8040759c:	00058813          	mv	a6,a1
804075a0:	00002637          	lui	a2,0x2
804075a4:	00095697          	auipc	a3,0x95
804075a8:	31068693          	addi	a3,a3,784 # 8049c8b4 <proc_list>
804075ac:	0046a683          	lw	a3,4(a3)
804075b0:	02968263          	beq	a3,s1,804075d4 <do_fork+0x240>
804075b4:	f706a703          	lw	a4,-144(a3)
804075b8:	10f70063          	beq	a4,a5,804076b8 <do_fork+0x324>
804075bc:	fee7d8e3          	bge	a5,a4,804075ac <do_fork+0x218>
804075c0:	fec756e3          	bge	a4,a2,804075ac <do_fork+0x218>
804075c4:	0046a683          	lw	a3,4(a3)
804075c8:	00070613          	mv	a2,a4
804075cc:	00100813          	li	a6,1
804075d0:	fe9692e3          	bne	a3,s1,804075b4 <do_fork+0x220>
804075d4:	00058863          	beqz	a1,804075e4 <do_fork+0x250>
804075d8:	00092717          	auipc	a4,0x92
804075dc:	a6f72623          	sw	a5,-1428(a4) # 80499044 <last_pid>
804075e0:	00078513          	mv	a0,a5
804075e4:	00080663          	beqz	a6,804075f0 <do_fork+0x25c>
804075e8:	00092797          	auipc	a5,0x92
804075ec:	a6c7a023          	sw	a2,-1440(a5) # 80499048 <next_safe>
804075f0:	00a00593          	li	a1,10
804075f4:	00a42223          	sw	a0,4(s0)
804075f8:	1810a0ef          	jal	ra,80411f78 <hash32>
804075fc:	00092797          	auipc	a5,0x92
80407600:	14c78793          	addi	a5,a5,332 # 80499748 <hash_list>
80407604:	00351513          	slli	a0,a0,0x3
80407608:	00f50533          	add	a0,a0,a5
8040760c:	00452583          	lw	a1,4(a0)
80407610:	01442683          	lw	a3,20(s0)
80407614:	09c40793          	addi	a5,s0,156
80407618:	00f5a023          	sw	a5,0(a1)
8040761c:	0044a603          	lw	a2,4(s1)
80407620:	00f52223          	sw	a5,4(a0)
80407624:	0ac6a703          	lw	a4,172(a3)
80407628:	09440793          	addi	a5,s0,148
8040762c:	0ab42023          	sw	a1,160(s0)
80407630:	08a42e23          	sw	a0,156(s0)
80407634:	00f62023          	sw	a5,0(a2) # 2000 <_binary_bin_swap_img_size-0x6000>
80407638:	00095597          	auipc	a1,0x95
8040763c:	28f5a023          	sw	a5,640(a1) # 8049c8b8 <proc_list+0x4>
80407640:	08c42c23          	sw	a2,152(s0)
80407644:	08942a23          	sw	s1,148(s0)
80407648:	0a042823          	sw	zero,176(s0)
8040764c:	0ae42a23          	sw	a4,180(s0)
80407650:	00070463          	beqz	a4,80407658 <do_fork+0x2c4>
80407654:	0a872823          	sw	s0,176(a4)
80407658:	000b2783          	lw	a5,0(s6)
8040765c:	0a86a623          	sw	s0,172(a3)
80407660:	00178793          	addi	a5,a5,1
80407664:	00095717          	auipc	a4,0x95
80407668:	14f72a23          	sw	a5,340(a4) # 8049c7b8 <nr_process>
8040766c:	14091a63          	bnez	s2,804077c0 <do_fork+0x42c>
80407670:	00040513          	mv	a0,s0
80407674:	308050ef          	jal	ra,8040c97c <wakeup_proc>
80407678:	00442503          	lw	a0,4(s0)
8040767c:	03c12083          	lw	ra,60(sp)
80407680:	03812403          	lw	s0,56(sp)
80407684:	03412483          	lw	s1,52(sp)
80407688:	03012903          	lw	s2,48(sp)
8040768c:	02c12983          	lw	s3,44(sp)
80407690:	02812a03          	lw	s4,40(sp)
80407694:	02412a83          	lw	s5,36(sp)
80407698:	02012b03          	lw	s6,32(sp)
8040769c:	01c12b83          	lw	s7,28(sp)
804076a0:	01812c03          	lw	s8,24(sp)
804076a4:	01412c83          	lw	s9,20(sp)
804076a8:	01012d03          	lw	s10,16(sp)
804076ac:	00c12d83          	lw	s11,12(sp)
804076b0:	04010113          	addi	sp,sp,64
804076b4:	00008067          	ret
804076b8:	00178793          	addi	a5,a5,1
804076bc:	14c7da63          	bge	a5,a2,80407810 <do_fork+0x47c>
804076c0:	00100593          	li	a1,1
804076c4:	ee9ff06f          	j	804075ac <do_fork+0x218>
804076c8:	00078a93          	mv	s5,a5
804076cc:	0157a423          	sw	s5,8(a5)
804076d0:	00000717          	auipc	a4,0x0
804076d4:	8ec70713          	addi	a4,a4,-1812 # 80406fbc <forkret>
804076d8:	00e42e23          	sw	a4,28(s0)
804076dc:	02f42023          	sw	a5,32(s0)
804076e0:	100027f3          	csrr	a5,sstatus
804076e4:	0027f793          	andi	a5,a5,2
804076e8:	00000913          	li	s2,0
804076ec:	e4078ce3          	beqz	a5,80407544 <do_fork+0x1b0>
804076f0:	d2cf90ef          	jal	ra,80400c1c <intr_disable>
804076f4:	00092797          	auipc	a5,0x92
804076f8:	95078793          	addi	a5,a5,-1712 # 80499044 <last_pid>
804076fc:	0007a503          	lw	a0,0(a5)
80407700:	000027b7          	lui	a5,0x2
80407704:	00100913          	li	s2,1
80407708:	00150513          	addi	a0,a0,1
8040770c:	00092717          	auipc	a4,0x92
80407710:	92a72c23          	sw	a0,-1736(a4) # 80499044 <last_pid>
80407714:	e4f548e3          	blt	a0,a5,80407564 <do_fork+0x1d0>
80407718:	00100793          	li	a5,1
8040771c:	00092717          	auipc	a4,0x92
80407720:	92f72423          	sw	a5,-1752(a4) # 80499044 <last_pid>
80407724:	00100513          	li	a0,1
80407728:	e55ff06f          	j	8040757c <do_fork+0x1e8>
8040772c:	b49fe0ef          	jal	ra,80406274 <files_create>
80407730:	00050913          	mv	s2,a0
80407734:	04050263          	beqz	a0,80407778 <do_fork+0x3e4>
80407738:	000d8593          	mv	a1,s11
8040773c:	cedfe0ef          	jal	ra,80406428 <dup_files>
80407740:	0e051063          	bnez	a0,80407820 <do_fork+0x48c>
80407744:	000a2703          	lw	a4,0(s4)
80407748:	00090d93          	mv	s11,s2
8040774c:	d3dff06f          	j	80407488 <do_fork+0xf4>
80407750:	ed9fc0ef          	jal	ra,80404628 <mm_create>
80407754:	00050993          	mv	s3,a0
80407758:	00050c63          	beqz	a0,80407770 <do_fork+0x3dc>
8040775c:	00c50513          	addi	a0,a0,12
80407760:	9bdff0ef          	jal	ra,8040711c <setup_pgdir.isra.4>
80407764:	06050263          	beqz	a0,804077c8 <do_fork+0x434>
80407768:	00098513          	mv	a0,s3
8040776c:	880fd0ef          	jal	ra,804047ec <mm_destroy>
80407770:	00040513          	mv	a0,s0
80407774:	829ff0ef          	jal	ra,80406f9c <put_files>
80407778:	00c42683          	lw	a3,12(s0)
8040777c:	804007b7          	lui	a5,0x80400
80407780:	18f6e463          	bltu	a3,a5,80407908 <do_fork+0x574>
80407784:	000d2703          	lw	a4,0(s10)
80407788:	000ca783          	lw	a5,0(s9)
8040778c:	40e686b3          	sub	a3,a3,a4
80407790:	00c6d693          	srli	a3,a3,0xc
80407794:	14f6fe63          	bgeu	a3,a5,804078f0 <do_fork+0x55c>
80407798:	000c2503          	lw	a0,0(s8)
8040779c:	417686b3          	sub	a3,a3,s7
804077a0:	00569693          	slli	a3,a3,0x5
804077a4:	00200593          	li	a1,2
804077a8:	00d50533          	add	a0,a0,a3
804077ac:	e5cfb0ef          	jal	ra,80402e08 <free_pages>
804077b0:	00040513          	mv	a0,s0
804077b4:	b30fb0ef          	jal	ra,80402ae4 <kfree>
804077b8:	ffc00513          	li	a0,-4
804077bc:	ec1ff06f          	j	8040767c <do_fork+0x2e8>
804077c0:	c54f90ef          	jal	ra,80400c14 <intr_enable>
804077c4:	eadff06f          	j	80407670 <do_fork+0x2dc>
804077c8:	01c90d93          	addi	s11,s2,28
804077cc:	000d8513          	mv	a0,s11
804077d0:	92dfd0ef          	jal	ra,804050fc <down>
804077d4:	000a2783          	lw	a5,0(s4)
804077d8:	00078663          	beqz	a5,804077e4 <do_fork+0x450>
804077dc:	0047a783          	lw	a5,4(a5) # 80400004 <end+0xfff63748>
804077e0:	02f92423          	sw	a5,40(s2)
804077e4:	00090593          	mv	a1,s2
804077e8:	00098513          	mv	a0,s3
804077ec:	96cfd0ef          	jal	ra,80404958 <dup_mmap>
804077f0:	00050a13          	mv	s4,a0
804077f4:	000d8513          	mv	a0,s11
804077f8:	901fd0ef          	jal	ra,804050f8 <up>
804077fc:	02092423          	sw	zero,40(s2)
80407800:	020a1663          	bnez	s4,8040782c <do_fork+0x498>
80407804:	0000100f          	fence.i
80407808:	00098913          	mv	s2,s3
8040780c:	c9dff06f          	j	804074a8 <do_fork+0x114>
80407810:	0117c463          	blt	a5,a7,80407818 <do_fork+0x484>
80407814:	00100793          	li	a5,1
80407818:	00100593          	li	a1,1
8040781c:	d81ff06f          	j	8040759c <do_fork+0x208>
80407820:	00090513          	mv	a0,s2
80407824:	aa5fe0ef          	jal	ra,804062c8 <files_destroy>
80407828:	f51ff06f          	j	80407778 <do_fork+0x3e4>
8040782c:	00098513          	mv	a0,s3
80407830:	a08fd0ef          	jal	ra,80404a38 <exit_mmap>
80407834:	00c9a683          	lw	a3,12(s3)
80407838:	804007b7          	lui	a5,0x80400
8040783c:	0cf6e663          	bltu	a3,a5,80407908 <do_fork+0x574>
80407840:	000d2703          	lw	a4,0(s10)
80407844:	000ca783          	lw	a5,0(s9)
80407848:	40e686b3          	sub	a3,a3,a4
8040784c:	00c6d693          	srli	a3,a3,0xc
80407850:	0af6f063          	bgeu	a3,a5,804078f0 <do_fork+0x55c>
80407854:	000c2503          	lw	a0,0(s8)
80407858:	417686b3          	sub	a3,a3,s7
8040785c:	00569693          	slli	a3,a3,0x5
80407860:	00d50533          	add	a0,a0,a3
80407864:	00100593          	li	a1,1
80407868:	da0fb0ef          	jal	ra,80402e08 <free_pages>
8040786c:	00098513          	mv	a0,s3
80407870:	f7dfc0ef          	jal	ra,804047ec <mm_destroy>
80407874:	efdff06f          	j	80407770 <do_fork+0x3dc>
80407878:	ffb00513          	li	a0,-5
8040787c:	e01ff06f          	j	8040767c <do_fork+0x2e8>
80407880:	0000d697          	auipc	a3,0xd
80407884:	e0068693          	addi	a3,a3,-512 # 80414680 <CSWTCH.69+0x678>
80407888:	0000b617          	auipc	a2,0xb
8040788c:	36060613          	addi	a2,a2,864 # 80412be8 <commands+0x1bc>
80407890:	1f000593          	li	a1,496
80407894:	0000d517          	auipc	a0,0xd
80407898:	06c50513          	addi	a0,a0,108 # 80414900 <CSWTCH.69+0x8f8>
8040789c:	d89f80ef          	jal	ra,80400624 <__panic>
804078a0:	0000d697          	auipc	a3,0xd
804078a4:	dfc68693          	addi	a3,a3,-516 # 8041469c <CSWTCH.69+0x694>
804078a8:	0000b617          	auipc	a2,0xb
804078ac:	34060613          	addi	a2,a2,832 # 80412be8 <commands+0x1bc>
804078b0:	19600593          	li	a1,406
804078b4:	0000d517          	auipc	a0,0xd
804078b8:	04c50513          	addi	a0,a0,76 # 80414900 <CSWTCH.69+0x8f8>
804078bc:	d69f80ef          	jal	ra,80400624 <__panic>
804078c0:	0000c617          	auipc	a2,0xc
804078c4:	e9460613          	addi	a2,a2,-364 # 80413754 <default_pmm_manager+0x30>
804078c8:	06e00593          	li	a1,110
804078cc:	0000c517          	auipc	a0,0xc
804078d0:	eac50513          	addi	a0,a0,-340 # 80413778 <default_pmm_manager+0x54>
804078d4:	d51f80ef          	jal	ra,80400624 <__panic>
804078d8:	0000c617          	auipc	a2,0xc
804078dc:	eb060613          	addi	a2,a2,-336 # 80413788 <default_pmm_manager+0x64>
804078e0:	17700593          	li	a1,375
804078e4:	0000d517          	auipc	a0,0xd
804078e8:	01c50513          	addi	a0,a0,28 # 80414900 <CSWTCH.69+0x8f8>
804078ec:	d39f80ef          	jal	ra,80400624 <__panic>
804078f0:	0000c617          	auipc	a2,0xc
804078f4:	ebc60613          	addi	a2,a2,-324 # 804137ac <default_pmm_manager+0x88>
804078f8:	06900593          	li	a1,105
804078fc:	0000c517          	auipc	a0,0xc
80407900:	e7c50513          	addi	a0,a0,-388 # 80413778 <default_pmm_manager+0x54>
80407904:	d21f80ef          	jal	ra,80400624 <__panic>
80407908:	0000c617          	auipc	a2,0xc
8040790c:	e8060613          	addi	a2,a2,-384 # 80413788 <default_pmm_manager+0x64>
80407910:	07000593          	li	a1,112
80407914:	0000c517          	auipc	a0,0xc
80407918:	e6450513          	addi	a0,a0,-412 # 80413778 <default_pmm_manager+0x54>
8040791c:	d09f80ef          	jal	ra,80400624 <__panic>

80407920 <kernel_thread>:
80407920:	f6010113          	addi	sp,sp,-160
80407924:	08812c23          	sw	s0,152(sp)
80407928:	08912a23          	sw	s1,148(sp)
8040792c:	09212823          	sw	s2,144(sp)
80407930:	00058493          	mv	s1,a1
80407934:	00050913          	mv	s2,a0
80407938:	00060413          	mv	s0,a2
8040793c:	00000593          	li	a1,0
80407940:	09000613          	li	a2,144
80407944:	00010513          	mv	a0,sp
80407948:	08112e23          	sw	ra,156(sp)
8040794c:	66d0a0ef          	jal	ra,804127b8 <memset>
80407950:	03212023          	sw	s2,32(sp)
80407954:	02912223          	sw	s1,36(sp)
80407958:	100027f3          	csrr	a5,sstatus
8040795c:	edd7f793          	andi	a5,a5,-291
80407960:	1207e793          	ori	a5,a5,288
80407964:	08f12023          	sw	a5,128(sp)
80407968:	00010613          	mv	a2,sp
8040796c:	10046513          	ori	a0,s0,256
80407970:	fffff797          	auipc	a5,0xfffff
80407974:	55c78793          	addi	a5,a5,1372 # 80406ecc <kernel_thread_entry>
80407978:	00000593          	li	a1,0
8040797c:	08f12223          	sw	a5,132(sp)
80407980:	a15ff0ef          	jal	ra,80407394 <do_fork>
80407984:	09c12083          	lw	ra,156(sp)
80407988:	09812403          	lw	s0,152(sp)
8040798c:	09412483          	lw	s1,148(sp)
80407990:	09012903          	lw	s2,144(sp)
80407994:	0a010113          	addi	sp,sp,160
80407998:	00008067          	ret

8040799c <do_exit>:
8040799c:	fe010113          	addi	sp,sp,-32
804079a0:	00912a23          	sw	s1,20(sp)
804079a4:	00095717          	auipc	a4,0x95
804079a8:	e0c70713          	addi	a4,a4,-500 # 8049c7b0 <idleproc>
804079ac:	00095497          	auipc	s1,0x95
804079b0:	e0048493          	addi	s1,s1,-512 # 8049c7ac <current>
804079b4:	0004a783          	lw	a5,0(s1)
804079b8:	00072703          	lw	a4,0(a4)
804079bc:	00112e23          	sw	ra,28(sp)
804079c0:	00812c23          	sw	s0,24(sp)
804079c4:	01212823          	sw	s2,16(sp)
804079c8:	01312623          	sw	s3,12(sp)
804079cc:	01412423          	sw	s4,8(sp)
804079d0:	12e78263          	beq	a5,a4,80407af4 <do_exit+0x158>
804079d4:	00095417          	auipc	s0,0x95
804079d8:	de040413          	addi	s0,s0,-544 # 8049c7b4 <initproc>
804079dc:	00042703          	lw	a4,0(s0)
804079e0:	18e78e63          	beq	a5,a4,80407b7c <do_exit+0x1e0>
804079e4:	0187a903          	lw	s2,24(a5)
804079e8:	00050993          	mv	s3,a0
804079ec:	02090e63          	beqz	s2,80407a28 <do_exit+0x8c>
804079f0:	00095797          	auipc	a5,0x95
804079f4:	e1478793          	addi	a5,a5,-492 # 8049c804 <boot_cr3>
804079f8:	0007a783          	lw	a5,0(a5)
804079fc:	80000737          	lui	a4,0x80000
80407a00:	00c7d793          	srli	a5,a5,0xc
80407a04:	00e7e7b3          	or	a5,a5,a4
80407a08:	18079073          	csrw	satp,a5
80407a0c:	12000073          	sfence.vma
80407a10:	01892783          	lw	a5,24(s2)
80407a14:	fff78793          	addi	a5,a5,-1
80407a18:	00f92c23          	sw	a5,24(s2)
80407a1c:	0e078863          	beqz	a5,80407b0c <do_exit+0x170>
80407a20:	0004a783          	lw	a5,0(s1)
80407a24:	0007ac23          	sw	zero,24(a5)
80407a28:	0004a503          	lw	a0,0(s1)
80407a2c:	d70ff0ef          	jal	ra,80406f9c <put_files>
80407a30:	0004a783          	lw	a5,0(s1)
80407a34:	00300713          	li	a4,3
80407a38:	00e7a023          	sw	a4,0(a5)
80407a3c:	0b37a223          	sw	s3,164(a5)
80407a40:	100027f3          	csrr	a5,sstatus
80407a44:	0027f793          	andi	a5,a5,2
80407a48:	00000a13          	li	s4,0
80407a4c:	14079463          	bnez	a5,80407b94 <do_exit+0x1f8>
80407a50:	0004a703          	lw	a4,0(s1)
80407a54:	800007b7          	lui	a5,0x80000
80407a58:	00178793          	addi	a5,a5,1 # 80000001 <end+0xffb63745>
80407a5c:	01472503          	lw	a0,20(a4) # 80000014 <end+0xffb63758>
80407a60:	0a852703          	lw	a4,168(a0)
80407a64:	12f70e63          	beq	a4,a5,80407ba0 <do_exit+0x204>
80407a68:	0004a683          	lw	a3,0(s1)
80407a6c:	800009b7          	lui	s3,0x80000
80407a70:	00300913          	li	s2,3
80407a74:	00198993          	addi	s3,s3,1 # 80000001 <end+0xffb63745>
80407a78:	0ac6a783          	lw	a5,172(a3)
80407a7c:	04078463          	beqz	a5,80407ac4 <do_exit+0x128>
80407a80:	0b47a703          	lw	a4,180(a5)
80407a84:	00042503          	lw	a0,0(s0)
80407a88:	0ae6a623          	sw	a4,172(a3)
80407a8c:	0ac52703          	lw	a4,172(a0)
80407a90:	0a07a823          	sw	zero,176(a5)
80407a94:	0ae7aa23          	sw	a4,180(a5)
80407a98:	00070463          	beqz	a4,80407aa0 <do_exit+0x104>
80407a9c:	0af72823          	sw	a5,176(a4)
80407aa0:	0007a703          	lw	a4,0(a5)
80407aa4:	00a7aa23          	sw	a0,20(a5)
80407aa8:	0af52623          	sw	a5,172(a0)
80407aac:	fd2716e3          	bne	a4,s2,80407a78 <do_exit+0xdc>
80407ab0:	0a852783          	lw	a5,168(a0)
80407ab4:	fd3792e3          	bne	a5,s3,80407a78 <do_exit+0xdc>
80407ab8:	6c5040ef          	jal	ra,8040c97c <wakeup_proc>
80407abc:	0004a683          	lw	a3,0(s1)
80407ac0:	fb9ff06f          	j	80407a78 <do_exit+0xdc>
80407ac4:	020a1463          	bnez	s4,80407aec <do_exit+0x150>
80407ac8:	7b1040ef          	jal	ra,8040ca78 <schedule>
80407acc:	0004a783          	lw	a5,0(s1)
80407ad0:	0000d617          	auipc	a2,0xd
80407ad4:	b9060613          	addi	a2,a2,-1136 # 80414660 <CSWTCH.69+0x658>
80407ad8:	24c00593          	li	a1,588
80407adc:	0047a683          	lw	a3,4(a5)
80407ae0:	0000d517          	auipc	a0,0xd
80407ae4:	e2050513          	addi	a0,a0,-480 # 80414900 <CSWTCH.69+0x8f8>
80407ae8:	b3df80ef          	jal	ra,80400624 <__panic>
80407aec:	928f90ef          	jal	ra,80400c14 <intr_enable>
80407af0:	fd9ff06f          	j	80407ac8 <do_exit+0x12c>
80407af4:	0000d617          	auipc	a2,0xd
80407af8:	b4c60613          	addi	a2,a2,-1204 # 80414640 <CSWTCH.69+0x638>
80407afc:	21c00593          	li	a1,540
80407b00:	0000d517          	auipc	a0,0xd
80407b04:	e0050513          	addi	a0,a0,-512 # 80414900 <CSWTCH.69+0x8f8>
80407b08:	b1df80ef          	jal	ra,80400624 <__panic>
80407b0c:	00090513          	mv	a0,s2
80407b10:	f29fc0ef          	jal	ra,80404a38 <exit_mmap>
80407b14:	00c92683          	lw	a3,12(s2)
80407b18:	804007b7          	lui	a5,0x80400
80407b1c:	08f6e663          	bltu	a3,a5,80407ba8 <do_exit+0x20c>
80407b20:	00095797          	auipc	a5,0x95
80407b24:	ce078793          	addi	a5,a5,-800 # 8049c800 <va_pa_offset>
80407b28:	0007a703          	lw	a4,0(a5)
80407b2c:	00095797          	auipc	a5,0x95
80407b30:	c6c78793          	addi	a5,a5,-916 # 8049c798 <npage>
80407b34:	0007a783          	lw	a5,0(a5)
80407b38:	40e686b3          	sub	a3,a3,a4
80407b3c:	00c6d693          	srli	a3,a3,0xc
80407b40:	08f6f063          	bgeu	a3,a5,80407bc0 <do_exit+0x224>
80407b44:	0000e797          	auipc	a5,0xe
80407b48:	63c78793          	addi	a5,a5,1596 # 80416180 <nbase>
80407b4c:	0007a783          	lw	a5,0(a5)
80407b50:	00095717          	auipc	a4,0x95
80407b54:	cb870713          	addi	a4,a4,-840 # 8049c808 <pages>
80407b58:	00072503          	lw	a0,0(a4)
80407b5c:	40f686b3          	sub	a3,a3,a5
80407b60:	00569693          	slli	a3,a3,0x5
80407b64:	00d50533          	add	a0,a0,a3
80407b68:	00100593          	li	a1,1
80407b6c:	a9cfb0ef          	jal	ra,80402e08 <free_pages>
80407b70:	00090513          	mv	a0,s2
80407b74:	c79fc0ef          	jal	ra,804047ec <mm_destroy>
80407b78:	ea9ff06f          	j	80407a20 <do_exit+0x84>
80407b7c:	0000d617          	auipc	a2,0xd
80407b80:	ad460613          	addi	a2,a2,-1324 # 80414650 <CSWTCH.69+0x648>
80407b84:	21f00593          	li	a1,543
80407b88:	0000d517          	auipc	a0,0xd
80407b8c:	d7850513          	addi	a0,a0,-648 # 80414900 <CSWTCH.69+0x8f8>
80407b90:	a95f80ef          	jal	ra,80400624 <__panic>
80407b94:	888f90ef          	jal	ra,80400c1c <intr_disable>
80407b98:	00100a13          	li	s4,1
80407b9c:	eb5ff06f          	j	80407a50 <do_exit+0xb4>
80407ba0:	5dd040ef          	jal	ra,8040c97c <wakeup_proc>
80407ba4:	ec5ff06f          	j	80407a68 <do_exit+0xcc>
80407ba8:	0000c617          	auipc	a2,0xc
80407bac:	be060613          	addi	a2,a2,-1056 # 80413788 <default_pmm_manager+0x64>
80407bb0:	07000593          	li	a1,112
80407bb4:	0000c517          	auipc	a0,0xc
80407bb8:	bc450513          	addi	a0,a0,-1084 # 80413778 <default_pmm_manager+0x54>
80407bbc:	a69f80ef          	jal	ra,80400624 <__panic>
80407bc0:	0000c617          	auipc	a2,0xc
80407bc4:	bec60613          	addi	a2,a2,-1044 # 804137ac <default_pmm_manager+0x88>
80407bc8:	06900593          	li	a1,105
80407bcc:	0000c517          	auipc	a0,0xc
80407bd0:	bac50513          	addi	a0,a0,-1108 # 80413778 <default_pmm_manager+0x54>
80407bd4:	a51f80ef          	jal	ra,80400624 <__panic>

80407bd8 <do_wait.part.8>:
80407bd8:	fe010113          	addi	sp,sp,-32
80407bdc:	01412423          	sw	s4,8(sp)
80407be0:	80000a37          	lui	s4,0x80000
80407be4:	00912a23          	sw	s1,20(sp)
80407be8:	01212823          	sw	s2,16(sp)
80407bec:	01312623          	sw	s3,12(sp)
80407bf0:	01512223          	sw	s5,4(sp)
80407bf4:	01612023          	sw	s6,0(sp)
80407bf8:	00112e23          	sw	ra,28(sp)
80407bfc:	00812c23          	sw	s0,24(sp)
80407c00:	00050993          	mv	s3,a0
80407c04:	00058b13          	mv	s6,a1
80407c08:	00095917          	auipc	s2,0x95
80407c0c:	ba490913          	addi	s2,s2,-1116 # 8049c7ac <current>
80407c10:	00300493          	li	s1,3
80407c14:	00100a93          	li	s5,1
80407c18:	001a0a13          	addi	s4,s4,1 # 80000001 <end+0xffb63745>
80407c1c:	04098663          	beqz	s3,80407c68 <do_wait.part.8+0x90>
80407c20:	00098513          	mv	a0,s3
80407c24:	ef0ff0ef          	jal	ra,80407314 <find_proc>
80407c28:	00050413          	mv	s0,a0
80407c2c:	18050a63          	beqz	a0,80407dc0 <do_wait.part.8+0x1e8>
80407c30:	00092703          	lw	a4,0(s2)
80407c34:	01452783          	lw	a5,20(a0)
80407c38:	18e79463          	bne	a5,a4,80407dc0 <do_wait.part.8+0x1e8>
80407c3c:	00052783          	lw	a5,0(a0)
80407c40:	04978463          	beq	a5,s1,80407c88 <do_wait.part.8+0xb0>
80407c44:	01572023          	sw	s5,0(a4)
80407c48:	0b472423          	sw	s4,168(a4)
80407c4c:	62d040ef          	jal	ra,8040ca78 <schedule>
80407c50:	00092783          	lw	a5,0(s2)
80407c54:	05c7a783          	lw	a5,92(a5)
80407c58:	0017f793          	andi	a5,a5,1
80407c5c:	fc0780e3          	beqz	a5,80407c1c <do_wait.part.8+0x44>
80407c60:	ff700513          	li	a0,-9
80407c64:	d39ff0ef          	jal	ra,8040799c <do_exit>
80407c68:	00092703          	lw	a4,0(s2)
80407c6c:	0ac72403          	lw	s0,172(a4)
80407c70:	00041863          	bnez	s0,80407c80 <do_wait.part.8+0xa8>
80407c74:	14c0006f          	j	80407dc0 <do_wait.part.8+0x1e8>
80407c78:	0b442403          	lw	s0,180(s0)
80407c7c:	fc0404e3          	beqz	s0,80407c44 <do_wait.part.8+0x6c>
80407c80:	00042783          	lw	a5,0(s0)
80407c84:	fe979ae3          	bne	a5,s1,80407c78 <do_wait.part.8+0xa0>
80407c88:	00095797          	auipc	a5,0x95
80407c8c:	b2878793          	addi	a5,a5,-1240 # 8049c7b0 <idleproc>
80407c90:	0007a783          	lw	a5,0(a5)
80407c94:	14878063          	beq	a5,s0,80407dd4 <do_wait.part.8+0x1fc>
80407c98:	00095797          	auipc	a5,0x95
80407c9c:	b1c78793          	addi	a5,a5,-1252 # 8049c7b4 <initproc>
80407ca0:	0007a783          	lw	a5,0(a5)
80407ca4:	12f40863          	beq	s0,a5,80407dd4 <do_wait.part.8+0x1fc>
80407ca8:	000b0663          	beqz	s6,80407cb4 <do_wait.part.8+0xdc>
80407cac:	0a442783          	lw	a5,164(s0)
80407cb0:	00fb2023          	sw	a5,0(s6)
80407cb4:	100027f3          	csrr	a5,sstatus
80407cb8:	0027f793          	andi	a5,a5,2
80407cbc:	00000593          	li	a1,0
80407cc0:	10079463          	bnez	a5,80407dc8 <do_wait.part.8+0x1f0>
80407cc4:	09c42603          	lw	a2,156(s0)
80407cc8:	0a042683          	lw	a3,160(s0)
80407ccc:	0b442703          	lw	a4,180(s0)
80407cd0:	0b042783          	lw	a5,176(s0)
80407cd4:	00d62223          	sw	a3,4(a2)
80407cd8:	00c6a023          	sw	a2,0(a3)
80407cdc:	09442603          	lw	a2,148(s0)
80407ce0:	09842683          	lw	a3,152(s0)
80407ce4:	00d62223          	sw	a3,4(a2)
80407ce8:	00c6a023          	sw	a2,0(a3)
80407cec:	00070663          	beqz	a4,80407cf8 <do_wait.part.8+0x120>
80407cf0:	0af72823          	sw	a5,176(a4)
80407cf4:	0b042783          	lw	a5,176(s0)
80407cf8:	0a078e63          	beqz	a5,80407db4 <do_wait.part.8+0x1dc>
80407cfc:	0ae7aa23          	sw	a4,180(a5)
80407d00:	00095797          	auipc	a5,0x95
80407d04:	ab878793          	addi	a5,a5,-1352 # 8049c7b8 <nr_process>
80407d08:	0007a783          	lw	a5,0(a5)
80407d0c:	fff78793          	addi	a5,a5,-1
80407d10:	00095717          	auipc	a4,0x95
80407d14:	aaf72423          	sw	a5,-1368(a4) # 8049c7b8 <nr_process>
80407d18:	08059a63          	bnez	a1,80407dac <do_wait.part.8+0x1d4>
80407d1c:	00c42683          	lw	a3,12(s0)
80407d20:	804007b7          	lui	a5,0x80400
80407d24:	0ef6e063          	bltu	a3,a5,80407e04 <do_wait.part.8+0x22c>
80407d28:	00095797          	auipc	a5,0x95
80407d2c:	ad878793          	addi	a5,a5,-1320 # 8049c800 <va_pa_offset>
80407d30:	0007a703          	lw	a4,0(a5)
80407d34:	00095797          	auipc	a5,0x95
80407d38:	a6478793          	addi	a5,a5,-1436 # 8049c798 <npage>
80407d3c:	0007a783          	lw	a5,0(a5)
80407d40:	40e686b3          	sub	a3,a3,a4
80407d44:	00c6d693          	srli	a3,a3,0xc
80407d48:	0af6f263          	bgeu	a3,a5,80407dec <do_wait.part.8+0x214>
80407d4c:	0000e797          	auipc	a5,0xe
80407d50:	43478793          	addi	a5,a5,1076 # 80416180 <nbase>
80407d54:	0007a783          	lw	a5,0(a5)
80407d58:	00095717          	auipc	a4,0x95
80407d5c:	ab070713          	addi	a4,a4,-1360 # 8049c808 <pages>
80407d60:	00072503          	lw	a0,0(a4)
80407d64:	40f686b3          	sub	a3,a3,a5
80407d68:	00569693          	slli	a3,a3,0x5
80407d6c:	00d50533          	add	a0,a0,a3
80407d70:	00200593          	li	a1,2
80407d74:	894fb0ef          	jal	ra,80402e08 <free_pages>
80407d78:	00040513          	mv	a0,s0
80407d7c:	d69fa0ef          	jal	ra,80402ae4 <kfree>
80407d80:	00000513          	li	a0,0
80407d84:	01c12083          	lw	ra,28(sp)
80407d88:	01812403          	lw	s0,24(sp)
80407d8c:	01412483          	lw	s1,20(sp)
80407d90:	01012903          	lw	s2,16(sp)
80407d94:	00c12983          	lw	s3,12(sp)
80407d98:	00812a03          	lw	s4,8(sp)
80407d9c:	00412a83          	lw	s5,4(sp)
80407da0:	00012b03          	lw	s6,0(sp)
80407da4:	02010113          	addi	sp,sp,32
80407da8:	00008067          	ret
80407dac:	e69f80ef          	jal	ra,80400c14 <intr_enable>
80407db0:	f6dff06f          	j	80407d1c <do_wait.part.8+0x144>
80407db4:	01442783          	lw	a5,20(s0)
80407db8:	0ae7a623          	sw	a4,172(a5)
80407dbc:	f45ff06f          	j	80407d00 <do_wait.part.8+0x128>
80407dc0:	ffe00513          	li	a0,-2
80407dc4:	fc1ff06f          	j	80407d84 <do_wait.part.8+0x1ac>
80407dc8:	e55f80ef          	jal	ra,80400c1c <intr_disable>
80407dcc:	00100593          	li	a1,1
80407dd0:	ef5ff06f          	j	80407cc4 <do_wait.part.8+0xec>
80407dd4:	0000d617          	auipc	a2,0xd
80407dd8:	8dc60613          	addi	a2,a2,-1828 # 804146b0 <CSWTCH.69+0x6a8>
80407ddc:	3bf00593          	li	a1,959
80407de0:	0000d517          	auipc	a0,0xd
80407de4:	b2050513          	addi	a0,a0,-1248 # 80414900 <CSWTCH.69+0x8f8>
80407de8:	83df80ef          	jal	ra,80400624 <__panic>
80407dec:	0000c617          	auipc	a2,0xc
80407df0:	9c060613          	addi	a2,a2,-1600 # 804137ac <default_pmm_manager+0x88>
80407df4:	06900593          	li	a1,105
80407df8:	0000c517          	auipc	a0,0xc
80407dfc:	98050513          	addi	a0,a0,-1664 # 80413778 <default_pmm_manager+0x54>
80407e00:	825f80ef          	jal	ra,80400624 <__panic>
80407e04:	0000c617          	auipc	a2,0xc
80407e08:	98460613          	addi	a2,a2,-1660 # 80413788 <default_pmm_manager+0x64>
80407e0c:	07000593          	li	a1,112
80407e10:	0000c517          	auipc	a0,0xc
80407e14:	96850513          	addi	a0,a0,-1688 # 80413778 <default_pmm_manager+0x54>
80407e18:	80df80ef          	jal	ra,80400624 <__panic>

80407e1c <init_main>:
80407e1c:	6b7377b7          	lui	a5,0x6b737
80407e20:	fe010113          	addi	sp,sp,-32
80407e24:	96478793          	addi	a5,a5,-1692 # 6b736964 <_binary_bin_sfs_img_size+0x6b6be964>
80407e28:	00f12423          	sw	a5,8(sp)
80407e2c:	000047b7          	lui	a5,0x4
80407e30:	a3078793          	addi	a5,a5,-1488 # 3a30 <_binary_bin_swap_img_size-0x45d0>
80407e34:	00810513          	addi	a0,sp,8
80407e38:	00112e23          	sw	ra,28(sp)
80407e3c:	00f11623          	sh	a5,12(sp)
80407e40:	00010723          	sb	zero,14(sp)
80407e44:	08d050ef          	jal	ra,8040d6d0 <vfs_set_bootfs>
80407e48:	0e051a63          	bnez	a0,80407f3c <init_main+0x120>
80407e4c:	828fb0ef          	jal	ra,80402e74 <nr_free_pages>
80407e50:	b69fa0ef          	jal	ra,804029b8 <kallocated>
80407e54:	00000613          	li	a2,0
80407e58:	00000593          	li	a1,0
80407e5c:	fffff517          	auipc	a0,0xfffff
80407e60:	20c50513          	addi	a0,a0,524 # 80407068 <user_main>
80407e64:	abdff0ef          	jal	ra,80407920 <kernel_thread>
80407e68:	00a04663          	bgtz	a0,80407e74 <init_main+0x58>
80407e6c:	0b80006f          	j	80407f24 <init_main+0x108>
80407e70:	409040ef          	jal	ra,8040ca78 <schedule>
80407e74:	00000593          	li	a1,0
80407e78:	00000513          	li	a0,0
80407e7c:	d5dff0ef          	jal	ra,80407bd8 <do_wait.part.8>
80407e80:	fe0508e3          	beqz	a0,80407e70 <init_main+0x54>
80407e84:	bdcfe0ef          	jal	ra,80406260 <fs_cleanup>
80407e88:	0000d517          	auipc	a0,0xd
80407e8c:	87c50513          	addi	a0,a0,-1924 # 80414704 <CSWTCH.69+0x6fc>
80407e90:	b6cf80ef          	jal	ra,804001fc <cprintf>
80407e94:	00095797          	auipc	a5,0x95
80407e98:	92078793          	addi	a5,a5,-1760 # 8049c7b4 <initproc>
80407e9c:	0007a783          	lw	a5,0(a5)
80407ea0:	0ac7a703          	lw	a4,172(a5)
80407ea4:	06071063          	bnez	a4,80407f04 <init_main+0xe8>
80407ea8:	0b07a703          	lw	a4,176(a5)
80407eac:	04071c63          	bnez	a4,80407f04 <init_main+0xe8>
80407eb0:	0b47a703          	lw	a4,180(a5)
80407eb4:	04071863          	bnez	a4,80407f04 <init_main+0xe8>
80407eb8:	00095717          	auipc	a4,0x95
80407ebc:	90070713          	addi	a4,a4,-1792 # 8049c7b8 <nr_process>
80407ec0:	00072683          	lw	a3,0(a4)
80407ec4:	00200713          	li	a4,2
80407ec8:	0ce69863          	bne	a3,a4,80407f98 <init_main+0x17c>
80407ecc:	00095697          	auipc	a3,0x95
80407ed0:	9e868693          	addi	a3,a3,-1560 # 8049c8b4 <proc_list>
80407ed4:	0046a703          	lw	a4,4(a3)
80407ed8:	09478793          	addi	a5,a5,148
80407edc:	08f71e63          	bne	a4,a5,80407f78 <init_main+0x15c>
80407ee0:	0006a783          	lw	a5,0(a3)
80407ee4:	06f71a63          	bne	a4,a5,80407f58 <init_main+0x13c>
80407ee8:	0000d517          	auipc	a0,0xd
80407eec:	8fc50513          	addi	a0,a0,-1796 # 804147e4 <CSWTCH.69+0x7dc>
80407ef0:	b0cf80ef          	jal	ra,804001fc <cprintf>
80407ef4:	01c12083          	lw	ra,28(sp)
80407ef8:	00000513          	li	a0,0
80407efc:	02010113          	addi	sp,sp,32
80407f00:	00008067          	ret
80407f04:	0000d697          	auipc	a3,0xd
80407f08:	82468693          	addi	a3,a3,-2012 # 80414728 <CSWTCH.69+0x720>
80407f0c:	0000b617          	auipc	a2,0xb
80407f10:	cdc60613          	addi	a2,a2,-804 # 80412be8 <commands+0x1bc>
80407f14:	43300593          	li	a1,1075
80407f18:	0000d517          	auipc	a0,0xd
80407f1c:	9e850513          	addi	a0,a0,-1560 # 80414900 <CSWTCH.69+0x8f8>
80407f20:	f04f80ef          	jal	ra,80400624 <__panic>
80407f24:	0000c617          	auipc	a2,0xc
80407f28:	7c460613          	addi	a2,a2,1988 # 804146e8 <CSWTCH.69+0x6e0>
80407f2c:	42700593          	li	a1,1063
80407f30:	0000d517          	auipc	a0,0xd
80407f34:	9d050513          	addi	a0,a0,-1584 # 80414900 <CSWTCH.69+0x8f8>
80407f38:	eecf80ef          	jal	ra,80400624 <__panic>
80407f3c:	00050693          	mv	a3,a0
80407f40:	0000c617          	auipc	a2,0xc
80407f44:	78c60613          	addi	a2,a2,1932 # 804146cc <CSWTCH.69+0x6c4>
80407f48:	41f00593          	li	a1,1055
80407f4c:	0000d517          	auipc	a0,0xd
80407f50:	9b450513          	addi	a0,a0,-1612 # 80414900 <CSWTCH.69+0x8f8>
80407f54:	ed0f80ef          	jal	ra,80400624 <__panic>
80407f58:	0000d697          	auipc	a3,0xd
80407f5c:	85c68693          	addi	a3,a3,-1956 # 804147b4 <CSWTCH.69+0x7ac>
80407f60:	0000b617          	auipc	a2,0xb
80407f64:	c8860613          	addi	a2,a2,-888 # 80412be8 <commands+0x1bc>
80407f68:	43600593          	li	a1,1078
80407f6c:	0000d517          	auipc	a0,0xd
80407f70:	99450513          	addi	a0,a0,-1644 # 80414900 <CSWTCH.69+0x8f8>
80407f74:	eb0f80ef          	jal	ra,80400624 <__panic>
80407f78:	0000d697          	auipc	a3,0xd
80407f7c:	80c68693          	addi	a3,a3,-2036 # 80414784 <CSWTCH.69+0x77c>
80407f80:	0000b617          	auipc	a2,0xb
80407f84:	c6860613          	addi	a2,a2,-920 # 80412be8 <commands+0x1bc>
80407f88:	43500593          	li	a1,1077
80407f8c:	0000d517          	auipc	a0,0xd
80407f90:	97450513          	addi	a0,a0,-1676 # 80414900 <CSWTCH.69+0x8f8>
80407f94:	e90f80ef          	jal	ra,80400624 <__panic>
80407f98:	0000c697          	auipc	a3,0xc
80407f9c:	7dc68693          	addi	a3,a3,2012 # 80414774 <CSWTCH.69+0x76c>
80407fa0:	0000b617          	auipc	a2,0xb
80407fa4:	c4860613          	addi	a2,a2,-952 # 80412be8 <commands+0x1bc>
80407fa8:	43400593          	li	a1,1076
80407fac:	0000d517          	auipc	a0,0xd
80407fb0:	95450513          	addi	a0,a0,-1708 # 80414900 <CSWTCH.69+0x8f8>
80407fb4:	e70f80ef          	jal	ra,80400624 <__panic>

80407fb8 <do_execve>:
80407fb8:	e9010113          	addi	sp,sp,-368
80407fbc:	15412c23          	sw	s4,344(sp)
80407fc0:	00094a17          	auipc	s4,0x94
80407fc4:	7eca0a13          	addi	s4,s4,2028 # 8049c7ac <current>
80407fc8:	000a2683          	lw	a3,0(s4)
80407fcc:	15612823          	sw	s6,336(sp)
80407fd0:	16112623          	sw	ra,364(sp)
80407fd4:	16812423          	sw	s0,360(sp)
80407fd8:	16912223          	sw	s1,356(sp)
80407fdc:	17212023          	sw	s2,352(sp)
80407fe0:	15312e23          	sw	s3,348(sp)
80407fe4:	15512a23          	sw	s5,340(sp)
80407fe8:	15712623          	sw	s7,332(sp)
80407fec:	15812423          	sw	s8,328(sp)
80407ff0:	15912223          	sw	s9,324(sp)
80407ff4:	15a12023          	sw	s10,320(sp)
80407ff8:	13b12e23          	sw	s11,316(sp)
80407ffc:	fff58713          	addi	a4,a1,-1
80408000:	01f00793          	li	a5,31
80408004:	0186ab03          	lw	s6,24(a3)
80408008:	72e7ee63          	bltu	a5,a4,80408744 <do_execve+0x78c>
8040800c:	00060d13          	mv	s10,a2
80408010:	00050413          	mv	s0,a0
80408014:	00058993          	mv	s3,a1
80408018:	03300613          	li	a2,51
8040801c:	00000593          	li	a1,0
80408020:	04810513          	addi	a0,sp,72
80408024:	7940a0ef          	jal	ra,804127b8 <memset>
80408028:	000b0e63          	beqz	s6,80408044 <do_execve+0x8c>
8040802c:	01cb0513          	addi	a0,s6,28
80408030:	8ccfd0ef          	jal	ra,804050fc <down>
80408034:	000a2783          	lw	a5,0(s4)
80408038:	00078663          	beqz	a5,80408044 <do_execve+0x8c>
8040803c:	0047a783          	lw	a5,4(a5)
80408040:	02fb2423          	sw	a5,40(s6)
80408044:	1e040863          	beqz	s0,80408234 <do_execve+0x27c>
80408048:	03300693          	li	a3,51
8040804c:	00040613          	mv	a2,s0
80408050:	04810593          	addi	a1,sp,72
80408054:	000b0513          	mv	a0,s6
80408058:	db5fc0ef          	jal	ra,80404e0c <copy_string>
8040805c:	060500e3          	beqz	a0,804088bc <do_execve+0x904>
80408060:	00299493          	slli	s1,s3,0x2
80408064:	00000693          	li	a3,0
80408068:	00048613          	mv	a2,s1
8040806c:	000d0593          	mv	a1,s10
80408070:	000b0513          	mv	a0,s6
80408074:	000d0c13          	mv	s8,s10
80408078:	c01fc0ef          	jal	ra,80404c78 <user_mem_check>
8040807c:	02050ae3          	beqz	a0,804088b0 <do_execve+0x8f8>
80408080:	0b010913          	addi	s2,sp,176
80408084:	00090c93          	mv	s9,s2
80408088:	00000413          	li	s0,0
8040808c:	00001537          	lui	a0,0x1
80408090:	931fa0ef          	jal	ra,804029c0 <kmalloc>
80408094:	00050a93          	mv	s5,a0
80408098:	10050863          	beqz	a0,804081a8 <do_execve+0x1f0>
8040809c:	000c2603          	lw	a2,0(s8)
804080a0:	00050593          	mv	a1,a0
804080a4:	000016b7          	lui	a3,0x1
804080a8:	000b0513          	mv	a0,s6
804080ac:	d61fc0ef          	jal	ra,80404e0c <copy_string>
804080b0:	16050a63          	beqz	a0,80408224 <do_execve+0x26c>
804080b4:	015ca023          	sw	s5,0(s9)
804080b8:	00140413          	addi	s0,s0,1
804080bc:	004c8c93          	addi	s9,s9,4
804080c0:	004c0c13          	addi	s8,s8,4
804080c4:	fc8994e3          	bne	s3,s0,8040808c <do_execve+0xd4>
804080c8:	000d2a83          	lw	s5,0(s10)
804080cc:	080b0c63          	beqz	s6,80408164 <do_execve+0x1ac>
804080d0:	01cb0513          	addi	a0,s6,28
804080d4:	824fd0ef          	jal	ra,804050f8 <up>
804080d8:	000a2783          	lw	a5,0(s4)
804080dc:	020b2423          	sw	zero,40(s6)
804080e0:	0dc7a503          	lw	a0,220(a5)
804080e4:	ab0fe0ef          	jal	ra,80406394 <files_closeall>
804080e8:	00000593          	li	a1,0
804080ec:	000a8513          	mv	a0,s5
804080f0:	e78fe0ef          	jal	ra,80406768 <sysfile_open>
804080f4:	00050c13          	mv	s8,a0
804080f8:	060544e3          	bltz	a0,80408960 <do_execve+0x9a8>
804080fc:	00094797          	auipc	a5,0x94
80408100:	70878793          	addi	a5,a5,1800 # 8049c804 <boot_cr3>
80408104:	0007a783          	lw	a5,0(a5)
80408108:	80000737          	lui	a4,0x80000
8040810c:	00c7d793          	srli	a5,a5,0xc
80408110:	00e7e7b3          	or	a5,a5,a4
80408114:	18079073          	csrw	satp,a5
80408118:	12000073          	sfence.vma
8040811c:	018b2783          	lw	a5,24(s6)
80408120:	fff78793          	addi	a5,a5,-1
80408124:	00fb2c23          	sw	a5,24(s6)
80408128:	40078e63          	beqz	a5,80408544 <do_execve+0x58c>
8040812c:	000a2783          	lw	a5,0(s4)
80408130:	0007ac23          	sw	zero,24(a5)
80408134:	cf4fc0ef          	jal	ra,80404628 <mm_create>
80408138:	00050b13          	mv	s6,a0
8040813c:	00050c63          	beqz	a0,80408154 <do_execve+0x19c>
80408140:	00c50513          	addi	a0,a0,12 # 100c <_binary_bin_swap_img_size-0x6ff4>
80408144:	fd9fe0ef          	jal	ra,8040711c <setup_pgdir.isra.4>
80408148:	10050663          	beqz	a0,80408254 <do_execve+0x29c>
8040814c:	000b0513          	mv	a0,s6
80408150:	e9cfc0ef          	jal	ra,804047ec <mm_destroy>
80408154:	ffc00a93          	li	s5,-4
80408158:	ffc48413          	addi	s0,s1,-4
8040815c:	00890433          	add	s0,s2,s0
80408160:	5cc0006f          	j	8040872c <do_execve+0x774>
80408164:	000a2783          	lw	a5,0(s4)
80408168:	0dc7a503          	lw	a0,220(a5)
8040816c:	a28fe0ef          	jal	ra,80406394 <files_closeall>
80408170:	00000593          	li	a1,0
80408174:	000a8513          	mv	a0,s5
80408178:	df0fe0ef          	jal	ra,80406768 <sysfile_open>
8040817c:	00050c13          	mv	s8,a0
80408180:	7e054063          	bltz	a0,80408960 <do_execve+0x9a8>
80408184:	000a2783          	lw	a5,0(s4)
80408188:	0187a783          	lw	a5,24(a5)
8040818c:	fa0784e3          	beqz	a5,80408134 <do_execve+0x17c>
80408190:	0000c617          	auipc	a2,0xc
80408194:	2cc60613          	addi	a2,a2,716 # 8041445c <CSWTCH.69+0x454>
80408198:	27a00593          	li	a1,634
8040819c:	0000c517          	auipc	a0,0xc
804081a0:	76450513          	addi	a0,a0,1892 # 80414900 <CSWTCH.69+0x8f8>
804081a4:	c80f80ef          	jal	ra,80400624 <__panic>
804081a8:	ffc00a93          	li	s5,-4
804081ac:	02040463          	beqz	s0,804081d4 <do_execve+0x21c>
804081b0:	fff40413          	addi	s0,s0,-1
804081b4:	00241413          	slli	s0,s0,0x2
804081b8:	00890433          	add	s0,s2,s0
804081bc:	0080006f          	j	804081c4 <do_execve+0x20c>
804081c0:	00078413          	mv	s0,a5
804081c4:	00042503          	lw	a0,0(s0)
804081c8:	91dfa0ef          	jal	ra,80402ae4 <kfree>
804081cc:	ffc40793          	addi	a5,s0,-4
804081d0:	fe8918e3          	bne	s2,s0,804081c0 <do_execve+0x208>
804081d4:	000b0863          	beqz	s6,804081e4 <do_execve+0x22c>
804081d8:	01cb0513          	addi	a0,s6,28
804081dc:	f1dfc0ef          	jal	ra,804050f8 <up>
804081e0:	020b2423          	sw	zero,40(s6)
804081e4:	16c12083          	lw	ra,364(sp)
804081e8:	16812403          	lw	s0,360(sp)
804081ec:	000a8513          	mv	a0,s5
804081f0:	16412483          	lw	s1,356(sp)
804081f4:	16012903          	lw	s2,352(sp)
804081f8:	15c12983          	lw	s3,348(sp)
804081fc:	15812a03          	lw	s4,344(sp)
80408200:	15412a83          	lw	s5,340(sp)
80408204:	15012b03          	lw	s6,336(sp)
80408208:	14c12b83          	lw	s7,332(sp)
8040820c:	14812c03          	lw	s8,328(sp)
80408210:	14412c83          	lw	s9,324(sp)
80408214:	14012d03          	lw	s10,320(sp)
80408218:	13c12d83          	lw	s11,316(sp)
8040821c:	17010113          	addi	sp,sp,368
80408220:	00008067          	ret
80408224:	000a8513          	mv	a0,s5
80408228:	8bdfa0ef          	jal	ra,80402ae4 <kfree>
8040822c:	ffd00a93          	li	s5,-3
80408230:	f7dff06f          	j	804081ac <do_execve+0x1f4>
80408234:	000a2783          	lw	a5,0(s4)
80408238:	0000c617          	auipc	a2,0xc
8040823c:	21860613          	addi	a2,a2,536 # 80414450 <CSWTCH.69+0x448>
80408240:	03300593          	li	a1,51
80408244:	0047a683          	lw	a3,4(a5)
80408248:	04810513          	addi	a0,sp,72
8040824c:	4500a0ef          	jal	ra,8041269c <snprintf>
80408250:	e11ff06f          	j	80408060 <do_execve+0xa8>
80408254:	00000693          	li	a3,0
80408258:	03400613          	li	a2,52
8040825c:	07c10593          	addi	a1,sp,124
80408260:	000c0513          	mv	a0,s8
80408264:	d6dfe0ef          	jal	ra,80406fd0 <load_icode_read>
80408268:	00050a93          	mv	s5,a0
8040826c:	26051863          	bnez	a0,804084dc <do_execve+0x524>
80408270:	07c12703          	lw	a4,124(sp)
80408274:	464c47b7          	lui	a5,0x464c4
80408278:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644c57f>
8040827c:	24f71e63          	bne	a4,a5,804084d8 <do_execve+0x520>
80408280:	0a815783          	lhu	a5,168(sp)
80408284:	00012e23          	sw	zero,28(sp)
80408288:	04078c63          	beqz	a5,804082e0 <do_execve+0x328>
8040828c:	001007b7          	lui	a5,0x100
80408290:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
80408294:	00f12c23          	sw	a5,24(sp)
80408298:	01c12783          	lw	a5,28(sp)
8040829c:	09812683          	lw	a3,152(sp)
804082a0:	02000613          	li	a2,32
804082a4:	00579793          	slli	a5,a5,0x5
804082a8:	00d786b3          	add	a3,a5,a3
804082ac:	02810593          	addi	a1,sp,40
804082b0:	000c0513          	mv	a0,s8
804082b4:	d1dfe0ef          	jal	ra,80406fd0 <load_icode_read>
804082b8:	00050a93          	mv	s5,a0
804082bc:	44051663          	bnez	a0,80408708 <do_execve+0x750>
804082c0:	02812703          	lw	a4,40(sp)
804082c4:	00100793          	li	a5,1
804082c8:	2ef70663          	beq	a4,a5,804085b4 <do_execve+0x5fc>
804082cc:	01c12703          	lw	a4,28(sp)
804082d0:	0a815783          	lhu	a5,168(sp)
804082d4:	00170713          	addi	a4,a4,1 # 80000001 <end+0xffb63745>
804082d8:	00e12e23          	sw	a4,28(sp)
804082dc:	faf76ee3          	bltu	a4,a5,80408298 <do_execve+0x2e0>
804082e0:	000c0513          	mv	a0,s8
804082e4:	cdcfe0ef          	jal	ra,804067c0 <sysfile_close>
804082e8:	00000713          	li	a4,0
804082ec:	00b00693          	li	a3,11
804082f0:	00100637          	lui	a2,0x100
804082f4:	7ff005b7          	lui	a1,0x7ff00
804082f8:	000b0513          	mv	a0,s6
804082fc:	d64fc0ef          	jal	ra,80404860 <mm_map>
80408300:	00050a93          	mv	s5,a0
80408304:	40051263          	bnez	a0,80408708 <do_execve+0x750>
80408308:	00cb2503          	lw	a0,12(s6)
8040830c:	01f00613          	li	a2,31
80408310:	7ffff5b7          	lui	a1,0x7ffff
80408314:	be8fb0ef          	jal	ra,804036fc <pgdir_alloc_page>
80408318:	6e050063          	beqz	a0,804089f8 <do_execve+0xa40>
8040831c:	00cb2503          	lw	a0,12(s6)
80408320:	01f00613          	li	a2,31
80408324:	7fffe5b7          	lui	a1,0x7fffe
80408328:	bd4fb0ef          	jal	ra,804036fc <pgdir_alloc_page>
8040832c:	6a050663          	beqz	a0,804089d8 <do_execve+0xa20>
80408330:	00cb2503          	lw	a0,12(s6)
80408334:	01f00613          	li	a2,31
80408338:	7fffd5b7          	lui	a1,0x7fffd
8040833c:	bc0fb0ef          	jal	ra,804036fc <pgdir_alloc_page>
80408340:	66050c63          	beqz	a0,804089b8 <do_execve+0xa00>
80408344:	00cb2503          	lw	a0,12(s6)
80408348:	01f00613          	li	a2,31
8040834c:	7fffc5b7          	lui	a1,0x7fffc
80408350:	bacfb0ef          	jal	ra,804036fc <pgdir_alloc_page>
80408354:	64050263          	beqz	a0,80408998 <do_execve+0x9e0>
80408358:	018b2783          	lw	a5,24(s6)
8040835c:	000a2703          	lw	a4,0(s4)
80408360:	00cb2683          	lw	a3,12(s6)
80408364:	00178793          	addi	a5,a5,1
80408368:	00fb2c23          	sw	a5,24(s6)
8040836c:	01672c23          	sw	s6,24(a4)
80408370:	804007b7          	lui	a5,0x80400
80408374:	5af6e063          	bltu	a3,a5,80408914 <do_execve+0x95c>
80408378:	00094797          	auipc	a5,0x94
8040837c:	48878793          	addi	a5,a5,1160 # 8049c800 <va_pa_offset>
80408380:	0007a783          	lw	a5,0(a5)
80408384:	40f686b3          	sub	a3,a3,a5
80408388:	00c6d793          	srli	a5,a3,0xc
8040838c:	04d72c23          	sw	a3,88(a4)
80408390:	80000737          	lui	a4,0x80000
80408394:	00e7e7b3          	or	a5,a5,a4
80408398:	18079073          	csrw	satp,a5
8040839c:	12000073          	sfence.vma
804083a0:	00000b93          	li	s7,0
804083a4:	00090c93          	mv	s9,s2
804083a8:	00000c13          	li	s8,0
804083ac:	000ca503          	lw	a0,0(s9)
804083b0:	000015b7          	lui	a1,0x1
804083b4:	001c0c13          	addi	s8,s8,1
804083b8:	34c0a0ef          	jal	ra,80412704 <strnlen>
804083bc:	00150513          	addi	a0,a0,1
804083c0:	00ab8bb3          	add	s7,s7,a0
804083c4:	004c8c93          	addi	s9,s9,4
804083c8:	ff3c62e3          	bltu	s8,s3,804083ac <do_execve+0x3f4>
804083cc:	fffbcb93          	not	s7,s7
804083d0:	800007b7          	lui	a5,0x80000
804083d4:	ffcbfb93          	andi	s7,s7,-4
804083d8:	00fb8bb3          	add	s7,s7,a5
804083dc:	409b87b3          	sub	a5,s7,s1
804083e0:	00f12823          	sw	a5,16(sp)
804083e4:	412787b3          	sub	a5,a5,s2
804083e8:	00090d93          	mv	s11,s2
804083ec:	00000d13          	li	s10,0
804083f0:	00000c13          	li	s8,0
804083f4:	00f12623          	sw	a5,12(sp)
804083f8:	000dac83          	lw	s9,0(s11)
804083fc:	018b8533          	add	a0,s7,s8
80408400:	001d0d13          	addi	s10,s10,1
80408404:	000c8593          	mv	a1,s9
80408408:	3380a0ef          	jal	ra,80412740 <strcpy>
8040840c:	00c12783          	lw	a5,12(sp)
80408410:	000015b7          	lui	a1,0x1
80408414:	01b786b3          	add	a3,a5,s11
80408418:	00a6a023          	sw	a0,0(a3) # 1000 <_binary_bin_swap_img_size-0x7000>
8040841c:	000c8513          	mv	a0,s9
80408420:	2e40a0ef          	jal	ra,80412704 <strnlen>
80408424:	01850c33          	add	s8,a0,s8
80408428:	001c0c13          	addi	s8,s8,1
8040842c:	004d8d93          	addi	s11,s11,4
80408430:	fd3d64e3          	bltu	s10,s3,804083f8 <do_execve+0x440>
80408434:	000a2783          	lw	a5,0(s4)
80408438:	01012703          	lw	a4,16(sp)
8040843c:	09000613          	li	a2,144
80408440:	00000593          	li	a1,0
80408444:	fe872e23          	sw	s0,-4(a4) # 7ffffffc <end+0xffb63740>
80408448:	0547a403          	lw	s0,84(a5) # 80000054 <end+0xffb63798>
8040844c:	ffc70c93          	addi	s9,a4,-4
80408450:	00040513          	mv	a0,s0
80408454:	08042983          	lw	s3,128(s0)
80408458:	3600a0ef          	jal	ra,804127b8 <memset>
8040845c:	09412783          	lw	a5,148(sp)
80408460:	00cb2503          	lw	a0,12(s6)
80408464:	edf9f993          	andi	s3,s3,-289
80408468:	01942423          	sw	s9,8(s0)
8040846c:	08f42223          	sw	a5,132(s0)
80408470:	09342023          	sw	s3,128(s0)
80408474:	00000613          	li	a2,0
80408478:	008005b7          	lui	a1,0x800
8040847c:	a59fa0ef          	jal	ra,80402ed4 <get_pte>
80408480:	46050263          	beqz	a0,804088e4 <do_execve+0x92c>
80408484:	00052683          	lw	a3,0(a0)
80408488:	000a2703          	lw	a4,0(s4)
8040848c:	0016f793          	andi	a5,a3,1
80408490:	00472583          	lw	a1,4(a4)
80408494:	44079e63          	bnez	a5,804088f0 <do_execve+0x938>
80408498:	0000c517          	auipc	a0,0xc
8040849c:	17850513          	addi	a0,a0,376 # 80414610 <CSWTCH.69+0x608>
804084a0:	d5df70ef          	jal	ra,804001fc <cprintf>
804084a4:	12000073          	sfence.vma
804084a8:	ffc48493          	addi	s1,s1,-4
804084ac:	009904b3          	add	s1,s2,s1
804084b0:	0080006f          	j	804084b8 <do_execve+0x500>
804084b4:	00078493          	mv	s1,a5
804084b8:	0004a503          	lw	a0,0(s1)
804084bc:	e28fa0ef          	jal	ra,80402ae4 <kfree>
804084c0:	ffc48793          	addi	a5,s1,-4
804084c4:	fe9918e3          	bne	s2,s1,804084b4 <do_execve+0x4fc>
804084c8:	000a2503          	lw	a0,0(s4)
804084cc:	04810593          	addi	a1,sp,72
804084d0:	d59fe0ef          	jal	ra,80407228 <set_proc_name>
804084d4:	d11ff06f          	j	804081e4 <do_execve+0x22c>
804084d8:	ff800a93          	li	s5,-8
804084dc:	00cb2683          	lw	a3,12(s6)
804084e0:	804007b7          	lui	a5,0x80400
804084e4:	48f6e263          	bltu	a3,a5,80408968 <do_execve+0x9b0>
804084e8:	00094797          	auipc	a5,0x94
804084ec:	31878793          	addi	a5,a5,792 # 8049c800 <va_pa_offset>
804084f0:	0007a703          	lw	a4,0(a5)
804084f4:	00094797          	auipc	a5,0x94
804084f8:	2a478793          	addi	a5,a5,676 # 8049c798 <npage>
804084fc:	0007a783          	lw	a5,0(a5)
80408500:	40e686b3          	sub	a3,a3,a4
80408504:	00c6d693          	srli	a3,a3,0xc
80408508:	46f6fc63          	bgeu	a3,a5,80408980 <do_execve+0x9c8>
8040850c:	0000e797          	auipc	a5,0xe
80408510:	c7478793          	addi	a5,a5,-908 # 80416180 <nbase>
80408514:	0007a783          	lw	a5,0(a5)
80408518:	00094717          	auipc	a4,0x94
8040851c:	2f070713          	addi	a4,a4,752 # 8049c808 <pages>
80408520:	00072503          	lw	a0,0(a4)
80408524:	40f686b3          	sub	a3,a3,a5
80408528:	00569693          	slli	a3,a3,0x5
8040852c:	00d50533          	add	a0,a0,a3
80408530:	00100593          	li	a1,1
80408534:	8d5fa0ef          	jal	ra,80402e08 <free_pages>
80408538:	000b0513          	mv	a0,s6
8040853c:	ab0fc0ef          	jal	ra,804047ec <mm_destroy>
80408540:	c19ff06f          	j	80408158 <do_execve+0x1a0>
80408544:	000b0513          	mv	a0,s6
80408548:	cf0fc0ef          	jal	ra,80404a38 <exit_mmap>
8040854c:	00cb2683          	lw	a3,12(s6)
80408550:	804007b7          	lui	a5,0x80400
80408554:	40f6ea63          	bltu	a3,a5,80408968 <do_execve+0x9b0>
80408558:	00094797          	auipc	a5,0x94
8040855c:	2a878793          	addi	a5,a5,680 # 8049c800 <va_pa_offset>
80408560:	0007a703          	lw	a4,0(a5)
80408564:	00094797          	auipc	a5,0x94
80408568:	23478793          	addi	a5,a5,564 # 8049c798 <npage>
8040856c:	0007a783          	lw	a5,0(a5)
80408570:	40e686b3          	sub	a3,a3,a4
80408574:	00c6d693          	srli	a3,a3,0xc
80408578:	40f6f463          	bgeu	a3,a5,80408980 <do_execve+0x9c8>
8040857c:	0000e797          	auipc	a5,0xe
80408580:	c0478793          	addi	a5,a5,-1020 # 80416180 <nbase>
80408584:	0007a783          	lw	a5,0(a5)
80408588:	00094717          	auipc	a4,0x94
8040858c:	28070713          	addi	a4,a4,640 # 8049c808 <pages>
80408590:	00072503          	lw	a0,0(a4)
80408594:	40f686b3          	sub	a3,a3,a5
80408598:	00569693          	slli	a3,a3,0x5
8040859c:	00d50533          	add	a0,a0,a3
804085a0:	00100593          	li	a1,1
804085a4:	865fa0ef          	jal	ra,80402e08 <free_pages>
804085a8:	000b0513          	mv	a0,s6
804085ac:	a40fc0ef          	jal	ra,804047ec <mm_destroy>
804085b0:	b7dff06f          	j	8040812c <do_execve+0x174>
804085b4:	03c12603          	lw	a2,60(sp)
804085b8:	03812783          	lw	a5,56(sp)
804085bc:	32f66063          	bltu	a2,a5,804088dc <do_execve+0x924>
804085c0:	04012783          	lw	a5,64(sp)
804085c4:	0017f693          	andi	a3,a5,1
804085c8:	00068463          	beqz	a3,804085d0 <do_execve+0x618>
804085cc:	00400693          	li	a3,4
804085d0:	0027f713          	andi	a4,a5,2
804085d4:	0047f793          	andi	a5,a5,4
804085d8:	12071e63          	bnez	a4,80408714 <do_execve+0x75c>
804085dc:	01100713          	li	a4,17
804085e0:	00e12a23          	sw	a4,20(sp)
804085e4:	00078863          	beqz	a5,804085f4 <do_execve+0x63c>
804085e8:	01300793          	li	a5,19
804085ec:	0016e693          	ori	a3,a3,1
804085f0:	00f12a23          	sw	a5,20(sp)
804085f4:	0026f793          	andi	a5,a3,2
804085f8:	12079263          	bnez	a5,8040871c <do_execve+0x764>
804085fc:	0046f793          	andi	a5,a3,4
80408600:	00078863          	beqz	a5,80408610 <do_execve+0x658>
80408604:	01412783          	lw	a5,20(sp)
80408608:	0087e793          	ori	a5,a5,8
8040860c:	00f12a23          	sw	a5,20(sp)
80408610:	03012583          	lw	a1,48(sp)
80408614:	00000713          	li	a4,0
80408618:	000b0513          	mv	a0,s6
8040861c:	a44fc0ef          	jal	ra,80404860 <mm_map>
80408620:	00050a93          	mv	s5,a0
80408624:	0e051263          	bnez	a0,80408708 <do_execve+0x750>
80408628:	03012d83          	lw	s11,48(sp)
8040862c:	03812783          	lw	a5,56(sp)
80408630:	fffff737          	lui	a4,0xfffff
80408634:	02c12c83          	lw	s9,44(sp)
80408638:	00fd87b3          	add	a5,s11,a5
8040863c:	00f12623          	sw	a5,12(sp)
80408640:	00edfd33          	and	s10,s11,a4
80408644:	0afde463          	bltu	s11,a5,804086ec <do_execve+0x734>
80408648:	28c0006f          	j	804088d4 <do_execve+0x91c>
8040864c:	000017b7          	lui	a5,0x1
80408650:	41ad85b3          	sub	a1,s11,s10
80408654:	00fd0d33          	add	s10,s10,a5
80408658:	00c12783          	lw	a5,12(sp)
8040865c:	41bd08b3          	sub	a7,s10,s11
80408660:	01a7f463          	bgeu	a5,s10,80408668 <do_execve+0x6b0>
80408664:	41b788b3          	sub	a7,a5,s11
80408668:	00094797          	auipc	a5,0x94
8040866c:	1a078793          	addi	a5,a5,416 # 8049c808 <pages>
80408670:	0007a783          	lw	a5,0(a5)
80408674:	0000e717          	auipc	a4,0xe
80408678:	b0c70713          	addi	a4,a4,-1268 # 80416180 <nbase>
8040867c:	00072603          	lw	a2,0(a4)
80408680:	00094717          	auipc	a4,0x94
80408684:	11870713          	addi	a4,a4,280 # 8049c798 <npage>
80408688:	00072683          	lw	a3,0(a4)
8040868c:	40fb87b3          	sub	a5,s7,a5
80408690:	01812703          	lw	a4,24(sp)
80408694:	4057d793          	srai	a5,a5,0x5
80408698:	00c787b3          	add	a5,a5,a2
8040869c:	00e7f633          	and	a2,a5,a4
804086a0:	00c79793          	slli	a5,a5,0xc
804086a4:	2ad67063          	bgeu	a2,a3,80408944 <do_execve+0x98c>
804086a8:	00094717          	auipc	a4,0x94
804086ac:	15870713          	addi	a4,a4,344 # 8049c800 <va_pa_offset>
804086b0:	00072503          	lw	a0,0(a4)
804086b4:	000c8693          	mv	a3,s9
804086b8:	00088613          	mv	a2,a7
804086bc:	00a787b3          	add	a5,a5,a0
804086c0:	00b785b3          	add	a1,a5,a1
804086c4:	000c0513          	mv	a0,s8
804086c8:	01112823          	sw	a7,16(sp)
804086cc:	905fe0ef          	jal	ra,80406fd0 <load_icode_read>
804086d0:	00050a93          	mv	s5,a0
804086d4:	02051a63          	bnez	a0,80408708 <do_execve+0x750>
804086d8:	01012883          	lw	a7,16(sp)
804086dc:	00c12783          	lw	a5,12(sp)
804086e0:	011d8db3          	add	s11,s11,a7
804086e4:	011c8cb3          	add	s9,s9,a7
804086e8:	06fdf263          	bgeu	s11,a5,8040874c <do_execve+0x794>
804086ec:	00cb2503          	lw	a0,12(s6)
804086f0:	01412603          	lw	a2,20(sp)
804086f4:	000d0593          	mv	a1,s10
804086f8:	804fb0ef          	jal	ra,804036fc <pgdir_alloc_page>
804086fc:	00050b93          	mv	s7,a0
80408700:	f40516e3          	bnez	a0,8040864c <do_execve+0x694>
80408704:	ffc00a93          	li	s5,-4
80408708:	000b0513          	mv	a0,s6
8040870c:	b2cfc0ef          	jal	ra,80404a38 <exit_mmap>
80408710:	dcdff06f          	j	804084dc <do_execve+0x524>
80408714:	0026e693          	ori	a3,a3,2
80408718:	ec0798e3          	bnez	a5,804085e8 <do_execve+0x630>
8040871c:	01700793          	li	a5,23
80408720:	00f12a23          	sw	a5,20(sp)
80408724:	ed9ff06f          	j	804085fc <do_execve+0x644>
80408728:	00078413          	mv	s0,a5
8040872c:	00042503          	lw	a0,0(s0)
80408730:	bb4fa0ef          	jal	ra,80402ae4 <kfree>
80408734:	ffc40793          	addi	a5,s0,-4
80408738:	fe8918e3          	bne	s2,s0,80408728 <do_execve+0x770>
8040873c:	000a8513          	mv	a0,s5
80408740:	a5cff0ef          	jal	ra,8040799c <do_exit>
80408744:	ffd00a93          	li	s5,-3
80408748:	a9dff06f          	j	804081e4 <do_execve+0x22c>
8040874c:	03012783          	lw	a5,48(sp)
80408750:	03c12a83          	lw	s5,60(sp)
80408754:	01578ab3          	add	s5,a5,s5
80408758:	0badfa63          	bgeu	s11,s10,8040880c <do_execve+0x854>
8040875c:	b7ba88e3          	beq	s5,s11,804082cc <do_execve+0x314>
80408760:	00001537          	lui	a0,0x1
80408764:	00ad8533          	add	a0,s11,a0
80408768:	41a50533          	sub	a0,a0,s10
8040876c:	41ba8cb3          	sub	s9,s5,s11
80408770:	01aae463          	bltu	s5,s10,80408778 <do_execve+0x7c0>
80408774:	41bd0cb3          	sub	s9,s10,s11
80408778:	00094797          	auipc	a5,0x94
8040877c:	09078793          	addi	a5,a5,144 # 8049c808 <pages>
80408780:	0007a783          	lw	a5,0(a5)
80408784:	0000e717          	auipc	a4,0xe
80408788:	9fc70713          	addi	a4,a4,-1540 # 80416180 <nbase>
8040878c:	00072683          	lw	a3,0(a4)
80408790:	00094717          	auipc	a4,0x94
80408794:	00870713          	addi	a4,a4,8 # 8049c798 <npage>
80408798:	00072603          	lw	a2,0(a4)
8040879c:	40fb87b3          	sub	a5,s7,a5
804087a0:	01812703          	lw	a4,24(sp)
804087a4:	4057d793          	srai	a5,a5,0x5
804087a8:	00d787b3          	add	a5,a5,a3
804087ac:	00e7f5b3          	and	a1,a5,a4
804087b0:	00c79693          	slli	a3,a5,0xc
804087b4:	16c5fc63          	bgeu	a1,a2,8040892c <do_execve+0x974>
804087b8:	00094797          	auipc	a5,0x94
804087bc:	04878793          	addi	a5,a5,72 # 8049c800 <va_pa_offset>
804087c0:	0007a783          	lw	a5,0(a5)
804087c4:	000c8613          	mv	a2,s9
804087c8:	00000593          	li	a1,0
804087cc:	00f687b3          	add	a5,a3,a5
804087d0:	00a78533          	add	a0,a5,a0
804087d4:	7e5090ef          	jal	ra,804127b8 <memset>
804087d8:	01bc8833          	add	a6,s9,s11
804087dc:	03aaf463          	bgeu	s5,s10,80408804 <do_execve+0x84c>
804087e0:	af0a86e3          	beq	s5,a6,804082cc <do_execve+0x314>
804087e4:	0000c697          	auipc	a3,0xc
804087e8:	ca068693          	addi	a3,a3,-864 # 80414484 <CSWTCH.69+0x47c>
804087ec:	0000a617          	auipc	a2,0xa
804087f0:	3fc60613          	addi	a2,a2,1020 # 80412be8 <commands+0x1bc>
804087f4:	2d100593          	li	a1,721
804087f8:	0000c517          	auipc	a0,0xc
804087fc:	10850513          	addi	a0,a0,264 # 80414900 <CSWTCH.69+0x8f8>
80408800:	e25f70ef          	jal	ra,80400624 <__panic>
80408804:	ffa810e3          	bne	a6,s10,804087e4 <do_execve+0x82c>
80408808:	000d0d93          	mv	s11,s10
8040880c:	00094c97          	auipc	s9,0x94
80408810:	ff4c8c93          	addi	s9,s9,-12 # 8049c800 <va_pa_offset>
80408814:	075dee63          	bltu	s11,s5,80408890 <do_execve+0x8d8>
80408818:	ab5ff06f          	j	804082cc <do_execve+0x314>
8040881c:	000017b7          	lui	a5,0x1
80408820:	41ad8533          	sub	a0,s11,s10
80408824:	00fd0d33          	add	s10,s10,a5
80408828:	41bd0633          	sub	a2,s10,s11
8040882c:	01aaf463          	bgeu	s5,s10,80408834 <do_execve+0x87c>
80408830:	41ba8633          	sub	a2,s5,s11
80408834:	00094797          	auipc	a5,0x94
80408838:	fd478793          	addi	a5,a5,-44 # 8049c808 <pages>
8040883c:	0007a683          	lw	a3,0(a5)
80408840:	0000e797          	auipc	a5,0xe
80408844:	94078793          	addi	a5,a5,-1728 # 80416180 <nbase>
80408848:	0007a583          	lw	a1,0(a5)
8040884c:	40db86b3          	sub	a3,s7,a3
80408850:	00094797          	auipc	a5,0x94
80408854:	f4878793          	addi	a5,a5,-184 # 8049c798 <npage>
80408858:	01812703          	lw	a4,24(sp)
8040885c:	4056d693          	srai	a3,a3,0x5
80408860:	0007a783          	lw	a5,0(a5)
80408864:	00b686b3          	add	a3,a3,a1
80408868:	00e6f5b3          	and	a1,a3,a4
8040886c:	00c69693          	slli	a3,a3,0xc
80408870:	0af5fe63          	bgeu	a1,a5,8040892c <do_execve+0x974>
80408874:	000ca783          	lw	a5,0(s9)
80408878:	00cd8db3          	add	s11,s11,a2
8040887c:	00000593          	li	a1,0
80408880:	00f686b3          	add	a3,a3,a5
80408884:	00a68533          	add	a0,a3,a0
80408888:	731090ef          	jal	ra,804127b8 <memset>
8040888c:	a55df0e3          	bgeu	s11,s5,804082cc <do_execve+0x314>
80408890:	00cb2503          	lw	a0,12(s6)
80408894:	01412603          	lw	a2,20(sp)
80408898:	000d0593          	mv	a1,s10
8040889c:	e61fa0ef          	jal	ra,804036fc <pgdir_alloc_page>
804088a0:	00050b93          	mv	s7,a0
804088a4:	f6051ce3          	bnez	a0,8040881c <do_execve+0x864>
804088a8:	ffc00a93          	li	s5,-4
804088ac:	e5dff06f          	j	80408708 <do_execve+0x750>
804088b0:	ffd00a93          	li	s5,-3
804088b4:	920b12e3          	bnez	s6,804081d8 <do_execve+0x220>
804088b8:	92dff06f          	j	804081e4 <do_execve+0x22c>
804088bc:	e80b04e3          	beqz	s6,80408744 <do_execve+0x78c>
804088c0:	01cb0513          	addi	a0,s6,28
804088c4:	835fc0ef          	jal	ra,804050f8 <up>
804088c8:	ffd00a93          	li	s5,-3
804088cc:	020b2423          	sw	zero,40(s6)
804088d0:	915ff06f          	j	804081e4 <do_execve+0x22c>
804088d4:	000d8793          	mv	a5,s11
804088d8:	e79ff06f          	j	80408750 <do_execve+0x798>
804088dc:	ff800a93          	li	s5,-8
804088e0:	e29ff06f          	j	80408708 <do_execve+0x750>
804088e4:	000a2783          	lw	a5,0(s4)
804088e8:	0047a583          	lw	a1,4(a5)
804088ec:	badff06f          	j	80408498 <do_execve+0x4e0>
804088f0:	09412783          	lw	a5,148(sp)
804088f4:	00269613          	slli	a2,a3,0x2
804088f8:	fffff737          	lui	a4,0xfffff
804088fc:	00e67733          	and	a4,a2,a4
80408900:	0000c517          	auipc	a0,0xc
80408904:	cd050513          	addi	a0,a0,-816 # 804145d0 <CSWTCH.69+0x5c8>
80408908:	00800637          	lui	a2,0x800
8040890c:	8f1f70ef          	jal	ra,804001fc <cprintf>
80408910:	b95ff06f          	j	804084a4 <do_execve+0x4ec>
80408914:	0000b617          	auipc	a2,0xb
80408918:	e7460613          	addi	a2,a2,-396 # 80413788 <default_pmm_manager+0x64>
8040891c:	2ed00593          	li	a1,749
80408920:	0000c517          	auipc	a0,0xc
80408924:	fe050513          	addi	a0,a0,-32 # 80414900 <CSWTCH.69+0x8f8>
80408928:	cfdf70ef          	jal	ra,80400624 <__panic>
8040892c:	0000b617          	auipc	a2,0xb
80408930:	e2860613          	addi	a2,a2,-472 # 80413754 <default_pmm_manager+0x30>
80408934:	06e00593          	li	a1,110
80408938:	0000b517          	auipc	a0,0xb
8040893c:	e4050513          	addi	a0,a0,-448 # 80413778 <default_pmm_manager+0x54>
80408940:	ce5f70ef          	jal	ra,80400624 <__panic>
80408944:	00078693          	mv	a3,a5
80408948:	0000b617          	auipc	a2,0xb
8040894c:	e0c60613          	addi	a2,a2,-500 # 80413754 <default_pmm_manager+0x30>
80408950:	06e00593          	li	a1,110
80408954:	0000b517          	auipc	a0,0xb
80408958:	e2450513          	addi	a0,a0,-476 # 80413778 <default_pmm_manager+0x54>
8040895c:	cc9f70ef          	jal	ra,80400624 <__panic>
80408960:	000c0a93          	mv	s5,s8
80408964:	ff4ff06f          	j	80408158 <do_execve+0x1a0>
80408968:	0000b617          	auipc	a2,0xb
8040896c:	e2060613          	addi	a2,a2,-480 # 80413788 <default_pmm_manager+0x64>
80408970:	07000593          	li	a1,112
80408974:	0000b517          	auipc	a0,0xb
80408978:	e0450513          	addi	a0,a0,-508 # 80413778 <default_pmm_manager+0x54>
8040897c:	ca9f70ef          	jal	ra,80400624 <__panic>
80408980:	0000b617          	auipc	a2,0xb
80408984:	e2c60613          	addi	a2,a2,-468 # 804137ac <default_pmm_manager+0x88>
80408988:	06900593          	li	a1,105
8040898c:	0000b517          	auipc	a0,0xb
80408990:	dec50513          	addi	a0,a0,-532 # 80413778 <default_pmm_manager+0x54>
80408994:	c91f70ef          	jal	ra,80400624 <__panic>
80408998:	0000c697          	auipc	a3,0xc
8040899c:	bf468693          	addi	a3,a3,-1036 # 8041458c <CSWTCH.69+0x584>
804089a0:	0000a617          	auipc	a2,0xa
804089a4:	24860613          	addi	a2,a2,584 # 80412be8 <commands+0x1bc>
804089a8:	2e900593          	li	a1,745
804089ac:	0000c517          	auipc	a0,0xc
804089b0:	f5450513          	addi	a0,a0,-172 # 80414900 <CSWTCH.69+0x8f8>
804089b4:	c71f70ef          	jal	ra,80400624 <__panic>
804089b8:	0000c697          	auipc	a3,0xc
804089bc:	b9068693          	addi	a3,a3,-1136 # 80414548 <CSWTCH.69+0x540>
804089c0:	0000a617          	auipc	a2,0xa
804089c4:	22860613          	addi	a2,a2,552 # 80412be8 <commands+0x1bc>
804089c8:	2e800593          	li	a1,744
804089cc:	0000c517          	auipc	a0,0xc
804089d0:	f3450513          	addi	a0,a0,-204 # 80414900 <CSWTCH.69+0x8f8>
804089d4:	c51f70ef          	jal	ra,80400624 <__panic>
804089d8:	0000c697          	auipc	a3,0xc
804089dc:	b2c68693          	addi	a3,a3,-1236 # 80414504 <CSWTCH.69+0x4fc>
804089e0:	0000a617          	auipc	a2,0xa
804089e4:	20860613          	addi	a2,a2,520 # 80412be8 <commands+0x1bc>
804089e8:	2e700593          	li	a1,743
804089ec:	0000c517          	auipc	a0,0xc
804089f0:	f1450513          	addi	a0,a0,-236 # 80414900 <CSWTCH.69+0x8f8>
804089f4:	c31f70ef          	jal	ra,80400624 <__panic>
804089f8:	0000c697          	auipc	a3,0xc
804089fc:	ac868693          	addi	a3,a3,-1336 # 804144c0 <CSWTCH.69+0x4b8>
80408a00:	0000a617          	auipc	a2,0xa
80408a04:	1e860613          	addi	a2,a2,488 # 80412be8 <commands+0x1bc>
80408a08:	2e600593          	li	a1,742
80408a0c:	0000c517          	auipc	a0,0xc
80408a10:	ef450513          	addi	a0,a0,-268 # 80414900 <CSWTCH.69+0x8f8>
80408a14:	c11f70ef          	jal	ra,80400624 <__panic>

80408a18 <do_yield>:
80408a18:	00094797          	auipc	a5,0x94
80408a1c:	d9478793          	addi	a5,a5,-620 # 8049c7ac <current>
80408a20:	0007a783          	lw	a5,0(a5)
80408a24:	00100713          	li	a4,1
80408a28:	00000513          	li	a0,0
80408a2c:	00e7a823          	sw	a4,16(a5)
80408a30:	00008067          	ret

80408a34 <do_wait>:
80408a34:	ff010113          	addi	sp,sp,-16
80408a38:	00812423          	sw	s0,8(sp)
80408a3c:	00912223          	sw	s1,4(sp)
80408a40:	00112623          	sw	ra,12(sp)
80408a44:	00058413          	mv	s0,a1
80408a48:	00050493          	mv	s1,a0
80408a4c:	02058263          	beqz	a1,80408a70 <do_wait+0x3c>
80408a50:	00094797          	auipc	a5,0x94
80408a54:	d5c78793          	addi	a5,a5,-676 # 8049c7ac <current>
80408a58:	0007a783          	lw	a5,0(a5)
80408a5c:	00100693          	li	a3,1
80408a60:	00400613          	li	a2,4
80408a64:	0187a503          	lw	a0,24(a5)
80408a68:	a10fc0ef          	jal	ra,80404c78 <user_mem_check>
80408a6c:	02050063          	beqz	a0,80408a8c <do_wait+0x58>
80408a70:	00040593          	mv	a1,s0
80408a74:	00812403          	lw	s0,8(sp)
80408a78:	00c12083          	lw	ra,12(sp)
80408a7c:	00048513          	mv	a0,s1
80408a80:	00412483          	lw	s1,4(sp)
80408a84:	01010113          	addi	sp,sp,16
80408a88:	950ff06f          	j	80407bd8 <do_wait.part.8>
80408a8c:	00c12083          	lw	ra,12(sp)
80408a90:	00812403          	lw	s0,8(sp)
80408a94:	00412483          	lw	s1,4(sp)
80408a98:	ffd00513          	li	a0,-3
80408a9c:	01010113          	addi	sp,sp,16
80408aa0:	00008067          	ret

80408aa4 <do_kill>:
80408aa4:	ff010113          	addi	sp,sp,-16
80408aa8:	00112623          	sw	ra,12(sp)
80408aac:	00812423          	sw	s0,8(sp)
80408ab0:	865fe0ef          	jal	ra,80407314 <find_proc>
80408ab4:	04050c63          	beqz	a0,80408b0c <do_kill+0x68>
80408ab8:	05c52703          	lw	a4,92(a0)
80408abc:	00177693          	andi	a3,a4,1
80408ac0:	04069263          	bnez	a3,80408b04 <do_kill+0x60>
80408ac4:	0a852683          	lw	a3,168(a0)
80408ac8:	00176713          	ori	a4,a4,1
80408acc:	04e52e23          	sw	a4,92(a0)
80408ad0:	00000413          	li	s0,0
80408ad4:	0006cc63          	bltz	a3,80408aec <do_kill+0x48>
80408ad8:	00040513          	mv	a0,s0
80408adc:	00c12083          	lw	ra,12(sp)
80408ae0:	00812403          	lw	s0,8(sp)
80408ae4:	01010113          	addi	sp,sp,16
80408ae8:	00008067          	ret
80408aec:	691030ef          	jal	ra,8040c97c <wakeup_proc>
80408af0:	00040513          	mv	a0,s0
80408af4:	00c12083          	lw	ra,12(sp)
80408af8:	00812403          	lw	s0,8(sp)
80408afc:	01010113          	addi	sp,sp,16
80408b00:	00008067          	ret
80408b04:	ff700413          	li	s0,-9
80408b08:	fd1ff06f          	j	80408ad8 <do_kill+0x34>
80408b0c:	ffd00413          	li	s0,-3
80408b10:	fc9ff06f          	j	80408ad8 <do_kill+0x34>

80408b14 <proc_init>:
80408b14:	00002737          	lui	a4,0x2
80408b18:	00094797          	auipc	a5,0x94
80408b1c:	d9c78793          	addi	a5,a5,-612 # 8049c8b4 <proc_list>
80408b20:	ff010113          	addi	sp,sp,-16
80408b24:	00090697          	auipc	a3,0x90
80408b28:	52e6a023          	sw	a4,1312(a3) # 80499044 <last_pid>
80408b2c:	00090697          	auipc	a3,0x90
80408b30:	50e6ae23          	sw	a4,1308(a3) # 80499048 <next_safe>
80408b34:	00094717          	auipc	a4,0x94
80408b38:	d8f72223          	sw	a5,-636(a4) # 8049c8b8 <proc_list+0x4>
80408b3c:	00094717          	auipc	a4,0x94
80408b40:	d6f72c23          	sw	a5,-648(a4) # 8049c8b4 <proc_list>
80408b44:	00112623          	sw	ra,12(sp)
80408b48:	00812423          	sw	s0,8(sp)
80408b4c:	00912223          	sw	s1,4(sp)
80408b50:	01212023          	sw	s2,0(sp)
80408b54:	00091797          	auipc	a5,0x91
80408b58:	bf478793          	addi	a5,a5,-1036 # 80499748 <hash_list>
80408b5c:	00093717          	auipc	a4,0x93
80408b60:	bec70713          	addi	a4,a4,-1044 # 8049b748 <__rq>
80408b64:	00f7a223          	sw	a5,4(a5)
80408b68:	00f7a023          	sw	a5,0(a5)
80408b6c:	00878793          	addi	a5,a5,8
80408b70:	fee79ae3          	bne	a5,a4,80408b64 <proc_init+0x50>
80408b74:	b64fe0ef          	jal	ra,80406ed8 <alloc_proc>
80408b78:	00094797          	auipc	a5,0x94
80408b7c:	c2a7ac23          	sw	a0,-968(a5) # 8049c7b0 <idleproc>
80408b80:	00050413          	mv	s0,a0
80408b84:	00094497          	auipc	s1,0x94
80408b88:	c2c48493          	addi	s1,s1,-980 # 8049c7b0 <idleproc>
80408b8c:	0e050263          	beqz	a0,80408c70 <proc_init+0x15c>
80408b90:	00200793          	li	a5,2
80408b94:	00f52023          	sw	a5,0(a0)
80408b98:	00100913          	li	s2,1
80408b9c:	0000e797          	auipc	a5,0xe
80408ba0:	46478793          	addi	a5,a5,1124 # 80417000 <bootstack>
80408ba4:	00052223          	sw	zero,4(a0)
80408ba8:	00f52623          	sw	a5,12(a0)
80408bac:	01252823          	sw	s2,16(a0)
80408bb0:	ec4fd0ef          	jal	ra,80406274 <files_create>
80408bb4:	0ca42e23          	sw	a0,220(s0)
80408bb8:	12050463          	beqz	a0,80408ce0 <proc_init+0x1cc>
80408bbc:	0004a503          	lw	a0,0(s1)
80408bc0:	0000c597          	auipc	a1,0xc
80408bc4:	c7c58593          	addi	a1,a1,-900 # 8041483c <CSWTCH.69+0x834>
80408bc8:	0dc52703          	lw	a4,220(a0)
80408bcc:	00872783          	lw	a5,8(a4)
80408bd0:	00178793          	addi	a5,a5,1
80408bd4:	00f72423          	sw	a5,8(a4)
80408bd8:	e50fe0ef          	jal	ra,80407228 <set_proc_name>
80408bdc:	00094797          	auipc	a5,0x94
80408be0:	bdc78793          	addi	a5,a5,-1060 # 8049c7b8 <nr_process>
80408be4:	0007a783          	lw	a5,0(a5)
80408be8:	0004a703          	lw	a4,0(s1)
80408bec:	00000613          	li	a2,0
80408bf0:	00178793          	addi	a5,a5,1
80408bf4:	00000593          	li	a1,0
80408bf8:	fffff517          	auipc	a0,0xfffff
80408bfc:	22450513          	addi	a0,a0,548 # 80407e1c <init_main>
80408c00:	00094697          	auipc	a3,0x94
80408c04:	baf6ac23          	sw	a5,-1096(a3) # 8049c7b8 <nr_process>
80408c08:	00094797          	auipc	a5,0x94
80408c0c:	bae7a223          	sw	a4,-1116(a5) # 8049c7ac <current>
80408c10:	d11fe0ef          	jal	ra,80407920 <kernel_thread>
80408c14:	0aa05a63          	blez	a0,80408cc8 <proc_init+0x1b4>
80408c18:	efcfe0ef          	jal	ra,80407314 <find_proc>
80408c1c:	0000c597          	auipc	a1,0xc
80408c20:	c4458593          	addi	a1,a1,-956 # 80414860 <CSWTCH.69+0x858>
80408c24:	00094797          	auipc	a5,0x94
80408c28:	b8a7a823          	sw	a0,-1136(a5) # 8049c7b4 <initproc>
80408c2c:	dfcfe0ef          	jal	ra,80407228 <set_proc_name>
80408c30:	0004a783          	lw	a5,0(s1)
80408c34:	06078a63          	beqz	a5,80408ca8 <proc_init+0x194>
80408c38:	0047a783          	lw	a5,4(a5)
80408c3c:	06079663          	bnez	a5,80408ca8 <proc_init+0x194>
80408c40:	00094797          	auipc	a5,0x94
80408c44:	b7478793          	addi	a5,a5,-1164 # 8049c7b4 <initproc>
80408c48:	0007a783          	lw	a5,0(a5)
80408c4c:	02078e63          	beqz	a5,80408c88 <proc_init+0x174>
80408c50:	0047a783          	lw	a5,4(a5)
80408c54:	03279a63          	bne	a5,s2,80408c88 <proc_init+0x174>
80408c58:	00c12083          	lw	ra,12(sp)
80408c5c:	00812403          	lw	s0,8(sp)
80408c60:	00412483          	lw	s1,4(sp)
80408c64:	00012903          	lw	s2,0(sp)
80408c68:	01010113          	addi	sp,sp,16
80408c6c:	00008067          	ret
80408c70:	0000c617          	auipc	a2,0xc
80408c74:	b9060613          	addi	a2,a2,-1136 # 80414800 <CSWTCH.69+0x7f8>
80408c78:	44c00593          	li	a1,1100
80408c7c:	0000c517          	auipc	a0,0xc
80408c80:	c8450513          	addi	a0,a0,-892 # 80414900 <CSWTCH.69+0x8f8>
80408c84:	9a1f70ef          	jal	ra,80400624 <__panic>
80408c88:	0000c697          	auipc	a3,0xc
80408c8c:	c0868693          	addi	a3,a3,-1016 # 80414890 <CSWTCH.69+0x888>
80408c90:	0000a617          	auipc	a2,0xa
80408c94:	f5860613          	addi	a2,a2,-168 # 80412be8 <commands+0x1bc>
80408c98:	46700593          	li	a1,1127
80408c9c:	0000c517          	auipc	a0,0xc
80408ca0:	c6450513          	addi	a0,a0,-924 # 80414900 <CSWTCH.69+0x8f8>
80408ca4:	981f70ef          	jal	ra,80400624 <__panic>
80408ca8:	0000c697          	auipc	a3,0xc
80408cac:	bc068693          	addi	a3,a3,-1088 # 80414868 <CSWTCH.69+0x860>
80408cb0:	0000a617          	auipc	a2,0xa
80408cb4:	f3860613          	addi	a2,a2,-200 # 80412be8 <commands+0x1bc>
80408cb8:	46600593          	li	a1,1126
80408cbc:	0000c517          	auipc	a0,0xc
80408cc0:	c4450513          	addi	a0,a0,-956 # 80414900 <CSWTCH.69+0x8f8>
80408cc4:	961f70ef          	jal	ra,80400624 <__panic>
80408cc8:	0000c617          	auipc	a2,0xc
80408ccc:	b7c60613          	addi	a2,a2,-1156 # 80414844 <CSWTCH.69+0x83c>
80408cd0:	46000593          	li	a1,1120
80408cd4:	0000c517          	auipc	a0,0xc
80408cd8:	c2c50513          	addi	a0,a0,-980 # 80414900 <CSWTCH.69+0x8f8>
80408cdc:	949f70ef          	jal	ra,80400624 <__panic>
80408ce0:	0000c617          	auipc	a2,0xc
80408ce4:	b3860613          	addi	a2,a2,-1224 # 80414818 <CSWTCH.69+0x810>
80408ce8:	45500593          	li	a1,1109
80408cec:	0000c517          	auipc	a0,0xc
80408cf0:	c1450513          	addi	a0,a0,-1004 # 80414900 <CSWTCH.69+0x8f8>
80408cf4:	931f70ef          	jal	ra,80400624 <__panic>

80408cf8 <cpu_idle>:
80408cf8:	ff010113          	addi	sp,sp,-16
80408cfc:	00812423          	sw	s0,8(sp)
80408d00:	00112623          	sw	ra,12(sp)
80408d04:	00094417          	auipc	s0,0x94
80408d08:	aa840413          	addi	s0,s0,-1368 # 8049c7ac <current>
80408d0c:	00042703          	lw	a4,0(s0)
80408d10:	01072783          	lw	a5,16(a4)
80408d14:	fe078ee3          	beqz	a5,80408d10 <cpu_idle+0x18>
80408d18:	561030ef          	jal	ra,8040ca78 <schedule>
80408d1c:	ff1ff06f          	j	80408d0c <cpu_idle+0x14>

80408d20 <lab6_set_priority>:
80408d20:	00094797          	auipc	a5,0x94
80408d24:	a8c78793          	addi	a5,a5,-1396 # 8049c7ac <current>
80408d28:	0007a783          	lw	a5,0(a5)
80408d2c:	00051863          	bnez	a0,80408d3c <lab6_set_priority+0x1c>
80408d30:	00100713          	li	a4,1
80408d34:	0ce7ac23          	sw	a4,216(a5)
80408d38:	00008067          	ret
80408d3c:	0ca7ac23          	sw	a0,216(a5)
80408d40:	00008067          	ret

80408d44 <do_sleep>:
80408d44:	08050063          	beqz	a0,80408dc4 <do_sleep+0x80>
80408d48:	fe010113          	addi	sp,sp,-32
80408d4c:	00812c23          	sw	s0,24(sp)
80408d50:	00112e23          	sw	ra,28(sp)
80408d54:	00050413          	mv	s0,a0
80408d58:	100027f3          	csrr	a5,sstatus
80408d5c:	0027f793          	andi	a5,a5,2
80408d60:	06079663          	bnez	a5,80408dcc <do_sleep+0x88>
80408d64:	00094797          	auipc	a5,0x94
80408d68:	a4878793          	addi	a5,a5,-1464 # 8049c7ac <current>
80408d6c:	0007a783          	lw	a5,0(a5)
80408d70:	00810713          	addi	a4,sp,8
80408d74:	00a12023          	sw	a0,0(sp)
80408d78:	00e12623          	sw	a4,12(sp)
80408d7c:	00e12423          	sw	a4,8(sp)
80408d80:	00f12223          	sw	a5,4(sp)
80408d84:	00100713          	li	a4,1
80408d88:	00e7a023          	sw	a4,0(a5)
80408d8c:	80000737          	lui	a4,0x80000
80408d90:	00010413          	mv	s0,sp
80408d94:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
80408d98:	0ae7a423          	sw	a4,168(a5)
80408d9c:	00040513          	mv	a0,s0
80408da0:	609030ef          	jal	ra,8040cba8 <add_timer>
80408da4:	4d5030ef          	jal	ra,8040ca78 <schedule>
80408da8:	00040513          	mv	a0,s0
80408dac:	709030ef          	jal	ra,8040ccb4 <del_timer>
80408db0:	01c12083          	lw	ra,28(sp)
80408db4:	01812403          	lw	s0,24(sp)
80408db8:	00000513          	li	a0,0
80408dbc:	02010113          	addi	sp,sp,32
80408dc0:	00008067          	ret
80408dc4:	00000513          	li	a0,0
80408dc8:	00008067          	ret
80408dcc:	e51f70ef          	jal	ra,80400c1c <intr_disable>
80408dd0:	00094797          	auipc	a5,0x94
80408dd4:	9dc78793          	addi	a5,a5,-1572 # 8049c7ac <current>
80408dd8:	0007a783          	lw	a5,0(a5)
80408ddc:	00810713          	addi	a4,sp,8
80408de0:	00812023          	sw	s0,0(sp)
80408de4:	00f12223          	sw	a5,4(sp)
80408de8:	00e12623          	sw	a4,12(sp)
80408dec:	00e12423          	sw	a4,8(sp)
80408df0:	00100713          	li	a4,1
80408df4:	00e7a023          	sw	a4,0(a5)
80408df8:	80000737          	lui	a4,0x80000
80408dfc:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
80408e00:	00010413          	mv	s0,sp
80408e04:	00040513          	mv	a0,s0
80408e08:	0ae7a423          	sw	a4,168(a5)
80408e0c:	59d030ef          	jal	ra,8040cba8 <add_timer>
80408e10:	e05f70ef          	jal	ra,80400c14 <intr_enable>
80408e14:	f91ff06f          	j	80408da4 <do_sleep+0x60>

80408e18 <switch_to>:
80408e18:	00152023          	sw	ra,0(a0)
80408e1c:	00252223          	sw	sp,4(a0)
80408e20:	00852423          	sw	s0,8(a0)
80408e24:	00952623          	sw	s1,12(a0)
80408e28:	01252823          	sw	s2,16(a0)
80408e2c:	01352a23          	sw	s3,20(a0)
80408e30:	01452c23          	sw	s4,24(a0)
80408e34:	01552e23          	sw	s5,28(a0)
80408e38:	03652023          	sw	s6,32(a0)
80408e3c:	03752223          	sw	s7,36(a0)
80408e40:	03852423          	sw	s8,40(a0)
80408e44:	03952623          	sw	s9,44(a0)
80408e48:	03a52823          	sw	s10,48(a0)
80408e4c:	03b52a23          	sw	s11,52(a0)
80408e50:	0005a083          	lw	ra,0(a1)
80408e54:	0045a103          	lw	sp,4(a1)
80408e58:	0085a403          	lw	s0,8(a1)
80408e5c:	00c5a483          	lw	s1,12(a1)
80408e60:	0105a903          	lw	s2,16(a1)
80408e64:	0145a983          	lw	s3,20(a1)
80408e68:	0185aa03          	lw	s4,24(a1)
80408e6c:	01c5aa83          	lw	s5,28(a1)
80408e70:	0205ab03          	lw	s6,32(a1)
80408e74:	0245ab83          	lw	s7,36(a1)
80408e78:	0285ac03          	lw	s8,40(a1)
80408e7c:	02c5ac83          	lw	s9,44(a1)
80408e80:	0305ad03          	lw	s10,48(a1)
80408e84:	0345ad83          	lw	s11,52(a1)
80408e88:	00008067          	ret

80408e8c <proc_stride_comp_f>:
80408e8c:	00c52503          	lw	a0,12(a0)
80408e90:	00c5a783          	lw	a5,12(a1)
80408e94:	40f50533          	sub	a0,a0,a5
80408e98:	00a04863          	bgtz	a0,80408ea8 <proc_stride_comp_f+0x1c>
80408e9c:	00a03533          	snez	a0,a0
80408ea0:	40a00533          	neg	a0,a0
80408ea4:	00008067          	ret
80408ea8:	00100513          	li	a0,1
80408eac:	00008067          	ret

80408eb0 <stride_init>:
80408eb0:	00a52223          	sw	a0,4(a0)
80408eb4:	00a52023          	sw	a0,0(a0)
80408eb8:	00052823          	sw	zero,16(a0)
80408ebc:	00052423          	sw	zero,8(a0)
80408ec0:	00008067          	ret

80408ec4 <stride_pick_next>:
80408ec4:	ff010113          	addi	sp,sp,-16
80408ec8:	00812423          	sw	s0,8(sp)
80408ecc:	01052403          	lw	s0,16(a0)
80408ed0:	00112623          	sw	ra,12(sp)
80408ed4:	00912223          	sw	s1,4(sp)
80408ed8:	01212023          	sw	s2,0(sp)
80408edc:	04040263          	beqz	s0,80408f20 <stride_pick_next+0x5c>
80408ee0:	01042583          	lw	a1,16(s0)
80408ee4:	f3840913          	addi	s2,s0,-200
80408ee8:	00c42483          	lw	s1,12(s0)
80408eec:	40000537          	lui	a0,0x40000
80408ef0:	02059463          	bnez	a1,80408f18 <stride_pick_next+0x54>
80408ef4:	00a484b3          	add	s1,s1,a0
80408ef8:	00942623          	sw	s1,12(s0)
80408efc:	00c12083          	lw	ra,12(sp)
80408f00:	00812403          	lw	s0,8(sp)
80408f04:	00090513          	mv	a0,s2
80408f08:	00412483          	lw	s1,4(sp)
80408f0c:	00012903          	lw	s2,0(sp)
80408f10:	01010113          	addi	sp,sp,16
80408f14:	00008067          	ret
80408f18:	161090ef          	jal	ra,80412878 <__udivsi3>
80408f1c:	fd9ff06f          	j	80408ef4 <stride_pick_next+0x30>
80408f20:	00000913          	li	s2,0
80408f24:	fd9ff06f          	j	80408efc <stride_pick_next+0x38>

80408f28 <stride_proc_tick>:
80408f28:	0c45a783          	lw	a5,196(a1)
80408f2c:	00f05663          	blez	a5,80408f38 <stride_proc_tick+0x10>
80408f30:	fff78793          	addi	a5,a5,-1
80408f34:	0cf5a223          	sw	a5,196(a1)
80408f38:	00079663          	bnez	a5,80408f44 <stride_proc_tick+0x1c>
80408f3c:	00100793          	li	a5,1
80408f40:	00f5a823          	sw	a5,16(a1)
80408f44:	00008067          	ret

80408f48 <skew_heap_merge.constprop.3>:
80408f48:	ff010113          	addi	sp,sp,-16
80408f4c:	00812423          	sw	s0,8(sp)
80408f50:	00112623          	sw	ra,12(sp)
80408f54:	00912223          	sw	s1,4(sp)
80408f58:	01212023          	sw	s2,0(sp)
80408f5c:	00058413          	mv	s0,a1
80408f60:	02050c63          	beqz	a0,80408f98 <skew_heap_merge.constprop.3+0x50>
80408f64:	00050493          	mv	s1,a0
80408f68:	06058663          	beqz	a1,80408fd4 <skew_heap_merge.constprop.3+0x8c>
80408f6c:	f21ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80408f70:	fff00793          	li	a5,-1
80408f74:	04f50063          	beq	a0,a5,80408fb4 <skew_heap_merge.constprop.3+0x6c>
80408f78:	00842583          	lw	a1,8(s0)
80408f7c:	00442903          	lw	s2,4(s0)
80408f80:	00048513          	mv	a0,s1
80408f84:	fc5ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80408f88:	00a42223          	sw	a0,4(s0)
80408f8c:	01242423          	sw	s2,8(s0)
80408f90:	00050463          	beqz	a0,80408f98 <skew_heap_merge.constprop.3+0x50>
80408f94:	00852023          	sw	s0,0(a0) # 40000000 <_binary_bin_sfs_img_size+0x3ff88000>
80408f98:	00040513          	mv	a0,s0
80408f9c:	00c12083          	lw	ra,12(sp)
80408fa0:	00812403          	lw	s0,8(sp)
80408fa4:	00412483          	lw	s1,4(sp)
80408fa8:	00012903          	lw	s2,0(sp)
80408fac:	01010113          	addi	sp,sp,16
80408fb0:	00008067          	ret
80408fb4:	0084a503          	lw	a0,8(s1)
80408fb8:	0044a903          	lw	s2,4(s1)
80408fbc:	00040593          	mv	a1,s0
80408fc0:	f89ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80408fc4:	00a4a223          	sw	a0,4(s1)
80408fc8:	0124a423          	sw	s2,8(s1)
80408fcc:	00050463          	beqz	a0,80408fd4 <skew_heap_merge.constprop.3+0x8c>
80408fd0:	00952023          	sw	s1,0(a0)
80408fd4:	00c12083          	lw	ra,12(sp)
80408fd8:	00812403          	lw	s0,8(sp)
80408fdc:	00048513          	mv	a0,s1
80408fe0:	00012903          	lw	s2,0(sp)
80408fe4:	00412483          	lw	s1,4(sp)
80408fe8:	01010113          	addi	sp,sp,16
80408fec:	00008067          	ret

80408ff0 <stride_enqueue>:
80408ff0:	fb010113          	addi	sp,sp,-80
80408ff4:	03312e23          	sw	s3,60(sp)
80408ff8:	01052983          	lw	s3,16(a0)
80408ffc:	04812423          	sw	s0,72(sp)
80409000:	04912223          	sw	s1,68(sp)
80409004:	05212023          	sw	s2,64(sp)
80409008:	04112623          	sw	ra,76(sp)
8040900c:	03412c23          	sw	s4,56(sp)
80409010:	03512a23          	sw	s5,52(sp)
80409014:	03612823          	sw	s6,48(sp)
80409018:	03712623          	sw	s7,44(sp)
8040901c:	03812423          	sw	s8,40(sp)
80409020:	03912223          	sw	s9,36(sp)
80409024:	03a12023          	sw	s10,32(sp)
80409028:	01b12e23          	sw	s11,28(sp)
8040902c:	0c05a423          	sw	zero,200(a1)
80409030:	0c05a823          	sw	zero,208(a1)
80409034:	0c05a623          	sw	zero,204(a1)
80409038:	00050493          	mv	s1,a0
8040903c:	00058413          	mv	s0,a1
80409040:	0c858913          	addi	s2,a1,200
80409044:	02098463          	beqz	s3,8040906c <stride_enqueue+0x7c>
80409048:	0c090c63          	beqz	s2,80409120 <stride_enqueue+0x130>
8040904c:	00090593          	mv	a1,s2
80409050:	00098513          	mv	a0,s3
80409054:	e39ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409058:	fff00793          	li	a5,-1
8040905c:	00050a13          	mv	s4,a0
80409060:	06f50a63          	beq	a0,a5,804090d4 <stride_enqueue+0xe4>
80409064:	0d342623          	sw	s3,204(s0)
80409068:	0129a023          	sw	s2,0(s3)
8040906c:	0c442783          	lw	a5,196(s0)
80409070:	0124a823          	sw	s2,16(s1)
80409074:	00c4a703          	lw	a4,12(s1)
80409078:	04079a63          	bnez	a5,804090cc <stride_enqueue+0xdc>
8040907c:	0ce42223          	sw	a4,196(s0)
80409080:	0084a783          	lw	a5,8(s1)
80409084:	04c12083          	lw	ra,76(sp)
80409088:	0a942c23          	sw	s1,184(s0)
8040908c:	04812403          	lw	s0,72(sp)
80409090:	00178793          	addi	a5,a5,1
80409094:	00f4a423          	sw	a5,8(s1)
80409098:	04012903          	lw	s2,64(sp)
8040909c:	04412483          	lw	s1,68(sp)
804090a0:	03c12983          	lw	s3,60(sp)
804090a4:	03812a03          	lw	s4,56(sp)
804090a8:	03412a83          	lw	s5,52(sp)
804090ac:	03012b03          	lw	s6,48(sp)
804090b0:	02c12b83          	lw	s7,44(sp)
804090b4:	02812c03          	lw	s8,40(sp)
804090b8:	02412c83          	lw	s9,36(sp)
804090bc:	02012d03          	lw	s10,32(sp)
804090c0:	01c12d83          	lw	s11,28(sp)
804090c4:	05010113          	addi	sp,sp,80
804090c8:	00008067          	ret
804090cc:	faf75ae3          	bge	a4,a5,80409080 <stride_enqueue+0x90>
804090d0:	fadff06f          	j	8040907c <stride_enqueue+0x8c>
804090d4:	0089aa83          	lw	s5,8(s3)
804090d8:	0049ab03          	lw	s6,4(s3)
804090dc:	020a8063          	beqz	s5,804090fc <stride_enqueue+0x10c>
804090e0:	00090593          	mv	a1,s2
804090e4:	000a8513          	mv	a0,s5
804090e8:	da5ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804090ec:	00050b93          	mv	s7,a0
804090f0:	05450463          	beq	a0,s4,80409138 <stride_enqueue+0x148>
804090f4:	0d542623          	sw	s5,204(s0)
804090f8:	012aa023          	sw	s2,0(s5)
804090fc:	0129a223          	sw	s2,4(s3)
80409100:	0169a423          	sw	s6,8(s3)
80409104:	0c442783          	lw	a5,196(s0)
80409108:	01392023          	sw	s3,0(s2)
8040910c:	00098913          	mv	s2,s3
80409110:	0124a823          	sw	s2,16(s1)
80409114:	00c4a703          	lw	a4,12(s1)
80409118:	f60782e3          	beqz	a5,8040907c <stride_enqueue+0x8c>
8040911c:	fb1ff06f          	j	804090cc <stride_enqueue+0xdc>
80409120:	0c442783          	lw	a5,196(s0)
80409124:	00098913          	mv	s2,s3
80409128:	0124a823          	sw	s2,16(s1)
8040912c:	00c4a703          	lw	a4,12(s1)
80409130:	f40786e3          	beqz	a5,8040907c <stride_enqueue+0x8c>
80409134:	f99ff06f          	j	804090cc <stride_enqueue+0xdc>
80409138:	008aaa03          	lw	s4,8(s5)
8040913c:	004aac03          	lw	s8,4(s5)
80409140:	020a0063          	beqz	s4,80409160 <stride_enqueue+0x170>
80409144:	00090593          	mv	a1,s2
80409148:	000a0513          	mv	a0,s4
8040914c:	d41ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409150:	00050c93          	mv	s9,a0
80409154:	03750063          	beq	a0,s7,80409174 <stride_enqueue+0x184>
80409158:	0d442623          	sw	s4,204(s0)
8040915c:	012a2023          	sw	s2,0(s4)
80409160:	012aa223          	sw	s2,4(s5)
80409164:	018aa423          	sw	s8,8(s5)
80409168:	01592023          	sw	s5,0(s2)
8040916c:	000a8913          	mv	s2,s5
80409170:	f8dff06f          	j	804090fc <stride_enqueue+0x10c>
80409174:	008a2b83          	lw	s7,8(s4)
80409178:	004a2d03          	lw	s10,4(s4)
8040917c:	000b8e63          	beqz	s7,80409198 <stride_enqueue+0x1a8>
80409180:	00090593          	mv	a1,s2
80409184:	000b8513          	mv	a0,s7
80409188:	d05ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040918c:	03950063          	beq	a0,s9,804091ac <stride_enqueue+0x1bc>
80409190:	0d742623          	sw	s7,204(s0)
80409194:	012ba023          	sw	s2,0(s7)
80409198:	012a2223          	sw	s2,4(s4)
8040919c:	01aa2423          	sw	s10,8(s4)
804091a0:	01492023          	sw	s4,0(s2)
804091a4:	000a0913          	mv	s2,s4
804091a8:	fb9ff06f          	j	80409160 <stride_enqueue+0x170>
804091ac:	008bac83          	lw	s9,8(s7)
804091b0:	004bad83          	lw	s11,4(s7)
804091b4:	020c8063          	beqz	s9,804091d4 <stride_enqueue+0x1e4>
804091b8:	00090593          	mv	a1,s2
804091bc:	000c8513          	mv	a0,s9
804091c0:	ccdff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804091c4:	fff00793          	li	a5,-1
804091c8:	02f50063          	beq	a0,a5,804091e8 <stride_enqueue+0x1f8>
804091cc:	0d942623          	sw	s9,204(s0)
804091d0:	012ca023          	sw	s2,0(s9)
804091d4:	012ba223          	sw	s2,4(s7)
804091d8:	01bba423          	sw	s11,8(s7)
804091dc:	01792023          	sw	s7,0(s2)
804091e0:	000b8913          	mv	s2,s7
804091e4:	fb5ff06f          	j	80409198 <stride_enqueue+0x1a8>
804091e8:	004ca783          	lw	a5,4(s9)
804091ec:	008ca503          	lw	a0,8(s9)
804091f0:	00090593          	mv	a1,s2
804091f4:	00f12623          	sw	a5,12(sp)
804091f8:	d51ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
804091fc:	00c12783          	lw	a5,12(sp)
80409200:	00aca223          	sw	a0,4(s9)
80409204:	00fca423          	sw	a5,8(s9)
80409208:	00050863          	beqz	a0,80409218 <stride_enqueue+0x228>
8040920c:	01952023          	sw	s9,0(a0)
80409210:	000c8913          	mv	s2,s9
80409214:	fc1ff06f          	j	804091d4 <stride_enqueue+0x1e4>
80409218:	000c8913          	mv	s2,s9
8040921c:	fb9ff06f          	j	804091d4 <stride_enqueue+0x1e4>

80409220 <stride_dequeue>:
80409220:	0b85a783          	lw	a5,184(a1)
80409224:	fa010113          	addi	sp,sp,-96
80409228:	04112e23          	sw	ra,92(sp)
8040922c:	04812c23          	sw	s0,88(sp)
80409230:	04912a23          	sw	s1,84(sp)
80409234:	05212823          	sw	s2,80(sp)
80409238:	05312623          	sw	s3,76(sp)
8040923c:	05412423          	sw	s4,72(sp)
80409240:	05512223          	sw	s5,68(sp)
80409244:	05612023          	sw	s6,64(sp)
80409248:	03712e23          	sw	s7,60(sp)
8040924c:	03812c23          	sw	s8,56(sp)
80409250:	03912a23          	sw	s9,52(sp)
80409254:	03a12823          	sw	s10,48(sp)
80409258:	03b12623          	sw	s11,44(sp)
8040925c:	00a78463          	beq	a5,a0,80409264 <stride_dequeue+0x44>
80409260:	2790206f          	j	8040bcd8 <stride_dequeue+0x2ab8>
80409264:	00852983          	lw	s3,8(a0)
80409268:	00050c13          	mv	s8,a0
8040926c:	00098b13          	mv	s6,s3
80409270:	00099463          	bnez	s3,80409278 <stride_dequeue+0x58>
80409274:	2650206f          	j	8040bcd8 <stride_dequeue+0x2ab8>
80409278:	0cc5a903          	lw	s2,204(a1)
8040927c:	00058493          	mv	s1,a1
80409280:	01052a83          	lw	s5,16(a0)
80409284:	0c85ad03          	lw	s10,200(a1)
80409288:	0d05a403          	lw	s0,208(a1)
8040928c:	3c090e63          	beqz	s2,80409668 <stride_dequeue+0x448>
80409290:	58040c63          	beqz	s0,80409828 <stride_dequeue+0x608>
80409294:	00040593          	mv	a1,s0
80409298:	00090513          	mv	a0,s2
8040929c:	bf1ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804092a0:	fff00c93          	li	s9,-1
804092a4:	00050a13          	mv	s4,a0
804092a8:	21950663          	beq	a0,s9,804094b4 <stride_dequeue+0x294>
804092ac:	00842a03          	lw	s4,8(s0)
804092b0:	00442b83          	lw	s7,4(s0)
804092b4:	180a0a63          	beqz	s4,80409448 <stride_dequeue+0x228>
804092b8:	000a0593          	mv	a1,s4
804092bc:	00090513          	mv	a0,s2
804092c0:	bcdff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804092c4:	3b950e63          	beq	a0,s9,80409680 <stride_dequeue+0x460>
804092c8:	004a2783          	lw	a5,4(s4)
804092cc:	008a2d83          	lw	s11,8(s4)
804092d0:	00f12023          	sw	a5,0(sp)
804092d4:	160d8063          	beqz	s11,80409434 <stride_dequeue+0x214>
804092d8:	000d8593          	mv	a1,s11
804092dc:	00090513          	mv	a0,s2
804092e0:	badff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804092e4:	2b9500e3          	beq	a0,s9,80409d84 <stride_dequeue+0xb64>
804092e8:	004da783          	lw	a5,4(s11)
804092ec:	008dac83          	lw	s9,8(s11)
804092f0:	00f12223          	sw	a5,4(sp)
804092f4:	120c8663          	beqz	s9,80409420 <stride_dequeue+0x200>
804092f8:	000c8593          	mv	a1,s9
804092fc:	00090513          	mv	a0,s2
80409300:	b8dff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409304:	fff00893          	li	a7,-1
80409308:	171504e3          	beq	a0,a7,80409c70 <stride_dequeue+0xa50>
8040930c:	004ca783          	lw	a5,4(s9)
80409310:	008ca803          	lw	a6,8(s9)
80409314:	00f12423          	sw	a5,8(sp)
80409318:	0e080a63          	beqz	a6,8040940c <stride_dequeue+0x1ec>
8040931c:	00080593          	mv	a1,a6
80409320:	00090513          	mv	a0,s2
80409324:	01012623          	sw	a6,12(sp)
80409328:	b65ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040932c:	fff00893          	li	a7,-1
80409330:	00c12803          	lw	a6,12(sp)
80409334:	01151463          	bne	a0,a7,8040933c <stride_dequeue+0x11c>
80409338:	02c0106f          	j	8040a364 <stride_dequeue+0x1144>
8040933c:	00482703          	lw	a4,4(a6) # fffff004 <end+0x7fb62748>
80409340:	00882783          	lw	a5,8(a6)
80409344:	00e12623          	sw	a4,12(sp)
80409348:	0a078863          	beqz	a5,804093f8 <stride_dequeue+0x1d8>
8040934c:	00078593          	mv	a1,a5
80409350:	00090513          	mv	a0,s2
80409354:	01012a23          	sw	a6,20(sp)
80409358:	00f12823          	sw	a5,16(sp)
8040935c:	b31ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409360:	fff00893          	li	a7,-1
80409364:	01012783          	lw	a5,16(sp)
80409368:	01412803          	lw	a6,20(sp)
8040936c:	01151463          	bne	a0,a7,80409374 <stride_dequeue+0x154>
80409370:	7900106f          	j	8040ab00 <stride_dequeue+0x18e0>
80409374:	0047a703          	lw	a4,4(a5)
80409378:	0087ab03          	lw	s6,8(a5)
8040937c:	00e12823          	sw	a4,16(sp)
80409380:	060b0263          	beqz	s6,804093e4 <stride_dequeue+0x1c4>
80409384:	000b0593          	mv	a1,s6
80409388:	00090513          	mv	a0,s2
8040938c:	00f12c23          	sw	a5,24(sp)
80409390:	01012a23          	sw	a6,20(sp)
80409394:	af9ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409398:	fff00893          	li	a7,-1
8040939c:	01412803          	lw	a6,20(sp)
804093a0:	01812783          	lw	a5,24(sp)
804093a4:	01151463          	bne	a0,a7,804093ac <stride_dequeue+0x18c>
804093a8:	0a00206f          	j	8040b448 <stride_dequeue+0x2228>
804093ac:	008b2583          	lw	a1,8(s6)
804093b0:	004b2983          	lw	s3,4(s6)
804093b4:	00090513          	mv	a0,s2
804093b8:	00f12c23          	sw	a5,24(sp)
804093bc:	01012a23          	sw	a6,20(sp)
804093c0:	b89ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
804093c4:	00ab2223          	sw	a0,4(s6)
804093c8:	013b2423          	sw	s3,8(s6)
804093cc:	01412803          	lw	a6,20(sp)
804093d0:	01812783          	lw	a5,24(sp)
804093d4:	00050463          	beqz	a0,804093dc <stride_dequeue+0x1bc>
804093d8:	01652023          	sw	s6,0(a0)
804093dc:	008c2983          	lw	s3,8(s8)
804093e0:	000b0913          	mv	s2,s6
804093e4:	01012703          	lw	a4,16(sp)
804093e8:	0127a223          	sw	s2,4(a5)
804093ec:	00e7a423          	sw	a4,8(a5)
804093f0:	00f92023          	sw	a5,0(s2)
804093f4:	00078913          	mv	s2,a5
804093f8:	00c12783          	lw	a5,12(sp)
804093fc:	01282223          	sw	s2,4(a6)
80409400:	00f82423          	sw	a5,8(a6)
80409404:	01092023          	sw	a6,0(s2)
80409408:	00080913          	mv	s2,a6
8040940c:	00812783          	lw	a5,8(sp)
80409410:	012ca223          	sw	s2,4(s9)
80409414:	00fca423          	sw	a5,8(s9)
80409418:	01992023          	sw	s9,0(s2)
8040941c:	000c8913          	mv	s2,s9
80409420:	00412783          	lw	a5,4(sp)
80409424:	012da223          	sw	s2,4(s11)
80409428:	00fda423          	sw	a5,8(s11)
8040942c:	01b92023          	sw	s11,0(s2)
80409430:	000d8913          	mv	s2,s11
80409434:	00012783          	lw	a5,0(sp)
80409438:	012a2223          	sw	s2,4(s4)
8040943c:	00fa2423          	sw	a5,8(s4)
80409440:	01492023          	sw	s4,0(s2)
80409444:	000a0913          	mv	s2,s4
80409448:	01242223          	sw	s2,4(s0)
8040944c:	01742423          	sw	s7,8(s0)
80409450:	00892023          	sw	s0,0(s2)
80409454:	01a42023          	sw	s10,0(s0)
80409458:	200d0c63          	beqz	s10,80409670 <stride_dequeue+0x450>
8040945c:	004d2683          	lw	a3,4(s10)
80409460:	0c848493          	addi	s1,s1,200
80409464:	20968a63          	beq	a3,s1,80409678 <stride_dequeue+0x458>
80409468:	008d2423          	sw	s0,8(s10)
8040946c:	05c12083          	lw	ra,92(sp)
80409470:	05812403          	lw	s0,88(sp)
80409474:	fff98993          	addi	s3,s3,-1
80409478:	015c2823          	sw	s5,16(s8)
8040947c:	013c2423          	sw	s3,8(s8)
80409480:	05412483          	lw	s1,84(sp)
80409484:	05012903          	lw	s2,80(sp)
80409488:	04c12983          	lw	s3,76(sp)
8040948c:	04812a03          	lw	s4,72(sp)
80409490:	04412a83          	lw	s5,68(sp)
80409494:	04012b03          	lw	s6,64(sp)
80409498:	03c12b83          	lw	s7,60(sp)
8040949c:	03812c03          	lw	s8,56(sp)
804094a0:	03412c83          	lw	s9,52(sp)
804094a4:	03012d03          	lw	s10,48(sp)
804094a8:	02c12d83          	lw	s11,44(sp)
804094ac:	06010113          	addi	sp,sp,96
804094b0:	00008067          	ret
804094b4:	00892d83          	lw	s11,8(s2)
804094b8:	00492b83          	lw	s7,4(s2)
804094bc:	180d8a63          	beqz	s11,80409650 <stride_dequeue+0x430>
804094c0:	00040593          	mv	a1,s0
804094c4:	000d8513          	mv	a0,s11
804094c8:	9c5ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804094cc:	37450463          	beq	a0,s4,80409834 <stride_dequeue+0x614>
804094d0:	00442783          	lw	a5,4(s0)
804094d4:	00842c83          	lw	s9,8(s0)
804094d8:	00f12023          	sw	a5,0(sp)
804094dc:	160c8263          	beqz	s9,80409640 <stride_dequeue+0x420>
804094e0:	000c8593          	mv	a1,s9
804094e4:	000d8513          	mv	a0,s11
804094e8:	9a5ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804094ec:	4d450863          	beq	a0,s4,804099bc <stride_dequeue+0x79c>
804094f0:	004ca783          	lw	a5,4(s9)
804094f4:	008caa03          	lw	s4,8(s9)
804094f8:	00f12223          	sw	a5,4(sp)
804094fc:	120a0863          	beqz	s4,8040962c <stride_dequeue+0x40c>
80409500:	000a0593          	mv	a1,s4
80409504:	000d8513          	mv	a0,s11
80409508:	985ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040950c:	fff00893          	li	a7,-1
80409510:	551502e3          	beq	a0,a7,8040a254 <stride_dequeue+0x1034>
80409514:	004a2783          	lw	a5,4(s4)
80409518:	008a2803          	lw	a6,8(s4)
8040951c:	00f12423          	sw	a5,8(sp)
80409520:	0e080c63          	beqz	a6,80409618 <stride_dequeue+0x3f8>
80409524:	00080593          	mv	a1,a6
80409528:	000d8513          	mv	a0,s11
8040952c:	01012623          	sw	a6,12(sp)
80409530:	95dff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409534:	fff00893          	li	a7,-1
80409538:	00c12803          	lw	a6,12(sp)
8040953c:	01151463          	bne	a0,a7,80409544 <stride_dequeue+0x324>
80409540:	4000106f          	j	8040a940 <stride_dequeue+0x1720>
80409544:	00482783          	lw	a5,4(a6)
80409548:	00882303          	lw	t1,8(a6)
8040954c:	00f12623          	sw	a5,12(sp)
80409550:	0a030a63          	beqz	t1,80409604 <stride_dequeue+0x3e4>
80409554:	00030593          	mv	a1,t1
80409558:	000d8513          	mv	a0,s11
8040955c:	01012a23          	sw	a6,20(sp)
80409560:	00612823          	sw	t1,16(sp)
80409564:	929ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409568:	fff00893          	li	a7,-1
8040956c:	01012303          	lw	t1,16(sp)
80409570:	01412803          	lw	a6,20(sp)
80409574:	01151463          	bne	a0,a7,8040957c <stride_dequeue+0x35c>
80409578:	5cd0106f          	j	8040b344 <stride_dequeue+0x2124>
8040957c:	00432783          	lw	a5,4(t1)
80409580:	00832983          	lw	s3,8(t1)
80409584:	00f12823          	sw	a5,16(sp)
80409588:	00099463          	bnez	s3,80409590 <stride_dequeue+0x370>
8040958c:	44c0206f          	j	8040b9d8 <stride_dequeue+0x27b8>
80409590:	00098593          	mv	a1,s3
80409594:	000d8513          	mv	a0,s11
80409598:	00612c23          	sw	t1,24(sp)
8040959c:	01012a23          	sw	a6,20(sp)
804095a0:	8edff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804095a4:	fff00893          	li	a7,-1
804095a8:	01412803          	lw	a6,20(sp)
804095ac:	01812303          	lw	t1,24(sp)
804095b0:	01151463          	bne	a0,a7,804095b8 <stride_dequeue+0x398>
804095b4:	6ac0206f          	j	8040bc60 <stride_dequeue+0x2a40>
804095b8:	0089a583          	lw	a1,8(s3)
804095bc:	0049ab03          	lw	s6,4(s3)
804095c0:	000d8513          	mv	a0,s11
804095c4:	00612c23          	sw	t1,24(sp)
804095c8:	01012a23          	sw	a6,20(sp)
804095cc:	97dff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
804095d0:	00a9a223          	sw	a0,4(s3)
804095d4:	0169a423          	sw	s6,8(s3)
804095d8:	01412803          	lw	a6,20(sp)
804095dc:	01812303          	lw	t1,24(sp)
804095e0:	00050463          	beqz	a0,804095e8 <stride_dequeue+0x3c8>
804095e4:	01352023          	sw	s3,0(a0)
804095e8:	008c2b03          	lw	s6,8(s8)
804095ec:	01012783          	lw	a5,16(sp)
804095f0:	01332223          	sw	s3,4(t1)
804095f4:	00030d93          	mv	s11,t1
804095f8:	00f32423          	sw	a5,8(t1)
804095fc:	0069a023          	sw	t1,0(s3)
80409600:	000b0993          	mv	s3,s6
80409604:	00c12783          	lw	a5,12(sp)
80409608:	01b82223          	sw	s11,4(a6)
8040960c:	00f82423          	sw	a5,8(a6)
80409610:	010da023          	sw	a6,0(s11)
80409614:	00080d93          	mv	s11,a6
80409618:	00812783          	lw	a5,8(sp)
8040961c:	01ba2223          	sw	s11,4(s4)
80409620:	00fa2423          	sw	a5,8(s4)
80409624:	014da023          	sw	s4,0(s11)
80409628:	000a0d93          	mv	s11,s4
8040962c:	00412783          	lw	a5,4(sp)
80409630:	01bca223          	sw	s11,4(s9)
80409634:	00fca423          	sw	a5,8(s9)
80409638:	019da023          	sw	s9,0(s11)
8040963c:	000c8d93          	mv	s11,s9
80409640:	00012783          	lw	a5,0(sp)
80409644:	01b42223          	sw	s11,4(s0)
80409648:	00f42423          	sw	a5,8(s0)
8040964c:	008da023          	sw	s0,0(s11)
80409650:	00892223          	sw	s0,4(s2)
80409654:	01792423          	sw	s7,8(s2)
80409658:	01242023          	sw	s2,0(s0)
8040965c:	00090413          	mv	s0,s2
80409660:	01a42023          	sw	s10,0(s0)
80409664:	df5ff06f          	j	80409458 <stride_dequeue+0x238>
80409668:	de0416e3          	bnez	s0,80409454 <stride_dequeue+0x234>
8040966c:	de0d18e3          	bnez	s10,8040945c <stride_dequeue+0x23c>
80409670:	00040a93          	mv	s5,s0
80409674:	df9ff06f          	j	8040946c <stride_dequeue+0x24c>
80409678:	008d2223          	sw	s0,4(s10)
8040967c:	df1ff06f          	j	8040946c <stride_dequeue+0x24c>
80409680:	00892d83          	lw	s11,8(s2)
80409684:	00a12023          	sw	a0,0(sp)
80409688:	00492c83          	lw	s9,4(s2)
8040968c:	180d8663          	beqz	s11,80409818 <stride_dequeue+0x5f8>
80409690:	000a0593          	mv	a1,s4
80409694:	000d8513          	mv	a0,s11
80409698:	ff4ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040969c:	00012783          	lw	a5,0(sp)
804096a0:	46f50263          	beq	a0,a5,80409b04 <stride_dequeue+0x8e4>
804096a4:	004a2783          	lw	a5,4(s4)
804096a8:	008a2603          	lw	a2,8(s4)
804096ac:	00f12023          	sw	a5,0(sp)
804096b0:	14060c63          	beqz	a2,80409808 <stride_dequeue+0x5e8>
804096b4:	00060593          	mv	a1,a2
804096b8:	000d8513          	mv	a0,s11
804096bc:	00c12223          	sw	a2,4(sp)
804096c0:	fccff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804096c4:	fff00893          	li	a7,-1
804096c8:	00412603          	lw	a2,4(sp)
804096cc:	25150ce3          	beq	a0,a7,8040a124 <stride_dequeue+0xf04>
804096d0:	00462783          	lw	a5,4(a2)
804096d4:	00862803          	lw	a6,8(a2)
804096d8:	00f12223          	sw	a5,4(sp)
804096dc:	10080c63          	beqz	a6,804097f4 <stride_dequeue+0x5d4>
804096e0:	00080593          	mv	a1,a6
804096e4:	000d8513          	mv	a0,s11
804096e8:	00c12623          	sw	a2,12(sp)
804096ec:	01012423          	sw	a6,8(sp)
804096f0:	f9cff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804096f4:	fff00893          	li	a7,-1
804096f8:	00812803          	lw	a6,8(sp)
804096fc:	00c12603          	lw	a2,12(sp)
80409700:	01151463          	bne	a0,a7,80409708 <stride_dequeue+0x4e8>
80409704:	3100106f          	j	8040aa14 <stride_dequeue+0x17f4>
80409708:	00482783          	lw	a5,4(a6)
8040970c:	00882303          	lw	t1,8(a6)
80409710:	00f12423          	sw	a5,8(sp)
80409714:	0c030663          	beqz	t1,804097e0 <stride_dequeue+0x5c0>
80409718:	00030593          	mv	a1,t1
8040971c:	000d8513          	mv	a0,s11
80409720:	01012a23          	sw	a6,20(sp)
80409724:	00c12823          	sw	a2,16(sp)
80409728:	00612623          	sw	t1,12(sp)
8040972c:	f60ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409730:	fff00893          	li	a7,-1
80409734:	00c12303          	lw	t1,12(sp)
80409738:	01012603          	lw	a2,16(sp)
8040973c:	01412803          	lw	a6,20(sp)
80409740:	01151463          	bne	a0,a7,80409748 <stride_dequeue+0x528>
80409744:	2e90106f          	j	8040b22c <stride_dequeue+0x200c>
80409748:	00432783          	lw	a5,4(t1)
8040974c:	00832983          	lw	s3,8(t1)
80409750:	00f12623          	sw	a5,12(sp)
80409754:	00099463          	bnez	s3,8040975c <stride_dequeue+0x53c>
80409758:	4240206f          	j	8040bb7c <stride_dequeue+0x295c>
8040975c:	00098593          	mv	a1,s3
80409760:	000d8513          	mv	a0,s11
80409764:	00612c23          	sw	t1,24(sp)
80409768:	01012a23          	sw	a6,20(sp)
8040976c:	00c12823          	sw	a2,16(sp)
80409770:	f1cff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409774:	fff00893          	li	a7,-1
80409778:	01012603          	lw	a2,16(sp)
8040977c:	01412803          	lw	a6,20(sp)
80409780:	01812303          	lw	t1,24(sp)
80409784:	01151463          	bne	a0,a7,8040978c <stride_dequeue+0x56c>
80409788:	3fc0206f          	j	8040bb84 <stride_dequeue+0x2964>
8040978c:	0089a583          	lw	a1,8(s3)
80409790:	0049ab03          	lw	s6,4(s3)
80409794:	000d8513          	mv	a0,s11
80409798:	00612c23          	sw	t1,24(sp)
8040979c:	01012a23          	sw	a6,20(sp)
804097a0:	00c12823          	sw	a2,16(sp)
804097a4:	fa4ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
804097a8:	00a9a223          	sw	a0,4(s3)
804097ac:	0169a423          	sw	s6,8(s3)
804097b0:	01012603          	lw	a2,16(sp)
804097b4:	01412803          	lw	a6,20(sp)
804097b8:	01812303          	lw	t1,24(sp)
804097bc:	00050463          	beqz	a0,804097c4 <stride_dequeue+0x5a4>
804097c0:	01352023          	sw	s3,0(a0)
804097c4:	008c2b03          	lw	s6,8(s8)
804097c8:	00c12783          	lw	a5,12(sp)
804097cc:	01332223          	sw	s3,4(t1)
804097d0:	00030d93          	mv	s11,t1
804097d4:	00f32423          	sw	a5,8(t1)
804097d8:	0069a023          	sw	t1,0(s3)
804097dc:	000b0993          	mv	s3,s6
804097e0:	00812783          	lw	a5,8(sp)
804097e4:	01b82223          	sw	s11,4(a6)
804097e8:	00f82423          	sw	a5,8(a6)
804097ec:	010da023          	sw	a6,0(s11)
804097f0:	00080d93          	mv	s11,a6
804097f4:	00412783          	lw	a5,4(sp)
804097f8:	01b62223          	sw	s11,4(a2)
804097fc:	00f62423          	sw	a5,8(a2)
80409800:	00cda023          	sw	a2,0(s11)
80409804:	00060d93          	mv	s11,a2
80409808:	00012783          	lw	a5,0(sp)
8040980c:	01ba2223          	sw	s11,4(s4)
80409810:	00fa2423          	sw	a5,8(s4)
80409814:	014da023          	sw	s4,0(s11)
80409818:	01492223          	sw	s4,4(s2)
8040981c:	01992423          	sw	s9,8(s2)
80409820:	012a2023          	sw	s2,0(s4)
80409824:	c25ff06f          	j	80409448 <stride_dequeue+0x228>
80409828:	00090413          	mv	s0,s2
8040982c:	01a42023          	sw	s10,0(s0)
80409830:	c29ff06f          	j	80409458 <stride_dequeue+0x238>
80409834:	004da783          	lw	a5,4(s11)
80409838:	008dac83          	lw	s9,8(s11)
8040983c:	00a12223          	sw	a0,4(sp)
80409840:	00f12023          	sw	a5,0(sp)
80409844:	160c8063          	beqz	s9,804099a4 <stride_dequeue+0x784>
80409848:	00040593          	mv	a1,s0
8040984c:	000c8513          	mv	a0,s9
80409850:	e3cff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409854:	00412783          	lw	a5,4(sp)
80409858:	66f50a63          	beq	a0,a5,80409ecc <stride_dequeue+0xcac>
8040985c:	00442783          	lw	a5,4(s0)
80409860:	00842a03          	lw	s4,8(s0)
80409864:	00f12223          	sw	a5,4(sp)
80409868:	120a0663          	beqz	s4,80409994 <stride_dequeue+0x774>
8040986c:	000a0593          	mv	a1,s4
80409870:	000c8513          	mv	a0,s9
80409874:	e18ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409878:	fff00893          	li	a7,-1
8040987c:	4f1506e3          	beq	a0,a7,8040a568 <stride_dequeue+0x1348>
80409880:	004a2783          	lw	a5,4(s4)
80409884:	008a2803          	lw	a6,8(s4)
80409888:	00f12423          	sw	a5,8(sp)
8040988c:	0e080a63          	beqz	a6,80409980 <stride_dequeue+0x760>
80409890:	00080593          	mv	a1,a6
80409894:	000c8513          	mv	a0,s9
80409898:	01012623          	sw	a6,12(sp)
8040989c:	df0ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804098a0:	fff00893          	li	a7,-1
804098a4:	00c12803          	lw	a6,12(sp)
804098a8:	01151463          	bne	a0,a7,804098b0 <stride_dequeue+0x690>
804098ac:	5640106f          	j	8040ae10 <stride_dequeue+0x1bf0>
804098b0:	00482783          	lw	a5,4(a6)
804098b4:	00882983          	lw	s3,8(a6)
804098b8:	00f12623          	sw	a5,12(sp)
804098bc:	00099463          	bnez	s3,804098c4 <stride_dequeue+0x6a4>
804098c0:	4380206f          	j	8040bcf8 <stride_dequeue+0x2ad8>
804098c4:	00098593          	mv	a1,s3
804098c8:	000c8513          	mv	a0,s9
804098cc:	01012823          	sw	a6,16(sp)
804098d0:	dbcff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804098d4:	fff00893          	li	a7,-1
804098d8:	01012803          	lw	a6,16(sp)
804098dc:	01151463          	bne	a0,a7,804098e4 <stride_dequeue+0x6c4>
804098e0:	0780206f          	j	8040b958 <stride_dequeue+0x2738>
804098e4:	0049a783          	lw	a5,4(s3)
804098e8:	0089ae03          	lw	t3,8(s3)
804098ec:	00f12823          	sw	a5,16(sp)
804098f0:	060e0463          	beqz	t3,80409958 <stride_dequeue+0x738>
804098f4:	000e0593          	mv	a1,t3
804098f8:	000c8513          	mv	a0,s9
804098fc:	01012c23          	sw	a6,24(sp)
80409900:	01c12a23          	sw	t3,20(sp)
80409904:	d88ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409908:	fff00893          	li	a7,-1
8040990c:	01412e03          	lw	t3,20(sp)
80409910:	01812803          	lw	a6,24(sp)
80409914:	01151463          	bne	a0,a7,8040991c <stride_dequeue+0x6fc>
80409918:	6a40206f          	j	8040bfbc <stride_dequeue+0x2d9c>
8040991c:	008e2583          	lw	a1,8(t3)
80409920:	000c8513          	mv	a0,s9
80409924:	004e2b03          	lw	s6,4(t3)
80409928:	01012c23          	sw	a6,24(sp)
8040992c:	01c12a23          	sw	t3,20(sp)
80409930:	e18ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80409934:	01412e03          	lw	t3,20(sp)
80409938:	01812803          	lw	a6,24(sp)
8040993c:	00ae2223          	sw	a0,4(t3)
80409940:	016e2423          	sw	s6,8(t3)
80409944:	00051463          	bnez	a0,8040994c <stride_dequeue+0x72c>
80409948:	0e90206f          	j	8040c230 <stride_dequeue+0x3010>
8040994c:	008c2b03          	lw	s6,8(s8)
80409950:	01c52023          	sw	t3,0(a0)
80409954:	000e0c93          	mv	s9,t3
80409958:	01012783          	lw	a5,16(sp)
8040995c:	0199a223          	sw	s9,4(s3)
80409960:	00f9a423          	sw	a5,8(s3)
80409964:	013ca023          	sw	s3,0(s9)
80409968:	00c12783          	lw	a5,12(sp)
8040996c:	01382223          	sw	s3,4(a6)
80409970:	00080c93          	mv	s9,a6
80409974:	00f82423          	sw	a5,8(a6)
80409978:	0109a023          	sw	a6,0(s3)
8040997c:	000b0993          	mv	s3,s6
80409980:	00812783          	lw	a5,8(sp)
80409984:	019a2223          	sw	s9,4(s4)
80409988:	00fa2423          	sw	a5,8(s4)
8040998c:	014ca023          	sw	s4,0(s9)
80409990:	000a0c93          	mv	s9,s4
80409994:	00412783          	lw	a5,4(sp)
80409998:	01942223          	sw	s9,4(s0)
8040999c:	00f42423          	sw	a5,8(s0)
804099a0:	008ca023          	sw	s0,0(s9)
804099a4:	00012783          	lw	a5,0(sp)
804099a8:	008da223          	sw	s0,4(s11)
804099ac:	00fda423          	sw	a5,8(s11)
804099b0:	01b42023          	sw	s11,0(s0)
804099b4:	000d8413          	mv	s0,s11
804099b8:	c99ff06f          	j	80409650 <stride_dequeue+0x430>
804099bc:	004da783          	lw	a5,4(s11)
804099c0:	008daa03          	lw	s4,8(s11)
804099c4:	00f12223          	sw	a5,4(sp)
804099c8:	120a0463          	beqz	s4,80409af0 <stride_dequeue+0x8d0>
804099cc:	000c8593          	mv	a1,s9
804099d0:	000a0513          	mv	a0,s4
804099d4:	cb8ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
804099d8:	fff00893          	li	a7,-1
804099dc:	4b1500e3          	beq	a0,a7,8040a67c <stride_dequeue+0x145c>
804099e0:	004ca783          	lw	a5,4(s9)
804099e4:	008ca803          	lw	a6,8(s9)
804099e8:	00f12423          	sw	a5,8(sp)
804099ec:	0e080a63          	beqz	a6,80409ae0 <stride_dequeue+0x8c0>
804099f0:	00080593          	mv	a1,a6
804099f4:	000a0513          	mv	a0,s4
804099f8:	01012623          	sw	a6,12(sp)
804099fc:	c90ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409a00:	fff00893          	li	a7,-1
80409a04:	00c12803          	lw	a6,12(sp)
80409a08:	01151463          	bne	a0,a7,80409a10 <stride_dequeue+0x7f0>
80409a0c:	4e00106f          	j	8040aeec <stride_dequeue+0x1ccc>
80409a10:	00482783          	lw	a5,4(a6)
80409a14:	00882983          	lw	s3,8(a6)
80409a18:	00f12623          	sw	a5,12(sp)
80409a1c:	00099463          	bnez	s3,80409a24 <stride_dequeue+0x804>
80409a20:	2b00206f          	j	8040bcd0 <stride_dequeue+0x2ab0>
80409a24:	00098593          	mv	a1,s3
80409a28:	000a0513          	mv	a0,s4
80409a2c:	01012823          	sw	a6,16(sp)
80409a30:	c5cff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409a34:	fff00893          	li	a7,-1
80409a38:	01012803          	lw	a6,16(sp)
80409a3c:	01151463          	bne	a0,a7,80409a44 <stride_dequeue+0x824>
80409a40:	7a10106f          	j	8040b9e0 <stride_dequeue+0x27c0>
80409a44:	0049a783          	lw	a5,4(s3)
80409a48:	0089ae03          	lw	t3,8(s3)
80409a4c:	00f12823          	sw	a5,16(sp)
80409a50:	060e0463          	beqz	t3,80409ab8 <stride_dequeue+0x898>
80409a54:	000e0593          	mv	a1,t3
80409a58:	000a0513          	mv	a0,s4
80409a5c:	01012c23          	sw	a6,24(sp)
80409a60:	01c12a23          	sw	t3,20(sp)
80409a64:	c28ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409a68:	fff00893          	li	a7,-1
80409a6c:	01412e03          	lw	t3,20(sp)
80409a70:	01812803          	lw	a6,24(sp)
80409a74:	01151463          	bne	a0,a7,80409a7c <stride_dequeue+0x85c>
80409a78:	59c0206f          	j	8040c014 <stride_dequeue+0x2df4>
80409a7c:	008e2583          	lw	a1,8(t3)
80409a80:	000a0513          	mv	a0,s4
80409a84:	004e2b03          	lw	s6,4(t3)
80409a88:	01012c23          	sw	a6,24(sp)
80409a8c:	01c12a23          	sw	t3,20(sp)
80409a90:	cb8ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80409a94:	01412e03          	lw	t3,20(sp)
80409a98:	01812803          	lw	a6,24(sp)
80409a9c:	00ae2223          	sw	a0,4(t3)
80409aa0:	016e2423          	sw	s6,8(t3)
80409aa4:	00051463          	bnez	a0,80409aac <stride_dequeue+0x88c>
80409aa8:	7d00206f          	j	8040c278 <stride_dequeue+0x3058>
80409aac:	008c2b03          	lw	s6,8(s8)
80409ab0:	01c52023          	sw	t3,0(a0)
80409ab4:	000e0a13          	mv	s4,t3
80409ab8:	01012783          	lw	a5,16(sp)
80409abc:	0149a223          	sw	s4,4(s3)
80409ac0:	00f9a423          	sw	a5,8(s3)
80409ac4:	013a2023          	sw	s3,0(s4)
80409ac8:	00c12783          	lw	a5,12(sp)
80409acc:	01382223          	sw	s3,4(a6)
80409ad0:	00080a13          	mv	s4,a6
80409ad4:	00f82423          	sw	a5,8(a6)
80409ad8:	0109a023          	sw	a6,0(s3)
80409adc:	000b0993          	mv	s3,s6
80409ae0:	00812783          	lw	a5,8(sp)
80409ae4:	014ca223          	sw	s4,4(s9)
80409ae8:	00fca423          	sw	a5,8(s9)
80409aec:	019a2023          	sw	s9,0(s4)
80409af0:	00412783          	lw	a5,4(sp)
80409af4:	019da223          	sw	s9,4(s11)
80409af8:	00fda423          	sw	a5,8(s11)
80409afc:	01bca023          	sw	s11,0(s9)
80409b00:	b41ff06f          	j	80409640 <stride_dequeue+0x420>
80409b04:	004da783          	lw	a5,4(s11)
80409b08:	008da603          	lw	a2,8(s11)
80409b0c:	00f12023          	sw	a5,0(sp)
80409b10:	14060463          	beqz	a2,80409c58 <stride_dequeue+0xa38>
80409b14:	00060513          	mv	a0,a2
80409b18:	000a0593          	mv	a1,s4
80409b1c:	00c12223          	sw	a2,4(sp)
80409b20:	b6cff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409b24:	fff00893          	li	a7,-1
80409b28:	00412603          	lw	a2,4(sp)
80409b2c:	111502e3          	beq	a0,a7,8040a430 <stride_dequeue+0x1210>
80409b30:	004a2783          	lw	a5,4(s4)
80409b34:	008a2803          	lw	a6,8(s4)
80409b38:	00f12223          	sw	a5,4(sp)
80409b3c:	10080663          	beqz	a6,80409c48 <stride_dequeue+0xa28>
80409b40:	00080593          	mv	a1,a6
80409b44:	00060513          	mv	a0,a2
80409b48:	01012623          	sw	a6,12(sp)
80409b4c:	00c12423          	sw	a2,8(sp)
80409b50:	b3cff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409b54:	fff00893          	li	a7,-1
80409b58:	00812603          	lw	a2,8(sp)
80409b5c:	00c12803          	lw	a6,12(sp)
80409b60:	01151463          	bne	a0,a7,80409b68 <stride_dequeue+0x948>
80409b64:	5540106f          	j	8040b0b8 <stride_dequeue+0x1e98>
80409b68:	00482783          	lw	a5,4(a6)
80409b6c:	00882983          	lw	s3,8(a6)
80409b70:	00f12423          	sw	a5,8(sp)
80409b74:	00099463          	bnez	s3,80409b7c <stride_dequeue+0x95c>
80409b78:	1980206f          	j	8040bd10 <stride_dequeue+0x2af0>
80409b7c:	00060513          	mv	a0,a2
80409b80:	00098593          	mv	a1,s3
80409b84:	01012823          	sw	a6,16(sp)
80409b88:	00c12623          	sw	a2,12(sp)
80409b8c:	b00ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409b90:	fff00893          	li	a7,-1
80409b94:	00c12603          	lw	a2,12(sp)
80409b98:	01012803          	lw	a6,16(sp)
80409b9c:	01151463          	bne	a0,a7,80409ba4 <stride_dequeue+0x984>
80409ba0:	4290106f          	j	8040b7c8 <stride_dequeue+0x25a8>
80409ba4:	0049a783          	lw	a5,4(s3)
80409ba8:	0089ae03          	lw	t3,8(s3)
80409bac:	00f12623          	sw	a5,12(sp)
80409bb0:	060e0863          	beqz	t3,80409c20 <stride_dequeue+0xa00>
80409bb4:	000e0593          	mv	a1,t3
80409bb8:	00060513          	mv	a0,a2
80409bbc:	01012c23          	sw	a6,24(sp)
80409bc0:	01c12a23          	sw	t3,20(sp)
80409bc4:	00c12823          	sw	a2,16(sp)
80409bc8:	ac4ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409bcc:	01812803          	lw	a6,24(sp)
80409bd0:	01412e03          	lw	t3,20(sp)
80409bd4:	fff00893          	li	a7,-1
80409bd8:	01012a23          	sw	a6,20(sp)
80409bdc:	01012603          	lw	a2,16(sp)
80409be0:	01151463          	bne	a0,a7,80409be8 <stride_dequeue+0x9c8>
80409be4:	3a00206f          	j	8040bf84 <stride_dequeue+0x2d64>
80409be8:	008e2583          	lw	a1,8(t3)
80409bec:	00060513          	mv	a0,a2
80409bf0:	004e2b03          	lw	s6,4(t3)
80409bf4:	01c12823          	sw	t3,16(sp)
80409bf8:	b50ff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80409bfc:	01012e03          	lw	t3,16(sp)
80409c00:	01412803          	lw	a6,20(sp)
80409c04:	00ae2223          	sw	a0,4(t3)
80409c08:	016e2423          	sw	s6,8(t3)
80409c0c:	00051463          	bnez	a0,80409c14 <stride_dequeue+0x9f4>
80409c10:	62c0206f          	j	8040c23c <stride_dequeue+0x301c>
80409c14:	008c2b03          	lw	s6,8(s8)
80409c18:	01c52023          	sw	t3,0(a0)
80409c1c:	000e0613          	mv	a2,t3
80409c20:	00c12783          	lw	a5,12(sp)
80409c24:	00c9a223          	sw	a2,4(s3)
80409c28:	00f9a423          	sw	a5,8(s3)
80409c2c:	01362023          	sw	s3,0(a2)
80409c30:	00812783          	lw	a5,8(sp)
80409c34:	01382223          	sw	s3,4(a6)
80409c38:	00080613          	mv	a2,a6
80409c3c:	00f82423          	sw	a5,8(a6)
80409c40:	0109a023          	sw	a6,0(s3)
80409c44:	000b0993          	mv	s3,s6
80409c48:	00412783          	lw	a5,4(sp)
80409c4c:	00ca2223          	sw	a2,4(s4)
80409c50:	00fa2423          	sw	a5,8(s4)
80409c54:	01462023          	sw	s4,0(a2)
80409c58:	00012783          	lw	a5,0(sp)
80409c5c:	014da223          	sw	s4,4(s11)
80409c60:	00fda423          	sw	a5,8(s11)
80409c64:	01ba2023          	sw	s11,0(s4)
80409c68:	000d8a13          	mv	s4,s11
80409c6c:	badff06f          	j	80409818 <stride_dequeue+0x5f8>
80409c70:	00492783          	lw	a5,4(s2)
80409c74:	00892883          	lw	a7,8(s2)
80409c78:	00a12623          	sw	a0,12(sp)
80409c7c:	00f12423          	sw	a5,8(sp)
80409c80:	0e088863          	beqz	a7,80409d70 <stride_dequeue+0xb50>
80409c84:	00088513          	mv	a0,a7
80409c88:	000c8593          	mv	a1,s9
80409c8c:	01112823          	sw	a7,16(sp)
80409c90:	9fcff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409c94:	00c12803          	lw	a6,12(sp)
80409c98:	01012883          	lw	a7,16(sp)
80409c9c:	2f050ce3          	beq	a0,a6,8040a794 <stride_dequeue+0x1574>
80409ca0:	004ca783          	lw	a5,4(s9)
80409ca4:	008ca303          	lw	t1,8(s9)
80409ca8:	01012823          	sw	a6,16(sp)
80409cac:	00f12623          	sw	a5,12(sp)
80409cb0:	0a030863          	beqz	t1,80409d60 <stride_dequeue+0xb40>
80409cb4:	00030593          	mv	a1,t1
80409cb8:	00088513          	mv	a0,a7
80409cbc:	00612c23          	sw	t1,24(sp)
80409cc0:	01112a23          	sw	a7,20(sp)
80409cc4:	9c8ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409cc8:	01012803          	lw	a6,16(sp)
80409ccc:	01412883          	lw	a7,20(sp)
80409cd0:	01812303          	lw	t1,24(sp)
80409cd4:	01051463          	bne	a0,a6,80409cdc <stride_dequeue+0xabc>
80409cd8:	6f00106f          	j	8040b3c8 <stride_dequeue+0x21a8>
80409cdc:	00432783          	lw	a5,4(t1)
80409ce0:	00832983          	lw	s3,8(t1)
80409ce4:	01012a23          	sw	a6,20(sp)
80409ce8:	00f12823          	sw	a5,16(sp)
80409cec:	00099463          	bnez	s3,80409cf4 <stride_dequeue+0xad4>
80409cf0:	3e50106f          	j	8040b8d4 <stride_dequeue+0x26b4>
80409cf4:	00088513          	mv	a0,a7
80409cf8:	00098593          	mv	a1,s3
80409cfc:	00612e23          	sw	t1,28(sp)
80409d00:	01112c23          	sw	a7,24(sp)
80409d04:	988ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409d08:	01412803          	lw	a6,20(sp)
80409d0c:	01812883          	lw	a7,24(sp)
80409d10:	01c12303          	lw	t1,28(sp)
80409d14:	01051463          	bne	a0,a6,80409d1c <stride_dequeue+0xafc>
80409d18:	6d90106f          	j	8040bbf0 <stride_dequeue+0x29d0>
80409d1c:	0089a583          	lw	a1,8(s3)
80409d20:	0049ab03          	lw	s6,4(s3)
80409d24:	00088513          	mv	a0,a7
80409d28:	00612a23          	sw	t1,20(sp)
80409d2c:	a1cff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80409d30:	00a9a223          	sw	a0,4(s3)
80409d34:	0169a423          	sw	s6,8(s3)
80409d38:	01412303          	lw	t1,20(sp)
80409d3c:	00050463          	beqz	a0,80409d44 <stride_dequeue+0xb24>
80409d40:	01352023          	sw	s3,0(a0)
80409d44:	008c2b03          	lw	s6,8(s8)
80409d48:	01012783          	lw	a5,16(sp)
80409d4c:	01332223          	sw	s3,4(t1)
80409d50:	00030893          	mv	a7,t1
80409d54:	00f32423          	sw	a5,8(t1)
80409d58:	0069a023          	sw	t1,0(s3)
80409d5c:	000b0993          	mv	s3,s6
80409d60:	00c12783          	lw	a5,12(sp)
80409d64:	011ca223          	sw	a7,4(s9)
80409d68:	00fca423          	sw	a5,8(s9)
80409d6c:	0198a023          	sw	s9,0(a7) # 2000 <_binary_bin_swap_img_size-0x6000>
80409d70:	00812783          	lw	a5,8(sp)
80409d74:	01992223          	sw	s9,4(s2)
80409d78:	00f92423          	sw	a5,8(s2)
80409d7c:	012ca023          	sw	s2,0(s9)
80409d80:	ea0ff06f          	j	80409420 <stride_dequeue+0x200>
80409d84:	00492783          	lw	a5,4(s2)
80409d88:	00892c83          	lw	s9,8(s2)
80409d8c:	00f12223          	sw	a5,4(sp)
80409d90:	120c8463          	beqz	s9,80409eb8 <stride_dequeue+0xc98>
80409d94:	000d8593          	mv	a1,s11
80409d98:	000c8513          	mv	a0,s9
80409d9c:	8f0ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409da0:	fff00893          	li	a7,-1
80409da4:	27150663          	beq	a0,a7,8040a010 <stride_dequeue+0xdf0>
80409da8:	004da783          	lw	a5,4(s11)
80409dac:	008da803          	lw	a6,8(s11)
80409db0:	00f12423          	sw	a5,8(sp)
80409db4:	0e080a63          	beqz	a6,80409ea8 <stride_dequeue+0xc88>
80409db8:	00080593          	mv	a1,a6
80409dbc:	000c8513          	mv	a0,s9
80409dc0:	01012623          	sw	a6,12(sp)
80409dc4:	8c8ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409dc8:	fff00893          	li	a7,-1
80409dcc:	00c12803          	lw	a6,12(sp)
80409dd0:	29150ee3          	beq	a0,a7,8040a86c <stride_dequeue+0x164c>
80409dd4:	00482783          	lw	a5,4(a6)
80409dd8:	00882303          	lw	t1,8(a6)
80409ddc:	00f12623          	sw	a5,12(sp)
80409de0:	0a030a63          	beqz	t1,80409e94 <stride_dequeue+0xc74>
80409de4:	00030593          	mv	a1,t1
80409de8:	000c8513          	mv	a0,s9
80409dec:	01012a23          	sw	a6,20(sp)
80409df0:	00612823          	sw	t1,16(sp)
80409df4:	898ff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409df8:	fff00893          	li	a7,-1
80409dfc:	01012303          	lw	t1,16(sp)
80409e00:	01412803          	lw	a6,20(sp)
80409e04:	01151463          	bne	a0,a7,80409e0c <stride_dequeue+0xbec>
80409e08:	4b80106f          	j	8040b2c0 <stride_dequeue+0x20a0>
80409e0c:	00432783          	lw	a5,4(t1)
80409e10:	00832983          	lw	s3,8(t1)
80409e14:	00f12823          	sw	a5,16(sp)
80409e18:	00099463          	bnez	s3,80409e20 <stride_dequeue+0xc00>
80409e1c:	4c10106f          	j	8040badc <stride_dequeue+0x28bc>
80409e20:	00098593          	mv	a1,s3
80409e24:	000c8513          	mv	a0,s9
80409e28:	00612c23          	sw	t1,24(sp)
80409e2c:	01012a23          	sw	a6,20(sp)
80409e30:	85cff0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409e34:	fff00893          	li	a7,-1
80409e38:	01412803          	lw	a6,20(sp)
80409e3c:	01812303          	lw	t1,24(sp)
80409e40:	01151463          	bne	a0,a7,80409e48 <stride_dequeue+0xc28>
80409e44:	5e90106f          	j	8040bc2c <stride_dequeue+0x2a0c>
80409e48:	0089a583          	lw	a1,8(s3)
80409e4c:	0049ab03          	lw	s6,4(s3)
80409e50:	000c8513          	mv	a0,s9
80409e54:	00612c23          	sw	t1,24(sp)
80409e58:	01012a23          	sw	a6,20(sp)
80409e5c:	8ecff0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80409e60:	00a9a223          	sw	a0,4(s3)
80409e64:	0169a423          	sw	s6,8(s3)
80409e68:	01412803          	lw	a6,20(sp)
80409e6c:	01812303          	lw	t1,24(sp)
80409e70:	00050463          	beqz	a0,80409e78 <stride_dequeue+0xc58>
80409e74:	01352023          	sw	s3,0(a0)
80409e78:	008c2b03          	lw	s6,8(s8)
80409e7c:	01012783          	lw	a5,16(sp)
80409e80:	01332223          	sw	s3,4(t1)
80409e84:	00030c93          	mv	s9,t1
80409e88:	00f32423          	sw	a5,8(t1)
80409e8c:	0069a023          	sw	t1,0(s3)
80409e90:	000b0993          	mv	s3,s6
80409e94:	00c12783          	lw	a5,12(sp)
80409e98:	01982223          	sw	s9,4(a6)
80409e9c:	00f82423          	sw	a5,8(a6)
80409ea0:	010ca023          	sw	a6,0(s9)
80409ea4:	00080c93          	mv	s9,a6
80409ea8:	00812783          	lw	a5,8(sp)
80409eac:	019da223          	sw	s9,4(s11)
80409eb0:	00fda423          	sw	a5,8(s11)
80409eb4:	01bca023          	sw	s11,0(s9)
80409eb8:	00412783          	lw	a5,4(sp)
80409ebc:	01b92223          	sw	s11,4(s2)
80409ec0:	00f92423          	sw	a5,8(s2)
80409ec4:	012da023          	sw	s2,0(s11)
80409ec8:	d6cff06f          	j	80409434 <stride_dequeue+0x214>
80409ecc:	004ca783          	lw	a5,4(s9)
80409ed0:	008caa03          	lw	s4,8(s9)
80409ed4:	00f12223          	sw	a5,4(sp)
80409ed8:	120a0063          	beqz	s4,80409ff8 <stride_dequeue+0xdd8>
80409edc:	00040593          	mv	a1,s0
80409ee0:	000a0513          	mv	a0,s4
80409ee4:	fa9fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409ee8:	fff00893          	li	a7,-1
80409eec:	49150ee3          	beq	a0,a7,8040ab88 <stride_dequeue+0x1968>
80409ef0:	00442783          	lw	a5,4(s0)
80409ef4:	00842983          	lw	s3,8(s0)
80409ef8:	00f12423          	sw	a5,8(sp)
80409efc:	00099463          	bnez	s3,80409f04 <stride_dequeue+0xce4>
80409f00:	4710106f          	j	8040bb70 <stride_dequeue+0x2950>
80409f04:	00098593          	mv	a1,s3
80409f08:	000a0513          	mv	a0,s4
80409f0c:	f81fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409f10:	fff00893          	li	a7,-1
80409f14:	01151463          	bne	a0,a7,80409f1c <stride_dequeue+0xcfc>
80409f18:	5dc0106f          	j	8040b4f4 <stride_dequeue+0x22d4>
80409f1c:	0049a783          	lw	a5,4(s3)
80409f20:	0089a303          	lw	t1,8(s3)
80409f24:	00f12623          	sw	a5,12(sp)
80409f28:	0a030663          	beqz	t1,80409fd4 <stride_dequeue+0xdb4>
80409f2c:	00030593          	mv	a1,t1
80409f30:	000a0513          	mv	a0,s4
80409f34:	00612823          	sw	t1,16(sp)
80409f38:	f55fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409f3c:	fff00893          	li	a7,-1
80409f40:	01012303          	lw	t1,16(sp)
80409f44:	01151463          	bne	a0,a7,80409f4c <stride_dequeue+0xd2c>
80409f48:	1cc0206f          	j	8040c114 <stride_dequeue+0x2ef4>
80409f4c:	00432783          	lw	a5,4(t1)
80409f50:	00832e03          	lw	t3,8(t1)
80409f54:	00f12823          	sw	a5,16(sp)
80409f58:	060e0463          	beqz	t3,80409fc0 <stride_dequeue+0xda0>
80409f5c:	000e0593          	mv	a1,t3
80409f60:	000a0513          	mv	a0,s4
80409f64:	00612c23          	sw	t1,24(sp)
80409f68:	01c12a23          	sw	t3,20(sp)
80409f6c:	f21fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
80409f70:	fff00893          	li	a7,-1
80409f74:	01412e03          	lw	t3,20(sp)
80409f78:	01812303          	lw	t1,24(sp)
80409f7c:	01151463          	bne	a0,a7,80409f84 <stride_dequeue+0xd64>
80409f80:	66c0206f          	j	8040c5ec <stride_dequeue+0x33cc>
80409f84:	008e2583          	lw	a1,8(t3)
80409f88:	000a0513          	mv	a0,s4
80409f8c:	004e2b03          	lw	s6,4(t3)
80409f90:	00612c23          	sw	t1,24(sp)
80409f94:	01c12a23          	sw	t3,20(sp)
80409f98:	fb1fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
80409f9c:	01412e03          	lw	t3,20(sp)
80409fa0:	01812303          	lw	t1,24(sp)
80409fa4:	00ae2223          	sw	a0,4(t3)
80409fa8:	016e2423          	sw	s6,8(t3)
80409fac:	00051463          	bnez	a0,80409fb4 <stride_dequeue+0xd94>
80409fb0:	1110206f          	j	8040c8c0 <stride_dequeue+0x36a0>
80409fb4:	008c2b03          	lw	s6,8(s8)
80409fb8:	01c52023          	sw	t3,0(a0)
80409fbc:	000e0a13          	mv	s4,t3
80409fc0:	01012783          	lw	a5,16(sp)
80409fc4:	01432223          	sw	s4,4(t1)
80409fc8:	00f32423          	sw	a5,8(t1)
80409fcc:	006a2023          	sw	t1,0(s4)
80409fd0:	00030a13          	mv	s4,t1
80409fd4:	00c12783          	lw	a5,12(sp)
80409fd8:	0149a223          	sw	s4,4(s3)
80409fdc:	00f9a423          	sw	a5,8(s3)
80409fe0:	013a2023          	sw	s3,0(s4)
80409fe4:	00812783          	lw	a5,8(sp)
80409fe8:	01342223          	sw	s3,4(s0)
80409fec:	00f42423          	sw	a5,8(s0)
80409ff0:	0089a023          	sw	s0,0(s3)
80409ff4:	000b0993          	mv	s3,s6
80409ff8:	00412783          	lw	a5,4(sp)
80409ffc:	008ca223          	sw	s0,4(s9)
8040a000:	00fca423          	sw	a5,8(s9)
8040a004:	01942023          	sw	s9,0(s0)
8040a008:	000c8413          	mv	s0,s9
8040a00c:	999ff06f          	j	804099a4 <stride_dequeue+0x784>
8040a010:	004ca783          	lw	a5,4(s9)
8040a014:	008ca883          	lw	a7,8(s9)
8040a018:	00a12623          	sw	a0,12(sp)
8040a01c:	00f12423          	sw	a5,8(sp)
8040a020:	0e088663          	beqz	a7,8040a10c <stride_dequeue+0xeec>
8040a024:	00088513          	mv	a0,a7
8040a028:	000d8593          	mv	a1,s11
8040a02c:	01112823          	sw	a7,16(sp)
8040a030:	e5dfe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a034:	00c12803          	lw	a6,12(sp)
8040a038:	01012883          	lw	a7,16(sp)
8040a03c:	41050ae3          	beq	a0,a6,8040ac50 <stride_dequeue+0x1a30>
8040a040:	004da783          	lw	a5,4(s11)
8040a044:	008da983          	lw	s3,8(s11)
8040a048:	01012823          	sw	a6,16(sp)
8040a04c:	00f12623          	sw	a5,12(sp)
8040a050:	00099463          	bnez	s3,8040a058 <stride_dequeue+0xe38>
8040a054:	4b50106f          	j	8040bd08 <stride_dequeue+0x2ae8>
8040a058:	00088513          	mv	a0,a7
8040a05c:	00098593          	mv	a1,s3
8040a060:	01112a23          	sw	a7,20(sp)
8040a064:	e29fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a068:	01012803          	lw	a6,16(sp)
8040a06c:	01412883          	lw	a7,20(sp)
8040a070:	01051463          	bne	a0,a6,8040a078 <stride_dequeue+0xe58>
8040a074:	64c0106f          	j	8040b6c0 <stride_dequeue+0x24a0>
8040a078:	0049a783          	lw	a5,4(s3)
8040a07c:	0089ae03          	lw	t3,8(s3)
8040a080:	01012a23          	sw	a6,20(sp)
8040a084:	00f12823          	sw	a5,16(sp)
8040a088:	060e0063          	beqz	t3,8040a0e8 <stride_dequeue+0xec8>
8040a08c:	000e0593          	mv	a1,t3
8040a090:	00088513          	mv	a0,a7
8040a094:	01c12e23          	sw	t3,28(sp)
8040a098:	01112c23          	sw	a7,24(sp)
8040a09c:	df1fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a0a0:	01412803          	lw	a6,20(sp)
8040a0a4:	01812883          	lw	a7,24(sp)
8040a0a8:	01c12e03          	lw	t3,28(sp)
8040a0ac:	01051463          	bne	a0,a6,8040a0b4 <stride_dequeue+0xe94>
8040a0b0:	0bc0206f          	j	8040c16c <stride_dequeue+0x2f4c>
8040a0b4:	008e2583          	lw	a1,8(t3)
8040a0b8:	00088513          	mv	a0,a7
8040a0bc:	004e2b03          	lw	s6,4(t3)
8040a0c0:	01c12a23          	sw	t3,20(sp)
8040a0c4:	e85fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a0c8:	01412e03          	lw	t3,20(sp)
8040a0cc:	00ae2223          	sw	a0,4(t3)
8040a0d0:	016e2423          	sw	s6,8(t3)
8040a0d4:	00051463          	bnez	a0,8040a0dc <stride_dequeue+0xebc>
8040a0d8:	2380206f          	j	8040c310 <stride_dequeue+0x30f0>
8040a0dc:	008c2b03          	lw	s6,8(s8)
8040a0e0:	01c52023          	sw	t3,0(a0)
8040a0e4:	000e0893          	mv	a7,t3
8040a0e8:	01012783          	lw	a5,16(sp)
8040a0ec:	0119a223          	sw	a7,4(s3)
8040a0f0:	00f9a423          	sw	a5,8(s3)
8040a0f4:	0138a023          	sw	s3,0(a7)
8040a0f8:	00c12783          	lw	a5,12(sp)
8040a0fc:	013da223          	sw	s3,4(s11)
8040a100:	00fda423          	sw	a5,8(s11)
8040a104:	01b9a023          	sw	s11,0(s3)
8040a108:	000b0993          	mv	s3,s6
8040a10c:	00812783          	lw	a5,8(sp)
8040a110:	01bca223          	sw	s11,4(s9)
8040a114:	00fca423          	sw	a5,8(s9)
8040a118:	019da023          	sw	s9,0(s11)
8040a11c:	000c8d93          	mv	s11,s9
8040a120:	d99ff06f          	j	80409eb8 <stride_dequeue+0xc98>
8040a124:	004da783          	lw	a5,4(s11)
8040a128:	008da883          	lw	a7,8(s11)
8040a12c:	00a12423          	sw	a0,8(sp)
8040a130:	00f12223          	sw	a5,4(sp)
8040a134:	10088663          	beqz	a7,8040a240 <stride_dequeue+0x1020>
8040a138:	00060593          	mv	a1,a2
8040a13c:	00088513          	mv	a0,a7
8040a140:	00c12823          	sw	a2,16(sp)
8040a144:	01112623          	sw	a7,12(sp)
8040a148:	d45fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a14c:	00812803          	lw	a6,8(sp)
8040a150:	00c12883          	lw	a7,12(sp)
8040a154:	01012603          	lw	a2,16(sp)
8040a158:	670508e3          	beq	a0,a6,8040afc8 <stride_dequeue+0x1da8>
8040a15c:	00462783          	lw	a5,4(a2)
8040a160:	00862983          	lw	s3,8(a2)
8040a164:	01012623          	sw	a6,12(sp)
8040a168:	00f12423          	sw	a5,8(sp)
8040a16c:	00099463          	bnez	s3,8040a174 <stride_dequeue+0xf54>
8040a170:	3910106f          	j	8040bd00 <stride_dequeue+0x2ae0>
8040a174:	00088513          	mv	a0,a7
8040a178:	00098593          	mv	a1,s3
8040a17c:	00c12a23          	sw	a2,20(sp)
8040a180:	01112823          	sw	a7,16(sp)
8040a184:	d09fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a188:	00c12803          	lw	a6,12(sp)
8040a18c:	01012883          	lw	a7,16(sp)
8040a190:	01412603          	lw	a2,20(sp)
8040a194:	01051463          	bne	a0,a6,8040a19c <stride_dequeue+0xf7c>
8040a198:	5a40106f          	j	8040b73c <stride_dequeue+0x251c>
8040a19c:	0049a783          	lw	a5,4(s3)
8040a1a0:	0089ae03          	lw	t3,8(s3)
8040a1a4:	01012823          	sw	a6,16(sp)
8040a1a8:	00f12623          	sw	a5,12(sp)
8040a1ac:	060e0863          	beqz	t3,8040a21c <stride_dequeue+0xffc>
8040a1b0:	000e0593          	mv	a1,t3
8040a1b4:	00088513          	mv	a0,a7
8040a1b8:	00c12e23          	sw	a2,28(sp)
8040a1bc:	01c12c23          	sw	t3,24(sp)
8040a1c0:	01112a23          	sw	a7,20(sp)
8040a1c4:	cc9fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a1c8:	01c12603          	lw	a2,28(sp)
8040a1cc:	01012803          	lw	a6,16(sp)
8040a1d0:	01412883          	lw	a7,20(sp)
8040a1d4:	00c12a23          	sw	a2,20(sp)
8040a1d8:	01812e03          	lw	t3,24(sp)
8040a1dc:	01051463          	bne	a0,a6,8040a1e4 <stride_dequeue+0xfc4>
8040a1e0:	5210106f          	j	8040bf00 <stride_dequeue+0x2ce0>
8040a1e4:	008e2583          	lw	a1,8(t3)
8040a1e8:	00088513          	mv	a0,a7
8040a1ec:	004e2b03          	lw	s6,4(t3)
8040a1f0:	01c12823          	sw	t3,16(sp)
8040a1f4:	d55fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a1f8:	01012e03          	lw	t3,16(sp)
8040a1fc:	01412603          	lw	a2,20(sp)
8040a200:	00ae2223          	sw	a0,4(t3)
8040a204:	016e2423          	sw	s6,8(t3)
8040a208:	00051463          	bnez	a0,8040a210 <stride_dequeue+0xff0>
8040a20c:	1280206f          	j	8040c334 <stride_dequeue+0x3114>
8040a210:	008c2b03          	lw	s6,8(s8)
8040a214:	01c52023          	sw	t3,0(a0)
8040a218:	000e0893          	mv	a7,t3
8040a21c:	00c12783          	lw	a5,12(sp)
8040a220:	0119a223          	sw	a7,4(s3)
8040a224:	00f9a423          	sw	a5,8(s3)
8040a228:	0138a023          	sw	s3,0(a7)
8040a22c:	00812783          	lw	a5,8(sp)
8040a230:	01362223          	sw	s3,4(a2)
8040a234:	00f62423          	sw	a5,8(a2)
8040a238:	00c9a023          	sw	a2,0(s3)
8040a23c:	000b0993          	mv	s3,s6
8040a240:	00412783          	lw	a5,4(sp)
8040a244:	00cda223          	sw	a2,4(s11)
8040a248:	00fda423          	sw	a5,8(s11)
8040a24c:	01b62023          	sw	s11,0(a2)
8040a250:	db8ff06f          	j	80409808 <stride_dequeue+0x5e8>
8040a254:	004da783          	lw	a5,4(s11)
8040a258:	008da883          	lw	a7,8(s11)
8040a25c:	00a12623          	sw	a0,12(sp)
8040a260:	00f12423          	sw	a5,8(sp)
8040a264:	0e088663          	beqz	a7,8040a350 <stride_dequeue+0x1130>
8040a268:	00088513          	mv	a0,a7
8040a26c:	000a0593          	mv	a1,s4
8040a270:	01112823          	sw	a7,16(sp)
8040a274:	c19fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a278:	00c12803          	lw	a6,12(sp)
8040a27c:	01012883          	lw	a7,16(sp)
8040a280:	2b0508e3          	beq	a0,a6,8040ad30 <stride_dequeue+0x1b10>
8040a284:	004a2783          	lw	a5,4(s4)
8040a288:	008a2983          	lw	s3,8(s4)
8040a28c:	01012823          	sw	a6,16(sp)
8040a290:	00f12623          	sw	a5,12(sp)
8040a294:	00099463          	bnez	s3,8040a29c <stride_dequeue+0x107c>
8040a298:	2810106f          	j	8040bd18 <stride_dequeue+0x2af8>
8040a29c:	00088513          	mv	a0,a7
8040a2a0:	00098593          	mv	a1,s3
8040a2a4:	01112a23          	sw	a7,20(sp)
8040a2a8:	be5fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a2ac:	01012803          	lw	a6,16(sp)
8040a2b0:	01412883          	lw	a7,20(sp)
8040a2b4:	01051463          	bne	a0,a6,8040a2bc <stride_dequeue+0x109c>
8040a2b8:	38c0106f          	j	8040b644 <stride_dequeue+0x2424>
8040a2bc:	0049a783          	lw	a5,4(s3)
8040a2c0:	0089ae03          	lw	t3,8(s3)
8040a2c4:	01012a23          	sw	a6,20(sp)
8040a2c8:	00f12823          	sw	a5,16(sp)
8040a2cc:	060e0063          	beqz	t3,8040a32c <stride_dequeue+0x110c>
8040a2d0:	000e0593          	mv	a1,t3
8040a2d4:	00088513          	mv	a0,a7
8040a2d8:	01c12e23          	sw	t3,28(sp)
8040a2dc:	01112c23          	sw	a7,24(sp)
8040a2e0:	badfe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a2e4:	01412803          	lw	a6,20(sp)
8040a2e8:	01812883          	lw	a7,24(sp)
8040a2ec:	01c12e03          	lw	t3,28(sp)
8040a2f0:	01051463          	bne	a0,a6,8040a2f8 <stride_dequeue+0x10d8>
8040a2f4:	2890106f          	j	8040bd7c <stride_dequeue+0x2b5c>
8040a2f8:	008e2583          	lw	a1,8(t3)
8040a2fc:	00088513          	mv	a0,a7
8040a300:	004e2b03          	lw	s6,4(t3)
8040a304:	01c12a23          	sw	t3,20(sp)
8040a308:	c41fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a30c:	01412e03          	lw	t3,20(sp)
8040a310:	00ae2223          	sw	a0,4(t3)
8040a314:	016e2423          	sw	s6,8(t3)
8040a318:	00051463          	bnez	a0,8040a320 <stride_dequeue+0x1100>
8040a31c:	7b50106f          	j	8040c2d0 <stride_dequeue+0x30b0>
8040a320:	008c2b03          	lw	s6,8(s8)
8040a324:	01c52023          	sw	t3,0(a0)
8040a328:	000e0893          	mv	a7,t3
8040a32c:	01012783          	lw	a5,16(sp)
8040a330:	0119a223          	sw	a7,4(s3)
8040a334:	00f9a423          	sw	a5,8(s3)
8040a338:	0138a023          	sw	s3,0(a7)
8040a33c:	00c12783          	lw	a5,12(sp)
8040a340:	013a2223          	sw	s3,4(s4)
8040a344:	00fa2423          	sw	a5,8(s4)
8040a348:	0149a023          	sw	s4,0(s3)
8040a34c:	000b0993          	mv	s3,s6
8040a350:	00812783          	lw	a5,8(sp)
8040a354:	014da223          	sw	s4,4(s11)
8040a358:	00fda423          	sw	a5,8(s11)
8040a35c:	01ba2023          	sw	s11,0(s4)
8040a360:	accff06f          	j	8040962c <stride_dequeue+0x40c>
8040a364:	00492783          	lw	a5,4(s2)
8040a368:	00892883          	lw	a7,8(s2)
8040a36c:	00a12823          	sw	a0,16(sp)
8040a370:	00f12623          	sw	a5,12(sp)
8040a374:	0a088463          	beqz	a7,8040a41c <stride_dequeue+0x11fc>
8040a378:	00080593          	mv	a1,a6
8040a37c:	00088513          	mv	a0,a7
8040a380:	01012c23          	sw	a6,24(sp)
8040a384:	01112a23          	sw	a7,20(sp)
8040a388:	b05fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a38c:	01012303          	lw	t1,16(sp)
8040a390:	01412883          	lw	a7,20(sp)
8040a394:	01812803          	lw	a6,24(sp)
8040a398:	606508e3          	beq	a0,t1,8040b1a8 <stride_dequeue+0x1f88>
8040a39c:	00482783          	lw	a5,4(a6)
8040a3a0:	00882983          	lw	s3,8(a6)
8040a3a4:	00612a23          	sw	t1,20(sp)
8040a3a8:	00f12823          	sw	a5,16(sp)
8040a3ac:	00099463          	bnez	s3,8040a3b4 <stride_dequeue+0x1194>
8040a3b0:	28c0106f          	j	8040b63c <stride_dequeue+0x241c>
8040a3b4:	00088513          	mv	a0,a7
8040a3b8:	00098593          	mv	a1,s3
8040a3bc:	01012e23          	sw	a6,28(sp)
8040a3c0:	01112c23          	sw	a7,24(sp)
8040a3c4:	ac9fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a3c8:	01412303          	lw	t1,20(sp)
8040a3cc:	01812883          	lw	a7,24(sp)
8040a3d0:	01c12803          	lw	a6,28(sp)
8040a3d4:	00651463          	bne	a0,t1,8040a3dc <stride_dequeue+0x11bc>
8040a3d8:	0bd0106f          	j	8040bc94 <stride_dequeue+0x2a74>
8040a3dc:	0089a583          	lw	a1,8(s3)
8040a3e0:	0049ab03          	lw	s6,4(s3)
8040a3e4:	00088513          	mv	a0,a7
8040a3e8:	01012a23          	sw	a6,20(sp)
8040a3ec:	b5dfe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a3f0:	00a9a223          	sw	a0,4(s3)
8040a3f4:	0169a423          	sw	s6,8(s3)
8040a3f8:	01412803          	lw	a6,20(sp)
8040a3fc:	00050463          	beqz	a0,8040a404 <stride_dequeue+0x11e4>
8040a400:	01352023          	sw	s3,0(a0)
8040a404:	008c2b03          	lw	s6,8(s8)
8040a408:	01012783          	lw	a5,16(sp)
8040a40c:	01382223          	sw	s3,4(a6)
8040a410:	00f82423          	sw	a5,8(a6)
8040a414:	0109a023          	sw	a6,0(s3)
8040a418:	000b0993          	mv	s3,s6
8040a41c:	00c12783          	lw	a5,12(sp)
8040a420:	01092223          	sw	a6,4(s2)
8040a424:	00f92423          	sw	a5,8(s2)
8040a428:	01282023          	sw	s2,0(a6)
8040a42c:	fe1fe06f          	j	8040940c <stride_dequeue+0x1ec>
8040a430:	00462783          	lw	a5,4(a2)
8040a434:	00862983          	lw	s3,8(a2)
8040a438:	00a12423          	sw	a0,8(sp)
8040a43c:	00f12223          	sw	a5,4(sp)
8040a440:	10098663          	beqz	s3,8040a54c <stride_dequeue+0x132c>
8040a444:	000a0593          	mv	a1,s4
8040a448:	00098513          	mv	a0,s3
8040a44c:	00c12623          	sw	a2,12(sp)
8040a450:	a3dfe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a454:	00812303          	lw	t1,8(sp)
8040a458:	00c12603          	lw	a2,12(sp)
8040a45c:	00651463          	bne	a0,t1,8040a464 <stride_dequeue+0x1244>
8040a460:	0180106f          	j	8040b478 <stride_dequeue+0x2258>
8040a464:	004a2783          	lw	a5,4(s4)
8040a468:	008a2883          	lw	a7,8(s4)
8040a46c:	00612623          	sw	t1,12(sp)
8040a470:	00f12423          	sw	a5,8(sp)
8040a474:	0c088463          	beqz	a7,8040a53c <stride_dequeue+0x131c>
8040a478:	00088593          	mv	a1,a7
8040a47c:	00098513          	mv	a0,s3
8040a480:	00c12a23          	sw	a2,20(sp)
8040a484:	01112823          	sw	a7,16(sp)
8040a488:	a05fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a48c:	00c12303          	lw	t1,12(sp)
8040a490:	01012883          	lw	a7,16(sp)
8040a494:	01412603          	lw	a2,20(sp)
8040a498:	00651463          	bne	a0,t1,8040a4a0 <stride_dequeue+0x1280>
8040a49c:	4a10106f          	j	8040c13c <stride_dequeue+0x2f1c>
8040a4a0:	0048a783          	lw	a5,4(a7)
8040a4a4:	0088ae03          	lw	t3,8(a7)
8040a4a8:	00612e23          	sw	t1,28(sp)
8040a4ac:	00f12623          	sw	a5,12(sp)
8040a4b0:	060e0c63          	beqz	t3,8040a528 <stride_dequeue+0x1308>
8040a4b4:	000e0593          	mv	a1,t3
8040a4b8:	00098513          	mv	a0,s3
8040a4bc:	01112c23          	sw	a7,24(sp)
8040a4c0:	00c12a23          	sw	a2,20(sp)
8040a4c4:	01c12823          	sw	t3,16(sp)
8040a4c8:	9c5fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a4cc:	01c12303          	lw	t1,28(sp)
8040a4d0:	01012e03          	lw	t3,16(sp)
8040a4d4:	01412603          	lw	a2,20(sp)
8040a4d8:	01812883          	lw	a7,24(sp)
8040a4dc:	00651463          	bne	a0,t1,8040a4e4 <stride_dequeue+0x12c4>
8040a4e0:	7d50106f          	j	8040c4b4 <stride_dequeue+0x3294>
8040a4e4:	008e2583          	lw	a1,8(t3)
8040a4e8:	00098513          	mv	a0,s3
8040a4ec:	004e2b03          	lw	s6,4(t3)
8040a4f0:	01112c23          	sw	a7,24(sp)
8040a4f4:	00c12a23          	sw	a2,20(sp)
8040a4f8:	01c12823          	sw	t3,16(sp)
8040a4fc:	a4dfe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a500:	01012e03          	lw	t3,16(sp)
8040a504:	01412603          	lw	a2,20(sp)
8040a508:	01812883          	lw	a7,24(sp)
8040a50c:	00ae2223          	sw	a0,4(t3)
8040a510:	016e2423          	sw	s6,8(t3)
8040a514:	00051463          	bnez	a0,8040a51c <stride_dequeue+0x12fc>
8040a518:	2e80206f          	j	8040c800 <stride_dequeue+0x35e0>
8040a51c:	008c2b03          	lw	s6,8(s8)
8040a520:	01c52023          	sw	t3,0(a0)
8040a524:	000e0993          	mv	s3,t3
8040a528:	00c12783          	lw	a5,12(sp)
8040a52c:	0138a223          	sw	s3,4(a7)
8040a530:	00f8a423          	sw	a5,8(a7)
8040a534:	0119a023          	sw	a7,0(s3)
8040a538:	00088993          	mv	s3,a7
8040a53c:	00812783          	lw	a5,8(sp)
8040a540:	013a2223          	sw	s3,4(s4)
8040a544:	00fa2423          	sw	a5,8(s4)
8040a548:	0149a023          	sw	s4,0(s3)
8040a54c:	00412783          	lw	a5,4(sp)
8040a550:	01462223          	sw	s4,4(a2)
8040a554:	000b0993          	mv	s3,s6
8040a558:	00f62423          	sw	a5,8(a2)
8040a55c:	00ca2023          	sw	a2,0(s4)
8040a560:	00060a13          	mv	s4,a2
8040a564:	ef4ff06f          	j	80409c58 <stride_dequeue+0xa38>
8040a568:	004ca783          	lw	a5,4(s9)
8040a56c:	008ca983          	lw	s3,8(s9)
8040a570:	00a12623          	sw	a0,12(sp)
8040a574:	00f12423          	sw	a5,8(sp)
8040a578:	0e098663          	beqz	s3,8040a664 <stride_dequeue+0x1444>
8040a57c:	000a0593          	mv	a1,s4
8040a580:	00098513          	mv	a0,s3
8040a584:	909fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a588:	00c12303          	lw	t1,12(sp)
8040a58c:	00651463          	bne	a0,t1,8040a594 <stride_dequeue+0x1374>
8040a590:	7d10006f          	j	8040b560 <stride_dequeue+0x2340>
8040a594:	004a2783          	lw	a5,4(s4)
8040a598:	008a2883          	lw	a7,8(s4)
8040a59c:	00612823          	sw	t1,16(sp)
8040a5a0:	00f12623          	sw	a5,12(sp)
8040a5a4:	0a088863          	beqz	a7,8040a654 <stride_dequeue+0x1434>
8040a5a8:	00088593          	mv	a1,a7
8040a5ac:	00098513          	mv	a0,s3
8040a5b0:	01112a23          	sw	a7,20(sp)
8040a5b4:	8d9fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a5b8:	01012303          	lw	t1,16(sp)
8040a5bc:	01412883          	lw	a7,20(sp)
8040a5c0:	00651463          	bne	a0,t1,8040a5c8 <stride_dequeue+0x13a8>
8040a5c4:	1990106f          	j	8040bf5c <stride_dequeue+0x2d3c>
8040a5c8:	0048a783          	lw	a5,4(a7)
8040a5cc:	0088ae03          	lw	t3,8(a7)
8040a5d0:	00612e23          	sw	t1,28(sp)
8040a5d4:	00f12823          	sw	a5,16(sp)
8040a5d8:	060e0463          	beqz	t3,8040a640 <stride_dequeue+0x1420>
8040a5dc:	000e0593          	mv	a1,t3
8040a5e0:	00098513          	mv	a0,s3
8040a5e4:	01112c23          	sw	a7,24(sp)
8040a5e8:	01c12a23          	sw	t3,20(sp)
8040a5ec:	8a1fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a5f0:	01c12303          	lw	t1,28(sp)
8040a5f4:	01412e03          	lw	t3,20(sp)
8040a5f8:	01812883          	lw	a7,24(sp)
8040a5fc:	00651463          	bne	a0,t1,8040a604 <stride_dequeue+0x13e4>
8040a600:	07c0206f          	j	8040c67c <stride_dequeue+0x345c>
8040a604:	008e2583          	lw	a1,8(t3)
8040a608:	00098513          	mv	a0,s3
8040a60c:	004e2b03          	lw	s6,4(t3)
8040a610:	01112c23          	sw	a7,24(sp)
8040a614:	01c12a23          	sw	t3,20(sp)
8040a618:	931fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a61c:	01412e03          	lw	t3,20(sp)
8040a620:	01812883          	lw	a7,24(sp)
8040a624:	00ae2223          	sw	a0,4(t3)
8040a628:	016e2423          	sw	s6,8(t3)
8040a62c:	00051463          	bnez	a0,8040a634 <stride_dequeue+0x1414>
8040a630:	2780206f          	j	8040c8a8 <stride_dequeue+0x3688>
8040a634:	008c2b03          	lw	s6,8(s8)
8040a638:	01c52023          	sw	t3,0(a0)
8040a63c:	000e0993          	mv	s3,t3
8040a640:	01012783          	lw	a5,16(sp)
8040a644:	0138a223          	sw	s3,4(a7)
8040a648:	00f8a423          	sw	a5,8(a7)
8040a64c:	0119a023          	sw	a7,0(s3)
8040a650:	00088993          	mv	s3,a7
8040a654:	00c12783          	lw	a5,12(sp)
8040a658:	013a2223          	sw	s3,4(s4)
8040a65c:	00fa2423          	sw	a5,8(s4)
8040a660:	0149a023          	sw	s4,0(s3)
8040a664:	00812783          	lw	a5,8(sp)
8040a668:	014ca223          	sw	s4,4(s9)
8040a66c:	000b0993          	mv	s3,s6
8040a670:	00fca423          	sw	a5,8(s9)
8040a674:	019a2023          	sw	s9,0(s4)
8040a678:	b1cff06f          	j	80409994 <stride_dequeue+0x774>
8040a67c:	004a2783          	lw	a5,4(s4)
8040a680:	008a2983          	lw	s3,8(s4)
8040a684:	00a12623          	sw	a0,12(sp)
8040a688:	00f12423          	sw	a5,8(sp)
8040a68c:	0e098663          	beqz	s3,8040a778 <stride_dequeue+0x1558>
8040a690:	000c8593          	mv	a1,s9
8040a694:	00098513          	mv	a0,s3
8040a698:	ff4fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a69c:	00c12303          	lw	t1,12(sp)
8040a6a0:	00651463          	bne	a0,t1,8040a6a8 <stride_dequeue+0x1488>
8040a6a4:	7290006f          	j	8040b5cc <stride_dequeue+0x23ac>
8040a6a8:	004ca783          	lw	a5,4(s9)
8040a6ac:	008ca883          	lw	a7,8(s9)
8040a6b0:	00612823          	sw	t1,16(sp)
8040a6b4:	00f12623          	sw	a5,12(sp)
8040a6b8:	0a088863          	beqz	a7,8040a768 <stride_dequeue+0x1548>
8040a6bc:	00088593          	mv	a1,a7
8040a6c0:	00098513          	mv	a0,s3
8040a6c4:	01112a23          	sw	a7,20(sp)
8040a6c8:	fc4fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a6cc:	01012303          	lw	t1,16(sp)
8040a6d0:	01412883          	lw	a7,20(sp)
8040a6d4:	00651463          	bne	a0,t1,8040a6dc <stride_dequeue+0x14bc>
8040a6d8:	05d0106f          	j	8040bf34 <stride_dequeue+0x2d14>
8040a6dc:	0048a783          	lw	a5,4(a7)
8040a6e0:	0088ae03          	lw	t3,8(a7)
8040a6e4:	00612e23          	sw	t1,28(sp)
8040a6e8:	00f12823          	sw	a5,16(sp)
8040a6ec:	060e0463          	beqz	t3,8040a754 <stride_dequeue+0x1534>
8040a6f0:	000e0593          	mv	a1,t3
8040a6f4:	00098513          	mv	a0,s3
8040a6f8:	01112c23          	sw	a7,24(sp)
8040a6fc:	01c12a23          	sw	t3,20(sp)
8040a700:	f8cfe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a704:	01c12303          	lw	t1,28(sp)
8040a708:	01412e03          	lw	t3,20(sp)
8040a70c:	01812883          	lw	a7,24(sp)
8040a710:	00651463          	bne	a0,t1,8040a718 <stride_dequeue+0x14f8>
8040a714:	0040206f          	j	8040c718 <stride_dequeue+0x34f8>
8040a718:	008e2583          	lw	a1,8(t3)
8040a71c:	00098513          	mv	a0,s3
8040a720:	004e2b03          	lw	s6,4(t3)
8040a724:	01112c23          	sw	a7,24(sp)
8040a728:	01c12a23          	sw	t3,20(sp)
8040a72c:	81dfe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a730:	01412e03          	lw	t3,20(sp)
8040a734:	01812883          	lw	a7,24(sp)
8040a738:	00ae2223          	sw	a0,4(t3)
8040a73c:	016e2423          	sw	s6,8(t3)
8040a740:	00051463          	bnez	a0,8040a748 <stride_dequeue+0x1528>
8040a744:	11c0206f          	j	8040c860 <stride_dequeue+0x3640>
8040a748:	008c2b03          	lw	s6,8(s8)
8040a74c:	01c52023          	sw	t3,0(a0)
8040a750:	000e0993          	mv	s3,t3
8040a754:	01012783          	lw	a5,16(sp)
8040a758:	0138a223          	sw	s3,4(a7)
8040a75c:	00f8a423          	sw	a5,8(a7)
8040a760:	0119a023          	sw	a7,0(s3)
8040a764:	00088993          	mv	s3,a7
8040a768:	00c12783          	lw	a5,12(sp)
8040a76c:	013ca223          	sw	s3,4(s9)
8040a770:	00fca423          	sw	a5,8(s9)
8040a774:	0199a023          	sw	s9,0(s3)
8040a778:	00812783          	lw	a5,8(sp)
8040a77c:	019a2223          	sw	s9,4(s4)
8040a780:	000b0993          	mv	s3,s6
8040a784:	00fa2423          	sw	a5,8(s4)
8040a788:	014ca023          	sw	s4,0(s9)
8040a78c:	000a0c93          	mv	s9,s4
8040a790:	b60ff06f          	j	80409af0 <stride_dequeue+0x8d0>
8040a794:	0048a783          	lw	a5,4(a7)
8040a798:	0088a983          	lw	s3,8(a7)
8040a79c:	00a12823          	sw	a0,16(sp)
8040a7a0:	00f12623          	sw	a5,12(sp)
8040a7a4:	0a098663          	beqz	s3,8040a850 <stride_dequeue+0x1630>
8040a7a8:	000c8593          	mv	a1,s9
8040a7ac:	00098513          	mv	a0,s3
8040a7b0:	01112a23          	sw	a7,20(sp)
8040a7b4:	ed8fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a7b8:	01012303          	lw	t1,16(sp)
8040a7bc:	01412883          	lw	a7,20(sp)
8040a7c0:	00651463          	bne	a0,t1,8040a7c8 <stride_dequeue+0x15a8>
8040a7c4:	2980106f          	j	8040ba5c <stride_dequeue+0x283c>
8040a7c8:	004ca783          	lw	a5,4(s9)
8040a7cc:	008cae03          	lw	t3,8(s9)
8040a7d0:	00612a23          	sw	t1,20(sp)
8040a7d4:	00f12823          	sw	a5,16(sp)
8040a7d8:	060e0463          	beqz	t3,8040a840 <stride_dequeue+0x1620>
8040a7dc:	000e0593          	mv	a1,t3
8040a7e0:	00098513          	mv	a0,s3
8040a7e4:	01112e23          	sw	a7,28(sp)
8040a7e8:	01c12c23          	sw	t3,24(sp)
8040a7ec:	ea0fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a7f0:	01412303          	lw	t1,20(sp)
8040a7f4:	01812e03          	lw	t3,24(sp)
8040a7f8:	01c12883          	lw	a7,28(sp)
8040a7fc:	00651463          	bne	a0,t1,8040a804 <stride_dequeue+0x15e4>
8040a800:	0e50106f          	j	8040c0e4 <stride_dequeue+0x2ec4>
8040a804:	008e2583          	lw	a1,8(t3)
8040a808:	00098513          	mv	a0,s3
8040a80c:	004e2b03          	lw	s6,4(t3)
8040a810:	01112c23          	sw	a7,24(sp)
8040a814:	01c12a23          	sw	t3,20(sp)
8040a818:	f30fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a81c:	01412e03          	lw	t3,20(sp)
8040a820:	01812883          	lw	a7,24(sp)
8040a824:	00ae2223          	sw	a0,4(t3)
8040a828:	016e2423          	sw	s6,8(t3)
8040a82c:	00051463          	bnez	a0,8040a834 <stride_dequeue+0x1614>
8040a830:	2ed0106f          	j	8040c31c <stride_dequeue+0x30fc>
8040a834:	008c2b03          	lw	s6,8(s8)
8040a838:	01c52023          	sw	t3,0(a0)
8040a83c:	000e0993          	mv	s3,t3
8040a840:	01012783          	lw	a5,16(sp)
8040a844:	013ca223          	sw	s3,4(s9)
8040a848:	00fca423          	sw	a5,8(s9)
8040a84c:	0199a023          	sw	s9,0(s3)
8040a850:	00c12783          	lw	a5,12(sp)
8040a854:	0198a223          	sw	s9,4(a7)
8040a858:	000b0993          	mv	s3,s6
8040a85c:	00f8a423          	sw	a5,8(a7)
8040a860:	011ca023          	sw	a7,0(s9)
8040a864:	00088c93          	mv	s9,a7
8040a868:	d08ff06f          	j	80409d70 <stride_dequeue+0xb50>
8040a86c:	004ca783          	lw	a5,4(s9)
8040a870:	008ca983          	lw	s3,8(s9)
8040a874:	00a12823          	sw	a0,16(sp)
8040a878:	00f12623          	sw	a5,12(sp)
8040a87c:	0a098663          	beqz	s3,8040a928 <stride_dequeue+0x1708>
8040a880:	00080593          	mv	a1,a6
8040a884:	00098513          	mv	a0,s3
8040a888:	01012a23          	sw	a6,20(sp)
8040a88c:	e00fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a890:	01012303          	lw	t1,16(sp)
8040a894:	01412803          	lw	a6,20(sp)
8040a898:	00651463          	bne	a0,t1,8040a8a0 <stride_dequeue+0x1680>
8040a89c:	7b90006f          	j	8040b854 <stride_dequeue+0x2634>
8040a8a0:	00482783          	lw	a5,4(a6)
8040a8a4:	00882e03          	lw	t3,8(a6)
8040a8a8:	00612a23          	sw	t1,20(sp)
8040a8ac:	00f12823          	sw	a5,16(sp)
8040a8b0:	060e0463          	beqz	t3,8040a918 <stride_dequeue+0x16f8>
8040a8b4:	000e0593          	mv	a1,t3
8040a8b8:	00098513          	mv	a0,s3
8040a8bc:	01012e23          	sw	a6,28(sp)
8040a8c0:	01c12c23          	sw	t3,24(sp)
8040a8c4:	dc8fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a8c8:	01412303          	lw	t1,20(sp)
8040a8cc:	01812e03          	lw	t3,24(sp)
8040a8d0:	01c12803          	lw	a6,28(sp)
8040a8d4:	00651463          	bne	a0,t1,8040a8dc <stride_dequeue+0x16bc>
8040a8d8:	7a80106f          	j	8040c080 <stride_dequeue+0x2e60>
8040a8dc:	008e2583          	lw	a1,8(t3)
8040a8e0:	00098513          	mv	a0,s3
8040a8e4:	004e2b03          	lw	s6,4(t3)
8040a8e8:	01012c23          	sw	a6,24(sp)
8040a8ec:	01c12a23          	sw	t3,20(sp)
8040a8f0:	e58fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a8f4:	01412e03          	lw	t3,20(sp)
8040a8f8:	01812803          	lw	a6,24(sp)
8040a8fc:	00ae2223          	sw	a0,4(t3)
8040a900:	016e2423          	sw	s6,8(t3)
8040a904:	00051463          	bnez	a0,8040a90c <stride_dequeue+0x16ec>
8040a908:	1950106f          	j	8040c29c <stride_dequeue+0x307c>
8040a90c:	008c2b03          	lw	s6,8(s8)
8040a910:	01c52023          	sw	t3,0(a0)
8040a914:	000e0993          	mv	s3,t3
8040a918:	01012783          	lw	a5,16(sp)
8040a91c:	01382223          	sw	s3,4(a6)
8040a920:	00f82423          	sw	a5,8(a6)
8040a924:	0109a023          	sw	a6,0(s3)
8040a928:	00c12783          	lw	a5,12(sp)
8040a92c:	010ca223          	sw	a6,4(s9)
8040a930:	000b0993          	mv	s3,s6
8040a934:	00fca423          	sw	a5,8(s9)
8040a938:	01982023          	sw	s9,0(a6)
8040a93c:	d6cff06f          	j	80409ea8 <stride_dequeue+0xc88>
8040a940:	004da783          	lw	a5,4(s11)
8040a944:	008da983          	lw	s3,8(s11)
8040a948:	00a12823          	sw	a0,16(sp)
8040a94c:	00f12623          	sw	a5,12(sp)
8040a950:	0a098663          	beqz	s3,8040a9fc <stride_dequeue+0x17dc>
8040a954:	00080593          	mv	a1,a6
8040a958:	00098513          	mv	a0,s3
8040a95c:	01012a23          	sw	a6,20(sp)
8040a960:	d2cfe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a964:	01012303          	lw	t1,16(sp)
8040a968:	01412803          	lw	a6,20(sp)
8040a96c:	00651463          	bne	a0,t1,8040a974 <stride_dequeue+0x1754>
8040a970:	76d0006f          	j	8040b8dc <stride_dequeue+0x26bc>
8040a974:	00482783          	lw	a5,4(a6)
8040a978:	00882e03          	lw	t3,8(a6)
8040a97c:	00612a23          	sw	t1,20(sp)
8040a980:	00f12823          	sw	a5,16(sp)
8040a984:	060e0463          	beqz	t3,8040a9ec <stride_dequeue+0x17cc>
8040a988:	000e0593          	mv	a1,t3
8040a98c:	00098513          	mv	a0,s3
8040a990:	01012e23          	sw	a6,28(sp)
8040a994:	01c12c23          	sw	t3,24(sp)
8040a998:	cf4fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040a99c:	01412303          	lw	t1,20(sp)
8040a9a0:	01812e03          	lw	t3,24(sp)
8040a9a4:	01c12803          	lw	a6,28(sp)
8040a9a8:	00651463          	bne	a0,t1,8040a9b0 <stride_dequeue+0x1790>
8040a9ac:	4f40106f          	j	8040bea0 <stride_dequeue+0x2c80>
8040a9b0:	008e2583          	lw	a1,8(t3)
8040a9b4:	00098513          	mv	a0,s3
8040a9b8:	004e2b03          	lw	s6,4(t3)
8040a9bc:	01012c23          	sw	a6,24(sp)
8040a9c0:	01c12a23          	sw	t3,20(sp)
8040a9c4:	d84fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040a9c8:	01412e03          	lw	t3,20(sp)
8040a9cc:	01812803          	lw	a6,24(sp)
8040a9d0:	00ae2223          	sw	a0,4(t3)
8040a9d4:	016e2423          	sw	s6,8(t3)
8040a9d8:	00051463          	bnez	a0,8040a9e0 <stride_dequeue+0x17c0>
8040a9dc:	0a90106f          	j	8040c284 <stride_dequeue+0x3064>
8040a9e0:	008c2b03          	lw	s6,8(s8)
8040a9e4:	01c52023          	sw	t3,0(a0)
8040a9e8:	000e0993          	mv	s3,t3
8040a9ec:	01012783          	lw	a5,16(sp)
8040a9f0:	01382223          	sw	s3,4(a6)
8040a9f4:	00f82423          	sw	a5,8(a6)
8040a9f8:	0109a023          	sw	a6,0(s3)
8040a9fc:	00c12783          	lw	a5,12(sp)
8040aa00:	010da223          	sw	a6,4(s11)
8040aa04:	000b0993          	mv	s3,s6
8040aa08:	00fda423          	sw	a5,8(s11)
8040aa0c:	01b82023          	sw	s11,0(a6)
8040aa10:	c09fe06f          	j	80409618 <stride_dequeue+0x3f8>
8040aa14:	004da783          	lw	a5,4(s11)
8040aa18:	008da983          	lw	s3,8(s11)
8040aa1c:	00a12623          	sw	a0,12(sp)
8040aa20:	00f12423          	sw	a5,8(sp)
8040aa24:	0c098263          	beqz	s3,8040aae8 <stride_dequeue+0x18c8>
8040aa28:	00080593          	mv	a1,a6
8040aa2c:	00098513          	mv	a0,s3
8040aa30:	00c12a23          	sw	a2,20(sp)
8040aa34:	01012823          	sw	a6,16(sp)
8040aa38:	c54fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040aa3c:	00c12303          	lw	t1,12(sp)
8040aa40:	01012803          	lw	a6,16(sp)
8040aa44:	01412603          	lw	a2,20(sp)
8040aa48:	00651463          	bne	a0,t1,8040aa50 <stride_dequeue+0x1830>
8040aa4c:	0980106f          	j	8040bae4 <stride_dequeue+0x28c4>
8040aa50:	00482783          	lw	a5,4(a6)
8040aa54:	00882e03          	lw	t3,8(a6)
8040aa58:	00612823          	sw	t1,16(sp)
8040aa5c:	00f12623          	sw	a5,12(sp)
8040aa60:	060e0c63          	beqz	t3,8040aad8 <stride_dequeue+0x18b8>
8040aa64:	000e0593          	mv	a1,t3
8040aa68:	00098513          	mv	a0,s3
8040aa6c:	01012e23          	sw	a6,28(sp)
8040aa70:	00c12c23          	sw	a2,24(sp)
8040aa74:	01c12a23          	sw	t3,20(sp)
8040aa78:	c14fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040aa7c:	01012303          	lw	t1,16(sp)
8040aa80:	01412e03          	lw	t3,20(sp)
8040aa84:	01812603          	lw	a2,24(sp)
8040aa88:	01c12803          	lw	a6,28(sp)
8040aa8c:	00651463          	bne	a0,t1,8040aa94 <stride_dequeue+0x1874>
8040aa90:	3b00106f          	j	8040be40 <stride_dequeue+0x2c20>
8040aa94:	008e2583          	lw	a1,8(t3)
8040aa98:	00098513          	mv	a0,s3
8040aa9c:	004e2b03          	lw	s6,4(t3)
8040aaa0:	01012c23          	sw	a6,24(sp)
8040aaa4:	00c12a23          	sw	a2,20(sp)
8040aaa8:	01c12823          	sw	t3,16(sp)
8040aaac:	c9cfe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040aab0:	01012e03          	lw	t3,16(sp)
8040aab4:	01412603          	lw	a2,20(sp)
8040aab8:	01812803          	lw	a6,24(sp)
8040aabc:	00ae2223          	sw	a0,4(t3)
8040aac0:	016e2423          	sw	s6,8(t3)
8040aac4:	00051463          	bnez	a0,8040aacc <stride_dequeue+0x18ac>
8040aac8:	0610106f          	j	8040c328 <stride_dequeue+0x3108>
8040aacc:	008c2b03          	lw	s6,8(s8)
8040aad0:	01c52023          	sw	t3,0(a0)
8040aad4:	000e0993          	mv	s3,t3
8040aad8:	00c12783          	lw	a5,12(sp)
8040aadc:	01382223          	sw	s3,4(a6)
8040aae0:	00f82423          	sw	a5,8(a6)
8040aae4:	0109a023          	sw	a6,0(s3)
8040aae8:	00812783          	lw	a5,8(sp)
8040aaec:	010da223          	sw	a6,4(s11)
8040aaf0:	000b0993          	mv	s3,s6
8040aaf4:	00fda423          	sw	a5,8(s11)
8040aaf8:	01b82023          	sw	s11,0(a6)
8040aafc:	cf9fe06f          	j	804097f4 <stride_dequeue+0x5d4>
8040ab00:	00492703          	lw	a4,4(s2)
8040ab04:	00892983          	lw	s3,8(s2)
8040ab08:	00a12a23          	sw	a0,20(sp)
8040ab0c:	00e12823          	sw	a4,16(sp)
8040ab10:	06098063          	beqz	s3,8040ab70 <stride_dequeue+0x1950>
8040ab14:	00078593          	mv	a1,a5
8040ab18:	00098513          	mv	a0,s3
8040ab1c:	01012e23          	sw	a6,28(sp)
8040ab20:	00f12c23          	sw	a5,24(sp)
8040ab24:	b68fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ab28:	01412e03          	lw	t3,20(sp)
8040ab2c:	01812783          	lw	a5,24(sp)
8040ab30:	01c12803          	lw	a6,28(sp)
8040ab34:	01c51463          	bne	a0,t3,8040ab3c <stride_dequeue+0x191c>
8040ab38:	0840106f          	j	8040bbbc <stride_dequeue+0x299c>
8040ab3c:	0087a583          	lw	a1,8(a5)
8040ab40:	00098513          	mv	a0,s3
8040ab44:	0047ab03          	lw	s6,4(a5)
8040ab48:	01012c23          	sw	a6,24(sp)
8040ab4c:	00f12a23          	sw	a5,20(sp)
8040ab50:	bf8fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040ab54:	01412783          	lw	a5,20(sp)
8040ab58:	01812803          	lw	a6,24(sp)
8040ab5c:	00a7a223          	sw	a0,4(a5)
8040ab60:	0167a423          	sw	s6,8(a5)
8040ab64:	00050463          	beqz	a0,8040ab6c <stride_dequeue+0x194c>
8040ab68:	00f52023          	sw	a5,0(a0)
8040ab6c:	008c2b03          	lw	s6,8(s8)
8040ab70:	01012703          	lw	a4,16(sp)
8040ab74:	00f92223          	sw	a5,4(s2)
8040ab78:	000b0993          	mv	s3,s6
8040ab7c:	00e92423          	sw	a4,8(s2)
8040ab80:	0127a023          	sw	s2,0(a5)
8040ab84:	875fe06f          	j	804093f8 <stride_dequeue+0x1d8>
8040ab88:	004a2783          	lw	a5,4(s4)
8040ab8c:	008a2983          	lw	s3,8(s4)
8040ab90:	00a12623          	sw	a0,12(sp)
8040ab94:	00f12423          	sw	a5,8(sp)
8040ab98:	00099463          	bnez	s3,8040aba0 <stride_dequeue+0x1980>
8040ab9c:	4180106f          	j	8040bfb4 <stride_dequeue+0x2d94>
8040aba0:	00040593          	mv	a1,s0
8040aba4:	00098513          	mv	a0,s3
8040aba8:	ae4fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040abac:	00c12803          	lw	a6,12(sp)
8040abb0:	01051463          	bne	a0,a6,8040abb8 <stride_dequeue+0x1998>
8040abb4:	16c0106f          	j	8040bd20 <stride_dequeue+0x2b00>
8040abb8:	00442783          	lw	a5,4(s0)
8040abbc:	00842883          	lw	a7,8(s0)
8040abc0:	01012a23          	sw	a6,20(sp)
8040abc4:	00f12623          	sw	a5,12(sp)
8040abc8:	04088c63          	beqz	a7,8040ac20 <stride_dequeue+0x1a00>
8040abcc:	00088593          	mv	a1,a7
8040abd0:	00098513          	mv	a0,s3
8040abd4:	01112823          	sw	a7,16(sp)
8040abd8:	ab4fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040abdc:	01412803          	lw	a6,20(sp)
8040abe0:	01012883          	lw	a7,16(sp)
8040abe4:	01051463          	bne	a0,a6,8040abec <stride_dequeue+0x19cc>
8040abe8:	6c00106f          	j	8040c2a8 <stride_dequeue+0x3088>
8040abec:	0088a583          	lw	a1,8(a7)
8040abf0:	00098513          	mv	a0,s3
8040abf4:	0048ab03          	lw	s6,4(a7)
8040abf8:	01112823          	sw	a7,16(sp)
8040abfc:	b4cfe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040ac00:	01012883          	lw	a7,16(sp)
8040ac04:	00a8a223          	sw	a0,4(a7)
8040ac08:	0168a423          	sw	s6,8(a7)
8040ac0c:	00051463          	bnez	a0,8040ac14 <stride_dequeue+0x19f4>
8040ac10:	7900106f          	j	8040c3a0 <stride_dequeue+0x3180>
8040ac14:	008c2b03          	lw	s6,8(s8)
8040ac18:	01152023          	sw	a7,0(a0)
8040ac1c:	00088993          	mv	s3,a7
8040ac20:	00c12783          	lw	a5,12(sp)
8040ac24:	01342223          	sw	s3,4(s0)
8040ac28:	00f42423          	sw	a5,8(s0)
8040ac2c:	0089a023          	sw	s0,0(s3)
8040ac30:	00040993          	mv	s3,s0
8040ac34:	00812783          	lw	a5,8(sp)
8040ac38:	013a2223          	sw	s3,4(s4)
8040ac3c:	000a0413          	mv	s0,s4
8040ac40:	00fa2423          	sw	a5,8(s4)
8040ac44:	0149a023          	sw	s4,0(s3)
8040ac48:	000b0993          	mv	s3,s6
8040ac4c:	bacff06f          	j	80409ff8 <stride_dequeue+0xdd8>
8040ac50:	0048a783          	lw	a5,4(a7)
8040ac54:	0088a983          	lw	s3,8(a7)
8040ac58:	00a12823          	sw	a0,16(sp)
8040ac5c:	00f12623          	sw	a5,12(sp)
8040ac60:	00099463          	bnez	s3,8040ac68 <stride_dequeue+0x1a48>
8040ac64:	5a40106f          	j	8040c208 <stride_dequeue+0x2fe8>
8040ac68:	000d8593          	mv	a1,s11
8040ac6c:	00098513          	mv	a0,s3
8040ac70:	01112a23          	sw	a7,20(sp)
8040ac74:	a18fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ac78:	01012303          	lw	t1,16(sp)
8040ac7c:	01412883          	lw	a7,20(sp)
8040ac80:	00651463          	bne	a0,t1,8040ac88 <stride_dequeue+0x1a68>
8040ac84:	54c0106f          	j	8040c1d0 <stride_dequeue+0x2fb0>
8040ac88:	004da783          	lw	a5,4(s11)
8040ac8c:	008dae03          	lw	t3,8(s11)
8040ac90:	00612e23          	sw	t1,28(sp)
8040ac94:	00f12823          	sw	a5,16(sp)
8040ac98:	060e0463          	beqz	t3,8040ad00 <stride_dequeue+0x1ae0>
8040ac9c:	000e0593          	mv	a1,t3
8040aca0:	00098513          	mv	a0,s3
8040aca4:	01112c23          	sw	a7,24(sp)
8040aca8:	01c12a23          	sw	t3,20(sp)
8040acac:	9e0fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040acb0:	01c12303          	lw	t1,28(sp)
8040acb4:	01412e03          	lw	t3,20(sp)
8040acb8:	01812883          	lw	a7,24(sp)
8040acbc:	00651463          	bne	a0,t1,8040acc4 <stride_dequeue+0x1aa4>
8040acc0:	2890106f          	j	8040c748 <stride_dequeue+0x3528>
8040acc4:	008e2583          	lw	a1,8(t3)
8040acc8:	00098513          	mv	a0,s3
8040accc:	004e2b03          	lw	s6,4(t3)
8040acd0:	01112c23          	sw	a7,24(sp)
8040acd4:	01c12a23          	sw	t3,20(sp)
8040acd8:	a70fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040acdc:	01412e03          	lw	t3,20(sp)
8040ace0:	01812883          	lw	a7,24(sp)
8040ace4:	00ae2223          	sw	a0,4(t3)
8040ace8:	016e2423          	sw	s6,8(t3)
8040acec:	00051463          	bnez	a0,8040acf4 <stride_dequeue+0x1ad4>
8040acf0:	3590106f          	j	8040c848 <stride_dequeue+0x3628>
8040acf4:	008c2b03          	lw	s6,8(s8)
8040acf8:	01c52023          	sw	t3,0(a0)
8040acfc:	000e0993          	mv	s3,t3
8040ad00:	01012783          	lw	a5,16(sp)
8040ad04:	013da223          	sw	s3,4(s11)
8040ad08:	00fda423          	sw	a5,8(s11)
8040ad0c:	01b9a023          	sw	s11,0(s3)
8040ad10:	000d8993          	mv	s3,s11
8040ad14:	00c12783          	lw	a5,12(sp)
8040ad18:	0138a223          	sw	s3,4(a7)
8040ad1c:	00088d93          	mv	s11,a7
8040ad20:	00f8a423          	sw	a5,8(a7)
8040ad24:	0119a023          	sw	a7,0(s3)
8040ad28:	000b0993          	mv	s3,s6
8040ad2c:	be0ff06f          	j	8040a10c <stride_dequeue+0xeec>
8040ad30:	0048a783          	lw	a5,4(a7)
8040ad34:	0088a983          	lw	s3,8(a7)
8040ad38:	00a12823          	sw	a0,16(sp)
8040ad3c:	00f12623          	sw	a5,12(sp)
8040ad40:	00099463          	bnez	s3,8040ad48 <stride_dequeue+0x1b28>
8040ad44:	4e40106f          	j	8040c228 <stride_dequeue+0x3008>
8040ad48:	000a0593          	mv	a1,s4
8040ad4c:	00098513          	mv	a0,s3
8040ad50:	01112a23          	sw	a7,20(sp)
8040ad54:	938fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ad58:	01012303          	lw	t1,16(sp)
8040ad5c:	01412883          	lw	a7,20(sp)
8040ad60:	00651463          	bne	a0,t1,8040ad68 <stride_dequeue+0x1b48>
8040ad64:	0ac0106f          	j	8040be10 <stride_dequeue+0x2bf0>
8040ad68:	004a2783          	lw	a5,4(s4)
8040ad6c:	008a2e03          	lw	t3,8(s4)
8040ad70:	00612e23          	sw	t1,28(sp)
8040ad74:	00f12823          	sw	a5,16(sp)
8040ad78:	060e0463          	beqz	t3,8040ade0 <stride_dequeue+0x1bc0>
8040ad7c:	000e0593          	mv	a1,t3
8040ad80:	00098513          	mv	a0,s3
8040ad84:	01112c23          	sw	a7,24(sp)
8040ad88:	01c12a23          	sw	t3,20(sp)
8040ad8c:	900fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ad90:	01c12303          	lw	t1,28(sp)
8040ad94:	01412e03          	lw	t3,20(sp)
8040ad98:	01812883          	lw	a7,24(sp)
8040ad9c:	00651463          	bne	a0,t1,8040ada4 <stride_dequeue+0x1b84>
8040ada0:	07d0106f          	j	8040c61c <stride_dequeue+0x33fc>
8040ada4:	008e2583          	lw	a1,8(t3)
8040ada8:	00098513          	mv	a0,s3
8040adac:	004e2b03          	lw	s6,4(t3)
8040adb0:	01112c23          	sw	a7,24(sp)
8040adb4:	01c12a23          	sw	t3,20(sp)
8040adb8:	990fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040adbc:	01412e03          	lw	t3,20(sp)
8040adc0:	01812883          	lw	a7,24(sp)
8040adc4:	00ae2223          	sw	a0,4(t3)
8040adc8:	016e2423          	sw	s6,8(t3)
8040adcc:	00051463          	bnez	a0,8040add4 <stride_dequeue+0x1bb4>
8040add0:	2190106f          	j	8040c7e8 <stride_dequeue+0x35c8>
8040add4:	008c2b03          	lw	s6,8(s8)
8040add8:	01c52023          	sw	t3,0(a0)
8040addc:	000e0993          	mv	s3,t3
8040ade0:	01012783          	lw	a5,16(sp)
8040ade4:	013a2223          	sw	s3,4(s4)
8040ade8:	00fa2423          	sw	a5,8(s4)
8040adec:	0149a023          	sw	s4,0(s3)
8040adf0:	000a0993          	mv	s3,s4
8040adf4:	00c12783          	lw	a5,12(sp)
8040adf8:	0138a223          	sw	s3,4(a7)
8040adfc:	00088a13          	mv	s4,a7
8040ae00:	00f8a423          	sw	a5,8(a7)
8040ae04:	0119a023          	sw	a7,0(s3)
8040ae08:	000b0993          	mv	s3,s6
8040ae0c:	d44ff06f          	j	8040a350 <stride_dequeue+0x1130>
8040ae10:	004ca783          	lw	a5,4(s9)
8040ae14:	008ca983          	lw	s3,8(s9)
8040ae18:	00a12823          	sw	a0,16(sp)
8040ae1c:	00f12623          	sw	a5,12(sp)
8040ae20:	00099463          	bnez	s3,8040ae28 <stride_dequeue+0x1c08>
8040ae24:	3dc0106f          	j	8040c200 <stride_dequeue+0x2fe0>
8040ae28:	00080593          	mv	a1,a6
8040ae2c:	00098513          	mv	a0,s3
8040ae30:	01012a23          	sw	a6,20(sp)
8040ae34:	858fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ae38:	01012303          	lw	t1,16(sp)
8040ae3c:	01412803          	lw	a6,20(sp)
8040ae40:	00651463          	bne	a0,t1,8040ae48 <stride_dequeue+0x1c28>
8040ae44:	1a80106f          	j	8040bfec <stride_dequeue+0x2dcc>
8040ae48:	00482783          	lw	a5,4(a6)
8040ae4c:	00882e03          	lw	t3,8(a6)
8040ae50:	00612e23          	sw	t1,28(sp)
8040ae54:	00f12823          	sw	a5,16(sp)
8040ae58:	060e0463          	beqz	t3,8040aec0 <stride_dequeue+0x1ca0>
8040ae5c:	000e0593          	mv	a1,t3
8040ae60:	00098513          	mv	a0,s3
8040ae64:	01012c23          	sw	a6,24(sp)
8040ae68:	01c12a23          	sw	t3,20(sp)
8040ae6c:	820fe0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ae70:	01c12303          	lw	t1,28(sp)
8040ae74:	01412e03          	lw	t3,20(sp)
8040ae78:	01812803          	lw	a6,24(sp)
8040ae7c:	00651463          	bne	a0,t1,8040ae84 <stride_dequeue+0x1c64>
8040ae80:	7cc0106f          	j	8040c64c <stride_dequeue+0x342c>
8040ae84:	008e2583          	lw	a1,8(t3)
8040ae88:	00098513          	mv	a0,s3
8040ae8c:	004e2b03          	lw	s6,4(t3)
8040ae90:	01012c23          	sw	a6,24(sp)
8040ae94:	01c12a23          	sw	t3,20(sp)
8040ae98:	8b0fe0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040ae9c:	01412e03          	lw	t3,20(sp)
8040aea0:	01812803          	lw	a6,24(sp)
8040aea4:	00ae2223          	sw	a0,4(t3)
8040aea8:	016e2423          	sw	s6,8(t3)
8040aeac:	00051463          	bnez	a0,8040aeb4 <stride_dequeue+0x1c94>
8040aeb0:	1450106f          	j	8040c7f4 <stride_dequeue+0x35d4>
8040aeb4:	008c2b03          	lw	s6,8(s8)
8040aeb8:	01c52023          	sw	t3,0(a0)
8040aebc:	000e0993          	mv	s3,t3
8040aec0:	01012783          	lw	a5,16(sp)
8040aec4:	01382223          	sw	s3,4(a6)
8040aec8:	00f82423          	sw	a5,8(a6)
8040aecc:	0109a023          	sw	a6,0(s3)
8040aed0:	00080993          	mv	s3,a6
8040aed4:	00c12783          	lw	a5,12(sp)
8040aed8:	013ca223          	sw	s3,4(s9)
8040aedc:	00fca423          	sw	a5,8(s9)
8040aee0:	0199a023          	sw	s9,0(s3)
8040aee4:	000b0993          	mv	s3,s6
8040aee8:	a99fe06f          	j	80409980 <stride_dequeue+0x760>
8040aeec:	004a2783          	lw	a5,4(s4)
8040aef0:	008a2983          	lw	s3,8(s4)
8040aef4:	00a12823          	sw	a0,16(sp)
8040aef8:	00f12623          	sw	a5,12(sp)
8040aefc:	00099463          	bnez	s3,8040af04 <stride_dequeue+0x1ce4>
8040af00:	3100106f          	j	8040c210 <stride_dequeue+0x2ff0>
8040af04:	00080593          	mv	a1,a6
8040af08:	00098513          	mv	a0,s3
8040af0c:	01012a23          	sw	a6,20(sp)
8040af10:	f7dfd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040af14:	01012303          	lw	t1,16(sp)
8040af18:	01412803          	lw	a6,20(sp)
8040af1c:	00651463          	bne	a0,t1,8040af24 <stride_dequeue+0x1d04>
8040af20:	7590006f          	j	8040be78 <stride_dequeue+0x2c58>
8040af24:	00482783          	lw	a5,4(a6)
8040af28:	00882e03          	lw	t3,8(a6)
8040af2c:	00612e23          	sw	t1,28(sp)
8040af30:	00f12823          	sw	a5,16(sp)
8040af34:	060e0463          	beqz	t3,8040af9c <stride_dequeue+0x1d7c>
8040af38:	000e0593          	mv	a1,t3
8040af3c:	00098513          	mv	a0,s3
8040af40:	01012c23          	sw	a6,24(sp)
8040af44:	01c12a23          	sw	t3,20(sp)
8040af48:	f45fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040af4c:	01c12303          	lw	t1,28(sp)
8040af50:	01412e03          	lw	t3,20(sp)
8040af54:	01812803          	lw	a6,24(sp)
8040af58:	00651463          	bne	a0,t1,8040af60 <stride_dequeue+0x1d40>
8040af5c:	4500106f          	j	8040c3ac <stride_dequeue+0x318c>
8040af60:	008e2583          	lw	a1,8(t3)
8040af64:	00098513          	mv	a0,s3
8040af68:	004e2b03          	lw	s6,4(t3)
8040af6c:	01012c23          	sw	a6,24(sp)
8040af70:	01c12a23          	sw	t3,20(sp)
8040af74:	fd5fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040af78:	01412e03          	lw	t3,20(sp)
8040af7c:	01812803          	lw	a6,24(sp)
8040af80:	00ae2223          	sw	a0,4(t3)
8040af84:	016e2423          	sw	s6,8(t3)
8040af88:	00051463          	bnez	a0,8040af90 <stride_dequeue+0x1d70>
8040af8c:	0f90106f          	j	8040c884 <stride_dequeue+0x3664>
8040af90:	008c2b03          	lw	s6,8(s8)
8040af94:	01c52023          	sw	t3,0(a0)
8040af98:	000e0993          	mv	s3,t3
8040af9c:	01012783          	lw	a5,16(sp)
8040afa0:	01382223          	sw	s3,4(a6)
8040afa4:	00f82423          	sw	a5,8(a6)
8040afa8:	0109a023          	sw	a6,0(s3)
8040afac:	00080993          	mv	s3,a6
8040afb0:	00c12783          	lw	a5,12(sp)
8040afb4:	013a2223          	sw	s3,4(s4)
8040afb8:	00fa2423          	sw	a5,8(s4)
8040afbc:	0149a023          	sw	s4,0(s3)
8040afc0:	000b0993          	mv	s3,s6
8040afc4:	b1dfe06f          	j	80409ae0 <stride_dequeue+0x8c0>
8040afc8:	0048a783          	lw	a5,4(a7)
8040afcc:	0088a983          	lw	s3,8(a7)
8040afd0:	00a12623          	sw	a0,12(sp)
8040afd4:	00f12423          	sw	a5,8(sp)
8040afd8:	00099463          	bnez	s3,8040afe0 <stride_dequeue+0x1dc0>
8040afdc:	2440106f          	j	8040c220 <stride_dequeue+0x3000>
8040afe0:	00060593          	mv	a1,a2
8040afe4:	00098513          	mv	a0,s3
8040afe8:	01112a23          	sw	a7,20(sp)
8040afec:	ea1fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040aff0:	00c12303          	lw	t1,12(sp)
8040aff4:	01012603          	lw	a2,16(sp)
8040aff8:	01412883          	lw	a7,20(sp)
8040affc:	5e6502e3          	beq	a0,t1,8040bde0 <stride_dequeue+0x2bc0>
8040b000:	00462783          	lw	a5,4(a2)
8040b004:	00862e03          	lw	t3,8(a2)
8040b008:	00612e23          	sw	t1,28(sp)
8040b00c:	00f12623          	sw	a5,12(sp)
8040b010:	060e0c63          	beqz	t3,8040b088 <stride_dequeue+0x1e68>
8040b014:	000e0593          	mv	a1,t3
8040b018:	00098513          	mv	a0,s3
8040b01c:	01112c23          	sw	a7,24(sp)
8040b020:	00c12a23          	sw	a2,20(sp)
8040b024:	01c12823          	sw	t3,16(sp)
8040b028:	e65fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b02c:	01c12303          	lw	t1,28(sp)
8040b030:	01012e03          	lw	t3,16(sp)
8040b034:	01412603          	lw	a2,20(sp)
8040b038:	01812883          	lw	a7,24(sp)
8040b03c:	00651463          	bne	a0,t1,8040b044 <stride_dequeue+0x1e24>
8040b040:	3d00106f          	j	8040c410 <stride_dequeue+0x31f0>
8040b044:	008e2583          	lw	a1,8(t3)
8040b048:	00098513          	mv	a0,s3
8040b04c:	004e2b03          	lw	s6,4(t3)
8040b050:	01112c23          	sw	a7,24(sp)
8040b054:	00c12a23          	sw	a2,20(sp)
8040b058:	01c12823          	sw	t3,16(sp)
8040b05c:	eedfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b060:	01012e03          	lw	t3,16(sp)
8040b064:	01412603          	lw	a2,20(sp)
8040b068:	01812883          	lw	a7,24(sp)
8040b06c:	00ae2223          	sw	a0,4(t3)
8040b070:	016e2423          	sw	s6,8(t3)
8040b074:	00051463          	bnez	a0,8040b07c <stride_dequeue+0x1e5c>
8040b078:	0190106f          	j	8040c890 <stride_dequeue+0x3670>
8040b07c:	008c2b03          	lw	s6,8(s8)
8040b080:	01c52023          	sw	t3,0(a0)
8040b084:	000e0993          	mv	s3,t3
8040b088:	00c12783          	lw	a5,12(sp)
8040b08c:	01362223          	sw	s3,4(a2)
8040b090:	00f62423          	sw	a5,8(a2)
8040b094:	00c9a023          	sw	a2,0(s3)
8040b098:	00060993          	mv	s3,a2
8040b09c:	00812783          	lw	a5,8(sp)
8040b0a0:	0138a223          	sw	s3,4(a7)
8040b0a4:	00088613          	mv	a2,a7
8040b0a8:	00f8a423          	sw	a5,8(a7)
8040b0ac:	0119a023          	sw	a7,0(s3)
8040b0b0:	000b0993          	mv	s3,s6
8040b0b4:	98cff06f          	j	8040a240 <stride_dequeue+0x1020>
8040b0b8:	00462783          	lw	a5,4(a2)
8040b0bc:	00862983          	lw	s3,8(a2)
8040b0c0:	00a12623          	sw	a0,12(sp)
8040b0c4:	00f12423          	sw	a5,8(sp)
8040b0c8:	00099463          	bnez	s3,8040b0d0 <stride_dequeue+0x1eb0>
8040b0cc:	14c0106f          	j	8040c218 <stride_dequeue+0x2ff8>
8040b0d0:	00080593          	mv	a1,a6
8040b0d4:	00098513          	mv	a0,s3
8040b0d8:	00c12a23          	sw	a2,20(sp)
8040b0dc:	01012823          	sw	a6,16(sp)
8040b0e0:	dadfd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b0e4:	00c12303          	lw	t1,12(sp)
8040b0e8:	01012803          	lw	a6,16(sp)
8040b0ec:	01412603          	lw	a2,20(sp)
8040b0f0:	5e6500e3          	beq	a0,t1,8040bed0 <stride_dequeue+0x2cb0>
8040b0f4:	00482783          	lw	a5,4(a6)
8040b0f8:	00882e03          	lw	t3,8(a6)
8040b0fc:	00612e23          	sw	t1,28(sp)
8040b100:	00f12623          	sw	a5,12(sp)
8040b104:	060e0c63          	beqz	t3,8040b17c <stride_dequeue+0x1f5c>
8040b108:	000e0593          	mv	a1,t3
8040b10c:	00098513          	mv	a0,s3
8040b110:	01012c23          	sw	a6,24(sp)
8040b114:	00c12a23          	sw	a2,20(sp)
8040b118:	01c12823          	sw	t3,16(sp)
8040b11c:	d71fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b120:	01c12303          	lw	t1,28(sp)
8040b124:	01012e03          	lw	t3,16(sp)
8040b128:	01412603          	lw	a2,20(sp)
8040b12c:	01812803          	lw	a6,24(sp)
8040b130:	00651463          	bne	a0,t1,8040b138 <stride_dequeue+0x1f18>
8040b134:	3b80106f          	j	8040c4ec <stride_dequeue+0x32cc>
8040b138:	008e2583          	lw	a1,8(t3)
8040b13c:	00098513          	mv	a0,s3
8040b140:	004e2b03          	lw	s6,4(t3)
8040b144:	01012c23          	sw	a6,24(sp)
8040b148:	00c12a23          	sw	a2,20(sp)
8040b14c:	01c12823          	sw	t3,16(sp)
8040b150:	df9fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b154:	01012e03          	lw	t3,16(sp)
8040b158:	01412603          	lw	a2,20(sp)
8040b15c:	01812803          	lw	a6,24(sp)
8040b160:	00ae2223          	sw	a0,4(t3)
8040b164:	016e2423          	sw	s6,8(t3)
8040b168:	00051463          	bnez	a0,8040b170 <stride_dequeue+0x1f50>
8040b16c:	6ac0106f          	j	8040c818 <stride_dequeue+0x35f8>
8040b170:	008c2b03          	lw	s6,8(s8)
8040b174:	01c52023          	sw	t3,0(a0)
8040b178:	000e0993          	mv	s3,t3
8040b17c:	00c12783          	lw	a5,12(sp)
8040b180:	01382223          	sw	s3,4(a6)
8040b184:	00f82423          	sw	a5,8(a6)
8040b188:	0109a023          	sw	a6,0(s3)
8040b18c:	00080993          	mv	s3,a6
8040b190:	00812783          	lw	a5,8(sp)
8040b194:	01362223          	sw	s3,4(a2)
8040b198:	00f62423          	sw	a5,8(a2)
8040b19c:	00c9a023          	sw	a2,0(s3)
8040b1a0:	000b0993          	mv	s3,s6
8040b1a4:	aa5fe06f          	j	80409c48 <stride_dequeue+0xa28>
8040b1a8:	0048a783          	lw	a5,4(a7)
8040b1ac:	0088a983          	lw	s3,8(a7)
8040b1b0:	00a12a23          	sw	a0,20(sp)
8040b1b4:	00f12823          	sw	a5,16(sp)
8040b1b8:	04098c63          	beqz	s3,8040b210 <stride_dequeue+0x1ff0>
8040b1bc:	00080593          	mv	a1,a6
8040b1c0:	00098513          	mv	a0,s3
8040b1c4:	01112e23          	sw	a7,28(sp)
8040b1c8:	cc5fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b1cc:	01412e03          	lw	t3,20(sp)
8040b1d0:	01812803          	lw	a6,24(sp)
8040b1d4:	01c12883          	lw	a7,28(sp)
8040b1d8:	3dc50ae3          	beq	a0,t3,8040bdac <stride_dequeue+0x2b8c>
8040b1dc:	00882583          	lw	a1,8(a6)
8040b1e0:	00098513          	mv	a0,s3
8040b1e4:	00482b03          	lw	s6,4(a6)
8040b1e8:	01112c23          	sw	a7,24(sp)
8040b1ec:	01012a23          	sw	a6,20(sp)
8040b1f0:	d59fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b1f4:	01412803          	lw	a6,20(sp)
8040b1f8:	01812883          	lw	a7,24(sp)
8040b1fc:	00a82223          	sw	a0,4(a6)
8040b200:	01682423          	sw	s6,8(a6)
8040b204:	00050463          	beqz	a0,8040b20c <stride_dequeue+0x1fec>
8040b208:	01052023          	sw	a6,0(a0)
8040b20c:	008c2b03          	lw	s6,8(s8)
8040b210:	01012783          	lw	a5,16(sp)
8040b214:	0108a223          	sw	a6,4(a7)
8040b218:	000b0993          	mv	s3,s6
8040b21c:	00f8a423          	sw	a5,8(a7)
8040b220:	01182023          	sw	a7,0(a6)
8040b224:	00088813          	mv	a6,a7
8040b228:	9f4ff06f          	j	8040a41c <stride_dequeue+0x11fc>
8040b22c:	004da783          	lw	a5,4(s11)
8040b230:	008da983          	lw	s3,8(s11)
8040b234:	00a12823          	sw	a0,16(sp)
8040b238:	00f12623          	sw	a5,12(sp)
8040b23c:	06098663          	beqz	s3,8040b2a8 <stride_dequeue+0x2088>
8040b240:	00030593          	mv	a1,t1
8040b244:	00098513          	mv	a0,s3
8040b248:	01012e23          	sw	a6,28(sp)
8040b24c:	00c12c23          	sw	a2,24(sp)
8040b250:	00612a23          	sw	t1,20(sp)
8040b254:	c39fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b258:	01012e03          	lw	t3,16(sp)
8040b25c:	01412303          	lw	t1,20(sp)
8040b260:	01812603          	lw	a2,24(sp)
8040b264:	01c12803          	lw	a6,28(sp)
8040b268:	5dc50ee3          	beq	a0,t3,8040c044 <stride_dequeue+0x2e24>
8040b26c:	00832583          	lw	a1,8(t1)
8040b270:	00098513          	mv	a0,s3
8040b274:	00432b03          	lw	s6,4(t1)
8040b278:	01012c23          	sw	a6,24(sp)
8040b27c:	00c12a23          	sw	a2,20(sp)
8040b280:	00612823          	sw	t1,16(sp)
8040b284:	cc5fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b288:	01012303          	lw	t1,16(sp)
8040b28c:	01412603          	lw	a2,20(sp)
8040b290:	01812803          	lw	a6,24(sp)
8040b294:	00a32223          	sw	a0,4(t1)
8040b298:	01632423          	sw	s6,8(t1)
8040b29c:	00050463          	beqz	a0,8040b2a4 <stride_dequeue+0x2084>
8040b2a0:	00652023          	sw	t1,0(a0)
8040b2a4:	008c2b03          	lw	s6,8(s8)
8040b2a8:	00c12783          	lw	a5,12(sp)
8040b2ac:	006da223          	sw	t1,4(s11)
8040b2b0:	000b0993          	mv	s3,s6
8040b2b4:	00fda423          	sw	a5,8(s11)
8040b2b8:	01b32023          	sw	s11,0(t1)
8040b2bc:	d24fe06f          	j	804097e0 <stride_dequeue+0x5c0>
8040b2c0:	004ca783          	lw	a5,4(s9)
8040b2c4:	008ca983          	lw	s3,8(s9)
8040b2c8:	00a12a23          	sw	a0,20(sp)
8040b2cc:	00f12823          	sw	a5,16(sp)
8040b2d0:	04098e63          	beqz	s3,8040b32c <stride_dequeue+0x210c>
8040b2d4:	00030593          	mv	a1,t1
8040b2d8:	00098513          	mv	a0,s3
8040b2dc:	01012e23          	sw	a6,28(sp)
8040b2e0:	00612c23          	sw	t1,24(sp)
8040b2e4:	ba9fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b2e8:	01412e03          	lw	t3,20(sp)
8040b2ec:	01812303          	lw	t1,24(sp)
8040b2f0:	01c12803          	lw	a6,28(sp)
8040b2f4:	25c50ae3          	beq	a0,t3,8040bd48 <stride_dequeue+0x2b28>
8040b2f8:	00832583          	lw	a1,8(t1)
8040b2fc:	00098513          	mv	a0,s3
8040b300:	00432b03          	lw	s6,4(t1)
8040b304:	01012c23          	sw	a6,24(sp)
8040b308:	00612a23          	sw	t1,20(sp)
8040b30c:	c3dfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b310:	01412303          	lw	t1,20(sp)
8040b314:	01812803          	lw	a6,24(sp)
8040b318:	00a32223          	sw	a0,4(t1)
8040b31c:	01632423          	sw	s6,8(t1)
8040b320:	00050463          	beqz	a0,8040b328 <stride_dequeue+0x2108>
8040b324:	00652023          	sw	t1,0(a0)
8040b328:	008c2b03          	lw	s6,8(s8)
8040b32c:	01012783          	lw	a5,16(sp)
8040b330:	006ca223          	sw	t1,4(s9)
8040b334:	000b0993          	mv	s3,s6
8040b338:	00fca423          	sw	a5,8(s9)
8040b33c:	01932023          	sw	s9,0(t1)
8040b340:	b55fe06f          	j	80409e94 <stride_dequeue+0xc74>
8040b344:	004da783          	lw	a5,4(s11)
8040b348:	008da983          	lw	s3,8(s11)
8040b34c:	00a12a23          	sw	a0,20(sp)
8040b350:	00f12823          	sw	a5,16(sp)
8040b354:	04098e63          	beqz	s3,8040b3b0 <stride_dequeue+0x2190>
8040b358:	00030593          	mv	a1,t1
8040b35c:	00098513          	mv	a0,s3
8040b360:	01012e23          	sw	a6,28(sp)
8040b364:	00612c23          	sw	t1,24(sp)
8040b368:	b25fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b36c:	01412e03          	lw	t3,20(sp)
8040b370:	01812303          	lw	t1,24(sp)
8040b374:	01c12803          	lw	a6,28(sp)
8040b378:	53c50ce3          	beq	a0,t3,8040c0b0 <stride_dequeue+0x2e90>
8040b37c:	00832583          	lw	a1,8(t1)
8040b380:	00098513          	mv	a0,s3
8040b384:	00432b03          	lw	s6,4(t1)
8040b388:	01012c23          	sw	a6,24(sp)
8040b38c:	00612a23          	sw	t1,20(sp)
8040b390:	bb9fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b394:	01412303          	lw	t1,20(sp)
8040b398:	01812803          	lw	a6,24(sp)
8040b39c:	00a32223          	sw	a0,4(t1)
8040b3a0:	01632423          	sw	s6,8(t1)
8040b3a4:	00050463          	beqz	a0,8040b3ac <stride_dequeue+0x218c>
8040b3a8:	00652023          	sw	t1,0(a0)
8040b3ac:	008c2b03          	lw	s6,8(s8)
8040b3b0:	01012783          	lw	a5,16(sp)
8040b3b4:	006da223          	sw	t1,4(s11)
8040b3b8:	000b0993          	mv	s3,s6
8040b3bc:	00fda423          	sw	a5,8(s11)
8040b3c0:	01b32023          	sw	s11,0(t1)
8040b3c4:	a40fe06f          	j	80409604 <stride_dequeue+0x3e4>
8040b3c8:	0048a783          	lw	a5,4(a7)
8040b3cc:	0088a983          	lw	s3,8(a7)
8040b3d0:	00a12a23          	sw	a0,20(sp)
8040b3d4:	00f12823          	sw	a5,16(sp)
8040b3d8:	04098c63          	beqz	s3,8040b430 <stride_dequeue+0x2210>
8040b3dc:	00030593          	mv	a1,t1
8040b3e0:	00098513          	mv	a0,s3
8040b3e4:	01112e23          	sw	a7,28(sp)
8040b3e8:	aa5fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b3ec:	01412e03          	lw	t3,20(sp)
8040b3f0:	01812303          	lw	t1,24(sp)
8040b3f4:	01c12883          	lw	a7,28(sp)
8040b3f8:	5bc502e3          	beq	a0,t3,8040c19c <stride_dequeue+0x2f7c>
8040b3fc:	00832583          	lw	a1,8(t1)
8040b400:	00098513          	mv	a0,s3
8040b404:	00432b03          	lw	s6,4(t1)
8040b408:	01112c23          	sw	a7,24(sp)
8040b40c:	00612a23          	sw	t1,20(sp)
8040b410:	b39fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b414:	01412303          	lw	t1,20(sp)
8040b418:	01812883          	lw	a7,24(sp)
8040b41c:	00a32223          	sw	a0,4(t1)
8040b420:	01632423          	sw	s6,8(t1)
8040b424:	00050463          	beqz	a0,8040b42c <stride_dequeue+0x220c>
8040b428:	00652023          	sw	t1,0(a0)
8040b42c:	008c2b03          	lw	s6,8(s8)
8040b430:	01012783          	lw	a5,16(sp)
8040b434:	0068a223          	sw	t1,4(a7)
8040b438:	000b0993          	mv	s3,s6
8040b43c:	00f8a423          	sw	a5,8(a7)
8040b440:	01132023          	sw	a7,0(t1)
8040b444:	91dfe06f          	j	80409d60 <stride_dequeue+0xb40>
8040b448:	00892503          	lw	a0,8(s2)
8040b44c:	00492983          	lw	s3,4(s2)
8040b450:	000b0593          	mv	a1,s6
8040b454:	af5fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b458:	00a92223          	sw	a0,4(s2)
8040b45c:	01392423          	sw	s3,8(s2)
8040b460:	01412803          	lw	a6,20(sp)
8040b464:	01812783          	lw	a5,24(sp)
8040b468:	00050463          	beqz	a0,8040b470 <stride_dequeue+0x2250>
8040b46c:	01252023          	sw	s2,0(a0)
8040b470:	008c2983          	lw	s3,8(s8)
8040b474:	f71fd06f          	j	804093e4 <stride_dequeue+0x1c4>
8040b478:	0049a703          	lw	a4,4(s3)
8040b47c:	0089a783          	lw	a5,8(s3)
8040b480:	00a12a23          	sw	a0,20(sp)
8040b484:	00e12423          	sw	a4,8(sp)
8040b488:	04078a63          	beqz	a5,8040b4dc <stride_dequeue+0x22bc>
8040b48c:	00078513          	mv	a0,a5
8040b490:	000a0593          	mv	a1,s4
8040b494:	00c12823          	sw	a2,16(sp)
8040b498:	00f12623          	sw	a5,12(sp)
8040b49c:	9f1fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b4a0:	01412883          	lw	a7,20(sp)
8040b4a4:	00c12783          	lw	a5,12(sp)
8040b4a8:	01012603          	lw	a2,16(sp)
8040b4ac:	631508e3          	beq	a0,a7,8040c2dc <stride_dequeue+0x30bc>
8040b4b0:	008a2583          	lw	a1,8(s4)
8040b4b4:	004a2b03          	lw	s6,4(s4)
8040b4b8:	00078513          	mv	a0,a5
8040b4bc:	00c12623          	sw	a2,12(sp)
8040b4c0:	a89fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b4c4:	00aa2223          	sw	a0,4(s4)
8040b4c8:	016a2423          	sw	s6,8(s4)
8040b4cc:	00c12603          	lw	a2,12(sp)
8040b4d0:	00050463          	beqz	a0,8040b4d8 <stride_dequeue+0x22b8>
8040b4d4:	01452023          	sw	s4,0(a0)
8040b4d8:	008c2b03          	lw	s6,8(s8)
8040b4dc:	00812783          	lw	a5,8(sp)
8040b4e0:	0149a223          	sw	s4,4(s3)
8040b4e4:	00f9a423          	sw	a5,8(s3)
8040b4e8:	013a2023          	sw	s3,0(s4)
8040b4ec:	00098a13          	mv	s4,s3
8040b4f0:	85cff06f          	j	8040a54c <stride_dequeue+0x132c>
8040b4f4:	004a2703          	lw	a4,4(s4)
8040b4f8:	008a2783          	lw	a5,8(s4)
8040b4fc:	00a12a23          	sw	a0,20(sp)
8040b500:	00e12623          	sw	a4,12(sp)
8040b504:	04078263          	beqz	a5,8040b548 <stride_dequeue+0x2328>
8040b508:	00078513          	mv	a0,a5
8040b50c:	00098593          	mv	a1,s3
8040b510:	00f12823          	sw	a5,16(sp)
8040b514:	979fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b518:	01412303          	lw	t1,20(sp)
8040b51c:	01012783          	lw	a5,16(sp)
8040b520:	526504e3          	beq	a0,t1,8040c248 <stride_dequeue+0x3028>
8040b524:	0089a583          	lw	a1,8(s3)
8040b528:	0049ab03          	lw	s6,4(s3)
8040b52c:	00078513          	mv	a0,a5
8040b530:	a19fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b534:	00a9a223          	sw	a0,4(s3)
8040b538:	0169a423          	sw	s6,8(s3)
8040b53c:	00050463          	beqz	a0,8040b544 <stride_dequeue+0x2324>
8040b540:	01352023          	sw	s3,0(a0)
8040b544:	008c2b03          	lw	s6,8(s8)
8040b548:	00c12783          	lw	a5,12(sp)
8040b54c:	013a2223          	sw	s3,4(s4)
8040b550:	00fa2423          	sw	a5,8(s4)
8040b554:	0149a023          	sw	s4,0(s3)
8040b558:	000a0993          	mv	s3,s4
8040b55c:	a89fe06f          	j	80409fe4 <stride_dequeue+0xdc4>
8040b560:	0049a703          	lw	a4,4(s3)
8040b564:	0089a783          	lw	a5,8(s3)
8040b568:	00a12a23          	sw	a0,20(sp)
8040b56c:	00e12623          	sw	a4,12(sp)
8040b570:	04078263          	beqz	a5,8040b5b4 <stride_dequeue+0x2394>
8040b574:	00078513          	mv	a0,a5
8040b578:	000a0593          	mv	a1,s4
8040b57c:	00f12823          	sw	a5,16(sp)
8040b580:	90dfd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b584:	01412883          	lw	a7,20(sp)
8040b588:	01012783          	lw	a5,16(sp)
8040b58c:	5f1502e3          	beq	a0,a7,8040c370 <stride_dequeue+0x3150>
8040b590:	008a2583          	lw	a1,8(s4)
8040b594:	004a2b03          	lw	s6,4(s4)
8040b598:	00078513          	mv	a0,a5
8040b59c:	9adfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b5a0:	00aa2223          	sw	a0,4(s4)
8040b5a4:	016a2423          	sw	s6,8(s4)
8040b5a8:	00050463          	beqz	a0,8040b5b0 <stride_dequeue+0x2390>
8040b5ac:	01452023          	sw	s4,0(a0)
8040b5b0:	008c2b03          	lw	s6,8(s8)
8040b5b4:	00c12783          	lw	a5,12(sp)
8040b5b8:	0149a223          	sw	s4,4(s3)
8040b5bc:	00f9a423          	sw	a5,8(s3)
8040b5c0:	013a2023          	sw	s3,0(s4)
8040b5c4:	00098a13          	mv	s4,s3
8040b5c8:	89cff06f          	j	8040a664 <stride_dequeue+0x1444>
8040b5cc:	0049a703          	lw	a4,4(s3)
8040b5d0:	0089a783          	lw	a5,8(s3)
8040b5d4:	00a12a23          	sw	a0,20(sp)
8040b5d8:	00e12623          	sw	a4,12(sp)
8040b5dc:	04078263          	beqz	a5,8040b620 <stride_dequeue+0x2400>
8040b5e0:	00078513          	mv	a0,a5
8040b5e4:	000c8593          	mv	a1,s9
8040b5e8:	00f12823          	sw	a5,16(sp)
8040b5ec:	8a1fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b5f0:	01412883          	lw	a7,20(sp)
8040b5f4:	01012783          	lw	a5,16(sp)
8040b5f8:	551504e3          	beq	a0,a7,8040c340 <stride_dequeue+0x3120>
8040b5fc:	008ca583          	lw	a1,8(s9)
8040b600:	004cab03          	lw	s6,4(s9)
8040b604:	00078513          	mv	a0,a5
8040b608:	941fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b60c:	00aca223          	sw	a0,4(s9)
8040b610:	016ca423          	sw	s6,8(s9)
8040b614:	00050463          	beqz	a0,8040b61c <stride_dequeue+0x23fc>
8040b618:	01952023          	sw	s9,0(a0)
8040b61c:	008c2b03          	lw	s6,8(s8)
8040b620:	00c12783          	lw	a5,12(sp)
8040b624:	0199a223          	sw	s9,4(s3)
8040b628:	00f9a423          	sw	a5,8(s3)
8040b62c:	013ca023          	sw	s3,0(s9)
8040b630:	00098c93          	mv	s9,s3
8040b634:	944ff06f          	j	8040a778 <stride_dequeue+0x1558>
8040b638:	008c2b03          	lw	s6,8(s8)
8040b63c:	00088993          	mv	s3,a7
8040b640:	dc9fe06f          	j	8040a408 <stride_dequeue+0x11e8>
8040b644:	0048a783          	lw	a5,4(a7)
8040b648:	0088a803          	lw	a6,8(a7)
8040b64c:	00a12e23          	sw	a0,28(sp)
8040b650:	00f12823          	sw	a5,16(sp)
8040b654:	04080a63          	beqz	a6,8040b6a8 <stride_dequeue+0x2488>
8040b658:	00080513          	mv	a0,a6
8040b65c:	00098593          	mv	a1,s3
8040b660:	01112c23          	sw	a7,24(sp)
8040b664:	01012a23          	sw	a6,20(sp)
8040b668:	825fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b66c:	01c12e03          	lw	t3,28(sp)
8040b670:	01412803          	lw	a6,20(sp)
8040b674:	01812883          	lw	a7,24(sp)
8040b678:	57c502e3          	beq	a0,t3,8040c3dc <stride_dequeue+0x31bc>
8040b67c:	0089a583          	lw	a1,8(s3)
8040b680:	0049ab03          	lw	s6,4(s3)
8040b684:	00080513          	mv	a0,a6
8040b688:	01112a23          	sw	a7,20(sp)
8040b68c:	8bdfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b690:	00a9a223          	sw	a0,4(s3)
8040b694:	0169a423          	sw	s6,8(s3)
8040b698:	01412883          	lw	a7,20(sp)
8040b69c:	00050463          	beqz	a0,8040b6a4 <stride_dequeue+0x2484>
8040b6a0:	01352023          	sw	s3,0(a0)
8040b6a4:	008c2b03          	lw	s6,8(s8)
8040b6a8:	01012783          	lw	a5,16(sp)
8040b6ac:	0138a223          	sw	s3,4(a7)
8040b6b0:	00f8a423          	sw	a5,8(a7)
8040b6b4:	0119a023          	sw	a7,0(s3)
8040b6b8:	00088993          	mv	s3,a7
8040b6bc:	c81fe06f          	j	8040a33c <stride_dequeue+0x111c>
8040b6c0:	0048a783          	lw	a5,4(a7)
8040b6c4:	0088a803          	lw	a6,8(a7)
8040b6c8:	00a12e23          	sw	a0,28(sp)
8040b6cc:	00f12823          	sw	a5,16(sp)
8040b6d0:	04080a63          	beqz	a6,8040b724 <stride_dequeue+0x2504>
8040b6d4:	00080513          	mv	a0,a6
8040b6d8:	00098593          	mv	a1,s3
8040b6dc:	01112c23          	sw	a7,24(sp)
8040b6e0:	01012a23          	sw	a6,20(sp)
8040b6e4:	fa8fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b6e8:	01c12e03          	lw	t3,28(sp)
8040b6ec:	01412803          	lw	a6,20(sp)
8040b6f0:	01812883          	lw	a7,24(sp)
8040b6f4:	69c508e3          	beq	a0,t3,8040c584 <stride_dequeue+0x3364>
8040b6f8:	0089a583          	lw	a1,8(s3)
8040b6fc:	0049ab03          	lw	s6,4(s3)
8040b700:	00080513          	mv	a0,a6
8040b704:	01112a23          	sw	a7,20(sp)
8040b708:	841fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b70c:	00a9a223          	sw	a0,4(s3)
8040b710:	0169a423          	sw	s6,8(s3)
8040b714:	01412883          	lw	a7,20(sp)
8040b718:	00050463          	beqz	a0,8040b720 <stride_dequeue+0x2500>
8040b71c:	01352023          	sw	s3,0(a0)
8040b720:	008c2b03          	lw	s6,8(s8)
8040b724:	01012783          	lw	a5,16(sp)
8040b728:	0138a223          	sw	s3,4(a7)
8040b72c:	00f8a423          	sw	a5,8(a7)
8040b730:	0119a023          	sw	a7,0(s3)
8040b734:	00088993          	mv	s3,a7
8040b738:	9c1fe06f          	j	8040a0f8 <stride_dequeue+0xed8>
8040b73c:	0048a783          	lw	a5,4(a7)
8040b740:	0088a803          	lw	a6,8(a7)
8040b744:	00a12e23          	sw	a0,28(sp)
8040b748:	00f12623          	sw	a5,12(sp)
8040b74c:	06080263          	beqz	a6,8040b7b0 <stride_dequeue+0x2590>
8040b750:	00080513          	mv	a0,a6
8040b754:	00098593          	mv	a1,s3
8040b758:	01112c23          	sw	a7,24(sp)
8040b75c:	01012823          	sw	a6,16(sp)
8040b760:	f2cfd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b764:	01c12e03          	lw	t3,28(sp)
8040b768:	01012803          	lw	a6,16(sp)
8040b76c:	01412603          	lw	a2,20(sp)
8040b770:	01812883          	lw	a7,24(sp)
8040b774:	01c51463          	bne	a0,t3,8040b77c <stride_dequeue+0x255c>
8040b778:	7690006f          	j	8040c6e0 <stride_dequeue+0x34c0>
8040b77c:	0089a583          	lw	a1,8(s3)
8040b780:	0049ab03          	lw	s6,4(s3)
8040b784:	00080513          	mv	a0,a6
8040b788:	01112a23          	sw	a7,20(sp)
8040b78c:	00c12823          	sw	a2,16(sp)
8040b790:	fb8fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b794:	00a9a223          	sw	a0,4(s3)
8040b798:	0169a423          	sw	s6,8(s3)
8040b79c:	01012603          	lw	a2,16(sp)
8040b7a0:	01412883          	lw	a7,20(sp)
8040b7a4:	00050463          	beqz	a0,8040b7ac <stride_dequeue+0x258c>
8040b7a8:	01352023          	sw	s3,0(a0)
8040b7ac:	008c2b03          	lw	s6,8(s8)
8040b7b0:	00c12783          	lw	a5,12(sp)
8040b7b4:	0138a223          	sw	s3,4(a7)
8040b7b8:	00f8a423          	sw	a5,8(a7)
8040b7bc:	0119a023          	sw	a7,0(s3)
8040b7c0:	00088993          	mv	s3,a7
8040b7c4:	a69fe06f          	j	8040a22c <stride_dequeue+0x100c>
8040b7c8:	00462783          	lw	a5,4(a2)
8040b7cc:	00862883          	lw	a7,8(a2)
8040b7d0:	00a12e23          	sw	a0,28(sp)
8040b7d4:	00f12623          	sw	a5,12(sp)
8040b7d8:	06088263          	beqz	a7,8040b83c <stride_dequeue+0x261c>
8040b7dc:	00088513          	mv	a0,a7
8040b7e0:	00098593          	mv	a1,s3
8040b7e4:	01012c23          	sw	a6,24(sp)
8040b7e8:	00c12a23          	sw	a2,20(sp)
8040b7ec:	01112823          	sw	a7,16(sp)
8040b7f0:	e9cfd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b7f4:	01c12e03          	lw	t3,28(sp)
8040b7f8:	01012883          	lw	a7,16(sp)
8040b7fc:	01412603          	lw	a2,20(sp)
8040b800:	01812803          	lw	a6,24(sp)
8040b804:	45c502e3          	beq	a0,t3,8040c448 <stride_dequeue+0x3228>
8040b808:	0089a583          	lw	a1,8(s3)
8040b80c:	0049ab03          	lw	s6,4(s3)
8040b810:	00088513          	mv	a0,a7
8040b814:	01012a23          	sw	a6,20(sp)
8040b818:	00c12823          	sw	a2,16(sp)
8040b81c:	f2cfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b820:	00a9a223          	sw	a0,4(s3)
8040b824:	0169a423          	sw	s6,8(s3)
8040b828:	01012603          	lw	a2,16(sp)
8040b82c:	01412803          	lw	a6,20(sp)
8040b830:	00050463          	beqz	a0,8040b838 <stride_dequeue+0x2618>
8040b834:	01352023          	sw	s3,0(a0)
8040b838:	008c2b03          	lw	s6,8(s8)
8040b83c:	00c12783          	lw	a5,12(sp)
8040b840:	01362223          	sw	s3,4(a2)
8040b844:	00f62423          	sw	a5,8(a2)
8040b848:	00c9a023          	sw	a2,0(s3)
8040b84c:	00060993          	mv	s3,a2
8040b850:	be0fe06f          	j	80409c30 <stride_dequeue+0xa10>
8040b854:	0049a783          	lw	a5,4(s3)
8040b858:	0089a303          	lw	t1,8(s3)
8040b85c:	00a12e23          	sw	a0,28(sp)
8040b860:	00f12823          	sw	a5,16(sp)
8040b864:	04030a63          	beqz	t1,8040b8b8 <stride_dequeue+0x2698>
8040b868:	00080593          	mv	a1,a6
8040b86c:	00030513          	mv	a0,t1
8040b870:	01012c23          	sw	a6,24(sp)
8040b874:	00612a23          	sw	t1,20(sp)
8040b878:	e14fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b87c:	01c12e03          	lw	t3,28(sp)
8040b880:	01412303          	lw	t1,20(sp)
8040b884:	01812803          	lw	a6,24(sp)
8040b888:	4dc506e3          	beq	a0,t3,8040c554 <stride_dequeue+0x3334>
8040b88c:	00882583          	lw	a1,8(a6)
8040b890:	00030513          	mv	a0,t1
8040b894:	00482b03          	lw	s6,4(a6)
8040b898:	01012a23          	sw	a6,20(sp)
8040b89c:	eacfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b8a0:	01412803          	lw	a6,20(sp)
8040b8a4:	00a82223          	sw	a0,4(a6)
8040b8a8:	01682423          	sw	s6,8(a6)
8040b8ac:	00050463          	beqz	a0,8040b8b4 <stride_dequeue+0x2694>
8040b8b0:	01052023          	sw	a6,0(a0)
8040b8b4:	008c2b03          	lw	s6,8(s8)
8040b8b8:	01012783          	lw	a5,16(sp)
8040b8bc:	0109a223          	sw	a6,4(s3)
8040b8c0:	00f9a423          	sw	a5,8(s3)
8040b8c4:	01382023          	sw	s3,0(a6)
8040b8c8:	00098813          	mv	a6,s3
8040b8cc:	85cff06f          	j	8040a928 <stride_dequeue+0x1708>
8040b8d0:	008c2b03          	lw	s6,8(s8)
8040b8d4:	00088993          	mv	s3,a7
8040b8d8:	c70fe06f          	j	80409d48 <stride_dequeue+0xb28>
8040b8dc:	0049a783          	lw	a5,4(s3)
8040b8e0:	0089a303          	lw	t1,8(s3)
8040b8e4:	00a12e23          	sw	a0,28(sp)
8040b8e8:	00f12823          	sw	a5,16(sp)
8040b8ec:	04030a63          	beqz	t1,8040b940 <stride_dequeue+0x2720>
8040b8f0:	00080593          	mv	a1,a6
8040b8f4:	00030513          	mv	a0,t1
8040b8f8:	01012c23          	sw	a6,24(sp)
8040b8fc:	00612a23          	sw	t1,20(sp)
8040b900:	d8cfd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b904:	01c12e03          	lw	t3,28(sp)
8040b908:	01412303          	lw	t1,20(sp)
8040b90c:	01812803          	lw	a6,24(sp)
8040b910:	41c50ae3          	beq	a0,t3,8040c524 <stride_dequeue+0x3304>
8040b914:	00882583          	lw	a1,8(a6)
8040b918:	00030513          	mv	a0,t1
8040b91c:	00482b03          	lw	s6,4(a6)
8040b920:	01012a23          	sw	a6,20(sp)
8040b924:	e24fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b928:	01412803          	lw	a6,20(sp)
8040b92c:	00a82223          	sw	a0,4(a6)
8040b930:	01682423          	sw	s6,8(a6)
8040b934:	00050463          	beqz	a0,8040b93c <stride_dequeue+0x271c>
8040b938:	01052023          	sw	a6,0(a0)
8040b93c:	008c2b03          	lw	s6,8(s8)
8040b940:	01012783          	lw	a5,16(sp)
8040b944:	0109a223          	sw	a6,4(s3)
8040b948:	00f9a423          	sw	a5,8(s3)
8040b94c:	01382023          	sw	s3,0(a6)
8040b950:	00098813          	mv	a6,s3
8040b954:	8a8ff06f          	j	8040a9fc <stride_dequeue+0x17dc>
8040b958:	004ca783          	lw	a5,4(s9)
8040b95c:	008ca883          	lw	a7,8(s9)
8040b960:	00a12e23          	sw	a0,28(sp)
8040b964:	00f12823          	sw	a5,16(sp)
8040b968:	04088a63          	beqz	a7,8040b9bc <stride_dequeue+0x279c>
8040b96c:	00088513          	mv	a0,a7
8040b970:	00098593          	mv	a1,s3
8040b974:	01012c23          	sw	a6,24(sp)
8040b978:	01112a23          	sw	a7,20(sp)
8040b97c:	d10fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040b980:	01c12e03          	lw	t3,28(sp)
8040b984:	01412883          	lw	a7,20(sp)
8040b988:	01812803          	lw	a6,24(sp)
8040b98c:	53c500e3          	beq	a0,t3,8040c6ac <stride_dequeue+0x348c>
8040b990:	0089a583          	lw	a1,8(s3)
8040b994:	0049ab03          	lw	s6,4(s3)
8040b998:	00088513          	mv	a0,a7
8040b99c:	01012a23          	sw	a6,20(sp)
8040b9a0:	da8fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040b9a4:	00a9a223          	sw	a0,4(s3)
8040b9a8:	0169a423          	sw	s6,8(s3)
8040b9ac:	01412803          	lw	a6,20(sp)
8040b9b0:	00050463          	beqz	a0,8040b9b8 <stride_dequeue+0x2798>
8040b9b4:	01352023          	sw	s3,0(a0)
8040b9b8:	008c2b03          	lw	s6,8(s8)
8040b9bc:	01012783          	lw	a5,16(sp)
8040b9c0:	013ca223          	sw	s3,4(s9)
8040b9c4:	00fca423          	sw	a5,8(s9)
8040b9c8:	0199a023          	sw	s9,0(s3)
8040b9cc:	000c8993          	mv	s3,s9
8040b9d0:	f99fd06f          	j	80409968 <stride_dequeue+0x748>
8040b9d4:	008c2b03          	lw	s6,8(s8)
8040b9d8:	000d8993          	mv	s3,s11
8040b9dc:	c11fd06f          	j	804095ec <stride_dequeue+0x3cc>
8040b9e0:	004a2783          	lw	a5,4(s4)
8040b9e4:	008a2883          	lw	a7,8(s4)
8040b9e8:	00a12e23          	sw	a0,28(sp)
8040b9ec:	00f12823          	sw	a5,16(sp)
8040b9f0:	04088a63          	beqz	a7,8040ba44 <stride_dequeue+0x2824>
8040b9f4:	00088513          	mv	a0,a7
8040b9f8:	00098593          	mv	a1,s3
8040b9fc:	01012c23          	sw	a6,24(sp)
8040ba00:	01112a23          	sw	a7,20(sp)
8040ba04:	c88fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ba08:	01c12e03          	lw	t3,28(sp)
8040ba0c:	01412883          	lw	a7,20(sp)
8040ba10:	01812803          	lw	a6,24(sp)
8040ba14:	57c502e3          	beq	a0,t3,8040c778 <stride_dequeue+0x3558>
8040ba18:	0089a583          	lw	a1,8(s3)
8040ba1c:	0049ab03          	lw	s6,4(s3)
8040ba20:	00088513          	mv	a0,a7
8040ba24:	01012a23          	sw	a6,20(sp)
8040ba28:	d20fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040ba2c:	00a9a223          	sw	a0,4(s3)
8040ba30:	0169a423          	sw	s6,8(s3)
8040ba34:	01412803          	lw	a6,20(sp)
8040ba38:	00050463          	beqz	a0,8040ba40 <stride_dequeue+0x2820>
8040ba3c:	01352023          	sw	s3,0(a0)
8040ba40:	008c2b03          	lw	s6,8(s8)
8040ba44:	01012783          	lw	a5,16(sp)
8040ba48:	013a2223          	sw	s3,4(s4)
8040ba4c:	00fa2423          	sw	a5,8(s4)
8040ba50:	0149a023          	sw	s4,0(s3)
8040ba54:	000a0993          	mv	s3,s4
8040ba58:	870fe06f          	j	80409ac8 <stride_dequeue+0x8a8>
8040ba5c:	0049a783          	lw	a5,4(s3)
8040ba60:	0089a303          	lw	t1,8(s3)
8040ba64:	00a12e23          	sw	a0,28(sp)
8040ba68:	00f12823          	sw	a5,16(sp)
8040ba6c:	04030a63          	beqz	t1,8040bac0 <stride_dequeue+0x28a0>
8040ba70:	00030513          	mv	a0,t1
8040ba74:	000c8593          	mv	a1,s9
8040ba78:	01112c23          	sw	a7,24(sp)
8040ba7c:	00612a23          	sw	t1,20(sp)
8040ba80:	c0cfd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040ba84:	01c12e03          	lw	t3,28(sp)
8040ba88:	01412303          	lw	t1,20(sp)
8040ba8c:	01812883          	lw	a7,24(sp)
8040ba90:	1fc508e3          	beq	a0,t3,8040c480 <stride_dequeue+0x3260>
8040ba94:	008ca583          	lw	a1,8(s9)
8040ba98:	004cab03          	lw	s6,4(s9)
8040ba9c:	00030513          	mv	a0,t1
8040baa0:	01112a23          	sw	a7,20(sp)
8040baa4:	ca4fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040baa8:	00aca223          	sw	a0,4(s9)
8040baac:	016ca423          	sw	s6,8(s9)
8040bab0:	01412883          	lw	a7,20(sp)
8040bab4:	00050463          	beqz	a0,8040babc <stride_dequeue+0x289c>
8040bab8:	01952023          	sw	s9,0(a0)
8040babc:	008c2b03          	lw	s6,8(s8)
8040bac0:	01012783          	lw	a5,16(sp)
8040bac4:	0199a223          	sw	s9,4(s3)
8040bac8:	00f9a423          	sw	a5,8(s3)
8040bacc:	013ca023          	sw	s3,0(s9)
8040bad0:	00098c93          	mv	s9,s3
8040bad4:	d7dfe06f          	j	8040a850 <stride_dequeue+0x1630>
8040bad8:	008c2b03          	lw	s6,8(s8)
8040badc:	000c8993          	mv	s3,s9
8040bae0:	b9cfe06f          	j	80409e7c <stride_dequeue+0xc5c>
8040bae4:	0049a783          	lw	a5,4(s3)
8040bae8:	0089a303          	lw	t1,8(s3)
8040baec:	00a12e23          	sw	a0,28(sp)
8040baf0:	00f12623          	sw	a5,12(sp)
8040baf4:	06030263          	beqz	t1,8040bb58 <stride_dequeue+0x2938>
8040baf8:	00080593          	mv	a1,a6
8040bafc:	00030513          	mv	a0,t1
8040bb00:	00c12c23          	sw	a2,24(sp)
8040bb04:	01012a23          	sw	a6,20(sp)
8040bb08:	00612823          	sw	t1,16(sp)
8040bb0c:	b80fd0ef          	jal	ra,80408e8c <proc_stride_comp_f>
8040bb10:	01812603          	lw	a2,24(sp)
8040bb14:	01c12e03          	lw	t3,28(sp)
8040bb18:	01412803          	lw	a6,20(sp)
8040bb1c:	00c12a23          	sw	a2,20(sp)
8040bb20:	01012303          	lw	t1,16(sp)
8040bb24:	29c50ae3          	beq	a0,t3,8040c5b8 <stride_dequeue+0x3398>
8040bb28:	00882583          	lw	a1,8(a6)
8040bb2c:	00030513          	mv	a0,t1
8040bb30:	00482b03          	lw	s6,4(a6)
8040bb34:	01012823          	sw	a6,16(sp)
8040bb38:	c10fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bb3c:	01012803          	lw	a6,16(sp)
8040bb40:	01412603          	lw	a2,20(sp)
8040bb44:	00a82223          	sw	a0,4(a6)
8040bb48:	01682423          	sw	s6,8(a6)
8040bb4c:	00050463          	beqz	a0,8040bb54 <stride_dequeue+0x2934>
8040bb50:	01052023          	sw	a6,0(a0)
8040bb54:	008c2b03          	lw	s6,8(s8)
8040bb58:	00c12783          	lw	a5,12(sp)
8040bb5c:	0109a223          	sw	a6,4(s3)
8040bb60:	00f9a423          	sw	a5,8(s3)
8040bb64:	01382023          	sw	s3,0(a6)
8040bb68:	00098813          	mv	a6,s3
8040bb6c:	f7dfe06f          	j	8040aae8 <stride_dequeue+0x18c8>
8040bb70:	000a0993          	mv	s3,s4
8040bb74:	c70fe06f          	j	80409fe4 <stride_dequeue+0xdc4>
8040bb78:	008c2b03          	lw	s6,8(s8)
8040bb7c:	000d8993          	mv	s3,s11
8040bb80:	c49fd06f          	j	804097c8 <stride_dequeue+0x5a8>
8040bb84:	008da503          	lw	a0,8(s11)
8040bb88:	004dab03          	lw	s6,4(s11)
8040bb8c:	00098593          	mv	a1,s3
8040bb90:	bb8fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bb94:	00ada223          	sw	a0,4(s11)
8040bb98:	016da423          	sw	s6,8(s11)
8040bb9c:	01012603          	lw	a2,16(sp)
8040bba0:	01412803          	lw	a6,20(sp)
8040bba4:	01812303          	lw	t1,24(sp)
8040bba8:	fc0508e3          	beqz	a0,8040bb78 <stride_dequeue+0x2958>
8040bbac:	01b52023          	sw	s11,0(a0)
8040bbb0:	000d8993          	mv	s3,s11
8040bbb4:	008c2b03          	lw	s6,8(s8)
8040bbb8:	c11fd06f          	j	804097c8 <stride_dequeue+0x5a8>
8040bbbc:	0089a503          	lw	a0,8(s3)
8040bbc0:	0049ab03          	lw	s6,4(s3)
8040bbc4:	00078593          	mv	a1,a5
8040bbc8:	01012a23          	sw	a6,20(sp)
8040bbcc:	b7cfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bbd0:	00a9a223          	sw	a0,4(s3)
8040bbd4:	0169a423          	sw	s6,8(s3)
8040bbd8:	01412803          	lw	a6,20(sp)
8040bbdc:	6a050a63          	beqz	a0,8040c290 <stride_dequeue+0x3070>
8040bbe0:	01352023          	sw	s3,0(a0)
8040bbe4:	00098793          	mv	a5,s3
8040bbe8:	008c2b03          	lw	s6,8(s8)
8040bbec:	f85fe06f          	j	8040ab70 <stride_dequeue+0x1950>
8040bbf0:	0088a503          	lw	a0,8(a7)
8040bbf4:	00098593          	mv	a1,s3
8040bbf8:	0048ab03          	lw	s6,4(a7)
8040bbfc:	00612c23          	sw	t1,24(sp)
8040bc00:	01112a23          	sw	a7,20(sp)
8040bc04:	b44fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bc08:	01412883          	lw	a7,20(sp)
8040bc0c:	01812303          	lw	t1,24(sp)
8040bc10:	00a8a223          	sw	a0,4(a7)
8040bc14:	0168a423          	sw	s6,8(a7)
8040bc18:	ca050ce3          	beqz	a0,8040b8d0 <stride_dequeue+0x26b0>
8040bc1c:	01152023          	sw	a7,0(a0)
8040bc20:	00088993          	mv	s3,a7
8040bc24:	008c2b03          	lw	s6,8(s8)
8040bc28:	920fe06f          	j	80409d48 <stride_dequeue+0xb28>
8040bc2c:	008ca503          	lw	a0,8(s9)
8040bc30:	004cab03          	lw	s6,4(s9)
8040bc34:	00098593          	mv	a1,s3
8040bc38:	b10fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bc3c:	00aca223          	sw	a0,4(s9)
8040bc40:	016ca423          	sw	s6,8(s9)
8040bc44:	01412803          	lw	a6,20(sp)
8040bc48:	01812303          	lw	t1,24(sp)
8040bc4c:	e80506e3          	beqz	a0,8040bad8 <stride_dequeue+0x28b8>
8040bc50:	01952023          	sw	s9,0(a0)
8040bc54:	000c8993          	mv	s3,s9
8040bc58:	008c2b03          	lw	s6,8(s8)
8040bc5c:	a20fe06f          	j	80409e7c <stride_dequeue+0xc5c>
8040bc60:	008da503          	lw	a0,8(s11)
8040bc64:	004dab03          	lw	s6,4(s11)
8040bc68:	00098593          	mv	a1,s3
8040bc6c:	adcfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bc70:	00ada223          	sw	a0,4(s11)
8040bc74:	016da423          	sw	s6,8(s11)
8040bc78:	01412803          	lw	a6,20(sp)
8040bc7c:	01812303          	lw	t1,24(sp)
8040bc80:	d4050ae3          	beqz	a0,8040b9d4 <stride_dequeue+0x27b4>
8040bc84:	01b52023          	sw	s11,0(a0)
8040bc88:	000d8993          	mv	s3,s11
8040bc8c:	008c2b03          	lw	s6,8(s8)
8040bc90:	95dfd06f          	j	804095ec <stride_dequeue+0x3cc>
8040bc94:	0088a503          	lw	a0,8(a7)
8040bc98:	00098593          	mv	a1,s3
8040bc9c:	0048ab03          	lw	s6,4(a7)
8040bca0:	01012c23          	sw	a6,24(sp)
8040bca4:	01112a23          	sw	a7,20(sp)
8040bca8:	aa0fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bcac:	01412883          	lw	a7,20(sp)
8040bcb0:	01812803          	lw	a6,24(sp)
8040bcb4:	00a8a223          	sw	a0,4(a7)
8040bcb8:	0168a423          	sw	s6,8(a7)
8040bcbc:	96050ee3          	beqz	a0,8040b638 <stride_dequeue+0x2418>
8040bcc0:	01152023          	sw	a7,0(a0)
8040bcc4:	00088993          	mv	s3,a7
8040bcc8:	008c2b03          	lw	s6,8(s8)
8040bccc:	f3cfe06f          	j	8040a408 <stride_dequeue+0x11e8>
8040bcd0:	000a0993          	mv	s3,s4
8040bcd4:	df5fd06f          	j	80409ac8 <stride_dequeue+0x8a8>
8040bcd8:	00009697          	auipc	a3,0x9
8040bcdc:	c5068693          	addi	a3,a3,-944 # 80414928 <CSWTCH.69+0x920>
8040bce0:	00007617          	auipc	a2,0x7
8040bce4:	f0860613          	addi	a2,a2,-248 # 80412be8 <commands+0x1bc>
8040bce8:	06300593          	li	a1,99
8040bcec:	00009517          	auipc	a0,0x9
8040bcf0:	c6050513          	addi	a0,a0,-928 # 8041494c <CSWTCH.69+0x944>
8040bcf4:	931f40ef          	jal	ra,80400624 <__panic>
8040bcf8:	000c8993          	mv	s3,s9
8040bcfc:	c6dfd06f          	j	80409968 <stride_dequeue+0x748>
8040bd00:	00088993          	mv	s3,a7
8040bd04:	d28fe06f          	j	8040a22c <stride_dequeue+0x100c>
8040bd08:	00088993          	mv	s3,a7
8040bd0c:	becfe06f          	j	8040a0f8 <stride_dequeue+0xed8>
8040bd10:	00060993          	mv	s3,a2
8040bd14:	f1dfd06f          	j	80409c30 <stride_dequeue+0xa10>
8040bd18:	00088993          	mv	s3,a7
8040bd1c:	e20fe06f          	j	8040a33c <stride_dequeue+0x111c>
8040bd20:	0089a503          	lw	a0,8(s3)
8040bd24:	0049ab03          	lw	s6,4(s3)
8040bd28:	00040593          	mv	a1,s0
8040bd2c:	a1cfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bd30:	00a9a223          	sw	a0,4(s3)
8040bd34:	0169a423          	sw	s6,8(s3)
8040bd38:	00050463          	beqz	a0,8040bd40 <stride_dequeue+0x2b20>
8040bd3c:	01352023          	sw	s3,0(a0)
8040bd40:	008c2b03          	lw	s6,8(s8)
8040bd44:	ef1fe06f          	j	8040ac34 <stride_dequeue+0x1a14>
8040bd48:	0089a503          	lw	a0,8(s3)
8040bd4c:	0049ab03          	lw	s6,4(s3)
8040bd50:	00030593          	mv	a1,t1
8040bd54:	01012a23          	sw	a6,20(sp)
8040bd58:	9f0fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bd5c:	00a9a223          	sw	a0,4(s3)
8040bd60:	0169a423          	sw	s6,8(s3)
8040bd64:	01412803          	lw	a6,20(sp)
8040bd68:	300508e3          	beqz	a0,8040c878 <stride_dequeue+0x3658>
8040bd6c:	01352023          	sw	s3,0(a0)
8040bd70:	00098313          	mv	t1,s3
8040bd74:	008c2b03          	lw	s6,8(s8)
8040bd78:	db4ff06f          	j	8040b32c <stride_dequeue+0x210c>
8040bd7c:	0088a503          	lw	a0,8(a7)
8040bd80:	000e0593          	mv	a1,t3
8040bd84:	0048ab03          	lw	s6,4(a7)
8040bd88:	01112a23          	sw	a7,20(sp)
8040bd8c:	9bcfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bd90:	01412883          	lw	a7,20(sp)
8040bd94:	00a8a223          	sw	a0,4(a7)
8040bd98:	0168a423          	sw	s6,8(a7)
8040bd9c:	00050463          	beqz	a0,8040bda4 <stride_dequeue+0x2b84>
8040bda0:	01152023          	sw	a7,0(a0)
8040bda4:	008c2b03          	lw	s6,8(s8)
8040bda8:	d84fe06f          	j	8040a32c <stride_dequeue+0x110c>
8040bdac:	0089a503          	lw	a0,8(s3)
8040bdb0:	0049ab03          	lw	s6,4(s3)
8040bdb4:	00080593          	mv	a1,a6
8040bdb8:	01112a23          	sw	a7,20(sp)
8040bdbc:	98cfd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bdc0:	00a9a223          	sw	a0,4(s3)
8040bdc4:	0169a423          	sw	s6,8(s3)
8040bdc8:	01412883          	lw	a7,20(sp)
8040bdcc:	300506e3          	beqz	a0,8040c8d8 <stride_dequeue+0x36b8>
8040bdd0:	01352023          	sw	s3,0(a0)
8040bdd4:	00098813          	mv	a6,s3
8040bdd8:	008c2b03          	lw	s6,8(s8)
8040bddc:	c34ff06f          	j	8040b210 <stride_dequeue+0x1ff0>
8040bde0:	0089a503          	lw	a0,8(s3)
8040bde4:	0049ab03          	lw	s6,4(s3)
8040bde8:	00060593          	mv	a1,a2
8040bdec:	01112623          	sw	a7,12(sp)
8040bdf0:	958fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bdf4:	00a9a223          	sw	a0,4(s3)
8040bdf8:	0169a423          	sw	s6,8(s3)
8040bdfc:	00c12883          	lw	a7,12(sp)
8040be00:	00050463          	beqz	a0,8040be08 <stride_dequeue+0x2be8>
8040be04:	01352023          	sw	s3,0(a0)
8040be08:	008c2b03          	lw	s6,8(s8)
8040be0c:	a90ff06f          	j	8040b09c <stride_dequeue+0x1e7c>
8040be10:	0089a503          	lw	a0,8(s3)
8040be14:	0049ab03          	lw	s6,4(s3)
8040be18:	000a0593          	mv	a1,s4
8040be1c:	01112823          	sw	a7,16(sp)
8040be20:	928fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040be24:	00a9a223          	sw	a0,4(s3)
8040be28:	0169a423          	sw	s6,8(s3)
8040be2c:	01012883          	lw	a7,16(sp)
8040be30:	00050463          	beqz	a0,8040be38 <stride_dequeue+0x2c18>
8040be34:	01352023          	sw	s3,0(a0)
8040be38:	008c2b03          	lw	s6,8(s8)
8040be3c:	fb9fe06f          	j	8040adf4 <stride_dequeue+0x1bd4>
8040be40:	0089a503          	lw	a0,8(s3)
8040be44:	0049ab03          	lw	s6,4(s3)
8040be48:	000e0593          	mv	a1,t3
8040be4c:	01012a23          	sw	a6,20(sp)
8040be50:	00c12823          	sw	a2,16(sp)
8040be54:	8f4fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040be58:	00a9a223          	sw	a0,4(s3)
8040be5c:	0169a423          	sw	s6,8(s3)
8040be60:	01012603          	lw	a2,16(sp)
8040be64:	01412803          	lw	a6,20(sp)
8040be68:	00050463          	beqz	a0,8040be70 <stride_dequeue+0x2c50>
8040be6c:	01352023          	sw	s3,0(a0)
8040be70:	008c2b03          	lw	s6,8(s8)
8040be74:	c65fe06f          	j	8040aad8 <stride_dequeue+0x18b8>
8040be78:	0089a503          	lw	a0,8(s3)
8040be7c:	0049ab03          	lw	s6,4(s3)
8040be80:	00080593          	mv	a1,a6
8040be84:	8c4fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040be88:	00a9a223          	sw	a0,4(s3)
8040be8c:	0169a423          	sw	s6,8(s3)
8040be90:	00050463          	beqz	a0,8040be98 <stride_dequeue+0x2c78>
8040be94:	01352023          	sw	s3,0(a0)
8040be98:	008c2b03          	lw	s6,8(s8)
8040be9c:	914ff06f          	j	8040afb0 <stride_dequeue+0x1d90>
8040bea0:	0089a503          	lw	a0,8(s3)
8040bea4:	0049ab03          	lw	s6,4(s3)
8040bea8:	000e0593          	mv	a1,t3
8040beac:	01012a23          	sw	a6,20(sp)
8040beb0:	898fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040beb4:	00a9a223          	sw	a0,4(s3)
8040beb8:	0169a423          	sw	s6,8(s3)
8040bebc:	01412803          	lw	a6,20(sp)
8040bec0:	00050463          	beqz	a0,8040bec8 <stride_dequeue+0x2ca8>
8040bec4:	01352023          	sw	s3,0(a0)
8040bec8:	008c2b03          	lw	s6,8(s8)
8040becc:	b21fe06f          	j	8040a9ec <stride_dequeue+0x17cc>
8040bed0:	0089a503          	lw	a0,8(s3)
8040bed4:	0049ab03          	lw	s6,4(s3)
8040bed8:	00080593          	mv	a1,a6
8040bedc:	00c12623          	sw	a2,12(sp)
8040bee0:	868fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bee4:	00a9a223          	sw	a0,4(s3)
8040bee8:	0169a423          	sw	s6,8(s3)
8040beec:	00c12603          	lw	a2,12(sp)
8040bef0:	00050463          	beqz	a0,8040bef8 <stride_dequeue+0x2cd8>
8040bef4:	01352023          	sw	s3,0(a0)
8040bef8:	008c2b03          	lw	s6,8(s8)
8040befc:	a94ff06f          	j	8040b190 <stride_dequeue+0x1f70>
8040bf00:	0088a503          	lw	a0,8(a7)
8040bf04:	000e0593          	mv	a1,t3
8040bf08:	0048ab03          	lw	s6,4(a7)
8040bf0c:	01112823          	sw	a7,16(sp)
8040bf10:	838fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bf14:	01012883          	lw	a7,16(sp)
8040bf18:	01412603          	lw	a2,20(sp)
8040bf1c:	00a8a223          	sw	a0,4(a7)
8040bf20:	0168a423          	sw	s6,8(a7)
8040bf24:	00050463          	beqz	a0,8040bf2c <stride_dequeue+0x2d0c>
8040bf28:	01152023          	sw	a7,0(a0)
8040bf2c:	008c2b03          	lw	s6,8(s8)
8040bf30:	aecfe06f          	j	8040a21c <stride_dequeue+0xffc>
8040bf34:	0089a503          	lw	a0,8(s3)
8040bf38:	0049ab03          	lw	s6,4(s3)
8040bf3c:	00088593          	mv	a1,a7
8040bf40:	808fd0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bf44:	00a9a223          	sw	a0,4(s3)
8040bf48:	0169a423          	sw	s6,8(s3)
8040bf4c:	00050463          	beqz	a0,8040bf54 <stride_dequeue+0x2d34>
8040bf50:	01352023          	sw	s3,0(a0)
8040bf54:	008c2b03          	lw	s6,8(s8)
8040bf58:	811fe06f          	j	8040a768 <stride_dequeue+0x1548>
8040bf5c:	0089a503          	lw	a0,8(s3)
8040bf60:	0049ab03          	lw	s6,4(s3)
8040bf64:	00088593          	mv	a1,a7
8040bf68:	fe1fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bf6c:	00a9a223          	sw	a0,4(s3)
8040bf70:	0169a423          	sw	s6,8(s3)
8040bf74:	00050463          	beqz	a0,8040bf7c <stride_dequeue+0x2d5c>
8040bf78:	01352023          	sw	s3,0(a0)
8040bf7c:	008c2b03          	lw	s6,8(s8)
8040bf80:	ed4fe06f          	j	8040a654 <stride_dequeue+0x1434>
8040bf84:	00862503          	lw	a0,8(a2)
8040bf88:	000e0593          	mv	a1,t3
8040bf8c:	00462b03          	lw	s6,4(a2)
8040bf90:	fb9fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bf94:	01012603          	lw	a2,16(sp)
8040bf98:	01412803          	lw	a6,20(sp)
8040bf9c:	00a62223          	sw	a0,4(a2)
8040bfa0:	01662423          	sw	s6,8(a2)
8040bfa4:	00050463          	beqz	a0,8040bfac <stride_dequeue+0x2d8c>
8040bfa8:	00c52023          	sw	a2,0(a0)
8040bfac:	008c2b03          	lw	s6,8(s8)
8040bfb0:	c71fd06f          	j	80409c20 <stride_dequeue+0xa00>
8040bfb4:	00040993          	mv	s3,s0
8040bfb8:	c7dfe06f          	j	8040ac34 <stride_dequeue+0x1a14>
8040bfbc:	008ca503          	lw	a0,8(s9)
8040bfc0:	004cab03          	lw	s6,4(s9)
8040bfc4:	000e0593          	mv	a1,t3
8040bfc8:	01012a23          	sw	a6,20(sp)
8040bfcc:	f7dfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bfd0:	00aca223          	sw	a0,4(s9)
8040bfd4:	016ca423          	sw	s6,8(s9)
8040bfd8:	01412803          	lw	a6,20(sp)
8040bfdc:	00050463          	beqz	a0,8040bfe4 <stride_dequeue+0x2dc4>
8040bfe0:	01952023          	sw	s9,0(a0)
8040bfe4:	008c2b03          	lw	s6,8(s8)
8040bfe8:	971fd06f          	j	80409958 <stride_dequeue+0x738>
8040bfec:	0089a503          	lw	a0,8(s3)
8040bff0:	0049ab03          	lw	s6,4(s3)
8040bff4:	00080593          	mv	a1,a6
8040bff8:	f51fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040bffc:	00a9a223          	sw	a0,4(s3)
8040c000:	0169a423          	sw	s6,8(s3)
8040c004:	00050463          	beqz	a0,8040c00c <stride_dequeue+0x2dec>
8040c008:	01352023          	sw	s3,0(a0)
8040c00c:	008c2b03          	lw	s6,8(s8)
8040c010:	ec5fe06f          	j	8040aed4 <stride_dequeue+0x1cb4>
8040c014:	008a2503          	lw	a0,8(s4)
8040c018:	004a2b03          	lw	s6,4(s4)
8040c01c:	000e0593          	mv	a1,t3
8040c020:	01012a23          	sw	a6,20(sp)
8040c024:	f25fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c028:	00aa2223          	sw	a0,4(s4)
8040c02c:	016a2423          	sw	s6,8(s4)
8040c030:	01412803          	lw	a6,20(sp)
8040c034:	00050463          	beqz	a0,8040c03c <stride_dequeue+0x2e1c>
8040c038:	01452023          	sw	s4,0(a0)
8040c03c:	008c2b03          	lw	s6,8(s8)
8040c040:	a79fd06f          	j	80409ab8 <stride_dequeue+0x898>
8040c044:	0089a503          	lw	a0,8(s3)
8040c048:	0049ab03          	lw	s6,4(s3)
8040c04c:	00030593          	mv	a1,t1
8040c050:	01012a23          	sw	a6,20(sp)
8040c054:	00c12823          	sw	a2,16(sp)
8040c058:	ef1fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c05c:	00a9a223          	sw	a0,4(s3)
8040c060:	0169a423          	sw	s6,8(s3)
8040c064:	01012603          	lw	a2,16(sp)
8040c068:	01412803          	lw	a6,20(sp)
8040c06c:	06050ce3          	beqz	a0,8040c8e4 <stride_dequeue+0x36c4>
8040c070:	01352023          	sw	s3,0(a0)
8040c074:	00098313          	mv	t1,s3
8040c078:	008c2b03          	lw	s6,8(s8)
8040c07c:	a2cff06f          	j	8040b2a8 <stride_dequeue+0x2088>
8040c080:	0089a503          	lw	a0,8(s3)
8040c084:	0049ab03          	lw	s6,4(s3)
8040c088:	000e0593          	mv	a1,t3
8040c08c:	01012a23          	sw	a6,20(sp)
8040c090:	eb9fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c094:	00a9a223          	sw	a0,4(s3)
8040c098:	0169a423          	sw	s6,8(s3)
8040c09c:	01412803          	lw	a6,20(sp)
8040c0a0:	00050463          	beqz	a0,8040c0a8 <stride_dequeue+0x2e88>
8040c0a4:	01352023          	sw	s3,0(a0)
8040c0a8:	008c2b03          	lw	s6,8(s8)
8040c0ac:	86dfe06f          	j	8040a918 <stride_dequeue+0x16f8>
8040c0b0:	0089a503          	lw	a0,8(s3)
8040c0b4:	0049ab03          	lw	s6,4(s3)
8040c0b8:	00030593          	mv	a1,t1
8040c0bc:	01012a23          	sw	a6,20(sp)
8040c0c0:	e89fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c0c4:	00a9a223          	sw	a0,4(s3)
8040c0c8:	0169a423          	sw	s6,8(s3)
8040c0cc:	01412803          	lw	a6,20(sp)
8040c0d0:	76050663          	beqz	a0,8040c83c <stride_dequeue+0x361c>
8040c0d4:	01352023          	sw	s3,0(a0)
8040c0d8:	00098313          	mv	t1,s3
8040c0dc:	008c2b03          	lw	s6,8(s8)
8040c0e0:	ad0ff06f          	j	8040b3b0 <stride_dequeue+0x2190>
8040c0e4:	0089a503          	lw	a0,8(s3)
8040c0e8:	0049ab03          	lw	s6,4(s3)
8040c0ec:	000e0593          	mv	a1,t3
8040c0f0:	01112a23          	sw	a7,20(sp)
8040c0f4:	e55fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c0f8:	00a9a223          	sw	a0,4(s3)
8040c0fc:	0169a423          	sw	s6,8(s3)
8040c100:	01412883          	lw	a7,20(sp)
8040c104:	00050463          	beqz	a0,8040c10c <stride_dequeue+0x2eec>
8040c108:	01352023          	sw	s3,0(a0)
8040c10c:	008c2b03          	lw	s6,8(s8)
8040c110:	f30fe06f          	j	8040a840 <stride_dequeue+0x1620>
8040c114:	008a2503          	lw	a0,8(s4)
8040c118:	004a2b03          	lw	s6,4(s4)
8040c11c:	00030593          	mv	a1,t1
8040c120:	e29fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c124:	00aa2223          	sw	a0,4(s4)
8040c128:	016a2423          	sw	s6,8(s4)
8040c12c:	00050463          	beqz	a0,8040c134 <stride_dequeue+0x2f14>
8040c130:	01452023          	sw	s4,0(a0)
8040c134:	008c2b03          	lw	s6,8(s8)
8040c138:	e9dfd06f          	j	80409fd4 <stride_dequeue+0xdb4>
8040c13c:	0089a503          	lw	a0,8(s3)
8040c140:	0049ab03          	lw	s6,4(s3)
8040c144:	00088593          	mv	a1,a7
8040c148:	00c12623          	sw	a2,12(sp)
8040c14c:	dfdfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c150:	00a9a223          	sw	a0,4(s3)
8040c154:	0169a423          	sw	s6,8(s3)
8040c158:	00c12603          	lw	a2,12(sp)
8040c15c:	00050463          	beqz	a0,8040c164 <stride_dequeue+0x2f44>
8040c160:	01352023          	sw	s3,0(a0)
8040c164:	008c2b03          	lw	s6,8(s8)
8040c168:	bd4fe06f          	j	8040a53c <stride_dequeue+0x131c>
8040c16c:	0088a503          	lw	a0,8(a7)
8040c170:	000e0593          	mv	a1,t3
8040c174:	0048ab03          	lw	s6,4(a7)
8040c178:	01112a23          	sw	a7,20(sp)
8040c17c:	dcdfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c180:	01412883          	lw	a7,20(sp)
8040c184:	00a8a223          	sw	a0,4(a7)
8040c188:	0168a423          	sw	s6,8(a7)
8040c18c:	00050463          	beqz	a0,8040c194 <stride_dequeue+0x2f74>
8040c190:	01152023          	sw	a7,0(a0)
8040c194:	008c2b03          	lw	s6,8(s8)
8040c198:	f51fd06f          	j	8040a0e8 <stride_dequeue+0xec8>
8040c19c:	0089a503          	lw	a0,8(s3)
8040c1a0:	0049ab03          	lw	s6,4(s3)
8040c1a4:	00030593          	mv	a1,t1
8040c1a8:	01112a23          	sw	a7,20(sp)
8040c1ac:	d9dfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c1b0:	00a9a223          	sw	a0,4(s3)
8040c1b4:	0169a423          	sw	s6,8(s3)
8040c1b8:	01412883          	lw	a7,20(sp)
8040c1bc:	5e050863          	beqz	a0,8040c7ac <stride_dequeue+0x358c>
8040c1c0:	01352023          	sw	s3,0(a0)
8040c1c4:	00098313          	mv	t1,s3
8040c1c8:	008c2b03          	lw	s6,8(s8)
8040c1cc:	a64ff06f          	j	8040b430 <stride_dequeue+0x2210>
8040c1d0:	0089a503          	lw	a0,8(s3)
8040c1d4:	0049ab03          	lw	s6,4(s3)
8040c1d8:	000d8593          	mv	a1,s11
8040c1dc:	01112823          	sw	a7,16(sp)
8040c1e0:	d69fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c1e4:	00a9a223          	sw	a0,4(s3)
8040c1e8:	0169a423          	sw	s6,8(s3)
8040c1ec:	01012883          	lw	a7,16(sp)
8040c1f0:	00050463          	beqz	a0,8040c1f8 <stride_dequeue+0x2fd8>
8040c1f4:	01352023          	sw	s3,0(a0)
8040c1f8:	008c2b03          	lw	s6,8(s8)
8040c1fc:	b19fe06f          	j	8040ad14 <stride_dequeue+0x1af4>
8040c200:	00080993          	mv	s3,a6
8040c204:	cd1fe06f          	j	8040aed4 <stride_dequeue+0x1cb4>
8040c208:	000d8993          	mv	s3,s11
8040c20c:	b09fe06f          	j	8040ad14 <stride_dequeue+0x1af4>
8040c210:	00080993          	mv	s3,a6
8040c214:	d9dfe06f          	j	8040afb0 <stride_dequeue+0x1d90>
8040c218:	00080993          	mv	s3,a6
8040c21c:	f75fe06f          	j	8040b190 <stride_dequeue+0x1f70>
8040c220:	00060993          	mv	s3,a2
8040c224:	e79fe06f          	j	8040b09c <stride_dequeue+0x1e7c>
8040c228:	000a0993          	mv	s3,s4
8040c22c:	bc9fe06f          	j	8040adf4 <stride_dequeue+0x1bd4>
8040c230:	008c2b03          	lw	s6,8(s8)
8040c234:	000e0c93          	mv	s9,t3
8040c238:	f20fd06f          	j	80409958 <stride_dequeue+0x738>
8040c23c:	008c2b03          	lw	s6,8(s8)
8040c240:	000e0613          	mv	a2,t3
8040c244:	9ddfd06f          	j	80409c20 <stride_dequeue+0xa00>
8040c248:	0087a503          	lw	a0,8(a5)
8040c24c:	00098593          	mv	a1,s3
8040c250:	0047ab03          	lw	s6,4(a5)
8040c254:	cf5fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c258:	01012783          	lw	a5,16(sp)
8040c25c:	00a7a223          	sw	a0,4(a5)
8040c260:	0167a423          	sw	s6,8(a5)
8040c264:	68050663          	beqz	a0,8040c8f0 <stride_dequeue+0x36d0>
8040c268:	00f52023          	sw	a5,0(a0)
8040c26c:	00078993          	mv	s3,a5
8040c270:	008c2b03          	lw	s6,8(s8)
8040c274:	ad4ff06f          	j	8040b548 <stride_dequeue+0x2328>
8040c278:	008c2b03          	lw	s6,8(s8)
8040c27c:	000e0a13          	mv	s4,t3
8040c280:	839fd06f          	j	80409ab8 <stride_dequeue+0x898>
8040c284:	008c2b03          	lw	s6,8(s8)
8040c288:	000e0993          	mv	s3,t3
8040c28c:	f60fe06f          	j	8040a9ec <stride_dequeue+0x17cc>
8040c290:	008c2b03          	lw	s6,8(s8)
8040c294:	00098793          	mv	a5,s3
8040c298:	8d9fe06f          	j	8040ab70 <stride_dequeue+0x1950>
8040c29c:	008c2b03          	lw	s6,8(s8)
8040c2a0:	000e0993          	mv	s3,t3
8040c2a4:	e74fe06f          	j	8040a918 <stride_dequeue+0x16f8>
8040c2a8:	0089a503          	lw	a0,8(s3)
8040c2ac:	0049ab03          	lw	s6,4(s3)
8040c2b0:	00088593          	mv	a1,a7
8040c2b4:	c95fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c2b8:	00a9a223          	sw	a0,4(s3)
8040c2bc:	0169a423          	sw	s6,8(s3)
8040c2c0:	00050463          	beqz	a0,8040c2c8 <stride_dequeue+0x30a8>
8040c2c4:	01352023          	sw	s3,0(a0)
8040c2c8:	008c2b03          	lw	s6,8(s8)
8040c2cc:	955fe06f          	j	8040ac20 <stride_dequeue+0x1a00>
8040c2d0:	008c2b03          	lw	s6,8(s8)
8040c2d4:	000e0893          	mv	a7,t3
8040c2d8:	854fe06f          	j	8040a32c <stride_dequeue+0x110c>
8040c2dc:	0087a503          	lw	a0,8(a5)
8040c2e0:	000a0593          	mv	a1,s4
8040c2e4:	0047ab03          	lw	s6,4(a5)
8040c2e8:	c61fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c2ec:	00c12783          	lw	a5,12(sp)
8040c2f0:	01012603          	lw	a2,16(sp)
8040c2f4:	00a7a223          	sw	a0,4(a5)
8040c2f8:	0167a423          	sw	s6,8(a5)
8040c2fc:	52050a63          	beqz	a0,8040c830 <stride_dequeue+0x3610>
8040c300:	00f52023          	sw	a5,0(a0)
8040c304:	00078a13          	mv	s4,a5
8040c308:	008c2b03          	lw	s6,8(s8)
8040c30c:	9d0ff06f          	j	8040b4dc <stride_dequeue+0x22bc>
8040c310:	008c2b03          	lw	s6,8(s8)
8040c314:	000e0893          	mv	a7,t3
8040c318:	dd1fd06f          	j	8040a0e8 <stride_dequeue+0xec8>
8040c31c:	008c2b03          	lw	s6,8(s8)
8040c320:	000e0993          	mv	s3,t3
8040c324:	d1cfe06f          	j	8040a840 <stride_dequeue+0x1620>
8040c328:	008c2b03          	lw	s6,8(s8)
8040c32c:	000e0993          	mv	s3,t3
8040c330:	fa8fe06f          	j	8040aad8 <stride_dequeue+0x18b8>
8040c334:	008c2b03          	lw	s6,8(s8)
8040c338:	000e0893          	mv	a7,t3
8040c33c:	ee1fd06f          	j	8040a21c <stride_dequeue+0xffc>
8040c340:	0087a503          	lw	a0,8(a5)
8040c344:	000c8593          	mv	a1,s9
8040c348:	0047ab03          	lw	s6,4(a5)
8040c34c:	bfdfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c350:	01012783          	lw	a5,16(sp)
8040c354:	00a7a223          	sw	a0,4(a5)
8040c358:	0167a423          	sw	s6,8(a5)
8040c35c:	44050e63          	beqz	a0,8040c7b8 <stride_dequeue+0x3598>
8040c360:	00f52023          	sw	a5,0(a0)
8040c364:	00078c93          	mv	s9,a5
8040c368:	008c2b03          	lw	s6,8(s8)
8040c36c:	ab4ff06f          	j	8040b620 <stride_dequeue+0x2400>
8040c370:	0087a503          	lw	a0,8(a5)
8040c374:	000a0593          	mv	a1,s4
8040c378:	0047ab03          	lw	s6,4(a5)
8040c37c:	bcdfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c380:	01012783          	lw	a5,16(sp)
8040c384:	00a7a223          	sw	a0,4(a5)
8040c388:	0167a423          	sw	s6,8(a5)
8040c38c:	52050463          	beqz	a0,8040c8b4 <stride_dequeue+0x3694>
8040c390:	00f52023          	sw	a5,0(a0)
8040c394:	00078a13          	mv	s4,a5
8040c398:	008c2b03          	lw	s6,8(s8)
8040c39c:	a18ff06f          	j	8040b5b4 <stride_dequeue+0x2394>
8040c3a0:	008c2b03          	lw	s6,8(s8)
8040c3a4:	00088993          	mv	s3,a7
8040c3a8:	879fe06f          	j	8040ac20 <stride_dequeue+0x1a00>
8040c3ac:	0089a503          	lw	a0,8(s3)
8040c3b0:	0049ab03          	lw	s6,4(s3)
8040c3b4:	000e0593          	mv	a1,t3
8040c3b8:	01012a23          	sw	a6,20(sp)
8040c3bc:	b8dfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c3c0:	00a9a223          	sw	a0,4(s3)
8040c3c4:	0169a423          	sw	s6,8(s3)
8040c3c8:	01412803          	lw	a6,20(sp)
8040c3cc:	00050463          	beqz	a0,8040c3d4 <stride_dequeue+0x31b4>
8040c3d0:	01352023          	sw	s3,0(a0)
8040c3d4:	008c2b03          	lw	s6,8(s8)
8040c3d8:	bc5fe06f          	j	8040af9c <stride_dequeue+0x1d7c>
8040c3dc:	00882503          	lw	a0,8(a6)
8040c3e0:	00098593          	mv	a1,s3
8040c3e4:	00482b03          	lw	s6,4(a6)
8040c3e8:	b61fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c3ec:	01412803          	lw	a6,20(sp)
8040c3f0:	01812883          	lw	a7,24(sp)
8040c3f4:	00a82223          	sw	a0,4(a6)
8040c3f8:	01682423          	sw	s6,8(a6)
8040c3fc:	4a050063          	beqz	a0,8040c89c <stride_dequeue+0x367c>
8040c400:	01052023          	sw	a6,0(a0)
8040c404:	00080993          	mv	s3,a6
8040c408:	008c2b03          	lw	s6,8(s8)
8040c40c:	a9cff06f          	j	8040b6a8 <stride_dequeue+0x2488>
8040c410:	0089a503          	lw	a0,8(s3)
8040c414:	0049ab03          	lw	s6,4(s3)
8040c418:	000e0593          	mv	a1,t3
8040c41c:	01112a23          	sw	a7,20(sp)
8040c420:	00c12823          	sw	a2,16(sp)
8040c424:	b25fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c428:	00a9a223          	sw	a0,4(s3)
8040c42c:	0169a423          	sw	s6,8(s3)
8040c430:	01012603          	lw	a2,16(sp)
8040c434:	01412883          	lw	a7,20(sp)
8040c438:	00050463          	beqz	a0,8040c440 <stride_dequeue+0x3220>
8040c43c:	01352023          	sw	s3,0(a0)
8040c440:	008c2b03          	lw	s6,8(s8)
8040c444:	c45fe06f          	j	8040b088 <stride_dequeue+0x1e68>
8040c448:	0088a503          	lw	a0,8(a7)
8040c44c:	00098593          	mv	a1,s3
8040c450:	0048ab03          	lw	s6,4(a7)
8040c454:	af5fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c458:	01012883          	lw	a7,16(sp)
8040c45c:	01412603          	lw	a2,20(sp)
8040c460:	01812803          	lw	a6,24(sp)
8040c464:	00a8a223          	sw	a0,4(a7)
8040c468:	0168a423          	sw	s6,8(a7)
8040c46c:	48050863          	beqz	a0,8040c8fc <stride_dequeue+0x36dc>
8040c470:	01152023          	sw	a7,0(a0)
8040c474:	00088993          	mv	s3,a7
8040c478:	008c2b03          	lw	s6,8(s8)
8040c47c:	bc0ff06f          	j	8040b83c <stride_dequeue+0x261c>
8040c480:	00832503          	lw	a0,8(t1)
8040c484:	000c8593          	mv	a1,s9
8040c488:	00432b03          	lw	s6,4(t1)
8040c48c:	abdfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c490:	01412303          	lw	t1,20(sp)
8040c494:	01812883          	lw	a7,24(sp)
8040c498:	00a32223          	sw	a0,4(t1)
8040c49c:	01632423          	sw	s6,8(t1)
8040c4a0:	36050663          	beqz	a0,8040c80c <stride_dequeue+0x35ec>
8040c4a4:	00652023          	sw	t1,0(a0)
8040c4a8:	00030c93          	mv	s9,t1
8040c4ac:	008c2b03          	lw	s6,8(s8)
8040c4b0:	e10ff06f          	j	8040bac0 <stride_dequeue+0x28a0>
8040c4b4:	0089a503          	lw	a0,8(s3)
8040c4b8:	0049ab03          	lw	s6,4(s3)
8040c4bc:	000e0593          	mv	a1,t3
8040c4c0:	01112a23          	sw	a7,20(sp)
8040c4c4:	00c12823          	sw	a2,16(sp)
8040c4c8:	a81fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c4cc:	00a9a223          	sw	a0,4(s3)
8040c4d0:	0169a423          	sw	s6,8(s3)
8040c4d4:	01012603          	lw	a2,16(sp)
8040c4d8:	01412883          	lw	a7,20(sp)
8040c4dc:	00050463          	beqz	a0,8040c4e4 <stride_dequeue+0x32c4>
8040c4e0:	01352023          	sw	s3,0(a0)
8040c4e4:	008c2b03          	lw	s6,8(s8)
8040c4e8:	840fe06f          	j	8040a528 <stride_dequeue+0x1308>
8040c4ec:	0089a503          	lw	a0,8(s3)
8040c4f0:	0049ab03          	lw	s6,4(s3)
8040c4f4:	000e0593          	mv	a1,t3
8040c4f8:	01012a23          	sw	a6,20(sp)
8040c4fc:	00c12823          	sw	a2,16(sp)
8040c500:	a49fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c504:	00a9a223          	sw	a0,4(s3)
8040c508:	0169a423          	sw	s6,8(s3)
8040c50c:	01012603          	lw	a2,16(sp)
8040c510:	01412803          	lw	a6,20(sp)
8040c514:	00050463          	beqz	a0,8040c51c <stride_dequeue+0x32fc>
8040c518:	01352023          	sw	s3,0(a0)
8040c51c:	008c2b03          	lw	s6,8(s8)
8040c520:	c5dfe06f          	j	8040b17c <stride_dequeue+0x1f5c>
8040c524:	00832503          	lw	a0,8(t1)
8040c528:	00080593          	mv	a1,a6
8040c52c:	00432b03          	lw	s6,4(t1)
8040c530:	a19fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c534:	01412303          	lw	t1,20(sp)
8040c538:	00a32223          	sw	a0,4(t1)
8040c53c:	01632423          	sw	s6,8(t1)
8040c540:	2e050263          	beqz	a0,8040c824 <stride_dequeue+0x3604>
8040c544:	00652023          	sw	t1,0(a0)
8040c548:	00030813          	mv	a6,t1
8040c54c:	008c2b03          	lw	s6,8(s8)
8040c550:	bf0ff06f          	j	8040b940 <stride_dequeue+0x2720>
8040c554:	00832503          	lw	a0,8(t1)
8040c558:	00080593          	mv	a1,a6
8040c55c:	00432b03          	lw	s6,4(t1)
8040c560:	9e9fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c564:	01412303          	lw	t1,20(sp)
8040c568:	00a32223          	sw	a0,4(t1)
8040c56c:	01632423          	sw	s6,8(t1)
8040c570:	2e050263          	beqz	a0,8040c854 <stride_dequeue+0x3634>
8040c574:	00652023          	sw	t1,0(a0)
8040c578:	00030813          	mv	a6,t1
8040c57c:	008c2b03          	lw	s6,8(s8)
8040c580:	b38ff06f          	j	8040b8b8 <stride_dequeue+0x2698>
8040c584:	00882503          	lw	a0,8(a6)
8040c588:	00098593          	mv	a1,s3
8040c58c:	00482b03          	lw	s6,4(a6)
8040c590:	9b9fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c594:	01412803          	lw	a6,20(sp)
8040c598:	01812883          	lw	a7,24(sp)
8040c59c:	00a82223          	sw	a0,4(a6)
8040c5a0:	01682423          	sw	s6,8(a6)
8040c5a4:	22050663          	beqz	a0,8040c7d0 <stride_dequeue+0x35b0>
8040c5a8:	01052023          	sw	a6,0(a0)
8040c5ac:	00080993          	mv	s3,a6
8040c5b0:	008c2b03          	lw	s6,8(s8)
8040c5b4:	970ff06f          	j	8040b724 <stride_dequeue+0x2504>
8040c5b8:	00832503          	lw	a0,8(t1)
8040c5bc:	00080593          	mv	a1,a6
8040c5c0:	00432b03          	lw	s6,4(t1)
8040c5c4:	985fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c5c8:	01012303          	lw	t1,16(sp)
8040c5cc:	01412603          	lw	a2,20(sp)
8040c5d0:	00a32223          	sw	a0,4(t1)
8040c5d4:	01632423          	sw	s6,8(t1)
8040c5d8:	2e050a63          	beqz	a0,8040c8cc <stride_dequeue+0x36ac>
8040c5dc:	00652023          	sw	t1,0(a0)
8040c5e0:	00030813          	mv	a6,t1
8040c5e4:	008c2b03          	lw	s6,8(s8)
8040c5e8:	d70ff06f          	j	8040bb58 <stride_dequeue+0x2938>
8040c5ec:	008a2503          	lw	a0,8(s4)
8040c5f0:	004a2b03          	lw	s6,4(s4)
8040c5f4:	000e0593          	mv	a1,t3
8040c5f8:	00612a23          	sw	t1,20(sp)
8040c5fc:	94dfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c600:	00aa2223          	sw	a0,4(s4)
8040c604:	016a2423          	sw	s6,8(s4)
8040c608:	01412303          	lw	t1,20(sp)
8040c60c:	00050463          	beqz	a0,8040c614 <stride_dequeue+0x33f4>
8040c610:	01452023          	sw	s4,0(a0)
8040c614:	008c2b03          	lw	s6,8(s8)
8040c618:	9a9fd06f          	j	80409fc0 <stride_dequeue+0xda0>
8040c61c:	0089a503          	lw	a0,8(s3)
8040c620:	0049ab03          	lw	s6,4(s3)
8040c624:	000e0593          	mv	a1,t3
8040c628:	01112a23          	sw	a7,20(sp)
8040c62c:	91dfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c630:	00a9a223          	sw	a0,4(s3)
8040c634:	0169a423          	sw	s6,8(s3)
8040c638:	01412883          	lw	a7,20(sp)
8040c63c:	00050463          	beqz	a0,8040c644 <stride_dequeue+0x3424>
8040c640:	01352023          	sw	s3,0(a0)
8040c644:	008c2b03          	lw	s6,8(s8)
8040c648:	f98fe06f          	j	8040ade0 <stride_dequeue+0x1bc0>
8040c64c:	0089a503          	lw	a0,8(s3)
8040c650:	0049ab03          	lw	s6,4(s3)
8040c654:	000e0593          	mv	a1,t3
8040c658:	01012a23          	sw	a6,20(sp)
8040c65c:	8edfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c660:	00a9a223          	sw	a0,4(s3)
8040c664:	0169a423          	sw	s6,8(s3)
8040c668:	01412803          	lw	a6,20(sp)
8040c66c:	00050463          	beqz	a0,8040c674 <stride_dequeue+0x3454>
8040c670:	01352023          	sw	s3,0(a0)
8040c674:	008c2b03          	lw	s6,8(s8)
8040c678:	849fe06f          	j	8040aec0 <stride_dequeue+0x1ca0>
8040c67c:	0089a503          	lw	a0,8(s3)
8040c680:	0049ab03          	lw	s6,4(s3)
8040c684:	000e0593          	mv	a1,t3
8040c688:	01112a23          	sw	a7,20(sp)
8040c68c:	8bdfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c690:	00a9a223          	sw	a0,4(s3)
8040c694:	0169a423          	sw	s6,8(s3)
8040c698:	01412883          	lw	a7,20(sp)
8040c69c:	00050463          	beqz	a0,8040c6a4 <stride_dequeue+0x3484>
8040c6a0:	01352023          	sw	s3,0(a0)
8040c6a4:	008c2b03          	lw	s6,8(s8)
8040c6a8:	f99fd06f          	j	8040a640 <stride_dequeue+0x1420>
8040c6ac:	0088a503          	lw	a0,8(a7)
8040c6b0:	00098593          	mv	a1,s3
8040c6b4:	0048ab03          	lw	s6,4(a7)
8040c6b8:	891fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c6bc:	01412883          	lw	a7,20(sp)
8040c6c0:	01812803          	lw	a6,24(sp)
8040c6c4:	00a8a223          	sw	a0,4(a7)
8040c6c8:	0168a423          	sw	s6,8(a7)
8040c6cc:	0e050c63          	beqz	a0,8040c7c4 <stride_dequeue+0x35a4>
8040c6d0:	01152023          	sw	a7,0(a0)
8040c6d4:	00088993          	mv	s3,a7
8040c6d8:	008c2b03          	lw	s6,8(s8)
8040c6dc:	ae0ff06f          	j	8040b9bc <stride_dequeue+0x279c>
8040c6e0:	00882503          	lw	a0,8(a6)
8040c6e4:	00098593          	mv	a1,s3
8040c6e8:	00482b03          	lw	s6,4(a6)
8040c6ec:	85dfc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c6f0:	01012803          	lw	a6,16(sp)
8040c6f4:	01412603          	lw	a2,20(sp)
8040c6f8:	01812883          	lw	a7,24(sp)
8040c6fc:	00a82223          	sw	a0,4(a6)
8040c700:	01682423          	sw	s6,8(a6)
8040c704:	16050463          	beqz	a0,8040c86c <stride_dequeue+0x364c>
8040c708:	01052023          	sw	a6,0(a0)
8040c70c:	00080993          	mv	s3,a6
8040c710:	008c2b03          	lw	s6,8(s8)
8040c714:	89cff06f          	j	8040b7b0 <stride_dequeue+0x2590>
8040c718:	0089a503          	lw	a0,8(s3)
8040c71c:	0049ab03          	lw	s6,4(s3)
8040c720:	000e0593          	mv	a1,t3
8040c724:	01112a23          	sw	a7,20(sp)
8040c728:	821fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c72c:	00a9a223          	sw	a0,4(s3)
8040c730:	0169a423          	sw	s6,8(s3)
8040c734:	01412883          	lw	a7,20(sp)
8040c738:	00050463          	beqz	a0,8040c740 <stride_dequeue+0x3520>
8040c73c:	01352023          	sw	s3,0(a0)
8040c740:	008c2b03          	lw	s6,8(s8)
8040c744:	810fe06f          	j	8040a754 <stride_dequeue+0x1534>
8040c748:	0089a503          	lw	a0,8(s3)
8040c74c:	0049ab03          	lw	s6,4(s3)
8040c750:	000e0593          	mv	a1,t3
8040c754:	01112a23          	sw	a7,20(sp)
8040c758:	ff0fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c75c:	00a9a223          	sw	a0,4(s3)
8040c760:	0169a423          	sw	s6,8(s3)
8040c764:	01412883          	lw	a7,20(sp)
8040c768:	00050463          	beqz	a0,8040c770 <stride_dequeue+0x3550>
8040c76c:	01352023          	sw	s3,0(a0)
8040c770:	008c2b03          	lw	s6,8(s8)
8040c774:	d8cfe06f          	j	8040ad00 <stride_dequeue+0x1ae0>
8040c778:	0088a503          	lw	a0,8(a7)
8040c77c:	00098593          	mv	a1,s3
8040c780:	0048ab03          	lw	s6,4(a7)
8040c784:	fc4fc0ef          	jal	ra,80408f48 <skew_heap_merge.constprop.3>
8040c788:	01412883          	lw	a7,20(sp)
8040c78c:	01812803          	lw	a6,24(sp)
8040c790:	00a8a223          	sw	a0,4(a7)
8040c794:	0168a423          	sw	s6,8(a7)
8040c798:	04050263          	beqz	a0,8040c7dc <stride_dequeue+0x35bc>
8040c79c:	01152023          	sw	a7,0(a0)
8040c7a0:	00088993          	mv	s3,a7
8040c7a4:	008c2b03          	lw	s6,8(s8)
8040c7a8:	a9cff06f          	j	8040ba44 <stride_dequeue+0x2824>
8040c7ac:	008c2b03          	lw	s6,8(s8)
8040c7b0:	00098313          	mv	t1,s3
8040c7b4:	c7dfe06f          	j	8040b430 <stride_dequeue+0x2210>
8040c7b8:	008c2b03          	lw	s6,8(s8)
8040c7bc:	00078c93          	mv	s9,a5
8040c7c0:	e61fe06f          	j	8040b620 <stride_dequeue+0x2400>
8040c7c4:	008c2b03          	lw	s6,8(s8)
8040c7c8:	00088993          	mv	s3,a7
8040c7cc:	9f0ff06f          	j	8040b9bc <stride_dequeue+0x279c>
8040c7d0:	008c2b03          	lw	s6,8(s8)
8040c7d4:	00080993          	mv	s3,a6
8040c7d8:	f4dfe06f          	j	8040b724 <stride_dequeue+0x2504>
8040c7dc:	008c2b03          	lw	s6,8(s8)
8040c7e0:	00088993          	mv	s3,a7
8040c7e4:	a60ff06f          	j	8040ba44 <stride_dequeue+0x2824>
8040c7e8:	008c2b03          	lw	s6,8(s8)
8040c7ec:	000e0993          	mv	s3,t3
8040c7f0:	df0fe06f          	j	8040ade0 <stride_dequeue+0x1bc0>
8040c7f4:	008c2b03          	lw	s6,8(s8)
8040c7f8:	000e0993          	mv	s3,t3
8040c7fc:	ec4fe06f          	j	8040aec0 <stride_dequeue+0x1ca0>
8040c800:	008c2b03          	lw	s6,8(s8)
8040c804:	000e0993          	mv	s3,t3
8040c808:	d21fd06f          	j	8040a528 <stride_dequeue+0x1308>
8040c80c:	008c2b03          	lw	s6,8(s8)
8040c810:	00030c93          	mv	s9,t1
8040c814:	aacff06f          	j	8040bac0 <stride_dequeue+0x28a0>
8040c818:	008c2b03          	lw	s6,8(s8)
8040c81c:	000e0993          	mv	s3,t3
8040c820:	95dfe06f          	j	8040b17c <stride_dequeue+0x1f5c>
8040c824:	008c2b03          	lw	s6,8(s8)
8040c828:	00030813          	mv	a6,t1
8040c82c:	914ff06f          	j	8040b940 <stride_dequeue+0x2720>
8040c830:	008c2b03          	lw	s6,8(s8)
8040c834:	00078a13          	mv	s4,a5
8040c838:	ca5fe06f          	j	8040b4dc <stride_dequeue+0x22bc>
8040c83c:	008c2b03          	lw	s6,8(s8)
8040c840:	00098313          	mv	t1,s3
8040c844:	b6dfe06f          	j	8040b3b0 <stride_dequeue+0x2190>
8040c848:	008c2b03          	lw	s6,8(s8)
8040c84c:	000e0993          	mv	s3,t3
8040c850:	cb0fe06f          	j	8040ad00 <stride_dequeue+0x1ae0>
8040c854:	008c2b03          	lw	s6,8(s8)
8040c858:	00030813          	mv	a6,t1
8040c85c:	85cff06f          	j	8040b8b8 <stride_dequeue+0x2698>
8040c860:	008c2b03          	lw	s6,8(s8)
8040c864:	000e0993          	mv	s3,t3
8040c868:	eedfd06f          	j	8040a754 <stride_dequeue+0x1534>
8040c86c:	008c2b03          	lw	s6,8(s8)
8040c870:	00080993          	mv	s3,a6
8040c874:	f3dfe06f          	j	8040b7b0 <stride_dequeue+0x2590>
8040c878:	008c2b03          	lw	s6,8(s8)
8040c87c:	00098313          	mv	t1,s3
8040c880:	aadfe06f          	j	8040b32c <stride_dequeue+0x210c>
8040c884:	008c2b03          	lw	s6,8(s8)
8040c888:	000e0993          	mv	s3,t3
8040c88c:	f10fe06f          	j	8040af9c <stride_dequeue+0x1d7c>
8040c890:	008c2b03          	lw	s6,8(s8)
8040c894:	000e0993          	mv	s3,t3
8040c898:	ff0fe06f          	j	8040b088 <stride_dequeue+0x1e68>
8040c89c:	008c2b03          	lw	s6,8(s8)
8040c8a0:	00080993          	mv	s3,a6
8040c8a4:	e05fe06f          	j	8040b6a8 <stride_dequeue+0x2488>
8040c8a8:	008c2b03          	lw	s6,8(s8)
8040c8ac:	000e0993          	mv	s3,t3
8040c8b0:	d91fd06f          	j	8040a640 <stride_dequeue+0x1420>
8040c8b4:	008c2b03          	lw	s6,8(s8)
8040c8b8:	00078a13          	mv	s4,a5
8040c8bc:	cf9fe06f          	j	8040b5b4 <stride_dequeue+0x2394>
8040c8c0:	008c2b03          	lw	s6,8(s8)
8040c8c4:	000e0a13          	mv	s4,t3
8040c8c8:	ef8fd06f          	j	80409fc0 <stride_dequeue+0xda0>
8040c8cc:	008c2b03          	lw	s6,8(s8)
8040c8d0:	00030813          	mv	a6,t1
8040c8d4:	a84ff06f          	j	8040bb58 <stride_dequeue+0x2938>
8040c8d8:	008c2b03          	lw	s6,8(s8)
8040c8dc:	00098813          	mv	a6,s3
8040c8e0:	931fe06f          	j	8040b210 <stride_dequeue+0x1ff0>
8040c8e4:	008c2b03          	lw	s6,8(s8)
8040c8e8:	00098313          	mv	t1,s3
8040c8ec:	9bdfe06f          	j	8040b2a8 <stride_dequeue+0x2088>
8040c8f0:	008c2b03          	lw	s6,8(s8)
8040c8f4:	00078993          	mv	s3,a5
8040c8f8:	c51fe06f          	j	8040b548 <stride_dequeue+0x2328>
8040c8fc:	008c2b03          	lw	s6,8(s8)
8040c900:	00088993          	mv	s3,a7
8040c904:	f39fe06f          	j	8040b83c <stride_dequeue+0x261c>

8040c908 <sched_init>:
8040c908:	ff010113          	addi	sp,sp,-16
8040c90c:	0008c697          	auipc	a3,0x8c
8040c910:	71468693          	addi	a3,a3,1812 # 80499020 <default_sched_class>
8040c914:	00812423          	sw	s0,8(sp)
8040c918:	00112623          	sw	ra,12(sp)
8040c91c:	00090797          	auipc	a5,0x90
8040c920:	ea878793          	addi	a5,a5,-344 # 8049c7c4 <timer_list>
8040c924:	0046a603          	lw	a2,4(a3)
8040c928:	0008f717          	auipc	a4,0x8f
8040c92c:	e2070713          	addi	a4,a4,-480 # 8049b748 <__rq>
8040c930:	00f7a223          	sw	a5,4(a5)
8040c934:	00f7a023          	sw	a5,0(a5)
8040c938:	00500793          	li	a5,5
8040c93c:	00090417          	auipc	s0,0x90
8040c940:	e8440413          	addi	s0,s0,-380 # 8049c7c0 <sched_class>
8040c944:	00f72623          	sw	a5,12(a4)
8040c948:	00070513          	mv	a0,a4
8040c94c:	00d42023          	sw	a3,0(s0)
8040c950:	00090797          	auipc	a5,0x90
8040c954:	e6e7a623          	sw	a4,-404(a5) # 8049c7bc <rq>
8040c958:	000600e7          	jalr	a2
8040c95c:	00042783          	lw	a5,0(s0)
8040c960:	00812403          	lw	s0,8(sp)
8040c964:	00c12083          	lw	ra,12(sp)
8040c968:	0007a583          	lw	a1,0(a5)
8040c96c:	00008517          	auipc	a0,0x8
8040c970:	0b050513          	addi	a0,a0,176 # 80414a1c <CSWTCH.69+0xa14>
8040c974:	01010113          	addi	sp,sp,16
8040c978:	885f306f          	j	804001fc <cprintf>

8040c97c <wakeup_proc>:
8040c97c:	00052703          	lw	a4,0(a0)
8040c980:	ff010113          	addi	sp,sp,-16
8040c984:	00112623          	sw	ra,12(sp)
8040c988:	00812423          	sw	s0,8(sp)
8040c98c:	00912223          	sw	s1,4(sp)
8040c990:	00300793          	li	a5,3
8040c994:	0cf70263          	beq	a4,a5,8040ca58 <wakeup_proc+0xdc>
8040c998:	00050413          	mv	s0,a0
8040c99c:	100027f3          	csrr	a5,sstatus
8040c9a0:	0027f793          	andi	a5,a5,2
8040c9a4:	00000493          	li	s1,0
8040c9a8:	0a079063          	bnez	a5,8040ca48 <wakeup_proc+0xcc>
8040c9ac:	00200793          	li	a5,2
8040c9b0:	06f70e63          	beq	a4,a5,8040ca2c <wakeup_proc+0xb0>
8040c9b4:	00090717          	auipc	a4,0x90
8040c9b8:	df870713          	addi	a4,a4,-520 # 8049c7ac <current>
8040c9bc:	00072703          	lw	a4,0(a4)
8040c9c0:	0a042423          	sw	zero,168(s0)
8040c9c4:	00f42023          	sw	a5,0(s0)
8040c9c8:	02870c63          	beq	a4,s0,8040ca00 <wakeup_proc+0x84>
8040c9cc:	00090797          	auipc	a5,0x90
8040c9d0:	de478793          	addi	a5,a5,-540 # 8049c7b0 <idleproc>
8040c9d4:	0007a783          	lw	a5,0(a5)
8040c9d8:	02f40463          	beq	s0,a5,8040ca00 <wakeup_proc+0x84>
8040c9dc:	00090797          	auipc	a5,0x90
8040c9e0:	de478793          	addi	a5,a5,-540 # 8049c7c0 <sched_class>
8040c9e4:	0007a783          	lw	a5,0(a5)
8040c9e8:	00090717          	auipc	a4,0x90
8040c9ec:	dd470713          	addi	a4,a4,-556 # 8049c7bc <rq>
8040c9f0:	00072503          	lw	a0,0(a4)
8040c9f4:	0087a783          	lw	a5,8(a5)
8040c9f8:	00040593          	mv	a1,s0
8040c9fc:	000780e7          	jalr	a5
8040ca00:	00049c63          	bnez	s1,8040ca18 <wakeup_proc+0x9c>
8040ca04:	00c12083          	lw	ra,12(sp)
8040ca08:	00812403          	lw	s0,8(sp)
8040ca0c:	00412483          	lw	s1,4(sp)
8040ca10:	01010113          	addi	sp,sp,16
8040ca14:	00008067          	ret
8040ca18:	00812403          	lw	s0,8(sp)
8040ca1c:	00c12083          	lw	ra,12(sp)
8040ca20:	00412483          	lw	s1,4(sp)
8040ca24:	01010113          	addi	sp,sp,16
8040ca28:	9ecf406f          	j	80400c14 <intr_enable>
8040ca2c:	00008617          	auipc	a2,0x8
8040ca30:	03860613          	addi	a2,a2,56 # 80414a64 <CSWTCH.69+0xa5c>
8040ca34:	04800593          	li	a1,72
8040ca38:	00008517          	auipc	a0,0x8
8040ca3c:	01450513          	addi	a0,a0,20 # 80414a4c <CSWTCH.69+0xa44>
8040ca40:	c69f30ef          	jal	ra,804006a8 <__warn>
8040ca44:	fbdff06f          	j	8040ca00 <wakeup_proc+0x84>
8040ca48:	9d4f40ef          	jal	ra,80400c1c <intr_disable>
8040ca4c:	00042703          	lw	a4,0(s0)
8040ca50:	00100493          	li	s1,1
8040ca54:	f59ff06f          	j	8040c9ac <wakeup_proc+0x30>
8040ca58:	00008697          	auipc	a3,0x8
8040ca5c:	fd868693          	addi	a3,a3,-40 # 80414a30 <CSWTCH.69+0xa28>
8040ca60:	00006617          	auipc	a2,0x6
8040ca64:	18860613          	addi	a2,a2,392 # 80412be8 <commands+0x1bc>
8040ca68:	03c00593          	li	a1,60
8040ca6c:	00008517          	auipc	a0,0x8
8040ca70:	fe050513          	addi	a0,a0,-32 # 80414a4c <CSWTCH.69+0xa44>
8040ca74:	bb1f30ef          	jal	ra,80400624 <__panic>

8040ca78 <schedule>:
8040ca78:	fe010113          	addi	sp,sp,-32
8040ca7c:	00112e23          	sw	ra,28(sp)
8040ca80:	00812c23          	sw	s0,24(sp)
8040ca84:	00912a23          	sw	s1,20(sp)
8040ca88:	01212823          	sw	s2,16(sp)
8040ca8c:	01312623          	sw	s3,12(sp)
8040ca90:	01412423          	sw	s4,8(sp)
8040ca94:	100027f3          	csrr	a5,sstatus
8040ca98:	0027f793          	andi	a5,a5,2
8040ca9c:	00000a13          	li	s4,0
8040caa0:	0e079e63          	bnez	a5,8040cb9c <schedule+0x124>
8040caa4:	00090497          	auipc	s1,0x90
8040caa8:	d0848493          	addi	s1,s1,-760 # 8049c7ac <current>
8040caac:	0004a583          	lw	a1,0(s1)
8040cab0:	00090997          	auipc	s3,0x90
8040cab4:	d1098993          	addi	s3,s3,-752 # 8049c7c0 <sched_class>
8040cab8:	00090917          	auipc	s2,0x90
8040cabc:	d0490913          	addi	s2,s2,-764 # 8049c7bc <rq>
8040cac0:	0005a683          	lw	a3,0(a1)
8040cac4:	0005a823          	sw	zero,16(a1)
8040cac8:	00200713          	li	a4,2
8040cacc:	0009a783          	lw	a5,0(s3)
8040cad0:	00092503          	lw	a0,0(s2)
8040cad4:	06e68463          	beq	a3,a4,8040cb3c <schedule+0xc4>
8040cad8:	0107a783          	lw	a5,16(a5)
8040cadc:	000780e7          	jalr	a5
8040cae0:	00050413          	mv	s0,a0
8040cae4:	08050463          	beqz	a0,8040cb6c <schedule+0xf4>
8040cae8:	0009a783          	lw	a5,0(s3)
8040caec:	00092503          	lw	a0,0(s2)
8040caf0:	00040593          	mv	a1,s0
8040caf4:	00c7a783          	lw	a5,12(a5)
8040caf8:	000780e7          	jalr	a5
8040cafc:	00842783          	lw	a5,8(s0)
8040cb00:	0004a703          	lw	a4,0(s1)
8040cb04:	00178793          	addi	a5,a5,1
8040cb08:	00f42423          	sw	a5,8(s0)
8040cb0c:	00870663          	beq	a4,s0,8040cb18 <schedule+0xa0>
8040cb10:	00040513          	mv	a0,s0
8040cb14:	f5cfa0ef          	jal	ra,80407270 <proc_run>
8040cb18:	060a1263          	bnez	s4,8040cb7c <schedule+0x104>
8040cb1c:	01c12083          	lw	ra,28(sp)
8040cb20:	01812403          	lw	s0,24(sp)
8040cb24:	01412483          	lw	s1,20(sp)
8040cb28:	01012903          	lw	s2,16(sp)
8040cb2c:	00c12983          	lw	s3,12(sp)
8040cb30:	00812a03          	lw	s4,8(sp)
8040cb34:	02010113          	addi	sp,sp,32
8040cb38:	00008067          	ret
8040cb3c:	00090717          	auipc	a4,0x90
8040cb40:	c7470713          	addi	a4,a4,-908 # 8049c7b0 <idleproc>
8040cb44:	00072703          	lw	a4,0(a4)
8040cb48:	f8e588e3          	beq	a1,a4,8040cad8 <schedule+0x60>
8040cb4c:	0087a783          	lw	a5,8(a5)
8040cb50:	000780e7          	jalr	a5
8040cb54:	0009a783          	lw	a5,0(s3)
8040cb58:	00092503          	lw	a0,0(s2)
8040cb5c:	0107a783          	lw	a5,16(a5)
8040cb60:	000780e7          	jalr	a5
8040cb64:	00050413          	mv	s0,a0
8040cb68:	f80510e3          	bnez	a0,8040cae8 <schedule+0x70>
8040cb6c:	00090797          	auipc	a5,0x90
8040cb70:	c4478793          	addi	a5,a5,-956 # 8049c7b0 <idleproc>
8040cb74:	0007a403          	lw	s0,0(a5)
8040cb78:	f85ff06f          	j	8040cafc <schedule+0x84>
8040cb7c:	01812403          	lw	s0,24(sp)
8040cb80:	01c12083          	lw	ra,28(sp)
8040cb84:	01412483          	lw	s1,20(sp)
8040cb88:	01012903          	lw	s2,16(sp)
8040cb8c:	00c12983          	lw	s3,12(sp)
8040cb90:	00812a03          	lw	s4,8(sp)
8040cb94:	02010113          	addi	sp,sp,32
8040cb98:	87cf406f          	j	80400c14 <intr_enable>
8040cb9c:	880f40ef          	jal	ra,80400c1c <intr_disable>
8040cba0:	00100a13          	li	s4,1
8040cba4:	f01ff06f          	j	8040caa4 <schedule+0x2c>

8040cba8 <add_timer>:
8040cba8:	fe010113          	addi	sp,sp,-32
8040cbac:	00112e23          	sw	ra,28(sp)
8040cbb0:	100027f3          	csrr	a5,sstatus
8040cbb4:	0027f793          	andi	a5,a5,2
8040cbb8:	00000813          	li	a6,0
8040cbbc:	0a079263          	bnez	a5,8040cc60 <add_timer+0xb8>
8040cbc0:	00052703          	lw	a4,0(a0)
8040cbc4:	0a070863          	beqz	a4,8040cc74 <add_timer+0xcc>
8040cbc8:	00452783          	lw	a5,4(a0)
8040cbcc:	0a078463          	beqz	a5,8040cc74 <add_timer+0xcc>
8040cbd0:	00c52783          	lw	a5,12(a0)
8040cbd4:	00850593          	addi	a1,a0,8
8040cbd8:	0af59e63          	bne	a1,a5,8040cc94 <add_timer+0xec>
8040cbdc:	00090617          	auipc	a2,0x90
8040cbe0:	be860613          	addi	a2,a2,-1048 # 8049c7c4 <timer_list>
8040cbe4:	00462783          	lw	a5,4(a2)
8040cbe8:	00c79c63          	bne	a5,a2,8040cc00 <add_timer+0x58>
8040cbec:	0480006f          	j	8040cc34 <add_timer+0x8c>
8040cbf0:	0047a783          	lw	a5,4(a5)
8040cbf4:	40d70733          	sub	a4,a4,a3
8040cbf8:	00e52023          	sw	a4,0(a0)
8040cbfc:	02c78c63          	beq	a5,a2,8040cc34 <add_timer+0x8c>
8040cc00:	ff87a683          	lw	a3,-8(a5)
8040cc04:	fed776e3          	bgeu	a4,a3,8040cbf0 <add_timer+0x48>
8040cc08:	40e68733          	sub	a4,a3,a4
8040cc0c:	fee7ac23          	sw	a4,-8(a5)
8040cc10:	0007a703          	lw	a4,0(a5)
8040cc14:	00b7a023          	sw	a1,0(a5)
8040cc18:	00b72223          	sw	a1,4(a4)
8040cc1c:	00f52623          	sw	a5,12(a0)
8040cc20:	00e52423          	sw	a4,8(a0)
8040cc24:	02080863          	beqz	a6,8040cc54 <add_timer+0xac>
8040cc28:	01c12083          	lw	ra,28(sp)
8040cc2c:	02010113          	addi	sp,sp,32
8040cc30:	fe5f306f          	j	80400c14 <intr_enable>
8040cc34:	00090797          	auipc	a5,0x90
8040cc38:	b9078793          	addi	a5,a5,-1136 # 8049c7c4 <timer_list>
8040cc3c:	0007a703          	lw	a4,0(a5)
8040cc40:	00b7a023          	sw	a1,0(a5)
8040cc44:	00b72223          	sw	a1,4(a4)
8040cc48:	00f52623          	sw	a5,12(a0)
8040cc4c:	00e52423          	sw	a4,8(a0)
8040cc50:	fc081ce3          	bnez	a6,8040cc28 <add_timer+0x80>
8040cc54:	01c12083          	lw	ra,28(sp)
8040cc58:	02010113          	addi	sp,sp,32
8040cc5c:	00008067          	ret
8040cc60:	00a12623          	sw	a0,12(sp)
8040cc64:	fb9f30ef          	jal	ra,80400c1c <intr_disable>
8040cc68:	00100813          	li	a6,1
8040cc6c:	00c12503          	lw	a0,12(sp)
8040cc70:	f51ff06f          	j	8040cbc0 <add_timer+0x18>
8040cc74:	00008697          	auipc	a3,0x8
8040cc78:	d0068693          	addi	a3,a3,-768 # 80414974 <CSWTCH.69+0x96c>
8040cc7c:	00006617          	auipc	a2,0x6
8040cc80:	f6c60613          	addi	a2,a2,-148 # 80412be8 <commands+0x1bc>
8040cc84:	06b00593          	li	a1,107
8040cc88:	00008517          	auipc	a0,0x8
8040cc8c:	dc450513          	addi	a0,a0,-572 # 80414a4c <CSWTCH.69+0xa44>
8040cc90:	995f30ef          	jal	ra,80400624 <__panic>
8040cc94:	00008697          	auipc	a3,0x8
8040cc98:	d0c68693          	addi	a3,a3,-756 # 804149a0 <CSWTCH.69+0x998>
8040cc9c:	00006617          	auipc	a2,0x6
8040cca0:	f4c60613          	addi	a2,a2,-180 # 80412be8 <commands+0x1bc>
8040cca4:	06c00593          	li	a1,108
8040cca8:	00008517          	auipc	a0,0x8
8040ccac:	da450513          	addi	a0,a0,-604 # 80414a4c <CSWTCH.69+0xa44>
8040ccb0:	975f30ef          	jal	ra,80400624 <__panic>

8040ccb4 <del_timer>:
8040ccb4:	fe010113          	addi	sp,sp,-32
8040ccb8:	00112e23          	sw	ra,28(sp)
8040ccbc:	00812c23          	sw	s0,24(sp)
8040ccc0:	100027f3          	csrr	a5,sstatus
8040ccc4:	0027f793          	andi	a5,a5,2
8040ccc8:	00850413          	addi	s0,a0,8
8040cccc:	06079c63          	bnez	a5,8040cd44 <del_timer+0x90>
8040ccd0:	00c52783          	lw	a5,12(a0)
8040ccd4:	06f40063          	beq	s0,a5,8040cd34 <del_timer+0x80>
8040ccd8:	00052683          	lw	a3,0(a0)
8040ccdc:	00852703          	lw	a4,8(a0)
8040cce0:	04068263          	beqz	a3,8040cd24 <del_timer+0x70>
8040cce4:	00090617          	auipc	a2,0x90
8040cce8:	ae060613          	addi	a2,a2,-1312 # 8049c7c4 <timer_list>
8040ccec:	00000593          	li	a1,0
8040ccf0:	02c78a63          	beq	a5,a2,8040cd24 <del_timer+0x70>
8040ccf4:	ff87a603          	lw	a2,-8(a5)
8040ccf8:	00d606b3          	add	a3,a2,a3
8040ccfc:	fed7ac23          	sw	a3,-8(a5)
8040cd00:	00f72223          	sw	a5,4(a4)
8040cd04:	00e7a023          	sw	a4,0(a5)
8040cd08:	00852623          	sw	s0,12(a0)
8040cd0c:	00852423          	sw	s0,8(a0)
8040cd10:	02058263          	beqz	a1,8040cd34 <del_timer+0x80>
8040cd14:	01812403          	lw	s0,24(sp)
8040cd18:	01c12083          	lw	ra,28(sp)
8040cd1c:	02010113          	addi	sp,sp,32
8040cd20:	ef5f306f          	j	80400c14 <intr_enable>
8040cd24:	00f72223          	sw	a5,4(a4)
8040cd28:	00e7a023          	sw	a4,0(a5)
8040cd2c:	00852623          	sw	s0,12(a0)
8040cd30:	00852423          	sw	s0,8(a0)
8040cd34:	01c12083          	lw	ra,28(sp)
8040cd38:	01812403          	lw	s0,24(sp)
8040cd3c:	02010113          	addi	sp,sp,32
8040cd40:	00008067          	ret
8040cd44:	00a12623          	sw	a0,12(sp)
8040cd48:	ed5f30ef          	jal	ra,80400c1c <intr_disable>
8040cd4c:	00c12503          	lw	a0,12(sp)
8040cd50:	00c52783          	lw	a5,12(a0)
8040cd54:	fc8780e3          	beq	a5,s0,8040cd14 <del_timer+0x60>
8040cd58:	00052683          	lw	a3,0(a0)
8040cd5c:	00852703          	lw	a4,8(a0)
8040cd60:	00068a63          	beqz	a3,8040cd74 <del_timer+0xc0>
8040cd64:	00090617          	auipc	a2,0x90
8040cd68:	a6060613          	addi	a2,a2,-1440 # 8049c7c4 <timer_list>
8040cd6c:	00100593          	li	a1,1
8040cd70:	f8c792e3          	bne	a5,a2,8040ccf4 <del_timer+0x40>
8040cd74:	00f72223          	sw	a5,4(a4)
8040cd78:	00e7a023          	sw	a4,0(a5)
8040cd7c:	00852623          	sw	s0,12(a0)
8040cd80:	00852423          	sw	s0,8(a0)
8040cd84:	f91ff06f          	j	8040cd14 <del_timer+0x60>

8040cd88 <run_timer_list>:
8040cd88:	fe010113          	addi	sp,sp,-32
8040cd8c:	00112e23          	sw	ra,28(sp)
8040cd90:	00812c23          	sw	s0,24(sp)
8040cd94:	00912a23          	sw	s1,20(sp)
8040cd98:	01212823          	sw	s2,16(sp)
8040cd9c:	01312623          	sw	s3,12(sp)
8040cda0:	01412423          	sw	s4,8(sp)
8040cda4:	01512223          	sw	s5,4(sp)
8040cda8:	01612023          	sw	s6,0(sp)
8040cdac:	100027f3          	csrr	a5,sstatus
8040cdb0:	0027f793          	andi	a5,a5,2
8040cdb4:	00000b13          	li	s6,0
8040cdb8:	12079c63          	bnez	a5,8040cef0 <run_timer_list+0x168>
8040cdbc:	00090997          	auipc	s3,0x90
8040cdc0:	a0898993          	addi	s3,s3,-1528 # 8049c7c4 <timer_list>
8040cdc4:	0049a403          	lw	s0,4(s3)
8040cdc8:	09340663          	beq	s0,s3,8040ce54 <run_timer_list+0xcc>
8040cdcc:	ff842783          	lw	a5,-8(s0)
8040cdd0:	ff840913          	addi	s2,s0,-8
8040cdd4:	14078463          	beqz	a5,8040cf1c <run_timer_list+0x194>
8040cdd8:	fff78793          	addi	a5,a5,-1
8040cddc:	fef42c23          	sw	a5,-8(s0)
8040cde0:	06079a63          	bnez	a5,8040ce54 <run_timer_list+0xcc>
8040cde4:	00008a97          	auipc	s5,0x8
8040cde8:	c18a8a93          	addi	s5,s5,-1000 # 804149fc <CSWTCH.69+0x9f4>
8040cdec:	00008a17          	auipc	s4,0x8
8040cdf0:	c60a0a13          	addi	s4,s4,-928 # 80414a4c <CSWTCH.69+0xa44>
8040cdf4:	0280006f          	j	8040ce1c <run_timer_list+0x94>
8040cdf8:	1007d263          	bgez	a5,8040cefc <run_timer_list+0x174>
8040cdfc:	00048513          	mv	a0,s1
8040ce00:	b7dff0ef          	jal	ra,8040c97c <wakeup_proc>
8040ce04:	00090513          	mv	a0,s2
8040ce08:	eadff0ef          	jal	ra,8040ccb4 <del_timer>
8040ce0c:	05340463          	beq	s0,s3,8040ce54 <run_timer_list+0xcc>
8040ce10:	ff842783          	lw	a5,-8(s0)
8040ce14:	ff840913          	addi	s2,s0,-8
8040ce18:	02079e63          	bnez	a5,8040ce54 <run_timer_list+0xcc>
8040ce1c:	00492483          	lw	s1,4(s2)
8040ce20:	00442403          	lw	s0,4(s0)
8040ce24:	0a84a783          	lw	a5,168(s1)
8040ce28:	fc0798e3          	bnez	a5,8040cdf8 <run_timer_list+0x70>
8040ce2c:	0044a683          	lw	a3,4(s1)
8040ce30:	000a8613          	mv	a2,s5
8040ce34:	0a200593          	li	a1,162
8040ce38:	000a0513          	mv	a0,s4
8040ce3c:	86df30ef          	jal	ra,804006a8 <__warn>
8040ce40:	00048513          	mv	a0,s1
8040ce44:	b39ff0ef          	jal	ra,8040c97c <wakeup_proc>
8040ce48:	00090513          	mv	a0,s2
8040ce4c:	e69ff0ef          	jal	ra,8040ccb4 <del_timer>
8040ce50:	fd3410e3          	bne	s0,s3,8040ce10 <run_timer_list+0x88>
8040ce54:	00090797          	auipc	a5,0x90
8040ce58:	95878793          	addi	a5,a5,-1704 # 8049c7ac <current>
8040ce5c:	0007a583          	lw	a1,0(a5)
8040ce60:	00090797          	auipc	a5,0x90
8040ce64:	95078793          	addi	a5,a5,-1712 # 8049c7b0 <idleproc>
8040ce68:	0007a783          	lw	a5,0(a5)
8040ce6c:	06f58c63          	beq	a1,a5,8040cee4 <run_timer_list+0x15c>
8040ce70:	00090797          	auipc	a5,0x90
8040ce74:	95078793          	addi	a5,a5,-1712 # 8049c7c0 <sched_class>
8040ce78:	0007a783          	lw	a5,0(a5)
8040ce7c:	00090717          	auipc	a4,0x90
8040ce80:	94070713          	addi	a4,a4,-1728 # 8049c7bc <rq>
8040ce84:	00072503          	lw	a0,0(a4)
8040ce88:	0147a783          	lw	a5,20(a5)
8040ce8c:	000780e7          	jalr	a5
8040ce90:	020b1663          	bnez	s6,8040cebc <run_timer_list+0x134>
8040ce94:	01c12083          	lw	ra,28(sp)
8040ce98:	01812403          	lw	s0,24(sp)
8040ce9c:	01412483          	lw	s1,20(sp)
8040cea0:	01012903          	lw	s2,16(sp)
8040cea4:	00c12983          	lw	s3,12(sp)
8040cea8:	00812a03          	lw	s4,8(sp)
8040ceac:	00412a83          	lw	s5,4(sp)
8040ceb0:	00012b03          	lw	s6,0(sp)
8040ceb4:	02010113          	addi	sp,sp,32
8040ceb8:	00008067          	ret
8040cebc:	01812403          	lw	s0,24(sp)
8040cec0:	01c12083          	lw	ra,28(sp)
8040cec4:	01412483          	lw	s1,20(sp)
8040cec8:	01012903          	lw	s2,16(sp)
8040cecc:	00c12983          	lw	s3,12(sp)
8040ced0:	00812a03          	lw	s4,8(sp)
8040ced4:	00412a83          	lw	s5,4(sp)
8040ced8:	00012b03          	lw	s6,0(sp)
8040cedc:	02010113          	addi	sp,sp,32
8040cee0:	d35f306f          	j	80400c14 <intr_enable>
8040cee4:	00100793          	li	a5,1
8040cee8:	00f5a823          	sw	a5,16(a1)
8040ceec:	fa5ff06f          	j	8040ce90 <run_timer_list+0x108>
8040cef0:	d2df30ef          	jal	ra,80400c1c <intr_disable>
8040cef4:	00100b13          	li	s6,1
8040cef8:	ec5ff06f          	j	8040cdbc <run_timer_list+0x34>
8040cefc:	00008697          	auipc	a3,0x8
8040cf00:	adc68693          	addi	a3,a3,-1316 # 804149d8 <CSWTCH.69+0x9d0>
8040cf04:	00006617          	auipc	a2,0x6
8040cf08:	ce460613          	addi	a2,a2,-796 # 80412be8 <commands+0x1bc>
8040cf0c:	09f00593          	li	a1,159
8040cf10:	00008517          	auipc	a0,0x8
8040cf14:	b3c50513          	addi	a0,a0,-1220 # 80414a4c <CSWTCH.69+0xa44>
8040cf18:	f0cf30ef          	jal	ra,80400624 <__panic>
8040cf1c:	00008697          	auipc	a3,0x8
8040cf20:	aa868693          	addi	a3,a3,-1368 # 804149c4 <CSWTCH.69+0x9bc>
8040cf24:	00006617          	auipc	a2,0x6
8040cf28:	cc460613          	addi	a2,a2,-828 # 80412be8 <commands+0x1bc>
8040cf2c:	09900593          	li	a1,153
8040cf30:	00008517          	auipc	a0,0x8
8040cf34:	b1c50513          	addi	a0,a0,-1252 # 80414a4c <CSWTCH.69+0xa44>
8040cf38:	eecf30ef          	jal	ra,80400624 <__panic>

8040cf3c <sys_getpid>:
8040cf3c:	00090797          	auipc	a5,0x90
8040cf40:	87078793          	addi	a5,a5,-1936 # 8049c7ac <current>
8040cf44:	0007a783          	lw	a5,0(a5)
8040cf48:	0047a503          	lw	a0,4(a5)
8040cf4c:	00008067          	ret

8040cf50 <sys_gettime>:
8040cf50:	00090797          	auipc	a5,0x90
8040cf54:	89c78793          	addi	a5,a5,-1892 # 8049c7ec <ticks>
8040cf58:	0007a503          	lw	a0,0(a5)
8040cf5c:	00008067          	ret

8040cf60 <sys_lab6_set_priority>:
8040cf60:	00052503          	lw	a0,0(a0)
8040cf64:	ff010113          	addi	sp,sp,-16
8040cf68:	00112623          	sw	ra,12(sp)
8040cf6c:	db5fb0ef          	jal	ra,80408d20 <lab6_set_priority>
8040cf70:	00c12083          	lw	ra,12(sp)
8040cf74:	00000513          	li	a0,0
8040cf78:	01010113          	addi	sp,sp,16
8040cf7c:	00008067          	ret

8040cf80 <sys_dup>:
8040cf80:	00452583          	lw	a1,4(a0)
8040cf84:	00052503          	lw	a0,0(a0)
8040cf88:	f41f906f          	j	80406ec8 <sysfile_dup>

8040cf8c <sys_getdirentry>:
8040cf8c:	00452583          	lw	a1,4(a0)
8040cf90:	00052503          	lw	a0,0(a0)
8040cf94:	db9f906f          	j	80406d4c <sysfile_getdirentry>

8040cf98 <sys_getcwd>:
8040cf98:	00452583          	lw	a1,4(a0)
8040cf9c:	00052503          	lw	a0,0(a0)
8040cfa0:	ca9f906f          	j	80406c48 <sysfile_getcwd>

8040cfa4 <sys_fsync>:
8040cfa4:	00052503          	lw	a0,0(a0)
8040cfa8:	c9df906f          	j	80406c44 <sysfile_fsync>

8040cfac <sys_fstat>:
8040cfac:	00452583          	lw	a1,4(a0)
8040cfb0:	00052503          	lw	a0,0(a0)
8040cfb4:	ba1f906f          	j	80406b54 <sysfile_fstat>

8040cfb8 <sys_seek>:
8040cfb8:	00852603          	lw	a2,8(a0)
8040cfbc:	00452583          	lw	a1,4(a0)
8040cfc0:	00052503          	lw	a0,0(a0)
8040cfc4:	b8df906f          	j	80406b50 <sysfile_seek>

8040cfc8 <sys_write>:
8040cfc8:	00852603          	lw	a2,8(a0)
8040cfcc:	00452583          	lw	a1,4(a0)
8040cfd0:	00052503          	lw	a0,0(a0)
8040cfd4:	9b9f906f          	j	8040698c <sysfile_write>

8040cfd8 <sys_read>:
8040cfd8:	00852603          	lw	a2,8(a0)
8040cfdc:	00452583          	lw	a1,4(a0)
8040cfe0:	00052503          	lw	a0,0(a0)
8040cfe4:	fe0f906f          	j	804067c4 <sysfile_read>

8040cfe8 <sys_close>:
8040cfe8:	00052503          	lw	a0,0(a0)
8040cfec:	fd4f906f          	j	804067c0 <sysfile_close>

8040cff0 <sys_open>:
8040cff0:	00452583          	lw	a1,4(a0)
8040cff4:	00052503          	lw	a0,0(a0)
8040cff8:	f70f906f          	j	80406768 <sysfile_open>

8040cffc <sys_pgdir>:
8040cffc:	ff010113          	addi	sp,sp,-16
8040d000:	00112623          	sw	ra,12(sp)
8040d004:	fd8f60ef          	jal	ra,804037dc <print_pgdir>
8040d008:	00c12083          	lw	ra,12(sp)
8040d00c:	00000513          	li	a0,0
8040d010:	01010113          	addi	sp,sp,16
8040d014:	00008067          	ret

8040d018 <sys_putc>:
8040d018:	00052503          	lw	a0,0(a0)
8040d01c:	ff010113          	addi	sp,sp,-16
8040d020:	00112623          	sw	ra,12(sp)
8040d024:	a38f30ef          	jal	ra,8040025c <cputchar>
8040d028:	00c12083          	lw	ra,12(sp)
8040d02c:	00000513          	li	a0,0
8040d030:	01010113          	addi	sp,sp,16
8040d034:	00008067          	ret

8040d038 <sys_kill>:
8040d038:	00052503          	lw	a0,0(a0)
8040d03c:	a69fb06f          	j	80408aa4 <do_kill>

8040d040 <sys_sleep>:
8040d040:	00052503          	lw	a0,0(a0)
8040d044:	d01fb06f          	j	80408d44 <do_sleep>

8040d048 <sys_yield>:
8040d048:	9d1fb06f          	j	80408a18 <do_yield>

8040d04c <sys_exec>:
8040d04c:	00852603          	lw	a2,8(a0)
8040d050:	00452583          	lw	a1,4(a0)
8040d054:	00052503          	lw	a0,0(a0)
8040d058:	f61fa06f          	j	80407fb8 <do_execve>

8040d05c <sys_wait>:
8040d05c:	00452583          	lw	a1,4(a0)
8040d060:	00052503          	lw	a0,0(a0)
8040d064:	9d1fb06f          	j	80408a34 <do_wait>

8040d068 <sys_fork>:
8040d068:	0008f797          	auipc	a5,0x8f
8040d06c:	74478793          	addi	a5,a5,1860 # 8049c7ac <current>
8040d070:	0007a783          	lw	a5,0(a5)
8040d074:	00000513          	li	a0,0
8040d078:	0547a603          	lw	a2,84(a5)
8040d07c:	00862583          	lw	a1,8(a2)
8040d080:	b14fa06f          	j	80407394 <do_fork>

8040d084 <sys_exit>:
8040d084:	00052503          	lw	a0,0(a0)
8040d088:	915fa06f          	j	8040799c <do_exit>

8040d08c <syscall>:
8040d08c:	fd010113          	addi	sp,sp,-48
8040d090:	02912223          	sw	s1,36(sp)
8040d094:	0008f497          	auipc	s1,0x8f
8040d098:	71848493          	addi	s1,s1,1816 # 8049c7ac <current>
8040d09c:	0004a703          	lw	a4,0(s1)
8040d0a0:	02812423          	sw	s0,40(sp)
8040d0a4:	03212023          	sw	s2,32(sp)
8040d0a8:	05472403          	lw	s0,84(a4)
8040d0ac:	02112623          	sw	ra,44(sp)
8040d0b0:	0ff00793          	li	a5,255
8040d0b4:	02842903          	lw	s2,40(s0)
8040d0b8:	0727e463          	bltu	a5,s2,8040d120 <syscall+0x94>
8040d0bc:	00291713          	slli	a4,s2,0x2
8040d0c0:	00008797          	auipc	a5,0x8
8040d0c4:	a0478793          	addi	a5,a5,-1532 # 80414ac4 <syscalls>
8040d0c8:	00e787b3          	add	a5,a5,a4
8040d0cc:	0007a783          	lw	a5,0(a5)
8040d0d0:	04078863          	beqz	a5,8040d120 <syscall+0x94>
8040d0d4:	02c42503          	lw	a0,44(s0)
8040d0d8:	03042583          	lw	a1,48(s0)
8040d0dc:	03442603          	lw	a2,52(s0)
8040d0e0:	03842683          	lw	a3,56(s0)
8040d0e4:	03c42703          	lw	a4,60(s0)
8040d0e8:	00a12623          	sw	a0,12(sp)
8040d0ec:	00b12823          	sw	a1,16(sp)
8040d0f0:	00c12a23          	sw	a2,20(sp)
8040d0f4:	00d12c23          	sw	a3,24(sp)
8040d0f8:	00e12e23          	sw	a4,28(sp)
8040d0fc:	00c10513          	addi	a0,sp,12
8040d100:	000780e7          	jalr	a5
8040d104:	02a42423          	sw	a0,40(s0)
8040d108:	02c12083          	lw	ra,44(sp)
8040d10c:	02812403          	lw	s0,40(sp)
8040d110:	02412483          	lw	s1,36(sp)
8040d114:	02012903          	lw	s2,32(sp)
8040d118:	03010113          	addi	sp,sp,48
8040d11c:	00008067          	ret
8040d120:	00040513          	mv	a0,s0
8040d124:	f25f30ef          	jal	ra,80401048 <print_trapframe>
8040d128:	0004a783          	lw	a5,0(s1)
8040d12c:	00090693          	mv	a3,s2
8040d130:	00008617          	auipc	a2,0x8
8040d134:	95060613          	addi	a2,a2,-1712 # 80414a80 <CSWTCH.69+0xa78>
8040d138:	0047a703          	lw	a4,4(a5)
8040d13c:	0cd00593          	li	a1,205
8040d140:	06078793          	addi	a5,a5,96
8040d144:	00008517          	auipc	a0,0x8
8040d148:	96850513          	addi	a0,a0,-1688 # 80414aac <CSWTCH.69+0xaa4>
8040d14c:	cd8f30ef          	jal	ra,80400624 <__panic>

8040d150 <swapfs_init>:
8040d150:	ff010113          	addi	sp,sp,-16
8040d154:	00100513          	li	a0,1
8040d158:	00112623          	sw	ra,12(sp)
8040d15c:	91df30ef          	jal	ra,80400a78 <ide_device_valid>
8040d160:	02050263          	beqz	a0,8040d184 <swapfs_init+0x34>
8040d164:	00100513          	li	a0,1
8040d168:	945f30ef          	jal	ra,80400aac <ide_device_size>
8040d16c:	00c12083          	lw	ra,12(sp)
8040d170:	00355513          	srli	a0,a0,0x3
8040d174:	0008f797          	auipc	a5,0x8f
8040d178:	70a7a623          	sw	a0,1804(a5) # 8049c880 <max_swap_offset>
8040d17c:	01010113          	addi	sp,sp,16
8040d180:	00008067          	ret
8040d184:	00008617          	auipc	a2,0x8
8040d188:	d4060613          	addi	a2,a2,-704 # 80414ec4 <syscalls+0x400>
8040d18c:	00d00593          	li	a1,13
8040d190:	00008517          	auipc	a0,0x8
8040d194:	d5050513          	addi	a0,a0,-688 # 80414ee0 <syscalls+0x41c>
8040d198:	c8cf30ef          	jal	ra,80400624 <__panic>

8040d19c <swapfs_read>:
8040d19c:	ff010113          	addi	sp,sp,-16
8040d1a0:	00112623          	sw	ra,12(sp)
8040d1a4:	00855793          	srli	a5,a0,0x8
8040d1a8:	06078e63          	beqz	a5,8040d224 <swapfs_read+0x88>
8040d1ac:	0008f717          	auipc	a4,0x8f
8040d1b0:	6d470713          	addi	a4,a4,1748 # 8049c880 <max_swap_offset>
8040d1b4:	00072703          	lw	a4,0(a4)
8040d1b8:	06e7f663          	bgeu	a5,a4,8040d224 <swapfs_read+0x88>
8040d1bc:	0008f717          	auipc	a4,0x8f
8040d1c0:	64c70713          	addi	a4,a4,1612 # 8049c808 <pages>
8040d1c4:	00072603          	lw	a2,0(a4)
8040d1c8:	00009717          	auipc	a4,0x9
8040d1cc:	fb870713          	addi	a4,a4,-72 # 80416180 <nbase>
8040d1d0:	40c58633          	sub	a2,a1,a2
8040d1d4:	00072583          	lw	a1,0(a4)
8040d1d8:	40565613          	srai	a2,a2,0x5
8040d1dc:	0008f717          	auipc	a4,0x8f
8040d1e0:	5bc70713          	addi	a4,a4,1468 # 8049c798 <npage>
8040d1e4:	00b60633          	add	a2,a2,a1
8040d1e8:	00072683          	lw	a3,0(a4)
8040d1ec:	00c61713          	slli	a4,a2,0xc
8040d1f0:	00c75713          	srli	a4,a4,0xc
8040d1f4:	00379593          	slli	a1,a5,0x3
8040d1f8:	00c61613          	slli	a2,a2,0xc
8040d1fc:	04d77263          	bgeu	a4,a3,8040d240 <swapfs_read+0xa4>
8040d200:	0008f797          	auipc	a5,0x8f
8040d204:	60078793          	addi	a5,a5,1536 # 8049c800 <va_pa_offset>
8040d208:	0007a783          	lw	a5,0(a5)
8040d20c:	00c12083          	lw	ra,12(sp)
8040d210:	00800693          	li	a3,8
8040d214:	00f60633          	add	a2,a2,a5
8040d218:	00100513          	li	a0,1
8040d21c:	01010113          	addi	sp,sp,16
8040d220:	8c5f306f          	j	80400ae4 <ide_read_secs>
8040d224:	00050693          	mv	a3,a0
8040d228:	00008617          	auipc	a2,0x8
8040d22c:	cd060613          	addi	a2,a2,-816 # 80414ef8 <syscalls+0x434>
8040d230:	01400593          	li	a1,20
8040d234:	00008517          	auipc	a0,0x8
8040d238:	cac50513          	addi	a0,a0,-852 # 80414ee0 <syscalls+0x41c>
8040d23c:	be8f30ef          	jal	ra,80400624 <__panic>
8040d240:	00060693          	mv	a3,a2
8040d244:	06e00593          	li	a1,110
8040d248:	00006617          	auipc	a2,0x6
8040d24c:	50c60613          	addi	a2,a2,1292 # 80413754 <default_pmm_manager+0x30>
8040d250:	00006517          	auipc	a0,0x6
8040d254:	52850513          	addi	a0,a0,1320 # 80413778 <default_pmm_manager+0x54>
8040d258:	bccf30ef          	jal	ra,80400624 <__panic>

8040d25c <swapfs_write>:
8040d25c:	ff010113          	addi	sp,sp,-16
8040d260:	00112623          	sw	ra,12(sp)
8040d264:	00855793          	srli	a5,a0,0x8
8040d268:	06078e63          	beqz	a5,8040d2e4 <swapfs_write+0x88>
8040d26c:	0008f717          	auipc	a4,0x8f
8040d270:	61470713          	addi	a4,a4,1556 # 8049c880 <max_swap_offset>
8040d274:	00072703          	lw	a4,0(a4)
8040d278:	06e7f663          	bgeu	a5,a4,8040d2e4 <swapfs_write+0x88>
8040d27c:	0008f717          	auipc	a4,0x8f
8040d280:	58c70713          	addi	a4,a4,1420 # 8049c808 <pages>
8040d284:	00072603          	lw	a2,0(a4)
8040d288:	00009717          	auipc	a4,0x9
8040d28c:	ef870713          	addi	a4,a4,-264 # 80416180 <nbase>
8040d290:	40c58633          	sub	a2,a1,a2
8040d294:	00072583          	lw	a1,0(a4)
8040d298:	40565613          	srai	a2,a2,0x5
8040d29c:	0008f717          	auipc	a4,0x8f
8040d2a0:	4fc70713          	addi	a4,a4,1276 # 8049c798 <npage>
8040d2a4:	00b60633          	add	a2,a2,a1
8040d2a8:	00072683          	lw	a3,0(a4)
8040d2ac:	00c61713          	slli	a4,a2,0xc
8040d2b0:	00c75713          	srli	a4,a4,0xc
8040d2b4:	00379593          	slli	a1,a5,0x3
8040d2b8:	00c61613          	slli	a2,a2,0xc
8040d2bc:	04d77263          	bgeu	a4,a3,8040d300 <swapfs_write+0xa4>
8040d2c0:	0008f797          	auipc	a5,0x8f
8040d2c4:	54078793          	addi	a5,a5,1344 # 8049c800 <va_pa_offset>
8040d2c8:	0007a783          	lw	a5,0(a5)
8040d2cc:	00c12083          	lw	ra,12(sp)
8040d2d0:	00800693          	li	a3,8
8040d2d4:	00f60633          	add	a2,a2,a5
8040d2d8:	00100513          	li	a0,1
8040d2dc:	01010113          	addi	sp,sp,16
8040d2e0:	89df306f          	j	80400b7c <ide_write_secs>
8040d2e4:	00050693          	mv	a3,a0
8040d2e8:	00008617          	auipc	a2,0x8
8040d2ec:	c1060613          	addi	a2,a2,-1008 # 80414ef8 <syscalls+0x434>
8040d2f0:	01900593          	li	a1,25
8040d2f4:	00008517          	auipc	a0,0x8
8040d2f8:	bec50513          	addi	a0,a0,-1044 # 80414ee0 <syscalls+0x41c>
8040d2fc:	b28f30ef          	jal	ra,80400624 <__panic>
8040d300:	00060693          	mv	a3,a2
8040d304:	06e00593          	li	a1,110
8040d308:	00006617          	auipc	a2,0x6
8040d30c:	44c60613          	addi	a2,a2,1100 # 80413754 <default_pmm_manager+0x30>
8040d310:	00006517          	auipc	a0,0x6
8040d314:	46850513          	addi	a0,a0,1128 # 80413778 <default_pmm_manager+0x54>
8040d318:	b0cf30ef          	jal	ra,80400624 <__panic>

8040d31c <__alloc_inode>:
8040d31c:	ff010113          	addi	sp,sp,-16
8040d320:	00812423          	sw	s0,8(sp)
8040d324:	00050413          	mv	s0,a0
8040d328:	04000513          	li	a0,64
8040d32c:	00112623          	sw	ra,12(sp)
8040d330:	e90f50ef          	jal	ra,804029c0 <kmalloc>
8040d334:	00050463          	beqz	a0,8040d33c <__alloc_inode+0x20>
8040d338:	02852623          	sw	s0,44(a0)
8040d33c:	00c12083          	lw	ra,12(sp)
8040d340:	00812403          	lw	s0,8(sp)
8040d344:	01010113          	addi	sp,sp,16
8040d348:	00008067          	ret

8040d34c <inode_init>:
8040d34c:	00100793          	li	a5,1
8040d350:	02052a23          	sw	zero,52(a0)
8040d354:	02b52e23          	sw	a1,60(a0)
8040d358:	02c52c23          	sw	a2,56(a0)
8040d35c:	02f52823          	sw	a5,48(a0)
8040d360:	00008067          	ret

8040d364 <inode_kill>:
8040d364:	03052703          	lw	a4,48(a0)
8040d368:	ff010113          	addi	sp,sp,-16
8040d36c:	00112623          	sw	ra,12(sp)
8040d370:	00071c63          	bnez	a4,8040d388 <inode_kill+0x24>
8040d374:	03452783          	lw	a5,52(a0)
8040d378:	02079863          	bnez	a5,8040d3a8 <inode_kill+0x44>
8040d37c:	00c12083          	lw	ra,12(sp)
8040d380:	01010113          	addi	sp,sp,16
8040d384:	f60f506f          	j	80402ae4 <kfree>
8040d388:	00008697          	auipc	a3,0x8
8040d38c:	c4868693          	addi	a3,a3,-952 # 80414fd0 <syscalls+0x50c>
8040d390:	00006617          	auipc	a2,0x6
8040d394:	85860613          	addi	a2,a2,-1960 # 80412be8 <commands+0x1bc>
8040d398:	02900593          	li	a1,41
8040d39c:	00008517          	auipc	a0,0x8
8040d3a0:	c5050513          	addi	a0,a0,-944 # 80414fec <syscalls+0x528>
8040d3a4:	a80f30ef          	jal	ra,80400624 <__panic>
8040d3a8:	00008697          	auipc	a3,0x8
8040d3ac:	c5868693          	addi	a3,a3,-936 # 80415000 <syscalls+0x53c>
8040d3b0:	00006617          	auipc	a2,0x6
8040d3b4:	83860613          	addi	a2,a2,-1992 # 80412be8 <commands+0x1bc>
8040d3b8:	02a00593          	li	a1,42
8040d3bc:	00008517          	auipc	a0,0x8
8040d3c0:	c3050513          	addi	a0,a0,-976 # 80414fec <syscalls+0x528>
8040d3c4:	a60f30ef          	jal	ra,80400624 <__panic>

8040d3c8 <inode_ref_inc>:
8040d3c8:	03052783          	lw	a5,48(a0)
8040d3cc:	00178793          	addi	a5,a5,1
8040d3d0:	02f52823          	sw	a5,48(a0)
8040d3d4:	00078513          	mv	a0,a5
8040d3d8:	00008067          	ret

8040d3dc <inode_open_inc>:
8040d3dc:	03452783          	lw	a5,52(a0)
8040d3e0:	00178793          	addi	a5,a5,1
8040d3e4:	02f52a23          	sw	a5,52(a0)
8040d3e8:	00078513          	mv	a0,a5
8040d3ec:	00008067          	ret

8040d3f0 <inode_check>:
8040d3f0:	ff010113          	addi	sp,sp,-16
8040d3f4:	00112623          	sw	ra,12(sp)
8040d3f8:	04050263          	beqz	a0,8040d43c <inode_check+0x4c>
8040d3fc:	03c52783          	lw	a5,60(a0)
8040d400:	02078e63          	beqz	a5,8040d43c <inode_check+0x4c>
8040d404:	0007a703          	lw	a4,0(a5)
8040d408:	8c4ba7b7          	lui	a5,0x8c4ba
8040d40c:	47678793          	addi	a5,a5,1142 # 8c4ba476 <end+0xc01dbba>
8040d410:	08f71663          	bne	a4,a5,8040d49c <inode_check+0xac>
8040d414:	03052703          	lw	a4,48(a0)
8040d418:	03452783          	lw	a5,52(a0)
8040d41c:	06f74063          	blt	a4,a5,8040d47c <inode_check+0x8c>
8040d420:	0407ce63          	bltz	a5,8040d47c <inode_check+0x8c>
8040d424:	000106b7          	lui	a3,0x10
8040d428:	02d75a63          	bge	a4,a3,8040d45c <inode_check+0x6c>
8040d42c:	02d7d863          	bge	a5,a3,8040d45c <inode_check+0x6c>
8040d430:	00c12083          	lw	ra,12(sp)
8040d434:	01010113          	addi	sp,sp,16
8040d438:	00008067          	ret
8040d43c:	00008697          	auipc	a3,0x8
8040d440:	adc68693          	addi	a3,a3,-1316 # 80414f18 <syscalls+0x454>
8040d444:	00005617          	auipc	a2,0x5
8040d448:	7a460613          	addi	a2,a2,1956 # 80412be8 <commands+0x1bc>
8040d44c:	06e00593          	li	a1,110
8040d450:	00008517          	auipc	a0,0x8
8040d454:	b9c50513          	addi	a0,a0,-1124 # 80414fec <syscalls+0x528>
8040d458:	9ccf30ef          	jal	ra,80400624 <__panic>
8040d45c:	00008697          	auipc	a3,0x8
8040d460:	b3868693          	addi	a3,a3,-1224 # 80414f94 <syscalls+0x4d0>
8040d464:	00005617          	auipc	a2,0x5
8040d468:	78460613          	addi	a2,a2,1924 # 80412be8 <commands+0x1bc>
8040d46c:	07200593          	li	a1,114
8040d470:	00008517          	auipc	a0,0x8
8040d474:	b7c50513          	addi	a0,a0,-1156 # 80414fec <syscalls+0x528>
8040d478:	9acf30ef          	jal	ra,80400624 <__panic>
8040d47c:	00008697          	auipc	a3,0x8
8040d480:	aec68693          	addi	a3,a3,-1300 # 80414f68 <syscalls+0x4a4>
8040d484:	00005617          	auipc	a2,0x5
8040d488:	76460613          	addi	a2,a2,1892 # 80412be8 <commands+0x1bc>
8040d48c:	07100593          	li	a1,113
8040d490:	00008517          	auipc	a0,0x8
8040d494:	b5c50513          	addi	a0,a0,-1188 # 80414fec <syscalls+0x528>
8040d498:	98cf30ef          	jal	ra,80400624 <__panic>
8040d49c:	00008697          	auipc	a3,0x8
8040d4a0:	aa468693          	addi	a3,a3,-1372 # 80414f40 <syscalls+0x47c>
8040d4a4:	00005617          	auipc	a2,0x5
8040d4a8:	74460613          	addi	a2,a2,1860 # 80412be8 <commands+0x1bc>
8040d4ac:	06f00593          	li	a1,111
8040d4b0:	00008517          	auipc	a0,0x8
8040d4b4:	b3c50513          	addi	a0,a0,-1220 # 80414fec <syscalls+0x528>
8040d4b8:	96cf30ef          	jal	ra,80400624 <__panic>

8040d4bc <inode_ref_dec>:
8040d4bc:	ff010113          	addi	sp,sp,-16
8040d4c0:	00812423          	sw	s0,8(sp)
8040d4c4:	03052403          	lw	s0,48(a0)
8040d4c8:	00112623          	sw	ra,12(sp)
8040d4cc:	00912223          	sw	s1,4(sp)
8040d4d0:	01212023          	sw	s2,0(sp)
8040d4d4:	0a805663          	blez	s0,8040d580 <inode_ref_dec+0xc4>
8040d4d8:	fff40413          	addi	s0,s0,-1
8040d4dc:	02852823          	sw	s0,48(a0)
8040d4e0:	00050493          	mv	s1,a0
8040d4e4:	02041a63          	bnez	s0,8040d518 <inode_ref_dec+0x5c>
8040d4e8:	03c52783          	lw	a5,60(a0)
8040d4ec:	06078a63          	beqz	a5,8040d560 <inode_ref_dec+0xa4>
8040d4f0:	0247a903          	lw	s2,36(a5)
8040d4f4:	06090663          	beqz	s2,8040d560 <inode_ref_dec+0xa4>
8040d4f8:	00008597          	auipc	a1,0x8
8040d4fc:	c2458593          	addi	a1,a1,-988 # 8041511c <syscalls+0x658>
8040d500:	ef1ff0ef          	jal	ra,8040d3f0 <inode_check>
8040d504:	00048513          	mv	a0,s1
8040d508:	000900e7          	jalr	s2
8040d50c:	00050663          	beqz	a0,8040d518 <inode_ref_dec+0x5c>
8040d510:	ff100793          	li	a5,-15
8040d514:	02f51063          	bne	a0,a5,8040d534 <inode_ref_dec+0x78>
8040d518:	00040513          	mv	a0,s0
8040d51c:	00c12083          	lw	ra,12(sp)
8040d520:	00812403          	lw	s0,8(sp)
8040d524:	00412483          	lw	s1,4(sp)
8040d528:	00012903          	lw	s2,0(sp)
8040d52c:	01010113          	addi	sp,sp,16
8040d530:	00008067          	ret
8040d534:	00050593          	mv	a1,a0
8040d538:	00008517          	auipc	a0,0x8
8040d53c:	bec50513          	addi	a0,a0,-1044 # 80415124 <syscalls+0x660>
8040d540:	cbdf20ef          	jal	ra,804001fc <cprintf>
8040d544:	00040513          	mv	a0,s0
8040d548:	00c12083          	lw	ra,12(sp)
8040d54c:	00812403          	lw	s0,8(sp)
8040d550:	00412483          	lw	s1,4(sp)
8040d554:	00012903          	lw	s2,0(sp)
8040d558:	01010113          	addi	sp,sp,16
8040d55c:	00008067          	ret
8040d560:	00008697          	auipc	a3,0x8
8040d564:	b6c68693          	addi	a3,a3,-1172 # 804150cc <syscalls+0x608>
8040d568:	00005617          	auipc	a2,0x5
8040d56c:	68060613          	addi	a2,a2,1664 # 80412be8 <commands+0x1bc>
8040d570:	04400593          	li	a1,68
8040d574:	00008517          	auipc	a0,0x8
8040d578:	a7850513          	addi	a0,a0,-1416 # 80414fec <syscalls+0x528>
8040d57c:	8a8f30ef          	jal	ra,80400624 <__panic>
8040d580:	00008697          	auipc	a3,0x8
8040d584:	b3068693          	addi	a3,a3,-1232 # 804150b0 <syscalls+0x5ec>
8040d588:	00005617          	auipc	a2,0x5
8040d58c:	66060613          	addi	a2,a2,1632 # 80412be8 <commands+0x1bc>
8040d590:	03f00593          	li	a1,63
8040d594:	00008517          	auipc	a0,0x8
8040d598:	a5850513          	addi	a0,a0,-1448 # 80414fec <syscalls+0x528>
8040d59c:	888f30ef          	jal	ra,80400624 <__panic>

8040d5a0 <inode_open_dec>:
8040d5a0:	ff010113          	addi	sp,sp,-16
8040d5a4:	00812423          	sw	s0,8(sp)
8040d5a8:	03452403          	lw	s0,52(a0)
8040d5ac:	00112623          	sw	ra,12(sp)
8040d5b0:	00912223          	sw	s1,4(sp)
8040d5b4:	01212023          	sw	s2,0(sp)
8040d5b8:	0a805263          	blez	s0,8040d65c <inode_open_dec+0xbc>
8040d5bc:	fff40413          	addi	s0,s0,-1
8040d5c0:	02852a23          	sw	s0,52(a0)
8040d5c4:	00050493          	mv	s1,a0
8040d5c8:	02041663          	bnez	s0,8040d5f4 <inode_open_dec+0x54>
8040d5cc:	03c52783          	lw	a5,60(a0)
8040d5d0:	06078663          	beqz	a5,8040d63c <inode_open_dec+0x9c>
8040d5d4:	0087a903          	lw	s2,8(a5)
8040d5d8:	06090263          	beqz	s2,8040d63c <inode_open_dec+0x9c>
8040d5dc:	00008597          	auipc	a1,0x8
8040d5e0:	aac58593          	addi	a1,a1,-1364 # 80415088 <syscalls+0x5c4>
8040d5e4:	e0dff0ef          	jal	ra,8040d3f0 <inode_check>
8040d5e8:	00048513          	mv	a0,s1
8040d5ec:	000900e7          	jalr	s2
8040d5f0:	02051063          	bnez	a0,8040d610 <inode_open_dec+0x70>
8040d5f4:	00040513          	mv	a0,s0
8040d5f8:	00c12083          	lw	ra,12(sp)
8040d5fc:	00812403          	lw	s0,8(sp)
8040d600:	00412483          	lw	s1,4(sp)
8040d604:	00012903          	lw	s2,0(sp)
8040d608:	01010113          	addi	sp,sp,16
8040d60c:	00008067          	ret
8040d610:	00050593          	mv	a1,a0
8040d614:	00008517          	auipc	a0,0x8
8040d618:	a7c50513          	addi	a0,a0,-1412 # 80415090 <syscalls+0x5cc>
8040d61c:	be1f20ef          	jal	ra,804001fc <cprintf>
8040d620:	00040513          	mv	a0,s0
8040d624:	00c12083          	lw	ra,12(sp)
8040d628:	00812403          	lw	s0,8(sp)
8040d62c:	00412483          	lw	s1,4(sp)
8040d630:	00012903          	lw	s2,0(sp)
8040d634:	01010113          	addi	sp,sp,16
8040d638:	00008067          	ret
8040d63c:	00008697          	auipc	a3,0x8
8040d640:	9fc68693          	addi	a3,a3,-1540 # 80415038 <syscalls+0x574>
8040d644:	00005617          	auipc	a2,0x5
8040d648:	5a460613          	addi	a2,a2,1444 # 80412be8 <commands+0x1bc>
8040d64c:	06100593          	li	a1,97
8040d650:	00008517          	auipc	a0,0x8
8040d654:	99c50513          	addi	a0,a0,-1636 # 80414fec <syscalls+0x528>
8040d658:	fcdf20ef          	jal	ra,80400624 <__panic>
8040d65c:	00008697          	auipc	a3,0x8
8040d660:	9c068693          	addi	a3,a3,-1600 # 8041501c <syscalls+0x558>
8040d664:	00005617          	auipc	a2,0x5
8040d668:	58460613          	addi	a2,a2,1412 # 80412be8 <commands+0x1bc>
8040d66c:	05c00593          	li	a1,92
8040d670:	00008517          	auipc	a0,0x8
8040d674:	97c50513          	addi	a0,a0,-1668 # 80414fec <syscalls+0x528>
8040d678:	fadf20ef          	jal	ra,80400624 <__panic>

8040d67c <__alloc_fs>:
8040d67c:	ff010113          	addi	sp,sp,-16
8040d680:	00812423          	sw	s0,8(sp)
8040d684:	00050413          	mv	s0,a0
8040d688:	08000513          	li	a0,128
8040d68c:	00112623          	sw	ra,12(sp)
8040d690:	b30f50ef          	jal	ra,804029c0 <kmalloc>
8040d694:	00050463          	beqz	a0,8040d69c <__alloc_fs+0x20>
8040d698:	06852623          	sw	s0,108(a0)
8040d69c:	00c12083          	lw	ra,12(sp)
8040d6a0:	00812403          	lw	s0,8(sp)
8040d6a4:	01010113          	addi	sp,sp,16
8040d6a8:	00008067          	ret

8040d6ac <vfs_init>:
8040d6ac:	ff010113          	addi	sp,sp,-16
8040d6b0:	00100593          	li	a1,1
8040d6b4:	0008e517          	auipc	a0,0x8e
8040d6b8:	0a850513          	addi	a0,a0,168 # 8049b75c <bootfs_sem>
8040d6bc:	00112623          	sw	ra,12(sp)
8040d6c0:	a2df70ef          	jal	ra,804050ec <sem_init>
8040d6c4:	00c12083          	lw	ra,12(sp)
8040d6c8:	01010113          	addi	sp,sp,16
8040d6cc:	3900006f          	j	8040da5c <vfs_devlist_init>

8040d6d0 <vfs_set_bootfs>:
8040d6d0:	fe010113          	addi	sp,sp,-32
8040d6d4:	00812c23          	sw	s0,24(sp)
8040d6d8:	00112e23          	sw	ra,28(sp)
8040d6dc:	00912a23          	sw	s1,20(sp)
8040d6e0:	00012623          	sw	zero,12(sp)
8040d6e4:	00050413          	mv	s0,a0
8040d6e8:	04050a63          	beqz	a0,8040d73c <vfs_set_bootfs+0x6c>
8040d6ec:	03a00593          	li	a1,58
8040d6f0:	09c050ef          	jal	ra,8041278c <strchr>
8040d6f4:	08050e63          	beqz	a0,8040d790 <vfs_set_bootfs+0xc0>
8040d6f8:	00154783          	lbu	a5,1(a0)
8040d6fc:	08079a63          	bnez	a5,8040d790 <vfs_set_bootfs+0xc0>
8040d700:	00040513          	mv	a0,s0
8040d704:	509000ef          	jal	ra,8040e40c <vfs_chdir>
8040d708:	00050413          	mv	s0,a0
8040d70c:	00050e63          	beqz	a0,8040d728 <vfs_set_bootfs+0x58>
8040d710:	00040513          	mv	a0,s0
8040d714:	01c12083          	lw	ra,28(sp)
8040d718:	01812403          	lw	s0,24(sp)
8040d71c:	01412483          	lw	s1,20(sp)
8040d720:	02010113          	addi	sp,sp,32
8040d724:	00008067          	ret
8040d728:	00c10513          	addi	a0,sp,12
8040d72c:	375000ef          	jal	ra,8040e2a0 <vfs_get_curdir>
8040d730:	00050413          	mv	s0,a0
8040d734:	fc051ee3          	bnez	a0,8040d710 <vfs_set_bootfs+0x40>
8040d738:	00c12403          	lw	s0,12(sp)
8040d73c:	0008e517          	auipc	a0,0x8e
8040d740:	02050513          	addi	a0,a0,32 # 8049b75c <bootfs_sem>
8040d744:	9b9f70ef          	jal	ra,804050fc <down>
8040d748:	0008f797          	auipc	a5,0x8f
8040d74c:	08478793          	addi	a5,a5,132 # 8049c7cc <bootfs_node>
8040d750:	0007a483          	lw	s1,0(a5)
8040d754:	0008e517          	auipc	a0,0x8e
8040d758:	00850513          	addi	a0,a0,8 # 8049b75c <bootfs_sem>
8040d75c:	0008f797          	auipc	a5,0x8f
8040d760:	0687a823          	sw	s0,112(a5) # 8049c7cc <bootfs_node>
8040d764:	00000413          	li	s0,0
8040d768:	991f70ef          	jal	ra,804050f8 <up>
8040d76c:	fa0482e3          	beqz	s1,8040d710 <vfs_set_bootfs+0x40>
8040d770:	00048513          	mv	a0,s1
8040d774:	d49ff0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040d778:	00040513          	mv	a0,s0
8040d77c:	01c12083          	lw	ra,28(sp)
8040d780:	01812403          	lw	s0,24(sp)
8040d784:	01412483          	lw	s1,20(sp)
8040d788:	02010113          	addi	sp,sp,32
8040d78c:	00008067          	ret
8040d790:	ffd00413          	li	s0,-3
8040d794:	f7dff06f          	j	8040d710 <vfs_set_bootfs+0x40>

8040d798 <vfs_get_bootfs>:
8040d798:	ff010113          	addi	sp,sp,-16
8040d79c:	00912223          	sw	s1,4(sp)
8040d7a0:	0008f497          	auipc	s1,0x8f
8040d7a4:	02c48493          	addi	s1,s1,44 # 8049c7cc <bootfs_node>
8040d7a8:	0004a783          	lw	a5,0(s1)
8040d7ac:	00112623          	sw	ra,12(sp)
8040d7b0:	00812423          	sw	s0,8(sp)
8040d7b4:	04078c63          	beqz	a5,8040d80c <vfs_get_bootfs+0x74>
8040d7b8:	00050413          	mv	s0,a0
8040d7bc:	0008e517          	auipc	a0,0x8e
8040d7c0:	fa050513          	addi	a0,a0,-96 # 8049b75c <bootfs_sem>
8040d7c4:	939f70ef          	jal	ra,804050fc <down>
8040d7c8:	0004a483          	lw	s1,0(s1)
8040d7cc:	02048a63          	beqz	s1,8040d800 <vfs_get_bootfs+0x68>
8040d7d0:	00048513          	mv	a0,s1
8040d7d4:	bf5ff0ef          	jal	ra,8040d3c8 <inode_ref_inc>
8040d7d8:	0008e517          	auipc	a0,0x8e
8040d7dc:	f8450513          	addi	a0,a0,-124 # 8049b75c <bootfs_sem>
8040d7e0:	919f70ef          	jal	ra,804050f8 <up>
8040d7e4:	00000513          	li	a0,0
8040d7e8:	00942023          	sw	s1,0(s0)
8040d7ec:	00c12083          	lw	ra,12(sp)
8040d7f0:	00812403          	lw	s0,8(sp)
8040d7f4:	00412483          	lw	s1,4(sp)
8040d7f8:	01010113          	addi	sp,sp,16
8040d7fc:	00008067          	ret
8040d800:	0008e517          	auipc	a0,0x8e
8040d804:	f5c50513          	addi	a0,a0,-164 # 8049b75c <bootfs_sem>
8040d808:	8f1f70ef          	jal	ra,804050f8 <up>
8040d80c:	ff000513          	li	a0,-16
8040d810:	fddff06f          	j	8040d7ec <vfs_get_bootfs+0x54>

8040d814 <vfs_do_add>:
8040d814:	fe010113          	addi	sp,sp,-32
8040d818:	00112e23          	sw	ra,28(sp)
8040d81c:	00812c23          	sw	s0,24(sp)
8040d820:	00912a23          	sw	s1,20(sp)
8040d824:	01212823          	sw	s2,16(sp)
8040d828:	01312623          	sw	s3,12(sp)
8040d82c:	01412423          	sw	s4,8(sp)
8040d830:	01512223          	sw	s5,4(sp)
8040d834:	01612023          	sw	s6,0(sp)
8040d838:	14050863          	beqz	a0,8040d988 <vfs_do_add+0x174>
8040d83c:	00050413          	mv	s0,a0
8040d840:	00058a13          	mv	s4,a1
8040d844:	00060b13          	mv	s6,a2
8040d848:	00068a93          	mv	s5,a3
8040d84c:	0e058663          	beqz	a1,8040d938 <vfs_do_add+0x124>
8040d850:	02c5a703          	lw	a4,44(a1)
8040d854:	000017b7          	lui	a5,0x1
8040d858:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d85c:	0ef71063          	bne	a4,a5,8040d93c <vfs_do_add+0x128>
8040d860:	00040513          	mv	a0,s0
8040d864:	671040ef          	jal	ra,804126d4 <strlen>
8040d868:	01f00793          	li	a5,31
8040d86c:	10a7e663          	bltu	a5,a0,8040d978 <vfs_do_add+0x164>
8040d870:	00040513          	mv	a0,s0
8040d874:	a09f20ef          	jal	ra,8040027c <strdup>
8040d878:	00050493          	mv	s1,a0
8040d87c:	10050263          	beqz	a0,8040d980 <vfs_do_add+0x16c>
8040d880:	01800513          	li	a0,24
8040d884:	93cf50ef          	jal	ra,804029c0 <kmalloc>
8040d888:	00050993          	mv	s3,a0
8040d88c:	08050e63          	beqz	a0,8040d928 <vfs_do_add+0x114>
8040d890:	0008e517          	auipc	a0,0x8e
8040d894:	ed850513          	addi	a0,a0,-296 # 8049b768 <vdev_list_sem>
8040d898:	0008f917          	auipc	s2,0x8f
8040d89c:	f3890913          	addi	s2,s2,-200 # 8049c7d0 <vdev_list>
8040d8a0:	85df70ef          	jal	ra,804050fc <down>
8040d8a4:	00090413          	mv	s0,s2
8040d8a8:	0140006f          	j	8040d8bc <vfs_do_add+0xa8>
8040d8ac:	ff042503          	lw	a0,-16(s0)
8040d8b0:	00048593          	mv	a1,s1
8040d8b4:	6a9040ef          	jal	ra,8041275c <strcmp>
8040d8b8:	0a050263          	beqz	a0,8040d95c <vfs_do_add+0x148>
8040d8bc:	00442403          	lw	s0,4(s0)
8040d8c0:	ff2416e3          	bne	s0,s2,8040d8ac <vfs_do_add+0x98>
8040d8c4:	00442703          	lw	a4,4(s0)
8040d8c8:	01098793          	addi	a5,s3,16
8040d8cc:	0099a023          	sw	s1,0(s3)
8040d8d0:	0149a223          	sw	s4,4(s3)
8040d8d4:	0159a623          	sw	s5,12(s3)
8040d8d8:	0169a423          	sw	s6,8(s3)
8040d8dc:	00f72023          	sw	a5,0(a4)
8040d8e0:	0089a823          	sw	s0,16(s3)
8040d8e4:	00e9aa23          	sw	a4,20(s3)
8040d8e8:	0008e517          	auipc	a0,0x8e
8040d8ec:	e8050513          	addi	a0,a0,-384 # 8049b768 <vdev_list_sem>
8040d8f0:	00f42223          	sw	a5,4(s0)
8040d8f4:	00000413          	li	s0,0
8040d8f8:	801f70ef          	jal	ra,804050f8 <up>
8040d8fc:	00040513          	mv	a0,s0
8040d900:	01c12083          	lw	ra,28(sp)
8040d904:	01812403          	lw	s0,24(sp)
8040d908:	01412483          	lw	s1,20(sp)
8040d90c:	01012903          	lw	s2,16(sp)
8040d910:	00c12983          	lw	s3,12(sp)
8040d914:	00812a03          	lw	s4,8(sp)
8040d918:	00412a83          	lw	s5,4(sp)
8040d91c:	00012b03          	lw	s6,0(sp)
8040d920:	02010113          	addi	sp,sp,32
8040d924:	00008067          	ret
8040d928:	ffc00413          	li	s0,-4
8040d92c:	00048513          	mv	a0,s1
8040d930:	9b4f50ef          	jal	ra,80402ae4 <kfree>
8040d934:	fc9ff06f          	j	8040d8fc <vfs_do_add+0xe8>
8040d938:	f20684e3          	beqz	a3,8040d860 <vfs_do_add+0x4c>
8040d93c:	00008697          	auipc	a3,0x8
8040d940:	83068693          	addi	a3,a3,-2000 # 8041516c <syscalls+0x6a8>
8040d944:	00005617          	auipc	a2,0x5
8040d948:	2a460613          	addi	a2,a2,676 # 80412be8 <commands+0x1bc>
8040d94c:	08f00593          	li	a1,143
8040d950:	00008517          	auipc	a0,0x8
8040d954:	80450513          	addi	a0,a0,-2044 # 80415154 <syscalls+0x690>
8040d958:	ccdf20ef          	jal	ra,80400624 <__panic>
8040d95c:	0008e517          	auipc	a0,0x8e
8040d960:	e0c50513          	addi	a0,a0,-500 # 8049b768 <vdev_list_sem>
8040d964:	f94f70ef          	jal	ra,804050f8 <up>
8040d968:	00098513          	mv	a0,s3
8040d96c:	978f50ef          	jal	ra,80402ae4 <kfree>
8040d970:	fe900413          	li	s0,-23
8040d974:	fb9ff06f          	j	8040d92c <vfs_do_add+0x118>
8040d978:	ff400413          	li	s0,-12
8040d97c:	f81ff06f          	j	8040d8fc <vfs_do_add+0xe8>
8040d980:	ffc00413          	li	s0,-4
8040d984:	f79ff06f          	j	8040d8fc <vfs_do_add+0xe8>
8040d988:	00007697          	auipc	a3,0x7
8040d98c:	7bc68693          	addi	a3,a3,1980 # 80415144 <syscalls+0x680>
8040d990:	00005617          	auipc	a2,0x5
8040d994:	25860613          	addi	a2,a2,600 # 80412be8 <commands+0x1bc>
8040d998:	08e00593          	li	a1,142
8040d99c:	00007517          	auipc	a0,0x7
8040d9a0:	7b850513          	addi	a0,a0,1976 # 80415154 <syscalls+0x690>
8040d9a4:	c81f20ef          	jal	ra,80400624 <__panic>

8040d9a8 <find_mount>:
8040d9a8:	fe010113          	addi	sp,sp,-32
8040d9ac:	00812c23          	sw	s0,24(sp)
8040d9b0:	00912a23          	sw	s1,20(sp)
8040d9b4:	01212823          	sw	s2,16(sp)
8040d9b8:	01312623          	sw	s3,12(sp)
8040d9bc:	0008f497          	auipc	s1,0x8f
8040d9c0:	e1448493          	addi	s1,s1,-492 # 8049c7d0 <vdev_list>
8040d9c4:	00112e23          	sw	ra,28(sp)
8040d9c8:	00050913          	mv	s2,a0
8040d9cc:	00058993          	mv	s3,a1
8040d9d0:	00048413          	mv	s0,s1
8040d9d4:	06050463          	beqz	a0,8040da3c <find_mount+0x94>
8040d9d8:	00442403          	lw	s0,4(s0)
8040d9dc:	04940063          	beq	s0,s1,8040da1c <find_mount+0x74>
8040d9e0:	ffc42783          	lw	a5,-4(s0)
8040d9e4:	fe078ae3          	beqz	a5,8040d9d8 <find_mount+0x30>
8040d9e8:	ff042503          	lw	a0,-16(s0)
8040d9ec:	00090593          	mv	a1,s2
8040d9f0:	56d040ef          	jal	ra,8041275c <strcmp>
8040d9f4:	fe0512e3          	bnez	a0,8040d9d8 <find_mount+0x30>
8040d9f8:	ff040413          	addi	s0,s0,-16
8040d9fc:	0089a023          	sw	s0,0(s3)
8040da00:	01c12083          	lw	ra,28(sp)
8040da04:	01812403          	lw	s0,24(sp)
8040da08:	01412483          	lw	s1,20(sp)
8040da0c:	01012903          	lw	s2,16(sp)
8040da10:	00c12983          	lw	s3,12(sp)
8040da14:	02010113          	addi	sp,sp,32
8040da18:	00008067          	ret
8040da1c:	01c12083          	lw	ra,28(sp)
8040da20:	01812403          	lw	s0,24(sp)
8040da24:	01412483          	lw	s1,20(sp)
8040da28:	01012903          	lw	s2,16(sp)
8040da2c:	00c12983          	lw	s3,12(sp)
8040da30:	ff300513          	li	a0,-13
8040da34:	02010113          	addi	sp,sp,32
8040da38:	00008067          	ret
8040da3c:	00007697          	auipc	a3,0x7
8040da40:	70868693          	addi	a3,a3,1800 # 80415144 <syscalls+0x680>
8040da44:	00005617          	auipc	a2,0x5
8040da48:	1a460613          	addi	a2,a2,420 # 80412be8 <commands+0x1bc>
8040da4c:	0cd00593          	li	a1,205
8040da50:	00007517          	auipc	a0,0x7
8040da54:	70450513          	addi	a0,a0,1796 # 80415154 <syscalls+0x690>
8040da58:	bcdf20ef          	jal	ra,80400624 <__panic>

8040da5c <vfs_devlist_init>:
8040da5c:	0008f797          	auipc	a5,0x8f
8040da60:	d7478793          	addi	a5,a5,-652 # 8049c7d0 <vdev_list>
8040da64:	00100593          	li	a1,1
8040da68:	0008e517          	auipc	a0,0x8e
8040da6c:	d0050513          	addi	a0,a0,-768 # 8049b768 <vdev_list_sem>
8040da70:	00f7a223          	sw	a5,4(a5)
8040da74:	00f7a023          	sw	a5,0(a5)
8040da78:	e74f706f          	j	804050ec <sem_init>

8040da7c <vfs_cleanup>:
8040da7c:	ff010113          	addi	sp,sp,-16
8040da80:	00912223          	sw	s1,4(sp)
8040da84:	0008f497          	auipc	s1,0x8f
8040da88:	d4c48493          	addi	s1,s1,-692 # 8049c7d0 <vdev_list>
8040da8c:	0044a783          	lw	a5,4(s1)
8040da90:	00112623          	sw	ra,12(sp)
8040da94:	00812423          	sw	s0,8(sp)
8040da98:	04978a63          	beq	a5,s1,8040daec <vfs_cleanup+0x70>
8040da9c:	0008e517          	auipc	a0,0x8e
8040daa0:	ccc50513          	addi	a0,a0,-820 # 8049b768 <vdev_list_sem>
8040daa4:	e58f70ef          	jal	ra,804050fc <down>
8040daa8:	00048413          	mv	s0,s1
8040daac:	00442403          	lw	s0,4(s0)
8040dab0:	02940063          	beq	s0,s1,8040dad0 <vfs_cleanup+0x54>
8040dab4:	ff842783          	lw	a5,-8(s0)
8040dab8:	00078513          	mv	a0,a5
8040dabc:	fe0788e3          	beqz	a5,8040daac <vfs_cleanup+0x30>
8040dac0:	07c7a783          	lw	a5,124(a5)
8040dac4:	000780e7          	jalr	a5
8040dac8:	00442403          	lw	s0,4(s0)
8040dacc:	fe9414e3          	bne	s0,s1,8040dab4 <vfs_cleanup+0x38>
8040dad0:	00812403          	lw	s0,8(sp)
8040dad4:	00c12083          	lw	ra,12(sp)
8040dad8:	00412483          	lw	s1,4(sp)
8040dadc:	0008e517          	auipc	a0,0x8e
8040dae0:	c8c50513          	addi	a0,a0,-884 # 8049b768 <vdev_list_sem>
8040dae4:	01010113          	addi	sp,sp,16
8040dae8:	e10f706f          	j	804050f8 <up>
8040daec:	00c12083          	lw	ra,12(sp)
8040daf0:	00812403          	lw	s0,8(sp)
8040daf4:	00412483          	lw	s1,4(sp)
8040daf8:	01010113          	addi	sp,sp,16
8040dafc:	00008067          	ret

8040db00 <vfs_get_root>:
8040db00:	fe010113          	addi	sp,sp,-32
8040db04:	00112e23          	sw	ra,28(sp)
8040db08:	00812c23          	sw	s0,24(sp)
8040db0c:	00912a23          	sw	s1,20(sp)
8040db10:	01212823          	sw	s2,16(sp)
8040db14:	01312623          	sw	s3,12(sp)
8040db18:	01412423          	sw	s4,8(sp)
8040db1c:	0c050263          	beqz	a0,8040dbe0 <vfs_get_root+0xe0>
8040db20:	0008f917          	auipc	s2,0x8f
8040db24:	cb090913          	addi	s2,s2,-848 # 8049c7d0 <vdev_list>
8040db28:	00492783          	lw	a5,4(s2)
8040db2c:	0b278663          	beq	a5,s2,8040dbd8 <vfs_get_root+0xd8>
8040db30:	00050993          	mv	s3,a0
8040db34:	0008e517          	auipc	a0,0x8e
8040db38:	c3450513          	addi	a0,a0,-972 # 8049b768 <vdev_list_sem>
8040db3c:	00058a13          	mv	s4,a1
8040db40:	00090413          	mv	s0,s2
8040db44:	db8f70ef          	jal	ra,804050fc <down>
8040db48:	0180006f          	j	8040db60 <vfs_get_root+0x60>
8040db4c:	ff042583          	lw	a1,-16(s0)
8040db50:	00098513          	mv	a0,s3
8040db54:	409040ef          	jal	ra,8041275c <strcmp>
8040db58:	00050493          	mv	s1,a0
8040db5c:	04050063          	beqz	a0,8040db9c <vfs_get_root+0x9c>
8040db60:	00442403          	lw	s0,4(s0)
8040db64:	ff2414e3          	bne	s0,s2,8040db4c <vfs_get_root+0x4c>
8040db68:	ff300493          	li	s1,-13
8040db6c:	0008e517          	auipc	a0,0x8e
8040db70:	bfc50513          	addi	a0,a0,-1028 # 8049b768 <vdev_list_sem>
8040db74:	d84f70ef          	jal	ra,804050f8 <up>
8040db78:	01c12083          	lw	ra,28(sp)
8040db7c:	01812403          	lw	s0,24(sp)
8040db80:	00048513          	mv	a0,s1
8040db84:	01012903          	lw	s2,16(sp)
8040db88:	01412483          	lw	s1,20(sp)
8040db8c:	00c12983          	lw	s3,12(sp)
8040db90:	00812a03          	lw	s4,8(sp)
8040db94:	02010113          	addi	sp,sp,32
8040db98:	00008067          	ret
8040db9c:	ff842503          	lw	a0,-8(s0)
8040dba0:	00050c63          	beqz	a0,8040dbb8 <vfs_get_root+0xb8>
8040dba4:	07452783          	lw	a5,116(a0)
8040dba8:	000780e7          	jalr	a5
8040dbac:	00050a63          	beqz	a0,8040dbc0 <vfs_get_root+0xc0>
8040dbb0:	00aa2023          	sw	a0,0(s4)
8040dbb4:	fb9ff06f          	j	8040db6c <vfs_get_root+0x6c>
8040dbb8:	ffc42783          	lw	a5,-4(s0)
8040dbbc:	00078663          	beqz	a5,8040dbc8 <vfs_get_root+0xc8>
8040dbc0:	ff200493          	li	s1,-14
8040dbc4:	fa9ff06f          	j	8040db6c <vfs_get_root+0x6c>
8040dbc8:	ff442503          	lw	a0,-12(s0)
8040dbcc:	ffcff0ef          	jal	ra,8040d3c8 <inode_ref_inc>
8040dbd0:	ff442503          	lw	a0,-12(s0)
8040dbd4:	fd9ff06f          	j	8040dbac <vfs_get_root+0xac>
8040dbd8:	ff300493          	li	s1,-13
8040dbdc:	f9dff06f          	j	8040db78 <vfs_get_root+0x78>
8040dbe0:	00007697          	auipc	a3,0x7
8040dbe4:	56468693          	addi	a3,a3,1380 # 80415144 <syscalls+0x680>
8040dbe8:	00005617          	auipc	a2,0x5
8040dbec:	00060613          	mv	a2,a2
8040dbf0:	04500593          	li	a1,69
8040dbf4:	00007517          	auipc	a0,0x7
8040dbf8:	56050513          	addi	a0,a0,1376 # 80415154 <syscalls+0x690>
8040dbfc:	a29f20ef          	jal	ra,80400624 <__panic>

8040dc00 <vfs_get_devname>:
8040dc00:	0008f697          	auipc	a3,0x8f
8040dc04:	bd068693          	addi	a3,a3,-1072 # 8049c7d0 <vdev_list>
8040dc08:	00068793          	mv	a5,a3
8040dc0c:	00051863          	bnez	a0,8040dc1c <vfs_get_devname+0x1c>
8040dc10:	0240006f          	j	8040dc34 <vfs_get_devname+0x34>
8040dc14:	ff87a703          	lw	a4,-8(a5)
8040dc18:	00a70a63          	beq	a4,a0,8040dc2c <vfs_get_devname+0x2c>
8040dc1c:	0047a783          	lw	a5,4(a5)
8040dc20:	fed79ae3          	bne	a5,a3,8040dc14 <vfs_get_devname+0x14>
8040dc24:	00000513          	li	a0,0
8040dc28:	00008067          	ret
8040dc2c:	ff07a503          	lw	a0,-16(a5)
8040dc30:	00008067          	ret
8040dc34:	ff010113          	addi	sp,sp,-16
8040dc38:	00007697          	auipc	a3,0x7
8040dc3c:	59068693          	addi	a3,a3,1424 # 804151c8 <syscalls+0x704>
8040dc40:	00005617          	auipc	a2,0x5
8040dc44:	fa860613          	addi	a2,a2,-88 # 80412be8 <commands+0x1bc>
8040dc48:	06a00593          	li	a1,106
8040dc4c:	00007517          	auipc	a0,0x7
8040dc50:	50850513          	addi	a0,a0,1288 # 80415154 <syscalls+0x690>
8040dc54:	00112623          	sw	ra,12(sp)
8040dc58:	9cdf20ef          	jal	ra,80400624 <__panic>

8040dc5c <vfs_add_dev>:
8040dc5c:	00060693          	mv	a3,a2
8040dc60:	00000613          	li	a2,0
8040dc64:	bb1ff06f          	j	8040d814 <vfs_do_add>

8040dc68 <vfs_mount>:
8040dc68:	fe010113          	addi	sp,sp,-32
8040dc6c:	00812c23          	sw	s0,24(sp)
8040dc70:	00050413          	mv	s0,a0
8040dc74:	0008e517          	auipc	a0,0x8e
8040dc78:	af450513          	addi	a0,a0,-1292 # 8049b768 <vdev_list_sem>
8040dc7c:	00112e23          	sw	ra,28(sp)
8040dc80:	00912a23          	sw	s1,20(sp)
8040dc84:	00058493          	mv	s1,a1
8040dc88:	c74f70ef          	jal	ra,804050fc <down>
8040dc8c:	00040513          	mv	a0,s0
8040dc90:	00c10593          	addi	a1,sp,12
8040dc94:	d15ff0ef          	jal	ra,8040d9a8 <find_mount>
8040dc98:	00050413          	mv	s0,a0
8040dc9c:	06051263          	bnez	a0,8040dd00 <vfs_mount+0x98>
8040dca0:	00c12583          	lw	a1,12(sp)
8040dca4:	0085a783          	lw	a5,8(a1)
8040dca8:	06079e63          	bnez	a5,8040dd24 <vfs_mount+0xbc>
8040dcac:	0005a783          	lw	a5,0(a1)
8040dcb0:	08078e63          	beqz	a5,8040dd4c <vfs_mount+0xe4>
8040dcb4:	00c5a783          	lw	a5,12(a1)
8040dcb8:	08078a63          	beqz	a5,8040dd4c <vfs_mount+0xe4>
8040dcbc:	0045a503          	lw	a0,4(a1)
8040dcc0:	06050663          	beqz	a0,8040dd2c <vfs_mount+0xc4>
8040dcc4:	02c52703          	lw	a4,44(a0)
8040dcc8:	000017b7          	lui	a5,0x1
8040dccc:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040dcd0:	04f71e63          	bne	a4,a5,8040dd2c <vfs_mount+0xc4>
8040dcd4:	00858593          	addi	a1,a1,8
8040dcd8:	000480e7          	jalr	s1
8040dcdc:	00050413          	mv	s0,a0
8040dce0:	02051063          	bnez	a0,8040dd00 <vfs_mount+0x98>
8040dce4:	00c12783          	lw	a5,12(sp)
8040dce8:	0087a703          	lw	a4,8(a5)
8040dcec:	08070063          	beqz	a4,8040dd6c <vfs_mount+0x104>
8040dcf0:	0007a583          	lw	a1,0(a5)
8040dcf4:	00007517          	auipc	a0,0x7
8040dcf8:	55450513          	addi	a0,a0,1364 # 80415248 <syscalls+0x784>
8040dcfc:	d00f20ef          	jal	ra,804001fc <cprintf>
8040dd00:	0008e517          	auipc	a0,0x8e
8040dd04:	a6850513          	addi	a0,a0,-1432 # 8049b768 <vdev_list_sem>
8040dd08:	bf0f70ef          	jal	ra,804050f8 <up>
8040dd0c:	00040513          	mv	a0,s0
8040dd10:	01c12083          	lw	ra,28(sp)
8040dd14:	01812403          	lw	s0,24(sp)
8040dd18:	01412483          	lw	s1,20(sp)
8040dd1c:	02010113          	addi	sp,sp,32
8040dd20:	00008067          	ret
8040dd24:	ff100413          	li	s0,-15
8040dd28:	fd9ff06f          	j	8040dd00 <vfs_mount+0x98>
8040dd2c:	00007697          	auipc	a3,0x7
8040dd30:	4d468693          	addi	a3,a3,1236 # 80415200 <syscalls+0x73c>
8040dd34:	00005617          	auipc	a2,0x5
8040dd38:	eb460613          	addi	a2,a2,-332 # 80412be8 <commands+0x1bc>
8040dd3c:	0ed00593          	li	a1,237
8040dd40:	00007517          	auipc	a0,0x7
8040dd44:	41450513          	addi	a0,a0,1044 # 80415154 <syscalls+0x690>
8040dd48:	8ddf20ef          	jal	ra,80400624 <__panic>
8040dd4c:	00007697          	auipc	a3,0x7
8040dd50:	48868693          	addi	a3,a3,1160 # 804151d4 <syscalls+0x710>
8040dd54:	00005617          	auipc	a2,0x5
8040dd58:	e9460613          	addi	a2,a2,-364 # 80412be8 <commands+0x1bc>
8040dd5c:	0eb00593          	li	a1,235
8040dd60:	00007517          	auipc	a0,0x7
8040dd64:	3f450513          	addi	a0,a0,1012 # 80415154 <syscalls+0x690>
8040dd68:	8bdf20ef          	jal	ra,80400624 <__panic>
8040dd6c:	00007697          	auipc	a3,0x7
8040dd70:	4c868693          	addi	a3,a3,1224 # 80415234 <syscalls+0x770>
8040dd74:	00005617          	auipc	a2,0x5
8040dd78:	e7460613          	addi	a2,a2,-396 # 80412be8 <commands+0x1bc>
8040dd7c:	0ef00593          	li	a1,239
8040dd80:	00007517          	auipc	a0,0x7
8040dd84:	3d450513          	addi	a0,a0,980 # 80415154 <syscalls+0x690>
8040dd88:	89df20ef          	jal	ra,80400624 <__panic>

8040dd8c <vfs_open>:
8040dd8c:	fd010113          	addi	sp,sp,-48
8040dd90:	02112623          	sw	ra,44(sp)
8040dd94:	02812423          	sw	s0,40(sp)
8040dd98:	02912223          	sw	s1,36(sp)
8040dd9c:	03212023          	sw	s2,32(sp)
8040dda0:	01312e23          	sw	s3,28(sp)
8040dda4:	01412c23          	sw	s4,24(sp)
8040dda8:	01512a23          	sw	s5,20(sp)
8040ddac:	0035f793          	andi	a5,a1,3
8040ddb0:	16078e63          	beqz	a5,8040df2c <vfs_open+0x1a0>
8040ddb4:	00200713          	li	a4,2
8040ddb8:	0cf76c63          	bltu	a4,a5,8040de90 <vfs_open+0x104>
8040ddbc:	0105fa93          	andi	s5,a1,16
8040ddc0:	00058493          	mv	s1,a1
8040ddc4:	00410593          	addi	a1,sp,4
8040ddc8:	00060993          	mv	s3,a2
8040ddcc:	00050913          	mv	s2,a0
8040ddd0:	39c000ef          	jal	ra,8040e16c <vfs_lookup>
8040ddd4:	00050413          	mv	s0,a0
8040ddd8:	0044fa13          	andi	s4,s1,4
8040dddc:	0e051063          	bnez	a0,8040debc <vfs_open+0x130>
8040dde0:	00c4f793          	andi	a5,s1,12
8040dde4:	00c00713          	li	a4,12
8040dde8:	16e78663          	beq	a5,a4,8040df54 <vfs_open+0x1c8>
8040ddec:	00412403          	lw	s0,4(sp)
8040ddf0:	1a040663          	beqz	s0,8040df9c <vfs_open+0x210>
8040ddf4:	03c42783          	lw	a5,60(s0)
8040ddf8:	16078263          	beqz	a5,8040df5c <vfs_open+0x1d0>
8040ddfc:	0047a783          	lw	a5,4(a5)
8040de00:	14078e63          	beqz	a5,8040df5c <vfs_open+0x1d0>
8040de04:	00040513          	mv	a0,s0
8040de08:	00007597          	auipc	a1,0x7
8040de0c:	52058593          	addi	a1,a1,1312 # 80415328 <syscalls+0x864>
8040de10:	de0ff0ef          	jal	ra,8040d3f0 <inode_check>
8040de14:	03c42783          	lw	a5,60(s0)
8040de18:	00412503          	lw	a0,4(sp)
8040de1c:	00048593          	mv	a1,s1
8040de20:	0047a783          	lw	a5,4(a5)
8040de24:	000780e7          	jalr	a5
8040de28:	00050413          	mv	s0,a0
8040de2c:	00412503          	lw	a0,4(sp)
8040de30:	10041e63          	bnez	s0,8040df4c <vfs_open+0x1c0>
8040de34:	015a6a33          	or	s4,s4,s5
8040de38:	da4ff0ef          	jal	ra,8040d3dc <inode_open_inc>
8040de3c:	040a0463          	beqz	s4,8040de84 <vfs_open+0xf8>
8040de40:	00412483          	lw	s1,4(sp)
8040de44:	12048c63          	beqz	s1,8040df7c <vfs_open+0x1f0>
8040de48:	03c4a783          	lw	a5,60(s1)
8040de4c:	12078863          	beqz	a5,8040df7c <vfs_open+0x1f0>
8040de50:	0307a783          	lw	a5,48(a5)
8040de54:	12078463          	beqz	a5,8040df7c <vfs_open+0x1f0>
8040de58:	00007597          	auipc	a1,0x7
8040de5c:	52c58593          	addi	a1,a1,1324 # 80415384 <syscalls+0x8c0>
8040de60:	00048513          	mv	a0,s1
8040de64:	d8cff0ef          	jal	ra,8040d3f0 <inode_check>
8040de68:	03c4a783          	lw	a5,60(s1)
8040de6c:	00412503          	lw	a0,4(sp)
8040de70:	00000593          	li	a1,0
8040de74:	0307a783          	lw	a5,48(a5)
8040de78:	000780e7          	jalr	a5
8040de7c:	00050793          	mv	a5,a0
8040de80:	0a051e63          	bnez	a0,8040df3c <vfs_open+0x1b0>
8040de84:	00412783          	lw	a5,4(sp)
8040de88:	00f9a023          	sw	a5,0(s3)
8040de8c:	0080006f          	j	8040de94 <vfs_open+0x108>
8040de90:	ffd00413          	li	s0,-3
8040de94:	00040513          	mv	a0,s0
8040de98:	02c12083          	lw	ra,44(sp)
8040de9c:	02812403          	lw	s0,40(sp)
8040dea0:	02412483          	lw	s1,36(sp)
8040dea4:	02012903          	lw	s2,32(sp)
8040dea8:	01c12983          	lw	s3,28(sp)
8040deac:	01812a03          	lw	s4,24(sp)
8040deb0:	01412a83          	lw	s5,20(sp)
8040deb4:	03010113          	addi	sp,sp,48
8040deb8:	00008067          	ret
8040debc:	ff000793          	li	a5,-16
8040dec0:	fcf51ae3          	bne	a0,a5,8040de94 <vfs_open+0x108>
8040dec4:	fc0a08e3          	beqz	s4,8040de94 <vfs_open+0x108>
8040dec8:	00810613          	addi	a2,sp,8
8040decc:	00c10593          	addi	a1,sp,12
8040ded0:	00090513          	mv	a0,s2
8040ded4:	37c000ef          	jal	ra,8040e250 <vfs_lookup_parent>
8040ded8:	00050413          	mv	s0,a0
8040dedc:	fa051ce3          	bnez	a0,8040de94 <vfs_open+0x108>
8040dee0:	00c12403          	lw	s0,12(sp)
8040dee4:	0c040c63          	beqz	s0,8040dfbc <vfs_open+0x230>
8040dee8:	03c42783          	lw	a5,60(s0)
8040deec:	0c078863          	beqz	a5,8040dfbc <vfs_open+0x230>
8040def0:	0347a783          	lw	a5,52(a5)
8040def4:	0c078463          	beqz	a5,8040dfbc <vfs_open+0x230>
8040def8:	00040513          	mv	a0,s0
8040defc:	00007597          	auipc	a1,0x7
8040df00:	3c458593          	addi	a1,a1,964 # 804152c0 <syscalls+0x7fc>
8040df04:	cecff0ef          	jal	ra,8040d3f0 <inode_check>
8040df08:	03c42783          	lw	a5,60(s0)
8040df0c:	00812583          	lw	a1,8(sp)
8040df10:	00c12503          	lw	a0,12(sp)
8040df14:	0347a783          	lw	a5,52(a5)
8040df18:	0034d613          	srli	a2,s1,0x3
8040df1c:	00410693          	addi	a3,sp,4
8040df20:	00167613          	andi	a2,a2,1
8040df24:	000780e7          	jalr	a5
8040df28:	ec5ff06f          	j	8040ddec <vfs_open+0x60>
8040df2c:	0105fa93          	andi	s5,a1,16
8040df30:	ffd00413          	li	s0,-3
8040df34:	f60a90e3          	bnez	s5,8040de94 <vfs_open+0x108>
8040df38:	e89ff06f          	j	8040ddc0 <vfs_open+0x34>
8040df3c:	00412503          	lw	a0,4(sp)
8040df40:	00078413          	mv	s0,a5
8040df44:	e5cff0ef          	jal	ra,8040d5a0 <inode_open_dec>
8040df48:	00412503          	lw	a0,4(sp)
8040df4c:	d70ff0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040df50:	f45ff06f          	j	8040de94 <vfs_open+0x108>
8040df54:	fe900413          	li	s0,-23
8040df58:	f3dff06f          	j	8040de94 <vfs_open+0x108>
8040df5c:	00007697          	auipc	a3,0x7
8040df60:	37c68693          	addi	a3,a3,892 # 804152d8 <syscalls+0x814>
8040df64:	00005617          	auipc	a2,0x5
8040df68:	c8460613          	addi	a2,a2,-892 # 80412be8 <commands+0x1bc>
8040df6c:	03300593          	li	a1,51
8040df70:	00007517          	auipc	a0,0x7
8040df74:	33850513          	addi	a0,a0,824 # 804152a8 <syscalls+0x7e4>
8040df78:	eacf20ef          	jal	ra,80400624 <__panic>
8040df7c:	00007697          	auipc	a3,0x7
8040df80:	3b468693          	addi	a3,a3,948 # 80415330 <syscalls+0x86c>
8040df84:	00005617          	auipc	a2,0x5
8040df88:	c6460613          	addi	a2,a2,-924 # 80412be8 <commands+0x1bc>
8040df8c:	03a00593          	li	a1,58
8040df90:	00007517          	auipc	a0,0x7
8040df94:	31850513          	addi	a0,a0,792 # 804152a8 <syscalls+0x7e4>
8040df98:	e8cf20ef          	jal	ra,80400624 <__panic>
8040df9c:	00007697          	auipc	a3,0x7
8040dfa0:	32c68693          	addi	a3,a3,812 # 804152c8 <syscalls+0x804>
8040dfa4:	00005617          	auipc	a2,0x5
8040dfa8:	c4460613          	addi	a2,a2,-956 # 80412be8 <commands+0x1bc>
8040dfac:	03100593          	li	a1,49
8040dfb0:	00007517          	auipc	a0,0x7
8040dfb4:	2f850513          	addi	a0,a0,760 # 804152a8 <syscalls+0x7e4>
8040dfb8:	e6cf20ef          	jal	ra,80400624 <__panic>
8040dfbc:	00007697          	auipc	a3,0x7
8040dfc0:	29c68693          	addi	a3,a3,668 # 80415258 <syscalls+0x794>
8040dfc4:	00005617          	auipc	a2,0x5
8040dfc8:	c2460613          	addi	a2,a2,-988 # 80412be8 <commands+0x1bc>
8040dfcc:	02c00593          	li	a1,44
8040dfd0:	00007517          	auipc	a0,0x7
8040dfd4:	2d850513          	addi	a0,a0,728 # 804152a8 <syscalls+0x7e4>
8040dfd8:	e4cf20ef          	jal	ra,80400624 <__panic>

8040dfdc <vfs_close>:
8040dfdc:	ff010113          	addi	sp,sp,-16
8040dfe0:	00112623          	sw	ra,12(sp)
8040dfe4:	00812423          	sw	s0,8(sp)
8040dfe8:	00050413          	mv	s0,a0
8040dfec:	db4ff0ef          	jal	ra,8040d5a0 <inode_open_dec>
8040dff0:	00040513          	mv	a0,s0
8040dff4:	cc8ff0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040dff8:	00c12083          	lw	ra,12(sp)
8040dffc:	00812403          	lw	s0,8(sp)
8040e000:	00000513          	li	a0,0
8040e004:	01010113          	addi	sp,sp,16
8040e008:	00008067          	ret

8040e00c <get_device>:
8040e00c:	fe010113          	addi	sp,sp,-32
8040e010:	00812c23          	sw	s0,24(sp)
8040e014:	00912a23          	sw	s1,20(sp)
8040e018:	01212823          	sw	s2,16(sp)
8040e01c:	00112e23          	sw	ra,28(sp)
8040e020:	00054783          	lbu	a5,0(a0)
8040e024:	00050413          	mv	s0,a0
8040e028:	00058913          	mv	s2,a1
8040e02c:	00060493          	mv	s1,a2
8040e030:	04078263          	beqz	a5,8040e074 <get_device+0x68>
8040e034:	03a00713          	li	a4,58
8040e038:	0ae78463          	beq	a5,a4,8040e0e0 <get_device+0xd4>
8040e03c:	02f00713          	li	a4,47
8040e040:	0ee78e63          	beq	a5,a4,8040e13c <get_device+0x130>
8040e044:	00150693          	addi	a3,a0,1
8040e048:	00000793          	li	a5,0
8040e04c:	03a00813          	li	a6,58
8040e050:	02f00893          	li	a7,47
8040e054:	0140006f          	j	8040e068 <get_device+0x5c>
8040e058:	05070063          	beq	a4,a6,8040e098 <get_device+0x8c>
8040e05c:	00168693          	addi	a3,a3,1
8040e060:	00050793          	mv	a5,a0
8040e064:	01170863          	beq	a4,a7,8040e074 <get_device+0x68>
8040e068:	0006c703          	lbu	a4,0(a3)
8040e06c:	00178513          	addi	a0,a5,1
8040e070:	fe0714e3          	bnez	a4,8040e058 <get_device+0x4c>
8040e074:	00892023          	sw	s0,0(s2)
8040e078:	00048513          	mv	a0,s1
8040e07c:	224000ef          	jal	ra,8040e2a0 <vfs_get_curdir>
8040e080:	01c12083          	lw	ra,28(sp)
8040e084:	01812403          	lw	s0,24(sp)
8040e088:	01412483          	lw	s1,20(sp)
8040e08c:	01012903          	lw	s2,16(sp)
8040e090:	02010113          	addi	sp,sp,32
8040e094:	00008067          	ret
8040e098:	00278793          	addi	a5,a5,2
8040e09c:	00068023          	sb	zero,0(a3)
8040e0a0:	00f407b3          	add	a5,s0,a5
8040e0a4:	02f00693          	li	a3,47
8040e0a8:	00078513          	mv	a0,a5
8040e0ac:	00178793          	addi	a5,a5,1
8040e0b0:	fff7c703          	lbu	a4,-1(a5)
8040e0b4:	fed70ae3          	beq	a4,a3,8040e0a8 <get_device+0x9c>
8040e0b8:	00a92023          	sw	a0,0(s2)
8040e0bc:	00048593          	mv	a1,s1
8040e0c0:	00040513          	mv	a0,s0
8040e0c4:	a3dff0ef          	jal	ra,8040db00 <vfs_get_root>
8040e0c8:	01c12083          	lw	ra,28(sp)
8040e0cc:	01812403          	lw	s0,24(sp)
8040e0d0:	01412483          	lw	s1,20(sp)
8040e0d4:	01012903          	lw	s2,16(sp)
8040e0d8:	02010113          	addi	sp,sp,32
8040e0dc:	00008067          	ret
8040e0e0:	00c10513          	addi	a0,sp,12
8040e0e4:	1bc000ef          	jal	ra,8040e2a0 <vfs_get_curdir>
8040e0e8:	fe0510e3          	bnez	a0,8040e0c8 <get_device+0xbc>
8040e0ec:	00c12783          	lw	a5,12(sp)
8040e0f0:	0387a503          	lw	a0,56(a5)
8040e0f4:	04050c63          	beqz	a0,8040e14c <get_device+0x140>
8040e0f8:	07452783          	lw	a5,116(a0)
8040e0fc:	000780e7          	jalr	a5
8040e100:	00a4a023          	sw	a0,0(s1)
8040e104:	00c12503          	lw	a0,12(sp)
8040e108:	bb4ff0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040e10c:	02f00713          	li	a4,47
8040e110:	00140413          	addi	s0,s0,1
8040e114:	00044783          	lbu	a5,0(s0)
8040e118:	fee78ce3          	beq	a5,a4,8040e110 <get_device+0x104>
8040e11c:	00892023          	sw	s0,0(s2)
8040e120:	01c12083          	lw	ra,28(sp)
8040e124:	01812403          	lw	s0,24(sp)
8040e128:	01412483          	lw	s1,20(sp)
8040e12c:	01012903          	lw	s2,16(sp)
8040e130:	00000513          	li	a0,0
8040e134:	02010113          	addi	sp,sp,32
8040e138:	00008067          	ret
8040e13c:	00060513          	mv	a0,a2
8040e140:	e58ff0ef          	jal	ra,8040d798 <vfs_get_bootfs>
8040e144:	fc0504e3          	beqz	a0,8040e10c <get_device+0x100>
8040e148:	f81ff06f          	j	8040e0c8 <get_device+0xbc>
8040e14c:	00007697          	auipc	a3,0x7
8040e150:	24468693          	addi	a3,a3,580 # 80415390 <syscalls+0x8cc>
8040e154:	00005617          	auipc	a2,0x5
8040e158:	a9460613          	addi	a2,a2,-1388 # 80412be8 <commands+0x1bc>
8040e15c:	03900593          	li	a1,57
8040e160:	00007517          	auipc	a0,0x7
8040e164:	24450513          	addi	a0,a0,580 # 804153a4 <syscalls+0x8e0>
8040e168:	cbcf20ef          	jal	ra,80400624 <__panic>

8040e16c <vfs_lookup>:
8040e16c:	fd010113          	addi	sp,sp,-48
8040e170:	03212023          	sw	s2,32(sp)
8040e174:	01c10613          	addi	a2,sp,28
8040e178:	00058913          	mv	s2,a1
8040e17c:	00c10593          	addi	a1,sp,12
8040e180:	02812423          	sw	s0,40(sp)
8040e184:	02112623          	sw	ra,44(sp)
8040e188:	02912223          	sw	s1,36(sp)
8040e18c:	00a12623          	sw	a0,12(sp)
8040e190:	e7dff0ef          	jal	ra,8040e00c <get_device>
8040e194:	00050413          	mv	s0,a0
8040e198:	04051e63          	bnez	a0,8040e1f4 <vfs_lookup+0x88>
8040e19c:	00c12783          	lw	a5,12(sp)
8040e1a0:	01c12483          	lw	s1,28(sp)
8040e1a4:	0007c783          	lbu	a5,0(a5)
8040e1a8:	06078463          	beqz	a5,8040e210 <vfs_lookup+0xa4>
8040e1ac:	08048263          	beqz	s1,8040e230 <vfs_lookup+0xc4>
8040e1b0:	03c4a783          	lw	a5,60(s1)
8040e1b4:	06078e63          	beqz	a5,8040e230 <vfs_lookup+0xc4>
8040e1b8:	0387a783          	lw	a5,56(a5)
8040e1bc:	06078a63          	beqz	a5,8040e230 <vfs_lookup+0xc4>
8040e1c0:	00048513          	mv	a0,s1
8040e1c4:	00007597          	auipc	a1,0x7
8040e1c8:	24858593          	addi	a1,a1,584 # 8041540c <syscalls+0x948>
8040e1cc:	a24ff0ef          	jal	ra,8040d3f0 <inode_check>
8040e1d0:	03c4a783          	lw	a5,60(s1)
8040e1d4:	00c12583          	lw	a1,12(sp)
8040e1d8:	01c12503          	lw	a0,28(sp)
8040e1dc:	0387a783          	lw	a5,56(a5)
8040e1e0:	00090613          	mv	a2,s2
8040e1e4:	000780e7          	jalr	a5
8040e1e8:	00050413          	mv	s0,a0
8040e1ec:	01c12503          	lw	a0,28(sp)
8040e1f0:	accff0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040e1f4:	00040513          	mv	a0,s0
8040e1f8:	02c12083          	lw	ra,44(sp)
8040e1fc:	02812403          	lw	s0,40(sp)
8040e200:	02412483          	lw	s1,36(sp)
8040e204:	02012903          	lw	s2,32(sp)
8040e208:	03010113          	addi	sp,sp,48
8040e20c:	00008067          	ret
8040e210:	00040513          	mv	a0,s0
8040e214:	02c12083          	lw	ra,44(sp)
8040e218:	02812403          	lw	s0,40(sp)
8040e21c:	00992023          	sw	s1,0(s2)
8040e220:	02412483          	lw	s1,36(sp)
8040e224:	02012903          	lw	s2,32(sp)
8040e228:	03010113          	addi	sp,sp,48
8040e22c:	00008067          	ret
8040e230:	00007697          	auipc	a3,0x7
8040e234:	18c68693          	addi	a3,a3,396 # 804153bc <syscalls+0x8f8>
8040e238:	00005617          	auipc	a2,0x5
8040e23c:	9b060613          	addi	a2,a2,-1616 # 80412be8 <commands+0x1bc>
8040e240:	04f00593          	li	a1,79
8040e244:	00007517          	auipc	a0,0x7
8040e248:	16050513          	addi	a0,a0,352 # 804153a4 <syscalls+0x8e0>
8040e24c:	bd8f20ef          	jal	ra,80400624 <__panic>

8040e250 <vfs_lookup_parent>:
8040e250:	fd010113          	addi	sp,sp,-48
8040e254:	02812423          	sw	s0,40(sp)
8040e258:	02912223          	sw	s1,36(sp)
8040e25c:	00058413          	mv	s0,a1
8040e260:	00060493          	mv	s1,a2
8040e264:	00c10593          	addi	a1,sp,12
8040e268:	01c10613          	addi	a2,sp,28
8040e26c:	02112623          	sw	ra,44(sp)
8040e270:	00a12623          	sw	a0,12(sp)
8040e274:	d99ff0ef          	jal	ra,8040e00c <get_device>
8040e278:	00051a63          	bnez	a0,8040e28c <vfs_lookup_parent+0x3c>
8040e27c:	00c12783          	lw	a5,12(sp)
8040e280:	00f4a023          	sw	a5,0(s1)
8040e284:	01c12783          	lw	a5,28(sp)
8040e288:	00f42023          	sw	a5,0(s0)
8040e28c:	02c12083          	lw	ra,44(sp)
8040e290:	02812403          	lw	s0,40(sp)
8040e294:	02412483          	lw	s1,36(sp)
8040e298:	03010113          	addi	sp,sp,48
8040e29c:	00008067          	ret

8040e2a0 <vfs_get_curdir>:
8040e2a0:	0008e797          	auipc	a5,0x8e
8040e2a4:	50c78793          	addi	a5,a5,1292 # 8049c7ac <current>
8040e2a8:	0007a783          	lw	a5,0(a5)
8040e2ac:	ff010113          	addi	sp,sp,-16
8040e2b0:	00812423          	sw	s0,8(sp)
8040e2b4:	0dc7a783          	lw	a5,220(a5)
8040e2b8:	00112623          	sw	ra,12(sp)
8040e2bc:	00912223          	sw	s1,4(sp)
8040e2c0:	0007a403          	lw	s0,0(a5)
8040e2c4:	02040663          	beqz	s0,8040e2f0 <vfs_get_curdir+0x50>
8040e2c8:	00050493          	mv	s1,a0
8040e2cc:	00040513          	mv	a0,s0
8040e2d0:	8f8ff0ef          	jal	ra,8040d3c8 <inode_ref_inc>
8040e2d4:	00000513          	li	a0,0
8040e2d8:	0084a023          	sw	s0,0(s1)
8040e2dc:	00c12083          	lw	ra,12(sp)
8040e2e0:	00812403          	lw	s0,8(sp)
8040e2e4:	00412483          	lw	s1,4(sp)
8040e2e8:	01010113          	addi	sp,sp,16
8040e2ec:	00008067          	ret
8040e2f0:	ff000513          	li	a0,-16
8040e2f4:	fe9ff06f          	j	8040e2dc <vfs_get_curdir+0x3c>

8040e2f8 <vfs_set_curdir>:
8040e2f8:	fd010113          	addi	sp,sp,-48
8040e2fc:	02912223          	sw	s1,36(sp)
8040e300:	0008e497          	auipc	s1,0x8e
8040e304:	4ac48493          	addi	s1,s1,1196 # 8049c7ac <current>
8040e308:	0004a783          	lw	a5,0(s1)
8040e30c:	02812423          	sw	s0,40(sp)
8040e310:	00050413          	mv	s0,a0
8040e314:	0dc7a503          	lw	a0,220(a5)
8040e318:	01312e23          	sw	s3,28(sp)
8040e31c:	02112623          	sw	ra,44(sp)
8040e320:	03212023          	sw	s2,32(sp)
8040e324:	f41f70ef          	jal	ra,80406264 <lock_files>
8040e328:	0004a783          	lw	a5,0(s1)
8040e32c:	0dc7a503          	lw	a0,220(a5)
8040e330:	00052983          	lw	s3,0(a0)
8040e334:	0b340863          	beq	s0,s3,8040e3e4 <vfs_set_curdir+0xec>
8040e338:	08040a63          	beqz	s0,8040e3cc <vfs_set_curdir+0xd4>
8040e33c:	03c42783          	lw	a5,60(s0)
8040e340:	0a078663          	beqz	a5,8040e3ec <vfs_set_curdir+0xf4>
8040e344:	0287a783          	lw	a5,40(a5)
8040e348:	0a078263          	beqz	a5,8040e3ec <vfs_set_curdir+0xf4>
8040e34c:	00007597          	auipc	a1,0x7
8040e350:	19058593          	addi	a1,a1,400 # 804154dc <syscalls+0xa18>
8040e354:	00040513          	mv	a0,s0
8040e358:	898ff0ef          	jal	ra,8040d3f0 <inode_check>
8040e35c:	03c42783          	lw	a5,60(s0)
8040e360:	00c10593          	addi	a1,sp,12
8040e364:	00040513          	mv	a0,s0
8040e368:	0287a783          	lw	a5,40(a5)
8040e36c:	000780e7          	jalr	a5
8040e370:	00050913          	mv	s2,a0
8040e374:	00051e63          	bnez	a0,8040e390 <vfs_set_curdir+0x98>
8040e378:	00c12683          	lw	a3,12(sp)
8040e37c:	000077b7          	lui	a5,0x7
8040e380:	00002737          	lui	a4,0x2
8040e384:	00d7f7b3          	and	a5,a5,a3
8040e388:	fee00913          	li	s2,-18
8040e38c:	02e78863          	beq	a5,a4,8040e3bc <vfs_set_curdir+0xc4>
8040e390:	0004a783          	lw	a5,0(s1)
8040e394:	0dc7a503          	lw	a0,220(a5) # 70dc <_binary_bin_swap_img_size-0xf24>
8040e398:	ed5f70ef          	jal	ra,8040626c <unlock_files>
8040e39c:	02c12083          	lw	ra,44(sp)
8040e3a0:	02812403          	lw	s0,40(sp)
8040e3a4:	00090513          	mv	a0,s2
8040e3a8:	02412483          	lw	s1,36(sp)
8040e3ac:	02012903          	lw	s2,32(sp)
8040e3b0:	01c12983          	lw	s3,28(sp)
8040e3b4:	03010113          	addi	sp,sp,48
8040e3b8:	00008067          	ret
8040e3bc:	00040513          	mv	a0,s0
8040e3c0:	808ff0ef          	jal	ra,8040d3c8 <inode_ref_inc>
8040e3c4:	0004a783          	lw	a5,0(s1)
8040e3c8:	0dc7a503          	lw	a0,220(a5)
8040e3cc:	00852023          	sw	s0,0(a0)
8040e3d0:	00000913          	li	s2,0
8040e3d4:	fc0982e3          	beqz	s3,8040e398 <vfs_set_curdir+0xa0>
8040e3d8:	00098513          	mv	a0,s3
8040e3dc:	8e0ff0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040e3e0:	fb1ff06f          	j	8040e390 <vfs_set_curdir+0x98>
8040e3e4:	00000913          	li	s2,0
8040e3e8:	fb1ff06f          	j	8040e398 <vfs_set_curdir+0xa0>
8040e3ec:	00007697          	auipc	a3,0x7
8040e3f0:	08868693          	addi	a3,a3,136 # 80415474 <syscalls+0x9b0>
8040e3f4:	00004617          	auipc	a2,0x4
8040e3f8:	7f460613          	addi	a2,a2,2036 # 80412be8 <commands+0x1bc>
8040e3fc:	04300593          	li	a1,67
8040e400:	00007517          	auipc	a0,0x7
8040e404:	0c450513          	addi	a0,a0,196 # 804154c4 <syscalls+0xa00>
8040e408:	a1cf20ef          	jal	ra,80400624 <__panic>

8040e40c <vfs_chdir>:
8040e40c:	fe010113          	addi	sp,sp,-32
8040e410:	00c10593          	addi	a1,sp,12
8040e414:	00812c23          	sw	s0,24(sp)
8040e418:	00112e23          	sw	ra,28(sp)
8040e41c:	d51ff0ef          	jal	ra,8040e16c <vfs_lookup>
8040e420:	00050413          	mv	s0,a0
8040e424:	00050c63          	beqz	a0,8040e43c <vfs_chdir+0x30>
8040e428:	00040513          	mv	a0,s0
8040e42c:	01c12083          	lw	ra,28(sp)
8040e430:	01812403          	lw	s0,24(sp)
8040e434:	02010113          	addi	sp,sp,32
8040e438:	00008067          	ret
8040e43c:	00c12503          	lw	a0,12(sp)
8040e440:	eb9ff0ef          	jal	ra,8040e2f8 <vfs_set_curdir>
8040e444:	00050413          	mv	s0,a0
8040e448:	00c12503          	lw	a0,12(sp)
8040e44c:	870ff0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040e450:	00040513          	mv	a0,s0
8040e454:	01c12083          	lw	ra,28(sp)
8040e458:	01812403          	lw	s0,24(sp)
8040e45c:	02010113          	addi	sp,sp,32
8040e460:	00008067          	ret

8040e464 <vfs_getcwd>:
8040e464:	0008e797          	auipc	a5,0x8e
8040e468:	34878793          	addi	a5,a5,840 # 8049c7ac <current>
8040e46c:	0007a783          	lw	a5,0(a5)
8040e470:	fe010113          	addi	sp,sp,-32
8040e474:	00812c23          	sw	s0,24(sp)
8040e478:	0dc7a783          	lw	a5,220(a5)
8040e47c:	00112e23          	sw	ra,28(sp)
8040e480:	00912a23          	sw	s1,20(sp)
8040e484:	0007a403          	lw	s0,0(a5)
8040e488:	01212823          	sw	s2,16(sp)
8040e48c:	0c040663          	beqz	s0,8040e558 <vfs_getcwd+0xf4>
8040e490:	00050493          	mv	s1,a0
8040e494:	00040513          	mv	a0,s0
8040e498:	f31fe0ef          	jal	ra,8040d3c8 <inode_ref_inc>
8040e49c:	03842503          	lw	a0,56(s0)
8040e4a0:	0c050063          	beqz	a0,8040e560 <vfs_getcwd+0xfc>
8040e4a4:	f5cff0ef          	jal	ra,8040dc00 <vfs_get_devname>
8040e4a8:	00050913          	mv	s2,a0
8040e4ac:	228040ef          	jal	ra,804126d4 <strlen>
8040e4b0:	00050613          	mv	a2,a0
8040e4b4:	00090593          	mv	a1,s2
8040e4b8:	00000713          	li	a4,0
8040e4bc:	00100693          	li	a3,1
8040e4c0:	00048513          	mv	a0,s1
8040e4c4:	8a0f80ef          	jal	ra,80406564 <iobuf_move>
8040e4c8:	00050913          	mv	s2,a0
8040e4cc:	02050463          	beqz	a0,8040e4f4 <vfs_getcwd+0x90>
8040e4d0:	00040513          	mv	a0,s0
8040e4d4:	fe9fe0ef          	jal	ra,8040d4bc <inode_ref_dec>
8040e4d8:	01c12083          	lw	ra,28(sp)
8040e4dc:	01812403          	lw	s0,24(sp)
8040e4e0:	00090513          	mv	a0,s2
8040e4e4:	01412483          	lw	s1,20(sp)
8040e4e8:	01012903          	lw	s2,16(sp)
8040e4ec:	02010113          	addi	sp,sp,32
8040e4f0:	00008067          	ret
8040e4f4:	03a00793          	li	a5,58
8040e4f8:	00000713          	li	a4,0
8040e4fc:	00100693          	li	a3,1
8040e500:	00100613          	li	a2,1
8040e504:	00f10593          	addi	a1,sp,15
8040e508:	00048513          	mv	a0,s1
8040e50c:	00f107a3          	sb	a5,15(sp)
8040e510:	854f80ef          	jal	ra,80406564 <iobuf_move>
8040e514:	00050913          	mv	s2,a0
8040e518:	fa051ce3          	bnez	a0,8040e4d0 <vfs_getcwd+0x6c>
8040e51c:	03c42783          	lw	a5,60(s0)
8040e520:	06078063          	beqz	a5,8040e580 <vfs_getcwd+0x11c>
8040e524:	01c7a783          	lw	a5,28(a5)
8040e528:	04078c63          	beqz	a5,8040e580 <vfs_getcwd+0x11c>
8040e52c:	00007597          	auipc	a1,0x7
8040e530:	f3c58593          	addi	a1,a1,-196 # 80415468 <syscalls+0x9a4>
8040e534:	00040513          	mv	a0,s0
8040e538:	eb9fe0ef          	jal	ra,8040d3f0 <inode_check>
8040e53c:	03c42783          	lw	a5,60(s0)
8040e540:	00048593          	mv	a1,s1
8040e544:	00040513          	mv	a0,s0
8040e548:	01c7a783          	lw	a5,28(a5)
8040e54c:	000780e7          	jalr	a5
8040e550:	00050913          	mv	s2,a0
8040e554:	f7dff06f          	j	8040e4d0 <vfs_getcwd+0x6c>
8040e558:	ff000913          	li	s2,-16
8040e55c:	f7dff06f          	j	8040e4d8 <vfs_getcwd+0x74>
8040e560:	00007697          	auipc	a3,0x7
8040e564:	e3068693          	addi	a3,a3,-464 # 80415390 <syscalls+0x8cc>
8040e568:	00004617          	auipc	a2,0x4
8040e56c:	68060613          	addi	a2,a2,1664 # 80412be8 <commands+0x1bc>
8040e570:	06e00593          	li	a1,110
8040e574:	00007517          	auipc	a0,0x7
8040e578:	f5050513          	addi	a0,a0,-176 # 804154c4 <syscalls+0xa00>
8040e57c:	8a8f20ef          	jal	ra,80400624 <__panic>
8040e580:	00007697          	auipc	a3,0x7
8040e584:	e9468693          	addi	a3,a3,-364 # 80415414 <syscalls+0x950>
8040e588:	00004617          	auipc	a2,0x4
8040e58c:	66060613          	addi	a2,a2,1632 # 80412be8 <commands+0x1bc>
8040e590:	07800593          	li	a1,120
8040e594:	00007517          	auipc	a0,0x7
8040e598:	f3050513          	addi	a0,a0,-208 # 804154c4 <syscalls+0xa00>
8040e59c:	888f20ef          	jal	ra,80400624 <__panic>

8040e5a0 <dev_lookup>:
8040e5a0:	0005c703          	lbu	a4,0(a1)
8040e5a4:	02071e63          	bnez	a4,8040e5e0 <dev_lookup+0x40>
8040e5a8:	ff010113          	addi	sp,sp,-16
8040e5ac:	00812423          	sw	s0,8(sp)
8040e5b0:	00912223          	sw	s1,4(sp)
8040e5b4:	00112623          	sw	ra,12(sp)
8040e5b8:	00050493          	mv	s1,a0
8040e5bc:	00060413          	mv	s0,a2
8040e5c0:	e09fe0ef          	jal	ra,8040d3c8 <inode_ref_inc>
8040e5c4:	00c12083          	lw	ra,12(sp)
8040e5c8:	00942023          	sw	s1,0(s0)
8040e5cc:	00812403          	lw	s0,8(sp)
8040e5d0:	00412483          	lw	s1,4(sp)
8040e5d4:	00000513          	li	a0,0
8040e5d8:	01010113          	addi	sp,sp,16
8040e5dc:	00008067          	ret
8040e5e0:	ff000513          	li	a0,-16
8040e5e4:	00008067          	ret

8040e5e8 <dev_ioctl>:
8040e5e8:	00050e63          	beqz	a0,8040e604 <dev_ioctl+0x1c>
8040e5ec:	02c52683          	lw	a3,44(a0)
8040e5f0:	00001737          	lui	a4,0x1
8040e5f4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e5f8:	00e69663          	bne	a3,a4,8040e604 <dev_ioctl+0x1c>
8040e5fc:	01452303          	lw	t1,20(a0)
8040e600:	00030067          	jr	t1
8040e604:	ff010113          	addi	sp,sp,-16
8040e608:	00007697          	auipc	a3,0x7
8040e60c:	bf868693          	addi	a3,a3,-1032 # 80415200 <syscalls+0x73c>
8040e610:	00004617          	auipc	a2,0x4
8040e614:	5d860613          	addi	a2,a2,1496 # 80412be8 <commands+0x1bc>
8040e618:	03500593          	li	a1,53
8040e61c:	00007517          	auipc	a0,0x7
8040e620:	ec850513          	addi	a0,a0,-312 # 804154e4 <syscalls+0xa20>
8040e624:	00112623          	sw	ra,12(sp)
8040e628:	ffdf10ef          	jal	ra,80400624 <__panic>

8040e62c <dev_tryseek>:
8040e62c:	ff010113          	addi	sp,sp,-16
8040e630:	00112623          	sw	ra,12(sp)
8040e634:	00812423          	sw	s0,8(sp)
8040e638:	00912223          	sw	s1,4(sp)
8040e63c:	01212023          	sw	s2,0(sp)
8040e640:	06050663          	beqz	a0,8040e6ac <dev_tryseek+0x80>
8040e644:	02c52703          	lw	a4,44(a0)
8040e648:	000017b7          	lui	a5,0x1
8040e64c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e650:	04f71e63          	bne	a4,a5,8040e6ac <dev_tryseek+0x80>
8040e654:	00052483          	lw	s1,0(a0)
8040e658:	04048663          	beqz	s1,8040e6a4 <dev_tryseek+0x78>
8040e65c:	00452903          	lw	s2,4(a0)
8040e660:	00058413          	mv	s0,a1
8040e664:	00058513          	mv	a0,a1
8040e668:	00090593          	mv	a1,s2
8040e66c:	254040ef          	jal	ra,804128c0 <__umodsi3>
8040e670:	02051a63          	bnez	a0,8040e6a4 <dev_tryseek+0x78>
8040e674:	02044863          	bltz	s0,8040e6a4 <dev_tryseek+0x78>
8040e678:	00090593          	mv	a1,s2
8040e67c:	00048513          	mv	a0,s1
8040e680:	1cc040ef          	jal	ra,8041284c <__mulsi3>
8040e684:	02a47063          	bgeu	s0,a0,8040e6a4 <dev_tryseek+0x78>
8040e688:	00000513          	li	a0,0
8040e68c:	00c12083          	lw	ra,12(sp)
8040e690:	00812403          	lw	s0,8(sp)
8040e694:	00412483          	lw	s1,4(sp)
8040e698:	00012903          	lw	s2,0(sp)
8040e69c:	01010113          	addi	sp,sp,16
8040e6a0:	00008067          	ret
8040e6a4:	ffd00513          	li	a0,-3
8040e6a8:	fe5ff06f          	j	8040e68c <dev_tryseek+0x60>
8040e6ac:	00007697          	auipc	a3,0x7
8040e6b0:	b5468693          	addi	a3,a3,-1196 # 80415200 <syscalls+0x73c>
8040e6b4:	00004617          	auipc	a2,0x4
8040e6b8:	53460613          	addi	a2,a2,1332 # 80412be8 <commands+0x1bc>
8040e6bc:	05f00593          	li	a1,95
8040e6c0:	00007517          	auipc	a0,0x7
8040e6c4:	e2450513          	addi	a0,a0,-476 # 804154e4 <syscalls+0xa20>
8040e6c8:	f5df10ef          	jal	ra,80400624 <__panic>

8040e6cc <dev_gettype>:
8040e6cc:	02050e63          	beqz	a0,8040e708 <dev_gettype+0x3c>
8040e6d0:	02c52703          	lw	a4,44(a0)
8040e6d4:	000017b7          	lui	a5,0x1
8040e6d8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e6dc:	02f71663          	bne	a4,a5,8040e708 <dev_gettype+0x3c>
8040e6e0:	00052703          	lw	a4,0(a0)
8040e6e4:	000057b7          	lui	a5,0x5
8040e6e8:	00070863          	beqz	a4,8040e6f8 <dev_gettype+0x2c>
8040e6ec:	00f5a023          	sw	a5,0(a1)
8040e6f0:	00000513          	li	a0,0
8040e6f4:	00008067          	ret
8040e6f8:	000047b7          	lui	a5,0x4
8040e6fc:	00f5a023          	sw	a5,0(a1)
8040e700:	00000513          	li	a0,0
8040e704:	00008067          	ret
8040e708:	ff010113          	addi	sp,sp,-16
8040e70c:	00007697          	auipc	a3,0x7
8040e710:	af468693          	addi	a3,a3,-1292 # 80415200 <syscalls+0x73c>
8040e714:	00004617          	auipc	a2,0x4
8040e718:	4d460613          	addi	a2,a2,1236 # 80412be8 <commands+0x1bc>
8040e71c:	05300593          	li	a1,83
8040e720:	00007517          	auipc	a0,0x7
8040e724:	dc450513          	addi	a0,a0,-572 # 804154e4 <syscalls+0xa20>
8040e728:	00112623          	sw	ra,12(sp)
8040e72c:	ef9f10ef          	jal	ra,80400624 <__panic>

8040e730 <dev_write>:
8040e730:	02050063          	beqz	a0,8040e750 <dev_write+0x20>
8040e734:	02c52683          	lw	a3,44(a0)
8040e738:	00001737          	lui	a4,0x1
8040e73c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e740:	00e69863          	bne	a3,a4,8040e750 <dev_write+0x20>
8040e744:	01052303          	lw	t1,16(a0)
8040e748:	00100613          	li	a2,1
8040e74c:	00030067          	jr	t1
8040e750:	ff010113          	addi	sp,sp,-16
8040e754:	00007697          	auipc	a3,0x7
8040e758:	aac68693          	addi	a3,a3,-1364 # 80415200 <syscalls+0x73c>
8040e75c:	00004617          	auipc	a2,0x4
8040e760:	48c60613          	addi	a2,a2,1164 # 80412be8 <commands+0x1bc>
8040e764:	02c00593          	li	a1,44
8040e768:	00007517          	auipc	a0,0x7
8040e76c:	d7c50513          	addi	a0,a0,-644 # 804154e4 <syscalls+0xa20>
8040e770:	00112623          	sw	ra,12(sp)
8040e774:	eb1f10ef          	jal	ra,80400624 <__panic>

8040e778 <dev_read>:
8040e778:	02050063          	beqz	a0,8040e798 <dev_read+0x20>
8040e77c:	02c52683          	lw	a3,44(a0)
8040e780:	00001737          	lui	a4,0x1
8040e784:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e788:	00e69863          	bne	a3,a4,8040e798 <dev_read+0x20>
8040e78c:	01052303          	lw	t1,16(a0)
8040e790:	00000613          	li	a2,0
8040e794:	00030067          	jr	t1
8040e798:	ff010113          	addi	sp,sp,-16
8040e79c:	00007697          	auipc	a3,0x7
8040e7a0:	a6468693          	addi	a3,a3,-1436 # 80415200 <syscalls+0x73c>
8040e7a4:	00004617          	auipc	a2,0x4
8040e7a8:	44460613          	addi	a2,a2,1092 # 80412be8 <commands+0x1bc>
8040e7ac:	02300593          	li	a1,35
8040e7b0:	00007517          	auipc	a0,0x7
8040e7b4:	d3450513          	addi	a0,a0,-716 # 804154e4 <syscalls+0xa20>
8040e7b8:	00112623          	sw	ra,12(sp)
8040e7bc:	e69f10ef          	jal	ra,80400624 <__panic>

8040e7c0 <dev_close>:
8040e7c0:	00050e63          	beqz	a0,8040e7dc <dev_close+0x1c>
8040e7c4:	02c52683          	lw	a3,44(a0)
8040e7c8:	00001737          	lui	a4,0x1
8040e7cc:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e7d0:	00e69663          	bne	a3,a4,8040e7dc <dev_close+0x1c>
8040e7d4:	00c52303          	lw	t1,12(a0)
8040e7d8:	00030067          	jr	t1
8040e7dc:	ff010113          	addi	sp,sp,-16
8040e7e0:	00007697          	auipc	a3,0x7
8040e7e4:	a2068693          	addi	a3,a3,-1504 # 80415200 <syscalls+0x73c>
8040e7e8:	00004617          	auipc	a2,0x4
8040e7ec:	40060613          	addi	a2,a2,1024 # 80412be8 <commands+0x1bc>
8040e7f0:	01a00593          	li	a1,26
8040e7f4:	00007517          	auipc	a0,0x7
8040e7f8:	cf050513          	addi	a0,a0,-784 # 804154e4 <syscalls+0xa20>
8040e7fc:	00112623          	sw	ra,12(sp)
8040e800:	e25f10ef          	jal	ra,80400624 <__panic>

8040e804 <dev_open>:
8040e804:	03c5f713          	andi	a4,a1,60
8040e808:	02071063          	bnez	a4,8040e828 <dev_open+0x24>
8040e80c:	02050263          	beqz	a0,8040e830 <dev_open+0x2c>
8040e810:	02c52683          	lw	a3,44(a0)
8040e814:	00001737          	lui	a4,0x1
8040e818:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e81c:	00e69a63          	bne	a3,a4,8040e830 <dev_open+0x2c>
8040e820:	00852303          	lw	t1,8(a0)
8040e824:	00030067          	jr	t1
8040e828:	ffd00513          	li	a0,-3
8040e82c:	00008067          	ret
8040e830:	ff010113          	addi	sp,sp,-16
8040e834:	00007697          	auipc	a3,0x7
8040e838:	9cc68693          	addi	a3,a3,-1588 # 80415200 <syscalls+0x73c>
8040e83c:	00004617          	auipc	a2,0x4
8040e840:	3ac60613          	addi	a2,a2,940 # 80412be8 <commands+0x1bc>
8040e844:	01100593          	li	a1,17
8040e848:	00007517          	auipc	a0,0x7
8040e84c:	c9c50513          	addi	a0,a0,-868 # 804154e4 <syscalls+0xa20>
8040e850:	00112623          	sw	ra,12(sp)
8040e854:	dd1f10ef          	jal	ra,80400624 <__panic>

8040e858 <dev_fstat>:
8040e858:	ff010113          	addi	sp,sp,-16
8040e85c:	00912223          	sw	s1,4(sp)
8040e860:	00058493          	mv	s1,a1
8040e864:	00812423          	sw	s0,8(sp)
8040e868:	01000613          	li	a2,16
8040e86c:	00050413          	mv	s0,a0
8040e870:	00000593          	li	a1,0
8040e874:	00048513          	mv	a0,s1
8040e878:	00112623          	sw	ra,12(sp)
8040e87c:	01212023          	sw	s2,0(sp)
8040e880:	739030ef          	jal	ra,804127b8 <memset>
8040e884:	08040463          	beqz	s0,8040e90c <dev_fstat+0xb4>
8040e888:	03c42783          	lw	a5,60(s0)
8040e88c:	08078063          	beqz	a5,8040e90c <dev_fstat+0xb4>
8040e890:	0287a783          	lw	a5,40(a5) # 4028 <_binary_bin_swap_img_size-0x3fd8>
8040e894:	06078c63          	beqz	a5,8040e90c <dev_fstat+0xb4>
8040e898:	00007597          	auipc	a1,0x7
8040e89c:	c4458593          	addi	a1,a1,-956 # 804154dc <syscalls+0xa18>
8040e8a0:	00040513          	mv	a0,s0
8040e8a4:	b4dfe0ef          	jal	ra,8040d3f0 <inode_check>
8040e8a8:	03c42783          	lw	a5,60(s0)
8040e8ac:	00048593          	mv	a1,s1
8040e8b0:	00040513          	mv	a0,s0
8040e8b4:	0287a783          	lw	a5,40(a5)
8040e8b8:	000780e7          	jalr	a5
8040e8bc:	00050913          	mv	s2,a0
8040e8c0:	02051863          	bnez	a0,8040e8f0 <dev_fstat+0x98>
8040e8c4:	02c42703          	lw	a4,44(s0)
8040e8c8:	000017b7          	lui	a5,0x1
8040e8cc:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e8d0:	04f71e63          	bne	a4,a5,8040e92c <dev_fstat+0xd4>
8040e8d4:	00042583          	lw	a1,0(s0)
8040e8d8:	00442503          	lw	a0,4(s0)
8040e8dc:	00100793          	li	a5,1
8040e8e0:	00f4a223          	sw	a5,4(s1)
8040e8e4:	00b4a423          	sw	a1,8(s1)
8040e8e8:	765030ef          	jal	ra,8041284c <__mulsi3>
8040e8ec:	00a4a623          	sw	a0,12(s1)
8040e8f0:	00c12083          	lw	ra,12(sp)
8040e8f4:	00812403          	lw	s0,8(sp)
8040e8f8:	00090513          	mv	a0,s2
8040e8fc:	00412483          	lw	s1,4(sp)
8040e900:	00012903          	lw	s2,0(sp)
8040e904:	01010113          	addi	sp,sp,16
8040e908:	00008067          	ret
8040e90c:	00007697          	auipc	a3,0x7
8040e910:	b6868693          	addi	a3,a3,-1176 # 80415474 <syscalls+0x9b0>
8040e914:	00004617          	auipc	a2,0x4
8040e918:	2d460613          	addi	a2,a2,724 # 80412be8 <commands+0x1bc>
8040e91c:	04200593          	li	a1,66
8040e920:	00007517          	auipc	a0,0x7
8040e924:	bc450513          	addi	a0,a0,-1084 # 804154e4 <syscalls+0xa20>
8040e928:	cfdf10ef          	jal	ra,80400624 <__panic>
8040e92c:	00007697          	auipc	a3,0x7
8040e930:	8d468693          	addi	a3,a3,-1836 # 80415200 <syscalls+0x73c>
8040e934:	00004617          	auipc	a2,0x4
8040e938:	2b460613          	addi	a2,a2,692 # 80412be8 <commands+0x1bc>
8040e93c:	04500593          	li	a1,69
8040e940:	00007517          	auipc	a0,0x7
8040e944:	ba450513          	addi	a0,a0,-1116 # 804154e4 <syscalls+0xa20>
8040e948:	cddf10ef          	jal	ra,80400624 <__panic>

8040e94c <dev_init>:
8040e94c:	ff010113          	addi	sp,sp,-16
8040e950:	00112623          	sw	ra,12(sp)
8040e954:	700000ef          	jal	ra,8040f054 <dev_init_stdin>
8040e958:	081000ef          	jal	ra,8040f1d8 <dev_init_stdout>
8040e95c:	00c12083          	lw	ra,12(sp)
8040e960:	01010113          	addi	sp,sp,16
8040e964:	2bc0006f          	j	8040ec20 <dev_init_disk0>

8040e968 <dev_create_inode>:
8040e968:	00001537          	lui	a0,0x1
8040e96c:	ff010113          	addi	sp,sp,-16
8040e970:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e974:	00812423          	sw	s0,8(sp)
8040e978:	00112623          	sw	ra,12(sp)
8040e97c:	9a1fe0ef          	jal	ra,8040d31c <__alloc_inode>
8040e980:	00050413          	mv	s0,a0
8040e984:	00050a63          	beqz	a0,8040e998 <dev_create_inode+0x30>
8040e988:	00000613          	li	a2,0
8040e98c:	00007597          	auipc	a1,0x7
8040e990:	b6c58593          	addi	a1,a1,-1172 # 804154f8 <dev_node_ops>
8040e994:	9b9fe0ef          	jal	ra,8040d34c <inode_init>
8040e998:	00040513          	mv	a0,s0
8040e99c:	00c12083          	lw	ra,12(sp)
8040e9a0:	00812403          	lw	s0,8(sp)
8040e9a4:	01010113          	addi	sp,sp,16
8040e9a8:	00008067          	ret

8040e9ac <disk0_open>:
8040e9ac:	00000513          	li	a0,0
8040e9b0:	00008067          	ret

8040e9b4 <disk0_close>:
8040e9b4:	00000513          	li	a0,0
8040e9b8:	00008067          	ret

8040e9bc <disk0_ioctl>:
8040e9bc:	fec00513          	li	a0,-20
8040e9c0:	00008067          	ret

8040e9c4 <disk0_io>:
8040e9c4:	fc010113          	addi	sp,sp,-64
8040e9c8:	0045a703          	lw	a4,4(a1)
8040e9cc:	02812c23          	sw	s0,56(sp)
8040e9d0:	00c5a403          	lw	s0,12(a1)
8040e9d4:	000016b7          	lui	a3,0x1
8040e9d8:	03312623          	sw	s3,44(sp)
8040e9dc:	03612023          	sw	s6,32(sp)
8040e9e0:	41f75993          	srai	s3,a4,0x1f
8040e9e4:	fff68b13          	addi	s6,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040e9e8:	008767b3          	or	a5,a4,s0
8040e9ec:	0169f9b3          	and	s3,s3,s6
8040e9f0:	02112e23          	sw	ra,60(sp)
8040e9f4:	02912a23          	sw	s1,52(sp)
8040e9f8:	03212823          	sw	s2,48(sp)
8040e9fc:	03412423          	sw	s4,40(sp)
8040ea00:	03512223          	sw	s5,36(sp)
8040ea04:	01712e23          	sw	s7,28(sp)
8040ea08:	01812c23          	sw	s8,24(sp)
8040ea0c:	01912a23          	sw	s9,20(sp)
8040ea10:	01a12823          	sw	s10,16(sp)
8040ea14:	0167f7b3          	and	a5,a5,s6
8040ea18:	00e989b3          	add	s3,s3,a4
8040ea1c:	16079263          	bnez	a5,8040eb80 <disk0_io+0x1bc>
8040ea20:	00052783          	lw	a5,0(a0)
8040ea24:	40c9d993          	srai	s3,s3,0xc
8040ea28:	00c45713          	srli	a4,s0,0xc
8040ea2c:	00e98733          	add	a4,s3,a4
8040ea30:	14e7e863          	bltu	a5,a4,8040eb80 <disk0_io+0x1bc>
8040ea34:	00000513          	li	a0,0
8040ea38:	02d47e63          	bgeu	s0,a3,8040ea74 <disk0_io+0xb0>
8040ea3c:	03c12083          	lw	ra,60(sp)
8040ea40:	03812403          	lw	s0,56(sp)
8040ea44:	03412483          	lw	s1,52(sp)
8040ea48:	03012903          	lw	s2,48(sp)
8040ea4c:	02c12983          	lw	s3,44(sp)
8040ea50:	02812a03          	lw	s4,40(sp)
8040ea54:	02412a83          	lw	s5,36(sp)
8040ea58:	02012b03          	lw	s6,32(sp)
8040ea5c:	01c12b83          	lw	s7,28(sp)
8040ea60:	01812c03          	lw	s8,24(sp)
8040ea64:	01412c83          	lw	s9,20(sp)
8040ea68:	01012d03          	lw	s10,16(sp)
8040ea6c:	04010113          	addi	sp,sp,64
8040ea70:	00008067          	ret
8040ea74:	0008d517          	auipc	a0,0x8d
8040ea78:	d0050513          	addi	a0,a0,-768 # 8049b774 <disk0_sem>
8040ea7c:	00060c13          	mv	s8,a2
8040ea80:	00058b93          	mv	s7,a1
8040ea84:	0008ea17          	auipc	s4,0x8e
8040ea88:	d54a0a13          	addi	s4,s4,-684 # 8049c7d8 <disk0_buffer>
8040ea8c:	e70f60ef          	jal	ra,804050fc <down>
8040ea90:	00004cb7          	lui	s9,0x4
8040ea94:	0600006f          	j	8040eaf4 <disk0_io+0x130>
8040ea98:	00c45493          	srli	s1,s0,0xc
8040ea9c:	00349d13          	slli	s10,s1,0x3
8040eaa0:	00040913          	mv	s2,s0
8040eaa4:	00399a93          	slli	s5,s3,0x3
8040eaa8:	00058613          	mv	a2,a1
8040eaac:	000d0693          	mv	a3,s10
8040eab0:	000a8593          	mv	a1,s5
8040eab4:	00200513          	li	a0,2
8040eab8:	82cf20ef          	jal	ra,80400ae4 <ide_read_secs>
8040eabc:	10051663          	bnez	a0,8040ebc8 <disk0_io+0x204>
8040eac0:	000a2583          	lw	a1,0(s4)
8040eac4:	00c10713          	addi	a4,sp,12
8040eac8:	00100693          	li	a3,1
8040eacc:	00090613          	mv	a2,s2
8040ead0:	000b8513          	mv	a0,s7
8040ead4:	a91f70ef          	jal	ra,80406564 <iobuf_move>
8040ead8:	00c12783          	lw	a5,12(sp)
8040eadc:	0b279663          	bne	a5,s2,8040eb88 <disk0_io+0x1c4>
8040eae0:	016977b3          	and	a5,s2,s6
8040eae4:	0a079263          	bnez	a5,8040eb88 <disk0_io+0x1c4>
8040eae8:	41240433          	sub	s0,s0,s2
8040eaec:	009989b3          	add	s3,s3,s1
8040eaf0:	06040e63          	beqz	s0,8040eb6c <disk0_io+0x1a8>
8040eaf4:	000a2583          	lw	a1,0(s4)
8040eaf8:	000c1c63          	bnez	s8,8040eb10 <disk0_io+0x14c>
8040eafc:	f9946ee3          	bltu	s0,s9,8040ea98 <disk0_io+0xd4>
8040eb00:	02000d13          	li	s10,32
8040eb04:	00400493          	li	s1,4
8040eb08:	00004937          	lui	s2,0x4
8040eb0c:	f99ff06f          	j	8040eaa4 <disk0_io+0xe0>
8040eb10:	00c10713          	addi	a4,sp,12
8040eb14:	00000693          	li	a3,0
8040eb18:	00004637          	lui	a2,0x4
8040eb1c:	000b8513          	mv	a0,s7
8040eb20:	a45f70ef          	jal	ra,80406564 <iobuf_move>
8040eb24:	00c12483          	lw	s1,12(sp)
8040eb28:	08048063          	beqz	s1,8040eba8 <disk0_io+0x1e4>
8040eb2c:	06946e63          	bltu	s0,s1,8040eba8 <disk0_io+0x1e4>
8040eb30:	0164f7b3          	and	a5,s1,s6
8040eb34:	06079a63          	bnez	a5,8040eba8 <disk0_io+0x1e4>
8040eb38:	00c4d493          	srli	s1,s1,0xc
8040eb3c:	000a2603          	lw	a2,0(s4)
8040eb40:	00399913          	slli	s2,s3,0x3
8040eb44:	00349a93          	slli	s5,s1,0x3
8040eb48:	000a8693          	mv	a3,s5
8040eb4c:	00090593          	mv	a1,s2
8040eb50:	00200513          	li	a0,2
8040eb54:	828f20ef          	jal	ra,80400b7c <ide_write_secs>
8040eb58:	08051e63          	bnez	a0,8040ebf4 <disk0_io+0x230>
8040eb5c:	00c12903          	lw	s2,12(sp)
8040eb60:	009989b3          	add	s3,s3,s1
8040eb64:	41240433          	sub	s0,s0,s2
8040eb68:	f80416e3          	bnez	s0,8040eaf4 <disk0_io+0x130>
8040eb6c:	0008d517          	auipc	a0,0x8d
8040eb70:	c0850513          	addi	a0,a0,-1016 # 8049b774 <disk0_sem>
8040eb74:	d84f60ef          	jal	ra,804050f8 <up>
8040eb78:	00000513          	li	a0,0
8040eb7c:	ec1ff06f          	j	8040ea3c <disk0_io+0x78>
8040eb80:	ffd00513          	li	a0,-3
8040eb84:	eb9ff06f          	j	8040ea3c <disk0_io+0x78>
8040eb88:	00007697          	auipc	a3,0x7
8040eb8c:	b1c68693          	addi	a3,a3,-1252 # 804156a4 <dev_node_ops+0x1ac>
8040eb90:	00004617          	auipc	a2,0x4
8040eb94:	05860613          	addi	a2,a2,88 # 80412be8 <commands+0x1bc>
8040eb98:	06200593          	li	a1,98
8040eb9c:	00007517          	auipc	a0,0x7
8040eba0:	a5850513          	addi	a0,a0,-1448 # 804155f4 <dev_node_ops+0xfc>
8040eba4:	a81f10ef          	jal	ra,80400624 <__panic>
8040eba8:	00007697          	auipc	a3,0x7
8040ebac:	a0c68693          	addi	a3,a3,-1524 # 804155b4 <dev_node_ops+0xbc>
8040ebb0:	00004617          	auipc	a2,0x4
8040ebb4:	03860613          	addi	a2,a2,56 # 80412be8 <commands+0x1bc>
8040ebb8:	05700593          	li	a1,87
8040ebbc:	00007517          	auipc	a0,0x7
8040ebc0:	a3850513          	addi	a0,a0,-1480 # 804155f4 <dev_node_ops+0xfc>
8040ebc4:	a61f10ef          	jal	ra,80400624 <__panic>
8040ebc8:	00050893          	mv	a7,a0
8040ebcc:	000d0813          	mv	a6,s10
8040ebd0:	00048793          	mv	a5,s1
8040ebd4:	000a8713          	mv	a4,s5
8040ebd8:	00098693          	mv	a3,s3
8040ebdc:	00007617          	auipc	a2,0x7
8040ebe0:	a8060613          	addi	a2,a2,-1408 # 8041565c <dev_node_ops+0x164>
8040ebe4:	02e00593          	li	a1,46
8040ebe8:	00007517          	auipc	a0,0x7
8040ebec:	a0c50513          	addi	a0,a0,-1524 # 804155f4 <dev_node_ops+0xfc>
8040ebf0:	a35f10ef          	jal	ra,80400624 <__panic>
8040ebf4:	00050893          	mv	a7,a0
8040ebf8:	000a8813          	mv	a6,s5
8040ebfc:	00048793          	mv	a5,s1
8040ec00:	00090713          	mv	a4,s2
8040ec04:	00098693          	mv	a3,s3
8040ec08:	00007617          	auipc	a2,0x7
8040ec0c:	a0860613          	addi	a2,a2,-1528 # 80415610 <dev_node_ops+0x118>
8040ec10:	03800593          	li	a1,56
8040ec14:	00007517          	auipc	a0,0x7
8040ec18:	9e050513          	addi	a0,a0,-1568 # 804155f4 <dev_node_ops+0xfc>
8040ec1c:	a09f10ef          	jal	ra,80400624 <__panic>

8040ec20 <dev_init_disk0>:
8040ec20:	ff010113          	addi	sp,sp,-16
8040ec24:	00112623          	sw	ra,12(sp)
8040ec28:	00812423          	sw	s0,8(sp)
8040ec2c:	00912223          	sw	s1,4(sp)
8040ec30:	d39ff0ef          	jal	ra,8040e968 <dev_create_inode>
8040ec34:	0a050c63          	beqz	a0,8040ecec <dev_init_disk0+0xcc>
8040ec38:	02c52703          	lw	a4,44(a0)
8040ec3c:	000014b7          	lui	s1,0x1
8040ec40:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ec44:	00050413          	mv	s0,a0
8040ec48:	10f71463          	bne	a4,a5,8040ed50 <dev_init_disk0+0x130>
8040ec4c:	00200513          	li	a0,2
8040ec50:	e29f10ef          	jal	ra,80400a78 <ide_device_valid>
8040ec54:	0e050263          	beqz	a0,8040ed38 <dev_init_disk0+0x118>
8040ec58:	00200513          	li	a0,2
8040ec5c:	e51f10ef          	jal	ra,80400aac <ide_device_size>
8040ec60:	00355793          	srli	a5,a0,0x3
8040ec64:	00f42023          	sw	a5,0(s0)
8040ec68:	00000797          	auipc	a5,0x0
8040ec6c:	d4478793          	addi	a5,a5,-700 # 8040e9ac <disk0_open>
8040ec70:	00f42423          	sw	a5,8(s0)
8040ec74:	00000797          	auipc	a5,0x0
8040ec78:	d4078793          	addi	a5,a5,-704 # 8040e9b4 <disk0_close>
8040ec7c:	00f42623          	sw	a5,12(s0)
8040ec80:	00000797          	auipc	a5,0x0
8040ec84:	d4478793          	addi	a5,a5,-700 # 8040e9c4 <disk0_io>
8040ec88:	00f42823          	sw	a5,16(s0)
8040ec8c:	00000797          	auipc	a5,0x0
8040ec90:	d3078793          	addi	a5,a5,-720 # 8040e9bc <disk0_ioctl>
8040ec94:	00f42a23          	sw	a5,20(s0)
8040ec98:	00100593          	li	a1,1
8040ec9c:	0008d517          	auipc	a0,0x8d
8040eca0:	ad850513          	addi	a0,a0,-1320 # 8049b774 <disk0_sem>
8040eca4:	00942223          	sw	s1,4(s0)
8040eca8:	c44f60ef          	jal	ra,804050ec <sem_init>
8040ecac:	00004537          	lui	a0,0x4
8040ecb0:	d11f30ef          	jal	ra,804029c0 <kmalloc>
8040ecb4:	0008e797          	auipc	a5,0x8e
8040ecb8:	b2a7a223          	sw	a0,-1244(a5) # 8049c7d8 <disk0_buffer>
8040ecbc:	06050263          	beqz	a0,8040ed20 <dev_init_disk0+0x100>
8040ecc0:	00100613          	li	a2,1
8040ecc4:	00040593          	mv	a1,s0
8040ecc8:	00007517          	auipc	a0,0x7
8040eccc:	8c850513          	addi	a0,a0,-1848 # 80415590 <dev_node_ops+0x98>
8040ecd0:	f8dfe0ef          	jal	ra,8040dc5c <vfs_add_dev>
8040ecd4:	02051863          	bnez	a0,8040ed04 <dev_init_disk0+0xe4>
8040ecd8:	00c12083          	lw	ra,12(sp)
8040ecdc:	00812403          	lw	s0,8(sp)
8040ece0:	00412483          	lw	s1,4(sp)
8040ece4:	01010113          	addi	sp,sp,16
8040ece8:	00008067          	ret
8040ecec:	00007617          	auipc	a2,0x7
8040ecf0:	84c60613          	addi	a2,a2,-1972 # 80415538 <dev_node_ops+0x40>
8040ecf4:	08700593          	li	a1,135
8040ecf8:	00007517          	auipc	a0,0x7
8040ecfc:	8fc50513          	addi	a0,a0,-1796 # 804155f4 <dev_node_ops+0xfc>
8040ed00:	925f10ef          	jal	ra,80400624 <__panic>
8040ed04:	00050693          	mv	a3,a0
8040ed08:	00007617          	auipc	a2,0x7
8040ed0c:	89060613          	addi	a2,a2,-1904 # 80415598 <dev_node_ops+0xa0>
8040ed10:	08d00593          	li	a1,141
8040ed14:	00007517          	auipc	a0,0x7
8040ed18:	8e050513          	addi	a0,a0,-1824 # 804155f4 <dev_node_ops+0xfc>
8040ed1c:	909f10ef          	jal	ra,80400624 <__panic>
8040ed20:	00007617          	auipc	a2,0x7
8040ed24:	85460613          	addi	a2,a2,-1964 # 80415574 <dev_node_ops+0x7c>
8040ed28:	07f00593          	li	a1,127
8040ed2c:	00007517          	auipc	a0,0x7
8040ed30:	8c850513          	addi	a0,a0,-1848 # 804155f4 <dev_node_ops+0xfc>
8040ed34:	8f1f10ef          	jal	ra,80400624 <__panic>
8040ed38:	00007617          	auipc	a2,0x7
8040ed3c:	81c60613          	addi	a2,a2,-2020 # 80415554 <dev_node_ops+0x5c>
8040ed40:	07300593          	li	a1,115
8040ed44:	00007517          	auipc	a0,0x7
8040ed48:	8b050513          	addi	a0,a0,-1872 # 804155f4 <dev_node_ops+0xfc>
8040ed4c:	8d9f10ef          	jal	ra,80400624 <__panic>
8040ed50:	00006697          	auipc	a3,0x6
8040ed54:	4b068693          	addi	a3,a3,1200 # 80415200 <syscalls+0x73c>
8040ed58:	00004617          	auipc	a2,0x4
8040ed5c:	e9060613          	addi	a2,a2,-368 # 80412be8 <commands+0x1bc>
8040ed60:	08900593          	li	a1,137
8040ed64:	00007517          	auipc	a0,0x7
8040ed68:	89050513          	addi	a0,a0,-1904 # 804155f4 <dev_node_ops+0xfc>
8040ed6c:	8b9f10ef          	jal	ra,80400624 <__panic>

8040ed70 <stdin_open>:
8040ed70:	00000513          	li	a0,0
8040ed74:	00059463          	bnez	a1,8040ed7c <stdin_open+0xc>
8040ed78:	00008067          	ret
8040ed7c:	ffd00513          	li	a0,-3
8040ed80:	00008067          	ret

8040ed84 <stdin_close>:
8040ed84:	00000513          	li	a0,0
8040ed88:	00008067          	ret

8040ed8c <stdin_ioctl>:
8040ed8c:	ffd00513          	li	a0,-3
8040ed90:	00008067          	ret

8040ed94 <stdin_io>:
8040ed94:	fb010113          	addi	sp,sp,-80
8040ed98:	04112623          	sw	ra,76(sp)
8040ed9c:	04812423          	sw	s0,72(sp)
8040eda0:	04912223          	sw	s1,68(sp)
8040eda4:	05212023          	sw	s2,64(sp)
8040eda8:	03312e23          	sw	s3,60(sp)
8040edac:	03412c23          	sw	s4,56(sp)
8040edb0:	03512a23          	sw	s5,52(sp)
8040edb4:	03612823          	sw	s6,48(sp)
8040edb8:	03712623          	sw	s7,44(sp)
8040edbc:	03812423          	sw	s8,40(sp)
8040edc0:	03912223          	sw	s9,36(sp)
8040edc4:	1a061063          	bnez	a2,8040ef64 <stdin_io+0x1d0>
8040edc8:	00058493          	mv	s1,a1
8040edcc:	0005ac83          	lw	s9,0(a1)
8040edd0:	00c5ac03          	lw	s8,12(a1)
8040edd4:	100027f3          	csrr	a5,sstatus
8040edd8:	0027f793          	andi	a5,a5,2
8040eddc:	16079863          	bnez	a5,8040ef4c <stdin_io+0x1b8>
8040ede0:	00000913          	li	s2,0
8040ede4:	160c0063          	beqz	s8,8040ef44 <stdin_io+0x1b0>
8040ede8:	0008eb97          	auipc	s7,0x8e
8040edec:	9fcb8b93          	addi	s7,s7,-1540 # 8049c7e4 <p_rpos>
8040edf0:	000ba783          	lw	a5,0(s7)
8040edf4:	800009b7          	lui	s3,0x80000
8040edf8:	00001a37          	lui	s4,0x1
8040edfc:	00000413          	li	s0,0
8040ee00:	0008eb17          	auipc	s6,0x8e
8040ee04:	9e8b0b13          	addi	s6,s6,-1560 # 8049c7e8 <p_wpos>
8040ee08:	00498993          	addi	s3,s3,4 # 80000004 <end+0xffb63748>
8040ee0c:	0008ea97          	auipc	s5,0x8e
8040ee10:	9d0a8a93          	addi	s5,s5,-1584 # 8049c7dc <__wait_queue>
8040ee14:	fffa0a13          	addi	s4,s4,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040ee18:	000b2703          	lw	a4,0(s6)
8040ee1c:	02e7de63          	bge	a5,a4,8040ee58 <stdin_io+0xc4>
8040ee20:	0d80006f          	j	8040eef8 <stdin_io+0x164>
8040ee24:	c55fd0ef          	jal	ra,8040ca78 <schedule>
8040ee28:	100027f3          	csrr	a5,sstatus
8040ee2c:	0027f793          	andi	a5,a5,2
8040ee30:	00000913          	li	s2,0
8040ee34:	04079863          	bnez	a5,8040ee84 <stdin_io+0xf0>
8040ee38:	00c10513          	addi	a0,sp,12
8040ee3c:	bb8f60ef          	jal	ra,804051f4 <wait_in_queue>
8040ee40:	04051c63          	bnez	a0,8040ee98 <stdin_io+0x104>
8040ee44:	01012783          	lw	a5,16(sp)
8040ee48:	07379263          	bne	a5,s3,8040eeac <stdin_io+0x118>
8040ee4c:	000ba783          	lw	a5,0(s7)
8040ee50:	000b2703          	lw	a4,0(s6)
8040ee54:	0ae7c263          	blt	a5,a4,8040eef8 <stdin_io+0x164>
8040ee58:	00098613          	mv	a2,s3
8040ee5c:	00c10593          	addi	a1,sp,12
8040ee60:	000a8513          	mv	a0,s5
8040ee64:	c88f60ef          	jal	ra,804052ec <wait_current_set>
8040ee68:	fa090ee3          	beqz	s2,8040ee24 <stdin_io+0x90>
8040ee6c:	da9f10ef          	jal	ra,80400c14 <intr_enable>
8040ee70:	c09fd0ef          	jal	ra,8040ca78 <schedule>
8040ee74:	100027f3          	csrr	a5,sstatus
8040ee78:	0027f793          	andi	a5,a5,2
8040ee7c:	00000913          	li	s2,0
8040ee80:	fa078ce3          	beqz	a5,8040ee38 <stdin_io+0xa4>
8040ee84:	d99f10ef          	jal	ra,80400c1c <intr_disable>
8040ee88:	00c10513          	addi	a0,sp,12
8040ee8c:	00100913          	li	s2,1
8040ee90:	b64f60ef          	jal	ra,804051f4 <wait_in_queue>
8040ee94:	fa0508e3          	beqz	a0,8040ee44 <stdin_io+0xb0>
8040ee98:	00c10593          	addi	a1,sp,12
8040ee9c:	000a8513          	mv	a0,s5
8040eea0:	af4f60ef          	jal	ra,80405194 <wait_queue_del>
8040eea4:	01012783          	lw	a5,16(sp)
8040eea8:	fb3782e3          	beq	a5,s3,8040ee4c <stdin_io+0xb8>
8040eeac:	08091863          	bnez	s2,8040ef3c <stdin_io+0x1a8>
8040eeb0:	08040a63          	beqz	s0,8040ef44 <stdin_io+0x1b0>
8040eeb4:	00c4a783          	lw	a5,12(s1)
8040eeb8:	408787b3          	sub	a5,a5,s0
8040eebc:	00f4a623          	sw	a5,12(s1)
8040eec0:	00040513          	mv	a0,s0
8040eec4:	04c12083          	lw	ra,76(sp)
8040eec8:	04812403          	lw	s0,72(sp)
8040eecc:	04412483          	lw	s1,68(sp)
8040eed0:	04012903          	lw	s2,64(sp)
8040eed4:	03c12983          	lw	s3,60(sp)
8040eed8:	03812a03          	lw	s4,56(sp)
8040eedc:	03412a83          	lw	s5,52(sp)
8040eee0:	03012b03          	lw	s6,48(sp)
8040eee4:	02c12b83          	lw	s7,44(sp)
8040eee8:	02812c03          	lw	s8,40(sp)
8040eeec:	02412c83          	lw	s9,36(sp)
8040eef0:	05010113          	addi	sp,sp,80
8040eef4:	00008067          	ret
8040eef8:	41f7d713          	srai	a4,a5,0x1f
8040eefc:	01475693          	srli	a3,a4,0x14
8040ef00:	00d78733          	add	a4,a5,a3
8040ef04:	01477733          	and	a4,a4,s4
8040ef08:	40d70733          	sub	a4,a4,a3
8040ef0c:	0008d697          	auipc	a3,0x8d
8040ef10:	87468693          	addi	a3,a3,-1932 # 8049b780 <stdin_buffer>
8040ef14:	00e68733          	add	a4,a3,a4
8040ef18:	00074683          	lbu	a3,0(a4)
8040ef1c:	00178793          	addi	a5,a5,1
8040ef20:	008c8733          	add	a4,s9,s0
8040ef24:	00d70023          	sb	a3,0(a4)
8040ef28:	00140413          	addi	s0,s0,1
8040ef2c:	0008e717          	auipc	a4,0x8e
8040ef30:	8af72c23          	sw	a5,-1864(a4) # 8049c7e4 <p_rpos>
8040ef34:	ef8462e3          	bltu	s0,s8,8040ee18 <stdin_io+0x84>
8040ef38:	f6090ee3          	beqz	s2,8040eeb4 <stdin_io+0x120>
8040ef3c:	cd9f10ef          	jal	ra,80400c14 <intr_enable>
8040ef40:	f6041ae3          	bnez	s0,8040eeb4 <stdin_io+0x120>
8040ef44:	00000413          	li	s0,0
8040ef48:	f79ff06f          	j	8040eec0 <stdin_io+0x12c>
8040ef4c:	cd1f10ef          	jal	ra,80400c1c <intr_disable>
8040ef50:	00100913          	li	s2,1
8040ef54:	e80c1ae3          	bnez	s8,8040ede8 <stdin_io+0x54>
8040ef58:	cbdf10ef          	jal	ra,80400c14 <intr_enable>
8040ef5c:	00000413          	li	s0,0
8040ef60:	f61ff06f          	j	8040eec0 <stdin_io+0x12c>
8040ef64:	ffd00413          	li	s0,-3
8040ef68:	f59ff06f          	j	8040eec0 <stdin_io+0x12c>

8040ef6c <dev_stdin_write>:
8040ef6c:	00051463          	bnez	a0,8040ef74 <dev_stdin_write+0x8>
8040ef70:	00008067          	ret
8040ef74:	ff010113          	addi	sp,sp,-16
8040ef78:	00912223          	sw	s1,4(sp)
8040ef7c:	00112623          	sw	ra,12(sp)
8040ef80:	00812423          	sw	s0,8(sp)
8040ef84:	00050493          	mv	s1,a0
8040ef88:	100027f3          	csrr	a5,sstatus
8040ef8c:	0027f793          	andi	a5,a5,2
8040ef90:	00000413          	li	s0,0
8040ef94:	0a079a63          	bnez	a5,8040f048 <dev_stdin_write+0xdc>
8040ef98:	0008e797          	auipc	a5,0x8e
8040ef9c:	85078793          	addi	a5,a5,-1968 # 8049c7e8 <p_wpos>
8040efa0:	0007a703          	lw	a4,0(a5)
8040efa4:	000015b7          	lui	a1,0x1
8040efa8:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040efac:	41f75693          	srai	a3,a4,0x1f
8040efb0:	0146d693          	srli	a3,a3,0x14
8040efb4:	00d707b3          	add	a5,a4,a3
8040efb8:	00c7f7b3          	and	a5,a5,a2
8040efbc:	0008e617          	auipc	a2,0x8e
8040efc0:	82860613          	addi	a2,a2,-2008 # 8049c7e4 <p_rpos>
8040efc4:	00062603          	lw	a2,0(a2)
8040efc8:	40d787b3          	sub	a5,a5,a3
8040efcc:	0008c697          	auipc	a3,0x8c
8040efd0:	7b468693          	addi	a3,a3,1972 # 8049b780 <stdin_buffer>
8040efd4:	00f687b3          	add	a5,a3,a5
8040efd8:	00978023          	sb	s1,0(a5)
8040efdc:	40c707b3          	sub	a5,a4,a2
8040efe0:	00b7d863          	bge	a5,a1,8040eff0 <dev_stdin_write+0x84>
8040efe4:	00170713          	addi	a4,a4,1
8040efe8:	0008e797          	auipc	a5,0x8e
8040efec:	80e7a023          	sw	a4,-2048(a5) # 8049c7e8 <p_wpos>
8040eff0:	0008d517          	auipc	a0,0x8d
8040eff4:	7ec50513          	addi	a0,a0,2028 # 8049c7dc <__wait_queue>
8040eff8:	9ecf60ef          	jal	ra,804051e4 <wait_queue_empty>
8040effc:	00050e63          	beqz	a0,8040f018 <dev_stdin_write+0xac>
8040f000:	02041a63          	bnez	s0,8040f034 <dev_stdin_write+0xc8>
8040f004:	00c12083          	lw	ra,12(sp)
8040f008:	00812403          	lw	s0,8(sp)
8040f00c:	00412483          	lw	s1,4(sp)
8040f010:	01010113          	addi	sp,sp,16
8040f014:	00008067          	ret
8040f018:	800005b7          	lui	a1,0x80000
8040f01c:	00100613          	li	a2,1
8040f020:	00458593          	addi	a1,a1,4 # 80000004 <end+0xffb63748>
8040f024:	0008d517          	auipc	a0,0x8d
8040f028:	7b850513          	addi	a0,a0,1976 # 8049c7dc <__wait_queue>
8040f02c:	a20f60ef          	jal	ra,8040524c <wakeup_queue>
8040f030:	fc040ae3          	beqz	s0,8040f004 <dev_stdin_write+0x98>
8040f034:	00812403          	lw	s0,8(sp)
8040f038:	00c12083          	lw	ra,12(sp)
8040f03c:	00412483          	lw	s1,4(sp)
8040f040:	01010113          	addi	sp,sp,16
8040f044:	bd1f106f          	j	80400c14 <intr_enable>
8040f048:	bd5f10ef          	jal	ra,80400c1c <intr_disable>
8040f04c:	00100413          	li	s0,1
8040f050:	f49ff06f          	j	8040ef98 <dev_stdin_write+0x2c>

8040f054 <dev_init_stdin>:
8040f054:	ff010113          	addi	sp,sp,-16
8040f058:	00112623          	sw	ra,12(sp)
8040f05c:	00812423          	sw	s0,8(sp)
8040f060:	909ff0ef          	jal	ra,8040e968 <dev_create_inode>
8040f064:	08050c63          	beqz	a0,8040f0fc <dev_init_stdin+0xa8>
8040f068:	02c52703          	lw	a4,44(a0)
8040f06c:	000017b7          	lui	a5,0x1
8040f070:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f074:	00050413          	mv	s0,a0
8040f078:	0af71c63          	bne	a4,a5,8040f130 <dev_init_stdin+0xdc>
8040f07c:	00100793          	li	a5,1
8040f080:	00f42223          	sw	a5,4(s0)
8040f084:	00000797          	auipc	a5,0x0
8040f088:	cec78793          	addi	a5,a5,-788 # 8040ed70 <stdin_open>
8040f08c:	00f42423          	sw	a5,8(s0)
8040f090:	00000797          	auipc	a5,0x0
8040f094:	cf478793          	addi	a5,a5,-780 # 8040ed84 <stdin_close>
8040f098:	00f42623          	sw	a5,12(s0)
8040f09c:	00000797          	auipc	a5,0x0
8040f0a0:	cf878793          	addi	a5,a5,-776 # 8040ed94 <stdin_io>
8040f0a4:	00f42823          	sw	a5,16(s0)
8040f0a8:	00000797          	auipc	a5,0x0
8040f0ac:	ce478793          	addi	a5,a5,-796 # 8040ed8c <stdin_ioctl>
8040f0b0:	00f42a23          	sw	a5,20(s0)
8040f0b4:	0008d517          	auipc	a0,0x8d
8040f0b8:	72850513          	addi	a0,a0,1832 # 8049c7dc <__wait_queue>
8040f0bc:	00042023          	sw	zero,0(s0)
8040f0c0:	0008d797          	auipc	a5,0x8d
8040f0c4:	7207a423          	sw	zero,1832(a5) # 8049c7e8 <p_wpos>
8040f0c8:	0008d797          	auipc	a5,0x8d
8040f0cc:	7007ae23          	sw	zero,1820(a5) # 8049c7e4 <p_rpos>
8040f0d0:	8b8f60ef          	jal	ra,80405188 <wait_queue_init>
8040f0d4:	00000613          	li	a2,0
8040f0d8:	00040593          	mv	a1,s0
8040f0dc:	00006517          	auipc	a0,0x6
8040f0e0:	63050513          	addi	a0,a0,1584 # 8041570c <dev_node_ops+0x214>
8040f0e4:	b79fe0ef          	jal	ra,8040dc5c <vfs_add_dev>
8040f0e8:	02051663          	bnez	a0,8040f114 <dev_init_stdin+0xc0>
8040f0ec:	00c12083          	lw	ra,12(sp)
8040f0f0:	00812403          	lw	s0,8(sp)
8040f0f4:	01010113          	addi	sp,sp,16
8040f0f8:	00008067          	ret
8040f0fc:	00006617          	auipc	a2,0x6
8040f100:	5d860613          	addi	a2,a2,1496 # 804156d4 <dev_node_ops+0x1dc>
8040f104:	07500593          	li	a1,117
8040f108:	00006517          	auipc	a0,0x6
8040f10c:	5e850513          	addi	a0,a0,1512 # 804156f0 <dev_node_ops+0x1f8>
8040f110:	d14f10ef          	jal	ra,80400624 <__panic>
8040f114:	00050693          	mv	a3,a0
8040f118:	00006617          	auipc	a2,0x6
8040f11c:	5fc60613          	addi	a2,a2,1532 # 80415714 <dev_node_ops+0x21c>
8040f120:	07b00593          	li	a1,123
8040f124:	00006517          	auipc	a0,0x6
8040f128:	5cc50513          	addi	a0,a0,1484 # 804156f0 <dev_node_ops+0x1f8>
8040f12c:	cf8f10ef          	jal	ra,80400624 <__panic>
8040f130:	00006697          	auipc	a3,0x6
8040f134:	0d068693          	addi	a3,a3,208 # 80415200 <syscalls+0x73c>
8040f138:	00004617          	auipc	a2,0x4
8040f13c:	ab060613          	addi	a2,a2,-1360 # 80412be8 <commands+0x1bc>
8040f140:	07700593          	li	a1,119
8040f144:	00006517          	auipc	a0,0x6
8040f148:	5ac50513          	addi	a0,a0,1452 # 804156f0 <dev_node_ops+0x1f8>
8040f14c:	cd8f10ef          	jal	ra,80400624 <__panic>

8040f150 <stdout_open>:
8040f150:	00100793          	li	a5,1
8040f154:	00000513          	li	a0,0
8040f158:	00f59463          	bne	a1,a5,8040f160 <stdout_open+0x10>
8040f15c:	00008067          	ret
8040f160:	ffd00513          	li	a0,-3
8040f164:	00008067          	ret

8040f168 <stdout_close>:
8040f168:	00000513          	li	a0,0
8040f16c:	00008067          	ret

8040f170 <stdout_ioctl>:
8040f170:	ffd00513          	li	a0,-3
8040f174:	00008067          	ret

8040f178 <stdout_io>:
8040f178:	04060c63          	beqz	a2,8040f1d0 <stdout_io+0x58>
8040f17c:	00c5a783          	lw	a5,12(a1)
8040f180:	ff010113          	addi	sp,sp,-16
8040f184:	00812423          	sw	s0,8(sp)
8040f188:	00912223          	sw	s1,4(sp)
8040f18c:	00112623          	sw	ra,12(sp)
8040f190:	00058493          	mv	s1,a1
8040f194:	0005a403          	lw	s0,0(a1)
8040f198:	02078063          	beqz	a5,8040f1b8 <stdout_io+0x40>
8040f19c:	00140413          	addi	s0,s0,1
8040f1a0:	fff44503          	lbu	a0,-1(s0)
8040f1a4:	8b8f10ef          	jal	ra,8040025c <cputchar>
8040f1a8:	00c4a783          	lw	a5,12(s1)
8040f1ac:	fff78793          	addi	a5,a5,-1
8040f1b0:	00f4a623          	sw	a5,12(s1)
8040f1b4:	fe0794e3          	bnez	a5,8040f19c <stdout_io+0x24>
8040f1b8:	00c12083          	lw	ra,12(sp)
8040f1bc:	00812403          	lw	s0,8(sp)
8040f1c0:	00412483          	lw	s1,4(sp)
8040f1c4:	00000513          	li	a0,0
8040f1c8:	01010113          	addi	sp,sp,16
8040f1cc:	00008067          	ret
8040f1d0:	ffd00513          	li	a0,-3
8040f1d4:	00008067          	ret

8040f1d8 <dev_init_stdout>:
8040f1d8:	ff010113          	addi	sp,sp,-16
8040f1dc:	00112623          	sw	ra,12(sp)
8040f1e0:	f88ff0ef          	jal	ra,8040e968 <dev_create_inode>
8040f1e4:	06050a63          	beqz	a0,8040f258 <dev_init_stdout+0x80>
8040f1e8:	02c52703          	lw	a4,44(a0)
8040f1ec:	000017b7          	lui	a5,0x1
8040f1f0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f1f4:	08f71c63          	bne	a4,a5,8040f28c <dev_init_stdout+0xb4>
8040f1f8:	00100793          	li	a5,1
8040f1fc:	00f52223          	sw	a5,4(a0)
8040f200:	00000797          	auipc	a5,0x0
8040f204:	f5078793          	addi	a5,a5,-176 # 8040f150 <stdout_open>
8040f208:	00f52423          	sw	a5,8(a0)
8040f20c:	00000797          	auipc	a5,0x0
8040f210:	f5c78793          	addi	a5,a5,-164 # 8040f168 <stdout_close>
8040f214:	00f52623          	sw	a5,12(a0)
8040f218:	00000797          	auipc	a5,0x0
8040f21c:	f6078793          	addi	a5,a5,-160 # 8040f178 <stdout_io>
8040f220:	00f52823          	sw	a5,16(a0)
8040f224:	00000797          	auipc	a5,0x0
8040f228:	f4c78793          	addi	a5,a5,-180 # 8040f170 <stdout_ioctl>
8040f22c:	00052023          	sw	zero,0(a0)
8040f230:	00f52a23          	sw	a5,20(a0)
8040f234:	00050593          	mv	a1,a0
8040f238:	00000613          	li	a2,0
8040f23c:	00006517          	auipc	a0,0x6
8040f240:	52c50513          	addi	a0,a0,1324 # 80415768 <dev_node_ops+0x270>
8040f244:	a19fe0ef          	jal	ra,8040dc5c <vfs_add_dev>
8040f248:	02051463          	bnez	a0,8040f270 <dev_init_stdout+0x98>
8040f24c:	00c12083          	lw	ra,12(sp)
8040f250:	01010113          	addi	sp,sp,16
8040f254:	00008067          	ret
8040f258:	00006617          	auipc	a2,0x6
8040f25c:	4d860613          	addi	a2,a2,1240 # 80415730 <dev_node_ops+0x238>
8040f260:	03700593          	li	a1,55
8040f264:	00006517          	auipc	a0,0x6
8040f268:	4e850513          	addi	a0,a0,1256 # 8041574c <dev_node_ops+0x254>
8040f26c:	bb8f10ef          	jal	ra,80400624 <__panic>
8040f270:	00050693          	mv	a3,a0
8040f274:	00006617          	auipc	a2,0x6
8040f278:	4fc60613          	addi	a2,a2,1276 # 80415770 <dev_node_ops+0x278>
8040f27c:	03d00593          	li	a1,61
8040f280:	00006517          	auipc	a0,0x6
8040f284:	4cc50513          	addi	a0,a0,1228 # 8041574c <dev_node_ops+0x254>
8040f288:	b9cf10ef          	jal	ra,80400624 <__panic>
8040f28c:	00006697          	auipc	a3,0x6
8040f290:	f7468693          	addi	a3,a3,-140 # 80415200 <syscalls+0x73c>
8040f294:	00004617          	auipc	a2,0x4
8040f298:	95460613          	addi	a2,a2,-1708 # 80412be8 <commands+0x1bc>
8040f29c:	03900593          	li	a1,57
8040f2a0:	00006517          	auipc	a0,0x6
8040f2a4:	4ac50513          	addi	a0,a0,1196 # 8041574c <dev_node_ops+0x254>
8040f2a8:	b7cf10ef          	jal	ra,80400624 <__panic>

8040f2ac <bitmap_translate.isra.0.part.1>:
8040f2ac:	ff010113          	addi	sp,sp,-16
8040f2b0:	00006697          	auipc	a3,0x6
8040f2b4:	55468693          	addi	a3,a3,1364 # 80415804 <dev_node_ops+0x30c>
8040f2b8:	00004617          	auipc	a2,0x4
8040f2bc:	93060613          	addi	a2,a2,-1744 # 80412be8 <commands+0x1bc>
8040f2c0:	04c00593          	li	a1,76
8040f2c4:	00006517          	auipc	a0,0x6
8040f2c8:	55850513          	addi	a0,a0,1368 # 8041581c <dev_node_ops+0x324>
8040f2cc:	00112623          	sw	ra,12(sp)
8040f2d0:	b54f10ef          	jal	ra,80400624 <__panic>

8040f2d4 <bitmap_create>:
8040f2d4:	fe010113          	addi	sp,sp,-32
8040f2d8:	00112e23          	sw	ra,28(sp)
8040f2dc:	00812c23          	sw	s0,24(sp)
8040f2e0:	00912a23          	sw	s1,20(sp)
8040f2e4:	01212823          	sw	s2,16(sp)
8040f2e8:	01312623          	sw	s3,12(sp)
8040f2ec:	01412423          	sw	s4,8(sp)
8040f2f0:	fff50713          	addi	a4,a0,-1
8040f2f4:	fde00793          	li	a5,-34
8040f2f8:	0ce7e663          	bltu	a5,a4,8040f3c4 <bitmap_create+0xf0>
8040f2fc:	00050413          	mv	s0,a0
8040f300:	00c00513          	li	a0,12
8040f304:	ebcf30ef          	jal	ra,804029c0 <kmalloc>
8040f308:	00050493          	mv	s1,a0
8040f30c:	08050263          	beqz	a0,8040f390 <bitmap_create+0xbc>
8040f310:	01f40993          	addi	s3,s0,31
8040f314:	0059d913          	srli	s2,s3,0x5
8040f318:	00291a13          	slli	s4,s2,0x2
8040f31c:	000a0513          	mv	a0,s4
8040f320:	ea0f30ef          	jal	ra,804029c0 <kmalloc>
8040f324:	08050863          	beqz	a0,8040f3b4 <bitmap_create+0xe0>
8040f328:	0084a023          	sw	s0,0(s1)
8040f32c:	0124a223          	sw	s2,4(s1)
8040f330:	000a0613          	mv	a2,s4
8040f334:	0ff00593          	li	a1,255
8040f338:	480030ef          	jal	ra,804127b8 <memset>
8040f33c:	00a4a423          	sw	a0,8(s1)
8040f340:	fe09f993          	andi	s3,s3,-32
8040f344:	04898663          	beq	s3,s0,8040f390 <bitmap_create+0xbc>
8040f348:	fff90913          	addi	s2,s2,-1 # 3fff <_binary_bin_swap_img_size-0x4001>
8040f34c:	00591793          	slli	a5,s2,0x5
8040f350:	00545713          	srli	a4,s0,0x5
8040f354:	40f407b3          	sub	a5,s0,a5
8040f358:	0b271663          	bne	a4,s2,8040f404 <bitmap_create+0x130>
8040f35c:	fff78693          	addi	a3,a5,-1
8040f360:	01e00613          	li	a2,30
8040f364:	08d66063          	bltu	a2,a3,8040f3e4 <bitmap_create+0x110>
8040f368:	00271713          	slli	a4,a4,0x2
8040f36c:	00e50533          	add	a0,a0,a4
8040f370:	00052703          	lw	a4,0(a0)
8040f374:	00100593          	li	a1,1
8040f378:	02000613          	li	a2,32
8040f37c:	00f596b3          	sll	a3,a1,a5
8040f380:	00178793          	addi	a5,a5,1
8040f384:	00d74733          	xor	a4,a4,a3
8040f388:	fec79ae3          	bne	a5,a2,8040f37c <bitmap_create+0xa8>
8040f38c:	00e52023          	sw	a4,0(a0)
8040f390:	01c12083          	lw	ra,28(sp)
8040f394:	01812403          	lw	s0,24(sp)
8040f398:	00048513          	mv	a0,s1
8040f39c:	01012903          	lw	s2,16(sp)
8040f3a0:	01412483          	lw	s1,20(sp)
8040f3a4:	00c12983          	lw	s3,12(sp)
8040f3a8:	00812a03          	lw	s4,8(sp)
8040f3ac:	02010113          	addi	sp,sp,32
8040f3b0:	00008067          	ret
8040f3b4:	00048513          	mv	a0,s1
8040f3b8:	f2cf30ef          	jal	ra,80402ae4 <kfree>
8040f3bc:	00000493          	li	s1,0
8040f3c0:	fd1ff06f          	j	8040f390 <bitmap_create+0xbc>
8040f3c4:	00006697          	auipc	a3,0x6
8040f3c8:	3c868693          	addi	a3,a3,968 # 8041578c <dev_node_ops+0x294>
8040f3cc:	00004617          	auipc	a2,0x4
8040f3d0:	81c60613          	addi	a2,a2,-2020 # 80412be8 <commands+0x1bc>
8040f3d4:	01500593          	li	a1,21
8040f3d8:	00006517          	auipc	a0,0x6
8040f3dc:	44450513          	addi	a0,a0,1092 # 8041581c <dev_node_ops+0x324>
8040f3e0:	a44f10ef          	jal	ra,80400624 <__panic>
8040f3e4:	00006697          	auipc	a3,0x6
8040f3e8:	3e868693          	addi	a3,a3,1000 # 804157cc <dev_node_ops+0x2d4>
8040f3ec:	00003617          	auipc	a2,0x3
8040f3f0:	7fc60613          	addi	a2,a2,2044 # 80412be8 <commands+0x1bc>
8040f3f4:	02b00593          	li	a1,43
8040f3f8:	00006517          	auipc	a0,0x6
8040f3fc:	42450513          	addi	a0,a0,1060 # 8041581c <dev_node_ops+0x324>
8040f400:	a24f10ef          	jal	ra,80400624 <__panic>
8040f404:	00006697          	auipc	a3,0x6
8040f408:	3b068693          	addi	a3,a3,944 # 804157b4 <dev_node_ops+0x2bc>
8040f40c:	00003617          	auipc	a2,0x3
8040f410:	7dc60613          	addi	a2,a2,2012 # 80412be8 <commands+0x1bc>
8040f414:	02a00593          	li	a1,42
8040f418:	00006517          	auipc	a0,0x6
8040f41c:	40450513          	addi	a0,a0,1028 # 8041581c <dev_node_ops+0x324>
8040f420:	a04f10ef          	jal	ra,80400624 <__panic>

8040f424 <bitmap_alloc>:
8040f424:	00452603          	lw	a2,4(a0)
8040f428:	00852803          	lw	a6,8(a0)
8040f42c:	02060663          	beqz	a2,8040f458 <bitmap_alloc+0x34>
8040f430:	00082703          	lw	a4,0(a6)
8040f434:	00480793          	addi	a5,a6,4
8040f438:	00070c63          	beqz	a4,8040f450 <bitmap_alloc+0x2c>
8040f43c:	0240006f          	j	8040f460 <bitmap_alloc+0x3c>
8040f440:	00078813          	mv	a6,a5
8040f444:	00478793          	addi	a5,a5,4
8040f448:	ffc7a683          	lw	a3,-4(a5)
8040f44c:	00069e63          	bnez	a3,8040f468 <bitmap_alloc+0x44>
8040f450:	00170713          	addi	a4,a4,1
8040f454:	fee616e3          	bne	a2,a4,8040f440 <bitmap_alloc+0x1c>
8040f458:	ffc00513          	li	a0,-4
8040f45c:	00008067          	ret
8040f460:	00070693          	mv	a3,a4
8040f464:	00000713          	li	a4,0
8040f468:	00000793          	li	a5,0
8040f46c:	00100893          	li	a7,1
8040f470:	02000313          	li	t1,32
8040f474:	00c0006f          	j	8040f480 <bitmap_alloc+0x5c>
8040f478:	00178793          	addi	a5,a5,1
8040f47c:	02678663          	beq	a5,t1,8040f4a8 <bitmap_alloc+0x84>
8040f480:	00f89633          	sll	a2,a7,a5
8040f484:	00c6f533          	and	a0,a3,a2
8040f488:	fe0508e3          	beqz	a0,8040f478 <bitmap_alloc+0x54>
8040f48c:	00c6c6b3          	xor	a3,a3,a2
8040f490:	00571713          	slli	a4,a4,0x5
8040f494:	00d82023          	sw	a3,0(a6)
8040f498:	00f70733          	add	a4,a4,a5
8040f49c:	00e5a023          	sw	a4,0(a1)
8040f4a0:	00000513          	li	a0,0
8040f4a4:	00008067          	ret
8040f4a8:	ff010113          	addi	sp,sp,-16
8040f4ac:	00005697          	auipc	a3,0x5
8040f4b0:	a9868693          	addi	a3,a3,-1384 # 80413f44 <default_pmm_manager+0x820>
8040f4b4:	00003617          	auipc	a2,0x3
8040f4b8:	73460613          	addi	a2,a2,1844 # 80412be8 <commands+0x1bc>
8040f4bc:	04300593          	li	a1,67
8040f4c0:	00006517          	auipc	a0,0x6
8040f4c4:	35c50513          	addi	a0,a0,860 # 8041581c <dev_node_ops+0x324>
8040f4c8:	00112623          	sw	ra,12(sp)
8040f4cc:	958f10ef          	jal	ra,80400624 <__panic>

8040f4d0 <bitmap_test>:
8040f4d0:	00052783          	lw	a5,0(a0)
8040f4d4:	02f5f463          	bgeu	a1,a5,8040f4fc <bitmap_test+0x2c>
8040f4d8:	00852783          	lw	a5,8(a0)
8040f4dc:	0055d713          	srli	a4,a1,0x5
8040f4e0:	00271713          	slli	a4,a4,0x2
8040f4e4:	00e787b3          	add	a5,a5,a4
8040f4e8:	0007a503          	lw	a0,0(a5)
8040f4ec:	00100793          	li	a5,1
8040f4f0:	00b795b3          	sll	a1,a5,a1
8040f4f4:	00a5f533          	and	a0,a1,a0
8040f4f8:	00008067          	ret
8040f4fc:	ff010113          	addi	sp,sp,-16
8040f500:	00112623          	sw	ra,12(sp)
8040f504:	da9ff0ef          	jal	ra,8040f2ac <bitmap_translate.isra.0.part.1>

8040f508 <bitmap_free>:
8040f508:	00052783          	lw	a5,0(a0)
8040f50c:	ff010113          	addi	sp,sp,-16
8040f510:	00112623          	sw	ra,12(sp)
8040f514:	02f5fe63          	bgeu	a1,a5,8040f550 <bitmap_free+0x48>
8040f518:	00852783          	lw	a5,8(a0)
8040f51c:	0055d713          	srli	a4,a1,0x5
8040f520:	00271713          	slli	a4,a4,0x2
8040f524:	00e787b3          	add	a5,a5,a4
8040f528:	0007a703          	lw	a4,0(a5)
8040f52c:	00100693          	li	a3,1
8040f530:	00b695b3          	sll	a1,a3,a1
8040f534:	00b776b3          	and	a3,a4,a1
8040f538:	00069e63          	bnez	a3,8040f554 <bitmap_free+0x4c>
8040f53c:	00c12083          	lw	ra,12(sp)
8040f540:	00b76733          	or	a4,a4,a1
8040f544:	00e7a023          	sw	a4,0(a5)
8040f548:	01010113          	addi	sp,sp,16
8040f54c:	00008067          	ret
8040f550:	d5dff0ef          	jal	ra,8040f2ac <bitmap_translate.isra.0.part.1>
8040f554:	00006697          	auipc	a3,0x6
8040f558:	2a068693          	addi	a3,a3,672 # 804157f4 <dev_node_ops+0x2fc>
8040f55c:	00003617          	auipc	a2,0x3
8040f560:	68c60613          	addi	a2,a2,1676 # 80412be8 <commands+0x1bc>
8040f564:	05f00593          	li	a1,95
8040f568:	00006517          	auipc	a0,0x6
8040f56c:	2b450513          	addi	a0,a0,692 # 8041581c <dev_node_ops+0x324>
8040f570:	8b4f10ef          	jal	ra,80400624 <__panic>

8040f574 <bitmap_destroy>:
8040f574:	ff010113          	addi	sp,sp,-16
8040f578:	00812423          	sw	s0,8(sp)
8040f57c:	00050413          	mv	s0,a0
8040f580:	00852503          	lw	a0,8(a0)
8040f584:	00112623          	sw	ra,12(sp)
8040f588:	d5cf30ef          	jal	ra,80402ae4 <kfree>
8040f58c:	00040513          	mv	a0,s0
8040f590:	00812403          	lw	s0,8(sp)
8040f594:	00c12083          	lw	ra,12(sp)
8040f598:	01010113          	addi	sp,sp,16
8040f59c:	d48f306f          	j	80402ae4 <kfree>

8040f5a0 <bitmap_getdata>:
8040f5a0:	00058863          	beqz	a1,8040f5b0 <bitmap_getdata+0x10>
8040f5a4:	00452783          	lw	a5,4(a0)
8040f5a8:	00279793          	slli	a5,a5,0x2
8040f5ac:	00f5a023          	sw	a5,0(a1)
8040f5b0:	00852503          	lw	a0,8(a0)
8040f5b4:	00008067          	ret

8040f5b8 <sfs_init>:
8040f5b8:	ff010113          	addi	sp,sp,-16
8040f5bc:	00006517          	auipc	a0,0x6
8040f5c0:	fd450513          	addi	a0,a0,-44 # 80415590 <dev_node_ops+0x98>
8040f5c4:	00112623          	sw	ra,12(sp)
8040f5c8:	784000ef          	jal	ra,8040fd4c <sfs_mount>
8040f5cc:	00051863          	bnez	a0,8040f5dc <sfs_init+0x24>
8040f5d0:	00c12083          	lw	ra,12(sp)
8040f5d4:	01010113          	addi	sp,sp,16
8040f5d8:	00008067          	ret
8040f5dc:	00050693          	mv	a3,a0
8040f5e0:	00006617          	auipc	a2,0x6
8040f5e4:	25460613          	addi	a2,a2,596 # 80415834 <dev_node_ops+0x33c>
8040f5e8:	01000593          	li	a1,16
8040f5ec:	00006517          	auipc	a0,0x6
8040f5f0:	26850513          	addi	a0,a0,616 # 80415854 <dev_node_ops+0x35c>
8040f5f4:	830f10ef          	jal	ra,80400624 <__panic>

8040f5f8 <sfs_sync>:
8040f5f8:	fe010113          	addi	sp,sp,-32
8040f5fc:	00112e23          	sw	ra,28(sp)
8040f600:	00812c23          	sw	s0,24(sp)
8040f604:	00912a23          	sw	s1,20(sp)
8040f608:	01212823          	sw	s2,16(sp)
8040f60c:	01312623          	sw	s3,12(sp)
8040f610:	01412423          	sw	s4,8(sp)
8040f614:	12050a63          	beqz	a0,8040f748 <sfs_sync+0x150>
8040f618:	06c52783          	lw	a5,108(a0)
8040f61c:	00050a13          	mv	s4,a0
8040f620:	12079463          	bnez	a5,8040f748 <sfs_sync+0x150>
8040f624:	135020ef          	jal	ra,80411f58 <lock_sfs_fs>
8040f628:	064a2403          	lw	s0,100(s4)
8040f62c:	060a0913          	addi	s2,s4,96
8040f630:	06890263          	beq	s2,s0,8040f694 <sfs_sync+0x9c>
8040f634:	fe440493          	addi	s1,s0,-28
8040f638:	0e048863          	beqz	s1,8040f728 <sfs_sync+0x130>
8040f63c:	02042783          	lw	a5,32(s0)
8040f640:	0e078463          	beqz	a5,8040f728 <sfs_sync+0x130>
8040f644:	0187a783          	lw	a5,24(a5)
8040f648:	0e078063          	beqz	a5,8040f728 <sfs_sync+0x130>
8040f64c:	00005997          	auipc	s3,0x5
8040f650:	b3898993          	addi	s3,s3,-1224 # 80414184 <CSWTCH.69+0x17c>
8040f654:	01c0006f          	j	8040f670 <sfs_sync+0x78>
8040f658:	fe440493          	addi	s1,s0,-28
8040f65c:	0c048663          	beqz	s1,8040f728 <sfs_sync+0x130>
8040f660:	02042783          	lw	a5,32(s0)
8040f664:	0c078263          	beqz	a5,8040f728 <sfs_sync+0x130>
8040f668:	0187a783          	lw	a5,24(a5)
8040f66c:	0a078e63          	beqz	a5,8040f728 <sfs_sync+0x130>
8040f670:	00098593          	mv	a1,s3
8040f674:	00048513          	mv	a0,s1
8040f678:	d79fd0ef          	jal	ra,8040d3f0 <inode_check>
8040f67c:	02042783          	lw	a5,32(s0)
8040f680:	00048513          	mv	a0,s1
8040f684:	0187a783          	lw	a5,24(a5)
8040f688:	000780e7          	jalr	a5
8040f68c:	00442403          	lw	s0,4(s0)
8040f690:	fc8914e3          	bne	s2,s0,8040f658 <sfs_sync+0x60>
8040f694:	000a0513          	mv	a0,s4
8040f698:	0d1020ef          	jal	ra,80411f68 <unlock_sfs_fs>
8040f69c:	034a2503          	lw	a0,52(s4)
8040f6a0:	02051263          	bnez	a0,8040f6c4 <sfs_sync+0xcc>
8040f6a4:	01c12083          	lw	ra,28(sp)
8040f6a8:	01812403          	lw	s0,24(sp)
8040f6ac:	01412483          	lw	s1,20(sp)
8040f6b0:	01012903          	lw	s2,16(sp)
8040f6b4:	00c12983          	lw	s3,12(sp)
8040f6b8:	00812a03          	lw	s4,8(sp)
8040f6bc:	02010113          	addi	sp,sp,32
8040f6c0:	00008067          	ret
8040f6c4:	020a2a23          	sw	zero,52(s4)
8040f6c8:	000a0513          	mv	a0,s4
8040f6cc:	700020ef          	jal	ra,80411dcc <sfs_sync_super>
8040f6d0:	02050663          	beqz	a0,8040f6fc <sfs_sync+0x104>
8040f6d4:	01c12083          	lw	ra,28(sp)
8040f6d8:	01812403          	lw	s0,24(sp)
8040f6dc:	00100793          	li	a5,1
8040f6e0:	02fa2a23          	sw	a5,52(s4)
8040f6e4:	01412483          	lw	s1,20(sp)
8040f6e8:	01012903          	lw	s2,16(sp)
8040f6ec:	00c12983          	lw	s3,12(sp)
8040f6f0:	00812a03          	lw	s4,8(sp)
8040f6f4:	02010113          	addi	sp,sp,32
8040f6f8:	00008067          	ret
8040f6fc:	000a0513          	mv	a0,s4
8040f700:	744020ef          	jal	ra,80411e44 <sfs_sync_freemap>
8040f704:	fc0518e3          	bnez	a0,8040f6d4 <sfs_sync+0xdc>
8040f708:	01c12083          	lw	ra,28(sp)
8040f70c:	01812403          	lw	s0,24(sp)
8040f710:	01412483          	lw	s1,20(sp)
8040f714:	01012903          	lw	s2,16(sp)
8040f718:	00c12983          	lw	s3,12(sp)
8040f71c:	00812a03          	lw	s4,8(sp)
8040f720:	02010113          	addi	sp,sp,32
8040f724:	00008067          	ret
8040f728:	00005697          	auipc	a3,0x5
8040f72c:	a0c68693          	addi	a3,a3,-1524 # 80414134 <CSWTCH.69+0x12c>
8040f730:	00003617          	auipc	a2,0x3
8040f734:	4b860613          	addi	a2,a2,1208 # 80412be8 <commands+0x1bc>
8040f738:	01b00593          	li	a1,27
8040f73c:	00006517          	auipc	a0,0x6
8040f740:	29050513          	addi	a0,a0,656 # 804159cc <dev_node_ops+0x4d4>
8040f744:	ee1f00ef          	jal	ra,80400624 <__panic>
8040f748:	00006697          	auipc	a3,0x6
8040f74c:	25868693          	addi	a3,a3,600 # 804159a0 <dev_node_ops+0x4a8>
8040f750:	00003617          	auipc	a2,0x3
8040f754:	49860613          	addi	a2,a2,1176 # 80412be8 <commands+0x1bc>
8040f758:	01500593          	li	a1,21
8040f75c:	00006517          	auipc	a0,0x6
8040f760:	27050513          	addi	a0,a0,624 # 804159cc <dev_node_ops+0x4d4>
8040f764:	ec1f00ef          	jal	ra,80400624 <__panic>

8040f768 <sfs_init_read>:
8040f768:	fe010113          	addi	sp,sp,-32
8040f76c:	00060793          	mv	a5,a2
8040f770:	00812c23          	sw	s0,24(sp)
8040f774:	00c59693          	slli	a3,a1,0xc
8040f778:	00050413          	mv	s0,a0
8040f77c:	00078593          	mv	a1,a5
8040f780:	00001637          	lui	a2,0x1
8040f784:	00010513          	mv	a0,sp
8040f788:	00112e23          	sw	ra,28(sp)
8040f78c:	dc5f60ef          	jal	ra,80406550 <iobuf_init>
8040f790:	01042783          	lw	a5,16(s0)
8040f794:	00050593          	mv	a1,a0
8040f798:	00000613          	li	a2,0
8040f79c:	00040513          	mv	a0,s0
8040f7a0:	000780e7          	jalr	a5
8040f7a4:	01c12083          	lw	ra,28(sp)
8040f7a8:	01812403          	lw	s0,24(sp)
8040f7ac:	02010113          	addi	sp,sp,32
8040f7b0:	00008067          	ret

8040f7b4 <sfs_unmount>:
8040f7b4:	ff010113          	addi	sp,sp,-16
8040f7b8:	00112623          	sw	ra,12(sp)
8040f7bc:	00812423          	sw	s0,8(sp)
8040f7c0:	00912223          	sw	s1,4(sp)
8040f7c4:	06050263          	beqz	a0,8040f828 <sfs_unmount+0x74>
8040f7c8:	06c52783          	lw	a5,108(a0)
8040f7cc:	00050413          	mv	s0,a0
8040f7d0:	04079c63          	bnez	a5,8040f828 <sfs_unmount+0x74>
8040f7d4:	06452703          	lw	a4,100(a0)
8040f7d8:	06050793          	addi	a5,a0,96
8040f7dc:	04f71263          	bne	a4,a5,8040f820 <sfs_unmount+0x6c>
8040f7e0:	03452483          	lw	s1,52(a0)
8040f7e4:	06049263          	bnez	s1,8040f848 <sfs_unmount+0x94>
8040f7e8:	03052503          	lw	a0,48(a0)
8040f7ec:	d89ff0ef          	jal	ra,8040f574 <bitmap_destroy>
8040f7f0:	03842503          	lw	a0,56(s0)
8040f7f4:	af0f30ef          	jal	ra,80402ae4 <kfree>
8040f7f8:	06842503          	lw	a0,104(s0)
8040f7fc:	ae8f30ef          	jal	ra,80402ae4 <kfree>
8040f800:	00040513          	mv	a0,s0
8040f804:	ae0f30ef          	jal	ra,80402ae4 <kfree>
8040f808:	00c12083          	lw	ra,12(sp)
8040f80c:	00812403          	lw	s0,8(sp)
8040f810:	00048513          	mv	a0,s1
8040f814:	00412483          	lw	s1,4(sp)
8040f818:	01010113          	addi	sp,sp,16
8040f81c:	00008067          	ret
8040f820:	ff100493          	li	s1,-15
8040f824:	fe5ff06f          	j	8040f808 <sfs_unmount+0x54>
8040f828:	00006697          	auipc	a3,0x6
8040f82c:	17868693          	addi	a3,a3,376 # 804159a0 <dev_node_ops+0x4a8>
8040f830:	00003617          	auipc	a2,0x3
8040f834:	3b860613          	addi	a2,a2,952 # 80412be8 <commands+0x1bc>
8040f838:	04100593          	li	a1,65
8040f83c:	00006517          	auipc	a0,0x6
8040f840:	19050513          	addi	a0,a0,400 # 804159cc <dev_node_ops+0x4d4>
8040f844:	de1f00ef          	jal	ra,80400624 <__panic>
8040f848:	00006697          	auipc	a3,0x6
8040f84c:	19c68693          	addi	a3,a3,412 # 804159e4 <dev_node_ops+0x4ec>
8040f850:	00003617          	auipc	a2,0x3
8040f854:	39860613          	addi	a2,a2,920 # 80412be8 <commands+0x1bc>
8040f858:	04500593          	li	a1,69
8040f85c:	00006517          	auipc	a0,0x6
8040f860:	17050513          	addi	a0,a0,368 # 804159cc <dev_node_ops+0x4d4>
8040f864:	dc1f00ef          	jal	ra,80400624 <__panic>

8040f868 <sfs_cleanup>:
8040f868:	ff010113          	addi	sp,sp,-16
8040f86c:	00112623          	sw	ra,12(sp)
8040f870:	00812423          	sw	s0,8(sp)
8040f874:	00912223          	sw	s1,4(sp)
8040f878:	01212023          	sw	s2,0(sp)
8040f87c:	08050e63          	beqz	a0,8040f918 <sfs_cleanup+0xb0>
8040f880:	06c52783          	lw	a5,108(a0)
8040f884:	00050493          	mv	s1,a0
8040f888:	08079863          	bnez	a5,8040f918 <sfs_cleanup+0xb0>
8040f88c:	00452703          	lw	a4,4(a0)
8040f890:	00852683          	lw	a3,8(a0)
8040f894:	00c50913          	addi	s2,a0,12
8040f898:	00090593          	mv	a1,s2
8040f89c:	40d70633          	sub	a2,a4,a3
8040f8a0:	00006517          	auipc	a0,0x6
8040f8a4:	fc850513          	addi	a0,a0,-56 # 80415868 <dev_node_ops+0x370>
8040f8a8:	955f00ef          	jal	ra,804001fc <cprintf>
8040f8ac:	02000413          	li	s0,32
8040f8b0:	00c0006f          	j	8040f8bc <sfs_cleanup+0x54>
8040f8b4:	fff40413          	addi	s0,s0,-1
8040f8b8:	02040663          	beqz	s0,8040f8e4 <sfs_cleanup+0x7c>
8040f8bc:	0704a783          	lw	a5,112(s1)
8040f8c0:	00048513          	mv	a0,s1
8040f8c4:	000780e7          	jalr	a5
8040f8c8:	fe0516e3          	bnez	a0,8040f8b4 <sfs_cleanup+0x4c>
8040f8cc:	00c12083          	lw	ra,12(sp)
8040f8d0:	00812403          	lw	s0,8(sp)
8040f8d4:	00412483          	lw	s1,4(sp)
8040f8d8:	00012903          	lw	s2,0(sp)
8040f8dc:	01010113          	addi	sp,sp,16
8040f8e0:	00008067          	ret
8040f8e4:	00812403          	lw	s0,8(sp)
8040f8e8:	00c12083          	lw	ra,12(sp)
8040f8ec:	00412483          	lw	s1,4(sp)
8040f8f0:	00090693          	mv	a3,s2
8040f8f4:	00012903          	lw	s2,0(sp)
8040f8f8:	00050713          	mv	a4,a0
8040f8fc:	00006617          	auipc	a2,0x6
8040f900:	f8c60613          	addi	a2,a2,-116 # 80415888 <dev_node_ops+0x390>
8040f904:	05f00593          	li	a1,95
8040f908:	00006517          	auipc	a0,0x6
8040f90c:	0c450513          	addi	a0,a0,196 # 804159cc <dev_node_ops+0x4d4>
8040f910:	01010113          	addi	sp,sp,16
8040f914:	d95f006f          	j	804006a8 <__warn>
8040f918:	00006697          	auipc	a3,0x6
8040f91c:	08868693          	addi	a3,a3,136 # 804159a0 <dev_node_ops+0x4a8>
8040f920:	00003617          	auipc	a2,0x3
8040f924:	2c860613          	addi	a2,a2,712 # 80412be8 <commands+0x1bc>
8040f928:	05400593          	li	a1,84
8040f92c:	00006517          	auipc	a0,0x6
8040f930:	0a050513          	addi	a0,a0,160 # 804159cc <dev_node_ops+0x4d4>
8040f934:	cf1f00ef          	jal	ra,80400624 <__panic>

8040f938 <sfs_get_root>:
8040f938:	fe010113          	addi	sp,sp,-32
8040f93c:	00112e23          	sw	ra,28(sp)
8040f940:	02050663          	beqz	a0,8040f96c <sfs_get_root+0x34>
8040f944:	06c52783          	lw	a5,108(a0)
8040f948:	02079263          	bnez	a5,8040f96c <sfs_get_root+0x34>
8040f94c:	00100613          	li	a2,1
8040f950:	00c10593          	addi	a1,sp,12
8040f954:	0e5010ef          	jal	ra,80411238 <sfs_load_inode>
8040f958:	02051a63          	bnez	a0,8040f98c <sfs_get_root+0x54>
8040f95c:	01c12083          	lw	ra,28(sp)
8040f960:	00c12503          	lw	a0,12(sp)
8040f964:	02010113          	addi	sp,sp,32
8040f968:	00008067          	ret
8040f96c:	00006697          	auipc	a3,0x6
8040f970:	03468693          	addi	a3,a3,52 # 804159a0 <dev_node_ops+0x4a8>
8040f974:	00003617          	auipc	a2,0x3
8040f978:	27460613          	addi	a2,a2,628 # 80412be8 <commands+0x1bc>
8040f97c:	03600593          	li	a1,54
8040f980:	00006517          	auipc	a0,0x6
8040f984:	04c50513          	addi	a0,a0,76 # 804159cc <dev_node_ops+0x4d4>
8040f988:	c9df00ef          	jal	ra,80400624 <__panic>
8040f98c:	00050693          	mv	a3,a0
8040f990:	00006617          	auipc	a2,0x6
8040f994:	ff460613          	addi	a2,a2,-12 # 80415984 <dev_node_ops+0x48c>
8040f998:	03700593          	li	a1,55
8040f99c:	00006517          	auipc	a0,0x6
8040f9a0:	03050513          	addi	a0,a0,48 # 804159cc <dev_node_ops+0x4d4>
8040f9a4:	c81f00ef          	jal	ra,80400624 <__panic>

8040f9a8 <sfs_do_mount>:
8040f9a8:	00452703          	lw	a4,4(a0)
8040f9ac:	fa010113          	addi	sp,sp,-96
8040f9b0:	04112e23          	sw	ra,92(sp)
8040f9b4:	04812c23          	sw	s0,88(sp)
8040f9b8:	04912a23          	sw	s1,84(sp)
8040f9bc:	05212823          	sw	s2,80(sp)
8040f9c0:	05312623          	sw	s3,76(sp)
8040f9c4:	05412423          	sw	s4,72(sp)
8040f9c8:	05512223          	sw	s5,68(sp)
8040f9cc:	05612023          	sw	s6,64(sp)
8040f9d0:	03712e23          	sw	s7,60(sp)
8040f9d4:	03812c23          	sw	s8,56(sp)
8040f9d8:	03912a23          	sw	s9,52(sp)
8040f9dc:	03a12823          	sw	s10,48(sp)
8040f9e0:	03b12623          	sw	s11,44(sp)
8040f9e4:	000017b7          	lui	a5,0x1
8040f9e8:	2ef71263          	bne	a4,a5,8040fccc <sfs_do_mount+0x324>
8040f9ec:	00050913          	mv	s2,a0
8040f9f0:	00000513          	li	a0,0
8040f9f4:	00058a93          	mv	s5,a1
8040f9f8:	c85fd0ef          	jal	ra,8040d67c <__alloc_fs>
8040f9fc:	00050413          	mv	s0,a0
8040fa00:	2e050263          	beqz	a0,8040fce4 <sfs_do_mount+0x33c>
8040fa04:	06c52a03          	lw	s4,108(a0)
8040fa08:	300a1263          	bnez	s4,8040fd0c <sfs_do_mount+0x364>
8040fa0c:	03252623          	sw	s2,44(a0)
8040fa10:	00001537          	lui	a0,0x1
8040fa14:	fadf20ef          	jal	ra,804029c0 <kmalloc>
8040fa18:	02a42c23          	sw	a0,56(s0)
8040fa1c:	00050493          	mv	s1,a0
8040fa20:	1a050c63          	beqz	a0,8040fbd8 <sfs_do_mount+0x230>
8040fa24:	00050613          	mv	a2,a0
8040fa28:	00000593          	li	a1,0
8040fa2c:	00090513          	mv	a0,s2
8040fa30:	d39ff0ef          	jal	ra,8040f768 <sfs_init_read>
8040fa34:	00050b13          	mv	s6,a0
8040fa38:	14051863          	bnez	a0,8040fb88 <sfs_do_mount+0x1e0>
8040fa3c:	0004a583          	lw	a1,0(s1)
8040fa40:	2f8dc637          	lui	a2,0x2f8dc
8040fa44:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f863e2a>
8040fa48:	1ac59863          	bne	a1,a2,8040fbf8 <sfs_do_mount+0x250>
8040fa4c:	0044a783          	lw	a5,4(s1)
8040fa50:	00092603          	lw	a2,0(s2)
8040fa54:	18f66663          	bltu	a2,a5,8040fbe0 <sfs_do_mount+0x238>
8040fa58:	020485a3          	sb	zero,43(s1)
8040fa5c:	0084af03          	lw	t5,8(s1)
8040fa60:	00c4ae83          	lw	t4,12(s1)
8040fa64:	0104ae03          	lw	t3,16(s1)
8040fa68:	0144a303          	lw	t1,20(s1)
8040fa6c:	0184a883          	lw	a7,24(s1)
8040fa70:	01c4a803          	lw	a6,28(s1)
8040fa74:	0204a603          	lw	a2,32(s1)
8040fa78:	0244a683          	lw	a3,36(s1)
8040fa7c:	0284a703          	lw	a4,40(s1)
8040fa80:	00002537          	lui	a0,0x2
8040fa84:	00f42223          	sw	a5,4(s0)
8040fa88:	00b42023          	sw	a1,0(s0)
8040fa8c:	01e42423          	sw	t5,8(s0)
8040fa90:	01d42623          	sw	t4,12(s0)
8040fa94:	01c42823          	sw	t3,16(s0)
8040fa98:	00642a23          	sw	t1,20(s0)
8040fa9c:	01142c23          	sw	a7,24(s0)
8040faa0:	01042e23          	sw	a6,28(s0)
8040faa4:	02c42023          	sw	a2,32(s0)
8040faa8:	02d42223          	sw	a3,36(s0)
8040faac:	02e42423          	sw	a4,40(s0)
8040fab0:	f11f20ef          	jal	ra,804029c0 <kmalloc>
8040fab4:	00a12423          	sw	a0,8(sp)
8040fab8:	06a42423          	sw	a0,104(s0)
8040fabc:	00050793          	mv	a5,a0
8040fac0:	20050a63          	beqz	a0,8040fcd4 <sfs_do_mount+0x32c>
8040fac4:	00002737          	lui	a4,0x2
8040fac8:	00e50733          	add	a4,a0,a4
8040facc:	00f7a223          	sw	a5,4(a5) # 1004 <_binary_bin_swap_img_size-0x6ffc>
8040fad0:	00f7a023          	sw	a5,0(a5)
8040fad4:	00878793          	addi	a5,a5,8
8040fad8:	fee79ae3          	bne	a5,a4,8040facc <sfs_do_mount+0x124>
8040fadc:	0044ab83          	lw	s7,4(s1)
8040fae0:	00008737          	lui	a4,0x8
8040fae4:	fff70993          	addi	s3,a4,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8040fae8:	ffff87b7          	lui	a5,0xffff8
8040faec:	013b8bb3          	add	s7,s7,s3
8040faf0:	00fbfbb3          	and	s7,s7,a5
8040faf4:	000b8513          	mv	a0,s7
8040faf8:	fdcff0ef          	jal	ra,8040f2d4 <bitmap_create>
8040fafc:	02a42823          	sw	a0,48(s0)
8040fb00:	00050c93          	mv	s9,a0
8040fb04:	1c050063          	beqz	a0,8040fcc4 <sfs_do_mount+0x31c>
8040fb08:	0044a703          	lw	a4,4(s1)
8040fb0c:	01c10593          	addi	a1,sp,28
8040fb10:	01370733          	add	a4,a4,s3
8040fb14:	00f75713          	srli	a4,a4,0xf
8040fb18:	00e12623          	sw	a4,12(sp)
8040fb1c:	a85ff0ef          	jal	ra,8040f5a0 <bitmap_getdata>
8040fb20:	00050c13          	mv	s8,a0
8040fb24:	1c050463          	beqz	a0,8040fcec <sfs_do_mount+0x344>
8040fb28:	00c12703          	lw	a4,12(sp)
8040fb2c:	01c12683          	lw	a3,28(sp)
8040fb30:	00c71613          	slli	a2,a4,0xc
8040fb34:	1ad61c63          	bne	a2,a3,8040fcec <sfs_do_mount+0x344>
8040fb38:	00200993          	li	s3,2
8040fb3c:	00001db7          	lui	s11,0x1
8040fb40:	00270d13          	addi	s10,a4,2
8040fb44:	00071a63          	bnez	a4,8040fb58 <sfs_do_mount+0x1b0>
8040fb48:	0c40006f          	j	8040fc0c <sfs_do_mount+0x264>
8040fb4c:	00198993          	addi	s3,s3,1
8040fb50:	01bc0c33          	add	s8,s8,s11
8040fb54:	0ba98c63          	beq	s3,s10,8040fc0c <sfs_do_mount+0x264>
8040fb58:	000c0613          	mv	a2,s8
8040fb5c:	00098593          	mv	a1,s3
8040fb60:	00090513          	mv	a0,s2
8040fb64:	c05ff0ef          	jal	ra,8040f768 <sfs_init_read>
8040fb68:	fe0502e3          	beqz	a0,8040fb4c <sfs_do_mount+0x1a4>
8040fb6c:	00a12623          	sw	a0,12(sp)
8040fb70:	000c8513          	mv	a0,s9
8040fb74:	a01ff0ef          	jal	ra,8040f574 <bitmap_destroy>
8040fb78:	00c12703          	lw	a4,12(sp)
8040fb7c:	00070b13          	mv	s6,a4
8040fb80:	00812503          	lw	a0,8(sp)
8040fb84:	f61f20ef          	jal	ra,80402ae4 <kfree>
8040fb88:	00048513          	mv	a0,s1
8040fb8c:	f59f20ef          	jal	ra,80402ae4 <kfree>
8040fb90:	00040513          	mv	a0,s0
8040fb94:	f51f20ef          	jal	ra,80402ae4 <kfree>
8040fb98:	05c12083          	lw	ra,92(sp)
8040fb9c:	05812403          	lw	s0,88(sp)
8040fba0:	000b0513          	mv	a0,s6
8040fba4:	05412483          	lw	s1,84(sp)
8040fba8:	05012903          	lw	s2,80(sp)
8040fbac:	04c12983          	lw	s3,76(sp)
8040fbb0:	04812a03          	lw	s4,72(sp)
8040fbb4:	04412a83          	lw	s5,68(sp)
8040fbb8:	04012b03          	lw	s6,64(sp)
8040fbbc:	03c12b83          	lw	s7,60(sp)
8040fbc0:	03812c03          	lw	s8,56(sp)
8040fbc4:	03412c83          	lw	s9,52(sp)
8040fbc8:	03012d03          	lw	s10,48(sp)
8040fbcc:	02c12d83          	lw	s11,44(sp)
8040fbd0:	06010113          	addi	sp,sp,96
8040fbd4:	00008067          	ret
8040fbd8:	ffc00b13          	li	s6,-4
8040fbdc:	fb5ff06f          	j	8040fb90 <sfs_do_mount+0x1e8>
8040fbe0:	00078593          	mv	a1,a5
8040fbe4:	00006517          	auipc	a0,0x6
8040fbe8:	cf850513          	addi	a0,a0,-776 # 804158dc <dev_node_ops+0x3e4>
8040fbec:	e10f00ef          	jal	ra,804001fc <cprintf>
8040fbf0:	ffd00b13          	li	s6,-3
8040fbf4:	f95ff06f          	j	8040fb88 <sfs_do_mount+0x1e0>
8040fbf8:	00006517          	auipc	a0,0x6
8040fbfc:	cac50513          	addi	a0,a0,-852 # 804158a4 <dev_node_ops+0x3ac>
8040fc00:	dfcf00ef          	jal	ra,804001fc <cprintf>
8040fc04:	ffd00b13          	li	s6,-3
8040fc08:	f81ff06f          	j	8040fb88 <sfs_do_mount+0x1e0>
8040fc0c:	00442903          	lw	s2,4(s0)
8040fc10:	00000493          	li	s1,0
8040fc14:	0c0b8463          	beqz	s7,8040fcdc <sfs_do_mount+0x334>
8040fc18:	00048593          	mv	a1,s1
8040fc1c:	000c8513          	mv	a0,s9
8040fc20:	8b1ff0ef          	jal	ra,8040f4d0 <bitmap_test>
8040fc24:	00a03533          	snez	a0,a0
8040fc28:	00148493          	addi	s1,s1,1
8040fc2c:	00aa0a33          	add	s4,s4,a0
8040fc30:	fe9b94e3          	bne	s7,s1,8040fc18 <sfs_do_mount+0x270>
8040fc34:	00842783          	lw	a5,8(s0)
8040fc38:	0f479a63          	bne	a5,s4,8040fd2c <sfs_do_mount+0x384>
8040fc3c:	00100593          	li	a1,1
8040fc40:	03c40513          	addi	a0,s0,60
8040fc44:	02042a23          	sw	zero,52(s0)
8040fc48:	ca4f50ef          	jal	ra,804050ec <sem_init>
8040fc4c:	00100593          	li	a1,1
8040fc50:	04840513          	addi	a0,s0,72
8040fc54:	c98f50ef          	jal	ra,804050ec <sem_init>
8040fc58:	00100593          	li	a1,1
8040fc5c:	05440513          	addi	a0,s0,84
8040fc60:	c8cf50ef          	jal	ra,804050ec <sem_init>
8040fc64:	06040793          	addi	a5,s0,96
8040fc68:	06f42223          	sw	a5,100(s0)
8040fc6c:	06f42023          	sw	a5,96(s0)
8040fc70:	00090713          	mv	a4,s2
8040fc74:	000a0693          	mv	a3,s4
8040fc78:	41490633          	sub	a2,s2,s4
8040fc7c:	00c40593          	addi	a1,s0,12
8040fc80:	00006517          	auipc	a0,0x6
8040fc84:	ce450513          	addi	a0,a0,-796 # 80415964 <dev_node_ops+0x46c>
8040fc88:	d74f00ef          	jal	ra,804001fc <cprintf>
8040fc8c:	00000797          	auipc	a5,0x0
8040fc90:	96c78793          	addi	a5,a5,-1684 # 8040f5f8 <sfs_sync>
8040fc94:	06f42823          	sw	a5,112(s0)
8040fc98:	00000797          	auipc	a5,0x0
8040fc9c:	ca078793          	addi	a5,a5,-864 # 8040f938 <sfs_get_root>
8040fca0:	06f42a23          	sw	a5,116(s0)
8040fca4:	00000797          	auipc	a5,0x0
8040fca8:	b1078793          	addi	a5,a5,-1264 # 8040f7b4 <sfs_unmount>
8040fcac:	06f42c23          	sw	a5,120(s0)
8040fcb0:	00000797          	auipc	a5,0x0
8040fcb4:	bb878793          	addi	a5,a5,-1096 # 8040f868 <sfs_cleanup>
8040fcb8:	06f42e23          	sw	a5,124(s0)
8040fcbc:	008aa023          	sw	s0,0(s5)
8040fcc0:	ed9ff06f          	j	8040fb98 <sfs_do_mount+0x1f0>
8040fcc4:	ffc00b13          	li	s6,-4
8040fcc8:	eb9ff06f          	j	8040fb80 <sfs_do_mount+0x1d8>
8040fccc:	ff200b13          	li	s6,-14
8040fcd0:	ec9ff06f          	j	8040fb98 <sfs_do_mount+0x1f0>
8040fcd4:	ffc00b13          	li	s6,-4
8040fcd8:	eb1ff06f          	j	8040fb88 <sfs_do_mount+0x1e0>
8040fcdc:	00000a13          	li	s4,0
8040fce0:	f55ff06f          	j	8040fc34 <sfs_do_mount+0x28c>
8040fce4:	ffc00b13          	li	s6,-4
8040fce8:	eb1ff06f          	j	8040fb98 <sfs_do_mount+0x1f0>
8040fcec:	00006697          	auipc	a3,0x6
8040fcf0:	c2068693          	addi	a3,a3,-992 # 8041590c <dev_node_ops+0x414>
8040fcf4:	00003617          	auipc	a2,0x3
8040fcf8:	ef460613          	addi	a2,a2,-268 # 80412be8 <commands+0x1bc>
8040fcfc:	08300593          	li	a1,131
8040fd00:	00006517          	auipc	a0,0x6
8040fd04:	ccc50513          	addi	a0,a0,-820 # 804159cc <dev_node_ops+0x4d4>
8040fd08:	91df00ef          	jal	ra,80400624 <__panic>
8040fd0c:	00006697          	auipc	a3,0x6
8040fd10:	c9468693          	addi	a3,a3,-876 # 804159a0 <dev_node_ops+0x4a8>
8040fd14:	00003617          	auipc	a2,0x3
8040fd18:	ed460613          	addi	a2,a2,-300 # 80412be8 <commands+0x1bc>
8040fd1c:	0a300593          	li	a1,163
8040fd20:	00006517          	auipc	a0,0x6
8040fd24:	cac50513          	addi	a0,a0,-852 # 804159cc <dev_node_ops+0x4d4>
8040fd28:	8fdf00ef          	jal	ra,80400624 <__panic>
8040fd2c:	00006697          	auipc	a3,0x6
8040fd30:	c0c68693          	addi	a3,a3,-1012 # 80415938 <dev_node_ops+0x440>
8040fd34:	00003617          	auipc	a2,0x3
8040fd38:	eb460613          	addi	a2,a2,-332 # 80412be8 <commands+0x1bc>
8040fd3c:	0e000593          	li	a1,224
8040fd40:	00006517          	auipc	a0,0x6
8040fd44:	c8c50513          	addi	a0,a0,-884 # 804159cc <dev_node_ops+0x4d4>
8040fd48:	8ddf00ef          	jal	ra,80400624 <__panic>

8040fd4c <sfs_mount>:
8040fd4c:	00000597          	auipc	a1,0x0
8040fd50:	c5c58593          	addi	a1,a1,-932 # 8040f9a8 <sfs_do_mount>
8040fd54:	f15fd06f          	j	8040dc68 <vfs_mount>

8040fd58 <sfs_opendir>:
8040fd58:	0235f593          	andi	a1,a1,35
8040fd5c:	00000513          	li	a0,0
8040fd60:	00059463          	bnez	a1,8040fd68 <sfs_opendir+0x10>
8040fd64:	00008067          	ret
8040fd68:	fef00513          	li	a0,-17
8040fd6c:	00008067          	ret

8040fd70 <sfs_openfile>:
8040fd70:	00000513          	li	a0,0
8040fd74:	00008067          	ret

8040fd78 <sfs_fsync>:
8040fd78:	fe010113          	addi	sp,sp,-32
8040fd7c:	01212823          	sw	s2,16(sp)
8040fd80:	03852903          	lw	s2,56(a0)
8040fd84:	00112e23          	sw	ra,28(sp)
8040fd88:	00812c23          	sw	s0,24(sp)
8040fd8c:	00912a23          	sw	s1,20(sp)
8040fd90:	01312623          	sw	s3,12(sp)
8040fd94:	0a090a63          	beqz	s2,8040fe48 <sfs_fsync+0xd0>
8040fd98:	06c92783          	lw	a5,108(s2)
8040fd9c:	0a079663          	bnez	a5,8040fe48 <sfs_fsync+0xd0>
8040fda0:	02c52703          	lw	a4,44(a0)
8040fda4:	000017b7          	lui	a5,0x1
8040fda8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040fdac:	00050413          	mv	s0,a0
8040fdb0:	0af71c63          	bne	a4,a5,8040fe68 <sfs_fsync+0xf0>
8040fdb4:	00852483          	lw	s1,8(a0)
8040fdb8:	02049263          	bnez	s1,8040fddc <sfs_fsync+0x64>
8040fdbc:	01c12083          	lw	ra,28(sp)
8040fdc0:	01812403          	lw	s0,24(sp)
8040fdc4:	00048513          	mv	a0,s1
8040fdc8:	01012903          	lw	s2,16(sp)
8040fdcc:	01412483          	lw	s1,20(sp)
8040fdd0:	00c12983          	lw	s3,12(sp)
8040fdd4:	02010113          	addi	sp,sp,32
8040fdd8:	00008067          	ret
8040fddc:	01050993          	addi	s3,a0,16
8040fde0:	00098513          	mv	a0,s3
8040fde4:	b18f50ef          	jal	ra,804050fc <down>
8040fde8:	00842483          	lw	s1,8(s0)
8040fdec:	02049663          	bnez	s1,8040fe18 <sfs_fsync+0xa0>
8040fdf0:	00098513          	mv	a0,s3
8040fdf4:	b04f50ef          	jal	ra,804050f8 <up>
8040fdf8:	01c12083          	lw	ra,28(sp)
8040fdfc:	01812403          	lw	s0,24(sp)
8040fe00:	00048513          	mv	a0,s1
8040fe04:	01012903          	lw	s2,16(sp)
8040fe08:	01412483          	lw	s1,20(sp)
8040fe0c:	00c12983          	lw	s3,12(sp)
8040fe10:	02010113          	addi	sp,sp,32
8040fe14:	00008067          	ret
8040fe18:	00442683          	lw	a3,4(s0)
8040fe1c:	00042583          	lw	a1,0(s0)
8040fe20:	00042423          	sw	zero,8(s0)
8040fe24:	00000713          	li	a4,0
8040fe28:	04000613          	li	a2,64
8040fe2c:	00090513          	mv	a0,s2
8040fe30:	691010ef          	jal	ra,80411cc0 <sfs_wbuf>
8040fe34:	00050493          	mv	s1,a0
8040fe38:	fa050ce3          	beqz	a0,8040fdf0 <sfs_fsync+0x78>
8040fe3c:	00100793          	li	a5,1
8040fe40:	00f42423          	sw	a5,8(s0)
8040fe44:	fadff06f          	j	8040fdf0 <sfs_fsync+0x78>
8040fe48:	00006697          	auipc	a3,0x6
8040fe4c:	b5868693          	addi	a3,a3,-1192 # 804159a0 <dev_node_ops+0x4a8>
8040fe50:	00003617          	auipc	a2,0x3
8040fe54:	d9860613          	addi	a2,a2,-616 # 80412be8 <commands+0x1bc>
8040fe58:	2c700593          	li	a1,711
8040fe5c:	00006517          	auipc	a0,0x6
8040fe60:	ce050513          	addi	a0,a0,-800 # 80415b3c <dev_node_ops+0x644>
8040fe64:	fc0f00ef          	jal	ra,80400624 <__panic>
8040fe68:	00006697          	auipc	a3,0x6
8040fe6c:	cec68693          	addi	a3,a3,-788 # 80415b54 <dev_node_ops+0x65c>
8040fe70:	00003617          	auipc	a2,0x3
8040fe74:	d7860613          	addi	a2,a2,-648 # 80412be8 <commands+0x1bc>
8040fe78:	2c800593          	li	a1,712
8040fe7c:	00006517          	auipc	a0,0x6
8040fe80:	cc050513          	addi	a0,a0,-832 # 80415b3c <dev_node_ops+0x644>
8040fe84:	fa0f00ef          	jal	ra,80400624 <__panic>

8040fe88 <sfs_gettype>:
8040fe88:	ff010113          	addi	sp,sp,-16
8040fe8c:	00112623          	sw	ra,12(sp)
8040fe90:	06050e63          	beqz	a0,8040ff0c <sfs_gettype+0x84>
8040fe94:	02c52683          	lw	a3,44(a0)
8040fe98:	000017b7          	lui	a5,0x1
8040fe9c:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040fea0:	06e69663          	bne	a3,a4,8040ff0c <sfs_gettype+0x84>
8040fea4:	00052683          	lw	a3,0(a0)
8040fea8:	00200713          	li	a4,2
8040feac:	0046d683          	lhu	a3,4(a3)
8040feb0:	04e68263          	beq	a3,a4,8040fef4 <sfs_gettype+0x6c>
8040feb4:	00300713          	li	a4,3
8040feb8:	02e68263          	beq	a3,a4,8040fedc <sfs_gettype+0x54>
8040febc:	00100713          	li	a4,1
8040fec0:	02e68063          	beq	a3,a4,8040fee0 <sfs_gettype+0x58>
8040fec4:	00006617          	auipc	a2,0x6
8040fec8:	cc860613          	addi	a2,a2,-824 # 80415b8c <dev_node_ops+0x694>
8040fecc:	38f00593          	li	a1,911
8040fed0:	00006517          	auipc	a0,0x6
8040fed4:	c6c50513          	addi	a0,a0,-916 # 80415b3c <dev_node_ops+0x644>
8040fed8:	f4cf00ef          	jal	ra,80400624 <__panic>
8040fedc:	000037b7          	lui	a5,0x3
8040fee0:	00c12083          	lw	ra,12(sp)
8040fee4:	00f5a023          	sw	a5,0(a1)
8040fee8:	00000513          	li	a0,0
8040feec:	01010113          	addi	sp,sp,16
8040fef0:	00008067          	ret
8040fef4:	00c12083          	lw	ra,12(sp)
8040fef8:	000027b7          	lui	a5,0x2
8040fefc:	00f5a023          	sw	a5,0(a1)
8040ff00:	00000513          	li	a0,0
8040ff04:	01010113          	addi	sp,sp,16
8040ff08:	00008067          	ret
8040ff0c:	00006697          	auipc	a3,0x6
8040ff10:	c4868693          	addi	a3,a3,-952 # 80415b54 <dev_node_ops+0x65c>
8040ff14:	00003617          	auipc	a2,0x3
8040ff18:	cd460613          	addi	a2,a2,-812 # 80412be8 <commands+0x1bc>
8040ff1c:	38300593          	li	a1,899
8040ff20:	00006517          	auipc	a0,0x6
8040ff24:	c1c50513          	addi	a0,a0,-996 # 80415b3c <dev_node_ops+0x644>
8040ff28:	efcf00ef          	jal	ra,80400624 <__panic>

8040ff2c <sfs_block_inuse.isra.3>:
8040ff2c:	ff010113          	addi	sp,sp,-16
8040ff30:	00112623          	sw	ra,12(sp)
8040ff34:	02060263          	beqz	a2,8040ff58 <sfs_block_inuse.isra.3+0x2c>
8040ff38:	02a67063          	bgeu	a2,a0,8040ff58 <sfs_block_inuse.isra.3+0x2c>
8040ff3c:	0005a503          	lw	a0,0(a1)
8040ff40:	00060593          	mv	a1,a2
8040ff44:	d8cff0ef          	jal	ra,8040f4d0 <bitmap_test>
8040ff48:	00c12083          	lw	ra,12(sp)
8040ff4c:	00153513          	seqz	a0,a0
8040ff50:	01010113          	addi	sp,sp,16
8040ff54:	00008067          	ret
8040ff58:	00060713          	mv	a4,a2
8040ff5c:	00050693          	mv	a3,a0
8040ff60:	00006617          	auipc	a2,0x6
8040ff64:	adc60613          	addi	a2,a2,-1316 # 80415a3c <dev_node_ops+0x544>
8040ff68:	05300593          	li	a1,83
8040ff6c:	00006517          	auipc	a0,0x6
8040ff70:	bd050513          	addi	a0,a0,-1072 # 80415b3c <dev_node_ops+0x644>
8040ff74:	eb0f00ef          	jal	ra,80400624 <__panic>

8040ff78 <sfs_block_alloc>:
8040ff78:	ff010113          	addi	sp,sp,-16
8040ff7c:	00812423          	sw	s0,8(sp)
8040ff80:	00050413          	mv	s0,a0
8040ff84:	03052503          	lw	a0,48(a0)
8040ff88:	00912223          	sw	s1,4(sp)
8040ff8c:	00112623          	sw	ra,12(sp)
8040ff90:	00058493          	mv	s1,a1
8040ff94:	c90ff0ef          	jal	ra,8040f424 <bitmap_alloc>
8040ff98:	04051863          	bnez	a0,8040ffe8 <sfs_block_alloc+0x70>
8040ff9c:	00842783          	lw	a5,8(s0)
8040ffa0:	06078e63          	beqz	a5,8041001c <sfs_block_alloc+0xa4>
8040ffa4:	fff78793          	addi	a5,a5,-1 # 1fff <_binary_bin_swap_img_size-0x6001>
8040ffa8:	00f42423          	sw	a5,8(s0)
8040ffac:	00100793          	li	a5,1
8040ffb0:	02f42a23          	sw	a5,52(s0)
8040ffb4:	0004a603          	lw	a2,0(s1)
8040ffb8:	00442503          	lw	a0,4(s0)
8040ffbc:	03040593          	addi	a1,s0,48
8040ffc0:	f6dff0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
8040ffc4:	02050c63          	beqz	a0,8040fffc <sfs_block_alloc+0x84>
8040ffc8:	00040513          	mv	a0,s0
8040ffcc:	00812403          	lw	s0,8(sp)
8040ffd0:	0004a583          	lw	a1,0(s1)
8040ffd4:	00c12083          	lw	ra,12(sp)
8040ffd8:	00412483          	lw	s1,4(sp)
8040ffdc:	00100613          	li	a2,1
8040ffe0:	01010113          	addi	sp,sp,16
8040ffe4:	6bd0106f          	j	80411ea0 <sfs_clear_block>
8040ffe8:	00c12083          	lw	ra,12(sp)
8040ffec:	00812403          	lw	s0,8(sp)
8040fff0:	00412483          	lw	s1,4(sp)
8040fff4:	01010113          	addi	sp,sp,16
8040fff8:	00008067          	ret
8040fffc:	00006697          	auipc	a3,0x6
80410000:	a1c68693          	addi	a3,a3,-1508 # 80415a18 <dev_node_ops+0x520>
80410004:	00003617          	auipc	a2,0x3
80410008:	be460613          	addi	a2,a2,-1052 # 80412be8 <commands+0x1bc>
8041000c:	06100593          	li	a1,97
80410010:	00006517          	auipc	a0,0x6
80410014:	b2c50513          	addi	a0,a0,-1236 # 80415b3c <dev_node_ops+0x644>
80410018:	e0cf00ef          	jal	ra,80400624 <__panic>
8041001c:	00006697          	auipc	a3,0x6
80410020:	9dc68693          	addi	a3,a3,-1572 # 804159f8 <dev_node_ops+0x500>
80410024:	00003617          	auipc	a2,0x3
80410028:	bc460613          	addi	a2,a2,-1084 # 80412be8 <commands+0x1bc>
8041002c:	05f00593          	li	a1,95
80410030:	00006517          	auipc	a0,0x6
80410034:	b0c50513          	addi	a0,a0,-1268 # 80415b3c <dev_node_ops+0x644>
80410038:	decf00ef          	jal	ra,80400624 <__panic>

8041003c <sfs_block_free>:
8041003c:	ff010113          	addi	sp,sp,-16
80410040:	00812423          	sw	s0,8(sp)
80410044:	00050413          	mv	s0,a0
80410048:	00452503          	lw	a0,4(a0)
8041004c:	00912223          	sw	s1,4(sp)
80410050:	00058613          	mv	a2,a1
80410054:	00058493          	mv	s1,a1
80410058:	03040593          	addi	a1,s0,48
8041005c:	00112623          	sw	ra,12(sp)
80410060:	ecdff0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
80410064:	02050c63          	beqz	a0,8041009c <sfs_block_free+0x60>
80410068:	03042503          	lw	a0,48(s0)
8041006c:	00048593          	mv	a1,s1
80410070:	c98ff0ef          	jal	ra,8040f508 <bitmap_free>
80410074:	00842783          	lw	a5,8(s0)
80410078:	00100713          	li	a4,1
8041007c:	02e42a23          	sw	a4,52(s0)
80410080:	00178793          	addi	a5,a5,1
80410084:	00f42423          	sw	a5,8(s0)
80410088:	00c12083          	lw	ra,12(sp)
8041008c:	00812403          	lw	s0,8(sp)
80410090:	00412483          	lw	s1,4(sp)
80410094:	01010113          	addi	sp,sp,16
80410098:	00008067          	ret
8041009c:	00006697          	auipc	a3,0x6
804100a0:	a3868693          	addi	a3,a3,-1480 # 80415ad4 <dev_node_ops+0x5dc>
804100a4:	00003617          	auipc	a2,0x3
804100a8:	b4460613          	addi	a2,a2,-1212 # 80412be8 <commands+0x1bc>
804100ac:	06a00593          	li	a1,106
804100b0:	00006517          	auipc	a0,0x6
804100b4:	a8c50513          	addi	a0,a0,-1396 # 80415b3c <dev_node_ops+0x644>
804100b8:	d6cf00ef          	jal	ra,80400624 <__panic>

804100bc <sfs_reclaim>:
804100bc:	ff010113          	addi	sp,sp,-16
804100c0:	00912223          	sw	s1,4(sp)
804100c4:	03852483          	lw	s1,56(a0)
804100c8:	00112623          	sw	ra,12(sp)
804100cc:	00812423          	sw	s0,8(sp)
804100d0:	01212023          	sw	s2,0(sp)
804100d4:	16048c63          	beqz	s1,8041024c <sfs_reclaim+0x190>
804100d8:	06c4a783          	lw	a5,108(s1)
804100dc:	16079863          	bnez	a5,8041024c <sfs_reclaim+0x190>
804100e0:	02c52703          	lw	a4,44(a0)
804100e4:	000017b7          	lui	a5,0x1
804100e8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804100ec:	00050413          	mv	s0,a0
804100f0:	18f71e63          	bne	a4,a5,8041028c <sfs_reclaim+0x1d0>
804100f4:	00048513          	mv	a0,s1
804100f8:	661010ef          	jal	ra,80411f58 <lock_sfs_fs>
804100fc:	00c42783          	lw	a5,12(s0)
80410100:	16f05663          	blez	a5,8041026c <sfs_reclaim+0x1b0>
80410104:	fff78793          	addi	a5,a5,-1
80410108:	00f42623          	sw	a5,12(s0)
8041010c:	0e079463          	bnez	a5,804101f4 <sfs_reclaim+0x138>
80410110:	03042903          	lw	s2,48(s0)
80410114:	0e091063          	bnez	s2,804101f4 <sfs_reclaim+0x138>
80410118:	00042783          	lw	a5,0(s0)
8041011c:	0067d783          	lhu	a5,6(a5)
80410120:	02079e63          	bnez	a5,8041015c <sfs_reclaim+0xa0>
80410124:	03c42783          	lw	a5,60(s0)
80410128:	18078263          	beqz	a5,804102ac <sfs_reclaim+0x1f0>
8041012c:	0307a783          	lw	a5,48(a5)
80410130:	16078e63          	beqz	a5,804102ac <sfs_reclaim+0x1f0>
80410134:	00005597          	auipc	a1,0x5
80410138:	25058593          	addi	a1,a1,592 # 80415384 <syscalls+0x8c0>
8041013c:	00040513          	mv	a0,s0
80410140:	ab0fd0ef          	jal	ra,8040d3f0 <inode_check>
80410144:	03c42783          	lw	a5,60(s0)
80410148:	00000593          	li	a1,0
8041014c:	00040513          	mv	a0,s0
80410150:	0307a783          	lw	a5,48(a5)
80410154:	000780e7          	jalr	a5
80410158:	0e051663          	bnez	a0,80410244 <sfs_reclaim+0x188>
8041015c:	00842783          	lw	a5,8(s0)
80410160:	02078c63          	beqz	a5,80410198 <sfs_reclaim+0xdc>
80410164:	03c42783          	lw	a5,60(s0)
80410168:	16078263          	beqz	a5,804102cc <sfs_reclaim+0x210>
8041016c:	0187a783          	lw	a5,24(a5)
80410170:	14078e63          	beqz	a5,804102cc <sfs_reclaim+0x210>
80410174:	00040513          	mv	a0,s0
80410178:	00004597          	auipc	a1,0x4
8041017c:	00c58593          	addi	a1,a1,12 # 80414184 <CSWTCH.69+0x17c>
80410180:	a70fd0ef          	jal	ra,8040d3f0 <inode_check>
80410184:	03c42783          	lw	a5,60(s0)
80410188:	00040513          	mv	a0,s0
8041018c:	0187a783          	lw	a5,24(a5)
80410190:	000780e7          	jalr	a5
80410194:	0a051863          	bnez	a0,80410244 <sfs_reclaim+0x188>
80410198:	01c42703          	lw	a4,28(s0)
8041019c:	02042783          	lw	a5,32(s0)
804101a0:	00048513          	mv	a0,s1
804101a4:	00f72223          	sw	a5,4(a4)
804101a8:	00e7a023          	sw	a4,0(a5)
804101ac:	02442703          	lw	a4,36(s0)
804101b0:	02842783          	lw	a5,40(s0)
804101b4:	00f72223          	sw	a5,4(a4)
804101b8:	00e7a023          	sw	a4,0(a5)
804101bc:	5ad010ef          	jal	ra,80411f68 <unlock_sfs_fs>
804101c0:	00042503          	lw	a0,0(s0)
804101c4:	00655783          	lhu	a5,6(a0)
804101c8:	04078a63          	beqz	a5,8041021c <sfs_reclaim+0x160>
804101cc:	919f20ef          	jal	ra,80402ae4 <kfree>
804101d0:	00040513          	mv	a0,s0
804101d4:	990fd0ef          	jal	ra,8040d364 <inode_kill>
804101d8:	00c12083          	lw	ra,12(sp)
804101dc:	00812403          	lw	s0,8(sp)
804101e0:	00090513          	mv	a0,s2
804101e4:	00412483          	lw	s1,4(sp)
804101e8:	00012903          	lw	s2,0(sp)
804101ec:	01010113          	addi	sp,sp,16
804101f0:	00008067          	ret
804101f4:	ff100913          	li	s2,-15
804101f8:	00048513          	mv	a0,s1
804101fc:	56d010ef          	jal	ra,80411f68 <unlock_sfs_fs>
80410200:	00c12083          	lw	ra,12(sp)
80410204:	00812403          	lw	s0,8(sp)
80410208:	00090513          	mv	a0,s2
8041020c:	00412483          	lw	s1,4(sp)
80410210:	00012903          	lw	s2,0(sp)
80410214:	01010113          	addi	sp,sp,16
80410218:	00008067          	ret
8041021c:	00442583          	lw	a1,4(s0)
80410220:	00048513          	mv	a0,s1
80410224:	e19ff0ef          	jal	ra,8041003c <sfs_block_free>
80410228:	00042503          	lw	a0,0(s0)
8041022c:	03c52583          	lw	a1,60(a0)
80410230:	f8058ee3          	beqz	a1,804101cc <sfs_reclaim+0x110>
80410234:	00048513          	mv	a0,s1
80410238:	e05ff0ef          	jal	ra,8041003c <sfs_block_free>
8041023c:	00042503          	lw	a0,0(s0)
80410240:	f8dff06f          	j	804101cc <sfs_reclaim+0x110>
80410244:	00050913          	mv	s2,a0
80410248:	fb1ff06f          	j	804101f8 <sfs_reclaim+0x13c>
8041024c:	00005697          	auipc	a3,0x5
80410250:	75468693          	addi	a3,a3,1876 # 804159a0 <dev_node_ops+0x4a8>
80410254:	00003617          	auipc	a2,0x3
80410258:	99460613          	addi	a2,a2,-1644 # 80412be8 <commands+0x1bc>
8041025c:	35800593          	li	a1,856
80410260:	00006517          	auipc	a0,0x6
80410264:	8dc50513          	addi	a0,a0,-1828 # 80415b3c <dev_node_ops+0x644>
80410268:	bbcf00ef          	jal	ra,80400624 <__panic>
8041026c:	00006697          	auipc	a3,0x6
80410270:	a6468693          	addi	a3,a3,-1436 # 80415cd0 <sfs_node_fileops+0x40>
80410274:	00003617          	auipc	a2,0x3
80410278:	97460613          	addi	a2,a2,-1676 # 80412be8 <commands+0x1bc>
8041027c:	35e00593          	li	a1,862
80410280:	00006517          	auipc	a0,0x6
80410284:	8bc50513          	addi	a0,a0,-1860 # 80415b3c <dev_node_ops+0x644>
80410288:	b9cf00ef          	jal	ra,80400624 <__panic>
8041028c:	00006697          	auipc	a3,0x6
80410290:	8c868693          	addi	a3,a3,-1848 # 80415b54 <dev_node_ops+0x65c>
80410294:	00003617          	auipc	a2,0x3
80410298:	95460613          	addi	a2,a2,-1708 # 80412be8 <commands+0x1bc>
8041029c:	35900593          	li	a1,857
804102a0:	00006517          	auipc	a0,0x6
804102a4:	89c50513          	addi	a0,a0,-1892 # 80415b3c <dev_node_ops+0x644>
804102a8:	b7cf00ef          	jal	ra,80400624 <__panic>
804102ac:	00005697          	auipc	a3,0x5
804102b0:	08468693          	addi	a3,a3,132 # 80415330 <syscalls+0x86c>
804102b4:	00003617          	auipc	a2,0x3
804102b8:	93460613          	addi	a2,a2,-1740 # 80412be8 <commands+0x1bc>
804102bc:	36300593          	li	a1,867
804102c0:	00006517          	auipc	a0,0x6
804102c4:	87c50513          	addi	a0,a0,-1924 # 80415b3c <dev_node_ops+0x644>
804102c8:	b5cf00ef          	jal	ra,80400624 <__panic>
804102cc:	00004697          	auipc	a3,0x4
804102d0:	e6868693          	addi	a3,a3,-408 # 80414134 <CSWTCH.69+0x12c>
804102d4:	00003617          	auipc	a2,0x3
804102d8:	91460613          	addi	a2,a2,-1772 # 80412be8 <commands+0x1bc>
804102dc:	36800593          	li	a1,872
804102e0:	00006517          	auipc	a0,0x6
804102e4:	85c50513          	addi	a0,a0,-1956 # 80415b3c <dev_node_ops+0x644>
804102e8:	b3cf00ef          	jal	ra,80400624 <__panic>

804102ec <sfs_bmap_load_nolock>:
804102ec:	fc010113          	addi	sp,sp,-64
804102f0:	03212823          	sw	s2,48(sp)
804102f4:	0005a903          	lw	s2,0(a1)
804102f8:	03312623          	sw	s3,44(sp)
804102fc:	02112e23          	sw	ra,60(sp)
80410300:	00892983          	lw	s3,8(s2)
80410304:	02812c23          	sw	s0,56(sp)
80410308:	02912a23          	sw	s1,52(sp)
8041030c:	03412423          	sw	s4,40(sp)
80410310:	03512223          	sw	s5,36(sp)
80410314:	03612023          	sw	s6,32(sp)
80410318:	01712e23          	sw	s7,28(sp)
8041031c:	01812c23          	sw	s8,24(sp)
80410320:	01912a23          	sw	s9,20(sp)
80410324:	01a12823          	sw	s10,16(sp)
80410328:	22c9e863          	bltu	s3,a2,80410558 <sfs_bmap_load_nolock+0x26c>
8041032c:	00b00793          	li	a5,11
80410330:	00058b13          	mv	s6,a1
80410334:	00060413          	mv	s0,a2
80410338:	00050a13          	mv	s4,a0
8041033c:	00068c13          	mv	s8,a3
80410340:	08c7fe63          	bgeu	a5,a2,804103dc <sfs_bmap_load_nolock+0xf0>
80410344:	ff460713          	addi	a4,a2,-12
80410348:	3ff00793          	li	a5,1023
8041034c:	22e7e663          	bltu	a5,a4,80410578 <sfs_bmap_load_nolock+0x28c>
80410350:	03c92c83          	lw	s9,60(s2)
80410354:	00012623          	sw	zero,12(sp)
80410358:	00271b93          	slli	s7,a4,0x2
8041035c:	01912423          	sw	s9,8(sp)
80410360:	180c9a63          	bnez	s9,804104f4 <sfs_bmap_load_nolock+0x208>
80410364:	0cc98263          	beq	s3,a2,80410428 <sfs_bmap_load_nolock+0x13c>
80410368:	03050a93          	addi	s5,a0,48
8041036c:	00000493          	li	s1,0
80410370:	004a2503          	lw	a0,4(s4)
80410374:	00048613          	mv	a2,s1
80410378:	000a8593          	mv	a1,s5
8041037c:	bb1ff0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
80410380:	08050463          	beqz	a0,80410408 <sfs_bmap_load_nolock+0x11c>
80410384:	00899863          	bne	s3,s0,80410394 <sfs_bmap_load_nolock+0xa8>
80410388:	00892783          	lw	a5,8(s2)
8041038c:	00178793          	addi	a5,a5,1
80410390:	00f92423          	sw	a5,8(s2)
80410394:	00000a93          	li	s5,0
80410398:	000c0463          	beqz	s8,804103a0 <sfs_bmap_load_nolock+0xb4>
8041039c:	009c2023          	sw	s1,0(s8)
804103a0:	03c12083          	lw	ra,60(sp)
804103a4:	03812403          	lw	s0,56(sp)
804103a8:	000a8513          	mv	a0,s5
804103ac:	03412483          	lw	s1,52(sp)
804103b0:	03012903          	lw	s2,48(sp)
804103b4:	02c12983          	lw	s3,44(sp)
804103b8:	02812a03          	lw	s4,40(sp)
804103bc:	02412a83          	lw	s5,36(sp)
804103c0:	02012b03          	lw	s6,32(sp)
804103c4:	01c12b83          	lw	s7,28(sp)
804103c8:	01812c03          	lw	s8,24(sp)
804103cc:	01412c83          	lw	s9,20(sp)
804103d0:	01012d03          	lw	s10,16(sp)
804103d4:	04010113          	addi	sp,sp,64
804103d8:	00008067          	ret
804103dc:	00261b93          	slli	s7,a2,0x2
804103e0:	01790bb3          	add	s7,s2,s7
804103e4:	00cba483          	lw	s1,12(s7)
804103e8:	00912223          	sw	s1,4(sp)
804103ec:	10049063          	bnez	s1,804104ec <sfs_bmap_load_nolock+0x200>
804103f0:	0cc98463          	beq	s3,a2,804104b8 <sfs_bmap_load_nolock+0x1cc>
804103f4:	00452503          	lw	a0,4(a0)
804103f8:	00000613          	li	a2,0
804103fc:	030a0593          	addi	a1,s4,48
80410400:	b2dff0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
80410404:	f80518e3          	bnez	a0,80410394 <sfs_bmap_load_nolock+0xa8>
80410408:	00005697          	auipc	a3,0x5
8041040c:	6cc68693          	addi	a3,a3,1740 # 80415ad4 <dev_node_ops+0x5dc>
80410410:	00002617          	auipc	a2,0x2
80410414:	7d860613          	addi	a2,a2,2008 # 80412be8 <commands+0x1bc>
80410418:	16b00593          	li	a1,363
8041041c:	00005517          	auipc	a0,0x5
80410420:	72050513          	addi	a0,a0,1824 # 80415b3c <dev_node_ops+0x644>
80410424:	a00f00ef          	jal	ra,80400624 <__panic>
80410428:	00810593          	addi	a1,sp,8
8041042c:	b4dff0ef          	jal	ra,8040ff78 <sfs_block_alloc>
80410430:	00050a93          	mv	s5,a0
80410434:	00c10d13          	addi	s10,sp,12
80410438:	f60514e3          	bnez	a0,804103a0 <sfs_bmap_load_nolock+0xb4>
8041043c:	000d0593          	mv	a1,s10
80410440:	000a0513          	mv	a0,s4
80410444:	b35ff0ef          	jal	ra,8040ff78 <sfs_block_alloc>
80410448:	00050a93          	mv	s5,a0
8041044c:	0e051c63          	bnez	a0,80410544 <sfs_bmap_load_nolock+0x258>
80410450:	00812683          	lw	a3,8(sp)
80410454:	000b8713          	mv	a4,s7
80410458:	00400613          	li	a2,4
8041045c:	000d0593          	mv	a1,s10
80410460:	000a0513          	mv	a0,s4
80410464:	05d010ef          	jal	ra,80411cc0 <sfs_wbuf>
80410468:	00050a93          	mv	s5,a0
8041046c:	0c051663          	bnez	a0,80410538 <sfs_bmap_load_nolock+0x24c>
80410470:	00c12483          	lw	s1,12(sp)
80410474:	03c92703          	lw	a4,60(s2)
80410478:	00812783          	lw	a5,8(sp)
8041047c:	00912223          	sw	s1,4(sp)
80410480:	00f70a63          	beq	a4,a5,80410494 <sfs_bmap_load_nolock+0x1a8>
80410484:	12071663          	bnez	a4,804105b0 <sfs_bmap_load_nolock+0x2c4>
80410488:	02f92e23          	sw	a5,60(s2)
8041048c:	00100793          	li	a5,1
80410490:	00fb2423          	sw	a5,8(s6)
80410494:	030a0a93          	addi	s5,s4,48
80410498:	ec048ce3          	beqz	s1,80410370 <sfs_bmap_load_nolock+0x84>
8041049c:	004a2503          	lw	a0,4(s4)
804104a0:	00048613          	mv	a2,s1
804104a4:	000a8593          	mv	a1,s5
804104a8:	a85ff0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
804104ac:	0e050263          	beqz	a0,80410590 <sfs_bmap_load_nolock+0x2a4>
804104b0:	00412483          	lw	s1,4(sp)
804104b4:	ebdff06f          	j	80410370 <sfs_bmap_load_nolock+0x84>
804104b8:	00410593          	addi	a1,sp,4
804104bc:	abdff0ef          	jal	ra,8040ff78 <sfs_block_alloc>
804104c0:	00050a93          	mv	s5,a0
804104c4:	ec051ee3          	bnez	a0,804103a0 <sfs_bmap_load_nolock+0xb4>
804104c8:	00412483          	lw	s1,4(sp)
804104cc:	00100793          	li	a5,1
804104d0:	009ba623          	sw	s1,12(s7)
804104d4:	00fb2423          	sw	a5,8(s6)
804104d8:	fbdff06f          	j	80410494 <sfs_bmap_load_nolock+0x1a8>
804104dc:	03c92703          	lw	a4,60(s2)
804104e0:	00812783          	lw	a5,8(sp)
804104e4:	00912223          	sw	s1,4(sp)
804104e8:	f8e79ee3          	bne	a5,a4,80410484 <sfs_bmap_load_nolock+0x198>
804104ec:	030a0a93          	addi	s5,s4,48
804104f0:	fadff06f          	j	8041049c <sfs_bmap_load_nolock+0x1b0>
804104f4:	00c10d13          	addi	s10,sp,12
804104f8:	000b8713          	mv	a4,s7
804104fc:	000c8693          	mv	a3,s9
80410500:	00400613          	li	a2,4
80410504:	000d0593          	mv	a1,s10
80410508:	6ec010ef          	jal	ra,80411bf4 <sfs_rbuf>
8041050c:	00050a93          	mv	s5,a0
80410510:	e80518e3          	bnez	a0,804103a0 <sfs_bmap_load_nolock+0xb4>
80410514:	00c12483          	lw	s1,12(sp)
80410518:	fc0492e3          	bnez	s1,804104dc <sfs_bmap_load_nolock+0x1f0>
8041051c:	f28980e3          	beq	s3,s0,8041043c <sfs_bmap_load_nolock+0x150>
80410520:	03c92703          	lw	a4,60(s2)
80410524:	00812783          	lw	a5,8(sp)
80410528:	00012223          	sw	zero,4(sp)
8041052c:	f4e79ce3          	bne	a5,a4,80410484 <sfs_bmap_load_nolock+0x198>
80410530:	030a0a93          	addi	s5,s4,48
80410534:	e3dff06f          	j	80410370 <sfs_bmap_load_nolock+0x84>
80410538:	00c12583          	lw	a1,12(sp)
8041053c:	000a0513          	mv	a0,s4
80410540:	afdff0ef          	jal	ra,8041003c <sfs_block_free>
80410544:	00812583          	lw	a1,8(sp)
80410548:	e4bc8ce3          	beq	s9,a1,804103a0 <sfs_bmap_load_nolock+0xb4>
8041054c:	000a0513          	mv	a0,s4
80410550:	aedff0ef          	jal	ra,8041003c <sfs_block_free>
80410554:	e4dff06f          	j	804103a0 <sfs_bmap_load_nolock+0xb4>
80410558:	00005697          	auipc	a3,0x5
8041055c:	51868693          	addi	a3,a3,1304 # 80415a70 <dev_node_ops+0x578>
80410560:	00002617          	auipc	a2,0x2
80410564:	68860613          	addi	a2,a2,1672 # 80412be8 <commands+0x1bc>
80410568:	16400593          	li	a1,356
8041056c:	00005517          	auipc	a0,0x5
80410570:	5d050513          	addi	a0,a0,1488 # 80415b3c <dev_node_ops+0x644>
80410574:	8b0f00ef          	jal	ra,80400624 <__panic>
80410578:	00005617          	auipc	a2,0x5
8041057c:	52460613          	addi	a2,a2,1316 # 80415a9c <dev_node_ops+0x5a4>
80410580:	11e00593          	li	a1,286
80410584:	00005517          	auipc	a0,0x5
80410588:	5b850513          	addi	a0,a0,1464 # 80415b3c <dev_node_ops+0x644>
8041058c:	898f00ef          	jal	ra,80400624 <__panic>
80410590:	00005697          	auipc	a3,0x5
80410594:	53868693          	addi	a3,a3,1336 # 80415ac8 <dev_node_ops+0x5d0>
80410598:	00002617          	auipc	a2,0x2
8041059c:	65060613          	addi	a2,a2,1616 # 80412be8 <commands+0x1bc>
804105a0:	12100593          	li	a1,289
804105a4:	00005517          	auipc	a0,0x5
804105a8:	59850513          	addi	a0,a0,1432 # 80415b3c <dev_node_ops+0x644>
804105ac:	878f00ef          	jal	ra,80400624 <__panic>
804105b0:	00005697          	auipc	a3,0x5
804105b4:	4d868693          	addi	a3,a3,1240 # 80415a88 <dev_node_ops+0x590>
804105b8:	00002617          	auipc	a2,0x2
804105bc:	63060613          	addi	a2,a2,1584 # 80412be8 <commands+0x1bc>
804105c0:	11800593          	li	a1,280
804105c4:	00005517          	auipc	a0,0x5
804105c8:	57850513          	addi	a0,a0,1400 # 80415b3c <dev_node_ops+0x644>
804105cc:	858f00ef          	jal	ra,80400624 <__panic>

804105d0 <sfs_io_nolock>:
804105d0:	fa010113          	addi	sp,sp,-96
804105d4:	03812c23          	sw	s8,56(sp)
804105d8:	00058c13          	mv	s8,a1
804105dc:	0005a583          	lw	a1,0(a1)
804105e0:	03912a23          	sw	s9,52(sp)
804105e4:	00050c93          	mv	s9,a0
804105e8:	0045d503          	lhu	a0,4(a1)
804105ec:	04112e23          	sw	ra,92(sp)
804105f0:	04812c23          	sw	s0,88(sp)
804105f4:	04912a23          	sw	s1,84(sp)
804105f8:	05212823          	sw	s2,80(sp)
804105fc:	05312623          	sw	s3,76(sp)
80410600:	05412423          	sw	s4,72(sp)
80410604:	05512223          	sw	s5,68(sp)
80410608:	05612023          	sw	s6,64(sp)
8041060c:	03712e23          	sw	s7,60(sp)
80410610:	03a12823          	sw	s10,48(sp)
80410614:	03b12623          	sw	s11,44(sp)
80410618:	00200813          	li	a6,2
8041061c:	27050863          	beq	a0,a6,8041088c <sfs_io_nolock+0x2bc>
80410620:	00072403          	lw	s0,0(a4)
80410624:	00070b93          	mv	s7,a4
80410628:	000ba023          	sw	zero,0(s7)
8041062c:	08000737          	lui	a4,0x8000
80410630:	00068493          	mv	s1,a3
80410634:	00068d93          	mv	s11,a3
80410638:	00868433          	add	s0,a3,s0
8041063c:	24e6f463          	bgeu	a3,a4,80410884 <sfs_io_nolock+0x2b4>
80410640:	24d44263          	blt	s0,a3,80410884 <sfs_io_nolock+0x2b4>
80410644:	00000513          	li	a0,0
80410648:	0e868e63          	beq	a3,s0,80410744 <sfs_io_nolock+0x174>
8041064c:	00060993          	mv	s3,a2
80410650:	00877463          	bgeu	a4,s0,80410658 <sfs_io_nolock+0x88>
80410654:	08000437          	lui	s0,0x8000
80410658:	12078463          	beqz	a5,80410780 <sfs_io_nolock+0x1b0>
8041065c:	00001797          	auipc	a5,0x1
80410660:	59078793          	addi	a5,a5,1424 # 80411bec <sfs_wblock>
80410664:	00f12623          	sw	a5,12(sp)
80410668:	00001797          	auipc	a5,0x1
8041066c:	65878793          	addi	a5,a5,1624 # 80411cc0 <sfs_wbuf>
80410670:	00f12423          	sw	a5,8(sp)
80410674:	41f4d913          	srai	s2,s1,0x1f
80410678:	00001637          	lui	a2,0x1
8041067c:	fff60713          	addi	a4,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
80410680:	01495693          	srli	a3,s2,0x14
80410684:	41f45a13          	srai	s4,s0,0x1f
80410688:	00e97933          	and	s2,s2,a4
8041068c:	00ea7ab3          	and	s5,s4,a4
80410690:	00d48d33          	add	s10,s1,a3
80410694:	00990933          	add	s2,s2,s1
80410698:	008a8ab3          	add	s5,s5,s0
8041069c:	00ed7d33          	and	s10,s10,a4
804106a0:	40c95913          	srai	s2,s2,0xc
804106a4:	40cada93          	srai	s5,s5,0xc
804106a8:	40dd0d33          	sub	s10,s10,a3
804106ac:	412a8ab3          	sub	s5,s5,s2
804106b0:	100d0063          	beqz	s10,804107b0 <sfs_io_nolock+0x1e0>
804106b4:	40940b33          	sub	s6,s0,s1
804106b8:	140a9463          	bnez	s5,80410800 <sfs_io_nolock+0x230>
804106bc:	01c10693          	addi	a3,sp,28
804106c0:	00090613          	mv	a2,s2
804106c4:	000c0593          	mv	a1,s8
804106c8:	000c8513          	mv	a0,s9
804106cc:	c21ff0ef          	jal	ra,804102ec <sfs_bmap_load_nolock>
804106d0:	14051663          	bnez	a0,8041081c <sfs_io_nolock+0x24c>
804106d4:	01c12683          	lw	a3,28(sp)
804106d8:	00812783          	lw	a5,8(sp)
804106dc:	000d0713          	mv	a4,s10
804106e0:	000b0613          	mv	a2,s6
804106e4:	00098593          	mv	a1,s3
804106e8:	000c8513          	mv	a0,s9
804106ec:	000780e7          	jalr	a5
804106f0:	12051663          	bnez	a0,8041081c <sfs_io_nolock+0x24c>
804106f4:	180a8463          	beqz	s5,8041087c <sfs_io_nolock+0x2ac>
804106f8:	fffa8a93          	addi	s5,s5,-1
804106fc:	016989b3          	add	s3,s3,s6
80410700:	00190913          	addi	s2,s2,1
80410704:	0a0a9a63          	bnez	s5,804107b8 <sfs_io_nolock+0x1e8>
80410708:	014a5793          	srli	a5,s4,0x14
8041070c:	00f40433          	add	s0,s0,a5
80410710:	01441413          	slli	s0,s0,0x14
80410714:	01445413          	srli	s0,s0,0x14
80410718:	40f40433          	sub	s0,s0,a5
8041071c:	12041263          	bnez	s0,80410840 <sfs_io_nolock+0x270>
80410720:	01648db3          	add	s11,s1,s6
80410724:	00000513          	li	a0,0
80410728:	000c2783          	lw	a5,0(s8)
8041072c:	016ba023          	sw	s6,0(s7)
80410730:	0007a703          	lw	a4,0(a5)
80410734:	01b77863          	bgeu	a4,s11,80410744 <sfs_io_nolock+0x174>
80410738:	01b7a023          	sw	s11,0(a5)
8041073c:	00100793          	li	a5,1
80410740:	00fc2423          	sw	a5,8(s8)
80410744:	05c12083          	lw	ra,92(sp)
80410748:	05812403          	lw	s0,88(sp)
8041074c:	05412483          	lw	s1,84(sp)
80410750:	05012903          	lw	s2,80(sp)
80410754:	04c12983          	lw	s3,76(sp)
80410758:	04812a03          	lw	s4,72(sp)
8041075c:	04412a83          	lw	s5,68(sp)
80410760:	04012b03          	lw	s6,64(sp)
80410764:	03c12b83          	lw	s7,60(sp)
80410768:	03812c03          	lw	s8,56(sp)
8041076c:	03412c83          	lw	s9,52(sp)
80410770:	03012d03          	lw	s10,48(sp)
80410774:	02c12d83          	lw	s11,44(sp)
80410778:	06010113          	addi	sp,sp,96
8041077c:	00008067          	ret
80410780:	0005a783          	lw	a5,0(a1)
80410784:	00000513          	li	a0,0
80410788:	faf4fee3          	bgeu	s1,a5,80410744 <sfs_io_nolock+0x174>
8041078c:	0887fc63          	bgeu	a5,s0,80410824 <sfs_io_nolock+0x254>
80410790:	00078413          	mv	s0,a5
80410794:	00001797          	auipc	a5,0x1
80410798:	45078793          	addi	a5,a5,1104 # 80411be4 <sfs_rblock>
8041079c:	00f12623          	sw	a5,12(sp)
804107a0:	00001797          	auipc	a5,0x1
804107a4:	45478793          	addi	a5,a5,1108 # 80411bf4 <sfs_rbuf>
804107a8:	00f12423          	sw	a5,8(sp)
804107ac:	ec9ff06f          	j	80410674 <sfs_io_nolock+0xa4>
804107b0:	00000b13          	li	s6,0
804107b4:	f40a8ae3          	beqz	s5,80410708 <sfs_io_nolock+0x138>
804107b8:	01c10693          	addi	a3,sp,28
804107bc:	00090613          	mv	a2,s2
804107c0:	000c0593          	mv	a1,s8
804107c4:	000c8513          	mv	a0,s9
804107c8:	b25ff0ef          	jal	ra,804102ec <sfs_bmap_load_nolock>
804107cc:	0a051863          	bnez	a0,8041087c <sfs_io_nolock+0x2ac>
804107d0:	01c12603          	lw	a2,28(sp)
804107d4:	00c12783          	lw	a5,12(sp)
804107d8:	000a8693          	mv	a3,s5
804107dc:	00098593          	mv	a1,s3
804107e0:	000c8513          	mv	a0,s9
804107e4:	000780e7          	jalr	a5
804107e8:	08051a63          	bnez	a0,8041087c <sfs_io_nolock+0x2ac>
804107ec:	00ca9713          	slli	a4,s5,0xc
804107f0:	00eb0b33          	add	s6,s6,a4
804107f4:	00e989b3          	add	s3,s3,a4
804107f8:	01590933          	add	s2,s2,s5
804107fc:	f0dff06f          	j	80410708 <sfs_io_nolock+0x138>
80410800:	41a60b33          	sub	s6,a2,s10
80410804:	01c10693          	addi	a3,sp,28
80410808:	00090613          	mv	a2,s2
8041080c:	000c0593          	mv	a1,s8
80410810:	000c8513          	mv	a0,s9
80410814:	ad9ff0ef          	jal	ra,804102ec <sfs_bmap_load_nolock>
80410818:	ea050ee3          	beqz	a0,804106d4 <sfs_io_nolock+0x104>
8041081c:	00000b13          	li	s6,0
80410820:	f09ff06f          	j	80410728 <sfs_io_nolock+0x158>
80410824:	00001797          	auipc	a5,0x1
80410828:	3c078793          	addi	a5,a5,960 # 80411be4 <sfs_rblock>
8041082c:	00f12623          	sw	a5,12(sp)
80410830:	00001797          	auipc	a5,0x1
80410834:	3c478793          	addi	a5,a5,964 # 80411bf4 <sfs_rbuf>
80410838:	00f12423          	sw	a5,8(sp)
8041083c:	e39ff06f          	j	80410674 <sfs_io_nolock+0xa4>
80410840:	01c10693          	addi	a3,sp,28
80410844:	00090613          	mv	a2,s2
80410848:	000c0593          	mv	a1,s8
8041084c:	000c8513          	mv	a0,s9
80410850:	a9dff0ef          	jal	ra,804102ec <sfs_bmap_load_nolock>
80410854:	02051463          	bnez	a0,8041087c <sfs_io_nolock+0x2ac>
80410858:	01c12683          	lw	a3,28(sp)
8041085c:	00812783          	lw	a5,8(sp)
80410860:	00000713          	li	a4,0
80410864:	00040613          	mv	a2,s0
80410868:	00098593          	mv	a1,s3
8041086c:	000c8513          	mv	a0,s9
80410870:	000780e7          	jalr	a5
80410874:	00051463          	bnez	a0,8041087c <sfs_io_nolock+0x2ac>
80410878:	008b0b33          	add	s6,s6,s0
8041087c:	01648db3          	add	s11,s1,s6
80410880:	ea9ff06f          	j	80410728 <sfs_io_nolock+0x158>
80410884:	ffd00513          	li	a0,-3
80410888:	ebdff06f          	j	80410744 <sfs_io_nolock+0x174>
8041088c:	00005697          	auipc	a3,0x5
80410890:	31868693          	addi	a3,a3,792 # 80415ba4 <dev_node_ops+0x6ac>
80410894:	00002617          	auipc	a2,0x2
80410898:	35460613          	addi	a2,a2,852 # 80412be8 <commands+0x1bc>
8041089c:	22b00593          	li	a1,555
804108a0:	00005517          	auipc	a0,0x5
804108a4:	29c50513          	addi	a0,a0,668 # 80415b3c <dev_node_ops+0x644>
804108a8:	d7def0ef          	jal	ra,80400624 <__panic>

804108ac <sfs_dirent_read_nolock>:
804108ac:	0005a783          	lw	a5,0(a1)
804108b0:	fe010113          	addi	sp,sp,-32
804108b4:	00112e23          	sw	ra,28(sp)
804108b8:	0047d803          	lhu	a6,4(a5)
804108bc:	00812c23          	sw	s0,24(sp)
804108c0:	00912a23          	sw	s1,20(sp)
804108c4:	00200713          	li	a4,2
804108c8:	06e81e63          	bne	a6,a4,80410944 <sfs_dirent_read_nolock+0x98>
804108cc:	0087a783          	lw	a5,8(a5)
804108d0:	06f67a63          	bgeu	a2,a5,80410944 <sfs_dirent_read_nolock+0x98>
804108d4:	00068493          	mv	s1,a3
804108d8:	00c10693          	addi	a3,sp,12
804108dc:	00050413          	mv	s0,a0
804108e0:	a0dff0ef          	jal	ra,804102ec <sfs_bmap_load_nolock>
804108e4:	00050c63          	beqz	a0,804108fc <sfs_dirent_read_nolock+0x50>
804108e8:	01c12083          	lw	ra,28(sp)
804108ec:	01812403          	lw	s0,24(sp)
804108f0:	01412483          	lw	s1,20(sp)
804108f4:	02010113          	addi	sp,sp,32
804108f8:	00008067          	ret
804108fc:	00c12603          	lw	a2,12(sp)
80410900:	00442503          	lw	a0,4(s0) # 8000004 <_binary_bin_sfs_img_size+0x7f88004>
80410904:	03040593          	addi	a1,s0,48
80410908:	e24ff0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
8041090c:	04050c63          	beqz	a0,80410964 <sfs_dirent_read_nolock+0xb8>
80410910:	00c12683          	lw	a3,12(sp)
80410914:	00000713          	li	a4,0
80410918:	10400613          	li	a2,260
8041091c:	00048593          	mv	a1,s1
80410920:	00040513          	mv	a0,s0
80410924:	2d0010ef          	jal	ra,80411bf4 <sfs_rbuf>
80410928:	fc0510e3          	bnez	a0,804108e8 <sfs_dirent_read_nolock+0x3c>
8041092c:	100481a3          	sb	zero,259(s1)
80410930:	01c12083          	lw	ra,28(sp)
80410934:	01812403          	lw	s0,24(sp)
80410938:	01412483          	lw	s1,20(sp)
8041093c:	02010113          	addi	sp,sp,32
80410940:	00008067          	ret
80410944:	00005697          	auipc	a3,0x5
80410948:	1ac68693          	addi	a3,a3,428 # 80415af0 <dev_node_ops+0x5f8>
8041094c:	00002617          	auipc	a2,0x2
80410950:	29c60613          	addi	a2,a2,668 # 80412be8 <commands+0x1bc>
80410954:	18e00593          	li	a1,398
80410958:	00005517          	auipc	a0,0x5
8041095c:	1e450513          	addi	a0,a0,484 # 80415b3c <dev_node_ops+0x644>
80410960:	cc5ef0ef          	jal	ra,80400624 <__panic>
80410964:	00005697          	auipc	a3,0x5
80410968:	17068693          	addi	a3,a3,368 # 80415ad4 <dev_node_ops+0x5dc>
8041096c:	00002617          	auipc	a2,0x2
80410970:	27c60613          	addi	a2,a2,636 # 80412be8 <commands+0x1bc>
80410974:	19500593          	li	a1,405
80410978:	00005517          	auipc	a0,0x5
8041097c:	1c450513          	addi	a0,a0,452 # 80415b3c <dev_node_ops+0x644>
80410980:	ca5ef0ef          	jal	ra,80400624 <__panic>

80410984 <sfs_getdirentry>:
80410984:	fd010113          	addi	sp,sp,-48
80410988:	02912223          	sw	s1,36(sp)
8041098c:	00050493          	mv	s1,a0
80410990:	10400513          	li	a0,260
80410994:	01812423          	sw	s8,8(sp)
80410998:	02112623          	sw	ra,44(sp)
8041099c:	02812423          	sw	s0,40(sp)
804109a0:	03212023          	sw	s2,32(sp)
804109a4:	01312e23          	sw	s3,28(sp)
804109a8:	01412c23          	sw	s4,24(sp)
804109ac:	01512a23          	sw	s5,20(sp)
804109b0:	01612823          	sw	s6,16(sp)
804109b4:	01712623          	sw	s7,12(sp)
804109b8:	00058c13          	mv	s8,a1
804109bc:	804f20ef          	jal	ra,804029c0 <kmalloc>
804109c0:	12050a63          	beqz	a0,80410af4 <sfs_getdirentry+0x170>
804109c4:	0384aa83          	lw	s5,56(s1)
804109c8:	120a8a63          	beqz	s5,80410afc <sfs_getdirentry+0x178>
804109cc:	06caa783          	lw	a5,108(s5)
804109d0:	12079663          	bnez	a5,80410afc <sfs_getdirentry+0x178>
804109d4:	02c4a703          	lw	a4,44(s1)
804109d8:	000017b7          	lui	a5,0x1
804109dc:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804109e0:	12f71e63          	bne	a4,a5,80410b1c <sfs_getdirentry+0x198>
804109e4:	004c2403          	lw	s0,4(s8)
804109e8:	00050913          	mv	s2,a0
804109ec:	0e044663          	bltz	s0,80410ad8 <sfs_getdirentry+0x154>
804109f0:	0ff47793          	andi	a5,s0,255
804109f4:	0e079263          	bnez	a5,80410ad8 <sfs_getdirentry+0x154>
804109f8:	0004a783          	lw	a5,0(s1)
804109fc:	00845413          	srli	s0,s0,0x8
80410a00:	0087a783          	lw	a5,8(a5)
80410a04:	0e87e263          	bltu	a5,s0,80410ae8 <sfs_getdirentry+0x164>
80410a08:	01048b93          	addi	s7,s1,16
80410a0c:	000b8513          	mv	a0,s7
80410a10:	eecf40ef          	jal	ra,804050fc <down>
80410a14:	0004a783          	lw	a5,0(s1)
80410a18:	0087ab03          	lw	s6,8(a5)
80410a1c:	0b605663          	blez	s6,80410ac8 <sfs_getdirentry+0x144>
80410a20:	00000993          	li	s3,0
80410a24:	01c0006f          	j	80410a40 <sfs_getdirentry+0xbc>
80410a28:	00092783          	lw	a5,0(s2)
80410a2c:	00078663          	beqz	a5,80410a38 <sfs_getdirentry+0xb4>
80410a30:	02040c63          	beqz	s0,80410a68 <sfs_getdirentry+0xe4>
80410a34:	fff40413          	addi	s0,s0,-1
80410a38:	00198993          	addi	s3,s3,1
80410a3c:	093b0663          	beq	s6,s3,80410ac8 <sfs_getdirentry+0x144>
80410a40:	00090693          	mv	a3,s2
80410a44:	00098613          	mv	a2,s3
80410a48:	00048593          	mv	a1,s1
80410a4c:	000a8513          	mv	a0,s5
80410a50:	e5dff0ef          	jal	ra,804108ac <sfs_dirent_read_nolock>
80410a54:	00050a13          	mv	s4,a0
80410a58:	fc0508e3          	beqz	a0,80410a28 <sfs_getdirentry+0xa4>
80410a5c:	000b8513          	mv	a0,s7
80410a60:	e98f40ef          	jal	ra,804050f8 <up>
80410a64:	0280006f          	j	80410a8c <sfs_getdirentry+0x108>
80410a68:	000b8513          	mv	a0,s7
80410a6c:	e8cf40ef          	jal	ra,804050f8 <up>
80410a70:	00000713          	li	a4,0
80410a74:	00100693          	li	a3,1
80410a78:	10000613          	li	a2,256
80410a7c:	00490593          	addi	a1,s2,4
80410a80:	000c0513          	mv	a0,s8
80410a84:	ae1f50ef          	jal	ra,80406564 <iobuf_move>
80410a88:	00050a13          	mv	s4,a0
80410a8c:	00090513          	mv	a0,s2
80410a90:	854f20ef          	jal	ra,80402ae4 <kfree>
80410a94:	02c12083          	lw	ra,44(sp)
80410a98:	02812403          	lw	s0,40(sp)
80410a9c:	000a0513          	mv	a0,s4
80410aa0:	02412483          	lw	s1,36(sp)
80410aa4:	02012903          	lw	s2,32(sp)
80410aa8:	01c12983          	lw	s3,28(sp)
80410aac:	01812a03          	lw	s4,24(sp)
80410ab0:	01412a83          	lw	s5,20(sp)
80410ab4:	01012b03          	lw	s6,16(sp)
80410ab8:	00c12b83          	lw	s7,12(sp)
80410abc:	00812c03          	lw	s8,8(sp)
80410ac0:	03010113          	addi	sp,sp,48
80410ac4:	00008067          	ret
80410ac8:	000b8513          	mv	a0,s7
80410acc:	ff000a13          	li	s4,-16
80410ad0:	e28f40ef          	jal	ra,804050f8 <up>
80410ad4:	fb9ff06f          	j	80410a8c <sfs_getdirentry+0x108>
80410ad8:	00090513          	mv	a0,s2
80410adc:	808f20ef          	jal	ra,80402ae4 <kfree>
80410ae0:	ffd00a13          	li	s4,-3
80410ae4:	fb1ff06f          	j	80410a94 <sfs_getdirentry+0x110>
80410ae8:	ffdf10ef          	jal	ra,80402ae4 <kfree>
80410aec:	ff000a13          	li	s4,-16
80410af0:	fa5ff06f          	j	80410a94 <sfs_getdirentry+0x110>
80410af4:	ffc00a13          	li	s4,-4
80410af8:	f9dff06f          	j	80410a94 <sfs_getdirentry+0x110>
80410afc:	00005697          	auipc	a3,0x5
80410b00:	ea468693          	addi	a3,a3,-348 # 804159a0 <dev_node_ops+0x4a8>
80410b04:	00002617          	auipc	a2,0x2
80410b08:	0e460613          	addi	a2,a2,228 # 80412be8 <commands+0x1bc>
80410b0c:	33a00593          	li	a1,826
80410b10:	00005517          	auipc	a0,0x5
80410b14:	02c50513          	addi	a0,a0,44 # 80415b3c <dev_node_ops+0x644>
80410b18:	b0def0ef          	jal	ra,80400624 <__panic>
80410b1c:	00005697          	auipc	a3,0x5
80410b20:	03868693          	addi	a3,a3,56 # 80415b54 <dev_node_ops+0x65c>
80410b24:	00002617          	auipc	a2,0x2
80410b28:	0c460613          	addi	a2,a2,196 # 80412be8 <commands+0x1bc>
80410b2c:	33b00593          	li	a1,827
80410b30:	00005517          	auipc	a0,0x5
80410b34:	00c50513          	addi	a0,a0,12 # 80415b3c <dev_node_ops+0x644>
80410b38:	aedef0ef          	jal	ra,80400624 <__panic>

80410b3c <sfs_truncfile>:
80410b3c:	fa010113          	addi	sp,sp,-96
80410b40:	04112e23          	sw	ra,92(sp)
80410b44:	04812c23          	sw	s0,88(sp)
80410b48:	04912a23          	sw	s1,84(sp)
80410b4c:	05212823          	sw	s2,80(sp)
80410b50:	05312623          	sw	s3,76(sp)
80410b54:	05412423          	sw	s4,72(sp)
80410b58:	05512223          	sw	s5,68(sp)
80410b5c:	05612023          	sw	s6,64(sp)
80410b60:	03712e23          	sw	s7,60(sp)
80410b64:	03812c23          	sw	s8,56(sp)
80410b68:	03912a23          	sw	s9,52(sp)
80410b6c:	03a12823          	sw	s10,48(sp)
80410b70:	03b12623          	sw	s11,44(sp)
80410b74:	080007b7          	lui	a5,0x8000
80410b78:	1eb7ec63          	bltu	a5,a1,80410d70 <sfs_truncfile+0x234>
80410b7c:	03852d03          	lw	s10,56(a0)
80410b80:	00050913          	mv	s2,a0
80410b84:	00058a13          	mv	s4,a1
80410b88:	1e0d0863          	beqz	s10,80410d78 <sfs_truncfile+0x23c>
80410b8c:	06cd2783          	lw	a5,108(s10)
80410b90:	1e079463          	bnez	a5,80410d78 <sfs_truncfile+0x23c>
80410b94:	02c52703          	lw	a4,44(a0)
80410b98:	000014b7          	lui	s1,0x1
80410b9c:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410ba0:	20f71c63          	bne	a4,a5,80410db8 <sfs_truncfile+0x27c>
80410ba4:	00052a83          	lw	s5,0(a0)
80410ba8:	fff48493          	addi	s1,s1,-1
80410bac:	009584b3          	add	s1,a1,s1
80410bb0:	000aa783          	lw	a5,0(s5)
80410bb4:	00c4d493          	srli	s1,s1,0xc
80410bb8:	04f59863          	bne	a1,a5,80410c08 <sfs_truncfile+0xcc>
80410bbc:	008aa783          	lw	a5,8(s5)
80410bc0:	00000c93          	li	s9,0
80410bc4:	20f49a63          	bne	s1,a5,80410dd8 <sfs_truncfile+0x29c>
80410bc8:	05c12083          	lw	ra,92(sp)
80410bcc:	05812403          	lw	s0,88(sp)
80410bd0:	000c8513          	mv	a0,s9
80410bd4:	05412483          	lw	s1,84(sp)
80410bd8:	05012903          	lw	s2,80(sp)
80410bdc:	04c12983          	lw	s3,76(sp)
80410be0:	04812a03          	lw	s4,72(sp)
80410be4:	04412a83          	lw	s5,68(sp)
80410be8:	04012b03          	lw	s6,64(sp)
80410bec:	03c12b83          	lw	s7,60(sp)
80410bf0:	03812c03          	lw	s8,56(sp)
80410bf4:	03412c83          	lw	s9,52(sp)
80410bf8:	03012d03          	lw	s10,48(sp)
80410bfc:	02c12d83          	lw	s11,44(sp)
80410c00:	06010113          	addi	sp,sp,96
80410c04:	00008067          	ret
80410c08:	01050b13          	addi	s6,a0,16
80410c0c:	000b0513          	mv	a0,s6
80410c10:	cecf40ef          	jal	ra,804050fc <down>
80410c14:	008aa403          	lw	s0,8(s5)
80410c18:	0e946063          	bltu	s0,s1,80410cf8 <sfs_truncfile+0x1bc>
80410c1c:	1084f263          	bgeu	s1,s0,80410d20 <sfs_truncfile+0x1e4>
80410c20:	00092d83          	lw	s11,0(s2)
80410c24:	008da783          	lw	a5,8(s11) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80410c28:	16078863          	beqz	a5,80410d98 <sfs_truncfile+0x25c>
80410c2c:	030d0713          	addi	a4,s10,48
80410c30:	00b00b93          	li	s7,11
80410c34:	00e12623          	sw	a4,12(sp)
80410c38:	00100c13          	li	s8,1
80410c3c:	0900006f          	j	80410ccc <sfs_truncfile+0x190>
80410c40:	ff378993          	addi	s3,a5,-13 # 7fffff3 <_binary_bin_sfs_img_size+0x7f87ff3>
80410c44:	3ff00793          	li	a5,1023
80410c48:	0737e063          	bltu	a5,s3,80410ca8 <sfs_truncfile+0x16c>
80410c4c:	03cda783          	lw	a5,60(s11)
80410c50:	04078c63          	beqz	a5,80410ca8 <sfs_truncfile+0x16c>
80410c54:	004d2503          	lw	a0,4(s10)
80410c58:	00c12583          	lw	a1,12(sp)
80410c5c:	00078613          	mv	a2,a5
80410c60:	00f12423          	sw	a5,8(sp)
80410c64:	ac8ff0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
80410c68:	00812783          	lw	a5,8(sp)
80410c6c:	18050663          	beqz	a0,80410df8 <sfs_truncfile+0x2bc>
80410c70:	00299993          	slli	s3,s3,0x2
80410c74:	00098713          	mv	a4,s3
80410c78:	00078693          	mv	a3,a5
80410c7c:	00400613          	li	a2,4
80410c80:	01810593          	addi	a1,sp,24
80410c84:	000d0513          	mv	a0,s10
80410c88:	00f12423          	sw	a5,8(sp)
80410c8c:	00012e23          	sw	zero,28(sp)
80410c90:	765000ef          	jal	ra,80411bf4 <sfs_rbuf>
80410c94:	00050c93          	mv	s9,a0
80410c98:	08051e63          	bnez	a0,80410d34 <sfs_truncfile+0x1f8>
80410c9c:	01812703          	lw	a4,24(sp)
80410ca0:	00812783          	lw	a5,8(sp)
80410ca4:	08071e63          	bnez	a4,80410d40 <sfs_truncfile+0x204>
80410ca8:	008da783          	lw	a5,8(s11)
80410cac:	fff40413          	addi	s0,s0,-1
80410cb0:	fff78793          	addi	a5,a5,-1
80410cb4:	00fda423          	sw	a5,8(s11)
80410cb8:	01892423          	sw	s8,8(s2)
80410cbc:	06848063          	beq	s1,s0,80410d1c <sfs_truncfile+0x1e0>
80410cc0:	00092d83          	lw	s11,0(s2)
80410cc4:	008da783          	lw	a5,8(s11)
80410cc8:	0c078863          	beqz	a5,80410d98 <sfs_truncfile+0x25c>
80410ccc:	fff78713          	addi	a4,a5,-1
80410cd0:	f6ebe8e3          	bltu	s7,a4,80410c40 <sfs_truncfile+0x104>
80410cd4:	00279793          	slli	a5,a5,0x2
80410cd8:	00fd89b3          	add	s3,s11,a5
80410cdc:	0089a583          	lw	a1,8(s3)
80410ce0:	fc0584e3          	beqz	a1,80410ca8 <sfs_truncfile+0x16c>
80410ce4:	000d0513          	mv	a0,s10
80410ce8:	b54ff0ef          	jal	ra,8041003c <sfs_block_free>
80410cec:	0009a423          	sw	zero,8(s3)
80410cf0:	01892423          	sw	s8,8(s2)
80410cf4:	fb5ff06f          	j	80410ca8 <sfs_truncfile+0x16c>
80410cf8:	00000693          	li	a3,0
80410cfc:	00040613          	mv	a2,s0
80410d00:	00090593          	mv	a1,s2
80410d04:	000d0513          	mv	a0,s10
80410d08:	de4ff0ef          	jal	ra,804102ec <sfs_bmap_load_nolock>
80410d0c:	00050c93          	mv	s9,a0
80410d10:	02051263          	bnez	a0,80410d34 <sfs_truncfile+0x1f8>
80410d14:	00140413          	addi	s0,s0,1
80410d18:	fe8490e3          	bne	s1,s0,80410cf8 <sfs_truncfile+0x1bc>
80410d1c:	008aa403          	lw	s0,8(s5)
80410d20:	0e849c63          	bne	s1,s0,80410e18 <sfs_truncfile+0x2dc>
80410d24:	014aa023          	sw	s4,0(s5)
80410d28:	00100793          	li	a5,1
80410d2c:	00f92423          	sw	a5,8(s2)
80410d30:	00000c93          	li	s9,0
80410d34:	000b0513          	mv	a0,s6
80410d38:	bc0f40ef          	jal	ra,804050f8 <up>
80410d3c:	e8dff06f          	j	80410bc8 <sfs_truncfile+0x8c>
80410d40:	00098713          	mv	a4,s3
80410d44:	00078693          	mv	a3,a5
80410d48:	00400613          	li	a2,4
80410d4c:	01c10593          	addi	a1,sp,28
80410d50:	000d0513          	mv	a0,s10
80410d54:	76d000ef          	jal	ra,80411cc0 <sfs_wbuf>
80410d58:	00050c93          	mv	s9,a0
80410d5c:	fc051ce3          	bnez	a0,80410d34 <sfs_truncfile+0x1f8>
80410d60:	01812583          	lw	a1,24(sp)
80410d64:	000d0513          	mv	a0,s10
80410d68:	ad4ff0ef          	jal	ra,8041003c <sfs_block_free>
80410d6c:	f3dff06f          	j	80410ca8 <sfs_truncfile+0x16c>
80410d70:	ffd00c93          	li	s9,-3
80410d74:	e55ff06f          	j	80410bc8 <sfs_truncfile+0x8c>
80410d78:	00005697          	auipc	a3,0x5
80410d7c:	c2868693          	addi	a3,a3,-984 # 804159a0 <dev_node_ops+0x4a8>
80410d80:	00002617          	auipc	a2,0x2
80410d84:	e6860613          	addi	a2,a2,-408 # 80412be8 <commands+0x1bc>
80410d88:	3a900593          	li	a1,937
80410d8c:	00005517          	auipc	a0,0x5
80410d90:	db050513          	addi	a0,a0,-592 # 80415b3c <dev_node_ops+0x644>
80410d94:	891ef0ef          	jal	ra,80400624 <__panic>
80410d98:	00005697          	auipc	a3,0x5
80410d9c:	f6868693          	addi	a3,a3,-152 # 80415d00 <sfs_node_fileops+0x70>
80410da0:	00002617          	auipc	a2,0x2
80410da4:	e4860613          	addi	a2,a2,-440 # 80412be8 <commands+0x1bc>
80410da8:	17b00593          	li	a1,379
80410dac:	00005517          	auipc	a0,0x5
80410db0:	d9050513          	addi	a0,a0,-624 # 80415b3c <dev_node_ops+0x644>
80410db4:	871ef0ef          	jal	ra,80400624 <__panic>
80410db8:	00005697          	auipc	a3,0x5
80410dbc:	d9c68693          	addi	a3,a3,-612 # 80415b54 <dev_node_ops+0x65c>
80410dc0:	00002617          	auipc	a2,0x2
80410dc4:	e2860613          	addi	a2,a2,-472 # 80412be8 <commands+0x1bc>
80410dc8:	3aa00593          	li	a1,938
80410dcc:	00005517          	auipc	a0,0x5
80410dd0:	d7050513          	addi	a0,a0,-656 # 80415b3c <dev_node_ops+0x644>
80410dd4:	851ef0ef          	jal	ra,80400624 <__panic>
80410dd8:	00005697          	auipc	a3,0x5
80410ddc:	f1068693          	addi	a3,a3,-240 # 80415ce8 <sfs_node_fileops+0x58>
80410de0:	00002617          	auipc	a2,0x2
80410de4:	e0860613          	addi	a2,a2,-504 # 80412be8 <commands+0x1bc>
80410de8:	3b100593          	li	a1,945
80410dec:	00005517          	auipc	a0,0x5
80410df0:	d5050513          	addi	a0,a0,-688 # 80415b3c <dev_node_ops+0x644>
80410df4:	831ef0ef          	jal	ra,80400624 <__panic>
80410df8:	00005697          	auipc	a3,0x5
80410dfc:	f1c68693          	addi	a3,a3,-228 # 80415d14 <sfs_node_fileops+0x84>
80410e00:	00002617          	auipc	a2,0x2
80410e04:	de860613          	addi	a2,a2,-536 # 80412be8 <commands+0x1bc>
80410e08:	12b00593          	li	a1,299
80410e0c:	00005517          	auipc	a0,0x5
80410e10:	d3050513          	addi	a0,a0,-720 # 80415b3c <dev_node_ops+0x644>
80410e14:	811ef0ef          	jal	ra,80400624 <__panic>
80410e18:	00005697          	auipc	a3,0x5
80410e1c:	f3068693          	addi	a3,a3,-208 # 80415d48 <sfs_node_fileops+0xb8>
80410e20:	00002617          	auipc	a2,0x2
80410e24:	dc860613          	addi	a2,a2,-568 # 80412be8 <commands+0x1bc>
80410e28:	3ca00593          	li	a1,970
80410e2c:	00005517          	auipc	a0,0x5
80410e30:	d1050513          	addi	a0,a0,-752 # 80415b3c <dev_node_ops+0x644>
80410e34:	ff0ef0ef          	jal	ra,80400624 <__panic>

80410e38 <sfs_tryseek>:
80410e38:	080007b7          	lui	a5,0x8000
80410e3c:	08f5fa63          	bgeu	a1,a5,80410ed0 <sfs_tryseek+0x98>
80410e40:	ff010113          	addi	sp,sp,-16
80410e44:	00812423          	sw	s0,8(sp)
80410e48:	00912223          	sw	s1,4(sp)
80410e4c:	00112623          	sw	ra,12(sp)
80410e50:	00050413          	mv	s0,a0
80410e54:	00058493          	mv	s1,a1
80410e58:	08050063          	beqz	a0,80410ed8 <sfs_tryseek+0xa0>
80410e5c:	02c52703          	lw	a4,44(a0)
80410e60:	000017b7          	lui	a5,0x1
80410e64:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410e68:	06f71863          	bne	a4,a5,80410ed8 <sfs_tryseek+0xa0>
80410e6c:	00052783          	lw	a5,0(a0)
80410e70:	0007a783          	lw	a5,0(a5)
80410e74:	04b7f263          	bgeu	a5,a1,80410eb8 <sfs_tryseek+0x80>
80410e78:	03c52783          	lw	a5,60(a0)
80410e7c:	06078e63          	beqz	a5,80410ef8 <sfs_tryseek+0xc0>
80410e80:	0307a783          	lw	a5,48(a5)
80410e84:	06078a63          	beqz	a5,80410ef8 <sfs_tryseek+0xc0>
80410e88:	00004597          	auipc	a1,0x4
80410e8c:	4fc58593          	addi	a1,a1,1276 # 80415384 <syscalls+0x8c0>
80410e90:	d60fc0ef          	jal	ra,8040d3f0 <inode_check>
80410e94:	03c42783          	lw	a5,60(s0)
80410e98:	00040513          	mv	a0,s0
80410e9c:	00812403          	lw	s0,8(sp)
80410ea0:	00c12083          	lw	ra,12(sp)
80410ea4:	00048593          	mv	a1,s1
80410ea8:	0307a303          	lw	t1,48(a5)
80410eac:	00412483          	lw	s1,4(sp)
80410eb0:	01010113          	addi	sp,sp,16
80410eb4:	00030067          	jr	t1
80410eb8:	00c12083          	lw	ra,12(sp)
80410ebc:	00812403          	lw	s0,8(sp)
80410ec0:	00412483          	lw	s1,4(sp)
80410ec4:	00000513          	li	a0,0
80410ec8:	01010113          	addi	sp,sp,16
80410ecc:	00008067          	ret
80410ed0:	ffd00513          	li	a0,-3
80410ed4:	00008067          	ret
80410ed8:	00005697          	auipc	a3,0x5
80410edc:	c7c68693          	addi	a3,a3,-900 # 80415b54 <dev_node_ops+0x65c>
80410ee0:	00002617          	auipc	a2,0x2
80410ee4:	d0860613          	addi	a2,a2,-760 # 80412be8 <commands+0x1bc>
80410ee8:	39a00593          	li	a1,922
80410eec:	00005517          	auipc	a0,0x5
80410ef0:	c5050513          	addi	a0,a0,-944 # 80415b3c <dev_node_ops+0x644>
80410ef4:	f30ef0ef          	jal	ra,80400624 <__panic>
80410ef8:	00004697          	auipc	a3,0x4
80410efc:	43868693          	addi	a3,a3,1080 # 80415330 <syscalls+0x86c>
80410f00:	00002617          	auipc	a2,0x2
80410f04:	ce860613          	addi	a2,a2,-792 # 80412be8 <commands+0x1bc>
80410f08:	39c00593          	li	a1,924
80410f0c:	00005517          	auipc	a0,0x5
80410f10:	c3050513          	addi	a0,a0,-976 # 80415b3c <dev_node_ops+0x644>
80410f14:	f10ef0ef          	jal	ra,80400624 <__panic>

80410f18 <sfs_close>:
80410f18:	ff010113          	addi	sp,sp,-16
80410f1c:	00112623          	sw	ra,12(sp)
80410f20:	00812423          	sw	s0,8(sp)
80410f24:	04050063          	beqz	a0,80410f64 <sfs_close+0x4c>
80410f28:	03c52783          	lw	a5,60(a0)
80410f2c:	00050413          	mv	s0,a0
80410f30:	02078a63          	beqz	a5,80410f64 <sfs_close+0x4c>
80410f34:	0187a783          	lw	a5,24(a5)
80410f38:	02078663          	beqz	a5,80410f64 <sfs_close+0x4c>
80410f3c:	00003597          	auipc	a1,0x3
80410f40:	24858593          	addi	a1,a1,584 # 80414184 <CSWTCH.69+0x17c>
80410f44:	cacfc0ef          	jal	ra,8040d3f0 <inode_check>
80410f48:	03c42783          	lw	a5,60(s0)
80410f4c:	00040513          	mv	a0,s0
80410f50:	00812403          	lw	s0,8(sp)
80410f54:	00c12083          	lw	ra,12(sp)
80410f58:	0187a303          	lw	t1,24(a5)
80410f5c:	01010113          	addi	sp,sp,16
80410f60:	00030067          	jr	t1
80410f64:	00003697          	auipc	a3,0x3
80410f68:	1d068693          	addi	a3,a3,464 # 80414134 <CSWTCH.69+0x12c>
80410f6c:	00002617          	auipc	a2,0x2
80410f70:	c7c60613          	addi	a2,a2,-900 # 80412be8 <commands+0x1bc>
80410f74:	21c00593          	li	a1,540
80410f78:	00005517          	auipc	a0,0x5
80410f7c:	bc450513          	addi	a0,a0,-1084 # 80415b3c <dev_node_ops+0x644>
80410f80:	ea4ef0ef          	jal	ra,80400624 <__panic>

80410f84 <sfs_fstat>:
80410f84:	ff010113          	addi	sp,sp,-16
80410f88:	00912223          	sw	s1,4(sp)
80410f8c:	00058493          	mv	s1,a1
80410f90:	00812423          	sw	s0,8(sp)
80410f94:	01000613          	li	a2,16
80410f98:	00050413          	mv	s0,a0
80410f9c:	00000593          	li	a1,0
80410fa0:	00048513          	mv	a0,s1
80410fa4:	00112623          	sw	ra,12(sp)
80410fa8:	011010ef          	jal	ra,804127b8 <memset>
80410fac:	06040e63          	beqz	s0,80411028 <sfs_fstat+0xa4>
80410fb0:	03c42783          	lw	a5,60(s0)
80410fb4:	06078a63          	beqz	a5,80411028 <sfs_fstat+0xa4>
80410fb8:	0287a783          	lw	a5,40(a5)
80410fbc:	06078663          	beqz	a5,80411028 <sfs_fstat+0xa4>
80410fc0:	00004597          	auipc	a1,0x4
80410fc4:	51c58593          	addi	a1,a1,1308 # 804154dc <syscalls+0xa18>
80410fc8:	00040513          	mv	a0,s0
80410fcc:	c24fc0ef          	jal	ra,8040d3f0 <inode_check>
80410fd0:	03c42783          	lw	a5,60(s0)
80410fd4:	00048593          	mv	a1,s1
80410fd8:	00040513          	mv	a0,s0
80410fdc:	0287a783          	lw	a5,40(a5)
80410fe0:	000780e7          	jalr	a5
80410fe4:	02051863          	bnez	a0,80411014 <sfs_fstat+0x90>
80410fe8:	02c42703          	lw	a4,44(s0)
80410fec:	000017b7          	lui	a5,0x1
80410ff0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410ff4:	04f71a63          	bne	a4,a5,80411048 <sfs_fstat+0xc4>
80410ff8:	00042783          	lw	a5,0(s0)
80410ffc:	0067d683          	lhu	a3,6(a5)
80411000:	0087a703          	lw	a4,8(a5)
80411004:	0007a783          	lw	a5,0(a5)
80411008:	00d4a223          	sw	a3,4(s1)
8041100c:	00e4a423          	sw	a4,8(s1)
80411010:	00f4a623          	sw	a5,12(s1)
80411014:	00c12083          	lw	ra,12(sp)
80411018:	00812403          	lw	s0,8(sp)
8041101c:	00412483          	lw	s1,4(sp)
80411020:	01010113          	addi	sp,sp,16
80411024:	00008067          	ret
80411028:	00004697          	auipc	a3,0x4
8041102c:	44c68693          	addi	a3,a3,1100 # 80415474 <syscalls+0x9b0>
80411030:	00002617          	auipc	a2,0x2
80411034:	bb860613          	addi	a2,a2,-1096 # 80412be8 <commands+0x1bc>
80411038:	2b800593          	li	a1,696
8041103c:	00005517          	auipc	a0,0x5
80411040:	b0050513          	addi	a0,a0,-1280 # 80415b3c <dev_node_ops+0x644>
80411044:	de0ef0ef          	jal	ra,80400624 <__panic>
80411048:	00005697          	auipc	a3,0x5
8041104c:	b0c68693          	addi	a3,a3,-1268 # 80415b54 <dev_node_ops+0x65c>
80411050:	00002617          	auipc	a2,0x2
80411054:	b9860613          	addi	a2,a2,-1128 # 80412be8 <commands+0x1bc>
80411058:	2bb00593          	li	a1,699
8041105c:	00005517          	auipc	a0,0x5
80411060:	ae050513          	addi	a0,a0,-1312 # 80415b3c <dev_node_ops+0x644>
80411064:	dc0ef0ef          	jal	ra,80400624 <__panic>

80411068 <sfs_io.part.12>:
80411068:	ff010113          	addi	sp,sp,-16
8041106c:	00005697          	auipc	a3,0x5
80411070:	ae868693          	addi	a3,a3,-1304 # 80415b54 <dev_node_ops+0x65c>
80411074:	00002617          	auipc	a2,0x2
80411078:	b7460613          	addi	a2,a2,-1164 # 80412be8 <commands+0x1bc>
8041107c:	29700593          	li	a1,663
80411080:	00005517          	auipc	a0,0x5
80411084:	abc50513          	addi	a0,a0,-1348 # 80415b3c <dev_node_ops+0x644>
80411088:	00112623          	sw	ra,12(sp)
8041108c:	d98ef0ef          	jal	ra,80400624 <__panic>

80411090 <sfs_read>:
80411090:	fd010113          	addi	sp,sp,-48
80411094:	03212023          	sw	s2,32(sp)
80411098:	03852903          	lw	s2,56(a0)
8041109c:	02112623          	sw	ra,44(sp)
804110a0:	02812423          	sw	s0,40(sp)
804110a4:	02912223          	sw	s1,36(sp)
804110a8:	01312e23          	sw	s3,28(sp)
804110ac:	08090a63          	beqz	s2,80411140 <sfs_read+0xb0>
804110b0:	06c92783          	lw	a5,108(s2)
804110b4:	08079663          	bnez	a5,80411140 <sfs_read+0xb0>
804110b8:	02c52703          	lw	a4,44(a0)
804110bc:	000017b7          	lui	a5,0x1
804110c0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804110c4:	00050413          	mv	s0,a0
804110c8:	08f71c63          	bne	a4,a5,80411160 <sfs_read+0xd0>
804110cc:	01050993          	addi	s3,a0,16
804110d0:	00098513          	mv	a0,s3
804110d4:	00058493          	mv	s1,a1
804110d8:	824f40ef          	jal	ra,804050fc <down>
804110dc:	00c4a803          	lw	a6,12(s1)
804110e0:	0044a683          	lw	a3,4(s1)
804110e4:	0004a603          	lw	a2,0(s1)
804110e8:	00040593          	mv	a1,s0
804110ec:	00000793          	li	a5,0
804110f0:	00c10713          	addi	a4,sp,12
804110f4:	00090513          	mv	a0,s2
804110f8:	01012623          	sw	a6,12(sp)
804110fc:	cd4ff0ef          	jal	ra,804105d0 <sfs_io_nolock>
80411100:	00c12583          	lw	a1,12(sp)
80411104:	00050413          	mv	s0,a0
80411108:	02059663          	bnez	a1,80411134 <sfs_read+0xa4>
8041110c:	00098513          	mv	a0,s3
80411110:	fe9f30ef          	jal	ra,804050f8 <up>
80411114:	00040513          	mv	a0,s0
80411118:	02c12083          	lw	ra,44(sp)
8041111c:	02812403          	lw	s0,40(sp)
80411120:	02412483          	lw	s1,36(sp)
80411124:	02012903          	lw	s2,32(sp)
80411128:	01c12983          	lw	s3,28(sp)
8041112c:	03010113          	addi	sp,sp,48
80411130:	00008067          	ret
80411134:	00048513          	mv	a0,s1
80411138:	ce8f50ef          	jal	ra,80406620 <iobuf_skip>
8041113c:	fd1ff06f          	j	8041110c <sfs_read+0x7c>
80411140:	00005697          	auipc	a3,0x5
80411144:	86068693          	addi	a3,a3,-1952 # 804159a0 <dev_node_ops+0x4a8>
80411148:	00002617          	auipc	a2,0x2
8041114c:	aa060613          	addi	a2,a2,-1376 # 80412be8 <commands+0x1bc>
80411150:	29600593          	li	a1,662
80411154:	00005517          	auipc	a0,0x5
80411158:	9e850513          	addi	a0,a0,-1560 # 80415b3c <dev_node_ops+0x644>
8041115c:	cc8ef0ef          	jal	ra,80400624 <__panic>
80411160:	f09ff0ef          	jal	ra,80411068 <sfs_io.part.12>

80411164 <sfs_write>:
80411164:	fd010113          	addi	sp,sp,-48
80411168:	03212023          	sw	s2,32(sp)
8041116c:	03852903          	lw	s2,56(a0)
80411170:	02112623          	sw	ra,44(sp)
80411174:	02812423          	sw	s0,40(sp)
80411178:	02912223          	sw	s1,36(sp)
8041117c:	01312e23          	sw	s3,28(sp)
80411180:	08090a63          	beqz	s2,80411214 <sfs_write+0xb0>
80411184:	06c92783          	lw	a5,108(s2)
80411188:	08079663          	bnez	a5,80411214 <sfs_write+0xb0>
8041118c:	02c52703          	lw	a4,44(a0)
80411190:	000017b7          	lui	a5,0x1
80411194:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411198:	00050413          	mv	s0,a0
8041119c:	08f71c63          	bne	a4,a5,80411234 <sfs_write+0xd0>
804111a0:	01050993          	addi	s3,a0,16
804111a4:	00098513          	mv	a0,s3
804111a8:	00058493          	mv	s1,a1
804111ac:	f51f30ef          	jal	ra,804050fc <down>
804111b0:	00c4a803          	lw	a6,12(s1)
804111b4:	0044a683          	lw	a3,4(s1)
804111b8:	0004a603          	lw	a2,0(s1)
804111bc:	00040593          	mv	a1,s0
804111c0:	00100793          	li	a5,1
804111c4:	00c10713          	addi	a4,sp,12
804111c8:	00090513          	mv	a0,s2
804111cc:	01012623          	sw	a6,12(sp)
804111d0:	c00ff0ef          	jal	ra,804105d0 <sfs_io_nolock>
804111d4:	00c12583          	lw	a1,12(sp)
804111d8:	00050413          	mv	s0,a0
804111dc:	02059663          	bnez	a1,80411208 <sfs_write+0xa4>
804111e0:	00098513          	mv	a0,s3
804111e4:	f15f30ef          	jal	ra,804050f8 <up>
804111e8:	00040513          	mv	a0,s0
804111ec:	02c12083          	lw	ra,44(sp)
804111f0:	02812403          	lw	s0,40(sp)
804111f4:	02412483          	lw	s1,36(sp)
804111f8:	02012903          	lw	s2,32(sp)
804111fc:	01c12983          	lw	s3,28(sp)
80411200:	03010113          	addi	sp,sp,48
80411204:	00008067          	ret
80411208:	00048513          	mv	a0,s1
8041120c:	c14f50ef          	jal	ra,80406620 <iobuf_skip>
80411210:	fd1ff06f          	j	804111e0 <sfs_write+0x7c>
80411214:	00004697          	auipc	a3,0x4
80411218:	78c68693          	addi	a3,a3,1932 # 804159a0 <dev_node_ops+0x4a8>
8041121c:	00002617          	auipc	a2,0x2
80411220:	9cc60613          	addi	a2,a2,-1588 # 80412be8 <commands+0x1bc>
80411224:	29600593          	li	a1,662
80411228:	00005517          	auipc	a0,0x5
8041122c:	91450513          	addi	a0,a0,-1772 # 80415b3c <dev_node_ops+0x644>
80411230:	bf4ef0ef          	jal	ra,80400624 <__panic>
80411234:	e35ff0ef          	jal	ra,80411068 <sfs_io.part.12>

80411238 <sfs_load_inode>:
80411238:	fe010113          	addi	sp,sp,-32
8041123c:	00112e23          	sw	ra,28(sp)
80411240:	00812c23          	sw	s0,24(sp)
80411244:	01212823          	sw	s2,16(sp)
80411248:	01312623          	sw	s3,12(sp)
8041124c:	00050913          	mv	s2,a0
80411250:	00060993          	mv	s3,a2
80411254:	01412423          	sw	s4,8(sp)
80411258:	00912a23          	sw	s1,20(sp)
8041125c:	00058a13          	mv	s4,a1
80411260:	01512223          	sw	s5,4(sp)
80411264:	4f5000ef          	jal	ra,80411f58 <lock_sfs_fs>
80411268:	00a00593          	li	a1,10
8041126c:	06892403          	lw	s0,104(s2)
80411270:	00098513          	mv	a0,s3
80411274:	505000ef          	jal	ra,80411f78 <hash32>
80411278:	00351513          	slli	a0,a0,0x3
8041127c:	00a40533          	add	a0,s0,a0
80411280:	00050413          	mv	s0,a0
80411284:	00c0006f          	j	80411290 <sfs_load_inode+0x58>
80411288:	fe042783          	lw	a5,-32(s0)
8041128c:	10f98a63          	beq	s3,a5,804113a0 <sfs_load_inode+0x168>
80411290:	00442403          	lw	s0,4(s0)
80411294:	fe851ae3          	bne	a0,s0,80411288 <sfs_load_inode+0x50>
80411298:	04000513          	li	a0,64
8041129c:	f24f10ef          	jal	ra,804029c0 <kmalloc>
804112a0:	00050a93          	mv	s5,a0
804112a4:	14050e63          	beqz	a0,80411400 <sfs_load_inode+0x1c8>
804112a8:	00492503          	lw	a0,4(s2)
804112ac:	00098613          	mv	a2,s3
804112b0:	03090593          	addi	a1,s2,48
804112b4:	c79fe0ef          	jal	ra,8040ff2c <sfs_block_inuse.isra.3>
804112b8:	1e050863          	beqz	a0,804114a8 <sfs_load_inode+0x270>
804112bc:	00000713          	li	a4,0
804112c0:	00098693          	mv	a3,s3
804112c4:	04000613          	li	a2,64
804112c8:	000a8593          	mv	a1,s5
804112cc:	00090513          	mv	a0,s2
804112d0:	125000ef          	jal	ra,80411bf4 <sfs_rbuf>
804112d4:	00050413          	mv	s0,a0
804112d8:	12051e63          	bnez	a0,80411414 <sfs_load_inode+0x1dc>
804112dc:	006ad783          	lhu	a5,6(s5)
804112e0:	1a078463          	beqz	a5,80411488 <sfs_load_inode+0x250>
804112e4:	00001537          	lui	a0,0x1
804112e8:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804112ec:	830fc0ef          	jal	ra,8040d31c <__alloc_inode>
804112f0:	00050493          	mv	s1,a0
804112f4:	10050e63          	beqz	a0,80411410 <sfs_load_inode+0x1d8>
804112f8:	004ad683          	lhu	a3,4(s5)
804112fc:	00100793          	li	a5,1
80411300:	12f69063          	bne	a3,a5,80411420 <sfs_load_inode+0x1e8>
80411304:	00005597          	auipc	a1,0x5
80411308:	98c58593          	addi	a1,a1,-1652 # 80415c90 <sfs_node_fileops>
8041130c:	00090613          	mv	a2,s2
80411310:	00048513          	mv	a0,s1
80411314:	838fc0ef          	jal	ra,8040d34c <inode_init>
80411318:	02c4a403          	lw	s0,44(s1)
8041131c:	000017b7          	lui	a5,0x1
80411320:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411324:	14f41263          	bne	s0,a5,80411468 <sfs_load_inode+0x230>
80411328:	00100793          	li	a5,1
8041132c:	00f4a623          	sw	a5,12(s1)
80411330:	0154a023          	sw	s5,0(s1)
80411334:	0134a223          	sw	s3,4(s1)
80411338:	0004a423          	sw	zero,8(s1)
8041133c:	00100593          	li	a1,1
80411340:	01048513          	addi	a0,s1,16
80411344:	da9f30ef          	jal	ra,804050ec <sem_init>
80411348:	02c4a783          	lw	a5,44(s1)
8041134c:	0e879e63          	bne	a5,s0,80411448 <sfs_load_inode+0x210>
80411350:	06492683          	lw	a3,100(s2)
80411354:	01c48793          	addi	a5,s1,28
80411358:	06090713          	addi	a4,s2,96
8041135c:	00f6a023          	sw	a5,0(a3)
80411360:	06f92223          	sw	a5,100(s2)
80411364:	0044a503          	lw	a0,4(s1)
80411368:	00e4ae23          	sw	a4,28(s1)
8041136c:	02d4a023          	sw	a3,32(s1)
80411370:	06892403          	lw	s0,104(s2)
80411374:	00a00593          	li	a1,10
80411378:	401000ef          	jal	ra,80411f78 <hash32>
8041137c:	00351513          	slli	a0,a0,0x3
80411380:	00a40533          	add	a0,s0,a0
80411384:	00452783          	lw	a5,4(a0)
80411388:	02448713          	addi	a4,s1,36
8041138c:	00e7a023          	sw	a4,0(a5)
80411390:	00e52223          	sw	a4,4(a0)
80411394:	02f4a423          	sw	a5,40(s1)
80411398:	02a4a223          	sw	a0,36(s1)
8041139c:	01c0006f          	j	804113b8 <sfs_load_inode+0x180>
804113a0:	fdc40493          	addi	s1,s0,-36
804113a4:	00048513          	mv	a0,s1
804113a8:	820fc0ef          	jal	ra,8040d3c8 <inode_ref_inc>
804113ac:	00100793          	li	a5,1
804113b0:	04f50063          	beq	a0,a5,804113f0 <sfs_load_inode+0x1b8>
804113b4:	ee0482e3          	beqz	s1,80411298 <sfs_load_inode+0x60>
804113b8:	00090513          	mv	a0,s2
804113bc:	3ad000ef          	jal	ra,80411f68 <unlock_sfs_fs>
804113c0:	00000413          	li	s0,0
804113c4:	009a2023          	sw	s1,0(s4)
804113c8:	00040513          	mv	a0,s0
804113cc:	01c12083          	lw	ra,28(sp)
804113d0:	01812403          	lw	s0,24(sp)
804113d4:	01412483          	lw	s1,20(sp)
804113d8:	01012903          	lw	s2,16(sp)
804113dc:	00c12983          	lw	s3,12(sp)
804113e0:	00812a03          	lw	s4,8(sp)
804113e4:	00412a83          	lw	s5,4(sp)
804113e8:	02010113          	addi	sp,sp,32
804113ec:	00008067          	ret
804113f0:	fe842783          	lw	a5,-24(s0)
804113f4:	00178793          	addi	a5,a5,1
804113f8:	fef42423          	sw	a5,-24(s0)
804113fc:	fb9ff06f          	j	804113b4 <sfs_load_inode+0x17c>
80411400:	ffc00413          	li	s0,-4
80411404:	00090513          	mv	a0,s2
80411408:	361000ef          	jal	ra,80411f68 <unlock_sfs_fs>
8041140c:	fbdff06f          	j	804113c8 <sfs_load_inode+0x190>
80411410:	ffc00413          	li	s0,-4
80411414:	000a8513          	mv	a0,s5
80411418:	eccf10ef          	jal	ra,80402ae4 <kfree>
8041141c:	fe9ff06f          	j	80411404 <sfs_load_inode+0x1cc>
80411420:	00200793          	li	a5,2
80411424:	00005597          	auipc	a1,0x5
80411428:	82c58593          	addi	a1,a1,-2004 # 80415c50 <sfs_node_dirops>
8041142c:	eef680e3          	beq	a3,a5,8041130c <sfs_load_inode+0xd4>
80411430:	00004617          	auipc	a2,0x4
80411434:	75c60613          	addi	a2,a2,1884 # 80415b8c <dev_node_ops+0x694>
80411438:	02e00593          	li	a1,46
8041143c:	00004517          	auipc	a0,0x4
80411440:	70050513          	addi	a0,a0,1792 # 80415b3c <dev_node_ops+0x644>
80411444:	9e0ef0ef          	jal	ra,80400624 <__panic>
80411448:	00004697          	auipc	a3,0x4
8041144c:	70c68693          	addi	a3,a3,1804 # 80415b54 <dev_node_ops+0x65c>
80411450:	00001617          	auipc	a2,0x1
80411454:	79860613          	addi	a2,a2,1944 # 80412be8 <commands+0x1bc>
80411458:	0b100593          	li	a1,177
8041145c:	00004517          	auipc	a0,0x4
80411460:	6e050513          	addi	a0,a0,1760 # 80415b3c <dev_node_ops+0x644>
80411464:	9c0ef0ef          	jal	ra,80400624 <__panic>
80411468:	00004697          	auipc	a3,0x4
8041146c:	6ec68693          	addi	a3,a3,1772 # 80415b54 <dev_node_ops+0x65c>
80411470:	00001617          	auipc	a2,0x1
80411474:	77860613          	addi	a2,a2,1912 # 80412be8 <commands+0x1bc>
80411478:	07700593          	li	a1,119
8041147c:	00004517          	auipc	a0,0x4
80411480:	6c050513          	addi	a0,a0,1728 # 80415b3c <dev_node_ops+0x644>
80411484:	9a0ef0ef          	jal	ra,80400624 <__panic>
80411488:	00004697          	auipc	a3,0x4
8041148c:	73868693          	addi	a3,a3,1848 # 80415bc0 <dev_node_ops+0x6c8>
80411490:	00001617          	auipc	a2,0x1
80411494:	75860613          	addi	a2,a2,1880 # 80412be8 <commands+0x1bc>
80411498:	0ad00593          	li	a1,173
8041149c:	00004517          	auipc	a0,0x4
804114a0:	6a050513          	addi	a0,a0,1696 # 80415b3c <dev_node_ops+0x644>
804114a4:	980ef0ef          	jal	ra,80400624 <__panic>
804114a8:	00004697          	auipc	a3,0x4
804114ac:	62c68693          	addi	a3,a3,1580 # 80415ad4 <dev_node_ops+0x5dc>
804114b0:	00001617          	auipc	a2,0x1
804114b4:	73860613          	addi	a2,a2,1848 # 80412be8 <commands+0x1bc>
804114b8:	0a800593          	li	a1,168
804114bc:	00004517          	auipc	a0,0x4
804114c0:	68050513          	addi	a0,a0,1664 # 80415b3c <dev_node_ops+0x644>
804114c4:	960ef0ef          	jal	ra,80400624 <__panic>

804114c8 <sfs_lookup_once.constprop.13>:
804114c8:	fd010113          	addi	sp,sp,-48
804114cc:	01312e23          	sw	s3,28(sp)
804114d0:	01058993          	addi	s3,a1,16
804114d4:	01712623          	sw	s7,12(sp)
804114d8:	00050b93          	mv	s7,a0
804114dc:	00098513          	mv	a0,s3
804114e0:	02112623          	sw	ra,44(sp)
804114e4:	03212023          	sw	s2,32(sp)
804114e8:	01512a23          	sw	s5,20(sp)
804114ec:	01812423          	sw	s8,8(sp)
804114f0:	00060a93          	mv	s5,a2
804114f4:	00058913          	mv	s2,a1
804114f8:	00068c13          	mv	s8,a3
804114fc:	02812423          	sw	s0,40(sp)
80411500:	02912223          	sw	s1,36(sp)
80411504:	01412c23          	sw	s4,24(sp)
80411508:	01612823          	sw	s6,16(sp)
8041150c:	01912223          	sw	s9,4(sp)
80411510:	bedf30ef          	jal	ra,804050fc <down>
80411514:	000a8513          	mv	a0,s5
80411518:	1bc010ef          	jal	ra,804126d4 <strlen>
8041151c:	0ff00793          	li	a5,255
80411520:	10a7ee63          	bltu	a5,a0,8041163c <sfs_lookup_once.constprop.13+0x174>
80411524:	10400513          	li	a0,260
80411528:	c98f10ef          	jal	ra,804029c0 <kmalloc>
8041152c:	00050413          	mv	s0,a0
80411530:	0e050e63          	beqz	a0,8041162c <sfs_lookup_once.constprop.13+0x164>
80411534:	00092783          	lw	a5,0(s2)
80411538:	0087ab03          	lw	s6,8(a5)
8041153c:	09605a63          	blez	s6,804115d0 <sfs_lookup_once.constprop.13+0x108>
80411540:	00000493          	li	s1,0
80411544:	00450c93          	addi	s9,a0,4
80411548:	0240006f          	j	8041156c <sfs_lookup_once.constprop.13+0xa4>
8041154c:	00042783          	lw	a5,0(s0)
80411550:	00078a63          	beqz	a5,80411564 <sfs_lookup_once.constprop.13+0x9c>
80411554:	000c8593          	mv	a1,s9
80411558:	000a8513          	mv	a0,s5
8041155c:	200010ef          	jal	ra,8041275c <strcmp>
80411560:	06050c63          	beqz	a0,804115d8 <sfs_lookup_once.constprop.13+0x110>
80411564:	00148493          	addi	s1,s1,1
80411568:	069b0463          	beq	s6,s1,804115d0 <sfs_lookup_once.constprop.13+0x108>
8041156c:	00040693          	mv	a3,s0
80411570:	00048613          	mv	a2,s1
80411574:	00090593          	mv	a1,s2
80411578:	000b8513          	mv	a0,s7
8041157c:	b30ff0ef          	jal	ra,804108ac <sfs_dirent_read_nolock>
80411580:	00050a13          	mv	s4,a0
80411584:	fc0504e3          	beqz	a0,8041154c <sfs_lookup_once.constprop.13+0x84>
80411588:	00040513          	mv	a0,s0
8041158c:	d58f10ef          	jal	ra,80402ae4 <kfree>
80411590:	00098513          	mv	a0,s3
80411594:	b65f30ef          	jal	ra,804050f8 <up>
80411598:	02c12083          	lw	ra,44(sp)
8041159c:	02812403          	lw	s0,40(sp)
804115a0:	000a0513          	mv	a0,s4
804115a4:	02412483          	lw	s1,36(sp)
804115a8:	02012903          	lw	s2,32(sp)
804115ac:	01c12983          	lw	s3,28(sp)
804115b0:	01812a03          	lw	s4,24(sp)
804115b4:	01412a83          	lw	s5,20(sp)
804115b8:	01012b03          	lw	s6,16(sp)
804115bc:	00c12b83          	lw	s7,12(sp)
804115c0:	00812c03          	lw	s8,8(sp)
804115c4:	00412c83          	lw	s9,4(sp)
804115c8:	03010113          	addi	sp,sp,48
804115cc:	00008067          	ret
804115d0:	ff000a13          	li	s4,-16
804115d4:	fb5ff06f          	j	80411588 <sfs_lookup_once.constprop.13+0xc0>
804115d8:	00040513          	mv	a0,s0
804115dc:	00042483          	lw	s1,0(s0)
804115e0:	d04f10ef          	jal	ra,80402ae4 <kfree>
804115e4:	00098513          	mv	a0,s3
804115e8:	b11f30ef          	jal	ra,804050f8 <up>
804115ec:	02812403          	lw	s0,40(sp)
804115f0:	02c12083          	lw	ra,44(sp)
804115f4:	02012903          	lw	s2,32(sp)
804115f8:	01c12983          	lw	s3,28(sp)
804115fc:	01812a03          	lw	s4,24(sp)
80411600:	01412a83          	lw	s5,20(sp)
80411604:	01012b03          	lw	s6,16(sp)
80411608:	00412c83          	lw	s9,4(sp)
8041160c:	00048613          	mv	a2,s1
80411610:	000c0593          	mv	a1,s8
80411614:	02412483          	lw	s1,36(sp)
80411618:	00812c03          	lw	s8,8(sp)
8041161c:	000b8513          	mv	a0,s7
80411620:	00c12b83          	lw	s7,12(sp)
80411624:	03010113          	addi	sp,sp,48
80411628:	c11ff06f          	j	80411238 <sfs_load_inode>
8041162c:	00098513          	mv	a0,s3
80411630:	ac9f30ef          	jal	ra,804050f8 <up>
80411634:	ffc00a13          	li	s4,-4
80411638:	f61ff06f          	j	80411598 <sfs_lookup_once.constprop.13+0xd0>
8041163c:	00004697          	auipc	a3,0x4
80411640:	5b868693          	addi	a3,a3,1464 # 80415bf4 <dev_node_ops+0x6fc>
80411644:	00001617          	auipc	a2,0x1
80411648:	5a460613          	addi	a2,a2,1444 # 80412be8 <commands+0x1bc>
8041164c:	1ba00593          	li	a1,442
80411650:	00004517          	auipc	a0,0x4
80411654:	4ec50513          	addi	a0,a0,1260 # 80415b3c <dev_node_ops+0x644>
80411658:	fcdee0ef          	jal	ra,80400624 <__panic>

8041165c <sfs_namefile>:
8041165c:	00c5a703          	lw	a4,12(a1)
80411660:	fa010113          	addi	sp,sp,-96
80411664:	04112e23          	sw	ra,92(sp)
80411668:	04812c23          	sw	s0,88(sp)
8041166c:	04912a23          	sw	s1,84(sp)
80411670:	05212823          	sw	s2,80(sp)
80411674:	05312623          	sw	s3,76(sp)
80411678:	05412423          	sw	s4,72(sp)
8041167c:	05512223          	sw	s5,68(sp)
80411680:	05612023          	sw	s6,64(sp)
80411684:	03712e23          	sw	s7,60(sp)
80411688:	03812c23          	sw	s8,56(sp)
8041168c:	03912a23          	sw	s9,52(sp)
80411690:	03a12823          	sw	s10,48(sp)
80411694:	03b12623          	sw	s11,44(sp)
80411698:	00b12623          	sw	a1,12(sp)
8041169c:	00200793          	li	a5,2
804116a0:	24e7f063          	bgeu	a5,a4,804118e0 <sfs_namefile+0x284>
804116a4:	00050493          	mv	s1,a0
804116a8:	10400513          	li	a0,260
804116ac:	b14f10ef          	jal	ra,804029c0 <kmalloc>
804116b0:	00050a93          	mv	s5,a0
804116b4:	22050663          	beqz	a0,804118e0 <sfs_namefile+0x284>
804116b8:	0384ab03          	lw	s6,56(s1)
804116bc:	260b0663          	beqz	s6,80411928 <sfs_namefile+0x2cc>
804116c0:	06cb2783          	lw	a5,108(s6)
804116c4:	26079263          	bnez	a5,80411928 <sfs_namefile+0x2cc>
804116c8:	02c4ac03          	lw	s8,44(s1)
804116cc:	000017b7          	lui	a5,0x1
804116d0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804116d4:	26fc1a63          	bne	s8,a5,80411948 <sfs_namefile+0x2ec>
804116d8:	00c12703          	lw	a4,12(sp)
804116dc:	00048513          	mv	a0,s1
804116e0:	00048413          	mv	s0,s1
804116e4:	00c72783          	lw	a5,12(a4) # 800000c <_binary_bin_sfs_img_size+0x7f8800c>
804116e8:	00072903          	lw	s2,0(a4)
804116ec:	00004c97          	auipc	s9,0x4
804116f0:	52cc8c93          	addi	s9,s9,1324 # 80415c18 <dev_node_ops+0x720>
804116f4:	ffe78a13          	addi	s4,a5,-2
804116f8:	00f90933          	add	s2,s2,a5
804116fc:	ccdfb0ef          	jal	ra,8040d3c8 <inode_ref_inc>
80411700:	01c10693          	addi	a3,sp,28
80411704:	000c8613          	mv	a2,s9
80411708:	00040593          	mv	a1,s0
8041170c:	000b0513          	mv	a0,s6
80411710:	01812423          	sw	s8,8(sp)
80411714:	db5ff0ef          	jal	ra,804114c8 <sfs_lookup_once.constprop.13>
80411718:	004a8b93          	addi	s7,s5,4
8041171c:	00050d93          	mv	s11,a0
80411720:	0e051863          	bnez	a0,80411810 <sfs_namefile+0x1b4>
80411724:	00048513          	mv	a0,s1
80411728:	00442983          	lw	s3,4(s0)
8041172c:	d91fb0ef          	jal	ra,8040d4bc <inode_ref_dec>
80411730:	01c12d03          	lw	s10,28(sp)
80411734:	149d0663          	beq	s10,s1,80411880 <sfs_namefile+0x224>
80411738:	1c0d0863          	beqz	s10,80411908 <sfs_namefile+0x2ac>
8041173c:	02cd2683          	lw	a3,44(s10)
80411740:	00812783          	lw	a5,8(sp)
80411744:	1cf69263          	bne	a3,a5,80411908 <sfs_namefile+0x2ac>
80411748:	004d2683          	lw	a3,4(s10)
8041174c:	000d0413          	mv	s0,s10
80411750:	19368c63          	beq	a3,s3,804118e8 <sfs_namefile+0x28c>
80411754:	000d2683          	lw	a3,0(s10)
80411758:	00200793          	li	a5,2
8041175c:	0046d683          	lhu	a3,4(a3)
80411760:	18f69463          	bne	a3,a5,804118e8 <sfs_namefile+0x28c>
80411764:	010d0493          	addi	s1,s10,16
80411768:	00048513          	mv	a0,s1
8041176c:	991f30ef          	jal	ra,804050fc <down>
80411770:	000d2683          	lw	a3,0(s10)
80411774:	0086ac03          	lw	s8,8(a3)
80411778:	01804c63          	bgtz	s8,80411790 <sfs_namefile+0x134>
8041177c:	0e40006f          	j	80411860 <sfs_namefile+0x204>
80411780:	000aa683          	lw	a3,0(s5)
80411784:	02d98663          	beq	s3,a3,804117b0 <sfs_namefile+0x154>
80411788:	001d8d93          	addi	s11,s11,1
8041178c:	0dbc0a63          	beq	s8,s11,80411860 <sfs_namefile+0x204>
80411790:	000a8693          	mv	a3,s5
80411794:	000d8613          	mv	a2,s11
80411798:	000d0593          	mv	a1,s10
8041179c:	000b0513          	mv	a0,s6
804117a0:	90cff0ef          	jal	ra,804108ac <sfs_dirent_read_nolock>
804117a4:	00050693          	mv	a3,a0
804117a8:	fc050ce3          	beqz	a0,80411780 <sfs_namefile+0x124>
804117ac:	0b80006f          	j	80411864 <sfs_namefile+0x208>
804117b0:	00048513          	mv	a0,s1
804117b4:	945f30ef          	jal	ra,804050f8 <up>
804117b8:	000b8513          	mv	a0,s7
804117bc:	719000ef          	jal	ra,804126d4 <strlen>
804117c0:	00150713          	addi	a4,a0,1
804117c4:	10ea6863          	bltu	s4,a4,804118d4 <sfs_namefile+0x278>
804117c8:	fff54993          	not	s3,a0
804117cc:	013909b3          	add	s3,s2,s3
804117d0:	00050613          	mv	a2,a0
804117d4:	000b8593          	mv	a1,s7
804117d8:	00098513          	mv	a0,s3
804117dc:	40ea0a33          	sub	s4,s4,a4
804117e0:	048010ef          	jal	ra,80412828 <memcpy>
804117e4:	02f00793          	li	a5,47
804117e8:	fef90fa3          	sb	a5,-1(s2)
804117ec:	01c10693          	addi	a3,sp,28
804117f0:	000c8613          	mv	a2,s9
804117f4:	00040593          	mv	a1,s0
804117f8:	000b0513          	mv	a0,s6
804117fc:	ccdff0ef          	jal	ra,804114c8 <sfs_lookup_once.constprop.13>
80411800:	000d0493          	mv	s1,s10
80411804:	00098913          	mv	s2,s3
80411808:	00050d93          	mv	s11,a0
8041180c:	f0050ce3          	beqz	a0,80411724 <sfs_namefile+0xc8>
80411810:	00048513          	mv	a0,s1
80411814:	ca9fb0ef          	jal	ra,8040d4bc <inode_ref_dec>
80411818:	000a8513          	mv	a0,s5
8041181c:	ac8f10ef          	jal	ra,80402ae4 <kfree>
80411820:	05c12083          	lw	ra,92(sp)
80411824:	05812403          	lw	s0,88(sp)
80411828:	000d8513          	mv	a0,s11
8041182c:	05412483          	lw	s1,84(sp)
80411830:	05012903          	lw	s2,80(sp)
80411834:	04c12983          	lw	s3,76(sp)
80411838:	04812a03          	lw	s4,72(sp)
8041183c:	04412a83          	lw	s5,68(sp)
80411840:	04012b03          	lw	s6,64(sp)
80411844:	03c12b83          	lw	s7,60(sp)
80411848:	03812c03          	lw	s8,56(sp)
8041184c:	03412c83          	lw	s9,52(sp)
80411850:	03012d03          	lw	s10,48(sp)
80411854:	02c12d83          	lw	s11,44(sp)
80411858:	06010113          	addi	sp,sp,96
8041185c:	00008067          	ret
80411860:	ff000693          	li	a3,-16
80411864:	00048513          	mv	a0,s1
80411868:	00d12423          	sw	a3,8(sp)
8041186c:	88df30ef          	jal	ra,804050f8 <up>
80411870:	00812683          	lw	a3,8(sp)
80411874:	000d0493          	mv	s1,s10
80411878:	00068d93          	mv	s11,a3
8041187c:	f95ff06f          	j	80411810 <sfs_namefile+0x1b4>
80411880:	00048513          	mv	a0,s1
80411884:	c39fb0ef          	jal	ra,8040d4bc <inode_ref_dec>
80411888:	00c12403          	lw	s0,12(sp)
8041188c:	00090593          	mv	a1,s2
80411890:	00c42783          	lw	a5,12(s0)
80411894:	00042503          	lw	a0,0(s0)
80411898:	ffe78793          	addi	a5,a5,-2
8041189c:	41478a33          	sub	s4,a5,s4
804118a0:	000a0613          	mv	a2,s4
804118a4:	00150513          	addi	a0,a0,1
804118a8:	72d000ef          	jal	ra,804127d4 <memmove>
804118ac:	02f00793          	li	a5,47
804118b0:	fef50fa3          	sb	a5,-1(a0)
804118b4:	01450533          	add	a0,a0,s4
804118b8:	00050023          	sb	zero,0(a0)
804118bc:	000a0593          	mv	a1,s4
804118c0:	00040513          	mv	a0,s0
804118c4:	d5df40ef          	jal	ra,80406620 <iobuf_skip>
804118c8:	000a8513          	mv	a0,s5
804118cc:	a18f10ef          	jal	ra,80402ae4 <kfree>
804118d0:	f51ff06f          	j	80411820 <sfs_namefile+0x1c4>
804118d4:	000d0493          	mv	s1,s10
804118d8:	ffc00d93          	li	s11,-4
804118dc:	f35ff06f          	j	80411810 <sfs_namefile+0x1b4>
804118e0:	ffc00d93          	li	s11,-4
804118e4:	f3dff06f          	j	80411820 <sfs_namefile+0x1c4>
804118e8:	00004697          	auipc	a3,0x4
804118ec:	33468693          	addi	a3,a3,820 # 80415c1c <dev_node_ops+0x724>
804118f0:	00001617          	auipc	a2,0x1
804118f4:	2f860613          	addi	a2,a2,760 # 80412be8 <commands+0x1bc>
804118f8:	2f900593          	li	a1,761
804118fc:	00004517          	auipc	a0,0x4
80411900:	24050513          	addi	a0,a0,576 # 80415b3c <dev_node_ops+0x644>
80411904:	d21ee0ef          	jal	ra,80400624 <__panic>
80411908:	00004697          	auipc	a3,0x4
8041190c:	24c68693          	addi	a3,a3,588 # 80415b54 <dev_node_ops+0x65c>
80411910:	00001617          	auipc	a2,0x1
80411914:	2d860613          	addi	a2,a2,728 # 80412be8 <commands+0x1bc>
80411918:	2f800593          	li	a1,760
8041191c:	00004517          	auipc	a0,0x4
80411920:	22050513          	addi	a0,a0,544 # 80415b3c <dev_node_ops+0x644>
80411924:	d01ee0ef          	jal	ra,80400624 <__panic>
80411928:	00004697          	auipc	a3,0x4
8041192c:	07868693          	addi	a3,a3,120 # 804159a0 <dev_node_ops+0x4a8>
80411930:	00001617          	auipc	a2,0x1
80411934:	2b860613          	addi	a2,a2,696 # 80412be8 <commands+0x1bc>
80411938:	2e400593          	li	a1,740
8041193c:	00004517          	auipc	a0,0x4
80411940:	20050513          	addi	a0,a0,512 # 80415b3c <dev_node_ops+0x644>
80411944:	ce1ee0ef          	jal	ra,80400624 <__panic>
80411948:	00004697          	auipc	a3,0x4
8041194c:	20c68693          	addi	a3,a3,524 # 80415b54 <dev_node_ops+0x65c>
80411950:	00001617          	auipc	a2,0x1
80411954:	29860613          	addi	a2,a2,664 # 80412be8 <commands+0x1bc>
80411958:	2e500593          	li	a1,741
8041195c:	00004517          	auipc	a0,0x4
80411960:	1e050513          	addi	a0,a0,480 # 80415b3c <dev_node_ops+0x644>
80411964:	cc1ee0ef          	jal	ra,80400624 <__panic>

80411968 <sfs_lookup>:
80411968:	fd010113          	addi	sp,sp,-48
8041196c:	02912223          	sw	s1,36(sp)
80411970:	03852483          	lw	s1,56(a0)
80411974:	02112623          	sw	ra,44(sp)
80411978:	02812423          	sw	s0,40(sp)
8041197c:	03212023          	sw	s2,32(sp)
80411980:	01312e23          	sw	s3,28(sp)
80411984:	0c048463          	beqz	s1,80411a4c <sfs_lookup+0xe4>
80411988:	06c4a783          	lw	a5,108(s1)
8041198c:	0c079063          	bnez	a5,80411a4c <sfs_lookup+0xe4>
80411990:	0005c783          	lbu	a5,0(a1)
80411994:	00058913          	mv	s2,a1
80411998:	08078a63          	beqz	a5,80411a2c <sfs_lookup+0xc4>
8041199c:	02f00713          	li	a4,47
804119a0:	08e78663          	beq	a5,a4,80411a2c <sfs_lookup+0xc4>
804119a4:	00050413          	mv	s0,a0
804119a8:	00060993          	mv	s3,a2
804119ac:	a1dfb0ef          	jal	ra,8040d3c8 <inode_ref_inc>
804119b0:	02c42703          	lw	a4,44(s0)
804119b4:	000017b7          	lui	a5,0x1
804119b8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804119bc:	0af71863          	bne	a4,a5,80411a6c <sfs_lookup+0x104>
804119c0:	00042703          	lw	a4,0(s0)
804119c4:	00200793          	li	a5,2
804119c8:	00475703          	lhu	a4,4(a4)
804119cc:	04f71863          	bne	a4,a5,80411a1c <sfs_lookup+0xb4>
804119d0:	00048513          	mv	a0,s1
804119d4:	00c10693          	addi	a3,sp,12
804119d8:	00090613          	mv	a2,s2
804119dc:	00040593          	mv	a1,s0
804119e0:	ae9ff0ef          	jal	ra,804114c8 <sfs_lookup_once.constprop.13>
804119e4:	00050493          	mv	s1,a0
804119e8:	00040513          	mv	a0,s0
804119ec:	ad1fb0ef          	jal	ra,8040d4bc <inode_ref_dec>
804119f0:	00049663          	bnez	s1,804119fc <sfs_lookup+0x94>
804119f4:	00c12783          	lw	a5,12(sp)
804119f8:	00f9a023          	sw	a5,0(s3)
804119fc:	02c12083          	lw	ra,44(sp)
80411a00:	02812403          	lw	s0,40(sp)
80411a04:	00048513          	mv	a0,s1
80411a08:	02012903          	lw	s2,32(sp)
80411a0c:	02412483          	lw	s1,36(sp)
80411a10:	01c12983          	lw	s3,28(sp)
80411a14:	03010113          	addi	sp,sp,48
80411a18:	00008067          	ret
80411a1c:	00040513          	mv	a0,s0
80411a20:	a9dfb0ef          	jal	ra,8040d4bc <inode_ref_dec>
80411a24:	fee00493          	li	s1,-18
80411a28:	fd5ff06f          	j	804119fc <sfs_lookup+0x94>
80411a2c:	00004697          	auipc	a3,0x4
80411a30:	1a868693          	addi	a3,a3,424 # 80415bd4 <dev_node_ops+0x6dc>
80411a34:	00001617          	auipc	a2,0x1
80411a38:	1b460613          	addi	a2,a2,436 # 80412be8 <commands+0x1bc>
80411a3c:	3db00593          	li	a1,987
80411a40:	00004517          	auipc	a0,0x4
80411a44:	0fc50513          	addi	a0,a0,252 # 80415b3c <dev_node_ops+0x644>
80411a48:	bddee0ef          	jal	ra,80400624 <__panic>
80411a4c:	00004697          	auipc	a3,0x4
80411a50:	f5468693          	addi	a3,a3,-172 # 804159a0 <dev_node_ops+0x4a8>
80411a54:	00001617          	auipc	a2,0x1
80411a58:	19460613          	addi	a2,a2,404 # 80412be8 <commands+0x1bc>
80411a5c:	3da00593          	li	a1,986
80411a60:	00004517          	auipc	a0,0x4
80411a64:	0dc50513          	addi	a0,a0,220 # 80415b3c <dev_node_ops+0x644>
80411a68:	bbdee0ef          	jal	ra,80400624 <__panic>
80411a6c:	00004697          	auipc	a3,0x4
80411a70:	0e868693          	addi	a3,a3,232 # 80415b54 <dev_node_ops+0x65c>
80411a74:	00001617          	auipc	a2,0x1
80411a78:	17460613          	addi	a2,a2,372 # 80412be8 <commands+0x1bc>
80411a7c:	3dd00593          	li	a1,989
80411a80:	00004517          	auipc	a0,0x4
80411a84:	0bc50513          	addi	a0,a0,188 # 80415b3c <dev_node_ops+0x644>
80411a88:	b9dee0ef          	jal	ra,80400624 <__panic>

80411a8c <sfs_rwblock_nolock.isra.0>:
80411a8c:	fe010113          	addi	sp,sp,-32
80411a90:	00812c23          	sw	s0,24(sp)
80411a94:	00912a23          	sw	s1,20(sp)
80411a98:	00112e23          	sw	ra,28(sp)
80411a9c:	00058493          	mv	s1,a1
80411aa0:	00070413          	mv	s0,a4
80411aa4:	00060593          	mv	a1,a2
80411aa8:	00069463          	bnez	a3,80411ab0 <sfs_rwblock_nolock.isra.0+0x24>
80411aac:	04079463          	bnez	a5,80411af4 <sfs_rwblock_nolock.isra.0+0x68>
80411ab0:	00052783          	lw	a5,0(a0)
80411ab4:	04f6f063          	bgeu	a3,a5,80411af4 <sfs_rwblock_nolock.isra.0+0x68>
80411ab8:	00001637          	lui	a2,0x1
80411abc:	00c69693          	slli	a3,a3,0xc
80411ac0:	00010513          	mv	a0,sp
80411ac4:	a8df40ef          	jal	ra,80406550 <iobuf_init>
80411ac8:	0004a783          	lw	a5,0(s1)
80411acc:	00050593          	mv	a1,a0
80411ad0:	00040613          	mv	a2,s0
80411ad4:	0107a703          	lw	a4,16(a5)
80411ad8:	00078513          	mv	a0,a5
80411adc:	000700e7          	jalr	a4
80411ae0:	01c12083          	lw	ra,28(sp)
80411ae4:	01812403          	lw	s0,24(sp)
80411ae8:	01412483          	lw	s1,20(sp)
80411aec:	02010113          	addi	sp,sp,32
80411af0:	00008067          	ret
80411af4:	00004697          	auipc	a3,0x4
80411af8:	2b068693          	addi	a3,a3,688 # 80415da4 <sfs_node_fileops+0x114>
80411afc:	00001617          	auipc	a2,0x1
80411b00:	0ec60613          	addi	a2,a2,236 # 80412be8 <commands+0x1bc>
80411b04:	01500593          	li	a1,21
80411b08:	00004517          	auipc	a0,0x4
80411b0c:	2d050513          	addi	a0,a0,720 # 80415dd8 <sfs_node_fileops+0x148>
80411b10:	b15ee0ef          	jal	ra,80400624 <__panic>

80411b14 <sfs_rwblock>:
80411b14:	fd010113          	addi	sp,sp,-48
80411b18:	02812423          	sw	s0,40(sp)
80411b1c:	03212023          	sw	s2,32(sp)
80411b20:	01812423          	sw	s8,8(sp)
80411b24:	00060413          	mv	s0,a2
80411b28:	00050c13          	mv	s8,a0
80411b2c:	00068913          	mv	s2,a3
80411b30:	02912223          	sw	s1,36(sp)
80411b34:	01312e23          	sw	s3,28(sp)
80411b38:	01412c23          	sw	s4,24(sp)
80411b3c:	01512a23          	sw	s5,20(sp)
80411b40:	01612823          	sw	s6,16(sp)
80411b44:	01712623          	sw	s7,12(sp)
80411b48:	02112623          	sw	ra,44(sp)
80411b4c:	00058493          	mv	s1,a1
80411b50:	00070a93          	mv	s5,a4
80411b54:	00450a13          	addi	s4,a0,4
80411b58:	01240bb3          	add	s7,s0,s2
80411b5c:	404000ef          	jal	ra,80411f60 <lock_sfs_io>
80411b60:	02cc0993          	addi	s3,s8,44
80411b64:	00001b37          	lui	s6,0x1
80411b68:	00091863          	bnez	s2,80411b78 <sfs_rwblock+0x64>
80411b6c:	0700006f          	j	80411bdc <sfs_rwblock+0xc8>
80411b70:	016484b3          	add	s1,s1,s6
80411b74:	068b8463          	beq	s7,s0,80411bdc <sfs_rwblock+0xc8>
80411b78:	00040693          	mv	a3,s0
80411b7c:	00048613          	mv	a2,s1
80411b80:	00100793          	li	a5,1
80411b84:	000a8713          	mv	a4,s5
80411b88:	00098593          	mv	a1,s3
80411b8c:	000a0513          	mv	a0,s4
80411b90:	efdff0ef          	jal	ra,80411a8c <sfs_rwblock_nolock.isra.0>
80411b94:	00050913          	mv	s2,a0
80411b98:	00140413          	addi	s0,s0,1
80411b9c:	fc050ae3          	beqz	a0,80411b70 <sfs_rwblock+0x5c>
80411ba0:	000c0513          	mv	a0,s8
80411ba4:	3cc000ef          	jal	ra,80411f70 <unlock_sfs_io>
80411ba8:	02c12083          	lw	ra,44(sp)
80411bac:	02812403          	lw	s0,40(sp)
80411bb0:	00090513          	mv	a0,s2
80411bb4:	02412483          	lw	s1,36(sp)
80411bb8:	02012903          	lw	s2,32(sp)
80411bbc:	01c12983          	lw	s3,28(sp)
80411bc0:	01812a03          	lw	s4,24(sp)
80411bc4:	01412a83          	lw	s5,20(sp)
80411bc8:	01012b03          	lw	s6,16(sp)
80411bcc:	00c12b83          	lw	s7,12(sp)
80411bd0:	00812c03          	lw	s8,8(sp)
80411bd4:	03010113          	addi	sp,sp,48
80411bd8:	00008067          	ret
80411bdc:	00000913          	li	s2,0
80411be0:	fc1ff06f          	j	80411ba0 <sfs_rwblock+0x8c>

80411be4 <sfs_rblock>:
80411be4:	00000713          	li	a4,0
80411be8:	f2dff06f          	j	80411b14 <sfs_rwblock>

80411bec <sfs_wblock>:
80411bec:	00100713          	li	a4,1
80411bf0:	f25ff06f          	j	80411b14 <sfs_rwblock>

80411bf4 <sfs_rbuf>:
80411bf4:	fe010113          	addi	sp,sp,-32
80411bf8:	00112e23          	sw	ra,28(sp)
80411bfc:	00812c23          	sw	s0,24(sp)
80411c00:	00912a23          	sw	s1,20(sp)
80411c04:	01212823          	sw	s2,16(sp)
80411c08:	01312623          	sw	s3,12(sp)
80411c0c:	01412423          	sw	s4,8(sp)
80411c10:	000017b7          	lui	a5,0x1
80411c14:	08f77663          	bgeu	a4,a5,80411ca0 <sfs_rbuf+0xac>
80411c18:	00070493          	mv	s1,a4
80411c1c:	00c70733          	add	a4,a4,a2
80411c20:	00060993          	mv	s3,a2
80411c24:	06e7ee63          	bltu	a5,a4,80411ca0 <sfs_rbuf+0xac>
80411c28:	00050413          	mv	s0,a0
80411c2c:	00068913          	mv	s2,a3
80411c30:	00058a13          	mv	s4,a1
80411c34:	32c000ef          	jal	ra,80411f60 <lock_sfs_io>
80411c38:	03842603          	lw	a2,56(s0)
80411c3c:	00090693          	mv	a3,s2
80411c40:	00100793          	li	a5,1
80411c44:	00000713          	li	a4,0
80411c48:	02c40593          	addi	a1,s0,44
80411c4c:	00440513          	addi	a0,s0,4
80411c50:	e3dff0ef          	jal	ra,80411a8c <sfs_rwblock_nolock.isra.0>
80411c54:	00050913          	mv	s2,a0
80411c58:	02050863          	beqz	a0,80411c88 <sfs_rbuf+0x94>
80411c5c:	00040513          	mv	a0,s0
80411c60:	310000ef          	jal	ra,80411f70 <unlock_sfs_io>
80411c64:	01c12083          	lw	ra,28(sp)
80411c68:	01812403          	lw	s0,24(sp)
80411c6c:	00090513          	mv	a0,s2
80411c70:	01412483          	lw	s1,20(sp)
80411c74:	01012903          	lw	s2,16(sp)
80411c78:	00c12983          	lw	s3,12(sp)
80411c7c:	00812a03          	lw	s4,8(sp)
80411c80:	02010113          	addi	sp,sp,32
80411c84:	00008067          	ret
80411c88:	03842583          	lw	a1,56(s0)
80411c8c:	00098613          	mv	a2,s3
80411c90:	000a0513          	mv	a0,s4
80411c94:	009585b3          	add	a1,a1,s1
80411c98:	391000ef          	jal	ra,80412828 <memcpy>
80411c9c:	fc1ff06f          	j	80411c5c <sfs_rbuf+0x68>
80411ca0:	00004697          	auipc	a3,0x4
80411ca4:	0c068693          	addi	a3,a3,192 # 80415d60 <sfs_node_fileops+0xd0>
80411ca8:	00001617          	auipc	a2,0x1
80411cac:	f4060613          	addi	a2,a2,-192 # 80412be8 <commands+0x1bc>
80411cb0:	05500593          	li	a1,85
80411cb4:	00004517          	auipc	a0,0x4
80411cb8:	12450513          	addi	a0,a0,292 # 80415dd8 <sfs_node_fileops+0x148>
80411cbc:	969ee0ef          	jal	ra,80400624 <__panic>

80411cc0 <sfs_wbuf>:
80411cc0:	fd010113          	addi	sp,sp,-48
80411cc4:	02112623          	sw	ra,44(sp)
80411cc8:	02812423          	sw	s0,40(sp)
80411ccc:	02912223          	sw	s1,36(sp)
80411cd0:	03212023          	sw	s2,32(sp)
80411cd4:	01312e23          	sw	s3,28(sp)
80411cd8:	01412c23          	sw	s4,24(sp)
80411cdc:	01512a23          	sw	s5,20(sp)
80411ce0:	01612823          	sw	s6,16(sp)
80411ce4:	01712623          	sw	s7,12(sp)
80411ce8:	000017b7          	lui	a5,0x1
80411cec:	0cf77063          	bgeu	a4,a5,80411dac <sfs_wbuf+0xec>
80411cf0:	00070493          	mv	s1,a4
80411cf4:	00c70733          	add	a4,a4,a2
80411cf8:	00060a13          	mv	s4,a2
80411cfc:	0ae7e863          	bltu	a5,a4,80411dac <sfs_wbuf+0xec>
80411d00:	00050413          	mv	s0,a0
80411d04:	00058b93          	mv	s7,a1
80411d08:	00068993          	mv	s3,a3
80411d0c:	254000ef          	jal	ra,80411f60 <lock_sfs_io>
80411d10:	03842603          	lw	a2,56(s0)
80411d14:	00440a93          	addi	s5,s0,4
80411d18:	02c40b13          	addi	s6,s0,44
80411d1c:	00100793          	li	a5,1
80411d20:	00000713          	li	a4,0
80411d24:	00098693          	mv	a3,s3
80411d28:	000b0593          	mv	a1,s6
80411d2c:	000a8513          	mv	a0,s5
80411d30:	d5dff0ef          	jal	ra,80411a8c <sfs_rwblock_nolock.isra.0>
80411d34:	00050913          	mv	s2,a0
80411d38:	02050e63          	beqz	a0,80411d74 <sfs_wbuf+0xb4>
80411d3c:	00040513          	mv	a0,s0
80411d40:	230000ef          	jal	ra,80411f70 <unlock_sfs_io>
80411d44:	02c12083          	lw	ra,44(sp)
80411d48:	02812403          	lw	s0,40(sp)
80411d4c:	00090513          	mv	a0,s2
80411d50:	02412483          	lw	s1,36(sp)
80411d54:	02012903          	lw	s2,32(sp)
80411d58:	01c12983          	lw	s3,28(sp)
80411d5c:	01812a03          	lw	s4,24(sp)
80411d60:	01412a83          	lw	s5,20(sp)
80411d64:	01012b03          	lw	s6,16(sp)
80411d68:	00c12b83          	lw	s7,12(sp)
80411d6c:	03010113          	addi	sp,sp,48
80411d70:	00008067          	ret
80411d74:	03842503          	lw	a0,56(s0)
80411d78:	000a0613          	mv	a2,s4
80411d7c:	000b8593          	mv	a1,s7
80411d80:	00950533          	add	a0,a0,s1
80411d84:	2a5000ef          	jal	ra,80412828 <memcpy>
80411d88:	03842603          	lw	a2,56(s0)
80411d8c:	00100793          	li	a5,1
80411d90:	00100713          	li	a4,1
80411d94:	00098693          	mv	a3,s3
80411d98:	000b0593          	mv	a1,s6
80411d9c:	000a8513          	mv	a0,s5
80411da0:	cedff0ef          	jal	ra,80411a8c <sfs_rwblock_nolock.isra.0>
80411da4:	00050913          	mv	s2,a0
80411da8:	f95ff06f          	j	80411d3c <sfs_wbuf+0x7c>
80411dac:	00004697          	auipc	a3,0x4
80411db0:	fb468693          	addi	a3,a3,-76 # 80415d60 <sfs_node_fileops+0xd0>
80411db4:	00001617          	auipc	a2,0x1
80411db8:	e3460613          	addi	a2,a2,-460 # 80412be8 <commands+0x1bc>
80411dbc:	06b00593          	li	a1,107
80411dc0:	00004517          	auipc	a0,0x4
80411dc4:	01850513          	addi	a0,a0,24 # 80415dd8 <sfs_node_fileops+0x148>
80411dc8:	85dee0ef          	jal	ra,80400624 <__panic>

80411dcc <sfs_sync_super>:
80411dcc:	ff010113          	addi	sp,sp,-16
80411dd0:	00112623          	sw	ra,12(sp)
80411dd4:	00812423          	sw	s0,8(sp)
80411dd8:	00912223          	sw	s1,4(sp)
80411ddc:	00050413          	mv	s0,a0
80411de0:	180000ef          	jal	ra,80411f60 <lock_sfs_io>
80411de4:	03842503          	lw	a0,56(s0)
80411de8:	00001637          	lui	a2,0x1
80411dec:	00000593          	li	a1,0
80411df0:	1c9000ef          	jal	ra,804127b8 <memset>
80411df4:	03842503          	lw	a0,56(s0)
80411df8:	00040593          	mv	a1,s0
80411dfc:	02c00613          	li	a2,44
80411e00:	229000ef          	jal	ra,80412828 <memcpy>
80411e04:	03842603          	lw	a2,56(s0)
80411e08:	02c40593          	addi	a1,s0,44
80411e0c:	00000793          	li	a5,0
80411e10:	00100713          	li	a4,1
80411e14:	00000693          	li	a3,0
80411e18:	00440513          	addi	a0,s0,4
80411e1c:	c71ff0ef          	jal	ra,80411a8c <sfs_rwblock_nolock.isra.0>
80411e20:	00050493          	mv	s1,a0
80411e24:	00040513          	mv	a0,s0
80411e28:	148000ef          	jal	ra,80411f70 <unlock_sfs_io>
80411e2c:	00c12083          	lw	ra,12(sp)
80411e30:	00812403          	lw	s0,8(sp)
80411e34:	00048513          	mv	a0,s1
80411e38:	00412483          	lw	s1,4(sp)
80411e3c:	01010113          	addi	sp,sp,16
80411e40:	00008067          	ret

80411e44 <sfs_sync_freemap>:
80411e44:	ff010113          	addi	sp,sp,-16
80411e48:	00812423          	sw	s0,8(sp)
80411e4c:	00452403          	lw	s0,4(a0)
80411e50:	00912223          	sw	s1,4(sp)
80411e54:	000086b7          	lui	a3,0x8
80411e58:	00050493          	mv	s1,a0
80411e5c:	03052503          	lw	a0,48(a0)
80411e60:	fff68693          	addi	a3,a3,-1 # 7fff <_binary_bin_swap_img_size-0x1>
80411e64:	00d40433          	add	s0,s0,a3
80411e68:	00000593          	li	a1,0
80411e6c:	00112623          	sw	ra,12(sp)
80411e70:	00f45413          	srli	s0,s0,0xf
80411e74:	f2cfd0ef          	jal	ra,8040f5a0 <bitmap_getdata>
80411e78:	00040693          	mv	a3,s0
80411e7c:	00812403          	lw	s0,8(sp)
80411e80:	00c12083          	lw	ra,12(sp)
80411e84:	00050593          	mv	a1,a0
80411e88:	00048513          	mv	a0,s1
80411e8c:	00412483          	lw	s1,4(sp)
80411e90:	00100713          	li	a4,1
80411e94:	00200613          	li	a2,2
80411e98:	01010113          	addi	sp,sp,16
80411e9c:	c79ff06f          	j	80411b14 <sfs_rwblock>

80411ea0 <sfs_clear_block>:
80411ea0:	fe010113          	addi	sp,sp,-32
80411ea4:	00112e23          	sw	ra,28(sp)
80411ea8:	00812c23          	sw	s0,24(sp)
80411eac:	00912a23          	sw	s1,20(sp)
80411eb0:	00058413          	mv	s0,a1
80411eb4:	00060493          	mv	s1,a2
80411eb8:	01212823          	sw	s2,16(sp)
80411ebc:	01312623          	sw	s3,12(sp)
80411ec0:	00050913          	mv	s2,a0
80411ec4:	01412423          	sw	s4,8(sp)
80411ec8:	01512223          	sw	s5,4(sp)
80411ecc:	094000ef          	jal	ra,80411f60 <lock_sfs_io>
80411ed0:	03892503          	lw	a0,56(s2)
80411ed4:	00001637          	lui	a2,0x1
80411ed8:	00000593          	li	a1,0
80411edc:	0dd000ef          	jal	ra,804127b8 <memset>
80411ee0:	00940ab3          	add	s5,s0,s1
80411ee4:	00490a13          	addi	s4,s2,4
80411ee8:	02c90993          	addi	s3,s2,44
80411eec:	00049663          	bnez	s1,80411ef8 <sfs_clear_block+0x58>
80411ef0:	0600006f          	j	80411f50 <sfs_clear_block+0xb0>
80411ef4:	05540e63          	beq	s0,s5,80411f50 <sfs_clear_block+0xb0>
80411ef8:	03892603          	lw	a2,56(s2)
80411efc:	00040693          	mv	a3,s0
80411f00:	00100793          	li	a5,1
80411f04:	00100713          	li	a4,1
80411f08:	00098593          	mv	a1,s3
80411f0c:	000a0513          	mv	a0,s4
80411f10:	b7dff0ef          	jal	ra,80411a8c <sfs_rwblock_nolock.isra.0>
80411f14:	00050493          	mv	s1,a0
80411f18:	00140413          	addi	s0,s0,1
80411f1c:	fc050ce3          	beqz	a0,80411ef4 <sfs_clear_block+0x54>
80411f20:	00090513          	mv	a0,s2
80411f24:	04c000ef          	jal	ra,80411f70 <unlock_sfs_io>
80411f28:	01c12083          	lw	ra,28(sp)
80411f2c:	01812403          	lw	s0,24(sp)
80411f30:	00048513          	mv	a0,s1
80411f34:	01012903          	lw	s2,16(sp)
80411f38:	01412483          	lw	s1,20(sp)
80411f3c:	00c12983          	lw	s3,12(sp)
80411f40:	00812a03          	lw	s4,8(sp)
80411f44:	00412a83          	lw	s5,4(sp)
80411f48:	02010113          	addi	sp,sp,32
80411f4c:	00008067          	ret
80411f50:	00000493          	li	s1,0
80411f54:	fcdff06f          	j	80411f20 <sfs_clear_block+0x80>

80411f58 <lock_sfs_fs>:
80411f58:	03c50513          	addi	a0,a0,60
80411f5c:	9a0f306f          	j	804050fc <down>

80411f60 <lock_sfs_io>:
80411f60:	04850513          	addi	a0,a0,72
80411f64:	998f306f          	j	804050fc <down>

80411f68 <unlock_sfs_fs>:
80411f68:	03c50513          	addi	a0,a0,60
80411f6c:	98cf306f          	j	804050f8 <up>

80411f70 <unlock_sfs_io>:
80411f70:	04850513          	addi	a0,a0,72
80411f74:	984f306f          	j	804050f8 <up>

80411f78 <hash32>:
80411f78:	00351793          	slli	a5,a0,0x3
80411f7c:	40a787b3          	sub	a5,a5,a0
80411f80:	00679793          	slli	a5,a5,0x6
80411f84:	40a78733          	sub	a4,a5,a0
80411f88:	00371793          	slli	a5,a4,0x3
80411f8c:	40e787b3          	sub	a5,a5,a4
80411f90:	00379793          	slli	a5,a5,0x3
80411f94:	00a787b3          	add	a5,a5,a0
80411f98:	01079793          	slli	a5,a5,0x10
80411f9c:	40f50533          	sub	a0,a0,a5
80411fa0:	02000793          	li	a5,32
80411fa4:	40b785b3          	sub	a1,a5,a1
80411fa8:	00b55533          	srl	a0,a0,a1
80411fac:	00008067          	ret

80411fb0 <printnum>:
80411fb0:	fd010113          	addi	sp,sp,-48
80411fb4:	02912223          	sw	s1,36(sp)
80411fb8:	01312e23          	sw	s3,28(sp)
80411fbc:	00050493          	mv	s1,a0
80411fc0:	00058993          	mv	s3,a1
80411fc4:	00068513          	mv	a0,a3
80411fc8:	00078593          	mv	a1,a5
80411fcc:	02812423          	sw	s0,40(sp)
80411fd0:	03212023          	sw	s2,32(sp)
80411fd4:	01412c23          	sw	s4,24(sp)
80411fd8:	01512a23          	sw	s5,20(sp)
80411fdc:	01612823          	sw	s6,16(sp)
80411fe0:	01712623          	sw	s7,12(sp)
80411fe4:	01812423          	sw	s8,8(sp)
80411fe8:	02112623          	sw	ra,44(sp)
80411fec:	00068b13          	mv	s6,a3
80411ff0:	00078a93          	mv	s5,a5
80411ff4:	00070c13          	mv	s8,a4
80411ff8:	00060913          	mv	s2,a2
80411ffc:	00088a13          	mv	s4,a7
80412000:	fff80413          	addi	s0,a6,-1
80412004:	0bd000ef          	jal	ra,804128c0 <__umodsi3>
80412008:	00050b93          	mv	s7,a0
8041200c:	060c1863          	bnez	s8,8041207c <printnum+0xcc>
80412010:	075b7663          	bgeu	s6,s5,8041207c <printnum+0xcc>
80412014:	00805e63          	blez	s0,80412030 <printnum+0x80>
80412018:	fff40413          	addi	s0,s0,-1
8041201c:	00098613          	mv	a2,s3
80412020:	00090593          	mv	a1,s2
80412024:	000a0513          	mv	a0,s4
80412028:	000480e7          	jalr	s1
8041202c:	fe0416e3          	bnez	s0,80412018 <printnum+0x68>
80412030:	00004517          	auipc	a0,0x4
80412034:	f7c50513          	addi	a0,a0,-132 # 80415fac <error_string+0x64>
80412038:	01750533          	add	a0,a0,s7
8041203c:	02812403          	lw	s0,40(sp)
80412040:	02c12083          	lw	ra,44(sp)
80412044:	01812a03          	lw	s4,24(sp)
80412048:	01412a83          	lw	s5,20(sp)
8041204c:	01012b03          	lw	s6,16(sp)
80412050:	00c12b83          	lw	s7,12(sp)
80412054:	00812c03          	lw	s8,8(sp)
80412058:	00054503          	lbu	a0,0(a0)
8041205c:	00098613          	mv	a2,s3
80412060:	00090593          	mv	a1,s2
80412064:	01c12983          	lw	s3,28(sp)
80412068:	02012903          	lw	s2,32(sp)
8041206c:	00048313          	mv	t1,s1
80412070:	02412483          	lw	s1,36(sp)
80412074:	03010113          	addi	sp,sp,48
80412078:	00030067          	jr	t1
8041207c:	000a8593          	mv	a1,s5
80412080:	000b0513          	mv	a0,s6
80412084:	7f4000ef          	jal	ra,80412878 <__udivsi3>
80412088:	00050693          	mv	a3,a0
8041208c:	000a0893          	mv	a7,s4
80412090:	00040813          	mv	a6,s0
80412094:	000a8793          	mv	a5,s5
80412098:	00000713          	li	a4,0
8041209c:	00090613          	mv	a2,s2
804120a0:	00098593          	mv	a1,s3
804120a4:	00048513          	mv	a0,s1
804120a8:	f09ff0ef          	jal	ra,80411fb0 <printnum>
804120ac:	f85ff06f          	j	80412030 <printnum+0x80>

804120b0 <sprintputch>:
804120b0:	0085a783          	lw	a5,8(a1)
804120b4:	0005a703          	lw	a4,0(a1)
804120b8:	0045a683          	lw	a3,4(a1)
804120bc:	00178793          	addi	a5,a5,1 # 1001 <_binary_bin_swap_img_size-0x6fff>
804120c0:	00f5a423          	sw	a5,8(a1)
804120c4:	00d77863          	bgeu	a4,a3,804120d4 <sprintputch+0x24>
804120c8:	00170793          	addi	a5,a4,1
804120cc:	00f5a023          	sw	a5,0(a1)
804120d0:	00a70023          	sb	a0,0(a4)
804120d4:	00008067          	ret

804120d8 <vprintfmt>:
804120d8:	fb010113          	addi	sp,sp,-80
804120dc:	04912223          	sw	s1,68(sp)
804120e0:	05212023          	sw	s2,64(sp)
804120e4:	03312e23          	sw	s3,60(sp)
804120e8:	03512a23          	sw	s5,52(sp)
804120ec:	03612823          	sw	s6,48(sp)
804120f0:	03712623          	sw	s7,44(sp)
804120f4:	03812423          	sw	s8,40(sp)
804120f8:	01b12e23          	sw	s11,28(sp)
804120fc:	04112623          	sw	ra,76(sp)
80412100:	04812423          	sw	s0,72(sp)
80412104:	03412c23          	sw	s4,56(sp)
80412108:	03912223          	sw	s9,36(sp)
8041210c:	03a12023          	sw	s10,32(sp)
80412110:	00050993          	mv	s3,a0
80412114:	00058913          	mv	s2,a1
80412118:	00060493          	mv	s1,a2
8041211c:	00068d93          	mv	s11,a3
80412120:	00070b13          	mv	s6,a4
80412124:	00004a97          	auipc	s5,0x4
80412128:	ccca8a93          	addi	s5,s5,-820 # 80415df0 <sfs_node_fileops+0x160>
8041212c:	fff00b93          	li	s7,-1
80412130:	05e00c13          	li	s8,94
80412134:	000dc503          	lbu	a0,0(s11)
80412138:	02500793          	li	a5,37
8041213c:	001d8413          	addi	s0,s11,1
80412140:	02f50663          	beq	a0,a5,8041216c <vprintfmt+0x94>
80412144:	06050663          	beqz	a0,804121b0 <vprintfmt+0xd8>
80412148:	02500a13          	li	s4,37
8041214c:	0080006f          	j	80412154 <vprintfmt+0x7c>
80412150:	06050063          	beqz	a0,804121b0 <vprintfmt+0xd8>
80412154:	00090613          	mv	a2,s2
80412158:	00048593          	mv	a1,s1
8041215c:	00140413          	addi	s0,s0,1
80412160:	000980e7          	jalr	s3
80412164:	fff44503          	lbu	a0,-1(s0)
80412168:	ff4514e3          	bne	a0,s4,80412150 <vprintfmt+0x78>
8041216c:	00044503          	lbu	a0,0(s0)
80412170:	02000893          	li	a7,32
80412174:	00000a13          	li	s4,0
80412178:	00000593          	li	a1,0
8041217c:	fff00c93          	li	s9,-1
80412180:	fff00d13          	li	s10,-1
80412184:	05500693          	li	a3,85
80412188:	00900613          	li	a2,9
8041218c:	fdd50793          	addi	a5,a0,-35
80412190:	0ff7f793          	andi	a5,a5,255
80412194:	00140d93          	addi	s11,s0,1
80412198:	2ef6e663          	bltu	a3,a5,80412484 <vprintfmt+0x3ac>
8041219c:	00279793          	slli	a5,a5,0x2
804121a0:	015787b3          	add	a5,a5,s5
804121a4:	0007a783          	lw	a5,0(a5)
804121a8:	015787b3          	add	a5,a5,s5
804121ac:	00078067          	jr	a5
804121b0:	04c12083          	lw	ra,76(sp)
804121b4:	04812403          	lw	s0,72(sp)
804121b8:	04412483          	lw	s1,68(sp)
804121bc:	04012903          	lw	s2,64(sp)
804121c0:	03c12983          	lw	s3,60(sp)
804121c4:	03812a03          	lw	s4,56(sp)
804121c8:	03412a83          	lw	s5,52(sp)
804121cc:	03012b03          	lw	s6,48(sp)
804121d0:	02c12b83          	lw	s7,44(sp)
804121d4:	02812c03          	lw	s8,40(sp)
804121d8:	02412c83          	lw	s9,36(sp)
804121dc:	02012d03          	lw	s10,32(sp)
804121e0:	01c12d83          	lw	s11,28(sp)
804121e4:	05010113          	addi	sp,sp,80
804121e8:	00008067          	ret
804121ec:	00050893          	mv	a7,a0
804121f0:	00144503          	lbu	a0,1(s0)
804121f4:	000d8413          	mv	s0,s11
804121f8:	f95ff06f          	j	8041218c <vprintfmt+0xb4>
804121fc:	000b2c83          	lw	s9,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
80412200:	00144503          	lbu	a0,1(s0)
80412204:	004b0b13          	addi	s6,s6,4
80412208:	000d8413          	mv	s0,s11
8041220c:	f80d50e3          	bgez	s10,8041218c <vprintfmt+0xb4>
80412210:	000c8d13          	mv	s10,s9
80412214:	fff00c93          	li	s9,-1
80412218:	f75ff06f          	j	8041218c <vprintfmt+0xb4>
8041221c:	fffd4793          	not	a5,s10
80412220:	41f7d793          	srai	a5,a5,0x1f
80412224:	00144503          	lbu	a0,1(s0)
80412228:	00fd7d33          	and	s10,s10,a5
8041222c:	000d8413          	mv	s0,s11
80412230:	f5dff06f          	j	8041218c <vprintfmt+0xb4>
80412234:	00100793          	li	a5,1
80412238:	32b7c463          	blt	a5,a1,80412560 <vprintfmt+0x488>
8041223c:	000b2683          	lw	a3,0(s6)
80412240:	00000713          	li	a4,0
80412244:	004b0b13          	addi	s6,s6,4
80412248:	01000793          	li	a5,16
8041224c:	000d0813          	mv	a6,s10
80412250:	00048613          	mv	a2,s1
80412254:	00090593          	mv	a1,s2
80412258:	00098513          	mv	a0,s3
8041225c:	d55ff0ef          	jal	ra,80411fb0 <printnum>
80412260:	ed5ff06f          	j	80412134 <vprintfmt+0x5c>
80412264:	00144303          	lbu	t1,1(s0)
80412268:	fd050c93          	addi	s9,a0,-48
8041226c:	000d8413          	mv	s0,s11
80412270:	fd030793          	addi	a5,t1,-48
80412274:	00030513          	mv	a0,t1
80412278:	f8f66ae3          	bltu	a2,a5,8041220c <vprintfmt+0x134>
8041227c:	002c9793          	slli	a5,s9,0x2
80412280:	01978733          	add	a4,a5,s9
80412284:	00140413          	addi	s0,s0,1
80412288:	00171713          	slli	a4,a4,0x1
8041228c:	00670733          	add	a4,a4,t1
80412290:	00044303          	lbu	t1,0(s0)
80412294:	fd070c93          	addi	s9,a4,-48
80412298:	fd030793          	addi	a5,t1,-48
8041229c:	00030513          	mv	a0,t1
804122a0:	fcf67ee3          	bgeu	a2,a5,8041227c <vprintfmt+0x1a4>
804122a4:	f69ff06f          	j	8041220c <vprintfmt+0x134>
804122a8:	000b2503          	lw	a0,0(s6)
804122ac:	00090613          	mv	a2,s2
804122b0:	00048593          	mv	a1,s1
804122b4:	004b0b13          	addi	s6,s6,4
804122b8:	000980e7          	jalr	s3
804122bc:	e79ff06f          	j	80412134 <vprintfmt+0x5c>
804122c0:	00100793          	li	a5,1
804122c4:	28b7c263          	blt	a5,a1,80412548 <vprintfmt+0x470>
804122c8:	000b2a03          	lw	s4,0(s6)
804122cc:	004b0793          	addi	a5,s6,4
804122d0:	00078b13          	mv	s6,a5
804122d4:	41fa5413          	srai	s0,s4,0x1f
804122d8:	2c044063          	bltz	s0,80412598 <vprintfmt+0x4c0>
804122dc:	000a0693          	mv	a3,s4
804122e0:	00040713          	mv	a4,s0
804122e4:	00a00793          	li	a5,10
804122e8:	f65ff06f          	j	8041224c <vprintfmt+0x174>
804122ec:	000b2703          	lw	a4,0(s6)
804122f0:	01800693          	li	a3,24
804122f4:	004b0b13          	addi	s6,s6,4
804122f8:	41f75793          	srai	a5,a4,0x1f
804122fc:	00e7c733          	xor	a4,a5,a4
80412300:	40f70733          	sub	a4,a4,a5
80412304:	1ae6ca63          	blt	a3,a4,804124b8 <vprintfmt+0x3e0>
80412308:	00271793          	slli	a5,a4,0x2
8041230c:	00004697          	auipc	a3,0x4
80412310:	c3c68693          	addi	a3,a3,-964 # 80415f48 <error_string>
80412314:	00f687b3          	add	a5,a3,a5
80412318:	0007a783          	lw	a5,0(a5)
8041231c:	18078e63          	beqz	a5,804124b8 <vprintfmt+0x3e0>
80412320:	00078713          	mv	a4,a5
80412324:	00000697          	auipc	a3,0x0
80412328:	62468693          	addi	a3,a3,1572 # 80412948 <etext+0x24>
8041232c:	00048613          	mv	a2,s1
80412330:	00090593          	mv	a1,s2
80412334:	00098513          	mv	a0,s3
80412338:	2cc000ef          	jal	ra,80412604 <printfmt>
8041233c:	df9ff06f          	j	80412134 <vprintfmt+0x5c>
80412340:	000b2783          	lw	a5,0(s6)
80412344:	004b0b13          	addi	s6,s6,4
80412348:	28078e63          	beqz	a5,804125e4 <vprintfmt+0x50c>
8041234c:	00178413          	addi	s0,a5,1
80412350:	1fa05063          	blez	s10,80412530 <vprintfmt+0x458>
80412354:	02d00693          	li	a3,45
80412358:	18d89663          	bne	a7,a3,804124e4 <vprintfmt+0x40c>
8041235c:	0007c783          	lbu	a5,0(a5)
80412360:	00078513          	mv	a0,a5
80412364:	04078263          	beqz	a5,804123a8 <vprintfmt+0x2d0>
80412368:	000cc663          	bltz	s9,80412374 <vprintfmt+0x29c>
8041236c:	fffc8c93          	addi	s9,s9,-1
80412370:	037c8a63          	beq	s9,s7,804123a4 <vprintfmt+0x2cc>
80412374:	00090613          	mv	a2,s2
80412378:	00048593          	mv	a1,s1
8041237c:	1c0a0263          	beqz	s4,80412540 <vprintfmt+0x468>
80412380:	fe078793          	addi	a5,a5,-32
80412384:	1afc7e63          	bgeu	s8,a5,80412540 <vprintfmt+0x468>
80412388:	03f00513          	li	a0,63
8041238c:	000980e7          	jalr	s3
80412390:	00140413          	addi	s0,s0,1
80412394:	fff44783          	lbu	a5,-1(s0)
80412398:	fffd0d13          	addi	s10,s10,-1
8041239c:	00078513          	mv	a0,a5
804123a0:	fc0794e3          	bnez	a5,80412368 <vprintfmt+0x290>
804123a4:	d9a058e3          	blez	s10,80412134 <vprintfmt+0x5c>
804123a8:	fffd0d13          	addi	s10,s10,-1
804123ac:	00090613          	mv	a2,s2
804123b0:	00048593          	mv	a1,s1
804123b4:	02000513          	li	a0,32
804123b8:	000980e7          	jalr	s3
804123bc:	d60d0ce3          	beqz	s10,80412134 <vprintfmt+0x5c>
804123c0:	fffd0d13          	addi	s10,s10,-1
804123c4:	00090613          	mv	a2,s2
804123c8:	00048593          	mv	a1,s1
804123cc:	02000513          	li	a0,32
804123d0:	000980e7          	jalr	s3
804123d4:	fc0d1ae3          	bnez	s10,804123a8 <vprintfmt+0x2d0>
804123d8:	d5dff06f          	j	80412134 <vprintfmt+0x5c>
804123dc:	00100793          	li	a5,1
804123e0:	18b7ce63          	blt	a5,a1,8041257c <vprintfmt+0x4a4>
804123e4:	000b2683          	lw	a3,0(s6)
804123e8:	00000713          	li	a4,0
804123ec:	004b0b13          	addi	s6,s6,4
804123f0:	00800793          	li	a5,8
804123f4:	e59ff06f          	j	8041224c <vprintfmt+0x174>
804123f8:	03000513          	li	a0,48
804123fc:	00090613          	mv	a2,s2
80412400:	00048593          	mv	a1,s1
80412404:	01112423          	sw	a7,8(sp)
80412408:	000980e7          	jalr	s3
8041240c:	00090613          	mv	a2,s2
80412410:	00048593          	mv	a1,s1
80412414:	07800513          	li	a0,120
80412418:	000980e7          	jalr	s3
8041241c:	004b0b13          	addi	s6,s6,4
80412420:	ffcb2683          	lw	a3,-4(s6)
80412424:	00000713          	li	a4,0
80412428:	01000793          	li	a5,16
8041242c:	00812883          	lw	a7,8(sp)
80412430:	e1dff06f          	j	8041224c <vprintfmt+0x174>
80412434:	00144503          	lbu	a0,1(s0)
80412438:	00158593          	addi	a1,a1,1
8041243c:	000d8413          	mv	s0,s11
80412440:	d4dff06f          	j	8041218c <vprintfmt+0xb4>
80412444:	00144503          	lbu	a0,1(s0)
80412448:	00100a13          	li	s4,1
8041244c:	000d8413          	mv	s0,s11
80412450:	d3dff06f          	j	8041218c <vprintfmt+0xb4>
80412454:	00090613          	mv	a2,s2
80412458:	00048593          	mv	a1,s1
8041245c:	02500513          	li	a0,37
80412460:	000980e7          	jalr	s3
80412464:	cd1ff06f          	j	80412134 <vprintfmt+0x5c>
80412468:	00100793          	li	a5,1
8041246c:	14b7ce63          	blt	a5,a1,804125c8 <vprintfmt+0x4f0>
80412470:	000b2683          	lw	a3,0(s6)
80412474:	00000713          	li	a4,0
80412478:	004b0b13          	addi	s6,s6,4
8041247c:	00a00793          	li	a5,10
80412480:	dcdff06f          	j	8041224c <vprintfmt+0x174>
80412484:	00090613          	mv	a2,s2
80412488:	00048593          	mv	a1,s1
8041248c:	02500513          	li	a0,37
80412490:	000980e7          	jalr	s3
80412494:	fff44703          	lbu	a4,-1(s0)
80412498:	02500793          	li	a5,37
8041249c:	00040d93          	mv	s11,s0
804124a0:	c8f70ae3          	beq	a4,a5,80412134 <vprintfmt+0x5c>
804124a4:	02500713          	li	a4,37
804124a8:	fffd8d93          	addi	s11,s11,-1
804124ac:	fffdc783          	lbu	a5,-1(s11)
804124b0:	fee79ce3          	bne	a5,a4,804124a8 <vprintfmt+0x3d0>
804124b4:	c81ff06f          	j	80412134 <vprintfmt+0x5c>
804124b8:	00004697          	auipc	a3,0x4
804124bc:	cbc68693          	addi	a3,a3,-836 # 80416174 <error_string+0x22c>
804124c0:	00048613          	mv	a2,s1
804124c4:	00090593          	mv	a1,s2
804124c8:	00098513          	mv	a0,s3
804124cc:	138000ef          	jal	ra,80412604 <printfmt>
804124d0:	c65ff06f          	j	80412134 <vprintfmt+0x5c>
804124d4:	00004797          	auipc	a5,0x4
804124d8:	c9878793          	addi	a5,a5,-872 # 8041616c <error_string+0x224>
804124dc:	00004417          	auipc	s0,0x4
804124e0:	c9140413          	addi	s0,s0,-879 # 8041616d <error_string+0x225>
804124e4:	00078513          	mv	a0,a5
804124e8:	000c8593          	mv	a1,s9
804124ec:	01112623          	sw	a7,12(sp)
804124f0:	00f12423          	sw	a5,8(sp)
804124f4:	210000ef          	jal	ra,80412704 <strnlen>
804124f8:	40ad0d33          	sub	s10,s10,a0
804124fc:	00812783          	lw	a5,8(sp)
80412500:	00c12883          	lw	a7,12(sp)
80412504:	03a05663          	blez	s10,80412530 <vprintfmt+0x458>
80412508:	00088513          	mv	a0,a7
8041250c:	00090613          	mv	a2,s2
80412510:	00048593          	mv	a1,s1
80412514:	00f12623          	sw	a5,12(sp)
80412518:	01112423          	sw	a7,8(sp)
8041251c:	fffd0d13          	addi	s10,s10,-1
80412520:	000980e7          	jalr	s3
80412524:	00812883          	lw	a7,8(sp)
80412528:	00c12783          	lw	a5,12(sp)
8041252c:	fc0d1ee3          	bnez	s10,80412508 <vprintfmt+0x430>
80412530:	0007c783          	lbu	a5,0(a5)
80412534:	00078513          	mv	a0,a5
80412538:	e20798e3          	bnez	a5,80412368 <vprintfmt+0x290>
8041253c:	bf9ff06f          	j	80412134 <vprintfmt+0x5c>
80412540:	000980e7          	jalr	s3
80412544:	e4dff06f          	j	80412390 <vprintfmt+0x2b8>
80412548:	007b0793          	addi	a5,s6,7
8041254c:	ff87f793          	andi	a5,a5,-8
80412550:	00878b13          	addi	s6,a5,8
80412554:	0007aa03          	lw	s4,0(a5)
80412558:	0047a403          	lw	s0,4(a5)
8041255c:	d7dff06f          	j	804122d8 <vprintfmt+0x200>
80412560:	007b0793          	addi	a5,s6,7
80412564:	ff87f793          	andi	a5,a5,-8
80412568:	00878b13          	addi	s6,a5,8
8041256c:	0007a683          	lw	a3,0(a5)
80412570:	0047a703          	lw	a4,4(a5)
80412574:	01000793          	li	a5,16
80412578:	cd5ff06f          	j	8041224c <vprintfmt+0x174>
8041257c:	007b0793          	addi	a5,s6,7
80412580:	ff87f793          	andi	a5,a5,-8
80412584:	00878b13          	addi	s6,a5,8
80412588:	0007a683          	lw	a3,0(a5)
8041258c:	0047a703          	lw	a4,4(a5)
80412590:	00800793          	li	a5,8
80412594:	cb9ff06f          	j	8041224c <vprintfmt+0x174>
80412598:	00090613          	mv	a2,s2
8041259c:	00048593          	mv	a1,s1
804125a0:	02d00513          	li	a0,45
804125a4:	01112423          	sw	a7,8(sp)
804125a8:	000980e7          	jalr	s3
804125ac:	414006b3          	neg	a3,s4
804125b0:	00d037b3          	snez	a5,a3
804125b4:	40800733          	neg	a4,s0
804125b8:	40f70733          	sub	a4,a4,a5
804125bc:	00812883          	lw	a7,8(sp)
804125c0:	00a00793          	li	a5,10
804125c4:	c89ff06f          	j	8041224c <vprintfmt+0x174>
804125c8:	007b0793          	addi	a5,s6,7
804125cc:	ff87f793          	andi	a5,a5,-8
804125d0:	00878b13          	addi	s6,a5,8
804125d4:	0007a683          	lw	a3,0(a5)
804125d8:	0047a703          	lw	a4,4(a5)
804125dc:	00a00793          	li	a5,10
804125e0:	c6dff06f          	j	8041224c <vprintfmt+0x174>
804125e4:	01a05663          	blez	s10,804125f0 <vprintfmt+0x518>
804125e8:	02d00793          	li	a5,45
804125ec:	eef894e3          	bne	a7,a5,804124d4 <vprintfmt+0x3fc>
804125f0:	00004417          	auipc	s0,0x4
804125f4:	b7d40413          	addi	s0,s0,-1155 # 8041616d <error_string+0x225>
804125f8:	02800513          	li	a0,40
804125fc:	02800793          	li	a5,40
80412600:	d69ff06f          	j	80412368 <vprintfmt+0x290>

80412604 <printfmt>:
80412604:	fd010113          	addi	sp,sp,-48
80412608:	02010313          	addi	t1,sp,32
8041260c:	02e12023          	sw	a4,32(sp)
80412610:	00030713          	mv	a4,t1
80412614:	00112e23          	sw	ra,28(sp)
80412618:	02f12223          	sw	a5,36(sp)
8041261c:	03012423          	sw	a6,40(sp)
80412620:	03112623          	sw	a7,44(sp)
80412624:	00612623          	sw	t1,12(sp)
80412628:	ab1ff0ef          	jal	ra,804120d8 <vprintfmt>
8041262c:	01c12083          	lw	ra,28(sp)
80412630:	03010113          	addi	sp,sp,48
80412634:	00008067          	ret

80412638 <vsnprintf>:
80412638:	fff58593          	addi	a1,a1,-1
8041263c:	fe010113          	addi	sp,sp,-32
80412640:	00b505b3          	add	a1,a0,a1
80412644:	00112e23          	sw	ra,28(sp)
80412648:	00a12223          	sw	a0,4(sp)
8041264c:	00b12423          	sw	a1,8(sp)
80412650:	00012623          	sw	zero,12(sp)
80412654:	04050063          	beqz	a0,80412694 <vsnprintf+0x5c>
80412658:	02a5ee63          	bltu	a1,a0,80412694 <vsnprintf+0x5c>
8041265c:	ffff75b7          	lui	a1,0xffff7
80412660:	00068713          	mv	a4,a3
80412664:	00000517          	auipc	a0,0x0
80412668:	a4c50513          	addi	a0,a0,-1460 # 804120b0 <sprintputch>
8041266c:	00060693          	mv	a3,a2
80412670:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a21d>
80412674:	00410613          	addi	a2,sp,4
80412678:	a61ff0ef          	jal	ra,804120d8 <vprintfmt>
8041267c:	00412783          	lw	a5,4(sp)
80412680:	00078023          	sb	zero,0(a5)
80412684:	00c12503          	lw	a0,12(sp)
80412688:	01c12083          	lw	ra,28(sp)
8041268c:	02010113          	addi	sp,sp,32
80412690:	00008067          	ret
80412694:	ffd00513          	li	a0,-3
80412698:	ff1ff06f          	j	80412688 <vsnprintf+0x50>

8041269c <snprintf>:
8041269c:	fc010113          	addi	sp,sp,-64
804126a0:	02c10313          	addi	t1,sp,44
804126a4:	02d12623          	sw	a3,44(sp)
804126a8:	00030693          	mv	a3,t1
804126ac:	00112e23          	sw	ra,28(sp)
804126b0:	02e12823          	sw	a4,48(sp)
804126b4:	02f12a23          	sw	a5,52(sp)
804126b8:	03012c23          	sw	a6,56(sp)
804126bc:	03112e23          	sw	a7,60(sp)
804126c0:	00612623          	sw	t1,12(sp)
804126c4:	f75ff0ef          	jal	ra,80412638 <vsnprintf>
804126c8:	01c12083          	lw	ra,28(sp)
804126cc:	04010113          	addi	sp,sp,64
804126d0:	00008067          	ret

804126d4 <strlen>:
804126d4:	00054783          	lbu	a5,0(a0)
804126d8:	02078063          	beqz	a5,804126f8 <strlen+0x24>
804126dc:	00000793          	li	a5,0
804126e0:	00178793          	addi	a5,a5,1
804126e4:	00f50733          	add	a4,a0,a5
804126e8:	00074703          	lbu	a4,0(a4)
804126ec:	fe071ae3          	bnez	a4,804126e0 <strlen+0xc>
804126f0:	00078513          	mv	a0,a5
804126f4:	00008067          	ret
804126f8:	00000793          	li	a5,0
804126fc:	00078513          	mv	a0,a5
80412700:	00008067          	ret

80412704 <strnlen>:
80412704:	02058863          	beqz	a1,80412734 <strnlen+0x30>
80412708:	00054783          	lbu	a5,0(a0)
8041270c:	02078463          	beqz	a5,80412734 <strnlen+0x30>
80412710:	00000793          	li	a5,0
80412714:	00c0006f          	j	80412720 <strnlen+0x1c>
80412718:	00074703          	lbu	a4,0(a4)
8041271c:	00070863          	beqz	a4,8041272c <strnlen+0x28>
80412720:	00178793          	addi	a5,a5,1
80412724:	00f50733          	add	a4,a0,a5
80412728:	fef598e3          	bne	a1,a5,80412718 <strnlen+0x14>
8041272c:	00078513          	mv	a0,a5
80412730:	00008067          	ret
80412734:	00000793          	li	a5,0
80412738:	00078513          	mv	a0,a5
8041273c:	00008067          	ret

80412740 <strcpy>:
80412740:	00050793          	mv	a5,a0
80412744:	00158593          	addi	a1,a1,1
80412748:	fff5c703          	lbu	a4,-1(a1)
8041274c:	00178793          	addi	a5,a5,1
80412750:	fee78fa3          	sb	a4,-1(a5)
80412754:	fe0718e3          	bnez	a4,80412744 <strcpy+0x4>
80412758:	00008067          	ret

8041275c <strcmp>:
8041275c:	00054783          	lbu	a5,0(a0)
80412760:	0005c703          	lbu	a4,0(a1)
80412764:	00078e63          	beqz	a5,80412780 <strcmp+0x24>
80412768:	00e79e63          	bne	a5,a4,80412784 <strcmp+0x28>
8041276c:	00150513          	addi	a0,a0,1
80412770:	00054783          	lbu	a5,0(a0)
80412774:	00158593          	addi	a1,a1,1
80412778:	0005c703          	lbu	a4,0(a1)
8041277c:	fe0796e3          	bnez	a5,80412768 <strcmp+0xc>
80412780:	00000793          	li	a5,0
80412784:	40e78533          	sub	a0,a5,a4
80412788:	00008067          	ret

8041278c <strchr>:
8041278c:	00054783          	lbu	a5,0(a0)
80412790:	00078e63          	beqz	a5,804127ac <strchr+0x20>
80412794:	00b79663          	bne	a5,a1,804127a0 <strchr+0x14>
80412798:	01c0006f          	j	804127b4 <strchr+0x28>
8041279c:	00b78a63          	beq	a5,a1,804127b0 <strchr+0x24>
804127a0:	00150513          	addi	a0,a0,1
804127a4:	00054783          	lbu	a5,0(a0)
804127a8:	fe079ae3          	bnez	a5,8041279c <strchr+0x10>
804127ac:	00000513          	li	a0,0
804127b0:	00008067          	ret
804127b4:	00008067          	ret

804127b8 <memset>:
804127b8:	00060c63          	beqz	a2,804127d0 <memset+0x18>
804127bc:	00c50633          	add	a2,a0,a2
804127c0:	00050793          	mv	a5,a0
804127c4:	00178793          	addi	a5,a5,1
804127c8:	feb78fa3          	sb	a1,-1(a5)
804127cc:	fec79ce3          	bne	a5,a2,804127c4 <memset+0xc>
804127d0:	00008067          	ret

804127d4 <memmove>:
804127d4:	02a5f663          	bgeu	a1,a0,80412800 <memmove+0x2c>
804127d8:	00c587b3          	add	a5,a1,a2
804127dc:	02f57263          	bgeu	a0,a5,80412800 <memmove+0x2c>
804127e0:	00c50733          	add	a4,a0,a2
804127e4:	02060e63          	beqz	a2,80412820 <memmove+0x4c>
804127e8:	fff78793          	addi	a5,a5,-1
804127ec:	0007c683          	lbu	a3,0(a5)
804127f0:	fff70713          	addi	a4,a4,-1
804127f4:	00d70023          	sb	a3,0(a4)
804127f8:	fef598e3          	bne	a1,a5,804127e8 <memmove+0x14>
804127fc:	00008067          	ret
80412800:	00c586b3          	add	a3,a1,a2
80412804:	00050793          	mv	a5,a0
80412808:	00060e63          	beqz	a2,80412824 <memmove+0x50>
8041280c:	00158593          	addi	a1,a1,1
80412810:	fff5c703          	lbu	a4,-1(a1)
80412814:	00178793          	addi	a5,a5,1
80412818:	fee78fa3          	sb	a4,-1(a5)
8041281c:	fed598e3          	bne	a1,a3,8041280c <memmove+0x38>
80412820:	00008067          	ret
80412824:	00008067          	ret

80412828 <memcpy>:
80412828:	02060063          	beqz	a2,80412848 <memcpy+0x20>
8041282c:	00c58633          	add	a2,a1,a2
80412830:	00050793          	mv	a5,a0
80412834:	00158593          	addi	a1,a1,1
80412838:	fff5c703          	lbu	a4,-1(a1)
8041283c:	00178793          	addi	a5,a5,1
80412840:	fee78fa3          	sb	a4,-1(a5)
80412844:	fec598e3          	bne	a1,a2,80412834 <memcpy+0xc>
80412848:	00008067          	ret

8041284c <__mulsi3>:
8041284c:	00050613          	mv	a2,a0
80412850:	00000513          	li	a0,0
80412854:	0015f693          	andi	a3,a1,1
80412858:	00068463          	beqz	a3,80412860 <__mulsi3+0x14>
8041285c:	00c50533          	add	a0,a0,a2
80412860:	0015d593          	srli	a1,a1,0x1
80412864:	00161613          	slli	a2,a2,0x1
80412868:	fe0596e3          	bnez	a1,80412854 <__mulsi3+0x8>
8041286c:	00008067          	ret

80412870 <__divsi3>:
80412870:	06054063          	bltz	a0,804128d0 <__umodsi3+0x10>
80412874:	0605c663          	bltz	a1,804128e0 <__umodsi3+0x20>

80412878 <__udivsi3>:
80412878:	00058613          	mv	a2,a1
8041287c:	00050593          	mv	a1,a0
80412880:	fff00513          	li	a0,-1
80412884:	02060c63          	beqz	a2,804128bc <__udivsi3+0x44>
80412888:	00100693          	li	a3,1
8041288c:	00b67a63          	bgeu	a2,a1,804128a0 <__udivsi3+0x28>
80412890:	00c05863          	blez	a2,804128a0 <__udivsi3+0x28>
80412894:	00161613          	slli	a2,a2,0x1
80412898:	00169693          	slli	a3,a3,0x1
8041289c:	feb66ae3          	bltu	a2,a1,80412890 <__udivsi3+0x18>
804128a0:	00000513          	li	a0,0
804128a4:	00c5e663          	bltu	a1,a2,804128b0 <__udivsi3+0x38>
804128a8:	40c585b3          	sub	a1,a1,a2
804128ac:	00d56533          	or	a0,a0,a3
804128b0:	0016d693          	srli	a3,a3,0x1
804128b4:	00165613          	srli	a2,a2,0x1
804128b8:	fe0696e3          	bnez	a3,804128a4 <__udivsi3+0x2c>
804128bc:	00008067          	ret

804128c0 <__umodsi3>:
804128c0:	00008293          	mv	t0,ra
804128c4:	fb5ff0ef          	jal	ra,80412878 <__udivsi3>
804128c8:	00058513          	mv	a0,a1
804128cc:	00028067          	jr	t0
804128d0:	40a00533          	neg	a0,a0
804128d4:	0005d863          	bgez	a1,804128e4 <__umodsi3+0x24>
804128d8:	40b005b3          	neg	a1,a1
804128dc:	f9dff06f          	j	80412878 <__udivsi3>
804128e0:	40b005b3          	neg	a1,a1
804128e4:	00008293          	mv	t0,ra
804128e8:	f91ff0ef          	jal	ra,80412878 <__udivsi3>
804128ec:	40a00533          	neg	a0,a0
804128f0:	00028067          	jr	t0

804128f4 <__modsi3>:
804128f4:	00008293          	mv	t0,ra
804128f8:	0005ca63          	bltz	a1,8041290c <__modsi3+0x18>
804128fc:	00054c63          	bltz	a0,80412914 <__modsi3+0x20>
80412900:	f79ff0ef          	jal	ra,80412878 <__udivsi3>
80412904:	00058513          	mv	a0,a1
80412908:	00028067          	jr	t0
8041290c:	40b005b3          	neg	a1,a1
80412910:	fe0558e3          	bgez	a0,80412900 <__modsi3+0xc>
80412914:	40a00533          	neg	a0,a0
80412918:	f61ff0ef          	jal	ra,80412878 <__udivsi3>
8041291c:	40b00533          	neg	a0,a1
80412920:	00028067          	jr	t0
