
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
80400018:	8ac60613          	addi	a2,a2,-1876 # 8049c8c0 <end>
8040001c:	ff010113          	addi	sp,sp,-16 # 80418ff0 <bootstack+0x1ff0>
80400020:	40a60633          	sub	a2,a2,a0
80400024:	00000593          	li	a1,0
80400028:	00112623          	sw	ra,12(sp)
8040002c:	011120ef          	jal	ra,8041283c <memset>
80400030:	04d000ef          	jal	ra,8040087c <cons_init>
80400034:	00013597          	auipc	a1,0x13
80400038:	97458593          	addi	a1,a1,-1676 # 804129a8 <etext>
8040003c:	00013517          	auipc	a0,0x13
80400040:	98850513          	addi	a0,a0,-1656 # 804129c4 <etext+0x1c>
80400044:	1b8000ef          	jal	ra,804001fc <cprintf>
80400048:	294000ef          	jal	ra,804002dc <print_kerninfo>
8040004c:	2d1030ef          	jal	ra,80403b1c <pmm_init>
80400050:	3e5000ef          	jal	ra,80400c34 <pic_init>
80400054:	5c9000ef          	jal	ra,80400e1c <idt_init>
80400058:	211040ef          	jal	ra,80404a68 <vmm_init>
8040005c:	1310c0ef          	jal	ra,8040c98c <sched_init>
80400060:	339080ef          	jal	ra,80408b98 <proc_init>
80400064:	171000ef          	jal	ra,804009d4 <ide_init>
80400068:	561030ef          	jal	ra,80403dc8 <swap_init>
8040006c:	168060ef          	jal	ra,804061d4 <fs_init>
80400070:	6e0000ef          	jal	ra,80400750 <clock_init>
80400074:	3b1000ef          	jal	ra,80400c24 <intr_enable>
80400078:	505080ef          	jal	ra,80408d7c <cpu_idle>

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
804000b0:	92050513          	addi	a0,a0,-1760 # 804129cc <etext+0x24>
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
804001a0:	6f4000ef          	jal	ra,80400894 <cons_putc>
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
804001dc:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a219>
804001e0:	00112e23          	sw	ra,28(sp)
804001e4:	00012623          	sw	zero,12(sp)
804001e8:	775110ef          	jal	ra,8041215c <vprintfmt>
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
8040022c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a219>
80400230:	00112e23          	sw	ra,28(sp)
80400234:	02f12a23          	sw	a5,52(sp)
80400238:	03012c23          	sw	a6,56(sp)
8040023c:	03112e23          	sw	a7,60(sp)
80400240:	00612423          	sw	t1,8(sp)
80400244:	00012623          	sw	zero,12(sp)
80400248:	715110ef          	jal	ra,8041215c <vprintfmt>
8040024c:	01c12083          	lw	ra,28(sp)
80400250:	00c12503          	lw	a0,12(sp)
80400254:	04010113          	addi	sp,sp,64
80400258:	00008067          	ret

8040025c <cputchar>:
8040025c:	6380006f          	j	80400894 <cons_putc>

80400260 <getchar>:
80400260:	ff010113          	addi	sp,sp,-16
80400264:	00112623          	sw	ra,12(sp)
80400268:	6a0000ef          	jal	ra,80400908 <cons_getc>
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
80400294:	4c4120ef          	jal	ra,80412758 <strlen>
80400298:	00050413          	mv	s0,a0
8040029c:	00150513          	addi	a0,a0,1
804002a0:	5f0020ef          	jal	ra,80402890 <kmalloc>
804002a4:	00050493          	mv	s1,a0
804002a8:	00050c63          	beqz	a0,804002c0 <strdup+0x44>
804002ac:	00040613          	mv	a2,s0
804002b0:	00090593          	mv	a1,s2
804002b4:	00848433          	add	s0,s1,s0
804002b8:	5f4120ef          	jal	ra,804128ac <memcpy>
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
804002e4:	71850513          	addi	a0,a0,1816 # 804129f8 <etext+0x50>
804002e8:	00112623          	sw	ra,12(sp)
804002ec:	f11ff0ef          	jal	ra,804001fc <cprintf>
804002f0:	00000597          	auipc	a1,0x0
804002f4:	d1c58593          	addi	a1,a1,-740 # 8040000c <kern_init>
804002f8:	00012517          	auipc	a0,0x12
804002fc:	71c50513          	addi	a0,a0,1820 # 80412a14 <etext+0x6c>
80400300:	efdff0ef          	jal	ra,804001fc <cprintf>
80400304:	00012597          	auipc	a1,0x12
80400308:	6a458593          	addi	a1,a1,1700 # 804129a8 <etext>
8040030c:	00012517          	auipc	a0,0x12
80400310:	72450513          	addi	a0,a0,1828 # 80412a30 <etext+0x88>
80400314:	ee9ff0ef          	jal	ra,804001fc <cprintf>
80400318:	00099597          	auipc	a1,0x99
8040031c:	d3458593          	addi	a1,a1,-716 # 8049904c <edata>
80400320:	00012517          	auipc	a0,0x12
80400324:	72c50513          	addi	a0,a0,1836 # 80412a4c <etext+0xa4>
80400328:	ed5ff0ef          	jal	ra,804001fc <cprintf>
8040032c:	0009c597          	auipc	a1,0x9c
80400330:	59458593          	addi	a1,a1,1428 # 8049c8c0 <end>
80400334:	00012517          	auipc	a0,0x12
80400338:	73450513          	addi	a0,a0,1844 # 80412a68 <etext+0xc0>
8040033c:	ec1ff0ef          	jal	ra,804001fc <cprintf>
80400340:	0009d597          	auipc	a1,0x9d
80400344:	97f58593          	addi	a1,a1,-1665 # 8049ccbf <end+0x3ff>
80400348:	00000797          	auipc	a5,0x0
8040034c:	cc478793          	addi	a5,a5,-828 # 8040000c <kern_init>
80400350:	40f587b3          	sub	a5,a1,a5
80400354:	41f7d593          	srai	a1,a5,0x1f
80400358:	00c12083          	lw	ra,12(sp)
8040035c:	3ff5f593          	andi	a1,a1,1023
80400360:	00f585b3          	add	a1,a1,a5
80400364:	40a5d593          	srai	a1,a1,0xa
80400368:	00012517          	auipc	a0,0x12
8040036c:	71c50513          	addi	a0,a0,1820 # 80412a84 <etext+0xdc>
80400370:	01010113          	addi	sp,sp,16
80400374:	e89ff06f          	j	804001fc <cprintf>

80400378 <print_stackframe>:
80400378:	ff010113          	addi	sp,sp,-16
8040037c:	00012617          	auipc	a2,0x12
80400380:	65460613          	addi	a2,a2,1620 # 804129d0 <etext+0x28>
80400384:	05b00593          	li	a1,91
80400388:	00012517          	auipc	a0,0x12
8040038c:	65c50513          	addi	a0,a0,1628 # 804129e4 <etext+0x3c>
80400390:	00112623          	sw	ra,12(sp)
80400394:	290000ef          	jal	ra,80400624 <__panic>

80400398 <mon_help>:
80400398:	ff010113          	addi	sp,sp,-16
8040039c:	00012617          	auipc	a2,0x12
804003a0:	7cc60613          	addi	a2,a2,1996 # 80412b68 <commands+0xb8>
804003a4:	00012597          	auipc	a1,0x12
804003a8:	7e458593          	addi	a1,a1,2020 # 80412b88 <commands+0xd8>
804003ac:	00012517          	auipc	a0,0x12
804003b0:	7e450513          	addi	a0,a0,2020 # 80412b90 <commands+0xe0>
804003b4:	00112623          	sw	ra,12(sp)
804003b8:	e45ff0ef          	jal	ra,804001fc <cprintf>
804003bc:	00012617          	auipc	a2,0x12
804003c0:	7e060613          	addi	a2,a2,2016 # 80412b9c <commands+0xec>
804003c4:	00013597          	auipc	a1,0x13
804003c8:	80058593          	addi	a1,a1,-2048 # 80412bc4 <commands+0x114>
804003cc:	00012517          	auipc	a0,0x12
804003d0:	7c450513          	addi	a0,a0,1988 # 80412b90 <commands+0xe0>
804003d4:	e29ff0ef          	jal	ra,804001fc <cprintf>
804003d8:	00012617          	auipc	a2,0x12
804003dc:	7f860613          	addi	a2,a2,2040 # 80412bd0 <commands+0x120>
804003e0:	00013597          	auipc	a1,0x13
804003e4:	81058593          	addi	a1,a1,-2032 # 80412bf0 <commands+0x140>
804003e8:	00012517          	auipc	a0,0x12
804003ec:	7a850513          	addi	a0,a0,1960 # 80412b90 <commands+0xe0>
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
8040044c:	68c50513          	addi	a0,a0,1676 # 80412ad4 <commands+0x24>
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
80400484:	67c50513          	addi	a0,a0,1660 # 80412afc <commands+0x4c>
80400488:	d75ff0ef          	jal	ra,804001fc <cprintf>
8040048c:	000c0663          	beqz	s8,80400498 <kmonitor+0x5c>
80400490:	000c0513          	mv	a0,s8
80400494:	3c5000ef          	jal	ra,80401058 <print_trapframe>
80400498:	00000513          	li	a0,0
8040049c:	00000593          	li	a1,0
804004a0:	00000613          	li	a2,0
804004a4:	00800893          	li	a7,8
804004a8:	00000073          	ecall
804004ac:	00012c97          	auipc	s9,0x12
804004b0:	604c8c93          	addi	s9,s9,1540 # 80412ab0 <commands>
804004b4:	00012997          	auipc	s3,0x12
804004b8:	67098993          	addi	s3,s3,1648 # 80412b24 <commands+0x74>
804004bc:	00012917          	auipc	s2,0x12
804004c0:	66c90913          	addi	s2,s2,1644 # 80412b28 <commands+0x78>
804004c4:	00f00a13          	li	s4,15
804004c8:	00012b17          	auipc	s6,0x12
804004cc:	668b0b13          	addi	s6,s6,1640 # 80412b30 <commands+0x80>
804004d0:	00012a97          	auipc	s5,0x12
804004d4:	6b8a8a93          	addi	s5,s5,1720 # 80412b88 <commands+0xd8>
804004d8:	00300b93          	li	s7,3
804004dc:	00098513          	mv	a0,s3
804004e0:	b9dff0ef          	jal	ra,8040007c <readline>
804004e4:	00050413          	mv	s0,a0
804004e8:	fe050ae3          	beqz	a0,804004dc <kmonitor+0xa0>
804004ec:	00054583          	lbu	a1,0(a0)
804004f0:	00000493          	li	s1,0
804004f4:	02058063          	beqz	a1,80400514 <kmonitor+0xd8>
804004f8:	00090513          	mv	a0,s2
804004fc:	314120ef          	jal	ra,80412810 <strchr>
80400500:	0a050a63          	beqz	a0,804005b4 <kmonitor+0x178>
80400504:	00144583          	lbu	a1,1(s0)
80400508:	00040023          	sb	zero,0(s0)
8040050c:	00140413          	addi	s0,s0,1
80400510:	fe0594e3          	bnez	a1,804004f8 <kmonitor+0xbc>
80400514:	fc0484e3          	beqz	s1,804004dc <kmonitor+0xa0>
80400518:	00012583          	lw	a1,0(sp)
8040051c:	00012d17          	auipc	s10,0x12
80400520:	594d0d13          	addi	s10,s10,1428 # 80412ab0 <commands>
80400524:	000a8513          	mv	a0,s5
80400528:	00000413          	li	s0,0
8040052c:	00cd0d13          	addi	s10,s10,12
80400530:	2b0120ef          	jal	ra,804127e0 <strcmp>
80400534:	02050063          	beqz	a0,80400554 <kmonitor+0x118>
80400538:	00140413          	addi	s0,s0,1
8040053c:	0d740a63          	beq	s0,s7,80400610 <kmonitor+0x1d4>
80400540:	000d2503          	lw	a0,0(s10)
80400544:	00012583          	lw	a1,0(sp)
80400548:	00cd0d13          	addi	s10,s10,12
8040054c:	294120ef          	jal	ra,804127e0 <strcmp>
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
804005f0:	220120ef          	jal	ra,80412810 <strchr>
804005f4:	fe0506e3          	beqz	a0,804005e0 <kmonitor+0x1a4>
804005f8:	00044583          	lbu	a1,0(s0)
804005fc:	ef9ff06f          	j	804004f4 <kmonitor+0xb8>
80400600:	01000593          	li	a1,16
80400604:	000b0513          	mv	a0,s6
80400608:	bf5ff0ef          	jal	ra,804001fc <cprintf>
8040060c:	fb5ff06f          	j	804005c0 <kmonitor+0x184>
80400610:	00012583          	lw	a1,0(sp)
80400614:	00012517          	auipc	a0,0x12
80400618:	53c50513          	addi	a0,a0,1340 # 80412b50 <commands+0xa0>
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
80400674:	58c50513          	addi	a0,a0,1420 # 80412bfc <commands+0x14c>
80400678:	00f12623          	sw	a5,12(sp)
8040067c:	b81ff0ef          	jal	ra,804001fc <cprintf>
80400680:	00c12583          	lw	a1,12(sp)
80400684:	00040513          	mv	a0,s0
80400688:	b39ff0ef          	jal	ra,804001c0 <vcprintf>
8040068c:	00012517          	auipc	a0,0x12
80400690:	4d850513          	addi	a0,a0,1240 # 80412b64 <commands+0xb4>
80400694:	b69ff0ef          	jal	ra,804001fc <cprintf>
80400698:	594000ef          	jal	ra,80400c2c <intr_disable>
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
804006c8:	55450513          	addi	a0,a0,1364 # 80412c18 <commands+0x168>
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
804006f8:	47050513          	addi	a0,a0,1136 # 80412b64 <commands+0xb4>
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
80400788:	0607a623          	sw	zero,108(a5) # 8049c7f0 <ticks>
8040078c:	00012517          	auipc	a0,0x12
80400790:	4ac50513          	addi	a0,a0,1196 # 80412c38 <commands+0x188>
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
804007c4:	100007b7          	lui	a5,0x10000
804007c8:	0057c783          	lbu	a5,5(a5) # 10000005 <_binary_bin_sfs_img_size+0xff88005>
804007cc:	0017f793          	andi	a5,a5,1
804007d0:	02078863          	beqz	a5,80400800 <serial_proc_data+0x3c>
804007d4:	00000513          	li	a0,0
804007d8:	00000593          	li	a1,0
804007dc:	00000613          	li	a2,0
804007e0:	00200893          	li	a7,2
804007e4:	00000073          	ecall
804007e8:	00054c63          	bltz	a0,80400800 <serial_proc_data+0x3c>
804007ec:	07f00793          	li	a5,127
804007f0:	00f50463          	beq	a0,a5,804007f8 <serial_proc_data+0x34>
804007f4:	00008067          	ret
804007f8:	00800513          	li	a0,8
804007fc:	00008067          	ret
80400800:	fff00513          	li	a0,-1
80400804:	00008067          	ret

80400808 <serial_intr>:
80400808:	ff010113          	addi	sp,sp,-16
8040080c:	00812423          	sw	s0,8(sp)
80400810:	00912223          	sw	s1,4(sp)
80400814:	01212023          	sw	s2,0(sp)
80400818:	00112623          	sw	ra,12(sp)
8040081c:	fff00413          	li	s0,-1
80400820:	00099497          	auipc	s1,0x99
80400824:	c3048493          	addi	s1,s1,-976 # 80499450 <cons>
80400828:	20000913          	li	s2,512
8040082c:	0080006f          	j	80400834 <serial_intr+0x2c>
80400830:	02051263          	bnez	a0,80400854 <serial_intr+0x4c>
80400834:	f91ff0ef          	jal	ra,804007c4 <serial_proc_data>
80400838:	fe851ce3          	bne	a0,s0,80400830 <serial_intr+0x28>
8040083c:	00c12083          	lw	ra,12(sp)
80400840:	00812403          	lw	s0,8(sp)
80400844:	00412483          	lw	s1,4(sp)
80400848:	00012903          	lw	s2,0(sp)
8040084c:	01010113          	addi	sp,sp,16
80400850:	00008067          	ret
80400854:	2044a783          	lw	a5,516(s1)
80400858:	00178713          	addi	a4,a5,1
8040085c:	00f487b3          	add	a5,s1,a5
80400860:	00099697          	auipc	a3,0x99
80400864:	dee6aa23          	sw	a4,-524(a3) # 80499654 <cons+0x204>
80400868:	00a78023          	sb	a0,0(a5)
8040086c:	fd2714e3          	bne	a4,s2,80400834 <serial_intr+0x2c>
80400870:	00099797          	auipc	a5,0x99
80400874:	de07a223          	sw	zero,-540(a5) # 80499654 <cons+0x204>
80400878:	fbdff06f          	j	80400834 <serial_intr+0x2c>

8040087c <cons_init>:
8040087c:	00000513          	li	a0,0
80400880:	00000593          	li	a1,0
80400884:	00000613          	li	a2,0
80400888:	00200893          	li	a7,2
8040088c:	00000073          	ecall
80400890:	00008067          	ret

80400894 <cons_putc>:
80400894:	fe010113          	addi	sp,sp,-32
80400898:	00112e23          	sw	ra,28(sp)
8040089c:	00812c23          	sw	s0,24(sp)
804008a0:	100027f3          	csrr	a5,sstatus
804008a4:	0027f793          	andi	a5,a5,2
804008a8:	00000413          	li	s0,0
804008ac:	04079463          	bnez	a5,804008f4 <cons_putc+0x60>
804008b0:	00800793          	li	a5,8
804008b4:	02f50463          	beq	a0,a5,804008dc <cons_putc+0x48>
804008b8:	00000593          	li	a1,0
804008bc:	00000613          	li	a2,0
804008c0:	00100893          	li	a7,1
804008c4:	00000073          	ecall
804008c8:	00041e63          	bnez	s0,804008e4 <cons_putc+0x50>
804008cc:	01c12083          	lw	ra,28(sp)
804008d0:	01812403          	lw	s0,24(sp)
804008d4:	02010113          	addi	sp,sp,32
804008d8:	00008067          	ret
804008dc:	ec1ff0ef          	jal	ra,8040079c <serial_putc.part.0>
804008e0:	fe0406e3          	beqz	s0,804008cc <cons_putc+0x38>
804008e4:	01812403          	lw	s0,24(sp)
804008e8:	01c12083          	lw	ra,28(sp)
804008ec:	02010113          	addi	sp,sp,32
804008f0:	3340006f          	j	80400c24 <intr_enable>
804008f4:	00a12623          	sw	a0,12(sp)
804008f8:	334000ef          	jal	ra,80400c2c <intr_disable>
804008fc:	00100413          	li	s0,1
80400900:	00c12503          	lw	a0,12(sp)
80400904:	fadff06f          	j	804008b0 <cons_putc+0x1c>

80400908 <cons_getc>:
80400908:	fe010113          	addi	sp,sp,-32
8040090c:	00112e23          	sw	ra,28(sp)
80400910:	100027f3          	csrr	a5,sstatus
80400914:	0027f793          	andi	a5,a5,2
80400918:	04079463          	bnez	a5,80400960 <cons_getc+0x58>
8040091c:	eedff0ef          	jal	ra,80400808 <serial_intr>
80400920:	00099797          	auipc	a5,0x99
80400924:	b3078793          	addi	a5,a5,-1232 # 80499450 <cons>
80400928:	2007a703          	lw	a4,512(a5)
8040092c:	2047a683          	lw	a3,516(a5)
80400930:	00000513          	li	a0,0
80400934:	02d70063          	beq	a4,a3,80400954 <cons_getc+0x4c>
80400938:	00170693          	addi	a3,a4,1
8040093c:	00e787b3          	add	a5,a5,a4
80400940:	00099717          	auipc	a4,0x99
80400944:	d0d72823          	sw	a3,-752(a4) # 80499650 <cons+0x200>
80400948:	20000713          	li	a4,512
8040094c:	0007c503          	lbu	a0,0(a5)
80400950:	06e68263          	beq	a3,a4,804009b4 <cons_getc+0xac>
80400954:	01c12083          	lw	ra,28(sp)
80400958:	02010113          	addi	sp,sp,32
8040095c:	00008067          	ret
80400960:	2cc000ef          	jal	ra,80400c2c <intr_disable>
80400964:	ea5ff0ef          	jal	ra,80400808 <serial_intr>
80400968:	00099797          	auipc	a5,0x99
8040096c:	ae878793          	addi	a5,a5,-1304 # 80499450 <cons>
80400970:	2007a703          	lw	a4,512(a5)
80400974:	2047a683          	lw	a3,516(a5)
80400978:	00000513          	li	a0,0
8040097c:	02d70063          	beq	a4,a3,8040099c <cons_getc+0x94>
80400980:	00170693          	addi	a3,a4,1
80400984:	00e787b3          	add	a5,a5,a4
80400988:	00099717          	auipc	a4,0x99
8040098c:	ccd72423          	sw	a3,-824(a4) # 80499650 <cons+0x200>
80400990:	20000713          	li	a4,512
80400994:	0007c503          	lbu	a0,0(a5)
80400998:	02e68863          	beq	a3,a4,804009c8 <cons_getc+0xc0>
8040099c:	00a12623          	sw	a0,12(sp)
804009a0:	284000ef          	jal	ra,80400c24 <intr_enable>
804009a4:	01c12083          	lw	ra,28(sp)
804009a8:	00c12503          	lw	a0,12(sp)
804009ac:	02010113          	addi	sp,sp,32
804009b0:	00008067          	ret
804009b4:	01c12083          	lw	ra,28(sp)
804009b8:	00099797          	auipc	a5,0x99
804009bc:	c807ac23          	sw	zero,-872(a5) # 80499650 <cons+0x200>
804009c0:	02010113          	addi	sp,sp,32
804009c4:	00008067          	ret
804009c8:	00099797          	auipc	a5,0x99
804009cc:	c807a423          	sw	zero,-888(a5) # 80499650 <cons+0x200>
804009d0:	fcdff06f          	j	8040099c <cons_getc+0x94>

804009d4 <ide_init>:
804009d4:	ff010113          	addi	sp,sp,-16
804009d8:	00099597          	auipc	a1,0x99
804009dc:	cbc58593          	addi	a1,a1,-836 # 80499694 <ide_devices+0x3c>
804009e0:	00100513          	li	a0,1
804009e4:	00812423          	sw	s0,8(sp)
804009e8:	00099797          	auipc	a5,0x99
804009ec:	c607a823          	sw	zero,-912(a5) # 80499658 <ide_devices>
804009f0:	00099797          	auipc	a5,0x99
804009f4:	ca07a223          	sw	zero,-860(a5) # 80499694 <ide_devices+0x3c>
804009f8:	00099797          	auipc	a5,0x99
804009fc:	cc07ac23          	sw	zero,-808(a5) # 804996d0 <ide_devices+0x78>
80400a00:	00099797          	auipc	a5,0x99
80400a04:	d007a623          	sw	zero,-756(a5) # 8049970c <ide_devices+0xb4>
80400a08:	00112623          	sw	ra,12(sp)
80400a0c:	00099417          	auipc	s0,0x99
80400a10:	c4c40413          	addi	s0,s0,-948 # 80499658 <ide_devices>
80400a14:	2fc000ef          	jal	ra,80400d10 <ramdisk_init>
80400a18:	03c42783          	lw	a5,60(s0)
80400a1c:	02078663          	beqz	a5,80400a48 <ide_init+0x74>
80400a20:	00099597          	auipc	a1,0x99
80400a24:	cb058593          	addi	a1,a1,-848 # 804996d0 <ide_devices+0x78>
80400a28:	00200513          	li	a0,2
80400a2c:	2e4000ef          	jal	ra,80400d10 <ramdisk_init>
80400a30:	07842783          	lw	a5,120(s0)
80400a34:	02078a63          	beqz	a5,80400a68 <ide_init+0x94>
80400a38:	00c12083          	lw	ra,12(sp)
80400a3c:	00812403          	lw	s0,8(sp)
80400a40:	01010113          	addi	sp,sp,16
80400a44:	00008067          	ret
80400a48:	00012697          	auipc	a3,0x12
80400a4c:	20c68693          	addi	a3,a3,524 # 80412c54 <commands+0x1a4>
80400a50:	00012617          	auipc	a2,0x12
80400a54:	21c60613          	addi	a2,a2,540 # 80412c6c <commands+0x1bc>
80400a58:	01100593          	li	a1,17
80400a5c:	00012517          	auipc	a0,0x12
80400a60:	22850513          	addi	a0,a0,552 # 80412c84 <commands+0x1d4>
80400a64:	bc1ff0ef          	jal	ra,80400624 <__panic>
80400a68:	00012697          	auipc	a3,0x12
80400a6c:	23068693          	addi	a3,a3,560 # 80412c98 <commands+0x1e8>
80400a70:	00012617          	auipc	a2,0x12
80400a74:	1fc60613          	addi	a2,a2,508 # 80412c6c <commands+0x1bc>
80400a78:	01400593          	li	a1,20
80400a7c:	00012517          	auipc	a0,0x12
80400a80:	20850513          	addi	a0,a0,520 # 80412c84 <commands+0x1d4>
80400a84:	ba1ff0ef          	jal	ra,80400624 <__panic>

80400a88 <ide_device_valid>:
80400a88:	00300793          	li	a5,3
80400a8c:	02a7e463          	bltu	a5,a0,80400ab4 <ide_device_valid+0x2c>
80400a90:	00451793          	slli	a5,a0,0x4
80400a94:	40a787b3          	sub	a5,a5,a0
80400a98:	00279793          	slli	a5,a5,0x2
80400a9c:	00099517          	auipc	a0,0x99
80400aa0:	bbc50513          	addi	a0,a0,-1092 # 80499658 <ide_devices>
80400aa4:	00f507b3          	add	a5,a0,a5
80400aa8:	0007a503          	lw	a0,0(a5)
80400aac:	00a03533          	snez	a0,a0
80400ab0:	00008067          	ret
80400ab4:	00000513          	li	a0,0
80400ab8:	00008067          	ret

80400abc <ide_device_size>:
80400abc:	00300793          	li	a5,3
80400ac0:	02a7e663          	bltu	a5,a0,80400aec <ide_device_size+0x30>
80400ac4:	00451793          	slli	a5,a0,0x4
80400ac8:	40a787b3          	sub	a5,a5,a0
80400acc:	00279793          	slli	a5,a5,0x2
80400ad0:	00099517          	auipc	a0,0x99
80400ad4:	b8850513          	addi	a0,a0,-1144 # 80499658 <ide_devices>
80400ad8:	00f507b3          	add	a5,a0,a5
80400adc:	0007a503          	lw	a0,0(a5)
80400ae0:	00050863          	beqz	a0,80400af0 <ide_device_size+0x34>
80400ae4:	0087a503          	lw	a0,8(a5)
80400ae8:	00008067          	ret
80400aec:	00000513          	li	a0,0
80400af0:	00008067          	ret

80400af4 <ide_read_secs>:
80400af4:	ff010113          	addi	sp,sp,-16
80400af8:	00112623          	sw	ra,12(sp)
80400afc:	08000793          	li	a5,128
80400b00:	04d7e663          	bltu	a5,a3,80400b4c <ide_read_secs+0x58>
80400b04:	00300793          	li	a5,3
80400b08:	04a7e263          	bltu	a5,a0,80400b4c <ide_read_secs+0x58>
80400b0c:	00451793          	slli	a5,a0,0x4
80400b10:	40a78533          	sub	a0,a5,a0
80400b14:	00251513          	slli	a0,a0,0x2
80400b18:	00099797          	auipc	a5,0x99
80400b1c:	b4078793          	addi	a5,a5,-1216 # 80499658 <ide_devices>
80400b20:	00a78533          	add	a0,a5,a0
80400b24:	00052783          	lw	a5,0(a0)
80400b28:	02078263          	beqz	a5,80400b4c <ide_read_secs+0x58>
80400b2c:	100007b7          	lui	a5,0x10000
80400b30:	02f5fe63          	bgeu	a1,a5,80400b6c <ide_read_secs+0x78>
80400b34:	00b68733          	add	a4,a3,a1
80400b38:	02e7ea63          	bltu	a5,a4,80400b6c <ide_read_secs+0x78>
80400b3c:	00c12083          	lw	ra,12(sp)
80400b40:	03452303          	lw	t1,52(a0)
80400b44:	01010113          	addi	sp,sp,16
80400b48:	00030067          	jr	t1
80400b4c:	00012697          	auipc	a3,0x12
80400b50:	16468693          	addi	a3,a3,356 # 80412cb0 <commands+0x200>
80400b54:	00012617          	auipc	a2,0x12
80400b58:	11860613          	addi	a2,a2,280 # 80412c6c <commands+0x1bc>
80400b5c:	02200593          	li	a1,34
80400b60:	00012517          	auipc	a0,0x12
80400b64:	12450513          	addi	a0,a0,292 # 80412c84 <commands+0x1d4>
80400b68:	abdff0ef          	jal	ra,80400624 <__panic>
80400b6c:	00012697          	auipc	a3,0x12
80400b70:	16c68693          	addi	a3,a3,364 # 80412cd8 <commands+0x228>
80400b74:	00012617          	auipc	a2,0x12
80400b78:	0f860613          	addi	a2,a2,248 # 80412c6c <commands+0x1bc>
80400b7c:	02300593          	li	a1,35
80400b80:	00012517          	auipc	a0,0x12
80400b84:	10450513          	addi	a0,a0,260 # 80412c84 <commands+0x1d4>
80400b88:	a9dff0ef          	jal	ra,80400624 <__panic>

80400b8c <ide_write_secs>:
80400b8c:	ff010113          	addi	sp,sp,-16
80400b90:	00112623          	sw	ra,12(sp)
80400b94:	08000793          	li	a5,128
80400b98:	04d7e663          	bltu	a5,a3,80400be4 <ide_write_secs+0x58>
80400b9c:	00300793          	li	a5,3
80400ba0:	04a7e263          	bltu	a5,a0,80400be4 <ide_write_secs+0x58>
80400ba4:	00451793          	slli	a5,a0,0x4
80400ba8:	40a78533          	sub	a0,a5,a0
80400bac:	00251513          	slli	a0,a0,0x2
80400bb0:	00099797          	auipc	a5,0x99
80400bb4:	aa878793          	addi	a5,a5,-1368 # 80499658 <ide_devices>
80400bb8:	00a78533          	add	a0,a5,a0
80400bbc:	00052783          	lw	a5,0(a0)
80400bc0:	02078263          	beqz	a5,80400be4 <ide_write_secs+0x58>
80400bc4:	100007b7          	lui	a5,0x10000
80400bc8:	02f5fe63          	bgeu	a1,a5,80400c04 <ide_write_secs+0x78>
80400bcc:	00b68733          	add	a4,a3,a1
80400bd0:	02e7ea63          	bltu	a5,a4,80400c04 <ide_write_secs+0x78>
80400bd4:	00c12083          	lw	ra,12(sp)
80400bd8:	03852303          	lw	t1,56(a0)
80400bdc:	01010113          	addi	sp,sp,16
80400be0:	00030067          	jr	t1
80400be4:	00012697          	auipc	a3,0x12
80400be8:	0cc68693          	addi	a3,a3,204 # 80412cb0 <commands+0x200>
80400bec:	00012617          	auipc	a2,0x12
80400bf0:	08060613          	addi	a2,a2,128 # 80412c6c <commands+0x1bc>
80400bf4:	02900593          	li	a1,41
80400bf8:	00012517          	auipc	a0,0x12
80400bfc:	08c50513          	addi	a0,a0,140 # 80412c84 <commands+0x1d4>
80400c00:	a25ff0ef          	jal	ra,80400624 <__panic>
80400c04:	00012697          	auipc	a3,0x12
80400c08:	0d468693          	addi	a3,a3,212 # 80412cd8 <commands+0x228>
80400c0c:	00012617          	auipc	a2,0x12
80400c10:	06060613          	addi	a2,a2,96 # 80412c6c <commands+0x1bc>
80400c14:	02a00593          	li	a1,42
80400c18:	00012517          	auipc	a0,0x12
80400c1c:	06c50513          	addi	a0,a0,108 # 80412c84 <commands+0x1d4>
80400c20:	a05ff0ef          	jal	ra,80400624 <__panic>

80400c24 <intr_enable>:
80400c24:	100167f3          	csrrsi	a5,sstatus,2
80400c28:	00008067          	ret

80400c2c <intr_disable>:
80400c2c:	100177f3          	csrrci	a5,sstatus,2
80400c30:	00008067          	ret

80400c34 <pic_init>:
80400c34:	00008067          	ret

80400c38 <ramdisk_write>:
80400c38:	00852783          	lw	a5,8(a0)
80400c3c:	ff010113          	addi	sp,sp,-16
80400c40:	00112623          	sw	ra,12(sp)
80400c44:	40b787b3          	sub	a5,a5,a1
80400c48:	00058713          	mv	a4,a1
80400c4c:	00060593          	mv	a1,a2
80400c50:	00f6f463          	bgeu	a3,a5,80400c58 <ramdisk_write+0x20>
80400c54:	00068793          	mv	a5,a3
80400c58:	00c52503          	lw	a0,12(a0)
80400c5c:	00971713          	slli	a4,a4,0x9
80400c60:	00979613          	slli	a2,a5,0x9
80400c64:	00a70533          	add	a0,a4,a0
80400c68:	445110ef          	jal	ra,804128ac <memcpy>
80400c6c:	00c12083          	lw	ra,12(sp)
80400c70:	00000513          	li	a0,0
80400c74:	01010113          	addi	sp,sp,16
80400c78:	00008067          	ret

80400c7c <ramdisk_read>:
80400c7c:	00852783          	lw	a5,8(a0)
80400c80:	ff010113          	addi	sp,sp,-16
80400c84:	00112623          	sw	ra,12(sp)
80400c88:	40b787b3          	sub	a5,a5,a1
80400c8c:	00050713          	mv	a4,a0
80400c90:	00060513          	mv	a0,a2
80400c94:	00f6f463          	bgeu	a3,a5,80400c9c <ramdisk_read+0x20>
80400c98:	00068793          	mv	a5,a3
80400c9c:	00c72703          	lw	a4,12(a4)
80400ca0:	00959593          	slli	a1,a1,0x9
80400ca4:	00979613          	slli	a2,a5,0x9
80400ca8:	00e585b3          	add	a1,a1,a4
80400cac:	401110ef          	jal	ra,804128ac <memcpy>
80400cb0:	00c12083          	lw	ra,12(sp)
80400cb4:	00000513          	li	a0,0
80400cb8:	01010113          	addi	sp,sp,16
80400cbc:	00008067          	ret

80400cc0 <check_initrd>:
80400cc0:	ff010113          	addi	sp,sp,-16
80400cc4:	00112623          	sw	ra,12(sp)
80400cc8:	02b50663          	beq	a0,a1,80400cf4 <check_initrd+0x34>
80400ccc:	40a586b3          	sub	a3,a1,a0
80400cd0:	fff58613          	addi	a2,a1,-1
80400cd4:	00050593          	mv	a1,a0
80400cd8:	00012517          	auipc	a0,0x12
80400cdc:	05450513          	addi	a0,a0,84 # 80412d2c <commands+0x27c>
80400ce0:	d1cff0ef          	jal	ra,804001fc <cprintf>
80400ce4:	00c12083          	lw	ra,12(sp)
80400ce8:	00100513          	li	a0,1
80400cec:	01010113          	addi	sp,sp,16
80400cf0:	00008067          	ret
80400cf4:	00012517          	auipc	a0,0x12
80400cf8:	02050513          	addi	a0,a0,32 # 80412d14 <commands+0x264>
80400cfc:	d00ff0ef          	jal	ra,804001fc <cprintf>
80400d00:	00c12083          	lw	ra,12(sp)
80400d04:	00000513          	li	a0,0
80400d08:	01010113          	addi	sp,sp,16
80400d0c:	00008067          	ret

80400d10 <ramdisk_init>:
80400d10:	fe010113          	addi	sp,sp,-32
80400d14:	00812c23          	sw	s0,24(sp)
80400d18:	00058413          	mv	s0,a1
80400d1c:	01212823          	sw	s2,16(sp)
80400d20:	03c00613          	li	a2,60
80400d24:	00050913          	mv	s2,a0
80400d28:	00000593          	li	a1,0
80400d2c:	00040513          	mv	a0,s0
80400d30:	00112e23          	sw	ra,28(sp)
80400d34:	00912a23          	sw	s1,20(sp)
80400d38:	01312623          	sw	s3,12(sp)
80400d3c:	301110ef          	jal	ra,8041283c <memset>
80400d40:	00100793          	li	a5,1
80400d44:	0af90663          	beq	s2,a5,80400df0 <ramdisk_init+0xe0>
80400d48:	00200793          	li	a5,2
80400d4c:	00098497          	auipc	s1,0x98
80400d50:	2b448493          	addi	s1,s1,692 # 80499000 <swap_manager_fifo>
80400d54:	00020997          	auipc	s3,0x20
80400d58:	2ac98993          	addi	s3,s3,684 # 80421000 <_binary_bin_sfs_img_start>
80400d5c:	0af91463          	bne	s2,a5,80400e04 <ramdisk_init+0xf4>
80400d60:	00048593          	mv	a1,s1
80400d64:	00098513          	mv	a0,s3
80400d68:	f59ff0ef          	jal	ra,80400cc0 <check_initrd>
80400d6c:	02051063          	bnez	a0,80400d8c <ramdisk_init+0x7c>
80400d70:	01c12083          	lw	ra,28(sp)
80400d74:	01812403          	lw	s0,24(sp)
80400d78:	01412483          	lw	s1,20(sp)
80400d7c:	01012903          	lw	s2,16(sp)
80400d80:	00c12983          	lw	s3,12(sp)
80400d84:	02010113          	addi	sp,sp,32
80400d88:	00008067          	ret
80400d8c:	413484b3          	sub	s1,s1,s3
80400d90:	00100793          	li	a5,1
80400d94:	00f42023          	sw	a5,0(s0)
80400d98:	0094d493          	srli	s1,s1,0x9
80400d9c:	fff00793          	li	a5,-1
80400da0:	00f42223          	sw	a5,4(s0)
80400da4:	00942423          	sw	s1,8(s0)
80400da8:	01342623          	sw	s3,12(s0)
80400dac:	01440513          	addi	a0,s0,20
80400db0:	00012597          	auipc	a1,0x12
80400db4:	fd058593          	addi	a1,a1,-48 # 80412d80 <commands+0x2d0>
80400db8:	20d110ef          	jal	ra,804127c4 <strcpy>
80400dbc:	00000797          	auipc	a5,0x0
80400dc0:	ec078793          	addi	a5,a5,-320 # 80400c7c <ramdisk_read>
80400dc4:	02f42a23          	sw	a5,52(s0)
80400dc8:	00000797          	auipc	a5,0x0
80400dcc:	e7078793          	addi	a5,a5,-400 # 80400c38 <ramdisk_write>
80400dd0:	02f42c23          	sw	a5,56(s0)
80400dd4:	01c12083          	lw	ra,28(sp)
80400dd8:	01812403          	lw	s0,24(sp)
80400ddc:	01412483          	lw	s1,20(sp)
80400de0:	01012903          	lw	s2,16(sp)
80400de4:	00c12983          	lw	s3,12(sp)
80400de8:	02010113          	addi	sp,sp,32
80400dec:	00008067          	ret
80400df0:	00020497          	auipc	s1,0x20
80400df4:	21048493          	addi	s1,s1,528 # 80421000 <_binary_bin_sfs_img_start>
80400df8:	00018997          	auipc	s3,0x18
80400dfc:	20898993          	addi	s3,s3,520 # 80419000 <_binary_bin_swap_img_start>
80400e00:	f61ff06f          	j	80400d60 <ramdisk_init+0x50>
80400e04:	00012617          	auipc	a2,0x12
80400e08:	f5060613          	addi	a2,a2,-176 # 80412d54 <commands+0x2a4>
80400e0c:	03200593          	li	a1,50
80400e10:	00012517          	auipc	a0,0x12
80400e14:	f5850513          	addi	a0,a0,-168 # 80412d68 <commands+0x2b8>
80400e18:	80dff0ef          	jal	ra,80400624 <__panic>

80400e1c <idt_init>:
80400e1c:	14005073          	csrwi	sscratch,0
80400e20:	00000797          	auipc	a5,0x0
80400e24:	71078793          	addi	a5,a5,1808 # 80401530 <__alltraps>
80400e28:	10579073          	csrw	stvec,a5
80400e2c:	000407b7          	lui	a5,0x40
80400e30:	1007a7f3          	csrrs	a5,sstatus,a5
80400e34:	104167f3          	csrrsi	a5,sie,2
80400e38:	00008067          	ret

80400e3c <print_regs>:
80400e3c:	00052583          	lw	a1,0(a0)
80400e40:	ff010113          	addi	sp,sp,-16
80400e44:	00812423          	sw	s0,8(sp)
80400e48:	00050413          	mv	s0,a0
80400e4c:	00012517          	auipc	a0,0x12
80400e50:	12850513          	addi	a0,a0,296 # 80412f74 <commands+0x4c4>
80400e54:	00112623          	sw	ra,12(sp)
80400e58:	ba4ff0ef          	jal	ra,804001fc <cprintf>
80400e5c:	00442583          	lw	a1,4(s0)
80400e60:	00012517          	auipc	a0,0x12
80400e64:	12850513          	addi	a0,a0,296 # 80412f88 <commands+0x4d8>
80400e68:	b94ff0ef          	jal	ra,804001fc <cprintf>
80400e6c:	00842583          	lw	a1,8(s0)
80400e70:	00012517          	auipc	a0,0x12
80400e74:	12c50513          	addi	a0,a0,300 # 80412f9c <commands+0x4ec>
80400e78:	b84ff0ef          	jal	ra,804001fc <cprintf>
80400e7c:	00c42583          	lw	a1,12(s0)
80400e80:	00012517          	auipc	a0,0x12
80400e84:	13050513          	addi	a0,a0,304 # 80412fb0 <commands+0x500>
80400e88:	b74ff0ef          	jal	ra,804001fc <cprintf>
80400e8c:	01042583          	lw	a1,16(s0)
80400e90:	00012517          	auipc	a0,0x12
80400e94:	13450513          	addi	a0,a0,308 # 80412fc4 <commands+0x514>
80400e98:	b64ff0ef          	jal	ra,804001fc <cprintf>
80400e9c:	01442583          	lw	a1,20(s0)
80400ea0:	00012517          	auipc	a0,0x12
80400ea4:	13850513          	addi	a0,a0,312 # 80412fd8 <commands+0x528>
80400ea8:	b54ff0ef          	jal	ra,804001fc <cprintf>
80400eac:	01842583          	lw	a1,24(s0)
80400eb0:	00012517          	auipc	a0,0x12
80400eb4:	13c50513          	addi	a0,a0,316 # 80412fec <commands+0x53c>
80400eb8:	b44ff0ef          	jal	ra,804001fc <cprintf>
80400ebc:	01c42583          	lw	a1,28(s0)
80400ec0:	00012517          	auipc	a0,0x12
80400ec4:	14050513          	addi	a0,a0,320 # 80413000 <commands+0x550>
80400ec8:	b34ff0ef          	jal	ra,804001fc <cprintf>
80400ecc:	02042583          	lw	a1,32(s0)
80400ed0:	00012517          	auipc	a0,0x12
80400ed4:	14450513          	addi	a0,a0,324 # 80413014 <commands+0x564>
80400ed8:	b24ff0ef          	jal	ra,804001fc <cprintf>
80400edc:	02442583          	lw	a1,36(s0)
80400ee0:	00012517          	auipc	a0,0x12
80400ee4:	14850513          	addi	a0,a0,328 # 80413028 <commands+0x578>
80400ee8:	b14ff0ef          	jal	ra,804001fc <cprintf>
80400eec:	02842583          	lw	a1,40(s0)
80400ef0:	00012517          	auipc	a0,0x12
80400ef4:	14c50513          	addi	a0,a0,332 # 8041303c <commands+0x58c>
80400ef8:	b04ff0ef          	jal	ra,804001fc <cprintf>
80400efc:	02c42583          	lw	a1,44(s0)
80400f00:	00012517          	auipc	a0,0x12
80400f04:	15050513          	addi	a0,a0,336 # 80413050 <commands+0x5a0>
80400f08:	af4ff0ef          	jal	ra,804001fc <cprintf>
80400f0c:	03042583          	lw	a1,48(s0)
80400f10:	00012517          	auipc	a0,0x12
80400f14:	15450513          	addi	a0,a0,340 # 80413064 <commands+0x5b4>
80400f18:	ae4ff0ef          	jal	ra,804001fc <cprintf>
80400f1c:	03442583          	lw	a1,52(s0)
80400f20:	00012517          	auipc	a0,0x12
80400f24:	15850513          	addi	a0,a0,344 # 80413078 <commands+0x5c8>
80400f28:	ad4ff0ef          	jal	ra,804001fc <cprintf>
80400f2c:	03842583          	lw	a1,56(s0)
80400f30:	00012517          	auipc	a0,0x12
80400f34:	15c50513          	addi	a0,a0,348 # 8041308c <commands+0x5dc>
80400f38:	ac4ff0ef          	jal	ra,804001fc <cprintf>
80400f3c:	03c42583          	lw	a1,60(s0)
80400f40:	00012517          	auipc	a0,0x12
80400f44:	16050513          	addi	a0,a0,352 # 804130a0 <commands+0x5f0>
80400f48:	ab4ff0ef          	jal	ra,804001fc <cprintf>
80400f4c:	04042583          	lw	a1,64(s0)
80400f50:	00012517          	auipc	a0,0x12
80400f54:	16450513          	addi	a0,a0,356 # 804130b4 <commands+0x604>
80400f58:	aa4ff0ef          	jal	ra,804001fc <cprintf>
80400f5c:	04442583          	lw	a1,68(s0)
80400f60:	00012517          	auipc	a0,0x12
80400f64:	16850513          	addi	a0,a0,360 # 804130c8 <commands+0x618>
80400f68:	a94ff0ef          	jal	ra,804001fc <cprintf>
80400f6c:	04842583          	lw	a1,72(s0)
80400f70:	00012517          	auipc	a0,0x12
80400f74:	16c50513          	addi	a0,a0,364 # 804130dc <commands+0x62c>
80400f78:	a84ff0ef          	jal	ra,804001fc <cprintf>
80400f7c:	04c42583          	lw	a1,76(s0)
80400f80:	00012517          	auipc	a0,0x12
80400f84:	17050513          	addi	a0,a0,368 # 804130f0 <commands+0x640>
80400f88:	a74ff0ef          	jal	ra,804001fc <cprintf>
80400f8c:	05042583          	lw	a1,80(s0)
80400f90:	00012517          	auipc	a0,0x12
80400f94:	17450513          	addi	a0,a0,372 # 80413104 <commands+0x654>
80400f98:	a64ff0ef          	jal	ra,804001fc <cprintf>
80400f9c:	05442583          	lw	a1,84(s0)
80400fa0:	00012517          	auipc	a0,0x12
80400fa4:	17850513          	addi	a0,a0,376 # 80413118 <commands+0x668>
80400fa8:	a54ff0ef          	jal	ra,804001fc <cprintf>
80400fac:	05842583          	lw	a1,88(s0)
80400fb0:	00012517          	auipc	a0,0x12
80400fb4:	17c50513          	addi	a0,a0,380 # 8041312c <commands+0x67c>
80400fb8:	a44ff0ef          	jal	ra,804001fc <cprintf>
80400fbc:	05c42583          	lw	a1,92(s0)
80400fc0:	00012517          	auipc	a0,0x12
80400fc4:	18050513          	addi	a0,a0,384 # 80413140 <commands+0x690>
80400fc8:	a34ff0ef          	jal	ra,804001fc <cprintf>
80400fcc:	06042583          	lw	a1,96(s0)
80400fd0:	00012517          	auipc	a0,0x12
80400fd4:	18450513          	addi	a0,a0,388 # 80413154 <commands+0x6a4>
80400fd8:	a24ff0ef          	jal	ra,804001fc <cprintf>
80400fdc:	06442583          	lw	a1,100(s0)
80400fe0:	00012517          	auipc	a0,0x12
80400fe4:	18850513          	addi	a0,a0,392 # 80413168 <commands+0x6b8>
80400fe8:	a14ff0ef          	jal	ra,804001fc <cprintf>
80400fec:	06842583          	lw	a1,104(s0)
80400ff0:	00012517          	auipc	a0,0x12
80400ff4:	18c50513          	addi	a0,a0,396 # 8041317c <commands+0x6cc>
80400ff8:	a04ff0ef          	jal	ra,804001fc <cprintf>
80400ffc:	06c42583          	lw	a1,108(s0)
80401000:	00012517          	auipc	a0,0x12
80401004:	19050513          	addi	a0,a0,400 # 80413190 <commands+0x6e0>
80401008:	9f4ff0ef          	jal	ra,804001fc <cprintf>
8040100c:	07042583          	lw	a1,112(s0)
80401010:	00012517          	auipc	a0,0x12
80401014:	19450513          	addi	a0,a0,404 # 804131a4 <commands+0x6f4>
80401018:	9e4ff0ef          	jal	ra,804001fc <cprintf>
8040101c:	07442583          	lw	a1,116(s0)
80401020:	00012517          	auipc	a0,0x12
80401024:	19850513          	addi	a0,a0,408 # 804131b8 <commands+0x708>
80401028:	9d4ff0ef          	jal	ra,804001fc <cprintf>
8040102c:	07842583          	lw	a1,120(s0)
80401030:	00012517          	auipc	a0,0x12
80401034:	19c50513          	addi	a0,a0,412 # 804131cc <commands+0x71c>
80401038:	9c4ff0ef          	jal	ra,804001fc <cprintf>
8040103c:	07c42583          	lw	a1,124(s0)
80401040:	00812403          	lw	s0,8(sp)
80401044:	00c12083          	lw	ra,12(sp)
80401048:	00012517          	auipc	a0,0x12
8040104c:	19850513          	addi	a0,a0,408 # 804131e0 <commands+0x730>
80401050:	01010113          	addi	sp,sp,16
80401054:	9a8ff06f          	j	804001fc <cprintf>

80401058 <print_trapframe>:
80401058:	ff010113          	addi	sp,sp,-16
8040105c:	00812423          	sw	s0,8(sp)
80401060:	00050593          	mv	a1,a0
80401064:	00050413          	mv	s0,a0
80401068:	00012517          	auipc	a0,0x12
8040106c:	18c50513          	addi	a0,a0,396 # 804131f4 <commands+0x744>
80401070:	00112623          	sw	ra,12(sp)
80401074:	988ff0ef          	jal	ra,804001fc <cprintf>
80401078:	00040513          	mv	a0,s0
8040107c:	dc1ff0ef          	jal	ra,80400e3c <print_regs>
80401080:	08042583          	lw	a1,128(s0)
80401084:	00012517          	auipc	a0,0x12
80401088:	18450513          	addi	a0,a0,388 # 80413208 <commands+0x758>
8040108c:	970ff0ef          	jal	ra,804001fc <cprintf>
80401090:	08442583          	lw	a1,132(s0)
80401094:	00012517          	auipc	a0,0x12
80401098:	18850513          	addi	a0,a0,392 # 8041321c <commands+0x76c>
8040109c:	960ff0ef          	jal	ra,804001fc <cprintf>
804010a0:	08842583          	lw	a1,136(s0)
804010a4:	00012517          	auipc	a0,0x12
804010a8:	18c50513          	addi	a0,a0,396 # 80413230 <commands+0x780>
804010ac:	950ff0ef          	jal	ra,804001fc <cprintf>
804010b0:	08c42583          	lw	a1,140(s0)
804010b4:	00812403          	lw	s0,8(sp)
804010b8:	00c12083          	lw	ra,12(sp)
804010bc:	00012517          	auipc	a0,0x12
804010c0:	18850513          	addi	a0,a0,392 # 80413244 <commands+0x794>
804010c4:	01010113          	addi	sp,sp,16
804010c8:	934ff06f          	j	804001fc <cprintf>

804010cc <pgfault_handler>:
804010cc:	0009b797          	auipc	a5,0x9b
804010d0:	6c478793          	addi	a5,a5,1732 # 8049c790 <pgfault_count.1848>
804010d4:	0007a783          	lw	a5,0(a5)
804010d8:	0009b717          	auipc	a4,0x9b
804010dc:	7dc70713          	addi	a4,a4,2012 # 8049c8b4 <check_mm_struct>
804010e0:	00072703          	lw	a4,0(a4)
804010e4:	ff010113          	addi	sp,sp,-16
804010e8:	00178793          	addi	a5,a5,1
804010ec:	00812423          	sw	s0,8(sp)
804010f0:	00112623          	sw	ra,12(sp)
804010f4:	0009b697          	auipc	a3,0x9b
804010f8:	68f6ae23          	sw	a5,1692(a3) # 8049c790 <pgfault_count.1848>
804010fc:	00050413          	mv	s0,a0
80401100:	04070263          	beqz	a4,80401144 <pgfault_handler+0x78>
80401104:	06400693          	li	a3,100
80401108:	08f6c663          	blt	a3,a5,80401194 <pgfault_handler+0xc8>
8040110c:	0009b797          	auipc	a5,0x9b
80401110:	6a478793          	addi	a5,a5,1700 # 8049c7b0 <current>
80401114:	0007a683          	lw	a3,0(a5)
80401118:	0009b797          	auipc	a5,0x9b
8040111c:	69c78793          	addi	a5,a5,1692 # 8049c7b4 <idleproc>
80401120:	0007a783          	lw	a5,0(a5)
80401124:	04f69863          	bne	a3,a5,80401174 <pgfault_handler+0xa8>
80401128:	08842603          	lw	a2,136(s0)
8040112c:	08c42583          	lw	a1,140(s0)
80401130:	00812403          	lw	s0,8(sp)
80401134:	00c12083          	lw	ra,12(sp)
80401138:	00070513          	mv	a0,a4
8040113c:	01010113          	addi	sp,sp,16
80401140:	12d0306f          	j	80404a6c <do_pgfault>
80401144:	0009b797          	auipc	a5,0x9b
80401148:	66c78793          	addi	a5,a5,1644 # 8049c7b0 <current>
8040114c:	0007a783          	lw	a5,0(a5)
80401150:	04078e63          	beqz	a5,804011ac <pgfault_handler+0xe0>
80401154:	0187a703          	lw	a4,24(a5)
80401158:	08842603          	lw	a2,136(s0)
8040115c:	08c42583          	lw	a1,140(s0)
80401160:	00812403          	lw	s0,8(sp)
80401164:	00c12083          	lw	ra,12(sp)
80401168:	00070513          	mv	a0,a4
8040116c:	01010113          	addi	sp,sp,16
80401170:	0fd0306f          	j	80404a6c <do_pgfault>
80401174:	00012697          	auipc	a3,0x12
80401178:	da868693          	addi	a3,a3,-600 # 80412f1c <commands+0x46c>
8040117c:	00012617          	auipc	a2,0x12
80401180:	af060613          	addi	a2,a2,-1296 # 80412c6c <commands+0x1bc>
80401184:	08c00593          	li	a1,140
80401188:	00012517          	auipc	a0,0x12
8040118c:	d8050513          	addi	a0,a0,-640 # 80412f08 <commands+0x458>
80401190:	c94ff0ef          	jal	ra,80400624 <__panic>
80401194:	00012617          	auipc	a2,0x12
80401198:	d4460613          	addi	a2,a2,-700 # 80412ed8 <commands+0x428>
8040119c:	08700593          	li	a1,135
804011a0:	00012517          	auipc	a0,0x12
804011a4:	d6850513          	addi	a0,a0,-664 # 80412f08 <commands+0x458>
804011a8:	c7cff0ef          	jal	ra,80400624 <__panic>
804011ac:	eadff0ef          	jal	ra,80401058 <print_trapframe>
804011b0:	08842583          	lw	a1,136(s0)
804011b4:	00012517          	auipc	a0,0x12
804011b8:	d7c50513          	addi	a0,a0,-644 # 80412f30 <commands+0x480>
804011bc:	840ff0ef          	jal	ra,804001fc <cprintf>
804011c0:	08c42583          	lw	a1,140(s0)
804011c4:	00d00793          	li	a5,13
804011c8:	02f58863          	beq	a1,a5,804011f8 <pgfault_handler+0x12c>
804011cc:	00f00793          	li	a5,15
804011d0:	02f58c63          	beq	a1,a5,80401208 <pgfault_handler+0x13c>
804011d4:	00012517          	auipc	a0,0x12
804011d8:	d8050513          	addi	a0,a0,-640 # 80412f54 <commands+0x4a4>
804011dc:	820ff0ef          	jal	ra,804001fc <cprintf>
804011e0:	00012617          	auipc	a2,0x12
804011e4:	d7c60613          	addi	a2,a2,-644 # 80412f5c <commands+0x4ac>
804011e8:	09300593          	li	a1,147
804011ec:	00012517          	auipc	a0,0x12
804011f0:	d1c50513          	addi	a0,a0,-740 # 80412f08 <commands+0x458>
804011f4:	c30ff0ef          	jal	ra,80400624 <__panic>
804011f8:	00012517          	auipc	a0,0x12
804011fc:	d5450513          	addi	a0,a0,-684 # 80412f4c <commands+0x49c>
80401200:	ffdfe0ef          	jal	ra,804001fc <cprintf>
80401204:	fddff06f          	j	804011e0 <pgfault_handler+0x114>
80401208:	00012517          	auipc	a0,0x12
8040120c:	d4850513          	addi	a0,a0,-696 # 80412f50 <commands+0x4a0>
80401210:	fedfe0ef          	jal	ra,804001fc <cprintf>
80401214:	fcdff06f          	j	804011e0 <pgfault_handler+0x114>

80401218 <interrupt_handler>:
80401218:	08c52783          	lw	a5,140(a0)
8040121c:	ff010113          	addi	sp,sp,-16
80401220:	00112623          	sw	ra,12(sp)
80401224:	00179793          	slli	a5,a5,0x1
80401228:	00100713          	li	a4,1
8040122c:	0017d793          	srli	a5,a5,0x1
80401230:	02e78663          	beq	a5,a4,8040125c <interrupt_handler+0x44>
80401234:	00500713          	li	a4,5
80401238:	02e79c63          	bne	a5,a4,80401270 <interrupt_handler+0x58>
8040123c:	cd4ff0ef          	jal	ra,80400710 <clock_set_next_event>
80401240:	0009b797          	auipc	a5,0x9b
80401244:	5b078793          	addi	a5,a5,1456 # 8049c7f0 <ticks>
80401248:	0007a783          	lw	a5,0(a5)
8040124c:	00178793          	addi	a5,a5,1
80401250:	0009b717          	auipc	a4,0x9b
80401254:	5af72023          	sw	a5,1440(a4) # 8049c7f0 <ticks>
80401258:	3b50b0ef          	jal	ra,8040ce0c <run_timer_list>
8040125c:	dacff0ef          	jal	ra,80400808 <serial_intr>
80401260:	ea8ff0ef          	jal	ra,80400908 <cons_getc>
80401264:	00c12083          	lw	ra,12(sp)
80401268:	01010113          	addi	sp,sp,16
8040126c:	5850d06f          	j	8040eff0 <dev_stdin_write>
80401270:	00c12083          	lw	ra,12(sp)
80401274:	01010113          	addi	sp,sp,16
80401278:	00008067          	ret

8040127c <exception_handler>:
8040127c:	08c52603          	lw	a2,140(a0)
80401280:	00f00793          	li	a5,15
80401284:	16c7ea63          	bltu	a5,a2,804013f8 <exception_handler+0x17c>
80401288:	00012697          	auipc	a3,0x12
8040128c:	b0468693          	addi	a3,a3,-1276 # 80412d8c <commands+0x2dc>
80401290:	00261713          	slli	a4,a2,0x2
80401294:	00d70733          	add	a4,a4,a3
80401298:	00072783          	lw	a5,0(a4)
8040129c:	ff010113          	addi	sp,sp,-16
804012a0:	00812423          	sw	s0,8(sp)
804012a4:	00112623          	sw	ra,12(sp)
804012a8:	00912223          	sw	s1,4(sp)
804012ac:	00d787b3          	add	a5,a5,a3
804012b0:	00050413          	mv	s0,a0
804012b4:	00078067          	jr	a5
804012b8:	08452783          	lw	a5,132(a0)
804012bc:	00812403          	lw	s0,8(sp)
804012c0:	00c12083          	lw	ra,12(sp)
804012c4:	00412483          	lw	s1,4(sp)
804012c8:	00478793          	addi	a5,a5,4
804012cc:	08f52223          	sw	a5,132(a0)
804012d0:	01010113          	addi	sp,sp,16
804012d4:	63d0b06f          	j	8040d110 <syscall>
804012d8:	00c12083          	lw	ra,12(sp)
804012dc:	00812403          	lw	s0,8(sp)
804012e0:	00412483          	lw	s1,4(sp)
804012e4:	01010113          	addi	sp,sp,16
804012e8:	00008067          	ret
804012ec:	de1ff0ef          	jal	ra,804010cc <pgfault_handler>
804012f0:	fe0504e3          	beqz	a0,804012d8 <exception_handler+0x5c>
804012f4:	0009b797          	auipc	a5,0x9b
804012f8:	4bc78793          	addi	a5,a5,1212 # 8049c7b0 <current>
804012fc:	0007a783          	lw	a5,0(a5)
80401300:	12078c63          	beqz	a5,80401438 <exception_handler+0x1bc>
80401304:	08042783          	lw	a5,128(s0)
80401308:	00050693          	mv	a3,a0
8040130c:	1007f793          	andi	a5,a5,256
80401310:	06078a63          	beqz	a5,80401384 <exception_handler+0x108>
80401314:	00012617          	auipc	a2,0x12
80401318:	b6860613          	addi	a2,a2,-1176 # 80412e7c <commands+0x3cc>
8040131c:	0e300593          	li	a1,227
80401320:	00012517          	auipc	a0,0x12
80401324:	be850513          	addi	a0,a0,-1048 # 80412f08 <commands+0x458>
80401328:	afcff0ef          	jal	ra,80400624 <__panic>
8040132c:	da1ff0ef          	jal	ra,804010cc <pgfault_handler>
80401330:	fa0504e3          	beqz	a0,804012d8 <exception_handler+0x5c>
80401334:	0009b797          	auipc	a5,0x9b
80401338:	47c78793          	addi	a5,a5,1148 # 8049c7b0 <current>
8040133c:	0007a783          	lw	a5,0(a5)
80401340:	0c078e63          	beqz	a5,8040141c <exception_handler+0x1a0>
80401344:	08042783          	lw	a5,128(s0)
80401348:	00050693          	mv	a3,a0
8040134c:	1007f793          	andi	a5,a5,256
80401350:	00078e63          	beqz	a5,8040136c <exception_handler+0xf0>
80401354:	00012617          	auipc	a2,0x12
80401358:	b2860613          	addi	a2,a2,-1240 # 80412e7c <commands+0x3cc>
8040135c:	0f000593          	li	a1,240
80401360:	00012517          	auipc	a0,0x12
80401364:	ba850513          	addi	a0,a0,-1112 # 80412f08 <commands+0x458>
80401368:	abcff0ef          	jal	ra,80400624 <__panic>
8040136c:	00012617          	auipc	a2,0x12
80401370:	b4060613          	addi	a2,a2,-1216 # 80412eac <commands+0x3fc>
80401374:	0f200593          	li	a1,242
80401378:	00012517          	auipc	a0,0x12
8040137c:	b9050513          	addi	a0,a0,-1136 # 80412f08 <commands+0x458>
80401380:	aa4ff0ef          	jal	ra,80400624 <__panic>
80401384:	00012617          	auipc	a2,0x12
80401388:	b2860613          	addi	a2,a2,-1240 # 80412eac <commands+0x3fc>
8040138c:	0e500593          	li	a1,229
80401390:	00012517          	auipc	a0,0x12
80401394:	b7850513          	addi	a0,a0,-1160 # 80412f08 <commands+0x458>
80401398:	a8cff0ef          	jal	ra,80400624 <__panic>
8040139c:	0009b497          	auipc	s1,0x9b
804013a0:	41448493          	addi	s1,s1,1044 # 8049c7b0 <current>
804013a4:	0004a783          	lw	a5,0(s1)
804013a8:	04078a63          	beqz	a5,804013fc <exception_handler+0x180>
804013ac:	0047a583          	lw	a1,4(a5)
804013b0:	08842703          	lw	a4,136(s0)
804013b4:	08442683          	lw	a3,132(s0)
804013b8:	00012517          	auipc	a0,0x12
804013bc:	a1450513          	addi	a0,a0,-1516 # 80412dcc <commands+0x31c>
804013c0:	e3dfe0ef          	jal	ra,804001fc <cprintf>
804013c4:	0004a783          	lw	a5,0(s1)
804013c8:	00078863          	beqz	a5,804013d8 <exception_handler+0x15c>
804013cc:	08042783          	lw	a5,128(s0)
804013d0:	1007f793          	andi	a5,a5,256
804013d4:	02078863          	beqz	a5,80401404 <exception_handler+0x188>
804013d8:	08442703          	lw	a4,132(s0)
804013dc:	08c42683          	lw	a3,140(s0)
804013e0:	00012617          	auipc	a2,0x12
804013e4:	a5060613          	addi	a2,a2,-1456 # 80412e30 <commands+0x380>
804013e8:	0c900593          	li	a1,201
804013ec:	00012517          	auipc	a0,0x12
804013f0:	b1c50513          	addi	a0,a0,-1252 # 80412f08 <commands+0x458>
804013f4:	a30ff0ef          	jal	ra,80400624 <__panic>
804013f8:	00008067          	ret
804013fc:	fff00593          	li	a1,-1
80401400:	fb1ff06f          	j	804013b0 <exception_handler+0x134>
80401404:	00012517          	auipc	a0,0x12
80401408:	9fc50513          	addi	a0,a0,-1540 # 80412e00 <commands+0x350>
8040140c:	df1fe0ef          	jal	ra,804001fc <cprintf>
80401410:	ff700513          	li	a0,-9
80401414:	5c8060ef          	jal	ra,804079dc <do_exit>
80401418:	fc1ff06f          	j	804013d8 <exception_handler+0x15c>
8040141c:	00050693          	mv	a3,a0
80401420:	00012617          	auipc	a2,0x12
80401424:	a3c60613          	addi	a2,a2,-1476 # 80412e5c <commands+0x3ac>
80401428:	0ed00593          	li	a1,237
8040142c:	00012517          	auipc	a0,0x12
80401430:	adc50513          	addi	a0,a0,-1316 # 80412f08 <commands+0x458>
80401434:	9f0ff0ef          	jal	ra,80400624 <__panic>
80401438:	00050693          	mv	a3,a0
8040143c:	00012617          	auipc	a2,0x12
80401440:	a2060613          	addi	a2,a2,-1504 # 80412e5c <commands+0x3ac>
80401444:	0e000593          	li	a1,224
80401448:	00012517          	auipc	a0,0x12
8040144c:	ac050513          	addi	a0,a0,-1344 # 80412f08 <commands+0x458>
80401450:	9d4ff0ef          	jal	ra,80400624 <__panic>

80401454 <trap>:
80401454:	ff010113          	addi	sp,sp,-16
80401458:	00812423          	sw	s0,8(sp)
8040145c:	0009b417          	auipc	s0,0x9b
80401460:	35440413          	addi	s0,s0,852 # 8049c7b0 <current>
80401464:	00042703          	lw	a4,0(s0)
80401468:	00112623          	sw	ra,12(sp)
8040146c:	00912223          	sw	s1,4(sp)
80401470:	01212023          	sw	s2,0(sp)
80401474:	08c52683          	lw	a3,140(a0)
80401478:	04070e63          	beqz	a4,804014d4 <trap+0x80>
8040147c:	08052483          	lw	s1,128(a0)
80401480:	05472903          	lw	s2,84(a4)
80401484:	04a72a23          	sw	a0,84(a4)
80401488:	1004f493          	andi	s1,s1,256
8040148c:	0406c063          	bltz	a3,804014cc <trap+0x78>
80401490:	dedff0ef          	jal	ra,8040127c <exception_handler>
80401494:	00042783          	lw	a5,0(s0)
80401498:	0527aa23          	sw	s2,84(a5)
8040149c:	00049c63          	bnez	s1,804014b4 <trap+0x60>
804014a0:	05c7a703          	lw	a4,92(a5)
804014a4:	00177713          	andi	a4,a4,1
804014a8:	06071c63          	bnez	a4,80401520 <trap+0xcc>
804014ac:	0107a783          	lw	a5,16(a5)
804014b0:	04079c63          	bnez	a5,80401508 <trap+0xb4>
804014b4:	00c12083          	lw	ra,12(sp)
804014b8:	00812403          	lw	s0,8(sp)
804014bc:	00412483          	lw	s1,4(sp)
804014c0:	00012903          	lw	s2,0(sp)
804014c4:	01010113          	addi	sp,sp,16
804014c8:	00008067          	ret
804014cc:	d4dff0ef          	jal	ra,80401218 <interrupt_handler>
804014d0:	fc5ff06f          	j	80401494 <trap+0x40>
804014d4:	0006ce63          	bltz	a3,804014f0 <trap+0x9c>
804014d8:	00812403          	lw	s0,8(sp)
804014dc:	00c12083          	lw	ra,12(sp)
804014e0:	00412483          	lw	s1,4(sp)
804014e4:	00012903          	lw	s2,0(sp)
804014e8:	01010113          	addi	sp,sp,16
804014ec:	d91ff06f          	j	8040127c <exception_handler>
804014f0:	00812403          	lw	s0,8(sp)
804014f4:	00c12083          	lw	ra,12(sp)
804014f8:	00412483          	lw	s1,4(sp)
804014fc:	00012903          	lw	s2,0(sp)
80401500:	01010113          	addi	sp,sp,16
80401504:	d15ff06f          	j	80401218 <interrupt_handler>
80401508:	00812403          	lw	s0,8(sp)
8040150c:	00c12083          	lw	ra,12(sp)
80401510:	00412483          	lw	s1,4(sp)
80401514:	00012903          	lw	s2,0(sp)
80401518:	01010113          	addi	sp,sp,16
8040151c:	5e00b06f          	j	8040cafc <schedule>
80401520:	ff700513          	li	a0,-9
80401524:	4b8060ef          	jal	ra,804079dc <do_exit>
80401528:	00042783          	lw	a5,0(s0)
8040152c:	f81ff06f          	j	804014ac <trap+0x58>

80401530 <__alltraps>:
80401530:	14011173          	csrrw	sp,sscratch,sp
80401534:	00011463          	bnez	sp,8040153c <__alltraps+0xc>
80401538:	14011173          	csrrw	sp,sscratch,sp
8040153c:	f7010113          	addi	sp,sp,-144
80401540:	00012023          	sw	zero,0(sp)
80401544:	00112223          	sw	ra,4(sp)
80401548:	00312623          	sw	gp,12(sp)
8040154c:	00412823          	sw	tp,16(sp)
80401550:	00512a23          	sw	t0,20(sp)
80401554:	00612c23          	sw	t1,24(sp)
80401558:	00712e23          	sw	t2,28(sp)
8040155c:	02812023          	sw	s0,32(sp)
80401560:	02912223          	sw	s1,36(sp)
80401564:	02a12423          	sw	a0,40(sp)
80401568:	02b12623          	sw	a1,44(sp)
8040156c:	02c12823          	sw	a2,48(sp)
80401570:	02d12a23          	sw	a3,52(sp)
80401574:	02e12c23          	sw	a4,56(sp)
80401578:	02f12e23          	sw	a5,60(sp)
8040157c:	05012023          	sw	a6,64(sp)
80401580:	05112223          	sw	a7,68(sp)
80401584:	05212423          	sw	s2,72(sp)
80401588:	05312623          	sw	s3,76(sp)
8040158c:	05412823          	sw	s4,80(sp)
80401590:	05512a23          	sw	s5,84(sp)
80401594:	05612c23          	sw	s6,88(sp)
80401598:	05712e23          	sw	s7,92(sp)
8040159c:	07812023          	sw	s8,96(sp)
804015a0:	07912223          	sw	s9,100(sp)
804015a4:	07a12423          	sw	s10,104(sp)
804015a8:	07b12623          	sw	s11,108(sp)
804015ac:	07c12823          	sw	t3,112(sp)
804015b0:	07d12a23          	sw	t4,116(sp)
804015b4:	07e12c23          	sw	t5,120(sp)
804015b8:	07f12e23          	sw	t6,124(sp)
804015bc:	14002473          	csrr	s0,sscratch
804015c0:	100024f3          	csrr	s1,sstatus
804015c4:	14102973          	csrr	s2,sepc
804015c8:	143029f3          	csrr	s3,stval
804015cc:	14202a73          	csrr	s4,scause
804015d0:	1004fa93          	andi	s5,s1,256
804015d4:	000a9663          	bnez	s5,804015e0 <__alltraps+0xb0>
804015d8:	00812423          	sw	s0,8(sp)
804015dc:	00c0006f          	j	804015e8 <__alltraps+0xb8>
804015e0:	09010a93          	addi	s5,sp,144
804015e4:	01512423          	sw	s5,8(sp)
804015e8:	14001073          	csrw	sscratch,zero
804015ec:	08912023          	sw	s1,128(sp)
804015f0:	09212223          	sw	s2,132(sp)
804015f4:	09312423          	sw	s3,136(sp)
804015f8:	09412623          	sw	s4,140(sp)
804015fc:	00010513          	mv	a0,sp
80401600:	e55ff0ef          	jal	ra,80401454 <trap>

80401604 <__trapret>:
80401604:	08012483          	lw	s1,128(sp)
80401608:	08412903          	lw	s2,132(sp)
8040160c:	1004f413          	andi	s0,s1,256
80401610:	00040463          	beqz	s0,80401618 <__trapret+0x14>
80401614:	0180006f          	j	8040162c <__trapret+0x28>
80401618:	09010413          	addi	s0,sp,144
8040161c:	14041073          	csrw	sscratch,s0
80401620:	0000100f          	fence.i
80401624:	12000073          	sfence.vma
80401628:	0000100f          	fence.i
8040162c:	10049073          	csrw	sstatus,s1
80401630:	14191073          	csrw	sepc,s2
80401634:	00412083          	lw	ra,4(sp)
80401638:	00c12183          	lw	gp,12(sp)
8040163c:	01012203          	lw	tp,16(sp)
80401640:	01412283          	lw	t0,20(sp)
80401644:	01812303          	lw	t1,24(sp)
80401648:	01c12383          	lw	t2,28(sp)
8040164c:	02012403          	lw	s0,32(sp)
80401650:	02412483          	lw	s1,36(sp)
80401654:	02812503          	lw	a0,40(sp)
80401658:	02c12583          	lw	a1,44(sp)
8040165c:	03012603          	lw	a2,48(sp)
80401660:	03412683          	lw	a3,52(sp)
80401664:	03812703          	lw	a4,56(sp)
80401668:	03c12783          	lw	a5,60(sp)
8040166c:	04012803          	lw	a6,64(sp)
80401670:	04412883          	lw	a7,68(sp)
80401674:	04812903          	lw	s2,72(sp)
80401678:	04c12983          	lw	s3,76(sp)
8040167c:	05012a03          	lw	s4,80(sp)
80401680:	05412a83          	lw	s5,84(sp)
80401684:	05812b03          	lw	s6,88(sp)
80401688:	05c12b83          	lw	s7,92(sp)
8040168c:	06012c03          	lw	s8,96(sp)
80401690:	06412c83          	lw	s9,100(sp)
80401694:	06812d03          	lw	s10,104(sp)
80401698:	06c12d83          	lw	s11,108(sp)
8040169c:	07012e03          	lw	t3,112(sp)
804016a0:	07412e83          	lw	t4,116(sp)
804016a4:	07812f03          	lw	t5,120(sp)
804016a8:	07c12f83          	lw	t6,124(sp)
804016ac:	00812103          	lw	sp,8(sp)
804016b0:	10200073          	sret

804016b4 <forkrets>:
804016b4:	00050113          	mv	sp,a0
804016b8:	f4dff06f          	j	80401604 <__trapret>

804016bc <sret_test_ok>:
804016bc:	00100893          	li	a7,1
804016c0:	05300513          	li	a0,83
804016c4:	00000073          	ecall
804016c8:	05200513          	li	a0,82
804016cc:	00000073          	ecall
804016d0:	04500513          	li	a0,69
804016d4:	00000073          	ecall
804016d8:	05400513          	li	a0,84
804016dc:	00000073          	ecall
804016e0:	05f00513          	li	a0,95
804016e4:	00000073          	ecall
804016e8:	04f00513          	li	a0,79
804016ec:	00000073          	ecall
804016f0:	04b00513          	li	a0,75
804016f4:	00000073          	ecall
804016f8:	00a00513          	li	a0,10
804016fc:	00000073          	ecall
80401700:	0000006f          	j	80401700 <sret_test_ok+0x44>

80401704 <default_init>:
80401704:	0009b797          	auipc	a5,0x9b
80401708:	0f078793          	addi	a5,a5,240 # 8049c7f4 <free_area>
8040170c:	00f7a223          	sw	a5,4(a5)
80401710:	00f7a023          	sw	a5,0(a5)
80401714:	0007a423          	sw	zero,8(a5)
80401718:	00008067          	ret

8040171c <default_nr_free_pages>:
8040171c:	0009b797          	auipc	a5,0x9b
80401720:	0d878793          	addi	a5,a5,216 # 8049c7f4 <free_area>
80401724:	0087a503          	lw	a0,8(a5)
80401728:	00008067          	ret

8040172c <default_check>:
8040172c:	fd010113          	addi	sp,sp,-48
80401730:	03212023          	sw	s2,32(sp)
80401734:	0009b917          	auipc	s2,0x9b
80401738:	0c090913          	addi	s2,s2,192 # 8049c7f4 <free_area>
8040173c:	00492783          	lw	a5,4(s2)
80401740:	02112623          	sw	ra,44(sp)
80401744:	02812423          	sw	s0,40(sp)
80401748:	02912223          	sw	s1,36(sp)
8040174c:	01312e23          	sw	s3,28(sp)
80401750:	01412c23          	sw	s4,24(sp)
80401754:	01512a23          	sw	s5,20(sp)
80401758:	01612823          	sw	s6,16(sp)
8040175c:	01712623          	sw	s7,12(sp)
80401760:	01812423          	sw	s8,8(sp)
80401764:	3d278e63          	beq	a5,s2,80401b40 <default_check+0x414>
80401768:	ff87a703          	lw	a4,-8(a5)
8040176c:	00175713          	srli	a4,a4,0x1
80401770:	00177713          	andi	a4,a4,1
80401774:	3c070e63          	beqz	a4,80401b50 <default_check+0x424>
80401778:	00000413          	li	s0,0
8040177c:	00000493          	li	s1,0
80401780:	0100006f          	j	80401790 <default_check+0x64>
80401784:	ff87a703          	lw	a4,-8(a5)
80401788:	00277713          	andi	a4,a4,2
8040178c:	3c070263          	beqz	a4,80401b50 <default_check+0x424>
80401790:	ffc7a703          	lw	a4,-4(a5)
80401794:	0047a783          	lw	a5,4(a5)
80401798:	00148493          	addi	s1,s1,1
8040179c:	00e40433          	add	s0,s0,a4
804017a0:	00040993          	mv	s3,s0
804017a4:	ff2790e3          	bne	a5,s2,80401784 <default_check+0x58>
804017a8:	59c010ef          	jal	ra,80402d44 <nr_free_pages>
804017ac:	013512e3          	bne	a0,s3,80401fb0 <default_check+0x884>
804017b0:	00100513          	li	a0,1
804017b4:	45c010ef          	jal	ra,80402c10 <alloc_pages>
804017b8:	00050a13          	mv	s4,a0
804017bc:	52050a63          	beqz	a0,80401cf0 <default_check+0x5c4>
804017c0:	00100513          	li	a0,1
804017c4:	44c010ef          	jal	ra,80402c10 <alloc_pages>
804017c8:	00050993          	mv	s3,a0
804017cc:	000502e3          	beqz	a0,80401fd0 <default_check+0x8a4>
804017d0:	00100513          	li	a0,1
804017d4:	43c010ef          	jal	ra,80402c10 <alloc_pages>
804017d8:	00050a93          	mv	s5,a0
804017dc:	58050a63          	beqz	a0,80401d70 <default_check+0x644>
804017e0:	393a0863          	beq	s4,s3,80401b70 <default_check+0x444>
804017e4:	38aa0663          	beq	s4,a0,80401b70 <default_check+0x444>
804017e8:	38a98463          	beq	s3,a0,80401b70 <default_check+0x444>
804017ec:	000a2783          	lw	a5,0(s4)
804017f0:	3a079063          	bnez	a5,80401b90 <default_check+0x464>
804017f4:	0009a783          	lw	a5,0(s3)
804017f8:	38079c63          	bnez	a5,80401b90 <default_check+0x464>
804017fc:	00052783          	lw	a5,0(a0)
80401800:	38079863          	bnez	a5,80401b90 <default_check+0x464>
80401804:	0009b797          	auipc	a5,0x9b
80401808:	00878793          	addi	a5,a5,8 # 8049c80c <pages>
8040180c:	0007a783          	lw	a5,0(a5)
80401810:	00015717          	auipc	a4,0x15
80401814:	8a870713          	addi	a4,a4,-1880 # 804160b8 <nbase>
80401818:	00072603          	lw	a2,0(a4)
8040181c:	0009b717          	auipc	a4,0x9b
80401820:	f8070713          	addi	a4,a4,-128 # 8049c79c <npage>
80401824:	00072683          	lw	a3,0(a4)
80401828:	40fa0733          	sub	a4,s4,a5
8040182c:	40575713          	srai	a4,a4,0x5
80401830:	00c70733          	add	a4,a4,a2
80401834:	00c69693          	slli	a3,a3,0xc
80401838:	00c71713          	slli	a4,a4,0xc
8040183c:	36d77a63          	bgeu	a4,a3,80401bb0 <default_check+0x484>
80401840:	40f98733          	sub	a4,s3,a5
80401844:	40575713          	srai	a4,a4,0x5
80401848:	00c70733          	add	a4,a4,a2
8040184c:	00c71713          	slli	a4,a4,0xc
80401850:	5ad77063          	bgeu	a4,a3,80401df0 <default_check+0x6c4>
80401854:	40f507b3          	sub	a5,a0,a5
80401858:	4057d793          	srai	a5,a5,0x5
8040185c:	00c787b3          	add	a5,a5,a2
80401860:	00c79793          	slli	a5,a5,0xc
80401864:	3ed7f663          	bgeu	a5,a3,80401c50 <default_check+0x524>
80401868:	00100513          	li	a0,1
8040186c:	00092c03          	lw	s8,0(s2)
80401870:	00492b83          	lw	s7,4(s2)
80401874:	00892b03          	lw	s6,8(s2)
80401878:	0009b797          	auipc	a5,0x9b
8040187c:	f927a023          	sw	s2,-128(a5) # 8049c7f8 <free_area+0x4>
80401880:	0009b797          	auipc	a5,0x9b
80401884:	f727aa23          	sw	s2,-140(a5) # 8049c7f4 <free_area>
80401888:	0009b797          	auipc	a5,0x9b
8040188c:	f607aa23          	sw	zero,-140(a5) # 8049c7fc <free_area+0x8>
80401890:	380010ef          	jal	ra,80402c10 <alloc_pages>
80401894:	38051e63          	bnez	a0,80401c30 <default_check+0x504>
80401898:	00100593          	li	a1,1
8040189c:	000a0513          	mv	a0,s4
804018a0:	438010ef          	jal	ra,80402cd8 <free_pages>
804018a4:	00100593          	li	a1,1
804018a8:	00098513          	mv	a0,s3
804018ac:	42c010ef          	jal	ra,80402cd8 <free_pages>
804018b0:	00100593          	li	a1,1
804018b4:	000a8513          	mv	a0,s5
804018b8:	420010ef          	jal	ra,80402cd8 <free_pages>
804018bc:	00892703          	lw	a4,8(s2)
804018c0:	00300793          	li	a5,3
804018c4:	34f71663          	bne	a4,a5,80401c10 <default_check+0x4e4>
804018c8:	00100513          	li	a0,1
804018cc:	344010ef          	jal	ra,80402c10 <alloc_pages>
804018d0:	00050993          	mv	s3,a0
804018d4:	30050e63          	beqz	a0,80401bf0 <default_check+0x4c4>
804018d8:	00100513          	li	a0,1
804018dc:	334010ef          	jal	ra,80402c10 <alloc_pages>
804018e0:	00050a93          	mv	s5,a0
804018e4:	46050663          	beqz	a0,80401d50 <default_check+0x624>
804018e8:	00100513          	li	a0,1
804018ec:	324010ef          	jal	ra,80402c10 <alloc_pages>
804018f0:	00050a13          	mv	s4,a0
804018f4:	42050e63          	beqz	a0,80401d30 <default_check+0x604>
804018f8:	00100513          	li	a0,1
804018fc:	314010ef          	jal	ra,80402c10 <alloc_pages>
80401900:	40051863          	bnez	a0,80401d10 <default_check+0x5e4>
80401904:	00100593          	li	a1,1
80401908:	00098513          	mv	a0,s3
8040190c:	3cc010ef          	jal	ra,80402cd8 <free_pages>
80401910:	00492783          	lw	a5,4(s2)
80401914:	2b278e63          	beq	a5,s2,80401bd0 <default_check+0x4a4>
80401918:	00100513          	li	a0,1
8040191c:	2f4010ef          	jal	ra,80402c10 <alloc_pages>
80401920:	3aa99863          	bne	s3,a0,80401cd0 <default_check+0x5a4>
80401924:	00100513          	li	a0,1
80401928:	2e8010ef          	jal	ra,80402c10 <alloc_pages>
8040192c:	38051263          	bnez	a0,80401cb0 <default_check+0x584>
80401930:	00892783          	lw	a5,8(s2)
80401934:	34079e63          	bnez	a5,80401c90 <default_check+0x564>
80401938:	00098513          	mv	a0,s3
8040193c:	00100593          	li	a1,1
80401940:	0009b797          	auipc	a5,0x9b
80401944:	eb87aa23          	sw	s8,-332(a5) # 8049c7f4 <free_area>
80401948:	0009b797          	auipc	a5,0x9b
8040194c:	eb77a823          	sw	s7,-336(a5) # 8049c7f8 <free_area+0x4>
80401950:	0009b797          	auipc	a5,0x9b
80401954:	eb67a623          	sw	s6,-340(a5) # 8049c7fc <free_area+0x8>
80401958:	380010ef          	jal	ra,80402cd8 <free_pages>
8040195c:	00100593          	li	a1,1
80401960:	000a8513          	mv	a0,s5
80401964:	374010ef          	jal	ra,80402cd8 <free_pages>
80401968:	00100593          	li	a1,1
8040196c:	000a0513          	mv	a0,s4
80401970:	368010ef          	jal	ra,80402cd8 <free_pages>
80401974:	00500513          	li	a0,5
80401978:	298010ef          	jal	ra,80402c10 <alloc_pages>
8040197c:	00050993          	mv	s3,a0
80401980:	2e050863          	beqz	a0,80401c70 <default_check+0x544>
80401984:	00452783          	lw	a5,4(a0)
80401988:	0017d793          	srli	a5,a5,0x1
8040198c:	0017f793          	andi	a5,a5,1
80401990:	5c079063          	bnez	a5,80401f50 <default_check+0x824>
80401994:	00100513          	li	a0,1
80401998:	00092b03          	lw	s6,0(s2)
8040199c:	00492a83          	lw	s5,4(s2)
804019a0:	0009b797          	auipc	a5,0x9b
804019a4:	e527aa23          	sw	s2,-428(a5) # 8049c7f4 <free_area>
804019a8:	0009b797          	auipc	a5,0x9b
804019ac:	e527a823          	sw	s2,-432(a5) # 8049c7f8 <free_area+0x4>
804019b0:	260010ef          	jal	ra,80402c10 <alloc_pages>
804019b4:	56051e63          	bnez	a0,80401f30 <default_check+0x804>
804019b8:	04098a13          	addi	s4,s3,64
804019bc:	000a0513          	mv	a0,s4
804019c0:	00300593          	li	a1,3
804019c4:	00892b83          	lw	s7,8(s2)
804019c8:	0009b797          	auipc	a5,0x9b
804019cc:	e207aa23          	sw	zero,-460(a5) # 8049c7fc <free_area+0x8>
804019d0:	308010ef          	jal	ra,80402cd8 <free_pages>
804019d4:	00400513          	li	a0,4
804019d8:	238010ef          	jal	ra,80402c10 <alloc_pages>
804019dc:	52051a63          	bnez	a0,80401f10 <default_check+0x7e4>
804019e0:	0449a783          	lw	a5,68(s3)
804019e4:	0017d793          	srli	a5,a5,0x1
804019e8:	0017f793          	andi	a5,a5,1
804019ec:	50078263          	beqz	a5,80401ef0 <default_check+0x7c4>
804019f0:	0489a703          	lw	a4,72(s3)
804019f4:	00300793          	li	a5,3
804019f8:	4ef71c63          	bne	a4,a5,80401ef0 <default_check+0x7c4>
804019fc:	00300513          	li	a0,3
80401a00:	210010ef          	jal	ra,80402c10 <alloc_pages>
80401a04:	00050c13          	mv	s8,a0
80401a08:	4c050463          	beqz	a0,80401ed0 <default_check+0x7a4>
80401a0c:	00100513          	li	a0,1
80401a10:	200010ef          	jal	ra,80402c10 <alloc_pages>
80401a14:	48051e63          	bnez	a0,80401eb0 <default_check+0x784>
80401a18:	478a1c63          	bne	s4,s8,80401e90 <default_check+0x764>
80401a1c:	00100593          	li	a1,1
80401a20:	00098513          	mv	a0,s3
80401a24:	2b4010ef          	jal	ra,80402cd8 <free_pages>
80401a28:	00300593          	li	a1,3
80401a2c:	000a0513          	mv	a0,s4
80401a30:	2a8010ef          	jal	ra,80402cd8 <free_pages>
80401a34:	0049a783          	lw	a5,4(s3)
80401a38:	02098c13          	addi	s8,s3,32
80401a3c:	0017d793          	srli	a5,a5,0x1
80401a40:	0017f793          	andi	a5,a5,1
80401a44:	42078663          	beqz	a5,80401e70 <default_check+0x744>
80401a48:	0089a703          	lw	a4,8(s3)
80401a4c:	00100793          	li	a5,1
80401a50:	42f71063          	bne	a4,a5,80401e70 <default_check+0x744>
80401a54:	004a2783          	lw	a5,4(s4)
80401a58:	0017d793          	srli	a5,a5,0x1
80401a5c:	0017f793          	andi	a5,a5,1
80401a60:	3e078863          	beqz	a5,80401e50 <default_check+0x724>
80401a64:	008a2703          	lw	a4,8(s4)
80401a68:	00300793          	li	a5,3
80401a6c:	3ef71263          	bne	a4,a5,80401e50 <default_check+0x724>
80401a70:	00100513          	li	a0,1
80401a74:	19c010ef          	jal	ra,80402c10 <alloc_pages>
80401a78:	3aa99c63          	bne	s3,a0,80401e30 <default_check+0x704>
80401a7c:	00100593          	li	a1,1
80401a80:	258010ef          	jal	ra,80402cd8 <free_pages>
80401a84:	00200513          	li	a0,2
80401a88:	188010ef          	jal	ra,80402c10 <alloc_pages>
80401a8c:	38aa1263          	bne	s4,a0,80401e10 <default_check+0x6e4>
80401a90:	00200593          	li	a1,2
80401a94:	244010ef          	jal	ra,80402cd8 <free_pages>
80401a98:	00100593          	li	a1,1
80401a9c:	000c0513          	mv	a0,s8
80401aa0:	238010ef          	jal	ra,80402cd8 <free_pages>
80401aa4:	00500513          	li	a0,5
80401aa8:	168010ef          	jal	ra,80402c10 <alloc_pages>
80401aac:	00050993          	mv	s3,a0
80401ab0:	4c050063          	beqz	a0,80401f70 <default_check+0x844>
80401ab4:	00100513          	li	a0,1
80401ab8:	158010ef          	jal	ra,80402c10 <alloc_pages>
80401abc:	30051a63          	bnez	a0,80401dd0 <default_check+0x6a4>
80401ac0:	00892783          	lw	a5,8(s2)
80401ac4:	2e079663          	bnez	a5,80401db0 <default_check+0x684>
80401ac8:	00500593          	li	a1,5
80401acc:	00098513          	mv	a0,s3
80401ad0:	0009b797          	auipc	a5,0x9b
80401ad4:	d377a623          	sw	s7,-724(a5) # 8049c7fc <free_area+0x8>
80401ad8:	0009b797          	auipc	a5,0x9b
80401adc:	d167ae23          	sw	s6,-740(a5) # 8049c7f4 <free_area>
80401ae0:	0009b797          	auipc	a5,0x9b
80401ae4:	d157ac23          	sw	s5,-744(a5) # 8049c7f8 <free_area+0x4>
80401ae8:	1f0010ef          	jal	ra,80402cd8 <free_pages>
80401aec:	00492783          	lw	a5,4(s2)
80401af0:	01278c63          	beq	a5,s2,80401b08 <default_check+0x3dc>
80401af4:	ffc7a703          	lw	a4,-4(a5)
80401af8:	0047a783          	lw	a5,4(a5)
80401afc:	fff48493          	addi	s1,s1,-1
80401b00:	40e40433          	sub	s0,s0,a4
80401b04:	ff2798e3          	bne	a5,s2,80401af4 <default_check+0x3c8>
80401b08:	28049463          	bnez	s1,80401d90 <default_check+0x664>
80401b0c:	48041263          	bnez	s0,80401f90 <default_check+0x864>
80401b10:	02c12083          	lw	ra,44(sp)
80401b14:	02812403          	lw	s0,40(sp)
80401b18:	02412483          	lw	s1,36(sp)
80401b1c:	02012903          	lw	s2,32(sp)
80401b20:	01c12983          	lw	s3,28(sp)
80401b24:	01812a03          	lw	s4,24(sp)
80401b28:	01412a83          	lw	s5,20(sp)
80401b2c:	01012b03          	lw	s6,16(sp)
80401b30:	00c12b83          	lw	s7,12(sp)
80401b34:	00812c03          	lw	s8,8(sp)
80401b38:	03010113          	addi	sp,sp,48
80401b3c:	00008067          	ret
80401b40:	00000993          	li	s3,0
80401b44:	00000413          	li	s0,0
80401b48:	00000493          	li	s1,0
80401b4c:	c5dff06f          	j	804017a8 <default_check+0x7c>
80401b50:	00011697          	auipc	a3,0x11
80401b54:	70868693          	addi	a3,a3,1800 # 80413258 <commands+0x7a8>
80401b58:	00011617          	auipc	a2,0x11
80401b5c:	11460613          	addi	a2,a2,276 # 80412c6c <commands+0x1bc>
80401b60:	0f000593          	li	a1,240
80401b64:	00011517          	auipc	a0,0x11
80401b68:	70450513          	addi	a0,a0,1796 # 80413268 <commands+0x7b8>
80401b6c:	ab9fe0ef          	jal	ra,80400624 <__panic>
80401b70:	00011697          	auipc	a3,0x11
80401b74:	78068693          	addi	a3,a3,1920 # 804132f0 <commands+0x840>
80401b78:	00011617          	auipc	a2,0x11
80401b7c:	0f460613          	addi	a2,a2,244 # 80412c6c <commands+0x1bc>
80401b80:	0bd00593          	li	a1,189
80401b84:	00011517          	auipc	a0,0x11
80401b88:	6e450513          	addi	a0,a0,1764 # 80413268 <commands+0x7b8>
80401b8c:	a99fe0ef          	jal	ra,80400624 <__panic>
80401b90:	00011697          	auipc	a3,0x11
80401b94:	78468693          	addi	a3,a3,1924 # 80413314 <commands+0x864>
80401b98:	00011617          	auipc	a2,0x11
80401b9c:	0d460613          	addi	a2,a2,212 # 80412c6c <commands+0x1bc>
80401ba0:	0be00593          	li	a1,190
80401ba4:	00011517          	auipc	a0,0x11
80401ba8:	6c450513          	addi	a0,a0,1732 # 80413268 <commands+0x7b8>
80401bac:	a79fe0ef          	jal	ra,80400624 <__panic>
80401bb0:	00011697          	auipc	a3,0x11
80401bb4:	7a068693          	addi	a3,a3,1952 # 80413350 <commands+0x8a0>
80401bb8:	00011617          	auipc	a2,0x11
80401bbc:	0b460613          	addi	a2,a2,180 # 80412c6c <commands+0x1bc>
80401bc0:	0c000593          	li	a1,192
80401bc4:	00011517          	auipc	a0,0x11
80401bc8:	6a450513          	addi	a0,a0,1700 # 80413268 <commands+0x7b8>
80401bcc:	a59fe0ef          	jal	ra,80400624 <__panic>
80401bd0:	00012697          	auipc	a3,0x12
80401bd4:	80868693          	addi	a3,a3,-2040 # 804133d8 <commands+0x928>
80401bd8:	00011617          	auipc	a2,0x11
80401bdc:	09460613          	addi	a2,a2,148 # 80412c6c <commands+0x1bc>
80401be0:	0d900593          	li	a1,217
80401be4:	00011517          	auipc	a0,0x11
80401be8:	68450513          	addi	a0,a0,1668 # 80413268 <commands+0x7b8>
80401bec:	a39fe0ef          	jal	ra,80400624 <__panic>
80401bf0:	00011697          	auipc	a3,0x11
80401bf4:	6ac68693          	addi	a3,a3,1708 # 8041329c <commands+0x7ec>
80401bf8:	00011617          	auipc	a2,0x11
80401bfc:	07460613          	addi	a2,a2,116 # 80412c6c <commands+0x1bc>
80401c00:	0d200593          	li	a1,210
80401c04:	00011517          	auipc	a0,0x11
80401c08:	66450513          	addi	a0,a0,1636 # 80413268 <commands+0x7b8>
80401c0c:	a19fe0ef          	jal	ra,80400624 <__panic>
80401c10:	00011697          	auipc	a3,0x11
80401c14:	7b868693          	addi	a3,a3,1976 # 804133c8 <commands+0x918>
80401c18:	00011617          	auipc	a2,0x11
80401c1c:	05460613          	addi	a2,a2,84 # 80412c6c <commands+0x1bc>
80401c20:	0d000593          	li	a1,208
80401c24:	00011517          	auipc	a0,0x11
80401c28:	64450513          	addi	a0,a0,1604 # 80413268 <commands+0x7b8>
80401c2c:	9f9fe0ef          	jal	ra,80400624 <__panic>
80401c30:	00011697          	auipc	a3,0x11
80401c34:	78068693          	addi	a3,a3,1920 # 804133b0 <commands+0x900>
80401c38:	00011617          	auipc	a2,0x11
80401c3c:	03460613          	addi	a2,a2,52 # 80412c6c <commands+0x1bc>
80401c40:	0cb00593          	li	a1,203
80401c44:	00011517          	auipc	a0,0x11
80401c48:	62450513          	addi	a0,a0,1572 # 80413268 <commands+0x7b8>
80401c4c:	9d9fe0ef          	jal	ra,80400624 <__panic>
80401c50:	00011697          	auipc	a3,0x11
80401c54:	74068693          	addi	a3,a3,1856 # 80413390 <commands+0x8e0>
80401c58:	00011617          	auipc	a2,0x11
80401c5c:	01460613          	addi	a2,a2,20 # 80412c6c <commands+0x1bc>
80401c60:	0c200593          	li	a1,194
80401c64:	00011517          	auipc	a0,0x11
80401c68:	60450513          	addi	a0,a0,1540 # 80413268 <commands+0x7b8>
80401c6c:	9b9fe0ef          	jal	ra,80400624 <__panic>
80401c70:	00011697          	auipc	a3,0x11
80401c74:	7ac68693          	addi	a3,a3,1964 # 8041341c <commands+0x96c>
80401c78:	00011617          	auipc	a2,0x11
80401c7c:	ff460613          	addi	a2,a2,-12 # 80412c6c <commands+0x1bc>
80401c80:	0f800593          	li	a1,248
80401c84:	00011517          	auipc	a0,0x11
80401c88:	5e450513          	addi	a0,a0,1508 # 80413268 <commands+0x7b8>
80401c8c:	999fe0ef          	jal	ra,80400624 <__panic>
80401c90:	00011697          	auipc	a3,0x11
80401c94:	77c68693          	addi	a3,a3,1916 # 8041340c <commands+0x95c>
80401c98:	00011617          	auipc	a2,0x11
80401c9c:	fd460613          	addi	a2,a2,-44 # 80412c6c <commands+0x1bc>
80401ca0:	0df00593          	li	a1,223
80401ca4:	00011517          	auipc	a0,0x11
80401ca8:	5c450513          	addi	a0,a0,1476 # 80413268 <commands+0x7b8>
80401cac:	979fe0ef          	jal	ra,80400624 <__panic>
80401cb0:	00011697          	auipc	a3,0x11
80401cb4:	70068693          	addi	a3,a3,1792 # 804133b0 <commands+0x900>
80401cb8:	00011617          	auipc	a2,0x11
80401cbc:	fb460613          	addi	a2,a2,-76 # 80412c6c <commands+0x1bc>
80401cc0:	0dd00593          	li	a1,221
80401cc4:	00011517          	auipc	a0,0x11
80401cc8:	5a450513          	addi	a0,a0,1444 # 80413268 <commands+0x7b8>
80401ccc:	959fe0ef          	jal	ra,80400624 <__panic>
80401cd0:	00011697          	auipc	a3,0x11
80401cd4:	72068693          	addi	a3,a3,1824 # 804133f0 <commands+0x940>
80401cd8:	00011617          	auipc	a2,0x11
80401cdc:	f9460613          	addi	a2,a2,-108 # 80412c6c <commands+0x1bc>
80401ce0:	0dc00593          	li	a1,220
80401ce4:	00011517          	auipc	a0,0x11
80401ce8:	58450513          	addi	a0,a0,1412 # 80413268 <commands+0x7b8>
80401cec:	939fe0ef          	jal	ra,80400624 <__panic>
80401cf0:	00011697          	auipc	a3,0x11
80401cf4:	5ac68693          	addi	a3,a3,1452 # 8041329c <commands+0x7ec>
80401cf8:	00011617          	auipc	a2,0x11
80401cfc:	f7460613          	addi	a2,a2,-140 # 80412c6c <commands+0x1bc>
80401d00:	0b900593          	li	a1,185
80401d04:	00011517          	auipc	a0,0x11
80401d08:	56450513          	addi	a0,a0,1380 # 80413268 <commands+0x7b8>
80401d0c:	919fe0ef          	jal	ra,80400624 <__panic>
80401d10:	00011697          	auipc	a3,0x11
80401d14:	6a068693          	addi	a3,a3,1696 # 804133b0 <commands+0x900>
80401d18:	00011617          	auipc	a2,0x11
80401d1c:	f5460613          	addi	a2,a2,-172 # 80412c6c <commands+0x1bc>
80401d20:	0d600593          	li	a1,214
80401d24:	00011517          	auipc	a0,0x11
80401d28:	54450513          	addi	a0,a0,1348 # 80413268 <commands+0x7b8>
80401d2c:	8f9fe0ef          	jal	ra,80400624 <__panic>
80401d30:	00011697          	auipc	a3,0x11
80401d34:	5a468693          	addi	a3,a3,1444 # 804132d4 <commands+0x824>
80401d38:	00011617          	auipc	a2,0x11
80401d3c:	f3460613          	addi	a2,a2,-204 # 80412c6c <commands+0x1bc>
80401d40:	0d400593          	li	a1,212
80401d44:	00011517          	auipc	a0,0x11
80401d48:	52450513          	addi	a0,a0,1316 # 80413268 <commands+0x7b8>
80401d4c:	8d9fe0ef          	jal	ra,80400624 <__panic>
80401d50:	00011697          	auipc	a3,0x11
80401d54:	56868693          	addi	a3,a3,1384 # 804132b8 <commands+0x808>
80401d58:	00011617          	auipc	a2,0x11
80401d5c:	f1460613          	addi	a2,a2,-236 # 80412c6c <commands+0x1bc>
80401d60:	0d300593          	li	a1,211
80401d64:	00011517          	auipc	a0,0x11
80401d68:	50450513          	addi	a0,a0,1284 # 80413268 <commands+0x7b8>
80401d6c:	8b9fe0ef          	jal	ra,80400624 <__panic>
80401d70:	00011697          	auipc	a3,0x11
80401d74:	56468693          	addi	a3,a3,1380 # 804132d4 <commands+0x824>
80401d78:	00011617          	auipc	a2,0x11
80401d7c:	ef460613          	addi	a2,a2,-268 # 80412c6c <commands+0x1bc>
80401d80:	0bb00593          	li	a1,187
80401d84:	00011517          	auipc	a0,0x11
80401d88:	4e450513          	addi	a0,a0,1252 # 80413268 <commands+0x7b8>
80401d8c:	899fe0ef          	jal	ra,80400624 <__panic>
80401d90:	00011697          	auipc	a3,0x11
80401d94:	7d068693          	addi	a3,a3,2000 # 80413560 <commands+0xab0>
80401d98:	00011617          	auipc	a2,0x11
80401d9c:	ed460613          	addi	a2,a2,-300 # 80412c6c <commands+0x1bc>
80401da0:	12500593          	li	a1,293
80401da4:	00011517          	auipc	a0,0x11
80401da8:	4c450513          	addi	a0,a0,1220 # 80413268 <commands+0x7b8>
80401dac:	879fe0ef          	jal	ra,80400624 <__panic>
80401db0:	00011697          	auipc	a3,0x11
80401db4:	65c68693          	addi	a3,a3,1628 # 8041340c <commands+0x95c>
80401db8:	00011617          	auipc	a2,0x11
80401dbc:	eb460613          	addi	a2,a2,-332 # 80412c6c <commands+0x1bc>
80401dc0:	11a00593          	li	a1,282
80401dc4:	00011517          	auipc	a0,0x11
80401dc8:	4a450513          	addi	a0,a0,1188 # 80413268 <commands+0x7b8>
80401dcc:	859fe0ef          	jal	ra,80400624 <__panic>
80401dd0:	00011697          	auipc	a3,0x11
80401dd4:	5e068693          	addi	a3,a3,1504 # 804133b0 <commands+0x900>
80401dd8:	00011617          	auipc	a2,0x11
80401ddc:	e9460613          	addi	a2,a2,-364 # 80412c6c <commands+0x1bc>
80401de0:	11800593          	li	a1,280
80401de4:	00011517          	auipc	a0,0x11
80401de8:	48450513          	addi	a0,a0,1156 # 80413268 <commands+0x7b8>
80401dec:	839fe0ef          	jal	ra,80400624 <__panic>
80401df0:	00011697          	auipc	a3,0x11
80401df4:	58068693          	addi	a3,a3,1408 # 80413370 <commands+0x8c0>
80401df8:	00011617          	auipc	a2,0x11
80401dfc:	e7460613          	addi	a2,a2,-396 # 80412c6c <commands+0x1bc>
80401e00:	0c100593          	li	a1,193
80401e04:	00011517          	auipc	a0,0x11
80401e08:	46450513          	addi	a0,a0,1124 # 80413268 <commands+0x7b8>
80401e0c:	819fe0ef          	jal	ra,80400624 <__panic>
80401e10:	00011697          	auipc	a3,0x11
80401e14:	71068693          	addi	a3,a3,1808 # 80413520 <commands+0xa70>
80401e18:	00011617          	auipc	a2,0x11
80401e1c:	e5460613          	addi	a2,a2,-428 # 80412c6c <commands+0x1bc>
80401e20:	11200593          	li	a1,274
80401e24:	00011517          	auipc	a0,0x11
80401e28:	44450513          	addi	a0,a0,1092 # 80413268 <commands+0x7b8>
80401e2c:	ff8fe0ef          	jal	ra,80400624 <__panic>
80401e30:	00011697          	auipc	a3,0x11
80401e34:	6d068693          	addi	a3,a3,1744 # 80413500 <commands+0xa50>
80401e38:	00011617          	auipc	a2,0x11
80401e3c:	e3460613          	addi	a2,a2,-460 # 80412c6c <commands+0x1bc>
80401e40:	11000593          	li	a1,272
80401e44:	00011517          	auipc	a0,0x11
80401e48:	42450513          	addi	a0,a0,1060 # 80413268 <commands+0x7b8>
80401e4c:	fd8fe0ef          	jal	ra,80400624 <__panic>
80401e50:	00011697          	auipc	a3,0x11
80401e54:	68868693          	addi	a3,a3,1672 # 804134d8 <commands+0xa28>
80401e58:	00011617          	auipc	a2,0x11
80401e5c:	e1460613          	addi	a2,a2,-492 # 80412c6c <commands+0x1bc>
80401e60:	10e00593          	li	a1,270
80401e64:	00011517          	auipc	a0,0x11
80401e68:	40450513          	addi	a0,a0,1028 # 80413268 <commands+0x7b8>
80401e6c:	fb8fe0ef          	jal	ra,80400624 <__panic>
80401e70:	00011697          	auipc	a3,0x11
80401e74:	64068693          	addi	a3,a3,1600 # 804134b0 <commands+0xa00>
80401e78:	00011617          	auipc	a2,0x11
80401e7c:	df460613          	addi	a2,a2,-524 # 80412c6c <commands+0x1bc>
80401e80:	10d00593          	li	a1,269
80401e84:	00011517          	auipc	a0,0x11
80401e88:	3e450513          	addi	a0,a0,996 # 80413268 <commands+0x7b8>
80401e8c:	f98fe0ef          	jal	ra,80400624 <__panic>
80401e90:	00011697          	auipc	a3,0x11
80401e94:	61068693          	addi	a3,a3,1552 # 804134a0 <commands+0x9f0>
80401e98:	00011617          	auipc	a2,0x11
80401e9c:	dd460613          	addi	a2,a2,-556 # 80412c6c <commands+0x1bc>
80401ea0:	10800593          	li	a1,264
80401ea4:	00011517          	auipc	a0,0x11
80401ea8:	3c450513          	addi	a0,a0,964 # 80413268 <commands+0x7b8>
80401eac:	f78fe0ef          	jal	ra,80400624 <__panic>
80401eb0:	00011697          	auipc	a3,0x11
80401eb4:	50068693          	addi	a3,a3,1280 # 804133b0 <commands+0x900>
80401eb8:	00011617          	auipc	a2,0x11
80401ebc:	db460613          	addi	a2,a2,-588 # 80412c6c <commands+0x1bc>
80401ec0:	10700593          	li	a1,263
80401ec4:	00011517          	auipc	a0,0x11
80401ec8:	3a450513          	addi	a0,a0,932 # 80413268 <commands+0x7b8>
80401ecc:	f58fe0ef          	jal	ra,80400624 <__panic>
80401ed0:	00011697          	auipc	a3,0x11
80401ed4:	5b068693          	addi	a3,a3,1456 # 80413480 <commands+0x9d0>
80401ed8:	00011617          	auipc	a2,0x11
80401edc:	d9460613          	addi	a2,a2,-620 # 80412c6c <commands+0x1bc>
80401ee0:	10600593          	li	a1,262
80401ee4:	00011517          	auipc	a0,0x11
80401ee8:	38450513          	addi	a0,a0,900 # 80413268 <commands+0x7b8>
80401eec:	f38fe0ef          	jal	ra,80400624 <__panic>
80401ef0:	00011697          	auipc	a3,0x11
80401ef4:	56468693          	addi	a3,a3,1380 # 80413454 <commands+0x9a4>
80401ef8:	00011617          	auipc	a2,0x11
80401efc:	d7460613          	addi	a2,a2,-652 # 80412c6c <commands+0x1bc>
80401f00:	10500593          	li	a1,261
80401f04:	00011517          	auipc	a0,0x11
80401f08:	36450513          	addi	a0,a0,868 # 80413268 <commands+0x7b8>
80401f0c:	f18fe0ef          	jal	ra,80400624 <__panic>
80401f10:	00011697          	auipc	a3,0x11
80401f14:	52c68693          	addi	a3,a3,1324 # 8041343c <commands+0x98c>
80401f18:	00011617          	auipc	a2,0x11
80401f1c:	d5460613          	addi	a2,a2,-684 # 80412c6c <commands+0x1bc>
80401f20:	10400593          	li	a1,260
80401f24:	00011517          	auipc	a0,0x11
80401f28:	34450513          	addi	a0,a0,836 # 80413268 <commands+0x7b8>
80401f2c:	ef8fe0ef          	jal	ra,80400624 <__panic>
80401f30:	00011697          	auipc	a3,0x11
80401f34:	48068693          	addi	a3,a3,1152 # 804133b0 <commands+0x900>
80401f38:	00011617          	auipc	a2,0x11
80401f3c:	d3460613          	addi	a2,a2,-716 # 80412c6c <commands+0x1bc>
80401f40:	0fe00593          	li	a1,254
80401f44:	00011517          	auipc	a0,0x11
80401f48:	32450513          	addi	a0,a0,804 # 80413268 <commands+0x7b8>
80401f4c:	ed8fe0ef          	jal	ra,80400624 <__panic>
80401f50:	00011697          	auipc	a3,0x11
80401f54:	4d868693          	addi	a3,a3,1240 # 80413428 <commands+0x978>
80401f58:	00011617          	auipc	a2,0x11
80401f5c:	d1460613          	addi	a2,a2,-748 # 80412c6c <commands+0x1bc>
80401f60:	0f900593          	li	a1,249
80401f64:	00011517          	auipc	a0,0x11
80401f68:	30450513          	addi	a0,a0,772 # 80413268 <commands+0x7b8>
80401f6c:	eb8fe0ef          	jal	ra,80400624 <__panic>
80401f70:	00011697          	auipc	a3,0x11
80401f74:	5d068693          	addi	a3,a3,1488 # 80413540 <commands+0xa90>
80401f78:	00011617          	auipc	a2,0x11
80401f7c:	cf460613          	addi	a2,a2,-780 # 80412c6c <commands+0x1bc>
80401f80:	11700593          	li	a1,279
80401f84:	00011517          	auipc	a0,0x11
80401f88:	2e450513          	addi	a0,a0,740 # 80413268 <commands+0x7b8>
80401f8c:	e98fe0ef          	jal	ra,80400624 <__panic>
80401f90:	00011697          	auipc	a3,0x11
80401f94:	5dc68693          	addi	a3,a3,1500 # 8041356c <commands+0xabc>
80401f98:	00011617          	auipc	a2,0x11
80401f9c:	cd460613          	addi	a2,a2,-812 # 80412c6c <commands+0x1bc>
80401fa0:	12600593          	li	a1,294
80401fa4:	00011517          	auipc	a0,0x11
80401fa8:	2c450513          	addi	a0,a0,708 # 80413268 <commands+0x7b8>
80401fac:	e78fe0ef          	jal	ra,80400624 <__panic>
80401fb0:	00011697          	auipc	a3,0x11
80401fb4:	2d068693          	addi	a3,a3,720 # 80413280 <commands+0x7d0>
80401fb8:	00011617          	auipc	a2,0x11
80401fbc:	cb460613          	addi	a2,a2,-844 # 80412c6c <commands+0x1bc>
80401fc0:	0f300593          	li	a1,243
80401fc4:	00011517          	auipc	a0,0x11
80401fc8:	2a450513          	addi	a0,a0,676 # 80413268 <commands+0x7b8>
80401fcc:	e58fe0ef          	jal	ra,80400624 <__panic>
80401fd0:	00011697          	auipc	a3,0x11
80401fd4:	2e868693          	addi	a3,a3,744 # 804132b8 <commands+0x808>
80401fd8:	00011617          	auipc	a2,0x11
80401fdc:	c9460613          	addi	a2,a2,-876 # 80412c6c <commands+0x1bc>
80401fe0:	0ba00593          	li	a1,186
80401fe4:	00011517          	auipc	a0,0x11
80401fe8:	28450513          	addi	a0,a0,644 # 80413268 <commands+0x7b8>
80401fec:	e38fe0ef          	jal	ra,80400624 <__panic>

80401ff0 <default_free_pages>:
80401ff0:	ff010113          	addi	sp,sp,-16
80401ff4:	00112623          	sw	ra,12(sp)
80401ff8:	1e058863          	beqz	a1,804021e8 <default_free_pages+0x1f8>
80401ffc:	00559693          	slli	a3,a1,0x5
80402000:	00d506b3          	add	a3,a0,a3
80402004:	04d50863          	beq	a0,a3,80402054 <default_free_pages+0x64>
80402008:	00452783          	lw	a5,4(a0)
8040200c:	0017f793          	andi	a5,a5,1
80402010:	1a079c63          	bnez	a5,804021c8 <default_free_pages+0x1d8>
80402014:	00452783          	lw	a5,4(a0)
80402018:	0017d793          	srli	a5,a5,0x1
8040201c:	0017f793          	andi	a5,a5,1
80402020:	1a079463          	bnez	a5,804021c8 <default_free_pages+0x1d8>
80402024:	00050793          	mv	a5,a0
80402028:	01c0006f          	j	80402044 <default_free_pages+0x54>
8040202c:	0047a703          	lw	a4,4(a5)
80402030:	00177713          	andi	a4,a4,1
80402034:	18071a63          	bnez	a4,804021c8 <default_free_pages+0x1d8>
80402038:	0047a703          	lw	a4,4(a5)
8040203c:	00277713          	andi	a4,a4,2
80402040:	18071463          	bnez	a4,804021c8 <default_free_pages+0x1d8>
80402044:	0007a223          	sw	zero,4(a5)
80402048:	0007a023          	sw	zero,0(a5)
8040204c:	02078793          	addi	a5,a5,32
80402050:	fcd79ee3          	bne	a5,a3,8040202c <default_free_pages+0x3c>
80402054:	00452703          	lw	a4,4(a0)
80402058:	0009a697          	auipc	a3,0x9a
8040205c:	79c68693          	addi	a3,a3,1948 # 8049c7f4 <free_area>
80402060:	0046a783          	lw	a5,4(a3)
80402064:	00276713          	ori	a4,a4,2
80402068:	00e52223          	sw	a4,4(a0)
8040206c:	0086a703          	lw	a4,8(a3)
80402070:	00b52423          	sw	a1,8(a0)
80402074:	00b70733          	add	a4,a4,a1
80402078:	0009a617          	auipc	a2,0x9a
8040207c:	78e62223          	sw	a4,1924(a2) # 8049c7fc <free_area+0x8>
80402080:	0ed78a63          	beq	a5,a3,80402174 <default_free_pages+0x184>
80402084:	ff478713          	addi	a4,a5,-12
80402088:	0006a803          	lw	a6,0(a3)
8040208c:	00000893          	li	a7,0
80402090:	00c50613          	addi	a2,a0,12
80402094:	00e56c63          	bltu	a0,a4,804020ac <default_free_pages+0xbc>
80402098:	0047a703          	lw	a4,4(a5)
8040209c:	06d70663          	beq	a4,a3,80402108 <default_free_pages+0x118>
804020a0:	00070793          	mv	a5,a4
804020a4:	ff478713          	addi	a4,a5,-12
804020a8:	fee578e3          	bgeu	a0,a4,80402098 <default_free_pages+0xa8>
804020ac:	00088663          	beqz	a7,804020b8 <default_free_pages+0xc8>
804020b0:	0009a897          	auipc	a7,0x9a
804020b4:	7508a223          	sw	a6,1860(a7) # 8049c7f4 <free_area>
804020b8:	0007a803          	lw	a6,0(a5)
804020bc:	00c7a023          	sw	a2,0(a5)
804020c0:	00c82223          	sw	a2,4(a6)
804020c4:	00f52823          	sw	a5,16(a0)
804020c8:	01052623          	sw	a6,12(a0)
804020cc:	08d80663          	beq	a6,a3,80402158 <default_free_pages+0x168>
804020d0:	ffc82883          	lw	a7,-4(a6)
804020d4:	ff480613          	addi	a2,a6,-12
804020d8:	00589713          	slli	a4,a7,0x5
804020dc:	00e60733          	add	a4,a2,a4
804020e0:	06e51863          	bne	a0,a4,80402150 <default_free_pages+0x160>
804020e4:	011585b3          	add	a1,a1,a7
804020e8:	feb82e23          	sw	a1,-4(a6)
804020ec:	00452703          	lw	a4,4(a0)
804020f0:	ffd77713          	andi	a4,a4,-3
804020f4:	00e52223          	sw	a4,4(a0)
804020f8:	00f82223          	sw	a5,4(a6)
804020fc:	0107a023          	sw	a6,0(a5)
80402100:	00060513          	mv	a0,a2
80402104:	04c0006f          	j	80402150 <default_free_pages+0x160>
80402108:	00c7a223          	sw	a2,4(a5)
8040210c:	00d52823          	sw	a3,16(a0)
80402110:	0047a703          	lw	a4,4(a5)
80402114:	00f52623          	sw	a5,12(a0)
80402118:	00060813          	mv	a6,a2
8040211c:	00d70863          	beq	a4,a3,8040212c <default_free_pages+0x13c>
80402120:	00100893          	li	a7,1
80402124:	00070793          	mv	a5,a4
80402128:	f7dff06f          	j	804020a4 <default_free_pages+0xb4>
8040212c:	00078813          	mv	a6,a5
80402130:	00c6a023          	sw	a2,0(a3)
80402134:	00068793          	mv	a5,a3
80402138:	00d80c63          	beq	a6,a3,80402150 <default_free_pages+0x160>
8040213c:	ffc82883          	lw	a7,-4(a6)
80402140:	ff480613          	addi	a2,a6,-12
80402144:	00589713          	slli	a4,a7,0x5
80402148:	00e60733          	add	a4,a2,a4
8040214c:	f8e50ce3          	beq	a0,a4,804020e4 <default_free_pages+0xf4>
80402150:	ff478713          	addi	a4,a5,-12
80402154:	00d78a63          	beq	a5,a3,80402168 <default_free_pages+0x178>
80402158:	00852603          	lw	a2,8(a0)
8040215c:	00561693          	slli	a3,a2,0x5
80402160:	00d506b3          	add	a3,a0,a3
80402164:	02d70863          	beq	a4,a3,80402194 <default_free_pages+0x1a4>
80402168:	00c12083          	lw	ra,12(sp)
8040216c:	01010113          	addi	sp,sp,16
80402170:	00008067          	ret
80402174:	00c12083          	lw	ra,12(sp)
80402178:	00c50713          	addi	a4,a0,12
8040217c:	00e7a023          	sw	a4,0(a5)
80402180:	00e7a223          	sw	a4,4(a5)
80402184:	00f52823          	sw	a5,16(a0)
80402188:	00f52623          	sw	a5,12(a0)
8040218c:	01010113          	addi	sp,sp,16
80402190:	00008067          	ret
80402194:	ffc7a703          	lw	a4,-4(a5)
80402198:	0007a583          	lw	a1,0(a5)
8040219c:	0047a683          	lw	a3,4(a5)
804021a0:	00c70633          	add	a2,a4,a2
804021a4:	00c52423          	sw	a2,8(a0)
804021a8:	ff87a703          	lw	a4,-8(a5)
804021ac:	00c12083          	lw	ra,12(sp)
804021b0:	ffd77713          	andi	a4,a4,-3
804021b4:	fee7ac23          	sw	a4,-8(a5)
804021b8:	00d5a223          	sw	a3,4(a1)
804021bc:	00b6a023          	sw	a1,0(a3)
804021c0:	01010113          	addi	sp,sp,16
804021c4:	00008067          	ret
804021c8:	00011697          	auipc	a3,0x11
804021cc:	3b068693          	addi	a3,a3,944 # 80413578 <commands+0xac8>
804021d0:	00011617          	auipc	a2,0x11
804021d4:	a9c60613          	addi	a2,a2,-1380 # 80412c6c <commands+0x1bc>
804021d8:	08300593          	li	a1,131
804021dc:	00011517          	auipc	a0,0x11
804021e0:	08c50513          	addi	a0,a0,140 # 80413268 <commands+0x7b8>
804021e4:	c40fe0ef          	jal	ra,80400624 <__panic>
804021e8:	00011697          	auipc	a3,0x11
804021ec:	3b868693          	addi	a3,a3,952 # 804135a0 <commands+0xaf0>
804021f0:	00011617          	auipc	a2,0x11
804021f4:	a7c60613          	addi	a2,a2,-1412 # 80412c6c <commands+0x1bc>
804021f8:	08000593          	li	a1,128
804021fc:	00011517          	auipc	a0,0x11
80402200:	06c50513          	addi	a0,a0,108 # 80413268 <commands+0x7b8>
80402204:	c20fe0ef          	jal	ra,80400624 <__panic>

80402208 <default_alloc_pages>:
80402208:	0a050263          	beqz	a0,804022ac <default_alloc_pages+0xa4>
8040220c:	0009a617          	auipc	a2,0x9a
80402210:	5e860613          	addi	a2,a2,1512 # 8049c7f4 <free_area>
80402214:	00862583          	lw	a1,8(a2)
80402218:	00050693          	mv	a3,a0
8040221c:	00a5ee63          	bltu	a1,a0,80402238 <default_alloc_pages+0x30>
80402220:	00060793          	mv	a5,a2
80402224:	00c0006f          	j	80402230 <default_alloc_pages+0x28>
80402228:	ffc7a703          	lw	a4,-4(a5)
8040222c:	00d77a63          	bgeu	a4,a3,80402240 <default_alloc_pages+0x38>
80402230:	0047a783          	lw	a5,4(a5)
80402234:	fec79ae3          	bne	a5,a2,80402228 <default_alloc_pages+0x20>
80402238:	00000513          	li	a0,0
8040223c:	00008067          	ret
80402240:	ff478513          	addi	a0,a5,-12
80402244:	fe050ce3          	beqz	a0,8040223c <default_alloc_pages+0x34>
80402248:	0007a883          	lw	a7,0(a5)
8040224c:	0047a303          	lw	t1,4(a5)
80402250:	0068a223          	sw	t1,4(a7)
80402254:	01132023          	sw	a7,0(t1)
80402258:	02e6fc63          	bgeu	a3,a4,80402290 <default_alloc_pages+0x88>
8040225c:	00569813          	slli	a6,a3,0x5
80402260:	01050833          	add	a6,a0,a6
80402264:	00482583          	lw	a1,4(a6)
80402268:	40d70733          	sub	a4,a4,a3
8040226c:	00e82423          	sw	a4,8(a6)
80402270:	0025e713          	ori	a4,a1,2
80402274:	00e82223          	sw	a4,4(a6)
80402278:	00c80713          	addi	a4,a6,12
8040227c:	00e32023          	sw	a4,0(t1)
80402280:	00862583          	lw	a1,8(a2)
80402284:	00e8a223          	sw	a4,4(a7)
80402288:	00682823          	sw	t1,16(a6)
8040228c:	01182623          	sw	a7,12(a6)
80402290:	40d586b3          	sub	a3,a1,a3
80402294:	0009a717          	auipc	a4,0x9a
80402298:	56d72423          	sw	a3,1384(a4) # 8049c7fc <free_area+0x8>
8040229c:	ff87a703          	lw	a4,-8(a5)
804022a0:	ffd77713          	andi	a4,a4,-3
804022a4:	fee7ac23          	sw	a4,-8(a5)
804022a8:	00008067          	ret
804022ac:	ff010113          	addi	sp,sp,-16
804022b0:	00011697          	auipc	a3,0x11
804022b4:	2f068693          	addi	a3,a3,752 # 804135a0 <commands+0xaf0>
804022b8:	00011617          	auipc	a2,0x11
804022bc:	9b460613          	addi	a2,a2,-1612 # 80412c6c <commands+0x1bc>
804022c0:	06200593          	li	a1,98
804022c4:	00011517          	auipc	a0,0x11
804022c8:	fa450513          	addi	a0,a0,-92 # 80413268 <commands+0x7b8>
804022cc:	00112623          	sw	ra,12(sp)
804022d0:	b54fe0ef          	jal	ra,80400624 <__panic>

804022d4 <default_init_memmap>:
804022d4:	ff010113          	addi	sp,sp,-16
804022d8:	00112623          	sw	ra,12(sp)
804022dc:	12058e63          	beqz	a1,80402418 <default_init_memmap+0x144>
804022e0:	00559693          	slli	a3,a1,0x5
804022e4:	00d506b3          	add	a3,a0,a3
804022e8:	02d50c63          	beq	a0,a3,80402320 <default_init_memmap+0x4c>
804022ec:	00452703          	lw	a4,4(a0)
804022f0:	00050793          	mv	a5,a0
804022f4:	00177713          	andi	a4,a4,1
804022f8:	00071a63          	bnez	a4,8040230c <default_init_memmap+0x38>
804022fc:	0fc0006f          	j	804023f8 <default_init_memmap+0x124>
80402300:	0047a703          	lw	a4,4(a5)
80402304:	00177713          	andi	a4,a4,1
80402308:	0e070863          	beqz	a4,804023f8 <default_init_memmap+0x124>
8040230c:	0007a423          	sw	zero,8(a5)
80402310:	0007a223          	sw	zero,4(a5)
80402314:	0007a023          	sw	zero,0(a5)
80402318:	02078793          	addi	a5,a5,32
8040231c:	fed792e3          	bne	a5,a3,80402300 <default_init_memmap+0x2c>
80402320:	00452703          	lw	a4,4(a0)
80402324:	0009a697          	auipc	a3,0x9a
80402328:	4d068693          	addi	a3,a3,1232 # 8049c7f4 <free_area>
8040232c:	0046a783          	lw	a5,4(a3)
80402330:	00276713          	ori	a4,a4,2
80402334:	00e52223          	sw	a4,4(a0)
80402338:	0086a703          	lw	a4,8(a3)
8040233c:	00b52423          	sw	a1,8(a0)
80402340:	00b705b3          	add	a1,a4,a1
80402344:	0009a717          	auipc	a4,0x9a
80402348:	4ab72c23          	sw	a1,1208(a4) # 8049c7fc <free_area+0x8>
8040234c:	06d78e63          	beq	a5,a3,804023c8 <default_init_memmap+0xf4>
80402350:	ff478713          	addi	a4,a5,-12
80402354:	0006a583          	lw	a1,0(a3)
80402358:	00000813          	li	a6,0
8040235c:	00c50613          	addi	a2,a0,12
80402360:	00e56c63          	bltu	a0,a4,80402378 <default_init_memmap+0xa4>
80402364:	0047a703          	lw	a4,4(a5)
80402368:	02d70e63          	beq	a4,a3,804023a4 <default_init_memmap+0xd0>
8040236c:	00070793          	mv	a5,a4
80402370:	ff478713          	addi	a4,a5,-12
80402374:	fee578e3          	bgeu	a0,a4,80402364 <default_init_memmap+0x90>
80402378:	00080663          	beqz	a6,80402384 <default_init_memmap+0xb0>
8040237c:	0009a717          	auipc	a4,0x9a
80402380:	46b72c23          	sw	a1,1144(a4) # 8049c7f4 <free_area>
80402384:	0007a703          	lw	a4,0(a5)
80402388:	00c12083          	lw	ra,12(sp)
8040238c:	00c7a023          	sw	a2,0(a5)
80402390:	00c72223          	sw	a2,4(a4)
80402394:	00f52823          	sw	a5,16(a0)
80402398:	00e52623          	sw	a4,12(a0)
8040239c:	01010113          	addi	sp,sp,16
804023a0:	00008067          	ret
804023a4:	00c7a223          	sw	a2,4(a5)
804023a8:	00d52823          	sw	a3,16(a0)
804023ac:	0047a703          	lw	a4,4(a5)
804023b0:	00f52623          	sw	a5,12(a0)
804023b4:	00060593          	mv	a1,a2
804023b8:	02d70863          	beq	a4,a3,804023e8 <default_init_memmap+0x114>
804023bc:	00100813          	li	a6,1
804023c0:	00070793          	mv	a5,a4
804023c4:	fadff06f          	j	80402370 <default_init_memmap+0x9c>
804023c8:	00c12083          	lw	ra,12(sp)
804023cc:	00c50713          	addi	a4,a0,12
804023d0:	00e7a023          	sw	a4,0(a5)
804023d4:	00e7a223          	sw	a4,4(a5)
804023d8:	00f52823          	sw	a5,16(a0)
804023dc:	00f52623          	sw	a5,12(a0)
804023e0:	01010113          	addi	sp,sp,16
804023e4:	00008067          	ret
804023e8:	00c12083          	lw	ra,12(sp)
804023ec:	00c6a023          	sw	a2,0(a3)
804023f0:	01010113          	addi	sp,sp,16
804023f4:	00008067          	ret
804023f8:	00011697          	auipc	a3,0x11
804023fc:	1b068693          	addi	a3,a3,432 # 804135a8 <commands+0xaf8>
80402400:	00011617          	auipc	a2,0x11
80402404:	86c60613          	addi	a2,a2,-1940 # 80412c6c <commands+0x1bc>
80402408:	04900593          	li	a1,73
8040240c:	00011517          	auipc	a0,0x11
80402410:	e5c50513          	addi	a0,a0,-420 # 80413268 <commands+0x7b8>
80402414:	a10fe0ef          	jal	ra,80400624 <__panic>
80402418:	00011697          	auipc	a3,0x11
8040241c:	18868693          	addi	a3,a3,392 # 804135a0 <commands+0xaf0>
80402420:	00011617          	auipc	a2,0x11
80402424:	84c60613          	addi	a2,a2,-1972 # 80412c6c <commands+0x1bc>
80402428:	04600593          	li	a1,70
8040242c:	00011517          	auipc	a0,0x11
80402430:	e3c50513          	addi	a0,a0,-452 # 80413268 <commands+0x7b8>
80402434:	9f0fe0ef          	jal	ra,80400624 <__panic>

80402438 <slob_free>:
80402438:	08050063          	beqz	a0,804024b8 <slob_free+0x80>
8040243c:	08059063          	bnez	a1,804024bc <slob_free+0x84>
80402440:	100027f3          	csrr	a5,sstatus
80402444:	0027f793          	andi	a5,a5,2
80402448:	00000593          	li	a1,0
8040244c:	08079663          	bnez	a5,804024d8 <slob_free+0xa0>
80402450:	00097797          	auipc	a5,0x97
80402454:	bf078793          	addi	a5,a5,-1040 # 80499040 <slobfree>
80402458:	0007a783          	lw	a5,0(a5)
8040245c:	0047a703          	lw	a4,4(a5)
80402460:	00a7fc63          	bgeu	a5,a0,80402478 <slob_free+0x40>
80402464:	00e56e63          	bltu	a0,a4,80402480 <slob_free+0x48>
80402468:	00e7fc63          	bgeu	a5,a4,80402480 <slob_free+0x48>
8040246c:	00070793          	mv	a5,a4
80402470:	0047a703          	lw	a4,4(a5)
80402474:	fea7e8e3          	bltu	a5,a0,80402464 <slob_free+0x2c>
80402478:	fee7eae3          	bltu	a5,a4,8040246c <slob_free+0x34>
8040247c:	fee578e3          	bgeu	a0,a4,8040246c <slob_free+0x34>
80402480:	00052603          	lw	a2,0(a0)
80402484:	00361693          	slli	a3,a2,0x3
80402488:	00d506b3          	add	a3,a0,a3
8040248c:	0cd70a63          	beq	a4,a3,80402560 <slob_free+0x128>
80402490:	0007a683          	lw	a3,0(a5)
80402494:	00e52223          	sw	a4,4(a0)
80402498:	00369713          	slli	a4,a3,0x3
8040249c:	00e78733          	add	a4,a5,a4
804024a0:	0ee50263          	beq	a0,a4,80402584 <slob_free+0x14c>
804024a4:	00a7a223          	sw	a0,4(a5)
804024a8:	00097717          	auipc	a4,0x97
804024ac:	b8f72c23          	sw	a5,-1128(a4) # 80499040 <slobfree>
804024b0:	00058463          	beqz	a1,804024b8 <slob_free+0x80>
804024b4:	f70fe06f          	j	80400c24 <intr_enable>
804024b8:	00008067          	ret
804024bc:	00758593          	addi	a1,a1,7
804024c0:	0035d593          	srli	a1,a1,0x3
804024c4:	00b52023          	sw	a1,0(a0)
804024c8:	100027f3          	csrr	a5,sstatus
804024cc:	0027f793          	andi	a5,a5,2
804024d0:	00000593          	li	a1,0
804024d4:	f6078ee3          	beqz	a5,80402450 <slob_free+0x18>
804024d8:	fe010113          	addi	sp,sp,-32
804024dc:	00a12623          	sw	a0,12(sp)
804024e0:	00112e23          	sw	ra,28(sp)
804024e4:	f48fe0ef          	jal	ra,80400c2c <intr_disable>
804024e8:	00097797          	auipc	a5,0x97
804024ec:	b5878793          	addi	a5,a5,-1192 # 80499040 <slobfree>
804024f0:	0007a783          	lw	a5,0(a5)
804024f4:	00c12503          	lw	a0,12(sp)
804024f8:	00100593          	li	a1,1
804024fc:	0047a703          	lw	a4,4(a5)
80402500:	00a7fc63          	bgeu	a5,a0,80402518 <slob_free+0xe0>
80402504:	00e56e63          	bltu	a0,a4,80402520 <slob_free+0xe8>
80402508:	00e7fc63          	bgeu	a5,a4,80402520 <slob_free+0xe8>
8040250c:	00070793          	mv	a5,a4
80402510:	0047a703          	lw	a4,4(a5)
80402514:	fea7e8e3          	bltu	a5,a0,80402504 <slob_free+0xcc>
80402518:	fee7eae3          	bltu	a5,a4,8040250c <slob_free+0xd4>
8040251c:	fee578e3          	bgeu	a0,a4,8040250c <slob_free+0xd4>
80402520:	00052603          	lw	a2,0(a0)
80402524:	00361693          	slli	a3,a2,0x3
80402528:	00d506b3          	add	a3,a0,a3
8040252c:	06d70e63          	beq	a4,a3,804025a8 <slob_free+0x170>
80402530:	00e52223          	sw	a4,4(a0)
80402534:	0007a683          	lw	a3,0(a5)
80402538:	00369713          	slli	a4,a3,0x3
8040253c:	00e78733          	add	a4,a5,a4
80402540:	08e50063          	beq	a0,a4,804025c0 <slob_free+0x188>
80402544:	00a7a223          	sw	a0,4(a5)
80402548:	00097717          	auipc	a4,0x97
8040254c:	aef72c23          	sw	a5,-1288(a4) # 80499040 <slobfree>
80402550:	04059663          	bnez	a1,8040259c <slob_free+0x164>
80402554:	01c12083          	lw	ra,28(sp)
80402558:	02010113          	addi	sp,sp,32
8040255c:	00008067          	ret
80402560:	00072683          	lw	a3,0(a4)
80402564:	00472703          	lw	a4,4(a4)
80402568:	00c68633          	add	a2,a3,a2
8040256c:	00c52023          	sw	a2,0(a0)
80402570:	0007a683          	lw	a3,0(a5)
80402574:	00e52223          	sw	a4,4(a0)
80402578:	00369713          	slli	a4,a3,0x3
8040257c:	00e78733          	add	a4,a5,a4
80402580:	f2e512e3          	bne	a0,a4,804024a4 <slob_free+0x6c>
80402584:	00052703          	lw	a4,0(a0)
80402588:	00452603          	lw	a2,4(a0)
8040258c:	00d706b3          	add	a3,a4,a3
80402590:	00d7a023          	sw	a3,0(a5)
80402594:	00c7a223          	sw	a2,4(a5)
80402598:	f11ff06f          	j	804024a8 <slob_free+0x70>
8040259c:	01c12083          	lw	ra,28(sp)
804025a0:	02010113          	addi	sp,sp,32
804025a4:	e80fe06f          	j	80400c24 <intr_enable>
804025a8:	00072683          	lw	a3,0(a4)
804025ac:	00472703          	lw	a4,4(a4)
804025b0:	00c68633          	add	a2,a3,a2
804025b4:	00c52023          	sw	a2,0(a0)
804025b8:	00e52223          	sw	a4,4(a0)
804025bc:	f79ff06f          	j	80402534 <slob_free+0xfc>
804025c0:	00052703          	lw	a4,0(a0)
804025c4:	00452603          	lw	a2,4(a0)
804025c8:	00d706b3          	add	a3,a4,a3
804025cc:	00d7a023          	sw	a3,0(a5)
804025d0:	00c7a223          	sw	a2,4(a5)
804025d4:	f75ff06f          	j	80402548 <slob_free+0x110>

804025d8 <__slob_get_free_pages.isra.0>:
804025d8:	00100793          	li	a5,1
804025dc:	ff010113          	addi	sp,sp,-16
804025e0:	00a79533          	sll	a0,a5,a0
804025e4:	00112623          	sw	ra,12(sp)
804025e8:	628000ef          	jal	ra,80402c10 <alloc_pages>
804025ec:	04050a63          	beqz	a0,80402640 <__slob_get_free_pages.isra.0+0x68>
804025f0:	0009a797          	auipc	a5,0x9a
804025f4:	21c78793          	addi	a5,a5,540 # 8049c80c <pages>
804025f8:	0007a683          	lw	a3,0(a5)
804025fc:	00014797          	auipc	a5,0x14
80402600:	abc78793          	addi	a5,a5,-1348 # 804160b8 <nbase>
80402604:	40d50533          	sub	a0,a0,a3
80402608:	0007a683          	lw	a3,0(a5)
8040260c:	40555513          	srai	a0,a0,0x5
80402610:	0009a797          	auipc	a5,0x9a
80402614:	18c78793          	addi	a5,a5,396 # 8049c79c <npage>
80402618:	00d50533          	add	a0,a0,a3
8040261c:	0007a703          	lw	a4,0(a5)
80402620:	00c51793          	slli	a5,a0,0xc
80402624:	00c7d793          	srli	a5,a5,0xc
80402628:	00c51513          	slli	a0,a0,0xc
8040262c:	02e7f063          	bgeu	a5,a4,8040264c <__slob_get_free_pages.isra.0+0x74>
80402630:	0009a797          	auipc	a5,0x9a
80402634:	1d478793          	addi	a5,a5,468 # 8049c804 <va_pa_offset>
80402638:	0007a683          	lw	a3,0(a5)
8040263c:	00d50533          	add	a0,a0,a3
80402640:	00c12083          	lw	ra,12(sp)
80402644:	01010113          	addi	sp,sp,16
80402648:	00008067          	ret
8040264c:	00050693          	mv	a3,a0
80402650:	00011617          	auipc	a2,0x11
80402654:	f9860613          	addi	a2,a2,-104 # 804135e8 <default_pmm_manager+0x30>
80402658:	06e00593          	li	a1,110
8040265c:	00011517          	auipc	a0,0x11
80402660:	fb050513          	addi	a0,a0,-80 # 8041360c <default_pmm_manager+0x54>
80402664:	fc1fd0ef          	jal	ra,80400624 <__panic>

80402668 <slob_alloc.isra.1.constprop.3>:
80402668:	fe010113          	addi	sp,sp,-32
8040266c:	00112e23          	sw	ra,28(sp)
80402670:	00812c23          	sw	s0,24(sp)
80402674:	00912a23          	sw	s1,20(sp)
80402678:	01212823          	sw	s2,16(sp)
8040267c:	01312623          	sw	s3,12(sp)
80402680:	00850713          	addi	a4,a0,8
80402684:	000017b7          	lui	a5,0x1
80402688:	12f77a63          	bgeu	a4,a5,804027bc <slob_alloc.isra.1.constprop.3+0x154>
8040268c:	00750993          	addi	s3,a0,7
80402690:	0039d913          	srli	s2,s3,0x3
80402694:	10002673          	csrr	a2,sstatus
80402698:	00267613          	andi	a2,a2,2
8040269c:	10061463          	bnez	a2,804027a4 <slob_alloc.isra.1.constprop.3+0x13c>
804026a0:	00097497          	auipc	s1,0x97
804026a4:	9a048493          	addi	s1,s1,-1632 # 80499040 <slobfree>
804026a8:	0004a683          	lw	a3,0(s1)
804026ac:	0046a783          	lw	a5,4(a3)
804026b0:	0007a703          	lw	a4,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
804026b4:	0f275e63          	bge	a4,s2,804027b0 <slob_alloc.isra.1.constprop.3+0x148>
804026b8:	00d78e63          	beq	a5,a3,804026d4 <slob_alloc.isra.1.constprop.3+0x6c>
804026bc:	0047a403          	lw	s0,4(a5)
804026c0:	00042703          	lw	a4,0(s0)
804026c4:	05275463          	bge	a4,s2,8040270c <slob_alloc.isra.1.constprop.3+0xa4>
804026c8:	0004a683          	lw	a3,0(s1)
804026cc:	00040793          	mv	a5,s0
804026d0:	fed796e3          	bne	a5,a3,804026bc <slob_alloc.isra.1.constprop.3+0x54>
804026d4:	08061c63          	bnez	a2,8040276c <slob_alloc.isra.1.constprop.3+0x104>
804026d8:	00000513          	li	a0,0
804026dc:	efdff0ef          	jal	ra,804025d8 <__slob_get_free_pages.isra.0>
804026e0:	00050413          	mv	s0,a0
804026e4:	04050c63          	beqz	a0,8040273c <slob_alloc.isra.1.constprop.3+0xd4>
804026e8:	000015b7          	lui	a1,0x1
804026ec:	d4dff0ef          	jal	ra,80402438 <slob_free>
804026f0:	10002673          	csrr	a2,sstatus
804026f4:	00267613          	andi	a2,a2,2
804026f8:	06061263          	bnez	a2,8040275c <slob_alloc.isra.1.constprop.3+0xf4>
804026fc:	0004a783          	lw	a5,0(s1)
80402700:	0047a403          	lw	s0,4(a5)
80402704:	00042703          	lw	a4,0(s0)
80402708:	fd2740e3          	blt	a4,s2,804026c8 <slob_alloc.isra.1.constprop.3+0x60>
8040270c:	08e90663          	beq	s2,a4,80402798 <slob_alloc.isra.1.constprop.3+0x130>
80402710:	ff89f513          	andi	a0,s3,-8
80402714:	00a40533          	add	a0,s0,a0
80402718:	00a7a223          	sw	a0,4(a5)
8040271c:	00442683          	lw	a3,4(s0)
80402720:	41270733          	sub	a4,a4,s2
80402724:	00e52023          	sw	a4,0(a0)
80402728:	00d52223          	sw	a3,4(a0)
8040272c:	01242023          	sw	s2,0(s0)
80402730:	00097717          	auipc	a4,0x97
80402734:	90f72823          	sw	a5,-1776(a4) # 80499040 <slobfree>
80402738:	02061e63          	bnez	a2,80402774 <slob_alloc.isra.1.constprop.3+0x10c>
8040273c:	00040513          	mv	a0,s0
80402740:	01c12083          	lw	ra,28(sp)
80402744:	01812403          	lw	s0,24(sp)
80402748:	01412483          	lw	s1,20(sp)
8040274c:	01012903          	lw	s2,16(sp)
80402750:	00c12983          	lw	s3,12(sp)
80402754:	02010113          	addi	sp,sp,32
80402758:	00008067          	ret
8040275c:	cd0fe0ef          	jal	ra,80400c2c <intr_disable>
80402760:	00100613          	li	a2,1
80402764:	0004a783          	lw	a5,0(s1)
80402768:	f99ff06f          	j	80402700 <slob_alloc.isra.1.constprop.3+0x98>
8040276c:	cb8fe0ef          	jal	ra,80400c24 <intr_enable>
80402770:	f69ff06f          	j	804026d8 <slob_alloc.isra.1.constprop.3+0x70>
80402774:	cb0fe0ef          	jal	ra,80400c24 <intr_enable>
80402778:	00040513          	mv	a0,s0
8040277c:	01c12083          	lw	ra,28(sp)
80402780:	01812403          	lw	s0,24(sp)
80402784:	01412483          	lw	s1,20(sp)
80402788:	01012903          	lw	s2,16(sp)
8040278c:	00c12983          	lw	s3,12(sp)
80402790:	02010113          	addi	sp,sp,32
80402794:	00008067          	ret
80402798:	00442703          	lw	a4,4(s0)
8040279c:	00e7a223          	sw	a4,4(a5)
804027a0:	f91ff06f          	j	80402730 <slob_alloc.isra.1.constprop.3+0xc8>
804027a4:	c88fe0ef          	jal	ra,80400c2c <intr_disable>
804027a8:	00100613          	li	a2,1
804027ac:	ef5ff06f          	j	804026a0 <slob_alloc.isra.1.constprop.3+0x38>
804027b0:	00078413          	mv	s0,a5
804027b4:	00068793          	mv	a5,a3
804027b8:	f55ff06f          	j	8040270c <slob_alloc.isra.1.constprop.3+0xa4>
804027bc:	00011697          	auipc	a3,0x11
804027c0:	ec068693          	addi	a3,a3,-320 # 8041367c <default_pmm_manager+0xc4>
804027c4:	00010617          	auipc	a2,0x10
804027c8:	4a860613          	addi	a2,a2,1192 # 80412c6c <commands+0x1bc>
804027cc:	06400593          	li	a1,100
804027d0:	00011517          	auipc	a0,0x11
804027d4:	ecc50513          	addi	a0,a0,-308 # 8041369c <default_pmm_manager+0xe4>
804027d8:	e4dfd0ef          	jal	ra,80400624 <__panic>

804027dc <slob_init>:
804027dc:	ff010113          	addi	sp,sp,-16
804027e0:	00812423          	sw	s0,8(sp)
804027e4:	00097417          	auipc	s0,0x97
804027e8:	85440413          	addi	s0,s0,-1964 # 80499038 <arena>
804027ec:	00097797          	auipc	a5,0x97
804027f0:	8487a823          	sw	s0,-1968(a5) # 8049903c <arena+0x4>
804027f4:	00100793          	li	a5,1
804027f8:	00011517          	auipc	a0,0x11
804027fc:	eb850513          	addi	a0,a0,-328 # 804136b0 <default_pmm_manager+0xf8>
80402800:	00097717          	auipc	a4,0x97
80402804:	82f72c23          	sw	a5,-1992(a4) # 80499038 <arena>
80402808:	00112623          	sw	ra,12(sp)
8040280c:	00097797          	auipc	a5,0x97
80402810:	8287aa23          	sw	s0,-1996(a5) # 80499040 <slobfree>
80402814:	0009a797          	auipc	a5,0x9a
80402818:	f807a023          	sw	zero,-128(a5) # 8049c794 <bigblocks>
8040281c:	9e1fd0ef          	jal	ra,804001fc <cprintf>
80402820:	00442603          	lw	a2,4(s0)
80402824:	00042683          	lw	a3,0(s0)
80402828:	00040593          	mv	a1,s0
8040282c:	00011517          	auipc	a0,0x11
80402830:	e9850513          	addi	a0,a0,-360 # 804136c4 <default_pmm_manager+0x10c>
80402834:	9c9fd0ef          	jal	ra,804001fc <cprintf>
80402838:	00097797          	auipc	a5,0x97
8040283c:	80878793          	addi	a5,a5,-2040 # 80499040 <slobfree>
80402840:	0007a583          	lw	a1,0(a5)
80402844:	00000613          	li	a2,0
80402848:	00058463          	beqz	a1,80402850 <slob_init+0x74>
8040284c:	0045a603          	lw	a2,4(a1) # 1004 <_binary_bin_swap_img_size-0x6ffc>
80402850:	00812403          	lw	s0,8(sp)
80402854:	00c12083          	lw	ra,12(sp)
80402858:	00011517          	auipc	a0,0x11
8040285c:	e9c50513          	addi	a0,a0,-356 # 804136f4 <default_pmm_manager+0x13c>
80402860:	01010113          	addi	sp,sp,16
80402864:	999fd06f          	j	804001fc <cprintf>

80402868 <kmalloc_init>:
80402868:	ff010113          	addi	sp,sp,-16
8040286c:	00112623          	sw	ra,12(sp)
80402870:	f6dff0ef          	jal	ra,804027dc <slob_init>
80402874:	00c12083          	lw	ra,12(sp)
80402878:	00011517          	auipc	a0,0x11
8040287c:	de850513          	addi	a0,a0,-536 # 80413660 <default_pmm_manager+0xa8>
80402880:	01010113          	addi	sp,sp,16
80402884:	979fd06f          	j	804001fc <cprintf>

80402888 <kallocated>:
80402888:	00000513          	li	a0,0
8040288c:	00008067          	ret

80402890 <kmalloc>:
80402890:	ff010113          	addi	sp,sp,-16
80402894:	01212023          	sw	s2,0(sp)
80402898:	00001937          	lui	s2,0x1
8040289c:	00812423          	sw	s0,8(sp)
804028a0:	00112623          	sw	ra,12(sp)
804028a4:	00912223          	sw	s1,4(sp)
804028a8:	ff790793          	addi	a5,s2,-9 # ff7 <_binary_bin_swap_img_size-0x7009>
804028ac:	00050413          	mv	s0,a0
804028b0:	08a7f263          	bgeu	a5,a0,80402934 <kmalloc+0xa4>
804028b4:	00c00513          	li	a0,12
804028b8:	db1ff0ef          	jal	ra,80402668 <slob_alloc.isra.1.constprop.3>
804028bc:	00050493          	mv	s1,a0
804028c0:	08050263          	beqz	a0,80402944 <kmalloc+0xb4>
804028c4:	00040793          	mv	a5,s0
804028c8:	00000513          	li	a0,0
804028cc:	00895a63          	bge	s2,s0,804028e0 <kmalloc+0x50>
804028d0:	00001737          	lui	a4,0x1
804028d4:	4017d793          	srai	a5,a5,0x1
804028d8:	00150513          	addi	a0,a0,1
804028dc:	fef74ce3          	blt	a4,a5,804028d4 <kmalloc+0x44>
804028e0:	00a4a023          	sw	a0,0(s1)
804028e4:	cf5ff0ef          	jal	ra,804025d8 <__slob_get_free_pages.isra.0>
804028e8:	00a4a223          	sw	a0,4(s1)
804028ec:	00050413          	mv	s0,a0
804028f0:	0a050a63          	beqz	a0,804029a4 <kmalloc+0x114>
804028f4:	100027f3          	csrr	a5,sstatus
804028f8:	0027f793          	andi	a5,a5,2
804028fc:	06079463          	bnez	a5,80402964 <kmalloc+0xd4>
80402900:	0009a797          	auipc	a5,0x9a
80402904:	e9478793          	addi	a5,a5,-364 # 8049c794 <bigblocks>
80402908:	0007a783          	lw	a5,0(a5)
8040290c:	0009a717          	auipc	a4,0x9a
80402910:	e8972423          	sw	s1,-376(a4) # 8049c794 <bigblocks>
80402914:	00f4a423          	sw	a5,8(s1)
80402918:	00040513          	mv	a0,s0
8040291c:	00c12083          	lw	ra,12(sp)
80402920:	00812403          	lw	s0,8(sp)
80402924:	00412483          	lw	s1,4(sp)
80402928:	00012903          	lw	s2,0(sp)
8040292c:	01010113          	addi	sp,sp,16
80402930:	00008067          	ret
80402934:	00850513          	addi	a0,a0,8
80402938:	d31ff0ef          	jal	ra,80402668 <slob_alloc.isra.1.constprop.3>
8040293c:	00850413          	addi	s0,a0,8
80402940:	fc051ce3          	bnez	a0,80402918 <kmalloc+0x88>
80402944:	00000413          	li	s0,0
80402948:	00040513          	mv	a0,s0
8040294c:	00c12083          	lw	ra,12(sp)
80402950:	00812403          	lw	s0,8(sp)
80402954:	00412483          	lw	s1,4(sp)
80402958:	00012903          	lw	s2,0(sp)
8040295c:	01010113          	addi	sp,sp,16
80402960:	00008067          	ret
80402964:	ac8fe0ef          	jal	ra,80400c2c <intr_disable>
80402968:	0009a797          	auipc	a5,0x9a
8040296c:	e2c78793          	addi	a5,a5,-468 # 8049c794 <bigblocks>
80402970:	0007a783          	lw	a5,0(a5)
80402974:	0009a717          	auipc	a4,0x9a
80402978:	e2972023          	sw	s1,-480(a4) # 8049c794 <bigblocks>
8040297c:	00f4a423          	sw	a5,8(s1)
80402980:	aa4fe0ef          	jal	ra,80400c24 <intr_enable>
80402984:	0044a403          	lw	s0,4(s1)
80402988:	00c12083          	lw	ra,12(sp)
8040298c:	00412483          	lw	s1,4(sp)
80402990:	00040513          	mv	a0,s0
80402994:	00812403          	lw	s0,8(sp)
80402998:	00012903          	lw	s2,0(sp)
8040299c:	01010113          	addi	sp,sp,16
804029a0:	00008067          	ret
804029a4:	00c00593          	li	a1,12
804029a8:	00048513          	mv	a0,s1
804029ac:	a8dff0ef          	jal	ra,80402438 <slob_free>
804029b0:	f69ff06f          	j	80402918 <kmalloc+0x88>

804029b4 <kfree>:
804029b4:	14050863          	beqz	a0,80402b04 <kfree+0x150>
804029b8:	ff010113          	addi	sp,sp,-16
804029bc:	00912223          	sw	s1,4(sp)
804029c0:	00112623          	sw	ra,12(sp)
804029c4:	00812423          	sw	s0,8(sp)
804029c8:	01451793          	slli	a5,a0,0x14
804029cc:	00050493          	mv	s1,a0
804029d0:	04079863          	bnez	a5,80402a20 <kfree+0x6c>
804029d4:	100027f3          	csrr	a5,sstatus
804029d8:	0027f793          	andi	a5,a5,2
804029dc:	0e079263          	bnez	a5,80402ac0 <kfree+0x10c>
804029e0:	0009a797          	auipc	a5,0x9a
804029e4:	db478793          	addi	a5,a5,-588 # 8049c794 <bigblocks>
804029e8:	0007a683          	lw	a3,0(a5)
804029ec:	02068a63          	beqz	a3,80402a20 <kfree+0x6c>
804029f0:	0046a783          	lw	a5,4(a3)
804029f4:	0086a403          	lw	s0,8(a3)
804029f8:	10f50863          	beq	a0,a5,80402b08 <kfree+0x154>
804029fc:	00000613          	li	a2,0
80402a00:	00040e63          	beqz	s0,80402a1c <kfree+0x68>
80402a04:	00442703          	lw	a4,4(s0)
80402a08:	00842783          	lw	a5,8(s0)
80402a0c:	02970863          	beq	a4,s1,80402a3c <kfree+0x88>
80402a10:	00040693          	mv	a3,s0
80402a14:	00078413          	mv	s0,a5
80402a18:	fe0416e3          	bnez	s0,80402a04 <kfree+0x50>
80402a1c:	0c061663          	bnez	a2,80402ae8 <kfree+0x134>
80402a20:	00812403          	lw	s0,8(sp)
80402a24:	00c12083          	lw	ra,12(sp)
80402a28:	ff848513          	addi	a0,s1,-8
80402a2c:	00412483          	lw	s1,4(sp)
80402a30:	00000593          	li	a1,0
80402a34:	01010113          	addi	sp,sp,16
80402a38:	a01ff06f          	j	80402438 <slob_free>
80402a3c:	00f6a423          	sw	a5,8(a3)
80402a40:	0a061e63          	bnez	a2,80402afc <kfree+0x148>
80402a44:	804007b7          	lui	a5,0x80400
80402a48:	00042703          	lw	a4,0(s0)
80402a4c:	0cf4e663          	bltu	s1,a5,80402b18 <kfree+0x164>
80402a50:	0009a797          	auipc	a5,0x9a
80402a54:	db478793          	addi	a5,a5,-588 # 8049c804 <va_pa_offset>
80402a58:	0007a683          	lw	a3,0(a5)
80402a5c:	0009a797          	auipc	a5,0x9a
80402a60:	d4078793          	addi	a5,a5,-704 # 8049c79c <npage>
80402a64:	0007a783          	lw	a5,0(a5)
80402a68:	40d484b3          	sub	s1,s1,a3
80402a6c:	00c4d493          	srli	s1,s1,0xc
80402a70:	0cf4f263          	bgeu	s1,a5,80402b34 <kfree+0x180>
80402a74:	00013797          	auipc	a5,0x13
80402a78:	64478793          	addi	a5,a5,1604 # 804160b8 <nbase>
80402a7c:	0007a783          	lw	a5,0(a5)
80402a80:	0009a697          	auipc	a3,0x9a
80402a84:	d8c68693          	addi	a3,a3,-628 # 8049c80c <pages>
80402a88:	0006a503          	lw	a0,0(a3)
80402a8c:	40f484b3          	sub	s1,s1,a5
80402a90:	00549493          	slli	s1,s1,0x5
80402a94:	00100593          	li	a1,1
80402a98:	00950533          	add	a0,a0,s1
80402a9c:	00e595b3          	sll	a1,a1,a4
80402aa0:	238000ef          	jal	ra,80402cd8 <free_pages>
80402aa4:	00040513          	mv	a0,s0
80402aa8:	00812403          	lw	s0,8(sp)
80402aac:	00c12083          	lw	ra,12(sp)
80402ab0:	00412483          	lw	s1,4(sp)
80402ab4:	00c00593          	li	a1,12
80402ab8:	01010113          	addi	sp,sp,16
80402abc:	97dff06f          	j	80402438 <slob_free>
80402ac0:	96cfe0ef          	jal	ra,80400c2c <intr_disable>
80402ac4:	0009a797          	auipc	a5,0x9a
80402ac8:	cd078793          	addi	a5,a5,-816 # 8049c794 <bigblocks>
80402acc:	0007a683          	lw	a3,0(a5)
80402ad0:	00068c63          	beqz	a3,80402ae8 <kfree+0x134>
80402ad4:	0046a783          	lw	a5,4(a3)
80402ad8:	0086a403          	lw	s0,8(a3)
80402adc:	00f48a63          	beq	s1,a5,80402af0 <kfree+0x13c>
80402ae0:	00100613          	li	a2,1
80402ae4:	f1dff06f          	j	80402a00 <kfree+0x4c>
80402ae8:	93cfe0ef          	jal	ra,80400c24 <intr_enable>
80402aec:	f35ff06f          	j	80402a20 <kfree+0x6c>
80402af0:	0009a797          	auipc	a5,0x9a
80402af4:	ca87a223          	sw	s0,-860(a5) # 8049c794 <bigblocks>
80402af8:	00068413          	mv	s0,a3
80402afc:	928fe0ef          	jal	ra,80400c24 <intr_enable>
80402b00:	f45ff06f          	j	80402a44 <kfree+0x90>
80402b04:	00008067          	ret
80402b08:	0009a797          	auipc	a5,0x9a
80402b0c:	c887a623          	sw	s0,-884(a5) # 8049c794 <bigblocks>
80402b10:	00068413          	mv	s0,a3
80402b14:	f31ff06f          	j	80402a44 <kfree+0x90>
80402b18:	00048693          	mv	a3,s1
80402b1c:	00011617          	auipc	a2,0x11
80402b20:	b0060613          	addi	a2,a2,-1280 # 8041361c <default_pmm_manager+0x64>
80402b24:	07000593          	li	a1,112
80402b28:	00011517          	auipc	a0,0x11
80402b2c:	ae450513          	addi	a0,a0,-1308 # 8041360c <default_pmm_manager+0x54>
80402b30:	af5fd0ef          	jal	ra,80400624 <__panic>
80402b34:	00011617          	auipc	a2,0x11
80402b38:	b0c60613          	addi	a2,a2,-1268 # 80413640 <default_pmm_manager+0x88>
80402b3c:	06900593          	li	a1,105
80402b40:	00011517          	auipc	a0,0x11
80402b44:	acc50513          	addi	a0,a0,-1332 # 8041360c <default_pmm_manager+0x54>
80402b48:	addfd0ef          	jal	ra,80400624 <__panic>

80402b4c <get_pgtable_items.isra.4.part.5>:
80402b4c:	04a5f063          	bgeu	a1,a0,80402b8c <get_pgtable_items.isra.4.part.5+0x40>
80402b50:	00259813          	slli	a6,a1,0x2
80402b54:	010608b3          	add	a7,a2,a6
80402b58:	0008a783          	lw	a5,0(a7)
80402b5c:	0017f793          	andi	a5,a5,1
80402b60:	02079c63          	bnez	a5,80402b98 <get_pgtable_items.isra.4.part.5+0x4c>
80402b64:	00480813          	addi	a6,a6,4
80402b68:	01060833          	add	a6,a2,a6
80402b6c:	0140006f          	j	80402b80 <get_pgtable_items.isra.4.part.5+0x34>
80402b70:	00082783          	lw	a5,0(a6)
80402b74:	00480813          	addi	a6,a6,4
80402b78:	0017f793          	andi	a5,a5,1
80402b7c:	00079e63          	bnez	a5,80402b98 <get_pgtable_items.isra.4.part.5+0x4c>
80402b80:	00158593          	addi	a1,a1,1
80402b84:	00080893          	mv	a7,a6
80402b88:	fea594e3          	bne	a1,a0,80402b70 <get_pgtable_items.isra.4.part.5+0x24>
80402b8c:	00000693          	li	a3,0
80402b90:	00068513          	mv	a0,a3
80402b94:	00008067          	ret
80402b98:	00b6a023          	sw	a1,0(a3)
80402b9c:	0008a683          	lw	a3,0(a7)
80402ba0:	00158593          	addi	a1,a1,1
80402ba4:	01f6f693          	andi	a3,a3,31
80402ba8:	02a5fe63          	bgeu	a1,a0,80402be4 <get_pgtable_items.isra.4.part.5+0x98>
80402bac:	00259793          	slli	a5,a1,0x2
80402bb0:	00f60833          	add	a6,a2,a5
80402bb4:	00082803          	lw	a6,0(a6)
80402bb8:	ffc78793          	addi	a5,a5,-4
80402bbc:	00f60633          	add	a2,a2,a5
80402bc0:	01f87813          	andi	a6,a6,31
80402bc4:	00d80c63          	beq	a6,a3,80402bdc <get_pgtable_items.isra.4.part.5+0x90>
80402bc8:	01c0006f          	j	80402be4 <get_pgtable_items.isra.4.part.5+0x98>
80402bcc:	00862783          	lw	a5,8(a2)
80402bd0:	00460613          	addi	a2,a2,4
80402bd4:	01f7f793          	andi	a5,a5,31
80402bd8:	00d79663          	bne	a5,a3,80402be4 <get_pgtable_items.isra.4.part.5+0x98>
80402bdc:	00158593          	addi	a1,a1,1
80402be0:	fea5e6e3          	bltu	a1,a0,80402bcc <get_pgtable_items.isra.4.part.5+0x80>
80402be4:	00b72023          	sw	a1,0(a4)
80402be8:	00068513          	mv	a0,a3
80402bec:	00008067          	ret

80402bf0 <pa2page.part.6>:
80402bf0:	ff010113          	addi	sp,sp,-16
80402bf4:	00011617          	auipc	a2,0x11
80402bf8:	a4c60613          	addi	a2,a2,-1460 # 80413640 <default_pmm_manager+0x88>
80402bfc:	06900593          	li	a1,105
80402c00:	00011517          	auipc	a0,0x11
80402c04:	a0c50513          	addi	a0,a0,-1524 # 8041360c <default_pmm_manager+0x54>
80402c08:	00112623          	sw	ra,12(sp)
80402c0c:	a19fd0ef          	jal	ra,80400624 <__panic>

80402c10 <alloc_pages>:
80402c10:	fd010113          	addi	sp,sp,-48
80402c14:	02812423          	sw	s0,40(sp)
80402c18:	02912223          	sw	s1,36(sp)
80402c1c:	03212023          	sw	s2,32(sp)
80402c20:	01312e23          	sw	s3,28(sp)
80402c24:	01412c23          	sw	s4,24(sp)
80402c28:	02112623          	sw	ra,44(sp)
80402c2c:	00050413          	mv	s0,a0
80402c30:	0009a497          	auipc	s1,0x9a
80402c34:	bd048493          	addi	s1,s1,-1072 # 8049c800 <pmm_manager>
80402c38:	00100913          	li	s2,1
80402c3c:	0009a997          	auipc	s3,0x9a
80402c40:	b6c98993          	addi	s3,s3,-1172 # 8049c7a8 <swap_init_ok>
80402c44:	0009aa17          	auipc	s4,0x9a
80402c48:	c70a0a13          	addi	s4,s4,-912 # 8049c8b4 <check_mm_struct>
80402c4c:	0300006f          	j	80402c7c <alloc_pages+0x6c>
80402c50:	0004a783          	lw	a5,0(s1)
80402c54:	00c7a783          	lw	a5,12(a5)
80402c58:	000780e7          	jalr	a5
80402c5c:	00000613          	li	a2,0
80402c60:	00040593          	mv	a1,s0
80402c64:	04051a63          	bnez	a0,80402cb8 <alloc_pages+0xa8>
80402c68:	04896863          	bltu	s2,s0,80402cb8 <alloc_pages+0xa8>
80402c6c:	0009a783          	lw	a5,0(s3)
80402c70:	04078463          	beqz	a5,80402cb8 <alloc_pages+0xa8>
80402c74:	000a2503          	lw	a0,0(s4)
80402c78:	22c010ef          	jal	ra,80403ea4 <swap_out>
80402c7c:	100027f3          	csrr	a5,sstatus
80402c80:	0027f793          	andi	a5,a5,2
80402c84:	00040513          	mv	a0,s0
80402c88:	fc0784e3          	beqz	a5,80402c50 <alloc_pages+0x40>
80402c8c:	fa1fd0ef          	jal	ra,80400c2c <intr_disable>
80402c90:	0004a783          	lw	a5,0(s1)
80402c94:	00040513          	mv	a0,s0
80402c98:	00c7a783          	lw	a5,12(a5)
80402c9c:	000780e7          	jalr	a5
80402ca0:	00a12623          	sw	a0,12(sp)
80402ca4:	f81fd0ef          	jal	ra,80400c24 <intr_enable>
80402ca8:	00c12503          	lw	a0,12(sp)
80402cac:	00000613          	li	a2,0
80402cb0:	00040593          	mv	a1,s0
80402cb4:	fa050ae3          	beqz	a0,80402c68 <alloc_pages+0x58>
80402cb8:	02c12083          	lw	ra,44(sp)
80402cbc:	02812403          	lw	s0,40(sp)
80402cc0:	02412483          	lw	s1,36(sp)
80402cc4:	02012903          	lw	s2,32(sp)
80402cc8:	01c12983          	lw	s3,28(sp)
80402ccc:	01812a03          	lw	s4,24(sp)
80402cd0:	03010113          	addi	sp,sp,48
80402cd4:	00008067          	ret

80402cd8 <free_pages>:
80402cd8:	100027f3          	csrr	a5,sstatus
80402cdc:	0027f793          	andi	a5,a5,2
80402ce0:	00079c63          	bnez	a5,80402cf8 <free_pages+0x20>
80402ce4:	0009a797          	auipc	a5,0x9a
80402ce8:	b1c78793          	addi	a5,a5,-1252 # 8049c800 <pmm_manager>
80402cec:	0007a783          	lw	a5,0(a5)
80402cf0:	0107a303          	lw	t1,16(a5)
80402cf4:	00030067          	jr	t1
80402cf8:	ff010113          	addi	sp,sp,-16
80402cfc:	00112623          	sw	ra,12(sp)
80402d00:	00812423          	sw	s0,8(sp)
80402d04:	00912223          	sw	s1,4(sp)
80402d08:	00050413          	mv	s0,a0
80402d0c:	00058493          	mv	s1,a1
80402d10:	f1dfd0ef          	jal	ra,80400c2c <intr_disable>
80402d14:	0009a797          	auipc	a5,0x9a
80402d18:	aec78793          	addi	a5,a5,-1300 # 8049c800 <pmm_manager>
80402d1c:	0007a783          	lw	a5,0(a5)
80402d20:	00048593          	mv	a1,s1
80402d24:	00040513          	mv	a0,s0
80402d28:	0107a783          	lw	a5,16(a5)
80402d2c:	000780e7          	jalr	a5
80402d30:	00812403          	lw	s0,8(sp)
80402d34:	00c12083          	lw	ra,12(sp)
80402d38:	00412483          	lw	s1,4(sp)
80402d3c:	01010113          	addi	sp,sp,16
80402d40:	ee5fd06f          	j	80400c24 <intr_enable>

80402d44 <nr_free_pages>:
80402d44:	100027f3          	csrr	a5,sstatus
80402d48:	0027f793          	andi	a5,a5,2
80402d4c:	00079c63          	bnez	a5,80402d64 <nr_free_pages+0x20>
80402d50:	0009a797          	auipc	a5,0x9a
80402d54:	ab078793          	addi	a5,a5,-1360 # 8049c800 <pmm_manager>
80402d58:	0007a783          	lw	a5,0(a5)
80402d5c:	0147a303          	lw	t1,20(a5)
80402d60:	00030067          	jr	t1
80402d64:	ff010113          	addi	sp,sp,-16
80402d68:	00112623          	sw	ra,12(sp)
80402d6c:	00812423          	sw	s0,8(sp)
80402d70:	ebdfd0ef          	jal	ra,80400c2c <intr_disable>
80402d74:	0009a797          	auipc	a5,0x9a
80402d78:	a8c78793          	addi	a5,a5,-1396 # 8049c800 <pmm_manager>
80402d7c:	0007a783          	lw	a5,0(a5)
80402d80:	0147a783          	lw	a5,20(a5)
80402d84:	000780e7          	jalr	a5
80402d88:	00050413          	mv	s0,a0
80402d8c:	e99fd0ef          	jal	ra,80400c24 <intr_enable>
80402d90:	00040513          	mv	a0,s0
80402d94:	00c12083          	lw	ra,12(sp)
80402d98:	00812403          	lw	s0,8(sp)
80402d9c:	01010113          	addi	sp,sp,16
80402da0:	00008067          	ret

80402da4 <get_pte>:
80402da4:	fe010113          	addi	sp,sp,-32
80402da8:	01212823          	sw	s2,16(sp)
80402dac:	0165d913          	srli	s2,a1,0x16
80402db0:	00291913          	slli	s2,s2,0x2
80402db4:	01250933          	add	s2,a0,s2
80402db8:	00092683          	lw	a3,0(s2)
80402dbc:	00912a23          	sw	s1,20(sp)
80402dc0:	01312623          	sw	s3,12(sp)
80402dc4:	00112e23          	sw	ra,28(sp)
80402dc8:	00812c23          	sw	s0,24(sp)
80402dcc:	01412423          	sw	s4,8(sp)
80402dd0:	01512223          	sw	s5,4(sp)
80402dd4:	0016f793          	andi	a5,a3,1
80402dd8:	00058493          	mv	s1,a1
80402ddc:	0009a997          	auipc	s3,0x9a
80402de0:	9c098993          	addi	s3,s3,-1600 # 8049c79c <npage>
80402de4:	08079863          	bnez	a5,80402e74 <get_pte+0xd0>
80402de8:	0e060463          	beqz	a2,80402ed0 <get_pte+0x12c>
80402dec:	00100513          	li	a0,1
80402df0:	e21ff0ef          	jal	ra,80402c10 <alloc_pages>
80402df4:	00050413          	mv	s0,a0
80402df8:	0c050c63          	beqz	a0,80402ed0 <get_pte+0x12c>
80402dfc:	0009aa97          	auipc	s5,0x9a
80402e00:	a10a8a93          	addi	s5,s5,-1520 # 8049c80c <pages>
80402e04:	000aa503          	lw	a0,0(s5)
80402e08:	00100793          	li	a5,1
80402e0c:	00f42023          	sw	a5,0(s0)
80402e10:	40a40533          	sub	a0,s0,a0
80402e14:	40555513          	srai	a0,a0,0x5
80402e18:	00080a37          	lui	s4,0x80
80402e1c:	0009a997          	auipc	s3,0x9a
80402e20:	98098993          	addi	s3,s3,-1664 # 8049c79c <npage>
80402e24:	01450533          	add	a0,a0,s4
80402e28:	0009a703          	lw	a4,0(s3)
80402e2c:	00c51793          	slli	a5,a0,0xc
80402e30:	00c7d793          	srli	a5,a5,0xc
80402e34:	00c51513          	slli	a0,a0,0xc
80402e38:	0ae7fc63          	bgeu	a5,a4,80402ef0 <get_pte+0x14c>
80402e3c:	0009a797          	auipc	a5,0x9a
80402e40:	9c878793          	addi	a5,a5,-1592 # 8049c804 <va_pa_offset>
80402e44:	0007a783          	lw	a5,0(a5)
80402e48:	00001637          	lui	a2,0x1
80402e4c:	00000593          	li	a1,0
80402e50:	00f50533          	add	a0,a0,a5
80402e54:	1e90f0ef          	jal	ra,8041283c <memset>
80402e58:	000aa683          	lw	a3,0(s5)
80402e5c:	40d406b3          	sub	a3,s0,a3
80402e60:	4056d693          	srai	a3,a3,0x5
80402e64:	014686b3          	add	a3,a3,s4
80402e68:	00a69693          	slli	a3,a3,0xa
80402e6c:	0d16e693          	ori	a3,a3,209
80402e70:	00d92023          	sw	a3,0(s2)
80402e74:	00269693          	slli	a3,a3,0x2
80402e78:	fffff537          	lui	a0,0xfffff
80402e7c:	0009a703          	lw	a4,0(s3)
80402e80:	00a6f6b3          	and	a3,a3,a0
80402e84:	00c6d793          	srli	a5,a3,0xc
80402e88:	04e7f863          	bgeu	a5,a4,80402ed8 <get_pte+0x134>
80402e8c:	0009a797          	auipc	a5,0x9a
80402e90:	97878793          	addi	a5,a5,-1672 # 8049c804 <va_pa_offset>
80402e94:	0007a503          	lw	a0,0(a5)
80402e98:	00c4d493          	srli	s1,s1,0xc
80402e9c:	3ff4f493          	andi	s1,s1,1023
80402ea0:	00a686b3          	add	a3,a3,a0
80402ea4:	00249513          	slli	a0,s1,0x2
80402ea8:	00a68533          	add	a0,a3,a0
80402eac:	01c12083          	lw	ra,28(sp)
80402eb0:	01812403          	lw	s0,24(sp)
80402eb4:	01412483          	lw	s1,20(sp)
80402eb8:	01012903          	lw	s2,16(sp)
80402ebc:	00c12983          	lw	s3,12(sp)
80402ec0:	00812a03          	lw	s4,8(sp)
80402ec4:	00412a83          	lw	s5,4(sp)
80402ec8:	02010113          	addi	sp,sp,32
80402ecc:	00008067          	ret
80402ed0:	00000513          	li	a0,0
80402ed4:	fd9ff06f          	j	80402eac <get_pte+0x108>
80402ed8:	00010617          	auipc	a2,0x10
80402edc:	71060613          	addi	a2,a2,1808 # 804135e8 <default_pmm_manager+0x30>
80402ee0:	12200593          	li	a1,290
80402ee4:	00011517          	auipc	a0,0x11
80402ee8:	8e050513          	addi	a0,a0,-1824 # 804137c4 <default_pmm_manager+0x20c>
80402eec:	f38fd0ef          	jal	ra,80400624 <__panic>
80402ef0:	00050693          	mv	a3,a0
80402ef4:	00010617          	auipc	a2,0x10
80402ef8:	6f460613          	addi	a2,a2,1780 # 804135e8 <default_pmm_manager+0x30>
80402efc:	11f00593          	li	a1,287
80402f00:	00011517          	auipc	a0,0x11
80402f04:	8c450513          	addi	a0,a0,-1852 # 804137c4 <default_pmm_manager+0x20c>
80402f08:	f1cfd0ef          	jal	ra,80400624 <__panic>

80402f0c <boot_map_segment>:
80402f0c:	000017b7          	lui	a5,0x1
80402f10:	fe010113          	addi	sp,sp,-32
80402f14:	00d5c833          	xor	a6,a1,a3
80402f18:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80402f1c:	00112e23          	sw	ra,28(sp)
80402f20:	00812c23          	sw	s0,24(sp)
80402f24:	00912a23          	sw	s1,20(sp)
80402f28:	01212823          	sw	s2,16(sp)
80402f2c:	01312623          	sw	s3,12(sp)
80402f30:	01412423          	sw	s4,8(sp)
80402f34:	01512223          	sw	s5,4(sp)
80402f38:	00f87833          	and	a6,a6,a5
80402f3c:	0a081463          	bnez	a6,80402fe4 <boot_map_segment+0xd8>
80402f40:	00f60633          	add	a2,a2,a5
80402f44:	fffff937          	lui	s2,0xfffff
80402f48:	00c65613          	srli	a2,a2,0xc
80402f4c:	0126f6b3          	and	a3,a3,s2
80402f50:	00c61613          	slli	a2,a2,0xc
80402f54:	00050993          	mv	s3,a0
80402f58:	00070a13          	mv	s4,a4
80402f5c:	00058413          	mv	s0,a1
80402f60:	00b604b3          	add	s1,a2,a1
80402f64:	40b68933          	sub	s2,a3,a1
80402f68:	00001ab7          	lui	s5,0x1
80402f6c:	00100613          	li	a2,1
80402f70:	00040593          	mv	a1,s0
80402f74:	00098513          	mv	a0,s3
80402f78:	e2dff0ef          	jal	ra,80402da4 <get_pte>
80402f7c:	008907b3          	add	a5,s2,s0
80402f80:	04050263          	beqz	a0,80402fc4 <boot_map_segment+0xb8>
80402f84:	00c7d793          	srli	a5,a5,0xc
80402f88:	00a79793          	slli	a5,a5,0xa
80402f8c:	0147e7b3          	or	a5,a5,s4
80402f90:	0c17e793          	ori	a5,a5,193
80402f94:	00f52023          	sw	a5,0(a0)
80402f98:	01540433          	add	s0,s0,s5
80402f9c:	fc8498e3          	bne	s1,s0,80402f6c <boot_map_segment+0x60>
80402fa0:	01c12083          	lw	ra,28(sp)
80402fa4:	01812403          	lw	s0,24(sp)
80402fa8:	01412483          	lw	s1,20(sp)
80402fac:	01012903          	lw	s2,16(sp)
80402fb0:	00c12983          	lw	s3,12(sp)
80402fb4:	00812a03          	lw	s4,8(sp)
80402fb8:	00412a83          	lw	s5,4(sp)
80402fbc:	02010113          	addi	sp,sp,32
80402fc0:	00008067          	ret
80402fc4:	00010697          	auipc	a3,0x10
80402fc8:	77068693          	addi	a3,a3,1904 # 80413734 <default_pmm_manager+0x17c>
80402fcc:	00010617          	auipc	a2,0x10
80402fd0:	ca060613          	addi	a2,a2,-864 # 80412c6c <commands+0x1bc>
80402fd4:	0aa00593          	li	a1,170
80402fd8:	00010517          	auipc	a0,0x10
80402fdc:	7ec50513          	addi	a0,a0,2028 # 804137c4 <default_pmm_manager+0x20c>
80402fe0:	e44fd0ef          	jal	ra,80400624 <__panic>
80402fe4:	00010697          	auipc	a3,0x10
80402fe8:	73868693          	addi	a3,a3,1848 # 8041371c <default_pmm_manager+0x164>
80402fec:	00010617          	auipc	a2,0x10
80402ff0:	c8060613          	addi	a2,a2,-896 # 80412c6c <commands+0x1bc>
80402ff4:	0a400593          	li	a1,164
80402ff8:	00010517          	auipc	a0,0x10
80402ffc:	7cc50513          	addi	a0,a0,1996 # 804137c4 <default_pmm_manager+0x20c>
80403000:	e24fd0ef          	jal	ra,80400624 <__panic>

80403004 <unmap_range>:
80403004:	fd010113          	addi	sp,sp,-48
80403008:	00c5e7b3          	or	a5,a1,a2
8040300c:	02112623          	sw	ra,44(sp)
80403010:	02812423          	sw	s0,40(sp)
80403014:	02912223          	sw	s1,36(sp)
80403018:	03212023          	sw	s2,32(sp)
8040301c:	01312e23          	sw	s3,28(sp)
80403020:	01412c23          	sw	s4,24(sp)
80403024:	01512a23          	sw	s5,20(sp)
80403028:	01612823          	sw	s6,16(sp)
8040302c:	01712623          	sw	s7,12(sp)
80403030:	01812423          	sw	s8,8(sp)
80403034:	01912223          	sw	s9,4(sp)
80403038:	01479713          	slli	a4,a5,0x14
8040303c:	12071463          	bnez	a4,80403164 <unmap_range+0x160>
80403040:	002007b7          	lui	a5,0x200
80403044:	00058413          	mv	s0,a1
80403048:	0ef5ee63          	bltu	a1,a5,80403144 <unmap_range+0x140>
8040304c:	00060913          	mv	s2,a2
80403050:	0ec5fa63          	bgeu	a1,a2,80403144 <unmap_range+0x140>
80403054:	800007b7          	lui	a5,0x80000
80403058:	0ec7e663          	bltu	a5,a2,80403144 <unmap_range+0x140>
8040305c:	00050993          	mv	s3,a0
80403060:	00001a37          	lui	s4,0x1
80403064:	00099c97          	auipc	s9,0x99
80403068:	738c8c93          	addi	s9,s9,1848 # 8049c79c <npage>
8040306c:	00099c17          	auipc	s8,0x99
80403070:	7a0c0c13          	addi	s8,s8,1952 # 8049c80c <pages>
80403074:	fff80bb7          	lui	s7,0xfff80
80403078:	00400b37          	lui	s6,0x400
8040307c:	ffc00ab7          	lui	s5,0xffc00
80403080:	00000613          	li	a2,0
80403084:	00040593          	mv	a1,s0
80403088:	00098513          	mv	a0,s3
8040308c:	d19ff0ef          	jal	ra,80402da4 <get_pte>
80403090:	00050493          	mv	s1,a0
80403094:	08050863          	beqz	a0,80403124 <unmap_range+0x120>
80403098:	00052783          	lw	a5,0(a0)
8040309c:	04079063          	bnez	a5,804030dc <unmap_range+0xd8>
804030a0:	01440433          	add	s0,s0,s4
804030a4:	fd246ee3          	bltu	s0,s2,80403080 <unmap_range+0x7c>
804030a8:	02c12083          	lw	ra,44(sp)
804030ac:	02812403          	lw	s0,40(sp)
804030b0:	02412483          	lw	s1,36(sp)
804030b4:	02012903          	lw	s2,32(sp)
804030b8:	01c12983          	lw	s3,28(sp)
804030bc:	01812a03          	lw	s4,24(sp)
804030c0:	01412a83          	lw	s5,20(sp)
804030c4:	01012b03          	lw	s6,16(sp)
804030c8:	00c12b83          	lw	s7,12(sp)
804030cc:	00812c03          	lw	s8,8(sp)
804030d0:	00412c83          	lw	s9,4(sp)
804030d4:	03010113          	addi	sp,sp,48
804030d8:	00008067          	ret
804030dc:	0017f713          	andi	a4,a5,1
804030e0:	fc0700e3          	beqz	a4,804030a0 <unmap_range+0x9c>
804030e4:	000ca703          	lw	a4,0(s9)
804030e8:	00279793          	slli	a5,a5,0x2
804030ec:	00c7d793          	srli	a5,a5,0xc
804030f0:	08e7fa63          	bgeu	a5,a4,80403184 <unmap_range+0x180>
804030f4:	000c2503          	lw	a0,0(s8)
804030f8:	017787b3          	add	a5,a5,s7
804030fc:	00579793          	slli	a5,a5,0x5
80403100:	00f50533          	add	a0,a0,a5
80403104:	00052783          	lw	a5,0(a0)
80403108:	fff78793          	addi	a5,a5,-1 # 7fffffff <end+0xffb6373f>
8040310c:	00f52023          	sw	a5,0(a0)
80403110:	02078463          	beqz	a5,80403138 <unmap_range+0x134>
80403114:	0004a023          	sw	zero,0(s1)
80403118:	12040073          	sfence.vma	s0
8040311c:	01440433          	add	s0,s0,s4
80403120:	f85ff06f          	j	804030a4 <unmap_range+0xa0>
80403124:	01640433          	add	s0,s0,s6
80403128:	01547433          	and	s0,s0,s5
8040312c:	f6040ee3          	beqz	s0,804030a8 <unmap_range+0xa4>
80403130:	f52468e3          	bltu	s0,s2,80403080 <unmap_range+0x7c>
80403134:	f75ff06f          	j	804030a8 <unmap_range+0xa4>
80403138:	00100593          	li	a1,1
8040313c:	b9dff0ef          	jal	ra,80402cd8 <free_pages>
80403140:	fd5ff06f          	j	80403114 <unmap_range+0x110>
80403144:	00010697          	auipc	a3,0x10
80403148:	7f068693          	addi	a3,a3,2032 # 80413934 <default_pmm_manager+0x37c>
8040314c:	00010617          	auipc	a2,0x10
80403150:	b2060613          	addi	a2,a2,-1248 # 80412c6c <commands+0x1bc>
80403154:	15a00593          	li	a1,346
80403158:	00010517          	auipc	a0,0x10
8040315c:	66c50513          	addi	a0,a0,1644 # 804137c4 <default_pmm_manager+0x20c>
80403160:	cc4fd0ef          	jal	ra,80400624 <__panic>
80403164:	00010697          	auipc	a3,0x10
80403168:	7a468693          	addi	a3,a3,1956 # 80413908 <default_pmm_manager+0x350>
8040316c:	00010617          	auipc	a2,0x10
80403170:	b0060613          	addi	a2,a2,-1280 # 80412c6c <commands+0x1bc>
80403174:	15900593          	li	a1,345
80403178:	00010517          	auipc	a0,0x10
8040317c:	64c50513          	addi	a0,a0,1612 # 804137c4 <default_pmm_manager+0x20c>
80403180:	ca4fd0ef          	jal	ra,80400624 <__panic>
80403184:	a6dff0ef          	jal	ra,80402bf0 <pa2page.part.6>

80403188 <exit_range>:
80403188:	fd010113          	addi	sp,sp,-48
8040318c:	00c5e7b3          	or	a5,a1,a2
80403190:	02112623          	sw	ra,44(sp)
80403194:	02812423          	sw	s0,40(sp)
80403198:	02912223          	sw	s1,36(sp)
8040319c:	03212023          	sw	s2,32(sp)
804031a0:	01312e23          	sw	s3,28(sp)
804031a4:	01412c23          	sw	s4,24(sp)
804031a8:	01512a23          	sw	s5,20(sp)
804031ac:	01612823          	sw	s6,16(sp)
804031b0:	01712623          	sw	s7,12(sp)
804031b4:	01479713          	slli	a4,a5,0x14
804031b8:	0e071c63          	bnez	a4,804032b0 <exit_range+0x128>
804031bc:	002007b7          	lui	a5,0x200
804031c0:	0cf5e863          	bltu	a1,a5,80403290 <exit_range+0x108>
804031c4:	00060913          	mv	s2,a2
804031c8:	0cc5f463          	bgeu	a1,a2,80403290 <exit_range+0x108>
804031cc:	ffc004b7          	lui	s1,0xffc00
804031d0:	800007b7          	lui	a5,0x80000
804031d4:	0095f4b3          	and	s1,a1,s1
804031d8:	0ac7ec63          	bltu	a5,a2,80403290 <exit_range+0x108>
804031dc:	00050a13          	mv	s4,a0
804031e0:	00099b17          	auipc	s6,0x99
804031e4:	5bcb0b13          	addi	s6,s6,1468 # 8049c79c <npage>
804031e8:	00099b97          	auipc	s7,0x99
804031ec:	624b8b93          	addi	s7,s7,1572 # 8049c80c <pages>
804031f0:	fff809b7          	lui	s3,0xfff80
804031f4:	00400ab7          	lui	s5,0x400
804031f8:	0080006f          	j	80403200 <exit_range+0x78>
804031fc:	0524f863          	bgeu	s1,s2,8040324c <exit_range+0xc4>
80403200:	0164d413          	srli	s0,s1,0x16
80403204:	00241413          	slli	s0,s0,0x2
80403208:	008a0433          	add	s0,s4,s0
8040320c:	00042783          	lw	a5,0(s0)
80403210:	0017f713          	andi	a4,a5,1
80403214:	02070863          	beqz	a4,80403244 <exit_range+0xbc>
80403218:	000b2703          	lw	a4,0(s6)
8040321c:	00279793          	slli	a5,a5,0x2
80403220:	00c7d793          	srli	a5,a5,0xc
80403224:	04e7fa63          	bgeu	a5,a4,80403278 <exit_range+0xf0>
80403228:	000ba503          	lw	a0,0(s7)
8040322c:	013787b3          	add	a5,a5,s3
80403230:	00579793          	slli	a5,a5,0x5
80403234:	00100593          	li	a1,1
80403238:	00f50533          	add	a0,a0,a5
8040323c:	a9dff0ef          	jal	ra,80402cd8 <free_pages>
80403240:	00042023          	sw	zero,0(s0)
80403244:	015484b3          	add	s1,s1,s5
80403248:	fa049ae3          	bnez	s1,804031fc <exit_range+0x74>
8040324c:	02c12083          	lw	ra,44(sp)
80403250:	02812403          	lw	s0,40(sp)
80403254:	02412483          	lw	s1,36(sp)
80403258:	02012903          	lw	s2,32(sp)
8040325c:	01c12983          	lw	s3,28(sp)
80403260:	01812a03          	lw	s4,24(sp)
80403264:	01412a83          	lw	s5,20(sp)
80403268:	01012b03          	lw	s6,16(sp)
8040326c:	00c12b83          	lw	s7,12(sp)
80403270:	03010113          	addi	sp,sp,48
80403274:	00008067          	ret
80403278:	00010617          	auipc	a2,0x10
8040327c:	3c860613          	addi	a2,a2,968 # 80413640 <default_pmm_manager+0x88>
80403280:	06900593          	li	a1,105
80403284:	00010517          	auipc	a0,0x10
80403288:	38850513          	addi	a0,a0,904 # 8041360c <default_pmm_manager+0x54>
8040328c:	b98fd0ef          	jal	ra,80400624 <__panic>
80403290:	00010697          	auipc	a3,0x10
80403294:	6a468693          	addi	a3,a3,1700 # 80413934 <default_pmm_manager+0x37c>
80403298:	00010617          	auipc	a2,0x10
8040329c:	9d460613          	addi	a2,a2,-1580 # 80412c6c <commands+0x1bc>
804032a0:	16b00593          	li	a1,363
804032a4:	00010517          	auipc	a0,0x10
804032a8:	52050513          	addi	a0,a0,1312 # 804137c4 <default_pmm_manager+0x20c>
804032ac:	b78fd0ef          	jal	ra,80400624 <__panic>
804032b0:	00010697          	auipc	a3,0x10
804032b4:	65868693          	addi	a3,a3,1624 # 80413908 <default_pmm_manager+0x350>
804032b8:	00010617          	auipc	a2,0x10
804032bc:	9b460613          	addi	a2,a2,-1612 # 80412c6c <commands+0x1bc>
804032c0:	16a00593          	li	a1,362
804032c4:	00010517          	auipc	a0,0x10
804032c8:	50050513          	addi	a0,a0,1280 # 804137c4 <default_pmm_manager+0x20c>
804032cc:	b58fd0ef          	jal	ra,80400624 <__panic>

804032d0 <page_insert>:
804032d0:	fe010113          	addi	sp,sp,-32
804032d4:	01312623          	sw	s3,12(sp)
804032d8:	00060993          	mv	s3,a2
804032dc:	00812c23          	sw	s0,24(sp)
804032e0:	00100613          	li	a2,1
804032e4:	00058413          	mv	s0,a1
804032e8:	00098593          	mv	a1,s3
804032ec:	01212823          	sw	s2,16(sp)
804032f0:	00112e23          	sw	ra,28(sp)
804032f4:	00912a23          	sw	s1,20(sp)
804032f8:	01412423          	sw	s4,8(sp)
804032fc:	00068913          	mv	s2,a3
80403300:	aa5ff0ef          	jal	ra,80402da4 <get_pte>
80403304:	0e050063          	beqz	a0,804033e4 <page_insert+0x114>
80403308:	00042683          	lw	a3,0(s0)
8040330c:	00050493          	mv	s1,a0
80403310:	00168793          	addi	a5,a3,1
80403314:	00f42023          	sw	a5,0(s0)
80403318:	00052783          	lw	a5,0(a0)
8040331c:	0017f713          	andi	a4,a5,1
80403320:	04071c63          	bnez	a4,80403378 <page_insert+0xa8>
80403324:	00099797          	auipc	a5,0x99
80403328:	4e878793          	addi	a5,a5,1256 # 8049c80c <pages>
8040332c:	0007a703          	lw	a4,0(a5)
80403330:	40e40433          	sub	s0,s0,a4
80403334:	000806b7          	lui	a3,0x80
80403338:	40545413          	srai	s0,s0,0x5
8040333c:	00d40433          	add	s0,s0,a3
80403340:	00a41413          	slli	s0,s0,0xa
80403344:	01246433          	or	s0,s0,s2
80403348:	0c146413          	ori	s0,s0,193
8040334c:	0084a023          	sw	s0,0(s1) # ffc00000 <end+0x7f763740>
80403350:	12098073          	sfence.vma	s3
80403354:	00000513          	li	a0,0
80403358:	01c12083          	lw	ra,28(sp)
8040335c:	01812403          	lw	s0,24(sp)
80403360:	01412483          	lw	s1,20(sp)
80403364:	01012903          	lw	s2,16(sp)
80403368:	00c12983          	lw	s3,12(sp)
8040336c:	00812a03          	lw	s4,8(sp)
80403370:	02010113          	addi	sp,sp,32
80403374:	00008067          	ret
80403378:	00099717          	auipc	a4,0x99
8040337c:	42470713          	addi	a4,a4,1060 # 8049c79c <npage>
80403380:	00072703          	lw	a4,0(a4)
80403384:	00279793          	slli	a5,a5,0x2
80403388:	00c7d793          	srli	a5,a5,0xc
8040338c:	06e7f063          	bgeu	a5,a4,804033ec <page_insert+0x11c>
80403390:	00099a17          	auipc	s4,0x99
80403394:	47ca0a13          	addi	s4,s4,1148 # 8049c80c <pages>
80403398:	000a2703          	lw	a4,0(s4)
8040339c:	fff80537          	lui	a0,0xfff80
804033a0:	00a78533          	add	a0,a5,a0
804033a4:	00551513          	slli	a0,a0,0x5
804033a8:	00a70533          	add	a0,a4,a0
804033ac:	00a40e63          	beq	s0,a0,804033c8 <page_insert+0xf8>
804033b0:	00052783          	lw	a5,0(a0) # fff80000 <end+0x7fae3740>
804033b4:	fff78793          	addi	a5,a5,-1
804033b8:	00f52023          	sw	a5,0(a0)
804033bc:	00078a63          	beqz	a5,804033d0 <page_insert+0x100>
804033c0:	12098073          	sfence.vma	s3
804033c4:	f6dff06f          	j	80403330 <page_insert+0x60>
804033c8:	00d42023          	sw	a3,0(s0)
804033cc:	f65ff06f          	j	80403330 <page_insert+0x60>
804033d0:	00100593          	li	a1,1
804033d4:	905ff0ef          	jal	ra,80402cd8 <free_pages>
804033d8:	000a2703          	lw	a4,0(s4)
804033dc:	12098073          	sfence.vma	s3
804033e0:	f51ff06f          	j	80403330 <page_insert+0x60>
804033e4:	ffc00513          	li	a0,-4
804033e8:	f71ff06f          	j	80403358 <page_insert+0x88>
804033ec:	805ff0ef          	jal	ra,80402bf0 <pa2page.part.6>

804033f0 <copy_range>:
804033f0:	fc010113          	addi	sp,sp,-64
804033f4:	00d66733          	or	a4,a2,a3
804033f8:	02112e23          	sw	ra,60(sp)
804033fc:	02812c23          	sw	s0,56(sp)
80403400:	02912a23          	sw	s1,52(sp)
80403404:	03212823          	sw	s2,48(sp)
80403408:	03312623          	sw	s3,44(sp)
8040340c:	03412423          	sw	s4,40(sp)
80403410:	03512223          	sw	s5,36(sp)
80403414:	03612023          	sw	s6,32(sp)
80403418:	01712e23          	sw	s7,28(sp)
8040341c:	01812c23          	sw	s8,24(sp)
80403420:	01912a23          	sw	s9,20(sp)
80403424:	01a12823          	sw	s10,16(sp)
80403428:	01b12623          	sw	s11,12(sp)
8040342c:	01471793          	slli	a5,a4,0x14
80403430:	2c079063          	bnez	a5,804036f0 <copy_range+0x300>
80403434:	00200737          	lui	a4,0x200
80403438:	00060d13          	mv	s10,a2
8040343c:	1ee66463          	bltu	a2,a4,80403624 <copy_range+0x234>
80403440:	00068493          	mv	s1,a3
80403444:	1ed67063          	bgeu	a2,a3,80403624 <copy_range+0x234>
80403448:	80000737          	lui	a4,0x80000
8040344c:	1cd76c63          	bltu	a4,a3,80403624 <copy_range+0x234>
80403450:	00100b37          	lui	s6,0x100
80403454:	00050b93          	mv	s7,a0
80403458:	00058993          	mv	s3,a1
8040345c:	00001a37          	lui	s4,0x1
80403460:	00099c17          	auipc	s8,0x99
80403464:	33cc0c13          	addi	s8,s8,828 # 8049c79c <npage>
80403468:	00099a97          	auipc	s5,0x99
8040346c:	3a4a8a93          	addi	s5,s5,932 # 8049c80c <pages>
80403470:	00080937          	lui	s2,0x80
80403474:	fffb0b13          	addi	s6,s6,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
80403478:	00000613          	li	a2,0
8040347c:	000d0593          	mv	a1,s10
80403480:	00098513          	mv	a0,s3
80403484:	921ff0ef          	jal	ra,80402da4 <get_pte>
80403488:	00050413          	mv	s0,a0
8040348c:	14050e63          	beqz	a0,804035e8 <copy_range+0x1f8>
80403490:	00052703          	lw	a4,0(a0)
80403494:	00177713          	andi	a4,a4,1
80403498:	04071663          	bnez	a4,804034e4 <copy_range+0xf4>
8040349c:	014d0d33          	add	s10,s10,s4
804034a0:	fc9d6ce3          	bltu	s10,s1,80403478 <copy_range+0x88>
804034a4:	00000513          	li	a0,0
804034a8:	03c12083          	lw	ra,60(sp)
804034ac:	03812403          	lw	s0,56(sp)
804034b0:	03412483          	lw	s1,52(sp)
804034b4:	03012903          	lw	s2,48(sp)
804034b8:	02c12983          	lw	s3,44(sp)
804034bc:	02812a03          	lw	s4,40(sp)
804034c0:	02412a83          	lw	s5,36(sp)
804034c4:	02012b03          	lw	s6,32(sp)
804034c8:	01c12b83          	lw	s7,28(sp)
804034cc:	01812c03          	lw	s8,24(sp)
804034d0:	01412c83          	lw	s9,20(sp)
804034d4:	01012d03          	lw	s10,16(sp)
804034d8:	00c12d83          	lw	s11,12(sp)
804034dc:	04010113          	addi	sp,sp,64
804034e0:	00008067          	ret
804034e4:	00100613          	li	a2,1
804034e8:	000d0593          	mv	a1,s10
804034ec:	000b8513          	mv	a0,s7
804034f0:	8b5ff0ef          	jal	ra,80402da4 <get_pte>
804034f4:	10050863          	beqz	a0,80403604 <copy_range+0x214>
804034f8:	00042703          	lw	a4,0(s0)
804034fc:	00177693          	andi	a3,a4,1
80403500:	01f77c93          	andi	s9,a4,31
80403504:	10068463          	beqz	a3,8040360c <copy_range+0x21c>
80403508:	000c2683          	lw	a3,0(s8)
8040350c:	00271713          	slli	a4,a4,0x2
80403510:	00c75713          	srli	a4,a4,0xc
80403514:	1cd77263          	bgeu	a4,a3,804036d8 <copy_range+0x2e8>
80403518:	000aa403          	lw	s0,0(s5)
8040351c:	fff807b7          	lui	a5,0xfff80
80403520:	00f70733          	add	a4,a4,a5
80403524:	00571713          	slli	a4,a4,0x5
80403528:	00100513          	li	a0,1
8040352c:	00e40433          	add	s0,s0,a4
80403530:	ee0ff0ef          	jal	ra,80402c10 <alloc_pages>
80403534:	00050d93          	mv	s11,a0
80403538:	18040063          	beqz	s0,804036b8 <copy_range+0x2c8>
8040353c:	14050e63          	beqz	a0,80403698 <copy_range+0x2a8>
80403540:	000aa703          	lw	a4,0(s5)
80403544:	000c2603          	lw	a2,0(s8)
80403548:	40e406b3          	sub	a3,s0,a4
8040354c:	4056d693          	srai	a3,a3,0x5
80403550:	012686b3          	add	a3,a3,s2
80403554:	0166f533          	and	a0,a3,s6
80403558:	00c69593          	slli	a1,a3,0xc
8040355c:	12c57063          	bgeu	a0,a2,8040367c <copy_range+0x28c>
80403560:	40ed86b3          	sub	a3,s11,a4
80403564:	00099797          	auipc	a5,0x99
80403568:	2a078793          	addi	a5,a5,672 # 8049c804 <va_pa_offset>
8040356c:	0007a503          	lw	a0,0(a5)
80403570:	4056d693          	srai	a3,a3,0x5
80403574:	012686b3          	add	a3,a3,s2
80403578:	0166f733          	and	a4,a3,s6
8040357c:	00a585b3          	add	a1,a1,a0
80403580:	00c69693          	slli	a3,a3,0xc
80403584:	0ec77063          	bgeu	a4,a2,80403664 <copy_range+0x274>
80403588:	00001637          	lui	a2,0x1
8040358c:	00a68533          	add	a0,a3,a0
80403590:	31c0f0ef          	jal	ra,804128ac <memcpy>
80403594:	000c8693          	mv	a3,s9
80403598:	000d0613          	mv	a2,s10
8040359c:	000d8593          	mv	a1,s11
804035a0:	000b8513          	mv	a0,s7
804035a4:	d2dff0ef          	jal	ra,804032d0 <page_insert>
804035a8:	08051e63          	bnez	a0,80403644 <copy_range+0x254>
804035ac:	000aa603          	lw	a2,0(s5)
804035b0:	000d0593          	mv	a1,s10
804035b4:	00010517          	auipc	a0,0x10
804035b8:	1e050513          	addi	a0,a0,480 # 80413794 <default_pmm_manager+0x1dc>
804035bc:	40cd86b3          	sub	a3,s11,a2
804035c0:	40c40633          	sub	a2,s0,a2
804035c4:	4056d693          	srai	a3,a3,0x5
804035c8:	40565613          	srai	a2,a2,0x5
804035cc:	012686b3          	add	a3,a3,s2
804035d0:	01260633          	add	a2,a2,s2
804035d4:	00c69693          	slli	a3,a3,0xc
804035d8:	00c61613          	slli	a2,a2,0xc
804035dc:	c21fc0ef          	jal	ra,804001fc <cprintf>
804035e0:	014d0d33          	add	s10,s10,s4
804035e4:	ebdff06f          	j	804034a0 <copy_range+0xb0>
804035e8:	00400737          	lui	a4,0x400
804035ec:	00ed07b3          	add	a5,s10,a4
804035f0:	ffc00737          	lui	a4,0xffc00
804035f4:	00e7fd33          	and	s10,a5,a4
804035f8:	ea0d06e3          	beqz	s10,804034a4 <copy_range+0xb4>
804035fc:	e69d6ee3          	bltu	s10,s1,80403478 <copy_range+0x88>
80403600:	ea5ff06f          	j	804034a4 <copy_range+0xb4>
80403604:	ffc00513          	li	a0,-4
80403608:	ea1ff06f          	j	804034a8 <copy_range+0xb8>
8040360c:	00010617          	auipc	a2,0x10
80403610:	13860613          	addi	a2,a2,312 # 80413744 <default_pmm_manager+0x18c>
80403614:	07400593          	li	a1,116
80403618:	00010517          	auipc	a0,0x10
8040361c:	ff450513          	addi	a0,a0,-12 # 8041360c <default_pmm_manager+0x54>
80403620:	804fd0ef          	jal	ra,80400624 <__panic>
80403624:	00010697          	auipc	a3,0x10
80403628:	31068693          	addi	a3,a3,784 # 80413934 <default_pmm_manager+0x37c>
8040362c:	0000f617          	auipc	a2,0xf
80403630:	64060613          	addi	a2,a2,1600 # 80412c6c <commands+0x1bc>
80403634:	18300593          	li	a1,387
80403638:	00010517          	auipc	a0,0x10
8040363c:	18c50513          	addi	a0,a0,396 # 804137c4 <default_pmm_manager+0x20c>
80403640:	fe5fc0ef          	jal	ra,80400624 <__panic>
80403644:	00010697          	auipc	a3,0x10
80403648:	14468693          	addi	a3,a3,324 # 80413788 <default_pmm_manager+0x1d0>
8040364c:	0000f617          	auipc	a2,0xf
80403650:	62060613          	addi	a2,a2,1568 # 80412c6c <commands+0x1bc>
80403654:	1b200593          	li	a1,434
80403658:	00010517          	auipc	a0,0x10
8040365c:	16c50513          	addi	a0,a0,364 # 804137c4 <default_pmm_manager+0x20c>
80403660:	fc5fc0ef          	jal	ra,80400624 <__panic>
80403664:	00010617          	auipc	a2,0x10
80403668:	f8460613          	addi	a2,a2,-124 # 804135e8 <default_pmm_manager+0x30>
8040366c:	06e00593          	li	a1,110
80403670:	00010517          	auipc	a0,0x10
80403674:	f9c50513          	addi	a0,a0,-100 # 8041360c <default_pmm_manager+0x54>
80403678:	fadfc0ef          	jal	ra,80400624 <__panic>
8040367c:	00058693          	mv	a3,a1
80403680:	00010617          	auipc	a2,0x10
80403684:	f6860613          	addi	a2,a2,-152 # 804135e8 <default_pmm_manager+0x30>
80403688:	06e00593          	li	a1,110
8040368c:	00010517          	auipc	a0,0x10
80403690:	f8050513          	addi	a0,a0,-128 # 8041360c <default_pmm_manager+0x54>
80403694:	f91fc0ef          	jal	ra,80400624 <__panic>
80403698:	00010697          	auipc	a3,0x10
8040369c:	0e068693          	addi	a3,a3,224 # 80413778 <default_pmm_manager+0x1c0>
804036a0:	0000f617          	auipc	a2,0xf
804036a4:	5cc60613          	addi	a2,a2,1484 # 80412c6c <commands+0x1bc>
804036a8:	19800593          	li	a1,408
804036ac:	00010517          	auipc	a0,0x10
804036b0:	11850513          	addi	a0,a0,280 # 804137c4 <default_pmm_manager+0x20c>
804036b4:	f71fc0ef          	jal	ra,80400624 <__panic>
804036b8:	00010697          	auipc	a3,0x10
804036bc:	0b068693          	addi	a3,a3,176 # 80413768 <default_pmm_manager+0x1b0>
804036c0:	0000f617          	auipc	a2,0xf
804036c4:	5ac60613          	addi	a2,a2,1452 # 80412c6c <commands+0x1bc>
804036c8:	19700593          	li	a1,407
804036cc:	00010517          	auipc	a0,0x10
804036d0:	0f850513          	addi	a0,a0,248 # 804137c4 <default_pmm_manager+0x20c>
804036d4:	f51fc0ef          	jal	ra,80400624 <__panic>
804036d8:	00010617          	auipc	a2,0x10
804036dc:	f6860613          	addi	a2,a2,-152 # 80413640 <default_pmm_manager+0x88>
804036e0:	06900593          	li	a1,105
804036e4:	00010517          	auipc	a0,0x10
804036e8:	f2850513          	addi	a0,a0,-216 # 8041360c <default_pmm_manager+0x54>
804036ec:	f39fc0ef          	jal	ra,80400624 <__panic>
804036f0:	00010697          	auipc	a3,0x10
804036f4:	21868693          	addi	a3,a3,536 # 80413908 <default_pmm_manager+0x350>
804036f8:	0000f617          	auipc	a2,0xf
804036fc:	57460613          	addi	a2,a2,1396 # 80412c6c <commands+0x1bc>
80403700:	18200593          	li	a1,386
80403704:	00010517          	auipc	a0,0x10
80403708:	0c050513          	addi	a0,a0,192 # 804137c4 <default_pmm_manager+0x20c>
8040370c:	f19fc0ef          	jal	ra,80400624 <__panic>

80403710 <tlb_invalidate>:
80403710:	12058073          	sfence.vma	a1
80403714:	00008067          	ret

80403718 <pgdir_alloc_page>:
80403718:	fe010113          	addi	sp,sp,-32
8040371c:	01212823          	sw	s2,16(sp)
80403720:	00050913          	mv	s2,a0
80403724:	00100513          	li	a0,1
80403728:	00812c23          	sw	s0,24(sp)
8040372c:	00912a23          	sw	s1,20(sp)
80403730:	01312623          	sw	s3,12(sp)
80403734:	00112e23          	sw	ra,28(sp)
80403738:	00058493          	mv	s1,a1
8040373c:	00060993          	mv	s3,a2
80403740:	cd0ff0ef          	jal	ra,80402c10 <alloc_pages>
80403744:	00050413          	mv	s0,a0
80403748:	04050e63          	beqz	a0,804037a4 <pgdir_alloc_page+0x8c>
8040374c:	00050593          	mv	a1,a0
80403750:	00098693          	mv	a3,s3
80403754:	00048613          	mv	a2,s1
80403758:	00090513          	mv	a0,s2
8040375c:	b75ff0ef          	jal	ra,804032d0 <page_insert>
80403760:	06051263          	bnez	a0,804037c4 <pgdir_alloc_page+0xac>
80403764:	00099797          	auipc	a5,0x99
80403768:	04478793          	addi	a5,a5,68 # 8049c7a8 <swap_init_ok>
8040376c:	0007a783          	lw	a5,0(a5)
80403770:	02078a63          	beqz	a5,804037a4 <pgdir_alloc_page+0x8c>
80403774:	00099797          	auipc	a5,0x99
80403778:	14078793          	addi	a5,a5,320 # 8049c8b4 <check_mm_struct>
8040377c:	0007a503          	lw	a0,0(a5)
80403780:	02050263          	beqz	a0,804037a4 <pgdir_alloc_page+0x8c>
80403784:	00000693          	li	a3,0
80403788:	00040613          	mv	a2,s0
8040378c:	00048593          	mv	a1,s1
80403790:	700000ef          	jal	ra,80403e90 <swap_map_swappable>
80403794:	00042703          	lw	a4,0(s0)
80403798:	00942e23          	sw	s1,28(s0)
8040379c:	00100793          	li	a5,1
804037a0:	02f71c63          	bne	a4,a5,804037d8 <pgdir_alloc_page+0xc0>
804037a4:	00040513          	mv	a0,s0
804037a8:	01c12083          	lw	ra,28(sp)
804037ac:	01812403          	lw	s0,24(sp)
804037b0:	01412483          	lw	s1,20(sp)
804037b4:	01012903          	lw	s2,16(sp)
804037b8:	00c12983          	lw	s3,12(sp)
804037bc:	02010113          	addi	sp,sp,32
804037c0:	00008067          	ret
804037c4:	00040513          	mv	a0,s0
804037c8:	00100593          	li	a1,1
804037cc:	d0cff0ef          	jal	ra,80402cd8 <free_pages>
804037d0:	00000413          	li	s0,0
804037d4:	fd1ff06f          	j	804037a4 <pgdir_alloc_page+0x8c>
804037d8:	00010697          	auipc	a3,0x10
804037dc:	ffc68693          	addi	a3,a3,-4 # 804137d4 <default_pmm_manager+0x21c>
804037e0:	0000f617          	auipc	a2,0xf
804037e4:	48c60613          	addi	a2,a2,1164 # 80412c6c <commands+0x1bc>
804037e8:	1f200593          	li	a1,498
804037ec:	00010517          	auipc	a0,0x10
804037f0:	fd850513          	addi	a0,a0,-40 # 804137c4 <default_pmm_manager+0x20c>
804037f4:	e31fc0ef          	jal	ra,80400624 <__panic>

804037f8 <print_pgdir>:
804037f8:	fa010113          	addi	sp,sp,-96
804037fc:	00010517          	auipc	a0,0x10
80403800:	06050513          	addi	a0,a0,96 # 8041385c <default_pmm_manager+0x2a4>
80403804:	05512223          	sw	s5,68(sp)
80403808:	04112e23          	sw	ra,92(sp)
8040380c:	04812c23          	sw	s0,88(sp)
80403810:	04912a23          	sw	s1,84(sp)
80403814:	05212823          	sw	s2,80(sp)
80403818:	05312623          	sw	s3,76(sp)
8040381c:	05412423          	sw	s4,72(sp)
80403820:	05612023          	sw	s6,64(sp)
80403824:	03712e23          	sw	s7,60(sp)
80403828:	03812c23          	sw	s8,56(sp)
8040382c:	03912a23          	sw	s9,52(sp)
80403830:	03a12823          	sw	s10,48(sp)
80403834:	03b12623          	sw	s11,44(sp)
80403838:	9c5fc0ef          	jal	ra,804001fc <cprintf>
8040383c:	00000593          	li	a1,0
80403840:	00012a23          	sw	zero,20(sp)
80403844:	00099a97          	auipc	s5,0x99
80403848:	fc0a8a93          	addi	s5,s5,-64 # 8049c804 <va_pa_offset>
8040384c:	01410713          	addi	a4,sp,20
80403850:	01010693          	addi	a3,sp,16
80403854:	fafec637          	lui	a2,0xfafec
80403858:	40000513          	li	a0,1024
8040385c:	af0ff0ef          	jal	ra,80402b4c <get_pgtable_items.isra.4.part.5>
80403860:	00050493          	mv	s1,a0
80403864:	08050663          	beqz	a0,804038f0 <print_pgdir+0xf8>
80403868:	01412683          	lw	a3,20(sp)
8040386c:	01012603          	lw	a2,16(sp)
80403870:	01b49313          	slli	t1,s1,0x1b
80403874:	01d49813          	slli	a6,s1,0x1d
80403878:	41f35313          	srai	t1,t1,0x1f
8040387c:	41f85813          	srai	a6,a6,0x1f
80403880:	04837313          	andi	t1,t1,72
80403884:	40c685b3          	sub	a1,a3,a2
80403888:	02d30313          	addi	t1,t1,45
8040388c:	04a87813          	andi	a6,a6,74
80403890:	02d80813          	addi	a6,a6,45
80403894:	00099797          	auipc	a5,0x99
80403898:	f0c78793          	addi	a5,a5,-244 # 8049c7a0 <str.2046>
8040389c:	00099897          	auipc	a7,0x99
804038a0:	f0688223          	sb	t1,-252(a7) # 8049c7a0 <str.2046>
804038a4:	01659713          	slli	a4,a1,0x16
804038a8:	07200313          	li	t1,114
804038ac:	01669693          	slli	a3,a3,0x16
804038b0:	01661613          	slli	a2,a2,0x16
804038b4:	00010517          	auipc	a0,0x10
804038b8:	fdc50513          	addi	a0,a0,-36 # 80413890 <default_pmm_manager+0x2d8>
804038bc:	00099897          	auipc	a7,0x99
804038c0:	ef088323          	sb	a6,-282(a7) # 8049c7a2 <str.2046+0x2>
804038c4:	00099897          	auipc	a7,0x99
804038c8:	ec688ea3          	sb	t1,-291(a7) # 8049c7a1 <str.2046+0x1>
804038cc:	00099817          	auipc	a6,0x99
804038d0:	ec080ba3          	sb	zero,-297(a6) # 8049c7a3 <str.2046+0x3>
804038d4:	929fc0ef          	jal	ra,804001fc <cprintf>
804038d8:	00f4f493          	andi	s1,s1,15
804038dc:	00100793          	li	a5,1
804038e0:	04f48c63          	beq	s1,a5,80403938 <print_pgdir+0x140>
804038e4:	01412583          	lw	a1,20(sp)
804038e8:	3ff00793          	li	a5,1023
804038ec:	f6b7f0e3          	bgeu	a5,a1,8040384c <print_pgdir+0x54>
804038f0:	00010517          	auipc	a0,0x10
804038f4:	fe450513          	addi	a0,a0,-28 # 804138d4 <default_pmm_manager+0x31c>
804038f8:	905fc0ef          	jal	ra,804001fc <cprintf>
804038fc:	05c12083          	lw	ra,92(sp)
80403900:	05812403          	lw	s0,88(sp)
80403904:	05412483          	lw	s1,84(sp)
80403908:	05012903          	lw	s2,80(sp)
8040390c:	04c12983          	lw	s3,76(sp)
80403910:	04812a03          	lw	s4,72(sp)
80403914:	04412a83          	lw	s5,68(sp)
80403918:	04012b03          	lw	s6,64(sp)
8040391c:	03c12b83          	lw	s7,60(sp)
80403920:	03812c03          	lw	s8,56(sp)
80403924:	03412c83          	lw	s9,52(sp)
80403928:	03012d03          	lw	s10,48(sp)
8040392c:	02c12d83          	lw	s11,44(sp)
80403930:	06010113          	addi	sp,sp,96
80403934:	00008067          	ret
80403938:	01012783          	lw	a5,16(sp)
8040393c:	01412583          	lw	a1,20(sp)
80403940:	00000d93          	li	s11,0
80403944:	00a79313          	slli	t1,a5,0xa
80403948:	00f12423          	sw	a5,8(sp)
8040394c:	fafec7b7          	lui	a5,0xfafec
80403950:	ffc78793          	addi	a5,a5,-4 # fafebffc <end+0x7ab4f73c>
80403954:	00f12623          	sw	a5,12(sp)
80403958:	00812783          	lw	a5,8(sp)
8040395c:	00612e23          	sw	t1,28(sp)
80403960:	40030c93          	addi	s9,t1,1024
80403964:	12b7fe63          	bgeu	a5,a1,80403aa0 <print_pgdir+0x2a8>
80403968:	00c12703          	lw	a4,12(sp)
8040396c:	00178793          	addi	a5,a5,1
80403970:	00279493          	slli	s1,a5,0x2
80403974:	00e484b3          	add	s1,s1,a4
80403978:	0004a603          	lw	a2,0(s1)
8040397c:	00099a17          	auipc	s4,0x99
80403980:	e20a0a13          	addi	s4,s4,-480 # 8049c79c <npage>
80403984:	fffff9b7          	lui	s3,0xfffff
80403988:	00261613          	slli	a2,a2,0x2
8040398c:	000a2703          	lw	a4,0(s4)
80403990:	00f12423          	sw	a5,8(sp)
80403994:	00001937          	lui	s2,0x1
80403998:	00c79793          	slli	a5,a5,0xc
8040399c:	01367633          	and	a2,a2,s3
804039a0:	40f90933          	sub	s2,s2,a5
804039a4:	00c65793          	srli	a5,a2,0xc
804039a8:	01c12583          	lw	a1,28(sp)
804039ac:	07200c13          	li	s8,114
804039b0:	00099b97          	auipc	s7,0x99
804039b4:	df0b8b93          	addi	s7,s7,-528 # 8049c7a0 <str.2046>
804039b8:	0ae7fe63          	bgeu	a5,a4,80403a74 <print_pgdir+0x27c>
804039bc:	000aa683          	lw	a3,0(s5)
804039c0:	00d60633          	add	a2,a2,a3
804039c4:	01260633          	add	a2,a2,s2
804039c8:	0d95f463          	bgeu	a1,s9,80403a90 <print_pgdir+0x298>
804039cc:	01c10713          	addi	a4,sp,28
804039d0:	01810693          	addi	a3,sp,24
804039d4:	000c8513          	mv	a0,s9
804039d8:	974ff0ef          	jal	ra,80402b4c <get_pgtable_items.isra.4.part.5>
804039dc:	00050b13          	mv	s6,a0
804039e0:	0a050863          	beqz	a0,80403a90 <print_pgdir+0x298>
804039e4:	12ad8663          	beq	s11,a0,80403b10 <print_pgdir+0x318>
804039e8:	060d8263          	beqz	s11,80403a4c <print_pgdir+0x254>
804039ec:	01bd9e13          	slli	t3,s11,0x1b
804039f0:	01dd9d93          	slli	s11,s11,0x1d
804039f4:	41fe5e13          	srai	t3,t3,0x1f
804039f8:	41fddd93          	srai	s11,s11,0x1f
804039fc:	408d05b3          	sub	a1,s10,s0
80403a00:	048e7e13          	andi	t3,t3,72
80403a04:	04adfd93          	andi	s11,s11,74
80403a08:	02de0e13          	addi	t3,t3,45
80403a0c:	02dd8d93          	addi	s11,s11,45
80403a10:	000b8793          	mv	a5,s7
80403a14:	00c59713          	slli	a4,a1,0xc
80403a18:	00cd1693          	slli	a3,s10,0xc
80403a1c:	00c41613          	slli	a2,s0,0xc
80403a20:	00010517          	auipc	a0,0x10
80403a24:	e9050513          	addi	a0,a0,-368 # 804138b0 <default_pmm_manager+0x2f8>
80403a28:	00099817          	auipc	a6,0x99
80403a2c:	d7c80c23          	sb	t3,-648(a6) # 8049c7a0 <str.2046>
80403a30:	00099817          	auipc	a6,0x99
80403a34:	d78808a3          	sb	s8,-655(a6) # 8049c7a1 <str.2046+0x1>
80403a38:	00099817          	auipc	a6,0x99
80403a3c:	d7b80523          	sb	s11,-662(a6) # 8049c7a2 <str.2046+0x2>
80403a40:	00099817          	auipc	a6,0x99
80403a44:	d60801a3          	sb	zero,-669(a6) # 8049c7a3 <str.2046+0x3>
80403a48:	fb4fc0ef          	jal	ra,804001fc <cprintf>
80403a4c:	01c12d03          	lw	s10,28(sp)
80403a50:	01812403          	lw	s0,24(sp)
80403a54:	000b0d93          	mv	s11,s6
80403a58:	000d0593          	mv	a1,s10
80403a5c:	0004a603          	lw	a2,0(s1)
80403a60:	000a2703          	lw	a4,0(s4)
80403a64:	00261613          	slli	a2,a2,0x2
80403a68:	01367633          	and	a2,a2,s3
80403a6c:	00c65793          	srli	a5,a2,0xc
80403a70:	f4e7e6e3          	bltu	a5,a4,804039bc <print_pgdir+0x1c4>
80403a74:	00060693          	mv	a3,a2
80403a78:	2a000593          	li	a1,672
80403a7c:	00010617          	auipc	a2,0x10
80403a80:	b6c60613          	addi	a2,a2,-1172 # 804135e8 <default_pmm_manager+0x30>
80403a84:	00010517          	auipc	a0,0x10
80403a88:	d4050513          	addi	a0,a0,-704 # 804137c4 <default_pmm_manager+0x20c>
80403a8c:	b99fc0ef          	jal	ra,80400624 <__panic>
80403a90:	01412583          	lw	a1,20(sp)
80403a94:	00812783          	lw	a5,8(sp)
80403a98:	400c8c93          	addi	s9,s9,1024
80403a9c:	ecb7e6e3          	bltu	a5,a1,80403968 <print_pgdir+0x170>
80403aa0:	e40d84e3          	beqz	s11,804038e8 <print_pgdir+0xf0>
80403aa4:	01bd9313          	slli	t1,s11,0x1b
80403aa8:	01dd9813          	slli	a6,s11,0x1d
80403aac:	41f35313          	srai	t1,t1,0x1f
80403ab0:	41f85813          	srai	a6,a6,0x1f
80403ab4:	04837313          	andi	t1,t1,72
80403ab8:	408d05b3          	sub	a1,s10,s0
80403abc:	02d30313          	addi	t1,t1,45
80403ac0:	04a87813          	andi	a6,a6,74
80403ac4:	02d80813          	addi	a6,a6,45
80403ac8:	00099897          	auipc	a7,0x99
80403acc:	cc688c23          	sb	t1,-808(a7) # 8049c7a0 <str.2046>
80403ad0:	00099797          	auipc	a5,0x99
80403ad4:	cd078793          	addi	a5,a5,-816 # 8049c7a0 <str.2046>
80403ad8:	07200313          	li	t1,114
80403adc:	00c59713          	slli	a4,a1,0xc
80403ae0:	00cd1693          	slli	a3,s10,0xc
80403ae4:	00c41613          	slli	a2,s0,0xc
80403ae8:	00010517          	auipc	a0,0x10
80403aec:	dc850513          	addi	a0,a0,-568 # 804138b0 <default_pmm_manager+0x2f8>
80403af0:	00099897          	auipc	a7,0x99
80403af4:	cb088923          	sb	a6,-846(a7) # 8049c7a2 <str.2046+0x2>
80403af8:	00099897          	auipc	a7,0x99
80403afc:	ca6884a3          	sb	t1,-855(a7) # 8049c7a1 <str.2046+0x1>
80403b00:	00099817          	auipc	a6,0x99
80403b04:	ca0801a3          	sb	zero,-861(a6) # 8049c7a3 <str.2046+0x3>
80403b08:	ef4fc0ef          	jal	ra,804001fc <cprintf>
80403b0c:	dd9ff06f          	j	804038e4 <print_pgdir+0xec>
80403b10:	01c12d03          	lw	s10,28(sp)
80403b14:	000d0593          	mv	a1,s10
80403b18:	f45ff06f          	j	80403a5c <print_pgdir+0x264>

80403b1c <pmm_init>:
80403b1c:	00010797          	auipc	a5,0x10
80403b20:	a9c78793          	addi	a5,a5,-1380 # 804135b8 <default_pmm_manager>
80403b24:	0007a583          	lw	a1,0(a5)
80403b28:	ff010113          	addi	sp,sp,-16
80403b2c:	00010517          	auipc	a0,0x10
80403b30:	cbc50513          	addi	a0,a0,-836 # 804137e8 <default_pmm_manager+0x230>
80403b34:	00112623          	sw	ra,12(sp)
80403b38:	00812423          	sw	s0,8(sp)
80403b3c:	00912223          	sw	s1,4(sp)
80403b40:	00099717          	auipc	a4,0x99
80403b44:	ccf72023          	sw	a5,-832(a4) # 8049c800 <pmm_manager>
80403b48:	00099417          	auipc	s0,0x99
80403b4c:	cb840413          	addi	s0,s0,-840 # 8049c800 <pmm_manager>
80403b50:	eacfc0ef          	jal	ra,804001fc <cprintf>
80403b54:	00042783          	lw	a5,0(s0)
80403b58:	ffffc497          	auipc	s1,0xffffc
80403b5c:	4a848493          	addi	s1,s1,1192 # 80400000 <kern_entry>
80403b60:	0047a783          	lw	a5,4(a5)
80403b64:	000780e7          	jalr	a5
80403b68:	804007b7          	lui	a5,0x80400
80403b6c:	409787b3          	sub	a5,a5,s1
80403b70:	00010517          	auipc	a0,0x10
80403b74:	c9050513          	addi	a0,a0,-880 # 80413800 <default_pmm_manager+0x248>
80403b78:	00099717          	auipc	a4,0x99
80403b7c:	c8f72623          	sw	a5,-884(a4) # 8049c804 <va_pa_offset>
80403b80:	e7cfc0ef          	jal	ra,804001fc <cprintf>
80403b84:	808005b7          	lui	a1,0x80800
80403b88:	fff58693          	addi	a3,a1,-1 # 807fffff <end+0x36373f>
80403b8c:	00048613          	mv	a2,s1
80403b90:	409585b3          	sub	a1,a1,s1
80403b94:	00010517          	auipc	a0,0x10
80403b98:	c8450513          	addi	a0,a0,-892 # 80413818 <default_pmm_manager+0x260>
80403b9c:	e60fc0ef          	jal	ra,804001fc <cprintf>
80403ba0:	fffff7b7          	lui	a5,0xfffff
80403ba4:	0009a697          	auipc	a3,0x9a
80403ba8:	d1b68693          	addi	a3,a3,-741 # 8049d8bf <end+0xfff>
80403bac:	00f6f6b3          	and	a3,a3,a5
80403bb0:	000817b7          	lui	a5,0x81
80403bb4:	80078793          	addi	a5,a5,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403bb8:	00099717          	auipc	a4,0x99
80403bbc:	bef72223          	sw	a5,-1052(a4) # 8049c79c <npage>
80403bc0:	00099797          	auipc	a5,0x99
80403bc4:	c4d7a623          	sw	a3,-948(a5) # 8049c80c <pages>
80403bc8:	000107b7          	lui	a5,0x10
80403bcc:	00068513          	mv	a0,a3
80403bd0:	00f687b3          	add	a5,a3,a5
80403bd4:	0046a703          	lw	a4,4(a3)
80403bd8:	02068693          	addi	a3,a3,32
80403bdc:	00176713          	ori	a4,a4,1
80403be0:	fee6a223          	sw	a4,-28(a3)
80403be4:	fef698e3          	bne	a3,a5,80403bd4 <pmm_init+0xb8>
80403be8:	804007b7          	lui	a5,0x80400
80403bec:	16f6ea63          	bltu	a3,a5,80403d60 <pmm_init+0x244>
80403bf0:	00099497          	auipc	s1,0x99
80403bf4:	c1448493          	addi	s1,s1,-1004 # 8049c804 <va_pa_offset>
80403bf8:	0004a783          	lw	a5,0(s1)
80403bfc:	808005b7          	lui	a1,0x80800
80403c00:	40f686b3          	sub	a3,a3,a5
80403c04:	10b6e863          	bltu	a3,a1,80403d14 <pmm_init+0x1f8>
80403c08:	00100513          	li	a0,1
80403c0c:	804ff0ef          	jal	ra,80402c10 <alloc_pages>
80403c10:	18050e63          	beqz	a0,80403dac <pmm_init+0x290>
80403c14:	00099797          	auipc	a5,0x99
80403c18:	bf878793          	addi	a5,a5,-1032 # 8049c80c <pages>
80403c1c:	0007a683          	lw	a3,0(a5)
80403c20:	00099797          	auipc	a5,0x99
80403c24:	b7c78793          	addi	a5,a5,-1156 # 8049c79c <npage>
80403c28:	0007a703          	lw	a4,0(a5)
80403c2c:	40d506b3          	sub	a3,a0,a3
80403c30:	4056d693          	srai	a3,a3,0x5
80403c34:	00080537          	lui	a0,0x80
80403c38:	00a686b3          	add	a3,a3,a0
80403c3c:	00c69793          	slli	a5,a3,0xc
80403c40:	00c7d793          	srli	a5,a5,0xc
80403c44:	00c69693          	slli	a3,a3,0xc
80403c48:	14e7f663          	bgeu	a5,a4,80403d94 <pmm_init+0x278>
80403c4c:	0004a783          	lw	a5,0(s1)
80403c50:	00001637          	lui	a2,0x1
80403c54:	00000593          	li	a1,0
80403c58:	00f686b3          	add	a3,a3,a5
80403c5c:	00068513          	mv	a0,a3
80403c60:	00099417          	auipc	s0,0x99
80403c64:	b3840413          	addi	s0,s0,-1224 # 8049c798 <boot_pgdir>
80403c68:	00099797          	auipc	a5,0x99
80403c6c:	b2d7a823          	sw	a3,-1232(a5) # 8049c798 <boot_pgdir>
80403c70:	3cd0e0ef          	jal	ra,8041283c <memset>
80403c74:	00042503          	lw	a0,0(s0)
80403c78:	80400637          	lui	a2,0x80400
80403c7c:	0ec56e63          	bltu	a0,a2,80403d78 <pmm_init+0x25c>
80403c80:	0004a683          	lw	a3,0(s1)
80403c84:	00001737          	lui	a4,0x1
80403c88:	00e50733          	add	a4,a0,a4
80403c8c:	40d50833          	sub	a6,a0,a3
80403c90:	00c85793          	srli	a5,a6,0xc
80403c94:	00a79793          	slli	a5,a5,0xa
80403c98:	0c17e593          	ori	a1,a5,193
80403c9c:	0c77e793          	ori	a5,a5,199
80403ca0:	faf72823          	sw	a5,-80(a4) # fb0 <_binary_bin_swap_img_size-0x7050>
80403ca4:	40d606b3          	sub	a3,a2,a3
80403ca8:	fab72623          	sw	a1,-84(a4)
80403cac:	00800637          	lui	a2,0x800
80403cb0:	00f00713          	li	a4,15
80403cb4:	804005b7          	lui	a1,0x80400
80403cb8:	00099797          	auipc	a5,0x99
80403cbc:	b507a823          	sw	a6,-1200(a5) # 8049c808 <boot_cr3>
80403cc0:	a4cff0ef          	jal	ra,80402f0c <boot_map_segment>
80403cc4:	00042503          	lw	a0,0(s0)
80403cc8:	00700713          	li	a4,7
80403ccc:	100006b7          	lui	a3,0x10000
80403cd0:	00001637          	lui	a2,0x1
80403cd4:	100005b7          	lui	a1,0x10000
80403cd8:	a34ff0ef          	jal	ra,80402f0c <boot_map_segment>
80403cdc:	00099797          	auipc	a5,0x99
80403ce0:	b2c78793          	addi	a5,a5,-1236 # 8049c808 <boot_cr3>
80403ce4:	0007a783          	lw	a5,0(a5)
80403ce8:	80000737          	lui	a4,0x80000
80403cec:	00c7d793          	srli	a5,a5,0xc
80403cf0:	00e7e7b3          	or	a5,a5,a4
80403cf4:	18079073          	csrw	satp,a5
80403cf8:	12000073          	sfence.vma
80403cfc:	afdff0ef          	jal	ra,804037f8 <print_pgdir>
80403d00:	00812403          	lw	s0,8(sp)
80403d04:	00c12083          	lw	ra,12(sp)
80403d08:	00412483          	lw	s1,4(sp)
80403d0c:	01010113          	addi	sp,sp,16
80403d10:	b59fe06f          	j	80402868 <kmalloc_init>
80403d14:	000017b7          	lui	a5,0x1
80403d18:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403d1c:	00f686b3          	add	a3,a3,a5
80403d20:	00081737          	lui	a4,0x81
80403d24:	00c6d793          	srli	a5,a3,0xc
80403d28:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403d2c:	08e78c63          	beq	a5,a4,80403dc4 <pmm_init+0x2a8>
80403d30:	00042703          	lw	a4,0(s0)
80403d34:	fffff637          	lui	a2,0xfffff
80403d38:	00c6f6b3          	and	a3,a3,a2
80403d3c:	fff80637          	lui	a2,0xfff80
80403d40:	00c787b3          	add	a5,a5,a2
80403d44:	00872703          	lw	a4,8(a4)
80403d48:	40d585b3          	sub	a1,a1,a3
80403d4c:	00579793          	slli	a5,a5,0x5
80403d50:	00c5d593          	srli	a1,a1,0xc
80403d54:	00f50533          	add	a0,a0,a5
80403d58:	000700e7          	jalr	a4
80403d5c:	eadff06f          	j	80403c08 <pmm_init+0xec>
80403d60:	00010617          	auipc	a2,0x10
80403d64:	8bc60613          	addi	a2,a2,-1860 # 8041361c <default_pmm_manager+0x64>
80403d68:	08e00593          	li	a1,142
80403d6c:	00010517          	auipc	a0,0x10
80403d70:	a5850513          	addi	a0,a0,-1448 # 804137c4 <default_pmm_manager+0x20c>
80403d74:	8b1fc0ef          	jal	ra,80400624 <__panic>
80403d78:	00050693          	mv	a3,a0
80403d7c:	00010617          	auipc	a2,0x10
80403d80:	8a060613          	addi	a2,a2,-1888 # 8041361c <default_pmm_manager+0x64>
80403d84:	0d400593          	li	a1,212
80403d88:	00010517          	auipc	a0,0x10
80403d8c:	a3c50513          	addi	a0,a0,-1476 # 804137c4 <default_pmm_manager+0x20c>
80403d90:	895fc0ef          	jal	ra,80400624 <__panic>
80403d94:	00010617          	auipc	a2,0x10
80403d98:	85460613          	addi	a2,a2,-1964 # 804135e8 <default_pmm_manager+0x30>
80403d9c:	06e00593          	li	a1,110
80403da0:	00010517          	auipc	a0,0x10
80403da4:	86c50513          	addi	a0,a0,-1940 # 8041360c <default_pmm_manager+0x54>
80403da8:	87dfc0ef          	jal	ra,80400624 <__panic>
80403dac:	00010617          	auipc	a2,0x10
80403db0:	a9460613          	addi	a2,a2,-1388 # 80413840 <default_pmm_manager+0x288>
80403db4:	0b600593          	li	a1,182
80403db8:	00010517          	auipc	a0,0x10
80403dbc:	a0c50513          	addi	a0,a0,-1524 # 804137c4 <default_pmm_manager+0x20c>
80403dc0:	865fc0ef          	jal	ra,80400624 <__panic>
80403dc4:	e2dfe0ef          	jal	ra,80402bf0 <pa2page.part.6>

80403dc8 <swap_init>:
80403dc8:	ff010113          	addi	sp,sp,-16
80403dcc:	00112623          	sw	ra,12(sp)
80403dd0:	00812423          	sw	s0,8(sp)
80403dd4:	400090ef          	jal	ra,8040d1d4 <swapfs_init>
80403dd8:	00099797          	auipc	a5,0x99
80403ddc:	aac78793          	addi	a5,a5,-1364 # 8049c884 <max_swap_offset>
80403de0:	0007a683          	lw	a3,0(a5)
80403de4:	010007b7          	lui	a5,0x1000
80403de8:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf87ff8>
80403dec:	ff968713          	addi	a4,a3,-7 # ffffff9 <_binary_bin_sfs_img_size+0xff87ff9>
80403df0:	06e7ea63          	bltu	a5,a4,80403e64 <swap_init+0x9c>
80403df4:	00095797          	auipc	a5,0x95
80403df8:	20c78793          	addi	a5,a5,524 # 80499000 <swap_manager_fifo>
80403dfc:	0047a703          	lw	a4,4(a5)
80403e00:	00099697          	auipc	a3,0x99
80403e04:	9af6a223          	sw	a5,-1628(a3) # 8049c7a4 <sm>
80403e08:	000700e7          	jalr	a4
80403e0c:	00050413          	mv	s0,a0
80403e10:	00050c63          	beqz	a0,80403e28 <swap_init+0x60>
80403e14:	00040513          	mv	a0,s0
80403e18:	00c12083          	lw	ra,12(sp)
80403e1c:	00812403          	lw	s0,8(sp)
80403e20:	01010113          	addi	sp,sp,16
80403e24:	00008067          	ret
80403e28:	00099797          	auipc	a5,0x99
80403e2c:	97c78793          	addi	a5,a5,-1668 # 8049c7a4 <sm>
80403e30:	0007a783          	lw	a5,0(a5)
80403e34:	00010517          	auipc	a0,0x10
80403e38:	b9450513          	addi	a0,a0,-1132 # 804139c8 <default_pmm_manager+0x410>
80403e3c:	0007a583          	lw	a1,0(a5)
80403e40:	00100793          	li	a5,1
80403e44:	00099717          	auipc	a4,0x99
80403e48:	96f72223          	sw	a5,-1692(a4) # 8049c7a8 <swap_init_ok>
80403e4c:	bb0fc0ef          	jal	ra,804001fc <cprintf>
80403e50:	00040513          	mv	a0,s0
80403e54:	00c12083          	lw	ra,12(sp)
80403e58:	00812403          	lw	s0,8(sp)
80403e5c:	01010113          	addi	sp,sp,16
80403e60:	00008067          	ret
80403e64:	00010617          	auipc	a2,0x10
80403e68:	b3860613          	addi	a2,a2,-1224 # 8041399c <default_pmm_manager+0x3e4>
80403e6c:	02500593          	li	a1,37
80403e70:	00010517          	auipc	a0,0x10
80403e74:	b4850513          	addi	a0,a0,-1208 # 804139b8 <default_pmm_manager+0x400>
80403e78:	facfc0ef          	jal	ra,80400624 <__panic>

80403e7c <swap_init_mm>:
80403e7c:	00099797          	auipc	a5,0x99
80403e80:	92878793          	addi	a5,a5,-1752 # 8049c7a4 <sm>
80403e84:	0007a783          	lw	a5,0(a5)
80403e88:	0087a303          	lw	t1,8(a5)
80403e8c:	00030067          	jr	t1

80403e90 <swap_map_swappable>:
80403e90:	00099797          	auipc	a5,0x99
80403e94:	91478793          	addi	a5,a5,-1772 # 8049c7a4 <sm>
80403e98:	0007a783          	lw	a5,0(a5)
80403e9c:	0107a303          	lw	t1,16(a5)
80403ea0:	00030067          	jr	t1

80403ea4 <swap_out>:
80403ea4:	fc010113          	addi	sp,sp,-64
80403ea8:	02112e23          	sw	ra,60(sp)
80403eac:	02812c23          	sw	s0,56(sp)
80403eb0:	02912a23          	sw	s1,52(sp)
80403eb4:	03212823          	sw	s2,48(sp)
80403eb8:	03312623          	sw	s3,44(sp)
80403ebc:	03412423          	sw	s4,40(sp)
80403ec0:	03512223          	sw	s5,36(sp)
80403ec4:	03612023          	sw	s6,32(sp)
80403ec8:	01712e23          	sw	s7,28(sp)
80403ecc:	01812c23          	sw	s8,24(sp)
80403ed0:	14058c63          	beqz	a1,80404028 <swap_out+0x184>
80403ed4:	00060a93          	mv	s5,a2
80403ed8:	00050913          	mv	s2,a0
80403edc:	00058a13          	mv	s4,a1
80403ee0:	00000413          	li	s0,0
80403ee4:	00099997          	auipc	s3,0x99
80403ee8:	8c098993          	addi	s3,s3,-1856 # 8049c7a4 <sm>
80403eec:	00010b17          	auipc	s6,0x10
80403ef0:	b50b0b13          	addi	s6,s6,-1200 # 80413a3c <default_pmm_manager+0x484>
80403ef4:	00010b97          	auipc	s7,0x10
80403ef8:	b30b8b93          	addi	s7,s7,-1232 # 80413a24 <default_pmm_manager+0x46c>
80403efc:	0580006f          	j	80403f54 <swap_out+0xb0>
80403f00:	00c12783          	lw	a5,12(sp)
80403f04:	00048613          	mv	a2,s1
80403f08:	00040593          	mv	a1,s0
80403f0c:	01c7a683          	lw	a3,28(a5)
80403f10:	000b0513          	mv	a0,s6
80403f14:	00140413          	addi	s0,s0,1
80403f18:	00c6d693          	srli	a3,a3,0xc
80403f1c:	00168693          	addi	a3,a3,1
80403f20:	adcfc0ef          	jal	ra,804001fc <cprintf>
80403f24:	00c12503          	lw	a0,12(sp)
80403f28:	00100593          	li	a1,1
80403f2c:	01c52783          	lw	a5,28(a0)
80403f30:	00c7d793          	srli	a5,a5,0xc
80403f34:	00178793          	addi	a5,a5,1
80403f38:	00879793          	slli	a5,a5,0x8
80403f3c:	00fc2023          	sw	a5,0(s8)
80403f40:	d99fe0ef          	jal	ra,80402cd8 <free_pages>
80403f44:	00c92503          	lw	a0,12(s2) # 100c <_binary_bin_swap_img_size-0x6ff4>
80403f48:	00048593          	mv	a1,s1
80403f4c:	fc4ff0ef          	jal	ra,80403710 <tlb_invalidate>
80403f50:	088a0863          	beq	s4,s0,80403fe0 <swap_out+0x13c>
80403f54:	0009a783          	lw	a5,0(s3)
80403f58:	000a8613          	mv	a2,s5
80403f5c:	00c10593          	addi	a1,sp,12
80403f60:	0187a783          	lw	a5,24(a5)
80403f64:	00090513          	mv	a0,s2
80403f68:	000780e7          	jalr	a5
80403f6c:	0a051463          	bnez	a0,80404014 <swap_out+0x170>
80403f70:	00c12783          	lw	a5,12(sp)
80403f74:	00c92503          	lw	a0,12(s2)
80403f78:	00000613          	li	a2,0
80403f7c:	01c7a483          	lw	s1,28(a5)
80403f80:	00048593          	mv	a1,s1
80403f84:	e21fe0ef          	jal	ra,80402da4 <get_pte>
80403f88:	00052783          	lw	a5,0(a0)
80403f8c:	00050c13          	mv	s8,a0
80403f90:	0017f793          	andi	a5,a5,1
80403f94:	08078e63          	beqz	a5,80404030 <swap_out+0x18c>
80403f98:	00c12583          	lw	a1,12(sp)
80403f9c:	01c5a783          	lw	a5,28(a1) # 1000001c <_binary_bin_sfs_img_size+0xff8801c>
80403fa0:	00c7d793          	srli	a5,a5,0xc
80403fa4:	00178513          	addi	a0,a5,1
80403fa8:	00851513          	slli	a0,a0,0x8
80403fac:	334090ef          	jal	ra,8040d2e0 <swapfs_write>
80403fb0:	f40508e3          	beqz	a0,80403f00 <swap_out+0x5c>
80403fb4:	000b8513          	mv	a0,s7
80403fb8:	a44fc0ef          	jal	ra,804001fc <cprintf>
80403fbc:	0009a783          	lw	a5,0(s3)
80403fc0:	00c12603          	lw	a2,12(sp)
80403fc4:	00000693          	li	a3,0
80403fc8:	0107a783          	lw	a5,16(a5)
80403fcc:	00048593          	mv	a1,s1
80403fd0:	00090513          	mv	a0,s2
80403fd4:	00140413          	addi	s0,s0,1
80403fd8:	000780e7          	jalr	a5
80403fdc:	f68a1ce3          	bne	s4,s0,80403f54 <swap_out+0xb0>
80403fe0:	00040513          	mv	a0,s0
80403fe4:	03c12083          	lw	ra,60(sp)
80403fe8:	03812403          	lw	s0,56(sp)
80403fec:	03412483          	lw	s1,52(sp)
80403ff0:	03012903          	lw	s2,48(sp)
80403ff4:	02c12983          	lw	s3,44(sp)
80403ff8:	02812a03          	lw	s4,40(sp)
80403ffc:	02412a83          	lw	s5,36(sp)
80404000:	02012b03          	lw	s6,32(sp)
80404004:	01c12b83          	lw	s7,28(sp)
80404008:	01812c03          	lw	s8,24(sp)
8040400c:	04010113          	addi	sp,sp,64
80404010:	00008067          	ret
80404014:	00040593          	mv	a1,s0
80404018:	00010517          	auipc	a0,0x10
8040401c:	9c450513          	addi	a0,a0,-1596 # 804139dc <default_pmm_manager+0x424>
80404020:	9dcfc0ef          	jal	ra,804001fc <cprintf>
80404024:	fbdff06f          	j	80403fe0 <swap_out+0x13c>
80404028:	00000413          	li	s0,0
8040402c:	fb5ff06f          	j	80403fe0 <swap_out+0x13c>
80404030:	00010697          	auipc	a3,0x10
80404034:	9dc68693          	addi	a3,a3,-1572 # 80413a0c <default_pmm_manager+0x454>
80404038:	0000f617          	auipc	a2,0xf
8040403c:	c3460613          	addi	a2,a2,-972 # 80412c6c <commands+0x1bc>
80404040:	05500593          	li	a1,85
80404044:	00010517          	auipc	a0,0x10
80404048:	97450513          	addi	a0,a0,-1676 # 804139b8 <default_pmm_manager+0x400>
8040404c:	dd8fc0ef          	jal	ra,80400624 <__panic>

80404050 <swap_in>:
80404050:	fe010113          	addi	sp,sp,-32
80404054:	01212823          	sw	s2,16(sp)
80404058:	00050913          	mv	s2,a0
8040405c:	00100513          	li	a0,1
80404060:	00912a23          	sw	s1,20(sp)
80404064:	01312623          	sw	s3,12(sp)
80404068:	00112e23          	sw	ra,28(sp)
8040406c:	00812c23          	sw	s0,24(sp)
80404070:	00058493          	mv	s1,a1
80404074:	00060993          	mv	s3,a2
80404078:	b99fe0ef          	jal	ra,80402c10 <alloc_pages>
8040407c:	06050263          	beqz	a0,804040e0 <swap_in+0x90>
80404080:	00050413          	mv	s0,a0
80404084:	00c92503          	lw	a0,12(s2)
80404088:	00000613          	li	a2,0
8040408c:	00048593          	mv	a1,s1
80404090:	d15fe0ef          	jal	ra,80402da4 <get_pte>
80404094:	00050913          	mv	s2,a0
80404098:	00052503          	lw	a0,0(a0)
8040409c:	00040593          	mv	a1,s0
804040a0:	180090ef          	jal	ra,8040d220 <swapfs_read>
804040a4:	00092583          	lw	a1,0(s2)
804040a8:	00048613          	mv	a2,s1
804040ac:	00010517          	auipc	a0,0x10
804040b0:	8b050513          	addi	a0,a0,-1872 # 8041395c <default_pmm_manager+0x3a4>
804040b4:	0085d593          	srli	a1,a1,0x8
804040b8:	944fc0ef          	jal	ra,804001fc <cprintf>
804040bc:	01c12083          	lw	ra,28(sp)
804040c0:	0089a023          	sw	s0,0(s3)
804040c4:	01812403          	lw	s0,24(sp)
804040c8:	01412483          	lw	s1,20(sp)
804040cc:	01012903          	lw	s2,16(sp)
804040d0:	00c12983          	lw	s3,12(sp)
804040d4:	00000513          	li	a0,0
804040d8:	02010113          	addi	sp,sp,32
804040dc:	00008067          	ret
804040e0:	00010697          	auipc	a3,0x10
804040e4:	86c68693          	addi	a3,a3,-1940 # 8041394c <default_pmm_manager+0x394>
804040e8:	0000f617          	auipc	a2,0xf
804040ec:	b8460613          	addi	a2,a2,-1148 # 80412c6c <commands+0x1bc>
804040f0:	06b00593          	li	a1,107
804040f4:	00010517          	auipc	a0,0x10
804040f8:	8c450513          	addi	a0,a0,-1852 # 804139b8 <default_pmm_manager+0x400>
804040fc:	d28fc0ef          	jal	ra,80400624 <__panic>

80404100 <_fifo_init_mm>:
80404100:	00098797          	auipc	a5,0x98
80404104:	7ac78793          	addi	a5,a5,1964 # 8049c8ac <pra_list_head>
80404108:	00f52a23          	sw	a5,20(a0)
8040410c:	00f7a223          	sw	a5,4(a5)
80404110:	00f7a023          	sw	a5,0(a5)
80404114:	00000513          	li	a0,0
80404118:	00008067          	ret

8040411c <_fifo_init>:
8040411c:	00000513          	li	a0,0
80404120:	00008067          	ret

80404124 <_fifo_set_unswappable>:
80404124:	00000513          	li	a0,0
80404128:	00008067          	ret

8040412c <_fifo_tick_event>:
8040412c:	00000513          	li	a0,0
80404130:	00008067          	ret

80404134 <_fifo_check_swap>:
80404134:	fd010113          	addi	sp,sp,-48
80404138:	01312e23          	sw	s3,28(sp)
8040413c:	01412c23          	sw	s4,24(sp)
80404140:	00010517          	auipc	a0,0x10
80404144:	93c50513          	addi	a0,a0,-1732 # 80413a7c <default_pmm_manager+0x4c4>
80404148:	000039b7          	lui	s3,0x3
8040414c:	00c00a13          	li	s4,12
80404150:	02812423          	sw	s0,40(sp)
80404154:	02912223          	sw	s1,36(sp)
80404158:	02112623          	sw	ra,44(sp)
8040415c:	03212023          	sw	s2,32(sp)
80404160:	01512a23          	sw	s5,20(sp)
80404164:	01612823          	sw	s6,16(sp)
80404168:	01712623          	sw	s7,12(sp)
8040416c:	01812423          	sw	s8,8(sp)
80404170:	01912223          	sw	s9,4(sp)
80404174:	00098417          	auipc	s0,0x98
80404178:	63840413          	addi	s0,s0,1592 # 8049c7ac <pgfault_num>
8040417c:	880fc0ef          	jal	ra,804001fc <cprintf>
80404180:	01498023          	sb	s4,0(s3) # 3000 <_binary_bin_swap_img_size-0x5000>
80404184:	00042483          	lw	s1,0(s0)
80404188:	00400793          	li	a5,4
8040418c:	18f49863          	bne	s1,a5,8040431c <_fifo_check_swap+0x1e8>
80404190:	00010517          	auipc	a0,0x10
80404194:	93c50513          	addi	a0,a0,-1732 # 80413acc <default_pmm_manager+0x514>
80404198:	00001b37          	lui	s6,0x1
8040419c:	00a00b93          	li	s7,10
804041a0:	85cfc0ef          	jal	ra,804001fc <cprintf>
804041a4:	017b0023          	sb	s7,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
804041a8:	00042903          	lw	s2,0(s0)
804041ac:	2e991863          	bne	s2,s1,8040449c <_fifo_check_swap+0x368>
804041b0:	00010517          	auipc	a0,0x10
804041b4:	94450513          	addi	a0,a0,-1724 # 80413af4 <default_pmm_manager+0x53c>
804041b8:	00004c37          	lui	s8,0x4
804041bc:	00d00c93          	li	s9,13
804041c0:	83cfc0ef          	jal	ra,804001fc <cprintf>
804041c4:	019c0023          	sb	s9,0(s8) # 4000 <_binary_bin_swap_img_size-0x4000>
804041c8:	00042a83          	lw	s5,0(s0)
804041cc:	2b2a9863          	bne	s5,s2,8040447c <_fifo_check_swap+0x348>
804041d0:	00010517          	auipc	a0,0x10
804041d4:	94c50513          	addi	a0,a0,-1716 # 80413b1c <default_pmm_manager+0x564>
804041d8:	000024b7          	lui	s1,0x2
804041dc:	00b00913          	li	s2,11
804041e0:	81cfc0ef          	jal	ra,804001fc <cprintf>
804041e4:	01248023          	sb	s2,0(s1) # 2000 <_binary_bin_swap_img_size-0x6000>
804041e8:	00042783          	lw	a5,0(s0)
804041ec:	27579863          	bne	a5,s5,8040445c <_fifo_check_swap+0x328>
804041f0:	00010517          	auipc	a0,0x10
804041f4:	95450513          	addi	a0,a0,-1708 # 80413b44 <default_pmm_manager+0x58c>
804041f8:	804fc0ef          	jal	ra,804001fc <cprintf>
804041fc:	000057b7          	lui	a5,0x5
80404200:	00e00713          	li	a4,14
80404204:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80404208:	00042a83          	lw	s5,0(s0)
8040420c:	00500793          	li	a5,5
80404210:	22fa9663          	bne	s5,a5,8040443c <_fifo_check_swap+0x308>
80404214:	00010517          	auipc	a0,0x10
80404218:	90850513          	addi	a0,a0,-1784 # 80413b1c <default_pmm_manager+0x564>
8040421c:	fe1fb0ef          	jal	ra,804001fc <cprintf>
80404220:	01248023          	sb	s2,0(s1)
80404224:	00042783          	lw	a5,0(s0)
80404228:	1f579a63          	bne	a5,s5,8040441c <_fifo_check_swap+0x2e8>
8040422c:	00010517          	auipc	a0,0x10
80404230:	8a050513          	addi	a0,a0,-1888 # 80413acc <default_pmm_manager+0x514>
80404234:	fc9fb0ef          	jal	ra,804001fc <cprintf>
80404238:	017b0023          	sb	s7,0(s6)
8040423c:	00042703          	lw	a4,0(s0)
80404240:	00600793          	li	a5,6
80404244:	1af71c63          	bne	a4,a5,804043fc <_fifo_check_swap+0x2c8>
80404248:	00010517          	auipc	a0,0x10
8040424c:	8d450513          	addi	a0,a0,-1836 # 80413b1c <default_pmm_manager+0x564>
80404250:	fadfb0ef          	jal	ra,804001fc <cprintf>
80404254:	01248023          	sb	s2,0(s1)
80404258:	00042703          	lw	a4,0(s0)
8040425c:	00700793          	li	a5,7
80404260:	16f71e63          	bne	a4,a5,804043dc <_fifo_check_swap+0x2a8>
80404264:	00010517          	auipc	a0,0x10
80404268:	81850513          	addi	a0,a0,-2024 # 80413a7c <default_pmm_manager+0x4c4>
8040426c:	f91fb0ef          	jal	ra,804001fc <cprintf>
80404270:	01498023          	sb	s4,0(s3)
80404274:	00042703          	lw	a4,0(s0)
80404278:	00800793          	li	a5,8
8040427c:	14f71063          	bne	a4,a5,804043bc <_fifo_check_swap+0x288>
80404280:	00010517          	auipc	a0,0x10
80404284:	87450513          	addi	a0,a0,-1932 # 80413af4 <default_pmm_manager+0x53c>
80404288:	f75fb0ef          	jal	ra,804001fc <cprintf>
8040428c:	019c0023          	sb	s9,0(s8)
80404290:	00042703          	lw	a4,0(s0)
80404294:	00900793          	li	a5,9
80404298:	10f71263          	bne	a4,a5,8040439c <_fifo_check_swap+0x268>
8040429c:	00010517          	auipc	a0,0x10
804042a0:	8a850513          	addi	a0,a0,-1880 # 80413b44 <default_pmm_manager+0x58c>
804042a4:	f59fb0ef          	jal	ra,804001fc <cprintf>
804042a8:	000057b7          	lui	a5,0x5
804042ac:	00e00713          	li	a4,14
804042b0:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
804042b4:	00042483          	lw	s1,0(s0)
804042b8:	00a00793          	li	a5,10
804042bc:	0cf49063          	bne	s1,a5,8040437c <_fifo_check_swap+0x248>
804042c0:	00010517          	auipc	a0,0x10
804042c4:	80c50513          	addi	a0,a0,-2036 # 80413acc <default_pmm_manager+0x514>
804042c8:	f35fb0ef          	jal	ra,804001fc <cprintf>
804042cc:	000017b7          	lui	a5,0x1
804042d0:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
804042d4:	08979463          	bne	a5,s1,8040435c <_fifo_check_swap+0x228>
804042d8:	00042703          	lw	a4,0(s0)
804042dc:	00b00793          	li	a5,11
804042e0:	04f71e63          	bne	a4,a5,8040433c <_fifo_check_swap+0x208>
804042e4:	02c12083          	lw	ra,44(sp)
804042e8:	02812403          	lw	s0,40(sp)
804042ec:	02412483          	lw	s1,36(sp)
804042f0:	02012903          	lw	s2,32(sp)
804042f4:	01c12983          	lw	s3,28(sp)
804042f8:	01812a03          	lw	s4,24(sp)
804042fc:	01412a83          	lw	s5,20(sp)
80404300:	01012b03          	lw	s6,16(sp)
80404304:	00c12b83          	lw	s7,12(sp)
80404308:	00812c03          	lw	s8,8(sp)
8040430c:	00412c83          	lw	s9,4(sp)
80404310:	00000513          	li	a0,0
80404314:	03010113          	addi	sp,sp,48
80404318:	00008067          	ret
8040431c:	0000f697          	auipc	a3,0xf
80404320:	78868693          	addi	a3,a3,1928 # 80413aa4 <default_pmm_manager+0x4ec>
80404324:	0000f617          	auipc	a2,0xf
80404328:	94860613          	addi	a2,a2,-1720 # 80412c6c <commands+0x1bc>
8040432c:	05f00593          	li	a1,95
80404330:	0000f517          	auipc	a0,0xf
80404334:	78850513          	addi	a0,a0,1928 # 80413ab8 <default_pmm_manager+0x500>
80404338:	aecfc0ef          	jal	ra,80400624 <__panic>
8040433c:	00010697          	auipc	a3,0x10
80404340:	8cc68693          	addi	a3,a3,-1844 # 80413c08 <default_pmm_manager+0x650>
80404344:	0000f617          	auipc	a2,0xf
80404348:	92860613          	addi	a2,a2,-1752 # 80412c6c <commands+0x1bc>
8040434c:	08100593          	li	a1,129
80404350:	0000f517          	auipc	a0,0xf
80404354:	76850513          	addi	a0,a0,1896 # 80413ab8 <default_pmm_manager+0x500>
80404358:	accfc0ef          	jal	ra,80400624 <__panic>
8040435c:	00010697          	auipc	a3,0x10
80404360:	88868693          	addi	a3,a3,-1912 # 80413be4 <default_pmm_manager+0x62c>
80404364:	0000f617          	auipc	a2,0xf
80404368:	90860613          	addi	a2,a2,-1784 # 80412c6c <commands+0x1bc>
8040436c:	07f00593          	li	a1,127
80404370:	0000f517          	auipc	a0,0xf
80404374:	74850513          	addi	a0,a0,1864 # 80413ab8 <default_pmm_manager+0x500>
80404378:	aacfc0ef          	jal	ra,80400624 <__panic>
8040437c:	00010697          	auipc	a3,0x10
80404380:	85468693          	addi	a3,a3,-1964 # 80413bd0 <default_pmm_manager+0x618>
80404384:	0000f617          	auipc	a2,0xf
80404388:	8e860613          	addi	a2,a2,-1816 # 80412c6c <commands+0x1bc>
8040438c:	07d00593          	li	a1,125
80404390:	0000f517          	auipc	a0,0xf
80404394:	72850513          	addi	a0,a0,1832 # 80413ab8 <default_pmm_manager+0x500>
80404398:	a8cfc0ef          	jal	ra,80400624 <__panic>
8040439c:	00010697          	auipc	a3,0x10
804043a0:	82068693          	addi	a3,a3,-2016 # 80413bbc <default_pmm_manager+0x604>
804043a4:	0000f617          	auipc	a2,0xf
804043a8:	8c860613          	addi	a2,a2,-1848 # 80412c6c <commands+0x1bc>
804043ac:	07a00593          	li	a1,122
804043b0:	0000f517          	auipc	a0,0xf
804043b4:	70850513          	addi	a0,a0,1800 # 80413ab8 <default_pmm_manager+0x500>
804043b8:	a6cfc0ef          	jal	ra,80400624 <__panic>
804043bc:	0000f697          	auipc	a3,0xf
804043c0:	7ec68693          	addi	a3,a3,2028 # 80413ba8 <default_pmm_manager+0x5f0>
804043c4:	0000f617          	auipc	a2,0xf
804043c8:	8a860613          	addi	a2,a2,-1880 # 80412c6c <commands+0x1bc>
804043cc:	07700593          	li	a1,119
804043d0:	0000f517          	auipc	a0,0xf
804043d4:	6e850513          	addi	a0,a0,1768 # 80413ab8 <default_pmm_manager+0x500>
804043d8:	a4cfc0ef          	jal	ra,80400624 <__panic>
804043dc:	0000f697          	auipc	a3,0xf
804043e0:	7b868693          	addi	a3,a3,1976 # 80413b94 <default_pmm_manager+0x5dc>
804043e4:	0000f617          	auipc	a2,0xf
804043e8:	88860613          	addi	a2,a2,-1912 # 80412c6c <commands+0x1bc>
804043ec:	07400593          	li	a1,116
804043f0:	0000f517          	auipc	a0,0xf
804043f4:	6c850513          	addi	a0,a0,1736 # 80413ab8 <default_pmm_manager+0x500>
804043f8:	a2cfc0ef          	jal	ra,80400624 <__panic>
804043fc:	0000f697          	auipc	a3,0xf
80404400:	78468693          	addi	a3,a3,1924 # 80413b80 <default_pmm_manager+0x5c8>
80404404:	0000f617          	auipc	a2,0xf
80404408:	86860613          	addi	a2,a2,-1944 # 80412c6c <commands+0x1bc>
8040440c:	07100593          	li	a1,113
80404410:	0000f517          	auipc	a0,0xf
80404414:	6a850513          	addi	a0,a0,1704 # 80413ab8 <default_pmm_manager+0x500>
80404418:	a0cfc0ef          	jal	ra,80400624 <__panic>
8040441c:	0000f697          	auipc	a3,0xf
80404420:	75068693          	addi	a3,a3,1872 # 80413b6c <default_pmm_manager+0x5b4>
80404424:	0000f617          	auipc	a2,0xf
80404428:	84860613          	addi	a2,a2,-1976 # 80412c6c <commands+0x1bc>
8040442c:	06e00593          	li	a1,110
80404430:	0000f517          	auipc	a0,0xf
80404434:	68850513          	addi	a0,a0,1672 # 80413ab8 <default_pmm_manager+0x500>
80404438:	9ecfc0ef          	jal	ra,80400624 <__panic>
8040443c:	0000f697          	auipc	a3,0xf
80404440:	73068693          	addi	a3,a3,1840 # 80413b6c <default_pmm_manager+0x5b4>
80404444:	0000f617          	auipc	a2,0xf
80404448:	82860613          	addi	a2,a2,-2008 # 80412c6c <commands+0x1bc>
8040444c:	06b00593          	li	a1,107
80404450:	0000f517          	auipc	a0,0xf
80404454:	66850513          	addi	a0,a0,1640 # 80413ab8 <default_pmm_manager+0x500>
80404458:	9ccfc0ef          	jal	ra,80400624 <__panic>
8040445c:	0000f697          	auipc	a3,0xf
80404460:	64868693          	addi	a3,a3,1608 # 80413aa4 <default_pmm_manager+0x4ec>
80404464:	0000f617          	auipc	a2,0xf
80404468:	80860613          	addi	a2,a2,-2040 # 80412c6c <commands+0x1bc>
8040446c:	06800593          	li	a1,104
80404470:	0000f517          	auipc	a0,0xf
80404474:	64850513          	addi	a0,a0,1608 # 80413ab8 <default_pmm_manager+0x500>
80404478:	9acfc0ef          	jal	ra,80400624 <__panic>
8040447c:	0000f697          	auipc	a3,0xf
80404480:	62868693          	addi	a3,a3,1576 # 80413aa4 <default_pmm_manager+0x4ec>
80404484:	0000e617          	auipc	a2,0xe
80404488:	7e860613          	addi	a2,a2,2024 # 80412c6c <commands+0x1bc>
8040448c:	06500593          	li	a1,101
80404490:	0000f517          	auipc	a0,0xf
80404494:	62850513          	addi	a0,a0,1576 # 80413ab8 <default_pmm_manager+0x500>
80404498:	98cfc0ef          	jal	ra,80400624 <__panic>
8040449c:	0000f697          	auipc	a3,0xf
804044a0:	60868693          	addi	a3,a3,1544 # 80413aa4 <default_pmm_manager+0x4ec>
804044a4:	0000e617          	auipc	a2,0xe
804044a8:	7c860613          	addi	a2,a2,1992 # 80412c6c <commands+0x1bc>
804044ac:	06200593          	li	a1,98
804044b0:	0000f517          	auipc	a0,0xf
804044b4:	60850513          	addi	a0,a0,1544 # 80413ab8 <default_pmm_manager+0x500>
804044b8:	96cfc0ef          	jal	ra,80400624 <__panic>

804044bc <_fifo_swap_out_victim>:
804044bc:	01452783          	lw	a5,20(a0)
804044c0:	ff010113          	addi	sp,sp,-16
804044c4:	00112623          	sw	ra,12(sp)
804044c8:	02078a63          	beqz	a5,804044fc <_fifo_swap_out_victim+0x40>
804044cc:	04061863          	bnez	a2,8040451c <_fifo_swap_out_victim+0x60>
804044d0:	0047a783          	lw	a5,4(a5)
804044d4:	00c12083          	lw	ra,12(sp)
804044d8:	00000513          	li	a0,0
804044dc:	0007a683          	lw	a3,0(a5)
804044e0:	0047a703          	lw	a4,4(a5)
804044e4:	fec78793          	addi	a5,a5,-20
804044e8:	00e6a223          	sw	a4,4(a3)
804044ec:	00d72023          	sw	a3,0(a4)
804044f0:	00f5a023          	sw	a5,0(a1)
804044f4:	01010113          	addi	sp,sp,16
804044f8:	00008067          	ret
804044fc:	0000f697          	auipc	a3,0xf
80404500:	74068693          	addi	a3,a3,1856 # 80413c3c <default_pmm_manager+0x684>
80404504:	0000e617          	auipc	a2,0xe
80404508:	76860613          	addi	a2,a2,1896 # 80412c6c <commands+0x1bc>
8040450c:	05000593          	li	a1,80
80404510:	0000f517          	auipc	a0,0xf
80404514:	5a850513          	addi	a0,a0,1448 # 80413ab8 <default_pmm_manager+0x500>
80404518:	90cfc0ef          	jal	ra,80400624 <__panic>
8040451c:	0000f697          	auipc	a3,0xf
80404520:	73068693          	addi	a3,a3,1840 # 80413c4c <default_pmm_manager+0x694>
80404524:	0000e617          	auipc	a2,0xe
80404528:	74860613          	addi	a2,a2,1864 # 80412c6c <commands+0x1bc>
8040452c:	05100593          	li	a1,81
80404530:	0000f517          	auipc	a0,0xf
80404534:	58850513          	addi	a0,a0,1416 # 80413ab8 <default_pmm_manager+0x500>
80404538:	8ecfc0ef          	jal	ra,80400624 <__panic>

8040453c <_fifo_map_swappable>:
8040453c:	01460713          	addi	a4,a2,20
80404540:	01452783          	lw	a5,20(a0)
80404544:	02070263          	beqz	a4,80404568 <_fifo_map_swappable+0x2c>
80404548:	02078063          	beqz	a5,80404568 <_fifo_map_swappable+0x2c>
8040454c:	0007a683          	lw	a3,0(a5)
80404550:	00e7a023          	sw	a4,0(a5)
80404554:	00000513          	li	a0,0
80404558:	00e6a223          	sw	a4,4(a3)
8040455c:	00f62c23          	sw	a5,24(a2)
80404560:	00d62a23          	sw	a3,20(a2)
80404564:	00008067          	ret
80404568:	ff010113          	addi	sp,sp,-16
8040456c:	0000f697          	auipc	a3,0xf
80404570:	6b068693          	addi	a3,a3,1712 # 80413c1c <default_pmm_manager+0x664>
80404574:	0000e617          	auipc	a2,0xe
80404578:	6f860613          	addi	a2,a2,1784 # 80412c6c <commands+0x1bc>
8040457c:	03f00593          	li	a1,63
80404580:	0000f517          	auipc	a0,0xf
80404584:	53850513          	addi	a0,a0,1336 # 80413ab8 <default_pmm_manager+0x500>
80404588:	00112623          	sw	ra,12(sp)
8040458c:	898fc0ef          	jal	ra,80400624 <__panic>

80404590 <check_vma_overlap.isra.2.part.3>:
80404590:	ff010113          	addi	sp,sp,-16
80404594:	0000f697          	auipc	a3,0xf
80404598:	6dc68693          	addi	a3,a3,1756 # 80413c70 <default_pmm_manager+0x6b8>
8040459c:	0000e617          	auipc	a2,0xe
804045a0:	6d060613          	addi	a2,a2,1744 # 80412c6c <commands+0x1bc>
804045a4:	06d00593          	li	a1,109
804045a8:	0000f517          	auipc	a0,0xf
804045ac:	6e850513          	addi	a0,a0,1768 # 80413c90 <default_pmm_manager+0x6d8>
804045b0:	00112623          	sw	ra,12(sp)
804045b4:	870fc0ef          	jal	ra,80400624 <__panic>

804045b8 <mm_create>:
804045b8:	ff010113          	addi	sp,sp,-16
804045bc:	02c00513          	li	a0,44
804045c0:	00812423          	sw	s0,8(sp)
804045c4:	00112623          	sw	ra,12(sp)
804045c8:	ac8fe0ef          	jal	ra,80402890 <kmalloc>
804045cc:	00050413          	mv	s0,a0
804045d0:	02050e63          	beqz	a0,8040460c <mm_create+0x54>
804045d4:	00098797          	auipc	a5,0x98
804045d8:	1d478793          	addi	a5,a5,468 # 8049c7a8 <swap_init_ok>
804045dc:	0007a783          	lw	a5,0(a5)
804045e0:	00a42223          	sw	a0,4(s0)
804045e4:	00a42023          	sw	a0,0(s0)
804045e8:	00052423          	sw	zero,8(a0)
804045ec:	00052623          	sw	zero,12(a0)
804045f0:	00052823          	sw	zero,16(a0)
804045f4:	02079663          	bnez	a5,80404620 <mm_create+0x68>
804045f8:	00052a23          	sw	zero,20(a0)
804045fc:	00042c23          	sw	zero,24(s0)
80404600:	00100593          	li	a1,1
80404604:	01c40513          	addi	a0,s0,28
80404608:	275000ef          	jal	ra,8040507c <sem_init>
8040460c:	00040513          	mv	a0,s0
80404610:	00c12083          	lw	ra,12(sp)
80404614:	00812403          	lw	s0,8(sp)
80404618:	01010113          	addi	sp,sp,16
8040461c:	00008067          	ret
80404620:	85dff0ef          	jal	ra,80403e7c <swap_init_mm>
80404624:	fd9ff06f          	j	804045fc <mm_create+0x44>

80404628 <find_vma>:
80404628:	04050263          	beqz	a0,8040466c <find_vma+0x44>
8040462c:	00852783          	lw	a5,8(a0)
80404630:	00078663          	beqz	a5,8040463c <find_vma+0x14>
80404634:	0047a703          	lw	a4,4(a5)
80404638:	04e5f063          	bgeu	a1,a4,80404678 <find_vma+0x50>
8040463c:	00050793          	mv	a5,a0
80404640:	0047a783          	lw	a5,4(a5)
80404644:	02f50463          	beq	a0,a5,8040466c <find_vma+0x44>
80404648:	ff47a703          	lw	a4,-12(a5)
8040464c:	fee5eae3          	bltu	a1,a4,80404640 <find_vma+0x18>
80404650:	ff87a703          	lw	a4,-8(a5)
80404654:	fee5f6e3          	bgeu	a1,a4,80404640 <find_vma+0x18>
80404658:	ff078793          	addi	a5,a5,-16
8040465c:	00078863          	beqz	a5,8040466c <find_vma+0x44>
80404660:	00f52423          	sw	a5,8(a0)
80404664:	00078513          	mv	a0,a5
80404668:	00008067          	ret
8040466c:	00000793          	li	a5,0
80404670:	00078513          	mv	a0,a5
80404674:	00008067          	ret
80404678:	0087a703          	lw	a4,8(a5)
8040467c:	fce5f0e3          	bgeu	a1,a4,8040463c <find_vma+0x14>
80404680:	00f52423          	sw	a5,8(a0)
80404684:	fe1ff06f          	j	80404664 <find_vma+0x3c>

80404688 <insert_vma_struct>:
80404688:	0045a603          	lw	a2,4(a1)
8040468c:	0085a803          	lw	a6,8(a1)
80404690:	ff010113          	addi	sp,sp,-16
80404694:	00112623          	sw	ra,12(sp)
80404698:	00050713          	mv	a4,a0
8040469c:	01066a63          	bltu	a2,a6,804046b0 <insert_vma_struct+0x28>
804046a0:	07c0006f          	j	8040471c <insert_vma_struct+0x94>
804046a4:	ff47a683          	lw	a3,-12(a5)
804046a8:	06d66463          	bltu	a2,a3,80404710 <insert_vma_struct+0x88>
804046ac:	00078713          	mv	a4,a5
804046b0:	00472783          	lw	a5,4(a4)
804046b4:	fef518e3          	bne	a0,a5,804046a4 <insert_vma_struct+0x1c>
804046b8:	02a70463          	beq	a4,a0,804046e0 <insert_vma_struct+0x58>
804046bc:	ff872683          	lw	a3,-8(a4)
804046c0:	ff472883          	lw	a7,-12(a4)
804046c4:	08d8fc63          	bgeu	a7,a3,8040475c <insert_vma_struct+0xd4>
804046c8:	06d66a63          	bltu	a2,a3,8040473c <insert_vma_struct+0xb4>
804046cc:	00f50a63          	beq	a0,a5,804046e0 <insert_vma_struct+0x58>
804046d0:	ff47a683          	lw	a3,-12(a5)
804046d4:	0706e463          	bltu	a3,a6,8040473c <insert_vma_struct+0xb4>
804046d8:	ff87a603          	lw	a2,-8(a5)
804046dc:	02c6fe63          	bgeu	a3,a2,80404718 <insert_vma_struct+0x90>
804046e0:	01052683          	lw	a3,16(a0)
804046e4:	00a5a023          	sw	a0,0(a1)
804046e8:	01058613          	addi	a2,a1,16
804046ec:	00c7a023          	sw	a2,0(a5)
804046f0:	00c72223          	sw	a2,4(a4)
804046f4:	00c12083          	lw	ra,12(sp)
804046f8:	00f5aa23          	sw	a5,20(a1)
804046fc:	00e5a823          	sw	a4,16(a1)
80404700:	00168693          	addi	a3,a3,1
80404704:	00d52823          	sw	a3,16(a0)
80404708:	01010113          	addi	sp,sp,16
8040470c:	00008067          	ret
80404710:	faa716e3          	bne	a4,a0,804046bc <insert_vma_struct+0x34>
80404714:	fc1ff06f          	j	804046d4 <insert_vma_struct+0x4c>
80404718:	e79ff0ef          	jal	ra,80404590 <check_vma_overlap.isra.2.part.3>
8040471c:	0000f697          	auipc	a3,0xf
80404720:	68068693          	addi	a3,a3,1664 # 80413d9c <default_pmm_manager+0x7e4>
80404724:	0000e617          	auipc	a2,0xe
80404728:	54860613          	addi	a2,a2,1352 # 80412c6c <commands+0x1bc>
8040472c:	07200593          	li	a1,114
80404730:	0000f517          	auipc	a0,0xf
80404734:	56050513          	addi	a0,a0,1376 # 80413c90 <default_pmm_manager+0x6d8>
80404738:	eedfb0ef          	jal	ra,80400624 <__panic>
8040473c:	0000f697          	auipc	a3,0xf
80404740:	69c68693          	addi	a3,a3,1692 # 80413dd8 <default_pmm_manager+0x820>
80404744:	0000e617          	auipc	a2,0xe
80404748:	52860613          	addi	a2,a2,1320 # 80412c6c <commands+0x1bc>
8040474c:	06c00593          	li	a1,108
80404750:	0000f517          	auipc	a0,0xf
80404754:	54050513          	addi	a0,a0,1344 # 80413c90 <default_pmm_manager+0x6d8>
80404758:	ecdfb0ef          	jal	ra,80400624 <__panic>
8040475c:	0000f697          	auipc	a3,0xf
80404760:	65c68693          	addi	a3,a3,1628 # 80413db8 <default_pmm_manager+0x800>
80404764:	0000e617          	auipc	a2,0xe
80404768:	50860613          	addi	a2,a2,1288 # 80412c6c <commands+0x1bc>
8040476c:	06b00593          	li	a1,107
80404770:	0000f517          	auipc	a0,0xf
80404774:	52050513          	addi	a0,a0,1312 # 80413c90 <default_pmm_manager+0x6d8>
80404778:	eadfb0ef          	jal	ra,80400624 <__panic>

8040477c <mm_destroy>:
8040477c:	01852783          	lw	a5,24(a0)
80404780:	ff010113          	addi	sp,sp,-16
80404784:	00112623          	sw	ra,12(sp)
80404788:	00812423          	sw	s0,8(sp)
8040478c:	04079263          	bnez	a5,804047d0 <mm_destroy+0x54>
80404790:	00050413          	mv	s0,a0
80404794:	00452503          	lw	a0,4(a0)
80404798:	02a40263          	beq	s0,a0,804047bc <mm_destroy+0x40>
8040479c:	00052703          	lw	a4,0(a0)
804047a0:	00452783          	lw	a5,4(a0)
804047a4:	ff050513          	addi	a0,a0,-16
804047a8:	00f72223          	sw	a5,4(a4)
804047ac:	00e7a023          	sw	a4,0(a5)
804047b0:	a04fe0ef          	jal	ra,804029b4 <kfree>
804047b4:	00442503          	lw	a0,4(s0)
804047b8:	fea412e3          	bne	s0,a0,8040479c <mm_destroy+0x20>
804047bc:	00040513          	mv	a0,s0
804047c0:	00812403          	lw	s0,8(sp)
804047c4:	00c12083          	lw	ra,12(sp)
804047c8:	01010113          	addi	sp,sp,16
804047cc:	9e8fe06f          	j	804029b4 <kfree>
804047d0:	0000f697          	auipc	a3,0xf
804047d4:	62868693          	addi	a3,a3,1576 # 80413df8 <default_pmm_manager+0x840>
804047d8:	0000e617          	auipc	a2,0xe
804047dc:	49460613          	addi	a2,a2,1172 # 80412c6c <commands+0x1bc>
804047e0:	09100593          	li	a1,145
804047e4:	0000f517          	auipc	a0,0xf
804047e8:	4ac50513          	addi	a0,a0,1196 # 80413c90 <default_pmm_manager+0x6d8>
804047ec:	e39fb0ef          	jal	ra,80400624 <__panic>

804047f0 <mm_map>:
804047f0:	000017b7          	lui	a5,0x1
804047f4:	fe010113          	addi	sp,sp,-32
804047f8:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
804047fc:	fffff837          	lui	a6,0xfffff
80404800:	00812c23          	sw	s0,24(sp)
80404804:	00f60433          	add	s0,a2,a5
80404808:	00912a23          	sw	s1,20(sp)
8040480c:	00b40433          	add	s0,s0,a1
80404810:	00112e23          	sw	ra,28(sp)
80404814:	01212823          	sw	s2,16(sp)
80404818:	01312623          	sw	s3,12(sp)
8040481c:	01412423          	sw	s4,8(sp)
80404820:	01512223          	sw	s5,4(sp)
80404824:	0105f4b3          	and	s1,a1,a6
80404828:	002007b7          	lui	a5,0x200
8040482c:	01047433          	and	s0,s0,a6
80404830:	08f4e863          	bltu	s1,a5,804048c0 <mm_map+0xd0>
80404834:	0884f663          	bgeu	s1,s0,804048c0 <mm_map+0xd0>
80404838:	800007b7          	lui	a5,0x80000
8040483c:	0887e263          	bltu	a5,s0,804048c0 <mm_map+0xd0>
80404840:	00050993          	mv	s3,a0
80404844:	00070a13          	mv	s4,a4
80404848:	00068a93          	mv	s5,a3
8040484c:	06050e63          	beqz	a0,804048c8 <mm_map+0xd8>
80404850:	00048593          	mv	a1,s1
80404854:	dd5ff0ef          	jal	ra,80404628 <find_vma>
80404858:	00050663          	beqz	a0,80404864 <mm_map+0x74>
8040485c:	00452783          	lw	a5,4(a0)
80404860:	0687e063          	bltu	a5,s0,804048c0 <mm_map+0xd0>
80404864:	01800513          	li	a0,24
80404868:	828fe0ef          	jal	ra,80402890 <kmalloc>
8040486c:	00050913          	mv	s2,a0
80404870:	ffc00513          	li	a0,-4
80404874:	02090463          	beqz	s2,8040489c <mm_map+0xac>
80404878:	00098513          	mv	a0,s3
8040487c:	00992223          	sw	s1,4(s2)
80404880:	00892423          	sw	s0,8(s2)
80404884:	01592623          	sw	s5,12(s2)
80404888:	00090593          	mv	a1,s2
8040488c:	dfdff0ef          	jal	ra,80404688 <insert_vma_struct>
80404890:	00000513          	li	a0,0
80404894:	000a0463          	beqz	s4,8040489c <mm_map+0xac>
80404898:	012a2023          	sw	s2,0(s4)
8040489c:	01c12083          	lw	ra,28(sp)
804048a0:	01812403          	lw	s0,24(sp)
804048a4:	01412483          	lw	s1,20(sp)
804048a8:	01012903          	lw	s2,16(sp)
804048ac:	00c12983          	lw	s3,12(sp)
804048b0:	00812a03          	lw	s4,8(sp)
804048b4:	00412a83          	lw	s5,4(sp)
804048b8:	02010113          	addi	sp,sp,32
804048bc:	00008067          	ret
804048c0:	ffd00513          	li	a0,-3
804048c4:	fd9ff06f          	j	8040489c <mm_map+0xac>
804048c8:	0000f697          	auipc	a3,0xf
804048cc:	54468693          	addi	a3,a3,1348 # 80413e0c <default_pmm_manager+0x854>
804048d0:	0000e617          	auipc	a2,0xe
804048d4:	39c60613          	addi	a2,a2,924 # 80412c6c <commands+0x1bc>
804048d8:	0a400593          	li	a1,164
804048dc:	0000f517          	auipc	a0,0xf
804048e0:	3b450513          	addi	a0,a0,948 # 80413c90 <default_pmm_manager+0x6d8>
804048e4:	d41fb0ef          	jal	ra,80400624 <__panic>

804048e8 <dup_mmap>:
804048e8:	fe010113          	addi	sp,sp,-32
804048ec:	00112e23          	sw	ra,28(sp)
804048f0:	00812c23          	sw	s0,24(sp)
804048f4:	00912a23          	sw	s1,20(sp)
804048f8:	01212823          	sw	s2,16(sp)
804048fc:	01312623          	sw	s3,12(sp)
80404900:	01412423          	sw	s4,8(sp)
80404904:	01512223          	sw	s5,4(sp)
80404908:	0a050063          	beqz	a0,804049a8 <dup_mmap+0xc0>
8040490c:	00050913          	mv	s2,a0
80404910:	00058493          	mv	s1,a1
80404914:	00058413          	mv	s0,a1
80404918:	02059e63          	bnez	a1,80404954 <dup_mmap+0x6c>
8040491c:	08c0006f          	j	804049a8 <dup_mmap+0xc0>
80404920:	00050593          	mv	a1,a0
80404924:	0157a223          	sw	s5,4(a5) # 80000004 <end+0xffb63744>
80404928:	00090513          	mv	a0,s2
8040492c:	0147a423          	sw	s4,8(a5)
80404930:	0137a623          	sw	s3,12(a5)
80404934:	d55ff0ef          	jal	ra,80404688 <insert_vma_struct>
80404938:	ff842683          	lw	a3,-8(s0)
8040493c:	ff442603          	lw	a2,-12(s0)
80404940:	00c4a583          	lw	a1,12(s1)
80404944:	00c92503          	lw	a0,12(s2)
80404948:	00000713          	li	a4,0
8040494c:	aa5fe0ef          	jal	ra,804033f0 <copy_range>
80404950:	02051463          	bnez	a0,80404978 <dup_mmap+0x90>
80404954:	00042403          	lw	s0,0(s0)
80404958:	04848463          	beq	s1,s0,804049a0 <dup_mmap+0xb8>
8040495c:	01800513          	li	a0,24
80404960:	ff442a83          	lw	s5,-12(s0)
80404964:	ff842a03          	lw	s4,-8(s0)
80404968:	ffc42983          	lw	s3,-4(s0)
8040496c:	f25fd0ef          	jal	ra,80402890 <kmalloc>
80404970:	00050793          	mv	a5,a0
80404974:	fa0516e3          	bnez	a0,80404920 <dup_mmap+0x38>
80404978:	ffc00513          	li	a0,-4
8040497c:	01c12083          	lw	ra,28(sp)
80404980:	01812403          	lw	s0,24(sp)
80404984:	01412483          	lw	s1,20(sp)
80404988:	01012903          	lw	s2,16(sp)
8040498c:	00c12983          	lw	s3,12(sp)
80404990:	00812a03          	lw	s4,8(sp)
80404994:	00412a83          	lw	s5,4(sp)
80404998:	02010113          	addi	sp,sp,32
8040499c:	00008067          	ret
804049a0:	00000513          	li	a0,0
804049a4:	fd9ff06f          	j	8040497c <dup_mmap+0x94>
804049a8:	0000f697          	auipc	a3,0xf
804049ac:	3b868693          	addi	a3,a3,952 # 80413d60 <default_pmm_manager+0x7a8>
804049b0:	0000e617          	auipc	a2,0xe
804049b4:	2bc60613          	addi	a2,a2,700 # 80412c6c <commands+0x1bc>
804049b8:	0bc00593          	li	a1,188
804049bc:	0000f517          	auipc	a0,0xf
804049c0:	2d450513          	addi	a0,a0,724 # 80413c90 <default_pmm_manager+0x6d8>
804049c4:	c61fb0ef          	jal	ra,80400624 <__panic>

804049c8 <exit_mmap>:
804049c8:	ff010113          	addi	sp,sp,-16
804049cc:	00112623          	sw	ra,12(sp)
804049d0:	00812423          	sw	s0,8(sp)
804049d4:	00912223          	sw	s1,4(sp)
804049d8:	01212023          	sw	s2,0(sp)
804049dc:	06050663          	beqz	a0,80404a48 <exit_mmap+0x80>
804049e0:	01852783          	lw	a5,24(a0)
804049e4:	00050493          	mv	s1,a0
804049e8:	06079063          	bnez	a5,80404a48 <exit_mmap+0x80>
804049ec:	00452403          	lw	s0,4(a0)
804049f0:	00c52903          	lw	s2,12(a0)
804049f4:	02850a63          	beq	a0,s0,80404a28 <exit_mmap+0x60>
804049f8:	ff842603          	lw	a2,-8(s0)
804049fc:	ff442583          	lw	a1,-12(s0)
80404a00:	00090513          	mv	a0,s2
80404a04:	e00fe0ef          	jal	ra,80403004 <unmap_range>
80404a08:	00442403          	lw	s0,4(s0)
80404a0c:	fe8496e3          	bne	s1,s0,804049f8 <exit_mmap+0x30>
80404a10:	00442403          	lw	s0,4(s0)
80404a14:	00848e63          	beq	s1,s0,80404a30 <exit_mmap+0x68>
80404a18:	ff842603          	lw	a2,-8(s0)
80404a1c:	ff442583          	lw	a1,-12(s0)
80404a20:	00090513          	mv	a0,s2
80404a24:	f64fe0ef          	jal	ra,80403188 <exit_range>
80404a28:	00442403          	lw	s0,4(s0)
80404a2c:	fe8496e3          	bne	s1,s0,80404a18 <exit_mmap+0x50>
80404a30:	00c12083          	lw	ra,12(sp)
80404a34:	00812403          	lw	s0,8(sp)
80404a38:	00412483          	lw	s1,4(sp)
80404a3c:	00012903          	lw	s2,0(sp)
80404a40:	01010113          	addi	sp,sp,16
80404a44:	00008067          	ret
80404a48:	0000f697          	auipc	a3,0xf
80404a4c:	33468693          	addi	a3,a3,820 # 80413d7c <default_pmm_manager+0x7c4>
80404a50:	0000e617          	auipc	a2,0xe
80404a54:	21c60613          	addi	a2,a2,540 # 80412c6c <commands+0x1bc>
80404a58:	0d200593          	li	a1,210
80404a5c:	0000f517          	auipc	a0,0xf
80404a60:	23450513          	addi	a0,a0,564 # 80413c90 <default_pmm_manager+0x6d8>
80404a64:	bc1fb0ef          	jal	ra,80400624 <__panic>

80404a68 <vmm_init>:
80404a68:	00008067          	ret

80404a6c <do_pgfault>:
80404a6c:	fd010113          	addi	sp,sp,-48
80404a70:	00060593          	mv	a1,a2
80404a74:	02912223          	sw	s1,36(sp)
80404a78:	03212023          	sw	s2,32(sp)
80404a7c:	02112623          	sw	ra,44(sp)
80404a80:	02812423          	sw	s0,40(sp)
80404a84:	01312e23          	sw	s3,28(sp)
80404a88:	00060493          	mv	s1,a2
80404a8c:	00050913          	mv	s2,a0
80404a90:	b99ff0ef          	jal	ra,80404628 <find_vma>
80404a94:	00098797          	auipc	a5,0x98
80404a98:	d1878793          	addi	a5,a5,-744 # 8049c7ac <pgfault_num>
80404a9c:	0007a783          	lw	a5,0(a5)
80404aa0:	00178793          	addi	a5,a5,1
80404aa4:	00098717          	auipc	a4,0x98
80404aa8:	d0f72423          	sw	a5,-760(a4) # 8049c7ac <pgfault_num>
80404aac:	10050e63          	beqz	a0,80404bc8 <do_pgfault+0x15c>
80404ab0:	00452783          	lw	a5,4(a0)
80404ab4:	10f4ea63          	bltu	s1,a5,80404bc8 <do_pgfault+0x15c>
80404ab8:	00c52403          	lw	s0,12(a0)
80404abc:	fffff637          	lui	a2,0xfffff
80404ac0:	00c92503          	lw	a0,12(s2)
80404ac4:	00247413          	andi	s0,s0,2
80404ac8:	00c4f4b3          	and	s1,s1,a2
80404acc:	00143413          	seqz	s0,s0
80404ad0:	40800433          	neg	s0,s0
80404ad4:	00100613          	li	a2,1
80404ad8:	00048593          	mv	a1,s1
80404adc:	ff947413          	andi	s0,s0,-7
80404ae0:	ac4fe0ef          	jal	ra,80402da4 <get_pte>
80404ae4:	01740413          	addi	s0,s0,23
80404ae8:	10050663          	beqz	a0,80404bf4 <do_pgfault+0x188>
80404aec:	00052583          	lw	a1,0(a0)
80404af0:	0a058663          	beqz	a1,80404b9c <do_pgfault+0x130>
80404af4:	00098797          	auipc	a5,0x98
80404af8:	cb478793          	addi	a5,a5,-844 # 8049c7a8 <swap_init_ok>
80404afc:	0007a783          	lw	a5,0(a5)
80404b00:	0e078063          	beqz	a5,80404be0 <do_pgfault+0x174>
80404b04:	00c10613          	addi	a2,sp,12
80404b08:	00048593          	mv	a1,s1
80404b0c:	00090513          	mv	a0,s2
80404b10:	00012623          	sw	zero,12(sp)
80404b14:	d3cff0ef          	jal	ra,80404050 <swap_in>
80404b18:	00050993          	mv	s3,a0
80404b1c:	04051a63          	bnez	a0,80404b70 <do_pgfault+0x104>
80404b20:	00c12583          	lw	a1,12(sp)
80404b24:	00c92503          	lw	a0,12(s2)
80404b28:	00040693          	mv	a3,s0
80404b2c:	00048613          	mv	a2,s1
80404b30:	fa0fe0ef          	jal	ra,804032d0 <page_insert>
80404b34:	00c12603          	lw	a2,12(sp)
80404b38:	00100693          	li	a3,1
80404b3c:	00048593          	mv	a1,s1
80404b40:	00090513          	mv	a0,s2
80404b44:	b4cff0ef          	jal	ra,80403e90 <swap_map_swappable>
80404b48:	00c12783          	lw	a5,12(sp)
80404b4c:	0097ae23          	sw	s1,28(a5)
80404b50:	02c12083          	lw	ra,44(sp)
80404b54:	02812403          	lw	s0,40(sp)
80404b58:	00098513          	mv	a0,s3
80404b5c:	02412483          	lw	s1,36(sp)
80404b60:	02012903          	lw	s2,32(sp)
80404b64:	01c12983          	lw	s3,28(sp)
80404b68:	03010113          	addi	sp,sp,48
80404b6c:	00008067          	ret
80404b70:	0000f517          	auipc	a0,0xf
80404b74:	1a850513          	addi	a0,a0,424 # 80413d18 <default_pmm_manager+0x760>
80404b78:	e84fb0ef          	jal	ra,804001fc <cprintf>
80404b7c:	02c12083          	lw	ra,44(sp)
80404b80:	02812403          	lw	s0,40(sp)
80404b84:	00098513          	mv	a0,s3
80404b88:	02412483          	lw	s1,36(sp)
80404b8c:	02012903          	lw	s2,32(sp)
80404b90:	01c12983          	lw	s3,28(sp)
80404b94:	03010113          	addi	sp,sp,48
80404b98:	00008067          	ret
80404b9c:	00c92503          	lw	a0,12(s2)
80404ba0:	00040613          	mv	a2,s0
80404ba4:	00048593          	mv	a1,s1
80404ba8:	b71fe0ef          	jal	ra,80403718 <pgdir_alloc_page>
80404bac:	00000993          	li	s3,0
80404bb0:	fa0510e3          	bnez	a0,80404b50 <do_pgfault+0xe4>
80404bb4:	0000f517          	auipc	a0,0xf
80404bb8:	13c50513          	addi	a0,a0,316 # 80413cf0 <default_pmm_manager+0x738>
80404bbc:	e40fb0ef          	jal	ra,804001fc <cprintf>
80404bc0:	ffc00993          	li	s3,-4
80404bc4:	f8dff06f          	j	80404b50 <do_pgfault+0xe4>
80404bc8:	00048593          	mv	a1,s1
80404bcc:	0000f517          	auipc	a0,0xf
80404bd0:	0d450513          	addi	a0,a0,212 # 80413ca0 <default_pmm_manager+0x6e8>
80404bd4:	e28fb0ef          	jal	ra,804001fc <cprintf>
80404bd8:	ffd00993          	li	s3,-3
80404bdc:	f75ff06f          	j	80404b50 <do_pgfault+0xe4>
80404be0:	0000f517          	auipc	a0,0xf
80404be4:	15850513          	addi	a0,a0,344 # 80413d38 <default_pmm_manager+0x780>
80404be8:	e14fb0ef          	jal	ra,804001fc <cprintf>
80404bec:	ffc00993          	li	s3,-4
80404bf0:	f61ff06f          	j	80404b50 <do_pgfault+0xe4>
80404bf4:	0000f517          	auipc	a0,0xf
80404bf8:	0dc50513          	addi	a0,a0,220 # 80413cd0 <default_pmm_manager+0x718>
80404bfc:	e00fb0ef          	jal	ra,804001fc <cprintf>
80404c00:	ffc00993          	li	s3,-4
80404c04:	f4dff06f          	j	80404b50 <do_pgfault+0xe4>

80404c08 <user_mem_check>:
80404c08:	fe010113          	addi	sp,sp,-32
80404c0c:	00812c23          	sw	s0,24(sp)
80404c10:	00112e23          	sw	ra,28(sp)
80404c14:	00912a23          	sw	s1,20(sp)
80404c18:	01212823          	sw	s2,16(sp)
80404c1c:	01312623          	sw	s3,12(sp)
80404c20:	01412423          	sw	s4,8(sp)
80404c24:	00058413          	mv	s0,a1
80404c28:	08050c63          	beqz	a0,80404cc0 <user_mem_check+0xb8>
80404c2c:	002007b7          	lui	a5,0x200
80404c30:	06f5e663          	bltu	a1,a5,80404c9c <user_mem_check+0x94>
80404c34:	00c584b3          	add	s1,a1,a2
80404c38:	0695f263          	bgeu	a1,s1,80404c9c <user_mem_check+0x94>
80404c3c:	800007b7          	lui	a5,0x80000
80404c40:	0497ee63          	bltu	a5,s1,80404c9c <user_mem_check+0x94>
80404c44:	00050913          	mv	s2,a0
80404c48:	00068993          	mv	s3,a3
80404c4c:	00001a37          	lui	s4,0x1
80404c50:	0240006f          	j	80404c74 <user_mem_check+0x6c>
80404c54:	0027f693          	andi	a3,a5,2
80404c58:	01470733          	add	a4,a4,s4
80404c5c:	0087f793          	andi	a5,a5,8
80404c60:	02068e63          	beqz	a3,80404c9c <user_mem_check+0x94>
80404c64:	00078463          	beqz	a5,80404c6c <user_mem_check+0x64>
80404c68:	02e46a63          	bltu	s0,a4,80404c9c <user_mem_check+0x94>
80404c6c:	00852403          	lw	s0,8(a0)
80404c70:	06947463          	bgeu	s0,s1,80404cd8 <user_mem_check+0xd0>
80404c74:	00040593          	mv	a1,s0
80404c78:	00090513          	mv	a0,s2
80404c7c:	9adff0ef          	jal	ra,80404628 <find_vma>
80404c80:	00050e63          	beqz	a0,80404c9c <user_mem_check+0x94>
80404c84:	00452703          	lw	a4,4(a0)
80404c88:	00e46a63          	bltu	s0,a4,80404c9c <user_mem_check+0x94>
80404c8c:	00c52783          	lw	a5,12(a0)
80404c90:	fc0992e3          	bnez	s3,80404c54 <user_mem_check+0x4c>
80404c94:	0017f793          	andi	a5,a5,1
80404c98:	fc079ae3          	bnez	a5,80404c6c <user_mem_check+0x64>
80404c9c:	00000513          	li	a0,0
80404ca0:	01c12083          	lw	ra,28(sp)
80404ca4:	01812403          	lw	s0,24(sp)
80404ca8:	01412483          	lw	s1,20(sp)
80404cac:	01012903          	lw	s2,16(sp)
80404cb0:	00c12983          	lw	s3,12(sp)
80404cb4:	00812a03          	lw	s4,8(sp)
80404cb8:	02010113          	addi	sp,sp,32
80404cbc:	00008067          	ret
80404cc0:	804007b7          	lui	a5,0x80400
80404cc4:	fcf5ece3          	bltu	a1,a5,80404c9c <user_mem_check+0x94>
80404cc8:	00c58633          	add	a2,a1,a2
80404ccc:	fcc5f8e3          	bgeu	a1,a2,80404c9c <user_mem_check+0x94>
80404cd0:	80c007b7          	lui	a5,0x80c00
80404cd4:	fcc7e4e3          	bltu	a5,a2,80404c9c <user_mem_check+0x94>
80404cd8:	00100513          	li	a0,1
80404cdc:	fc5ff06f          	j	80404ca0 <user_mem_check+0x98>

80404ce0 <copy_from_user>:
80404ce0:	ff010113          	addi	sp,sp,-16
80404ce4:	00812423          	sw	s0,8(sp)
80404ce8:	00912223          	sw	s1,4(sp)
80404cec:	00060413          	mv	s0,a2
80404cf0:	00068493          	mv	s1,a3
80404cf4:	01212023          	sw	s2,0(sp)
80404cf8:	00070693          	mv	a3,a4
80404cfc:	00058913          	mv	s2,a1
80404d00:	00048613          	mv	a2,s1
80404d04:	00040593          	mv	a1,s0
80404d08:	00112623          	sw	ra,12(sp)
80404d0c:	efdff0ef          	jal	ra,80404c08 <user_mem_check>
80404d10:	00050c63          	beqz	a0,80404d28 <copy_from_user+0x48>
80404d14:	00048613          	mv	a2,s1
80404d18:	00040593          	mv	a1,s0
80404d1c:	00090513          	mv	a0,s2
80404d20:	38d0d0ef          	jal	ra,804128ac <memcpy>
80404d24:	00100513          	li	a0,1
80404d28:	00c12083          	lw	ra,12(sp)
80404d2c:	00812403          	lw	s0,8(sp)
80404d30:	00412483          	lw	s1,4(sp)
80404d34:	00012903          	lw	s2,0(sp)
80404d38:	01010113          	addi	sp,sp,16
80404d3c:	00008067          	ret

80404d40 <copy_to_user>:
80404d40:	ff010113          	addi	sp,sp,-16
80404d44:	00812423          	sw	s0,8(sp)
80404d48:	00068413          	mv	s0,a3
80404d4c:	01212023          	sw	s2,0(sp)
80404d50:	00100693          	li	a3,1
80404d54:	00060913          	mv	s2,a2
80404d58:	00040613          	mv	a2,s0
80404d5c:	00912223          	sw	s1,4(sp)
80404d60:	00112623          	sw	ra,12(sp)
80404d64:	00058493          	mv	s1,a1
80404d68:	ea1ff0ef          	jal	ra,80404c08 <user_mem_check>
80404d6c:	00050c63          	beqz	a0,80404d84 <copy_to_user+0x44>
80404d70:	00040613          	mv	a2,s0
80404d74:	00090593          	mv	a1,s2
80404d78:	00048513          	mv	a0,s1
80404d7c:	3310d0ef          	jal	ra,804128ac <memcpy>
80404d80:	00100513          	li	a0,1
80404d84:	00c12083          	lw	ra,12(sp)
80404d88:	00812403          	lw	s0,8(sp)
80404d8c:	00412483          	lw	s1,4(sp)
80404d90:	00012903          	lw	s2,0(sp)
80404d94:	01010113          	addi	sp,sp,16
80404d98:	00008067          	ret

80404d9c <copy_string>:
80404d9c:	fe010113          	addi	sp,sp,-32
80404da0:	01312623          	sw	s3,12(sp)
80404da4:	000019b7          	lui	s3,0x1
80404da8:	013609b3          	add	s3,a2,s3
80404dac:	fffff7b7          	lui	a5,0xfffff
80404db0:	00f9f9b3          	and	s3,s3,a5
80404db4:	00912a23          	sw	s1,20(sp)
80404db8:	01212823          	sw	s2,16(sp)
80404dbc:	01412423          	sw	s4,8(sp)
80404dc0:	01512223          	sw	s5,4(sp)
80404dc4:	00112e23          	sw	ra,28(sp)
80404dc8:	00812c23          	sw	s0,24(sp)
80404dcc:	00060493          	mv	s1,a2
80404dd0:	00050a93          	mv	s5,a0
80404dd4:	00058a13          	mv	s4,a1
80404dd8:	00068913          	mv	s2,a3
80404ddc:	40c989b3          	sub	s3,s3,a2
80404de0:	0380006f          	j	80404e18 <copy_string+0x7c>
80404de4:	00048513          	mv	a0,s1
80404de8:	1a10d0ef          	jal	ra,80412788 <strnlen>
80404dec:	00050793          	mv	a5,a0
80404df0:	00048593          	mv	a1,s1
80404df4:	000a0513          	mv	a0,s4
80404df8:	00040613          	mv	a2,s0
80404dfc:	0687e663          	bltu	a5,s0,80404e68 <copy_string+0xcc>
80404e00:	0529f063          	bgeu	s3,s2,80404e40 <copy_string+0xa4>
80404e04:	2a90d0ef          	jal	ra,804128ac <memcpy>
80404e08:	008a0a33          	add	s4,s4,s0
80404e0c:	008484b3          	add	s1,s1,s0
80404e10:	40890933          	sub	s2,s2,s0
80404e14:	000019b7          	lui	s3,0x1
80404e18:	00000693          	li	a3,0
80404e1c:	00048593          	mv	a1,s1
80404e20:	000a8513          	mv	a0,s5
80404e24:	00090413          	mv	s0,s2
80404e28:	0129f463          	bgeu	s3,s2,80404e30 <copy_string+0x94>
80404e2c:	00098413          	mv	s0,s3
80404e30:	00040613          	mv	a2,s0
80404e34:	dd5ff0ef          	jal	ra,80404c08 <user_mem_check>
80404e38:	00040593          	mv	a1,s0
80404e3c:	fa0514e3          	bnez	a0,80404de4 <copy_string+0x48>
80404e40:	00000513          	li	a0,0
80404e44:	01c12083          	lw	ra,28(sp)
80404e48:	01812403          	lw	s0,24(sp)
80404e4c:	01412483          	lw	s1,20(sp)
80404e50:	01012903          	lw	s2,16(sp)
80404e54:	00c12983          	lw	s3,12(sp)
80404e58:	00812a03          	lw	s4,8(sp)
80404e5c:	00412a83          	lw	s5,4(sp)
80404e60:	02010113          	addi	sp,sp,32
80404e64:	00008067          	ret
80404e68:	00178613          	addi	a2,a5,1 # fffff001 <end+0x7fb62741>
80404e6c:	2410d0ef          	jal	ra,804128ac <memcpy>
80404e70:	00100513          	li	a0,1
80404e74:	fd1ff06f          	j	80404e44 <copy_string+0xa8>

80404e78 <__down.constprop.0>:
80404e78:	fc010113          	addi	sp,sp,-64
80404e7c:	02112e23          	sw	ra,60(sp)
80404e80:	02812c23          	sw	s0,56(sp)
80404e84:	02912a23          	sw	s1,52(sp)
80404e88:	100027f3          	csrr	a5,sstatus
80404e8c:	0027f793          	andi	a5,a5,2
80404e90:	08079663          	bnez	a5,80404f1c <__down.constprop.0+0xa4>
80404e94:	00052703          	lw	a4,0(a0)
80404e98:	02e05263          	blez	a4,80404ebc <__down.constprop.0+0x44>
80404e9c:	03c12083          	lw	ra,60(sp)
80404ea0:	03812403          	lw	s0,56(sp)
80404ea4:	fff70713          	addi	a4,a4,-1
80404ea8:	00e52023          	sw	a4,0(a0)
80404eac:	03412483          	lw	s1,52(sp)
80404eb0:	00078513          	mv	a0,a5
80404eb4:	04010113          	addi	sp,sp,64
80404eb8:	00008067          	ret
80404ebc:	00450413          	addi	s0,a0,4
80404ec0:	01c10493          	addi	s1,sp,28
80404ec4:	10000613          	li	a2,256
80404ec8:	00048593          	mv	a1,s1
80404ecc:	00040513          	mv	a0,s0
80404ed0:	3ac000ef          	jal	ra,8040527c <wait_current_set>
80404ed4:	429070ef          	jal	ra,8040cafc <schedule>
80404ed8:	100027f3          	csrr	a5,sstatus
80404edc:	0027f793          	andi	a5,a5,2
80404ee0:	0a079463          	bnez	a5,80404f88 <__down.constprop.0+0x110>
80404ee4:	00048513          	mv	a0,s1
80404ee8:	29c000ef          	jal	ra,80405184 <wait_in_queue>
80404eec:	08051663          	bnez	a0,80404f78 <__down.constprop.0+0x100>
80404ef0:	02012783          	lw	a5,32(sp)
80404ef4:	03c12083          	lw	ra,60(sp)
80404ef8:	03812403          	lw	s0,56(sp)
80404efc:	f0078713          	addi	a4,a5,-256
80404f00:	00e03733          	snez	a4,a4
80404f04:	40e00733          	neg	a4,a4
80404f08:	00e7f7b3          	and	a5,a5,a4
80404f0c:	03412483          	lw	s1,52(sp)
80404f10:	00078513          	mv	a0,a5
80404f14:	04010113          	addi	sp,sp,64
80404f18:	00008067          	ret
80404f1c:	00a12623          	sw	a0,12(sp)
80404f20:	d0dfb0ef          	jal	ra,80400c2c <intr_disable>
80404f24:	00c12503          	lw	a0,12(sp)
80404f28:	00052783          	lw	a5,0(a0)
80404f2c:	02f05663          	blez	a5,80404f58 <__down.constprop.0+0xe0>
80404f30:	fff78793          	addi	a5,a5,-1
80404f34:	00f52023          	sw	a5,0(a0)
80404f38:	cedfb0ef          	jal	ra,80400c24 <intr_enable>
80404f3c:	03c12083          	lw	ra,60(sp)
80404f40:	03812403          	lw	s0,56(sp)
80404f44:	00000793          	li	a5,0
80404f48:	03412483          	lw	s1,52(sp)
80404f4c:	00078513          	mv	a0,a5
80404f50:	04010113          	addi	sp,sp,64
80404f54:	00008067          	ret
80404f58:	00450413          	addi	s0,a0,4
80404f5c:	01c10493          	addi	s1,sp,28
80404f60:	10000613          	li	a2,256
80404f64:	00048593          	mv	a1,s1
80404f68:	00040513          	mv	a0,s0
80404f6c:	310000ef          	jal	ra,8040527c <wait_current_set>
80404f70:	cb5fb0ef          	jal	ra,80400c24 <intr_enable>
80404f74:	f61ff06f          	j	80404ed4 <__down.constprop.0+0x5c>
80404f78:	00048593          	mv	a1,s1
80404f7c:	00040513          	mv	a0,s0
80404f80:	1a4000ef          	jal	ra,80405124 <wait_queue_del>
80404f84:	f6dff06f          	j	80404ef0 <__down.constprop.0+0x78>
80404f88:	ca5fb0ef          	jal	ra,80400c2c <intr_disable>
80404f8c:	00048513          	mv	a0,s1
80404f90:	1f4000ef          	jal	ra,80405184 <wait_in_queue>
80404f94:	00051663          	bnez	a0,80404fa0 <__down.constprop.0+0x128>
80404f98:	c8dfb0ef          	jal	ra,80400c24 <intr_enable>
80404f9c:	f55ff06f          	j	80404ef0 <__down.constprop.0+0x78>
80404fa0:	00048593          	mv	a1,s1
80404fa4:	00040513          	mv	a0,s0
80404fa8:	17c000ef          	jal	ra,80405124 <wait_queue_del>
80404fac:	fedff06f          	j	80404f98 <__down.constprop.0+0x120>

80404fb0 <__up.constprop.1>:
80404fb0:	ff010113          	addi	sp,sp,-16
80404fb4:	00912223          	sw	s1,4(sp)
80404fb8:	00112623          	sw	ra,12(sp)
80404fbc:	00812423          	sw	s0,8(sp)
80404fc0:	01212023          	sw	s2,0(sp)
80404fc4:	00050493          	mv	s1,a0
80404fc8:	100027f3          	csrr	a5,sstatus
80404fcc:	0027f793          	andi	a5,a5,2
80404fd0:	00000913          	li	s2,0
80404fd4:	06079e63          	bnez	a5,80405050 <__up.constprop.1+0xa0>
80404fd8:	00448413          	addi	s0,s1,4
80404fdc:	00040513          	mv	a0,s0
80404fe0:	17c000ef          	jal	ra,8040515c <wait_queue_first>
80404fe4:	04050e63          	beqz	a0,80405040 <__up.constprop.1+0x90>
80404fe8:	00052703          	lw	a4,0(a0)
80404fec:	10000793          	li	a5,256
80404ff0:	0a872703          	lw	a4,168(a4)
80404ff4:	06f71463          	bne	a4,a5,8040505c <__up.constprop.1+0xac>
80404ff8:	00050593          	mv	a1,a0
80404ffc:	00100693          	li	a3,1
80405000:	10000613          	li	a2,256
80405004:	00040513          	mv	a0,s0
80405008:	190000ef          	jal	ra,80405198 <wakeup_wait>
8040500c:	00091e63          	bnez	s2,80405028 <__up.constprop.1+0x78>
80405010:	00c12083          	lw	ra,12(sp)
80405014:	00812403          	lw	s0,8(sp)
80405018:	00412483          	lw	s1,4(sp)
8040501c:	00012903          	lw	s2,0(sp)
80405020:	01010113          	addi	sp,sp,16
80405024:	00008067          	ret
80405028:	00812403          	lw	s0,8(sp)
8040502c:	00c12083          	lw	ra,12(sp)
80405030:	00412483          	lw	s1,4(sp)
80405034:	00012903          	lw	s2,0(sp)
80405038:	01010113          	addi	sp,sp,16
8040503c:	be9fb06f          	j	80400c24 <intr_enable>
80405040:	0004a783          	lw	a5,0(s1)
80405044:	00178793          	addi	a5,a5,1
80405048:	00f4a023          	sw	a5,0(s1)
8040504c:	fc1ff06f          	j	8040500c <__up.constprop.1+0x5c>
80405050:	bddfb0ef          	jal	ra,80400c2c <intr_disable>
80405054:	00100913          	li	s2,1
80405058:	f81ff06f          	j	80404fd8 <__up.constprop.1+0x28>
8040505c:	0000f697          	auipc	a3,0xf
80405060:	dbc68693          	addi	a3,a3,-580 # 80413e18 <default_pmm_manager+0x860>
80405064:	0000e617          	auipc	a2,0xe
80405068:	c0860613          	addi	a2,a2,-1016 # 80412c6c <commands+0x1bc>
8040506c:	01a00593          	li	a1,26
80405070:	0000f517          	auipc	a0,0xf
80405074:	dd050513          	addi	a0,a0,-560 # 80413e40 <default_pmm_manager+0x888>
80405078:	dacfb0ef          	jal	ra,80400624 <__panic>

8040507c <sem_init>:
8040507c:	00b52023          	sw	a1,0(a0)
80405080:	00450513          	addi	a0,a0,4
80405084:	0940006f          	j	80405118 <wait_queue_init>

80405088 <up>:
80405088:	f29ff06f          	j	80404fb0 <__up.constprop.1>

8040508c <down>:
8040508c:	ff010113          	addi	sp,sp,-16
80405090:	00112623          	sw	ra,12(sp)
80405094:	de5ff0ef          	jal	ra,80404e78 <__down.constprop.0>
80405098:	00051863          	bnez	a0,804050a8 <down+0x1c>
8040509c:	00c12083          	lw	ra,12(sp)
804050a0:	01010113          	addi	sp,sp,16
804050a4:	00008067          	ret
804050a8:	0000f697          	auipc	a3,0xf
804050ac:	da868693          	addi	a3,a3,-600 # 80413e50 <default_pmm_manager+0x898>
804050b0:	0000e617          	auipc	a2,0xe
804050b4:	bbc60613          	addi	a2,a2,-1092 # 80412c6c <commands+0x1bc>
804050b8:	04100593          	li	a1,65
804050bc:	0000f517          	auipc	a0,0xf
804050c0:	d8450513          	addi	a0,a0,-636 # 80413e40 <default_pmm_manager+0x888>
804050c4:	d60fb0ef          	jal	ra,80400624 <__panic>

804050c8 <wait_queue_del.part.1>:
804050c8:	ff010113          	addi	sp,sp,-16
804050cc:	0000f697          	auipc	a3,0xf
804050d0:	da068693          	addi	a3,a3,-608 # 80413e6c <default_pmm_manager+0x8b4>
804050d4:	0000e617          	auipc	a2,0xe
804050d8:	b9860613          	addi	a2,a2,-1128 # 80412c6c <commands+0x1bc>
804050dc:	01e00593          	li	a1,30
804050e0:	0000f517          	auipc	a0,0xf
804050e4:	dcc50513          	addi	a0,a0,-564 # 80413eac <default_pmm_manager+0x8f4>
804050e8:	00112623          	sw	ra,12(sp)
804050ec:	d38fb0ef          	jal	ra,80400624 <__panic>

804050f0 <wait_queue_next.part.2>:
804050f0:	ff010113          	addi	sp,sp,-16
804050f4:	0000f697          	auipc	a3,0xf
804050f8:	d7868693          	addi	a3,a3,-648 # 80413e6c <default_pmm_manager+0x8b4>
804050fc:	0000e617          	auipc	a2,0xe
80405100:	b7060613          	addi	a2,a2,-1168 # 80412c6c <commands+0x1bc>
80405104:	02400593          	li	a1,36
80405108:	0000f517          	auipc	a0,0xf
8040510c:	da450513          	addi	a0,a0,-604 # 80413eac <default_pmm_manager+0x8f4>
80405110:	00112623          	sw	ra,12(sp)
80405114:	d10fb0ef          	jal	ra,80400624 <__panic>

80405118 <wait_queue_init>:
80405118:	00a52223          	sw	a0,4(a0)
8040511c:	00a52023          	sw	a0,0(a0)
80405120:	00008067          	ret

80405124 <wait_queue_del>:
80405124:	0105a703          	lw	a4,16(a1)
80405128:	00c58793          	addi	a5,a1,12
8040512c:	02e78263          	beq	a5,a4,80405150 <wait_queue_del+0x2c>
80405130:	0085a683          	lw	a3,8(a1)
80405134:	00a69e63          	bne	a3,a0,80405150 <wait_queue_del+0x2c>
80405138:	00c5a683          	lw	a3,12(a1)
8040513c:	00e6a223          	sw	a4,4(a3)
80405140:	00d72023          	sw	a3,0(a4)
80405144:	00f5a823          	sw	a5,16(a1)
80405148:	00f5a623          	sw	a5,12(a1)
8040514c:	00008067          	ret
80405150:	ff010113          	addi	sp,sp,-16
80405154:	00112623          	sw	ra,12(sp)
80405158:	f71ff0ef          	jal	ra,804050c8 <wait_queue_del.part.1>

8040515c <wait_queue_first>:
8040515c:	00452783          	lw	a5,4(a0)
80405160:	00f50663          	beq	a0,a5,8040516c <wait_queue_first+0x10>
80405164:	ff478513          	addi	a0,a5,-12
80405168:	00008067          	ret
8040516c:	00000513          	li	a0,0
80405170:	00008067          	ret

80405174 <wait_queue_empty>:
80405174:	00452783          	lw	a5,4(a0)
80405178:	40a78533          	sub	a0,a5,a0
8040517c:	00153513          	seqz	a0,a0
80405180:	00008067          	ret

80405184 <wait_in_queue>:
80405184:	01052783          	lw	a5,16(a0)
80405188:	00c50513          	addi	a0,a0,12
8040518c:	40a78533          	sub	a0,a5,a0
80405190:	00a03533          	snez	a0,a0
80405194:	00008067          	ret

80405198 <wakeup_wait>:
80405198:	02068663          	beqz	a3,804051c4 <wakeup_wait+0x2c>
8040519c:	0105a703          	lw	a4,16(a1)
804051a0:	00c58793          	addi	a5,a1,12
804051a4:	02e78663          	beq	a5,a4,804051d0 <wakeup_wait+0x38>
804051a8:	0085a683          	lw	a3,8(a1)
804051ac:	02d51263          	bne	a0,a3,804051d0 <wakeup_wait+0x38>
804051b0:	00c5a683          	lw	a3,12(a1)
804051b4:	00e6a223          	sw	a4,4(a3)
804051b8:	00d72023          	sw	a3,0(a4)
804051bc:	00f5a823          	sw	a5,16(a1)
804051c0:	00f5a623          	sw	a5,12(a1)
804051c4:	0005a503          	lw	a0,0(a1)
804051c8:	00c5a223          	sw	a2,4(a1)
804051cc:	0350706f          	j	8040ca00 <wakeup_proc>
804051d0:	ff010113          	addi	sp,sp,-16
804051d4:	00112623          	sw	ra,12(sp)
804051d8:	ef1ff0ef          	jal	ra,804050c8 <wait_queue_del.part.1>

804051dc <wakeup_queue>:
804051dc:	ff010113          	addi	sp,sp,-16
804051e0:	00812423          	sw	s0,8(sp)
804051e4:	00452403          	lw	s0,4(a0)
804051e8:	00112623          	sw	ra,12(sp)
804051ec:	00912223          	sw	s1,4(sp)
804051f0:	01212023          	sw	s2,0(sp)
804051f4:	04850263          	beq	a0,s0,80405238 <wakeup_queue+0x5c>
804051f8:	ff440413          	addi	s0,s0,-12
804051fc:	02040e63          	beqz	s0,80405238 <wakeup_queue+0x5c>
80405200:	00058913          	mv	s2,a1
80405204:	00050493          	mv	s1,a0
80405208:	04061463          	bnez	a2,80405250 <wakeup_queue+0x74>
8040520c:	00042503          	lw	a0,0(s0)
80405210:	01242223          	sw	s2,4(s0)
80405214:	7ec070ef          	jal	ra,8040ca00 <wakeup_proc>
80405218:	01042783          	lw	a5,16(s0)
8040521c:	00c40713          	addi	a4,s0,12
80405220:	04e78c63          	beq	a5,a4,80405278 <wakeup_queue+0x9c>
80405224:	00842703          	lw	a4,8(s0)
80405228:	04e49863          	bne	s1,a4,80405278 <wakeup_queue+0x9c>
8040522c:	00f48663          	beq	s1,a5,80405238 <wakeup_queue+0x5c>
80405230:	ff478413          	addi	s0,a5,-12
80405234:	fc041ce3          	bnez	s0,8040520c <wakeup_queue+0x30>
80405238:	00c12083          	lw	ra,12(sp)
8040523c:	00812403          	lw	s0,8(sp)
80405240:	00412483          	lw	s1,4(sp)
80405244:	00012903          	lw	s2,0(sp)
80405248:	01010113          	addi	sp,sp,16
8040524c:	00008067          	ret
80405250:	00040593          	mv	a1,s0
80405254:	00100693          	li	a3,1
80405258:	00090613          	mv	a2,s2
8040525c:	00048513          	mv	a0,s1
80405260:	f39ff0ef          	jal	ra,80405198 <wakeup_wait>
80405264:	0044a403          	lw	s0,4(s1)
80405268:	fc8488e3          	beq	s1,s0,80405238 <wakeup_queue+0x5c>
8040526c:	ff440413          	addi	s0,s0,-12
80405270:	fe0410e3          	bnez	s0,80405250 <wakeup_queue+0x74>
80405274:	fc5ff06f          	j	80405238 <wakeup_queue+0x5c>
80405278:	e79ff0ef          	jal	ra,804050f0 <wait_queue_next.part.2>

8040527c <wait_current_set>:
8040527c:	00097797          	auipc	a5,0x97
80405280:	53478793          	addi	a5,a5,1332 # 8049c7b0 <current>
80405284:	0007a783          	lw	a5,0(a5)
80405288:	04078063          	beqz	a5,804052c8 <wait_current_set+0x4c>
8040528c:	00c58713          	addi	a4,a1,12
80405290:	800006b7          	lui	a3,0x80000
80405294:	00e5a623          	sw	a4,12(a1)
80405298:	00f5a023          	sw	a5,0(a1)
8040529c:	00d5a223          	sw	a3,4(a1)
804052a0:	00100693          	li	a3,1
804052a4:	00d7a023          	sw	a3,0(a5)
804052a8:	0ac7a423          	sw	a2,168(a5)
804052ac:	00052783          	lw	a5,0(a0)
804052b0:	00a5a423          	sw	a0,8(a1)
804052b4:	00e52023          	sw	a4,0(a0)
804052b8:	00e7a223          	sw	a4,4(a5)
804052bc:	00a5a823          	sw	a0,16(a1)
804052c0:	00f5a623          	sw	a5,12(a1)
804052c4:	00008067          	ret
804052c8:	ff010113          	addi	sp,sp,-16
804052cc:	0000f697          	auipc	a3,0xf
804052d0:	b9068693          	addi	a3,a3,-1136 # 80413e5c <default_pmm_manager+0x8a4>
804052d4:	0000e617          	auipc	a2,0xe
804052d8:	99860613          	addi	a2,a2,-1640 # 80412c6c <commands+0x1bc>
804052dc:	07600593          	li	a1,118
804052e0:	0000f517          	auipc	a0,0xf
804052e4:	bcc50513          	addi	a0,a0,-1076 # 80413eac <default_pmm_manager+0x8f4>
804052e8:	00112623          	sw	ra,12(sp)
804052ec:	b38fb0ef          	jal	ra,80400624 <__panic>

804052f0 <get_fd_array.part.4>:
804052f0:	ff010113          	addi	sp,sp,-16
804052f4:	0000f697          	auipc	a3,0xf
804052f8:	f1c68693          	addi	a3,a3,-228 # 80414210 <CSWTCH.69+0x344>
804052fc:	0000e617          	auipc	a2,0xe
80405300:	97060613          	addi	a2,a2,-1680 # 80412c6c <commands+0x1bc>
80405304:	01400593          	li	a1,20
80405308:	0000f517          	auipc	a0,0xf
8040530c:	f3450513          	addi	a0,a0,-204 # 8041423c <CSWTCH.69+0x370>
80405310:	00112623          	sw	ra,12(sp)
80405314:	b10fb0ef          	jal	ra,80400624 <__panic>

80405318 <fd_array_alloc>:
80405318:	00097797          	auipc	a5,0x97
8040531c:	49878793          	addi	a5,a5,1176 # 8049c7b0 <current>
80405320:	0007a783          	lw	a5,0(a5)
80405324:	ff010113          	addi	sp,sp,-16
80405328:	00112623          	sw	ra,12(sp)
8040532c:	0dc7a683          	lw	a3,220(a5)
80405330:	0a068463          	beqz	a3,804053d8 <fd_array_alloc+0xc0>
80405334:	0086a783          	lw	a5,8(a3)
80405338:	0af05063          	blez	a5,804053d8 <fd_array_alloc+0xc0>
8040533c:	ffff7737          	lui	a4,0xffff7
80405340:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <end+0x7fb5a219>
80405344:	0046a683          	lw	a3,4(a3)
80405348:	04e50463          	beq	a0,a4,80405390 <fd_array_alloc+0x78>
8040534c:	09000793          	li	a5,144
80405350:	08a7e063          	bltu	a5,a0,804053d0 <fd_array_alloc+0xb8>
80405354:	00351793          	slli	a5,a0,0x3
80405358:	40a787b3          	sub	a5,a5,a0
8040535c:	00279793          	slli	a5,a5,0x2
80405360:	00f687b3          	add	a5,a3,a5
80405364:	0007a703          	lw	a4,0(a5)
80405368:	06071063          	bnez	a4,804053c8 <fd_array_alloc+0xb0>
8040536c:	0187a503          	lw	a0,24(a5)
80405370:	06051663          	bnez	a0,804053dc <fd_array_alloc+0xc4>
80405374:	00100713          	li	a4,1
80405378:	00e7a023          	sw	a4,0(a5)
8040537c:	0007aa23          	sw	zero,20(a5)
80405380:	00f5a023          	sw	a5,0(a1)
80405384:	00c12083          	lw	ra,12(sp)
80405388:	01010113          	addi	sp,sp,16
8040538c:	00008067          	ret
80405390:	0006a783          	lw	a5,0(a3)
80405394:	02078663          	beqz	a5,804053c0 <fd_array_alloc+0xa8>
80405398:	00001737          	lui	a4,0x1
8040539c:	fdc70713          	addi	a4,a4,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804053a0:	01c68793          	addi	a5,a3,28
804053a4:	00e686b3          	add	a3,a3,a4
804053a8:	0007a703          	lw	a4,0(a5)
804053ac:	fc0700e3          	beqz	a4,8040536c <fd_array_alloc+0x54>
804053b0:	01c78793          	addi	a5,a5,28
804053b4:	fef69ae3          	bne	a3,a5,804053a8 <fd_array_alloc+0x90>
804053b8:	fea00513          	li	a0,-22
804053bc:	fc9ff06f          	j	80405384 <fd_array_alloc+0x6c>
804053c0:	00068793          	mv	a5,a3
804053c4:	fa9ff06f          	j	8040536c <fd_array_alloc+0x54>
804053c8:	ff100513          	li	a0,-15
804053cc:	fb9ff06f          	j	80405384 <fd_array_alloc+0x6c>
804053d0:	ffd00513          	li	a0,-3
804053d4:	fb1ff06f          	j	80405384 <fd_array_alloc+0x6c>
804053d8:	f19ff0ef          	jal	ra,804052f0 <get_fd_array.part.4>
804053dc:	0000f697          	auipc	a3,0xf
804053e0:	b1868693          	addi	a3,a3,-1256 # 80413ef4 <CSWTCH.69+0x28>
804053e4:	0000e617          	auipc	a2,0xe
804053e8:	88860613          	addi	a2,a2,-1912 # 80412c6c <commands+0x1bc>
804053ec:	03b00593          	li	a1,59
804053f0:	0000f517          	auipc	a0,0xf
804053f4:	e4c50513          	addi	a0,a0,-436 # 8041423c <CSWTCH.69+0x370>
804053f8:	a2cfb0ef          	jal	ra,80400624 <__panic>

804053fc <fd_array_free>:
804053fc:	00052783          	lw	a5,0(a0)
80405400:	ff010113          	addi	sp,sp,-16
80405404:	00812423          	sw	s0,8(sp)
80405408:	00112623          	sw	ra,12(sp)
8040540c:	00100713          	li	a4,1
80405410:	00050413          	mv	s0,a0
80405414:	04e78863          	beq	a5,a4,80405464 <fd_array_free+0x68>
80405418:	00300713          	li	a4,3
8040541c:	06e79263          	bne	a5,a4,80405480 <fd_array_free+0x84>
80405420:	01852783          	lw	a5,24(a0)
80405424:	02078263          	beqz	a5,80405448 <fd_array_free+0x4c>
80405428:	0000f697          	auipc	a3,0xf
8040542c:	acc68693          	addi	a3,a3,-1332 # 80413ef4 <CSWTCH.69+0x28>
80405430:	0000e617          	auipc	a2,0xe
80405434:	83c60613          	addi	a2,a2,-1988 # 80412c6c <commands+0x1bc>
80405438:	04500593          	li	a1,69
8040543c:	0000f517          	auipc	a0,0xf
80405440:	e0050513          	addi	a0,a0,-512 # 8041423c <CSWTCH.69+0x370>
80405444:	9e0fb0ef          	jal	ra,80400624 <__panic>
80405448:	01442503          	lw	a0,20(s0)
8040544c:	415080ef          	jal	ra,8040e060 <vfs_close>
80405450:	00c12083          	lw	ra,12(sp)
80405454:	00042023          	sw	zero,0(s0)
80405458:	00812403          	lw	s0,8(sp)
8040545c:	01010113          	addi	sp,sp,16
80405460:	00008067          	ret
80405464:	01852783          	lw	a5,24(a0)
80405468:	fc0790e3          	bnez	a5,80405428 <fd_array_free+0x2c>
8040546c:	00042023          	sw	zero,0(s0)
80405470:	00c12083          	lw	ra,12(sp)
80405474:	00812403          	lw	s0,8(sp)
80405478:	01010113          	addi	sp,sp,16
8040547c:	00008067          	ret
80405480:	0000f697          	auipc	a3,0xf
80405484:	ac068693          	addi	a3,a3,-1344 # 80413f40 <CSWTCH.69+0x74>
80405488:	0000d617          	auipc	a2,0xd
8040548c:	7e460613          	addi	a2,a2,2020 # 80412c6c <commands+0x1bc>
80405490:	04400593          	li	a1,68
80405494:	0000f517          	auipc	a0,0xf
80405498:	da850513          	addi	a0,a0,-600 # 8041423c <CSWTCH.69+0x370>
8040549c:	988fb0ef          	jal	ra,80400624 <__panic>

804054a0 <fd_array_release>:
804054a0:	00052783          	lw	a5,0(a0)
804054a4:	ff010113          	addi	sp,sp,-16
804054a8:	00112623          	sw	ra,12(sp)
804054ac:	00100693          	li	a3,1
804054b0:	ffe78793          	addi	a5,a5,-2
804054b4:	04f6e863          	bltu	a3,a5,80405504 <fd_array_release+0x64>
804054b8:	01852783          	lw	a5,24(a0)
804054bc:	02f05463          	blez	a5,804054e4 <fd_array_release+0x44>
804054c0:	fff78793          	addi	a5,a5,-1
804054c4:	00f52c23          	sw	a5,24(a0)
804054c8:	00078863          	beqz	a5,804054d8 <fd_array_release+0x38>
804054cc:	00c12083          	lw	ra,12(sp)
804054d0:	01010113          	addi	sp,sp,16
804054d4:	00008067          	ret
804054d8:	00c12083          	lw	ra,12(sp)
804054dc:	01010113          	addi	sp,sp,16
804054e0:	f1dff06f          	j	804053fc <fd_array_free>
804054e4:	0000f697          	auipc	a3,0xf
804054e8:	afc68693          	addi	a3,a3,-1284 # 80413fe0 <CSWTCH.69+0x114>
804054ec:	0000d617          	auipc	a2,0xd
804054f0:	78060613          	addi	a2,a2,1920 # 80412c6c <commands+0x1bc>
804054f4:	05600593          	li	a1,86
804054f8:	0000f517          	auipc	a0,0xf
804054fc:	d4450513          	addi	a0,a0,-700 # 8041423c <CSWTCH.69+0x370>
80405500:	924fb0ef          	jal	ra,80400624 <__panic>
80405504:	0000f697          	auipc	a3,0xf
80405508:	aa468693          	addi	a3,a3,-1372 # 80413fa8 <CSWTCH.69+0xdc>
8040550c:	0000d617          	auipc	a2,0xd
80405510:	76060613          	addi	a2,a2,1888 # 80412c6c <commands+0x1bc>
80405514:	05500593          	li	a1,85
80405518:	0000f517          	auipc	a0,0xf
8040551c:	d2450513          	addi	a0,a0,-732 # 8041423c <CSWTCH.69+0x370>
80405520:	904fb0ef          	jal	ra,80400624 <__panic>

80405524 <fd_array_open.part.9>:
80405524:	ff010113          	addi	sp,sp,-16
80405528:	0000f697          	auipc	a3,0xf
8040552c:	a5068693          	addi	a3,a3,-1456 # 80413f78 <CSWTCH.69+0xac>
80405530:	0000d617          	auipc	a2,0xd
80405534:	73c60613          	addi	a2,a2,1852 # 80412c6c <commands+0x1bc>
80405538:	05f00593          	li	a1,95
8040553c:	0000f517          	auipc	a0,0xf
80405540:	d0050513          	addi	a0,a0,-768 # 8041423c <CSWTCH.69+0x370>
80405544:	00112623          	sw	ra,12(sp)
80405548:	8dcfb0ef          	jal	ra,80400624 <__panic>

8040554c <fd_array_init>:
8040554c:	00000793          	li	a5,0
80405550:	09100713          	li	a4,145
80405554:	00f52623          	sw	a5,12(a0)
80405558:	00052c23          	sw	zero,24(a0)
8040555c:	00052023          	sw	zero,0(a0)
80405560:	00178793          	addi	a5,a5,1
80405564:	01c50513          	addi	a0,a0,28
80405568:	fee796e3          	bne	a5,a4,80405554 <fd_array_init+0x8>
8040556c:	00008067          	ret

80405570 <fd_array_close>:
80405570:	00052683          	lw	a3,0(a0)
80405574:	ff010113          	addi	sp,sp,-16
80405578:	00112623          	sw	ra,12(sp)
8040557c:	00200793          	li	a5,2
80405580:	04f69c63          	bne	a3,a5,804055d8 <fd_array_close+0x68>
80405584:	01852783          	lw	a5,24(a0)
80405588:	02f05863          	blez	a5,804055b8 <fd_array_close+0x48>
8040558c:	fff78793          	addi	a5,a5,-1
80405590:	00300693          	li	a3,3
80405594:	00d52023          	sw	a3,0(a0)
80405598:	00f52c23          	sw	a5,24(a0)
8040559c:	00078863          	beqz	a5,804055ac <fd_array_close+0x3c>
804055a0:	00c12083          	lw	ra,12(sp)
804055a4:	01010113          	addi	sp,sp,16
804055a8:	00008067          	ret
804055ac:	00c12083          	lw	ra,12(sp)
804055b0:	01010113          	addi	sp,sp,16
804055b4:	e49ff06f          	j	804053fc <fd_array_free>
804055b8:	0000f697          	auipc	a3,0xf
804055bc:	a2868693          	addi	a3,a3,-1496 # 80413fe0 <CSWTCH.69+0x114>
804055c0:	0000d617          	auipc	a2,0xd
804055c4:	6ac60613          	addi	a2,a2,1708 # 80412c6c <commands+0x1bc>
804055c8:	06800593          	li	a1,104
804055cc:	0000f517          	auipc	a0,0xf
804055d0:	c7050513          	addi	a0,a0,-912 # 8041423c <CSWTCH.69+0x370>
804055d4:	850fb0ef          	jal	ra,80400624 <__panic>
804055d8:	0000f697          	auipc	a3,0xf
804055dc:	90068693          	addi	a3,a3,-1792 # 80413ed8 <CSWTCH.69+0xc>
804055e0:	0000d617          	auipc	a2,0xd
804055e4:	68c60613          	addi	a2,a2,1676 # 80412c6c <commands+0x1bc>
804055e8:	06700593          	li	a1,103
804055ec:	0000f517          	auipc	a0,0xf
804055f0:	c5050513          	addi	a0,a0,-944 # 8041423c <CSWTCH.69+0x370>
804055f4:	830fb0ef          	jal	ra,80400624 <__panic>

804055f8 <fd_array_dup>:
804055f8:	fe010113          	addi	sp,sp,-32
804055fc:	01212823          	sw	s2,16(sp)
80405600:	00052903          	lw	s2,0(a0)
80405604:	00112e23          	sw	ra,28(sp)
80405608:	00812c23          	sw	s0,24(sp)
8040560c:	00912a23          	sw	s1,20(sp)
80405610:	01312623          	sw	s3,12(sp)
80405614:	00100793          	li	a5,1
80405618:	06f91e63          	bne	s2,a5,80405694 <fd_array_dup+0x9c>
8040561c:	0005a983          	lw	s3,0(a1)
80405620:	00200793          	li	a5,2
80405624:	06f99863          	bne	s3,a5,80405694 <fd_array_dup+0x9c>
80405628:	0145a483          	lw	s1,20(a1)
8040562c:	0085a783          	lw	a5,8(a1)
80405630:	0105a683          	lw	a3,16(a1)
80405634:	0045a703          	lw	a4,4(a1)
80405638:	00050413          	mv	s0,a0
8040563c:	00f52423          	sw	a5,8(a0)
80405640:	00d52823          	sw	a3,16(a0)
80405644:	00e52223          	sw	a4,4(a0)
80405648:	00048513          	mv	a0,s1
8040564c:	601070ef          	jal	ra,8040d44c <inode_ref_inc>
80405650:	00048513          	mv	a0,s1
80405654:	60d070ef          	jal	ra,8040d460 <inode_open_inc>
80405658:	00042783          	lw	a5,0(s0)
8040565c:	00942a23          	sw	s1,20(s0)
80405660:	05279a63          	bne	a5,s2,804056b4 <fd_array_dup+0xbc>
80405664:	04048863          	beqz	s1,804056b4 <fd_array_dup+0xbc>
80405668:	01842783          	lw	a5,24(s0)
8040566c:	01342023          	sw	s3,0(s0)
80405670:	01c12083          	lw	ra,28(sp)
80405674:	00178793          	addi	a5,a5,1
80405678:	00f42c23          	sw	a5,24(s0)
8040567c:	01812403          	lw	s0,24(sp)
80405680:	01412483          	lw	s1,20(sp)
80405684:	01012903          	lw	s2,16(sp)
80405688:	00c12983          	lw	s3,12(sp)
8040568c:	02010113          	addi	sp,sp,32
80405690:	00008067          	ret
80405694:	0000f697          	auipc	a3,0xf
80405698:	87868693          	addi	a3,a3,-1928 # 80413f0c <CSWTCH.69+0x40>
8040569c:	0000d617          	auipc	a2,0xd
804056a0:	5d060613          	addi	a2,a2,1488 # 80412c6c <commands+0x1bc>
804056a4:	07300593          	li	a1,115
804056a8:	0000f517          	auipc	a0,0xf
804056ac:	b9450513          	addi	a0,a0,-1132 # 8041423c <CSWTCH.69+0x370>
804056b0:	f75fa0ef          	jal	ra,80400624 <__panic>
804056b4:	e71ff0ef          	jal	ra,80405524 <fd_array_open.part.9>

804056b8 <file_testfd>:
804056b8:	09000793          	li	a5,144
804056bc:	06a7e463          	bltu	a5,a0,80405724 <file_testfd+0x6c>
804056c0:	00097797          	auipc	a5,0x97
804056c4:	0f078793          	addi	a5,a5,240 # 8049c7b0 <current>
804056c8:	0007a783          	lw	a5,0(a5)
804056cc:	0dc7a703          	lw	a4,220(a5)
804056d0:	04070e63          	beqz	a4,8040572c <file_testfd+0x74>
804056d4:	00872783          	lw	a5,8(a4)
804056d8:	04f05a63          	blez	a5,8040572c <file_testfd+0x74>
804056dc:	00472703          	lw	a4,4(a4)
804056e0:	00351793          	slli	a5,a0,0x3
804056e4:	40a787b3          	sub	a5,a5,a0
804056e8:	00279793          	slli	a5,a5,0x2
804056ec:	00f707b3          	add	a5,a4,a5
804056f0:	0007a683          	lw	a3,0(a5)
804056f4:	00200713          	li	a4,2
804056f8:	02e69663          	bne	a3,a4,80405724 <file_testfd+0x6c>
804056fc:	00c7a703          	lw	a4,12(a5)
80405700:	02e51263          	bne	a0,a4,80405724 <file_testfd+0x6c>
80405704:	00058663          	beqz	a1,80405710 <file_testfd+0x58>
80405708:	0047a503          	lw	a0,4(a5)
8040570c:	00050e63          	beqz	a0,80405728 <file_testfd+0x70>
80405710:	00100513          	li	a0,1
80405714:	00060a63          	beqz	a2,80405728 <file_testfd+0x70>
80405718:	0087a503          	lw	a0,8(a5)
8040571c:	00a03533          	snez	a0,a0
80405720:	00008067          	ret
80405724:	00000513          	li	a0,0
80405728:	00008067          	ret
8040572c:	ff010113          	addi	sp,sp,-16
80405730:	00112623          	sw	ra,12(sp)
80405734:	bbdff0ef          	jal	ra,804052f0 <get_fd_array.part.4>

80405738 <file_open>:
80405738:	fc010113          	addi	sp,sp,-64
8040573c:	02112e23          	sw	ra,60(sp)
80405740:	02812c23          	sw	s0,56(sp)
80405744:	02912a23          	sw	s1,52(sp)
80405748:	03212823          	sw	s2,48(sp)
8040574c:	03312623          	sw	s3,44(sp)
80405750:	03412423          	sw	s4,40(sp)
80405754:	0035f793          	andi	a5,a1,3
80405758:	00300713          	li	a4,3
8040575c:	12e78a63          	beq	a5,a4,80405890 <file_open+0x158>
80405760:	00279793          	slli	a5,a5,0x2
80405764:	0000e717          	auipc	a4,0xe
80405768:	76870713          	addi	a4,a4,1896 # 80413ecc <CSWTCH.69>
8040576c:	00050913          	mv	s2,a0
80405770:	0000e697          	auipc	a3,0xe
80405774:	75068693          	addi	a3,a3,1872 # 80413ec0 <CSWTCH.68>
80405778:	ffff7537          	lui	a0,0xffff7
8040577c:	00f686b3          	add	a3,a3,a5
80405780:	00058493          	mv	s1,a1
80405784:	00f707b3          	add	a5,a4,a5
80405788:	00810593          	addi	a1,sp,8
8040578c:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <end+0x7fb5a219>
80405790:	0006aa03          	lw	s4,0(a3)
80405794:	0007a983          	lw	s3,0(a5)
80405798:	b81ff0ef          	jal	ra,80405318 <fd_array_alloc>
8040579c:	00050413          	mv	s0,a0
804057a0:	02050463          	beqz	a0,804057c8 <file_open+0x90>
804057a4:	00040513          	mv	a0,s0
804057a8:	03c12083          	lw	ra,60(sp)
804057ac:	03812403          	lw	s0,56(sp)
804057b0:	03412483          	lw	s1,52(sp)
804057b4:	03012903          	lw	s2,48(sp)
804057b8:	02c12983          	lw	s3,44(sp)
804057bc:	02812a03          	lw	s4,40(sp)
804057c0:	04010113          	addi	sp,sp,64
804057c4:	00008067          	ret
804057c8:	00c10613          	addi	a2,sp,12
804057cc:	00048593          	mv	a1,s1
804057d0:	00090513          	mv	a0,s2
804057d4:	63c080ef          	jal	ra,8040de10 <vfs_open>
804057d8:	00050413          	mv	s0,a0
804057dc:	0a051463          	bnez	a0,80405884 <file_open+0x14c>
804057e0:	00812783          	lw	a5,8(sp)
804057e4:	0204f593          	andi	a1,s1,32
804057e8:	00c12403          	lw	s0,12(sp)
804057ec:	0007a823          	sw	zero,16(a5)
804057f0:	04058a63          	beqz	a1,80405844 <file_open+0x10c>
804057f4:	0a040463          	beqz	s0,8040589c <file_open+0x164>
804057f8:	03c42783          	lw	a5,60(s0)
804057fc:	0a078063          	beqz	a5,8040589c <file_open+0x164>
80405800:	0147a783          	lw	a5,20(a5)
80405804:	08078c63          	beqz	a5,8040589c <file_open+0x164>
80405808:	00040513          	mv	a0,s0
8040580c:	0000f597          	auipc	a1,0xf
80405810:	8f458593          	addi	a1,a1,-1804 # 80414100 <CSWTCH.69+0x234>
80405814:	461070ef          	jal	ra,8040d474 <inode_check>
80405818:	03c42783          	lw	a5,60(s0)
8040581c:	00c12503          	lw	a0,12(sp)
80405820:	01010593          	addi	a1,sp,16
80405824:	0147a783          	lw	a5,20(a5)
80405828:	000780e7          	jalr	a5
8040582c:	00050413          	mv	s0,a0
80405830:	04051663          	bnez	a0,8040587c <file_open+0x144>
80405834:	00812783          	lw	a5,8(sp)
80405838:	01c12703          	lw	a4,28(sp)
8040583c:	00c12403          	lw	s0,12(sp)
80405840:	00e7a823          	sw	a4,16(a5)
80405844:	0007a683          	lw	a3,0(a5)
80405848:	0087aa23          	sw	s0,20(a5)
8040584c:	0147a223          	sw	s4,4(a5)
80405850:	0137a423          	sw	s3,8(a5)
80405854:	00100713          	li	a4,1
80405858:	04e69063          	bne	a3,a4,80405898 <file_open+0x160>
8040585c:	02040e63          	beqz	s0,80405898 <file_open+0x160>
80405860:	0187a703          	lw	a4,24(a5)
80405864:	00200693          	li	a3,2
80405868:	00d7a023          	sw	a3,0(a5)
8040586c:	00170713          	addi	a4,a4,1
80405870:	00e7ac23          	sw	a4,24(a5)
80405874:	00c7a403          	lw	s0,12(a5)
80405878:	f2dff06f          	j	804057a4 <file_open+0x6c>
8040587c:	00c12503          	lw	a0,12(sp)
80405880:	7e0080ef          	jal	ra,8040e060 <vfs_close>
80405884:	00812503          	lw	a0,8(sp)
80405888:	b75ff0ef          	jal	ra,804053fc <fd_array_free>
8040588c:	f19ff06f          	j	804057a4 <file_open+0x6c>
80405890:	ffd00413          	li	s0,-3
80405894:	f11ff06f          	j	804057a4 <file_open+0x6c>
80405898:	c8dff0ef          	jal	ra,80405524 <fd_array_open.part.9>
8040589c:	0000f697          	auipc	a3,0xf
804058a0:	81468693          	addi	a3,a3,-2028 # 804140b0 <CSWTCH.69+0x1e4>
804058a4:	0000d617          	auipc	a2,0xd
804058a8:	3c860613          	addi	a2,a2,968 # 80412c6c <commands+0x1bc>
804058ac:	0b800593          	li	a1,184
804058b0:	0000f517          	auipc	a0,0xf
804058b4:	98c50513          	addi	a0,a0,-1652 # 8041423c <CSWTCH.69+0x370>
804058b8:	d6dfa0ef          	jal	ra,80400624 <__panic>

804058bc <file_close>:
804058bc:	09000793          	li	a5,144
804058c0:	06a7ec63          	bltu	a5,a0,80405938 <file_close+0x7c>
804058c4:	00097797          	auipc	a5,0x97
804058c8:	eec78793          	addi	a5,a5,-276 # 8049c7b0 <current>
804058cc:	0007a783          	lw	a5,0(a5)
804058d0:	ff010113          	addi	sp,sp,-16
804058d4:	00112623          	sw	ra,12(sp)
804058d8:	0dc7a683          	lw	a3,220(a5)
804058dc:	00050713          	mv	a4,a0
804058e0:	06068063          	beqz	a3,80405940 <file_close+0x84>
804058e4:	0086a783          	lw	a5,8(a3)
804058e8:	04f05c63          	blez	a5,80405940 <file_close+0x84>
804058ec:	00351793          	slli	a5,a0,0x3
804058f0:	0046a503          	lw	a0,4(a3)
804058f4:	40e787b3          	sub	a5,a5,a4
804058f8:	00279793          	slli	a5,a5,0x2
804058fc:	00f50533          	add	a0,a0,a5
80405900:	00052683          	lw	a3,0(a0)
80405904:	00200793          	li	a5,2
80405908:	02f69063          	bne	a3,a5,80405928 <file_close+0x6c>
8040590c:	00c52783          	lw	a5,12(a0)
80405910:	00f71c63          	bne	a4,a5,80405928 <file_close+0x6c>
80405914:	c5dff0ef          	jal	ra,80405570 <fd_array_close>
80405918:	00c12083          	lw	ra,12(sp)
8040591c:	00000513          	li	a0,0
80405920:	01010113          	addi	sp,sp,16
80405924:	00008067          	ret
80405928:	00c12083          	lw	ra,12(sp)
8040592c:	ffd00513          	li	a0,-3
80405930:	01010113          	addi	sp,sp,16
80405934:	00008067          	ret
80405938:	ffd00513          	li	a0,-3
8040593c:	00008067          	ret
80405940:	9b1ff0ef          	jal	ra,804052f0 <get_fd_array.part.4>

80405944 <file_read>:
80405944:	fd010113          	addi	sp,sp,-48
80405948:	02112623          	sw	ra,44(sp)
8040594c:	02812423          	sw	s0,40(sp)
80405950:	02912223          	sw	s1,36(sp)
80405954:	03212023          	sw	s2,32(sp)
80405958:	01312e23          	sw	s3,28(sp)
8040595c:	01412c23          	sw	s4,24(sp)
80405960:	0006a023          	sw	zero,0(a3)
80405964:	09000793          	li	a5,144
80405968:	10a7e263          	bltu	a5,a0,80405a6c <file_read+0x128>
8040596c:	00097797          	auipc	a5,0x97
80405970:	e4478793          	addi	a5,a5,-444 # 8049c7b0 <current>
80405974:	0007a783          	lw	a5,0(a5)
80405978:	00068913          	mv	s2,a3
8040597c:	0dc7a703          	lw	a4,220(a5)
80405980:	0e070a63          	beqz	a4,80405a74 <file_read+0x130>
80405984:	00872783          	lw	a5,8(a4)
80405988:	0ef05663          	blez	a5,80405a74 <file_read+0x130>
8040598c:	00351793          	slli	a5,a0,0x3
80405990:	00472403          	lw	s0,4(a4)
80405994:	40a787b3          	sub	a5,a5,a0
80405998:	00279793          	slli	a5,a5,0x2
8040599c:	00f40433          	add	s0,s0,a5
804059a0:	00042983          	lw	s3,0(s0)
804059a4:	00200793          	li	a5,2
804059a8:	0cf99263          	bne	s3,a5,80405a6c <file_read+0x128>
804059ac:	00c42783          	lw	a5,12(s0)
804059b0:	0af51e63          	bne	a0,a5,80405a6c <file_read+0x128>
804059b4:	00442783          	lw	a5,4(s0)
804059b8:	0a078a63          	beqz	a5,80405a6c <file_read+0x128>
804059bc:	01842783          	lw	a5,24(s0)
804059c0:	01042683          	lw	a3,16(s0)
804059c4:	00010513          	mv	a0,sp
804059c8:	00178793          	addi	a5,a5,1
804059cc:	00f42c23          	sw	a5,24(s0)
804059d0:	311000ef          	jal	ra,804064e0 <iobuf_init>
804059d4:	01442483          	lw	s1,20(s0)
804059d8:	00050a13          	mv	s4,a0
804059dc:	08048e63          	beqz	s1,80405a78 <file_read+0x134>
804059e0:	03c4a783          	lw	a5,60(s1)
804059e4:	08078a63          	beqz	a5,80405a78 <file_read+0x134>
804059e8:	00c7a783          	lw	a5,12(a5)
804059ec:	08078663          	beqz	a5,80405a78 <file_read+0x134>
804059f0:	00048513          	mv	a0,s1
804059f4:	0000e597          	auipc	a1,0xe
804059f8:	76458593          	addi	a1,a1,1892 # 80414158 <CSWTCH.69+0x28c>
804059fc:	279070ef          	jal	ra,8040d474 <inode_check>
80405a00:	03c4a783          	lw	a5,60(s1)
80405a04:	01442503          	lw	a0,20(s0)
80405a08:	000a0593          	mv	a1,s4
80405a0c:	00c7a783          	lw	a5,12(a5)
80405a10:	000780e7          	jalr	a5
80405a14:	008a2783          	lw	a5,8(s4) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80405a18:	00ca2683          	lw	a3,12(s4)
80405a1c:	00042703          	lw	a4,0(s0)
80405a20:	00050493          	mv	s1,a0
80405a24:	40d787b3          	sub	a5,a5,a3
80405a28:	03370a63          	beq	a4,s3,80405a5c <file_read+0x118>
80405a2c:	00f92023          	sw	a5,0(s2)
80405a30:	00040513          	mv	a0,s0
80405a34:	a6dff0ef          	jal	ra,804054a0 <fd_array_release>
80405a38:	02c12083          	lw	ra,44(sp)
80405a3c:	02812403          	lw	s0,40(sp)
80405a40:	00048513          	mv	a0,s1
80405a44:	02012903          	lw	s2,32(sp)
80405a48:	02412483          	lw	s1,36(sp)
80405a4c:	01c12983          	lw	s3,28(sp)
80405a50:	01812a03          	lw	s4,24(sp)
80405a54:	03010113          	addi	sp,sp,48
80405a58:	00008067          	ret
80405a5c:	01042703          	lw	a4,16(s0)
80405a60:	00f70733          	add	a4,a4,a5
80405a64:	00e42823          	sw	a4,16(s0)
80405a68:	fc5ff06f          	j	80405a2c <file_read+0xe8>
80405a6c:	ffd00493          	li	s1,-3
80405a70:	fc9ff06f          	j	80405a38 <file_read+0xf4>
80405a74:	87dff0ef          	jal	ra,804052f0 <get_fd_array.part.4>
80405a78:	0000e697          	auipc	a3,0xe
80405a7c:	69068693          	addi	a3,a3,1680 # 80414108 <CSWTCH.69+0x23c>
80405a80:	0000d617          	auipc	a2,0xd
80405a84:	1ec60613          	addi	a2,a2,492 # 80412c6c <commands+0x1bc>
80405a88:	0e200593          	li	a1,226
80405a8c:	0000e517          	auipc	a0,0xe
80405a90:	7b050513          	addi	a0,a0,1968 # 8041423c <CSWTCH.69+0x370>
80405a94:	b91fa0ef          	jal	ra,80400624 <__panic>

80405a98 <file_write>:
80405a98:	fd010113          	addi	sp,sp,-48
80405a9c:	02112623          	sw	ra,44(sp)
80405aa0:	02812423          	sw	s0,40(sp)
80405aa4:	02912223          	sw	s1,36(sp)
80405aa8:	03212023          	sw	s2,32(sp)
80405aac:	01312e23          	sw	s3,28(sp)
80405ab0:	01412c23          	sw	s4,24(sp)
80405ab4:	0006a023          	sw	zero,0(a3)
80405ab8:	09000793          	li	a5,144
80405abc:	10a7e263          	bltu	a5,a0,80405bc0 <file_write+0x128>
80405ac0:	00097797          	auipc	a5,0x97
80405ac4:	cf078793          	addi	a5,a5,-784 # 8049c7b0 <current>
80405ac8:	0007a783          	lw	a5,0(a5)
80405acc:	00068913          	mv	s2,a3
80405ad0:	0dc7a703          	lw	a4,220(a5)
80405ad4:	0e070a63          	beqz	a4,80405bc8 <file_write+0x130>
80405ad8:	00872783          	lw	a5,8(a4)
80405adc:	0ef05663          	blez	a5,80405bc8 <file_write+0x130>
80405ae0:	00351793          	slli	a5,a0,0x3
80405ae4:	00472403          	lw	s0,4(a4)
80405ae8:	40a787b3          	sub	a5,a5,a0
80405aec:	00279793          	slli	a5,a5,0x2
80405af0:	00f40433          	add	s0,s0,a5
80405af4:	00042983          	lw	s3,0(s0)
80405af8:	00200793          	li	a5,2
80405afc:	0cf99263          	bne	s3,a5,80405bc0 <file_write+0x128>
80405b00:	00c42783          	lw	a5,12(s0)
80405b04:	0af51e63          	bne	a0,a5,80405bc0 <file_write+0x128>
80405b08:	00842783          	lw	a5,8(s0)
80405b0c:	0a078a63          	beqz	a5,80405bc0 <file_write+0x128>
80405b10:	01842783          	lw	a5,24(s0)
80405b14:	01042683          	lw	a3,16(s0)
80405b18:	00010513          	mv	a0,sp
80405b1c:	00178793          	addi	a5,a5,1
80405b20:	00f42c23          	sw	a5,24(s0)
80405b24:	1bd000ef          	jal	ra,804064e0 <iobuf_init>
80405b28:	01442483          	lw	s1,20(s0)
80405b2c:	00050a13          	mv	s4,a0
80405b30:	08048e63          	beqz	s1,80405bcc <file_write+0x134>
80405b34:	03c4a783          	lw	a5,60(s1)
80405b38:	08078a63          	beqz	a5,80405bcc <file_write+0x134>
80405b3c:	0107a783          	lw	a5,16(a5)
80405b40:	08078663          	beqz	a5,80405bcc <file_write+0x134>
80405b44:	00048513          	mv	a0,s1
80405b48:	0000e597          	auipc	a1,0xe
80405b4c:	6c058593          	addi	a1,a1,1728 # 80414208 <CSWTCH.69+0x33c>
80405b50:	125070ef          	jal	ra,8040d474 <inode_check>
80405b54:	03c4a783          	lw	a5,60(s1)
80405b58:	01442503          	lw	a0,20(s0)
80405b5c:	000a0593          	mv	a1,s4
80405b60:	0107a783          	lw	a5,16(a5)
80405b64:	000780e7          	jalr	a5
80405b68:	008a2783          	lw	a5,8(s4)
80405b6c:	00ca2683          	lw	a3,12(s4)
80405b70:	00042703          	lw	a4,0(s0)
80405b74:	00050493          	mv	s1,a0
80405b78:	40d787b3          	sub	a5,a5,a3
80405b7c:	03370a63          	beq	a4,s3,80405bb0 <file_write+0x118>
80405b80:	00f92023          	sw	a5,0(s2)
80405b84:	00040513          	mv	a0,s0
80405b88:	919ff0ef          	jal	ra,804054a0 <fd_array_release>
80405b8c:	02c12083          	lw	ra,44(sp)
80405b90:	02812403          	lw	s0,40(sp)
80405b94:	00048513          	mv	a0,s1
80405b98:	02012903          	lw	s2,32(sp)
80405b9c:	02412483          	lw	s1,36(sp)
80405ba0:	01c12983          	lw	s3,28(sp)
80405ba4:	01812a03          	lw	s4,24(sp)
80405ba8:	03010113          	addi	sp,sp,48
80405bac:	00008067          	ret
80405bb0:	01042703          	lw	a4,16(s0)
80405bb4:	00f70733          	add	a4,a4,a5
80405bb8:	00e42823          	sw	a4,16(s0)
80405bbc:	fc5ff06f          	j	80405b80 <file_write+0xe8>
80405bc0:	ffd00493          	li	s1,-3
80405bc4:	fc9ff06f          	j	80405b8c <file_write+0xf4>
80405bc8:	f28ff0ef          	jal	ra,804052f0 <get_fd_array.part.4>
80405bcc:	0000e697          	auipc	a3,0xe
80405bd0:	5ec68693          	addi	a3,a3,1516 # 804141b8 <CSWTCH.69+0x2ec>
80405bd4:	0000d617          	auipc	a2,0xd
80405bd8:	09860613          	addi	a2,a2,152 # 80412c6c <commands+0x1bc>
80405bdc:	0fc00593          	li	a1,252
80405be0:	0000e517          	auipc	a0,0xe
80405be4:	65c50513          	addi	a0,a0,1628 # 8041423c <CSWTCH.69+0x370>
80405be8:	a3dfa0ef          	jal	ra,80400624 <__panic>

80405bec <file_seek>:
80405bec:	fe010113          	addi	sp,sp,-32
80405bf0:	00112e23          	sw	ra,28(sp)
80405bf4:	00812c23          	sw	s0,24(sp)
80405bf8:	00912a23          	sw	s1,20(sp)
80405bfc:	01212823          	sw	s2,16(sp)
80405c00:	09000793          	li	a5,144
80405c04:	12a7ea63          	bltu	a5,a0,80405d38 <file_seek+0x14c>
80405c08:	00097797          	auipc	a5,0x97
80405c0c:	ba878793          	addi	a5,a5,-1112 # 8049c7b0 <current>
80405c10:	0007a783          	lw	a5,0(a5)
80405c14:	0dc7a703          	lw	a4,220(a5)
80405c18:	14070063          	beqz	a4,80405d58 <file_seek+0x16c>
80405c1c:	00872783          	lw	a5,8(a4)
80405c20:	12f05c63          	blez	a5,80405d58 <file_seek+0x16c>
80405c24:	00472403          	lw	s0,4(a4)
80405c28:	00351793          	slli	a5,a0,0x3
80405c2c:	40a787b3          	sub	a5,a5,a0
80405c30:	00279793          	slli	a5,a5,0x2
80405c34:	00f40433          	add	s0,s0,a5
80405c38:	00042703          	lw	a4,0(s0)
80405c3c:	00200793          	li	a5,2
80405c40:	0ef71c63          	bne	a4,a5,80405d38 <file_seek+0x14c>
80405c44:	00c42783          	lw	a5,12(s0)
80405c48:	0ef51863          	bne	a0,a5,80405d38 <file_seek+0x14c>
80405c4c:	01842783          	lw	a5,24(s0)
80405c50:	00100693          	li	a3,1
80405c54:	00058913          	mv	s2,a1
80405c58:	00178793          	addi	a5,a5,1
80405c5c:	00f42c23          	sw	a5,24(s0)
80405c60:	0cd60663          	beq	a2,a3,80405d2c <file_seek+0x140>
80405c64:	02e60863          	beq	a2,a4,80405c94 <file_seek+0xa8>
80405c68:	ffd00493          	li	s1,-3
80405c6c:	06060a63          	beqz	a2,80405ce0 <file_seek+0xf4>
80405c70:	00040513          	mv	a0,s0
80405c74:	82dff0ef          	jal	ra,804054a0 <fd_array_release>
80405c78:	01c12083          	lw	ra,28(sp)
80405c7c:	01812403          	lw	s0,24(sp)
80405c80:	00048513          	mv	a0,s1
80405c84:	01012903          	lw	s2,16(sp)
80405c88:	01412483          	lw	s1,20(sp)
80405c8c:	02010113          	addi	sp,sp,32
80405c90:	00008067          	ret
80405c94:	01442483          	lw	s1,20(s0)
80405c98:	0e048263          	beqz	s1,80405d7c <file_seek+0x190>
80405c9c:	03c4a783          	lw	a5,60(s1)
80405ca0:	0c078e63          	beqz	a5,80405d7c <file_seek+0x190>
80405ca4:	0147a783          	lw	a5,20(a5)
80405ca8:	0c078a63          	beqz	a5,80405d7c <file_seek+0x190>
80405cac:	00048513          	mv	a0,s1
80405cb0:	0000e597          	auipc	a1,0xe
80405cb4:	45058593          	addi	a1,a1,1104 # 80414100 <CSWTCH.69+0x234>
80405cb8:	7bc070ef          	jal	ra,8040d474 <inode_check>
80405cbc:	03c4a783          	lw	a5,60(s1)
80405cc0:	01442503          	lw	a0,20(s0)
80405cc4:	00010593          	mv	a1,sp
80405cc8:	0147a783          	lw	a5,20(a5)
80405ccc:	000780e7          	jalr	a5
80405cd0:	00050493          	mv	s1,a0
80405cd4:	f8051ee3          	bnez	a0,80405c70 <file_seek+0x84>
80405cd8:	00c12783          	lw	a5,12(sp)
80405cdc:	00f90933          	add	s2,s2,a5
80405ce0:	01442483          	lw	s1,20(s0)
80405ce4:	06048c63          	beqz	s1,80405d5c <file_seek+0x170>
80405ce8:	03c4a783          	lw	a5,60(s1)
80405cec:	06078863          	beqz	a5,80405d5c <file_seek+0x170>
80405cf0:	02c7a783          	lw	a5,44(a5)
80405cf4:	06078463          	beqz	a5,80405d5c <file_seek+0x170>
80405cf8:	00048513          	mv	a0,s1
80405cfc:	0000e597          	auipc	a1,0xe
80405d00:	4b458593          	addi	a1,a1,1204 # 804141b0 <CSWTCH.69+0x2e4>
80405d04:	770070ef          	jal	ra,8040d474 <inode_check>
80405d08:	03c4a783          	lw	a5,60(s1)
80405d0c:	01442503          	lw	a0,20(s0)
80405d10:	00090593          	mv	a1,s2
80405d14:	02c7a783          	lw	a5,44(a5)
80405d18:	000780e7          	jalr	a5
80405d1c:	00050493          	mv	s1,a0
80405d20:	f40518e3          	bnez	a0,80405c70 <file_seek+0x84>
80405d24:	01242823          	sw	s2,16(s0)
80405d28:	f49ff06f          	j	80405c70 <file_seek+0x84>
80405d2c:	01042783          	lw	a5,16(s0)
80405d30:	00f58933          	add	s2,a1,a5
80405d34:	fadff06f          	j	80405ce0 <file_seek+0xf4>
80405d38:	01c12083          	lw	ra,28(sp)
80405d3c:	01812403          	lw	s0,24(sp)
80405d40:	ffd00493          	li	s1,-3
80405d44:	00048513          	mv	a0,s1
80405d48:	01012903          	lw	s2,16(sp)
80405d4c:	01412483          	lw	s1,20(sp)
80405d50:	02010113          	addi	sp,sp,32
80405d54:	00008067          	ret
80405d58:	d98ff0ef          	jal	ra,804052f0 <get_fd_array.part.4>
80405d5c:	0000e697          	auipc	a3,0xe
80405d60:	40468693          	addi	a3,a3,1028 # 80414160 <CSWTCH.69+0x294>
80405d64:	0000d617          	auipc	a2,0xd
80405d68:	f0860613          	addi	a2,a2,-248 # 80412c6c <commands+0x1bc>
80405d6c:	11e00593          	li	a1,286
80405d70:	0000e517          	auipc	a0,0xe
80405d74:	4cc50513          	addi	a0,a0,1228 # 8041423c <CSWTCH.69+0x370>
80405d78:	8adfa0ef          	jal	ra,80400624 <__panic>
80405d7c:	0000e697          	auipc	a3,0xe
80405d80:	33468693          	addi	a3,a3,820 # 804140b0 <CSWTCH.69+0x1e4>
80405d84:	0000d617          	auipc	a2,0xd
80405d88:	ee860613          	addi	a2,a2,-280 # 80412c6c <commands+0x1bc>
80405d8c:	11600593          	li	a1,278
80405d90:	0000e517          	auipc	a0,0xe
80405d94:	4ac50513          	addi	a0,a0,1196 # 8041423c <CSWTCH.69+0x370>
80405d98:	88dfa0ef          	jal	ra,80400624 <__panic>

80405d9c <file_fstat>:
80405d9c:	ff010113          	addi	sp,sp,-16
80405da0:	00112623          	sw	ra,12(sp)
80405da4:	00812423          	sw	s0,8(sp)
80405da8:	00912223          	sw	s1,4(sp)
80405dac:	01212023          	sw	s2,0(sp)
80405db0:	09000793          	li	a5,144
80405db4:	0aa7ee63          	bltu	a5,a0,80405e70 <file_fstat+0xd4>
80405db8:	00097797          	auipc	a5,0x97
80405dbc:	9f878793          	addi	a5,a5,-1544 # 8049c7b0 <current>
80405dc0:	0007a783          	lw	a5,0(a5)
80405dc4:	00058913          	mv	s2,a1
80405dc8:	0dc7a703          	lw	a4,220(a5)
80405dcc:	0c070263          	beqz	a4,80405e90 <file_fstat+0xf4>
80405dd0:	00872783          	lw	a5,8(a4)
80405dd4:	0af05e63          	blez	a5,80405e90 <file_fstat+0xf4>
80405dd8:	00472403          	lw	s0,4(a4)
80405ddc:	00351793          	slli	a5,a0,0x3
80405de0:	40a787b3          	sub	a5,a5,a0
80405de4:	00279793          	slli	a5,a5,0x2
80405de8:	00f40433          	add	s0,s0,a5
80405dec:	00042703          	lw	a4,0(s0)
80405df0:	00200793          	li	a5,2
80405df4:	06f71e63          	bne	a4,a5,80405e70 <file_fstat+0xd4>
80405df8:	00c42783          	lw	a5,12(s0)
80405dfc:	06f51a63          	bne	a0,a5,80405e70 <file_fstat+0xd4>
80405e00:	01842783          	lw	a5,24(s0)
80405e04:	01442483          	lw	s1,20(s0)
80405e08:	00178793          	addi	a5,a5,1
80405e0c:	00f42c23          	sw	a5,24(s0)
80405e10:	08048263          	beqz	s1,80405e94 <file_fstat+0xf8>
80405e14:	03c4a783          	lw	a5,60(s1)
80405e18:	06078e63          	beqz	a5,80405e94 <file_fstat+0xf8>
80405e1c:	0147a783          	lw	a5,20(a5)
80405e20:	06078a63          	beqz	a5,80405e94 <file_fstat+0xf8>
80405e24:	00048513          	mv	a0,s1
80405e28:	0000e597          	auipc	a1,0xe
80405e2c:	2d858593          	addi	a1,a1,728 # 80414100 <CSWTCH.69+0x234>
80405e30:	644070ef          	jal	ra,8040d474 <inode_check>
80405e34:	03c4a783          	lw	a5,60(s1)
80405e38:	01442503          	lw	a0,20(s0)
80405e3c:	00090593          	mv	a1,s2
80405e40:	0147a783          	lw	a5,20(a5)
80405e44:	000780e7          	jalr	a5
80405e48:	00050493          	mv	s1,a0
80405e4c:	00040513          	mv	a0,s0
80405e50:	e50ff0ef          	jal	ra,804054a0 <fd_array_release>
80405e54:	00c12083          	lw	ra,12(sp)
80405e58:	00812403          	lw	s0,8(sp)
80405e5c:	00048513          	mv	a0,s1
80405e60:	00012903          	lw	s2,0(sp)
80405e64:	00412483          	lw	s1,4(sp)
80405e68:	01010113          	addi	sp,sp,16
80405e6c:	00008067          	ret
80405e70:	00c12083          	lw	ra,12(sp)
80405e74:	00812403          	lw	s0,8(sp)
80405e78:	ffd00493          	li	s1,-3
80405e7c:	00048513          	mv	a0,s1
80405e80:	00012903          	lw	s2,0(sp)
80405e84:	00412483          	lw	s1,4(sp)
80405e88:	01010113          	addi	sp,sp,16
80405e8c:	00008067          	ret
80405e90:	c60ff0ef          	jal	ra,804052f0 <get_fd_array.part.4>
80405e94:	0000e697          	auipc	a3,0xe
80405e98:	21c68693          	addi	a3,a3,540 # 804140b0 <CSWTCH.69+0x1e4>
80405e9c:	0000d617          	auipc	a2,0xd
80405ea0:	dd060613          	addi	a2,a2,-560 # 80412c6c <commands+0x1bc>
80405ea4:	13000593          	li	a1,304
80405ea8:	0000e517          	auipc	a0,0xe
80405eac:	39450513          	addi	a0,a0,916 # 8041423c <CSWTCH.69+0x370>
80405eb0:	f74fa0ef          	jal	ra,80400624 <__panic>

80405eb4 <file_fsync>:
80405eb4:	ff010113          	addi	sp,sp,-16
80405eb8:	00112623          	sw	ra,12(sp)
80405ebc:	00812423          	sw	s0,8(sp)
80405ec0:	00912223          	sw	s1,4(sp)
80405ec4:	09000793          	li	a5,144
80405ec8:	0aa7e863          	bltu	a5,a0,80405f78 <file_fsync+0xc4>
80405ecc:	00097797          	auipc	a5,0x97
80405ed0:	8e478793          	addi	a5,a5,-1820 # 8049c7b0 <current>
80405ed4:	0007a783          	lw	a5,0(a5)
80405ed8:	0dc7a703          	lw	a4,220(a5)
80405edc:	0a070c63          	beqz	a4,80405f94 <file_fsync+0xe0>
80405ee0:	00872783          	lw	a5,8(a4)
80405ee4:	0af05863          	blez	a5,80405f94 <file_fsync+0xe0>
80405ee8:	00472403          	lw	s0,4(a4)
80405eec:	00351793          	slli	a5,a0,0x3
80405ef0:	40a787b3          	sub	a5,a5,a0
80405ef4:	00279793          	slli	a5,a5,0x2
80405ef8:	00f40433          	add	s0,s0,a5
80405efc:	00042703          	lw	a4,0(s0)
80405f00:	00200793          	li	a5,2
80405f04:	06f71a63          	bne	a4,a5,80405f78 <file_fsync+0xc4>
80405f08:	00c42783          	lw	a5,12(s0)
80405f0c:	06f51663          	bne	a0,a5,80405f78 <file_fsync+0xc4>
80405f10:	01842783          	lw	a5,24(s0)
80405f14:	01442483          	lw	s1,20(s0)
80405f18:	00178793          	addi	a5,a5,1
80405f1c:	00f42c23          	sw	a5,24(s0)
80405f20:	06048c63          	beqz	s1,80405f98 <file_fsync+0xe4>
80405f24:	03c4a783          	lw	a5,60(s1)
80405f28:	06078863          	beqz	a5,80405f98 <file_fsync+0xe4>
80405f2c:	0187a783          	lw	a5,24(a5)
80405f30:	06078463          	beqz	a5,80405f98 <file_fsync+0xe4>
80405f34:	0000e597          	auipc	a1,0xe
80405f38:	11458593          	addi	a1,a1,276 # 80414048 <CSWTCH.69+0x17c>
80405f3c:	00048513          	mv	a0,s1
80405f40:	534070ef          	jal	ra,8040d474 <inode_check>
80405f44:	03c4a783          	lw	a5,60(s1)
80405f48:	01442503          	lw	a0,20(s0)
80405f4c:	0187a783          	lw	a5,24(a5)
80405f50:	000780e7          	jalr	a5
80405f54:	00050493          	mv	s1,a0
80405f58:	00040513          	mv	a0,s0
80405f5c:	d44ff0ef          	jal	ra,804054a0 <fd_array_release>
80405f60:	00c12083          	lw	ra,12(sp)
80405f64:	00812403          	lw	s0,8(sp)
80405f68:	00048513          	mv	a0,s1
80405f6c:	00412483          	lw	s1,4(sp)
80405f70:	01010113          	addi	sp,sp,16
80405f74:	00008067          	ret
80405f78:	00c12083          	lw	ra,12(sp)
80405f7c:	00812403          	lw	s0,8(sp)
80405f80:	ffd00493          	li	s1,-3
80405f84:	00048513          	mv	a0,s1
80405f88:	00412483          	lw	s1,4(sp)
80405f8c:	01010113          	addi	sp,sp,16
80405f90:	00008067          	ret
80405f94:	b5cff0ef          	jal	ra,804052f0 <get_fd_array.part.4>
80405f98:	0000e697          	auipc	a3,0xe
80405f9c:	06068693          	addi	a3,a3,96 # 80413ff8 <CSWTCH.69+0x12c>
80405fa0:	0000d617          	auipc	a2,0xd
80405fa4:	ccc60613          	addi	a2,a2,-820 # 80412c6c <commands+0x1bc>
80405fa8:	13e00593          	li	a1,318
80405fac:	0000e517          	auipc	a0,0xe
80405fb0:	29050513          	addi	a0,a0,656 # 8041423c <CSWTCH.69+0x370>
80405fb4:	e70fa0ef          	jal	ra,80400624 <__panic>

80405fb8 <file_getdirentry>:
80405fb8:	fd010113          	addi	sp,sp,-48
80405fbc:	02112623          	sw	ra,44(sp)
80405fc0:	02812423          	sw	s0,40(sp)
80405fc4:	02912223          	sw	s1,36(sp)
80405fc8:	03212023          	sw	s2,32(sp)
80405fcc:	01312e23          	sw	s3,28(sp)
80405fd0:	09000793          	li	a5,144
80405fd4:	0ea7ec63          	bltu	a5,a0,804060cc <file_getdirentry+0x114>
80405fd8:	00096797          	auipc	a5,0x96
80405fdc:	7d878793          	addi	a5,a5,2008 # 8049c7b0 <current>
80405fe0:	0007a783          	lw	a5,0(a5)
80405fe4:	00058493          	mv	s1,a1
80405fe8:	0dc7a703          	lw	a4,220(a5)
80405fec:	10070263          	beqz	a4,804060f0 <file_getdirentry+0x138>
80405ff0:	00872783          	lw	a5,8(a4)
80405ff4:	0ef05e63          	blez	a5,804060f0 <file_getdirentry+0x138>
80405ff8:	00472403          	lw	s0,4(a4)
80405ffc:	00351793          	slli	a5,a0,0x3
80406000:	40a787b3          	sub	a5,a5,a0
80406004:	00279793          	slli	a5,a5,0x2
80406008:	00f40433          	add	s0,s0,a5
8040600c:	00042703          	lw	a4,0(s0)
80406010:	00200793          	li	a5,2
80406014:	0af71c63          	bne	a4,a5,804060cc <file_getdirentry+0x114>
80406018:	00c42783          	lw	a5,12(s0)
8040601c:	0af51863          	bne	a0,a5,804060cc <file_getdirentry+0x114>
80406020:	01842783          	lw	a5,24(s0)
80406024:	10000613          	li	a2,256
80406028:	00458593          	addi	a1,a1,4
8040602c:	00178793          	addi	a5,a5,1
80406030:	00f42c23          	sw	a5,24(s0)
80406034:	0004a683          	lw	a3,0(s1)
80406038:	00010513          	mv	a0,sp
8040603c:	4a4000ef          	jal	ra,804064e0 <iobuf_init>
80406040:	01442903          	lw	s2,20(s0)
80406044:	00050993          	mv	s3,a0
80406048:	0a090663          	beqz	s2,804060f4 <file_getdirentry+0x13c>
8040604c:	03c92783          	lw	a5,60(s2)
80406050:	0a078263          	beqz	a5,804060f4 <file_getdirentry+0x13c>
80406054:	0207a783          	lw	a5,32(a5)
80406058:	08078e63          	beqz	a5,804060f4 <file_getdirentry+0x13c>
8040605c:	00090513          	mv	a0,s2
80406060:	0000e597          	auipc	a1,0xe
80406064:	04458593          	addi	a1,a1,68 # 804140a4 <CSWTCH.69+0x1d8>
80406068:	40c070ef          	jal	ra,8040d474 <inode_check>
8040606c:	03c92783          	lw	a5,60(s2)
80406070:	01442503          	lw	a0,20(s0)
80406074:	00098593          	mv	a1,s3
80406078:	0207a783          	lw	a5,32(a5)
8040607c:	000780e7          	jalr	a5
80406080:	00050913          	mv	s2,a0
80406084:	02050663          	beqz	a0,804060b0 <file_getdirentry+0xf8>
80406088:	00040513          	mv	a0,s0
8040608c:	c14ff0ef          	jal	ra,804054a0 <fd_array_release>
80406090:	02c12083          	lw	ra,44(sp)
80406094:	02812403          	lw	s0,40(sp)
80406098:	00090513          	mv	a0,s2
8040609c:	02412483          	lw	s1,36(sp)
804060a0:	02012903          	lw	s2,32(sp)
804060a4:	01c12983          	lw	s3,28(sp)
804060a8:	03010113          	addi	sp,sp,48
804060ac:	00008067          	ret
804060b0:	0004a783          	lw	a5,0(s1)
804060b4:	0089a683          	lw	a3,8(s3) # 1008 <_binary_bin_swap_img_size-0x6ff8>
804060b8:	00c9a703          	lw	a4,12(s3)
804060bc:	00d787b3          	add	a5,a5,a3
804060c0:	40e787b3          	sub	a5,a5,a4
804060c4:	00f4a023          	sw	a5,0(s1)
804060c8:	fc1ff06f          	j	80406088 <file_getdirentry+0xd0>
804060cc:	02c12083          	lw	ra,44(sp)
804060d0:	02812403          	lw	s0,40(sp)
804060d4:	ffd00913          	li	s2,-3
804060d8:	00090513          	mv	a0,s2
804060dc:	02412483          	lw	s1,36(sp)
804060e0:	02012903          	lw	s2,32(sp)
804060e4:	01c12983          	lw	s3,28(sp)
804060e8:	03010113          	addi	sp,sp,48
804060ec:	00008067          	ret
804060f0:	a00ff0ef          	jal	ra,804052f0 <get_fd_array.part.4>
804060f4:	0000e697          	auipc	a3,0xe
804060f8:	f5c68693          	addi	a3,a3,-164 # 80414050 <CSWTCH.69+0x184>
804060fc:	0000d617          	auipc	a2,0xd
80406100:	b7060613          	addi	a2,a2,-1168 # 80412c6c <commands+0x1bc>
80406104:	14e00593          	li	a1,334
80406108:	0000e517          	auipc	a0,0xe
8040610c:	13450513          	addi	a0,a0,308 # 8041423c <CSWTCH.69+0x370>
80406110:	d14fa0ef          	jal	ra,80400624 <__panic>

80406114 <file_dup>:
80406114:	09000793          	li	a5,144
80406118:	0aa7e863          	bltu	a5,a0,804061c8 <file_dup+0xb4>
8040611c:	00096797          	auipc	a5,0x96
80406120:	69478793          	addi	a5,a5,1684 # 8049c7b0 <current>
80406124:	0007a783          	lw	a5,0(a5)
80406128:	fe010113          	addi	sp,sp,-32
8040612c:	00112e23          	sw	ra,28(sp)
80406130:	0dc7a683          	lw	a3,220(a5)
80406134:	00812c23          	sw	s0,24(sp)
80406138:	00050713          	mv	a4,a0
8040613c:	00058513          	mv	a0,a1
80406140:	08068863          	beqz	a3,804061d0 <file_dup+0xbc>
80406144:	0086a783          	lw	a5,8(a3)
80406148:	08f05463          	blez	a5,804061d0 <file_dup+0xbc>
8040614c:	0046a403          	lw	s0,4(a3)
80406150:	00371793          	slli	a5,a4,0x3
80406154:	40e787b3          	sub	a5,a5,a4
80406158:	00279793          	slli	a5,a5,0x2
8040615c:	00f40433          	add	s0,s0,a5
80406160:	00042683          	lw	a3,0(s0)
80406164:	00200793          	li	a5,2
80406168:	04f69663          	bne	a3,a5,804061b4 <file_dup+0xa0>
8040616c:	00c42783          	lw	a5,12(s0)
80406170:	04f71263          	bne	a4,a5,804061b4 <file_dup+0xa0>
80406174:	00c10593          	addi	a1,sp,12
80406178:	9a0ff0ef          	jal	ra,80405318 <fd_array_alloc>
8040617c:	00050a63          	beqz	a0,80406190 <file_dup+0x7c>
80406180:	01c12083          	lw	ra,28(sp)
80406184:	01812403          	lw	s0,24(sp)
80406188:	02010113          	addi	sp,sp,32
8040618c:	00008067          	ret
80406190:	00c12503          	lw	a0,12(sp)
80406194:	00040593          	mv	a1,s0
80406198:	c60ff0ef          	jal	ra,804055f8 <fd_array_dup>
8040619c:	00c12783          	lw	a5,12(sp)
804061a0:	01c12083          	lw	ra,28(sp)
804061a4:	01812403          	lw	s0,24(sp)
804061a8:	00c7a503          	lw	a0,12(a5)
804061ac:	02010113          	addi	sp,sp,32
804061b0:	00008067          	ret
804061b4:	01c12083          	lw	ra,28(sp)
804061b8:	01812403          	lw	s0,24(sp)
804061bc:	ffd00513          	li	a0,-3
804061c0:	02010113          	addi	sp,sp,32
804061c4:	00008067          	ret
804061c8:	ffd00513          	li	a0,-3
804061cc:	00008067          	ret
804061d0:	920ff0ef          	jal	ra,804052f0 <get_fd_array.part.4>

804061d4 <fs_init>:
804061d4:	ff010113          	addi	sp,sp,-16
804061d8:	00112623          	sw	ra,12(sp)
804061dc:	554070ef          	jal	ra,8040d730 <vfs_init>
804061e0:	7f0080ef          	jal	ra,8040e9d0 <dev_init>
804061e4:	00c12083          	lw	ra,12(sp)
804061e8:	01010113          	addi	sp,sp,16
804061ec:	4500906f          	j	8040f63c <sfs_init>

804061f0 <fs_cleanup>:
804061f0:	1110706f          	j	8040db00 <vfs_cleanup>

804061f4 <lock_files>:
804061f4:	00c50513          	addi	a0,a0,12
804061f8:	e95fe06f          	j	8040508c <down>

804061fc <unlock_files>:
804061fc:	00c50513          	addi	a0,a0,12
80406200:	e89fe06f          	j	80405088 <up>

80406204 <files_create>:
80406204:	ff010113          	addi	sp,sp,-16
80406208:	00001537          	lui	a0,0x1
8040620c:	00812423          	sw	s0,8(sp)
80406210:	00112623          	sw	ra,12(sp)
80406214:	e7cfc0ef          	jal	ra,80402890 <kmalloc>
80406218:	00050413          	mv	s0,a0
8040621c:	02050463          	beqz	a0,80406244 <files_create+0x40>
80406220:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6fe8>
80406224:	00042023          	sw	zero,0(s0)
80406228:	00c50513          	addi	a0,a0,12
8040622c:	00f42223          	sw	a5,4(s0)
80406230:	00042423          	sw	zero,8(s0)
80406234:	00100593          	li	a1,1
80406238:	e45fe0ef          	jal	ra,8040507c <sem_init>
8040623c:	00442503          	lw	a0,4(s0)
80406240:	b0cff0ef          	jal	ra,8040554c <fd_array_init>
80406244:	00040513          	mv	a0,s0
80406248:	00c12083          	lw	ra,12(sp)
8040624c:	00812403          	lw	s0,8(sp)
80406250:	01010113          	addi	sp,sp,16
80406254:	00008067          	ret

80406258 <files_destroy>:
80406258:	fe010113          	addi	sp,sp,-32
8040625c:	00112e23          	sw	ra,28(sp)
80406260:	00812c23          	sw	s0,24(sp)
80406264:	00912a23          	sw	s1,20(sp)
80406268:	01212823          	sw	s2,16(sp)
8040626c:	01312623          	sw	s3,12(sp)
80406270:	08050a63          	beqz	a0,80406304 <files_destroy+0xac>
80406274:	00852783          	lw	a5,8(a0)
80406278:	00050993          	mv	s3,a0
8040627c:	08079463          	bnez	a5,80406304 <files_destroy+0xac>
80406280:	00052503          	lw	a0,0(a0)
80406284:	00050463          	beqz	a0,8040628c <files_destroy+0x34>
80406288:	2b8070ef          	jal	ra,8040d540 <inode_ref_dec>
8040628c:	0049a403          	lw	s0,4(s3)
80406290:	000014b7          	lui	s1,0x1
80406294:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406298:	009404b3          	add	s1,s0,s1
8040629c:	00200913          	li	s2,2
804062a0:	00042783          	lw	a5,0(s0)
804062a4:	03278863          	beq	a5,s2,804062d4 <files_destroy+0x7c>
804062a8:	02079e63          	bnez	a5,804062e4 <files_destroy+0x8c>
804062ac:	01c40413          	addi	s0,s0,28
804062b0:	fe8498e3          	bne	s1,s0,804062a0 <files_destroy+0x48>
804062b4:	01812403          	lw	s0,24(sp)
804062b8:	01c12083          	lw	ra,28(sp)
804062bc:	01412483          	lw	s1,20(sp)
804062c0:	01012903          	lw	s2,16(sp)
804062c4:	00098513          	mv	a0,s3
804062c8:	00c12983          	lw	s3,12(sp)
804062cc:	02010113          	addi	sp,sp,32
804062d0:	ee4fc06f          	j	804029b4 <kfree>
804062d4:	00040513          	mv	a0,s0
804062d8:	a98ff0ef          	jal	ra,80405570 <fd_array_close>
804062dc:	00042783          	lw	a5,0(s0)
804062e0:	fc9ff06f          	j	804062a8 <files_destroy+0x50>
804062e4:	0000e697          	auipc	a3,0xe
804062e8:	fd468693          	addi	a3,a3,-44 # 804142b8 <CSWTCH.69+0x3ec>
804062ec:	0000d617          	auipc	a2,0xd
804062f0:	98060613          	addi	a2,a2,-1664 # 80412c6c <commands+0x1bc>
804062f4:	03d00593          	li	a1,61
804062f8:	0000e517          	auipc	a0,0xe
804062fc:	fb050513          	addi	a0,a0,-80 # 804142a8 <CSWTCH.69+0x3dc>
80406300:	b24fa0ef          	jal	ra,80400624 <__panic>
80406304:	0000e697          	auipc	a3,0xe
80406308:	f7868693          	addi	a3,a3,-136 # 8041427c <CSWTCH.69+0x3b0>
8040630c:	0000d617          	auipc	a2,0xd
80406310:	96060613          	addi	a2,a2,-1696 # 80412c6c <commands+0x1bc>
80406314:	03300593          	li	a1,51
80406318:	0000e517          	auipc	a0,0xe
8040631c:	f9050513          	addi	a0,a0,-112 # 804142a8 <CSWTCH.69+0x3dc>
80406320:	b04fa0ef          	jal	ra,80400624 <__panic>

80406324 <files_closeall>:
80406324:	ff010113          	addi	sp,sp,-16
80406328:	00112623          	sw	ra,12(sp)
8040632c:	00812423          	sw	s0,8(sp)
80406330:	00912223          	sw	s1,4(sp)
80406334:	01212023          	sw	s2,0(sp)
80406338:	06050063          	beqz	a0,80406398 <files_closeall+0x74>
8040633c:	00852783          	lw	a5,8(a0)
80406340:	04f05c63          	blez	a5,80406398 <files_closeall+0x74>
80406344:	00452483          	lw	s1,4(a0)
80406348:	000017b7          	lui	a5,0x1
8040634c:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406350:	03848413          	addi	s0,s1,56
80406354:	00200913          	li	s2,2
80406358:	00f484b3          	add	s1,s1,a5
8040635c:	00c0006f          	j	80406368 <files_closeall+0x44>
80406360:	01c40413          	addi	s0,s0,28
80406364:	00848e63          	beq	s1,s0,80406380 <files_closeall+0x5c>
80406368:	00042783          	lw	a5,0(s0)
8040636c:	ff279ae3          	bne	a5,s2,80406360 <files_closeall+0x3c>
80406370:	00040513          	mv	a0,s0
80406374:	01c40413          	addi	s0,s0,28
80406378:	9f8ff0ef          	jal	ra,80405570 <fd_array_close>
8040637c:	fe8496e3          	bne	s1,s0,80406368 <files_closeall+0x44>
80406380:	00c12083          	lw	ra,12(sp)
80406384:	00812403          	lw	s0,8(sp)
80406388:	00412483          	lw	s1,4(sp)
8040638c:	00012903          	lw	s2,0(sp)
80406390:	01010113          	addi	sp,sp,16
80406394:	00008067          	ret
80406398:	0000e697          	auipc	a3,0xe
8040639c:	e7868693          	addi	a3,a3,-392 # 80414210 <CSWTCH.69+0x344>
804063a0:	0000d617          	auipc	a2,0xd
804063a4:	8cc60613          	addi	a2,a2,-1844 # 80412c6c <commands+0x1bc>
804063a8:	04500593          	li	a1,69
804063ac:	0000e517          	auipc	a0,0xe
804063b0:	efc50513          	addi	a0,a0,-260 # 804142a8 <CSWTCH.69+0x3dc>
804063b4:	a70fa0ef          	jal	ra,80400624 <__panic>

804063b8 <dup_files>:
804063b8:	fe010113          	addi	sp,sp,-32
804063bc:	00112e23          	sw	ra,28(sp)
804063c0:	00812c23          	sw	s0,24(sp)
804063c4:	00912a23          	sw	s1,20(sp)
804063c8:	01212823          	sw	s2,16(sp)
804063cc:	01312623          	sw	s3,12(sp)
804063d0:	01412423          	sw	s4,8(sp)
804063d4:	0a050263          	beqz	a0,80406478 <dup_files+0xc0>
804063d8:	00058413          	mv	s0,a1
804063dc:	08058e63          	beqz	a1,80406478 <dup_files+0xc0>
804063e0:	00852783          	lw	a5,8(a0)
804063e4:	00050493          	mv	s1,a0
804063e8:	0a079863          	bnez	a5,80406498 <dup_files+0xe0>
804063ec:	0085a783          	lw	a5,8(a1)
804063f0:	0af05463          	blez	a5,80406498 <dup_files+0xe0>
804063f4:	0005a503          	lw	a0,0(a1)
804063f8:	00a4a023          	sw	a0,0(s1)
804063fc:	00050463          	beqz	a0,80406404 <dup_files+0x4c>
80406400:	04c070ef          	jal	ra,8040d44c <inode_ref_inc>
80406404:	00442403          	lw	s0,4(s0)
80406408:	00001937          	lui	s2,0x1
8040640c:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406410:	0044a483          	lw	s1,4(s1)
80406414:	01240933          	add	s2,s0,s2
80406418:	00200993          	li	s3,2
8040641c:	00100a13          	li	s4,1
80406420:	0100006f          	j	80406430 <dup_files+0x78>
80406424:	01c40413          	addi	s0,s0,28
80406428:	01c48493          	addi	s1,s1,28
8040642c:	02890463          	beq	s2,s0,80406454 <dup_files+0x9c>
80406430:	00042783          	lw	a5,0(s0)
80406434:	ff3798e3          	bne	a5,s3,80406424 <dup_files+0x6c>
80406438:	0144a023          	sw	s4,0(s1)
8040643c:	00040593          	mv	a1,s0
80406440:	00048513          	mv	a0,s1
80406444:	01c40413          	addi	s0,s0,28
80406448:	9b0ff0ef          	jal	ra,804055f8 <fd_array_dup>
8040644c:	01c48493          	addi	s1,s1,28
80406450:	fe8910e3          	bne	s2,s0,80406430 <dup_files+0x78>
80406454:	01c12083          	lw	ra,28(sp)
80406458:	01812403          	lw	s0,24(sp)
8040645c:	01412483          	lw	s1,20(sp)
80406460:	01012903          	lw	s2,16(sp)
80406464:	00c12983          	lw	s3,12(sp)
80406468:	00812a03          	lw	s4,8(sp)
8040646c:	00000513          	li	a0,0
80406470:	02010113          	addi	sp,sp,32
80406474:	00008067          	ret
80406478:	0000e697          	auipc	a3,0xe
8040647c:	8e868693          	addi	a3,a3,-1816 # 80413d60 <default_pmm_manager+0x7a8>
80406480:	0000c617          	auipc	a2,0xc
80406484:	7ec60613          	addi	a2,a2,2028 # 80412c6c <commands+0x1bc>
80406488:	05300593          	li	a1,83
8040648c:	0000e517          	auipc	a0,0xe
80406490:	e1c50513          	addi	a0,a0,-484 # 804142a8 <CSWTCH.69+0x3dc>
80406494:	990fa0ef          	jal	ra,80400624 <__panic>
80406498:	0000e697          	auipc	a3,0xe
8040649c:	db468693          	addi	a3,a3,-588 # 8041424c <CSWTCH.69+0x380>
804064a0:	0000c617          	auipc	a2,0xc
804064a4:	7cc60613          	addi	a2,a2,1996 # 80412c6c <commands+0x1bc>
804064a8:	05400593          	li	a1,84
804064ac:	0000e517          	auipc	a0,0xe
804064b0:	dfc50513          	addi	a0,a0,-516 # 804142a8 <CSWTCH.69+0x3dc>
804064b4:	970fa0ef          	jal	ra,80400624 <__panic>

804064b8 <iobuf_skip.part.0>:
804064b8:	ff010113          	addi	sp,sp,-16
804064bc:	0000e697          	auipc	a3,0xe
804064c0:	e1468693          	addi	a3,a3,-492 # 804142d0 <CSWTCH.69+0x404>
804064c4:	0000c617          	auipc	a2,0xc
804064c8:	7a860613          	addi	a2,a2,1960 # 80412c6c <commands+0x1bc>
804064cc:	04a00593          	li	a1,74
804064d0:	0000e517          	auipc	a0,0xe
804064d4:	e1450513          	addi	a0,a0,-492 # 804142e4 <CSWTCH.69+0x418>
804064d8:	00112623          	sw	ra,12(sp)
804064dc:	948fa0ef          	jal	ra,80400624 <__panic>

804064e0 <iobuf_init>:
804064e0:	00b52023          	sw	a1,0(a0)
804064e4:	00d52223          	sw	a3,4(a0)
804064e8:	00c52623          	sw	a2,12(a0)
804064ec:	00c52423          	sw	a2,8(a0)
804064f0:	00008067          	ret

804064f4 <iobuf_move>:
804064f4:	fe010113          	addi	sp,sp,-32
804064f8:	00812c23          	sw	s0,24(sp)
804064fc:	00c52403          	lw	s0,12(a0)
80406500:	00912a23          	sw	s1,20(sp)
80406504:	01212823          	sw	s2,16(sp)
80406508:	01312623          	sw	s3,12(sp)
8040650c:	00112e23          	sw	ra,28(sp)
80406510:	00050493          	mv	s1,a0
80406514:	00060913          	mv	s2,a2
80406518:	00058513          	mv	a0,a1
8040651c:	00070993          	mv	s3,a4
80406520:	00867463          	bgeu	a2,s0,80406528 <iobuf_move+0x34>
80406524:	00060413          	mv	s0,a2
80406528:	04040063          	beqz	s0,80406568 <iobuf_move+0x74>
8040652c:	0004a583          	lw	a1,0(s1)
80406530:	06069263          	bnez	a3,80406594 <iobuf_move+0xa0>
80406534:	00040613          	mv	a2,s0
80406538:	3200c0ef          	jal	ra,80412858 <memmove>
8040653c:	00c4a783          	lw	a5,12(s1)
80406540:	0687e663          	bltu	a5,s0,804065ac <iobuf_move+0xb8>
80406544:	0004a683          	lw	a3,0(s1)
80406548:	0044a703          	lw	a4,4(s1)
8040654c:	408787b3          	sub	a5,a5,s0
80406550:	008686b3          	add	a3,a3,s0
80406554:	00870733          	add	a4,a4,s0
80406558:	00d4a023          	sw	a3,0(s1)
8040655c:	00e4a223          	sw	a4,4(s1)
80406560:	00f4a623          	sw	a5,12(s1)
80406564:	40890933          	sub	s2,s2,s0
80406568:	00098463          	beqz	s3,80406570 <iobuf_move+0x7c>
8040656c:	0089a023          	sw	s0,0(s3)
80406570:	00000513          	li	a0,0
80406574:	02091863          	bnez	s2,804065a4 <iobuf_move+0xb0>
80406578:	01c12083          	lw	ra,28(sp)
8040657c:	01812403          	lw	s0,24(sp)
80406580:	01412483          	lw	s1,20(sp)
80406584:	01012903          	lw	s2,16(sp)
80406588:	00c12983          	lw	s3,12(sp)
8040658c:	02010113          	addi	sp,sp,32
80406590:	00008067          	ret
80406594:	00058793          	mv	a5,a1
80406598:	00050593          	mv	a1,a0
8040659c:	00078513          	mv	a0,a5
804065a0:	f95ff06f          	j	80406534 <iobuf_move+0x40>
804065a4:	ffc00513          	li	a0,-4
804065a8:	fd1ff06f          	j	80406578 <iobuf_move+0x84>
804065ac:	f0dff0ef          	jal	ra,804064b8 <iobuf_skip.part.0>

804065b0 <iobuf_skip>:
804065b0:	00c52783          	lw	a5,12(a0)
804065b4:	02b7e463          	bltu	a5,a1,804065dc <iobuf_skip+0x2c>
804065b8:	00052683          	lw	a3,0(a0)
804065bc:	00452703          	lw	a4,4(a0)
804065c0:	40b787b3          	sub	a5,a5,a1
804065c4:	00b686b3          	add	a3,a3,a1
804065c8:	00b705b3          	add	a1,a4,a1
804065cc:	00d52023          	sw	a3,0(a0)
804065d0:	00b52223          	sw	a1,4(a0)
804065d4:	00f52623          	sw	a5,12(a0)
804065d8:	00008067          	ret
804065dc:	ff010113          	addi	sp,sp,-16
804065e0:	00112623          	sw	ra,12(sp)
804065e4:	ed5ff0ef          	jal	ra,804064b8 <iobuf_skip.part.0>

804065e8 <copy_path>:
804065e8:	fe010113          	addi	sp,sp,-32
804065ec:	01212823          	sw	s2,16(sp)
804065f0:	00096917          	auipc	s2,0x96
804065f4:	1c090913          	addi	s2,s2,448 # 8049c7b0 <current>
804065f8:	00092783          	lw	a5,0(s2)
804065fc:	01412423          	sw	s4,8(sp)
80406600:	00050a13          	mv	s4,a0
80406604:	00001537          	lui	a0,0x1
80406608:	00912a23          	sw	s1,20(sp)
8040660c:	01312623          	sw	s3,12(sp)
80406610:	00112e23          	sw	ra,28(sp)
80406614:	00812c23          	sw	s0,24(sp)
80406618:	01512223          	sw	s5,4(sp)
8040661c:	00058993          	mv	s3,a1
80406620:	0187a483          	lw	s1,24(a5)
80406624:	a6cfc0ef          	jal	ra,80402890 <kmalloc>
80406628:	0c050463          	beqz	a0,804066f0 <copy_path+0x108>
8040662c:	00050413          	mv	s0,a0
80406630:	06048863          	beqz	s1,804066a0 <copy_path+0xb8>
80406634:	01c48a93          	addi	s5,s1,28
80406638:	000a8513          	mv	a0,s5
8040663c:	a51fe0ef          	jal	ra,8040508c <down>
80406640:	00092783          	lw	a5,0(s2)
80406644:	08078263          	beqz	a5,804066c8 <copy_path+0xe0>
80406648:	0047a783          	lw	a5,4(a5)
8040664c:	000016b7          	lui	a3,0x1
80406650:	00098613          	mv	a2,s3
80406654:	02f4a423          	sw	a5,40(s1)
80406658:	00040593          	mv	a1,s0
8040665c:	00048513          	mv	a0,s1
80406660:	f3cfe0ef          	jal	ra,80404d9c <copy_string>
80406664:	06050e63          	beqz	a0,804066e0 <copy_path+0xf8>
80406668:	000a8513          	mv	a0,s5
8040666c:	a1dfe0ef          	jal	ra,80405088 <up>
80406670:	0204a423          	sw	zero,40(s1)
80406674:	008a2023          	sw	s0,0(s4)
80406678:	00000513          	li	a0,0
8040667c:	01c12083          	lw	ra,28(sp)
80406680:	01812403          	lw	s0,24(sp)
80406684:	01412483          	lw	s1,20(sp)
80406688:	01012903          	lw	s2,16(sp)
8040668c:	00c12983          	lw	s3,12(sp)
80406690:	00812a03          	lw	s4,8(sp)
80406694:	00412a83          	lw	s5,4(sp)
80406698:	02010113          	addi	sp,sp,32
8040669c:	00008067          	ret
804066a0:	00050593          	mv	a1,a0
804066a4:	000016b7          	lui	a3,0x1
804066a8:	00098613          	mv	a2,s3
804066ac:	00000513          	li	a0,0
804066b0:	eecfe0ef          	jal	ra,80404d9c <copy_string>
804066b4:	fc0510e3          	bnez	a0,80406674 <copy_path+0x8c>
804066b8:	00040513          	mv	a0,s0
804066bc:	af8fc0ef          	jal	ra,804029b4 <kfree>
804066c0:	ffd00513          	li	a0,-3
804066c4:	fb9ff06f          	j	8040667c <copy_path+0x94>
804066c8:	000016b7          	lui	a3,0x1
804066cc:	00098613          	mv	a2,s3
804066d0:	00040593          	mv	a1,s0
804066d4:	00048513          	mv	a0,s1
804066d8:	ec4fe0ef          	jal	ra,80404d9c <copy_string>
804066dc:	f80516e3          	bnez	a0,80406668 <copy_path+0x80>
804066e0:	000a8513          	mv	a0,s5
804066e4:	9a5fe0ef          	jal	ra,80405088 <up>
804066e8:	0204a423          	sw	zero,40(s1)
804066ec:	fcdff06f          	j	804066b8 <copy_path+0xd0>
804066f0:	ffc00513          	li	a0,-4
804066f4:	f89ff06f          	j	8040667c <copy_path+0x94>

804066f8 <sysfile_open>:
804066f8:	fe010113          	addi	sp,sp,-32
804066fc:	00912a23          	sw	s1,20(sp)
80406700:	00058493          	mv	s1,a1
80406704:	00050593          	mv	a1,a0
80406708:	00c10513          	addi	a0,sp,12
8040670c:	00812c23          	sw	s0,24(sp)
80406710:	00112e23          	sw	ra,28(sp)
80406714:	ed5ff0ef          	jal	ra,804065e8 <copy_path>
80406718:	00050413          	mv	s0,a0
8040671c:	00051e63          	bnez	a0,80406738 <sysfile_open+0x40>
80406720:	00c12503          	lw	a0,12(sp)
80406724:	00048593          	mv	a1,s1
80406728:	810ff0ef          	jal	ra,80405738 <file_open>
8040672c:	00050413          	mv	s0,a0
80406730:	00c12503          	lw	a0,12(sp)
80406734:	a80fc0ef          	jal	ra,804029b4 <kfree>
80406738:	00040513          	mv	a0,s0
8040673c:	01c12083          	lw	ra,28(sp)
80406740:	01812403          	lw	s0,24(sp)
80406744:	01412483          	lw	s1,20(sp)
80406748:	02010113          	addi	sp,sp,32
8040674c:	00008067          	ret

80406750 <sysfile_close>:
80406750:	96cff06f          	j	804058bc <file_close>

80406754 <sysfile_read>:
80406754:	fc010113          	addi	sp,sp,-64
80406758:	02912a23          	sw	s1,52(sp)
8040675c:	02112e23          	sw	ra,60(sp)
80406760:	02812c23          	sw	s0,56(sp)
80406764:	03212823          	sw	s2,48(sp)
80406768:	03312623          	sw	s3,44(sp)
8040676c:	03412423          	sw	s4,40(sp)
80406770:	03512223          	sw	s5,36(sp)
80406774:	03612023          	sw	s6,32(sp)
80406778:	01712e23          	sw	s7,28(sp)
8040677c:	01812c23          	sw	s8,24(sp)
80406780:	01912a23          	sw	s9,20(sp)
80406784:	00000493          	li	s1,0
80406788:	02061e63          	bnez	a2,804067c4 <sysfile_read+0x70>
8040678c:	03c12083          	lw	ra,60(sp)
80406790:	03812403          	lw	s0,56(sp)
80406794:	00048513          	mv	a0,s1
80406798:	03012903          	lw	s2,48(sp)
8040679c:	03412483          	lw	s1,52(sp)
804067a0:	02c12983          	lw	s3,44(sp)
804067a4:	02812a03          	lw	s4,40(sp)
804067a8:	02412a83          	lw	s5,36(sp)
804067ac:	02012b03          	lw	s6,32(sp)
804067b0:	01c12b83          	lw	s7,28(sp)
804067b4:	01812c03          	lw	s8,24(sp)
804067b8:	01412c83          	lw	s9,20(sp)
804067bc:	04010113          	addi	sp,sp,64
804067c0:	00008067          	ret
804067c4:	00096c97          	auipc	s9,0x96
804067c8:	fecc8c93          	addi	s9,s9,-20 # 8049c7b0 <current>
804067cc:	000ca783          	lw	a5,0(s9)
804067d0:	00060413          	mv	s0,a2
804067d4:	00058b13          	mv	s6,a1
804067d8:	00000613          	li	a2,0
804067dc:	00100593          	li	a1,1
804067e0:	00050a93          	mv	s5,a0
804067e4:	0187a903          	lw	s2,24(a5)
804067e8:	ed1fe0ef          	jal	ra,804056b8 <file_testfd>
804067ec:	10050063          	beqz	a0,804068ec <sysfile_read+0x198>
804067f0:	00001537          	lui	a0,0x1
804067f4:	89cfc0ef          	jal	ra,80402890 <kmalloc>
804067f8:	00050993          	mv	s3,a0
804067fc:	0e050c63          	beqz	a0,804068f4 <sysfile_read+0x1a0>
80406800:	00000b93          	li	s7,0
80406804:	00001a37          	lui	s4,0x1
80406808:	01c90c13          	addi	s8,s2,28
8040680c:	0d446663          	bltu	s0,s4,804068d8 <sysfile_read+0x184>
80406810:	01412623          	sw	s4,12(sp)
80406814:	00001637          	lui	a2,0x1
80406818:	00c10693          	addi	a3,sp,12
8040681c:	00098593          	mv	a1,s3
80406820:	000a8513          	mv	a0,s5
80406824:	920ff0ef          	jal	ra,80405944 <file_read>
80406828:	00c12683          	lw	a3,12(sp)
8040682c:	00050493          	mv	s1,a0
80406830:	08068863          	beqz	a3,804068c0 <sysfile_read+0x16c>
80406834:	02090063          	beqz	s2,80406854 <sysfile_read+0x100>
80406838:	000c0513          	mv	a0,s8
8040683c:	851fe0ef          	jal	ra,8040508c <down>
80406840:	000ca783          	lw	a5,0(s9)
80406844:	0a078063          	beqz	a5,804068e4 <sysfile_read+0x190>
80406848:	0047a783          	lw	a5,4(a5)
8040684c:	00c12683          	lw	a3,12(sp)
80406850:	02f92423          	sw	a5,40(s2)
80406854:	00098613          	mv	a2,s3
80406858:	000b0593          	mv	a1,s6
8040685c:	00090513          	mv	a0,s2
80406860:	ce0fe0ef          	jal	ra,80404d40 <copy_to_user>
80406864:	04050063          	beqz	a0,804068a4 <sysfile_read+0x150>
80406868:	00c12783          	lw	a5,12(sp)
8040686c:	08f46863          	bltu	s0,a5,804068fc <sysfile_read+0x1a8>
80406870:	00fb0b33          	add	s6,s6,a5
80406874:	40f40433          	sub	s0,s0,a5
80406878:	00fb8bb3          	add	s7,s7,a5
8040687c:	02091a63          	bnez	s2,804068b0 <sysfile_read+0x15c>
80406880:	00049863          	bnez	s1,80406890 <sysfile_read+0x13c>
80406884:	00c12783          	lw	a5,12(sp)
80406888:	02078e63          	beqz	a5,804068c4 <sysfile_read+0x170>
8040688c:	f80410e3          	bnez	s0,8040680c <sysfile_read+0xb8>
80406890:	00098513          	mv	a0,s3
80406894:	920fc0ef          	jal	ra,804029b4 <kfree>
80406898:	ee0b8ae3          	beqz	s7,8040678c <sysfile_read+0x38>
8040689c:	000b8493          	mv	s1,s7
804068a0:	eedff06f          	j	8040678c <sysfile_read+0x38>
804068a4:	00049463          	bnez	s1,804068ac <sysfile_read+0x158>
804068a8:	ffd00493          	li	s1,-3
804068ac:	fe0902e3          	beqz	s2,80406890 <sysfile_read+0x13c>
804068b0:	000c0513          	mv	a0,s8
804068b4:	fd4fe0ef          	jal	ra,80405088 <up>
804068b8:	02092423          	sw	zero,40(s2)
804068bc:	fc5ff06f          	j	80406880 <sysfile_read+0x12c>
804068c0:	fc0518e3          	bnez	a0,80406890 <sysfile_read+0x13c>
804068c4:	00098513          	mv	a0,s3
804068c8:	00000493          	li	s1,0
804068cc:	8e8fc0ef          	jal	ra,804029b4 <kfree>
804068d0:	ea0b8ee3          	beqz	s7,8040678c <sysfile_read+0x38>
804068d4:	fc9ff06f          	j	8040689c <sysfile_read+0x148>
804068d8:	00812623          	sw	s0,12(sp)
804068dc:	00040613          	mv	a2,s0
804068e0:	f39ff06f          	j	80406818 <sysfile_read+0xc4>
804068e4:	00c12683          	lw	a3,12(sp)
804068e8:	f6dff06f          	j	80406854 <sysfile_read+0x100>
804068ec:	ffd00493          	li	s1,-3
804068f0:	e9dff06f          	j	8040678c <sysfile_read+0x38>
804068f4:	ffc00493          	li	s1,-4
804068f8:	e95ff06f          	j	8040678c <sysfile_read+0x38>
804068fc:	0000e697          	auipc	a3,0xe
80406900:	9f868693          	addi	a3,a3,-1544 # 804142f4 <CSWTCH.69+0x428>
80406904:	0000c617          	auipc	a2,0xc
80406908:	36860613          	addi	a2,a2,872 # 80412c6c <commands+0x1bc>
8040690c:	05500593          	li	a1,85
80406910:	0000e517          	auipc	a0,0xe
80406914:	9f050513          	addi	a0,a0,-1552 # 80414300 <CSWTCH.69+0x434>
80406918:	d0df90ef          	jal	ra,80400624 <__panic>

8040691c <sysfile_write>:
8040691c:	fc010113          	addi	sp,sp,-64
80406920:	03512223          	sw	s5,36(sp)
80406924:	02112e23          	sw	ra,60(sp)
80406928:	02812c23          	sw	s0,56(sp)
8040692c:	02912a23          	sw	s1,52(sp)
80406930:	03212823          	sw	s2,48(sp)
80406934:	03312623          	sw	s3,44(sp)
80406938:	03412423          	sw	s4,40(sp)
8040693c:	03612023          	sw	s6,32(sp)
80406940:	01712e23          	sw	s7,28(sp)
80406944:	01812c23          	sw	s8,24(sp)
80406948:	01912a23          	sw	s9,20(sp)
8040694c:	00000a93          	li	s5,0
80406950:	02061e63          	bnez	a2,8040698c <sysfile_write+0x70>
80406954:	03c12083          	lw	ra,60(sp)
80406958:	03812403          	lw	s0,56(sp)
8040695c:	000a8513          	mv	a0,s5
80406960:	03412483          	lw	s1,52(sp)
80406964:	03012903          	lw	s2,48(sp)
80406968:	02c12983          	lw	s3,44(sp)
8040696c:	02812a03          	lw	s4,40(sp)
80406970:	02412a83          	lw	s5,36(sp)
80406974:	02012b03          	lw	s6,32(sp)
80406978:	01c12b83          	lw	s7,28(sp)
8040697c:	01812c03          	lw	s8,24(sp)
80406980:	01412c83          	lw	s9,20(sp)
80406984:	04010113          	addi	sp,sp,64
80406988:	00008067          	ret
8040698c:	00096b97          	auipc	s7,0x96
80406990:	e24b8b93          	addi	s7,s7,-476 # 8049c7b0 <current>
80406994:	000ba783          	lw	a5,0(s7)
80406998:	00060413          	mv	s0,a2
8040699c:	00058a13          	mv	s4,a1
804069a0:	00100613          	li	a2,1
804069a4:	00000593          	li	a1,0
804069a8:	00050c93          	mv	s9,a0
804069ac:	0187a483          	lw	s1,24(a5)
804069b0:	d09fe0ef          	jal	ra,804056b8 <file_testfd>
804069b4:	0e050e63          	beqz	a0,80406ab0 <sysfile_write+0x194>
804069b8:	00001537          	lui	a0,0x1
804069bc:	ed5fb0ef          	jal	ra,80402890 <kmalloc>
804069c0:	00050993          	mv	s3,a0
804069c4:	0e050a63          	beqz	a0,80406ab8 <sysfile_write+0x19c>
804069c8:	00000c13          	li	s8,0
804069cc:	00001937          	lui	s2,0x1
804069d0:	01c48b13          	addi	s6,s1,28
804069d4:	09246063          	bltu	s0,s2,80406a54 <sysfile_write+0x138>
804069d8:	01212623          	sw	s2,12(sp)
804069dc:	08048063          	beqz	s1,80406a5c <sysfile_write+0x140>
804069e0:	000b0513          	mv	a0,s6
804069e4:	ea8fe0ef          	jal	ra,8040508c <down>
804069e8:	000ba783          	lw	a5,0(s7)
804069ec:	00078663          	beqz	a5,804069f8 <sysfile_write+0xdc>
804069f0:	0047a783          	lw	a5,4(a5)
804069f4:	02f4a423          	sw	a5,40(s1)
804069f8:	00c12683          	lw	a3,12(sp)
804069fc:	00000713          	li	a4,0
80406a00:	000a0613          	mv	a2,s4
80406a04:	00098593          	mv	a1,s3
80406a08:	00048513          	mv	a0,s1
80406a0c:	ad4fe0ef          	jal	ra,80404ce0 <copy_from_user>
80406a10:	06050863          	beqz	a0,80406a80 <sysfile_write+0x164>
80406a14:	000b0513          	mv	a0,s6
80406a18:	e70fe0ef          	jal	ra,80405088 <up>
80406a1c:	0204a423          	sw	zero,40(s1)
80406a20:	00c12603          	lw	a2,12(sp)
80406a24:	00c10693          	addi	a3,sp,12
80406a28:	00098593          	mv	a1,s3
80406a2c:	000c8513          	mv	a0,s9
80406a30:	868ff0ef          	jal	ra,80405a98 <file_write>
80406a34:	00c12783          	lw	a5,12(sp)
80406a38:	00050a93          	mv	s5,a0
80406a3c:	04079c63          	bnez	a5,80406a94 <sysfile_write+0x178>
80406a40:	00098513          	mv	a0,s3
80406a44:	f71fb0ef          	jal	ra,804029b4 <kfree>
80406a48:	f00c06e3          	beqz	s8,80406954 <sysfile_write+0x38>
80406a4c:	000c0a93          	mv	s5,s8
80406a50:	f05ff06f          	j	80406954 <sysfile_write+0x38>
80406a54:	00812623          	sw	s0,12(sp)
80406a58:	f80494e3          	bnez	s1,804069e0 <sysfile_write+0xc4>
80406a5c:	00c12683          	lw	a3,12(sp)
80406a60:	00000713          	li	a4,0
80406a64:	000a0613          	mv	a2,s4
80406a68:	00098593          	mv	a1,s3
80406a6c:	00000513          	li	a0,0
80406a70:	a70fe0ef          	jal	ra,80404ce0 <copy_from_user>
80406a74:	fa0516e3          	bnez	a0,80406a20 <sysfile_write+0x104>
80406a78:	ffd00a93          	li	s5,-3
80406a7c:	fc5ff06f          	j	80406a40 <sysfile_write+0x124>
80406a80:	000b0513          	mv	a0,s6
80406a84:	e04fe0ef          	jal	ra,80405088 <up>
80406a88:	ffd00a93          	li	s5,-3
80406a8c:	0204a423          	sw	zero,40(s1)
80406a90:	fb1ff06f          	j	80406a40 <sysfile_write+0x124>
80406a94:	02f46663          	bltu	s0,a5,80406ac0 <sysfile_write+0x1a4>
80406a98:	00fa0a33          	add	s4,s4,a5
80406a9c:	40f40433          	sub	s0,s0,a5
80406aa0:	00fc0c33          	add	s8,s8,a5
80406aa4:	f8051ee3          	bnez	a0,80406a40 <sysfile_write+0x124>
80406aa8:	f20416e3          	bnez	s0,804069d4 <sysfile_write+0xb8>
80406aac:	f95ff06f          	j	80406a40 <sysfile_write+0x124>
80406ab0:	ffd00a93          	li	s5,-3
80406ab4:	ea1ff06f          	j	80406954 <sysfile_write+0x38>
80406ab8:	ffc00a93          	li	s5,-4
80406abc:	e99ff06f          	j	80406954 <sysfile_write+0x38>
80406ac0:	0000e697          	auipc	a3,0xe
80406ac4:	83468693          	addi	a3,a3,-1996 # 804142f4 <CSWTCH.69+0x428>
80406ac8:	0000c617          	auipc	a2,0xc
80406acc:	1a460613          	addi	a2,a2,420 # 80412c6c <commands+0x1bc>
80406ad0:	08a00593          	li	a1,138
80406ad4:	0000e517          	auipc	a0,0xe
80406ad8:	82c50513          	addi	a0,a0,-2004 # 80414300 <CSWTCH.69+0x434>
80406adc:	b49f90ef          	jal	ra,80400624 <__panic>

80406ae0 <sysfile_seek>:
80406ae0:	90cff06f          	j	80405bec <file_seek>

80406ae4 <sysfile_fstat>:
80406ae4:	fd010113          	addi	sp,sp,-48
80406ae8:	03212023          	sw	s2,32(sp)
80406aec:	00096917          	auipc	s2,0x96
80406af0:	cc490913          	addi	s2,s2,-828 # 8049c7b0 <current>
80406af4:	00092783          	lw	a5,0(s2)
80406af8:	01312e23          	sw	s3,28(sp)
80406afc:	00058993          	mv	s3,a1
80406b00:	00010593          	mv	a1,sp
80406b04:	02812423          	sw	s0,40(sp)
80406b08:	02912223          	sw	s1,36(sp)
80406b0c:	02112623          	sw	ra,44(sp)
80406b10:	01412c23          	sw	s4,24(sp)
80406b14:	0187a483          	lw	s1,24(a5)
80406b18:	a84ff0ef          	jal	ra,80405d9c <file_fstat>
80406b1c:	00050413          	mv	s0,a0
80406b20:	04051463          	bnez	a0,80406b68 <sysfile_fstat+0x84>
80406b24:	06048463          	beqz	s1,80406b8c <sysfile_fstat+0xa8>
80406b28:	01c48a13          	addi	s4,s1,28
80406b2c:	000a0513          	mv	a0,s4
80406b30:	d5cfe0ef          	jal	ra,8040508c <down>
80406b34:	00092783          	lw	a5,0(s2)
80406b38:	06078863          	beqz	a5,80406ba8 <sysfile_fstat+0xc4>
80406b3c:	0047a783          	lw	a5,4(a5)
80406b40:	01000693          	li	a3,16
80406b44:	00010613          	mv	a2,sp
80406b48:	02f4a423          	sw	a5,40(s1)
80406b4c:	00098593          	mv	a1,s3
80406b50:	00048513          	mv	a0,s1
80406b54:	9ecfe0ef          	jal	ra,80404d40 <copy_to_user>
80406b58:	06050463          	beqz	a0,80406bc0 <sysfile_fstat+0xdc>
80406b5c:	000a0513          	mv	a0,s4
80406b60:	d28fe0ef          	jal	ra,80405088 <up>
80406b64:	0204a423          	sw	zero,40(s1)
80406b68:	00040513          	mv	a0,s0
80406b6c:	02c12083          	lw	ra,44(sp)
80406b70:	02812403          	lw	s0,40(sp)
80406b74:	02412483          	lw	s1,36(sp)
80406b78:	02012903          	lw	s2,32(sp)
80406b7c:	01c12983          	lw	s3,28(sp)
80406b80:	01812a03          	lw	s4,24(sp)
80406b84:	03010113          	addi	sp,sp,48
80406b88:	00008067          	ret
80406b8c:	01000693          	li	a3,16
80406b90:	00010613          	mv	a2,sp
80406b94:	00098593          	mv	a1,s3
80406b98:	9a8fe0ef          	jal	ra,80404d40 <copy_to_user>
80406b9c:	fc0516e3          	bnez	a0,80406b68 <sysfile_fstat+0x84>
80406ba0:	ffd00413          	li	s0,-3
80406ba4:	fc5ff06f          	j	80406b68 <sysfile_fstat+0x84>
80406ba8:	01000693          	li	a3,16
80406bac:	00010613          	mv	a2,sp
80406bb0:	00098593          	mv	a1,s3
80406bb4:	00048513          	mv	a0,s1
80406bb8:	988fe0ef          	jal	ra,80404d40 <copy_to_user>
80406bbc:	fa0510e3          	bnez	a0,80406b5c <sysfile_fstat+0x78>
80406bc0:	000a0513          	mv	a0,s4
80406bc4:	cc4fe0ef          	jal	ra,80405088 <up>
80406bc8:	ffd00413          	li	s0,-3
80406bcc:	0204a423          	sw	zero,40(s1)
80406bd0:	f99ff06f          	j	80406b68 <sysfile_fstat+0x84>

80406bd4 <sysfile_fsync>:
80406bd4:	ae0ff06f          	j	80405eb4 <file_fsync>

80406bd8 <sysfile_getcwd>:
80406bd8:	fd010113          	addi	sp,sp,-48
80406bdc:	01312e23          	sw	s3,28(sp)
80406be0:	00096997          	auipc	s3,0x96
80406be4:	bd098993          	addi	s3,s3,-1072 # 8049c7b0 <current>
80406be8:	0009a783          	lw	a5,0(s3)
80406bec:	03212023          	sw	s2,32(sp)
80406bf0:	02112623          	sw	ra,44(sp)
80406bf4:	02812423          	sw	s0,40(sp)
80406bf8:	02912223          	sw	s1,36(sp)
80406bfc:	01412c23          	sw	s4,24(sp)
80406c00:	0187a903          	lw	s2,24(a5)
80406c04:	08058863          	beqz	a1,80406c94 <sysfile_getcwd+0xbc>
80406c08:	00050493          	mv	s1,a0
80406c0c:	00058413          	mv	s0,a1
80406c10:	06090663          	beqz	s2,80406c7c <sysfile_getcwd+0xa4>
80406c14:	01c90a13          	addi	s4,s2,28
80406c18:	000a0513          	mv	a0,s4
80406c1c:	c70fe0ef          	jal	ra,8040508c <down>
80406c20:	0009a783          	lw	a5,0(s3)
80406c24:	00078663          	beqz	a5,80406c30 <sysfile_getcwd+0x58>
80406c28:	0047a783          	lw	a5,4(a5)
80406c2c:	02f92423          	sw	a5,40(s2)
80406c30:	00100693          	li	a3,1
80406c34:	00040613          	mv	a2,s0
80406c38:	00048593          	mv	a1,s1
80406c3c:	00090513          	mv	a0,s2
80406c40:	fc9fd0ef          	jal	ra,80404c08 <user_mem_check>
80406c44:	04051c63          	bnez	a0,80406c9c <sysfile_getcwd+0xc4>
80406c48:	ffd00413          	li	s0,-3
80406c4c:	000a0513          	mv	a0,s4
80406c50:	c38fe0ef          	jal	ra,80405088 <up>
80406c54:	02092423          	sw	zero,40(s2)
80406c58:	00040513          	mv	a0,s0
80406c5c:	02c12083          	lw	ra,44(sp)
80406c60:	02812403          	lw	s0,40(sp)
80406c64:	02412483          	lw	s1,36(sp)
80406c68:	02012903          	lw	s2,32(sp)
80406c6c:	01c12983          	lw	s3,28(sp)
80406c70:	01812a03          	lw	s4,24(sp)
80406c74:	03010113          	addi	sp,sp,48
80406c78:	00008067          	ret
80406c7c:	00058613          	mv	a2,a1
80406c80:	00100693          	li	a3,1
80406c84:	00050593          	mv	a1,a0
80406c88:	00000513          	li	a0,0
80406c8c:	f7dfd0ef          	jal	ra,80404c08 <user_mem_check>
80406c90:	02051663          	bnez	a0,80406cbc <sysfile_getcwd+0xe4>
80406c94:	ffd00413          	li	s0,-3
80406c98:	fc1ff06f          	j	80406c58 <sysfile_getcwd+0x80>
80406c9c:	00040613          	mv	a2,s0
80406ca0:	00000693          	li	a3,0
80406ca4:	00048593          	mv	a1,s1
80406ca8:	00010513          	mv	a0,sp
80406cac:	835ff0ef          	jal	ra,804064e0 <iobuf_init>
80406cb0:	039070ef          	jal	ra,8040e4e8 <vfs_getcwd>
80406cb4:	00050413          	mv	s0,a0
80406cb8:	f95ff06f          	j	80406c4c <sysfile_getcwd+0x74>
80406cbc:	00040613          	mv	a2,s0
80406cc0:	00000693          	li	a3,0
80406cc4:	00048593          	mv	a1,s1
80406cc8:	00010513          	mv	a0,sp
80406ccc:	815ff0ef          	jal	ra,804064e0 <iobuf_init>
80406cd0:	019070ef          	jal	ra,8040e4e8 <vfs_getcwd>
80406cd4:	00050413          	mv	s0,a0
80406cd8:	f81ff06f          	j	80406c58 <sysfile_getcwd+0x80>

80406cdc <sysfile_getdirentry>:
80406cdc:	fe010113          	addi	sp,sp,-32
80406ce0:	01212823          	sw	s2,16(sp)
80406ce4:	00096917          	auipc	s2,0x96
80406ce8:	acc90913          	addi	s2,s2,-1332 # 8049c7b0 <current>
80406cec:	00092783          	lw	a5,0(s2)
80406cf0:	01312623          	sw	s3,12(sp)
80406cf4:	00050993          	mv	s3,a0
80406cf8:	10400513          	li	a0,260
80406cfc:	00912a23          	sw	s1,20(sp)
80406d00:	01412423          	sw	s4,8(sp)
80406d04:	00112e23          	sw	ra,28(sp)
80406d08:	00812c23          	sw	s0,24(sp)
80406d0c:	01512223          	sw	s5,4(sp)
80406d10:	00058a13          	mv	s4,a1
80406d14:	0187a483          	lw	s1,24(a5)
80406d18:	b79fb0ef          	jal	ra,80402890 <kmalloc>
80406d1c:	12050a63          	beqz	a0,80406e50 <sysfile_getdirentry+0x174>
80406d20:	00050413          	mv	s0,a0
80406d24:	0e048063          	beqz	s1,80406e04 <sysfile_getdirentry+0x128>
80406d28:	01c48a93          	addi	s5,s1,28
80406d2c:	000a8513          	mv	a0,s5
80406d30:	b5cfe0ef          	jal	ra,8040508c <down>
80406d34:	00092783          	lw	a5,0(s2)
80406d38:	00078663          	beqz	a5,80406d44 <sysfile_getdirentry+0x68>
80406d3c:	0047a783          	lw	a5,4(a5)
80406d40:	02f4a423          	sw	a5,40(s1)
80406d44:	00100713          	li	a4,1
80406d48:	00400693          	li	a3,4
80406d4c:	000a0613          	mv	a2,s4
80406d50:	00040593          	mv	a1,s0
80406d54:	00048513          	mv	a0,s1
80406d58:	f89fd0ef          	jal	ra,80404ce0 <copy_from_user>
80406d5c:	04051263          	bnez	a0,80406da0 <sysfile_getdirentry+0xc4>
80406d60:	000a8513          	mv	a0,s5
80406d64:	b24fe0ef          	jal	ra,80405088 <up>
80406d68:	ffd00993          	li	s3,-3
80406d6c:	0204a423          	sw	zero,40(s1)
80406d70:	00040513          	mv	a0,s0
80406d74:	c41fb0ef          	jal	ra,804029b4 <kfree>
80406d78:	01c12083          	lw	ra,28(sp)
80406d7c:	01812403          	lw	s0,24(sp)
80406d80:	00098513          	mv	a0,s3
80406d84:	01412483          	lw	s1,20(sp)
80406d88:	01012903          	lw	s2,16(sp)
80406d8c:	00c12983          	lw	s3,12(sp)
80406d90:	00812a03          	lw	s4,8(sp)
80406d94:	00412a83          	lw	s5,4(sp)
80406d98:	02010113          	addi	sp,sp,32
80406d9c:	00008067          	ret
80406da0:	000a8513          	mv	a0,s5
80406da4:	ae4fe0ef          	jal	ra,80405088 <up>
80406da8:	00098513          	mv	a0,s3
80406dac:	00040593          	mv	a1,s0
80406db0:	0204a423          	sw	zero,40(s1)
80406db4:	a04ff0ef          	jal	ra,80405fb8 <file_getdirentry>
80406db8:	00050993          	mv	s3,a0
80406dbc:	fa051ae3          	bnez	a0,80406d70 <sysfile_getdirentry+0x94>
80406dc0:	000a8513          	mv	a0,s5
80406dc4:	ac8fe0ef          	jal	ra,8040508c <down>
80406dc8:	00092783          	lw	a5,0(s2)
80406dcc:	00078663          	beqz	a5,80406dd8 <sysfile_getdirentry+0xfc>
80406dd0:	0047a783          	lw	a5,4(a5)
80406dd4:	02f4a423          	sw	a5,40(s1)
80406dd8:	10400693          	li	a3,260
80406ddc:	00040613          	mv	a2,s0
80406de0:	000a0593          	mv	a1,s4
80406de4:	00048513          	mv	a0,s1
80406de8:	f59fd0ef          	jal	ra,80404d40 <copy_to_user>
80406dec:	00051463          	bnez	a0,80406df4 <sysfile_getdirentry+0x118>
80406df0:	ffd00993          	li	s3,-3
80406df4:	000a8513          	mv	a0,s5
80406df8:	a90fe0ef          	jal	ra,80405088 <up>
80406dfc:	0204a423          	sw	zero,40(s1)
80406e00:	f71ff06f          	j	80406d70 <sysfile_getdirentry+0x94>
80406e04:	00050593          	mv	a1,a0
80406e08:	00100713          	li	a4,1
80406e0c:	00400693          	li	a3,4
80406e10:	000a0613          	mv	a2,s4
80406e14:	00000513          	li	a0,0
80406e18:	ec9fd0ef          	jal	ra,80404ce0 <copy_from_user>
80406e1c:	02050663          	beqz	a0,80406e48 <sysfile_getdirentry+0x16c>
80406e20:	00098513          	mv	a0,s3
80406e24:	00040593          	mv	a1,s0
80406e28:	990ff0ef          	jal	ra,80405fb8 <file_getdirentry>
80406e2c:	00050993          	mv	s3,a0
80406e30:	f40510e3          	bnez	a0,80406d70 <sysfile_getdirentry+0x94>
80406e34:	10400693          	li	a3,260
80406e38:	00040613          	mv	a2,s0
80406e3c:	000a0593          	mv	a1,s4
80406e40:	f01fd0ef          	jal	ra,80404d40 <copy_to_user>
80406e44:	f20516e3          	bnez	a0,80406d70 <sysfile_getdirentry+0x94>
80406e48:	ffd00993          	li	s3,-3
80406e4c:	f25ff06f          	j	80406d70 <sysfile_getdirentry+0x94>
80406e50:	ffc00993          	li	s3,-4
80406e54:	f25ff06f          	j	80406d78 <sysfile_getdirentry+0x9c>

80406e58 <sysfile_dup>:
80406e58:	abcff06f          	j	80406114 <file_dup>

80406e5c <kernel_thread_entry>:
80406e5c:	00048513          	mv	a0,s1
80406e60:	000400e7          	jalr	s0
80406e64:	379000ef          	jal	ra,804079dc <do_exit>

80406e68 <alloc_proc>:
80406e68:	ff010113          	addi	sp,sp,-16
80406e6c:	0e000513          	li	a0,224
80406e70:	00812423          	sw	s0,8(sp)
80406e74:	00112623          	sw	ra,12(sp)
80406e78:	a19fb0ef          	jal	ra,80402890 <kmalloc>
80406e7c:	00050413          	mv	s0,a0
80406e80:	08050c63          	beqz	a0,80406f18 <alloc_proc+0xb0>
80406e84:	fff00793          	li	a5,-1
80406e88:	00f52223          	sw	a5,4(a0)
80406e8c:	03800613          	li	a2,56
80406e90:	00000593          	li	a1,0
80406e94:	00052023          	sw	zero,0(a0)
80406e98:	00052423          	sw	zero,8(a0)
80406e9c:	00052623          	sw	zero,12(a0)
80406ea0:	00052823          	sw	zero,16(a0)
80406ea4:	00052a23          	sw	zero,20(a0)
80406ea8:	00052c23          	sw	zero,24(a0)
80406eac:	01c50513          	addi	a0,a0,28
80406eb0:	18d0b0ef          	jal	ra,8041283c <memset>
80406eb4:	00096797          	auipc	a5,0x96
80406eb8:	95478793          	addi	a5,a5,-1708 # 8049c808 <boot_cr3>
80406ebc:	0007a783          	lw	a5,0(a5)
80406ec0:	04042a23          	sw	zero,84(s0)
80406ec4:	04042e23          	sw	zero,92(s0)
80406ec8:	04f42c23          	sw	a5,88(s0)
80406ecc:	03200613          	li	a2,50
80406ed0:	00000593          	li	a1,0
80406ed4:	06040513          	addi	a0,s0,96
80406ed8:	1650b0ef          	jal	ra,8041283c <memset>
80406edc:	0bc40793          	addi	a5,s0,188
80406ee0:	0a042423          	sw	zero,168(s0)
80406ee4:	0a042823          	sw	zero,176(s0)
80406ee8:	0a042a23          	sw	zero,180(s0)
80406eec:	0a042623          	sw	zero,172(s0)
80406ef0:	0a042c23          	sw	zero,184(s0)
80406ef4:	0cf42023          	sw	a5,192(s0)
80406ef8:	0af42e23          	sw	a5,188(s0)
80406efc:	0c042223          	sw	zero,196(s0)
80406f00:	0c042423          	sw	zero,200(s0)
80406f04:	0c042823          	sw	zero,208(s0)
80406f08:	0c042623          	sw	zero,204(s0)
80406f0c:	0c042a23          	sw	zero,212(s0)
80406f10:	0c042c23          	sw	zero,216(s0)
80406f14:	0c042e23          	sw	zero,220(s0)
80406f18:	00040513          	mv	a0,s0
80406f1c:	00c12083          	lw	ra,12(sp)
80406f20:	00812403          	lw	s0,8(sp)
80406f24:	01010113          	addi	sp,sp,16
80406f28:	00008067          	ret

80406f2c <put_files>:
80406f2c:	0dc52503          	lw	a0,220(a0)
80406f30:	00050a63          	beqz	a0,80406f44 <put_files+0x18>
80406f34:	00852783          	lw	a5,8(a0)
80406f38:	fff78793          	addi	a5,a5,-1
80406f3c:	00f52423          	sw	a5,8(a0)
80406f40:	00078463          	beqz	a5,80406f48 <put_files+0x1c>
80406f44:	00008067          	ret
80406f48:	b10ff06f          	j	80406258 <files_destroy>

80406f4c <forkret>:
80406f4c:	ff010113          	addi	sp,sp,-16
80406f50:	00112623          	sw	ra,12(sp)
80406f54:	00812423          	sw	s0,8(sp)
80406f58:	00912223          	sw	s1,4(sp)
80406f5c:	0330000f          	fence	rw,rw
80406f60:	0000100f          	fence.i
80406f64:	00096417          	auipc	s0,0x96
80406f68:	84c40413          	addi	s0,s0,-1972 # 8049c7b0 <current>
80406f6c:	00042703          	lw	a4,0(s0)
80406f70:	0000d517          	auipc	a0,0xd
80406f74:	63450513          	addi	a0,a0,1588 # 804145a4 <CSWTCH.69+0x6d8>
80406f78:	05472783          	lw	a5,84(a4)
80406f7c:	00472583          	lw	a1,4(a4)
80406f80:	0807a683          	lw	a3,128(a5)
80406f84:	0287a703          	lw	a4,40(a5)
80406f88:	0847a603          	lw	a2,132(a5)
80406f8c:	a70f90ef          	jal	ra,804001fc <cprintf>
80406f90:	00042783          	lw	a5,0(s0)
80406f94:	0187a703          	lw	a4,24(a5)
80406f98:	04070e63          	beqz	a4,80406ff4 <forkret+0xa8>
80406f9c:	00c72503          	lw	a0,12(a4)
80406fa0:	04050a63          	beqz	a0,80406ff4 <forkret+0xa8>
80406fa4:	00000613          	li	a2,0
80406fa8:	008005b7          	lui	a1,0x800
80406fac:	df9fb0ef          	jal	ra,80402da4 <get_pte>
80406fb0:	00042783          	lw	a5,0(s0)
80406fb4:	00050493          	mv	s1,a0
80406fb8:	008015b7          	lui	a1,0x801
80406fbc:	0187a783          	lw	a5,24(a5)
80406fc0:	00000613          	li	a2,0
80406fc4:	00c7a503          	lw	a0,12(a5)
80406fc8:	dddfb0ef          	jal	ra,80402da4 <get_pte>
80406fcc:	00000593          	li	a1,0
80406fd0:	00048463          	beqz	s1,80406fd8 <forkret+0x8c>
80406fd4:	0004a583          	lw	a1,0(s1)
80406fd8:	00000613          	li	a2,0
80406fdc:	00050463          	beqz	a0,80406fe4 <forkret+0x98>
80406fe0:	00052603          	lw	a2,0(a0)
80406fe4:	0000d517          	auipc	a0,0xd
80406fe8:	5f050513          	addi	a0,a0,1520 # 804145d4 <CSWTCH.69+0x708>
80406fec:	a10f90ef          	jal	ra,804001fc <cprintf>
80406ff0:	00042783          	lw	a5,0(s0)
80406ff4:	00812403          	lw	s0,8(sp)
80406ff8:	00c12083          	lw	ra,12(sp)
80406ffc:	00412483          	lw	s1,4(sp)
80407000:	0547a503          	lw	a0,84(a5)
80407004:	01010113          	addi	sp,sp,16
80407008:	eacfa06f          	j	804016b4 <forkrets>

8040700c <load_icode_read>:
8040700c:	fe010113          	addi	sp,sp,-32
80407010:	00912a23          	sw	s1,20(sp)
80407014:	01312623          	sw	s3,12(sp)
80407018:	00060493          	mv	s1,a2
8040701c:	00058993          	mv	s3,a1
80407020:	00000613          	li	a2,0
80407024:	00068593          	mv	a1,a3
80407028:	00812c23          	sw	s0,24(sp)
8040702c:	01212823          	sw	s2,16(sp)
80407030:	00112e23          	sw	ra,28(sp)
80407034:	00050913          	mv	s2,a0
80407038:	aa9ff0ef          	jal	ra,80406ae0 <sysfile_seek>
8040703c:	00050413          	mv	s0,a0
80407040:	02050263          	beqz	a0,80407064 <load_icode_read+0x58>
80407044:	00040513          	mv	a0,s0
80407048:	01c12083          	lw	ra,28(sp)
8040704c:	01812403          	lw	s0,24(sp)
80407050:	01412483          	lw	s1,20(sp)
80407054:	01012903          	lw	s2,16(sp)
80407058:	00c12983          	lw	s3,12(sp)
8040705c:	02010113          	addi	sp,sp,32
80407060:	00008067          	ret
80407064:	00048613          	mv	a2,s1
80407068:	00098593          	mv	a1,s3
8040706c:	00090513          	mv	a0,s2
80407070:	ee4ff0ef          	jal	ra,80406754 <sysfile_read>
80407074:	fca488e3          	beq	s1,a0,80407044 <load_icode_read+0x38>
80407078:	00050413          	mv	s0,a0
8040707c:	fc0544e3          	bltz	a0,80407044 <load_icode_read+0x38>
80407080:	fff00413          	li	s0,-1
80407084:	00040513          	mv	a0,s0
80407088:	01c12083          	lw	ra,28(sp)
8040708c:	01812403          	lw	s0,24(sp)
80407090:	01412483          	lw	s1,20(sp)
80407094:	01012903          	lw	s2,16(sp)
80407098:	00c12983          	lw	s3,12(sp)
8040709c:	02010113          	addi	sp,sp,32
804070a0:	00008067          	ret

804070a4 <user_main>:
804070a4:	00095797          	auipc	a5,0x95
804070a8:	70c78793          	addi	a5,a5,1804 # 8049c7b0 <current>
804070ac:	0007a783          	lw	a5,0(a5)
804070b0:	fe010113          	addi	sp,sp,-32
804070b4:	00812c23          	sw	s0,24(sp)
804070b8:	0047a583          	lw	a1,4(a5)
804070bc:	0000d417          	auipc	s0,0xd
804070c0:	73440413          	addi	s0,s0,1844 # 804147f0 <CSWTCH.69+0x924>
804070c4:	00040613          	mv	a2,s0
804070c8:	0000d517          	auipc	a0,0xd
804070cc:	72c50513          	addi	a0,a0,1836 # 804147f4 <CSWTCH.69+0x928>
804070d0:	00112e23          	sw	ra,28(sp)
804070d4:	00812423          	sw	s0,8(sp)
804070d8:	00012623          	sw	zero,12(sp)
804070dc:	920f90ef          	jal	ra,804001fc <cprintf>
804070e0:	00812783          	lw	a5,8(sp)
804070e4:	06078663          	beqz	a5,80407150 <user_main+0xac>
804070e8:	00c10713          	addi	a4,sp,12
804070ec:	00000793          	li	a5,0
804070f0:	00470713          	addi	a4,a4,4
804070f4:	ffc72683          	lw	a3,-4(a4)
804070f8:	00178793          	addi	a5,a5,1
804070fc:	fe069ae3          	bnez	a3,804070f0 <user_main+0x4c>
80407100:	10002773          	csrr	a4,sstatus
80407104:	10076713          	ori	a4,a4,256
80407108:	10071073          	csrw	sstatus,a4
8040710c:	1424d073          	csrwi	scause,9
80407110:	00810713          	addi	a4,sp,8
80407114:	00000517          	auipc	a0,0x0
80407118:	01c50513          	addi	a0,a0,28 # 80407130 <user_main+0x8c>
8040711c:	14151073          	csrw	sepc,a0
80407120:	00400513          	li	a0,4
80407124:	00040593          	mv	a1,s0
80407128:	00078613          	mv	a2,a5
8040712c:	00070693          	mv	a3,a4
80407130:	c00fa06f          	j	80401530 <__alltraps>
80407134:	00050413          	mv	s0,a0
80407138:	0000d617          	auipc	a2,0xd
8040713c:	6e460613          	addi	a2,a2,1764 # 8041481c <CSWTCH.69+0x950>
80407140:	41900593          	li	a1,1049
80407144:	0000d517          	auipc	a0,0xd
80407148:	6f450513          	addi	a0,a0,1780 # 80414838 <CSWTCH.69+0x96c>
8040714c:	cd8f90ef          	jal	ra,80400624 <__panic>
80407150:	00000793          	li	a5,0
80407154:	fadff06f          	j	80407100 <user_main+0x5c>

80407158 <setup_pgdir.isra.4>:
80407158:	fe010113          	addi	sp,sp,-32
8040715c:	01212823          	sw	s2,16(sp)
80407160:	00050913          	mv	s2,a0
80407164:	00100513          	li	a0,1
80407168:	00112e23          	sw	ra,28(sp)
8040716c:	00812c23          	sw	s0,24(sp)
80407170:	00912a23          	sw	s1,20(sp)
80407174:	01312623          	sw	s3,12(sp)
80407178:	01412423          	sw	s4,8(sp)
8040717c:	a95fb0ef          	jal	ra,80402c10 <alloc_pages>
80407180:	0c050263          	beqz	a0,80407244 <setup_pgdir.isra.4+0xec>
80407184:	00095a17          	auipc	s4,0x95
80407188:	688a0a13          	addi	s4,s4,1672 # 8049c80c <pages>
8040718c:	000a2683          	lw	a3,0(s4)
80407190:	0000f797          	auipc	a5,0xf
80407194:	f2878793          	addi	a5,a5,-216 # 804160b8 <nbase>
80407198:	0007a983          	lw	s3,0(a5)
8040719c:	40d506b3          	sub	a3,a0,a3
804071a0:	00095797          	auipc	a5,0x95
804071a4:	5fc78793          	addi	a5,a5,1532 # 8049c79c <npage>
804071a8:	4056d693          	srai	a3,a3,0x5
804071ac:	013686b3          	add	a3,a3,s3
804071b0:	0007a703          	lw	a4,0(a5)
804071b4:	00c69793          	slli	a5,a3,0xc
804071b8:	00c7d793          	srli	a5,a5,0xc
804071bc:	00050413          	mv	s0,a0
804071c0:	00c69693          	slli	a3,a3,0xc
804071c4:	08e7f463          	bgeu	a5,a4,8040724c <setup_pgdir.isra.4+0xf4>
804071c8:	00095797          	auipc	a5,0x95
804071cc:	63c78793          	addi	a5,a5,1596 # 8049c804 <va_pa_offset>
804071d0:	0007a483          	lw	s1,0(a5)
804071d4:	00095797          	auipc	a5,0x95
804071d8:	5c478793          	addi	a5,a5,1476 # 8049c798 <boot_pgdir>
804071dc:	0007a583          	lw	a1,0(a5)
804071e0:	009684b3          	add	s1,a3,s1
804071e4:	00001637          	lui	a2,0x1
804071e8:	00048513          	mv	a0,s1
804071ec:	6c00b0ef          	jal	ra,804128ac <memcpy>
804071f0:	000a2703          	lw	a4,0(s4)
804071f4:	000017b7          	lui	a5,0x1
804071f8:	00f487b3          	add	a5,s1,a5
804071fc:	40e40433          	sub	s0,s0,a4
80407200:	40545413          	srai	s0,s0,0x5
80407204:	01340433          	add	s0,s0,s3
80407208:	00a41413          	slli	s0,s0,0xa
8040720c:	0c146713          	ori	a4,s0,193
80407210:	0c746413          	ori	s0,s0,199
80407214:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x7054>
80407218:	fa87a823          	sw	s0,-80(a5)
8040721c:	00992023          	sw	s1,0(s2)
80407220:	00000513          	li	a0,0
80407224:	01c12083          	lw	ra,28(sp)
80407228:	01812403          	lw	s0,24(sp)
8040722c:	01412483          	lw	s1,20(sp)
80407230:	01012903          	lw	s2,16(sp)
80407234:	00c12983          	lw	s3,12(sp)
80407238:	00812a03          	lw	s4,8(sp)
8040723c:	02010113          	addi	sp,sp,32
80407240:	00008067          	ret
80407244:	ffc00513          	li	a0,-4
80407248:	fddff06f          	j	80407224 <setup_pgdir.isra.4+0xcc>
8040724c:	0000c617          	auipc	a2,0xc
80407250:	39c60613          	addi	a2,a2,924 # 804135e8 <default_pmm_manager+0x30>
80407254:	06e00593          	li	a1,110
80407258:	0000c517          	auipc	a0,0xc
8040725c:	3b450513          	addi	a0,a0,948 # 8041360c <default_pmm_manager+0x54>
80407260:	bc4f90ef          	jal	ra,80400624 <__panic>

80407264 <set_proc_name>:
80407264:	ff010113          	addi	sp,sp,-16
80407268:	00812423          	sw	s0,8(sp)
8040726c:	06050413          	addi	s0,a0,96
80407270:	00912223          	sw	s1,4(sp)
80407274:	03300613          	li	a2,51
80407278:	00058493          	mv	s1,a1
8040727c:	00040513          	mv	a0,s0
80407280:	00000593          	li	a1,0
80407284:	00112623          	sw	ra,12(sp)
80407288:	5b40b0ef          	jal	ra,8041283c <memset>
8040728c:	00040513          	mv	a0,s0
80407290:	00812403          	lw	s0,8(sp)
80407294:	00c12083          	lw	ra,12(sp)
80407298:	00048593          	mv	a1,s1
8040729c:	00412483          	lw	s1,4(sp)
804072a0:	03200613          	li	a2,50
804072a4:	01010113          	addi	sp,sp,16
804072a8:	6040b06f          	j	804128ac <memcpy>

804072ac <proc_run>:
804072ac:	ff010113          	addi	sp,sp,-16
804072b0:	00095797          	auipc	a5,0x95
804072b4:	50078793          	addi	a5,a5,1280 # 8049c7b0 <current>
804072b8:	00912223          	sw	s1,4(sp)
804072bc:	0007a483          	lw	s1,0(a5)
804072c0:	00112623          	sw	ra,12(sp)
804072c4:	00812423          	sw	s0,8(sp)
804072c8:	01212023          	sw	s2,0(sp)
804072cc:	04a48463          	beq	s1,a0,80407314 <proc_run+0x68>
804072d0:	00050413          	mv	s0,a0
804072d4:	100027f3          	csrr	a5,sstatus
804072d8:	0027f793          	andi	a5,a5,2
804072dc:	00000913          	li	s2,0
804072e0:	06079263          	bnez	a5,80407344 <proc_run+0x98>
804072e4:	05842783          	lw	a5,88(s0)
804072e8:	00095717          	auipc	a4,0x95
804072ec:	4c872423          	sw	s0,1224(a4) # 8049c7b0 <current>
804072f0:	80000737          	lui	a4,0x80000
804072f4:	00c7d793          	srli	a5,a5,0xc
804072f8:	00e7e7b3          	or	a5,a5,a4
804072fc:	18079073          	csrw	satp,a5
80407300:	12000073          	sfence.vma
80407304:	01c40593          	addi	a1,s0,28
80407308:	01c48513          	addi	a0,s1,28
8040730c:	391010ef          	jal	ra,80408e9c <switch_to>
80407310:	00091e63          	bnez	s2,8040732c <proc_run+0x80>
80407314:	00c12083          	lw	ra,12(sp)
80407318:	00812403          	lw	s0,8(sp)
8040731c:	00412483          	lw	s1,4(sp)
80407320:	00012903          	lw	s2,0(sp)
80407324:	01010113          	addi	sp,sp,16
80407328:	00008067          	ret
8040732c:	00812403          	lw	s0,8(sp)
80407330:	00c12083          	lw	ra,12(sp)
80407334:	00412483          	lw	s1,4(sp)
80407338:	00012903          	lw	s2,0(sp)
8040733c:	01010113          	addi	sp,sp,16
80407340:	8e5f906f          	j	80400c24 <intr_enable>
80407344:	8e9f90ef          	jal	ra,80400c2c <intr_disable>
80407348:	00100913          	li	s2,1
8040734c:	f99ff06f          	j	804072e4 <proc_run+0x38>

80407350 <find_proc>:
80407350:	000027b7          	lui	a5,0x2
80407354:	fff50713          	addi	a4,a0,-1
80407358:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
8040735c:	04e7ec63          	bltu	a5,a4,804073b4 <find_proc+0x64>
80407360:	ff010113          	addi	sp,sp,-16
80407364:	00a00593          	li	a1,10
80407368:	00812423          	sw	s0,8(sp)
8040736c:	00112623          	sw	ra,12(sp)
80407370:	00050413          	mv	s0,a0
80407374:	4890a0ef          	jal	ra,80411ffc <hash32>
80407378:	00092797          	auipc	a5,0x92
8040737c:	3d078793          	addi	a5,a5,976 # 80499748 <hash_list>
80407380:	00351513          	slli	a0,a0,0x3
80407384:	00f50533          	add	a0,a0,a5
80407388:	00050793          	mv	a5,a0
8040738c:	00c0006f          	j	80407398 <find_proc+0x48>
80407390:	f687a703          	lw	a4,-152(a5)
80407394:	02870463          	beq	a4,s0,804073bc <find_proc+0x6c>
80407398:	0047a783          	lw	a5,4(a5)
8040739c:	fef51ae3          	bne	a0,a5,80407390 <find_proc+0x40>
804073a0:	00c12083          	lw	ra,12(sp)
804073a4:	00812403          	lw	s0,8(sp)
804073a8:	00000513          	li	a0,0
804073ac:	01010113          	addi	sp,sp,16
804073b0:	00008067          	ret
804073b4:	00000513          	li	a0,0
804073b8:	00008067          	ret
804073bc:	00c12083          	lw	ra,12(sp)
804073c0:	00812403          	lw	s0,8(sp)
804073c4:	f6478513          	addi	a0,a5,-156
804073c8:	01010113          	addi	sp,sp,16
804073cc:	00008067          	ret

804073d0 <do_fork>:
804073d0:	fc010113          	addi	sp,sp,-64
804073d4:	03612023          	sw	s6,32(sp)
804073d8:	00095b17          	auipc	s6,0x95
804073dc:	3e4b0b13          	addi	s6,s6,996 # 8049c7bc <nr_process>
804073e0:	000b2783          	lw	a5,0(s6)
804073e4:	03212823          	sw	s2,48(sp)
804073e8:	02112e23          	sw	ra,60(sp)
804073ec:	02812c23          	sw	s0,56(sp)
804073f0:	02912a23          	sw	s1,52(sp)
804073f4:	03312623          	sw	s3,44(sp)
804073f8:	03412423          	sw	s4,40(sp)
804073fc:	03512223          	sw	s5,36(sp)
80407400:	01712e23          	sw	s7,28(sp)
80407404:	01812c23          	sw	s8,24(sp)
80407408:	01912a23          	sw	s9,20(sp)
8040740c:	01a12823          	sw	s10,16(sp)
80407410:	01b12623          	sw	s11,12(sp)
80407414:	00001937          	lui	s2,0x1
80407418:	4b27d063          	bge	a5,s2,804078b8 <do_fork+0x4e8>
8040741c:	00050993          	mv	s3,a0
80407420:	00058a93          	mv	s5,a1
80407424:	00060493          	mv	s1,a2
80407428:	a41ff0ef          	jal	ra,80406e68 <alloc_proc>
8040742c:	00050413          	mv	s0,a0
80407430:	3c050263          	beqz	a0,804077f4 <do_fork+0x424>
80407434:	00095a17          	auipc	s4,0x95
80407438:	37ca0a13          	addi	s4,s4,892 # 8049c7b0 <current>
8040743c:	000a2783          	lw	a5,0(s4)
80407440:	0a87a703          	lw	a4,168(a5)
80407444:	00f52a23          	sw	a5,20(a0)
80407448:	46071c63          	bnez	a4,804078c0 <do_fork+0x4f0>
8040744c:	00200513          	li	a0,2
80407450:	fc0fb0ef          	jal	ra,80402c10 <alloc_pages>
80407454:	38050c63          	beqz	a0,804077ec <do_fork+0x41c>
80407458:	00095c17          	auipc	s8,0x95
8040745c:	3b4c0c13          	addi	s8,s8,948 # 8049c80c <pages>
80407460:	000c2683          	lw	a3,0(s8)
80407464:	0000f797          	auipc	a5,0xf
80407468:	c5478793          	addi	a5,a5,-940 # 804160b8 <nbase>
8040746c:	0007ab83          	lw	s7,0(a5)
80407470:	40d506b3          	sub	a3,a0,a3
80407474:	4056d693          	srai	a3,a3,0x5
80407478:	00095c97          	auipc	s9,0x95
8040747c:	324c8c93          	addi	s9,s9,804 # 8049c79c <npage>
80407480:	017686b3          	add	a3,a3,s7
80407484:	000ca703          	lw	a4,0(s9)
80407488:	00c69793          	slli	a5,a3,0xc
8040748c:	00c7d793          	srli	a5,a5,0xc
80407490:	00c69693          	slli	a3,a3,0xc
80407494:	46e7f663          	bgeu	a5,a4,80407900 <do_fork+0x530>
80407498:	00095d17          	auipc	s10,0x95
8040749c:	36cd0d13          	addi	s10,s10,876 # 8049c804 <va_pa_offset>
804074a0:	000a2703          	lw	a4,0(s4)
804074a4:	000d2783          	lw	a5,0(s10)
804074a8:	0dc72d83          	lw	s11,220(a4) # 800000dc <end+0xffb6381c>
804074ac:	00d786b3          	add	a3,a5,a3
804074b0:	00d42623          	sw	a3,12(s0)
804074b4:	420d8663          	beqz	s11,804078e0 <do_fork+0x510>
804074b8:	80090913          	addi	s2,s2,-2048 # 800 <_binary_bin_swap_img_size-0x7800>
804074bc:	0129f933          	and	s2,s3,s2
804074c0:	2a090463          	beqz	s2,80407768 <do_fork+0x398>
804074c4:	008da783          	lw	a5,8(s11)
804074c8:	01872903          	lw	s2,24(a4)
804074cc:	00178793          	addi	a5,a5,1
804074d0:	00fda423          	sw	a5,8(s11)
804074d4:	0db42e23          	sw	s11,220(s0)
804074d8:	02090a63          	beqz	s2,8040750c <do_fork+0x13c>
804074dc:	1009f993          	andi	s3,s3,256
804074e0:	2a098663          	beqz	s3,8040778c <do_fork+0x3bc>
804074e4:	01892783          	lw	a5,24(s2)
804074e8:	00c92683          	lw	a3,12(s2)
804074ec:	80400737          	lui	a4,0x80400
804074f0:	00178793          	addi	a5,a5,1
804074f4:	00f92c23          	sw	a5,24(s2)
804074f8:	01242c23          	sw	s2,24(s0)
804074fc:	40e6ee63          	bltu	a3,a4,80407918 <do_fork+0x548>
80407500:	000d2783          	lw	a5,0(s10)
80407504:	40f686b3          	sub	a3,a3,a5
80407508:	04d42c23          	sw	a3,88(s0)
8040750c:	00c42783          	lw	a5,12(s0)
80407510:	00002737          	lui	a4,0x2
80407514:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_bin_swap_img_size-0x6090>
80407518:	00e787b3          	add	a5,a5,a4
8040751c:	04f42a23          	sw	a5,84(s0)
80407520:	00078713          	mv	a4,a5
80407524:	09048813          	addi	a6,s1,144
80407528:	0004a503          	lw	a0,0(s1)
8040752c:	0044a583          	lw	a1,4(s1)
80407530:	0084a603          	lw	a2,8(s1)
80407534:	00c4a683          	lw	a3,12(s1)
80407538:	00a72023          	sw	a0,0(a4)
8040753c:	00b72223          	sw	a1,4(a4)
80407540:	00c72423          	sw	a2,8(a4)
80407544:	00d72623          	sw	a3,12(a4)
80407548:	01048493          	addi	s1,s1,16
8040754c:	01070713          	addi	a4,a4,16
80407550:	fd049ce3          	bne	s1,a6,80407528 <do_fork+0x158>
80407554:	0207a423          	sw	zero,40(a5)
80407558:	1a0a8663          	beqz	s5,80407704 <do_fork+0x334>
8040755c:	0157a423          	sw	s5,8(a5)
80407560:	00000717          	auipc	a4,0x0
80407564:	9ec70713          	addi	a4,a4,-1556 # 80406f4c <forkret>
80407568:	00e42e23          	sw	a4,28(s0)
8040756c:	02f42023          	sw	a5,32(s0)
80407570:	100027f3          	csrr	a5,sstatus
80407574:	0027f793          	andi	a5,a5,2
80407578:	00000913          	li	s2,0
8040757c:	1a079863          	bnez	a5,8040772c <do_fork+0x35c>
80407580:	00092797          	auipc	a5,0x92
80407584:	ac478793          	addi	a5,a5,-1340 # 80499044 <last_pid>
80407588:	0007a503          	lw	a0,0(a5)
8040758c:	000027b7          	lui	a5,0x2
80407590:	00150513          	addi	a0,a0,1
80407594:	00092717          	auipc	a4,0x92
80407598:	aaa72823          	sw	a0,-1360(a4) # 80499044 <last_pid>
8040759c:	1af55c63          	bge	a0,a5,80407754 <do_fork+0x384>
804075a0:	00092797          	auipc	a5,0x92
804075a4:	aa878793          	addi	a5,a5,-1368 # 80499048 <next_safe>
804075a8:	0007a783          	lw	a5,0(a5)
804075ac:	00095497          	auipc	s1,0x95
804075b0:	30c48493          	addi	s1,s1,780 # 8049c8b8 <proc_list>
804075b4:	06f54c63          	blt	a0,a5,8040762c <do_fork+0x25c>
804075b8:	000027b7          	lui	a5,0x2
804075bc:	00092717          	auipc	a4,0x92
804075c0:	a8f72623          	sw	a5,-1396(a4) # 80499048 <next_safe>
804075c4:	00000593          	li	a1,0
804075c8:	00050793          	mv	a5,a0
804075cc:	00095497          	auipc	s1,0x95
804075d0:	2ec48493          	addi	s1,s1,748 # 8049c8b8 <proc_list>
804075d4:	000028b7          	lui	a7,0x2
804075d8:	00058813          	mv	a6,a1
804075dc:	00002637          	lui	a2,0x2
804075e0:	00095697          	auipc	a3,0x95
804075e4:	2d868693          	addi	a3,a3,728 # 8049c8b8 <proc_list>
804075e8:	0046a683          	lw	a3,4(a3)
804075ec:	02968263          	beq	a3,s1,80407610 <do_fork+0x240>
804075f0:	f706a703          	lw	a4,-144(a3)
804075f4:	10f70063          	beq	a4,a5,804076f4 <do_fork+0x324>
804075f8:	fee7d8e3          	bge	a5,a4,804075e8 <do_fork+0x218>
804075fc:	fec756e3          	bge	a4,a2,804075e8 <do_fork+0x218>
80407600:	0046a683          	lw	a3,4(a3)
80407604:	00070613          	mv	a2,a4
80407608:	00100813          	li	a6,1
8040760c:	fe9692e3          	bne	a3,s1,804075f0 <do_fork+0x220>
80407610:	00058863          	beqz	a1,80407620 <do_fork+0x250>
80407614:	00092717          	auipc	a4,0x92
80407618:	a2f72823          	sw	a5,-1488(a4) # 80499044 <last_pid>
8040761c:	00078513          	mv	a0,a5
80407620:	00080663          	beqz	a6,8040762c <do_fork+0x25c>
80407624:	00092797          	auipc	a5,0x92
80407628:	a2c7a223          	sw	a2,-1500(a5) # 80499048 <next_safe>
8040762c:	00a00593          	li	a1,10
80407630:	00a42223          	sw	a0,4(s0)
80407634:	1c90a0ef          	jal	ra,80411ffc <hash32>
80407638:	00092797          	auipc	a5,0x92
8040763c:	11078793          	addi	a5,a5,272 # 80499748 <hash_list>
80407640:	00351513          	slli	a0,a0,0x3
80407644:	00f50533          	add	a0,a0,a5
80407648:	00452583          	lw	a1,4(a0)
8040764c:	01442683          	lw	a3,20(s0)
80407650:	09c40793          	addi	a5,s0,156
80407654:	00f5a023          	sw	a5,0(a1) # 801000 <_binary_bin_sfs_img_size+0x789000>
80407658:	0044a603          	lw	a2,4(s1)
8040765c:	00f52223          	sw	a5,4(a0)
80407660:	0ac6a703          	lw	a4,172(a3)
80407664:	09440793          	addi	a5,s0,148
80407668:	0ab42023          	sw	a1,160(s0)
8040766c:	08a42e23          	sw	a0,156(s0)
80407670:	00f62023          	sw	a5,0(a2) # 2000 <_binary_bin_swap_img_size-0x6000>
80407674:	00095597          	auipc	a1,0x95
80407678:	24f5a423          	sw	a5,584(a1) # 8049c8bc <proc_list+0x4>
8040767c:	08c42c23          	sw	a2,152(s0)
80407680:	08942a23          	sw	s1,148(s0)
80407684:	0a042823          	sw	zero,176(s0)
80407688:	0ae42a23          	sw	a4,180(s0)
8040768c:	00070463          	beqz	a4,80407694 <do_fork+0x2c4>
80407690:	0a872823          	sw	s0,176(a4)
80407694:	000b2783          	lw	a5,0(s6)
80407698:	0a86a623          	sw	s0,172(a3)
8040769c:	00178793          	addi	a5,a5,1
804076a0:	00095717          	auipc	a4,0x95
804076a4:	10f72e23          	sw	a5,284(a4) # 8049c7bc <nr_process>
804076a8:	14091a63          	bnez	s2,804077fc <do_fork+0x42c>
804076ac:	00040513          	mv	a0,s0
804076b0:	350050ef          	jal	ra,8040ca00 <wakeup_proc>
804076b4:	00442503          	lw	a0,4(s0)
804076b8:	03c12083          	lw	ra,60(sp)
804076bc:	03812403          	lw	s0,56(sp)
804076c0:	03412483          	lw	s1,52(sp)
804076c4:	03012903          	lw	s2,48(sp)
804076c8:	02c12983          	lw	s3,44(sp)
804076cc:	02812a03          	lw	s4,40(sp)
804076d0:	02412a83          	lw	s5,36(sp)
804076d4:	02012b03          	lw	s6,32(sp)
804076d8:	01c12b83          	lw	s7,28(sp)
804076dc:	01812c03          	lw	s8,24(sp)
804076e0:	01412c83          	lw	s9,20(sp)
804076e4:	01012d03          	lw	s10,16(sp)
804076e8:	00c12d83          	lw	s11,12(sp)
804076ec:	04010113          	addi	sp,sp,64
804076f0:	00008067          	ret
804076f4:	00178793          	addi	a5,a5,1
804076f8:	14c7dc63          	bge	a5,a2,80407850 <do_fork+0x480>
804076fc:	00100593          	li	a1,1
80407700:	ee9ff06f          	j	804075e8 <do_fork+0x218>
80407704:	00078a93          	mv	s5,a5
80407708:	0157a423          	sw	s5,8(a5)
8040770c:	00000717          	auipc	a4,0x0
80407710:	84070713          	addi	a4,a4,-1984 # 80406f4c <forkret>
80407714:	00e42e23          	sw	a4,28(s0)
80407718:	02f42023          	sw	a5,32(s0)
8040771c:	100027f3          	csrr	a5,sstatus
80407720:	0027f793          	andi	a5,a5,2
80407724:	00000913          	li	s2,0
80407728:	e4078ce3          	beqz	a5,80407580 <do_fork+0x1b0>
8040772c:	d00f90ef          	jal	ra,80400c2c <intr_disable>
80407730:	00092797          	auipc	a5,0x92
80407734:	91478793          	addi	a5,a5,-1772 # 80499044 <last_pid>
80407738:	0007a503          	lw	a0,0(a5)
8040773c:	000027b7          	lui	a5,0x2
80407740:	00100913          	li	s2,1
80407744:	00150513          	addi	a0,a0,1
80407748:	00092717          	auipc	a4,0x92
8040774c:	8ea72e23          	sw	a0,-1796(a4) # 80499044 <last_pid>
80407750:	e4f548e3          	blt	a0,a5,804075a0 <do_fork+0x1d0>
80407754:	00100793          	li	a5,1
80407758:	00092717          	auipc	a4,0x92
8040775c:	8ef72623          	sw	a5,-1812(a4) # 80499044 <last_pid>
80407760:	00100513          	li	a0,1
80407764:	e55ff06f          	j	804075b8 <do_fork+0x1e8>
80407768:	a9dfe0ef          	jal	ra,80406204 <files_create>
8040776c:	00050913          	mv	s2,a0
80407770:	04050263          	beqz	a0,804077b4 <do_fork+0x3e4>
80407774:	000d8593          	mv	a1,s11
80407778:	c41fe0ef          	jal	ra,804063b8 <dup_files>
8040777c:	0e051263          	bnez	a0,80407860 <do_fork+0x490>
80407780:	000a2703          	lw	a4,0(s4)
80407784:	00090d93          	mv	s11,s2
80407788:	d3dff06f          	j	804074c4 <do_fork+0xf4>
8040778c:	e2dfc0ef          	jal	ra,804045b8 <mm_create>
80407790:	00050993          	mv	s3,a0
80407794:	00050c63          	beqz	a0,804077ac <do_fork+0x3dc>
80407798:	00c50513          	addi	a0,a0,12
8040779c:	9bdff0ef          	jal	ra,80407158 <setup_pgdir.isra.4>
804077a0:	06050263          	beqz	a0,80407804 <do_fork+0x434>
804077a4:	00098513          	mv	a0,s3
804077a8:	fd5fc0ef          	jal	ra,8040477c <mm_destroy>
804077ac:	00040513          	mv	a0,s0
804077b0:	f7cff0ef          	jal	ra,80406f2c <put_files>
804077b4:	00c42683          	lw	a3,12(s0)
804077b8:	804007b7          	lui	a5,0x80400
804077bc:	18f6e663          	bltu	a3,a5,80407948 <do_fork+0x578>
804077c0:	000d2703          	lw	a4,0(s10)
804077c4:	000ca783          	lw	a5,0(s9)
804077c8:	40e686b3          	sub	a3,a3,a4
804077cc:	00c6d693          	srli	a3,a3,0xc
804077d0:	16f6f063          	bgeu	a3,a5,80407930 <do_fork+0x560>
804077d4:	000c2503          	lw	a0,0(s8)
804077d8:	417686b3          	sub	a3,a3,s7
804077dc:	00569693          	slli	a3,a3,0x5
804077e0:	00200593          	li	a1,2
804077e4:	00d50533          	add	a0,a0,a3
804077e8:	cf0fb0ef          	jal	ra,80402cd8 <free_pages>
804077ec:	00040513          	mv	a0,s0
804077f0:	9c4fb0ef          	jal	ra,804029b4 <kfree>
804077f4:	ffc00513          	li	a0,-4
804077f8:	ec1ff06f          	j	804076b8 <do_fork+0x2e8>
804077fc:	c28f90ef          	jal	ra,80400c24 <intr_enable>
80407800:	eadff06f          	j	804076ac <do_fork+0x2dc>
80407804:	01c90d93          	addi	s11,s2,28
80407808:	000d8513          	mv	a0,s11
8040780c:	881fd0ef          	jal	ra,8040508c <down>
80407810:	000a2783          	lw	a5,0(s4)
80407814:	00078663          	beqz	a5,80407820 <do_fork+0x450>
80407818:	0047a783          	lw	a5,4(a5) # 80400004 <end+0xfff63744>
8040781c:	02f92423          	sw	a5,40(s2)
80407820:	00090593          	mv	a1,s2
80407824:	00098513          	mv	a0,s3
80407828:	8c0fd0ef          	jal	ra,804048e8 <dup_mmap>
8040782c:	00050a13          	mv	s4,a0
80407830:	000d8513          	mv	a0,s11
80407834:	855fd0ef          	jal	ra,80405088 <up>
80407838:	02092423          	sw	zero,40(s2)
8040783c:	020a1863          	bnez	s4,8040786c <do_fork+0x49c>
80407840:	0330000f          	fence	rw,rw
80407844:	12000073          	sfence.vma
80407848:	00098913          	mv	s2,s3
8040784c:	c99ff06f          	j	804074e4 <do_fork+0x114>
80407850:	0117c463          	blt	a5,a7,80407858 <do_fork+0x488>
80407854:	00100793          	li	a5,1
80407858:	00100593          	li	a1,1
8040785c:	d7dff06f          	j	804075d8 <do_fork+0x208>
80407860:	00090513          	mv	a0,s2
80407864:	9f5fe0ef          	jal	ra,80406258 <files_destroy>
80407868:	f4dff06f          	j	804077b4 <do_fork+0x3e4>
8040786c:	00098513          	mv	a0,s3
80407870:	958fd0ef          	jal	ra,804049c8 <exit_mmap>
80407874:	00c9a683          	lw	a3,12(s3)
80407878:	804007b7          	lui	a5,0x80400
8040787c:	0cf6e663          	bltu	a3,a5,80407948 <do_fork+0x578>
80407880:	000d2703          	lw	a4,0(s10)
80407884:	000ca783          	lw	a5,0(s9)
80407888:	40e686b3          	sub	a3,a3,a4
8040788c:	00c6d693          	srli	a3,a3,0xc
80407890:	0af6f063          	bgeu	a3,a5,80407930 <do_fork+0x560>
80407894:	000c2503          	lw	a0,0(s8)
80407898:	417686b3          	sub	a3,a3,s7
8040789c:	00569693          	slli	a3,a3,0x5
804078a0:	00d50533          	add	a0,a0,a3
804078a4:	00100593          	li	a1,1
804078a8:	c30fb0ef          	jal	ra,80402cd8 <free_pages>
804078ac:	00098513          	mv	a0,s3
804078b0:	ecdfc0ef          	jal	ra,8040477c <mm_destroy>
804078b4:	ef9ff06f          	j	804077ac <do_fork+0x3dc>
804078b8:	ffb00513          	li	a0,-5
804078bc:	dfdff06f          	j	804076b8 <do_fork+0x2e8>
804078c0:	0000d697          	auipc	a3,0xd
804078c4:	c9868693          	addi	a3,a3,-872 # 80414558 <CSWTCH.69+0x68c>
804078c8:	0000b617          	auipc	a2,0xb
804078cc:	3a460613          	addi	a2,a2,932 # 80412c6c <commands+0x1bc>
804078d0:	20100593          	li	a1,513
804078d4:	0000d517          	auipc	a0,0xd
804078d8:	f6450513          	addi	a0,a0,-156 # 80414838 <CSWTCH.69+0x96c>
804078dc:	d49f80ef          	jal	ra,80400624 <__panic>
804078e0:	0000d697          	auipc	a3,0xd
804078e4:	c9468693          	addi	a3,a3,-876 # 80414574 <CSWTCH.69+0x6a8>
804078e8:	0000b617          	auipc	a2,0xb
804078ec:	38460613          	addi	a2,a2,900 # 80412c6c <commands+0x1bc>
804078f0:	1a700593          	li	a1,423
804078f4:	0000d517          	auipc	a0,0xd
804078f8:	f4450513          	addi	a0,a0,-188 # 80414838 <CSWTCH.69+0x96c>
804078fc:	d29f80ef          	jal	ra,80400624 <__panic>
80407900:	0000c617          	auipc	a2,0xc
80407904:	ce860613          	addi	a2,a2,-792 # 804135e8 <default_pmm_manager+0x30>
80407908:	06e00593          	li	a1,110
8040790c:	0000c517          	auipc	a0,0xc
80407910:	d0050513          	addi	a0,a0,-768 # 8041360c <default_pmm_manager+0x54>
80407914:	d11f80ef          	jal	ra,80400624 <__panic>
80407918:	0000c617          	auipc	a2,0xc
8040791c:	d0460613          	addi	a2,a2,-764 # 8041361c <default_pmm_manager+0x64>
80407920:	18800593          	li	a1,392
80407924:	0000d517          	auipc	a0,0xd
80407928:	f1450513          	addi	a0,a0,-236 # 80414838 <CSWTCH.69+0x96c>
8040792c:	cf9f80ef          	jal	ra,80400624 <__panic>
80407930:	0000c617          	auipc	a2,0xc
80407934:	d1060613          	addi	a2,a2,-752 # 80413640 <default_pmm_manager+0x88>
80407938:	06900593          	li	a1,105
8040793c:	0000c517          	auipc	a0,0xc
80407940:	cd050513          	addi	a0,a0,-816 # 8041360c <default_pmm_manager+0x54>
80407944:	ce1f80ef          	jal	ra,80400624 <__panic>
80407948:	0000c617          	auipc	a2,0xc
8040794c:	cd460613          	addi	a2,a2,-812 # 8041361c <default_pmm_manager+0x64>
80407950:	07000593          	li	a1,112
80407954:	0000c517          	auipc	a0,0xc
80407958:	cb850513          	addi	a0,a0,-840 # 8041360c <default_pmm_manager+0x54>
8040795c:	cc9f80ef          	jal	ra,80400624 <__panic>

80407960 <kernel_thread>:
80407960:	f6010113          	addi	sp,sp,-160
80407964:	08812c23          	sw	s0,152(sp)
80407968:	08912a23          	sw	s1,148(sp)
8040796c:	09212823          	sw	s2,144(sp)
80407970:	00058493          	mv	s1,a1
80407974:	00050913          	mv	s2,a0
80407978:	00060413          	mv	s0,a2
8040797c:	00000593          	li	a1,0
80407980:	09000613          	li	a2,144
80407984:	00010513          	mv	a0,sp
80407988:	08112e23          	sw	ra,156(sp)
8040798c:	6b10a0ef          	jal	ra,8041283c <memset>
80407990:	03212023          	sw	s2,32(sp)
80407994:	02912223          	sw	s1,36(sp)
80407998:	100027f3          	csrr	a5,sstatus
8040799c:	edd7f793          	andi	a5,a5,-291
804079a0:	1207e793          	ori	a5,a5,288
804079a4:	08f12023          	sw	a5,128(sp)
804079a8:	00010613          	mv	a2,sp
804079ac:	10046513          	ori	a0,s0,256
804079b0:	fffff797          	auipc	a5,0xfffff
804079b4:	4ac78793          	addi	a5,a5,1196 # 80406e5c <kernel_thread_entry>
804079b8:	00000593          	li	a1,0
804079bc:	08f12223          	sw	a5,132(sp)
804079c0:	a11ff0ef          	jal	ra,804073d0 <do_fork>
804079c4:	09c12083          	lw	ra,156(sp)
804079c8:	09812403          	lw	s0,152(sp)
804079cc:	09412483          	lw	s1,148(sp)
804079d0:	09012903          	lw	s2,144(sp)
804079d4:	0a010113          	addi	sp,sp,160
804079d8:	00008067          	ret

804079dc <do_exit>:
804079dc:	fe010113          	addi	sp,sp,-32
804079e0:	00912a23          	sw	s1,20(sp)
804079e4:	00095717          	auipc	a4,0x95
804079e8:	dd070713          	addi	a4,a4,-560 # 8049c7b4 <idleproc>
804079ec:	00095497          	auipc	s1,0x95
804079f0:	dc448493          	addi	s1,s1,-572 # 8049c7b0 <current>
804079f4:	0004a783          	lw	a5,0(s1)
804079f8:	00072703          	lw	a4,0(a4)
804079fc:	00112e23          	sw	ra,28(sp)
80407a00:	00812c23          	sw	s0,24(sp)
80407a04:	01212823          	sw	s2,16(sp)
80407a08:	01312623          	sw	s3,12(sp)
80407a0c:	01412423          	sw	s4,8(sp)
80407a10:	12e78263          	beq	a5,a4,80407b34 <do_exit+0x158>
80407a14:	00095417          	auipc	s0,0x95
80407a18:	da440413          	addi	s0,s0,-604 # 8049c7b8 <initproc>
80407a1c:	00042703          	lw	a4,0(s0)
80407a20:	18e78e63          	beq	a5,a4,80407bbc <do_exit+0x1e0>
80407a24:	0187a903          	lw	s2,24(a5)
80407a28:	00050993          	mv	s3,a0
80407a2c:	02090e63          	beqz	s2,80407a68 <do_exit+0x8c>
80407a30:	00095797          	auipc	a5,0x95
80407a34:	dd878793          	addi	a5,a5,-552 # 8049c808 <boot_cr3>
80407a38:	0007a783          	lw	a5,0(a5)
80407a3c:	80000737          	lui	a4,0x80000
80407a40:	00c7d793          	srli	a5,a5,0xc
80407a44:	00e7e7b3          	or	a5,a5,a4
80407a48:	18079073          	csrw	satp,a5
80407a4c:	12000073          	sfence.vma
80407a50:	01892783          	lw	a5,24(s2)
80407a54:	fff78793          	addi	a5,a5,-1
80407a58:	00f92c23          	sw	a5,24(s2)
80407a5c:	0e078863          	beqz	a5,80407b4c <do_exit+0x170>
80407a60:	0004a783          	lw	a5,0(s1)
80407a64:	0007ac23          	sw	zero,24(a5)
80407a68:	0004a503          	lw	a0,0(s1)
80407a6c:	cc0ff0ef          	jal	ra,80406f2c <put_files>
80407a70:	0004a783          	lw	a5,0(s1)
80407a74:	00300713          	li	a4,3
80407a78:	00e7a023          	sw	a4,0(a5)
80407a7c:	0b37a223          	sw	s3,164(a5)
80407a80:	100027f3          	csrr	a5,sstatus
80407a84:	0027f793          	andi	a5,a5,2
80407a88:	00000a13          	li	s4,0
80407a8c:	14079463          	bnez	a5,80407bd4 <do_exit+0x1f8>
80407a90:	0004a703          	lw	a4,0(s1)
80407a94:	800007b7          	lui	a5,0x80000
80407a98:	00178793          	addi	a5,a5,1 # 80000001 <end+0xffb63741>
80407a9c:	01472503          	lw	a0,20(a4) # 80000014 <end+0xffb63754>
80407aa0:	0a852703          	lw	a4,168(a0)
80407aa4:	12f70e63          	beq	a4,a5,80407be0 <do_exit+0x204>
80407aa8:	0004a683          	lw	a3,0(s1)
80407aac:	800009b7          	lui	s3,0x80000
80407ab0:	00300913          	li	s2,3
80407ab4:	00198993          	addi	s3,s3,1 # 80000001 <end+0xffb63741>
80407ab8:	0ac6a783          	lw	a5,172(a3)
80407abc:	04078463          	beqz	a5,80407b04 <do_exit+0x128>
80407ac0:	0b47a703          	lw	a4,180(a5)
80407ac4:	00042503          	lw	a0,0(s0)
80407ac8:	0ae6a623          	sw	a4,172(a3)
80407acc:	0ac52703          	lw	a4,172(a0)
80407ad0:	0a07a823          	sw	zero,176(a5)
80407ad4:	0ae7aa23          	sw	a4,180(a5)
80407ad8:	00070463          	beqz	a4,80407ae0 <do_exit+0x104>
80407adc:	0af72823          	sw	a5,176(a4)
80407ae0:	0007a703          	lw	a4,0(a5)
80407ae4:	00a7aa23          	sw	a0,20(a5)
80407ae8:	0af52623          	sw	a5,172(a0)
80407aec:	fd2716e3          	bne	a4,s2,80407ab8 <do_exit+0xdc>
80407af0:	0a852783          	lw	a5,168(a0)
80407af4:	fd3792e3          	bne	a5,s3,80407ab8 <do_exit+0xdc>
80407af8:	709040ef          	jal	ra,8040ca00 <wakeup_proc>
80407afc:	0004a683          	lw	a3,0(s1)
80407b00:	fb9ff06f          	j	80407ab8 <do_exit+0xdc>
80407b04:	020a1463          	bnez	s4,80407b2c <do_exit+0x150>
80407b08:	7f5040ef          	jal	ra,8040cafc <schedule>
80407b0c:	0004a783          	lw	a5,0(s1)
80407b10:	0000d617          	auipc	a2,0xd
80407b14:	a2860613          	addi	a2,a2,-1496 # 80414538 <CSWTCH.69+0x66c>
80407b18:	25d00593          	li	a1,605
80407b1c:	0047a683          	lw	a3,4(a5)
80407b20:	0000d517          	auipc	a0,0xd
80407b24:	d1850513          	addi	a0,a0,-744 # 80414838 <CSWTCH.69+0x96c>
80407b28:	afdf80ef          	jal	ra,80400624 <__panic>
80407b2c:	8f8f90ef          	jal	ra,80400c24 <intr_enable>
80407b30:	fd9ff06f          	j	80407b08 <do_exit+0x12c>
80407b34:	0000d617          	auipc	a2,0xd
80407b38:	9e460613          	addi	a2,a2,-1564 # 80414518 <CSWTCH.69+0x64c>
80407b3c:	22d00593          	li	a1,557
80407b40:	0000d517          	auipc	a0,0xd
80407b44:	cf850513          	addi	a0,a0,-776 # 80414838 <CSWTCH.69+0x96c>
80407b48:	addf80ef          	jal	ra,80400624 <__panic>
80407b4c:	00090513          	mv	a0,s2
80407b50:	e79fc0ef          	jal	ra,804049c8 <exit_mmap>
80407b54:	00c92683          	lw	a3,12(s2)
80407b58:	804007b7          	lui	a5,0x80400
80407b5c:	08f6e663          	bltu	a3,a5,80407be8 <do_exit+0x20c>
80407b60:	00095797          	auipc	a5,0x95
80407b64:	ca478793          	addi	a5,a5,-860 # 8049c804 <va_pa_offset>
80407b68:	0007a703          	lw	a4,0(a5)
80407b6c:	00095797          	auipc	a5,0x95
80407b70:	c3078793          	addi	a5,a5,-976 # 8049c79c <npage>
80407b74:	0007a783          	lw	a5,0(a5)
80407b78:	40e686b3          	sub	a3,a3,a4
80407b7c:	00c6d693          	srli	a3,a3,0xc
80407b80:	08f6f063          	bgeu	a3,a5,80407c00 <do_exit+0x224>
80407b84:	0000e797          	auipc	a5,0xe
80407b88:	53478793          	addi	a5,a5,1332 # 804160b8 <nbase>
80407b8c:	0007a783          	lw	a5,0(a5)
80407b90:	00095717          	auipc	a4,0x95
80407b94:	c7c70713          	addi	a4,a4,-900 # 8049c80c <pages>
80407b98:	00072503          	lw	a0,0(a4)
80407b9c:	40f686b3          	sub	a3,a3,a5
80407ba0:	00569693          	slli	a3,a3,0x5
80407ba4:	00d50533          	add	a0,a0,a3
80407ba8:	00100593          	li	a1,1
80407bac:	92cfb0ef          	jal	ra,80402cd8 <free_pages>
80407bb0:	00090513          	mv	a0,s2
80407bb4:	bc9fc0ef          	jal	ra,8040477c <mm_destroy>
80407bb8:	ea9ff06f          	j	80407a60 <do_exit+0x84>
80407bbc:	0000d617          	auipc	a2,0xd
80407bc0:	96c60613          	addi	a2,a2,-1684 # 80414528 <CSWTCH.69+0x65c>
80407bc4:	23000593          	li	a1,560
80407bc8:	0000d517          	auipc	a0,0xd
80407bcc:	c7050513          	addi	a0,a0,-912 # 80414838 <CSWTCH.69+0x96c>
80407bd0:	a55f80ef          	jal	ra,80400624 <__panic>
80407bd4:	858f90ef          	jal	ra,80400c2c <intr_disable>
80407bd8:	00100a13          	li	s4,1
80407bdc:	eb5ff06f          	j	80407a90 <do_exit+0xb4>
80407be0:	621040ef          	jal	ra,8040ca00 <wakeup_proc>
80407be4:	ec5ff06f          	j	80407aa8 <do_exit+0xcc>
80407be8:	0000c617          	auipc	a2,0xc
80407bec:	a3460613          	addi	a2,a2,-1484 # 8041361c <default_pmm_manager+0x64>
80407bf0:	07000593          	li	a1,112
80407bf4:	0000c517          	auipc	a0,0xc
80407bf8:	a1850513          	addi	a0,a0,-1512 # 8041360c <default_pmm_manager+0x54>
80407bfc:	a29f80ef          	jal	ra,80400624 <__panic>
80407c00:	0000c617          	auipc	a2,0xc
80407c04:	a4060613          	addi	a2,a2,-1472 # 80413640 <default_pmm_manager+0x88>
80407c08:	06900593          	li	a1,105
80407c0c:	0000c517          	auipc	a0,0xc
80407c10:	a0050513          	addi	a0,a0,-1536 # 8041360c <default_pmm_manager+0x54>
80407c14:	a11f80ef          	jal	ra,80400624 <__panic>

80407c18 <do_wait.part.8>:
80407c18:	fe010113          	addi	sp,sp,-32
80407c1c:	01412423          	sw	s4,8(sp)
80407c20:	80000a37          	lui	s4,0x80000
80407c24:	00912a23          	sw	s1,20(sp)
80407c28:	01212823          	sw	s2,16(sp)
80407c2c:	01312623          	sw	s3,12(sp)
80407c30:	01512223          	sw	s5,4(sp)
80407c34:	01612023          	sw	s6,0(sp)
80407c38:	00112e23          	sw	ra,28(sp)
80407c3c:	00812c23          	sw	s0,24(sp)
80407c40:	00050993          	mv	s3,a0
80407c44:	00058b13          	mv	s6,a1
80407c48:	00095917          	auipc	s2,0x95
80407c4c:	b6890913          	addi	s2,s2,-1176 # 8049c7b0 <current>
80407c50:	00300493          	li	s1,3
80407c54:	00100a93          	li	s5,1
80407c58:	001a0a13          	addi	s4,s4,1 # 80000001 <end+0xffb63741>
80407c5c:	04098663          	beqz	s3,80407ca8 <do_wait.part.8+0x90>
80407c60:	00098513          	mv	a0,s3
80407c64:	eecff0ef          	jal	ra,80407350 <find_proc>
80407c68:	00050413          	mv	s0,a0
80407c6c:	18050a63          	beqz	a0,80407e00 <do_wait.part.8+0x1e8>
80407c70:	00092703          	lw	a4,0(s2)
80407c74:	01452783          	lw	a5,20(a0)
80407c78:	18e79463          	bne	a5,a4,80407e00 <do_wait.part.8+0x1e8>
80407c7c:	00052783          	lw	a5,0(a0)
80407c80:	04978463          	beq	a5,s1,80407cc8 <do_wait.part.8+0xb0>
80407c84:	01572023          	sw	s5,0(a4)
80407c88:	0b472423          	sw	s4,168(a4)
80407c8c:	671040ef          	jal	ra,8040cafc <schedule>
80407c90:	00092783          	lw	a5,0(s2)
80407c94:	05c7a783          	lw	a5,92(a5)
80407c98:	0017f793          	andi	a5,a5,1
80407c9c:	fc0780e3          	beqz	a5,80407c5c <do_wait.part.8+0x44>
80407ca0:	ff700513          	li	a0,-9
80407ca4:	d39ff0ef          	jal	ra,804079dc <do_exit>
80407ca8:	00092703          	lw	a4,0(s2)
80407cac:	0ac72403          	lw	s0,172(a4)
80407cb0:	00041863          	bnez	s0,80407cc0 <do_wait.part.8+0xa8>
80407cb4:	14c0006f          	j	80407e00 <do_wait.part.8+0x1e8>
80407cb8:	0b442403          	lw	s0,180(s0)
80407cbc:	fc0404e3          	beqz	s0,80407c84 <do_wait.part.8+0x6c>
80407cc0:	00042783          	lw	a5,0(s0)
80407cc4:	fe979ae3          	bne	a5,s1,80407cb8 <do_wait.part.8+0xa0>
80407cc8:	00095797          	auipc	a5,0x95
80407ccc:	aec78793          	addi	a5,a5,-1300 # 8049c7b4 <idleproc>
80407cd0:	0007a783          	lw	a5,0(a5)
80407cd4:	14878063          	beq	a5,s0,80407e14 <do_wait.part.8+0x1fc>
80407cd8:	00095797          	auipc	a5,0x95
80407cdc:	ae078793          	addi	a5,a5,-1312 # 8049c7b8 <initproc>
80407ce0:	0007a783          	lw	a5,0(a5)
80407ce4:	12f40863          	beq	s0,a5,80407e14 <do_wait.part.8+0x1fc>
80407ce8:	000b0663          	beqz	s6,80407cf4 <do_wait.part.8+0xdc>
80407cec:	0a442783          	lw	a5,164(s0)
80407cf0:	00fb2023          	sw	a5,0(s6)
80407cf4:	100027f3          	csrr	a5,sstatus
80407cf8:	0027f793          	andi	a5,a5,2
80407cfc:	00000593          	li	a1,0
80407d00:	10079463          	bnez	a5,80407e08 <do_wait.part.8+0x1f0>
80407d04:	09c42603          	lw	a2,156(s0)
80407d08:	0a042683          	lw	a3,160(s0)
80407d0c:	0b442703          	lw	a4,180(s0)
80407d10:	0b042783          	lw	a5,176(s0)
80407d14:	00d62223          	sw	a3,4(a2)
80407d18:	00c6a023          	sw	a2,0(a3)
80407d1c:	09442603          	lw	a2,148(s0)
80407d20:	09842683          	lw	a3,152(s0)
80407d24:	00d62223          	sw	a3,4(a2)
80407d28:	00c6a023          	sw	a2,0(a3)
80407d2c:	00070663          	beqz	a4,80407d38 <do_wait.part.8+0x120>
80407d30:	0af72823          	sw	a5,176(a4)
80407d34:	0b042783          	lw	a5,176(s0)
80407d38:	0a078e63          	beqz	a5,80407df4 <do_wait.part.8+0x1dc>
80407d3c:	0ae7aa23          	sw	a4,180(a5)
80407d40:	00095797          	auipc	a5,0x95
80407d44:	a7c78793          	addi	a5,a5,-1412 # 8049c7bc <nr_process>
80407d48:	0007a783          	lw	a5,0(a5)
80407d4c:	fff78793          	addi	a5,a5,-1
80407d50:	00095717          	auipc	a4,0x95
80407d54:	a6f72623          	sw	a5,-1428(a4) # 8049c7bc <nr_process>
80407d58:	08059a63          	bnez	a1,80407dec <do_wait.part.8+0x1d4>
80407d5c:	00c42683          	lw	a3,12(s0)
80407d60:	804007b7          	lui	a5,0x80400
80407d64:	0ef6e063          	bltu	a3,a5,80407e44 <do_wait.part.8+0x22c>
80407d68:	00095797          	auipc	a5,0x95
80407d6c:	a9c78793          	addi	a5,a5,-1380 # 8049c804 <va_pa_offset>
80407d70:	0007a703          	lw	a4,0(a5)
80407d74:	00095797          	auipc	a5,0x95
80407d78:	a2878793          	addi	a5,a5,-1496 # 8049c79c <npage>
80407d7c:	0007a783          	lw	a5,0(a5)
80407d80:	40e686b3          	sub	a3,a3,a4
80407d84:	00c6d693          	srli	a3,a3,0xc
80407d88:	0af6f263          	bgeu	a3,a5,80407e2c <do_wait.part.8+0x214>
80407d8c:	0000e797          	auipc	a5,0xe
80407d90:	32c78793          	addi	a5,a5,812 # 804160b8 <nbase>
80407d94:	0007a783          	lw	a5,0(a5)
80407d98:	00095717          	auipc	a4,0x95
80407d9c:	a7470713          	addi	a4,a4,-1420 # 8049c80c <pages>
80407da0:	00072503          	lw	a0,0(a4)
80407da4:	40f686b3          	sub	a3,a3,a5
80407da8:	00569693          	slli	a3,a3,0x5
80407dac:	00d50533          	add	a0,a0,a3
80407db0:	00200593          	li	a1,2
80407db4:	f25fa0ef          	jal	ra,80402cd8 <free_pages>
80407db8:	00040513          	mv	a0,s0
80407dbc:	bf9fa0ef          	jal	ra,804029b4 <kfree>
80407dc0:	00000513          	li	a0,0
80407dc4:	01c12083          	lw	ra,28(sp)
80407dc8:	01812403          	lw	s0,24(sp)
80407dcc:	01412483          	lw	s1,20(sp)
80407dd0:	01012903          	lw	s2,16(sp)
80407dd4:	00c12983          	lw	s3,12(sp)
80407dd8:	00812a03          	lw	s4,8(sp)
80407ddc:	00412a83          	lw	s5,4(sp)
80407de0:	00012b03          	lw	s6,0(sp)
80407de4:	02010113          	addi	sp,sp,32
80407de8:	00008067          	ret
80407dec:	e39f80ef          	jal	ra,80400c24 <intr_enable>
80407df0:	f6dff06f          	j	80407d5c <do_wait.part.8+0x144>
80407df4:	01442783          	lw	a5,20(s0)
80407df8:	0ae7a623          	sw	a4,172(a5)
80407dfc:	f45ff06f          	j	80407d40 <do_wait.part.8+0x128>
80407e00:	ffe00513          	li	a0,-2
80407e04:	fc1ff06f          	j	80407dc4 <do_wait.part.8+0x1ac>
80407e08:	e25f80ef          	jal	ra,80400c2c <intr_disable>
80407e0c:	00100593          	li	a1,1
80407e10:	ef5ff06f          	j	80407d04 <do_wait.part.8+0xec>
80407e14:	0000c617          	auipc	a2,0xc
80407e18:	77460613          	addi	a2,a2,1908 # 80414588 <CSWTCH.69+0x6bc>
80407e1c:	3c200593          	li	a1,962
80407e20:	0000d517          	auipc	a0,0xd
80407e24:	a1850513          	addi	a0,a0,-1512 # 80414838 <CSWTCH.69+0x96c>
80407e28:	ffcf80ef          	jal	ra,80400624 <__panic>
80407e2c:	0000c617          	auipc	a2,0xc
80407e30:	81460613          	addi	a2,a2,-2028 # 80413640 <default_pmm_manager+0x88>
80407e34:	06900593          	li	a1,105
80407e38:	0000b517          	auipc	a0,0xb
80407e3c:	7d450513          	addi	a0,a0,2004 # 8041360c <default_pmm_manager+0x54>
80407e40:	fe4f80ef          	jal	ra,80400624 <__panic>
80407e44:	0000b617          	auipc	a2,0xb
80407e48:	7d860613          	addi	a2,a2,2008 # 8041361c <default_pmm_manager+0x64>
80407e4c:	07000593          	li	a1,112
80407e50:	0000b517          	auipc	a0,0xb
80407e54:	7bc50513          	addi	a0,a0,1980 # 8041360c <default_pmm_manager+0x54>
80407e58:	fccf80ef          	jal	ra,80400624 <__panic>

80407e5c <init_main>:
80407e5c:	6b7377b7          	lui	a5,0x6b737
80407e60:	fe010113          	addi	sp,sp,-32
80407e64:	96478793          	addi	a5,a5,-1692 # 6b736964 <_binary_bin_sfs_img_size+0x6b6be964>
80407e68:	00f12423          	sw	a5,8(sp)
80407e6c:	000047b7          	lui	a5,0x4
80407e70:	a3078793          	addi	a5,a5,-1488 # 3a30 <_binary_bin_swap_img_size-0x45d0>
80407e74:	00810513          	addi	a0,sp,8
80407e78:	00112e23          	sw	ra,28(sp)
80407e7c:	00f11623          	sh	a5,12(sp)
80407e80:	00010723          	sb	zero,14(sp)
80407e84:	0d1050ef          	jal	ra,8040d754 <vfs_set_bootfs>
80407e88:	0e051a63          	bnez	a0,80407f7c <init_main+0x120>
80407e8c:	eb9fa0ef          	jal	ra,80402d44 <nr_free_pages>
80407e90:	9f9fa0ef          	jal	ra,80402888 <kallocated>
80407e94:	00000613          	li	a2,0
80407e98:	00000593          	li	a1,0
80407e9c:	fffff517          	auipc	a0,0xfffff
80407ea0:	20850513          	addi	a0,a0,520 # 804070a4 <user_main>
80407ea4:	abdff0ef          	jal	ra,80407960 <kernel_thread>
80407ea8:	00a04663          	bgtz	a0,80407eb4 <init_main+0x58>
80407eac:	0b80006f          	j	80407f64 <init_main+0x108>
80407eb0:	44d040ef          	jal	ra,8040cafc <schedule>
80407eb4:	00000593          	li	a1,0
80407eb8:	00000513          	li	a0,0
80407ebc:	d5dff0ef          	jal	ra,80407c18 <do_wait.part.8>
80407ec0:	fe0508e3          	beqz	a0,80407eb0 <init_main+0x54>
80407ec4:	b2cfe0ef          	jal	ra,804061f0 <fs_cleanup>
80407ec8:	0000c517          	auipc	a0,0xc
80407ecc:	77450513          	addi	a0,a0,1908 # 8041463c <CSWTCH.69+0x770>
80407ed0:	b2cf80ef          	jal	ra,804001fc <cprintf>
80407ed4:	00095797          	auipc	a5,0x95
80407ed8:	8e478793          	addi	a5,a5,-1820 # 8049c7b8 <initproc>
80407edc:	0007a783          	lw	a5,0(a5)
80407ee0:	0ac7a703          	lw	a4,172(a5)
80407ee4:	06071063          	bnez	a4,80407f44 <init_main+0xe8>
80407ee8:	0b07a703          	lw	a4,176(a5)
80407eec:	04071c63          	bnez	a4,80407f44 <init_main+0xe8>
80407ef0:	0b47a703          	lw	a4,180(a5)
80407ef4:	04071863          	bnez	a4,80407f44 <init_main+0xe8>
80407ef8:	00095717          	auipc	a4,0x95
80407efc:	8c470713          	addi	a4,a4,-1852 # 8049c7bc <nr_process>
80407f00:	00072683          	lw	a3,0(a4)
80407f04:	00200713          	li	a4,2
80407f08:	0ce69863          	bne	a3,a4,80407fd8 <init_main+0x17c>
80407f0c:	00095697          	auipc	a3,0x95
80407f10:	9ac68693          	addi	a3,a3,-1620 # 8049c8b8 <proc_list>
80407f14:	0046a703          	lw	a4,4(a3)
80407f18:	09478793          	addi	a5,a5,148
80407f1c:	08f71e63          	bne	a4,a5,80407fb8 <init_main+0x15c>
80407f20:	0006a783          	lw	a5,0(a3)
80407f24:	06f71a63          	bne	a4,a5,80407f98 <init_main+0x13c>
80407f28:	0000c517          	auipc	a0,0xc
80407f2c:	7f450513          	addi	a0,a0,2036 # 8041471c <CSWTCH.69+0x850>
80407f30:	accf80ef          	jal	ra,804001fc <cprintf>
80407f34:	01c12083          	lw	ra,28(sp)
80407f38:	00000513          	li	a0,0
80407f3c:	02010113          	addi	sp,sp,32
80407f40:	00008067          	ret
80407f44:	0000c697          	auipc	a3,0xc
80407f48:	71c68693          	addi	a3,a3,1820 # 80414660 <CSWTCH.69+0x794>
80407f4c:	0000b617          	auipc	a2,0xb
80407f50:	d2060613          	addi	a2,a2,-736 # 80412c6c <commands+0x1bc>
80407f54:	43600593          	li	a1,1078
80407f58:	0000d517          	auipc	a0,0xd
80407f5c:	8e050513          	addi	a0,a0,-1824 # 80414838 <CSWTCH.69+0x96c>
80407f60:	ec4f80ef          	jal	ra,80400624 <__panic>
80407f64:	0000c617          	auipc	a2,0xc
80407f68:	6bc60613          	addi	a2,a2,1724 # 80414620 <CSWTCH.69+0x754>
80407f6c:	42a00593          	li	a1,1066
80407f70:	0000d517          	auipc	a0,0xd
80407f74:	8c850513          	addi	a0,a0,-1848 # 80414838 <CSWTCH.69+0x96c>
80407f78:	eacf80ef          	jal	ra,80400624 <__panic>
80407f7c:	00050693          	mv	a3,a0
80407f80:	0000c617          	auipc	a2,0xc
80407f84:	68460613          	addi	a2,a2,1668 # 80414604 <CSWTCH.69+0x738>
80407f88:	42200593          	li	a1,1058
80407f8c:	0000d517          	auipc	a0,0xd
80407f90:	8ac50513          	addi	a0,a0,-1876 # 80414838 <CSWTCH.69+0x96c>
80407f94:	e90f80ef          	jal	ra,80400624 <__panic>
80407f98:	0000c697          	auipc	a3,0xc
80407f9c:	75468693          	addi	a3,a3,1876 # 804146ec <CSWTCH.69+0x820>
80407fa0:	0000b617          	auipc	a2,0xb
80407fa4:	ccc60613          	addi	a2,a2,-820 # 80412c6c <commands+0x1bc>
80407fa8:	43900593          	li	a1,1081
80407fac:	0000d517          	auipc	a0,0xd
80407fb0:	88c50513          	addi	a0,a0,-1908 # 80414838 <CSWTCH.69+0x96c>
80407fb4:	e70f80ef          	jal	ra,80400624 <__panic>
80407fb8:	0000c697          	auipc	a3,0xc
80407fbc:	70468693          	addi	a3,a3,1796 # 804146bc <CSWTCH.69+0x7f0>
80407fc0:	0000b617          	auipc	a2,0xb
80407fc4:	cac60613          	addi	a2,a2,-852 # 80412c6c <commands+0x1bc>
80407fc8:	43800593          	li	a1,1080
80407fcc:	0000d517          	auipc	a0,0xd
80407fd0:	86c50513          	addi	a0,a0,-1940 # 80414838 <CSWTCH.69+0x96c>
80407fd4:	e50f80ef          	jal	ra,80400624 <__panic>
80407fd8:	0000c697          	auipc	a3,0xc
80407fdc:	6d468693          	addi	a3,a3,1748 # 804146ac <CSWTCH.69+0x7e0>
80407fe0:	0000b617          	auipc	a2,0xb
80407fe4:	c8c60613          	addi	a2,a2,-884 # 80412c6c <commands+0x1bc>
80407fe8:	43700593          	li	a1,1079
80407fec:	0000d517          	auipc	a0,0xd
80407ff0:	84c50513          	addi	a0,a0,-1972 # 80414838 <CSWTCH.69+0x96c>
80407ff4:	e30f80ef          	jal	ra,80400624 <__panic>

80407ff8 <do_execve>:
80407ff8:	e8010113          	addi	sp,sp,-384
80407ffc:	17412423          	sw	s4,360(sp)
80408000:	00094a17          	auipc	s4,0x94
80408004:	7b0a0a13          	addi	s4,s4,1968 # 8049c7b0 <current>
80408008:	000a2683          	lw	a3,0(s4)
8040800c:	17612023          	sw	s6,352(sp)
80408010:	16112e23          	sw	ra,380(sp)
80408014:	16812c23          	sw	s0,376(sp)
80408018:	16912a23          	sw	s1,372(sp)
8040801c:	17212823          	sw	s2,368(sp)
80408020:	17312623          	sw	s3,364(sp)
80408024:	17512223          	sw	s5,356(sp)
80408028:	15712e23          	sw	s7,348(sp)
8040802c:	15812c23          	sw	s8,344(sp)
80408030:	15912a23          	sw	s9,340(sp)
80408034:	15a12823          	sw	s10,336(sp)
80408038:	15b12623          	sw	s11,332(sp)
8040803c:	fff58713          	addi	a4,a1,-1
80408040:	01f00793          	li	a5,31
80408044:	0186ab03          	lw	s6,24(a3)
80408048:	58e7e663          	bltu	a5,a4,804085d4 <do_execve+0x5dc>
8040804c:	00060d13          	mv	s10,a2
80408050:	00050413          	mv	s0,a0
80408054:	00058993          	mv	s3,a1
80408058:	03300613          	li	a2,51
8040805c:	00000593          	li	a1,0
80408060:	05810513          	addi	a0,sp,88
80408064:	7d80a0ef          	jal	ra,8041283c <memset>
80408068:	000b0e63          	beqz	s6,80408084 <do_execve+0x8c>
8040806c:	01cb0513          	addi	a0,s6,28
80408070:	81cfd0ef          	jal	ra,8040508c <down>
80408074:	000a2783          	lw	a5,0(s4)
80408078:	00078663          	beqz	a5,80408084 <do_execve+0x8c>
8040807c:	0047a783          	lw	a5,4(a5)
80408080:	02fb2423          	sw	a5,40(s6)
80408084:	1e040863          	beqz	s0,80408274 <do_execve+0x27c>
80408088:	03300693          	li	a3,51
8040808c:	00040613          	mv	a2,s0
80408090:	05810593          	addi	a1,sp,88
80408094:	000b0513          	mv	a0,s6
80408098:	d05fc0ef          	jal	ra,80404d9c <copy_string>
8040809c:	6e050463          	beqz	a0,80408784 <do_execve+0x78c>
804080a0:	00299493          	slli	s1,s3,0x2
804080a4:	00000693          	li	a3,0
804080a8:	00048613          	mv	a2,s1
804080ac:	000d0593          	mv	a1,s10
804080b0:	000b0513          	mv	a0,s6
804080b4:	000d0b93          	mv	s7,s10
804080b8:	b51fc0ef          	jal	ra,80404c08 <user_mem_check>
804080bc:	6a050e63          	beqz	a0,80408778 <do_execve+0x780>
804080c0:	0c010913          	addi	s2,sp,192
804080c4:	00090c93          	mv	s9,s2
804080c8:	00000413          	li	s0,0
804080cc:	00001537          	lui	a0,0x1
804080d0:	fc0fa0ef          	jal	ra,80402890 <kmalloc>
804080d4:	00050a93          	mv	s5,a0
804080d8:	10050863          	beqz	a0,804081e8 <do_execve+0x1f0>
804080dc:	000ba603          	lw	a2,0(s7)
804080e0:	00050593          	mv	a1,a0
804080e4:	000016b7          	lui	a3,0x1
804080e8:	000b0513          	mv	a0,s6
804080ec:	cb1fc0ef          	jal	ra,80404d9c <copy_string>
804080f0:	16050a63          	beqz	a0,80408264 <do_execve+0x26c>
804080f4:	015ca023          	sw	s5,0(s9)
804080f8:	00140413          	addi	s0,s0,1
804080fc:	004c8c93          	addi	s9,s9,4
80408100:	004b8b93          	addi	s7,s7,4
80408104:	fc8994e3          	bne	s3,s0,804080cc <do_execve+0xd4>
80408108:	000d2a83          	lw	s5,0(s10)
8040810c:	080b0c63          	beqz	s6,804081a4 <do_execve+0x1ac>
80408110:	01cb0513          	addi	a0,s6,28
80408114:	f75fc0ef          	jal	ra,80405088 <up>
80408118:	000a2783          	lw	a5,0(s4)
8040811c:	020b2423          	sw	zero,40(s6)
80408120:	0dc7a503          	lw	a0,220(a5)
80408124:	a00fe0ef          	jal	ra,80406324 <files_closeall>
80408128:	00000593          	li	a1,0
8040812c:	000a8513          	mv	a0,s5
80408130:	dc8fe0ef          	jal	ra,804066f8 <sysfile_open>
80408134:	00050b93          	mv	s7,a0
80408138:	080546e3          	bltz	a0,804089c4 <do_execve+0x9cc>
8040813c:	00094797          	auipc	a5,0x94
80408140:	6cc78793          	addi	a5,a5,1740 # 8049c808 <boot_cr3>
80408144:	0007a783          	lw	a5,0(a5)
80408148:	80000737          	lui	a4,0x80000
8040814c:	00c7d793          	srli	a5,a5,0xc
80408150:	00e7e7b3          	or	a5,a5,a4
80408154:	18079073          	csrw	satp,a5
80408158:	12000073          	sfence.vma
8040815c:	018b2783          	lw	a5,24(s6)
80408160:	fff78793          	addi	a5,a5,-1
80408164:	00fb2c23          	sw	a5,24(s6)
80408168:	1c078263          	beqz	a5,8040832c <do_execve+0x334>
8040816c:	000a2783          	lw	a5,0(s4)
80408170:	0007ac23          	sw	zero,24(a5)
80408174:	c44fc0ef          	jal	ra,804045b8 <mm_create>
80408178:	00050b13          	mv	s6,a0
8040817c:	00050c63          	beqz	a0,80408194 <do_execve+0x19c>
80408180:	00c50513          	addi	a0,a0,12 # 100c <_binary_bin_swap_img_size-0x6ff4>
80408184:	fd5fe0ef          	jal	ra,80407158 <setup_pgdir.isra.4>
80408188:	10050663          	beqz	a0,80408294 <do_execve+0x29c>
8040818c:	000b0513          	mv	a0,s6
80408190:	decfc0ef          	jal	ra,8040477c <mm_destroy>
80408194:	ffc00a93          	li	s5,-4
80408198:	ffc48413          	addi	s0,s1,-4
8040819c:	00890433          	add	s0,s2,s0
804081a0:	41c0006f          	j	804085bc <do_execve+0x5c4>
804081a4:	000a2783          	lw	a5,0(s4)
804081a8:	0dc7a503          	lw	a0,220(a5)
804081ac:	978fe0ef          	jal	ra,80406324 <files_closeall>
804081b0:	00000593          	li	a1,0
804081b4:	000a8513          	mv	a0,s5
804081b8:	d40fe0ef          	jal	ra,804066f8 <sysfile_open>
804081bc:	00050b93          	mv	s7,a0
804081c0:	000542e3          	bltz	a0,804089c4 <do_execve+0x9cc>
804081c4:	000a2783          	lw	a5,0(s4)
804081c8:	0187a783          	lw	a5,24(a5)
804081cc:	fa0784e3          	beqz	a5,80408174 <do_execve+0x17c>
804081d0:	0000c617          	auipc	a2,0xc
804081d4:	15060613          	addi	a2,a2,336 # 80414320 <CSWTCH.69+0x454>
804081d8:	28b00593          	li	a1,651
804081dc:	0000c517          	auipc	a0,0xc
804081e0:	65c50513          	addi	a0,a0,1628 # 80414838 <CSWTCH.69+0x96c>
804081e4:	c40f80ef          	jal	ra,80400624 <__panic>
804081e8:	ffc00a93          	li	s5,-4
804081ec:	02040463          	beqz	s0,80408214 <do_execve+0x21c>
804081f0:	fff40413          	addi	s0,s0,-1
804081f4:	00241413          	slli	s0,s0,0x2
804081f8:	00890433          	add	s0,s2,s0
804081fc:	0080006f          	j	80408204 <do_execve+0x20c>
80408200:	00078413          	mv	s0,a5
80408204:	00042503          	lw	a0,0(s0)
80408208:	facfa0ef          	jal	ra,804029b4 <kfree>
8040820c:	ffc40793          	addi	a5,s0,-4
80408210:	fe8918e3          	bne	s2,s0,80408200 <do_execve+0x208>
80408214:	000b0863          	beqz	s6,80408224 <do_execve+0x22c>
80408218:	01cb0513          	addi	a0,s6,28
8040821c:	e6dfc0ef          	jal	ra,80405088 <up>
80408220:	020b2423          	sw	zero,40(s6)
80408224:	17c12083          	lw	ra,380(sp)
80408228:	17812403          	lw	s0,376(sp)
8040822c:	000a8513          	mv	a0,s5
80408230:	17412483          	lw	s1,372(sp)
80408234:	17012903          	lw	s2,368(sp)
80408238:	16c12983          	lw	s3,364(sp)
8040823c:	16812a03          	lw	s4,360(sp)
80408240:	16412a83          	lw	s5,356(sp)
80408244:	16012b03          	lw	s6,352(sp)
80408248:	15c12b83          	lw	s7,348(sp)
8040824c:	15812c03          	lw	s8,344(sp)
80408250:	15412c83          	lw	s9,340(sp)
80408254:	15012d03          	lw	s10,336(sp)
80408258:	14c12d83          	lw	s11,332(sp)
8040825c:	18010113          	addi	sp,sp,384
80408260:	00008067          	ret
80408264:	000a8513          	mv	a0,s5
80408268:	f4cfa0ef          	jal	ra,804029b4 <kfree>
8040826c:	ffd00a93          	li	s5,-3
80408270:	f7dff06f          	j	804081ec <do_execve+0x1f4>
80408274:	000a2783          	lw	a5,0(s4)
80408278:	0000c617          	auipc	a2,0xc
8040827c:	09c60613          	addi	a2,a2,156 # 80414314 <CSWTCH.69+0x448>
80408280:	03300593          	li	a1,51
80408284:	0047a683          	lw	a3,4(a5)
80408288:	05810513          	addi	a0,sp,88
8040828c:	4940a0ef          	jal	ra,80412720 <snprintf>
80408290:	e11ff06f          	j	804080a0 <do_execve+0xa8>
80408294:	00000693          	li	a3,0
80408298:	03400613          	li	a2,52
8040829c:	08c10593          	addi	a1,sp,140
804082a0:	000b8513          	mv	a0,s7
804082a4:	d69fe0ef          	jal	ra,8040700c <load_icode_read>
804082a8:	00050a93          	mv	s5,a0
804082ac:	00051c63          	bnez	a0,804082c4 <do_execve+0x2cc>
804082b0:	08c12703          	lw	a4,140(sp)
804082b4:	464c47b7          	lui	a5,0x464c4
804082b8:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644c57f>
804082bc:	ff800a93          	li	s5,-8
804082c0:	0cf70e63          	beq	a4,a5,8040839c <do_execve+0x3a4>
804082c4:	00cb2683          	lw	a3,12(s6)
804082c8:	804007b7          	lui	a5,0x80400
804082cc:	6cf6e463          	bltu	a3,a5,80408994 <do_execve+0x99c>
804082d0:	00094797          	auipc	a5,0x94
804082d4:	53478793          	addi	a5,a5,1332 # 8049c804 <va_pa_offset>
804082d8:	0007a703          	lw	a4,0(a5)
804082dc:	00094797          	auipc	a5,0x94
804082e0:	4c078793          	addi	a5,a5,1216 # 8049c79c <npage>
804082e4:	0007a783          	lw	a5,0(a5)
804082e8:	40e686b3          	sub	a3,a3,a4
804082ec:	00c6d693          	srli	a3,a3,0xc
804082f0:	6af6fe63          	bgeu	a3,a5,804089ac <do_execve+0x9b4>
804082f4:	0000e797          	auipc	a5,0xe
804082f8:	dc478793          	addi	a5,a5,-572 # 804160b8 <nbase>
804082fc:	0007a783          	lw	a5,0(a5)
80408300:	00094717          	auipc	a4,0x94
80408304:	50c70713          	addi	a4,a4,1292 # 8049c80c <pages>
80408308:	00072503          	lw	a0,0(a4)
8040830c:	40f686b3          	sub	a3,a3,a5
80408310:	00569693          	slli	a3,a3,0x5
80408314:	00d50533          	add	a0,a0,a3
80408318:	00100593          	li	a1,1
8040831c:	9bdfa0ef          	jal	ra,80402cd8 <free_pages>
80408320:	000b0513          	mv	a0,s6
80408324:	c58fc0ef          	jal	ra,8040477c <mm_destroy>
80408328:	e71ff06f          	j	80408198 <do_execve+0x1a0>
8040832c:	000b0513          	mv	a0,s6
80408330:	e98fc0ef          	jal	ra,804049c8 <exit_mmap>
80408334:	00cb2683          	lw	a3,12(s6)
80408338:	804007b7          	lui	a5,0x80400
8040833c:	64f6ec63          	bltu	a3,a5,80408994 <do_execve+0x99c>
80408340:	00094797          	auipc	a5,0x94
80408344:	4c478793          	addi	a5,a5,1220 # 8049c804 <va_pa_offset>
80408348:	0007a703          	lw	a4,0(a5)
8040834c:	00094797          	auipc	a5,0x94
80408350:	45078793          	addi	a5,a5,1104 # 8049c79c <npage>
80408354:	0007a783          	lw	a5,0(a5)
80408358:	40e686b3          	sub	a3,a3,a4
8040835c:	00c6d693          	srli	a3,a3,0xc
80408360:	64f6f663          	bgeu	a3,a5,804089ac <do_execve+0x9b4>
80408364:	0000e797          	auipc	a5,0xe
80408368:	d5478793          	addi	a5,a5,-684 # 804160b8 <nbase>
8040836c:	0007a783          	lw	a5,0(a5)
80408370:	00094717          	auipc	a4,0x94
80408374:	49c70713          	addi	a4,a4,1180 # 8049c80c <pages>
80408378:	00072503          	lw	a0,0(a4)
8040837c:	40f686b3          	sub	a3,a3,a5
80408380:	00569693          	slli	a3,a3,0x5
80408384:	00d50533          	add	a0,a0,a3
80408388:	00100593          	li	a1,1
8040838c:	94dfa0ef          	jal	ra,80402cd8 <free_pages>
80408390:	000b0513          	mv	a0,s6
80408394:	be8fc0ef          	jal	ra,8040477c <mm_destroy>
80408398:	dd5ff06f          	j	8040816c <do_execve+0x174>
8040839c:	0b815603          	lhu	a2,184(sp)
804083a0:	0a412583          	lw	a1,164(sp)
804083a4:	0000c517          	auipc	a0,0xc
804083a8:	fa450513          	addi	a0,a0,-92 # 80414348 <CSWTCH.69+0x47c>
804083ac:	00000c93          	li	s9,0
804083b0:	e4df70ef          	jal	ra,804001fc <cprintf>
804083b4:	0b815783          	lhu	a5,184(sp)
804083b8:	3e078c63          	beqz	a5,804087b0 <do_execve+0x7b8>
804083bc:	001007b7          	lui	a5,0x100
804083c0:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
804083c4:	00094d97          	auipc	s11,0x94
804083c8:	448d8d93          	addi	s11,s11,1096 # 8049c80c <pages>
804083cc:	00f12c23          	sw	a5,24(sp)
804083d0:	02912023          	sw	s1,32(sp)
804083d4:	02812423          	sw	s0,40(sp)
804083d8:	01612a23          	sw	s6,20(sp)
804083dc:	01712823          	sw	s7,16(sp)
804083e0:	03312623          	sw	s3,44(sp)
804083e4:	0100006f          	j	804083f4 <do_execve+0x3fc>
804083e8:	0b815783          	lhu	a5,184(sp)
804083ec:	001c8c93          	addi	s9,s9,1
804083f0:	3afcf663          	bgeu	s9,a5,8040879c <do_execve+0x7a4>
804083f4:	0a812683          	lw	a3,168(sp)
804083f8:	01012503          	lw	a0,16(sp)
804083fc:	005c9793          	slli	a5,s9,0x5
80408400:	02000613          	li	a2,32
80408404:	00d786b3          	add	a3,a5,a3
80408408:	03810593          	addi	a1,sp,56
8040840c:	c01fe0ef          	jal	ra,8040700c <load_icode_read>
80408410:	1e051463          	bnez	a0,804085f8 <do_execve+0x600>
80408414:	03812703          	lw	a4,56(sp)
80408418:	00100793          	li	a5,1
8040841c:	fcf716e3          	bne	a4,a5,804083e8 <do_execve+0x3f0>
80408420:	04812603          	lw	a2,72(sp)
80408424:	04c12683          	lw	a3,76(sp)
80408428:	04012583          	lw	a1,64(sp)
8040842c:	0000c517          	auipc	a0,0xc
80408430:	f4050513          	addi	a0,a0,-192 # 8041436c <CSWTCH.69+0x4a0>
80408434:	dc9f70ef          	jal	ra,804001fc <cprintf>
80408438:	04c12603          	lw	a2,76(sp)
8040843c:	04812783          	lw	a5,72(sp)
80408440:	54f66263          	bltu	a2,a5,80408984 <do_execve+0x98c>
80408444:	05012783          	lw	a5,80(sp)
80408448:	0017f693          	andi	a3,a5,1
8040844c:	00068463          	beqz	a3,80408454 <do_execve+0x45c>
80408450:	00400693          	li	a3,4
80408454:	0027f713          	andi	a4,a5,2
80408458:	0047f793          	andi	a5,a5,4
8040845c:	18070663          	beqz	a4,804085e8 <do_execve+0x5f0>
80408460:	0026e693          	ori	a3,a3,2
80408464:	16078c63          	beqz	a5,804085dc <do_execve+0x5e4>
80408468:	01300793          	li	a5,19
8040846c:	0016e693          	ori	a3,a3,1
80408470:	00f12e23          	sw	a5,28(sp)
80408474:	0026f793          	andi	a5,a3,2
80408478:	16079263          	bnez	a5,804085dc <do_execve+0x5e4>
8040847c:	0046f793          	andi	a5,a3,4
80408480:	00078863          	beqz	a5,80408490 <do_execve+0x498>
80408484:	01c12783          	lw	a5,28(sp)
80408488:	0087e793          	ori	a5,a5,8
8040848c:	00f12e23          	sw	a5,28(sp)
80408490:	04012583          	lw	a1,64(sp)
80408494:	01412503          	lw	a0,20(sp)
80408498:	00000713          	li	a4,0
8040849c:	b54fc0ef          	jal	ra,804047f0 <mm_map>
804084a0:	14051c63          	bnez	a0,804085f8 <do_execve+0x600>
804084a4:	04012b83          	lw	s7,64(sp)
804084a8:	04812983          	lw	s3,72(sp)
804084ac:	fffff7b7          	lui	a5,0xfffff
804084b0:	03c12403          	lw	s0,60(sp)
804084b4:	013b89b3          	add	s3,s7,s3
804084b8:	00fbf4b3          	and	s1,s7,a5
804084bc:	4b3bfe63          	bgeu	s7,s3,80408978 <do_execve+0x980>
804084c0:	03912223          	sw	s9,36(sp)
804084c4:	00094d17          	auipc	s10,0x94
804084c8:	340d0d13          	addi	s10,s10,832 # 8049c804 <va_pa_offset>
804084cc:	00048c93          	mv	s9,s1
804084d0:	0b40006f          	j	80408584 <do_execve+0x58c>
804084d4:	000017b7          	lui	a5,0x1
804084d8:	00fc8c33          	add	s8,s9,a5
804084dc:	419b84b3          	sub	s1,s7,s9
804084e0:	417c0b33          	sub	s6,s8,s7
804084e4:	0189f463          	bgeu	s3,s8,804084ec <do_execve+0x4f4>
804084e8:	41798b33          	sub	s6,s3,s7
804084ec:	000da603          	lw	a2,0(s11)
804084f0:	0000e797          	auipc	a5,0xe
804084f4:	bc878793          	addi	a5,a5,-1080 # 804160b8 <nbase>
804084f8:	0007a783          	lw	a5,0(a5)
804084fc:	40ca8633          	sub	a2,s5,a2
80408500:	40565613          	srai	a2,a2,0x5
80408504:	00f60633          	add	a2,a2,a5
80408508:	000b0693          	mv	a3,s6
8040850c:	00c61613          	slli	a2,a2,0xc
80408510:	000c8593          	mv	a1,s9
80408514:	0000c517          	auipc	a0,0xc
80408518:	e8c50513          	addi	a0,a0,-372 # 804143a0 <CSWTCH.69+0x4d4>
8040851c:	00f12623          	sw	a5,12(sp)
80408520:	cddf70ef          	jal	ra,804001fc <cprintf>
80408524:	000da783          	lw	a5,0(s11)
80408528:	00c12703          	lw	a4,12(sp)
8040852c:	00094697          	auipc	a3,0x94
80408530:	27068693          	addi	a3,a3,624 # 8049c79c <npage>
80408534:	40fa87b3          	sub	a5,s5,a5
80408538:	4057d793          	srai	a5,a5,0x5
8040853c:	00e787b3          	add	a5,a5,a4
80408540:	01812703          	lw	a4,24(sp)
80408544:	0006a683          	lw	a3,0(a3)
80408548:	00e7f633          	and	a2,a5,a4
8040854c:	00c79793          	slli	a5,a5,0xc
80408550:	46d67e63          	bgeu	a2,a3,804089cc <do_execve+0x9d4>
80408554:	000d2583          	lw	a1,0(s10)
80408558:	01012503          	lw	a0,16(sp)
8040855c:	00040693          	mv	a3,s0
80408560:	00b785b3          	add	a1,a5,a1
80408564:	000b0613          	mv	a2,s6
80408568:	009585b3          	add	a1,a1,s1
8040856c:	aa1fe0ef          	jal	ra,8040700c <load_icode_read>
80408570:	08051463          	bnez	a0,804085f8 <do_execve+0x600>
80408574:	016b8bb3          	add	s7,s7,s6
80408578:	01640433          	add	s0,s0,s6
8040857c:	000c0c93          	mv	s9,s8
80408580:	093bf463          	bgeu	s7,s3,80408608 <do_execve+0x610>
80408584:	01412783          	lw	a5,20(sp)
80408588:	01c12603          	lw	a2,28(sp)
8040858c:	000c8593          	mv	a1,s9
80408590:	00c7a503          	lw	a0,12(a5)
80408594:	984fb0ef          	jal	ra,80403718 <pgdir_alloc_page>
80408598:	00050a93          	mv	s5,a0
8040859c:	f2051ce3          	bnez	a0,804084d4 <do_execve+0x4dc>
804085a0:	02012483          	lw	s1,32(sp)
804085a4:	01412b03          	lw	s6,20(sp)
804085a8:	ffc00a93          	li	s5,-4
804085ac:	000b0513          	mv	a0,s6
804085b0:	c18fc0ef          	jal	ra,804049c8 <exit_mmap>
804085b4:	d11ff06f          	j	804082c4 <do_execve+0x2cc>
804085b8:	00078413          	mv	s0,a5
804085bc:	00042503          	lw	a0,0(s0)
804085c0:	bf4fa0ef          	jal	ra,804029b4 <kfree>
804085c4:	ffc40793          	addi	a5,s0,-4
804085c8:	fe8918e3          	bne	s2,s0,804085b8 <do_execve+0x5c0>
804085cc:	000a8513          	mv	a0,s5
804085d0:	c0cff0ef          	jal	ra,804079dc <do_exit>
804085d4:	ffd00a93          	li	s5,-3
804085d8:	c4dff06f          	j	80408224 <do_execve+0x22c>
804085dc:	01700793          	li	a5,23
804085e0:	00f12e23          	sw	a5,28(sp)
804085e4:	e99ff06f          	j	8040847c <do_execve+0x484>
804085e8:	01100713          	li	a4,17
804085ec:	00e12e23          	sw	a4,28(sp)
804085f0:	e6079ce3          	bnez	a5,80408468 <do_execve+0x470>
804085f4:	e81ff06f          	j	80408474 <do_execve+0x47c>
804085f8:	02012483          	lw	s1,32(sp)
804085fc:	01412b03          	lw	s6,20(sp)
80408600:	00050a93          	mv	s5,a0
80408604:	fa9ff06f          	j	804085ac <do_execve+0x5b4>
80408608:	02412c83          	lw	s9,36(sp)
8040860c:	04012403          	lw	s0,64(sp)
80408610:	000c0b13          	mv	s6,s8
80408614:	000a8c13          	mv	s8,s5
80408618:	04c12783          	lw	a5,76(sp)
8040861c:	00f40433          	add	s0,s0,a5
80408620:	0b6bf663          	bgeu	s7,s6,804086cc <do_execve+0x6d4>
80408624:	dd7402e3          	beq	s0,s7,804083e8 <do_execve+0x3f0>
80408628:	00001537          	lui	a0,0x1
8040862c:	00ab8533          	add	a0,s7,a0
80408630:	41650533          	sub	a0,a0,s6
80408634:	417404b3          	sub	s1,s0,s7
80408638:	01646463          	bltu	s0,s6,80408640 <do_execve+0x648>
8040863c:	417b04b3          	sub	s1,s6,s7
80408640:	000da783          	lw	a5,0(s11)
80408644:	0000e717          	auipc	a4,0xe
80408648:	a7470713          	addi	a4,a4,-1420 # 804160b8 <nbase>
8040864c:	00072683          	lw	a3,0(a4)
80408650:	40fc07b3          	sub	a5,s8,a5
80408654:	00094617          	auipc	a2,0x94
80408658:	14860613          	addi	a2,a2,328 # 8049c79c <npage>
8040865c:	01812703          	lw	a4,24(sp)
80408660:	4057d793          	srai	a5,a5,0x5
80408664:	00062603          	lw	a2,0(a2)
80408668:	00d787b3          	add	a5,a5,a3
8040866c:	00e7f5b3          	and	a1,a5,a4
80408670:	00c79693          	slli	a3,a5,0xc
80408674:	36c5fc63          	bgeu	a1,a2,804089ec <do_execve+0x9f4>
80408678:	00094797          	auipc	a5,0x94
8040867c:	18c78793          	addi	a5,a5,396 # 8049c804 <va_pa_offset>
80408680:	0007a783          	lw	a5,0(a5)
80408684:	00048613          	mv	a2,s1
80408688:	00000593          	li	a1,0
8040868c:	00f687b3          	add	a5,a3,a5
80408690:	00a78533          	add	a0,a5,a0
80408694:	1a80a0ef          	jal	ra,8041283c <memset>
80408698:	01748733          	add	a4,s1,s7
8040869c:	03647463          	bgeu	s0,s6,804086c4 <do_execve+0x6cc>
804086a0:	d4e404e3          	beq	s0,a4,804083e8 <do_execve+0x3f0>
804086a4:	0000c697          	auipc	a3,0xc
804086a8:	d2868693          	addi	a3,a3,-728 # 804143cc <CSWTCH.69+0x500>
804086ac:	0000a617          	auipc	a2,0xa
804086b0:	5c060613          	addi	a2,a2,1472 # 80412c6c <commands+0x1bc>
804086b4:	2e500593          	li	a1,741
804086b8:	0000c517          	auipc	a0,0xc
804086bc:	18050513          	addi	a0,a0,384 # 80414838 <CSWTCH.69+0x96c>
804086c0:	f65f70ef          	jal	ra,80400624 <__panic>
804086c4:	ff6710e3          	bne	a4,s6,804086a4 <do_execve+0x6ac>
804086c8:	000b0b93          	mv	s7,s6
804086cc:	d08bfee3          	bgeu	s7,s0,804083e8 <do_execve+0x3f0>
804086d0:	00001ab7          	lui	s5,0x1
804086d4:	00094997          	auipc	s3,0x94
804086d8:	0c898993          	addi	s3,s3,200 # 8049c79c <npage>
804086dc:	00094497          	auipc	s1,0x94
804086e0:	12848493          	addi	s1,s1,296 # 8049c804 <va_pa_offset>
804086e4:	01412d03          	lw	s10,20(sp)
804086e8:	01c12c03          	lw	s8,28(sp)
804086ec:	01912623          	sw	s9,12(sp)
804086f0:	0640006f          	j	80408754 <do_execve+0x75c>
804086f4:	416b8533          	sub	a0,s7,s6
804086f8:	015b0b33          	add	s6,s6,s5
804086fc:	417b0633          	sub	a2,s6,s7
80408700:	01647463          	bgeu	s0,s6,80408708 <do_execve+0x710>
80408704:	41740633          	sub	a2,s0,s7
80408708:	000da783          	lw	a5,0(s11)
8040870c:	0000e717          	auipc	a4,0xe
80408710:	9ac70713          	addi	a4,a4,-1620 # 804160b8 <nbase>
80408714:	00072583          	lw	a1,0(a4)
80408718:	40fc87b3          	sub	a5,s9,a5
8040871c:	01812703          	lw	a4,24(sp)
80408720:	4057d793          	srai	a5,a5,0x5
80408724:	0009a683          	lw	a3,0(s3)
80408728:	00b787b3          	add	a5,a5,a1
8040872c:	00e7f5b3          	and	a1,a5,a4
80408730:	00c79793          	slli	a5,a5,0xc
80408734:	2ad5fa63          	bgeu	a1,a3,804089e8 <do_execve+0x9f0>
80408738:	0004a683          	lw	a3,0(s1)
8040873c:	00cb8bb3          	add	s7,s7,a2
80408740:	00000593          	li	a1,0
80408744:	00d787b3          	add	a5,a5,a3
80408748:	00a78533          	add	a0,a5,a0
8040874c:	0f00a0ef          	jal	ra,8041283c <memset>
80408750:	208bfe63          	bgeu	s7,s0,8040896c <do_execve+0x974>
80408754:	00cd2503          	lw	a0,12(s10)
80408758:	000c0613          	mv	a2,s8
8040875c:	000b0593          	mv	a1,s6
80408760:	fb9fa0ef          	jal	ra,80403718 <pgdir_alloc_page>
80408764:	00050c93          	mv	s9,a0
80408768:	f80516e3          	bnez	a0,804086f4 <do_execve+0x6fc>
8040876c:	02012483          	lw	s1,32(sp)
80408770:	000d0b13          	mv	s6,s10
80408774:	e35ff06f          	j	804085a8 <do_execve+0x5b0>
80408778:	ffd00a93          	li	s5,-3
8040877c:	a80b1ee3          	bnez	s6,80408218 <do_execve+0x220>
80408780:	aa5ff06f          	j	80408224 <do_execve+0x22c>
80408784:	e40b08e3          	beqz	s6,804085d4 <do_execve+0x5dc>
80408788:	01cb0513          	addi	a0,s6,28
8040878c:	8fdfc0ef          	jal	ra,80405088 <up>
80408790:	ffd00a93          	li	s5,-3
80408794:	020b2423          	sw	zero,40(s6)
80408798:	a8dff06f          	j	80408224 <do_execve+0x22c>
8040879c:	02012483          	lw	s1,32(sp)
804087a0:	02812403          	lw	s0,40(sp)
804087a4:	01412b03          	lw	s6,20(sp)
804087a8:	01012b83          	lw	s7,16(sp)
804087ac:	02c12983          	lw	s3,44(sp)
804087b0:	000b8513          	mv	a0,s7
804087b4:	f9dfd0ef          	jal	ra,80406750 <sysfile_close>
804087b8:	00000713          	li	a4,0
804087bc:	00b00693          	li	a3,11
804087c0:	00100637          	lui	a2,0x100
804087c4:	7ff005b7          	lui	a1,0x7ff00
804087c8:	000b0513          	mv	a0,s6
804087cc:	824fc0ef          	jal	ra,804047f0 <mm_map>
804087d0:	00050a93          	mv	s5,a0
804087d4:	dc051ce3          	bnez	a0,804085ac <do_execve+0x5b4>
804087d8:	00cb2503          	lw	a0,12(s6)
804087dc:	01f00613          	li	a2,31
804087e0:	7ffff5b7          	lui	a1,0x7ffff
804087e4:	f35fa0ef          	jal	ra,80403718 <pgdir_alloc_page>
804087e8:	20050e63          	beqz	a0,80408a04 <do_execve+0xa0c>
804087ec:	00cb2503          	lw	a0,12(s6)
804087f0:	01f00613          	li	a2,31
804087f4:	7fffe5b7          	lui	a1,0x7fffe
804087f8:	f21fa0ef          	jal	ra,80403718 <pgdir_alloc_page>
804087fc:	28050063          	beqz	a0,80408a7c <do_execve+0xa84>
80408800:	00cb2503          	lw	a0,12(s6)
80408804:	01f00613          	li	a2,31
80408808:	7fffd5b7          	lui	a1,0x7fffd
8040880c:	f0dfa0ef          	jal	ra,80403718 <pgdir_alloc_page>
80408810:	24050663          	beqz	a0,80408a5c <do_execve+0xa64>
80408814:	00cb2503          	lw	a0,12(s6)
80408818:	01f00613          	li	a2,31
8040881c:	7fffc5b7          	lui	a1,0x7fffc
80408820:	ef9fa0ef          	jal	ra,80403718 <pgdir_alloc_page>
80408824:	20050c63          	beqz	a0,80408a3c <do_execve+0xa44>
80408828:	018b2783          	lw	a5,24(s6)
8040882c:	000a2703          	lw	a4,0(s4)
80408830:	00cb2683          	lw	a3,12(s6)
80408834:	00178793          	addi	a5,a5,1
80408838:	00fb2c23          	sw	a5,24(s6)
8040883c:	01672c23          	sw	s6,24(a4)
80408840:	804007b7          	lui	a5,0x80400
80408844:	1ef6e063          	bltu	a3,a5,80408a24 <do_execve+0xa2c>
80408848:	00094797          	auipc	a5,0x94
8040884c:	fbc78793          	addi	a5,a5,-68 # 8049c804 <va_pa_offset>
80408850:	0007a783          	lw	a5,0(a5)
80408854:	40f686b3          	sub	a3,a3,a5
80408858:	00c6d793          	srli	a5,a3,0xc
8040885c:	04d72c23          	sw	a3,88(a4)
80408860:	80000737          	lui	a4,0x80000
80408864:	00e7e7b3          	or	a5,a5,a4
80408868:	18079073          	csrw	satp,a5
8040886c:	12000073          	sfence.vma
80408870:	00000c93          	li	s9,0
80408874:	00090c13          	mv	s8,s2
80408878:	00000b93          	li	s7,0
8040887c:	000c2503          	lw	a0,0(s8)
80408880:	000015b7          	lui	a1,0x1
80408884:	001b8b93          	addi	s7,s7,1
80408888:	701090ef          	jal	ra,80412788 <strnlen>
8040888c:	00150513          	addi	a0,a0,1
80408890:	00ac8cb3          	add	s9,s9,a0
80408894:	004c0c13          	addi	s8,s8,4
80408898:	ff3be2e3          	bltu	s7,s3,8040887c <do_execve+0x884>
8040889c:	fffccc93          	not	s9,s9
804088a0:	800007b7          	lui	a5,0x80000
804088a4:	ffccfc93          	andi	s9,s9,-4
804088a8:	00fc8cb3          	add	s9,s9,a5
804088ac:	409c8b33          	sub	s6,s9,s1
804088b0:	412b07b3          	sub	a5,s6,s2
804088b4:	00090c13          	mv	s8,s2
804088b8:	00000d93          	li	s11,0
804088bc:	00000b93          	li	s7,0
804088c0:	00f12623          	sw	a5,12(sp)
804088c4:	000c2d03          	lw	s10,0(s8)
804088c8:	017c8533          	add	a0,s9,s7
804088cc:	001d8d93          	addi	s11,s11,1
804088d0:	000d0593          	mv	a1,s10
804088d4:	6f1090ef          	jal	ra,804127c4 <strcpy>
804088d8:	00c12783          	lw	a5,12(sp)
804088dc:	000015b7          	lui	a1,0x1
804088e0:	01878733          	add	a4,a5,s8
804088e4:	00a72023          	sw	a0,0(a4) # 80000000 <end+0xffb63740>
804088e8:	000d0513          	mv	a0,s10
804088ec:	69d090ef          	jal	ra,80412788 <strnlen>
804088f0:	01750bb3          	add	s7,a0,s7
804088f4:	001b8b93          	addi	s7,s7,1
804088f8:	004c0c13          	addi	s8,s8,4
804088fc:	fd3de4e3          	bltu	s11,s3,804088c4 <do_execve+0x8cc>
80408900:	000a2783          	lw	a5,0(s4)
80408904:	fe8b2e23          	sw	s0,-4(s6)
80408908:	09000613          	li	a2,144
8040890c:	0547a403          	lw	s0,84(a5) # 80000054 <end+0xffb63794>
80408910:	00000593          	li	a1,0
80408914:	ffcb0b13          	addi	s6,s6,-4
80408918:	08042983          	lw	s3,128(s0)
8040891c:	00040513          	mv	a0,s0
80408920:	71d090ef          	jal	ra,8041283c <memset>
80408924:	0a412783          	lw	a5,164(sp)
80408928:	edf9f993          	andi	s3,s3,-289
8040892c:	0209e993          	ori	s3,s3,32
80408930:	ffc48493          	addi	s1,s1,-4
80408934:	01642423          	sw	s6,8(s0)
80408938:	08f42223          	sw	a5,132(s0)
8040893c:	09342023          	sw	s3,128(s0)
80408940:	009904b3          	add	s1,s2,s1
80408944:	0080006f          	j	8040894c <do_execve+0x954>
80408948:	00078493          	mv	s1,a5
8040894c:	0004a503          	lw	a0,0(s1)
80408950:	864fa0ef          	jal	ra,804029b4 <kfree>
80408954:	ffc48793          	addi	a5,s1,-4
80408958:	fe9918e3          	bne	s2,s1,80408948 <do_execve+0x950>
8040895c:	000a2503          	lw	a0,0(s4)
80408960:	05810593          	addi	a1,sp,88
80408964:	901fe0ef          	jal	ra,80407264 <set_proc_name>
80408968:	8bdff06f          	j	80408224 <do_execve+0x22c>
8040896c:	000c8c13          	mv	s8,s9
80408970:	00c12c83          	lw	s9,12(sp)
80408974:	a75ff06f          	j	804083e8 <do_execve+0x3f0>
80408978:	000b8413          	mv	s0,s7
8040897c:	00048b13          	mv	s6,s1
80408980:	c99ff06f          	j	80408618 <do_execve+0x620>
80408984:	02012483          	lw	s1,32(sp)
80408988:	01412b03          	lw	s6,20(sp)
8040898c:	ff800a93          	li	s5,-8
80408990:	c1dff06f          	j	804085ac <do_execve+0x5b4>
80408994:	0000b617          	auipc	a2,0xb
80408998:	c8860613          	addi	a2,a2,-888 # 8041361c <default_pmm_manager+0x64>
8040899c:	07000593          	li	a1,112
804089a0:	0000b517          	auipc	a0,0xb
804089a4:	c6c50513          	addi	a0,a0,-916 # 8041360c <default_pmm_manager+0x54>
804089a8:	c7df70ef          	jal	ra,80400624 <__panic>
804089ac:	0000b617          	auipc	a2,0xb
804089b0:	c9460613          	addi	a2,a2,-876 # 80413640 <default_pmm_manager+0x88>
804089b4:	06900593          	li	a1,105
804089b8:	0000b517          	auipc	a0,0xb
804089bc:	c5450513          	addi	a0,a0,-940 # 8041360c <default_pmm_manager+0x54>
804089c0:	c65f70ef          	jal	ra,80400624 <__panic>
804089c4:	000b8a93          	mv	s5,s7
804089c8:	fd0ff06f          	j	80408198 <do_execve+0x1a0>
804089cc:	00078693          	mv	a3,a5
804089d0:	0000b617          	auipc	a2,0xb
804089d4:	c1860613          	addi	a2,a2,-1000 # 804135e8 <default_pmm_manager+0x30>
804089d8:	06e00593          	li	a1,110
804089dc:	0000b517          	auipc	a0,0xb
804089e0:	c3050513          	addi	a0,a0,-976 # 8041360c <default_pmm_manager+0x54>
804089e4:	c41f70ef          	jal	ra,80400624 <__panic>
804089e8:	00078693          	mv	a3,a5
804089ec:	0000b617          	auipc	a2,0xb
804089f0:	bfc60613          	addi	a2,a2,-1028 # 804135e8 <default_pmm_manager+0x30>
804089f4:	06e00593          	li	a1,110
804089f8:	0000b517          	auipc	a0,0xb
804089fc:	c1450513          	addi	a0,a0,-1004 # 8041360c <default_pmm_manager+0x54>
80408a00:	c25f70ef          	jal	ra,80400624 <__panic>
80408a04:	0000c697          	auipc	a3,0xc
80408a08:	a0468693          	addi	a3,a3,-1532 # 80414408 <CSWTCH.69+0x53c>
80408a0c:	0000a617          	auipc	a2,0xa
80408a10:	26060613          	addi	a2,a2,608 # 80412c6c <commands+0x1bc>
80408a14:	2fa00593          	li	a1,762
80408a18:	0000c517          	auipc	a0,0xc
80408a1c:	e2050513          	addi	a0,a0,-480 # 80414838 <CSWTCH.69+0x96c>
80408a20:	c05f70ef          	jal	ra,80400624 <__panic>
80408a24:	0000b617          	auipc	a2,0xb
80408a28:	bf860613          	addi	a2,a2,-1032 # 8041361c <default_pmm_manager+0x64>
80408a2c:	30100593          	li	a1,769
80408a30:	0000c517          	auipc	a0,0xc
80408a34:	e0850513          	addi	a0,a0,-504 # 80414838 <CSWTCH.69+0x96c>
80408a38:	bedf70ef          	jal	ra,80400624 <__panic>
80408a3c:	0000c697          	auipc	a3,0xc
80408a40:	a9868693          	addi	a3,a3,-1384 # 804144d4 <CSWTCH.69+0x608>
80408a44:	0000a617          	auipc	a2,0xa
80408a48:	22860613          	addi	a2,a2,552 # 80412c6c <commands+0x1bc>
80408a4c:	2fd00593          	li	a1,765
80408a50:	0000c517          	auipc	a0,0xc
80408a54:	de850513          	addi	a0,a0,-536 # 80414838 <CSWTCH.69+0x96c>
80408a58:	bcdf70ef          	jal	ra,80400624 <__panic>
80408a5c:	0000c697          	auipc	a3,0xc
80408a60:	a3468693          	addi	a3,a3,-1484 # 80414490 <CSWTCH.69+0x5c4>
80408a64:	0000a617          	auipc	a2,0xa
80408a68:	20860613          	addi	a2,a2,520 # 80412c6c <commands+0x1bc>
80408a6c:	2fc00593          	li	a1,764
80408a70:	0000c517          	auipc	a0,0xc
80408a74:	dc850513          	addi	a0,a0,-568 # 80414838 <CSWTCH.69+0x96c>
80408a78:	badf70ef          	jal	ra,80400624 <__panic>
80408a7c:	0000c697          	auipc	a3,0xc
80408a80:	9d068693          	addi	a3,a3,-1584 # 8041444c <CSWTCH.69+0x580>
80408a84:	0000a617          	auipc	a2,0xa
80408a88:	1e860613          	addi	a2,a2,488 # 80412c6c <commands+0x1bc>
80408a8c:	2fb00593          	li	a1,763
80408a90:	0000c517          	auipc	a0,0xc
80408a94:	da850513          	addi	a0,a0,-600 # 80414838 <CSWTCH.69+0x96c>
80408a98:	b8df70ef          	jal	ra,80400624 <__panic>

80408a9c <do_yield>:
80408a9c:	00094797          	auipc	a5,0x94
80408aa0:	d1478793          	addi	a5,a5,-748 # 8049c7b0 <current>
80408aa4:	0007a783          	lw	a5,0(a5)
80408aa8:	00100713          	li	a4,1
80408aac:	00000513          	li	a0,0
80408ab0:	00e7a823          	sw	a4,16(a5)
80408ab4:	00008067          	ret

80408ab8 <do_wait>:
80408ab8:	ff010113          	addi	sp,sp,-16
80408abc:	00812423          	sw	s0,8(sp)
80408ac0:	00912223          	sw	s1,4(sp)
80408ac4:	00112623          	sw	ra,12(sp)
80408ac8:	00058413          	mv	s0,a1
80408acc:	00050493          	mv	s1,a0
80408ad0:	02058263          	beqz	a1,80408af4 <do_wait+0x3c>
80408ad4:	00094797          	auipc	a5,0x94
80408ad8:	cdc78793          	addi	a5,a5,-804 # 8049c7b0 <current>
80408adc:	0007a783          	lw	a5,0(a5)
80408ae0:	00100693          	li	a3,1
80408ae4:	00400613          	li	a2,4
80408ae8:	0187a503          	lw	a0,24(a5)
80408aec:	91cfc0ef          	jal	ra,80404c08 <user_mem_check>
80408af0:	02050063          	beqz	a0,80408b10 <do_wait+0x58>
80408af4:	00040593          	mv	a1,s0
80408af8:	00812403          	lw	s0,8(sp)
80408afc:	00c12083          	lw	ra,12(sp)
80408b00:	00048513          	mv	a0,s1
80408b04:	00412483          	lw	s1,4(sp)
80408b08:	01010113          	addi	sp,sp,16
80408b0c:	90cff06f          	j	80407c18 <do_wait.part.8>
80408b10:	00c12083          	lw	ra,12(sp)
80408b14:	00812403          	lw	s0,8(sp)
80408b18:	00412483          	lw	s1,4(sp)
80408b1c:	ffd00513          	li	a0,-3
80408b20:	01010113          	addi	sp,sp,16
80408b24:	00008067          	ret

80408b28 <do_kill>:
80408b28:	ff010113          	addi	sp,sp,-16
80408b2c:	00112623          	sw	ra,12(sp)
80408b30:	00812423          	sw	s0,8(sp)
80408b34:	81dfe0ef          	jal	ra,80407350 <find_proc>
80408b38:	04050c63          	beqz	a0,80408b90 <do_kill+0x68>
80408b3c:	05c52703          	lw	a4,92(a0)
80408b40:	00177693          	andi	a3,a4,1
80408b44:	04069263          	bnez	a3,80408b88 <do_kill+0x60>
80408b48:	0a852683          	lw	a3,168(a0)
80408b4c:	00176713          	ori	a4,a4,1
80408b50:	04e52e23          	sw	a4,92(a0)
80408b54:	00000413          	li	s0,0
80408b58:	0006cc63          	bltz	a3,80408b70 <do_kill+0x48>
80408b5c:	00040513          	mv	a0,s0
80408b60:	00c12083          	lw	ra,12(sp)
80408b64:	00812403          	lw	s0,8(sp)
80408b68:	01010113          	addi	sp,sp,16
80408b6c:	00008067          	ret
80408b70:	691030ef          	jal	ra,8040ca00 <wakeup_proc>
80408b74:	00040513          	mv	a0,s0
80408b78:	00c12083          	lw	ra,12(sp)
80408b7c:	00812403          	lw	s0,8(sp)
80408b80:	01010113          	addi	sp,sp,16
80408b84:	00008067          	ret
80408b88:	ff700413          	li	s0,-9
80408b8c:	fd1ff06f          	j	80408b5c <do_kill+0x34>
80408b90:	ffd00413          	li	s0,-3
80408b94:	fc9ff06f          	j	80408b5c <do_kill+0x34>

80408b98 <proc_init>:
80408b98:	00002737          	lui	a4,0x2
80408b9c:	00094797          	auipc	a5,0x94
80408ba0:	d1c78793          	addi	a5,a5,-740 # 8049c8b8 <proc_list>
80408ba4:	ff010113          	addi	sp,sp,-16
80408ba8:	00090697          	auipc	a3,0x90
80408bac:	48e6ae23          	sw	a4,1180(a3) # 80499044 <last_pid>
80408bb0:	00090697          	auipc	a3,0x90
80408bb4:	48e6ac23          	sw	a4,1176(a3) # 80499048 <next_safe>
80408bb8:	00094717          	auipc	a4,0x94
80408bbc:	d0f72223          	sw	a5,-764(a4) # 8049c8bc <proc_list+0x4>
80408bc0:	00094717          	auipc	a4,0x94
80408bc4:	cef72c23          	sw	a5,-776(a4) # 8049c8b8 <proc_list>
80408bc8:	00112623          	sw	ra,12(sp)
80408bcc:	00812423          	sw	s0,8(sp)
80408bd0:	00912223          	sw	s1,4(sp)
80408bd4:	01212023          	sw	s2,0(sp)
80408bd8:	00091797          	auipc	a5,0x91
80408bdc:	b7078793          	addi	a5,a5,-1168 # 80499748 <hash_list>
80408be0:	00093717          	auipc	a4,0x93
80408be4:	b6870713          	addi	a4,a4,-1176 # 8049b748 <__rq>
80408be8:	00f7a223          	sw	a5,4(a5)
80408bec:	00f7a023          	sw	a5,0(a5)
80408bf0:	00878793          	addi	a5,a5,8
80408bf4:	fee79ae3          	bne	a5,a4,80408be8 <proc_init+0x50>
80408bf8:	a70fe0ef          	jal	ra,80406e68 <alloc_proc>
80408bfc:	00094797          	auipc	a5,0x94
80408c00:	baa7ac23          	sw	a0,-1096(a5) # 8049c7b4 <idleproc>
80408c04:	00050413          	mv	s0,a0
80408c08:	00094497          	auipc	s1,0x94
80408c0c:	bac48493          	addi	s1,s1,-1108 # 8049c7b4 <idleproc>
80408c10:	0e050263          	beqz	a0,80408cf4 <proc_init+0x15c>
80408c14:	00200793          	li	a5,2
80408c18:	00f52023          	sw	a5,0(a0)
80408c1c:	00100913          	li	s2,1
80408c20:	0000e797          	auipc	a5,0xe
80408c24:	3e078793          	addi	a5,a5,992 # 80417000 <bootstack>
80408c28:	00052223          	sw	zero,4(a0)
80408c2c:	00f52623          	sw	a5,12(a0)
80408c30:	01252823          	sw	s2,16(a0)
80408c34:	dd0fd0ef          	jal	ra,80406204 <files_create>
80408c38:	0ca42e23          	sw	a0,220(s0)
80408c3c:	12050463          	beqz	a0,80408d64 <proc_init+0x1cc>
80408c40:	0004a503          	lw	a0,0(s1)
80408c44:	0000c597          	auipc	a1,0xc
80408c48:	b3058593          	addi	a1,a1,-1232 # 80414774 <CSWTCH.69+0x8a8>
80408c4c:	0dc52703          	lw	a4,220(a0)
80408c50:	00872783          	lw	a5,8(a4)
80408c54:	00178793          	addi	a5,a5,1
80408c58:	00f72423          	sw	a5,8(a4)
80408c5c:	e08fe0ef          	jal	ra,80407264 <set_proc_name>
80408c60:	00094797          	auipc	a5,0x94
80408c64:	b5c78793          	addi	a5,a5,-1188 # 8049c7bc <nr_process>
80408c68:	0007a783          	lw	a5,0(a5)
80408c6c:	0004a703          	lw	a4,0(s1)
80408c70:	00000613          	li	a2,0
80408c74:	00178793          	addi	a5,a5,1
80408c78:	00000593          	li	a1,0
80408c7c:	fffff517          	auipc	a0,0xfffff
80408c80:	1e050513          	addi	a0,a0,480 # 80407e5c <init_main>
80408c84:	00094697          	auipc	a3,0x94
80408c88:	b2f6ac23          	sw	a5,-1224(a3) # 8049c7bc <nr_process>
80408c8c:	00094797          	auipc	a5,0x94
80408c90:	b2e7a223          	sw	a4,-1244(a5) # 8049c7b0 <current>
80408c94:	ccdfe0ef          	jal	ra,80407960 <kernel_thread>
80408c98:	0aa05a63          	blez	a0,80408d4c <proc_init+0x1b4>
80408c9c:	eb4fe0ef          	jal	ra,80407350 <find_proc>
80408ca0:	0000c597          	auipc	a1,0xc
80408ca4:	af858593          	addi	a1,a1,-1288 # 80414798 <CSWTCH.69+0x8cc>
80408ca8:	00094797          	auipc	a5,0x94
80408cac:	b0a7a823          	sw	a0,-1264(a5) # 8049c7b8 <initproc>
80408cb0:	db4fe0ef          	jal	ra,80407264 <set_proc_name>
80408cb4:	0004a783          	lw	a5,0(s1)
80408cb8:	06078a63          	beqz	a5,80408d2c <proc_init+0x194>
80408cbc:	0047a783          	lw	a5,4(a5)
80408cc0:	06079663          	bnez	a5,80408d2c <proc_init+0x194>
80408cc4:	00094797          	auipc	a5,0x94
80408cc8:	af478793          	addi	a5,a5,-1292 # 8049c7b8 <initproc>
80408ccc:	0007a783          	lw	a5,0(a5)
80408cd0:	02078e63          	beqz	a5,80408d0c <proc_init+0x174>
80408cd4:	0047a783          	lw	a5,4(a5)
80408cd8:	03279a63          	bne	a5,s2,80408d0c <proc_init+0x174>
80408cdc:	00c12083          	lw	ra,12(sp)
80408ce0:	00812403          	lw	s0,8(sp)
80408ce4:	00412483          	lw	s1,4(sp)
80408ce8:	00012903          	lw	s2,0(sp)
80408cec:	01010113          	addi	sp,sp,16
80408cf0:	00008067          	ret
80408cf4:	0000c617          	auipc	a2,0xc
80408cf8:	a4460613          	addi	a2,a2,-1468 # 80414738 <CSWTCH.69+0x86c>
80408cfc:	44f00593          	li	a1,1103
80408d00:	0000c517          	auipc	a0,0xc
80408d04:	b3850513          	addi	a0,a0,-1224 # 80414838 <CSWTCH.69+0x96c>
80408d08:	91df70ef          	jal	ra,80400624 <__panic>
80408d0c:	0000c697          	auipc	a3,0xc
80408d10:	abc68693          	addi	a3,a3,-1348 # 804147c8 <CSWTCH.69+0x8fc>
80408d14:	0000a617          	auipc	a2,0xa
80408d18:	f5860613          	addi	a2,a2,-168 # 80412c6c <commands+0x1bc>
80408d1c:	46a00593          	li	a1,1130
80408d20:	0000c517          	auipc	a0,0xc
80408d24:	b1850513          	addi	a0,a0,-1256 # 80414838 <CSWTCH.69+0x96c>
80408d28:	8fdf70ef          	jal	ra,80400624 <__panic>
80408d2c:	0000c697          	auipc	a3,0xc
80408d30:	a7468693          	addi	a3,a3,-1420 # 804147a0 <CSWTCH.69+0x8d4>
80408d34:	0000a617          	auipc	a2,0xa
80408d38:	f3860613          	addi	a2,a2,-200 # 80412c6c <commands+0x1bc>
80408d3c:	46900593          	li	a1,1129
80408d40:	0000c517          	auipc	a0,0xc
80408d44:	af850513          	addi	a0,a0,-1288 # 80414838 <CSWTCH.69+0x96c>
80408d48:	8ddf70ef          	jal	ra,80400624 <__panic>
80408d4c:	0000c617          	auipc	a2,0xc
80408d50:	a3060613          	addi	a2,a2,-1488 # 8041477c <CSWTCH.69+0x8b0>
80408d54:	46300593          	li	a1,1123
80408d58:	0000c517          	auipc	a0,0xc
80408d5c:	ae050513          	addi	a0,a0,-1312 # 80414838 <CSWTCH.69+0x96c>
80408d60:	8c5f70ef          	jal	ra,80400624 <__panic>
80408d64:	0000c617          	auipc	a2,0xc
80408d68:	9ec60613          	addi	a2,a2,-1556 # 80414750 <CSWTCH.69+0x884>
80408d6c:	45800593          	li	a1,1112
80408d70:	0000c517          	auipc	a0,0xc
80408d74:	ac850513          	addi	a0,a0,-1336 # 80414838 <CSWTCH.69+0x96c>
80408d78:	8adf70ef          	jal	ra,80400624 <__panic>

80408d7c <cpu_idle>:
80408d7c:	ff010113          	addi	sp,sp,-16
80408d80:	00812423          	sw	s0,8(sp)
80408d84:	00112623          	sw	ra,12(sp)
80408d88:	00094417          	auipc	s0,0x94
80408d8c:	a2840413          	addi	s0,s0,-1496 # 8049c7b0 <current>
80408d90:	00042703          	lw	a4,0(s0)
80408d94:	01072783          	lw	a5,16(a4)
80408d98:	fe078ee3          	beqz	a5,80408d94 <cpu_idle+0x18>
80408d9c:	561030ef          	jal	ra,8040cafc <schedule>
80408da0:	ff1ff06f          	j	80408d90 <cpu_idle+0x14>

80408da4 <lab6_set_priority>:
80408da4:	00094797          	auipc	a5,0x94
80408da8:	a0c78793          	addi	a5,a5,-1524 # 8049c7b0 <current>
80408dac:	0007a783          	lw	a5,0(a5)
80408db0:	00051863          	bnez	a0,80408dc0 <lab6_set_priority+0x1c>
80408db4:	00100713          	li	a4,1
80408db8:	0ce7ac23          	sw	a4,216(a5)
80408dbc:	00008067          	ret
80408dc0:	0ca7ac23          	sw	a0,216(a5)
80408dc4:	00008067          	ret

80408dc8 <do_sleep>:
80408dc8:	08050063          	beqz	a0,80408e48 <do_sleep+0x80>
80408dcc:	fe010113          	addi	sp,sp,-32
80408dd0:	00812c23          	sw	s0,24(sp)
80408dd4:	00112e23          	sw	ra,28(sp)
80408dd8:	00050413          	mv	s0,a0
80408ddc:	100027f3          	csrr	a5,sstatus
80408de0:	0027f793          	andi	a5,a5,2
80408de4:	06079663          	bnez	a5,80408e50 <do_sleep+0x88>
80408de8:	00094797          	auipc	a5,0x94
80408dec:	9c878793          	addi	a5,a5,-1592 # 8049c7b0 <current>
80408df0:	0007a783          	lw	a5,0(a5)
80408df4:	00810713          	addi	a4,sp,8
80408df8:	00a12023          	sw	a0,0(sp)
80408dfc:	00e12623          	sw	a4,12(sp)
80408e00:	00e12423          	sw	a4,8(sp)
80408e04:	00f12223          	sw	a5,4(sp)
80408e08:	00100713          	li	a4,1
80408e0c:	00e7a023          	sw	a4,0(a5)
80408e10:	80000737          	lui	a4,0x80000
80408e14:	00010413          	mv	s0,sp
80408e18:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63742>
80408e1c:	0ae7a423          	sw	a4,168(a5)
80408e20:	00040513          	mv	a0,s0
80408e24:	609030ef          	jal	ra,8040cc2c <add_timer>
80408e28:	4d5030ef          	jal	ra,8040cafc <schedule>
80408e2c:	00040513          	mv	a0,s0
80408e30:	709030ef          	jal	ra,8040cd38 <del_timer>
80408e34:	01c12083          	lw	ra,28(sp)
80408e38:	01812403          	lw	s0,24(sp)
80408e3c:	00000513          	li	a0,0
80408e40:	02010113          	addi	sp,sp,32
80408e44:	00008067          	ret
80408e48:	00000513          	li	a0,0
80408e4c:	00008067          	ret
80408e50:	dddf70ef          	jal	ra,80400c2c <intr_disable>
80408e54:	00094797          	auipc	a5,0x94
80408e58:	95c78793          	addi	a5,a5,-1700 # 8049c7b0 <current>
80408e5c:	0007a783          	lw	a5,0(a5)
80408e60:	00810713          	addi	a4,sp,8
80408e64:	00812023          	sw	s0,0(sp)
80408e68:	00f12223          	sw	a5,4(sp)
80408e6c:	00e12623          	sw	a4,12(sp)
80408e70:	00e12423          	sw	a4,8(sp)
80408e74:	00100713          	li	a4,1
80408e78:	00e7a023          	sw	a4,0(a5)
80408e7c:	80000737          	lui	a4,0x80000
80408e80:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63742>
80408e84:	00010413          	mv	s0,sp
80408e88:	00040513          	mv	a0,s0
80408e8c:	0ae7a423          	sw	a4,168(a5)
80408e90:	59d030ef          	jal	ra,8040cc2c <add_timer>
80408e94:	d91f70ef          	jal	ra,80400c24 <intr_enable>
80408e98:	f91ff06f          	j	80408e28 <do_sleep+0x60>

80408e9c <switch_to>:
80408e9c:	00152023          	sw	ra,0(a0)
80408ea0:	00252223          	sw	sp,4(a0)
80408ea4:	00852423          	sw	s0,8(a0)
80408ea8:	00952623          	sw	s1,12(a0)
80408eac:	01252823          	sw	s2,16(a0)
80408eb0:	01352a23          	sw	s3,20(a0)
80408eb4:	01452c23          	sw	s4,24(a0)
80408eb8:	01552e23          	sw	s5,28(a0)
80408ebc:	03652023          	sw	s6,32(a0)
80408ec0:	03752223          	sw	s7,36(a0)
80408ec4:	03852423          	sw	s8,40(a0)
80408ec8:	03952623          	sw	s9,44(a0)
80408ecc:	03a52823          	sw	s10,48(a0)
80408ed0:	03b52a23          	sw	s11,52(a0)
80408ed4:	0005a083          	lw	ra,0(a1)
80408ed8:	0045a103          	lw	sp,4(a1)
80408edc:	0085a403          	lw	s0,8(a1)
80408ee0:	00c5a483          	lw	s1,12(a1)
80408ee4:	0105a903          	lw	s2,16(a1)
80408ee8:	0145a983          	lw	s3,20(a1)
80408eec:	0185aa03          	lw	s4,24(a1)
80408ef0:	01c5aa83          	lw	s5,28(a1)
80408ef4:	0205ab03          	lw	s6,32(a1)
80408ef8:	0245ab83          	lw	s7,36(a1)
80408efc:	0285ac03          	lw	s8,40(a1)
80408f00:	02c5ac83          	lw	s9,44(a1)
80408f04:	0305ad03          	lw	s10,48(a1)
80408f08:	0345ad83          	lw	s11,52(a1)
80408f0c:	00008067          	ret

80408f10 <proc_stride_comp_f>:
80408f10:	00c52503          	lw	a0,12(a0)
80408f14:	00c5a783          	lw	a5,12(a1)
80408f18:	40f50533          	sub	a0,a0,a5
80408f1c:	00a04863          	bgtz	a0,80408f2c <proc_stride_comp_f+0x1c>
80408f20:	00a03533          	snez	a0,a0
80408f24:	40a00533          	neg	a0,a0
80408f28:	00008067          	ret
80408f2c:	00100513          	li	a0,1
80408f30:	00008067          	ret

80408f34 <stride_init>:
80408f34:	00a52223          	sw	a0,4(a0)
80408f38:	00a52023          	sw	a0,0(a0)
80408f3c:	00052823          	sw	zero,16(a0)
80408f40:	00052423          	sw	zero,8(a0)
80408f44:	00008067          	ret

80408f48 <stride_pick_next>:
80408f48:	ff010113          	addi	sp,sp,-16
80408f4c:	00812423          	sw	s0,8(sp)
80408f50:	01052403          	lw	s0,16(a0)
80408f54:	00112623          	sw	ra,12(sp)
80408f58:	00912223          	sw	s1,4(sp)
80408f5c:	01212023          	sw	s2,0(sp)
80408f60:	04040263          	beqz	s0,80408fa4 <stride_pick_next+0x5c>
80408f64:	01042583          	lw	a1,16(s0)
80408f68:	f3840913          	addi	s2,s0,-200
80408f6c:	00c42483          	lw	s1,12(s0)
80408f70:	40000537          	lui	a0,0x40000
80408f74:	02059463          	bnez	a1,80408f9c <stride_pick_next+0x54>
80408f78:	00a484b3          	add	s1,s1,a0
80408f7c:	00942623          	sw	s1,12(s0)
80408f80:	00c12083          	lw	ra,12(sp)
80408f84:	00812403          	lw	s0,8(sp)
80408f88:	00090513          	mv	a0,s2
80408f8c:	00412483          	lw	s1,4(sp)
80408f90:	00012903          	lw	s2,0(sp)
80408f94:	01010113          	addi	sp,sp,16
80408f98:	00008067          	ret
80408f9c:	161090ef          	jal	ra,804128fc <__udivsi3>
80408fa0:	fd9ff06f          	j	80408f78 <stride_pick_next+0x30>
80408fa4:	00000913          	li	s2,0
80408fa8:	fd9ff06f          	j	80408f80 <stride_pick_next+0x38>

80408fac <stride_proc_tick>:
80408fac:	0c45a783          	lw	a5,196(a1)
80408fb0:	00f05663          	blez	a5,80408fbc <stride_proc_tick+0x10>
80408fb4:	fff78793          	addi	a5,a5,-1
80408fb8:	0cf5a223          	sw	a5,196(a1)
80408fbc:	00079663          	bnez	a5,80408fc8 <stride_proc_tick+0x1c>
80408fc0:	00100793          	li	a5,1
80408fc4:	00f5a823          	sw	a5,16(a1)
80408fc8:	00008067          	ret

80408fcc <skew_heap_merge.constprop.3>:
80408fcc:	ff010113          	addi	sp,sp,-16
80408fd0:	00812423          	sw	s0,8(sp)
80408fd4:	00112623          	sw	ra,12(sp)
80408fd8:	00912223          	sw	s1,4(sp)
80408fdc:	01212023          	sw	s2,0(sp)
80408fe0:	00058413          	mv	s0,a1
80408fe4:	02050c63          	beqz	a0,8040901c <skew_heap_merge.constprop.3+0x50>
80408fe8:	00050493          	mv	s1,a0
80408fec:	06058663          	beqz	a1,80409058 <skew_heap_merge.constprop.3+0x8c>
80408ff0:	f21ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80408ff4:	fff00793          	li	a5,-1
80408ff8:	04f50063          	beq	a0,a5,80409038 <skew_heap_merge.constprop.3+0x6c>
80408ffc:	00842583          	lw	a1,8(s0)
80409000:	00442903          	lw	s2,4(s0)
80409004:	00048513          	mv	a0,s1
80409008:	fc5ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040900c:	00a42223          	sw	a0,4(s0)
80409010:	01242423          	sw	s2,8(s0)
80409014:	00050463          	beqz	a0,8040901c <skew_heap_merge.constprop.3+0x50>
80409018:	00852023          	sw	s0,0(a0) # 40000000 <_binary_bin_sfs_img_size+0x3ff88000>
8040901c:	00040513          	mv	a0,s0
80409020:	00c12083          	lw	ra,12(sp)
80409024:	00812403          	lw	s0,8(sp)
80409028:	00412483          	lw	s1,4(sp)
8040902c:	00012903          	lw	s2,0(sp)
80409030:	01010113          	addi	sp,sp,16
80409034:	00008067          	ret
80409038:	0084a503          	lw	a0,8(s1)
8040903c:	0044a903          	lw	s2,4(s1)
80409040:	00040593          	mv	a1,s0
80409044:	f89ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409048:	00a4a223          	sw	a0,4(s1)
8040904c:	0124a423          	sw	s2,8(s1)
80409050:	00050463          	beqz	a0,80409058 <skew_heap_merge.constprop.3+0x8c>
80409054:	00952023          	sw	s1,0(a0)
80409058:	00c12083          	lw	ra,12(sp)
8040905c:	00812403          	lw	s0,8(sp)
80409060:	00048513          	mv	a0,s1
80409064:	00012903          	lw	s2,0(sp)
80409068:	00412483          	lw	s1,4(sp)
8040906c:	01010113          	addi	sp,sp,16
80409070:	00008067          	ret

80409074 <stride_enqueue>:
80409074:	fb010113          	addi	sp,sp,-80
80409078:	03312e23          	sw	s3,60(sp)
8040907c:	01052983          	lw	s3,16(a0)
80409080:	04812423          	sw	s0,72(sp)
80409084:	04912223          	sw	s1,68(sp)
80409088:	05212023          	sw	s2,64(sp)
8040908c:	04112623          	sw	ra,76(sp)
80409090:	03412c23          	sw	s4,56(sp)
80409094:	03512a23          	sw	s5,52(sp)
80409098:	03612823          	sw	s6,48(sp)
8040909c:	03712623          	sw	s7,44(sp)
804090a0:	03812423          	sw	s8,40(sp)
804090a4:	03912223          	sw	s9,36(sp)
804090a8:	03a12023          	sw	s10,32(sp)
804090ac:	01b12e23          	sw	s11,28(sp)
804090b0:	0c05a423          	sw	zero,200(a1)
804090b4:	0c05a823          	sw	zero,208(a1)
804090b8:	0c05a623          	sw	zero,204(a1)
804090bc:	00050493          	mv	s1,a0
804090c0:	00058413          	mv	s0,a1
804090c4:	0c858913          	addi	s2,a1,200
804090c8:	02098463          	beqz	s3,804090f0 <stride_enqueue+0x7c>
804090cc:	0c090c63          	beqz	s2,804091a4 <stride_enqueue+0x130>
804090d0:	00090593          	mv	a1,s2
804090d4:	00098513          	mv	a0,s3
804090d8:	e39ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804090dc:	fff00793          	li	a5,-1
804090e0:	00050a13          	mv	s4,a0
804090e4:	06f50a63          	beq	a0,a5,80409158 <stride_enqueue+0xe4>
804090e8:	0d342623          	sw	s3,204(s0)
804090ec:	0129a023          	sw	s2,0(s3)
804090f0:	0c442783          	lw	a5,196(s0)
804090f4:	0124a823          	sw	s2,16(s1)
804090f8:	00c4a703          	lw	a4,12(s1)
804090fc:	04079a63          	bnez	a5,80409150 <stride_enqueue+0xdc>
80409100:	0ce42223          	sw	a4,196(s0)
80409104:	0084a783          	lw	a5,8(s1)
80409108:	04c12083          	lw	ra,76(sp)
8040910c:	0a942c23          	sw	s1,184(s0)
80409110:	04812403          	lw	s0,72(sp)
80409114:	00178793          	addi	a5,a5,1
80409118:	00f4a423          	sw	a5,8(s1)
8040911c:	04012903          	lw	s2,64(sp)
80409120:	04412483          	lw	s1,68(sp)
80409124:	03c12983          	lw	s3,60(sp)
80409128:	03812a03          	lw	s4,56(sp)
8040912c:	03412a83          	lw	s5,52(sp)
80409130:	03012b03          	lw	s6,48(sp)
80409134:	02c12b83          	lw	s7,44(sp)
80409138:	02812c03          	lw	s8,40(sp)
8040913c:	02412c83          	lw	s9,36(sp)
80409140:	02012d03          	lw	s10,32(sp)
80409144:	01c12d83          	lw	s11,28(sp)
80409148:	05010113          	addi	sp,sp,80
8040914c:	00008067          	ret
80409150:	faf75ae3          	bge	a4,a5,80409104 <stride_enqueue+0x90>
80409154:	fadff06f          	j	80409100 <stride_enqueue+0x8c>
80409158:	0089aa83          	lw	s5,8(s3)
8040915c:	0049ab03          	lw	s6,4(s3)
80409160:	020a8063          	beqz	s5,80409180 <stride_enqueue+0x10c>
80409164:	00090593          	mv	a1,s2
80409168:	000a8513          	mv	a0,s5
8040916c:	da5ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409170:	00050b93          	mv	s7,a0
80409174:	05450463          	beq	a0,s4,804091bc <stride_enqueue+0x148>
80409178:	0d542623          	sw	s5,204(s0)
8040917c:	012aa023          	sw	s2,0(s5) # 1000 <_binary_bin_swap_img_size-0x7000>
80409180:	0129a223          	sw	s2,4(s3)
80409184:	0169a423          	sw	s6,8(s3)
80409188:	0c442783          	lw	a5,196(s0)
8040918c:	01392023          	sw	s3,0(s2)
80409190:	00098913          	mv	s2,s3
80409194:	0124a823          	sw	s2,16(s1)
80409198:	00c4a703          	lw	a4,12(s1)
8040919c:	f60782e3          	beqz	a5,80409100 <stride_enqueue+0x8c>
804091a0:	fb1ff06f          	j	80409150 <stride_enqueue+0xdc>
804091a4:	0c442783          	lw	a5,196(s0)
804091a8:	00098913          	mv	s2,s3
804091ac:	0124a823          	sw	s2,16(s1)
804091b0:	00c4a703          	lw	a4,12(s1)
804091b4:	f40786e3          	beqz	a5,80409100 <stride_enqueue+0x8c>
804091b8:	f99ff06f          	j	80409150 <stride_enqueue+0xdc>
804091bc:	008aaa03          	lw	s4,8(s5)
804091c0:	004aac03          	lw	s8,4(s5)
804091c4:	020a0063          	beqz	s4,804091e4 <stride_enqueue+0x170>
804091c8:	00090593          	mv	a1,s2
804091cc:	000a0513          	mv	a0,s4
804091d0:	d41ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804091d4:	00050c93          	mv	s9,a0
804091d8:	03750063          	beq	a0,s7,804091f8 <stride_enqueue+0x184>
804091dc:	0d442623          	sw	s4,204(s0)
804091e0:	012a2023          	sw	s2,0(s4)
804091e4:	012aa223          	sw	s2,4(s5)
804091e8:	018aa423          	sw	s8,8(s5)
804091ec:	01592023          	sw	s5,0(s2)
804091f0:	000a8913          	mv	s2,s5
804091f4:	f8dff06f          	j	80409180 <stride_enqueue+0x10c>
804091f8:	008a2b83          	lw	s7,8(s4)
804091fc:	004a2d03          	lw	s10,4(s4)
80409200:	000b8e63          	beqz	s7,8040921c <stride_enqueue+0x1a8>
80409204:	00090593          	mv	a1,s2
80409208:	000b8513          	mv	a0,s7
8040920c:	d05ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409210:	03950063          	beq	a0,s9,80409230 <stride_enqueue+0x1bc>
80409214:	0d742623          	sw	s7,204(s0)
80409218:	012ba023          	sw	s2,0(s7)
8040921c:	012a2223          	sw	s2,4(s4)
80409220:	01aa2423          	sw	s10,8(s4)
80409224:	01492023          	sw	s4,0(s2)
80409228:	000a0913          	mv	s2,s4
8040922c:	fb9ff06f          	j	804091e4 <stride_enqueue+0x170>
80409230:	008bac83          	lw	s9,8(s7)
80409234:	004bad83          	lw	s11,4(s7)
80409238:	020c8063          	beqz	s9,80409258 <stride_enqueue+0x1e4>
8040923c:	00090593          	mv	a1,s2
80409240:	000c8513          	mv	a0,s9
80409244:	ccdff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409248:	fff00793          	li	a5,-1
8040924c:	02f50063          	beq	a0,a5,8040926c <stride_enqueue+0x1f8>
80409250:	0d942623          	sw	s9,204(s0)
80409254:	012ca023          	sw	s2,0(s9)
80409258:	012ba223          	sw	s2,4(s7)
8040925c:	01bba423          	sw	s11,8(s7)
80409260:	01792023          	sw	s7,0(s2)
80409264:	000b8913          	mv	s2,s7
80409268:	fb5ff06f          	j	8040921c <stride_enqueue+0x1a8>
8040926c:	004ca783          	lw	a5,4(s9)
80409270:	008ca503          	lw	a0,8(s9)
80409274:	00090593          	mv	a1,s2
80409278:	00f12623          	sw	a5,12(sp)
8040927c:	d51ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409280:	00c12783          	lw	a5,12(sp)
80409284:	00aca223          	sw	a0,4(s9)
80409288:	00fca423          	sw	a5,8(s9)
8040928c:	00050863          	beqz	a0,8040929c <stride_enqueue+0x228>
80409290:	01952023          	sw	s9,0(a0)
80409294:	000c8913          	mv	s2,s9
80409298:	fc1ff06f          	j	80409258 <stride_enqueue+0x1e4>
8040929c:	000c8913          	mv	s2,s9
804092a0:	fb9ff06f          	j	80409258 <stride_enqueue+0x1e4>

804092a4 <stride_dequeue>:
804092a4:	0b85a783          	lw	a5,184(a1)
804092a8:	fa010113          	addi	sp,sp,-96
804092ac:	04112e23          	sw	ra,92(sp)
804092b0:	04812c23          	sw	s0,88(sp)
804092b4:	04912a23          	sw	s1,84(sp)
804092b8:	05212823          	sw	s2,80(sp)
804092bc:	05312623          	sw	s3,76(sp)
804092c0:	05412423          	sw	s4,72(sp)
804092c4:	05512223          	sw	s5,68(sp)
804092c8:	05612023          	sw	s6,64(sp)
804092cc:	03712e23          	sw	s7,60(sp)
804092d0:	03812c23          	sw	s8,56(sp)
804092d4:	03912a23          	sw	s9,52(sp)
804092d8:	03a12823          	sw	s10,48(sp)
804092dc:	03b12623          	sw	s11,44(sp)
804092e0:	00a78463          	beq	a5,a0,804092e8 <stride_dequeue+0x44>
804092e4:	2790206f          	j	8040bd5c <stride_dequeue+0x2ab8>
804092e8:	00852983          	lw	s3,8(a0)
804092ec:	00050c13          	mv	s8,a0
804092f0:	00098b13          	mv	s6,s3
804092f4:	00099463          	bnez	s3,804092fc <stride_dequeue+0x58>
804092f8:	2650206f          	j	8040bd5c <stride_dequeue+0x2ab8>
804092fc:	0cc5a903          	lw	s2,204(a1)
80409300:	00058493          	mv	s1,a1
80409304:	01052a83          	lw	s5,16(a0)
80409308:	0c85ad03          	lw	s10,200(a1)
8040930c:	0d05a403          	lw	s0,208(a1)
80409310:	3c090e63          	beqz	s2,804096ec <stride_dequeue+0x448>
80409314:	58040c63          	beqz	s0,804098ac <stride_dequeue+0x608>
80409318:	00040593          	mv	a1,s0
8040931c:	00090513          	mv	a0,s2
80409320:	bf1ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409324:	fff00c93          	li	s9,-1
80409328:	00050a13          	mv	s4,a0
8040932c:	21950663          	beq	a0,s9,80409538 <stride_dequeue+0x294>
80409330:	00842a03          	lw	s4,8(s0)
80409334:	00442b83          	lw	s7,4(s0)
80409338:	180a0a63          	beqz	s4,804094cc <stride_dequeue+0x228>
8040933c:	000a0593          	mv	a1,s4
80409340:	00090513          	mv	a0,s2
80409344:	bcdff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409348:	3b950e63          	beq	a0,s9,80409704 <stride_dequeue+0x460>
8040934c:	004a2783          	lw	a5,4(s4)
80409350:	008a2d83          	lw	s11,8(s4)
80409354:	00f12023          	sw	a5,0(sp)
80409358:	160d8063          	beqz	s11,804094b8 <stride_dequeue+0x214>
8040935c:	000d8593          	mv	a1,s11
80409360:	00090513          	mv	a0,s2
80409364:	badff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409368:	2b9500e3          	beq	a0,s9,80409e08 <stride_dequeue+0xb64>
8040936c:	004da783          	lw	a5,4(s11)
80409370:	008dac83          	lw	s9,8(s11)
80409374:	00f12223          	sw	a5,4(sp)
80409378:	120c8663          	beqz	s9,804094a4 <stride_dequeue+0x200>
8040937c:	000c8593          	mv	a1,s9
80409380:	00090513          	mv	a0,s2
80409384:	b8dff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409388:	fff00893          	li	a7,-1
8040938c:	171504e3          	beq	a0,a7,80409cf4 <stride_dequeue+0xa50>
80409390:	004ca783          	lw	a5,4(s9)
80409394:	008ca803          	lw	a6,8(s9)
80409398:	00f12423          	sw	a5,8(sp)
8040939c:	0e080a63          	beqz	a6,80409490 <stride_dequeue+0x1ec>
804093a0:	00080593          	mv	a1,a6
804093a4:	00090513          	mv	a0,s2
804093a8:	01012623          	sw	a6,12(sp)
804093ac:	b65ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804093b0:	fff00893          	li	a7,-1
804093b4:	00c12803          	lw	a6,12(sp)
804093b8:	01151463          	bne	a0,a7,804093c0 <stride_dequeue+0x11c>
804093bc:	02c0106f          	j	8040a3e8 <stride_dequeue+0x1144>
804093c0:	00482703          	lw	a4,4(a6) # fffff004 <end+0x7fb62744>
804093c4:	00882783          	lw	a5,8(a6)
804093c8:	00e12623          	sw	a4,12(sp)
804093cc:	0a078863          	beqz	a5,8040947c <stride_dequeue+0x1d8>
804093d0:	00078593          	mv	a1,a5
804093d4:	00090513          	mv	a0,s2
804093d8:	01012a23          	sw	a6,20(sp)
804093dc:	00f12823          	sw	a5,16(sp)
804093e0:	b31ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804093e4:	fff00893          	li	a7,-1
804093e8:	01012783          	lw	a5,16(sp)
804093ec:	01412803          	lw	a6,20(sp)
804093f0:	01151463          	bne	a0,a7,804093f8 <stride_dequeue+0x154>
804093f4:	7900106f          	j	8040ab84 <stride_dequeue+0x18e0>
804093f8:	0047a703          	lw	a4,4(a5)
804093fc:	0087ab03          	lw	s6,8(a5)
80409400:	00e12823          	sw	a4,16(sp)
80409404:	060b0263          	beqz	s6,80409468 <stride_dequeue+0x1c4>
80409408:	000b0593          	mv	a1,s6
8040940c:	00090513          	mv	a0,s2
80409410:	00f12c23          	sw	a5,24(sp)
80409414:	01012a23          	sw	a6,20(sp)
80409418:	af9ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040941c:	fff00893          	li	a7,-1
80409420:	01412803          	lw	a6,20(sp)
80409424:	01812783          	lw	a5,24(sp)
80409428:	01151463          	bne	a0,a7,80409430 <stride_dequeue+0x18c>
8040942c:	0a00206f          	j	8040b4cc <stride_dequeue+0x2228>
80409430:	008b2583          	lw	a1,8(s6)
80409434:	004b2983          	lw	s3,4(s6)
80409438:	00090513          	mv	a0,s2
8040943c:	00f12c23          	sw	a5,24(sp)
80409440:	01012a23          	sw	a6,20(sp)
80409444:	b89ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409448:	00ab2223          	sw	a0,4(s6)
8040944c:	013b2423          	sw	s3,8(s6)
80409450:	01412803          	lw	a6,20(sp)
80409454:	01812783          	lw	a5,24(sp)
80409458:	00050463          	beqz	a0,80409460 <stride_dequeue+0x1bc>
8040945c:	01652023          	sw	s6,0(a0)
80409460:	008c2983          	lw	s3,8(s8)
80409464:	000b0913          	mv	s2,s6
80409468:	01012703          	lw	a4,16(sp)
8040946c:	0127a223          	sw	s2,4(a5)
80409470:	00e7a423          	sw	a4,8(a5)
80409474:	00f92023          	sw	a5,0(s2)
80409478:	00078913          	mv	s2,a5
8040947c:	00c12783          	lw	a5,12(sp)
80409480:	01282223          	sw	s2,4(a6)
80409484:	00f82423          	sw	a5,8(a6)
80409488:	01092023          	sw	a6,0(s2)
8040948c:	00080913          	mv	s2,a6
80409490:	00812783          	lw	a5,8(sp)
80409494:	012ca223          	sw	s2,4(s9)
80409498:	00fca423          	sw	a5,8(s9)
8040949c:	01992023          	sw	s9,0(s2)
804094a0:	000c8913          	mv	s2,s9
804094a4:	00412783          	lw	a5,4(sp)
804094a8:	012da223          	sw	s2,4(s11)
804094ac:	00fda423          	sw	a5,8(s11)
804094b0:	01b92023          	sw	s11,0(s2)
804094b4:	000d8913          	mv	s2,s11
804094b8:	00012783          	lw	a5,0(sp)
804094bc:	012a2223          	sw	s2,4(s4)
804094c0:	00fa2423          	sw	a5,8(s4)
804094c4:	01492023          	sw	s4,0(s2)
804094c8:	000a0913          	mv	s2,s4
804094cc:	01242223          	sw	s2,4(s0)
804094d0:	01742423          	sw	s7,8(s0)
804094d4:	00892023          	sw	s0,0(s2)
804094d8:	01a42023          	sw	s10,0(s0)
804094dc:	200d0c63          	beqz	s10,804096f4 <stride_dequeue+0x450>
804094e0:	004d2683          	lw	a3,4(s10)
804094e4:	0c848493          	addi	s1,s1,200
804094e8:	20968a63          	beq	a3,s1,804096fc <stride_dequeue+0x458>
804094ec:	008d2423          	sw	s0,8(s10)
804094f0:	05c12083          	lw	ra,92(sp)
804094f4:	05812403          	lw	s0,88(sp)
804094f8:	fff98993          	addi	s3,s3,-1
804094fc:	015c2823          	sw	s5,16(s8)
80409500:	013c2423          	sw	s3,8(s8)
80409504:	05412483          	lw	s1,84(sp)
80409508:	05012903          	lw	s2,80(sp)
8040950c:	04c12983          	lw	s3,76(sp)
80409510:	04812a03          	lw	s4,72(sp)
80409514:	04412a83          	lw	s5,68(sp)
80409518:	04012b03          	lw	s6,64(sp)
8040951c:	03c12b83          	lw	s7,60(sp)
80409520:	03812c03          	lw	s8,56(sp)
80409524:	03412c83          	lw	s9,52(sp)
80409528:	03012d03          	lw	s10,48(sp)
8040952c:	02c12d83          	lw	s11,44(sp)
80409530:	06010113          	addi	sp,sp,96
80409534:	00008067          	ret
80409538:	00892d83          	lw	s11,8(s2)
8040953c:	00492b83          	lw	s7,4(s2)
80409540:	180d8a63          	beqz	s11,804096d4 <stride_dequeue+0x430>
80409544:	00040593          	mv	a1,s0
80409548:	000d8513          	mv	a0,s11
8040954c:	9c5ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409550:	37450463          	beq	a0,s4,804098b8 <stride_dequeue+0x614>
80409554:	00442783          	lw	a5,4(s0)
80409558:	00842c83          	lw	s9,8(s0)
8040955c:	00f12023          	sw	a5,0(sp)
80409560:	160c8263          	beqz	s9,804096c4 <stride_dequeue+0x420>
80409564:	000c8593          	mv	a1,s9
80409568:	000d8513          	mv	a0,s11
8040956c:	9a5ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409570:	4d450863          	beq	a0,s4,80409a40 <stride_dequeue+0x79c>
80409574:	004ca783          	lw	a5,4(s9)
80409578:	008caa03          	lw	s4,8(s9)
8040957c:	00f12223          	sw	a5,4(sp)
80409580:	120a0863          	beqz	s4,804096b0 <stride_dequeue+0x40c>
80409584:	000a0593          	mv	a1,s4
80409588:	000d8513          	mv	a0,s11
8040958c:	985ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409590:	fff00893          	li	a7,-1
80409594:	551502e3          	beq	a0,a7,8040a2d8 <stride_dequeue+0x1034>
80409598:	004a2783          	lw	a5,4(s4)
8040959c:	008a2803          	lw	a6,8(s4)
804095a0:	00f12423          	sw	a5,8(sp)
804095a4:	0e080c63          	beqz	a6,8040969c <stride_dequeue+0x3f8>
804095a8:	00080593          	mv	a1,a6
804095ac:	000d8513          	mv	a0,s11
804095b0:	01012623          	sw	a6,12(sp)
804095b4:	95dff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804095b8:	fff00893          	li	a7,-1
804095bc:	00c12803          	lw	a6,12(sp)
804095c0:	01151463          	bne	a0,a7,804095c8 <stride_dequeue+0x324>
804095c4:	4000106f          	j	8040a9c4 <stride_dequeue+0x1720>
804095c8:	00482783          	lw	a5,4(a6)
804095cc:	00882303          	lw	t1,8(a6)
804095d0:	00f12623          	sw	a5,12(sp)
804095d4:	0a030a63          	beqz	t1,80409688 <stride_dequeue+0x3e4>
804095d8:	00030593          	mv	a1,t1
804095dc:	000d8513          	mv	a0,s11
804095e0:	01012a23          	sw	a6,20(sp)
804095e4:	00612823          	sw	t1,16(sp)
804095e8:	929ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804095ec:	fff00893          	li	a7,-1
804095f0:	01012303          	lw	t1,16(sp)
804095f4:	01412803          	lw	a6,20(sp)
804095f8:	01151463          	bne	a0,a7,80409600 <stride_dequeue+0x35c>
804095fc:	5cd0106f          	j	8040b3c8 <stride_dequeue+0x2124>
80409600:	00432783          	lw	a5,4(t1)
80409604:	00832983          	lw	s3,8(t1)
80409608:	00f12823          	sw	a5,16(sp)
8040960c:	00099463          	bnez	s3,80409614 <stride_dequeue+0x370>
80409610:	44c0206f          	j	8040ba5c <stride_dequeue+0x27b8>
80409614:	00098593          	mv	a1,s3
80409618:	000d8513          	mv	a0,s11
8040961c:	00612c23          	sw	t1,24(sp)
80409620:	01012a23          	sw	a6,20(sp)
80409624:	8edff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409628:	fff00893          	li	a7,-1
8040962c:	01412803          	lw	a6,20(sp)
80409630:	01812303          	lw	t1,24(sp)
80409634:	01151463          	bne	a0,a7,8040963c <stride_dequeue+0x398>
80409638:	6ac0206f          	j	8040bce4 <stride_dequeue+0x2a40>
8040963c:	0089a583          	lw	a1,8(s3)
80409640:	0049ab03          	lw	s6,4(s3)
80409644:	000d8513          	mv	a0,s11
80409648:	00612c23          	sw	t1,24(sp)
8040964c:	01012a23          	sw	a6,20(sp)
80409650:	97dff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409654:	00a9a223          	sw	a0,4(s3)
80409658:	0169a423          	sw	s6,8(s3)
8040965c:	01412803          	lw	a6,20(sp)
80409660:	01812303          	lw	t1,24(sp)
80409664:	00050463          	beqz	a0,8040966c <stride_dequeue+0x3c8>
80409668:	01352023          	sw	s3,0(a0)
8040966c:	008c2b03          	lw	s6,8(s8)
80409670:	01012783          	lw	a5,16(sp)
80409674:	01332223          	sw	s3,4(t1)
80409678:	00030d93          	mv	s11,t1
8040967c:	00f32423          	sw	a5,8(t1)
80409680:	0069a023          	sw	t1,0(s3)
80409684:	000b0993          	mv	s3,s6
80409688:	00c12783          	lw	a5,12(sp)
8040968c:	01b82223          	sw	s11,4(a6)
80409690:	00f82423          	sw	a5,8(a6)
80409694:	010da023          	sw	a6,0(s11)
80409698:	00080d93          	mv	s11,a6
8040969c:	00812783          	lw	a5,8(sp)
804096a0:	01ba2223          	sw	s11,4(s4)
804096a4:	00fa2423          	sw	a5,8(s4)
804096a8:	014da023          	sw	s4,0(s11)
804096ac:	000a0d93          	mv	s11,s4
804096b0:	00412783          	lw	a5,4(sp)
804096b4:	01bca223          	sw	s11,4(s9)
804096b8:	00fca423          	sw	a5,8(s9)
804096bc:	019da023          	sw	s9,0(s11)
804096c0:	000c8d93          	mv	s11,s9
804096c4:	00012783          	lw	a5,0(sp)
804096c8:	01b42223          	sw	s11,4(s0)
804096cc:	00f42423          	sw	a5,8(s0)
804096d0:	008da023          	sw	s0,0(s11)
804096d4:	00892223          	sw	s0,4(s2)
804096d8:	01792423          	sw	s7,8(s2)
804096dc:	01242023          	sw	s2,0(s0)
804096e0:	00090413          	mv	s0,s2
804096e4:	01a42023          	sw	s10,0(s0)
804096e8:	df5ff06f          	j	804094dc <stride_dequeue+0x238>
804096ec:	de0416e3          	bnez	s0,804094d8 <stride_dequeue+0x234>
804096f0:	de0d18e3          	bnez	s10,804094e0 <stride_dequeue+0x23c>
804096f4:	00040a93          	mv	s5,s0
804096f8:	df9ff06f          	j	804094f0 <stride_dequeue+0x24c>
804096fc:	008d2223          	sw	s0,4(s10)
80409700:	df1ff06f          	j	804094f0 <stride_dequeue+0x24c>
80409704:	00892d83          	lw	s11,8(s2)
80409708:	00a12023          	sw	a0,0(sp)
8040970c:	00492c83          	lw	s9,4(s2)
80409710:	180d8663          	beqz	s11,8040989c <stride_dequeue+0x5f8>
80409714:	000a0593          	mv	a1,s4
80409718:	000d8513          	mv	a0,s11
8040971c:	ff4ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409720:	00012783          	lw	a5,0(sp)
80409724:	46f50263          	beq	a0,a5,80409b88 <stride_dequeue+0x8e4>
80409728:	004a2783          	lw	a5,4(s4)
8040972c:	008a2603          	lw	a2,8(s4)
80409730:	00f12023          	sw	a5,0(sp)
80409734:	14060c63          	beqz	a2,8040988c <stride_dequeue+0x5e8>
80409738:	00060593          	mv	a1,a2
8040973c:	000d8513          	mv	a0,s11
80409740:	00c12223          	sw	a2,4(sp)
80409744:	fccff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409748:	fff00893          	li	a7,-1
8040974c:	00412603          	lw	a2,4(sp)
80409750:	25150ce3          	beq	a0,a7,8040a1a8 <stride_dequeue+0xf04>
80409754:	00462783          	lw	a5,4(a2)
80409758:	00862803          	lw	a6,8(a2)
8040975c:	00f12223          	sw	a5,4(sp)
80409760:	10080c63          	beqz	a6,80409878 <stride_dequeue+0x5d4>
80409764:	00080593          	mv	a1,a6
80409768:	000d8513          	mv	a0,s11
8040976c:	00c12623          	sw	a2,12(sp)
80409770:	01012423          	sw	a6,8(sp)
80409774:	f9cff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409778:	fff00893          	li	a7,-1
8040977c:	00812803          	lw	a6,8(sp)
80409780:	00c12603          	lw	a2,12(sp)
80409784:	01151463          	bne	a0,a7,8040978c <stride_dequeue+0x4e8>
80409788:	3100106f          	j	8040aa98 <stride_dequeue+0x17f4>
8040978c:	00482783          	lw	a5,4(a6)
80409790:	00882303          	lw	t1,8(a6)
80409794:	00f12423          	sw	a5,8(sp)
80409798:	0c030663          	beqz	t1,80409864 <stride_dequeue+0x5c0>
8040979c:	00030593          	mv	a1,t1
804097a0:	000d8513          	mv	a0,s11
804097a4:	01012a23          	sw	a6,20(sp)
804097a8:	00c12823          	sw	a2,16(sp)
804097ac:	00612623          	sw	t1,12(sp)
804097b0:	f60ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804097b4:	fff00893          	li	a7,-1
804097b8:	00c12303          	lw	t1,12(sp)
804097bc:	01012603          	lw	a2,16(sp)
804097c0:	01412803          	lw	a6,20(sp)
804097c4:	01151463          	bne	a0,a7,804097cc <stride_dequeue+0x528>
804097c8:	2e90106f          	j	8040b2b0 <stride_dequeue+0x200c>
804097cc:	00432783          	lw	a5,4(t1)
804097d0:	00832983          	lw	s3,8(t1)
804097d4:	00f12623          	sw	a5,12(sp)
804097d8:	00099463          	bnez	s3,804097e0 <stride_dequeue+0x53c>
804097dc:	4240206f          	j	8040bc00 <stride_dequeue+0x295c>
804097e0:	00098593          	mv	a1,s3
804097e4:	000d8513          	mv	a0,s11
804097e8:	00612c23          	sw	t1,24(sp)
804097ec:	01012a23          	sw	a6,20(sp)
804097f0:	00c12823          	sw	a2,16(sp)
804097f4:	f1cff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804097f8:	fff00893          	li	a7,-1
804097fc:	01012603          	lw	a2,16(sp)
80409800:	01412803          	lw	a6,20(sp)
80409804:	01812303          	lw	t1,24(sp)
80409808:	01151463          	bne	a0,a7,80409810 <stride_dequeue+0x56c>
8040980c:	3fc0206f          	j	8040bc08 <stride_dequeue+0x2964>
80409810:	0089a583          	lw	a1,8(s3)
80409814:	0049ab03          	lw	s6,4(s3)
80409818:	000d8513          	mv	a0,s11
8040981c:	00612c23          	sw	t1,24(sp)
80409820:	01012a23          	sw	a6,20(sp)
80409824:	00c12823          	sw	a2,16(sp)
80409828:	fa4ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040982c:	00a9a223          	sw	a0,4(s3)
80409830:	0169a423          	sw	s6,8(s3)
80409834:	01012603          	lw	a2,16(sp)
80409838:	01412803          	lw	a6,20(sp)
8040983c:	01812303          	lw	t1,24(sp)
80409840:	00050463          	beqz	a0,80409848 <stride_dequeue+0x5a4>
80409844:	01352023          	sw	s3,0(a0)
80409848:	008c2b03          	lw	s6,8(s8)
8040984c:	00c12783          	lw	a5,12(sp)
80409850:	01332223          	sw	s3,4(t1)
80409854:	00030d93          	mv	s11,t1
80409858:	00f32423          	sw	a5,8(t1)
8040985c:	0069a023          	sw	t1,0(s3)
80409860:	000b0993          	mv	s3,s6
80409864:	00812783          	lw	a5,8(sp)
80409868:	01b82223          	sw	s11,4(a6)
8040986c:	00f82423          	sw	a5,8(a6)
80409870:	010da023          	sw	a6,0(s11)
80409874:	00080d93          	mv	s11,a6
80409878:	00412783          	lw	a5,4(sp)
8040987c:	01b62223          	sw	s11,4(a2)
80409880:	00f62423          	sw	a5,8(a2)
80409884:	00cda023          	sw	a2,0(s11)
80409888:	00060d93          	mv	s11,a2
8040988c:	00012783          	lw	a5,0(sp)
80409890:	01ba2223          	sw	s11,4(s4)
80409894:	00fa2423          	sw	a5,8(s4)
80409898:	014da023          	sw	s4,0(s11)
8040989c:	01492223          	sw	s4,4(s2)
804098a0:	01992423          	sw	s9,8(s2)
804098a4:	012a2023          	sw	s2,0(s4)
804098a8:	c25ff06f          	j	804094cc <stride_dequeue+0x228>
804098ac:	00090413          	mv	s0,s2
804098b0:	01a42023          	sw	s10,0(s0)
804098b4:	c29ff06f          	j	804094dc <stride_dequeue+0x238>
804098b8:	004da783          	lw	a5,4(s11)
804098bc:	008dac83          	lw	s9,8(s11)
804098c0:	00a12223          	sw	a0,4(sp)
804098c4:	00f12023          	sw	a5,0(sp)
804098c8:	160c8063          	beqz	s9,80409a28 <stride_dequeue+0x784>
804098cc:	00040593          	mv	a1,s0
804098d0:	000c8513          	mv	a0,s9
804098d4:	e3cff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804098d8:	00412783          	lw	a5,4(sp)
804098dc:	66f50a63          	beq	a0,a5,80409f50 <stride_dequeue+0xcac>
804098e0:	00442783          	lw	a5,4(s0)
804098e4:	00842a03          	lw	s4,8(s0)
804098e8:	00f12223          	sw	a5,4(sp)
804098ec:	120a0663          	beqz	s4,80409a18 <stride_dequeue+0x774>
804098f0:	000a0593          	mv	a1,s4
804098f4:	000c8513          	mv	a0,s9
804098f8:	e18ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
804098fc:	fff00893          	li	a7,-1
80409900:	4f1506e3          	beq	a0,a7,8040a5ec <stride_dequeue+0x1348>
80409904:	004a2783          	lw	a5,4(s4)
80409908:	008a2803          	lw	a6,8(s4)
8040990c:	00f12423          	sw	a5,8(sp)
80409910:	0e080a63          	beqz	a6,80409a04 <stride_dequeue+0x760>
80409914:	00080593          	mv	a1,a6
80409918:	000c8513          	mv	a0,s9
8040991c:	01012623          	sw	a6,12(sp)
80409920:	df0ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409924:	fff00893          	li	a7,-1
80409928:	00c12803          	lw	a6,12(sp)
8040992c:	01151463          	bne	a0,a7,80409934 <stride_dequeue+0x690>
80409930:	5640106f          	j	8040ae94 <stride_dequeue+0x1bf0>
80409934:	00482783          	lw	a5,4(a6)
80409938:	00882983          	lw	s3,8(a6)
8040993c:	00f12623          	sw	a5,12(sp)
80409940:	00099463          	bnez	s3,80409948 <stride_dequeue+0x6a4>
80409944:	4380206f          	j	8040bd7c <stride_dequeue+0x2ad8>
80409948:	00098593          	mv	a1,s3
8040994c:	000c8513          	mv	a0,s9
80409950:	01012823          	sw	a6,16(sp)
80409954:	dbcff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409958:	fff00893          	li	a7,-1
8040995c:	01012803          	lw	a6,16(sp)
80409960:	01151463          	bne	a0,a7,80409968 <stride_dequeue+0x6c4>
80409964:	0780206f          	j	8040b9dc <stride_dequeue+0x2738>
80409968:	0049a783          	lw	a5,4(s3)
8040996c:	0089ae03          	lw	t3,8(s3)
80409970:	00f12823          	sw	a5,16(sp)
80409974:	060e0463          	beqz	t3,804099dc <stride_dequeue+0x738>
80409978:	000e0593          	mv	a1,t3
8040997c:	000c8513          	mv	a0,s9
80409980:	01012c23          	sw	a6,24(sp)
80409984:	01c12a23          	sw	t3,20(sp)
80409988:	d88ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040998c:	fff00893          	li	a7,-1
80409990:	01412e03          	lw	t3,20(sp)
80409994:	01812803          	lw	a6,24(sp)
80409998:	01151463          	bne	a0,a7,804099a0 <stride_dequeue+0x6fc>
8040999c:	6a40206f          	j	8040c040 <stride_dequeue+0x2d9c>
804099a0:	008e2583          	lw	a1,8(t3)
804099a4:	000c8513          	mv	a0,s9
804099a8:	004e2b03          	lw	s6,4(t3)
804099ac:	01012c23          	sw	a6,24(sp)
804099b0:	01c12a23          	sw	t3,20(sp)
804099b4:	e18ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
804099b8:	01412e03          	lw	t3,20(sp)
804099bc:	01812803          	lw	a6,24(sp)
804099c0:	00ae2223          	sw	a0,4(t3)
804099c4:	016e2423          	sw	s6,8(t3)
804099c8:	00051463          	bnez	a0,804099d0 <stride_dequeue+0x72c>
804099cc:	0e90206f          	j	8040c2b4 <stride_dequeue+0x3010>
804099d0:	008c2b03          	lw	s6,8(s8)
804099d4:	01c52023          	sw	t3,0(a0)
804099d8:	000e0c93          	mv	s9,t3
804099dc:	01012783          	lw	a5,16(sp)
804099e0:	0199a223          	sw	s9,4(s3)
804099e4:	00f9a423          	sw	a5,8(s3)
804099e8:	013ca023          	sw	s3,0(s9)
804099ec:	00c12783          	lw	a5,12(sp)
804099f0:	01382223          	sw	s3,4(a6)
804099f4:	00080c93          	mv	s9,a6
804099f8:	00f82423          	sw	a5,8(a6)
804099fc:	0109a023          	sw	a6,0(s3)
80409a00:	000b0993          	mv	s3,s6
80409a04:	00812783          	lw	a5,8(sp)
80409a08:	019a2223          	sw	s9,4(s4)
80409a0c:	00fa2423          	sw	a5,8(s4)
80409a10:	014ca023          	sw	s4,0(s9)
80409a14:	000a0c93          	mv	s9,s4
80409a18:	00412783          	lw	a5,4(sp)
80409a1c:	01942223          	sw	s9,4(s0)
80409a20:	00f42423          	sw	a5,8(s0)
80409a24:	008ca023          	sw	s0,0(s9)
80409a28:	00012783          	lw	a5,0(sp)
80409a2c:	008da223          	sw	s0,4(s11)
80409a30:	00fda423          	sw	a5,8(s11)
80409a34:	01b42023          	sw	s11,0(s0)
80409a38:	000d8413          	mv	s0,s11
80409a3c:	c99ff06f          	j	804096d4 <stride_dequeue+0x430>
80409a40:	004da783          	lw	a5,4(s11)
80409a44:	008daa03          	lw	s4,8(s11)
80409a48:	00f12223          	sw	a5,4(sp)
80409a4c:	120a0463          	beqz	s4,80409b74 <stride_dequeue+0x8d0>
80409a50:	000c8593          	mv	a1,s9
80409a54:	000a0513          	mv	a0,s4
80409a58:	cb8ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409a5c:	fff00893          	li	a7,-1
80409a60:	4b1500e3          	beq	a0,a7,8040a700 <stride_dequeue+0x145c>
80409a64:	004ca783          	lw	a5,4(s9)
80409a68:	008ca803          	lw	a6,8(s9)
80409a6c:	00f12423          	sw	a5,8(sp)
80409a70:	0e080a63          	beqz	a6,80409b64 <stride_dequeue+0x8c0>
80409a74:	00080593          	mv	a1,a6
80409a78:	000a0513          	mv	a0,s4
80409a7c:	01012623          	sw	a6,12(sp)
80409a80:	c90ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409a84:	fff00893          	li	a7,-1
80409a88:	00c12803          	lw	a6,12(sp)
80409a8c:	01151463          	bne	a0,a7,80409a94 <stride_dequeue+0x7f0>
80409a90:	4e00106f          	j	8040af70 <stride_dequeue+0x1ccc>
80409a94:	00482783          	lw	a5,4(a6)
80409a98:	00882983          	lw	s3,8(a6)
80409a9c:	00f12623          	sw	a5,12(sp)
80409aa0:	00099463          	bnez	s3,80409aa8 <stride_dequeue+0x804>
80409aa4:	2b00206f          	j	8040bd54 <stride_dequeue+0x2ab0>
80409aa8:	00098593          	mv	a1,s3
80409aac:	000a0513          	mv	a0,s4
80409ab0:	01012823          	sw	a6,16(sp)
80409ab4:	c5cff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409ab8:	fff00893          	li	a7,-1
80409abc:	01012803          	lw	a6,16(sp)
80409ac0:	01151463          	bne	a0,a7,80409ac8 <stride_dequeue+0x824>
80409ac4:	7a10106f          	j	8040ba64 <stride_dequeue+0x27c0>
80409ac8:	0049a783          	lw	a5,4(s3)
80409acc:	0089ae03          	lw	t3,8(s3)
80409ad0:	00f12823          	sw	a5,16(sp)
80409ad4:	060e0463          	beqz	t3,80409b3c <stride_dequeue+0x898>
80409ad8:	000e0593          	mv	a1,t3
80409adc:	000a0513          	mv	a0,s4
80409ae0:	01012c23          	sw	a6,24(sp)
80409ae4:	01c12a23          	sw	t3,20(sp)
80409ae8:	c28ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409aec:	fff00893          	li	a7,-1
80409af0:	01412e03          	lw	t3,20(sp)
80409af4:	01812803          	lw	a6,24(sp)
80409af8:	01151463          	bne	a0,a7,80409b00 <stride_dequeue+0x85c>
80409afc:	59c0206f          	j	8040c098 <stride_dequeue+0x2df4>
80409b00:	008e2583          	lw	a1,8(t3)
80409b04:	000a0513          	mv	a0,s4
80409b08:	004e2b03          	lw	s6,4(t3)
80409b0c:	01012c23          	sw	a6,24(sp)
80409b10:	01c12a23          	sw	t3,20(sp)
80409b14:	cb8ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409b18:	01412e03          	lw	t3,20(sp)
80409b1c:	01812803          	lw	a6,24(sp)
80409b20:	00ae2223          	sw	a0,4(t3)
80409b24:	016e2423          	sw	s6,8(t3)
80409b28:	00051463          	bnez	a0,80409b30 <stride_dequeue+0x88c>
80409b2c:	7d00206f          	j	8040c2fc <stride_dequeue+0x3058>
80409b30:	008c2b03          	lw	s6,8(s8)
80409b34:	01c52023          	sw	t3,0(a0)
80409b38:	000e0a13          	mv	s4,t3
80409b3c:	01012783          	lw	a5,16(sp)
80409b40:	0149a223          	sw	s4,4(s3)
80409b44:	00f9a423          	sw	a5,8(s3)
80409b48:	013a2023          	sw	s3,0(s4)
80409b4c:	00c12783          	lw	a5,12(sp)
80409b50:	01382223          	sw	s3,4(a6)
80409b54:	00080a13          	mv	s4,a6
80409b58:	00f82423          	sw	a5,8(a6)
80409b5c:	0109a023          	sw	a6,0(s3)
80409b60:	000b0993          	mv	s3,s6
80409b64:	00812783          	lw	a5,8(sp)
80409b68:	014ca223          	sw	s4,4(s9)
80409b6c:	00fca423          	sw	a5,8(s9)
80409b70:	019a2023          	sw	s9,0(s4)
80409b74:	00412783          	lw	a5,4(sp)
80409b78:	019da223          	sw	s9,4(s11)
80409b7c:	00fda423          	sw	a5,8(s11)
80409b80:	01bca023          	sw	s11,0(s9)
80409b84:	b41ff06f          	j	804096c4 <stride_dequeue+0x420>
80409b88:	004da783          	lw	a5,4(s11)
80409b8c:	008da603          	lw	a2,8(s11)
80409b90:	00f12023          	sw	a5,0(sp)
80409b94:	14060463          	beqz	a2,80409cdc <stride_dequeue+0xa38>
80409b98:	00060513          	mv	a0,a2
80409b9c:	000a0593          	mv	a1,s4
80409ba0:	00c12223          	sw	a2,4(sp)
80409ba4:	b6cff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409ba8:	fff00893          	li	a7,-1
80409bac:	00412603          	lw	a2,4(sp)
80409bb0:	111502e3          	beq	a0,a7,8040a4b4 <stride_dequeue+0x1210>
80409bb4:	004a2783          	lw	a5,4(s4)
80409bb8:	008a2803          	lw	a6,8(s4)
80409bbc:	00f12223          	sw	a5,4(sp)
80409bc0:	10080663          	beqz	a6,80409ccc <stride_dequeue+0xa28>
80409bc4:	00080593          	mv	a1,a6
80409bc8:	00060513          	mv	a0,a2
80409bcc:	01012623          	sw	a6,12(sp)
80409bd0:	00c12423          	sw	a2,8(sp)
80409bd4:	b3cff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409bd8:	fff00893          	li	a7,-1
80409bdc:	00812603          	lw	a2,8(sp)
80409be0:	00c12803          	lw	a6,12(sp)
80409be4:	01151463          	bne	a0,a7,80409bec <stride_dequeue+0x948>
80409be8:	5540106f          	j	8040b13c <stride_dequeue+0x1e98>
80409bec:	00482783          	lw	a5,4(a6)
80409bf0:	00882983          	lw	s3,8(a6)
80409bf4:	00f12423          	sw	a5,8(sp)
80409bf8:	00099463          	bnez	s3,80409c00 <stride_dequeue+0x95c>
80409bfc:	1980206f          	j	8040bd94 <stride_dequeue+0x2af0>
80409c00:	00060513          	mv	a0,a2
80409c04:	00098593          	mv	a1,s3
80409c08:	01012823          	sw	a6,16(sp)
80409c0c:	00c12623          	sw	a2,12(sp)
80409c10:	b00ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409c14:	fff00893          	li	a7,-1
80409c18:	00c12603          	lw	a2,12(sp)
80409c1c:	01012803          	lw	a6,16(sp)
80409c20:	01151463          	bne	a0,a7,80409c28 <stride_dequeue+0x984>
80409c24:	4290106f          	j	8040b84c <stride_dequeue+0x25a8>
80409c28:	0049a783          	lw	a5,4(s3)
80409c2c:	0089ae03          	lw	t3,8(s3)
80409c30:	00f12623          	sw	a5,12(sp)
80409c34:	060e0863          	beqz	t3,80409ca4 <stride_dequeue+0xa00>
80409c38:	000e0593          	mv	a1,t3
80409c3c:	00060513          	mv	a0,a2
80409c40:	01012c23          	sw	a6,24(sp)
80409c44:	01c12a23          	sw	t3,20(sp)
80409c48:	00c12823          	sw	a2,16(sp)
80409c4c:	ac4ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409c50:	01812803          	lw	a6,24(sp)
80409c54:	01412e03          	lw	t3,20(sp)
80409c58:	fff00893          	li	a7,-1
80409c5c:	01012a23          	sw	a6,20(sp)
80409c60:	01012603          	lw	a2,16(sp)
80409c64:	01151463          	bne	a0,a7,80409c6c <stride_dequeue+0x9c8>
80409c68:	3a00206f          	j	8040c008 <stride_dequeue+0x2d64>
80409c6c:	008e2583          	lw	a1,8(t3)
80409c70:	00060513          	mv	a0,a2
80409c74:	004e2b03          	lw	s6,4(t3)
80409c78:	01c12823          	sw	t3,16(sp)
80409c7c:	b50ff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409c80:	01012e03          	lw	t3,16(sp)
80409c84:	01412803          	lw	a6,20(sp)
80409c88:	00ae2223          	sw	a0,4(t3)
80409c8c:	016e2423          	sw	s6,8(t3)
80409c90:	00051463          	bnez	a0,80409c98 <stride_dequeue+0x9f4>
80409c94:	62c0206f          	j	8040c2c0 <stride_dequeue+0x301c>
80409c98:	008c2b03          	lw	s6,8(s8)
80409c9c:	01c52023          	sw	t3,0(a0)
80409ca0:	000e0613          	mv	a2,t3
80409ca4:	00c12783          	lw	a5,12(sp)
80409ca8:	00c9a223          	sw	a2,4(s3)
80409cac:	00f9a423          	sw	a5,8(s3)
80409cb0:	01362023          	sw	s3,0(a2)
80409cb4:	00812783          	lw	a5,8(sp)
80409cb8:	01382223          	sw	s3,4(a6)
80409cbc:	00080613          	mv	a2,a6
80409cc0:	00f82423          	sw	a5,8(a6)
80409cc4:	0109a023          	sw	a6,0(s3)
80409cc8:	000b0993          	mv	s3,s6
80409ccc:	00412783          	lw	a5,4(sp)
80409cd0:	00ca2223          	sw	a2,4(s4)
80409cd4:	00fa2423          	sw	a5,8(s4)
80409cd8:	01462023          	sw	s4,0(a2)
80409cdc:	00012783          	lw	a5,0(sp)
80409ce0:	014da223          	sw	s4,4(s11)
80409ce4:	00fda423          	sw	a5,8(s11)
80409ce8:	01ba2023          	sw	s11,0(s4)
80409cec:	000d8a13          	mv	s4,s11
80409cf0:	badff06f          	j	8040989c <stride_dequeue+0x5f8>
80409cf4:	00492783          	lw	a5,4(s2)
80409cf8:	00892883          	lw	a7,8(s2)
80409cfc:	00a12623          	sw	a0,12(sp)
80409d00:	00f12423          	sw	a5,8(sp)
80409d04:	0e088863          	beqz	a7,80409df4 <stride_dequeue+0xb50>
80409d08:	00088513          	mv	a0,a7
80409d0c:	000c8593          	mv	a1,s9
80409d10:	01112823          	sw	a7,16(sp)
80409d14:	9fcff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409d18:	00c12803          	lw	a6,12(sp)
80409d1c:	01012883          	lw	a7,16(sp)
80409d20:	2f050ce3          	beq	a0,a6,8040a818 <stride_dequeue+0x1574>
80409d24:	004ca783          	lw	a5,4(s9)
80409d28:	008ca303          	lw	t1,8(s9)
80409d2c:	01012823          	sw	a6,16(sp)
80409d30:	00f12623          	sw	a5,12(sp)
80409d34:	0a030863          	beqz	t1,80409de4 <stride_dequeue+0xb40>
80409d38:	00030593          	mv	a1,t1
80409d3c:	00088513          	mv	a0,a7
80409d40:	00612c23          	sw	t1,24(sp)
80409d44:	01112a23          	sw	a7,20(sp)
80409d48:	9c8ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409d4c:	01012803          	lw	a6,16(sp)
80409d50:	01412883          	lw	a7,20(sp)
80409d54:	01812303          	lw	t1,24(sp)
80409d58:	01051463          	bne	a0,a6,80409d60 <stride_dequeue+0xabc>
80409d5c:	6f00106f          	j	8040b44c <stride_dequeue+0x21a8>
80409d60:	00432783          	lw	a5,4(t1)
80409d64:	00832983          	lw	s3,8(t1)
80409d68:	01012a23          	sw	a6,20(sp)
80409d6c:	00f12823          	sw	a5,16(sp)
80409d70:	00099463          	bnez	s3,80409d78 <stride_dequeue+0xad4>
80409d74:	3e50106f          	j	8040b958 <stride_dequeue+0x26b4>
80409d78:	00088513          	mv	a0,a7
80409d7c:	00098593          	mv	a1,s3
80409d80:	00612e23          	sw	t1,28(sp)
80409d84:	01112c23          	sw	a7,24(sp)
80409d88:	988ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409d8c:	01412803          	lw	a6,20(sp)
80409d90:	01812883          	lw	a7,24(sp)
80409d94:	01c12303          	lw	t1,28(sp)
80409d98:	01051463          	bne	a0,a6,80409da0 <stride_dequeue+0xafc>
80409d9c:	6d90106f          	j	8040bc74 <stride_dequeue+0x29d0>
80409da0:	0089a583          	lw	a1,8(s3)
80409da4:	0049ab03          	lw	s6,4(s3)
80409da8:	00088513          	mv	a0,a7
80409dac:	00612a23          	sw	t1,20(sp)
80409db0:	a1cff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409db4:	00a9a223          	sw	a0,4(s3)
80409db8:	0169a423          	sw	s6,8(s3)
80409dbc:	01412303          	lw	t1,20(sp)
80409dc0:	00050463          	beqz	a0,80409dc8 <stride_dequeue+0xb24>
80409dc4:	01352023          	sw	s3,0(a0)
80409dc8:	008c2b03          	lw	s6,8(s8)
80409dcc:	01012783          	lw	a5,16(sp)
80409dd0:	01332223          	sw	s3,4(t1)
80409dd4:	00030893          	mv	a7,t1
80409dd8:	00f32423          	sw	a5,8(t1)
80409ddc:	0069a023          	sw	t1,0(s3)
80409de0:	000b0993          	mv	s3,s6
80409de4:	00c12783          	lw	a5,12(sp)
80409de8:	011ca223          	sw	a7,4(s9)
80409dec:	00fca423          	sw	a5,8(s9)
80409df0:	0198a023          	sw	s9,0(a7) # 2000 <_binary_bin_swap_img_size-0x6000>
80409df4:	00812783          	lw	a5,8(sp)
80409df8:	01992223          	sw	s9,4(s2)
80409dfc:	00f92423          	sw	a5,8(s2)
80409e00:	012ca023          	sw	s2,0(s9)
80409e04:	ea0ff06f          	j	804094a4 <stride_dequeue+0x200>
80409e08:	00492783          	lw	a5,4(s2)
80409e0c:	00892c83          	lw	s9,8(s2)
80409e10:	00f12223          	sw	a5,4(sp)
80409e14:	120c8463          	beqz	s9,80409f3c <stride_dequeue+0xc98>
80409e18:	000d8593          	mv	a1,s11
80409e1c:	000c8513          	mv	a0,s9
80409e20:	8f0ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409e24:	fff00893          	li	a7,-1
80409e28:	27150663          	beq	a0,a7,8040a094 <stride_dequeue+0xdf0>
80409e2c:	004da783          	lw	a5,4(s11)
80409e30:	008da803          	lw	a6,8(s11)
80409e34:	00f12423          	sw	a5,8(sp)
80409e38:	0e080a63          	beqz	a6,80409f2c <stride_dequeue+0xc88>
80409e3c:	00080593          	mv	a1,a6
80409e40:	000c8513          	mv	a0,s9
80409e44:	01012623          	sw	a6,12(sp)
80409e48:	8c8ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409e4c:	fff00893          	li	a7,-1
80409e50:	00c12803          	lw	a6,12(sp)
80409e54:	29150ee3          	beq	a0,a7,8040a8f0 <stride_dequeue+0x164c>
80409e58:	00482783          	lw	a5,4(a6)
80409e5c:	00882303          	lw	t1,8(a6)
80409e60:	00f12623          	sw	a5,12(sp)
80409e64:	0a030a63          	beqz	t1,80409f18 <stride_dequeue+0xc74>
80409e68:	00030593          	mv	a1,t1
80409e6c:	000c8513          	mv	a0,s9
80409e70:	01012a23          	sw	a6,20(sp)
80409e74:	00612823          	sw	t1,16(sp)
80409e78:	898ff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409e7c:	fff00893          	li	a7,-1
80409e80:	01012303          	lw	t1,16(sp)
80409e84:	01412803          	lw	a6,20(sp)
80409e88:	01151463          	bne	a0,a7,80409e90 <stride_dequeue+0xbec>
80409e8c:	4b80106f          	j	8040b344 <stride_dequeue+0x20a0>
80409e90:	00432783          	lw	a5,4(t1)
80409e94:	00832983          	lw	s3,8(t1)
80409e98:	00f12823          	sw	a5,16(sp)
80409e9c:	00099463          	bnez	s3,80409ea4 <stride_dequeue+0xc00>
80409ea0:	4c10106f          	j	8040bb60 <stride_dequeue+0x28bc>
80409ea4:	00098593          	mv	a1,s3
80409ea8:	000c8513          	mv	a0,s9
80409eac:	00612c23          	sw	t1,24(sp)
80409eb0:	01012a23          	sw	a6,20(sp)
80409eb4:	85cff0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409eb8:	fff00893          	li	a7,-1
80409ebc:	01412803          	lw	a6,20(sp)
80409ec0:	01812303          	lw	t1,24(sp)
80409ec4:	01151463          	bne	a0,a7,80409ecc <stride_dequeue+0xc28>
80409ec8:	5e90106f          	j	8040bcb0 <stride_dequeue+0x2a0c>
80409ecc:	0089a583          	lw	a1,8(s3)
80409ed0:	0049ab03          	lw	s6,4(s3)
80409ed4:	000c8513          	mv	a0,s9
80409ed8:	00612c23          	sw	t1,24(sp)
80409edc:	01012a23          	sw	a6,20(sp)
80409ee0:	8ecff0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
80409ee4:	00a9a223          	sw	a0,4(s3)
80409ee8:	0169a423          	sw	s6,8(s3)
80409eec:	01412803          	lw	a6,20(sp)
80409ef0:	01812303          	lw	t1,24(sp)
80409ef4:	00050463          	beqz	a0,80409efc <stride_dequeue+0xc58>
80409ef8:	01352023          	sw	s3,0(a0)
80409efc:	008c2b03          	lw	s6,8(s8)
80409f00:	01012783          	lw	a5,16(sp)
80409f04:	01332223          	sw	s3,4(t1)
80409f08:	00030c93          	mv	s9,t1
80409f0c:	00f32423          	sw	a5,8(t1)
80409f10:	0069a023          	sw	t1,0(s3)
80409f14:	000b0993          	mv	s3,s6
80409f18:	00c12783          	lw	a5,12(sp)
80409f1c:	01982223          	sw	s9,4(a6)
80409f20:	00f82423          	sw	a5,8(a6)
80409f24:	010ca023          	sw	a6,0(s9)
80409f28:	00080c93          	mv	s9,a6
80409f2c:	00812783          	lw	a5,8(sp)
80409f30:	019da223          	sw	s9,4(s11)
80409f34:	00fda423          	sw	a5,8(s11)
80409f38:	01bca023          	sw	s11,0(s9)
80409f3c:	00412783          	lw	a5,4(sp)
80409f40:	01b92223          	sw	s11,4(s2)
80409f44:	00f92423          	sw	a5,8(s2)
80409f48:	012da023          	sw	s2,0(s11)
80409f4c:	d6cff06f          	j	804094b8 <stride_dequeue+0x214>
80409f50:	004ca783          	lw	a5,4(s9)
80409f54:	008caa03          	lw	s4,8(s9)
80409f58:	00f12223          	sw	a5,4(sp)
80409f5c:	120a0063          	beqz	s4,8040a07c <stride_dequeue+0xdd8>
80409f60:	00040593          	mv	a1,s0
80409f64:	000a0513          	mv	a0,s4
80409f68:	fa9fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409f6c:	fff00893          	li	a7,-1
80409f70:	49150ee3          	beq	a0,a7,8040ac0c <stride_dequeue+0x1968>
80409f74:	00442783          	lw	a5,4(s0)
80409f78:	00842983          	lw	s3,8(s0)
80409f7c:	00f12423          	sw	a5,8(sp)
80409f80:	00099463          	bnez	s3,80409f88 <stride_dequeue+0xce4>
80409f84:	4710106f          	j	8040bbf4 <stride_dequeue+0x2950>
80409f88:	00098593          	mv	a1,s3
80409f8c:	000a0513          	mv	a0,s4
80409f90:	f81fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409f94:	fff00893          	li	a7,-1
80409f98:	01151463          	bne	a0,a7,80409fa0 <stride_dequeue+0xcfc>
80409f9c:	5dc0106f          	j	8040b578 <stride_dequeue+0x22d4>
80409fa0:	0049a783          	lw	a5,4(s3)
80409fa4:	0089a303          	lw	t1,8(s3)
80409fa8:	00f12623          	sw	a5,12(sp)
80409fac:	0a030663          	beqz	t1,8040a058 <stride_dequeue+0xdb4>
80409fb0:	00030593          	mv	a1,t1
80409fb4:	000a0513          	mv	a0,s4
80409fb8:	00612823          	sw	t1,16(sp)
80409fbc:	f55fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409fc0:	fff00893          	li	a7,-1
80409fc4:	01012303          	lw	t1,16(sp)
80409fc8:	01151463          	bne	a0,a7,80409fd0 <stride_dequeue+0xd2c>
80409fcc:	1cc0206f          	j	8040c198 <stride_dequeue+0x2ef4>
80409fd0:	00432783          	lw	a5,4(t1)
80409fd4:	00832e03          	lw	t3,8(t1)
80409fd8:	00f12823          	sw	a5,16(sp)
80409fdc:	060e0463          	beqz	t3,8040a044 <stride_dequeue+0xda0>
80409fe0:	000e0593          	mv	a1,t3
80409fe4:	000a0513          	mv	a0,s4
80409fe8:	00612c23          	sw	t1,24(sp)
80409fec:	01c12a23          	sw	t3,20(sp)
80409ff0:	f21fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
80409ff4:	fff00893          	li	a7,-1
80409ff8:	01412e03          	lw	t3,20(sp)
80409ffc:	01812303          	lw	t1,24(sp)
8040a000:	01151463          	bne	a0,a7,8040a008 <stride_dequeue+0xd64>
8040a004:	66c0206f          	j	8040c670 <stride_dequeue+0x33cc>
8040a008:	008e2583          	lw	a1,8(t3)
8040a00c:	000a0513          	mv	a0,s4
8040a010:	004e2b03          	lw	s6,4(t3)
8040a014:	00612c23          	sw	t1,24(sp)
8040a018:	01c12a23          	sw	t3,20(sp)
8040a01c:	fb1fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a020:	01412e03          	lw	t3,20(sp)
8040a024:	01812303          	lw	t1,24(sp)
8040a028:	00ae2223          	sw	a0,4(t3)
8040a02c:	016e2423          	sw	s6,8(t3)
8040a030:	00051463          	bnez	a0,8040a038 <stride_dequeue+0xd94>
8040a034:	1110206f          	j	8040c944 <stride_dequeue+0x36a0>
8040a038:	008c2b03          	lw	s6,8(s8)
8040a03c:	01c52023          	sw	t3,0(a0)
8040a040:	000e0a13          	mv	s4,t3
8040a044:	01012783          	lw	a5,16(sp)
8040a048:	01432223          	sw	s4,4(t1)
8040a04c:	00f32423          	sw	a5,8(t1)
8040a050:	006a2023          	sw	t1,0(s4)
8040a054:	00030a13          	mv	s4,t1
8040a058:	00c12783          	lw	a5,12(sp)
8040a05c:	0149a223          	sw	s4,4(s3)
8040a060:	00f9a423          	sw	a5,8(s3)
8040a064:	013a2023          	sw	s3,0(s4)
8040a068:	00812783          	lw	a5,8(sp)
8040a06c:	01342223          	sw	s3,4(s0)
8040a070:	00f42423          	sw	a5,8(s0)
8040a074:	0089a023          	sw	s0,0(s3)
8040a078:	000b0993          	mv	s3,s6
8040a07c:	00412783          	lw	a5,4(sp)
8040a080:	008ca223          	sw	s0,4(s9)
8040a084:	00fca423          	sw	a5,8(s9)
8040a088:	01942023          	sw	s9,0(s0)
8040a08c:	000c8413          	mv	s0,s9
8040a090:	999ff06f          	j	80409a28 <stride_dequeue+0x784>
8040a094:	004ca783          	lw	a5,4(s9)
8040a098:	008ca883          	lw	a7,8(s9)
8040a09c:	00a12623          	sw	a0,12(sp)
8040a0a0:	00f12423          	sw	a5,8(sp)
8040a0a4:	0e088663          	beqz	a7,8040a190 <stride_dequeue+0xeec>
8040a0a8:	00088513          	mv	a0,a7
8040a0ac:	000d8593          	mv	a1,s11
8040a0b0:	01112823          	sw	a7,16(sp)
8040a0b4:	e5dfe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a0b8:	00c12803          	lw	a6,12(sp)
8040a0bc:	01012883          	lw	a7,16(sp)
8040a0c0:	41050ae3          	beq	a0,a6,8040acd4 <stride_dequeue+0x1a30>
8040a0c4:	004da783          	lw	a5,4(s11)
8040a0c8:	008da983          	lw	s3,8(s11)
8040a0cc:	01012823          	sw	a6,16(sp)
8040a0d0:	00f12623          	sw	a5,12(sp)
8040a0d4:	00099463          	bnez	s3,8040a0dc <stride_dequeue+0xe38>
8040a0d8:	4b50106f          	j	8040bd8c <stride_dequeue+0x2ae8>
8040a0dc:	00088513          	mv	a0,a7
8040a0e0:	00098593          	mv	a1,s3
8040a0e4:	01112a23          	sw	a7,20(sp)
8040a0e8:	e29fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a0ec:	01012803          	lw	a6,16(sp)
8040a0f0:	01412883          	lw	a7,20(sp)
8040a0f4:	01051463          	bne	a0,a6,8040a0fc <stride_dequeue+0xe58>
8040a0f8:	64c0106f          	j	8040b744 <stride_dequeue+0x24a0>
8040a0fc:	0049a783          	lw	a5,4(s3)
8040a100:	0089ae03          	lw	t3,8(s3)
8040a104:	01012a23          	sw	a6,20(sp)
8040a108:	00f12823          	sw	a5,16(sp)
8040a10c:	060e0063          	beqz	t3,8040a16c <stride_dequeue+0xec8>
8040a110:	000e0593          	mv	a1,t3
8040a114:	00088513          	mv	a0,a7
8040a118:	01c12e23          	sw	t3,28(sp)
8040a11c:	01112c23          	sw	a7,24(sp)
8040a120:	df1fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a124:	01412803          	lw	a6,20(sp)
8040a128:	01812883          	lw	a7,24(sp)
8040a12c:	01c12e03          	lw	t3,28(sp)
8040a130:	01051463          	bne	a0,a6,8040a138 <stride_dequeue+0xe94>
8040a134:	0bc0206f          	j	8040c1f0 <stride_dequeue+0x2f4c>
8040a138:	008e2583          	lw	a1,8(t3)
8040a13c:	00088513          	mv	a0,a7
8040a140:	004e2b03          	lw	s6,4(t3)
8040a144:	01c12a23          	sw	t3,20(sp)
8040a148:	e85fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a14c:	01412e03          	lw	t3,20(sp)
8040a150:	00ae2223          	sw	a0,4(t3)
8040a154:	016e2423          	sw	s6,8(t3)
8040a158:	00051463          	bnez	a0,8040a160 <stride_dequeue+0xebc>
8040a15c:	2380206f          	j	8040c394 <stride_dequeue+0x30f0>
8040a160:	008c2b03          	lw	s6,8(s8)
8040a164:	01c52023          	sw	t3,0(a0)
8040a168:	000e0893          	mv	a7,t3
8040a16c:	01012783          	lw	a5,16(sp)
8040a170:	0119a223          	sw	a7,4(s3)
8040a174:	00f9a423          	sw	a5,8(s3)
8040a178:	0138a023          	sw	s3,0(a7)
8040a17c:	00c12783          	lw	a5,12(sp)
8040a180:	013da223          	sw	s3,4(s11)
8040a184:	00fda423          	sw	a5,8(s11)
8040a188:	01b9a023          	sw	s11,0(s3)
8040a18c:	000b0993          	mv	s3,s6
8040a190:	00812783          	lw	a5,8(sp)
8040a194:	01bca223          	sw	s11,4(s9)
8040a198:	00fca423          	sw	a5,8(s9)
8040a19c:	019da023          	sw	s9,0(s11)
8040a1a0:	000c8d93          	mv	s11,s9
8040a1a4:	d99ff06f          	j	80409f3c <stride_dequeue+0xc98>
8040a1a8:	004da783          	lw	a5,4(s11)
8040a1ac:	008da883          	lw	a7,8(s11)
8040a1b0:	00a12423          	sw	a0,8(sp)
8040a1b4:	00f12223          	sw	a5,4(sp)
8040a1b8:	10088663          	beqz	a7,8040a2c4 <stride_dequeue+0x1020>
8040a1bc:	00060593          	mv	a1,a2
8040a1c0:	00088513          	mv	a0,a7
8040a1c4:	00c12823          	sw	a2,16(sp)
8040a1c8:	01112623          	sw	a7,12(sp)
8040a1cc:	d45fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a1d0:	00812803          	lw	a6,8(sp)
8040a1d4:	00c12883          	lw	a7,12(sp)
8040a1d8:	01012603          	lw	a2,16(sp)
8040a1dc:	670508e3          	beq	a0,a6,8040b04c <stride_dequeue+0x1da8>
8040a1e0:	00462783          	lw	a5,4(a2)
8040a1e4:	00862983          	lw	s3,8(a2)
8040a1e8:	01012623          	sw	a6,12(sp)
8040a1ec:	00f12423          	sw	a5,8(sp)
8040a1f0:	00099463          	bnez	s3,8040a1f8 <stride_dequeue+0xf54>
8040a1f4:	3910106f          	j	8040bd84 <stride_dequeue+0x2ae0>
8040a1f8:	00088513          	mv	a0,a7
8040a1fc:	00098593          	mv	a1,s3
8040a200:	00c12a23          	sw	a2,20(sp)
8040a204:	01112823          	sw	a7,16(sp)
8040a208:	d09fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a20c:	00c12803          	lw	a6,12(sp)
8040a210:	01012883          	lw	a7,16(sp)
8040a214:	01412603          	lw	a2,20(sp)
8040a218:	01051463          	bne	a0,a6,8040a220 <stride_dequeue+0xf7c>
8040a21c:	5a40106f          	j	8040b7c0 <stride_dequeue+0x251c>
8040a220:	0049a783          	lw	a5,4(s3)
8040a224:	0089ae03          	lw	t3,8(s3)
8040a228:	01012823          	sw	a6,16(sp)
8040a22c:	00f12623          	sw	a5,12(sp)
8040a230:	060e0863          	beqz	t3,8040a2a0 <stride_dequeue+0xffc>
8040a234:	000e0593          	mv	a1,t3
8040a238:	00088513          	mv	a0,a7
8040a23c:	00c12e23          	sw	a2,28(sp)
8040a240:	01c12c23          	sw	t3,24(sp)
8040a244:	01112a23          	sw	a7,20(sp)
8040a248:	cc9fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a24c:	01c12603          	lw	a2,28(sp)
8040a250:	01012803          	lw	a6,16(sp)
8040a254:	01412883          	lw	a7,20(sp)
8040a258:	00c12a23          	sw	a2,20(sp)
8040a25c:	01812e03          	lw	t3,24(sp)
8040a260:	01051463          	bne	a0,a6,8040a268 <stride_dequeue+0xfc4>
8040a264:	5210106f          	j	8040bf84 <stride_dequeue+0x2ce0>
8040a268:	008e2583          	lw	a1,8(t3)
8040a26c:	00088513          	mv	a0,a7
8040a270:	004e2b03          	lw	s6,4(t3)
8040a274:	01c12823          	sw	t3,16(sp)
8040a278:	d55fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a27c:	01012e03          	lw	t3,16(sp)
8040a280:	01412603          	lw	a2,20(sp)
8040a284:	00ae2223          	sw	a0,4(t3)
8040a288:	016e2423          	sw	s6,8(t3)
8040a28c:	00051463          	bnez	a0,8040a294 <stride_dequeue+0xff0>
8040a290:	1280206f          	j	8040c3b8 <stride_dequeue+0x3114>
8040a294:	008c2b03          	lw	s6,8(s8)
8040a298:	01c52023          	sw	t3,0(a0)
8040a29c:	000e0893          	mv	a7,t3
8040a2a0:	00c12783          	lw	a5,12(sp)
8040a2a4:	0119a223          	sw	a7,4(s3)
8040a2a8:	00f9a423          	sw	a5,8(s3)
8040a2ac:	0138a023          	sw	s3,0(a7)
8040a2b0:	00812783          	lw	a5,8(sp)
8040a2b4:	01362223          	sw	s3,4(a2)
8040a2b8:	00f62423          	sw	a5,8(a2)
8040a2bc:	00c9a023          	sw	a2,0(s3)
8040a2c0:	000b0993          	mv	s3,s6
8040a2c4:	00412783          	lw	a5,4(sp)
8040a2c8:	00cda223          	sw	a2,4(s11)
8040a2cc:	00fda423          	sw	a5,8(s11)
8040a2d0:	01b62023          	sw	s11,0(a2)
8040a2d4:	db8ff06f          	j	8040988c <stride_dequeue+0x5e8>
8040a2d8:	004da783          	lw	a5,4(s11)
8040a2dc:	008da883          	lw	a7,8(s11)
8040a2e0:	00a12623          	sw	a0,12(sp)
8040a2e4:	00f12423          	sw	a5,8(sp)
8040a2e8:	0e088663          	beqz	a7,8040a3d4 <stride_dequeue+0x1130>
8040a2ec:	00088513          	mv	a0,a7
8040a2f0:	000a0593          	mv	a1,s4
8040a2f4:	01112823          	sw	a7,16(sp)
8040a2f8:	c19fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a2fc:	00c12803          	lw	a6,12(sp)
8040a300:	01012883          	lw	a7,16(sp)
8040a304:	2b0508e3          	beq	a0,a6,8040adb4 <stride_dequeue+0x1b10>
8040a308:	004a2783          	lw	a5,4(s4)
8040a30c:	008a2983          	lw	s3,8(s4)
8040a310:	01012823          	sw	a6,16(sp)
8040a314:	00f12623          	sw	a5,12(sp)
8040a318:	00099463          	bnez	s3,8040a320 <stride_dequeue+0x107c>
8040a31c:	2810106f          	j	8040bd9c <stride_dequeue+0x2af8>
8040a320:	00088513          	mv	a0,a7
8040a324:	00098593          	mv	a1,s3
8040a328:	01112a23          	sw	a7,20(sp)
8040a32c:	be5fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a330:	01012803          	lw	a6,16(sp)
8040a334:	01412883          	lw	a7,20(sp)
8040a338:	01051463          	bne	a0,a6,8040a340 <stride_dequeue+0x109c>
8040a33c:	38c0106f          	j	8040b6c8 <stride_dequeue+0x2424>
8040a340:	0049a783          	lw	a5,4(s3)
8040a344:	0089ae03          	lw	t3,8(s3)
8040a348:	01012a23          	sw	a6,20(sp)
8040a34c:	00f12823          	sw	a5,16(sp)
8040a350:	060e0063          	beqz	t3,8040a3b0 <stride_dequeue+0x110c>
8040a354:	000e0593          	mv	a1,t3
8040a358:	00088513          	mv	a0,a7
8040a35c:	01c12e23          	sw	t3,28(sp)
8040a360:	01112c23          	sw	a7,24(sp)
8040a364:	badfe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a368:	01412803          	lw	a6,20(sp)
8040a36c:	01812883          	lw	a7,24(sp)
8040a370:	01c12e03          	lw	t3,28(sp)
8040a374:	01051463          	bne	a0,a6,8040a37c <stride_dequeue+0x10d8>
8040a378:	2890106f          	j	8040be00 <stride_dequeue+0x2b5c>
8040a37c:	008e2583          	lw	a1,8(t3)
8040a380:	00088513          	mv	a0,a7
8040a384:	004e2b03          	lw	s6,4(t3)
8040a388:	01c12a23          	sw	t3,20(sp)
8040a38c:	c41fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a390:	01412e03          	lw	t3,20(sp)
8040a394:	00ae2223          	sw	a0,4(t3)
8040a398:	016e2423          	sw	s6,8(t3)
8040a39c:	00051463          	bnez	a0,8040a3a4 <stride_dequeue+0x1100>
8040a3a0:	7b50106f          	j	8040c354 <stride_dequeue+0x30b0>
8040a3a4:	008c2b03          	lw	s6,8(s8)
8040a3a8:	01c52023          	sw	t3,0(a0)
8040a3ac:	000e0893          	mv	a7,t3
8040a3b0:	01012783          	lw	a5,16(sp)
8040a3b4:	0119a223          	sw	a7,4(s3)
8040a3b8:	00f9a423          	sw	a5,8(s3)
8040a3bc:	0138a023          	sw	s3,0(a7)
8040a3c0:	00c12783          	lw	a5,12(sp)
8040a3c4:	013a2223          	sw	s3,4(s4)
8040a3c8:	00fa2423          	sw	a5,8(s4)
8040a3cc:	0149a023          	sw	s4,0(s3)
8040a3d0:	000b0993          	mv	s3,s6
8040a3d4:	00812783          	lw	a5,8(sp)
8040a3d8:	014da223          	sw	s4,4(s11)
8040a3dc:	00fda423          	sw	a5,8(s11)
8040a3e0:	01ba2023          	sw	s11,0(s4)
8040a3e4:	accff06f          	j	804096b0 <stride_dequeue+0x40c>
8040a3e8:	00492783          	lw	a5,4(s2)
8040a3ec:	00892883          	lw	a7,8(s2)
8040a3f0:	00a12823          	sw	a0,16(sp)
8040a3f4:	00f12623          	sw	a5,12(sp)
8040a3f8:	0a088463          	beqz	a7,8040a4a0 <stride_dequeue+0x11fc>
8040a3fc:	00080593          	mv	a1,a6
8040a400:	00088513          	mv	a0,a7
8040a404:	01012c23          	sw	a6,24(sp)
8040a408:	01112a23          	sw	a7,20(sp)
8040a40c:	b05fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a410:	01012303          	lw	t1,16(sp)
8040a414:	01412883          	lw	a7,20(sp)
8040a418:	01812803          	lw	a6,24(sp)
8040a41c:	606508e3          	beq	a0,t1,8040b22c <stride_dequeue+0x1f88>
8040a420:	00482783          	lw	a5,4(a6)
8040a424:	00882983          	lw	s3,8(a6)
8040a428:	00612a23          	sw	t1,20(sp)
8040a42c:	00f12823          	sw	a5,16(sp)
8040a430:	00099463          	bnez	s3,8040a438 <stride_dequeue+0x1194>
8040a434:	28c0106f          	j	8040b6c0 <stride_dequeue+0x241c>
8040a438:	00088513          	mv	a0,a7
8040a43c:	00098593          	mv	a1,s3
8040a440:	01012e23          	sw	a6,28(sp)
8040a444:	01112c23          	sw	a7,24(sp)
8040a448:	ac9fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a44c:	01412303          	lw	t1,20(sp)
8040a450:	01812883          	lw	a7,24(sp)
8040a454:	01c12803          	lw	a6,28(sp)
8040a458:	00651463          	bne	a0,t1,8040a460 <stride_dequeue+0x11bc>
8040a45c:	0bd0106f          	j	8040bd18 <stride_dequeue+0x2a74>
8040a460:	0089a583          	lw	a1,8(s3)
8040a464:	0049ab03          	lw	s6,4(s3)
8040a468:	00088513          	mv	a0,a7
8040a46c:	01012a23          	sw	a6,20(sp)
8040a470:	b5dfe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a474:	00a9a223          	sw	a0,4(s3)
8040a478:	0169a423          	sw	s6,8(s3)
8040a47c:	01412803          	lw	a6,20(sp)
8040a480:	00050463          	beqz	a0,8040a488 <stride_dequeue+0x11e4>
8040a484:	01352023          	sw	s3,0(a0)
8040a488:	008c2b03          	lw	s6,8(s8)
8040a48c:	01012783          	lw	a5,16(sp)
8040a490:	01382223          	sw	s3,4(a6)
8040a494:	00f82423          	sw	a5,8(a6)
8040a498:	0109a023          	sw	a6,0(s3)
8040a49c:	000b0993          	mv	s3,s6
8040a4a0:	00c12783          	lw	a5,12(sp)
8040a4a4:	01092223          	sw	a6,4(s2)
8040a4a8:	00f92423          	sw	a5,8(s2)
8040a4ac:	01282023          	sw	s2,0(a6)
8040a4b0:	fe1fe06f          	j	80409490 <stride_dequeue+0x1ec>
8040a4b4:	00462783          	lw	a5,4(a2)
8040a4b8:	00862983          	lw	s3,8(a2)
8040a4bc:	00a12423          	sw	a0,8(sp)
8040a4c0:	00f12223          	sw	a5,4(sp)
8040a4c4:	10098663          	beqz	s3,8040a5d0 <stride_dequeue+0x132c>
8040a4c8:	000a0593          	mv	a1,s4
8040a4cc:	00098513          	mv	a0,s3
8040a4d0:	00c12623          	sw	a2,12(sp)
8040a4d4:	a3dfe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a4d8:	00812303          	lw	t1,8(sp)
8040a4dc:	00c12603          	lw	a2,12(sp)
8040a4e0:	00651463          	bne	a0,t1,8040a4e8 <stride_dequeue+0x1244>
8040a4e4:	0180106f          	j	8040b4fc <stride_dequeue+0x2258>
8040a4e8:	004a2783          	lw	a5,4(s4)
8040a4ec:	008a2883          	lw	a7,8(s4)
8040a4f0:	00612623          	sw	t1,12(sp)
8040a4f4:	00f12423          	sw	a5,8(sp)
8040a4f8:	0c088463          	beqz	a7,8040a5c0 <stride_dequeue+0x131c>
8040a4fc:	00088593          	mv	a1,a7
8040a500:	00098513          	mv	a0,s3
8040a504:	00c12a23          	sw	a2,20(sp)
8040a508:	01112823          	sw	a7,16(sp)
8040a50c:	a05fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a510:	00c12303          	lw	t1,12(sp)
8040a514:	01012883          	lw	a7,16(sp)
8040a518:	01412603          	lw	a2,20(sp)
8040a51c:	00651463          	bne	a0,t1,8040a524 <stride_dequeue+0x1280>
8040a520:	4a10106f          	j	8040c1c0 <stride_dequeue+0x2f1c>
8040a524:	0048a783          	lw	a5,4(a7)
8040a528:	0088ae03          	lw	t3,8(a7)
8040a52c:	00612e23          	sw	t1,28(sp)
8040a530:	00f12623          	sw	a5,12(sp)
8040a534:	060e0c63          	beqz	t3,8040a5ac <stride_dequeue+0x1308>
8040a538:	000e0593          	mv	a1,t3
8040a53c:	00098513          	mv	a0,s3
8040a540:	01112c23          	sw	a7,24(sp)
8040a544:	00c12a23          	sw	a2,20(sp)
8040a548:	01c12823          	sw	t3,16(sp)
8040a54c:	9c5fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a550:	01c12303          	lw	t1,28(sp)
8040a554:	01012e03          	lw	t3,16(sp)
8040a558:	01412603          	lw	a2,20(sp)
8040a55c:	01812883          	lw	a7,24(sp)
8040a560:	00651463          	bne	a0,t1,8040a568 <stride_dequeue+0x12c4>
8040a564:	7d50106f          	j	8040c538 <stride_dequeue+0x3294>
8040a568:	008e2583          	lw	a1,8(t3)
8040a56c:	00098513          	mv	a0,s3
8040a570:	004e2b03          	lw	s6,4(t3)
8040a574:	01112c23          	sw	a7,24(sp)
8040a578:	00c12a23          	sw	a2,20(sp)
8040a57c:	01c12823          	sw	t3,16(sp)
8040a580:	a4dfe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a584:	01012e03          	lw	t3,16(sp)
8040a588:	01412603          	lw	a2,20(sp)
8040a58c:	01812883          	lw	a7,24(sp)
8040a590:	00ae2223          	sw	a0,4(t3)
8040a594:	016e2423          	sw	s6,8(t3)
8040a598:	00051463          	bnez	a0,8040a5a0 <stride_dequeue+0x12fc>
8040a59c:	2e80206f          	j	8040c884 <stride_dequeue+0x35e0>
8040a5a0:	008c2b03          	lw	s6,8(s8)
8040a5a4:	01c52023          	sw	t3,0(a0)
8040a5a8:	000e0993          	mv	s3,t3
8040a5ac:	00c12783          	lw	a5,12(sp)
8040a5b0:	0138a223          	sw	s3,4(a7)
8040a5b4:	00f8a423          	sw	a5,8(a7)
8040a5b8:	0119a023          	sw	a7,0(s3)
8040a5bc:	00088993          	mv	s3,a7
8040a5c0:	00812783          	lw	a5,8(sp)
8040a5c4:	013a2223          	sw	s3,4(s4)
8040a5c8:	00fa2423          	sw	a5,8(s4)
8040a5cc:	0149a023          	sw	s4,0(s3)
8040a5d0:	00412783          	lw	a5,4(sp)
8040a5d4:	01462223          	sw	s4,4(a2)
8040a5d8:	000b0993          	mv	s3,s6
8040a5dc:	00f62423          	sw	a5,8(a2)
8040a5e0:	00ca2023          	sw	a2,0(s4)
8040a5e4:	00060a13          	mv	s4,a2
8040a5e8:	ef4ff06f          	j	80409cdc <stride_dequeue+0xa38>
8040a5ec:	004ca783          	lw	a5,4(s9)
8040a5f0:	008ca983          	lw	s3,8(s9)
8040a5f4:	00a12623          	sw	a0,12(sp)
8040a5f8:	00f12423          	sw	a5,8(sp)
8040a5fc:	0e098663          	beqz	s3,8040a6e8 <stride_dequeue+0x1444>
8040a600:	000a0593          	mv	a1,s4
8040a604:	00098513          	mv	a0,s3
8040a608:	909fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a60c:	00c12303          	lw	t1,12(sp)
8040a610:	00651463          	bne	a0,t1,8040a618 <stride_dequeue+0x1374>
8040a614:	7d10006f          	j	8040b5e4 <stride_dequeue+0x2340>
8040a618:	004a2783          	lw	a5,4(s4)
8040a61c:	008a2883          	lw	a7,8(s4)
8040a620:	00612823          	sw	t1,16(sp)
8040a624:	00f12623          	sw	a5,12(sp)
8040a628:	0a088863          	beqz	a7,8040a6d8 <stride_dequeue+0x1434>
8040a62c:	00088593          	mv	a1,a7
8040a630:	00098513          	mv	a0,s3
8040a634:	01112a23          	sw	a7,20(sp)
8040a638:	8d9fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a63c:	01012303          	lw	t1,16(sp)
8040a640:	01412883          	lw	a7,20(sp)
8040a644:	00651463          	bne	a0,t1,8040a64c <stride_dequeue+0x13a8>
8040a648:	1990106f          	j	8040bfe0 <stride_dequeue+0x2d3c>
8040a64c:	0048a783          	lw	a5,4(a7)
8040a650:	0088ae03          	lw	t3,8(a7)
8040a654:	00612e23          	sw	t1,28(sp)
8040a658:	00f12823          	sw	a5,16(sp)
8040a65c:	060e0463          	beqz	t3,8040a6c4 <stride_dequeue+0x1420>
8040a660:	000e0593          	mv	a1,t3
8040a664:	00098513          	mv	a0,s3
8040a668:	01112c23          	sw	a7,24(sp)
8040a66c:	01c12a23          	sw	t3,20(sp)
8040a670:	8a1fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a674:	01c12303          	lw	t1,28(sp)
8040a678:	01412e03          	lw	t3,20(sp)
8040a67c:	01812883          	lw	a7,24(sp)
8040a680:	00651463          	bne	a0,t1,8040a688 <stride_dequeue+0x13e4>
8040a684:	07c0206f          	j	8040c700 <stride_dequeue+0x345c>
8040a688:	008e2583          	lw	a1,8(t3)
8040a68c:	00098513          	mv	a0,s3
8040a690:	004e2b03          	lw	s6,4(t3)
8040a694:	01112c23          	sw	a7,24(sp)
8040a698:	01c12a23          	sw	t3,20(sp)
8040a69c:	931fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a6a0:	01412e03          	lw	t3,20(sp)
8040a6a4:	01812883          	lw	a7,24(sp)
8040a6a8:	00ae2223          	sw	a0,4(t3)
8040a6ac:	016e2423          	sw	s6,8(t3)
8040a6b0:	00051463          	bnez	a0,8040a6b8 <stride_dequeue+0x1414>
8040a6b4:	2780206f          	j	8040c92c <stride_dequeue+0x3688>
8040a6b8:	008c2b03          	lw	s6,8(s8)
8040a6bc:	01c52023          	sw	t3,0(a0)
8040a6c0:	000e0993          	mv	s3,t3
8040a6c4:	01012783          	lw	a5,16(sp)
8040a6c8:	0138a223          	sw	s3,4(a7)
8040a6cc:	00f8a423          	sw	a5,8(a7)
8040a6d0:	0119a023          	sw	a7,0(s3)
8040a6d4:	00088993          	mv	s3,a7
8040a6d8:	00c12783          	lw	a5,12(sp)
8040a6dc:	013a2223          	sw	s3,4(s4)
8040a6e0:	00fa2423          	sw	a5,8(s4)
8040a6e4:	0149a023          	sw	s4,0(s3)
8040a6e8:	00812783          	lw	a5,8(sp)
8040a6ec:	014ca223          	sw	s4,4(s9)
8040a6f0:	000b0993          	mv	s3,s6
8040a6f4:	00fca423          	sw	a5,8(s9)
8040a6f8:	019a2023          	sw	s9,0(s4)
8040a6fc:	b1cff06f          	j	80409a18 <stride_dequeue+0x774>
8040a700:	004a2783          	lw	a5,4(s4)
8040a704:	008a2983          	lw	s3,8(s4)
8040a708:	00a12623          	sw	a0,12(sp)
8040a70c:	00f12423          	sw	a5,8(sp)
8040a710:	0e098663          	beqz	s3,8040a7fc <stride_dequeue+0x1558>
8040a714:	000c8593          	mv	a1,s9
8040a718:	00098513          	mv	a0,s3
8040a71c:	ff4fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a720:	00c12303          	lw	t1,12(sp)
8040a724:	00651463          	bne	a0,t1,8040a72c <stride_dequeue+0x1488>
8040a728:	7290006f          	j	8040b650 <stride_dequeue+0x23ac>
8040a72c:	004ca783          	lw	a5,4(s9)
8040a730:	008ca883          	lw	a7,8(s9)
8040a734:	00612823          	sw	t1,16(sp)
8040a738:	00f12623          	sw	a5,12(sp)
8040a73c:	0a088863          	beqz	a7,8040a7ec <stride_dequeue+0x1548>
8040a740:	00088593          	mv	a1,a7
8040a744:	00098513          	mv	a0,s3
8040a748:	01112a23          	sw	a7,20(sp)
8040a74c:	fc4fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a750:	01012303          	lw	t1,16(sp)
8040a754:	01412883          	lw	a7,20(sp)
8040a758:	00651463          	bne	a0,t1,8040a760 <stride_dequeue+0x14bc>
8040a75c:	05d0106f          	j	8040bfb8 <stride_dequeue+0x2d14>
8040a760:	0048a783          	lw	a5,4(a7)
8040a764:	0088ae03          	lw	t3,8(a7)
8040a768:	00612e23          	sw	t1,28(sp)
8040a76c:	00f12823          	sw	a5,16(sp)
8040a770:	060e0463          	beqz	t3,8040a7d8 <stride_dequeue+0x1534>
8040a774:	000e0593          	mv	a1,t3
8040a778:	00098513          	mv	a0,s3
8040a77c:	01112c23          	sw	a7,24(sp)
8040a780:	01c12a23          	sw	t3,20(sp)
8040a784:	f8cfe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a788:	01c12303          	lw	t1,28(sp)
8040a78c:	01412e03          	lw	t3,20(sp)
8040a790:	01812883          	lw	a7,24(sp)
8040a794:	00651463          	bne	a0,t1,8040a79c <stride_dequeue+0x14f8>
8040a798:	0040206f          	j	8040c79c <stride_dequeue+0x34f8>
8040a79c:	008e2583          	lw	a1,8(t3)
8040a7a0:	00098513          	mv	a0,s3
8040a7a4:	004e2b03          	lw	s6,4(t3)
8040a7a8:	01112c23          	sw	a7,24(sp)
8040a7ac:	01c12a23          	sw	t3,20(sp)
8040a7b0:	81dfe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a7b4:	01412e03          	lw	t3,20(sp)
8040a7b8:	01812883          	lw	a7,24(sp)
8040a7bc:	00ae2223          	sw	a0,4(t3)
8040a7c0:	016e2423          	sw	s6,8(t3)
8040a7c4:	00051463          	bnez	a0,8040a7cc <stride_dequeue+0x1528>
8040a7c8:	11c0206f          	j	8040c8e4 <stride_dequeue+0x3640>
8040a7cc:	008c2b03          	lw	s6,8(s8)
8040a7d0:	01c52023          	sw	t3,0(a0)
8040a7d4:	000e0993          	mv	s3,t3
8040a7d8:	01012783          	lw	a5,16(sp)
8040a7dc:	0138a223          	sw	s3,4(a7)
8040a7e0:	00f8a423          	sw	a5,8(a7)
8040a7e4:	0119a023          	sw	a7,0(s3)
8040a7e8:	00088993          	mv	s3,a7
8040a7ec:	00c12783          	lw	a5,12(sp)
8040a7f0:	013ca223          	sw	s3,4(s9)
8040a7f4:	00fca423          	sw	a5,8(s9)
8040a7f8:	0199a023          	sw	s9,0(s3)
8040a7fc:	00812783          	lw	a5,8(sp)
8040a800:	019a2223          	sw	s9,4(s4)
8040a804:	000b0993          	mv	s3,s6
8040a808:	00fa2423          	sw	a5,8(s4)
8040a80c:	014ca023          	sw	s4,0(s9)
8040a810:	000a0c93          	mv	s9,s4
8040a814:	b60ff06f          	j	80409b74 <stride_dequeue+0x8d0>
8040a818:	0048a783          	lw	a5,4(a7)
8040a81c:	0088a983          	lw	s3,8(a7)
8040a820:	00a12823          	sw	a0,16(sp)
8040a824:	00f12623          	sw	a5,12(sp)
8040a828:	0a098663          	beqz	s3,8040a8d4 <stride_dequeue+0x1630>
8040a82c:	000c8593          	mv	a1,s9
8040a830:	00098513          	mv	a0,s3
8040a834:	01112a23          	sw	a7,20(sp)
8040a838:	ed8fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a83c:	01012303          	lw	t1,16(sp)
8040a840:	01412883          	lw	a7,20(sp)
8040a844:	00651463          	bne	a0,t1,8040a84c <stride_dequeue+0x15a8>
8040a848:	2980106f          	j	8040bae0 <stride_dequeue+0x283c>
8040a84c:	004ca783          	lw	a5,4(s9)
8040a850:	008cae03          	lw	t3,8(s9)
8040a854:	00612a23          	sw	t1,20(sp)
8040a858:	00f12823          	sw	a5,16(sp)
8040a85c:	060e0463          	beqz	t3,8040a8c4 <stride_dequeue+0x1620>
8040a860:	000e0593          	mv	a1,t3
8040a864:	00098513          	mv	a0,s3
8040a868:	01112e23          	sw	a7,28(sp)
8040a86c:	01c12c23          	sw	t3,24(sp)
8040a870:	ea0fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a874:	01412303          	lw	t1,20(sp)
8040a878:	01812e03          	lw	t3,24(sp)
8040a87c:	01c12883          	lw	a7,28(sp)
8040a880:	00651463          	bne	a0,t1,8040a888 <stride_dequeue+0x15e4>
8040a884:	0e50106f          	j	8040c168 <stride_dequeue+0x2ec4>
8040a888:	008e2583          	lw	a1,8(t3)
8040a88c:	00098513          	mv	a0,s3
8040a890:	004e2b03          	lw	s6,4(t3)
8040a894:	01112c23          	sw	a7,24(sp)
8040a898:	01c12a23          	sw	t3,20(sp)
8040a89c:	f30fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a8a0:	01412e03          	lw	t3,20(sp)
8040a8a4:	01812883          	lw	a7,24(sp)
8040a8a8:	00ae2223          	sw	a0,4(t3)
8040a8ac:	016e2423          	sw	s6,8(t3)
8040a8b0:	00051463          	bnez	a0,8040a8b8 <stride_dequeue+0x1614>
8040a8b4:	2ed0106f          	j	8040c3a0 <stride_dequeue+0x30fc>
8040a8b8:	008c2b03          	lw	s6,8(s8)
8040a8bc:	01c52023          	sw	t3,0(a0)
8040a8c0:	000e0993          	mv	s3,t3
8040a8c4:	01012783          	lw	a5,16(sp)
8040a8c8:	013ca223          	sw	s3,4(s9)
8040a8cc:	00fca423          	sw	a5,8(s9)
8040a8d0:	0199a023          	sw	s9,0(s3)
8040a8d4:	00c12783          	lw	a5,12(sp)
8040a8d8:	0198a223          	sw	s9,4(a7)
8040a8dc:	000b0993          	mv	s3,s6
8040a8e0:	00f8a423          	sw	a5,8(a7)
8040a8e4:	011ca023          	sw	a7,0(s9)
8040a8e8:	00088c93          	mv	s9,a7
8040a8ec:	d08ff06f          	j	80409df4 <stride_dequeue+0xb50>
8040a8f0:	004ca783          	lw	a5,4(s9)
8040a8f4:	008ca983          	lw	s3,8(s9)
8040a8f8:	00a12823          	sw	a0,16(sp)
8040a8fc:	00f12623          	sw	a5,12(sp)
8040a900:	0a098663          	beqz	s3,8040a9ac <stride_dequeue+0x1708>
8040a904:	00080593          	mv	a1,a6
8040a908:	00098513          	mv	a0,s3
8040a90c:	01012a23          	sw	a6,20(sp)
8040a910:	e00fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a914:	01012303          	lw	t1,16(sp)
8040a918:	01412803          	lw	a6,20(sp)
8040a91c:	00651463          	bne	a0,t1,8040a924 <stride_dequeue+0x1680>
8040a920:	7b90006f          	j	8040b8d8 <stride_dequeue+0x2634>
8040a924:	00482783          	lw	a5,4(a6)
8040a928:	00882e03          	lw	t3,8(a6)
8040a92c:	00612a23          	sw	t1,20(sp)
8040a930:	00f12823          	sw	a5,16(sp)
8040a934:	060e0463          	beqz	t3,8040a99c <stride_dequeue+0x16f8>
8040a938:	000e0593          	mv	a1,t3
8040a93c:	00098513          	mv	a0,s3
8040a940:	01012e23          	sw	a6,28(sp)
8040a944:	01c12c23          	sw	t3,24(sp)
8040a948:	dc8fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a94c:	01412303          	lw	t1,20(sp)
8040a950:	01812e03          	lw	t3,24(sp)
8040a954:	01c12803          	lw	a6,28(sp)
8040a958:	00651463          	bne	a0,t1,8040a960 <stride_dequeue+0x16bc>
8040a95c:	7a80106f          	j	8040c104 <stride_dequeue+0x2e60>
8040a960:	008e2583          	lw	a1,8(t3)
8040a964:	00098513          	mv	a0,s3
8040a968:	004e2b03          	lw	s6,4(t3)
8040a96c:	01012c23          	sw	a6,24(sp)
8040a970:	01c12a23          	sw	t3,20(sp)
8040a974:	e58fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040a978:	01412e03          	lw	t3,20(sp)
8040a97c:	01812803          	lw	a6,24(sp)
8040a980:	00ae2223          	sw	a0,4(t3)
8040a984:	016e2423          	sw	s6,8(t3)
8040a988:	00051463          	bnez	a0,8040a990 <stride_dequeue+0x16ec>
8040a98c:	1950106f          	j	8040c320 <stride_dequeue+0x307c>
8040a990:	008c2b03          	lw	s6,8(s8)
8040a994:	01c52023          	sw	t3,0(a0)
8040a998:	000e0993          	mv	s3,t3
8040a99c:	01012783          	lw	a5,16(sp)
8040a9a0:	01382223          	sw	s3,4(a6)
8040a9a4:	00f82423          	sw	a5,8(a6)
8040a9a8:	0109a023          	sw	a6,0(s3)
8040a9ac:	00c12783          	lw	a5,12(sp)
8040a9b0:	010ca223          	sw	a6,4(s9)
8040a9b4:	000b0993          	mv	s3,s6
8040a9b8:	00fca423          	sw	a5,8(s9)
8040a9bc:	01982023          	sw	s9,0(a6)
8040a9c0:	d6cff06f          	j	80409f2c <stride_dequeue+0xc88>
8040a9c4:	004da783          	lw	a5,4(s11)
8040a9c8:	008da983          	lw	s3,8(s11)
8040a9cc:	00a12823          	sw	a0,16(sp)
8040a9d0:	00f12623          	sw	a5,12(sp)
8040a9d4:	0a098663          	beqz	s3,8040aa80 <stride_dequeue+0x17dc>
8040a9d8:	00080593          	mv	a1,a6
8040a9dc:	00098513          	mv	a0,s3
8040a9e0:	01012a23          	sw	a6,20(sp)
8040a9e4:	d2cfe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040a9e8:	01012303          	lw	t1,16(sp)
8040a9ec:	01412803          	lw	a6,20(sp)
8040a9f0:	00651463          	bne	a0,t1,8040a9f8 <stride_dequeue+0x1754>
8040a9f4:	76d0006f          	j	8040b960 <stride_dequeue+0x26bc>
8040a9f8:	00482783          	lw	a5,4(a6)
8040a9fc:	00882e03          	lw	t3,8(a6)
8040aa00:	00612a23          	sw	t1,20(sp)
8040aa04:	00f12823          	sw	a5,16(sp)
8040aa08:	060e0463          	beqz	t3,8040aa70 <stride_dequeue+0x17cc>
8040aa0c:	000e0593          	mv	a1,t3
8040aa10:	00098513          	mv	a0,s3
8040aa14:	01012e23          	sw	a6,28(sp)
8040aa18:	01c12c23          	sw	t3,24(sp)
8040aa1c:	cf4fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040aa20:	01412303          	lw	t1,20(sp)
8040aa24:	01812e03          	lw	t3,24(sp)
8040aa28:	01c12803          	lw	a6,28(sp)
8040aa2c:	00651463          	bne	a0,t1,8040aa34 <stride_dequeue+0x1790>
8040aa30:	4f40106f          	j	8040bf24 <stride_dequeue+0x2c80>
8040aa34:	008e2583          	lw	a1,8(t3)
8040aa38:	00098513          	mv	a0,s3
8040aa3c:	004e2b03          	lw	s6,4(t3)
8040aa40:	01012c23          	sw	a6,24(sp)
8040aa44:	01c12a23          	sw	t3,20(sp)
8040aa48:	d84fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040aa4c:	01412e03          	lw	t3,20(sp)
8040aa50:	01812803          	lw	a6,24(sp)
8040aa54:	00ae2223          	sw	a0,4(t3)
8040aa58:	016e2423          	sw	s6,8(t3)
8040aa5c:	00051463          	bnez	a0,8040aa64 <stride_dequeue+0x17c0>
8040aa60:	0a90106f          	j	8040c308 <stride_dequeue+0x3064>
8040aa64:	008c2b03          	lw	s6,8(s8)
8040aa68:	01c52023          	sw	t3,0(a0)
8040aa6c:	000e0993          	mv	s3,t3
8040aa70:	01012783          	lw	a5,16(sp)
8040aa74:	01382223          	sw	s3,4(a6)
8040aa78:	00f82423          	sw	a5,8(a6)
8040aa7c:	0109a023          	sw	a6,0(s3)
8040aa80:	00c12783          	lw	a5,12(sp)
8040aa84:	010da223          	sw	a6,4(s11)
8040aa88:	000b0993          	mv	s3,s6
8040aa8c:	00fda423          	sw	a5,8(s11)
8040aa90:	01b82023          	sw	s11,0(a6)
8040aa94:	c09fe06f          	j	8040969c <stride_dequeue+0x3f8>
8040aa98:	004da783          	lw	a5,4(s11)
8040aa9c:	008da983          	lw	s3,8(s11)
8040aaa0:	00a12623          	sw	a0,12(sp)
8040aaa4:	00f12423          	sw	a5,8(sp)
8040aaa8:	0c098263          	beqz	s3,8040ab6c <stride_dequeue+0x18c8>
8040aaac:	00080593          	mv	a1,a6
8040aab0:	00098513          	mv	a0,s3
8040aab4:	00c12a23          	sw	a2,20(sp)
8040aab8:	01012823          	sw	a6,16(sp)
8040aabc:	c54fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040aac0:	00c12303          	lw	t1,12(sp)
8040aac4:	01012803          	lw	a6,16(sp)
8040aac8:	01412603          	lw	a2,20(sp)
8040aacc:	00651463          	bne	a0,t1,8040aad4 <stride_dequeue+0x1830>
8040aad0:	0980106f          	j	8040bb68 <stride_dequeue+0x28c4>
8040aad4:	00482783          	lw	a5,4(a6)
8040aad8:	00882e03          	lw	t3,8(a6)
8040aadc:	00612823          	sw	t1,16(sp)
8040aae0:	00f12623          	sw	a5,12(sp)
8040aae4:	060e0c63          	beqz	t3,8040ab5c <stride_dequeue+0x18b8>
8040aae8:	000e0593          	mv	a1,t3
8040aaec:	00098513          	mv	a0,s3
8040aaf0:	01012e23          	sw	a6,28(sp)
8040aaf4:	00c12c23          	sw	a2,24(sp)
8040aaf8:	01c12a23          	sw	t3,20(sp)
8040aafc:	c14fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040ab00:	01012303          	lw	t1,16(sp)
8040ab04:	01412e03          	lw	t3,20(sp)
8040ab08:	01812603          	lw	a2,24(sp)
8040ab0c:	01c12803          	lw	a6,28(sp)
8040ab10:	00651463          	bne	a0,t1,8040ab18 <stride_dequeue+0x1874>
8040ab14:	3b00106f          	j	8040bec4 <stride_dequeue+0x2c20>
8040ab18:	008e2583          	lw	a1,8(t3)
8040ab1c:	00098513          	mv	a0,s3
8040ab20:	004e2b03          	lw	s6,4(t3)
8040ab24:	01012c23          	sw	a6,24(sp)
8040ab28:	00c12a23          	sw	a2,20(sp)
8040ab2c:	01c12823          	sw	t3,16(sp)
8040ab30:	c9cfe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040ab34:	01012e03          	lw	t3,16(sp)
8040ab38:	01412603          	lw	a2,20(sp)
8040ab3c:	01812803          	lw	a6,24(sp)
8040ab40:	00ae2223          	sw	a0,4(t3)
8040ab44:	016e2423          	sw	s6,8(t3)
8040ab48:	00051463          	bnez	a0,8040ab50 <stride_dequeue+0x18ac>
8040ab4c:	0610106f          	j	8040c3ac <stride_dequeue+0x3108>
8040ab50:	008c2b03          	lw	s6,8(s8)
8040ab54:	01c52023          	sw	t3,0(a0)
8040ab58:	000e0993          	mv	s3,t3
8040ab5c:	00c12783          	lw	a5,12(sp)
8040ab60:	01382223          	sw	s3,4(a6)
8040ab64:	00f82423          	sw	a5,8(a6)
8040ab68:	0109a023          	sw	a6,0(s3)
8040ab6c:	00812783          	lw	a5,8(sp)
8040ab70:	010da223          	sw	a6,4(s11)
8040ab74:	000b0993          	mv	s3,s6
8040ab78:	00fda423          	sw	a5,8(s11)
8040ab7c:	01b82023          	sw	s11,0(a6)
8040ab80:	cf9fe06f          	j	80409878 <stride_dequeue+0x5d4>
8040ab84:	00492703          	lw	a4,4(s2)
8040ab88:	00892983          	lw	s3,8(s2)
8040ab8c:	00a12a23          	sw	a0,20(sp)
8040ab90:	00e12823          	sw	a4,16(sp)
8040ab94:	06098063          	beqz	s3,8040abf4 <stride_dequeue+0x1950>
8040ab98:	00078593          	mv	a1,a5
8040ab9c:	00098513          	mv	a0,s3
8040aba0:	01012e23          	sw	a6,28(sp)
8040aba4:	00f12c23          	sw	a5,24(sp)
8040aba8:	b68fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040abac:	01412e03          	lw	t3,20(sp)
8040abb0:	01812783          	lw	a5,24(sp)
8040abb4:	01c12803          	lw	a6,28(sp)
8040abb8:	01c51463          	bne	a0,t3,8040abc0 <stride_dequeue+0x191c>
8040abbc:	0840106f          	j	8040bc40 <stride_dequeue+0x299c>
8040abc0:	0087a583          	lw	a1,8(a5)
8040abc4:	00098513          	mv	a0,s3
8040abc8:	0047ab03          	lw	s6,4(a5)
8040abcc:	01012c23          	sw	a6,24(sp)
8040abd0:	00f12a23          	sw	a5,20(sp)
8040abd4:	bf8fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040abd8:	01412783          	lw	a5,20(sp)
8040abdc:	01812803          	lw	a6,24(sp)
8040abe0:	00a7a223          	sw	a0,4(a5)
8040abe4:	0167a423          	sw	s6,8(a5)
8040abe8:	00050463          	beqz	a0,8040abf0 <stride_dequeue+0x194c>
8040abec:	00f52023          	sw	a5,0(a0)
8040abf0:	008c2b03          	lw	s6,8(s8)
8040abf4:	01012703          	lw	a4,16(sp)
8040abf8:	00f92223          	sw	a5,4(s2)
8040abfc:	000b0993          	mv	s3,s6
8040ac00:	00e92423          	sw	a4,8(s2)
8040ac04:	0127a023          	sw	s2,0(a5)
8040ac08:	875fe06f          	j	8040947c <stride_dequeue+0x1d8>
8040ac0c:	004a2783          	lw	a5,4(s4)
8040ac10:	008a2983          	lw	s3,8(s4)
8040ac14:	00a12623          	sw	a0,12(sp)
8040ac18:	00f12423          	sw	a5,8(sp)
8040ac1c:	00099463          	bnez	s3,8040ac24 <stride_dequeue+0x1980>
8040ac20:	4180106f          	j	8040c038 <stride_dequeue+0x2d94>
8040ac24:	00040593          	mv	a1,s0
8040ac28:	00098513          	mv	a0,s3
8040ac2c:	ae4fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040ac30:	00c12803          	lw	a6,12(sp)
8040ac34:	01051463          	bne	a0,a6,8040ac3c <stride_dequeue+0x1998>
8040ac38:	16c0106f          	j	8040bda4 <stride_dequeue+0x2b00>
8040ac3c:	00442783          	lw	a5,4(s0)
8040ac40:	00842883          	lw	a7,8(s0)
8040ac44:	01012a23          	sw	a6,20(sp)
8040ac48:	00f12623          	sw	a5,12(sp)
8040ac4c:	04088c63          	beqz	a7,8040aca4 <stride_dequeue+0x1a00>
8040ac50:	00088593          	mv	a1,a7
8040ac54:	00098513          	mv	a0,s3
8040ac58:	01112823          	sw	a7,16(sp)
8040ac5c:	ab4fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040ac60:	01412803          	lw	a6,20(sp)
8040ac64:	01012883          	lw	a7,16(sp)
8040ac68:	01051463          	bne	a0,a6,8040ac70 <stride_dequeue+0x19cc>
8040ac6c:	6c00106f          	j	8040c32c <stride_dequeue+0x3088>
8040ac70:	0088a583          	lw	a1,8(a7)
8040ac74:	00098513          	mv	a0,s3
8040ac78:	0048ab03          	lw	s6,4(a7)
8040ac7c:	01112823          	sw	a7,16(sp)
8040ac80:	b4cfe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040ac84:	01012883          	lw	a7,16(sp)
8040ac88:	00a8a223          	sw	a0,4(a7)
8040ac8c:	0168a423          	sw	s6,8(a7)
8040ac90:	00051463          	bnez	a0,8040ac98 <stride_dequeue+0x19f4>
8040ac94:	7900106f          	j	8040c424 <stride_dequeue+0x3180>
8040ac98:	008c2b03          	lw	s6,8(s8)
8040ac9c:	01152023          	sw	a7,0(a0)
8040aca0:	00088993          	mv	s3,a7
8040aca4:	00c12783          	lw	a5,12(sp)
8040aca8:	01342223          	sw	s3,4(s0)
8040acac:	00f42423          	sw	a5,8(s0)
8040acb0:	0089a023          	sw	s0,0(s3)
8040acb4:	00040993          	mv	s3,s0
8040acb8:	00812783          	lw	a5,8(sp)
8040acbc:	013a2223          	sw	s3,4(s4)
8040acc0:	000a0413          	mv	s0,s4
8040acc4:	00fa2423          	sw	a5,8(s4)
8040acc8:	0149a023          	sw	s4,0(s3)
8040accc:	000b0993          	mv	s3,s6
8040acd0:	bacff06f          	j	8040a07c <stride_dequeue+0xdd8>
8040acd4:	0048a783          	lw	a5,4(a7)
8040acd8:	0088a983          	lw	s3,8(a7)
8040acdc:	00a12823          	sw	a0,16(sp)
8040ace0:	00f12623          	sw	a5,12(sp)
8040ace4:	00099463          	bnez	s3,8040acec <stride_dequeue+0x1a48>
8040ace8:	5a40106f          	j	8040c28c <stride_dequeue+0x2fe8>
8040acec:	000d8593          	mv	a1,s11
8040acf0:	00098513          	mv	a0,s3
8040acf4:	01112a23          	sw	a7,20(sp)
8040acf8:	a18fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040acfc:	01012303          	lw	t1,16(sp)
8040ad00:	01412883          	lw	a7,20(sp)
8040ad04:	00651463          	bne	a0,t1,8040ad0c <stride_dequeue+0x1a68>
8040ad08:	54c0106f          	j	8040c254 <stride_dequeue+0x2fb0>
8040ad0c:	004da783          	lw	a5,4(s11)
8040ad10:	008dae03          	lw	t3,8(s11)
8040ad14:	00612e23          	sw	t1,28(sp)
8040ad18:	00f12823          	sw	a5,16(sp)
8040ad1c:	060e0463          	beqz	t3,8040ad84 <stride_dequeue+0x1ae0>
8040ad20:	000e0593          	mv	a1,t3
8040ad24:	00098513          	mv	a0,s3
8040ad28:	01112c23          	sw	a7,24(sp)
8040ad2c:	01c12a23          	sw	t3,20(sp)
8040ad30:	9e0fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040ad34:	01c12303          	lw	t1,28(sp)
8040ad38:	01412e03          	lw	t3,20(sp)
8040ad3c:	01812883          	lw	a7,24(sp)
8040ad40:	00651463          	bne	a0,t1,8040ad48 <stride_dequeue+0x1aa4>
8040ad44:	2890106f          	j	8040c7cc <stride_dequeue+0x3528>
8040ad48:	008e2583          	lw	a1,8(t3)
8040ad4c:	00098513          	mv	a0,s3
8040ad50:	004e2b03          	lw	s6,4(t3)
8040ad54:	01112c23          	sw	a7,24(sp)
8040ad58:	01c12a23          	sw	t3,20(sp)
8040ad5c:	a70fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040ad60:	01412e03          	lw	t3,20(sp)
8040ad64:	01812883          	lw	a7,24(sp)
8040ad68:	00ae2223          	sw	a0,4(t3)
8040ad6c:	016e2423          	sw	s6,8(t3)
8040ad70:	00051463          	bnez	a0,8040ad78 <stride_dequeue+0x1ad4>
8040ad74:	3590106f          	j	8040c8cc <stride_dequeue+0x3628>
8040ad78:	008c2b03          	lw	s6,8(s8)
8040ad7c:	01c52023          	sw	t3,0(a0)
8040ad80:	000e0993          	mv	s3,t3
8040ad84:	01012783          	lw	a5,16(sp)
8040ad88:	013da223          	sw	s3,4(s11)
8040ad8c:	00fda423          	sw	a5,8(s11)
8040ad90:	01b9a023          	sw	s11,0(s3)
8040ad94:	000d8993          	mv	s3,s11
8040ad98:	00c12783          	lw	a5,12(sp)
8040ad9c:	0138a223          	sw	s3,4(a7)
8040ada0:	00088d93          	mv	s11,a7
8040ada4:	00f8a423          	sw	a5,8(a7)
8040ada8:	0119a023          	sw	a7,0(s3)
8040adac:	000b0993          	mv	s3,s6
8040adb0:	be0ff06f          	j	8040a190 <stride_dequeue+0xeec>
8040adb4:	0048a783          	lw	a5,4(a7)
8040adb8:	0088a983          	lw	s3,8(a7)
8040adbc:	00a12823          	sw	a0,16(sp)
8040adc0:	00f12623          	sw	a5,12(sp)
8040adc4:	00099463          	bnez	s3,8040adcc <stride_dequeue+0x1b28>
8040adc8:	4e40106f          	j	8040c2ac <stride_dequeue+0x3008>
8040adcc:	000a0593          	mv	a1,s4
8040add0:	00098513          	mv	a0,s3
8040add4:	01112a23          	sw	a7,20(sp)
8040add8:	938fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040addc:	01012303          	lw	t1,16(sp)
8040ade0:	01412883          	lw	a7,20(sp)
8040ade4:	00651463          	bne	a0,t1,8040adec <stride_dequeue+0x1b48>
8040ade8:	0ac0106f          	j	8040be94 <stride_dequeue+0x2bf0>
8040adec:	004a2783          	lw	a5,4(s4)
8040adf0:	008a2e03          	lw	t3,8(s4)
8040adf4:	00612e23          	sw	t1,28(sp)
8040adf8:	00f12823          	sw	a5,16(sp)
8040adfc:	060e0463          	beqz	t3,8040ae64 <stride_dequeue+0x1bc0>
8040ae00:	000e0593          	mv	a1,t3
8040ae04:	00098513          	mv	a0,s3
8040ae08:	01112c23          	sw	a7,24(sp)
8040ae0c:	01c12a23          	sw	t3,20(sp)
8040ae10:	900fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040ae14:	01c12303          	lw	t1,28(sp)
8040ae18:	01412e03          	lw	t3,20(sp)
8040ae1c:	01812883          	lw	a7,24(sp)
8040ae20:	00651463          	bne	a0,t1,8040ae28 <stride_dequeue+0x1b84>
8040ae24:	07d0106f          	j	8040c6a0 <stride_dequeue+0x33fc>
8040ae28:	008e2583          	lw	a1,8(t3)
8040ae2c:	00098513          	mv	a0,s3
8040ae30:	004e2b03          	lw	s6,4(t3)
8040ae34:	01112c23          	sw	a7,24(sp)
8040ae38:	01c12a23          	sw	t3,20(sp)
8040ae3c:	990fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040ae40:	01412e03          	lw	t3,20(sp)
8040ae44:	01812883          	lw	a7,24(sp)
8040ae48:	00ae2223          	sw	a0,4(t3)
8040ae4c:	016e2423          	sw	s6,8(t3)
8040ae50:	00051463          	bnez	a0,8040ae58 <stride_dequeue+0x1bb4>
8040ae54:	2190106f          	j	8040c86c <stride_dequeue+0x35c8>
8040ae58:	008c2b03          	lw	s6,8(s8)
8040ae5c:	01c52023          	sw	t3,0(a0)
8040ae60:	000e0993          	mv	s3,t3
8040ae64:	01012783          	lw	a5,16(sp)
8040ae68:	013a2223          	sw	s3,4(s4)
8040ae6c:	00fa2423          	sw	a5,8(s4)
8040ae70:	0149a023          	sw	s4,0(s3)
8040ae74:	000a0993          	mv	s3,s4
8040ae78:	00c12783          	lw	a5,12(sp)
8040ae7c:	0138a223          	sw	s3,4(a7)
8040ae80:	00088a13          	mv	s4,a7
8040ae84:	00f8a423          	sw	a5,8(a7)
8040ae88:	0119a023          	sw	a7,0(s3)
8040ae8c:	000b0993          	mv	s3,s6
8040ae90:	d44ff06f          	j	8040a3d4 <stride_dequeue+0x1130>
8040ae94:	004ca783          	lw	a5,4(s9)
8040ae98:	008ca983          	lw	s3,8(s9)
8040ae9c:	00a12823          	sw	a0,16(sp)
8040aea0:	00f12623          	sw	a5,12(sp)
8040aea4:	00099463          	bnez	s3,8040aeac <stride_dequeue+0x1c08>
8040aea8:	3dc0106f          	j	8040c284 <stride_dequeue+0x2fe0>
8040aeac:	00080593          	mv	a1,a6
8040aeb0:	00098513          	mv	a0,s3
8040aeb4:	01012a23          	sw	a6,20(sp)
8040aeb8:	858fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040aebc:	01012303          	lw	t1,16(sp)
8040aec0:	01412803          	lw	a6,20(sp)
8040aec4:	00651463          	bne	a0,t1,8040aecc <stride_dequeue+0x1c28>
8040aec8:	1a80106f          	j	8040c070 <stride_dequeue+0x2dcc>
8040aecc:	00482783          	lw	a5,4(a6)
8040aed0:	00882e03          	lw	t3,8(a6)
8040aed4:	00612e23          	sw	t1,28(sp)
8040aed8:	00f12823          	sw	a5,16(sp)
8040aedc:	060e0463          	beqz	t3,8040af44 <stride_dequeue+0x1ca0>
8040aee0:	000e0593          	mv	a1,t3
8040aee4:	00098513          	mv	a0,s3
8040aee8:	01012c23          	sw	a6,24(sp)
8040aeec:	01c12a23          	sw	t3,20(sp)
8040aef0:	820fe0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040aef4:	01c12303          	lw	t1,28(sp)
8040aef8:	01412e03          	lw	t3,20(sp)
8040aefc:	01812803          	lw	a6,24(sp)
8040af00:	00651463          	bne	a0,t1,8040af08 <stride_dequeue+0x1c64>
8040af04:	7cc0106f          	j	8040c6d0 <stride_dequeue+0x342c>
8040af08:	008e2583          	lw	a1,8(t3)
8040af0c:	00098513          	mv	a0,s3
8040af10:	004e2b03          	lw	s6,4(t3)
8040af14:	01012c23          	sw	a6,24(sp)
8040af18:	01c12a23          	sw	t3,20(sp)
8040af1c:	8b0fe0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040af20:	01412e03          	lw	t3,20(sp)
8040af24:	01812803          	lw	a6,24(sp)
8040af28:	00ae2223          	sw	a0,4(t3)
8040af2c:	016e2423          	sw	s6,8(t3)
8040af30:	00051463          	bnez	a0,8040af38 <stride_dequeue+0x1c94>
8040af34:	1450106f          	j	8040c878 <stride_dequeue+0x35d4>
8040af38:	008c2b03          	lw	s6,8(s8)
8040af3c:	01c52023          	sw	t3,0(a0)
8040af40:	000e0993          	mv	s3,t3
8040af44:	01012783          	lw	a5,16(sp)
8040af48:	01382223          	sw	s3,4(a6)
8040af4c:	00f82423          	sw	a5,8(a6)
8040af50:	0109a023          	sw	a6,0(s3)
8040af54:	00080993          	mv	s3,a6
8040af58:	00c12783          	lw	a5,12(sp)
8040af5c:	013ca223          	sw	s3,4(s9)
8040af60:	00fca423          	sw	a5,8(s9)
8040af64:	0199a023          	sw	s9,0(s3)
8040af68:	000b0993          	mv	s3,s6
8040af6c:	a99fe06f          	j	80409a04 <stride_dequeue+0x760>
8040af70:	004a2783          	lw	a5,4(s4)
8040af74:	008a2983          	lw	s3,8(s4)
8040af78:	00a12823          	sw	a0,16(sp)
8040af7c:	00f12623          	sw	a5,12(sp)
8040af80:	00099463          	bnez	s3,8040af88 <stride_dequeue+0x1ce4>
8040af84:	3100106f          	j	8040c294 <stride_dequeue+0x2ff0>
8040af88:	00080593          	mv	a1,a6
8040af8c:	00098513          	mv	a0,s3
8040af90:	01012a23          	sw	a6,20(sp)
8040af94:	f7dfd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040af98:	01012303          	lw	t1,16(sp)
8040af9c:	01412803          	lw	a6,20(sp)
8040afa0:	00651463          	bne	a0,t1,8040afa8 <stride_dequeue+0x1d04>
8040afa4:	7590006f          	j	8040befc <stride_dequeue+0x2c58>
8040afa8:	00482783          	lw	a5,4(a6)
8040afac:	00882e03          	lw	t3,8(a6)
8040afb0:	00612e23          	sw	t1,28(sp)
8040afb4:	00f12823          	sw	a5,16(sp)
8040afb8:	060e0463          	beqz	t3,8040b020 <stride_dequeue+0x1d7c>
8040afbc:	000e0593          	mv	a1,t3
8040afc0:	00098513          	mv	a0,s3
8040afc4:	01012c23          	sw	a6,24(sp)
8040afc8:	01c12a23          	sw	t3,20(sp)
8040afcc:	f45fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040afd0:	01c12303          	lw	t1,28(sp)
8040afd4:	01412e03          	lw	t3,20(sp)
8040afd8:	01812803          	lw	a6,24(sp)
8040afdc:	00651463          	bne	a0,t1,8040afe4 <stride_dequeue+0x1d40>
8040afe0:	4500106f          	j	8040c430 <stride_dequeue+0x318c>
8040afe4:	008e2583          	lw	a1,8(t3)
8040afe8:	00098513          	mv	a0,s3
8040afec:	004e2b03          	lw	s6,4(t3)
8040aff0:	01012c23          	sw	a6,24(sp)
8040aff4:	01c12a23          	sw	t3,20(sp)
8040aff8:	fd5fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040affc:	01412e03          	lw	t3,20(sp)
8040b000:	01812803          	lw	a6,24(sp)
8040b004:	00ae2223          	sw	a0,4(t3)
8040b008:	016e2423          	sw	s6,8(t3)
8040b00c:	00051463          	bnez	a0,8040b014 <stride_dequeue+0x1d70>
8040b010:	0f90106f          	j	8040c908 <stride_dequeue+0x3664>
8040b014:	008c2b03          	lw	s6,8(s8)
8040b018:	01c52023          	sw	t3,0(a0)
8040b01c:	000e0993          	mv	s3,t3
8040b020:	01012783          	lw	a5,16(sp)
8040b024:	01382223          	sw	s3,4(a6)
8040b028:	00f82423          	sw	a5,8(a6)
8040b02c:	0109a023          	sw	a6,0(s3)
8040b030:	00080993          	mv	s3,a6
8040b034:	00c12783          	lw	a5,12(sp)
8040b038:	013a2223          	sw	s3,4(s4)
8040b03c:	00fa2423          	sw	a5,8(s4)
8040b040:	0149a023          	sw	s4,0(s3)
8040b044:	000b0993          	mv	s3,s6
8040b048:	b1dfe06f          	j	80409b64 <stride_dequeue+0x8c0>
8040b04c:	0048a783          	lw	a5,4(a7)
8040b050:	0088a983          	lw	s3,8(a7)
8040b054:	00a12623          	sw	a0,12(sp)
8040b058:	00f12423          	sw	a5,8(sp)
8040b05c:	00099463          	bnez	s3,8040b064 <stride_dequeue+0x1dc0>
8040b060:	2440106f          	j	8040c2a4 <stride_dequeue+0x3000>
8040b064:	00060593          	mv	a1,a2
8040b068:	00098513          	mv	a0,s3
8040b06c:	01112a23          	sw	a7,20(sp)
8040b070:	ea1fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b074:	00c12303          	lw	t1,12(sp)
8040b078:	01012603          	lw	a2,16(sp)
8040b07c:	01412883          	lw	a7,20(sp)
8040b080:	5e6502e3          	beq	a0,t1,8040be64 <stride_dequeue+0x2bc0>
8040b084:	00462783          	lw	a5,4(a2)
8040b088:	00862e03          	lw	t3,8(a2)
8040b08c:	00612e23          	sw	t1,28(sp)
8040b090:	00f12623          	sw	a5,12(sp)
8040b094:	060e0c63          	beqz	t3,8040b10c <stride_dequeue+0x1e68>
8040b098:	000e0593          	mv	a1,t3
8040b09c:	00098513          	mv	a0,s3
8040b0a0:	01112c23          	sw	a7,24(sp)
8040b0a4:	00c12a23          	sw	a2,20(sp)
8040b0a8:	01c12823          	sw	t3,16(sp)
8040b0ac:	e65fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b0b0:	01c12303          	lw	t1,28(sp)
8040b0b4:	01012e03          	lw	t3,16(sp)
8040b0b8:	01412603          	lw	a2,20(sp)
8040b0bc:	01812883          	lw	a7,24(sp)
8040b0c0:	00651463          	bne	a0,t1,8040b0c8 <stride_dequeue+0x1e24>
8040b0c4:	3d00106f          	j	8040c494 <stride_dequeue+0x31f0>
8040b0c8:	008e2583          	lw	a1,8(t3)
8040b0cc:	00098513          	mv	a0,s3
8040b0d0:	004e2b03          	lw	s6,4(t3)
8040b0d4:	01112c23          	sw	a7,24(sp)
8040b0d8:	00c12a23          	sw	a2,20(sp)
8040b0dc:	01c12823          	sw	t3,16(sp)
8040b0e0:	eedfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b0e4:	01012e03          	lw	t3,16(sp)
8040b0e8:	01412603          	lw	a2,20(sp)
8040b0ec:	01812883          	lw	a7,24(sp)
8040b0f0:	00ae2223          	sw	a0,4(t3)
8040b0f4:	016e2423          	sw	s6,8(t3)
8040b0f8:	00051463          	bnez	a0,8040b100 <stride_dequeue+0x1e5c>
8040b0fc:	0190106f          	j	8040c914 <stride_dequeue+0x3670>
8040b100:	008c2b03          	lw	s6,8(s8)
8040b104:	01c52023          	sw	t3,0(a0)
8040b108:	000e0993          	mv	s3,t3
8040b10c:	00c12783          	lw	a5,12(sp)
8040b110:	01362223          	sw	s3,4(a2)
8040b114:	00f62423          	sw	a5,8(a2)
8040b118:	00c9a023          	sw	a2,0(s3)
8040b11c:	00060993          	mv	s3,a2
8040b120:	00812783          	lw	a5,8(sp)
8040b124:	0138a223          	sw	s3,4(a7)
8040b128:	00088613          	mv	a2,a7
8040b12c:	00f8a423          	sw	a5,8(a7)
8040b130:	0119a023          	sw	a7,0(s3)
8040b134:	000b0993          	mv	s3,s6
8040b138:	98cff06f          	j	8040a2c4 <stride_dequeue+0x1020>
8040b13c:	00462783          	lw	a5,4(a2)
8040b140:	00862983          	lw	s3,8(a2)
8040b144:	00a12623          	sw	a0,12(sp)
8040b148:	00f12423          	sw	a5,8(sp)
8040b14c:	00099463          	bnez	s3,8040b154 <stride_dequeue+0x1eb0>
8040b150:	14c0106f          	j	8040c29c <stride_dequeue+0x2ff8>
8040b154:	00080593          	mv	a1,a6
8040b158:	00098513          	mv	a0,s3
8040b15c:	00c12a23          	sw	a2,20(sp)
8040b160:	01012823          	sw	a6,16(sp)
8040b164:	dadfd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b168:	00c12303          	lw	t1,12(sp)
8040b16c:	01012803          	lw	a6,16(sp)
8040b170:	01412603          	lw	a2,20(sp)
8040b174:	5e6500e3          	beq	a0,t1,8040bf54 <stride_dequeue+0x2cb0>
8040b178:	00482783          	lw	a5,4(a6)
8040b17c:	00882e03          	lw	t3,8(a6)
8040b180:	00612e23          	sw	t1,28(sp)
8040b184:	00f12623          	sw	a5,12(sp)
8040b188:	060e0c63          	beqz	t3,8040b200 <stride_dequeue+0x1f5c>
8040b18c:	000e0593          	mv	a1,t3
8040b190:	00098513          	mv	a0,s3
8040b194:	01012c23          	sw	a6,24(sp)
8040b198:	00c12a23          	sw	a2,20(sp)
8040b19c:	01c12823          	sw	t3,16(sp)
8040b1a0:	d71fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b1a4:	01c12303          	lw	t1,28(sp)
8040b1a8:	01012e03          	lw	t3,16(sp)
8040b1ac:	01412603          	lw	a2,20(sp)
8040b1b0:	01812803          	lw	a6,24(sp)
8040b1b4:	00651463          	bne	a0,t1,8040b1bc <stride_dequeue+0x1f18>
8040b1b8:	3b80106f          	j	8040c570 <stride_dequeue+0x32cc>
8040b1bc:	008e2583          	lw	a1,8(t3)
8040b1c0:	00098513          	mv	a0,s3
8040b1c4:	004e2b03          	lw	s6,4(t3)
8040b1c8:	01012c23          	sw	a6,24(sp)
8040b1cc:	00c12a23          	sw	a2,20(sp)
8040b1d0:	01c12823          	sw	t3,16(sp)
8040b1d4:	df9fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b1d8:	01012e03          	lw	t3,16(sp)
8040b1dc:	01412603          	lw	a2,20(sp)
8040b1e0:	01812803          	lw	a6,24(sp)
8040b1e4:	00ae2223          	sw	a0,4(t3)
8040b1e8:	016e2423          	sw	s6,8(t3)
8040b1ec:	00051463          	bnez	a0,8040b1f4 <stride_dequeue+0x1f50>
8040b1f0:	6ac0106f          	j	8040c89c <stride_dequeue+0x35f8>
8040b1f4:	008c2b03          	lw	s6,8(s8)
8040b1f8:	01c52023          	sw	t3,0(a0)
8040b1fc:	000e0993          	mv	s3,t3
8040b200:	00c12783          	lw	a5,12(sp)
8040b204:	01382223          	sw	s3,4(a6)
8040b208:	00f82423          	sw	a5,8(a6)
8040b20c:	0109a023          	sw	a6,0(s3)
8040b210:	00080993          	mv	s3,a6
8040b214:	00812783          	lw	a5,8(sp)
8040b218:	01362223          	sw	s3,4(a2)
8040b21c:	00f62423          	sw	a5,8(a2)
8040b220:	00c9a023          	sw	a2,0(s3)
8040b224:	000b0993          	mv	s3,s6
8040b228:	aa5fe06f          	j	80409ccc <stride_dequeue+0xa28>
8040b22c:	0048a783          	lw	a5,4(a7)
8040b230:	0088a983          	lw	s3,8(a7)
8040b234:	00a12a23          	sw	a0,20(sp)
8040b238:	00f12823          	sw	a5,16(sp)
8040b23c:	04098c63          	beqz	s3,8040b294 <stride_dequeue+0x1ff0>
8040b240:	00080593          	mv	a1,a6
8040b244:	00098513          	mv	a0,s3
8040b248:	01112e23          	sw	a7,28(sp)
8040b24c:	cc5fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b250:	01412e03          	lw	t3,20(sp)
8040b254:	01812803          	lw	a6,24(sp)
8040b258:	01c12883          	lw	a7,28(sp)
8040b25c:	3dc50ae3          	beq	a0,t3,8040be30 <stride_dequeue+0x2b8c>
8040b260:	00882583          	lw	a1,8(a6)
8040b264:	00098513          	mv	a0,s3
8040b268:	00482b03          	lw	s6,4(a6)
8040b26c:	01112c23          	sw	a7,24(sp)
8040b270:	01012a23          	sw	a6,20(sp)
8040b274:	d59fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b278:	01412803          	lw	a6,20(sp)
8040b27c:	01812883          	lw	a7,24(sp)
8040b280:	00a82223          	sw	a0,4(a6)
8040b284:	01682423          	sw	s6,8(a6)
8040b288:	00050463          	beqz	a0,8040b290 <stride_dequeue+0x1fec>
8040b28c:	01052023          	sw	a6,0(a0)
8040b290:	008c2b03          	lw	s6,8(s8)
8040b294:	01012783          	lw	a5,16(sp)
8040b298:	0108a223          	sw	a6,4(a7)
8040b29c:	000b0993          	mv	s3,s6
8040b2a0:	00f8a423          	sw	a5,8(a7)
8040b2a4:	01182023          	sw	a7,0(a6)
8040b2a8:	00088813          	mv	a6,a7
8040b2ac:	9f4ff06f          	j	8040a4a0 <stride_dequeue+0x11fc>
8040b2b0:	004da783          	lw	a5,4(s11)
8040b2b4:	008da983          	lw	s3,8(s11)
8040b2b8:	00a12823          	sw	a0,16(sp)
8040b2bc:	00f12623          	sw	a5,12(sp)
8040b2c0:	06098663          	beqz	s3,8040b32c <stride_dequeue+0x2088>
8040b2c4:	00030593          	mv	a1,t1
8040b2c8:	00098513          	mv	a0,s3
8040b2cc:	01012e23          	sw	a6,28(sp)
8040b2d0:	00c12c23          	sw	a2,24(sp)
8040b2d4:	00612a23          	sw	t1,20(sp)
8040b2d8:	c39fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b2dc:	01012e03          	lw	t3,16(sp)
8040b2e0:	01412303          	lw	t1,20(sp)
8040b2e4:	01812603          	lw	a2,24(sp)
8040b2e8:	01c12803          	lw	a6,28(sp)
8040b2ec:	5dc50ee3          	beq	a0,t3,8040c0c8 <stride_dequeue+0x2e24>
8040b2f0:	00832583          	lw	a1,8(t1)
8040b2f4:	00098513          	mv	a0,s3
8040b2f8:	00432b03          	lw	s6,4(t1)
8040b2fc:	01012c23          	sw	a6,24(sp)
8040b300:	00c12a23          	sw	a2,20(sp)
8040b304:	00612823          	sw	t1,16(sp)
8040b308:	cc5fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b30c:	01012303          	lw	t1,16(sp)
8040b310:	01412603          	lw	a2,20(sp)
8040b314:	01812803          	lw	a6,24(sp)
8040b318:	00a32223          	sw	a0,4(t1)
8040b31c:	01632423          	sw	s6,8(t1)
8040b320:	00050463          	beqz	a0,8040b328 <stride_dequeue+0x2084>
8040b324:	00652023          	sw	t1,0(a0)
8040b328:	008c2b03          	lw	s6,8(s8)
8040b32c:	00c12783          	lw	a5,12(sp)
8040b330:	006da223          	sw	t1,4(s11)
8040b334:	000b0993          	mv	s3,s6
8040b338:	00fda423          	sw	a5,8(s11)
8040b33c:	01b32023          	sw	s11,0(t1)
8040b340:	d24fe06f          	j	80409864 <stride_dequeue+0x5c0>
8040b344:	004ca783          	lw	a5,4(s9)
8040b348:	008ca983          	lw	s3,8(s9)
8040b34c:	00a12a23          	sw	a0,20(sp)
8040b350:	00f12823          	sw	a5,16(sp)
8040b354:	04098e63          	beqz	s3,8040b3b0 <stride_dequeue+0x210c>
8040b358:	00030593          	mv	a1,t1
8040b35c:	00098513          	mv	a0,s3
8040b360:	01012e23          	sw	a6,28(sp)
8040b364:	00612c23          	sw	t1,24(sp)
8040b368:	ba9fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b36c:	01412e03          	lw	t3,20(sp)
8040b370:	01812303          	lw	t1,24(sp)
8040b374:	01c12803          	lw	a6,28(sp)
8040b378:	25c50ae3          	beq	a0,t3,8040bdcc <stride_dequeue+0x2b28>
8040b37c:	00832583          	lw	a1,8(t1)
8040b380:	00098513          	mv	a0,s3
8040b384:	00432b03          	lw	s6,4(t1)
8040b388:	01012c23          	sw	a6,24(sp)
8040b38c:	00612a23          	sw	t1,20(sp)
8040b390:	c3dfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b394:	01412303          	lw	t1,20(sp)
8040b398:	01812803          	lw	a6,24(sp)
8040b39c:	00a32223          	sw	a0,4(t1)
8040b3a0:	01632423          	sw	s6,8(t1)
8040b3a4:	00050463          	beqz	a0,8040b3ac <stride_dequeue+0x2108>
8040b3a8:	00652023          	sw	t1,0(a0)
8040b3ac:	008c2b03          	lw	s6,8(s8)
8040b3b0:	01012783          	lw	a5,16(sp)
8040b3b4:	006ca223          	sw	t1,4(s9)
8040b3b8:	000b0993          	mv	s3,s6
8040b3bc:	00fca423          	sw	a5,8(s9)
8040b3c0:	01932023          	sw	s9,0(t1)
8040b3c4:	b55fe06f          	j	80409f18 <stride_dequeue+0xc74>
8040b3c8:	004da783          	lw	a5,4(s11)
8040b3cc:	008da983          	lw	s3,8(s11)
8040b3d0:	00a12a23          	sw	a0,20(sp)
8040b3d4:	00f12823          	sw	a5,16(sp)
8040b3d8:	04098e63          	beqz	s3,8040b434 <stride_dequeue+0x2190>
8040b3dc:	00030593          	mv	a1,t1
8040b3e0:	00098513          	mv	a0,s3
8040b3e4:	01012e23          	sw	a6,28(sp)
8040b3e8:	00612c23          	sw	t1,24(sp)
8040b3ec:	b25fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b3f0:	01412e03          	lw	t3,20(sp)
8040b3f4:	01812303          	lw	t1,24(sp)
8040b3f8:	01c12803          	lw	a6,28(sp)
8040b3fc:	53c50ce3          	beq	a0,t3,8040c134 <stride_dequeue+0x2e90>
8040b400:	00832583          	lw	a1,8(t1)
8040b404:	00098513          	mv	a0,s3
8040b408:	00432b03          	lw	s6,4(t1)
8040b40c:	01012c23          	sw	a6,24(sp)
8040b410:	00612a23          	sw	t1,20(sp)
8040b414:	bb9fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b418:	01412303          	lw	t1,20(sp)
8040b41c:	01812803          	lw	a6,24(sp)
8040b420:	00a32223          	sw	a0,4(t1)
8040b424:	01632423          	sw	s6,8(t1)
8040b428:	00050463          	beqz	a0,8040b430 <stride_dequeue+0x218c>
8040b42c:	00652023          	sw	t1,0(a0)
8040b430:	008c2b03          	lw	s6,8(s8)
8040b434:	01012783          	lw	a5,16(sp)
8040b438:	006da223          	sw	t1,4(s11)
8040b43c:	000b0993          	mv	s3,s6
8040b440:	00fda423          	sw	a5,8(s11)
8040b444:	01b32023          	sw	s11,0(t1)
8040b448:	a40fe06f          	j	80409688 <stride_dequeue+0x3e4>
8040b44c:	0048a783          	lw	a5,4(a7)
8040b450:	0088a983          	lw	s3,8(a7)
8040b454:	00a12a23          	sw	a0,20(sp)
8040b458:	00f12823          	sw	a5,16(sp)
8040b45c:	04098c63          	beqz	s3,8040b4b4 <stride_dequeue+0x2210>
8040b460:	00030593          	mv	a1,t1
8040b464:	00098513          	mv	a0,s3
8040b468:	01112e23          	sw	a7,28(sp)
8040b46c:	aa5fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b470:	01412e03          	lw	t3,20(sp)
8040b474:	01812303          	lw	t1,24(sp)
8040b478:	01c12883          	lw	a7,28(sp)
8040b47c:	5bc502e3          	beq	a0,t3,8040c220 <stride_dequeue+0x2f7c>
8040b480:	00832583          	lw	a1,8(t1)
8040b484:	00098513          	mv	a0,s3
8040b488:	00432b03          	lw	s6,4(t1)
8040b48c:	01112c23          	sw	a7,24(sp)
8040b490:	00612a23          	sw	t1,20(sp)
8040b494:	b39fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b498:	01412303          	lw	t1,20(sp)
8040b49c:	01812883          	lw	a7,24(sp)
8040b4a0:	00a32223          	sw	a0,4(t1)
8040b4a4:	01632423          	sw	s6,8(t1)
8040b4a8:	00050463          	beqz	a0,8040b4b0 <stride_dequeue+0x220c>
8040b4ac:	00652023          	sw	t1,0(a0)
8040b4b0:	008c2b03          	lw	s6,8(s8)
8040b4b4:	01012783          	lw	a5,16(sp)
8040b4b8:	0068a223          	sw	t1,4(a7)
8040b4bc:	000b0993          	mv	s3,s6
8040b4c0:	00f8a423          	sw	a5,8(a7)
8040b4c4:	01132023          	sw	a7,0(t1)
8040b4c8:	91dfe06f          	j	80409de4 <stride_dequeue+0xb40>
8040b4cc:	00892503          	lw	a0,8(s2)
8040b4d0:	00492983          	lw	s3,4(s2)
8040b4d4:	000b0593          	mv	a1,s6
8040b4d8:	af5fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b4dc:	00a92223          	sw	a0,4(s2)
8040b4e0:	01392423          	sw	s3,8(s2)
8040b4e4:	01412803          	lw	a6,20(sp)
8040b4e8:	01812783          	lw	a5,24(sp)
8040b4ec:	00050463          	beqz	a0,8040b4f4 <stride_dequeue+0x2250>
8040b4f0:	01252023          	sw	s2,0(a0)
8040b4f4:	008c2983          	lw	s3,8(s8)
8040b4f8:	f71fd06f          	j	80409468 <stride_dequeue+0x1c4>
8040b4fc:	0049a703          	lw	a4,4(s3)
8040b500:	0089a783          	lw	a5,8(s3)
8040b504:	00a12a23          	sw	a0,20(sp)
8040b508:	00e12423          	sw	a4,8(sp)
8040b50c:	04078a63          	beqz	a5,8040b560 <stride_dequeue+0x22bc>
8040b510:	00078513          	mv	a0,a5
8040b514:	000a0593          	mv	a1,s4
8040b518:	00c12823          	sw	a2,16(sp)
8040b51c:	00f12623          	sw	a5,12(sp)
8040b520:	9f1fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b524:	01412883          	lw	a7,20(sp)
8040b528:	00c12783          	lw	a5,12(sp)
8040b52c:	01012603          	lw	a2,16(sp)
8040b530:	631508e3          	beq	a0,a7,8040c360 <stride_dequeue+0x30bc>
8040b534:	008a2583          	lw	a1,8(s4)
8040b538:	004a2b03          	lw	s6,4(s4)
8040b53c:	00078513          	mv	a0,a5
8040b540:	00c12623          	sw	a2,12(sp)
8040b544:	a89fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b548:	00aa2223          	sw	a0,4(s4)
8040b54c:	016a2423          	sw	s6,8(s4)
8040b550:	00c12603          	lw	a2,12(sp)
8040b554:	00050463          	beqz	a0,8040b55c <stride_dequeue+0x22b8>
8040b558:	01452023          	sw	s4,0(a0)
8040b55c:	008c2b03          	lw	s6,8(s8)
8040b560:	00812783          	lw	a5,8(sp)
8040b564:	0149a223          	sw	s4,4(s3)
8040b568:	00f9a423          	sw	a5,8(s3)
8040b56c:	013a2023          	sw	s3,0(s4)
8040b570:	00098a13          	mv	s4,s3
8040b574:	85cff06f          	j	8040a5d0 <stride_dequeue+0x132c>
8040b578:	004a2703          	lw	a4,4(s4)
8040b57c:	008a2783          	lw	a5,8(s4)
8040b580:	00a12a23          	sw	a0,20(sp)
8040b584:	00e12623          	sw	a4,12(sp)
8040b588:	04078263          	beqz	a5,8040b5cc <stride_dequeue+0x2328>
8040b58c:	00078513          	mv	a0,a5
8040b590:	00098593          	mv	a1,s3
8040b594:	00f12823          	sw	a5,16(sp)
8040b598:	979fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b59c:	01412303          	lw	t1,20(sp)
8040b5a0:	01012783          	lw	a5,16(sp)
8040b5a4:	526504e3          	beq	a0,t1,8040c2cc <stride_dequeue+0x3028>
8040b5a8:	0089a583          	lw	a1,8(s3)
8040b5ac:	0049ab03          	lw	s6,4(s3)
8040b5b0:	00078513          	mv	a0,a5
8040b5b4:	a19fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b5b8:	00a9a223          	sw	a0,4(s3)
8040b5bc:	0169a423          	sw	s6,8(s3)
8040b5c0:	00050463          	beqz	a0,8040b5c8 <stride_dequeue+0x2324>
8040b5c4:	01352023          	sw	s3,0(a0)
8040b5c8:	008c2b03          	lw	s6,8(s8)
8040b5cc:	00c12783          	lw	a5,12(sp)
8040b5d0:	013a2223          	sw	s3,4(s4)
8040b5d4:	00fa2423          	sw	a5,8(s4)
8040b5d8:	0149a023          	sw	s4,0(s3)
8040b5dc:	000a0993          	mv	s3,s4
8040b5e0:	a89fe06f          	j	8040a068 <stride_dequeue+0xdc4>
8040b5e4:	0049a703          	lw	a4,4(s3)
8040b5e8:	0089a783          	lw	a5,8(s3)
8040b5ec:	00a12a23          	sw	a0,20(sp)
8040b5f0:	00e12623          	sw	a4,12(sp)
8040b5f4:	04078263          	beqz	a5,8040b638 <stride_dequeue+0x2394>
8040b5f8:	00078513          	mv	a0,a5
8040b5fc:	000a0593          	mv	a1,s4
8040b600:	00f12823          	sw	a5,16(sp)
8040b604:	90dfd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b608:	01412883          	lw	a7,20(sp)
8040b60c:	01012783          	lw	a5,16(sp)
8040b610:	5f1502e3          	beq	a0,a7,8040c3f4 <stride_dequeue+0x3150>
8040b614:	008a2583          	lw	a1,8(s4)
8040b618:	004a2b03          	lw	s6,4(s4)
8040b61c:	00078513          	mv	a0,a5
8040b620:	9adfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b624:	00aa2223          	sw	a0,4(s4)
8040b628:	016a2423          	sw	s6,8(s4)
8040b62c:	00050463          	beqz	a0,8040b634 <stride_dequeue+0x2390>
8040b630:	01452023          	sw	s4,0(a0)
8040b634:	008c2b03          	lw	s6,8(s8)
8040b638:	00c12783          	lw	a5,12(sp)
8040b63c:	0149a223          	sw	s4,4(s3)
8040b640:	00f9a423          	sw	a5,8(s3)
8040b644:	013a2023          	sw	s3,0(s4)
8040b648:	00098a13          	mv	s4,s3
8040b64c:	89cff06f          	j	8040a6e8 <stride_dequeue+0x1444>
8040b650:	0049a703          	lw	a4,4(s3)
8040b654:	0089a783          	lw	a5,8(s3)
8040b658:	00a12a23          	sw	a0,20(sp)
8040b65c:	00e12623          	sw	a4,12(sp)
8040b660:	04078263          	beqz	a5,8040b6a4 <stride_dequeue+0x2400>
8040b664:	00078513          	mv	a0,a5
8040b668:	000c8593          	mv	a1,s9
8040b66c:	00f12823          	sw	a5,16(sp)
8040b670:	8a1fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b674:	01412883          	lw	a7,20(sp)
8040b678:	01012783          	lw	a5,16(sp)
8040b67c:	551504e3          	beq	a0,a7,8040c3c4 <stride_dequeue+0x3120>
8040b680:	008ca583          	lw	a1,8(s9)
8040b684:	004cab03          	lw	s6,4(s9)
8040b688:	00078513          	mv	a0,a5
8040b68c:	941fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b690:	00aca223          	sw	a0,4(s9)
8040b694:	016ca423          	sw	s6,8(s9)
8040b698:	00050463          	beqz	a0,8040b6a0 <stride_dequeue+0x23fc>
8040b69c:	01952023          	sw	s9,0(a0)
8040b6a0:	008c2b03          	lw	s6,8(s8)
8040b6a4:	00c12783          	lw	a5,12(sp)
8040b6a8:	0199a223          	sw	s9,4(s3)
8040b6ac:	00f9a423          	sw	a5,8(s3)
8040b6b0:	013ca023          	sw	s3,0(s9)
8040b6b4:	00098c93          	mv	s9,s3
8040b6b8:	944ff06f          	j	8040a7fc <stride_dequeue+0x1558>
8040b6bc:	008c2b03          	lw	s6,8(s8)
8040b6c0:	00088993          	mv	s3,a7
8040b6c4:	dc9fe06f          	j	8040a48c <stride_dequeue+0x11e8>
8040b6c8:	0048a783          	lw	a5,4(a7)
8040b6cc:	0088a803          	lw	a6,8(a7)
8040b6d0:	00a12e23          	sw	a0,28(sp)
8040b6d4:	00f12823          	sw	a5,16(sp)
8040b6d8:	04080a63          	beqz	a6,8040b72c <stride_dequeue+0x2488>
8040b6dc:	00080513          	mv	a0,a6
8040b6e0:	00098593          	mv	a1,s3
8040b6e4:	01112c23          	sw	a7,24(sp)
8040b6e8:	01012a23          	sw	a6,20(sp)
8040b6ec:	825fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b6f0:	01c12e03          	lw	t3,28(sp)
8040b6f4:	01412803          	lw	a6,20(sp)
8040b6f8:	01812883          	lw	a7,24(sp)
8040b6fc:	57c502e3          	beq	a0,t3,8040c460 <stride_dequeue+0x31bc>
8040b700:	0089a583          	lw	a1,8(s3)
8040b704:	0049ab03          	lw	s6,4(s3)
8040b708:	00080513          	mv	a0,a6
8040b70c:	01112a23          	sw	a7,20(sp)
8040b710:	8bdfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b714:	00a9a223          	sw	a0,4(s3)
8040b718:	0169a423          	sw	s6,8(s3)
8040b71c:	01412883          	lw	a7,20(sp)
8040b720:	00050463          	beqz	a0,8040b728 <stride_dequeue+0x2484>
8040b724:	01352023          	sw	s3,0(a0)
8040b728:	008c2b03          	lw	s6,8(s8)
8040b72c:	01012783          	lw	a5,16(sp)
8040b730:	0138a223          	sw	s3,4(a7)
8040b734:	00f8a423          	sw	a5,8(a7)
8040b738:	0119a023          	sw	a7,0(s3)
8040b73c:	00088993          	mv	s3,a7
8040b740:	c81fe06f          	j	8040a3c0 <stride_dequeue+0x111c>
8040b744:	0048a783          	lw	a5,4(a7)
8040b748:	0088a803          	lw	a6,8(a7)
8040b74c:	00a12e23          	sw	a0,28(sp)
8040b750:	00f12823          	sw	a5,16(sp)
8040b754:	04080a63          	beqz	a6,8040b7a8 <stride_dequeue+0x2504>
8040b758:	00080513          	mv	a0,a6
8040b75c:	00098593          	mv	a1,s3
8040b760:	01112c23          	sw	a7,24(sp)
8040b764:	01012a23          	sw	a6,20(sp)
8040b768:	fa8fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b76c:	01c12e03          	lw	t3,28(sp)
8040b770:	01412803          	lw	a6,20(sp)
8040b774:	01812883          	lw	a7,24(sp)
8040b778:	69c508e3          	beq	a0,t3,8040c608 <stride_dequeue+0x3364>
8040b77c:	0089a583          	lw	a1,8(s3)
8040b780:	0049ab03          	lw	s6,4(s3)
8040b784:	00080513          	mv	a0,a6
8040b788:	01112a23          	sw	a7,20(sp)
8040b78c:	841fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b790:	00a9a223          	sw	a0,4(s3)
8040b794:	0169a423          	sw	s6,8(s3)
8040b798:	01412883          	lw	a7,20(sp)
8040b79c:	00050463          	beqz	a0,8040b7a4 <stride_dequeue+0x2500>
8040b7a0:	01352023          	sw	s3,0(a0)
8040b7a4:	008c2b03          	lw	s6,8(s8)
8040b7a8:	01012783          	lw	a5,16(sp)
8040b7ac:	0138a223          	sw	s3,4(a7)
8040b7b0:	00f8a423          	sw	a5,8(a7)
8040b7b4:	0119a023          	sw	a7,0(s3)
8040b7b8:	00088993          	mv	s3,a7
8040b7bc:	9c1fe06f          	j	8040a17c <stride_dequeue+0xed8>
8040b7c0:	0048a783          	lw	a5,4(a7)
8040b7c4:	0088a803          	lw	a6,8(a7)
8040b7c8:	00a12e23          	sw	a0,28(sp)
8040b7cc:	00f12623          	sw	a5,12(sp)
8040b7d0:	06080263          	beqz	a6,8040b834 <stride_dequeue+0x2590>
8040b7d4:	00080513          	mv	a0,a6
8040b7d8:	00098593          	mv	a1,s3
8040b7dc:	01112c23          	sw	a7,24(sp)
8040b7e0:	01012823          	sw	a6,16(sp)
8040b7e4:	f2cfd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b7e8:	01c12e03          	lw	t3,28(sp)
8040b7ec:	01012803          	lw	a6,16(sp)
8040b7f0:	01412603          	lw	a2,20(sp)
8040b7f4:	01812883          	lw	a7,24(sp)
8040b7f8:	01c51463          	bne	a0,t3,8040b800 <stride_dequeue+0x255c>
8040b7fc:	7690006f          	j	8040c764 <stride_dequeue+0x34c0>
8040b800:	0089a583          	lw	a1,8(s3)
8040b804:	0049ab03          	lw	s6,4(s3)
8040b808:	00080513          	mv	a0,a6
8040b80c:	01112a23          	sw	a7,20(sp)
8040b810:	00c12823          	sw	a2,16(sp)
8040b814:	fb8fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b818:	00a9a223          	sw	a0,4(s3)
8040b81c:	0169a423          	sw	s6,8(s3)
8040b820:	01012603          	lw	a2,16(sp)
8040b824:	01412883          	lw	a7,20(sp)
8040b828:	00050463          	beqz	a0,8040b830 <stride_dequeue+0x258c>
8040b82c:	01352023          	sw	s3,0(a0)
8040b830:	008c2b03          	lw	s6,8(s8)
8040b834:	00c12783          	lw	a5,12(sp)
8040b838:	0138a223          	sw	s3,4(a7)
8040b83c:	00f8a423          	sw	a5,8(a7)
8040b840:	0119a023          	sw	a7,0(s3)
8040b844:	00088993          	mv	s3,a7
8040b848:	a69fe06f          	j	8040a2b0 <stride_dequeue+0x100c>
8040b84c:	00462783          	lw	a5,4(a2)
8040b850:	00862883          	lw	a7,8(a2)
8040b854:	00a12e23          	sw	a0,28(sp)
8040b858:	00f12623          	sw	a5,12(sp)
8040b85c:	06088263          	beqz	a7,8040b8c0 <stride_dequeue+0x261c>
8040b860:	00088513          	mv	a0,a7
8040b864:	00098593          	mv	a1,s3
8040b868:	01012c23          	sw	a6,24(sp)
8040b86c:	00c12a23          	sw	a2,20(sp)
8040b870:	01112823          	sw	a7,16(sp)
8040b874:	e9cfd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b878:	01c12e03          	lw	t3,28(sp)
8040b87c:	01012883          	lw	a7,16(sp)
8040b880:	01412603          	lw	a2,20(sp)
8040b884:	01812803          	lw	a6,24(sp)
8040b888:	45c502e3          	beq	a0,t3,8040c4cc <stride_dequeue+0x3228>
8040b88c:	0089a583          	lw	a1,8(s3)
8040b890:	0049ab03          	lw	s6,4(s3)
8040b894:	00088513          	mv	a0,a7
8040b898:	01012a23          	sw	a6,20(sp)
8040b89c:	00c12823          	sw	a2,16(sp)
8040b8a0:	f2cfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b8a4:	00a9a223          	sw	a0,4(s3)
8040b8a8:	0169a423          	sw	s6,8(s3)
8040b8ac:	01012603          	lw	a2,16(sp)
8040b8b0:	01412803          	lw	a6,20(sp)
8040b8b4:	00050463          	beqz	a0,8040b8bc <stride_dequeue+0x2618>
8040b8b8:	01352023          	sw	s3,0(a0)
8040b8bc:	008c2b03          	lw	s6,8(s8)
8040b8c0:	00c12783          	lw	a5,12(sp)
8040b8c4:	01362223          	sw	s3,4(a2)
8040b8c8:	00f62423          	sw	a5,8(a2)
8040b8cc:	00c9a023          	sw	a2,0(s3)
8040b8d0:	00060993          	mv	s3,a2
8040b8d4:	be0fe06f          	j	80409cb4 <stride_dequeue+0xa10>
8040b8d8:	0049a783          	lw	a5,4(s3)
8040b8dc:	0089a303          	lw	t1,8(s3)
8040b8e0:	00a12e23          	sw	a0,28(sp)
8040b8e4:	00f12823          	sw	a5,16(sp)
8040b8e8:	04030a63          	beqz	t1,8040b93c <stride_dequeue+0x2698>
8040b8ec:	00080593          	mv	a1,a6
8040b8f0:	00030513          	mv	a0,t1
8040b8f4:	01012c23          	sw	a6,24(sp)
8040b8f8:	00612a23          	sw	t1,20(sp)
8040b8fc:	e14fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b900:	01c12e03          	lw	t3,28(sp)
8040b904:	01412303          	lw	t1,20(sp)
8040b908:	01812803          	lw	a6,24(sp)
8040b90c:	4dc506e3          	beq	a0,t3,8040c5d8 <stride_dequeue+0x3334>
8040b910:	00882583          	lw	a1,8(a6)
8040b914:	00030513          	mv	a0,t1
8040b918:	00482b03          	lw	s6,4(a6)
8040b91c:	01012a23          	sw	a6,20(sp)
8040b920:	eacfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b924:	01412803          	lw	a6,20(sp)
8040b928:	00a82223          	sw	a0,4(a6)
8040b92c:	01682423          	sw	s6,8(a6)
8040b930:	00050463          	beqz	a0,8040b938 <stride_dequeue+0x2694>
8040b934:	01052023          	sw	a6,0(a0)
8040b938:	008c2b03          	lw	s6,8(s8)
8040b93c:	01012783          	lw	a5,16(sp)
8040b940:	0109a223          	sw	a6,4(s3)
8040b944:	00f9a423          	sw	a5,8(s3)
8040b948:	01382023          	sw	s3,0(a6)
8040b94c:	00098813          	mv	a6,s3
8040b950:	85cff06f          	j	8040a9ac <stride_dequeue+0x1708>
8040b954:	008c2b03          	lw	s6,8(s8)
8040b958:	00088993          	mv	s3,a7
8040b95c:	c70fe06f          	j	80409dcc <stride_dequeue+0xb28>
8040b960:	0049a783          	lw	a5,4(s3)
8040b964:	0089a303          	lw	t1,8(s3)
8040b968:	00a12e23          	sw	a0,28(sp)
8040b96c:	00f12823          	sw	a5,16(sp)
8040b970:	04030a63          	beqz	t1,8040b9c4 <stride_dequeue+0x2720>
8040b974:	00080593          	mv	a1,a6
8040b978:	00030513          	mv	a0,t1
8040b97c:	01012c23          	sw	a6,24(sp)
8040b980:	00612a23          	sw	t1,20(sp)
8040b984:	d8cfd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040b988:	01c12e03          	lw	t3,28(sp)
8040b98c:	01412303          	lw	t1,20(sp)
8040b990:	01812803          	lw	a6,24(sp)
8040b994:	41c50ae3          	beq	a0,t3,8040c5a8 <stride_dequeue+0x3304>
8040b998:	00882583          	lw	a1,8(a6)
8040b99c:	00030513          	mv	a0,t1
8040b9a0:	00482b03          	lw	s6,4(a6)
8040b9a4:	01012a23          	sw	a6,20(sp)
8040b9a8:	e24fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040b9ac:	01412803          	lw	a6,20(sp)
8040b9b0:	00a82223          	sw	a0,4(a6)
8040b9b4:	01682423          	sw	s6,8(a6)
8040b9b8:	00050463          	beqz	a0,8040b9c0 <stride_dequeue+0x271c>
8040b9bc:	01052023          	sw	a6,0(a0)
8040b9c0:	008c2b03          	lw	s6,8(s8)
8040b9c4:	01012783          	lw	a5,16(sp)
8040b9c8:	0109a223          	sw	a6,4(s3)
8040b9cc:	00f9a423          	sw	a5,8(s3)
8040b9d0:	01382023          	sw	s3,0(a6)
8040b9d4:	00098813          	mv	a6,s3
8040b9d8:	8a8ff06f          	j	8040aa80 <stride_dequeue+0x17dc>
8040b9dc:	004ca783          	lw	a5,4(s9)
8040b9e0:	008ca883          	lw	a7,8(s9)
8040b9e4:	00a12e23          	sw	a0,28(sp)
8040b9e8:	00f12823          	sw	a5,16(sp)
8040b9ec:	04088a63          	beqz	a7,8040ba40 <stride_dequeue+0x279c>
8040b9f0:	00088513          	mv	a0,a7
8040b9f4:	00098593          	mv	a1,s3
8040b9f8:	01012c23          	sw	a6,24(sp)
8040b9fc:	01112a23          	sw	a7,20(sp)
8040ba00:	d10fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040ba04:	01c12e03          	lw	t3,28(sp)
8040ba08:	01412883          	lw	a7,20(sp)
8040ba0c:	01812803          	lw	a6,24(sp)
8040ba10:	53c500e3          	beq	a0,t3,8040c730 <stride_dequeue+0x348c>
8040ba14:	0089a583          	lw	a1,8(s3)
8040ba18:	0049ab03          	lw	s6,4(s3)
8040ba1c:	00088513          	mv	a0,a7
8040ba20:	01012a23          	sw	a6,20(sp)
8040ba24:	da8fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040ba28:	00a9a223          	sw	a0,4(s3)
8040ba2c:	0169a423          	sw	s6,8(s3)
8040ba30:	01412803          	lw	a6,20(sp)
8040ba34:	00050463          	beqz	a0,8040ba3c <stride_dequeue+0x2798>
8040ba38:	01352023          	sw	s3,0(a0)
8040ba3c:	008c2b03          	lw	s6,8(s8)
8040ba40:	01012783          	lw	a5,16(sp)
8040ba44:	013ca223          	sw	s3,4(s9)
8040ba48:	00fca423          	sw	a5,8(s9)
8040ba4c:	0199a023          	sw	s9,0(s3)
8040ba50:	000c8993          	mv	s3,s9
8040ba54:	f99fd06f          	j	804099ec <stride_dequeue+0x748>
8040ba58:	008c2b03          	lw	s6,8(s8)
8040ba5c:	000d8993          	mv	s3,s11
8040ba60:	c11fd06f          	j	80409670 <stride_dequeue+0x3cc>
8040ba64:	004a2783          	lw	a5,4(s4)
8040ba68:	008a2883          	lw	a7,8(s4)
8040ba6c:	00a12e23          	sw	a0,28(sp)
8040ba70:	00f12823          	sw	a5,16(sp)
8040ba74:	04088a63          	beqz	a7,8040bac8 <stride_dequeue+0x2824>
8040ba78:	00088513          	mv	a0,a7
8040ba7c:	00098593          	mv	a1,s3
8040ba80:	01012c23          	sw	a6,24(sp)
8040ba84:	01112a23          	sw	a7,20(sp)
8040ba88:	c88fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040ba8c:	01c12e03          	lw	t3,28(sp)
8040ba90:	01412883          	lw	a7,20(sp)
8040ba94:	01812803          	lw	a6,24(sp)
8040ba98:	57c502e3          	beq	a0,t3,8040c7fc <stride_dequeue+0x3558>
8040ba9c:	0089a583          	lw	a1,8(s3)
8040baa0:	0049ab03          	lw	s6,4(s3)
8040baa4:	00088513          	mv	a0,a7
8040baa8:	01012a23          	sw	a6,20(sp)
8040baac:	d20fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bab0:	00a9a223          	sw	a0,4(s3)
8040bab4:	0169a423          	sw	s6,8(s3)
8040bab8:	01412803          	lw	a6,20(sp)
8040babc:	00050463          	beqz	a0,8040bac4 <stride_dequeue+0x2820>
8040bac0:	01352023          	sw	s3,0(a0)
8040bac4:	008c2b03          	lw	s6,8(s8)
8040bac8:	01012783          	lw	a5,16(sp)
8040bacc:	013a2223          	sw	s3,4(s4)
8040bad0:	00fa2423          	sw	a5,8(s4)
8040bad4:	0149a023          	sw	s4,0(s3)
8040bad8:	000a0993          	mv	s3,s4
8040badc:	870fe06f          	j	80409b4c <stride_dequeue+0x8a8>
8040bae0:	0049a783          	lw	a5,4(s3)
8040bae4:	0089a303          	lw	t1,8(s3)
8040bae8:	00a12e23          	sw	a0,28(sp)
8040baec:	00f12823          	sw	a5,16(sp)
8040baf0:	04030a63          	beqz	t1,8040bb44 <stride_dequeue+0x28a0>
8040baf4:	00030513          	mv	a0,t1
8040baf8:	000c8593          	mv	a1,s9
8040bafc:	01112c23          	sw	a7,24(sp)
8040bb00:	00612a23          	sw	t1,20(sp)
8040bb04:	c0cfd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040bb08:	01c12e03          	lw	t3,28(sp)
8040bb0c:	01412303          	lw	t1,20(sp)
8040bb10:	01812883          	lw	a7,24(sp)
8040bb14:	1fc508e3          	beq	a0,t3,8040c504 <stride_dequeue+0x3260>
8040bb18:	008ca583          	lw	a1,8(s9)
8040bb1c:	004cab03          	lw	s6,4(s9)
8040bb20:	00030513          	mv	a0,t1
8040bb24:	01112a23          	sw	a7,20(sp)
8040bb28:	ca4fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bb2c:	00aca223          	sw	a0,4(s9)
8040bb30:	016ca423          	sw	s6,8(s9)
8040bb34:	01412883          	lw	a7,20(sp)
8040bb38:	00050463          	beqz	a0,8040bb40 <stride_dequeue+0x289c>
8040bb3c:	01952023          	sw	s9,0(a0)
8040bb40:	008c2b03          	lw	s6,8(s8)
8040bb44:	01012783          	lw	a5,16(sp)
8040bb48:	0199a223          	sw	s9,4(s3)
8040bb4c:	00f9a423          	sw	a5,8(s3)
8040bb50:	013ca023          	sw	s3,0(s9)
8040bb54:	00098c93          	mv	s9,s3
8040bb58:	d7dfe06f          	j	8040a8d4 <stride_dequeue+0x1630>
8040bb5c:	008c2b03          	lw	s6,8(s8)
8040bb60:	000c8993          	mv	s3,s9
8040bb64:	b9cfe06f          	j	80409f00 <stride_dequeue+0xc5c>
8040bb68:	0049a783          	lw	a5,4(s3)
8040bb6c:	0089a303          	lw	t1,8(s3)
8040bb70:	00a12e23          	sw	a0,28(sp)
8040bb74:	00f12623          	sw	a5,12(sp)
8040bb78:	06030263          	beqz	t1,8040bbdc <stride_dequeue+0x2938>
8040bb7c:	00080593          	mv	a1,a6
8040bb80:	00030513          	mv	a0,t1
8040bb84:	00c12c23          	sw	a2,24(sp)
8040bb88:	01012a23          	sw	a6,20(sp)
8040bb8c:	00612823          	sw	t1,16(sp)
8040bb90:	b80fd0ef          	jal	ra,80408f10 <proc_stride_comp_f>
8040bb94:	01812603          	lw	a2,24(sp)
8040bb98:	01c12e03          	lw	t3,28(sp)
8040bb9c:	01412803          	lw	a6,20(sp)
8040bba0:	00c12a23          	sw	a2,20(sp)
8040bba4:	01012303          	lw	t1,16(sp)
8040bba8:	29c50ae3          	beq	a0,t3,8040c63c <stride_dequeue+0x3398>
8040bbac:	00882583          	lw	a1,8(a6)
8040bbb0:	00030513          	mv	a0,t1
8040bbb4:	00482b03          	lw	s6,4(a6)
8040bbb8:	01012823          	sw	a6,16(sp)
8040bbbc:	c10fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bbc0:	01012803          	lw	a6,16(sp)
8040bbc4:	01412603          	lw	a2,20(sp)
8040bbc8:	00a82223          	sw	a0,4(a6)
8040bbcc:	01682423          	sw	s6,8(a6)
8040bbd0:	00050463          	beqz	a0,8040bbd8 <stride_dequeue+0x2934>
8040bbd4:	01052023          	sw	a6,0(a0)
8040bbd8:	008c2b03          	lw	s6,8(s8)
8040bbdc:	00c12783          	lw	a5,12(sp)
8040bbe0:	0109a223          	sw	a6,4(s3)
8040bbe4:	00f9a423          	sw	a5,8(s3)
8040bbe8:	01382023          	sw	s3,0(a6)
8040bbec:	00098813          	mv	a6,s3
8040bbf0:	f7dfe06f          	j	8040ab6c <stride_dequeue+0x18c8>
8040bbf4:	000a0993          	mv	s3,s4
8040bbf8:	c70fe06f          	j	8040a068 <stride_dequeue+0xdc4>
8040bbfc:	008c2b03          	lw	s6,8(s8)
8040bc00:	000d8993          	mv	s3,s11
8040bc04:	c49fd06f          	j	8040984c <stride_dequeue+0x5a8>
8040bc08:	008da503          	lw	a0,8(s11)
8040bc0c:	004dab03          	lw	s6,4(s11)
8040bc10:	00098593          	mv	a1,s3
8040bc14:	bb8fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bc18:	00ada223          	sw	a0,4(s11)
8040bc1c:	016da423          	sw	s6,8(s11)
8040bc20:	01012603          	lw	a2,16(sp)
8040bc24:	01412803          	lw	a6,20(sp)
8040bc28:	01812303          	lw	t1,24(sp)
8040bc2c:	fc0508e3          	beqz	a0,8040bbfc <stride_dequeue+0x2958>
8040bc30:	01b52023          	sw	s11,0(a0)
8040bc34:	000d8993          	mv	s3,s11
8040bc38:	008c2b03          	lw	s6,8(s8)
8040bc3c:	c11fd06f          	j	8040984c <stride_dequeue+0x5a8>
8040bc40:	0089a503          	lw	a0,8(s3)
8040bc44:	0049ab03          	lw	s6,4(s3)
8040bc48:	00078593          	mv	a1,a5
8040bc4c:	01012a23          	sw	a6,20(sp)
8040bc50:	b7cfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bc54:	00a9a223          	sw	a0,4(s3)
8040bc58:	0169a423          	sw	s6,8(s3)
8040bc5c:	01412803          	lw	a6,20(sp)
8040bc60:	6a050a63          	beqz	a0,8040c314 <stride_dequeue+0x3070>
8040bc64:	01352023          	sw	s3,0(a0)
8040bc68:	00098793          	mv	a5,s3
8040bc6c:	008c2b03          	lw	s6,8(s8)
8040bc70:	f85fe06f          	j	8040abf4 <stride_dequeue+0x1950>
8040bc74:	0088a503          	lw	a0,8(a7)
8040bc78:	00098593          	mv	a1,s3
8040bc7c:	0048ab03          	lw	s6,4(a7)
8040bc80:	00612c23          	sw	t1,24(sp)
8040bc84:	01112a23          	sw	a7,20(sp)
8040bc88:	b44fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bc8c:	01412883          	lw	a7,20(sp)
8040bc90:	01812303          	lw	t1,24(sp)
8040bc94:	00a8a223          	sw	a0,4(a7)
8040bc98:	0168a423          	sw	s6,8(a7)
8040bc9c:	ca050ce3          	beqz	a0,8040b954 <stride_dequeue+0x26b0>
8040bca0:	01152023          	sw	a7,0(a0)
8040bca4:	00088993          	mv	s3,a7
8040bca8:	008c2b03          	lw	s6,8(s8)
8040bcac:	920fe06f          	j	80409dcc <stride_dequeue+0xb28>
8040bcb0:	008ca503          	lw	a0,8(s9)
8040bcb4:	004cab03          	lw	s6,4(s9)
8040bcb8:	00098593          	mv	a1,s3
8040bcbc:	b10fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bcc0:	00aca223          	sw	a0,4(s9)
8040bcc4:	016ca423          	sw	s6,8(s9)
8040bcc8:	01412803          	lw	a6,20(sp)
8040bccc:	01812303          	lw	t1,24(sp)
8040bcd0:	e80506e3          	beqz	a0,8040bb5c <stride_dequeue+0x28b8>
8040bcd4:	01952023          	sw	s9,0(a0)
8040bcd8:	000c8993          	mv	s3,s9
8040bcdc:	008c2b03          	lw	s6,8(s8)
8040bce0:	a20fe06f          	j	80409f00 <stride_dequeue+0xc5c>
8040bce4:	008da503          	lw	a0,8(s11)
8040bce8:	004dab03          	lw	s6,4(s11)
8040bcec:	00098593          	mv	a1,s3
8040bcf0:	adcfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bcf4:	00ada223          	sw	a0,4(s11)
8040bcf8:	016da423          	sw	s6,8(s11)
8040bcfc:	01412803          	lw	a6,20(sp)
8040bd00:	01812303          	lw	t1,24(sp)
8040bd04:	d4050ae3          	beqz	a0,8040ba58 <stride_dequeue+0x27b4>
8040bd08:	01b52023          	sw	s11,0(a0)
8040bd0c:	000d8993          	mv	s3,s11
8040bd10:	008c2b03          	lw	s6,8(s8)
8040bd14:	95dfd06f          	j	80409670 <stride_dequeue+0x3cc>
8040bd18:	0088a503          	lw	a0,8(a7)
8040bd1c:	00098593          	mv	a1,s3
8040bd20:	0048ab03          	lw	s6,4(a7)
8040bd24:	01012c23          	sw	a6,24(sp)
8040bd28:	01112a23          	sw	a7,20(sp)
8040bd2c:	aa0fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bd30:	01412883          	lw	a7,20(sp)
8040bd34:	01812803          	lw	a6,24(sp)
8040bd38:	00a8a223          	sw	a0,4(a7)
8040bd3c:	0168a423          	sw	s6,8(a7)
8040bd40:	96050ee3          	beqz	a0,8040b6bc <stride_dequeue+0x2418>
8040bd44:	01152023          	sw	a7,0(a0)
8040bd48:	00088993          	mv	s3,a7
8040bd4c:	008c2b03          	lw	s6,8(s8)
8040bd50:	f3cfe06f          	j	8040a48c <stride_dequeue+0x11e8>
8040bd54:	000a0993          	mv	s3,s4
8040bd58:	df5fd06f          	j	80409b4c <stride_dequeue+0x8a8>
8040bd5c:	00009697          	auipc	a3,0x9
8040bd60:	b0468693          	addi	a3,a3,-1276 # 80414860 <CSWTCH.69+0x994>
8040bd64:	00007617          	auipc	a2,0x7
8040bd68:	f0860613          	addi	a2,a2,-248 # 80412c6c <commands+0x1bc>
8040bd6c:	06300593          	li	a1,99
8040bd70:	00009517          	auipc	a0,0x9
8040bd74:	b1450513          	addi	a0,a0,-1260 # 80414884 <CSWTCH.69+0x9b8>
8040bd78:	8adf40ef          	jal	ra,80400624 <__panic>
8040bd7c:	000c8993          	mv	s3,s9
8040bd80:	c6dfd06f          	j	804099ec <stride_dequeue+0x748>
8040bd84:	00088993          	mv	s3,a7
8040bd88:	d28fe06f          	j	8040a2b0 <stride_dequeue+0x100c>
8040bd8c:	00088993          	mv	s3,a7
8040bd90:	becfe06f          	j	8040a17c <stride_dequeue+0xed8>
8040bd94:	00060993          	mv	s3,a2
8040bd98:	f1dfd06f          	j	80409cb4 <stride_dequeue+0xa10>
8040bd9c:	00088993          	mv	s3,a7
8040bda0:	e20fe06f          	j	8040a3c0 <stride_dequeue+0x111c>
8040bda4:	0089a503          	lw	a0,8(s3)
8040bda8:	0049ab03          	lw	s6,4(s3)
8040bdac:	00040593          	mv	a1,s0
8040bdb0:	a1cfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bdb4:	00a9a223          	sw	a0,4(s3)
8040bdb8:	0169a423          	sw	s6,8(s3)
8040bdbc:	00050463          	beqz	a0,8040bdc4 <stride_dequeue+0x2b20>
8040bdc0:	01352023          	sw	s3,0(a0)
8040bdc4:	008c2b03          	lw	s6,8(s8)
8040bdc8:	ef1fe06f          	j	8040acb8 <stride_dequeue+0x1a14>
8040bdcc:	0089a503          	lw	a0,8(s3)
8040bdd0:	0049ab03          	lw	s6,4(s3)
8040bdd4:	00030593          	mv	a1,t1
8040bdd8:	01012a23          	sw	a6,20(sp)
8040bddc:	9f0fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bde0:	00a9a223          	sw	a0,4(s3)
8040bde4:	0169a423          	sw	s6,8(s3)
8040bde8:	01412803          	lw	a6,20(sp)
8040bdec:	300508e3          	beqz	a0,8040c8fc <stride_dequeue+0x3658>
8040bdf0:	01352023          	sw	s3,0(a0)
8040bdf4:	00098313          	mv	t1,s3
8040bdf8:	008c2b03          	lw	s6,8(s8)
8040bdfc:	db4ff06f          	j	8040b3b0 <stride_dequeue+0x210c>
8040be00:	0088a503          	lw	a0,8(a7)
8040be04:	000e0593          	mv	a1,t3
8040be08:	0048ab03          	lw	s6,4(a7)
8040be0c:	01112a23          	sw	a7,20(sp)
8040be10:	9bcfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040be14:	01412883          	lw	a7,20(sp)
8040be18:	00a8a223          	sw	a0,4(a7)
8040be1c:	0168a423          	sw	s6,8(a7)
8040be20:	00050463          	beqz	a0,8040be28 <stride_dequeue+0x2b84>
8040be24:	01152023          	sw	a7,0(a0)
8040be28:	008c2b03          	lw	s6,8(s8)
8040be2c:	d84fe06f          	j	8040a3b0 <stride_dequeue+0x110c>
8040be30:	0089a503          	lw	a0,8(s3)
8040be34:	0049ab03          	lw	s6,4(s3)
8040be38:	00080593          	mv	a1,a6
8040be3c:	01112a23          	sw	a7,20(sp)
8040be40:	98cfd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040be44:	00a9a223          	sw	a0,4(s3)
8040be48:	0169a423          	sw	s6,8(s3)
8040be4c:	01412883          	lw	a7,20(sp)
8040be50:	300506e3          	beqz	a0,8040c95c <stride_dequeue+0x36b8>
8040be54:	01352023          	sw	s3,0(a0)
8040be58:	00098813          	mv	a6,s3
8040be5c:	008c2b03          	lw	s6,8(s8)
8040be60:	c34ff06f          	j	8040b294 <stride_dequeue+0x1ff0>
8040be64:	0089a503          	lw	a0,8(s3)
8040be68:	0049ab03          	lw	s6,4(s3)
8040be6c:	00060593          	mv	a1,a2
8040be70:	01112623          	sw	a7,12(sp)
8040be74:	958fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040be78:	00a9a223          	sw	a0,4(s3)
8040be7c:	0169a423          	sw	s6,8(s3)
8040be80:	00c12883          	lw	a7,12(sp)
8040be84:	00050463          	beqz	a0,8040be8c <stride_dequeue+0x2be8>
8040be88:	01352023          	sw	s3,0(a0)
8040be8c:	008c2b03          	lw	s6,8(s8)
8040be90:	a90ff06f          	j	8040b120 <stride_dequeue+0x1e7c>
8040be94:	0089a503          	lw	a0,8(s3)
8040be98:	0049ab03          	lw	s6,4(s3)
8040be9c:	000a0593          	mv	a1,s4
8040bea0:	01112823          	sw	a7,16(sp)
8040bea4:	928fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bea8:	00a9a223          	sw	a0,4(s3)
8040beac:	0169a423          	sw	s6,8(s3)
8040beb0:	01012883          	lw	a7,16(sp)
8040beb4:	00050463          	beqz	a0,8040bebc <stride_dequeue+0x2c18>
8040beb8:	01352023          	sw	s3,0(a0)
8040bebc:	008c2b03          	lw	s6,8(s8)
8040bec0:	fb9fe06f          	j	8040ae78 <stride_dequeue+0x1bd4>
8040bec4:	0089a503          	lw	a0,8(s3)
8040bec8:	0049ab03          	lw	s6,4(s3)
8040becc:	000e0593          	mv	a1,t3
8040bed0:	01012a23          	sw	a6,20(sp)
8040bed4:	00c12823          	sw	a2,16(sp)
8040bed8:	8f4fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bedc:	00a9a223          	sw	a0,4(s3)
8040bee0:	0169a423          	sw	s6,8(s3)
8040bee4:	01012603          	lw	a2,16(sp)
8040bee8:	01412803          	lw	a6,20(sp)
8040beec:	00050463          	beqz	a0,8040bef4 <stride_dequeue+0x2c50>
8040bef0:	01352023          	sw	s3,0(a0)
8040bef4:	008c2b03          	lw	s6,8(s8)
8040bef8:	c65fe06f          	j	8040ab5c <stride_dequeue+0x18b8>
8040befc:	0089a503          	lw	a0,8(s3)
8040bf00:	0049ab03          	lw	s6,4(s3)
8040bf04:	00080593          	mv	a1,a6
8040bf08:	8c4fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bf0c:	00a9a223          	sw	a0,4(s3)
8040bf10:	0169a423          	sw	s6,8(s3)
8040bf14:	00050463          	beqz	a0,8040bf1c <stride_dequeue+0x2c78>
8040bf18:	01352023          	sw	s3,0(a0)
8040bf1c:	008c2b03          	lw	s6,8(s8)
8040bf20:	914ff06f          	j	8040b034 <stride_dequeue+0x1d90>
8040bf24:	0089a503          	lw	a0,8(s3)
8040bf28:	0049ab03          	lw	s6,4(s3)
8040bf2c:	000e0593          	mv	a1,t3
8040bf30:	01012a23          	sw	a6,20(sp)
8040bf34:	898fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bf38:	00a9a223          	sw	a0,4(s3)
8040bf3c:	0169a423          	sw	s6,8(s3)
8040bf40:	01412803          	lw	a6,20(sp)
8040bf44:	00050463          	beqz	a0,8040bf4c <stride_dequeue+0x2ca8>
8040bf48:	01352023          	sw	s3,0(a0)
8040bf4c:	008c2b03          	lw	s6,8(s8)
8040bf50:	b21fe06f          	j	8040aa70 <stride_dequeue+0x17cc>
8040bf54:	0089a503          	lw	a0,8(s3)
8040bf58:	0049ab03          	lw	s6,4(s3)
8040bf5c:	00080593          	mv	a1,a6
8040bf60:	00c12623          	sw	a2,12(sp)
8040bf64:	868fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bf68:	00a9a223          	sw	a0,4(s3)
8040bf6c:	0169a423          	sw	s6,8(s3)
8040bf70:	00c12603          	lw	a2,12(sp)
8040bf74:	00050463          	beqz	a0,8040bf7c <stride_dequeue+0x2cd8>
8040bf78:	01352023          	sw	s3,0(a0)
8040bf7c:	008c2b03          	lw	s6,8(s8)
8040bf80:	a94ff06f          	j	8040b214 <stride_dequeue+0x1f70>
8040bf84:	0088a503          	lw	a0,8(a7)
8040bf88:	000e0593          	mv	a1,t3
8040bf8c:	0048ab03          	lw	s6,4(a7)
8040bf90:	01112823          	sw	a7,16(sp)
8040bf94:	838fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bf98:	01012883          	lw	a7,16(sp)
8040bf9c:	01412603          	lw	a2,20(sp)
8040bfa0:	00a8a223          	sw	a0,4(a7)
8040bfa4:	0168a423          	sw	s6,8(a7)
8040bfa8:	00050463          	beqz	a0,8040bfb0 <stride_dequeue+0x2d0c>
8040bfac:	01152023          	sw	a7,0(a0)
8040bfb0:	008c2b03          	lw	s6,8(s8)
8040bfb4:	aecfe06f          	j	8040a2a0 <stride_dequeue+0xffc>
8040bfb8:	0089a503          	lw	a0,8(s3)
8040bfbc:	0049ab03          	lw	s6,4(s3)
8040bfc0:	00088593          	mv	a1,a7
8040bfc4:	808fd0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bfc8:	00a9a223          	sw	a0,4(s3)
8040bfcc:	0169a423          	sw	s6,8(s3)
8040bfd0:	00050463          	beqz	a0,8040bfd8 <stride_dequeue+0x2d34>
8040bfd4:	01352023          	sw	s3,0(a0)
8040bfd8:	008c2b03          	lw	s6,8(s8)
8040bfdc:	811fe06f          	j	8040a7ec <stride_dequeue+0x1548>
8040bfe0:	0089a503          	lw	a0,8(s3)
8040bfe4:	0049ab03          	lw	s6,4(s3)
8040bfe8:	00088593          	mv	a1,a7
8040bfec:	fe1fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040bff0:	00a9a223          	sw	a0,4(s3)
8040bff4:	0169a423          	sw	s6,8(s3)
8040bff8:	00050463          	beqz	a0,8040c000 <stride_dequeue+0x2d5c>
8040bffc:	01352023          	sw	s3,0(a0)
8040c000:	008c2b03          	lw	s6,8(s8)
8040c004:	ed4fe06f          	j	8040a6d8 <stride_dequeue+0x1434>
8040c008:	00862503          	lw	a0,8(a2)
8040c00c:	000e0593          	mv	a1,t3
8040c010:	00462b03          	lw	s6,4(a2)
8040c014:	fb9fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c018:	01012603          	lw	a2,16(sp)
8040c01c:	01412803          	lw	a6,20(sp)
8040c020:	00a62223          	sw	a0,4(a2)
8040c024:	01662423          	sw	s6,8(a2)
8040c028:	00050463          	beqz	a0,8040c030 <stride_dequeue+0x2d8c>
8040c02c:	00c52023          	sw	a2,0(a0)
8040c030:	008c2b03          	lw	s6,8(s8)
8040c034:	c71fd06f          	j	80409ca4 <stride_dequeue+0xa00>
8040c038:	00040993          	mv	s3,s0
8040c03c:	c7dfe06f          	j	8040acb8 <stride_dequeue+0x1a14>
8040c040:	008ca503          	lw	a0,8(s9)
8040c044:	004cab03          	lw	s6,4(s9)
8040c048:	000e0593          	mv	a1,t3
8040c04c:	01012a23          	sw	a6,20(sp)
8040c050:	f7dfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c054:	00aca223          	sw	a0,4(s9)
8040c058:	016ca423          	sw	s6,8(s9)
8040c05c:	01412803          	lw	a6,20(sp)
8040c060:	00050463          	beqz	a0,8040c068 <stride_dequeue+0x2dc4>
8040c064:	01952023          	sw	s9,0(a0)
8040c068:	008c2b03          	lw	s6,8(s8)
8040c06c:	971fd06f          	j	804099dc <stride_dequeue+0x738>
8040c070:	0089a503          	lw	a0,8(s3)
8040c074:	0049ab03          	lw	s6,4(s3)
8040c078:	00080593          	mv	a1,a6
8040c07c:	f51fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c080:	00a9a223          	sw	a0,4(s3)
8040c084:	0169a423          	sw	s6,8(s3)
8040c088:	00050463          	beqz	a0,8040c090 <stride_dequeue+0x2dec>
8040c08c:	01352023          	sw	s3,0(a0)
8040c090:	008c2b03          	lw	s6,8(s8)
8040c094:	ec5fe06f          	j	8040af58 <stride_dequeue+0x1cb4>
8040c098:	008a2503          	lw	a0,8(s4)
8040c09c:	004a2b03          	lw	s6,4(s4)
8040c0a0:	000e0593          	mv	a1,t3
8040c0a4:	01012a23          	sw	a6,20(sp)
8040c0a8:	f25fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c0ac:	00aa2223          	sw	a0,4(s4)
8040c0b0:	016a2423          	sw	s6,8(s4)
8040c0b4:	01412803          	lw	a6,20(sp)
8040c0b8:	00050463          	beqz	a0,8040c0c0 <stride_dequeue+0x2e1c>
8040c0bc:	01452023          	sw	s4,0(a0)
8040c0c0:	008c2b03          	lw	s6,8(s8)
8040c0c4:	a79fd06f          	j	80409b3c <stride_dequeue+0x898>
8040c0c8:	0089a503          	lw	a0,8(s3)
8040c0cc:	0049ab03          	lw	s6,4(s3)
8040c0d0:	00030593          	mv	a1,t1
8040c0d4:	01012a23          	sw	a6,20(sp)
8040c0d8:	00c12823          	sw	a2,16(sp)
8040c0dc:	ef1fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c0e0:	00a9a223          	sw	a0,4(s3)
8040c0e4:	0169a423          	sw	s6,8(s3)
8040c0e8:	01012603          	lw	a2,16(sp)
8040c0ec:	01412803          	lw	a6,20(sp)
8040c0f0:	06050ce3          	beqz	a0,8040c968 <stride_dequeue+0x36c4>
8040c0f4:	01352023          	sw	s3,0(a0)
8040c0f8:	00098313          	mv	t1,s3
8040c0fc:	008c2b03          	lw	s6,8(s8)
8040c100:	a2cff06f          	j	8040b32c <stride_dequeue+0x2088>
8040c104:	0089a503          	lw	a0,8(s3)
8040c108:	0049ab03          	lw	s6,4(s3)
8040c10c:	000e0593          	mv	a1,t3
8040c110:	01012a23          	sw	a6,20(sp)
8040c114:	eb9fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c118:	00a9a223          	sw	a0,4(s3)
8040c11c:	0169a423          	sw	s6,8(s3)
8040c120:	01412803          	lw	a6,20(sp)
8040c124:	00050463          	beqz	a0,8040c12c <stride_dequeue+0x2e88>
8040c128:	01352023          	sw	s3,0(a0)
8040c12c:	008c2b03          	lw	s6,8(s8)
8040c130:	86dfe06f          	j	8040a99c <stride_dequeue+0x16f8>
8040c134:	0089a503          	lw	a0,8(s3)
8040c138:	0049ab03          	lw	s6,4(s3)
8040c13c:	00030593          	mv	a1,t1
8040c140:	01012a23          	sw	a6,20(sp)
8040c144:	e89fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c148:	00a9a223          	sw	a0,4(s3)
8040c14c:	0169a423          	sw	s6,8(s3)
8040c150:	01412803          	lw	a6,20(sp)
8040c154:	76050663          	beqz	a0,8040c8c0 <stride_dequeue+0x361c>
8040c158:	01352023          	sw	s3,0(a0)
8040c15c:	00098313          	mv	t1,s3
8040c160:	008c2b03          	lw	s6,8(s8)
8040c164:	ad0ff06f          	j	8040b434 <stride_dequeue+0x2190>
8040c168:	0089a503          	lw	a0,8(s3)
8040c16c:	0049ab03          	lw	s6,4(s3)
8040c170:	000e0593          	mv	a1,t3
8040c174:	01112a23          	sw	a7,20(sp)
8040c178:	e55fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c17c:	00a9a223          	sw	a0,4(s3)
8040c180:	0169a423          	sw	s6,8(s3)
8040c184:	01412883          	lw	a7,20(sp)
8040c188:	00050463          	beqz	a0,8040c190 <stride_dequeue+0x2eec>
8040c18c:	01352023          	sw	s3,0(a0)
8040c190:	008c2b03          	lw	s6,8(s8)
8040c194:	f30fe06f          	j	8040a8c4 <stride_dequeue+0x1620>
8040c198:	008a2503          	lw	a0,8(s4)
8040c19c:	004a2b03          	lw	s6,4(s4)
8040c1a0:	00030593          	mv	a1,t1
8040c1a4:	e29fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c1a8:	00aa2223          	sw	a0,4(s4)
8040c1ac:	016a2423          	sw	s6,8(s4)
8040c1b0:	00050463          	beqz	a0,8040c1b8 <stride_dequeue+0x2f14>
8040c1b4:	01452023          	sw	s4,0(a0)
8040c1b8:	008c2b03          	lw	s6,8(s8)
8040c1bc:	e9dfd06f          	j	8040a058 <stride_dequeue+0xdb4>
8040c1c0:	0089a503          	lw	a0,8(s3)
8040c1c4:	0049ab03          	lw	s6,4(s3)
8040c1c8:	00088593          	mv	a1,a7
8040c1cc:	00c12623          	sw	a2,12(sp)
8040c1d0:	dfdfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c1d4:	00a9a223          	sw	a0,4(s3)
8040c1d8:	0169a423          	sw	s6,8(s3)
8040c1dc:	00c12603          	lw	a2,12(sp)
8040c1e0:	00050463          	beqz	a0,8040c1e8 <stride_dequeue+0x2f44>
8040c1e4:	01352023          	sw	s3,0(a0)
8040c1e8:	008c2b03          	lw	s6,8(s8)
8040c1ec:	bd4fe06f          	j	8040a5c0 <stride_dequeue+0x131c>
8040c1f0:	0088a503          	lw	a0,8(a7)
8040c1f4:	000e0593          	mv	a1,t3
8040c1f8:	0048ab03          	lw	s6,4(a7)
8040c1fc:	01112a23          	sw	a7,20(sp)
8040c200:	dcdfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c204:	01412883          	lw	a7,20(sp)
8040c208:	00a8a223          	sw	a0,4(a7)
8040c20c:	0168a423          	sw	s6,8(a7)
8040c210:	00050463          	beqz	a0,8040c218 <stride_dequeue+0x2f74>
8040c214:	01152023          	sw	a7,0(a0)
8040c218:	008c2b03          	lw	s6,8(s8)
8040c21c:	f51fd06f          	j	8040a16c <stride_dequeue+0xec8>
8040c220:	0089a503          	lw	a0,8(s3)
8040c224:	0049ab03          	lw	s6,4(s3)
8040c228:	00030593          	mv	a1,t1
8040c22c:	01112a23          	sw	a7,20(sp)
8040c230:	d9dfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c234:	00a9a223          	sw	a0,4(s3)
8040c238:	0169a423          	sw	s6,8(s3)
8040c23c:	01412883          	lw	a7,20(sp)
8040c240:	5e050863          	beqz	a0,8040c830 <stride_dequeue+0x358c>
8040c244:	01352023          	sw	s3,0(a0)
8040c248:	00098313          	mv	t1,s3
8040c24c:	008c2b03          	lw	s6,8(s8)
8040c250:	a64ff06f          	j	8040b4b4 <stride_dequeue+0x2210>
8040c254:	0089a503          	lw	a0,8(s3)
8040c258:	0049ab03          	lw	s6,4(s3)
8040c25c:	000d8593          	mv	a1,s11
8040c260:	01112823          	sw	a7,16(sp)
8040c264:	d69fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c268:	00a9a223          	sw	a0,4(s3)
8040c26c:	0169a423          	sw	s6,8(s3)
8040c270:	01012883          	lw	a7,16(sp)
8040c274:	00050463          	beqz	a0,8040c27c <stride_dequeue+0x2fd8>
8040c278:	01352023          	sw	s3,0(a0)
8040c27c:	008c2b03          	lw	s6,8(s8)
8040c280:	b19fe06f          	j	8040ad98 <stride_dequeue+0x1af4>
8040c284:	00080993          	mv	s3,a6
8040c288:	cd1fe06f          	j	8040af58 <stride_dequeue+0x1cb4>
8040c28c:	000d8993          	mv	s3,s11
8040c290:	b09fe06f          	j	8040ad98 <stride_dequeue+0x1af4>
8040c294:	00080993          	mv	s3,a6
8040c298:	d9dfe06f          	j	8040b034 <stride_dequeue+0x1d90>
8040c29c:	00080993          	mv	s3,a6
8040c2a0:	f75fe06f          	j	8040b214 <stride_dequeue+0x1f70>
8040c2a4:	00060993          	mv	s3,a2
8040c2a8:	e79fe06f          	j	8040b120 <stride_dequeue+0x1e7c>
8040c2ac:	000a0993          	mv	s3,s4
8040c2b0:	bc9fe06f          	j	8040ae78 <stride_dequeue+0x1bd4>
8040c2b4:	008c2b03          	lw	s6,8(s8)
8040c2b8:	000e0c93          	mv	s9,t3
8040c2bc:	f20fd06f          	j	804099dc <stride_dequeue+0x738>
8040c2c0:	008c2b03          	lw	s6,8(s8)
8040c2c4:	000e0613          	mv	a2,t3
8040c2c8:	9ddfd06f          	j	80409ca4 <stride_dequeue+0xa00>
8040c2cc:	0087a503          	lw	a0,8(a5)
8040c2d0:	00098593          	mv	a1,s3
8040c2d4:	0047ab03          	lw	s6,4(a5)
8040c2d8:	cf5fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c2dc:	01012783          	lw	a5,16(sp)
8040c2e0:	00a7a223          	sw	a0,4(a5)
8040c2e4:	0167a423          	sw	s6,8(a5)
8040c2e8:	68050663          	beqz	a0,8040c974 <stride_dequeue+0x36d0>
8040c2ec:	00f52023          	sw	a5,0(a0)
8040c2f0:	00078993          	mv	s3,a5
8040c2f4:	008c2b03          	lw	s6,8(s8)
8040c2f8:	ad4ff06f          	j	8040b5cc <stride_dequeue+0x2328>
8040c2fc:	008c2b03          	lw	s6,8(s8)
8040c300:	000e0a13          	mv	s4,t3
8040c304:	839fd06f          	j	80409b3c <stride_dequeue+0x898>
8040c308:	008c2b03          	lw	s6,8(s8)
8040c30c:	000e0993          	mv	s3,t3
8040c310:	f60fe06f          	j	8040aa70 <stride_dequeue+0x17cc>
8040c314:	008c2b03          	lw	s6,8(s8)
8040c318:	00098793          	mv	a5,s3
8040c31c:	8d9fe06f          	j	8040abf4 <stride_dequeue+0x1950>
8040c320:	008c2b03          	lw	s6,8(s8)
8040c324:	000e0993          	mv	s3,t3
8040c328:	e74fe06f          	j	8040a99c <stride_dequeue+0x16f8>
8040c32c:	0089a503          	lw	a0,8(s3)
8040c330:	0049ab03          	lw	s6,4(s3)
8040c334:	00088593          	mv	a1,a7
8040c338:	c95fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c33c:	00a9a223          	sw	a0,4(s3)
8040c340:	0169a423          	sw	s6,8(s3)
8040c344:	00050463          	beqz	a0,8040c34c <stride_dequeue+0x30a8>
8040c348:	01352023          	sw	s3,0(a0)
8040c34c:	008c2b03          	lw	s6,8(s8)
8040c350:	955fe06f          	j	8040aca4 <stride_dequeue+0x1a00>
8040c354:	008c2b03          	lw	s6,8(s8)
8040c358:	000e0893          	mv	a7,t3
8040c35c:	854fe06f          	j	8040a3b0 <stride_dequeue+0x110c>
8040c360:	0087a503          	lw	a0,8(a5)
8040c364:	000a0593          	mv	a1,s4
8040c368:	0047ab03          	lw	s6,4(a5)
8040c36c:	c61fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c370:	00c12783          	lw	a5,12(sp)
8040c374:	01012603          	lw	a2,16(sp)
8040c378:	00a7a223          	sw	a0,4(a5)
8040c37c:	0167a423          	sw	s6,8(a5)
8040c380:	52050a63          	beqz	a0,8040c8b4 <stride_dequeue+0x3610>
8040c384:	00f52023          	sw	a5,0(a0)
8040c388:	00078a13          	mv	s4,a5
8040c38c:	008c2b03          	lw	s6,8(s8)
8040c390:	9d0ff06f          	j	8040b560 <stride_dequeue+0x22bc>
8040c394:	008c2b03          	lw	s6,8(s8)
8040c398:	000e0893          	mv	a7,t3
8040c39c:	dd1fd06f          	j	8040a16c <stride_dequeue+0xec8>
8040c3a0:	008c2b03          	lw	s6,8(s8)
8040c3a4:	000e0993          	mv	s3,t3
8040c3a8:	d1cfe06f          	j	8040a8c4 <stride_dequeue+0x1620>
8040c3ac:	008c2b03          	lw	s6,8(s8)
8040c3b0:	000e0993          	mv	s3,t3
8040c3b4:	fa8fe06f          	j	8040ab5c <stride_dequeue+0x18b8>
8040c3b8:	008c2b03          	lw	s6,8(s8)
8040c3bc:	000e0893          	mv	a7,t3
8040c3c0:	ee1fd06f          	j	8040a2a0 <stride_dequeue+0xffc>
8040c3c4:	0087a503          	lw	a0,8(a5)
8040c3c8:	000c8593          	mv	a1,s9
8040c3cc:	0047ab03          	lw	s6,4(a5)
8040c3d0:	bfdfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c3d4:	01012783          	lw	a5,16(sp)
8040c3d8:	00a7a223          	sw	a0,4(a5)
8040c3dc:	0167a423          	sw	s6,8(a5)
8040c3e0:	44050e63          	beqz	a0,8040c83c <stride_dequeue+0x3598>
8040c3e4:	00f52023          	sw	a5,0(a0)
8040c3e8:	00078c93          	mv	s9,a5
8040c3ec:	008c2b03          	lw	s6,8(s8)
8040c3f0:	ab4ff06f          	j	8040b6a4 <stride_dequeue+0x2400>
8040c3f4:	0087a503          	lw	a0,8(a5)
8040c3f8:	000a0593          	mv	a1,s4
8040c3fc:	0047ab03          	lw	s6,4(a5)
8040c400:	bcdfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c404:	01012783          	lw	a5,16(sp)
8040c408:	00a7a223          	sw	a0,4(a5)
8040c40c:	0167a423          	sw	s6,8(a5)
8040c410:	52050463          	beqz	a0,8040c938 <stride_dequeue+0x3694>
8040c414:	00f52023          	sw	a5,0(a0)
8040c418:	00078a13          	mv	s4,a5
8040c41c:	008c2b03          	lw	s6,8(s8)
8040c420:	a18ff06f          	j	8040b638 <stride_dequeue+0x2394>
8040c424:	008c2b03          	lw	s6,8(s8)
8040c428:	00088993          	mv	s3,a7
8040c42c:	879fe06f          	j	8040aca4 <stride_dequeue+0x1a00>
8040c430:	0089a503          	lw	a0,8(s3)
8040c434:	0049ab03          	lw	s6,4(s3)
8040c438:	000e0593          	mv	a1,t3
8040c43c:	01012a23          	sw	a6,20(sp)
8040c440:	b8dfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c444:	00a9a223          	sw	a0,4(s3)
8040c448:	0169a423          	sw	s6,8(s3)
8040c44c:	01412803          	lw	a6,20(sp)
8040c450:	00050463          	beqz	a0,8040c458 <stride_dequeue+0x31b4>
8040c454:	01352023          	sw	s3,0(a0)
8040c458:	008c2b03          	lw	s6,8(s8)
8040c45c:	bc5fe06f          	j	8040b020 <stride_dequeue+0x1d7c>
8040c460:	00882503          	lw	a0,8(a6)
8040c464:	00098593          	mv	a1,s3
8040c468:	00482b03          	lw	s6,4(a6)
8040c46c:	b61fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c470:	01412803          	lw	a6,20(sp)
8040c474:	01812883          	lw	a7,24(sp)
8040c478:	00a82223          	sw	a0,4(a6)
8040c47c:	01682423          	sw	s6,8(a6)
8040c480:	4a050063          	beqz	a0,8040c920 <stride_dequeue+0x367c>
8040c484:	01052023          	sw	a6,0(a0)
8040c488:	00080993          	mv	s3,a6
8040c48c:	008c2b03          	lw	s6,8(s8)
8040c490:	a9cff06f          	j	8040b72c <stride_dequeue+0x2488>
8040c494:	0089a503          	lw	a0,8(s3)
8040c498:	0049ab03          	lw	s6,4(s3)
8040c49c:	000e0593          	mv	a1,t3
8040c4a0:	01112a23          	sw	a7,20(sp)
8040c4a4:	00c12823          	sw	a2,16(sp)
8040c4a8:	b25fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c4ac:	00a9a223          	sw	a0,4(s3)
8040c4b0:	0169a423          	sw	s6,8(s3)
8040c4b4:	01012603          	lw	a2,16(sp)
8040c4b8:	01412883          	lw	a7,20(sp)
8040c4bc:	00050463          	beqz	a0,8040c4c4 <stride_dequeue+0x3220>
8040c4c0:	01352023          	sw	s3,0(a0)
8040c4c4:	008c2b03          	lw	s6,8(s8)
8040c4c8:	c45fe06f          	j	8040b10c <stride_dequeue+0x1e68>
8040c4cc:	0088a503          	lw	a0,8(a7)
8040c4d0:	00098593          	mv	a1,s3
8040c4d4:	0048ab03          	lw	s6,4(a7)
8040c4d8:	af5fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c4dc:	01012883          	lw	a7,16(sp)
8040c4e0:	01412603          	lw	a2,20(sp)
8040c4e4:	01812803          	lw	a6,24(sp)
8040c4e8:	00a8a223          	sw	a0,4(a7)
8040c4ec:	0168a423          	sw	s6,8(a7)
8040c4f0:	48050863          	beqz	a0,8040c980 <stride_dequeue+0x36dc>
8040c4f4:	01152023          	sw	a7,0(a0)
8040c4f8:	00088993          	mv	s3,a7
8040c4fc:	008c2b03          	lw	s6,8(s8)
8040c500:	bc0ff06f          	j	8040b8c0 <stride_dequeue+0x261c>
8040c504:	00832503          	lw	a0,8(t1)
8040c508:	000c8593          	mv	a1,s9
8040c50c:	00432b03          	lw	s6,4(t1)
8040c510:	abdfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c514:	01412303          	lw	t1,20(sp)
8040c518:	01812883          	lw	a7,24(sp)
8040c51c:	00a32223          	sw	a0,4(t1)
8040c520:	01632423          	sw	s6,8(t1)
8040c524:	36050663          	beqz	a0,8040c890 <stride_dequeue+0x35ec>
8040c528:	00652023          	sw	t1,0(a0)
8040c52c:	00030c93          	mv	s9,t1
8040c530:	008c2b03          	lw	s6,8(s8)
8040c534:	e10ff06f          	j	8040bb44 <stride_dequeue+0x28a0>
8040c538:	0089a503          	lw	a0,8(s3)
8040c53c:	0049ab03          	lw	s6,4(s3)
8040c540:	000e0593          	mv	a1,t3
8040c544:	01112a23          	sw	a7,20(sp)
8040c548:	00c12823          	sw	a2,16(sp)
8040c54c:	a81fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c550:	00a9a223          	sw	a0,4(s3)
8040c554:	0169a423          	sw	s6,8(s3)
8040c558:	01012603          	lw	a2,16(sp)
8040c55c:	01412883          	lw	a7,20(sp)
8040c560:	00050463          	beqz	a0,8040c568 <stride_dequeue+0x32c4>
8040c564:	01352023          	sw	s3,0(a0)
8040c568:	008c2b03          	lw	s6,8(s8)
8040c56c:	840fe06f          	j	8040a5ac <stride_dequeue+0x1308>
8040c570:	0089a503          	lw	a0,8(s3)
8040c574:	0049ab03          	lw	s6,4(s3)
8040c578:	000e0593          	mv	a1,t3
8040c57c:	01012a23          	sw	a6,20(sp)
8040c580:	00c12823          	sw	a2,16(sp)
8040c584:	a49fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c588:	00a9a223          	sw	a0,4(s3)
8040c58c:	0169a423          	sw	s6,8(s3)
8040c590:	01012603          	lw	a2,16(sp)
8040c594:	01412803          	lw	a6,20(sp)
8040c598:	00050463          	beqz	a0,8040c5a0 <stride_dequeue+0x32fc>
8040c59c:	01352023          	sw	s3,0(a0)
8040c5a0:	008c2b03          	lw	s6,8(s8)
8040c5a4:	c5dfe06f          	j	8040b200 <stride_dequeue+0x1f5c>
8040c5a8:	00832503          	lw	a0,8(t1)
8040c5ac:	00080593          	mv	a1,a6
8040c5b0:	00432b03          	lw	s6,4(t1)
8040c5b4:	a19fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c5b8:	01412303          	lw	t1,20(sp)
8040c5bc:	00a32223          	sw	a0,4(t1)
8040c5c0:	01632423          	sw	s6,8(t1)
8040c5c4:	2e050263          	beqz	a0,8040c8a8 <stride_dequeue+0x3604>
8040c5c8:	00652023          	sw	t1,0(a0)
8040c5cc:	00030813          	mv	a6,t1
8040c5d0:	008c2b03          	lw	s6,8(s8)
8040c5d4:	bf0ff06f          	j	8040b9c4 <stride_dequeue+0x2720>
8040c5d8:	00832503          	lw	a0,8(t1)
8040c5dc:	00080593          	mv	a1,a6
8040c5e0:	00432b03          	lw	s6,4(t1)
8040c5e4:	9e9fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c5e8:	01412303          	lw	t1,20(sp)
8040c5ec:	00a32223          	sw	a0,4(t1)
8040c5f0:	01632423          	sw	s6,8(t1)
8040c5f4:	2e050263          	beqz	a0,8040c8d8 <stride_dequeue+0x3634>
8040c5f8:	00652023          	sw	t1,0(a0)
8040c5fc:	00030813          	mv	a6,t1
8040c600:	008c2b03          	lw	s6,8(s8)
8040c604:	b38ff06f          	j	8040b93c <stride_dequeue+0x2698>
8040c608:	00882503          	lw	a0,8(a6)
8040c60c:	00098593          	mv	a1,s3
8040c610:	00482b03          	lw	s6,4(a6)
8040c614:	9b9fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c618:	01412803          	lw	a6,20(sp)
8040c61c:	01812883          	lw	a7,24(sp)
8040c620:	00a82223          	sw	a0,4(a6)
8040c624:	01682423          	sw	s6,8(a6)
8040c628:	22050663          	beqz	a0,8040c854 <stride_dequeue+0x35b0>
8040c62c:	01052023          	sw	a6,0(a0)
8040c630:	00080993          	mv	s3,a6
8040c634:	008c2b03          	lw	s6,8(s8)
8040c638:	970ff06f          	j	8040b7a8 <stride_dequeue+0x2504>
8040c63c:	00832503          	lw	a0,8(t1)
8040c640:	00080593          	mv	a1,a6
8040c644:	00432b03          	lw	s6,4(t1)
8040c648:	985fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c64c:	01012303          	lw	t1,16(sp)
8040c650:	01412603          	lw	a2,20(sp)
8040c654:	00a32223          	sw	a0,4(t1)
8040c658:	01632423          	sw	s6,8(t1)
8040c65c:	2e050a63          	beqz	a0,8040c950 <stride_dequeue+0x36ac>
8040c660:	00652023          	sw	t1,0(a0)
8040c664:	00030813          	mv	a6,t1
8040c668:	008c2b03          	lw	s6,8(s8)
8040c66c:	d70ff06f          	j	8040bbdc <stride_dequeue+0x2938>
8040c670:	008a2503          	lw	a0,8(s4)
8040c674:	004a2b03          	lw	s6,4(s4)
8040c678:	000e0593          	mv	a1,t3
8040c67c:	00612a23          	sw	t1,20(sp)
8040c680:	94dfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c684:	00aa2223          	sw	a0,4(s4)
8040c688:	016a2423          	sw	s6,8(s4)
8040c68c:	01412303          	lw	t1,20(sp)
8040c690:	00050463          	beqz	a0,8040c698 <stride_dequeue+0x33f4>
8040c694:	01452023          	sw	s4,0(a0)
8040c698:	008c2b03          	lw	s6,8(s8)
8040c69c:	9a9fd06f          	j	8040a044 <stride_dequeue+0xda0>
8040c6a0:	0089a503          	lw	a0,8(s3)
8040c6a4:	0049ab03          	lw	s6,4(s3)
8040c6a8:	000e0593          	mv	a1,t3
8040c6ac:	01112a23          	sw	a7,20(sp)
8040c6b0:	91dfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c6b4:	00a9a223          	sw	a0,4(s3)
8040c6b8:	0169a423          	sw	s6,8(s3)
8040c6bc:	01412883          	lw	a7,20(sp)
8040c6c0:	00050463          	beqz	a0,8040c6c8 <stride_dequeue+0x3424>
8040c6c4:	01352023          	sw	s3,0(a0)
8040c6c8:	008c2b03          	lw	s6,8(s8)
8040c6cc:	f98fe06f          	j	8040ae64 <stride_dequeue+0x1bc0>
8040c6d0:	0089a503          	lw	a0,8(s3)
8040c6d4:	0049ab03          	lw	s6,4(s3)
8040c6d8:	000e0593          	mv	a1,t3
8040c6dc:	01012a23          	sw	a6,20(sp)
8040c6e0:	8edfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c6e4:	00a9a223          	sw	a0,4(s3)
8040c6e8:	0169a423          	sw	s6,8(s3)
8040c6ec:	01412803          	lw	a6,20(sp)
8040c6f0:	00050463          	beqz	a0,8040c6f8 <stride_dequeue+0x3454>
8040c6f4:	01352023          	sw	s3,0(a0)
8040c6f8:	008c2b03          	lw	s6,8(s8)
8040c6fc:	849fe06f          	j	8040af44 <stride_dequeue+0x1ca0>
8040c700:	0089a503          	lw	a0,8(s3)
8040c704:	0049ab03          	lw	s6,4(s3)
8040c708:	000e0593          	mv	a1,t3
8040c70c:	01112a23          	sw	a7,20(sp)
8040c710:	8bdfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c714:	00a9a223          	sw	a0,4(s3)
8040c718:	0169a423          	sw	s6,8(s3)
8040c71c:	01412883          	lw	a7,20(sp)
8040c720:	00050463          	beqz	a0,8040c728 <stride_dequeue+0x3484>
8040c724:	01352023          	sw	s3,0(a0)
8040c728:	008c2b03          	lw	s6,8(s8)
8040c72c:	f99fd06f          	j	8040a6c4 <stride_dequeue+0x1420>
8040c730:	0088a503          	lw	a0,8(a7)
8040c734:	00098593          	mv	a1,s3
8040c738:	0048ab03          	lw	s6,4(a7)
8040c73c:	891fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c740:	01412883          	lw	a7,20(sp)
8040c744:	01812803          	lw	a6,24(sp)
8040c748:	00a8a223          	sw	a0,4(a7)
8040c74c:	0168a423          	sw	s6,8(a7)
8040c750:	0e050c63          	beqz	a0,8040c848 <stride_dequeue+0x35a4>
8040c754:	01152023          	sw	a7,0(a0)
8040c758:	00088993          	mv	s3,a7
8040c75c:	008c2b03          	lw	s6,8(s8)
8040c760:	ae0ff06f          	j	8040ba40 <stride_dequeue+0x279c>
8040c764:	00882503          	lw	a0,8(a6)
8040c768:	00098593          	mv	a1,s3
8040c76c:	00482b03          	lw	s6,4(a6)
8040c770:	85dfc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c774:	01012803          	lw	a6,16(sp)
8040c778:	01412603          	lw	a2,20(sp)
8040c77c:	01812883          	lw	a7,24(sp)
8040c780:	00a82223          	sw	a0,4(a6)
8040c784:	01682423          	sw	s6,8(a6)
8040c788:	16050463          	beqz	a0,8040c8f0 <stride_dequeue+0x364c>
8040c78c:	01052023          	sw	a6,0(a0)
8040c790:	00080993          	mv	s3,a6
8040c794:	008c2b03          	lw	s6,8(s8)
8040c798:	89cff06f          	j	8040b834 <stride_dequeue+0x2590>
8040c79c:	0089a503          	lw	a0,8(s3)
8040c7a0:	0049ab03          	lw	s6,4(s3)
8040c7a4:	000e0593          	mv	a1,t3
8040c7a8:	01112a23          	sw	a7,20(sp)
8040c7ac:	821fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c7b0:	00a9a223          	sw	a0,4(s3)
8040c7b4:	0169a423          	sw	s6,8(s3)
8040c7b8:	01412883          	lw	a7,20(sp)
8040c7bc:	00050463          	beqz	a0,8040c7c4 <stride_dequeue+0x3520>
8040c7c0:	01352023          	sw	s3,0(a0)
8040c7c4:	008c2b03          	lw	s6,8(s8)
8040c7c8:	810fe06f          	j	8040a7d8 <stride_dequeue+0x1534>
8040c7cc:	0089a503          	lw	a0,8(s3)
8040c7d0:	0049ab03          	lw	s6,4(s3)
8040c7d4:	000e0593          	mv	a1,t3
8040c7d8:	01112a23          	sw	a7,20(sp)
8040c7dc:	ff0fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c7e0:	00a9a223          	sw	a0,4(s3)
8040c7e4:	0169a423          	sw	s6,8(s3)
8040c7e8:	01412883          	lw	a7,20(sp)
8040c7ec:	00050463          	beqz	a0,8040c7f4 <stride_dequeue+0x3550>
8040c7f0:	01352023          	sw	s3,0(a0)
8040c7f4:	008c2b03          	lw	s6,8(s8)
8040c7f8:	d8cfe06f          	j	8040ad84 <stride_dequeue+0x1ae0>
8040c7fc:	0088a503          	lw	a0,8(a7)
8040c800:	00098593          	mv	a1,s3
8040c804:	0048ab03          	lw	s6,4(a7)
8040c808:	fc4fc0ef          	jal	ra,80408fcc <skew_heap_merge.constprop.3>
8040c80c:	01412883          	lw	a7,20(sp)
8040c810:	01812803          	lw	a6,24(sp)
8040c814:	00a8a223          	sw	a0,4(a7)
8040c818:	0168a423          	sw	s6,8(a7)
8040c81c:	04050263          	beqz	a0,8040c860 <stride_dequeue+0x35bc>
8040c820:	01152023          	sw	a7,0(a0)
8040c824:	00088993          	mv	s3,a7
8040c828:	008c2b03          	lw	s6,8(s8)
8040c82c:	a9cff06f          	j	8040bac8 <stride_dequeue+0x2824>
8040c830:	008c2b03          	lw	s6,8(s8)
8040c834:	00098313          	mv	t1,s3
8040c838:	c7dfe06f          	j	8040b4b4 <stride_dequeue+0x2210>
8040c83c:	008c2b03          	lw	s6,8(s8)
8040c840:	00078c93          	mv	s9,a5
8040c844:	e61fe06f          	j	8040b6a4 <stride_dequeue+0x2400>
8040c848:	008c2b03          	lw	s6,8(s8)
8040c84c:	00088993          	mv	s3,a7
8040c850:	9f0ff06f          	j	8040ba40 <stride_dequeue+0x279c>
8040c854:	008c2b03          	lw	s6,8(s8)
8040c858:	00080993          	mv	s3,a6
8040c85c:	f4dfe06f          	j	8040b7a8 <stride_dequeue+0x2504>
8040c860:	008c2b03          	lw	s6,8(s8)
8040c864:	00088993          	mv	s3,a7
8040c868:	a60ff06f          	j	8040bac8 <stride_dequeue+0x2824>
8040c86c:	008c2b03          	lw	s6,8(s8)
8040c870:	000e0993          	mv	s3,t3
8040c874:	df0fe06f          	j	8040ae64 <stride_dequeue+0x1bc0>
8040c878:	008c2b03          	lw	s6,8(s8)
8040c87c:	000e0993          	mv	s3,t3
8040c880:	ec4fe06f          	j	8040af44 <stride_dequeue+0x1ca0>
8040c884:	008c2b03          	lw	s6,8(s8)
8040c888:	000e0993          	mv	s3,t3
8040c88c:	d21fd06f          	j	8040a5ac <stride_dequeue+0x1308>
8040c890:	008c2b03          	lw	s6,8(s8)
8040c894:	00030c93          	mv	s9,t1
8040c898:	aacff06f          	j	8040bb44 <stride_dequeue+0x28a0>
8040c89c:	008c2b03          	lw	s6,8(s8)
8040c8a0:	000e0993          	mv	s3,t3
8040c8a4:	95dfe06f          	j	8040b200 <stride_dequeue+0x1f5c>
8040c8a8:	008c2b03          	lw	s6,8(s8)
8040c8ac:	00030813          	mv	a6,t1
8040c8b0:	914ff06f          	j	8040b9c4 <stride_dequeue+0x2720>
8040c8b4:	008c2b03          	lw	s6,8(s8)
8040c8b8:	00078a13          	mv	s4,a5
8040c8bc:	ca5fe06f          	j	8040b560 <stride_dequeue+0x22bc>
8040c8c0:	008c2b03          	lw	s6,8(s8)
8040c8c4:	00098313          	mv	t1,s3
8040c8c8:	b6dfe06f          	j	8040b434 <stride_dequeue+0x2190>
8040c8cc:	008c2b03          	lw	s6,8(s8)
8040c8d0:	000e0993          	mv	s3,t3
8040c8d4:	cb0fe06f          	j	8040ad84 <stride_dequeue+0x1ae0>
8040c8d8:	008c2b03          	lw	s6,8(s8)
8040c8dc:	00030813          	mv	a6,t1
8040c8e0:	85cff06f          	j	8040b93c <stride_dequeue+0x2698>
8040c8e4:	008c2b03          	lw	s6,8(s8)
8040c8e8:	000e0993          	mv	s3,t3
8040c8ec:	eedfd06f          	j	8040a7d8 <stride_dequeue+0x1534>
8040c8f0:	008c2b03          	lw	s6,8(s8)
8040c8f4:	00080993          	mv	s3,a6
8040c8f8:	f3dfe06f          	j	8040b834 <stride_dequeue+0x2590>
8040c8fc:	008c2b03          	lw	s6,8(s8)
8040c900:	00098313          	mv	t1,s3
8040c904:	aadfe06f          	j	8040b3b0 <stride_dequeue+0x210c>
8040c908:	008c2b03          	lw	s6,8(s8)
8040c90c:	000e0993          	mv	s3,t3
8040c910:	f10fe06f          	j	8040b020 <stride_dequeue+0x1d7c>
8040c914:	008c2b03          	lw	s6,8(s8)
8040c918:	000e0993          	mv	s3,t3
8040c91c:	ff0fe06f          	j	8040b10c <stride_dequeue+0x1e68>
8040c920:	008c2b03          	lw	s6,8(s8)
8040c924:	00080993          	mv	s3,a6
8040c928:	e05fe06f          	j	8040b72c <stride_dequeue+0x2488>
8040c92c:	008c2b03          	lw	s6,8(s8)
8040c930:	000e0993          	mv	s3,t3
8040c934:	d91fd06f          	j	8040a6c4 <stride_dequeue+0x1420>
8040c938:	008c2b03          	lw	s6,8(s8)
8040c93c:	00078a13          	mv	s4,a5
8040c940:	cf9fe06f          	j	8040b638 <stride_dequeue+0x2394>
8040c944:	008c2b03          	lw	s6,8(s8)
8040c948:	000e0a13          	mv	s4,t3
8040c94c:	ef8fd06f          	j	8040a044 <stride_dequeue+0xda0>
8040c950:	008c2b03          	lw	s6,8(s8)
8040c954:	00030813          	mv	a6,t1
8040c958:	a84ff06f          	j	8040bbdc <stride_dequeue+0x2938>
8040c95c:	008c2b03          	lw	s6,8(s8)
8040c960:	00098813          	mv	a6,s3
8040c964:	931fe06f          	j	8040b294 <stride_dequeue+0x1ff0>
8040c968:	008c2b03          	lw	s6,8(s8)
8040c96c:	00098313          	mv	t1,s3
8040c970:	9bdfe06f          	j	8040b32c <stride_dequeue+0x2088>
8040c974:	008c2b03          	lw	s6,8(s8)
8040c978:	00078993          	mv	s3,a5
8040c97c:	c51fe06f          	j	8040b5cc <stride_dequeue+0x2328>
8040c980:	008c2b03          	lw	s6,8(s8)
8040c984:	00088993          	mv	s3,a7
8040c988:	f39fe06f          	j	8040b8c0 <stride_dequeue+0x261c>

8040c98c <sched_init>:
8040c98c:	ff010113          	addi	sp,sp,-16
8040c990:	0008c697          	auipc	a3,0x8c
8040c994:	69068693          	addi	a3,a3,1680 # 80499020 <default_sched_class>
8040c998:	00812423          	sw	s0,8(sp)
8040c99c:	00112623          	sw	ra,12(sp)
8040c9a0:	00090797          	auipc	a5,0x90
8040c9a4:	e2878793          	addi	a5,a5,-472 # 8049c7c8 <timer_list>
8040c9a8:	0046a603          	lw	a2,4(a3)
8040c9ac:	0008f717          	auipc	a4,0x8f
8040c9b0:	d9c70713          	addi	a4,a4,-612 # 8049b748 <__rq>
8040c9b4:	00f7a223          	sw	a5,4(a5)
8040c9b8:	00f7a023          	sw	a5,0(a5)
8040c9bc:	00500793          	li	a5,5
8040c9c0:	00090417          	auipc	s0,0x90
8040c9c4:	e0440413          	addi	s0,s0,-508 # 8049c7c4 <sched_class>
8040c9c8:	00f72623          	sw	a5,12(a4)
8040c9cc:	00070513          	mv	a0,a4
8040c9d0:	00d42023          	sw	a3,0(s0)
8040c9d4:	00090797          	auipc	a5,0x90
8040c9d8:	dee7a623          	sw	a4,-532(a5) # 8049c7c0 <rq>
8040c9dc:	000600e7          	jalr	a2
8040c9e0:	00042783          	lw	a5,0(s0)
8040c9e4:	00812403          	lw	s0,8(sp)
8040c9e8:	00c12083          	lw	ra,12(sp)
8040c9ec:	0007a583          	lw	a1,0(a5)
8040c9f0:	00008517          	auipc	a0,0x8
8040c9f4:	f6450513          	addi	a0,a0,-156 # 80414954 <CSWTCH.69+0xa88>
8040c9f8:	01010113          	addi	sp,sp,16
8040c9fc:	801f306f          	j	804001fc <cprintf>

8040ca00 <wakeup_proc>:
8040ca00:	00052703          	lw	a4,0(a0)
8040ca04:	ff010113          	addi	sp,sp,-16
8040ca08:	00112623          	sw	ra,12(sp)
8040ca0c:	00812423          	sw	s0,8(sp)
8040ca10:	00912223          	sw	s1,4(sp)
8040ca14:	00300793          	li	a5,3
8040ca18:	0cf70263          	beq	a4,a5,8040cadc <wakeup_proc+0xdc>
8040ca1c:	00050413          	mv	s0,a0
8040ca20:	100027f3          	csrr	a5,sstatus
8040ca24:	0027f793          	andi	a5,a5,2
8040ca28:	00000493          	li	s1,0
8040ca2c:	0a079063          	bnez	a5,8040cacc <wakeup_proc+0xcc>
8040ca30:	00200793          	li	a5,2
8040ca34:	06f70e63          	beq	a4,a5,8040cab0 <wakeup_proc+0xb0>
8040ca38:	00090717          	auipc	a4,0x90
8040ca3c:	d7870713          	addi	a4,a4,-648 # 8049c7b0 <current>
8040ca40:	00072703          	lw	a4,0(a4)
8040ca44:	0a042423          	sw	zero,168(s0)
8040ca48:	00f42023          	sw	a5,0(s0)
8040ca4c:	02870c63          	beq	a4,s0,8040ca84 <wakeup_proc+0x84>
8040ca50:	00090797          	auipc	a5,0x90
8040ca54:	d6478793          	addi	a5,a5,-668 # 8049c7b4 <idleproc>
8040ca58:	0007a783          	lw	a5,0(a5)
8040ca5c:	02f40463          	beq	s0,a5,8040ca84 <wakeup_proc+0x84>
8040ca60:	00090797          	auipc	a5,0x90
8040ca64:	d6478793          	addi	a5,a5,-668 # 8049c7c4 <sched_class>
8040ca68:	0007a783          	lw	a5,0(a5)
8040ca6c:	00090717          	auipc	a4,0x90
8040ca70:	d5470713          	addi	a4,a4,-684 # 8049c7c0 <rq>
8040ca74:	00072503          	lw	a0,0(a4)
8040ca78:	0087a783          	lw	a5,8(a5)
8040ca7c:	00040593          	mv	a1,s0
8040ca80:	000780e7          	jalr	a5
8040ca84:	00049c63          	bnez	s1,8040ca9c <wakeup_proc+0x9c>
8040ca88:	00c12083          	lw	ra,12(sp)
8040ca8c:	00812403          	lw	s0,8(sp)
8040ca90:	00412483          	lw	s1,4(sp)
8040ca94:	01010113          	addi	sp,sp,16
8040ca98:	00008067          	ret
8040ca9c:	00812403          	lw	s0,8(sp)
8040caa0:	00c12083          	lw	ra,12(sp)
8040caa4:	00412483          	lw	s1,4(sp)
8040caa8:	01010113          	addi	sp,sp,16
8040caac:	978f406f          	j	80400c24 <intr_enable>
8040cab0:	00008617          	auipc	a2,0x8
8040cab4:	eec60613          	addi	a2,a2,-276 # 8041499c <CSWTCH.69+0xad0>
8040cab8:	04800593          	li	a1,72
8040cabc:	00008517          	auipc	a0,0x8
8040cac0:	ec850513          	addi	a0,a0,-312 # 80414984 <CSWTCH.69+0xab8>
8040cac4:	be5f30ef          	jal	ra,804006a8 <__warn>
8040cac8:	fbdff06f          	j	8040ca84 <wakeup_proc+0x84>
8040cacc:	960f40ef          	jal	ra,80400c2c <intr_disable>
8040cad0:	00042703          	lw	a4,0(s0)
8040cad4:	00100493          	li	s1,1
8040cad8:	f59ff06f          	j	8040ca30 <wakeup_proc+0x30>
8040cadc:	00008697          	auipc	a3,0x8
8040cae0:	e8c68693          	addi	a3,a3,-372 # 80414968 <CSWTCH.69+0xa9c>
8040cae4:	00006617          	auipc	a2,0x6
8040cae8:	18860613          	addi	a2,a2,392 # 80412c6c <commands+0x1bc>
8040caec:	03c00593          	li	a1,60
8040caf0:	00008517          	auipc	a0,0x8
8040caf4:	e9450513          	addi	a0,a0,-364 # 80414984 <CSWTCH.69+0xab8>
8040caf8:	b2df30ef          	jal	ra,80400624 <__panic>

8040cafc <schedule>:
8040cafc:	fe010113          	addi	sp,sp,-32
8040cb00:	00112e23          	sw	ra,28(sp)
8040cb04:	00812c23          	sw	s0,24(sp)
8040cb08:	00912a23          	sw	s1,20(sp)
8040cb0c:	01212823          	sw	s2,16(sp)
8040cb10:	01312623          	sw	s3,12(sp)
8040cb14:	01412423          	sw	s4,8(sp)
8040cb18:	100027f3          	csrr	a5,sstatus
8040cb1c:	0027f793          	andi	a5,a5,2
8040cb20:	00000a13          	li	s4,0
8040cb24:	0e079e63          	bnez	a5,8040cc20 <schedule+0x124>
8040cb28:	00090497          	auipc	s1,0x90
8040cb2c:	c8848493          	addi	s1,s1,-888 # 8049c7b0 <current>
8040cb30:	0004a583          	lw	a1,0(s1)
8040cb34:	00090997          	auipc	s3,0x90
8040cb38:	c9098993          	addi	s3,s3,-880 # 8049c7c4 <sched_class>
8040cb3c:	00090917          	auipc	s2,0x90
8040cb40:	c8490913          	addi	s2,s2,-892 # 8049c7c0 <rq>
8040cb44:	0005a683          	lw	a3,0(a1)
8040cb48:	0005a823          	sw	zero,16(a1)
8040cb4c:	00200713          	li	a4,2
8040cb50:	0009a783          	lw	a5,0(s3)
8040cb54:	00092503          	lw	a0,0(s2)
8040cb58:	06e68463          	beq	a3,a4,8040cbc0 <schedule+0xc4>
8040cb5c:	0107a783          	lw	a5,16(a5)
8040cb60:	000780e7          	jalr	a5
8040cb64:	00050413          	mv	s0,a0
8040cb68:	08050463          	beqz	a0,8040cbf0 <schedule+0xf4>
8040cb6c:	0009a783          	lw	a5,0(s3)
8040cb70:	00092503          	lw	a0,0(s2)
8040cb74:	00040593          	mv	a1,s0
8040cb78:	00c7a783          	lw	a5,12(a5)
8040cb7c:	000780e7          	jalr	a5
8040cb80:	00842783          	lw	a5,8(s0)
8040cb84:	0004a703          	lw	a4,0(s1)
8040cb88:	00178793          	addi	a5,a5,1
8040cb8c:	00f42423          	sw	a5,8(s0)
8040cb90:	00870663          	beq	a4,s0,8040cb9c <schedule+0xa0>
8040cb94:	00040513          	mv	a0,s0
8040cb98:	f14fa0ef          	jal	ra,804072ac <proc_run>
8040cb9c:	060a1263          	bnez	s4,8040cc00 <schedule+0x104>
8040cba0:	01c12083          	lw	ra,28(sp)
8040cba4:	01812403          	lw	s0,24(sp)
8040cba8:	01412483          	lw	s1,20(sp)
8040cbac:	01012903          	lw	s2,16(sp)
8040cbb0:	00c12983          	lw	s3,12(sp)
8040cbb4:	00812a03          	lw	s4,8(sp)
8040cbb8:	02010113          	addi	sp,sp,32
8040cbbc:	00008067          	ret
8040cbc0:	00090717          	auipc	a4,0x90
8040cbc4:	bf470713          	addi	a4,a4,-1036 # 8049c7b4 <idleproc>
8040cbc8:	00072703          	lw	a4,0(a4)
8040cbcc:	f8e588e3          	beq	a1,a4,8040cb5c <schedule+0x60>
8040cbd0:	0087a783          	lw	a5,8(a5)
8040cbd4:	000780e7          	jalr	a5
8040cbd8:	0009a783          	lw	a5,0(s3)
8040cbdc:	00092503          	lw	a0,0(s2)
8040cbe0:	0107a783          	lw	a5,16(a5)
8040cbe4:	000780e7          	jalr	a5
8040cbe8:	00050413          	mv	s0,a0
8040cbec:	f80510e3          	bnez	a0,8040cb6c <schedule+0x70>
8040cbf0:	00090797          	auipc	a5,0x90
8040cbf4:	bc478793          	addi	a5,a5,-1084 # 8049c7b4 <idleproc>
8040cbf8:	0007a403          	lw	s0,0(a5)
8040cbfc:	f85ff06f          	j	8040cb80 <schedule+0x84>
8040cc00:	01812403          	lw	s0,24(sp)
8040cc04:	01c12083          	lw	ra,28(sp)
8040cc08:	01412483          	lw	s1,20(sp)
8040cc0c:	01012903          	lw	s2,16(sp)
8040cc10:	00c12983          	lw	s3,12(sp)
8040cc14:	00812a03          	lw	s4,8(sp)
8040cc18:	02010113          	addi	sp,sp,32
8040cc1c:	808f406f          	j	80400c24 <intr_enable>
8040cc20:	80cf40ef          	jal	ra,80400c2c <intr_disable>
8040cc24:	00100a13          	li	s4,1
8040cc28:	f01ff06f          	j	8040cb28 <schedule+0x2c>

8040cc2c <add_timer>:
8040cc2c:	fe010113          	addi	sp,sp,-32
8040cc30:	00112e23          	sw	ra,28(sp)
8040cc34:	100027f3          	csrr	a5,sstatus
8040cc38:	0027f793          	andi	a5,a5,2
8040cc3c:	00000813          	li	a6,0
8040cc40:	0a079263          	bnez	a5,8040cce4 <add_timer+0xb8>
8040cc44:	00052703          	lw	a4,0(a0)
8040cc48:	0a070863          	beqz	a4,8040ccf8 <add_timer+0xcc>
8040cc4c:	00452783          	lw	a5,4(a0)
8040cc50:	0a078463          	beqz	a5,8040ccf8 <add_timer+0xcc>
8040cc54:	00c52783          	lw	a5,12(a0)
8040cc58:	00850593          	addi	a1,a0,8
8040cc5c:	0af59e63          	bne	a1,a5,8040cd18 <add_timer+0xec>
8040cc60:	00090617          	auipc	a2,0x90
8040cc64:	b6860613          	addi	a2,a2,-1176 # 8049c7c8 <timer_list>
8040cc68:	00462783          	lw	a5,4(a2)
8040cc6c:	00c79c63          	bne	a5,a2,8040cc84 <add_timer+0x58>
8040cc70:	0480006f          	j	8040ccb8 <add_timer+0x8c>
8040cc74:	0047a783          	lw	a5,4(a5)
8040cc78:	40d70733          	sub	a4,a4,a3
8040cc7c:	00e52023          	sw	a4,0(a0)
8040cc80:	02c78c63          	beq	a5,a2,8040ccb8 <add_timer+0x8c>
8040cc84:	ff87a683          	lw	a3,-8(a5)
8040cc88:	fed776e3          	bgeu	a4,a3,8040cc74 <add_timer+0x48>
8040cc8c:	40e68733          	sub	a4,a3,a4
8040cc90:	fee7ac23          	sw	a4,-8(a5)
8040cc94:	0007a703          	lw	a4,0(a5)
8040cc98:	00b7a023          	sw	a1,0(a5)
8040cc9c:	00b72223          	sw	a1,4(a4)
8040cca0:	00f52623          	sw	a5,12(a0)
8040cca4:	00e52423          	sw	a4,8(a0)
8040cca8:	02080863          	beqz	a6,8040ccd8 <add_timer+0xac>
8040ccac:	01c12083          	lw	ra,28(sp)
8040ccb0:	02010113          	addi	sp,sp,32
8040ccb4:	f71f306f          	j	80400c24 <intr_enable>
8040ccb8:	00090797          	auipc	a5,0x90
8040ccbc:	b1078793          	addi	a5,a5,-1264 # 8049c7c8 <timer_list>
8040ccc0:	0007a703          	lw	a4,0(a5)
8040ccc4:	00b7a023          	sw	a1,0(a5)
8040ccc8:	00b72223          	sw	a1,4(a4)
8040cccc:	00f52623          	sw	a5,12(a0)
8040ccd0:	00e52423          	sw	a4,8(a0)
8040ccd4:	fc081ce3          	bnez	a6,8040ccac <add_timer+0x80>
8040ccd8:	01c12083          	lw	ra,28(sp)
8040ccdc:	02010113          	addi	sp,sp,32
8040cce0:	00008067          	ret
8040cce4:	00a12623          	sw	a0,12(sp)
8040cce8:	f45f30ef          	jal	ra,80400c2c <intr_disable>
8040ccec:	00100813          	li	a6,1
8040ccf0:	00c12503          	lw	a0,12(sp)
8040ccf4:	f51ff06f          	j	8040cc44 <add_timer+0x18>
8040ccf8:	00008697          	auipc	a3,0x8
8040ccfc:	bb468693          	addi	a3,a3,-1100 # 804148ac <CSWTCH.69+0x9e0>
8040cd00:	00006617          	auipc	a2,0x6
8040cd04:	f6c60613          	addi	a2,a2,-148 # 80412c6c <commands+0x1bc>
8040cd08:	06b00593          	li	a1,107
8040cd0c:	00008517          	auipc	a0,0x8
8040cd10:	c7850513          	addi	a0,a0,-904 # 80414984 <CSWTCH.69+0xab8>
8040cd14:	911f30ef          	jal	ra,80400624 <__panic>
8040cd18:	00008697          	auipc	a3,0x8
8040cd1c:	bc068693          	addi	a3,a3,-1088 # 804148d8 <CSWTCH.69+0xa0c>
8040cd20:	00006617          	auipc	a2,0x6
8040cd24:	f4c60613          	addi	a2,a2,-180 # 80412c6c <commands+0x1bc>
8040cd28:	06c00593          	li	a1,108
8040cd2c:	00008517          	auipc	a0,0x8
8040cd30:	c5850513          	addi	a0,a0,-936 # 80414984 <CSWTCH.69+0xab8>
8040cd34:	8f1f30ef          	jal	ra,80400624 <__panic>

8040cd38 <del_timer>:
8040cd38:	fe010113          	addi	sp,sp,-32
8040cd3c:	00112e23          	sw	ra,28(sp)
8040cd40:	00812c23          	sw	s0,24(sp)
8040cd44:	100027f3          	csrr	a5,sstatus
8040cd48:	0027f793          	andi	a5,a5,2
8040cd4c:	00850413          	addi	s0,a0,8
8040cd50:	06079c63          	bnez	a5,8040cdc8 <del_timer+0x90>
8040cd54:	00c52783          	lw	a5,12(a0)
8040cd58:	06f40063          	beq	s0,a5,8040cdb8 <del_timer+0x80>
8040cd5c:	00052683          	lw	a3,0(a0)
8040cd60:	00852703          	lw	a4,8(a0)
8040cd64:	04068263          	beqz	a3,8040cda8 <del_timer+0x70>
8040cd68:	00090617          	auipc	a2,0x90
8040cd6c:	a6060613          	addi	a2,a2,-1440 # 8049c7c8 <timer_list>
8040cd70:	00000593          	li	a1,0
8040cd74:	02c78a63          	beq	a5,a2,8040cda8 <del_timer+0x70>
8040cd78:	ff87a603          	lw	a2,-8(a5)
8040cd7c:	00d606b3          	add	a3,a2,a3
8040cd80:	fed7ac23          	sw	a3,-8(a5)
8040cd84:	00f72223          	sw	a5,4(a4)
8040cd88:	00e7a023          	sw	a4,0(a5)
8040cd8c:	00852623          	sw	s0,12(a0)
8040cd90:	00852423          	sw	s0,8(a0)
8040cd94:	02058263          	beqz	a1,8040cdb8 <del_timer+0x80>
8040cd98:	01812403          	lw	s0,24(sp)
8040cd9c:	01c12083          	lw	ra,28(sp)
8040cda0:	02010113          	addi	sp,sp,32
8040cda4:	e81f306f          	j	80400c24 <intr_enable>
8040cda8:	00f72223          	sw	a5,4(a4)
8040cdac:	00e7a023          	sw	a4,0(a5)
8040cdb0:	00852623          	sw	s0,12(a0)
8040cdb4:	00852423          	sw	s0,8(a0)
8040cdb8:	01c12083          	lw	ra,28(sp)
8040cdbc:	01812403          	lw	s0,24(sp)
8040cdc0:	02010113          	addi	sp,sp,32
8040cdc4:	00008067          	ret
8040cdc8:	00a12623          	sw	a0,12(sp)
8040cdcc:	e61f30ef          	jal	ra,80400c2c <intr_disable>
8040cdd0:	00c12503          	lw	a0,12(sp)
8040cdd4:	00c52783          	lw	a5,12(a0)
8040cdd8:	fc8780e3          	beq	a5,s0,8040cd98 <del_timer+0x60>
8040cddc:	00052683          	lw	a3,0(a0)
8040cde0:	00852703          	lw	a4,8(a0)
8040cde4:	00068a63          	beqz	a3,8040cdf8 <del_timer+0xc0>
8040cde8:	00090617          	auipc	a2,0x90
8040cdec:	9e060613          	addi	a2,a2,-1568 # 8049c7c8 <timer_list>
8040cdf0:	00100593          	li	a1,1
8040cdf4:	f8c792e3          	bne	a5,a2,8040cd78 <del_timer+0x40>
8040cdf8:	00f72223          	sw	a5,4(a4)
8040cdfc:	00e7a023          	sw	a4,0(a5)
8040ce00:	00852623          	sw	s0,12(a0)
8040ce04:	00852423          	sw	s0,8(a0)
8040ce08:	f91ff06f          	j	8040cd98 <del_timer+0x60>

8040ce0c <run_timer_list>:
8040ce0c:	fe010113          	addi	sp,sp,-32
8040ce10:	00112e23          	sw	ra,28(sp)
8040ce14:	00812c23          	sw	s0,24(sp)
8040ce18:	00912a23          	sw	s1,20(sp)
8040ce1c:	01212823          	sw	s2,16(sp)
8040ce20:	01312623          	sw	s3,12(sp)
8040ce24:	01412423          	sw	s4,8(sp)
8040ce28:	01512223          	sw	s5,4(sp)
8040ce2c:	01612023          	sw	s6,0(sp)
8040ce30:	100027f3          	csrr	a5,sstatus
8040ce34:	0027f793          	andi	a5,a5,2
8040ce38:	00000b13          	li	s6,0
8040ce3c:	12079c63          	bnez	a5,8040cf74 <run_timer_list+0x168>
8040ce40:	00090997          	auipc	s3,0x90
8040ce44:	98898993          	addi	s3,s3,-1656 # 8049c7c8 <timer_list>
8040ce48:	0049a403          	lw	s0,4(s3)
8040ce4c:	09340663          	beq	s0,s3,8040ced8 <run_timer_list+0xcc>
8040ce50:	ff842783          	lw	a5,-8(s0)
8040ce54:	ff840913          	addi	s2,s0,-8
8040ce58:	14078463          	beqz	a5,8040cfa0 <run_timer_list+0x194>
8040ce5c:	fff78793          	addi	a5,a5,-1
8040ce60:	fef42c23          	sw	a5,-8(s0)
8040ce64:	06079a63          	bnez	a5,8040ced8 <run_timer_list+0xcc>
8040ce68:	00008a97          	auipc	s5,0x8
8040ce6c:	acca8a93          	addi	s5,s5,-1332 # 80414934 <CSWTCH.69+0xa68>
8040ce70:	00008a17          	auipc	s4,0x8
8040ce74:	b14a0a13          	addi	s4,s4,-1260 # 80414984 <CSWTCH.69+0xab8>
8040ce78:	0280006f          	j	8040cea0 <run_timer_list+0x94>
8040ce7c:	1007d263          	bgez	a5,8040cf80 <run_timer_list+0x174>
8040ce80:	00048513          	mv	a0,s1
8040ce84:	b7dff0ef          	jal	ra,8040ca00 <wakeup_proc>
8040ce88:	00090513          	mv	a0,s2
8040ce8c:	eadff0ef          	jal	ra,8040cd38 <del_timer>
8040ce90:	05340463          	beq	s0,s3,8040ced8 <run_timer_list+0xcc>
8040ce94:	ff842783          	lw	a5,-8(s0)
8040ce98:	ff840913          	addi	s2,s0,-8
8040ce9c:	02079e63          	bnez	a5,8040ced8 <run_timer_list+0xcc>
8040cea0:	00492483          	lw	s1,4(s2)
8040cea4:	00442403          	lw	s0,4(s0)
8040cea8:	0a84a783          	lw	a5,168(s1)
8040ceac:	fc0798e3          	bnez	a5,8040ce7c <run_timer_list+0x70>
8040ceb0:	0044a683          	lw	a3,4(s1)
8040ceb4:	000a8613          	mv	a2,s5
8040ceb8:	0a200593          	li	a1,162
8040cebc:	000a0513          	mv	a0,s4
8040cec0:	fe8f30ef          	jal	ra,804006a8 <__warn>
8040cec4:	00048513          	mv	a0,s1
8040cec8:	b39ff0ef          	jal	ra,8040ca00 <wakeup_proc>
8040cecc:	00090513          	mv	a0,s2
8040ced0:	e69ff0ef          	jal	ra,8040cd38 <del_timer>
8040ced4:	fd3410e3          	bne	s0,s3,8040ce94 <run_timer_list+0x88>
8040ced8:	00090797          	auipc	a5,0x90
8040cedc:	8d878793          	addi	a5,a5,-1832 # 8049c7b0 <current>
8040cee0:	0007a583          	lw	a1,0(a5)
8040cee4:	00090797          	auipc	a5,0x90
8040cee8:	8d078793          	addi	a5,a5,-1840 # 8049c7b4 <idleproc>
8040ceec:	0007a783          	lw	a5,0(a5)
8040cef0:	06f58c63          	beq	a1,a5,8040cf68 <run_timer_list+0x15c>
8040cef4:	00090797          	auipc	a5,0x90
8040cef8:	8d078793          	addi	a5,a5,-1840 # 8049c7c4 <sched_class>
8040cefc:	0007a783          	lw	a5,0(a5)
8040cf00:	00090717          	auipc	a4,0x90
8040cf04:	8c070713          	addi	a4,a4,-1856 # 8049c7c0 <rq>
8040cf08:	00072503          	lw	a0,0(a4)
8040cf0c:	0147a783          	lw	a5,20(a5)
8040cf10:	000780e7          	jalr	a5
8040cf14:	020b1663          	bnez	s6,8040cf40 <run_timer_list+0x134>
8040cf18:	01c12083          	lw	ra,28(sp)
8040cf1c:	01812403          	lw	s0,24(sp)
8040cf20:	01412483          	lw	s1,20(sp)
8040cf24:	01012903          	lw	s2,16(sp)
8040cf28:	00c12983          	lw	s3,12(sp)
8040cf2c:	00812a03          	lw	s4,8(sp)
8040cf30:	00412a83          	lw	s5,4(sp)
8040cf34:	00012b03          	lw	s6,0(sp)
8040cf38:	02010113          	addi	sp,sp,32
8040cf3c:	00008067          	ret
8040cf40:	01812403          	lw	s0,24(sp)
8040cf44:	01c12083          	lw	ra,28(sp)
8040cf48:	01412483          	lw	s1,20(sp)
8040cf4c:	01012903          	lw	s2,16(sp)
8040cf50:	00c12983          	lw	s3,12(sp)
8040cf54:	00812a03          	lw	s4,8(sp)
8040cf58:	00412a83          	lw	s5,4(sp)
8040cf5c:	00012b03          	lw	s6,0(sp)
8040cf60:	02010113          	addi	sp,sp,32
8040cf64:	cc1f306f          	j	80400c24 <intr_enable>
8040cf68:	00100793          	li	a5,1
8040cf6c:	00f5a823          	sw	a5,16(a1)
8040cf70:	fa5ff06f          	j	8040cf14 <run_timer_list+0x108>
8040cf74:	cb9f30ef          	jal	ra,80400c2c <intr_disable>
8040cf78:	00100b13          	li	s6,1
8040cf7c:	ec5ff06f          	j	8040ce40 <run_timer_list+0x34>
8040cf80:	00008697          	auipc	a3,0x8
8040cf84:	99068693          	addi	a3,a3,-1648 # 80414910 <CSWTCH.69+0xa44>
8040cf88:	00006617          	auipc	a2,0x6
8040cf8c:	ce460613          	addi	a2,a2,-796 # 80412c6c <commands+0x1bc>
8040cf90:	09f00593          	li	a1,159
8040cf94:	00008517          	auipc	a0,0x8
8040cf98:	9f050513          	addi	a0,a0,-1552 # 80414984 <CSWTCH.69+0xab8>
8040cf9c:	e88f30ef          	jal	ra,80400624 <__panic>
8040cfa0:	00008697          	auipc	a3,0x8
8040cfa4:	95c68693          	addi	a3,a3,-1700 # 804148fc <CSWTCH.69+0xa30>
8040cfa8:	00006617          	auipc	a2,0x6
8040cfac:	cc460613          	addi	a2,a2,-828 # 80412c6c <commands+0x1bc>
8040cfb0:	09900593          	li	a1,153
8040cfb4:	00008517          	auipc	a0,0x8
8040cfb8:	9d050513          	addi	a0,a0,-1584 # 80414984 <CSWTCH.69+0xab8>
8040cfbc:	e68f30ef          	jal	ra,80400624 <__panic>

8040cfc0 <sys_getpid>:
8040cfc0:	0008f797          	auipc	a5,0x8f
8040cfc4:	7f078793          	addi	a5,a5,2032 # 8049c7b0 <current>
8040cfc8:	0007a783          	lw	a5,0(a5)
8040cfcc:	0047a503          	lw	a0,4(a5)
8040cfd0:	00008067          	ret

8040cfd4 <sys_gettime>:
8040cfd4:	00090797          	auipc	a5,0x90
8040cfd8:	81c78793          	addi	a5,a5,-2020 # 8049c7f0 <ticks>
8040cfdc:	0007a503          	lw	a0,0(a5)
8040cfe0:	00008067          	ret

8040cfe4 <sys_lab6_set_priority>:
8040cfe4:	00052503          	lw	a0,0(a0)
8040cfe8:	ff010113          	addi	sp,sp,-16
8040cfec:	00112623          	sw	ra,12(sp)
8040cff0:	db5fb0ef          	jal	ra,80408da4 <lab6_set_priority>
8040cff4:	00c12083          	lw	ra,12(sp)
8040cff8:	00000513          	li	a0,0
8040cffc:	01010113          	addi	sp,sp,16
8040d000:	00008067          	ret

8040d004 <sys_dup>:
8040d004:	00452583          	lw	a1,4(a0)
8040d008:	00052503          	lw	a0,0(a0)
8040d00c:	e4df906f          	j	80406e58 <sysfile_dup>

8040d010 <sys_getdirentry>:
8040d010:	00452583          	lw	a1,4(a0)
8040d014:	00052503          	lw	a0,0(a0)
8040d018:	cc5f906f          	j	80406cdc <sysfile_getdirentry>

8040d01c <sys_getcwd>:
8040d01c:	00452583          	lw	a1,4(a0)
8040d020:	00052503          	lw	a0,0(a0)
8040d024:	bb5f906f          	j	80406bd8 <sysfile_getcwd>

8040d028 <sys_fsync>:
8040d028:	00052503          	lw	a0,0(a0)
8040d02c:	ba9f906f          	j	80406bd4 <sysfile_fsync>

8040d030 <sys_fstat>:
8040d030:	00452583          	lw	a1,4(a0)
8040d034:	00052503          	lw	a0,0(a0)
8040d038:	aadf906f          	j	80406ae4 <sysfile_fstat>

8040d03c <sys_seek>:
8040d03c:	00852603          	lw	a2,8(a0)
8040d040:	00452583          	lw	a1,4(a0)
8040d044:	00052503          	lw	a0,0(a0)
8040d048:	a99f906f          	j	80406ae0 <sysfile_seek>

8040d04c <sys_write>:
8040d04c:	00852603          	lw	a2,8(a0)
8040d050:	00452583          	lw	a1,4(a0)
8040d054:	00052503          	lw	a0,0(a0)
8040d058:	8c5f906f          	j	8040691c <sysfile_write>

8040d05c <sys_read>:
8040d05c:	00852603          	lw	a2,8(a0)
8040d060:	00452583          	lw	a1,4(a0)
8040d064:	00052503          	lw	a0,0(a0)
8040d068:	eecf906f          	j	80406754 <sysfile_read>

8040d06c <sys_close>:
8040d06c:	00052503          	lw	a0,0(a0)
8040d070:	ee0f906f          	j	80406750 <sysfile_close>

8040d074 <sys_open>:
8040d074:	00452583          	lw	a1,4(a0)
8040d078:	00052503          	lw	a0,0(a0)
8040d07c:	e7cf906f          	j	804066f8 <sysfile_open>

8040d080 <sys_pgdir>:
8040d080:	ff010113          	addi	sp,sp,-16
8040d084:	00112623          	sw	ra,12(sp)
8040d088:	f70f60ef          	jal	ra,804037f8 <print_pgdir>
8040d08c:	00c12083          	lw	ra,12(sp)
8040d090:	00000513          	li	a0,0
8040d094:	01010113          	addi	sp,sp,16
8040d098:	00008067          	ret

8040d09c <sys_putc>:
8040d09c:	00052503          	lw	a0,0(a0)
8040d0a0:	ff010113          	addi	sp,sp,-16
8040d0a4:	00112623          	sw	ra,12(sp)
8040d0a8:	9b4f30ef          	jal	ra,8040025c <cputchar>
8040d0ac:	00c12083          	lw	ra,12(sp)
8040d0b0:	00000513          	li	a0,0
8040d0b4:	01010113          	addi	sp,sp,16
8040d0b8:	00008067          	ret

8040d0bc <sys_kill>:
8040d0bc:	00052503          	lw	a0,0(a0)
8040d0c0:	a69fb06f          	j	80408b28 <do_kill>

8040d0c4 <sys_sleep>:
8040d0c4:	00052503          	lw	a0,0(a0)
8040d0c8:	d01fb06f          	j	80408dc8 <do_sleep>

8040d0cc <sys_yield>:
8040d0cc:	9d1fb06f          	j	80408a9c <do_yield>

8040d0d0 <sys_exec>:
8040d0d0:	00852603          	lw	a2,8(a0)
8040d0d4:	00452583          	lw	a1,4(a0)
8040d0d8:	00052503          	lw	a0,0(a0)
8040d0dc:	f1dfa06f          	j	80407ff8 <do_execve>

8040d0e0 <sys_wait>:
8040d0e0:	00452583          	lw	a1,4(a0)
8040d0e4:	00052503          	lw	a0,0(a0)
8040d0e8:	9d1fb06f          	j	80408ab8 <do_wait>

8040d0ec <sys_fork>:
8040d0ec:	0008f797          	auipc	a5,0x8f
8040d0f0:	6c478793          	addi	a5,a5,1732 # 8049c7b0 <current>
8040d0f4:	0007a783          	lw	a5,0(a5)
8040d0f8:	00000513          	li	a0,0
8040d0fc:	0547a603          	lw	a2,84(a5)
8040d100:	00862583          	lw	a1,8(a2)
8040d104:	accfa06f          	j	804073d0 <do_fork>

8040d108 <sys_exit>:
8040d108:	00052503          	lw	a0,0(a0)
8040d10c:	8d1fa06f          	j	804079dc <do_exit>

8040d110 <syscall>:
8040d110:	fd010113          	addi	sp,sp,-48
8040d114:	02912223          	sw	s1,36(sp)
8040d118:	0008f497          	auipc	s1,0x8f
8040d11c:	69848493          	addi	s1,s1,1688 # 8049c7b0 <current>
8040d120:	0004a703          	lw	a4,0(s1)
8040d124:	02812423          	sw	s0,40(sp)
8040d128:	03212023          	sw	s2,32(sp)
8040d12c:	05472403          	lw	s0,84(a4)
8040d130:	02112623          	sw	ra,44(sp)
8040d134:	0ff00793          	li	a5,255
8040d138:	02842903          	lw	s2,40(s0)
8040d13c:	0727e463          	bltu	a5,s2,8040d1a4 <syscall+0x94>
8040d140:	00291713          	slli	a4,s2,0x2
8040d144:	00008797          	auipc	a5,0x8
8040d148:	8b878793          	addi	a5,a5,-1864 # 804149fc <syscalls>
8040d14c:	00e787b3          	add	a5,a5,a4
8040d150:	0007a783          	lw	a5,0(a5)
8040d154:	04078863          	beqz	a5,8040d1a4 <syscall+0x94>
8040d158:	02c42503          	lw	a0,44(s0)
8040d15c:	03042583          	lw	a1,48(s0)
8040d160:	03442603          	lw	a2,52(s0)
8040d164:	03842683          	lw	a3,56(s0)
8040d168:	03c42703          	lw	a4,60(s0)
8040d16c:	00a12623          	sw	a0,12(sp)
8040d170:	00b12823          	sw	a1,16(sp)
8040d174:	00c12a23          	sw	a2,20(sp)
8040d178:	00d12c23          	sw	a3,24(sp)
8040d17c:	00e12e23          	sw	a4,28(sp)
8040d180:	00c10513          	addi	a0,sp,12
8040d184:	000780e7          	jalr	a5
8040d188:	02a42423          	sw	a0,40(s0)
8040d18c:	02c12083          	lw	ra,44(sp)
8040d190:	02812403          	lw	s0,40(sp)
8040d194:	02412483          	lw	s1,36(sp)
8040d198:	02012903          	lw	s2,32(sp)
8040d19c:	03010113          	addi	sp,sp,48
8040d1a0:	00008067          	ret
8040d1a4:	00040513          	mv	a0,s0
8040d1a8:	eb1f30ef          	jal	ra,80401058 <print_trapframe>
8040d1ac:	0004a783          	lw	a5,0(s1)
8040d1b0:	00090693          	mv	a3,s2
8040d1b4:	00008617          	auipc	a2,0x8
8040d1b8:	80460613          	addi	a2,a2,-2044 # 804149b8 <CSWTCH.69+0xaec>
8040d1bc:	0047a703          	lw	a4,4(a5)
8040d1c0:	0cd00593          	li	a1,205
8040d1c4:	06078793          	addi	a5,a5,96
8040d1c8:	00008517          	auipc	a0,0x8
8040d1cc:	81c50513          	addi	a0,a0,-2020 # 804149e4 <CSWTCH.69+0xb18>
8040d1d0:	c54f30ef          	jal	ra,80400624 <__panic>

8040d1d4 <swapfs_init>:
8040d1d4:	ff010113          	addi	sp,sp,-16
8040d1d8:	00100513          	li	a0,1
8040d1dc:	00112623          	sw	ra,12(sp)
8040d1e0:	8a9f30ef          	jal	ra,80400a88 <ide_device_valid>
8040d1e4:	02050263          	beqz	a0,8040d208 <swapfs_init+0x34>
8040d1e8:	00100513          	li	a0,1
8040d1ec:	8d1f30ef          	jal	ra,80400abc <ide_device_size>
8040d1f0:	00c12083          	lw	ra,12(sp)
8040d1f4:	00355513          	srli	a0,a0,0x3
8040d1f8:	0008f797          	auipc	a5,0x8f
8040d1fc:	68a7a623          	sw	a0,1676(a5) # 8049c884 <max_swap_offset>
8040d200:	01010113          	addi	sp,sp,16
8040d204:	00008067          	ret
8040d208:	00008617          	auipc	a2,0x8
8040d20c:	bf460613          	addi	a2,a2,-1036 # 80414dfc <syscalls+0x400>
8040d210:	00d00593          	li	a1,13
8040d214:	00008517          	auipc	a0,0x8
8040d218:	c0450513          	addi	a0,a0,-1020 # 80414e18 <syscalls+0x41c>
8040d21c:	c08f30ef          	jal	ra,80400624 <__panic>

8040d220 <swapfs_read>:
8040d220:	ff010113          	addi	sp,sp,-16
8040d224:	00112623          	sw	ra,12(sp)
8040d228:	00855793          	srli	a5,a0,0x8
8040d22c:	06078e63          	beqz	a5,8040d2a8 <swapfs_read+0x88>
8040d230:	0008f717          	auipc	a4,0x8f
8040d234:	65470713          	addi	a4,a4,1620 # 8049c884 <max_swap_offset>
8040d238:	00072703          	lw	a4,0(a4)
8040d23c:	06e7f663          	bgeu	a5,a4,8040d2a8 <swapfs_read+0x88>
8040d240:	0008f717          	auipc	a4,0x8f
8040d244:	5cc70713          	addi	a4,a4,1484 # 8049c80c <pages>
8040d248:	00072603          	lw	a2,0(a4)
8040d24c:	00009717          	auipc	a4,0x9
8040d250:	e6c70713          	addi	a4,a4,-404 # 804160b8 <nbase>
8040d254:	40c58633          	sub	a2,a1,a2
8040d258:	00072583          	lw	a1,0(a4)
8040d25c:	40565613          	srai	a2,a2,0x5
8040d260:	0008f717          	auipc	a4,0x8f
8040d264:	53c70713          	addi	a4,a4,1340 # 8049c79c <npage>
8040d268:	00b60633          	add	a2,a2,a1
8040d26c:	00072683          	lw	a3,0(a4)
8040d270:	00c61713          	slli	a4,a2,0xc
8040d274:	00c75713          	srli	a4,a4,0xc
8040d278:	00379593          	slli	a1,a5,0x3
8040d27c:	00c61613          	slli	a2,a2,0xc
8040d280:	04d77263          	bgeu	a4,a3,8040d2c4 <swapfs_read+0xa4>
8040d284:	0008f797          	auipc	a5,0x8f
8040d288:	58078793          	addi	a5,a5,1408 # 8049c804 <va_pa_offset>
8040d28c:	0007a783          	lw	a5,0(a5)
8040d290:	00c12083          	lw	ra,12(sp)
8040d294:	00800693          	li	a3,8
8040d298:	00f60633          	add	a2,a2,a5
8040d29c:	00100513          	li	a0,1
8040d2a0:	01010113          	addi	sp,sp,16
8040d2a4:	851f306f          	j	80400af4 <ide_read_secs>
8040d2a8:	00050693          	mv	a3,a0
8040d2ac:	00008617          	auipc	a2,0x8
8040d2b0:	b8460613          	addi	a2,a2,-1148 # 80414e30 <syscalls+0x434>
8040d2b4:	01400593          	li	a1,20
8040d2b8:	00008517          	auipc	a0,0x8
8040d2bc:	b6050513          	addi	a0,a0,-1184 # 80414e18 <syscalls+0x41c>
8040d2c0:	b64f30ef          	jal	ra,80400624 <__panic>
8040d2c4:	00060693          	mv	a3,a2
8040d2c8:	06e00593          	li	a1,110
8040d2cc:	00006617          	auipc	a2,0x6
8040d2d0:	31c60613          	addi	a2,a2,796 # 804135e8 <default_pmm_manager+0x30>
8040d2d4:	00006517          	auipc	a0,0x6
8040d2d8:	33850513          	addi	a0,a0,824 # 8041360c <default_pmm_manager+0x54>
8040d2dc:	b48f30ef          	jal	ra,80400624 <__panic>

8040d2e0 <swapfs_write>:
8040d2e0:	ff010113          	addi	sp,sp,-16
8040d2e4:	00112623          	sw	ra,12(sp)
8040d2e8:	00855793          	srli	a5,a0,0x8
8040d2ec:	06078e63          	beqz	a5,8040d368 <swapfs_write+0x88>
8040d2f0:	0008f717          	auipc	a4,0x8f
8040d2f4:	59470713          	addi	a4,a4,1428 # 8049c884 <max_swap_offset>
8040d2f8:	00072703          	lw	a4,0(a4)
8040d2fc:	06e7f663          	bgeu	a5,a4,8040d368 <swapfs_write+0x88>
8040d300:	0008f717          	auipc	a4,0x8f
8040d304:	50c70713          	addi	a4,a4,1292 # 8049c80c <pages>
8040d308:	00072603          	lw	a2,0(a4)
8040d30c:	00009717          	auipc	a4,0x9
8040d310:	dac70713          	addi	a4,a4,-596 # 804160b8 <nbase>
8040d314:	40c58633          	sub	a2,a1,a2
8040d318:	00072583          	lw	a1,0(a4)
8040d31c:	40565613          	srai	a2,a2,0x5
8040d320:	0008f717          	auipc	a4,0x8f
8040d324:	47c70713          	addi	a4,a4,1148 # 8049c79c <npage>
8040d328:	00b60633          	add	a2,a2,a1
8040d32c:	00072683          	lw	a3,0(a4)
8040d330:	00c61713          	slli	a4,a2,0xc
8040d334:	00c75713          	srli	a4,a4,0xc
8040d338:	00379593          	slli	a1,a5,0x3
8040d33c:	00c61613          	slli	a2,a2,0xc
8040d340:	04d77263          	bgeu	a4,a3,8040d384 <swapfs_write+0xa4>
8040d344:	0008f797          	auipc	a5,0x8f
8040d348:	4c078793          	addi	a5,a5,1216 # 8049c804 <va_pa_offset>
8040d34c:	0007a783          	lw	a5,0(a5)
8040d350:	00c12083          	lw	ra,12(sp)
8040d354:	00800693          	li	a3,8
8040d358:	00f60633          	add	a2,a2,a5
8040d35c:	00100513          	li	a0,1
8040d360:	01010113          	addi	sp,sp,16
8040d364:	829f306f          	j	80400b8c <ide_write_secs>
8040d368:	00050693          	mv	a3,a0
8040d36c:	00008617          	auipc	a2,0x8
8040d370:	ac460613          	addi	a2,a2,-1340 # 80414e30 <syscalls+0x434>
8040d374:	01900593          	li	a1,25
8040d378:	00008517          	auipc	a0,0x8
8040d37c:	aa050513          	addi	a0,a0,-1376 # 80414e18 <syscalls+0x41c>
8040d380:	aa4f30ef          	jal	ra,80400624 <__panic>
8040d384:	00060693          	mv	a3,a2
8040d388:	06e00593          	li	a1,110
8040d38c:	00006617          	auipc	a2,0x6
8040d390:	25c60613          	addi	a2,a2,604 # 804135e8 <default_pmm_manager+0x30>
8040d394:	00006517          	auipc	a0,0x6
8040d398:	27850513          	addi	a0,a0,632 # 8041360c <default_pmm_manager+0x54>
8040d39c:	a88f30ef          	jal	ra,80400624 <__panic>

8040d3a0 <__alloc_inode>:
8040d3a0:	ff010113          	addi	sp,sp,-16
8040d3a4:	00812423          	sw	s0,8(sp)
8040d3a8:	00050413          	mv	s0,a0
8040d3ac:	04000513          	li	a0,64
8040d3b0:	00112623          	sw	ra,12(sp)
8040d3b4:	cdcf50ef          	jal	ra,80402890 <kmalloc>
8040d3b8:	00050463          	beqz	a0,8040d3c0 <__alloc_inode+0x20>
8040d3bc:	02852623          	sw	s0,44(a0)
8040d3c0:	00c12083          	lw	ra,12(sp)
8040d3c4:	00812403          	lw	s0,8(sp)
8040d3c8:	01010113          	addi	sp,sp,16
8040d3cc:	00008067          	ret

8040d3d0 <inode_init>:
8040d3d0:	00100793          	li	a5,1
8040d3d4:	02052a23          	sw	zero,52(a0)
8040d3d8:	02b52e23          	sw	a1,60(a0)
8040d3dc:	02c52c23          	sw	a2,56(a0)
8040d3e0:	02f52823          	sw	a5,48(a0)
8040d3e4:	00008067          	ret

8040d3e8 <inode_kill>:
8040d3e8:	03052703          	lw	a4,48(a0)
8040d3ec:	ff010113          	addi	sp,sp,-16
8040d3f0:	00112623          	sw	ra,12(sp)
8040d3f4:	00071c63          	bnez	a4,8040d40c <inode_kill+0x24>
8040d3f8:	03452783          	lw	a5,52(a0)
8040d3fc:	02079863          	bnez	a5,8040d42c <inode_kill+0x44>
8040d400:	00c12083          	lw	ra,12(sp)
8040d404:	01010113          	addi	sp,sp,16
8040d408:	dacf506f          	j	804029b4 <kfree>
8040d40c:	00008697          	auipc	a3,0x8
8040d410:	afc68693          	addi	a3,a3,-1284 # 80414f08 <syscalls+0x50c>
8040d414:	00006617          	auipc	a2,0x6
8040d418:	85860613          	addi	a2,a2,-1960 # 80412c6c <commands+0x1bc>
8040d41c:	02900593          	li	a1,41
8040d420:	00008517          	auipc	a0,0x8
8040d424:	b0450513          	addi	a0,a0,-1276 # 80414f24 <syscalls+0x528>
8040d428:	9fcf30ef          	jal	ra,80400624 <__panic>
8040d42c:	00008697          	auipc	a3,0x8
8040d430:	b0c68693          	addi	a3,a3,-1268 # 80414f38 <syscalls+0x53c>
8040d434:	00006617          	auipc	a2,0x6
8040d438:	83860613          	addi	a2,a2,-1992 # 80412c6c <commands+0x1bc>
8040d43c:	02a00593          	li	a1,42
8040d440:	00008517          	auipc	a0,0x8
8040d444:	ae450513          	addi	a0,a0,-1308 # 80414f24 <syscalls+0x528>
8040d448:	9dcf30ef          	jal	ra,80400624 <__panic>

8040d44c <inode_ref_inc>:
8040d44c:	03052783          	lw	a5,48(a0)
8040d450:	00178793          	addi	a5,a5,1
8040d454:	02f52823          	sw	a5,48(a0)
8040d458:	00078513          	mv	a0,a5
8040d45c:	00008067          	ret

8040d460 <inode_open_inc>:
8040d460:	03452783          	lw	a5,52(a0)
8040d464:	00178793          	addi	a5,a5,1
8040d468:	02f52a23          	sw	a5,52(a0)
8040d46c:	00078513          	mv	a0,a5
8040d470:	00008067          	ret

8040d474 <inode_check>:
8040d474:	ff010113          	addi	sp,sp,-16
8040d478:	00112623          	sw	ra,12(sp)
8040d47c:	04050263          	beqz	a0,8040d4c0 <inode_check+0x4c>
8040d480:	03c52783          	lw	a5,60(a0)
8040d484:	02078e63          	beqz	a5,8040d4c0 <inode_check+0x4c>
8040d488:	0007a703          	lw	a4,0(a5)
8040d48c:	8c4ba7b7          	lui	a5,0x8c4ba
8040d490:	47678793          	addi	a5,a5,1142 # 8c4ba476 <end+0xc01dbb6>
8040d494:	08f71663          	bne	a4,a5,8040d520 <inode_check+0xac>
8040d498:	03052703          	lw	a4,48(a0)
8040d49c:	03452783          	lw	a5,52(a0)
8040d4a0:	06f74063          	blt	a4,a5,8040d500 <inode_check+0x8c>
8040d4a4:	0407ce63          	bltz	a5,8040d500 <inode_check+0x8c>
8040d4a8:	000106b7          	lui	a3,0x10
8040d4ac:	02d75a63          	bge	a4,a3,8040d4e0 <inode_check+0x6c>
8040d4b0:	02d7d863          	bge	a5,a3,8040d4e0 <inode_check+0x6c>
8040d4b4:	00c12083          	lw	ra,12(sp)
8040d4b8:	01010113          	addi	sp,sp,16
8040d4bc:	00008067          	ret
8040d4c0:	00008697          	auipc	a3,0x8
8040d4c4:	99068693          	addi	a3,a3,-1648 # 80414e50 <syscalls+0x454>
8040d4c8:	00005617          	auipc	a2,0x5
8040d4cc:	7a460613          	addi	a2,a2,1956 # 80412c6c <commands+0x1bc>
8040d4d0:	06e00593          	li	a1,110
8040d4d4:	00008517          	auipc	a0,0x8
8040d4d8:	a5050513          	addi	a0,a0,-1456 # 80414f24 <syscalls+0x528>
8040d4dc:	948f30ef          	jal	ra,80400624 <__panic>
8040d4e0:	00008697          	auipc	a3,0x8
8040d4e4:	9ec68693          	addi	a3,a3,-1556 # 80414ecc <syscalls+0x4d0>
8040d4e8:	00005617          	auipc	a2,0x5
8040d4ec:	78460613          	addi	a2,a2,1924 # 80412c6c <commands+0x1bc>
8040d4f0:	07200593          	li	a1,114
8040d4f4:	00008517          	auipc	a0,0x8
8040d4f8:	a3050513          	addi	a0,a0,-1488 # 80414f24 <syscalls+0x528>
8040d4fc:	928f30ef          	jal	ra,80400624 <__panic>
8040d500:	00008697          	auipc	a3,0x8
8040d504:	9a068693          	addi	a3,a3,-1632 # 80414ea0 <syscalls+0x4a4>
8040d508:	00005617          	auipc	a2,0x5
8040d50c:	76460613          	addi	a2,a2,1892 # 80412c6c <commands+0x1bc>
8040d510:	07100593          	li	a1,113
8040d514:	00008517          	auipc	a0,0x8
8040d518:	a1050513          	addi	a0,a0,-1520 # 80414f24 <syscalls+0x528>
8040d51c:	908f30ef          	jal	ra,80400624 <__panic>
8040d520:	00008697          	auipc	a3,0x8
8040d524:	95868693          	addi	a3,a3,-1704 # 80414e78 <syscalls+0x47c>
8040d528:	00005617          	auipc	a2,0x5
8040d52c:	74460613          	addi	a2,a2,1860 # 80412c6c <commands+0x1bc>
8040d530:	06f00593          	li	a1,111
8040d534:	00008517          	auipc	a0,0x8
8040d538:	9f050513          	addi	a0,a0,-1552 # 80414f24 <syscalls+0x528>
8040d53c:	8e8f30ef          	jal	ra,80400624 <__panic>

8040d540 <inode_ref_dec>:
8040d540:	ff010113          	addi	sp,sp,-16
8040d544:	00812423          	sw	s0,8(sp)
8040d548:	03052403          	lw	s0,48(a0)
8040d54c:	00112623          	sw	ra,12(sp)
8040d550:	00912223          	sw	s1,4(sp)
8040d554:	01212023          	sw	s2,0(sp)
8040d558:	0a805663          	blez	s0,8040d604 <inode_ref_dec+0xc4>
8040d55c:	fff40413          	addi	s0,s0,-1
8040d560:	02852823          	sw	s0,48(a0)
8040d564:	00050493          	mv	s1,a0
8040d568:	02041a63          	bnez	s0,8040d59c <inode_ref_dec+0x5c>
8040d56c:	03c52783          	lw	a5,60(a0)
8040d570:	06078a63          	beqz	a5,8040d5e4 <inode_ref_dec+0xa4>
8040d574:	0247a903          	lw	s2,36(a5)
8040d578:	06090663          	beqz	s2,8040d5e4 <inode_ref_dec+0xa4>
8040d57c:	00008597          	auipc	a1,0x8
8040d580:	ad858593          	addi	a1,a1,-1320 # 80415054 <syscalls+0x658>
8040d584:	ef1ff0ef          	jal	ra,8040d474 <inode_check>
8040d588:	00048513          	mv	a0,s1
8040d58c:	000900e7          	jalr	s2
8040d590:	00050663          	beqz	a0,8040d59c <inode_ref_dec+0x5c>
8040d594:	ff100793          	li	a5,-15
8040d598:	02f51063          	bne	a0,a5,8040d5b8 <inode_ref_dec+0x78>
8040d59c:	00040513          	mv	a0,s0
8040d5a0:	00c12083          	lw	ra,12(sp)
8040d5a4:	00812403          	lw	s0,8(sp)
8040d5a8:	00412483          	lw	s1,4(sp)
8040d5ac:	00012903          	lw	s2,0(sp)
8040d5b0:	01010113          	addi	sp,sp,16
8040d5b4:	00008067          	ret
8040d5b8:	00050593          	mv	a1,a0
8040d5bc:	00008517          	auipc	a0,0x8
8040d5c0:	aa050513          	addi	a0,a0,-1376 # 8041505c <syscalls+0x660>
8040d5c4:	c39f20ef          	jal	ra,804001fc <cprintf>
8040d5c8:	00040513          	mv	a0,s0
8040d5cc:	00c12083          	lw	ra,12(sp)
8040d5d0:	00812403          	lw	s0,8(sp)
8040d5d4:	00412483          	lw	s1,4(sp)
8040d5d8:	00012903          	lw	s2,0(sp)
8040d5dc:	01010113          	addi	sp,sp,16
8040d5e0:	00008067          	ret
8040d5e4:	00008697          	auipc	a3,0x8
8040d5e8:	a2068693          	addi	a3,a3,-1504 # 80415004 <syscalls+0x608>
8040d5ec:	00005617          	auipc	a2,0x5
8040d5f0:	68060613          	addi	a2,a2,1664 # 80412c6c <commands+0x1bc>
8040d5f4:	04400593          	li	a1,68
8040d5f8:	00008517          	auipc	a0,0x8
8040d5fc:	92c50513          	addi	a0,a0,-1748 # 80414f24 <syscalls+0x528>
8040d600:	824f30ef          	jal	ra,80400624 <__panic>
8040d604:	00008697          	auipc	a3,0x8
8040d608:	9e468693          	addi	a3,a3,-1564 # 80414fe8 <syscalls+0x5ec>
8040d60c:	00005617          	auipc	a2,0x5
8040d610:	66060613          	addi	a2,a2,1632 # 80412c6c <commands+0x1bc>
8040d614:	03f00593          	li	a1,63
8040d618:	00008517          	auipc	a0,0x8
8040d61c:	90c50513          	addi	a0,a0,-1780 # 80414f24 <syscalls+0x528>
8040d620:	804f30ef          	jal	ra,80400624 <__panic>

8040d624 <inode_open_dec>:
8040d624:	ff010113          	addi	sp,sp,-16
8040d628:	00812423          	sw	s0,8(sp)
8040d62c:	03452403          	lw	s0,52(a0)
8040d630:	00112623          	sw	ra,12(sp)
8040d634:	00912223          	sw	s1,4(sp)
8040d638:	01212023          	sw	s2,0(sp)
8040d63c:	0a805263          	blez	s0,8040d6e0 <inode_open_dec+0xbc>
8040d640:	fff40413          	addi	s0,s0,-1
8040d644:	02852a23          	sw	s0,52(a0)
8040d648:	00050493          	mv	s1,a0
8040d64c:	02041663          	bnez	s0,8040d678 <inode_open_dec+0x54>
8040d650:	03c52783          	lw	a5,60(a0)
8040d654:	06078663          	beqz	a5,8040d6c0 <inode_open_dec+0x9c>
8040d658:	0087a903          	lw	s2,8(a5)
8040d65c:	06090263          	beqz	s2,8040d6c0 <inode_open_dec+0x9c>
8040d660:	00008597          	auipc	a1,0x8
8040d664:	96058593          	addi	a1,a1,-1696 # 80414fc0 <syscalls+0x5c4>
8040d668:	e0dff0ef          	jal	ra,8040d474 <inode_check>
8040d66c:	00048513          	mv	a0,s1
8040d670:	000900e7          	jalr	s2
8040d674:	02051063          	bnez	a0,8040d694 <inode_open_dec+0x70>
8040d678:	00040513          	mv	a0,s0
8040d67c:	00c12083          	lw	ra,12(sp)
8040d680:	00812403          	lw	s0,8(sp)
8040d684:	00412483          	lw	s1,4(sp)
8040d688:	00012903          	lw	s2,0(sp)
8040d68c:	01010113          	addi	sp,sp,16
8040d690:	00008067          	ret
8040d694:	00050593          	mv	a1,a0
8040d698:	00008517          	auipc	a0,0x8
8040d69c:	93050513          	addi	a0,a0,-1744 # 80414fc8 <syscalls+0x5cc>
8040d6a0:	b5df20ef          	jal	ra,804001fc <cprintf>
8040d6a4:	00040513          	mv	a0,s0
8040d6a8:	00c12083          	lw	ra,12(sp)
8040d6ac:	00812403          	lw	s0,8(sp)
8040d6b0:	00412483          	lw	s1,4(sp)
8040d6b4:	00012903          	lw	s2,0(sp)
8040d6b8:	01010113          	addi	sp,sp,16
8040d6bc:	00008067          	ret
8040d6c0:	00008697          	auipc	a3,0x8
8040d6c4:	8b068693          	addi	a3,a3,-1872 # 80414f70 <syscalls+0x574>
8040d6c8:	00005617          	auipc	a2,0x5
8040d6cc:	5a460613          	addi	a2,a2,1444 # 80412c6c <commands+0x1bc>
8040d6d0:	06100593          	li	a1,97
8040d6d4:	00008517          	auipc	a0,0x8
8040d6d8:	85050513          	addi	a0,a0,-1968 # 80414f24 <syscalls+0x528>
8040d6dc:	f49f20ef          	jal	ra,80400624 <__panic>
8040d6e0:	00008697          	auipc	a3,0x8
8040d6e4:	87468693          	addi	a3,a3,-1932 # 80414f54 <syscalls+0x558>
8040d6e8:	00005617          	auipc	a2,0x5
8040d6ec:	58460613          	addi	a2,a2,1412 # 80412c6c <commands+0x1bc>
8040d6f0:	05c00593          	li	a1,92
8040d6f4:	00008517          	auipc	a0,0x8
8040d6f8:	83050513          	addi	a0,a0,-2000 # 80414f24 <syscalls+0x528>
8040d6fc:	f29f20ef          	jal	ra,80400624 <__panic>

8040d700 <__alloc_fs>:
8040d700:	ff010113          	addi	sp,sp,-16
8040d704:	00812423          	sw	s0,8(sp)
8040d708:	00050413          	mv	s0,a0
8040d70c:	08000513          	li	a0,128
8040d710:	00112623          	sw	ra,12(sp)
8040d714:	97cf50ef          	jal	ra,80402890 <kmalloc>
8040d718:	00050463          	beqz	a0,8040d720 <__alloc_fs+0x20>
8040d71c:	06852623          	sw	s0,108(a0)
8040d720:	00c12083          	lw	ra,12(sp)
8040d724:	00812403          	lw	s0,8(sp)
8040d728:	01010113          	addi	sp,sp,16
8040d72c:	00008067          	ret

8040d730 <vfs_init>:
8040d730:	ff010113          	addi	sp,sp,-16
8040d734:	00100593          	li	a1,1
8040d738:	0008e517          	auipc	a0,0x8e
8040d73c:	02450513          	addi	a0,a0,36 # 8049b75c <bootfs_sem>
8040d740:	00112623          	sw	ra,12(sp)
8040d744:	939f70ef          	jal	ra,8040507c <sem_init>
8040d748:	00c12083          	lw	ra,12(sp)
8040d74c:	01010113          	addi	sp,sp,16
8040d750:	3900006f          	j	8040dae0 <vfs_devlist_init>

8040d754 <vfs_set_bootfs>:
8040d754:	fe010113          	addi	sp,sp,-32
8040d758:	00812c23          	sw	s0,24(sp)
8040d75c:	00112e23          	sw	ra,28(sp)
8040d760:	00912a23          	sw	s1,20(sp)
8040d764:	00012623          	sw	zero,12(sp)
8040d768:	00050413          	mv	s0,a0
8040d76c:	04050a63          	beqz	a0,8040d7c0 <vfs_set_bootfs+0x6c>
8040d770:	03a00593          	li	a1,58
8040d774:	09c050ef          	jal	ra,80412810 <strchr>
8040d778:	08050e63          	beqz	a0,8040d814 <vfs_set_bootfs+0xc0>
8040d77c:	00154783          	lbu	a5,1(a0)
8040d780:	08079a63          	bnez	a5,8040d814 <vfs_set_bootfs+0xc0>
8040d784:	00040513          	mv	a0,s0
8040d788:	509000ef          	jal	ra,8040e490 <vfs_chdir>
8040d78c:	00050413          	mv	s0,a0
8040d790:	00050e63          	beqz	a0,8040d7ac <vfs_set_bootfs+0x58>
8040d794:	00040513          	mv	a0,s0
8040d798:	01c12083          	lw	ra,28(sp)
8040d79c:	01812403          	lw	s0,24(sp)
8040d7a0:	01412483          	lw	s1,20(sp)
8040d7a4:	02010113          	addi	sp,sp,32
8040d7a8:	00008067          	ret
8040d7ac:	00c10513          	addi	a0,sp,12
8040d7b0:	375000ef          	jal	ra,8040e324 <vfs_get_curdir>
8040d7b4:	00050413          	mv	s0,a0
8040d7b8:	fc051ee3          	bnez	a0,8040d794 <vfs_set_bootfs+0x40>
8040d7bc:	00c12403          	lw	s0,12(sp)
8040d7c0:	0008e517          	auipc	a0,0x8e
8040d7c4:	f9c50513          	addi	a0,a0,-100 # 8049b75c <bootfs_sem>
8040d7c8:	8c5f70ef          	jal	ra,8040508c <down>
8040d7cc:	0008f797          	auipc	a5,0x8f
8040d7d0:	00478793          	addi	a5,a5,4 # 8049c7d0 <bootfs_node>
8040d7d4:	0007a483          	lw	s1,0(a5)
8040d7d8:	0008e517          	auipc	a0,0x8e
8040d7dc:	f8450513          	addi	a0,a0,-124 # 8049b75c <bootfs_sem>
8040d7e0:	0008f797          	auipc	a5,0x8f
8040d7e4:	fe87a823          	sw	s0,-16(a5) # 8049c7d0 <bootfs_node>
8040d7e8:	00000413          	li	s0,0
8040d7ec:	89df70ef          	jal	ra,80405088 <up>
8040d7f0:	fa0482e3          	beqz	s1,8040d794 <vfs_set_bootfs+0x40>
8040d7f4:	00048513          	mv	a0,s1
8040d7f8:	d49ff0ef          	jal	ra,8040d540 <inode_ref_dec>
8040d7fc:	00040513          	mv	a0,s0
8040d800:	01c12083          	lw	ra,28(sp)
8040d804:	01812403          	lw	s0,24(sp)
8040d808:	01412483          	lw	s1,20(sp)
8040d80c:	02010113          	addi	sp,sp,32
8040d810:	00008067          	ret
8040d814:	ffd00413          	li	s0,-3
8040d818:	f7dff06f          	j	8040d794 <vfs_set_bootfs+0x40>

8040d81c <vfs_get_bootfs>:
8040d81c:	ff010113          	addi	sp,sp,-16
8040d820:	00912223          	sw	s1,4(sp)
8040d824:	0008f497          	auipc	s1,0x8f
8040d828:	fac48493          	addi	s1,s1,-84 # 8049c7d0 <bootfs_node>
8040d82c:	0004a783          	lw	a5,0(s1)
8040d830:	00112623          	sw	ra,12(sp)
8040d834:	00812423          	sw	s0,8(sp)
8040d838:	04078c63          	beqz	a5,8040d890 <vfs_get_bootfs+0x74>
8040d83c:	00050413          	mv	s0,a0
8040d840:	0008e517          	auipc	a0,0x8e
8040d844:	f1c50513          	addi	a0,a0,-228 # 8049b75c <bootfs_sem>
8040d848:	845f70ef          	jal	ra,8040508c <down>
8040d84c:	0004a483          	lw	s1,0(s1)
8040d850:	02048a63          	beqz	s1,8040d884 <vfs_get_bootfs+0x68>
8040d854:	00048513          	mv	a0,s1
8040d858:	bf5ff0ef          	jal	ra,8040d44c <inode_ref_inc>
8040d85c:	0008e517          	auipc	a0,0x8e
8040d860:	f0050513          	addi	a0,a0,-256 # 8049b75c <bootfs_sem>
8040d864:	825f70ef          	jal	ra,80405088 <up>
8040d868:	00000513          	li	a0,0
8040d86c:	00942023          	sw	s1,0(s0)
8040d870:	00c12083          	lw	ra,12(sp)
8040d874:	00812403          	lw	s0,8(sp)
8040d878:	00412483          	lw	s1,4(sp)
8040d87c:	01010113          	addi	sp,sp,16
8040d880:	00008067          	ret
8040d884:	0008e517          	auipc	a0,0x8e
8040d888:	ed850513          	addi	a0,a0,-296 # 8049b75c <bootfs_sem>
8040d88c:	ffcf70ef          	jal	ra,80405088 <up>
8040d890:	ff000513          	li	a0,-16
8040d894:	fddff06f          	j	8040d870 <vfs_get_bootfs+0x54>

8040d898 <vfs_do_add>:
8040d898:	fe010113          	addi	sp,sp,-32
8040d89c:	00112e23          	sw	ra,28(sp)
8040d8a0:	00812c23          	sw	s0,24(sp)
8040d8a4:	00912a23          	sw	s1,20(sp)
8040d8a8:	01212823          	sw	s2,16(sp)
8040d8ac:	01312623          	sw	s3,12(sp)
8040d8b0:	01412423          	sw	s4,8(sp)
8040d8b4:	01512223          	sw	s5,4(sp)
8040d8b8:	01612023          	sw	s6,0(sp)
8040d8bc:	14050863          	beqz	a0,8040da0c <vfs_do_add+0x174>
8040d8c0:	00050413          	mv	s0,a0
8040d8c4:	00058a13          	mv	s4,a1
8040d8c8:	00060b13          	mv	s6,a2
8040d8cc:	00068a93          	mv	s5,a3
8040d8d0:	0e058663          	beqz	a1,8040d9bc <vfs_do_add+0x124>
8040d8d4:	02c5a703          	lw	a4,44(a1)
8040d8d8:	000017b7          	lui	a5,0x1
8040d8dc:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d8e0:	0ef71063          	bne	a4,a5,8040d9c0 <vfs_do_add+0x128>
8040d8e4:	00040513          	mv	a0,s0
8040d8e8:	671040ef          	jal	ra,80412758 <strlen>
8040d8ec:	01f00793          	li	a5,31
8040d8f0:	10a7e663          	bltu	a5,a0,8040d9fc <vfs_do_add+0x164>
8040d8f4:	00040513          	mv	a0,s0
8040d8f8:	985f20ef          	jal	ra,8040027c <strdup>
8040d8fc:	00050493          	mv	s1,a0
8040d900:	10050263          	beqz	a0,8040da04 <vfs_do_add+0x16c>
8040d904:	01800513          	li	a0,24
8040d908:	f89f40ef          	jal	ra,80402890 <kmalloc>
8040d90c:	00050993          	mv	s3,a0
8040d910:	08050e63          	beqz	a0,8040d9ac <vfs_do_add+0x114>
8040d914:	0008e517          	auipc	a0,0x8e
8040d918:	e5450513          	addi	a0,a0,-428 # 8049b768 <vdev_list_sem>
8040d91c:	0008f917          	auipc	s2,0x8f
8040d920:	eb890913          	addi	s2,s2,-328 # 8049c7d4 <vdev_list>
8040d924:	f68f70ef          	jal	ra,8040508c <down>
8040d928:	00090413          	mv	s0,s2
8040d92c:	0140006f          	j	8040d940 <vfs_do_add+0xa8>
8040d930:	ff042503          	lw	a0,-16(s0)
8040d934:	00048593          	mv	a1,s1
8040d938:	6a9040ef          	jal	ra,804127e0 <strcmp>
8040d93c:	0a050263          	beqz	a0,8040d9e0 <vfs_do_add+0x148>
8040d940:	00442403          	lw	s0,4(s0)
8040d944:	ff2416e3          	bne	s0,s2,8040d930 <vfs_do_add+0x98>
8040d948:	00442703          	lw	a4,4(s0)
8040d94c:	01098793          	addi	a5,s3,16
8040d950:	0099a023          	sw	s1,0(s3)
8040d954:	0149a223          	sw	s4,4(s3)
8040d958:	0159a623          	sw	s5,12(s3)
8040d95c:	0169a423          	sw	s6,8(s3)
8040d960:	00f72023          	sw	a5,0(a4)
8040d964:	0089a823          	sw	s0,16(s3)
8040d968:	00e9aa23          	sw	a4,20(s3)
8040d96c:	0008e517          	auipc	a0,0x8e
8040d970:	dfc50513          	addi	a0,a0,-516 # 8049b768 <vdev_list_sem>
8040d974:	00f42223          	sw	a5,4(s0)
8040d978:	00000413          	li	s0,0
8040d97c:	f0cf70ef          	jal	ra,80405088 <up>
8040d980:	00040513          	mv	a0,s0
8040d984:	01c12083          	lw	ra,28(sp)
8040d988:	01812403          	lw	s0,24(sp)
8040d98c:	01412483          	lw	s1,20(sp)
8040d990:	01012903          	lw	s2,16(sp)
8040d994:	00c12983          	lw	s3,12(sp)
8040d998:	00812a03          	lw	s4,8(sp)
8040d99c:	00412a83          	lw	s5,4(sp)
8040d9a0:	00012b03          	lw	s6,0(sp)
8040d9a4:	02010113          	addi	sp,sp,32
8040d9a8:	00008067          	ret
8040d9ac:	ffc00413          	li	s0,-4
8040d9b0:	00048513          	mv	a0,s1
8040d9b4:	800f50ef          	jal	ra,804029b4 <kfree>
8040d9b8:	fc9ff06f          	j	8040d980 <vfs_do_add+0xe8>
8040d9bc:	f20684e3          	beqz	a3,8040d8e4 <vfs_do_add+0x4c>
8040d9c0:	00007697          	auipc	a3,0x7
8040d9c4:	6e468693          	addi	a3,a3,1764 # 804150a4 <syscalls+0x6a8>
8040d9c8:	00005617          	auipc	a2,0x5
8040d9cc:	2a460613          	addi	a2,a2,676 # 80412c6c <commands+0x1bc>
8040d9d0:	08f00593          	li	a1,143
8040d9d4:	00007517          	auipc	a0,0x7
8040d9d8:	6b850513          	addi	a0,a0,1720 # 8041508c <syscalls+0x690>
8040d9dc:	c49f20ef          	jal	ra,80400624 <__panic>
8040d9e0:	0008e517          	auipc	a0,0x8e
8040d9e4:	d8850513          	addi	a0,a0,-632 # 8049b768 <vdev_list_sem>
8040d9e8:	ea0f70ef          	jal	ra,80405088 <up>
8040d9ec:	00098513          	mv	a0,s3
8040d9f0:	fc5f40ef          	jal	ra,804029b4 <kfree>
8040d9f4:	fe900413          	li	s0,-23
8040d9f8:	fb9ff06f          	j	8040d9b0 <vfs_do_add+0x118>
8040d9fc:	ff400413          	li	s0,-12
8040da00:	f81ff06f          	j	8040d980 <vfs_do_add+0xe8>
8040da04:	ffc00413          	li	s0,-4
8040da08:	f79ff06f          	j	8040d980 <vfs_do_add+0xe8>
8040da0c:	00007697          	auipc	a3,0x7
8040da10:	67068693          	addi	a3,a3,1648 # 8041507c <syscalls+0x680>
8040da14:	00005617          	auipc	a2,0x5
8040da18:	25860613          	addi	a2,a2,600 # 80412c6c <commands+0x1bc>
8040da1c:	08e00593          	li	a1,142
8040da20:	00007517          	auipc	a0,0x7
8040da24:	66c50513          	addi	a0,a0,1644 # 8041508c <syscalls+0x690>
8040da28:	bfdf20ef          	jal	ra,80400624 <__panic>

8040da2c <find_mount>:
8040da2c:	fe010113          	addi	sp,sp,-32
8040da30:	00812c23          	sw	s0,24(sp)
8040da34:	00912a23          	sw	s1,20(sp)
8040da38:	01212823          	sw	s2,16(sp)
8040da3c:	01312623          	sw	s3,12(sp)
8040da40:	0008f497          	auipc	s1,0x8f
8040da44:	d9448493          	addi	s1,s1,-620 # 8049c7d4 <vdev_list>
8040da48:	00112e23          	sw	ra,28(sp)
8040da4c:	00050913          	mv	s2,a0
8040da50:	00058993          	mv	s3,a1
8040da54:	00048413          	mv	s0,s1
8040da58:	06050463          	beqz	a0,8040dac0 <find_mount+0x94>
8040da5c:	00442403          	lw	s0,4(s0)
8040da60:	04940063          	beq	s0,s1,8040daa0 <find_mount+0x74>
8040da64:	ffc42783          	lw	a5,-4(s0)
8040da68:	fe078ae3          	beqz	a5,8040da5c <find_mount+0x30>
8040da6c:	ff042503          	lw	a0,-16(s0)
8040da70:	00090593          	mv	a1,s2
8040da74:	56d040ef          	jal	ra,804127e0 <strcmp>
8040da78:	fe0512e3          	bnez	a0,8040da5c <find_mount+0x30>
8040da7c:	ff040413          	addi	s0,s0,-16
8040da80:	0089a023          	sw	s0,0(s3)
8040da84:	01c12083          	lw	ra,28(sp)
8040da88:	01812403          	lw	s0,24(sp)
8040da8c:	01412483          	lw	s1,20(sp)
8040da90:	01012903          	lw	s2,16(sp)
8040da94:	00c12983          	lw	s3,12(sp)
8040da98:	02010113          	addi	sp,sp,32
8040da9c:	00008067          	ret
8040daa0:	01c12083          	lw	ra,28(sp)
8040daa4:	01812403          	lw	s0,24(sp)
8040daa8:	01412483          	lw	s1,20(sp)
8040daac:	01012903          	lw	s2,16(sp)
8040dab0:	00c12983          	lw	s3,12(sp)
8040dab4:	ff300513          	li	a0,-13
8040dab8:	02010113          	addi	sp,sp,32
8040dabc:	00008067          	ret
8040dac0:	00007697          	auipc	a3,0x7
8040dac4:	5bc68693          	addi	a3,a3,1468 # 8041507c <syscalls+0x680>
8040dac8:	00005617          	auipc	a2,0x5
8040dacc:	1a460613          	addi	a2,a2,420 # 80412c6c <commands+0x1bc>
8040dad0:	0cd00593          	li	a1,205
8040dad4:	00007517          	auipc	a0,0x7
8040dad8:	5b850513          	addi	a0,a0,1464 # 8041508c <syscalls+0x690>
8040dadc:	b49f20ef          	jal	ra,80400624 <__panic>

8040dae0 <vfs_devlist_init>:
8040dae0:	0008f797          	auipc	a5,0x8f
8040dae4:	cf478793          	addi	a5,a5,-780 # 8049c7d4 <vdev_list>
8040dae8:	00100593          	li	a1,1
8040daec:	0008e517          	auipc	a0,0x8e
8040daf0:	c7c50513          	addi	a0,a0,-900 # 8049b768 <vdev_list_sem>
8040daf4:	00f7a223          	sw	a5,4(a5)
8040daf8:	00f7a023          	sw	a5,0(a5)
8040dafc:	d80f706f          	j	8040507c <sem_init>

8040db00 <vfs_cleanup>:
8040db00:	ff010113          	addi	sp,sp,-16
8040db04:	00912223          	sw	s1,4(sp)
8040db08:	0008f497          	auipc	s1,0x8f
8040db0c:	ccc48493          	addi	s1,s1,-820 # 8049c7d4 <vdev_list>
8040db10:	0044a783          	lw	a5,4(s1)
8040db14:	00112623          	sw	ra,12(sp)
8040db18:	00812423          	sw	s0,8(sp)
8040db1c:	04978a63          	beq	a5,s1,8040db70 <vfs_cleanup+0x70>
8040db20:	0008e517          	auipc	a0,0x8e
8040db24:	c4850513          	addi	a0,a0,-952 # 8049b768 <vdev_list_sem>
8040db28:	d64f70ef          	jal	ra,8040508c <down>
8040db2c:	00048413          	mv	s0,s1
8040db30:	00442403          	lw	s0,4(s0)
8040db34:	02940063          	beq	s0,s1,8040db54 <vfs_cleanup+0x54>
8040db38:	ff842783          	lw	a5,-8(s0)
8040db3c:	00078513          	mv	a0,a5
8040db40:	fe0788e3          	beqz	a5,8040db30 <vfs_cleanup+0x30>
8040db44:	07c7a783          	lw	a5,124(a5)
8040db48:	000780e7          	jalr	a5
8040db4c:	00442403          	lw	s0,4(s0)
8040db50:	fe9414e3          	bne	s0,s1,8040db38 <vfs_cleanup+0x38>
8040db54:	00812403          	lw	s0,8(sp)
8040db58:	00c12083          	lw	ra,12(sp)
8040db5c:	00412483          	lw	s1,4(sp)
8040db60:	0008e517          	auipc	a0,0x8e
8040db64:	c0850513          	addi	a0,a0,-1016 # 8049b768 <vdev_list_sem>
8040db68:	01010113          	addi	sp,sp,16
8040db6c:	d1cf706f          	j	80405088 <up>
8040db70:	00c12083          	lw	ra,12(sp)
8040db74:	00812403          	lw	s0,8(sp)
8040db78:	00412483          	lw	s1,4(sp)
8040db7c:	01010113          	addi	sp,sp,16
8040db80:	00008067          	ret

8040db84 <vfs_get_root>:
8040db84:	fe010113          	addi	sp,sp,-32
8040db88:	00112e23          	sw	ra,28(sp)
8040db8c:	00812c23          	sw	s0,24(sp)
8040db90:	00912a23          	sw	s1,20(sp)
8040db94:	01212823          	sw	s2,16(sp)
8040db98:	01312623          	sw	s3,12(sp)
8040db9c:	01412423          	sw	s4,8(sp)
8040dba0:	0c050263          	beqz	a0,8040dc64 <vfs_get_root+0xe0>
8040dba4:	0008f917          	auipc	s2,0x8f
8040dba8:	c3090913          	addi	s2,s2,-976 # 8049c7d4 <vdev_list>
8040dbac:	00492783          	lw	a5,4(s2)
8040dbb0:	0b278663          	beq	a5,s2,8040dc5c <vfs_get_root+0xd8>
8040dbb4:	00050993          	mv	s3,a0
8040dbb8:	0008e517          	auipc	a0,0x8e
8040dbbc:	bb050513          	addi	a0,a0,-1104 # 8049b768 <vdev_list_sem>
8040dbc0:	00058a13          	mv	s4,a1
8040dbc4:	00090413          	mv	s0,s2
8040dbc8:	cc4f70ef          	jal	ra,8040508c <down>
8040dbcc:	0180006f          	j	8040dbe4 <vfs_get_root+0x60>
8040dbd0:	ff042583          	lw	a1,-16(s0)
8040dbd4:	00098513          	mv	a0,s3
8040dbd8:	409040ef          	jal	ra,804127e0 <strcmp>
8040dbdc:	00050493          	mv	s1,a0
8040dbe0:	04050063          	beqz	a0,8040dc20 <vfs_get_root+0x9c>
8040dbe4:	00442403          	lw	s0,4(s0)
8040dbe8:	ff2414e3          	bne	s0,s2,8040dbd0 <vfs_get_root+0x4c>
8040dbec:	ff300493          	li	s1,-13
8040dbf0:	0008e517          	auipc	a0,0x8e
8040dbf4:	b7850513          	addi	a0,a0,-1160 # 8049b768 <vdev_list_sem>
8040dbf8:	c90f70ef          	jal	ra,80405088 <up>
8040dbfc:	01c12083          	lw	ra,28(sp)
8040dc00:	01812403          	lw	s0,24(sp)
8040dc04:	00048513          	mv	a0,s1
8040dc08:	01012903          	lw	s2,16(sp)
8040dc0c:	01412483          	lw	s1,20(sp)
8040dc10:	00c12983          	lw	s3,12(sp)
8040dc14:	00812a03          	lw	s4,8(sp)
8040dc18:	02010113          	addi	sp,sp,32
8040dc1c:	00008067          	ret
8040dc20:	ff842503          	lw	a0,-8(s0)
8040dc24:	00050c63          	beqz	a0,8040dc3c <vfs_get_root+0xb8>
8040dc28:	07452783          	lw	a5,116(a0)
8040dc2c:	000780e7          	jalr	a5
8040dc30:	00050a63          	beqz	a0,8040dc44 <vfs_get_root+0xc0>
8040dc34:	00aa2023          	sw	a0,0(s4)
8040dc38:	fb9ff06f          	j	8040dbf0 <vfs_get_root+0x6c>
8040dc3c:	ffc42783          	lw	a5,-4(s0)
8040dc40:	00078663          	beqz	a5,8040dc4c <vfs_get_root+0xc8>
8040dc44:	ff200493          	li	s1,-14
8040dc48:	fa9ff06f          	j	8040dbf0 <vfs_get_root+0x6c>
8040dc4c:	ff442503          	lw	a0,-12(s0)
8040dc50:	ffcff0ef          	jal	ra,8040d44c <inode_ref_inc>
8040dc54:	ff442503          	lw	a0,-12(s0)
8040dc58:	fd9ff06f          	j	8040dc30 <vfs_get_root+0xac>
8040dc5c:	ff300493          	li	s1,-13
8040dc60:	f9dff06f          	j	8040dbfc <vfs_get_root+0x78>
8040dc64:	00007697          	auipc	a3,0x7
8040dc68:	41868693          	addi	a3,a3,1048 # 8041507c <syscalls+0x680>
8040dc6c:	00005617          	auipc	a2,0x5
8040dc70:	00060613          	mv	a2,a2
8040dc74:	04500593          	li	a1,69
8040dc78:	00007517          	auipc	a0,0x7
8040dc7c:	41450513          	addi	a0,a0,1044 # 8041508c <syscalls+0x690>
8040dc80:	9a5f20ef          	jal	ra,80400624 <__panic>

8040dc84 <vfs_get_devname>:
8040dc84:	0008f697          	auipc	a3,0x8f
8040dc88:	b5068693          	addi	a3,a3,-1200 # 8049c7d4 <vdev_list>
8040dc8c:	00068793          	mv	a5,a3
8040dc90:	00051863          	bnez	a0,8040dca0 <vfs_get_devname+0x1c>
8040dc94:	0240006f          	j	8040dcb8 <vfs_get_devname+0x34>
8040dc98:	ff87a703          	lw	a4,-8(a5)
8040dc9c:	00a70a63          	beq	a4,a0,8040dcb0 <vfs_get_devname+0x2c>
8040dca0:	0047a783          	lw	a5,4(a5)
8040dca4:	fed79ae3          	bne	a5,a3,8040dc98 <vfs_get_devname+0x14>
8040dca8:	00000513          	li	a0,0
8040dcac:	00008067          	ret
8040dcb0:	ff07a503          	lw	a0,-16(a5)
8040dcb4:	00008067          	ret
8040dcb8:	ff010113          	addi	sp,sp,-16
8040dcbc:	00007697          	auipc	a3,0x7
8040dcc0:	44468693          	addi	a3,a3,1092 # 80415100 <syscalls+0x704>
8040dcc4:	00005617          	auipc	a2,0x5
8040dcc8:	fa860613          	addi	a2,a2,-88 # 80412c6c <commands+0x1bc>
8040dccc:	06a00593          	li	a1,106
8040dcd0:	00007517          	auipc	a0,0x7
8040dcd4:	3bc50513          	addi	a0,a0,956 # 8041508c <syscalls+0x690>
8040dcd8:	00112623          	sw	ra,12(sp)
8040dcdc:	949f20ef          	jal	ra,80400624 <__panic>

8040dce0 <vfs_add_dev>:
8040dce0:	00060693          	mv	a3,a2
8040dce4:	00000613          	li	a2,0
8040dce8:	bb1ff06f          	j	8040d898 <vfs_do_add>

8040dcec <vfs_mount>:
8040dcec:	fe010113          	addi	sp,sp,-32
8040dcf0:	00812c23          	sw	s0,24(sp)
8040dcf4:	00050413          	mv	s0,a0
8040dcf8:	0008e517          	auipc	a0,0x8e
8040dcfc:	a7050513          	addi	a0,a0,-1424 # 8049b768 <vdev_list_sem>
8040dd00:	00112e23          	sw	ra,28(sp)
8040dd04:	00912a23          	sw	s1,20(sp)
8040dd08:	00058493          	mv	s1,a1
8040dd0c:	b80f70ef          	jal	ra,8040508c <down>
8040dd10:	00040513          	mv	a0,s0
8040dd14:	00c10593          	addi	a1,sp,12
8040dd18:	d15ff0ef          	jal	ra,8040da2c <find_mount>
8040dd1c:	00050413          	mv	s0,a0
8040dd20:	06051263          	bnez	a0,8040dd84 <vfs_mount+0x98>
8040dd24:	00c12583          	lw	a1,12(sp)
8040dd28:	0085a783          	lw	a5,8(a1)
8040dd2c:	06079e63          	bnez	a5,8040dda8 <vfs_mount+0xbc>
8040dd30:	0005a783          	lw	a5,0(a1)
8040dd34:	08078e63          	beqz	a5,8040ddd0 <vfs_mount+0xe4>
8040dd38:	00c5a783          	lw	a5,12(a1)
8040dd3c:	08078a63          	beqz	a5,8040ddd0 <vfs_mount+0xe4>
8040dd40:	0045a503          	lw	a0,4(a1)
8040dd44:	06050663          	beqz	a0,8040ddb0 <vfs_mount+0xc4>
8040dd48:	02c52703          	lw	a4,44(a0)
8040dd4c:	000017b7          	lui	a5,0x1
8040dd50:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040dd54:	04f71e63          	bne	a4,a5,8040ddb0 <vfs_mount+0xc4>
8040dd58:	00858593          	addi	a1,a1,8
8040dd5c:	000480e7          	jalr	s1
8040dd60:	00050413          	mv	s0,a0
8040dd64:	02051063          	bnez	a0,8040dd84 <vfs_mount+0x98>
8040dd68:	00c12783          	lw	a5,12(sp)
8040dd6c:	0087a703          	lw	a4,8(a5)
8040dd70:	08070063          	beqz	a4,8040ddf0 <vfs_mount+0x104>
8040dd74:	0007a583          	lw	a1,0(a5)
8040dd78:	00007517          	auipc	a0,0x7
8040dd7c:	40850513          	addi	a0,a0,1032 # 80415180 <syscalls+0x784>
8040dd80:	c7cf20ef          	jal	ra,804001fc <cprintf>
8040dd84:	0008e517          	auipc	a0,0x8e
8040dd88:	9e450513          	addi	a0,a0,-1564 # 8049b768 <vdev_list_sem>
8040dd8c:	afcf70ef          	jal	ra,80405088 <up>
8040dd90:	00040513          	mv	a0,s0
8040dd94:	01c12083          	lw	ra,28(sp)
8040dd98:	01812403          	lw	s0,24(sp)
8040dd9c:	01412483          	lw	s1,20(sp)
8040dda0:	02010113          	addi	sp,sp,32
8040dda4:	00008067          	ret
8040dda8:	ff100413          	li	s0,-15
8040ddac:	fd9ff06f          	j	8040dd84 <vfs_mount+0x98>
8040ddb0:	00007697          	auipc	a3,0x7
8040ddb4:	38868693          	addi	a3,a3,904 # 80415138 <syscalls+0x73c>
8040ddb8:	00005617          	auipc	a2,0x5
8040ddbc:	eb460613          	addi	a2,a2,-332 # 80412c6c <commands+0x1bc>
8040ddc0:	0ed00593          	li	a1,237
8040ddc4:	00007517          	auipc	a0,0x7
8040ddc8:	2c850513          	addi	a0,a0,712 # 8041508c <syscalls+0x690>
8040ddcc:	859f20ef          	jal	ra,80400624 <__panic>
8040ddd0:	00007697          	auipc	a3,0x7
8040ddd4:	33c68693          	addi	a3,a3,828 # 8041510c <syscalls+0x710>
8040ddd8:	00005617          	auipc	a2,0x5
8040dddc:	e9460613          	addi	a2,a2,-364 # 80412c6c <commands+0x1bc>
8040dde0:	0eb00593          	li	a1,235
8040dde4:	00007517          	auipc	a0,0x7
8040dde8:	2a850513          	addi	a0,a0,680 # 8041508c <syscalls+0x690>
8040ddec:	839f20ef          	jal	ra,80400624 <__panic>
8040ddf0:	00007697          	auipc	a3,0x7
8040ddf4:	37c68693          	addi	a3,a3,892 # 8041516c <syscalls+0x770>
8040ddf8:	00005617          	auipc	a2,0x5
8040ddfc:	e7460613          	addi	a2,a2,-396 # 80412c6c <commands+0x1bc>
8040de00:	0ef00593          	li	a1,239
8040de04:	00007517          	auipc	a0,0x7
8040de08:	28850513          	addi	a0,a0,648 # 8041508c <syscalls+0x690>
8040de0c:	819f20ef          	jal	ra,80400624 <__panic>

8040de10 <vfs_open>:
8040de10:	fd010113          	addi	sp,sp,-48
8040de14:	02112623          	sw	ra,44(sp)
8040de18:	02812423          	sw	s0,40(sp)
8040de1c:	02912223          	sw	s1,36(sp)
8040de20:	03212023          	sw	s2,32(sp)
8040de24:	01312e23          	sw	s3,28(sp)
8040de28:	01412c23          	sw	s4,24(sp)
8040de2c:	01512a23          	sw	s5,20(sp)
8040de30:	0035f793          	andi	a5,a1,3
8040de34:	16078e63          	beqz	a5,8040dfb0 <vfs_open+0x1a0>
8040de38:	00200713          	li	a4,2
8040de3c:	0cf76c63          	bltu	a4,a5,8040df14 <vfs_open+0x104>
8040de40:	0105fa93          	andi	s5,a1,16
8040de44:	00058493          	mv	s1,a1
8040de48:	00410593          	addi	a1,sp,4
8040de4c:	00060993          	mv	s3,a2
8040de50:	00050913          	mv	s2,a0
8040de54:	39c000ef          	jal	ra,8040e1f0 <vfs_lookup>
8040de58:	00050413          	mv	s0,a0
8040de5c:	0044fa13          	andi	s4,s1,4
8040de60:	0e051063          	bnez	a0,8040df40 <vfs_open+0x130>
8040de64:	00c4f793          	andi	a5,s1,12
8040de68:	00c00713          	li	a4,12
8040de6c:	16e78663          	beq	a5,a4,8040dfd8 <vfs_open+0x1c8>
8040de70:	00412403          	lw	s0,4(sp)
8040de74:	1a040663          	beqz	s0,8040e020 <vfs_open+0x210>
8040de78:	03c42783          	lw	a5,60(s0)
8040de7c:	16078263          	beqz	a5,8040dfe0 <vfs_open+0x1d0>
8040de80:	0047a783          	lw	a5,4(a5)
8040de84:	14078e63          	beqz	a5,8040dfe0 <vfs_open+0x1d0>
8040de88:	00040513          	mv	a0,s0
8040de8c:	00007597          	auipc	a1,0x7
8040de90:	3d458593          	addi	a1,a1,980 # 80415260 <syscalls+0x864>
8040de94:	de0ff0ef          	jal	ra,8040d474 <inode_check>
8040de98:	03c42783          	lw	a5,60(s0)
8040de9c:	00412503          	lw	a0,4(sp)
8040dea0:	00048593          	mv	a1,s1
8040dea4:	0047a783          	lw	a5,4(a5)
8040dea8:	000780e7          	jalr	a5
8040deac:	00050413          	mv	s0,a0
8040deb0:	00412503          	lw	a0,4(sp)
8040deb4:	10041e63          	bnez	s0,8040dfd0 <vfs_open+0x1c0>
8040deb8:	015a6a33          	or	s4,s4,s5
8040debc:	da4ff0ef          	jal	ra,8040d460 <inode_open_inc>
8040dec0:	040a0463          	beqz	s4,8040df08 <vfs_open+0xf8>
8040dec4:	00412483          	lw	s1,4(sp)
8040dec8:	12048c63          	beqz	s1,8040e000 <vfs_open+0x1f0>
8040decc:	03c4a783          	lw	a5,60(s1)
8040ded0:	12078863          	beqz	a5,8040e000 <vfs_open+0x1f0>
8040ded4:	0307a783          	lw	a5,48(a5)
8040ded8:	12078463          	beqz	a5,8040e000 <vfs_open+0x1f0>
8040dedc:	00007597          	auipc	a1,0x7
8040dee0:	3e058593          	addi	a1,a1,992 # 804152bc <syscalls+0x8c0>
8040dee4:	00048513          	mv	a0,s1
8040dee8:	d8cff0ef          	jal	ra,8040d474 <inode_check>
8040deec:	03c4a783          	lw	a5,60(s1)
8040def0:	00412503          	lw	a0,4(sp)
8040def4:	00000593          	li	a1,0
8040def8:	0307a783          	lw	a5,48(a5)
8040defc:	000780e7          	jalr	a5
8040df00:	00050793          	mv	a5,a0
8040df04:	0a051e63          	bnez	a0,8040dfc0 <vfs_open+0x1b0>
8040df08:	00412783          	lw	a5,4(sp)
8040df0c:	00f9a023          	sw	a5,0(s3)
8040df10:	0080006f          	j	8040df18 <vfs_open+0x108>
8040df14:	ffd00413          	li	s0,-3
8040df18:	00040513          	mv	a0,s0
8040df1c:	02c12083          	lw	ra,44(sp)
8040df20:	02812403          	lw	s0,40(sp)
8040df24:	02412483          	lw	s1,36(sp)
8040df28:	02012903          	lw	s2,32(sp)
8040df2c:	01c12983          	lw	s3,28(sp)
8040df30:	01812a03          	lw	s4,24(sp)
8040df34:	01412a83          	lw	s5,20(sp)
8040df38:	03010113          	addi	sp,sp,48
8040df3c:	00008067          	ret
8040df40:	ff000793          	li	a5,-16
8040df44:	fcf51ae3          	bne	a0,a5,8040df18 <vfs_open+0x108>
8040df48:	fc0a08e3          	beqz	s4,8040df18 <vfs_open+0x108>
8040df4c:	00810613          	addi	a2,sp,8
8040df50:	00c10593          	addi	a1,sp,12
8040df54:	00090513          	mv	a0,s2
8040df58:	37c000ef          	jal	ra,8040e2d4 <vfs_lookup_parent>
8040df5c:	00050413          	mv	s0,a0
8040df60:	fa051ce3          	bnez	a0,8040df18 <vfs_open+0x108>
8040df64:	00c12403          	lw	s0,12(sp)
8040df68:	0c040c63          	beqz	s0,8040e040 <vfs_open+0x230>
8040df6c:	03c42783          	lw	a5,60(s0)
8040df70:	0c078863          	beqz	a5,8040e040 <vfs_open+0x230>
8040df74:	0347a783          	lw	a5,52(a5)
8040df78:	0c078463          	beqz	a5,8040e040 <vfs_open+0x230>
8040df7c:	00040513          	mv	a0,s0
8040df80:	00007597          	auipc	a1,0x7
8040df84:	27858593          	addi	a1,a1,632 # 804151f8 <syscalls+0x7fc>
8040df88:	cecff0ef          	jal	ra,8040d474 <inode_check>
8040df8c:	03c42783          	lw	a5,60(s0)
8040df90:	00812583          	lw	a1,8(sp)
8040df94:	00c12503          	lw	a0,12(sp)
8040df98:	0347a783          	lw	a5,52(a5)
8040df9c:	0034d613          	srli	a2,s1,0x3
8040dfa0:	00410693          	addi	a3,sp,4
8040dfa4:	00167613          	andi	a2,a2,1
8040dfa8:	000780e7          	jalr	a5
8040dfac:	ec5ff06f          	j	8040de70 <vfs_open+0x60>
8040dfb0:	0105fa93          	andi	s5,a1,16
8040dfb4:	ffd00413          	li	s0,-3
8040dfb8:	f60a90e3          	bnez	s5,8040df18 <vfs_open+0x108>
8040dfbc:	e89ff06f          	j	8040de44 <vfs_open+0x34>
8040dfc0:	00412503          	lw	a0,4(sp)
8040dfc4:	00078413          	mv	s0,a5
8040dfc8:	e5cff0ef          	jal	ra,8040d624 <inode_open_dec>
8040dfcc:	00412503          	lw	a0,4(sp)
8040dfd0:	d70ff0ef          	jal	ra,8040d540 <inode_ref_dec>
8040dfd4:	f45ff06f          	j	8040df18 <vfs_open+0x108>
8040dfd8:	fe900413          	li	s0,-23
8040dfdc:	f3dff06f          	j	8040df18 <vfs_open+0x108>
8040dfe0:	00007697          	auipc	a3,0x7
8040dfe4:	23068693          	addi	a3,a3,560 # 80415210 <syscalls+0x814>
8040dfe8:	00005617          	auipc	a2,0x5
8040dfec:	c8460613          	addi	a2,a2,-892 # 80412c6c <commands+0x1bc>
8040dff0:	03300593          	li	a1,51
8040dff4:	00007517          	auipc	a0,0x7
8040dff8:	1ec50513          	addi	a0,a0,492 # 804151e0 <syscalls+0x7e4>
8040dffc:	e28f20ef          	jal	ra,80400624 <__panic>
8040e000:	00007697          	auipc	a3,0x7
8040e004:	26868693          	addi	a3,a3,616 # 80415268 <syscalls+0x86c>
8040e008:	00005617          	auipc	a2,0x5
8040e00c:	c6460613          	addi	a2,a2,-924 # 80412c6c <commands+0x1bc>
8040e010:	03a00593          	li	a1,58
8040e014:	00007517          	auipc	a0,0x7
8040e018:	1cc50513          	addi	a0,a0,460 # 804151e0 <syscalls+0x7e4>
8040e01c:	e08f20ef          	jal	ra,80400624 <__panic>
8040e020:	00007697          	auipc	a3,0x7
8040e024:	1e068693          	addi	a3,a3,480 # 80415200 <syscalls+0x804>
8040e028:	00005617          	auipc	a2,0x5
8040e02c:	c4460613          	addi	a2,a2,-956 # 80412c6c <commands+0x1bc>
8040e030:	03100593          	li	a1,49
8040e034:	00007517          	auipc	a0,0x7
8040e038:	1ac50513          	addi	a0,a0,428 # 804151e0 <syscalls+0x7e4>
8040e03c:	de8f20ef          	jal	ra,80400624 <__panic>
8040e040:	00007697          	auipc	a3,0x7
8040e044:	15068693          	addi	a3,a3,336 # 80415190 <syscalls+0x794>
8040e048:	00005617          	auipc	a2,0x5
8040e04c:	c2460613          	addi	a2,a2,-988 # 80412c6c <commands+0x1bc>
8040e050:	02c00593          	li	a1,44
8040e054:	00007517          	auipc	a0,0x7
8040e058:	18c50513          	addi	a0,a0,396 # 804151e0 <syscalls+0x7e4>
8040e05c:	dc8f20ef          	jal	ra,80400624 <__panic>

8040e060 <vfs_close>:
8040e060:	ff010113          	addi	sp,sp,-16
8040e064:	00112623          	sw	ra,12(sp)
8040e068:	00812423          	sw	s0,8(sp)
8040e06c:	00050413          	mv	s0,a0
8040e070:	db4ff0ef          	jal	ra,8040d624 <inode_open_dec>
8040e074:	00040513          	mv	a0,s0
8040e078:	cc8ff0ef          	jal	ra,8040d540 <inode_ref_dec>
8040e07c:	00c12083          	lw	ra,12(sp)
8040e080:	00812403          	lw	s0,8(sp)
8040e084:	00000513          	li	a0,0
8040e088:	01010113          	addi	sp,sp,16
8040e08c:	00008067          	ret

8040e090 <get_device>:
8040e090:	fe010113          	addi	sp,sp,-32
8040e094:	00812c23          	sw	s0,24(sp)
8040e098:	00912a23          	sw	s1,20(sp)
8040e09c:	01212823          	sw	s2,16(sp)
8040e0a0:	00112e23          	sw	ra,28(sp)
8040e0a4:	00054783          	lbu	a5,0(a0)
8040e0a8:	00050413          	mv	s0,a0
8040e0ac:	00058913          	mv	s2,a1
8040e0b0:	00060493          	mv	s1,a2
8040e0b4:	04078263          	beqz	a5,8040e0f8 <get_device+0x68>
8040e0b8:	03a00713          	li	a4,58
8040e0bc:	0ae78463          	beq	a5,a4,8040e164 <get_device+0xd4>
8040e0c0:	02f00713          	li	a4,47
8040e0c4:	0ee78e63          	beq	a5,a4,8040e1c0 <get_device+0x130>
8040e0c8:	00150693          	addi	a3,a0,1
8040e0cc:	00000793          	li	a5,0
8040e0d0:	03a00813          	li	a6,58
8040e0d4:	02f00893          	li	a7,47
8040e0d8:	0140006f          	j	8040e0ec <get_device+0x5c>
8040e0dc:	05070063          	beq	a4,a6,8040e11c <get_device+0x8c>
8040e0e0:	00168693          	addi	a3,a3,1
8040e0e4:	00050793          	mv	a5,a0
8040e0e8:	01170863          	beq	a4,a7,8040e0f8 <get_device+0x68>
8040e0ec:	0006c703          	lbu	a4,0(a3)
8040e0f0:	00178513          	addi	a0,a5,1
8040e0f4:	fe0714e3          	bnez	a4,8040e0dc <get_device+0x4c>
8040e0f8:	00892023          	sw	s0,0(s2)
8040e0fc:	00048513          	mv	a0,s1
8040e100:	224000ef          	jal	ra,8040e324 <vfs_get_curdir>
8040e104:	01c12083          	lw	ra,28(sp)
8040e108:	01812403          	lw	s0,24(sp)
8040e10c:	01412483          	lw	s1,20(sp)
8040e110:	01012903          	lw	s2,16(sp)
8040e114:	02010113          	addi	sp,sp,32
8040e118:	00008067          	ret
8040e11c:	00278793          	addi	a5,a5,2
8040e120:	00068023          	sb	zero,0(a3)
8040e124:	00f407b3          	add	a5,s0,a5
8040e128:	02f00693          	li	a3,47
8040e12c:	00078513          	mv	a0,a5
8040e130:	00178793          	addi	a5,a5,1
8040e134:	fff7c703          	lbu	a4,-1(a5)
8040e138:	fed70ae3          	beq	a4,a3,8040e12c <get_device+0x9c>
8040e13c:	00a92023          	sw	a0,0(s2)
8040e140:	00048593          	mv	a1,s1
8040e144:	00040513          	mv	a0,s0
8040e148:	a3dff0ef          	jal	ra,8040db84 <vfs_get_root>
8040e14c:	01c12083          	lw	ra,28(sp)
8040e150:	01812403          	lw	s0,24(sp)
8040e154:	01412483          	lw	s1,20(sp)
8040e158:	01012903          	lw	s2,16(sp)
8040e15c:	02010113          	addi	sp,sp,32
8040e160:	00008067          	ret
8040e164:	00c10513          	addi	a0,sp,12
8040e168:	1bc000ef          	jal	ra,8040e324 <vfs_get_curdir>
8040e16c:	fe0510e3          	bnez	a0,8040e14c <get_device+0xbc>
8040e170:	00c12783          	lw	a5,12(sp)
8040e174:	0387a503          	lw	a0,56(a5)
8040e178:	04050c63          	beqz	a0,8040e1d0 <get_device+0x140>
8040e17c:	07452783          	lw	a5,116(a0)
8040e180:	000780e7          	jalr	a5
8040e184:	00a4a023          	sw	a0,0(s1)
8040e188:	00c12503          	lw	a0,12(sp)
8040e18c:	bb4ff0ef          	jal	ra,8040d540 <inode_ref_dec>
8040e190:	02f00713          	li	a4,47
8040e194:	00140413          	addi	s0,s0,1
8040e198:	00044783          	lbu	a5,0(s0)
8040e19c:	fee78ce3          	beq	a5,a4,8040e194 <get_device+0x104>
8040e1a0:	00892023          	sw	s0,0(s2)
8040e1a4:	01c12083          	lw	ra,28(sp)
8040e1a8:	01812403          	lw	s0,24(sp)
8040e1ac:	01412483          	lw	s1,20(sp)
8040e1b0:	01012903          	lw	s2,16(sp)
8040e1b4:	00000513          	li	a0,0
8040e1b8:	02010113          	addi	sp,sp,32
8040e1bc:	00008067          	ret
8040e1c0:	00060513          	mv	a0,a2
8040e1c4:	e58ff0ef          	jal	ra,8040d81c <vfs_get_bootfs>
8040e1c8:	fc0504e3          	beqz	a0,8040e190 <get_device+0x100>
8040e1cc:	f81ff06f          	j	8040e14c <get_device+0xbc>
8040e1d0:	00007697          	auipc	a3,0x7
8040e1d4:	0f868693          	addi	a3,a3,248 # 804152c8 <syscalls+0x8cc>
8040e1d8:	00005617          	auipc	a2,0x5
8040e1dc:	a9460613          	addi	a2,a2,-1388 # 80412c6c <commands+0x1bc>
8040e1e0:	03900593          	li	a1,57
8040e1e4:	00007517          	auipc	a0,0x7
8040e1e8:	0f850513          	addi	a0,a0,248 # 804152dc <syscalls+0x8e0>
8040e1ec:	c38f20ef          	jal	ra,80400624 <__panic>

8040e1f0 <vfs_lookup>:
8040e1f0:	fd010113          	addi	sp,sp,-48
8040e1f4:	03212023          	sw	s2,32(sp)
8040e1f8:	01c10613          	addi	a2,sp,28
8040e1fc:	00058913          	mv	s2,a1
8040e200:	00c10593          	addi	a1,sp,12
8040e204:	02812423          	sw	s0,40(sp)
8040e208:	02112623          	sw	ra,44(sp)
8040e20c:	02912223          	sw	s1,36(sp)
8040e210:	00a12623          	sw	a0,12(sp)
8040e214:	e7dff0ef          	jal	ra,8040e090 <get_device>
8040e218:	00050413          	mv	s0,a0
8040e21c:	04051e63          	bnez	a0,8040e278 <vfs_lookup+0x88>
8040e220:	00c12783          	lw	a5,12(sp)
8040e224:	01c12483          	lw	s1,28(sp)
8040e228:	0007c783          	lbu	a5,0(a5)
8040e22c:	06078463          	beqz	a5,8040e294 <vfs_lookup+0xa4>
8040e230:	08048263          	beqz	s1,8040e2b4 <vfs_lookup+0xc4>
8040e234:	03c4a783          	lw	a5,60(s1)
8040e238:	06078e63          	beqz	a5,8040e2b4 <vfs_lookup+0xc4>
8040e23c:	0387a783          	lw	a5,56(a5)
8040e240:	06078a63          	beqz	a5,8040e2b4 <vfs_lookup+0xc4>
8040e244:	00048513          	mv	a0,s1
8040e248:	00007597          	auipc	a1,0x7
8040e24c:	0fc58593          	addi	a1,a1,252 # 80415344 <syscalls+0x948>
8040e250:	a24ff0ef          	jal	ra,8040d474 <inode_check>
8040e254:	03c4a783          	lw	a5,60(s1)
8040e258:	00c12583          	lw	a1,12(sp)
8040e25c:	01c12503          	lw	a0,28(sp)
8040e260:	0387a783          	lw	a5,56(a5)
8040e264:	00090613          	mv	a2,s2
8040e268:	000780e7          	jalr	a5
8040e26c:	00050413          	mv	s0,a0
8040e270:	01c12503          	lw	a0,28(sp)
8040e274:	accff0ef          	jal	ra,8040d540 <inode_ref_dec>
8040e278:	00040513          	mv	a0,s0
8040e27c:	02c12083          	lw	ra,44(sp)
8040e280:	02812403          	lw	s0,40(sp)
8040e284:	02412483          	lw	s1,36(sp)
8040e288:	02012903          	lw	s2,32(sp)
8040e28c:	03010113          	addi	sp,sp,48
8040e290:	00008067          	ret
8040e294:	00040513          	mv	a0,s0
8040e298:	02c12083          	lw	ra,44(sp)
8040e29c:	02812403          	lw	s0,40(sp)
8040e2a0:	00992023          	sw	s1,0(s2)
8040e2a4:	02412483          	lw	s1,36(sp)
8040e2a8:	02012903          	lw	s2,32(sp)
8040e2ac:	03010113          	addi	sp,sp,48
8040e2b0:	00008067          	ret
8040e2b4:	00007697          	auipc	a3,0x7
8040e2b8:	04068693          	addi	a3,a3,64 # 804152f4 <syscalls+0x8f8>
8040e2bc:	00005617          	auipc	a2,0x5
8040e2c0:	9b060613          	addi	a2,a2,-1616 # 80412c6c <commands+0x1bc>
8040e2c4:	04f00593          	li	a1,79
8040e2c8:	00007517          	auipc	a0,0x7
8040e2cc:	01450513          	addi	a0,a0,20 # 804152dc <syscalls+0x8e0>
8040e2d0:	b54f20ef          	jal	ra,80400624 <__panic>

8040e2d4 <vfs_lookup_parent>:
8040e2d4:	fd010113          	addi	sp,sp,-48
8040e2d8:	02812423          	sw	s0,40(sp)
8040e2dc:	02912223          	sw	s1,36(sp)
8040e2e0:	00058413          	mv	s0,a1
8040e2e4:	00060493          	mv	s1,a2
8040e2e8:	00c10593          	addi	a1,sp,12
8040e2ec:	01c10613          	addi	a2,sp,28
8040e2f0:	02112623          	sw	ra,44(sp)
8040e2f4:	00a12623          	sw	a0,12(sp)
8040e2f8:	d99ff0ef          	jal	ra,8040e090 <get_device>
8040e2fc:	00051a63          	bnez	a0,8040e310 <vfs_lookup_parent+0x3c>
8040e300:	00c12783          	lw	a5,12(sp)
8040e304:	00f4a023          	sw	a5,0(s1)
8040e308:	01c12783          	lw	a5,28(sp)
8040e30c:	00f42023          	sw	a5,0(s0)
8040e310:	02c12083          	lw	ra,44(sp)
8040e314:	02812403          	lw	s0,40(sp)
8040e318:	02412483          	lw	s1,36(sp)
8040e31c:	03010113          	addi	sp,sp,48
8040e320:	00008067          	ret

8040e324 <vfs_get_curdir>:
8040e324:	0008e797          	auipc	a5,0x8e
8040e328:	48c78793          	addi	a5,a5,1164 # 8049c7b0 <current>
8040e32c:	0007a783          	lw	a5,0(a5)
8040e330:	ff010113          	addi	sp,sp,-16
8040e334:	00812423          	sw	s0,8(sp)
8040e338:	0dc7a783          	lw	a5,220(a5)
8040e33c:	00112623          	sw	ra,12(sp)
8040e340:	00912223          	sw	s1,4(sp)
8040e344:	0007a403          	lw	s0,0(a5)
8040e348:	02040663          	beqz	s0,8040e374 <vfs_get_curdir+0x50>
8040e34c:	00050493          	mv	s1,a0
8040e350:	00040513          	mv	a0,s0
8040e354:	8f8ff0ef          	jal	ra,8040d44c <inode_ref_inc>
8040e358:	00000513          	li	a0,0
8040e35c:	0084a023          	sw	s0,0(s1)
8040e360:	00c12083          	lw	ra,12(sp)
8040e364:	00812403          	lw	s0,8(sp)
8040e368:	00412483          	lw	s1,4(sp)
8040e36c:	01010113          	addi	sp,sp,16
8040e370:	00008067          	ret
8040e374:	ff000513          	li	a0,-16
8040e378:	fe9ff06f          	j	8040e360 <vfs_get_curdir+0x3c>

8040e37c <vfs_set_curdir>:
8040e37c:	fd010113          	addi	sp,sp,-48
8040e380:	02912223          	sw	s1,36(sp)
8040e384:	0008e497          	auipc	s1,0x8e
8040e388:	42c48493          	addi	s1,s1,1068 # 8049c7b0 <current>
8040e38c:	0004a783          	lw	a5,0(s1)
8040e390:	02812423          	sw	s0,40(sp)
8040e394:	00050413          	mv	s0,a0
8040e398:	0dc7a503          	lw	a0,220(a5)
8040e39c:	01312e23          	sw	s3,28(sp)
8040e3a0:	02112623          	sw	ra,44(sp)
8040e3a4:	03212023          	sw	s2,32(sp)
8040e3a8:	e4df70ef          	jal	ra,804061f4 <lock_files>
8040e3ac:	0004a783          	lw	a5,0(s1)
8040e3b0:	0dc7a503          	lw	a0,220(a5)
8040e3b4:	00052983          	lw	s3,0(a0)
8040e3b8:	0b340863          	beq	s0,s3,8040e468 <vfs_set_curdir+0xec>
8040e3bc:	08040a63          	beqz	s0,8040e450 <vfs_set_curdir+0xd4>
8040e3c0:	03c42783          	lw	a5,60(s0)
8040e3c4:	0a078663          	beqz	a5,8040e470 <vfs_set_curdir+0xf4>
8040e3c8:	0287a783          	lw	a5,40(a5)
8040e3cc:	0a078263          	beqz	a5,8040e470 <vfs_set_curdir+0xf4>
8040e3d0:	00007597          	auipc	a1,0x7
8040e3d4:	04458593          	addi	a1,a1,68 # 80415414 <syscalls+0xa18>
8040e3d8:	00040513          	mv	a0,s0
8040e3dc:	898ff0ef          	jal	ra,8040d474 <inode_check>
8040e3e0:	03c42783          	lw	a5,60(s0)
8040e3e4:	00c10593          	addi	a1,sp,12
8040e3e8:	00040513          	mv	a0,s0
8040e3ec:	0287a783          	lw	a5,40(a5)
8040e3f0:	000780e7          	jalr	a5
8040e3f4:	00050913          	mv	s2,a0
8040e3f8:	00051e63          	bnez	a0,8040e414 <vfs_set_curdir+0x98>
8040e3fc:	00c12683          	lw	a3,12(sp)
8040e400:	000077b7          	lui	a5,0x7
8040e404:	00002737          	lui	a4,0x2
8040e408:	00d7f7b3          	and	a5,a5,a3
8040e40c:	fee00913          	li	s2,-18
8040e410:	02e78863          	beq	a5,a4,8040e440 <vfs_set_curdir+0xc4>
8040e414:	0004a783          	lw	a5,0(s1)
8040e418:	0dc7a503          	lw	a0,220(a5) # 70dc <_binary_bin_swap_img_size-0xf24>
8040e41c:	de1f70ef          	jal	ra,804061fc <unlock_files>
8040e420:	02c12083          	lw	ra,44(sp)
8040e424:	02812403          	lw	s0,40(sp)
8040e428:	00090513          	mv	a0,s2
8040e42c:	02412483          	lw	s1,36(sp)
8040e430:	02012903          	lw	s2,32(sp)
8040e434:	01c12983          	lw	s3,28(sp)
8040e438:	03010113          	addi	sp,sp,48
8040e43c:	00008067          	ret
8040e440:	00040513          	mv	a0,s0
8040e444:	808ff0ef          	jal	ra,8040d44c <inode_ref_inc>
8040e448:	0004a783          	lw	a5,0(s1)
8040e44c:	0dc7a503          	lw	a0,220(a5)
8040e450:	00852023          	sw	s0,0(a0)
8040e454:	00000913          	li	s2,0
8040e458:	fc0982e3          	beqz	s3,8040e41c <vfs_set_curdir+0xa0>
8040e45c:	00098513          	mv	a0,s3
8040e460:	8e0ff0ef          	jal	ra,8040d540 <inode_ref_dec>
8040e464:	fb1ff06f          	j	8040e414 <vfs_set_curdir+0x98>
8040e468:	00000913          	li	s2,0
8040e46c:	fb1ff06f          	j	8040e41c <vfs_set_curdir+0xa0>
8040e470:	00007697          	auipc	a3,0x7
8040e474:	f3c68693          	addi	a3,a3,-196 # 804153ac <syscalls+0x9b0>
8040e478:	00004617          	auipc	a2,0x4
8040e47c:	7f460613          	addi	a2,a2,2036 # 80412c6c <commands+0x1bc>
8040e480:	04300593          	li	a1,67
8040e484:	00007517          	auipc	a0,0x7
8040e488:	f7850513          	addi	a0,a0,-136 # 804153fc <syscalls+0xa00>
8040e48c:	998f20ef          	jal	ra,80400624 <__panic>

8040e490 <vfs_chdir>:
8040e490:	fe010113          	addi	sp,sp,-32
8040e494:	00c10593          	addi	a1,sp,12
8040e498:	00812c23          	sw	s0,24(sp)
8040e49c:	00112e23          	sw	ra,28(sp)
8040e4a0:	d51ff0ef          	jal	ra,8040e1f0 <vfs_lookup>
8040e4a4:	00050413          	mv	s0,a0
8040e4a8:	00050c63          	beqz	a0,8040e4c0 <vfs_chdir+0x30>
8040e4ac:	00040513          	mv	a0,s0
8040e4b0:	01c12083          	lw	ra,28(sp)
8040e4b4:	01812403          	lw	s0,24(sp)
8040e4b8:	02010113          	addi	sp,sp,32
8040e4bc:	00008067          	ret
8040e4c0:	00c12503          	lw	a0,12(sp)
8040e4c4:	eb9ff0ef          	jal	ra,8040e37c <vfs_set_curdir>
8040e4c8:	00050413          	mv	s0,a0
8040e4cc:	00c12503          	lw	a0,12(sp)
8040e4d0:	870ff0ef          	jal	ra,8040d540 <inode_ref_dec>
8040e4d4:	00040513          	mv	a0,s0
8040e4d8:	01c12083          	lw	ra,28(sp)
8040e4dc:	01812403          	lw	s0,24(sp)
8040e4e0:	02010113          	addi	sp,sp,32
8040e4e4:	00008067          	ret

8040e4e8 <vfs_getcwd>:
8040e4e8:	0008e797          	auipc	a5,0x8e
8040e4ec:	2c878793          	addi	a5,a5,712 # 8049c7b0 <current>
8040e4f0:	0007a783          	lw	a5,0(a5)
8040e4f4:	fe010113          	addi	sp,sp,-32
8040e4f8:	00812c23          	sw	s0,24(sp)
8040e4fc:	0dc7a783          	lw	a5,220(a5)
8040e500:	00112e23          	sw	ra,28(sp)
8040e504:	00912a23          	sw	s1,20(sp)
8040e508:	0007a403          	lw	s0,0(a5)
8040e50c:	01212823          	sw	s2,16(sp)
8040e510:	0c040663          	beqz	s0,8040e5dc <vfs_getcwd+0xf4>
8040e514:	00050493          	mv	s1,a0
8040e518:	00040513          	mv	a0,s0
8040e51c:	f31fe0ef          	jal	ra,8040d44c <inode_ref_inc>
8040e520:	03842503          	lw	a0,56(s0)
8040e524:	0c050063          	beqz	a0,8040e5e4 <vfs_getcwd+0xfc>
8040e528:	f5cff0ef          	jal	ra,8040dc84 <vfs_get_devname>
8040e52c:	00050913          	mv	s2,a0
8040e530:	228040ef          	jal	ra,80412758 <strlen>
8040e534:	00050613          	mv	a2,a0
8040e538:	00090593          	mv	a1,s2
8040e53c:	00000713          	li	a4,0
8040e540:	00100693          	li	a3,1
8040e544:	00048513          	mv	a0,s1
8040e548:	fadf70ef          	jal	ra,804064f4 <iobuf_move>
8040e54c:	00050913          	mv	s2,a0
8040e550:	02050463          	beqz	a0,8040e578 <vfs_getcwd+0x90>
8040e554:	00040513          	mv	a0,s0
8040e558:	fe9fe0ef          	jal	ra,8040d540 <inode_ref_dec>
8040e55c:	01c12083          	lw	ra,28(sp)
8040e560:	01812403          	lw	s0,24(sp)
8040e564:	00090513          	mv	a0,s2
8040e568:	01412483          	lw	s1,20(sp)
8040e56c:	01012903          	lw	s2,16(sp)
8040e570:	02010113          	addi	sp,sp,32
8040e574:	00008067          	ret
8040e578:	03a00793          	li	a5,58
8040e57c:	00000713          	li	a4,0
8040e580:	00100693          	li	a3,1
8040e584:	00100613          	li	a2,1
8040e588:	00f10593          	addi	a1,sp,15
8040e58c:	00048513          	mv	a0,s1
8040e590:	00f107a3          	sb	a5,15(sp)
8040e594:	f61f70ef          	jal	ra,804064f4 <iobuf_move>
8040e598:	00050913          	mv	s2,a0
8040e59c:	fa051ce3          	bnez	a0,8040e554 <vfs_getcwd+0x6c>
8040e5a0:	03c42783          	lw	a5,60(s0)
8040e5a4:	06078063          	beqz	a5,8040e604 <vfs_getcwd+0x11c>
8040e5a8:	01c7a783          	lw	a5,28(a5)
8040e5ac:	04078c63          	beqz	a5,8040e604 <vfs_getcwd+0x11c>
8040e5b0:	00007597          	auipc	a1,0x7
8040e5b4:	df058593          	addi	a1,a1,-528 # 804153a0 <syscalls+0x9a4>
8040e5b8:	00040513          	mv	a0,s0
8040e5bc:	eb9fe0ef          	jal	ra,8040d474 <inode_check>
8040e5c0:	03c42783          	lw	a5,60(s0)
8040e5c4:	00048593          	mv	a1,s1
8040e5c8:	00040513          	mv	a0,s0
8040e5cc:	01c7a783          	lw	a5,28(a5)
8040e5d0:	000780e7          	jalr	a5
8040e5d4:	00050913          	mv	s2,a0
8040e5d8:	f7dff06f          	j	8040e554 <vfs_getcwd+0x6c>
8040e5dc:	ff000913          	li	s2,-16
8040e5e0:	f7dff06f          	j	8040e55c <vfs_getcwd+0x74>
8040e5e4:	00007697          	auipc	a3,0x7
8040e5e8:	ce468693          	addi	a3,a3,-796 # 804152c8 <syscalls+0x8cc>
8040e5ec:	00004617          	auipc	a2,0x4
8040e5f0:	68060613          	addi	a2,a2,1664 # 80412c6c <commands+0x1bc>
8040e5f4:	06e00593          	li	a1,110
8040e5f8:	00007517          	auipc	a0,0x7
8040e5fc:	e0450513          	addi	a0,a0,-508 # 804153fc <syscalls+0xa00>
8040e600:	824f20ef          	jal	ra,80400624 <__panic>
8040e604:	00007697          	auipc	a3,0x7
8040e608:	d4868693          	addi	a3,a3,-696 # 8041534c <syscalls+0x950>
8040e60c:	00004617          	auipc	a2,0x4
8040e610:	66060613          	addi	a2,a2,1632 # 80412c6c <commands+0x1bc>
8040e614:	07800593          	li	a1,120
8040e618:	00007517          	auipc	a0,0x7
8040e61c:	de450513          	addi	a0,a0,-540 # 804153fc <syscalls+0xa00>
8040e620:	804f20ef          	jal	ra,80400624 <__panic>

8040e624 <dev_lookup>:
8040e624:	0005c703          	lbu	a4,0(a1)
8040e628:	02071e63          	bnez	a4,8040e664 <dev_lookup+0x40>
8040e62c:	ff010113          	addi	sp,sp,-16
8040e630:	00812423          	sw	s0,8(sp)
8040e634:	00912223          	sw	s1,4(sp)
8040e638:	00112623          	sw	ra,12(sp)
8040e63c:	00050493          	mv	s1,a0
8040e640:	00060413          	mv	s0,a2
8040e644:	e09fe0ef          	jal	ra,8040d44c <inode_ref_inc>
8040e648:	00c12083          	lw	ra,12(sp)
8040e64c:	00942023          	sw	s1,0(s0)
8040e650:	00812403          	lw	s0,8(sp)
8040e654:	00412483          	lw	s1,4(sp)
8040e658:	00000513          	li	a0,0
8040e65c:	01010113          	addi	sp,sp,16
8040e660:	00008067          	ret
8040e664:	ff000513          	li	a0,-16
8040e668:	00008067          	ret

8040e66c <dev_ioctl>:
8040e66c:	00050e63          	beqz	a0,8040e688 <dev_ioctl+0x1c>
8040e670:	02c52683          	lw	a3,44(a0)
8040e674:	00001737          	lui	a4,0x1
8040e678:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e67c:	00e69663          	bne	a3,a4,8040e688 <dev_ioctl+0x1c>
8040e680:	01452303          	lw	t1,20(a0)
8040e684:	00030067          	jr	t1
8040e688:	ff010113          	addi	sp,sp,-16
8040e68c:	00007697          	auipc	a3,0x7
8040e690:	aac68693          	addi	a3,a3,-1364 # 80415138 <syscalls+0x73c>
8040e694:	00004617          	auipc	a2,0x4
8040e698:	5d860613          	addi	a2,a2,1496 # 80412c6c <commands+0x1bc>
8040e69c:	03500593          	li	a1,53
8040e6a0:	00007517          	auipc	a0,0x7
8040e6a4:	d7c50513          	addi	a0,a0,-644 # 8041541c <syscalls+0xa20>
8040e6a8:	00112623          	sw	ra,12(sp)
8040e6ac:	f79f10ef          	jal	ra,80400624 <__panic>

8040e6b0 <dev_tryseek>:
8040e6b0:	ff010113          	addi	sp,sp,-16
8040e6b4:	00112623          	sw	ra,12(sp)
8040e6b8:	00812423          	sw	s0,8(sp)
8040e6bc:	00912223          	sw	s1,4(sp)
8040e6c0:	01212023          	sw	s2,0(sp)
8040e6c4:	06050663          	beqz	a0,8040e730 <dev_tryseek+0x80>
8040e6c8:	02c52703          	lw	a4,44(a0)
8040e6cc:	000017b7          	lui	a5,0x1
8040e6d0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e6d4:	04f71e63          	bne	a4,a5,8040e730 <dev_tryseek+0x80>
8040e6d8:	00052483          	lw	s1,0(a0)
8040e6dc:	04048663          	beqz	s1,8040e728 <dev_tryseek+0x78>
8040e6e0:	00452903          	lw	s2,4(a0)
8040e6e4:	00058413          	mv	s0,a1
8040e6e8:	00058513          	mv	a0,a1
8040e6ec:	00090593          	mv	a1,s2
8040e6f0:	254040ef          	jal	ra,80412944 <__umodsi3>
8040e6f4:	02051a63          	bnez	a0,8040e728 <dev_tryseek+0x78>
8040e6f8:	02044863          	bltz	s0,8040e728 <dev_tryseek+0x78>
8040e6fc:	00090593          	mv	a1,s2
8040e700:	00048513          	mv	a0,s1
8040e704:	1cc040ef          	jal	ra,804128d0 <__mulsi3>
8040e708:	02a47063          	bgeu	s0,a0,8040e728 <dev_tryseek+0x78>
8040e70c:	00000513          	li	a0,0
8040e710:	00c12083          	lw	ra,12(sp)
8040e714:	00812403          	lw	s0,8(sp)
8040e718:	00412483          	lw	s1,4(sp)
8040e71c:	00012903          	lw	s2,0(sp)
8040e720:	01010113          	addi	sp,sp,16
8040e724:	00008067          	ret
8040e728:	ffd00513          	li	a0,-3
8040e72c:	fe5ff06f          	j	8040e710 <dev_tryseek+0x60>
8040e730:	00007697          	auipc	a3,0x7
8040e734:	a0868693          	addi	a3,a3,-1528 # 80415138 <syscalls+0x73c>
8040e738:	00004617          	auipc	a2,0x4
8040e73c:	53460613          	addi	a2,a2,1332 # 80412c6c <commands+0x1bc>
8040e740:	05f00593          	li	a1,95
8040e744:	00007517          	auipc	a0,0x7
8040e748:	cd850513          	addi	a0,a0,-808 # 8041541c <syscalls+0xa20>
8040e74c:	ed9f10ef          	jal	ra,80400624 <__panic>

8040e750 <dev_gettype>:
8040e750:	02050e63          	beqz	a0,8040e78c <dev_gettype+0x3c>
8040e754:	02c52703          	lw	a4,44(a0)
8040e758:	000017b7          	lui	a5,0x1
8040e75c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e760:	02f71663          	bne	a4,a5,8040e78c <dev_gettype+0x3c>
8040e764:	00052703          	lw	a4,0(a0)
8040e768:	000057b7          	lui	a5,0x5
8040e76c:	00070863          	beqz	a4,8040e77c <dev_gettype+0x2c>
8040e770:	00f5a023          	sw	a5,0(a1)
8040e774:	00000513          	li	a0,0
8040e778:	00008067          	ret
8040e77c:	000047b7          	lui	a5,0x4
8040e780:	00f5a023          	sw	a5,0(a1)
8040e784:	00000513          	li	a0,0
8040e788:	00008067          	ret
8040e78c:	ff010113          	addi	sp,sp,-16
8040e790:	00007697          	auipc	a3,0x7
8040e794:	9a868693          	addi	a3,a3,-1624 # 80415138 <syscalls+0x73c>
8040e798:	00004617          	auipc	a2,0x4
8040e79c:	4d460613          	addi	a2,a2,1236 # 80412c6c <commands+0x1bc>
8040e7a0:	05300593          	li	a1,83
8040e7a4:	00007517          	auipc	a0,0x7
8040e7a8:	c7850513          	addi	a0,a0,-904 # 8041541c <syscalls+0xa20>
8040e7ac:	00112623          	sw	ra,12(sp)
8040e7b0:	e75f10ef          	jal	ra,80400624 <__panic>

8040e7b4 <dev_write>:
8040e7b4:	02050063          	beqz	a0,8040e7d4 <dev_write+0x20>
8040e7b8:	02c52683          	lw	a3,44(a0)
8040e7bc:	00001737          	lui	a4,0x1
8040e7c0:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e7c4:	00e69863          	bne	a3,a4,8040e7d4 <dev_write+0x20>
8040e7c8:	01052303          	lw	t1,16(a0)
8040e7cc:	00100613          	li	a2,1
8040e7d0:	00030067          	jr	t1
8040e7d4:	ff010113          	addi	sp,sp,-16
8040e7d8:	00007697          	auipc	a3,0x7
8040e7dc:	96068693          	addi	a3,a3,-1696 # 80415138 <syscalls+0x73c>
8040e7e0:	00004617          	auipc	a2,0x4
8040e7e4:	48c60613          	addi	a2,a2,1164 # 80412c6c <commands+0x1bc>
8040e7e8:	02c00593          	li	a1,44
8040e7ec:	00007517          	auipc	a0,0x7
8040e7f0:	c3050513          	addi	a0,a0,-976 # 8041541c <syscalls+0xa20>
8040e7f4:	00112623          	sw	ra,12(sp)
8040e7f8:	e2df10ef          	jal	ra,80400624 <__panic>

8040e7fc <dev_read>:
8040e7fc:	02050063          	beqz	a0,8040e81c <dev_read+0x20>
8040e800:	02c52683          	lw	a3,44(a0)
8040e804:	00001737          	lui	a4,0x1
8040e808:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e80c:	00e69863          	bne	a3,a4,8040e81c <dev_read+0x20>
8040e810:	01052303          	lw	t1,16(a0)
8040e814:	00000613          	li	a2,0
8040e818:	00030067          	jr	t1
8040e81c:	ff010113          	addi	sp,sp,-16
8040e820:	00007697          	auipc	a3,0x7
8040e824:	91868693          	addi	a3,a3,-1768 # 80415138 <syscalls+0x73c>
8040e828:	00004617          	auipc	a2,0x4
8040e82c:	44460613          	addi	a2,a2,1092 # 80412c6c <commands+0x1bc>
8040e830:	02300593          	li	a1,35
8040e834:	00007517          	auipc	a0,0x7
8040e838:	be850513          	addi	a0,a0,-1048 # 8041541c <syscalls+0xa20>
8040e83c:	00112623          	sw	ra,12(sp)
8040e840:	de5f10ef          	jal	ra,80400624 <__panic>

8040e844 <dev_close>:
8040e844:	00050e63          	beqz	a0,8040e860 <dev_close+0x1c>
8040e848:	02c52683          	lw	a3,44(a0)
8040e84c:	00001737          	lui	a4,0x1
8040e850:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e854:	00e69663          	bne	a3,a4,8040e860 <dev_close+0x1c>
8040e858:	00c52303          	lw	t1,12(a0)
8040e85c:	00030067          	jr	t1
8040e860:	ff010113          	addi	sp,sp,-16
8040e864:	00007697          	auipc	a3,0x7
8040e868:	8d468693          	addi	a3,a3,-1836 # 80415138 <syscalls+0x73c>
8040e86c:	00004617          	auipc	a2,0x4
8040e870:	40060613          	addi	a2,a2,1024 # 80412c6c <commands+0x1bc>
8040e874:	01a00593          	li	a1,26
8040e878:	00007517          	auipc	a0,0x7
8040e87c:	ba450513          	addi	a0,a0,-1116 # 8041541c <syscalls+0xa20>
8040e880:	00112623          	sw	ra,12(sp)
8040e884:	da1f10ef          	jal	ra,80400624 <__panic>

8040e888 <dev_open>:
8040e888:	03c5f713          	andi	a4,a1,60
8040e88c:	02071063          	bnez	a4,8040e8ac <dev_open+0x24>
8040e890:	02050263          	beqz	a0,8040e8b4 <dev_open+0x2c>
8040e894:	02c52683          	lw	a3,44(a0)
8040e898:	00001737          	lui	a4,0x1
8040e89c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e8a0:	00e69a63          	bne	a3,a4,8040e8b4 <dev_open+0x2c>
8040e8a4:	00852303          	lw	t1,8(a0)
8040e8a8:	00030067          	jr	t1
8040e8ac:	ffd00513          	li	a0,-3
8040e8b0:	00008067          	ret
8040e8b4:	ff010113          	addi	sp,sp,-16
8040e8b8:	00007697          	auipc	a3,0x7
8040e8bc:	88068693          	addi	a3,a3,-1920 # 80415138 <syscalls+0x73c>
8040e8c0:	00004617          	auipc	a2,0x4
8040e8c4:	3ac60613          	addi	a2,a2,940 # 80412c6c <commands+0x1bc>
8040e8c8:	01100593          	li	a1,17
8040e8cc:	00007517          	auipc	a0,0x7
8040e8d0:	b5050513          	addi	a0,a0,-1200 # 8041541c <syscalls+0xa20>
8040e8d4:	00112623          	sw	ra,12(sp)
8040e8d8:	d4df10ef          	jal	ra,80400624 <__panic>

8040e8dc <dev_fstat>:
8040e8dc:	ff010113          	addi	sp,sp,-16
8040e8e0:	00912223          	sw	s1,4(sp)
8040e8e4:	00058493          	mv	s1,a1
8040e8e8:	00812423          	sw	s0,8(sp)
8040e8ec:	01000613          	li	a2,16
8040e8f0:	00050413          	mv	s0,a0
8040e8f4:	00000593          	li	a1,0
8040e8f8:	00048513          	mv	a0,s1
8040e8fc:	00112623          	sw	ra,12(sp)
8040e900:	01212023          	sw	s2,0(sp)
8040e904:	739030ef          	jal	ra,8041283c <memset>
8040e908:	08040463          	beqz	s0,8040e990 <dev_fstat+0xb4>
8040e90c:	03c42783          	lw	a5,60(s0)
8040e910:	08078063          	beqz	a5,8040e990 <dev_fstat+0xb4>
8040e914:	0287a783          	lw	a5,40(a5) # 4028 <_binary_bin_swap_img_size-0x3fd8>
8040e918:	06078c63          	beqz	a5,8040e990 <dev_fstat+0xb4>
8040e91c:	00007597          	auipc	a1,0x7
8040e920:	af858593          	addi	a1,a1,-1288 # 80415414 <syscalls+0xa18>
8040e924:	00040513          	mv	a0,s0
8040e928:	b4dfe0ef          	jal	ra,8040d474 <inode_check>
8040e92c:	03c42783          	lw	a5,60(s0)
8040e930:	00048593          	mv	a1,s1
8040e934:	00040513          	mv	a0,s0
8040e938:	0287a783          	lw	a5,40(a5)
8040e93c:	000780e7          	jalr	a5
8040e940:	00050913          	mv	s2,a0
8040e944:	02051863          	bnez	a0,8040e974 <dev_fstat+0x98>
8040e948:	02c42703          	lw	a4,44(s0)
8040e94c:	000017b7          	lui	a5,0x1
8040e950:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e954:	04f71e63          	bne	a4,a5,8040e9b0 <dev_fstat+0xd4>
8040e958:	00042583          	lw	a1,0(s0)
8040e95c:	00442503          	lw	a0,4(s0)
8040e960:	00100793          	li	a5,1
8040e964:	00f4a223          	sw	a5,4(s1)
8040e968:	00b4a423          	sw	a1,8(s1)
8040e96c:	765030ef          	jal	ra,804128d0 <__mulsi3>
8040e970:	00a4a623          	sw	a0,12(s1)
8040e974:	00c12083          	lw	ra,12(sp)
8040e978:	00812403          	lw	s0,8(sp)
8040e97c:	00090513          	mv	a0,s2
8040e980:	00412483          	lw	s1,4(sp)
8040e984:	00012903          	lw	s2,0(sp)
8040e988:	01010113          	addi	sp,sp,16
8040e98c:	00008067          	ret
8040e990:	00007697          	auipc	a3,0x7
8040e994:	a1c68693          	addi	a3,a3,-1508 # 804153ac <syscalls+0x9b0>
8040e998:	00004617          	auipc	a2,0x4
8040e99c:	2d460613          	addi	a2,a2,724 # 80412c6c <commands+0x1bc>
8040e9a0:	04200593          	li	a1,66
8040e9a4:	00007517          	auipc	a0,0x7
8040e9a8:	a7850513          	addi	a0,a0,-1416 # 8041541c <syscalls+0xa20>
8040e9ac:	c79f10ef          	jal	ra,80400624 <__panic>
8040e9b0:	00006697          	auipc	a3,0x6
8040e9b4:	78868693          	addi	a3,a3,1928 # 80415138 <syscalls+0x73c>
8040e9b8:	00004617          	auipc	a2,0x4
8040e9bc:	2b460613          	addi	a2,a2,692 # 80412c6c <commands+0x1bc>
8040e9c0:	04500593          	li	a1,69
8040e9c4:	00007517          	auipc	a0,0x7
8040e9c8:	a5850513          	addi	a0,a0,-1448 # 8041541c <syscalls+0xa20>
8040e9cc:	c59f10ef          	jal	ra,80400624 <__panic>

8040e9d0 <dev_init>:
8040e9d0:	ff010113          	addi	sp,sp,-16
8040e9d4:	00112623          	sw	ra,12(sp)
8040e9d8:	700000ef          	jal	ra,8040f0d8 <dev_init_stdin>
8040e9dc:	081000ef          	jal	ra,8040f25c <dev_init_stdout>
8040e9e0:	00c12083          	lw	ra,12(sp)
8040e9e4:	01010113          	addi	sp,sp,16
8040e9e8:	2bc0006f          	j	8040eca4 <dev_init_disk0>

8040e9ec <dev_create_inode>:
8040e9ec:	00001537          	lui	a0,0x1
8040e9f0:	ff010113          	addi	sp,sp,-16
8040e9f4:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e9f8:	00812423          	sw	s0,8(sp)
8040e9fc:	00112623          	sw	ra,12(sp)
8040ea00:	9a1fe0ef          	jal	ra,8040d3a0 <__alloc_inode>
8040ea04:	00050413          	mv	s0,a0
8040ea08:	00050a63          	beqz	a0,8040ea1c <dev_create_inode+0x30>
8040ea0c:	00000613          	li	a2,0
8040ea10:	00007597          	auipc	a1,0x7
8040ea14:	a2058593          	addi	a1,a1,-1504 # 80415430 <dev_node_ops>
8040ea18:	9b9fe0ef          	jal	ra,8040d3d0 <inode_init>
8040ea1c:	00040513          	mv	a0,s0
8040ea20:	00c12083          	lw	ra,12(sp)
8040ea24:	00812403          	lw	s0,8(sp)
8040ea28:	01010113          	addi	sp,sp,16
8040ea2c:	00008067          	ret

8040ea30 <disk0_open>:
8040ea30:	00000513          	li	a0,0
8040ea34:	00008067          	ret

8040ea38 <disk0_close>:
8040ea38:	00000513          	li	a0,0
8040ea3c:	00008067          	ret

8040ea40 <disk0_ioctl>:
8040ea40:	fec00513          	li	a0,-20
8040ea44:	00008067          	ret

8040ea48 <disk0_io>:
8040ea48:	fc010113          	addi	sp,sp,-64
8040ea4c:	0045a703          	lw	a4,4(a1)
8040ea50:	02812c23          	sw	s0,56(sp)
8040ea54:	00c5a403          	lw	s0,12(a1)
8040ea58:	000016b7          	lui	a3,0x1
8040ea5c:	03312623          	sw	s3,44(sp)
8040ea60:	03612023          	sw	s6,32(sp)
8040ea64:	41f75993          	srai	s3,a4,0x1f
8040ea68:	fff68b13          	addi	s6,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040ea6c:	008767b3          	or	a5,a4,s0
8040ea70:	0169f9b3          	and	s3,s3,s6
8040ea74:	02112e23          	sw	ra,60(sp)
8040ea78:	02912a23          	sw	s1,52(sp)
8040ea7c:	03212823          	sw	s2,48(sp)
8040ea80:	03412423          	sw	s4,40(sp)
8040ea84:	03512223          	sw	s5,36(sp)
8040ea88:	01712e23          	sw	s7,28(sp)
8040ea8c:	01812c23          	sw	s8,24(sp)
8040ea90:	01912a23          	sw	s9,20(sp)
8040ea94:	01a12823          	sw	s10,16(sp)
8040ea98:	0167f7b3          	and	a5,a5,s6
8040ea9c:	00e989b3          	add	s3,s3,a4
8040eaa0:	16079263          	bnez	a5,8040ec04 <disk0_io+0x1bc>
8040eaa4:	00052783          	lw	a5,0(a0)
8040eaa8:	40c9d993          	srai	s3,s3,0xc
8040eaac:	00c45713          	srli	a4,s0,0xc
8040eab0:	00e98733          	add	a4,s3,a4
8040eab4:	14e7e863          	bltu	a5,a4,8040ec04 <disk0_io+0x1bc>
8040eab8:	00000513          	li	a0,0
8040eabc:	02d47e63          	bgeu	s0,a3,8040eaf8 <disk0_io+0xb0>
8040eac0:	03c12083          	lw	ra,60(sp)
8040eac4:	03812403          	lw	s0,56(sp)
8040eac8:	03412483          	lw	s1,52(sp)
8040eacc:	03012903          	lw	s2,48(sp)
8040ead0:	02c12983          	lw	s3,44(sp)
8040ead4:	02812a03          	lw	s4,40(sp)
8040ead8:	02412a83          	lw	s5,36(sp)
8040eadc:	02012b03          	lw	s6,32(sp)
8040eae0:	01c12b83          	lw	s7,28(sp)
8040eae4:	01812c03          	lw	s8,24(sp)
8040eae8:	01412c83          	lw	s9,20(sp)
8040eaec:	01012d03          	lw	s10,16(sp)
8040eaf0:	04010113          	addi	sp,sp,64
8040eaf4:	00008067          	ret
8040eaf8:	0008d517          	auipc	a0,0x8d
8040eafc:	c7c50513          	addi	a0,a0,-900 # 8049b774 <disk0_sem>
8040eb00:	00060c13          	mv	s8,a2
8040eb04:	00058b93          	mv	s7,a1
8040eb08:	0008ea17          	auipc	s4,0x8e
8040eb0c:	cd4a0a13          	addi	s4,s4,-812 # 8049c7dc <disk0_buffer>
8040eb10:	d7cf60ef          	jal	ra,8040508c <down>
8040eb14:	00004cb7          	lui	s9,0x4
8040eb18:	0600006f          	j	8040eb78 <disk0_io+0x130>
8040eb1c:	00c45493          	srli	s1,s0,0xc
8040eb20:	00349d13          	slli	s10,s1,0x3
8040eb24:	00040913          	mv	s2,s0
8040eb28:	00399a93          	slli	s5,s3,0x3
8040eb2c:	00058613          	mv	a2,a1
8040eb30:	000d0693          	mv	a3,s10
8040eb34:	000a8593          	mv	a1,s5
8040eb38:	00200513          	li	a0,2
8040eb3c:	fb9f10ef          	jal	ra,80400af4 <ide_read_secs>
8040eb40:	10051663          	bnez	a0,8040ec4c <disk0_io+0x204>
8040eb44:	000a2583          	lw	a1,0(s4)
8040eb48:	00c10713          	addi	a4,sp,12
8040eb4c:	00100693          	li	a3,1
8040eb50:	00090613          	mv	a2,s2
8040eb54:	000b8513          	mv	a0,s7
8040eb58:	99df70ef          	jal	ra,804064f4 <iobuf_move>
8040eb5c:	00c12783          	lw	a5,12(sp)
8040eb60:	0b279663          	bne	a5,s2,8040ec0c <disk0_io+0x1c4>
8040eb64:	016977b3          	and	a5,s2,s6
8040eb68:	0a079263          	bnez	a5,8040ec0c <disk0_io+0x1c4>
8040eb6c:	41240433          	sub	s0,s0,s2
8040eb70:	009989b3          	add	s3,s3,s1
8040eb74:	06040e63          	beqz	s0,8040ebf0 <disk0_io+0x1a8>
8040eb78:	000a2583          	lw	a1,0(s4)
8040eb7c:	000c1c63          	bnez	s8,8040eb94 <disk0_io+0x14c>
8040eb80:	f9946ee3          	bltu	s0,s9,8040eb1c <disk0_io+0xd4>
8040eb84:	02000d13          	li	s10,32
8040eb88:	00400493          	li	s1,4
8040eb8c:	00004937          	lui	s2,0x4
8040eb90:	f99ff06f          	j	8040eb28 <disk0_io+0xe0>
8040eb94:	00c10713          	addi	a4,sp,12
8040eb98:	00000693          	li	a3,0
8040eb9c:	00004637          	lui	a2,0x4
8040eba0:	000b8513          	mv	a0,s7
8040eba4:	951f70ef          	jal	ra,804064f4 <iobuf_move>
8040eba8:	00c12483          	lw	s1,12(sp)
8040ebac:	08048063          	beqz	s1,8040ec2c <disk0_io+0x1e4>
8040ebb0:	06946e63          	bltu	s0,s1,8040ec2c <disk0_io+0x1e4>
8040ebb4:	0164f7b3          	and	a5,s1,s6
8040ebb8:	06079a63          	bnez	a5,8040ec2c <disk0_io+0x1e4>
8040ebbc:	00c4d493          	srli	s1,s1,0xc
8040ebc0:	000a2603          	lw	a2,0(s4)
8040ebc4:	00399913          	slli	s2,s3,0x3
8040ebc8:	00349a93          	slli	s5,s1,0x3
8040ebcc:	000a8693          	mv	a3,s5
8040ebd0:	00090593          	mv	a1,s2
8040ebd4:	00200513          	li	a0,2
8040ebd8:	fb5f10ef          	jal	ra,80400b8c <ide_write_secs>
8040ebdc:	08051e63          	bnez	a0,8040ec78 <disk0_io+0x230>
8040ebe0:	00c12903          	lw	s2,12(sp)
8040ebe4:	009989b3          	add	s3,s3,s1
8040ebe8:	41240433          	sub	s0,s0,s2
8040ebec:	f80416e3          	bnez	s0,8040eb78 <disk0_io+0x130>
8040ebf0:	0008d517          	auipc	a0,0x8d
8040ebf4:	b8450513          	addi	a0,a0,-1148 # 8049b774 <disk0_sem>
8040ebf8:	c90f60ef          	jal	ra,80405088 <up>
8040ebfc:	00000513          	li	a0,0
8040ec00:	ec1ff06f          	j	8040eac0 <disk0_io+0x78>
8040ec04:	ffd00513          	li	a0,-3
8040ec08:	eb9ff06f          	j	8040eac0 <disk0_io+0x78>
8040ec0c:	00007697          	auipc	a3,0x7
8040ec10:	9d068693          	addi	a3,a3,-1584 # 804155dc <dev_node_ops+0x1ac>
8040ec14:	00004617          	auipc	a2,0x4
8040ec18:	05860613          	addi	a2,a2,88 # 80412c6c <commands+0x1bc>
8040ec1c:	06200593          	li	a1,98
8040ec20:	00007517          	auipc	a0,0x7
8040ec24:	90c50513          	addi	a0,a0,-1780 # 8041552c <dev_node_ops+0xfc>
8040ec28:	9fdf10ef          	jal	ra,80400624 <__panic>
8040ec2c:	00007697          	auipc	a3,0x7
8040ec30:	8c068693          	addi	a3,a3,-1856 # 804154ec <dev_node_ops+0xbc>
8040ec34:	00004617          	auipc	a2,0x4
8040ec38:	03860613          	addi	a2,a2,56 # 80412c6c <commands+0x1bc>
8040ec3c:	05700593          	li	a1,87
8040ec40:	00007517          	auipc	a0,0x7
8040ec44:	8ec50513          	addi	a0,a0,-1812 # 8041552c <dev_node_ops+0xfc>
8040ec48:	9ddf10ef          	jal	ra,80400624 <__panic>
8040ec4c:	00050893          	mv	a7,a0
8040ec50:	000d0813          	mv	a6,s10
8040ec54:	00048793          	mv	a5,s1
8040ec58:	000a8713          	mv	a4,s5
8040ec5c:	00098693          	mv	a3,s3
8040ec60:	00007617          	auipc	a2,0x7
8040ec64:	93460613          	addi	a2,a2,-1740 # 80415594 <dev_node_ops+0x164>
8040ec68:	02e00593          	li	a1,46
8040ec6c:	00007517          	auipc	a0,0x7
8040ec70:	8c050513          	addi	a0,a0,-1856 # 8041552c <dev_node_ops+0xfc>
8040ec74:	9b1f10ef          	jal	ra,80400624 <__panic>
8040ec78:	00050893          	mv	a7,a0
8040ec7c:	000a8813          	mv	a6,s5
8040ec80:	00048793          	mv	a5,s1
8040ec84:	00090713          	mv	a4,s2
8040ec88:	00098693          	mv	a3,s3
8040ec8c:	00007617          	auipc	a2,0x7
8040ec90:	8bc60613          	addi	a2,a2,-1860 # 80415548 <dev_node_ops+0x118>
8040ec94:	03800593          	li	a1,56
8040ec98:	00007517          	auipc	a0,0x7
8040ec9c:	89450513          	addi	a0,a0,-1900 # 8041552c <dev_node_ops+0xfc>
8040eca0:	985f10ef          	jal	ra,80400624 <__panic>

8040eca4 <dev_init_disk0>:
8040eca4:	ff010113          	addi	sp,sp,-16
8040eca8:	00112623          	sw	ra,12(sp)
8040ecac:	00812423          	sw	s0,8(sp)
8040ecb0:	00912223          	sw	s1,4(sp)
8040ecb4:	d39ff0ef          	jal	ra,8040e9ec <dev_create_inode>
8040ecb8:	0a050c63          	beqz	a0,8040ed70 <dev_init_disk0+0xcc>
8040ecbc:	02c52703          	lw	a4,44(a0)
8040ecc0:	000014b7          	lui	s1,0x1
8040ecc4:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ecc8:	00050413          	mv	s0,a0
8040eccc:	10f71463          	bne	a4,a5,8040edd4 <dev_init_disk0+0x130>
8040ecd0:	00200513          	li	a0,2
8040ecd4:	db5f10ef          	jal	ra,80400a88 <ide_device_valid>
8040ecd8:	0e050263          	beqz	a0,8040edbc <dev_init_disk0+0x118>
8040ecdc:	00200513          	li	a0,2
8040ece0:	dddf10ef          	jal	ra,80400abc <ide_device_size>
8040ece4:	00355793          	srli	a5,a0,0x3
8040ece8:	00f42023          	sw	a5,0(s0)
8040ecec:	00000797          	auipc	a5,0x0
8040ecf0:	d4478793          	addi	a5,a5,-700 # 8040ea30 <disk0_open>
8040ecf4:	00f42423          	sw	a5,8(s0)
8040ecf8:	00000797          	auipc	a5,0x0
8040ecfc:	d4078793          	addi	a5,a5,-704 # 8040ea38 <disk0_close>
8040ed00:	00f42623          	sw	a5,12(s0)
8040ed04:	00000797          	auipc	a5,0x0
8040ed08:	d4478793          	addi	a5,a5,-700 # 8040ea48 <disk0_io>
8040ed0c:	00f42823          	sw	a5,16(s0)
8040ed10:	00000797          	auipc	a5,0x0
8040ed14:	d3078793          	addi	a5,a5,-720 # 8040ea40 <disk0_ioctl>
8040ed18:	00f42a23          	sw	a5,20(s0)
8040ed1c:	00100593          	li	a1,1
8040ed20:	0008d517          	auipc	a0,0x8d
8040ed24:	a5450513          	addi	a0,a0,-1452 # 8049b774 <disk0_sem>
8040ed28:	00942223          	sw	s1,4(s0)
8040ed2c:	b50f60ef          	jal	ra,8040507c <sem_init>
8040ed30:	00004537          	lui	a0,0x4
8040ed34:	b5df30ef          	jal	ra,80402890 <kmalloc>
8040ed38:	0008e797          	auipc	a5,0x8e
8040ed3c:	aaa7a223          	sw	a0,-1372(a5) # 8049c7dc <disk0_buffer>
8040ed40:	06050263          	beqz	a0,8040eda4 <dev_init_disk0+0x100>
8040ed44:	00100613          	li	a2,1
8040ed48:	00040593          	mv	a1,s0
8040ed4c:	00006517          	auipc	a0,0x6
8040ed50:	77c50513          	addi	a0,a0,1916 # 804154c8 <dev_node_ops+0x98>
8040ed54:	f8dfe0ef          	jal	ra,8040dce0 <vfs_add_dev>
8040ed58:	02051863          	bnez	a0,8040ed88 <dev_init_disk0+0xe4>
8040ed5c:	00c12083          	lw	ra,12(sp)
8040ed60:	00812403          	lw	s0,8(sp)
8040ed64:	00412483          	lw	s1,4(sp)
8040ed68:	01010113          	addi	sp,sp,16
8040ed6c:	00008067          	ret
8040ed70:	00006617          	auipc	a2,0x6
8040ed74:	70060613          	addi	a2,a2,1792 # 80415470 <dev_node_ops+0x40>
8040ed78:	08700593          	li	a1,135
8040ed7c:	00006517          	auipc	a0,0x6
8040ed80:	7b050513          	addi	a0,a0,1968 # 8041552c <dev_node_ops+0xfc>
8040ed84:	8a1f10ef          	jal	ra,80400624 <__panic>
8040ed88:	00050693          	mv	a3,a0
8040ed8c:	00006617          	auipc	a2,0x6
8040ed90:	74460613          	addi	a2,a2,1860 # 804154d0 <dev_node_ops+0xa0>
8040ed94:	08d00593          	li	a1,141
8040ed98:	00006517          	auipc	a0,0x6
8040ed9c:	79450513          	addi	a0,a0,1940 # 8041552c <dev_node_ops+0xfc>
8040eda0:	885f10ef          	jal	ra,80400624 <__panic>
8040eda4:	00006617          	auipc	a2,0x6
8040eda8:	70860613          	addi	a2,a2,1800 # 804154ac <dev_node_ops+0x7c>
8040edac:	07f00593          	li	a1,127
8040edb0:	00006517          	auipc	a0,0x6
8040edb4:	77c50513          	addi	a0,a0,1916 # 8041552c <dev_node_ops+0xfc>
8040edb8:	86df10ef          	jal	ra,80400624 <__panic>
8040edbc:	00006617          	auipc	a2,0x6
8040edc0:	6d060613          	addi	a2,a2,1744 # 8041548c <dev_node_ops+0x5c>
8040edc4:	07300593          	li	a1,115
8040edc8:	00006517          	auipc	a0,0x6
8040edcc:	76450513          	addi	a0,a0,1892 # 8041552c <dev_node_ops+0xfc>
8040edd0:	855f10ef          	jal	ra,80400624 <__panic>
8040edd4:	00006697          	auipc	a3,0x6
8040edd8:	36468693          	addi	a3,a3,868 # 80415138 <syscalls+0x73c>
8040eddc:	00004617          	auipc	a2,0x4
8040ede0:	e9060613          	addi	a2,a2,-368 # 80412c6c <commands+0x1bc>
8040ede4:	08900593          	li	a1,137
8040ede8:	00006517          	auipc	a0,0x6
8040edec:	74450513          	addi	a0,a0,1860 # 8041552c <dev_node_ops+0xfc>
8040edf0:	835f10ef          	jal	ra,80400624 <__panic>

8040edf4 <stdin_open>:
8040edf4:	00000513          	li	a0,0
8040edf8:	00059463          	bnez	a1,8040ee00 <stdin_open+0xc>
8040edfc:	00008067          	ret
8040ee00:	ffd00513          	li	a0,-3
8040ee04:	00008067          	ret

8040ee08 <stdin_close>:
8040ee08:	00000513          	li	a0,0
8040ee0c:	00008067          	ret

8040ee10 <stdin_ioctl>:
8040ee10:	ffd00513          	li	a0,-3
8040ee14:	00008067          	ret

8040ee18 <stdin_io>:
8040ee18:	fb010113          	addi	sp,sp,-80
8040ee1c:	04112623          	sw	ra,76(sp)
8040ee20:	04812423          	sw	s0,72(sp)
8040ee24:	04912223          	sw	s1,68(sp)
8040ee28:	05212023          	sw	s2,64(sp)
8040ee2c:	03312e23          	sw	s3,60(sp)
8040ee30:	03412c23          	sw	s4,56(sp)
8040ee34:	03512a23          	sw	s5,52(sp)
8040ee38:	03612823          	sw	s6,48(sp)
8040ee3c:	03712623          	sw	s7,44(sp)
8040ee40:	03812423          	sw	s8,40(sp)
8040ee44:	03912223          	sw	s9,36(sp)
8040ee48:	1a061063          	bnez	a2,8040efe8 <stdin_io+0x1d0>
8040ee4c:	00058493          	mv	s1,a1
8040ee50:	0005ac83          	lw	s9,0(a1)
8040ee54:	00c5ac03          	lw	s8,12(a1)
8040ee58:	100027f3          	csrr	a5,sstatus
8040ee5c:	0027f793          	andi	a5,a5,2
8040ee60:	16079863          	bnez	a5,8040efd0 <stdin_io+0x1b8>
8040ee64:	00000913          	li	s2,0
8040ee68:	160c0063          	beqz	s8,8040efc8 <stdin_io+0x1b0>
8040ee6c:	0008eb97          	auipc	s7,0x8e
8040ee70:	97cb8b93          	addi	s7,s7,-1668 # 8049c7e8 <p_rpos>
8040ee74:	000ba783          	lw	a5,0(s7)
8040ee78:	800009b7          	lui	s3,0x80000
8040ee7c:	00001a37          	lui	s4,0x1
8040ee80:	00000413          	li	s0,0
8040ee84:	0008eb17          	auipc	s6,0x8e
8040ee88:	968b0b13          	addi	s6,s6,-1688 # 8049c7ec <p_wpos>
8040ee8c:	00498993          	addi	s3,s3,4 # 80000004 <end+0xffb63744>
8040ee90:	0008ea97          	auipc	s5,0x8e
8040ee94:	950a8a93          	addi	s5,s5,-1712 # 8049c7e0 <__wait_queue>
8040ee98:	fffa0a13          	addi	s4,s4,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040ee9c:	000b2703          	lw	a4,0(s6)
8040eea0:	02e7de63          	bge	a5,a4,8040eedc <stdin_io+0xc4>
8040eea4:	0d80006f          	j	8040ef7c <stdin_io+0x164>
8040eea8:	c55fd0ef          	jal	ra,8040cafc <schedule>
8040eeac:	100027f3          	csrr	a5,sstatus
8040eeb0:	0027f793          	andi	a5,a5,2
8040eeb4:	00000913          	li	s2,0
8040eeb8:	04079863          	bnez	a5,8040ef08 <stdin_io+0xf0>
8040eebc:	00c10513          	addi	a0,sp,12
8040eec0:	ac4f60ef          	jal	ra,80405184 <wait_in_queue>
8040eec4:	04051c63          	bnez	a0,8040ef1c <stdin_io+0x104>
8040eec8:	01012783          	lw	a5,16(sp)
8040eecc:	07379263          	bne	a5,s3,8040ef30 <stdin_io+0x118>
8040eed0:	000ba783          	lw	a5,0(s7)
8040eed4:	000b2703          	lw	a4,0(s6)
8040eed8:	0ae7c263          	blt	a5,a4,8040ef7c <stdin_io+0x164>
8040eedc:	00098613          	mv	a2,s3
8040eee0:	00c10593          	addi	a1,sp,12
8040eee4:	000a8513          	mv	a0,s5
8040eee8:	b94f60ef          	jal	ra,8040527c <wait_current_set>
8040eeec:	fa090ee3          	beqz	s2,8040eea8 <stdin_io+0x90>
8040eef0:	d35f10ef          	jal	ra,80400c24 <intr_enable>
8040eef4:	c09fd0ef          	jal	ra,8040cafc <schedule>
8040eef8:	100027f3          	csrr	a5,sstatus
8040eefc:	0027f793          	andi	a5,a5,2
8040ef00:	00000913          	li	s2,0
8040ef04:	fa078ce3          	beqz	a5,8040eebc <stdin_io+0xa4>
8040ef08:	d25f10ef          	jal	ra,80400c2c <intr_disable>
8040ef0c:	00c10513          	addi	a0,sp,12
8040ef10:	00100913          	li	s2,1
8040ef14:	a70f60ef          	jal	ra,80405184 <wait_in_queue>
8040ef18:	fa0508e3          	beqz	a0,8040eec8 <stdin_io+0xb0>
8040ef1c:	00c10593          	addi	a1,sp,12
8040ef20:	000a8513          	mv	a0,s5
8040ef24:	a00f60ef          	jal	ra,80405124 <wait_queue_del>
8040ef28:	01012783          	lw	a5,16(sp)
8040ef2c:	fb3782e3          	beq	a5,s3,8040eed0 <stdin_io+0xb8>
8040ef30:	08091863          	bnez	s2,8040efc0 <stdin_io+0x1a8>
8040ef34:	08040a63          	beqz	s0,8040efc8 <stdin_io+0x1b0>
8040ef38:	00c4a783          	lw	a5,12(s1)
8040ef3c:	408787b3          	sub	a5,a5,s0
8040ef40:	00f4a623          	sw	a5,12(s1)
8040ef44:	00040513          	mv	a0,s0
8040ef48:	04c12083          	lw	ra,76(sp)
8040ef4c:	04812403          	lw	s0,72(sp)
8040ef50:	04412483          	lw	s1,68(sp)
8040ef54:	04012903          	lw	s2,64(sp)
8040ef58:	03c12983          	lw	s3,60(sp)
8040ef5c:	03812a03          	lw	s4,56(sp)
8040ef60:	03412a83          	lw	s5,52(sp)
8040ef64:	03012b03          	lw	s6,48(sp)
8040ef68:	02c12b83          	lw	s7,44(sp)
8040ef6c:	02812c03          	lw	s8,40(sp)
8040ef70:	02412c83          	lw	s9,36(sp)
8040ef74:	05010113          	addi	sp,sp,80
8040ef78:	00008067          	ret
8040ef7c:	41f7d713          	srai	a4,a5,0x1f
8040ef80:	01475693          	srli	a3,a4,0x14
8040ef84:	00d78733          	add	a4,a5,a3
8040ef88:	01477733          	and	a4,a4,s4
8040ef8c:	40d70733          	sub	a4,a4,a3
8040ef90:	0008c697          	auipc	a3,0x8c
8040ef94:	7f068693          	addi	a3,a3,2032 # 8049b780 <stdin_buffer>
8040ef98:	00e68733          	add	a4,a3,a4
8040ef9c:	00074683          	lbu	a3,0(a4)
8040efa0:	00178793          	addi	a5,a5,1
8040efa4:	008c8733          	add	a4,s9,s0
8040efa8:	00d70023          	sb	a3,0(a4)
8040efac:	00140413          	addi	s0,s0,1
8040efb0:	0008e717          	auipc	a4,0x8e
8040efb4:	82f72c23          	sw	a5,-1992(a4) # 8049c7e8 <p_rpos>
8040efb8:	ef8462e3          	bltu	s0,s8,8040ee9c <stdin_io+0x84>
8040efbc:	f6090ee3          	beqz	s2,8040ef38 <stdin_io+0x120>
8040efc0:	c65f10ef          	jal	ra,80400c24 <intr_enable>
8040efc4:	f6041ae3          	bnez	s0,8040ef38 <stdin_io+0x120>
8040efc8:	00000413          	li	s0,0
8040efcc:	f79ff06f          	j	8040ef44 <stdin_io+0x12c>
8040efd0:	c5df10ef          	jal	ra,80400c2c <intr_disable>
8040efd4:	00100913          	li	s2,1
8040efd8:	e80c1ae3          	bnez	s8,8040ee6c <stdin_io+0x54>
8040efdc:	c49f10ef          	jal	ra,80400c24 <intr_enable>
8040efe0:	00000413          	li	s0,0
8040efe4:	f61ff06f          	j	8040ef44 <stdin_io+0x12c>
8040efe8:	ffd00413          	li	s0,-3
8040efec:	f59ff06f          	j	8040ef44 <stdin_io+0x12c>

8040eff0 <dev_stdin_write>:
8040eff0:	00051463          	bnez	a0,8040eff8 <dev_stdin_write+0x8>
8040eff4:	00008067          	ret
8040eff8:	ff010113          	addi	sp,sp,-16
8040effc:	00912223          	sw	s1,4(sp)
8040f000:	00112623          	sw	ra,12(sp)
8040f004:	00812423          	sw	s0,8(sp)
8040f008:	00050493          	mv	s1,a0
8040f00c:	100027f3          	csrr	a5,sstatus
8040f010:	0027f793          	andi	a5,a5,2
8040f014:	00000413          	li	s0,0
8040f018:	0a079a63          	bnez	a5,8040f0cc <dev_stdin_write+0xdc>
8040f01c:	0008d797          	auipc	a5,0x8d
8040f020:	7d078793          	addi	a5,a5,2000 # 8049c7ec <p_wpos>
8040f024:	0007a703          	lw	a4,0(a5)
8040f028:	000015b7          	lui	a1,0x1
8040f02c:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040f030:	41f75693          	srai	a3,a4,0x1f
8040f034:	0146d693          	srli	a3,a3,0x14
8040f038:	00d707b3          	add	a5,a4,a3
8040f03c:	00c7f7b3          	and	a5,a5,a2
8040f040:	0008d617          	auipc	a2,0x8d
8040f044:	7a860613          	addi	a2,a2,1960 # 8049c7e8 <p_rpos>
8040f048:	00062603          	lw	a2,0(a2)
8040f04c:	40d787b3          	sub	a5,a5,a3
8040f050:	0008c697          	auipc	a3,0x8c
8040f054:	73068693          	addi	a3,a3,1840 # 8049b780 <stdin_buffer>
8040f058:	00f687b3          	add	a5,a3,a5
8040f05c:	00978023          	sb	s1,0(a5)
8040f060:	40c707b3          	sub	a5,a4,a2
8040f064:	00b7d863          	bge	a5,a1,8040f074 <dev_stdin_write+0x84>
8040f068:	00170713          	addi	a4,a4,1
8040f06c:	0008d797          	auipc	a5,0x8d
8040f070:	78e7a023          	sw	a4,1920(a5) # 8049c7ec <p_wpos>
8040f074:	0008d517          	auipc	a0,0x8d
8040f078:	76c50513          	addi	a0,a0,1900 # 8049c7e0 <__wait_queue>
8040f07c:	8f8f60ef          	jal	ra,80405174 <wait_queue_empty>
8040f080:	00050e63          	beqz	a0,8040f09c <dev_stdin_write+0xac>
8040f084:	02041a63          	bnez	s0,8040f0b8 <dev_stdin_write+0xc8>
8040f088:	00c12083          	lw	ra,12(sp)
8040f08c:	00812403          	lw	s0,8(sp)
8040f090:	00412483          	lw	s1,4(sp)
8040f094:	01010113          	addi	sp,sp,16
8040f098:	00008067          	ret
8040f09c:	800005b7          	lui	a1,0x80000
8040f0a0:	00100613          	li	a2,1
8040f0a4:	00458593          	addi	a1,a1,4 # 80000004 <end+0xffb63744>
8040f0a8:	0008d517          	auipc	a0,0x8d
8040f0ac:	73850513          	addi	a0,a0,1848 # 8049c7e0 <__wait_queue>
8040f0b0:	92cf60ef          	jal	ra,804051dc <wakeup_queue>
8040f0b4:	fc040ae3          	beqz	s0,8040f088 <dev_stdin_write+0x98>
8040f0b8:	00812403          	lw	s0,8(sp)
8040f0bc:	00c12083          	lw	ra,12(sp)
8040f0c0:	00412483          	lw	s1,4(sp)
8040f0c4:	01010113          	addi	sp,sp,16
8040f0c8:	b5df106f          	j	80400c24 <intr_enable>
8040f0cc:	b61f10ef          	jal	ra,80400c2c <intr_disable>
8040f0d0:	00100413          	li	s0,1
8040f0d4:	f49ff06f          	j	8040f01c <dev_stdin_write+0x2c>

8040f0d8 <dev_init_stdin>:
8040f0d8:	ff010113          	addi	sp,sp,-16
8040f0dc:	00112623          	sw	ra,12(sp)
8040f0e0:	00812423          	sw	s0,8(sp)
8040f0e4:	909ff0ef          	jal	ra,8040e9ec <dev_create_inode>
8040f0e8:	08050c63          	beqz	a0,8040f180 <dev_init_stdin+0xa8>
8040f0ec:	02c52703          	lw	a4,44(a0)
8040f0f0:	000017b7          	lui	a5,0x1
8040f0f4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f0f8:	00050413          	mv	s0,a0
8040f0fc:	0af71c63          	bne	a4,a5,8040f1b4 <dev_init_stdin+0xdc>
8040f100:	00100793          	li	a5,1
8040f104:	00f42223          	sw	a5,4(s0)
8040f108:	00000797          	auipc	a5,0x0
8040f10c:	cec78793          	addi	a5,a5,-788 # 8040edf4 <stdin_open>
8040f110:	00f42423          	sw	a5,8(s0)
8040f114:	00000797          	auipc	a5,0x0
8040f118:	cf478793          	addi	a5,a5,-780 # 8040ee08 <stdin_close>
8040f11c:	00f42623          	sw	a5,12(s0)
8040f120:	00000797          	auipc	a5,0x0
8040f124:	cf878793          	addi	a5,a5,-776 # 8040ee18 <stdin_io>
8040f128:	00f42823          	sw	a5,16(s0)
8040f12c:	00000797          	auipc	a5,0x0
8040f130:	ce478793          	addi	a5,a5,-796 # 8040ee10 <stdin_ioctl>
8040f134:	00f42a23          	sw	a5,20(s0)
8040f138:	0008d517          	auipc	a0,0x8d
8040f13c:	6a850513          	addi	a0,a0,1704 # 8049c7e0 <__wait_queue>
8040f140:	00042023          	sw	zero,0(s0)
8040f144:	0008d797          	auipc	a5,0x8d
8040f148:	6a07a423          	sw	zero,1704(a5) # 8049c7ec <p_wpos>
8040f14c:	0008d797          	auipc	a5,0x8d
8040f150:	6807ae23          	sw	zero,1692(a5) # 8049c7e8 <p_rpos>
8040f154:	fc5f50ef          	jal	ra,80405118 <wait_queue_init>
8040f158:	00000613          	li	a2,0
8040f15c:	00040593          	mv	a1,s0
8040f160:	00006517          	auipc	a0,0x6
8040f164:	4e450513          	addi	a0,a0,1252 # 80415644 <dev_node_ops+0x214>
8040f168:	b79fe0ef          	jal	ra,8040dce0 <vfs_add_dev>
8040f16c:	02051663          	bnez	a0,8040f198 <dev_init_stdin+0xc0>
8040f170:	00c12083          	lw	ra,12(sp)
8040f174:	00812403          	lw	s0,8(sp)
8040f178:	01010113          	addi	sp,sp,16
8040f17c:	00008067          	ret
8040f180:	00006617          	auipc	a2,0x6
8040f184:	48c60613          	addi	a2,a2,1164 # 8041560c <dev_node_ops+0x1dc>
8040f188:	07500593          	li	a1,117
8040f18c:	00006517          	auipc	a0,0x6
8040f190:	49c50513          	addi	a0,a0,1180 # 80415628 <dev_node_ops+0x1f8>
8040f194:	c90f10ef          	jal	ra,80400624 <__panic>
8040f198:	00050693          	mv	a3,a0
8040f19c:	00006617          	auipc	a2,0x6
8040f1a0:	4b060613          	addi	a2,a2,1200 # 8041564c <dev_node_ops+0x21c>
8040f1a4:	07b00593          	li	a1,123
8040f1a8:	00006517          	auipc	a0,0x6
8040f1ac:	48050513          	addi	a0,a0,1152 # 80415628 <dev_node_ops+0x1f8>
8040f1b0:	c74f10ef          	jal	ra,80400624 <__panic>
8040f1b4:	00006697          	auipc	a3,0x6
8040f1b8:	f8468693          	addi	a3,a3,-124 # 80415138 <syscalls+0x73c>
8040f1bc:	00004617          	auipc	a2,0x4
8040f1c0:	ab060613          	addi	a2,a2,-1360 # 80412c6c <commands+0x1bc>
8040f1c4:	07700593          	li	a1,119
8040f1c8:	00006517          	auipc	a0,0x6
8040f1cc:	46050513          	addi	a0,a0,1120 # 80415628 <dev_node_ops+0x1f8>
8040f1d0:	c54f10ef          	jal	ra,80400624 <__panic>

8040f1d4 <stdout_open>:
8040f1d4:	00100793          	li	a5,1
8040f1d8:	00000513          	li	a0,0
8040f1dc:	00f59463          	bne	a1,a5,8040f1e4 <stdout_open+0x10>
8040f1e0:	00008067          	ret
8040f1e4:	ffd00513          	li	a0,-3
8040f1e8:	00008067          	ret

8040f1ec <stdout_close>:
8040f1ec:	00000513          	li	a0,0
8040f1f0:	00008067          	ret

8040f1f4 <stdout_ioctl>:
8040f1f4:	ffd00513          	li	a0,-3
8040f1f8:	00008067          	ret

8040f1fc <stdout_io>:
8040f1fc:	04060c63          	beqz	a2,8040f254 <stdout_io+0x58>
8040f200:	00c5a783          	lw	a5,12(a1)
8040f204:	ff010113          	addi	sp,sp,-16
8040f208:	00812423          	sw	s0,8(sp)
8040f20c:	00912223          	sw	s1,4(sp)
8040f210:	00112623          	sw	ra,12(sp)
8040f214:	00058493          	mv	s1,a1
8040f218:	0005a403          	lw	s0,0(a1)
8040f21c:	02078063          	beqz	a5,8040f23c <stdout_io+0x40>
8040f220:	00140413          	addi	s0,s0,1
8040f224:	fff44503          	lbu	a0,-1(s0)
8040f228:	834f10ef          	jal	ra,8040025c <cputchar>
8040f22c:	00c4a783          	lw	a5,12(s1)
8040f230:	fff78793          	addi	a5,a5,-1
8040f234:	00f4a623          	sw	a5,12(s1)
8040f238:	fe0794e3          	bnez	a5,8040f220 <stdout_io+0x24>
8040f23c:	00c12083          	lw	ra,12(sp)
8040f240:	00812403          	lw	s0,8(sp)
8040f244:	00412483          	lw	s1,4(sp)
8040f248:	00000513          	li	a0,0
8040f24c:	01010113          	addi	sp,sp,16
8040f250:	00008067          	ret
8040f254:	ffd00513          	li	a0,-3
8040f258:	00008067          	ret

8040f25c <dev_init_stdout>:
8040f25c:	ff010113          	addi	sp,sp,-16
8040f260:	00112623          	sw	ra,12(sp)
8040f264:	f88ff0ef          	jal	ra,8040e9ec <dev_create_inode>
8040f268:	06050a63          	beqz	a0,8040f2dc <dev_init_stdout+0x80>
8040f26c:	02c52703          	lw	a4,44(a0)
8040f270:	000017b7          	lui	a5,0x1
8040f274:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f278:	08f71c63          	bne	a4,a5,8040f310 <dev_init_stdout+0xb4>
8040f27c:	00100793          	li	a5,1
8040f280:	00f52223          	sw	a5,4(a0)
8040f284:	00000797          	auipc	a5,0x0
8040f288:	f5078793          	addi	a5,a5,-176 # 8040f1d4 <stdout_open>
8040f28c:	00f52423          	sw	a5,8(a0)
8040f290:	00000797          	auipc	a5,0x0
8040f294:	f5c78793          	addi	a5,a5,-164 # 8040f1ec <stdout_close>
8040f298:	00f52623          	sw	a5,12(a0)
8040f29c:	00000797          	auipc	a5,0x0
8040f2a0:	f6078793          	addi	a5,a5,-160 # 8040f1fc <stdout_io>
8040f2a4:	00f52823          	sw	a5,16(a0)
8040f2a8:	00000797          	auipc	a5,0x0
8040f2ac:	f4c78793          	addi	a5,a5,-180 # 8040f1f4 <stdout_ioctl>
8040f2b0:	00052023          	sw	zero,0(a0)
8040f2b4:	00f52a23          	sw	a5,20(a0)
8040f2b8:	00050593          	mv	a1,a0
8040f2bc:	00000613          	li	a2,0
8040f2c0:	00006517          	auipc	a0,0x6
8040f2c4:	3e050513          	addi	a0,a0,992 # 804156a0 <dev_node_ops+0x270>
8040f2c8:	a19fe0ef          	jal	ra,8040dce0 <vfs_add_dev>
8040f2cc:	02051463          	bnez	a0,8040f2f4 <dev_init_stdout+0x98>
8040f2d0:	00c12083          	lw	ra,12(sp)
8040f2d4:	01010113          	addi	sp,sp,16
8040f2d8:	00008067          	ret
8040f2dc:	00006617          	auipc	a2,0x6
8040f2e0:	38c60613          	addi	a2,a2,908 # 80415668 <dev_node_ops+0x238>
8040f2e4:	03700593          	li	a1,55
8040f2e8:	00006517          	auipc	a0,0x6
8040f2ec:	39c50513          	addi	a0,a0,924 # 80415684 <dev_node_ops+0x254>
8040f2f0:	b34f10ef          	jal	ra,80400624 <__panic>
8040f2f4:	00050693          	mv	a3,a0
8040f2f8:	00006617          	auipc	a2,0x6
8040f2fc:	3b060613          	addi	a2,a2,944 # 804156a8 <dev_node_ops+0x278>
8040f300:	03d00593          	li	a1,61
8040f304:	00006517          	auipc	a0,0x6
8040f308:	38050513          	addi	a0,a0,896 # 80415684 <dev_node_ops+0x254>
8040f30c:	b18f10ef          	jal	ra,80400624 <__panic>
8040f310:	00006697          	auipc	a3,0x6
8040f314:	e2868693          	addi	a3,a3,-472 # 80415138 <syscalls+0x73c>
8040f318:	00004617          	auipc	a2,0x4
8040f31c:	95460613          	addi	a2,a2,-1708 # 80412c6c <commands+0x1bc>
8040f320:	03900593          	li	a1,57
8040f324:	00006517          	auipc	a0,0x6
8040f328:	36050513          	addi	a0,a0,864 # 80415684 <dev_node_ops+0x254>
8040f32c:	af8f10ef          	jal	ra,80400624 <__panic>

8040f330 <bitmap_translate.isra.0.part.1>:
8040f330:	ff010113          	addi	sp,sp,-16
8040f334:	00006697          	auipc	a3,0x6
8040f338:	40868693          	addi	a3,a3,1032 # 8041573c <dev_node_ops+0x30c>
8040f33c:	00004617          	auipc	a2,0x4
8040f340:	93060613          	addi	a2,a2,-1744 # 80412c6c <commands+0x1bc>
8040f344:	04c00593          	li	a1,76
8040f348:	00006517          	auipc	a0,0x6
8040f34c:	40c50513          	addi	a0,a0,1036 # 80415754 <dev_node_ops+0x324>
8040f350:	00112623          	sw	ra,12(sp)
8040f354:	ad0f10ef          	jal	ra,80400624 <__panic>

8040f358 <bitmap_create>:
8040f358:	fe010113          	addi	sp,sp,-32
8040f35c:	00112e23          	sw	ra,28(sp)
8040f360:	00812c23          	sw	s0,24(sp)
8040f364:	00912a23          	sw	s1,20(sp)
8040f368:	01212823          	sw	s2,16(sp)
8040f36c:	01312623          	sw	s3,12(sp)
8040f370:	01412423          	sw	s4,8(sp)
8040f374:	fff50713          	addi	a4,a0,-1
8040f378:	fde00793          	li	a5,-34
8040f37c:	0ce7e663          	bltu	a5,a4,8040f448 <bitmap_create+0xf0>
8040f380:	00050413          	mv	s0,a0
8040f384:	00c00513          	li	a0,12
8040f388:	d08f30ef          	jal	ra,80402890 <kmalloc>
8040f38c:	00050493          	mv	s1,a0
8040f390:	08050263          	beqz	a0,8040f414 <bitmap_create+0xbc>
8040f394:	01f40993          	addi	s3,s0,31
8040f398:	0059d913          	srli	s2,s3,0x5
8040f39c:	00291a13          	slli	s4,s2,0x2
8040f3a0:	000a0513          	mv	a0,s4
8040f3a4:	cecf30ef          	jal	ra,80402890 <kmalloc>
8040f3a8:	08050863          	beqz	a0,8040f438 <bitmap_create+0xe0>
8040f3ac:	0084a023          	sw	s0,0(s1)
8040f3b0:	0124a223          	sw	s2,4(s1)
8040f3b4:	000a0613          	mv	a2,s4
8040f3b8:	0ff00593          	li	a1,255
8040f3bc:	480030ef          	jal	ra,8041283c <memset>
8040f3c0:	00a4a423          	sw	a0,8(s1)
8040f3c4:	fe09f993          	andi	s3,s3,-32
8040f3c8:	04898663          	beq	s3,s0,8040f414 <bitmap_create+0xbc>
8040f3cc:	fff90913          	addi	s2,s2,-1 # 3fff <_binary_bin_swap_img_size-0x4001>
8040f3d0:	00591793          	slli	a5,s2,0x5
8040f3d4:	00545713          	srli	a4,s0,0x5
8040f3d8:	40f407b3          	sub	a5,s0,a5
8040f3dc:	0b271663          	bne	a4,s2,8040f488 <bitmap_create+0x130>
8040f3e0:	fff78693          	addi	a3,a5,-1
8040f3e4:	01e00613          	li	a2,30
8040f3e8:	08d66063          	bltu	a2,a3,8040f468 <bitmap_create+0x110>
8040f3ec:	00271713          	slli	a4,a4,0x2
8040f3f0:	00e50533          	add	a0,a0,a4
8040f3f4:	00052703          	lw	a4,0(a0)
8040f3f8:	00100593          	li	a1,1
8040f3fc:	02000613          	li	a2,32
8040f400:	00f596b3          	sll	a3,a1,a5
8040f404:	00178793          	addi	a5,a5,1
8040f408:	00d74733          	xor	a4,a4,a3
8040f40c:	fec79ae3          	bne	a5,a2,8040f400 <bitmap_create+0xa8>
8040f410:	00e52023          	sw	a4,0(a0)
8040f414:	01c12083          	lw	ra,28(sp)
8040f418:	01812403          	lw	s0,24(sp)
8040f41c:	00048513          	mv	a0,s1
8040f420:	01012903          	lw	s2,16(sp)
8040f424:	01412483          	lw	s1,20(sp)
8040f428:	00c12983          	lw	s3,12(sp)
8040f42c:	00812a03          	lw	s4,8(sp)
8040f430:	02010113          	addi	sp,sp,32
8040f434:	00008067          	ret
8040f438:	00048513          	mv	a0,s1
8040f43c:	d78f30ef          	jal	ra,804029b4 <kfree>
8040f440:	00000493          	li	s1,0
8040f444:	fd1ff06f          	j	8040f414 <bitmap_create+0xbc>
8040f448:	00006697          	auipc	a3,0x6
8040f44c:	27c68693          	addi	a3,a3,636 # 804156c4 <dev_node_ops+0x294>
8040f450:	00004617          	auipc	a2,0x4
8040f454:	81c60613          	addi	a2,a2,-2020 # 80412c6c <commands+0x1bc>
8040f458:	01500593          	li	a1,21
8040f45c:	00006517          	auipc	a0,0x6
8040f460:	2f850513          	addi	a0,a0,760 # 80415754 <dev_node_ops+0x324>
8040f464:	9c0f10ef          	jal	ra,80400624 <__panic>
8040f468:	00006697          	auipc	a3,0x6
8040f46c:	29c68693          	addi	a3,a3,668 # 80415704 <dev_node_ops+0x2d4>
8040f470:	00003617          	auipc	a2,0x3
8040f474:	7fc60613          	addi	a2,a2,2044 # 80412c6c <commands+0x1bc>
8040f478:	02b00593          	li	a1,43
8040f47c:	00006517          	auipc	a0,0x6
8040f480:	2d850513          	addi	a0,a0,728 # 80415754 <dev_node_ops+0x324>
8040f484:	9a0f10ef          	jal	ra,80400624 <__panic>
8040f488:	00006697          	auipc	a3,0x6
8040f48c:	26468693          	addi	a3,a3,612 # 804156ec <dev_node_ops+0x2bc>
8040f490:	00003617          	auipc	a2,0x3
8040f494:	7dc60613          	addi	a2,a2,2012 # 80412c6c <commands+0x1bc>
8040f498:	02a00593          	li	a1,42
8040f49c:	00006517          	auipc	a0,0x6
8040f4a0:	2b850513          	addi	a0,a0,696 # 80415754 <dev_node_ops+0x324>
8040f4a4:	980f10ef          	jal	ra,80400624 <__panic>

8040f4a8 <bitmap_alloc>:
8040f4a8:	00452603          	lw	a2,4(a0)
8040f4ac:	00852803          	lw	a6,8(a0)
8040f4b0:	02060663          	beqz	a2,8040f4dc <bitmap_alloc+0x34>
8040f4b4:	00082703          	lw	a4,0(a6)
8040f4b8:	00480793          	addi	a5,a6,4
8040f4bc:	00070c63          	beqz	a4,8040f4d4 <bitmap_alloc+0x2c>
8040f4c0:	0240006f          	j	8040f4e4 <bitmap_alloc+0x3c>
8040f4c4:	00078813          	mv	a6,a5
8040f4c8:	00478793          	addi	a5,a5,4
8040f4cc:	ffc7a683          	lw	a3,-4(a5)
8040f4d0:	00069e63          	bnez	a3,8040f4ec <bitmap_alloc+0x44>
8040f4d4:	00170713          	addi	a4,a4,1
8040f4d8:	fee616e3          	bne	a2,a4,8040f4c4 <bitmap_alloc+0x1c>
8040f4dc:	ffc00513          	li	a0,-4
8040f4e0:	00008067          	ret
8040f4e4:	00070693          	mv	a3,a4
8040f4e8:	00000713          	li	a4,0
8040f4ec:	00000793          	li	a5,0
8040f4f0:	00100893          	li	a7,1
8040f4f4:	02000313          	li	t1,32
8040f4f8:	00c0006f          	j	8040f504 <bitmap_alloc+0x5c>
8040f4fc:	00178793          	addi	a5,a5,1
8040f500:	02678663          	beq	a5,t1,8040f52c <bitmap_alloc+0x84>
8040f504:	00f89633          	sll	a2,a7,a5
8040f508:	00c6f533          	and	a0,a3,a2
8040f50c:	fe0508e3          	beqz	a0,8040f4fc <bitmap_alloc+0x54>
8040f510:	00c6c6b3          	xor	a3,a3,a2
8040f514:	00571713          	slli	a4,a4,0x5
8040f518:	00d82023          	sw	a3,0(a6)
8040f51c:	00f70733          	add	a4,a4,a5
8040f520:	00e5a023          	sw	a4,0(a1)
8040f524:	00000513          	li	a0,0
8040f528:	00008067          	ret
8040f52c:	ff010113          	addi	sp,sp,-16
8040f530:	00005697          	auipc	a3,0x5
8040f534:	8d868693          	addi	a3,a3,-1832 # 80413e08 <default_pmm_manager+0x850>
8040f538:	00003617          	auipc	a2,0x3
8040f53c:	73460613          	addi	a2,a2,1844 # 80412c6c <commands+0x1bc>
8040f540:	04300593          	li	a1,67
8040f544:	00006517          	auipc	a0,0x6
8040f548:	21050513          	addi	a0,a0,528 # 80415754 <dev_node_ops+0x324>
8040f54c:	00112623          	sw	ra,12(sp)
8040f550:	8d4f10ef          	jal	ra,80400624 <__panic>

8040f554 <bitmap_test>:
8040f554:	00052783          	lw	a5,0(a0)
8040f558:	02f5f463          	bgeu	a1,a5,8040f580 <bitmap_test+0x2c>
8040f55c:	00852783          	lw	a5,8(a0)
8040f560:	0055d713          	srli	a4,a1,0x5
8040f564:	00271713          	slli	a4,a4,0x2
8040f568:	00e787b3          	add	a5,a5,a4
8040f56c:	0007a503          	lw	a0,0(a5)
8040f570:	00100793          	li	a5,1
8040f574:	00b795b3          	sll	a1,a5,a1
8040f578:	00a5f533          	and	a0,a1,a0
8040f57c:	00008067          	ret
8040f580:	ff010113          	addi	sp,sp,-16
8040f584:	00112623          	sw	ra,12(sp)
8040f588:	da9ff0ef          	jal	ra,8040f330 <bitmap_translate.isra.0.part.1>

8040f58c <bitmap_free>:
8040f58c:	00052783          	lw	a5,0(a0)
8040f590:	ff010113          	addi	sp,sp,-16
8040f594:	00112623          	sw	ra,12(sp)
8040f598:	02f5fe63          	bgeu	a1,a5,8040f5d4 <bitmap_free+0x48>
8040f59c:	00852783          	lw	a5,8(a0)
8040f5a0:	0055d713          	srli	a4,a1,0x5
8040f5a4:	00271713          	slli	a4,a4,0x2
8040f5a8:	00e787b3          	add	a5,a5,a4
8040f5ac:	0007a703          	lw	a4,0(a5)
8040f5b0:	00100693          	li	a3,1
8040f5b4:	00b695b3          	sll	a1,a3,a1
8040f5b8:	00b776b3          	and	a3,a4,a1
8040f5bc:	00069e63          	bnez	a3,8040f5d8 <bitmap_free+0x4c>
8040f5c0:	00c12083          	lw	ra,12(sp)
8040f5c4:	00b76733          	or	a4,a4,a1
8040f5c8:	00e7a023          	sw	a4,0(a5)
8040f5cc:	01010113          	addi	sp,sp,16
8040f5d0:	00008067          	ret
8040f5d4:	d5dff0ef          	jal	ra,8040f330 <bitmap_translate.isra.0.part.1>
8040f5d8:	00006697          	auipc	a3,0x6
8040f5dc:	15468693          	addi	a3,a3,340 # 8041572c <dev_node_ops+0x2fc>
8040f5e0:	00003617          	auipc	a2,0x3
8040f5e4:	68c60613          	addi	a2,a2,1676 # 80412c6c <commands+0x1bc>
8040f5e8:	05f00593          	li	a1,95
8040f5ec:	00006517          	auipc	a0,0x6
8040f5f0:	16850513          	addi	a0,a0,360 # 80415754 <dev_node_ops+0x324>
8040f5f4:	830f10ef          	jal	ra,80400624 <__panic>

8040f5f8 <bitmap_destroy>:
8040f5f8:	ff010113          	addi	sp,sp,-16
8040f5fc:	00812423          	sw	s0,8(sp)
8040f600:	00050413          	mv	s0,a0
8040f604:	00852503          	lw	a0,8(a0)
8040f608:	00112623          	sw	ra,12(sp)
8040f60c:	ba8f30ef          	jal	ra,804029b4 <kfree>
8040f610:	00040513          	mv	a0,s0
8040f614:	00812403          	lw	s0,8(sp)
8040f618:	00c12083          	lw	ra,12(sp)
8040f61c:	01010113          	addi	sp,sp,16
8040f620:	b94f306f          	j	804029b4 <kfree>

8040f624 <bitmap_getdata>:
8040f624:	00058863          	beqz	a1,8040f634 <bitmap_getdata+0x10>
8040f628:	00452783          	lw	a5,4(a0)
8040f62c:	00279793          	slli	a5,a5,0x2
8040f630:	00f5a023          	sw	a5,0(a1)
8040f634:	00852503          	lw	a0,8(a0)
8040f638:	00008067          	ret

8040f63c <sfs_init>:
8040f63c:	ff010113          	addi	sp,sp,-16
8040f640:	00006517          	auipc	a0,0x6
8040f644:	e8850513          	addi	a0,a0,-376 # 804154c8 <dev_node_ops+0x98>
8040f648:	00112623          	sw	ra,12(sp)
8040f64c:	784000ef          	jal	ra,8040fdd0 <sfs_mount>
8040f650:	00051863          	bnez	a0,8040f660 <sfs_init+0x24>
8040f654:	00c12083          	lw	ra,12(sp)
8040f658:	01010113          	addi	sp,sp,16
8040f65c:	00008067          	ret
8040f660:	00050693          	mv	a3,a0
8040f664:	00006617          	auipc	a2,0x6
8040f668:	10860613          	addi	a2,a2,264 # 8041576c <dev_node_ops+0x33c>
8040f66c:	01000593          	li	a1,16
8040f670:	00006517          	auipc	a0,0x6
8040f674:	11c50513          	addi	a0,a0,284 # 8041578c <dev_node_ops+0x35c>
8040f678:	fadf00ef          	jal	ra,80400624 <__panic>

8040f67c <sfs_sync>:
8040f67c:	fe010113          	addi	sp,sp,-32
8040f680:	00112e23          	sw	ra,28(sp)
8040f684:	00812c23          	sw	s0,24(sp)
8040f688:	00912a23          	sw	s1,20(sp)
8040f68c:	01212823          	sw	s2,16(sp)
8040f690:	01312623          	sw	s3,12(sp)
8040f694:	01412423          	sw	s4,8(sp)
8040f698:	12050a63          	beqz	a0,8040f7cc <sfs_sync+0x150>
8040f69c:	06c52783          	lw	a5,108(a0)
8040f6a0:	00050a13          	mv	s4,a0
8040f6a4:	12079463          	bnez	a5,8040f7cc <sfs_sync+0x150>
8040f6a8:	135020ef          	jal	ra,80411fdc <lock_sfs_fs>
8040f6ac:	064a2403          	lw	s0,100(s4)
8040f6b0:	060a0913          	addi	s2,s4,96
8040f6b4:	06890263          	beq	s2,s0,8040f718 <sfs_sync+0x9c>
8040f6b8:	fe440493          	addi	s1,s0,-28
8040f6bc:	0e048863          	beqz	s1,8040f7ac <sfs_sync+0x130>
8040f6c0:	02042783          	lw	a5,32(s0)
8040f6c4:	0e078463          	beqz	a5,8040f7ac <sfs_sync+0x130>
8040f6c8:	0187a783          	lw	a5,24(a5)
8040f6cc:	0e078063          	beqz	a5,8040f7ac <sfs_sync+0x130>
8040f6d0:	00005997          	auipc	s3,0x5
8040f6d4:	97898993          	addi	s3,s3,-1672 # 80414048 <CSWTCH.69+0x17c>
8040f6d8:	01c0006f          	j	8040f6f4 <sfs_sync+0x78>
8040f6dc:	fe440493          	addi	s1,s0,-28
8040f6e0:	0c048663          	beqz	s1,8040f7ac <sfs_sync+0x130>
8040f6e4:	02042783          	lw	a5,32(s0)
8040f6e8:	0c078263          	beqz	a5,8040f7ac <sfs_sync+0x130>
8040f6ec:	0187a783          	lw	a5,24(a5)
8040f6f0:	0a078e63          	beqz	a5,8040f7ac <sfs_sync+0x130>
8040f6f4:	00098593          	mv	a1,s3
8040f6f8:	00048513          	mv	a0,s1
8040f6fc:	d79fd0ef          	jal	ra,8040d474 <inode_check>
8040f700:	02042783          	lw	a5,32(s0)
8040f704:	00048513          	mv	a0,s1
8040f708:	0187a783          	lw	a5,24(a5)
8040f70c:	000780e7          	jalr	a5
8040f710:	00442403          	lw	s0,4(s0)
8040f714:	fc8914e3          	bne	s2,s0,8040f6dc <sfs_sync+0x60>
8040f718:	000a0513          	mv	a0,s4
8040f71c:	0d1020ef          	jal	ra,80411fec <unlock_sfs_fs>
8040f720:	034a2503          	lw	a0,52(s4)
8040f724:	02051263          	bnez	a0,8040f748 <sfs_sync+0xcc>
8040f728:	01c12083          	lw	ra,28(sp)
8040f72c:	01812403          	lw	s0,24(sp)
8040f730:	01412483          	lw	s1,20(sp)
8040f734:	01012903          	lw	s2,16(sp)
8040f738:	00c12983          	lw	s3,12(sp)
8040f73c:	00812a03          	lw	s4,8(sp)
8040f740:	02010113          	addi	sp,sp,32
8040f744:	00008067          	ret
8040f748:	020a2a23          	sw	zero,52(s4)
8040f74c:	000a0513          	mv	a0,s4
8040f750:	700020ef          	jal	ra,80411e50 <sfs_sync_super>
8040f754:	02050663          	beqz	a0,8040f780 <sfs_sync+0x104>
8040f758:	01c12083          	lw	ra,28(sp)
8040f75c:	01812403          	lw	s0,24(sp)
8040f760:	00100793          	li	a5,1
8040f764:	02fa2a23          	sw	a5,52(s4)
8040f768:	01412483          	lw	s1,20(sp)
8040f76c:	01012903          	lw	s2,16(sp)
8040f770:	00c12983          	lw	s3,12(sp)
8040f774:	00812a03          	lw	s4,8(sp)
8040f778:	02010113          	addi	sp,sp,32
8040f77c:	00008067          	ret
8040f780:	000a0513          	mv	a0,s4
8040f784:	744020ef          	jal	ra,80411ec8 <sfs_sync_freemap>
8040f788:	fc0518e3          	bnez	a0,8040f758 <sfs_sync+0xdc>
8040f78c:	01c12083          	lw	ra,28(sp)
8040f790:	01812403          	lw	s0,24(sp)
8040f794:	01412483          	lw	s1,20(sp)
8040f798:	01012903          	lw	s2,16(sp)
8040f79c:	00c12983          	lw	s3,12(sp)
8040f7a0:	00812a03          	lw	s4,8(sp)
8040f7a4:	02010113          	addi	sp,sp,32
8040f7a8:	00008067          	ret
8040f7ac:	00005697          	auipc	a3,0x5
8040f7b0:	84c68693          	addi	a3,a3,-1972 # 80413ff8 <CSWTCH.69+0x12c>
8040f7b4:	00003617          	auipc	a2,0x3
8040f7b8:	4b860613          	addi	a2,a2,1208 # 80412c6c <commands+0x1bc>
8040f7bc:	01b00593          	li	a1,27
8040f7c0:	00006517          	auipc	a0,0x6
8040f7c4:	14450513          	addi	a0,a0,324 # 80415904 <dev_node_ops+0x4d4>
8040f7c8:	e5df00ef          	jal	ra,80400624 <__panic>
8040f7cc:	00006697          	auipc	a3,0x6
8040f7d0:	10c68693          	addi	a3,a3,268 # 804158d8 <dev_node_ops+0x4a8>
8040f7d4:	00003617          	auipc	a2,0x3
8040f7d8:	49860613          	addi	a2,a2,1176 # 80412c6c <commands+0x1bc>
8040f7dc:	01500593          	li	a1,21
8040f7e0:	00006517          	auipc	a0,0x6
8040f7e4:	12450513          	addi	a0,a0,292 # 80415904 <dev_node_ops+0x4d4>
8040f7e8:	e3df00ef          	jal	ra,80400624 <__panic>

8040f7ec <sfs_init_read>:
8040f7ec:	fe010113          	addi	sp,sp,-32
8040f7f0:	00060793          	mv	a5,a2
8040f7f4:	00812c23          	sw	s0,24(sp)
8040f7f8:	00c59693          	slli	a3,a1,0xc
8040f7fc:	00050413          	mv	s0,a0
8040f800:	00078593          	mv	a1,a5
8040f804:	00001637          	lui	a2,0x1
8040f808:	00010513          	mv	a0,sp
8040f80c:	00112e23          	sw	ra,28(sp)
8040f810:	cd1f60ef          	jal	ra,804064e0 <iobuf_init>
8040f814:	01042783          	lw	a5,16(s0)
8040f818:	00050593          	mv	a1,a0
8040f81c:	00000613          	li	a2,0
8040f820:	00040513          	mv	a0,s0
8040f824:	000780e7          	jalr	a5
8040f828:	01c12083          	lw	ra,28(sp)
8040f82c:	01812403          	lw	s0,24(sp)
8040f830:	02010113          	addi	sp,sp,32
8040f834:	00008067          	ret

8040f838 <sfs_unmount>:
8040f838:	ff010113          	addi	sp,sp,-16
8040f83c:	00112623          	sw	ra,12(sp)
8040f840:	00812423          	sw	s0,8(sp)
8040f844:	00912223          	sw	s1,4(sp)
8040f848:	06050263          	beqz	a0,8040f8ac <sfs_unmount+0x74>
8040f84c:	06c52783          	lw	a5,108(a0)
8040f850:	00050413          	mv	s0,a0
8040f854:	04079c63          	bnez	a5,8040f8ac <sfs_unmount+0x74>
8040f858:	06452703          	lw	a4,100(a0)
8040f85c:	06050793          	addi	a5,a0,96
8040f860:	04f71263          	bne	a4,a5,8040f8a4 <sfs_unmount+0x6c>
8040f864:	03452483          	lw	s1,52(a0)
8040f868:	06049263          	bnez	s1,8040f8cc <sfs_unmount+0x94>
8040f86c:	03052503          	lw	a0,48(a0)
8040f870:	d89ff0ef          	jal	ra,8040f5f8 <bitmap_destroy>
8040f874:	03842503          	lw	a0,56(s0)
8040f878:	93cf30ef          	jal	ra,804029b4 <kfree>
8040f87c:	06842503          	lw	a0,104(s0)
8040f880:	934f30ef          	jal	ra,804029b4 <kfree>
8040f884:	00040513          	mv	a0,s0
8040f888:	92cf30ef          	jal	ra,804029b4 <kfree>
8040f88c:	00c12083          	lw	ra,12(sp)
8040f890:	00812403          	lw	s0,8(sp)
8040f894:	00048513          	mv	a0,s1
8040f898:	00412483          	lw	s1,4(sp)
8040f89c:	01010113          	addi	sp,sp,16
8040f8a0:	00008067          	ret
8040f8a4:	ff100493          	li	s1,-15
8040f8a8:	fe5ff06f          	j	8040f88c <sfs_unmount+0x54>
8040f8ac:	00006697          	auipc	a3,0x6
8040f8b0:	02c68693          	addi	a3,a3,44 # 804158d8 <dev_node_ops+0x4a8>
8040f8b4:	00003617          	auipc	a2,0x3
8040f8b8:	3b860613          	addi	a2,a2,952 # 80412c6c <commands+0x1bc>
8040f8bc:	04100593          	li	a1,65
8040f8c0:	00006517          	auipc	a0,0x6
8040f8c4:	04450513          	addi	a0,a0,68 # 80415904 <dev_node_ops+0x4d4>
8040f8c8:	d5df00ef          	jal	ra,80400624 <__panic>
8040f8cc:	00006697          	auipc	a3,0x6
8040f8d0:	05068693          	addi	a3,a3,80 # 8041591c <dev_node_ops+0x4ec>
8040f8d4:	00003617          	auipc	a2,0x3
8040f8d8:	39860613          	addi	a2,a2,920 # 80412c6c <commands+0x1bc>
8040f8dc:	04500593          	li	a1,69
8040f8e0:	00006517          	auipc	a0,0x6
8040f8e4:	02450513          	addi	a0,a0,36 # 80415904 <dev_node_ops+0x4d4>
8040f8e8:	d3df00ef          	jal	ra,80400624 <__panic>

8040f8ec <sfs_cleanup>:
8040f8ec:	ff010113          	addi	sp,sp,-16
8040f8f0:	00112623          	sw	ra,12(sp)
8040f8f4:	00812423          	sw	s0,8(sp)
8040f8f8:	00912223          	sw	s1,4(sp)
8040f8fc:	01212023          	sw	s2,0(sp)
8040f900:	08050e63          	beqz	a0,8040f99c <sfs_cleanup+0xb0>
8040f904:	06c52783          	lw	a5,108(a0)
8040f908:	00050493          	mv	s1,a0
8040f90c:	08079863          	bnez	a5,8040f99c <sfs_cleanup+0xb0>
8040f910:	00452703          	lw	a4,4(a0)
8040f914:	00852683          	lw	a3,8(a0)
8040f918:	00c50913          	addi	s2,a0,12
8040f91c:	00090593          	mv	a1,s2
8040f920:	40d70633          	sub	a2,a4,a3
8040f924:	00006517          	auipc	a0,0x6
8040f928:	e7c50513          	addi	a0,a0,-388 # 804157a0 <dev_node_ops+0x370>
8040f92c:	8d1f00ef          	jal	ra,804001fc <cprintf>
8040f930:	02000413          	li	s0,32
8040f934:	00c0006f          	j	8040f940 <sfs_cleanup+0x54>
8040f938:	fff40413          	addi	s0,s0,-1
8040f93c:	02040663          	beqz	s0,8040f968 <sfs_cleanup+0x7c>
8040f940:	0704a783          	lw	a5,112(s1)
8040f944:	00048513          	mv	a0,s1
8040f948:	000780e7          	jalr	a5
8040f94c:	fe0516e3          	bnez	a0,8040f938 <sfs_cleanup+0x4c>
8040f950:	00c12083          	lw	ra,12(sp)
8040f954:	00812403          	lw	s0,8(sp)
8040f958:	00412483          	lw	s1,4(sp)
8040f95c:	00012903          	lw	s2,0(sp)
8040f960:	01010113          	addi	sp,sp,16
8040f964:	00008067          	ret
8040f968:	00812403          	lw	s0,8(sp)
8040f96c:	00c12083          	lw	ra,12(sp)
8040f970:	00412483          	lw	s1,4(sp)
8040f974:	00090693          	mv	a3,s2
8040f978:	00012903          	lw	s2,0(sp)
8040f97c:	00050713          	mv	a4,a0
8040f980:	00006617          	auipc	a2,0x6
8040f984:	e4060613          	addi	a2,a2,-448 # 804157c0 <dev_node_ops+0x390>
8040f988:	05f00593          	li	a1,95
8040f98c:	00006517          	auipc	a0,0x6
8040f990:	f7850513          	addi	a0,a0,-136 # 80415904 <dev_node_ops+0x4d4>
8040f994:	01010113          	addi	sp,sp,16
8040f998:	d11f006f          	j	804006a8 <__warn>
8040f99c:	00006697          	auipc	a3,0x6
8040f9a0:	f3c68693          	addi	a3,a3,-196 # 804158d8 <dev_node_ops+0x4a8>
8040f9a4:	00003617          	auipc	a2,0x3
8040f9a8:	2c860613          	addi	a2,a2,712 # 80412c6c <commands+0x1bc>
8040f9ac:	05400593          	li	a1,84
8040f9b0:	00006517          	auipc	a0,0x6
8040f9b4:	f5450513          	addi	a0,a0,-172 # 80415904 <dev_node_ops+0x4d4>
8040f9b8:	c6df00ef          	jal	ra,80400624 <__panic>

8040f9bc <sfs_get_root>:
8040f9bc:	fe010113          	addi	sp,sp,-32
8040f9c0:	00112e23          	sw	ra,28(sp)
8040f9c4:	02050663          	beqz	a0,8040f9f0 <sfs_get_root+0x34>
8040f9c8:	06c52783          	lw	a5,108(a0)
8040f9cc:	02079263          	bnez	a5,8040f9f0 <sfs_get_root+0x34>
8040f9d0:	00100613          	li	a2,1
8040f9d4:	00c10593          	addi	a1,sp,12
8040f9d8:	0e5010ef          	jal	ra,804112bc <sfs_load_inode>
8040f9dc:	02051a63          	bnez	a0,8040fa10 <sfs_get_root+0x54>
8040f9e0:	01c12083          	lw	ra,28(sp)
8040f9e4:	00c12503          	lw	a0,12(sp)
8040f9e8:	02010113          	addi	sp,sp,32
8040f9ec:	00008067          	ret
8040f9f0:	00006697          	auipc	a3,0x6
8040f9f4:	ee868693          	addi	a3,a3,-280 # 804158d8 <dev_node_ops+0x4a8>
8040f9f8:	00003617          	auipc	a2,0x3
8040f9fc:	27460613          	addi	a2,a2,628 # 80412c6c <commands+0x1bc>
8040fa00:	03600593          	li	a1,54
8040fa04:	00006517          	auipc	a0,0x6
8040fa08:	f0050513          	addi	a0,a0,-256 # 80415904 <dev_node_ops+0x4d4>
8040fa0c:	c19f00ef          	jal	ra,80400624 <__panic>
8040fa10:	00050693          	mv	a3,a0
8040fa14:	00006617          	auipc	a2,0x6
8040fa18:	ea860613          	addi	a2,a2,-344 # 804158bc <dev_node_ops+0x48c>
8040fa1c:	03700593          	li	a1,55
8040fa20:	00006517          	auipc	a0,0x6
8040fa24:	ee450513          	addi	a0,a0,-284 # 80415904 <dev_node_ops+0x4d4>
8040fa28:	bfdf00ef          	jal	ra,80400624 <__panic>

8040fa2c <sfs_do_mount>:
8040fa2c:	00452703          	lw	a4,4(a0)
8040fa30:	fa010113          	addi	sp,sp,-96
8040fa34:	04112e23          	sw	ra,92(sp)
8040fa38:	04812c23          	sw	s0,88(sp)
8040fa3c:	04912a23          	sw	s1,84(sp)
8040fa40:	05212823          	sw	s2,80(sp)
8040fa44:	05312623          	sw	s3,76(sp)
8040fa48:	05412423          	sw	s4,72(sp)
8040fa4c:	05512223          	sw	s5,68(sp)
8040fa50:	05612023          	sw	s6,64(sp)
8040fa54:	03712e23          	sw	s7,60(sp)
8040fa58:	03812c23          	sw	s8,56(sp)
8040fa5c:	03912a23          	sw	s9,52(sp)
8040fa60:	03a12823          	sw	s10,48(sp)
8040fa64:	03b12623          	sw	s11,44(sp)
8040fa68:	000017b7          	lui	a5,0x1
8040fa6c:	2ef71263          	bne	a4,a5,8040fd50 <sfs_do_mount+0x324>
8040fa70:	00050913          	mv	s2,a0
8040fa74:	00000513          	li	a0,0
8040fa78:	00058a93          	mv	s5,a1
8040fa7c:	c85fd0ef          	jal	ra,8040d700 <__alloc_fs>
8040fa80:	00050413          	mv	s0,a0
8040fa84:	2e050263          	beqz	a0,8040fd68 <sfs_do_mount+0x33c>
8040fa88:	06c52a03          	lw	s4,108(a0)
8040fa8c:	300a1263          	bnez	s4,8040fd90 <sfs_do_mount+0x364>
8040fa90:	03252623          	sw	s2,44(a0)
8040fa94:	00001537          	lui	a0,0x1
8040fa98:	df9f20ef          	jal	ra,80402890 <kmalloc>
8040fa9c:	02a42c23          	sw	a0,56(s0)
8040faa0:	00050493          	mv	s1,a0
8040faa4:	1a050c63          	beqz	a0,8040fc5c <sfs_do_mount+0x230>
8040faa8:	00050613          	mv	a2,a0
8040faac:	00000593          	li	a1,0
8040fab0:	00090513          	mv	a0,s2
8040fab4:	d39ff0ef          	jal	ra,8040f7ec <sfs_init_read>
8040fab8:	00050b13          	mv	s6,a0
8040fabc:	14051863          	bnez	a0,8040fc0c <sfs_do_mount+0x1e0>
8040fac0:	0004a583          	lw	a1,0(s1)
8040fac4:	2f8dc637          	lui	a2,0x2f8dc
8040fac8:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f863e2a>
8040facc:	1ac59863          	bne	a1,a2,8040fc7c <sfs_do_mount+0x250>
8040fad0:	0044a783          	lw	a5,4(s1)
8040fad4:	00092603          	lw	a2,0(s2)
8040fad8:	18f66663          	bltu	a2,a5,8040fc64 <sfs_do_mount+0x238>
8040fadc:	020485a3          	sb	zero,43(s1)
8040fae0:	0084af03          	lw	t5,8(s1)
8040fae4:	00c4ae83          	lw	t4,12(s1)
8040fae8:	0104ae03          	lw	t3,16(s1)
8040faec:	0144a303          	lw	t1,20(s1)
8040faf0:	0184a883          	lw	a7,24(s1)
8040faf4:	01c4a803          	lw	a6,28(s1)
8040faf8:	0204a603          	lw	a2,32(s1)
8040fafc:	0244a683          	lw	a3,36(s1)
8040fb00:	0284a703          	lw	a4,40(s1)
8040fb04:	00002537          	lui	a0,0x2
8040fb08:	00f42223          	sw	a5,4(s0)
8040fb0c:	00b42023          	sw	a1,0(s0)
8040fb10:	01e42423          	sw	t5,8(s0)
8040fb14:	01d42623          	sw	t4,12(s0)
8040fb18:	01c42823          	sw	t3,16(s0)
8040fb1c:	00642a23          	sw	t1,20(s0)
8040fb20:	01142c23          	sw	a7,24(s0)
8040fb24:	01042e23          	sw	a6,28(s0)
8040fb28:	02c42023          	sw	a2,32(s0)
8040fb2c:	02d42223          	sw	a3,36(s0)
8040fb30:	02e42423          	sw	a4,40(s0)
8040fb34:	d5df20ef          	jal	ra,80402890 <kmalloc>
8040fb38:	00a12423          	sw	a0,8(sp)
8040fb3c:	06a42423          	sw	a0,104(s0)
8040fb40:	00050793          	mv	a5,a0
8040fb44:	20050a63          	beqz	a0,8040fd58 <sfs_do_mount+0x32c>
8040fb48:	00002737          	lui	a4,0x2
8040fb4c:	00e50733          	add	a4,a0,a4
8040fb50:	00f7a223          	sw	a5,4(a5) # 1004 <_binary_bin_swap_img_size-0x6ffc>
8040fb54:	00f7a023          	sw	a5,0(a5)
8040fb58:	00878793          	addi	a5,a5,8
8040fb5c:	fee79ae3          	bne	a5,a4,8040fb50 <sfs_do_mount+0x124>
8040fb60:	0044ab83          	lw	s7,4(s1)
8040fb64:	00008737          	lui	a4,0x8
8040fb68:	fff70993          	addi	s3,a4,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8040fb6c:	ffff87b7          	lui	a5,0xffff8
8040fb70:	013b8bb3          	add	s7,s7,s3
8040fb74:	00fbfbb3          	and	s7,s7,a5
8040fb78:	000b8513          	mv	a0,s7
8040fb7c:	fdcff0ef          	jal	ra,8040f358 <bitmap_create>
8040fb80:	02a42823          	sw	a0,48(s0)
8040fb84:	00050c93          	mv	s9,a0
8040fb88:	1c050063          	beqz	a0,8040fd48 <sfs_do_mount+0x31c>
8040fb8c:	0044a703          	lw	a4,4(s1)
8040fb90:	01c10593          	addi	a1,sp,28
8040fb94:	01370733          	add	a4,a4,s3
8040fb98:	00f75713          	srli	a4,a4,0xf
8040fb9c:	00e12623          	sw	a4,12(sp)
8040fba0:	a85ff0ef          	jal	ra,8040f624 <bitmap_getdata>
8040fba4:	00050c13          	mv	s8,a0
8040fba8:	1c050463          	beqz	a0,8040fd70 <sfs_do_mount+0x344>
8040fbac:	00c12703          	lw	a4,12(sp)
8040fbb0:	01c12683          	lw	a3,28(sp)
8040fbb4:	00c71613          	slli	a2,a4,0xc
8040fbb8:	1ad61c63          	bne	a2,a3,8040fd70 <sfs_do_mount+0x344>
8040fbbc:	00200993          	li	s3,2
8040fbc0:	00001db7          	lui	s11,0x1
8040fbc4:	00270d13          	addi	s10,a4,2
8040fbc8:	00071a63          	bnez	a4,8040fbdc <sfs_do_mount+0x1b0>
8040fbcc:	0c40006f          	j	8040fc90 <sfs_do_mount+0x264>
8040fbd0:	00198993          	addi	s3,s3,1
8040fbd4:	01bc0c33          	add	s8,s8,s11
8040fbd8:	0ba98c63          	beq	s3,s10,8040fc90 <sfs_do_mount+0x264>
8040fbdc:	000c0613          	mv	a2,s8
8040fbe0:	00098593          	mv	a1,s3
8040fbe4:	00090513          	mv	a0,s2
8040fbe8:	c05ff0ef          	jal	ra,8040f7ec <sfs_init_read>
8040fbec:	fe0502e3          	beqz	a0,8040fbd0 <sfs_do_mount+0x1a4>
8040fbf0:	00a12623          	sw	a0,12(sp)
8040fbf4:	000c8513          	mv	a0,s9
8040fbf8:	a01ff0ef          	jal	ra,8040f5f8 <bitmap_destroy>
8040fbfc:	00c12703          	lw	a4,12(sp)
8040fc00:	00070b13          	mv	s6,a4
8040fc04:	00812503          	lw	a0,8(sp)
8040fc08:	dadf20ef          	jal	ra,804029b4 <kfree>
8040fc0c:	00048513          	mv	a0,s1
8040fc10:	da5f20ef          	jal	ra,804029b4 <kfree>
8040fc14:	00040513          	mv	a0,s0
8040fc18:	d9df20ef          	jal	ra,804029b4 <kfree>
8040fc1c:	05c12083          	lw	ra,92(sp)
8040fc20:	05812403          	lw	s0,88(sp)
8040fc24:	000b0513          	mv	a0,s6
8040fc28:	05412483          	lw	s1,84(sp)
8040fc2c:	05012903          	lw	s2,80(sp)
8040fc30:	04c12983          	lw	s3,76(sp)
8040fc34:	04812a03          	lw	s4,72(sp)
8040fc38:	04412a83          	lw	s5,68(sp)
8040fc3c:	04012b03          	lw	s6,64(sp)
8040fc40:	03c12b83          	lw	s7,60(sp)
8040fc44:	03812c03          	lw	s8,56(sp)
8040fc48:	03412c83          	lw	s9,52(sp)
8040fc4c:	03012d03          	lw	s10,48(sp)
8040fc50:	02c12d83          	lw	s11,44(sp)
8040fc54:	06010113          	addi	sp,sp,96
8040fc58:	00008067          	ret
8040fc5c:	ffc00b13          	li	s6,-4
8040fc60:	fb5ff06f          	j	8040fc14 <sfs_do_mount+0x1e8>
8040fc64:	00078593          	mv	a1,a5
8040fc68:	00006517          	auipc	a0,0x6
8040fc6c:	bac50513          	addi	a0,a0,-1108 # 80415814 <dev_node_ops+0x3e4>
8040fc70:	d8cf00ef          	jal	ra,804001fc <cprintf>
8040fc74:	ffd00b13          	li	s6,-3
8040fc78:	f95ff06f          	j	8040fc0c <sfs_do_mount+0x1e0>
8040fc7c:	00006517          	auipc	a0,0x6
8040fc80:	b6050513          	addi	a0,a0,-1184 # 804157dc <dev_node_ops+0x3ac>
8040fc84:	d78f00ef          	jal	ra,804001fc <cprintf>
8040fc88:	ffd00b13          	li	s6,-3
8040fc8c:	f81ff06f          	j	8040fc0c <sfs_do_mount+0x1e0>
8040fc90:	00442903          	lw	s2,4(s0)
8040fc94:	00000493          	li	s1,0
8040fc98:	0c0b8463          	beqz	s7,8040fd60 <sfs_do_mount+0x334>
8040fc9c:	00048593          	mv	a1,s1
8040fca0:	000c8513          	mv	a0,s9
8040fca4:	8b1ff0ef          	jal	ra,8040f554 <bitmap_test>
8040fca8:	00a03533          	snez	a0,a0
8040fcac:	00148493          	addi	s1,s1,1
8040fcb0:	00aa0a33          	add	s4,s4,a0
8040fcb4:	fe9b94e3          	bne	s7,s1,8040fc9c <sfs_do_mount+0x270>
8040fcb8:	00842783          	lw	a5,8(s0)
8040fcbc:	0f479a63          	bne	a5,s4,8040fdb0 <sfs_do_mount+0x384>
8040fcc0:	00100593          	li	a1,1
8040fcc4:	03c40513          	addi	a0,s0,60
8040fcc8:	02042a23          	sw	zero,52(s0)
8040fccc:	bb0f50ef          	jal	ra,8040507c <sem_init>
8040fcd0:	00100593          	li	a1,1
8040fcd4:	04840513          	addi	a0,s0,72
8040fcd8:	ba4f50ef          	jal	ra,8040507c <sem_init>
8040fcdc:	00100593          	li	a1,1
8040fce0:	05440513          	addi	a0,s0,84
8040fce4:	b98f50ef          	jal	ra,8040507c <sem_init>
8040fce8:	06040793          	addi	a5,s0,96
8040fcec:	06f42223          	sw	a5,100(s0)
8040fcf0:	06f42023          	sw	a5,96(s0)
8040fcf4:	00090713          	mv	a4,s2
8040fcf8:	000a0693          	mv	a3,s4
8040fcfc:	41490633          	sub	a2,s2,s4
8040fd00:	00c40593          	addi	a1,s0,12
8040fd04:	00006517          	auipc	a0,0x6
8040fd08:	b9850513          	addi	a0,a0,-1128 # 8041589c <dev_node_ops+0x46c>
8040fd0c:	cf0f00ef          	jal	ra,804001fc <cprintf>
8040fd10:	00000797          	auipc	a5,0x0
8040fd14:	96c78793          	addi	a5,a5,-1684 # 8040f67c <sfs_sync>
8040fd18:	06f42823          	sw	a5,112(s0)
8040fd1c:	00000797          	auipc	a5,0x0
8040fd20:	ca078793          	addi	a5,a5,-864 # 8040f9bc <sfs_get_root>
8040fd24:	06f42a23          	sw	a5,116(s0)
8040fd28:	00000797          	auipc	a5,0x0
8040fd2c:	b1078793          	addi	a5,a5,-1264 # 8040f838 <sfs_unmount>
8040fd30:	06f42c23          	sw	a5,120(s0)
8040fd34:	00000797          	auipc	a5,0x0
8040fd38:	bb878793          	addi	a5,a5,-1096 # 8040f8ec <sfs_cleanup>
8040fd3c:	06f42e23          	sw	a5,124(s0)
8040fd40:	008aa023          	sw	s0,0(s5)
8040fd44:	ed9ff06f          	j	8040fc1c <sfs_do_mount+0x1f0>
8040fd48:	ffc00b13          	li	s6,-4
8040fd4c:	eb9ff06f          	j	8040fc04 <sfs_do_mount+0x1d8>
8040fd50:	ff200b13          	li	s6,-14
8040fd54:	ec9ff06f          	j	8040fc1c <sfs_do_mount+0x1f0>
8040fd58:	ffc00b13          	li	s6,-4
8040fd5c:	eb1ff06f          	j	8040fc0c <sfs_do_mount+0x1e0>
8040fd60:	00000a13          	li	s4,0
8040fd64:	f55ff06f          	j	8040fcb8 <sfs_do_mount+0x28c>
8040fd68:	ffc00b13          	li	s6,-4
8040fd6c:	eb1ff06f          	j	8040fc1c <sfs_do_mount+0x1f0>
8040fd70:	00006697          	auipc	a3,0x6
8040fd74:	ad468693          	addi	a3,a3,-1324 # 80415844 <dev_node_ops+0x414>
8040fd78:	00003617          	auipc	a2,0x3
8040fd7c:	ef460613          	addi	a2,a2,-268 # 80412c6c <commands+0x1bc>
8040fd80:	08300593          	li	a1,131
8040fd84:	00006517          	auipc	a0,0x6
8040fd88:	b8050513          	addi	a0,a0,-1152 # 80415904 <dev_node_ops+0x4d4>
8040fd8c:	899f00ef          	jal	ra,80400624 <__panic>
8040fd90:	00006697          	auipc	a3,0x6
8040fd94:	b4868693          	addi	a3,a3,-1208 # 804158d8 <dev_node_ops+0x4a8>
8040fd98:	00003617          	auipc	a2,0x3
8040fd9c:	ed460613          	addi	a2,a2,-300 # 80412c6c <commands+0x1bc>
8040fda0:	0a300593          	li	a1,163
8040fda4:	00006517          	auipc	a0,0x6
8040fda8:	b6050513          	addi	a0,a0,-1184 # 80415904 <dev_node_ops+0x4d4>
8040fdac:	879f00ef          	jal	ra,80400624 <__panic>
8040fdb0:	00006697          	auipc	a3,0x6
8040fdb4:	ac068693          	addi	a3,a3,-1344 # 80415870 <dev_node_ops+0x440>
8040fdb8:	00003617          	auipc	a2,0x3
8040fdbc:	eb460613          	addi	a2,a2,-332 # 80412c6c <commands+0x1bc>
8040fdc0:	0e000593          	li	a1,224
8040fdc4:	00006517          	auipc	a0,0x6
8040fdc8:	b4050513          	addi	a0,a0,-1216 # 80415904 <dev_node_ops+0x4d4>
8040fdcc:	859f00ef          	jal	ra,80400624 <__panic>

8040fdd0 <sfs_mount>:
8040fdd0:	00000597          	auipc	a1,0x0
8040fdd4:	c5c58593          	addi	a1,a1,-932 # 8040fa2c <sfs_do_mount>
8040fdd8:	f15fd06f          	j	8040dcec <vfs_mount>

8040fddc <sfs_opendir>:
8040fddc:	0235f593          	andi	a1,a1,35
8040fde0:	00000513          	li	a0,0
8040fde4:	00059463          	bnez	a1,8040fdec <sfs_opendir+0x10>
8040fde8:	00008067          	ret
8040fdec:	fef00513          	li	a0,-17
8040fdf0:	00008067          	ret

8040fdf4 <sfs_openfile>:
8040fdf4:	00000513          	li	a0,0
8040fdf8:	00008067          	ret

8040fdfc <sfs_fsync>:
8040fdfc:	fe010113          	addi	sp,sp,-32
8040fe00:	01212823          	sw	s2,16(sp)
8040fe04:	03852903          	lw	s2,56(a0)
8040fe08:	00112e23          	sw	ra,28(sp)
8040fe0c:	00812c23          	sw	s0,24(sp)
8040fe10:	00912a23          	sw	s1,20(sp)
8040fe14:	01312623          	sw	s3,12(sp)
8040fe18:	0a090a63          	beqz	s2,8040fecc <sfs_fsync+0xd0>
8040fe1c:	06c92783          	lw	a5,108(s2)
8040fe20:	0a079663          	bnez	a5,8040fecc <sfs_fsync+0xd0>
8040fe24:	02c52703          	lw	a4,44(a0)
8040fe28:	000017b7          	lui	a5,0x1
8040fe2c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040fe30:	00050413          	mv	s0,a0
8040fe34:	0af71c63          	bne	a4,a5,8040feec <sfs_fsync+0xf0>
8040fe38:	00852483          	lw	s1,8(a0)
8040fe3c:	02049263          	bnez	s1,8040fe60 <sfs_fsync+0x64>
8040fe40:	01c12083          	lw	ra,28(sp)
8040fe44:	01812403          	lw	s0,24(sp)
8040fe48:	00048513          	mv	a0,s1
8040fe4c:	01012903          	lw	s2,16(sp)
8040fe50:	01412483          	lw	s1,20(sp)
8040fe54:	00c12983          	lw	s3,12(sp)
8040fe58:	02010113          	addi	sp,sp,32
8040fe5c:	00008067          	ret
8040fe60:	01050993          	addi	s3,a0,16
8040fe64:	00098513          	mv	a0,s3
8040fe68:	a24f50ef          	jal	ra,8040508c <down>
8040fe6c:	00842483          	lw	s1,8(s0)
8040fe70:	02049663          	bnez	s1,8040fe9c <sfs_fsync+0xa0>
8040fe74:	00098513          	mv	a0,s3
8040fe78:	a10f50ef          	jal	ra,80405088 <up>
8040fe7c:	01c12083          	lw	ra,28(sp)
8040fe80:	01812403          	lw	s0,24(sp)
8040fe84:	00048513          	mv	a0,s1
8040fe88:	01012903          	lw	s2,16(sp)
8040fe8c:	01412483          	lw	s1,20(sp)
8040fe90:	00c12983          	lw	s3,12(sp)
8040fe94:	02010113          	addi	sp,sp,32
8040fe98:	00008067          	ret
8040fe9c:	00442683          	lw	a3,4(s0)
8040fea0:	00042583          	lw	a1,0(s0)
8040fea4:	00042423          	sw	zero,8(s0)
8040fea8:	00000713          	li	a4,0
8040feac:	04000613          	li	a2,64
8040feb0:	00090513          	mv	a0,s2
8040feb4:	691010ef          	jal	ra,80411d44 <sfs_wbuf>
8040feb8:	00050493          	mv	s1,a0
8040febc:	fa050ce3          	beqz	a0,8040fe74 <sfs_fsync+0x78>
8040fec0:	00100793          	li	a5,1
8040fec4:	00f42423          	sw	a5,8(s0)
8040fec8:	fadff06f          	j	8040fe74 <sfs_fsync+0x78>
8040fecc:	00006697          	auipc	a3,0x6
8040fed0:	a0c68693          	addi	a3,a3,-1524 # 804158d8 <dev_node_ops+0x4a8>
8040fed4:	00003617          	auipc	a2,0x3
8040fed8:	d9860613          	addi	a2,a2,-616 # 80412c6c <commands+0x1bc>
8040fedc:	2c700593          	li	a1,711
8040fee0:	00006517          	auipc	a0,0x6
8040fee4:	b9450513          	addi	a0,a0,-1132 # 80415a74 <dev_node_ops+0x644>
8040fee8:	f3cf00ef          	jal	ra,80400624 <__panic>
8040feec:	00006697          	auipc	a3,0x6
8040fef0:	ba068693          	addi	a3,a3,-1120 # 80415a8c <dev_node_ops+0x65c>
8040fef4:	00003617          	auipc	a2,0x3
8040fef8:	d7860613          	addi	a2,a2,-648 # 80412c6c <commands+0x1bc>
8040fefc:	2c800593          	li	a1,712
8040ff00:	00006517          	auipc	a0,0x6
8040ff04:	b7450513          	addi	a0,a0,-1164 # 80415a74 <dev_node_ops+0x644>
8040ff08:	f1cf00ef          	jal	ra,80400624 <__panic>

8040ff0c <sfs_gettype>:
8040ff0c:	ff010113          	addi	sp,sp,-16
8040ff10:	00112623          	sw	ra,12(sp)
8040ff14:	06050e63          	beqz	a0,8040ff90 <sfs_gettype+0x84>
8040ff18:	02c52683          	lw	a3,44(a0)
8040ff1c:	000017b7          	lui	a5,0x1
8040ff20:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040ff24:	06e69663          	bne	a3,a4,8040ff90 <sfs_gettype+0x84>
8040ff28:	00052683          	lw	a3,0(a0)
8040ff2c:	00200713          	li	a4,2
8040ff30:	0046d683          	lhu	a3,4(a3)
8040ff34:	04e68263          	beq	a3,a4,8040ff78 <sfs_gettype+0x6c>
8040ff38:	00300713          	li	a4,3
8040ff3c:	02e68263          	beq	a3,a4,8040ff60 <sfs_gettype+0x54>
8040ff40:	00100713          	li	a4,1
8040ff44:	02e68063          	beq	a3,a4,8040ff64 <sfs_gettype+0x58>
8040ff48:	00006617          	auipc	a2,0x6
8040ff4c:	b7c60613          	addi	a2,a2,-1156 # 80415ac4 <dev_node_ops+0x694>
8040ff50:	38f00593          	li	a1,911
8040ff54:	00006517          	auipc	a0,0x6
8040ff58:	b2050513          	addi	a0,a0,-1248 # 80415a74 <dev_node_ops+0x644>
8040ff5c:	ec8f00ef          	jal	ra,80400624 <__panic>
8040ff60:	000037b7          	lui	a5,0x3
8040ff64:	00c12083          	lw	ra,12(sp)
8040ff68:	00f5a023          	sw	a5,0(a1)
8040ff6c:	00000513          	li	a0,0
8040ff70:	01010113          	addi	sp,sp,16
8040ff74:	00008067          	ret
8040ff78:	00c12083          	lw	ra,12(sp)
8040ff7c:	000027b7          	lui	a5,0x2
8040ff80:	00f5a023          	sw	a5,0(a1)
8040ff84:	00000513          	li	a0,0
8040ff88:	01010113          	addi	sp,sp,16
8040ff8c:	00008067          	ret
8040ff90:	00006697          	auipc	a3,0x6
8040ff94:	afc68693          	addi	a3,a3,-1284 # 80415a8c <dev_node_ops+0x65c>
8040ff98:	00003617          	auipc	a2,0x3
8040ff9c:	cd460613          	addi	a2,a2,-812 # 80412c6c <commands+0x1bc>
8040ffa0:	38300593          	li	a1,899
8040ffa4:	00006517          	auipc	a0,0x6
8040ffa8:	ad050513          	addi	a0,a0,-1328 # 80415a74 <dev_node_ops+0x644>
8040ffac:	e78f00ef          	jal	ra,80400624 <__panic>

8040ffb0 <sfs_block_inuse.isra.3>:
8040ffb0:	ff010113          	addi	sp,sp,-16
8040ffb4:	00112623          	sw	ra,12(sp)
8040ffb8:	02060263          	beqz	a2,8040ffdc <sfs_block_inuse.isra.3+0x2c>
8040ffbc:	02a67063          	bgeu	a2,a0,8040ffdc <sfs_block_inuse.isra.3+0x2c>
8040ffc0:	0005a503          	lw	a0,0(a1)
8040ffc4:	00060593          	mv	a1,a2
8040ffc8:	d8cff0ef          	jal	ra,8040f554 <bitmap_test>
8040ffcc:	00c12083          	lw	ra,12(sp)
8040ffd0:	00153513          	seqz	a0,a0
8040ffd4:	01010113          	addi	sp,sp,16
8040ffd8:	00008067          	ret
8040ffdc:	00060713          	mv	a4,a2
8040ffe0:	00050693          	mv	a3,a0
8040ffe4:	00006617          	auipc	a2,0x6
8040ffe8:	99060613          	addi	a2,a2,-1648 # 80415974 <dev_node_ops+0x544>
8040ffec:	05300593          	li	a1,83
8040fff0:	00006517          	auipc	a0,0x6
8040fff4:	a8450513          	addi	a0,a0,-1404 # 80415a74 <dev_node_ops+0x644>
8040fff8:	e2cf00ef          	jal	ra,80400624 <__panic>

8040fffc <sfs_block_alloc>:
8040fffc:	ff010113          	addi	sp,sp,-16
80410000:	00812423          	sw	s0,8(sp)
80410004:	00050413          	mv	s0,a0
80410008:	03052503          	lw	a0,48(a0)
8041000c:	00912223          	sw	s1,4(sp)
80410010:	00112623          	sw	ra,12(sp)
80410014:	00058493          	mv	s1,a1
80410018:	c90ff0ef          	jal	ra,8040f4a8 <bitmap_alloc>
8041001c:	04051863          	bnez	a0,8041006c <sfs_block_alloc+0x70>
80410020:	00842783          	lw	a5,8(s0)
80410024:	06078e63          	beqz	a5,804100a0 <sfs_block_alloc+0xa4>
80410028:	fff78793          	addi	a5,a5,-1 # 1fff <_binary_bin_swap_img_size-0x6001>
8041002c:	00f42423          	sw	a5,8(s0)
80410030:	00100793          	li	a5,1
80410034:	02f42a23          	sw	a5,52(s0)
80410038:	0004a603          	lw	a2,0(s1)
8041003c:	00442503          	lw	a0,4(s0)
80410040:	03040593          	addi	a1,s0,48
80410044:	f6dff0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
80410048:	02050c63          	beqz	a0,80410080 <sfs_block_alloc+0x84>
8041004c:	00040513          	mv	a0,s0
80410050:	00812403          	lw	s0,8(sp)
80410054:	0004a583          	lw	a1,0(s1)
80410058:	00c12083          	lw	ra,12(sp)
8041005c:	00412483          	lw	s1,4(sp)
80410060:	00100613          	li	a2,1
80410064:	01010113          	addi	sp,sp,16
80410068:	6bd0106f          	j	80411f24 <sfs_clear_block>
8041006c:	00c12083          	lw	ra,12(sp)
80410070:	00812403          	lw	s0,8(sp)
80410074:	00412483          	lw	s1,4(sp)
80410078:	01010113          	addi	sp,sp,16
8041007c:	00008067          	ret
80410080:	00006697          	auipc	a3,0x6
80410084:	8d068693          	addi	a3,a3,-1840 # 80415950 <dev_node_ops+0x520>
80410088:	00003617          	auipc	a2,0x3
8041008c:	be460613          	addi	a2,a2,-1052 # 80412c6c <commands+0x1bc>
80410090:	06100593          	li	a1,97
80410094:	00006517          	auipc	a0,0x6
80410098:	9e050513          	addi	a0,a0,-1568 # 80415a74 <dev_node_ops+0x644>
8041009c:	d88f00ef          	jal	ra,80400624 <__panic>
804100a0:	00006697          	auipc	a3,0x6
804100a4:	89068693          	addi	a3,a3,-1904 # 80415930 <dev_node_ops+0x500>
804100a8:	00003617          	auipc	a2,0x3
804100ac:	bc460613          	addi	a2,a2,-1084 # 80412c6c <commands+0x1bc>
804100b0:	05f00593          	li	a1,95
804100b4:	00006517          	auipc	a0,0x6
804100b8:	9c050513          	addi	a0,a0,-1600 # 80415a74 <dev_node_ops+0x644>
804100bc:	d68f00ef          	jal	ra,80400624 <__panic>

804100c0 <sfs_block_free>:
804100c0:	ff010113          	addi	sp,sp,-16
804100c4:	00812423          	sw	s0,8(sp)
804100c8:	00050413          	mv	s0,a0
804100cc:	00452503          	lw	a0,4(a0)
804100d0:	00912223          	sw	s1,4(sp)
804100d4:	00058613          	mv	a2,a1
804100d8:	00058493          	mv	s1,a1
804100dc:	03040593          	addi	a1,s0,48
804100e0:	00112623          	sw	ra,12(sp)
804100e4:	ecdff0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
804100e8:	02050c63          	beqz	a0,80410120 <sfs_block_free+0x60>
804100ec:	03042503          	lw	a0,48(s0)
804100f0:	00048593          	mv	a1,s1
804100f4:	c98ff0ef          	jal	ra,8040f58c <bitmap_free>
804100f8:	00842783          	lw	a5,8(s0)
804100fc:	00100713          	li	a4,1
80410100:	02e42a23          	sw	a4,52(s0)
80410104:	00178793          	addi	a5,a5,1
80410108:	00f42423          	sw	a5,8(s0)
8041010c:	00c12083          	lw	ra,12(sp)
80410110:	00812403          	lw	s0,8(sp)
80410114:	00412483          	lw	s1,4(sp)
80410118:	01010113          	addi	sp,sp,16
8041011c:	00008067          	ret
80410120:	00006697          	auipc	a3,0x6
80410124:	8ec68693          	addi	a3,a3,-1812 # 80415a0c <dev_node_ops+0x5dc>
80410128:	00003617          	auipc	a2,0x3
8041012c:	b4460613          	addi	a2,a2,-1212 # 80412c6c <commands+0x1bc>
80410130:	06a00593          	li	a1,106
80410134:	00006517          	auipc	a0,0x6
80410138:	94050513          	addi	a0,a0,-1728 # 80415a74 <dev_node_ops+0x644>
8041013c:	ce8f00ef          	jal	ra,80400624 <__panic>

80410140 <sfs_reclaim>:
80410140:	ff010113          	addi	sp,sp,-16
80410144:	00912223          	sw	s1,4(sp)
80410148:	03852483          	lw	s1,56(a0)
8041014c:	00112623          	sw	ra,12(sp)
80410150:	00812423          	sw	s0,8(sp)
80410154:	01212023          	sw	s2,0(sp)
80410158:	16048c63          	beqz	s1,804102d0 <sfs_reclaim+0x190>
8041015c:	06c4a783          	lw	a5,108(s1)
80410160:	16079863          	bnez	a5,804102d0 <sfs_reclaim+0x190>
80410164:	02c52703          	lw	a4,44(a0)
80410168:	000017b7          	lui	a5,0x1
8041016c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410170:	00050413          	mv	s0,a0
80410174:	18f71e63          	bne	a4,a5,80410310 <sfs_reclaim+0x1d0>
80410178:	00048513          	mv	a0,s1
8041017c:	661010ef          	jal	ra,80411fdc <lock_sfs_fs>
80410180:	00c42783          	lw	a5,12(s0)
80410184:	16f05663          	blez	a5,804102f0 <sfs_reclaim+0x1b0>
80410188:	fff78793          	addi	a5,a5,-1
8041018c:	00f42623          	sw	a5,12(s0)
80410190:	0e079463          	bnez	a5,80410278 <sfs_reclaim+0x138>
80410194:	03042903          	lw	s2,48(s0)
80410198:	0e091063          	bnez	s2,80410278 <sfs_reclaim+0x138>
8041019c:	00042783          	lw	a5,0(s0)
804101a0:	0067d783          	lhu	a5,6(a5)
804101a4:	02079e63          	bnez	a5,804101e0 <sfs_reclaim+0xa0>
804101a8:	03c42783          	lw	a5,60(s0)
804101ac:	18078263          	beqz	a5,80410330 <sfs_reclaim+0x1f0>
804101b0:	0307a783          	lw	a5,48(a5)
804101b4:	16078e63          	beqz	a5,80410330 <sfs_reclaim+0x1f0>
804101b8:	00005597          	auipc	a1,0x5
804101bc:	10458593          	addi	a1,a1,260 # 804152bc <syscalls+0x8c0>
804101c0:	00040513          	mv	a0,s0
804101c4:	ab0fd0ef          	jal	ra,8040d474 <inode_check>
804101c8:	03c42783          	lw	a5,60(s0)
804101cc:	00000593          	li	a1,0
804101d0:	00040513          	mv	a0,s0
804101d4:	0307a783          	lw	a5,48(a5)
804101d8:	000780e7          	jalr	a5
804101dc:	0e051663          	bnez	a0,804102c8 <sfs_reclaim+0x188>
804101e0:	00842783          	lw	a5,8(s0)
804101e4:	02078c63          	beqz	a5,8041021c <sfs_reclaim+0xdc>
804101e8:	03c42783          	lw	a5,60(s0)
804101ec:	16078263          	beqz	a5,80410350 <sfs_reclaim+0x210>
804101f0:	0187a783          	lw	a5,24(a5)
804101f4:	14078e63          	beqz	a5,80410350 <sfs_reclaim+0x210>
804101f8:	00040513          	mv	a0,s0
804101fc:	00004597          	auipc	a1,0x4
80410200:	e4c58593          	addi	a1,a1,-436 # 80414048 <CSWTCH.69+0x17c>
80410204:	a70fd0ef          	jal	ra,8040d474 <inode_check>
80410208:	03c42783          	lw	a5,60(s0)
8041020c:	00040513          	mv	a0,s0
80410210:	0187a783          	lw	a5,24(a5)
80410214:	000780e7          	jalr	a5
80410218:	0a051863          	bnez	a0,804102c8 <sfs_reclaim+0x188>
8041021c:	01c42703          	lw	a4,28(s0)
80410220:	02042783          	lw	a5,32(s0)
80410224:	00048513          	mv	a0,s1
80410228:	00f72223          	sw	a5,4(a4)
8041022c:	00e7a023          	sw	a4,0(a5)
80410230:	02442703          	lw	a4,36(s0)
80410234:	02842783          	lw	a5,40(s0)
80410238:	00f72223          	sw	a5,4(a4)
8041023c:	00e7a023          	sw	a4,0(a5)
80410240:	5ad010ef          	jal	ra,80411fec <unlock_sfs_fs>
80410244:	00042503          	lw	a0,0(s0)
80410248:	00655783          	lhu	a5,6(a0)
8041024c:	04078a63          	beqz	a5,804102a0 <sfs_reclaim+0x160>
80410250:	f64f20ef          	jal	ra,804029b4 <kfree>
80410254:	00040513          	mv	a0,s0
80410258:	990fd0ef          	jal	ra,8040d3e8 <inode_kill>
8041025c:	00c12083          	lw	ra,12(sp)
80410260:	00812403          	lw	s0,8(sp)
80410264:	00090513          	mv	a0,s2
80410268:	00412483          	lw	s1,4(sp)
8041026c:	00012903          	lw	s2,0(sp)
80410270:	01010113          	addi	sp,sp,16
80410274:	00008067          	ret
80410278:	ff100913          	li	s2,-15
8041027c:	00048513          	mv	a0,s1
80410280:	56d010ef          	jal	ra,80411fec <unlock_sfs_fs>
80410284:	00c12083          	lw	ra,12(sp)
80410288:	00812403          	lw	s0,8(sp)
8041028c:	00090513          	mv	a0,s2
80410290:	00412483          	lw	s1,4(sp)
80410294:	00012903          	lw	s2,0(sp)
80410298:	01010113          	addi	sp,sp,16
8041029c:	00008067          	ret
804102a0:	00442583          	lw	a1,4(s0)
804102a4:	00048513          	mv	a0,s1
804102a8:	e19ff0ef          	jal	ra,804100c0 <sfs_block_free>
804102ac:	00042503          	lw	a0,0(s0)
804102b0:	03c52583          	lw	a1,60(a0)
804102b4:	f8058ee3          	beqz	a1,80410250 <sfs_reclaim+0x110>
804102b8:	00048513          	mv	a0,s1
804102bc:	e05ff0ef          	jal	ra,804100c0 <sfs_block_free>
804102c0:	00042503          	lw	a0,0(s0)
804102c4:	f8dff06f          	j	80410250 <sfs_reclaim+0x110>
804102c8:	00050913          	mv	s2,a0
804102cc:	fb1ff06f          	j	8041027c <sfs_reclaim+0x13c>
804102d0:	00005697          	auipc	a3,0x5
804102d4:	60868693          	addi	a3,a3,1544 # 804158d8 <dev_node_ops+0x4a8>
804102d8:	00003617          	auipc	a2,0x3
804102dc:	99460613          	addi	a2,a2,-1644 # 80412c6c <commands+0x1bc>
804102e0:	35800593          	li	a1,856
804102e4:	00005517          	auipc	a0,0x5
804102e8:	79050513          	addi	a0,a0,1936 # 80415a74 <dev_node_ops+0x644>
804102ec:	b38f00ef          	jal	ra,80400624 <__panic>
804102f0:	00006697          	auipc	a3,0x6
804102f4:	91868693          	addi	a3,a3,-1768 # 80415c08 <sfs_node_fileops+0x40>
804102f8:	00003617          	auipc	a2,0x3
804102fc:	97460613          	addi	a2,a2,-1676 # 80412c6c <commands+0x1bc>
80410300:	35e00593          	li	a1,862
80410304:	00005517          	auipc	a0,0x5
80410308:	77050513          	addi	a0,a0,1904 # 80415a74 <dev_node_ops+0x644>
8041030c:	b18f00ef          	jal	ra,80400624 <__panic>
80410310:	00005697          	auipc	a3,0x5
80410314:	77c68693          	addi	a3,a3,1916 # 80415a8c <dev_node_ops+0x65c>
80410318:	00003617          	auipc	a2,0x3
8041031c:	95460613          	addi	a2,a2,-1708 # 80412c6c <commands+0x1bc>
80410320:	35900593          	li	a1,857
80410324:	00005517          	auipc	a0,0x5
80410328:	75050513          	addi	a0,a0,1872 # 80415a74 <dev_node_ops+0x644>
8041032c:	af8f00ef          	jal	ra,80400624 <__panic>
80410330:	00005697          	auipc	a3,0x5
80410334:	f3868693          	addi	a3,a3,-200 # 80415268 <syscalls+0x86c>
80410338:	00003617          	auipc	a2,0x3
8041033c:	93460613          	addi	a2,a2,-1740 # 80412c6c <commands+0x1bc>
80410340:	36300593          	li	a1,867
80410344:	00005517          	auipc	a0,0x5
80410348:	73050513          	addi	a0,a0,1840 # 80415a74 <dev_node_ops+0x644>
8041034c:	ad8f00ef          	jal	ra,80400624 <__panic>
80410350:	00004697          	auipc	a3,0x4
80410354:	ca868693          	addi	a3,a3,-856 # 80413ff8 <CSWTCH.69+0x12c>
80410358:	00003617          	auipc	a2,0x3
8041035c:	91460613          	addi	a2,a2,-1772 # 80412c6c <commands+0x1bc>
80410360:	36800593          	li	a1,872
80410364:	00005517          	auipc	a0,0x5
80410368:	71050513          	addi	a0,a0,1808 # 80415a74 <dev_node_ops+0x644>
8041036c:	ab8f00ef          	jal	ra,80400624 <__panic>

80410370 <sfs_bmap_load_nolock>:
80410370:	fc010113          	addi	sp,sp,-64
80410374:	03212823          	sw	s2,48(sp)
80410378:	0005a903          	lw	s2,0(a1)
8041037c:	03312623          	sw	s3,44(sp)
80410380:	02112e23          	sw	ra,60(sp)
80410384:	00892983          	lw	s3,8(s2)
80410388:	02812c23          	sw	s0,56(sp)
8041038c:	02912a23          	sw	s1,52(sp)
80410390:	03412423          	sw	s4,40(sp)
80410394:	03512223          	sw	s5,36(sp)
80410398:	03612023          	sw	s6,32(sp)
8041039c:	01712e23          	sw	s7,28(sp)
804103a0:	01812c23          	sw	s8,24(sp)
804103a4:	01912a23          	sw	s9,20(sp)
804103a8:	01a12823          	sw	s10,16(sp)
804103ac:	22c9e863          	bltu	s3,a2,804105dc <sfs_bmap_load_nolock+0x26c>
804103b0:	00b00793          	li	a5,11
804103b4:	00058b13          	mv	s6,a1
804103b8:	00060413          	mv	s0,a2
804103bc:	00050a13          	mv	s4,a0
804103c0:	00068c13          	mv	s8,a3
804103c4:	08c7fe63          	bgeu	a5,a2,80410460 <sfs_bmap_load_nolock+0xf0>
804103c8:	ff460713          	addi	a4,a2,-12
804103cc:	3ff00793          	li	a5,1023
804103d0:	22e7e663          	bltu	a5,a4,804105fc <sfs_bmap_load_nolock+0x28c>
804103d4:	03c92c83          	lw	s9,60(s2)
804103d8:	00012623          	sw	zero,12(sp)
804103dc:	00271b93          	slli	s7,a4,0x2
804103e0:	01912423          	sw	s9,8(sp)
804103e4:	180c9a63          	bnez	s9,80410578 <sfs_bmap_load_nolock+0x208>
804103e8:	0cc98263          	beq	s3,a2,804104ac <sfs_bmap_load_nolock+0x13c>
804103ec:	03050a93          	addi	s5,a0,48
804103f0:	00000493          	li	s1,0
804103f4:	004a2503          	lw	a0,4(s4)
804103f8:	00048613          	mv	a2,s1
804103fc:	000a8593          	mv	a1,s5
80410400:	bb1ff0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
80410404:	08050463          	beqz	a0,8041048c <sfs_bmap_load_nolock+0x11c>
80410408:	00899863          	bne	s3,s0,80410418 <sfs_bmap_load_nolock+0xa8>
8041040c:	00892783          	lw	a5,8(s2)
80410410:	00178793          	addi	a5,a5,1
80410414:	00f92423          	sw	a5,8(s2)
80410418:	00000a93          	li	s5,0
8041041c:	000c0463          	beqz	s8,80410424 <sfs_bmap_load_nolock+0xb4>
80410420:	009c2023          	sw	s1,0(s8)
80410424:	03c12083          	lw	ra,60(sp)
80410428:	03812403          	lw	s0,56(sp)
8041042c:	000a8513          	mv	a0,s5
80410430:	03412483          	lw	s1,52(sp)
80410434:	03012903          	lw	s2,48(sp)
80410438:	02c12983          	lw	s3,44(sp)
8041043c:	02812a03          	lw	s4,40(sp)
80410440:	02412a83          	lw	s5,36(sp)
80410444:	02012b03          	lw	s6,32(sp)
80410448:	01c12b83          	lw	s7,28(sp)
8041044c:	01812c03          	lw	s8,24(sp)
80410450:	01412c83          	lw	s9,20(sp)
80410454:	01012d03          	lw	s10,16(sp)
80410458:	04010113          	addi	sp,sp,64
8041045c:	00008067          	ret
80410460:	00261b93          	slli	s7,a2,0x2
80410464:	01790bb3          	add	s7,s2,s7
80410468:	00cba483          	lw	s1,12(s7)
8041046c:	00912223          	sw	s1,4(sp)
80410470:	10049063          	bnez	s1,80410570 <sfs_bmap_load_nolock+0x200>
80410474:	0cc98463          	beq	s3,a2,8041053c <sfs_bmap_load_nolock+0x1cc>
80410478:	00452503          	lw	a0,4(a0)
8041047c:	00000613          	li	a2,0
80410480:	030a0593          	addi	a1,s4,48
80410484:	b2dff0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
80410488:	f80518e3          	bnez	a0,80410418 <sfs_bmap_load_nolock+0xa8>
8041048c:	00005697          	auipc	a3,0x5
80410490:	58068693          	addi	a3,a3,1408 # 80415a0c <dev_node_ops+0x5dc>
80410494:	00002617          	auipc	a2,0x2
80410498:	7d860613          	addi	a2,a2,2008 # 80412c6c <commands+0x1bc>
8041049c:	16b00593          	li	a1,363
804104a0:	00005517          	auipc	a0,0x5
804104a4:	5d450513          	addi	a0,a0,1492 # 80415a74 <dev_node_ops+0x644>
804104a8:	97cf00ef          	jal	ra,80400624 <__panic>
804104ac:	00810593          	addi	a1,sp,8
804104b0:	b4dff0ef          	jal	ra,8040fffc <sfs_block_alloc>
804104b4:	00050a93          	mv	s5,a0
804104b8:	00c10d13          	addi	s10,sp,12
804104bc:	f60514e3          	bnez	a0,80410424 <sfs_bmap_load_nolock+0xb4>
804104c0:	000d0593          	mv	a1,s10
804104c4:	000a0513          	mv	a0,s4
804104c8:	b35ff0ef          	jal	ra,8040fffc <sfs_block_alloc>
804104cc:	00050a93          	mv	s5,a0
804104d0:	0e051c63          	bnez	a0,804105c8 <sfs_bmap_load_nolock+0x258>
804104d4:	00812683          	lw	a3,8(sp)
804104d8:	000b8713          	mv	a4,s7
804104dc:	00400613          	li	a2,4
804104e0:	000d0593          	mv	a1,s10
804104e4:	000a0513          	mv	a0,s4
804104e8:	05d010ef          	jal	ra,80411d44 <sfs_wbuf>
804104ec:	00050a93          	mv	s5,a0
804104f0:	0c051663          	bnez	a0,804105bc <sfs_bmap_load_nolock+0x24c>
804104f4:	00c12483          	lw	s1,12(sp)
804104f8:	03c92703          	lw	a4,60(s2)
804104fc:	00812783          	lw	a5,8(sp)
80410500:	00912223          	sw	s1,4(sp)
80410504:	00f70a63          	beq	a4,a5,80410518 <sfs_bmap_load_nolock+0x1a8>
80410508:	12071663          	bnez	a4,80410634 <sfs_bmap_load_nolock+0x2c4>
8041050c:	02f92e23          	sw	a5,60(s2)
80410510:	00100793          	li	a5,1
80410514:	00fb2423          	sw	a5,8(s6)
80410518:	030a0a93          	addi	s5,s4,48
8041051c:	ec048ce3          	beqz	s1,804103f4 <sfs_bmap_load_nolock+0x84>
80410520:	004a2503          	lw	a0,4(s4)
80410524:	00048613          	mv	a2,s1
80410528:	000a8593          	mv	a1,s5
8041052c:	a85ff0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
80410530:	0e050263          	beqz	a0,80410614 <sfs_bmap_load_nolock+0x2a4>
80410534:	00412483          	lw	s1,4(sp)
80410538:	ebdff06f          	j	804103f4 <sfs_bmap_load_nolock+0x84>
8041053c:	00410593          	addi	a1,sp,4
80410540:	abdff0ef          	jal	ra,8040fffc <sfs_block_alloc>
80410544:	00050a93          	mv	s5,a0
80410548:	ec051ee3          	bnez	a0,80410424 <sfs_bmap_load_nolock+0xb4>
8041054c:	00412483          	lw	s1,4(sp)
80410550:	00100793          	li	a5,1
80410554:	009ba623          	sw	s1,12(s7)
80410558:	00fb2423          	sw	a5,8(s6)
8041055c:	fbdff06f          	j	80410518 <sfs_bmap_load_nolock+0x1a8>
80410560:	03c92703          	lw	a4,60(s2)
80410564:	00812783          	lw	a5,8(sp)
80410568:	00912223          	sw	s1,4(sp)
8041056c:	f8e79ee3          	bne	a5,a4,80410508 <sfs_bmap_load_nolock+0x198>
80410570:	030a0a93          	addi	s5,s4,48
80410574:	fadff06f          	j	80410520 <sfs_bmap_load_nolock+0x1b0>
80410578:	00c10d13          	addi	s10,sp,12
8041057c:	000b8713          	mv	a4,s7
80410580:	000c8693          	mv	a3,s9
80410584:	00400613          	li	a2,4
80410588:	000d0593          	mv	a1,s10
8041058c:	6ec010ef          	jal	ra,80411c78 <sfs_rbuf>
80410590:	00050a93          	mv	s5,a0
80410594:	e80518e3          	bnez	a0,80410424 <sfs_bmap_load_nolock+0xb4>
80410598:	00c12483          	lw	s1,12(sp)
8041059c:	fc0492e3          	bnez	s1,80410560 <sfs_bmap_load_nolock+0x1f0>
804105a0:	f28980e3          	beq	s3,s0,804104c0 <sfs_bmap_load_nolock+0x150>
804105a4:	03c92703          	lw	a4,60(s2)
804105a8:	00812783          	lw	a5,8(sp)
804105ac:	00012223          	sw	zero,4(sp)
804105b0:	f4e79ce3          	bne	a5,a4,80410508 <sfs_bmap_load_nolock+0x198>
804105b4:	030a0a93          	addi	s5,s4,48
804105b8:	e3dff06f          	j	804103f4 <sfs_bmap_load_nolock+0x84>
804105bc:	00c12583          	lw	a1,12(sp)
804105c0:	000a0513          	mv	a0,s4
804105c4:	afdff0ef          	jal	ra,804100c0 <sfs_block_free>
804105c8:	00812583          	lw	a1,8(sp)
804105cc:	e4bc8ce3          	beq	s9,a1,80410424 <sfs_bmap_load_nolock+0xb4>
804105d0:	000a0513          	mv	a0,s4
804105d4:	aedff0ef          	jal	ra,804100c0 <sfs_block_free>
804105d8:	e4dff06f          	j	80410424 <sfs_bmap_load_nolock+0xb4>
804105dc:	00005697          	auipc	a3,0x5
804105e0:	3cc68693          	addi	a3,a3,972 # 804159a8 <dev_node_ops+0x578>
804105e4:	00002617          	auipc	a2,0x2
804105e8:	68860613          	addi	a2,a2,1672 # 80412c6c <commands+0x1bc>
804105ec:	16400593          	li	a1,356
804105f0:	00005517          	auipc	a0,0x5
804105f4:	48450513          	addi	a0,a0,1156 # 80415a74 <dev_node_ops+0x644>
804105f8:	82cf00ef          	jal	ra,80400624 <__panic>
804105fc:	00005617          	auipc	a2,0x5
80410600:	3d860613          	addi	a2,a2,984 # 804159d4 <dev_node_ops+0x5a4>
80410604:	11e00593          	li	a1,286
80410608:	00005517          	auipc	a0,0x5
8041060c:	46c50513          	addi	a0,a0,1132 # 80415a74 <dev_node_ops+0x644>
80410610:	814f00ef          	jal	ra,80400624 <__panic>
80410614:	00005697          	auipc	a3,0x5
80410618:	3ec68693          	addi	a3,a3,1004 # 80415a00 <dev_node_ops+0x5d0>
8041061c:	00002617          	auipc	a2,0x2
80410620:	65060613          	addi	a2,a2,1616 # 80412c6c <commands+0x1bc>
80410624:	12100593          	li	a1,289
80410628:	00005517          	auipc	a0,0x5
8041062c:	44c50513          	addi	a0,a0,1100 # 80415a74 <dev_node_ops+0x644>
80410630:	ff5ef0ef          	jal	ra,80400624 <__panic>
80410634:	00005697          	auipc	a3,0x5
80410638:	38c68693          	addi	a3,a3,908 # 804159c0 <dev_node_ops+0x590>
8041063c:	00002617          	auipc	a2,0x2
80410640:	63060613          	addi	a2,a2,1584 # 80412c6c <commands+0x1bc>
80410644:	11800593          	li	a1,280
80410648:	00005517          	auipc	a0,0x5
8041064c:	42c50513          	addi	a0,a0,1068 # 80415a74 <dev_node_ops+0x644>
80410650:	fd5ef0ef          	jal	ra,80400624 <__panic>

80410654 <sfs_io_nolock>:
80410654:	fa010113          	addi	sp,sp,-96
80410658:	03812c23          	sw	s8,56(sp)
8041065c:	00058c13          	mv	s8,a1
80410660:	0005a583          	lw	a1,0(a1)
80410664:	03912a23          	sw	s9,52(sp)
80410668:	00050c93          	mv	s9,a0
8041066c:	0045d503          	lhu	a0,4(a1)
80410670:	04112e23          	sw	ra,92(sp)
80410674:	04812c23          	sw	s0,88(sp)
80410678:	04912a23          	sw	s1,84(sp)
8041067c:	05212823          	sw	s2,80(sp)
80410680:	05312623          	sw	s3,76(sp)
80410684:	05412423          	sw	s4,72(sp)
80410688:	05512223          	sw	s5,68(sp)
8041068c:	05612023          	sw	s6,64(sp)
80410690:	03712e23          	sw	s7,60(sp)
80410694:	03a12823          	sw	s10,48(sp)
80410698:	03b12623          	sw	s11,44(sp)
8041069c:	00200813          	li	a6,2
804106a0:	27050863          	beq	a0,a6,80410910 <sfs_io_nolock+0x2bc>
804106a4:	00072403          	lw	s0,0(a4)
804106a8:	00070b93          	mv	s7,a4
804106ac:	000ba023          	sw	zero,0(s7)
804106b0:	08000737          	lui	a4,0x8000
804106b4:	00068493          	mv	s1,a3
804106b8:	00068d93          	mv	s11,a3
804106bc:	00868433          	add	s0,a3,s0
804106c0:	24e6f463          	bgeu	a3,a4,80410908 <sfs_io_nolock+0x2b4>
804106c4:	24d44263          	blt	s0,a3,80410908 <sfs_io_nolock+0x2b4>
804106c8:	00000513          	li	a0,0
804106cc:	0e868e63          	beq	a3,s0,804107c8 <sfs_io_nolock+0x174>
804106d0:	00060993          	mv	s3,a2
804106d4:	00877463          	bgeu	a4,s0,804106dc <sfs_io_nolock+0x88>
804106d8:	08000437          	lui	s0,0x8000
804106dc:	12078463          	beqz	a5,80410804 <sfs_io_nolock+0x1b0>
804106e0:	00001797          	auipc	a5,0x1
804106e4:	59078793          	addi	a5,a5,1424 # 80411c70 <sfs_wblock>
804106e8:	00f12623          	sw	a5,12(sp)
804106ec:	00001797          	auipc	a5,0x1
804106f0:	65878793          	addi	a5,a5,1624 # 80411d44 <sfs_wbuf>
804106f4:	00f12423          	sw	a5,8(sp)
804106f8:	41f4d913          	srai	s2,s1,0x1f
804106fc:	00001637          	lui	a2,0x1
80410700:	fff60713          	addi	a4,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
80410704:	01495693          	srli	a3,s2,0x14
80410708:	41f45a13          	srai	s4,s0,0x1f
8041070c:	00e97933          	and	s2,s2,a4
80410710:	00ea7ab3          	and	s5,s4,a4
80410714:	00d48d33          	add	s10,s1,a3
80410718:	00990933          	add	s2,s2,s1
8041071c:	008a8ab3          	add	s5,s5,s0
80410720:	00ed7d33          	and	s10,s10,a4
80410724:	40c95913          	srai	s2,s2,0xc
80410728:	40cada93          	srai	s5,s5,0xc
8041072c:	40dd0d33          	sub	s10,s10,a3
80410730:	412a8ab3          	sub	s5,s5,s2
80410734:	100d0063          	beqz	s10,80410834 <sfs_io_nolock+0x1e0>
80410738:	40940b33          	sub	s6,s0,s1
8041073c:	140a9463          	bnez	s5,80410884 <sfs_io_nolock+0x230>
80410740:	01c10693          	addi	a3,sp,28
80410744:	00090613          	mv	a2,s2
80410748:	000c0593          	mv	a1,s8
8041074c:	000c8513          	mv	a0,s9
80410750:	c21ff0ef          	jal	ra,80410370 <sfs_bmap_load_nolock>
80410754:	14051663          	bnez	a0,804108a0 <sfs_io_nolock+0x24c>
80410758:	01c12683          	lw	a3,28(sp)
8041075c:	00812783          	lw	a5,8(sp)
80410760:	000d0713          	mv	a4,s10
80410764:	000b0613          	mv	a2,s6
80410768:	00098593          	mv	a1,s3
8041076c:	000c8513          	mv	a0,s9
80410770:	000780e7          	jalr	a5
80410774:	12051663          	bnez	a0,804108a0 <sfs_io_nolock+0x24c>
80410778:	180a8463          	beqz	s5,80410900 <sfs_io_nolock+0x2ac>
8041077c:	fffa8a93          	addi	s5,s5,-1
80410780:	016989b3          	add	s3,s3,s6
80410784:	00190913          	addi	s2,s2,1
80410788:	0a0a9a63          	bnez	s5,8041083c <sfs_io_nolock+0x1e8>
8041078c:	014a5793          	srli	a5,s4,0x14
80410790:	00f40433          	add	s0,s0,a5
80410794:	01441413          	slli	s0,s0,0x14
80410798:	01445413          	srli	s0,s0,0x14
8041079c:	40f40433          	sub	s0,s0,a5
804107a0:	12041263          	bnez	s0,804108c4 <sfs_io_nolock+0x270>
804107a4:	01648db3          	add	s11,s1,s6
804107a8:	00000513          	li	a0,0
804107ac:	000c2783          	lw	a5,0(s8)
804107b0:	016ba023          	sw	s6,0(s7)
804107b4:	0007a703          	lw	a4,0(a5)
804107b8:	01b77863          	bgeu	a4,s11,804107c8 <sfs_io_nolock+0x174>
804107bc:	01b7a023          	sw	s11,0(a5)
804107c0:	00100793          	li	a5,1
804107c4:	00fc2423          	sw	a5,8(s8)
804107c8:	05c12083          	lw	ra,92(sp)
804107cc:	05812403          	lw	s0,88(sp)
804107d0:	05412483          	lw	s1,84(sp)
804107d4:	05012903          	lw	s2,80(sp)
804107d8:	04c12983          	lw	s3,76(sp)
804107dc:	04812a03          	lw	s4,72(sp)
804107e0:	04412a83          	lw	s5,68(sp)
804107e4:	04012b03          	lw	s6,64(sp)
804107e8:	03c12b83          	lw	s7,60(sp)
804107ec:	03812c03          	lw	s8,56(sp)
804107f0:	03412c83          	lw	s9,52(sp)
804107f4:	03012d03          	lw	s10,48(sp)
804107f8:	02c12d83          	lw	s11,44(sp)
804107fc:	06010113          	addi	sp,sp,96
80410800:	00008067          	ret
80410804:	0005a783          	lw	a5,0(a1)
80410808:	00000513          	li	a0,0
8041080c:	faf4fee3          	bgeu	s1,a5,804107c8 <sfs_io_nolock+0x174>
80410810:	0887fc63          	bgeu	a5,s0,804108a8 <sfs_io_nolock+0x254>
80410814:	00078413          	mv	s0,a5
80410818:	00001797          	auipc	a5,0x1
8041081c:	45078793          	addi	a5,a5,1104 # 80411c68 <sfs_rblock>
80410820:	00f12623          	sw	a5,12(sp)
80410824:	00001797          	auipc	a5,0x1
80410828:	45478793          	addi	a5,a5,1108 # 80411c78 <sfs_rbuf>
8041082c:	00f12423          	sw	a5,8(sp)
80410830:	ec9ff06f          	j	804106f8 <sfs_io_nolock+0xa4>
80410834:	00000b13          	li	s6,0
80410838:	f40a8ae3          	beqz	s5,8041078c <sfs_io_nolock+0x138>
8041083c:	01c10693          	addi	a3,sp,28
80410840:	00090613          	mv	a2,s2
80410844:	000c0593          	mv	a1,s8
80410848:	000c8513          	mv	a0,s9
8041084c:	b25ff0ef          	jal	ra,80410370 <sfs_bmap_load_nolock>
80410850:	0a051863          	bnez	a0,80410900 <sfs_io_nolock+0x2ac>
80410854:	01c12603          	lw	a2,28(sp)
80410858:	00c12783          	lw	a5,12(sp)
8041085c:	000a8693          	mv	a3,s5
80410860:	00098593          	mv	a1,s3
80410864:	000c8513          	mv	a0,s9
80410868:	000780e7          	jalr	a5
8041086c:	08051a63          	bnez	a0,80410900 <sfs_io_nolock+0x2ac>
80410870:	00ca9713          	slli	a4,s5,0xc
80410874:	00eb0b33          	add	s6,s6,a4
80410878:	00e989b3          	add	s3,s3,a4
8041087c:	01590933          	add	s2,s2,s5
80410880:	f0dff06f          	j	8041078c <sfs_io_nolock+0x138>
80410884:	41a60b33          	sub	s6,a2,s10
80410888:	01c10693          	addi	a3,sp,28
8041088c:	00090613          	mv	a2,s2
80410890:	000c0593          	mv	a1,s8
80410894:	000c8513          	mv	a0,s9
80410898:	ad9ff0ef          	jal	ra,80410370 <sfs_bmap_load_nolock>
8041089c:	ea050ee3          	beqz	a0,80410758 <sfs_io_nolock+0x104>
804108a0:	00000b13          	li	s6,0
804108a4:	f09ff06f          	j	804107ac <sfs_io_nolock+0x158>
804108a8:	00001797          	auipc	a5,0x1
804108ac:	3c078793          	addi	a5,a5,960 # 80411c68 <sfs_rblock>
804108b0:	00f12623          	sw	a5,12(sp)
804108b4:	00001797          	auipc	a5,0x1
804108b8:	3c478793          	addi	a5,a5,964 # 80411c78 <sfs_rbuf>
804108bc:	00f12423          	sw	a5,8(sp)
804108c0:	e39ff06f          	j	804106f8 <sfs_io_nolock+0xa4>
804108c4:	01c10693          	addi	a3,sp,28
804108c8:	00090613          	mv	a2,s2
804108cc:	000c0593          	mv	a1,s8
804108d0:	000c8513          	mv	a0,s9
804108d4:	a9dff0ef          	jal	ra,80410370 <sfs_bmap_load_nolock>
804108d8:	02051463          	bnez	a0,80410900 <sfs_io_nolock+0x2ac>
804108dc:	01c12683          	lw	a3,28(sp)
804108e0:	00812783          	lw	a5,8(sp)
804108e4:	00000713          	li	a4,0
804108e8:	00040613          	mv	a2,s0
804108ec:	00098593          	mv	a1,s3
804108f0:	000c8513          	mv	a0,s9
804108f4:	000780e7          	jalr	a5
804108f8:	00051463          	bnez	a0,80410900 <sfs_io_nolock+0x2ac>
804108fc:	008b0b33          	add	s6,s6,s0
80410900:	01648db3          	add	s11,s1,s6
80410904:	ea9ff06f          	j	804107ac <sfs_io_nolock+0x158>
80410908:	ffd00513          	li	a0,-3
8041090c:	ebdff06f          	j	804107c8 <sfs_io_nolock+0x174>
80410910:	00005697          	auipc	a3,0x5
80410914:	1cc68693          	addi	a3,a3,460 # 80415adc <dev_node_ops+0x6ac>
80410918:	00002617          	auipc	a2,0x2
8041091c:	35460613          	addi	a2,a2,852 # 80412c6c <commands+0x1bc>
80410920:	22b00593          	li	a1,555
80410924:	00005517          	auipc	a0,0x5
80410928:	15050513          	addi	a0,a0,336 # 80415a74 <dev_node_ops+0x644>
8041092c:	cf9ef0ef          	jal	ra,80400624 <__panic>

80410930 <sfs_dirent_read_nolock>:
80410930:	0005a783          	lw	a5,0(a1)
80410934:	fe010113          	addi	sp,sp,-32
80410938:	00112e23          	sw	ra,28(sp)
8041093c:	0047d803          	lhu	a6,4(a5)
80410940:	00812c23          	sw	s0,24(sp)
80410944:	00912a23          	sw	s1,20(sp)
80410948:	00200713          	li	a4,2
8041094c:	06e81e63          	bne	a6,a4,804109c8 <sfs_dirent_read_nolock+0x98>
80410950:	0087a783          	lw	a5,8(a5)
80410954:	06f67a63          	bgeu	a2,a5,804109c8 <sfs_dirent_read_nolock+0x98>
80410958:	00068493          	mv	s1,a3
8041095c:	00c10693          	addi	a3,sp,12
80410960:	00050413          	mv	s0,a0
80410964:	a0dff0ef          	jal	ra,80410370 <sfs_bmap_load_nolock>
80410968:	00050c63          	beqz	a0,80410980 <sfs_dirent_read_nolock+0x50>
8041096c:	01c12083          	lw	ra,28(sp)
80410970:	01812403          	lw	s0,24(sp)
80410974:	01412483          	lw	s1,20(sp)
80410978:	02010113          	addi	sp,sp,32
8041097c:	00008067          	ret
80410980:	00c12603          	lw	a2,12(sp)
80410984:	00442503          	lw	a0,4(s0) # 8000004 <_binary_bin_sfs_img_size+0x7f88004>
80410988:	03040593          	addi	a1,s0,48
8041098c:	e24ff0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
80410990:	04050c63          	beqz	a0,804109e8 <sfs_dirent_read_nolock+0xb8>
80410994:	00c12683          	lw	a3,12(sp)
80410998:	00000713          	li	a4,0
8041099c:	10400613          	li	a2,260
804109a0:	00048593          	mv	a1,s1
804109a4:	00040513          	mv	a0,s0
804109a8:	2d0010ef          	jal	ra,80411c78 <sfs_rbuf>
804109ac:	fc0510e3          	bnez	a0,8041096c <sfs_dirent_read_nolock+0x3c>
804109b0:	100481a3          	sb	zero,259(s1)
804109b4:	01c12083          	lw	ra,28(sp)
804109b8:	01812403          	lw	s0,24(sp)
804109bc:	01412483          	lw	s1,20(sp)
804109c0:	02010113          	addi	sp,sp,32
804109c4:	00008067          	ret
804109c8:	00005697          	auipc	a3,0x5
804109cc:	06068693          	addi	a3,a3,96 # 80415a28 <dev_node_ops+0x5f8>
804109d0:	00002617          	auipc	a2,0x2
804109d4:	29c60613          	addi	a2,a2,668 # 80412c6c <commands+0x1bc>
804109d8:	18e00593          	li	a1,398
804109dc:	00005517          	auipc	a0,0x5
804109e0:	09850513          	addi	a0,a0,152 # 80415a74 <dev_node_ops+0x644>
804109e4:	c41ef0ef          	jal	ra,80400624 <__panic>
804109e8:	00005697          	auipc	a3,0x5
804109ec:	02468693          	addi	a3,a3,36 # 80415a0c <dev_node_ops+0x5dc>
804109f0:	00002617          	auipc	a2,0x2
804109f4:	27c60613          	addi	a2,a2,636 # 80412c6c <commands+0x1bc>
804109f8:	19500593          	li	a1,405
804109fc:	00005517          	auipc	a0,0x5
80410a00:	07850513          	addi	a0,a0,120 # 80415a74 <dev_node_ops+0x644>
80410a04:	c21ef0ef          	jal	ra,80400624 <__panic>

80410a08 <sfs_getdirentry>:
80410a08:	fd010113          	addi	sp,sp,-48
80410a0c:	02912223          	sw	s1,36(sp)
80410a10:	00050493          	mv	s1,a0
80410a14:	10400513          	li	a0,260
80410a18:	01812423          	sw	s8,8(sp)
80410a1c:	02112623          	sw	ra,44(sp)
80410a20:	02812423          	sw	s0,40(sp)
80410a24:	03212023          	sw	s2,32(sp)
80410a28:	01312e23          	sw	s3,28(sp)
80410a2c:	01412c23          	sw	s4,24(sp)
80410a30:	01512a23          	sw	s5,20(sp)
80410a34:	01612823          	sw	s6,16(sp)
80410a38:	01712623          	sw	s7,12(sp)
80410a3c:	00058c13          	mv	s8,a1
80410a40:	e51f10ef          	jal	ra,80402890 <kmalloc>
80410a44:	12050a63          	beqz	a0,80410b78 <sfs_getdirentry+0x170>
80410a48:	0384aa83          	lw	s5,56(s1)
80410a4c:	120a8a63          	beqz	s5,80410b80 <sfs_getdirentry+0x178>
80410a50:	06caa783          	lw	a5,108(s5)
80410a54:	12079663          	bnez	a5,80410b80 <sfs_getdirentry+0x178>
80410a58:	02c4a703          	lw	a4,44(s1)
80410a5c:	000017b7          	lui	a5,0x1
80410a60:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410a64:	12f71e63          	bne	a4,a5,80410ba0 <sfs_getdirentry+0x198>
80410a68:	004c2403          	lw	s0,4(s8)
80410a6c:	00050913          	mv	s2,a0
80410a70:	0e044663          	bltz	s0,80410b5c <sfs_getdirentry+0x154>
80410a74:	0ff47793          	andi	a5,s0,255
80410a78:	0e079263          	bnez	a5,80410b5c <sfs_getdirentry+0x154>
80410a7c:	0004a783          	lw	a5,0(s1)
80410a80:	00845413          	srli	s0,s0,0x8
80410a84:	0087a783          	lw	a5,8(a5)
80410a88:	0e87e263          	bltu	a5,s0,80410b6c <sfs_getdirentry+0x164>
80410a8c:	01048b93          	addi	s7,s1,16
80410a90:	000b8513          	mv	a0,s7
80410a94:	df8f40ef          	jal	ra,8040508c <down>
80410a98:	0004a783          	lw	a5,0(s1)
80410a9c:	0087ab03          	lw	s6,8(a5)
80410aa0:	0b605663          	blez	s6,80410b4c <sfs_getdirentry+0x144>
80410aa4:	00000993          	li	s3,0
80410aa8:	01c0006f          	j	80410ac4 <sfs_getdirentry+0xbc>
80410aac:	00092783          	lw	a5,0(s2)
80410ab0:	00078663          	beqz	a5,80410abc <sfs_getdirentry+0xb4>
80410ab4:	02040c63          	beqz	s0,80410aec <sfs_getdirentry+0xe4>
80410ab8:	fff40413          	addi	s0,s0,-1
80410abc:	00198993          	addi	s3,s3,1
80410ac0:	093b0663          	beq	s6,s3,80410b4c <sfs_getdirentry+0x144>
80410ac4:	00090693          	mv	a3,s2
80410ac8:	00098613          	mv	a2,s3
80410acc:	00048593          	mv	a1,s1
80410ad0:	000a8513          	mv	a0,s5
80410ad4:	e5dff0ef          	jal	ra,80410930 <sfs_dirent_read_nolock>
80410ad8:	00050a13          	mv	s4,a0
80410adc:	fc0508e3          	beqz	a0,80410aac <sfs_getdirentry+0xa4>
80410ae0:	000b8513          	mv	a0,s7
80410ae4:	da4f40ef          	jal	ra,80405088 <up>
80410ae8:	0280006f          	j	80410b10 <sfs_getdirentry+0x108>
80410aec:	000b8513          	mv	a0,s7
80410af0:	d98f40ef          	jal	ra,80405088 <up>
80410af4:	00000713          	li	a4,0
80410af8:	00100693          	li	a3,1
80410afc:	10000613          	li	a2,256
80410b00:	00490593          	addi	a1,s2,4
80410b04:	000c0513          	mv	a0,s8
80410b08:	9edf50ef          	jal	ra,804064f4 <iobuf_move>
80410b0c:	00050a13          	mv	s4,a0
80410b10:	00090513          	mv	a0,s2
80410b14:	ea1f10ef          	jal	ra,804029b4 <kfree>
80410b18:	02c12083          	lw	ra,44(sp)
80410b1c:	02812403          	lw	s0,40(sp)
80410b20:	000a0513          	mv	a0,s4
80410b24:	02412483          	lw	s1,36(sp)
80410b28:	02012903          	lw	s2,32(sp)
80410b2c:	01c12983          	lw	s3,28(sp)
80410b30:	01812a03          	lw	s4,24(sp)
80410b34:	01412a83          	lw	s5,20(sp)
80410b38:	01012b03          	lw	s6,16(sp)
80410b3c:	00c12b83          	lw	s7,12(sp)
80410b40:	00812c03          	lw	s8,8(sp)
80410b44:	03010113          	addi	sp,sp,48
80410b48:	00008067          	ret
80410b4c:	000b8513          	mv	a0,s7
80410b50:	ff000a13          	li	s4,-16
80410b54:	d34f40ef          	jal	ra,80405088 <up>
80410b58:	fb9ff06f          	j	80410b10 <sfs_getdirentry+0x108>
80410b5c:	00090513          	mv	a0,s2
80410b60:	e55f10ef          	jal	ra,804029b4 <kfree>
80410b64:	ffd00a13          	li	s4,-3
80410b68:	fb1ff06f          	j	80410b18 <sfs_getdirentry+0x110>
80410b6c:	e49f10ef          	jal	ra,804029b4 <kfree>
80410b70:	ff000a13          	li	s4,-16
80410b74:	fa5ff06f          	j	80410b18 <sfs_getdirentry+0x110>
80410b78:	ffc00a13          	li	s4,-4
80410b7c:	f9dff06f          	j	80410b18 <sfs_getdirentry+0x110>
80410b80:	00005697          	auipc	a3,0x5
80410b84:	d5868693          	addi	a3,a3,-680 # 804158d8 <dev_node_ops+0x4a8>
80410b88:	00002617          	auipc	a2,0x2
80410b8c:	0e460613          	addi	a2,a2,228 # 80412c6c <commands+0x1bc>
80410b90:	33a00593          	li	a1,826
80410b94:	00005517          	auipc	a0,0x5
80410b98:	ee050513          	addi	a0,a0,-288 # 80415a74 <dev_node_ops+0x644>
80410b9c:	a89ef0ef          	jal	ra,80400624 <__panic>
80410ba0:	00005697          	auipc	a3,0x5
80410ba4:	eec68693          	addi	a3,a3,-276 # 80415a8c <dev_node_ops+0x65c>
80410ba8:	00002617          	auipc	a2,0x2
80410bac:	0c460613          	addi	a2,a2,196 # 80412c6c <commands+0x1bc>
80410bb0:	33b00593          	li	a1,827
80410bb4:	00005517          	auipc	a0,0x5
80410bb8:	ec050513          	addi	a0,a0,-320 # 80415a74 <dev_node_ops+0x644>
80410bbc:	a69ef0ef          	jal	ra,80400624 <__panic>

80410bc0 <sfs_truncfile>:
80410bc0:	fa010113          	addi	sp,sp,-96
80410bc4:	04112e23          	sw	ra,92(sp)
80410bc8:	04812c23          	sw	s0,88(sp)
80410bcc:	04912a23          	sw	s1,84(sp)
80410bd0:	05212823          	sw	s2,80(sp)
80410bd4:	05312623          	sw	s3,76(sp)
80410bd8:	05412423          	sw	s4,72(sp)
80410bdc:	05512223          	sw	s5,68(sp)
80410be0:	05612023          	sw	s6,64(sp)
80410be4:	03712e23          	sw	s7,60(sp)
80410be8:	03812c23          	sw	s8,56(sp)
80410bec:	03912a23          	sw	s9,52(sp)
80410bf0:	03a12823          	sw	s10,48(sp)
80410bf4:	03b12623          	sw	s11,44(sp)
80410bf8:	080007b7          	lui	a5,0x8000
80410bfc:	1eb7ec63          	bltu	a5,a1,80410df4 <sfs_truncfile+0x234>
80410c00:	03852d03          	lw	s10,56(a0)
80410c04:	00050913          	mv	s2,a0
80410c08:	00058a13          	mv	s4,a1
80410c0c:	1e0d0863          	beqz	s10,80410dfc <sfs_truncfile+0x23c>
80410c10:	06cd2783          	lw	a5,108(s10)
80410c14:	1e079463          	bnez	a5,80410dfc <sfs_truncfile+0x23c>
80410c18:	02c52703          	lw	a4,44(a0)
80410c1c:	000014b7          	lui	s1,0x1
80410c20:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410c24:	20f71c63          	bne	a4,a5,80410e3c <sfs_truncfile+0x27c>
80410c28:	00052a83          	lw	s5,0(a0)
80410c2c:	fff48493          	addi	s1,s1,-1
80410c30:	009584b3          	add	s1,a1,s1
80410c34:	000aa783          	lw	a5,0(s5)
80410c38:	00c4d493          	srli	s1,s1,0xc
80410c3c:	04f59863          	bne	a1,a5,80410c8c <sfs_truncfile+0xcc>
80410c40:	008aa783          	lw	a5,8(s5)
80410c44:	00000c93          	li	s9,0
80410c48:	20f49a63          	bne	s1,a5,80410e5c <sfs_truncfile+0x29c>
80410c4c:	05c12083          	lw	ra,92(sp)
80410c50:	05812403          	lw	s0,88(sp)
80410c54:	000c8513          	mv	a0,s9
80410c58:	05412483          	lw	s1,84(sp)
80410c5c:	05012903          	lw	s2,80(sp)
80410c60:	04c12983          	lw	s3,76(sp)
80410c64:	04812a03          	lw	s4,72(sp)
80410c68:	04412a83          	lw	s5,68(sp)
80410c6c:	04012b03          	lw	s6,64(sp)
80410c70:	03c12b83          	lw	s7,60(sp)
80410c74:	03812c03          	lw	s8,56(sp)
80410c78:	03412c83          	lw	s9,52(sp)
80410c7c:	03012d03          	lw	s10,48(sp)
80410c80:	02c12d83          	lw	s11,44(sp)
80410c84:	06010113          	addi	sp,sp,96
80410c88:	00008067          	ret
80410c8c:	01050b13          	addi	s6,a0,16
80410c90:	000b0513          	mv	a0,s6
80410c94:	bf8f40ef          	jal	ra,8040508c <down>
80410c98:	008aa403          	lw	s0,8(s5)
80410c9c:	0e946063          	bltu	s0,s1,80410d7c <sfs_truncfile+0x1bc>
80410ca0:	1084f263          	bgeu	s1,s0,80410da4 <sfs_truncfile+0x1e4>
80410ca4:	00092d83          	lw	s11,0(s2)
80410ca8:	008da783          	lw	a5,8(s11) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80410cac:	16078863          	beqz	a5,80410e1c <sfs_truncfile+0x25c>
80410cb0:	030d0713          	addi	a4,s10,48
80410cb4:	00b00b93          	li	s7,11
80410cb8:	00e12623          	sw	a4,12(sp)
80410cbc:	00100c13          	li	s8,1
80410cc0:	0900006f          	j	80410d50 <sfs_truncfile+0x190>
80410cc4:	ff378993          	addi	s3,a5,-13 # 7fffff3 <_binary_bin_sfs_img_size+0x7f87ff3>
80410cc8:	3ff00793          	li	a5,1023
80410ccc:	0737e063          	bltu	a5,s3,80410d2c <sfs_truncfile+0x16c>
80410cd0:	03cda783          	lw	a5,60(s11)
80410cd4:	04078c63          	beqz	a5,80410d2c <sfs_truncfile+0x16c>
80410cd8:	004d2503          	lw	a0,4(s10)
80410cdc:	00c12583          	lw	a1,12(sp)
80410ce0:	00078613          	mv	a2,a5
80410ce4:	00f12423          	sw	a5,8(sp)
80410ce8:	ac8ff0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
80410cec:	00812783          	lw	a5,8(sp)
80410cf0:	18050663          	beqz	a0,80410e7c <sfs_truncfile+0x2bc>
80410cf4:	00299993          	slli	s3,s3,0x2
80410cf8:	00098713          	mv	a4,s3
80410cfc:	00078693          	mv	a3,a5
80410d00:	00400613          	li	a2,4
80410d04:	01810593          	addi	a1,sp,24
80410d08:	000d0513          	mv	a0,s10
80410d0c:	00f12423          	sw	a5,8(sp)
80410d10:	00012e23          	sw	zero,28(sp)
80410d14:	765000ef          	jal	ra,80411c78 <sfs_rbuf>
80410d18:	00050c93          	mv	s9,a0
80410d1c:	08051e63          	bnez	a0,80410db8 <sfs_truncfile+0x1f8>
80410d20:	01812703          	lw	a4,24(sp)
80410d24:	00812783          	lw	a5,8(sp)
80410d28:	08071e63          	bnez	a4,80410dc4 <sfs_truncfile+0x204>
80410d2c:	008da783          	lw	a5,8(s11)
80410d30:	fff40413          	addi	s0,s0,-1
80410d34:	fff78793          	addi	a5,a5,-1
80410d38:	00fda423          	sw	a5,8(s11)
80410d3c:	01892423          	sw	s8,8(s2)
80410d40:	06848063          	beq	s1,s0,80410da0 <sfs_truncfile+0x1e0>
80410d44:	00092d83          	lw	s11,0(s2)
80410d48:	008da783          	lw	a5,8(s11)
80410d4c:	0c078863          	beqz	a5,80410e1c <sfs_truncfile+0x25c>
80410d50:	fff78713          	addi	a4,a5,-1
80410d54:	f6ebe8e3          	bltu	s7,a4,80410cc4 <sfs_truncfile+0x104>
80410d58:	00279793          	slli	a5,a5,0x2
80410d5c:	00fd89b3          	add	s3,s11,a5
80410d60:	0089a583          	lw	a1,8(s3)
80410d64:	fc0584e3          	beqz	a1,80410d2c <sfs_truncfile+0x16c>
80410d68:	000d0513          	mv	a0,s10
80410d6c:	b54ff0ef          	jal	ra,804100c0 <sfs_block_free>
80410d70:	0009a423          	sw	zero,8(s3)
80410d74:	01892423          	sw	s8,8(s2)
80410d78:	fb5ff06f          	j	80410d2c <sfs_truncfile+0x16c>
80410d7c:	00000693          	li	a3,0
80410d80:	00040613          	mv	a2,s0
80410d84:	00090593          	mv	a1,s2
80410d88:	000d0513          	mv	a0,s10
80410d8c:	de4ff0ef          	jal	ra,80410370 <sfs_bmap_load_nolock>
80410d90:	00050c93          	mv	s9,a0
80410d94:	02051263          	bnez	a0,80410db8 <sfs_truncfile+0x1f8>
80410d98:	00140413          	addi	s0,s0,1
80410d9c:	fe8490e3          	bne	s1,s0,80410d7c <sfs_truncfile+0x1bc>
80410da0:	008aa403          	lw	s0,8(s5)
80410da4:	0e849c63          	bne	s1,s0,80410e9c <sfs_truncfile+0x2dc>
80410da8:	014aa023          	sw	s4,0(s5)
80410dac:	00100793          	li	a5,1
80410db0:	00f92423          	sw	a5,8(s2)
80410db4:	00000c93          	li	s9,0
80410db8:	000b0513          	mv	a0,s6
80410dbc:	accf40ef          	jal	ra,80405088 <up>
80410dc0:	e8dff06f          	j	80410c4c <sfs_truncfile+0x8c>
80410dc4:	00098713          	mv	a4,s3
80410dc8:	00078693          	mv	a3,a5
80410dcc:	00400613          	li	a2,4
80410dd0:	01c10593          	addi	a1,sp,28
80410dd4:	000d0513          	mv	a0,s10
80410dd8:	76d000ef          	jal	ra,80411d44 <sfs_wbuf>
80410ddc:	00050c93          	mv	s9,a0
80410de0:	fc051ce3          	bnez	a0,80410db8 <sfs_truncfile+0x1f8>
80410de4:	01812583          	lw	a1,24(sp)
80410de8:	000d0513          	mv	a0,s10
80410dec:	ad4ff0ef          	jal	ra,804100c0 <sfs_block_free>
80410df0:	f3dff06f          	j	80410d2c <sfs_truncfile+0x16c>
80410df4:	ffd00c93          	li	s9,-3
80410df8:	e55ff06f          	j	80410c4c <sfs_truncfile+0x8c>
80410dfc:	00005697          	auipc	a3,0x5
80410e00:	adc68693          	addi	a3,a3,-1316 # 804158d8 <dev_node_ops+0x4a8>
80410e04:	00002617          	auipc	a2,0x2
80410e08:	e6860613          	addi	a2,a2,-408 # 80412c6c <commands+0x1bc>
80410e0c:	3a900593          	li	a1,937
80410e10:	00005517          	auipc	a0,0x5
80410e14:	c6450513          	addi	a0,a0,-924 # 80415a74 <dev_node_ops+0x644>
80410e18:	80def0ef          	jal	ra,80400624 <__panic>
80410e1c:	00005697          	auipc	a3,0x5
80410e20:	e1c68693          	addi	a3,a3,-484 # 80415c38 <sfs_node_fileops+0x70>
80410e24:	00002617          	auipc	a2,0x2
80410e28:	e4860613          	addi	a2,a2,-440 # 80412c6c <commands+0x1bc>
80410e2c:	17b00593          	li	a1,379
80410e30:	00005517          	auipc	a0,0x5
80410e34:	c4450513          	addi	a0,a0,-956 # 80415a74 <dev_node_ops+0x644>
80410e38:	fecef0ef          	jal	ra,80400624 <__panic>
80410e3c:	00005697          	auipc	a3,0x5
80410e40:	c5068693          	addi	a3,a3,-944 # 80415a8c <dev_node_ops+0x65c>
80410e44:	00002617          	auipc	a2,0x2
80410e48:	e2860613          	addi	a2,a2,-472 # 80412c6c <commands+0x1bc>
80410e4c:	3aa00593          	li	a1,938
80410e50:	00005517          	auipc	a0,0x5
80410e54:	c2450513          	addi	a0,a0,-988 # 80415a74 <dev_node_ops+0x644>
80410e58:	fccef0ef          	jal	ra,80400624 <__panic>
80410e5c:	00005697          	auipc	a3,0x5
80410e60:	dc468693          	addi	a3,a3,-572 # 80415c20 <sfs_node_fileops+0x58>
80410e64:	00002617          	auipc	a2,0x2
80410e68:	e0860613          	addi	a2,a2,-504 # 80412c6c <commands+0x1bc>
80410e6c:	3b100593          	li	a1,945
80410e70:	00005517          	auipc	a0,0x5
80410e74:	c0450513          	addi	a0,a0,-1020 # 80415a74 <dev_node_ops+0x644>
80410e78:	facef0ef          	jal	ra,80400624 <__panic>
80410e7c:	00005697          	auipc	a3,0x5
80410e80:	dd068693          	addi	a3,a3,-560 # 80415c4c <sfs_node_fileops+0x84>
80410e84:	00002617          	auipc	a2,0x2
80410e88:	de860613          	addi	a2,a2,-536 # 80412c6c <commands+0x1bc>
80410e8c:	12b00593          	li	a1,299
80410e90:	00005517          	auipc	a0,0x5
80410e94:	be450513          	addi	a0,a0,-1052 # 80415a74 <dev_node_ops+0x644>
80410e98:	f8cef0ef          	jal	ra,80400624 <__panic>
80410e9c:	00005697          	auipc	a3,0x5
80410ea0:	de468693          	addi	a3,a3,-540 # 80415c80 <sfs_node_fileops+0xb8>
80410ea4:	00002617          	auipc	a2,0x2
80410ea8:	dc860613          	addi	a2,a2,-568 # 80412c6c <commands+0x1bc>
80410eac:	3ca00593          	li	a1,970
80410eb0:	00005517          	auipc	a0,0x5
80410eb4:	bc450513          	addi	a0,a0,-1084 # 80415a74 <dev_node_ops+0x644>
80410eb8:	f6cef0ef          	jal	ra,80400624 <__panic>

80410ebc <sfs_tryseek>:
80410ebc:	080007b7          	lui	a5,0x8000
80410ec0:	08f5fa63          	bgeu	a1,a5,80410f54 <sfs_tryseek+0x98>
80410ec4:	ff010113          	addi	sp,sp,-16
80410ec8:	00812423          	sw	s0,8(sp)
80410ecc:	00912223          	sw	s1,4(sp)
80410ed0:	00112623          	sw	ra,12(sp)
80410ed4:	00050413          	mv	s0,a0
80410ed8:	00058493          	mv	s1,a1
80410edc:	08050063          	beqz	a0,80410f5c <sfs_tryseek+0xa0>
80410ee0:	02c52703          	lw	a4,44(a0)
80410ee4:	000017b7          	lui	a5,0x1
80410ee8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410eec:	06f71863          	bne	a4,a5,80410f5c <sfs_tryseek+0xa0>
80410ef0:	00052783          	lw	a5,0(a0)
80410ef4:	0007a783          	lw	a5,0(a5)
80410ef8:	04b7f263          	bgeu	a5,a1,80410f3c <sfs_tryseek+0x80>
80410efc:	03c52783          	lw	a5,60(a0)
80410f00:	06078e63          	beqz	a5,80410f7c <sfs_tryseek+0xc0>
80410f04:	0307a783          	lw	a5,48(a5)
80410f08:	06078a63          	beqz	a5,80410f7c <sfs_tryseek+0xc0>
80410f0c:	00004597          	auipc	a1,0x4
80410f10:	3b058593          	addi	a1,a1,944 # 804152bc <syscalls+0x8c0>
80410f14:	d60fc0ef          	jal	ra,8040d474 <inode_check>
80410f18:	03c42783          	lw	a5,60(s0)
80410f1c:	00040513          	mv	a0,s0
80410f20:	00812403          	lw	s0,8(sp)
80410f24:	00c12083          	lw	ra,12(sp)
80410f28:	00048593          	mv	a1,s1
80410f2c:	0307a303          	lw	t1,48(a5)
80410f30:	00412483          	lw	s1,4(sp)
80410f34:	01010113          	addi	sp,sp,16
80410f38:	00030067          	jr	t1
80410f3c:	00c12083          	lw	ra,12(sp)
80410f40:	00812403          	lw	s0,8(sp)
80410f44:	00412483          	lw	s1,4(sp)
80410f48:	00000513          	li	a0,0
80410f4c:	01010113          	addi	sp,sp,16
80410f50:	00008067          	ret
80410f54:	ffd00513          	li	a0,-3
80410f58:	00008067          	ret
80410f5c:	00005697          	auipc	a3,0x5
80410f60:	b3068693          	addi	a3,a3,-1232 # 80415a8c <dev_node_ops+0x65c>
80410f64:	00002617          	auipc	a2,0x2
80410f68:	d0860613          	addi	a2,a2,-760 # 80412c6c <commands+0x1bc>
80410f6c:	39a00593          	li	a1,922
80410f70:	00005517          	auipc	a0,0x5
80410f74:	b0450513          	addi	a0,a0,-1276 # 80415a74 <dev_node_ops+0x644>
80410f78:	eacef0ef          	jal	ra,80400624 <__panic>
80410f7c:	00004697          	auipc	a3,0x4
80410f80:	2ec68693          	addi	a3,a3,748 # 80415268 <syscalls+0x86c>
80410f84:	00002617          	auipc	a2,0x2
80410f88:	ce860613          	addi	a2,a2,-792 # 80412c6c <commands+0x1bc>
80410f8c:	39c00593          	li	a1,924
80410f90:	00005517          	auipc	a0,0x5
80410f94:	ae450513          	addi	a0,a0,-1308 # 80415a74 <dev_node_ops+0x644>
80410f98:	e8cef0ef          	jal	ra,80400624 <__panic>

80410f9c <sfs_close>:
80410f9c:	ff010113          	addi	sp,sp,-16
80410fa0:	00112623          	sw	ra,12(sp)
80410fa4:	00812423          	sw	s0,8(sp)
80410fa8:	04050063          	beqz	a0,80410fe8 <sfs_close+0x4c>
80410fac:	03c52783          	lw	a5,60(a0)
80410fb0:	00050413          	mv	s0,a0
80410fb4:	02078a63          	beqz	a5,80410fe8 <sfs_close+0x4c>
80410fb8:	0187a783          	lw	a5,24(a5)
80410fbc:	02078663          	beqz	a5,80410fe8 <sfs_close+0x4c>
80410fc0:	00003597          	auipc	a1,0x3
80410fc4:	08858593          	addi	a1,a1,136 # 80414048 <CSWTCH.69+0x17c>
80410fc8:	cacfc0ef          	jal	ra,8040d474 <inode_check>
80410fcc:	03c42783          	lw	a5,60(s0)
80410fd0:	00040513          	mv	a0,s0
80410fd4:	00812403          	lw	s0,8(sp)
80410fd8:	00c12083          	lw	ra,12(sp)
80410fdc:	0187a303          	lw	t1,24(a5)
80410fe0:	01010113          	addi	sp,sp,16
80410fe4:	00030067          	jr	t1
80410fe8:	00003697          	auipc	a3,0x3
80410fec:	01068693          	addi	a3,a3,16 # 80413ff8 <CSWTCH.69+0x12c>
80410ff0:	00002617          	auipc	a2,0x2
80410ff4:	c7c60613          	addi	a2,a2,-900 # 80412c6c <commands+0x1bc>
80410ff8:	21c00593          	li	a1,540
80410ffc:	00005517          	auipc	a0,0x5
80411000:	a7850513          	addi	a0,a0,-1416 # 80415a74 <dev_node_ops+0x644>
80411004:	e20ef0ef          	jal	ra,80400624 <__panic>

80411008 <sfs_fstat>:
80411008:	ff010113          	addi	sp,sp,-16
8041100c:	00912223          	sw	s1,4(sp)
80411010:	00058493          	mv	s1,a1
80411014:	00812423          	sw	s0,8(sp)
80411018:	01000613          	li	a2,16
8041101c:	00050413          	mv	s0,a0
80411020:	00000593          	li	a1,0
80411024:	00048513          	mv	a0,s1
80411028:	00112623          	sw	ra,12(sp)
8041102c:	011010ef          	jal	ra,8041283c <memset>
80411030:	06040e63          	beqz	s0,804110ac <sfs_fstat+0xa4>
80411034:	03c42783          	lw	a5,60(s0)
80411038:	06078a63          	beqz	a5,804110ac <sfs_fstat+0xa4>
8041103c:	0287a783          	lw	a5,40(a5)
80411040:	06078663          	beqz	a5,804110ac <sfs_fstat+0xa4>
80411044:	00004597          	auipc	a1,0x4
80411048:	3d058593          	addi	a1,a1,976 # 80415414 <syscalls+0xa18>
8041104c:	00040513          	mv	a0,s0
80411050:	c24fc0ef          	jal	ra,8040d474 <inode_check>
80411054:	03c42783          	lw	a5,60(s0)
80411058:	00048593          	mv	a1,s1
8041105c:	00040513          	mv	a0,s0
80411060:	0287a783          	lw	a5,40(a5)
80411064:	000780e7          	jalr	a5
80411068:	02051863          	bnez	a0,80411098 <sfs_fstat+0x90>
8041106c:	02c42703          	lw	a4,44(s0)
80411070:	000017b7          	lui	a5,0x1
80411074:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411078:	04f71a63          	bne	a4,a5,804110cc <sfs_fstat+0xc4>
8041107c:	00042783          	lw	a5,0(s0)
80411080:	0067d683          	lhu	a3,6(a5)
80411084:	0087a703          	lw	a4,8(a5)
80411088:	0007a783          	lw	a5,0(a5)
8041108c:	00d4a223          	sw	a3,4(s1)
80411090:	00e4a423          	sw	a4,8(s1)
80411094:	00f4a623          	sw	a5,12(s1)
80411098:	00c12083          	lw	ra,12(sp)
8041109c:	00812403          	lw	s0,8(sp)
804110a0:	00412483          	lw	s1,4(sp)
804110a4:	01010113          	addi	sp,sp,16
804110a8:	00008067          	ret
804110ac:	00004697          	auipc	a3,0x4
804110b0:	30068693          	addi	a3,a3,768 # 804153ac <syscalls+0x9b0>
804110b4:	00002617          	auipc	a2,0x2
804110b8:	bb860613          	addi	a2,a2,-1096 # 80412c6c <commands+0x1bc>
804110bc:	2b800593          	li	a1,696
804110c0:	00005517          	auipc	a0,0x5
804110c4:	9b450513          	addi	a0,a0,-1612 # 80415a74 <dev_node_ops+0x644>
804110c8:	d5cef0ef          	jal	ra,80400624 <__panic>
804110cc:	00005697          	auipc	a3,0x5
804110d0:	9c068693          	addi	a3,a3,-1600 # 80415a8c <dev_node_ops+0x65c>
804110d4:	00002617          	auipc	a2,0x2
804110d8:	b9860613          	addi	a2,a2,-1128 # 80412c6c <commands+0x1bc>
804110dc:	2bb00593          	li	a1,699
804110e0:	00005517          	auipc	a0,0x5
804110e4:	99450513          	addi	a0,a0,-1644 # 80415a74 <dev_node_ops+0x644>
804110e8:	d3cef0ef          	jal	ra,80400624 <__panic>

804110ec <sfs_io.part.12>:
804110ec:	ff010113          	addi	sp,sp,-16
804110f0:	00005697          	auipc	a3,0x5
804110f4:	99c68693          	addi	a3,a3,-1636 # 80415a8c <dev_node_ops+0x65c>
804110f8:	00002617          	auipc	a2,0x2
804110fc:	b7460613          	addi	a2,a2,-1164 # 80412c6c <commands+0x1bc>
80411100:	29700593          	li	a1,663
80411104:	00005517          	auipc	a0,0x5
80411108:	97050513          	addi	a0,a0,-1680 # 80415a74 <dev_node_ops+0x644>
8041110c:	00112623          	sw	ra,12(sp)
80411110:	d14ef0ef          	jal	ra,80400624 <__panic>

80411114 <sfs_read>:
80411114:	fd010113          	addi	sp,sp,-48
80411118:	03212023          	sw	s2,32(sp)
8041111c:	03852903          	lw	s2,56(a0)
80411120:	02112623          	sw	ra,44(sp)
80411124:	02812423          	sw	s0,40(sp)
80411128:	02912223          	sw	s1,36(sp)
8041112c:	01312e23          	sw	s3,28(sp)
80411130:	08090a63          	beqz	s2,804111c4 <sfs_read+0xb0>
80411134:	06c92783          	lw	a5,108(s2)
80411138:	08079663          	bnez	a5,804111c4 <sfs_read+0xb0>
8041113c:	02c52703          	lw	a4,44(a0)
80411140:	000017b7          	lui	a5,0x1
80411144:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411148:	00050413          	mv	s0,a0
8041114c:	08f71c63          	bne	a4,a5,804111e4 <sfs_read+0xd0>
80411150:	01050993          	addi	s3,a0,16
80411154:	00098513          	mv	a0,s3
80411158:	00058493          	mv	s1,a1
8041115c:	f31f30ef          	jal	ra,8040508c <down>
80411160:	00c4a803          	lw	a6,12(s1)
80411164:	0044a683          	lw	a3,4(s1)
80411168:	0004a603          	lw	a2,0(s1)
8041116c:	00040593          	mv	a1,s0
80411170:	00000793          	li	a5,0
80411174:	00c10713          	addi	a4,sp,12
80411178:	00090513          	mv	a0,s2
8041117c:	01012623          	sw	a6,12(sp)
80411180:	cd4ff0ef          	jal	ra,80410654 <sfs_io_nolock>
80411184:	00c12583          	lw	a1,12(sp)
80411188:	00050413          	mv	s0,a0
8041118c:	02059663          	bnez	a1,804111b8 <sfs_read+0xa4>
80411190:	00098513          	mv	a0,s3
80411194:	ef5f30ef          	jal	ra,80405088 <up>
80411198:	00040513          	mv	a0,s0
8041119c:	02c12083          	lw	ra,44(sp)
804111a0:	02812403          	lw	s0,40(sp)
804111a4:	02412483          	lw	s1,36(sp)
804111a8:	02012903          	lw	s2,32(sp)
804111ac:	01c12983          	lw	s3,28(sp)
804111b0:	03010113          	addi	sp,sp,48
804111b4:	00008067          	ret
804111b8:	00048513          	mv	a0,s1
804111bc:	bf4f50ef          	jal	ra,804065b0 <iobuf_skip>
804111c0:	fd1ff06f          	j	80411190 <sfs_read+0x7c>
804111c4:	00004697          	auipc	a3,0x4
804111c8:	71468693          	addi	a3,a3,1812 # 804158d8 <dev_node_ops+0x4a8>
804111cc:	00002617          	auipc	a2,0x2
804111d0:	aa060613          	addi	a2,a2,-1376 # 80412c6c <commands+0x1bc>
804111d4:	29600593          	li	a1,662
804111d8:	00005517          	auipc	a0,0x5
804111dc:	89c50513          	addi	a0,a0,-1892 # 80415a74 <dev_node_ops+0x644>
804111e0:	c44ef0ef          	jal	ra,80400624 <__panic>
804111e4:	f09ff0ef          	jal	ra,804110ec <sfs_io.part.12>

804111e8 <sfs_write>:
804111e8:	fd010113          	addi	sp,sp,-48
804111ec:	03212023          	sw	s2,32(sp)
804111f0:	03852903          	lw	s2,56(a0)
804111f4:	02112623          	sw	ra,44(sp)
804111f8:	02812423          	sw	s0,40(sp)
804111fc:	02912223          	sw	s1,36(sp)
80411200:	01312e23          	sw	s3,28(sp)
80411204:	08090a63          	beqz	s2,80411298 <sfs_write+0xb0>
80411208:	06c92783          	lw	a5,108(s2)
8041120c:	08079663          	bnez	a5,80411298 <sfs_write+0xb0>
80411210:	02c52703          	lw	a4,44(a0)
80411214:	000017b7          	lui	a5,0x1
80411218:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8041121c:	00050413          	mv	s0,a0
80411220:	08f71c63          	bne	a4,a5,804112b8 <sfs_write+0xd0>
80411224:	01050993          	addi	s3,a0,16
80411228:	00098513          	mv	a0,s3
8041122c:	00058493          	mv	s1,a1
80411230:	e5df30ef          	jal	ra,8040508c <down>
80411234:	00c4a803          	lw	a6,12(s1)
80411238:	0044a683          	lw	a3,4(s1)
8041123c:	0004a603          	lw	a2,0(s1)
80411240:	00040593          	mv	a1,s0
80411244:	00100793          	li	a5,1
80411248:	00c10713          	addi	a4,sp,12
8041124c:	00090513          	mv	a0,s2
80411250:	01012623          	sw	a6,12(sp)
80411254:	c00ff0ef          	jal	ra,80410654 <sfs_io_nolock>
80411258:	00c12583          	lw	a1,12(sp)
8041125c:	00050413          	mv	s0,a0
80411260:	02059663          	bnez	a1,8041128c <sfs_write+0xa4>
80411264:	00098513          	mv	a0,s3
80411268:	e21f30ef          	jal	ra,80405088 <up>
8041126c:	00040513          	mv	a0,s0
80411270:	02c12083          	lw	ra,44(sp)
80411274:	02812403          	lw	s0,40(sp)
80411278:	02412483          	lw	s1,36(sp)
8041127c:	02012903          	lw	s2,32(sp)
80411280:	01c12983          	lw	s3,28(sp)
80411284:	03010113          	addi	sp,sp,48
80411288:	00008067          	ret
8041128c:	00048513          	mv	a0,s1
80411290:	b20f50ef          	jal	ra,804065b0 <iobuf_skip>
80411294:	fd1ff06f          	j	80411264 <sfs_write+0x7c>
80411298:	00004697          	auipc	a3,0x4
8041129c:	64068693          	addi	a3,a3,1600 # 804158d8 <dev_node_ops+0x4a8>
804112a0:	00002617          	auipc	a2,0x2
804112a4:	9cc60613          	addi	a2,a2,-1588 # 80412c6c <commands+0x1bc>
804112a8:	29600593          	li	a1,662
804112ac:	00004517          	auipc	a0,0x4
804112b0:	7c850513          	addi	a0,a0,1992 # 80415a74 <dev_node_ops+0x644>
804112b4:	b70ef0ef          	jal	ra,80400624 <__panic>
804112b8:	e35ff0ef          	jal	ra,804110ec <sfs_io.part.12>

804112bc <sfs_load_inode>:
804112bc:	fe010113          	addi	sp,sp,-32
804112c0:	00112e23          	sw	ra,28(sp)
804112c4:	00812c23          	sw	s0,24(sp)
804112c8:	01212823          	sw	s2,16(sp)
804112cc:	01312623          	sw	s3,12(sp)
804112d0:	00050913          	mv	s2,a0
804112d4:	00060993          	mv	s3,a2
804112d8:	01412423          	sw	s4,8(sp)
804112dc:	00912a23          	sw	s1,20(sp)
804112e0:	00058a13          	mv	s4,a1
804112e4:	01512223          	sw	s5,4(sp)
804112e8:	4f5000ef          	jal	ra,80411fdc <lock_sfs_fs>
804112ec:	00a00593          	li	a1,10
804112f0:	06892403          	lw	s0,104(s2)
804112f4:	00098513          	mv	a0,s3
804112f8:	505000ef          	jal	ra,80411ffc <hash32>
804112fc:	00351513          	slli	a0,a0,0x3
80411300:	00a40533          	add	a0,s0,a0
80411304:	00050413          	mv	s0,a0
80411308:	00c0006f          	j	80411314 <sfs_load_inode+0x58>
8041130c:	fe042783          	lw	a5,-32(s0)
80411310:	10f98a63          	beq	s3,a5,80411424 <sfs_load_inode+0x168>
80411314:	00442403          	lw	s0,4(s0)
80411318:	fe851ae3          	bne	a0,s0,8041130c <sfs_load_inode+0x50>
8041131c:	04000513          	li	a0,64
80411320:	d70f10ef          	jal	ra,80402890 <kmalloc>
80411324:	00050a93          	mv	s5,a0
80411328:	14050e63          	beqz	a0,80411484 <sfs_load_inode+0x1c8>
8041132c:	00492503          	lw	a0,4(s2)
80411330:	00098613          	mv	a2,s3
80411334:	03090593          	addi	a1,s2,48
80411338:	c79fe0ef          	jal	ra,8040ffb0 <sfs_block_inuse.isra.3>
8041133c:	1e050863          	beqz	a0,8041152c <sfs_load_inode+0x270>
80411340:	00000713          	li	a4,0
80411344:	00098693          	mv	a3,s3
80411348:	04000613          	li	a2,64
8041134c:	000a8593          	mv	a1,s5
80411350:	00090513          	mv	a0,s2
80411354:	125000ef          	jal	ra,80411c78 <sfs_rbuf>
80411358:	00050413          	mv	s0,a0
8041135c:	12051e63          	bnez	a0,80411498 <sfs_load_inode+0x1dc>
80411360:	006ad783          	lhu	a5,6(s5)
80411364:	1a078463          	beqz	a5,8041150c <sfs_load_inode+0x250>
80411368:	00001537          	lui	a0,0x1
8041136c:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411370:	830fc0ef          	jal	ra,8040d3a0 <__alloc_inode>
80411374:	00050493          	mv	s1,a0
80411378:	10050e63          	beqz	a0,80411494 <sfs_load_inode+0x1d8>
8041137c:	004ad683          	lhu	a3,4(s5)
80411380:	00100793          	li	a5,1
80411384:	12f69063          	bne	a3,a5,804114a4 <sfs_load_inode+0x1e8>
80411388:	00005597          	auipc	a1,0x5
8041138c:	84058593          	addi	a1,a1,-1984 # 80415bc8 <sfs_node_fileops>
80411390:	00090613          	mv	a2,s2
80411394:	00048513          	mv	a0,s1
80411398:	838fc0ef          	jal	ra,8040d3d0 <inode_init>
8041139c:	02c4a403          	lw	s0,44(s1)
804113a0:	000017b7          	lui	a5,0x1
804113a4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804113a8:	14f41263          	bne	s0,a5,804114ec <sfs_load_inode+0x230>
804113ac:	00100793          	li	a5,1
804113b0:	00f4a623          	sw	a5,12(s1)
804113b4:	0154a023          	sw	s5,0(s1)
804113b8:	0134a223          	sw	s3,4(s1)
804113bc:	0004a423          	sw	zero,8(s1)
804113c0:	00100593          	li	a1,1
804113c4:	01048513          	addi	a0,s1,16
804113c8:	cb5f30ef          	jal	ra,8040507c <sem_init>
804113cc:	02c4a783          	lw	a5,44(s1)
804113d0:	0e879e63          	bne	a5,s0,804114cc <sfs_load_inode+0x210>
804113d4:	06492683          	lw	a3,100(s2)
804113d8:	01c48793          	addi	a5,s1,28
804113dc:	06090713          	addi	a4,s2,96
804113e0:	00f6a023          	sw	a5,0(a3)
804113e4:	06f92223          	sw	a5,100(s2)
804113e8:	0044a503          	lw	a0,4(s1)
804113ec:	00e4ae23          	sw	a4,28(s1)
804113f0:	02d4a023          	sw	a3,32(s1)
804113f4:	06892403          	lw	s0,104(s2)
804113f8:	00a00593          	li	a1,10
804113fc:	401000ef          	jal	ra,80411ffc <hash32>
80411400:	00351513          	slli	a0,a0,0x3
80411404:	00a40533          	add	a0,s0,a0
80411408:	00452783          	lw	a5,4(a0)
8041140c:	02448713          	addi	a4,s1,36
80411410:	00e7a023          	sw	a4,0(a5)
80411414:	00e52223          	sw	a4,4(a0)
80411418:	02f4a423          	sw	a5,40(s1)
8041141c:	02a4a223          	sw	a0,36(s1)
80411420:	01c0006f          	j	8041143c <sfs_load_inode+0x180>
80411424:	fdc40493          	addi	s1,s0,-36
80411428:	00048513          	mv	a0,s1
8041142c:	820fc0ef          	jal	ra,8040d44c <inode_ref_inc>
80411430:	00100793          	li	a5,1
80411434:	04f50063          	beq	a0,a5,80411474 <sfs_load_inode+0x1b8>
80411438:	ee0482e3          	beqz	s1,8041131c <sfs_load_inode+0x60>
8041143c:	00090513          	mv	a0,s2
80411440:	3ad000ef          	jal	ra,80411fec <unlock_sfs_fs>
80411444:	00000413          	li	s0,0
80411448:	009a2023          	sw	s1,0(s4)
8041144c:	00040513          	mv	a0,s0
80411450:	01c12083          	lw	ra,28(sp)
80411454:	01812403          	lw	s0,24(sp)
80411458:	01412483          	lw	s1,20(sp)
8041145c:	01012903          	lw	s2,16(sp)
80411460:	00c12983          	lw	s3,12(sp)
80411464:	00812a03          	lw	s4,8(sp)
80411468:	00412a83          	lw	s5,4(sp)
8041146c:	02010113          	addi	sp,sp,32
80411470:	00008067          	ret
80411474:	fe842783          	lw	a5,-24(s0)
80411478:	00178793          	addi	a5,a5,1
8041147c:	fef42423          	sw	a5,-24(s0)
80411480:	fb9ff06f          	j	80411438 <sfs_load_inode+0x17c>
80411484:	ffc00413          	li	s0,-4
80411488:	00090513          	mv	a0,s2
8041148c:	361000ef          	jal	ra,80411fec <unlock_sfs_fs>
80411490:	fbdff06f          	j	8041144c <sfs_load_inode+0x190>
80411494:	ffc00413          	li	s0,-4
80411498:	000a8513          	mv	a0,s5
8041149c:	d18f10ef          	jal	ra,804029b4 <kfree>
804114a0:	fe9ff06f          	j	80411488 <sfs_load_inode+0x1cc>
804114a4:	00200793          	li	a5,2
804114a8:	00004597          	auipc	a1,0x4
804114ac:	6e058593          	addi	a1,a1,1760 # 80415b88 <sfs_node_dirops>
804114b0:	eef680e3          	beq	a3,a5,80411390 <sfs_load_inode+0xd4>
804114b4:	00004617          	auipc	a2,0x4
804114b8:	61060613          	addi	a2,a2,1552 # 80415ac4 <dev_node_ops+0x694>
804114bc:	02e00593          	li	a1,46
804114c0:	00004517          	auipc	a0,0x4
804114c4:	5b450513          	addi	a0,a0,1460 # 80415a74 <dev_node_ops+0x644>
804114c8:	95cef0ef          	jal	ra,80400624 <__panic>
804114cc:	00004697          	auipc	a3,0x4
804114d0:	5c068693          	addi	a3,a3,1472 # 80415a8c <dev_node_ops+0x65c>
804114d4:	00001617          	auipc	a2,0x1
804114d8:	79860613          	addi	a2,a2,1944 # 80412c6c <commands+0x1bc>
804114dc:	0b100593          	li	a1,177
804114e0:	00004517          	auipc	a0,0x4
804114e4:	59450513          	addi	a0,a0,1428 # 80415a74 <dev_node_ops+0x644>
804114e8:	93cef0ef          	jal	ra,80400624 <__panic>
804114ec:	00004697          	auipc	a3,0x4
804114f0:	5a068693          	addi	a3,a3,1440 # 80415a8c <dev_node_ops+0x65c>
804114f4:	00001617          	auipc	a2,0x1
804114f8:	77860613          	addi	a2,a2,1912 # 80412c6c <commands+0x1bc>
804114fc:	07700593          	li	a1,119
80411500:	00004517          	auipc	a0,0x4
80411504:	57450513          	addi	a0,a0,1396 # 80415a74 <dev_node_ops+0x644>
80411508:	91cef0ef          	jal	ra,80400624 <__panic>
8041150c:	00004697          	auipc	a3,0x4
80411510:	5ec68693          	addi	a3,a3,1516 # 80415af8 <dev_node_ops+0x6c8>
80411514:	00001617          	auipc	a2,0x1
80411518:	75860613          	addi	a2,a2,1880 # 80412c6c <commands+0x1bc>
8041151c:	0ad00593          	li	a1,173
80411520:	00004517          	auipc	a0,0x4
80411524:	55450513          	addi	a0,a0,1364 # 80415a74 <dev_node_ops+0x644>
80411528:	8fcef0ef          	jal	ra,80400624 <__panic>
8041152c:	00004697          	auipc	a3,0x4
80411530:	4e068693          	addi	a3,a3,1248 # 80415a0c <dev_node_ops+0x5dc>
80411534:	00001617          	auipc	a2,0x1
80411538:	73860613          	addi	a2,a2,1848 # 80412c6c <commands+0x1bc>
8041153c:	0a800593          	li	a1,168
80411540:	00004517          	auipc	a0,0x4
80411544:	53450513          	addi	a0,a0,1332 # 80415a74 <dev_node_ops+0x644>
80411548:	8dcef0ef          	jal	ra,80400624 <__panic>

8041154c <sfs_lookup_once.constprop.13>:
8041154c:	fd010113          	addi	sp,sp,-48
80411550:	01312e23          	sw	s3,28(sp)
80411554:	01058993          	addi	s3,a1,16
80411558:	01712623          	sw	s7,12(sp)
8041155c:	00050b93          	mv	s7,a0
80411560:	00098513          	mv	a0,s3
80411564:	02112623          	sw	ra,44(sp)
80411568:	03212023          	sw	s2,32(sp)
8041156c:	01512a23          	sw	s5,20(sp)
80411570:	01812423          	sw	s8,8(sp)
80411574:	00060a93          	mv	s5,a2
80411578:	00058913          	mv	s2,a1
8041157c:	00068c13          	mv	s8,a3
80411580:	02812423          	sw	s0,40(sp)
80411584:	02912223          	sw	s1,36(sp)
80411588:	01412c23          	sw	s4,24(sp)
8041158c:	01612823          	sw	s6,16(sp)
80411590:	01912223          	sw	s9,4(sp)
80411594:	af9f30ef          	jal	ra,8040508c <down>
80411598:	000a8513          	mv	a0,s5
8041159c:	1bc010ef          	jal	ra,80412758 <strlen>
804115a0:	0ff00793          	li	a5,255
804115a4:	10a7ee63          	bltu	a5,a0,804116c0 <sfs_lookup_once.constprop.13+0x174>
804115a8:	10400513          	li	a0,260
804115ac:	ae4f10ef          	jal	ra,80402890 <kmalloc>
804115b0:	00050413          	mv	s0,a0
804115b4:	0e050e63          	beqz	a0,804116b0 <sfs_lookup_once.constprop.13+0x164>
804115b8:	00092783          	lw	a5,0(s2)
804115bc:	0087ab03          	lw	s6,8(a5)
804115c0:	09605a63          	blez	s6,80411654 <sfs_lookup_once.constprop.13+0x108>
804115c4:	00000493          	li	s1,0
804115c8:	00450c93          	addi	s9,a0,4
804115cc:	0240006f          	j	804115f0 <sfs_lookup_once.constprop.13+0xa4>
804115d0:	00042783          	lw	a5,0(s0)
804115d4:	00078a63          	beqz	a5,804115e8 <sfs_lookup_once.constprop.13+0x9c>
804115d8:	000c8593          	mv	a1,s9
804115dc:	000a8513          	mv	a0,s5
804115e0:	200010ef          	jal	ra,804127e0 <strcmp>
804115e4:	06050c63          	beqz	a0,8041165c <sfs_lookup_once.constprop.13+0x110>
804115e8:	00148493          	addi	s1,s1,1
804115ec:	069b0463          	beq	s6,s1,80411654 <sfs_lookup_once.constprop.13+0x108>
804115f0:	00040693          	mv	a3,s0
804115f4:	00048613          	mv	a2,s1
804115f8:	00090593          	mv	a1,s2
804115fc:	000b8513          	mv	a0,s7
80411600:	b30ff0ef          	jal	ra,80410930 <sfs_dirent_read_nolock>
80411604:	00050a13          	mv	s4,a0
80411608:	fc0504e3          	beqz	a0,804115d0 <sfs_lookup_once.constprop.13+0x84>
8041160c:	00040513          	mv	a0,s0
80411610:	ba4f10ef          	jal	ra,804029b4 <kfree>
80411614:	00098513          	mv	a0,s3
80411618:	a71f30ef          	jal	ra,80405088 <up>
8041161c:	02c12083          	lw	ra,44(sp)
80411620:	02812403          	lw	s0,40(sp)
80411624:	000a0513          	mv	a0,s4
80411628:	02412483          	lw	s1,36(sp)
8041162c:	02012903          	lw	s2,32(sp)
80411630:	01c12983          	lw	s3,28(sp)
80411634:	01812a03          	lw	s4,24(sp)
80411638:	01412a83          	lw	s5,20(sp)
8041163c:	01012b03          	lw	s6,16(sp)
80411640:	00c12b83          	lw	s7,12(sp)
80411644:	00812c03          	lw	s8,8(sp)
80411648:	00412c83          	lw	s9,4(sp)
8041164c:	03010113          	addi	sp,sp,48
80411650:	00008067          	ret
80411654:	ff000a13          	li	s4,-16
80411658:	fb5ff06f          	j	8041160c <sfs_lookup_once.constprop.13+0xc0>
8041165c:	00040513          	mv	a0,s0
80411660:	00042483          	lw	s1,0(s0)
80411664:	b50f10ef          	jal	ra,804029b4 <kfree>
80411668:	00098513          	mv	a0,s3
8041166c:	a1df30ef          	jal	ra,80405088 <up>
80411670:	02812403          	lw	s0,40(sp)
80411674:	02c12083          	lw	ra,44(sp)
80411678:	02012903          	lw	s2,32(sp)
8041167c:	01c12983          	lw	s3,28(sp)
80411680:	01812a03          	lw	s4,24(sp)
80411684:	01412a83          	lw	s5,20(sp)
80411688:	01012b03          	lw	s6,16(sp)
8041168c:	00412c83          	lw	s9,4(sp)
80411690:	00048613          	mv	a2,s1
80411694:	000c0593          	mv	a1,s8
80411698:	02412483          	lw	s1,36(sp)
8041169c:	00812c03          	lw	s8,8(sp)
804116a0:	000b8513          	mv	a0,s7
804116a4:	00c12b83          	lw	s7,12(sp)
804116a8:	03010113          	addi	sp,sp,48
804116ac:	c11ff06f          	j	804112bc <sfs_load_inode>
804116b0:	00098513          	mv	a0,s3
804116b4:	9d5f30ef          	jal	ra,80405088 <up>
804116b8:	ffc00a13          	li	s4,-4
804116bc:	f61ff06f          	j	8041161c <sfs_lookup_once.constprop.13+0xd0>
804116c0:	00004697          	auipc	a3,0x4
804116c4:	46c68693          	addi	a3,a3,1132 # 80415b2c <dev_node_ops+0x6fc>
804116c8:	00001617          	auipc	a2,0x1
804116cc:	5a460613          	addi	a2,a2,1444 # 80412c6c <commands+0x1bc>
804116d0:	1ba00593          	li	a1,442
804116d4:	00004517          	auipc	a0,0x4
804116d8:	3a050513          	addi	a0,a0,928 # 80415a74 <dev_node_ops+0x644>
804116dc:	f49ee0ef          	jal	ra,80400624 <__panic>

804116e0 <sfs_namefile>:
804116e0:	00c5a703          	lw	a4,12(a1)
804116e4:	fa010113          	addi	sp,sp,-96
804116e8:	04112e23          	sw	ra,92(sp)
804116ec:	04812c23          	sw	s0,88(sp)
804116f0:	04912a23          	sw	s1,84(sp)
804116f4:	05212823          	sw	s2,80(sp)
804116f8:	05312623          	sw	s3,76(sp)
804116fc:	05412423          	sw	s4,72(sp)
80411700:	05512223          	sw	s5,68(sp)
80411704:	05612023          	sw	s6,64(sp)
80411708:	03712e23          	sw	s7,60(sp)
8041170c:	03812c23          	sw	s8,56(sp)
80411710:	03912a23          	sw	s9,52(sp)
80411714:	03a12823          	sw	s10,48(sp)
80411718:	03b12623          	sw	s11,44(sp)
8041171c:	00b12623          	sw	a1,12(sp)
80411720:	00200793          	li	a5,2
80411724:	24e7f063          	bgeu	a5,a4,80411964 <sfs_namefile+0x284>
80411728:	00050493          	mv	s1,a0
8041172c:	10400513          	li	a0,260
80411730:	960f10ef          	jal	ra,80402890 <kmalloc>
80411734:	00050a93          	mv	s5,a0
80411738:	22050663          	beqz	a0,80411964 <sfs_namefile+0x284>
8041173c:	0384ab03          	lw	s6,56(s1)
80411740:	260b0663          	beqz	s6,804119ac <sfs_namefile+0x2cc>
80411744:	06cb2783          	lw	a5,108(s6)
80411748:	26079263          	bnez	a5,804119ac <sfs_namefile+0x2cc>
8041174c:	02c4ac03          	lw	s8,44(s1)
80411750:	000017b7          	lui	a5,0x1
80411754:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411758:	26fc1a63          	bne	s8,a5,804119cc <sfs_namefile+0x2ec>
8041175c:	00c12703          	lw	a4,12(sp)
80411760:	00048513          	mv	a0,s1
80411764:	00048413          	mv	s0,s1
80411768:	00c72783          	lw	a5,12(a4) # 800000c <_binary_bin_sfs_img_size+0x7f8800c>
8041176c:	00072903          	lw	s2,0(a4)
80411770:	00004c97          	auipc	s9,0x4
80411774:	3e0c8c93          	addi	s9,s9,992 # 80415b50 <dev_node_ops+0x720>
80411778:	ffe78a13          	addi	s4,a5,-2
8041177c:	00f90933          	add	s2,s2,a5
80411780:	ccdfb0ef          	jal	ra,8040d44c <inode_ref_inc>
80411784:	01c10693          	addi	a3,sp,28
80411788:	000c8613          	mv	a2,s9
8041178c:	00040593          	mv	a1,s0
80411790:	000b0513          	mv	a0,s6
80411794:	01812423          	sw	s8,8(sp)
80411798:	db5ff0ef          	jal	ra,8041154c <sfs_lookup_once.constprop.13>
8041179c:	004a8b93          	addi	s7,s5,4
804117a0:	00050d93          	mv	s11,a0
804117a4:	0e051863          	bnez	a0,80411894 <sfs_namefile+0x1b4>
804117a8:	00048513          	mv	a0,s1
804117ac:	00442983          	lw	s3,4(s0)
804117b0:	d91fb0ef          	jal	ra,8040d540 <inode_ref_dec>
804117b4:	01c12d03          	lw	s10,28(sp)
804117b8:	149d0663          	beq	s10,s1,80411904 <sfs_namefile+0x224>
804117bc:	1c0d0863          	beqz	s10,8041198c <sfs_namefile+0x2ac>
804117c0:	02cd2683          	lw	a3,44(s10)
804117c4:	00812783          	lw	a5,8(sp)
804117c8:	1cf69263          	bne	a3,a5,8041198c <sfs_namefile+0x2ac>
804117cc:	004d2683          	lw	a3,4(s10)
804117d0:	000d0413          	mv	s0,s10
804117d4:	19368c63          	beq	a3,s3,8041196c <sfs_namefile+0x28c>
804117d8:	000d2683          	lw	a3,0(s10)
804117dc:	00200793          	li	a5,2
804117e0:	0046d683          	lhu	a3,4(a3)
804117e4:	18f69463          	bne	a3,a5,8041196c <sfs_namefile+0x28c>
804117e8:	010d0493          	addi	s1,s10,16
804117ec:	00048513          	mv	a0,s1
804117f0:	89df30ef          	jal	ra,8040508c <down>
804117f4:	000d2683          	lw	a3,0(s10)
804117f8:	0086ac03          	lw	s8,8(a3)
804117fc:	01804c63          	bgtz	s8,80411814 <sfs_namefile+0x134>
80411800:	0e40006f          	j	804118e4 <sfs_namefile+0x204>
80411804:	000aa683          	lw	a3,0(s5)
80411808:	02d98663          	beq	s3,a3,80411834 <sfs_namefile+0x154>
8041180c:	001d8d93          	addi	s11,s11,1
80411810:	0dbc0a63          	beq	s8,s11,804118e4 <sfs_namefile+0x204>
80411814:	000a8693          	mv	a3,s5
80411818:	000d8613          	mv	a2,s11
8041181c:	000d0593          	mv	a1,s10
80411820:	000b0513          	mv	a0,s6
80411824:	90cff0ef          	jal	ra,80410930 <sfs_dirent_read_nolock>
80411828:	00050693          	mv	a3,a0
8041182c:	fc050ce3          	beqz	a0,80411804 <sfs_namefile+0x124>
80411830:	0b80006f          	j	804118e8 <sfs_namefile+0x208>
80411834:	00048513          	mv	a0,s1
80411838:	851f30ef          	jal	ra,80405088 <up>
8041183c:	000b8513          	mv	a0,s7
80411840:	719000ef          	jal	ra,80412758 <strlen>
80411844:	00150713          	addi	a4,a0,1
80411848:	10ea6863          	bltu	s4,a4,80411958 <sfs_namefile+0x278>
8041184c:	fff54993          	not	s3,a0
80411850:	013909b3          	add	s3,s2,s3
80411854:	00050613          	mv	a2,a0
80411858:	000b8593          	mv	a1,s7
8041185c:	00098513          	mv	a0,s3
80411860:	40ea0a33          	sub	s4,s4,a4
80411864:	048010ef          	jal	ra,804128ac <memcpy>
80411868:	02f00793          	li	a5,47
8041186c:	fef90fa3          	sb	a5,-1(s2)
80411870:	01c10693          	addi	a3,sp,28
80411874:	000c8613          	mv	a2,s9
80411878:	00040593          	mv	a1,s0
8041187c:	000b0513          	mv	a0,s6
80411880:	ccdff0ef          	jal	ra,8041154c <sfs_lookup_once.constprop.13>
80411884:	000d0493          	mv	s1,s10
80411888:	00098913          	mv	s2,s3
8041188c:	00050d93          	mv	s11,a0
80411890:	f0050ce3          	beqz	a0,804117a8 <sfs_namefile+0xc8>
80411894:	00048513          	mv	a0,s1
80411898:	ca9fb0ef          	jal	ra,8040d540 <inode_ref_dec>
8041189c:	000a8513          	mv	a0,s5
804118a0:	914f10ef          	jal	ra,804029b4 <kfree>
804118a4:	05c12083          	lw	ra,92(sp)
804118a8:	05812403          	lw	s0,88(sp)
804118ac:	000d8513          	mv	a0,s11
804118b0:	05412483          	lw	s1,84(sp)
804118b4:	05012903          	lw	s2,80(sp)
804118b8:	04c12983          	lw	s3,76(sp)
804118bc:	04812a03          	lw	s4,72(sp)
804118c0:	04412a83          	lw	s5,68(sp)
804118c4:	04012b03          	lw	s6,64(sp)
804118c8:	03c12b83          	lw	s7,60(sp)
804118cc:	03812c03          	lw	s8,56(sp)
804118d0:	03412c83          	lw	s9,52(sp)
804118d4:	03012d03          	lw	s10,48(sp)
804118d8:	02c12d83          	lw	s11,44(sp)
804118dc:	06010113          	addi	sp,sp,96
804118e0:	00008067          	ret
804118e4:	ff000693          	li	a3,-16
804118e8:	00048513          	mv	a0,s1
804118ec:	00d12423          	sw	a3,8(sp)
804118f0:	f98f30ef          	jal	ra,80405088 <up>
804118f4:	00812683          	lw	a3,8(sp)
804118f8:	000d0493          	mv	s1,s10
804118fc:	00068d93          	mv	s11,a3
80411900:	f95ff06f          	j	80411894 <sfs_namefile+0x1b4>
80411904:	00048513          	mv	a0,s1
80411908:	c39fb0ef          	jal	ra,8040d540 <inode_ref_dec>
8041190c:	00c12403          	lw	s0,12(sp)
80411910:	00090593          	mv	a1,s2
80411914:	00c42783          	lw	a5,12(s0)
80411918:	00042503          	lw	a0,0(s0)
8041191c:	ffe78793          	addi	a5,a5,-2
80411920:	41478a33          	sub	s4,a5,s4
80411924:	000a0613          	mv	a2,s4
80411928:	00150513          	addi	a0,a0,1
8041192c:	72d000ef          	jal	ra,80412858 <memmove>
80411930:	02f00793          	li	a5,47
80411934:	fef50fa3          	sb	a5,-1(a0)
80411938:	01450533          	add	a0,a0,s4
8041193c:	00050023          	sb	zero,0(a0)
80411940:	000a0593          	mv	a1,s4
80411944:	00040513          	mv	a0,s0
80411948:	c69f40ef          	jal	ra,804065b0 <iobuf_skip>
8041194c:	000a8513          	mv	a0,s5
80411950:	864f10ef          	jal	ra,804029b4 <kfree>
80411954:	f51ff06f          	j	804118a4 <sfs_namefile+0x1c4>
80411958:	000d0493          	mv	s1,s10
8041195c:	ffc00d93          	li	s11,-4
80411960:	f35ff06f          	j	80411894 <sfs_namefile+0x1b4>
80411964:	ffc00d93          	li	s11,-4
80411968:	f3dff06f          	j	804118a4 <sfs_namefile+0x1c4>
8041196c:	00004697          	auipc	a3,0x4
80411970:	1e868693          	addi	a3,a3,488 # 80415b54 <dev_node_ops+0x724>
80411974:	00001617          	auipc	a2,0x1
80411978:	2f860613          	addi	a2,a2,760 # 80412c6c <commands+0x1bc>
8041197c:	2f900593          	li	a1,761
80411980:	00004517          	auipc	a0,0x4
80411984:	0f450513          	addi	a0,a0,244 # 80415a74 <dev_node_ops+0x644>
80411988:	c9dee0ef          	jal	ra,80400624 <__panic>
8041198c:	00004697          	auipc	a3,0x4
80411990:	10068693          	addi	a3,a3,256 # 80415a8c <dev_node_ops+0x65c>
80411994:	00001617          	auipc	a2,0x1
80411998:	2d860613          	addi	a2,a2,728 # 80412c6c <commands+0x1bc>
8041199c:	2f800593          	li	a1,760
804119a0:	00004517          	auipc	a0,0x4
804119a4:	0d450513          	addi	a0,a0,212 # 80415a74 <dev_node_ops+0x644>
804119a8:	c7dee0ef          	jal	ra,80400624 <__panic>
804119ac:	00004697          	auipc	a3,0x4
804119b0:	f2c68693          	addi	a3,a3,-212 # 804158d8 <dev_node_ops+0x4a8>
804119b4:	00001617          	auipc	a2,0x1
804119b8:	2b860613          	addi	a2,a2,696 # 80412c6c <commands+0x1bc>
804119bc:	2e400593          	li	a1,740
804119c0:	00004517          	auipc	a0,0x4
804119c4:	0b450513          	addi	a0,a0,180 # 80415a74 <dev_node_ops+0x644>
804119c8:	c5dee0ef          	jal	ra,80400624 <__panic>
804119cc:	00004697          	auipc	a3,0x4
804119d0:	0c068693          	addi	a3,a3,192 # 80415a8c <dev_node_ops+0x65c>
804119d4:	00001617          	auipc	a2,0x1
804119d8:	29860613          	addi	a2,a2,664 # 80412c6c <commands+0x1bc>
804119dc:	2e500593          	li	a1,741
804119e0:	00004517          	auipc	a0,0x4
804119e4:	09450513          	addi	a0,a0,148 # 80415a74 <dev_node_ops+0x644>
804119e8:	c3dee0ef          	jal	ra,80400624 <__panic>

804119ec <sfs_lookup>:
804119ec:	fd010113          	addi	sp,sp,-48
804119f0:	02912223          	sw	s1,36(sp)
804119f4:	03852483          	lw	s1,56(a0)
804119f8:	02112623          	sw	ra,44(sp)
804119fc:	02812423          	sw	s0,40(sp)
80411a00:	03212023          	sw	s2,32(sp)
80411a04:	01312e23          	sw	s3,28(sp)
80411a08:	0c048463          	beqz	s1,80411ad0 <sfs_lookup+0xe4>
80411a0c:	06c4a783          	lw	a5,108(s1)
80411a10:	0c079063          	bnez	a5,80411ad0 <sfs_lookup+0xe4>
80411a14:	0005c783          	lbu	a5,0(a1)
80411a18:	00058913          	mv	s2,a1
80411a1c:	08078a63          	beqz	a5,80411ab0 <sfs_lookup+0xc4>
80411a20:	02f00713          	li	a4,47
80411a24:	08e78663          	beq	a5,a4,80411ab0 <sfs_lookup+0xc4>
80411a28:	00050413          	mv	s0,a0
80411a2c:	00060993          	mv	s3,a2
80411a30:	a1dfb0ef          	jal	ra,8040d44c <inode_ref_inc>
80411a34:	02c42703          	lw	a4,44(s0)
80411a38:	000017b7          	lui	a5,0x1
80411a3c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411a40:	0af71863          	bne	a4,a5,80411af0 <sfs_lookup+0x104>
80411a44:	00042703          	lw	a4,0(s0)
80411a48:	00200793          	li	a5,2
80411a4c:	00475703          	lhu	a4,4(a4)
80411a50:	04f71863          	bne	a4,a5,80411aa0 <sfs_lookup+0xb4>
80411a54:	00048513          	mv	a0,s1
80411a58:	00c10693          	addi	a3,sp,12
80411a5c:	00090613          	mv	a2,s2
80411a60:	00040593          	mv	a1,s0
80411a64:	ae9ff0ef          	jal	ra,8041154c <sfs_lookup_once.constprop.13>
80411a68:	00050493          	mv	s1,a0
80411a6c:	00040513          	mv	a0,s0
80411a70:	ad1fb0ef          	jal	ra,8040d540 <inode_ref_dec>
80411a74:	00049663          	bnez	s1,80411a80 <sfs_lookup+0x94>
80411a78:	00c12783          	lw	a5,12(sp)
80411a7c:	00f9a023          	sw	a5,0(s3)
80411a80:	02c12083          	lw	ra,44(sp)
80411a84:	02812403          	lw	s0,40(sp)
80411a88:	00048513          	mv	a0,s1
80411a8c:	02012903          	lw	s2,32(sp)
80411a90:	02412483          	lw	s1,36(sp)
80411a94:	01c12983          	lw	s3,28(sp)
80411a98:	03010113          	addi	sp,sp,48
80411a9c:	00008067          	ret
80411aa0:	00040513          	mv	a0,s0
80411aa4:	a9dfb0ef          	jal	ra,8040d540 <inode_ref_dec>
80411aa8:	fee00493          	li	s1,-18
80411aac:	fd5ff06f          	j	80411a80 <sfs_lookup+0x94>
80411ab0:	00004697          	auipc	a3,0x4
80411ab4:	05c68693          	addi	a3,a3,92 # 80415b0c <dev_node_ops+0x6dc>
80411ab8:	00001617          	auipc	a2,0x1
80411abc:	1b460613          	addi	a2,a2,436 # 80412c6c <commands+0x1bc>
80411ac0:	3db00593          	li	a1,987
80411ac4:	00004517          	auipc	a0,0x4
80411ac8:	fb050513          	addi	a0,a0,-80 # 80415a74 <dev_node_ops+0x644>
80411acc:	b59ee0ef          	jal	ra,80400624 <__panic>
80411ad0:	00004697          	auipc	a3,0x4
80411ad4:	e0868693          	addi	a3,a3,-504 # 804158d8 <dev_node_ops+0x4a8>
80411ad8:	00001617          	auipc	a2,0x1
80411adc:	19460613          	addi	a2,a2,404 # 80412c6c <commands+0x1bc>
80411ae0:	3da00593          	li	a1,986
80411ae4:	00004517          	auipc	a0,0x4
80411ae8:	f9050513          	addi	a0,a0,-112 # 80415a74 <dev_node_ops+0x644>
80411aec:	b39ee0ef          	jal	ra,80400624 <__panic>
80411af0:	00004697          	auipc	a3,0x4
80411af4:	f9c68693          	addi	a3,a3,-100 # 80415a8c <dev_node_ops+0x65c>
80411af8:	00001617          	auipc	a2,0x1
80411afc:	17460613          	addi	a2,a2,372 # 80412c6c <commands+0x1bc>
80411b00:	3dd00593          	li	a1,989
80411b04:	00004517          	auipc	a0,0x4
80411b08:	f7050513          	addi	a0,a0,-144 # 80415a74 <dev_node_ops+0x644>
80411b0c:	b19ee0ef          	jal	ra,80400624 <__panic>

80411b10 <sfs_rwblock_nolock.isra.0>:
80411b10:	fe010113          	addi	sp,sp,-32
80411b14:	00812c23          	sw	s0,24(sp)
80411b18:	00912a23          	sw	s1,20(sp)
80411b1c:	00112e23          	sw	ra,28(sp)
80411b20:	00058493          	mv	s1,a1
80411b24:	00070413          	mv	s0,a4
80411b28:	00060593          	mv	a1,a2
80411b2c:	00069463          	bnez	a3,80411b34 <sfs_rwblock_nolock.isra.0+0x24>
80411b30:	04079463          	bnez	a5,80411b78 <sfs_rwblock_nolock.isra.0+0x68>
80411b34:	00052783          	lw	a5,0(a0)
80411b38:	04f6f063          	bgeu	a3,a5,80411b78 <sfs_rwblock_nolock.isra.0+0x68>
80411b3c:	00001637          	lui	a2,0x1
80411b40:	00c69693          	slli	a3,a3,0xc
80411b44:	00010513          	mv	a0,sp
80411b48:	999f40ef          	jal	ra,804064e0 <iobuf_init>
80411b4c:	0004a783          	lw	a5,0(s1)
80411b50:	00050593          	mv	a1,a0
80411b54:	00040613          	mv	a2,s0
80411b58:	0107a703          	lw	a4,16(a5)
80411b5c:	00078513          	mv	a0,a5
80411b60:	000700e7          	jalr	a4
80411b64:	01c12083          	lw	ra,28(sp)
80411b68:	01812403          	lw	s0,24(sp)
80411b6c:	01412483          	lw	s1,20(sp)
80411b70:	02010113          	addi	sp,sp,32
80411b74:	00008067          	ret
80411b78:	00004697          	auipc	a3,0x4
80411b7c:	16468693          	addi	a3,a3,356 # 80415cdc <sfs_node_fileops+0x114>
80411b80:	00001617          	auipc	a2,0x1
80411b84:	0ec60613          	addi	a2,a2,236 # 80412c6c <commands+0x1bc>
80411b88:	01500593          	li	a1,21
80411b8c:	00004517          	auipc	a0,0x4
80411b90:	18450513          	addi	a0,a0,388 # 80415d10 <sfs_node_fileops+0x148>
80411b94:	a91ee0ef          	jal	ra,80400624 <__panic>

80411b98 <sfs_rwblock>:
80411b98:	fd010113          	addi	sp,sp,-48
80411b9c:	02812423          	sw	s0,40(sp)
80411ba0:	03212023          	sw	s2,32(sp)
80411ba4:	01812423          	sw	s8,8(sp)
80411ba8:	00060413          	mv	s0,a2
80411bac:	00050c13          	mv	s8,a0
80411bb0:	00068913          	mv	s2,a3
80411bb4:	02912223          	sw	s1,36(sp)
80411bb8:	01312e23          	sw	s3,28(sp)
80411bbc:	01412c23          	sw	s4,24(sp)
80411bc0:	01512a23          	sw	s5,20(sp)
80411bc4:	01612823          	sw	s6,16(sp)
80411bc8:	01712623          	sw	s7,12(sp)
80411bcc:	02112623          	sw	ra,44(sp)
80411bd0:	00058493          	mv	s1,a1
80411bd4:	00070a93          	mv	s5,a4
80411bd8:	00450a13          	addi	s4,a0,4
80411bdc:	01240bb3          	add	s7,s0,s2
80411be0:	404000ef          	jal	ra,80411fe4 <lock_sfs_io>
80411be4:	02cc0993          	addi	s3,s8,44
80411be8:	00001b37          	lui	s6,0x1
80411bec:	00091863          	bnez	s2,80411bfc <sfs_rwblock+0x64>
80411bf0:	0700006f          	j	80411c60 <sfs_rwblock+0xc8>
80411bf4:	016484b3          	add	s1,s1,s6
80411bf8:	068b8463          	beq	s7,s0,80411c60 <sfs_rwblock+0xc8>
80411bfc:	00040693          	mv	a3,s0
80411c00:	00048613          	mv	a2,s1
80411c04:	00100793          	li	a5,1
80411c08:	000a8713          	mv	a4,s5
80411c0c:	00098593          	mv	a1,s3
80411c10:	000a0513          	mv	a0,s4
80411c14:	efdff0ef          	jal	ra,80411b10 <sfs_rwblock_nolock.isra.0>
80411c18:	00050913          	mv	s2,a0
80411c1c:	00140413          	addi	s0,s0,1
80411c20:	fc050ae3          	beqz	a0,80411bf4 <sfs_rwblock+0x5c>
80411c24:	000c0513          	mv	a0,s8
80411c28:	3cc000ef          	jal	ra,80411ff4 <unlock_sfs_io>
80411c2c:	02c12083          	lw	ra,44(sp)
80411c30:	02812403          	lw	s0,40(sp)
80411c34:	00090513          	mv	a0,s2
80411c38:	02412483          	lw	s1,36(sp)
80411c3c:	02012903          	lw	s2,32(sp)
80411c40:	01c12983          	lw	s3,28(sp)
80411c44:	01812a03          	lw	s4,24(sp)
80411c48:	01412a83          	lw	s5,20(sp)
80411c4c:	01012b03          	lw	s6,16(sp)
80411c50:	00c12b83          	lw	s7,12(sp)
80411c54:	00812c03          	lw	s8,8(sp)
80411c58:	03010113          	addi	sp,sp,48
80411c5c:	00008067          	ret
80411c60:	00000913          	li	s2,0
80411c64:	fc1ff06f          	j	80411c24 <sfs_rwblock+0x8c>

80411c68 <sfs_rblock>:
80411c68:	00000713          	li	a4,0
80411c6c:	f2dff06f          	j	80411b98 <sfs_rwblock>

80411c70 <sfs_wblock>:
80411c70:	00100713          	li	a4,1
80411c74:	f25ff06f          	j	80411b98 <sfs_rwblock>

80411c78 <sfs_rbuf>:
80411c78:	fe010113          	addi	sp,sp,-32
80411c7c:	00112e23          	sw	ra,28(sp)
80411c80:	00812c23          	sw	s0,24(sp)
80411c84:	00912a23          	sw	s1,20(sp)
80411c88:	01212823          	sw	s2,16(sp)
80411c8c:	01312623          	sw	s3,12(sp)
80411c90:	01412423          	sw	s4,8(sp)
80411c94:	000017b7          	lui	a5,0x1
80411c98:	08f77663          	bgeu	a4,a5,80411d24 <sfs_rbuf+0xac>
80411c9c:	00070493          	mv	s1,a4
80411ca0:	00c70733          	add	a4,a4,a2
80411ca4:	00060993          	mv	s3,a2
80411ca8:	06e7ee63          	bltu	a5,a4,80411d24 <sfs_rbuf+0xac>
80411cac:	00050413          	mv	s0,a0
80411cb0:	00068913          	mv	s2,a3
80411cb4:	00058a13          	mv	s4,a1
80411cb8:	32c000ef          	jal	ra,80411fe4 <lock_sfs_io>
80411cbc:	03842603          	lw	a2,56(s0)
80411cc0:	00090693          	mv	a3,s2
80411cc4:	00100793          	li	a5,1
80411cc8:	00000713          	li	a4,0
80411ccc:	02c40593          	addi	a1,s0,44
80411cd0:	00440513          	addi	a0,s0,4
80411cd4:	e3dff0ef          	jal	ra,80411b10 <sfs_rwblock_nolock.isra.0>
80411cd8:	00050913          	mv	s2,a0
80411cdc:	02050863          	beqz	a0,80411d0c <sfs_rbuf+0x94>
80411ce0:	00040513          	mv	a0,s0
80411ce4:	310000ef          	jal	ra,80411ff4 <unlock_sfs_io>
80411ce8:	01c12083          	lw	ra,28(sp)
80411cec:	01812403          	lw	s0,24(sp)
80411cf0:	00090513          	mv	a0,s2
80411cf4:	01412483          	lw	s1,20(sp)
80411cf8:	01012903          	lw	s2,16(sp)
80411cfc:	00c12983          	lw	s3,12(sp)
80411d00:	00812a03          	lw	s4,8(sp)
80411d04:	02010113          	addi	sp,sp,32
80411d08:	00008067          	ret
80411d0c:	03842583          	lw	a1,56(s0)
80411d10:	00098613          	mv	a2,s3
80411d14:	000a0513          	mv	a0,s4
80411d18:	009585b3          	add	a1,a1,s1
80411d1c:	391000ef          	jal	ra,804128ac <memcpy>
80411d20:	fc1ff06f          	j	80411ce0 <sfs_rbuf+0x68>
80411d24:	00004697          	auipc	a3,0x4
80411d28:	f7468693          	addi	a3,a3,-140 # 80415c98 <sfs_node_fileops+0xd0>
80411d2c:	00001617          	auipc	a2,0x1
80411d30:	f4060613          	addi	a2,a2,-192 # 80412c6c <commands+0x1bc>
80411d34:	05500593          	li	a1,85
80411d38:	00004517          	auipc	a0,0x4
80411d3c:	fd850513          	addi	a0,a0,-40 # 80415d10 <sfs_node_fileops+0x148>
80411d40:	8e5ee0ef          	jal	ra,80400624 <__panic>

80411d44 <sfs_wbuf>:
80411d44:	fd010113          	addi	sp,sp,-48
80411d48:	02112623          	sw	ra,44(sp)
80411d4c:	02812423          	sw	s0,40(sp)
80411d50:	02912223          	sw	s1,36(sp)
80411d54:	03212023          	sw	s2,32(sp)
80411d58:	01312e23          	sw	s3,28(sp)
80411d5c:	01412c23          	sw	s4,24(sp)
80411d60:	01512a23          	sw	s5,20(sp)
80411d64:	01612823          	sw	s6,16(sp)
80411d68:	01712623          	sw	s7,12(sp)
80411d6c:	000017b7          	lui	a5,0x1
80411d70:	0cf77063          	bgeu	a4,a5,80411e30 <sfs_wbuf+0xec>
80411d74:	00070493          	mv	s1,a4
80411d78:	00c70733          	add	a4,a4,a2
80411d7c:	00060a13          	mv	s4,a2
80411d80:	0ae7e863          	bltu	a5,a4,80411e30 <sfs_wbuf+0xec>
80411d84:	00050413          	mv	s0,a0
80411d88:	00058b93          	mv	s7,a1
80411d8c:	00068993          	mv	s3,a3
80411d90:	254000ef          	jal	ra,80411fe4 <lock_sfs_io>
80411d94:	03842603          	lw	a2,56(s0)
80411d98:	00440a93          	addi	s5,s0,4
80411d9c:	02c40b13          	addi	s6,s0,44
80411da0:	00100793          	li	a5,1
80411da4:	00000713          	li	a4,0
80411da8:	00098693          	mv	a3,s3
80411dac:	000b0593          	mv	a1,s6
80411db0:	000a8513          	mv	a0,s5
80411db4:	d5dff0ef          	jal	ra,80411b10 <sfs_rwblock_nolock.isra.0>
80411db8:	00050913          	mv	s2,a0
80411dbc:	02050e63          	beqz	a0,80411df8 <sfs_wbuf+0xb4>
80411dc0:	00040513          	mv	a0,s0
80411dc4:	230000ef          	jal	ra,80411ff4 <unlock_sfs_io>
80411dc8:	02c12083          	lw	ra,44(sp)
80411dcc:	02812403          	lw	s0,40(sp)
80411dd0:	00090513          	mv	a0,s2
80411dd4:	02412483          	lw	s1,36(sp)
80411dd8:	02012903          	lw	s2,32(sp)
80411ddc:	01c12983          	lw	s3,28(sp)
80411de0:	01812a03          	lw	s4,24(sp)
80411de4:	01412a83          	lw	s5,20(sp)
80411de8:	01012b03          	lw	s6,16(sp)
80411dec:	00c12b83          	lw	s7,12(sp)
80411df0:	03010113          	addi	sp,sp,48
80411df4:	00008067          	ret
80411df8:	03842503          	lw	a0,56(s0)
80411dfc:	000a0613          	mv	a2,s4
80411e00:	000b8593          	mv	a1,s7
80411e04:	00950533          	add	a0,a0,s1
80411e08:	2a5000ef          	jal	ra,804128ac <memcpy>
80411e0c:	03842603          	lw	a2,56(s0)
80411e10:	00100793          	li	a5,1
80411e14:	00100713          	li	a4,1
80411e18:	00098693          	mv	a3,s3
80411e1c:	000b0593          	mv	a1,s6
80411e20:	000a8513          	mv	a0,s5
80411e24:	cedff0ef          	jal	ra,80411b10 <sfs_rwblock_nolock.isra.0>
80411e28:	00050913          	mv	s2,a0
80411e2c:	f95ff06f          	j	80411dc0 <sfs_wbuf+0x7c>
80411e30:	00004697          	auipc	a3,0x4
80411e34:	e6868693          	addi	a3,a3,-408 # 80415c98 <sfs_node_fileops+0xd0>
80411e38:	00001617          	auipc	a2,0x1
80411e3c:	e3460613          	addi	a2,a2,-460 # 80412c6c <commands+0x1bc>
80411e40:	06b00593          	li	a1,107
80411e44:	00004517          	auipc	a0,0x4
80411e48:	ecc50513          	addi	a0,a0,-308 # 80415d10 <sfs_node_fileops+0x148>
80411e4c:	fd8ee0ef          	jal	ra,80400624 <__panic>

80411e50 <sfs_sync_super>:
80411e50:	ff010113          	addi	sp,sp,-16
80411e54:	00112623          	sw	ra,12(sp)
80411e58:	00812423          	sw	s0,8(sp)
80411e5c:	00912223          	sw	s1,4(sp)
80411e60:	00050413          	mv	s0,a0
80411e64:	180000ef          	jal	ra,80411fe4 <lock_sfs_io>
80411e68:	03842503          	lw	a0,56(s0)
80411e6c:	00001637          	lui	a2,0x1
80411e70:	00000593          	li	a1,0
80411e74:	1c9000ef          	jal	ra,8041283c <memset>
80411e78:	03842503          	lw	a0,56(s0)
80411e7c:	00040593          	mv	a1,s0
80411e80:	02c00613          	li	a2,44
80411e84:	229000ef          	jal	ra,804128ac <memcpy>
80411e88:	03842603          	lw	a2,56(s0)
80411e8c:	02c40593          	addi	a1,s0,44
80411e90:	00000793          	li	a5,0
80411e94:	00100713          	li	a4,1
80411e98:	00000693          	li	a3,0
80411e9c:	00440513          	addi	a0,s0,4
80411ea0:	c71ff0ef          	jal	ra,80411b10 <sfs_rwblock_nolock.isra.0>
80411ea4:	00050493          	mv	s1,a0
80411ea8:	00040513          	mv	a0,s0
80411eac:	148000ef          	jal	ra,80411ff4 <unlock_sfs_io>
80411eb0:	00c12083          	lw	ra,12(sp)
80411eb4:	00812403          	lw	s0,8(sp)
80411eb8:	00048513          	mv	a0,s1
80411ebc:	00412483          	lw	s1,4(sp)
80411ec0:	01010113          	addi	sp,sp,16
80411ec4:	00008067          	ret

80411ec8 <sfs_sync_freemap>:
80411ec8:	ff010113          	addi	sp,sp,-16
80411ecc:	00812423          	sw	s0,8(sp)
80411ed0:	00452403          	lw	s0,4(a0)
80411ed4:	00912223          	sw	s1,4(sp)
80411ed8:	000086b7          	lui	a3,0x8
80411edc:	00050493          	mv	s1,a0
80411ee0:	03052503          	lw	a0,48(a0)
80411ee4:	fff68693          	addi	a3,a3,-1 # 7fff <_binary_bin_swap_img_size-0x1>
80411ee8:	00d40433          	add	s0,s0,a3
80411eec:	00000593          	li	a1,0
80411ef0:	00112623          	sw	ra,12(sp)
80411ef4:	00f45413          	srli	s0,s0,0xf
80411ef8:	f2cfd0ef          	jal	ra,8040f624 <bitmap_getdata>
80411efc:	00040693          	mv	a3,s0
80411f00:	00812403          	lw	s0,8(sp)
80411f04:	00c12083          	lw	ra,12(sp)
80411f08:	00050593          	mv	a1,a0
80411f0c:	00048513          	mv	a0,s1
80411f10:	00412483          	lw	s1,4(sp)
80411f14:	00100713          	li	a4,1
80411f18:	00200613          	li	a2,2
80411f1c:	01010113          	addi	sp,sp,16
80411f20:	c79ff06f          	j	80411b98 <sfs_rwblock>

80411f24 <sfs_clear_block>:
80411f24:	fe010113          	addi	sp,sp,-32
80411f28:	00112e23          	sw	ra,28(sp)
80411f2c:	00812c23          	sw	s0,24(sp)
80411f30:	00912a23          	sw	s1,20(sp)
80411f34:	00058413          	mv	s0,a1
80411f38:	00060493          	mv	s1,a2
80411f3c:	01212823          	sw	s2,16(sp)
80411f40:	01312623          	sw	s3,12(sp)
80411f44:	00050913          	mv	s2,a0
80411f48:	01412423          	sw	s4,8(sp)
80411f4c:	01512223          	sw	s5,4(sp)
80411f50:	094000ef          	jal	ra,80411fe4 <lock_sfs_io>
80411f54:	03892503          	lw	a0,56(s2)
80411f58:	00001637          	lui	a2,0x1
80411f5c:	00000593          	li	a1,0
80411f60:	0dd000ef          	jal	ra,8041283c <memset>
80411f64:	00940ab3          	add	s5,s0,s1
80411f68:	00490a13          	addi	s4,s2,4
80411f6c:	02c90993          	addi	s3,s2,44
80411f70:	00049663          	bnez	s1,80411f7c <sfs_clear_block+0x58>
80411f74:	0600006f          	j	80411fd4 <sfs_clear_block+0xb0>
80411f78:	05540e63          	beq	s0,s5,80411fd4 <sfs_clear_block+0xb0>
80411f7c:	03892603          	lw	a2,56(s2)
80411f80:	00040693          	mv	a3,s0
80411f84:	00100793          	li	a5,1
80411f88:	00100713          	li	a4,1
80411f8c:	00098593          	mv	a1,s3
80411f90:	000a0513          	mv	a0,s4
80411f94:	b7dff0ef          	jal	ra,80411b10 <sfs_rwblock_nolock.isra.0>
80411f98:	00050493          	mv	s1,a0
80411f9c:	00140413          	addi	s0,s0,1
80411fa0:	fc050ce3          	beqz	a0,80411f78 <sfs_clear_block+0x54>
80411fa4:	00090513          	mv	a0,s2
80411fa8:	04c000ef          	jal	ra,80411ff4 <unlock_sfs_io>
80411fac:	01c12083          	lw	ra,28(sp)
80411fb0:	01812403          	lw	s0,24(sp)
80411fb4:	00048513          	mv	a0,s1
80411fb8:	01012903          	lw	s2,16(sp)
80411fbc:	01412483          	lw	s1,20(sp)
80411fc0:	00c12983          	lw	s3,12(sp)
80411fc4:	00812a03          	lw	s4,8(sp)
80411fc8:	00412a83          	lw	s5,4(sp)
80411fcc:	02010113          	addi	sp,sp,32
80411fd0:	00008067          	ret
80411fd4:	00000493          	li	s1,0
80411fd8:	fcdff06f          	j	80411fa4 <sfs_clear_block+0x80>

80411fdc <lock_sfs_fs>:
80411fdc:	03c50513          	addi	a0,a0,60
80411fe0:	8acf306f          	j	8040508c <down>

80411fe4 <lock_sfs_io>:
80411fe4:	04850513          	addi	a0,a0,72
80411fe8:	8a4f306f          	j	8040508c <down>

80411fec <unlock_sfs_fs>:
80411fec:	03c50513          	addi	a0,a0,60
80411ff0:	898f306f          	j	80405088 <up>

80411ff4 <unlock_sfs_io>:
80411ff4:	04850513          	addi	a0,a0,72
80411ff8:	890f306f          	j	80405088 <up>

80411ffc <hash32>:
80411ffc:	00351793          	slli	a5,a0,0x3
80412000:	40a787b3          	sub	a5,a5,a0
80412004:	00679793          	slli	a5,a5,0x6
80412008:	40a78733          	sub	a4,a5,a0
8041200c:	00371793          	slli	a5,a4,0x3
80412010:	40e787b3          	sub	a5,a5,a4
80412014:	00379793          	slli	a5,a5,0x3
80412018:	00a787b3          	add	a5,a5,a0
8041201c:	01079793          	slli	a5,a5,0x10
80412020:	40f50533          	sub	a0,a0,a5
80412024:	02000793          	li	a5,32
80412028:	40b785b3          	sub	a1,a5,a1
8041202c:	00b55533          	srl	a0,a0,a1
80412030:	00008067          	ret

80412034 <printnum>:
80412034:	fd010113          	addi	sp,sp,-48
80412038:	02912223          	sw	s1,36(sp)
8041203c:	01312e23          	sw	s3,28(sp)
80412040:	00050493          	mv	s1,a0
80412044:	00058993          	mv	s3,a1
80412048:	00068513          	mv	a0,a3
8041204c:	00078593          	mv	a1,a5
80412050:	02812423          	sw	s0,40(sp)
80412054:	03212023          	sw	s2,32(sp)
80412058:	01412c23          	sw	s4,24(sp)
8041205c:	01512a23          	sw	s5,20(sp)
80412060:	01612823          	sw	s6,16(sp)
80412064:	01712623          	sw	s7,12(sp)
80412068:	01812423          	sw	s8,8(sp)
8041206c:	02112623          	sw	ra,44(sp)
80412070:	00068b13          	mv	s6,a3
80412074:	00078a93          	mv	s5,a5
80412078:	00070c13          	mv	s8,a4
8041207c:	00060913          	mv	s2,a2
80412080:	00088a13          	mv	s4,a7
80412084:	fff80413          	addi	s0,a6,-1
80412088:	0bd000ef          	jal	ra,80412944 <__umodsi3>
8041208c:	00050b93          	mv	s7,a0
80412090:	060c1863          	bnez	s8,80412100 <printnum+0xcc>
80412094:	075b7663          	bgeu	s6,s5,80412100 <printnum+0xcc>
80412098:	00805e63          	blez	s0,804120b4 <printnum+0x80>
8041209c:	fff40413          	addi	s0,s0,-1
804120a0:	00098613          	mv	a2,s3
804120a4:	00090593          	mv	a1,s2
804120a8:	000a0513          	mv	a0,s4
804120ac:	000480e7          	jalr	s1
804120b0:	fe0416e3          	bnez	s0,8041209c <printnum+0x68>
804120b4:	00004517          	auipc	a0,0x4
804120b8:	e3050513          	addi	a0,a0,-464 # 80415ee4 <error_string+0x64>
804120bc:	01750533          	add	a0,a0,s7
804120c0:	02812403          	lw	s0,40(sp)
804120c4:	02c12083          	lw	ra,44(sp)
804120c8:	01812a03          	lw	s4,24(sp)
804120cc:	01412a83          	lw	s5,20(sp)
804120d0:	01012b03          	lw	s6,16(sp)
804120d4:	00c12b83          	lw	s7,12(sp)
804120d8:	00812c03          	lw	s8,8(sp)
804120dc:	00054503          	lbu	a0,0(a0)
804120e0:	00098613          	mv	a2,s3
804120e4:	00090593          	mv	a1,s2
804120e8:	01c12983          	lw	s3,28(sp)
804120ec:	02012903          	lw	s2,32(sp)
804120f0:	00048313          	mv	t1,s1
804120f4:	02412483          	lw	s1,36(sp)
804120f8:	03010113          	addi	sp,sp,48
804120fc:	00030067          	jr	t1
80412100:	000a8593          	mv	a1,s5
80412104:	000b0513          	mv	a0,s6
80412108:	7f4000ef          	jal	ra,804128fc <__udivsi3>
8041210c:	00050693          	mv	a3,a0
80412110:	000a0893          	mv	a7,s4
80412114:	00040813          	mv	a6,s0
80412118:	000a8793          	mv	a5,s5
8041211c:	00000713          	li	a4,0
80412120:	00090613          	mv	a2,s2
80412124:	00098593          	mv	a1,s3
80412128:	00048513          	mv	a0,s1
8041212c:	f09ff0ef          	jal	ra,80412034 <printnum>
80412130:	f85ff06f          	j	804120b4 <printnum+0x80>

80412134 <sprintputch>:
80412134:	0085a783          	lw	a5,8(a1)
80412138:	0005a703          	lw	a4,0(a1)
8041213c:	0045a683          	lw	a3,4(a1)
80412140:	00178793          	addi	a5,a5,1 # 1001 <_binary_bin_swap_img_size-0x6fff>
80412144:	00f5a423          	sw	a5,8(a1)
80412148:	00d77863          	bgeu	a4,a3,80412158 <sprintputch+0x24>
8041214c:	00170793          	addi	a5,a4,1
80412150:	00f5a023          	sw	a5,0(a1)
80412154:	00a70023          	sb	a0,0(a4)
80412158:	00008067          	ret

8041215c <vprintfmt>:
8041215c:	fb010113          	addi	sp,sp,-80
80412160:	04912223          	sw	s1,68(sp)
80412164:	05212023          	sw	s2,64(sp)
80412168:	03312e23          	sw	s3,60(sp)
8041216c:	03512a23          	sw	s5,52(sp)
80412170:	03612823          	sw	s6,48(sp)
80412174:	03712623          	sw	s7,44(sp)
80412178:	03812423          	sw	s8,40(sp)
8041217c:	01b12e23          	sw	s11,28(sp)
80412180:	04112623          	sw	ra,76(sp)
80412184:	04812423          	sw	s0,72(sp)
80412188:	03412c23          	sw	s4,56(sp)
8041218c:	03912223          	sw	s9,36(sp)
80412190:	03a12023          	sw	s10,32(sp)
80412194:	00050993          	mv	s3,a0
80412198:	00058913          	mv	s2,a1
8041219c:	00060493          	mv	s1,a2
804121a0:	00068d93          	mv	s11,a3
804121a4:	00070b13          	mv	s6,a4
804121a8:	00004a97          	auipc	s5,0x4
804121ac:	b80a8a93          	addi	s5,s5,-1152 # 80415d28 <sfs_node_fileops+0x160>
804121b0:	fff00b93          	li	s7,-1
804121b4:	05e00c13          	li	s8,94
804121b8:	000dc503          	lbu	a0,0(s11)
804121bc:	02500793          	li	a5,37
804121c0:	001d8413          	addi	s0,s11,1
804121c4:	02f50663          	beq	a0,a5,804121f0 <vprintfmt+0x94>
804121c8:	06050663          	beqz	a0,80412234 <vprintfmt+0xd8>
804121cc:	02500a13          	li	s4,37
804121d0:	0080006f          	j	804121d8 <vprintfmt+0x7c>
804121d4:	06050063          	beqz	a0,80412234 <vprintfmt+0xd8>
804121d8:	00090613          	mv	a2,s2
804121dc:	00048593          	mv	a1,s1
804121e0:	00140413          	addi	s0,s0,1
804121e4:	000980e7          	jalr	s3
804121e8:	fff44503          	lbu	a0,-1(s0)
804121ec:	ff4514e3          	bne	a0,s4,804121d4 <vprintfmt+0x78>
804121f0:	00044503          	lbu	a0,0(s0)
804121f4:	02000893          	li	a7,32
804121f8:	00000a13          	li	s4,0
804121fc:	00000593          	li	a1,0
80412200:	fff00c93          	li	s9,-1
80412204:	fff00d13          	li	s10,-1
80412208:	05500693          	li	a3,85
8041220c:	00900613          	li	a2,9
80412210:	fdd50793          	addi	a5,a0,-35
80412214:	0ff7f793          	andi	a5,a5,255
80412218:	00140d93          	addi	s11,s0,1
8041221c:	2ef6e663          	bltu	a3,a5,80412508 <vprintfmt+0x3ac>
80412220:	00279793          	slli	a5,a5,0x2
80412224:	015787b3          	add	a5,a5,s5
80412228:	0007a783          	lw	a5,0(a5)
8041222c:	015787b3          	add	a5,a5,s5
80412230:	00078067          	jr	a5
80412234:	04c12083          	lw	ra,76(sp)
80412238:	04812403          	lw	s0,72(sp)
8041223c:	04412483          	lw	s1,68(sp)
80412240:	04012903          	lw	s2,64(sp)
80412244:	03c12983          	lw	s3,60(sp)
80412248:	03812a03          	lw	s4,56(sp)
8041224c:	03412a83          	lw	s5,52(sp)
80412250:	03012b03          	lw	s6,48(sp)
80412254:	02c12b83          	lw	s7,44(sp)
80412258:	02812c03          	lw	s8,40(sp)
8041225c:	02412c83          	lw	s9,36(sp)
80412260:	02012d03          	lw	s10,32(sp)
80412264:	01c12d83          	lw	s11,28(sp)
80412268:	05010113          	addi	sp,sp,80
8041226c:	00008067          	ret
80412270:	00050893          	mv	a7,a0
80412274:	00144503          	lbu	a0,1(s0)
80412278:	000d8413          	mv	s0,s11
8041227c:	f95ff06f          	j	80412210 <vprintfmt+0xb4>
80412280:	000b2c83          	lw	s9,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
80412284:	00144503          	lbu	a0,1(s0)
80412288:	004b0b13          	addi	s6,s6,4
8041228c:	000d8413          	mv	s0,s11
80412290:	f80d50e3          	bgez	s10,80412210 <vprintfmt+0xb4>
80412294:	000c8d13          	mv	s10,s9
80412298:	fff00c93          	li	s9,-1
8041229c:	f75ff06f          	j	80412210 <vprintfmt+0xb4>
804122a0:	fffd4793          	not	a5,s10
804122a4:	41f7d793          	srai	a5,a5,0x1f
804122a8:	00144503          	lbu	a0,1(s0)
804122ac:	00fd7d33          	and	s10,s10,a5
804122b0:	000d8413          	mv	s0,s11
804122b4:	f5dff06f          	j	80412210 <vprintfmt+0xb4>
804122b8:	00100793          	li	a5,1
804122bc:	32b7c463          	blt	a5,a1,804125e4 <vprintfmt+0x488>
804122c0:	000b2683          	lw	a3,0(s6)
804122c4:	00000713          	li	a4,0
804122c8:	004b0b13          	addi	s6,s6,4
804122cc:	01000793          	li	a5,16
804122d0:	000d0813          	mv	a6,s10
804122d4:	00048613          	mv	a2,s1
804122d8:	00090593          	mv	a1,s2
804122dc:	00098513          	mv	a0,s3
804122e0:	d55ff0ef          	jal	ra,80412034 <printnum>
804122e4:	ed5ff06f          	j	804121b8 <vprintfmt+0x5c>
804122e8:	00144303          	lbu	t1,1(s0)
804122ec:	fd050c93          	addi	s9,a0,-48
804122f0:	000d8413          	mv	s0,s11
804122f4:	fd030793          	addi	a5,t1,-48
804122f8:	00030513          	mv	a0,t1
804122fc:	f8f66ae3          	bltu	a2,a5,80412290 <vprintfmt+0x134>
80412300:	002c9793          	slli	a5,s9,0x2
80412304:	01978733          	add	a4,a5,s9
80412308:	00140413          	addi	s0,s0,1
8041230c:	00171713          	slli	a4,a4,0x1
80412310:	00670733          	add	a4,a4,t1
80412314:	00044303          	lbu	t1,0(s0)
80412318:	fd070c93          	addi	s9,a4,-48
8041231c:	fd030793          	addi	a5,t1,-48
80412320:	00030513          	mv	a0,t1
80412324:	fcf67ee3          	bgeu	a2,a5,80412300 <vprintfmt+0x1a4>
80412328:	f69ff06f          	j	80412290 <vprintfmt+0x134>
8041232c:	000b2503          	lw	a0,0(s6)
80412330:	00090613          	mv	a2,s2
80412334:	00048593          	mv	a1,s1
80412338:	004b0b13          	addi	s6,s6,4
8041233c:	000980e7          	jalr	s3
80412340:	e79ff06f          	j	804121b8 <vprintfmt+0x5c>
80412344:	00100793          	li	a5,1
80412348:	28b7c263          	blt	a5,a1,804125cc <vprintfmt+0x470>
8041234c:	000b2a03          	lw	s4,0(s6)
80412350:	004b0793          	addi	a5,s6,4
80412354:	00078b13          	mv	s6,a5
80412358:	41fa5413          	srai	s0,s4,0x1f
8041235c:	2c044063          	bltz	s0,8041261c <vprintfmt+0x4c0>
80412360:	000a0693          	mv	a3,s4
80412364:	00040713          	mv	a4,s0
80412368:	00a00793          	li	a5,10
8041236c:	f65ff06f          	j	804122d0 <vprintfmt+0x174>
80412370:	000b2703          	lw	a4,0(s6)
80412374:	01800693          	li	a3,24
80412378:	004b0b13          	addi	s6,s6,4
8041237c:	41f75793          	srai	a5,a4,0x1f
80412380:	00e7c733          	xor	a4,a5,a4
80412384:	40f70733          	sub	a4,a4,a5
80412388:	1ae6ca63          	blt	a3,a4,8041253c <vprintfmt+0x3e0>
8041238c:	00271793          	slli	a5,a4,0x2
80412390:	00004697          	auipc	a3,0x4
80412394:	af068693          	addi	a3,a3,-1296 # 80415e80 <error_string>
80412398:	00f687b3          	add	a5,a3,a5
8041239c:	0007a783          	lw	a5,0(a5)
804123a0:	18078e63          	beqz	a5,8041253c <vprintfmt+0x3e0>
804123a4:	00078713          	mv	a4,a5
804123a8:	00000697          	auipc	a3,0x0
804123ac:	62468693          	addi	a3,a3,1572 # 804129cc <etext+0x24>
804123b0:	00048613          	mv	a2,s1
804123b4:	00090593          	mv	a1,s2
804123b8:	00098513          	mv	a0,s3
804123bc:	2cc000ef          	jal	ra,80412688 <printfmt>
804123c0:	df9ff06f          	j	804121b8 <vprintfmt+0x5c>
804123c4:	000b2783          	lw	a5,0(s6)
804123c8:	004b0b13          	addi	s6,s6,4
804123cc:	28078e63          	beqz	a5,80412668 <vprintfmt+0x50c>
804123d0:	00178413          	addi	s0,a5,1
804123d4:	1fa05063          	blez	s10,804125b4 <vprintfmt+0x458>
804123d8:	02d00693          	li	a3,45
804123dc:	18d89663          	bne	a7,a3,80412568 <vprintfmt+0x40c>
804123e0:	0007c783          	lbu	a5,0(a5)
804123e4:	00078513          	mv	a0,a5
804123e8:	04078263          	beqz	a5,8041242c <vprintfmt+0x2d0>
804123ec:	000cc663          	bltz	s9,804123f8 <vprintfmt+0x29c>
804123f0:	fffc8c93          	addi	s9,s9,-1
804123f4:	037c8a63          	beq	s9,s7,80412428 <vprintfmt+0x2cc>
804123f8:	00090613          	mv	a2,s2
804123fc:	00048593          	mv	a1,s1
80412400:	1c0a0263          	beqz	s4,804125c4 <vprintfmt+0x468>
80412404:	fe078793          	addi	a5,a5,-32
80412408:	1afc7e63          	bgeu	s8,a5,804125c4 <vprintfmt+0x468>
8041240c:	03f00513          	li	a0,63
80412410:	000980e7          	jalr	s3
80412414:	00140413          	addi	s0,s0,1
80412418:	fff44783          	lbu	a5,-1(s0)
8041241c:	fffd0d13          	addi	s10,s10,-1
80412420:	00078513          	mv	a0,a5
80412424:	fc0794e3          	bnez	a5,804123ec <vprintfmt+0x290>
80412428:	d9a058e3          	blez	s10,804121b8 <vprintfmt+0x5c>
8041242c:	fffd0d13          	addi	s10,s10,-1
80412430:	00090613          	mv	a2,s2
80412434:	00048593          	mv	a1,s1
80412438:	02000513          	li	a0,32
8041243c:	000980e7          	jalr	s3
80412440:	d60d0ce3          	beqz	s10,804121b8 <vprintfmt+0x5c>
80412444:	fffd0d13          	addi	s10,s10,-1
80412448:	00090613          	mv	a2,s2
8041244c:	00048593          	mv	a1,s1
80412450:	02000513          	li	a0,32
80412454:	000980e7          	jalr	s3
80412458:	fc0d1ae3          	bnez	s10,8041242c <vprintfmt+0x2d0>
8041245c:	d5dff06f          	j	804121b8 <vprintfmt+0x5c>
80412460:	00100793          	li	a5,1
80412464:	18b7ce63          	blt	a5,a1,80412600 <vprintfmt+0x4a4>
80412468:	000b2683          	lw	a3,0(s6)
8041246c:	00000713          	li	a4,0
80412470:	004b0b13          	addi	s6,s6,4
80412474:	00800793          	li	a5,8
80412478:	e59ff06f          	j	804122d0 <vprintfmt+0x174>
8041247c:	03000513          	li	a0,48
80412480:	00090613          	mv	a2,s2
80412484:	00048593          	mv	a1,s1
80412488:	01112423          	sw	a7,8(sp)
8041248c:	000980e7          	jalr	s3
80412490:	00090613          	mv	a2,s2
80412494:	00048593          	mv	a1,s1
80412498:	07800513          	li	a0,120
8041249c:	000980e7          	jalr	s3
804124a0:	004b0b13          	addi	s6,s6,4
804124a4:	ffcb2683          	lw	a3,-4(s6)
804124a8:	00000713          	li	a4,0
804124ac:	01000793          	li	a5,16
804124b0:	00812883          	lw	a7,8(sp)
804124b4:	e1dff06f          	j	804122d0 <vprintfmt+0x174>
804124b8:	00144503          	lbu	a0,1(s0)
804124bc:	00158593          	addi	a1,a1,1
804124c0:	000d8413          	mv	s0,s11
804124c4:	d4dff06f          	j	80412210 <vprintfmt+0xb4>
804124c8:	00144503          	lbu	a0,1(s0)
804124cc:	00100a13          	li	s4,1
804124d0:	000d8413          	mv	s0,s11
804124d4:	d3dff06f          	j	80412210 <vprintfmt+0xb4>
804124d8:	00090613          	mv	a2,s2
804124dc:	00048593          	mv	a1,s1
804124e0:	02500513          	li	a0,37
804124e4:	000980e7          	jalr	s3
804124e8:	cd1ff06f          	j	804121b8 <vprintfmt+0x5c>
804124ec:	00100793          	li	a5,1
804124f0:	14b7ce63          	blt	a5,a1,8041264c <vprintfmt+0x4f0>
804124f4:	000b2683          	lw	a3,0(s6)
804124f8:	00000713          	li	a4,0
804124fc:	004b0b13          	addi	s6,s6,4
80412500:	00a00793          	li	a5,10
80412504:	dcdff06f          	j	804122d0 <vprintfmt+0x174>
80412508:	00090613          	mv	a2,s2
8041250c:	00048593          	mv	a1,s1
80412510:	02500513          	li	a0,37
80412514:	000980e7          	jalr	s3
80412518:	fff44703          	lbu	a4,-1(s0)
8041251c:	02500793          	li	a5,37
80412520:	00040d93          	mv	s11,s0
80412524:	c8f70ae3          	beq	a4,a5,804121b8 <vprintfmt+0x5c>
80412528:	02500713          	li	a4,37
8041252c:	fffd8d93          	addi	s11,s11,-1
80412530:	fffdc783          	lbu	a5,-1(s11)
80412534:	fee79ce3          	bne	a5,a4,8041252c <vprintfmt+0x3d0>
80412538:	c81ff06f          	j	804121b8 <vprintfmt+0x5c>
8041253c:	00004697          	auipc	a3,0x4
80412540:	b7068693          	addi	a3,a3,-1168 # 804160ac <error_string+0x22c>
80412544:	00048613          	mv	a2,s1
80412548:	00090593          	mv	a1,s2
8041254c:	00098513          	mv	a0,s3
80412550:	138000ef          	jal	ra,80412688 <printfmt>
80412554:	c65ff06f          	j	804121b8 <vprintfmt+0x5c>
80412558:	00004797          	auipc	a5,0x4
8041255c:	b4c78793          	addi	a5,a5,-1204 # 804160a4 <error_string+0x224>
80412560:	00004417          	auipc	s0,0x4
80412564:	b4540413          	addi	s0,s0,-1211 # 804160a5 <error_string+0x225>
80412568:	00078513          	mv	a0,a5
8041256c:	000c8593          	mv	a1,s9
80412570:	01112623          	sw	a7,12(sp)
80412574:	00f12423          	sw	a5,8(sp)
80412578:	210000ef          	jal	ra,80412788 <strnlen>
8041257c:	40ad0d33          	sub	s10,s10,a0
80412580:	00812783          	lw	a5,8(sp)
80412584:	00c12883          	lw	a7,12(sp)
80412588:	03a05663          	blez	s10,804125b4 <vprintfmt+0x458>
8041258c:	00088513          	mv	a0,a7
80412590:	00090613          	mv	a2,s2
80412594:	00048593          	mv	a1,s1
80412598:	00f12623          	sw	a5,12(sp)
8041259c:	01112423          	sw	a7,8(sp)
804125a0:	fffd0d13          	addi	s10,s10,-1
804125a4:	000980e7          	jalr	s3
804125a8:	00812883          	lw	a7,8(sp)
804125ac:	00c12783          	lw	a5,12(sp)
804125b0:	fc0d1ee3          	bnez	s10,8041258c <vprintfmt+0x430>
804125b4:	0007c783          	lbu	a5,0(a5)
804125b8:	00078513          	mv	a0,a5
804125bc:	e20798e3          	bnez	a5,804123ec <vprintfmt+0x290>
804125c0:	bf9ff06f          	j	804121b8 <vprintfmt+0x5c>
804125c4:	000980e7          	jalr	s3
804125c8:	e4dff06f          	j	80412414 <vprintfmt+0x2b8>
804125cc:	007b0793          	addi	a5,s6,7
804125d0:	ff87f793          	andi	a5,a5,-8
804125d4:	00878b13          	addi	s6,a5,8
804125d8:	0007aa03          	lw	s4,0(a5)
804125dc:	0047a403          	lw	s0,4(a5)
804125e0:	d7dff06f          	j	8041235c <vprintfmt+0x200>
804125e4:	007b0793          	addi	a5,s6,7
804125e8:	ff87f793          	andi	a5,a5,-8
804125ec:	00878b13          	addi	s6,a5,8
804125f0:	0007a683          	lw	a3,0(a5)
804125f4:	0047a703          	lw	a4,4(a5)
804125f8:	01000793          	li	a5,16
804125fc:	cd5ff06f          	j	804122d0 <vprintfmt+0x174>
80412600:	007b0793          	addi	a5,s6,7
80412604:	ff87f793          	andi	a5,a5,-8
80412608:	00878b13          	addi	s6,a5,8
8041260c:	0007a683          	lw	a3,0(a5)
80412610:	0047a703          	lw	a4,4(a5)
80412614:	00800793          	li	a5,8
80412618:	cb9ff06f          	j	804122d0 <vprintfmt+0x174>
8041261c:	00090613          	mv	a2,s2
80412620:	00048593          	mv	a1,s1
80412624:	02d00513          	li	a0,45
80412628:	01112423          	sw	a7,8(sp)
8041262c:	000980e7          	jalr	s3
80412630:	414006b3          	neg	a3,s4
80412634:	00d037b3          	snez	a5,a3
80412638:	40800733          	neg	a4,s0
8041263c:	40f70733          	sub	a4,a4,a5
80412640:	00812883          	lw	a7,8(sp)
80412644:	00a00793          	li	a5,10
80412648:	c89ff06f          	j	804122d0 <vprintfmt+0x174>
8041264c:	007b0793          	addi	a5,s6,7
80412650:	ff87f793          	andi	a5,a5,-8
80412654:	00878b13          	addi	s6,a5,8
80412658:	0007a683          	lw	a3,0(a5)
8041265c:	0047a703          	lw	a4,4(a5)
80412660:	00a00793          	li	a5,10
80412664:	c6dff06f          	j	804122d0 <vprintfmt+0x174>
80412668:	01a05663          	blez	s10,80412674 <vprintfmt+0x518>
8041266c:	02d00793          	li	a5,45
80412670:	eef894e3          	bne	a7,a5,80412558 <vprintfmt+0x3fc>
80412674:	00004417          	auipc	s0,0x4
80412678:	a3140413          	addi	s0,s0,-1487 # 804160a5 <error_string+0x225>
8041267c:	02800513          	li	a0,40
80412680:	02800793          	li	a5,40
80412684:	d69ff06f          	j	804123ec <vprintfmt+0x290>

80412688 <printfmt>:
80412688:	fd010113          	addi	sp,sp,-48
8041268c:	02010313          	addi	t1,sp,32
80412690:	02e12023          	sw	a4,32(sp)
80412694:	00030713          	mv	a4,t1
80412698:	00112e23          	sw	ra,28(sp)
8041269c:	02f12223          	sw	a5,36(sp)
804126a0:	03012423          	sw	a6,40(sp)
804126a4:	03112623          	sw	a7,44(sp)
804126a8:	00612623          	sw	t1,12(sp)
804126ac:	ab1ff0ef          	jal	ra,8041215c <vprintfmt>
804126b0:	01c12083          	lw	ra,28(sp)
804126b4:	03010113          	addi	sp,sp,48
804126b8:	00008067          	ret

804126bc <vsnprintf>:
804126bc:	fff58593          	addi	a1,a1,-1
804126c0:	fe010113          	addi	sp,sp,-32
804126c4:	00b505b3          	add	a1,a0,a1
804126c8:	00112e23          	sw	ra,28(sp)
804126cc:	00a12223          	sw	a0,4(sp)
804126d0:	00b12423          	sw	a1,8(sp)
804126d4:	00012623          	sw	zero,12(sp)
804126d8:	04050063          	beqz	a0,80412718 <vsnprintf+0x5c>
804126dc:	02a5ee63          	bltu	a1,a0,80412718 <vsnprintf+0x5c>
804126e0:	ffff75b7          	lui	a1,0xffff7
804126e4:	00068713          	mv	a4,a3
804126e8:	00000517          	auipc	a0,0x0
804126ec:	a4c50513          	addi	a0,a0,-1460 # 80412134 <sprintputch>
804126f0:	00060693          	mv	a3,a2
804126f4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a219>
804126f8:	00410613          	addi	a2,sp,4
804126fc:	a61ff0ef          	jal	ra,8041215c <vprintfmt>
80412700:	00412783          	lw	a5,4(sp)
80412704:	00078023          	sb	zero,0(a5)
80412708:	00c12503          	lw	a0,12(sp)
8041270c:	01c12083          	lw	ra,28(sp)
80412710:	02010113          	addi	sp,sp,32
80412714:	00008067          	ret
80412718:	ffd00513          	li	a0,-3
8041271c:	ff1ff06f          	j	8041270c <vsnprintf+0x50>

80412720 <snprintf>:
80412720:	fc010113          	addi	sp,sp,-64
80412724:	02c10313          	addi	t1,sp,44
80412728:	02d12623          	sw	a3,44(sp)
8041272c:	00030693          	mv	a3,t1
80412730:	00112e23          	sw	ra,28(sp)
80412734:	02e12823          	sw	a4,48(sp)
80412738:	02f12a23          	sw	a5,52(sp)
8041273c:	03012c23          	sw	a6,56(sp)
80412740:	03112e23          	sw	a7,60(sp)
80412744:	00612623          	sw	t1,12(sp)
80412748:	f75ff0ef          	jal	ra,804126bc <vsnprintf>
8041274c:	01c12083          	lw	ra,28(sp)
80412750:	04010113          	addi	sp,sp,64
80412754:	00008067          	ret

80412758 <strlen>:
80412758:	00054783          	lbu	a5,0(a0)
8041275c:	02078063          	beqz	a5,8041277c <strlen+0x24>
80412760:	00000793          	li	a5,0
80412764:	00178793          	addi	a5,a5,1
80412768:	00f50733          	add	a4,a0,a5
8041276c:	00074703          	lbu	a4,0(a4)
80412770:	fe071ae3          	bnez	a4,80412764 <strlen+0xc>
80412774:	00078513          	mv	a0,a5
80412778:	00008067          	ret
8041277c:	00000793          	li	a5,0
80412780:	00078513          	mv	a0,a5
80412784:	00008067          	ret

80412788 <strnlen>:
80412788:	02058863          	beqz	a1,804127b8 <strnlen+0x30>
8041278c:	00054783          	lbu	a5,0(a0)
80412790:	02078463          	beqz	a5,804127b8 <strnlen+0x30>
80412794:	00000793          	li	a5,0
80412798:	00c0006f          	j	804127a4 <strnlen+0x1c>
8041279c:	00074703          	lbu	a4,0(a4)
804127a0:	00070863          	beqz	a4,804127b0 <strnlen+0x28>
804127a4:	00178793          	addi	a5,a5,1
804127a8:	00f50733          	add	a4,a0,a5
804127ac:	fef598e3          	bne	a1,a5,8041279c <strnlen+0x14>
804127b0:	00078513          	mv	a0,a5
804127b4:	00008067          	ret
804127b8:	00000793          	li	a5,0
804127bc:	00078513          	mv	a0,a5
804127c0:	00008067          	ret

804127c4 <strcpy>:
804127c4:	00050793          	mv	a5,a0
804127c8:	00158593          	addi	a1,a1,1
804127cc:	fff5c703          	lbu	a4,-1(a1)
804127d0:	00178793          	addi	a5,a5,1
804127d4:	fee78fa3          	sb	a4,-1(a5)
804127d8:	fe0718e3          	bnez	a4,804127c8 <strcpy+0x4>
804127dc:	00008067          	ret

804127e0 <strcmp>:
804127e0:	00054783          	lbu	a5,0(a0)
804127e4:	0005c703          	lbu	a4,0(a1)
804127e8:	00078e63          	beqz	a5,80412804 <strcmp+0x24>
804127ec:	00e79e63          	bne	a5,a4,80412808 <strcmp+0x28>
804127f0:	00150513          	addi	a0,a0,1
804127f4:	00054783          	lbu	a5,0(a0)
804127f8:	00158593          	addi	a1,a1,1
804127fc:	0005c703          	lbu	a4,0(a1)
80412800:	fe0796e3          	bnez	a5,804127ec <strcmp+0xc>
80412804:	00000793          	li	a5,0
80412808:	40e78533          	sub	a0,a5,a4
8041280c:	00008067          	ret

80412810 <strchr>:
80412810:	00054783          	lbu	a5,0(a0)
80412814:	00078e63          	beqz	a5,80412830 <strchr+0x20>
80412818:	00b79663          	bne	a5,a1,80412824 <strchr+0x14>
8041281c:	01c0006f          	j	80412838 <strchr+0x28>
80412820:	00b78a63          	beq	a5,a1,80412834 <strchr+0x24>
80412824:	00150513          	addi	a0,a0,1
80412828:	00054783          	lbu	a5,0(a0)
8041282c:	fe079ae3          	bnez	a5,80412820 <strchr+0x10>
80412830:	00000513          	li	a0,0
80412834:	00008067          	ret
80412838:	00008067          	ret

8041283c <memset>:
8041283c:	00060c63          	beqz	a2,80412854 <memset+0x18>
80412840:	00c50633          	add	a2,a0,a2
80412844:	00050793          	mv	a5,a0
80412848:	00178793          	addi	a5,a5,1
8041284c:	feb78fa3          	sb	a1,-1(a5)
80412850:	fec79ce3          	bne	a5,a2,80412848 <memset+0xc>
80412854:	00008067          	ret

80412858 <memmove>:
80412858:	02a5f663          	bgeu	a1,a0,80412884 <memmove+0x2c>
8041285c:	00c587b3          	add	a5,a1,a2
80412860:	02f57263          	bgeu	a0,a5,80412884 <memmove+0x2c>
80412864:	00c50733          	add	a4,a0,a2
80412868:	02060e63          	beqz	a2,804128a4 <memmove+0x4c>
8041286c:	fff78793          	addi	a5,a5,-1
80412870:	0007c683          	lbu	a3,0(a5)
80412874:	fff70713          	addi	a4,a4,-1
80412878:	00d70023          	sb	a3,0(a4)
8041287c:	fef598e3          	bne	a1,a5,8041286c <memmove+0x14>
80412880:	00008067          	ret
80412884:	00c586b3          	add	a3,a1,a2
80412888:	00050793          	mv	a5,a0
8041288c:	00060e63          	beqz	a2,804128a8 <memmove+0x50>
80412890:	00158593          	addi	a1,a1,1
80412894:	fff5c703          	lbu	a4,-1(a1)
80412898:	00178793          	addi	a5,a5,1
8041289c:	fee78fa3          	sb	a4,-1(a5)
804128a0:	fed598e3          	bne	a1,a3,80412890 <memmove+0x38>
804128a4:	00008067          	ret
804128a8:	00008067          	ret

804128ac <memcpy>:
804128ac:	02060063          	beqz	a2,804128cc <memcpy+0x20>
804128b0:	00c58633          	add	a2,a1,a2
804128b4:	00050793          	mv	a5,a0
804128b8:	00158593          	addi	a1,a1,1
804128bc:	fff5c703          	lbu	a4,-1(a1)
804128c0:	00178793          	addi	a5,a5,1
804128c4:	fee78fa3          	sb	a4,-1(a5)
804128c8:	fec598e3          	bne	a1,a2,804128b8 <memcpy+0xc>
804128cc:	00008067          	ret

804128d0 <__mulsi3>:
804128d0:	00050613          	mv	a2,a0
804128d4:	00000513          	li	a0,0
804128d8:	0015f693          	andi	a3,a1,1
804128dc:	00068463          	beqz	a3,804128e4 <__mulsi3+0x14>
804128e0:	00c50533          	add	a0,a0,a2
804128e4:	0015d593          	srli	a1,a1,0x1
804128e8:	00161613          	slli	a2,a2,0x1
804128ec:	fe0596e3          	bnez	a1,804128d8 <__mulsi3+0x8>
804128f0:	00008067          	ret

804128f4 <__divsi3>:
804128f4:	06054063          	bltz	a0,80412954 <__umodsi3+0x10>
804128f8:	0605c663          	bltz	a1,80412964 <__umodsi3+0x20>

804128fc <__udivsi3>:
804128fc:	00058613          	mv	a2,a1
80412900:	00050593          	mv	a1,a0
80412904:	fff00513          	li	a0,-1
80412908:	02060c63          	beqz	a2,80412940 <__udivsi3+0x44>
8041290c:	00100693          	li	a3,1
80412910:	00b67a63          	bgeu	a2,a1,80412924 <__udivsi3+0x28>
80412914:	00c05863          	blez	a2,80412924 <__udivsi3+0x28>
80412918:	00161613          	slli	a2,a2,0x1
8041291c:	00169693          	slli	a3,a3,0x1
80412920:	feb66ae3          	bltu	a2,a1,80412914 <__udivsi3+0x18>
80412924:	00000513          	li	a0,0
80412928:	00c5e663          	bltu	a1,a2,80412934 <__udivsi3+0x38>
8041292c:	40c585b3          	sub	a1,a1,a2
80412930:	00d56533          	or	a0,a0,a3
80412934:	0016d693          	srli	a3,a3,0x1
80412938:	00165613          	srli	a2,a2,0x1
8041293c:	fe0696e3          	bnez	a3,80412928 <__udivsi3+0x2c>
80412940:	00008067          	ret

80412944 <__umodsi3>:
80412944:	00008293          	mv	t0,ra
80412948:	fb5ff0ef          	jal	ra,804128fc <__udivsi3>
8041294c:	00058513          	mv	a0,a1
80412950:	00028067          	jr	t0
80412954:	40a00533          	neg	a0,a0
80412958:	0005d863          	bgez	a1,80412968 <__umodsi3+0x24>
8041295c:	40b005b3          	neg	a1,a1
80412960:	f9dff06f          	j	804128fc <__udivsi3>
80412964:	40b005b3          	neg	a1,a1
80412968:	00008293          	mv	t0,ra
8041296c:	f91ff0ef          	jal	ra,804128fc <__udivsi3>
80412970:	40a00533          	neg	a0,a0
80412974:	00028067          	jr	t0

80412978 <__modsi3>:
80412978:	00008293          	mv	t0,ra
8041297c:	0005ca63          	bltz	a1,80412990 <__modsi3+0x18>
80412980:	00054c63          	bltz	a0,80412998 <__modsi3+0x20>
80412984:	f79ff0ef          	jal	ra,804128fc <__udivsi3>
80412988:	00058513          	mv	a0,a1
8041298c:	00028067          	jr	t0
80412990:	40b005b3          	neg	a1,a1
80412994:	fe0558e3          	bgez	a0,80412984 <__modsi3+0xc>
80412998:	40a00533          	neg	a0,a0
8041299c:	f61ff0ef          	jal	ra,804128fc <__udivsi3>
804129a0:	40b00533          	neg	a0,a1
804129a4:	00028067          	jr	t0
