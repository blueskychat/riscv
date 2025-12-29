
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
8040002c:	26d120ef          	jal	ra,80412a98 <memset>
80400030:	03d000ef          	jal	ra,8040086c <cons_init>
80400034:	00013597          	auipc	a1,0x13
80400038:	bd058593          	addi	a1,a1,-1072 # 80412c04 <etext>
8040003c:	00013517          	auipc	a0,0x13
80400040:	be450513          	addi	a0,a0,-1052 # 80412c20 <etext+0x1c>
80400044:	1b8000ef          	jal	ra,804001fc <cprintf>
80400048:	294000ef          	jal	ra,804002dc <print_kerninfo>
8040004c:	391030ef          	jal	ra,80403bdc <pmm_init>
80400050:	3d5000ef          	jal	ra,80400c24 <pic_init>
80400054:	5b9000ef          	jal	ra,80400e0c <idt_init>
80400058:	35d040ef          	jal	ra,80404bb4 <vmm_init>
8040005c:	38d0c0ef          	jal	ra,8040cbe8 <sched_init>
80400060:	595080ef          	jal	ra,80408df4 <proc_init>
80400064:	161000ef          	jal	ra,804009c4 <ide_init>
80400068:	6ad030ef          	jal	ra,80403f14 <swap_init>
8040006c:	2b4060ef          	jal	ra,80406320 <fs_init>
80400070:	6e0000ef          	jal	ra,80400750 <clock_init>
80400074:	3a1000ef          	jal	ra,80400c14 <intr_enable>
80400078:	761080ef          	jal	ra,80408fd8 <cpu_idle>

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
804000b0:	b7c50513          	addi	a0,a0,-1156 # 80412c28 <etext+0x24>
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
804001e8:	1d0120ef          	jal	ra,804123b8 <vprintfmt>
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
80400248:	170120ef          	jal	ra,804123b8 <vprintfmt>
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
80400294:	720120ef          	jal	ra,804129b4 <strlen>
80400298:	00050413          	mv	s0,a0
8040029c:	00150513          	addi	a0,a0,1
804002a0:	720020ef          	jal	ra,804029c0 <kmalloc>
804002a4:	00050493          	mv	s1,a0
804002a8:	00050c63          	beqz	a0,804002c0 <strdup+0x44>
804002ac:	00040613          	mv	a2,s0
804002b0:	00090593          	mv	a1,s2
804002b4:	00848433          	add	s0,s1,s0
804002b8:	051120ef          	jal	ra,80412b08 <memcpy>
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
804002e0:	00013517          	auipc	a0,0x13
804002e4:	97450513          	addi	a0,a0,-1676 # 80412c54 <etext+0x50>
804002e8:	00112623          	sw	ra,12(sp)
804002ec:	f11ff0ef          	jal	ra,804001fc <cprintf>
804002f0:	00000597          	auipc	a1,0x0
804002f4:	d1c58593          	addi	a1,a1,-740 # 8040000c <kern_init>
804002f8:	00013517          	auipc	a0,0x13
804002fc:	97850513          	addi	a0,a0,-1672 # 80412c70 <etext+0x6c>
80400300:	efdff0ef          	jal	ra,804001fc <cprintf>
80400304:	00013597          	auipc	a1,0x13
80400308:	90058593          	addi	a1,a1,-1792 # 80412c04 <etext>
8040030c:	00013517          	auipc	a0,0x13
80400310:	98050513          	addi	a0,a0,-1664 # 80412c8c <etext+0x88>
80400314:	ee9ff0ef          	jal	ra,804001fc <cprintf>
80400318:	00099597          	auipc	a1,0x99
8040031c:	d3458593          	addi	a1,a1,-716 # 8049904c <edata>
80400320:	00013517          	auipc	a0,0x13
80400324:	98850513          	addi	a0,a0,-1656 # 80412ca8 <etext+0xa4>
80400328:	ed5ff0ef          	jal	ra,804001fc <cprintf>
8040032c:	0009c597          	auipc	a1,0x9c
80400330:	59058593          	addi	a1,a1,1424 # 8049c8bc <end>
80400334:	00013517          	auipc	a0,0x13
80400338:	99050513          	addi	a0,a0,-1648 # 80412cc4 <etext+0xc0>
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
80400368:	00013517          	auipc	a0,0x13
8040036c:	97850513          	addi	a0,a0,-1672 # 80412ce0 <etext+0xdc>
80400370:	01010113          	addi	sp,sp,16
80400374:	e89ff06f          	j	804001fc <cprintf>

80400378 <print_stackframe>:
80400378:	ff010113          	addi	sp,sp,-16
8040037c:	00013617          	auipc	a2,0x13
80400380:	8b060613          	addi	a2,a2,-1872 # 80412c2c <etext+0x28>
80400384:	05b00593          	li	a1,91
80400388:	00013517          	auipc	a0,0x13
8040038c:	8b850513          	addi	a0,a0,-1864 # 80412c40 <etext+0x3c>
80400390:	00112623          	sw	ra,12(sp)
80400394:	290000ef          	jal	ra,80400624 <__panic>

80400398 <mon_help>:
80400398:	ff010113          	addi	sp,sp,-16
8040039c:	00013617          	auipc	a2,0x13
804003a0:	a2860613          	addi	a2,a2,-1496 # 80412dc4 <commands+0xb8>
804003a4:	00013597          	auipc	a1,0x13
804003a8:	a4058593          	addi	a1,a1,-1472 # 80412de4 <commands+0xd8>
804003ac:	00013517          	auipc	a0,0x13
804003b0:	a4050513          	addi	a0,a0,-1472 # 80412dec <commands+0xe0>
804003b4:	00112623          	sw	ra,12(sp)
804003b8:	e45ff0ef          	jal	ra,804001fc <cprintf>
804003bc:	00013617          	auipc	a2,0x13
804003c0:	a3c60613          	addi	a2,a2,-1476 # 80412df8 <commands+0xec>
804003c4:	00013597          	auipc	a1,0x13
804003c8:	a5c58593          	addi	a1,a1,-1444 # 80412e20 <commands+0x114>
804003cc:	00013517          	auipc	a0,0x13
804003d0:	a2050513          	addi	a0,a0,-1504 # 80412dec <commands+0xe0>
804003d4:	e29ff0ef          	jal	ra,804001fc <cprintf>
804003d8:	00013617          	auipc	a2,0x13
804003dc:	a5460613          	addi	a2,a2,-1452 # 80412e2c <commands+0x120>
804003e0:	00013597          	auipc	a1,0x13
804003e4:	a6c58593          	addi	a1,a1,-1428 # 80412e4c <commands+0x140>
804003e8:	00013517          	auipc	a0,0x13
804003ec:	a0450513          	addi	a0,a0,-1532 # 80412dec <commands+0xe0>
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
80400448:	00013517          	auipc	a0,0x13
8040044c:	8e850513          	addi	a0,a0,-1816 # 80412d30 <commands+0x24>
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
80400480:	00013517          	auipc	a0,0x13
80400484:	8d850513          	addi	a0,a0,-1832 # 80412d58 <commands+0x4c>
80400488:	d75ff0ef          	jal	ra,804001fc <cprintf>
8040048c:	000c0663          	beqz	s8,80400498 <kmonitor+0x5c>
80400490:	000c0513          	mv	a0,s8
80400494:	3b5000ef          	jal	ra,80401048 <print_trapframe>
80400498:	00000513          	li	a0,0
8040049c:	00000593          	li	a1,0
804004a0:	00000613          	li	a2,0
804004a4:	00800893          	li	a7,8
804004a8:	00000073          	ecall
804004ac:	00013c97          	auipc	s9,0x13
804004b0:	860c8c93          	addi	s9,s9,-1952 # 80412d0c <commands>
804004b4:	00013997          	auipc	s3,0x13
804004b8:	8cc98993          	addi	s3,s3,-1844 # 80412d80 <commands+0x74>
804004bc:	00013917          	auipc	s2,0x13
804004c0:	8c890913          	addi	s2,s2,-1848 # 80412d84 <commands+0x78>
804004c4:	00f00a13          	li	s4,15
804004c8:	00013b17          	auipc	s6,0x13
804004cc:	8c4b0b13          	addi	s6,s6,-1852 # 80412d8c <commands+0x80>
804004d0:	00013a97          	auipc	s5,0x13
804004d4:	914a8a93          	addi	s5,s5,-1772 # 80412de4 <commands+0xd8>
804004d8:	00300b93          	li	s7,3
804004dc:	00098513          	mv	a0,s3
804004e0:	b9dff0ef          	jal	ra,8040007c <readline>
804004e4:	00050413          	mv	s0,a0
804004e8:	fe050ae3          	beqz	a0,804004dc <kmonitor+0xa0>
804004ec:	00054583          	lbu	a1,0(a0)
804004f0:	00000493          	li	s1,0
804004f4:	02058063          	beqz	a1,80400514 <kmonitor+0xd8>
804004f8:	00090513          	mv	a0,s2
804004fc:	570120ef          	jal	ra,80412a6c <strchr>
80400500:	0a050a63          	beqz	a0,804005b4 <kmonitor+0x178>
80400504:	00144583          	lbu	a1,1(s0)
80400508:	00040023          	sb	zero,0(s0)
8040050c:	00140413          	addi	s0,s0,1
80400510:	fe0594e3          	bnez	a1,804004f8 <kmonitor+0xbc>
80400514:	fc0484e3          	beqz	s1,804004dc <kmonitor+0xa0>
80400518:	00012583          	lw	a1,0(sp)
8040051c:	00012d17          	auipc	s10,0x12
80400520:	7f0d0d13          	addi	s10,s10,2032 # 80412d0c <commands>
80400524:	000a8513          	mv	a0,s5
80400528:	00000413          	li	s0,0
8040052c:	00cd0d13          	addi	s10,s10,12
80400530:	50c120ef          	jal	ra,80412a3c <strcmp>
80400534:	02050063          	beqz	a0,80400554 <kmonitor+0x118>
80400538:	00140413          	addi	s0,s0,1
8040053c:	0d740a63          	beq	s0,s7,80400610 <kmonitor+0x1d4>
80400540:	000d2503          	lw	a0,0(s10)
80400544:	00012583          	lw	a1,0(sp)
80400548:	00cd0d13          	addi	s10,s10,12
8040054c:	4f0120ef          	jal	ra,80412a3c <strcmp>
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
804005f0:	47c120ef          	jal	ra,80412a6c <strchr>
804005f4:	fe0506e3          	beqz	a0,804005e0 <kmonitor+0x1a4>
804005f8:	00044583          	lbu	a1,0(s0)
804005fc:	ef9ff06f          	j	804004f4 <kmonitor+0xb8>
80400600:	01000593          	li	a1,16
80400604:	000b0513          	mv	a0,s6
80400608:	bf5ff0ef          	jal	ra,804001fc <cprintf>
8040060c:	fb5ff06f          	j	804005c0 <kmonitor+0x184>
80400610:	00012583          	lw	a1,0(sp)
80400614:	00012517          	auipc	a0,0x12
80400618:	79850513          	addi	a0,a0,1944 # 80412dac <commands+0xa0>
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
80400674:	7e850513          	addi	a0,a0,2024 # 80412e58 <commands+0x14c>
80400678:	00f12623          	sw	a5,12(sp)
8040067c:	b81ff0ef          	jal	ra,804001fc <cprintf>
80400680:	00c12583          	lw	a1,12(sp)
80400684:	00040513          	mv	a0,s0
80400688:	b39ff0ef          	jal	ra,804001c0 <vcprintf>
8040068c:	00012517          	auipc	a0,0x12
80400690:	73450513          	addi	a0,a0,1844 # 80412dc0 <commands+0xb4>
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
804006c8:	7b050513          	addi	a0,a0,1968 # 80412e74 <commands+0x168>
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
804006f8:	6cc50513          	addi	a0,a0,1740 # 80412dc0 <commands+0xb4>
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
80400790:	70850513          	addi	a0,a0,1800 # 80412e94 <commands+0x188>
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
80400a3c:	47868693          	addi	a3,a3,1144 # 80412eb0 <commands+0x1a4>
80400a40:	00012617          	auipc	a2,0x12
80400a44:	48860613          	addi	a2,a2,1160 # 80412ec8 <commands+0x1bc>
80400a48:	01100593          	li	a1,17
80400a4c:	00012517          	auipc	a0,0x12
80400a50:	49450513          	addi	a0,a0,1172 # 80412ee0 <commands+0x1d4>
80400a54:	bd1ff0ef          	jal	ra,80400624 <__panic>
80400a58:	00012697          	auipc	a3,0x12
80400a5c:	49c68693          	addi	a3,a3,1180 # 80412ef4 <commands+0x1e8>
80400a60:	00012617          	auipc	a2,0x12
80400a64:	46860613          	addi	a2,a2,1128 # 80412ec8 <commands+0x1bc>
80400a68:	01400593          	li	a1,20
80400a6c:	00012517          	auipc	a0,0x12
80400a70:	47450513          	addi	a0,a0,1140 # 80412ee0 <commands+0x1d4>
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
80400b40:	3d068693          	addi	a3,a3,976 # 80412f0c <commands+0x200>
80400b44:	00012617          	auipc	a2,0x12
80400b48:	38460613          	addi	a2,a2,900 # 80412ec8 <commands+0x1bc>
80400b4c:	02200593          	li	a1,34
80400b50:	00012517          	auipc	a0,0x12
80400b54:	39050513          	addi	a0,a0,912 # 80412ee0 <commands+0x1d4>
80400b58:	acdff0ef          	jal	ra,80400624 <__panic>
80400b5c:	00012697          	auipc	a3,0x12
80400b60:	3d868693          	addi	a3,a3,984 # 80412f34 <commands+0x228>
80400b64:	00012617          	auipc	a2,0x12
80400b68:	36460613          	addi	a2,a2,868 # 80412ec8 <commands+0x1bc>
80400b6c:	02300593          	li	a1,35
80400b70:	00012517          	auipc	a0,0x12
80400b74:	37050513          	addi	a0,a0,880 # 80412ee0 <commands+0x1d4>
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
80400bd8:	33868693          	addi	a3,a3,824 # 80412f0c <commands+0x200>
80400bdc:	00012617          	auipc	a2,0x12
80400be0:	2ec60613          	addi	a2,a2,748 # 80412ec8 <commands+0x1bc>
80400be4:	02900593          	li	a1,41
80400be8:	00012517          	auipc	a0,0x12
80400bec:	2f850513          	addi	a0,a0,760 # 80412ee0 <commands+0x1d4>
80400bf0:	a35ff0ef          	jal	ra,80400624 <__panic>
80400bf4:	00012697          	auipc	a3,0x12
80400bf8:	34068693          	addi	a3,a3,832 # 80412f34 <commands+0x228>
80400bfc:	00012617          	auipc	a2,0x12
80400c00:	2cc60613          	addi	a2,a2,716 # 80412ec8 <commands+0x1bc>
80400c04:	02a00593          	li	a1,42
80400c08:	00012517          	auipc	a0,0x12
80400c0c:	2d850513          	addi	a0,a0,728 # 80412ee0 <commands+0x1d4>
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
80400c58:	6b1110ef          	jal	ra,80412b08 <memcpy>
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
80400c9c:	66d110ef          	jal	ra,80412b08 <memcpy>
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
80400ccc:	2c050513          	addi	a0,a0,704 # 80412f88 <commands+0x27c>
80400cd0:	d2cff0ef          	jal	ra,804001fc <cprintf>
80400cd4:	00c12083          	lw	ra,12(sp)
80400cd8:	00100513          	li	a0,1
80400cdc:	01010113          	addi	sp,sp,16
80400ce0:	00008067          	ret
80400ce4:	00012517          	auipc	a0,0x12
80400ce8:	28c50513          	addi	a0,a0,652 # 80412f70 <commands+0x264>
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
80400d2c:	56d110ef          	jal	ra,80412a98 <memset>
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
80400da4:	23c58593          	addi	a1,a1,572 # 80412fdc <commands+0x2d0>
80400da8:	479110ef          	jal	ra,80412a20 <strcpy>
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
80400df8:	1bc60613          	addi	a2,a2,444 # 80412fb0 <commands+0x2a4>
80400dfc:	03200593          	li	a1,50
80400e00:	00012517          	auipc	a0,0x12
80400e04:	1c450513          	addi	a0,a0,452 # 80412fc4 <commands+0x2b8>
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
80400e40:	57c50513          	addi	a0,a0,1404 # 804133b8 <commands+0x6ac>
80400e44:	00112623          	sw	ra,12(sp)
80400e48:	bb4ff0ef          	jal	ra,804001fc <cprintf>
80400e4c:	00442583          	lw	a1,4(s0)
80400e50:	00012517          	auipc	a0,0x12
80400e54:	57c50513          	addi	a0,a0,1404 # 804133cc <commands+0x6c0>
80400e58:	ba4ff0ef          	jal	ra,804001fc <cprintf>
80400e5c:	00842583          	lw	a1,8(s0)
80400e60:	00012517          	auipc	a0,0x12
80400e64:	58050513          	addi	a0,a0,1408 # 804133e0 <commands+0x6d4>
80400e68:	b94ff0ef          	jal	ra,804001fc <cprintf>
80400e6c:	00c42583          	lw	a1,12(s0)
80400e70:	00012517          	auipc	a0,0x12
80400e74:	58450513          	addi	a0,a0,1412 # 804133f4 <commands+0x6e8>
80400e78:	b84ff0ef          	jal	ra,804001fc <cprintf>
80400e7c:	01042583          	lw	a1,16(s0)
80400e80:	00012517          	auipc	a0,0x12
80400e84:	58850513          	addi	a0,a0,1416 # 80413408 <commands+0x6fc>
80400e88:	b74ff0ef          	jal	ra,804001fc <cprintf>
80400e8c:	01442583          	lw	a1,20(s0)
80400e90:	00012517          	auipc	a0,0x12
80400e94:	58c50513          	addi	a0,a0,1420 # 8041341c <commands+0x710>
80400e98:	b64ff0ef          	jal	ra,804001fc <cprintf>
80400e9c:	01842583          	lw	a1,24(s0)
80400ea0:	00012517          	auipc	a0,0x12
80400ea4:	59050513          	addi	a0,a0,1424 # 80413430 <commands+0x724>
80400ea8:	b54ff0ef          	jal	ra,804001fc <cprintf>
80400eac:	01c42583          	lw	a1,28(s0)
80400eb0:	00012517          	auipc	a0,0x12
80400eb4:	59450513          	addi	a0,a0,1428 # 80413444 <commands+0x738>
80400eb8:	b44ff0ef          	jal	ra,804001fc <cprintf>
80400ebc:	02042583          	lw	a1,32(s0)
80400ec0:	00012517          	auipc	a0,0x12
80400ec4:	59850513          	addi	a0,a0,1432 # 80413458 <commands+0x74c>
80400ec8:	b34ff0ef          	jal	ra,804001fc <cprintf>
80400ecc:	02442583          	lw	a1,36(s0)
80400ed0:	00012517          	auipc	a0,0x12
80400ed4:	59c50513          	addi	a0,a0,1436 # 8041346c <commands+0x760>
80400ed8:	b24ff0ef          	jal	ra,804001fc <cprintf>
80400edc:	02842583          	lw	a1,40(s0)
80400ee0:	00012517          	auipc	a0,0x12
80400ee4:	5a050513          	addi	a0,a0,1440 # 80413480 <commands+0x774>
80400ee8:	b14ff0ef          	jal	ra,804001fc <cprintf>
80400eec:	02c42583          	lw	a1,44(s0)
80400ef0:	00012517          	auipc	a0,0x12
80400ef4:	5a450513          	addi	a0,a0,1444 # 80413494 <commands+0x788>
80400ef8:	b04ff0ef          	jal	ra,804001fc <cprintf>
80400efc:	03042583          	lw	a1,48(s0)
80400f00:	00012517          	auipc	a0,0x12
80400f04:	5a850513          	addi	a0,a0,1448 # 804134a8 <commands+0x79c>
80400f08:	af4ff0ef          	jal	ra,804001fc <cprintf>
80400f0c:	03442583          	lw	a1,52(s0)
80400f10:	00012517          	auipc	a0,0x12
80400f14:	5ac50513          	addi	a0,a0,1452 # 804134bc <commands+0x7b0>
80400f18:	ae4ff0ef          	jal	ra,804001fc <cprintf>
80400f1c:	03842583          	lw	a1,56(s0)
80400f20:	00012517          	auipc	a0,0x12
80400f24:	5b050513          	addi	a0,a0,1456 # 804134d0 <commands+0x7c4>
80400f28:	ad4ff0ef          	jal	ra,804001fc <cprintf>
80400f2c:	03c42583          	lw	a1,60(s0)
80400f30:	00012517          	auipc	a0,0x12
80400f34:	5b450513          	addi	a0,a0,1460 # 804134e4 <commands+0x7d8>
80400f38:	ac4ff0ef          	jal	ra,804001fc <cprintf>
80400f3c:	04042583          	lw	a1,64(s0)
80400f40:	00012517          	auipc	a0,0x12
80400f44:	5b850513          	addi	a0,a0,1464 # 804134f8 <commands+0x7ec>
80400f48:	ab4ff0ef          	jal	ra,804001fc <cprintf>
80400f4c:	04442583          	lw	a1,68(s0)
80400f50:	00012517          	auipc	a0,0x12
80400f54:	5bc50513          	addi	a0,a0,1468 # 8041350c <commands+0x800>
80400f58:	aa4ff0ef          	jal	ra,804001fc <cprintf>
80400f5c:	04842583          	lw	a1,72(s0)
80400f60:	00012517          	auipc	a0,0x12
80400f64:	5c050513          	addi	a0,a0,1472 # 80413520 <commands+0x814>
80400f68:	a94ff0ef          	jal	ra,804001fc <cprintf>
80400f6c:	04c42583          	lw	a1,76(s0)
80400f70:	00012517          	auipc	a0,0x12
80400f74:	5c450513          	addi	a0,a0,1476 # 80413534 <commands+0x828>
80400f78:	a84ff0ef          	jal	ra,804001fc <cprintf>
80400f7c:	05042583          	lw	a1,80(s0)
80400f80:	00012517          	auipc	a0,0x12
80400f84:	5c850513          	addi	a0,a0,1480 # 80413548 <commands+0x83c>
80400f88:	a74ff0ef          	jal	ra,804001fc <cprintf>
80400f8c:	05442583          	lw	a1,84(s0)
80400f90:	00012517          	auipc	a0,0x12
80400f94:	5cc50513          	addi	a0,a0,1484 # 8041355c <commands+0x850>
80400f98:	a64ff0ef          	jal	ra,804001fc <cprintf>
80400f9c:	05842583          	lw	a1,88(s0)
80400fa0:	00012517          	auipc	a0,0x12
80400fa4:	5d050513          	addi	a0,a0,1488 # 80413570 <commands+0x864>
80400fa8:	a54ff0ef          	jal	ra,804001fc <cprintf>
80400fac:	05c42583          	lw	a1,92(s0)
80400fb0:	00012517          	auipc	a0,0x12
80400fb4:	5d450513          	addi	a0,a0,1492 # 80413584 <commands+0x878>
80400fb8:	a44ff0ef          	jal	ra,804001fc <cprintf>
80400fbc:	06042583          	lw	a1,96(s0)
80400fc0:	00012517          	auipc	a0,0x12
80400fc4:	5d850513          	addi	a0,a0,1496 # 80413598 <commands+0x88c>
80400fc8:	a34ff0ef          	jal	ra,804001fc <cprintf>
80400fcc:	06442583          	lw	a1,100(s0)
80400fd0:	00012517          	auipc	a0,0x12
80400fd4:	5dc50513          	addi	a0,a0,1500 # 804135ac <commands+0x8a0>
80400fd8:	a24ff0ef          	jal	ra,804001fc <cprintf>
80400fdc:	06842583          	lw	a1,104(s0)
80400fe0:	00012517          	auipc	a0,0x12
80400fe4:	5e050513          	addi	a0,a0,1504 # 804135c0 <commands+0x8b4>
80400fe8:	a14ff0ef          	jal	ra,804001fc <cprintf>
80400fec:	06c42583          	lw	a1,108(s0)
80400ff0:	00012517          	auipc	a0,0x12
80400ff4:	5e450513          	addi	a0,a0,1508 # 804135d4 <commands+0x8c8>
80400ff8:	a04ff0ef          	jal	ra,804001fc <cprintf>
80400ffc:	07042583          	lw	a1,112(s0)
80401000:	00012517          	auipc	a0,0x12
80401004:	5e850513          	addi	a0,a0,1512 # 804135e8 <commands+0x8dc>
80401008:	9f4ff0ef          	jal	ra,804001fc <cprintf>
8040100c:	07442583          	lw	a1,116(s0)
80401010:	00012517          	auipc	a0,0x12
80401014:	5ec50513          	addi	a0,a0,1516 # 804135fc <commands+0x8f0>
80401018:	9e4ff0ef          	jal	ra,804001fc <cprintf>
8040101c:	07842583          	lw	a1,120(s0)
80401020:	00012517          	auipc	a0,0x12
80401024:	5f050513          	addi	a0,a0,1520 # 80413610 <commands+0x904>
80401028:	9d4ff0ef          	jal	ra,804001fc <cprintf>
8040102c:	07c42583          	lw	a1,124(s0)
80401030:	00812403          	lw	s0,8(sp)
80401034:	00c12083          	lw	ra,12(sp)
80401038:	00012517          	auipc	a0,0x12
8040103c:	5ec50513          	addi	a0,a0,1516 # 80413624 <commands+0x918>
80401040:	01010113          	addi	sp,sp,16
80401044:	9b8ff06f          	j	804001fc <cprintf>

80401048 <print_trapframe>:
80401048:	ff010113          	addi	sp,sp,-16
8040104c:	00812423          	sw	s0,8(sp)
80401050:	00050593          	mv	a1,a0
80401054:	00050413          	mv	s0,a0
80401058:	00012517          	auipc	a0,0x12
8040105c:	5e050513          	addi	a0,a0,1504 # 80413638 <commands+0x92c>
80401060:	00112623          	sw	ra,12(sp)
80401064:	998ff0ef          	jal	ra,804001fc <cprintf>
80401068:	00040513          	mv	a0,s0
8040106c:	dc1ff0ef          	jal	ra,80400e2c <print_regs>
80401070:	08042583          	lw	a1,128(s0)
80401074:	00012517          	auipc	a0,0x12
80401078:	5d850513          	addi	a0,a0,1496 # 8041364c <commands+0x940>
8040107c:	980ff0ef          	jal	ra,804001fc <cprintf>
80401080:	08442583          	lw	a1,132(s0)
80401084:	00012517          	auipc	a0,0x12
80401088:	5dc50513          	addi	a0,a0,1500 # 80413660 <commands+0x954>
8040108c:	970ff0ef          	jal	ra,804001fc <cprintf>
80401090:	08842583          	lw	a1,136(s0)
80401094:	00012517          	auipc	a0,0x12
80401098:	5e050513          	addi	a0,a0,1504 # 80413674 <commands+0x968>
8040109c:	960ff0ef          	jal	ra,804001fc <cprintf>
804010a0:	08c42583          	lw	a1,140(s0)
804010a4:	00812403          	lw	s0,8(sp)
804010a8:	00c12083          	lw	ra,12(sp)
804010ac:	00012517          	auipc	a0,0x12
804010b0:	5dc50513          	addi	a0,a0,1500 # 80413688 <commands+0x97c>
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
804010e8:	27050513          	addi	a0,a0,624 # 80413354 <commands+0x648>
804010ec:	910ff0ef          	jal	ra,804001fc <cprintf>
804010f0:	08c42583          	lw	a1,140(s0)
804010f4:	00d00793          	li	a5,13
804010f8:	08f58463          	beq	a1,a5,80401180 <pgfault_handler+0xc4>
804010fc:	00f00793          	li	a5,15
80401100:	08f58863          	beq	a1,a5,80401190 <pgfault_handler+0xd4>
80401104:	00014517          	auipc	a0,0x14
80401108:	aac50513          	addi	a0,a0,-1364 # 80414bb0 <CSWTCH.69+0x830>
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
8040114c:	26d0306f          	j	80404bb8 <do_pgfault>
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
8040117c:	23d0306f          	j	80404bb8 <do_pgfault>
80401180:	00012517          	auipc	a0,0x12
80401184:	1f050513          	addi	a0,a0,496 # 80413370 <commands+0x664>
80401188:	874ff0ef          	jal	ra,804001fc <cprintf>
8040118c:	f85ff06f          	j	80401110 <pgfault_handler+0x54>
80401190:	00012517          	auipc	a0,0x12
80401194:	1e450513          	addi	a0,a0,484 # 80413374 <commands+0x668>
80401198:	864ff0ef          	jal	ra,804001fc <cprintf>
8040119c:	f75ff06f          	j	80401110 <pgfault_handler+0x54>
804011a0:	00012697          	auipc	a3,0x12
804011a4:	1d868693          	addi	a3,a3,472 # 80413378 <commands+0x66c>
804011a8:	00012617          	auipc	a2,0x12
804011ac:	d2060613          	addi	a2,a2,-736 # 80412ec8 <commands+0x1bc>
804011b0:	08700593          	li	a1,135
804011b4:	00012517          	auipc	a0,0x12
804011b8:	1d850513          	addi	a0,a0,472 # 8041338c <commands+0x680>
804011bc:	c68ff0ef          	jal	ra,80400624 <__panic>
804011c0:	00040513          	mv	a0,s0
804011c4:	e85ff0ef          	jal	ra,80401048 <print_trapframe>
804011c8:	08842583          	lw	a1,136(s0)
804011cc:	00012517          	auipc	a0,0x12
804011d0:	18850513          	addi	a0,a0,392 # 80413354 <commands+0x648>
804011d4:	828ff0ef          	jal	ra,804001fc <cprintf>
804011d8:	08c42583          	lw	a1,140(s0)
804011dc:	00d00793          	li	a5,13
804011e0:	02f58863          	beq	a1,a5,80401210 <pgfault_handler+0x154>
804011e4:	00f00793          	li	a5,15
804011e8:	02f58c63          	beq	a1,a5,80401220 <pgfault_handler+0x164>
804011ec:	00014517          	auipc	a0,0x14
804011f0:	9c450513          	addi	a0,a0,-1596 # 80414bb0 <CSWTCH.69+0x830>
804011f4:	808ff0ef          	jal	ra,804001fc <cprintf>
804011f8:	00012617          	auipc	a2,0x12
804011fc:	1a860613          	addi	a2,a2,424 # 804133a0 <commands+0x694>
80401200:	08e00593          	li	a1,142
80401204:	00012517          	auipc	a0,0x12
80401208:	18850513          	addi	a0,a0,392 # 8041338c <commands+0x680>
8040120c:	c18ff0ef          	jal	ra,80400624 <__panic>
80401210:	00012517          	auipc	a0,0x12
80401214:	16050513          	addi	a0,a0,352 # 80413370 <commands+0x664>
80401218:	fe5fe0ef          	jal	ra,804001fc <cprintf>
8040121c:	fddff06f          	j	804011f8 <pgfault_handler+0x13c>
80401220:	00012517          	auipc	a0,0x12
80401224:	15450513          	addi	a0,a0,340 # 80413374 <commands+0x668>
80401228:	fd5fe0ef          	jal	ra,804001fc <cprintf>
8040122c:	fcdff06f          	j	804011f8 <pgfault_handler+0x13c>

80401230 <interrupt_handler>:
80401230:	08c52783          	lw	a5,140(a0)
80401234:	00b00713          	li	a4,11
80401238:	00179793          	slli	a5,a5,0x1
8040123c:	0017d793          	srli	a5,a5,0x1
80401240:	10f76663          	bltu	a4,a5,8040134c <interrupt_handler+0x11c>
80401244:	00012717          	auipc	a4,0x12
80401248:	da470713          	addi	a4,a4,-604 # 80412fe8 <commands+0x2dc>
8040124c:	00279793          	slli	a5,a5,0x2
80401250:	00e787b3          	add	a5,a5,a4
80401254:	0007a783          	lw	a5,0(a5)
80401258:	ff010113          	addi	sp,sp,-16
8040125c:	00112623          	sw	ra,12(sp)
80401260:	00e787b3          	add	a5,a5,a4
80401264:	00078067          	jr	a5
80401268:	00c12083          	lw	ra,12(sp)
8040126c:	00012517          	auipc	a0,0x12
80401270:	03c50513          	addi	a0,a0,60 # 804132a8 <commands+0x59c>
80401274:	01010113          	addi	sp,sp,16
80401278:	f85fe06f          	j	804001fc <cprintf>
8040127c:	00c12083          	lw	ra,12(sp)
80401280:	00012517          	auipc	a0,0x12
80401284:	00850513          	addi	a0,a0,8 # 80413288 <commands+0x57c>
80401288:	01010113          	addi	sp,sp,16
8040128c:	f71fe06f          	j	804001fc <cprintf>
80401290:	00012517          	auipc	a0,0x12
80401294:	fd850513          	addi	a0,a0,-40 # 80413268 <commands+0x55c>
80401298:	f65fe0ef          	jal	ra,804001fc <cprintf>
8040129c:	d5cff0ef          	jal	ra,804007f8 <serial_intr>
804012a0:	e58ff0ef          	jal	ra,804008f8 <cons_getc>
804012a4:	00c12083          	lw	ra,12(sp)
804012a8:	01010113          	addi	sp,sp,16
804012ac:	7a10d06f          	j	8040f24c <dev_stdin_write>
804012b0:	00c12083          	lw	ra,12(sp)
804012b4:	00012517          	auipc	a0,0x12
804012b8:	01050513          	addi	a0,a0,16 # 804132c4 <commands+0x5b8>
804012bc:	01010113          	addi	sp,sp,16
804012c0:	f3dfe06f          	j	804001fc <cprintf>
804012c4:	00c12083          	lw	ra,12(sp)
804012c8:	00012517          	auipc	a0,0x12
804012cc:	03050513          	addi	a0,a0,48 # 804132f8 <commands+0x5ec>
804012d0:	01010113          	addi	sp,sp,16
804012d4:	f29fe06f          	j	804001fc <cprintf>
804012d8:	00c12083          	lw	ra,12(sp)
804012dc:	00012517          	auipc	a0,0x12
804012e0:	f7050513          	addi	a0,a0,-144 # 8041324c <commands+0x540>
804012e4:	01010113          	addi	sp,sp,16
804012e8:	f15fe06f          	j	804001fc <cprintf>
804012ec:	c24ff0ef          	jal	ra,80400710 <clock_set_next_event>
804012f0:	0009b797          	auipc	a5,0x9b
804012f4:	4fc78793          	addi	a5,a5,1276 # 8049c7ec <ticks>
804012f8:	0007a783          	lw	a5,0(a5)
804012fc:	00178793          	addi	a5,a5,1
80401300:	0009b717          	auipc	a4,0x9b
80401304:	4ef72623          	sw	a5,1260(a4) # 8049c7ec <ticks>
80401308:	5610b0ef          	jal	ra,8040d068 <run_timer_list>
8040130c:	f91ff06f          	j	8040129c <interrupt_handler+0x6c>
80401310:	00c12083          	lw	ra,12(sp)
80401314:	00012517          	auipc	a0,0x12
80401318:	00450513          	addi	a0,a0,4 # 80413318 <commands+0x60c>
8040131c:	01010113          	addi	sp,sp,16
80401320:	eddfe06f          	j	804001fc <cprintf>
80401324:	00c12083          	lw	ra,12(sp)
80401328:	00012517          	auipc	a0,0x12
8040132c:	01050513          	addi	a0,a0,16 # 80413338 <commands+0x62c>
80401330:	01010113          	addi	sp,sp,16
80401334:	ec9fe06f          	j	804001fc <cprintf>
80401338:	00c12083          	lw	ra,12(sp)
8040133c:	00012517          	auipc	a0,0x12
80401340:	fa050513          	addi	a0,a0,-96 # 804132dc <commands+0x5d0>
80401344:	01010113          	addi	sp,sp,16
80401348:	eb5fe06f          	j	804001fc <cprintf>
8040134c:	cfdff06f          	j	80401048 <print_trapframe>

80401350 <exception_handler>:
80401350:	08c52783          	lw	a5,140(a0)
80401354:	00f00713          	li	a4,15
80401358:	22f76263          	bltu	a4,a5,8040157c <exception_handler+0x22c>
8040135c:	00012717          	auipc	a4,0x12
80401360:	cbc70713          	addi	a4,a4,-836 # 80413018 <commands+0x30c>
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
80401390:	d8c50513          	addi	a0,a0,-628 # 80413118 <commands+0x40c>
80401394:	e69fe0ef          	jal	ra,804001fc <cprintf>
80401398:	08442783          	lw	a5,132(s0)
8040139c:	00c12083          	lw	ra,12(sp)
804013a0:	00412483          	lw	s1,4(sp)
804013a4:	00478793          	addi	a5,a5,4
804013a8:	08f42223          	sw	a5,132(s0)
804013ac:	00812403          	lw	s0,8(sp)
804013b0:	01010113          	addi	sp,sp,16
804013b4:	7b90b06f          	j	8040d36c <syscall>
804013b8:	00012517          	auipc	a0,0x12
804013bc:	d8050513          	addi	a0,a0,-640 # 80413138 <commands+0x42c>
804013c0:	00812403          	lw	s0,8(sp)
804013c4:	00c12083          	lw	ra,12(sp)
804013c8:	00412483          	lw	s1,4(sp)
804013cc:	01010113          	addi	sp,sp,16
804013d0:	e2dfe06f          	j	804001fc <cprintf>
804013d4:	00012517          	auipc	a0,0x12
804013d8:	d8450513          	addi	a0,a0,-636 # 80413158 <commands+0x44c>
804013dc:	fe5ff06f          	j	804013c0 <exception_handler+0x70>
804013e0:	00012517          	auipc	a0,0x12
804013e4:	d9850513          	addi	a0,a0,-616 # 80413178 <commands+0x46c>
804013e8:	fd9ff06f          	j	804013c0 <exception_handler+0x70>
804013ec:	00012517          	auipc	a0,0x12
804013f0:	da450513          	addi	a0,a0,-604 # 80413190 <commands+0x484>
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
80401420:	e1850513          	addi	a0,a0,-488 # 80413234 <commands+0x528>
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
80401464:	d6460613          	addi	a2,a2,-668 # 804131c4 <commands+0x4b8>
80401468:	11900593          	li	a1,281
8040146c:	00012517          	auipc	a0,0x12
80401470:	f2050513          	addi	a0,a0,-224 # 8041338c <commands+0x680>
80401474:	9b0ff0ef          	jal	ra,80400624 <__panic>
80401478:	00012517          	auipc	a0,0x12
8040147c:	be050513          	addi	a0,a0,-1056 # 80413058 <commands+0x34c>
80401480:	f41ff06f          	j	804013c0 <exception_handler+0x70>
80401484:	00012517          	auipc	a0,0x12
80401488:	bf450513          	addi	a0,a0,-1036 # 80413078 <commands+0x36c>
8040148c:	f35ff06f          	j	804013c0 <exception_handler+0x70>
80401490:	00012517          	auipc	a0,0x12
80401494:	c0450513          	addi	a0,a0,-1020 # 80413094 <commands+0x388>
80401498:	f29ff06f          	j	804013c0 <exception_handler+0x70>
8040149c:	00012517          	auipc	a0,0x12
804014a0:	c1050513          	addi	a0,a0,-1008 # 804130ac <commands+0x3a0>
804014a4:	f1dff06f          	j	804013c0 <exception_handler+0x70>
804014a8:	00012517          	auipc	a0,0x12
804014ac:	c1050513          	addi	a0,a0,-1008 # 804130b8 <commands+0x3ac>
804014b0:	f11ff06f          	j	804013c0 <exception_handler+0x70>
804014b4:	00012517          	auipc	a0,0x12
804014b8:	c2050513          	addi	a0,a0,-992 # 804130d4 <commands+0x3c8>
804014bc:	f05ff06f          	j	804013c0 <exception_handler+0x70>
804014c0:	00012517          	auipc	a0,0x12
804014c4:	c2850513          	addi	a0,a0,-984 # 804130e8 <commands+0x3dc>
804014c8:	ef9ff06f          	j	804013c0 <exception_handler+0x70>
804014cc:	00012517          	auipc	a0,0x12
804014d0:	c3450513          	addi	a0,a0,-972 # 80413100 <commands+0x3f4>
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
80401518:	cb060613          	addi	a2,a2,-848 # 804131c4 <commands+0x4b8>
8040151c:	10800593          	li	a1,264
80401520:	00012517          	auipc	a0,0x12
80401524:	e6c50513          	addi	a0,a0,-404 # 8041338c <commands+0x680>
80401528:	8fcff0ef          	jal	ra,80400624 <__panic>
8040152c:	00012517          	auipc	a0,0x12
80401530:	cc850513          	addi	a0,a0,-824 # 804131f4 <commands+0x4e8>
80401534:	cc9fe0ef          	jal	ra,804001fc <cprintf>
80401538:	00048693          	mv	a3,s1
8040153c:	00012617          	auipc	a2,0x12
80401540:	ccc60613          	addi	a2,a2,-820 # 80413208 <commands+0x4fc>
80401544:	11c00593          	li	a1,284
80401548:	00012517          	auipc	a0,0x12
8040154c:	e4450513          	addi	a0,a0,-444 # 8041338c <commands+0x680>
80401550:	8d4ff0ef          	jal	ra,80400624 <__panic>
80401554:	00012517          	auipc	a0,0x12
80401558:	ca050513          	addi	a0,a0,-864 # 804131f4 <commands+0x4e8>
8040155c:	ca1fe0ef          	jal	ra,804001fc <cprintf>
80401560:	00048693          	mv	a3,s1
80401564:	00012617          	auipc	a2,0x12
80401568:	ca460613          	addi	a2,a2,-860 # 80413208 <commands+0x4fc>
8040156c:	10b00593          	li	a1,267
80401570:	00012517          	auipc	a0,0x12
80401574:	e1c50513          	addi	a0,a0,-484 # 8041338c <commands+0x680>
80401578:	8acff0ef          	jal	ra,80400624 <__panic>
8040157c:	acdff06f          	j	80401048 <print_trapframe>
80401580:	00048693          	mv	a3,s1
80401584:	00012617          	auipc	a2,0x12
80401588:	c2060613          	addi	a2,a2,-992 # 804131a4 <commands+0x498>
8040158c:	10400593          	li	a1,260
80401590:	00012517          	auipc	a0,0x12
80401594:	dfc50513          	addi	a0,a0,-516 # 8041338c <commands+0x680>
80401598:	88cff0ef          	jal	ra,80400624 <__panic>
8040159c:	00048693          	mv	a3,s1
804015a0:	00012617          	auipc	a2,0x12
804015a4:	c0460613          	addi	a2,a2,-1020 # 804131a4 <commands+0x498>
804015a8:	11500593          	li	a1,277
804015ac:	00012517          	auipc	a0,0x12
804015b0:	de050513          	addi	a0,a0,-544 # 8041338c <commands+0x680>
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
80401680:	6d80b06f          	j	8040cd58 <schedule>
80401684:	ff700513          	li	a0,-9
80401688:	5f4060ef          	jal	ra,80407c7c <do_exit>
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
80401944:	dc870713          	addi	a4,a4,-568 # 80416708 <nbase>
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
80401c80:	00012697          	auipc	a3,0x12
80401c84:	a1c68693          	addi	a3,a3,-1508 # 8041369c <commands+0x990>
80401c88:	00011617          	auipc	a2,0x11
80401c8c:	24060613          	addi	a2,a2,576 # 80412ec8 <commands+0x1bc>
80401c90:	0f000593          	li	a1,240
80401c94:	00012517          	auipc	a0,0x12
80401c98:	a1850513          	addi	a0,a0,-1512 # 804136ac <commands+0x9a0>
80401c9c:	989fe0ef          	jal	ra,80400624 <__panic>
80401ca0:	00012697          	auipc	a3,0x12
80401ca4:	a9468693          	addi	a3,a3,-1388 # 80413734 <commands+0xa28>
80401ca8:	00011617          	auipc	a2,0x11
80401cac:	22060613          	addi	a2,a2,544 # 80412ec8 <commands+0x1bc>
80401cb0:	0bd00593          	li	a1,189
80401cb4:	00012517          	auipc	a0,0x12
80401cb8:	9f850513          	addi	a0,a0,-1544 # 804136ac <commands+0x9a0>
80401cbc:	969fe0ef          	jal	ra,80400624 <__panic>
80401cc0:	00012697          	auipc	a3,0x12
80401cc4:	a9868693          	addi	a3,a3,-1384 # 80413758 <commands+0xa4c>
80401cc8:	00011617          	auipc	a2,0x11
80401ccc:	20060613          	addi	a2,a2,512 # 80412ec8 <commands+0x1bc>
80401cd0:	0be00593          	li	a1,190
80401cd4:	00012517          	auipc	a0,0x12
80401cd8:	9d850513          	addi	a0,a0,-1576 # 804136ac <commands+0x9a0>
80401cdc:	949fe0ef          	jal	ra,80400624 <__panic>
80401ce0:	00012697          	auipc	a3,0x12
80401ce4:	ab468693          	addi	a3,a3,-1356 # 80413794 <commands+0xa88>
80401ce8:	00011617          	auipc	a2,0x11
80401cec:	1e060613          	addi	a2,a2,480 # 80412ec8 <commands+0x1bc>
80401cf0:	0c000593          	li	a1,192
80401cf4:	00012517          	auipc	a0,0x12
80401cf8:	9b850513          	addi	a0,a0,-1608 # 804136ac <commands+0x9a0>
80401cfc:	929fe0ef          	jal	ra,80400624 <__panic>
80401d00:	00012697          	auipc	a3,0x12
80401d04:	b1c68693          	addi	a3,a3,-1252 # 8041381c <commands+0xb10>
80401d08:	00011617          	auipc	a2,0x11
80401d0c:	1c060613          	addi	a2,a2,448 # 80412ec8 <commands+0x1bc>
80401d10:	0d900593          	li	a1,217
80401d14:	00012517          	auipc	a0,0x12
80401d18:	99850513          	addi	a0,a0,-1640 # 804136ac <commands+0x9a0>
80401d1c:	909fe0ef          	jal	ra,80400624 <__panic>
80401d20:	00012697          	auipc	a3,0x12
80401d24:	9c068693          	addi	a3,a3,-1600 # 804136e0 <commands+0x9d4>
80401d28:	00011617          	auipc	a2,0x11
80401d2c:	1a060613          	addi	a2,a2,416 # 80412ec8 <commands+0x1bc>
80401d30:	0d200593          	li	a1,210
80401d34:	00012517          	auipc	a0,0x12
80401d38:	97850513          	addi	a0,a0,-1672 # 804136ac <commands+0x9a0>
80401d3c:	8e9fe0ef          	jal	ra,80400624 <__panic>
80401d40:	00012697          	auipc	a3,0x12
80401d44:	acc68693          	addi	a3,a3,-1332 # 8041380c <commands+0xb00>
80401d48:	00011617          	auipc	a2,0x11
80401d4c:	18060613          	addi	a2,a2,384 # 80412ec8 <commands+0x1bc>
80401d50:	0d000593          	li	a1,208
80401d54:	00012517          	auipc	a0,0x12
80401d58:	95850513          	addi	a0,a0,-1704 # 804136ac <commands+0x9a0>
80401d5c:	8c9fe0ef          	jal	ra,80400624 <__panic>
80401d60:	00012697          	auipc	a3,0x12
80401d64:	a9468693          	addi	a3,a3,-1388 # 804137f4 <commands+0xae8>
80401d68:	00011617          	auipc	a2,0x11
80401d6c:	16060613          	addi	a2,a2,352 # 80412ec8 <commands+0x1bc>
80401d70:	0cb00593          	li	a1,203
80401d74:	00012517          	auipc	a0,0x12
80401d78:	93850513          	addi	a0,a0,-1736 # 804136ac <commands+0x9a0>
80401d7c:	8a9fe0ef          	jal	ra,80400624 <__panic>
80401d80:	00012697          	auipc	a3,0x12
80401d84:	a5468693          	addi	a3,a3,-1452 # 804137d4 <commands+0xac8>
80401d88:	00011617          	auipc	a2,0x11
80401d8c:	14060613          	addi	a2,a2,320 # 80412ec8 <commands+0x1bc>
80401d90:	0c200593          	li	a1,194
80401d94:	00012517          	auipc	a0,0x12
80401d98:	91850513          	addi	a0,a0,-1768 # 804136ac <commands+0x9a0>
80401d9c:	889fe0ef          	jal	ra,80400624 <__panic>
80401da0:	00012697          	auipc	a3,0x12
80401da4:	ac068693          	addi	a3,a3,-1344 # 80413860 <commands+0xb54>
80401da8:	00011617          	auipc	a2,0x11
80401dac:	12060613          	addi	a2,a2,288 # 80412ec8 <commands+0x1bc>
80401db0:	0f800593          	li	a1,248
80401db4:	00012517          	auipc	a0,0x12
80401db8:	8f850513          	addi	a0,a0,-1800 # 804136ac <commands+0x9a0>
80401dbc:	869fe0ef          	jal	ra,80400624 <__panic>
80401dc0:	00012697          	auipc	a3,0x12
80401dc4:	a9068693          	addi	a3,a3,-1392 # 80413850 <commands+0xb44>
80401dc8:	00011617          	auipc	a2,0x11
80401dcc:	10060613          	addi	a2,a2,256 # 80412ec8 <commands+0x1bc>
80401dd0:	0df00593          	li	a1,223
80401dd4:	00012517          	auipc	a0,0x12
80401dd8:	8d850513          	addi	a0,a0,-1832 # 804136ac <commands+0x9a0>
80401ddc:	849fe0ef          	jal	ra,80400624 <__panic>
80401de0:	00012697          	auipc	a3,0x12
80401de4:	a1468693          	addi	a3,a3,-1516 # 804137f4 <commands+0xae8>
80401de8:	00011617          	auipc	a2,0x11
80401dec:	0e060613          	addi	a2,a2,224 # 80412ec8 <commands+0x1bc>
80401df0:	0dd00593          	li	a1,221
80401df4:	00012517          	auipc	a0,0x12
80401df8:	8b850513          	addi	a0,a0,-1864 # 804136ac <commands+0x9a0>
80401dfc:	829fe0ef          	jal	ra,80400624 <__panic>
80401e00:	00012697          	auipc	a3,0x12
80401e04:	a3468693          	addi	a3,a3,-1484 # 80413834 <commands+0xb28>
80401e08:	00011617          	auipc	a2,0x11
80401e0c:	0c060613          	addi	a2,a2,192 # 80412ec8 <commands+0x1bc>
80401e10:	0dc00593          	li	a1,220
80401e14:	00012517          	auipc	a0,0x12
80401e18:	89850513          	addi	a0,a0,-1896 # 804136ac <commands+0x9a0>
80401e1c:	809fe0ef          	jal	ra,80400624 <__panic>
80401e20:	00012697          	auipc	a3,0x12
80401e24:	8c068693          	addi	a3,a3,-1856 # 804136e0 <commands+0x9d4>
80401e28:	00011617          	auipc	a2,0x11
80401e2c:	0a060613          	addi	a2,a2,160 # 80412ec8 <commands+0x1bc>
80401e30:	0b900593          	li	a1,185
80401e34:	00012517          	auipc	a0,0x12
80401e38:	87850513          	addi	a0,a0,-1928 # 804136ac <commands+0x9a0>
80401e3c:	fe8fe0ef          	jal	ra,80400624 <__panic>
80401e40:	00012697          	auipc	a3,0x12
80401e44:	9b468693          	addi	a3,a3,-1612 # 804137f4 <commands+0xae8>
80401e48:	00011617          	auipc	a2,0x11
80401e4c:	08060613          	addi	a2,a2,128 # 80412ec8 <commands+0x1bc>
80401e50:	0d600593          	li	a1,214
80401e54:	00012517          	auipc	a0,0x12
80401e58:	85850513          	addi	a0,a0,-1960 # 804136ac <commands+0x9a0>
80401e5c:	fc8fe0ef          	jal	ra,80400624 <__panic>
80401e60:	00012697          	auipc	a3,0x12
80401e64:	8b868693          	addi	a3,a3,-1864 # 80413718 <commands+0xa0c>
80401e68:	00011617          	auipc	a2,0x11
80401e6c:	06060613          	addi	a2,a2,96 # 80412ec8 <commands+0x1bc>
80401e70:	0d400593          	li	a1,212
80401e74:	00012517          	auipc	a0,0x12
80401e78:	83850513          	addi	a0,a0,-1992 # 804136ac <commands+0x9a0>
80401e7c:	fa8fe0ef          	jal	ra,80400624 <__panic>
80401e80:	00012697          	auipc	a3,0x12
80401e84:	87c68693          	addi	a3,a3,-1924 # 804136fc <commands+0x9f0>
80401e88:	00011617          	auipc	a2,0x11
80401e8c:	04060613          	addi	a2,a2,64 # 80412ec8 <commands+0x1bc>
80401e90:	0d300593          	li	a1,211
80401e94:	00012517          	auipc	a0,0x12
80401e98:	81850513          	addi	a0,a0,-2024 # 804136ac <commands+0x9a0>
80401e9c:	f88fe0ef          	jal	ra,80400624 <__panic>
80401ea0:	00012697          	auipc	a3,0x12
80401ea4:	87868693          	addi	a3,a3,-1928 # 80413718 <commands+0xa0c>
80401ea8:	00011617          	auipc	a2,0x11
80401eac:	02060613          	addi	a2,a2,32 # 80412ec8 <commands+0x1bc>
80401eb0:	0bb00593          	li	a1,187
80401eb4:	00011517          	auipc	a0,0x11
80401eb8:	7f850513          	addi	a0,a0,2040 # 804136ac <commands+0x9a0>
80401ebc:	f68fe0ef          	jal	ra,80400624 <__panic>
80401ec0:	00012697          	auipc	a3,0x12
80401ec4:	ae468693          	addi	a3,a3,-1308 # 804139a4 <commands+0xc98>
80401ec8:	00011617          	auipc	a2,0x11
80401ecc:	00060613          	mv	a2,a2
80401ed0:	12500593          	li	a1,293
80401ed4:	00011517          	auipc	a0,0x11
80401ed8:	7d850513          	addi	a0,a0,2008 # 804136ac <commands+0x9a0>
80401edc:	f48fe0ef          	jal	ra,80400624 <__panic>
80401ee0:	00012697          	auipc	a3,0x12
80401ee4:	97068693          	addi	a3,a3,-1680 # 80413850 <commands+0xb44>
80401ee8:	00011617          	auipc	a2,0x11
80401eec:	fe060613          	addi	a2,a2,-32 # 80412ec8 <commands+0x1bc>
80401ef0:	11a00593          	li	a1,282
80401ef4:	00011517          	auipc	a0,0x11
80401ef8:	7b850513          	addi	a0,a0,1976 # 804136ac <commands+0x9a0>
80401efc:	f28fe0ef          	jal	ra,80400624 <__panic>
80401f00:	00012697          	auipc	a3,0x12
80401f04:	8f468693          	addi	a3,a3,-1804 # 804137f4 <commands+0xae8>
80401f08:	00011617          	auipc	a2,0x11
80401f0c:	fc060613          	addi	a2,a2,-64 # 80412ec8 <commands+0x1bc>
80401f10:	11800593          	li	a1,280
80401f14:	00011517          	auipc	a0,0x11
80401f18:	79850513          	addi	a0,a0,1944 # 804136ac <commands+0x9a0>
80401f1c:	f08fe0ef          	jal	ra,80400624 <__panic>
80401f20:	00012697          	auipc	a3,0x12
80401f24:	89468693          	addi	a3,a3,-1900 # 804137b4 <commands+0xaa8>
80401f28:	00011617          	auipc	a2,0x11
80401f2c:	fa060613          	addi	a2,a2,-96 # 80412ec8 <commands+0x1bc>
80401f30:	0c100593          	li	a1,193
80401f34:	00011517          	auipc	a0,0x11
80401f38:	77850513          	addi	a0,a0,1912 # 804136ac <commands+0x9a0>
80401f3c:	ee8fe0ef          	jal	ra,80400624 <__panic>
80401f40:	00012697          	auipc	a3,0x12
80401f44:	a2468693          	addi	a3,a3,-1500 # 80413964 <commands+0xc58>
80401f48:	00011617          	auipc	a2,0x11
80401f4c:	f8060613          	addi	a2,a2,-128 # 80412ec8 <commands+0x1bc>
80401f50:	11200593          	li	a1,274
80401f54:	00011517          	auipc	a0,0x11
80401f58:	75850513          	addi	a0,a0,1880 # 804136ac <commands+0x9a0>
80401f5c:	ec8fe0ef          	jal	ra,80400624 <__panic>
80401f60:	00012697          	auipc	a3,0x12
80401f64:	9e468693          	addi	a3,a3,-1564 # 80413944 <commands+0xc38>
80401f68:	00011617          	auipc	a2,0x11
80401f6c:	f6060613          	addi	a2,a2,-160 # 80412ec8 <commands+0x1bc>
80401f70:	11000593          	li	a1,272
80401f74:	00011517          	auipc	a0,0x11
80401f78:	73850513          	addi	a0,a0,1848 # 804136ac <commands+0x9a0>
80401f7c:	ea8fe0ef          	jal	ra,80400624 <__panic>
80401f80:	00012697          	auipc	a3,0x12
80401f84:	99c68693          	addi	a3,a3,-1636 # 8041391c <commands+0xc10>
80401f88:	00011617          	auipc	a2,0x11
80401f8c:	f4060613          	addi	a2,a2,-192 # 80412ec8 <commands+0x1bc>
80401f90:	10e00593          	li	a1,270
80401f94:	00011517          	auipc	a0,0x11
80401f98:	71850513          	addi	a0,a0,1816 # 804136ac <commands+0x9a0>
80401f9c:	e88fe0ef          	jal	ra,80400624 <__panic>
80401fa0:	00012697          	auipc	a3,0x12
80401fa4:	95468693          	addi	a3,a3,-1708 # 804138f4 <commands+0xbe8>
80401fa8:	00011617          	auipc	a2,0x11
80401fac:	f2060613          	addi	a2,a2,-224 # 80412ec8 <commands+0x1bc>
80401fb0:	10d00593          	li	a1,269
80401fb4:	00011517          	auipc	a0,0x11
80401fb8:	6f850513          	addi	a0,a0,1784 # 804136ac <commands+0x9a0>
80401fbc:	e68fe0ef          	jal	ra,80400624 <__panic>
80401fc0:	00012697          	auipc	a3,0x12
80401fc4:	92468693          	addi	a3,a3,-1756 # 804138e4 <commands+0xbd8>
80401fc8:	00011617          	auipc	a2,0x11
80401fcc:	f0060613          	addi	a2,a2,-256 # 80412ec8 <commands+0x1bc>
80401fd0:	10800593          	li	a1,264
80401fd4:	00011517          	auipc	a0,0x11
80401fd8:	6d850513          	addi	a0,a0,1752 # 804136ac <commands+0x9a0>
80401fdc:	e48fe0ef          	jal	ra,80400624 <__panic>
80401fe0:	00012697          	auipc	a3,0x12
80401fe4:	81468693          	addi	a3,a3,-2028 # 804137f4 <commands+0xae8>
80401fe8:	00011617          	auipc	a2,0x11
80401fec:	ee060613          	addi	a2,a2,-288 # 80412ec8 <commands+0x1bc>
80401ff0:	10700593          	li	a1,263
80401ff4:	00011517          	auipc	a0,0x11
80401ff8:	6b850513          	addi	a0,a0,1720 # 804136ac <commands+0x9a0>
80401ffc:	e28fe0ef          	jal	ra,80400624 <__panic>
80402000:	00012697          	auipc	a3,0x12
80402004:	8c468693          	addi	a3,a3,-1852 # 804138c4 <commands+0xbb8>
80402008:	00011617          	auipc	a2,0x11
8040200c:	ec060613          	addi	a2,a2,-320 # 80412ec8 <commands+0x1bc>
80402010:	10600593          	li	a1,262
80402014:	00011517          	auipc	a0,0x11
80402018:	69850513          	addi	a0,a0,1688 # 804136ac <commands+0x9a0>
8040201c:	e08fe0ef          	jal	ra,80400624 <__panic>
80402020:	00012697          	auipc	a3,0x12
80402024:	87868693          	addi	a3,a3,-1928 # 80413898 <commands+0xb8c>
80402028:	00011617          	auipc	a2,0x11
8040202c:	ea060613          	addi	a2,a2,-352 # 80412ec8 <commands+0x1bc>
80402030:	10500593          	li	a1,261
80402034:	00011517          	auipc	a0,0x11
80402038:	67850513          	addi	a0,a0,1656 # 804136ac <commands+0x9a0>
8040203c:	de8fe0ef          	jal	ra,80400624 <__panic>
80402040:	00012697          	auipc	a3,0x12
80402044:	84068693          	addi	a3,a3,-1984 # 80413880 <commands+0xb74>
80402048:	00011617          	auipc	a2,0x11
8040204c:	e8060613          	addi	a2,a2,-384 # 80412ec8 <commands+0x1bc>
80402050:	10400593          	li	a1,260
80402054:	00011517          	auipc	a0,0x11
80402058:	65850513          	addi	a0,a0,1624 # 804136ac <commands+0x9a0>
8040205c:	dc8fe0ef          	jal	ra,80400624 <__panic>
80402060:	00011697          	auipc	a3,0x11
80402064:	79468693          	addi	a3,a3,1940 # 804137f4 <commands+0xae8>
80402068:	00011617          	auipc	a2,0x11
8040206c:	e6060613          	addi	a2,a2,-416 # 80412ec8 <commands+0x1bc>
80402070:	0fe00593          	li	a1,254
80402074:	00011517          	auipc	a0,0x11
80402078:	63850513          	addi	a0,a0,1592 # 804136ac <commands+0x9a0>
8040207c:	da8fe0ef          	jal	ra,80400624 <__panic>
80402080:	00011697          	auipc	a3,0x11
80402084:	7ec68693          	addi	a3,a3,2028 # 8041386c <commands+0xb60>
80402088:	00011617          	auipc	a2,0x11
8040208c:	e4060613          	addi	a2,a2,-448 # 80412ec8 <commands+0x1bc>
80402090:	0f900593          	li	a1,249
80402094:	00011517          	auipc	a0,0x11
80402098:	61850513          	addi	a0,a0,1560 # 804136ac <commands+0x9a0>
8040209c:	d88fe0ef          	jal	ra,80400624 <__panic>
804020a0:	00012697          	auipc	a3,0x12
804020a4:	8e468693          	addi	a3,a3,-1820 # 80413984 <commands+0xc78>
804020a8:	00011617          	auipc	a2,0x11
804020ac:	e2060613          	addi	a2,a2,-480 # 80412ec8 <commands+0x1bc>
804020b0:	11700593          	li	a1,279
804020b4:	00011517          	auipc	a0,0x11
804020b8:	5f850513          	addi	a0,a0,1528 # 804136ac <commands+0x9a0>
804020bc:	d68fe0ef          	jal	ra,80400624 <__panic>
804020c0:	00012697          	auipc	a3,0x12
804020c4:	8f068693          	addi	a3,a3,-1808 # 804139b0 <commands+0xca4>
804020c8:	00011617          	auipc	a2,0x11
804020cc:	e0060613          	addi	a2,a2,-512 # 80412ec8 <commands+0x1bc>
804020d0:	12600593          	li	a1,294
804020d4:	00011517          	auipc	a0,0x11
804020d8:	5d850513          	addi	a0,a0,1496 # 804136ac <commands+0x9a0>
804020dc:	d48fe0ef          	jal	ra,80400624 <__panic>
804020e0:	00011697          	auipc	a3,0x11
804020e4:	5e468693          	addi	a3,a3,1508 # 804136c4 <commands+0x9b8>
804020e8:	00011617          	auipc	a2,0x11
804020ec:	de060613          	addi	a2,a2,-544 # 80412ec8 <commands+0x1bc>
804020f0:	0f300593          	li	a1,243
804020f4:	00011517          	auipc	a0,0x11
804020f8:	5b850513          	addi	a0,a0,1464 # 804136ac <commands+0x9a0>
804020fc:	d28fe0ef          	jal	ra,80400624 <__panic>
80402100:	00011697          	auipc	a3,0x11
80402104:	5fc68693          	addi	a3,a3,1532 # 804136fc <commands+0x9f0>
80402108:	00011617          	auipc	a2,0x11
8040210c:	dc060613          	addi	a2,a2,-576 # 80412ec8 <commands+0x1bc>
80402110:	0ba00593          	li	a1,186
80402114:	00011517          	auipc	a0,0x11
80402118:	59850513          	addi	a0,a0,1432 # 804136ac <commands+0x9a0>
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
804022fc:	6c468693          	addi	a3,a3,1732 # 804139bc <commands+0xcb0>
80402300:	00011617          	auipc	a2,0x11
80402304:	bc860613          	addi	a2,a2,-1080 # 80412ec8 <commands+0x1bc>
80402308:	08300593          	li	a1,131
8040230c:	00011517          	auipc	a0,0x11
80402310:	3a050513          	addi	a0,a0,928 # 804136ac <commands+0x9a0>
80402314:	b10fe0ef          	jal	ra,80400624 <__panic>
80402318:	00011697          	auipc	a3,0x11
8040231c:	6cc68693          	addi	a3,a3,1740 # 804139e4 <commands+0xcd8>
80402320:	00011617          	auipc	a2,0x11
80402324:	ba860613          	addi	a2,a2,-1112 # 80412ec8 <commands+0x1bc>
80402328:	08000593          	li	a1,128
8040232c:	00011517          	auipc	a0,0x11
80402330:	38050513          	addi	a0,a0,896 # 804136ac <commands+0x9a0>
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
804023e4:	60468693          	addi	a3,a3,1540 # 804139e4 <commands+0xcd8>
804023e8:	00011617          	auipc	a2,0x11
804023ec:	ae060613          	addi	a2,a2,-1312 # 80412ec8 <commands+0x1bc>
804023f0:	06200593          	li	a1,98
804023f4:	00011517          	auipc	a0,0x11
804023f8:	2b850513          	addi	a0,a0,696 # 804136ac <commands+0x9a0>
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
8040252c:	4c468693          	addi	a3,a3,1220 # 804139ec <commands+0xce0>
80402530:	00011617          	auipc	a2,0x11
80402534:	99860613          	addi	a2,a2,-1640 # 80412ec8 <commands+0x1bc>
80402538:	04900593          	li	a1,73
8040253c:	00011517          	auipc	a0,0x11
80402540:	17050513          	addi	a0,a0,368 # 804136ac <commands+0x9a0>
80402544:	8e0fe0ef          	jal	ra,80400624 <__panic>
80402548:	00011697          	auipc	a3,0x11
8040254c:	49c68693          	addi	a3,a3,1180 # 804139e4 <commands+0xcd8>
80402550:	00011617          	auipc	a2,0x11
80402554:	97860613          	addi	a2,a2,-1672 # 80412ec8 <commands+0x1bc>
80402558:	04600593          	li	a1,70
8040255c:	00011517          	auipc	a0,0x11
80402560:	15050513          	addi	a0,a0,336 # 804136ac <commands+0x9a0>
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
80402730:	fdc78793          	addi	a5,a5,-36 # 80416708 <nbase>
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
80402784:	2ac60613          	addi	a2,a2,684 # 80413a2c <default_pmm_manager+0x30>
80402788:	06e00593          	li	a1,110
8040278c:	00011517          	auipc	a0,0x11
80402790:	2c450513          	addi	a0,a0,708 # 80413a50 <default_pmm_manager+0x54>
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
804028f0:	1d468693          	addi	a3,a3,468 # 80413ac0 <default_pmm_manager+0xc4>
804028f4:	00010617          	auipc	a2,0x10
804028f8:	5d460613          	addi	a2,a2,1492 # 80412ec8 <commands+0x1bc>
804028fc:	06400593          	li	a1,100
80402900:	00011517          	auipc	a0,0x11
80402904:	1e050513          	addi	a0,a0,480 # 80413ae0 <default_pmm_manager+0xe4>
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
8040292c:	1cc50513          	addi	a0,a0,460 # 80413af4 <default_pmm_manager+0xf8>
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
80402960:	1ac50513          	addi	a0,a0,428 # 80413b08 <default_pmm_manager+0x10c>
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
8040298c:	1b050513          	addi	a0,a0,432 # 80413b38 <default_pmm_manager+0x13c>
80402990:	01010113          	addi	sp,sp,16
80402994:	869fd06f          	j	804001fc <cprintf>

80402998 <kmalloc_init>:
80402998:	ff010113          	addi	sp,sp,-16
8040299c:	00112623          	sw	ra,12(sp)
804029a0:	f6dff0ef          	jal	ra,8040290c <slob_init>
804029a4:	00c12083          	lw	ra,12(sp)
804029a8:	00011517          	auipc	a0,0x11
804029ac:	0fc50513          	addi	a0,a0,252 # 80413aa4 <default_pmm_manager+0xa8>
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
80402ba4:	00014797          	auipc	a5,0x14
80402ba8:	b6478793          	addi	a5,a5,-1180 # 80416708 <nbase>
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
80402c50:	e1460613          	addi	a2,a2,-492 # 80413a60 <default_pmm_manager+0x64>
80402c54:	07000593          	li	a1,112
80402c58:	00011517          	auipc	a0,0x11
80402c5c:	df850513          	addi	a0,a0,-520 # 80413a50 <default_pmm_manager+0x54>
80402c60:	9c5fd0ef          	jal	ra,80400624 <__panic>
80402c64:	00011617          	auipc	a2,0x11
80402c68:	e2060613          	addi	a2,a2,-480 # 80413a84 <default_pmm_manager+0x88>
80402c6c:	06900593          	li	a1,105
80402c70:	00011517          	auipc	a0,0x11
80402c74:	de050513          	addi	a0,a0,-544 # 80413a50 <default_pmm_manager+0x54>
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
80402d28:	d6060613          	addi	a2,a2,-672 # 80413a84 <default_pmm_manager+0x88>
80402d2c:	06900593          	li	a1,105
80402d30:	00011517          	auipc	a0,0x11
80402d34:	d2050513          	addi	a0,a0,-736 # 80413a50 <default_pmm_manager+0x54>
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
80402da8:	248010ef          	jal	ra,80403ff0 <swap_out>
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
80402f84:	3150f0ef          	jal	ra,80412a98 <memset>
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
80403008:	00011617          	auipc	a2,0x11
8040300c:	a2460613          	addi	a2,a2,-1500 # 80413a2c <default_pmm_manager+0x30>
80403010:	12100593          	li	a1,289
80403014:	00011517          	auipc	a0,0x11
80403018:	c3c50513          	addi	a0,a0,-964 # 80413c50 <default_pmm_manager+0x254>
8040301c:	e08fd0ef          	jal	ra,80400624 <__panic>
80403020:	00050693          	mv	a3,a0
80403024:	00011617          	auipc	a2,0x11
80403028:	a0860613          	addi	a2,a2,-1528 # 80413a2c <default_pmm_manager+0x30>
8040302c:	11e00593          	li	a1,286
80403030:	00011517          	auipc	a0,0x11
80403034:	c2050513          	addi	a0,a0,-992 # 80413c50 <default_pmm_manager+0x254>
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
80403180:	c6c68693          	addi	a3,a3,-916 # 80413de8 <default_pmm_manager+0x3ec>
80403184:	00010617          	auipc	a2,0x10
80403188:	d4460613          	addi	a2,a2,-700 # 80412ec8 <commands+0x1bc>
8040318c:	15900593          	li	a1,345
80403190:	00011517          	auipc	a0,0x11
80403194:	ac050513          	addi	a0,a0,-1344 # 80413c50 <default_pmm_manager+0x254>
80403198:	c8cfd0ef          	jal	ra,80400624 <__panic>
8040319c:	00011697          	auipc	a3,0x11
804031a0:	c2068693          	addi	a3,a3,-992 # 80413dbc <default_pmm_manager+0x3c0>
804031a4:	00010617          	auipc	a2,0x10
804031a8:	d2460613          	addi	a2,a2,-732 # 80412ec8 <commands+0x1bc>
804031ac:	15800593          	li	a1,344
804031b0:	00011517          	auipc	a0,0x11
804031b4:	aa050513          	addi	a0,a0,-1376 # 80413c50 <default_pmm_manager+0x254>
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
804032b4:	7d460613          	addi	a2,a2,2004 # 80413a84 <default_pmm_manager+0x88>
804032b8:	06900593          	li	a1,105
804032bc:	00010517          	auipc	a0,0x10
804032c0:	79450513          	addi	a0,a0,1940 # 80413a50 <default_pmm_manager+0x54>
804032c4:	b60fd0ef          	jal	ra,80400624 <__panic>
804032c8:	00011697          	auipc	a3,0x11
804032cc:	b2068693          	addi	a3,a3,-1248 # 80413de8 <default_pmm_manager+0x3ec>
804032d0:	00010617          	auipc	a2,0x10
804032d4:	bf860613          	addi	a2,a2,-1032 # 80412ec8 <commands+0x1bc>
804032d8:	16a00593          	li	a1,362
804032dc:	00011517          	auipc	a0,0x11
804032e0:	97450513          	addi	a0,a0,-1676 # 80413c50 <default_pmm_manager+0x254>
804032e4:	b40fd0ef          	jal	ra,80400624 <__panic>
804032e8:	00011697          	auipc	a3,0x11
804032ec:	ad468693          	addi	a3,a3,-1324 # 80413dbc <default_pmm_manager+0x3c0>
804032f0:	00010617          	auipc	a2,0x10
804032f4:	bd860613          	addi	a2,a2,-1064 # 80412ec8 <commands+0x1bc>
804032f8:	16900593          	li	a1,361
804032fc:	00011517          	auipc	a0,0x11
80403300:	95450513          	addi	a0,a0,-1708 # 80413c50 <default_pmm_manager+0x254>
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
80403428:	fb010113          	addi	sp,sp,-80
8040342c:	00d66733          	or	a4,a2,a3
80403430:	04112623          	sw	ra,76(sp)
80403434:	04812423          	sw	s0,72(sp)
80403438:	04912223          	sw	s1,68(sp)
8040343c:	05212023          	sw	s2,64(sp)
80403440:	03312e23          	sw	s3,60(sp)
80403444:	03412c23          	sw	s4,56(sp)
80403448:	03512a23          	sw	s5,52(sp)
8040344c:	03612823          	sw	s6,48(sp)
80403450:	03712623          	sw	s7,44(sp)
80403454:	03812423          	sw	s8,40(sp)
80403458:	03912223          	sw	s9,36(sp)
8040345c:	03a12023          	sw	s10,32(sp)
80403460:	01b12e23          	sw	s11,28(sp)
80403464:	01471793          	slli	a5,a4,0x14
80403468:	34079463          	bnez	a5,804037b0 <copy_range+0x388>
8040346c:	00200737          	lui	a4,0x200
80403470:	00060d93          	mv	s11,a2
80403474:	30e66063          	bltu	a2,a4,80403774 <copy_range+0x34c>
80403478:	00068993          	mv	s3,a3
8040347c:	2ed67c63          	bgeu	a2,a3,80403774 <copy_range+0x34c>
80403480:	80000737          	lui	a4,0x80000
80403484:	2ed76863          	bltu	a4,a3,80403774 <copy_range+0x34c>
80403488:	00100b37          	lui	s6,0x100
8040348c:	00050c13          	mv	s8,a0
80403490:	00058a13          	mv	s4,a1
80403494:	00001ab7          	lui	s5,0x1
80403498:	00099c97          	auipc	s9,0x99
8040349c:	300c8c93          	addi	s9,s9,768 # 8049c798 <npage>
804034a0:	00099b97          	auipc	s7,0x99
804034a4:	368b8b93          	addi	s7,s7,872 # 8049c808 <pages>
804034a8:	fffb0b13          	addi	s6,s6,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
804034ac:	00000613          	li	a2,0
804034b0:	000d8593          	mv	a1,s11
804034b4:	000a0513          	mv	a0,s4
804034b8:	a1dff0ef          	jal	ra,80402ed4 <get_pte>
804034bc:	00050413          	mv	s0,a0
804034c0:	16050063          	beqz	a0,80403620 <copy_range+0x1f8>
804034c4:	00052703          	lw	a4,0(a0)
804034c8:	00177713          	andi	a4,a4,1
804034cc:	04071663          	bnez	a4,80403518 <copy_range+0xf0>
804034d0:	015d8db3          	add	s11,s11,s5
804034d4:	fd3dece3          	bltu	s11,s3,804034ac <copy_range+0x84>
804034d8:	00000513          	li	a0,0
804034dc:	04c12083          	lw	ra,76(sp)
804034e0:	04812403          	lw	s0,72(sp)
804034e4:	04412483          	lw	s1,68(sp)
804034e8:	04012903          	lw	s2,64(sp)
804034ec:	03c12983          	lw	s3,60(sp)
804034f0:	03812a03          	lw	s4,56(sp)
804034f4:	03412a83          	lw	s5,52(sp)
804034f8:	03012b03          	lw	s6,48(sp)
804034fc:	02c12b83          	lw	s7,44(sp)
80403500:	02812c03          	lw	s8,40(sp)
80403504:	02412c83          	lw	s9,36(sp)
80403508:	02012d03          	lw	s10,32(sp)
8040350c:	01c12d83          	lw	s11,28(sp)
80403510:	05010113          	addi	sp,sp,80
80403514:	00008067          	ret
80403518:	00100613          	li	a2,1
8040351c:	000d8593          	mv	a1,s11
80403520:	000c0513          	mv	a0,s8
80403524:	9b1ff0ef          	jal	ra,80402ed4 <get_pte>
80403528:	1a050c63          	beqz	a0,804036e0 <copy_range+0x2b8>
8040352c:	00042703          	lw	a4,0(s0)
80403530:	01f77793          	andi	a5,a4,31
80403534:	00177693          	andi	a3,a4,1
80403538:	00f12423          	sw	a5,8(sp)
8040353c:	22068063          	beqz	a3,8040375c <copy_range+0x334>
80403540:	000ca683          	lw	a3,0(s9)
80403544:	00271713          	slli	a4,a4,0x2
80403548:	00c75713          	srli	a4,a4,0xc
8040354c:	1ed77c63          	bgeu	a4,a3,80403744 <copy_range+0x31c>
80403550:	000ba903          	lw	s2,0(s7)
80403554:	fff806b7          	lui	a3,0xfff80
80403558:	00d70733          	add	a4,a4,a3
8040355c:	00571713          	slli	a4,a4,0x5
80403560:	00100513          	li	a0,1
80403564:	00e90933          	add	s2,s2,a4
80403568:	fd8ff0ef          	jal	ra,80402d40 <alloc_pages>
8040356c:	00050d13          	mv	s10,a0
80403570:	1a090a63          	beqz	s2,80403724 <copy_range+0x2fc>
80403574:	18050863          	beqz	a0,80403704 <copy_range+0x2dc>
80403578:	000ba703          	lw	a4,0(s7)
8040357c:	000805b7          	lui	a1,0x80
80403580:	000ca603          	lw	a2,0(s9)
80403584:	40e904b3          	sub	s1,s2,a4
80403588:	4054d493          	srai	s1,s1,0x5
8040358c:	00b484b3          	add	s1,s1,a1
80403590:	0164f6b3          	and	a3,s1,s6
80403594:	00c49493          	slli	s1,s1,0xc
80403598:	14c6f863          	bgeu	a3,a2,804036e8 <copy_range+0x2c0>
8040359c:	40e50433          	sub	s0,a0,a4
804035a0:	00099797          	auipc	a5,0x99
804035a4:	26078793          	addi	a5,a5,608 # 8049c800 <va_pa_offset>
804035a8:	0007a683          	lw	a3,0(a5)
804035ac:	40545413          	srai	s0,s0,0x5
804035b0:	00b40433          	add	s0,s0,a1
804035b4:	01647733          	and	a4,s0,s6
804035b8:	00d484b3          	add	s1,s1,a3
804035bc:	00c41413          	slli	s0,s0,0xc
804035c0:	1cc77a63          	bgeu	a4,a2,80403794 <copy_range+0x36c>
804035c4:	00d40433          	add	s0,s0,a3
804035c8:	00001637          	lui	a2,0x1
804035cc:	00048593          	mv	a1,s1
804035d0:	00040513          	mv	a0,s0
804035d4:	5340f0ef          	jal	ra,80412b08 <memcpy>
804035d8:	ff800737          	lui	a4,0xff800
804035dc:	00ed8733          	add	a4,s11,a4
804035e0:	000106b7          	lui	a3,0x10
804035e4:	04d76c63          	bltu	a4,a3,8040363c <copy_range+0x214>
804035e8:	00812683          	lw	a3,8(sp)
804035ec:	000d8613          	mv	a2,s11
804035f0:	000d0593          	mv	a1,s10
804035f4:	000c0513          	mv	a0,s8
804035f8:	d11ff0ef          	jal	ra,80403308 <page_insert>
804035fc:	ec050ae3          	beqz	a0,804034d0 <copy_range+0xa8>
80403600:	00010697          	auipc	a3,0x10
80403604:	64468693          	addi	a3,a3,1604 # 80413c44 <default_pmm_manager+0x248>
80403608:	00010617          	auipc	a2,0x10
8040360c:	8c060613          	addi	a2,a2,-1856 # 80412ec8 <commands+0x1bc>
80403610:	1c600593          	li	a1,454
80403614:	00010517          	auipc	a0,0x10
80403618:	63c50513          	addi	a0,a0,1596 # 80413c50 <default_pmm_manager+0x254>
8040361c:	808fd0ef          	jal	ra,80400624 <__panic>
80403620:	00400737          	lui	a4,0x400
80403624:	00ed87b3          	add	a5,s11,a4
80403628:	ffc00737          	lui	a4,0xffc00
8040362c:	00e7fdb3          	and	s11,a5,a4
80403630:	ea0d84e3          	beqz	s11,804034d8 <copy_range+0xb0>
80403634:	e73dece3          	bltu	s11,s3,804034ac <copy_range+0x84>
80403638:	ea1ff06f          	j	804034d8 <copy_range+0xb0>
8040363c:	000ba603          	lw	a2,0(s7)
80403640:	000805b7          	lui	a1,0x80
80403644:	0004a703          	lw	a4,0(s1)
80403648:	40cd06b3          	sub	a3,s10,a2
8040364c:	40c90633          	sub	a2,s2,a2
80403650:	4056d693          	srai	a3,a3,0x5
80403654:	40565613          	srai	a2,a2,0x5
80403658:	00b686b3          	add	a3,a3,a1
8040365c:	00b60633          	add	a2,a2,a1
80403660:	00c69693          	slli	a3,a3,0xc
80403664:	00c61613          	slli	a2,a2,0xc
80403668:	000d8593          	mv	a1,s11
8040366c:	00010517          	auipc	a0,0x10
80403670:	54850513          	addi	a0,a0,1352 # 80413bb4 <default_pmm_manager+0x1b8>
80403674:	00e12623          	sw	a4,12(sp)
80403678:	00042903          	lw	s2,0(s0)
8040367c:	b81fc0ef          	jal	ra,804001fc <cprintf>
80403680:	00c12703          	lw	a4,12(sp)
80403684:	00010697          	auipc	a3,0x10
80403688:	4dc68693          	addi	a3,a3,1244 # 80413b60 <default_pmm_manager+0x164>
8040368c:	01270663          	beq	a4,s2,80403698 <copy_range+0x270>
80403690:	00010697          	auipc	a3,0x10
80403694:	4d468693          	addi	a3,a3,1236 # 80413b64 <default_pmm_manager+0x168>
80403698:	00070593          	mv	a1,a4
8040369c:	00090613          	mv	a2,s2
804036a0:	00010517          	auipc	a0,0x10
804036a4:	54450513          	addi	a0,a0,1348 # 80413be4 <default_pmm_manager+0x1e8>
804036a8:	b55fc0ef          	jal	ra,804001fc <cprintf>
804036ac:	00800737          	lui	a4,0x800
804036b0:	f2ed9ce3          	bne	s11,a4,804035e8 <copy_range+0x1c0>
804036b4:	2d04a583          	lw	a1,720(s1)
804036b8:	2d042603          	lw	a2,720(s0)
804036bc:	00010697          	auipc	a3,0x10
804036c0:	4a468693          	addi	a3,a3,1188 # 80413b60 <default_pmm_manager+0x164>
804036c4:	00c58663          	beq	a1,a2,804036d0 <copy_range+0x2a8>
804036c8:	00010697          	auipc	a3,0x10
804036cc:	49c68693          	addi	a3,a3,1180 # 80413b64 <default_pmm_manager+0x168>
804036d0:	00010517          	auipc	a0,0x10
804036d4:	54050513          	addi	a0,a0,1344 # 80413c10 <default_pmm_manager+0x214>
804036d8:	b25fc0ef          	jal	ra,804001fc <cprintf>
804036dc:	f0dff06f          	j	804035e8 <copy_range+0x1c0>
804036e0:	ffc00513          	li	a0,-4
804036e4:	df9ff06f          	j	804034dc <copy_range+0xb4>
804036e8:	00048693          	mv	a3,s1
804036ec:	00010617          	auipc	a2,0x10
804036f0:	34060613          	addi	a2,a2,832 # 80413a2c <default_pmm_manager+0x30>
804036f4:	06e00593          	li	a1,110
804036f8:	00010517          	auipc	a0,0x10
804036fc:	35850513          	addi	a0,a0,856 # 80413a50 <default_pmm_manager+0x54>
80403700:	f25fc0ef          	jal	ra,80400624 <__panic>
80403704:	00010697          	auipc	a3,0x10
80403708:	4a068693          	addi	a3,a3,1184 # 80413ba4 <default_pmm_manager+0x1a8>
8040370c:	0000f617          	auipc	a2,0xf
80403710:	7bc60613          	addi	a2,a2,1980 # 80412ec8 <commands+0x1bc>
80403714:	19700593          	li	a1,407
80403718:	00010517          	auipc	a0,0x10
8040371c:	53850513          	addi	a0,a0,1336 # 80413c50 <default_pmm_manager+0x254>
80403720:	f05fc0ef          	jal	ra,80400624 <__panic>
80403724:	00010697          	auipc	a3,0x10
80403728:	47068693          	addi	a3,a3,1136 # 80413b94 <default_pmm_manager+0x198>
8040372c:	0000f617          	auipc	a2,0xf
80403730:	79c60613          	addi	a2,a2,1948 # 80412ec8 <commands+0x1bc>
80403734:	19600593          	li	a1,406
80403738:	00010517          	auipc	a0,0x10
8040373c:	51850513          	addi	a0,a0,1304 # 80413c50 <default_pmm_manager+0x254>
80403740:	ee5fc0ef          	jal	ra,80400624 <__panic>
80403744:	00010617          	auipc	a2,0x10
80403748:	34060613          	addi	a2,a2,832 # 80413a84 <default_pmm_manager+0x88>
8040374c:	06900593          	li	a1,105
80403750:	00010517          	auipc	a0,0x10
80403754:	30050513          	addi	a0,a0,768 # 80413a50 <default_pmm_manager+0x54>
80403758:	ecdfc0ef          	jal	ra,80400624 <__panic>
8040375c:	00010617          	auipc	a2,0x10
80403760:	41460613          	addi	a2,a2,1044 # 80413b70 <default_pmm_manager+0x174>
80403764:	07400593          	li	a1,116
80403768:	00010517          	auipc	a0,0x10
8040376c:	2e850513          	addi	a0,a0,744 # 80413a50 <default_pmm_manager+0x54>
80403770:	eb5fc0ef          	jal	ra,80400624 <__panic>
80403774:	00010697          	auipc	a3,0x10
80403778:	67468693          	addi	a3,a3,1652 # 80413de8 <default_pmm_manager+0x3ec>
8040377c:	0000f617          	auipc	a2,0xf
80403780:	74c60613          	addi	a2,a2,1868 # 80412ec8 <commands+0x1bc>
80403784:	18200593          	li	a1,386
80403788:	00010517          	auipc	a0,0x10
8040378c:	4c850513          	addi	a0,a0,1224 # 80413c50 <default_pmm_manager+0x254>
80403790:	e95fc0ef          	jal	ra,80400624 <__panic>
80403794:	00040693          	mv	a3,s0
80403798:	00010617          	auipc	a2,0x10
8040379c:	29460613          	addi	a2,a2,660 # 80413a2c <default_pmm_manager+0x30>
804037a0:	06e00593          	li	a1,110
804037a4:	00010517          	auipc	a0,0x10
804037a8:	2ac50513          	addi	a0,a0,684 # 80413a50 <default_pmm_manager+0x54>
804037ac:	e79fc0ef          	jal	ra,80400624 <__panic>
804037b0:	00010697          	auipc	a3,0x10
804037b4:	60c68693          	addi	a3,a3,1548 # 80413dbc <default_pmm_manager+0x3c0>
804037b8:	0000f617          	auipc	a2,0xf
804037bc:	71060613          	addi	a2,a2,1808 # 80412ec8 <commands+0x1bc>
804037c0:	18100593          	li	a1,385
804037c4:	00010517          	auipc	a0,0x10
804037c8:	48c50513          	addi	a0,a0,1164 # 80413c50 <default_pmm_manager+0x254>
804037cc:	e59fc0ef          	jal	ra,80400624 <__panic>

804037d0 <tlb_invalidate>:
804037d0:	12058073          	sfence.vma	a1
804037d4:	00008067          	ret

804037d8 <pgdir_alloc_page>:
804037d8:	fe010113          	addi	sp,sp,-32
804037dc:	01212823          	sw	s2,16(sp)
804037e0:	00050913          	mv	s2,a0
804037e4:	00100513          	li	a0,1
804037e8:	00812c23          	sw	s0,24(sp)
804037ec:	00912a23          	sw	s1,20(sp)
804037f0:	01312623          	sw	s3,12(sp)
804037f4:	00112e23          	sw	ra,28(sp)
804037f8:	00058493          	mv	s1,a1
804037fc:	00060993          	mv	s3,a2
80403800:	d40ff0ef          	jal	ra,80402d40 <alloc_pages>
80403804:	00050413          	mv	s0,a0
80403808:	04050e63          	beqz	a0,80403864 <pgdir_alloc_page+0x8c>
8040380c:	00050593          	mv	a1,a0
80403810:	00098693          	mv	a3,s3
80403814:	00048613          	mv	a2,s1
80403818:	00090513          	mv	a0,s2
8040381c:	aedff0ef          	jal	ra,80403308 <page_insert>
80403820:	06051263          	bnez	a0,80403884 <pgdir_alloc_page+0xac>
80403824:	00099797          	auipc	a5,0x99
80403828:	f8078793          	addi	a5,a5,-128 # 8049c7a4 <swap_init_ok>
8040382c:	0007a783          	lw	a5,0(a5)
80403830:	02078a63          	beqz	a5,80403864 <pgdir_alloc_page+0x8c>
80403834:	00099797          	auipc	a5,0x99
80403838:	07c78793          	addi	a5,a5,124 # 8049c8b0 <check_mm_struct>
8040383c:	0007a503          	lw	a0,0(a5)
80403840:	02050263          	beqz	a0,80403864 <pgdir_alloc_page+0x8c>
80403844:	00000693          	li	a3,0
80403848:	00040613          	mv	a2,s0
8040384c:	00048593          	mv	a1,s1
80403850:	78c000ef          	jal	ra,80403fdc <swap_map_swappable>
80403854:	00042703          	lw	a4,0(s0)
80403858:	00942e23          	sw	s1,28(s0)
8040385c:	00100793          	li	a5,1
80403860:	02f71c63          	bne	a4,a5,80403898 <pgdir_alloc_page+0xc0>
80403864:	00040513          	mv	a0,s0
80403868:	01c12083          	lw	ra,28(sp)
8040386c:	01812403          	lw	s0,24(sp)
80403870:	01412483          	lw	s1,20(sp)
80403874:	01012903          	lw	s2,16(sp)
80403878:	00c12983          	lw	s3,12(sp)
8040387c:	02010113          	addi	sp,sp,32
80403880:	00008067          	ret
80403884:	00040513          	mv	a0,s0
80403888:	00100593          	li	a1,1
8040388c:	d7cff0ef          	jal	ra,80402e08 <free_pages>
80403890:	00000413          	li	s0,0
80403894:	fd1ff06f          	j	80403864 <pgdir_alloc_page+0x8c>
80403898:	00010697          	auipc	a3,0x10
8040389c:	3c868693          	addi	a3,a3,968 # 80413c60 <default_pmm_manager+0x264>
804038a0:	0000f617          	auipc	a2,0xf
804038a4:	62860613          	addi	a2,a2,1576 # 80412ec8 <commands+0x1bc>
804038a8:	20500593          	li	a1,517
804038ac:	00010517          	auipc	a0,0x10
804038b0:	3a450513          	addi	a0,a0,932 # 80413c50 <default_pmm_manager+0x254>
804038b4:	d71fc0ef          	jal	ra,80400624 <__panic>

804038b8 <print_pgdir>:
804038b8:	fa010113          	addi	sp,sp,-96
804038bc:	00010517          	auipc	a0,0x10
804038c0:	45450513          	addi	a0,a0,1108 # 80413d10 <default_pmm_manager+0x314>
804038c4:	05512223          	sw	s5,68(sp)
804038c8:	04112e23          	sw	ra,92(sp)
804038cc:	04812c23          	sw	s0,88(sp)
804038d0:	04912a23          	sw	s1,84(sp)
804038d4:	05212823          	sw	s2,80(sp)
804038d8:	05312623          	sw	s3,76(sp)
804038dc:	05412423          	sw	s4,72(sp)
804038e0:	05612023          	sw	s6,64(sp)
804038e4:	03712e23          	sw	s7,60(sp)
804038e8:	03812c23          	sw	s8,56(sp)
804038ec:	03912a23          	sw	s9,52(sp)
804038f0:	03a12823          	sw	s10,48(sp)
804038f4:	03b12623          	sw	s11,44(sp)
804038f8:	905fc0ef          	jal	ra,804001fc <cprintf>
804038fc:	00000593          	li	a1,0
80403900:	00012a23          	sw	zero,20(sp)
80403904:	00099a97          	auipc	s5,0x99
80403908:	efca8a93          	addi	s5,s5,-260 # 8049c800 <va_pa_offset>
8040390c:	01410713          	addi	a4,sp,20
80403910:	01010693          	addi	a3,sp,16
80403914:	fafec637          	lui	a2,0xfafec
80403918:	40000513          	li	a0,1024
8040391c:	b60ff0ef          	jal	ra,80402c7c <get_pgtable_items.isra.4.part.5>
80403920:	00050493          	mv	s1,a0
80403924:	08050663          	beqz	a0,804039b0 <print_pgdir+0xf8>
80403928:	01412683          	lw	a3,20(sp)
8040392c:	01012603          	lw	a2,16(sp)
80403930:	01b49313          	slli	t1,s1,0x1b
80403934:	01d49813          	slli	a6,s1,0x1d
80403938:	41f35313          	srai	t1,t1,0x1f
8040393c:	41f85813          	srai	a6,a6,0x1f
80403940:	04837313          	andi	t1,t1,72
80403944:	40c685b3          	sub	a1,a3,a2
80403948:	02d30313          	addi	t1,t1,45
8040394c:	04a87813          	andi	a6,a6,74
80403950:	02d80813          	addi	a6,a6,45
80403954:	00099797          	auipc	a5,0x99
80403958:	e4878793          	addi	a5,a5,-440 # 8049c79c <str.2050>
8040395c:	00099897          	auipc	a7,0x99
80403960:	e4688023          	sb	t1,-448(a7) # 8049c79c <str.2050>
80403964:	01659713          	slli	a4,a1,0x16
80403968:	07200313          	li	t1,114
8040396c:	01669693          	slli	a3,a3,0x16
80403970:	01661613          	slli	a2,a2,0x16
80403974:	00010517          	auipc	a0,0x10
80403978:	3d050513          	addi	a0,a0,976 # 80413d44 <default_pmm_manager+0x348>
8040397c:	00099897          	auipc	a7,0x99
80403980:	e3088123          	sb	a6,-478(a7) # 8049c79e <str.2050+0x2>
80403984:	00099897          	auipc	a7,0x99
80403988:	e0688ca3          	sb	t1,-487(a7) # 8049c79d <str.2050+0x1>
8040398c:	00099817          	auipc	a6,0x99
80403990:	e00809a3          	sb	zero,-493(a6) # 8049c79f <str.2050+0x3>
80403994:	869fc0ef          	jal	ra,804001fc <cprintf>
80403998:	00f4f493          	andi	s1,s1,15
8040399c:	00100793          	li	a5,1
804039a0:	04f48c63          	beq	s1,a5,804039f8 <print_pgdir+0x140>
804039a4:	01412583          	lw	a1,20(sp)
804039a8:	3ff00793          	li	a5,1023
804039ac:	f6b7f0e3          	bgeu	a5,a1,8040390c <print_pgdir+0x54>
804039b0:	00010517          	auipc	a0,0x10
804039b4:	3d850513          	addi	a0,a0,984 # 80413d88 <default_pmm_manager+0x38c>
804039b8:	845fc0ef          	jal	ra,804001fc <cprintf>
804039bc:	05c12083          	lw	ra,92(sp)
804039c0:	05812403          	lw	s0,88(sp)
804039c4:	05412483          	lw	s1,84(sp)
804039c8:	05012903          	lw	s2,80(sp)
804039cc:	04c12983          	lw	s3,76(sp)
804039d0:	04812a03          	lw	s4,72(sp)
804039d4:	04412a83          	lw	s5,68(sp)
804039d8:	04012b03          	lw	s6,64(sp)
804039dc:	03c12b83          	lw	s7,60(sp)
804039e0:	03812c03          	lw	s8,56(sp)
804039e4:	03412c83          	lw	s9,52(sp)
804039e8:	03012d03          	lw	s10,48(sp)
804039ec:	02c12d83          	lw	s11,44(sp)
804039f0:	06010113          	addi	sp,sp,96
804039f4:	00008067          	ret
804039f8:	01012783          	lw	a5,16(sp)
804039fc:	01412583          	lw	a1,20(sp)
80403a00:	00000d93          	li	s11,0
80403a04:	00a79313          	slli	t1,a5,0xa
80403a08:	00f12423          	sw	a5,8(sp)
80403a0c:	fafec7b7          	lui	a5,0xfafec
80403a10:	ffc78793          	addi	a5,a5,-4 # fafebffc <end+0x7ab4f740>
80403a14:	00f12623          	sw	a5,12(sp)
80403a18:	00812783          	lw	a5,8(sp)
80403a1c:	00612e23          	sw	t1,28(sp)
80403a20:	40030c93          	addi	s9,t1,1024
80403a24:	12b7fe63          	bgeu	a5,a1,80403b60 <print_pgdir+0x2a8>
80403a28:	00c12703          	lw	a4,12(sp)
80403a2c:	00178793          	addi	a5,a5,1
80403a30:	00279493          	slli	s1,a5,0x2
80403a34:	00e484b3          	add	s1,s1,a4
80403a38:	0004a603          	lw	a2,0(s1)
80403a3c:	00099a17          	auipc	s4,0x99
80403a40:	d5ca0a13          	addi	s4,s4,-676 # 8049c798 <npage>
80403a44:	fffff9b7          	lui	s3,0xfffff
80403a48:	00261613          	slli	a2,a2,0x2
80403a4c:	000a2703          	lw	a4,0(s4)
80403a50:	00f12423          	sw	a5,8(sp)
80403a54:	00001937          	lui	s2,0x1
80403a58:	00c79793          	slli	a5,a5,0xc
80403a5c:	01367633          	and	a2,a2,s3
80403a60:	40f90933          	sub	s2,s2,a5
80403a64:	00c65793          	srli	a5,a2,0xc
80403a68:	01c12583          	lw	a1,28(sp)
80403a6c:	07200c13          	li	s8,114
80403a70:	00099b97          	auipc	s7,0x99
80403a74:	d2cb8b93          	addi	s7,s7,-724 # 8049c79c <str.2050>
80403a78:	0ae7fe63          	bgeu	a5,a4,80403b34 <print_pgdir+0x27c>
80403a7c:	000aa683          	lw	a3,0(s5)
80403a80:	00d60633          	add	a2,a2,a3
80403a84:	01260633          	add	a2,a2,s2
80403a88:	0d95f463          	bgeu	a1,s9,80403b50 <print_pgdir+0x298>
80403a8c:	01c10713          	addi	a4,sp,28
80403a90:	01810693          	addi	a3,sp,24
80403a94:	000c8513          	mv	a0,s9
80403a98:	9e4ff0ef          	jal	ra,80402c7c <get_pgtable_items.isra.4.part.5>
80403a9c:	00050b13          	mv	s6,a0
80403aa0:	0a050863          	beqz	a0,80403b50 <print_pgdir+0x298>
80403aa4:	12ad8663          	beq	s11,a0,80403bd0 <print_pgdir+0x318>
80403aa8:	060d8263          	beqz	s11,80403b0c <print_pgdir+0x254>
80403aac:	01bd9e13          	slli	t3,s11,0x1b
80403ab0:	01dd9d93          	slli	s11,s11,0x1d
80403ab4:	41fe5e13          	srai	t3,t3,0x1f
80403ab8:	41fddd93          	srai	s11,s11,0x1f
80403abc:	408d05b3          	sub	a1,s10,s0
80403ac0:	048e7e13          	andi	t3,t3,72
80403ac4:	04adfd93          	andi	s11,s11,74
80403ac8:	02de0e13          	addi	t3,t3,45
80403acc:	02dd8d93          	addi	s11,s11,45
80403ad0:	000b8793          	mv	a5,s7
80403ad4:	00c59713          	slli	a4,a1,0xc
80403ad8:	00cd1693          	slli	a3,s10,0xc
80403adc:	00c41613          	slli	a2,s0,0xc
80403ae0:	00010517          	auipc	a0,0x10
80403ae4:	28450513          	addi	a0,a0,644 # 80413d64 <default_pmm_manager+0x368>
80403ae8:	00099817          	auipc	a6,0x99
80403aec:	cbc80a23          	sb	t3,-844(a6) # 8049c79c <str.2050>
80403af0:	00099817          	auipc	a6,0x99
80403af4:	cb8806a3          	sb	s8,-851(a6) # 8049c79d <str.2050+0x1>
80403af8:	00099817          	auipc	a6,0x99
80403afc:	cbb80323          	sb	s11,-858(a6) # 8049c79e <str.2050+0x2>
80403b00:	00099817          	auipc	a6,0x99
80403b04:	c8080fa3          	sb	zero,-865(a6) # 8049c79f <str.2050+0x3>
80403b08:	ef4fc0ef          	jal	ra,804001fc <cprintf>
80403b0c:	01c12d03          	lw	s10,28(sp)
80403b10:	01812403          	lw	s0,24(sp)
80403b14:	000b0d93          	mv	s11,s6
80403b18:	000d0593          	mv	a1,s10
80403b1c:	0004a603          	lw	a2,0(s1)
80403b20:	000a2703          	lw	a4,0(s4)
80403b24:	00261613          	slli	a2,a2,0x2
80403b28:	01367633          	and	a2,a2,s3
80403b2c:	00c65793          	srli	a5,a2,0xc
80403b30:	f4e7e6e3          	bltu	a5,a4,80403a7c <print_pgdir+0x1c4>
80403b34:	00060693          	mv	a3,a2
80403b38:	2b300593          	li	a1,691
80403b3c:	00010617          	auipc	a2,0x10
80403b40:	ef060613          	addi	a2,a2,-272 # 80413a2c <default_pmm_manager+0x30>
80403b44:	00010517          	auipc	a0,0x10
80403b48:	10c50513          	addi	a0,a0,268 # 80413c50 <default_pmm_manager+0x254>
80403b4c:	ad9fc0ef          	jal	ra,80400624 <__panic>
80403b50:	01412583          	lw	a1,20(sp)
80403b54:	00812783          	lw	a5,8(sp)
80403b58:	400c8c93          	addi	s9,s9,1024
80403b5c:	ecb7e6e3          	bltu	a5,a1,80403a28 <print_pgdir+0x170>
80403b60:	e40d84e3          	beqz	s11,804039a8 <print_pgdir+0xf0>
80403b64:	01bd9313          	slli	t1,s11,0x1b
80403b68:	01dd9813          	slli	a6,s11,0x1d
80403b6c:	41f35313          	srai	t1,t1,0x1f
80403b70:	41f85813          	srai	a6,a6,0x1f
80403b74:	04837313          	andi	t1,t1,72
80403b78:	408d05b3          	sub	a1,s10,s0
80403b7c:	02d30313          	addi	t1,t1,45
80403b80:	04a87813          	andi	a6,a6,74
80403b84:	02d80813          	addi	a6,a6,45
80403b88:	00099897          	auipc	a7,0x99
80403b8c:	c0688a23          	sb	t1,-1004(a7) # 8049c79c <str.2050>
80403b90:	00099797          	auipc	a5,0x99
80403b94:	c0c78793          	addi	a5,a5,-1012 # 8049c79c <str.2050>
80403b98:	07200313          	li	t1,114
80403b9c:	00c59713          	slli	a4,a1,0xc
80403ba0:	00cd1693          	slli	a3,s10,0xc
80403ba4:	00c41613          	slli	a2,s0,0xc
80403ba8:	00010517          	auipc	a0,0x10
80403bac:	1bc50513          	addi	a0,a0,444 # 80413d64 <default_pmm_manager+0x368>
80403bb0:	00099897          	auipc	a7,0x99
80403bb4:	bf088723          	sb	a6,-1042(a7) # 8049c79e <str.2050+0x2>
80403bb8:	00099897          	auipc	a7,0x99
80403bbc:	be6882a3          	sb	t1,-1051(a7) # 8049c79d <str.2050+0x1>
80403bc0:	00099817          	auipc	a6,0x99
80403bc4:	bc080fa3          	sb	zero,-1057(a6) # 8049c79f <str.2050+0x3>
80403bc8:	e34fc0ef          	jal	ra,804001fc <cprintf>
80403bcc:	dd9ff06f          	j	804039a4 <print_pgdir+0xec>
80403bd0:	01c12d03          	lw	s10,28(sp)
80403bd4:	000d0593          	mv	a1,s10
80403bd8:	f45ff06f          	j	80403b1c <print_pgdir+0x264>

80403bdc <pmm_init>:
80403bdc:	00010797          	auipc	a5,0x10
80403be0:	e2078793          	addi	a5,a5,-480 # 804139fc <default_pmm_manager>
80403be4:	0007a583          	lw	a1,0(a5)
80403be8:	fe010113          	addi	sp,sp,-32
80403bec:	00010517          	auipc	a0,0x10
80403bf0:	08850513          	addi	a0,a0,136 # 80413c74 <default_pmm_manager+0x278>
80403bf4:	00112e23          	sw	ra,28(sp)
80403bf8:	00099717          	auipc	a4,0x99
80403bfc:	c0f72223          	sw	a5,-1020(a4) # 8049c7fc <pmm_manager>
80403c00:	00812c23          	sw	s0,24(sp)
80403c04:	00912a23          	sw	s1,20(sp)
80403c08:	01212823          	sw	s2,16(sp)
80403c0c:	01312623          	sw	s3,12(sp)
80403c10:	01412423          	sw	s4,8(sp)
80403c14:	00099417          	auipc	s0,0x99
80403c18:	be840413          	addi	s0,s0,-1048 # 8049c7fc <pmm_manager>
80403c1c:	de0fc0ef          	jal	ra,804001fc <cprintf>
80403c20:	00042783          	lw	a5,0(s0)
80403c24:	ffffc497          	auipc	s1,0xffffc
80403c28:	3dc48493          	addi	s1,s1,988 # 80400000 <kern_entry>
80403c2c:	0047a783          	lw	a5,4(a5)
80403c30:	000780e7          	jalr	a5
80403c34:	804007b7          	lui	a5,0x80400
80403c38:	409787b3          	sub	a5,a5,s1
80403c3c:	00010517          	auipc	a0,0x10
80403c40:	05050513          	addi	a0,a0,80 # 80413c8c <default_pmm_manager+0x290>
80403c44:	00099717          	auipc	a4,0x99
80403c48:	baf72e23          	sw	a5,-1092(a4) # 8049c800 <va_pa_offset>
80403c4c:	db0fc0ef          	jal	ra,804001fc <cprintf>
80403c50:	808005b7          	lui	a1,0x80800
80403c54:	fff58693          	addi	a3,a1,-1 # 807fffff <end+0x363743>
80403c58:	00048613          	mv	a2,s1
80403c5c:	409585b3          	sub	a1,a1,s1
80403c60:	00010517          	auipc	a0,0x10
80403c64:	04450513          	addi	a0,a0,68 # 80413ca4 <default_pmm_manager+0x2a8>
80403c68:	d94fc0ef          	jal	ra,804001fc <cprintf>
80403c6c:	fffff737          	lui	a4,0xfffff
80403c70:	0009a797          	auipc	a5,0x9a
80403c74:	c4b78793          	addi	a5,a5,-949 # 8049d8bb <end+0xfff>
80403c78:	00e7f7b3          	and	a5,a5,a4
80403c7c:	00081737          	lui	a4,0x81
80403c80:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403c84:	00099697          	auipc	a3,0x99
80403c88:	b0e6aa23          	sw	a4,-1260(a3) # 8049c798 <npage>
80403c8c:	000106b7          	lui	a3,0x10
80403c90:	00078513          	mv	a0,a5
80403c94:	00099717          	auipc	a4,0x99
80403c98:	b6f72a23          	sw	a5,-1164(a4) # 8049c808 <pages>
80403c9c:	00d786b3          	add	a3,a5,a3
80403ca0:	0047a703          	lw	a4,4(a5)
80403ca4:	02078793          	addi	a5,a5,32
80403ca8:	00176713          	ori	a4,a4,1
80403cac:	fee7a223          	sw	a4,-28(a5)
80403cb0:	fef698e3          	bne	a3,a5,80403ca0 <pmm_init+0xc4>
80403cb4:	804007b7          	lui	a5,0x80400
80403cb8:	1cf6ea63          	bltu	a3,a5,80403e8c <pmm_init+0x2b0>
80403cbc:	00099497          	auipc	s1,0x99
80403cc0:	b4448493          	addi	s1,s1,-1212 # 8049c800 <va_pa_offset>
80403cc4:	0004a783          	lw	a5,0(s1)
80403cc8:	808005b7          	lui	a1,0x80800
80403ccc:	40f686b3          	sub	a3,a3,a5
80403cd0:	14b6e863          	bltu	a3,a1,80403e20 <pmm_init+0x244>
80403cd4:	00100513          	li	a0,1
80403cd8:	868ff0ef          	jal	ra,80402d40 <alloc_pages>
80403cdc:	20050e63          	beqz	a0,80403ef8 <pmm_init+0x31c>
80403ce0:	00099797          	auipc	a5,0x99
80403ce4:	b2878793          	addi	a5,a5,-1240 # 8049c808 <pages>
80403ce8:	0007a683          	lw	a3,0(a5)
80403cec:	00099797          	auipc	a5,0x99
80403cf0:	aac78793          	addi	a5,a5,-1364 # 8049c798 <npage>
80403cf4:	0007a703          	lw	a4,0(a5)
80403cf8:	40d506b3          	sub	a3,a0,a3
80403cfc:	4056d693          	srai	a3,a3,0x5
80403d00:	00080537          	lui	a0,0x80
80403d04:	00a686b3          	add	a3,a3,a0
80403d08:	00c69793          	slli	a5,a3,0xc
80403d0c:	00c7d793          	srli	a5,a5,0xc
80403d10:	00c69693          	slli	a3,a3,0xc
80403d14:	1ce7f663          	bgeu	a5,a4,80403ee0 <pmm_init+0x304>
80403d18:	0004a783          	lw	a5,0(s1)
80403d1c:	00001637          	lui	a2,0x1
80403d20:	00000593          	li	a1,0
80403d24:	00f686b3          	add	a3,a3,a5
80403d28:	00068513          	mv	a0,a3
80403d2c:	00099797          	auipc	a5,0x99
80403d30:	a6d7a423          	sw	a3,-1432(a5) # 8049c794 <boot_pgdir>
80403d34:	5650e0ef          	jal	ra,80412a98 <memset>
80403d38:	00099797          	auipc	a5,0x99
80403d3c:	a5c78793          	addi	a5,a5,-1444 # 8049c794 <boot_pgdir>
80403d40:	0007a903          	lw	s2,0(a5)
80403d44:	80400737          	lui	a4,0x80400
80403d48:	16e96e63          	bltu	s2,a4,80403ec4 <pmm_init+0x2e8>
80403d4c:	0004a783          	lw	a5,0(s1)
80403d50:	000016b7          	lui	a3,0x1
80403d54:	00d905b3          	add	a1,s2,a3
80403d58:	40f90533          	sub	a0,s2,a5
80403d5c:	00c55613          	srli	a2,a0,0xc
80403d60:	00a61613          	slli	a2,a2,0xa
80403d64:	40f707b3          	sub	a5,a4,a5
80403d68:	00166813          	ori	a6,a2,1
80403d6c:	00e7c733          	xor	a4,a5,a4
80403d70:	00766613          	ori	a2,a2,7
80403d74:	fff68693          	addi	a3,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403d78:	00099897          	auipc	a7,0x99
80403d7c:	a8a8a623          	sw	a0,-1396(a7) # 8049c804 <boot_cr3>
80403d80:	fb05a623          	sw	a6,-84(a1) # 807fffac <end+0x3636f0>
80403d84:	fac5a823          	sw	a2,-80(a1)
80403d88:	00d77733          	and	a4,a4,a3
80403d8c:	10071c63          	bnez	a4,80403ea4 <pmm_init+0x2c8>
80403d90:	fffff437          	lui	s0,0xfffff
80403d94:	0087f7b3          	and	a5,a5,s0
80403d98:	7fc00437          	lui	s0,0x7fc00
80403d9c:	804004b7          	lui	s1,0x80400
80403da0:	00878433          	add	s0,a5,s0
80403da4:	00001a37          	lui	s4,0x1
80403da8:	80c009b7          	lui	s3,0x80c00
80403dac:	00100613          	li	a2,1
80403db0:	00048593          	mv	a1,s1
80403db4:	00090513          	mv	a0,s2
80403db8:	91cff0ef          	jal	ra,80402ed4 <get_pte>
80403dbc:	009407b3          	add	a5,s0,s1
80403dc0:	0a050663          	beqz	a0,80403e6c <pmm_init+0x290>
80403dc4:	00c7d793          	srli	a5,a5,0xc
80403dc8:	00a79793          	slli	a5,a5,0xa
80403dcc:	00f7e793          	ori	a5,a5,15
80403dd0:	00f52023          	sw	a5,0(a0) # 80000 <_binary_bin_sfs_img_size+0x8000>
80403dd4:	014484b3          	add	s1,s1,s4
80403dd8:	fd349ae3          	bne	s1,s3,80403dac <pmm_init+0x1d0>
80403ddc:	00099797          	auipc	a5,0x99
80403de0:	a2878793          	addi	a5,a5,-1496 # 8049c804 <boot_cr3>
80403de4:	0007a783          	lw	a5,0(a5)
80403de8:	80000737          	lui	a4,0x80000
80403dec:	00c7d793          	srli	a5,a5,0xc
80403df0:	00e7e7b3          	or	a5,a5,a4
80403df4:	18079073          	csrw	satp,a5
80403df8:	12000073          	sfence.vma
80403dfc:	abdff0ef          	jal	ra,804038b8 <print_pgdir>
80403e00:	01812403          	lw	s0,24(sp)
80403e04:	01c12083          	lw	ra,28(sp)
80403e08:	01412483          	lw	s1,20(sp)
80403e0c:	01012903          	lw	s2,16(sp)
80403e10:	00c12983          	lw	s3,12(sp)
80403e14:	00812a03          	lw	s4,8(sp)
80403e18:	02010113          	addi	sp,sp,32
80403e1c:	b7dfe06f          	j	80402998 <kmalloc_init>
80403e20:	000017b7          	lui	a5,0x1
80403e24:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403e28:	00f686b3          	add	a3,a3,a5
80403e2c:	00081737          	lui	a4,0x81
80403e30:	00c6d793          	srli	a5,a3,0xc
80403e34:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403e38:	0ce78c63          	beq	a5,a4,80403f10 <pmm_init+0x334>
80403e3c:	00042703          	lw	a4,0(s0) # 7fc00000 <_binary_bin_sfs_img_size+0x7fb88000>
80403e40:	fffff637          	lui	a2,0xfffff
80403e44:	00c6f6b3          	and	a3,a3,a2
80403e48:	fff80637          	lui	a2,0xfff80
80403e4c:	00c787b3          	add	a5,a5,a2
80403e50:	00872703          	lw	a4,8(a4)
80403e54:	40d585b3          	sub	a1,a1,a3
80403e58:	00579793          	slli	a5,a5,0x5
80403e5c:	00c5d593          	srli	a1,a1,0xc
80403e60:	00f50533          	add	a0,a0,a5
80403e64:	000700e7          	jalr	a4
80403e68:	e6dff06f          	j	80403cd4 <pmm_init+0xf8>
80403e6c:	00010697          	auipc	a3,0x10
80403e70:	e9468693          	addi	a3,a3,-364 # 80413d00 <default_pmm_manager+0x304>
80403e74:	0000f617          	auipc	a2,0xf
80403e78:	05460613          	addi	a2,a2,84 # 80412ec8 <commands+0x1bc>
80403e7c:	0aa00593          	li	a1,170
80403e80:	00010517          	auipc	a0,0x10
80403e84:	dd050513          	addi	a0,a0,-560 # 80413c50 <default_pmm_manager+0x254>
80403e88:	f9cfc0ef          	jal	ra,80400624 <__panic>
80403e8c:	00010617          	auipc	a2,0x10
80403e90:	bd460613          	addi	a2,a2,-1068 # 80413a60 <default_pmm_manager+0x64>
80403e94:	08e00593          	li	a1,142
80403e98:	00010517          	auipc	a0,0x10
80403e9c:	db850513          	addi	a0,a0,-584 # 80413c50 <default_pmm_manager+0x254>
80403ea0:	f84fc0ef          	jal	ra,80400624 <__panic>
80403ea4:	00010697          	auipc	a3,0x10
80403ea8:	e4468693          	addi	a3,a3,-444 # 80413ce8 <default_pmm_manager+0x2ec>
80403eac:	0000f617          	auipc	a2,0xf
80403eb0:	01c60613          	addi	a2,a2,28 # 80412ec8 <commands+0x1bc>
80403eb4:	0a400593          	li	a1,164
80403eb8:	00010517          	auipc	a0,0x10
80403ebc:	d9850513          	addi	a0,a0,-616 # 80413c50 <default_pmm_manager+0x254>
80403ec0:	f64fc0ef          	jal	ra,80400624 <__panic>
80403ec4:	00090693          	mv	a3,s2
80403ec8:	00010617          	auipc	a2,0x10
80403ecc:	b9860613          	addi	a2,a2,-1128 # 80413a60 <default_pmm_manager+0x64>
80403ed0:	0d400593          	li	a1,212
80403ed4:	00010517          	auipc	a0,0x10
80403ed8:	d7c50513          	addi	a0,a0,-644 # 80413c50 <default_pmm_manager+0x254>
80403edc:	f48fc0ef          	jal	ra,80400624 <__panic>
80403ee0:	00010617          	auipc	a2,0x10
80403ee4:	b4c60613          	addi	a2,a2,-1204 # 80413a2c <default_pmm_manager+0x30>
80403ee8:	06e00593          	li	a1,110
80403eec:	00010517          	auipc	a0,0x10
80403ef0:	b6450513          	addi	a0,a0,-1180 # 80413a50 <default_pmm_manager+0x54>
80403ef4:	f30fc0ef          	jal	ra,80400624 <__panic>
80403ef8:	00010617          	auipc	a2,0x10
80403efc:	dd460613          	addi	a2,a2,-556 # 80413ccc <default_pmm_manager+0x2d0>
80403f00:	0b600593          	li	a1,182
80403f04:	00010517          	auipc	a0,0x10
80403f08:	d4c50513          	addi	a0,a0,-692 # 80413c50 <default_pmm_manager+0x254>
80403f0c:	f18fc0ef          	jal	ra,80400624 <__panic>
80403f10:	e11fe0ef          	jal	ra,80402d20 <pa2page.part.6>

80403f14 <swap_init>:
80403f14:	ff010113          	addi	sp,sp,-16
80403f18:	00112623          	sw	ra,12(sp)
80403f1c:	00812423          	sw	s0,8(sp)
80403f20:	510090ef          	jal	ra,8040d430 <swapfs_init>
80403f24:	00099797          	auipc	a5,0x99
80403f28:	95c78793          	addi	a5,a5,-1700 # 8049c880 <max_swap_offset>
80403f2c:	0007a683          	lw	a3,0(a5)
80403f30:	010007b7          	lui	a5,0x1000
80403f34:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf87ff8>
80403f38:	ff968713          	addi	a4,a3,-7
80403f3c:	06e7ea63          	bltu	a5,a4,80403fb0 <swap_init+0x9c>
80403f40:	00095797          	auipc	a5,0x95
80403f44:	0c078793          	addi	a5,a5,192 # 80499000 <swap_manager_fifo>
80403f48:	0047a703          	lw	a4,4(a5)
80403f4c:	00099697          	auipc	a3,0x99
80403f50:	84f6aa23          	sw	a5,-1964(a3) # 8049c7a0 <sm>
80403f54:	000700e7          	jalr	a4
80403f58:	00050413          	mv	s0,a0
80403f5c:	00050c63          	beqz	a0,80403f74 <swap_init+0x60>
80403f60:	00040513          	mv	a0,s0
80403f64:	00c12083          	lw	ra,12(sp)
80403f68:	00812403          	lw	s0,8(sp)
80403f6c:	01010113          	addi	sp,sp,16
80403f70:	00008067          	ret
80403f74:	00099797          	auipc	a5,0x99
80403f78:	82c78793          	addi	a5,a5,-2004 # 8049c7a0 <sm>
80403f7c:	0007a783          	lw	a5,0(a5)
80403f80:	00010517          	auipc	a0,0x10
80403f84:	efc50513          	addi	a0,a0,-260 # 80413e7c <default_pmm_manager+0x480>
80403f88:	0007a583          	lw	a1,0(a5)
80403f8c:	00100793          	li	a5,1
80403f90:	00099717          	auipc	a4,0x99
80403f94:	80f72a23          	sw	a5,-2028(a4) # 8049c7a4 <swap_init_ok>
80403f98:	a64fc0ef          	jal	ra,804001fc <cprintf>
80403f9c:	00040513          	mv	a0,s0
80403fa0:	00c12083          	lw	ra,12(sp)
80403fa4:	00812403          	lw	s0,8(sp)
80403fa8:	01010113          	addi	sp,sp,16
80403fac:	00008067          	ret
80403fb0:	00010617          	auipc	a2,0x10
80403fb4:	ea060613          	addi	a2,a2,-352 # 80413e50 <default_pmm_manager+0x454>
80403fb8:	02500593          	li	a1,37
80403fbc:	00010517          	auipc	a0,0x10
80403fc0:	eb050513          	addi	a0,a0,-336 # 80413e6c <default_pmm_manager+0x470>
80403fc4:	e60fc0ef          	jal	ra,80400624 <__panic>

80403fc8 <swap_init_mm>:
80403fc8:	00098797          	auipc	a5,0x98
80403fcc:	7d878793          	addi	a5,a5,2008 # 8049c7a0 <sm>
80403fd0:	0007a783          	lw	a5,0(a5)
80403fd4:	0087a303          	lw	t1,8(a5)
80403fd8:	00030067          	jr	t1

80403fdc <swap_map_swappable>:
80403fdc:	00098797          	auipc	a5,0x98
80403fe0:	7c478793          	addi	a5,a5,1988 # 8049c7a0 <sm>
80403fe4:	0007a783          	lw	a5,0(a5)
80403fe8:	0107a303          	lw	t1,16(a5)
80403fec:	00030067          	jr	t1

80403ff0 <swap_out>:
80403ff0:	fc010113          	addi	sp,sp,-64
80403ff4:	02112e23          	sw	ra,60(sp)
80403ff8:	02812c23          	sw	s0,56(sp)
80403ffc:	02912a23          	sw	s1,52(sp)
80404000:	03212823          	sw	s2,48(sp)
80404004:	03312623          	sw	s3,44(sp)
80404008:	03412423          	sw	s4,40(sp)
8040400c:	03512223          	sw	s5,36(sp)
80404010:	03612023          	sw	s6,32(sp)
80404014:	01712e23          	sw	s7,28(sp)
80404018:	01812c23          	sw	s8,24(sp)
8040401c:	14058c63          	beqz	a1,80404174 <swap_out+0x184>
80404020:	00060a93          	mv	s5,a2
80404024:	00050913          	mv	s2,a0
80404028:	00058a13          	mv	s4,a1
8040402c:	00000413          	li	s0,0
80404030:	00098997          	auipc	s3,0x98
80404034:	77098993          	addi	s3,s3,1904 # 8049c7a0 <sm>
80404038:	00010b17          	auipc	s6,0x10
8040403c:	eb8b0b13          	addi	s6,s6,-328 # 80413ef0 <default_pmm_manager+0x4f4>
80404040:	00010b97          	auipc	s7,0x10
80404044:	e98b8b93          	addi	s7,s7,-360 # 80413ed8 <default_pmm_manager+0x4dc>
80404048:	0580006f          	j	804040a0 <swap_out+0xb0>
8040404c:	00c12783          	lw	a5,12(sp)
80404050:	00048613          	mv	a2,s1
80404054:	00040593          	mv	a1,s0
80404058:	01c7a683          	lw	a3,28(a5)
8040405c:	000b0513          	mv	a0,s6
80404060:	00140413          	addi	s0,s0,1
80404064:	00c6d693          	srli	a3,a3,0xc
80404068:	00168693          	addi	a3,a3,1
8040406c:	990fc0ef          	jal	ra,804001fc <cprintf>
80404070:	00c12503          	lw	a0,12(sp)
80404074:	00100593          	li	a1,1
80404078:	01c52783          	lw	a5,28(a0)
8040407c:	00c7d793          	srli	a5,a5,0xc
80404080:	00178793          	addi	a5,a5,1
80404084:	00879793          	slli	a5,a5,0x8
80404088:	00fc2023          	sw	a5,0(s8)
8040408c:	d7dfe0ef          	jal	ra,80402e08 <free_pages>
80404090:	00c92503          	lw	a0,12(s2) # 100c <_binary_bin_swap_img_size-0x6ff4>
80404094:	00048593          	mv	a1,s1
80404098:	f38ff0ef          	jal	ra,804037d0 <tlb_invalidate>
8040409c:	088a0863          	beq	s4,s0,8040412c <swap_out+0x13c>
804040a0:	0009a783          	lw	a5,0(s3)
804040a4:	000a8613          	mv	a2,s5
804040a8:	00c10593          	addi	a1,sp,12
804040ac:	0187a783          	lw	a5,24(a5)
804040b0:	00090513          	mv	a0,s2
804040b4:	000780e7          	jalr	a5
804040b8:	0a051463          	bnez	a0,80404160 <swap_out+0x170>
804040bc:	00c12783          	lw	a5,12(sp)
804040c0:	00c92503          	lw	a0,12(s2)
804040c4:	00000613          	li	a2,0
804040c8:	01c7a483          	lw	s1,28(a5)
804040cc:	00048593          	mv	a1,s1
804040d0:	e05fe0ef          	jal	ra,80402ed4 <get_pte>
804040d4:	00052783          	lw	a5,0(a0)
804040d8:	00050c13          	mv	s8,a0
804040dc:	0017f793          	andi	a5,a5,1
804040e0:	08078e63          	beqz	a5,8040417c <swap_out+0x18c>
804040e4:	00c12583          	lw	a1,12(sp)
804040e8:	01c5a783          	lw	a5,28(a1)
804040ec:	00c7d793          	srli	a5,a5,0xc
804040f0:	00178513          	addi	a0,a5,1
804040f4:	00851513          	slli	a0,a0,0x8
804040f8:	444090ef          	jal	ra,8040d53c <swapfs_write>
804040fc:	f40508e3          	beqz	a0,8040404c <swap_out+0x5c>
80404100:	000b8513          	mv	a0,s7
80404104:	8f8fc0ef          	jal	ra,804001fc <cprintf>
80404108:	0009a783          	lw	a5,0(s3)
8040410c:	00c12603          	lw	a2,12(sp)
80404110:	00000693          	li	a3,0
80404114:	0107a783          	lw	a5,16(a5)
80404118:	00048593          	mv	a1,s1
8040411c:	00090513          	mv	a0,s2
80404120:	00140413          	addi	s0,s0,1
80404124:	000780e7          	jalr	a5
80404128:	f68a1ce3          	bne	s4,s0,804040a0 <swap_out+0xb0>
8040412c:	00040513          	mv	a0,s0
80404130:	03c12083          	lw	ra,60(sp)
80404134:	03812403          	lw	s0,56(sp)
80404138:	03412483          	lw	s1,52(sp)
8040413c:	03012903          	lw	s2,48(sp)
80404140:	02c12983          	lw	s3,44(sp)
80404144:	02812a03          	lw	s4,40(sp)
80404148:	02412a83          	lw	s5,36(sp)
8040414c:	02012b03          	lw	s6,32(sp)
80404150:	01c12b83          	lw	s7,28(sp)
80404154:	01812c03          	lw	s8,24(sp)
80404158:	04010113          	addi	sp,sp,64
8040415c:	00008067          	ret
80404160:	00040593          	mv	a1,s0
80404164:	00010517          	auipc	a0,0x10
80404168:	d2c50513          	addi	a0,a0,-724 # 80413e90 <default_pmm_manager+0x494>
8040416c:	890fc0ef          	jal	ra,804001fc <cprintf>
80404170:	fbdff06f          	j	8040412c <swap_out+0x13c>
80404174:	00000413          	li	s0,0
80404178:	fb5ff06f          	j	8040412c <swap_out+0x13c>
8040417c:	00010697          	auipc	a3,0x10
80404180:	d4468693          	addi	a3,a3,-700 # 80413ec0 <default_pmm_manager+0x4c4>
80404184:	0000f617          	auipc	a2,0xf
80404188:	d4460613          	addi	a2,a2,-700 # 80412ec8 <commands+0x1bc>
8040418c:	05500593          	li	a1,85
80404190:	00010517          	auipc	a0,0x10
80404194:	cdc50513          	addi	a0,a0,-804 # 80413e6c <default_pmm_manager+0x470>
80404198:	c8cfc0ef          	jal	ra,80400624 <__panic>

8040419c <swap_in>:
8040419c:	fe010113          	addi	sp,sp,-32
804041a0:	01212823          	sw	s2,16(sp)
804041a4:	00050913          	mv	s2,a0
804041a8:	00100513          	li	a0,1
804041ac:	00912a23          	sw	s1,20(sp)
804041b0:	01312623          	sw	s3,12(sp)
804041b4:	00112e23          	sw	ra,28(sp)
804041b8:	00812c23          	sw	s0,24(sp)
804041bc:	00058493          	mv	s1,a1
804041c0:	00060993          	mv	s3,a2
804041c4:	b7dfe0ef          	jal	ra,80402d40 <alloc_pages>
804041c8:	06050263          	beqz	a0,8040422c <swap_in+0x90>
804041cc:	00050413          	mv	s0,a0
804041d0:	00c92503          	lw	a0,12(s2)
804041d4:	00000613          	li	a2,0
804041d8:	00048593          	mv	a1,s1
804041dc:	cf9fe0ef          	jal	ra,80402ed4 <get_pte>
804041e0:	00050913          	mv	s2,a0
804041e4:	00052503          	lw	a0,0(a0)
804041e8:	00040593          	mv	a1,s0
804041ec:	290090ef          	jal	ra,8040d47c <swapfs_read>
804041f0:	00092583          	lw	a1,0(s2)
804041f4:	00048613          	mv	a2,s1
804041f8:	00010517          	auipc	a0,0x10
804041fc:	c1850513          	addi	a0,a0,-1000 # 80413e10 <default_pmm_manager+0x414>
80404200:	0085d593          	srli	a1,a1,0x8
80404204:	ff9fb0ef          	jal	ra,804001fc <cprintf>
80404208:	01c12083          	lw	ra,28(sp)
8040420c:	0089a023          	sw	s0,0(s3)
80404210:	01812403          	lw	s0,24(sp)
80404214:	01412483          	lw	s1,20(sp)
80404218:	01012903          	lw	s2,16(sp)
8040421c:	00c12983          	lw	s3,12(sp)
80404220:	00000513          	li	a0,0
80404224:	02010113          	addi	sp,sp,32
80404228:	00008067          	ret
8040422c:	00010697          	auipc	a3,0x10
80404230:	bd468693          	addi	a3,a3,-1068 # 80413e00 <default_pmm_manager+0x404>
80404234:	0000f617          	auipc	a2,0xf
80404238:	c9460613          	addi	a2,a2,-876 # 80412ec8 <commands+0x1bc>
8040423c:	06b00593          	li	a1,107
80404240:	00010517          	auipc	a0,0x10
80404244:	c2c50513          	addi	a0,a0,-980 # 80413e6c <default_pmm_manager+0x470>
80404248:	bdcfc0ef          	jal	ra,80400624 <__panic>

8040424c <_fifo_init_mm>:
8040424c:	00098797          	auipc	a5,0x98
80404250:	65c78793          	addi	a5,a5,1628 # 8049c8a8 <pra_list_head>
80404254:	00f52a23          	sw	a5,20(a0)
80404258:	00f7a223          	sw	a5,4(a5)
8040425c:	00f7a023          	sw	a5,0(a5)
80404260:	00000513          	li	a0,0
80404264:	00008067          	ret

80404268 <_fifo_init>:
80404268:	00000513          	li	a0,0
8040426c:	00008067          	ret

80404270 <_fifo_set_unswappable>:
80404270:	00000513          	li	a0,0
80404274:	00008067          	ret

80404278 <_fifo_tick_event>:
80404278:	00000513          	li	a0,0
8040427c:	00008067          	ret

80404280 <_fifo_check_swap>:
80404280:	fd010113          	addi	sp,sp,-48
80404284:	01312e23          	sw	s3,28(sp)
80404288:	01412c23          	sw	s4,24(sp)
8040428c:	00010517          	auipc	a0,0x10
80404290:	ca450513          	addi	a0,a0,-860 # 80413f30 <default_pmm_manager+0x534>
80404294:	000039b7          	lui	s3,0x3
80404298:	00c00a13          	li	s4,12
8040429c:	02812423          	sw	s0,40(sp)
804042a0:	02912223          	sw	s1,36(sp)
804042a4:	02112623          	sw	ra,44(sp)
804042a8:	03212023          	sw	s2,32(sp)
804042ac:	01512a23          	sw	s5,20(sp)
804042b0:	01612823          	sw	s6,16(sp)
804042b4:	01712623          	sw	s7,12(sp)
804042b8:	01812423          	sw	s8,8(sp)
804042bc:	01912223          	sw	s9,4(sp)
804042c0:	00098417          	auipc	s0,0x98
804042c4:	4e840413          	addi	s0,s0,1256 # 8049c7a8 <pgfault_num>
804042c8:	f35fb0ef          	jal	ra,804001fc <cprintf>
804042cc:	01498023          	sb	s4,0(s3) # 3000 <_binary_bin_swap_img_size-0x5000>
804042d0:	00042483          	lw	s1,0(s0)
804042d4:	00400793          	li	a5,4
804042d8:	18f49863          	bne	s1,a5,80404468 <_fifo_check_swap+0x1e8>
804042dc:	00010517          	auipc	a0,0x10
804042e0:	ca450513          	addi	a0,a0,-860 # 80413f80 <default_pmm_manager+0x584>
804042e4:	00001b37          	lui	s6,0x1
804042e8:	00a00b93          	li	s7,10
804042ec:	f11fb0ef          	jal	ra,804001fc <cprintf>
804042f0:	017b0023          	sb	s7,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
804042f4:	00042903          	lw	s2,0(s0)
804042f8:	2e991863          	bne	s2,s1,804045e8 <_fifo_check_swap+0x368>
804042fc:	00010517          	auipc	a0,0x10
80404300:	cac50513          	addi	a0,a0,-852 # 80413fa8 <default_pmm_manager+0x5ac>
80404304:	00004c37          	lui	s8,0x4
80404308:	00d00c93          	li	s9,13
8040430c:	ef1fb0ef          	jal	ra,804001fc <cprintf>
80404310:	019c0023          	sb	s9,0(s8) # 4000 <_binary_bin_swap_img_size-0x4000>
80404314:	00042a83          	lw	s5,0(s0)
80404318:	2b2a9863          	bne	s5,s2,804045c8 <_fifo_check_swap+0x348>
8040431c:	00010517          	auipc	a0,0x10
80404320:	cb450513          	addi	a0,a0,-844 # 80413fd0 <default_pmm_manager+0x5d4>
80404324:	000024b7          	lui	s1,0x2
80404328:	00b00913          	li	s2,11
8040432c:	ed1fb0ef          	jal	ra,804001fc <cprintf>
80404330:	01248023          	sb	s2,0(s1) # 2000 <_binary_bin_swap_img_size-0x6000>
80404334:	00042783          	lw	a5,0(s0)
80404338:	27579863          	bne	a5,s5,804045a8 <_fifo_check_swap+0x328>
8040433c:	00010517          	auipc	a0,0x10
80404340:	cbc50513          	addi	a0,a0,-836 # 80413ff8 <default_pmm_manager+0x5fc>
80404344:	eb9fb0ef          	jal	ra,804001fc <cprintf>
80404348:	000057b7          	lui	a5,0x5
8040434c:	00e00713          	li	a4,14
80404350:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80404354:	00042a83          	lw	s5,0(s0)
80404358:	00500793          	li	a5,5
8040435c:	22fa9663          	bne	s5,a5,80404588 <_fifo_check_swap+0x308>
80404360:	00010517          	auipc	a0,0x10
80404364:	c7050513          	addi	a0,a0,-912 # 80413fd0 <default_pmm_manager+0x5d4>
80404368:	e95fb0ef          	jal	ra,804001fc <cprintf>
8040436c:	01248023          	sb	s2,0(s1)
80404370:	00042783          	lw	a5,0(s0)
80404374:	1f579a63          	bne	a5,s5,80404568 <_fifo_check_swap+0x2e8>
80404378:	00010517          	auipc	a0,0x10
8040437c:	c0850513          	addi	a0,a0,-1016 # 80413f80 <default_pmm_manager+0x584>
80404380:	e7dfb0ef          	jal	ra,804001fc <cprintf>
80404384:	017b0023          	sb	s7,0(s6)
80404388:	00042703          	lw	a4,0(s0)
8040438c:	00600793          	li	a5,6
80404390:	1af71c63          	bne	a4,a5,80404548 <_fifo_check_swap+0x2c8>
80404394:	00010517          	auipc	a0,0x10
80404398:	c3c50513          	addi	a0,a0,-964 # 80413fd0 <default_pmm_manager+0x5d4>
8040439c:	e61fb0ef          	jal	ra,804001fc <cprintf>
804043a0:	01248023          	sb	s2,0(s1)
804043a4:	00042703          	lw	a4,0(s0)
804043a8:	00700793          	li	a5,7
804043ac:	16f71e63          	bne	a4,a5,80404528 <_fifo_check_swap+0x2a8>
804043b0:	00010517          	auipc	a0,0x10
804043b4:	b8050513          	addi	a0,a0,-1152 # 80413f30 <default_pmm_manager+0x534>
804043b8:	e45fb0ef          	jal	ra,804001fc <cprintf>
804043bc:	01498023          	sb	s4,0(s3)
804043c0:	00042703          	lw	a4,0(s0)
804043c4:	00800793          	li	a5,8
804043c8:	14f71063          	bne	a4,a5,80404508 <_fifo_check_swap+0x288>
804043cc:	00010517          	auipc	a0,0x10
804043d0:	bdc50513          	addi	a0,a0,-1060 # 80413fa8 <default_pmm_manager+0x5ac>
804043d4:	e29fb0ef          	jal	ra,804001fc <cprintf>
804043d8:	019c0023          	sb	s9,0(s8)
804043dc:	00042703          	lw	a4,0(s0)
804043e0:	00900793          	li	a5,9
804043e4:	10f71263          	bne	a4,a5,804044e8 <_fifo_check_swap+0x268>
804043e8:	00010517          	auipc	a0,0x10
804043ec:	c1050513          	addi	a0,a0,-1008 # 80413ff8 <default_pmm_manager+0x5fc>
804043f0:	e0dfb0ef          	jal	ra,804001fc <cprintf>
804043f4:	000057b7          	lui	a5,0x5
804043f8:	00e00713          	li	a4,14
804043fc:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80404400:	00042483          	lw	s1,0(s0)
80404404:	00a00793          	li	a5,10
80404408:	0cf49063          	bne	s1,a5,804044c8 <_fifo_check_swap+0x248>
8040440c:	00010517          	auipc	a0,0x10
80404410:	b7450513          	addi	a0,a0,-1164 # 80413f80 <default_pmm_manager+0x584>
80404414:	de9fb0ef          	jal	ra,804001fc <cprintf>
80404418:	000017b7          	lui	a5,0x1
8040441c:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
80404420:	08979463          	bne	a5,s1,804044a8 <_fifo_check_swap+0x228>
80404424:	00042703          	lw	a4,0(s0)
80404428:	00b00793          	li	a5,11
8040442c:	04f71e63          	bne	a4,a5,80404488 <_fifo_check_swap+0x208>
80404430:	02c12083          	lw	ra,44(sp)
80404434:	02812403          	lw	s0,40(sp)
80404438:	02412483          	lw	s1,36(sp)
8040443c:	02012903          	lw	s2,32(sp)
80404440:	01c12983          	lw	s3,28(sp)
80404444:	01812a03          	lw	s4,24(sp)
80404448:	01412a83          	lw	s5,20(sp)
8040444c:	01012b03          	lw	s6,16(sp)
80404450:	00c12b83          	lw	s7,12(sp)
80404454:	00812c03          	lw	s8,8(sp)
80404458:	00412c83          	lw	s9,4(sp)
8040445c:	00000513          	li	a0,0
80404460:	03010113          	addi	sp,sp,48
80404464:	00008067          	ret
80404468:	00010697          	auipc	a3,0x10
8040446c:	af068693          	addi	a3,a3,-1296 # 80413f58 <default_pmm_manager+0x55c>
80404470:	0000f617          	auipc	a2,0xf
80404474:	a5860613          	addi	a2,a2,-1448 # 80412ec8 <commands+0x1bc>
80404478:	05f00593          	li	a1,95
8040447c:	00010517          	auipc	a0,0x10
80404480:	af050513          	addi	a0,a0,-1296 # 80413f6c <default_pmm_manager+0x570>
80404484:	9a0fc0ef          	jal	ra,80400624 <__panic>
80404488:	00010697          	auipc	a3,0x10
8040448c:	c3468693          	addi	a3,a3,-972 # 804140bc <default_pmm_manager+0x6c0>
80404490:	0000f617          	auipc	a2,0xf
80404494:	a3860613          	addi	a2,a2,-1480 # 80412ec8 <commands+0x1bc>
80404498:	08100593          	li	a1,129
8040449c:	00010517          	auipc	a0,0x10
804044a0:	ad050513          	addi	a0,a0,-1328 # 80413f6c <default_pmm_manager+0x570>
804044a4:	980fc0ef          	jal	ra,80400624 <__panic>
804044a8:	00010697          	auipc	a3,0x10
804044ac:	bf068693          	addi	a3,a3,-1040 # 80414098 <default_pmm_manager+0x69c>
804044b0:	0000f617          	auipc	a2,0xf
804044b4:	a1860613          	addi	a2,a2,-1512 # 80412ec8 <commands+0x1bc>
804044b8:	07f00593          	li	a1,127
804044bc:	00010517          	auipc	a0,0x10
804044c0:	ab050513          	addi	a0,a0,-1360 # 80413f6c <default_pmm_manager+0x570>
804044c4:	960fc0ef          	jal	ra,80400624 <__panic>
804044c8:	00010697          	auipc	a3,0x10
804044cc:	bbc68693          	addi	a3,a3,-1092 # 80414084 <default_pmm_manager+0x688>
804044d0:	0000f617          	auipc	a2,0xf
804044d4:	9f860613          	addi	a2,a2,-1544 # 80412ec8 <commands+0x1bc>
804044d8:	07d00593          	li	a1,125
804044dc:	00010517          	auipc	a0,0x10
804044e0:	a9050513          	addi	a0,a0,-1392 # 80413f6c <default_pmm_manager+0x570>
804044e4:	940fc0ef          	jal	ra,80400624 <__panic>
804044e8:	00010697          	auipc	a3,0x10
804044ec:	b8868693          	addi	a3,a3,-1144 # 80414070 <default_pmm_manager+0x674>
804044f0:	0000f617          	auipc	a2,0xf
804044f4:	9d860613          	addi	a2,a2,-1576 # 80412ec8 <commands+0x1bc>
804044f8:	07a00593          	li	a1,122
804044fc:	00010517          	auipc	a0,0x10
80404500:	a7050513          	addi	a0,a0,-1424 # 80413f6c <default_pmm_manager+0x570>
80404504:	920fc0ef          	jal	ra,80400624 <__panic>
80404508:	00010697          	auipc	a3,0x10
8040450c:	b5468693          	addi	a3,a3,-1196 # 8041405c <default_pmm_manager+0x660>
80404510:	0000f617          	auipc	a2,0xf
80404514:	9b860613          	addi	a2,a2,-1608 # 80412ec8 <commands+0x1bc>
80404518:	07700593          	li	a1,119
8040451c:	00010517          	auipc	a0,0x10
80404520:	a5050513          	addi	a0,a0,-1456 # 80413f6c <default_pmm_manager+0x570>
80404524:	900fc0ef          	jal	ra,80400624 <__panic>
80404528:	00010697          	auipc	a3,0x10
8040452c:	b2068693          	addi	a3,a3,-1248 # 80414048 <default_pmm_manager+0x64c>
80404530:	0000f617          	auipc	a2,0xf
80404534:	99860613          	addi	a2,a2,-1640 # 80412ec8 <commands+0x1bc>
80404538:	07400593          	li	a1,116
8040453c:	00010517          	auipc	a0,0x10
80404540:	a3050513          	addi	a0,a0,-1488 # 80413f6c <default_pmm_manager+0x570>
80404544:	8e0fc0ef          	jal	ra,80400624 <__panic>
80404548:	00010697          	auipc	a3,0x10
8040454c:	aec68693          	addi	a3,a3,-1300 # 80414034 <default_pmm_manager+0x638>
80404550:	0000f617          	auipc	a2,0xf
80404554:	97860613          	addi	a2,a2,-1672 # 80412ec8 <commands+0x1bc>
80404558:	07100593          	li	a1,113
8040455c:	00010517          	auipc	a0,0x10
80404560:	a1050513          	addi	a0,a0,-1520 # 80413f6c <default_pmm_manager+0x570>
80404564:	8c0fc0ef          	jal	ra,80400624 <__panic>
80404568:	00010697          	auipc	a3,0x10
8040456c:	ab868693          	addi	a3,a3,-1352 # 80414020 <default_pmm_manager+0x624>
80404570:	0000f617          	auipc	a2,0xf
80404574:	95860613          	addi	a2,a2,-1704 # 80412ec8 <commands+0x1bc>
80404578:	06e00593          	li	a1,110
8040457c:	00010517          	auipc	a0,0x10
80404580:	9f050513          	addi	a0,a0,-1552 # 80413f6c <default_pmm_manager+0x570>
80404584:	8a0fc0ef          	jal	ra,80400624 <__panic>
80404588:	00010697          	auipc	a3,0x10
8040458c:	a9868693          	addi	a3,a3,-1384 # 80414020 <default_pmm_manager+0x624>
80404590:	0000f617          	auipc	a2,0xf
80404594:	93860613          	addi	a2,a2,-1736 # 80412ec8 <commands+0x1bc>
80404598:	06b00593          	li	a1,107
8040459c:	00010517          	auipc	a0,0x10
804045a0:	9d050513          	addi	a0,a0,-1584 # 80413f6c <default_pmm_manager+0x570>
804045a4:	880fc0ef          	jal	ra,80400624 <__panic>
804045a8:	00010697          	auipc	a3,0x10
804045ac:	9b068693          	addi	a3,a3,-1616 # 80413f58 <default_pmm_manager+0x55c>
804045b0:	0000f617          	auipc	a2,0xf
804045b4:	91860613          	addi	a2,a2,-1768 # 80412ec8 <commands+0x1bc>
804045b8:	06800593          	li	a1,104
804045bc:	00010517          	auipc	a0,0x10
804045c0:	9b050513          	addi	a0,a0,-1616 # 80413f6c <default_pmm_manager+0x570>
804045c4:	860fc0ef          	jal	ra,80400624 <__panic>
804045c8:	00010697          	auipc	a3,0x10
804045cc:	99068693          	addi	a3,a3,-1648 # 80413f58 <default_pmm_manager+0x55c>
804045d0:	0000f617          	auipc	a2,0xf
804045d4:	8f860613          	addi	a2,a2,-1800 # 80412ec8 <commands+0x1bc>
804045d8:	06500593          	li	a1,101
804045dc:	00010517          	auipc	a0,0x10
804045e0:	99050513          	addi	a0,a0,-1648 # 80413f6c <default_pmm_manager+0x570>
804045e4:	840fc0ef          	jal	ra,80400624 <__panic>
804045e8:	00010697          	auipc	a3,0x10
804045ec:	97068693          	addi	a3,a3,-1680 # 80413f58 <default_pmm_manager+0x55c>
804045f0:	0000f617          	auipc	a2,0xf
804045f4:	8d860613          	addi	a2,a2,-1832 # 80412ec8 <commands+0x1bc>
804045f8:	06200593          	li	a1,98
804045fc:	00010517          	auipc	a0,0x10
80404600:	97050513          	addi	a0,a0,-1680 # 80413f6c <default_pmm_manager+0x570>
80404604:	820fc0ef          	jal	ra,80400624 <__panic>

80404608 <_fifo_swap_out_victim>:
80404608:	01452783          	lw	a5,20(a0)
8040460c:	ff010113          	addi	sp,sp,-16
80404610:	00112623          	sw	ra,12(sp)
80404614:	02078a63          	beqz	a5,80404648 <_fifo_swap_out_victim+0x40>
80404618:	04061863          	bnez	a2,80404668 <_fifo_swap_out_victim+0x60>
8040461c:	0047a783          	lw	a5,4(a5)
80404620:	00c12083          	lw	ra,12(sp)
80404624:	00000513          	li	a0,0
80404628:	0007a683          	lw	a3,0(a5)
8040462c:	0047a703          	lw	a4,4(a5)
80404630:	fec78793          	addi	a5,a5,-20
80404634:	00e6a223          	sw	a4,4(a3)
80404638:	00d72023          	sw	a3,0(a4)
8040463c:	00f5a023          	sw	a5,0(a1)
80404640:	01010113          	addi	sp,sp,16
80404644:	00008067          	ret
80404648:	00010697          	auipc	a3,0x10
8040464c:	aa868693          	addi	a3,a3,-1368 # 804140f0 <default_pmm_manager+0x6f4>
80404650:	0000f617          	auipc	a2,0xf
80404654:	87860613          	addi	a2,a2,-1928 # 80412ec8 <commands+0x1bc>
80404658:	05000593          	li	a1,80
8040465c:	00010517          	auipc	a0,0x10
80404660:	91050513          	addi	a0,a0,-1776 # 80413f6c <default_pmm_manager+0x570>
80404664:	fc1fb0ef          	jal	ra,80400624 <__panic>
80404668:	00010697          	auipc	a3,0x10
8040466c:	a9868693          	addi	a3,a3,-1384 # 80414100 <default_pmm_manager+0x704>
80404670:	0000f617          	auipc	a2,0xf
80404674:	85860613          	addi	a2,a2,-1960 # 80412ec8 <commands+0x1bc>
80404678:	05100593          	li	a1,81
8040467c:	00010517          	auipc	a0,0x10
80404680:	8f050513          	addi	a0,a0,-1808 # 80413f6c <default_pmm_manager+0x570>
80404684:	fa1fb0ef          	jal	ra,80400624 <__panic>

80404688 <_fifo_map_swappable>:
80404688:	01460713          	addi	a4,a2,20
8040468c:	01452783          	lw	a5,20(a0)
80404690:	02070263          	beqz	a4,804046b4 <_fifo_map_swappable+0x2c>
80404694:	02078063          	beqz	a5,804046b4 <_fifo_map_swappable+0x2c>
80404698:	0007a683          	lw	a3,0(a5)
8040469c:	00e7a023          	sw	a4,0(a5)
804046a0:	00000513          	li	a0,0
804046a4:	00e6a223          	sw	a4,4(a3)
804046a8:	00f62c23          	sw	a5,24(a2)
804046ac:	00d62a23          	sw	a3,20(a2)
804046b0:	00008067          	ret
804046b4:	ff010113          	addi	sp,sp,-16
804046b8:	00010697          	auipc	a3,0x10
804046bc:	a1868693          	addi	a3,a3,-1512 # 804140d0 <default_pmm_manager+0x6d4>
804046c0:	0000f617          	auipc	a2,0xf
804046c4:	80860613          	addi	a2,a2,-2040 # 80412ec8 <commands+0x1bc>
804046c8:	03f00593          	li	a1,63
804046cc:	00010517          	auipc	a0,0x10
804046d0:	8a050513          	addi	a0,a0,-1888 # 80413f6c <default_pmm_manager+0x570>
804046d4:	00112623          	sw	ra,12(sp)
804046d8:	f4dfb0ef          	jal	ra,80400624 <__panic>

804046dc <check_vma_overlap.isra.2.part.3>:
804046dc:	ff010113          	addi	sp,sp,-16
804046e0:	00010697          	auipc	a3,0x10
804046e4:	a4468693          	addi	a3,a3,-1468 # 80414124 <default_pmm_manager+0x728>
804046e8:	0000e617          	auipc	a2,0xe
804046ec:	7e060613          	addi	a2,a2,2016 # 80412ec8 <commands+0x1bc>
804046f0:	06d00593          	li	a1,109
804046f4:	00010517          	auipc	a0,0x10
804046f8:	a5050513          	addi	a0,a0,-1456 # 80414144 <default_pmm_manager+0x748>
804046fc:	00112623          	sw	ra,12(sp)
80404700:	f25fb0ef          	jal	ra,80400624 <__panic>

80404704 <mm_create>:
80404704:	ff010113          	addi	sp,sp,-16
80404708:	02c00513          	li	a0,44
8040470c:	00812423          	sw	s0,8(sp)
80404710:	00112623          	sw	ra,12(sp)
80404714:	aacfe0ef          	jal	ra,804029c0 <kmalloc>
80404718:	00050413          	mv	s0,a0
8040471c:	02050e63          	beqz	a0,80404758 <mm_create+0x54>
80404720:	00098797          	auipc	a5,0x98
80404724:	08478793          	addi	a5,a5,132 # 8049c7a4 <swap_init_ok>
80404728:	0007a783          	lw	a5,0(a5)
8040472c:	00a42223          	sw	a0,4(s0)
80404730:	00a42023          	sw	a0,0(s0)
80404734:	00052423          	sw	zero,8(a0)
80404738:	00052623          	sw	zero,12(a0)
8040473c:	00052823          	sw	zero,16(a0)
80404740:	02079663          	bnez	a5,8040476c <mm_create+0x68>
80404744:	00052a23          	sw	zero,20(a0)
80404748:	00042c23          	sw	zero,24(s0)
8040474c:	00100593          	li	a1,1
80404750:	01c40513          	addi	a0,s0,28
80404754:	275000ef          	jal	ra,804051c8 <sem_init>
80404758:	00040513          	mv	a0,s0
8040475c:	00c12083          	lw	ra,12(sp)
80404760:	00812403          	lw	s0,8(sp)
80404764:	01010113          	addi	sp,sp,16
80404768:	00008067          	ret
8040476c:	85dff0ef          	jal	ra,80403fc8 <swap_init_mm>
80404770:	fd9ff06f          	j	80404748 <mm_create+0x44>

80404774 <find_vma>:
80404774:	04050263          	beqz	a0,804047b8 <find_vma+0x44>
80404778:	00852783          	lw	a5,8(a0)
8040477c:	00078663          	beqz	a5,80404788 <find_vma+0x14>
80404780:	0047a703          	lw	a4,4(a5)
80404784:	04e5f063          	bgeu	a1,a4,804047c4 <find_vma+0x50>
80404788:	00050793          	mv	a5,a0
8040478c:	0047a783          	lw	a5,4(a5)
80404790:	02f50463          	beq	a0,a5,804047b8 <find_vma+0x44>
80404794:	ff47a703          	lw	a4,-12(a5)
80404798:	fee5eae3          	bltu	a1,a4,8040478c <find_vma+0x18>
8040479c:	ff87a703          	lw	a4,-8(a5)
804047a0:	fee5f6e3          	bgeu	a1,a4,8040478c <find_vma+0x18>
804047a4:	ff078793          	addi	a5,a5,-16
804047a8:	00078863          	beqz	a5,804047b8 <find_vma+0x44>
804047ac:	00f52423          	sw	a5,8(a0)
804047b0:	00078513          	mv	a0,a5
804047b4:	00008067          	ret
804047b8:	00000793          	li	a5,0
804047bc:	00078513          	mv	a0,a5
804047c0:	00008067          	ret
804047c4:	0087a703          	lw	a4,8(a5)
804047c8:	fce5f0e3          	bgeu	a1,a4,80404788 <find_vma+0x14>
804047cc:	00f52423          	sw	a5,8(a0)
804047d0:	fe1ff06f          	j	804047b0 <find_vma+0x3c>

804047d4 <insert_vma_struct>:
804047d4:	0045a603          	lw	a2,4(a1)
804047d8:	0085a803          	lw	a6,8(a1)
804047dc:	ff010113          	addi	sp,sp,-16
804047e0:	00112623          	sw	ra,12(sp)
804047e4:	00050713          	mv	a4,a0
804047e8:	01066a63          	bltu	a2,a6,804047fc <insert_vma_struct+0x28>
804047ec:	07c0006f          	j	80404868 <insert_vma_struct+0x94>
804047f0:	ff47a683          	lw	a3,-12(a5)
804047f4:	06d66463          	bltu	a2,a3,8040485c <insert_vma_struct+0x88>
804047f8:	00078713          	mv	a4,a5
804047fc:	00472783          	lw	a5,4(a4)
80404800:	fef518e3          	bne	a0,a5,804047f0 <insert_vma_struct+0x1c>
80404804:	02a70463          	beq	a4,a0,8040482c <insert_vma_struct+0x58>
80404808:	ff872683          	lw	a3,-8(a4)
8040480c:	ff472883          	lw	a7,-12(a4)
80404810:	08d8fc63          	bgeu	a7,a3,804048a8 <insert_vma_struct+0xd4>
80404814:	06d66a63          	bltu	a2,a3,80404888 <insert_vma_struct+0xb4>
80404818:	00f50a63          	beq	a0,a5,8040482c <insert_vma_struct+0x58>
8040481c:	ff47a683          	lw	a3,-12(a5)
80404820:	0706e463          	bltu	a3,a6,80404888 <insert_vma_struct+0xb4>
80404824:	ff87a603          	lw	a2,-8(a5)
80404828:	02c6fe63          	bgeu	a3,a2,80404864 <insert_vma_struct+0x90>
8040482c:	01052683          	lw	a3,16(a0)
80404830:	00a5a023          	sw	a0,0(a1)
80404834:	01058613          	addi	a2,a1,16
80404838:	00c7a023          	sw	a2,0(a5)
8040483c:	00c72223          	sw	a2,4(a4)
80404840:	00c12083          	lw	ra,12(sp)
80404844:	00f5aa23          	sw	a5,20(a1)
80404848:	00e5a823          	sw	a4,16(a1)
8040484c:	00168693          	addi	a3,a3,1
80404850:	00d52823          	sw	a3,16(a0)
80404854:	01010113          	addi	sp,sp,16
80404858:	00008067          	ret
8040485c:	faa716e3          	bne	a4,a0,80404808 <insert_vma_struct+0x34>
80404860:	fc1ff06f          	j	80404820 <insert_vma_struct+0x4c>
80404864:	e79ff0ef          	jal	ra,804046dc <check_vma_overlap.isra.2.part.3>
80404868:	00010697          	auipc	a3,0x10
8040486c:	9e868693          	addi	a3,a3,-1560 # 80414250 <default_pmm_manager+0x854>
80404870:	0000e617          	auipc	a2,0xe
80404874:	65860613          	addi	a2,a2,1624 # 80412ec8 <commands+0x1bc>
80404878:	07200593          	li	a1,114
8040487c:	00010517          	auipc	a0,0x10
80404880:	8c850513          	addi	a0,a0,-1848 # 80414144 <default_pmm_manager+0x748>
80404884:	da1fb0ef          	jal	ra,80400624 <__panic>
80404888:	00010697          	auipc	a3,0x10
8040488c:	a0468693          	addi	a3,a3,-1532 # 8041428c <default_pmm_manager+0x890>
80404890:	0000e617          	auipc	a2,0xe
80404894:	63860613          	addi	a2,a2,1592 # 80412ec8 <commands+0x1bc>
80404898:	06c00593          	li	a1,108
8040489c:	00010517          	auipc	a0,0x10
804048a0:	8a850513          	addi	a0,a0,-1880 # 80414144 <default_pmm_manager+0x748>
804048a4:	d81fb0ef          	jal	ra,80400624 <__panic>
804048a8:	00010697          	auipc	a3,0x10
804048ac:	9c468693          	addi	a3,a3,-1596 # 8041426c <default_pmm_manager+0x870>
804048b0:	0000e617          	auipc	a2,0xe
804048b4:	61860613          	addi	a2,a2,1560 # 80412ec8 <commands+0x1bc>
804048b8:	06b00593          	li	a1,107
804048bc:	00010517          	auipc	a0,0x10
804048c0:	88850513          	addi	a0,a0,-1912 # 80414144 <default_pmm_manager+0x748>
804048c4:	d61fb0ef          	jal	ra,80400624 <__panic>

804048c8 <mm_destroy>:
804048c8:	01852783          	lw	a5,24(a0)
804048cc:	ff010113          	addi	sp,sp,-16
804048d0:	00112623          	sw	ra,12(sp)
804048d4:	00812423          	sw	s0,8(sp)
804048d8:	04079263          	bnez	a5,8040491c <mm_destroy+0x54>
804048dc:	00050413          	mv	s0,a0
804048e0:	00452503          	lw	a0,4(a0)
804048e4:	02a40263          	beq	s0,a0,80404908 <mm_destroy+0x40>
804048e8:	00052703          	lw	a4,0(a0)
804048ec:	00452783          	lw	a5,4(a0)
804048f0:	ff050513          	addi	a0,a0,-16
804048f4:	00f72223          	sw	a5,4(a4)
804048f8:	00e7a023          	sw	a4,0(a5)
804048fc:	9e8fe0ef          	jal	ra,80402ae4 <kfree>
80404900:	00442503          	lw	a0,4(s0)
80404904:	fea412e3          	bne	s0,a0,804048e8 <mm_destroy+0x20>
80404908:	00040513          	mv	a0,s0
8040490c:	00812403          	lw	s0,8(sp)
80404910:	00c12083          	lw	ra,12(sp)
80404914:	01010113          	addi	sp,sp,16
80404918:	9ccfe06f          	j	80402ae4 <kfree>
8040491c:	00010697          	auipc	a3,0x10
80404920:	99068693          	addi	a3,a3,-1648 # 804142ac <default_pmm_manager+0x8b0>
80404924:	0000e617          	auipc	a2,0xe
80404928:	5a460613          	addi	a2,a2,1444 # 80412ec8 <commands+0x1bc>
8040492c:	09100593          	li	a1,145
80404930:	00010517          	auipc	a0,0x10
80404934:	81450513          	addi	a0,a0,-2028 # 80414144 <default_pmm_manager+0x748>
80404938:	cedfb0ef          	jal	ra,80400624 <__panic>

8040493c <mm_map>:
8040493c:	000017b7          	lui	a5,0x1
80404940:	fe010113          	addi	sp,sp,-32
80404944:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80404948:	fffff837          	lui	a6,0xfffff
8040494c:	00812c23          	sw	s0,24(sp)
80404950:	00f60433          	add	s0,a2,a5
80404954:	00912a23          	sw	s1,20(sp)
80404958:	00b40433          	add	s0,s0,a1
8040495c:	00112e23          	sw	ra,28(sp)
80404960:	01212823          	sw	s2,16(sp)
80404964:	01312623          	sw	s3,12(sp)
80404968:	01412423          	sw	s4,8(sp)
8040496c:	01512223          	sw	s5,4(sp)
80404970:	0105f4b3          	and	s1,a1,a6
80404974:	002007b7          	lui	a5,0x200
80404978:	01047433          	and	s0,s0,a6
8040497c:	08f4e863          	bltu	s1,a5,80404a0c <mm_map+0xd0>
80404980:	0884f663          	bgeu	s1,s0,80404a0c <mm_map+0xd0>
80404984:	800007b7          	lui	a5,0x80000
80404988:	0887e263          	bltu	a5,s0,80404a0c <mm_map+0xd0>
8040498c:	00050993          	mv	s3,a0
80404990:	00070a13          	mv	s4,a4
80404994:	00068a93          	mv	s5,a3
80404998:	06050e63          	beqz	a0,80404a14 <mm_map+0xd8>
8040499c:	00048593          	mv	a1,s1
804049a0:	dd5ff0ef          	jal	ra,80404774 <find_vma>
804049a4:	00050663          	beqz	a0,804049b0 <mm_map+0x74>
804049a8:	00452783          	lw	a5,4(a0)
804049ac:	0687e063          	bltu	a5,s0,80404a0c <mm_map+0xd0>
804049b0:	01800513          	li	a0,24
804049b4:	80cfe0ef          	jal	ra,804029c0 <kmalloc>
804049b8:	00050913          	mv	s2,a0
804049bc:	ffc00513          	li	a0,-4
804049c0:	02090463          	beqz	s2,804049e8 <mm_map+0xac>
804049c4:	00098513          	mv	a0,s3
804049c8:	00992223          	sw	s1,4(s2)
804049cc:	00892423          	sw	s0,8(s2)
804049d0:	01592623          	sw	s5,12(s2)
804049d4:	00090593          	mv	a1,s2
804049d8:	dfdff0ef          	jal	ra,804047d4 <insert_vma_struct>
804049dc:	00000513          	li	a0,0
804049e0:	000a0463          	beqz	s4,804049e8 <mm_map+0xac>
804049e4:	012a2023          	sw	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x7000>
804049e8:	01c12083          	lw	ra,28(sp)
804049ec:	01812403          	lw	s0,24(sp)
804049f0:	01412483          	lw	s1,20(sp)
804049f4:	01012903          	lw	s2,16(sp)
804049f8:	00c12983          	lw	s3,12(sp)
804049fc:	00812a03          	lw	s4,8(sp)
80404a00:	00412a83          	lw	s5,4(sp)
80404a04:	02010113          	addi	sp,sp,32
80404a08:	00008067          	ret
80404a0c:	ffd00513          	li	a0,-3
80404a10:	fd9ff06f          	j	804049e8 <mm_map+0xac>
80404a14:	00010697          	auipc	a3,0x10
80404a18:	8ac68693          	addi	a3,a3,-1876 # 804142c0 <default_pmm_manager+0x8c4>
80404a1c:	0000e617          	auipc	a2,0xe
80404a20:	4ac60613          	addi	a2,a2,1196 # 80412ec8 <commands+0x1bc>
80404a24:	0a400593          	li	a1,164
80404a28:	0000f517          	auipc	a0,0xf
80404a2c:	71c50513          	addi	a0,a0,1820 # 80414144 <default_pmm_manager+0x748>
80404a30:	bf5fb0ef          	jal	ra,80400624 <__panic>

80404a34 <dup_mmap>:
80404a34:	fe010113          	addi	sp,sp,-32
80404a38:	00112e23          	sw	ra,28(sp)
80404a3c:	00812c23          	sw	s0,24(sp)
80404a40:	00912a23          	sw	s1,20(sp)
80404a44:	01212823          	sw	s2,16(sp)
80404a48:	01312623          	sw	s3,12(sp)
80404a4c:	01412423          	sw	s4,8(sp)
80404a50:	01512223          	sw	s5,4(sp)
80404a54:	0a050063          	beqz	a0,80404af4 <dup_mmap+0xc0>
80404a58:	00050913          	mv	s2,a0
80404a5c:	00058493          	mv	s1,a1
80404a60:	00058413          	mv	s0,a1
80404a64:	02059e63          	bnez	a1,80404aa0 <dup_mmap+0x6c>
80404a68:	08c0006f          	j	80404af4 <dup_mmap+0xc0>
80404a6c:	00050593          	mv	a1,a0
80404a70:	0157a223          	sw	s5,4(a5) # 80000004 <end+0xffb63748>
80404a74:	00090513          	mv	a0,s2
80404a78:	0147a423          	sw	s4,8(a5)
80404a7c:	0137a623          	sw	s3,12(a5)
80404a80:	d55ff0ef          	jal	ra,804047d4 <insert_vma_struct>
80404a84:	ff842683          	lw	a3,-8(s0)
80404a88:	ff442603          	lw	a2,-12(s0)
80404a8c:	00c4a583          	lw	a1,12(s1)
80404a90:	00c92503          	lw	a0,12(s2)
80404a94:	00000713          	li	a4,0
80404a98:	991fe0ef          	jal	ra,80403428 <copy_range>
80404a9c:	02051463          	bnez	a0,80404ac4 <dup_mmap+0x90>
80404aa0:	00042403          	lw	s0,0(s0)
80404aa4:	04848463          	beq	s1,s0,80404aec <dup_mmap+0xb8>
80404aa8:	01800513          	li	a0,24
80404aac:	ff442a83          	lw	s5,-12(s0)
80404ab0:	ff842a03          	lw	s4,-8(s0)
80404ab4:	ffc42983          	lw	s3,-4(s0)
80404ab8:	f09fd0ef          	jal	ra,804029c0 <kmalloc>
80404abc:	00050793          	mv	a5,a0
80404ac0:	fa0516e3          	bnez	a0,80404a6c <dup_mmap+0x38>
80404ac4:	ffc00513          	li	a0,-4
80404ac8:	01c12083          	lw	ra,28(sp)
80404acc:	01812403          	lw	s0,24(sp)
80404ad0:	01412483          	lw	s1,20(sp)
80404ad4:	01012903          	lw	s2,16(sp)
80404ad8:	00c12983          	lw	s3,12(sp)
80404adc:	00812a03          	lw	s4,8(sp)
80404ae0:	00412a83          	lw	s5,4(sp)
80404ae4:	02010113          	addi	sp,sp,32
80404ae8:	00008067          	ret
80404aec:	00000513          	li	a0,0
80404af0:	fd9ff06f          	j	80404ac8 <dup_mmap+0x94>
80404af4:	0000f697          	auipc	a3,0xf
80404af8:	72068693          	addi	a3,a3,1824 # 80414214 <default_pmm_manager+0x818>
80404afc:	0000e617          	auipc	a2,0xe
80404b00:	3cc60613          	addi	a2,a2,972 # 80412ec8 <commands+0x1bc>
80404b04:	0bc00593          	li	a1,188
80404b08:	0000f517          	auipc	a0,0xf
80404b0c:	63c50513          	addi	a0,a0,1596 # 80414144 <default_pmm_manager+0x748>
80404b10:	b15fb0ef          	jal	ra,80400624 <__panic>

80404b14 <exit_mmap>:
80404b14:	ff010113          	addi	sp,sp,-16
80404b18:	00112623          	sw	ra,12(sp)
80404b1c:	00812423          	sw	s0,8(sp)
80404b20:	00912223          	sw	s1,4(sp)
80404b24:	01212023          	sw	s2,0(sp)
80404b28:	06050663          	beqz	a0,80404b94 <exit_mmap+0x80>
80404b2c:	01852783          	lw	a5,24(a0)
80404b30:	00050493          	mv	s1,a0
80404b34:	06079063          	bnez	a5,80404b94 <exit_mmap+0x80>
80404b38:	00452403          	lw	s0,4(a0)
80404b3c:	00c52903          	lw	s2,12(a0)
80404b40:	02850a63          	beq	a0,s0,80404b74 <exit_mmap+0x60>
80404b44:	ff842603          	lw	a2,-8(s0)
80404b48:	ff442583          	lw	a1,-12(s0)
80404b4c:	00090513          	mv	a0,s2
80404b50:	cecfe0ef          	jal	ra,8040303c <unmap_range>
80404b54:	00442403          	lw	s0,4(s0)
80404b58:	fe8496e3          	bne	s1,s0,80404b44 <exit_mmap+0x30>
80404b5c:	00442403          	lw	s0,4(s0)
80404b60:	00848e63          	beq	s1,s0,80404b7c <exit_mmap+0x68>
80404b64:	ff842603          	lw	a2,-8(s0)
80404b68:	ff442583          	lw	a1,-12(s0)
80404b6c:	00090513          	mv	a0,s2
80404b70:	e50fe0ef          	jal	ra,804031c0 <exit_range>
80404b74:	00442403          	lw	s0,4(s0)
80404b78:	fe8496e3          	bne	s1,s0,80404b64 <exit_mmap+0x50>
80404b7c:	00c12083          	lw	ra,12(sp)
80404b80:	00812403          	lw	s0,8(sp)
80404b84:	00412483          	lw	s1,4(sp)
80404b88:	00012903          	lw	s2,0(sp)
80404b8c:	01010113          	addi	sp,sp,16
80404b90:	00008067          	ret
80404b94:	0000f697          	auipc	a3,0xf
80404b98:	69c68693          	addi	a3,a3,1692 # 80414230 <default_pmm_manager+0x834>
80404b9c:	0000e617          	auipc	a2,0xe
80404ba0:	32c60613          	addi	a2,a2,812 # 80412ec8 <commands+0x1bc>
80404ba4:	0d200593          	li	a1,210
80404ba8:	0000f517          	auipc	a0,0xf
80404bac:	59c50513          	addi	a0,a0,1436 # 80414144 <default_pmm_manager+0x748>
80404bb0:	a75fb0ef          	jal	ra,80400624 <__panic>

80404bb4 <vmm_init>:
80404bb4:	00008067          	ret

80404bb8 <do_pgfault>:
80404bb8:	fd010113          	addi	sp,sp,-48
80404bbc:	00060593          	mv	a1,a2
80404bc0:	02912223          	sw	s1,36(sp)
80404bc4:	03212023          	sw	s2,32(sp)
80404bc8:	02112623          	sw	ra,44(sp)
80404bcc:	02812423          	sw	s0,40(sp)
80404bd0:	01312e23          	sw	s3,28(sp)
80404bd4:	00060493          	mv	s1,a2
80404bd8:	00050913          	mv	s2,a0
80404bdc:	b99ff0ef          	jal	ra,80404774 <find_vma>
80404be0:	00098797          	auipc	a5,0x98
80404be4:	bc878793          	addi	a5,a5,-1080 # 8049c7a8 <pgfault_num>
80404be8:	0007a783          	lw	a5,0(a5)
80404bec:	00178793          	addi	a5,a5,1
80404bf0:	00098717          	auipc	a4,0x98
80404bf4:	baf72c23          	sw	a5,-1096(a4) # 8049c7a8 <pgfault_num>
80404bf8:	10050e63          	beqz	a0,80404d14 <do_pgfault+0x15c>
80404bfc:	00452783          	lw	a5,4(a0)
80404c00:	10f4ea63          	bltu	s1,a5,80404d14 <do_pgfault+0x15c>
80404c04:	00c52403          	lw	s0,12(a0)
80404c08:	fffff637          	lui	a2,0xfffff
80404c0c:	00c92503          	lw	a0,12(s2)
80404c10:	00247413          	andi	s0,s0,2
80404c14:	00c4f4b3          	and	s1,s1,a2
80404c18:	00143413          	seqz	s0,s0
80404c1c:	40800433          	neg	s0,s0
80404c20:	00100613          	li	a2,1
80404c24:	00048593          	mv	a1,s1
80404c28:	ff947413          	andi	s0,s0,-7
80404c2c:	aa8fe0ef          	jal	ra,80402ed4 <get_pte>
80404c30:	01740413          	addi	s0,s0,23
80404c34:	10050663          	beqz	a0,80404d40 <do_pgfault+0x188>
80404c38:	00052583          	lw	a1,0(a0)
80404c3c:	0a058663          	beqz	a1,80404ce8 <do_pgfault+0x130>
80404c40:	00098797          	auipc	a5,0x98
80404c44:	b6478793          	addi	a5,a5,-1180 # 8049c7a4 <swap_init_ok>
80404c48:	0007a783          	lw	a5,0(a5)
80404c4c:	0e078063          	beqz	a5,80404d2c <do_pgfault+0x174>
80404c50:	00c10613          	addi	a2,sp,12
80404c54:	00048593          	mv	a1,s1
80404c58:	00090513          	mv	a0,s2
80404c5c:	00012623          	sw	zero,12(sp)
80404c60:	d3cff0ef          	jal	ra,8040419c <swap_in>
80404c64:	00050993          	mv	s3,a0
80404c68:	04051a63          	bnez	a0,80404cbc <do_pgfault+0x104>
80404c6c:	00c12583          	lw	a1,12(sp)
80404c70:	00c92503          	lw	a0,12(s2)
80404c74:	00040693          	mv	a3,s0
80404c78:	00048613          	mv	a2,s1
80404c7c:	e8cfe0ef          	jal	ra,80403308 <page_insert>
80404c80:	00c12603          	lw	a2,12(sp)
80404c84:	00100693          	li	a3,1
80404c88:	00048593          	mv	a1,s1
80404c8c:	00090513          	mv	a0,s2
80404c90:	b4cff0ef          	jal	ra,80403fdc <swap_map_swappable>
80404c94:	00c12783          	lw	a5,12(sp)
80404c98:	0097ae23          	sw	s1,28(a5)
80404c9c:	02c12083          	lw	ra,44(sp)
80404ca0:	02812403          	lw	s0,40(sp)
80404ca4:	00098513          	mv	a0,s3
80404ca8:	02412483          	lw	s1,36(sp)
80404cac:	02012903          	lw	s2,32(sp)
80404cb0:	01c12983          	lw	s3,28(sp)
80404cb4:	03010113          	addi	sp,sp,48
80404cb8:	00008067          	ret
80404cbc:	0000f517          	auipc	a0,0xf
80404cc0:	51050513          	addi	a0,a0,1296 # 804141cc <default_pmm_manager+0x7d0>
80404cc4:	d38fb0ef          	jal	ra,804001fc <cprintf>
80404cc8:	02c12083          	lw	ra,44(sp)
80404ccc:	02812403          	lw	s0,40(sp)
80404cd0:	00098513          	mv	a0,s3
80404cd4:	02412483          	lw	s1,36(sp)
80404cd8:	02012903          	lw	s2,32(sp)
80404cdc:	01c12983          	lw	s3,28(sp)
80404ce0:	03010113          	addi	sp,sp,48
80404ce4:	00008067          	ret
80404ce8:	00c92503          	lw	a0,12(s2)
80404cec:	00040613          	mv	a2,s0
80404cf0:	00048593          	mv	a1,s1
80404cf4:	ae5fe0ef          	jal	ra,804037d8 <pgdir_alloc_page>
80404cf8:	00000993          	li	s3,0
80404cfc:	fa0510e3          	bnez	a0,80404c9c <do_pgfault+0xe4>
80404d00:	0000f517          	auipc	a0,0xf
80404d04:	4a450513          	addi	a0,a0,1188 # 804141a4 <default_pmm_manager+0x7a8>
80404d08:	cf4fb0ef          	jal	ra,804001fc <cprintf>
80404d0c:	ffc00993          	li	s3,-4
80404d10:	f8dff06f          	j	80404c9c <do_pgfault+0xe4>
80404d14:	00048593          	mv	a1,s1
80404d18:	0000f517          	auipc	a0,0xf
80404d1c:	43c50513          	addi	a0,a0,1084 # 80414154 <default_pmm_manager+0x758>
80404d20:	cdcfb0ef          	jal	ra,804001fc <cprintf>
80404d24:	ffd00993          	li	s3,-3
80404d28:	f75ff06f          	j	80404c9c <do_pgfault+0xe4>
80404d2c:	0000f517          	auipc	a0,0xf
80404d30:	4c050513          	addi	a0,a0,1216 # 804141ec <default_pmm_manager+0x7f0>
80404d34:	cc8fb0ef          	jal	ra,804001fc <cprintf>
80404d38:	ffc00993          	li	s3,-4
80404d3c:	f61ff06f          	j	80404c9c <do_pgfault+0xe4>
80404d40:	0000f517          	auipc	a0,0xf
80404d44:	44450513          	addi	a0,a0,1092 # 80414184 <default_pmm_manager+0x788>
80404d48:	cb4fb0ef          	jal	ra,804001fc <cprintf>
80404d4c:	ffc00993          	li	s3,-4
80404d50:	f4dff06f          	j	80404c9c <do_pgfault+0xe4>

80404d54 <user_mem_check>:
80404d54:	fe010113          	addi	sp,sp,-32
80404d58:	00812c23          	sw	s0,24(sp)
80404d5c:	00112e23          	sw	ra,28(sp)
80404d60:	00912a23          	sw	s1,20(sp)
80404d64:	01212823          	sw	s2,16(sp)
80404d68:	01312623          	sw	s3,12(sp)
80404d6c:	01412423          	sw	s4,8(sp)
80404d70:	00058413          	mv	s0,a1
80404d74:	08050c63          	beqz	a0,80404e0c <user_mem_check+0xb8>
80404d78:	002007b7          	lui	a5,0x200
80404d7c:	06f5e663          	bltu	a1,a5,80404de8 <user_mem_check+0x94>
80404d80:	00c584b3          	add	s1,a1,a2
80404d84:	0695f263          	bgeu	a1,s1,80404de8 <user_mem_check+0x94>
80404d88:	800007b7          	lui	a5,0x80000
80404d8c:	0497ee63          	bltu	a5,s1,80404de8 <user_mem_check+0x94>
80404d90:	00050913          	mv	s2,a0
80404d94:	00068993          	mv	s3,a3
80404d98:	00001a37          	lui	s4,0x1
80404d9c:	0240006f          	j	80404dc0 <user_mem_check+0x6c>
80404da0:	0027f693          	andi	a3,a5,2
80404da4:	01470733          	add	a4,a4,s4
80404da8:	0087f793          	andi	a5,a5,8
80404dac:	02068e63          	beqz	a3,80404de8 <user_mem_check+0x94>
80404db0:	00078463          	beqz	a5,80404db8 <user_mem_check+0x64>
80404db4:	02e46a63          	bltu	s0,a4,80404de8 <user_mem_check+0x94>
80404db8:	00852403          	lw	s0,8(a0)
80404dbc:	06947463          	bgeu	s0,s1,80404e24 <user_mem_check+0xd0>
80404dc0:	00040593          	mv	a1,s0
80404dc4:	00090513          	mv	a0,s2
80404dc8:	9adff0ef          	jal	ra,80404774 <find_vma>
80404dcc:	00050e63          	beqz	a0,80404de8 <user_mem_check+0x94>
80404dd0:	00452703          	lw	a4,4(a0)
80404dd4:	00e46a63          	bltu	s0,a4,80404de8 <user_mem_check+0x94>
80404dd8:	00c52783          	lw	a5,12(a0)
80404ddc:	fc0992e3          	bnez	s3,80404da0 <user_mem_check+0x4c>
80404de0:	0017f793          	andi	a5,a5,1
80404de4:	fc079ae3          	bnez	a5,80404db8 <user_mem_check+0x64>
80404de8:	00000513          	li	a0,0
80404dec:	01c12083          	lw	ra,28(sp)
80404df0:	01812403          	lw	s0,24(sp)
80404df4:	01412483          	lw	s1,20(sp)
80404df8:	01012903          	lw	s2,16(sp)
80404dfc:	00c12983          	lw	s3,12(sp)
80404e00:	00812a03          	lw	s4,8(sp)
80404e04:	02010113          	addi	sp,sp,32
80404e08:	00008067          	ret
80404e0c:	804007b7          	lui	a5,0x80400
80404e10:	fcf5ece3          	bltu	a1,a5,80404de8 <user_mem_check+0x94>
80404e14:	00c58633          	add	a2,a1,a2
80404e18:	fcc5f8e3          	bgeu	a1,a2,80404de8 <user_mem_check+0x94>
80404e1c:	80c007b7          	lui	a5,0x80c00
80404e20:	fcc7e4e3          	bltu	a5,a2,80404de8 <user_mem_check+0x94>
80404e24:	00100513          	li	a0,1
80404e28:	fc5ff06f          	j	80404dec <user_mem_check+0x98>

80404e2c <copy_from_user>:
80404e2c:	ff010113          	addi	sp,sp,-16
80404e30:	00812423          	sw	s0,8(sp)
80404e34:	00912223          	sw	s1,4(sp)
80404e38:	00060413          	mv	s0,a2
80404e3c:	00068493          	mv	s1,a3
80404e40:	01212023          	sw	s2,0(sp)
80404e44:	00070693          	mv	a3,a4
80404e48:	00058913          	mv	s2,a1
80404e4c:	00048613          	mv	a2,s1
80404e50:	00040593          	mv	a1,s0
80404e54:	00112623          	sw	ra,12(sp)
80404e58:	efdff0ef          	jal	ra,80404d54 <user_mem_check>
80404e5c:	00050c63          	beqz	a0,80404e74 <copy_from_user+0x48>
80404e60:	00048613          	mv	a2,s1
80404e64:	00040593          	mv	a1,s0
80404e68:	00090513          	mv	a0,s2
80404e6c:	49d0d0ef          	jal	ra,80412b08 <memcpy>
80404e70:	00100513          	li	a0,1
80404e74:	00c12083          	lw	ra,12(sp)
80404e78:	00812403          	lw	s0,8(sp)
80404e7c:	00412483          	lw	s1,4(sp)
80404e80:	00012903          	lw	s2,0(sp)
80404e84:	01010113          	addi	sp,sp,16
80404e88:	00008067          	ret

80404e8c <copy_to_user>:
80404e8c:	ff010113          	addi	sp,sp,-16
80404e90:	00812423          	sw	s0,8(sp)
80404e94:	00068413          	mv	s0,a3
80404e98:	01212023          	sw	s2,0(sp)
80404e9c:	00100693          	li	a3,1
80404ea0:	00060913          	mv	s2,a2
80404ea4:	00040613          	mv	a2,s0
80404ea8:	00912223          	sw	s1,4(sp)
80404eac:	00112623          	sw	ra,12(sp)
80404eb0:	00058493          	mv	s1,a1
80404eb4:	ea1ff0ef          	jal	ra,80404d54 <user_mem_check>
80404eb8:	00050c63          	beqz	a0,80404ed0 <copy_to_user+0x44>
80404ebc:	00040613          	mv	a2,s0
80404ec0:	00090593          	mv	a1,s2
80404ec4:	00048513          	mv	a0,s1
80404ec8:	4410d0ef          	jal	ra,80412b08 <memcpy>
80404ecc:	00100513          	li	a0,1
80404ed0:	00c12083          	lw	ra,12(sp)
80404ed4:	00812403          	lw	s0,8(sp)
80404ed8:	00412483          	lw	s1,4(sp)
80404edc:	00012903          	lw	s2,0(sp)
80404ee0:	01010113          	addi	sp,sp,16
80404ee4:	00008067          	ret

80404ee8 <copy_string>:
80404ee8:	fe010113          	addi	sp,sp,-32
80404eec:	01312623          	sw	s3,12(sp)
80404ef0:	000019b7          	lui	s3,0x1
80404ef4:	013609b3          	add	s3,a2,s3
80404ef8:	fffff7b7          	lui	a5,0xfffff
80404efc:	00f9f9b3          	and	s3,s3,a5
80404f00:	00912a23          	sw	s1,20(sp)
80404f04:	01212823          	sw	s2,16(sp)
80404f08:	01412423          	sw	s4,8(sp)
80404f0c:	01512223          	sw	s5,4(sp)
80404f10:	00112e23          	sw	ra,28(sp)
80404f14:	00812c23          	sw	s0,24(sp)
80404f18:	00060493          	mv	s1,a2
80404f1c:	00050a93          	mv	s5,a0
80404f20:	00058a13          	mv	s4,a1
80404f24:	00068913          	mv	s2,a3
80404f28:	40c989b3          	sub	s3,s3,a2
80404f2c:	0380006f          	j	80404f64 <copy_string+0x7c>
80404f30:	00048513          	mv	a0,s1
80404f34:	2b10d0ef          	jal	ra,804129e4 <strnlen>
80404f38:	00050793          	mv	a5,a0
80404f3c:	00048593          	mv	a1,s1
80404f40:	000a0513          	mv	a0,s4
80404f44:	00040613          	mv	a2,s0
80404f48:	0687e663          	bltu	a5,s0,80404fb4 <copy_string+0xcc>
80404f4c:	0529f063          	bgeu	s3,s2,80404f8c <copy_string+0xa4>
80404f50:	3b90d0ef          	jal	ra,80412b08 <memcpy>
80404f54:	008a0a33          	add	s4,s4,s0
80404f58:	008484b3          	add	s1,s1,s0
80404f5c:	40890933          	sub	s2,s2,s0
80404f60:	000019b7          	lui	s3,0x1
80404f64:	00000693          	li	a3,0
80404f68:	00048593          	mv	a1,s1
80404f6c:	000a8513          	mv	a0,s5
80404f70:	00090413          	mv	s0,s2
80404f74:	0129f463          	bgeu	s3,s2,80404f7c <copy_string+0x94>
80404f78:	00098413          	mv	s0,s3
80404f7c:	00040613          	mv	a2,s0
80404f80:	dd5ff0ef          	jal	ra,80404d54 <user_mem_check>
80404f84:	00040593          	mv	a1,s0
80404f88:	fa0514e3          	bnez	a0,80404f30 <copy_string+0x48>
80404f8c:	00000513          	li	a0,0
80404f90:	01c12083          	lw	ra,28(sp)
80404f94:	01812403          	lw	s0,24(sp)
80404f98:	01412483          	lw	s1,20(sp)
80404f9c:	01012903          	lw	s2,16(sp)
80404fa0:	00c12983          	lw	s3,12(sp)
80404fa4:	00812a03          	lw	s4,8(sp)
80404fa8:	00412a83          	lw	s5,4(sp)
80404fac:	02010113          	addi	sp,sp,32
80404fb0:	00008067          	ret
80404fb4:	00178613          	addi	a2,a5,1 # fffff001 <end+0x7fb62745>
80404fb8:	3510d0ef          	jal	ra,80412b08 <memcpy>
80404fbc:	00100513          	li	a0,1
80404fc0:	fd1ff06f          	j	80404f90 <copy_string+0xa8>

80404fc4 <__down.constprop.0>:
80404fc4:	fc010113          	addi	sp,sp,-64
80404fc8:	02112e23          	sw	ra,60(sp)
80404fcc:	02812c23          	sw	s0,56(sp)
80404fd0:	02912a23          	sw	s1,52(sp)
80404fd4:	100027f3          	csrr	a5,sstatus
80404fd8:	0027f793          	andi	a5,a5,2
80404fdc:	08079663          	bnez	a5,80405068 <__down.constprop.0+0xa4>
80404fe0:	00052703          	lw	a4,0(a0)
80404fe4:	02e05263          	blez	a4,80405008 <__down.constprop.0+0x44>
80404fe8:	03c12083          	lw	ra,60(sp)
80404fec:	03812403          	lw	s0,56(sp)
80404ff0:	fff70713          	addi	a4,a4,-1
80404ff4:	00e52023          	sw	a4,0(a0)
80404ff8:	03412483          	lw	s1,52(sp)
80404ffc:	00078513          	mv	a0,a5
80405000:	04010113          	addi	sp,sp,64
80405004:	00008067          	ret
80405008:	00450413          	addi	s0,a0,4
8040500c:	01c10493          	addi	s1,sp,28
80405010:	10000613          	li	a2,256
80405014:	00048593          	mv	a1,s1
80405018:	00040513          	mv	a0,s0
8040501c:	3ac000ef          	jal	ra,804053c8 <wait_current_set>
80405020:	539070ef          	jal	ra,8040cd58 <schedule>
80405024:	100027f3          	csrr	a5,sstatus
80405028:	0027f793          	andi	a5,a5,2
8040502c:	0a079463          	bnez	a5,804050d4 <__down.constprop.0+0x110>
80405030:	00048513          	mv	a0,s1
80405034:	29c000ef          	jal	ra,804052d0 <wait_in_queue>
80405038:	08051663          	bnez	a0,804050c4 <__down.constprop.0+0x100>
8040503c:	02012783          	lw	a5,32(sp)
80405040:	03c12083          	lw	ra,60(sp)
80405044:	03812403          	lw	s0,56(sp)
80405048:	f0078713          	addi	a4,a5,-256
8040504c:	00e03733          	snez	a4,a4
80405050:	40e00733          	neg	a4,a4
80405054:	00e7f7b3          	and	a5,a5,a4
80405058:	03412483          	lw	s1,52(sp)
8040505c:	00078513          	mv	a0,a5
80405060:	04010113          	addi	sp,sp,64
80405064:	00008067          	ret
80405068:	00a12623          	sw	a0,12(sp)
8040506c:	bb1fb0ef          	jal	ra,80400c1c <intr_disable>
80405070:	00c12503          	lw	a0,12(sp)
80405074:	00052783          	lw	a5,0(a0)
80405078:	02f05663          	blez	a5,804050a4 <__down.constprop.0+0xe0>
8040507c:	fff78793          	addi	a5,a5,-1
80405080:	00f52023          	sw	a5,0(a0)
80405084:	b91fb0ef          	jal	ra,80400c14 <intr_enable>
80405088:	03c12083          	lw	ra,60(sp)
8040508c:	03812403          	lw	s0,56(sp)
80405090:	00000793          	li	a5,0
80405094:	03412483          	lw	s1,52(sp)
80405098:	00078513          	mv	a0,a5
8040509c:	04010113          	addi	sp,sp,64
804050a0:	00008067          	ret
804050a4:	00450413          	addi	s0,a0,4
804050a8:	01c10493          	addi	s1,sp,28
804050ac:	10000613          	li	a2,256
804050b0:	00048593          	mv	a1,s1
804050b4:	00040513          	mv	a0,s0
804050b8:	310000ef          	jal	ra,804053c8 <wait_current_set>
804050bc:	b59fb0ef          	jal	ra,80400c14 <intr_enable>
804050c0:	f61ff06f          	j	80405020 <__down.constprop.0+0x5c>
804050c4:	00048593          	mv	a1,s1
804050c8:	00040513          	mv	a0,s0
804050cc:	1a4000ef          	jal	ra,80405270 <wait_queue_del>
804050d0:	f6dff06f          	j	8040503c <__down.constprop.0+0x78>
804050d4:	b49fb0ef          	jal	ra,80400c1c <intr_disable>
804050d8:	00048513          	mv	a0,s1
804050dc:	1f4000ef          	jal	ra,804052d0 <wait_in_queue>
804050e0:	00051663          	bnez	a0,804050ec <__down.constprop.0+0x128>
804050e4:	b31fb0ef          	jal	ra,80400c14 <intr_enable>
804050e8:	f55ff06f          	j	8040503c <__down.constprop.0+0x78>
804050ec:	00048593          	mv	a1,s1
804050f0:	00040513          	mv	a0,s0
804050f4:	17c000ef          	jal	ra,80405270 <wait_queue_del>
804050f8:	fedff06f          	j	804050e4 <__down.constprop.0+0x120>

804050fc <__up.constprop.1>:
804050fc:	ff010113          	addi	sp,sp,-16
80405100:	00912223          	sw	s1,4(sp)
80405104:	00112623          	sw	ra,12(sp)
80405108:	00812423          	sw	s0,8(sp)
8040510c:	01212023          	sw	s2,0(sp)
80405110:	00050493          	mv	s1,a0
80405114:	100027f3          	csrr	a5,sstatus
80405118:	0027f793          	andi	a5,a5,2
8040511c:	00000913          	li	s2,0
80405120:	06079e63          	bnez	a5,8040519c <__up.constprop.1+0xa0>
80405124:	00448413          	addi	s0,s1,4
80405128:	00040513          	mv	a0,s0
8040512c:	17c000ef          	jal	ra,804052a8 <wait_queue_first>
80405130:	04050e63          	beqz	a0,8040518c <__up.constprop.1+0x90>
80405134:	00052703          	lw	a4,0(a0)
80405138:	10000793          	li	a5,256
8040513c:	0a872703          	lw	a4,168(a4)
80405140:	06f71463          	bne	a4,a5,804051a8 <__up.constprop.1+0xac>
80405144:	00050593          	mv	a1,a0
80405148:	00100693          	li	a3,1
8040514c:	10000613          	li	a2,256
80405150:	00040513          	mv	a0,s0
80405154:	190000ef          	jal	ra,804052e4 <wakeup_wait>
80405158:	00091e63          	bnez	s2,80405174 <__up.constprop.1+0x78>
8040515c:	00c12083          	lw	ra,12(sp)
80405160:	00812403          	lw	s0,8(sp)
80405164:	00412483          	lw	s1,4(sp)
80405168:	00012903          	lw	s2,0(sp)
8040516c:	01010113          	addi	sp,sp,16
80405170:	00008067          	ret
80405174:	00812403          	lw	s0,8(sp)
80405178:	00c12083          	lw	ra,12(sp)
8040517c:	00412483          	lw	s1,4(sp)
80405180:	00012903          	lw	s2,0(sp)
80405184:	01010113          	addi	sp,sp,16
80405188:	a8dfb06f          	j	80400c14 <intr_enable>
8040518c:	0004a783          	lw	a5,0(s1)
80405190:	00178793          	addi	a5,a5,1
80405194:	00f4a023          	sw	a5,0(s1)
80405198:	fc1ff06f          	j	80405158 <__up.constprop.1+0x5c>
8040519c:	a81fb0ef          	jal	ra,80400c1c <intr_disable>
804051a0:	00100913          	li	s2,1
804051a4:	f81ff06f          	j	80405124 <__up.constprop.1+0x28>
804051a8:	0000f697          	auipc	a3,0xf
804051ac:	12468693          	addi	a3,a3,292 # 804142cc <default_pmm_manager+0x8d0>
804051b0:	0000e617          	auipc	a2,0xe
804051b4:	d1860613          	addi	a2,a2,-744 # 80412ec8 <commands+0x1bc>
804051b8:	01a00593          	li	a1,26
804051bc:	0000f517          	auipc	a0,0xf
804051c0:	13850513          	addi	a0,a0,312 # 804142f4 <default_pmm_manager+0x8f8>
804051c4:	c60fb0ef          	jal	ra,80400624 <__panic>

804051c8 <sem_init>:
804051c8:	00b52023          	sw	a1,0(a0)
804051cc:	00450513          	addi	a0,a0,4
804051d0:	0940006f          	j	80405264 <wait_queue_init>

804051d4 <up>:
804051d4:	f29ff06f          	j	804050fc <__up.constprop.1>

804051d8 <down>:
804051d8:	ff010113          	addi	sp,sp,-16
804051dc:	00112623          	sw	ra,12(sp)
804051e0:	de5ff0ef          	jal	ra,80404fc4 <__down.constprop.0>
804051e4:	00051863          	bnez	a0,804051f4 <down+0x1c>
804051e8:	00c12083          	lw	ra,12(sp)
804051ec:	01010113          	addi	sp,sp,16
804051f0:	00008067          	ret
804051f4:	0000f697          	auipc	a3,0xf
804051f8:	11068693          	addi	a3,a3,272 # 80414304 <default_pmm_manager+0x908>
804051fc:	0000e617          	auipc	a2,0xe
80405200:	ccc60613          	addi	a2,a2,-820 # 80412ec8 <commands+0x1bc>
80405204:	04100593          	li	a1,65
80405208:	0000f517          	auipc	a0,0xf
8040520c:	0ec50513          	addi	a0,a0,236 # 804142f4 <default_pmm_manager+0x8f8>
80405210:	c14fb0ef          	jal	ra,80400624 <__panic>

80405214 <wait_queue_del.part.1>:
80405214:	ff010113          	addi	sp,sp,-16
80405218:	0000f697          	auipc	a3,0xf
8040521c:	10868693          	addi	a3,a3,264 # 80414320 <default_pmm_manager+0x924>
80405220:	0000e617          	auipc	a2,0xe
80405224:	ca860613          	addi	a2,a2,-856 # 80412ec8 <commands+0x1bc>
80405228:	01e00593          	li	a1,30
8040522c:	0000f517          	auipc	a0,0xf
80405230:	13450513          	addi	a0,a0,308 # 80414360 <default_pmm_manager+0x964>
80405234:	00112623          	sw	ra,12(sp)
80405238:	becfb0ef          	jal	ra,80400624 <__panic>

8040523c <wait_queue_next.part.2>:
8040523c:	ff010113          	addi	sp,sp,-16
80405240:	0000f697          	auipc	a3,0xf
80405244:	0e068693          	addi	a3,a3,224 # 80414320 <default_pmm_manager+0x924>
80405248:	0000e617          	auipc	a2,0xe
8040524c:	c8060613          	addi	a2,a2,-896 # 80412ec8 <commands+0x1bc>
80405250:	02400593          	li	a1,36
80405254:	0000f517          	auipc	a0,0xf
80405258:	10c50513          	addi	a0,a0,268 # 80414360 <default_pmm_manager+0x964>
8040525c:	00112623          	sw	ra,12(sp)
80405260:	bc4fb0ef          	jal	ra,80400624 <__panic>

80405264 <wait_queue_init>:
80405264:	00a52223          	sw	a0,4(a0)
80405268:	00a52023          	sw	a0,0(a0)
8040526c:	00008067          	ret

80405270 <wait_queue_del>:
80405270:	0105a703          	lw	a4,16(a1)
80405274:	00c58793          	addi	a5,a1,12
80405278:	02e78263          	beq	a5,a4,8040529c <wait_queue_del+0x2c>
8040527c:	0085a683          	lw	a3,8(a1)
80405280:	00a69e63          	bne	a3,a0,8040529c <wait_queue_del+0x2c>
80405284:	00c5a683          	lw	a3,12(a1)
80405288:	00e6a223          	sw	a4,4(a3)
8040528c:	00d72023          	sw	a3,0(a4)
80405290:	00f5a823          	sw	a5,16(a1)
80405294:	00f5a623          	sw	a5,12(a1)
80405298:	00008067          	ret
8040529c:	ff010113          	addi	sp,sp,-16
804052a0:	00112623          	sw	ra,12(sp)
804052a4:	f71ff0ef          	jal	ra,80405214 <wait_queue_del.part.1>

804052a8 <wait_queue_first>:
804052a8:	00452783          	lw	a5,4(a0)
804052ac:	00f50663          	beq	a0,a5,804052b8 <wait_queue_first+0x10>
804052b0:	ff478513          	addi	a0,a5,-12
804052b4:	00008067          	ret
804052b8:	00000513          	li	a0,0
804052bc:	00008067          	ret

804052c0 <wait_queue_empty>:
804052c0:	00452783          	lw	a5,4(a0)
804052c4:	40a78533          	sub	a0,a5,a0
804052c8:	00153513          	seqz	a0,a0
804052cc:	00008067          	ret

804052d0 <wait_in_queue>:
804052d0:	01052783          	lw	a5,16(a0)
804052d4:	00c50513          	addi	a0,a0,12
804052d8:	40a78533          	sub	a0,a5,a0
804052dc:	00a03533          	snez	a0,a0
804052e0:	00008067          	ret

804052e4 <wakeup_wait>:
804052e4:	02068663          	beqz	a3,80405310 <wakeup_wait+0x2c>
804052e8:	0105a703          	lw	a4,16(a1)
804052ec:	00c58793          	addi	a5,a1,12
804052f0:	02e78663          	beq	a5,a4,8040531c <wakeup_wait+0x38>
804052f4:	0085a683          	lw	a3,8(a1)
804052f8:	02d51263          	bne	a0,a3,8040531c <wakeup_wait+0x38>
804052fc:	00c5a683          	lw	a3,12(a1)
80405300:	00e6a223          	sw	a4,4(a3)
80405304:	00d72023          	sw	a3,0(a4)
80405308:	00f5a823          	sw	a5,16(a1)
8040530c:	00f5a623          	sw	a5,12(a1)
80405310:	0005a503          	lw	a0,0(a1)
80405314:	00c5a223          	sw	a2,4(a1)
80405318:	1450706f          	j	8040cc5c <wakeup_proc>
8040531c:	ff010113          	addi	sp,sp,-16
80405320:	00112623          	sw	ra,12(sp)
80405324:	ef1ff0ef          	jal	ra,80405214 <wait_queue_del.part.1>

80405328 <wakeup_queue>:
80405328:	ff010113          	addi	sp,sp,-16
8040532c:	00812423          	sw	s0,8(sp)
80405330:	00452403          	lw	s0,4(a0)
80405334:	00112623          	sw	ra,12(sp)
80405338:	00912223          	sw	s1,4(sp)
8040533c:	01212023          	sw	s2,0(sp)
80405340:	04850263          	beq	a0,s0,80405384 <wakeup_queue+0x5c>
80405344:	ff440413          	addi	s0,s0,-12
80405348:	02040e63          	beqz	s0,80405384 <wakeup_queue+0x5c>
8040534c:	00058913          	mv	s2,a1
80405350:	00050493          	mv	s1,a0
80405354:	04061463          	bnez	a2,8040539c <wakeup_queue+0x74>
80405358:	00042503          	lw	a0,0(s0)
8040535c:	01242223          	sw	s2,4(s0)
80405360:	0fd070ef          	jal	ra,8040cc5c <wakeup_proc>
80405364:	01042783          	lw	a5,16(s0)
80405368:	00c40713          	addi	a4,s0,12
8040536c:	04e78c63          	beq	a5,a4,804053c4 <wakeup_queue+0x9c>
80405370:	00842703          	lw	a4,8(s0)
80405374:	04e49863          	bne	s1,a4,804053c4 <wakeup_queue+0x9c>
80405378:	00f48663          	beq	s1,a5,80405384 <wakeup_queue+0x5c>
8040537c:	ff478413          	addi	s0,a5,-12
80405380:	fc041ce3          	bnez	s0,80405358 <wakeup_queue+0x30>
80405384:	00c12083          	lw	ra,12(sp)
80405388:	00812403          	lw	s0,8(sp)
8040538c:	00412483          	lw	s1,4(sp)
80405390:	00012903          	lw	s2,0(sp)
80405394:	01010113          	addi	sp,sp,16
80405398:	00008067          	ret
8040539c:	00040593          	mv	a1,s0
804053a0:	00100693          	li	a3,1
804053a4:	00090613          	mv	a2,s2
804053a8:	00048513          	mv	a0,s1
804053ac:	f39ff0ef          	jal	ra,804052e4 <wakeup_wait>
804053b0:	0044a403          	lw	s0,4(s1)
804053b4:	fc8488e3          	beq	s1,s0,80405384 <wakeup_queue+0x5c>
804053b8:	ff440413          	addi	s0,s0,-12
804053bc:	fe0410e3          	bnez	s0,8040539c <wakeup_queue+0x74>
804053c0:	fc5ff06f          	j	80405384 <wakeup_queue+0x5c>
804053c4:	e79ff0ef          	jal	ra,8040523c <wait_queue_next.part.2>

804053c8 <wait_current_set>:
804053c8:	00097797          	auipc	a5,0x97
804053cc:	3e478793          	addi	a5,a5,996 # 8049c7ac <current>
804053d0:	0007a783          	lw	a5,0(a5)
804053d4:	04078063          	beqz	a5,80405414 <wait_current_set+0x4c>
804053d8:	00c58713          	addi	a4,a1,12
804053dc:	800006b7          	lui	a3,0x80000
804053e0:	00e5a623          	sw	a4,12(a1)
804053e4:	00f5a023          	sw	a5,0(a1)
804053e8:	00d5a223          	sw	a3,4(a1)
804053ec:	00100693          	li	a3,1
804053f0:	00d7a023          	sw	a3,0(a5)
804053f4:	0ac7a423          	sw	a2,168(a5)
804053f8:	00052783          	lw	a5,0(a0)
804053fc:	00a5a423          	sw	a0,8(a1)
80405400:	00e52023          	sw	a4,0(a0)
80405404:	00e7a223          	sw	a4,4(a5)
80405408:	00a5a823          	sw	a0,16(a1)
8040540c:	00f5a623          	sw	a5,12(a1)
80405410:	00008067          	ret
80405414:	ff010113          	addi	sp,sp,-16
80405418:	0000f697          	auipc	a3,0xf
8040541c:	ef868693          	addi	a3,a3,-264 # 80414310 <default_pmm_manager+0x914>
80405420:	0000e617          	auipc	a2,0xe
80405424:	aa860613          	addi	a2,a2,-1368 # 80412ec8 <commands+0x1bc>
80405428:	07600593          	li	a1,118
8040542c:	0000f517          	auipc	a0,0xf
80405430:	f3450513          	addi	a0,a0,-204 # 80414360 <default_pmm_manager+0x964>
80405434:	00112623          	sw	ra,12(sp)
80405438:	9ecfb0ef          	jal	ra,80400624 <__panic>

8040543c <get_fd_array.part.4>:
8040543c:	ff010113          	addi	sp,sp,-16
80405440:	0000f697          	auipc	a3,0xf
80405444:	28468693          	addi	a3,a3,644 # 804146c4 <CSWTCH.69+0x344>
80405448:	0000e617          	auipc	a2,0xe
8040544c:	a8060613          	addi	a2,a2,-1408 # 80412ec8 <commands+0x1bc>
80405450:	01400593          	li	a1,20
80405454:	0000f517          	auipc	a0,0xf
80405458:	29c50513          	addi	a0,a0,668 # 804146f0 <CSWTCH.69+0x370>
8040545c:	00112623          	sw	ra,12(sp)
80405460:	9c4fb0ef          	jal	ra,80400624 <__panic>

80405464 <fd_array_alloc>:
80405464:	00097797          	auipc	a5,0x97
80405468:	34878793          	addi	a5,a5,840 # 8049c7ac <current>
8040546c:	0007a783          	lw	a5,0(a5)
80405470:	ff010113          	addi	sp,sp,-16
80405474:	00112623          	sw	ra,12(sp)
80405478:	0dc7a683          	lw	a3,220(a5)
8040547c:	0a068463          	beqz	a3,80405524 <fd_array_alloc+0xc0>
80405480:	0086a783          	lw	a5,8(a3)
80405484:	0af05063          	blez	a5,80405524 <fd_array_alloc+0xc0>
80405488:	ffff7737          	lui	a4,0xffff7
8040548c:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <end+0x7fb5a21d>
80405490:	0046a683          	lw	a3,4(a3)
80405494:	04e50463          	beq	a0,a4,804054dc <fd_array_alloc+0x78>
80405498:	09000793          	li	a5,144
8040549c:	08a7e063          	bltu	a5,a0,8040551c <fd_array_alloc+0xb8>
804054a0:	00351793          	slli	a5,a0,0x3
804054a4:	40a787b3          	sub	a5,a5,a0
804054a8:	00279793          	slli	a5,a5,0x2
804054ac:	00f687b3          	add	a5,a3,a5
804054b0:	0007a703          	lw	a4,0(a5)
804054b4:	06071063          	bnez	a4,80405514 <fd_array_alloc+0xb0>
804054b8:	0187a503          	lw	a0,24(a5)
804054bc:	06051663          	bnez	a0,80405528 <fd_array_alloc+0xc4>
804054c0:	00100713          	li	a4,1
804054c4:	00e7a023          	sw	a4,0(a5)
804054c8:	0007aa23          	sw	zero,20(a5)
804054cc:	00f5a023          	sw	a5,0(a1)
804054d0:	00c12083          	lw	ra,12(sp)
804054d4:	01010113          	addi	sp,sp,16
804054d8:	00008067          	ret
804054dc:	0006a783          	lw	a5,0(a3)
804054e0:	02078663          	beqz	a5,8040550c <fd_array_alloc+0xa8>
804054e4:	00001737          	lui	a4,0x1
804054e8:	fdc70713          	addi	a4,a4,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804054ec:	01c68793          	addi	a5,a3,28
804054f0:	00e686b3          	add	a3,a3,a4
804054f4:	0007a703          	lw	a4,0(a5)
804054f8:	fc0700e3          	beqz	a4,804054b8 <fd_array_alloc+0x54>
804054fc:	01c78793          	addi	a5,a5,28
80405500:	fef69ae3          	bne	a3,a5,804054f4 <fd_array_alloc+0x90>
80405504:	fea00513          	li	a0,-22
80405508:	fc9ff06f          	j	804054d0 <fd_array_alloc+0x6c>
8040550c:	00068793          	mv	a5,a3
80405510:	fa9ff06f          	j	804054b8 <fd_array_alloc+0x54>
80405514:	ff100513          	li	a0,-15
80405518:	fb9ff06f          	j	804054d0 <fd_array_alloc+0x6c>
8040551c:	ffd00513          	li	a0,-3
80405520:	fb1ff06f          	j	804054d0 <fd_array_alloc+0x6c>
80405524:	f19ff0ef          	jal	ra,8040543c <get_fd_array.part.4>
80405528:	0000f697          	auipc	a3,0xf
8040552c:	e8068693          	addi	a3,a3,-384 # 804143a8 <CSWTCH.69+0x28>
80405530:	0000e617          	auipc	a2,0xe
80405534:	99860613          	addi	a2,a2,-1640 # 80412ec8 <commands+0x1bc>
80405538:	03b00593          	li	a1,59
8040553c:	0000f517          	auipc	a0,0xf
80405540:	1b450513          	addi	a0,a0,436 # 804146f0 <CSWTCH.69+0x370>
80405544:	8e0fb0ef          	jal	ra,80400624 <__panic>

80405548 <fd_array_free>:
80405548:	00052783          	lw	a5,0(a0)
8040554c:	ff010113          	addi	sp,sp,-16
80405550:	00812423          	sw	s0,8(sp)
80405554:	00112623          	sw	ra,12(sp)
80405558:	00100713          	li	a4,1
8040555c:	00050413          	mv	s0,a0
80405560:	04e78863          	beq	a5,a4,804055b0 <fd_array_free+0x68>
80405564:	00300713          	li	a4,3
80405568:	06e79263          	bne	a5,a4,804055cc <fd_array_free+0x84>
8040556c:	01852783          	lw	a5,24(a0)
80405570:	02078263          	beqz	a5,80405594 <fd_array_free+0x4c>
80405574:	0000f697          	auipc	a3,0xf
80405578:	e3468693          	addi	a3,a3,-460 # 804143a8 <CSWTCH.69+0x28>
8040557c:	0000e617          	auipc	a2,0xe
80405580:	94c60613          	addi	a2,a2,-1716 # 80412ec8 <commands+0x1bc>
80405584:	04500593          	li	a1,69
80405588:	0000f517          	auipc	a0,0xf
8040558c:	16850513          	addi	a0,a0,360 # 804146f0 <CSWTCH.69+0x370>
80405590:	894fb0ef          	jal	ra,80400624 <__panic>
80405594:	01442503          	lw	a0,20(s0)
80405598:	525080ef          	jal	ra,8040e2bc <vfs_close>
8040559c:	00c12083          	lw	ra,12(sp)
804055a0:	00042023          	sw	zero,0(s0)
804055a4:	00812403          	lw	s0,8(sp)
804055a8:	01010113          	addi	sp,sp,16
804055ac:	00008067          	ret
804055b0:	01852783          	lw	a5,24(a0)
804055b4:	fc0790e3          	bnez	a5,80405574 <fd_array_free+0x2c>
804055b8:	00042023          	sw	zero,0(s0)
804055bc:	00c12083          	lw	ra,12(sp)
804055c0:	00812403          	lw	s0,8(sp)
804055c4:	01010113          	addi	sp,sp,16
804055c8:	00008067          	ret
804055cc:	0000f697          	auipc	a3,0xf
804055d0:	e2868693          	addi	a3,a3,-472 # 804143f4 <CSWTCH.69+0x74>
804055d4:	0000e617          	auipc	a2,0xe
804055d8:	8f460613          	addi	a2,a2,-1804 # 80412ec8 <commands+0x1bc>
804055dc:	04400593          	li	a1,68
804055e0:	0000f517          	auipc	a0,0xf
804055e4:	11050513          	addi	a0,a0,272 # 804146f0 <CSWTCH.69+0x370>
804055e8:	83cfb0ef          	jal	ra,80400624 <__panic>

804055ec <fd_array_release>:
804055ec:	00052783          	lw	a5,0(a0)
804055f0:	ff010113          	addi	sp,sp,-16
804055f4:	00112623          	sw	ra,12(sp)
804055f8:	00100693          	li	a3,1
804055fc:	ffe78793          	addi	a5,a5,-2
80405600:	04f6e863          	bltu	a3,a5,80405650 <fd_array_release+0x64>
80405604:	01852783          	lw	a5,24(a0)
80405608:	02f05463          	blez	a5,80405630 <fd_array_release+0x44>
8040560c:	fff78793          	addi	a5,a5,-1
80405610:	00f52c23          	sw	a5,24(a0)
80405614:	00078863          	beqz	a5,80405624 <fd_array_release+0x38>
80405618:	00c12083          	lw	ra,12(sp)
8040561c:	01010113          	addi	sp,sp,16
80405620:	00008067          	ret
80405624:	00c12083          	lw	ra,12(sp)
80405628:	01010113          	addi	sp,sp,16
8040562c:	f1dff06f          	j	80405548 <fd_array_free>
80405630:	0000f697          	auipc	a3,0xf
80405634:	e6468693          	addi	a3,a3,-412 # 80414494 <CSWTCH.69+0x114>
80405638:	0000e617          	auipc	a2,0xe
8040563c:	89060613          	addi	a2,a2,-1904 # 80412ec8 <commands+0x1bc>
80405640:	05600593          	li	a1,86
80405644:	0000f517          	auipc	a0,0xf
80405648:	0ac50513          	addi	a0,a0,172 # 804146f0 <CSWTCH.69+0x370>
8040564c:	fd9fa0ef          	jal	ra,80400624 <__panic>
80405650:	0000f697          	auipc	a3,0xf
80405654:	e0c68693          	addi	a3,a3,-500 # 8041445c <CSWTCH.69+0xdc>
80405658:	0000e617          	auipc	a2,0xe
8040565c:	87060613          	addi	a2,a2,-1936 # 80412ec8 <commands+0x1bc>
80405660:	05500593          	li	a1,85
80405664:	0000f517          	auipc	a0,0xf
80405668:	08c50513          	addi	a0,a0,140 # 804146f0 <CSWTCH.69+0x370>
8040566c:	fb9fa0ef          	jal	ra,80400624 <__panic>

80405670 <fd_array_open.part.9>:
80405670:	ff010113          	addi	sp,sp,-16
80405674:	0000f697          	auipc	a3,0xf
80405678:	db868693          	addi	a3,a3,-584 # 8041442c <CSWTCH.69+0xac>
8040567c:	0000e617          	auipc	a2,0xe
80405680:	84c60613          	addi	a2,a2,-1972 # 80412ec8 <commands+0x1bc>
80405684:	05f00593          	li	a1,95
80405688:	0000f517          	auipc	a0,0xf
8040568c:	06850513          	addi	a0,a0,104 # 804146f0 <CSWTCH.69+0x370>
80405690:	00112623          	sw	ra,12(sp)
80405694:	f91fa0ef          	jal	ra,80400624 <__panic>

80405698 <fd_array_init>:
80405698:	00000793          	li	a5,0
8040569c:	09100713          	li	a4,145
804056a0:	00f52623          	sw	a5,12(a0)
804056a4:	00052c23          	sw	zero,24(a0)
804056a8:	00052023          	sw	zero,0(a0)
804056ac:	00178793          	addi	a5,a5,1
804056b0:	01c50513          	addi	a0,a0,28
804056b4:	fee796e3          	bne	a5,a4,804056a0 <fd_array_init+0x8>
804056b8:	00008067          	ret

804056bc <fd_array_close>:
804056bc:	00052683          	lw	a3,0(a0)
804056c0:	ff010113          	addi	sp,sp,-16
804056c4:	00112623          	sw	ra,12(sp)
804056c8:	00200793          	li	a5,2
804056cc:	04f69c63          	bne	a3,a5,80405724 <fd_array_close+0x68>
804056d0:	01852783          	lw	a5,24(a0)
804056d4:	02f05863          	blez	a5,80405704 <fd_array_close+0x48>
804056d8:	fff78793          	addi	a5,a5,-1
804056dc:	00300693          	li	a3,3
804056e0:	00d52023          	sw	a3,0(a0)
804056e4:	00f52c23          	sw	a5,24(a0)
804056e8:	00078863          	beqz	a5,804056f8 <fd_array_close+0x3c>
804056ec:	00c12083          	lw	ra,12(sp)
804056f0:	01010113          	addi	sp,sp,16
804056f4:	00008067          	ret
804056f8:	00c12083          	lw	ra,12(sp)
804056fc:	01010113          	addi	sp,sp,16
80405700:	e49ff06f          	j	80405548 <fd_array_free>
80405704:	0000f697          	auipc	a3,0xf
80405708:	d9068693          	addi	a3,a3,-624 # 80414494 <CSWTCH.69+0x114>
8040570c:	0000d617          	auipc	a2,0xd
80405710:	7bc60613          	addi	a2,a2,1980 # 80412ec8 <commands+0x1bc>
80405714:	06800593          	li	a1,104
80405718:	0000f517          	auipc	a0,0xf
8040571c:	fd850513          	addi	a0,a0,-40 # 804146f0 <CSWTCH.69+0x370>
80405720:	f05fa0ef          	jal	ra,80400624 <__panic>
80405724:	0000f697          	auipc	a3,0xf
80405728:	c6868693          	addi	a3,a3,-920 # 8041438c <CSWTCH.69+0xc>
8040572c:	0000d617          	auipc	a2,0xd
80405730:	79c60613          	addi	a2,a2,1948 # 80412ec8 <commands+0x1bc>
80405734:	06700593          	li	a1,103
80405738:	0000f517          	auipc	a0,0xf
8040573c:	fb850513          	addi	a0,a0,-72 # 804146f0 <CSWTCH.69+0x370>
80405740:	ee5fa0ef          	jal	ra,80400624 <__panic>

80405744 <fd_array_dup>:
80405744:	fe010113          	addi	sp,sp,-32
80405748:	01212823          	sw	s2,16(sp)
8040574c:	00052903          	lw	s2,0(a0)
80405750:	00112e23          	sw	ra,28(sp)
80405754:	00812c23          	sw	s0,24(sp)
80405758:	00912a23          	sw	s1,20(sp)
8040575c:	01312623          	sw	s3,12(sp)
80405760:	00100793          	li	a5,1
80405764:	06f91e63          	bne	s2,a5,804057e0 <fd_array_dup+0x9c>
80405768:	0005a983          	lw	s3,0(a1)
8040576c:	00200793          	li	a5,2
80405770:	06f99863          	bne	s3,a5,804057e0 <fd_array_dup+0x9c>
80405774:	0145a483          	lw	s1,20(a1)
80405778:	0085a783          	lw	a5,8(a1)
8040577c:	0105a683          	lw	a3,16(a1)
80405780:	0045a703          	lw	a4,4(a1)
80405784:	00050413          	mv	s0,a0
80405788:	00f52423          	sw	a5,8(a0)
8040578c:	00d52823          	sw	a3,16(a0)
80405790:	00e52223          	sw	a4,4(a0)
80405794:	00048513          	mv	a0,s1
80405798:	711070ef          	jal	ra,8040d6a8 <inode_ref_inc>
8040579c:	00048513          	mv	a0,s1
804057a0:	71d070ef          	jal	ra,8040d6bc <inode_open_inc>
804057a4:	00042783          	lw	a5,0(s0)
804057a8:	00942a23          	sw	s1,20(s0)
804057ac:	05279a63          	bne	a5,s2,80405800 <fd_array_dup+0xbc>
804057b0:	04048863          	beqz	s1,80405800 <fd_array_dup+0xbc>
804057b4:	01842783          	lw	a5,24(s0)
804057b8:	01342023          	sw	s3,0(s0)
804057bc:	01c12083          	lw	ra,28(sp)
804057c0:	00178793          	addi	a5,a5,1
804057c4:	00f42c23          	sw	a5,24(s0)
804057c8:	01812403          	lw	s0,24(sp)
804057cc:	01412483          	lw	s1,20(sp)
804057d0:	01012903          	lw	s2,16(sp)
804057d4:	00c12983          	lw	s3,12(sp)
804057d8:	02010113          	addi	sp,sp,32
804057dc:	00008067          	ret
804057e0:	0000f697          	auipc	a3,0xf
804057e4:	be068693          	addi	a3,a3,-1056 # 804143c0 <CSWTCH.69+0x40>
804057e8:	0000d617          	auipc	a2,0xd
804057ec:	6e060613          	addi	a2,a2,1760 # 80412ec8 <commands+0x1bc>
804057f0:	07300593          	li	a1,115
804057f4:	0000f517          	auipc	a0,0xf
804057f8:	efc50513          	addi	a0,a0,-260 # 804146f0 <CSWTCH.69+0x370>
804057fc:	e29fa0ef          	jal	ra,80400624 <__panic>
80405800:	e71ff0ef          	jal	ra,80405670 <fd_array_open.part.9>

80405804 <file_testfd>:
80405804:	09000793          	li	a5,144
80405808:	06a7e463          	bltu	a5,a0,80405870 <file_testfd+0x6c>
8040580c:	00097797          	auipc	a5,0x97
80405810:	fa078793          	addi	a5,a5,-96 # 8049c7ac <current>
80405814:	0007a783          	lw	a5,0(a5)
80405818:	0dc7a703          	lw	a4,220(a5)
8040581c:	04070e63          	beqz	a4,80405878 <file_testfd+0x74>
80405820:	00872783          	lw	a5,8(a4)
80405824:	04f05a63          	blez	a5,80405878 <file_testfd+0x74>
80405828:	00472703          	lw	a4,4(a4)
8040582c:	00351793          	slli	a5,a0,0x3
80405830:	40a787b3          	sub	a5,a5,a0
80405834:	00279793          	slli	a5,a5,0x2
80405838:	00f707b3          	add	a5,a4,a5
8040583c:	0007a683          	lw	a3,0(a5)
80405840:	00200713          	li	a4,2
80405844:	02e69663          	bne	a3,a4,80405870 <file_testfd+0x6c>
80405848:	00c7a703          	lw	a4,12(a5)
8040584c:	02e51263          	bne	a0,a4,80405870 <file_testfd+0x6c>
80405850:	00058663          	beqz	a1,8040585c <file_testfd+0x58>
80405854:	0047a503          	lw	a0,4(a5)
80405858:	00050e63          	beqz	a0,80405874 <file_testfd+0x70>
8040585c:	00100513          	li	a0,1
80405860:	00060a63          	beqz	a2,80405874 <file_testfd+0x70>
80405864:	0087a503          	lw	a0,8(a5)
80405868:	00a03533          	snez	a0,a0
8040586c:	00008067          	ret
80405870:	00000513          	li	a0,0
80405874:	00008067          	ret
80405878:	ff010113          	addi	sp,sp,-16
8040587c:	00112623          	sw	ra,12(sp)
80405880:	bbdff0ef          	jal	ra,8040543c <get_fd_array.part.4>

80405884 <file_open>:
80405884:	fc010113          	addi	sp,sp,-64
80405888:	02112e23          	sw	ra,60(sp)
8040588c:	02812c23          	sw	s0,56(sp)
80405890:	02912a23          	sw	s1,52(sp)
80405894:	03212823          	sw	s2,48(sp)
80405898:	03312623          	sw	s3,44(sp)
8040589c:	03412423          	sw	s4,40(sp)
804058a0:	0035f793          	andi	a5,a1,3
804058a4:	00300713          	li	a4,3
804058a8:	12e78a63          	beq	a5,a4,804059dc <file_open+0x158>
804058ac:	00279793          	slli	a5,a5,0x2
804058b0:	0000f717          	auipc	a4,0xf
804058b4:	ad070713          	addi	a4,a4,-1328 # 80414380 <CSWTCH.69>
804058b8:	00050913          	mv	s2,a0
804058bc:	0000f697          	auipc	a3,0xf
804058c0:	ab868693          	addi	a3,a3,-1352 # 80414374 <CSWTCH.68>
804058c4:	ffff7537          	lui	a0,0xffff7
804058c8:	00f686b3          	add	a3,a3,a5
804058cc:	00058493          	mv	s1,a1
804058d0:	00f707b3          	add	a5,a4,a5
804058d4:	00810593          	addi	a1,sp,8
804058d8:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <end+0x7fb5a21d>
804058dc:	0006aa03          	lw	s4,0(a3)
804058e0:	0007a983          	lw	s3,0(a5)
804058e4:	b81ff0ef          	jal	ra,80405464 <fd_array_alloc>
804058e8:	00050413          	mv	s0,a0
804058ec:	02050463          	beqz	a0,80405914 <file_open+0x90>
804058f0:	00040513          	mv	a0,s0
804058f4:	03c12083          	lw	ra,60(sp)
804058f8:	03812403          	lw	s0,56(sp)
804058fc:	03412483          	lw	s1,52(sp)
80405900:	03012903          	lw	s2,48(sp)
80405904:	02c12983          	lw	s3,44(sp)
80405908:	02812a03          	lw	s4,40(sp)
8040590c:	04010113          	addi	sp,sp,64
80405910:	00008067          	ret
80405914:	00c10613          	addi	a2,sp,12
80405918:	00048593          	mv	a1,s1
8040591c:	00090513          	mv	a0,s2
80405920:	74c080ef          	jal	ra,8040e06c <vfs_open>
80405924:	00050413          	mv	s0,a0
80405928:	0a051463          	bnez	a0,804059d0 <file_open+0x14c>
8040592c:	00812783          	lw	a5,8(sp)
80405930:	0204f593          	andi	a1,s1,32
80405934:	00c12403          	lw	s0,12(sp)
80405938:	0007a823          	sw	zero,16(a5)
8040593c:	04058a63          	beqz	a1,80405990 <file_open+0x10c>
80405940:	0a040463          	beqz	s0,804059e8 <file_open+0x164>
80405944:	03c42783          	lw	a5,60(s0)
80405948:	0a078063          	beqz	a5,804059e8 <file_open+0x164>
8040594c:	0147a783          	lw	a5,20(a5)
80405950:	08078c63          	beqz	a5,804059e8 <file_open+0x164>
80405954:	00040513          	mv	a0,s0
80405958:	0000f597          	auipc	a1,0xf
8040595c:	c5c58593          	addi	a1,a1,-932 # 804145b4 <CSWTCH.69+0x234>
80405960:	571070ef          	jal	ra,8040d6d0 <inode_check>
80405964:	03c42783          	lw	a5,60(s0)
80405968:	00c12503          	lw	a0,12(sp)
8040596c:	01010593          	addi	a1,sp,16
80405970:	0147a783          	lw	a5,20(a5)
80405974:	000780e7          	jalr	a5
80405978:	00050413          	mv	s0,a0
8040597c:	04051663          	bnez	a0,804059c8 <file_open+0x144>
80405980:	00812783          	lw	a5,8(sp)
80405984:	01c12703          	lw	a4,28(sp)
80405988:	00c12403          	lw	s0,12(sp)
8040598c:	00e7a823          	sw	a4,16(a5)
80405990:	0007a683          	lw	a3,0(a5)
80405994:	0087aa23          	sw	s0,20(a5)
80405998:	0147a223          	sw	s4,4(a5)
8040599c:	0137a423          	sw	s3,8(a5)
804059a0:	00100713          	li	a4,1
804059a4:	04e69063          	bne	a3,a4,804059e4 <file_open+0x160>
804059a8:	02040e63          	beqz	s0,804059e4 <file_open+0x160>
804059ac:	0187a703          	lw	a4,24(a5)
804059b0:	00200693          	li	a3,2
804059b4:	00d7a023          	sw	a3,0(a5)
804059b8:	00170713          	addi	a4,a4,1
804059bc:	00e7ac23          	sw	a4,24(a5)
804059c0:	00c7a403          	lw	s0,12(a5)
804059c4:	f2dff06f          	j	804058f0 <file_open+0x6c>
804059c8:	00c12503          	lw	a0,12(sp)
804059cc:	0f1080ef          	jal	ra,8040e2bc <vfs_close>
804059d0:	00812503          	lw	a0,8(sp)
804059d4:	b75ff0ef          	jal	ra,80405548 <fd_array_free>
804059d8:	f19ff06f          	j	804058f0 <file_open+0x6c>
804059dc:	ffd00413          	li	s0,-3
804059e0:	f11ff06f          	j	804058f0 <file_open+0x6c>
804059e4:	c8dff0ef          	jal	ra,80405670 <fd_array_open.part.9>
804059e8:	0000f697          	auipc	a3,0xf
804059ec:	b7c68693          	addi	a3,a3,-1156 # 80414564 <CSWTCH.69+0x1e4>
804059f0:	0000d617          	auipc	a2,0xd
804059f4:	4d860613          	addi	a2,a2,1240 # 80412ec8 <commands+0x1bc>
804059f8:	0b800593          	li	a1,184
804059fc:	0000f517          	auipc	a0,0xf
80405a00:	cf450513          	addi	a0,a0,-780 # 804146f0 <CSWTCH.69+0x370>
80405a04:	c21fa0ef          	jal	ra,80400624 <__panic>

80405a08 <file_close>:
80405a08:	09000793          	li	a5,144
80405a0c:	06a7ec63          	bltu	a5,a0,80405a84 <file_close+0x7c>
80405a10:	00097797          	auipc	a5,0x97
80405a14:	d9c78793          	addi	a5,a5,-612 # 8049c7ac <current>
80405a18:	0007a783          	lw	a5,0(a5)
80405a1c:	ff010113          	addi	sp,sp,-16
80405a20:	00112623          	sw	ra,12(sp)
80405a24:	0dc7a683          	lw	a3,220(a5)
80405a28:	00050713          	mv	a4,a0
80405a2c:	06068063          	beqz	a3,80405a8c <file_close+0x84>
80405a30:	0086a783          	lw	a5,8(a3)
80405a34:	04f05c63          	blez	a5,80405a8c <file_close+0x84>
80405a38:	00351793          	slli	a5,a0,0x3
80405a3c:	0046a503          	lw	a0,4(a3)
80405a40:	40e787b3          	sub	a5,a5,a4
80405a44:	00279793          	slli	a5,a5,0x2
80405a48:	00f50533          	add	a0,a0,a5
80405a4c:	00052683          	lw	a3,0(a0)
80405a50:	00200793          	li	a5,2
80405a54:	02f69063          	bne	a3,a5,80405a74 <file_close+0x6c>
80405a58:	00c52783          	lw	a5,12(a0)
80405a5c:	00f71c63          	bne	a4,a5,80405a74 <file_close+0x6c>
80405a60:	c5dff0ef          	jal	ra,804056bc <fd_array_close>
80405a64:	00c12083          	lw	ra,12(sp)
80405a68:	00000513          	li	a0,0
80405a6c:	01010113          	addi	sp,sp,16
80405a70:	00008067          	ret
80405a74:	00c12083          	lw	ra,12(sp)
80405a78:	ffd00513          	li	a0,-3
80405a7c:	01010113          	addi	sp,sp,16
80405a80:	00008067          	ret
80405a84:	ffd00513          	li	a0,-3
80405a88:	00008067          	ret
80405a8c:	9b1ff0ef          	jal	ra,8040543c <get_fd_array.part.4>

80405a90 <file_read>:
80405a90:	fd010113          	addi	sp,sp,-48
80405a94:	02112623          	sw	ra,44(sp)
80405a98:	02812423          	sw	s0,40(sp)
80405a9c:	02912223          	sw	s1,36(sp)
80405aa0:	03212023          	sw	s2,32(sp)
80405aa4:	01312e23          	sw	s3,28(sp)
80405aa8:	01412c23          	sw	s4,24(sp)
80405aac:	0006a023          	sw	zero,0(a3)
80405ab0:	09000793          	li	a5,144
80405ab4:	10a7e263          	bltu	a5,a0,80405bb8 <file_read+0x128>
80405ab8:	00097797          	auipc	a5,0x97
80405abc:	cf478793          	addi	a5,a5,-780 # 8049c7ac <current>
80405ac0:	0007a783          	lw	a5,0(a5)
80405ac4:	00068913          	mv	s2,a3
80405ac8:	0dc7a703          	lw	a4,220(a5)
80405acc:	0e070a63          	beqz	a4,80405bc0 <file_read+0x130>
80405ad0:	00872783          	lw	a5,8(a4)
80405ad4:	0ef05663          	blez	a5,80405bc0 <file_read+0x130>
80405ad8:	00351793          	slli	a5,a0,0x3
80405adc:	00472403          	lw	s0,4(a4)
80405ae0:	40a787b3          	sub	a5,a5,a0
80405ae4:	00279793          	slli	a5,a5,0x2
80405ae8:	00f40433          	add	s0,s0,a5
80405aec:	00042983          	lw	s3,0(s0)
80405af0:	00200793          	li	a5,2
80405af4:	0cf99263          	bne	s3,a5,80405bb8 <file_read+0x128>
80405af8:	00c42783          	lw	a5,12(s0)
80405afc:	0af51e63          	bne	a0,a5,80405bb8 <file_read+0x128>
80405b00:	00442783          	lw	a5,4(s0)
80405b04:	0a078a63          	beqz	a5,80405bb8 <file_read+0x128>
80405b08:	01842783          	lw	a5,24(s0)
80405b0c:	01042683          	lw	a3,16(s0)
80405b10:	00010513          	mv	a0,sp
80405b14:	00178793          	addi	a5,a5,1
80405b18:	00f42c23          	sw	a5,24(s0)
80405b1c:	311000ef          	jal	ra,8040662c <iobuf_init>
80405b20:	01442483          	lw	s1,20(s0)
80405b24:	00050a13          	mv	s4,a0
80405b28:	08048e63          	beqz	s1,80405bc4 <file_read+0x134>
80405b2c:	03c4a783          	lw	a5,60(s1)
80405b30:	08078a63          	beqz	a5,80405bc4 <file_read+0x134>
80405b34:	00c7a783          	lw	a5,12(a5)
80405b38:	08078663          	beqz	a5,80405bc4 <file_read+0x134>
80405b3c:	00048513          	mv	a0,s1
80405b40:	0000f597          	auipc	a1,0xf
80405b44:	acc58593          	addi	a1,a1,-1332 # 8041460c <CSWTCH.69+0x28c>
80405b48:	389070ef          	jal	ra,8040d6d0 <inode_check>
80405b4c:	03c4a783          	lw	a5,60(s1)
80405b50:	01442503          	lw	a0,20(s0)
80405b54:	000a0593          	mv	a1,s4
80405b58:	00c7a783          	lw	a5,12(a5)
80405b5c:	000780e7          	jalr	a5
80405b60:	008a2783          	lw	a5,8(s4) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80405b64:	00ca2683          	lw	a3,12(s4)
80405b68:	00042703          	lw	a4,0(s0)
80405b6c:	00050493          	mv	s1,a0
80405b70:	40d787b3          	sub	a5,a5,a3
80405b74:	03370a63          	beq	a4,s3,80405ba8 <file_read+0x118>
80405b78:	00f92023          	sw	a5,0(s2)
80405b7c:	00040513          	mv	a0,s0
80405b80:	a6dff0ef          	jal	ra,804055ec <fd_array_release>
80405b84:	02c12083          	lw	ra,44(sp)
80405b88:	02812403          	lw	s0,40(sp)
80405b8c:	00048513          	mv	a0,s1
80405b90:	02012903          	lw	s2,32(sp)
80405b94:	02412483          	lw	s1,36(sp)
80405b98:	01c12983          	lw	s3,28(sp)
80405b9c:	01812a03          	lw	s4,24(sp)
80405ba0:	03010113          	addi	sp,sp,48
80405ba4:	00008067          	ret
80405ba8:	01042703          	lw	a4,16(s0)
80405bac:	00f70733          	add	a4,a4,a5
80405bb0:	00e42823          	sw	a4,16(s0)
80405bb4:	fc5ff06f          	j	80405b78 <file_read+0xe8>
80405bb8:	ffd00493          	li	s1,-3
80405bbc:	fc9ff06f          	j	80405b84 <file_read+0xf4>
80405bc0:	87dff0ef          	jal	ra,8040543c <get_fd_array.part.4>
80405bc4:	0000f697          	auipc	a3,0xf
80405bc8:	9f868693          	addi	a3,a3,-1544 # 804145bc <CSWTCH.69+0x23c>
80405bcc:	0000d617          	auipc	a2,0xd
80405bd0:	2fc60613          	addi	a2,a2,764 # 80412ec8 <commands+0x1bc>
80405bd4:	0e200593          	li	a1,226
80405bd8:	0000f517          	auipc	a0,0xf
80405bdc:	b1850513          	addi	a0,a0,-1256 # 804146f0 <CSWTCH.69+0x370>
80405be0:	a45fa0ef          	jal	ra,80400624 <__panic>

80405be4 <file_write>:
80405be4:	fd010113          	addi	sp,sp,-48
80405be8:	02112623          	sw	ra,44(sp)
80405bec:	02812423          	sw	s0,40(sp)
80405bf0:	02912223          	sw	s1,36(sp)
80405bf4:	03212023          	sw	s2,32(sp)
80405bf8:	01312e23          	sw	s3,28(sp)
80405bfc:	01412c23          	sw	s4,24(sp)
80405c00:	0006a023          	sw	zero,0(a3)
80405c04:	09000793          	li	a5,144
80405c08:	10a7e263          	bltu	a5,a0,80405d0c <file_write+0x128>
80405c0c:	00097797          	auipc	a5,0x97
80405c10:	ba078793          	addi	a5,a5,-1120 # 8049c7ac <current>
80405c14:	0007a783          	lw	a5,0(a5)
80405c18:	00068913          	mv	s2,a3
80405c1c:	0dc7a703          	lw	a4,220(a5)
80405c20:	0e070a63          	beqz	a4,80405d14 <file_write+0x130>
80405c24:	00872783          	lw	a5,8(a4)
80405c28:	0ef05663          	blez	a5,80405d14 <file_write+0x130>
80405c2c:	00351793          	slli	a5,a0,0x3
80405c30:	00472403          	lw	s0,4(a4)
80405c34:	40a787b3          	sub	a5,a5,a0
80405c38:	00279793          	slli	a5,a5,0x2
80405c3c:	00f40433          	add	s0,s0,a5
80405c40:	00042983          	lw	s3,0(s0)
80405c44:	00200793          	li	a5,2
80405c48:	0cf99263          	bne	s3,a5,80405d0c <file_write+0x128>
80405c4c:	00c42783          	lw	a5,12(s0)
80405c50:	0af51e63          	bne	a0,a5,80405d0c <file_write+0x128>
80405c54:	00842783          	lw	a5,8(s0)
80405c58:	0a078a63          	beqz	a5,80405d0c <file_write+0x128>
80405c5c:	01842783          	lw	a5,24(s0)
80405c60:	01042683          	lw	a3,16(s0)
80405c64:	00010513          	mv	a0,sp
80405c68:	00178793          	addi	a5,a5,1
80405c6c:	00f42c23          	sw	a5,24(s0)
80405c70:	1bd000ef          	jal	ra,8040662c <iobuf_init>
80405c74:	01442483          	lw	s1,20(s0)
80405c78:	00050a13          	mv	s4,a0
80405c7c:	08048e63          	beqz	s1,80405d18 <file_write+0x134>
80405c80:	03c4a783          	lw	a5,60(s1)
80405c84:	08078a63          	beqz	a5,80405d18 <file_write+0x134>
80405c88:	0107a783          	lw	a5,16(a5)
80405c8c:	08078663          	beqz	a5,80405d18 <file_write+0x134>
80405c90:	00048513          	mv	a0,s1
80405c94:	0000f597          	auipc	a1,0xf
80405c98:	a2858593          	addi	a1,a1,-1496 # 804146bc <CSWTCH.69+0x33c>
80405c9c:	235070ef          	jal	ra,8040d6d0 <inode_check>
80405ca0:	03c4a783          	lw	a5,60(s1)
80405ca4:	01442503          	lw	a0,20(s0)
80405ca8:	000a0593          	mv	a1,s4
80405cac:	0107a783          	lw	a5,16(a5)
80405cb0:	000780e7          	jalr	a5
80405cb4:	008a2783          	lw	a5,8(s4)
80405cb8:	00ca2683          	lw	a3,12(s4)
80405cbc:	00042703          	lw	a4,0(s0)
80405cc0:	00050493          	mv	s1,a0
80405cc4:	40d787b3          	sub	a5,a5,a3
80405cc8:	03370a63          	beq	a4,s3,80405cfc <file_write+0x118>
80405ccc:	00f92023          	sw	a5,0(s2)
80405cd0:	00040513          	mv	a0,s0
80405cd4:	919ff0ef          	jal	ra,804055ec <fd_array_release>
80405cd8:	02c12083          	lw	ra,44(sp)
80405cdc:	02812403          	lw	s0,40(sp)
80405ce0:	00048513          	mv	a0,s1
80405ce4:	02012903          	lw	s2,32(sp)
80405ce8:	02412483          	lw	s1,36(sp)
80405cec:	01c12983          	lw	s3,28(sp)
80405cf0:	01812a03          	lw	s4,24(sp)
80405cf4:	03010113          	addi	sp,sp,48
80405cf8:	00008067          	ret
80405cfc:	01042703          	lw	a4,16(s0)
80405d00:	00f70733          	add	a4,a4,a5
80405d04:	00e42823          	sw	a4,16(s0)
80405d08:	fc5ff06f          	j	80405ccc <file_write+0xe8>
80405d0c:	ffd00493          	li	s1,-3
80405d10:	fc9ff06f          	j	80405cd8 <file_write+0xf4>
80405d14:	f28ff0ef          	jal	ra,8040543c <get_fd_array.part.4>
80405d18:	0000f697          	auipc	a3,0xf
80405d1c:	95468693          	addi	a3,a3,-1708 # 8041466c <CSWTCH.69+0x2ec>
80405d20:	0000d617          	auipc	a2,0xd
80405d24:	1a860613          	addi	a2,a2,424 # 80412ec8 <commands+0x1bc>
80405d28:	0fc00593          	li	a1,252
80405d2c:	0000f517          	auipc	a0,0xf
80405d30:	9c450513          	addi	a0,a0,-1596 # 804146f0 <CSWTCH.69+0x370>
80405d34:	8f1fa0ef          	jal	ra,80400624 <__panic>

80405d38 <file_seek>:
80405d38:	fe010113          	addi	sp,sp,-32
80405d3c:	00112e23          	sw	ra,28(sp)
80405d40:	00812c23          	sw	s0,24(sp)
80405d44:	00912a23          	sw	s1,20(sp)
80405d48:	01212823          	sw	s2,16(sp)
80405d4c:	09000793          	li	a5,144
80405d50:	12a7ea63          	bltu	a5,a0,80405e84 <file_seek+0x14c>
80405d54:	00097797          	auipc	a5,0x97
80405d58:	a5878793          	addi	a5,a5,-1448 # 8049c7ac <current>
80405d5c:	0007a783          	lw	a5,0(a5)
80405d60:	0dc7a703          	lw	a4,220(a5)
80405d64:	14070063          	beqz	a4,80405ea4 <file_seek+0x16c>
80405d68:	00872783          	lw	a5,8(a4)
80405d6c:	12f05c63          	blez	a5,80405ea4 <file_seek+0x16c>
80405d70:	00472403          	lw	s0,4(a4)
80405d74:	00351793          	slli	a5,a0,0x3
80405d78:	40a787b3          	sub	a5,a5,a0
80405d7c:	00279793          	slli	a5,a5,0x2
80405d80:	00f40433          	add	s0,s0,a5
80405d84:	00042703          	lw	a4,0(s0)
80405d88:	00200793          	li	a5,2
80405d8c:	0ef71c63          	bne	a4,a5,80405e84 <file_seek+0x14c>
80405d90:	00c42783          	lw	a5,12(s0)
80405d94:	0ef51863          	bne	a0,a5,80405e84 <file_seek+0x14c>
80405d98:	01842783          	lw	a5,24(s0)
80405d9c:	00100693          	li	a3,1
80405da0:	00058913          	mv	s2,a1
80405da4:	00178793          	addi	a5,a5,1
80405da8:	00f42c23          	sw	a5,24(s0)
80405dac:	0cd60663          	beq	a2,a3,80405e78 <file_seek+0x140>
80405db0:	02e60863          	beq	a2,a4,80405de0 <file_seek+0xa8>
80405db4:	ffd00493          	li	s1,-3
80405db8:	06060a63          	beqz	a2,80405e2c <file_seek+0xf4>
80405dbc:	00040513          	mv	a0,s0
80405dc0:	82dff0ef          	jal	ra,804055ec <fd_array_release>
80405dc4:	01c12083          	lw	ra,28(sp)
80405dc8:	01812403          	lw	s0,24(sp)
80405dcc:	00048513          	mv	a0,s1
80405dd0:	01012903          	lw	s2,16(sp)
80405dd4:	01412483          	lw	s1,20(sp)
80405dd8:	02010113          	addi	sp,sp,32
80405ddc:	00008067          	ret
80405de0:	01442483          	lw	s1,20(s0)
80405de4:	0e048263          	beqz	s1,80405ec8 <file_seek+0x190>
80405de8:	03c4a783          	lw	a5,60(s1)
80405dec:	0c078e63          	beqz	a5,80405ec8 <file_seek+0x190>
80405df0:	0147a783          	lw	a5,20(a5)
80405df4:	0c078a63          	beqz	a5,80405ec8 <file_seek+0x190>
80405df8:	00048513          	mv	a0,s1
80405dfc:	0000e597          	auipc	a1,0xe
80405e00:	7b858593          	addi	a1,a1,1976 # 804145b4 <CSWTCH.69+0x234>
80405e04:	0cd070ef          	jal	ra,8040d6d0 <inode_check>
80405e08:	03c4a783          	lw	a5,60(s1)
80405e0c:	01442503          	lw	a0,20(s0)
80405e10:	00010593          	mv	a1,sp
80405e14:	0147a783          	lw	a5,20(a5)
80405e18:	000780e7          	jalr	a5
80405e1c:	00050493          	mv	s1,a0
80405e20:	f8051ee3          	bnez	a0,80405dbc <file_seek+0x84>
80405e24:	00c12783          	lw	a5,12(sp)
80405e28:	00f90933          	add	s2,s2,a5
80405e2c:	01442483          	lw	s1,20(s0)
80405e30:	06048c63          	beqz	s1,80405ea8 <file_seek+0x170>
80405e34:	03c4a783          	lw	a5,60(s1)
80405e38:	06078863          	beqz	a5,80405ea8 <file_seek+0x170>
80405e3c:	02c7a783          	lw	a5,44(a5)
80405e40:	06078463          	beqz	a5,80405ea8 <file_seek+0x170>
80405e44:	00048513          	mv	a0,s1
80405e48:	0000f597          	auipc	a1,0xf
80405e4c:	81c58593          	addi	a1,a1,-2020 # 80414664 <CSWTCH.69+0x2e4>
80405e50:	081070ef          	jal	ra,8040d6d0 <inode_check>
80405e54:	03c4a783          	lw	a5,60(s1)
80405e58:	01442503          	lw	a0,20(s0)
80405e5c:	00090593          	mv	a1,s2
80405e60:	02c7a783          	lw	a5,44(a5)
80405e64:	000780e7          	jalr	a5
80405e68:	00050493          	mv	s1,a0
80405e6c:	f40518e3          	bnez	a0,80405dbc <file_seek+0x84>
80405e70:	01242823          	sw	s2,16(s0)
80405e74:	f49ff06f          	j	80405dbc <file_seek+0x84>
80405e78:	01042783          	lw	a5,16(s0)
80405e7c:	00f58933          	add	s2,a1,a5
80405e80:	fadff06f          	j	80405e2c <file_seek+0xf4>
80405e84:	01c12083          	lw	ra,28(sp)
80405e88:	01812403          	lw	s0,24(sp)
80405e8c:	ffd00493          	li	s1,-3
80405e90:	00048513          	mv	a0,s1
80405e94:	01012903          	lw	s2,16(sp)
80405e98:	01412483          	lw	s1,20(sp)
80405e9c:	02010113          	addi	sp,sp,32
80405ea0:	00008067          	ret
80405ea4:	d98ff0ef          	jal	ra,8040543c <get_fd_array.part.4>
80405ea8:	0000e697          	auipc	a3,0xe
80405eac:	76c68693          	addi	a3,a3,1900 # 80414614 <CSWTCH.69+0x294>
80405eb0:	0000d617          	auipc	a2,0xd
80405eb4:	01860613          	addi	a2,a2,24 # 80412ec8 <commands+0x1bc>
80405eb8:	11e00593          	li	a1,286
80405ebc:	0000f517          	auipc	a0,0xf
80405ec0:	83450513          	addi	a0,a0,-1996 # 804146f0 <CSWTCH.69+0x370>
80405ec4:	f60fa0ef          	jal	ra,80400624 <__panic>
80405ec8:	0000e697          	auipc	a3,0xe
80405ecc:	69c68693          	addi	a3,a3,1692 # 80414564 <CSWTCH.69+0x1e4>
80405ed0:	0000d617          	auipc	a2,0xd
80405ed4:	ff860613          	addi	a2,a2,-8 # 80412ec8 <commands+0x1bc>
80405ed8:	11600593          	li	a1,278
80405edc:	0000f517          	auipc	a0,0xf
80405ee0:	81450513          	addi	a0,a0,-2028 # 804146f0 <CSWTCH.69+0x370>
80405ee4:	f40fa0ef          	jal	ra,80400624 <__panic>

80405ee8 <file_fstat>:
80405ee8:	ff010113          	addi	sp,sp,-16
80405eec:	00112623          	sw	ra,12(sp)
80405ef0:	00812423          	sw	s0,8(sp)
80405ef4:	00912223          	sw	s1,4(sp)
80405ef8:	01212023          	sw	s2,0(sp)
80405efc:	09000793          	li	a5,144
80405f00:	0aa7ee63          	bltu	a5,a0,80405fbc <file_fstat+0xd4>
80405f04:	00097797          	auipc	a5,0x97
80405f08:	8a878793          	addi	a5,a5,-1880 # 8049c7ac <current>
80405f0c:	0007a783          	lw	a5,0(a5)
80405f10:	00058913          	mv	s2,a1
80405f14:	0dc7a703          	lw	a4,220(a5)
80405f18:	0c070263          	beqz	a4,80405fdc <file_fstat+0xf4>
80405f1c:	00872783          	lw	a5,8(a4)
80405f20:	0af05e63          	blez	a5,80405fdc <file_fstat+0xf4>
80405f24:	00472403          	lw	s0,4(a4)
80405f28:	00351793          	slli	a5,a0,0x3
80405f2c:	40a787b3          	sub	a5,a5,a0
80405f30:	00279793          	slli	a5,a5,0x2
80405f34:	00f40433          	add	s0,s0,a5
80405f38:	00042703          	lw	a4,0(s0)
80405f3c:	00200793          	li	a5,2
80405f40:	06f71e63          	bne	a4,a5,80405fbc <file_fstat+0xd4>
80405f44:	00c42783          	lw	a5,12(s0)
80405f48:	06f51a63          	bne	a0,a5,80405fbc <file_fstat+0xd4>
80405f4c:	01842783          	lw	a5,24(s0)
80405f50:	01442483          	lw	s1,20(s0)
80405f54:	00178793          	addi	a5,a5,1
80405f58:	00f42c23          	sw	a5,24(s0)
80405f5c:	08048263          	beqz	s1,80405fe0 <file_fstat+0xf8>
80405f60:	03c4a783          	lw	a5,60(s1)
80405f64:	06078e63          	beqz	a5,80405fe0 <file_fstat+0xf8>
80405f68:	0147a783          	lw	a5,20(a5)
80405f6c:	06078a63          	beqz	a5,80405fe0 <file_fstat+0xf8>
80405f70:	00048513          	mv	a0,s1
80405f74:	0000e597          	auipc	a1,0xe
80405f78:	64058593          	addi	a1,a1,1600 # 804145b4 <CSWTCH.69+0x234>
80405f7c:	754070ef          	jal	ra,8040d6d0 <inode_check>
80405f80:	03c4a783          	lw	a5,60(s1)
80405f84:	01442503          	lw	a0,20(s0)
80405f88:	00090593          	mv	a1,s2
80405f8c:	0147a783          	lw	a5,20(a5)
80405f90:	000780e7          	jalr	a5
80405f94:	00050493          	mv	s1,a0
80405f98:	00040513          	mv	a0,s0
80405f9c:	e50ff0ef          	jal	ra,804055ec <fd_array_release>
80405fa0:	00c12083          	lw	ra,12(sp)
80405fa4:	00812403          	lw	s0,8(sp)
80405fa8:	00048513          	mv	a0,s1
80405fac:	00012903          	lw	s2,0(sp)
80405fb0:	00412483          	lw	s1,4(sp)
80405fb4:	01010113          	addi	sp,sp,16
80405fb8:	00008067          	ret
80405fbc:	00c12083          	lw	ra,12(sp)
80405fc0:	00812403          	lw	s0,8(sp)
80405fc4:	ffd00493          	li	s1,-3
80405fc8:	00048513          	mv	a0,s1
80405fcc:	00012903          	lw	s2,0(sp)
80405fd0:	00412483          	lw	s1,4(sp)
80405fd4:	01010113          	addi	sp,sp,16
80405fd8:	00008067          	ret
80405fdc:	c60ff0ef          	jal	ra,8040543c <get_fd_array.part.4>
80405fe0:	0000e697          	auipc	a3,0xe
80405fe4:	58468693          	addi	a3,a3,1412 # 80414564 <CSWTCH.69+0x1e4>
80405fe8:	0000d617          	auipc	a2,0xd
80405fec:	ee060613          	addi	a2,a2,-288 # 80412ec8 <commands+0x1bc>
80405ff0:	13000593          	li	a1,304
80405ff4:	0000e517          	auipc	a0,0xe
80405ff8:	6fc50513          	addi	a0,a0,1788 # 804146f0 <CSWTCH.69+0x370>
80405ffc:	e28fa0ef          	jal	ra,80400624 <__panic>

80406000 <file_fsync>:
80406000:	ff010113          	addi	sp,sp,-16
80406004:	00112623          	sw	ra,12(sp)
80406008:	00812423          	sw	s0,8(sp)
8040600c:	00912223          	sw	s1,4(sp)
80406010:	09000793          	li	a5,144
80406014:	0aa7e863          	bltu	a5,a0,804060c4 <file_fsync+0xc4>
80406018:	00096797          	auipc	a5,0x96
8040601c:	79478793          	addi	a5,a5,1940 # 8049c7ac <current>
80406020:	0007a783          	lw	a5,0(a5)
80406024:	0dc7a703          	lw	a4,220(a5)
80406028:	0a070c63          	beqz	a4,804060e0 <file_fsync+0xe0>
8040602c:	00872783          	lw	a5,8(a4)
80406030:	0af05863          	blez	a5,804060e0 <file_fsync+0xe0>
80406034:	00472403          	lw	s0,4(a4)
80406038:	00351793          	slli	a5,a0,0x3
8040603c:	40a787b3          	sub	a5,a5,a0
80406040:	00279793          	slli	a5,a5,0x2
80406044:	00f40433          	add	s0,s0,a5
80406048:	00042703          	lw	a4,0(s0)
8040604c:	00200793          	li	a5,2
80406050:	06f71a63          	bne	a4,a5,804060c4 <file_fsync+0xc4>
80406054:	00c42783          	lw	a5,12(s0)
80406058:	06f51663          	bne	a0,a5,804060c4 <file_fsync+0xc4>
8040605c:	01842783          	lw	a5,24(s0)
80406060:	01442483          	lw	s1,20(s0)
80406064:	00178793          	addi	a5,a5,1
80406068:	00f42c23          	sw	a5,24(s0)
8040606c:	06048c63          	beqz	s1,804060e4 <file_fsync+0xe4>
80406070:	03c4a783          	lw	a5,60(s1)
80406074:	06078863          	beqz	a5,804060e4 <file_fsync+0xe4>
80406078:	0187a783          	lw	a5,24(a5)
8040607c:	06078463          	beqz	a5,804060e4 <file_fsync+0xe4>
80406080:	0000e597          	auipc	a1,0xe
80406084:	47c58593          	addi	a1,a1,1148 # 804144fc <CSWTCH.69+0x17c>
80406088:	00048513          	mv	a0,s1
8040608c:	644070ef          	jal	ra,8040d6d0 <inode_check>
80406090:	03c4a783          	lw	a5,60(s1)
80406094:	01442503          	lw	a0,20(s0)
80406098:	0187a783          	lw	a5,24(a5)
8040609c:	000780e7          	jalr	a5
804060a0:	00050493          	mv	s1,a0
804060a4:	00040513          	mv	a0,s0
804060a8:	d44ff0ef          	jal	ra,804055ec <fd_array_release>
804060ac:	00c12083          	lw	ra,12(sp)
804060b0:	00812403          	lw	s0,8(sp)
804060b4:	00048513          	mv	a0,s1
804060b8:	00412483          	lw	s1,4(sp)
804060bc:	01010113          	addi	sp,sp,16
804060c0:	00008067          	ret
804060c4:	00c12083          	lw	ra,12(sp)
804060c8:	00812403          	lw	s0,8(sp)
804060cc:	ffd00493          	li	s1,-3
804060d0:	00048513          	mv	a0,s1
804060d4:	00412483          	lw	s1,4(sp)
804060d8:	01010113          	addi	sp,sp,16
804060dc:	00008067          	ret
804060e0:	b5cff0ef          	jal	ra,8040543c <get_fd_array.part.4>
804060e4:	0000e697          	auipc	a3,0xe
804060e8:	3c868693          	addi	a3,a3,968 # 804144ac <CSWTCH.69+0x12c>
804060ec:	0000d617          	auipc	a2,0xd
804060f0:	ddc60613          	addi	a2,a2,-548 # 80412ec8 <commands+0x1bc>
804060f4:	13e00593          	li	a1,318
804060f8:	0000e517          	auipc	a0,0xe
804060fc:	5f850513          	addi	a0,a0,1528 # 804146f0 <CSWTCH.69+0x370>
80406100:	d24fa0ef          	jal	ra,80400624 <__panic>

80406104 <file_getdirentry>:
80406104:	fd010113          	addi	sp,sp,-48
80406108:	02112623          	sw	ra,44(sp)
8040610c:	02812423          	sw	s0,40(sp)
80406110:	02912223          	sw	s1,36(sp)
80406114:	03212023          	sw	s2,32(sp)
80406118:	01312e23          	sw	s3,28(sp)
8040611c:	09000793          	li	a5,144
80406120:	0ea7ec63          	bltu	a5,a0,80406218 <file_getdirentry+0x114>
80406124:	00096797          	auipc	a5,0x96
80406128:	68878793          	addi	a5,a5,1672 # 8049c7ac <current>
8040612c:	0007a783          	lw	a5,0(a5)
80406130:	00058493          	mv	s1,a1
80406134:	0dc7a703          	lw	a4,220(a5)
80406138:	10070263          	beqz	a4,8040623c <file_getdirentry+0x138>
8040613c:	00872783          	lw	a5,8(a4)
80406140:	0ef05e63          	blez	a5,8040623c <file_getdirentry+0x138>
80406144:	00472403          	lw	s0,4(a4)
80406148:	00351793          	slli	a5,a0,0x3
8040614c:	40a787b3          	sub	a5,a5,a0
80406150:	00279793          	slli	a5,a5,0x2
80406154:	00f40433          	add	s0,s0,a5
80406158:	00042703          	lw	a4,0(s0)
8040615c:	00200793          	li	a5,2
80406160:	0af71c63          	bne	a4,a5,80406218 <file_getdirentry+0x114>
80406164:	00c42783          	lw	a5,12(s0)
80406168:	0af51863          	bne	a0,a5,80406218 <file_getdirentry+0x114>
8040616c:	01842783          	lw	a5,24(s0)
80406170:	10000613          	li	a2,256
80406174:	00458593          	addi	a1,a1,4
80406178:	00178793          	addi	a5,a5,1
8040617c:	00f42c23          	sw	a5,24(s0)
80406180:	0004a683          	lw	a3,0(s1)
80406184:	00010513          	mv	a0,sp
80406188:	4a4000ef          	jal	ra,8040662c <iobuf_init>
8040618c:	01442903          	lw	s2,20(s0)
80406190:	00050993          	mv	s3,a0
80406194:	0a090663          	beqz	s2,80406240 <file_getdirentry+0x13c>
80406198:	03c92783          	lw	a5,60(s2)
8040619c:	0a078263          	beqz	a5,80406240 <file_getdirentry+0x13c>
804061a0:	0207a783          	lw	a5,32(a5)
804061a4:	08078e63          	beqz	a5,80406240 <file_getdirentry+0x13c>
804061a8:	00090513          	mv	a0,s2
804061ac:	0000e597          	auipc	a1,0xe
804061b0:	3ac58593          	addi	a1,a1,940 # 80414558 <CSWTCH.69+0x1d8>
804061b4:	51c070ef          	jal	ra,8040d6d0 <inode_check>
804061b8:	03c92783          	lw	a5,60(s2)
804061bc:	01442503          	lw	a0,20(s0)
804061c0:	00098593          	mv	a1,s3
804061c4:	0207a783          	lw	a5,32(a5)
804061c8:	000780e7          	jalr	a5
804061cc:	00050913          	mv	s2,a0
804061d0:	02050663          	beqz	a0,804061fc <file_getdirentry+0xf8>
804061d4:	00040513          	mv	a0,s0
804061d8:	c14ff0ef          	jal	ra,804055ec <fd_array_release>
804061dc:	02c12083          	lw	ra,44(sp)
804061e0:	02812403          	lw	s0,40(sp)
804061e4:	00090513          	mv	a0,s2
804061e8:	02412483          	lw	s1,36(sp)
804061ec:	02012903          	lw	s2,32(sp)
804061f0:	01c12983          	lw	s3,28(sp)
804061f4:	03010113          	addi	sp,sp,48
804061f8:	00008067          	ret
804061fc:	0004a783          	lw	a5,0(s1)
80406200:	0089a683          	lw	a3,8(s3) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80406204:	00c9a703          	lw	a4,12(s3)
80406208:	00d787b3          	add	a5,a5,a3
8040620c:	40e787b3          	sub	a5,a5,a4
80406210:	00f4a023          	sw	a5,0(s1)
80406214:	fc1ff06f          	j	804061d4 <file_getdirentry+0xd0>
80406218:	02c12083          	lw	ra,44(sp)
8040621c:	02812403          	lw	s0,40(sp)
80406220:	ffd00913          	li	s2,-3
80406224:	00090513          	mv	a0,s2
80406228:	02412483          	lw	s1,36(sp)
8040622c:	02012903          	lw	s2,32(sp)
80406230:	01c12983          	lw	s3,28(sp)
80406234:	03010113          	addi	sp,sp,48
80406238:	00008067          	ret
8040623c:	a00ff0ef          	jal	ra,8040543c <get_fd_array.part.4>
80406240:	0000e697          	auipc	a3,0xe
80406244:	2c468693          	addi	a3,a3,708 # 80414504 <CSWTCH.69+0x184>
80406248:	0000d617          	auipc	a2,0xd
8040624c:	c8060613          	addi	a2,a2,-896 # 80412ec8 <commands+0x1bc>
80406250:	14e00593          	li	a1,334
80406254:	0000e517          	auipc	a0,0xe
80406258:	49c50513          	addi	a0,a0,1180 # 804146f0 <CSWTCH.69+0x370>
8040625c:	bc8fa0ef          	jal	ra,80400624 <__panic>

80406260 <file_dup>:
80406260:	09000793          	li	a5,144
80406264:	0aa7e863          	bltu	a5,a0,80406314 <file_dup+0xb4>
80406268:	00096797          	auipc	a5,0x96
8040626c:	54478793          	addi	a5,a5,1348 # 8049c7ac <current>
80406270:	0007a783          	lw	a5,0(a5)
80406274:	fe010113          	addi	sp,sp,-32
80406278:	00112e23          	sw	ra,28(sp)
8040627c:	0dc7a683          	lw	a3,220(a5)
80406280:	00812c23          	sw	s0,24(sp)
80406284:	00050713          	mv	a4,a0
80406288:	00058513          	mv	a0,a1
8040628c:	08068863          	beqz	a3,8040631c <file_dup+0xbc>
80406290:	0086a783          	lw	a5,8(a3)
80406294:	08f05463          	blez	a5,8040631c <file_dup+0xbc>
80406298:	0046a403          	lw	s0,4(a3)
8040629c:	00371793          	slli	a5,a4,0x3
804062a0:	40e787b3          	sub	a5,a5,a4
804062a4:	00279793          	slli	a5,a5,0x2
804062a8:	00f40433          	add	s0,s0,a5
804062ac:	00042683          	lw	a3,0(s0)
804062b0:	00200793          	li	a5,2
804062b4:	04f69663          	bne	a3,a5,80406300 <file_dup+0xa0>
804062b8:	00c42783          	lw	a5,12(s0)
804062bc:	04f71263          	bne	a4,a5,80406300 <file_dup+0xa0>
804062c0:	00c10593          	addi	a1,sp,12
804062c4:	9a0ff0ef          	jal	ra,80405464 <fd_array_alloc>
804062c8:	00050a63          	beqz	a0,804062dc <file_dup+0x7c>
804062cc:	01c12083          	lw	ra,28(sp)
804062d0:	01812403          	lw	s0,24(sp)
804062d4:	02010113          	addi	sp,sp,32
804062d8:	00008067          	ret
804062dc:	00c12503          	lw	a0,12(sp)
804062e0:	00040593          	mv	a1,s0
804062e4:	c60ff0ef          	jal	ra,80405744 <fd_array_dup>
804062e8:	00c12783          	lw	a5,12(sp)
804062ec:	01c12083          	lw	ra,28(sp)
804062f0:	01812403          	lw	s0,24(sp)
804062f4:	00c7a503          	lw	a0,12(a5)
804062f8:	02010113          	addi	sp,sp,32
804062fc:	00008067          	ret
80406300:	01c12083          	lw	ra,28(sp)
80406304:	01812403          	lw	s0,24(sp)
80406308:	ffd00513          	li	a0,-3
8040630c:	02010113          	addi	sp,sp,32
80406310:	00008067          	ret
80406314:	ffd00513          	li	a0,-3
80406318:	00008067          	ret
8040631c:	920ff0ef          	jal	ra,8040543c <get_fd_array.part.4>

80406320 <fs_init>:
80406320:	ff010113          	addi	sp,sp,-16
80406324:	00112623          	sw	ra,12(sp)
80406328:	664070ef          	jal	ra,8040d98c <vfs_init>
8040632c:	101080ef          	jal	ra,8040ec2c <dev_init>
80406330:	00c12083          	lw	ra,12(sp)
80406334:	01010113          	addi	sp,sp,16
80406338:	5600906f          	j	8040f898 <sfs_init>

8040633c <fs_cleanup>:
8040633c:	2210706f          	j	8040dd5c <vfs_cleanup>

80406340 <lock_files>:
80406340:	00c50513          	addi	a0,a0,12
80406344:	e95fe06f          	j	804051d8 <down>

80406348 <unlock_files>:
80406348:	00c50513          	addi	a0,a0,12
8040634c:	e89fe06f          	j	804051d4 <up>

80406350 <files_create>:
80406350:	ff010113          	addi	sp,sp,-16
80406354:	00001537          	lui	a0,0x1
80406358:	00812423          	sw	s0,8(sp)
8040635c:	00112623          	sw	ra,12(sp)
80406360:	e60fc0ef          	jal	ra,804029c0 <kmalloc>
80406364:	00050413          	mv	s0,a0
80406368:	02050463          	beqz	a0,80406390 <files_create+0x40>
8040636c:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6fe8>
80406370:	00042023          	sw	zero,0(s0)
80406374:	00c50513          	addi	a0,a0,12
80406378:	00f42223          	sw	a5,4(s0)
8040637c:	00042423          	sw	zero,8(s0)
80406380:	00100593          	li	a1,1
80406384:	e45fe0ef          	jal	ra,804051c8 <sem_init>
80406388:	00442503          	lw	a0,4(s0)
8040638c:	b0cff0ef          	jal	ra,80405698 <fd_array_init>
80406390:	00040513          	mv	a0,s0
80406394:	00c12083          	lw	ra,12(sp)
80406398:	00812403          	lw	s0,8(sp)
8040639c:	01010113          	addi	sp,sp,16
804063a0:	00008067          	ret

804063a4 <files_destroy>:
804063a4:	fe010113          	addi	sp,sp,-32
804063a8:	00112e23          	sw	ra,28(sp)
804063ac:	00812c23          	sw	s0,24(sp)
804063b0:	00912a23          	sw	s1,20(sp)
804063b4:	01212823          	sw	s2,16(sp)
804063b8:	01312623          	sw	s3,12(sp)
804063bc:	08050a63          	beqz	a0,80406450 <files_destroy+0xac>
804063c0:	00852783          	lw	a5,8(a0)
804063c4:	00050993          	mv	s3,a0
804063c8:	08079463          	bnez	a5,80406450 <files_destroy+0xac>
804063cc:	00052503          	lw	a0,0(a0)
804063d0:	00050463          	beqz	a0,804063d8 <files_destroy+0x34>
804063d4:	3c8070ef          	jal	ra,8040d79c <inode_ref_dec>
804063d8:	0049a403          	lw	s0,4(s3)
804063dc:	000014b7          	lui	s1,0x1
804063e0:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804063e4:	009404b3          	add	s1,s0,s1
804063e8:	00200913          	li	s2,2
804063ec:	00042783          	lw	a5,0(s0)
804063f0:	03278863          	beq	a5,s2,80406420 <files_destroy+0x7c>
804063f4:	02079e63          	bnez	a5,80406430 <files_destroy+0x8c>
804063f8:	01c40413          	addi	s0,s0,28
804063fc:	fe8498e3          	bne	s1,s0,804063ec <files_destroy+0x48>
80406400:	01812403          	lw	s0,24(sp)
80406404:	01c12083          	lw	ra,28(sp)
80406408:	01412483          	lw	s1,20(sp)
8040640c:	01012903          	lw	s2,16(sp)
80406410:	00098513          	mv	a0,s3
80406414:	00c12983          	lw	s3,12(sp)
80406418:	02010113          	addi	sp,sp,32
8040641c:	ec8fc06f          	j	80402ae4 <kfree>
80406420:	00040513          	mv	a0,s0
80406424:	a98ff0ef          	jal	ra,804056bc <fd_array_close>
80406428:	00042783          	lw	a5,0(s0)
8040642c:	fc9ff06f          	j	804063f4 <files_destroy+0x50>
80406430:	0000e697          	auipc	a3,0xe
80406434:	33c68693          	addi	a3,a3,828 # 8041476c <CSWTCH.69+0x3ec>
80406438:	0000d617          	auipc	a2,0xd
8040643c:	a9060613          	addi	a2,a2,-1392 # 80412ec8 <commands+0x1bc>
80406440:	03d00593          	li	a1,61
80406444:	0000e517          	auipc	a0,0xe
80406448:	31850513          	addi	a0,a0,792 # 8041475c <CSWTCH.69+0x3dc>
8040644c:	9d8fa0ef          	jal	ra,80400624 <__panic>
80406450:	0000e697          	auipc	a3,0xe
80406454:	2e068693          	addi	a3,a3,736 # 80414730 <CSWTCH.69+0x3b0>
80406458:	0000d617          	auipc	a2,0xd
8040645c:	a7060613          	addi	a2,a2,-1424 # 80412ec8 <commands+0x1bc>
80406460:	03300593          	li	a1,51
80406464:	0000e517          	auipc	a0,0xe
80406468:	2f850513          	addi	a0,a0,760 # 8041475c <CSWTCH.69+0x3dc>
8040646c:	9b8fa0ef          	jal	ra,80400624 <__panic>

80406470 <files_closeall>:
80406470:	ff010113          	addi	sp,sp,-16
80406474:	00112623          	sw	ra,12(sp)
80406478:	00812423          	sw	s0,8(sp)
8040647c:	00912223          	sw	s1,4(sp)
80406480:	01212023          	sw	s2,0(sp)
80406484:	06050063          	beqz	a0,804064e4 <files_closeall+0x74>
80406488:	00852783          	lw	a5,8(a0)
8040648c:	04f05c63          	blez	a5,804064e4 <files_closeall+0x74>
80406490:	00452483          	lw	s1,4(a0)
80406494:	000017b7          	lui	a5,0x1
80406498:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x7024>
8040649c:	03848413          	addi	s0,s1,56
804064a0:	00200913          	li	s2,2
804064a4:	00f484b3          	add	s1,s1,a5
804064a8:	00c0006f          	j	804064b4 <files_closeall+0x44>
804064ac:	01c40413          	addi	s0,s0,28
804064b0:	00848e63          	beq	s1,s0,804064cc <files_closeall+0x5c>
804064b4:	00042783          	lw	a5,0(s0)
804064b8:	ff279ae3          	bne	a5,s2,804064ac <files_closeall+0x3c>
804064bc:	00040513          	mv	a0,s0
804064c0:	01c40413          	addi	s0,s0,28
804064c4:	9f8ff0ef          	jal	ra,804056bc <fd_array_close>
804064c8:	fe8496e3          	bne	s1,s0,804064b4 <files_closeall+0x44>
804064cc:	00c12083          	lw	ra,12(sp)
804064d0:	00812403          	lw	s0,8(sp)
804064d4:	00412483          	lw	s1,4(sp)
804064d8:	00012903          	lw	s2,0(sp)
804064dc:	01010113          	addi	sp,sp,16
804064e0:	00008067          	ret
804064e4:	0000e697          	auipc	a3,0xe
804064e8:	1e068693          	addi	a3,a3,480 # 804146c4 <CSWTCH.69+0x344>
804064ec:	0000d617          	auipc	a2,0xd
804064f0:	9dc60613          	addi	a2,a2,-1572 # 80412ec8 <commands+0x1bc>
804064f4:	04500593          	li	a1,69
804064f8:	0000e517          	auipc	a0,0xe
804064fc:	26450513          	addi	a0,a0,612 # 8041475c <CSWTCH.69+0x3dc>
80406500:	924fa0ef          	jal	ra,80400624 <__panic>

80406504 <dup_files>:
80406504:	fe010113          	addi	sp,sp,-32
80406508:	00112e23          	sw	ra,28(sp)
8040650c:	00812c23          	sw	s0,24(sp)
80406510:	00912a23          	sw	s1,20(sp)
80406514:	01212823          	sw	s2,16(sp)
80406518:	01312623          	sw	s3,12(sp)
8040651c:	01412423          	sw	s4,8(sp)
80406520:	0a050263          	beqz	a0,804065c4 <dup_files+0xc0>
80406524:	00058413          	mv	s0,a1
80406528:	08058e63          	beqz	a1,804065c4 <dup_files+0xc0>
8040652c:	00852783          	lw	a5,8(a0)
80406530:	00050493          	mv	s1,a0
80406534:	0a079863          	bnez	a5,804065e4 <dup_files+0xe0>
80406538:	0085a783          	lw	a5,8(a1)
8040653c:	0af05463          	blez	a5,804065e4 <dup_files+0xe0>
80406540:	0005a503          	lw	a0,0(a1)
80406544:	00a4a023          	sw	a0,0(s1)
80406548:	00050463          	beqz	a0,80406550 <dup_files+0x4c>
8040654c:	15c070ef          	jal	ra,8040d6a8 <inode_ref_inc>
80406550:	00442403          	lw	s0,4(s0)
80406554:	00001937          	lui	s2,0x1
80406558:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x7024>
8040655c:	0044a483          	lw	s1,4(s1)
80406560:	01240933          	add	s2,s0,s2
80406564:	00200993          	li	s3,2
80406568:	00100a13          	li	s4,1
8040656c:	0100006f          	j	8040657c <dup_files+0x78>
80406570:	01c40413          	addi	s0,s0,28
80406574:	01c48493          	addi	s1,s1,28
80406578:	02890463          	beq	s2,s0,804065a0 <dup_files+0x9c>
8040657c:	00042783          	lw	a5,0(s0)
80406580:	ff3798e3          	bne	a5,s3,80406570 <dup_files+0x6c>
80406584:	0144a023          	sw	s4,0(s1)
80406588:	00040593          	mv	a1,s0
8040658c:	00048513          	mv	a0,s1
80406590:	01c40413          	addi	s0,s0,28
80406594:	9b0ff0ef          	jal	ra,80405744 <fd_array_dup>
80406598:	01c48493          	addi	s1,s1,28
8040659c:	fe8910e3          	bne	s2,s0,8040657c <dup_files+0x78>
804065a0:	01c12083          	lw	ra,28(sp)
804065a4:	01812403          	lw	s0,24(sp)
804065a8:	01412483          	lw	s1,20(sp)
804065ac:	01012903          	lw	s2,16(sp)
804065b0:	00c12983          	lw	s3,12(sp)
804065b4:	00812a03          	lw	s4,8(sp)
804065b8:	00000513          	li	a0,0
804065bc:	02010113          	addi	sp,sp,32
804065c0:	00008067          	ret
804065c4:	0000e697          	auipc	a3,0xe
804065c8:	c5068693          	addi	a3,a3,-944 # 80414214 <default_pmm_manager+0x818>
804065cc:	0000d617          	auipc	a2,0xd
804065d0:	8fc60613          	addi	a2,a2,-1796 # 80412ec8 <commands+0x1bc>
804065d4:	05300593          	li	a1,83
804065d8:	0000e517          	auipc	a0,0xe
804065dc:	18450513          	addi	a0,a0,388 # 8041475c <CSWTCH.69+0x3dc>
804065e0:	844fa0ef          	jal	ra,80400624 <__panic>
804065e4:	0000e697          	auipc	a3,0xe
804065e8:	11c68693          	addi	a3,a3,284 # 80414700 <CSWTCH.69+0x380>
804065ec:	0000d617          	auipc	a2,0xd
804065f0:	8dc60613          	addi	a2,a2,-1828 # 80412ec8 <commands+0x1bc>
804065f4:	05400593          	li	a1,84
804065f8:	0000e517          	auipc	a0,0xe
804065fc:	16450513          	addi	a0,a0,356 # 8041475c <CSWTCH.69+0x3dc>
80406600:	824fa0ef          	jal	ra,80400624 <__panic>

80406604 <iobuf_skip.part.0>:
80406604:	ff010113          	addi	sp,sp,-16
80406608:	0000e697          	auipc	a3,0xe
8040660c:	17c68693          	addi	a3,a3,380 # 80414784 <CSWTCH.69+0x404>
80406610:	0000d617          	auipc	a2,0xd
80406614:	8b860613          	addi	a2,a2,-1864 # 80412ec8 <commands+0x1bc>
80406618:	04a00593          	li	a1,74
8040661c:	0000e517          	auipc	a0,0xe
80406620:	17c50513          	addi	a0,a0,380 # 80414798 <CSWTCH.69+0x418>
80406624:	00112623          	sw	ra,12(sp)
80406628:	ffdf90ef          	jal	ra,80400624 <__panic>

8040662c <iobuf_init>:
8040662c:	00b52023          	sw	a1,0(a0)
80406630:	00d52223          	sw	a3,4(a0)
80406634:	00c52623          	sw	a2,12(a0)
80406638:	00c52423          	sw	a2,8(a0)
8040663c:	00008067          	ret

80406640 <iobuf_move>:
80406640:	fe010113          	addi	sp,sp,-32
80406644:	00812c23          	sw	s0,24(sp)
80406648:	00c52403          	lw	s0,12(a0)
8040664c:	00912a23          	sw	s1,20(sp)
80406650:	01212823          	sw	s2,16(sp)
80406654:	01312623          	sw	s3,12(sp)
80406658:	00112e23          	sw	ra,28(sp)
8040665c:	00050493          	mv	s1,a0
80406660:	00060913          	mv	s2,a2
80406664:	00058513          	mv	a0,a1
80406668:	00070993          	mv	s3,a4
8040666c:	00867463          	bgeu	a2,s0,80406674 <iobuf_move+0x34>
80406670:	00060413          	mv	s0,a2
80406674:	04040063          	beqz	s0,804066b4 <iobuf_move+0x74>
80406678:	0004a583          	lw	a1,0(s1)
8040667c:	06069263          	bnez	a3,804066e0 <iobuf_move+0xa0>
80406680:	00040613          	mv	a2,s0
80406684:	4300c0ef          	jal	ra,80412ab4 <memmove>
80406688:	00c4a783          	lw	a5,12(s1)
8040668c:	0687e663          	bltu	a5,s0,804066f8 <iobuf_move+0xb8>
80406690:	0004a683          	lw	a3,0(s1)
80406694:	0044a703          	lw	a4,4(s1)
80406698:	408787b3          	sub	a5,a5,s0
8040669c:	008686b3          	add	a3,a3,s0
804066a0:	00870733          	add	a4,a4,s0
804066a4:	00d4a023          	sw	a3,0(s1)
804066a8:	00e4a223          	sw	a4,4(s1)
804066ac:	00f4a623          	sw	a5,12(s1)
804066b0:	40890933          	sub	s2,s2,s0
804066b4:	00098463          	beqz	s3,804066bc <iobuf_move+0x7c>
804066b8:	0089a023          	sw	s0,0(s3)
804066bc:	00000513          	li	a0,0
804066c0:	02091863          	bnez	s2,804066f0 <iobuf_move+0xb0>
804066c4:	01c12083          	lw	ra,28(sp)
804066c8:	01812403          	lw	s0,24(sp)
804066cc:	01412483          	lw	s1,20(sp)
804066d0:	01012903          	lw	s2,16(sp)
804066d4:	00c12983          	lw	s3,12(sp)
804066d8:	02010113          	addi	sp,sp,32
804066dc:	00008067          	ret
804066e0:	00058793          	mv	a5,a1
804066e4:	00050593          	mv	a1,a0
804066e8:	00078513          	mv	a0,a5
804066ec:	f95ff06f          	j	80406680 <iobuf_move+0x40>
804066f0:	ffc00513          	li	a0,-4
804066f4:	fd1ff06f          	j	804066c4 <iobuf_move+0x84>
804066f8:	f0dff0ef          	jal	ra,80406604 <iobuf_skip.part.0>

804066fc <iobuf_skip>:
804066fc:	00c52783          	lw	a5,12(a0)
80406700:	02b7e463          	bltu	a5,a1,80406728 <iobuf_skip+0x2c>
80406704:	00052683          	lw	a3,0(a0)
80406708:	00452703          	lw	a4,4(a0)
8040670c:	40b787b3          	sub	a5,a5,a1
80406710:	00b686b3          	add	a3,a3,a1
80406714:	00b705b3          	add	a1,a4,a1
80406718:	00d52023          	sw	a3,0(a0)
8040671c:	00b52223          	sw	a1,4(a0)
80406720:	00f52623          	sw	a5,12(a0)
80406724:	00008067          	ret
80406728:	ff010113          	addi	sp,sp,-16
8040672c:	00112623          	sw	ra,12(sp)
80406730:	ed5ff0ef          	jal	ra,80406604 <iobuf_skip.part.0>

80406734 <copy_path>:
80406734:	fe010113          	addi	sp,sp,-32
80406738:	01212823          	sw	s2,16(sp)
8040673c:	00096917          	auipc	s2,0x96
80406740:	07090913          	addi	s2,s2,112 # 8049c7ac <current>
80406744:	00092783          	lw	a5,0(s2)
80406748:	01412423          	sw	s4,8(sp)
8040674c:	00050a13          	mv	s4,a0
80406750:	00001537          	lui	a0,0x1
80406754:	00912a23          	sw	s1,20(sp)
80406758:	01312623          	sw	s3,12(sp)
8040675c:	00112e23          	sw	ra,28(sp)
80406760:	00812c23          	sw	s0,24(sp)
80406764:	01512223          	sw	s5,4(sp)
80406768:	00058993          	mv	s3,a1
8040676c:	0187a483          	lw	s1,24(a5)
80406770:	a50fc0ef          	jal	ra,804029c0 <kmalloc>
80406774:	0c050463          	beqz	a0,8040683c <copy_path+0x108>
80406778:	00050413          	mv	s0,a0
8040677c:	06048863          	beqz	s1,804067ec <copy_path+0xb8>
80406780:	01c48a93          	addi	s5,s1,28
80406784:	000a8513          	mv	a0,s5
80406788:	a51fe0ef          	jal	ra,804051d8 <down>
8040678c:	00092783          	lw	a5,0(s2)
80406790:	08078263          	beqz	a5,80406814 <copy_path+0xe0>
80406794:	0047a783          	lw	a5,4(a5)
80406798:	000016b7          	lui	a3,0x1
8040679c:	00098613          	mv	a2,s3
804067a0:	02f4a423          	sw	a5,40(s1)
804067a4:	00040593          	mv	a1,s0
804067a8:	00048513          	mv	a0,s1
804067ac:	f3cfe0ef          	jal	ra,80404ee8 <copy_string>
804067b0:	06050e63          	beqz	a0,8040682c <copy_path+0xf8>
804067b4:	000a8513          	mv	a0,s5
804067b8:	a1dfe0ef          	jal	ra,804051d4 <up>
804067bc:	0204a423          	sw	zero,40(s1)
804067c0:	008a2023          	sw	s0,0(s4)
804067c4:	00000513          	li	a0,0
804067c8:	01c12083          	lw	ra,28(sp)
804067cc:	01812403          	lw	s0,24(sp)
804067d0:	01412483          	lw	s1,20(sp)
804067d4:	01012903          	lw	s2,16(sp)
804067d8:	00c12983          	lw	s3,12(sp)
804067dc:	00812a03          	lw	s4,8(sp)
804067e0:	00412a83          	lw	s5,4(sp)
804067e4:	02010113          	addi	sp,sp,32
804067e8:	00008067          	ret
804067ec:	00050593          	mv	a1,a0
804067f0:	000016b7          	lui	a3,0x1
804067f4:	00098613          	mv	a2,s3
804067f8:	00000513          	li	a0,0
804067fc:	eecfe0ef          	jal	ra,80404ee8 <copy_string>
80406800:	fc0510e3          	bnez	a0,804067c0 <copy_path+0x8c>
80406804:	00040513          	mv	a0,s0
80406808:	adcfc0ef          	jal	ra,80402ae4 <kfree>
8040680c:	ffd00513          	li	a0,-3
80406810:	fb9ff06f          	j	804067c8 <copy_path+0x94>
80406814:	000016b7          	lui	a3,0x1
80406818:	00098613          	mv	a2,s3
8040681c:	00040593          	mv	a1,s0
80406820:	00048513          	mv	a0,s1
80406824:	ec4fe0ef          	jal	ra,80404ee8 <copy_string>
80406828:	f80516e3          	bnez	a0,804067b4 <copy_path+0x80>
8040682c:	000a8513          	mv	a0,s5
80406830:	9a5fe0ef          	jal	ra,804051d4 <up>
80406834:	0204a423          	sw	zero,40(s1)
80406838:	fcdff06f          	j	80406804 <copy_path+0xd0>
8040683c:	ffc00513          	li	a0,-4
80406840:	f89ff06f          	j	804067c8 <copy_path+0x94>

80406844 <sysfile_open>:
80406844:	fe010113          	addi	sp,sp,-32
80406848:	00912a23          	sw	s1,20(sp)
8040684c:	00058493          	mv	s1,a1
80406850:	00050593          	mv	a1,a0
80406854:	00c10513          	addi	a0,sp,12
80406858:	00812c23          	sw	s0,24(sp)
8040685c:	00112e23          	sw	ra,28(sp)
80406860:	ed5ff0ef          	jal	ra,80406734 <copy_path>
80406864:	00050413          	mv	s0,a0
80406868:	00051e63          	bnez	a0,80406884 <sysfile_open+0x40>
8040686c:	00c12503          	lw	a0,12(sp)
80406870:	00048593          	mv	a1,s1
80406874:	810ff0ef          	jal	ra,80405884 <file_open>
80406878:	00050413          	mv	s0,a0
8040687c:	00c12503          	lw	a0,12(sp)
80406880:	a64fc0ef          	jal	ra,80402ae4 <kfree>
80406884:	00040513          	mv	a0,s0
80406888:	01c12083          	lw	ra,28(sp)
8040688c:	01812403          	lw	s0,24(sp)
80406890:	01412483          	lw	s1,20(sp)
80406894:	02010113          	addi	sp,sp,32
80406898:	00008067          	ret

8040689c <sysfile_close>:
8040689c:	96cff06f          	j	80405a08 <file_close>

804068a0 <sysfile_read>:
804068a0:	fc010113          	addi	sp,sp,-64
804068a4:	02912a23          	sw	s1,52(sp)
804068a8:	02112e23          	sw	ra,60(sp)
804068ac:	02812c23          	sw	s0,56(sp)
804068b0:	03212823          	sw	s2,48(sp)
804068b4:	03312623          	sw	s3,44(sp)
804068b8:	03412423          	sw	s4,40(sp)
804068bc:	03512223          	sw	s5,36(sp)
804068c0:	03612023          	sw	s6,32(sp)
804068c4:	01712e23          	sw	s7,28(sp)
804068c8:	01812c23          	sw	s8,24(sp)
804068cc:	01912a23          	sw	s9,20(sp)
804068d0:	00000493          	li	s1,0
804068d4:	02061e63          	bnez	a2,80406910 <sysfile_read+0x70>
804068d8:	03c12083          	lw	ra,60(sp)
804068dc:	03812403          	lw	s0,56(sp)
804068e0:	00048513          	mv	a0,s1
804068e4:	03012903          	lw	s2,48(sp)
804068e8:	03412483          	lw	s1,52(sp)
804068ec:	02c12983          	lw	s3,44(sp)
804068f0:	02812a03          	lw	s4,40(sp)
804068f4:	02412a83          	lw	s5,36(sp)
804068f8:	02012b03          	lw	s6,32(sp)
804068fc:	01c12b83          	lw	s7,28(sp)
80406900:	01812c03          	lw	s8,24(sp)
80406904:	01412c83          	lw	s9,20(sp)
80406908:	04010113          	addi	sp,sp,64
8040690c:	00008067          	ret
80406910:	00096c97          	auipc	s9,0x96
80406914:	e9cc8c93          	addi	s9,s9,-356 # 8049c7ac <current>
80406918:	000ca783          	lw	a5,0(s9)
8040691c:	00060413          	mv	s0,a2
80406920:	00058b13          	mv	s6,a1
80406924:	00000613          	li	a2,0
80406928:	00100593          	li	a1,1
8040692c:	00050a93          	mv	s5,a0
80406930:	0187a903          	lw	s2,24(a5)
80406934:	ed1fe0ef          	jal	ra,80405804 <file_testfd>
80406938:	10050063          	beqz	a0,80406a38 <sysfile_read+0x198>
8040693c:	00001537          	lui	a0,0x1
80406940:	880fc0ef          	jal	ra,804029c0 <kmalloc>
80406944:	00050993          	mv	s3,a0
80406948:	0e050c63          	beqz	a0,80406a40 <sysfile_read+0x1a0>
8040694c:	00000b93          	li	s7,0
80406950:	00001a37          	lui	s4,0x1
80406954:	01c90c13          	addi	s8,s2,28
80406958:	0d446663          	bltu	s0,s4,80406a24 <sysfile_read+0x184>
8040695c:	01412623          	sw	s4,12(sp)
80406960:	00001637          	lui	a2,0x1
80406964:	00c10693          	addi	a3,sp,12
80406968:	00098593          	mv	a1,s3
8040696c:	000a8513          	mv	a0,s5
80406970:	920ff0ef          	jal	ra,80405a90 <file_read>
80406974:	00c12683          	lw	a3,12(sp)
80406978:	00050493          	mv	s1,a0
8040697c:	08068863          	beqz	a3,80406a0c <sysfile_read+0x16c>
80406980:	02090063          	beqz	s2,804069a0 <sysfile_read+0x100>
80406984:	000c0513          	mv	a0,s8
80406988:	851fe0ef          	jal	ra,804051d8 <down>
8040698c:	000ca783          	lw	a5,0(s9)
80406990:	0a078063          	beqz	a5,80406a30 <sysfile_read+0x190>
80406994:	0047a783          	lw	a5,4(a5)
80406998:	00c12683          	lw	a3,12(sp)
8040699c:	02f92423          	sw	a5,40(s2)
804069a0:	00098613          	mv	a2,s3
804069a4:	000b0593          	mv	a1,s6
804069a8:	00090513          	mv	a0,s2
804069ac:	ce0fe0ef          	jal	ra,80404e8c <copy_to_user>
804069b0:	04050063          	beqz	a0,804069f0 <sysfile_read+0x150>
804069b4:	00c12783          	lw	a5,12(sp)
804069b8:	08f46863          	bltu	s0,a5,80406a48 <sysfile_read+0x1a8>
804069bc:	00fb0b33          	add	s6,s6,a5
804069c0:	40f40433          	sub	s0,s0,a5
804069c4:	00fb8bb3          	add	s7,s7,a5
804069c8:	02091a63          	bnez	s2,804069fc <sysfile_read+0x15c>
804069cc:	00049863          	bnez	s1,804069dc <sysfile_read+0x13c>
804069d0:	00c12783          	lw	a5,12(sp)
804069d4:	02078e63          	beqz	a5,80406a10 <sysfile_read+0x170>
804069d8:	f80410e3          	bnez	s0,80406958 <sysfile_read+0xb8>
804069dc:	00098513          	mv	a0,s3
804069e0:	904fc0ef          	jal	ra,80402ae4 <kfree>
804069e4:	ee0b8ae3          	beqz	s7,804068d8 <sysfile_read+0x38>
804069e8:	000b8493          	mv	s1,s7
804069ec:	eedff06f          	j	804068d8 <sysfile_read+0x38>
804069f0:	00049463          	bnez	s1,804069f8 <sysfile_read+0x158>
804069f4:	ffd00493          	li	s1,-3
804069f8:	fe0902e3          	beqz	s2,804069dc <sysfile_read+0x13c>
804069fc:	000c0513          	mv	a0,s8
80406a00:	fd4fe0ef          	jal	ra,804051d4 <up>
80406a04:	02092423          	sw	zero,40(s2)
80406a08:	fc5ff06f          	j	804069cc <sysfile_read+0x12c>
80406a0c:	fc0518e3          	bnez	a0,804069dc <sysfile_read+0x13c>
80406a10:	00098513          	mv	a0,s3
80406a14:	00000493          	li	s1,0
80406a18:	8ccfc0ef          	jal	ra,80402ae4 <kfree>
80406a1c:	ea0b8ee3          	beqz	s7,804068d8 <sysfile_read+0x38>
80406a20:	fc9ff06f          	j	804069e8 <sysfile_read+0x148>
80406a24:	00812623          	sw	s0,12(sp)
80406a28:	00040613          	mv	a2,s0
80406a2c:	f39ff06f          	j	80406964 <sysfile_read+0xc4>
80406a30:	00c12683          	lw	a3,12(sp)
80406a34:	f6dff06f          	j	804069a0 <sysfile_read+0x100>
80406a38:	ffd00493          	li	s1,-3
80406a3c:	e9dff06f          	j	804068d8 <sysfile_read+0x38>
80406a40:	ffc00493          	li	s1,-4
80406a44:	e95ff06f          	j	804068d8 <sysfile_read+0x38>
80406a48:	0000e697          	auipc	a3,0xe
80406a4c:	d6068693          	addi	a3,a3,-672 # 804147a8 <CSWTCH.69+0x428>
80406a50:	0000c617          	auipc	a2,0xc
80406a54:	47860613          	addi	a2,a2,1144 # 80412ec8 <commands+0x1bc>
80406a58:	05500593          	li	a1,85
80406a5c:	0000e517          	auipc	a0,0xe
80406a60:	d5850513          	addi	a0,a0,-680 # 804147b4 <CSWTCH.69+0x434>
80406a64:	bc1f90ef          	jal	ra,80400624 <__panic>

80406a68 <sysfile_write>:
80406a68:	fc010113          	addi	sp,sp,-64
80406a6c:	03512223          	sw	s5,36(sp)
80406a70:	02112e23          	sw	ra,60(sp)
80406a74:	02812c23          	sw	s0,56(sp)
80406a78:	02912a23          	sw	s1,52(sp)
80406a7c:	03212823          	sw	s2,48(sp)
80406a80:	03312623          	sw	s3,44(sp)
80406a84:	03412423          	sw	s4,40(sp)
80406a88:	03612023          	sw	s6,32(sp)
80406a8c:	01712e23          	sw	s7,28(sp)
80406a90:	01812c23          	sw	s8,24(sp)
80406a94:	01912a23          	sw	s9,20(sp)
80406a98:	00000a93          	li	s5,0
80406a9c:	02061e63          	bnez	a2,80406ad8 <sysfile_write+0x70>
80406aa0:	03c12083          	lw	ra,60(sp)
80406aa4:	03812403          	lw	s0,56(sp)
80406aa8:	000a8513          	mv	a0,s5
80406aac:	03412483          	lw	s1,52(sp)
80406ab0:	03012903          	lw	s2,48(sp)
80406ab4:	02c12983          	lw	s3,44(sp)
80406ab8:	02812a03          	lw	s4,40(sp)
80406abc:	02412a83          	lw	s5,36(sp)
80406ac0:	02012b03          	lw	s6,32(sp)
80406ac4:	01c12b83          	lw	s7,28(sp)
80406ac8:	01812c03          	lw	s8,24(sp)
80406acc:	01412c83          	lw	s9,20(sp)
80406ad0:	04010113          	addi	sp,sp,64
80406ad4:	00008067          	ret
80406ad8:	00096b97          	auipc	s7,0x96
80406adc:	cd4b8b93          	addi	s7,s7,-812 # 8049c7ac <current>
80406ae0:	000ba783          	lw	a5,0(s7)
80406ae4:	00060413          	mv	s0,a2
80406ae8:	00058a13          	mv	s4,a1
80406aec:	00100613          	li	a2,1
80406af0:	00000593          	li	a1,0
80406af4:	00050c93          	mv	s9,a0
80406af8:	0187a483          	lw	s1,24(a5)
80406afc:	d09fe0ef          	jal	ra,80405804 <file_testfd>
80406b00:	0e050e63          	beqz	a0,80406bfc <sysfile_write+0x194>
80406b04:	00001537          	lui	a0,0x1
80406b08:	eb9fb0ef          	jal	ra,804029c0 <kmalloc>
80406b0c:	00050993          	mv	s3,a0
80406b10:	0e050a63          	beqz	a0,80406c04 <sysfile_write+0x19c>
80406b14:	00000c13          	li	s8,0
80406b18:	00001937          	lui	s2,0x1
80406b1c:	01c48b13          	addi	s6,s1,28
80406b20:	09246063          	bltu	s0,s2,80406ba0 <sysfile_write+0x138>
80406b24:	01212623          	sw	s2,12(sp)
80406b28:	08048063          	beqz	s1,80406ba8 <sysfile_write+0x140>
80406b2c:	000b0513          	mv	a0,s6
80406b30:	ea8fe0ef          	jal	ra,804051d8 <down>
80406b34:	000ba783          	lw	a5,0(s7)
80406b38:	00078663          	beqz	a5,80406b44 <sysfile_write+0xdc>
80406b3c:	0047a783          	lw	a5,4(a5)
80406b40:	02f4a423          	sw	a5,40(s1)
80406b44:	00c12683          	lw	a3,12(sp)
80406b48:	00000713          	li	a4,0
80406b4c:	000a0613          	mv	a2,s4
80406b50:	00098593          	mv	a1,s3
80406b54:	00048513          	mv	a0,s1
80406b58:	ad4fe0ef          	jal	ra,80404e2c <copy_from_user>
80406b5c:	06050863          	beqz	a0,80406bcc <sysfile_write+0x164>
80406b60:	000b0513          	mv	a0,s6
80406b64:	e70fe0ef          	jal	ra,804051d4 <up>
80406b68:	0204a423          	sw	zero,40(s1)
80406b6c:	00c12603          	lw	a2,12(sp)
80406b70:	00c10693          	addi	a3,sp,12
80406b74:	00098593          	mv	a1,s3
80406b78:	000c8513          	mv	a0,s9
80406b7c:	868ff0ef          	jal	ra,80405be4 <file_write>
80406b80:	00c12783          	lw	a5,12(sp)
80406b84:	00050a93          	mv	s5,a0
80406b88:	04079c63          	bnez	a5,80406be0 <sysfile_write+0x178>
80406b8c:	00098513          	mv	a0,s3
80406b90:	f55fb0ef          	jal	ra,80402ae4 <kfree>
80406b94:	f00c06e3          	beqz	s8,80406aa0 <sysfile_write+0x38>
80406b98:	000c0a93          	mv	s5,s8
80406b9c:	f05ff06f          	j	80406aa0 <sysfile_write+0x38>
80406ba0:	00812623          	sw	s0,12(sp)
80406ba4:	f80494e3          	bnez	s1,80406b2c <sysfile_write+0xc4>
80406ba8:	00c12683          	lw	a3,12(sp)
80406bac:	00000713          	li	a4,0
80406bb0:	000a0613          	mv	a2,s4
80406bb4:	00098593          	mv	a1,s3
80406bb8:	00000513          	li	a0,0
80406bbc:	a70fe0ef          	jal	ra,80404e2c <copy_from_user>
80406bc0:	fa0516e3          	bnez	a0,80406b6c <sysfile_write+0x104>
80406bc4:	ffd00a93          	li	s5,-3
80406bc8:	fc5ff06f          	j	80406b8c <sysfile_write+0x124>
80406bcc:	000b0513          	mv	a0,s6
80406bd0:	e04fe0ef          	jal	ra,804051d4 <up>
80406bd4:	ffd00a93          	li	s5,-3
80406bd8:	0204a423          	sw	zero,40(s1)
80406bdc:	fb1ff06f          	j	80406b8c <sysfile_write+0x124>
80406be0:	02f46663          	bltu	s0,a5,80406c0c <sysfile_write+0x1a4>
80406be4:	00fa0a33          	add	s4,s4,a5
80406be8:	40f40433          	sub	s0,s0,a5
80406bec:	00fc0c33          	add	s8,s8,a5
80406bf0:	f8051ee3          	bnez	a0,80406b8c <sysfile_write+0x124>
80406bf4:	f20416e3          	bnez	s0,80406b20 <sysfile_write+0xb8>
80406bf8:	f95ff06f          	j	80406b8c <sysfile_write+0x124>
80406bfc:	ffd00a93          	li	s5,-3
80406c00:	ea1ff06f          	j	80406aa0 <sysfile_write+0x38>
80406c04:	ffc00a93          	li	s5,-4
80406c08:	e99ff06f          	j	80406aa0 <sysfile_write+0x38>
80406c0c:	0000e697          	auipc	a3,0xe
80406c10:	b9c68693          	addi	a3,a3,-1124 # 804147a8 <CSWTCH.69+0x428>
80406c14:	0000c617          	auipc	a2,0xc
80406c18:	2b460613          	addi	a2,a2,692 # 80412ec8 <commands+0x1bc>
80406c1c:	08a00593          	li	a1,138
80406c20:	0000e517          	auipc	a0,0xe
80406c24:	b9450513          	addi	a0,a0,-1132 # 804147b4 <CSWTCH.69+0x434>
80406c28:	9fdf90ef          	jal	ra,80400624 <__panic>

80406c2c <sysfile_seek>:
80406c2c:	90cff06f          	j	80405d38 <file_seek>

80406c30 <sysfile_fstat>:
80406c30:	fd010113          	addi	sp,sp,-48
80406c34:	03212023          	sw	s2,32(sp)
80406c38:	00096917          	auipc	s2,0x96
80406c3c:	b7490913          	addi	s2,s2,-1164 # 8049c7ac <current>
80406c40:	00092783          	lw	a5,0(s2)
80406c44:	01312e23          	sw	s3,28(sp)
80406c48:	00058993          	mv	s3,a1
80406c4c:	00010593          	mv	a1,sp
80406c50:	02812423          	sw	s0,40(sp)
80406c54:	02912223          	sw	s1,36(sp)
80406c58:	02112623          	sw	ra,44(sp)
80406c5c:	01412c23          	sw	s4,24(sp)
80406c60:	0187a483          	lw	s1,24(a5)
80406c64:	a84ff0ef          	jal	ra,80405ee8 <file_fstat>
80406c68:	00050413          	mv	s0,a0
80406c6c:	04051463          	bnez	a0,80406cb4 <sysfile_fstat+0x84>
80406c70:	06048463          	beqz	s1,80406cd8 <sysfile_fstat+0xa8>
80406c74:	01c48a13          	addi	s4,s1,28
80406c78:	000a0513          	mv	a0,s4
80406c7c:	d5cfe0ef          	jal	ra,804051d8 <down>
80406c80:	00092783          	lw	a5,0(s2)
80406c84:	06078863          	beqz	a5,80406cf4 <sysfile_fstat+0xc4>
80406c88:	0047a783          	lw	a5,4(a5)
80406c8c:	01000693          	li	a3,16
80406c90:	00010613          	mv	a2,sp
80406c94:	02f4a423          	sw	a5,40(s1)
80406c98:	00098593          	mv	a1,s3
80406c9c:	00048513          	mv	a0,s1
80406ca0:	9ecfe0ef          	jal	ra,80404e8c <copy_to_user>
80406ca4:	06050463          	beqz	a0,80406d0c <sysfile_fstat+0xdc>
80406ca8:	000a0513          	mv	a0,s4
80406cac:	d28fe0ef          	jal	ra,804051d4 <up>
80406cb0:	0204a423          	sw	zero,40(s1)
80406cb4:	00040513          	mv	a0,s0
80406cb8:	02c12083          	lw	ra,44(sp)
80406cbc:	02812403          	lw	s0,40(sp)
80406cc0:	02412483          	lw	s1,36(sp)
80406cc4:	02012903          	lw	s2,32(sp)
80406cc8:	01c12983          	lw	s3,28(sp)
80406ccc:	01812a03          	lw	s4,24(sp)
80406cd0:	03010113          	addi	sp,sp,48
80406cd4:	00008067          	ret
80406cd8:	01000693          	li	a3,16
80406cdc:	00010613          	mv	a2,sp
80406ce0:	00098593          	mv	a1,s3
80406ce4:	9a8fe0ef          	jal	ra,80404e8c <copy_to_user>
80406ce8:	fc0516e3          	bnez	a0,80406cb4 <sysfile_fstat+0x84>
80406cec:	ffd00413          	li	s0,-3
80406cf0:	fc5ff06f          	j	80406cb4 <sysfile_fstat+0x84>
80406cf4:	01000693          	li	a3,16
80406cf8:	00010613          	mv	a2,sp
80406cfc:	00098593          	mv	a1,s3
80406d00:	00048513          	mv	a0,s1
80406d04:	988fe0ef          	jal	ra,80404e8c <copy_to_user>
80406d08:	fa0510e3          	bnez	a0,80406ca8 <sysfile_fstat+0x78>
80406d0c:	000a0513          	mv	a0,s4
80406d10:	cc4fe0ef          	jal	ra,804051d4 <up>
80406d14:	ffd00413          	li	s0,-3
80406d18:	0204a423          	sw	zero,40(s1)
80406d1c:	f99ff06f          	j	80406cb4 <sysfile_fstat+0x84>

80406d20 <sysfile_fsync>:
80406d20:	ae0ff06f          	j	80406000 <file_fsync>

80406d24 <sysfile_getcwd>:
80406d24:	fd010113          	addi	sp,sp,-48
80406d28:	01312e23          	sw	s3,28(sp)
80406d2c:	00096997          	auipc	s3,0x96
80406d30:	a8098993          	addi	s3,s3,-1408 # 8049c7ac <current>
80406d34:	0009a783          	lw	a5,0(s3)
80406d38:	03212023          	sw	s2,32(sp)
80406d3c:	02112623          	sw	ra,44(sp)
80406d40:	02812423          	sw	s0,40(sp)
80406d44:	02912223          	sw	s1,36(sp)
80406d48:	01412c23          	sw	s4,24(sp)
80406d4c:	0187a903          	lw	s2,24(a5)
80406d50:	08058863          	beqz	a1,80406de0 <sysfile_getcwd+0xbc>
80406d54:	00050493          	mv	s1,a0
80406d58:	00058413          	mv	s0,a1
80406d5c:	06090663          	beqz	s2,80406dc8 <sysfile_getcwd+0xa4>
80406d60:	01c90a13          	addi	s4,s2,28
80406d64:	000a0513          	mv	a0,s4
80406d68:	c70fe0ef          	jal	ra,804051d8 <down>
80406d6c:	0009a783          	lw	a5,0(s3)
80406d70:	00078663          	beqz	a5,80406d7c <sysfile_getcwd+0x58>
80406d74:	0047a783          	lw	a5,4(a5)
80406d78:	02f92423          	sw	a5,40(s2)
80406d7c:	00100693          	li	a3,1
80406d80:	00040613          	mv	a2,s0
80406d84:	00048593          	mv	a1,s1
80406d88:	00090513          	mv	a0,s2
80406d8c:	fc9fd0ef          	jal	ra,80404d54 <user_mem_check>
80406d90:	04051c63          	bnez	a0,80406de8 <sysfile_getcwd+0xc4>
80406d94:	ffd00413          	li	s0,-3
80406d98:	000a0513          	mv	a0,s4
80406d9c:	c38fe0ef          	jal	ra,804051d4 <up>
80406da0:	02092423          	sw	zero,40(s2)
80406da4:	00040513          	mv	a0,s0
80406da8:	02c12083          	lw	ra,44(sp)
80406dac:	02812403          	lw	s0,40(sp)
80406db0:	02412483          	lw	s1,36(sp)
80406db4:	02012903          	lw	s2,32(sp)
80406db8:	01c12983          	lw	s3,28(sp)
80406dbc:	01812a03          	lw	s4,24(sp)
80406dc0:	03010113          	addi	sp,sp,48
80406dc4:	00008067          	ret
80406dc8:	00058613          	mv	a2,a1
80406dcc:	00100693          	li	a3,1
80406dd0:	00050593          	mv	a1,a0
80406dd4:	00000513          	li	a0,0
80406dd8:	f7dfd0ef          	jal	ra,80404d54 <user_mem_check>
80406ddc:	02051663          	bnez	a0,80406e08 <sysfile_getcwd+0xe4>
80406de0:	ffd00413          	li	s0,-3
80406de4:	fc1ff06f          	j	80406da4 <sysfile_getcwd+0x80>
80406de8:	00040613          	mv	a2,s0
80406dec:	00000693          	li	a3,0
80406df0:	00048593          	mv	a1,s1
80406df4:	00010513          	mv	a0,sp
80406df8:	835ff0ef          	jal	ra,8040662c <iobuf_init>
80406dfc:	149070ef          	jal	ra,8040e744 <vfs_getcwd>
80406e00:	00050413          	mv	s0,a0
80406e04:	f95ff06f          	j	80406d98 <sysfile_getcwd+0x74>
80406e08:	00040613          	mv	a2,s0
80406e0c:	00000693          	li	a3,0
80406e10:	00048593          	mv	a1,s1
80406e14:	00010513          	mv	a0,sp
80406e18:	815ff0ef          	jal	ra,8040662c <iobuf_init>
80406e1c:	129070ef          	jal	ra,8040e744 <vfs_getcwd>
80406e20:	00050413          	mv	s0,a0
80406e24:	f81ff06f          	j	80406da4 <sysfile_getcwd+0x80>

80406e28 <sysfile_getdirentry>:
80406e28:	fe010113          	addi	sp,sp,-32
80406e2c:	01212823          	sw	s2,16(sp)
80406e30:	00096917          	auipc	s2,0x96
80406e34:	97c90913          	addi	s2,s2,-1668 # 8049c7ac <current>
80406e38:	00092783          	lw	a5,0(s2)
80406e3c:	01312623          	sw	s3,12(sp)
80406e40:	00050993          	mv	s3,a0
80406e44:	10400513          	li	a0,260
80406e48:	00912a23          	sw	s1,20(sp)
80406e4c:	01412423          	sw	s4,8(sp)
80406e50:	00112e23          	sw	ra,28(sp)
80406e54:	00812c23          	sw	s0,24(sp)
80406e58:	01512223          	sw	s5,4(sp)
80406e5c:	00058a13          	mv	s4,a1
80406e60:	0187a483          	lw	s1,24(a5)
80406e64:	b5dfb0ef          	jal	ra,804029c0 <kmalloc>
80406e68:	12050a63          	beqz	a0,80406f9c <sysfile_getdirentry+0x174>
80406e6c:	00050413          	mv	s0,a0
80406e70:	0e048063          	beqz	s1,80406f50 <sysfile_getdirentry+0x128>
80406e74:	01c48a93          	addi	s5,s1,28
80406e78:	000a8513          	mv	a0,s5
80406e7c:	b5cfe0ef          	jal	ra,804051d8 <down>
80406e80:	00092783          	lw	a5,0(s2)
80406e84:	00078663          	beqz	a5,80406e90 <sysfile_getdirentry+0x68>
80406e88:	0047a783          	lw	a5,4(a5)
80406e8c:	02f4a423          	sw	a5,40(s1)
80406e90:	00100713          	li	a4,1
80406e94:	00400693          	li	a3,4
80406e98:	000a0613          	mv	a2,s4
80406e9c:	00040593          	mv	a1,s0
80406ea0:	00048513          	mv	a0,s1
80406ea4:	f89fd0ef          	jal	ra,80404e2c <copy_from_user>
80406ea8:	04051263          	bnez	a0,80406eec <sysfile_getdirentry+0xc4>
80406eac:	000a8513          	mv	a0,s5
80406eb0:	b24fe0ef          	jal	ra,804051d4 <up>
80406eb4:	ffd00993          	li	s3,-3
80406eb8:	0204a423          	sw	zero,40(s1)
80406ebc:	00040513          	mv	a0,s0
80406ec0:	c25fb0ef          	jal	ra,80402ae4 <kfree>
80406ec4:	01c12083          	lw	ra,28(sp)
80406ec8:	01812403          	lw	s0,24(sp)
80406ecc:	00098513          	mv	a0,s3
80406ed0:	01412483          	lw	s1,20(sp)
80406ed4:	01012903          	lw	s2,16(sp)
80406ed8:	00c12983          	lw	s3,12(sp)
80406edc:	00812a03          	lw	s4,8(sp)
80406ee0:	00412a83          	lw	s5,4(sp)
80406ee4:	02010113          	addi	sp,sp,32
80406ee8:	00008067          	ret
80406eec:	000a8513          	mv	a0,s5
80406ef0:	ae4fe0ef          	jal	ra,804051d4 <up>
80406ef4:	00098513          	mv	a0,s3
80406ef8:	00040593          	mv	a1,s0
80406efc:	0204a423          	sw	zero,40(s1)
80406f00:	a04ff0ef          	jal	ra,80406104 <file_getdirentry>
80406f04:	00050993          	mv	s3,a0
80406f08:	fa051ae3          	bnez	a0,80406ebc <sysfile_getdirentry+0x94>
80406f0c:	000a8513          	mv	a0,s5
80406f10:	ac8fe0ef          	jal	ra,804051d8 <down>
80406f14:	00092783          	lw	a5,0(s2)
80406f18:	00078663          	beqz	a5,80406f24 <sysfile_getdirentry+0xfc>
80406f1c:	0047a783          	lw	a5,4(a5)
80406f20:	02f4a423          	sw	a5,40(s1)
80406f24:	10400693          	li	a3,260
80406f28:	00040613          	mv	a2,s0
80406f2c:	000a0593          	mv	a1,s4
80406f30:	00048513          	mv	a0,s1
80406f34:	f59fd0ef          	jal	ra,80404e8c <copy_to_user>
80406f38:	00051463          	bnez	a0,80406f40 <sysfile_getdirentry+0x118>
80406f3c:	ffd00993          	li	s3,-3
80406f40:	000a8513          	mv	a0,s5
80406f44:	a90fe0ef          	jal	ra,804051d4 <up>
80406f48:	0204a423          	sw	zero,40(s1)
80406f4c:	f71ff06f          	j	80406ebc <sysfile_getdirentry+0x94>
80406f50:	00050593          	mv	a1,a0
80406f54:	00100713          	li	a4,1
80406f58:	00400693          	li	a3,4
80406f5c:	000a0613          	mv	a2,s4
80406f60:	00000513          	li	a0,0
80406f64:	ec9fd0ef          	jal	ra,80404e2c <copy_from_user>
80406f68:	02050663          	beqz	a0,80406f94 <sysfile_getdirentry+0x16c>
80406f6c:	00098513          	mv	a0,s3
80406f70:	00040593          	mv	a1,s0
80406f74:	990ff0ef          	jal	ra,80406104 <file_getdirentry>
80406f78:	00050993          	mv	s3,a0
80406f7c:	f40510e3          	bnez	a0,80406ebc <sysfile_getdirentry+0x94>
80406f80:	10400693          	li	a3,260
80406f84:	00040613          	mv	a2,s0
80406f88:	000a0593          	mv	a1,s4
80406f8c:	f01fd0ef          	jal	ra,80404e8c <copy_to_user>
80406f90:	f20516e3          	bnez	a0,80406ebc <sysfile_getdirentry+0x94>
80406f94:	ffd00993          	li	s3,-3
80406f98:	f25ff06f          	j	80406ebc <sysfile_getdirentry+0x94>
80406f9c:	ffc00993          	li	s3,-4
80406fa0:	f25ff06f          	j	80406ec4 <sysfile_getdirentry+0x9c>

80406fa4 <sysfile_dup>:
80406fa4:	abcff06f          	j	80406260 <file_dup>

80406fa8 <kernel_thread_entry>:
80406fa8:	00048513          	mv	a0,s1
80406fac:	000400e7          	jalr	s0
80406fb0:	4cd000ef          	jal	ra,80407c7c <do_exit>

80406fb4 <alloc_proc>:
80406fb4:	ff010113          	addi	sp,sp,-16
80406fb8:	0e000513          	li	a0,224
80406fbc:	00812423          	sw	s0,8(sp)
80406fc0:	00112623          	sw	ra,12(sp)
80406fc4:	9fdfb0ef          	jal	ra,804029c0 <kmalloc>
80406fc8:	00050413          	mv	s0,a0
80406fcc:	08050c63          	beqz	a0,80407064 <alloc_proc+0xb0>
80406fd0:	fff00793          	li	a5,-1
80406fd4:	00f52223          	sw	a5,4(a0)
80406fd8:	03800613          	li	a2,56
80406fdc:	00000593          	li	a1,0
80406fe0:	00052023          	sw	zero,0(a0)
80406fe4:	00052423          	sw	zero,8(a0)
80406fe8:	00052623          	sw	zero,12(a0)
80406fec:	00052823          	sw	zero,16(a0)
80406ff0:	00052a23          	sw	zero,20(a0)
80406ff4:	00052c23          	sw	zero,24(a0)
80406ff8:	01c50513          	addi	a0,a0,28
80406ffc:	29d0b0ef          	jal	ra,80412a98 <memset>
80407000:	00096797          	auipc	a5,0x96
80407004:	80478793          	addi	a5,a5,-2044 # 8049c804 <boot_cr3>
80407008:	0007a783          	lw	a5,0(a5)
8040700c:	04042a23          	sw	zero,84(s0)
80407010:	04042e23          	sw	zero,92(s0)
80407014:	04f42c23          	sw	a5,88(s0)
80407018:	03200613          	li	a2,50
8040701c:	00000593          	li	a1,0
80407020:	06040513          	addi	a0,s0,96
80407024:	2750b0ef          	jal	ra,80412a98 <memset>
80407028:	0bc40793          	addi	a5,s0,188
8040702c:	0a042423          	sw	zero,168(s0)
80407030:	0a042823          	sw	zero,176(s0)
80407034:	0a042a23          	sw	zero,180(s0)
80407038:	0a042623          	sw	zero,172(s0)
8040703c:	0a042c23          	sw	zero,184(s0)
80407040:	0cf42023          	sw	a5,192(s0)
80407044:	0af42e23          	sw	a5,188(s0)
80407048:	0c042223          	sw	zero,196(s0)
8040704c:	0c042423          	sw	zero,200(s0)
80407050:	0c042823          	sw	zero,208(s0)
80407054:	0c042623          	sw	zero,204(s0)
80407058:	0c042a23          	sw	zero,212(s0)
8040705c:	0c042c23          	sw	zero,216(s0)
80407060:	0c042e23          	sw	zero,220(s0)
80407064:	00040513          	mv	a0,s0
80407068:	00c12083          	lw	ra,12(sp)
8040706c:	00812403          	lw	s0,8(sp)
80407070:	01010113          	addi	sp,sp,16
80407074:	00008067          	ret

80407078 <put_files>:
80407078:	0dc52503          	lw	a0,220(a0)
8040707c:	00050a63          	beqz	a0,80407090 <put_files+0x18>
80407080:	00852783          	lw	a5,8(a0)
80407084:	fff78793          	addi	a5,a5,-1
80407088:	00f52423          	sw	a5,8(a0)
8040708c:	00078463          	beqz	a5,80407094 <put_files+0x1c>
80407090:	00008067          	ret
80407094:	b10ff06f          	j	804063a4 <files_destroy>

80407098 <forkret>:
80407098:	ff010113          	addi	sp,sp,-16
8040709c:	00812423          	sw	s0,8(sp)
804070a0:	00095417          	auipc	s0,0x95
804070a4:	70c40413          	addi	s0,s0,1804 # 8049c7ac <current>
804070a8:	00042783          	lw	a5,0(s0)
804070ac:	00112623          	sw	ra,12(sp)
804070b0:	00912223          	sw	s1,4(sp)
804070b4:	0187a703          	lw	a4,24(a5)
804070b8:	01212023          	sw	s2,0(sp)
804070bc:	0c070c63          	beqz	a4,80407194 <forkret+0xfc>
804070c0:	00c72503          	lw	a0,12(a4)
804070c4:	00000613          	li	a2,0
804070c8:	008005b7          	lui	a1,0x800
804070cc:	e09fb0ef          	jal	ra,80402ed4 <get_pte>
804070d0:	00042783          	lw	a5,0(s0)
804070d4:	00050913          	mv	s2,a0
804070d8:	00000613          	li	a2,0
804070dc:	0187a783          	lw	a5,24(a5)
804070e0:	008015b7          	lui	a1,0x801
804070e4:	00c7a503          	lw	a0,12(a5)
804070e8:	dedfb0ef          	jal	ra,80402ed4 <get_pte>
804070ec:	00050493          	mv	s1,a0
804070f0:	00042783          	lw	a5,0(s0)
804070f4:	18002673          	csrr	a2,satp
804070f8:	0547a683          	lw	a3,84(a5)
804070fc:	0587a703          	lw	a4,88(a5)
80407100:	0047a583          	lw	a1,4(a5)
80407104:	0846a683          	lw	a3,132(a3)
80407108:	0000e517          	auipc	a0,0xe
8040710c:	97450513          	addi	a0,a0,-1676 # 80414a7c <CSWTCH.69+0x6fc>
80407110:	8ecf90ef          	jal	ra,804001fc <cprintf>
80407114:	00042783          	lw	a5,0(s0)
80407118:	0000e517          	auipc	a0,0xe
8040711c:	99c50513          	addi	a0,a0,-1636 # 80414ab4 <CSWTCH.69+0x734>
80407120:	0547a703          	lw	a4,84(a5)
80407124:	0047a583          	lw	a1,4(a5)
80407128:	08072603          	lw	a2,128(a4)
8040712c:	00565793          	srli	a5,a2,0x5
80407130:	00165713          	srli	a4,a2,0x1
80407134:	00865693          	srli	a3,a2,0x8
80407138:	0017f793          	andi	a5,a5,1
8040713c:	00177713          	andi	a4,a4,1
80407140:	0016f693          	andi	a3,a3,1
80407144:	8b8f90ef          	jal	ra,804001fc <cprintf>
80407148:	08090063          	beqz	s2,804071c8 <forkret+0x130>
8040714c:	00092603          	lw	a2,0(s2)
80407150:	00042703          	lw	a4,0(s0)
80407154:	00167793          	andi	a5,a2,1
80407158:	00472583          	lw	a1,4(a4)
8040715c:	0a079c63          	bnez	a5,80407214 <forkret+0x17c>
80407160:	0000e517          	auipc	a0,0xe
80407164:	9fc50513          	addi	a0,a0,-1540 # 80414b5c <CSWTCH.69+0x7dc>
80407168:	894f90ef          	jal	ra,804001fc <cprintf>
8040716c:	00042783          	lw	a5,0(s0)
80407170:	0047a583          	lw	a1,4(a5)
80407174:	00048863          	beqz	s1,80407184 <forkret+0xec>
80407178:	0004a603          	lw	a2,0(s1)
8040717c:	00167793          	andi	a5,a2,1
80407180:	04079a63          	bnez	a5,804071d4 <forkret+0x13c>
80407184:	0000e517          	auipc	a0,0xe
80407188:	a5c50513          	addi	a0,a0,-1444 # 80414be0 <CSWTCH.69+0x860>
8040718c:	870f90ef          	jal	ra,804001fc <cprintf>
80407190:	00042783          	lw	a5,0(s0)
80407194:	0547a603          	lw	a2,84(a5)
80407198:	0047a583          	lw	a1,4(a5)
8040719c:	0000e517          	auipc	a0,0xe
804071a0:	a8850513          	addi	a0,a0,-1400 # 80414c24 <CSWTCH.69+0x8a4>
804071a4:	858f90ef          	jal	ra,804001fc <cprintf>
804071a8:	00042783          	lw	a5,0(s0)
804071ac:	00812403          	lw	s0,8(sp)
804071b0:	00c12083          	lw	ra,12(sp)
804071b4:	00412483          	lw	s1,4(sp)
804071b8:	00012903          	lw	s2,0(sp)
804071bc:	0547a503          	lw	a0,84(a5)
804071c0:	01010113          	addi	sp,sp,16
804071c4:	e34fa06f          	j	804017f8 <forkrets>
804071c8:	00042783          	lw	a5,0(s0)
804071cc:	0047a583          	lw	a1,4(a5)
804071d0:	f91ff06f          	j	80407160 <forkret+0xc8>
804071d4:	00261793          	slli	a5,a2,0x2
804071d8:	fffff737          	lui	a4,0xfffff
804071dc:	00e7f7b3          	and	a5,a5,a4
804071e0:	00078693          	mv	a3,a5
804071e4:	0000e517          	auipc	a0,0xe
804071e8:	9a050513          	addi	a0,a0,-1632 # 80414b84 <CSWTCH.69+0x804>
804071ec:	2e47a483          	lw	s1,740(a5)
804071f0:	80cf90ef          	jal	ra,804001fc <cprintf>
804071f4:	00042783          	lw	a5,0(s0)
804071f8:	00048613          	mv	a2,s1
804071fc:	0000e517          	auipc	a0,0xe
80407200:	9bc50513          	addi	a0,a0,-1604 # 80414bb8 <CSWTCH.69+0x838>
80407204:	0047a583          	lw	a1,4(a5)
80407208:	ff5f80ef          	jal	ra,804001fc <cprintf>
8040720c:	00042783          	lw	a5,0(s0)
80407210:	f85ff06f          	j	80407194 <forkret+0xfc>
80407214:	00261793          	slli	a5,a2,0x2
80407218:	fffff737          	lui	a4,0xfffff
8040721c:	00e7f7b3          	and	a5,a5,a4
80407220:	00078693          	mv	a3,a5
80407224:	0000e517          	auipc	a0,0xe
80407228:	8cc50513          	addi	a0,a0,-1844 # 80414af0 <CSWTCH.69+0x770>
8040722c:	2d07a903          	lw	s2,720(a5)
80407230:	fcdf80ef          	jal	ra,804001fc <cprintf>
80407234:	00042783          	lw	a5,0(s0)
80407238:	00090613          	mv	a2,s2
8040723c:	0000e517          	auipc	a0,0xe
80407240:	8e450513          	addi	a0,a0,-1820 # 80414b20 <CSWTCH.69+0x7a0>
80407244:	0047a583          	lw	a1,4(a5)
80407248:	fb5f80ef          	jal	ra,804001fc <cprintf>
8040724c:	f21ff06f          	j	8040716c <forkret+0xd4>

80407250 <load_icode_read>:
80407250:	fe010113          	addi	sp,sp,-32
80407254:	00912a23          	sw	s1,20(sp)
80407258:	01312623          	sw	s3,12(sp)
8040725c:	00060493          	mv	s1,a2
80407260:	00058993          	mv	s3,a1
80407264:	00000613          	li	a2,0
80407268:	00068593          	mv	a1,a3
8040726c:	00812c23          	sw	s0,24(sp)
80407270:	01212823          	sw	s2,16(sp)
80407274:	00112e23          	sw	ra,28(sp)
80407278:	00050913          	mv	s2,a0
8040727c:	9b1ff0ef          	jal	ra,80406c2c <sysfile_seek>
80407280:	00050413          	mv	s0,a0
80407284:	02050263          	beqz	a0,804072a8 <load_icode_read+0x58>
80407288:	00040513          	mv	a0,s0
8040728c:	01c12083          	lw	ra,28(sp)
80407290:	01812403          	lw	s0,24(sp)
80407294:	01412483          	lw	s1,20(sp)
80407298:	01012903          	lw	s2,16(sp)
8040729c:	00c12983          	lw	s3,12(sp)
804072a0:	02010113          	addi	sp,sp,32
804072a4:	00008067          	ret
804072a8:	00048613          	mv	a2,s1
804072ac:	00098593          	mv	a1,s3
804072b0:	00090513          	mv	a0,s2
804072b4:	decff0ef          	jal	ra,804068a0 <sysfile_read>
804072b8:	fca488e3          	beq	s1,a0,80407288 <load_icode_read+0x38>
804072bc:	00050413          	mv	s0,a0
804072c0:	fc0544e3          	bltz	a0,80407288 <load_icode_read+0x38>
804072c4:	fff00413          	li	s0,-1
804072c8:	00040513          	mv	a0,s0
804072cc:	01c12083          	lw	ra,28(sp)
804072d0:	01812403          	lw	s0,24(sp)
804072d4:	01412483          	lw	s1,20(sp)
804072d8:	01012903          	lw	s2,16(sp)
804072dc:	00c12983          	lw	s3,12(sp)
804072e0:	02010113          	addi	sp,sp,32
804072e4:	00008067          	ret

804072e8 <user_main>:
804072e8:	00095797          	auipc	a5,0x95
804072ec:	4c478793          	addi	a5,a5,1220 # 8049c7ac <current>
804072f0:	0007a783          	lw	a5,0(a5)
804072f4:	fe010113          	addi	sp,sp,-32
804072f8:	00812c23          	sw	s0,24(sp)
804072fc:	0047a583          	lw	a1,4(a5)
80407300:	0000e417          	auipc	s0,0xe
80407304:	b4040413          	addi	s0,s0,-1216 # 80414e40 <CSWTCH.69+0xac0>
80407308:	00040613          	mv	a2,s0
8040730c:	0000e517          	auipc	a0,0xe
80407310:	b3850513          	addi	a0,a0,-1224 # 80414e44 <CSWTCH.69+0xac4>
80407314:	00112e23          	sw	ra,28(sp)
80407318:	00812423          	sw	s0,8(sp)
8040731c:	00012623          	sw	zero,12(sp)
80407320:	eddf80ef          	jal	ra,804001fc <cprintf>
80407324:	00812783          	lw	a5,8(sp)
80407328:	06078663          	beqz	a5,80407394 <user_main+0xac>
8040732c:	00c10713          	addi	a4,sp,12
80407330:	00000793          	li	a5,0
80407334:	00470713          	addi	a4,a4,4 # fffff004 <end+0x7fb62748>
80407338:	ffc72683          	lw	a3,-4(a4)
8040733c:	00178793          	addi	a5,a5,1
80407340:	fe069ae3          	bnez	a3,80407334 <user_main+0x4c>
80407344:	10002773          	csrr	a4,sstatus
80407348:	10076713          	ori	a4,a4,256
8040734c:	10071073          	csrw	sstatus,a4
80407350:	1424d073          	csrwi	scause,9
80407354:	00810713          	addi	a4,sp,8
80407358:	00000517          	auipc	a0,0x0
8040735c:	01c50513          	addi	a0,a0,28 # 80407374 <user_main+0x8c>
80407360:	14151073          	csrw	sepc,a0
80407364:	00400513          	li	a0,4
80407368:	00040593          	mv	a1,s0
8040736c:	00078613          	mv	a2,a5
80407370:	00070693          	mv	a3,a4
80407374:	b20fa06f          	j	80401694 <__alltraps>
80407378:	00050413          	mv	s0,a0
8040737c:	0000e617          	auipc	a2,0xe
80407380:	af060613          	addi	a2,a2,-1296 # 80414e6c <CSWTCH.69+0xaec>
80407384:	44600593          	li	a1,1094
80407388:	0000e517          	auipc	a0,0xe
8040738c:	b0050513          	addi	a0,a0,-1280 # 80414e88 <CSWTCH.69+0xb08>
80407390:	a94f90ef          	jal	ra,80400624 <__panic>
80407394:	00000793          	li	a5,0
80407398:	fadff06f          	j	80407344 <user_main+0x5c>

8040739c <setup_pgdir.isra.4>:
8040739c:	fe010113          	addi	sp,sp,-32
804073a0:	01212823          	sw	s2,16(sp)
804073a4:	00050913          	mv	s2,a0
804073a8:	00100513          	li	a0,1
804073ac:	00112e23          	sw	ra,28(sp)
804073b0:	00812c23          	sw	s0,24(sp)
804073b4:	00912a23          	sw	s1,20(sp)
804073b8:	01312623          	sw	s3,12(sp)
804073bc:	01412423          	sw	s4,8(sp)
804073c0:	981fb0ef          	jal	ra,80402d40 <alloc_pages>
804073c4:	0c050263          	beqz	a0,80407488 <setup_pgdir.isra.4+0xec>
804073c8:	00095a17          	auipc	s4,0x95
804073cc:	440a0a13          	addi	s4,s4,1088 # 8049c808 <pages>
804073d0:	000a2683          	lw	a3,0(s4)
804073d4:	0000f797          	auipc	a5,0xf
804073d8:	33478793          	addi	a5,a5,820 # 80416708 <nbase>
804073dc:	0007a983          	lw	s3,0(a5)
804073e0:	40d506b3          	sub	a3,a0,a3
804073e4:	00095797          	auipc	a5,0x95
804073e8:	3b478793          	addi	a5,a5,948 # 8049c798 <npage>
804073ec:	4056d693          	srai	a3,a3,0x5
804073f0:	013686b3          	add	a3,a3,s3
804073f4:	0007a703          	lw	a4,0(a5)
804073f8:	00c69793          	slli	a5,a3,0xc
804073fc:	00c7d793          	srli	a5,a5,0xc
80407400:	00050413          	mv	s0,a0
80407404:	00c69693          	slli	a3,a3,0xc
80407408:	08e7f463          	bgeu	a5,a4,80407490 <setup_pgdir.isra.4+0xf4>
8040740c:	00095797          	auipc	a5,0x95
80407410:	3f478793          	addi	a5,a5,1012 # 8049c800 <va_pa_offset>
80407414:	0007a483          	lw	s1,0(a5)
80407418:	00095797          	auipc	a5,0x95
8040741c:	37c78793          	addi	a5,a5,892 # 8049c794 <boot_pgdir>
80407420:	0007a583          	lw	a1,0(a5)
80407424:	009684b3          	add	s1,a3,s1
80407428:	00001637          	lui	a2,0x1
8040742c:	00048513          	mv	a0,s1
80407430:	6d80b0ef          	jal	ra,80412b08 <memcpy>
80407434:	000a2703          	lw	a4,0(s4)
80407438:	000017b7          	lui	a5,0x1
8040743c:	00f487b3          	add	a5,s1,a5
80407440:	40e40433          	sub	s0,s0,a4
80407444:	40545413          	srai	s0,s0,0x5
80407448:	01340433          	add	s0,s0,s3
8040744c:	00a41413          	slli	s0,s0,0xa
80407450:	00146713          	ori	a4,s0,1
80407454:	00746413          	ori	s0,s0,7
80407458:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x7054>
8040745c:	fa87a823          	sw	s0,-80(a5)
80407460:	00992023          	sw	s1,0(s2)
80407464:	00000513          	li	a0,0
80407468:	01c12083          	lw	ra,28(sp)
8040746c:	01812403          	lw	s0,24(sp)
80407470:	01412483          	lw	s1,20(sp)
80407474:	01012903          	lw	s2,16(sp)
80407478:	00c12983          	lw	s3,12(sp)
8040747c:	00812a03          	lw	s4,8(sp)
80407480:	02010113          	addi	sp,sp,32
80407484:	00008067          	ret
80407488:	ffc00513          	li	a0,-4
8040748c:	fddff06f          	j	80407468 <setup_pgdir.isra.4+0xcc>
80407490:	0000c617          	auipc	a2,0xc
80407494:	59c60613          	addi	a2,a2,1436 # 80413a2c <default_pmm_manager+0x30>
80407498:	06e00593          	li	a1,110
8040749c:	0000c517          	auipc	a0,0xc
804074a0:	5b450513          	addi	a0,a0,1460 # 80413a50 <default_pmm_manager+0x54>
804074a4:	980f90ef          	jal	ra,80400624 <__panic>

804074a8 <set_proc_name>:
804074a8:	ff010113          	addi	sp,sp,-16
804074ac:	00812423          	sw	s0,8(sp)
804074b0:	06050413          	addi	s0,a0,96
804074b4:	00912223          	sw	s1,4(sp)
804074b8:	03300613          	li	a2,51
804074bc:	00058493          	mv	s1,a1
804074c0:	00040513          	mv	a0,s0
804074c4:	00000593          	li	a1,0
804074c8:	00112623          	sw	ra,12(sp)
804074cc:	5cc0b0ef          	jal	ra,80412a98 <memset>
804074d0:	00040513          	mv	a0,s0
804074d4:	00812403          	lw	s0,8(sp)
804074d8:	00c12083          	lw	ra,12(sp)
804074dc:	00048593          	mv	a1,s1
804074e0:	00412483          	lw	s1,4(sp)
804074e4:	03200613          	li	a2,50
804074e8:	01010113          	addi	sp,sp,16
804074ec:	61c0b06f          	j	80412b08 <memcpy>

804074f0 <proc_run>:
804074f0:	ff010113          	addi	sp,sp,-16
804074f4:	00095797          	auipc	a5,0x95
804074f8:	2b878793          	addi	a5,a5,696 # 8049c7ac <current>
804074fc:	00912223          	sw	s1,4(sp)
80407500:	0007a483          	lw	s1,0(a5)
80407504:	00112623          	sw	ra,12(sp)
80407508:	00812423          	sw	s0,8(sp)
8040750c:	01212023          	sw	s2,0(sp)
80407510:	04a48463          	beq	s1,a0,80407558 <proc_run+0x68>
80407514:	00050413          	mv	s0,a0
80407518:	100027f3          	csrr	a5,sstatus
8040751c:	0027f793          	andi	a5,a5,2
80407520:	00000913          	li	s2,0
80407524:	06079263          	bnez	a5,80407588 <proc_run+0x98>
80407528:	05842783          	lw	a5,88(s0)
8040752c:	00095717          	auipc	a4,0x95
80407530:	28872023          	sw	s0,640(a4) # 8049c7ac <current>
80407534:	80000737          	lui	a4,0x80000
80407538:	00c7d793          	srli	a5,a5,0xc
8040753c:	00e7e7b3          	or	a5,a5,a4
80407540:	18079073          	csrw	satp,a5
80407544:	12000073          	sfence.vma
80407548:	01c40593          	addi	a1,s0,28
8040754c:	01c48513          	addi	a0,s1,28
80407550:	3a9010ef          	jal	ra,804090f8 <switch_to>
80407554:	00091e63          	bnez	s2,80407570 <proc_run+0x80>
80407558:	00c12083          	lw	ra,12(sp)
8040755c:	00812403          	lw	s0,8(sp)
80407560:	00412483          	lw	s1,4(sp)
80407564:	00012903          	lw	s2,0(sp)
80407568:	01010113          	addi	sp,sp,16
8040756c:	00008067          	ret
80407570:	00812403          	lw	s0,8(sp)
80407574:	00c12083          	lw	ra,12(sp)
80407578:	00412483          	lw	s1,4(sp)
8040757c:	00012903          	lw	s2,0(sp)
80407580:	01010113          	addi	sp,sp,16
80407584:	e90f906f          	j	80400c14 <intr_enable>
80407588:	e94f90ef          	jal	ra,80400c1c <intr_disable>
8040758c:	00100913          	li	s2,1
80407590:	f99ff06f          	j	80407528 <proc_run+0x38>

80407594 <find_proc>:
80407594:	000027b7          	lui	a5,0x2
80407598:	fff50713          	addi	a4,a0,-1
8040759c:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
804075a0:	04e7ec63          	bltu	a5,a4,804075f8 <find_proc+0x64>
804075a4:	ff010113          	addi	sp,sp,-16
804075a8:	00a00593          	li	a1,10
804075ac:	00812423          	sw	s0,8(sp)
804075b0:	00112623          	sw	ra,12(sp)
804075b4:	00050413          	mv	s0,a0
804075b8:	4a10a0ef          	jal	ra,80412258 <hash32>
804075bc:	00092797          	auipc	a5,0x92
804075c0:	18c78793          	addi	a5,a5,396 # 80499748 <hash_list>
804075c4:	00351513          	slli	a0,a0,0x3
804075c8:	00f50533          	add	a0,a0,a5
804075cc:	00050793          	mv	a5,a0
804075d0:	00c0006f          	j	804075dc <find_proc+0x48>
804075d4:	f687a703          	lw	a4,-152(a5)
804075d8:	02870463          	beq	a4,s0,80407600 <find_proc+0x6c>
804075dc:	0047a783          	lw	a5,4(a5)
804075e0:	fef51ae3          	bne	a0,a5,804075d4 <find_proc+0x40>
804075e4:	00c12083          	lw	ra,12(sp)
804075e8:	00812403          	lw	s0,8(sp)
804075ec:	00000513          	li	a0,0
804075f0:	01010113          	addi	sp,sp,16
804075f4:	00008067          	ret
804075f8:	00000513          	li	a0,0
804075fc:	00008067          	ret
80407600:	00c12083          	lw	ra,12(sp)
80407604:	00812403          	lw	s0,8(sp)
80407608:	f6478513          	addi	a0,a5,-156
8040760c:	01010113          	addi	sp,sp,16
80407610:	00008067          	ret

80407614 <do_fork>:
80407614:	fc010113          	addi	sp,sp,-64
80407618:	03612023          	sw	s6,32(sp)
8040761c:	00095b17          	auipc	s6,0x95
80407620:	19cb0b13          	addi	s6,s6,412 # 8049c7b8 <nr_process>
80407624:	000b2783          	lw	a5,0(s6)
80407628:	03212823          	sw	s2,48(sp)
8040762c:	02112e23          	sw	ra,60(sp)
80407630:	02812c23          	sw	s0,56(sp)
80407634:	02912a23          	sw	s1,52(sp)
80407638:	03312623          	sw	s3,44(sp)
8040763c:	03412423          	sw	s4,40(sp)
80407640:	03512223          	sw	s5,36(sp)
80407644:	01712e23          	sw	s7,28(sp)
80407648:	01812c23          	sw	s8,24(sp)
8040764c:	01912a23          	sw	s9,20(sp)
80407650:	01a12823          	sw	s10,16(sp)
80407654:	01b12623          	sw	s11,12(sp)
80407658:	00001937          	lui	s2,0x1
8040765c:	4f27de63          	bge	a5,s2,80407b58 <do_fork+0x544>
80407660:	00050993          	mv	s3,a0
80407664:	00058a93          	mv	s5,a1
80407668:	00060493          	mv	s1,a2
8040766c:	949ff0ef          	jal	ra,80406fb4 <alloc_proc>
80407670:	00050413          	mv	s0,a0
80407674:	3c050263          	beqz	a0,80407a38 <do_fork+0x424>
80407678:	00095a17          	auipc	s4,0x95
8040767c:	134a0a13          	addi	s4,s4,308 # 8049c7ac <current>
80407680:	000a2783          	lw	a5,0(s4)
80407684:	0a87a703          	lw	a4,168(a5)
80407688:	00f52a23          	sw	a5,20(a0)
8040768c:	4e071663          	bnez	a4,80407b78 <do_fork+0x564>
80407690:	00200513          	li	a0,2
80407694:	eacfb0ef          	jal	ra,80402d40 <alloc_pages>
80407698:	38050c63          	beqz	a0,80407a30 <do_fork+0x41c>
8040769c:	00095c17          	auipc	s8,0x95
804076a0:	16cc0c13          	addi	s8,s8,364 # 8049c808 <pages>
804076a4:	000c2683          	lw	a3,0(s8)
804076a8:	0000f797          	auipc	a5,0xf
804076ac:	06078793          	addi	a5,a5,96 # 80416708 <nbase>
804076b0:	0007ab83          	lw	s7,0(a5)
804076b4:	40d506b3          	sub	a3,a0,a3
804076b8:	4056d693          	srai	a3,a3,0x5
804076bc:	00095c97          	auipc	s9,0x95
804076c0:	0dcc8c93          	addi	s9,s9,220 # 8049c798 <npage>
804076c4:	017686b3          	add	a3,a3,s7
804076c8:	000ca703          	lw	a4,0(s9)
804076cc:	00c69793          	slli	a5,a3,0xc
804076d0:	00c7d793          	srli	a5,a5,0xc
804076d4:	00c69693          	slli	a3,a3,0xc
804076d8:	48e7f463          	bgeu	a5,a4,80407b60 <do_fork+0x54c>
804076dc:	00095d17          	auipc	s10,0x95
804076e0:	124d0d13          	addi	s10,s10,292 # 8049c800 <va_pa_offset>
804076e4:	000a2703          	lw	a4,0(s4)
804076e8:	000d2783          	lw	a5,0(s10)
804076ec:	0dc72d83          	lw	s11,220(a4) # 800000dc <end+0xffb63820>
804076f0:	00d786b3          	add	a3,a5,a3
804076f4:	00d42623          	sw	a3,12(s0)
804076f8:	4a0d8063          	beqz	s11,80407b98 <do_fork+0x584>
804076fc:	80090913          	addi	s2,s2,-2048 # 800 <_binary_bin_swap_img_size-0x7800>
80407700:	0129f933          	and	s2,s3,s2
80407704:	2a090463          	beqz	s2,804079ac <do_fork+0x398>
80407708:	008da783          	lw	a5,8(s11)
8040770c:	01872903          	lw	s2,24(a4)
80407710:	00178793          	addi	a5,a5,1
80407714:	00fda423          	sw	a5,8(s11)
80407718:	0db42e23          	sw	s11,220(s0)
8040771c:	02090a63          	beqz	s2,80407750 <do_fork+0x13c>
80407720:	1009f993          	andi	s3,s3,256
80407724:	2a098663          	beqz	s3,804079d0 <do_fork+0x3bc>
80407728:	01892783          	lw	a5,24(s2)
8040772c:	00c92683          	lw	a3,12(s2)
80407730:	80400737          	lui	a4,0x80400
80407734:	00178793          	addi	a5,a5,1
80407738:	00f92c23          	sw	a5,24(s2)
8040773c:	01242c23          	sw	s2,24(s0)
80407740:	46e6ec63          	bltu	a3,a4,80407bb8 <do_fork+0x5a4>
80407744:	000d2783          	lw	a5,0(s10)
80407748:	40f686b3          	sub	a3,a3,a5
8040774c:	04d42c23          	sw	a3,88(s0)
80407750:	00c42783          	lw	a5,12(s0)
80407754:	00002737          	lui	a4,0x2
80407758:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_bin_swap_img_size-0x6090>
8040775c:	00e787b3          	add	a5,a5,a4
80407760:	04f42a23          	sw	a5,84(s0)
80407764:	00078713          	mv	a4,a5
80407768:	09048813          	addi	a6,s1,144
8040776c:	0004a503          	lw	a0,0(s1)
80407770:	0044a583          	lw	a1,4(s1)
80407774:	0084a603          	lw	a2,8(s1)
80407778:	00c4a683          	lw	a3,12(s1)
8040777c:	00a72023          	sw	a0,0(a4)
80407780:	00b72223          	sw	a1,4(a4)
80407784:	00c72423          	sw	a2,8(a4)
80407788:	00d72623          	sw	a3,12(a4)
8040778c:	01048493          	addi	s1,s1,16
80407790:	01070713          	addi	a4,a4,16
80407794:	fd049ce3          	bne	s1,a6,8040776c <do_fork+0x158>
80407798:	0207a423          	sw	zero,40(a5)
8040779c:	1a0a8663          	beqz	s5,80407948 <do_fork+0x334>
804077a0:	0157a423          	sw	s5,8(a5)
804077a4:	00000717          	auipc	a4,0x0
804077a8:	8f470713          	addi	a4,a4,-1804 # 80407098 <forkret>
804077ac:	00e42e23          	sw	a4,28(s0)
804077b0:	02f42023          	sw	a5,32(s0)
804077b4:	100027f3          	csrr	a5,sstatus
804077b8:	0027f793          	andi	a5,a5,2
804077bc:	00000913          	li	s2,0
804077c0:	1a079863          	bnez	a5,80407970 <do_fork+0x35c>
804077c4:	00092797          	auipc	a5,0x92
804077c8:	88078793          	addi	a5,a5,-1920 # 80499044 <last_pid>
804077cc:	0007a503          	lw	a0,0(a5)
804077d0:	000027b7          	lui	a5,0x2
804077d4:	00150513          	addi	a0,a0,1
804077d8:	00092717          	auipc	a4,0x92
804077dc:	86a72623          	sw	a0,-1940(a4) # 80499044 <last_pid>
804077e0:	1af55c63          	bge	a0,a5,80407998 <do_fork+0x384>
804077e4:	00092797          	auipc	a5,0x92
804077e8:	86478793          	addi	a5,a5,-1948 # 80499048 <next_safe>
804077ec:	0007a783          	lw	a5,0(a5)
804077f0:	00095497          	auipc	s1,0x95
804077f4:	0c448493          	addi	s1,s1,196 # 8049c8b4 <proc_list>
804077f8:	06f54c63          	blt	a0,a5,80407870 <do_fork+0x25c>
804077fc:	000027b7          	lui	a5,0x2
80407800:	00092717          	auipc	a4,0x92
80407804:	84f72423          	sw	a5,-1976(a4) # 80499048 <next_safe>
80407808:	00000593          	li	a1,0
8040780c:	00050793          	mv	a5,a0
80407810:	00095497          	auipc	s1,0x95
80407814:	0a448493          	addi	s1,s1,164 # 8049c8b4 <proc_list>
80407818:	000028b7          	lui	a7,0x2
8040781c:	00058813          	mv	a6,a1
80407820:	00002637          	lui	a2,0x2
80407824:	00095697          	auipc	a3,0x95
80407828:	09068693          	addi	a3,a3,144 # 8049c8b4 <proc_list>
8040782c:	0046a683          	lw	a3,4(a3)
80407830:	02968263          	beq	a3,s1,80407854 <do_fork+0x240>
80407834:	f706a703          	lw	a4,-144(a3)
80407838:	10f70063          	beq	a4,a5,80407938 <do_fork+0x324>
8040783c:	fee7d8e3          	bge	a5,a4,8040782c <do_fork+0x218>
80407840:	fec756e3          	bge	a4,a2,8040782c <do_fork+0x218>
80407844:	0046a683          	lw	a3,4(a3)
80407848:	00070613          	mv	a2,a4
8040784c:	00100813          	li	a6,1
80407850:	fe9692e3          	bne	a3,s1,80407834 <do_fork+0x220>
80407854:	00058863          	beqz	a1,80407864 <do_fork+0x250>
80407858:	00091717          	auipc	a4,0x91
8040785c:	7ef72623          	sw	a5,2028(a4) # 80499044 <last_pid>
80407860:	00078513          	mv	a0,a5
80407864:	00080663          	beqz	a6,80407870 <do_fork+0x25c>
80407868:	00091797          	auipc	a5,0x91
8040786c:	7ec7a023          	sw	a2,2016(a5) # 80499048 <next_safe>
80407870:	00a00593          	li	a1,10
80407874:	00a42223          	sw	a0,4(s0)
80407878:	1e10a0ef          	jal	ra,80412258 <hash32>
8040787c:	00092797          	auipc	a5,0x92
80407880:	ecc78793          	addi	a5,a5,-308 # 80499748 <hash_list>
80407884:	00351513          	slli	a0,a0,0x3
80407888:	00f50533          	add	a0,a0,a5
8040788c:	00452583          	lw	a1,4(a0)
80407890:	01442683          	lw	a3,20(s0)
80407894:	09c40793          	addi	a5,s0,156
80407898:	00f5a023          	sw	a5,0(a1) # 801000 <_binary_bin_sfs_img_size+0x789000>
8040789c:	0044a603          	lw	a2,4(s1)
804078a0:	00f52223          	sw	a5,4(a0)
804078a4:	0ac6a703          	lw	a4,172(a3)
804078a8:	09440793          	addi	a5,s0,148
804078ac:	0ab42023          	sw	a1,160(s0)
804078b0:	08a42e23          	sw	a0,156(s0)
804078b4:	00f62023          	sw	a5,0(a2) # 2000 <_binary_bin_swap_img_size-0x6000>
804078b8:	00095597          	auipc	a1,0x95
804078bc:	00f5a023          	sw	a5,0(a1) # 8049c8b8 <proc_list+0x4>
804078c0:	08c42c23          	sw	a2,152(s0)
804078c4:	08942a23          	sw	s1,148(s0)
804078c8:	0a042823          	sw	zero,176(s0)
804078cc:	0ae42a23          	sw	a4,180(s0)
804078d0:	00070463          	beqz	a4,804078d8 <do_fork+0x2c4>
804078d4:	0a872823          	sw	s0,176(a4)
804078d8:	000b2783          	lw	a5,0(s6)
804078dc:	0a86a623          	sw	s0,172(a3)
804078e0:	00178793          	addi	a5,a5,1
804078e4:	00095717          	auipc	a4,0x95
804078e8:	ecf72a23          	sw	a5,-300(a4) # 8049c7b8 <nr_process>
804078ec:	14091a63          	bnez	s2,80407a40 <do_fork+0x42c>
804078f0:	00040513          	mv	a0,s0
804078f4:	368050ef          	jal	ra,8040cc5c <wakeup_proc>
804078f8:	00442503          	lw	a0,4(s0)
804078fc:	03c12083          	lw	ra,60(sp)
80407900:	03812403          	lw	s0,56(sp)
80407904:	03412483          	lw	s1,52(sp)
80407908:	03012903          	lw	s2,48(sp)
8040790c:	02c12983          	lw	s3,44(sp)
80407910:	02812a03          	lw	s4,40(sp)
80407914:	02412a83          	lw	s5,36(sp)
80407918:	02012b03          	lw	s6,32(sp)
8040791c:	01c12b83          	lw	s7,28(sp)
80407920:	01812c03          	lw	s8,24(sp)
80407924:	01412c83          	lw	s9,20(sp)
80407928:	01012d03          	lw	s10,16(sp)
8040792c:	00c12d83          	lw	s11,12(sp)
80407930:	04010113          	addi	sp,sp,64
80407934:	00008067          	ret
80407938:	00178793          	addi	a5,a5,1
8040793c:	1ac7da63          	bge	a5,a2,80407af0 <do_fork+0x4dc>
80407940:	00100593          	li	a1,1
80407944:	ee9ff06f          	j	8040782c <do_fork+0x218>
80407948:	00078a93          	mv	s5,a5
8040794c:	0157a423          	sw	s5,8(a5)
80407950:	fffff717          	auipc	a4,0xfffff
80407954:	74870713          	addi	a4,a4,1864 # 80407098 <forkret>
80407958:	00e42e23          	sw	a4,28(s0)
8040795c:	02f42023          	sw	a5,32(s0)
80407960:	100027f3          	csrr	a5,sstatus
80407964:	0027f793          	andi	a5,a5,2
80407968:	00000913          	li	s2,0
8040796c:	e4078ce3          	beqz	a5,804077c4 <do_fork+0x1b0>
80407970:	aacf90ef          	jal	ra,80400c1c <intr_disable>
80407974:	00091797          	auipc	a5,0x91
80407978:	6d078793          	addi	a5,a5,1744 # 80499044 <last_pid>
8040797c:	0007a503          	lw	a0,0(a5)
80407980:	000027b7          	lui	a5,0x2
80407984:	00100913          	li	s2,1
80407988:	00150513          	addi	a0,a0,1
8040798c:	00091717          	auipc	a4,0x91
80407990:	6aa72c23          	sw	a0,1720(a4) # 80499044 <last_pid>
80407994:	e4f548e3          	blt	a0,a5,804077e4 <do_fork+0x1d0>
80407998:	00100793          	li	a5,1
8040799c:	00091717          	auipc	a4,0x91
804079a0:	6af72423          	sw	a5,1704(a4) # 80499044 <last_pid>
804079a4:	00100513          	li	a0,1
804079a8:	e55ff06f          	j	804077fc <do_fork+0x1e8>
804079ac:	9a5fe0ef          	jal	ra,80406350 <files_create>
804079b0:	00050913          	mv	s2,a0
804079b4:	04050263          	beqz	a0,804079f8 <do_fork+0x3e4>
804079b8:	000d8593          	mv	a1,s11
804079bc:	b49fe0ef          	jal	ra,80406504 <dup_files>
804079c0:	14051063          	bnez	a0,80407b00 <do_fork+0x4ec>
804079c4:	000a2703          	lw	a4,0(s4)
804079c8:	00090d93          	mv	s11,s2
804079cc:	d3dff06f          	j	80407708 <do_fork+0xf4>
804079d0:	d35fc0ef          	jal	ra,80404704 <mm_create>
804079d4:	00050993          	mv	s3,a0
804079d8:	00050c63          	beqz	a0,804079f0 <do_fork+0x3dc>
804079dc:	00c50513          	addi	a0,a0,12
804079e0:	9bdff0ef          	jal	ra,8040739c <setup_pgdir.isra.4>
804079e4:	06050263          	beqz	a0,80407a48 <do_fork+0x434>
804079e8:	00098513          	mv	a0,s3
804079ec:	eddfc0ef          	jal	ra,804048c8 <mm_destroy>
804079f0:	00040513          	mv	a0,s0
804079f4:	e84ff0ef          	jal	ra,80407078 <put_files>
804079f8:	00c42683          	lw	a3,12(s0)
804079fc:	804007b7          	lui	a5,0x80400
80407a00:	1ef6e463          	bltu	a3,a5,80407be8 <do_fork+0x5d4>
80407a04:	000d2703          	lw	a4,0(s10)
80407a08:	000ca783          	lw	a5,0(s9)
80407a0c:	40e686b3          	sub	a3,a3,a4
80407a10:	00c6d693          	srli	a3,a3,0xc
80407a14:	1af6fe63          	bgeu	a3,a5,80407bd0 <do_fork+0x5bc>
80407a18:	000c2503          	lw	a0,0(s8)
80407a1c:	417686b3          	sub	a3,a3,s7
80407a20:	00569693          	slli	a3,a3,0x5
80407a24:	00200593          	li	a1,2
80407a28:	00d50533          	add	a0,a0,a3
80407a2c:	bdcfb0ef          	jal	ra,80402e08 <free_pages>
80407a30:	00040513          	mv	a0,s0
80407a34:	8b0fb0ef          	jal	ra,80402ae4 <kfree>
80407a38:	ffc00513          	li	a0,-4
80407a3c:	ec1ff06f          	j	804078fc <do_fork+0x2e8>
80407a40:	9d4f90ef          	jal	ra,80400c14 <intr_enable>
80407a44:	eadff06f          	j	804078f0 <do_fork+0x2dc>
80407a48:	01c90d93          	addi	s11,s2,28
80407a4c:	000d8513          	mv	a0,s11
80407a50:	f88fd0ef          	jal	ra,804051d8 <down>
80407a54:	000a2783          	lw	a5,0(s4)
80407a58:	00078663          	beqz	a5,80407a64 <do_fork+0x450>
80407a5c:	0047a783          	lw	a5,4(a5) # 80400004 <end+0xfff63748>
80407a60:	02f92423          	sw	a5,40(s2)
80407a64:	00090593          	mv	a1,s2
80407a68:	00098513          	mv	a0,s3
80407a6c:	fc9fc0ef          	jal	ra,80404a34 <dup_mmap>
80407a70:	00050a13          	mv	s4,a0
80407a74:	000d8513          	mv	a0,s11
80407a78:	f5cfd0ef          	jal	ra,804051d4 <up>
80407a7c:	02092423          	sw	zero,40(s2)
80407a80:	080a1663          	bnez	s4,80407b0c <do_fork+0x4f8>
80407a84:	0000100f          	fence.i
80407a88:	0189a783          	lw	a5,24(s3)
80407a8c:	00c9a503          	lw	a0,12(s3)
80407a90:	80400737          	lui	a4,0x80400
80407a94:	00178793          	addi	a5,a5,1
80407a98:	00f9ac23          	sw	a5,24(s3)
80407a9c:	01342c23          	sw	s3,24(s0)
80407aa0:	00050693          	mv	a3,a0
80407aa4:	10e56a63          	bltu	a0,a4,80407bb8 <do_fork+0x5a4>
80407aa8:	000d2783          	lw	a5,0(s10)
80407aac:	00000613          	li	a2,0
80407ab0:	008005b7          	lui	a1,0x800
80407ab4:	40f507b3          	sub	a5,a0,a5
80407ab8:	04f42c23          	sw	a5,88(s0)
80407abc:	c18fb0ef          	jal	ra,80402ed4 <get_pte>
80407ac0:	c80508e3          	beqz	a0,80407750 <do_fork+0x13c>
80407ac4:	00052583          	lw	a1,0(a0)
80407ac8:	0015f793          	andi	a5,a1,1
80407acc:	c80782e3          	beqz	a5,80407750 <do_fork+0x13c>
80407ad0:	05842683          	lw	a3,88(s0)
80407ad4:	00259613          	slli	a2,a1,0x2
80407ad8:	fffff7b7          	lui	a5,0xfffff
80407adc:	00f67633          	and	a2,a2,a5
80407ae0:	0000d517          	auipc	a0,0xd
80407ae4:	f4850513          	addi	a0,a0,-184 # 80414a28 <CSWTCH.69+0x6a8>
80407ae8:	f14f80ef          	jal	ra,804001fc <cprintf>
80407aec:	c65ff06f          	j	80407750 <do_fork+0x13c>
80407af0:	0117c463          	blt	a5,a7,80407af8 <do_fork+0x4e4>
80407af4:	00100793          	li	a5,1
80407af8:	00100593          	li	a1,1
80407afc:	d21ff06f          	j	8040781c <do_fork+0x208>
80407b00:	00090513          	mv	a0,s2
80407b04:	8a1fe0ef          	jal	ra,804063a4 <files_destroy>
80407b08:	ef1ff06f          	j	804079f8 <do_fork+0x3e4>
80407b0c:	00098513          	mv	a0,s3
80407b10:	804fd0ef          	jal	ra,80404b14 <exit_mmap>
80407b14:	00c9a683          	lw	a3,12(s3)
80407b18:	804007b7          	lui	a5,0x80400
80407b1c:	0cf6e663          	bltu	a3,a5,80407be8 <do_fork+0x5d4>
80407b20:	000d2703          	lw	a4,0(s10)
80407b24:	000ca783          	lw	a5,0(s9)
80407b28:	40e686b3          	sub	a3,a3,a4
80407b2c:	00c6d693          	srli	a3,a3,0xc
80407b30:	0af6f063          	bgeu	a3,a5,80407bd0 <do_fork+0x5bc>
80407b34:	000c2503          	lw	a0,0(s8)
80407b38:	417686b3          	sub	a3,a3,s7
80407b3c:	00569693          	slli	a3,a3,0x5
80407b40:	00d50533          	add	a0,a0,a3
80407b44:	00100593          	li	a1,1
80407b48:	ac0fb0ef          	jal	ra,80402e08 <free_pages>
80407b4c:	00098513          	mv	a0,s3
80407b50:	d79fc0ef          	jal	ra,804048c8 <mm_destroy>
80407b54:	e9dff06f          	j	804079f0 <do_fork+0x3dc>
80407b58:	ffb00513          	li	a0,-5
80407b5c:	da1ff06f          	j	804078fc <do_fork+0x2e8>
80407b60:	0000c617          	auipc	a2,0xc
80407b64:	ecc60613          	addi	a2,a2,-308 # 80413a2c <default_pmm_manager+0x30>
80407b68:	06e00593          	li	a1,110
80407b6c:	0000c517          	auipc	a0,0xc
80407b70:	ee450513          	addi	a0,a0,-284 # 80413a50 <default_pmm_manager+0x54>
80407b74:	ab1f80ef          	jal	ra,80400624 <__panic>
80407b78:	0000d697          	auipc	a3,0xd
80407b7c:	e8068693          	addi	a3,a3,-384 # 804149f8 <CSWTCH.69+0x678>
80407b80:	0000b617          	auipc	a2,0xb
80407b84:	34860613          	addi	a2,a2,840 # 80412ec8 <commands+0x1bc>
80407b88:	22000593          	li	a1,544
80407b8c:	0000d517          	auipc	a0,0xd
80407b90:	2fc50513          	addi	a0,a0,764 # 80414e88 <CSWTCH.69+0xb08>
80407b94:	a91f80ef          	jal	ra,80400624 <__panic>
80407b98:	0000d697          	auipc	a3,0xd
80407b9c:	e7c68693          	addi	a3,a3,-388 # 80414a14 <CSWTCH.69+0x694>
80407ba0:	0000b617          	auipc	a2,0xb
80407ba4:	32860613          	addi	a2,a2,808 # 80412ec8 <commands+0x1bc>
80407ba8:	1c600593          	li	a1,454
80407bac:	0000d517          	auipc	a0,0xd
80407bb0:	2dc50513          	addi	a0,a0,732 # 80414e88 <CSWTCH.69+0xb08>
80407bb4:	a71f80ef          	jal	ra,80400624 <__panic>
80407bb8:	0000c617          	auipc	a2,0xc
80407bbc:	ea860613          	addi	a2,a2,-344 # 80413a60 <default_pmm_manager+0x64>
80407bc0:	19d00593          	li	a1,413
80407bc4:	0000d517          	auipc	a0,0xd
80407bc8:	2c450513          	addi	a0,a0,708 # 80414e88 <CSWTCH.69+0xb08>
80407bcc:	a59f80ef          	jal	ra,80400624 <__panic>
80407bd0:	0000c617          	auipc	a2,0xc
80407bd4:	eb460613          	addi	a2,a2,-332 # 80413a84 <default_pmm_manager+0x88>
80407bd8:	06900593          	li	a1,105
80407bdc:	0000c517          	auipc	a0,0xc
80407be0:	e7450513          	addi	a0,a0,-396 # 80413a50 <default_pmm_manager+0x54>
80407be4:	a41f80ef          	jal	ra,80400624 <__panic>
80407be8:	0000c617          	auipc	a2,0xc
80407bec:	e7860613          	addi	a2,a2,-392 # 80413a60 <default_pmm_manager+0x64>
80407bf0:	07000593          	li	a1,112
80407bf4:	0000c517          	auipc	a0,0xc
80407bf8:	e5c50513          	addi	a0,a0,-420 # 80413a50 <default_pmm_manager+0x54>
80407bfc:	a29f80ef          	jal	ra,80400624 <__panic>

80407c00 <kernel_thread>:
80407c00:	f6010113          	addi	sp,sp,-160
80407c04:	08812c23          	sw	s0,152(sp)
80407c08:	08912a23          	sw	s1,148(sp)
80407c0c:	09212823          	sw	s2,144(sp)
80407c10:	00058493          	mv	s1,a1
80407c14:	00050913          	mv	s2,a0
80407c18:	00060413          	mv	s0,a2
80407c1c:	00000593          	li	a1,0
80407c20:	09000613          	li	a2,144
80407c24:	00010513          	mv	a0,sp
80407c28:	08112e23          	sw	ra,156(sp)
80407c2c:	66d0a0ef          	jal	ra,80412a98 <memset>
80407c30:	03212023          	sw	s2,32(sp)
80407c34:	02912223          	sw	s1,36(sp)
80407c38:	100027f3          	csrr	a5,sstatus
80407c3c:	edd7f793          	andi	a5,a5,-291
80407c40:	1207e793          	ori	a5,a5,288
80407c44:	08f12023          	sw	a5,128(sp)
80407c48:	00010613          	mv	a2,sp
80407c4c:	10046513          	ori	a0,s0,256
80407c50:	fffff797          	auipc	a5,0xfffff
80407c54:	35878793          	addi	a5,a5,856 # 80406fa8 <kernel_thread_entry>
80407c58:	00000593          	li	a1,0
80407c5c:	08f12223          	sw	a5,132(sp)
80407c60:	9b5ff0ef          	jal	ra,80407614 <do_fork>
80407c64:	09c12083          	lw	ra,156(sp)
80407c68:	09812403          	lw	s0,152(sp)
80407c6c:	09412483          	lw	s1,148(sp)
80407c70:	09012903          	lw	s2,144(sp)
80407c74:	0a010113          	addi	sp,sp,160
80407c78:	00008067          	ret

80407c7c <do_exit>:
80407c7c:	fe010113          	addi	sp,sp,-32
80407c80:	00912a23          	sw	s1,20(sp)
80407c84:	00095717          	auipc	a4,0x95
80407c88:	b2c70713          	addi	a4,a4,-1236 # 8049c7b0 <idleproc>
80407c8c:	00095497          	auipc	s1,0x95
80407c90:	b2048493          	addi	s1,s1,-1248 # 8049c7ac <current>
80407c94:	0004a783          	lw	a5,0(s1)
80407c98:	00072703          	lw	a4,0(a4)
80407c9c:	00112e23          	sw	ra,28(sp)
80407ca0:	00812c23          	sw	s0,24(sp)
80407ca4:	01212823          	sw	s2,16(sp)
80407ca8:	01312623          	sw	s3,12(sp)
80407cac:	01412423          	sw	s4,8(sp)
80407cb0:	12e78263          	beq	a5,a4,80407dd4 <do_exit+0x158>
80407cb4:	00095417          	auipc	s0,0x95
80407cb8:	b0040413          	addi	s0,s0,-1280 # 8049c7b4 <initproc>
80407cbc:	00042703          	lw	a4,0(s0)
80407cc0:	18e78e63          	beq	a5,a4,80407e5c <do_exit+0x1e0>
80407cc4:	0187a903          	lw	s2,24(a5)
80407cc8:	00050993          	mv	s3,a0
80407ccc:	02090e63          	beqz	s2,80407d08 <do_exit+0x8c>
80407cd0:	00095797          	auipc	a5,0x95
80407cd4:	b3478793          	addi	a5,a5,-1228 # 8049c804 <boot_cr3>
80407cd8:	0007a783          	lw	a5,0(a5)
80407cdc:	80000737          	lui	a4,0x80000
80407ce0:	00c7d793          	srli	a5,a5,0xc
80407ce4:	00e7e7b3          	or	a5,a5,a4
80407ce8:	18079073          	csrw	satp,a5
80407cec:	12000073          	sfence.vma
80407cf0:	01892783          	lw	a5,24(s2)
80407cf4:	fff78793          	addi	a5,a5,-1
80407cf8:	00f92c23          	sw	a5,24(s2)
80407cfc:	0e078863          	beqz	a5,80407dec <do_exit+0x170>
80407d00:	0004a783          	lw	a5,0(s1)
80407d04:	0007ac23          	sw	zero,24(a5)
80407d08:	0004a503          	lw	a0,0(s1)
80407d0c:	b6cff0ef          	jal	ra,80407078 <put_files>
80407d10:	0004a783          	lw	a5,0(s1)
80407d14:	00300713          	li	a4,3
80407d18:	00e7a023          	sw	a4,0(a5)
80407d1c:	0b37a223          	sw	s3,164(a5)
80407d20:	100027f3          	csrr	a5,sstatus
80407d24:	0027f793          	andi	a5,a5,2
80407d28:	00000a13          	li	s4,0
80407d2c:	14079463          	bnez	a5,80407e74 <do_exit+0x1f8>
80407d30:	0004a703          	lw	a4,0(s1)
80407d34:	800007b7          	lui	a5,0x80000
80407d38:	00178793          	addi	a5,a5,1 # 80000001 <end+0xffb63745>
80407d3c:	01472503          	lw	a0,20(a4) # 80000014 <end+0xffb63758>
80407d40:	0a852703          	lw	a4,168(a0)
80407d44:	12f70e63          	beq	a4,a5,80407e80 <do_exit+0x204>
80407d48:	0004a683          	lw	a3,0(s1)
80407d4c:	800009b7          	lui	s3,0x80000
80407d50:	00300913          	li	s2,3
80407d54:	00198993          	addi	s3,s3,1 # 80000001 <end+0xffb63745>
80407d58:	0ac6a783          	lw	a5,172(a3)
80407d5c:	04078463          	beqz	a5,80407da4 <do_exit+0x128>
80407d60:	0b47a703          	lw	a4,180(a5)
80407d64:	00042503          	lw	a0,0(s0)
80407d68:	0ae6a623          	sw	a4,172(a3)
80407d6c:	0ac52703          	lw	a4,172(a0)
80407d70:	0a07a823          	sw	zero,176(a5)
80407d74:	0ae7aa23          	sw	a4,180(a5)
80407d78:	00070463          	beqz	a4,80407d80 <do_exit+0x104>
80407d7c:	0af72823          	sw	a5,176(a4)
80407d80:	0007a703          	lw	a4,0(a5)
80407d84:	00a7aa23          	sw	a0,20(a5)
80407d88:	0af52623          	sw	a5,172(a0)
80407d8c:	fd2716e3          	bne	a4,s2,80407d58 <do_exit+0xdc>
80407d90:	0a852783          	lw	a5,168(a0)
80407d94:	fd3792e3          	bne	a5,s3,80407d58 <do_exit+0xdc>
80407d98:	6c5040ef          	jal	ra,8040cc5c <wakeup_proc>
80407d9c:	0004a683          	lw	a3,0(s1)
80407da0:	fb9ff06f          	j	80407d58 <do_exit+0xdc>
80407da4:	020a1463          	bnez	s4,80407dcc <do_exit+0x150>
80407da8:	7b1040ef          	jal	ra,8040cd58 <schedule>
80407dac:	0004a783          	lw	a5,0(s1)
80407db0:	0000d617          	auipc	a2,0xd
80407db4:	c2860613          	addi	a2,a2,-984 # 804149d8 <CSWTCH.69+0x658>
80407db8:	27c00593          	li	a1,636
80407dbc:	0047a683          	lw	a3,4(a5)
80407dc0:	0000d517          	auipc	a0,0xd
80407dc4:	0c850513          	addi	a0,a0,200 # 80414e88 <CSWTCH.69+0xb08>
80407dc8:	85df80ef          	jal	ra,80400624 <__panic>
80407dcc:	e49f80ef          	jal	ra,80400c14 <intr_enable>
80407dd0:	fd9ff06f          	j	80407da8 <do_exit+0x12c>
80407dd4:	0000d617          	auipc	a2,0xd
80407dd8:	be460613          	addi	a2,a2,-1052 # 804149b8 <CSWTCH.69+0x638>
80407ddc:	24c00593          	li	a1,588
80407de0:	0000d517          	auipc	a0,0xd
80407de4:	0a850513          	addi	a0,a0,168 # 80414e88 <CSWTCH.69+0xb08>
80407de8:	83df80ef          	jal	ra,80400624 <__panic>
80407dec:	00090513          	mv	a0,s2
80407df0:	d25fc0ef          	jal	ra,80404b14 <exit_mmap>
80407df4:	00c92683          	lw	a3,12(s2)
80407df8:	804007b7          	lui	a5,0x80400
80407dfc:	08f6e663          	bltu	a3,a5,80407e88 <do_exit+0x20c>
80407e00:	00095797          	auipc	a5,0x95
80407e04:	a0078793          	addi	a5,a5,-1536 # 8049c800 <va_pa_offset>
80407e08:	0007a703          	lw	a4,0(a5)
80407e0c:	00095797          	auipc	a5,0x95
80407e10:	98c78793          	addi	a5,a5,-1652 # 8049c798 <npage>
80407e14:	0007a783          	lw	a5,0(a5)
80407e18:	40e686b3          	sub	a3,a3,a4
80407e1c:	00c6d693          	srli	a3,a3,0xc
80407e20:	08f6f063          	bgeu	a3,a5,80407ea0 <do_exit+0x224>
80407e24:	0000f797          	auipc	a5,0xf
80407e28:	8e478793          	addi	a5,a5,-1820 # 80416708 <nbase>
80407e2c:	0007a783          	lw	a5,0(a5)
80407e30:	00095717          	auipc	a4,0x95
80407e34:	9d870713          	addi	a4,a4,-1576 # 8049c808 <pages>
80407e38:	00072503          	lw	a0,0(a4)
80407e3c:	40f686b3          	sub	a3,a3,a5
80407e40:	00569693          	slli	a3,a3,0x5
80407e44:	00d50533          	add	a0,a0,a3
80407e48:	00100593          	li	a1,1
80407e4c:	fbdfa0ef          	jal	ra,80402e08 <free_pages>
80407e50:	00090513          	mv	a0,s2
80407e54:	a75fc0ef          	jal	ra,804048c8 <mm_destroy>
80407e58:	ea9ff06f          	j	80407d00 <do_exit+0x84>
80407e5c:	0000d617          	auipc	a2,0xd
80407e60:	b6c60613          	addi	a2,a2,-1172 # 804149c8 <CSWTCH.69+0x648>
80407e64:	24f00593          	li	a1,591
80407e68:	0000d517          	auipc	a0,0xd
80407e6c:	02050513          	addi	a0,a0,32 # 80414e88 <CSWTCH.69+0xb08>
80407e70:	fb4f80ef          	jal	ra,80400624 <__panic>
80407e74:	da9f80ef          	jal	ra,80400c1c <intr_disable>
80407e78:	00100a13          	li	s4,1
80407e7c:	eb5ff06f          	j	80407d30 <do_exit+0xb4>
80407e80:	5dd040ef          	jal	ra,8040cc5c <wakeup_proc>
80407e84:	ec5ff06f          	j	80407d48 <do_exit+0xcc>
80407e88:	0000c617          	auipc	a2,0xc
80407e8c:	bd860613          	addi	a2,a2,-1064 # 80413a60 <default_pmm_manager+0x64>
80407e90:	07000593          	li	a1,112
80407e94:	0000c517          	auipc	a0,0xc
80407e98:	bbc50513          	addi	a0,a0,-1092 # 80413a50 <default_pmm_manager+0x54>
80407e9c:	f88f80ef          	jal	ra,80400624 <__panic>
80407ea0:	0000c617          	auipc	a2,0xc
80407ea4:	be460613          	addi	a2,a2,-1052 # 80413a84 <default_pmm_manager+0x88>
80407ea8:	06900593          	li	a1,105
80407eac:	0000c517          	auipc	a0,0xc
80407eb0:	ba450513          	addi	a0,a0,-1116 # 80413a50 <default_pmm_manager+0x54>
80407eb4:	f70f80ef          	jal	ra,80400624 <__panic>

80407eb8 <do_wait.part.8>:
80407eb8:	fe010113          	addi	sp,sp,-32
80407ebc:	01412423          	sw	s4,8(sp)
80407ec0:	80000a37          	lui	s4,0x80000
80407ec4:	00912a23          	sw	s1,20(sp)
80407ec8:	01212823          	sw	s2,16(sp)
80407ecc:	01312623          	sw	s3,12(sp)
80407ed0:	01512223          	sw	s5,4(sp)
80407ed4:	01612023          	sw	s6,0(sp)
80407ed8:	00112e23          	sw	ra,28(sp)
80407edc:	00812c23          	sw	s0,24(sp)
80407ee0:	00050993          	mv	s3,a0
80407ee4:	00058b13          	mv	s6,a1
80407ee8:	00095917          	auipc	s2,0x95
80407eec:	8c490913          	addi	s2,s2,-1852 # 8049c7ac <current>
80407ef0:	00300493          	li	s1,3
80407ef4:	00100a93          	li	s5,1
80407ef8:	001a0a13          	addi	s4,s4,1 # 80000001 <end+0xffb63745>
80407efc:	04098663          	beqz	s3,80407f48 <do_wait.part.8+0x90>
80407f00:	00098513          	mv	a0,s3
80407f04:	e90ff0ef          	jal	ra,80407594 <find_proc>
80407f08:	00050413          	mv	s0,a0
80407f0c:	18050a63          	beqz	a0,804080a0 <do_wait.part.8+0x1e8>
80407f10:	00092703          	lw	a4,0(s2)
80407f14:	01452783          	lw	a5,20(a0)
80407f18:	18e79463          	bne	a5,a4,804080a0 <do_wait.part.8+0x1e8>
80407f1c:	00052783          	lw	a5,0(a0)
80407f20:	04978463          	beq	a5,s1,80407f68 <do_wait.part.8+0xb0>
80407f24:	01572023          	sw	s5,0(a4)
80407f28:	0b472423          	sw	s4,168(a4)
80407f2c:	62d040ef          	jal	ra,8040cd58 <schedule>
80407f30:	00092783          	lw	a5,0(s2)
80407f34:	05c7a783          	lw	a5,92(a5)
80407f38:	0017f793          	andi	a5,a5,1
80407f3c:	fc0780e3          	beqz	a5,80407efc <do_wait.part.8+0x44>
80407f40:	ff700513          	li	a0,-9
80407f44:	d39ff0ef          	jal	ra,80407c7c <do_exit>
80407f48:	00092703          	lw	a4,0(s2)
80407f4c:	0ac72403          	lw	s0,172(a4)
80407f50:	00041863          	bnez	s0,80407f60 <do_wait.part.8+0xa8>
80407f54:	14c0006f          	j	804080a0 <do_wait.part.8+0x1e8>
80407f58:	0b442403          	lw	s0,180(s0)
80407f5c:	fc0404e3          	beqz	s0,80407f24 <do_wait.part.8+0x6c>
80407f60:	00042783          	lw	a5,0(s0)
80407f64:	fe979ae3          	bne	a5,s1,80407f58 <do_wait.part.8+0xa0>
80407f68:	00095797          	auipc	a5,0x95
80407f6c:	84878793          	addi	a5,a5,-1976 # 8049c7b0 <idleproc>
80407f70:	0007a783          	lw	a5,0(a5)
80407f74:	14878063          	beq	a5,s0,804080b4 <do_wait.part.8+0x1fc>
80407f78:	00095797          	auipc	a5,0x95
80407f7c:	83c78793          	addi	a5,a5,-1988 # 8049c7b4 <initproc>
80407f80:	0007a783          	lw	a5,0(a5)
80407f84:	12f40863          	beq	s0,a5,804080b4 <do_wait.part.8+0x1fc>
80407f88:	000b0663          	beqz	s6,80407f94 <do_wait.part.8+0xdc>
80407f8c:	0a442783          	lw	a5,164(s0)
80407f90:	00fb2023          	sw	a5,0(s6)
80407f94:	100027f3          	csrr	a5,sstatus
80407f98:	0027f793          	andi	a5,a5,2
80407f9c:	00000593          	li	a1,0
80407fa0:	10079463          	bnez	a5,804080a8 <do_wait.part.8+0x1f0>
80407fa4:	09c42603          	lw	a2,156(s0)
80407fa8:	0a042683          	lw	a3,160(s0)
80407fac:	0b442703          	lw	a4,180(s0)
80407fb0:	0b042783          	lw	a5,176(s0)
80407fb4:	00d62223          	sw	a3,4(a2)
80407fb8:	00c6a023          	sw	a2,0(a3)
80407fbc:	09442603          	lw	a2,148(s0)
80407fc0:	09842683          	lw	a3,152(s0)
80407fc4:	00d62223          	sw	a3,4(a2)
80407fc8:	00c6a023          	sw	a2,0(a3)
80407fcc:	00070663          	beqz	a4,80407fd8 <do_wait.part.8+0x120>
80407fd0:	0af72823          	sw	a5,176(a4)
80407fd4:	0b042783          	lw	a5,176(s0)
80407fd8:	0a078e63          	beqz	a5,80408094 <do_wait.part.8+0x1dc>
80407fdc:	0ae7aa23          	sw	a4,180(a5)
80407fe0:	00094797          	auipc	a5,0x94
80407fe4:	7d878793          	addi	a5,a5,2008 # 8049c7b8 <nr_process>
80407fe8:	0007a783          	lw	a5,0(a5)
80407fec:	fff78793          	addi	a5,a5,-1
80407ff0:	00094717          	auipc	a4,0x94
80407ff4:	7cf72423          	sw	a5,1992(a4) # 8049c7b8 <nr_process>
80407ff8:	08059a63          	bnez	a1,8040808c <do_wait.part.8+0x1d4>
80407ffc:	00c42683          	lw	a3,12(s0)
80408000:	804007b7          	lui	a5,0x80400
80408004:	0ef6e063          	bltu	a3,a5,804080e4 <do_wait.part.8+0x22c>
80408008:	00094797          	auipc	a5,0x94
8040800c:	7f878793          	addi	a5,a5,2040 # 8049c800 <va_pa_offset>
80408010:	0007a703          	lw	a4,0(a5)
80408014:	00094797          	auipc	a5,0x94
80408018:	78478793          	addi	a5,a5,1924 # 8049c798 <npage>
8040801c:	0007a783          	lw	a5,0(a5)
80408020:	40e686b3          	sub	a3,a3,a4
80408024:	00c6d693          	srli	a3,a3,0xc
80408028:	0af6f263          	bgeu	a3,a5,804080cc <do_wait.part.8+0x214>
8040802c:	0000e797          	auipc	a5,0xe
80408030:	6dc78793          	addi	a5,a5,1756 # 80416708 <nbase>
80408034:	0007a783          	lw	a5,0(a5)
80408038:	00094717          	auipc	a4,0x94
8040803c:	7d070713          	addi	a4,a4,2000 # 8049c808 <pages>
80408040:	00072503          	lw	a0,0(a4)
80408044:	40f686b3          	sub	a3,a3,a5
80408048:	00569693          	slli	a3,a3,0x5
8040804c:	00d50533          	add	a0,a0,a3
80408050:	00200593          	li	a1,2
80408054:	db5fa0ef          	jal	ra,80402e08 <free_pages>
80408058:	00040513          	mv	a0,s0
8040805c:	a89fa0ef          	jal	ra,80402ae4 <kfree>
80408060:	00000513          	li	a0,0
80408064:	01c12083          	lw	ra,28(sp)
80408068:	01812403          	lw	s0,24(sp)
8040806c:	01412483          	lw	s1,20(sp)
80408070:	01012903          	lw	s2,16(sp)
80408074:	00c12983          	lw	s3,12(sp)
80408078:	00812a03          	lw	s4,8(sp)
8040807c:	00412a83          	lw	s5,4(sp)
80408080:	00012b03          	lw	s6,0(sp)
80408084:	02010113          	addi	sp,sp,32
80408088:	00008067          	ret
8040808c:	b89f80ef          	jal	ra,80400c14 <intr_enable>
80408090:	f6dff06f          	j	80407ffc <do_wait.part.8+0x144>
80408094:	01442783          	lw	a5,20(s0)
80408098:	0ae7a623          	sw	a4,172(a5)
8040809c:	f45ff06f          	j	80407fe0 <do_wait.part.8+0x128>
804080a0:	ffe00513          	li	a0,-2
804080a4:	fc1ff06f          	j	80408064 <do_wait.part.8+0x1ac>
804080a8:	b75f80ef          	jal	ra,80400c1c <intr_disable>
804080ac:	00100593          	li	a1,1
804080b0:	ef5ff06f          	j	80407fa4 <do_wait.part.8+0xec>
804080b4:	0000d617          	auipc	a2,0xd
804080b8:	9ac60613          	addi	a2,a2,-1620 # 80414a60 <CSWTCH.69+0x6e0>
804080bc:	3ef00593          	li	a1,1007
804080c0:	0000d517          	auipc	a0,0xd
804080c4:	dc850513          	addi	a0,a0,-568 # 80414e88 <CSWTCH.69+0xb08>
804080c8:	d5cf80ef          	jal	ra,80400624 <__panic>
804080cc:	0000c617          	auipc	a2,0xc
804080d0:	9b860613          	addi	a2,a2,-1608 # 80413a84 <default_pmm_manager+0x88>
804080d4:	06900593          	li	a1,105
804080d8:	0000c517          	auipc	a0,0xc
804080dc:	97850513          	addi	a0,a0,-1672 # 80413a50 <default_pmm_manager+0x54>
804080e0:	d44f80ef          	jal	ra,80400624 <__panic>
804080e4:	0000c617          	auipc	a2,0xc
804080e8:	97c60613          	addi	a2,a2,-1668 # 80413a60 <default_pmm_manager+0x64>
804080ec:	07000593          	li	a1,112
804080f0:	0000c517          	auipc	a0,0xc
804080f4:	96050513          	addi	a0,a0,-1696 # 80413a50 <default_pmm_manager+0x54>
804080f8:	d2cf80ef          	jal	ra,80400624 <__panic>

804080fc <init_main>:
804080fc:	6b7377b7          	lui	a5,0x6b737
80408100:	fe010113          	addi	sp,sp,-32
80408104:	96478793          	addi	a5,a5,-1692 # 6b736964 <_binary_bin_sfs_img_size+0x6b6be964>
80408108:	00f12423          	sw	a5,8(sp)
8040810c:	000047b7          	lui	a5,0x4
80408110:	a3078793          	addi	a5,a5,-1488 # 3a30 <_binary_bin_swap_img_size-0x45d0>
80408114:	00810513          	addi	a0,sp,8
80408118:	00112e23          	sw	ra,28(sp)
8040811c:	00f11623          	sh	a5,12(sp)
80408120:	00010723          	sb	zero,14(sp)
80408124:	08d050ef          	jal	ra,8040d9b0 <vfs_set_bootfs>
80408128:	0e051a63          	bnez	a0,8040821c <init_main+0x120>
8040812c:	d49fa0ef          	jal	ra,80402e74 <nr_free_pages>
80408130:	889fa0ef          	jal	ra,804029b8 <kallocated>
80408134:	00000613          	li	a2,0
80408138:	00000593          	li	a1,0
8040813c:	fffff517          	auipc	a0,0xfffff
80408140:	1ac50513          	addi	a0,a0,428 # 804072e8 <user_main>
80408144:	abdff0ef          	jal	ra,80407c00 <kernel_thread>
80408148:	00a04663          	bgtz	a0,80408154 <init_main+0x58>
8040814c:	0b80006f          	j	80408204 <init_main+0x108>
80408150:	409040ef          	jal	ra,8040cd58 <schedule>
80408154:	00000593          	li	a1,0
80408158:	00000513          	li	a0,0
8040815c:	d5dff0ef          	jal	ra,80407eb8 <do_wait.part.8>
80408160:	fe0508e3          	beqz	a0,80408150 <init_main+0x54>
80408164:	9d8fe0ef          	jal	ra,8040633c <fs_cleanup>
80408168:	0000d517          	auipc	a0,0xd
8040816c:	b2450513          	addi	a0,a0,-1244 # 80414c8c <CSWTCH.69+0x90c>
80408170:	88cf80ef          	jal	ra,804001fc <cprintf>
80408174:	00094797          	auipc	a5,0x94
80408178:	64078793          	addi	a5,a5,1600 # 8049c7b4 <initproc>
8040817c:	0007a783          	lw	a5,0(a5)
80408180:	0ac7a703          	lw	a4,172(a5)
80408184:	06071063          	bnez	a4,804081e4 <init_main+0xe8>
80408188:	0b07a703          	lw	a4,176(a5)
8040818c:	04071c63          	bnez	a4,804081e4 <init_main+0xe8>
80408190:	0b47a703          	lw	a4,180(a5)
80408194:	04071863          	bnez	a4,804081e4 <init_main+0xe8>
80408198:	00094717          	auipc	a4,0x94
8040819c:	62070713          	addi	a4,a4,1568 # 8049c7b8 <nr_process>
804081a0:	00072683          	lw	a3,0(a4)
804081a4:	00200713          	li	a4,2
804081a8:	0ce69863          	bne	a3,a4,80408278 <init_main+0x17c>
804081ac:	00094697          	auipc	a3,0x94
804081b0:	70868693          	addi	a3,a3,1800 # 8049c8b4 <proc_list>
804081b4:	0046a703          	lw	a4,4(a3)
804081b8:	09478793          	addi	a5,a5,148
804081bc:	08f71e63          	bne	a4,a5,80408258 <init_main+0x15c>
804081c0:	0006a783          	lw	a5,0(a3)
804081c4:	06f71a63          	bne	a4,a5,80408238 <init_main+0x13c>
804081c8:	0000d517          	auipc	a0,0xd
804081cc:	ba450513          	addi	a0,a0,-1116 # 80414d6c <CSWTCH.69+0x9ec>
804081d0:	82cf80ef          	jal	ra,804001fc <cprintf>
804081d4:	01c12083          	lw	ra,28(sp)
804081d8:	00000513          	li	a0,0
804081dc:	02010113          	addi	sp,sp,32
804081e0:	00008067          	ret
804081e4:	0000d697          	auipc	a3,0xd
804081e8:	acc68693          	addi	a3,a3,-1332 # 80414cb0 <CSWTCH.69+0x930>
804081ec:	0000b617          	auipc	a2,0xb
804081f0:	cdc60613          	addi	a2,a2,-804 # 80412ec8 <commands+0x1bc>
804081f4:	46300593          	li	a1,1123
804081f8:	0000d517          	auipc	a0,0xd
804081fc:	c9050513          	addi	a0,a0,-880 # 80414e88 <CSWTCH.69+0xb08>
80408200:	c24f80ef          	jal	ra,80400624 <__panic>
80408204:	0000d617          	auipc	a2,0xd
80408208:	a6c60613          	addi	a2,a2,-1428 # 80414c70 <CSWTCH.69+0x8f0>
8040820c:	45700593          	li	a1,1111
80408210:	0000d517          	auipc	a0,0xd
80408214:	c7850513          	addi	a0,a0,-904 # 80414e88 <CSWTCH.69+0xb08>
80408218:	c0cf80ef          	jal	ra,80400624 <__panic>
8040821c:	00050693          	mv	a3,a0
80408220:	0000d617          	auipc	a2,0xd
80408224:	a3460613          	addi	a2,a2,-1484 # 80414c54 <CSWTCH.69+0x8d4>
80408228:	44f00593          	li	a1,1103
8040822c:	0000d517          	auipc	a0,0xd
80408230:	c5c50513          	addi	a0,a0,-932 # 80414e88 <CSWTCH.69+0xb08>
80408234:	bf0f80ef          	jal	ra,80400624 <__panic>
80408238:	0000d697          	auipc	a3,0xd
8040823c:	b0468693          	addi	a3,a3,-1276 # 80414d3c <CSWTCH.69+0x9bc>
80408240:	0000b617          	auipc	a2,0xb
80408244:	c8860613          	addi	a2,a2,-888 # 80412ec8 <commands+0x1bc>
80408248:	46600593          	li	a1,1126
8040824c:	0000d517          	auipc	a0,0xd
80408250:	c3c50513          	addi	a0,a0,-964 # 80414e88 <CSWTCH.69+0xb08>
80408254:	bd0f80ef          	jal	ra,80400624 <__panic>
80408258:	0000d697          	auipc	a3,0xd
8040825c:	ab468693          	addi	a3,a3,-1356 # 80414d0c <CSWTCH.69+0x98c>
80408260:	0000b617          	auipc	a2,0xb
80408264:	c6860613          	addi	a2,a2,-920 # 80412ec8 <commands+0x1bc>
80408268:	46500593          	li	a1,1125
8040826c:	0000d517          	auipc	a0,0xd
80408270:	c1c50513          	addi	a0,a0,-996 # 80414e88 <CSWTCH.69+0xb08>
80408274:	bb0f80ef          	jal	ra,80400624 <__panic>
80408278:	0000d697          	auipc	a3,0xd
8040827c:	a8468693          	addi	a3,a3,-1404 # 80414cfc <CSWTCH.69+0x97c>
80408280:	0000b617          	auipc	a2,0xb
80408284:	c4860613          	addi	a2,a2,-952 # 80412ec8 <commands+0x1bc>
80408288:	46400593          	li	a1,1124
8040828c:	0000d517          	auipc	a0,0xd
80408290:	bfc50513          	addi	a0,a0,-1028 # 80414e88 <CSWTCH.69+0xb08>
80408294:	b90f80ef          	jal	ra,80400624 <__panic>

80408298 <do_execve>:
80408298:	e9010113          	addi	sp,sp,-368
8040829c:	15412c23          	sw	s4,344(sp)
804082a0:	00094a17          	auipc	s4,0x94
804082a4:	50ca0a13          	addi	s4,s4,1292 # 8049c7ac <current>
804082a8:	000a2683          	lw	a3,0(s4)
804082ac:	15612823          	sw	s6,336(sp)
804082b0:	16112623          	sw	ra,364(sp)
804082b4:	16812423          	sw	s0,360(sp)
804082b8:	16912223          	sw	s1,356(sp)
804082bc:	17212023          	sw	s2,352(sp)
804082c0:	15312e23          	sw	s3,348(sp)
804082c4:	15512a23          	sw	s5,340(sp)
804082c8:	15712623          	sw	s7,332(sp)
804082cc:	15812423          	sw	s8,328(sp)
804082d0:	15912223          	sw	s9,324(sp)
804082d4:	15a12023          	sw	s10,320(sp)
804082d8:	13b12e23          	sw	s11,316(sp)
804082dc:	fff58713          	addi	a4,a1,-1 # 7fffff <_binary_bin_sfs_img_size+0x787fff>
804082e0:	01f00793          	li	a5,31
804082e4:	0186ab03          	lw	s6,24(a3)
804082e8:	72e7ee63          	bltu	a5,a4,80408a24 <do_execve+0x78c>
804082ec:	00060d13          	mv	s10,a2
804082f0:	00050413          	mv	s0,a0
804082f4:	00058993          	mv	s3,a1
804082f8:	03300613          	li	a2,51
804082fc:	00000593          	li	a1,0
80408300:	04810513          	addi	a0,sp,72
80408304:	7940a0ef          	jal	ra,80412a98 <memset>
80408308:	000b0e63          	beqz	s6,80408324 <do_execve+0x8c>
8040830c:	01cb0513          	addi	a0,s6,28
80408310:	ec9fc0ef          	jal	ra,804051d8 <down>
80408314:	000a2783          	lw	a5,0(s4)
80408318:	00078663          	beqz	a5,80408324 <do_execve+0x8c>
8040831c:	0047a783          	lw	a5,4(a5)
80408320:	02fb2423          	sw	a5,40(s6)
80408324:	1e040863          	beqz	s0,80408514 <do_execve+0x27c>
80408328:	03300693          	li	a3,51
8040832c:	00040613          	mv	a2,s0
80408330:	04810593          	addi	a1,sp,72
80408334:	000b0513          	mv	a0,s6
80408338:	bb1fc0ef          	jal	ra,80404ee8 <copy_string>
8040833c:	060500e3          	beqz	a0,80408b9c <do_execve+0x904>
80408340:	00299493          	slli	s1,s3,0x2
80408344:	00000693          	li	a3,0
80408348:	00048613          	mv	a2,s1
8040834c:	000d0593          	mv	a1,s10
80408350:	000b0513          	mv	a0,s6
80408354:	000d0c13          	mv	s8,s10
80408358:	9fdfc0ef          	jal	ra,80404d54 <user_mem_check>
8040835c:	02050ae3          	beqz	a0,80408b90 <do_execve+0x8f8>
80408360:	0b010913          	addi	s2,sp,176
80408364:	00090c93          	mv	s9,s2
80408368:	00000413          	li	s0,0
8040836c:	00001537          	lui	a0,0x1
80408370:	e50fa0ef          	jal	ra,804029c0 <kmalloc>
80408374:	00050a93          	mv	s5,a0
80408378:	10050863          	beqz	a0,80408488 <do_execve+0x1f0>
8040837c:	000c2603          	lw	a2,0(s8)
80408380:	00050593          	mv	a1,a0
80408384:	000016b7          	lui	a3,0x1
80408388:	000b0513          	mv	a0,s6
8040838c:	b5dfc0ef          	jal	ra,80404ee8 <copy_string>
80408390:	16050a63          	beqz	a0,80408504 <do_execve+0x26c>
80408394:	015ca023          	sw	s5,0(s9)
80408398:	00140413          	addi	s0,s0,1
8040839c:	004c8c93          	addi	s9,s9,4
804083a0:	004c0c13          	addi	s8,s8,4
804083a4:	fc8994e3          	bne	s3,s0,8040836c <do_execve+0xd4>
804083a8:	000d2a83          	lw	s5,0(s10)
804083ac:	080b0c63          	beqz	s6,80408444 <do_execve+0x1ac>
804083b0:	01cb0513          	addi	a0,s6,28
804083b4:	e21fc0ef          	jal	ra,804051d4 <up>
804083b8:	000a2783          	lw	a5,0(s4)
804083bc:	020b2423          	sw	zero,40(s6)
804083c0:	0dc7a503          	lw	a0,220(a5)
804083c4:	8acfe0ef          	jal	ra,80406470 <files_closeall>
804083c8:	00000593          	li	a1,0
804083cc:	000a8513          	mv	a0,s5
804083d0:	c74fe0ef          	jal	ra,80406844 <sysfile_open>
804083d4:	00050c13          	mv	s8,a0
804083d8:	060544e3          	bltz	a0,80408c40 <do_execve+0x9a8>
804083dc:	00094797          	auipc	a5,0x94
804083e0:	42878793          	addi	a5,a5,1064 # 8049c804 <boot_cr3>
804083e4:	0007a783          	lw	a5,0(a5)
804083e8:	80000737          	lui	a4,0x80000
804083ec:	00c7d793          	srli	a5,a5,0xc
804083f0:	00e7e7b3          	or	a5,a5,a4
804083f4:	18079073          	csrw	satp,a5
804083f8:	12000073          	sfence.vma
804083fc:	018b2783          	lw	a5,24(s6)
80408400:	fff78793          	addi	a5,a5,-1
80408404:	00fb2c23          	sw	a5,24(s6)
80408408:	40078e63          	beqz	a5,80408824 <do_execve+0x58c>
8040840c:	000a2783          	lw	a5,0(s4)
80408410:	0007ac23          	sw	zero,24(a5)
80408414:	af0fc0ef          	jal	ra,80404704 <mm_create>
80408418:	00050b13          	mv	s6,a0
8040841c:	00050c63          	beqz	a0,80408434 <do_execve+0x19c>
80408420:	00c50513          	addi	a0,a0,12 # 100c <_binary_bin_swap_img_size-0x6ff4>
80408424:	f79fe0ef          	jal	ra,8040739c <setup_pgdir.isra.4>
80408428:	10050663          	beqz	a0,80408534 <do_execve+0x29c>
8040842c:	000b0513          	mv	a0,s6
80408430:	c98fc0ef          	jal	ra,804048c8 <mm_destroy>
80408434:	ffc00a93          	li	s5,-4
80408438:	ffc48413          	addi	s0,s1,-4
8040843c:	00890433          	add	s0,s2,s0
80408440:	5cc0006f          	j	80408a0c <do_execve+0x774>
80408444:	000a2783          	lw	a5,0(s4)
80408448:	0dc7a503          	lw	a0,220(a5)
8040844c:	824fe0ef          	jal	ra,80406470 <files_closeall>
80408450:	00000593          	li	a1,0
80408454:	000a8513          	mv	a0,s5
80408458:	becfe0ef          	jal	ra,80406844 <sysfile_open>
8040845c:	00050c13          	mv	s8,a0
80408460:	7e054063          	bltz	a0,80408c40 <do_execve+0x9a8>
80408464:	000a2783          	lw	a5,0(s4)
80408468:	0187a783          	lw	a5,24(a5)
8040846c:	fa0784e3          	beqz	a5,80408414 <do_execve+0x17c>
80408470:	0000c617          	auipc	a2,0xc
80408474:	36460613          	addi	a2,a2,868 # 804147d4 <CSWTCH.69+0x454>
80408478:	2aa00593          	li	a1,682
8040847c:	0000d517          	auipc	a0,0xd
80408480:	a0c50513          	addi	a0,a0,-1524 # 80414e88 <CSWTCH.69+0xb08>
80408484:	9a0f80ef          	jal	ra,80400624 <__panic>
80408488:	ffc00a93          	li	s5,-4
8040848c:	02040463          	beqz	s0,804084b4 <do_execve+0x21c>
80408490:	fff40413          	addi	s0,s0,-1
80408494:	00241413          	slli	s0,s0,0x2
80408498:	00890433          	add	s0,s2,s0
8040849c:	0080006f          	j	804084a4 <do_execve+0x20c>
804084a0:	00078413          	mv	s0,a5
804084a4:	00042503          	lw	a0,0(s0)
804084a8:	e3cfa0ef          	jal	ra,80402ae4 <kfree>
804084ac:	ffc40793          	addi	a5,s0,-4
804084b0:	fe8918e3          	bne	s2,s0,804084a0 <do_execve+0x208>
804084b4:	000b0863          	beqz	s6,804084c4 <do_execve+0x22c>
804084b8:	01cb0513          	addi	a0,s6,28
804084bc:	d19fc0ef          	jal	ra,804051d4 <up>
804084c0:	020b2423          	sw	zero,40(s6)
804084c4:	16c12083          	lw	ra,364(sp)
804084c8:	16812403          	lw	s0,360(sp)
804084cc:	000a8513          	mv	a0,s5
804084d0:	16412483          	lw	s1,356(sp)
804084d4:	16012903          	lw	s2,352(sp)
804084d8:	15c12983          	lw	s3,348(sp)
804084dc:	15812a03          	lw	s4,344(sp)
804084e0:	15412a83          	lw	s5,340(sp)
804084e4:	15012b03          	lw	s6,336(sp)
804084e8:	14c12b83          	lw	s7,332(sp)
804084ec:	14812c03          	lw	s8,328(sp)
804084f0:	14412c83          	lw	s9,324(sp)
804084f4:	14012d03          	lw	s10,320(sp)
804084f8:	13c12d83          	lw	s11,316(sp)
804084fc:	17010113          	addi	sp,sp,368
80408500:	00008067          	ret
80408504:	000a8513          	mv	a0,s5
80408508:	ddcfa0ef          	jal	ra,80402ae4 <kfree>
8040850c:	ffd00a93          	li	s5,-3
80408510:	f7dff06f          	j	8040848c <do_execve+0x1f4>
80408514:	000a2783          	lw	a5,0(s4)
80408518:	0000c617          	auipc	a2,0xc
8040851c:	2b060613          	addi	a2,a2,688 # 804147c8 <CSWTCH.69+0x448>
80408520:	03300593          	li	a1,51
80408524:	0047a683          	lw	a3,4(a5)
80408528:	04810513          	addi	a0,sp,72
8040852c:	4500a0ef          	jal	ra,8041297c <snprintf>
80408530:	e11ff06f          	j	80408340 <do_execve+0xa8>
80408534:	00000693          	li	a3,0
80408538:	03400613          	li	a2,52
8040853c:	07c10593          	addi	a1,sp,124
80408540:	000c0513          	mv	a0,s8
80408544:	d0dfe0ef          	jal	ra,80407250 <load_icode_read>
80408548:	00050a93          	mv	s5,a0
8040854c:	26051863          	bnez	a0,804087bc <do_execve+0x524>
80408550:	07c12703          	lw	a4,124(sp)
80408554:	464c47b7          	lui	a5,0x464c4
80408558:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644c57f>
8040855c:	24f71e63          	bne	a4,a5,804087b8 <do_execve+0x520>
80408560:	0a815783          	lhu	a5,168(sp)
80408564:	00012e23          	sw	zero,28(sp)
80408568:	04078c63          	beqz	a5,804085c0 <do_execve+0x328>
8040856c:	001007b7          	lui	a5,0x100
80408570:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
80408574:	00f12c23          	sw	a5,24(sp)
80408578:	01c12783          	lw	a5,28(sp)
8040857c:	09812683          	lw	a3,152(sp)
80408580:	02000613          	li	a2,32
80408584:	00579793          	slli	a5,a5,0x5
80408588:	00d786b3          	add	a3,a5,a3
8040858c:	02810593          	addi	a1,sp,40
80408590:	000c0513          	mv	a0,s8
80408594:	cbdfe0ef          	jal	ra,80407250 <load_icode_read>
80408598:	00050a93          	mv	s5,a0
8040859c:	44051663          	bnez	a0,804089e8 <do_execve+0x750>
804085a0:	02812703          	lw	a4,40(sp)
804085a4:	00100793          	li	a5,1
804085a8:	2ef70663          	beq	a4,a5,80408894 <do_execve+0x5fc>
804085ac:	01c12703          	lw	a4,28(sp)
804085b0:	0a815783          	lhu	a5,168(sp)
804085b4:	00170713          	addi	a4,a4,1 # 80000001 <end+0xffb63745>
804085b8:	00e12e23          	sw	a4,28(sp)
804085bc:	faf76ee3          	bltu	a4,a5,80408578 <do_execve+0x2e0>
804085c0:	000c0513          	mv	a0,s8
804085c4:	ad8fe0ef          	jal	ra,8040689c <sysfile_close>
804085c8:	00000713          	li	a4,0
804085cc:	00b00693          	li	a3,11
804085d0:	00100637          	lui	a2,0x100
804085d4:	7ff005b7          	lui	a1,0x7ff00
804085d8:	000b0513          	mv	a0,s6
804085dc:	b60fc0ef          	jal	ra,8040493c <mm_map>
804085e0:	00050a93          	mv	s5,a0
804085e4:	40051263          	bnez	a0,804089e8 <do_execve+0x750>
804085e8:	00cb2503          	lw	a0,12(s6)
804085ec:	01f00613          	li	a2,31
804085f0:	7ffff5b7          	lui	a1,0x7ffff
804085f4:	9e4fb0ef          	jal	ra,804037d8 <pgdir_alloc_page>
804085f8:	6e050063          	beqz	a0,80408cd8 <do_execve+0xa40>
804085fc:	00cb2503          	lw	a0,12(s6)
80408600:	01f00613          	li	a2,31
80408604:	7fffe5b7          	lui	a1,0x7fffe
80408608:	9d0fb0ef          	jal	ra,804037d8 <pgdir_alloc_page>
8040860c:	6a050663          	beqz	a0,80408cb8 <do_execve+0xa20>
80408610:	00cb2503          	lw	a0,12(s6)
80408614:	01f00613          	li	a2,31
80408618:	7fffd5b7          	lui	a1,0x7fffd
8040861c:	9bcfb0ef          	jal	ra,804037d8 <pgdir_alloc_page>
80408620:	66050c63          	beqz	a0,80408c98 <do_execve+0xa00>
80408624:	00cb2503          	lw	a0,12(s6)
80408628:	01f00613          	li	a2,31
8040862c:	7fffc5b7          	lui	a1,0x7fffc
80408630:	9a8fb0ef          	jal	ra,804037d8 <pgdir_alloc_page>
80408634:	64050263          	beqz	a0,80408c78 <do_execve+0x9e0>
80408638:	018b2783          	lw	a5,24(s6)
8040863c:	000a2703          	lw	a4,0(s4)
80408640:	00cb2683          	lw	a3,12(s6)
80408644:	00178793          	addi	a5,a5,1
80408648:	00fb2c23          	sw	a5,24(s6)
8040864c:	01672c23          	sw	s6,24(a4)
80408650:	804007b7          	lui	a5,0x80400
80408654:	5af6e063          	bltu	a3,a5,80408bf4 <do_execve+0x95c>
80408658:	00094797          	auipc	a5,0x94
8040865c:	1a878793          	addi	a5,a5,424 # 8049c800 <va_pa_offset>
80408660:	0007a783          	lw	a5,0(a5)
80408664:	40f686b3          	sub	a3,a3,a5
80408668:	00c6d793          	srli	a5,a3,0xc
8040866c:	04d72c23          	sw	a3,88(a4)
80408670:	80000737          	lui	a4,0x80000
80408674:	00e7e7b3          	or	a5,a5,a4
80408678:	18079073          	csrw	satp,a5
8040867c:	12000073          	sfence.vma
80408680:	00000b93          	li	s7,0
80408684:	00090c93          	mv	s9,s2
80408688:	00000c13          	li	s8,0
8040868c:	000ca503          	lw	a0,0(s9)
80408690:	000015b7          	lui	a1,0x1
80408694:	001c0c13          	addi	s8,s8,1
80408698:	34c0a0ef          	jal	ra,804129e4 <strnlen>
8040869c:	00150513          	addi	a0,a0,1
804086a0:	00ab8bb3          	add	s7,s7,a0
804086a4:	004c8c93          	addi	s9,s9,4
804086a8:	ff3c62e3          	bltu	s8,s3,8040868c <do_execve+0x3f4>
804086ac:	fffbcb93          	not	s7,s7
804086b0:	800007b7          	lui	a5,0x80000
804086b4:	ffcbfb93          	andi	s7,s7,-4
804086b8:	00fb8bb3          	add	s7,s7,a5
804086bc:	409b87b3          	sub	a5,s7,s1
804086c0:	00f12823          	sw	a5,16(sp)
804086c4:	412787b3          	sub	a5,a5,s2
804086c8:	00090d93          	mv	s11,s2
804086cc:	00000d13          	li	s10,0
804086d0:	00000c13          	li	s8,0
804086d4:	00f12623          	sw	a5,12(sp)
804086d8:	000dac83          	lw	s9,0(s11)
804086dc:	018b8533          	add	a0,s7,s8
804086e0:	001d0d13          	addi	s10,s10,1
804086e4:	000c8593          	mv	a1,s9
804086e8:	3380a0ef          	jal	ra,80412a20 <strcpy>
804086ec:	00c12783          	lw	a5,12(sp)
804086f0:	000015b7          	lui	a1,0x1
804086f4:	01b786b3          	add	a3,a5,s11
804086f8:	00a6a023          	sw	a0,0(a3) # 1000 <_binary_bin_swap_img_size-0x7000>
804086fc:	000c8513          	mv	a0,s9
80408700:	2e40a0ef          	jal	ra,804129e4 <strnlen>
80408704:	01850c33          	add	s8,a0,s8
80408708:	001c0c13          	addi	s8,s8,1
8040870c:	004d8d93          	addi	s11,s11,4
80408710:	fd3d64e3          	bltu	s10,s3,804086d8 <do_execve+0x440>
80408714:	000a2783          	lw	a5,0(s4)
80408718:	01012703          	lw	a4,16(sp)
8040871c:	09000613          	li	a2,144
80408720:	00000593          	li	a1,0
80408724:	fe872e23          	sw	s0,-4(a4) # 7ffffffc <end+0xffb63740>
80408728:	0547a403          	lw	s0,84(a5) # 80000054 <end+0xffb63798>
8040872c:	ffc70c93          	addi	s9,a4,-4
80408730:	00040513          	mv	a0,s0
80408734:	08042983          	lw	s3,128(s0)
80408738:	3600a0ef          	jal	ra,80412a98 <memset>
8040873c:	09412783          	lw	a5,148(sp)
80408740:	00cb2503          	lw	a0,12(s6)
80408744:	edf9f993          	andi	s3,s3,-289
80408748:	01942423          	sw	s9,8(s0)
8040874c:	08f42223          	sw	a5,132(s0)
80408750:	09342023          	sw	s3,128(s0)
80408754:	00000613          	li	a2,0
80408758:	008005b7          	lui	a1,0x800
8040875c:	f78fa0ef          	jal	ra,80402ed4 <get_pte>
80408760:	46050263          	beqz	a0,80408bc4 <do_execve+0x92c>
80408764:	00052683          	lw	a3,0(a0)
80408768:	000a2703          	lw	a4,0(s4)
8040876c:	0016f793          	andi	a5,a3,1
80408770:	00472583          	lw	a1,4(a4)
80408774:	44079e63          	bnez	a5,80408bd0 <do_execve+0x938>
80408778:	0000c517          	auipc	a0,0xc
8040877c:	21050513          	addi	a0,a0,528 # 80414988 <CSWTCH.69+0x608>
80408780:	a7df70ef          	jal	ra,804001fc <cprintf>
80408784:	12000073          	sfence.vma
80408788:	ffc48493          	addi	s1,s1,-4
8040878c:	009904b3          	add	s1,s2,s1
80408790:	0080006f          	j	80408798 <do_execve+0x500>
80408794:	00078493          	mv	s1,a5
80408798:	0004a503          	lw	a0,0(s1)
8040879c:	b48fa0ef          	jal	ra,80402ae4 <kfree>
804087a0:	ffc48793          	addi	a5,s1,-4
804087a4:	fe9918e3          	bne	s2,s1,80408794 <do_execve+0x4fc>
804087a8:	000a2503          	lw	a0,0(s4)
804087ac:	04810593          	addi	a1,sp,72
804087b0:	cf9fe0ef          	jal	ra,804074a8 <set_proc_name>
804087b4:	d11ff06f          	j	804084c4 <do_execve+0x22c>
804087b8:	ff800a93          	li	s5,-8
804087bc:	00cb2683          	lw	a3,12(s6)
804087c0:	804007b7          	lui	a5,0x80400
804087c4:	48f6e263          	bltu	a3,a5,80408c48 <do_execve+0x9b0>
804087c8:	00094797          	auipc	a5,0x94
804087cc:	03878793          	addi	a5,a5,56 # 8049c800 <va_pa_offset>
804087d0:	0007a703          	lw	a4,0(a5)
804087d4:	00094797          	auipc	a5,0x94
804087d8:	fc478793          	addi	a5,a5,-60 # 8049c798 <npage>
804087dc:	0007a783          	lw	a5,0(a5)
804087e0:	40e686b3          	sub	a3,a3,a4
804087e4:	00c6d693          	srli	a3,a3,0xc
804087e8:	46f6fc63          	bgeu	a3,a5,80408c60 <do_execve+0x9c8>
804087ec:	0000e797          	auipc	a5,0xe
804087f0:	f1c78793          	addi	a5,a5,-228 # 80416708 <nbase>
804087f4:	0007a783          	lw	a5,0(a5)
804087f8:	00094717          	auipc	a4,0x94
804087fc:	01070713          	addi	a4,a4,16 # 8049c808 <pages>
80408800:	00072503          	lw	a0,0(a4)
80408804:	40f686b3          	sub	a3,a3,a5
80408808:	00569693          	slli	a3,a3,0x5
8040880c:	00d50533          	add	a0,a0,a3
80408810:	00100593          	li	a1,1
80408814:	df4fa0ef          	jal	ra,80402e08 <free_pages>
80408818:	000b0513          	mv	a0,s6
8040881c:	8acfc0ef          	jal	ra,804048c8 <mm_destroy>
80408820:	c19ff06f          	j	80408438 <do_execve+0x1a0>
80408824:	000b0513          	mv	a0,s6
80408828:	aecfc0ef          	jal	ra,80404b14 <exit_mmap>
8040882c:	00cb2683          	lw	a3,12(s6)
80408830:	804007b7          	lui	a5,0x80400
80408834:	40f6ea63          	bltu	a3,a5,80408c48 <do_execve+0x9b0>
80408838:	00094797          	auipc	a5,0x94
8040883c:	fc878793          	addi	a5,a5,-56 # 8049c800 <va_pa_offset>
80408840:	0007a703          	lw	a4,0(a5)
80408844:	00094797          	auipc	a5,0x94
80408848:	f5478793          	addi	a5,a5,-172 # 8049c798 <npage>
8040884c:	0007a783          	lw	a5,0(a5)
80408850:	40e686b3          	sub	a3,a3,a4
80408854:	00c6d693          	srli	a3,a3,0xc
80408858:	40f6f463          	bgeu	a3,a5,80408c60 <do_execve+0x9c8>
8040885c:	0000e797          	auipc	a5,0xe
80408860:	eac78793          	addi	a5,a5,-340 # 80416708 <nbase>
80408864:	0007a783          	lw	a5,0(a5)
80408868:	00094717          	auipc	a4,0x94
8040886c:	fa070713          	addi	a4,a4,-96 # 8049c808 <pages>
80408870:	00072503          	lw	a0,0(a4)
80408874:	40f686b3          	sub	a3,a3,a5
80408878:	00569693          	slli	a3,a3,0x5
8040887c:	00d50533          	add	a0,a0,a3
80408880:	00100593          	li	a1,1
80408884:	d84fa0ef          	jal	ra,80402e08 <free_pages>
80408888:	000b0513          	mv	a0,s6
8040888c:	83cfc0ef          	jal	ra,804048c8 <mm_destroy>
80408890:	b7dff06f          	j	8040840c <do_execve+0x174>
80408894:	03c12603          	lw	a2,60(sp)
80408898:	03812783          	lw	a5,56(sp)
8040889c:	32f66063          	bltu	a2,a5,80408bbc <do_execve+0x924>
804088a0:	04012783          	lw	a5,64(sp)
804088a4:	0017f693          	andi	a3,a5,1
804088a8:	00068463          	beqz	a3,804088b0 <do_execve+0x618>
804088ac:	00400693          	li	a3,4
804088b0:	0027f713          	andi	a4,a5,2
804088b4:	0047f793          	andi	a5,a5,4
804088b8:	12071e63          	bnez	a4,804089f4 <do_execve+0x75c>
804088bc:	01100713          	li	a4,17
804088c0:	00e12a23          	sw	a4,20(sp)
804088c4:	00078863          	beqz	a5,804088d4 <do_execve+0x63c>
804088c8:	01300793          	li	a5,19
804088cc:	0016e693          	ori	a3,a3,1
804088d0:	00f12a23          	sw	a5,20(sp)
804088d4:	0026f793          	andi	a5,a3,2
804088d8:	12079263          	bnez	a5,804089fc <do_execve+0x764>
804088dc:	0046f793          	andi	a5,a3,4
804088e0:	00078863          	beqz	a5,804088f0 <do_execve+0x658>
804088e4:	01412783          	lw	a5,20(sp)
804088e8:	0087e793          	ori	a5,a5,8
804088ec:	00f12a23          	sw	a5,20(sp)
804088f0:	03012583          	lw	a1,48(sp)
804088f4:	00000713          	li	a4,0
804088f8:	000b0513          	mv	a0,s6
804088fc:	840fc0ef          	jal	ra,8040493c <mm_map>
80408900:	00050a93          	mv	s5,a0
80408904:	0e051263          	bnez	a0,804089e8 <do_execve+0x750>
80408908:	03012d83          	lw	s11,48(sp)
8040890c:	03812783          	lw	a5,56(sp)
80408910:	fffff737          	lui	a4,0xfffff
80408914:	02c12c83          	lw	s9,44(sp)
80408918:	00fd87b3          	add	a5,s11,a5
8040891c:	00f12623          	sw	a5,12(sp)
80408920:	00edfd33          	and	s10,s11,a4
80408924:	0afde463          	bltu	s11,a5,804089cc <do_execve+0x734>
80408928:	28c0006f          	j	80408bb4 <do_execve+0x91c>
8040892c:	000017b7          	lui	a5,0x1
80408930:	41ad85b3          	sub	a1,s11,s10
80408934:	00fd0d33          	add	s10,s10,a5
80408938:	00c12783          	lw	a5,12(sp)
8040893c:	41bd08b3          	sub	a7,s10,s11
80408940:	01a7f463          	bgeu	a5,s10,80408948 <do_execve+0x6b0>
80408944:	41b788b3          	sub	a7,a5,s11
80408948:	00094797          	auipc	a5,0x94
8040894c:	ec078793          	addi	a5,a5,-320 # 8049c808 <pages>
80408950:	0007a783          	lw	a5,0(a5)
80408954:	0000e717          	auipc	a4,0xe
80408958:	db470713          	addi	a4,a4,-588 # 80416708 <nbase>
8040895c:	00072603          	lw	a2,0(a4)
80408960:	00094717          	auipc	a4,0x94
80408964:	e3870713          	addi	a4,a4,-456 # 8049c798 <npage>
80408968:	00072683          	lw	a3,0(a4)
8040896c:	40fb87b3          	sub	a5,s7,a5
80408970:	01812703          	lw	a4,24(sp)
80408974:	4057d793          	srai	a5,a5,0x5
80408978:	00c787b3          	add	a5,a5,a2
8040897c:	00e7f633          	and	a2,a5,a4
80408980:	00c79793          	slli	a5,a5,0xc
80408984:	2ad67063          	bgeu	a2,a3,80408c24 <do_execve+0x98c>
80408988:	00094717          	auipc	a4,0x94
8040898c:	e7870713          	addi	a4,a4,-392 # 8049c800 <va_pa_offset>
80408990:	00072503          	lw	a0,0(a4)
80408994:	000c8693          	mv	a3,s9
80408998:	00088613          	mv	a2,a7
8040899c:	00a787b3          	add	a5,a5,a0
804089a0:	00b785b3          	add	a1,a5,a1
804089a4:	000c0513          	mv	a0,s8
804089a8:	01112823          	sw	a7,16(sp)
804089ac:	8a5fe0ef          	jal	ra,80407250 <load_icode_read>
804089b0:	00050a93          	mv	s5,a0
804089b4:	02051a63          	bnez	a0,804089e8 <do_execve+0x750>
804089b8:	01012883          	lw	a7,16(sp)
804089bc:	00c12783          	lw	a5,12(sp)
804089c0:	011d8db3          	add	s11,s11,a7
804089c4:	011c8cb3          	add	s9,s9,a7
804089c8:	06fdf263          	bgeu	s11,a5,80408a2c <do_execve+0x794>
804089cc:	00cb2503          	lw	a0,12(s6)
804089d0:	01412603          	lw	a2,20(sp)
804089d4:	000d0593          	mv	a1,s10
804089d8:	e01fa0ef          	jal	ra,804037d8 <pgdir_alloc_page>
804089dc:	00050b93          	mv	s7,a0
804089e0:	f40516e3          	bnez	a0,8040892c <do_execve+0x694>
804089e4:	ffc00a93          	li	s5,-4
804089e8:	000b0513          	mv	a0,s6
804089ec:	928fc0ef          	jal	ra,80404b14 <exit_mmap>
804089f0:	dcdff06f          	j	804087bc <do_execve+0x524>
804089f4:	0026e693          	ori	a3,a3,2
804089f8:	ec0798e3          	bnez	a5,804088c8 <do_execve+0x630>
804089fc:	01700793          	li	a5,23
80408a00:	00f12a23          	sw	a5,20(sp)
80408a04:	ed9ff06f          	j	804088dc <do_execve+0x644>
80408a08:	00078413          	mv	s0,a5
80408a0c:	00042503          	lw	a0,0(s0)
80408a10:	8d4fa0ef          	jal	ra,80402ae4 <kfree>
80408a14:	ffc40793          	addi	a5,s0,-4
80408a18:	fe8918e3          	bne	s2,s0,80408a08 <do_execve+0x770>
80408a1c:	000a8513          	mv	a0,s5
80408a20:	a5cff0ef          	jal	ra,80407c7c <do_exit>
80408a24:	ffd00a93          	li	s5,-3
80408a28:	a9dff06f          	j	804084c4 <do_execve+0x22c>
80408a2c:	03012783          	lw	a5,48(sp)
80408a30:	03c12a83          	lw	s5,60(sp)
80408a34:	01578ab3          	add	s5,a5,s5
80408a38:	0badfa63          	bgeu	s11,s10,80408aec <do_execve+0x854>
80408a3c:	b7ba88e3          	beq	s5,s11,804085ac <do_execve+0x314>
80408a40:	00001537          	lui	a0,0x1
80408a44:	00ad8533          	add	a0,s11,a0
80408a48:	41a50533          	sub	a0,a0,s10
80408a4c:	41ba8cb3          	sub	s9,s5,s11
80408a50:	01aae463          	bltu	s5,s10,80408a58 <do_execve+0x7c0>
80408a54:	41bd0cb3          	sub	s9,s10,s11
80408a58:	00094797          	auipc	a5,0x94
80408a5c:	db078793          	addi	a5,a5,-592 # 8049c808 <pages>
80408a60:	0007a783          	lw	a5,0(a5)
80408a64:	0000e717          	auipc	a4,0xe
80408a68:	ca470713          	addi	a4,a4,-860 # 80416708 <nbase>
80408a6c:	00072683          	lw	a3,0(a4)
80408a70:	00094717          	auipc	a4,0x94
80408a74:	d2870713          	addi	a4,a4,-728 # 8049c798 <npage>
80408a78:	00072603          	lw	a2,0(a4)
80408a7c:	40fb87b3          	sub	a5,s7,a5
80408a80:	01812703          	lw	a4,24(sp)
80408a84:	4057d793          	srai	a5,a5,0x5
80408a88:	00d787b3          	add	a5,a5,a3
80408a8c:	00e7f5b3          	and	a1,a5,a4
80408a90:	00c79693          	slli	a3,a5,0xc
80408a94:	16c5fc63          	bgeu	a1,a2,80408c0c <do_execve+0x974>
80408a98:	00094797          	auipc	a5,0x94
80408a9c:	d6878793          	addi	a5,a5,-664 # 8049c800 <va_pa_offset>
80408aa0:	0007a783          	lw	a5,0(a5)
80408aa4:	000c8613          	mv	a2,s9
80408aa8:	00000593          	li	a1,0
80408aac:	00f687b3          	add	a5,a3,a5
80408ab0:	00a78533          	add	a0,a5,a0
80408ab4:	7e5090ef          	jal	ra,80412a98 <memset>
80408ab8:	01bc8833          	add	a6,s9,s11
80408abc:	03aaf463          	bgeu	s5,s10,80408ae4 <do_execve+0x84c>
80408ac0:	af0a86e3          	beq	s5,a6,804085ac <do_execve+0x314>
80408ac4:	0000c697          	auipc	a3,0xc
80408ac8:	d3868693          	addi	a3,a3,-712 # 804147fc <CSWTCH.69+0x47c>
80408acc:	0000a617          	auipc	a2,0xa
80408ad0:	3fc60613          	addi	a2,a2,1020 # 80412ec8 <commands+0x1bc>
80408ad4:	30100593          	li	a1,769
80408ad8:	0000c517          	auipc	a0,0xc
80408adc:	3b050513          	addi	a0,a0,944 # 80414e88 <CSWTCH.69+0xb08>
80408ae0:	b45f70ef          	jal	ra,80400624 <__panic>
80408ae4:	ffa810e3          	bne	a6,s10,80408ac4 <do_execve+0x82c>
80408ae8:	000d0d93          	mv	s11,s10
80408aec:	00094c97          	auipc	s9,0x94
80408af0:	d14c8c93          	addi	s9,s9,-748 # 8049c800 <va_pa_offset>
80408af4:	075dee63          	bltu	s11,s5,80408b70 <do_execve+0x8d8>
80408af8:	ab5ff06f          	j	804085ac <do_execve+0x314>
80408afc:	000017b7          	lui	a5,0x1
80408b00:	41ad8533          	sub	a0,s11,s10
80408b04:	00fd0d33          	add	s10,s10,a5
80408b08:	41bd0633          	sub	a2,s10,s11
80408b0c:	01aaf463          	bgeu	s5,s10,80408b14 <do_execve+0x87c>
80408b10:	41ba8633          	sub	a2,s5,s11
80408b14:	00094797          	auipc	a5,0x94
80408b18:	cf478793          	addi	a5,a5,-780 # 8049c808 <pages>
80408b1c:	0007a683          	lw	a3,0(a5)
80408b20:	0000e797          	auipc	a5,0xe
80408b24:	be878793          	addi	a5,a5,-1048 # 80416708 <nbase>
80408b28:	0007a583          	lw	a1,0(a5)
80408b2c:	40db86b3          	sub	a3,s7,a3
80408b30:	00094797          	auipc	a5,0x94
80408b34:	c6878793          	addi	a5,a5,-920 # 8049c798 <npage>
80408b38:	01812703          	lw	a4,24(sp)
80408b3c:	4056d693          	srai	a3,a3,0x5
80408b40:	0007a783          	lw	a5,0(a5)
80408b44:	00b686b3          	add	a3,a3,a1
80408b48:	00e6f5b3          	and	a1,a3,a4
80408b4c:	00c69693          	slli	a3,a3,0xc
80408b50:	0af5fe63          	bgeu	a1,a5,80408c0c <do_execve+0x974>
80408b54:	000ca783          	lw	a5,0(s9)
80408b58:	00cd8db3          	add	s11,s11,a2
80408b5c:	00000593          	li	a1,0
80408b60:	00f686b3          	add	a3,a3,a5
80408b64:	00a68533          	add	a0,a3,a0
80408b68:	731090ef          	jal	ra,80412a98 <memset>
80408b6c:	a55df0e3          	bgeu	s11,s5,804085ac <do_execve+0x314>
80408b70:	00cb2503          	lw	a0,12(s6)
80408b74:	01412603          	lw	a2,20(sp)
80408b78:	000d0593          	mv	a1,s10
80408b7c:	c5dfa0ef          	jal	ra,804037d8 <pgdir_alloc_page>
80408b80:	00050b93          	mv	s7,a0
80408b84:	f6051ce3          	bnez	a0,80408afc <do_execve+0x864>
80408b88:	ffc00a93          	li	s5,-4
80408b8c:	e5dff06f          	j	804089e8 <do_execve+0x750>
80408b90:	ffd00a93          	li	s5,-3
80408b94:	920b12e3          	bnez	s6,804084b8 <do_execve+0x220>
80408b98:	92dff06f          	j	804084c4 <do_execve+0x22c>
80408b9c:	e80b04e3          	beqz	s6,80408a24 <do_execve+0x78c>
80408ba0:	01cb0513          	addi	a0,s6,28
80408ba4:	e30fc0ef          	jal	ra,804051d4 <up>
80408ba8:	ffd00a93          	li	s5,-3
80408bac:	020b2423          	sw	zero,40(s6)
80408bb0:	915ff06f          	j	804084c4 <do_execve+0x22c>
80408bb4:	000d8793          	mv	a5,s11
80408bb8:	e79ff06f          	j	80408a30 <do_execve+0x798>
80408bbc:	ff800a93          	li	s5,-8
80408bc0:	e29ff06f          	j	804089e8 <do_execve+0x750>
80408bc4:	000a2783          	lw	a5,0(s4)
80408bc8:	0047a583          	lw	a1,4(a5)
80408bcc:	badff06f          	j	80408778 <do_execve+0x4e0>
80408bd0:	09412783          	lw	a5,148(sp)
80408bd4:	00269613          	slli	a2,a3,0x2
80408bd8:	fffff737          	lui	a4,0xfffff
80408bdc:	00e67733          	and	a4,a2,a4
80408be0:	0000c517          	auipc	a0,0xc
80408be4:	d6850513          	addi	a0,a0,-664 # 80414948 <CSWTCH.69+0x5c8>
80408be8:	00800637          	lui	a2,0x800
80408bec:	e10f70ef          	jal	ra,804001fc <cprintf>
80408bf0:	b95ff06f          	j	80408784 <do_execve+0x4ec>
80408bf4:	0000b617          	auipc	a2,0xb
80408bf8:	e6c60613          	addi	a2,a2,-404 # 80413a60 <default_pmm_manager+0x64>
80408bfc:	31d00593          	li	a1,797
80408c00:	0000c517          	auipc	a0,0xc
80408c04:	28850513          	addi	a0,a0,648 # 80414e88 <CSWTCH.69+0xb08>
80408c08:	a1df70ef          	jal	ra,80400624 <__panic>
80408c0c:	0000b617          	auipc	a2,0xb
80408c10:	e2060613          	addi	a2,a2,-480 # 80413a2c <default_pmm_manager+0x30>
80408c14:	06e00593          	li	a1,110
80408c18:	0000b517          	auipc	a0,0xb
80408c1c:	e3850513          	addi	a0,a0,-456 # 80413a50 <default_pmm_manager+0x54>
80408c20:	a05f70ef          	jal	ra,80400624 <__panic>
80408c24:	00078693          	mv	a3,a5
80408c28:	0000b617          	auipc	a2,0xb
80408c2c:	e0460613          	addi	a2,a2,-508 # 80413a2c <default_pmm_manager+0x30>
80408c30:	06e00593          	li	a1,110
80408c34:	0000b517          	auipc	a0,0xb
80408c38:	e1c50513          	addi	a0,a0,-484 # 80413a50 <default_pmm_manager+0x54>
80408c3c:	9e9f70ef          	jal	ra,80400624 <__panic>
80408c40:	000c0a93          	mv	s5,s8
80408c44:	ff4ff06f          	j	80408438 <do_execve+0x1a0>
80408c48:	0000b617          	auipc	a2,0xb
80408c4c:	e1860613          	addi	a2,a2,-488 # 80413a60 <default_pmm_manager+0x64>
80408c50:	07000593          	li	a1,112
80408c54:	0000b517          	auipc	a0,0xb
80408c58:	dfc50513          	addi	a0,a0,-516 # 80413a50 <default_pmm_manager+0x54>
80408c5c:	9c9f70ef          	jal	ra,80400624 <__panic>
80408c60:	0000b617          	auipc	a2,0xb
80408c64:	e2460613          	addi	a2,a2,-476 # 80413a84 <default_pmm_manager+0x88>
80408c68:	06900593          	li	a1,105
80408c6c:	0000b517          	auipc	a0,0xb
80408c70:	de450513          	addi	a0,a0,-540 # 80413a50 <default_pmm_manager+0x54>
80408c74:	9b1f70ef          	jal	ra,80400624 <__panic>
80408c78:	0000c697          	auipc	a3,0xc
80408c7c:	c8c68693          	addi	a3,a3,-884 # 80414904 <CSWTCH.69+0x584>
80408c80:	0000a617          	auipc	a2,0xa
80408c84:	24860613          	addi	a2,a2,584 # 80412ec8 <commands+0x1bc>
80408c88:	31900593          	li	a1,793
80408c8c:	0000c517          	auipc	a0,0xc
80408c90:	1fc50513          	addi	a0,a0,508 # 80414e88 <CSWTCH.69+0xb08>
80408c94:	991f70ef          	jal	ra,80400624 <__panic>
80408c98:	0000c697          	auipc	a3,0xc
80408c9c:	c2868693          	addi	a3,a3,-984 # 804148c0 <CSWTCH.69+0x540>
80408ca0:	0000a617          	auipc	a2,0xa
80408ca4:	22860613          	addi	a2,a2,552 # 80412ec8 <commands+0x1bc>
80408ca8:	31800593          	li	a1,792
80408cac:	0000c517          	auipc	a0,0xc
80408cb0:	1dc50513          	addi	a0,a0,476 # 80414e88 <CSWTCH.69+0xb08>
80408cb4:	971f70ef          	jal	ra,80400624 <__panic>
80408cb8:	0000c697          	auipc	a3,0xc
80408cbc:	bc468693          	addi	a3,a3,-1084 # 8041487c <CSWTCH.69+0x4fc>
80408cc0:	0000a617          	auipc	a2,0xa
80408cc4:	20860613          	addi	a2,a2,520 # 80412ec8 <commands+0x1bc>
80408cc8:	31700593          	li	a1,791
80408ccc:	0000c517          	auipc	a0,0xc
80408cd0:	1bc50513          	addi	a0,a0,444 # 80414e88 <CSWTCH.69+0xb08>
80408cd4:	951f70ef          	jal	ra,80400624 <__panic>
80408cd8:	0000c697          	auipc	a3,0xc
80408cdc:	b6068693          	addi	a3,a3,-1184 # 80414838 <CSWTCH.69+0x4b8>
80408ce0:	0000a617          	auipc	a2,0xa
80408ce4:	1e860613          	addi	a2,a2,488 # 80412ec8 <commands+0x1bc>
80408ce8:	31600593          	li	a1,790
80408cec:	0000c517          	auipc	a0,0xc
80408cf0:	19c50513          	addi	a0,a0,412 # 80414e88 <CSWTCH.69+0xb08>
80408cf4:	931f70ef          	jal	ra,80400624 <__panic>

80408cf8 <do_yield>:
80408cf8:	00094797          	auipc	a5,0x94
80408cfc:	ab478793          	addi	a5,a5,-1356 # 8049c7ac <current>
80408d00:	0007a783          	lw	a5,0(a5)
80408d04:	00100713          	li	a4,1
80408d08:	00000513          	li	a0,0
80408d0c:	00e7a823          	sw	a4,16(a5)
80408d10:	00008067          	ret

80408d14 <do_wait>:
80408d14:	ff010113          	addi	sp,sp,-16
80408d18:	00812423          	sw	s0,8(sp)
80408d1c:	00912223          	sw	s1,4(sp)
80408d20:	00112623          	sw	ra,12(sp)
80408d24:	00058413          	mv	s0,a1
80408d28:	00050493          	mv	s1,a0
80408d2c:	02058263          	beqz	a1,80408d50 <do_wait+0x3c>
80408d30:	00094797          	auipc	a5,0x94
80408d34:	a7c78793          	addi	a5,a5,-1412 # 8049c7ac <current>
80408d38:	0007a783          	lw	a5,0(a5)
80408d3c:	00100693          	li	a3,1
80408d40:	00400613          	li	a2,4
80408d44:	0187a503          	lw	a0,24(a5)
80408d48:	80cfc0ef          	jal	ra,80404d54 <user_mem_check>
80408d4c:	02050063          	beqz	a0,80408d6c <do_wait+0x58>
80408d50:	00040593          	mv	a1,s0
80408d54:	00812403          	lw	s0,8(sp)
80408d58:	00c12083          	lw	ra,12(sp)
80408d5c:	00048513          	mv	a0,s1
80408d60:	00412483          	lw	s1,4(sp)
80408d64:	01010113          	addi	sp,sp,16
80408d68:	950ff06f          	j	80407eb8 <do_wait.part.8>
80408d6c:	00c12083          	lw	ra,12(sp)
80408d70:	00812403          	lw	s0,8(sp)
80408d74:	00412483          	lw	s1,4(sp)
80408d78:	ffd00513          	li	a0,-3
80408d7c:	01010113          	addi	sp,sp,16
80408d80:	00008067          	ret

80408d84 <do_kill>:
80408d84:	ff010113          	addi	sp,sp,-16
80408d88:	00112623          	sw	ra,12(sp)
80408d8c:	00812423          	sw	s0,8(sp)
80408d90:	805fe0ef          	jal	ra,80407594 <find_proc>
80408d94:	04050c63          	beqz	a0,80408dec <do_kill+0x68>
80408d98:	05c52703          	lw	a4,92(a0)
80408d9c:	00177693          	andi	a3,a4,1
80408da0:	04069263          	bnez	a3,80408de4 <do_kill+0x60>
80408da4:	0a852683          	lw	a3,168(a0)
80408da8:	00176713          	ori	a4,a4,1
80408dac:	04e52e23          	sw	a4,92(a0)
80408db0:	00000413          	li	s0,0
80408db4:	0006cc63          	bltz	a3,80408dcc <do_kill+0x48>
80408db8:	00040513          	mv	a0,s0
80408dbc:	00c12083          	lw	ra,12(sp)
80408dc0:	00812403          	lw	s0,8(sp)
80408dc4:	01010113          	addi	sp,sp,16
80408dc8:	00008067          	ret
80408dcc:	691030ef          	jal	ra,8040cc5c <wakeup_proc>
80408dd0:	00040513          	mv	a0,s0
80408dd4:	00c12083          	lw	ra,12(sp)
80408dd8:	00812403          	lw	s0,8(sp)
80408ddc:	01010113          	addi	sp,sp,16
80408de0:	00008067          	ret
80408de4:	ff700413          	li	s0,-9
80408de8:	fd1ff06f          	j	80408db8 <do_kill+0x34>
80408dec:	ffd00413          	li	s0,-3
80408df0:	fc9ff06f          	j	80408db8 <do_kill+0x34>

80408df4 <proc_init>:
80408df4:	00002737          	lui	a4,0x2
80408df8:	00094797          	auipc	a5,0x94
80408dfc:	abc78793          	addi	a5,a5,-1348 # 8049c8b4 <proc_list>
80408e00:	ff010113          	addi	sp,sp,-16
80408e04:	00090697          	auipc	a3,0x90
80408e08:	24e6a023          	sw	a4,576(a3) # 80499044 <last_pid>
80408e0c:	00090697          	auipc	a3,0x90
80408e10:	22e6ae23          	sw	a4,572(a3) # 80499048 <next_safe>
80408e14:	00094717          	auipc	a4,0x94
80408e18:	aaf72223          	sw	a5,-1372(a4) # 8049c8b8 <proc_list+0x4>
80408e1c:	00094717          	auipc	a4,0x94
80408e20:	a8f72c23          	sw	a5,-1384(a4) # 8049c8b4 <proc_list>
80408e24:	00112623          	sw	ra,12(sp)
80408e28:	00812423          	sw	s0,8(sp)
80408e2c:	00912223          	sw	s1,4(sp)
80408e30:	01212023          	sw	s2,0(sp)
80408e34:	00091797          	auipc	a5,0x91
80408e38:	91478793          	addi	a5,a5,-1772 # 80499748 <hash_list>
80408e3c:	00093717          	auipc	a4,0x93
80408e40:	90c70713          	addi	a4,a4,-1780 # 8049b748 <__rq>
80408e44:	00f7a223          	sw	a5,4(a5)
80408e48:	00f7a023          	sw	a5,0(a5)
80408e4c:	00878793          	addi	a5,a5,8
80408e50:	fee79ae3          	bne	a5,a4,80408e44 <proc_init+0x50>
80408e54:	960fe0ef          	jal	ra,80406fb4 <alloc_proc>
80408e58:	00094797          	auipc	a5,0x94
80408e5c:	94a7ac23          	sw	a0,-1704(a5) # 8049c7b0 <idleproc>
80408e60:	00050413          	mv	s0,a0
80408e64:	00094497          	auipc	s1,0x94
80408e68:	94c48493          	addi	s1,s1,-1716 # 8049c7b0 <idleproc>
80408e6c:	0e050263          	beqz	a0,80408f50 <proc_init+0x15c>
80408e70:	00200793          	li	a5,2
80408e74:	00f52023          	sw	a5,0(a0)
80408e78:	00100913          	li	s2,1
80408e7c:	0000e797          	auipc	a5,0xe
80408e80:	18478793          	addi	a5,a5,388 # 80417000 <bootstack>
80408e84:	00052223          	sw	zero,4(a0)
80408e88:	00f52623          	sw	a5,12(a0)
80408e8c:	01252823          	sw	s2,16(a0)
80408e90:	cc0fd0ef          	jal	ra,80406350 <files_create>
80408e94:	0ca42e23          	sw	a0,220(s0)
80408e98:	12050463          	beqz	a0,80408fc0 <proc_init+0x1cc>
80408e9c:	0004a503          	lw	a0,0(s1)
80408ea0:	0000c597          	auipc	a1,0xc
80408ea4:	f2458593          	addi	a1,a1,-220 # 80414dc4 <CSWTCH.69+0xa44>
80408ea8:	0dc52703          	lw	a4,220(a0)
80408eac:	00872783          	lw	a5,8(a4)
80408eb0:	00178793          	addi	a5,a5,1
80408eb4:	00f72423          	sw	a5,8(a4)
80408eb8:	df0fe0ef          	jal	ra,804074a8 <set_proc_name>
80408ebc:	00094797          	auipc	a5,0x94
80408ec0:	8fc78793          	addi	a5,a5,-1796 # 8049c7b8 <nr_process>
80408ec4:	0007a783          	lw	a5,0(a5)
80408ec8:	0004a703          	lw	a4,0(s1)
80408ecc:	00000613          	li	a2,0
80408ed0:	00178793          	addi	a5,a5,1
80408ed4:	00000593          	li	a1,0
80408ed8:	fffff517          	auipc	a0,0xfffff
80408edc:	22450513          	addi	a0,a0,548 # 804080fc <init_main>
80408ee0:	00094697          	auipc	a3,0x94
80408ee4:	8cf6ac23          	sw	a5,-1832(a3) # 8049c7b8 <nr_process>
80408ee8:	00094797          	auipc	a5,0x94
80408eec:	8ce7a223          	sw	a4,-1852(a5) # 8049c7ac <current>
80408ef0:	d11fe0ef          	jal	ra,80407c00 <kernel_thread>
80408ef4:	0aa05a63          	blez	a0,80408fa8 <proc_init+0x1b4>
80408ef8:	e9cfe0ef          	jal	ra,80407594 <find_proc>
80408efc:	0000c597          	auipc	a1,0xc
80408f00:	eec58593          	addi	a1,a1,-276 # 80414de8 <CSWTCH.69+0xa68>
80408f04:	00094797          	auipc	a5,0x94
80408f08:	8aa7a823          	sw	a0,-1872(a5) # 8049c7b4 <initproc>
80408f0c:	d9cfe0ef          	jal	ra,804074a8 <set_proc_name>
80408f10:	0004a783          	lw	a5,0(s1)
80408f14:	06078a63          	beqz	a5,80408f88 <proc_init+0x194>
80408f18:	0047a783          	lw	a5,4(a5)
80408f1c:	06079663          	bnez	a5,80408f88 <proc_init+0x194>
80408f20:	00094797          	auipc	a5,0x94
80408f24:	89478793          	addi	a5,a5,-1900 # 8049c7b4 <initproc>
80408f28:	0007a783          	lw	a5,0(a5)
80408f2c:	02078e63          	beqz	a5,80408f68 <proc_init+0x174>
80408f30:	0047a783          	lw	a5,4(a5)
80408f34:	03279a63          	bne	a5,s2,80408f68 <proc_init+0x174>
80408f38:	00c12083          	lw	ra,12(sp)
80408f3c:	00812403          	lw	s0,8(sp)
80408f40:	00412483          	lw	s1,4(sp)
80408f44:	00012903          	lw	s2,0(sp)
80408f48:	01010113          	addi	sp,sp,16
80408f4c:	00008067          	ret
80408f50:	0000c617          	auipc	a2,0xc
80408f54:	e3860613          	addi	a2,a2,-456 # 80414d88 <CSWTCH.69+0xa08>
80408f58:	47c00593          	li	a1,1148
80408f5c:	0000c517          	auipc	a0,0xc
80408f60:	f2c50513          	addi	a0,a0,-212 # 80414e88 <CSWTCH.69+0xb08>
80408f64:	ec0f70ef          	jal	ra,80400624 <__panic>
80408f68:	0000c697          	auipc	a3,0xc
80408f6c:	eb068693          	addi	a3,a3,-336 # 80414e18 <CSWTCH.69+0xa98>
80408f70:	0000a617          	auipc	a2,0xa
80408f74:	f5860613          	addi	a2,a2,-168 # 80412ec8 <commands+0x1bc>
80408f78:	49700593          	li	a1,1175
80408f7c:	0000c517          	auipc	a0,0xc
80408f80:	f0c50513          	addi	a0,a0,-244 # 80414e88 <CSWTCH.69+0xb08>
80408f84:	ea0f70ef          	jal	ra,80400624 <__panic>
80408f88:	0000c697          	auipc	a3,0xc
80408f8c:	e6868693          	addi	a3,a3,-408 # 80414df0 <CSWTCH.69+0xa70>
80408f90:	0000a617          	auipc	a2,0xa
80408f94:	f3860613          	addi	a2,a2,-200 # 80412ec8 <commands+0x1bc>
80408f98:	49600593          	li	a1,1174
80408f9c:	0000c517          	auipc	a0,0xc
80408fa0:	eec50513          	addi	a0,a0,-276 # 80414e88 <CSWTCH.69+0xb08>
80408fa4:	e80f70ef          	jal	ra,80400624 <__panic>
80408fa8:	0000c617          	auipc	a2,0xc
80408fac:	e2460613          	addi	a2,a2,-476 # 80414dcc <CSWTCH.69+0xa4c>
80408fb0:	49000593          	li	a1,1168
80408fb4:	0000c517          	auipc	a0,0xc
80408fb8:	ed450513          	addi	a0,a0,-300 # 80414e88 <CSWTCH.69+0xb08>
80408fbc:	e68f70ef          	jal	ra,80400624 <__panic>
80408fc0:	0000c617          	auipc	a2,0xc
80408fc4:	de060613          	addi	a2,a2,-544 # 80414da0 <CSWTCH.69+0xa20>
80408fc8:	48500593          	li	a1,1157
80408fcc:	0000c517          	auipc	a0,0xc
80408fd0:	ebc50513          	addi	a0,a0,-324 # 80414e88 <CSWTCH.69+0xb08>
80408fd4:	e50f70ef          	jal	ra,80400624 <__panic>

80408fd8 <cpu_idle>:
80408fd8:	ff010113          	addi	sp,sp,-16
80408fdc:	00812423          	sw	s0,8(sp)
80408fe0:	00112623          	sw	ra,12(sp)
80408fe4:	00093417          	auipc	s0,0x93
80408fe8:	7c840413          	addi	s0,s0,1992 # 8049c7ac <current>
80408fec:	00042703          	lw	a4,0(s0)
80408ff0:	01072783          	lw	a5,16(a4)
80408ff4:	fe078ee3          	beqz	a5,80408ff0 <cpu_idle+0x18>
80408ff8:	561030ef          	jal	ra,8040cd58 <schedule>
80408ffc:	ff1ff06f          	j	80408fec <cpu_idle+0x14>

80409000 <lab6_set_priority>:
80409000:	00093797          	auipc	a5,0x93
80409004:	7ac78793          	addi	a5,a5,1964 # 8049c7ac <current>
80409008:	0007a783          	lw	a5,0(a5)
8040900c:	00051863          	bnez	a0,8040901c <lab6_set_priority+0x1c>
80409010:	00100713          	li	a4,1
80409014:	0ce7ac23          	sw	a4,216(a5)
80409018:	00008067          	ret
8040901c:	0ca7ac23          	sw	a0,216(a5)
80409020:	00008067          	ret

80409024 <do_sleep>:
80409024:	08050063          	beqz	a0,804090a4 <do_sleep+0x80>
80409028:	fe010113          	addi	sp,sp,-32
8040902c:	00812c23          	sw	s0,24(sp)
80409030:	00112e23          	sw	ra,28(sp)
80409034:	00050413          	mv	s0,a0
80409038:	100027f3          	csrr	a5,sstatus
8040903c:	0027f793          	andi	a5,a5,2
80409040:	06079663          	bnez	a5,804090ac <do_sleep+0x88>
80409044:	00093797          	auipc	a5,0x93
80409048:	76878793          	addi	a5,a5,1896 # 8049c7ac <current>
8040904c:	0007a783          	lw	a5,0(a5)
80409050:	00810713          	addi	a4,sp,8
80409054:	00a12023          	sw	a0,0(sp)
80409058:	00e12623          	sw	a4,12(sp)
8040905c:	00e12423          	sw	a4,8(sp)
80409060:	00f12223          	sw	a5,4(sp)
80409064:	00100713          	li	a4,1
80409068:	00e7a023          	sw	a4,0(a5)
8040906c:	80000737          	lui	a4,0x80000
80409070:	00010413          	mv	s0,sp
80409074:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
80409078:	0ae7a423          	sw	a4,168(a5)
8040907c:	00040513          	mv	a0,s0
80409080:	609030ef          	jal	ra,8040ce88 <add_timer>
80409084:	4d5030ef          	jal	ra,8040cd58 <schedule>
80409088:	00040513          	mv	a0,s0
8040908c:	709030ef          	jal	ra,8040cf94 <del_timer>
80409090:	01c12083          	lw	ra,28(sp)
80409094:	01812403          	lw	s0,24(sp)
80409098:	00000513          	li	a0,0
8040909c:	02010113          	addi	sp,sp,32
804090a0:	00008067          	ret
804090a4:	00000513          	li	a0,0
804090a8:	00008067          	ret
804090ac:	b71f70ef          	jal	ra,80400c1c <intr_disable>
804090b0:	00093797          	auipc	a5,0x93
804090b4:	6fc78793          	addi	a5,a5,1788 # 8049c7ac <current>
804090b8:	0007a783          	lw	a5,0(a5)
804090bc:	00810713          	addi	a4,sp,8
804090c0:	00812023          	sw	s0,0(sp)
804090c4:	00f12223          	sw	a5,4(sp)
804090c8:	00e12623          	sw	a4,12(sp)
804090cc:	00e12423          	sw	a4,8(sp)
804090d0:	00100713          	li	a4,1
804090d4:	00e7a023          	sw	a4,0(a5)
804090d8:	80000737          	lui	a4,0x80000
804090dc:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
804090e0:	00010413          	mv	s0,sp
804090e4:	00040513          	mv	a0,s0
804090e8:	0ae7a423          	sw	a4,168(a5)
804090ec:	59d030ef          	jal	ra,8040ce88 <add_timer>
804090f0:	b25f70ef          	jal	ra,80400c14 <intr_enable>
804090f4:	f91ff06f          	j	80409084 <do_sleep+0x60>

804090f8 <switch_to>:
804090f8:	00152023          	sw	ra,0(a0)
804090fc:	00252223          	sw	sp,4(a0)
80409100:	00852423          	sw	s0,8(a0)
80409104:	00952623          	sw	s1,12(a0)
80409108:	01252823          	sw	s2,16(a0)
8040910c:	01352a23          	sw	s3,20(a0)
80409110:	01452c23          	sw	s4,24(a0)
80409114:	01552e23          	sw	s5,28(a0)
80409118:	03652023          	sw	s6,32(a0)
8040911c:	03752223          	sw	s7,36(a0)
80409120:	03852423          	sw	s8,40(a0)
80409124:	03952623          	sw	s9,44(a0)
80409128:	03a52823          	sw	s10,48(a0)
8040912c:	03b52a23          	sw	s11,52(a0)
80409130:	0005a083          	lw	ra,0(a1)
80409134:	0045a103          	lw	sp,4(a1)
80409138:	0085a403          	lw	s0,8(a1)
8040913c:	00c5a483          	lw	s1,12(a1)
80409140:	0105a903          	lw	s2,16(a1)
80409144:	0145a983          	lw	s3,20(a1)
80409148:	0185aa03          	lw	s4,24(a1)
8040914c:	01c5aa83          	lw	s5,28(a1)
80409150:	0205ab03          	lw	s6,32(a1)
80409154:	0245ab83          	lw	s7,36(a1)
80409158:	0285ac03          	lw	s8,40(a1)
8040915c:	02c5ac83          	lw	s9,44(a1)
80409160:	0305ad03          	lw	s10,48(a1)
80409164:	0345ad83          	lw	s11,52(a1)
80409168:	00008067          	ret

8040916c <proc_stride_comp_f>:
8040916c:	00c52503          	lw	a0,12(a0)
80409170:	00c5a783          	lw	a5,12(a1)
80409174:	40f50533          	sub	a0,a0,a5
80409178:	00a04863          	bgtz	a0,80409188 <proc_stride_comp_f+0x1c>
8040917c:	00a03533          	snez	a0,a0
80409180:	40a00533          	neg	a0,a0
80409184:	00008067          	ret
80409188:	00100513          	li	a0,1
8040918c:	00008067          	ret

80409190 <stride_init>:
80409190:	00a52223          	sw	a0,4(a0)
80409194:	00a52023          	sw	a0,0(a0)
80409198:	00052823          	sw	zero,16(a0)
8040919c:	00052423          	sw	zero,8(a0)
804091a0:	00008067          	ret

804091a4 <stride_pick_next>:
804091a4:	ff010113          	addi	sp,sp,-16
804091a8:	00812423          	sw	s0,8(sp)
804091ac:	01052403          	lw	s0,16(a0)
804091b0:	00112623          	sw	ra,12(sp)
804091b4:	00912223          	sw	s1,4(sp)
804091b8:	01212023          	sw	s2,0(sp)
804091bc:	04040263          	beqz	s0,80409200 <stride_pick_next+0x5c>
804091c0:	01042583          	lw	a1,16(s0)
804091c4:	f3840913          	addi	s2,s0,-200
804091c8:	00c42483          	lw	s1,12(s0)
804091cc:	40000537          	lui	a0,0x40000
804091d0:	02059463          	bnez	a1,804091f8 <stride_pick_next+0x54>
804091d4:	00a484b3          	add	s1,s1,a0
804091d8:	00942623          	sw	s1,12(s0)
804091dc:	00c12083          	lw	ra,12(sp)
804091e0:	00812403          	lw	s0,8(sp)
804091e4:	00090513          	mv	a0,s2
804091e8:	00412483          	lw	s1,4(sp)
804091ec:	00012903          	lw	s2,0(sp)
804091f0:	01010113          	addi	sp,sp,16
804091f4:	00008067          	ret
804091f8:	161090ef          	jal	ra,80412b58 <__udivsi3>
804091fc:	fd9ff06f          	j	804091d4 <stride_pick_next+0x30>
80409200:	00000913          	li	s2,0
80409204:	fd9ff06f          	j	804091dc <stride_pick_next+0x38>

80409208 <stride_proc_tick>:
80409208:	0c45a783          	lw	a5,196(a1)
8040920c:	00f05663          	blez	a5,80409218 <stride_proc_tick+0x10>
80409210:	fff78793          	addi	a5,a5,-1
80409214:	0cf5a223          	sw	a5,196(a1)
80409218:	00079663          	bnez	a5,80409224 <stride_proc_tick+0x1c>
8040921c:	00100793          	li	a5,1
80409220:	00f5a823          	sw	a5,16(a1)
80409224:	00008067          	ret

80409228 <skew_heap_merge.constprop.3>:
80409228:	ff010113          	addi	sp,sp,-16
8040922c:	00812423          	sw	s0,8(sp)
80409230:	00112623          	sw	ra,12(sp)
80409234:	00912223          	sw	s1,4(sp)
80409238:	01212023          	sw	s2,0(sp)
8040923c:	00058413          	mv	s0,a1
80409240:	02050c63          	beqz	a0,80409278 <skew_heap_merge.constprop.3+0x50>
80409244:	00050493          	mv	s1,a0
80409248:	06058663          	beqz	a1,804092b4 <skew_heap_merge.constprop.3+0x8c>
8040924c:	f21ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409250:	fff00793          	li	a5,-1
80409254:	04f50063          	beq	a0,a5,80409294 <skew_heap_merge.constprop.3+0x6c>
80409258:	00842583          	lw	a1,8(s0)
8040925c:	00442903          	lw	s2,4(s0)
80409260:	00048513          	mv	a0,s1
80409264:	fc5ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
80409268:	00a42223          	sw	a0,4(s0)
8040926c:	01242423          	sw	s2,8(s0)
80409270:	00050463          	beqz	a0,80409278 <skew_heap_merge.constprop.3+0x50>
80409274:	00852023          	sw	s0,0(a0) # 40000000 <_binary_bin_sfs_img_size+0x3ff88000>
80409278:	00040513          	mv	a0,s0
8040927c:	00c12083          	lw	ra,12(sp)
80409280:	00812403          	lw	s0,8(sp)
80409284:	00412483          	lw	s1,4(sp)
80409288:	00012903          	lw	s2,0(sp)
8040928c:	01010113          	addi	sp,sp,16
80409290:	00008067          	ret
80409294:	0084a503          	lw	a0,8(s1)
80409298:	0044a903          	lw	s2,4(s1)
8040929c:	00040593          	mv	a1,s0
804092a0:	f89ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
804092a4:	00a4a223          	sw	a0,4(s1)
804092a8:	0124a423          	sw	s2,8(s1)
804092ac:	00050463          	beqz	a0,804092b4 <skew_heap_merge.constprop.3+0x8c>
804092b0:	00952023          	sw	s1,0(a0)
804092b4:	00c12083          	lw	ra,12(sp)
804092b8:	00812403          	lw	s0,8(sp)
804092bc:	00048513          	mv	a0,s1
804092c0:	00012903          	lw	s2,0(sp)
804092c4:	00412483          	lw	s1,4(sp)
804092c8:	01010113          	addi	sp,sp,16
804092cc:	00008067          	ret

804092d0 <stride_enqueue>:
804092d0:	fb010113          	addi	sp,sp,-80
804092d4:	03312e23          	sw	s3,60(sp)
804092d8:	01052983          	lw	s3,16(a0)
804092dc:	04812423          	sw	s0,72(sp)
804092e0:	04912223          	sw	s1,68(sp)
804092e4:	05212023          	sw	s2,64(sp)
804092e8:	04112623          	sw	ra,76(sp)
804092ec:	03412c23          	sw	s4,56(sp)
804092f0:	03512a23          	sw	s5,52(sp)
804092f4:	03612823          	sw	s6,48(sp)
804092f8:	03712623          	sw	s7,44(sp)
804092fc:	03812423          	sw	s8,40(sp)
80409300:	03912223          	sw	s9,36(sp)
80409304:	03a12023          	sw	s10,32(sp)
80409308:	01b12e23          	sw	s11,28(sp)
8040930c:	0c05a423          	sw	zero,200(a1)
80409310:	0c05a823          	sw	zero,208(a1)
80409314:	0c05a623          	sw	zero,204(a1)
80409318:	00050493          	mv	s1,a0
8040931c:	00058413          	mv	s0,a1
80409320:	0c858913          	addi	s2,a1,200
80409324:	02098463          	beqz	s3,8040934c <stride_enqueue+0x7c>
80409328:	0c090c63          	beqz	s2,80409400 <stride_enqueue+0x130>
8040932c:	00090593          	mv	a1,s2
80409330:	00098513          	mv	a0,s3
80409334:	e39ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409338:	fff00793          	li	a5,-1
8040933c:	00050a13          	mv	s4,a0
80409340:	06f50a63          	beq	a0,a5,804093b4 <stride_enqueue+0xe4>
80409344:	0d342623          	sw	s3,204(s0)
80409348:	0129a023          	sw	s2,0(s3)
8040934c:	0c442783          	lw	a5,196(s0)
80409350:	0124a823          	sw	s2,16(s1)
80409354:	00c4a703          	lw	a4,12(s1)
80409358:	04079a63          	bnez	a5,804093ac <stride_enqueue+0xdc>
8040935c:	0ce42223          	sw	a4,196(s0)
80409360:	0084a783          	lw	a5,8(s1)
80409364:	04c12083          	lw	ra,76(sp)
80409368:	0a942c23          	sw	s1,184(s0)
8040936c:	04812403          	lw	s0,72(sp)
80409370:	00178793          	addi	a5,a5,1
80409374:	00f4a423          	sw	a5,8(s1)
80409378:	04012903          	lw	s2,64(sp)
8040937c:	04412483          	lw	s1,68(sp)
80409380:	03c12983          	lw	s3,60(sp)
80409384:	03812a03          	lw	s4,56(sp)
80409388:	03412a83          	lw	s5,52(sp)
8040938c:	03012b03          	lw	s6,48(sp)
80409390:	02c12b83          	lw	s7,44(sp)
80409394:	02812c03          	lw	s8,40(sp)
80409398:	02412c83          	lw	s9,36(sp)
8040939c:	02012d03          	lw	s10,32(sp)
804093a0:	01c12d83          	lw	s11,28(sp)
804093a4:	05010113          	addi	sp,sp,80
804093a8:	00008067          	ret
804093ac:	faf75ae3          	bge	a4,a5,80409360 <stride_enqueue+0x90>
804093b0:	fadff06f          	j	8040935c <stride_enqueue+0x8c>
804093b4:	0089aa83          	lw	s5,8(s3)
804093b8:	0049ab03          	lw	s6,4(s3)
804093bc:	020a8063          	beqz	s5,804093dc <stride_enqueue+0x10c>
804093c0:	00090593          	mv	a1,s2
804093c4:	000a8513          	mv	a0,s5
804093c8:	da5ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804093cc:	00050b93          	mv	s7,a0
804093d0:	05450463          	beq	a0,s4,80409418 <stride_enqueue+0x148>
804093d4:	0d542623          	sw	s5,204(s0)
804093d8:	012aa023          	sw	s2,0(s5)
804093dc:	0129a223          	sw	s2,4(s3)
804093e0:	0169a423          	sw	s6,8(s3)
804093e4:	0c442783          	lw	a5,196(s0)
804093e8:	01392023          	sw	s3,0(s2)
804093ec:	00098913          	mv	s2,s3
804093f0:	0124a823          	sw	s2,16(s1)
804093f4:	00c4a703          	lw	a4,12(s1)
804093f8:	f60782e3          	beqz	a5,8040935c <stride_enqueue+0x8c>
804093fc:	fb1ff06f          	j	804093ac <stride_enqueue+0xdc>
80409400:	0c442783          	lw	a5,196(s0)
80409404:	00098913          	mv	s2,s3
80409408:	0124a823          	sw	s2,16(s1)
8040940c:	00c4a703          	lw	a4,12(s1)
80409410:	f40786e3          	beqz	a5,8040935c <stride_enqueue+0x8c>
80409414:	f99ff06f          	j	804093ac <stride_enqueue+0xdc>
80409418:	008aaa03          	lw	s4,8(s5)
8040941c:	004aac03          	lw	s8,4(s5)
80409420:	020a0063          	beqz	s4,80409440 <stride_enqueue+0x170>
80409424:	00090593          	mv	a1,s2
80409428:	000a0513          	mv	a0,s4
8040942c:	d41ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409430:	00050c93          	mv	s9,a0
80409434:	03750063          	beq	a0,s7,80409454 <stride_enqueue+0x184>
80409438:	0d442623          	sw	s4,204(s0)
8040943c:	012a2023          	sw	s2,0(s4)
80409440:	012aa223          	sw	s2,4(s5)
80409444:	018aa423          	sw	s8,8(s5)
80409448:	01592023          	sw	s5,0(s2)
8040944c:	000a8913          	mv	s2,s5
80409450:	f8dff06f          	j	804093dc <stride_enqueue+0x10c>
80409454:	008a2b83          	lw	s7,8(s4)
80409458:	004a2d03          	lw	s10,4(s4)
8040945c:	000b8e63          	beqz	s7,80409478 <stride_enqueue+0x1a8>
80409460:	00090593          	mv	a1,s2
80409464:	000b8513          	mv	a0,s7
80409468:	d05ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040946c:	03950063          	beq	a0,s9,8040948c <stride_enqueue+0x1bc>
80409470:	0d742623          	sw	s7,204(s0)
80409474:	012ba023          	sw	s2,0(s7)
80409478:	012a2223          	sw	s2,4(s4)
8040947c:	01aa2423          	sw	s10,8(s4)
80409480:	01492023          	sw	s4,0(s2)
80409484:	000a0913          	mv	s2,s4
80409488:	fb9ff06f          	j	80409440 <stride_enqueue+0x170>
8040948c:	008bac83          	lw	s9,8(s7)
80409490:	004bad83          	lw	s11,4(s7)
80409494:	020c8063          	beqz	s9,804094b4 <stride_enqueue+0x1e4>
80409498:	00090593          	mv	a1,s2
8040949c:	000c8513          	mv	a0,s9
804094a0:	ccdff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804094a4:	fff00793          	li	a5,-1
804094a8:	02f50063          	beq	a0,a5,804094c8 <stride_enqueue+0x1f8>
804094ac:	0d942623          	sw	s9,204(s0)
804094b0:	012ca023          	sw	s2,0(s9)
804094b4:	012ba223          	sw	s2,4(s7)
804094b8:	01bba423          	sw	s11,8(s7)
804094bc:	01792023          	sw	s7,0(s2)
804094c0:	000b8913          	mv	s2,s7
804094c4:	fb5ff06f          	j	80409478 <stride_enqueue+0x1a8>
804094c8:	004ca783          	lw	a5,4(s9)
804094cc:	008ca503          	lw	a0,8(s9)
804094d0:	00090593          	mv	a1,s2
804094d4:	00f12623          	sw	a5,12(sp)
804094d8:	d51ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
804094dc:	00c12783          	lw	a5,12(sp)
804094e0:	00aca223          	sw	a0,4(s9)
804094e4:	00fca423          	sw	a5,8(s9)
804094e8:	00050863          	beqz	a0,804094f8 <stride_enqueue+0x228>
804094ec:	01952023          	sw	s9,0(a0)
804094f0:	000c8913          	mv	s2,s9
804094f4:	fc1ff06f          	j	804094b4 <stride_enqueue+0x1e4>
804094f8:	000c8913          	mv	s2,s9
804094fc:	fb9ff06f          	j	804094b4 <stride_enqueue+0x1e4>

80409500 <stride_dequeue>:
80409500:	0b85a783          	lw	a5,184(a1)
80409504:	fa010113          	addi	sp,sp,-96
80409508:	04112e23          	sw	ra,92(sp)
8040950c:	04812c23          	sw	s0,88(sp)
80409510:	04912a23          	sw	s1,84(sp)
80409514:	05212823          	sw	s2,80(sp)
80409518:	05312623          	sw	s3,76(sp)
8040951c:	05412423          	sw	s4,72(sp)
80409520:	05512223          	sw	s5,68(sp)
80409524:	05612023          	sw	s6,64(sp)
80409528:	03712e23          	sw	s7,60(sp)
8040952c:	03812c23          	sw	s8,56(sp)
80409530:	03912a23          	sw	s9,52(sp)
80409534:	03a12823          	sw	s10,48(sp)
80409538:	03b12623          	sw	s11,44(sp)
8040953c:	00a78463          	beq	a5,a0,80409544 <stride_dequeue+0x44>
80409540:	2790206f          	j	8040bfb8 <stride_dequeue+0x2ab8>
80409544:	00852983          	lw	s3,8(a0)
80409548:	00050c13          	mv	s8,a0
8040954c:	00098b13          	mv	s6,s3
80409550:	00099463          	bnez	s3,80409558 <stride_dequeue+0x58>
80409554:	2650206f          	j	8040bfb8 <stride_dequeue+0x2ab8>
80409558:	0cc5a903          	lw	s2,204(a1)
8040955c:	00058493          	mv	s1,a1
80409560:	01052a83          	lw	s5,16(a0)
80409564:	0c85ad03          	lw	s10,200(a1)
80409568:	0d05a403          	lw	s0,208(a1)
8040956c:	3c090e63          	beqz	s2,80409948 <stride_dequeue+0x448>
80409570:	58040c63          	beqz	s0,80409b08 <stride_dequeue+0x608>
80409574:	00040593          	mv	a1,s0
80409578:	00090513          	mv	a0,s2
8040957c:	bf1ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409580:	fff00c93          	li	s9,-1
80409584:	00050a13          	mv	s4,a0
80409588:	21950663          	beq	a0,s9,80409794 <stride_dequeue+0x294>
8040958c:	00842a03          	lw	s4,8(s0)
80409590:	00442b83          	lw	s7,4(s0)
80409594:	180a0a63          	beqz	s4,80409728 <stride_dequeue+0x228>
80409598:	000a0593          	mv	a1,s4
8040959c:	00090513          	mv	a0,s2
804095a0:	bcdff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804095a4:	3b950e63          	beq	a0,s9,80409960 <stride_dequeue+0x460>
804095a8:	004a2783          	lw	a5,4(s4)
804095ac:	008a2d83          	lw	s11,8(s4)
804095b0:	00f12023          	sw	a5,0(sp)
804095b4:	160d8063          	beqz	s11,80409714 <stride_dequeue+0x214>
804095b8:	000d8593          	mv	a1,s11
804095bc:	00090513          	mv	a0,s2
804095c0:	badff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804095c4:	2b9500e3          	beq	a0,s9,8040a064 <stride_dequeue+0xb64>
804095c8:	004da783          	lw	a5,4(s11)
804095cc:	008dac83          	lw	s9,8(s11)
804095d0:	00f12223          	sw	a5,4(sp)
804095d4:	120c8663          	beqz	s9,80409700 <stride_dequeue+0x200>
804095d8:	000c8593          	mv	a1,s9
804095dc:	00090513          	mv	a0,s2
804095e0:	b8dff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804095e4:	fff00893          	li	a7,-1
804095e8:	171504e3          	beq	a0,a7,80409f50 <stride_dequeue+0xa50>
804095ec:	004ca783          	lw	a5,4(s9)
804095f0:	008ca803          	lw	a6,8(s9)
804095f4:	00f12423          	sw	a5,8(sp)
804095f8:	0e080a63          	beqz	a6,804096ec <stride_dequeue+0x1ec>
804095fc:	00080593          	mv	a1,a6
80409600:	00090513          	mv	a0,s2
80409604:	01012623          	sw	a6,12(sp)
80409608:	b65ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040960c:	fff00893          	li	a7,-1
80409610:	00c12803          	lw	a6,12(sp)
80409614:	01151463          	bne	a0,a7,8040961c <stride_dequeue+0x11c>
80409618:	02c0106f          	j	8040a644 <stride_dequeue+0x1144>
8040961c:	00482703          	lw	a4,4(a6) # fffff004 <end+0x7fb62748>
80409620:	00882783          	lw	a5,8(a6)
80409624:	00e12623          	sw	a4,12(sp)
80409628:	0a078863          	beqz	a5,804096d8 <stride_dequeue+0x1d8>
8040962c:	00078593          	mv	a1,a5
80409630:	00090513          	mv	a0,s2
80409634:	01012a23          	sw	a6,20(sp)
80409638:	00f12823          	sw	a5,16(sp)
8040963c:	b31ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409640:	fff00893          	li	a7,-1
80409644:	01012783          	lw	a5,16(sp)
80409648:	01412803          	lw	a6,20(sp)
8040964c:	01151463          	bne	a0,a7,80409654 <stride_dequeue+0x154>
80409650:	7900106f          	j	8040ade0 <stride_dequeue+0x18e0>
80409654:	0047a703          	lw	a4,4(a5)
80409658:	0087ab03          	lw	s6,8(a5)
8040965c:	00e12823          	sw	a4,16(sp)
80409660:	060b0263          	beqz	s6,804096c4 <stride_dequeue+0x1c4>
80409664:	000b0593          	mv	a1,s6
80409668:	00090513          	mv	a0,s2
8040966c:	00f12c23          	sw	a5,24(sp)
80409670:	01012a23          	sw	a6,20(sp)
80409674:	af9ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409678:	fff00893          	li	a7,-1
8040967c:	01412803          	lw	a6,20(sp)
80409680:	01812783          	lw	a5,24(sp)
80409684:	01151463          	bne	a0,a7,8040968c <stride_dequeue+0x18c>
80409688:	0a00206f          	j	8040b728 <stride_dequeue+0x2228>
8040968c:	008b2583          	lw	a1,8(s6)
80409690:	004b2983          	lw	s3,4(s6)
80409694:	00090513          	mv	a0,s2
80409698:	00f12c23          	sw	a5,24(sp)
8040969c:	01012a23          	sw	a6,20(sp)
804096a0:	b89ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
804096a4:	00ab2223          	sw	a0,4(s6)
804096a8:	013b2423          	sw	s3,8(s6)
804096ac:	01412803          	lw	a6,20(sp)
804096b0:	01812783          	lw	a5,24(sp)
804096b4:	00050463          	beqz	a0,804096bc <stride_dequeue+0x1bc>
804096b8:	01652023          	sw	s6,0(a0)
804096bc:	008c2983          	lw	s3,8(s8)
804096c0:	000b0913          	mv	s2,s6
804096c4:	01012703          	lw	a4,16(sp)
804096c8:	0127a223          	sw	s2,4(a5)
804096cc:	00e7a423          	sw	a4,8(a5)
804096d0:	00f92023          	sw	a5,0(s2)
804096d4:	00078913          	mv	s2,a5
804096d8:	00c12783          	lw	a5,12(sp)
804096dc:	01282223          	sw	s2,4(a6)
804096e0:	00f82423          	sw	a5,8(a6)
804096e4:	01092023          	sw	a6,0(s2)
804096e8:	00080913          	mv	s2,a6
804096ec:	00812783          	lw	a5,8(sp)
804096f0:	012ca223          	sw	s2,4(s9)
804096f4:	00fca423          	sw	a5,8(s9)
804096f8:	01992023          	sw	s9,0(s2)
804096fc:	000c8913          	mv	s2,s9
80409700:	00412783          	lw	a5,4(sp)
80409704:	012da223          	sw	s2,4(s11)
80409708:	00fda423          	sw	a5,8(s11)
8040970c:	01b92023          	sw	s11,0(s2)
80409710:	000d8913          	mv	s2,s11
80409714:	00012783          	lw	a5,0(sp)
80409718:	012a2223          	sw	s2,4(s4)
8040971c:	00fa2423          	sw	a5,8(s4)
80409720:	01492023          	sw	s4,0(s2)
80409724:	000a0913          	mv	s2,s4
80409728:	01242223          	sw	s2,4(s0)
8040972c:	01742423          	sw	s7,8(s0)
80409730:	00892023          	sw	s0,0(s2)
80409734:	01a42023          	sw	s10,0(s0)
80409738:	200d0c63          	beqz	s10,80409950 <stride_dequeue+0x450>
8040973c:	004d2683          	lw	a3,4(s10)
80409740:	0c848493          	addi	s1,s1,200
80409744:	20968a63          	beq	a3,s1,80409958 <stride_dequeue+0x458>
80409748:	008d2423          	sw	s0,8(s10)
8040974c:	05c12083          	lw	ra,92(sp)
80409750:	05812403          	lw	s0,88(sp)
80409754:	fff98993          	addi	s3,s3,-1
80409758:	015c2823          	sw	s5,16(s8)
8040975c:	013c2423          	sw	s3,8(s8)
80409760:	05412483          	lw	s1,84(sp)
80409764:	05012903          	lw	s2,80(sp)
80409768:	04c12983          	lw	s3,76(sp)
8040976c:	04812a03          	lw	s4,72(sp)
80409770:	04412a83          	lw	s5,68(sp)
80409774:	04012b03          	lw	s6,64(sp)
80409778:	03c12b83          	lw	s7,60(sp)
8040977c:	03812c03          	lw	s8,56(sp)
80409780:	03412c83          	lw	s9,52(sp)
80409784:	03012d03          	lw	s10,48(sp)
80409788:	02c12d83          	lw	s11,44(sp)
8040978c:	06010113          	addi	sp,sp,96
80409790:	00008067          	ret
80409794:	00892d83          	lw	s11,8(s2)
80409798:	00492b83          	lw	s7,4(s2)
8040979c:	180d8a63          	beqz	s11,80409930 <stride_dequeue+0x430>
804097a0:	00040593          	mv	a1,s0
804097a4:	000d8513          	mv	a0,s11
804097a8:	9c5ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804097ac:	37450463          	beq	a0,s4,80409b14 <stride_dequeue+0x614>
804097b0:	00442783          	lw	a5,4(s0)
804097b4:	00842c83          	lw	s9,8(s0)
804097b8:	00f12023          	sw	a5,0(sp)
804097bc:	160c8263          	beqz	s9,80409920 <stride_dequeue+0x420>
804097c0:	000c8593          	mv	a1,s9
804097c4:	000d8513          	mv	a0,s11
804097c8:	9a5ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804097cc:	4d450863          	beq	a0,s4,80409c9c <stride_dequeue+0x79c>
804097d0:	004ca783          	lw	a5,4(s9)
804097d4:	008caa03          	lw	s4,8(s9)
804097d8:	00f12223          	sw	a5,4(sp)
804097dc:	120a0863          	beqz	s4,8040990c <stride_dequeue+0x40c>
804097e0:	000a0593          	mv	a1,s4
804097e4:	000d8513          	mv	a0,s11
804097e8:	985ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804097ec:	fff00893          	li	a7,-1
804097f0:	551502e3          	beq	a0,a7,8040a534 <stride_dequeue+0x1034>
804097f4:	004a2783          	lw	a5,4(s4)
804097f8:	008a2803          	lw	a6,8(s4)
804097fc:	00f12423          	sw	a5,8(sp)
80409800:	0e080c63          	beqz	a6,804098f8 <stride_dequeue+0x3f8>
80409804:	00080593          	mv	a1,a6
80409808:	000d8513          	mv	a0,s11
8040980c:	01012623          	sw	a6,12(sp)
80409810:	95dff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409814:	fff00893          	li	a7,-1
80409818:	00c12803          	lw	a6,12(sp)
8040981c:	01151463          	bne	a0,a7,80409824 <stride_dequeue+0x324>
80409820:	4000106f          	j	8040ac20 <stride_dequeue+0x1720>
80409824:	00482783          	lw	a5,4(a6)
80409828:	00882303          	lw	t1,8(a6)
8040982c:	00f12623          	sw	a5,12(sp)
80409830:	0a030a63          	beqz	t1,804098e4 <stride_dequeue+0x3e4>
80409834:	00030593          	mv	a1,t1
80409838:	000d8513          	mv	a0,s11
8040983c:	01012a23          	sw	a6,20(sp)
80409840:	00612823          	sw	t1,16(sp)
80409844:	929ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409848:	fff00893          	li	a7,-1
8040984c:	01012303          	lw	t1,16(sp)
80409850:	01412803          	lw	a6,20(sp)
80409854:	01151463          	bne	a0,a7,8040985c <stride_dequeue+0x35c>
80409858:	5cd0106f          	j	8040b624 <stride_dequeue+0x2124>
8040985c:	00432783          	lw	a5,4(t1)
80409860:	00832983          	lw	s3,8(t1)
80409864:	00f12823          	sw	a5,16(sp)
80409868:	00099463          	bnez	s3,80409870 <stride_dequeue+0x370>
8040986c:	44c0206f          	j	8040bcb8 <stride_dequeue+0x27b8>
80409870:	00098593          	mv	a1,s3
80409874:	000d8513          	mv	a0,s11
80409878:	00612c23          	sw	t1,24(sp)
8040987c:	01012a23          	sw	a6,20(sp)
80409880:	8edff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409884:	fff00893          	li	a7,-1
80409888:	01412803          	lw	a6,20(sp)
8040988c:	01812303          	lw	t1,24(sp)
80409890:	01151463          	bne	a0,a7,80409898 <stride_dequeue+0x398>
80409894:	6ac0206f          	j	8040bf40 <stride_dequeue+0x2a40>
80409898:	0089a583          	lw	a1,8(s3)
8040989c:	0049ab03          	lw	s6,4(s3)
804098a0:	000d8513          	mv	a0,s11
804098a4:	00612c23          	sw	t1,24(sp)
804098a8:	01012a23          	sw	a6,20(sp)
804098ac:	97dff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
804098b0:	00a9a223          	sw	a0,4(s3)
804098b4:	0169a423          	sw	s6,8(s3)
804098b8:	01412803          	lw	a6,20(sp)
804098bc:	01812303          	lw	t1,24(sp)
804098c0:	00050463          	beqz	a0,804098c8 <stride_dequeue+0x3c8>
804098c4:	01352023          	sw	s3,0(a0)
804098c8:	008c2b03          	lw	s6,8(s8)
804098cc:	01012783          	lw	a5,16(sp)
804098d0:	01332223          	sw	s3,4(t1)
804098d4:	00030d93          	mv	s11,t1
804098d8:	00f32423          	sw	a5,8(t1)
804098dc:	0069a023          	sw	t1,0(s3)
804098e0:	000b0993          	mv	s3,s6
804098e4:	00c12783          	lw	a5,12(sp)
804098e8:	01b82223          	sw	s11,4(a6)
804098ec:	00f82423          	sw	a5,8(a6)
804098f0:	010da023          	sw	a6,0(s11)
804098f4:	00080d93          	mv	s11,a6
804098f8:	00812783          	lw	a5,8(sp)
804098fc:	01ba2223          	sw	s11,4(s4)
80409900:	00fa2423          	sw	a5,8(s4)
80409904:	014da023          	sw	s4,0(s11)
80409908:	000a0d93          	mv	s11,s4
8040990c:	00412783          	lw	a5,4(sp)
80409910:	01bca223          	sw	s11,4(s9)
80409914:	00fca423          	sw	a5,8(s9)
80409918:	019da023          	sw	s9,0(s11)
8040991c:	000c8d93          	mv	s11,s9
80409920:	00012783          	lw	a5,0(sp)
80409924:	01b42223          	sw	s11,4(s0)
80409928:	00f42423          	sw	a5,8(s0)
8040992c:	008da023          	sw	s0,0(s11)
80409930:	00892223          	sw	s0,4(s2)
80409934:	01792423          	sw	s7,8(s2)
80409938:	01242023          	sw	s2,0(s0)
8040993c:	00090413          	mv	s0,s2
80409940:	01a42023          	sw	s10,0(s0)
80409944:	df5ff06f          	j	80409738 <stride_dequeue+0x238>
80409948:	de0416e3          	bnez	s0,80409734 <stride_dequeue+0x234>
8040994c:	de0d18e3          	bnez	s10,8040973c <stride_dequeue+0x23c>
80409950:	00040a93          	mv	s5,s0
80409954:	df9ff06f          	j	8040974c <stride_dequeue+0x24c>
80409958:	008d2223          	sw	s0,4(s10)
8040995c:	df1ff06f          	j	8040974c <stride_dequeue+0x24c>
80409960:	00892d83          	lw	s11,8(s2)
80409964:	00a12023          	sw	a0,0(sp)
80409968:	00492c83          	lw	s9,4(s2)
8040996c:	180d8663          	beqz	s11,80409af8 <stride_dequeue+0x5f8>
80409970:	000a0593          	mv	a1,s4
80409974:	000d8513          	mv	a0,s11
80409978:	ff4ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040997c:	00012783          	lw	a5,0(sp)
80409980:	46f50263          	beq	a0,a5,80409de4 <stride_dequeue+0x8e4>
80409984:	004a2783          	lw	a5,4(s4)
80409988:	008a2603          	lw	a2,8(s4)
8040998c:	00f12023          	sw	a5,0(sp)
80409990:	14060c63          	beqz	a2,80409ae8 <stride_dequeue+0x5e8>
80409994:	00060593          	mv	a1,a2
80409998:	000d8513          	mv	a0,s11
8040999c:	00c12223          	sw	a2,4(sp)
804099a0:	fccff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804099a4:	fff00893          	li	a7,-1
804099a8:	00412603          	lw	a2,4(sp)
804099ac:	25150ce3          	beq	a0,a7,8040a404 <stride_dequeue+0xf04>
804099b0:	00462783          	lw	a5,4(a2)
804099b4:	00862803          	lw	a6,8(a2)
804099b8:	00f12223          	sw	a5,4(sp)
804099bc:	10080c63          	beqz	a6,80409ad4 <stride_dequeue+0x5d4>
804099c0:	00080593          	mv	a1,a6
804099c4:	000d8513          	mv	a0,s11
804099c8:	00c12623          	sw	a2,12(sp)
804099cc:	01012423          	sw	a6,8(sp)
804099d0:	f9cff0ef          	jal	ra,8040916c <proc_stride_comp_f>
804099d4:	fff00893          	li	a7,-1
804099d8:	00812803          	lw	a6,8(sp)
804099dc:	00c12603          	lw	a2,12(sp)
804099e0:	01151463          	bne	a0,a7,804099e8 <stride_dequeue+0x4e8>
804099e4:	3100106f          	j	8040acf4 <stride_dequeue+0x17f4>
804099e8:	00482783          	lw	a5,4(a6)
804099ec:	00882303          	lw	t1,8(a6)
804099f0:	00f12423          	sw	a5,8(sp)
804099f4:	0c030663          	beqz	t1,80409ac0 <stride_dequeue+0x5c0>
804099f8:	00030593          	mv	a1,t1
804099fc:	000d8513          	mv	a0,s11
80409a00:	01012a23          	sw	a6,20(sp)
80409a04:	00c12823          	sw	a2,16(sp)
80409a08:	00612623          	sw	t1,12(sp)
80409a0c:	f60ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409a10:	fff00893          	li	a7,-1
80409a14:	00c12303          	lw	t1,12(sp)
80409a18:	01012603          	lw	a2,16(sp)
80409a1c:	01412803          	lw	a6,20(sp)
80409a20:	01151463          	bne	a0,a7,80409a28 <stride_dequeue+0x528>
80409a24:	2e90106f          	j	8040b50c <stride_dequeue+0x200c>
80409a28:	00432783          	lw	a5,4(t1)
80409a2c:	00832983          	lw	s3,8(t1)
80409a30:	00f12623          	sw	a5,12(sp)
80409a34:	00099463          	bnez	s3,80409a3c <stride_dequeue+0x53c>
80409a38:	4240206f          	j	8040be5c <stride_dequeue+0x295c>
80409a3c:	00098593          	mv	a1,s3
80409a40:	000d8513          	mv	a0,s11
80409a44:	00612c23          	sw	t1,24(sp)
80409a48:	01012a23          	sw	a6,20(sp)
80409a4c:	00c12823          	sw	a2,16(sp)
80409a50:	f1cff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409a54:	fff00893          	li	a7,-1
80409a58:	01012603          	lw	a2,16(sp)
80409a5c:	01412803          	lw	a6,20(sp)
80409a60:	01812303          	lw	t1,24(sp)
80409a64:	01151463          	bne	a0,a7,80409a6c <stride_dequeue+0x56c>
80409a68:	3fc0206f          	j	8040be64 <stride_dequeue+0x2964>
80409a6c:	0089a583          	lw	a1,8(s3)
80409a70:	0049ab03          	lw	s6,4(s3)
80409a74:	000d8513          	mv	a0,s11
80409a78:	00612c23          	sw	t1,24(sp)
80409a7c:	01012a23          	sw	a6,20(sp)
80409a80:	00c12823          	sw	a2,16(sp)
80409a84:	fa4ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
80409a88:	00a9a223          	sw	a0,4(s3)
80409a8c:	0169a423          	sw	s6,8(s3)
80409a90:	01012603          	lw	a2,16(sp)
80409a94:	01412803          	lw	a6,20(sp)
80409a98:	01812303          	lw	t1,24(sp)
80409a9c:	00050463          	beqz	a0,80409aa4 <stride_dequeue+0x5a4>
80409aa0:	01352023          	sw	s3,0(a0)
80409aa4:	008c2b03          	lw	s6,8(s8)
80409aa8:	00c12783          	lw	a5,12(sp)
80409aac:	01332223          	sw	s3,4(t1)
80409ab0:	00030d93          	mv	s11,t1
80409ab4:	00f32423          	sw	a5,8(t1)
80409ab8:	0069a023          	sw	t1,0(s3)
80409abc:	000b0993          	mv	s3,s6
80409ac0:	00812783          	lw	a5,8(sp)
80409ac4:	01b82223          	sw	s11,4(a6)
80409ac8:	00f82423          	sw	a5,8(a6)
80409acc:	010da023          	sw	a6,0(s11)
80409ad0:	00080d93          	mv	s11,a6
80409ad4:	00412783          	lw	a5,4(sp)
80409ad8:	01b62223          	sw	s11,4(a2)
80409adc:	00f62423          	sw	a5,8(a2)
80409ae0:	00cda023          	sw	a2,0(s11)
80409ae4:	00060d93          	mv	s11,a2
80409ae8:	00012783          	lw	a5,0(sp)
80409aec:	01ba2223          	sw	s11,4(s4)
80409af0:	00fa2423          	sw	a5,8(s4)
80409af4:	014da023          	sw	s4,0(s11)
80409af8:	01492223          	sw	s4,4(s2)
80409afc:	01992423          	sw	s9,8(s2)
80409b00:	012a2023          	sw	s2,0(s4)
80409b04:	c25ff06f          	j	80409728 <stride_dequeue+0x228>
80409b08:	00090413          	mv	s0,s2
80409b0c:	01a42023          	sw	s10,0(s0)
80409b10:	c29ff06f          	j	80409738 <stride_dequeue+0x238>
80409b14:	004da783          	lw	a5,4(s11)
80409b18:	008dac83          	lw	s9,8(s11)
80409b1c:	00a12223          	sw	a0,4(sp)
80409b20:	00f12023          	sw	a5,0(sp)
80409b24:	160c8063          	beqz	s9,80409c84 <stride_dequeue+0x784>
80409b28:	00040593          	mv	a1,s0
80409b2c:	000c8513          	mv	a0,s9
80409b30:	e3cff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409b34:	00412783          	lw	a5,4(sp)
80409b38:	66f50a63          	beq	a0,a5,8040a1ac <stride_dequeue+0xcac>
80409b3c:	00442783          	lw	a5,4(s0)
80409b40:	00842a03          	lw	s4,8(s0)
80409b44:	00f12223          	sw	a5,4(sp)
80409b48:	120a0663          	beqz	s4,80409c74 <stride_dequeue+0x774>
80409b4c:	000a0593          	mv	a1,s4
80409b50:	000c8513          	mv	a0,s9
80409b54:	e18ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409b58:	fff00893          	li	a7,-1
80409b5c:	4f1506e3          	beq	a0,a7,8040a848 <stride_dequeue+0x1348>
80409b60:	004a2783          	lw	a5,4(s4)
80409b64:	008a2803          	lw	a6,8(s4)
80409b68:	00f12423          	sw	a5,8(sp)
80409b6c:	0e080a63          	beqz	a6,80409c60 <stride_dequeue+0x760>
80409b70:	00080593          	mv	a1,a6
80409b74:	000c8513          	mv	a0,s9
80409b78:	01012623          	sw	a6,12(sp)
80409b7c:	df0ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409b80:	fff00893          	li	a7,-1
80409b84:	00c12803          	lw	a6,12(sp)
80409b88:	01151463          	bne	a0,a7,80409b90 <stride_dequeue+0x690>
80409b8c:	5640106f          	j	8040b0f0 <stride_dequeue+0x1bf0>
80409b90:	00482783          	lw	a5,4(a6)
80409b94:	00882983          	lw	s3,8(a6)
80409b98:	00f12623          	sw	a5,12(sp)
80409b9c:	00099463          	bnez	s3,80409ba4 <stride_dequeue+0x6a4>
80409ba0:	4380206f          	j	8040bfd8 <stride_dequeue+0x2ad8>
80409ba4:	00098593          	mv	a1,s3
80409ba8:	000c8513          	mv	a0,s9
80409bac:	01012823          	sw	a6,16(sp)
80409bb0:	dbcff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409bb4:	fff00893          	li	a7,-1
80409bb8:	01012803          	lw	a6,16(sp)
80409bbc:	01151463          	bne	a0,a7,80409bc4 <stride_dequeue+0x6c4>
80409bc0:	0780206f          	j	8040bc38 <stride_dequeue+0x2738>
80409bc4:	0049a783          	lw	a5,4(s3)
80409bc8:	0089ae03          	lw	t3,8(s3)
80409bcc:	00f12823          	sw	a5,16(sp)
80409bd0:	060e0463          	beqz	t3,80409c38 <stride_dequeue+0x738>
80409bd4:	000e0593          	mv	a1,t3
80409bd8:	000c8513          	mv	a0,s9
80409bdc:	01012c23          	sw	a6,24(sp)
80409be0:	01c12a23          	sw	t3,20(sp)
80409be4:	d88ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409be8:	fff00893          	li	a7,-1
80409bec:	01412e03          	lw	t3,20(sp)
80409bf0:	01812803          	lw	a6,24(sp)
80409bf4:	01151463          	bne	a0,a7,80409bfc <stride_dequeue+0x6fc>
80409bf8:	6a40206f          	j	8040c29c <stride_dequeue+0x2d9c>
80409bfc:	008e2583          	lw	a1,8(t3)
80409c00:	000c8513          	mv	a0,s9
80409c04:	004e2b03          	lw	s6,4(t3)
80409c08:	01012c23          	sw	a6,24(sp)
80409c0c:	01c12a23          	sw	t3,20(sp)
80409c10:	e18ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
80409c14:	01412e03          	lw	t3,20(sp)
80409c18:	01812803          	lw	a6,24(sp)
80409c1c:	00ae2223          	sw	a0,4(t3)
80409c20:	016e2423          	sw	s6,8(t3)
80409c24:	00051463          	bnez	a0,80409c2c <stride_dequeue+0x72c>
80409c28:	0e90206f          	j	8040c510 <stride_dequeue+0x3010>
80409c2c:	008c2b03          	lw	s6,8(s8)
80409c30:	01c52023          	sw	t3,0(a0)
80409c34:	000e0c93          	mv	s9,t3
80409c38:	01012783          	lw	a5,16(sp)
80409c3c:	0199a223          	sw	s9,4(s3)
80409c40:	00f9a423          	sw	a5,8(s3)
80409c44:	013ca023          	sw	s3,0(s9)
80409c48:	00c12783          	lw	a5,12(sp)
80409c4c:	01382223          	sw	s3,4(a6)
80409c50:	00080c93          	mv	s9,a6
80409c54:	00f82423          	sw	a5,8(a6)
80409c58:	0109a023          	sw	a6,0(s3)
80409c5c:	000b0993          	mv	s3,s6
80409c60:	00812783          	lw	a5,8(sp)
80409c64:	019a2223          	sw	s9,4(s4)
80409c68:	00fa2423          	sw	a5,8(s4)
80409c6c:	014ca023          	sw	s4,0(s9)
80409c70:	000a0c93          	mv	s9,s4
80409c74:	00412783          	lw	a5,4(sp)
80409c78:	01942223          	sw	s9,4(s0)
80409c7c:	00f42423          	sw	a5,8(s0)
80409c80:	008ca023          	sw	s0,0(s9)
80409c84:	00012783          	lw	a5,0(sp)
80409c88:	008da223          	sw	s0,4(s11)
80409c8c:	00fda423          	sw	a5,8(s11)
80409c90:	01b42023          	sw	s11,0(s0)
80409c94:	000d8413          	mv	s0,s11
80409c98:	c99ff06f          	j	80409930 <stride_dequeue+0x430>
80409c9c:	004da783          	lw	a5,4(s11)
80409ca0:	008daa03          	lw	s4,8(s11)
80409ca4:	00f12223          	sw	a5,4(sp)
80409ca8:	120a0463          	beqz	s4,80409dd0 <stride_dequeue+0x8d0>
80409cac:	000c8593          	mv	a1,s9
80409cb0:	000a0513          	mv	a0,s4
80409cb4:	cb8ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409cb8:	fff00893          	li	a7,-1
80409cbc:	4b1500e3          	beq	a0,a7,8040a95c <stride_dequeue+0x145c>
80409cc0:	004ca783          	lw	a5,4(s9)
80409cc4:	008ca803          	lw	a6,8(s9)
80409cc8:	00f12423          	sw	a5,8(sp)
80409ccc:	0e080a63          	beqz	a6,80409dc0 <stride_dequeue+0x8c0>
80409cd0:	00080593          	mv	a1,a6
80409cd4:	000a0513          	mv	a0,s4
80409cd8:	01012623          	sw	a6,12(sp)
80409cdc:	c90ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409ce0:	fff00893          	li	a7,-1
80409ce4:	00c12803          	lw	a6,12(sp)
80409ce8:	01151463          	bne	a0,a7,80409cf0 <stride_dequeue+0x7f0>
80409cec:	4e00106f          	j	8040b1cc <stride_dequeue+0x1ccc>
80409cf0:	00482783          	lw	a5,4(a6)
80409cf4:	00882983          	lw	s3,8(a6)
80409cf8:	00f12623          	sw	a5,12(sp)
80409cfc:	00099463          	bnez	s3,80409d04 <stride_dequeue+0x804>
80409d00:	2b00206f          	j	8040bfb0 <stride_dequeue+0x2ab0>
80409d04:	00098593          	mv	a1,s3
80409d08:	000a0513          	mv	a0,s4
80409d0c:	01012823          	sw	a6,16(sp)
80409d10:	c5cff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409d14:	fff00893          	li	a7,-1
80409d18:	01012803          	lw	a6,16(sp)
80409d1c:	01151463          	bne	a0,a7,80409d24 <stride_dequeue+0x824>
80409d20:	7a10106f          	j	8040bcc0 <stride_dequeue+0x27c0>
80409d24:	0049a783          	lw	a5,4(s3)
80409d28:	0089ae03          	lw	t3,8(s3)
80409d2c:	00f12823          	sw	a5,16(sp)
80409d30:	060e0463          	beqz	t3,80409d98 <stride_dequeue+0x898>
80409d34:	000e0593          	mv	a1,t3
80409d38:	000a0513          	mv	a0,s4
80409d3c:	01012c23          	sw	a6,24(sp)
80409d40:	01c12a23          	sw	t3,20(sp)
80409d44:	c28ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409d48:	fff00893          	li	a7,-1
80409d4c:	01412e03          	lw	t3,20(sp)
80409d50:	01812803          	lw	a6,24(sp)
80409d54:	01151463          	bne	a0,a7,80409d5c <stride_dequeue+0x85c>
80409d58:	59c0206f          	j	8040c2f4 <stride_dequeue+0x2df4>
80409d5c:	008e2583          	lw	a1,8(t3)
80409d60:	000a0513          	mv	a0,s4
80409d64:	004e2b03          	lw	s6,4(t3)
80409d68:	01012c23          	sw	a6,24(sp)
80409d6c:	01c12a23          	sw	t3,20(sp)
80409d70:	cb8ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
80409d74:	01412e03          	lw	t3,20(sp)
80409d78:	01812803          	lw	a6,24(sp)
80409d7c:	00ae2223          	sw	a0,4(t3)
80409d80:	016e2423          	sw	s6,8(t3)
80409d84:	00051463          	bnez	a0,80409d8c <stride_dequeue+0x88c>
80409d88:	7d00206f          	j	8040c558 <stride_dequeue+0x3058>
80409d8c:	008c2b03          	lw	s6,8(s8)
80409d90:	01c52023          	sw	t3,0(a0)
80409d94:	000e0a13          	mv	s4,t3
80409d98:	01012783          	lw	a5,16(sp)
80409d9c:	0149a223          	sw	s4,4(s3)
80409da0:	00f9a423          	sw	a5,8(s3)
80409da4:	013a2023          	sw	s3,0(s4)
80409da8:	00c12783          	lw	a5,12(sp)
80409dac:	01382223          	sw	s3,4(a6)
80409db0:	00080a13          	mv	s4,a6
80409db4:	00f82423          	sw	a5,8(a6)
80409db8:	0109a023          	sw	a6,0(s3)
80409dbc:	000b0993          	mv	s3,s6
80409dc0:	00812783          	lw	a5,8(sp)
80409dc4:	014ca223          	sw	s4,4(s9)
80409dc8:	00fca423          	sw	a5,8(s9)
80409dcc:	019a2023          	sw	s9,0(s4)
80409dd0:	00412783          	lw	a5,4(sp)
80409dd4:	019da223          	sw	s9,4(s11)
80409dd8:	00fda423          	sw	a5,8(s11)
80409ddc:	01bca023          	sw	s11,0(s9)
80409de0:	b41ff06f          	j	80409920 <stride_dequeue+0x420>
80409de4:	004da783          	lw	a5,4(s11)
80409de8:	008da603          	lw	a2,8(s11)
80409dec:	00f12023          	sw	a5,0(sp)
80409df0:	14060463          	beqz	a2,80409f38 <stride_dequeue+0xa38>
80409df4:	00060513          	mv	a0,a2
80409df8:	000a0593          	mv	a1,s4
80409dfc:	00c12223          	sw	a2,4(sp)
80409e00:	b6cff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409e04:	fff00893          	li	a7,-1
80409e08:	00412603          	lw	a2,4(sp)
80409e0c:	111502e3          	beq	a0,a7,8040a710 <stride_dequeue+0x1210>
80409e10:	004a2783          	lw	a5,4(s4)
80409e14:	008a2803          	lw	a6,8(s4)
80409e18:	00f12223          	sw	a5,4(sp)
80409e1c:	10080663          	beqz	a6,80409f28 <stride_dequeue+0xa28>
80409e20:	00080593          	mv	a1,a6
80409e24:	00060513          	mv	a0,a2
80409e28:	01012623          	sw	a6,12(sp)
80409e2c:	00c12423          	sw	a2,8(sp)
80409e30:	b3cff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409e34:	fff00893          	li	a7,-1
80409e38:	00812603          	lw	a2,8(sp)
80409e3c:	00c12803          	lw	a6,12(sp)
80409e40:	01151463          	bne	a0,a7,80409e48 <stride_dequeue+0x948>
80409e44:	5540106f          	j	8040b398 <stride_dequeue+0x1e98>
80409e48:	00482783          	lw	a5,4(a6)
80409e4c:	00882983          	lw	s3,8(a6)
80409e50:	00f12423          	sw	a5,8(sp)
80409e54:	00099463          	bnez	s3,80409e5c <stride_dequeue+0x95c>
80409e58:	1980206f          	j	8040bff0 <stride_dequeue+0x2af0>
80409e5c:	00060513          	mv	a0,a2
80409e60:	00098593          	mv	a1,s3
80409e64:	01012823          	sw	a6,16(sp)
80409e68:	00c12623          	sw	a2,12(sp)
80409e6c:	b00ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409e70:	fff00893          	li	a7,-1
80409e74:	00c12603          	lw	a2,12(sp)
80409e78:	01012803          	lw	a6,16(sp)
80409e7c:	01151463          	bne	a0,a7,80409e84 <stride_dequeue+0x984>
80409e80:	4290106f          	j	8040baa8 <stride_dequeue+0x25a8>
80409e84:	0049a783          	lw	a5,4(s3)
80409e88:	0089ae03          	lw	t3,8(s3)
80409e8c:	00f12623          	sw	a5,12(sp)
80409e90:	060e0863          	beqz	t3,80409f00 <stride_dequeue+0xa00>
80409e94:	000e0593          	mv	a1,t3
80409e98:	00060513          	mv	a0,a2
80409e9c:	01012c23          	sw	a6,24(sp)
80409ea0:	01c12a23          	sw	t3,20(sp)
80409ea4:	00c12823          	sw	a2,16(sp)
80409ea8:	ac4ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409eac:	01812803          	lw	a6,24(sp)
80409eb0:	01412e03          	lw	t3,20(sp)
80409eb4:	fff00893          	li	a7,-1
80409eb8:	01012a23          	sw	a6,20(sp)
80409ebc:	01012603          	lw	a2,16(sp)
80409ec0:	01151463          	bne	a0,a7,80409ec8 <stride_dequeue+0x9c8>
80409ec4:	3a00206f          	j	8040c264 <stride_dequeue+0x2d64>
80409ec8:	008e2583          	lw	a1,8(t3)
80409ecc:	00060513          	mv	a0,a2
80409ed0:	004e2b03          	lw	s6,4(t3)
80409ed4:	01c12823          	sw	t3,16(sp)
80409ed8:	b50ff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
80409edc:	01012e03          	lw	t3,16(sp)
80409ee0:	01412803          	lw	a6,20(sp)
80409ee4:	00ae2223          	sw	a0,4(t3)
80409ee8:	016e2423          	sw	s6,8(t3)
80409eec:	00051463          	bnez	a0,80409ef4 <stride_dequeue+0x9f4>
80409ef0:	62c0206f          	j	8040c51c <stride_dequeue+0x301c>
80409ef4:	008c2b03          	lw	s6,8(s8)
80409ef8:	01c52023          	sw	t3,0(a0)
80409efc:	000e0613          	mv	a2,t3
80409f00:	00c12783          	lw	a5,12(sp)
80409f04:	00c9a223          	sw	a2,4(s3)
80409f08:	00f9a423          	sw	a5,8(s3)
80409f0c:	01362023          	sw	s3,0(a2)
80409f10:	00812783          	lw	a5,8(sp)
80409f14:	01382223          	sw	s3,4(a6)
80409f18:	00080613          	mv	a2,a6
80409f1c:	00f82423          	sw	a5,8(a6)
80409f20:	0109a023          	sw	a6,0(s3)
80409f24:	000b0993          	mv	s3,s6
80409f28:	00412783          	lw	a5,4(sp)
80409f2c:	00ca2223          	sw	a2,4(s4)
80409f30:	00fa2423          	sw	a5,8(s4)
80409f34:	01462023          	sw	s4,0(a2)
80409f38:	00012783          	lw	a5,0(sp)
80409f3c:	014da223          	sw	s4,4(s11)
80409f40:	00fda423          	sw	a5,8(s11)
80409f44:	01ba2023          	sw	s11,0(s4)
80409f48:	000d8a13          	mv	s4,s11
80409f4c:	badff06f          	j	80409af8 <stride_dequeue+0x5f8>
80409f50:	00492783          	lw	a5,4(s2)
80409f54:	00892883          	lw	a7,8(s2)
80409f58:	00a12623          	sw	a0,12(sp)
80409f5c:	00f12423          	sw	a5,8(sp)
80409f60:	0e088863          	beqz	a7,8040a050 <stride_dequeue+0xb50>
80409f64:	00088513          	mv	a0,a7
80409f68:	000c8593          	mv	a1,s9
80409f6c:	01112823          	sw	a7,16(sp)
80409f70:	9fcff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409f74:	00c12803          	lw	a6,12(sp)
80409f78:	01012883          	lw	a7,16(sp)
80409f7c:	2f050ce3          	beq	a0,a6,8040aa74 <stride_dequeue+0x1574>
80409f80:	004ca783          	lw	a5,4(s9)
80409f84:	008ca303          	lw	t1,8(s9)
80409f88:	01012823          	sw	a6,16(sp)
80409f8c:	00f12623          	sw	a5,12(sp)
80409f90:	0a030863          	beqz	t1,8040a040 <stride_dequeue+0xb40>
80409f94:	00030593          	mv	a1,t1
80409f98:	00088513          	mv	a0,a7
80409f9c:	00612c23          	sw	t1,24(sp)
80409fa0:	01112a23          	sw	a7,20(sp)
80409fa4:	9c8ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409fa8:	01012803          	lw	a6,16(sp)
80409fac:	01412883          	lw	a7,20(sp)
80409fb0:	01812303          	lw	t1,24(sp)
80409fb4:	01051463          	bne	a0,a6,80409fbc <stride_dequeue+0xabc>
80409fb8:	6f00106f          	j	8040b6a8 <stride_dequeue+0x21a8>
80409fbc:	00432783          	lw	a5,4(t1)
80409fc0:	00832983          	lw	s3,8(t1)
80409fc4:	01012a23          	sw	a6,20(sp)
80409fc8:	00f12823          	sw	a5,16(sp)
80409fcc:	00099463          	bnez	s3,80409fd4 <stride_dequeue+0xad4>
80409fd0:	3e50106f          	j	8040bbb4 <stride_dequeue+0x26b4>
80409fd4:	00088513          	mv	a0,a7
80409fd8:	00098593          	mv	a1,s3
80409fdc:	00612e23          	sw	t1,28(sp)
80409fe0:	01112c23          	sw	a7,24(sp)
80409fe4:	988ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
80409fe8:	01412803          	lw	a6,20(sp)
80409fec:	01812883          	lw	a7,24(sp)
80409ff0:	01c12303          	lw	t1,28(sp)
80409ff4:	01051463          	bne	a0,a6,80409ffc <stride_dequeue+0xafc>
80409ff8:	6d90106f          	j	8040bed0 <stride_dequeue+0x29d0>
80409ffc:	0089a583          	lw	a1,8(s3)
8040a000:	0049ab03          	lw	s6,4(s3)
8040a004:	00088513          	mv	a0,a7
8040a008:	00612a23          	sw	t1,20(sp)
8040a00c:	a1cff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a010:	00a9a223          	sw	a0,4(s3)
8040a014:	0169a423          	sw	s6,8(s3)
8040a018:	01412303          	lw	t1,20(sp)
8040a01c:	00050463          	beqz	a0,8040a024 <stride_dequeue+0xb24>
8040a020:	01352023          	sw	s3,0(a0)
8040a024:	008c2b03          	lw	s6,8(s8)
8040a028:	01012783          	lw	a5,16(sp)
8040a02c:	01332223          	sw	s3,4(t1)
8040a030:	00030893          	mv	a7,t1
8040a034:	00f32423          	sw	a5,8(t1)
8040a038:	0069a023          	sw	t1,0(s3)
8040a03c:	000b0993          	mv	s3,s6
8040a040:	00c12783          	lw	a5,12(sp)
8040a044:	011ca223          	sw	a7,4(s9)
8040a048:	00fca423          	sw	a5,8(s9)
8040a04c:	0198a023          	sw	s9,0(a7) # 2000 <_binary_bin_swap_img_size-0x6000>
8040a050:	00812783          	lw	a5,8(sp)
8040a054:	01992223          	sw	s9,4(s2)
8040a058:	00f92423          	sw	a5,8(s2)
8040a05c:	012ca023          	sw	s2,0(s9)
8040a060:	ea0ff06f          	j	80409700 <stride_dequeue+0x200>
8040a064:	00492783          	lw	a5,4(s2)
8040a068:	00892c83          	lw	s9,8(s2)
8040a06c:	00f12223          	sw	a5,4(sp)
8040a070:	120c8463          	beqz	s9,8040a198 <stride_dequeue+0xc98>
8040a074:	000d8593          	mv	a1,s11
8040a078:	000c8513          	mv	a0,s9
8040a07c:	8f0ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a080:	fff00893          	li	a7,-1
8040a084:	27150663          	beq	a0,a7,8040a2f0 <stride_dequeue+0xdf0>
8040a088:	004da783          	lw	a5,4(s11)
8040a08c:	008da803          	lw	a6,8(s11)
8040a090:	00f12423          	sw	a5,8(sp)
8040a094:	0e080a63          	beqz	a6,8040a188 <stride_dequeue+0xc88>
8040a098:	00080593          	mv	a1,a6
8040a09c:	000c8513          	mv	a0,s9
8040a0a0:	01012623          	sw	a6,12(sp)
8040a0a4:	8c8ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a0a8:	fff00893          	li	a7,-1
8040a0ac:	00c12803          	lw	a6,12(sp)
8040a0b0:	29150ee3          	beq	a0,a7,8040ab4c <stride_dequeue+0x164c>
8040a0b4:	00482783          	lw	a5,4(a6)
8040a0b8:	00882303          	lw	t1,8(a6)
8040a0bc:	00f12623          	sw	a5,12(sp)
8040a0c0:	0a030a63          	beqz	t1,8040a174 <stride_dequeue+0xc74>
8040a0c4:	00030593          	mv	a1,t1
8040a0c8:	000c8513          	mv	a0,s9
8040a0cc:	01012a23          	sw	a6,20(sp)
8040a0d0:	00612823          	sw	t1,16(sp)
8040a0d4:	898ff0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a0d8:	fff00893          	li	a7,-1
8040a0dc:	01012303          	lw	t1,16(sp)
8040a0e0:	01412803          	lw	a6,20(sp)
8040a0e4:	01151463          	bne	a0,a7,8040a0ec <stride_dequeue+0xbec>
8040a0e8:	4b80106f          	j	8040b5a0 <stride_dequeue+0x20a0>
8040a0ec:	00432783          	lw	a5,4(t1)
8040a0f0:	00832983          	lw	s3,8(t1)
8040a0f4:	00f12823          	sw	a5,16(sp)
8040a0f8:	00099463          	bnez	s3,8040a100 <stride_dequeue+0xc00>
8040a0fc:	4c10106f          	j	8040bdbc <stride_dequeue+0x28bc>
8040a100:	00098593          	mv	a1,s3
8040a104:	000c8513          	mv	a0,s9
8040a108:	00612c23          	sw	t1,24(sp)
8040a10c:	01012a23          	sw	a6,20(sp)
8040a110:	85cff0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a114:	fff00893          	li	a7,-1
8040a118:	01412803          	lw	a6,20(sp)
8040a11c:	01812303          	lw	t1,24(sp)
8040a120:	01151463          	bne	a0,a7,8040a128 <stride_dequeue+0xc28>
8040a124:	5e90106f          	j	8040bf0c <stride_dequeue+0x2a0c>
8040a128:	0089a583          	lw	a1,8(s3)
8040a12c:	0049ab03          	lw	s6,4(s3)
8040a130:	000c8513          	mv	a0,s9
8040a134:	00612c23          	sw	t1,24(sp)
8040a138:	01012a23          	sw	a6,20(sp)
8040a13c:	8ecff0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a140:	00a9a223          	sw	a0,4(s3)
8040a144:	0169a423          	sw	s6,8(s3)
8040a148:	01412803          	lw	a6,20(sp)
8040a14c:	01812303          	lw	t1,24(sp)
8040a150:	00050463          	beqz	a0,8040a158 <stride_dequeue+0xc58>
8040a154:	01352023          	sw	s3,0(a0)
8040a158:	008c2b03          	lw	s6,8(s8)
8040a15c:	01012783          	lw	a5,16(sp)
8040a160:	01332223          	sw	s3,4(t1)
8040a164:	00030c93          	mv	s9,t1
8040a168:	00f32423          	sw	a5,8(t1)
8040a16c:	0069a023          	sw	t1,0(s3)
8040a170:	000b0993          	mv	s3,s6
8040a174:	00c12783          	lw	a5,12(sp)
8040a178:	01982223          	sw	s9,4(a6)
8040a17c:	00f82423          	sw	a5,8(a6)
8040a180:	010ca023          	sw	a6,0(s9)
8040a184:	00080c93          	mv	s9,a6
8040a188:	00812783          	lw	a5,8(sp)
8040a18c:	019da223          	sw	s9,4(s11)
8040a190:	00fda423          	sw	a5,8(s11)
8040a194:	01bca023          	sw	s11,0(s9)
8040a198:	00412783          	lw	a5,4(sp)
8040a19c:	01b92223          	sw	s11,4(s2)
8040a1a0:	00f92423          	sw	a5,8(s2)
8040a1a4:	012da023          	sw	s2,0(s11)
8040a1a8:	d6cff06f          	j	80409714 <stride_dequeue+0x214>
8040a1ac:	004ca783          	lw	a5,4(s9)
8040a1b0:	008caa03          	lw	s4,8(s9)
8040a1b4:	00f12223          	sw	a5,4(sp)
8040a1b8:	120a0063          	beqz	s4,8040a2d8 <stride_dequeue+0xdd8>
8040a1bc:	00040593          	mv	a1,s0
8040a1c0:	000a0513          	mv	a0,s4
8040a1c4:	fa9fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a1c8:	fff00893          	li	a7,-1
8040a1cc:	49150ee3          	beq	a0,a7,8040ae68 <stride_dequeue+0x1968>
8040a1d0:	00442783          	lw	a5,4(s0)
8040a1d4:	00842983          	lw	s3,8(s0)
8040a1d8:	00f12423          	sw	a5,8(sp)
8040a1dc:	00099463          	bnez	s3,8040a1e4 <stride_dequeue+0xce4>
8040a1e0:	4710106f          	j	8040be50 <stride_dequeue+0x2950>
8040a1e4:	00098593          	mv	a1,s3
8040a1e8:	000a0513          	mv	a0,s4
8040a1ec:	f81fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a1f0:	fff00893          	li	a7,-1
8040a1f4:	01151463          	bne	a0,a7,8040a1fc <stride_dequeue+0xcfc>
8040a1f8:	5dc0106f          	j	8040b7d4 <stride_dequeue+0x22d4>
8040a1fc:	0049a783          	lw	a5,4(s3)
8040a200:	0089a303          	lw	t1,8(s3)
8040a204:	00f12623          	sw	a5,12(sp)
8040a208:	0a030663          	beqz	t1,8040a2b4 <stride_dequeue+0xdb4>
8040a20c:	00030593          	mv	a1,t1
8040a210:	000a0513          	mv	a0,s4
8040a214:	00612823          	sw	t1,16(sp)
8040a218:	f55fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a21c:	fff00893          	li	a7,-1
8040a220:	01012303          	lw	t1,16(sp)
8040a224:	01151463          	bne	a0,a7,8040a22c <stride_dequeue+0xd2c>
8040a228:	1cc0206f          	j	8040c3f4 <stride_dequeue+0x2ef4>
8040a22c:	00432783          	lw	a5,4(t1)
8040a230:	00832e03          	lw	t3,8(t1)
8040a234:	00f12823          	sw	a5,16(sp)
8040a238:	060e0463          	beqz	t3,8040a2a0 <stride_dequeue+0xda0>
8040a23c:	000e0593          	mv	a1,t3
8040a240:	000a0513          	mv	a0,s4
8040a244:	00612c23          	sw	t1,24(sp)
8040a248:	01c12a23          	sw	t3,20(sp)
8040a24c:	f21fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a250:	fff00893          	li	a7,-1
8040a254:	01412e03          	lw	t3,20(sp)
8040a258:	01812303          	lw	t1,24(sp)
8040a25c:	01151463          	bne	a0,a7,8040a264 <stride_dequeue+0xd64>
8040a260:	66c0206f          	j	8040c8cc <stride_dequeue+0x33cc>
8040a264:	008e2583          	lw	a1,8(t3)
8040a268:	000a0513          	mv	a0,s4
8040a26c:	004e2b03          	lw	s6,4(t3)
8040a270:	00612c23          	sw	t1,24(sp)
8040a274:	01c12a23          	sw	t3,20(sp)
8040a278:	fb1fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a27c:	01412e03          	lw	t3,20(sp)
8040a280:	01812303          	lw	t1,24(sp)
8040a284:	00ae2223          	sw	a0,4(t3)
8040a288:	016e2423          	sw	s6,8(t3)
8040a28c:	00051463          	bnez	a0,8040a294 <stride_dequeue+0xd94>
8040a290:	1110206f          	j	8040cba0 <stride_dequeue+0x36a0>
8040a294:	008c2b03          	lw	s6,8(s8)
8040a298:	01c52023          	sw	t3,0(a0)
8040a29c:	000e0a13          	mv	s4,t3
8040a2a0:	01012783          	lw	a5,16(sp)
8040a2a4:	01432223          	sw	s4,4(t1)
8040a2a8:	00f32423          	sw	a5,8(t1)
8040a2ac:	006a2023          	sw	t1,0(s4)
8040a2b0:	00030a13          	mv	s4,t1
8040a2b4:	00c12783          	lw	a5,12(sp)
8040a2b8:	0149a223          	sw	s4,4(s3)
8040a2bc:	00f9a423          	sw	a5,8(s3)
8040a2c0:	013a2023          	sw	s3,0(s4)
8040a2c4:	00812783          	lw	a5,8(sp)
8040a2c8:	01342223          	sw	s3,4(s0)
8040a2cc:	00f42423          	sw	a5,8(s0)
8040a2d0:	0089a023          	sw	s0,0(s3)
8040a2d4:	000b0993          	mv	s3,s6
8040a2d8:	00412783          	lw	a5,4(sp)
8040a2dc:	008ca223          	sw	s0,4(s9)
8040a2e0:	00fca423          	sw	a5,8(s9)
8040a2e4:	01942023          	sw	s9,0(s0)
8040a2e8:	000c8413          	mv	s0,s9
8040a2ec:	999ff06f          	j	80409c84 <stride_dequeue+0x784>
8040a2f0:	004ca783          	lw	a5,4(s9)
8040a2f4:	008ca883          	lw	a7,8(s9)
8040a2f8:	00a12623          	sw	a0,12(sp)
8040a2fc:	00f12423          	sw	a5,8(sp)
8040a300:	0e088663          	beqz	a7,8040a3ec <stride_dequeue+0xeec>
8040a304:	00088513          	mv	a0,a7
8040a308:	000d8593          	mv	a1,s11
8040a30c:	01112823          	sw	a7,16(sp)
8040a310:	e5dfe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a314:	00c12803          	lw	a6,12(sp)
8040a318:	01012883          	lw	a7,16(sp)
8040a31c:	41050ae3          	beq	a0,a6,8040af30 <stride_dequeue+0x1a30>
8040a320:	004da783          	lw	a5,4(s11)
8040a324:	008da983          	lw	s3,8(s11)
8040a328:	01012823          	sw	a6,16(sp)
8040a32c:	00f12623          	sw	a5,12(sp)
8040a330:	00099463          	bnez	s3,8040a338 <stride_dequeue+0xe38>
8040a334:	4b50106f          	j	8040bfe8 <stride_dequeue+0x2ae8>
8040a338:	00088513          	mv	a0,a7
8040a33c:	00098593          	mv	a1,s3
8040a340:	01112a23          	sw	a7,20(sp)
8040a344:	e29fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a348:	01012803          	lw	a6,16(sp)
8040a34c:	01412883          	lw	a7,20(sp)
8040a350:	01051463          	bne	a0,a6,8040a358 <stride_dequeue+0xe58>
8040a354:	64c0106f          	j	8040b9a0 <stride_dequeue+0x24a0>
8040a358:	0049a783          	lw	a5,4(s3)
8040a35c:	0089ae03          	lw	t3,8(s3)
8040a360:	01012a23          	sw	a6,20(sp)
8040a364:	00f12823          	sw	a5,16(sp)
8040a368:	060e0063          	beqz	t3,8040a3c8 <stride_dequeue+0xec8>
8040a36c:	000e0593          	mv	a1,t3
8040a370:	00088513          	mv	a0,a7
8040a374:	01c12e23          	sw	t3,28(sp)
8040a378:	01112c23          	sw	a7,24(sp)
8040a37c:	df1fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a380:	01412803          	lw	a6,20(sp)
8040a384:	01812883          	lw	a7,24(sp)
8040a388:	01c12e03          	lw	t3,28(sp)
8040a38c:	01051463          	bne	a0,a6,8040a394 <stride_dequeue+0xe94>
8040a390:	0bc0206f          	j	8040c44c <stride_dequeue+0x2f4c>
8040a394:	008e2583          	lw	a1,8(t3)
8040a398:	00088513          	mv	a0,a7
8040a39c:	004e2b03          	lw	s6,4(t3)
8040a3a0:	01c12a23          	sw	t3,20(sp)
8040a3a4:	e85fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a3a8:	01412e03          	lw	t3,20(sp)
8040a3ac:	00ae2223          	sw	a0,4(t3)
8040a3b0:	016e2423          	sw	s6,8(t3)
8040a3b4:	00051463          	bnez	a0,8040a3bc <stride_dequeue+0xebc>
8040a3b8:	2380206f          	j	8040c5f0 <stride_dequeue+0x30f0>
8040a3bc:	008c2b03          	lw	s6,8(s8)
8040a3c0:	01c52023          	sw	t3,0(a0)
8040a3c4:	000e0893          	mv	a7,t3
8040a3c8:	01012783          	lw	a5,16(sp)
8040a3cc:	0119a223          	sw	a7,4(s3)
8040a3d0:	00f9a423          	sw	a5,8(s3)
8040a3d4:	0138a023          	sw	s3,0(a7)
8040a3d8:	00c12783          	lw	a5,12(sp)
8040a3dc:	013da223          	sw	s3,4(s11)
8040a3e0:	00fda423          	sw	a5,8(s11)
8040a3e4:	01b9a023          	sw	s11,0(s3)
8040a3e8:	000b0993          	mv	s3,s6
8040a3ec:	00812783          	lw	a5,8(sp)
8040a3f0:	01bca223          	sw	s11,4(s9)
8040a3f4:	00fca423          	sw	a5,8(s9)
8040a3f8:	019da023          	sw	s9,0(s11)
8040a3fc:	000c8d93          	mv	s11,s9
8040a400:	d99ff06f          	j	8040a198 <stride_dequeue+0xc98>
8040a404:	004da783          	lw	a5,4(s11)
8040a408:	008da883          	lw	a7,8(s11)
8040a40c:	00a12423          	sw	a0,8(sp)
8040a410:	00f12223          	sw	a5,4(sp)
8040a414:	10088663          	beqz	a7,8040a520 <stride_dequeue+0x1020>
8040a418:	00060593          	mv	a1,a2
8040a41c:	00088513          	mv	a0,a7
8040a420:	00c12823          	sw	a2,16(sp)
8040a424:	01112623          	sw	a7,12(sp)
8040a428:	d45fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a42c:	00812803          	lw	a6,8(sp)
8040a430:	00c12883          	lw	a7,12(sp)
8040a434:	01012603          	lw	a2,16(sp)
8040a438:	670508e3          	beq	a0,a6,8040b2a8 <stride_dequeue+0x1da8>
8040a43c:	00462783          	lw	a5,4(a2)
8040a440:	00862983          	lw	s3,8(a2)
8040a444:	01012623          	sw	a6,12(sp)
8040a448:	00f12423          	sw	a5,8(sp)
8040a44c:	00099463          	bnez	s3,8040a454 <stride_dequeue+0xf54>
8040a450:	3910106f          	j	8040bfe0 <stride_dequeue+0x2ae0>
8040a454:	00088513          	mv	a0,a7
8040a458:	00098593          	mv	a1,s3
8040a45c:	00c12a23          	sw	a2,20(sp)
8040a460:	01112823          	sw	a7,16(sp)
8040a464:	d09fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a468:	00c12803          	lw	a6,12(sp)
8040a46c:	01012883          	lw	a7,16(sp)
8040a470:	01412603          	lw	a2,20(sp)
8040a474:	01051463          	bne	a0,a6,8040a47c <stride_dequeue+0xf7c>
8040a478:	5a40106f          	j	8040ba1c <stride_dequeue+0x251c>
8040a47c:	0049a783          	lw	a5,4(s3)
8040a480:	0089ae03          	lw	t3,8(s3)
8040a484:	01012823          	sw	a6,16(sp)
8040a488:	00f12623          	sw	a5,12(sp)
8040a48c:	060e0863          	beqz	t3,8040a4fc <stride_dequeue+0xffc>
8040a490:	000e0593          	mv	a1,t3
8040a494:	00088513          	mv	a0,a7
8040a498:	00c12e23          	sw	a2,28(sp)
8040a49c:	01c12c23          	sw	t3,24(sp)
8040a4a0:	01112a23          	sw	a7,20(sp)
8040a4a4:	cc9fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a4a8:	01c12603          	lw	a2,28(sp)
8040a4ac:	01012803          	lw	a6,16(sp)
8040a4b0:	01412883          	lw	a7,20(sp)
8040a4b4:	00c12a23          	sw	a2,20(sp)
8040a4b8:	01812e03          	lw	t3,24(sp)
8040a4bc:	01051463          	bne	a0,a6,8040a4c4 <stride_dequeue+0xfc4>
8040a4c0:	5210106f          	j	8040c1e0 <stride_dequeue+0x2ce0>
8040a4c4:	008e2583          	lw	a1,8(t3)
8040a4c8:	00088513          	mv	a0,a7
8040a4cc:	004e2b03          	lw	s6,4(t3)
8040a4d0:	01c12823          	sw	t3,16(sp)
8040a4d4:	d55fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a4d8:	01012e03          	lw	t3,16(sp)
8040a4dc:	01412603          	lw	a2,20(sp)
8040a4e0:	00ae2223          	sw	a0,4(t3)
8040a4e4:	016e2423          	sw	s6,8(t3)
8040a4e8:	00051463          	bnez	a0,8040a4f0 <stride_dequeue+0xff0>
8040a4ec:	1280206f          	j	8040c614 <stride_dequeue+0x3114>
8040a4f0:	008c2b03          	lw	s6,8(s8)
8040a4f4:	01c52023          	sw	t3,0(a0)
8040a4f8:	000e0893          	mv	a7,t3
8040a4fc:	00c12783          	lw	a5,12(sp)
8040a500:	0119a223          	sw	a7,4(s3)
8040a504:	00f9a423          	sw	a5,8(s3)
8040a508:	0138a023          	sw	s3,0(a7)
8040a50c:	00812783          	lw	a5,8(sp)
8040a510:	01362223          	sw	s3,4(a2)
8040a514:	00f62423          	sw	a5,8(a2)
8040a518:	00c9a023          	sw	a2,0(s3)
8040a51c:	000b0993          	mv	s3,s6
8040a520:	00412783          	lw	a5,4(sp)
8040a524:	00cda223          	sw	a2,4(s11)
8040a528:	00fda423          	sw	a5,8(s11)
8040a52c:	01b62023          	sw	s11,0(a2)
8040a530:	db8ff06f          	j	80409ae8 <stride_dequeue+0x5e8>
8040a534:	004da783          	lw	a5,4(s11)
8040a538:	008da883          	lw	a7,8(s11)
8040a53c:	00a12623          	sw	a0,12(sp)
8040a540:	00f12423          	sw	a5,8(sp)
8040a544:	0e088663          	beqz	a7,8040a630 <stride_dequeue+0x1130>
8040a548:	00088513          	mv	a0,a7
8040a54c:	000a0593          	mv	a1,s4
8040a550:	01112823          	sw	a7,16(sp)
8040a554:	c19fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a558:	00c12803          	lw	a6,12(sp)
8040a55c:	01012883          	lw	a7,16(sp)
8040a560:	2b0508e3          	beq	a0,a6,8040b010 <stride_dequeue+0x1b10>
8040a564:	004a2783          	lw	a5,4(s4)
8040a568:	008a2983          	lw	s3,8(s4)
8040a56c:	01012823          	sw	a6,16(sp)
8040a570:	00f12623          	sw	a5,12(sp)
8040a574:	00099463          	bnez	s3,8040a57c <stride_dequeue+0x107c>
8040a578:	2810106f          	j	8040bff8 <stride_dequeue+0x2af8>
8040a57c:	00088513          	mv	a0,a7
8040a580:	00098593          	mv	a1,s3
8040a584:	01112a23          	sw	a7,20(sp)
8040a588:	be5fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a58c:	01012803          	lw	a6,16(sp)
8040a590:	01412883          	lw	a7,20(sp)
8040a594:	01051463          	bne	a0,a6,8040a59c <stride_dequeue+0x109c>
8040a598:	38c0106f          	j	8040b924 <stride_dequeue+0x2424>
8040a59c:	0049a783          	lw	a5,4(s3)
8040a5a0:	0089ae03          	lw	t3,8(s3)
8040a5a4:	01012a23          	sw	a6,20(sp)
8040a5a8:	00f12823          	sw	a5,16(sp)
8040a5ac:	060e0063          	beqz	t3,8040a60c <stride_dequeue+0x110c>
8040a5b0:	000e0593          	mv	a1,t3
8040a5b4:	00088513          	mv	a0,a7
8040a5b8:	01c12e23          	sw	t3,28(sp)
8040a5bc:	01112c23          	sw	a7,24(sp)
8040a5c0:	badfe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a5c4:	01412803          	lw	a6,20(sp)
8040a5c8:	01812883          	lw	a7,24(sp)
8040a5cc:	01c12e03          	lw	t3,28(sp)
8040a5d0:	01051463          	bne	a0,a6,8040a5d8 <stride_dequeue+0x10d8>
8040a5d4:	2890106f          	j	8040c05c <stride_dequeue+0x2b5c>
8040a5d8:	008e2583          	lw	a1,8(t3)
8040a5dc:	00088513          	mv	a0,a7
8040a5e0:	004e2b03          	lw	s6,4(t3)
8040a5e4:	01c12a23          	sw	t3,20(sp)
8040a5e8:	c41fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a5ec:	01412e03          	lw	t3,20(sp)
8040a5f0:	00ae2223          	sw	a0,4(t3)
8040a5f4:	016e2423          	sw	s6,8(t3)
8040a5f8:	00051463          	bnez	a0,8040a600 <stride_dequeue+0x1100>
8040a5fc:	7b50106f          	j	8040c5b0 <stride_dequeue+0x30b0>
8040a600:	008c2b03          	lw	s6,8(s8)
8040a604:	01c52023          	sw	t3,0(a0)
8040a608:	000e0893          	mv	a7,t3
8040a60c:	01012783          	lw	a5,16(sp)
8040a610:	0119a223          	sw	a7,4(s3)
8040a614:	00f9a423          	sw	a5,8(s3)
8040a618:	0138a023          	sw	s3,0(a7)
8040a61c:	00c12783          	lw	a5,12(sp)
8040a620:	013a2223          	sw	s3,4(s4)
8040a624:	00fa2423          	sw	a5,8(s4)
8040a628:	0149a023          	sw	s4,0(s3)
8040a62c:	000b0993          	mv	s3,s6
8040a630:	00812783          	lw	a5,8(sp)
8040a634:	014da223          	sw	s4,4(s11)
8040a638:	00fda423          	sw	a5,8(s11)
8040a63c:	01ba2023          	sw	s11,0(s4)
8040a640:	accff06f          	j	8040990c <stride_dequeue+0x40c>
8040a644:	00492783          	lw	a5,4(s2)
8040a648:	00892883          	lw	a7,8(s2)
8040a64c:	00a12823          	sw	a0,16(sp)
8040a650:	00f12623          	sw	a5,12(sp)
8040a654:	0a088463          	beqz	a7,8040a6fc <stride_dequeue+0x11fc>
8040a658:	00080593          	mv	a1,a6
8040a65c:	00088513          	mv	a0,a7
8040a660:	01012c23          	sw	a6,24(sp)
8040a664:	01112a23          	sw	a7,20(sp)
8040a668:	b05fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a66c:	01012303          	lw	t1,16(sp)
8040a670:	01412883          	lw	a7,20(sp)
8040a674:	01812803          	lw	a6,24(sp)
8040a678:	606508e3          	beq	a0,t1,8040b488 <stride_dequeue+0x1f88>
8040a67c:	00482783          	lw	a5,4(a6)
8040a680:	00882983          	lw	s3,8(a6)
8040a684:	00612a23          	sw	t1,20(sp)
8040a688:	00f12823          	sw	a5,16(sp)
8040a68c:	00099463          	bnez	s3,8040a694 <stride_dequeue+0x1194>
8040a690:	28c0106f          	j	8040b91c <stride_dequeue+0x241c>
8040a694:	00088513          	mv	a0,a7
8040a698:	00098593          	mv	a1,s3
8040a69c:	01012e23          	sw	a6,28(sp)
8040a6a0:	01112c23          	sw	a7,24(sp)
8040a6a4:	ac9fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a6a8:	01412303          	lw	t1,20(sp)
8040a6ac:	01812883          	lw	a7,24(sp)
8040a6b0:	01c12803          	lw	a6,28(sp)
8040a6b4:	00651463          	bne	a0,t1,8040a6bc <stride_dequeue+0x11bc>
8040a6b8:	0bd0106f          	j	8040bf74 <stride_dequeue+0x2a74>
8040a6bc:	0089a583          	lw	a1,8(s3)
8040a6c0:	0049ab03          	lw	s6,4(s3)
8040a6c4:	00088513          	mv	a0,a7
8040a6c8:	01012a23          	sw	a6,20(sp)
8040a6cc:	b5dfe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a6d0:	00a9a223          	sw	a0,4(s3)
8040a6d4:	0169a423          	sw	s6,8(s3)
8040a6d8:	01412803          	lw	a6,20(sp)
8040a6dc:	00050463          	beqz	a0,8040a6e4 <stride_dequeue+0x11e4>
8040a6e0:	01352023          	sw	s3,0(a0)
8040a6e4:	008c2b03          	lw	s6,8(s8)
8040a6e8:	01012783          	lw	a5,16(sp)
8040a6ec:	01382223          	sw	s3,4(a6)
8040a6f0:	00f82423          	sw	a5,8(a6)
8040a6f4:	0109a023          	sw	a6,0(s3)
8040a6f8:	000b0993          	mv	s3,s6
8040a6fc:	00c12783          	lw	a5,12(sp)
8040a700:	01092223          	sw	a6,4(s2)
8040a704:	00f92423          	sw	a5,8(s2)
8040a708:	01282023          	sw	s2,0(a6)
8040a70c:	fe1fe06f          	j	804096ec <stride_dequeue+0x1ec>
8040a710:	00462783          	lw	a5,4(a2)
8040a714:	00862983          	lw	s3,8(a2)
8040a718:	00a12423          	sw	a0,8(sp)
8040a71c:	00f12223          	sw	a5,4(sp)
8040a720:	10098663          	beqz	s3,8040a82c <stride_dequeue+0x132c>
8040a724:	000a0593          	mv	a1,s4
8040a728:	00098513          	mv	a0,s3
8040a72c:	00c12623          	sw	a2,12(sp)
8040a730:	a3dfe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a734:	00812303          	lw	t1,8(sp)
8040a738:	00c12603          	lw	a2,12(sp)
8040a73c:	00651463          	bne	a0,t1,8040a744 <stride_dequeue+0x1244>
8040a740:	0180106f          	j	8040b758 <stride_dequeue+0x2258>
8040a744:	004a2783          	lw	a5,4(s4)
8040a748:	008a2883          	lw	a7,8(s4)
8040a74c:	00612623          	sw	t1,12(sp)
8040a750:	00f12423          	sw	a5,8(sp)
8040a754:	0c088463          	beqz	a7,8040a81c <stride_dequeue+0x131c>
8040a758:	00088593          	mv	a1,a7
8040a75c:	00098513          	mv	a0,s3
8040a760:	00c12a23          	sw	a2,20(sp)
8040a764:	01112823          	sw	a7,16(sp)
8040a768:	a05fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a76c:	00c12303          	lw	t1,12(sp)
8040a770:	01012883          	lw	a7,16(sp)
8040a774:	01412603          	lw	a2,20(sp)
8040a778:	00651463          	bne	a0,t1,8040a780 <stride_dequeue+0x1280>
8040a77c:	4a10106f          	j	8040c41c <stride_dequeue+0x2f1c>
8040a780:	0048a783          	lw	a5,4(a7)
8040a784:	0088ae03          	lw	t3,8(a7)
8040a788:	00612e23          	sw	t1,28(sp)
8040a78c:	00f12623          	sw	a5,12(sp)
8040a790:	060e0c63          	beqz	t3,8040a808 <stride_dequeue+0x1308>
8040a794:	000e0593          	mv	a1,t3
8040a798:	00098513          	mv	a0,s3
8040a79c:	01112c23          	sw	a7,24(sp)
8040a7a0:	00c12a23          	sw	a2,20(sp)
8040a7a4:	01c12823          	sw	t3,16(sp)
8040a7a8:	9c5fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a7ac:	01c12303          	lw	t1,28(sp)
8040a7b0:	01012e03          	lw	t3,16(sp)
8040a7b4:	01412603          	lw	a2,20(sp)
8040a7b8:	01812883          	lw	a7,24(sp)
8040a7bc:	00651463          	bne	a0,t1,8040a7c4 <stride_dequeue+0x12c4>
8040a7c0:	7d50106f          	j	8040c794 <stride_dequeue+0x3294>
8040a7c4:	008e2583          	lw	a1,8(t3)
8040a7c8:	00098513          	mv	a0,s3
8040a7cc:	004e2b03          	lw	s6,4(t3)
8040a7d0:	01112c23          	sw	a7,24(sp)
8040a7d4:	00c12a23          	sw	a2,20(sp)
8040a7d8:	01c12823          	sw	t3,16(sp)
8040a7dc:	a4dfe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a7e0:	01012e03          	lw	t3,16(sp)
8040a7e4:	01412603          	lw	a2,20(sp)
8040a7e8:	01812883          	lw	a7,24(sp)
8040a7ec:	00ae2223          	sw	a0,4(t3)
8040a7f0:	016e2423          	sw	s6,8(t3)
8040a7f4:	00051463          	bnez	a0,8040a7fc <stride_dequeue+0x12fc>
8040a7f8:	2e80206f          	j	8040cae0 <stride_dequeue+0x35e0>
8040a7fc:	008c2b03          	lw	s6,8(s8)
8040a800:	01c52023          	sw	t3,0(a0)
8040a804:	000e0993          	mv	s3,t3
8040a808:	00c12783          	lw	a5,12(sp)
8040a80c:	0138a223          	sw	s3,4(a7)
8040a810:	00f8a423          	sw	a5,8(a7)
8040a814:	0119a023          	sw	a7,0(s3)
8040a818:	00088993          	mv	s3,a7
8040a81c:	00812783          	lw	a5,8(sp)
8040a820:	013a2223          	sw	s3,4(s4)
8040a824:	00fa2423          	sw	a5,8(s4)
8040a828:	0149a023          	sw	s4,0(s3)
8040a82c:	00412783          	lw	a5,4(sp)
8040a830:	01462223          	sw	s4,4(a2)
8040a834:	000b0993          	mv	s3,s6
8040a838:	00f62423          	sw	a5,8(a2)
8040a83c:	00ca2023          	sw	a2,0(s4)
8040a840:	00060a13          	mv	s4,a2
8040a844:	ef4ff06f          	j	80409f38 <stride_dequeue+0xa38>
8040a848:	004ca783          	lw	a5,4(s9)
8040a84c:	008ca983          	lw	s3,8(s9)
8040a850:	00a12623          	sw	a0,12(sp)
8040a854:	00f12423          	sw	a5,8(sp)
8040a858:	0e098663          	beqz	s3,8040a944 <stride_dequeue+0x1444>
8040a85c:	000a0593          	mv	a1,s4
8040a860:	00098513          	mv	a0,s3
8040a864:	909fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a868:	00c12303          	lw	t1,12(sp)
8040a86c:	00651463          	bne	a0,t1,8040a874 <stride_dequeue+0x1374>
8040a870:	7d10006f          	j	8040b840 <stride_dequeue+0x2340>
8040a874:	004a2783          	lw	a5,4(s4)
8040a878:	008a2883          	lw	a7,8(s4)
8040a87c:	00612823          	sw	t1,16(sp)
8040a880:	00f12623          	sw	a5,12(sp)
8040a884:	0a088863          	beqz	a7,8040a934 <stride_dequeue+0x1434>
8040a888:	00088593          	mv	a1,a7
8040a88c:	00098513          	mv	a0,s3
8040a890:	01112a23          	sw	a7,20(sp)
8040a894:	8d9fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a898:	01012303          	lw	t1,16(sp)
8040a89c:	01412883          	lw	a7,20(sp)
8040a8a0:	00651463          	bne	a0,t1,8040a8a8 <stride_dequeue+0x13a8>
8040a8a4:	1990106f          	j	8040c23c <stride_dequeue+0x2d3c>
8040a8a8:	0048a783          	lw	a5,4(a7)
8040a8ac:	0088ae03          	lw	t3,8(a7)
8040a8b0:	00612e23          	sw	t1,28(sp)
8040a8b4:	00f12823          	sw	a5,16(sp)
8040a8b8:	060e0463          	beqz	t3,8040a920 <stride_dequeue+0x1420>
8040a8bc:	000e0593          	mv	a1,t3
8040a8c0:	00098513          	mv	a0,s3
8040a8c4:	01112c23          	sw	a7,24(sp)
8040a8c8:	01c12a23          	sw	t3,20(sp)
8040a8cc:	8a1fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a8d0:	01c12303          	lw	t1,28(sp)
8040a8d4:	01412e03          	lw	t3,20(sp)
8040a8d8:	01812883          	lw	a7,24(sp)
8040a8dc:	00651463          	bne	a0,t1,8040a8e4 <stride_dequeue+0x13e4>
8040a8e0:	07c0206f          	j	8040c95c <stride_dequeue+0x345c>
8040a8e4:	008e2583          	lw	a1,8(t3)
8040a8e8:	00098513          	mv	a0,s3
8040a8ec:	004e2b03          	lw	s6,4(t3)
8040a8f0:	01112c23          	sw	a7,24(sp)
8040a8f4:	01c12a23          	sw	t3,20(sp)
8040a8f8:	931fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040a8fc:	01412e03          	lw	t3,20(sp)
8040a900:	01812883          	lw	a7,24(sp)
8040a904:	00ae2223          	sw	a0,4(t3)
8040a908:	016e2423          	sw	s6,8(t3)
8040a90c:	00051463          	bnez	a0,8040a914 <stride_dequeue+0x1414>
8040a910:	2780206f          	j	8040cb88 <stride_dequeue+0x3688>
8040a914:	008c2b03          	lw	s6,8(s8)
8040a918:	01c52023          	sw	t3,0(a0)
8040a91c:	000e0993          	mv	s3,t3
8040a920:	01012783          	lw	a5,16(sp)
8040a924:	0138a223          	sw	s3,4(a7)
8040a928:	00f8a423          	sw	a5,8(a7)
8040a92c:	0119a023          	sw	a7,0(s3)
8040a930:	00088993          	mv	s3,a7
8040a934:	00c12783          	lw	a5,12(sp)
8040a938:	013a2223          	sw	s3,4(s4)
8040a93c:	00fa2423          	sw	a5,8(s4)
8040a940:	0149a023          	sw	s4,0(s3)
8040a944:	00812783          	lw	a5,8(sp)
8040a948:	014ca223          	sw	s4,4(s9)
8040a94c:	000b0993          	mv	s3,s6
8040a950:	00fca423          	sw	a5,8(s9)
8040a954:	019a2023          	sw	s9,0(s4)
8040a958:	b1cff06f          	j	80409c74 <stride_dequeue+0x774>
8040a95c:	004a2783          	lw	a5,4(s4)
8040a960:	008a2983          	lw	s3,8(s4)
8040a964:	00a12623          	sw	a0,12(sp)
8040a968:	00f12423          	sw	a5,8(sp)
8040a96c:	0e098663          	beqz	s3,8040aa58 <stride_dequeue+0x1558>
8040a970:	000c8593          	mv	a1,s9
8040a974:	00098513          	mv	a0,s3
8040a978:	ff4fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a97c:	00c12303          	lw	t1,12(sp)
8040a980:	00651463          	bne	a0,t1,8040a988 <stride_dequeue+0x1488>
8040a984:	7290006f          	j	8040b8ac <stride_dequeue+0x23ac>
8040a988:	004ca783          	lw	a5,4(s9)
8040a98c:	008ca883          	lw	a7,8(s9)
8040a990:	00612823          	sw	t1,16(sp)
8040a994:	00f12623          	sw	a5,12(sp)
8040a998:	0a088863          	beqz	a7,8040aa48 <stride_dequeue+0x1548>
8040a99c:	00088593          	mv	a1,a7
8040a9a0:	00098513          	mv	a0,s3
8040a9a4:	01112a23          	sw	a7,20(sp)
8040a9a8:	fc4fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a9ac:	01012303          	lw	t1,16(sp)
8040a9b0:	01412883          	lw	a7,20(sp)
8040a9b4:	00651463          	bne	a0,t1,8040a9bc <stride_dequeue+0x14bc>
8040a9b8:	05d0106f          	j	8040c214 <stride_dequeue+0x2d14>
8040a9bc:	0048a783          	lw	a5,4(a7)
8040a9c0:	0088ae03          	lw	t3,8(a7)
8040a9c4:	00612e23          	sw	t1,28(sp)
8040a9c8:	00f12823          	sw	a5,16(sp)
8040a9cc:	060e0463          	beqz	t3,8040aa34 <stride_dequeue+0x1534>
8040a9d0:	000e0593          	mv	a1,t3
8040a9d4:	00098513          	mv	a0,s3
8040a9d8:	01112c23          	sw	a7,24(sp)
8040a9dc:	01c12a23          	sw	t3,20(sp)
8040a9e0:	f8cfe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040a9e4:	01c12303          	lw	t1,28(sp)
8040a9e8:	01412e03          	lw	t3,20(sp)
8040a9ec:	01812883          	lw	a7,24(sp)
8040a9f0:	00651463          	bne	a0,t1,8040a9f8 <stride_dequeue+0x14f8>
8040a9f4:	0040206f          	j	8040c9f8 <stride_dequeue+0x34f8>
8040a9f8:	008e2583          	lw	a1,8(t3)
8040a9fc:	00098513          	mv	a0,s3
8040aa00:	004e2b03          	lw	s6,4(t3)
8040aa04:	01112c23          	sw	a7,24(sp)
8040aa08:	01c12a23          	sw	t3,20(sp)
8040aa0c:	81dfe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040aa10:	01412e03          	lw	t3,20(sp)
8040aa14:	01812883          	lw	a7,24(sp)
8040aa18:	00ae2223          	sw	a0,4(t3)
8040aa1c:	016e2423          	sw	s6,8(t3)
8040aa20:	00051463          	bnez	a0,8040aa28 <stride_dequeue+0x1528>
8040aa24:	11c0206f          	j	8040cb40 <stride_dequeue+0x3640>
8040aa28:	008c2b03          	lw	s6,8(s8)
8040aa2c:	01c52023          	sw	t3,0(a0)
8040aa30:	000e0993          	mv	s3,t3
8040aa34:	01012783          	lw	a5,16(sp)
8040aa38:	0138a223          	sw	s3,4(a7)
8040aa3c:	00f8a423          	sw	a5,8(a7)
8040aa40:	0119a023          	sw	a7,0(s3)
8040aa44:	00088993          	mv	s3,a7
8040aa48:	00c12783          	lw	a5,12(sp)
8040aa4c:	013ca223          	sw	s3,4(s9)
8040aa50:	00fca423          	sw	a5,8(s9)
8040aa54:	0199a023          	sw	s9,0(s3)
8040aa58:	00812783          	lw	a5,8(sp)
8040aa5c:	019a2223          	sw	s9,4(s4)
8040aa60:	000b0993          	mv	s3,s6
8040aa64:	00fa2423          	sw	a5,8(s4)
8040aa68:	014ca023          	sw	s4,0(s9)
8040aa6c:	000a0c93          	mv	s9,s4
8040aa70:	b60ff06f          	j	80409dd0 <stride_dequeue+0x8d0>
8040aa74:	0048a783          	lw	a5,4(a7)
8040aa78:	0088a983          	lw	s3,8(a7)
8040aa7c:	00a12823          	sw	a0,16(sp)
8040aa80:	00f12623          	sw	a5,12(sp)
8040aa84:	0a098663          	beqz	s3,8040ab30 <stride_dequeue+0x1630>
8040aa88:	000c8593          	mv	a1,s9
8040aa8c:	00098513          	mv	a0,s3
8040aa90:	01112a23          	sw	a7,20(sp)
8040aa94:	ed8fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040aa98:	01012303          	lw	t1,16(sp)
8040aa9c:	01412883          	lw	a7,20(sp)
8040aaa0:	00651463          	bne	a0,t1,8040aaa8 <stride_dequeue+0x15a8>
8040aaa4:	2980106f          	j	8040bd3c <stride_dequeue+0x283c>
8040aaa8:	004ca783          	lw	a5,4(s9)
8040aaac:	008cae03          	lw	t3,8(s9)
8040aab0:	00612a23          	sw	t1,20(sp)
8040aab4:	00f12823          	sw	a5,16(sp)
8040aab8:	060e0463          	beqz	t3,8040ab20 <stride_dequeue+0x1620>
8040aabc:	000e0593          	mv	a1,t3
8040aac0:	00098513          	mv	a0,s3
8040aac4:	01112e23          	sw	a7,28(sp)
8040aac8:	01c12c23          	sw	t3,24(sp)
8040aacc:	ea0fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040aad0:	01412303          	lw	t1,20(sp)
8040aad4:	01812e03          	lw	t3,24(sp)
8040aad8:	01c12883          	lw	a7,28(sp)
8040aadc:	00651463          	bne	a0,t1,8040aae4 <stride_dequeue+0x15e4>
8040aae0:	0e50106f          	j	8040c3c4 <stride_dequeue+0x2ec4>
8040aae4:	008e2583          	lw	a1,8(t3)
8040aae8:	00098513          	mv	a0,s3
8040aaec:	004e2b03          	lw	s6,4(t3)
8040aaf0:	01112c23          	sw	a7,24(sp)
8040aaf4:	01c12a23          	sw	t3,20(sp)
8040aaf8:	f30fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040aafc:	01412e03          	lw	t3,20(sp)
8040ab00:	01812883          	lw	a7,24(sp)
8040ab04:	00ae2223          	sw	a0,4(t3)
8040ab08:	016e2423          	sw	s6,8(t3)
8040ab0c:	00051463          	bnez	a0,8040ab14 <stride_dequeue+0x1614>
8040ab10:	2ed0106f          	j	8040c5fc <stride_dequeue+0x30fc>
8040ab14:	008c2b03          	lw	s6,8(s8)
8040ab18:	01c52023          	sw	t3,0(a0)
8040ab1c:	000e0993          	mv	s3,t3
8040ab20:	01012783          	lw	a5,16(sp)
8040ab24:	013ca223          	sw	s3,4(s9)
8040ab28:	00fca423          	sw	a5,8(s9)
8040ab2c:	0199a023          	sw	s9,0(s3)
8040ab30:	00c12783          	lw	a5,12(sp)
8040ab34:	0198a223          	sw	s9,4(a7)
8040ab38:	000b0993          	mv	s3,s6
8040ab3c:	00f8a423          	sw	a5,8(a7)
8040ab40:	011ca023          	sw	a7,0(s9)
8040ab44:	00088c93          	mv	s9,a7
8040ab48:	d08ff06f          	j	8040a050 <stride_dequeue+0xb50>
8040ab4c:	004ca783          	lw	a5,4(s9)
8040ab50:	008ca983          	lw	s3,8(s9)
8040ab54:	00a12823          	sw	a0,16(sp)
8040ab58:	00f12623          	sw	a5,12(sp)
8040ab5c:	0a098663          	beqz	s3,8040ac08 <stride_dequeue+0x1708>
8040ab60:	00080593          	mv	a1,a6
8040ab64:	00098513          	mv	a0,s3
8040ab68:	01012a23          	sw	a6,20(sp)
8040ab6c:	e00fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ab70:	01012303          	lw	t1,16(sp)
8040ab74:	01412803          	lw	a6,20(sp)
8040ab78:	00651463          	bne	a0,t1,8040ab80 <stride_dequeue+0x1680>
8040ab7c:	7b90006f          	j	8040bb34 <stride_dequeue+0x2634>
8040ab80:	00482783          	lw	a5,4(a6)
8040ab84:	00882e03          	lw	t3,8(a6)
8040ab88:	00612a23          	sw	t1,20(sp)
8040ab8c:	00f12823          	sw	a5,16(sp)
8040ab90:	060e0463          	beqz	t3,8040abf8 <stride_dequeue+0x16f8>
8040ab94:	000e0593          	mv	a1,t3
8040ab98:	00098513          	mv	a0,s3
8040ab9c:	01012e23          	sw	a6,28(sp)
8040aba0:	01c12c23          	sw	t3,24(sp)
8040aba4:	dc8fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040aba8:	01412303          	lw	t1,20(sp)
8040abac:	01812e03          	lw	t3,24(sp)
8040abb0:	01c12803          	lw	a6,28(sp)
8040abb4:	00651463          	bne	a0,t1,8040abbc <stride_dequeue+0x16bc>
8040abb8:	7a80106f          	j	8040c360 <stride_dequeue+0x2e60>
8040abbc:	008e2583          	lw	a1,8(t3)
8040abc0:	00098513          	mv	a0,s3
8040abc4:	004e2b03          	lw	s6,4(t3)
8040abc8:	01012c23          	sw	a6,24(sp)
8040abcc:	01c12a23          	sw	t3,20(sp)
8040abd0:	e58fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040abd4:	01412e03          	lw	t3,20(sp)
8040abd8:	01812803          	lw	a6,24(sp)
8040abdc:	00ae2223          	sw	a0,4(t3)
8040abe0:	016e2423          	sw	s6,8(t3)
8040abe4:	00051463          	bnez	a0,8040abec <stride_dequeue+0x16ec>
8040abe8:	1950106f          	j	8040c57c <stride_dequeue+0x307c>
8040abec:	008c2b03          	lw	s6,8(s8)
8040abf0:	01c52023          	sw	t3,0(a0)
8040abf4:	000e0993          	mv	s3,t3
8040abf8:	01012783          	lw	a5,16(sp)
8040abfc:	01382223          	sw	s3,4(a6)
8040ac00:	00f82423          	sw	a5,8(a6)
8040ac04:	0109a023          	sw	a6,0(s3)
8040ac08:	00c12783          	lw	a5,12(sp)
8040ac0c:	010ca223          	sw	a6,4(s9)
8040ac10:	000b0993          	mv	s3,s6
8040ac14:	00fca423          	sw	a5,8(s9)
8040ac18:	01982023          	sw	s9,0(a6)
8040ac1c:	d6cff06f          	j	8040a188 <stride_dequeue+0xc88>
8040ac20:	004da783          	lw	a5,4(s11)
8040ac24:	008da983          	lw	s3,8(s11)
8040ac28:	00a12823          	sw	a0,16(sp)
8040ac2c:	00f12623          	sw	a5,12(sp)
8040ac30:	0a098663          	beqz	s3,8040acdc <stride_dequeue+0x17dc>
8040ac34:	00080593          	mv	a1,a6
8040ac38:	00098513          	mv	a0,s3
8040ac3c:	01012a23          	sw	a6,20(sp)
8040ac40:	d2cfe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ac44:	01012303          	lw	t1,16(sp)
8040ac48:	01412803          	lw	a6,20(sp)
8040ac4c:	00651463          	bne	a0,t1,8040ac54 <stride_dequeue+0x1754>
8040ac50:	76d0006f          	j	8040bbbc <stride_dequeue+0x26bc>
8040ac54:	00482783          	lw	a5,4(a6)
8040ac58:	00882e03          	lw	t3,8(a6)
8040ac5c:	00612a23          	sw	t1,20(sp)
8040ac60:	00f12823          	sw	a5,16(sp)
8040ac64:	060e0463          	beqz	t3,8040accc <stride_dequeue+0x17cc>
8040ac68:	000e0593          	mv	a1,t3
8040ac6c:	00098513          	mv	a0,s3
8040ac70:	01012e23          	sw	a6,28(sp)
8040ac74:	01c12c23          	sw	t3,24(sp)
8040ac78:	cf4fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ac7c:	01412303          	lw	t1,20(sp)
8040ac80:	01812e03          	lw	t3,24(sp)
8040ac84:	01c12803          	lw	a6,28(sp)
8040ac88:	00651463          	bne	a0,t1,8040ac90 <stride_dequeue+0x1790>
8040ac8c:	4f40106f          	j	8040c180 <stride_dequeue+0x2c80>
8040ac90:	008e2583          	lw	a1,8(t3)
8040ac94:	00098513          	mv	a0,s3
8040ac98:	004e2b03          	lw	s6,4(t3)
8040ac9c:	01012c23          	sw	a6,24(sp)
8040aca0:	01c12a23          	sw	t3,20(sp)
8040aca4:	d84fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040aca8:	01412e03          	lw	t3,20(sp)
8040acac:	01812803          	lw	a6,24(sp)
8040acb0:	00ae2223          	sw	a0,4(t3)
8040acb4:	016e2423          	sw	s6,8(t3)
8040acb8:	00051463          	bnez	a0,8040acc0 <stride_dequeue+0x17c0>
8040acbc:	0a90106f          	j	8040c564 <stride_dequeue+0x3064>
8040acc0:	008c2b03          	lw	s6,8(s8)
8040acc4:	01c52023          	sw	t3,0(a0)
8040acc8:	000e0993          	mv	s3,t3
8040accc:	01012783          	lw	a5,16(sp)
8040acd0:	01382223          	sw	s3,4(a6)
8040acd4:	00f82423          	sw	a5,8(a6)
8040acd8:	0109a023          	sw	a6,0(s3)
8040acdc:	00c12783          	lw	a5,12(sp)
8040ace0:	010da223          	sw	a6,4(s11)
8040ace4:	000b0993          	mv	s3,s6
8040ace8:	00fda423          	sw	a5,8(s11)
8040acec:	01b82023          	sw	s11,0(a6)
8040acf0:	c09fe06f          	j	804098f8 <stride_dequeue+0x3f8>
8040acf4:	004da783          	lw	a5,4(s11)
8040acf8:	008da983          	lw	s3,8(s11)
8040acfc:	00a12623          	sw	a0,12(sp)
8040ad00:	00f12423          	sw	a5,8(sp)
8040ad04:	0c098263          	beqz	s3,8040adc8 <stride_dequeue+0x18c8>
8040ad08:	00080593          	mv	a1,a6
8040ad0c:	00098513          	mv	a0,s3
8040ad10:	00c12a23          	sw	a2,20(sp)
8040ad14:	01012823          	sw	a6,16(sp)
8040ad18:	c54fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ad1c:	00c12303          	lw	t1,12(sp)
8040ad20:	01012803          	lw	a6,16(sp)
8040ad24:	01412603          	lw	a2,20(sp)
8040ad28:	00651463          	bne	a0,t1,8040ad30 <stride_dequeue+0x1830>
8040ad2c:	0980106f          	j	8040bdc4 <stride_dequeue+0x28c4>
8040ad30:	00482783          	lw	a5,4(a6)
8040ad34:	00882e03          	lw	t3,8(a6)
8040ad38:	00612823          	sw	t1,16(sp)
8040ad3c:	00f12623          	sw	a5,12(sp)
8040ad40:	060e0c63          	beqz	t3,8040adb8 <stride_dequeue+0x18b8>
8040ad44:	000e0593          	mv	a1,t3
8040ad48:	00098513          	mv	a0,s3
8040ad4c:	01012e23          	sw	a6,28(sp)
8040ad50:	00c12c23          	sw	a2,24(sp)
8040ad54:	01c12a23          	sw	t3,20(sp)
8040ad58:	c14fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ad5c:	01012303          	lw	t1,16(sp)
8040ad60:	01412e03          	lw	t3,20(sp)
8040ad64:	01812603          	lw	a2,24(sp)
8040ad68:	01c12803          	lw	a6,28(sp)
8040ad6c:	00651463          	bne	a0,t1,8040ad74 <stride_dequeue+0x1874>
8040ad70:	3b00106f          	j	8040c120 <stride_dequeue+0x2c20>
8040ad74:	008e2583          	lw	a1,8(t3)
8040ad78:	00098513          	mv	a0,s3
8040ad7c:	004e2b03          	lw	s6,4(t3)
8040ad80:	01012c23          	sw	a6,24(sp)
8040ad84:	00c12a23          	sw	a2,20(sp)
8040ad88:	01c12823          	sw	t3,16(sp)
8040ad8c:	c9cfe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040ad90:	01012e03          	lw	t3,16(sp)
8040ad94:	01412603          	lw	a2,20(sp)
8040ad98:	01812803          	lw	a6,24(sp)
8040ad9c:	00ae2223          	sw	a0,4(t3)
8040ada0:	016e2423          	sw	s6,8(t3)
8040ada4:	00051463          	bnez	a0,8040adac <stride_dequeue+0x18ac>
8040ada8:	0610106f          	j	8040c608 <stride_dequeue+0x3108>
8040adac:	008c2b03          	lw	s6,8(s8)
8040adb0:	01c52023          	sw	t3,0(a0)
8040adb4:	000e0993          	mv	s3,t3
8040adb8:	00c12783          	lw	a5,12(sp)
8040adbc:	01382223          	sw	s3,4(a6)
8040adc0:	00f82423          	sw	a5,8(a6)
8040adc4:	0109a023          	sw	a6,0(s3)
8040adc8:	00812783          	lw	a5,8(sp)
8040adcc:	010da223          	sw	a6,4(s11)
8040add0:	000b0993          	mv	s3,s6
8040add4:	00fda423          	sw	a5,8(s11)
8040add8:	01b82023          	sw	s11,0(a6)
8040addc:	cf9fe06f          	j	80409ad4 <stride_dequeue+0x5d4>
8040ade0:	00492703          	lw	a4,4(s2)
8040ade4:	00892983          	lw	s3,8(s2)
8040ade8:	00a12a23          	sw	a0,20(sp)
8040adec:	00e12823          	sw	a4,16(sp)
8040adf0:	06098063          	beqz	s3,8040ae50 <stride_dequeue+0x1950>
8040adf4:	00078593          	mv	a1,a5
8040adf8:	00098513          	mv	a0,s3
8040adfc:	01012e23          	sw	a6,28(sp)
8040ae00:	00f12c23          	sw	a5,24(sp)
8040ae04:	b68fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ae08:	01412e03          	lw	t3,20(sp)
8040ae0c:	01812783          	lw	a5,24(sp)
8040ae10:	01c12803          	lw	a6,28(sp)
8040ae14:	01c51463          	bne	a0,t3,8040ae1c <stride_dequeue+0x191c>
8040ae18:	0840106f          	j	8040be9c <stride_dequeue+0x299c>
8040ae1c:	0087a583          	lw	a1,8(a5)
8040ae20:	00098513          	mv	a0,s3
8040ae24:	0047ab03          	lw	s6,4(a5)
8040ae28:	01012c23          	sw	a6,24(sp)
8040ae2c:	00f12a23          	sw	a5,20(sp)
8040ae30:	bf8fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040ae34:	01412783          	lw	a5,20(sp)
8040ae38:	01812803          	lw	a6,24(sp)
8040ae3c:	00a7a223          	sw	a0,4(a5)
8040ae40:	0167a423          	sw	s6,8(a5)
8040ae44:	00050463          	beqz	a0,8040ae4c <stride_dequeue+0x194c>
8040ae48:	00f52023          	sw	a5,0(a0)
8040ae4c:	008c2b03          	lw	s6,8(s8)
8040ae50:	01012703          	lw	a4,16(sp)
8040ae54:	00f92223          	sw	a5,4(s2)
8040ae58:	000b0993          	mv	s3,s6
8040ae5c:	00e92423          	sw	a4,8(s2)
8040ae60:	0127a023          	sw	s2,0(a5)
8040ae64:	875fe06f          	j	804096d8 <stride_dequeue+0x1d8>
8040ae68:	004a2783          	lw	a5,4(s4)
8040ae6c:	008a2983          	lw	s3,8(s4)
8040ae70:	00a12623          	sw	a0,12(sp)
8040ae74:	00f12423          	sw	a5,8(sp)
8040ae78:	00099463          	bnez	s3,8040ae80 <stride_dequeue+0x1980>
8040ae7c:	4180106f          	j	8040c294 <stride_dequeue+0x2d94>
8040ae80:	00040593          	mv	a1,s0
8040ae84:	00098513          	mv	a0,s3
8040ae88:	ae4fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ae8c:	00c12803          	lw	a6,12(sp)
8040ae90:	01051463          	bne	a0,a6,8040ae98 <stride_dequeue+0x1998>
8040ae94:	16c0106f          	j	8040c000 <stride_dequeue+0x2b00>
8040ae98:	00442783          	lw	a5,4(s0)
8040ae9c:	00842883          	lw	a7,8(s0)
8040aea0:	01012a23          	sw	a6,20(sp)
8040aea4:	00f12623          	sw	a5,12(sp)
8040aea8:	04088c63          	beqz	a7,8040af00 <stride_dequeue+0x1a00>
8040aeac:	00088593          	mv	a1,a7
8040aeb0:	00098513          	mv	a0,s3
8040aeb4:	01112823          	sw	a7,16(sp)
8040aeb8:	ab4fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040aebc:	01412803          	lw	a6,20(sp)
8040aec0:	01012883          	lw	a7,16(sp)
8040aec4:	01051463          	bne	a0,a6,8040aecc <stride_dequeue+0x19cc>
8040aec8:	6c00106f          	j	8040c588 <stride_dequeue+0x3088>
8040aecc:	0088a583          	lw	a1,8(a7)
8040aed0:	00098513          	mv	a0,s3
8040aed4:	0048ab03          	lw	s6,4(a7)
8040aed8:	01112823          	sw	a7,16(sp)
8040aedc:	b4cfe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040aee0:	01012883          	lw	a7,16(sp)
8040aee4:	00a8a223          	sw	a0,4(a7)
8040aee8:	0168a423          	sw	s6,8(a7)
8040aeec:	00051463          	bnez	a0,8040aef4 <stride_dequeue+0x19f4>
8040aef0:	7900106f          	j	8040c680 <stride_dequeue+0x3180>
8040aef4:	008c2b03          	lw	s6,8(s8)
8040aef8:	01152023          	sw	a7,0(a0)
8040aefc:	00088993          	mv	s3,a7
8040af00:	00c12783          	lw	a5,12(sp)
8040af04:	01342223          	sw	s3,4(s0)
8040af08:	00f42423          	sw	a5,8(s0)
8040af0c:	0089a023          	sw	s0,0(s3)
8040af10:	00040993          	mv	s3,s0
8040af14:	00812783          	lw	a5,8(sp)
8040af18:	013a2223          	sw	s3,4(s4)
8040af1c:	000a0413          	mv	s0,s4
8040af20:	00fa2423          	sw	a5,8(s4)
8040af24:	0149a023          	sw	s4,0(s3)
8040af28:	000b0993          	mv	s3,s6
8040af2c:	bacff06f          	j	8040a2d8 <stride_dequeue+0xdd8>
8040af30:	0048a783          	lw	a5,4(a7)
8040af34:	0088a983          	lw	s3,8(a7)
8040af38:	00a12823          	sw	a0,16(sp)
8040af3c:	00f12623          	sw	a5,12(sp)
8040af40:	00099463          	bnez	s3,8040af48 <stride_dequeue+0x1a48>
8040af44:	5a40106f          	j	8040c4e8 <stride_dequeue+0x2fe8>
8040af48:	000d8593          	mv	a1,s11
8040af4c:	00098513          	mv	a0,s3
8040af50:	01112a23          	sw	a7,20(sp)
8040af54:	a18fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040af58:	01012303          	lw	t1,16(sp)
8040af5c:	01412883          	lw	a7,20(sp)
8040af60:	00651463          	bne	a0,t1,8040af68 <stride_dequeue+0x1a68>
8040af64:	54c0106f          	j	8040c4b0 <stride_dequeue+0x2fb0>
8040af68:	004da783          	lw	a5,4(s11)
8040af6c:	008dae03          	lw	t3,8(s11)
8040af70:	00612e23          	sw	t1,28(sp)
8040af74:	00f12823          	sw	a5,16(sp)
8040af78:	060e0463          	beqz	t3,8040afe0 <stride_dequeue+0x1ae0>
8040af7c:	000e0593          	mv	a1,t3
8040af80:	00098513          	mv	a0,s3
8040af84:	01112c23          	sw	a7,24(sp)
8040af88:	01c12a23          	sw	t3,20(sp)
8040af8c:	9e0fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040af90:	01c12303          	lw	t1,28(sp)
8040af94:	01412e03          	lw	t3,20(sp)
8040af98:	01812883          	lw	a7,24(sp)
8040af9c:	00651463          	bne	a0,t1,8040afa4 <stride_dequeue+0x1aa4>
8040afa0:	2890106f          	j	8040ca28 <stride_dequeue+0x3528>
8040afa4:	008e2583          	lw	a1,8(t3)
8040afa8:	00098513          	mv	a0,s3
8040afac:	004e2b03          	lw	s6,4(t3)
8040afb0:	01112c23          	sw	a7,24(sp)
8040afb4:	01c12a23          	sw	t3,20(sp)
8040afb8:	a70fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040afbc:	01412e03          	lw	t3,20(sp)
8040afc0:	01812883          	lw	a7,24(sp)
8040afc4:	00ae2223          	sw	a0,4(t3)
8040afc8:	016e2423          	sw	s6,8(t3)
8040afcc:	00051463          	bnez	a0,8040afd4 <stride_dequeue+0x1ad4>
8040afd0:	3590106f          	j	8040cb28 <stride_dequeue+0x3628>
8040afd4:	008c2b03          	lw	s6,8(s8)
8040afd8:	01c52023          	sw	t3,0(a0)
8040afdc:	000e0993          	mv	s3,t3
8040afe0:	01012783          	lw	a5,16(sp)
8040afe4:	013da223          	sw	s3,4(s11)
8040afe8:	00fda423          	sw	a5,8(s11)
8040afec:	01b9a023          	sw	s11,0(s3)
8040aff0:	000d8993          	mv	s3,s11
8040aff4:	00c12783          	lw	a5,12(sp)
8040aff8:	0138a223          	sw	s3,4(a7)
8040affc:	00088d93          	mv	s11,a7
8040b000:	00f8a423          	sw	a5,8(a7)
8040b004:	0119a023          	sw	a7,0(s3)
8040b008:	000b0993          	mv	s3,s6
8040b00c:	be0ff06f          	j	8040a3ec <stride_dequeue+0xeec>
8040b010:	0048a783          	lw	a5,4(a7)
8040b014:	0088a983          	lw	s3,8(a7)
8040b018:	00a12823          	sw	a0,16(sp)
8040b01c:	00f12623          	sw	a5,12(sp)
8040b020:	00099463          	bnez	s3,8040b028 <stride_dequeue+0x1b28>
8040b024:	4e40106f          	j	8040c508 <stride_dequeue+0x3008>
8040b028:	000a0593          	mv	a1,s4
8040b02c:	00098513          	mv	a0,s3
8040b030:	01112a23          	sw	a7,20(sp)
8040b034:	938fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b038:	01012303          	lw	t1,16(sp)
8040b03c:	01412883          	lw	a7,20(sp)
8040b040:	00651463          	bne	a0,t1,8040b048 <stride_dequeue+0x1b48>
8040b044:	0ac0106f          	j	8040c0f0 <stride_dequeue+0x2bf0>
8040b048:	004a2783          	lw	a5,4(s4)
8040b04c:	008a2e03          	lw	t3,8(s4)
8040b050:	00612e23          	sw	t1,28(sp)
8040b054:	00f12823          	sw	a5,16(sp)
8040b058:	060e0463          	beqz	t3,8040b0c0 <stride_dequeue+0x1bc0>
8040b05c:	000e0593          	mv	a1,t3
8040b060:	00098513          	mv	a0,s3
8040b064:	01112c23          	sw	a7,24(sp)
8040b068:	01c12a23          	sw	t3,20(sp)
8040b06c:	900fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b070:	01c12303          	lw	t1,28(sp)
8040b074:	01412e03          	lw	t3,20(sp)
8040b078:	01812883          	lw	a7,24(sp)
8040b07c:	00651463          	bne	a0,t1,8040b084 <stride_dequeue+0x1b84>
8040b080:	07d0106f          	j	8040c8fc <stride_dequeue+0x33fc>
8040b084:	008e2583          	lw	a1,8(t3)
8040b088:	00098513          	mv	a0,s3
8040b08c:	004e2b03          	lw	s6,4(t3)
8040b090:	01112c23          	sw	a7,24(sp)
8040b094:	01c12a23          	sw	t3,20(sp)
8040b098:	990fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b09c:	01412e03          	lw	t3,20(sp)
8040b0a0:	01812883          	lw	a7,24(sp)
8040b0a4:	00ae2223          	sw	a0,4(t3)
8040b0a8:	016e2423          	sw	s6,8(t3)
8040b0ac:	00051463          	bnez	a0,8040b0b4 <stride_dequeue+0x1bb4>
8040b0b0:	2190106f          	j	8040cac8 <stride_dequeue+0x35c8>
8040b0b4:	008c2b03          	lw	s6,8(s8)
8040b0b8:	01c52023          	sw	t3,0(a0)
8040b0bc:	000e0993          	mv	s3,t3
8040b0c0:	01012783          	lw	a5,16(sp)
8040b0c4:	013a2223          	sw	s3,4(s4)
8040b0c8:	00fa2423          	sw	a5,8(s4)
8040b0cc:	0149a023          	sw	s4,0(s3)
8040b0d0:	000a0993          	mv	s3,s4
8040b0d4:	00c12783          	lw	a5,12(sp)
8040b0d8:	0138a223          	sw	s3,4(a7)
8040b0dc:	00088a13          	mv	s4,a7
8040b0e0:	00f8a423          	sw	a5,8(a7)
8040b0e4:	0119a023          	sw	a7,0(s3)
8040b0e8:	000b0993          	mv	s3,s6
8040b0ec:	d44ff06f          	j	8040a630 <stride_dequeue+0x1130>
8040b0f0:	004ca783          	lw	a5,4(s9)
8040b0f4:	008ca983          	lw	s3,8(s9)
8040b0f8:	00a12823          	sw	a0,16(sp)
8040b0fc:	00f12623          	sw	a5,12(sp)
8040b100:	00099463          	bnez	s3,8040b108 <stride_dequeue+0x1c08>
8040b104:	3dc0106f          	j	8040c4e0 <stride_dequeue+0x2fe0>
8040b108:	00080593          	mv	a1,a6
8040b10c:	00098513          	mv	a0,s3
8040b110:	01012a23          	sw	a6,20(sp)
8040b114:	858fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b118:	01012303          	lw	t1,16(sp)
8040b11c:	01412803          	lw	a6,20(sp)
8040b120:	00651463          	bne	a0,t1,8040b128 <stride_dequeue+0x1c28>
8040b124:	1a80106f          	j	8040c2cc <stride_dequeue+0x2dcc>
8040b128:	00482783          	lw	a5,4(a6)
8040b12c:	00882e03          	lw	t3,8(a6)
8040b130:	00612e23          	sw	t1,28(sp)
8040b134:	00f12823          	sw	a5,16(sp)
8040b138:	060e0463          	beqz	t3,8040b1a0 <stride_dequeue+0x1ca0>
8040b13c:	000e0593          	mv	a1,t3
8040b140:	00098513          	mv	a0,s3
8040b144:	01012c23          	sw	a6,24(sp)
8040b148:	01c12a23          	sw	t3,20(sp)
8040b14c:	820fe0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b150:	01c12303          	lw	t1,28(sp)
8040b154:	01412e03          	lw	t3,20(sp)
8040b158:	01812803          	lw	a6,24(sp)
8040b15c:	00651463          	bne	a0,t1,8040b164 <stride_dequeue+0x1c64>
8040b160:	7cc0106f          	j	8040c92c <stride_dequeue+0x342c>
8040b164:	008e2583          	lw	a1,8(t3)
8040b168:	00098513          	mv	a0,s3
8040b16c:	004e2b03          	lw	s6,4(t3)
8040b170:	01012c23          	sw	a6,24(sp)
8040b174:	01c12a23          	sw	t3,20(sp)
8040b178:	8b0fe0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b17c:	01412e03          	lw	t3,20(sp)
8040b180:	01812803          	lw	a6,24(sp)
8040b184:	00ae2223          	sw	a0,4(t3)
8040b188:	016e2423          	sw	s6,8(t3)
8040b18c:	00051463          	bnez	a0,8040b194 <stride_dequeue+0x1c94>
8040b190:	1450106f          	j	8040cad4 <stride_dequeue+0x35d4>
8040b194:	008c2b03          	lw	s6,8(s8)
8040b198:	01c52023          	sw	t3,0(a0)
8040b19c:	000e0993          	mv	s3,t3
8040b1a0:	01012783          	lw	a5,16(sp)
8040b1a4:	01382223          	sw	s3,4(a6)
8040b1a8:	00f82423          	sw	a5,8(a6)
8040b1ac:	0109a023          	sw	a6,0(s3)
8040b1b0:	00080993          	mv	s3,a6
8040b1b4:	00c12783          	lw	a5,12(sp)
8040b1b8:	013ca223          	sw	s3,4(s9)
8040b1bc:	00fca423          	sw	a5,8(s9)
8040b1c0:	0199a023          	sw	s9,0(s3)
8040b1c4:	000b0993          	mv	s3,s6
8040b1c8:	a99fe06f          	j	80409c60 <stride_dequeue+0x760>
8040b1cc:	004a2783          	lw	a5,4(s4)
8040b1d0:	008a2983          	lw	s3,8(s4)
8040b1d4:	00a12823          	sw	a0,16(sp)
8040b1d8:	00f12623          	sw	a5,12(sp)
8040b1dc:	00099463          	bnez	s3,8040b1e4 <stride_dequeue+0x1ce4>
8040b1e0:	3100106f          	j	8040c4f0 <stride_dequeue+0x2ff0>
8040b1e4:	00080593          	mv	a1,a6
8040b1e8:	00098513          	mv	a0,s3
8040b1ec:	01012a23          	sw	a6,20(sp)
8040b1f0:	f7dfd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b1f4:	01012303          	lw	t1,16(sp)
8040b1f8:	01412803          	lw	a6,20(sp)
8040b1fc:	00651463          	bne	a0,t1,8040b204 <stride_dequeue+0x1d04>
8040b200:	7590006f          	j	8040c158 <stride_dequeue+0x2c58>
8040b204:	00482783          	lw	a5,4(a6)
8040b208:	00882e03          	lw	t3,8(a6)
8040b20c:	00612e23          	sw	t1,28(sp)
8040b210:	00f12823          	sw	a5,16(sp)
8040b214:	060e0463          	beqz	t3,8040b27c <stride_dequeue+0x1d7c>
8040b218:	000e0593          	mv	a1,t3
8040b21c:	00098513          	mv	a0,s3
8040b220:	01012c23          	sw	a6,24(sp)
8040b224:	01c12a23          	sw	t3,20(sp)
8040b228:	f45fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b22c:	01c12303          	lw	t1,28(sp)
8040b230:	01412e03          	lw	t3,20(sp)
8040b234:	01812803          	lw	a6,24(sp)
8040b238:	00651463          	bne	a0,t1,8040b240 <stride_dequeue+0x1d40>
8040b23c:	4500106f          	j	8040c68c <stride_dequeue+0x318c>
8040b240:	008e2583          	lw	a1,8(t3)
8040b244:	00098513          	mv	a0,s3
8040b248:	004e2b03          	lw	s6,4(t3)
8040b24c:	01012c23          	sw	a6,24(sp)
8040b250:	01c12a23          	sw	t3,20(sp)
8040b254:	fd5fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b258:	01412e03          	lw	t3,20(sp)
8040b25c:	01812803          	lw	a6,24(sp)
8040b260:	00ae2223          	sw	a0,4(t3)
8040b264:	016e2423          	sw	s6,8(t3)
8040b268:	00051463          	bnez	a0,8040b270 <stride_dequeue+0x1d70>
8040b26c:	0f90106f          	j	8040cb64 <stride_dequeue+0x3664>
8040b270:	008c2b03          	lw	s6,8(s8)
8040b274:	01c52023          	sw	t3,0(a0)
8040b278:	000e0993          	mv	s3,t3
8040b27c:	01012783          	lw	a5,16(sp)
8040b280:	01382223          	sw	s3,4(a6)
8040b284:	00f82423          	sw	a5,8(a6)
8040b288:	0109a023          	sw	a6,0(s3)
8040b28c:	00080993          	mv	s3,a6
8040b290:	00c12783          	lw	a5,12(sp)
8040b294:	013a2223          	sw	s3,4(s4)
8040b298:	00fa2423          	sw	a5,8(s4)
8040b29c:	0149a023          	sw	s4,0(s3)
8040b2a0:	000b0993          	mv	s3,s6
8040b2a4:	b1dfe06f          	j	80409dc0 <stride_dequeue+0x8c0>
8040b2a8:	0048a783          	lw	a5,4(a7)
8040b2ac:	0088a983          	lw	s3,8(a7)
8040b2b0:	00a12623          	sw	a0,12(sp)
8040b2b4:	00f12423          	sw	a5,8(sp)
8040b2b8:	00099463          	bnez	s3,8040b2c0 <stride_dequeue+0x1dc0>
8040b2bc:	2440106f          	j	8040c500 <stride_dequeue+0x3000>
8040b2c0:	00060593          	mv	a1,a2
8040b2c4:	00098513          	mv	a0,s3
8040b2c8:	01112a23          	sw	a7,20(sp)
8040b2cc:	ea1fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b2d0:	00c12303          	lw	t1,12(sp)
8040b2d4:	01012603          	lw	a2,16(sp)
8040b2d8:	01412883          	lw	a7,20(sp)
8040b2dc:	5e6502e3          	beq	a0,t1,8040c0c0 <stride_dequeue+0x2bc0>
8040b2e0:	00462783          	lw	a5,4(a2)
8040b2e4:	00862e03          	lw	t3,8(a2)
8040b2e8:	00612e23          	sw	t1,28(sp)
8040b2ec:	00f12623          	sw	a5,12(sp)
8040b2f0:	060e0c63          	beqz	t3,8040b368 <stride_dequeue+0x1e68>
8040b2f4:	000e0593          	mv	a1,t3
8040b2f8:	00098513          	mv	a0,s3
8040b2fc:	01112c23          	sw	a7,24(sp)
8040b300:	00c12a23          	sw	a2,20(sp)
8040b304:	01c12823          	sw	t3,16(sp)
8040b308:	e65fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b30c:	01c12303          	lw	t1,28(sp)
8040b310:	01012e03          	lw	t3,16(sp)
8040b314:	01412603          	lw	a2,20(sp)
8040b318:	01812883          	lw	a7,24(sp)
8040b31c:	00651463          	bne	a0,t1,8040b324 <stride_dequeue+0x1e24>
8040b320:	3d00106f          	j	8040c6f0 <stride_dequeue+0x31f0>
8040b324:	008e2583          	lw	a1,8(t3)
8040b328:	00098513          	mv	a0,s3
8040b32c:	004e2b03          	lw	s6,4(t3)
8040b330:	01112c23          	sw	a7,24(sp)
8040b334:	00c12a23          	sw	a2,20(sp)
8040b338:	01c12823          	sw	t3,16(sp)
8040b33c:	eedfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b340:	01012e03          	lw	t3,16(sp)
8040b344:	01412603          	lw	a2,20(sp)
8040b348:	01812883          	lw	a7,24(sp)
8040b34c:	00ae2223          	sw	a0,4(t3)
8040b350:	016e2423          	sw	s6,8(t3)
8040b354:	00051463          	bnez	a0,8040b35c <stride_dequeue+0x1e5c>
8040b358:	0190106f          	j	8040cb70 <stride_dequeue+0x3670>
8040b35c:	008c2b03          	lw	s6,8(s8)
8040b360:	01c52023          	sw	t3,0(a0)
8040b364:	000e0993          	mv	s3,t3
8040b368:	00c12783          	lw	a5,12(sp)
8040b36c:	01362223          	sw	s3,4(a2)
8040b370:	00f62423          	sw	a5,8(a2)
8040b374:	00c9a023          	sw	a2,0(s3)
8040b378:	00060993          	mv	s3,a2
8040b37c:	00812783          	lw	a5,8(sp)
8040b380:	0138a223          	sw	s3,4(a7)
8040b384:	00088613          	mv	a2,a7
8040b388:	00f8a423          	sw	a5,8(a7)
8040b38c:	0119a023          	sw	a7,0(s3)
8040b390:	000b0993          	mv	s3,s6
8040b394:	98cff06f          	j	8040a520 <stride_dequeue+0x1020>
8040b398:	00462783          	lw	a5,4(a2)
8040b39c:	00862983          	lw	s3,8(a2)
8040b3a0:	00a12623          	sw	a0,12(sp)
8040b3a4:	00f12423          	sw	a5,8(sp)
8040b3a8:	00099463          	bnez	s3,8040b3b0 <stride_dequeue+0x1eb0>
8040b3ac:	14c0106f          	j	8040c4f8 <stride_dequeue+0x2ff8>
8040b3b0:	00080593          	mv	a1,a6
8040b3b4:	00098513          	mv	a0,s3
8040b3b8:	00c12a23          	sw	a2,20(sp)
8040b3bc:	01012823          	sw	a6,16(sp)
8040b3c0:	dadfd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b3c4:	00c12303          	lw	t1,12(sp)
8040b3c8:	01012803          	lw	a6,16(sp)
8040b3cc:	01412603          	lw	a2,20(sp)
8040b3d0:	5e6500e3          	beq	a0,t1,8040c1b0 <stride_dequeue+0x2cb0>
8040b3d4:	00482783          	lw	a5,4(a6)
8040b3d8:	00882e03          	lw	t3,8(a6)
8040b3dc:	00612e23          	sw	t1,28(sp)
8040b3e0:	00f12623          	sw	a5,12(sp)
8040b3e4:	060e0c63          	beqz	t3,8040b45c <stride_dequeue+0x1f5c>
8040b3e8:	000e0593          	mv	a1,t3
8040b3ec:	00098513          	mv	a0,s3
8040b3f0:	01012c23          	sw	a6,24(sp)
8040b3f4:	00c12a23          	sw	a2,20(sp)
8040b3f8:	01c12823          	sw	t3,16(sp)
8040b3fc:	d71fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b400:	01c12303          	lw	t1,28(sp)
8040b404:	01012e03          	lw	t3,16(sp)
8040b408:	01412603          	lw	a2,20(sp)
8040b40c:	01812803          	lw	a6,24(sp)
8040b410:	00651463          	bne	a0,t1,8040b418 <stride_dequeue+0x1f18>
8040b414:	3b80106f          	j	8040c7cc <stride_dequeue+0x32cc>
8040b418:	008e2583          	lw	a1,8(t3)
8040b41c:	00098513          	mv	a0,s3
8040b420:	004e2b03          	lw	s6,4(t3)
8040b424:	01012c23          	sw	a6,24(sp)
8040b428:	00c12a23          	sw	a2,20(sp)
8040b42c:	01c12823          	sw	t3,16(sp)
8040b430:	df9fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b434:	01012e03          	lw	t3,16(sp)
8040b438:	01412603          	lw	a2,20(sp)
8040b43c:	01812803          	lw	a6,24(sp)
8040b440:	00ae2223          	sw	a0,4(t3)
8040b444:	016e2423          	sw	s6,8(t3)
8040b448:	00051463          	bnez	a0,8040b450 <stride_dequeue+0x1f50>
8040b44c:	6ac0106f          	j	8040caf8 <stride_dequeue+0x35f8>
8040b450:	008c2b03          	lw	s6,8(s8)
8040b454:	01c52023          	sw	t3,0(a0)
8040b458:	000e0993          	mv	s3,t3
8040b45c:	00c12783          	lw	a5,12(sp)
8040b460:	01382223          	sw	s3,4(a6)
8040b464:	00f82423          	sw	a5,8(a6)
8040b468:	0109a023          	sw	a6,0(s3)
8040b46c:	00080993          	mv	s3,a6
8040b470:	00812783          	lw	a5,8(sp)
8040b474:	01362223          	sw	s3,4(a2)
8040b478:	00f62423          	sw	a5,8(a2)
8040b47c:	00c9a023          	sw	a2,0(s3)
8040b480:	000b0993          	mv	s3,s6
8040b484:	aa5fe06f          	j	80409f28 <stride_dequeue+0xa28>
8040b488:	0048a783          	lw	a5,4(a7)
8040b48c:	0088a983          	lw	s3,8(a7)
8040b490:	00a12a23          	sw	a0,20(sp)
8040b494:	00f12823          	sw	a5,16(sp)
8040b498:	04098c63          	beqz	s3,8040b4f0 <stride_dequeue+0x1ff0>
8040b49c:	00080593          	mv	a1,a6
8040b4a0:	00098513          	mv	a0,s3
8040b4a4:	01112e23          	sw	a7,28(sp)
8040b4a8:	cc5fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b4ac:	01412e03          	lw	t3,20(sp)
8040b4b0:	01812803          	lw	a6,24(sp)
8040b4b4:	01c12883          	lw	a7,28(sp)
8040b4b8:	3dc50ae3          	beq	a0,t3,8040c08c <stride_dequeue+0x2b8c>
8040b4bc:	00882583          	lw	a1,8(a6)
8040b4c0:	00098513          	mv	a0,s3
8040b4c4:	00482b03          	lw	s6,4(a6)
8040b4c8:	01112c23          	sw	a7,24(sp)
8040b4cc:	01012a23          	sw	a6,20(sp)
8040b4d0:	d59fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b4d4:	01412803          	lw	a6,20(sp)
8040b4d8:	01812883          	lw	a7,24(sp)
8040b4dc:	00a82223          	sw	a0,4(a6)
8040b4e0:	01682423          	sw	s6,8(a6)
8040b4e4:	00050463          	beqz	a0,8040b4ec <stride_dequeue+0x1fec>
8040b4e8:	01052023          	sw	a6,0(a0)
8040b4ec:	008c2b03          	lw	s6,8(s8)
8040b4f0:	01012783          	lw	a5,16(sp)
8040b4f4:	0108a223          	sw	a6,4(a7)
8040b4f8:	000b0993          	mv	s3,s6
8040b4fc:	00f8a423          	sw	a5,8(a7)
8040b500:	01182023          	sw	a7,0(a6)
8040b504:	00088813          	mv	a6,a7
8040b508:	9f4ff06f          	j	8040a6fc <stride_dequeue+0x11fc>
8040b50c:	004da783          	lw	a5,4(s11)
8040b510:	008da983          	lw	s3,8(s11)
8040b514:	00a12823          	sw	a0,16(sp)
8040b518:	00f12623          	sw	a5,12(sp)
8040b51c:	06098663          	beqz	s3,8040b588 <stride_dequeue+0x2088>
8040b520:	00030593          	mv	a1,t1
8040b524:	00098513          	mv	a0,s3
8040b528:	01012e23          	sw	a6,28(sp)
8040b52c:	00c12c23          	sw	a2,24(sp)
8040b530:	00612a23          	sw	t1,20(sp)
8040b534:	c39fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b538:	01012e03          	lw	t3,16(sp)
8040b53c:	01412303          	lw	t1,20(sp)
8040b540:	01812603          	lw	a2,24(sp)
8040b544:	01c12803          	lw	a6,28(sp)
8040b548:	5dc50ee3          	beq	a0,t3,8040c324 <stride_dequeue+0x2e24>
8040b54c:	00832583          	lw	a1,8(t1)
8040b550:	00098513          	mv	a0,s3
8040b554:	00432b03          	lw	s6,4(t1)
8040b558:	01012c23          	sw	a6,24(sp)
8040b55c:	00c12a23          	sw	a2,20(sp)
8040b560:	00612823          	sw	t1,16(sp)
8040b564:	cc5fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b568:	01012303          	lw	t1,16(sp)
8040b56c:	01412603          	lw	a2,20(sp)
8040b570:	01812803          	lw	a6,24(sp)
8040b574:	00a32223          	sw	a0,4(t1)
8040b578:	01632423          	sw	s6,8(t1)
8040b57c:	00050463          	beqz	a0,8040b584 <stride_dequeue+0x2084>
8040b580:	00652023          	sw	t1,0(a0)
8040b584:	008c2b03          	lw	s6,8(s8)
8040b588:	00c12783          	lw	a5,12(sp)
8040b58c:	006da223          	sw	t1,4(s11)
8040b590:	000b0993          	mv	s3,s6
8040b594:	00fda423          	sw	a5,8(s11)
8040b598:	01b32023          	sw	s11,0(t1)
8040b59c:	d24fe06f          	j	80409ac0 <stride_dequeue+0x5c0>
8040b5a0:	004ca783          	lw	a5,4(s9)
8040b5a4:	008ca983          	lw	s3,8(s9)
8040b5a8:	00a12a23          	sw	a0,20(sp)
8040b5ac:	00f12823          	sw	a5,16(sp)
8040b5b0:	04098e63          	beqz	s3,8040b60c <stride_dequeue+0x210c>
8040b5b4:	00030593          	mv	a1,t1
8040b5b8:	00098513          	mv	a0,s3
8040b5bc:	01012e23          	sw	a6,28(sp)
8040b5c0:	00612c23          	sw	t1,24(sp)
8040b5c4:	ba9fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b5c8:	01412e03          	lw	t3,20(sp)
8040b5cc:	01812303          	lw	t1,24(sp)
8040b5d0:	01c12803          	lw	a6,28(sp)
8040b5d4:	25c50ae3          	beq	a0,t3,8040c028 <stride_dequeue+0x2b28>
8040b5d8:	00832583          	lw	a1,8(t1)
8040b5dc:	00098513          	mv	a0,s3
8040b5e0:	00432b03          	lw	s6,4(t1)
8040b5e4:	01012c23          	sw	a6,24(sp)
8040b5e8:	00612a23          	sw	t1,20(sp)
8040b5ec:	c3dfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b5f0:	01412303          	lw	t1,20(sp)
8040b5f4:	01812803          	lw	a6,24(sp)
8040b5f8:	00a32223          	sw	a0,4(t1)
8040b5fc:	01632423          	sw	s6,8(t1)
8040b600:	00050463          	beqz	a0,8040b608 <stride_dequeue+0x2108>
8040b604:	00652023          	sw	t1,0(a0)
8040b608:	008c2b03          	lw	s6,8(s8)
8040b60c:	01012783          	lw	a5,16(sp)
8040b610:	006ca223          	sw	t1,4(s9)
8040b614:	000b0993          	mv	s3,s6
8040b618:	00fca423          	sw	a5,8(s9)
8040b61c:	01932023          	sw	s9,0(t1)
8040b620:	b55fe06f          	j	8040a174 <stride_dequeue+0xc74>
8040b624:	004da783          	lw	a5,4(s11)
8040b628:	008da983          	lw	s3,8(s11)
8040b62c:	00a12a23          	sw	a0,20(sp)
8040b630:	00f12823          	sw	a5,16(sp)
8040b634:	04098e63          	beqz	s3,8040b690 <stride_dequeue+0x2190>
8040b638:	00030593          	mv	a1,t1
8040b63c:	00098513          	mv	a0,s3
8040b640:	01012e23          	sw	a6,28(sp)
8040b644:	00612c23          	sw	t1,24(sp)
8040b648:	b25fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b64c:	01412e03          	lw	t3,20(sp)
8040b650:	01812303          	lw	t1,24(sp)
8040b654:	01c12803          	lw	a6,28(sp)
8040b658:	53c50ce3          	beq	a0,t3,8040c390 <stride_dequeue+0x2e90>
8040b65c:	00832583          	lw	a1,8(t1)
8040b660:	00098513          	mv	a0,s3
8040b664:	00432b03          	lw	s6,4(t1)
8040b668:	01012c23          	sw	a6,24(sp)
8040b66c:	00612a23          	sw	t1,20(sp)
8040b670:	bb9fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b674:	01412303          	lw	t1,20(sp)
8040b678:	01812803          	lw	a6,24(sp)
8040b67c:	00a32223          	sw	a0,4(t1)
8040b680:	01632423          	sw	s6,8(t1)
8040b684:	00050463          	beqz	a0,8040b68c <stride_dequeue+0x218c>
8040b688:	00652023          	sw	t1,0(a0)
8040b68c:	008c2b03          	lw	s6,8(s8)
8040b690:	01012783          	lw	a5,16(sp)
8040b694:	006da223          	sw	t1,4(s11)
8040b698:	000b0993          	mv	s3,s6
8040b69c:	00fda423          	sw	a5,8(s11)
8040b6a0:	01b32023          	sw	s11,0(t1)
8040b6a4:	a40fe06f          	j	804098e4 <stride_dequeue+0x3e4>
8040b6a8:	0048a783          	lw	a5,4(a7)
8040b6ac:	0088a983          	lw	s3,8(a7)
8040b6b0:	00a12a23          	sw	a0,20(sp)
8040b6b4:	00f12823          	sw	a5,16(sp)
8040b6b8:	04098c63          	beqz	s3,8040b710 <stride_dequeue+0x2210>
8040b6bc:	00030593          	mv	a1,t1
8040b6c0:	00098513          	mv	a0,s3
8040b6c4:	01112e23          	sw	a7,28(sp)
8040b6c8:	aa5fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b6cc:	01412e03          	lw	t3,20(sp)
8040b6d0:	01812303          	lw	t1,24(sp)
8040b6d4:	01c12883          	lw	a7,28(sp)
8040b6d8:	5bc502e3          	beq	a0,t3,8040c47c <stride_dequeue+0x2f7c>
8040b6dc:	00832583          	lw	a1,8(t1)
8040b6e0:	00098513          	mv	a0,s3
8040b6e4:	00432b03          	lw	s6,4(t1)
8040b6e8:	01112c23          	sw	a7,24(sp)
8040b6ec:	00612a23          	sw	t1,20(sp)
8040b6f0:	b39fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b6f4:	01412303          	lw	t1,20(sp)
8040b6f8:	01812883          	lw	a7,24(sp)
8040b6fc:	00a32223          	sw	a0,4(t1)
8040b700:	01632423          	sw	s6,8(t1)
8040b704:	00050463          	beqz	a0,8040b70c <stride_dequeue+0x220c>
8040b708:	00652023          	sw	t1,0(a0)
8040b70c:	008c2b03          	lw	s6,8(s8)
8040b710:	01012783          	lw	a5,16(sp)
8040b714:	0068a223          	sw	t1,4(a7)
8040b718:	000b0993          	mv	s3,s6
8040b71c:	00f8a423          	sw	a5,8(a7)
8040b720:	01132023          	sw	a7,0(t1)
8040b724:	91dfe06f          	j	8040a040 <stride_dequeue+0xb40>
8040b728:	00892503          	lw	a0,8(s2)
8040b72c:	00492983          	lw	s3,4(s2)
8040b730:	000b0593          	mv	a1,s6
8040b734:	af5fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b738:	00a92223          	sw	a0,4(s2)
8040b73c:	01392423          	sw	s3,8(s2)
8040b740:	01412803          	lw	a6,20(sp)
8040b744:	01812783          	lw	a5,24(sp)
8040b748:	00050463          	beqz	a0,8040b750 <stride_dequeue+0x2250>
8040b74c:	01252023          	sw	s2,0(a0)
8040b750:	008c2983          	lw	s3,8(s8)
8040b754:	f71fd06f          	j	804096c4 <stride_dequeue+0x1c4>
8040b758:	0049a703          	lw	a4,4(s3)
8040b75c:	0089a783          	lw	a5,8(s3)
8040b760:	00a12a23          	sw	a0,20(sp)
8040b764:	00e12423          	sw	a4,8(sp)
8040b768:	04078a63          	beqz	a5,8040b7bc <stride_dequeue+0x22bc>
8040b76c:	00078513          	mv	a0,a5
8040b770:	000a0593          	mv	a1,s4
8040b774:	00c12823          	sw	a2,16(sp)
8040b778:	00f12623          	sw	a5,12(sp)
8040b77c:	9f1fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b780:	01412883          	lw	a7,20(sp)
8040b784:	00c12783          	lw	a5,12(sp)
8040b788:	01012603          	lw	a2,16(sp)
8040b78c:	631508e3          	beq	a0,a7,8040c5bc <stride_dequeue+0x30bc>
8040b790:	008a2583          	lw	a1,8(s4)
8040b794:	004a2b03          	lw	s6,4(s4)
8040b798:	00078513          	mv	a0,a5
8040b79c:	00c12623          	sw	a2,12(sp)
8040b7a0:	a89fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b7a4:	00aa2223          	sw	a0,4(s4)
8040b7a8:	016a2423          	sw	s6,8(s4)
8040b7ac:	00c12603          	lw	a2,12(sp)
8040b7b0:	00050463          	beqz	a0,8040b7b8 <stride_dequeue+0x22b8>
8040b7b4:	01452023          	sw	s4,0(a0)
8040b7b8:	008c2b03          	lw	s6,8(s8)
8040b7bc:	00812783          	lw	a5,8(sp)
8040b7c0:	0149a223          	sw	s4,4(s3)
8040b7c4:	00f9a423          	sw	a5,8(s3)
8040b7c8:	013a2023          	sw	s3,0(s4)
8040b7cc:	00098a13          	mv	s4,s3
8040b7d0:	85cff06f          	j	8040a82c <stride_dequeue+0x132c>
8040b7d4:	004a2703          	lw	a4,4(s4)
8040b7d8:	008a2783          	lw	a5,8(s4)
8040b7dc:	00a12a23          	sw	a0,20(sp)
8040b7e0:	00e12623          	sw	a4,12(sp)
8040b7e4:	04078263          	beqz	a5,8040b828 <stride_dequeue+0x2328>
8040b7e8:	00078513          	mv	a0,a5
8040b7ec:	00098593          	mv	a1,s3
8040b7f0:	00f12823          	sw	a5,16(sp)
8040b7f4:	979fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b7f8:	01412303          	lw	t1,20(sp)
8040b7fc:	01012783          	lw	a5,16(sp)
8040b800:	526504e3          	beq	a0,t1,8040c528 <stride_dequeue+0x3028>
8040b804:	0089a583          	lw	a1,8(s3)
8040b808:	0049ab03          	lw	s6,4(s3)
8040b80c:	00078513          	mv	a0,a5
8040b810:	a19fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b814:	00a9a223          	sw	a0,4(s3)
8040b818:	0169a423          	sw	s6,8(s3)
8040b81c:	00050463          	beqz	a0,8040b824 <stride_dequeue+0x2324>
8040b820:	01352023          	sw	s3,0(a0)
8040b824:	008c2b03          	lw	s6,8(s8)
8040b828:	00c12783          	lw	a5,12(sp)
8040b82c:	013a2223          	sw	s3,4(s4)
8040b830:	00fa2423          	sw	a5,8(s4)
8040b834:	0149a023          	sw	s4,0(s3)
8040b838:	000a0993          	mv	s3,s4
8040b83c:	a89fe06f          	j	8040a2c4 <stride_dequeue+0xdc4>
8040b840:	0049a703          	lw	a4,4(s3)
8040b844:	0089a783          	lw	a5,8(s3)
8040b848:	00a12a23          	sw	a0,20(sp)
8040b84c:	00e12623          	sw	a4,12(sp)
8040b850:	04078263          	beqz	a5,8040b894 <stride_dequeue+0x2394>
8040b854:	00078513          	mv	a0,a5
8040b858:	000a0593          	mv	a1,s4
8040b85c:	00f12823          	sw	a5,16(sp)
8040b860:	90dfd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b864:	01412883          	lw	a7,20(sp)
8040b868:	01012783          	lw	a5,16(sp)
8040b86c:	5f1502e3          	beq	a0,a7,8040c650 <stride_dequeue+0x3150>
8040b870:	008a2583          	lw	a1,8(s4)
8040b874:	004a2b03          	lw	s6,4(s4)
8040b878:	00078513          	mv	a0,a5
8040b87c:	9adfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b880:	00aa2223          	sw	a0,4(s4)
8040b884:	016a2423          	sw	s6,8(s4)
8040b888:	00050463          	beqz	a0,8040b890 <stride_dequeue+0x2390>
8040b88c:	01452023          	sw	s4,0(a0)
8040b890:	008c2b03          	lw	s6,8(s8)
8040b894:	00c12783          	lw	a5,12(sp)
8040b898:	0149a223          	sw	s4,4(s3)
8040b89c:	00f9a423          	sw	a5,8(s3)
8040b8a0:	013a2023          	sw	s3,0(s4)
8040b8a4:	00098a13          	mv	s4,s3
8040b8a8:	89cff06f          	j	8040a944 <stride_dequeue+0x1444>
8040b8ac:	0049a703          	lw	a4,4(s3)
8040b8b0:	0089a783          	lw	a5,8(s3)
8040b8b4:	00a12a23          	sw	a0,20(sp)
8040b8b8:	00e12623          	sw	a4,12(sp)
8040b8bc:	04078263          	beqz	a5,8040b900 <stride_dequeue+0x2400>
8040b8c0:	00078513          	mv	a0,a5
8040b8c4:	000c8593          	mv	a1,s9
8040b8c8:	00f12823          	sw	a5,16(sp)
8040b8cc:	8a1fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b8d0:	01412883          	lw	a7,20(sp)
8040b8d4:	01012783          	lw	a5,16(sp)
8040b8d8:	551504e3          	beq	a0,a7,8040c620 <stride_dequeue+0x3120>
8040b8dc:	008ca583          	lw	a1,8(s9)
8040b8e0:	004cab03          	lw	s6,4(s9)
8040b8e4:	00078513          	mv	a0,a5
8040b8e8:	941fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b8ec:	00aca223          	sw	a0,4(s9)
8040b8f0:	016ca423          	sw	s6,8(s9)
8040b8f4:	00050463          	beqz	a0,8040b8fc <stride_dequeue+0x23fc>
8040b8f8:	01952023          	sw	s9,0(a0)
8040b8fc:	008c2b03          	lw	s6,8(s8)
8040b900:	00c12783          	lw	a5,12(sp)
8040b904:	0199a223          	sw	s9,4(s3)
8040b908:	00f9a423          	sw	a5,8(s3)
8040b90c:	013ca023          	sw	s3,0(s9)
8040b910:	00098c93          	mv	s9,s3
8040b914:	944ff06f          	j	8040aa58 <stride_dequeue+0x1558>
8040b918:	008c2b03          	lw	s6,8(s8)
8040b91c:	00088993          	mv	s3,a7
8040b920:	dc9fe06f          	j	8040a6e8 <stride_dequeue+0x11e8>
8040b924:	0048a783          	lw	a5,4(a7)
8040b928:	0088a803          	lw	a6,8(a7)
8040b92c:	00a12e23          	sw	a0,28(sp)
8040b930:	00f12823          	sw	a5,16(sp)
8040b934:	04080a63          	beqz	a6,8040b988 <stride_dequeue+0x2488>
8040b938:	00080513          	mv	a0,a6
8040b93c:	00098593          	mv	a1,s3
8040b940:	01112c23          	sw	a7,24(sp)
8040b944:	01012a23          	sw	a6,20(sp)
8040b948:	825fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b94c:	01c12e03          	lw	t3,28(sp)
8040b950:	01412803          	lw	a6,20(sp)
8040b954:	01812883          	lw	a7,24(sp)
8040b958:	57c502e3          	beq	a0,t3,8040c6bc <stride_dequeue+0x31bc>
8040b95c:	0089a583          	lw	a1,8(s3)
8040b960:	0049ab03          	lw	s6,4(s3)
8040b964:	00080513          	mv	a0,a6
8040b968:	01112a23          	sw	a7,20(sp)
8040b96c:	8bdfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b970:	00a9a223          	sw	a0,4(s3)
8040b974:	0169a423          	sw	s6,8(s3)
8040b978:	01412883          	lw	a7,20(sp)
8040b97c:	00050463          	beqz	a0,8040b984 <stride_dequeue+0x2484>
8040b980:	01352023          	sw	s3,0(a0)
8040b984:	008c2b03          	lw	s6,8(s8)
8040b988:	01012783          	lw	a5,16(sp)
8040b98c:	0138a223          	sw	s3,4(a7)
8040b990:	00f8a423          	sw	a5,8(a7)
8040b994:	0119a023          	sw	a7,0(s3)
8040b998:	00088993          	mv	s3,a7
8040b99c:	c81fe06f          	j	8040a61c <stride_dequeue+0x111c>
8040b9a0:	0048a783          	lw	a5,4(a7)
8040b9a4:	0088a803          	lw	a6,8(a7)
8040b9a8:	00a12e23          	sw	a0,28(sp)
8040b9ac:	00f12823          	sw	a5,16(sp)
8040b9b0:	04080a63          	beqz	a6,8040ba04 <stride_dequeue+0x2504>
8040b9b4:	00080513          	mv	a0,a6
8040b9b8:	00098593          	mv	a1,s3
8040b9bc:	01112c23          	sw	a7,24(sp)
8040b9c0:	01012a23          	sw	a6,20(sp)
8040b9c4:	fa8fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040b9c8:	01c12e03          	lw	t3,28(sp)
8040b9cc:	01412803          	lw	a6,20(sp)
8040b9d0:	01812883          	lw	a7,24(sp)
8040b9d4:	69c508e3          	beq	a0,t3,8040c864 <stride_dequeue+0x3364>
8040b9d8:	0089a583          	lw	a1,8(s3)
8040b9dc:	0049ab03          	lw	s6,4(s3)
8040b9e0:	00080513          	mv	a0,a6
8040b9e4:	01112a23          	sw	a7,20(sp)
8040b9e8:	841fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040b9ec:	00a9a223          	sw	a0,4(s3)
8040b9f0:	0169a423          	sw	s6,8(s3)
8040b9f4:	01412883          	lw	a7,20(sp)
8040b9f8:	00050463          	beqz	a0,8040ba00 <stride_dequeue+0x2500>
8040b9fc:	01352023          	sw	s3,0(a0)
8040ba00:	008c2b03          	lw	s6,8(s8)
8040ba04:	01012783          	lw	a5,16(sp)
8040ba08:	0138a223          	sw	s3,4(a7)
8040ba0c:	00f8a423          	sw	a5,8(a7)
8040ba10:	0119a023          	sw	a7,0(s3)
8040ba14:	00088993          	mv	s3,a7
8040ba18:	9c1fe06f          	j	8040a3d8 <stride_dequeue+0xed8>
8040ba1c:	0048a783          	lw	a5,4(a7)
8040ba20:	0088a803          	lw	a6,8(a7)
8040ba24:	00a12e23          	sw	a0,28(sp)
8040ba28:	00f12623          	sw	a5,12(sp)
8040ba2c:	06080263          	beqz	a6,8040ba90 <stride_dequeue+0x2590>
8040ba30:	00080513          	mv	a0,a6
8040ba34:	00098593          	mv	a1,s3
8040ba38:	01112c23          	sw	a7,24(sp)
8040ba3c:	01012823          	sw	a6,16(sp)
8040ba40:	f2cfd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040ba44:	01c12e03          	lw	t3,28(sp)
8040ba48:	01012803          	lw	a6,16(sp)
8040ba4c:	01412603          	lw	a2,20(sp)
8040ba50:	01812883          	lw	a7,24(sp)
8040ba54:	01c51463          	bne	a0,t3,8040ba5c <stride_dequeue+0x255c>
8040ba58:	7690006f          	j	8040c9c0 <stride_dequeue+0x34c0>
8040ba5c:	0089a583          	lw	a1,8(s3)
8040ba60:	0049ab03          	lw	s6,4(s3)
8040ba64:	00080513          	mv	a0,a6
8040ba68:	01112a23          	sw	a7,20(sp)
8040ba6c:	00c12823          	sw	a2,16(sp)
8040ba70:	fb8fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040ba74:	00a9a223          	sw	a0,4(s3)
8040ba78:	0169a423          	sw	s6,8(s3)
8040ba7c:	01012603          	lw	a2,16(sp)
8040ba80:	01412883          	lw	a7,20(sp)
8040ba84:	00050463          	beqz	a0,8040ba8c <stride_dequeue+0x258c>
8040ba88:	01352023          	sw	s3,0(a0)
8040ba8c:	008c2b03          	lw	s6,8(s8)
8040ba90:	00c12783          	lw	a5,12(sp)
8040ba94:	0138a223          	sw	s3,4(a7)
8040ba98:	00f8a423          	sw	a5,8(a7)
8040ba9c:	0119a023          	sw	a7,0(s3)
8040baa0:	00088993          	mv	s3,a7
8040baa4:	a69fe06f          	j	8040a50c <stride_dequeue+0x100c>
8040baa8:	00462783          	lw	a5,4(a2)
8040baac:	00862883          	lw	a7,8(a2)
8040bab0:	00a12e23          	sw	a0,28(sp)
8040bab4:	00f12623          	sw	a5,12(sp)
8040bab8:	06088263          	beqz	a7,8040bb1c <stride_dequeue+0x261c>
8040babc:	00088513          	mv	a0,a7
8040bac0:	00098593          	mv	a1,s3
8040bac4:	01012c23          	sw	a6,24(sp)
8040bac8:	00c12a23          	sw	a2,20(sp)
8040bacc:	01112823          	sw	a7,16(sp)
8040bad0:	e9cfd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040bad4:	01c12e03          	lw	t3,28(sp)
8040bad8:	01012883          	lw	a7,16(sp)
8040badc:	01412603          	lw	a2,20(sp)
8040bae0:	01812803          	lw	a6,24(sp)
8040bae4:	45c502e3          	beq	a0,t3,8040c728 <stride_dequeue+0x3228>
8040bae8:	0089a583          	lw	a1,8(s3)
8040baec:	0049ab03          	lw	s6,4(s3)
8040baf0:	00088513          	mv	a0,a7
8040baf4:	01012a23          	sw	a6,20(sp)
8040baf8:	00c12823          	sw	a2,16(sp)
8040bafc:	f2cfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bb00:	00a9a223          	sw	a0,4(s3)
8040bb04:	0169a423          	sw	s6,8(s3)
8040bb08:	01012603          	lw	a2,16(sp)
8040bb0c:	01412803          	lw	a6,20(sp)
8040bb10:	00050463          	beqz	a0,8040bb18 <stride_dequeue+0x2618>
8040bb14:	01352023          	sw	s3,0(a0)
8040bb18:	008c2b03          	lw	s6,8(s8)
8040bb1c:	00c12783          	lw	a5,12(sp)
8040bb20:	01362223          	sw	s3,4(a2)
8040bb24:	00f62423          	sw	a5,8(a2)
8040bb28:	00c9a023          	sw	a2,0(s3)
8040bb2c:	00060993          	mv	s3,a2
8040bb30:	be0fe06f          	j	80409f10 <stride_dequeue+0xa10>
8040bb34:	0049a783          	lw	a5,4(s3)
8040bb38:	0089a303          	lw	t1,8(s3)
8040bb3c:	00a12e23          	sw	a0,28(sp)
8040bb40:	00f12823          	sw	a5,16(sp)
8040bb44:	04030a63          	beqz	t1,8040bb98 <stride_dequeue+0x2698>
8040bb48:	00080593          	mv	a1,a6
8040bb4c:	00030513          	mv	a0,t1
8040bb50:	01012c23          	sw	a6,24(sp)
8040bb54:	00612a23          	sw	t1,20(sp)
8040bb58:	e14fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040bb5c:	01c12e03          	lw	t3,28(sp)
8040bb60:	01412303          	lw	t1,20(sp)
8040bb64:	01812803          	lw	a6,24(sp)
8040bb68:	4dc506e3          	beq	a0,t3,8040c834 <stride_dequeue+0x3334>
8040bb6c:	00882583          	lw	a1,8(a6)
8040bb70:	00030513          	mv	a0,t1
8040bb74:	00482b03          	lw	s6,4(a6)
8040bb78:	01012a23          	sw	a6,20(sp)
8040bb7c:	eacfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bb80:	01412803          	lw	a6,20(sp)
8040bb84:	00a82223          	sw	a0,4(a6)
8040bb88:	01682423          	sw	s6,8(a6)
8040bb8c:	00050463          	beqz	a0,8040bb94 <stride_dequeue+0x2694>
8040bb90:	01052023          	sw	a6,0(a0)
8040bb94:	008c2b03          	lw	s6,8(s8)
8040bb98:	01012783          	lw	a5,16(sp)
8040bb9c:	0109a223          	sw	a6,4(s3)
8040bba0:	00f9a423          	sw	a5,8(s3)
8040bba4:	01382023          	sw	s3,0(a6)
8040bba8:	00098813          	mv	a6,s3
8040bbac:	85cff06f          	j	8040ac08 <stride_dequeue+0x1708>
8040bbb0:	008c2b03          	lw	s6,8(s8)
8040bbb4:	00088993          	mv	s3,a7
8040bbb8:	c70fe06f          	j	8040a028 <stride_dequeue+0xb28>
8040bbbc:	0049a783          	lw	a5,4(s3)
8040bbc0:	0089a303          	lw	t1,8(s3)
8040bbc4:	00a12e23          	sw	a0,28(sp)
8040bbc8:	00f12823          	sw	a5,16(sp)
8040bbcc:	04030a63          	beqz	t1,8040bc20 <stride_dequeue+0x2720>
8040bbd0:	00080593          	mv	a1,a6
8040bbd4:	00030513          	mv	a0,t1
8040bbd8:	01012c23          	sw	a6,24(sp)
8040bbdc:	00612a23          	sw	t1,20(sp)
8040bbe0:	d8cfd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040bbe4:	01c12e03          	lw	t3,28(sp)
8040bbe8:	01412303          	lw	t1,20(sp)
8040bbec:	01812803          	lw	a6,24(sp)
8040bbf0:	41c50ae3          	beq	a0,t3,8040c804 <stride_dequeue+0x3304>
8040bbf4:	00882583          	lw	a1,8(a6)
8040bbf8:	00030513          	mv	a0,t1
8040bbfc:	00482b03          	lw	s6,4(a6)
8040bc00:	01012a23          	sw	a6,20(sp)
8040bc04:	e24fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bc08:	01412803          	lw	a6,20(sp)
8040bc0c:	00a82223          	sw	a0,4(a6)
8040bc10:	01682423          	sw	s6,8(a6)
8040bc14:	00050463          	beqz	a0,8040bc1c <stride_dequeue+0x271c>
8040bc18:	01052023          	sw	a6,0(a0)
8040bc1c:	008c2b03          	lw	s6,8(s8)
8040bc20:	01012783          	lw	a5,16(sp)
8040bc24:	0109a223          	sw	a6,4(s3)
8040bc28:	00f9a423          	sw	a5,8(s3)
8040bc2c:	01382023          	sw	s3,0(a6)
8040bc30:	00098813          	mv	a6,s3
8040bc34:	8a8ff06f          	j	8040acdc <stride_dequeue+0x17dc>
8040bc38:	004ca783          	lw	a5,4(s9)
8040bc3c:	008ca883          	lw	a7,8(s9)
8040bc40:	00a12e23          	sw	a0,28(sp)
8040bc44:	00f12823          	sw	a5,16(sp)
8040bc48:	04088a63          	beqz	a7,8040bc9c <stride_dequeue+0x279c>
8040bc4c:	00088513          	mv	a0,a7
8040bc50:	00098593          	mv	a1,s3
8040bc54:	01012c23          	sw	a6,24(sp)
8040bc58:	01112a23          	sw	a7,20(sp)
8040bc5c:	d10fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040bc60:	01c12e03          	lw	t3,28(sp)
8040bc64:	01412883          	lw	a7,20(sp)
8040bc68:	01812803          	lw	a6,24(sp)
8040bc6c:	53c500e3          	beq	a0,t3,8040c98c <stride_dequeue+0x348c>
8040bc70:	0089a583          	lw	a1,8(s3)
8040bc74:	0049ab03          	lw	s6,4(s3)
8040bc78:	00088513          	mv	a0,a7
8040bc7c:	01012a23          	sw	a6,20(sp)
8040bc80:	da8fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bc84:	00a9a223          	sw	a0,4(s3)
8040bc88:	0169a423          	sw	s6,8(s3)
8040bc8c:	01412803          	lw	a6,20(sp)
8040bc90:	00050463          	beqz	a0,8040bc98 <stride_dequeue+0x2798>
8040bc94:	01352023          	sw	s3,0(a0)
8040bc98:	008c2b03          	lw	s6,8(s8)
8040bc9c:	01012783          	lw	a5,16(sp)
8040bca0:	013ca223          	sw	s3,4(s9)
8040bca4:	00fca423          	sw	a5,8(s9)
8040bca8:	0199a023          	sw	s9,0(s3)
8040bcac:	000c8993          	mv	s3,s9
8040bcb0:	f99fd06f          	j	80409c48 <stride_dequeue+0x748>
8040bcb4:	008c2b03          	lw	s6,8(s8)
8040bcb8:	000d8993          	mv	s3,s11
8040bcbc:	c11fd06f          	j	804098cc <stride_dequeue+0x3cc>
8040bcc0:	004a2783          	lw	a5,4(s4)
8040bcc4:	008a2883          	lw	a7,8(s4)
8040bcc8:	00a12e23          	sw	a0,28(sp)
8040bccc:	00f12823          	sw	a5,16(sp)
8040bcd0:	04088a63          	beqz	a7,8040bd24 <stride_dequeue+0x2824>
8040bcd4:	00088513          	mv	a0,a7
8040bcd8:	00098593          	mv	a1,s3
8040bcdc:	01012c23          	sw	a6,24(sp)
8040bce0:	01112a23          	sw	a7,20(sp)
8040bce4:	c88fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040bce8:	01c12e03          	lw	t3,28(sp)
8040bcec:	01412883          	lw	a7,20(sp)
8040bcf0:	01812803          	lw	a6,24(sp)
8040bcf4:	57c502e3          	beq	a0,t3,8040ca58 <stride_dequeue+0x3558>
8040bcf8:	0089a583          	lw	a1,8(s3)
8040bcfc:	0049ab03          	lw	s6,4(s3)
8040bd00:	00088513          	mv	a0,a7
8040bd04:	01012a23          	sw	a6,20(sp)
8040bd08:	d20fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bd0c:	00a9a223          	sw	a0,4(s3)
8040bd10:	0169a423          	sw	s6,8(s3)
8040bd14:	01412803          	lw	a6,20(sp)
8040bd18:	00050463          	beqz	a0,8040bd20 <stride_dequeue+0x2820>
8040bd1c:	01352023          	sw	s3,0(a0)
8040bd20:	008c2b03          	lw	s6,8(s8)
8040bd24:	01012783          	lw	a5,16(sp)
8040bd28:	013a2223          	sw	s3,4(s4)
8040bd2c:	00fa2423          	sw	a5,8(s4)
8040bd30:	0149a023          	sw	s4,0(s3)
8040bd34:	000a0993          	mv	s3,s4
8040bd38:	870fe06f          	j	80409da8 <stride_dequeue+0x8a8>
8040bd3c:	0049a783          	lw	a5,4(s3)
8040bd40:	0089a303          	lw	t1,8(s3)
8040bd44:	00a12e23          	sw	a0,28(sp)
8040bd48:	00f12823          	sw	a5,16(sp)
8040bd4c:	04030a63          	beqz	t1,8040bda0 <stride_dequeue+0x28a0>
8040bd50:	00030513          	mv	a0,t1
8040bd54:	000c8593          	mv	a1,s9
8040bd58:	01112c23          	sw	a7,24(sp)
8040bd5c:	00612a23          	sw	t1,20(sp)
8040bd60:	c0cfd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040bd64:	01c12e03          	lw	t3,28(sp)
8040bd68:	01412303          	lw	t1,20(sp)
8040bd6c:	01812883          	lw	a7,24(sp)
8040bd70:	1fc508e3          	beq	a0,t3,8040c760 <stride_dequeue+0x3260>
8040bd74:	008ca583          	lw	a1,8(s9)
8040bd78:	004cab03          	lw	s6,4(s9)
8040bd7c:	00030513          	mv	a0,t1
8040bd80:	01112a23          	sw	a7,20(sp)
8040bd84:	ca4fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bd88:	00aca223          	sw	a0,4(s9)
8040bd8c:	016ca423          	sw	s6,8(s9)
8040bd90:	01412883          	lw	a7,20(sp)
8040bd94:	00050463          	beqz	a0,8040bd9c <stride_dequeue+0x289c>
8040bd98:	01952023          	sw	s9,0(a0)
8040bd9c:	008c2b03          	lw	s6,8(s8)
8040bda0:	01012783          	lw	a5,16(sp)
8040bda4:	0199a223          	sw	s9,4(s3)
8040bda8:	00f9a423          	sw	a5,8(s3)
8040bdac:	013ca023          	sw	s3,0(s9)
8040bdb0:	00098c93          	mv	s9,s3
8040bdb4:	d7dfe06f          	j	8040ab30 <stride_dequeue+0x1630>
8040bdb8:	008c2b03          	lw	s6,8(s8)
8040bdbc:	000c8993          	mv	s3,s9
8040bdc0:	b9cfe06f          	j	8040a15c <stride_dequeue+0xc5c>
8040bdc4:	0049a783          	lw	a5,4(s3)
8040bdc8:	0089a303          	lw	t1,8(s3)
8040bdcc:	00a12e23          	sw	a0,28(sp)
8040bdd0:	00f12623          	sw	a5,12(sp)
8040bdd4:	06030263          	beqz	t1,8040be38 <stride_dequeue+0x2938>
8040bdd8:	00080593          	mv	a1,a6
8040bddc:	00030513          	mv	a0,t1
8040bde0:	00c12c23          	sw	a2,24(sp)
8040bde4:	01012a23          	sw	a6,20(sp)
8040bde8:	00612823          	sw	t1,16(sp)
8040bdec:	b80fd0ef          	jal	ra,8040916c <proc_stride_comp_f>
8040bdf0:	01812603          	lw	a2,24(sp)
8040bdf4:	01c12e03          	lw	t3,28(sp)
8040bdf8:	01412803          	lw	a6,20(sp)
8040bdfc:	00c12a23          	sw	a2,20(sp)
8040be00:	01012303          	lw	t1,16(sp)
8040be04:	29c50ae3          	beq	a0,t3,8040c898 <stride_dequeue+0x3398>
8040be08:	00882583          	lw	a1,8(a6)
8040be0c:	00030513          	mv	a0,t1
8040be10:	00482b03          	lw	s6,4(a6)
8040be14:	01012823          	sw	a6,16(sp)
8040be18:	c10fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040be1c:	01012803          	lw	a6,16(sp)
8040be20:	01412603          	lw	a2,20(sp)
8040be24:	00a82223          	sw	a0,4(a6)
8040be28:	01682423          	sw	s6,8(a6)
8040be2c:	00050463          	beqz	a0,8040be34 <stride_dequeue+0x2934>
8040be30:	01052023          	sw	a6,0(a0)
8040be34:	008c2b03          	lw	s6,8(s8)
8040be38:	00c12783          	lw	a5,12(sp)
8040be3c:	0109a223          	sw	a6,4(s3)
8040be40:	00f9a423          	sw	a5,8(s3)
8040be44:	01382023          	sw	s3,0(a6)
8040be48:	00098813          	mv	a6,s3
8040be4c:	f7dfe06f          	j	8040adc8 <stride_dequeue+0x18c8>
8040be50:	000a0993          	mv	s3,s4
8040be54:	c70fe06f          	j	8040a2c4 <stride_dequeue+0xdc4>
8040be58:	008c2b03          	lw	s6,8(s8)
8040be5c:	000d8993          	mv	s3,s11
8040be60:	c49fd06f          	j	80409aa8 <stride_dequeue+0x5a8>
8040be64:	008da503          	lw	a0,8(s11)
8040be68:	004dab03          	lw	s6,4(s11)
8040be6c:	00098593          	mv	a1,s3
8040be70:	bb8fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040be74:	00ada223          	sw	a0,4(s11)
8040be78:	016da423          	sw	s6,8(s11)
8040be7c:	01012603          	lw	a2,16(sp)
8040be80:	01412803          	lw	a6,20(sp)
8040be84:	01812303          	lw	t1,24(sp)
8040be88:	fc0508e3          	beqz	a0,8040be58 <stride_dequeue+0x2958>
8040be8c:	01b52023          	sw	s11,0(a0)
8040be90:	000d8993          	mv	s3,s11
8040be94:	008c2b03          	lw	s6,8(s8)
8040be98:	c11fd06f          	j	80409aa8 <stride_dequeue+0x5a8>
8040be9c:	0089a503          	lw	a0,8(s3)
8040bea0:	0049ab03          	lw	s6,4(s3)
8040bea4:	00078593          	mv	a1,a5
8040bea8:	01012a23          	sw	a6,20(sp)
8040beac:	b7cfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040beb0:	00a9a223          	sw	a0,4(s3)
8040beb4:	0169a423          	sw	s6,8(s3)
8040beb8:	01412803          	lw	a6,20(sp)
8040bebc:	6a050a63          	beqz	a0,8040c570 <stride_dequeue+0x3070>
8040bec0:	01352023          	sw	s3,0(a0)
8040bec4:	00098793          	mv	a5,s3
8040bec8:	008c2b03          	lw	s6,8(s8)
8040becc:	f85fe06f          	j	8040ae50 <stride_dequeue+0x1950>
8040bed0:	0088a503          	lw	a0,8(a7)
8040bed4:	00098593          	mv	a1,s3
8040bed8:	0048ab03          	lw	s6,4(a7)
8040bedc:	00612c23          	sw	t1,24(sp)
8040bee0:	01112a23          	sw	a7,20(sp)
8040bee4:	b44fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bee8:	01412883          	lw	a7,20(sp)
8040beec:	01812303          	lw	t1,24(sp)
8040bef0:	00a8a223          	sw	a0,4(a7)
8040bef4:	0168a423          	sw	s6,8(a7)
8040bef8:	ca050ce3          	beqz	a0,8040bbb0 <stride_dequeue+0x26b0>
8040befc:	01152023          	sw	a7,0(a0)
8040bf00:	00088993          	mv	s3,a7
8040bf04:	008c2b03          	lw	s6,8(s8)
8040bf08:	920fe06f          	j	8040a028 <stride_dequeue+0xb28>
8040bf0c:	008ca503          	lw	a0,8(s9)
8040bf10:	004cab03          	lw	s6,4(s9)
8040bf14:	00098593          	mv	a1,s3
8040bf18:	b10fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bf1c:	00aca223          	sw	a0,4(s9)
8040bf20:	016ca423          	sw	s6,8(s9)
8040bf24:	01412803          	lw	a6,20(sp)
8040bf28:	01812303          	lw	t1,24(sp)
8040bf2c:	e80506e3          	beqz	a0,8040bdb8 <stride_dequeue+0x28b8>
8040bf30:	01952023          	sw	s9,0(a0)
8040bf34:	000c8993          	mv	s3,s9
8040bf38:	008c2b03          	lw	s6,8(s8)
8040bf3c:	a20fe06f          	j	8040a15c <stride_dequeue+0xc5c>
8040bf40:	008da503          	lw	a0,8(s11)
8040bf44:	004dab03          	lw	s6,4(s11)
8040bf48:	00098593          	mv	a1,s3
8040bf4c:	adcfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bf50:	00ada223          	sw	a0,4(s11)
8040bf54:	016da423          	sw	s6,8(s11)
8040bf58:	01412803          	lw	a6,20(sp)
8040bf5c:	01812303          	lw	t1,24(sp)
8040bf60:	d4050ae3          	beqz	a0,8040bcb4 <stride_dequeue+0x27b4>
8040bf64:	01b52023          	sw	s11,0(a0)
8040bf68:	000d8993          	mv	s3,s11
8040bf6c:	008c2b03          	lw	s6,8(s8)
8040bf70:	95dfd06f          	j	804098cc <stride_dequeue+0x3cc>
8040bf74:	0088a503          	lw	a0,8(a7)
8040bf78:	00098593          	mv	a1,s3
8040bf7c:	0048ab03          	lw	s6,4(a7)
8040bf80:	01012c23          	sw	a6,24(sp)
8040bf84:	01112a23          	sw	a7,20(sp)
8040bf88:	aa0fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040bf8c:	01412883          	lw	a7,20(sp)
8040bf90:	01812803          	lw	a6,24(sp)
8040bf94:	00a8a223          	sw	a0,4(a7)
8040bf98:	0168a423          	sw	s6,8(a7)
8040bf9c:	96050ee3          	beqz	a0,8040b918 <stride_dequeue+0x2418>
8040bfa0:	01152023          	sw	a7,0(a0)
8040bfa4:	00088993          	mv	s3,a7
8040bfa8:	008c2b03          	lw	s6,8(s8)
8040bfac:	f3cfe06f          	j	8040a6e8 <stride_dequeue+0x11e8>
8040bfb0:	000a0993          	mv	s3,s4
8040bfb4:	df5fd06f          	j	80409da8 <stride_dequeue+0x8a8>
8040bfb8:	00009697          	auipc	a3,0x9
8040bfbc:	ef868693          	addi	a3,a3,-264 # 80414eb0 <CSWTCH.69+0xb30>
8040bfc0:	00007617          	auipc	a2,0x7
8040bfc4:	f0860613          	addi	a2,a2,-248 # 80412ec8 <commands+0x1bc>
8040bfc8:	06300593          	li	a1,99
8040bfcc:	00009517          	auipc	a0,0x9
8040bfd0:	f0850513          	addi	a0,a0,-248 # 80414ed4 <CSWTCH.69+0xb54>
8040bfd4:	e50f40ef          	jal	ra,80400624 <__panic>
8040bfd8:	000c8993          	mv	s3,s9
8040bfdc:	c6dfd06f          	j	80409c48 <stride_dequeue+0x748>
8040bfe0:	00088993          	mv	s3,a7
8040bfe4:	d28fe06f          	j	8040a50c <stride_dequeue+0x100c>
8040bfe8:	00088993          	mv	s3,a7
8040bfec:	becfe06f          	j	8040a3d8 <stride_dequeue+0xed8>
8040bff0:	00060993          	mv	s3,a2
8040bff4:	f1dfd06f          	j	80409f10 <stride_dequeue+0xa10>
8040bff8:	00088993          	mv	s3,a7
8040bffc:	e20fe06f          	j	8040a61c <stride_dequeue+0x111c>
8040c000:	0089a503          	lw	a0,8(s3)
8040c004:	0049ab03          	lw	s6,4(s3)
8040c008:	00040593          	mv	a1,s0
8040c00c:	a1cfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c010:	00a9a223          	sw	a0,4(s3)
8040c014:	0169a423          	sw	s6,8(s3)
8040c018:	00050463          	beqz	a0,8040c020 <stride_dequeue+0x2b20>
8040c01c:	01352023          	sw	s3,0(a0)
8040c020:	008c2b03          	lw	s6,8(s8)
8040c024:	ef1fe06f          	j	8040af14 <stride_dequeue+0x1a14>
8040c028:	0089a503          	lw	a0,8(s3)
8040c02c:	0049ab03          	lw	s6,4(s3)
8040c030:	00030593          	mv	a1,t1
8040c034:	01012a23          	sw	a6,20(sp)
8040c038:	9f0fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c03c:	00a9a223          	sw	a0,4(s3)
8040c040:	0169a423          	sw	s6,8(s3)
8040c044:	01412803          	lw	a6,20(sp)
8040c048:	300508e3          	beqz	a0,8040cb58 <stride_dequeue+0x3658>
8040c04c:	01352023          	sw	s3,0(a0)
8040c050:	00098313          	mv	t1,s3
8040c054:	008c2b03          	lw	s6,8(s8)
8040c058:	db4ff06f          	j	8040b60c <stride_dequeue+0x210c>
8040c05c:	0088a503          	lw	a0,8(a7)
8040c060:	000e0593          	mv	a1,t3
8040c064:	0048ab03          	lw	s6,4(a7)
8040c068:	01112a23          	sw	a7,20(sp)
8040c06c:	9bcfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c070:	01412883          	lw	a7,20(sp)
8040c074:	00a8a223          	sw	a0,4(a7)
8040c078:	0168a423          	sw	s6,8(a7)
8040c07c:	00050463          	beqz	a0,8040c084 <stride_dequeue+0x2b84>
8040c080:	01152023          	sw	a7,0(a0)
8040c084:	008c2b03          	lw	s6,8(s8)
8040c088:	d84fe06f          	j	8040a60c <stride_dequeue+0x110c>
8040c08c:	0089a503          	lw	a0,8(s3)
8040c090:	0049ab03          	lw	s6,4(s3)
8040c094:	00080593          	mv	a1,a6
8040c098:	01112a23          	sw	a7,20(sp)
8040c09c:	98cfd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c0a0:	00a9a223          	sw	a0,4(s3)
8040c0a4:	0169a423          	sw	s6,8(s3)
8040c0a8:	01412883          	lw	a7,20(sp)
8040c0ac:	300506e3          	beqz	a0,8040cbb8 <stride_dequeue+0x36b8>
8040c0b0:	01352023          	sw	s3,0(a0)
8040c0b4:	00098813          	mv	a6,s3
8040c0b8:	008c2b03          	lw	s6,8(s8)
8040c0bc:	c34ff06f          	j	8040b4f0 <stride_dequeue+0x1ff0>
8040c0c0:	0089a503          	lw	a0,8(s3)
8040c0c4:	0049ab03          	lw	s6,4(s3)
8040c0c8:	00060593          	mv	a1,a2
8040c0cc:	01112623          	sw	a7,12(sp)
8040c0d0:	958fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c0d4:	00a9a223          	sw	a0,4(s3)
8040c0d8:	0169a423          	sw	s6,8(s3)
8040c0dc:	00c12883          	lw	a7,12(sp)
8040c0e0:	00050463          	beqz	a0,8040c0e8 <stride_dequeue+0x2be8>
8040c0e4:	01352023          	sw	s3,0(a0)
8040c0e8:	008c2b03          	lw	s6,8(s8)
8040c0ec:	a90ff06f          	j	8040b37c <stride_dequeue+0x1e7c>
8040c0f0:	0089a503          	lw	a0,8(s3)
8040c0f4:	0049ab03          	lw	s6,4(s3)
8040c0f8:	000a0593          	mv	a1,s4
8040c0fc:	01112823          	sw	a7,16(sp)
8040c100:	928fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c104:	00a9a223          	sw	a0,4(s3)
8040c108:	0169a423          	sw	s6,8(s3)
8040c10c:	01012883          	lw	a7,16(sp)
8040c110:	00050463          	beqz	a0,8040c118 <stride_dequeue+0x2c18>
8040c114:	01352023          	sw	s3,0(a0)
8040c118:	008c2b03          	lw	s6,8(s8)
8040c11c:	fb9fe06f          	j	8040b0d4 <stride_dequeue+0x1bd4>
8040c120:	0089a503          	lw	a0,8(s3)
8040c124:	0049ab03          	lw	s6,4(s3)
8040c128:	000e0593          	mv	a1,t3
8040c12c:	01012a23          	sw	a6,20(sp)
8040c130:	00c12823          	sw	a2,16(sp)
8040c134:	8f4fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c138:	00a9a223          	sw	a0,4(s3)
8040c13c:	0169a423          	sw	s6,8(s3)
8040c140:	01012603          	lw	a2,16(sp)
8040c144:	01412803          	lw	a6,20(sp)
8040c148:	00050463          	beqz	a0,8040c150 <stride_dequeue+0x2c50>
8040c14c:	01352023          	sw	s3,0(a0)
8040c150:	008c2b03          	lw	s6,8(s8)
8040c154:	c65fe06f          	j	8040adb8 <stride_dequeue+0x18b8>
8040c158:	0089a503          	lw	a0,8(s3)
8040c15c:	0049ab03          	lw	s6,4(s3)
8040c160:	00080593          	mv	a1,a6
8040c164:	8c4fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c168:	00a9a223          	sw	a0,4(s3)
8040c16c:	0169a423          	sw	s6,8(s3)
8040c170:	00050463          	beqz	a0,8040c178 <stride_dequeue+0x2c78>
8040c174:	01352023          	sw	s3,0(a0)
8040c178:	008c2b03          	lw	s6,8(s8)
8040c17c:	914ff06f          	j	8040b290 <stride_dequeue+0x1d90>
8040c180:	0089a503          	lw	a0,8(s3)
8040c184:	0049ab03          	lw	s6,4(s3)
8040c188:	000e0593          	mv	a1,t3
8040c18c:	01012a23          	sw	a6,20(sp)
8040c190:	898fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c194:	00a9a223          	sw	a0,4(s3)
8040c198:	0169a423          	sw	s6,8(s3)
8040c19c:	01412803          	lw	a6,20(sp)
8040c1a0:	00050463          	beqz	a0,8040c1a8 <stride_dequeue+0x2ca8>
8040c1a4:	01352023          	sw	s3,0(a0)
8040c1a8:	008c2b03          	lw	s6,8(s8)
8040c1ac:	b21fe06f          	j	8040accc <stride_dequeue+0x17cc>
8040c1b0:	0089a503          	lw	a0,8(s3)
8040c1b4:	0049ab03          	lw	s6,4(s3)
8040c1b8:	00080593          	mv	a1,a6
8040c1bc:	00c12623          	sw	a2,12(sp)
8040c1c0:	868fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c1c4:	00a9a223          	sw	a0,4(s3)
8040c1c8:	0169a423          	sw	s6,8(s3)
8040c1cc:	00c12603          	lw	a2,12(sp)
8040c1d0:	00050463          	beqz	a0,8040c1d8 <stride_dequeue+0x2cd8>
8040c1d4:	01352023          	sw	s3,0(a0)
8040c1d8:	008c2b03          	lw	s6,8(s8)
8040c1dc:	a94ff06f          	j	8040b470 <stride_dequeue+0x1f70>
8040c1e0:	0088a503          	lw	a0,8(a7)
8040c1e4:	000e0593          	mv	a1,t3
8040c1e8:	0048ab03          	lw	s6,4(a7)
8040c1ec:	01112823          	sw	a7,16(sp)
8040c1f0:	838fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c1f4:	01012883          	lw	a7,16(sp)
8040c1f8:	01412603          	lw	a2,20(sp)
8040c1fc:	00a8a223          	sw	a0,4(a7)
8040c200:	0168a423          	sw	s6,8(a7)
8040c204:	00050463          	beqz	a0,8040c20c <stride_dequeue+0x2d0c>
8040c208:	01152023          	sw	a7,0(a0)
8040c20c:	008c2b03          	lw	s6,8(s8)
8040c210:	aecfe06f          	j	8040a4fc <stride_dequeue+0xffc>
8040c214:	0089a503          	lw	a0,8(s3)
8040c218:	0049ab03          	lw	s6,4(s3)
8040c21c:	00088593          	mv	a1,a7
8040c220:	808fd0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c224:	00a9a223          	sw	a0,4(s3)
8040c228:	0169a423          	sw	s6,8(s3)
8040c22c:	00050463          	beqz	a0,8040c234 <stride_dequeue+0x2d34>
8040c230:	01352023          	sw	s3,0(a0)
8040c234:	008c2b03          	lw	s6,8(s8)
8040c238:	811fe06f          	j	8040aa48 <stride_dequeue+0x1548>
8040c23c:	0089a503          	lw	a0,8(s3)
8040c240:	0049ab03          	lw	s6,4(s3)
8040c244:	00088593          	mv	a1,a7
8040c248:	fe1fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c24c:	00a9a223          	sw	a0,4(s3)
8040c250:	0169a423          	sw	s6,8(s3)
8040c254:	00050463          	beqz	a0,8040c25c <stride_dequeue+0x2d5c>
8040c258:	01352023          	sw	s3,0(a0)
8040c25c:	008c2b03          	lw	s6,8(s8)
8040c260:	ed4fe06f          	j	8040a934 <stride_dequeue+0x1434>
8040c264:	00862503          	lw	a0,8(a2)
8040c268:	000e0593          	mv	a1,t3
8040c26c:	00462b03          	lw	s6,4(a2)
8040c270:	fb9fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c274:	01012603          	lw	a2,16(sp)
8040c278:	01412803          	lw	a6,20(sp)
8040c27c:	00a62223          	sw	a0,4(a2)
8040c280:	01662423          	sw	s6,8(a2)
8040c284:	00050463          	beqz	a0,8040c28c <stride_dequeue+0x2d8c>
8040c288:	00c52023          	sw	a2,0(a0)
8040c28c:	008c2b03          	lw	s6,8(s8)
8040c290:	c71fd06f          	j	80409f00 <stride_dequeue+0xa00>
8040c294:	00040993          	mv	s3,s0
8040c298:	c7dfe06f          	j	8040af14 <stride_dequeue+0x1a14>
8040c29c:	008ca503          	lw	a0,8(s9)
8040c2a0:	004cab03          	lw	s6,4(s9)
8040c2a4:	000e0593          	mv	a1,t3
8040c2a8:	01012a23          	sw	a6,20(sp)
8040c2ac:	f7dfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c2b0:	00aca223          	sw	a0,4(s9)
8040c2b4:	016ca423          	sw	s6,8(s9)
8040c2b8:	01412803          	lw	a6,20(sp)
8040c2bc:	00050463          	beqz	a0,8040c2c4 <stride_dequeue+0x2dc4>
8040c2c0:	01952023          	sw	s9,0(a0)
8040c2c4:	008c2b03          	lw	s6,8(s8)
8040c2c8:	971fd06f          	j	80409c38 <stride_dequeue+0x738>
8040c2cc:	0089a503          	lw	a0,8(s3)
8040c2d0:	0049ab03          	lw	s6,4(s3)
8040c2d4:	00080593          	mv	a1,a6
8040c2d8:	f51fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c2dc:	00a9a223          	sw	a0,4(s3)
8040c2e0:	0169a423          	sw	s6,8(s3)
8040c2e4:	00050463          	beqz	a0,8040c2ec <stride_dequeue+0x2dec>
8040c2e8:	01352023          	sw	s3,0(a0)
8040c2ec:	008c2b03          	lw	s6,8(s8)
8040c2f0:	ec5fe06f          	j	8040b1b4 <stride_dequeue+0x1cb4>
8040c2f4:	008a2503          	lw	a0,8(s4)
8040c2f8:	004a2b03          	lw	s6,4(s4)
8040c2fc:	000e0593          	mv	a1,t3
8040c300:	01012a23          	sw	a6,20(sp)
8040c304:	f25fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c308:	00aa2223          	sw	a0,4(s4)
8040c30c:	016a2423          	sw	s6,8(s4)
8040c310:	01412803          	lw	a6,20(sp)
8040c314:	00050463          	beqz	a0,8040c31c <stride_dequeue+0x2e1c>
8040c318:	01452023          	sw	s4,0(a0)
8040c31c:	008c2b03          	lw	s6,8(s8)
8040c320:	a79fd06f          	j	80409d98 <stride_dequeue+0x898>
8040c324:	0089a503          	lw	a0,8(s3)
8040c328:	0049ab03          	lw	s6,4(s3)
8040c32c:	00030593          	mv	a1,t1
8040c330:	01012a23          	sw	a6,20(sp)
8040c334:	00c12823          	sw	a2,16(sp)
8040c338:	ef1fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c33c:	00a9a223          	sw	a0,4(s3)
8040c340:	0169a423          	sw	s6,8(s3)
8040c344:	01012603          	lw	a2,16(sp)
8040c348:	01412803          	lw	a6,20(sp)
8040c34c:	06050ce3          	beqz	a0,8040cbc4 <stride_dequeue+0x36c4>
8040c350:	01352023          	sw	s3,0(a0)
8040c354:	00098313          	mv	t1,s3
8040c358:	008c2b03          	lw	s6,8(s8)
8040c35c:	a2cff06f          	j	8040b588 <stride_dequeue+0x2088>
8040c360:	0089a503          	lw	a0,8(s3)
8040c364:	0049ab03          	lw	s6,4(s3)
8040c368:	000e0593          	mv	a1,t3
8040c36c:	01012a23          	sw	a6,20(sp)
8040c370:	eb9fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c374:	00a9a223          	sw	a0,4(s3)
8040c378:	0169a423          	sw	s6,8(s3)
8040c37c:	01412803          	lw	a6,20(sp)
8040c380:	00050463          	beqz	a0,8040c388 <stride_dequeue+0x2e88>
8040c384:	01352023          	sw	s3,0(a0)
8040c388:	008c2b03          	lw	s6,8(s8)
8040c38c:	86dfe06f          	j	8040abf8 <stride_dequeue+0x16f8>
8040c390:	0089a503          	lw	a0,8(s3)
8040c394:	0049ab03          	lw	s6,4(s3)
8040c398:	00030593          	mv	a1,t1
8040c39c:	01012a23          	sw	a6,20(sp)
8040c3a0:	e89fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c3a4:	00a9a223          	sw	a0,4(s3)
8040c3a8:	0169a423          	sw	s6,8(s3)
8040c3ac:	01412803          	lw	a6,20(sp)
8040c3b0:	76050663          	beqz	a0,8040cb1c <stride_dequeue+0x361c>
8040c3b4:	01352023          	sw	s3,0(a0)
8040c3b8:	00098313          	mv	t1,s3
8040c3bc:	008c2b03          	lw	s6,8(s8)
8040c3c0:	ad0ff06f          	j	8040b690 <stride_dequeue+0x2190>
8040c3c4:	0089a503          	lw	a0,8(s3)
8040c3c8:	0049ab03          	lw	s6,4(s3)
8040c3cc:	000e0593          	mv	a1,t3
8040c3d0:	01112a23          	sw	a7,20(sp)
8040c3d4:	e55fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c3d8:	00a9a223          	sw	a0,4(s3)
8040c3dc:	0169a423          	sw	s6,8(s3)
8040c3e0:	01412883          	lw	a7,20(sp)
8040c3e4:	00050463          	beqz	a0,8040c3ec <stride_dequeue+0x2eec>
8040c3e8:	01352023          	sw	s3,0(a0)
8040c3ec:	008c2b03          	lw	s6,8(s8)
8040c3f0:	f30fe06f          	j	8040ab20 <stride_dequeue+0x1620>
8040c3f4:	008a2503          	lw	a0,8(s4)
8040c3f8:	004a2b03          	lw	s6,4(s4)
8040c3fc:	00030593          	mv	a1,t1
8040c400:	e29fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c404:	00aa2223          	sw	a0,4(s4)
8040c408:	016a2423          	sw	s6,8(s4)
8040c40c:	00050463          	beqz	a0,8040c414 <stride_dequeue+0x2f14>
8040c410:	01452023          	sw	s4,0(a0)
8040c414:	008c2b03          	lw	s6,8(s8)
8040c418:	e9dfd06f          	j	8040a2b4 <stride_dequeue+0xdb4>
8040c41c:	0089a503          	lw	a0,8(s3)
8040c420:	0049ab03          	lw	s6,4(s3)
8040c424:	00088593          	mv	a1,a7
8040c428:	00c12623          	sw	a2,12(sp)
8040c42c:	dfdfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c430:	00a9a223          	sw	a0,4(s3)
8040c434:	0169a423          	sw	s6,8(s3)
8040c438:	00c12603          	lw	a2,12(sp)
8040c43c:	00050463          	beqz	a0,8040c444 <stride_dequeue+0x2f44>
8040c440:	01352023          	sw	s3,0(a0)
8040c444:	008c2b03          	lw	s6,8(s8)
8040c448:	bd4fe06f          	j	8040a81c <stride_dequeue+0x131c>
8040c44c:	0088a503          	lw	a0,8(a7)
8040c450:	000e0593          	mv	a1,t3
8040c454:	0048ab03          	lw	s6,4(a7)
8040c458:	01112a23          	sw	a7,20(sp)
8040c45c:	dcdfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c460:	01412883          	lw	a7,20(sp)
8040c464:	00a8a223          	sw	a0,4(a7)
8040c468:	0168a423          	sw	s6,8(a7)
8040c46c:	00050463          	beqz	a0,8040c474 <stride_dequeue+0x2f74>
8040c470:	01152023          	sw	a7,0(a0)
8040c474:	008c2b03          	lw	s6,8(s8)
8040c478:	f51fd06f          	j	8040a3c8 <stride_dequeue+0xec8>
8040c47c:	0089a503          	lw	a0,8(s3)
8040c480:	0049ab03          	lw	s6,4(s3)
8040c484:	00030593          	mv	a1,t1
8040c488:	01112a23          	sw	a7,20(sp)
8040c48c:	d9dfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c490:	00a9a223          	sw	a0,4(s3)
8040c494:	0169a423          	sw	s6,8(s3)
8040c498:	01412883          	lw	a7,20(sp)
8040c49c:	5e050863          	beqz	a0,8040ca8c <stride_dequeue+0x358c>
8040c4a0:	01352023          	sw	s3,0(a0)
8040c4a4:	00098313          	mv	t1,s3
8040c4a8:	008c2b03          	lw	s6,8(s8)
8040c4ac:	a64ff06f          	j	8040b710 <stride_dequeue+0x2210>
8040c4b0:	0089a503          	lw	a0,8(s3)
8040c4b4:	0049ab03          	lw	s6,4(s3)
8040c4b8:	000d8593          	mv	a1,s11
8040c4bc:	01112823          	sw	a7,16(sp)
8040c4c0:	d69fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c4c4:	00a9a223          	sw	a0,4(s3)
8040c4c8:	0169a423          	sw	s6,8(s3)
8040c4cc:	01012883          	lw	a7,16(sp)
8040c4d0:	00050463          	beqz	a0,8040c4d8 <stride_dequeue+0x2fd8>
8040c4d4:	01352023          	sw	s3,0(a0)
8040c4d8:	008c2b03          	lw	s6,8(s8)
8040c4dc:	b19fe06f          	j	8040aff4 <stride_dequeue+0x1af4>
8040c4e0:	00080993          	mv	s3,a6
8040c4e4:	cd1fe06f          	j	8040b1b4 <stride_dequeue+0x1cb4>
8040c4e8:	000d8993          	mv	s3,s11
8040c4ec:	b09fe06f          	j	8040aff4 <stride_dequeue+0x1af4>
8040c4f0:	00080993          	mv	s3,a6
8040c4f4:	d9dfe06f          	j	8040b290 <stride_dequeue+0x1d90>
8040c4f8:	00080993          	mv	s3,a6
8040c4fc:	f75fe06f          	j	8040b470 <stride_dequeue+0x1f70>
8040c500:	00060993          	mv	s3,a2
8040c504:	e79fe06f          	j	8040b37c <stride_dequeue+0x1e7c>
8040c508:	000a0993          	mv	s3,s4
8040c50c:	bc9fe06f          	j	8040b0d4 <stride_dequeue+0x1bd4>
8040c510:	008c2b03          	lw	s6,8(s8)
8040c514:	000e0c93          	mv	s9,t3
8040c518:	f20fd06f          	j	80409c38 <stride_dequeue+0x738>
8040c51c:	008c2b03          	lw	s6,8(s8)
8040c520:	000e0613          	mv	a2,t3
8040c524:	9ddfd06f          	j	80409f00 <stride_dequeue+0xa00>
8040c528:	0087a503          	lw	a0,8(a5)
8040c52c:	00098593          	mv	a1,s3
8040c530:	0047ab03          	lw	s6,4(a5)
8040c534:	cf5fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c538:	01012783          	lw	a5,16(sp)
8040c53c:	00a7a223          	sw	a0,4(a5)
8040c540:	0167a423          	sw	s6,8(a5)
8040c544:	68050663          	beqz	a0,8040cbd0 <stride_dequeue+0x36d0>
8040c548:	00f52023          	sw	a5,0(a0)
8040c54c:	00078993          	mv	s3,a5
8040c550:	008c2b03          	lw	s6,8(s8)
8040c554:	ad4ff06f          	j	8040b828 <stride_dequeue+0x2328>
8040c558:	008c2b03          	lw	s6,8(s8)
8040c55c:	000e0a13          	mv	s4,t3
8040c560:	839fd06f          	j	80409d98 <stride_dequeue+0x898>
8040c564:	008c2b03          	lw	s6,8(s8)
8040c568:	000e0993          	mv	s3,t3
8040c56c:	f60fe06f          	j	8040accc <stride_dequeue+0x17cc>
8040c570:	008c2b03          	lw	s6,8(s8)
8040c574:	00098793          	mv	a5,s3
8040c578:	8d9fe06f          	j	8040ae50 <stride_dequeue+0x1950>
8040c57c:	008c2b03          	lw	s6,8(s8)
8040c580:	000e0993          	mv	s3,t3
8040c584:	e74fe06f          	j	8040abf8 <stride_dequeue+0x16f8>
8040c588:	0089a503          	lw	a0,8(s3)
8040c58c:	0049ab03          	lw	s6,4(s3)
8040c590:	00088593          	mv	a1,a7
8040c594:	c95fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c598:	00a9a223          	sw	a0,4(s3)
8040c59c:	0169a423          	sw	s6,8(s3)
8040c5a0:	00050463          	beqz	a0,8040c5a8 <stride_dequeue+0x30a8>
8040c5a4:	01352023          	sw	s3,0(a0)
8040c5a8:	008c2b03          	lw	s6,8(s8)
8040c5ac:	955fe06f          	j	8040af00 <stride_dequeue+0x1a00>
8040c5b0:	008c2b03          	lw	s6,8(s8)
8040c5b4:	000e0893          	mv	a7,t3
8040c5b8:	854fe06f          	j	8040a60c <stride_dequeue+0x110c>
8040c5bc:	0087a503          	lw	a0,8(a5)
8040c5c0:	000a0593          	mv	a1,s4
8040c5c4:	0047ab03          	lw	s6,4(a5)
8040c5c8:	c61fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c5cc:	00c12783          	lw	a5,12(sp)
8040c5d0:	01012603          	lw	a2,16(sp)
8040c5d4:	00a7a223          	sw	a0,4(a5)
8040c5d8:	0167a423          	sw	s6,8(a5)
8040c5dc:	52050a63          	beqz	a0,8040cb10 <stride_dequeue+0x3610>
8040c5e0:	00f52023          	sw	a5,0(a0)
8040c5e4:	00078a13          	mv	s4,a5
8040c5e8:	008c2b03          	lw	s6,8(s8)
8040c5ec:	9d0ff06f          	j	8040b7bc <stride_dequeue+0x22bc>
8040c5f0:	008c2b03          	lw	s6,8(s8)
8040c5f4:	000e0893          	mv	a7,t3
8040c5f8:	dd1fd06f          	j	8040a3c8 <stride_dequeue+0xec8>
8040c5fc:	008c2b03          	lw	s6,8(s8)
8040c600:	000e0993          	mv	s3,t3
8040c604:	d1cfe06f          	j	8040ab20 <stride_dequeue+0x1620>
8040c608:	008c2b03          	lw	s6,8(s8)
8040c60c:	000e0993          	mv	s3,t3
8040c610:	fa8fe06f          	j	8040adb8 <stride_dequeue+0x18b8>
8040c614:	008c2b03          	lw	s6,8(s8)
8040c618:	000e0893          	mv	a7,t3
8040c61c:	ee1fd06f          	j	8040a4fc <stride_dequeue+0xffc>
8040c620:	0087a503          	lw	a0,8(a5)
8040c624:	000c8593          	mv	a1,s9
8040c628:	0047ab03          	lw	s6,4(a5)
8040c62c:	bfdfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c630:	01012783          	lw	a5,16(sp)
8040c634:	00a7a223          	sw	a0,4(a5)
8040c638:	0167a423          	sw	s6,8(a5)
8040c63c:	44050e63          	beqz	a0,8040ca98 <stride_dequeue+0x3598>
8040c640:	00f52023          	sw	a5,0(a0)
8040c644:	00078c93          	mv	s9,a5
8040c648:	008c2b03          	lw	s6,8(s8)
8040c64c:	ab4ff06f          	j	8040b900 <stride_dequeue+0x2400>
8040c650:	0087a503          	lw	a0,8(a5)
8040c654:	000a0593          	mv	a1,s4
8040c658:	0047ab03          	lw	s6,4(a5)
8040c65c:	bcdfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c660:	01012783          	lw	a5,16(sp)
8040c664:	00a7a223          	sw	a0,4(a5)
8040c668:	0167a423          	sw	s6,8(a5)
8040c66c:	52050463          	beqz	a0,8040cb94 <stride_dequeue+0x3694>
8040c670:	00f52023          	sw	a5,0(a0)
8040c674:	00078a13          	mv	s4,a5
8040c678:	008c2b03          	lw	s6,8(s8)
8040c67c:	a18ff06f          	j	8040b894 <stride_dequeue+0x2394>
8040c680:	008c2b03          	lw	s6,8(s8)
8040c684:	00088993          	mv	s3,a7
8040c688:	879fe06f          	j	8040af00 <stride_dequeue+0x1a00>
8040c68c:	0089a503          	lw	a0,8(s3)
8040c690:	0049ab03          	lw	s6,4(s3)
8040c694:	000e0593          	mv	a1,t3
8040c698:	01012a23          	sw	a6,20(sp)
8040c69c:	b8dfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c6a0:	00a9a223          	sw	a0,4(s3)
8040c6a4:	0169a423          	sw	s6,8(s3)
8040c6a8:	01412803          	lw	a6,20(sp)
8040c6ac:	00050463          	beqz	a0,8040c6b4 <stride_dequeue+0x31b4>
8040c6b0:	01352023          	sw	s3,0(a0)
8040c6b4:	008c2b03          	lw	s6,8(s8)
8040c6b8:	bc5fe06f          	j	8040b27c <stride_dequeue+0x1d7c>
8040c6bc:	00882503          	lw	a0,8(a6)
8040c6c0:	00098593          	mv	a1,s3
8040c6c4:	00482b03          	lw	s6,4(a6)
8040c6c8:	b61fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c6cc:	01412803          	lw	a6,20(sp)
8040c6d0:	01812883          	lw	a7,24(sp)
8040c6d4:	00a82223          	sw	a0,4(a6)
8040c6d8:	01682423          	sw	s6,8(a6)
8040c6dc:	4a050063          	beqz	a0,8040cb7c <stride_dequeue+0x367c>
8040c6e0:	01052023          	sw	a6,0(a0)
8040c6e4:	00080993          	mv	s3,a6
8040c6e8:	008c2b03          	lw	s6,8(s8)
8040c6ec:	a9cff06f          	j	8040b988 <stride_dequeue+0x2488>
8040c6f0:	0089a503          	lw	a0,8(s3)
8040c6f4:	0049ab03          	lw	s6,4(s3)
8040c6f8:	000e0593          	mv	a1,t3
8040c6fc:	01112a23          	sw	a7,20(sp)
8040c700:	00c12823          	sw	a2,16(sp)
8040c704:	b25fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c708:	00a9a223          	sw	a0,4(s3)
8040c70c:	0169a423          	sw	s6,8(s3)
8040c710:	01012603          	lw	a2,16(sp)
8040c714:	01412883          	lw	a7,20(sp)
8040c718:	00050463          	beqz	a0,8040c720 <stride_dequeue+0x3220>
8040c71c:	01352023          	sw	s3,0(a0)
8040c720:	008c2b03          	lw	s6,8(s8)
8040c724:	c45fe06f          	j	8040b368 <stride_dequeue+0x1e68>
8040c728:	0088a503          	lw	a0,8(a7)
8040c72c:	00098593          	mv	a1,s3
8040c730:	0048ab03          	lw	s6,4(a7)
8040c734:	af5fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c738:	01012883          	lw	a7,16(sp)
8040c73c:	01412603          	lw	a2,20(sp)
8040c740:	01812803          	lw	a6,24(sp)
8040c744:	00a8a223          	sw	a0,4(a7)
8040c748:	0168a423          	sw	s6,8(a7)
8040c74c:	48050863          	beqz	a0,8040cbdc <stride_dequeue+0x36dc>
8040c750:	01152023          	sw	a7,0(a0)
8040c754:	00088993          	mv	s3,a7
8040c758:	008c2b03          	lw	s6,8(s8)
8040c75c:	bc0ff06f          	j	8040bb1c <stride_dequeue+0x261c>
8040c760:	00832503          	lw	a0,8(t1)
8040c764:	000c8593          	mv	a1,s9
8040c768:	00432b03          	lw	s6,4(t1)
8040c76c:	abdfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c770:	01412303          	lw	t1,20(sp)
8040c774:	01812883          	lw	a7,24(sp)
8040c778:	00a32223          	sw	a0,4(t1)
8040c77c:	01632423          	sw	s6,8(t1)
8040c780:	36050663          	beqz	a0,8040caec <stride_dequeue+0x35ec>
8040c784:	00652023          	sw	t1,0(a0)
8040c788:	00030c93          	mv	s9,t1
8040c78c:	008c2b03          	lw	s6,8(s8)
8040c790:	e10ff06f          	j	8040bda0 <stride_dequeue+0x28a0>
8040c794:	0089a503          	lw	a0,8(s3)
8040c798:	0049ab03          	lw	s6,4(s3)
8040c79c:	000e0593          	mv	a1,t3
8040c7a0:	01112a23          	sw	a7,20(sp)
8040c7a4:	00c12823          	sw	a2,16(sp)
8040c7a8:	a81fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c7ac:	00a9a223          	sw	a0,4(s3)
8040c7b0:	0169a423          	sw	s6,8(s3)
8040c7b4:	01012603          	lw	a2,16(sp)
8040c7b8:	01412883          	lw	a7,20(sp)
8040c7bc:	00050463          	beqz	a0,8040c7c4 <stride_dequeue+0x32c4>
8040c7c0:	01352023          	sw	s3,0(a0)
8040c7c4:	008c2b03          	lw	s6,8(s8)
8040c7c8:	840fe06f          	j	8040a808 <stride_dequeue+0x1308>
8040c7cc:	0089a503          	lw	a0,8(s3)
8040c7d0:	0049ab03          	lw	s6,4(s3)
8040c7d4:	000e0593          	mv	a1,t3
8040c7d8:	01012a23          	sw	a6,20(sp)
8040c7dc:	00c12823          	sw	a2,16(sp)
8040c7e0:	a49fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c7e4:	00a9a223          	sw	a0,4(s3)
8040c7e8:	0169a423          	sw	s6,8(s3)
8040c7ec:	01012603          	lw	a2,16(sp)
8040c7f0:	01412803          	lw	a6,20(sp)
8040c7f4:	00050463          	beqz	a0,8040c7fc <stride_dequeue+0x32fc>
8040c7f8:	01352023          	sw	s3,0(a0)
8040c7fc:	008c2b03          	lw	s6,8(s8)
8040c800:	c5dfe06f          	j	8040b45c <stride_dequeue+0x1f5c>
8040c804:	00832503          	lw	a0,8(t1)
8040c808:	00080593          	mv	a1,a6
8040c80c:	00432b03          	lw	s6,4(t1)
8040c810:	a19fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c814:	01412303          	lw	t1,20(sp)
8040c818:	00a32223          	sw	a0,4(t1)
8040c81c:	01632423          	sw	s6,8(t1)
8040c820:	2e050263          	beqz	a0,8040cb04 <stride_dequeue+0x3604>
8040c824:	00652023          	sw	t1,0(a0)
8040c828:	00030813          	mv	a6,t1
8040c82c:	008c2b03          	lw	s6,8(s8)
8040c830:	bf0ff06f          	j	8040bc20 <stride_dequeue+0x2720>
8040c834:	00832503          	lw	a0,8(t1)
8040c838:	00080593          	mv	a1,a6
8040c83c:	00432b03          	lw	s6,4(t1)
8040c840:	9e9fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c844:	01412303          	lw	t1,20(sp)
8040c848:	00a32223          	sw	a0,4(t1)
8040c84c:	01632423          	sw	s6,8(t1)
8040c850:	2e050263          	beqz	a0,8040cb34 <stride_dequeue+0x3634>
8040c854:	00652023          	sw	t1,0(a0)
8040c858:	00030813          	mv	a6,t1
8040c85c:	008c2b03          	lw	s6,8(s8)
8040c860:	b38ff06f          	j	8040bb98 <stride_dequeue+0x2698>
8040c864:	00882503          	lw	a0,8(a6)
8040c868:	00098593          	mv	a1,s3
8040c86c:	00482b03          	lw	s6,4(a6)
8040c870:	9b9fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c874:	01412803          	lw	a6,20(sp)
8040c878:	01812883          	lw	a7,24(sp)
8040c87c:	00a82223          	sw	a0,4(a6)
8040c880:	01682423          	sw	s6,8(a6)
8040c884:	22050663          	beqz	a0,8040cab0 <stride_dequeue+0x35b0>
8040c888:	01052023          	sw	a6,0(a0)
8040c88c:	00080993          	mv	s3,a6
8040c890:	008c2b03          	lw	s6,8(s8)
8040c894:	970ff06f          	j	8040ba04 <stride_dequeue+0x2504>
8040c898:	00832503          	lw	a0,8(t1)
8040c89c:	00080593          	mv	a1,a6
8040c8a0:	00432b03          	lw	s6,4(t1)
8040c8a4:	985fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c8a8:	01012303          	lw	t1,16(sp)
8040c8ac:	01412603          	lw	a2,20(sp)
8040c8b0:	00a32223          	sw	a0,4(t1)
8040c8b4:	01632423          	sw	s6,8(t1)
8040c8b8:	2e050a63          	beqz	a0,8040cbac <stride_dequeue+0x36ac>
8040c8bc:	00652023          	sw	t1,0(a0)
8040c8c0:	00030813          	mv	a6,t1
8040c8c4:	008c2b03          	lw	s6,8(s8)
8040c8c8:	d70ff06f          	j	8040be38 <stride_dequeue+0x2938>
8040c8cc:	008a2503          	lw	a0,8(s4)
8040c8d0:	004a2b03          	lw	s6,4(s4)
8040c8d4:	000e0593          	mv	a1,t3
8040c8d8:	00612a23          	sw	t1,20(sp)
8040c8dc:	94dfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c8e0:	00aa2223          	sw	a0,4(s4)
8040c8e4:	016a2423          	sw	s6,8(s4)
8040c8e8:	01412303          	lw	t1,20(sp)
8040c8ec:	00050463          	beqz	a0,8040c8f4 <stride_dequeue+0x33f4>
8040c8f0:	01452023          	sw	s4,0(a0)
8040c8f4:	008c2b03          	lw	s6,8(s8)
8040c8f8:	9a9fd06f          	j	8040a2a0 <stride_dequeue+0xda0>
8040c8fc:	0089a503          	lw	a0,8(s3)
8040c900:	0049ab03          	lw	s6,4(s3)
8040c904:	000e0593          	mv	a1,t3
8040c908:	01112a23          	sw	a7,20(sp)
8040c90c:	91dfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c910:	00a9a223          	sw	a0,4(s3)
8040c914:	0169a423          	sw	s6,8(s3)
8040c918:	01412883          	lw	a7,20(sp)
8040c91c:	00050463          	beqz	a0,8040c924 <stride_dequeue+0x3424>
8040c920:	01352023          	sw	s3,0(a0)
8040c924:	008c2b03          	lw	s6,8(s8)
8040c928:	f98fe06f          	j	8040b0c0 <stride_dequeue+0x1bc0>
8040c92c:	0089a503          	lw	a0,8(s3)
8040c930:	0049ab03          	lw	s6,4(s3)
8040c934:	000e0593          	mv	a1,t3
8040c938:	01012a23          	sw	a6,20(sp)
8040c93c:	8edfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c940:	00a9a223          	sw	a0,4(s3)
8040c944:	0169a423          	sw	s6,8(s3)
8040c948:	01412803          	lw	a6,20(sp)
8040c94c:	00050463          	beqz	a0,8040c954 <stride_dequeue+0x3454>
8040c950:	01352023          	sw	s3,0(a0)
8040c954:	008c2b03          	lw	s6,8(s8)
8040c958:	849fe06f          	j	8040b1a0 <stride_dequeue+0x1ca0>
8040c95c:	0089a503          	lw	a0,8(s3)
8040c960:	0049ab03          	lw	s6,4(s3)
8040c964:	000e0593          	mv	a1,t3
8040c968:	01112a23          	sw	a7,20(sp)
8040c96c:	8bdfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c970:	00a9a223          	sw	a0,4(s3)
8040c974:	0169a423          	sw	s6,8(s3)
8040c978:	01412883          	lw	a7,20(sp)
8040c97c:	00050463          	beqz	a0,8040c984 <stride_dequeue+0x3484>
8040c980:	01352023          	sw	s3,0(a0)
8040c984:	008c2b03          	lw	s6,8(s8)
8040c988:	f99fd06f          	j	8040a920 <stride_dequeue+0x1420>
8040c98c:	0088a503          	lw	a0,8(a7)
8040c990:	00098593          	mv	a1,s3
8040c994:	0048ab03          	lw	s6,4(a7)
8040c998:	891fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c99c:	01412883          	lw	a7,20(sp)
8040c9a0:	01812803          	lw	a6,24(sp)
8040c9a4:	00a8a223          	sw	a0,4(a7)
8040c9a8:	0168a423          	sw	s6,8(a7)
8040c9ac:	0e050c63          	beqz	a0,8040caa4 <stride_dequeue+0x35a4>
8040c9b0:	01152023          	sw	a7,0(a0)
8040c9b4:	00088993          	mv	s3,a7
8040c9b8:	008c2b03          	lw	s6,8(s8)
8040c9bc:	ae0ff06f          	j	8040bc9c <stride_dequeue+0x279c>
8040c9c0:	00882503          	lw	a0,8(a6)
8040c9c4:	00098593          	mv	a1,s3
8040c9c8:	00482b03          	lw	s6,4(a6)
8040c9cc:	85dfc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040c9d0:	01012803          	lw	a6,16(sp)
8040c9d4:	01412603          	lw	a2,20(sp)
8040c9d8:	01812883          	lw	a7,24(sp)
8040c9dc:	00a82223          	sw	a0,4(a6)
8040c9e0:	01682423          	sw	s6,8(a6)
8040c9e4:	16050463          	beqz	a0,8040cb4c <stride_dequeue+0x364c>
8040c9e8:	01052023          	sw	a6,0(a0)
8040c9ec:	00080993          	mv	s3,a6
8040c9f0:	008c2b03          	lw	s6,8(s8)
8040c9f4:	89cff06f          	j	8040ba90 <stride_dequeue+0x2590>
8040c9f8:	0089a503          	lw	a0,8(s3)
8040c9fc:	0049ab03          	lw	s6,4(s3)
8040ca00:	000e0593          	mv	a1,t3
8040ca04:	01112a23          	sw	a7,20(sp)
8040ca08:	821fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040ca0c:	00a9a223          	sw	a0,4(s3)
8040ca10:	0169a423          	sw	s6,8(s3)
8040ca14:	01412883          	lw	a7,20(sp)
8040ca18:	00050463          	beqz	a0,8040ca20 <stride_dequeue+0x3520>
8040ca1c:	01352023          	sw	s3,0(a0)
8040ca20:	008c2b03          	lw	s6,8(s8)
8040ca24:	810fe06f          	j	8040aa34 <stride_dequeue+0x1534>
8040ca28:	0089a503          	lw	a0,8(s3)
8040ca2c:	0049ab03          	lw	s6,4(s3)
8040ca30:	000e0593          	mv	a1,t3
8040ca34:	01112a23          	sw	a7,20(sp)
8040ca38:	ff0fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040ca3c:	00a9a223          	sw	a0,4(s3)
8040ca40:	0169a423          	sw	s6,8(s3)
8040ca44:	01412883          	lw	a7,20(sp)
8040ca48:	00050463          	beqz	a0,8040ca50 <stride_dequeue+0x3550>
8040ca4c:	01352023          	sw	s3,0(a0)
8040ca50:	008c2b03          	lw	s6,8(s8)
8040ca54:	d8cfe06f          	j	8040afe0 <stride_dequeue+0x1ae0>
8040ca58:	0088a503          	lw	a0,8(a7)
8040ca5c:	00098593          	mv	a1,s3
8040ca60:	0048ab03          	lw	s6,4(a7)
8040ca64:	fc4fc0ef          	jal	ra,80409228 <skew_heap_merge.constprop.3>
8040ca68:	01412883          	lw	a7,20(sp)
8040ca6c:	01812803          	lw	a6,24(sp)
8040ca70:	00a8a223          	sw	a0,4(a7)
8040ca74:	0168a423          	sw	s6,8(a7)
8040ca78:	04050263          	beqz	a0,8040cabc <stride_dequeue+0x35bc>
8040ca7c:	01152023          	sw	a7,0(a0)
8040ca80:	00088993          	mv	s3,a7
8040ca84:	008c2b03          	lw	s6,8(s8)
8040ca88:	a9cff06f          	j	8040bd24 <stride_dequeue+0x2824>
8040ca8c:	008c2b03          	lw	s6,8(s8)
8040ca90:	00098313          	mv	t1,s3
8040ca94:	c7dfe06f          	j	8040b710 <stride_dequeue+0x2210>
8040ca98:	008c2b03          	lw	s6,8(s8)
8040ca9c:	00078c93          	mv	s9,a5
8040caa0:	e61fe06f          	j	8040b900 <stride_dequeue+0x2400>
8040caa4:	008c2b03          	lw	s6,8(s8)
8040caa8:	00088993          	mv	s3,a7
8040caac:	9f0ff06f          	j	8040bc9c <stride_dequeue+0x279c>
8040cab0:	008c2b03          	lw	s6,8(s8)
8040cab4:	00080993          	mv	s3,a6
8040cab8:	f4dfe06f          	j	8040ba04 <stride_dequeue+0x2504>
8040cabc:	008c2b03          	lw	s6,8(s8)
8040cac0:	00088993          	mv	s3,a7
8040cac4:	a60ff06f          	j	8040bd24 <stride_dequeue+0x2824>
8040cac8:	008c2b03          	lw	s6,8(s8)
8040cacc:	000e0993          	mv	s3,t3
8040cad0:	df0fe06f          	j	8040b0c0 <stride_dequeue+0x1bc0>
8040cad4:	008c2b03          	lw	s6,8(s8)
8040cad8:	000e0993          	mv	s3,t3
8040cadc:	ec4fe06f          	j	8040b1a0 <stride_dequeue+0x1ca0>
8040cae0:	008c2b03          	lw	s6,8(s8)
8040cae4:	000e0993          	mv	s3,t3
8040cae8:	d21fd06f          	j	8040a808 <stride_dequeue+0x1308>
8040caec:	008c2b03          	lw	s6,8(s8)
8040caf0:	00030c93          	mv	s9,t1
8040caf4:	aacff06f          	j	8040bda0 <stride_dequeue+0x28a0>
8040caf8:	008c2b03          	lw	s6,8(s8)
8040cafc:	000e0993          	mv	s3,t3
8040cb00:	95dfe06f          	j	8040b45c <stride_dequeue+0x1f5c>
8040cb04:	008c2b03          	lw	s6,8(s8)
8040cb08:	00030813          	mv	a6,t1
8040cb0c:	914ff06f          	j	8040bc20 <stride_dequeue+0x2720>
8040cb10:	008c2b03          	lw	s6,8(s8)
8040cb14:	00078a13          	mv	s4,a5
8040cb18:	ca5fe06f          	j	8040b7bc <stride_dequeue+0x22bc>
8040cb1c:	008c2b03          	lw	s6,8(s8)
8040cb20:	00098313          	mv	t1,s3
8040cb24:	b6dfe06f          	j	8040b690 <stride_dequeue+0x2190>
8040cb28:	008c2b03          	lw	s6,8(s8)
8040cb2c:	000e0993          	mv	s3,t3
8040cb30:	cb0fe06f          	j	8040afe0 <stride_dequeue+0x1ae0>
8040cb34:	008c2b03          	lw	s6,8(s8)
8040cb38:	00030813          	mv	a6,t1
8040cb3c:	85cff06f          	j	8040bb98 <stride_dequeue+0x2698>
8040cb40:	008c2b03          	lw	s6,8(s8)
8040cb44:	000e0993          	mv	s3,t3
8040cb48:	eedfd06f          	j	8040aa34 <stride_dequeue+0x1534>
8040cb4c:	008c2b03          	lw	s6,8(s8)
8040cb50:	00080993          	mv	s3,a6
8040cb54:	f3dfe06f          	j	8040ba90 <stride_dequeue+0x2590>
8040cb58:	008c2b03          	lw	s6,8(s8)
8040cb5c:	00098313          	mv	t1,s3
8040cb60:	aadfe06f          	j	8040b60c <stride_dequeue+0x210c>
8040cb64:	008c2b03          	lw	s6,8(s8)
8040cb68:	000e0993          	mv	s3,t3
8040cb6c:	f10fe06f          	j	8040b27c <stride_dequeue+0x1d7c>
8040cb70:	008c2b03          	lw	s6,8(s8)
8040cb74:	000e0993          	mv	s3,t3
8040cb78:	ff0fe06f          	j	8040b368 <stride_dequeue+0x1e68>
8040cb7c:	008c2b03          	lw	s6,8(s8)
8040cb80:	00080993          	mv	s3,a6
8040cb84:	e05fe06f          	j	8040b988 <stride_dequeue+0x2488>
8040cb88:	008c2b03          	lw	s6,8(s8)
8040cb8c:	000e0993          	mv	s3,t3
8040cb90:	d91fd06f          	j	8040a920 <stride_dequeue+0x1420>
8040cb94:	008c2b03          	lw	s6,8(s8)
8040cb98:	00078a13          	mv	s4,a5
8040cb9c:	cf9fe06f          	j	8040b894 <stride_dequeue+0x2394>
8040cba0:	008c2b03          	lw	s6,8(s8)
8040cba4:	000e0a13          	mv	s4,t3
8040cba8:	ef8fd06f          	j	8040a2a0 <stride_dequeue+0xda0>
8040cbac:	008c2b03          	lw	s6,8(s8)
8040cbb0:	00030813          	mv	a6,t1
8040cbb4:	a84ff06f          	j	8040be38 <stride_dequeue+0x2938>
8040cbb8:	008c2b03          	lw	s6,8(s8)
8040cbbc:	00098813          	mv	a6,s3
8040cbc0:	931fe06f          	j	8040b4f0 <stride_dequeue+0x1ff0>
8040cbc4:	008c2b03          	lw	s6,8(s8)
8040cbc8:	00098313          	mv	t1,s3
8040cbcc:	9bdfe06f          	j	8040b588 <stride_dequeue+0x2088>
8040cbd0:	008c2b03          	lw	s6,8(s8)
8040cbd4:	00078993          	mv	s3,a5
8040cbd8:	c51fe06f          	j	8040b828 <stride_dequeue+0x2328>
8040cbdc:	008c2b03          	lw	s6,8(s8)
8040cbe0:	00088993          	mv	s3,a7
8040cbe4:	f39fe06f          	j	8040bb1c <stride_dequeue+0x261c>

8040cbe8 <sched_init>:
8040cbe8:	ff010113          	addi	sp,sp,-16
8040cbec:	0008c697          	auipc	a3,0x8c
8040cbf0:	43468693          	addi	a3,a3,1076 # 80499020 <default_sched_class>
8040cbf4:	00812423          	sw	s0,8(sp)
8040cbf8:	00112623          	sw	ra,12(sp)
8040cbfc:	00090797          	auipc	a5,0x90
8040cc00:	bc878793          	addi	a5,a5,-1080 # 8049c7c4 <timer_list>
8040cc04:	0046a603          	lw	a2,4(a3)
8040cc08:	0008f717          	auipc	a4,0x8f
8040cc0c:	b4070713          	addi	a4,a4,-1216 # 8049b748 <__rq>
8040cc10:	00f7a223          	sw	a5,4(a5)
8040cc14:	00f7a023          	sw	a5,0(a5)
8040cc18:	00500793          	li	a5,5
8040cc1c:	00090417          	auipc	s0,0x90
8040cc20:	ba440413          	addi	s0,s0,-1116 # 8049c7c0 <sched_class>
8040cc24:	00f72623          	sw	a5,12(a4)
8040cc28:	00070513          	mv	a0,a4
8040cc2c:	00d42023          	sw	a3,0(s0)
8040cc30:	00090797          	auipc	a5,0x90
8040cc34:	b8e7a623          	sw	a4,-1140(a5) # 8049c7bc <rq>
8040cc38:	000600e7          	jalr	a2
8040cc3c:	00042783          	lw	a5,0(s0)
8040cc40:	00812403          	lw	s0,8(sp)
8040cc44:	00c12083          	lw	ra,12(sp)
8040cc48:	0007a583          	lw	a1,0(a5)
8040cc4c:	00008517          	auipc	a0,0x8
8040cc50:	35850513          	addi	a0,a0,856 # 80414fa4 <CSWTCH.69+0xc24>
8040cc54:	01010113          	addi	sp,sp,16
8040cc58:	da4f306f          	j	804001fc <cprintf>

8040cc5c <wakeup_proc>:
8040cc5c:	00052703          	lw	a4,0(a0)
8040cc60:	ff010113          	addi	sp,sp,-16
8040cc64:	00112623          	sw	ra,12(sp)
8040cc68:	00812423          	sw	s0,8(sp)
8040cc6c:	00912223          	sw	s1,4(sp)
8040cc70:	00300793          	li	a5,3
8040cc74:	0cf70263          	beq	a4,a5,8040cd38 <wakeup_proc+0xdc>
8040cc78:	00050413          	mv	s0,a0
8040cc7c:	100027f3          	csrr	a5,sstatus
8040cc80:	0027f793          	andi	a5,a5,2
8040cc84:	00000493          	li	s1,0
8040cc88:	0a079063          	bnez	a5,8040cd28 <wakeup_proc+0xcc>
8040cc8c:	00200793          	li	a5,2
8040cc90:	06f70e63          	beq	a4,a5,8040cd0c <wakeup_proc+0xb0>
8040cc94:	00090717          	auipc	a4,0x90
8040cc98:	b1870713          	addi	a4,a4,-1256 # 8049c7ac <current>
8040cc9c:	00072703          	lw	a4,0(a4)
8040cca0:	0a042423          	sw	zero,168(s0)
8040cca4:	00f42023          	sw	a5,0(s0)
8040cca8:	02870c63          	beq	a4,s0,8040cce0 <wakeup_proc+0x84>
8040ccac:	00090797          	auipc	a5,0x90
8040ccb0:	b0478793          	addi	a5,a5,-1276 # 8049c7b0 <idleproc>
8040ccb4:	0007a783          	lw	a5,0(a5)
8040ccb8:	02f40463          	beq	s0,a5,8040cce0 <wakeup_proc+0x84>
8040ccbc:	00090797          	auipc	a5,0x90
8040ccc0:	b0478793          	addi	a5,a5,-1276 # 8049c7c0 <sched_class>
8040ccc4:	0007a783          	lw	a5,0(a5)
8040ccc8:	00090717          	auipc	a4,0x90
8040cccc:	af470713          	addi	a4,a4,-1292 # 8049c7bc <rq>
8040ccd0:	00072503          	lw	a0,0(a4)
8040ccd4:	0087a783          	lw	a5,8(a5)
8040ccd8:	00040593          	mv	a1,s0
8040ccdc:	000780e7          	jalr	a5
8040cce0:	00049c63          	bnez	s1,8040ccf8 <wakeup_proc+0x9c>
8040cce4:	00c12083          	lw	ra,12(sp)
8040cce8:	00812403          	lw	s0,8(sp)
8040ccec:	00412483          	lw	s1,4(sp)
8040ccf0:	01010113          	addi	sp,sp,16
8040ccf4:	00008067          	ret
8040ccf8:	00812403          	lw	s0,8(sp)
8040ccfc:	00c12083          	lw	ra,12(sp)
8040cd00:	00412483          	lw	s1,4(sp)
8040cd04:	01010113          	addi	sp,sp,16
8040cd08:	f0df306f          	j	80400c14 <intr_enable>
8040cd0c:	00008617          	auipc	a2,0x8
8040cd10:	2e060613          	addi	a2,a2,736 # 80414fec <CSWTCH.69+0xc6c>
8040cd14:	04800593          	li	a1,72
8040cd18:	00008517          	auipc	a0,0x8
8040cd1c:	2bc50513          	addi	a0,a0,700 # 80414fd4 <CSWTCH.69+0xc54>
8040cd20:	989f30ef          	jal	ra,804006a8 <__warn>
8040cd24:	fbdff06f          	j	8040cce0 <wakeup_proc+0x84>
8040cd28:	ef5f30ef          	jal	ra,80400c1c <intr_disable>
8040cd2c:	00042703          	lw	a4,0(s0)
8040cd30:	00100493          	li	s1,1
8040cd34:	f59ff06f          	j	8040cc8c <wakeup_proc+0x30>
8040cd38:	00008697          	auipc	a3,0x8
8040cd3c:	28068693          	addi	a3,a3,640 # 80414fb8 <CSWTCH.69+0xc38>
8040cd40:	00006617          	auipc	a2,0x6
8040cd44:	18860613          	addi	a2,a2,392 # 80412ec8 <commands+0x1bc>
8040cd48:	03c00593          	li	a1,60
8040cd4c:	00008517          	auipc	a0,0x8
8040cd50:	28850513          	addi	a0,a0,648 # 80414fd4 <CSWTCH.69+0xc54>
8040cd54:	8d1f30ef          	jal	ra,80400624 <__panic>

8040cd58 <schedule>:
8040cd58:	fe010113          	addi	sp,sp,-32
8040cd5c:	00112e23          	sw	ra,28(sp)
8040cd60:	00812c23          	sw	s0,24(sp)
8040cd64:	00912a23          	sw	s1,20(sp)
8040cd68:	01212823          	sw	s2,16(sp)
8040cd6c:	01312623          	sw	s3,12(sp)
8040cd70:	01412423          	sw	s4,8(sp)
8040cd74:	100027f3          	csrr	a5,sstatus
8040cd78:	0027f793          	andi	a5,a5,2
8040cd7c:	00000a13          	li	s4,0
8040cd80:	0e079e63          	bnez	a5,8040ce7c <schedule+0x124>
8040cd84:	00090497          	auipc	s1,0x90
8040cd88:	a2848493          	addi	s1,s1,-1496 # 8049c7ac <current>
8040cd8c:	0004a583          	lw	a1,0(s1)
8040cd90:	00090997          	auipc	s3,0x90
8040cd94:	a3098993          	addi	s3,s3,-1488 # 8049c7c0 <sched_class>
8040cd98:	00090917          	auipc	s2,0x90
8040cd9c:	a2490913          	addi	s2,s2,-1500 # 8049c7bc <rq>
8040cda0:	0005a683          	lw	a3,0(a1)
8040cda4:	0005a823          	sw	zero,16(a1)
8040cda8:	00200713          	li	a4,2
8040cdac:	0009a783          	lw	a5,0(s3)
8040cdb0:	00092503          	lw	a0,0(s2)
8040cdb4:	06e68463          	beq	a3,a4,8040ce1c <schedule+0xc4>
8040cdb8:	0107a783          	lw	a5,16(a5)
8040cdbc:	000780e7          	jalr	a5
8040cdc0:	00050413          	mv	s0,a0
8040cdc4:	08050463          	beqz	a0,8040ce4c <schedule+0xf4>
8040cdc8:	0009a783          	lw	a5,0(s3)
8040cdcc:	00092503          	lw	a0,0(s2)
8040cdd0:	00040593          	mv	a1,s0
8040cdd4:	00c7a783          	lw	a5,12(a5)
8040cdd8:	000780e7          	jalr	a5
8040cddc:	00842783          	lw	a5,8(s0)
8040cde0:	0004a703          	lw	a4,0(s1)
8040cde4:	00178793          	addi	a5,a5,1
8040cde8:	00f42423          	sw	a5,8(s0)
8040cdec:	00870663          	beq	a4,s0,8040cdf8 <schedule+0xa0>
8040cdf0:	00040513          	mv	a0,s0
8040cdf4:	efcfa0ef          	jal	ra,804074f0 <proc_run>
8040cdf8:	060a1263          	bnez	s4,8040ce5c <schedule+0x104>
8040cdfc:	01c12083          	lw	ra,28(sp)
8040ce00:	01812403          	lw	s0,24(sp)
8040ce04:	01412483          	lw	s1,20(sp)
8040ce08:	01012903          	lw	s2,16(sp)
8040ce0c:	00c12983          	lw	s3,12(sp)
8040ce10:	00812a03          	lw	s4,8(sp)
8040ce14:	02010113          	addi	sp,sp,32
8040ce18:	00008067          	ret
8040ce1c:	00090717          	auipc	a4,0x90
8040ce20:	99470713          	addi	a4,a4,-1644 # 8049c7b0 <idleproc>
8040ce24:	00072703          	lw	a4,0(a4)
8040ce28:	f8e588e3          	beq	a1,a4,8040cdb8 <schedule+0x60>
8040ce2c:	0087a783          	lw	a5,8(a5)
8040ce30:	000780e7          	jalr	a5
8040ce34:	0009a783          	lw	a5,0(s3)
8040ce38:	00092503          	lw	a0,0(s2)
8040ce3c:	0107a783          	lw	a5,16(a5)
8040ce40:	000780e7          	jalr	a5
8040ce44:	00050413          	mv	s0,a0
8040ce48:	f80510e3          	bnez	a0,8040cdc8 <schedule+0x70>
8040ce4c:	00090797          	auipc	a5,0x90
8040ce50:	96478793          	addi	a5,a5,-1692 # 8049c7b0 <idleproc>
8040ce54:	0007a403          	lw	s0,0(a5)
8040ce58:	f85ff06f          	j	8040cddc <schedule+0x84>
8040ce5c:	01812403          	lw	s0,24(sp)
8040ce60:	01c12083          	lw	ra,28(sp)
8040ce64:	01412483          	lw	s1,20(sp)
8040ce68:	01012903          	lw	s2,16(sp)
8040ce6c:	00c12983          	lw	s3,12(sp)
8040ce70:	00812a03          	lw	s4,8(sp)
8040ce74:	02010113          	addi	sp,sp,32
8040ce78:	d9df306f          	j	80400c14 <intr_enable>
8040ce7c:	da1f30ef          	jal	ra,80400c1c <intr_disable>
8040ce80:	00100a13          	li	s4,1
8040ce84:	f01ff06f          	j	8040cd84 <schedule+0x2c>

8040ce88 <add_timer>:
8040ce88:	fe010113          	addi	sp,sp,-32
8040ce8c:	00112e23          	sw	ra,28(sp)
8040ce90:	100027f3          	csrr	a5,sstatus
8040ce94:	0027f793          	andi	a5,a5,2
8040ce98:	00000813          	li	a6,0
8040ce9c:	0a079263          	bnez	a5,8040cf40 <add_timer+0xb8>
8040cea0:	00052703          	lw	a4,0(a0)
8040cea4:	0a070863          	beqz	a4,8040cf54 <add_timer+0xcc>
8040cea8:	00452783          	lw	a5,4(a0)
8040ceac:	0a078463          	beqz	a5,8040cf54 <add_timer+0xcc>
8040ceb0:	00c52783          	lw	a5,12(a0)
8040ceb4:	00850593          	addi	a1,a0,8
8040ceb8:	0af59e63          	bne	a1,a5,8040cf74 <add_timer+0xec>
8040cebc:	00090617          	auipc	a2,0x90
8040cec0:	90860613          	addi	a2,a2,-1784 # 8049c7c4 <timer_list>
8040cec4:	00462783          	lw	a5,4(a2)
8040cec8:	00c79c63          	bne	a5,a2,8040cee0 <add_timer+0x58>
8040cecc:	0480006f          	j	8040cf14 <add_timer+0x8c>
8040ced0:	0047a783          	lw	a5,4(a5)
8040ced4:	40d70733          	sub	a4,a4,a3
8040ced8:	00e52023          	sw	a4,0(a0)
8040cedc:	02c78c63          	beq	a5,a2,8040cf14 <add_timer+0x8c>
8040cee0:	ff87a683          	lw	a3,-8(a5)
8040cee4:	fed776e3          	bgeu	a4,a3,8040ced0 <add_timer+0x48>
8040cee8:	40e68733          	sub	a4,a3,a4
8040ceec:	fee7ac23          	sw	a4,-8(a5)
8040cef0:	0007a703          	lw	a4,0(a5)
8040cef4:	00b7a023          	sw	a1,0(a5)
8040cef8:	00b72223          	sw	a1,4(a4)
8040cefc:	00f52623          	sw	a5,12(a0)
8040cf00:	00e52423          	sw	a4,8(a0)
8040cf04:	02080863          	beqz	a6,8040cf34 <add_timer+0xac>
8040cf08:	01c12083          	lw	ra,28(sp)
8040cf0c:	02010113          	addi	sp,sp,32
8040cf10:	d05f306f          	j	80400c14 <intr_enable>
8040cf14:	00090797          	auipc	a5,0x90
8040cf18:	8b078793          	addi	a5,a5,-1872 # 8049c7c4 <timer_list>
8040cf1c:	0007a703          	lw	a4,0(a5)
8040cf20:	00b7a023          	sw	a1,0(a5)
8040cf24:	00b72223          	sw	a1,4(a4)
8040cf28:	00f52623          	sw	a5,12(a0)
8040cf2c:	00e52423          	sw	a4,8(a0)
8040cf30:	fc081ce3          	bnez	a6,8040cf08 <add_timer+0x80>
8040cf34:	01c12083          	lw	ra,28(sp)
8040cf38:	02010113          	addi	sp,sp,32
8040cf3c:	00008067          	ret
8040cf40:	00a12623          	sw	a0,12(sp)
8040cf44:	cd9f30ef          	jal	ra,80400c1c <intr_disable>
8040cf48:	00100813          	li	a6,1
8040cf4c:	00c12503          	lw	a0,12(sp)
8040cf50:	f51ff06f          	j	8040cea0 <add_timer+0x18>
8040cf54:	00008697          	auipc	a3,0x8
8040cf58:	fa868693          	addi	a3,a3,-88 # 80414efc <CSWTCH.69+0xb7c>
8040cf5c:	00006617          	auipc	a2,0x6
8040cf60:	f6c60613          	addi	a2,a2,-148 # 80412ec8 <commands+0x1bc>
8040cf64:	06b00593          	li	a1,107
8040cf68:	00008517          	auipc	a0,0x8
8040cf6c:	06c50513          	addi	a0,a0,108 # 80414fd4 <CSWTCH.69+0xc54>
8040cf70:	eb4f30ef          	jal	ra,80400624 <__panic>
8040cf74:	00008697          	auipc	a3,0x8
8040cf78:	fb468693          	addi	a3,a3,-76 # 80414f28 <CSWTCH.69+0xba8>
8040cf7c:	00006617          	auipc	a2,0x6
8040cf80:	f4c60613          	addi	a2,a2,-180 # 80412ec8 <commands+0x1bc>
8040cf84:	06c00593          	li	a1,108
8040cf88:	00008517          	auipc	a0,0x8
8040cf8c:	04c50513          	addi	a0,a0,76 # 80414fd4 <CSWTCH.69+0xc54>
8040cf90:	e94f30ef          	jal	ra,80400624 <__panic>

8040cf94 <del_timer>:
8040cf94:	fe010113          	addi	sp,sp,-32
8040cf98:	00112e23          	sw	ra,28(sp)
8040cf9c:	00812c23          	sw	s0,24(sp)
8040cfa0:	100027f3          	csrr	a5,sstatus
8040cfa4:	0027f793          	andi	a5,a5,2
8040cfa8:	00850413          	addi	s0,a0,8
8040cfac:	06079c63          	bnez	a5,8040d024 <del_timer+0x90>
8040cfb0:	00c52783          	lw	a5,12(a0)
8040cfb4:	06f40063          	beq	s0,a5,8040d014 <del_timer+0x80>
8040cfb8:	00052683          	lw	a3,0(a0)
8040cfbc:	00852703          	lw	a4,8(a0)
8040cfc0:	04068263          	beqz	a3,8040d004 <del_timer+0x70>
8040cfc4:	00090617          	auipc	a2,0x90
8040cfc8:	80060613          	addi	a2,a2,-2048 # 8049c7c4 <timer_list>
8040cfcc:	00000593          	li	a1,0
8040cfd0:	02c78a63          	beq	a5,a2,8040d004 <del_timer+0x70>
8040cfd4:	ff87a603          	lw	a2,-8(a5)
8040cfd8:	00d606b3          	add	a3,a2,a3
8040cfdc:	fed7ac23          	sw	a3,-8(a5)
8040cfe0:	00f72223          	sw	a5,4(a4)
8040cfe4:	00e7a023          	sw	a4,0(a5)
8040cfe8:	00852623          	sw	s0,12(a0)
8040cfec:	00852423          	sw	s0,8(a0)
8040cff0:	02058263          	beqz	a1,8040d014 <del_timer+0x80>
8040cff4:	01812403          	lw	s0,24(sp)
8040cff8:	01c12083          	lw	ra,28(sp)
8040cffc:	02010113          	addi	sp,sp,32
8040d000:	c15f306f          	j	80400c14 <intr_enable>
8040d004:	00f72223          	sw	a5,4(a4)
8040d008:	00e7a023          	sw	a4,0(a5)
8040d00c:	00852623          	sw	s0,12(a0)
8040d010:	00852423          	sw	s0,8(a0)
8040d014:	01c12083          	lw	ra,28(sp)
8040d018:	01812403          	lw	s0,24(sp)
8040d01c:	02010113          	addi	sp,sp,32
8040d020:	00008067          	ret
8040d024:	00a12623          	sw	a0,12(sp)
8040d028:	bf5f30ef          	jal	ra,80400c1c <intr_disable>
8040d02c:	00c12503          	lw	a0,12(sp)
8040d030:	00c52783          	lw	a5,12(a0)
8040d034:	fc8780e3          	beq	a5,s0,8040cff4 <del_timer+0x60>
8040d038:	00052683          	lw	a3,0(a0)
8040d03c:	00852703          	lw	a4,8(a0)
8040d040:	00068a63          	beqz	a3,8040d054 <del_timer+0xc0>
8040d044:	0008f617          	auipc	a2,0x8f
8040d048:	78060613          	addi	a2,a2,1920 # 8049c7c4 <timer_list>
8040d04c:	00100593          	li	a1,1
8040d050:	f8c792e3          	bne	a5,a2,8040cfd4 <del_timer+0x40>
8040d054:	00f72223          	sw	a5,4(a4)
8040d058:	00e7a023          	sw	a4,0(a5)
8040d05c:	00852623          	sw	s0,12(a0)
8040d060:	00852423          	sw	s0,8(a0)
8040d064:	f91ff06f          	j	8040cff4 <del_timer+0x60>

8040d068 <run_timer_list>:
8040d068:	fe010113          	addi	sp,sp,-32
8040d06c:	00112e23          	sw	ra,28(sp)
8040d070:	00812c23          	sw	s0,24(sp)
8040d074:	00912a23          	sw	s1,20(sp)
8040d078:	01212823          	sw	s2,16(sp)
8040d07c:	01312623          	sw	s3,12(sp)
8040d080:	01412423          	sw	s4,8(sp)
8040d084:	01512223          	sw	s5,4(sp)
8040d088:	01612023          	sw	s6,0(sp)
8040d08c:	100027f3          	csrr	a5,sstatus
8040d090:	0027f793          	andi	a5,a5,2
8040d094:	00000b13          	li	s6,0
8040d098:	12079c63          	bnez	a5,8040d1d0 <run_timer_list+0x168>
8040d09c:	0008f997          	auipc	s3,0x8f
8040d0a0:	72898993          	addi	s3,s3,1832 # 8049c7c4 <timer_list>
8040d0a4:	0049a403          	lw	s0,4(s3)
8040d0a8:	09340663          	beq	s0,s3,8040d134 <run_timer_list+0xcc>
8040d0ac:	ff842783          	lw	a5,-8(s0)
8040d0b0:	ff840913          	addi	s2,s0,-8
8040d0b4:	14078463          	beqz	a5,8040d1fc <run_timer_list+0x194>
8040d0b8:	fff78793          	addi	a5,a5,-1
8040d0bc:	fef42c23          	sw	a5,-8(s0)
8040d0c0:	06079a63          	bnez	a5,8040d134 <run_timer_list+0xcc>
8040d0c4:	00008a97          	auipc	s5,0x8
8040d0c8:	ec0a8a93          	addi	s5,s5,-320 # 80414f84 <CSWTCH.69+0xc04>
8040d0cc:	00008a17          	auipc	s4,0x8
8040d0d0:	f08a0a13          	addi	s4,s4,-248 # 80414fd4 <CSWTCH.69+0xc54>
8040d0d4:	0280006f          	j	8040d0fc <run_timer_list+0x94>
8040d0d8:	1007d263          	bgez	a5,8040d1dc <run_timer_list+0x174>
8040d0dc:	00048513          	mv	a0,s1
8040d0e0:	b7dff0ef          	jal	ra,8040cc5c <wakeup_proc>
8040d0e4:	00090513          	mv	a0,s2
8040d0e8:	eadff0ef          	jal	ra,8040cf94 <del_timer>
8040d0ec:	05340463          	beq	s0,s3,8040d134 <run_timer_list+0xcc>
8040d0f0:	ff842783          	lw	a5,-8(s0)
8040d0f4:	ff840913          	addi	s2,s0,-8
8040d0f8:	02079e63          	bnez	a5,8040d134 <run_timer_list+0xcc>
8040d0fc:	00492483          	lw	s1,4(s2)
8040d100:	00442403          	lw	s0,4(s0)
8040d104:	0a84a783          	lw	a5,168(s1)
8040d108:	fc0798e3          	bnez	a5,8040d0d8 <run_timer_list+0x70>
8040d10c:	0044a683          	lw	a3,4(s1)
8040d110:	000a8613          	mv	a2,s5
8040d114:	0a200593          	li	a1,162
8040d118:	000a0513          	mv	a0,s4
8040d11c:	d8cf30ef          	jal	ra,804006a8 <__warn>
8040d120:	00048513          	mv	a0,s1
8040d124:	b39ff0ef          	jal	ra,8040cc5c <wakeup_proc>
8040d128:	00090513          	mv	a0,s2
8040d12c:	e69ff0ef          	jal	ra,8040cf94 <del_timer>
8040d130:	fd3410e3          	bne	s0,s3,8040d0f0 <run_timer_list+0x88>
8040d134:	0008f797          	auipc	a5,0x8f
8040d138:	67878793          	addi	a5,a5,1656 # 8049c7ac <current>
8040d13c:	0007a583          	lw	a1,0(a5)
8040d140:	0008f797          	auipc	a5,0x8f
8040d144:	67078793          	addi	a5,a5,1648 # 8049c7b0 <idleproc>
8040d148:	0007a783          	lw	a5,0(a5)
8040d14c:	06f58c63          	beq	a1,a5,8040d1c4 <run_timer_list+0x15c>
8040d150:	0008f797          	auipc	a5,0x8f
8040d154:	67078793          	addi	a5,a5,1648 # 8049c7c0 <sched_class>
8040d158:	0007a783          	lw	a5,0(a5)
8040d15c:	0008f717          	auipc	a4,0x8f
8040d160:	66070713          	addi	a4,a4,1632 # 8049c7bc <rq>
8040d164:	00072503          	lw	a0,0(a4)
8040d168:	0147a783          	lw	a5,20(a5)
8040d16c:	000780e7          	jalr	a5
8040d170:	020b1663          	bnez	s6,8040d19c <run_timer_list+0x134>
8040d174:	01c12083          	lw	ra,28(sp)
8040d178:	01812403          	lw	s0,24(sp)
8040d17c:	01412483          	lw	s1,20(sp)
8040d180:	01012903          	lw	s2,16(sp)
8040d184:	00c12983          	lw	s3,12(sp)
8040d188:	00812a03          	lw	s4,8(sp)
8040d18c:	00412a83          	lw	s5,4(sp)
8040d190:	00012b03          	lw	s6,0(sp)
8040d194:	02010113          	addi	sp,sp,32
8040d198:	00008067          	ret
8040d19c:	01812403          	lw	s0,24(sp)
8040d1a0:	01c12083          	lw	ra,28(sp)
8040d1a4:	01412483          	lw	s1,20(sp)
8040d1a8:	01012903          	lw	s2,16(sp)
8040d1ac:	00c12983          	lw	s3,12(sp)
8040d1b0:	00812a03          	lw	s4,8(sp)
8040d1b4:	00412a83          	lw	s5,4(sp)
8040d1b8:	00012b03          	lw	s6,0(sp)
8040d1bc:	02010113          	addi	sp,sp,32
8040d1c0:	a55f306f          	j	80400c14 <intr_enable>
8040d1c4:	00100793          	li	a5,1
8040d1c8:	00f5a823          	sw	a5,16(a1)
8040d1cc:	fa5ff06f          	j	8040d170 <run_timer_list+0x108>
8040d1d0:	a4df30ef          	jal	ra,80400c1c <intr_disable>
8040d1d4:	00100b13          	li	s6,1
8040d1d8:	ec5ff06f          	j	8040d09c <run_timer_list+0x34>
8040d1dc:	00008697          	auipc	a3,0x8
8040d1e0:	d8468693          	addi	a3,a3,-636 # 80414f60 <CSWTCH.69+0xbe0>
8040d1e4:	00006617          	auipc	a2,0x6
8040d1e8:	ce460613          	addi	a2,a2,-796 # 80412ec8 <commands+0x1bc>
8040d1ec:	09f00593          	li	a1,159
8040d1f0:	00008517          	auipc	a0,0x8
8040d1f4:	de450513          	addi	a0,a0,-540 # 80414fd4 <CSWTCH.69+0xc54>
8040d1f8:	c2cf30ef          	jal	ra,80400624 <__panic>
8040d1fc:	00008697          	auipc	a3,0x8
8040d200:	d5068693          	addi	a3,a3,-688 # 80414f4c <CSWTCH.69+0xbcc>
8040d204:	00006617          	auipc	a2,0x6
8040d208:	cc460613          	addi	a2,a2,-828 # 80412ec8 <commands+0x1bc>
8040d20c:	09900593          	li	a1,153
8040d210:	00008517          	auipc	a0,0x8
8040d214:	dc450513          	addi	a0,a0,-572 # 80414fd4 <CSWTCH.69+0xc54>
8040d218:	c0cf30ef          	jal	ra,80400624 <__panic>

8040d21c <sys_getpid>:
8040d21c:	0008f797          	auipc	a5,0x8f
8040d220:	59078793          	addi	a5,a5,1424 # 8049c7ac <current>
8040d224:	0007a783          	lw	a5,0(a5)
8040d228:	0047a503          	lw	a0,4(a5)
8040d22c:	00008067          	ret

8040d230 <sys_gettime>:
8040d230:	0008f797          	auipc	a5,0x8f
8040d234:	5bc78793          	addi	a5,a5,1468 # 8049c7ec <ticks>
8040d238:	0007a503          	lw	a0,0(a5)
8040d23c:	00008067          	ret

8040d240 <sys_lab6_set_priority>:
8040d240:	00052503          	lw	a0,0(a0)
8040d244:	ff010113          	addi	sp,sp,-16
8040d248:	00112623          	sw	ra,12(sp)
8040d24c:	db5fb0ef          	jal	ra,80409000 <lab6_set_priority>
8040d250:	00c12083          	lw	ra,12(sp)
8040d254:	00000513          	li	a0,0
8040d258:	01010113          	addi	sp,sp,16
8040d25c:	00008067          	ret

8040d260 <sys_dup>:
8040d260:	00452583          	lw	a1,4(a0)
8040d264:	00052503          	lw	a0,0(a0)
8040d268:	d3df906f          	j	80406fa4 <sysfile_dup>

8040d26c <sys_getdirentry>:
8040d26c:	00452583          	lw	a1,4(a0)
8040d270:	00052503          	lw	a0,0(a0)
8040d274:	bb5f906f          	j	80406e28 <sysfile_getdirentry>

8040d278 <sys_getcwd>:
8040d278:	00452583          	lw	a1,4(a0)
8040d27c:	00052503          	lw	a0,0(a0)
8040d280:	aa5f906f          	j	80406d24 <sysfile_getcwd>

8040d284 <sys_fsync>:
8040d284:	00052503          	lw	a0,0(a0)
8040d288:	a99f906f          	j	80406d20 <sysfile_fsync>

8040d28c <sys_fstat>:
8040d28c:	00452583          	lw	a1,4(a0)
8040d290:	00052503          	lw	a0,0(a0)
8040d294:	99df906f          	j	80406c30 <sysfile_fstat>

8040d298 <sys_seek>:
8040d298:	00852603          	lw	a2,8(a0)
8040d29c:	00452583          	lw	a1,4(a0)
8040d2a0:	00052503          	lw	a0,0(a0)
8040d2a4:	989f906f          	j	80406c2c <sysfile_seek>

8040d2a8 <sys_write>:
8040d2a8:	00852603          	lw	a2,8(a0)
8040d2ac:	00452583          	lw	a1,4(a0)
8040d2b0:	00052503          	lw	a0,0(a0)
8040d2b4:	fb4f906f          	j	80406a68 <sysfile_write>

8040d2b8 <sys_read>:
8040d2b8:	00852603          	lw	a2,8(a0)
8040d2bc:	00452583          	lw	a1,4(a0)
8040d2c0:	00052503          	lw	a0,0(a0)
8040d2c4:	ddcf906f          	j	804068a0 <sysfile_read>

8040d2c8 <sys_close>:
8040d2c8:	00052503          	lw	a0,0(a0)
8040d2cc:	dd0f906f          	j	8040689c <sysfile_close>

8040d2d0 <sys_open>:
8040d2d0:	00452583          	lw	a1,4(a0)
8040d2d4:	00052503          	lw	a0,0(a0)
8040d2d8:	d6cf906f          	j	80406844 <sysfile_open>

8040d2dc <sys_pgdir>:
8040d2dc:	ff010113          	addi	sp,sp,-16
8040d2e0:	00112623          	sw	ra,12(sp)
8040d2e4:	dd4f60ef          	jal	ra,804038b8 <print_pgdir>
8040d2e8:	00c12083          	lw	ra,12(sp)
8040d2ec:	00000513          	li	a0,0
8040d2f0:	01010113          	addi	sp,sp,16
8040d2f4:	00008067          	ret

8040d2f8 <sys_putc>:
8040d2f8:	00052503          	lw	a0,0(a0)
8040d2fc:	ff010113          	addi	sp,sp,-16
8040d300:	00112623          	sw	ra,12(sp)
8040d304:	f59f20ef          	jal	ra,8040025c <cputchar>
8040d308:	00c12083          	lw	ra,12(sp)
8040d30c:	00000513          	li	a0,0
8040d310:	01010113          	addi	sp,sp,16
8040d314:	00008067          	ret

8040d318 <sys_kill>:
8040d318:	00052503          	lw	a0,0(a0)
8040d31c:	a69fb06f          	j	80408d84 <do_kill>

8040d320 <sys_sleep>:
8040d320:	00052503          	lw	a0,0(a0)
8040d324:	d01fb06f          	j	80409024 <do_sleep>

8040d328 <sys_yield>:
8040d328:	9d1fb06f          	j	80408cf8 <do_yield>

8040d32c <sys_exec>:
8040d32c:	00852603          	lw	a2,8(a0)
8040d330:	00452583          	lw	a1,4(a0)
8040d334:	00052503          	lw	a0,0(a0)
8040d338:	f61fa06f          	j	80408298 <do_execve>

8040d33c <sys_wait>:
8040d33c:	00452583          	lw	a1,4(a0)
8040d340:	00052503          	lw	a0,0(a0)
8040d344:	9d1fb06f          	j	80408d14 <do_wait>

8040d348 <sys_fork>:
8040d348:	0008f797          	auipc	a5,0x8f
8040d34c:	46478793          	addi	a5,a5,1124 # 8049c7ac <current>
8040d350:	0007a783          	lw	a5,0(a5)
8040d354:	00000513          	li	a0,0
8040d358:	0547a603          	lw	a2,84(a5)
8040d35c:	00862583          	lw	a1,8(a2)
8040d360:	ab4fa06f          	j	80407614 <do_fork>

8040d364 <sys_exit>:
8040d364:	00052503          	lw	a0,0(a0)
8040d368:	915fa06f          	j	80407c7c <do_exit>

8040d36c <syscall>:
8040d36c:	fd010113          	addi	sp,sp,-48
8040d370:	02912223          	sw	s1,36(sp)
8040d374:	0008f497          	auipc	s1,0x8f
8040d378:	43848493          	addi	s1,s1,1080 # 8049c7ac <current>
8040d37c:	0004a703          	lw	a4,0(s1)
8040d380:	02812423          	sw	s0,40(sp)
8040d384:	03212023          	sw	s2,32(sp)
8040d388:	05472403          	lw	s0,84(a4)
8040d38c:	02112623          	sw	ra,44(sp)
8040d390:	0ff00793          	li	a5,255
8040d394:	02842903          	lw	s2,40(s0)
8040d398:	0727e463          	bltu	a5,s2,8040d400 <syscall+0x94>
8040d39c:	00291713          	slli	a4,s2,0x2
8040d3a0:	00008797          	auipc	a5,0x8
8040d3a4:	cac78793          	addi	a5,a5,-852 # 8041504c <syscalls>
8040d3a8:	00e787b3          	add	a5,a5,a4
8040d3ac:	0007a783          	lw	a5,0(a5)
8040d3b0:	04078863          	beqz	a5,8040d400 <syscall+0x94>
8040d3b4:	02c42503          	lw	a0,44(s0)
8040d3b8:	03042583          	lw	a1,48(s0)
8040d3bc:	03442603          	lw	a2,52(s0)
8040d3c0:	03842683          	lw	a3,56(s0)
8040d3c4:	03c42703          	lw	a4,60(s0)
8040d3c8:	00a12623          	sw	a0,12(sp)
8040d3cc:	00b12823          	sw	a1,16(sp)
8040d3d0:	00c12a23          	sw	a2,20(sp)
8040d3d4:	00d12c23          	sw	a3,24(sp)
8040d3d8:	00e12e23          	sw	a4,28(sp)
8040d3dc:	00c10513          	addi	a0,sp,12
8040d3e0:	000780e7          	jalr	a5
8040d3e4:	02a42423          	sw	a0,40(s0)
8040d3e8:	02c12083          	lw	ra,44(sp)
8040d3ec:	02812403          	lw	s0,40(sp)
8040d3f0:	02412483          	lw	s1,36(sp)
8040d3f4:	02012903          	lw	s2,32(sp)
8040d3f8:	03010113          	addi	sp,sp,48
8040d3fc:	00008067          	ret
8040d400:	00040513          	mv	a0,s0
8040d404:	c45f30ef          	jal	ra,80401048 <print_trapframe>
8040d408:	0004a783          	lw	a5,0(s1)
8040d40c:	00090693          	mv	a3,s2
8040d410:	00008617          	auipc	a2,0x8
8040d414:	bf860613          	addi	a2,a2,-1032 # 80415008 <CSWTCH.69+0xc88>
8040d418:	0047a703          	lw	a4,4(a5)
8040d41c:	0cd00593          	li	a1,205
8040d420:	06078793          	addi	a5,a5,96
8040d424:	00008517          	auipc	a0,0x8
8040d428:	c1050513          	addi	a0,a0,-1008 # 80415034 <CSWTCH.69+0xcb4>
8040d42c:	9f8f30ef          	jal	ra,80400624 <__panic>

8040d430 <swapfs_init>:
8040d430:	ff010113          	addi	sp,sp,-16
8040d434:	00100513          	li	a0,1
8040d438:	00112623          	sw	ra,12(sp)
8040d43c:	e3cf30ef          	jal	ra,80400a78 <ide_device_valid>
8040d440:	02050263          	beqz	a0,8040d464 <swapfs_init+0x34>
8040d444:	00100513          	li	a0,1
8040d448:	e64f30ef          	jal	ra,80400aac <ide_device_size>
8040d44c:	00c12083          	lw	ra,12(sp)
8040d450:	00355513          	srli	a0,a0,0x3
8040d454:	0008f797          	auipc	a5,0x8f
8040d458:	42a7a623          	sw	a0,1068(a5) # 8049c880 <max_swap_offset>
8040d45c:	01010113          	addi	sp,sp,16
8040d460:	00008067          	ret
8040d464:	00008617          	auipc	a2,0x8
8040d468:	fe860613          	addi	a2,a2,-24 # 8041544c <syscalls+0x400>
8040d46c:	00d00593          	li	a1,13
8040d470:	00008517          	auipc	a0,0x8
8040d474:	ff850513          	addi	a0,a0,-8 # 80415468 <syscalls+0x41c>
8040d478:	9acf30ef          	jal	ra,80400624 <__panic>

8040d47c <swapfs_read>:
8040d47c:	ff010113          	addi	sp,sp,-16
8040d480:	00112623          	sw	ra,12(sp)
8040d484:	00855793          	srli	a5,a0,0x8
8040d488:	06078e63          	beqz	a5,8040d504 <swapfs_read+0x88>
8040d48c:	0008f717          	auipc	a4,0x8f
8040d490:	3f470713          	addi	a4,a4,1012 # 8049c880 <max_swap_offset>
8040d494:	00072703          	lw	a4,0(a4)
8040d498:	06e7f663          	bgeu	a5,a4,8040d504 <swapfs_read+0x88>
8040d49c:	0008f717          	auipc	a4,0x8f
8040d4a0:	36c70713          	addi	a4,a4,876 # 8049c808 <pages>
8040d4a4:	00072603          	lw	a2,0(a4)
8040d4a8:	00009717          	auipc	a4,0x9
8040d4ac:	26070713          	addi	a4,a4,608 # 80416708 <nbase>
8040d4b0:	40c58633          	sub	a2,a1,a2
8040d4b4:	00072583          	lw	a1,0(a4)
8040d4b8:	40565613          	srai	a2,a2,0x5
8040d4bc:	0008f717          	auipc	a4,0x8f
8040d4c0:	2dc70713          	addi	a4,a4,732 # 8049c798 <npage>
8040d4c4:	00b60633          	add	a2,a2,a1
8040d4c8:	00072683          	lw	a3,0(a4)
8040d4cc:	00c61713          	slli	a4,a2,0xc
8040d4d0:	00c75713          	srli	a4,a4,0xc
8040d4d4:	00379593          	slli	a1,a5,0x3
8040d4d8:	00c61613          	slli	a2,a2,0xc
8040d4dc:	04d77263          	bgeu	a4,a3,8040d520 <swapfs_read+0xa4>
8040d4e0:	0008f797          	auipc	a5,0x8f
8040d4e4:	32078793          	addi	a5,a5,800 # 8049c800 <va_pa_offset>
8040d4e8:	0007a783          	lw	a5,0(a5)
8040d4ec:	00c12083          	lw	ra,12(sp)
8040d4f0:	00800693          	li	a3,8
8040d4f4:	00f60633          	add	a2,a2,a5
8040d4f8:	00100513          	li	a0,1
8040d4fc:	01010113          	addi	sp,sp,16
8040d500:	de4f306f          	j	80400ae4 <ide_read_secs>
8040d504:	00050693          	mv	a3,a0
8040d508:	00008617          	auipc	a2,0x8
8040d50c:	f7860613          	addi	a2,a2,-136 # 80415480 <syscalls+0x434>
8040d510:	01400593          	li	a1,20
8040d514:	00008517          	auipc	a0,0x8
8040d518:	f5450513          	addi	a0,a0,-172 # 80415468 <syscalls+0x41c>
8040d51c:	908f30ef          	jal	ra,80400624 <__panic>
8040d520:	00060693          	mv	a3,a2
8040d524:	06e00593          	li	a1,110
8040d528:	00006617          	auipc	a2,0x6
8040d52c:	50460613          	addi	a2,a2,1284 # 80413a2c <default_pmm_manager+0x30>
8040d530:	00006517          	auipc	a0,0x6
8040d534:	52050513          	addi	a0,a0,1312 # 80413a50 <default_pmm_manager+0x54>
8040d538:	8ecf30ef          	jal	ra,80400624 <__panic>

8040d53c <swapfs_write>:
8040d53c:	ff010113          	addi	sp,sp,-16
8040d540:	00112623          	sw	ra,12(sp)
8040d544:	00855793          	srli	a5,a0,0x8
8040d548:	06078e63          	beqz	a5,8040d5c4 <swapfs_write+0x88>
8040d54c:	0008f717          	auipc	a4,0x8f
8040d550:	33470713          	addi	a4,a4,820 # 8049c880 <max_swap_offset>
8040d554:	00072703          	lw	a4,0(a4)
8040d558:	06e7f663          	bgeu	a5,a4,8040d5c4 <swapfs_write+0x88>
8040d55c:	0008f717          	auipc	a4,0x8f
8040d560:	2ac70713          	addi	a4,a4,684 # 8049c808 <pages>
8040d564:	00072603          	lw	a2,0(a4)
8040d568:	00009717          	auipc	a4,0x9
8040d56c:	1a070713          	addi	a4,a4,416 # 80416708 <nbase>
8040d570:	40c58633          	sub	a2,a1,a2
8040d574:	00072583          	lw	a1,0(a4)
8040d578:	40565613          	srai	a2,a2,0x5
8040d57c:	0008f717          	auipc	a4,0x8f
8040d580:	21c70713          	addi	a4,a4,540 # 8049c798 <npage>
8040d584:	00b60633          	add	a2,a2,a1
8040d588:	00072683          	lw	a3,0(a4)
8040d58c:	00c61713          	slli	a4,a2,0xc
8040d590:	00c75713          	srli	a4,a4,0xc
8040d594:	00379593          	slli	a1,a5,0x3
8040d598:	00c61613          	slli	a2,a2,0xc
8040d59c:	04d77263          	bgeu	a4,a3,8040d5e0 <swapfs_write+0xa4>
8040d5a0:	0008f797          	auipc	a5,0x8f
8040d5a4:	26078793          	addi	a5,a5,608 # 8049c800 <va_pa_offset>
8040d5a8:	0007a783          	lw	a5,0(a5)
8040d5ac:	00c12083          	lw	ra,12(sp)
8040d5b0:	00800693          	li	a3,8
8040d5b4:	00f60633          	add	a2,a2,a5
8040d5b8:	00100513          	li	a0,1
8040d5bc:	01010113          	addi	sp,sp,16
8040d5c0:	dbcf306f          	j	80400b7c <ide_write_secs>
8040d5c4:	00050693          	mv	a3,a0
8040d5c8:	00008617          	auipc	a2,0x8
8040d5cc:	eb860613          	addi	a2,a2,-328 # 80415480 <syscalls+0x434>
8040d5d0:	01900593          	li	a1,25
8040d5d4:	00008517          	auipc	a0,0x8
8040d5d8:	e9450513          	addi	a0,a0,-364 # 80415468 <syscalls+0x41c>
8040d5dc:	848f30ef          	jal	ra,80400624 <__panic>
8040d5e0:	00060693          	mv	a3,a2
8040d5e4:	06e00593          	li	a1,110
8040d5e8:	00006617          	auipc	a2,0x6
8040d5ec:	44460613          	addi	a2,a2,1092 # 80413a2c <default_pmm_manager+0x30>
8040d5f0:	00006517          	auipc	a0,0x6
8040d5f4:	46050513          	addi	a0,a0,1120 # 80413a50 <default_pmm_manager+0x54>
8040d5f8:	82cf30ef          	jal	ra,80400624 <__panic>

8040d5fc <__alloc_inode>:
8040d5fc:	ff010113          	addi	sp,sp,-16
8040d600:	00812423          	sw	s0,8(sp)
8040d604:	00050413          	mv	s0,a0
8040d608:	04000513          	li	a0,64
8040d60c:	00112623          	sw	ra,12(sp)
8040d610:	bb0f50ef          	jal	ra,804029c0 <kmalloc>
8040d614:	00050463          	beqz	a0,8040d61c <__alloc_inode+0x20>
8040d618:	02852623          	sw	s0,44(a0)
8040d61c:	00c12083          	lw	ra,12(sp)
8040d620:	00812403          	lw	s0,8(sp)
8040d624:	01010113          	addi	sp,sp,16
8040d628:	00008067          	ret

8040d62c <inode_init>:
8040d62c:	00100793          	li	a5,1
8040d630:	02052a23          	sw	zero,52(a0)
8040d634:	02b52e23          	sw	a1,60(a0)
8040d638:	02c52c23          	sw	a2,56(a0)
8040d63c:	02f52823          	sw	a5,48(a0)
8040d640:	00008067          	ret

8040d644 <inode_kill>:
8040d644:	03052703          	lw	a4,48(a0)
8040d648:	ff010113          	addi	sp,sp,-16
8040d64c:	00112623          	sw	ra,12(sp)
8040d650:	00071c63          	bnez	a4,8040d668 <inode_kill+0x24>
8040d654:	03452783          	lw	a5,52(a0)
8040d658:	02079863          	bnez	a5,8040d688 <inode_kill+0x44>
8040d65c:	00c12083          	lw	ra,12(sp)
8040d660:	01010113          	addi	sp,sp,16
8040d664:	c80f506f          	j	80402ae4 <kfree>
8040d668:	00008697          	auipc	a3,0x8
8040d66c:	ef068693          	addi	a3,a3,-272 # 80415558 <syscalls+0x50c>
8040d670:	00006617          	auipc	a2,0x6
8040d674:	85860613          	addi	a2,a2,-1960 # 80412ec8 <commands+0x1bc>
8040d678:	02900593          	li	a1,41
8040d67c:	00008517          	auipc	a0,0x8
8040d680:	ef850513          	addi	a0,a0,-264 # 80415574 <syscalls+0x528>
8040d684:	fa1f20ef          	jal	ra,80400624 <__panic>
8040d688:	00008697          	auipc	a3,0x8
8040d68c:	f0068693          	addi	a3,a3,-256 # 80415588 <syscalls+0x53c>
8040d690:	00006617          	auipc	a2,0x6
8040d694:	83860613          	addi	a2,a2,-1992 # 80412ec8 <commands+0x1bc>
8040d698:	02a00593          	li	a1,42
8040d69c:	00008517          	auipc	a0,0x8
8040d6a0:	ed850513          	addi	a0,a0,-296 # 80415574 <syscalls+0x528>
8040d6a4:	f81f20ef          	jal	ra,80400624 <__panic>

8040d6a8 <inode_ref_inc>:
8040d6a8:	03052783          	lw	a5,48(a0)
8040d6ac:	00178793          	addi	a5,a5,1
8040d6b0:	02f52823          	sw	a5,48(a0)
8040d6b4:	00078513          	mv	a0,a5
8040d6b8:	00008067          	ret

8040d6bc <inode_open_inc>:
8040d6bc:	03452783          	lw	a5,52(a0)
8040d6c0:	00178793          	addi	a5,a5,1
8040d6c4:	02f52a23          	sw	a5,52(a0)
8040d6c8:	00078513          	mv	a0,a5
8040d6cc:	00008067          	ret

8040d6d0 <inode_check>:
8040d6d0:	ff010113          	addi	sp,sp,-16
8040d6d4:	00112623          	sw	ra,12(sp)
8040d6d8:	04050263          	beqz	a0,8040d71c <inode_check+0x4c>
8040d6dc:	03c52783          	lw	a5,60(a0)
8040d6e0:	02078e63          	beqz	a5,8040d71c <inode_check+0x4c>
8040d6e4:	0007a703          	lw	a4,0(a5)
8040d6e8:	8c4ba7b7          	lui	a5,0x8c4ba
8040d6ec:	47678793          	addi	a5,a5,1142 # 8c4ba476 <end+0xc01dbba>
8040d6f0:	08f71663          	bne	a4,a5,8040d77c <inode_check+0xac>
8040d6f4:	03052703          	lw	a4,48(a0)
8040d6f8:	03452783          	lw	a5,52(a0)
8040d6fc:	06f74063          	blt	a4,a5,8040d75c <inode_check+0x8c>
8040d700:	0407ce63          	bltz	a5,8040d75c <inode_check+0x8c>
8040d704:	000106b7          	lui	a3,0x10
8040d708:	02d75a63          	bge	a4,a3,8040d73c <inode_check+0x6c>
8040d70c:	02d7d863          	bge	a5,a3,8040d73c <inode_check+0x6c>
8040d710:	00c12083          	lw	ra,12(sp)
8040d714:	01010113          	addi	sp,sp,16
8040d718:	00008067          	ret
8040d71c:	00008697          	auipc	a3,0x8
8040d720:	d8468693          	addi	a3,a3,-636 # 804154a0 <syscalls+0x454>
8040d724:	00005617          	auipc	a2,0x5
8040d728:	7a460613          	addi	a2,a2,1956 # 80412ec8 <commands+0x1bc>
8040d72c:	06e00593          	li	a1,110
8040d730:	00008517          	auipc	a0,0x8
8040d734:	e4450513          	addi	a0,a0,-444 # 80415574 <syscalls+0x528>
8040d738:	eedf20ef          	jal	ra,80400624 <__panic>
8040d73c:	00008697          	auipc	a3,0x8
8040d740:	de068693          	addi	a3,a3,-544 # 8041551c <syscalls+0x4d0>
8040d744:	00005617          	auipc	a2,0x5
8040d748:	78460613          	addi	a2,a2,1924 # 80412ec8 <commands+0x1bc>
8040d74c:	07200593          	li	a1,114
8040d750:	00008517          	auipc	a0,0x8
8040d754:	e2450513          	addi	a0,a0,-476 # 80415574 <syscalls+0x528>
8040d758:	ecdf20ef          	jal	ra,80400624 <__panic>
8040d75c:	00008697          	auipc	a3,0x8
8040d760:	d9468693          	addi	a3,a3,-620 # 804154f0 <syscalls+0x4a4>
8040d764:	00005617          	auipc	a2,0x5
8040d768:	76460613          	addi	a2,a2,1892 # 80412ec8 <commands+0x1bc>
8040d76c:	07100593          	li	a1,113
8040d770:	00008517          	auipc	a0,0x8
8040d774:	e0450513          	addi	a0,a0,-508 # 80415574 <syscalls+0x528>
8040d778:	eadf20ef          	jal	ra,80400624 <__panic>
8040d77c:	00008697          	auipc	a3,0x8
8040d780:	d4c68693          	addi	a3,a3,-692 # 804154c8 <syscalls+0x47c>
8040d784:	00005617          	auipc	a2,0x5
8040d788:	74460613          	addi	a2,a2,1860 # 80412ec8 <commands+0x1bc>
8040d78c:	06f00593          	li	a1,111
8040d790:	00008517          	auipc	a0,0x8
8040d794:	de450513          	addi	a0,a0,-540 # 80415574 <syscalls+0x528>
8040d798:	e8df20ef          	jal	ra,80400624 <__panic>

8040d79c <inode_ref_dec>:
8040d79c:	ff010113          	addi	sp,sp,-16
8040d7a0:	00812423          	sw	s0,8(sp)
8040d7a4:	03052403          	lw	s0,48(a0)
8040d7a8:	00112623          	sw	ra,12(sp)
8040d7ac:	00912223          	sw	s1,4(sp)
8040d7b0:	01212023          	sw	s2,0(sp)
8040d7b4:	0a805663          	blez	s0,8040d860 <inode_ref_dec+0xc4>
8040d7b8:	fff40413          	addi	s0,s0,-1
8040d7bc:	02852823          	sw	s0,48(a0)
8040d7c0:	00050493          	mv	s1,a0
8040d7c4:	02041a63          	bnez	s0,8040d7f8 <inode_ref_dec+0x5c>
8040d7c8:	03c52783          	lw	a5,60(a0)
8040d7cc:	06078a63          	beqz	a5,8040d840 <inode_ref_dec+0xa4>
8040d7d0:	0247a903          	lw	s2,36(a5)
8040d7d4:	06090663          	beqz	s2,8040d840 <inode_ref_dec+0xa4>
8040d7d8:	00008597          	auipc	a1,0x8
8040d7dc:	ecc58593          	addi	a1,a1,-308 # 804156a4 <syscalls+0x658>
8040d7e0:	ef1ff0ef          	jal	ra,8040d6d0 <inode_check>
8040d7e4:	00048513          	mv	a0,s1
8040d7e8:	000900e7          	jalr	s2
8040d7ec:	00050663          	beqz	a0,8040d7f8 <inode_ref_dec+0x5c>
8040d7f0:	ff100793          	li	a5,-15
8040d7f4:	02f51063          	bne	a0,a5,8040d814 <inode_ref_dec+0x78>
8040d7f8:	00040513          	mv	a0,s0
8040d7fc:	00c12083          	lw	ra,12(sp)
8040d800:	00812403          	lw	s0,8(sp)
8040d804:	00412483          	lw	s1,4(sp)
8040d808:	00012903          	lw	s2,0(sp)
8040d80c:	01010113          	addi	sp,sp,16
8040d810:	00008067          	ret
8040d814:	00050593          	mv	a1,a0
8040d818:	00008517          	auipc	a0,0x8
8040d81c:	e9450513          	addi	a0,a0,-364 # 804156ac <syscalls+0x660>
8040d820:	9ddf20ef          	jal	ra,804001fc <cprintf>
8040d824:	00040513          	mv	a0,s0
8040d828:	00c12083          	lw	ra,12(sp)
8040d82c:	00812403          	lw	s0,8(sp)
8040d830:	00412483          	lw	s1,4(sp)
8040d834:	00012903          	lw	s2,0(sp)
8040d838:	01010113          	addi	sp,sp,16
8040d83c:	00008067          	ret
8040d840:	00008697          	auipc	a3,0x8
8040d844:	e1468693          	addi	a3,a3,-492 # 80415654 <syscalls+0x608>
8040d848:	00005617          	auipc	a2,0x5
8040d84c:	68060613          	addi	a2,a2,1664 # 80412ec8 <commands+0x1bc>
8040d850:	04400593          	li	a1,68
8040d854:	00008517          	auipc	a0,0x8
8040d858:	d2050513          	addi	a0,a0,-736 # 80415574 <syscalls+0x528>
8040d85c:	dc9f20ef          	jal	ra,80400624 <__panic>
8040d860:	00008697          	auipc	a3,0x8
8040d864:	dd868693          	addi	a3,a3,-552 # 80415638 <syscalls+0x5ec>
8040d868:	00005617          	auipc	a2,0x5
8040d86c:	66060613          	addi	a2,a2,1632 # 80412ec8 <commands+0x1bc>
8040d870:	03f00593          	li	a1,63
8040d874:	00008517          	auipc	a0,0x8
8040d878:	d0050513          	addi	a0,a0,-768 # 80415574 <syscalls+0x528>
8040d87c:	da9f20ef          	jal	ra,80400624 <__panic>

8040d880 <inode_open_dec>:
8040d880:	ff010113          	addi	sp,sp,-16
8040d884:	00812423          	sw	s0,8(sp)
8040d888:	03452403          	lw	s0,52(a0)
8040d88c:	00112623          	sw	ra,12(sp)
8040d890:	00912223          	sw	s1,4(sp)
8040d894:	01212023          	sw	s2,0(sp)
8040d898:	0a805263          	blez	s0,8040d93c <inode_open_dec+0xbc>
8040d89c:	fff40413          	addi	s0,s0,-1
8040d8a0:	02852a23          	sw	s0,52(a0)
8040d8a4:	00050493          	mv	s1,a0
8040d8a8:	02041663          	bnez	s0,8040d8d4 <inode_open_dec+0x54>
8040d8ac:	03c52783          	lw	a5,60(a0)
8040d8b0:	06078663          	beqz	a5,8040d91c <inode_open_dec+0x9c>
8040d8b4:	0087a903          	lw	s2,8(a5)
8040d8b8:	06090263          	beqz	s2,8040d91c <inode_open_dec+0x9c>
8040d8bc:	00008597          	auipc	a1,0x8
8040d8c0:	d5458593          	addi	a1,a1,-684 # 80415610 <syscalls+0x5c4>
8040d8c4:	e0dff0ef          	jal	ra,8040d6d0 <inode_check>
8040d8c8:	00048513          	mv	a0,s1
8040d8cc:	000900e7          	jalr	s2
8040d8d0:	02051063          	bnez	a0,8040d8f0 <inode_open_dec+0x70>
8040d8d4:	00040513          	mv	a0,s0
8040d8d8:	00c12083          	lw	ra,12(sp)
8040d8dc:	00812403          	lw	s0,8(sp)
8040d8e0:	00412483          	lw	s1,4(sp)
8040d8e4:	00012903          	lw	s2,0(sp)
8040d8e8:	01010113          	addi	sp,sp,16
8040d8ec:	00008067          	ret
8040d8f0:	00050593          	mv	a1,a0
8040d8f4:	00008517          	auipc	a0,0x8
8040d8f8:	d2450513          	addi	a0,a0,-732 # 80415618 <syscalls+0x5cc>
8040d8fc:	901f20ef          	jal	ra,804001fc <cprintf>
8040d900:	00040513          	mv	a0,s0
8040d904:	00c12083          	lw	ra,12(sp)
8040d908:	00812403          	lw	s0,8(sp)
8040d90c:	00412483          	lw	s1,4(sp)
8040d910:	00012903          	lw	s2,0(sp)
8040d914:	01010113          	addi	sp,sp,16
8040d918:	00008067          	ret
8040d91c:	00008697          	auipc	a3,0x8
8040d920:	ca468693          	addi	a3,a3,-860 # 804155c0 <syscalls+0x574>
8040d924:	00005617          	auipc	a2,0x5
8040d928:	5a460613          	addi	a2,a2,1444 # 80412ec8 <commands+0x1bc>
8040d92c:	06100593          	li	a1,97
8040d930:	00008517          	auipc	a0,0x8
8040d934:	c4450513          	addi	a0,a0,-956 # 80415574 <syscalls+0x528>
8040d938:	cedf20ef          	jal	ra,80400624 <__panic>
8040d93c:	00008697          	auipc	a3,0x8
8040d940:	c6868693          	addi	a3,a3,-920 # 804155a4 <syscalls+0x558>
8040d944:	00005617          	auipc	a2,0x5
8040d948:	58460613          	addi	a2,a2,1412 # 80412ec8 <commands+0x1bc>
8040d94c:	05c00593          	li	a1,92
8040d950:	00008517          	auipc	a0,0x8
8040d954:	c2450513          	addi	a0,a0,-988 # 80415574 <syscalls+0x528>
8040d958:	ccdf20ef          	jal	ra,80400624 <__panic>

8040d95c <__alloc_fs>:
8040d95c:	ff010113          	addi	sp,sp,-16
8040d960:	00812423          	sw	s0,8(sp)
8040d964:	00050413          	mv	s0,a0
8040d968:	08000513          	li	a0,128
8040d96c:	00112623          	sw	ra,12(sp)
8040d970:	850f50ef          	jal	ra,804029c0 <kmalloc>
8040d974:	00050463          	beqz	a0,8040d97c <__alloc_fs+0x20>
8040d978:	06852623          	sw	s0,108(a0)
8040d97c:	00c12083          	lw	ra,12(sp)
8040d980:	00812403          	lw	s0,8(sp)
8040d984:	01010113          	addi	sp,sp,16
8040d988:	00008067          	ret

8040d98c <vfs_init>:
8040d98c:	ff010113          	addi	sp,sp,-16
8040d990:	00100593          	li	a1,1
8040d994:	0008e517          	auipc	a0,0x8e
8040d998:	dc850513          	addi	a0,a0,-568 # 8049b75c <bootfs_sem>
8040d99c:	00112623          	sw	ra,12(sp)
8040d9a0:	829f70ef          	jal	ra,804051c8 <sem_init>
8040d9a4:	00c12083          	lw	ra,12(sp)
8040d9a8:	01010113          	addi	sp,sp,16
8040d9ac:	3900006f          	j	8040dd3c <vfs_devlist_init>

8040d9b0 <vfs_set_bootfs>:
8040d9b0:	fe010113          	addi	sp,sp,-32
8040d9b4:	00812c23          	sw	s0,24(sp)
8040d9b8:	00112e23          	sw	ra,28(sp)
8040d9bc:	00912a23          	sw	s1,20(sp)
8040d9c0:	00012623          	sw	zero,12(sp)
8040d9c4:	00050413          	mv	s0,a0
8040d9c8:	04050a63          	beqz	a0,8040da1c <vfs_set_bootfs+0x6c>
8040d9cc:	03a00593          	li	a1,58
8040d9d0:	09c050ef          	jal	ra,80412a6c <strchr>
8040d9d4:	08050e63          	beqz	a0,8040da70 <vfs_set_bootfs+0xc0>
8040d9d8:	00154783          	lbu	a5,1(a0)
8040d9dc:	08079a63          	bnez	a5,8040da70 <vfs_set_bootfs+0xc0>
8040d9e0:	00040513          	mv	a0,s0
8040d9e4:	509000ef          	jal	ra,8040e6ec <vfs_chdir>
8040d9e8:	00050413          	mv	s0,a0
8040d9ec:	00050e63          	beqz	a0,8040da08 <vfs_set_bootfs+0x58>
8040d9f0:	00040513          	mv	a0,s0
8040d9f4:	01c12083          	lw	ra,28(sp)
8040d9f8:	01812403          	lw	s0,24(sp)
8040d9fc:	01412483          	lw	s1,20(sp)
8040da00:	02010113          	addi	sp,sp,32
8040da04:	00008067          	ret
8040da08:	00c10513          	addi	a0,sp,12
8040da0c:	375000ef          	jal	ra,8040e580 <vfs_get_curdir>
8040da10:	00050413          	mv	s0,a0
8040da14:	fc051ee3          	bnez	a0,8040d9f0 <vfs_set_bootfs+0x40>
8040da18:	00c12403          	lw	s0,12(sp)
8040da1c:	0008e517          	auipc	a0,0x8e
8040da20:	d4050513          	addi	a0,a0,-704 # 8049b75c <bootfs_sem>
8040da24:	fb4f70ef          	jal	ra,804051d8 <down>
8040da28:	0008f797          	auipc	a5,0x8f
8040da2c:	da478793          	addi	a5,a5,-604 # 8049c7cc <bootfs_node>
8040da30:	0007a483          	lw	s1,0(a5)
8040da34:	0008e517          	auipc	a0,0x8e
8040da38:	d2850513          	addi	a0,a0,-728 # 8049b75c <bootfs_sem>
8040da3c:	0008f797          	auipc	a5,0x8f
8040da40:	d887a823          	sw	s0,-624(a5) # 8049c7cc <bootfs_node>
8040da44:	00000413          	li	s0,0
8040da48:	f8cf70ef          	jal	ra,804051d4 <up>
8040da4c:	fa0482e3          	beqz	s1,8040d9f0 <vfs_set_bootfs+0x40>
8040da50:	00048513          	mv	a0,s1
8040da54:	d49ff0ef          	jal	ra,8040d79c <inode_ref_dec>
8040da58:	00040513          	mv	a0,s0
8040da5c:	01c12083          	lw	ra,28(sp)
8040da60:	01812403          	lw	s0,24(sp)
8040da64:	01412483          	lw	s1,20(sp)
8040da68:	02010113          	addi	sp,sp,32
8040da6c:	00008067          	ret
8040da70:	ffd00413          	li	s0,-3
8040da74:	f7dff06f          	j	8040d9f0 <vfs_set_bootfs+0x40>

8040da78 <vfs_get_bootfs>:
8040da78:	ff010113          	addi	sp,sp,-16
8040da7c:	00912223          	sw	s1,4(sp)
8040da80:	0008f497          	auipc	s1,0x8f
8040da84:	d4c48493          	addi	s1,s1,-692 # 8049c7cc <bootfs_node>
8040da88:	0004a783          	lw	a5,0(s1)
8040da8c:	00112623          	sw	ra,12(sp)
8040da90:	00812423          	sw	s0,8(sp)
8040da94:	04078c63          	beqz	a5,8040daec <vfs_get_bootfs+0x74>
8040da98:	00050413          	mv	s0,a0
8040da9c:	0008e517          	auipc	a0,0x8e
8040daa0:	cc050513          	addi	a0,a0,-832 # 8049b75c <bootfs_sem>
8040daa4:	f34f70ef          	jal	ra,804051d8 <down>
8040daa8:	0004a483          	lw	s1,0(s1)
8040daac:	02048a63          	beqz	s1,8040dae0 <vfs_get_bootfs+0x68>
8040dab0:	00048513          	mv	a0,s1
8040dab4:	bf5ff0ef          	jal	ra,8040d6a8 <inode_ref_inc>
8040dab8:	0008e517          	auipc	a0,0x8e
8040dabc:	ca450513          	addi	a0,a0,-860 # 8049b75c <bootfs_sem>
8040dac0:	f14f70ef          	jal	ra,804051d4 <up>
8040dac4:	00000513          	li	a0,0
8040dac8:	00942023          	sw	s1,0(s0)
8040dacc:	00c12083          	lw	ra,12(sp)
8040dad0:	00812403          	lw	s0,8(sp)
8040dad4:	00412483          	lw	s1,4(sp)
8040dad8:	01010113          	addi	sp,sp,16
8040dadc:	00008067          	ret
8040dae0:	0008e517          	auipc	a0,0x8e
8040dae4:	c7c50513          	addi	a0,a0,-900 # 8049b75c <bootfs_sem>
8040dae8:	eecf70ef          	jal	ra,804051d4 <up>
8040daec:	ff000513          	li	a0,-16
8040daf0:	fddff06f          	j	8040dacc <vfs_get_bootfs+0x54>

8040daf4 <vfs_do_add>:
8040daf4:	fe010113          	addi	sp,sp,-32
8040daf8:	00112e23          	sw	ra,28(sp)
8040dafc:	00812c23          	sw	s0,24(sp)
8040db00:	00912a23          	sw	s1,20(sp)
8040db04:	01212823          	sw	s2,16(sp)
8040db08:	01312623          	sw	s3,12(sp)
8040db0c:	01412423          	sw	s4,8(sp)
8040db10:	01512223          	sw	s5,4(sp)
8040db14:	01612023          	sw	s6,0(sp)
8040db18:	14050863          	beqz	a0,8040dc68 <vfs_do_add+0x174>
8040db1c:	00050413          	mv	s0,a0
8040db20:	00058a13          	mv	s4,a1
8040db24:	00060b13          	mv	s6,a2
8040db28:	00068a93          	mv	s5,a3
8040db2c:	0e058663          	beqz	a1,8040dc18 <vfs_do_add+0x124>
8040db30:	02c5a703          	lw	a4,44(a1)
8040db34:	000017b7          	lui	a5,0x1
8040db38:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040db3c:	0ef71063          	bne	a4,a5,8040dc1c <vfs_do_add+0x128>
8040db40:	00040513          	mv	a0,s0
8040db44:	671040ef          	jal	ra,804129b4 <strlen>
8040db48:	01f00793          	li	a5,31
8040db4c:	10a7e663          	bltu	a5,a0,8040dc58 <vfs_do_add+0x164>
8040db50:	00040513          	mv	a0,s0
8040db54:	f28f20ef          	jal	ra,8040027c <strdup>
8040db58:	00050493          	mv	s1,a0
8040db5c:	10050263          	beqz	a0,8040dc60 <vfs_do_add+0x16c>
8040db60:	01800513          	li	a0,24
8040db64:	e5df40ef          	jal	ra,804029c0 <kmalloc>
8040db68:	00050993          	mv	s3,a0
8040db6c:	08050e63          	beqz	a0,8040dc08 <vfs_do_add+0x114>
8040db70:	0008e517          	auipc	a0,0x8e
8040db74:	bf850513          	addi	a0,a0,-1032 # 8049b768 <vdev_list_sem>
8040db78:	0008f917          	auipc	s2,0x8f
8040db7c:	c5890913          	addi	s2,s2,-936 # 8049c7d0 <vdev_list>
8040db80:	e58f70ef          	jal	ra,804051d8 <down>
8040db84:	00090413          	mv	s0,s2
8040db88:	0140006f          	j	8040db9c <vfs_do_add+0xa8>
8040db8c:	ff042503          	lw	a0,-16(s0)
8040db90:	00048593          	mv	a1,s1
8040db94:	6a9040ef          	jal	ra,80412a3c <strcmp>
8040db98:	0a050263          	beqz	a0,8040dc3c <vfs_do_add+0x148>
8040db9c:	00442403          	lw	s0,4(s0)
8040dba0:	ff2416e3          	bne	s0,s2,8040db8c <vfs_do_add+0x98>
8040dba4:	00442703          	lw	a4,4(s0)
8040dba8:	01098793          	addi	a5,s3,16
8040dbac:	0099a023          	sw	s1,0(s3)
8040dbb0:	0149a223          	sw	s4,4(s3)
8040dbb4:	0159a623          	sw	s5,12(s3)
8040dbb8:	0169a423          	sw	s6,8(s3)
8040dbbc:	00f72023          	sw	a5,0(a4)
8040dbc0:	0089a823          	sw	s0,16(s3)
8040dbc4:	00e9aa23          	sw	a4,20(s3)
8040dbc8:	0008e517          	auipc	a0,0x8e
8040dbcc:	ba050513          	addi	a0,a0,-1120 # 8049b768 <vdev_list_sem>
8040dbd0:	00f42223          	sw	a5,4(s0)
8040dbd4:	00000413          	li	s0,0
8040dbd8:	dfcf70ef          	jal	ra,804051d4 <up>
8040dbdc:	00040513          	mv	a0,s0
8040dbe0:	01c12083          	lw	ra,28(sp)
8040dbe4:	01812403          	lw	s0,24(sp)
8040dbe8:	01412483          	lw	s1,20(sp)
8040dbec:	01012903          	lw	s2,16(sp)
8040dbf0:	00c12983          	lw	s3,12(sp)
8040dbf4:	00812a03          	lw	s4,8(sp)
8040dbf8:	00412a83          	lw	s5,4(sp)
8040dbfc:	00012b03          	lw	s6,0(sp)
8040dc00:	02010113          	addi	sp,sp,32
8040dc04:	00008067          	ret
8040dc08:	ffc00413          	li	s0,-4
8040dc0c:	00048513          	mv	a0,s1
8040dc10:	ed5f40ef          	jal	ra,80402ae4 <kfree>
8040dc14:	fc9ff06f          	j	8040dbdc <vfs_do_add+0xe8>
8040dc18:	f20684e3          	beqz	a3,8040db40 <vfs_do_add+0x4c>
8040dc1c:	00008697          	auipc	a3,0x8
8040dc20:	ad868693          	addi	a3,a3,-1320 # 804156f4 <syscalls+0x6a8>
8040dc24:	00005617          	auipc	a2,0x5
8040dc28:	2a460613          	addi	a2,a2,676 # 80412ec8 <commands+0x1bc>
8040dc2c:	08f00593          	li	a1,143
8040dc30:	00008517          	auipc	a0,0x8
8040dc34:	aac50513          	addi	a0,a0,-1364 # 804156dc <syscalls+0x690>
8040dc38:	9edf20ef          	jal	ra,80400624 <__panic>
8040dc3c:	0008e517          	auipc	a0,0x8e
8040dc40:	b2c50513          	addi	a0,a0,-1236 # 8049b768 <vdev_list_sem>
8040dc44:	d90f70ef          	jal	ra,804051d4 <up>
8040dc48:	00098513          	mv	a0,s3
8040dc4c:	e99f40ef          	jal	ra,80402ae4 <kfree>
8040dc50:	fe900413          	li	s0,-23
8040dc54:	fb9ff06f          	j	8040dc0c <vfs_do_add+0x118>
8040dc58:	ff400413          	li	s0,-12
8040dc5c:	f81ff06f          	j	8040dbdc <vfs_do_add+0xe8>
8040dc60:	ffc00413          	li	s0,-4
8040dc64:	f79ff06f          	j	8040dbdc <vfs_do_add+0xe8>
8040dc68:	00008697          	auipc	a3,0x8
8040dc6c:	a6468693          	addi	a3,a3,-1436 # 804156cc <syscalls+0x680>
8040dc70:	00005617          	auipc	a2,0x5
8040dc74:	25860613          	addi	a2,a2,600 # 80412ec8 <commands+0x1bc>
8040dc78:	08e00593          	li	a1,142
8040dc7c:	00008517          	auipc	a0,0x8
8040dc80:	a6050513          	addi	a0,a0,-1440 # 804156dc <syscalls+0x690>
8040dc84:	9a1f20ef          	jal	ra,80400624 <__panic>

8040dc88 <find_mount>:
8040dc88:	fe010113          	addi	sp,sp,-32
8040dc8c:	00812c23          	sw	s0,24(sp)
8040dc90:	00912a23          	sw	s1,20(sp)
8040dc94:	01212823          	sw	s2,16(sp)
8040dc98:	01312623          	sw	s3,12(sp)
8040dc9c:	0008f497          	auipc	s1,0x8f
8040dca0:	b3448493          	addi	s1,s1,-1228 # 8049c7d0 <vdev_list>
8040dca4:	00112e23          	sw	ra,28(sp)
8040dca8:	00050913          	mv	s2,a0
8040dcac:	00058993          	mv	s3,a1
8040dcb0:	00048413          	mv	s0,s1
8040dcb4:	06050463          	beqz	a0,8040dd1c <find_mount+0x94>
8040dcb8:	00442403          	lw	s0,4(s0)
8040dcbc:	04940063          	beq	s0,s1,8040dcfc <find_mount+0x74>
8040dcc0:	ffc42783          	lw	a5,-4(s0)
8040dcc4:	fe078ae3          	beqz	a5,8040dcb8 <find_mount+0x30>
8040dcc8:	ff042503          	lw	a0,-16(s0)
8040dccc:	00090593          	mv	a1,s2
8040dcd0:	56d040ef          	jal	ra,80412a3c <strcmp>
8040dcd4:	fe0512e3          	bnez	a0,8040dcb8 <find_mount+0x30>
8040dcd8:	ff040413          	addi	s0,s0,-16
8040dcdc:	0089a023          	sw	s0,0(s3)
8040dce0:	01c12083          	lw	ra,28(sp)
8040dce4:	01812403          	lw	s0,24(sp)
8040dce8:	01412483          	lw	s1,20(sp)
8040dcec:	01012903          	lw	s2,16(sp)
8040dcf0:	00c12983          	lw	s3,12(sp)
8040dcf4:	02010113          	addi	sp,sp,32
8040dcf8:	00008067          	ret
8040dcfc:	01c12083          	lw	ra,28(sp)
8040dd00:	01812403          	lw	s0,24(sp)
8040dd04:	01412483          	lw	s1,20(sp)
8040dd08:	01012903          	lw	s2,16(sp)
8040dd0c:	00c12983          	lw	s3,12(sp)
8040dd10:	ff300513          	li	a0,-13
8040dd14:	02010113          	addi	sp,sp,32
8040dd18:	00008067          	ret
8040dd1c:	00008697          	auipc	a3,0x8
8040dd20:	9b068693          	addi	a3,a3,-1616 # 804156cc <syscalls+0x680>
8040dd24:	00005617          	auipc	a2,0x5
8040dd28:	1a460613          	addi	a2,a2,420 # 80412ec8 <commands+0x1bc>
8040dd2c:	0cd00593          	li	a1,205
8040dd30:	00008517          	auipc	a0,0x8
8040dd34:	9ac50513          	addi	a0,a0,-1620 # 804156dc <syscalls+0x690>
8040dd38:	8edf20ef          	jal	ra,80400624 <__panic>

8040dd3c <vfs_devlist_init>:
8040dd3c:	0008f797          	auipc	a5,0x8f
8040dd40:	a9478793          	addi	a5,a5,-1388 # 8049c7d0 <vdev_list>
8040dd44:	00100593          	li	a1,1
8040dd48:	0008e517          	auipc	a0,0x8e
8040dd4c:	a2050513          	addi	a0,a0,-1504 # 8049b768 <vdev_list_sem>
8040dd50:	00f7a223          	sw	a5,4(a5)
8040dd54:	00f7a023          	sw	a5,0(a5)
8040dd58:	c70f706f          	j	804051c8 <sem_init>

8040dd5c <vfs_cleanup>:
8040dd5c:	ff010113          	addi	sp,sp,-16
8040dd60:	00912223          	sw	s1,4(sp)
8040dd64:	0008f497          	auipc	s1,0x8f
8040dd68:	a6c48493          	addi	s1,s1,-1428 # 8049c7d0 <vdev_list>
8040dd6c:	0044a783          	lw	a5,4(s1)
8040dd70:	00112623          	sw	ra,12(sp)
8040dd74:	00812423          	sw	s0,8(sp)
8040dd78:	04978a63          	beq	a5,s1,8040ddcc <vfs_cleanup+0x70>
8040dd7c:	0008e517          	auipc	a0,0x8e
8040dd80:	9ec50513          	addi	a0,a0,-1556 # 8049b768 <vdev_list_sem>
8040dd84:	c54f70ef          	jal	ra,804051d8 <down>
8040dd88:	00048413          	mv	s0,s1
8040dd8c:	00442403          	lw	s0,4(s0)
8040dd90:	02940063          	beq	s0,s1,8040ddb0 <vfs_cleanup+0x54>
8040dd94:	ff842783          	lw	a5,-8(s0)
8040dd98:	00078513          	mv	a0,a5
8040dd9c:	fe0788e3          	beqz	a5,8040dd8c <vfs_cleanup+0x30>
8040dda0:	07c7a783          	lw	a5,124(a5)
8040dda4:	000780e7          	jalr	a5
8040dda8:	00442403          	lw	s0,4(s0)
8040ddac:	fe9414e3          	bne	s0,s1,8040dd94 <vfs_cleanup+0x38>
8040ddb0:	00812403          	lw	s0,8(sp)
8040ddb4:	00c12083          	lw	ra,12(sp)
8040ddb8:	00412483          	lw	s1,4(sp)
8040ddbc:	0008e517          	auipc	a0,0x8e
8040ddc0:	9ac50513          	addi	a0,a0,-1620 # 8049b768 <vdev_list_sem>
8040ddc4:	01010113          	addi	sp,sp,16
8040ddc8:	c0cf706f          	j	804051d4 <up>
8040ddcc:	00c12083          	lw	ra,12(sp)
8040ddd0:	00812403          	lw	s0,8(sp)
8040ddd4:	00412483          	lw	s1,4(sp)
8040ddd8:	01010113          	addi	sp,sp,16
8040dddc:	00008067          	ret

8040dde0 <vfs_get_root>:
8040dde0:	fe010113          	addi	sp,sp,-32
8040dde4:	00112e23          	sw	ra,28(sp)
8040dde8:	00812c23          	sw	s0,24(sp)
8040ddec:	00912a23          	sw	s1,20(sp)
8040ddf0:	01212823          	sw	s2,16(sp)
8040ddf4:	01312623          	sw	s3,12(sp)
8040ddf8:	01412423          	sw	s4,8(sp)
8040ddfc:	0c050263          	beqz	a0,8040dec0 <vfs_get_root+0xe0>
8040de00:	0008f917          	auipc	s2,0x8f
8040de04:	9d090913          	addi	s2,s2,-1584 # 8049c7d0 <vdev_list>
8040de08:	00492783          	lw	a5,4(s2)
8040de0c:	0b278663          	beq	a5,s2,8040deb8 <vfs_get_root+0xd8>
8040de10:	00050993          	mv	s3,a0
8040de14:	0008e517          	auipc	a0,0x8e
8040de18:	95450513          	addi	a0,a0,-1708 # 8049b768 <vdev_list_sem>
8040de1c:	00058a13          	mv	s4,a1
8040de20:	00090413          	mv	s0,s2
8040de24:	bb4f70ef          	jal	ra,804051d8 <down>
8040de28:	0180006f          	j	8040de40 <vfs_get_root+0x60>
8040de2c:	ff042583          	lw	a1,-16(s0)
8040de30:	00098513          	mv	a0,s3
8040de34:	409040ef          	jal	ra,80412a3c <strcmp>
8040de38:	00050493          	mv	s1,a0
8040de3c:	04050063          	beqz	a0,8040de7c <vfs_get_root+0x9c>
8040de40:	00442403          	lw	s0,4(s0)
8040de44:	ff2414e3          	bne	s0,s2,8040de2c <vfs_get_root+0x4c>
8040de48:	ff300493          	li	s1,-13
8040de4c:	0008e517          	auipc	a0,0x8e
8040de50:	91c50513          	addi	a0,a0,-1764 # 8049b768 <vdev_list_sem>
8040de54:	b80f70ef          	jal	ra,804051d4 <up>
8040de58:	01c12083          	lw	ra,28(sp)
8040de5c:	01812403          	lw	s0,24(sp)
8040de60:	00048513          	mv	a0,s1
8040de64:	01012903          	lw	s2,16(sp)
8040de68:	01412483          	lw	s1,20(sp)
8040de6c:	00c12983          	lw	s3,12(sp)
8040de70:	00812a03          	lw	s4,8(sp)
8040de74:	02010113          	addi	sp,sp,32
8040de78:	00008067          	ret
8040de7c:	ff842503          	lw	a0,-8(s0)
8040de80:	00050c63          	beqz	a0,8040de98 <vfs_get_root+0xb8>
8040de84:	07452783          	lw	a5,116(a0)
8040de88:	000780e7          	jalr	a5
8040de8c:	00050a63          	beqz	a0,8040dea0 <vfs_get_root+0xc0>
8040de90:	00aa2023          	sw	a0,0(s4)
8040de94:	fb9ff06f          	j	8040de4c <vfs_get_root+0x6c>
8040de98:	ffc42783          	lw	a5,-4(s0)
8040de9c:	00078663          	beqz	a5,8040dea8 <vfs_get_root+0xc8>
8040dea0:	ff200493          	li	s1,-14
8040dea4:	fa9ff06f          	j	8040de4c <vfs_get_root+0x6c>
8040dea8:	ff442503          	lw	a0,-12(s0)
8040deac:	ffcff0ef          	jal	ra,8040d6a8 <inode_ref_inc>
8040deb0:	ff442503          	lw	a0,-12(s0)
8040deb4:	fd9ff06f          	j	8040de8c <vfs_get_root+0xac>
8040deb8:	ff300493          	li	s1,-13
8040debc:	f9dff06f          	j	8040de58 <vfs_get_root+0x78>
8040dec0:	00008697          	auipc	a3,0x8
8040dec4:	80c68693          	addi	a3,a3,-2036 # 804156cc <syscalls+0x680>
8040dec8:	00005617          	auipc	a2,0x5
8040decc:	00060613          	mv	a2,a2
8040ded0:	04500593          	li	a1,69
8040ded4:	00008517          	auipc	a0,0x8
8040ded8:	80850513          	addi	a0,a0,-2040 # 804156dc <syscalls+0x690>
8040dedc:	f48f20ef          	jal	ra,80400624 <__panic>

8040dee0 <vfs_get_devname>:
8040dee0:	0008f697          	auipc	a3,0x8f
8040dee4:	8f068693          	addi	a3,a3,-1808 # 8049c7d0 <vdev_list>
8040dee8:	00068793          	mv	a5,a3
8040deec:	00051863          	bnez	a0,8040defc <vfs_get_devname+0x1c>
8040def0:	0240006f          	j	8040df14 <vfs_get_devname+0x34>
8040def4:	ff87a703          	lw	a4,-8(a5)
8040def8:	00a70a63          	beq	a4,a0,8040df0c <vfs_get_devname+0x2c>
8040defc:	0047a783          	lw	a5,4(a5)
8040df00:	fed79ae3          	bne	a5,a3,8040def4 <vfs_get_devname+0x14>
8040df04:	00000513          	li	a0,0
8040df08:	00008067          	ret
8040df0c:	ff07a503          	lw	a0,-16(a5)
8040df10:	00008067          	ret
8040df14:	ff010113          	addi	sp,sp,-16
8040df18:	00008697          	auipc	a3,0x8
8040df1c:	83868693          	addi	a3,a3,-1992 # 80415750 <syscalls+0x704>
8040df20:	00005617          	auipc	a2,0x5
8040df24:	fa860613          	addi	a2,a2,-88 # 80412ec8 <commands+0x1bc>
8040df28:	06a00593          	li	a1,106
8040df2c:	00007517          	auipc	a0,0x7
8040df30:	7b050513          	addi	a0,a0,1968 # 804156dc <syscalls+0x690>
8040df34:	00112623          	sw	ra,12(sp)
8040df38:	eecf20ef          	jal	ra,80400624 <__panic>

8040df3c <vfs_add_dev>:
8040df3c:	00060693          	mv	a3,a2
8040df40:	00000613          	li	a2,0
8040df44:	bb1ff06f          	j	8040daf4 <vfs_do_add>

8040df48 <vfs_mount>:
8040df48:	fe010113          	addi	sp,sp,-32
8040df4c:	00812c23          	sw	s0,24(sp)
8040df50:	00050413          	mv	s0,a0
8040df54:	0008e517          	auipc	a0,0x8e
8040df58:	81450513          	addi	a0,a0,-2028 # 8049b768 <vdev_list_sem>
8040df5c:	00112e23          	sw	ra,28(sp)
8040df60:	00912a23          	sw	s1,20(sp)
8040df64:	00058493          	mv	s1,a1
8040df68:	a70f70ef          	jal	ra,804051d8 <down>
8040df6c:	00040513          	mv	a0,s0
8040df70:	00c10593          	addi	a1,sp,12
8040df74:	d15ff0ef          	jal	ra,8040dc88 <find_mount>
8040df78:	00050413          	mv	s0,a0
8040df7c:	06051263          	bnez	a0,8040dfe0 <vfs_mount+0x98>
8040df80:	00c12583          	lw	a1,12(sp)
8040df84:	0085a783          	lw	a5,8(a1)
8040df88:	06079e63          	bnez	a5,8040e004 <vfs_mount+0xbc>
8040df8c:	0005a783          	lw	a5,0(a1)
8040df90:	08078e63          	beqz	a5,8040e02c <vfs_mount+0xe4>
8040df94:	00c5a783          	lw	a5,12(a1)
8040df98:	08078a63          	beqz	a5,8040e02c <vfs_mount+0xe4>
8040df9c:	0045a503          	lw	a0,4(a1)
8040dfa0:	06050663          	beqz	a0,8040e00c <vfs_mount+0xc4>
8040dfa4:	02c52703          	lw	a4,44(a0)
8040dfa8:	000017b7          	lui	a5,0x1
8040dfac:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040dfb0:	04f71e63          	bne	a4,a5,8040e00c <vfs_mount+0xc4>
8040dfb4:	00858593          	addi	a1,a1,8
8040dfb8:	000480e7          	jalr	s1
8040dfbc:	00050413          	mv	s0,a0
8040dfc0:	02051063          	bnez	a0,8040dfe0 <vfs_mount+0x98>
8040dfc4:	00c12783          	lw	a5,12(sp)
8040dfc8:	0087a703          	lw	a4,8(a5)
8040dfcc:	08070063          	beqz	a4,8040e04c <vfs_mount+0x104>
8040dfd0:	0007a583          	lw	a1,0(a5)
8040dfd4:	00007517          	auipc	a0,0x7
8040dfd8:	7fc50513          	addi	a0,a0,2044 # 804157d0 <syscalls+0x784>
8040dfdc:	a20f20ef          	jal	ra,804001fc <cprintf>
8040dfe0:	0008d517          	auipc	a0,0x8d
8040dfe4:	78850513          	addi	a0,a0,1928 # 8049b768 <vdev_list_sem>
8040dfe8:	9ecf70ef          	jal	ra,804051d4 <up>
8040dfec:	00040513          	mv	a0,s0
8040dff0:	01c12083          	lw	ra,28(sp)
8040dff4:	01812403          	lw	s0,24(sp)
8040dff8:	01412483          	lw	s1,20(sp)
8040dffc:	02010113          	addi	sp,sp,32
8040e000:	00008067          	ret
8040e004:	ff100413          	li	s0,-15
8040e008:	fd9ff06f          	j	8040dfe0 <vfs_mount+0x98>
8040e00c:	00007697          	auipc	a3,0x7
8040e010:	77c68693          	addi	a3,a3,1916 # 80415788 <syscalls+0x73c>
8040e014:	00005617          	auipc	a2,0x5
8040e018:	eb460613          	addi	a2,a2,-332 # 80412ec8 <commands+0x1bc>
8040e01c:	0ed00593          	li	a1,237
8040e020:	00007517          	auipc	a0,0x7
8040e024:	6bc50513          	addi	a0,a0,1724 # 804156dc <syscalls+0x690>
8040e028:	dfcf20ef          	jal	ra,80400624 <__panic>
8040e02c:	00007697          	auipc	a3,0x7
8040e030:	73068693          	addi	a3,a3,1840 # 8041575c <syscalls+0x710>
8040e034:	00005617          	auipc	a2,0x5
8040e038:	e9460613          	addi	a2,a2,-364 # 80412ec8 <commands+0x1bc>
8040e03c:	0eb00593          	li	a1,235
8040e040:	00007517          	auipc	a0,0x7
8040e044:	69c50513          	addi	a0,a0,1692 # 804156dc <syscalls+0x690>
8040e048:	ddcf20ef          	jal	ra,80400624 <__panic>
8040e04c:	00007697          	auipc	a3,0x7
8040e050:	77068693          	addi	a3,a3,1904 # 804157bc <syscalls+0x770>
8040e054:	00005617          	auipc	a2,0x5
8040e058:	e7460613          	addi	a2,a2,-396 # 80412ec8 <commands+0x1bc>
8040e05c:	0ef00593          	li	a1,239
8040e060:	00007517          	auipc	a0,0x7
8040e064:	67c50513          	addi	a0,a0,1660 # 804156dc <syscalls+0x690>
8040e068:	dbcf20ef          	jal	ra,80400624 <__panic>

8040e06c <vfs_open>:
8040e06c:	fd010113          	addi	sp,sp,-48
8040e070:	02112623          	sw	ra,44(sp)
8040e074:	02812423          	sw	s0,40(sp)
8040e078:	02912223          	sw	s1,36(sp)
8040e07c:	03212023          	sw	s2,32(sp)
8040e080:	01312e23          	sw	s3,28(sp)
8040e084:	01412c23          	sw	s4,24(sp)
8040e088:	01512a23          	sw	s5,20(sp)
8040e08c:	0035f793          	andi	a5,a1,3
8040e090:	16078e63          	beqz	a5,8040e20c <vfs_open+0x1a0>
8040e094:	00200713          	li	a4,2
8040e098:	0cf76c63          	bltu	a4,a5,8040e170 <vfs_open+0x104>
8040e09c:	0105fa93          	andi	s5,a1,16
8040e0a0:	00058493          	mv	s1,a1
8040e0a4:	00410593          	addi	a1,sp,4
8040e0a8:	00060993          	mv	s3,a2
8040e0ac:	00050913          	mv	s2,a0
8040e0b0:	39c000ef          	jal	ra,8040e44c <vfs_lookup>
8040e0b4:	00050413          	mv	s0,a0
8040e0b8:	0044fa13          	andi	s4,s1,4
8040e0bc:	0e051063          	bnez	a0,8040e19c <vfs_open+0x130>
8040e0c0:	00c4f793          	andi	a5,s1,12
8040e0c4:	00c00713          	li	a4,12
8040e0c8:	16e78663          	beq	a5,a4,8040e234 <vfs_open+0x1c8>
8040e0cc:	00412403          	lw	s0,4(sp)
8040e0d0:	1a040663          	beqz	s0,8040e27c <vfs_open+0x210>
8040e0d4:	03c42783          	lw	a5,60(s0)
8040e0d8:	16078263          	beqz	a5,8040e23c <vfs_open+0x1d0>
8040e0dc:	0047a783          	lw	a5,4(a5)
8040e0e0:	14078e63          	beqz	a5,8040e23c <vfs_open+0x1d0>
8040e0e4:	00040513          	mv	a0,s0
8040e0e8:	00007597          	auipc	a1,0x7
8040e0ec:	7c858593          	addi	a1,a1,1992 # 804158b0 <syscalls+0x864>
8040e0f0:	de0ff0ef          	jal	ra,8040d6d0 <inode_check>
8040e0f4:	03c42783          	lw	a5,60(s0)
8040e0f8:	00412503          	lw	a0,4(sp)
8040e0fc:	00048593          	mv	a1,s1
8040e100:	0047a783          	lw	a5,4(a5)
8040e104:	000780e7          	jalr	a5
8040e108:	00050413          	mv	s0,a0
8040e10c:	00412503          	lw	a0,4(sp)
8040e110:	10041e63          	bnez	s0,8040e22c <vfs_open+0x1c0>
8040e114:	015a6a33          	or	s4,s4,s5
8040e118:	da4ff0ef          	jal	ra,8040d6bc <inode_open_inc>
8040e11c:	040a0463          	beqz	s4,8040e164 <vfs_open+0xf8>
8040e120:	00412483          	lw	s1,4(sp)
8040e124:	12048c63          	beqz	s1,8040e25c <vfs_open+0x1f0>
8040e128:	03c4a783          	lw	a5,60(s1)
8040e12c:	12078863          	beqz	a5,8040e25c <vfs_open+0x1f0>
8040e130:	0307a783          	lw	a5,48(a5)
8040e134:	12078463          	beqz	a5,8040e25c <vfs_open+0x1f0>
8040e138:	00007597          	auipc	a1,0x7
8040e13c:	7d458593          	addi	a1,a1,2004 # 8041590c <syscalls+0x8c0>
8040e140:	00048513          	mv	a0,s1
8040e144:	d8cff0ef          	jal	ra,8040d6d0 <inode_check>
8040e148:	03c4a783          	lw	a5,60(s1)
8040e14c:	00412503          	lw	a0,4(sp)
8040e150:	00000593          	li	a1,0
8040e154:	0307a783          	lw	a5,48(a5)
8040e158:	000780e7          	jalr	a5
8040e15c:	00050793          	mv	a5,a0
8040e160:	0a051e63          	bnez	a0,8040e21c <vfs_open+0x1b0>
8040e164:	00412783          	lw	a5,4(sp)
8040e168:	00f9a023          	sw	a5,0(s3)
8040e16c:	0080006f          	j	8040e174 <vfs_open+0x108>
8040e170:	ffd00413          	li	s0,-3
8040e174:	00040513          	mv	a0,s0
8040e178:	02c12083          	lw	ra,44(sp)
8040e17c:	02812403          	lw	s0,40(sp)
8040e180:	02412483          	lw	s1,36(sp)
8040e184:	02012903          	lw	s2,32(sp)
8040e188:	01c12983          	lw	s3,28(sp)
8040e18c:	01812a03          	lw	s4,24(sp)
8040e190:	01412a83          	lw	s5,20(sp)
8040e194:	03010113          	addi	sp,sp,48
8040e198:	00008067          	ret
8040e19c:	ff000793          	li	a5,-16
8040e1a0:	fcf51ae3          	bne	a0,a5,8040e174 <vfs_open+0x108>
8040e1a4:	fc0a08e3          	beqz	s4,8040e174 <vfs_open+0x108>
8040e1a8:	00810613          	addi	a2,sp,8
8040e1ac:	00c10593          	addi	a1,sp,12
8040e1b0:	00090513          	mv	a0,s2
8040e1b4:	37c000ef          	jal	ra,8040e530 <vfs_lookup_parent>
8040e1b8:	00050413          	mv	s0,a0
8040e1bc:	fa051ce3          	bnez	a0,8040e174 <vfs_open+0x108>
8040e1c0:	00c12403          	lw	s0,12(sp)
8040e1c4:	0c040c63          	beqz	s0,8040e29c <vfs_open+0x230>
8040e1c8:	03c42783          	lw	a5,60(s0)
8040e1cc:	0c078863          	beqz	a5,8040e29c <vfs_open+0x230>
8040e1d0:	0347a783          	lw	a5,52(a5)
8040e1d4:	0c078463          	beqz	a5,8040e29c <vfs_open+0x230>
8040e1d8:	00040513          	mv	a0,s0
8040e1dc:	00007597          	auipc	a1,0x7
8040e1e0:	66c58593          	addi	a1,a1,1644 # 80415848 <syscalls+0x7fc>
8040e1e4:	cecff0ef          	jal	ra,8040d6d0 <inode_check>
8040e1e8:	03c42783          	lw	a5,60(s0)
8040e1ec:	00812583          	lw	a1,8(sp)
8040e1f0:	00c12503          	lw	a0,12(sp)
8040e1f4:	0347a783          	lw	a5,52(a5)
8040e1f8:	0034d613          	srli	a2,s1,0x3
8040e1fc:	00410693          	addi	a3,sp,4
8040e200:	00167613          	andi	a2,a2,1
8040e204:	000780e7          	jalr	a5
8040e208:	ec5ff06f          	j	8040e0cc <vfs_open+0x60>
8040e20c:	0105fa93          	andi	s5,a1,16
8040e210:	ffd00413          	li	s0,-3
8040e214:	f60a90e3          	bnez	s5,8040e174 <vfs_open+0x108>
8040e218:	e89ff06f          	j	8040e0a0 <vfs_open+0x34>
8040e21c:	00412503          	lw	a0,4(sp)
8040e220:	00078413          	mv	s0,a5
8040e224:	e5cff0ef          	jal	ra,8040d880 <inode_open_dec>
8040e228:	00412503          	lw	a0,4(sp)
8040e22c:	d70ff0ef          	jal	ra,8040d79c <inode_ref_dec>
8040e230:	f45ff06f          	j	8040e174 <vfs_open+0x108>
8040e234:	fe900413          	li	s0,-23
8040e238:	f3dff06f          	j	8040e174 <vfs_open+0x108>
8040e23c:	00007697          	auipc	a3,0x7
8040e240:	62468693          	addi	a3,a3,1572 # 80415860 <syscalls+0x814>
8040e244:	00005617          	auipc	a2,0x5
8040e248:	c8460613          	addi	a2,a2,-892 # 80412ec8 <commands+0x1bc>
8040e24c:	03300593          	li	a1,51
8040e250:	00007517          	auipc	a0,0x7
8040e254:	5e050513          	addi	a0,a0,1504 # 80415830 <syscalls+0x7e4>
8040e258:	bccf20ef          	jal	ra,80400624 <__panic>
8040e25c:	00007697          	auipc	a3,0x7
8040e260:	65c68693          	addi	a3,a3,1628 # 804158b8 <syscalls+0x86c>
8040e264:	00005617          	auipc	a2,0x5
8040e268:	c6460613          	addi	a2,a2,-924 # 80412ec8 <commands+0x1bc>
8040e26c:	03a00593          	li	a1,58
8040e270:	00007517          	auipc	a0,0x7
8040e274:	5c050513          	addi	a0,a0,1472 # 80415830 <syscalls+0x7e4>
8040e278:	bacf20ef          	jal	ra,80400624 <__panic>
8040e27c:	00007697          	auipc	a3,0x7
8040e280:	5d468693          	addi	a3,a3,1492 # 80415850 <syscalls+0x804>
8040e284:	00005617          	auipc	a2,0x5
8040e288:	c4460613          	addi	a2,a2,-956 # 80412ec8 <commands+0x1bc>
8040e28c:	03100593          	li	a1,49
8040e290:	00007517          	auipc	a0,0x7
8040e294:	5a050513          	addi	a0,a0,1440 # 80415830 <syscalls+0x7e4>
8040e298:	b8cf20ef          	jal	ra,80400624 <__panic>
8040e29c:	00007697          	auipc	a3,0x7
8040e2a0:	54468693          	addi	a3,a3,1348 # 804157e0 <syscalls+0x794>
8040e2a4:	00005617          	auipc	a2,0x5
8040e2a8:	c2460613          	addi	a2,a2,-988 # 80412ec8 <commands+0x1bc>
8040e2ac:	02c00593          	li	a1,44
8040e2b0:	00007517          	auipc	a0,0x7
8040e2b4:	58050513          	addi	a0,a0,1408 # 80415830 <syscalls+0x7e4>
8040e2b8:	b6cf20ef          	jal	ra,80400624 <__panic>

8040e2bc <vfs_close>:
8040e2bc:	ff010113          	addi	sp,sp,-16
8040e2c0:	00112623          	sw	ra,12(sp)
8040e2c4:	00812423          	sw	s0,8(sp)
8040e2c8:	00050413          	mv	s0,a0
8040e2cc:	db4ff0ef          	jal	ra,8040d880 <inode_open_dec>
8040e2d0:	00040513          	mv	a0,s0
8040e2d4:	cc8ff0ef          	jal	ra,8040d79c <inode_ref_dec>
8040e2d8:	00c12083          	lw	ra,12(sp)
8040e2dc:	00812403          	lw	s0,8(sp)
8040e2e0:	00000513          	li	a0,0
8040e2e4:	01010113          	addi	sp,sp,16
8040e2e8:	00008067          	ret

8040e2ec <get_device>:
8040e2ec:	fe010113          	addi	sp,sp,-32
8040e2f0:	00812c23          	sw	s0,24(sp)
8040e2f4:	00912a23          	sw	s1,20(sp)
8040e2f8:	01212823          	sw	s2,16(sp)
8040e2fc:	00112e23          	sw	ra,28(sp)
8040e300:	00054783          	lbu	a5,0(a0)
8040e304:	00050413          	mv	s0,a0
8040e308:	00058913          	mv	s2,a1
8040e30c:	00060493          	mv	s1,a2
8040e310:	04078263          	beqz	a5,8040e354 <get_device+0x68>
8040e314:	03a00713          	li	a4,58
8040e318:	0ae78463          	beq	a5,a4,8040e3c0 <get_device+0xd4>
8040e31c:	02f00713          	li	a4,47
8040e320:	0ee78e63          	beq	a5,a4,8040e41c <get_device+0x130>
8040e324:	00150693          	addi	a3,a0,1
8040e328:	00000793          	li	a5,0
8040e32c:	03a00813          	li	a6,58
8040e330:	02f00893          	li	a7,47
8040e334:	0140006f          	j	8040e348 <get_device+0x5c>
8040e338:	05070063          	beq	a4,a6,8040e378 <get_device+0x8c>
8040e33c:	00168693          	addi	a3,a3,1
8040e340:	00050793          	mv	a5,a0
8040e344:	01170863          	beq	a4,a7,8040e354 <get_device+0x68>
8040e348:	0006c703          	lbu	a4,0(a3)
8040e34c:	00178513          	addi	a0,a5,1
8040e350:	fe0714e3          	bnez	a4,8040e338 <get_device+0x4c>
8040e354:	00892023          	sw	s0,0(s2)
8040e358:	00048513          	mv	a0,s1
8040e35c:	224000ef          	jal	ra,8040e580 <vfs_get_curdir>
8040e360:	01c12083          	lw	ra,28(sp)
8040e364:	01812403          	lw	s0,24(sp)
8040e368:	01412483          	lw	s1,20(sp)
8040e36c:	01012903          	lw	s2,16(sp)
8040e370:	02010113          	addi	sp,sp,32
8040e374:	00008067          	ret
8040e378:	00278793          	addi	a5,a5,2
8040e37c:	00068023          	sb	zero,0(a3)
8040e380:	00f407b3          	add	a5,s0,a5
8040e384:	02f00693          	li	a3,47
8040e388:	00078513          	mv	a0,a5
8040e38c:	00178793          	addi	a5,a5,1
8040e390:	fff7c703          	lbu	a4,-1(a5)
8040e394:	fed70ae3          	beq	a4,a3,8040e388 <get_device+0x9c>
8040e398:	00a92023          	sw	a0,0(s2)
8040e39c:	00048593          	mv	a1,s1
8040e3a0:	00040513          	mv	a0,s0
8040e3a4:	a3dff0ef          	jal	ra,8040dde0 <vfs_get_root>
8040e3a8:	01c12083          	lw	ra,28(sp)
8040e3ac:	01812403          	lw	s0,24(sp)
8040e3b0:	01412483          	lw	s1,20(sp)
8040e3b4:	01012903          	lw	s2,16(sp)
8040e3b8:	02010113          	addi	sp,sp,32
8040e3bc:	00008067          	ret
8040e3c0:	00c10513          	addi	a0,sp,12
8040e3c4:	1bc000ef          	jal	ra,8040e580 <vfs_get_curdir>
8040e3c8:	fe0510e3          	bnez	a0,8040e3a8 <get_device+0xbc>
8040e3cc:	00c12783          	lw	a5,12(sp)
8040e3d0:	0387a503          	lw	a0,56(a5)
8040e3d4:	04050c63          	beqz	a0,8040e42c <get_device+0x140>
8040e3d8:	07452783          	lw	a5,116(a0)
8040e3dc:	000780e7          	jalr	a5
8040e3e0:	00a4a023          	sw	a0,0(s1)
8040e3e4:	00c12503          	lw	a0,12(sp)
8040e3e8:	bb4ff0ef          	jal	ra,8040d79c <inode_ref_dec>
8040e3ec:	02f00713          	li	a4,47
8040e3f0:	00140413          	addi	s0,s0,1
8040e3f4:	00044783          	lbu	a5,0(s0)
8040e3f8:	fee78ce3          	beq	a5,a4,8040e3f0 <get_device+0x104>
8040e3fc:	00892023          	sw	s0,0(s2)
8040e400:	01c12083          	lw	ra,28(sp)
8040e404:	01812403          	lw	s0,24(sp)
8040e408:	01412483          	lw	s1,20(sp)
8040e40c:	01012903          	lw	s2,16(sp)
8040e410:	00000513          	li	a0,0
8040e414:	02010113          	addi	sp,sp,32
8040e418:	00008067          	ret
8040e41c:	00060513          	mv	a0,a2
8040e420:	e58ff0ef          	jal	ra,8040da78 <vfs_get_bootfs>
8040e424:	fc0504e3          	beqz	a0,8040e3ec <get_device+0x100>
8040e428:	f81ff06f          	j	8040e3a8 <get_device+0xbc>
8040e42c:	00007697          	auipc	a3,0x7
8040e430:	4ec68693          	addi	a3,a3,1260 # 80415918 <syscalls+0x8cc>
8040e434:	00005617          	auipc	a2,0x5
8040e438:	a9460613          	addi	a2,a2,-1388 # 80412ec8 <commands+0x1bc>
8040e43c:	03900593          	li	a1,57
8040e440:	00007517          	auipc	a0,0x7
8040e444:	4ec50513          	addi	a0,a0,1260 # 8041592c <syscalls+0x8e0>
8040e448:	9dcf20ef          	jal	ra,80400624 <__panic>

8040e44c <vfs_lookup>:
8040e44c:	fd010113          	addi	sp,sp,-48
8040e450:	03212023          	sw	s2,32(sp)
8040e454:	01c10613          	addi	a2,sp,28
8040e458:	00058913          	mv	s2,a1
8040e45c:	00c10593          	addi	a1,sp,12
8040e460:	02812423          	sw	s0,40(sp)
8040e464:	02112623          	sw	ra,44(sp)
8040e468:	02912223          	sw	s1,36(sp)
8040e46c:	00a12623          	sw	a0,12(sp)
8040e470:	e7dff0ef          	jal	ra,8040e2ec <get_device>
8040e474:	00050413          	mv	s0,a0
8040e478:	04051e63          	bnez	a0,8040e4d4 <vfs_lookup+0x88>
8040e47c:	00c12783          	lw	a5,12(sp)
8040e480:	01c12483          	lw	s1,28(sp)
8040e484:	0007c783          	lbu	a5,0(a5)
8040e488:	06078463          	beqz	a5,8040e4f0 <vfs_lookup+0xa4>
8040e48c:	08048263          	beqz	s1,8040e510 <vfs_lookup+0xc4>
8040e490:	03c4a783          	lw	a5,60(s1)
8040e494:	06078e63          	beqz	a5,8040e510 <vfs_lookup+0xc4>
8040e498:	0387a783          	lw	a5,56(a5)
8040e49c:	06078a63          	beqz	a5,8040e510 <vfs_lookup+0xc4>
8040e4a0:	00048513          	mv	a0,s1
8040e4a4:	00007597          	auipc	a1,0x7
8040e4a8:	4f058593          	addi	a1,a1,1264 # 80415994 <syscalls+0x948>
8040e4ac:	a24ff0ef          	jal	ra,8040d6d0 <inode_check>
8040e4b0:	03c4a783          	lw	a5,60(s1)
8040e4b4:	00c12583          	lw	a1,12(sp)
8040e4b8:	01c12503          	lw	a0,28(sp)
8040e4bc:	0387a783          	lw	a5,56(a5)
8040e4c0:	00090613          	mv	a2,s2
8040e4c4:	000780e7          	jalr	a5
8040e4c8:	00050413          	mv	s0,a0
8040e4cc:	01c12503          	lw	a0,28(sp)
8040e4d0:	accff0ef          	jal	ra,8040d79c <inode_ref_dec>
8040e4d4:	00040513          	mv	a0,s0
8040e4d8:	02c12083          	lw	ra,44(sp)
8040e4dc:	02812403          	lw	s0,40(sp)
8040e4e0:	02412483          	lw	s1,36(sp)
8040e4e4:	02012903          	lw	s2,32(sp)
8040e4e8:	03010113          	addi	sp,sp,48
8040e4ec:	00008067          	ret
8040e4f0:	00040513          	mv	a0,s0
8040e4f4:	02c12083          	lw	ra,44(sp)
8040e4f8:	02812403          	lw	s0,40(sp)
8040e4fc:	00992023          	sw	s1,0(s2)
8040e500:	02412483          	lw	s1,36(sp)
8040e504:	02012903          	lw	s2,32(sp)
8040e508:	03010113          	addi	sp,sp,48
8040e50c:	00008067          	ret
8040e510:	00007697          	auipc	a3,0x7
8040e514:	43468693          	addi	a3,a3,1076 # 80415944 <syscalls+0x8f8>
8040e518:	00005617          	auipc	a2,0x5
8040e51c:	9b060613          	addi	a2,a2,-1616 # 80412ec8 <commands+0x1bc>
8040e520:	04f00593          	li	a1,79
8040e524:	00007517          	auipc	a0,0x7
8040e528:	40850513          	addi	a0,a0,1032 # 8041592c <syscalls+0x8e0>
8040e52c:	8f8f20ef          	jal	ra,80400624 <__panic>

8040e530 <vfs_lookup_parent>:
8040e530:	fd010113          	addi	sp,sp,-48
8040e534:	02812423          	sw	s0,40(sp)
8040e538:	02912223          	sw	s1,36(sp)
8040e53c:	00058413          	mv	s0,a1
8040e540:	00060493          	mv	s1,a2
8040e544:	00c10593          	addi	a1,sp,12
8040e548:	01c10613          	addi	a2,sp,28
8040e54c:	02112623          	sw	ra,44(sp)
8040e550:	00a12623          	sw	a0,12(sp)
8040e554:	d99ff0ef          	jal	ra,8040e2ec <get_device>
8040e558:	00051a63          	bnez	a0,8040e56c <vfs_lookup_parent+0x3c>
8040e55c:	00c12783          	lw	a5,12(sp)
8040e560:	00f4a023          	sw	a5,0(s1)
8040e564:	01c12783          	lw	a5,28(sp)
8040e568:	00f42023          	sw	a5,0(s0)
8040e56c:	02c12083          	lw	ra,44(sp)
8040e570:	02812403          	lw	s0,40(sp)
8040e574:	02412483          	lw	s1,36(sp)
8040e578:	03010113          	addi	sp,sp,48
8040e57c:	00008067          	ret

8040e580 <vfs_get_curdir>:
8040e580:	0008e797          	auipc	a5,0x8e
8040e584:	22c78793          	addi	a5,a5,556 # 8049c7ac <current>
8040e588:	0007a783          	lw	a5,0(a5)
8040e58c:	ff010113          	addi	sp,sp,-16
8040e590:	00812423          	sw	s0,8(sp)
8040e594:	0dc7a783          	lw	a5,220(a5)
8040e598:	00112623          	sw	ra,12(sp)
8040e59c:	00912223          	sw	s1,4(sp)
8040e5a0:	0007a403          	lw	s0,0(a5)
8040e5a4:	02040663          	beqz	s0,8040e5d0 <vfs_get_curdir+0x50>
8040e5a8:	00050493          	mv	s1,a0
8040e5ac:	00040513          	mv	a0,s0
8040e5b0:	8f8ff0ef          	jal	ra,8040d6a8 <inode_ref_inc>
8040e5b4:	00000513          	li	a0,0
8040e5b8:	0084a023          	sw	s0,0(s1)
8040e5bc:	00c12083          	lw	ra,12(sp)
8040e5c0:	00812403          	lw	s0,8(sp)
8040e5c4:	00412483          	lw	s1,4(sp)
8040e5c8:	01010113          	addi	sp,sp,16
8040e5cc:	00008067          	ret
8040e5d0:	ff000513          	li	a0,-16
8040e5d4:	fe9ff06f          	j	8040e5bc <vfs_get_curdir+0x3c>

8040e5d8 <vfs_set_curdir>:
8040e5d8:	fd010113          	addi	sp,sp,-48
8040e5dc:	02912223          	sw	s1,36(sp)
8040e5e0:	0008e497          	auipc	s1,0x8e
8040e5e4:	1cc48493          	addi	s1,s1,460 # 8049c7ac <current>
8040e5e8:	0004a783          	lw	a5,0(s1)
8040e5ec:	02812423          	sw	s0,40(sp)
8040e5f0:	00050413          	mv	s0,a0
8040e5f4:	0dc7a503          	lw	a0,220(a5)
8040e5f8:	01312e23          	sw	s3,28(sp)
8040e5fc:	02112623          	sw	ra,44(sp)
8040e600:	03212023          	sw	s2,32(sp)
8040e604:	d3df70ef          	jal	ra,80406340 <lock_files>
8040e608:	0004a783          	lw	a5,0(s1)
8040e60c:	0dc7a503          	lw	a0,220(a5)
8040e610:	00052983          	lw	s3,0(a0)
8040e614:	0b340863          	beq	s0,s3,8040e6c4 <vfs_set_curdir+0xec>
8040e618:	08040a63          	beqz	s0,8040e6ac <vfs_set_curdir+0xd4>
8040e61c:	03c42783          	lw	a5,60(s0)
8040e620:	0a078663          	beqz	a5,8040e6cc <vfs_set_curdir+0xf4>
8040e624:	0287a783          	lw	a5,40(a5)
8040e628:	0a078263          	beqz	a5,8040e6cc <vfs_set_curdir+0xf4>
8040e62c:	00007597          	auipc	a1,0x7
8040e630:	43858593          	addi	a1,a1,1080 # 80415a64 <syscalls+0xa18>
8040e634:	00040513          	mv	a0,s0
8040e638:	898ff0ef          	jal	ra,8040d6d0 <inode_check>
8040e63c:	03c42783          	lw	a5,60(s0)
8040e640:	00c10593          	addi	a1,sp,12
8040e644:	00040513          	mv	a0,s0
8040e648:	0287a783          	lw	a5,40(a5)
8040e64c:	000780e7          	jalr	a5
8040e650:	00050913          	mv	s2,a0
8040e654:	00051e63          	bnez	a0,8040e670 <vfs_set_curdir+0x98>
8040e658:	00c12683          	lw	a3,12(sp)
8040e65c:	000077b7          	lui	a5,0x7
8040e660:	00002737          	lui	a4,0x2
8040e664:	00d7f7b3          	and	a5,a5,a3
8040e668:	fee00913          	li	s2,-18
8040e66c:	02e78863          	beq	a5,a4,8040e69c <vfs_set_curdir+0xc4>
8040e670:	0004a783          	lw	a5,0(s1)
8040e674:	0dc7a503          	lw	a0,220(a5) # 70dc <_binary_bin_swap_img_size-0xf24>
8040e678:	cd1f70ef          	jal	ra,80406348 <unlock_files>
8040e67c:	02c12083          	lw	ra,44(sp)
8040e680:	02812403          	lw	s0,40(sp)
8040e684:	00090513          	mv	a0,s2
8040e688:	02412483          	lw	s1,36(sp)
8040e68c:	02012903          	lw	s2,32(sp)
8040e690:	01c12983          	lw	s3,28(sp)
8040e694:	03010113          	addi	sp,sp,48
8040e698:	00008067          	ret
8040e69c:	00040513          	mv	a0,s0
8040e6a0:	808ff0ef          	jal	ra,8040d6a8 <inode_ref_inc>
8040e6a4:	0004a783          	lw	a5,0(s1)
8040e6a8:	0dc7a503          	lw	a0,220(a5)
8040e6ac:	00852023          	sw	s0,0(a0)
8040e6b0:	00000913          	li	s2,0
8040e6b4:	fc0982e3          	beqz	s3,8040e678 <vfs_set_curdir+0xa0>
8040e6b8:	00098513          	mv	a0,s3
8040e6bc:	8e0ff0ef          	jal	ra,8040d79c <inode_ref_dec>
8040e6c0:	fb1ff06f          	j	8040e670 <vfs_set_curdir+0x98>
8040e6c4:	00000913          	li	s2,0
8040e6c8:	fb1ff06f          	j	8040e678 <vfs_set_curdir+0xa0>
8040e6cc:	00007697          	auipc	a3,0x7
8040e6d0:	33068693          	addi	a3,a3,816 # 804159fc <syscalls+0x9b0>
8040e6d4:	00004617          	auipc	a2,0x4
8040e6d8:	7f460613          	addi	a2,a2,2036 # 80412ec8 <commands+0x1bc>
8040e6dc:	04300593          	li	a1,67
8040e6e0:	00007517          	auipc	a0,0x7
8040e6e4:	36c50513          	addi	a0,a0,876 # 80415a4c <syscalls+0xa00>
8040e6e8:	f3df10ef          	jal	ra,80400624 <__panic>

8040e6ec <vfs_chdir>:
8040e6ec:	fe010113          	addi	sp,sp,-32
8040e6f0:	00c10593          	addi	a1,sp,12
8040e6f4:	00812c23          	sw	s0,24(sp)
8040e6f8:	00112e23          	sw	ra,28(sp)
8040e6fc:	d51ff0ef          	jal	ra,8040e44c <vfs_lookup>
8040e700:	00050413          	mv	s0,a0
8040e704:	00050c63          	beqz	a0,8040e71c <vfs_chdir+0x30>
8040e708:	00040513          	mv	a0,s0
8040e70c:	01c12083          	lw	ra,28(sp)
8040e710:	01812403          	lw	s0,24(sp)
8040e714:	02010113          	addi	sp,sp,32
8040e718:	00008067          	ret
8040e71c:	00c12503          	lw	a0,12(sp)
8040e720:	eb9ff0ef          	jal	ra,8040e5d8 <vfs_set_curdir>
8040e724:	00050413          	mv	s0,a0
8040e728:	00c12503          	lw	a0,12(sp)
8040e72c:	870ff0ef          	jal	ra,8040d79c <inode_ref_dec>
8040e730:	00040513          	mv	a0,s0
8040e734:	01c12083          	lw	ra,28(sp)
8040e738:	01812403          	lw	s0,24(sp)
8040e73c:	02010113          	addi	sp,sp,32
8040e740:	00008067          	ret

8040e744 <vfs_getcwd>:
8040e744:	0008e797          	auipc	a5,0x8e
8040e748:	06878793          	addi	a5,a5,104 # 8049c7ac <current>
8040e74c:	0007a783          	lw	a5,0(a5)
8040e750:	fe010113          	addi	sp,sp,-32
8040e754:	00812c23          	sw	s0,24(sp)
8040e758:	0dc7a783          	lw	a5,220(a5)
8040e75c:	00112e23          	sw	ra,28(sp)
8040e760:	00912a23          	sw	s1,20(sp)
8040e764:	0007a403          	lw	s0,0(a5)
8040e768:	01212823          	sw	s2,16(sp)
8040e76c:	0c040663          	beqz	s0,8040e838 <vfs_getcwd+0xf4>
8040e770:	00050493          	mv	s1,a0
8040e774:	00040513          	mv	a0,s0
8040e778:	f31fe0ef          	jal	ra,8040d6a8 <inode_ref_inc>
8040e77c:	03842503          	lw	a0,56(s0)
8040e780:	0c050063          	beqz	a0,8040e840 <vfs_getcwd+0xfc>
8040e784:	f5cff0ef          	jal	ra,8040dee0 <vfs_get_devname>
8040e788:	00050913          	mv	s2,a0
8040e78c:	228040ef          	jal	ra,804129b4 <strlen>
8040e790:	00050613          	mv	a2,a0
8040e794:	00090593          	mv	a1,s2
8040e798:	00000713          	li	a4,0
8040e79c:	00100693          	li	a3,1
8040e7a0:	00048513          	mv	a0,s1
8040e7a4:	e9df70ef          	jal	ra,80406640 <iobuf_move>
8040e7a8:	00050913          	mv	s2,a0
8040e7ac:	02050463          	beqz	a0,8040e7d4 <vfs_getcwd+0x90>
8040e7b0:	00040513          	mv	a0,s0
8040e7b4:	fe9fe0ef          	jal	ra,8040d79c <inode_ref_dec>
8040e7b8:	01c12083          	lw	ra,28(sp)
8040e7bc:	01812403          	lw	s0,24(sp)
8040e7c0:	00090513          	mv	a0,s2
8040e7c4:	01412483          	lw	s1,20(sp)
8040e7c8:	01012903          	lw	s2,16(sp)
8040e7cc:	02010113          	addi	sp,sp,32
8040e7d0:	00008067          	ret
8040e7d4:	03a00793          	li	a5,58
8040e7d8:	00000713          	li	a4,0
8040e7dc:	00100693          	li	a3,1
8040e7e0:	00100613          	li	a2,1
8040e7e4:	00f10593          	addi	a1,sp,15
8040e7e8:	00048513          	mv	a0,s1
8040e7ec:	00f107a3          	sb	a5,15(sp)
8040e7f0:	e51f70ef          	jal	ra,80406640 <iobuf_move>
8040e7f4:	00050913          	mv	s2,a0
8040e7f8:	fa051ce3          	bnez	a0,8040e7b0 <vfs_getcwd+0x6c>
8040e7fc:	03c42783          	lw	a5,60(s0)
8040e800:	06078063          	beqz	a5,8040e860 <vfs_getcwd+0x11c>
8040e804:	01c7a783          	lw	a5,28(a5)
8040e808:	04078c63          	beqz	a5,8040e860 <vfs_getcwd+0x11c>
8040e80c:	00007597          	auipc	a1,0x7
8040e810:	1e458593          	addi	a1,a1,484 # 804159f0 <syscalls+0x9a4>
8040e814:	00040513          	mv	a0,s0
8040e818:	eb9fe0ef          	jal	ra,8040d6d0 <inode_check>
8040e81c:	03c42783          	lw	a5,60(s0)
8040e820:	00048593          	mv	a1,s1
8040e824:	00040513          	mv	a0,s0
8040e828:	01c7a783          	lw	a5,28(a5)
8040e82c:	000780e7          	jalr	a5
8040e830:	00050913          	mv	s2,a0
8040e834:	f7dff06f          	j	8040e7b0 <vfs_getcwd+0x6c>
8040e838:	ff000913          	li	s2,-16
8040e83c:	f7dff06f          	j	8040e7b8 <vfs_getcwd+0x74>
8040e840:	00007697          	auipc	a3,0x7
8040e844:	0d868693          	addi	a3,a3,216 # 80415918 <syscalls+0x8cc>
8040e848:	00004617          	auipc	a2,0x4
8040e84c:	68060613          	addi	a2,a2,1664 # 80412ec8 <commands+0x1bc>
8040e850:	06e00593          	li	a1,110
8040e854:	00007517          	auipc	a0,0x7
8040e858:	1f850513          	addi	a0,a0,504 # 80415a4c <syscalls+0xa00>
8040e85c:	dc9f10ef          	jal	ra,80400624 <__panic>
8040e860:	00007697          	auipc	a3,0x7
8040e864:	13c68693          	addi	a3,a3,316 # 8041599c <syscalls+0x950>
8040e868:	00004617          	auipc	a2,0x4
8040e86c:	66060613          	addi	a2,a2,1632 # 80412ec8 <commands+0x1bc>
8040e870:	07800593          	li	a1,120
8040e874:	00007517          	auipc	a0,0x7
8040e878:	1d850513          	addi	a0,a0,472 # 80415a4c <syscalls+0xa00>
8040e87c:	da9f10ef          	jal	ra,80400624 <__panic>

8040e880 <dev_lookup>:
8040e880:	0005c703          	lbu	a4,0(a1)
8040e884:	02071e63          	bnez	a4,8040e8c0 <dev_lookup+0x40>
8040e888:	ff010113          	addi	sp,sp,-16
8040e88c:	00812423          	sw	s0,8(sp)
8040e890:	00912223          	sw	s1,4(sp)
8040e894:	00112623          	sw	ra,12(sp)
8040e898:	00050493          	mv	s1,a0
8040e89c:	00060413          	mv	s0,a2
8040e8a0:	e09fe0ef          	jal	ra,8040d6a8 <inode_ref_inc>
8040e8a4:	00c12083          	lw	ra,12(sp)
8040e8a8:	00942023          	sw	s1,0(s0)
8040e8ac:	00812403          	lw	s0,8(sp)
8040e8b0:	00412483          	lw	s1,4(sp)
8040e8b4:	00000513          	li	a0,0
8040e8b8:	01010113          	addi	sp,sp,16
8040e8bc:	00008067          	ret
8040e8c0:	ff000513          	li	a0,-16
8040e8c4:	00008067          	ret

8040e8c8 <dev_ioctl>:
8040e8c8:	00050e63          	beqz	a0,8040e8e4 <dev_ioctl+0x1c>
8040e8cc:	02c52683          	lw	a3,44(a0)
8040e8d0:	00001737          	lui	a4,0x1
8040e8d4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e8d8:	00e69663          	bne	a3,a4,8040e8e4 <dev_ioctl+0x1c>
8040e8dc:	01452303          	lw	t1,20(a0)
8040e8e0:	00030067          	jr	t1
8040e8e4:	ff010113          	addi	sp,sp,-16
8040e8e8:	00007697          	auipc	a3,0x7
8040e8ec:	ea068693          	addi	a3,a3,-352 # 80415788 <syscalls+0x73c>
8040e8f0:	00004617          	auipc	a2,0x4
8040e8f4:	5d860613          	addi	a2,a2,1496 # 80412ec8 <commands+0x1bc>
8040e8f8:	03500593          	li	a1,53
8040e8fc:	00007517          	auipc	a0,0x7
8040e900:	17050513          	addi	a0,a0,368 # 80415a6c <syscalls+0xa20>
8040e904:	00112623          	sw	ra,12(sp)
8040e908:	d1df10ef          	jal	ra,80400624 <__panic>

8040e90c <dev_tryseek>:
8040e90c:	ff010113          	addi	sp,sp,-16
8040e910:	00112623          	sw	ra,12(sp)
8040e914:	00812423          	sw	s0,8(sp)
8040e918:	00912223          	sw	s1,4(sp)
8040e91c:	01212023          	sw	s2,0(sp)
8040e920:	06050663          	beqz	a0,8040e98c <dev_tryseek+0x80>
8040e924:	02c52703          	lw	a4,44(a0)
8040e928:	000017b7          	lui	a5,0x1
8040e92c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e930:	04f71e63          	bne	a4,a5,8040e98c <dev_tryseek+0x80>
8040e934:	00052483          	lw	s1,0(a0)
8040e938:	04048663          	beqz	s1,8040e984 <dev_tryseek+0x78>
8040e93c:	00452903          	lw	s2,4(a0)
8040e940:	00058413          	mv	s0,a1
8040e944:	00058513          	mv	a0,a1
8040e948:	00090593          	mv	a1,s2
8040e94c:	254040ef          	jal	ra,80412ba0 <__umodsi3>
8040e950:	02051a63          	bnez	a0,8040e984 <dev_tryseek+0x78>
8040e954:	02044863          	bltz	s0,8040e984 <dev_tryseek+0x78>
8040e958:	00090593          	mv	a1,s2
8040e95c:	00048513          	mv	a0,s1
8040e960:	1cc040ef          	jal	ra,80412b2c <__mulsi3>
8040e964:	02a47063          	bgeu	s0,a0,8040e984 <dev_tryseek+0x78>
8040e968:	00000513          	li	a0,0
8040e96c:	00c12083          	lw	ra,12(sp)
8040e970:	00812403          	lw	s0,8(sp)
8040e974:	00412483          	lw	s1,4(sp)
8040e978:	00012903          	lw	s2,0(sp)
8040e97c:	01010113          	addi	sp,sp,16
8040e980:	00008067          	ret
8040e984:	ffd00513          	li	a0,-3
8040e988:	fe5ff06f          	j	8040e96c <dev_tryseek+0x60>
8040e98c:	00007697          	auipc	a3,0x7
8040e990:	dfc68693          	addi	a3,a3,-516 # 80415788 <syscalls+0x73c>
8040e994:	00004617          	auipc	a2,0x4
8040e998:	53460613          	addi	a2,a2,1332 # 80412ec8 <commands+0x1bc>
8040e99c:	05f00593          	li	a1,95
8040e9a0:	00007517          	auipc	a0,0x7
8040e9a4:	0cc50513          	addi	a0,a0,204 # 80415a6c <syscalls+0xa20>
8040e9a8:	c7df10ef          	jal	ra,80400624 <__panic>

8040e9ac <dev_gettype>:
8040e9ac:	02050e63          	beqz	a0,8040e9e8 <dev_gettype+0x3c>
8040e9b0:	02c52703          	lw	a4,44(a0)
8040e9b4:	000017b7          	lui	a5,0x1
8040e9b8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e9bc:	02f71663          	bne	a4,a5,8040e9e8 <dev_gettype+0x3c>
8040e9c0:	00052703          	lw	a4,0(a0)
8040e9c4:	000057b7          	lui	a5,0x5
8040e9c8:	00070863          	beqz	a4,8040e9d8 <dev_gettype+0x2c>
8040e9cc:	00f5a023          	sw	a5,0(a1)
8040e9d0:	00000513          	li	a0,0
8040e9d4:	00008067          	ret
8040e9d8:	000047b7          	lui	a5,0x4
8040e9dc:	00f5a023          	sw	a5,0(a1)
8040e9e0:	00000513          	li	a0,0
8040e9e4:	00008067          	ret
8040e9e8:	ff010113          	addi	sp,sp,-16
8040e9ec:	00007697          	auipc	a3,0x7
8040e9f0:	d9c68693          	addi	a3,a3,-612 # 80415788 <syscalls+0x73c>
8040e9f4:	00004617          	auipc	a2,0x4
8040e9f8:	4d460613          	addi	a2,a2,1236 # 80412ec8 <commands+0x1bc>
8040e9fc:	05300593          	li	a1,83
8040ea00:	00007517          	auipc	a0,0x7
8040ea04:	06c50513          	addi	a0,a0,108 # 80415a6c <syscalls+0xa20>
8040ea08:	00112623          	sw	ra,12(sp)
8040ea0c:	c19f10ef          	jal	ra,80400624 <__panic>

8040ea10 <dev_write>:
8040ea10:	02050063          	beqz	a0,8040ea30 <dev_write+0x20>
8040ea14:	02c52683          	lw	a3,44(a0)
8040ea18:	00001737          	lui	a4,0x1
8040ea1c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ea20:	00e69863          	bne	a3,a4,8040ea30 <dev_write+0x20>
8040ea24:	01052303          	lw	t1,16(a0)
8040ea28:	00100613          	li	a2,1
8040ea2c:	00030067          	jr	t1
8040ea30:	ff010113          	addi	sp,sp,-16
8040ea34:	00007697          	auipc	a3,0x7
8040ea38:	d5468693          	addi	a3,a3,-684 # 80415788 <syscalls+0x73c>
8040ea3c:	00004617          	auipc	a2,0x4
8040ea40:	48c60613          	addi	a2,a2,1164 # 80412ec8 <commands+0x1bc>
8040ea44:	02c00593          	li	a1,44
8040ea48:	00007517          	auipc	a0,0x7
8040ea4c:	02450513          	addi	a0,a0,36 # 80415a6c <syscalls+0xa20>
8040ea50:	00112623          	sw	ra,12(sp)
8040ea54:	bd1f10ef          	jal	ra,80400624 <__panic>

8040ea58 <dev_read>:
8040ea58:	02050063          	beqz	a0,8040ea78 <dev_read+0x20>
8040ea5c:	02c52683          	lw	a3,44(a0)
8040ea60:	00001737          	lui	a4,0x1
8040ea64:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ea68:	00e69863          	bne	a3,a4,8040ea78 <dev_read+0x20>
8040ea6c:	01052303          	lw	t1,16(a0)
8040ea70:	00000613          	li	a2,0
8040ea74:	00030067          	jr	t1
8040ea78:	ff010113          	addi	sp,sp,-16
8040ea7c:	00007697          	auipc	a3,0x7
8040ea80:	d0c68693          	addi	a3,a3,-756 # 80415788 <syscalls+0x73c>
8040ea84:	00004617          	auipc	a2,0x4
8040ea88:	44460613          	addi	a2,a2,1092 # 80412ec8 <commands+0x1bc>
8040ea8c:	02300593          	li	a1,35
8040ea90:	00007517          	auipc	a0,0x7
8040ea94:	fdc50513          	addi	a0,a0,-36 # 80415a6c <syscalls+0xa20>
8040ea98:	00112623          	sw	ra,12(sp)
8040ea9c:	b89f10ef          	jal	ra,80400624 <__panic>

8040eaa0 <dev_close>:
8040eaa0:	00050e63          	beqz	a0,8040eabc <dev_close+0x1c>
8040eaa4:	02c52683          	lw	a3,44(a0)
8040eaa8:	00001737          	lui	a4,0x1
8040eaac:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040eab0:	00e69663          	bne	a3,a4,8040eabc <dev_close+0x1c>
8040eab4:	00c52303          	lw	t1,12(a0)
8040eab8:	00030067          	jr	t1
8040eabc:	ff010113          	addi	sp,sp,-16
8040eac0:	00007697          	auipc	a3,0x7
8040eac4:	cc868693          	addi	a3,a3,-824 # 80415788 <syscalls+0x73c>
8040eac8:	00004617          	auipc	a2,0x4
8040eacc:	40060613          	addi	a2,a2,1024 # 80412ec8 <commands+0x1bc>
8040ead0:	01a00593          	li	a1,26
8040ead4:	00007517          	auipc	a0,0x7
8040ead8:	f9850513          	addi	a0,a0,-104 # 80415a6c <syscalls+0xa20>
8040eadc:	00112623          	sw	ra,12(sp)
8040eae0:	b45f10ef          	jal	ra,80400624 <__panic>

8040eae4 <dev_open>:
8040eae4:	03c5f713          	andi	a4,a1,60
8040eae8:	02071063          	bnez	a4,8040eb08 <dev_open+0x24>
8040eaec:	02050263          	beqz	a0,8040eb10 <dev_open+0x2c>
8040eaf0:	02c52683          	lw	a3,44(a0)
8040eaf4:	00001737          	lui	a4,0x1
8040eaf8:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040eafc:	00e69a63          	bne	a3,a4,8040eb10 <dev_open+0x2c>
8040eb00:	00852303          	lw	t1,8(a0)
8040eb04:	00030067          	jr	t1
8040eb08:	ffd00513          	li	a0,-3
8040eb0c:	00008067          	ret
8040eb10:	ff010113          	addi	sp,sp,-16
8040eb14:	00007697          	auipc	a3,0x7
8040eb18:	c7468693          	addi	a3,a3,-908 # 80415788 <syscalls+0x73c>
8040eb1c:	00004617          	auipc	a2,0x4
8040eb20:	3ac60613          	addi	a2,a2,940 # 80412ec8 <commands+0x1bc>
8040eb24:	01100593          	li	a1,17
8040eb28:	00007517          	auipc	a0,0x7
8040eb2c:	f4450513          	addi	a0,a0,-188 # 80415a6c <syscalls+0xa20>
8040eb30:	00112623          	sw	ra,12(sp)
8040eb34:	af1f10ef          	jal	ra,80400624 <__panic>

8040eb38 <dev_fstat>:
8040eb38:	ff010113          	addi	sp,sp,-16
8040eb3c:	00912223          	sw	s1,4(sp)
8040eb40:	00058493          	mv	s1,a1
8040eb44:	00812423          	sw	s0,8(sp)
8040eb48:	01000613          	li	a2,16
8040eb4c:	00050413          	mv	s0,a0
8040eb50:	00000593          	li	a1,0
8040eb54:	00048513          	mv	a0,s1
8040eb58:	00112623          	sw	ra,12(sp)
8040eb5c:	01212023          	sw	s2,0(sp)
8040eb60:	739030ef          	jal	ra,80412a98 <memset>
8040eb64:	08040463          	beqz	s0,8040ebec <dev_fstat+0xb4>
8040eb68:	03c42783          	lw	a5,60(s0)
8040eb6c:	08078063          	beqz	a5,8040ebec <dev_fstat+0xb4>
8040eb70:	0287a783          	lw	a5,40(a5) # 4028 <_binary_bin_swap_img_size-0x3fd8>
8040eb74:	06078c63          	beqz	a5,8040ebec <dev_fstat+0xb4>
8040eb78:	00007597          	auipc	a1,0x7
8040eb7c:	eec58593          	addi	a1,a1,-276 # 80415a64 <syscalls+0xa18>
8040eb80:	00040513          	mv	a0,s0
8040eb84:	b4dfe0ef          	jal	ra,8040d6d0 <inode_check>
8040eb88:	03c42783          	lw	a5,60(s0)
8040eb8c:	00048593          	mv	a1,s1
8040eb90:	00040513          	mv	a0,s0
8040eb94:	0287a783          	lw	a5,40(a5)
8040eb98:	000780e7          	jalr	a5
8040eb9c:	00050913          	mv	s2,a0
8040eba0:	02051863          	bnez	a0,8040ebd0 <dev_fstat+0x98>
8040eba4:	02c42703          	lw	a4,44(s0)
8040eba8:	000017b7          	lui	a5,0x1
8040ebac:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ebb0:	04f71e63          	bne	a4,a5,8040ec0c <dev_fstat+0xd4>
8040ebb4:	00042583          	lw	a1,0(s0)
8040ebb8:	00442503          	lw	a0,4(s0)
8040ebbc:	00100793          	li	a5,1
8040ebc0:	00f4a223          	sw	a5,4(s1)
8040ebc4:	00b4a423          	sw	a1,8(s1)
8040ebc8:	765030ef          	jal	ra,80412b2c <__mulsi3>
8040ebcc:	00a4a623          	sw	a0,12(s1)
8040ebd0:	00c12083          	lw	ra,12(sp)
8040ebd4:	00812403          	lw	s0,8(sp)
8040ebd8:	00090513          	mv	a0,s2
8040ebdc:	00412483          	lw	s1,4(sp)
8040ebe0:	00012903          	lw	s2,0(sp)
8040ebe4:	01010113          	addi	sp,sp,16
8040ebe8:	00008067          	ret
8040ebec:	00007697          	auipc	a3,0x7
8040ebf0:	e1068693          	addi	a3,a3,-496 # 804159fc <syscalls+0x9b0>
8040ebf4:	00004617          	auipc	a2,0x4
8040ebf8:	2d460613          	addi	a2,a2,724 # 80412ec8 <commands+0x1bc>
8040ebfc:	04200593          	li	a1,66
8040ec00:	00007517          	auipc	a0,0x7
8040ec04:	e6c50513          	addi	a0,a0,-404 # 80415a6c <syscalls+0xa20>
8040ec08:	a1df10ef          	jal	ra,80400624 <__panic>
8040ec0c:	00007697          	auipc	a3,0x7
8040ec10:	b7c68693          	addi	a3,a3,-1156 # 80415788 <syscalls+0x73c>
8040ec14:	00004617          	auipc	a2,0x4
8040ec18:	2b460613          	addi	a2,a2,692 # 80412ec8 <commands+0x1bc>
8040ec1c:	04500593          	li	a1,69
8040ec20:	00007517          	auipc	a0,0x7
8040ec24:	e4c50513          	addi	a0,a0,-436 # 80415a6c <syscalls+0xa20>
8040ec28:	9fdf10ef          	jal	ra,80400624 <__panic>

8040ec2c <dev_init>:
8040ec2c:	ff010113          	addi	sp,sp,-16
8040ec30:	00112623          	sw	ra,12(sp)
8040ec34:	700000ef          	jal	ra,8040f334 <dev_init_stdin>
8040ec38:	081000ef          	jal	ra,8040f4b8 <dev_init_stdout>
8040ec3c:	00c12083          	lw	ra,12(sp)
8040ec40:	01010113          	addi	sp,sp,16
8040ec44:	2bc0006f          	j	8040ef00 <dev_init_disk0>

8040ec48 <dev_create_inode>:
8040ec48:	00001537          	lui	a0,0x1
8040ec4c:	ff010113          	addi	sp,sp,-16
8040ec50:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ec54:	00812423          	sw	s0,8(sp)
8040ec58:	00112623          	sw	ra,12(sp)
8040ec5c:	9a1fe0ef          	jal	ra,8040d5fc <__alloc_inode>
8040ec60:	00050413          	mv	s0,a0
8040ec64:	00050a63          	beqz	a0,8040ec78 <dev_create_inode+0x30>
8040ec68:	00000613          	li	a2,0
8040ec6c:	00007597          	auipc	a1,0x7
8040ec70:	e1458593          	addi	a1,a1,-492 # 80415a80 <dev_node_ops>
8040ec74:	9b9fe0ef          	jal	ra,8040d62c <inode_init>
8040ec78:	00040513          	mv	a0,s0
8040ec7c:	00c12083          	lw	ra,12(sp)
8040ec80:	00812403          	lw	s0,8(sp)
8040ec84:	01010113          	addi	sp,sp,16
8040ec88:	00008067          	ret

8040ec8c <disk0_open>:
8040ec8c:	00000513          	li	a0,0
8040ec90:	00008067          	ret

8040ec94 <disk0_close>:
8040ec94:	00000513          	li	a0,0
8040ec98:	00008067          	ret

8040ec9c <disk0_ioctl>:
8040ec9c:	fec00513          	li	a0,-20
8040eca0:	00008067          	ret

8040eca4 <disk0_io>:
8040eca4:	fc010113          	addi	sp,sp,-64
8040eca8:	0045a703          	lw	a4,4(a1)
8040ecac:	02812c23          	sw	s0,56(sp)
8040ecb0:	00c5a403          	lw	s0,12(a1)
8040ecb4:	000016b7          	lui	a3,0x1
8040ecb8:	03312623          	sw	s3,44(sp)
8040ecbc:	03612023          	sw	s6,32(sp)
8040ecc0:	41f75993          	srai	s3,a4,0x1f
8040ecc4:	fff68b13          	addi	s6,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040ecc8:	008767b3          	or	a5,a4,s0
8040eccc:	0169f9b3          	and	s3,s3,s6
8040ecd0:	02112e23          	sw	ra,60(sp)
8040ecd4:	02912a23          	sw	s1,52(sp)
8040ecd8:	03212823          	sw	s2,48(sp)
8040ecdc:	03412423          	sw	s4,40(sp)
8040ece0:	03512223          	sw	s5,36(sp)
8040ece4:	01712e23          	sw	s7,28(sp)
8040ece8:	01812c23          	sw	s8,24(sp)
8040ecec:	01912a23          	sw	s9,20(sp)
8040ecf0:	01a12823          	sw	s10,16(sp)
8040ecf4:	0167f7b3          	and	a5,a5,s6
8040ecf8:	00e989b3          	add	s3,s3,a4
8040ecfc:	16079263          	bnez	a5,8040ee60 <disk0_io+0x1bc>
8040ed00:	00052783          	lw	a5,0(a0)
8040ed04:	40c9d993          	srai	s3,s3,0xc
8040ed08:	00c45713          	srli	a4,s0,0xc
8040ed0c:	00e98733          	add	a4,s3,a4
8040ed10:	14e7e863          	bltu	a5,a4,8040ee60 <disk0_io+0x1bc>
8040ed14:	00000513          	li	a0,0
8040ed18:	02d47e63          	bgeu	s0,a3,8040ed54 <disk0_io+0xb0>
8040ed1c:	03c12083          	lw	ra,60(sp)
8040ed20:	03812403          	lw	s0,56(sp)
8040ed24:	03412483          	lw	s1,52(sp)
8040ed28:	03012903          	lw	s2,48(sp)
8040ed2c:	02c12983          	lw	s3,44(sp)
8040ed30:	02812a03          	lw	s4,40(sp)
8040ed34:	02412a83          	lw	s5,36(sp)
8040ed38:	02012b03          	lw	s6,32(sp)
8040ed3c:	01c12b83          	lw	s7,28(sp)
8040ed40:	01812c03          	lw	s8,24(sp)
8040ed44:	01412c83          	lw	s9,20(sp)
8040ed48:	01012d03          	lw	s10,16(sp)
8040ed4c:	04010113          	addi	sp,sp,64
8040ed50:	00008067          	ret
8040ed54:	0008d517          	auipc	a0,0x8d
8040ed58:	a2050513          	addi	a0,a0,-1504 # 8049b774 <disk0_sem>
8040ed5c:	00060c13          	mv	s8,a2
8040ed60:	00058b93          	mv	s7,a1
8040ed64:	0008ea17          	auipc	s4,0x8e
8040ed68:	a74a0a13          	addi	s4,s4,-1420 # 8049c7d8 <disk0_buffer>
8040ed6c:	c6cf60ef          	jal	ra,804051d8 <down>
8040ed70:	00004cb7          	lui	s9,0x4
8040ed74:	0600006f          	j	8040edd4 <disk0_io+0x130>
8040ed78:	00c45493          	srli	s1,s0,0xc
8040ed7c:	00349d13          	slli	s10,s1,0x3
8040ed80:	00040913          	mv	s2,s0
8040ed84:	00399a93          	slli	s5,s3,0x3
8040ed88:	00058613          	mv	a2,a1
8040ed8c:	000d0693          	mv	a3,s10
8040ed90:	000a8593          	mv	a1,s5
8040ed94:	00200513          	li	a0,2
8040ed98:	d4df10ef          	jal	ra,80400ae4 <ide_read_secs>
8040ed9c:	10051663          	bnez	a0,8040eea8 <disk0_io+0x204>
8040eda0:	000a2583          	lw	a1,0(s4)
8040eda4:	00c10713          	addi	a4,sp,12
8040eda8:	00100693          	li	a3,1
8040edac:	00090613          	mv	a2,s2
8040edb0:	000b8513          	mv	a0,s7
8040edb4:	88df70ef          	jal	ra,80406640 <iobuf_move>
8040edb8:	00c12783          	lw	a5,12(sp)
8040edbc:	0b279663          	bne	a5,s2,8040ee68 <disk0_io+0x1c4>
8040edc0:	016977b3          	and	a5,s2,s6
8040edc4:	0a079263          	bnez	a5,8040ee68 <disk0_io+0x1c4>
8040edc8:	41240433          	sub	s0,s0,s2
8040edcc:	009989b3          	add	s3,s3,s1
8040edd0:	06040e63          	beqz	s0,8040ee4c <disk0_io+0x1a8>
8040edd4:	000a2583          	lw	a1,0(s4)
8040edd8:	000c1c63          	bnez	s8,8040edf0 <disk0_io+0x14c>
8040eddc:	f9946ee3          	bltu	s0,s9,8040ed78 <disk0_io+0xd4>
8040ede0:	02000d13          	li	s10,32
8040ede4:	00400493          	li	s1,4
8040ede8:	00004937          	lui	s2,0x4
8040edec:	f99ff06f          	j	8040ed84 <disk0_io+0xe0>
8040edf0:	00c10713          	addi	a4,sp,12
8040edf4:	00000693          	li	a3,0
8040edf8:	00004637          	lui	a2,0x4
8040edfc:	000b8513          	mv	a0,s7
8040ee00:	841f70ef          	jal	ra,80406640 <iobuf_move>
8040ee04:	00c12483          	lw	s1,12(sp)
8040ee08:	08048063          	beqz	s1,8040ee88 <disk0_io+0x1e4>
8040ee0c:	06946e63          	bltu	s0,s1,8040ee88 <disk0_io+0x1e4>
8040ee10:	0164f7b3          	and	a5,s1,s6
8040ee14:	06079a63          	bnez	a5,8040ee88 <disk0_io+0x1e4>
8040ee18:	00c4d493          	srli	s1,s1,0xc
8040ee1c:	000a2603          	lw	a2,0(s4)
8040ee20:	00399913          	slli	s2,s3,0x3
8040ee24:	00349a93          	slli	s5,s1,0x3
8040ee28:	000a8693          	mv	a3,s5
8040ee2c:	00090593          	mv	a1,s2
8040ee30:	00200513          	li	a0,2
8040ee34:	d49f10ef          	jal	ra,80400b7c <ide_write_secs>
8040ee38:	08051e63          	bnez	a0,8040eed4 <disk0_io+0x230>
8040ee3c:	00c12903          	lw	s2,12(sp)
8040ee40:	009989b3          	add	s3,s3,s1
8040ee44:	41240433          	sub	s0,s0,s2
8040ee48:	f80416e3          	bnez	s0,8040edd4 <disk0_io+0x130>
8040ee4c:	0008d517          	auipc	a0,0x8d
8040ee50:	92850513          	addi	a0,a0,-1752 # 8049b774 <disk0_sem>
8040ee54:	b80f60ef          	jal	ra,804051d4 <up>
8040ee58:	00000513          	li	a0,0
8040ee5c:	ec1ff06f          	j	8040ed1c <disk0_io+0x78>
8040ee60:	ffd00513          	li	a0,-3
8040ee64:	eb9ff06f          	j	8040ed1c <disk0_io+0x78>
8040ee68:	00007697          	auipc	a3,0x7
8040ee6c:	dc468693          	addi	a3,a3,-572 # 80415c2c <dev_node_ops+0x1ac>
8040ee70:	00004617          	auipc	a2,0x4
8040ee74:	05860613          	addi	a2,a2,88 # 80412ec8 <commands+0x1bc>
8040ee78:	06200593          	li	a1,98
8040ee7c:	00007517          	auipc	a0,0x7
8040ee80:	d0050513          	addi	a0,a0,-768 # 80415b7c <dev_node_ops+0xfc>
8040ee84:	fa0f10ef          	jal	ra,80400624 <__panic>
8040ee88:	00007697          	auipc	a3,0x7
8040ee8c:	cb468693          	addi	a3,a3,-844 # 80415b3c <dev_node_ops+0xbc>
8040ee90:	00004617          	auipc	a2,0x4
8040ee94:	03860613          	addi	a2,a2,56 # 80412ec8 <commands+0x1bc>
8040ee98:	05700593          	li	a1,87
8040ee9c:	00007517          	auipc	a0,0x7
8040eea0:	ce050513          	addi	a0,a0,-800 # 80415b7c <dev_node_ops+0xfc>
8040eea4:	f80f10ef          	jal	ra,80400624 <__panic>
8040eea8:	00050893          	mv	a7,a0
8040eeac:	000d0813          	mv	a6,s10
8040eeb0:	00048793          	mv	a5,s1
8040eeb4:	000a8713          	mv	a4,s5
8040eeb8:	00098693          	mv	a3,s3
8040eebc:	00007617          	auipc	a2,0x7
8040eec0:	d2860613          	addi	a2,a2,-728 # 80415be4 <dev_node_ops+0x164>
8040eec4:	02e00593          	li	a1,46
8040eec8:	00007517          	auipc	a0,0x7
8040eecc:	cb450513          	addi	a0,a0,-844 # 80415b7c <dev_node_ops+0xfc>
8040eed0:	f54f10ef          	jal	ra,80400624 <__panic>
8040eed4:	00050893          	mv	a7,a0
8040eed8:	000a8813          	mv	a6,s5
8040eedc:	00048793          	mv	a5,s1
8040eee0:	00090713          	mv	a4,s2
8040eee4:	00098693          	mv	a3,s3
8040eee8:	00007617          	auipc	a2,0x7
8040eeec:	cb060613          	addi	a2,a2,-848 # 80415b98 <dev_node_ops+0x118>
8040eef0:	03800593          	li	a1,56
8040eef4:	00007517          	auipc	a0,0x7
8040eef8:	c8850513          	addi	a0,a0,-888 # 80415b7c <dev_node_ops+0xfc>
8040eefc:	f28f10ef          	jal	ra,80400624 <__panic>

8040ef00 <dev_init_disk0>:
8040ef00:	ff010113          	addi	sp,sp,-16
8040ef04:	00112623          	sw	ra,12(sp)
8040ef08:	00812423          	sw	s0,8(sp)
8040ef0c:	00912223          	sw	s1,4(sp)
8040ef10:	d39ff0ef          	jal	ra,8040ec48 <dev_create_inode>
8040ef14:	0a050c63          	beqz	a0,8040efcc <dev_init_disk0+0xcc>
8040ef18:	02c52703          	lw	a4,44(a0)
8040ef1c:	000014b7          	lui	s1,0x1
8040ef20:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ef24:	00050413          	mv	s0,a0
8040ef28:	10f71463          	bne	a4,a5,8040f030 <dev_init_disk0+0x130>
8040ef2c:	00200513          	li	a0,2
8040ef30:	b49f10ef          	jal	ra,80400a78 <ide_device_valid>
8040ef34:	0e050263          	beqz	a0,8040f018 <dev_init_disk0+0x118>
8040ef38:	00200513          	li	a0,2
8040ef3c:	b71f10ef          	jal	ra,80400aac <ide_device_size>
8040ef40:	00355793          	srli	a5,a0,0x3
8040ef44:	00f42023          	sw	a5,0(s0)
8040ef48:	00000797          	auipc	a5,0x0
8040ef4c:	d4478793          	addi	a5,a5,-700 # 8040ec8c <disk0_open>
8040ef50:	00f42423          	sw	a5,8(s0)
8040ef54:	00000797          	auipc	a5,0x0
8040ef58:	d4078793          	addi	a5,a5,-704 # 8040ec94 <disk0_close>
8040ef5c:	00f42623          	sw	a5,12(s0)
8040ef60:	00000797          	auipc	a5,0x0
8040ef64:	d4478793          	addi	a5,a5,-700 # 8040eca4 <disk0_io>
8040ef68:	00f42823          	sw	a5,16(s0)
8040ef6c:	00000797          	auipc	a5,0x0
8040ef70:	d3078793          	addi	a5,a5,-720 # 8040ec9c <disk0_ioctl>
8040ef74:	00f42a23          	sw	a5,20(s0)
8040ef78:	00100593          	li	a1,1
8040ef7c:	0008c517          	auipc	a0,0x8c
8040ef80:	7f850513          	addi	a0,a0,2040 # 8049b774 <disk0_sem>
8040ef84:	00942223          	sw	s1,4(s0)
8040ef88:	a40f60ef          	jal	ra,804051c8 <sem_init>
8040ef8c:	00004537          	lui	a0,0x4
8040ef90:	a31f30ef          	jal	ra,804029c0 <kmalloc>
8040ef94:	0008e797          	auipc	a5,0x8e
8040ef98:	84a7a223          	sw	a0,-1980(a5) # 8049c7d8 <disk0_buffer>
8040ef9c:	06050263          	beqz	a0,8040f000 <dev_init_disk0+0x100>
8040efa0:	00100613          	li	a2,1
8040efa4:	00040593          	mv	a1,s0
8040efa8:	00007517          	auipc	a0,0x7
8040efac:	b7050513          	addi	a0,a0,-1168 # 80415b18 <dev_node_ops+0x98>
8040efb0:	f8dfe0ef          	jal	ra,8040df3c <vfs_add_dev>
8040efb4:	02051863          	bnez	a0,8040efe4 <dev_init_disk0+0xe4>
8040efb8:	00c12083          	lw	ra,12(sp)
8040efbc:	00812403          	lw	s0,8(sp)
8040efc0:	00412483          	lw	s1,4(sp)
8040efc4:	01010113          	addi	sp,sp,16
8040efc8:	00008067          	ret
8040efcc:	00007617          	auipc	a2,0x7
8040efd0:	af460613          	addi	a2,a2,-1292 # 80415ac0 <dev_node_ops+0x40>
8040efd4:	08700593          	li	a1,135
8040efd8:	00007517          	auipc	a0,0x7
8040efdc:	ba450513          	addi	a0,a0,-1116 # 80415b7c <dev_node_ops+0xfc>
8040efe0:	e44f10ef          	jal	ra,80400624 <__panic>
8040efe4:	00050693          	mv	a3,a0
8040efe8:	00007617          	auipc	a2,0x7
8040efec:	b3860613          	addi	a2,a2,-1224 # 80415b20 <dev_node_ops+0xa0>
8040eff0:	08d00593          	li	a1,141
8040eff4:	00007517          	auipc	a0,0x7
8040eff8:	b8850513          	addi	a0,a0,-1144 # 80415b7c <dev_node_ops+0xfc>
8040effc:	e28f10ef          	jal	ra,80400624 <__panic>
8040f000:	00007617          	auipc	a2,0x7
8040f004:	afc60613          	addi	a2,a2,-1284 # 80415afc <dev_node_ops+0x7c>
8040f008:	07f00593          	li	a1,127
8040f00c:	00007517          	auipc	a0,0x7
8040f010:	b7050513          	addi	a0,a0,-1168 # 80415b7c <dev_node_ops+0xfc>
8040f014:	e10f10ef          	jal	ra,80400624 <__panic>
8040f018:	00007617          	auipc	a2,0x7
8040f01c:	ac460613          	addi	a2,a2,-1340 # 80415adc <dev_node_ops+0x5c>
8040f020:	07300593          	li	a1,115
8040f024:	00007517          	auipc	a0,0x7
8040f028:	b5850513          	addi	a0,a0,-1192 # 80415b7c <dev_node_ops+0xfc>
8040f02c:	df8f10ef          	jal	ra,80400624 <__panic>
8040f030:	00006697          	auipc	a3,0x6
8040f034:	75868693          	addi	a3,a3,1880 # 80415788 <syscalls+0x73c>
8040f038:	00004617          	auipc	a2,0x4
8040f03c:	e9060613          	addi	a2,a2,-368 # 80412ec8 <commands+0x1bc>
8040f040:	08900593          	li	a1,137
8040f044:	00007517          	auipc	a0,0x7
8040f048:	b3850513          	addi	a0,a0,-1224 # 80415b7c <dev_node_ops+0xfc>
8040f04c:	dd8f10ef          	jal	ra,80400624 <__panic>

8040f050 <stdin_open>:
8040f050:	00000513          	li	a0,0
8040f054:	00059463          	bnez	a1,8040f05c <stdin_open+0xc>
8040f058:	00008067          	ret
8040f05c:	ffd00513          	li	a0,-3
8040f060:	00008067          	ret

8040f064 <stdin_close>:
8040f064:	00000513          	li	a0,0
8040f068:	00008067          	ret

8040f06c <stdin_ioctl>:
8040f06c:	ffd00513          	li	a0,-3
8040f070:	00008067          	ret

8040f074 <stdin_io>:
8040f074:	fb010113          	addi	sp,sp,-80
8040f078:	04112623          	sw	ra,76(sp)
8040f07c:	04812423          	sw	s0,72(sp)
8040f080:	04912223          	sw	s1,68(sp)
8040f084:	05212023          	sw	s2,64(sp)
8040f088:	03312e23          	sw	s3,60(sp)
8040f08c:	03412c23          	sw	s4,56(sp)
8040f090:	03512a23          	sw	s5,52(sp)
8040f094:	03612823          	sw	s6,48(sp)
8040f098:	03712623          	sw	s7,44(sp)
8040f09c:	03812423          	sw	s8,40(sp)
8040f0a0:	03912223          	sw	s9,36(sp)
8040f0a4:	1a061063          	bnez	a2,8040f244 <stdin_io+0x1d0>
8040f0a8:	00058493          	mv	s1,a1
8040f0ac:	0005ac83          	lw	s9,0(a1)
8040f0b0:	00c5ac03          	lw	s8,12(a1)
8040f0b4:	100027f3          	csrr	a5,sstatus
8040f0b8:	0027f793          	andi	a5,a5,2
8040f0bc:	16079863          	bnez	a5,8040f22c <stdin_io+0x1b8>
8040f0c0:	00000913          	li	s2,0
8040f0c4:	160c0063          	beqz	s8,8040f224 <stdin_io+0x1b0>
8040f0c8:	0008db97          	auipc	s7,0x8d
8040f0cc:	71cb8b93          	addi	s7,s7,1820 # 8049c7e4 <p_rpos>
8040f0d0:	000ba783          	lw	a5,0(s7)
8040f0d4:	800009b7          	lui	s3,0x80000
8040f0d8:	00001a37          	lui	s4,0x1
8040f0dc:	00000413          	li	s0,0
8040f0e0:	0008db17          	auipc	s6,0x8d
8040f0e4:	708b0b13          	addi	s6,s6,1800 # 8049c7e8 <p_wpos>
8040f0e8:	00498993          	addi	s3,s3,4 # 80000004 <end+0xffb63748>
8040f0ec:	0008da97          	auipc	s5,0x8d
8040f0f0:	6f0a8a93          	addi	s5,s5,1776 # 8049c7dc <__wait_queue>
8040f0f4:	fffa0a13          	addi	s4,s4,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040f0f8:	000b2703          	lw	a4,0(s6)
8040f0fc:	02e7de63          	bge	a5,a4,8040f138 <stdin_io+0xc4>
8040f100:	0d80006f          	j	8040f1d8 <stdin_io+0x164>
8040f104:	c55fd0ef          	jal	ra,8040cd58 <schedule>
8040f108:	100027f3          	csrr	a5,sstatus
8040f10c:	0027f793          	andi	a5,a5,2
8040f110:	00000913          	li	s2,0
8040f114:	04079863          	bnez	a5,8040f164 <stdin_io+0xf0>
8040f118:	00c10513          	addi	a0,sp,12
8040f11c:	9b4f60ef          	jal	ra,804052d0 <wait_in_queue>
8040f120:	04051c63          	bnez	a0,8040f178 <stdin_io+0x104>
8040f124:	01012783          	lw	a5,16(sp)
8040f128:	07379263          	bne	a5,s3,8040f18c <stdin_io+0x118>
8040f12c:	000ba783          	lw	a5,0(s7)
8040f130:	000b2703          	lw	a4,0(s6)
8040f134:	0ae7c263          	blt	a5,a4,8040f1d8 <stdin_io+0x164>
8040f138:	00098613          	mv	a2,s3
8040f13c:	00c10593          	addi	a1,sp,12
8040f140:	000a8513          	mv	a0,s5
8040f144:	a84f60ef          	jal	ra,804053c8 <wait_current_set>
8040f148:	fa090ee3          	beqz	s2,8040f104 <stdin_io+0x90>
8040f14c:	ac9f10ef          	jal	ra,80400c14 <intr_enable>
8040f150:	c09fd0ef          	jal	ra,8040cd58 <schedule>
8040f154:	100027f3          	csrr	a5,sstatus
8040f158:	0027f793          	andi	a5,a5,2
8040f15c:	00000913          	li	s2,0
8040f160:	fa078ce3          	beqz	a5,8040f118 <stdin_io+0xa4>
8040f164:	ab9f10ef          	jal	ra,80400c1c <intr_disable>
8040f168:	00c10513          	addi	a0,sp,12
8040f16c:	00100913          	li	s2,1
8040f170:	960f60ef          	jal	ra,804052d0 <wait_in_queue>
8040f174:	fa0508e3          	beqz	a0,8040f124 <stdin_io+0xb0>
8040f178:	00c10593          	addi	a1,sp,12
8040f17c:	000a8513          	mv	a0,s5
8040f180:	8f0f60ef          	jal	ra,80405270 <wait_queue_del>
8040f184:	01012783          	lw	a5,16(sp)
8040f188:	fb3782e3          	beq	a5,s3,8040f12c <stdin_io+0xb8>
8040f18c:	08091863          	bnez	s2,8040f21c <stdin_io+0x1a8>
8040f190:	08040a63          	beqz	s0,8040f224 <stdin_io+0x1b0>
8040f194:	00c4a783          	lw	a5,12(s1)
8040f198:	408787b3          	sub	a5,a5,s0
8040f19c:	00f4a623          	sw	a5,12(s1)
8040f1a0:	00040513          	mv	a0,s0
8040f1a4:	04c12083          	lw	ra,76(sp)
8040f1a8:	04812403          	lw	s0,72(sp)
8040f1ac:	04412483          	lw	s1,68(sp)
8040f1b0:	04012903          	lw	s2,64(sp)
8040f1b4:	03c12983          	lw	s3,60(sp)
8040f1b8:	03812a03          	lw	s4,56(sp)
8040f1bc:	03412a83          	lw	s5,52(sp)
8040f1c0:	03012b03          	lw	s6,48(sp)
8040f1c4:	02c12b83          	lw	s7,44(sp)
8040f1c8:	02812c03          	lw	s8,40(sp)
8040f1cc:	02412c83          	lw	s9,36(sp)
8040f1d0:	05010113          	addi	sp,sp,80
8040f1d4:	00008067          	ret
8040f1d8:	41f7d713          	srai	a4,a5,0x1f
8040f1dc:	01475693          	srli	a3,a4,0x14
8040f1e0:	00d78733          	add	a4,a5,a3
8040f1e4:	01477733          	and	a4,a4,s4
8040f1e8:	40d70733          	sub	a4,a4,a3
8040f1ec:	0008c697          	auipc	a3,0x8c
8040f1f0:	59468693          	addi	a3,a3,1428 # 8049b780 <stdin_buffer>
8040f1f4:	00e68733          	add	a4,a3,a4
8040f1f8:	00074683          	lbu	a3,0(a4)
8040f1fc:	00178793          	addi	a5,a5,1
8040f200:	008c8733          	add	a4,s9,s0
8040f204:	00d70023          	sb	a3,0(a4)
8040f208:	00140413          	addi	s0,s0,1
8040f20c:	0008d717          	auipc	a4,0x8d
8040f210:	5cf72c23          	sw	a5,1496(a4) # 8049c7e4 <p_rpos>
8040f214:	ef8462e3          	bltu	s0,s8,8040f0f8 <stdin_io+0x84>
8040f218:	f6090ee3          	beqz	s2,8040f194 <stdin_io+0x120>
8040f21c:	9f9f10ef          	jal	ra,80400c14 <intr_enable>
8040f220:	f6041ae3          	bnez	s0,8040f194 <stdin_io+0x120>
8040f224:	00000413          	li	s0,0
8040f228:	f79ff06f          	j	8040f1a0 <stdin_io+0x12c>
8040f22c:	9f1f10ef          	jal	ra,80400c1c <intr_disable>
8040f230:	00100913          	li	s2,1
8040f234:	e80c1ae3          	bnez	s8,8040f0c8 <stdin_io+0x54>
8040f238:	9ddf10ef          	jal	ra,80400c14 <intr_enable>
8040f23c:	00000413          	li	s0,0
8040f240:	f61ff06f          	j	8040f1a0 <stdin_io+0x12c>
8040f244:	ffd00413          	li	s0,-3
8040f248:	f59ff06f          	j	8040f1a0 <stdin_io+0x12c>

8040f24c <dev_stdin_write>:
8040f24c:	00051463          	bnez	a0,8040f254 <dev_stdin_write+0x8>
8040f250:	00008067          	ret
8040f254:	ff010113          	addi	sp,sp,-16
8040f258:	00912223          	sw	s1,4(sp)
8040f25c:	00112623          	sw	ra,12(sp)
8040f260:	00812423          	sw	s0,8(sp)
8040f264:	00050493          	mv	s1,a0
8040f268:	100027f3          	csrr	a5,sstatus
8040f26c:	0027f793          	andi	a5,a5,2
8040f270:	00000413          	li	s0,0
8040f274:	0a079a63          	bnez	a5,8040f328 <dev_stdin_write+0xdc>
8040f278:	0008d797          	auipc	a5,0x8d
8040f27c:	57078793          	addi	a5,a5,1392 # 8049c7e8 <p_wpos>
8040f280:	0007a703          	lw	a4,0(a5)
8040f284:	000015b7          	lui	a1,0x1
8040f288:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040f28c:	41f75693          	srai	a3,a4,0x1f
8040f290:	0146d693          	srli	a3,a3,0x14
8040f294:	00d707b3          	add	a5,a4,a3
8040f298:	00c7f7b3          	and	a5,a5,a2
8040f29c:	0008d617          	auipc	a2,0x8d
8040f2a0:	54860613          	addi	a2,a2,1352 # 8049c7e4 <p_rpos>
8040f2a4:	00062603          	lw	a2,0(a2)
8040f2a8:	40d787b3          	sub	a5,a5,a3
8040f2ac:	0008c697          	auipc	a3,0x8c
8040f2b0:	4d468693          	addi	a3,a3,1236 # 8049b780 <stdin_buffer>
8040f2b4:	00f687b3          	add	a5,a3,a5
8040f2b8:	00978023          	sb	s1,0(a5)
8040f2bc:	40c707b3          	sub	a5,a4,a2
8040f2c0:	00b7d863          	bge	a5,a1,8040f2d0 <dev_stdin_write+0x84>
8040f2c4:	00170713          	addi	a4,a4,1
8040f2c8:	0008d797          	auipc	a5,0x8d
8040f2cc:	52e7a023          	sw	a4,1312(a5) # 8049c7e8 <p_wpos>
8040f2d0:	0008d517          	auipc	a0,0x8d
8040f2d4:	50c50513          	addi	a0,a0,1292 # 8049c7dc <__wait_queue>
8040f2d8:	fe9f50ef          	jal	ra,804052c0 <wait_queue_empty>
8040f2dc:	00050e63          	beqz	a0,8040f2f8 <dev_stdin_write+0xac>
8040f2e0:	02041a63          	bnez	s0,8040f314 <dev_stdin_write+0xc8>
8040f2e4:	00c12083          	lw	ra,12(sp)
8040f2e8:	00812403          	lw	s0,8(sp)
8040f2ec:	00412483          	lw	s1,4(sp)
8040f2f0:	01010113          	addi	sp,sp,16
8040f2f4:	00008067          	ret
8040f2f8:	800005b7          	lui	a1,0x80000
8040f2fc:	00100613          	li	a2,1
8040f300:	00458593          	addi	a1,a1,4 # 80000004 <end+0xffb63748>
8040f304:	0008d517          	auipc	a0,0x8d
8040f308:	4d850513          	addi	a0,a0,1240 # 8049c7dc <__wait_queue>
8040f30c:	81cf60ef          	jal	ra,80405328 <wakeup_queue>
8040f310:	fc040ae3          	beqz	s0,8040f2e4 <dev_stdin_write+0x98>
8040f314:	00812403          	lw	s0,8(sp)
8040f318:	00c12083          	lw	ra,12(sp)
8040f31c:	00412483          	lw	s1,4(sp)
8040f320:	01010113          	addi	sp,sp,16
8040f324:	8f1f106f          	j	80400c14 <intr_enable>
8040f328:	8f5f10ef          	jal	ra,80400c1c <intr_disable>
8040f32c:	00100413          	li	s0,1
8040f330:	f49ff06f          	j	8040f278 <dev_stdin_write+0x2c>

8040f334 <dev_init_stdin>:
8040f334:	ff010113          	addi	sp,sp,-16
8040f338:	00112623          	sw	ra,12(sp)
8040f33c:	00812423          	sw	s0,8(sp)
8040f340:	909ff0ef          	jal	ra,8040ec48 <dev_create_inode>
8040f344:	08050c63          	beqz	a0,8040f3dc <dev_init_stdin+0xa8>
8040f348:	02c52703          	lw	a4,44(a0)
8040f34c:	000017b7          	lui	a5,0x1
8040f350:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f354:	00050413          	mv	s0,a0
8040f358:	0af71c63          	bne	a4,a5,8040f410 <dev_init_stdin+0xdc>
8040f35c:	00100793          	li	a5,1
8040f360:	00f42223          	sw	a5,4(s0)
8040f364:	00000797          	auipc	a5,0x0
8040f368:	cec78793          	addi	a5,a5,-788 # 8040f050 <stdin_open>
8040f36c:	00f42423          	sw	a5,8(s0)
8040f370:	00000797          	auipc	a5,0x0
8040f374:	cf478793          	addi	a5,a5,-780 # 8040f064 <stdin_close>
8040f378:	00f42623          	sw	a5,12(s0)
8040f37c:	00000797          	auipc	a5,0x0
8040f380:	cf878793          	addi	a5,a5,-776 # 8040f074 <stdin_io>
8040f384:	00f42823          	sw	a5,16(s0)
8040f388:	00000797          	auipc	a5,0x0
8040f38c:	ce478793          	addi	a5,a5,-796 # 8040f06c <stdin_ioctl>
8040f390:	00f42a23          	sw	a5,20(s0)
8040f394:	0008d517          	auipc	a0,0x8d
8040f398:	44850513          	addi	a0,a0,1096 # 8049c7dc <__wait_queue>
8040f39c:	00042023          	sw	zero,0(s0)
8040f3a0:	0008d797          	auipc	a5,0x8d
8040f3a4:	4407a423          	sw	zero,1096(a5) # 8049c7e8 <p_wpos>
8040f3a8:	0008d797          	auipc	a5,0x8d
8040f3ac:	4207ae23          	sw	zero,1084(a5) # 8049c7e4 <p_rpos>
8040f3b0:	eb5f50ef          	jal	ra,80405264 <wait_queue_init>
8040f3b4:	00000613          	li	a2,0
8040f3b8:	00040593          	mv	a1,s0
8040f3bc:	00007517          	auipc	a0,0x7
8040f3c0:	8d850513          	addi	a0,a0,-1832 # 80415c94 <dev_node_ops+0x214>
8040f3c4:	b79fe0ef          	jal	ra,8040df3c <vfs_add_dev>
8040f3c8:	02051663          	bnez	a0,8040f3f4 <dev_init_stdin+0xc0>
8040f3cc:	00c12083          	lw	ra,12(sp)
8040f3d0:	00812403          	lw	s0,8(sp)
8040f3d4:	01010113          	addi	sp,sp,16
8040f3d8:	00008067          	ret
8040f3dc:	00007617          	auipc	a2,0x7
8040f3e0:	88060613          	addi	a2,a2,-1920 # 80415c5c <dev_node_ops+0x1dc>
8040f3e4:	07500593          	li	a1,117
8040f3e8:	00007517          	auipc	a0,0x7
8040f3ec:	89050513          	addi	a0,a0,-1904 # 80415c78 <dev_node_ops+0x1f8>
8040f3f0:	a34f10ef          	jal	ra,80400624 <__panic>
8040f3f4:	00050693          	mv	a3,a0
8040f3f8:	00007617          	auipc	a2,0x7
8040f3fc:	8a460613          	addi	a2,a2,-1884 # 80415c9c <dev_node_ops+0x21c>
8040f400:	07b00593          	li	a1,123
8040f404:	00007517          	auipc	a0,0x7
8040f408:	87450513          	addi	a0,a0,-1932 # 80415c78 <dev_node_ops+0x1f8>
8040f40c:	a18f10ef          	jal	ra,80400624 <__panic>
8040f410:	00006697          	auipc	a3,0x6
8040f414:	37868693          	addi	a3,a3,888 # 80415788 <syscalls+0x73c>
8040f418:	00004617          	auipc	a2,0x4
8040f41c:	ab060613          	addi	a2,a2,-1360 # 80412ec8 <commands+0x1bc>
8040f420:	07700593          	li	a1,119
8040f424:	00007517          	auipc	a0,0x7
8040f428:	85450513          	addi	a0,a0,-1964 # 80415c78 <dev_node_ops+0x1f8>
8040f42c:	9f8f10ef          	jal	ra,80400624 <__panic>

8040f430 <stdout_open>:
8040f430:	00100793          	li	a5,1
8040f434:	00000513          	li	a0,0
8040f438:	00f59463          	bne	a1,a5,8040f440 <stdout_open+0x10>
8040f43c:	00008067          	ret
8040f440:	ffd00513          	li	a0,-3
8040f444:	00008067          	ret

8040f448 <stdout_close>:
8040f448:	00000513          	li	a0,0
8040f44c:	00008067          	ret

8040f450 <stdout_ioctl>:
8040f450:	ffd00513          	li	a0,-3
8040f454:	00008067          	ret

8040f458 <stdout_io>:
8040f458:	04060c63          	beqz	a2,8040f4b0 <stdout_io+0x58>
8040f45c:	00c5a783          	lw	a5,12(a1)
8040f460:	ff010113          	addi	sp,sp,-16
8040f464:	00812423          	sw	s0,8(sp)
8040f468:	00912223          	sw	s1,4(sp)
8040f46c:	00112623          	sw	ra,12(sp)
8040f470:	00058493          	mv	s1,a1
8040f474:	0005a403          	lw	s0,0(a1)
8040f478:	02078063          	beqz	a5,8040f498 <stdout_io+0x40>
8040f47c:	00140413          	addi	s0,s0,1
8040f480:	fff44503          	lbu	a0,-1(s0)
8040f484:	dd9f00ef          	jal	ra,8040025c <cputchar>
8040f488:	00c4a783          	lw	a5,12(s1)
8040f48c:	fff78793          	addi	a5,a5,-1
8040f490:	00f4a623          	sw	a5,12(s1)
8040f494:	fe0794e3          	bnez	a5,8040f47c <stdout_io+0x24>
8040f498:	00c12083          	lw	ra,12(sp)
8040f49c:	00812403          	lw	s0,8(sp)
8040f4a0:	00412483          	lw	s1,4(sp)
8040f4a4:	00000513          	li	a0,0
8040f4a8:	01010113          	addi	sp,sp,16
8040f4ac:	00008067          	ret
8040f4b0:	ffd00513          	li	a0,-3
8040f4b4:	00008067          	ret

8040f4b8 <dev_init_stdout>:
8040f4b8:	ff010113          	addi	sp,sp,-16
8040f4bc:	00112623          	sw	ra,12(sp)
8040f4c0:	f88ff0ef          	jal	ra,8040ec48 <dev_create_inode>
8040f4c4:	06050a63          	beqz	a0,8040f538 <dev_init_stdout+0x80>
8040f4c8:	02c52703          	lw	a4,44(a0)
8040f4cc:	000017b7          	lui	a5,0x1
8040f4d0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f4d4:	08f71c63          	bne	a4,a5,8040f56c <dev_init_stdout+0xb4>
8040f4d8:	00100793          	li	a5,1
8040f4dc:	00f52223          	sw	a5,4(a0)
8040f4e0:	00000797          	auipc	a5,0x0
8040f4e4:	f5078793          	addi	a5,a5,-176 # 8040f430 <stdout_open>
8040f4e8:	00f52423          	sw	a5,8(a0)
8040f4ec:	00000797          	auipc	a5,0x0
8040f4f0:	f5c78793          	addi	a5,a5,-164 # 8040f448 <stdout_close>
8040f4f4:	00f52623          	sw	a5,12(a0)
8040f4f8:	00000797          	auipc	a5,0x0
8040f4fc:	f6078793          	addi	a5,a5,-160 # 8040f458 <stdout_io>
8040f500:	00f52823          	sw	a5,16(a0)
8040f504:	00000797          	auipc	a5,0x0
8040f508:	f4c78793          	addi	a5,a5,-180 # 8040f450 <stdout_ioctl>
8040f50c:	00052023          	sw	zero,0(a0)
8040f510:	00f52a23          	sw	a5,20(a0)
8040f514:	00050593          	mv	a1,a0
8040f518:	00000613          	li	a2,0
8040f51c:	00006517          	auipc	a0,0x6
8040f520:	7d450513          	addi	a0,a0,2004 # 80415cf0 <dev_node_ops+0x270>
8040f524:	a19fe0ef          	jal	ra,8040df3c <vfs_add_dev>
8040f528:	02051463          	bnez	a0,8040f550 <dev_init_stdout+0x98>
8040f52c:	00c12083          	lw	ra,12(sp)
8040f530:	01010113          	addi	sp,sp,16
8040f534:	00008067          	ret
8040f538:	00006617          	auipc	a2,0x6
8040f53c:	78060613          	addi	a2,a2,1920 # 80415cb8 <dev_node_ops+0x238>
8040f540:	03700593          	li	a1,55
8040f544:	00006517          	auipc	a0,0x6
8040f548:	79050513          	addi	a0,a0,1936 # 80415cd4 <dev_node_ops+0x254>
8040f54c:	8d8f10ef          	jal	ra,80400624 <__panic>
8040f550:	00050693          	mv	a3,a0
8040f554:	00006617          	auipc	a2,0x6
8040f558:	7a460613          	addi	a2,a2,1956 # 80415cf8 <dev_node_ops+0x278>
8040f55c:	03d00593          	li	a1,61
8040f560:	00006517          	auipc	a0,0x6
8040f564:	77450513          	addi	a0,a0,1908 # 80415cd4 <dev_node_ops+0x254>
8040f568:	8bcf10ef          	jal	ra,80400624 <__panic>
8040f56c:	00006697          	auipc	a3,0x6
8040f570:	21c68693          	addi	a3,a3,540 # 80415788 <syscalls+0x73c>
8040f574:	00004617          	auipc	a2,0x4
8040f578:	95460613          	addi	a2,a2,-1708 # 80412ec8 <commands+0x1bc>
8040f57c:	03900593          	li	a1,57
8040f580:	00006517          	auipc	a0,0x6
8040f584:	75450513          	addi	a0,a0,1876 # 80415cd4 <dev_node_ops+0x254>
8040f588:	89cf10ef          	jal	ra,80400624 <__panic>

8040f58c <bitmap_translate.isra.0.part.1>:
8040f58c:	ff010113          	addi	sp,sp,-16
8040f590:	00006697          	auipc	a3,0x6
8040f594:	7fc68693          	addi	a3,a3,2044 # 80415d8c <dev_node_ops+0x30c>
8040f598:	00004617          	auipc	a2,0x4
8040f59c:	93060613          	addi	a2,a2,-1744 # 80412ec8 <commands+0x1bc>
8040f5a0:	04c00593          	li	a1,76
8040f5a4:	00007517          	auipc	a0,0x7
8040f5a8:	80050513          	addi	a0,a0,-2048 # 80415da4 <dev_node_ops+0x324>
8040f5ac:	00112623          	sw	ra,12(sp)
8040f5b0:	874f10ef          	jal	ra,80400624 <__panic>

8040f5b4 <bitmap_create>:
8040f5b4:	fe010113          	addi	sp,sp,-32
8040f5b8:	00112e23          	sw	ra,28(sp)
8040f5bc:	00812c23          	sw	s0,24(sp)
8040f5c0:	00912a23          	sw	s1,20(sp)
8040f5c4:	01212823          	sw	s2,16(sp)
8040f5c8:	01312623          	sw	s3,12(sp)
8040f5cc:	01412423          	sw	s4,8(sp)
8040f5d0:	fff50713          	addi	a4,a0,-1
8040f5d4:	fde00793          	li	a5,-34
8040f5d8:	0ce7e663          	bltu	a5,a4,8040f6a4 <bitmap_create+0xf0>
8040f5dc:	00050413          	mv	s0,a0
8040f5e0:	00c00513          	li	a0,12
8040f5e4:	bdcf30ef          	jal	ra,804029c0 <kmalloc>
8040f5e8:	00050493          	mv	s1,a0
8040f5ec:	08050263          	beqz	a0,8040f670 <bitmap_create+0xbc>
8040f5f0:	01f40993          	addi	s3,s0,31
8040f5f4:	0059d913          	srli	s2,s3,0x5
8040f5f8:	00291a13          	slli	s4,s2,0x2
8040f5fc:	000a0513          	mv	a0,s4
8040f600:	bc0f30ef          	jal	ra,804029c0 <kmalloc>
8040f604:	08050863          	beqz	a0,8040f694 <bitmap_create+0xe0>
8040f608:	0084a023          	sw	s0,0(s1)
8040f60c:	0124a223          	sw	s2,4(s1)
8040f610:	000a0613          	mv	a2,s4
8040f614:	0ff00593          	li	a1,255
8040f618:	480030ef          	jal	ra,80412a98 <memset>
8040f61c:	00a4a423          	sw	a0,8(s1)
8040f620:	fe09f993          	andi	s3,s3,-32
8040f624:	04898663          	beq	s3,s0,8040f670 <bitmap_create+0xbc>
8040f628:	fff90913          	addi	s2,s2,-1 # 3fff <_binary_bin_swap_img_size-0x4001>
8040f62c:	00591793          	slli	a5,s2,0x5
8040f630:	00545713          	srli	a4,s0,0x5
8040f634:	40f407b3          	sub	a5,s0,a5
8040f638:	0b271663          	bne	a4,s2,8040f6e4 <bitmap_create+0x130>
8040f63c:	fff78693          	addi	a3,a5,-1
8040f640:	01e00613          	li	a2,30
8040f644:	08d66063          	bltu	a2,a3,8040f6c4 <bitmap_create+0x110>
8040f648:	00271713          	slli	a4,a4,0x2
8040f64c:	00e50533          	add	a0,a0,a4
8040f650:	00052703          	lw	a4,0(a0)
8040f654:	00100593          	li	a1,1
8040f658:	02000613          	li	a2,32
8040f65c:	00f596b3          	sll	a3,a1,a5
8040f660:	00178793          	addi	a5,a5,1
8040f664:	00d74733          	xor	a4,a4,a3
8040f668:	fec79ae3          	bne	a5,a2,8040f65c <bitmap_create+0xa8>
8040f66c:	00e52023          	sw	a4,0(a0)
8040f670:	01c12083          	lw	ra,28(sp)
8040f674:	01812403          	lw	s0,24(sp)
8040f678:	00048513          	mv	a0,s1
8040f67c:	01012903          	lw	s2,16(sp)
8040f680:	01412483          	lw	s1,20(sp)
8040f684:	00c12983          	lw	s3,12(sp)
8040f688:	00812a03          	lw	s4,8(sp)
8040f68c:	02010113          	addi	sp,sp,32
8040f690:	00008067          	ret
8040f694:	00048513          	mv	a0,s1
8040f698:	c4cf30ef          	jal	ra,80402ae4 <kfree>
8040f69c:	00000493          	li	s1,0
8040f6a0:	fd1ff06f          	j	8040f670 <bitmap_create+0xbc>
8040f6a4:	00006697          	auipc	a3,0x6
8040f6a8:	67068693          	addi	a3,a3,1648 # 80415d14 <dev_node_ops+0x294>
8040f6ac:	00004617          	auipc	a2,0x4
8040f6b0:	81c60613          	addi	a2,a2,-2020 # 80412ec8 <commands+0x1bc>
8040f6b4:	01500593          	li	a1,21
8040f6b8:	00006517          	auipc	a0,0x6
8040f6bc:	6ec50513          	addi	a0,a0,1772 # 80415da4 <dev_node_ops+0x324>
8040f6c0:	f65f00ef          	jal	ra,80400624 <__panic>
8040f6c4:	00006697          	auipc	a3,0x6
8040f6c8:	69068693          	addi	a3,a3,1680 # 80415d54 <dev_node_ops+0x2d4>
8040f6cc:	00003617          	auipc	a2,0x3
8040f6d0:	7fc60613          	addi	a2,a2,2044 # 80412ec8 <commands+0x1bc>
8040f6d4:	02b00593          	li	a1,43
8040f6d8:	00006517          	auipc	a0,0x6
8040f6dc:	6cc50513          	addi	a0,a0,1740 # 80415da4 <dev_node_ops+0x324>
8040f6e0:	f45f00ef          	jal	ra,80400624 <__panic>
8040f6e4:	00006697          	auipc	a3,0x6
8040f6e8:	65868693          	addi	a3,a3,1624 # 80415d3c <dev_node_ops+0x2bc>
8040f6ec:	00003617          	auipc	a2,0x3
8040f6f0:	7dc60613          	addi	a2,a2,2012 # 80412ec8 <commands+0x1bc>
8040f6f4:	02a00593          	li	a1,42
8040f6f8:	00006517          	auipc	a0,0x6
8040f6fc:	6ac50513          	addi	a0,a0,1708 # 80415da4 <dev_node_ops+0x324>
8040f700:	f25f00ef          	jal	ra,80400624 <__panic>

8040f704 <bitmap_alloc>:
8040f704:	00452603          	lw	a2,4(a0)
8040f708:	00852803          	lw	a6,8(a0)
8040f70c:	02060663          	beqz	a2,8040f738 <bitmap_alloc+0x34>
8040f710:	00082703          	lw	a4,0(a6)
8040f714:	00480793          	addi	a5,a6,4
8040f718:	00070c63          	beqz	a4,8040f730 <bitmap_alloc+0x2c>
8040f71c:	0240006f          	j	8040f740 <bitmap_alloc+0x3c>
8040f720:	00078813          	mv	a6,a5
8040f724:	00478793          	addi	a5,a5,4
8040f728:	ffc7a683          	lw	a3,-4(a5)
8040f72c:	00069e63          	bnez	a3,8040f748 <bitmap_alloc+0x44>
8040f730:	00170713          	addi	a4,a4,1
8040f734:	fee616e3          	bne	a2,a4,8040f720 <bitmap_alloc+0x1c>
8040f738:	ffc00513          	li	a0,-4
8040f73c:	00008067          	ret
8040f740:	00070693          	mv	a3,a4
8040f744:	00000713          	li	a4,0
8040f748:	00000793          	li	a5,0
8040f74c:	00100893          	li	a7,1
8040f750:	02000313          	li	t1,32
8040f754:	00c0006f          	j	8040f760 <bitmap_alloc+0x5c>
8040f758:	00178793          	addi	a5,a5,1
8040f75c:	02678663          	beq	a5,t1,8040f788 <bitmap_alloc+0x84>
8040f760:	00f89633          	sll	a2,a7,a5
8040f764:	00c6f533          	and	a0,a3,a2
8040f768:	fe0508e3          	beqz	a0,8040f758 <bitmap_alloc+0x54>
8040f76c:	00c6c6b3          	xor	a3,a3,a2
8040f770:	00571713          	slli	a4,a4,0x5
8040f774:	00d82023          	sw	a3,0(a6)
8040f778:	00f70733          	add	a4,a4,a5
8040f77c:	00e5a023          	sw	a4,0(a1)
8040f780:	00000513          	li	a0,0
8040f784:	00008067          	ret
8040f788:	ff010113          	addi	sp,sp,-16
8040f78c:	00005697          	auipc	a3,0x5
8040f790:	b3068693          	addi	a3,a3,-1232 # 804142bc <default_pmm_manager+0x8c0>
8040f794:	00003617          	auipc	a2,0x3
8040f798:	73460613          	addi	a2,a2,1844 # 80412ec8 <commands+0x1bc>
8040f79c:	04300593          	li	a1,67
8040f7a0:	00006517          	auipc	a0,0x6
8040f7a4:	60450513          	addi	a0,a0,1540 # 80415da4 <dev_node_ops+0x324>
8040f7a8:	00112623          	sw	ra,12(sp)
8040f7ac:	e79f00ef          	jal	ra,80400624 <__panic>

8040f7b0 <bitmap_test>:
8040f7b0:	00052783          	lw	a5,0(a0)
8040f7b4:	02f5f463          	bgeu	a1,a5,8040f7dc <bitmap_test+0x2c>
8040f7b8:	00852783          	lw	a5,8(a0)
8040f7bc:	0055d713          	srli	a4,a1,0x5
8040f7c0:	00271713          	slli	a4,a4,0x2
8040f7c4:	00e787b3          	add	a5,a5,a4
8040f7c8:	0007a503          	lw	a0,0(a5)
8040f7cc:	00100793          	li	a5,1
8040f7d0:	00b795b3          	sll	a1,a5,a1
8040f7d4:	00a5f533          	and	a0,a1,a0
8040f7d8:	00008067          	ret
8040f7dc:	ff010113          	addi	sp,sp,-16
8040f7e0:	00112623          	sw	ra,12(sp)
8040f7e4:	da9ff0ef          	jal	ra,8040f58c <bitmap_translate.isra.0.part.1>

8040f7e8 <bitmap_free>:
8040f7e8:	00052783          	lw	a5,0(a0)
8040f7ec:	ff010113          	addi	sp,sp,-16
8040f7f0:	00112623          	sw	ra,12(sp)
8040f7f4:	02f5fe63          	bgeu	a1,a5,8040f830 <bitmap_free+0x48>
8040f7f8:	00852783          	lw	a5,8(a0)
8040f7fc:	0055d713          	srli	a4,a1,0x5
8040f800:	00271713          	slli	a4,a4,0x2
8040f804:	00e787b3          	add	a5,a5,a4
8040f808:	0007a703          	lw	a4,0(a5)
8040f80c:	00100693          	li	a3,1
8040f810:	00b695b3          	sll	a1,a3,a1
8040f814:	00b776b3          	and	a3,a4,a1
8040f818:	00069e63          	bnez	a3,8040f834 <bitmap_free+0x4c>
8040f81c:	00c12083          	lw	ra,12(sp)
8040f820:	00b76733          	or	a4,a4,a1
8040f824:	00e7a023          	sw	a4,0(a5)
8040f828:	01010113          	addi	sp,sp,16
8040f82c:	00008067          	ret
8040f830:	d5dff0ef          	jal	ra,8040f58c <bitmap_translate.isra.0.part.1>
8040f834:	00006697          	auipc	a3,0x6
8040f838:	54868693          	addi	a3,a3,1352 # 80415d7c <dev_node_ops+0x2fc>
8040f83c:	00003617          	auipc	a2,0x3
8040f840:	68c60613          	addi	a2,a2,1676 # 80412ec8 <commands+0x1bc>
8040f844:	05f00593          	li	a1,95
8040f848:	00006517          	auipc	a0,0x6
8040f84c:	55c50513          	addi	a0,a0,1372 # 80415da4 <dev_node_ops+0x324>
8040f850:	dd5f00ef          	jal	ra,80400624 <__panic>

8040f854 <bitmap_destroy>:
8040f854:	ff010113          	addi	sp,sp,-16
8040f858:	00812423          	sw	s0,8(sp)
8040f85c:	00050413          	mv	s0,a0
8040f860:	00852503          	lw	a0,8(a0)
8040f864:	00112623          	sw	ra,12(sp)
8040f868:	a7cf30ef          	jal	ra,80402ae4 <kfree>
8040f86c:	00040513          	mv	a0,s0
8040f870:	00812403          	lw	s0,8(sp)
8040f874:	00c12083          	lw	ra,12(sp)
8040f878:	01010113          	addi	sp,sp,16
8040f87c:	a68f306f          	j	80402ae4 <kfree>

8040f880 <bitmap_getdata>:
8040f880:	00058863          	beqz	a1,8040f890 <bitmap_getdata+0x10>
8040f884:	00452783          	lw	a5,4(a0)
8040f888:	00279793          	slli	a5,a5,0x2
8040f88c:	00f5a023          	sw	a5,0(a1)
8040f890:	00852503          	lw	a0,8(a0)
8040f894:	00008067          	ret

8040f898 <sfs_init>:
8040f898:	ff010113          	addi	sp,sp,-16
8040f89c:	00006517          	auipc	a0,0x6
8040f8a0:	27c50513          	addi	a0,a0,636 # 80415b18 <dev_node_ops+0x98>
8040f8a4:	00112623          	sw	ra,12(sp)
8040f8a8:	784000ef          	jal	ra,8041002c <sfs_mount>
8040f8ac:	00051863          	bnez	a0,8040f8bc <sfs_init+0x24>
8040f8b0:	00c12083          	lw	ra,12(sp)
8040f8b4:	01010113          	addi	sp,sp,16
8040f8b8:	00008067          	ret
8040f8bc:	00050693          	mv	a3,a0
8040f8c0:	00006617          	auipc	a2,0x6
8040f8c4:	4fc60613          	addi	a2,a2,1276 # 80415dbc <dev_node_ops+0x33c>
8040f8c8:	01000593          	li	a1,16
8040f8cc:	00006517          	auipc	a0,0x6
8040f8d0:	51050513          	addi	a0,a0,1296 # 80415ddc <dev_node_ops+0x35c>
8040f8d4:	d51f00ef          	jal	ra,80400624 <__panic>

8040f8d8 <sfs_sync>:
8040f8d8:	fe010113          	addi	sp,sp,-32
8040f8dc:	00112e23          	sw	ra,28(sp)
8040f8e0:	00812c23          	sw	s0,24(sp)
8040f8e4:	00912a23          	sw	s1,20(sp)
8040f8e8:	01212823          	sw	s2,16(sp)
8040f8ec:	01312623          	sw	s3,12(sp)
8040f8f0:	01412423          	sw	s4,8(sp)
8040f8f4:	12050a63          	beqz	a0,8040fa28 <sfs_sync+0x150>
8040f8f8:	06c52783          	lw	a5,108(a0)
8040f8fc:	00050a13          	mv	s4,a0
8040f900:	12079463          	bnez	a5,8040fa28 <sfs_sync+0x150>
8040f904:	135020ef          	jal	ra,80412238 <lock_sfs_fs>
8040f908:	064a2403          	lw	s0,100(s4)
8040f90c:	060a0913          	addi	s2,s4,96
8040f910:	06890263          	beq	s2,s0,8040f974 <sfs_sync+0x9c>
8040f914:	fe440493          	addi	s1,s0,-28
8040f918:	0e048863          	beqz	s1,8040fa08 <sfs_sync+0x130>
8040f91c:	02042783          	lw	a5,32(s0)
8040f920:	0e078463          	beqz	a5,8040fa08 <sfs_sync+0x130>
8040f924:	0187a783          	lw	a5,24(a5)
8040f928:	0e078063          	beqz	a5,8040fa08 <sfs_sync+0x130>
8040f92c:	00005997          	auipc	s3,0x5
8040f930:	bd098993          	addi	s3,s3,-1072 # 804144fc <CSWTCH.69+0x17c>
8040f934:	01c0006f          	j	8040f950 <sfs_sync+0x78>
8040f938:	fe440493          	addi	s1,s0,-28
8040f93c:	0c048663          	beqz	s1,8040fa08 <sfs_sync+0x130>
8040f940:	02042783          	lw	a5,32(s0)
8040f944:	0c078263          	beqz	a5,8040fa08 <sfs_sync+0x130>
8040f948:	0187a783          	lw	a5,24(a5)
8040f94c:	0a078e63          	beqz	a5,8040fa08 <sfs_sync+0x130>
8040f950:	00098593          	mv	a1,s3
8040f954:	00048513          	mv	a0,s1
8040f958:	d79fd0ef          	jal	ra,8040d6d0 <inode_check>
8040f95c:	02042783          	lw	a5,32(s0)
8040f960:	00048513          	mv	a0,s1
8040f964:	0187a783          	lw	a5,24(a5)
8040f968:	000780e7          	jalr	a5
8040f96c:	00442403          	lw	s0,4(s0)
8040f970:	fc8914e3          	bne	s2,s0,8040f938 <sfs_sync+0x60>
8040f974:	000a0513          	mv	a0,s4
8040f978:	0d1020ef          	jal	ra,80412248 <unlock_sfs_fs>
8040f97c:	034a2503          	lw	a0,52(s4)
8040f980:	02051263          	bnez	a0,8040f9a4 <sfs_sync+0xcc>
8040f984:	01c12083          	lw	ra,28(sp)
8040f988:	01812403          	lw	s0,24(sp)
8040f98c:	01412483          	lw	s1,20(sp)
8040f990:	01012903          	lw	s2,16(sp)
8040f994:	00c12983          	lw	s3,12(sp)
8040f998:	00812a03          	lw	s4,8(sp)
8040f99c:	02010113          	addi	sp,sp,32
8040f9a0:	00008067          	ret
8040f9a4:	020a2a23          	sw	zero,52(s4)
8040f9a8:	000a0513          	mv	a0,s4
8040f9ac:	700020ef          	jal	ra,804120ac <sfs_sync_super>
8040f9b0:	02050663          	beqz	a0,8040f9dc <sfs_sync+0x104>
8040f9b4:	01c12083          	lw	ra,28(sp)
8040f9b8:	01812403          	lw	s0,24(sp)
8040f9bc:	00100793          	li	a5,1
8040f9c0:	02fa2a23          	sw	a5,52(s4)
8040f9c4:	01412483          	lw	s1,20(sp)
8040f9c8:	01012903          	lw	s2,16(sp)
8040f9cc:	00c12983          	lw	s3,12(sp)
8040f9d0:	00812a03          	lw	s4,8(sp)
8040f9d4:	02010113          	addi	sp,sp,32
8040f9d8:	00008067          	ret
8040f9dc:	000a0513          	mv	a0,s4
8040f9e0:	744020ef          	jal	ra,80412124 <sfs_sync_freemap>
8040f9e4:	fc0518e3          	bnez	a0,8040f9b4 <sfs_sync+0xdc>
8040f9e8:	01c12083          	lw	ra,28(sp)
8040f9ec:	01812403          	lw	s0,24(sp)
8040f9f0:	01412483          	lw	s1,20(sp)
8040f9f4:	01012903          	lw	s2,16(sp)
8040f9f8:	00c12983          	lw	s3,12(sp)
8040f9fc:	00812a03          	lw	s4,8(sp)
8040fa00:	02010113          	addi	sp,sp,32
8040fa04:	00008067          	ret
8040fa08:	00005697          	auipc	a3,0x5
8040fa0c:	aa468693          	addi	a3,a3,-1372 # 804144ac <CSWTCH.69+0x12c>
8040fa10:	00003617          	auipc	a2,0x3
8040fa14:	4b860613          	addi	a2,a2,1208 # 80412ec8 <commands+0x1bc>
8040fa18:	01b00593          	li	a1,27
8040fa1c:	00006517          	auipc	a0,0x6
8040fa20:	53850513          	addi	a0,a0,1336 # 80415f54 <dev_node_ops+0x4d4>
8040fa24:	c01f00ef          	jal	ra,80400624 <__panic>
8040fa28:	00006697          	auipc	a3,0x6
8040fa2c:	50068693          	addi	a3,a3,1280 # 80415f28 <dev_node_ops+0x4a8>
8040fa30:	00003617          	auipc	a2,0x3
8040fa34:	49860613          	addi	a2,a2,1176 # 80412ec8 <commands+0x1bc>
8040fa38:	01500593          	li	a1,21
8040fa3c:	00006517          	auipc	a0,0x6
8040fa40:	51850513          	addi	a0,a0,1304 # 80415f54 <dev_node_ops+0x4d4>
8040fa44:	be1f00ef          	jal	ra,80400624 <__panic>

8040fa48 <sfs_init_read>:
8040fa48:	fe010113          	addi	sp,sp,-32
8040fa4c:	00060793          	mv	a5,a2
8040fa50:	00812c23          	sw	s0,24(sp)
8040fa54:	00c59693          	slli	a3,a1,0xc
8040fa58:	00050413          	mv	s0,a0
8040fa5c:	00078593          	mv	a1,a5
8040fa60:	00001637          	lui	a2,0x1
8040fa64:	00010513          	mv	a0,sp
8040fa68:	00112e23          	sw	ra,28(sp)
8040fa6c:	bc1f60ef          	jal	ra,8040662c <iobuf_init>
8040fa70:	01042783          	lw	a5,16(s0)
8040fa74:	00050593          	mv	a1,a0
8040fa78:	00000613          	li	a2,0
8040fa7c:	00040513          	mv	a0,s0
8040fa80:	000780e7          	jalr	a5
8040fa84:	01c12083          	lw	ra,28(sp)
8040fa88:	01812403          	lw	s0,24(sp)
8040fa8c:	02010113          	addi	sp,sp,32
8040fa90:	00008067          	ret

8040fa94 <sfs_unmount>:
8040fa94:	ff010113          	addi	sp,sp,-16
8040fa98:	00112623          	sw	ra,12(sp)
8040fa9c:	00812423          	sw	s0,8(sp)
8040faa0:	00912223          	sw	s1,4(sp)
8040faa4:	06050263          	beqz	a0,8040fb08 <sfs_unmount+0x74>
8040faa8:	06c52783          	lw	a5,108(a0)
8040faac:	00050413          	mv	s0,a0
8040fab0:	04079c63          	bnez	a5,8040fb08 <sfs_unmount+0x74>
8040fab4:	06452703          	lw	a4,100(a0)
8040fab8:	06050793          	addi	a5,a0,96
8040fabc:	04f71263          	bne	a4,a5,8040fb00 <sfs_unmount+0x6c>
8040fac0:	03452483          	lw	s1,52(a0)
8040fac4:	06049263          	bnez	s1,8040fb28 <sfs_unmount+0x94>
8040fac8:	03052503          	lw	a0,48(a0)
8040facc:	d89ff0ef          	jal	ra,8040f854 <bitmap_destroy>
8040fad0:	03842503          	lw	a0,56(s0)
8040fad4:	810f30ef          	jal	ra,80402ae4 <kfree>
8040fad8:	06842503          	lw	a0,104(s0)
8040fadc:	808f30ef          	jal	ra,80402ae4 <kfree>
8040fae0:	00040513          	mv	a0,s0
8040fae4:	800f30ef          	jal	ra,80402ae4 <kfree>
8040fae8:	00c12083          	lw	ra,12(sp)
8040faec:	00812403          	lw	s0,8(sp)
8040faf0:	00048513          	mv	a0,s1
8040faf4:	00412483          	lw	s1,4(sp)
8040faf8:	01010113          	addi	sp,sp,16
8040fafc:	00008067          	ret
8040fb00:	ff100493          	li	s1,-15
8040fb04:	fe5ff06f          	j	8040fae8 <sfs_unmount+0x54>
8040fb08:	00006697          	auipc	a3,0x6
8040fb0c:	42068693          	addi	a3,a3,1056 # 80415f28 <dev_node_ops+0x4a8>
8040fb10:	00003617          	auipc	a2,0x3
8040fb14:	3b860613          	addi	a2,a2,952 # 80412ec8 <commands+0x1bc>
8040fb18:	04100593          	li	a1,65
8040fb1c:	00006517          	auipc	a0,0x6
8040fb20:	43850513          	addi	a0,a0,1080 # 80415f54 <dev_node_ops+0x4d4>
8040fb24:	b01f00ef          	jal	ra,80400624 <__panic>
8040fb28:	00006697          	auipc	a3,0x6
8040fb2c:	44468693          	addi	a3,a3,1092 # 80415f6c <dev_node_ops+0x4ec>
8040fb30:	00003617          	auipc	a2,0x3
8040fb34:	39860613          	addi	a2,a2,920 # 80412ec8 <commands+0x1bc>
8040fb38:	04500593          	li	a1,69
8040fb3c:	00006517          	auipc	a0,0x6
8040fb40:	41850513          	addi	a0,a0,1048 # 80415f54 <dev_node_ops+0x4d4>
8040fb44:	ae1f00ef          	jal	ra,80400624 <__panic>

8040fb48 <sfs_cleanup>:
8040fb48:	ff010113          	addi	sp,sp,-16
8040fb4c:	00112623          	sw	ra,12(sp)
8040fb50:	00812423          	sw	s0,8(sp)
8040fb54:	00912223          	sw	s1,4(sp)
8040fb58:	01212023          	sw	s2,0(sp)
8040fb5c:	08050e63          	beqz	a0,8040fbf8 <sfs_cleanup+0xb0>
8040fb60:	06c52783          	lw	a5,108(a0)
8040fb64:	00050493          	mv	s1,a0
8040fb68:	08079863          	bnez	a5,8040fbf8 <sfs_cleanup+0xb0>
8040fb6c:	00452703          	lw	a4,4(a0)
8040fb70:	00852683          	lw	a3,8(a0)
8040fb74:	00c50913          	addi	s2,a0,12
8040fb78:	00090593          	mv	a1,s2
8040fb7c:	40d70633          	sub	a2,a4,a3
8040fb80:	00006517          	auipc	a0,0x6
8040fb84:	27050513          	addi	a0,a0,624 # 80415df0 <dev_node_ops+0x370>
8040fb88:	e74f00ef          	jal	ra,804001fc <cprintf>
8040fb8c:	02000413          	li	s0,32
8040fb90:	00c0006f          	j	8040fb9c <sfs_cleanup+0x54>
8040fb94:	fff40413          	addi	s0,s0,-1
8040fb98:	02040663          	beqz	s0,8040fbc4 <sfs_cleanup+0x7c>
8040fb9c:	0704a783          	lw	a5,112(s1)
8040fba0:	00048513          	mv	a0,s1
8040fba4:	000780e7          	jalr	a5
8040fba8:	fe0516e3          	bnez	a0,8040fb94 <sfs_cleanup+0x4c>
8040fbac:	00c12083          	lw	ra,12(sp)
8040fbb0:	00812403          	lw	s0,8(sp)
8040fbb4:	00412483          	lw	s1,4(sp)
8040fbb8:	00012903          	lw	s2,0(sp)
8040fbbc:	01010113          	addi	sp,sp,16
8040fbc0:	00008067          	ret
8040fbc4:	00812403          	lw	s0,8(sp)
8040fbc8:	00c12083          	lw	ra,12(sp)
8040fbcc:	00412483          	lw	s1,4(sp)
8040fbd0:	00090693          	mv	a3,s2
8040fbd4:	00012903          	lw	s2,0(sp)
8040fbd8:	00050713          	mv	a4,a0
8040fbdc:	00006617          	auipc	a2,0x6
8040fbe0:	23460613          	addi	a2,a2,564 # 80415e10 <dev_node_ops+0x390>
8040fbe4:	05f00593          	li	a1,95
8040fbe8:	00006517          	auipc	a0,0x6
8040fbec:	36c50513          	addi	a0,a0,876 # 80415f54 <dev_node_ops+0x4d4>
8040fbf0:	01010113          	addi	sp,sp,16
8040fbf4:	ab5f006f          	j	804006a8 <__warn>
8040fbf8:	00006697          	auipc	a3,0x6
8040fbfc:	33068693          	addi	a3,a3,816 # 80415f28 <dev_node_ops+0x4a8>
8040fc00:	00003617          	auipc	a2,0x3
8040fc04:	2c860613          	addi	a2,a2,712 # 80412ec8 <commands+0x1bc>
8040fc08:	05400593          	li	a1,84
8040fc0c:	00006517          	auipc	a0,0x6
8040fc10:	34850513          	addi	a0,a0,840 # 80415f54 <dev_node_ops+0x4d4>
8040fc14:	a11f00ef          	jal	ra,80400624 <__panic>

8040fc18 <sfs_get_root>:
8040fc18:	fe010113          	addi	sp,sp,-32
8040fc1c:	00112e23          	sw	ra,28(sp)
8040fc20:	02050663          	beqz	a0,8040fc4c <sfs_get_root+0x34>
8040fc24:	06c52783          	lw	a5,108(a0)
8040fc28:	02079263          	bnez	a5,8040fc4c <sfs_get_root+0x34>
8040fc2c:	00100613          	li	a2,1
8040fc30:	00c10593          	addi	a1,sp,12
8040fc34:	0e5010ef          	jal	ra,80411518 <sfs_load_inode>
8040fc38:	02051a63          	bnez	a0,8040fc6c <sfs_get_root+0x54>
8040fc3c:	01c12083          	lw	ra,28(sp)
8040fc40:	00c12503          	lw	a0,12(sp)
8040fc44:	02010113          	addi	sp,sp,32
8040fc48:	00008067          	ret
8040fc4c:	00006697          	auipc	a3,0x6
8040fc50:	2dc68693          	addi	a3,a3,732 # 80415f28 <dev_node_ops+0x4a8>
8040fc54:	00003617          	auipc	a2,0x3
8040fc58:	27460613          	addi	a2,a2,628 # 80412ec8 <commands+0x1bc>
8040fc5c:	03600593          	li	a1,54
8040fc60:	00006517          	auipc	a0,0x6
8040fc64:	2f450513          	addi	a0,a0,756 # 80415f54 <dev_node_ops+0x4d4>
8040fc68:	9bdf00ef          	jal	ra,80400624 <__panic>
8040fc6c:	00050693          	mv	a3,a0
8040fc70:	00006617          	auipc	a2,0x6
8040fc74:	29c60613          	addi	a2,a2,668 # 80415f0c <dev_node_ops+0x48c>
8040fc78:	03700593          	li	a1,55
8040fc7c:	00006517          	auipc	a0,0x6
8040fc80:	2d850513          	addi	a0,a0,728 # 80415f54 <dev_node_ops+0x4d4>
8040fc84:	9a1f00ef          	jal	ra,80400624 <__panic>

8040fc88 <sfs_do_mount>:
8040fc88:	00452703          	lw	a4,4(a0)
8040fc8c:	fa010113          	addi	sp,sp,-96
8040fc90:	04112e23          	sw	ra,92(sp)
8040fc94:	04812c23          	sw	s0,88(sp)
8040fc98:	04912a23          	sw	s1,84(sp)
8040fc9c:	05212823          	sw	s2,80(sp)
8040fca0:	05312623          	sw	s3,76(sp)
8040fca4:	05412423          	sw	s4,72(sp)
8040fca8:	05512223          	sw	s5,68(sp)
8040fcac:	05612023          	sw	s6,64(sp)
8040fcb0:	03712e23          	sw	s7,60(sp)
8040fcb4:	03812c23          	sw	s8,56(sp)
8040fcb8:	03912a23          	sw	s9,52(sp)
8040fcbc:	03a12823          	sw	s10,48(sp)
8040fcc0:	03b12623          	sw	s11,44(sp)
8040fcc4:	000017b7          	lui	a5,0x1
8040fcc8:	2ef71263          	bne	a4,a5,8040ffac <sfs_do_mount+0x324>
8040fccc:	00050913          	mv	s2,a0
8040fcd0:	00000513          	li	a0,0
8040fcd4:	00058a93          	mv	s5,a1
8040fcd8:	c85fd0ef          	jal	ra,8040d95c <__alloc_fs>
8040fcdc:	00050413          	mv	s0,a0
8040fce0:	2e050263          	beqz	a0,8040ffc4 <sfs_do_mount+0x33c>
8040fce4:	06c52a03          	lw	s4,108(a0)
8040fce8:	300a1263          	bnez	s4,8040ffec <sfs_do_mount+0x364>
8040fcec:	03252623          	sw	s2,44(a0)
8040fcf0:	00001537          	lui	a0,0x1
8040fcf4:	ccdf20ef          	jal	ra,804029c0 <kmalloc>
8040fcf8:	02a42c23          	sw	a0,56(s0)
8040fcfc:	00050493          	mv	s1,a0
8040fd00:	1a050c63          	beqz	a0,8040feb8 <sfs_do_mount+0x230>
8040fd04:	00050613          	mv	a2,a0
8040fd08:	00000593          	li	a1,0
8040fd0c:	00090513          	mv	a0,s2
8040fd10:	d39ff0ef          	jal	ra,8040fa48 <sfs_init_read>
8040fd14:	00050b13          	mv	s6,a0
8040fd18:	14051863          	bnez	a0,8040fe68 <sfs_do_mount+0x1e0>
8040fd1c:	0004a583          	lw	a1,0(s1)
8040fd20:	2f8dc637          	lui	a2,0x2f8dc
8040fd24:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f863e2a>
8040fd28:	1ac59863          	bne	a1,a2,8040fed8 <sfs_do_mount+0x250>
8040fd2c:	0044a783          	lw	a5,4(s1)
8040fd30:	00092603          	lw	a2,0(s2)
8040fd34:	18f66663          	bltu	a2,a5,8040fec0 <sfs_do_mount+0x238>
8040fd38:	020485a3          	sb	zero,43(s1)
8040fd3c:	0084af03          	lw	t5,8(s1)
8040fd40:	00c4ae83          	lw	t4,12(s1)
8040fd44:	0104ae03          	lw	t3,16(s1)
8040fd48:	0144a303          	lw	t1,20(s1)
8040fd4c:	0184a883          	lw	a7,24(s1)
8040fd50:	01c4a803          	lw	a6,28(s1)
8040fd54:	0204a603          	lw	a2,32(s1)
8040fd58:	0244a683          	lw	a3,36(s1)
8040fd5c:	0284a703          	lw	a4,40(s1)
8040fd60:	00002537          	lui	a0,0x2
8040fd64:	00f42223          	sw	a5,4(s0)
8040fd68:	00b42023          	sw	a1,0(s0)
8040fd6c:	01e42423          	sw	t5,8(s0)
8040fd70:	01d42623          	sw	t4,12(s0)
8040fd74:	01c42823          	sw	t3,16(s0)
8040fd78:	00642a23          	sw	t1,20(s0)
8040fd7c:	01142c23          	sw	a7,24(s0)
8040fd80:	01042e23          	sw	a6,28(s0)
8040fd84:	02c42023          	sw	a2,32(s0)
8040fd88:	02d42223          	sw	a3,36(s0)
8040fd8c:	02e42423          	sw	a4,40(s0)
8040fd90:	c31f20ef          	jal	ra,804029c0 <kmalloc>
8040fd94:	00a12423          	sw	a0,8(sp)
8040fd98:	06a42423          	sw	a0,104(s0)
8040fd9c:	00050793          	mv	a5,a0
8040fda0:	20050a63          	beqz	a0,8040ffb4 <sfs_do_mount+0x32c>
8040fda4:	00002737          	lui	a4,0x2
8040fda8:	00e50733          	add	a4,a0,a4
8040fdac:	00f7a223          	sw	a5,4(a5) # 1004 <_binary_bin_swap_img_size-0x6ffc>
8040fdb0:	00f7a023          	sw	a5,0(a5)
8040fdb4:	00878793          	addi	a5,a5,8
8040fdb8:	fee79ae3          	bne	a5,a4,8040fdac <sfs_do_mount+0x124>
8040fdbc:	0044ab83          	lw	s7,4(s1)
8040fdc0:	00008737          	lui	a4,0x8
8040fdc4:	fff70993          	addi	s3,a4,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8040fdc8:	ffff87b7          	lui	a5,0xffff8
8040fdcc:	013b8bb3          	add	s7,s7,s3
8040fdd0:	00fbfbb3          	and	s7,s7,a5
8040fdd4:	000b8513          	mv	a0,s7
8040fdd8:	fdcff0ef          	jal	ra,8040f5b4 <bitmap_create>
8040fddc:	02a42823          	sw	a0,48(s0)
8040fde0:	00050c93          	mv	s9,a0
8040fde4:	1c050063          	beqz	a0,8040ffa4 <sfs_do_mount+0x31c>
8040fde8:	0044a703          	lw	a4,4(s1)
8040fdec:	01c10593          	addi	a1,sp,28
8040fdf0:	01370733          	add	a4,a4,s3
8040fdf4:	00f75713          	srli	a4,a4,0xf
8040fdf8:	00e12623          	sw	a4,12(sp)
8040fdfc:	a85ff0ef          	jal	ra,8040f880 <bitmap_getdata>
8040fe00:	00050c13          	mv	s8,a0
8040fe04:	1c050463          	beqz	a0,8040ffcc <sfs_do_mount+0x344>
8040fe08:	00c12703          	lw	a4,12(sp)
8040fe0c:	01c12683          	lw	a3,28(sp)
8040fe10:	00c71613          	slli	a2,a4,0xc
8040fe14:	1ad61c63          	bne	a2,a3,8040ffcc <sfs_do_mount+0x344>
8040fe18:	00200993          	li	s3,2
8040fe1c:	00001db7          	lui	s11,0x1
8040fe20:	00270d13          	addi	s10,a4,2
8040fe24:	00071a63          	bnez	a4,8040fe38 <sfs_do_mount+0x1b0>
8040fe28:	0c40006f          	j	8040feec <sfs_do_mount+0x264>
8040fe2c:	00198993          	addi	s3,s3,1
8040fe30:	01bc0c33          	add	s8,s8,s11
8040fe34:	0ba98c63          	beq	s3,s10,8040feec <sfs_do_mount+0x264>
8040fe38:	000c0613          	mv	a2,s8
8040fe3c:	00098593          	mv	a1,s3
8040fe40:	00090513          	mv	a0,s2
8040fe44:	c05ff0ef          	jal	ra,8040fa48 <sfs_init_read>
8040fe48:	fe0502e3          	beqz	a0,8040fe2c <sfs_do_mount+0x1a4>
8040fe4c:	00a12623          	sw	a0,12(sp)
8040fe50:	000c8513          	mv	a0,s9
8040fe54:	a01ff0ef          	jal	ra,8040f854 <bitmap_destroy>
8040fe58:	00c12703          	lw	a4,12(sp)
8040fe5c:	00070b13          	mv	s6,a4
8040fe60:	00812503          	lw	a0,8(sp)
8040fe64:	c81f20ef          	jal	ra,80402ae4 <kfree>
8040fe68:	00048513          	mv	a0,s1
8040fe6c:	c79f20ef          	jal	ra,80402ae4 <kfree>
8040fe70:	00040513          	mv	a0,s0
8040fe74:	c71f20ef          	jal	ra,80402ae4 <kfree>
8040fe78:	05c12083          	lw	ra,92(sp)
8040fe7c:	05812403          	lw	s0,88(sp)
8040fe80:	000b0513          	mv	a0,s6
8040fe84:	05412483          	lw	s1,84(sp)
8040fe88:	05012903          	lw	s2,80(sp)
8040fe8c:	04c12983          	lw	s3,76(sp)
8040fe90:	04812a03          	lw	s4,72(sp)
8040fe94:	04412a83          	lw	s5,68(sp)
8040fe98:	04012b03          	lw	s6,64(sp)
8040fe9c:	03c12b83          	lw	s7,60(sp)
8040fea0:	03812c03          	lw	s8,56(sp)
8040fea4:	03412c83          	lw	s9,52(sp)
8040fea8:	03012d03          	lw	s10,48(sp)
8040feac:	02c12d83          	lw	s11,44(sp)
8040feb0:	06010113          	addi	sp,sp,96
8040feb4:	00008067          	ret
8040feb8:	ffc00b13          	li	s6,-4
8040febc:	fb5ff06f          	j	8040fe70 <sfs_do_mount+0x1e8>
8040fec0:	00078593          	mv	a1,a5
8040fec4:	00006517          	auipc	a0,0x6
8040fec8:	fa050513          	addi	a0,a0,-96 # 80415e64 <dev_node_ops+0x3e4>
8040fecc:	b30f00ef          	jal	ra,804001fc <cprintf>
8040fed0:	ffd00b13          	li	s6,-3
8040fed4:	f95ff06f          	j	8040fe68 <sfs_do_mount+0x1e0>
8040fed8:	00006517          	auipc	a0,0x6
8040fedc:	f5450513          	addi	a0,a0,-172 # 80415e2c <dev_node_ops+0x3ac>
8040fee0:	b1cf00ef          	jal	ra,804001fc <cprintf>
8040fee4:	ffd00b13          	li	s6,-3
8040fee8:	f81ff06f          	j	8040fe68 <sfs_do_mount+0x1e0>
8040feec:	00442903          	lw	s2,4(s0)
8040fef0:	00000493          	li	s1,0
8040fef4:	0c0b8463          	beqz	s7,8040ffbc <sfs_do_mount+0x334>
8040fef8:	00048593          	mv	a1,s1
8040fefc:	000c8513          	mv	a0,s9
8040ff00:	8b1ff0ef          	jal	ra,8040f7b0 <bitmap_test>
8040ff04:	00a03533          	snez	a0,a0
8040ff08:	00148493          	addi	s1,s1,1
8040ff0c:	00aa0a33          	add	s4,s4,a0
8040ff10:	fe9b94e3          	bne	s7,s1,8040fef8 <sfs_do_mount+0x270>
8040ff14:	00842783          	lw	a5,8(s0)
8040ff18:	0f479a63          	bne	a5,s4,8041000c <sfs_do_mount+0x384>
8040ff1c:	00100593          	li	a1,1
8040ff20:	03c40513          	addi	a0,s0,60
8040ff24:	02042a23          	sw	zero,52(s0)
8040ff28:	aa0f50ef          	jal	ra,804051c8 <sem_init>
8040ff2c:	00100593          	li	a1,1
8040ff30:	04840513          	addi	a0,s0,72
8040ff34:	a94f50ef          	jal	ra,804051c8 <sem_init>
8040ff38:	00100593          	li	a1,1
8040ff3c:	05440513          	addi	a0,s0,84
8040ff40:	a88f50ef          	jal	ra,804051c8 <sem_init>
8040ff44:	06040793          	addi	a5,s0,96
8040ff48:	06f42223          	sw	a5,100(s0)
8040ff4c:	06f42023          	sw	a5,96(s0)
8040ff50:	00090713          	mv	a4,s2
8040ff54:	000a0693          	mv	a3,s4
8040ff58:	41490633          	sub	a2,s2,s4
8040ff5c:	00c40593          	addi	a1,s0,12
8040ff60:	00006517          	auipc	a0,0x6
8040ff64:	f8c50513          	addi	a0,a0,-116 # 80415eec <dev_node_ops+0x46c>
8040ff68:	a94f00ef          	jal	ra,804001fc <cprintf>
8040ff6c:	00000797          	auipc	a5,0x0
8040ff70:	96c78793          	addi	a5,a5,-1684 # 8040f8d8 <sfs_sync>
8040ff74:	06f42823          	sw	a5,112(s0)
8040ff78:	00000797          	auipc	a5,0x0
8040ff7c:	ca078793          	addi	a5,a5,-864 # 8040fc18 <sfs_get_root>
8040ff80:	06f42a23          	sw	a5,116(s0)
8040ff84:	00000797          	auipc	a5,0x0
8040ff88:	b1078793          	addi	a5,a5,-1264 # 8040fa94 <sfs_unmount>
8040ff8c:	06f42c23          	sw	a5,120(s0)
8040ff90:	00000797          	auipc	a5,0x0
8040ff94:	bb878793          	addi	a5,a5,-1096 # 8040fb48 <sfs_cleanup>
8040ff98:	06f42e23          	sw	a5,124(s0)
8040ff9c:	008aa023          	sw	s0,0(s5)
8040ffa0:	ed9ff06f          	j	8040fe78 <sfs_do_mount+0x1f0>
8040ffa4:	ffc00b13          	li	s6,-4
8040ffa8:	eb9ff06f          	j	8040fe60 <sfs_do_mount+0x1d8>
8040ffac:	ff200b13          	li	s6,-14
8040ffb0:	ec9ff06f          	j	8040fe78 <sfs_do_mount+0x1f0>
8040ffb4:	ffc00b13          	li	s6,-4
8040ffb8:	eb1ff06f          	j	8040fe68 <sfs_do_mount+0x1e0>
8040ffbc:	00000a13          	li	s4,0
8040ffc0:	f55ff06f          	j	8040ff14 <sfs_do_mount+0x28c>
8040ffc4:	ffc00b13          	li	s6,-4
8040ffc8:	eb1ff06f          	j	8040fe78 <sfs_do_mount+0x1f0>
8040ffcc:	00006697          	auipc	a3,0x6
8040ffd0:	ec868693          	addi	a3,a3,-312 # 80415e94 <dev_node_ops+0x414>
8040ffd4:	00003617          	auipc	a2,0x3
8040ffd8:	ef460613          	addi	a2,a2,-268 # 80412ec8 <commands+0x1bc>
8040ffdc:	08300593          	li	a1,131
8040ffe0:	00006517          	auipc	a0,0x6
8040ffe4:	f7450513          	addi	a0,a0,-140 # 80415f54 <dev_node_ops+0x4d4>
8040ffe8:	e3cf00ef          	jal	ra,80400624 <__panic>
8040ffec:	00006697          	auipc	a3,0x6
8040fff0:	f3c68693          	addi	a3,a3,-196 # 80415f28 <dev_node_ops+0x4a8>
8040fff4:	00003617          	auipc	a2,0x3
8040fff8:	ed460613          	addi	a2,a2,-300 # 80412ec8 <commands+0x1bc>
8040fffc:	0a300593          	li	a1,163
80410000:	00006517          	auipc	a0,0x6
80410004:	f5450513          	addi	a0,a0,-172 # 80415f54 <dev_node_ops+0x4d4>
80410008:	e1cf00ef          	jal	ra,80400624 <__panic>
8041000c:	00006697          	auipc	a3,0x6
80410010:	eb468693          	addi	a3,a3,-332 # 80415ec0 <dev_node_ops+0x440>
80410014:	00003617          	auipc	a2,0x3
80410018:	eb460613          	addi	a2,a2,-332 # 80412ec8 <commands+0x1bc>
8041001c:	0e000593          	li	a1,224
80410020:	00006517          	auipc	a0,0x6
80410024:	f3450513          	addi	a0,a0,-204 # 80415f54 <dev_node_ops+0x4d4>
80410028:	dfcf00ef          	jal	ra,80400624 <__panic>

8041002c <sfs_mount>:
8041002c:	00000597          	auipc	a1,0x0
80410030:	c5c58593          	addi	a1,a1,-932 # 8040fc88 <sfs_do_mount>
80410034:	f15fd06f          	j	8040df48 <vfs_mount>

80410038 <sfs_opendir>:
80410038:	0235f593          	andi	a1,a1,35
8041003c:	00000513          	li	a0,0
80410040:	00059463          	bnez	a1,80410048 <sfs_opendir+0x10>
80410044:	00008067          	ret
80410048:	fef00513          	li	a0,-17
8041004c:	00008067          	ret

80410050 <sfs_openfile>:
80410050:	00000513          	li	a0,0
80410054:	00008067          	ret

80410058 <sfs_fsync>:
80410058:	fe010113          	addi	sp,sp,-32
8041005c:	01212823          	sw	s2,16(sp)
80410060:	03852903          	lw	s2,56(a0)
80410064:	00112e23          	sw	ra,28(sp)
80410068:	00812c23          	sw	s0,24(sp)
8041006c:	00912a23          	sw	s1,20(sp)
80410070:	01312623          	sw	s3,12(sp)
80410074:	0a090a63          	beqz	s2,80410128 <sfs_fsync+0xd0>
80410078:	06c92783          	lw	a5,108(s2)
8041007c:	0a079663          	bnez	a5,80410128 <sfs_fsync+0xd0>
80410080:	02c52703          	lw	a4,44(a0)
80410084:	000017b7          	lui	a5,0x1
80410088:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8041008c:	00050413          	mv	s0,a0
80410090:	0af71c63          	bne	a4,a5,80410148 <sfs_fsync+0xf0>
80410094:	00852483          	lw	s1,8(a0)
80410098:	02049263          	bnez	s1,804100bc <sfs_fsync+0x64>
8041009c:	01c12083          	lw	ra,28(sp)
804100a0:	01812403          	lw	s0,24(sp)
804100a4:	00048513          	mv	a0,s1
804100a8:	01012903          	lw	s2,16(sp)
804100ac:	01412483          	lw	s1,20(sp)
804100b0:	00c12983          	lw	s3,12(sp)
804100b4:	02010113          	addi	sp,sp,32
804100b8:	00008067          	ret
804100bc:	01050993          	addi	s3,a0,16
804100c0:	00098513          	mv	a0,s3
804100c4:	914f50ef          	jal	ra,804051d8 <down>
804100c8:	00842483          	lw	s1,8(s0)
804100cc:	02049663          	bnez	s1,804100f8 <sfs_fsync+0xa0>
804100d0:	00098513          	mv	a0,s3
804100d4:	900f50ef          	jal	ra,804051d4 <up>
804100d8:	01c12083          	lw	ra,28(sp)
804100dc:	01812403          	lw	s0,24(sp)
804100e0:	00048513          	mv	a0,s1
804100e4:	01012903          	lw	s2,16(sp)
804100e8:	01412483          	lw	s1,20(sp)
804100ec:	00c12983          	lw	s3,12(sp)
804100f0:	02010113          	addi	sp,sp,32
804100f4:	00008067          	ret
804100f8:	00442683          	lw	a3,4(s0)
804100fc:	00042583          	lw	a1,0(s0)
80410100:	00042423          	sw	zero,8(s0)
80410104:	00000713          	li	a4,0
80410108:	04000613          	li	a2,64
8041010c:	00090513          	mv	a0,s2
80410110:	691010ef          	jal	ra,80411fa0 <sfs_wbuf>
80410114:	00050493          	mv	s1,a0
80410118:	fa050ce3          	beqz	a0,804100d0 <sfs_fsync+0x78>
8041011c:	00100793          	li	a5,1
80410120:	00f42423          	sw	a5,8(s0)
80410124:	fadff06f          	j	804100d0 <sfs_fsync+0x78>
80410128:	00006697          	auipc	a3,0x6
8041012c:	e0068693          	addi	a3,a3,-512 # 80415f28 <dev_node_ops+0x4a8>
80410130:	00003617          	auipc	a2,0x3
80410134:	d9860613          	addi	a2,a2,-616 # 80412ec8 <commands+0x1bc>
80410138:	2c700593          	li	a1,711
8041013c:	00006517          	auipc	a0,0x6
80410140:	f8850513          	addi	a0,a0,-120 # 804160c4 <dev_node_ops+0x644>
80410144:	ce0f00ef          	jal	ra,80400624 <__panic>
80410148:	00006697          	auipc	a3,0x6
8041014c:	f9468693          	addi	a3,a3,-108 # 804160dc <dev_node_ops+0x65c>
80410150:	00003617          	auipc	a2,0x3
80410154:	d7860613          	addi	a2,a2,-648 # 80412ec8 <commands+0x1bc>
80410158:	2c800593          	li	a1,712
8041015c:	00006517          	auipc	a0,0x6
80410160:	f6850513          	addi	a0,a0,-152 # 804160c4 <dev_node_ops+0x644>
80410164:	cc0f00ef          	jal	ra,80400624 <__panic>

80410168 <sfs_gettype>:
80410168:	ff010113          	addi	sp,sp,-16
8041016c:	00112623          	sw	ra,12(sp)
80410170:	06050e63          	beqz	a0,804101ec <sfs_gettype+0x84>
80410174:	02c52683          	lw	a3,44(a0)
80410178:	000017b7          	lui	a5,0x1
8041017c:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410180:	06e69663          	bne	a3,a4,804101ec <sfs_gettype+0x84>
80410184:	00052683          	lw	a3,0(a0)
80410188:	00200713          	li	a4,2
8041018c:	0046d683          	lhu	a3,4(a3)
80410190:	04e68263          	beq	a3,a4,804101d4 <sfs_gettype+0x6c>
80410194:	00300713          	li	a4,3
80410198:	02e68263          	beq	a3,a4,804101bc <sfs_gettype+0x54>
8041019c:	00100713          	li	a4,1
804101a0:	02e68063          	beq	a3,a4,804101c0 <sfs_gettype+0x58>
804101a4:	00006617          	auipc	a2,0x6
804101a8:	f7060613          	addi	a2,a2,-144 # 80416114 <dev_node_ops+0x694>
804101ac:	38f00593          	li	a1,911
804101b0:	00006517          	auipc	a0,0x6
804101b4:	f1450513          	addi	a0,a0,-236 # 804160c4 <dev_node_ops+0x644>
804101b8:	c6cf00ef          	jal	ra,80400624 <__panic>
804101bc:	000037b7          	lui	a5,0x3
804101c0:	00c12083          	lw	ra,12(sp)
804101c4:	00f5a023          	sw	a5,0(a1)
804101c8:	00000513          	li	a0,0
804101cc:	01010113          	addi	sp,sp,16
804101d0:	00008067          	ret
804101d4:	00c12083          	lw	ra,12(sp)
804101d8:	000027b7          	lui	a5,0x2
804101dc:	00f5a023          	sw	a5,0(a1)
804101e0:	00000513          	li	a0,0
804101e4:	01010113          	addi	sp,sp,16
804101e8:	00008067          	ret
804101ec:	00006697          	auipc	a3,0x6
804101f0:	ef068693          	addi	a3,a3,-272 # 804160dc <dev_node_ops+0x65c>
804101f4:	00003617          	auipc	a2,0x3
804101f8:	cd460613          	addi	a2,a2,-812 # 80412ec8 <commands+0x1bc>
804101fc:	38300593          	li	a1,899
80410200:	00006517          	auipc	a0,0x6
80410204:	ec450513          	addi	a0,a0,-316 # 804160c4 <dev_node_ops+0x644>
80410208:	c1cf00ef          	jal	ra,80400624 <__panic>

8041020c <sfs_block_inuse.isra.3>:
8041020c:	ff010113          	addi	sp,sp,-16
80410210:	00112623          	sw	ra,12(sp)
80410214:	02060263          	beqz	a2,80410238 <sfs_block_inuse.isra.3+0x2c>
80410218:	02a67063          	bgeu	a2,a0,80410238 <sfs_block_inuse.isra.3+0x2c>
8041021c:	0005a503          	lw	a0,0(a1)
80410220:	00060593          	mv	a1,a2
80410224:	d8cff0ef          	jal	ra,8040f7b0 <bitmap_test>
80410228:	00c12083          	lw	ra,12(sp)
8041022c:	00153513          	seqz	a0,a0
80410230:	01010113          	addi	sp,sp,16
80410234:	00008067          	ret
80410238:	00060713          	mv	a4,a2
8041023c:	00050693          	mv	a3,a0
80410240:	00006617          	auipc	a2,0x6
80410244:	d8460613          	addi	a2,a2,-636 # 80415fc4 <dev_node_ops+0x544>
80410248:	05300593          	li	a1,83
8041024c:	00006517          	auipc	a0,0x6
80410250:	e7850513          	addi	a0,a0,-392 # 804160c4 <dev_node_ops+0x644>
80410254:	bd0f00ef          	jal	ra,80400624 <__panic>

80410258 <sfs_block_alloc>:
80410258:	ff010113          	addi	sp,sp,-16
8041025c:	00812423          	sw	s0,8(sp)
80410260:	00050413          	mv	s0,a0
80410264:	03052503          	lw	a0,48(a0)
80410268:	00912223          	sw	s1,4(sp)
8041026c:	00112623          	sw	ra,12(sp)
80410270:	00058493          	mv	s1,a1
80410274:	c90ff0ef          	jal	ra,8040f704 <bitmap_alloc>
80410278:	04051863          	bnez	a0,804102c8 <sfs_block_alloc+0x70>
8041027c:	00842783          	lw	a5,8(s0)
80410280:	06078e63          	beqz	a5,804102fc <sfs_block_alloc+0xa4>
80410284:	fff78793          	addi	a5,a5,-1 # 1fff <_binary_bin_swap_img_size-0x6001>
80410288:	00f42423          	sw	a5,8(s0)
8041028c:	00100793          	li	a5,1
80410290:	02f42a23          	sw	a5,52(s0)
80410294:	0004a603          	lw	a2,0(s1)
80410298:	00442503          	lw	a0,4(s0)
8041029c:	03040593          	addi	a1,s0,48
804102a0:	f6dff0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
804102a4:	02050c63          	beqz	a0,804102dc <sfs_block_alloc+0x84>
804102a8:	00040513          	mv	a0,s0
804102ac:	00812403          	lw	s0,8(sp)
804102b0:	0004a583          	lw	a1,0(s1)
804102b4:	00c12083          	lw	ra,12(sp)
804102b8:	00412483          	lw	s1,4(sp)
804102bc:	00100613          	li	a2,1
804102c0:	01010113          	addi	sp,sp,16
804102c4:	6bd0106f          	j	80412180 <sfs_clear_block>
804102c8:	00c12083          	lw	ra,12(sp)
804102cc:	00812403          	lw	s0,8(sp)
804102d0:	00412483          	lw	s1,4(sp)
804102d4:	01010113          	addi	sp,sp,16
804102d8:	00008067          	ret
804102dc:	00006697          	auipc	a3,0x6
804102e0:	cc468693          	addi	a3,a3,-828 # 80415fa0 <dev_node_ops+0x520>
804102e4:	00003617          	auipc	a2,0x3
804102e8:	be460613          	addi	a2,a2,-1052 # 80412ec8 <commands+0x1bc>
804102ec:	06100593          	li	a1,97
804102f0:	00006517          	auipc	a0,0x6
804102f4:	dd450513          	addi	a0,a0,-556 # 804160c4 <dev_node_ops+0x644>
804102f8:	b2cf00ef          	jal	ra,80400624 <__panic>
804102fc:	00006697          	auipc	a3,0x6
80410300:	c8468693          	addi	a3,a3,-892 # 80415f80 <dev_node_ops+0x500>
80410304:	00003617          	auipc	a2,0x3
80410308:	bc460613          	addi	a2,a2,-1084 # 80412ec8 <commands+0x1bc>
8041030c:	05f00593          	li	a1,95
80410310:	00006517          	auipc	a0,0x6
80410314:	db450513          	addi	a0,a0,-588 # 804160c4 <dev_node_ops+0x644>
80410318:	b0cf00ef          	jal	ra,80400624 <__panic>

8041031c <sfs_block_free>:
8041031c:	ff010113          	addi	sp,sp,-16
80410320:	00812423          	sw	s0,8(sp)
80410324:	00050413          	mv	s0,a0
80410328:	00452503          	lw	a0,4(a0)
8041032c:	00912223          	sw	s1,4(sp)
80410330:	00058613          	mv	a2,a1
80410334:	00058493          	mv	s1,a1
80410338:	03040593          	addi	a1,s0,48
8041033c:	00112623          	sw	ra,12(sp)
80410340:	ecdff0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
80410344:	02050c63          	beqz	a0,8041037c <sfs_block_free+0x60>
80410348:	03042503          	lw	a0,48(s0)
8041034c:	00048593          	mv	a1,s1
80410350:	c98ff0ef          	jal	ra,8040f7e8 <bitmap_free>
80410354:	00842783          	lw	a5,8(s0)
80410358:	00100713          	li	a4,1
8041035c:	02e42a23          	sw	a4,52(s0)
80410360:	00178793          	addi	a5,a5,1
80410364:	00f42423          	sw	a5,8(s0)
80410368:	00c12083          	lw	ra,12(sp)
8041036c:	00812403          	lw	s0,8(sp)
80410370:	00412483          	lw	s1,4(sp)
80410374:	01010113          	addi	sp,sp,16
80410378:	00008067          	ret
8041037c:	00006697          	auipc	a3,0x6
80410380:	ce068693          	addi	a3,a3,-800 # 8041605c <dev_node_ops+0x5dc>
80410384:	00003617          	auipc	a2,0x3
80410388:	b4460613          	addi	a2,a2,-1212 # 80412ec8 <commands+0x1bc>
8041038c:	06a00593          	li	a1,106
80410390:	00006517          	auipc	a0,0x6
80410394:	d3450513          	addi	a0,a0,-716 # 804160c4 <dev_node_ops+0x644>
80410398:	a8cf00ef          	jal	ra,80400624 <__panic>

8041039c <sfs_reclaim>:
8041039c:	ff010113          	addi	sp,sp,-16
804103a0:	00912223          	sw	s1,4(sp)
804103a4:	03852483          	lw	s1,56(a0)
804103a8:	00112623          	sw	ra,12(sp)
804103ac:	00812423          	sw	s0,8(sp)
804103b0:	01212023          	sw	s2,0(sp)
804103b4:	16048c63          	beqz	s1,8041052c <sfs_reclaim+0x190>
804103b8:	06c4a783          	lw	a5,108(s1)
804103bc:	16079863          	bnez	a5,8041052c <sfs_reclaim+0x190>
804103c0:	02c52703          	lw	a4,44(a0)
804103c4:	000017b7          	lui	a5,0x1
804103c8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804103cc:	00050413          	mv	s0,a0
804103d0:	18f71e63          	bne	a4,a5,8041056c <sfs_reclaim+0x1d0>
804103d4:	00048513          	mv	a0,s1
804103d8:	661010ef          	jal	ra,80412238 <lock_sfs_fs>
804103dc:	00c42783          	lw	a5,12(s0)
804103e0:	16f05663          	blez	a5,8041054c <sfs_reclaim+0x1b0>
804103e4:	fff78793          	addi	a5,a5,-1
804103e8:	00f42623          	sw	a5,12(s0)
804103ec:	0e079463          	bnez	a5,804104d4 <sfs_reclaim+0x138>
804103f0:	03042903          	lw	s2,48(s0)
804103f4:	0e091063          	bnez	s2,804104d4 <sfs_reclaim+0x138>
804103f8:	00042783          	lw	a5,0(s0)
804103fc:	0067d783          	lhu	a5,6(a5)
80410400:	02079e63          	bnez	a5,8041043c <sfs_reclaim+0xa0>
80410404:	03c42783          	lw	a5,60(s0)
80410408:	18078263          	beqz	a5,8041058c <sfs_reclaim+0x1f0>
8041040c:	0307a783          	lw	a5,48(a5)
80410410:	16078e63          	beqz	a5,8041058c <sfs_reclaim+0x1f0>
80410414:	00005597          	auipc	a1,0x5
80410418:	4f858593          	addi	a1,a1,1272 # 8041590c <syscalls+0x8c0>
8041041c:	00040513          	mv	a0,s0
80410420:	ab0fd0ef          	jal	ra,8040d6d0 <inode_check>
80410424:	03c42783          	lw	a5,60(s0)
80410428:	00000593          	li	a1,0
8041042c:	00040513          	mv	a0,s0
80410430:	0307a783          	lw	a5,48(a5)
80410434:	000780e7          	jalr	a5
80410438:	0e051663          	bnez	a0,80410524 <sfs_reclaim+0x188>
8041043c:	00842783          	lw	a5,8(s0)
80410440:	02078c63          	beqz	a5,80410478 <sfs_reclaim+0xdc>
80410444:	03c42783          	lw	a5,60(s0)
80410448:	16078263          	beqz	a5,804105ac <sfs_reclaim+0x210>
8041044c:	0187a783          	lw	a5,24(a5)
80410450:	14078e63          	beqz	a5,804105ac <sfs_reclaim+0x210>
80410454:	00040513          	mv	a0,s0
80410458:	00004597          	auipc	a1,0x4
8041045c:	0a458593          	addi	a1,a1,164 # 804144fc <CSWTCH.69+0x17c>
80410460:	a70fd0ef          	jal	ra,8040d6d0 <inode_check>
80410464:	03c42783          	lw	a5,60(s0)
80410468:	00040513          	mv	a0,s0
8041046c:	0187a783          	lw	a5,24(a5)
80410470:	000780e7          	jalr	a5
80410474:	0a051863          	bnez	a0,80410524 <sfs_reclaim+0x188>
80410478:	01c42703          	lw	a4,28(s0)
8041047c:	02042783          	lw	a5,32(s0)
80410480:	00048513          	mv	a0,s1
80410484:	00f72223          	sw	a5,4(a4)
80410488:	00e7a023          	sw	a4,0(a5)
8041048c:	02442703          	lw	a4,36(s0)
80410490:	02842783          	lw	a5,40(s0)
80410494:	00f72223          	sw	a5,4(a4)
80410498:	00e7a023          	sw	a4,0(a5)
8041049c:	5ad010ef          	jal	ra,80412248 <unlock_sfs_fs>
804104a0:	00042503          	lw	a0,0(s0)
804104a4:	00655783          	lhu	a5,6(a0)
804104a8:	04078a63          	beqz	a5,804104fc <sfs_reclaim+0x160>
804104ac:	e38f20ef          	jal	ra,80402ae4 <kfree>
804104b0:	00040513          	mv	a0,s0
804104b4:	990fd0ef          	jal	ra,8040d644 <inode_kill>
804104b8:	00c12083          	lw	ra,12(sp)
804104bc:	00812403          	lw	s0,8(sp)
804104c0:	00090513          	mv	a0,s2
804104c4:	00412483          	lw	s1,4(sp)
804104c8:	00012903          	lw	s2,0(sp)
804104cc:	01010113          	addi	sp,sp,16
804104d0:	00008067          	ret
804104d4:	ff100913          	li	s2,-15
804104d8:	00048513          	mv	a0,s1
804104dc:	56d010ef          	jal	ra,80412248 <unlock_sfs_fs>
804104e0:	00c12083          	lw	ra,12(sp)
804104e4:	00812403          	lw	s0,8(sp)
804104e8:	00090513          	mv	a0,s2
804104ec:	00412483          	lw	s1,4(sp)
804104f0:	00012903          	lw	s2,0(sp)
804104f4:	01010113          	addi	sp,sp,16
804104f8:	00008067          	ret
804104fc:	00442583          	lw	a1,4(s0)
80410500:	00048513          	mv	a0,s1
80410504:	e19ff0ef          	jal	ra,8041031c <sfs_block_free>
80410508:	00042503          	lw	a0,0(s0)
8041050c:	03c52583          	lw	a1,60(a0)
80410510:	f8058ee3          	beqz	a1,804104ac <sfs_reclaim+0x110>
80410514:	00048513          	mv	a0,s1
80410518:	e05ff0ef          	jal	ra,8041031c <sfs_block_free>
8041051c:	00042503          	lw	a0,0(s0)
80410520:	f8dff06f          	j	804104ac <sfs_reclaim+0x110>
80410524:	00050913          	mv	s2,a0
80410528:	fb1ff06f          	j	804104d8 <sfs_reclaim+0x13c>
8041052c:	00006697          	auipc	a3,0x6
80410530:	9fc68693          	addi	a3,a3,-1540 # 80415f28 <dev_node_ops+0x4a8>
80410534:	00003617          	auipc	a2,0x3
80410538:	99460613          	addi	a2,a2,-1644 # 80412ec8 <commands+0x1bc>
8041053c:	35800593          	li	a1,856
80410540:	00006517          	auipc	a0,0x6
80410544:	b8450513          	addi	a0,a0,-1148 # 804160c4 <dev_node_ops+0x644>
80410548:	8dcf00ef          	jal	ra,80400624 <__panic>
8041054c:	00006697          	auipc	a3,0x6
80410550:	d0c68693          	addi	a3,a3,-756 # 80416258 <sfs_node_fileops+0x40>
80410554:	00003617          	auipc	a2,0x3
80410558:	97460613          	addi	a2,a2,-1676 # 80412ec8 <commands+0x1bc>
8041055c:	35e00593          	li	a1,862
80410560:	00006517          	auipc	a0,0x6
80410564:	b6450513          	addi	a0,a0,-1180 # 804160c4 <dev_node_ops+0x644>
80410568:	8bcf00ef          	jal	ra,80400624 <__panic>
8041056c:	00006697          	auipc	a3,0x6
80410570:	b7068693          	addi	a3,a3,-1168 # 804160dc <dev_node_ops+0x65c>
80410574:	00003617          	auipc	a2,0x3
80410578:	95460613          	addi	a2,a2,-1708 # 80412ec8 <commands+0x1bc>
8041057c:	35900593          	li	a1,857
80410580:	00006517          	auipc	a0,0x6
80410584:	b4450513          	addi	a0,a0,-1212 # 804160c4 <dev_node_ops+0x644>
80410588:	89cf00ef          	jal	ra,80400624 <__panic>
8041058c:	00005697          	auipc	a3,0x5
80410590:	32c68693          	addi	a3,a3,812 # 804158b8 <syscalls+0x86c>
80410594:	00003617          	auipc	a2,0x3
80410598:	93460613          	addi	a2,a2,-1740 # 80412ec8 <commands+0x1bc>
8041059c:	36300593          	li	a1,867
804105a0:	00006517          	auipc	a0,0x6
804105a4:	b2450513          	addi	a0,a0,-1244 # 804160c4 <dev_node_ops+0x644>
804105a8:	87cf00ef          	jal	ra,80400624 <__panic>
804105ac:	00004697          	auipc	a3,0x4
804105b0:	f0068693          	addi	a3,a3,-256 # 804144ac <CSWTCH.69+0x12c>
804105b4:	00003617          	auipc	a2,0x3
804105b8:	91460613          	addi	a2,a2,-1772 # 80412ec8 <commands+0x1bc>
804105bc:	36800593          	li	a1,872
804105c0:	00006517          	auipc	a0,0x6
804105c4:	b0450513          	addi	a0,a0,-1276 # 804160c4 <dev_node_ops+0x644>
804105c8:	85cf00ef          	jal	ra,80400624 <__panic>

804105cc <sfs_bmap_load_nolock>:
804105cc:	fc010113          	addi	sp,sp,-64
804105d0:	03212823          	sw	s2,48(sp)
804105d4:	0005a903          	lw	s2,0(a1)
804105d8:	03312623          	sw	s3,44(sp)
804105dc:	02112e23          	sw	ra,60(sp)
804105e0:	00892983          	lw	s3,8(s2)
804105e4:	02812c23          	sw	s0,56(sp)
804105e8:	02912a23          	sw	s1,52(sp)
804105ec:	03412423          	sw	s4,40(sp)
804105f0:	03512223          	sw	s5,36(sp)
804105f4:	03612023          	sw	s6,32(sp)
804105f8:	01712e23          	sw	s7,28(sp)
804105fc:	01812c23          	sw	s8,24(sp)
80410600:	01912a23          	sw	s9,20(sp)
80410604:	01a12823          	sw	s10,16(sp)
80410608:	22c9e863          	bltu	s3,a2,80410838 <sfs_bmap_load_nolock+0x26c>
8041060c:	00b00793          	li	a5,11
80410610:	00058b13          	mv	s6,a1
80410614:	00060413          	mv	s0,a2
80410618:	00050a13          	mv	s4,a0
8041061c:	00068c13          	mv	s8,a3
80410620:	08c7fe63          	bgeu	a5,a2,804106bc <sfs_bmap_load_nolock+0xf0>
80410624:	ff460713          	addi	a4,a2,-12
80410628:	3ff00793          	li	a5,1023
8041062c:	22e7e663          	bltu	a5,a4,80410858 <sfs_bmap_load_nolock+0x28c>
80410630:	03c92c83          	lw	s9,60(s2)
80410634:	00012623          	sw	zero,12(sp)
80410638:	00271b93          	slli	s7,a4,0x2
8041063c:	01912423          	sw	s9,8(sp)
80410640:	180c9a63          	bnez	s9,804107d4 <sfs_bmap_load_nolock+0x208>
80410644:	0cc98263          	beq	s3,a2,80410708 <sfs_bmap_load_nolock+0x13c>
80410648:	03050a93          	addi	s5,a0,48
8041064c:	00000493          	li	s1,0
80410650:	004a2503          	lw	a0,4(s4)
80410654:	00048613          	mv	a2,s1
80410658:	000a8593          	mv	a1,s5
8041065c:	bb1ff0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
80410660:	08050463          	beqz	a0,804106e8 <sfs_bmap_load_nolock+0x11c>
80410664:	00899863          	bne	s3,s0,80410674 <sfs_bmap_load_nolock+0xa8>
80410668:	00892783          	lw	a5,8(s2)
8041066c:	00178793          	addi	a5,a5,1
80410670:	00f92423          	sw	a5,8(s2)
80410674:	00000a93          	li	s5,0
80410678:	000c0463          	beqz	s8,80410680 <sfs_bmap_load_nolock+0xb4>
8041067c:	009c2023          	sw	s1,0(s8)
80410680:	03c12083          	lw	ra,60(sp)
80410684:	03812403          	lw	s0,56(sp)
80410688:	000a8513          	mv	a0,s5
8041068c:	03412483          	lw	s1,52(sp)
80410690:	03012903          	lw	s2,48(sp)
80410694:	02c12983          	lw	s3,44(sp)
80410698:	02812a03          	lw	s4,40(sp)
8041069c:	02412a83          	lw	s5,36(sp)
804106a0:	02012b03          	lw	s6,32(sp)
804106a4:	01c12b83          	lw	s7,28(sp)
804106a8:	01812c03          	lw	s8,24(sp)
804106ac:	01412c83          	lw	s9,20(sp)
804106b0:	01012d03          	lw	s10,16(sp)
804106b4:	04010113          	addi	sp,sp,64
804106b8:	00008067          	ret
804106bc:	00261b93          	slli	s7,a2,0x2
804106c0:	01790bb3          	add	s7,s2,s7
804106c4:	00cba483          	lw	s1,12(s7)
804106c8:	00912223          	sw	s1,4(sp)
804106cc:	10049063          	bnez	s1,804107cc <sfs_bmap_load_nolock+0x200>
804106d0:	0cc98463          	beq	s3,a2,80410798 <sfs_bmap_load_nolock+0x1cc>
804106d4:	00452503          	lw	a0,4(a0)
804106d8:	00000613          	li	a2,0
804106dc:	030a0593          	addi	a1,s4,48
804106e0:	b2dff0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
804106e4:	f80518e3          	bnez	a0,80410674 <sfs_bmap_load_nolock+0xa8>
804106e8:	00006697          	auipc	a3,0x6
804106ec:	97468693          	addi	a3,a3,-1676 # 8041605c <dev_node_ops+0x5dc>
804106f0:	00002617          	auipc	a2,0x2
804106f4:	7d860613          	addi	a2,a2,2008 # 80412ec8 <commands+0x1bc>
804106f8:	16b00593          	li	a1,363
804106fc:	00006517          	auipc	a0,0x6
80410700:	9c850513          	addi	a0,a0,-1592 # 804160c4 <dev_node_ops+0x644>
80410704:	f21ef0ef          	jal	ra,80400624 <__panic>
80410708:	00810593          	addi	a1,sp,8
8041070c:	b4dff0ef          	jal	ra,80410258 <sfs_block_alloc>
80410710:	00050a93          	mv	s5,a0
80410714:	00c10d13          	addi	s10,sp,12
80410718:	f60514e3          	bnez	a0,80410680 <sfs_bmap_load_nolock+0xb4>
8041071c:	000d0593          	mv	a1,s10
80410720:	000a0513          	mv	a0,s4
80410724:	b35ff0ef          	jal	ra,80410258 <sfs_block_alloc>
80410728:	00050a93          	mv	s5,a0
8041072c:	0e051c63          	bnez	a0,80410824 <sfs_bmap_load_nolock+0x258>
80410730:	00812683          	lw	a3,8(sp)
80410734:	000b8713          	mv	a4,s7
80410738:	00400613          	li	a2,4
8041073c:	000d0593          	mv	a1,s10
80410740:	000a0513          	mv	a0,s4
80410744:	05d010ef          	jal	ra,80411fa0 <sfs_wbuf>
80410748:	00050a93          	mv	s5,a0
8041074c:	0c051663          	bnez	a0,80410818 <sfs_bmap_load_nolock+0x24c>
80410750:	00c12483          	lw	s1,12(sp)
80410754:	03c92703          	lw	a4,60(s2)
80410758:	00812783          	lw	a5,8(sp)
8041075c:	00912223          	sw	s1,4(sp)
80410760:	00f70a63          	beq	a4,a5,80410774 <sfs_bmap_load_nolock+0x1a8>
80410764:	12071663          	bnez	a4,80410890 <sfs_bmap_load_nolock+0x2c4>
80410768:	02f92e23          	sw	a5,60(s2)
8041076c:	00100793          	li	a5,1
80410770:	00fb2423          	sw	a5,8(s6)
80410774:	030a0a93          	addi	s5,s4,48
80410778:	ec048ce3          	beqz	s1,80410650 <sfs_bmap_load_nolock+0x84>
8041077c:	004a2503          	lw	a0,4(s4)
80410780:	00048613          	mv	a2,s1
80410784:	000a8593          	mv	a1,s5
80410788:	a85ff0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
8041078c:	0e050263          	beqz	a0,80410870 <sfs_bmap_load_nolock+0x2a4>
80410790:	00412483          	lw	s1,4(sp)
80410794:	ebdff06f          	j	80410650 <sfs_bmap_load_nolock+0x84>
80410798:	00410593          	addi	a1,sp,4
8041079c:	abdff0ef          	jal	ra,80410258 <sfs_block_alloc>
804107a0:	00050a93          	mv	s5,a0
804107a4:	ec051ee3          	bnez	a0,80410680 <sfs_bmap_load_nolock+0xb4>
804107a8:	00412483          	lw	s1,4(sp)
804107ac:	00100793          	li	a5,1
804107b0:	009ba623          	sw	s1,12(s7)
804107b4:	00fb2423          	sw	a5,8(s6)
804107b8:	fbdff06f          	j	80410774 <sfs_bmap_load_nolock+0x1a8>
804107bc:	03c92703          	lw	a4,60(s2)
804107c0:	00812783          	lw	a5,8(sp)
804107c4:	00912223          	sw	s1,4(sp)
804107c8:	f8e79ee3          	bne	a5,a4,80410764 <sfs_bmap_load_nolock+0x198>
804107cc:	030a0a93          	addi	s5,s4,48
804107d0:	fadff06f          	j	8041077c <sfs_bmap_load_nolock+0x1b0>
804107d4:	00c10d13          	addi	s10,sp,12
804107d8:	000b8713          	mv	a4,s7
804107dc:	000c8693          	mv	a3,s9
804107e0:	00400613          	li	a2,4
804107e4:	000d0593          	mv	a1,s10
804107e8:	6ec010ef          	jal	ra,80411ed4 <sfs_rbuf>
804107ec:	00050a93          	mv	s5,a0
804107f0:	e80518e3          	bnez	a0,80410680 <sfs_bmap_load_nolock+0xb4>
804107f4:	00c12483          	lw	s1,12(sp)
804107f8:	fc0492e3          	bnez	s1,804107bc <sfs_bmap_load_nolock+0x1f0>
804107fc:	f28980e3          	beq	s3,s0,8041071c <sfs_bmap_load_nolock+0x150>
80410800:	03c92703          	lw	a4,60(s2)
80410804:	00812783          	lw	a5,8(sp)
80410808:	00012223          	sw	zero,4(sp)
8041080c:	f4e79ce3          	bne	a5,a4,80410764 <sfs_bmap_load_nolock+0x198>
80410810:	030a0a93          	addi	s5,s4,48
80410814:	e3dff06f          	j	80410650 <sfs_bmap_load_nolock+0x84>
80410818:	00c12583          	lw	a1,12(sp)
8041081c:	000a0513          	mv	a0,s4
80410820:	afdff0ef          	jal	ra,8041031c <sfs_block_free>
80410824:	00812583          	lw	a1,8(sp)
80410828:	e4bc8ce3          	beq	s9,a1,80410680 <sfs_bmap_load_nolock+0xb4>
8041082c:	000a0513          	mv	a0,s4
80410830:	aedff0ef          	jal	ra,8041031c <sfs_block_free>
80410834:	e4dff06f          	j	80410680 <sfs_bmap_load_nolock+0xb4>
80410838:	00005697          	auipc	a3,0x5
8041083c:	7c068693          	addi	a3,a3,1984 # 80415ff8 <dev_node_ops+0x578>
80410840:	00002617          	auipc	a2,0x2
80410844:	68860613          	addi	a2,a2,1672 # 80412ec8 <commands+0x1bc>
80410848:	16400593          	li	a1,356
8041084c:	00006517          	auipc	a0,0x6
80410850:	87850513          	addi	a0,a0,-1928 # 804160c4 <dev_node_ops+0x644>
80410854:	dd1ef0ef          	jal	ra,80400624 <__panic>
80410858:	00005617          	auipc	a2,0x5
8041085c:	7cc60613          	addi	a2,a2,1996 # 80416024 <dev_node_ops+0x5a4>
80410860:	11e00593          	li	a1,286
80410864:	00006517          	auipc	a0,0x6
80410868:	86050513          	addi	a0,a0,-1952 # 804160c4 <dev_node_ops+0x644>
8041086c:	db9ef0ef          	jal	ra,80400624 <__panic>
80410870:	00005697          	auipc	a3,0x5
80410874:	7e068693          	addi	a3,a3,2016 # 80416050 <dev_node_ops+0x5d0>
80410878:	00002617          	auipc	a2,0x2
8041087c:	65060613          	addi	a2,a2,1616 # 80412ec8 <commands+0x1bc>
80410880:	12100593          	li	a1,289
80410884:	00006517          	auipc	a0,0x6
80410888:	84050513          	addi	a0,a0,-1984 # 804160c4 <dev_node_ops+0x644>
8041088c:	d99ef0ef          	jal	ra,80400624 <__panic>
80410890:	00005697          	auipc	a3,0x5
80410894:	78068693          	addi	a3,a3,1920 # 80416010 <dev_node_ops+0x590>
80410898:	00002617          	auipc	a2,0x2
8041089c:	63060613          	addi	a2,a2,1584 # 80412ec8 <commands+0x1bc>
804108a0:	11800593          	li	a1,280
804108a4:	00006517          	auipc	a0,0x6
804108a8:	82050513          	addi	a0,a0,-2016 # 804160c4 <dev_node_ops+0x644>
804108ac:	d79ef0ef          	jal	ra,80400624 <__panic>

804108b0 <sfs_io_nolock>:
804108b0:	fa010113          	addi	sp,sp,-96
804108b4:	03812c23          	sw	s8,56(sp)
804108b8:	00058c13          	mv	s8,a1
804108bc:	0005a583          	lw	a1,0(a1)
804108c0:	03912a23          	sw	s9,52(sp)
804108c4:	00050c93          	mv	s9,a0
804108c8:	0045d503          	lhu	a0,4(a1)
804108cc:	04112e23          	sw	ra,92(sp)
804108d0:	04812c23          	sw	s0,88(sp)
804108d4:	04912a23          	sw	s1,84(sp)
804108d8:	05212823          	sw	s2,80(sp)
804108dc:	05312623          	sw	s3,76(sp)
804108e0:	05412423          	sw	s4,72(sp)
804108e4:	05512223          	sw	s5,68(sp)
804108e8:	05612023          	sw	s6,64(sp)
804108ec:	03712e23          	sw	s7,60(sp)
804108f0:	03a12823          	sw	s10,48(sp)
804108f4:	03b12623          	sw	s11,44(sp)
804108f8:	00200813          	li	a6,2
804108fc:	27050863          	beq	a0,a6,80410b6c <sfs_io_nolock+0x2bc>
80410900:	00072403          	lw	s0,0(a4)
80410904:	00070b93          	mv	s7,a4
80410908:	000ba023          	sw	zero,0(s7)
8041090c:	08000737          	lui	a4,0x8000
80410910:	00068493          	mv	s1,a3
80410914:	00068d93          	mv	s11,a3
80410918:	00868433          	add	s0,a3,s0
8041091c:	24e6f463          	bgeu	a3,a4,80410b64 <sfs_io_nolock+0x2b4>
80410920:	24d44263          	blt	s0,a3,80410b64 <sfs_io_nolock+0x2b4>
80410924:	00000513          	li	a0,0
80410928:	0e868e63          	beq	a3,s0,80410a24 <sfs_io_nolock+0x174>
8041092c:	00060993          	mv	s3,a2
80410930:	00877463          	bgeu	a4,s0,80410938 <sfs_io_nolock+0x88>
80410934:	08000437          	lui	s0,0x8000
80410938:	12078463          	beqz	a5,80410a60 <sfs_io_nolock+0x1b0>
8041093c:	00001797          	auipc	a5,0x1
80410940:	59078793          	addi	a5,a5,1424 # 80411ecc <sfs_wblock>
80410944:	00f12623          	sw	a5,12(sp)
80410948:	00001797          	auipc	a5,0x1
8041094c:	65878793          	addi	a5,a5,1624 # 80411fa0 <sfs_wbuf>
80410950:	00f12423          	sw	a5,8(sp)
80410954:	41f4d913          	srai	s2,s1,0x1f
80410958:	00001637          	lui	a2,0x1
8041095c:	fff60713          	addi	a4,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
80410960:	01495693          	srli	a3,s2,0x14
80410964:	41f45a13          	srai	s4,s0,0x1f
80410968:	00e97933          	and	s2,s2,a4
8041096c:	00ea7ab3          	and	s5,s4,a4
80410970:	00d48d33          	add	s10,s1,a3
80410974:	00990933          	add	s2,s2,s1
80410978:	008a8ab3          	add	s5,s5,s0
8041097c:	00ed7d33          	and	s10,s10,a4
80410980:	40c95913          	srai	s2,s2,0xc
80410984:	40cada93          	srai	s5,s5,0xc
80410988:	40dd0d33          	sub	s10,s10,a3
8041098c:	412a8ab3          	sub	s5,s5,s2
80410990:	100d0063          	beqz	s10,80410a90 <sfs_io_nolock+0x1e0>
80410994:	40940b33          	sub	s6,s0,s1
80410998:	140a9463          	bnez	s5,80410ae0 <sfs_io_nolock+0x230>
8041099c:	01c10693          	addi	a3,sp,28
804109a0:	00090613          	mv	a2,s2
804109a4:	000c0593          	mv	a1,s8
804109a8:	000c8513          	mv	a0,s9
804109ac:	c21ff0ef          	jal	ra,804105cc <sfs_bmap_load_nolock>
804109b0:	14051663          	bnez	a0,80410afc <sfs_io_nolock+0x24c>
804109b4:	01c12683          	lw	a3,28(sp)
804109b8:	00812783          	lw	a5,8(sp)
804109bc:	000d0713          	mv	a4,s10
804109c0:	000b0613          	mv	a2,s6
804109c4:	00098593          	mv	a1,s3
804109c8:	000c8513          	mv	a0,s9
804109cc:	000780e7          	jalr	a5
804109d0:	12051663          	bnez	a0,80410afc <sfs_io_nolock+0x24c>
804109d4:	180a8463          	beqz	s5,80410b5c <sfs_io_nolock+0x2ac>
804109d8:	fffa8a93          	addi	s5,s5,-1
804109dc:	016989b3          	add	s3,s3,s6
804109e0:	00190913          	addi	s2,s2,1
804109e4:	0a0a9a63          	bnez	s5,80410a98 <sfs_io_nolock+0x1e8>
804109e8:	014a5793          	srli	a5,s4,0x14
804109ec:	00f40433          	add	s0,s0,a5
804109f0:	01441413          	slli	s0,s0,0x14
804109f4:	01445413          	srli	s0,s0,0x14
804109f8:	40f40433          	sub	s0,s0,a5
804109fc:	12041263          	bnez	s0,80410b20 <sfs_io_nolock+0x270>
80410a00:	01648db3          	add	s11,s1,s6
80410a04:	00000513          	li	a0,0
80410a08:	000c2783          	lw	a5,0(s8)
80410a0c:	016ba023          	sw	s6,0(s7)
80410a10:	0007a703          	lw	a4,0(a5)
80410a14:	01b77863          	bgeu	a4,s11,80410a24 <sfs_io_nolock+0x174>
80410a18:	01b7a023          	sw	s11,0(a5)
80410a1c:	00100793          	li	a5,1
80410a20:	00fc2423          	sw	a5,8(s8)
80410a24:	05c12083          	lw	ra,92(sp)
80410a28:	05812403          	lw	s0,88(sp)
80410a2c:	05412483          	lw	s1,84(sp)
80410a30:	05012903          	lw	s2,80(sp)
80410a34:	04c12983          	lw	s3,76(sp)
80410a38:	04812a03          	lw	s4,72(sp)
80410a3c:	04412a83          	lw	s5,68(sp)
80410a40:	04012b03          	lw	s6,64(sp)
80410a44:	03c12b83          	lw	s7,60(sp)
80410a48:	03812c03          	lw	s8,56(sp)
80410a4c:	03412c83          	lw	s9,52(sp)
80410a50:	03012d03          	lw	s10,48(sp)
80410a54:	02c12d83          	lw	s11,44(sp)
80410a58:	06010113          	addi	sp,sp,96
80410a5c:	00008067          	ret
80410a60:	0005a783          	lw	a5,0(a1)
80410a64:	00000513          	li	a0,0
80410a68:	faf4fee3          	bgeu	s1,a5,80410a24 <sfs_io_nolock+0x174>
80410a6c:	0887fc63          	bgeu	a5,s0,80410b04 <sfs_io_nolock+0x254>
80410a70:	00078413          	mv	s0,a5
80410a74:	00001797          	auipc	a5,0x1
80410a78:	45078793          	addi	a5,a5,1104 # 80411ec4 <sfs_rblock>
80410a7c:	00f12623          	sw	a5,12(sp)
80410a80:	00001797          	auipc	a5,0x1
80410a84:	45478793          	addi	a5,a5,1108 # 80411ed4 <sfs_rbuf>
80410a88:	00f12423          	sw	a5,8(sp)
80410a8c:	ec9ff06f          	j	80410954 <sfs_io_nolock+0xa4>
80410a90:	00000b13          	li	s6,0
80410a94:	f40a8ae3          	beqz	s5,804109e8 <sfs_io_nolock+0x138>
80410a98:	01c10693          	addi	a3,sp,28
80410a9c:	00090613          	mv	a2,s2
80410aa0:	000c0593          	mv	a1,s8
80410aa4:	000c8513          	mv	a0,s9
80410aa8:	b25ff0ef          	jal	ra,804105cc <sfs_bmap_load_nolock>
80410aac:	0a051863          	bnez	a0,80410b5c <sfs_io_nolock+0x2ac>
80410ab0:	01c12603          	lw	a2,28(sp)
80410ab4:	00c12783          	lw	a5,12(sp)
80410ab8:	000a8693          	mv	a3,s5
80410abc:	00098593          	mv	a1,s3
80410ac0:	000c8513          	mv	a0,s9
80410ac4:	000780e7          	jalr	a5
80410ac8:	08051a63          	bnez	a0,80410b5c <sfs_io_nolock+0x2ac>
80410acc:	00ca9713          	slli	a4,s5,0xc
80410ad0:	00eb0b33          	add	s6,s6,a4
80410ad4:	00e989b3          	add	s3,s3,a4
80410ad8:	01590933          	add	s2,s2,s5
80410adc:	f0dff06f          	j	804109e8 <sfs_io_nolock+0x138>
80410ae0:	41a60b33          	sub	s6,a2,s10
80410ae4:	01c10693          	addi	a3,sp,28
80410ae8:	00090613          	mv	a2,s2
80410aec:	000c0593          	mv	a1,s8
80410af0:	000c8513          	mv	a0,s9
80410af4:	ad9ff0ef          	jal	ra,804105cc <sfs_bmap_load_nolock>
80410af8:	ea050ee3          	beqz	a0,804109b4 <sfs_io_nolock+0x104>
80410afc:	00000b13          	li	s6,0
80410b00:	f09ff06f          	j	80410a08 <sfs_io_nolock+0x158>
80410b04:	00001797          	auipc	a5,0x1
80410b08:	3c078793          	addi	a5,a5,960 # 80411ec4 <sfs_rblock>
80410b0c:	00f12623          	sw	a5,12(sp)
80410b10:	00001797          	auipc	a5,0x1
80410b14:	3c478793          	addi	a5,a5,964 # 80411ed4 <sfs_rbuf>
80410b18:	00f12423          	sw	a5,8(sp)
80410b1c:	e39ff06f          	j	80410954 <sfs_io_nolock+0xa4>
80410b20:	01c10693          	addi	a3,sp,28
80410b24:	00090613          	mv	a2,s2
80410b28:	000c0593          	mv	a1,s8
80410b2c:	000c8513          	mv	a0,s9
80410b30:	a9dff0ef          	jal	ra,804105cc <sfs_bmap_load_nolock>
80410b34:	02051463          	bnez	a0,80410b5c <sfs_io_nolock+0x2ac>
80410b38:	01c12683          	lw	a3,28(sp)
80410b3c:	00812783          	lw	a5,8(sp)
80410b40:	00000713          	li	a4,0
80410b44:	00040613          	mv	a2,s0
80410b48:	00098593          	mv	a1,s3
80410b4c:	000c8513          	mv	a0,s9
80410b50:	000780e7          	jalr	a5
80410b54:	00051463          	bnez	a0,80410b5c <sfs_io_nolock+0x2ac>
80410b58:	008b0b33          	add	s6,s6,s0
80410b5c:	01648db3          	add	s11,s1,s6
80410b60:	ea9ff06f          	j	80410a08 <sfs_io_nolock+0x158>
80410b64:	ffd00513          	li	a0,-3
80410b68:	ebdff06f          	j	80410a24 <sfs_io_nolock+0x174>
80410b6c:	00005697          	auipc	a3,0x5
80410b70:	5c068693          	addi	a3,a3,1472 # 8041612c <dev_node_ops+0x6ac>
80410b74:	00002617          	auipc	a2,0x2
80410b78:	35460613          	addi	a2,a2,852 # 80412ec8 <commands+0x1bc>
80410b7c:	22b00593          	li	a1,555
80410b80:	00005517          	auipc	a0,0x5
80410b84:	54450513          	addi	a0,a0,1348 # 804160c4 <dev_node_ops+0x644>
80410b88:	a9def0ef          	jal	ra,80400624 <__panic>

80410b8c <sfs_dirent_read_nolock>:
80410b8c:	0005a783          	lw	a5,0(a1)
80410b90:	fe010113          	addi	sp,sp,-32
80410b94:	00112e23          	sw	ra,28(sp)
80410b98:	0047d803          	lhu	a6,4(a5)
80410b9c:	00812c23          	sw	s0,24(sp)
80410ba0:	00912a23          	sw	s1,20(sp)
80410ba4:	00200713          	li	a4,2
80410ba8:	06e81e63          	bne	a6,a4,80410c24 <sfs_dirent_read_nolock+0x98>
80410bac:	0087a783          	lw	a5,8(a5)
80410bb0:	06f67a63          	bgeu	a2,a5,80410c24 <sfs_dirent_read_nolock+0x98>
80410bb4:	00068493          	mv	s1,a3
80410bb8:	00c10693          	addi	a3,sp,12
80410bbc:	00050413          	mv	s0,a0
80410bc0:	a0dff0ef          	jal	ra,804105cc <sfs_bmap_load_nolock>
80410bc4:	00050c63          	beqz	a0,80410bdc <sfs_dirent_read_nolock+0x50>
80410bc8:	01c12083          	lw	ra,28(sp)
80410bcc:	01812403          	lw	s0,24(sp)
80410bd0:	01412483          	lw	s1,20(sp)
80410bd4:	02010113          	addi	sp,sp,32
80410bd8:	00008067          	ret
80410bdc:	00c12603          	lw	a2,12(sp)
80410be0:	00442503          	lw	a0,4(s0) # 8000004 <_binary_bin_sfs_img_size+0x7f88004>
80410be4:	03040593          	addi	a1,s0,48
80410be8:	e24ff0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
80410bec:	04050c63          	beqz	a0,80410c44 <sfs_dirent_read_nolock+0xb8>
80410bf0:	00c12683          	lw	a3,12(sp)
80410bf4:	00000713          	li	a4,0
80410bf8:	10400613          	li	a2,260
80410bfc:	00048593          	mv	a1,s1
80410c00:	00040513          	mv	a0,s0
80410c04:	2d0010ef          	jal	ra,80411ed4 <sfs_rbuf>
80410c08:	fc0510e3          	bnez	a0,80410bc8 <sfs_dirent_read_nolock+0x3c>
80410c0c:	100481a3          	sb	zero,259(s1)
80410c10:	01c12083          	lw	ra,28(sp)
80410c14:	01812403          	lw	s0,24(sp)
80410c18:	01412483          	lw	s1,20(sp)
80410c1c:	02010113          	addi	sp,sp,32
80410c20:	00008067          	ret
80410c24:	00005697          	auipc	a3,0x5
80410c28:	45468693          	addi	a3,a3,1108 # 80416078 <dev_node_ops+0x5f8>
80410c2c:	00002617          	auipc	a2,0x2
80410c30:	29c60613          	addi	a2,a2,668 # 80412ec8 <commands+0x1bc>
80410c34:	18e00593          	li	a1,398
80410c38:	00005517          	auipc	a0,0x5
80410c3c:	48c50513          	addi	a0,a0,1164 # 804160c4 <dev_node_ops+0x644>
80410c40:	9e5ef0ef          	jal	ra,80400624 <__panic>
80410c44:	00005697          	auipc	a3,0x5
80410c48:	41868693          	addi	a3,a3,1048 # 8041605c <dev_node_ops+0x5dc>
80410c4c:	00002617          	auipc	a2,0x2
80410c50:	27c60613          	addi	a2,a2,636 # 80412ec8 <commands+0x1bc>
80410c54:	19500593          	li	a1,405
80410c58:	00005517          	auipc	a0,0x5
80410c5c:	46c50513          	addi	a0,a0,1132 # 804160c4 <dev_node_ops+0x644>
80410c60:	9c5ef0ef          	jal	ra,80400624 <__panic>

80410c64 <sfs_getdirentry>:
80410c64:	fd010113          	addi	sp,sp,-48
80410c68:	02912223          	sw	s1,36(sp)
80410c6c:	00050493          	mv	s1,a0
80410c70:	10400513          	li	a0,260
80410c74:	01812423          	sw	s8,8(sp)
80410c78:	02112623          	sw	ra,44(sp)
80410c7c:	02812423          	sw	s0,40(sp)
80410c80:	03212023          	sw	s2,32(sp)
80410c84:	01312e23          	sw	s3,28(sp)
80410c88:	01412c23          	sw	s4,24(sp)
80410c8c:	01512a23          	sw	s5,20(sp)
80410c90:	01612823          	sw	s6,16(sp)
80410c94:	01712623          	sw	s7,12(sp)
80410c98:	00058c13          	mv	s8,a1
80410c9c:	d25f10ef          	jal	ra,804029c0 <kmalloc>
80410ca0:	12050a63          	beqz	a0,80410dd4 <sfs_getdirentry+0x170>
80410ca4:	0384aa83          	lw	s5,56(s1)
80410ca8:	120a8a63          	beqz	s5,80410ddc <sfs_getdirentry+0x178>
80410cac:	06caa783          	lw	a5,108(s5)
80410cb0:	12079663          	bnez	a5,80410ddc <sfs_getdirentry+0x178>
80410cb4:	02c4a703          	lw	a4,44(s1)
80410cb8:	000017b7          	lui	a5,0x1
80410cbc:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410cc0:	12f71e63          	bne	a4,a5,80410dfc <sfs_getdirentry+0x198>
80410cc4:	004c2403          	lw	s0,4(s8)
80410cc8:	00050913          	mv	s2,a0
80410ccc:	0e044663          	bltz	s0,80410db8 <sfs_getdirentry+0x154>
80410cd0:	0ff47793          	andi	a5,s0,255
80410cd4:	0e079263          	bnez	a5,80410db8 <sfs_getdirentry+0x154>
80410cd8:	0004a783          	lw	a5,0(s1)
80410cdc:	00845413          	srli	s0,s0,0x8
80410ce0:	0087a783          	lw	a5,8(a5)
80410ce4:	0e87e263          	bltu	a5,s0,80410dc8 <sfs_getdirentry+0x164>
80410ce8:	01048b93          	addi	s7,s1,16
80410cec:	000b8513          	mv	a0,s7
80410cf0:	ce8f40ef          	jal	ra,804051d8 <down>
80410cf4:	0004a783          	lw	a5,0(s1)
80410cf8:	0087ab03          	lw	s6,8(a5)
80410cfc:	0b605663          	blez	s6,80410da8 <sfs_getdirentry+0x144>
80410d00:	00000993          	li	s3,0
80410d04:	01c0006f          	j	80410d20 <sfs_getdirentry+0xbc>
80410d08:	00092783          	lw	a5,0(s2)
80410d0c:	00078663          	beqz	a5,80410d18 <sfs_getdirentry+0xb4>
80410d10:	02040c63          	beqz	s0,80410d48 <sfs_getdirentry+0xe4>
80410d14:	fff40413          	addi	s0,s0,-1
80410d18:	00198993          	addi	s3,s3,1
80410d1c:	093b0663          	beq	s6,s3,80410da8 <sfs_getdirentry+0x144>
80410d20:	00090693          	mv	a3,s2
80410d24:	00098613          	mv	a2,s3
80410d28:	00048593          	mv	a1,s1
80410d2c:	000a8513          	mv	a0,s5
80410d30:	e5dff0ef          	jal	ra,80410b8c <sfs_dirent_read_nolock>
80410d34:	00050a13          	mv	s4,a0
80410d38:	fc0508e3          	beqz	a0,80410d08 <sfs_getdirentry+0xa4>
80410d3c:	000b8513          	mv	a0,s7
80410d40:	c94f40ef          	jal	ra,804051d4 <up>
80410d44:	0280006f          	j	80410d6c <sfs_getdirentry+0x108>
80410d48:	000b8513          	mv	a0,s7
80410d4c:	c88f40ef          	jal	ra,804051d4 <up>
80410d50:	00000713          	li	a4,0
80410d54:	00100693          	li	a3,1
80410d58:	10000613          	li	a2,256
80410d5c:	00490593          	addi	a1,s2,4
80410d60:	000c0513          	mv	a0,s8
80410d64:	8ddf50ef          	jal	ra,80406640 <iobuf_move>
80410d68:	00050a13          	mv	s4,a0
80410d6c:	00090513          	mv	a0,s2
80410d70:	d75f10ef          	jal	ra,80402ae4 <kfree>
80410d74:	02c12083          	lw	ra,44(sp)
80410d78:	02812403          	lw	s0,40(sp)
80410d7c:	000a0513          	mv	a0,s4
80410d80:	02412483          	lw	s1,36(sp)
80410d84:	02012903          	lw	s2,32(sp)
80410d88:	01c12983          	lw	s3,28(sp)
80410d8c:	01812a03          	lw	s4,24(sp)
80410d90:	01412a83          	lw	s5,20(sp)
80410d94:	01012b03          	lw	s6,16(sp)
80410d98:	00c12b83          	lw	s7,12(sp)
80410d9c:	00812c03          	lw	s8,8(sp)
80410da0:	03010113          	addi	sp,sp,48
80410da4:	00008067          	ret
80410da8:	000b8513          	mv	a0,s7
80410dac:	ff000a13          	li	s4,-16
80410db0:	c24f40ef          	jal	ra,804051d4 <up>
80410db4:	fb9ff06f          	j	80410d6c <sfs_getdirentry+0x108>
80410db8:	00090513          	mv	a0,s2
80410dbc:	d29f10ef          	jal	ra,80402ae4 <kfree>
80410dc0:	ffd00a13          	li	s4,-3
80410dc4:	fb1ff06f          	j	80410d74 <sfs_getdirentry+0x110>
80410dc8:	d1df10ef          	jal	ra,80402ae4 <kfree>
80410dcc:	ff000a13          	li	s4,-16
80410dd0:	fa5ff06f          	j	80410d74 <sfs_getdirentry+0x110>
80410dd4:	ffc00a13          	li	s4,-4
80410dd8:	f9dff06f          	j	80410d74 <sfs_getdirentry+0x110>
80410ddc:	00005697          	auipc	a3,0x5
80410de0:	14c68693          	addi	a3,a3,332 # 80415f28 <dev_node_ops+0x4a8>
80410de4:	00002617          	auipc	a2,0x2
80410de8:	0e460613          	addi	a2,a2,228 # 80412ec8 <commands+0x1bc>
80410dec:	33a00593          	li	a1,826
80410df0:	00005517          	auipc	a0,0x5
80410df4:	2d450513          	addi	a0,a0,724 # 804160c4 <dev_node_ops+0x644>
80410df8:	82def0ef          	jal	ra,80400624 <__panic>
80410dfc:	00005697          	auipc	a3,0x5
80410e00:	2e068693          	addi	a3,a3,736 # 804160dc <dev_node_ops+0x65c>
80410e04:	00002617          	auipc	a2,0x2
80410e08:	0c460613          	addi	a2,a2,196 # 80412ec8 <commands+0x1bc>
80410e0c:	33b00593          	li	a1,827
80410e10:	00005517          	auipc	a0,0x5
80410e14:	2b450513          	addi	a0,a0,692 # 804160c4 <dev_node_ops+0x644>
80410e18:	80def0ef          	jal	ra,80400624 <__panic>

80410e1c <sfs_truncfile>:
80410e1c:	fa010113          	addi	sp,sp,-96
80410e20:	04112e23          	sw	ra,92(sp)
80410e24:	04812c23          	sw	s0,88(sp)
80410e28:	04912a23          	sw	s1,84(sp)
80410e2c:	05212823          	sw	s2,80(sp)
80410e30:	05312623          	sw	s3,76(sp)
80410e34:	05412423          	sw	s4,72(sp)
80410e38:	05512223          	sw	s5,68(sp)
80410e3c:	05612023          	sw	s6,64(sp)
80410e40:	03712e23          	sw	s7,60(sp)
80410e44:	03812c23          	sw	s8,56(sp)
80410e48:	03912a23          	sw	s9,52(sp)
80410e4c:	03a12823          	sw	s10,48(sp)
80410e50:	03b12623          	sw	s11,44(sp)
80410e54:	080007b7          	lui	a5,0x8000
80410e58:	1eb7ec63          	bltu	a5,a1,80411050 <sfs_truncfile+0x234>
80410e5c:	03852d03          	lw	s10,56(a0)
80410e60:	00050913          	mv	s2,a0
80410e64:	00058a13          	mv	s4,a1
80410e68:	1e0d0863          	beqz	s10,80411058 <sfs_truncfile+0x23c>
80410e6c:	06cd2783          	lw	a5,108(s10)
80410e70:	1e079463          	bnez	a5,80411058 <sfs_truncfile+0x23c>
80410e74:	02c52703          	lw	a4,44(a0)
80410e78:	000014b7          	lui	s1,0x1
80410e7c:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410e80:	20f71c63          	bne	a4,a5,80411098 <sfs_truncfile+0x27c>
80410e84:	00052a83          	lw	s5,0(a0)
80410e88:	fff48493          	addi	s1,s1,-1
80410e8c:	009584b3          	add	s1,a1,s1
80410e90:	000aa783          	lw	a5,0(s5)
80410e94:	00c4d493          	srli	s1,s1,0xc
80410e98:	04f59863          	bne	a1,a5,80410ee8 <sfs_truncfile+0xcc>
80410e9c:	008aa783          	lw	a5,8(s5)
80410ea0:	00000c93          	li	s9,0
80410ea4:	20f49a63          	bne	s1,a5,804110b8 <sfs_truncfile+0x29c>
80410ea8:	05c12083          	lw	ra,92(sp)
80410eac:	05812403          	lw	s0,88(sp)
80410eb0:	000c8513          	mv	a0,s9
80410eb4:	05412483          	lw	s1,84(sp)
80410eb8:	05012903          	lw	s2,80(sp)
80410ebc:	04c12983          	lw	s3,76(sp)
80410ec0:	04812a03          	lw	s4,72(sp)
80410ec4:	04412a83          	lw	s5,68(sp)
80410ec8:	04012b03          	lw	s6,64(sp)
80410ecc:	03c12b83          	lw	s7,60(sp)
80410ed0:	03812c03          	lw	s8,56(sp)
80410ed4:	03412c83          	lw	s9,52(sp)
80410ed8:	03012d03          	lw	s10,48(sp)
80410edc:	02c12d83          	lw	s11,44(sp)
80410ee0:	06010113          	addi	sp,sp,96
80410ee4:	00008067          	ret
80410ee8:	01050b13          	addi	s6,a0,16
80410eec:	000b0513          	mv	a0,s6
80410ef0:	ae8f40ef          	jal	ra,804051d8 <down>
80410ef4:	008aa403          	lw	s0,8(s5)
80410ef8:	0e946063          	bltu	s0,s1,80410fd8 <sfs_truncfile+0x1bc>
80410efc:	1084f263          	bgeu	s1,s0,80411000 <sfs_truncfile+0x1e4>
80410f00:	00092d83          	lw	s11,0(s2)
80410f04:	008da783          	lw	a5,8(s11) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80410f08:	16078863          	beqz	a5,80411078 <sfs_truncfile+0x25c>
80410f0c:	030d0713          	addi	a4,s10,48
80410f10:	00b00b93          	li	s7,11
80410f14:	00e12623          	sw	a4,12(sp)
80410f18:	00100c13          	li	s8,1
80410f1c:	0900006f          	j	80410fac <sfs_truncfile+0x190>
80410f20:	ff378993          	addi	s3,a5,-13 # 7fffff3 <_binary_bin_sfs_img_size+0x7f87ff3>
80410f24:	3ff00793          	li	a5,1023
80410f28:	0737e063          	bltu	a5,s3,80410f88 <sfs_truncfile+0x16c>
80410f2c:	03cda783          	lw	a5,60(s11)
80410f30:	04078c63          	beqz	a5,80410f88 <sfs_truncfile+0x16c>
80410f34:	004d2503          	lw	a0,4(s10)
80410f38:	00c12583          	lw	a1,12(sp)
80410f3c:	00078613          	mv	a2,a5
80410f40:	00f12423          	sw	a5,8(sp)
80410f44:	ac8ff0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
80410f48:	00812783          	lw	a5,8(sp)
80410f4c:	18050663          	beqz	a0,804110d8 <sfs_truncfile+0x2bc>
80410f50:	00299993          	slli	s3,s3,0x2
80410f54:	00098713          	mv	a4,s3
80410f58:	00078693          	mv	a3,a5
80410f5c:	00400613          	li	a2,4
80410f60:	01810593          	addi	a1,sp,24
80410f64:	000d0513          	mv	a0,s10
80410f68:	00f12423          	sw	a5,8(sp)
80410f6c:	00012e23          	sw	zero,28(sp)
80410f70:	765000ef          	jal	ra,80411ed4 <sfs_rbuf>
80410f74:	00050c93          	mv	s9,a0
80410f78:	08051e63          	bnez	a0,80411014 <sfs_truncfile+0x1f8>
80410f7c:	01812703          	lw	a4,24(sp)
80410f80:	00812783          	lw	a5,8(sp)
80410f84:	08071e63          	bnez	a4,80411020 <sfs_truncfile+0x204>
80410f88:	008da783          	lw	a5,8(s11)
80410f8c:	fff40413          	addi	s0,s0,-1
80410f90:	fff78793          	addi	a5,a5,-1
80410f94:	00fda423          	sw	a5,8(s11)
80410f98:	01892423          	sw	s8,8(s2)
80410f9c:	06848063          	beq	s1,s0,80410ffc <sfs_truncfile+0x1e0>
80410fa0:	00092d83          	lw	s11,0(s2)
80410fa4:	008da783          	lw	a5,8(s11)
80410fa8:	0c078863          	beqz	a5,80411078 <sfs_truncfile+0x25c>
80410fac:	fff78713          	addi	a4,a5,-1
80410fb0:	f6ebe8e3          	bltu	s7,a4,80410f20 <sfs_truncfile+0x104>
80410fb4:	00279793          	slli	a5,a5,0x2
80410fb8:	00fd89b3          	add	s3,s11,a5
80410fbc:	0089a583          	lw	a1,8(s3)
80410fc0:	fc0584e3          	beqz	a1,80410f88 <sfs_truncfile+0x16c>
80410fc4:	000d0513          	mv	a0,s10
80410fc8:	b54ff0ef          	jal	ra,8041031c <sfs_block_free>
80410fcc:	0009a423          	sw	zero,8(s3)
80410fd0:	01892423          	sw	s8,8(s2)
80410fd4:	fb5ff06f          	j	80410f88 <sfs_truncfile+0x16c>
80410fd8:	00000693          	li	a3,0
80410fdc:	00040613          	mv	a2,s0
80410fe0:	00090593          	mv	a1,s2
80410fe4:	000d0513          	mv	a0,s10
80410fe8:	de4ff0ef          	jal	ra,804105cc <sfs_bmap_load_nolock>
80410fec:	00050c93          	mv	s9,a0
80410ff0:	02051263          	bnez	a0,80411014 <sfs_truncfile+0x1f8>
80410ff4:	00140413          	addi	s0,s0,1
80410ff8:	fe8490e3          	bne	s1,s0,80410fd8 <sfs_truncfile+0x1bc>
80410ffc:	008aa403          	lw	s0,8(s5)
80411000:	0e849c63          	bne	s1,s0,804110f8 <sfs_truncfile+0x2dc>
80411004:	014aa023          	sw	s4,0(s5)
80411008:	00100793          	li	a5,1
8041100c:	00f92423          	sw	a5,8(s2)
80411010:	00000c93          	li	s9,0
80411014:	000b0513          	mv	a0,s6
80411018:	9bcf40ef          	jal	ra,804051d4 <up>
8041101c:	e8dff06f          	j	80410ea8 <sfs_truncfile+0x8c>
80411020:	00098713          	mv	a4,s3
80411024:	00078693          	mv	a3,a5
80411028:	00400613          	li	a2,4
8041102c:	01c10593          	addi	a1,sp,28
80411030:	000d0513          	mv	a0,s10
80411034:	76d000ef          	jal	ra,80411fa0 <sfs_wbuf>
80411038:	00050c93          	mv	s9,a0
8041103c:	fc051ce3          	bnez	a0,80411014 <sfs_truncfile+0x1f8>
80411040:	01812583          	lw	a1,24(sp)
80411044:	000d0513          	mv	a0,s10
80411048:	ad4ff0ef          	jal	ra,8041031c <sfs_block_free>
8041104c:	f3dff06f          	j	80410f88 <sfs_truncfile+0x16c>
80411050:	ffd00c93          	li	s9,-3
80411054:	e55ff06f          	j	80410ea8 <sfs_truncfile+0x8c>
80411058:	00005697          	auipc	a3,0x5
8041105c:	ed068693          	addi	a3,a3,-304 # 80415f28 <dev_node_ops+0x4a8>
80411060:	00002617          	auipc	a2,0x2
80411064:	e6860613          	addi	a2,a2,-408 # 80412ec8 <commands+0x1bc>
80411068:	3a900593          	li	a1,937
8041106c:	00005517          	auipc	a0,0x5
80411070:	05850513          	addi	a0,a0,88 # 804160c4 <dev_node_ops+0x644>
80411074:	db0ef0ef          	jal	ra,80400624 <__panic>
80411078:	00005697          	auipc	a3,0x5
8041107c:	21068693          	addi	a3,a3,528 # 80416288 <sfs_node_fileops+0x70>
80411080:	00002617          	auipc	a2,0x2
80411084:	e4860613          	addi	a2,a2,-440 # 80412ec8 <commands+0x1bc>
80411088:	17b00593          	li	a1,379
8041108c:	00005517          	auipc	a0,0x5
80411090:	03850513          	addi	a0,a0,56 # 804160c4 <dev_node_ops+0x644>
80411094:	d90ef0ef          	jal	ra,80400624 <__panic>
80411098:	00005697          	auipc	a3,0x5
8041109c:	04468693          	addi	a3,a3,68 # 804160dc <dev_node_ops+0x65c>
804110a0:	00002617          	auipc	a2,0x2
804110a4:	e2860613          	addi	a2,a2,-472 # 80412ec8 <commands+0x1bc>
804110a8:	3aa00593          	li	a1,938
804110ac:	00005517          	auipc	a0,0x5
804110b0:	01850513          	addi	a0,a0,24 # 804160c4 <dev_node_ops+0x644>
804110b4:	d70ef0ef          	jal	ra,80400624 <__panic>
804110b8:	00005697          	auipc	a3,0x5
804110bc:	1b868693          	addi	a3,a3,440 # 80416270 <sfs_node_fileops+0x58>
804110c0:	00002617          	auipc	a2,0x2
804110c4:	e0860613          	addi	a2,a2,-504 # 80412ec8 <commands+0x1bc>
804110c8:	3b100593          	li	a1,945
804110cc:	00005517          	auipc	a0,0x5
804110d0:	ff850513          	addi	a0,a0,-8 # 804160c4 <dev_node_ops+0x644>
804110d4:	d50ef0ef          	jal	ra,80400624 <__panic>
804110d8:	00005697          	auipc	a3,0x5
804110dc:	1c468693          	addi	a3,a3,452 # 8041629c <sfs_node_fileops+0x84>
804110e0:	00002617          	auipc	a2,0x2
804110e4:	de860613          	addi	a2,a2,-536 # 80412ec8 <commands+0x1bc>
804110e8:	12b00593          	li	a1,299
804110ec:	00005517          	auipc	a0,0x5
804110f0:	fd850513          	addi	a0,a0,-40 # 804160c4 <dev_node_ops+0x644>
804110f4:	d30ef0ef          	jal	ra,80400624 <__panic>
804110f8:	00005697          	auipc	a3,0x5
804110fc:	1d868693          	addi	a3,a3,472 # 804162d0 <sfs_node_fileops+0xb8>
80411100:	00002617          	auipc	a2,0x2
80411104:	dc860613          	addi	a2,a2,-568 # 80412ec8 <commands+0x1bc>
80411108:	3ca00593          	li	a1,970
8041110c:	00005517          	auipc	a0,0x5
80411110:	fb850513          	addi	a0,a0,-72 # 804160c4 <dev_node_ops+0x644>
80411114:	d10ef0ef          	jal	ra,80400624 <__panic>

80411118 <sfs_tryseek>:
80411118:	080007b7          	lui	a5,0x8000
8041111c:	08f5fa63          	bgeu	a1,a5,804111b0 <sfs_tryseek+0x98>
80411120:	ff010113          	addi	sp,sp,-16
80411124:	00812423          	sw	s0,8(sp)
80411128:	00912223          	sw	s1,4(sp)
8041112c:	00112623          	sw	ra,12(sp)
80411130:	00050413          	mv	s0,a0
80411134:	00058493          	mv	s1,a1
80411138:	08050063          	beqz	a0,804111b8 <sfs_tryseek+0xa0>
8041113c:	02c52703          	lw	a4,44(a0)
80411140:	000017b7          	lui	a5,0x1
80411144:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411148:	06f71863          	bne	a4,a5,804111b8 <sfs_tryseek+0xa0>
8041114c:	00052783          	lw	a5,0(a0)
80411150:	0007a783          	lw	a5,0(a5)
80411154:	04b7f263          	bgeu	a5,a1,80411198 <sfs_tryseek+0x80>
80411158:	03c52783          	lw	a5,60(a0)
8041115c:	06078e63          	beqz	a5,804111d8 <sfs_tryseek+0xc0>
80411160:	0307a783          	lw	a5,48(a5)
80411164:	06078a63          	beqz	a5,804111d8 <sfs_tryseek+0xc0>
80411168:	00004597          	auipc	a1,0x4
8041116c:	7a458593          	addi	a1,a1,1956 # 8041590c <syscalls+0x8c0>
80411170:	d60fc0ef          	jal	ra,8040d6d0 <inode_check>
80411174:	03c42783          	lw	a5,60(s0)
80411178:	00040513          	mv	a0,s0
8041117c:	00812403          	lw	s0,8(sp)
80411180:	00c12083          	lw	ra,12(sp)
80411184:	00048593          	mv	a1,s1
80411188:	0307a303          	lw	t1,48(a5)
8041118c:	00412483          	lw	s1,4(sp)
80411190:	01010113          	addi	sp,sp,16
80411194:	00030067          	jr	t1
80411198:	00c12083          	lw	ra,12(sp)
8041119c:	00812403          	lw	s0,8(sp)
804111a0:	00412483          	lw	s1,4(sp)
804111a4:	00000513          	li	a0,0
804111a8:	01010113          	addi	sp,sp,16
804111ac:	00008067          	ret
804111b0:	ffd00513          	li	a0,-3
804111b4:	00008067          	ret
804111b8:	00005697          	auipc	a3,0x5
804111bc:	f2468693          	addi	a3,a3,-220 # 804160dc <dev_node_ops+0x65c>
804111c0:	00002617          	auipc	a2,0x2
804111c4:	d0860613          	addi	a2,a2,-760 # 80412ec8 <commands+0x1bc>
804111c8:	39a00593          	li	a1,922
804111cc:	00005517          	auipc	a0,0x5
804111d0:	ef850513          	addi	a0,a0,-264 # 804160c4 <dev_node_ops+0x644>
804111d4:	c50ef0ef          	jal	ra,80400624 <__panic>
804111d8:	00004697          	auipc	a3,0x4
804111dc:	6e068693          	addi	a3,a3,1760 # 804158b8 <syscalls+0x86c>
804111e0:	00002617          	auipc	a2,0x2
804111e4:	ce860613          	addi	a2,a2,-792 # 80412ec8 <commands+0x1bc>
804111e8:	39c00593          	li	a1,924
804111ec:	00005517          	auipc	a0,0x5
804111f0:	ed850513          	addi	a0,a0,-296 # 804160c4 <dev_node_ops+0x644>
804111f4:	c30ef0ef          	jal	ra,80400624 <__panic>

804111f8 <sfs_close>:
804111f8:	ff010113          	addi	sp,sp,-16
804111fc:	00112623          	sw	ra,12(sp)
80411200:	00812423          	sw	s0,8(sp)
80411204:	04050063          	beqz	a0,80411244 <sfs_close+0x4c>
80411208:	03c52783          	lw	a5,60(a0)
8041120c:	00050413          	mv	s0,a0
80411210:	02078a63          	beqz	a5,80411244 <sfs_close+0x4c>
80411214:	0187a783          	lw	a5,24(a5)
80411218:	02078663          	beqz	a5,80411244 <sfs_close+0x4c>
8041121c:	00003597          	auipc	a1,0x3
80411220:	2e058593          	addi	a1,a1,736 # 804144fc <CSWTCH.69+0x17c>
80411224:	cacfc0ef          	jal	ra,8040d6d0 <inode_check>
80411228:	03c42783          	lw	a5,60(s0)
8041122c:	00040513          	mv	a0,s0
80411230:	00812403          	lw	s0,8(sp)
80411234:	00c12083          	lw	ra,12(sp)
80411238:	0187a303          	lw	t1,24(a5)
8041123c:	01010113          	addi	sp,sp,16
80411240:	00030067          	jr	t1
80411244:	00003697          	auipc	a3,0x3
80411248:	26868693          	addi	a3,a3,616 # 804144ac <CSWTCH.69+0x12c>
8041124c:	00002617          	auipc	a2,0x2
80411250:	c7c60613          	addi	a2,a2,-900 # 80412ec8 <commands+0x1bc>
80411254:	21c00593          	li	a1,540
80411258:	00005517          	auipc	a0,0x5
8041125c:	e6c50513          	addi	a0,a0,-404 # 804160c4 <dev_node_ops+0x644>
80411260:	bc4ef0ef          	jal	ra,80400624 <__panic>

80411264 <sfs_fstat>:
80411264:	ff010113          	addi	sp,sp,-16
80411268:	00912223          	sw	s1,4(sp)
8041126c:	00058493          	mv	s1,a1
80411270:	00812423          	sw	s0,8(sp)
80411274:	01000613          	li	a2,16
80411278:	00050413          	mv	s0,a0
8041127c:	00000593          	li	a1,0
80411280:	00048513          	mv	a0,s1
80411284:	00112623          	sw	ra,12(sp)
80411288:	011010ef          	jal	ra,80412a98 <memset>
8041128c:	06040e63          	beqz	s0,80411308 <sfs_fstat+0xa4>
80411290:	03c42783          	lw	a5,60(s0)
80411294:	06078a63          	beqz	a5,80411308 <sfs_fstat+0xa4>
80411298:	0287a783          	lw	a5,40(a5)
8041129c:	06078663          	beqz	a5,80411308 <sfs_fstat+0xa4>
804112a0:	00004597          	auipc	a1,0x4
804112a4:	7c458593          	addi	a1,a1,1988 # 80415a64 <syscalls+0xa18>
804112a8:	00040513          	mv	a0,s0
804112ac:	c24fc0ef          	jal	ra,8040d6d0 <inode_check>
804112b0:	03c42783          	lw	a5,60(s0)
804112b4:	00048593          	mv	a1,s1
804112b8:	00040513          	mv	a0,s0
804112bc:	0287a783          	lw	a5,40(a5)
804112c0:	000780e7          	jalr	a5
804112c4:	02051863          	bnez	a0,804112f4 <sfs_fstat+0x90>
804112c8:	02c42703          	lw	a4,44(s0)
804112cc:	000017b7          	lui	a5,0x1
804112d0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804112d4:	04f71a63          	bne	a4,a5,80411328 <sfs_fstat+0xc4>
804112d8:	00042783          	lw	a5,0(s0)
804112dc:	0067d683          	lhu	a3,6(a5)
804112e0:	0087a703          	lw	a4,8(a5)
804112e4:	0007a783          	lw	a5,0(a5)
804112e8:	00d4a223          	sw	a3,4(s1)
804112ec:	00e4a423          	sw	a4,8(s1)
804112f0:	00f4a623          	sw	a5,12(s1)
804112f4:	00c12083          	lw	ra,12(sp)
804112f8:	00812403          	lw	s0,8(sp)
804112fc:	00412483          	lw	s1,4(sp)
80411300:	01010113          	addi	sp,sp,16
80411304:	00008067          	ret
80411308:	00004697          	auipc	a3,0x4
8041130c:	6f468693          	addi	a3,a3,1780 # 804159fc <syscalls+0x9b0>
80411310:	00002617          	auipc	a2,0x2
80411314:	bb860613          	addi	a2,a2,-1096 # 80412ec8 <commands+0x1bc>
80411318:	2b800593          	li	a1,696
8041131c:	00005517          	auipc	a0,0x5
80411320:	da850513          	addi	a0,a0,-600 # 804160c4 <dev_node_ops+0x644>
80411324:	b00ef0ef          	jal	ra,80400624 <__panic>
80411328:	00005697          	auipc	a3,0x5
8041132c:	db468693          	addi	a3,a3,-588 # 804160dc <dev_node_ops+0x65c>
80411330:	00002617          	auipc	a2,0x2
80411334:	b9860613          	addi	a2,a2,-1128 # 80412ec8 <commands+0x1bc>
80411338:	2bb00593          	li	a1,699
8041133c:	00005517          	auipc	a0,0x5
80411340:	d8850513          	addi	a0,a0,-632 # 804160c4 <dev_node_ops+0x644>
80411344:	ae0ef0ef          	jal	ra,80400624 <__panic>

80411348 <sfs_io.part.12>:
80411348:	ff010113          	addi	sp,sp,-16
8041134c:	00005697          	auipc	a3,0x5
80411350:	d9068693          	addi	a3,a3,-624 # 804160dc <dev_node_ops+0x65c>
80411354:	00002617          	auipc	a2,0x2
80411358:	b7460613          	addi	a2,a2,-1164 # 80412ec8 <commands+0x1bc>
8041135c:	29700593          	li	a1,663
80411360:	00005517          	auipc	a0,0x5
80411364:	d6450513          	addi	a0,a0,-668 # 804160c4 <dev_node_ops+0x644>
80411368:	00112623          	sw	ra,12(sp)
8041136c:	ab8ef0ef          	jal	ra,80400624 <__panic>

80411370 <sfs_read>:
80411370:	fd010113          	addi	sp,sp,-48
80411374:	03212023          	sw	s2,32(sp)
80411378:	03852903          	lw	s2,56(a0)
8041137c:	02112623          	sw	ra,44(sp)
80411380:	02812423          	sw	s0,40(sp)
80411384:	02912223          	sw	s1,36(sp)
80411388:	01312e23          	sw	s3,28(sp)
8041138c:	08090a63          	beqz	s2,80411420 <sfs_read+0xb0>
80411390:	06c92783          	lw	a5,108(s2)
80411394:	08079663          	bnez	a5,80411420 <sfs_read+0xb0>
80411398:	02c52703          	lw	a4,44(a0)
8041139c:	000017b7          	lui	a5,0x1
804113a0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804113a4:	00050413          	mv	s0,a0
804113a8:	08f71c63          	bne	a4,a5,80411440 <sfs_read+0xd0>
804113ac:	01050993          	addi	s3,a0,16
804113b0:	00098513          	mv	a0,s3
804113b4:	00058493          	mv	s1,a1
804113b8:	e21f30ef          	jal	ra,804051d8 <down>
804113bc:	00c4a803          	lw	a6,12(s1)
804113c0:	0044a683          	lw	a3,4(s1)
804113c4:	0004a603          	lw	a2,0(s1)
804113c8:	00040593          	mv	a1,s0
804113cc:	00000793          	li	a5,0
804113d0:	00c10713          	addi	a4,sp,12
804113d4:	00090513          	mv	a0,s2
804113d8:	01012623          	sw	a6,12(sp)
804113dc:	cd4ff0ef          	jal	ra,804108b0 <sfs_io_nolock>
804113e0:	00c12583          	lw	a1,12(sp)
804113e4:	00050413          	mv	s0,a0
804113e8:	02059663          	bnez	a1,80411414 <sfs_read+0xa4>
804113ec:	00098513          	mv	a0,s3
804113f0:	de5f30ef          	jal	ra,804051d4 <up>
804113f4:	00040513          	mv	a0,s0
804113f8:	02c12083          	lw	ra,44(sp)
804113fc:	02812403          	lw	s0,40(sp)
80411400:	02412483          	lw	s1,36(sp)
80411404:	02012903          	lw	s2,32(sp)
80411408:	01c12983          	lw	s3,28(sp)
8041140c:	03010113          	addi	sp,sp,48
80411410:	00008067          	ret
80411414:	00048513          	mv	a0,s1
80411418:	ae4f50ef          	jal	ra,804066fc <iobuf_skip>
8041141c:	fd1ff06f          	j	804113ec <sfs_read+0x7c>
80411420:	00005697          	auipc	a3,0x5
80411424:	b0868693          	addi	a3,a3,-1272 # 80415f28 <dev_node_ops+0x4a8>
80411428:	00002617          	auipc	a2,0x2
8041142c:	aa060613          	addi	a2,a2,-1376 # 80412ec8 <commands+0x1bc>
80411430:	29600593          	li	a1,662
80411434:	00005517          	auipc	a0,0x5
80411438:	c9050513          	addi	a0,a0,-880 # 804160c4 <dev_node_ops+0x644>
8041143c:	9e8ef0ef          	jal	ra,80400624 <__panic>
80411440:	f09ff0ef          	jal	ra,80411348 <sfs_io.part.12>

80411444 <sfs_write>:
80411444:	fd010113          	addi	sp,sp,-48
80411448:	03212023          	sw	s2,32(sp)
8041144c:	03852903          	lw	s2,56(a0)
80411450:	02112623          	sw	ra,44(sp)
80411454:	02812423          	sw	s0,40(sp)
80411458:	02912223          	sw	s1,36(sp)
8041145c:	01312e23          	sw	s3,28(sp)
80411460:	08090a63          	beqz	s2,804114f4 <sfs_write+0xb0>
80411464:	06c92783          	lw	a5,108(s2)
80411468:	08079663          	bnez	a5,804114f4 <sfs_write+0xb0>
8041146c:	02c52703          	lw	a4,44(a0)
80411470:	000017b7          	lui	a5,0x1
80411474:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411478:	00050413          	mv	s0,a0
8041147c:	08f71c63          	bne	a4,a5,80411514 <sfs_write+0xd0>
80411480:	01050993          	addi	s3,a0,16
80411484:	00098513          	mv	a0,s3
80411488:	00058493          	mv	s1,a1
8041148c:	d4df30ef          	jal	ra,804051d8 <down>
80411490:	00c4a803          	lw	a6,12(s1)
80411494:	0044a683          	lw	a3,4(s1)
80411498:	0004a603          	lw	a2,0(s1)
8041149c:	00040593          	mv	a1,s0
804114a0:	00100793          	li	a5,1
804114a4:	00c10713          	addi	a4,sp,12
804114a8:	00090513          	mv	a0,s2
804114ac:	01012623          	sw	a6,12(sp)
804114b0:	c00ff0ef          	jal	ra,804108b0 <sfs_io_nolock>
804114b4:	00c12583          	lw	a1,12(sp)
804114b8:	00050413          	mv	s0,a0
804114bc:	02059663          	bnez	a1,804114e8 <sfs_write+0xa4>
804114c0:	00098513          	mv	a0,s3
804114c4:	d11f30ef          	jal	ra,804051d4 <up>
804114c8:	00040513          	mv	a0,s0
804114cc:	02c12083          	lw	ra,44(sp)
804114d0:	02812403          	lw	s0,40(sp)
804114d4:	02412483          	lw	s1,36(sp)
804114d8:	02012903          	lw	s2,32(sp)
804114dc:	01c12983          	lw	s3,28(sp)
804114e0:	03010113          	addi	sp,sp,48
804114e4:	00008067          	ret
804114e8:	00048513          	mv	a0,s1
804114ec:	a10f50ef          	jal	ra,804066fc <iobuf_skip>
804114f0:	fd1ff06f          	j	804114c0 <sfs_write+0x7c>
804114f4:	00005697          	auipc	a3,0x5
804114f8:	a3468693          	addi	a3,a3,-1484 # 80415f28 <dev_node_ops+0x4a8>
804114fc:	00002617          	auipc	a2,0x2
80411500:	9cc60613          	addi	a2,a2,-1588 # 80412ec8 <commands+0x1bc>
80411504:	29600593          	li	a1,662
80411508:	00005517          	auipc	a0,0x5
8041150c:	bbc50513          	addi	a0,a0,-1092 # 804160c4 <dev_node_ops+0x644>
80411510:	914ef0ef          	jal	ra,80400624 <__panic>
80411514:	e35ff0ef          	jal	ra,80411348 <sfs_io.part.12>

80411518 <sfs_load_inode>:
80411518:	fe010113          	addi	sp,sp,-32
8041151c:	00112e23          	sw	ra,28(sp)
80411520:	00812c23          	sw	s0,24(sp)
80411524:	01212823          	sw	s2,16(sp)
80411528:	01312623          	sw	s3,12(sp)
8041152c:	00050913          	mv	s2,a0
80411530:	00060993          	mv	s3,a2
80411534:	01412423          	sw	s4,8(sp)
80411538:	00912a23          	sw	s1,20(sp)
8041153c:	00058a13          	mv	s4,a1
80411540:	01512223          	sw	s5,4(sp)
80411544:	4f5000ef          	jal	ra,80412238 <lock_sfs_fs>
80411548:	00a00593          	li	a1,10
8041154c:	06892403          	lw	s0,104(s2)
80411550:	00098513          	mv	a0,s3
80411554:	505000ef          	jal	ra,80412258 <hash32>
80411558:	00351513          	slli	a0,a0,0x3
8041155c:	00a40533          	add	a0,s0,a0
80411560:	00050413          	mv	s0,a0
80411564:	00c0006f          	j	80411570 <sfs_load_inode+0x58>
80411568:	fe042783          	lw	a5,-32(s0)
8041156c:	10f98a63          	beq	s3,a5,80411680 <sfs_load_inode+0x168>
80411570:	00442403          	lw	s0,4(s0)
80411574:	fe851ae3          	bne	a0,s0,80411568 <sfs_load_inode+0x50>
80411578:	04000513          	li	a0,64
8041157c:	c44f10ef          	jal	ra,804029c0 <kmalloc>
80411580:	00050a93          	mv	s5,a0
80411584:	14050e63          	beqz	a0,804116e0 <sfs_load_inode+0x1c8>
80411588:	00492503          	lw	a0,4(s2)
8041158c:	00098613          	mv	a2,s3
80411590:	03090593          	addi	a1,s2,48
80411594:	c79fe0ef          	jal	ra,8041020c <sfs_block_inuse.isra.3>
80411598:	1e050863          	beqz	a0,80411788 <sfs_load_inode+0x270>
8041159c:	00000713          	li	a4,0
804115a0:	00098693          	mv	a3,s3
804115a4:	04000613          	li	a2,64
804115a8:	000a8593          	mv	a1,s5
804115ac:	00090513          	mv	a0,s2
804115b0:	125000ef          	jal	ra,80411ed4 <sfs_rbuf>
804115b4:	00050413          	mv	s0,a0
804115b8:	12051e63          	bnez	a0,804116f4 <sfs_load_inode+0x1dc>
804115bc:	006ad783          	lhu	a5,6(s5)
804115c0:	1a078463          	beqz	a5,80411768 <sfs_load_inode+0x250>
804115c4:	00001537          	lui	a0,0x1
804115c8:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804115cc:	830fc0ef          	jal	ra,8040d5fc <__alloc_inode>
804115d0:	00050493          	mv	s1,a0
804115d4:	10050e63          	beqz	a0,804116f0 <sfs_load_inode+0x1d8>
804115d8:	004ad683          	lhu	a3,4(s5)
804115dc:	00100793          	li	a5,1
804115e0:	12f69063          	bne	a3,a5,80411700 <sfs_load_inode+0x1e8>
804115e4:	00005597          	auipc	a1,0x5
804115e8:	c3458593          	addi	a1,a1,-972 # 80416218 <sfs_node_fileops>
804115ec:	00090613          	mv	a2,s2
804115f0:	00048513          	mv	a0,s1
804115f4:	838fc0ef          	jal	ra,8040d62c <inode_init>
804115f8:	02c4a403          	lw	s0,44(s1)
804115fc:	000017b7          	lui	a5,0x1
80411600:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411604:	14f41263          	bne	s0,a5,80411748 <sfs_load_inode+0x230>
80411608:	00100793          	li	a5,1
8041160c:	00f4a623          	sw	a5,12(s1)
80411610:	0154a023          	sw	s5,0(s1)
80411614:	0134a223          	sw	s3,4(s1)
80411618:	0004a423          	sw	zero,8(s1)
8041161c:	00100593          	li	a1,1
80411620:	01048513          	addi	a0,s1,16
80411624:	ba5f30ef          	jal	ra,804051c8 <sem_init>
80411628:	02c4a783          	lw	a5,44(s1)
8041162c:	0e879e63          	bne	a5,s0,80411728 <sfs_load_inode+0x210>
80411630:	06492683          	lw	a3,100(s2)
80411634:	01c48793          	addi	a5,s1,28
80411638:	06090713          	addi	a4,s2,96
8041163c:	00f6a023          	sw	a5,0(a3)
80411640:	06f92223          	sw	a5,100(s2)
80411644:	0044a503          	lw	a0,4(s1)
80411648:	00e4ae23          	sw	a4,28(s1)
8041164c:	02d4a023          	sw	a3,32(s1)
80411650:	06892403          	lw	s0,104(s2)
80411654:	00a00593          	li	a1,10
80411658:	401000ef          	jal	ra,80412258 <hash32>
8041165c:	00351513          	slli	a0,a0,0x3
80411660:	00a40533          	add	a0,s0,a0
80411664:	00452783          	lw	a5,4(a0)
80411668:	02448713          	addi	a4,s1,36
8041166c:	00e7a023          	sw	a4,0(a5)
80411670:	00e52223          	sw	a4,4(a0)
80411674:	02f4a423          	sw	a5,40(s1)
80411678:	02a4a223          	sw	a0,36(s1)
8041167c:	01c0006f          	j	80411698 <sfs_load_inode+0x180>
80411680:	fdc40493          	addi	s1,s0,-36
80411684:	00048513          	mv	a0,s1
80411688:	820fc0ef          	jal	ra,8040d6a8 <inode_ref_inc>
8041168c:	00100793          	li	a5,1
80411690:	04f50063          	beq	a0,a5,804116d0 <sfs_load_inode+0x1b8>
80411694:	ee0482e3          	beqz	s1,80411578 <sfs_load_inode+0x60>
80411698:	00090513          	mv	a0,s2
8041169c:	3ad000ef          	jal	ra,80412248 <unlock_sfs_fs>
804116a0:	00000413          	li	s0,0
804116a4:	009a2023          	sw	s1,0(s4)
804116a8:	00040513          	mv	a0,s0
804116ac:	01c12083          	lw	ra,28(sp)
804116b0:	01812403          	lw	s0,24(sp)
804116b4:	01412483          	lw	s1,20(sp)
804116b8:	01012903          	lw	s2,16(sp)
804116bc:	00c12983          	lw	s3,12(sp)
804116c0:	00812a03          	lw	s4,8(sp)
804116c4:	00412a83          	lw	s5,4(sp)
804116c8:	02010113          	addi	sp,sp,32
804116cc:	00008067          	ret
804116d0:	fe842783          	lw	a5,-24(s0)
804116d4:	00178793          	addi	a5,a5,1
804116d8:	fef42423          	sw	a5,-24(s0)
804116dc:	fb9ff06f          	j	80411694 <sfs_load_inode+0x17c>
804116e0:	ffc00413          	li	s0,-4
804116e4:	00090513          	mv	a0,s2
804116e8:	361000ef          	jal	ra,80412248 <unlock_sfs_fs>
804116ec:	fbdff06f          	j	804116a8 <sfs_load_inode+0x190>
804116f0:	ffc00413          	li	s0,-4
804116f4:	000a8513          	mv	a0,s5
804116f8:	becf10ef          	jal	ra,80402ae4 <kfree>
804116fc:	fe9ff06f          	j	804116e4 <sfs_load_inode+0x1cc>
80411700:	00200793          	li	a5,2
80411704:	00005597          	auipc	a1,0x5
80411708:	ad458593          	addi	a1,a1,-1324 # 804161d8 <sfs_node_dirops>
8041170c:	eef680e3          	beq	a3,a5,804115ec <sfs_load_inode+0xd4>
80411710:	00005617          	auipc	a2,0x5
80411714:	a0460613          	addi	a2,a2,-1532 # 80416114 <dev_node_ops+0x694>
80411718:	02e00593          	li	a1,46
8041171c:	00005517          	auipc	a0,0x5
80411720:	9a850513          	addi	a0,a0,-1624 # 804160c4 <dev_node_ops+0x644>
80411724:	f01ee0ef          	jal	ra,80400624 <__panic>
80411728:	00005697          	auipc	a3,0x5
8041172c:	9b468693          	addi	a3,a3,-1612 # 804160dc <dev_node_ops+0x65c>
80411730:	00001617          	auipc	a2,0x1
80411734:	79860613          	addi	a2,a2,1944 # 80412ec8 <commands+0x1bc>
80411738:	0b100593          	li	a1,177
8041173c:	00005517          	auipc	a0,0x5
80411740:	98850513          	addi	a0,a0,-1656 # 804160c4 <dev_node_ops+0x644>
80411744:	ee1ee0ef          	jal	ra,80400624 <__panic>
80411748:	00005697          	auipc	a3,0x5
8041174c:	99468693          	addi	a3,a3,-1644 # 804160dc <dev_node_ops+0x65c>
80411750:	00001617          	auipc	a2,0x1
80411754:	77860613          	addi	a2,a2,1912 # 80412ec8 <commands+0x1bc>
80411758:	07700593          	li	a1,119
8041175c:	00005517          	auipc	a0,0x5
80411760:	96850513          	addi	a0,a0,-1688 # 804160c4 <dev_node_ops+0x644>
80411764:	ec1ee0ef          	jal	ra,80400624 <__panic>
80411768:	00005697          	auipc	a3,0x5
8041176c:	9e068693          	addi	a3,a3,-1568 # 80416148 <dev_node_ops+0x6c8>
80411770:	00001617          	auipc	a2,0x1
80411774:	75860613          	addi	a2,a2,1880 # 80412ec8 <commands+0x1bc>
80411778:	0ad00593          	li	a1,173
8041177c:	00005517          	auipc	a0,0x5
80411780:	94850513          	addi	a0,a0,-1720 # 804160c4 <dev_node_ops+0x644>
80411784:	ea1ee0ef          	jal	ra,80400624 <__panic>
80411788:	00005697          	auipc	a3,0x5
8041178c:	8d468693          	addi	a3,a3,-1836 # 8041605c <dev_node_ops+0x5dc>
80411790:	00001617          	auipc	a2,0x1
80411794:	73860613          	addi	a2,a2,1848 # 80412ec8 <commands+0x1bc>
80411798:	0a800593          	li	a1,168
8041179c:	00005517          	auipc	a0,0x5
804117a0:	92850513          	addi	a0,a0,-1752 # 804160c4 <dev_node_ops+0x644>
804117a4:	e81ee0ef          	jal	ra,80400624 <__panic>

804117a8 <sfs_lookup_once.constprop.13>:
804117a8:	fd010113          	addi	sp,sp,-48
804117ac:	01312e23          	sw	s3,28(sp)
804117b0:	01058993          	addi	s3,a1,16
804117b4:	01712623          	sw	s7,12(sp)
804117b8:	00050b93          	mv	s7,a0
804117bc:	00098513          	mv	a0,s3
804117c0:	02112623          	sw	ra,44(sp)
804117c4:	03212023          	sw	s2,32(sp)
804117c8:	01512a23          	sw	s5,20(sp)
804117cc:	01812423          	sw	s8,8(sp)
804117d0:	00060a93          	mv	s5,a2
804117d4:	00058913          	mv	s2,a1
804117d8:	00068c13          	mv	s8,a3
804117dc:	02812423          	sw	s0,40(sp)
804117e0:	02912223          	sw	s1,36(sp)
804117e4:	01412c23          	sw	s4,24(sp)
804117e8:	01612823          	sw	s6,16(sp)
804117ec:	01912223          	sw	s9,4(sp)
804117f0:	9e9f30ef          	jal	ra,804051d8 <down>
804117f4:	000a8513          	mv	a0,s5
804117f8:	1bc010ef          	jal	ra,804129b4 <strlen>
804117fc:	0ff00793          	li	a5,255
80411800:	10a7ee63          	bltu	a5,a0,8041191c <sfs_lookup_once.constprop.13+0x174>
80411804:	10400513          	li	a0,260
80411808:	9b8f10ef          	jal	ra,804029c0 <kmalloc>
8041180c:	00050413          	mv	s0,a0
80411810:	0e050e63          	beqz	a0,8041190c <sfs_lookup_once.constprop.13+0x164>
80411814:	00092783          	lw	a5,0(s2)
80411818:	0087ab03          	lw	s6,8(a5)
8041181c:	09605a63          	blez	s6,804118b0 <sfs_lookup_once.constprop.13+0x108>
80411820:	00000493          	li	s1,0
80411824:	00450c93          	addi	s9,a0,4
80411828:	0240006f          	j	8041184c <sfs_lookup_once.constprop.13+0xa4>
8041182c:	00042783          	lw	a5,0(s0)
80411830:	00078a63          	beqz	a5,80411844 <sfs_lookup_once.constprop.13+0x9c>
80411834:	000c8593          	mv	a1,s9
80411838:	000a8513          	mv	a0,s5
8041183c:	200010ef          	jal	ra,80412a3c <strcmp>
80411840:	06050c63          	beqz	a0,804118b8 <sfs_lookup_once.constprop.13+0x110>
80411844:	00148493          	addi	s1,s1,1
80411848:	069b0463          	beq	s6,s1,804118b0 <sfs_lookup_once.constprop.13+0x108>
8041184c:	00040693          	mv	a3,s0
80411850:	00048613          	mv	a2,s1
80411854:	00090593          	mv	a1,s2
80411858:	000b8513          	mv	a0,s7
8041185c:	b30ff0ef          	jal	ra,80410b8c <sfs_dirent_read_nolock>
80411860:	00050a13          	mv	s4,a0
80411864:	fc0504e3          	beqz	a0,8041182c <sfs_lookup_once.constprop.13+0x84>
80411868:	00040513          	mv	a0,s0
8041186c:	a78f10ef          	jal	ra,80402ae4 <kfree>
80411870:	00098513          	mv	a0,s3
80411874:	961f30ef          	jal	ra,804051d4 <up>
80411878:	02c12083          	lw	ra,44(sp)
8041187c:	02812403          	lw	s0,40(sp)
80411880:	000a0513          	mv	a0,s4
80411884:	02412483          	lw	s1,36(sp)
80411888:	02012903          	lw	s2,32(sp)
8041188c:	01c12983          	lw	s3,28(sp)
80411890:	01812a03          	lw	s4,24(sp)
80411894:	01412a83          	lw	s5,20(sp)
80411898:	01012b03          	lw	s6,16(sp)
8041189c:	00c12b83          	lw	s7,12(sp)
804118a0:	00812c03          	lw	s8,8(sp)
804118a4:	00412c83          	lw	s9,4(sp)
804118a8:	03010113          	addi	sp,sp,48
804118ac:	00008067          	ret
804118b0:	ff000a13          	li	s4,-16
804118b4:	fb5ff06f          	j	80411868 <sfs_lookup_once.constprop.13+0xc0>
804118b8:	00040513          	mv	a0,s0
804118bc:	00042483          	lw	s1,0(s0)
804118c0:	a24f10ef          	jal	ra,80402ae4 <kfree>
804118c4:	00098513          	mv	a0,s3
804118c8:	90df30ef          	jal	ra,804051d4 <up>
804118cc:	02812403          	lw	s0,40(sp)
804118d0:	02c12083          	lw	ra,44(sp)
804118d4:	02012903          	lw	s2,32(sp)
804118d8:	01c12983          	lw	s3,28(sp)
804118dc:	01812a03          	lw	s4,24(sp)
804118e0:	01412a83          	lw	s5,20(sp)
804118e4:	01012b03          	lw	s6,16(sp)
804118e8:	00412c83          	lw	s9,4(sp)
804118ec:	00048613          	mv	a2,s1
804118f0:	000c0593          	mv	a1,s8
804118f4:	02412483          	lw	s1,36(sp)
804118f8:	00812c03          	lw	s8,8(sp)
804118fc:	000b8513          	mv	a0,s7
80411900:	00c12b83          	lw	s7,12(sp)
80411904:	03010113          	addi	sp,sp,48
80411908:	c11ff06f          	j	80411518 <sfs_load_inode>
8041190c:	00098513          	mv	a0,s3
80411910:	8c5f30ef          	jal	ra,804051d4 <up>
80411914:	ffc00a13          	li	s4,-4
80411918:	f61ff06f          	j	80411878 <sfs_lookup_once.constprop.13+0xd0>
8041191c:	00005697          	auipc	a3,0x5
80411920:	86068693          	addi	a3,a3,-1952 # 8041617c <dev_node_ops+0x6fc>
80411924:	00001617          	auipc	a2,0x1
80411928:	5a460613          	addi	a2,a2,1444 # 80412ec8 <commands+0x1bc>
8041192c:	1ba00593          	li	a1,442
80411930:	00004517          	auipc	a0,0x4
80411934:	79450513          	addi	a0,a0,1940 # 804160c4 <dev_node_ops+0x644>
80411938:	cedee0ef          	jal	ra,80400624 <__panic>

8041193c <sfs_namefile>:
8041193c:	00c5a703          	lw	a4,12(a1)
80411940:	fa010113          	addi	sp,sp,-96
80411944:	04112e23          	sw	ra,92(sp)
80411948:	04812c23          	sw	s0,88(sp)
8041194c:	04912a23          	sw	s1,84(sp)
80411950:	05212823          	sw	s2,80(sp)
80411954:	05312623          	sw	s3,76(sp)
80411958:	05412423          	sw	s4,72(sp)
8041195c:	05512223          	sw	s5,68(sp)
80411960:	05612023          	sw	s6,64(sp)
80411964:	03712e23          	sw	s7,60(sp)
80411968:	03812c23          	sw	s8,56(sp)
8041196c:	03912a23          	sw	s9,52(sp)
80411970:	03a12823          	sw	s10,48(sp)
80411974:	03b12623          	sw	s11,44(sp)
80411978:	00b12623          	sw	a1,12(sp)
8041197c:	00200793          	li	a5,2
80411980:	24e7f063          	bgeu	a5,a4,80411bc0 <sfs_namefile+0x284>
80411984:	00050493          	mv	s1,a0
80411988:	10400513          	li	a0,260
8041198c:	834f10ef          	jal	ra,804029c0 <kmalloc>
80411990:	00050a93          	mv	s5,a0
80411994:	22050663          	beqz	a0,80411bc0 <sfs_namefile+0x284>
80411998:	0384ab03          	lw	s6,56(s1)
8041199c:	260b0663          	beqz	s6,80411c08 <sfs_namefile+0x2cc>
804119a0:	06cb2783          	lw	a5,108(s6)
804119a4:	26079263          	bnez	a5,80411c08 <sfs_namefile+0x2cc>
804119a8:	02c4ac03          	lw	s8,44(s1)
804119ac:	000017b7          	lui	a5,0x1
804119b0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804119b4:	26fc1a63          	bne	s8,a5,80411c28 <sfs_namefile+0x2ec>
804119b8:	00c12703          	lw	a4,12(sp)
804119bc:	00048513          	mv	a0,s1
804119c0:	00048413          	mv	s0,s1
804119c4:	00c72783          	lw	a5,12(a4) # 800000c <_binary_bin_sfs_img_size+0x7f8800c>
804119c8:	00072903          	lw	s2,0(a4)
804119cc:	00004c97          	auipc	s9,0x4
804119d0:	7d4c8c93          	addi	s9,s9,2004 # 804161a0 <dev_node_ops+0x720>
804119d4:	ffe78a13          	addi	s4,a5,-2
804119d8:	00f90933          	add	s2,s2,a5
804119dc:	ccdfb0ef          	jal	ra,8040d6a8 <inode_ref_inc>
804119e0:	01c10693          	addi	a3,sp,28
804119e4:	000c8613          	mv	a2,s9
804119e8:	00040593          	mv	a1,s0
804119ec:	000b0513          	mv	a0,s6
804119f0:	01812423          	sw	s8,8(sp)
804119f4:	db5ff0ef          	jal	ra,804117a8 <sfs_lookup_once.constprop.13>
804119f8:	004a8b93          	addi	s7,s5,4
804119fc:	00050d93          	mv	s11,a0
80411a00:	0e051863          	bnez	a0,80411af0 <sfs_namefile+0x1b4>
80411a04:	00048513          	mv	a0,s1
80411a08:	00442983          	lw	s3,4(s0)
80411a0c:	d91fb0ef          	jal	ra,8040d79c <inode_ref_dec>
80411a10:	01c12d03          	lw	s10,28(sp)
80411a14:	149d0663          	beq	s10,s1,80411b60 <sfs_namefile+0x224>
80411a18:	1c0d0863          	beqz	s10,80411be8 <sfs_namefile+0x2ac>
80411a1c:	02cd2683          	lw	a3,44(s10)
80411a20:	00812783          	lw	a5,8(sp)
80411a24:	1cf69263          	bne	a3,a5,80411be8 <sfs_namefile+0x2ac>
80411a28:	004d2683          	lw	a3,4(s10)
80411a2c:	000d0413          	mv	s0,s10
80411a30:	19368c63          	beq	a3,s3,80411bc8 <sfs_namefile+0x28c>
80411a34:	000d2683          	lw	a3,0(s10)
80411a38:	00200793          	li	a5,2
80411a3c:	0046d683          	lhu	a3,4(a3)
80411a40:	18f69463          	bne	a3,a5,80411bc8 <sfs_namefile+0x28c>
80411a44:	010d0493          	addi	s1,s10,16
80411a48:	00048513          	mv	a0,s1
80411a4c:	f8cf30ef          	jal	ra,804051d8 <down>
80411a50:	000d2683          	lw	a3,0(s10)
80411a54:	0086ac03          	lw	s8,8(a3)
80411a58:	01804c63          	bgtz	s8,80411a70 <sfs_namefile+0x134>
80411a5c:	0e40006f          	j	80411b40 <sfs_namefile+0x204>
80411a60:	000aa683          	lw	a3,0(s5)
80411a64:	02d98663          	beq	s3,a3,80411a90 <sfs_namefile+0x154>
80411a68:	001d8d93          	addi	s11,s11,1
80411a6c:	0dbc0a63          	beq	s8,s11,80411b40 <sfs_namefile+0x204>
80411a70:	000a8693          	mv	a3,s5
80411a74:	000d8613          	mv	a2,s11
80411a78:	000d0593          	mv	a1,s10
80411a7c:	000b0513          	mv	a0,s6
80411a80:	90cff0ef          	jal	ra,80410b8c <sfs_dirent_read_nolock>
80411a84:	00050693          	mv	a3,a0
80411a88:	fc050ce3          	beqz	a0,80411a60 <sfs_namefile+0x124>
80411a8c:	0b80006f          	j	80411b44 <sfs_namefile+0x208>
80411a90:	00048513          	mv	a0,s1
80411a94:	f40f30ef          	jal	ra,804051d4 <up>
80411a98:	000b8513          	mv	a0,s7
80411a9c:	719000ef          	jal	ra,804129b4 <strlen>
80411aa0:	00150713          	addi	a4,a0,1
80411aa4:	10ea6863          	bltu	s4,a4,80411bb4 <sfs_namefile+0x278>
80411aa8:	fff54993          	not	s3,a0
80411aac:	013909b3          	add	s3,s2,s3
80411ab0:	00050613          	mv	a2,a0
80411ab4:	000b8593          	mv	a1,s7
80411ab8:	00098513          	mv	a0,s3
80411abc:	40ea0a33          	sub	s4,s4,a4
80411ac0:	048010ef          	jal	ra,80412b08 <memcpy>
80411ac4:	02f00793          	li	a5,47
80411ac8:	fef90fa3          	sb	a5,-1(s2)
80411acc:	01c10693          	addi	a3,sp,28
80411ad0:	000c8613          	mv	a2,s9
80411ad4:	00040593          	mv	a1,s0
80411ad8:	000b0513          	mv	a0,s6
80411adc:	ccdff0ef          	jal	ra,804117a8 <sfs_lookup_once.constprop.13>
80411ae0:	000d0493          	mv	s1,s10
80411ae4:	00098913          	mv	s2,s3
80411ae8:	00050d93          	mv	s11,a0
80411aec:	f0050ce3          	beqz	a0,80411a04 <sfs_namefile+0xc8>
80411af0:	00048513          	mv	a0,s1
80411af4:	ca9fb0ef          	jal	ra,8040d79c <inode_ref_dec>
80411af8:	000a8513          	mv	a0,s5
80411afc:	fe9f00ef          	jal	ra,80402ae4 <kfree>
80411b00:	05c12083          	lw	ra,92(sp)
80411b04:	05812403          	lw	s0,88(sp)
80411b08:	000d8513          	mv	a0,s11
80411b0c:	05412483          	lw	s1,84(sp)
80411b10:	05012903          	lw	s2,80(sp)
80411b14:	04c12983          	lw	s3,76(sp)
80411b18:	04812a03          	lw	s4,72(sp)
80411b1c:	04412a83          	lw	s5,68(sp)
80411b20:	04012b03          	lw	s6,64(sp)
80411b24:	03c12b83          	lw	s7,60(sp)
80411b28:	03812c03          	lw	s8,56(sp)
80411b2c:	03412c83          	lw	s9,52(sp)
80411b30:	03012d03          	lw	s10,48(sp)
80411b34:	02c12d83          	lw	s11,44(sp)
80411b38:	06010113          	addi	sp,sp,96
80411b3c:	00008067          	ret
80411b40:	ff000693          	li	a3,-16
80411b44:	00048513          	mv	a0,s1
80411b48:	00d12423          	sw	a3,8(sp)
80411b4c:	e88f30ef          	jal	ra,804051d4 <up>
80411b50:	00812683          	lw	a3,8(sp)
80411b54:	000d0493          	mv	s1,s10
80411b58:	00068d93          	mv	s11,a3
80411b5c:	f95ff06f          	j	80411af0 <sfs_namefile+0x1b4>
80411b60:	00048513          	mv	a0,s1
80411b64:	c39fb0ef          	jal	ra,8040d79c <inode_ref_dec>
80411b68:	00c12403          	lw	s0,12(sp)
80411b6c:	00090593          	mv	a1,s2
80411b70:	00c42783          	lw	a5,12(s0)
80411b74:	00042503          	lw	a0,0(s0)
80411b78:	ffe78793          	addi	a5,a5,-2
80411b7c:	41478a33          	sub	s4,a5,s4
80411b80:	000a0613          	mv	a2,s4
80411b84:	00150513          	addi	a0,a0,1
80411b88:	72d000ef          	jal	ra,80412ab4 <memmove>
80411b8c:	02f00793          	li	a5,47
80411b90:	fef50fa3          	sb	a5,-1(a0)
80411b94:	01450533          	add	a0,a0,s4
80411b98:	00050023          	sb	zero,0(a0)
80411b9c:	000a0593          	mv	a1,s4
80411ba0:	00040513          	mv	a0,s0
80411ba4:	b59f40ef          	jal	ra,804066fc <iobuf_skip>
80411ba8:	000a8513          	mv	a0,s5
80411bac:	f39f00ef          	jal	ra,80402ae4 <kfree>
80411bb0:	f51ff06f          	j	80411b00 <sfs_namefile+0x1c4>
80411bb4:	000d0493          	mv	s1,s10
80411bb8:	ffc00d93          	li	s11,-4
80411bbc:	f35ff06f          	j	80411af0 <sfs_namefile+0x1b4>
80411bc0:	ffc00d93          	li	s11,-4
80411bc4:	f3dff06f          	j	80411b00 <sfs_namefile+0x1c4>
80411bc8:	00004697          	auipc	a3,0x4
80411bcc:	5dc68693          	addi	a3,a3,1500 # 804161a4 <dev_node_ops+0x724>
80411bd0:	00001617          	auipc	a2,0x1
80411bd4:	2f860613          	addi	a2,a2,760 # 80412ec8 <commands+0x1bc>
80411bd8:	2f900593          	li	a1,761
80411bdc:	00004517          	auipc	a0,0x4
80411be0:	4e850513          	addi	a0,a0,1256 # 804160c4 <dev_node_ops+0x644>
80411be4:	a41ee0ef          	jal	ra,80400624 <__panic>
80411be8:	00004697          	auipc	a3,0x4
80411bec:	4f468693          	addi	a3,a3,1268 # 804160dc <dev_node_ops+0x65c>
80411bf0:	00001617          	auipc	a2,0x1
80411bf4:	2d860613          	addi	a2,a2,728 # 80412ec8 <commands+0x1bc>
80411bf8:	2f800593          	li	a1,760
80411bfc:	00004517          	auipc	a0,0x4
80411c00:	4c850513          	addi	a0,a0,1224 # 804160c4 <dev_node_ops+0x644>
80411c04:	a21ee0ef          	jal	ra,80400624 <__panic>
80411c08:	00004697          	auipc	a3,0x4
80411c0c:	32068693          	addi	a3,a3,800 # 80415f28 <dev_node_ops+0x4a8>
80411c10:	00001617          	auipc	a2,0x1
80411c14:	2b860613          	addi	a2,a2,696 # 80412ec8 <commands+0x1bc>
80411c18:	2e400593          	li	a1,740
80411c1c:	00004517          	auipc	a0,0x4
80411c20:	4a850513          	addi	a0,a0,1192 # 804160c4 <dev_node_ops+0x644>
80411c24:	a01ee0ef          	jal	ra,80400624 <__panic>
80411c28:	00004697          	auipc	a3,0x4
80411c2c:	4b468693          	addi	a3,a3,1204 # 804160dc <dev_node_ops+0x65c>
80411c30:	00001617          	auipc	a2,0x1
80411c34:	29860613          	addi	a2,a2,664 # 80412ec8 <commands+0x1bc>
80411c38:	2e500593          	li	a1,741
80411c3c:	00004517          	auipc	a0,0x4
80411c40:	48850513          	addi	a0,a0,1160 # 804160c4 <dev_node_ops+0x644>
80411c44:	9e1ee0ef          	jal	ra,80400624 <__panic>

80411c48 <sfs_lookup>:
80411c48:	fd010113          	addi	sp,sp,-48
80411c4c:	02912223          	sw	s1,36(sp)
80411c50:	03852483          	lw	s1,56(a0)
80411c54:	02112623          	sw	ra,44(sp)
80411c58:	02812423          	sw	s0,40(sp)
80411c5c:	03212023          	sw	s2,32(sp)
80411c60:	01312e23          	sw	s3,28(sp)
80411c64:	0c048463          	beqz	s1,80411d2c <sfs_lookup+0xe4>
80411c68:	06c4a783          	lw	a5,108(s1)
80411c6c:	0c079063          	bnez	a5,80411d2c <sfs_lookup+0xe4>
80411c70:	0005c783          	lbu	a5,0(a1)
80411c74:	00058913          	mv	s2,a1
80411c78:	08078a63          	beqz	a5,80411d0c <sfs_lookup+0xc4>
80411c7c:	02f00713          	li	a4,47
80411c80:	08e78663          	beq	a5,a4,80411d0c <sfs_lookup+0xc4>
80411c84:	00050413          	mv	s0,a0
80411c88:	00060993          	mv	s3,a2
80411c8c:	a1dfb0ef          	jal	ra,8040d6a8 <inode_ref_inc>
80411c90:	02c42703          	lw	a4,44(s0)
80411c94:	000017b7          	lui	a5,0x1
80411c98:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411c9c:	0af71863          	bne	a4,a5,80411d4c <sfs_lookup+0x104>
80411ca0:	00042703          	lw	a4,0(s0)
80411ca4:	00200793          	li	a5,2
80411ca8:	00475703          	lhu	a4,4(a4)
80411cac:	04f71863          	bne	a4,a5,80411cfc <sfs_lookup+0xb4>
80411cb0:	00048513          	mv	a0,s1
80411cb4:	00c10693          	addi	a3,sp,12
80411cb8:	00090613          	mv	a2,s2
80411cbc:	00040593          	mv	a1,s0
80411cc0:	ae9ff0ef          	jal	ra,804117a8 <sfs_lookup_once.constprop.13>
80411cc4:	00050493          	mv	s1,a0
80411cc8:	00040513          	mv	a0,s0
80411ccc:	ad1fb0ef          	jal	ra,8040d79c <inode_ref_dec>
80411cd0:	00049663          	bnez	s1,80411cdc <sfs_lookup+0x94>
80411cd4:	00c12783          	lw	a5,12(sp)
80411cd8:	00f9a023          	sw	a5,0(s3)
80411cdc:	02c12083          	lw	ra,44(sp)
80411ce0:	02812403          	lw	s0,40(sp)
80411ce4:	00048513          	mv	a0,s1
80411ce8:	02012903          	lw	s2,32(sp)
80411cec:	02412483          	lw	s1,36(sp)
80411cf0:	01c12983          	lw	s3,28(sp)
80411cf4:	03010113          	addi	sp,sp,48
80411cf8:	00008067          	ret
80411cfc:	00040513          	mv	a0,s0
80411d00:	a9dfb0ef          	jal	ra,8040d79c <inode_ref_dec>
80411d04:	fee00493          	li	s1,-18
80411d08:	fd5ff06f          	j	80411cdc <sfs_lookup+0x94>
80411d0c:	00004697          	auipc	a3,0x4
80411d10:	45068693          	addi	a3,a3,1104 # 8041615c <dev_node_ops+0x6dc>
80411d14:	00001617          	auipc	a2,0x1
80411d18:	1b460613          	addi	a2,a2,436 # 80412ec8 <commands+0x1bc>
80411d1c:	3db00593          	li	a1,987
80411d20:	00004517          	auipc	a0,0x4
80411d24:	3a450513          	addi	a0,a0,932 # 804160c4 <dev_node_ops+0x644>
80411d28:	8fdee0ef          	jal	ra,80400624 <__panic>
80411d2c:	00004697          	auipc	a3,0x4
80411d30:	1fc68693          	addi	a3,a3,508 # 80415f28 <dev_node_ops+0x4a8>
80411d34:	00001617          	auipc	a2,0x1
80411d38:	19460613          	addi	a2,a2,404 # 80412ec8 <commands+0x1bc>
80411d3c:	3da00593          	li	a1,986
80411d40:	00004517          	auipc	a0,0x4
80411d44:	38450513          	addi	a0,a0,900 # 804160c4 <dev_node_ops+0x644>
80411d48:	8ddee0ef          	jal	ra,80400624 <__panic>
80411d4c:	00004697          	auipc	a3,0x4
80411d50:	39068693          	addi	a3,a3,912 # 804160dc <dev_node_ops+0x65c>
80411d54:	00001617          	auipc	a2,0x1
80411d58:	17460613          	addi	a2,a2,372 # 80412ec8 <commands+0x1bc>
80411d5c:	3dd00593          	li	a1,989
80411d60:	00004517          	auipc	a0,0x4
80411d64:	36450513          	addi	a0,a0,868 # 804160c4 <dev_node_ops+0x644>
80411d68:	8bdee0ef          	jal	ra,80400624 <__panic>

80411d6c <sfs_rwblock_nolock.isra.0>:
80411d6c:	fe010113          	addi	sp,sp,-32
80411d70:	00812c23          	sw	s0,24(sp)
80411d74:	00912a23          	sw	s1,20(sp)
80411d78:	00112e23          	sw	ra,28(sp)
80411d7c:	00058493          	mv	s1,a1
80411d80:	00070413          	mv	s0,a4
80411d84:	00060593          	mv	a1,a2
80411d88:	00069463          	bnez	a3,80411d90 <sfs_rwblock_nolock.isra.0+0x24>
80411d8c:	04079463          	bnez	a5,80411dd4 <sfs_rwblock_nolock.isra.0+0x68>
80411d90:	00052783          	lw	a5,0(a0)
80411d94:	04f6f063          	bgeu	a3,a5,80411dd4 <sfs_rwblock_nolock.isra.0+0x68>
80411d98:	00001637          	lui	a2,0x1
80411d9c:	00c69693          	slli	a3,a3,0xc
80411da0:	00010513          	mv	a0,sp
80411da4:	889f40ef          	jal	ra,8040662c <iobuf_init>
80411da8:	0004a783          	lw	a5,0(s1)
80411dac:	00050593          	mv	a1,a0
80411db0:	00040613          	mv	a2,s0
80411db4:	0107a703          	lw	a4,16(a5)
80411db8:	00078513          	mv	a0,a5
80411dbc:	000700e7          	jalr	a4
80411dc0:	01c12083          	lw	ra,28(sp)
80411dc4:	01812403          	lw	s0,24(sp)
80411dc8:	01412483          	lw	s1,20(sp)
80411dcc:	02010113          	addi	sp,sp,32
80411dd0:	00008067          	ret
80411dd4:	00004697          	auipc	a3,0x4
80411dd8:	55868693          	addi	a3,a3,1368 # 8041632c <sfs_node_fileops+0x114>
80411ddc:	00001617          	auipc	a2,0x1
80411de0:	0ec60613          	addi	a2,a2,236 # 80412ec8 <commands+0x1bc>
80411de4:	01500593          	li	a1,21
80411de8:	00004517          	auipc	a0,0x4
80411dec:	57850513          	addi	a0,a0,1400 # 80416360 <sfs_node_fileops+0x148>
80411df0:	835ee0ef          	jal	ra,80400624 <__panic>

80411df4 <sfs_rwblock>:
80411df4:	fd010113          	addi	sp,sp,-48
80411df8:	02812423          	sw	s0,40(sp)
80411dfc:	03212023          	sw	s2,32(sp)
80411e00:	01812423          	sw	s8,8(sp)
80411e04:	00060413          	mv	s0,a2
80411e08:	00050c13          	mv	s8,a0
80411e0c:	00068913          	mv	s2,a3
80411e10:	02912223          	sw	s1,36(sp)
80411e14:	01312e23          	sw	s3,28(sp)
80411e18:	01412c23          	sw	s4,24(sp)
80411e1c:	01512a23          	sw	s5,20(sp)
80411e20:	01612823          	sw	s6,16(sp)
80411e24:	01712623          	sw	s7,12(sp)
80411e28:	02112623          	sw	ra,44(sp)
80411e2c:	00058493          	mv	s1,a1
80411e30:	00070a93          	mv	s5,a4
80411e34:	00450a13          	addi	s4,a0,4
80411e38:	01240bb3          	add	s7,s0,s2
80411e3c:	404000ef          	jal	ra,80412240 <lock_sfs_io>
80411e40:	02cc0993          	addi	s3,s8,44
80411e44:	00001b37          	lui	s6,0x1
80411e48:	00091863          	bnez	s2,80411e58 <sfs_rwblock+0x64>
80411e4c:	0700006f          	j	80411ebc <sfs_rwblock+0xc8>
80411e50:	016484b3          	add	s1,s1,s6
80411e54:	068b8463          	beq	s7,s0,80411ebc <sfs_rwblock+0xc8>
80411e58:	00040693          	mv	a3,s0
80411e5c:	00048613          	mv	a2,s1
80411e60:	00100793          	li	a5,1
80411e64:	000a8713          	mv	a4,s5
80411e68:	00098593          	mv	a1,s3
80411e6c:	000a0513          	mv	a0,s4
80411e70:	efdff0ef          	jal	ra,80411d6c <sfs_rwblock_nolock.isra.0>
80411e74:	00050913          	mv	s2,a0
80411e78:	00140413          	addi	s0,s0,1
80411e7c:	fc050ae3          	beqz	a0,80411e50 <sfs_rwblock+0x5c>
80411e80:	000c0513          	mv	a0,s8
80411e84:	3cc000ef          	jal	ra,80412250 <unlock_sfs_io>
80411e88:	02c12083          	lw	ra,44(sp)
80411e8c:	02812403          	lw	s0,40(sp)
80411e90:	00090513          	mv	a0,s2
80411e94:	02412483          	lw	s1,36(sp)
80411e98:	02012903          	lw	s2,32(sp)
80411e9c:	01c12983          	lw	s3,28(sp)
80411ea0:	01812a03          	lw	s4,24(sp)
80411ea4:	01412a83          	lw	s5,20(sp)
80411ea8:	01012b03          	lw	s6,16(sp)
80411eac:	00c12b83          	lw	s7,12(sp)
80411eb0:	00812c03          	lw	s8,8(sp)
80411eb4:	03010113          	addi	sp,sp,48
80411eb8:	00008067          	ret
80411ebc:	00000913          	li	s2,0
80411ec0:	fc1ff06f          	j	80411e80 <sfs_rwblock+0x8c>

80411ec4 <sfs_rblock>:
80411ec4:	00000713          	li	a4,0
80411ec8:	f2dff06f          	j	80411df4 <sfs_rwblock>

80411ecc <sfs_wblock>:
80411ecc:	00100713          	li	a4,1
80411ed0:	f25ff06f          	j	80411df4 <sfs_rwblock>

80411ed4 <sfs_rbuf>:
80411ed4:	fe010113          	addi	sp,sp,-32
80411ed8:	00112e23          	sw	ra,28(sp)
80411edc:	00812c23          	sw	s0,24(sp)
80411ee0:	00912a23          	sw	s1,20(sp)
80411ee4:	01212823          	sw	s2,16(sp)
80411ee8:	01312623          	sw	s3,12(sp)
80411eec:	01412423          	sw	s4,8(sp)
80411ef0:	000017b7          	lui	a5,0x1
80411ef4:	08f77663          	bgeu	a4,a5,80411f80 <sfs_rbuf+0xac>
80411ef8:	00070493          	mv	s1,a4
80411efc:	00c70733          	add	a4,a4,a2
80411f00:	00060993          	mv	s3,a2
80411f04:	06e7ee63          	bltu	a5,a4,80411f80 <sfs_rbuf+0xac>
80411f08:	00050413          	mv	s0,a0
80411f0c:	00068913          	mv	s2,a3
80411f10:	00058a13          	mv	s4,a1
80411f14:	32c000ef          	jal	ra,80412240 <lock_sfs_io>
80411f18:	03842603          	lw	a2,56(s0)
80411f1c:	00090693          	mv	a3,s2
80411f20:	00100793          	li	a5,1
80411f24:	00000713          	li	a4,0
80411f28:	02c40593          	addi	a1,s0,44
80411f2c:	00440513          	addi	a0,s0,4
80411f30:	e3dff0ef          	jal	ra,80411d6c <sfs_rwblock_nolock.isra.0>
80411f34:	00050913          	mv	s2,a0
80411f38:	02050863          	beqz	a0,80411f68 <sfs_rbuf+0x94>
80411f3c:	00040513          	mv	a0,s0
80411f40:	310000ef          	jal	ra,80412250 <unlock_sfs_io>
80411f44:	01c12083          	lw	ra,28(sp)
80411f48:	01812403          	lw	s0,24(sp)
80411f4c:	00090513          	mv	a0,s2
80411f50:	01412483          	lw	s1,20(sp)
80411f54:	01012903          	lw	s2,16(sp)
80411f58:	00c12983          	lw	s3,12(sp)
80411f5c:	00812a03          	lw	s4,8(sp)
80411f60:	02010113          	addi	sp,sp,32
80411f64:	00008067          	ret
80411f68:	03842583          	lw	a1,56(s0)
80411f6c:	00098613          	mv	a2,s3
80411f70:	000a0513          	mv	a0,s4
80411f74:	009585b3          	add	a1,a1,s1
80411f78:	391000ef          	jal	ra,80412b08 <memcpy>
80411f7c:	fc1ff06f          	j	80411f3c <sfs_rbuf+0x68>
80411f80:	00004697          	auipc	a3,0x4
80411f84:	36868693          	addi	a3,a3,872 # 804162e8 <sfs_node_fileops+0xd0>
80411f88:	00001617          	auipc	a2,0x1
80411f8c:	f4060613          	addi	a2,a2,-192 # 80412ec8 <commands+0x1bc>
80411f90:	05500593          	li	a1,85
80411f94:	00004517          	auipc	a0,0x4
80411f98:	3cc50513          	addi	a0,a0,972 # 80416360 <sfs_node_fileops+0x148>
80411f9c:	e88ee0ef          	jal	ra,80400624 <__panic>

80411fa0 <sfs_wbuf>:
80411fa0:	fd010113          	addi	sp,sp,-48
80411fa4:	02112623          	sw	ra,44(sp)
80411fa8:	02812423          	sw	s0,40(sp)
80411fac:	02912223          	sw	s1,36(sp)
80411fb0:	03212023          	sw	s2,32(sp)
80411fb4:	01312e23          	sw	s3,28(sp)
80411fb8:	01412c23          	sw	s4,24(sp)
80411fbc:	01512a23          	sw	s5,20(sp)
80411fc0:	01612823          	sw	s6,16(sp)
80411fc4:	01712623          	sw	s7,12(sp)
80411fc8:	000017b7          	lui	a5,0x1
80411fcc:	0cf77063          	bgeu	a4,a5,8041208c <sfs_wbuf+0xec>
80411fd0:	00070493          	mv	s1,a4
80411fd4:	00c70733          	add	a4,a4,a2
80411fd8:	00060a13          	mv	s4,a2
80411fdc:	0ae7e863          	bltu	a5,a4,8041208c <sfs_wbuf+0xec>
80411fe0:	00050413          	mv	s0,a0
80411fe4:	00058b93          	mv	s7,a1
80411fe8:	00068993          	mv	s3,a3
80411fec:	254000ef          	jal	ra,80412240 <lock_sfs_io>
80411ff0:	03842603          	lw	a2,56(s0)
80411ff4:	00440a93          	addi	s5,s0,4
80411ff8:	02c40b13          	addi	s6,s0,44
80411ffc:	00100793          	li	a5,1
80412000:	00000713          	li	a4,0
80412004:	00098693          	mv	a3,s3
80412008:	000b0593          	mv	a1,s6
8041200c:	000a8513          	mv	a0,s5
80412010:	d5dff0ef          	jal	ra,80411d6c <sfs_rwblock_nolock.isra.0>
80412014:	00050913          	mv	s2,a0
80412018:	02050e63          	beqz	a0,80412054 <sfs_wbuf+0xb4>
8041201c:	00040513          	mv	a0,s0
80412020:	230000ef          	jal	ra,80412250 <unlock_sfs_io>
80412024:	02c12083          	lw	ra,44(sp)
80412028:	02812403          	lw	s0,40(sp)
8041202c:	00090513          	mv	a0,s2
80412030:	02412483          	lw	s1,36(sp)
80412034:	02012903          	lw	s2,32(sp)
80412038:	01c12983          	lw	s3,28(sp)
8041203c:	01812a03          	lw	s4,24(sp)
80412040:	01412a83          	lw	s5,20(sp)
80412044:	01012b03          	lw	s6,16(sp)
80412048:	00c12b83          	lw	s7,12(sp)
8041204c:	03010113          	addi	sp,sp,48
80412050:	00008067          	ret
80412054:	03842503          	lw	a0,56(s0)
80412058:	000a0613          	mv	a2,s4
8041205c:	000b8593          	mv	a1,s7
80412060:	00950533          	add	a0,a0,s1
80412064:	2a5000ef          	jal	ra,80412b08 <memcpy>
80412068:	03842603          	lw	a2,56(s0)
8041206c:	00100793          	li	a5,1
80412070:	00100713          	li	a4,1
80412074:	00098693          	mv	a3,s3
80412078:	000b0593          	mv	a1,s6
8041207c:	000a8513          	mv	a0,s5
80412080:	cedff0ef          	jal	ra,80411d6c <sfs_rwblock_nolock.isra.0>
80412084:	00050913          	mv	s2,a0
80412088:	f95ff06f          	j	8041201c <sfs_wbuf+0x7c>
8041208c:	00004697          	auipc	a3,0x4
80412090:	25c68693          	addi	a3,a3,604 # 804162e8 <sfs_node_fileops+0xd0>
80412094:	00001617          	auipc	a2,0x1
80412098:	e3460613          	addi	a2,a2,-460 # 80412ec8 <commands+0x1bc>
8041209c:	06b00593          	li	a1,107
804120a0:	00004517          	auipc	a0,0x4
804120a4:	2c050513          	addi	a0,a0,704 # 80416360 <sfs_node_fileops+0x148>
804120a8:	d7cee0ef          	jal	ra,80400624 <__panic>

804120ac <sfs_sync_super>:
804120ac:	ff010113          	addi	sp,sp,-16
804120b0:	00112623          	sw	ra,12(sp)
804120b4:	00812423          	sw	s0,8(sp)
804120b8:	00912223          	sw	s1,4(sp)
804120bc:	00050413          	mv	s0,a0
804120c0:	180000ef          	jal	ra,80412240 <lock_sfs_io>
804120c4:	03842503          	lw	a0,56(s0)
804120c8:	00001637          	lui	a2,0x1
804120cc:	00000593          	li	a1,0
804120d0:	1c9000ef          	jal	ra,80412a98 <memset>
804120d4:	03842503          	lw	a0,56(s0)
804120d8:	00040593          	mv	a1,s0
804120dc:	02c00613          	li	a2,44
804120e0:	229000ef          	jal	ra,80412b08 <memcpy>
804120e4:	03842603          	lw	a2,56(s0)
804120e8:	02c40593          	addi	a1,s0,44
804120ec:	00000793          	li	a5,0
804120f0:	00100713          	li	a4,1
804120f4:	00000693          	li	a3,0
804120f8:	00440513          	addi	a0,s0,4
804120fc:	c71ff0ef          	jal	ra,80411d6c <sfs_rwblock_nolock.isra.0>
80412100:	00050493          	mv	s1,a0
80412104:	00040513          	mv	a0,s0
80412108:	148000ef          	jal	ra,80412250 <unlock_sfs_io>
8041210c:	00c12083          	lw	ra,12(sp)
80412110:	00812403          	lw	s0,8(sp)
80412114:	00048513          	mv	a0,s1
80412118:	00412483          	lw	s1,4(sp)
8041211c:	01010113          	addi	sp,sp,16
80412120:	00008067          	ret

80412124 <sfs_sync_freemap>:
80412124:	ff010113          	addi	sp,sp,-16
80412128:	00812423          	sw	s0,8(sp)
8041212c:	00452403          	lw	s0,4(a0)
80412130:	00912223          	sw	s1,4(sp)
80412134:	000086b7          	lui	a3,0x8
80412138:	00050493          	mv	s1,a0
8041213c:	03052503          	lw	a0,48(a0)
80412140:	fff68693          	addi	a3,a3,-1 # 7fff <_binary_bin_swap_img_size-0x1>
80412144:	00d40433          	add	s0,s0,a3
80412148:	00000593          	li	a1,0
8041214c:	00112623          	sw	ra,12(sp)
80412150:	00f45413          	srli	s0,s0,0xf
80412154:	f2cfd0ef          	jal	ra,8040f880 <bitmap_getdata>
80412158:	00040693          	mv	a3,s0
8041215c:	00812403          	lw	s0,8(sp)
80412160:	00c12083          	lw	ra,12(sp)
80412164:	00050593          	mv	a1,a0
80412168:	00048513          	mv	a0,s1
8041216c:	00412483          	lw	s1,4(sp)
80412170:	00100713          	li	a4,1
80412174:	00200613          	li	a2,2
80412178:	01010113          	addi	sp,sp,16
8041217c:	c79ff06f          	j	80411df4 <sfs_rwblock>

80412180 <sfs_clear_block>:
80412180:	fe010113          	addi	sp,sp,-32
80412184:	00112e23          	sw	ra,28(sp)
80412188:	00812c23          	sw	s0,24(sp)
8041218c:	00912a23          	sw	s1,20(sp)
80412190:	00058413          	mv	s0,a1
80412194:	00060493          	mv	s1,a2
80412198:	01212823          	sw	s2,16(sp)
8041219c:	01312623          	sw	s3,12(sp)
804121a0:	00050913          	mv	s2,a0
804121a4:	01412423          	sw	s4,8(sp)
804121a8:	01512223          	sw	s5,4(sp)
804121ac:	094000ef          	jal	ra,80412240 <lock_sfs_io>
804121b0:	03892503          	lw	a0,56(s2)
804121b4:	00001637          	lui	a2,0x1
804121b8:	00000593          	li	a1,0
804121bc:	0dd000ef          	jal	ra,80412a98 <memset>
804121c0:	00940ab3          	add	s5,s0,s1
804121c4:	00490a13          	addi	s4,s2,4
804121c8:	02c90993          	addi	s3,s2,44
804121cc:	00049663          	bnez	s1,804121d8 <sfs_clear_block+0x58>
804121d0:	0600006f          	j	80412230 <sfs_clear_block+0xb0>
804121d4:	05540e63          	beq	s0,s5,80412230 <sfs_clear_block+0xb0>
804121d8:	03892603          	lw	a2,56(s2)
804121dc:	00040693          	mv	a3,s0
804121e0:	00100793          	li	a5,1
804121e4:	00100713          	li	a4,1
804121e8:	00098593          	mv	a1,s3
804121ec:	000a0513          	mv	a0,s4
804121f0:	b7dff0ef          	jal	ra,80411d6c <sfs_rwblock_nolock.isra.0>
804121f4:	00050493          	mv	s1,a0
804121f8:	00140413          	addi	s0,s0,1
804121fc:	fc050ce3          	beqz	a0,804121d4 <sfs_clear_block+0x54>
80412200:	00090513          	mv	a0,s2
80412204:	04c000ef          	jal	ra,80412250 <unlock_sfs_io>
80412208:	01c12083          	lw	ra,28(sp)
8041220c:	01812403          	lw	s0,24(sp)
80412210:	00048513          	mv	a0,s1
80412214:	01012903          	lw	s2,16(sp)
80412218:	01412483          	lw	s1,20(sp)
8041221c:	00c12983          	lw	s3,12(sp)
80412220:	00812a03          	lw	s4,8(sp)
80412224:	00412a83          	lw	s5,4(sp)
80412228:	02010113          	addi	sp,sp,32
8041222c:	00008067          	ret
80412230:	00000493          	li	s1,0
80412234:	fcdff06f          	j	80412200 <sfs_clear_block+0x80>

80412238 <lock_sfs_fs>:
80412238:	03c50513          	addi	a0,a0,60
8041223c:	f9df206f          	j	804051d8 <down>

80412240 <lock_sfs_io>:
80412240:	04850513          	addi	a0,a0,72
80412244:	f95f206f          	j	804051d8 <down>

80412248 <unlock_sfs_fs>:
80412248:	03c50513          	addi	a0,a0,60
8041224c:	f89f206f          	j	804051d4 <up>

80412250 <unlock_sfs_io>:
80412250:	04850513          	addi	a0,a0,72
80412254:	f81f206f          	j	804051d4 <up>

80412258 <hash32>:
80412258:	00351793          	slli	a5,a0,0x3
8041225c:	40a787b3          	sub	a5,a5,a0
80412260:	00679793          	slli	a5,a5,0x6
80412264:	40a78733          	sub	a4,a5,a0
80412268:	00371793          	slli	a5,a4,0x3
8041226c:	40e787b3          	sub	a5,a5,a4
80412270:	00379793          	slli	a5,a5,0x3
80412274:	00a787b3          	add	a5,a5,a0
80412278:	01079793          	slli	a5,a5,0x10
8041227c:	40f50533          	sub	a0,a0,a5
80412280:	02000793          	li	a5,32
80412284:	40b785b3          	sub	a1,a5,a1
80412288:	00b55533          	srl	a0,a0,a1
8041228c:	00008067          	ret

80412290 <printnum>:
80412290:	fd010113          	addi	sp,sp,-48
80412294:	02912223          	sw	s1,36(sp)
80412298:	01312e23          	sw	s3,28(sp)
8041229c:	00050493          	mv	s1,a0
804122a0:	00058993          	mv	s3,a1
804122a4:	00068513          	mv	a0,a3
804122a8:	00078593          	mv	a1,a5
804122ac:	02812423          	sw	s0,40(sp)
804122b0:	03212023          	sw	s2,32(sp)
804122b4:	01412c23          	sw	s4,24(sp)
804122b8:	01512a23          	sw	s5,20(sp)
804122bc:	01612823          	sw	s6,16(sp)
804122c0:	01712623          	sw	s7,12(sp)
804122c4:	01812423          	sw	s8,8(sp)
804122c8:	02112623          	sw	ra,44(sp)
804122cc:	00068b13          	mv	s6,a3
804122d0:	00078a93          	mv	s5,a5
804122d4:	00070c13          	mv	s8,a4
804122d8:	00060913          	mv	s2,a2
804122dc:	00088a13          	mv	s4,a7
804122e0:	fff80413          	addi	s0,a6,-1
804122e4:	0bd000ef          	jal	ra,80412ba0 <__umodsi3>
804122e8:	00050b93          	mv	s7,a0
804122ec:	060c1863          	bnez	s8,8041235c <printnum+0xcc>
804122f0:	075b7663          	bgeu	s6,s5,8041235c <printnum+0xcc>
804122f4:	00805e63          	blez	s0,80412310 <printnum+0x80>
804122f8:	fff40413          	addi	s0,s0,-1
804122fc:	00098613          	mv	a2,s3
80412300:	00090593          	mv	a1,s2
80412304:	000a0513          	mv	a0,s4
80412308:	000480e7          	jalr	s1
8041230c:	fe0416e3          	bnez	s0,804122f8 <printnum+0x68>
80412310:	00004517          	auipc	a0,0x4
80412314:	22450513          	addi	a0,a0,548 # 80416534 <error_string+0x64>
80412318:	01750533          	add	a0,a0,s7
8041231c:	02812403          	lw	s0,40(sp)
80412320:	02c12083          	lw	ra,44(sp)
80412324:	01812a03          	lw	s4,24(sp)
80412328:	01412a83          	lw	s5,20(sp)
8041232c:	01012b03          	lw	s6,16(sp)
80412330:	00c12b83          	lw	s7,12(sp)
80412334:	00812c03          	lw	s8,8(sp)
80412338:	00054503          	lbu	a0,0(a0)
8041233c:	00098613          	mv	a2,s3
80412340:	00090593          	mv	a1,s2
80412344:	01c12983          	lw	s3,28(sp)
80412348:	02012903          	lw	s2,32(sp)
8041234c:	00048313          	mv	t1,s1
80412350:	02412483          	lw	s1,36(sp)
80412354:	03010113          	addi	sp,sp,48
80412358:	00030067          	jr	t1
8041235c:	000a8593          	mv	a1,s5
80412360:	000b0513          	mv	a0,s6
80412364:	7f4000ef          	jal	ra,80412b58 <__udivsi3>
80412368:	00050693          	mv	a3,a0
8041236c:	000a0893          	mv	a7,s4
80412370:	00040813          	mv	a6,s0
80412374:	000a8793          	mv	a5,s5
80412378:	00000713          	li	a4,0
8041237c:	00090613          	mv	a2,s2
80412380:	00098593          	mv	a1,s3
80412384:	00048513          	mv	a0,s1
80412388:	f09ff0ef          	jal	ra,80412290 <printnum>
8041238c:	f85ff06f          	j	80412310 <printnum+0x80>

80412390 <sprintputch>:
80412390:	0085a783          	lw	a5,8(a1)
80412394:	0005a703          	lw	a4,0(a1)
80412398:	0045a683          	lw	a3,4(a1)
8041239c:	00178793          	addi	a5,a5,1 # 1001 <_binary_bin_swap_img_size-0x6fff>
804123a0:	00f5a423          	sw	a5,8(a1)
804123a4:	00d77863          	bgeu	a4,a3,804123b4 <sprintputch+0x24>
804123a8:	00170793          	addi	a5,a4,1
804123ac:	00f5a023          	sw	a5,0(a1)
804123b0:	00a70023          	sb	a0,0(a4)
804123b4:	00008067          	ret

804123b8 <vprintfmt>:
804123b8:	fb010113          	addi	sp,sp,-80
804123bc:	04912223          	sw	s1,68(sp)
804123c0:	05212023          	sw	s2,64(sp)
804123c4:	03312e23          	sw	s3,60(sp)
804123c8:	03512a23          	sw	s5,52(sp)
804123cc:	03612823          	sw	s6,48(sp)
804123d0:	03712623          	sw	s7,44(sp)
804123d4:	03812423          	sw	s8,40(sp)
804123d8:	01b12e23          	sw	s11,28(sp)
804123dc:	04112623          	sw	ra,76(sp)
804123e0:	04812423          	sw	s0,72(sp)
804123e4:	03412c23          	sw	s4,56(sp)
804123e8:	03912223          	sw	s9,36(sp)
804123ec:	03a12023          	sw	s10,32(sp)
804123f0:	00050993          	mv	s3,a0
804123f4:	00058913          	mv	s2,a1
804123f8:	00060493          	mv	s1,a2
804123fc:	00068d93          	mv	s11,a3
80412400:	00070b13          	mv	s6,a4
80412404:	00004a97          	auipc	s5,0x4
80412408:	f74a8a93          	addi	s5,s5,-140 # 80416378 <sfs_node_fileops+0x160>
8041240c:	fff00b93          	li	s7,-1
80412410:	05e00c13          	li	s8,94
80412414:	000dc503          	lbu	a0,0(s11)
80412418:	02500793          	li	a5,37
8041241c:	001d8413          	addi	s0,s11,1
80412420:	02f50663          	beq	a0,a5,8041244c <vprintfmt+0x94>
80412424:	06050663          	beqz	a0,80412490 <vprintfmt+0xd8>
80412428:	02500a13          	li	s4,37
8041242c:	0080006f          	j	80412434 <vprintfmt+0x7c>
80412430:	06050063          	beqz	a0,80412490 <vprintfmt+0xd8>
80412434:	00090613          	mv	a2,s2
80412438:	00048593          	mv	a1,s1
8041243c:	00140413          	addi	s0,s0,1
80412440:	000980e7          	jalr	s3
80412444:	fff44503          	lbu	a0,-1(s0)
80412448:	ff4514e3          	bne	a0,s4,80412430 <vprintfmt+0x78>
8041244c:	00044503          	lbu	a0,0(s0)
80412450:	02000893          	li	a7,32
80412454:	00000a13          	li	s4,0
80412458:	00000593          	li	a1,0
8041245c:	fff00c93          	li	s9,-1
80412460:	fff00d13          	li	s10,-1
80412464:	05500693          	li	a3,85
80412468:	00900613          	li	a2,9
8041246c:	fdd50793          	addi	a5,a0,-35
80412470:	0ff7f793          	andi	a5,a5,255
80412474:	00140d93          	addi	s11,s0,1
80412478:	2ef6e663          	bltu	a3,a5,80412764 <vprintfmt+0x3ac>
8041247c:	00279793          	slli	a5,a5,0x2
80412480:	015787b3          	add	a5,a5,s5
80412484:	0007a783          	lw	a5,0(a5)
80412488:	015787b3          	add	a5,a5,s5
8041248c:	00078067          	jr	a5
80412490:	04c12083          	lw	ra,76(sp)
80412494:	04812403          	lw	s0,72(sp)
80412498:	04412483          	lw	s1,68(sp)
8041249c:	04012903          	lw	s2,64(sp)
804124a0:	03c12983          	lw	s3,60(sp)
804124a4:	03812a03          	lw	s4,56(sp)
804124a8:	03412a83          	lw	s5,52(sp)
804124ac:	03012b03          	lw	s6,48(sp)
804124b0:	02c12b83          	lw	s7,44(sp)
804124b4:	02812c03          	lw	s8,40(sp)
804124b8:	02412c83          	lw	s9,36(sp)
804124bc:	02012d03          	lw	s10,32(sp)
804124c0:	01c12d83          	lw	s11,28(sp)
804124c4:	05010113          	addi	sp,sp,80
804124c8:	00008067          	ret
804124cc:	00050893          	mv	a7,a0
804124d0:	00144503          	lbu	a0,1(s0)
804124d4:	000d8413          	mv	s0,s11
804124d8:	f95ff06f          	j	8041246c <vprintfmt+0xb4>
804124dc:	000b2c83          	lw	s9,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
804124e0:	00144503          	lbu	a0,1(s0)
804124e4:	004b0b13          	addi	s6,s6,4
804124e8:	000d8413          	mv	s0,s11
804124ec:	f80d50e3          	bgez	s10,8041246c <vprintfmt+0xb4>
804124f0:	000c8d13          	mv	s10,s9
804124f4:	fff00c93          	li	s9,-1
804124f8:	f75ff06f          	j	8041246c <vprintfmt+0xb4>
804124fc:	fffd4793          	not	a5,s10
80412500:	41f7d793          	srai	a5,a5,0x1f
80412504:	00144503          	lbu	a0,1(s0)
80412508:	00fd7d33          	and	s10,s10,a5
8041250c:	000d8413          	mv	s0,s11
80412510:	f5dff06f          	j	8041246c <vprintfmt+0xb4>
80412514:	00100793          	li	a5,1
80412518:	32b7c463          	blt	a5,a1,80412840 <vprintfmt+0x488>
8041251c:	000b2683          	lw	a3,0(s6)
80412520:	00000713          	li	a4,0
80412524:	004b0b13          	addi	s6,s6,4
80412528:	01000793          	li	a5,16
8041252c:	000d0813          	mv	a6,s10
80412530:	00048613          	mv	a2,s1
80412534:	00090593          	mv	a1,s2
80412538:	00098513          	mv	a0,s3
8041253c:	d55ff0ef          	jal	ra,80412290 <printnum>
80412540:	ed5ff06f          	j	80412414 <vprintfmt+0x5c>
80412544:	00144303          	lbu	t1,1(s0)
80412548:	fd050c93          	addi	s9,a0,-48
8041254c:	000d8413          	mv	s0,s11
80412550:	fd030793          	addi	a5,t1,-48
80412554:	00030513          	mv	a0,t1
80412558:	f8f66ae3          	bltu	a2,a5,804124ec <vprintfmt+0x134>
8041255c:	002c9793          	slli	a5,s9,0x2
80412560:	01978733          	add	a4,a5,s9
80412564:	00140413          	addi	s0,s0,1
80412568:	00171713          	slli	a4,a4,0x1
8041256c:	00670733          	add	a4,a4,t1
80412570:	00044303          	lbu	t1,0(s0)
80412574:	fd070c93          	addi	s9,a4,-48
80412578:	fd030793          	addi	a5,t1,-48
8041257c:	00030513          	mv	a0,t1
80412580:	fcf67ee3          	bgeu	a2,a5,8041255c <vprintfmt+0x1a4>
80412584:	f69ff06f          	j	804124ec <vprintfmt+0x134>
80412588:	000b2503          	lw	a0,0(s6)
8041258c:	00090613          	mv	a2,s2
80412590:	00048593          	mv	a1,s1
80412594:	004b0b13          	addi	s6,s6,4
80412598:	000980e7          	jalr	s3
8041259c:	e79ff06f          	j	80412414 <vprintfmt+0x5c>
804125a0:	00100793          	li	a5,1
804125a4:	28b7c263          	blt	a5,a1,80412828 <vprintfmt+0x470>
804125a8:	000b2a03          	lw	s4,0(s6)
804125ac:	004b0793          	addi	a5,s6,4
804125b0:	00078b13          	mv	s6,a5
804125b4:	41fa5413          	srai	s0,s4,0x1f
804125b8:	2c044063          	bltz	s0,80412878 <vprintfmt+0x4c0>
804125bc:	000a0693          	mv	a3,s4
804125c0:	00040713          	mv	a4,s0
804125c4:	00a00793          	li	a5,10
804125c8:	f65ff06f          	j	8041252c <vprintfmt+0x174>
804125cc:	000b2703          	lw	a4,0(s6)
804125d0:	01800693          	li	a3,24
804125d4:	004b0b13          	addi	s6,s6,4
804125d8:	41f75793          	srai	a5,a4,0x1f
804125dc:	00e7c733          	xor	a4,a5,a4
804125e0:	40f70733          	sub	a4,a4,a5
804125e4:	1ae6ca63          	blt	a3,a4,80412798 <vprintfmt+0x3e0>
804125e8:	00271793          	slli	a5,a4,0x2
804125ec:	00004697          	auipc	a3,0x4
804125f0:	ee468693          	addi	a3,a3,-284 # 804164d0 <error_string>
804125f4:	00f687b3          	add	a5,a3,a5
804125f8:	0007a783          	lw	a5,0(a5)
804125fc:	18078e63          	beqz	a5,80412798 <vprintfmt+0x3e0>
80412600:	00078713          	mv	a4,a5
80412604:	00000697          	auipc	a3,0x0
80412608:	62468693          	addi	a3,a3,1572 # 80412c28 <etext+0x24>
8041260c:	00048613          	mv	a2,s1
80412610:	00090593          	mv	a1,s2
80412614:	00098513          	mv	a0,s3
80412618:	2cc000ef          	jal	ra,804128e4 <printfmt>
8041261c:	df9ff06f          	j	80412414 <vprintfmt+0x5c>
80412620:	000b2783          	lw	a5,0(s6)
80412624:	004b0b13          	addi	s6,s6,4
80412628:	28078e63          	beqz	a5,804128c4 <vprintfmt+0x50c>
8041262c:	00178413          	addi	s0,a5,1
80412630:	1fa05063          	blez	s10,80412810 <vprintfmt+0x458>
80412634:	02d00693          	li	a3,45
80412638:	18d89663          	bne	a7,a3,804127c4 <vprintfmt+0x40c>
8041263c:	0007c783          	lbu	a5,0(a5)
80412640:	00078513          	mv	a0,a5
80412644:	04078263          	beqz	a5,80412688 <vprintfmt+0x2d0>
80412648:	000cc663          	bltz	s9,80412654 <vprintfmt+0x29c>
8041264c:	fffc8c93          	addi	s9,s9,-1
80412650:	037c8a63          	beq	s9,s7,80412684 <vprintfmt+0x2cc>
80412654:	00090613          	mv	a2,s2
80412658:	00048593          	mv	a1,s1
8041265c:	1c0a0263          	beqz	s4,80412820 <vprintfmt+0x468>
80412660:	fe078793          	addi	a5,a5,-32
80412664:	1afc7e63          	bgeu	s8,a5,80412820 <vprintfmt+0x468>
80412668:	03f00513          	li	a0,63
8041266c:	000980e7          	jalr	s3
80412670:	00140413          	addi	s0,s0,1
80412674:	fff44783          	lbu	a5,-1(s0)
80412678:	fffd0d13          	addi	s10,s10,-1
8041267c:	00078513          	mv	a0,a5
80412680:	fc0794e3          	bnez	a5,80412648 <vprintfmt+0x290>
80412684:	d9a058e3          	blez	s10,80412414 <vprintfmt+0x5c>
80412688:	fffd0d13          	addi	s10,s10,-1
8041268c:	00090613          	mv	a2,s2
80412690:	00048593          	mv	a1,s1
80412694:	02000513          	li	a0,32
80412698:	000980e7          	jalr	s3
8041269c:	d60d0ce3          	beqz	s10,80412414 <vprintfmt+0x5c>
804126a0:	fffd0d13          	addi	s10,s10,-1
804126a4:	00090613          	mv	a2,s2
804126a8:	00048593          	mv	a1,s1
804126ac:	02000513          	li	a0,32
804126b0:	000980e7          	jalr	s3
804126b4:	fc0d1ae3          	bnez	s10,80412688 <vprintfmt+0x2d0>
804126b8:	d5dff06f          	j	80412414 <vprintfmt+0x5c>
804126bc:	00100793          	li	a5,1
804126c0:	18b7ce63          	blt	a5,a1,8041285c <vprintfmt+0x4a4>
804126c4:	000b2683          	lw	a3,0(s6)
804126c8:	00000713          	li	a4,0
804126cc:	004b0b13          	addi	s6,s6,4
804126d0:	00800793          	li	a5,8
804126d4:	e59ff06f          	j	8041252c <vprintfmt+0x174>
804126d8:	03000513          	li	a0,48
804126dc:	00090613          	mv	a2,s2
804126e0:	00048593          	mv	a1,s1
804126e4:	01112423          	sw	a7,8(sp)
804126e8:	000980e7          	jalr	s3
804126ec:	00090613          	mv	a2,s2
804126f0:	00048593          	mv	a1,s1
804126f4:	07800513          	li	a0,120
804126f8:	000980e7          	jalr	s3
804126fc:	004b0b13          	addi	s6,s6,4
80412700:	ffcb2683          	lw	a3,-4(s6)
80412704:	00000713          	li	a4,0
80412708:	01000793          	li	a5,16
8041270c:	00812883          	lw	a7,8(sp)
80412710:	e1dff06f          	j	8041252c <vprintfmt+0x174>
80412714:	00144503          	lbu	a0,1(s0)
80412718:	00158593          	addi	a1,a1,1
8041271c:	000d8413          	mv	s0,s11
80412720:	d4dff06f          	j	8041246c <vprintfmt+0xb4>
80412724:	00144503          	lbu	a0,1(s0)
80412728:	00100a13          	li	s4,1
8041272c:	000d8413          	mv	s0,s11
80412730:	d3dff06f          	j	8041246c <vprintfmt+0xb4>
80412734:	00090613          	mv	a2,s2
80412738:	00048593          	mv	a1,s1
8041273c:	02500513          	li	a0,37
80412740:	000980e7          	jalr	s3
80412744:	cd1ff06f          	j	80412414 <vprintfmt+0x5c>
80412748:	00100793          	li	a5,1
8041274c:	14b7ce63          	blt	a5,a1,804128a8 <vprintfmt+0x4f0>
80412750:	000b2683          	lw	a3,0(s6)
80412754:	00000713          	li	a4,0
80412758:	004b0b13          	addi	s6,s6,4
8041275c:	00a00793          	li	a5,10
80412760:	dcdff06f          	j	8041252c <vprintfmt+0x174>
80412764:	00090613          	mv	a2,s2
80412768:	00048593          	mv	a1,s1
8041276c:	02500513          	li	a0,37
80412770:	000980e7          	jalr	s3
80412774:	fff44703          	lbu	a4,-1(s0)
80412778:	02500793          	li	a5,37
8041277c:	00040d93          	mv	s11,s0
80412780:	c8f70ae3          	beq	a4,a5,80412414 <vprintfmt+0x5c>
80412784:	02500713          	li	a4,37
80412788:	fffd8d93          	addi	s11,s11,-1
8041278c:	fffdc783          	lbu	a5,-1(s11)
80412790:	fee79ce3          	bne	a5,a4,80412788 <vprintfmt+0x3d0>
80412794:	c81ff06f          	j	80412414 <vprintfmt+0x5c>
80412798:	00004697          	auipc	a3,0x4
8041279c:	f6468693          	addi	a3,a3,-156 # 804166fc <error_string+0x22c>
804127a0:	00048613          	mv	a2,s1
804127a4:	00090593          	mv	a1,s2
804127a8:	00098513          	mv	a0,s3
804127ac:	138000ef          	jal	ra,804128e4 <printfmt>
804127b0:	c65ff06f          	j	80412414 <vprintfmt+0x5c>
804127b4:	00004797          	auipc	a5,0x4
804127b8:	f4078793          	addi	a5,a5,-192 # 804166f4 <error_string+0x224>
804127bc:	00004417          	auipc	s0,0x4
804127c0:	f3940413          	addi	s0,s0,-199 # 804166f5 <error_string+0x225>
804127c4:	00078513          	mv	a0,a5
804127c8:	000c8593          	mv	a1,s9
804127cc:	01112623          	sw	a7,12(sp)
804127d0:	00f12423          	sw	a5,8(sp)
804127d4:	210000ef          	jal	ra,804129e4 <strnlen>
804127d8:	40ad0d33          	sub	s10,s10,a0
804127dc:	00812783          	lw	a5,8(sp)
804127e0:	00c12883          	lw	a7,12(sp)
804127e4:	03a05663          	blez	s10,80412810 <vprintfmt+0x458>
804127e8:	00088513          	mv	a0,a7
804127ec:	00090613          	mv	a2,s2
804127f0:	00048593          	mv	a1,s1
804127f4:	00f12623          	sw	a5,12(sp)
804127f8:	01112423          	sw	a7,8(sp)
804127fc:	fffd0d13          	addi	s10,s10,-1
80412800:	000980e7          	jalr	s3
80412804:	00812883          	lw	a7,8(sp)
80412808:	00c12783          	lw	a5,12(sp)
8041280c:	fc0d1ee3          	bnez	s10,804127e8 <vprintfmt+0x430>
80412810:	0007c783          	lbu	a5,0(a5)
80412814:	00078513          	mv	a0,a5
80412818:	e20798e3          	bnez	a5,80412648 <vprintfmt+0x290>
8041281c:	bf9ff06f          	j	80412414 <vprintfmt+0x5c>
80412820:	000980e7          	jalr	s3
80412824:	e4dff06f          	j	80412670 <vprintfmt+0x2b8>
80412828:	007b0793          	addi	a5,s6,7
8041282c:	ff87f793          	andi	a5,a5,-8
80412830:	00878b13          	addi	s6,a5,8
80412834:	0007aa03          	lw	s4,0(a5)
80412838:	0047a403          	lw	s0,4(a5)
8041283c:	d7dff06f          	j	804125b8 <vprintfmt+0x200>
80412840:	007b0793          	addi	a5,s6,7
80412844:	ff87f793          	andi	a5,a5,-8
80412848:	00878b13          	addi	s6,a5,8
8041284c:	0007a683          	lw	a3,0(a5)
80412850:	0047a703          	lw	a4,4(a5)
80412854:	01000793          	li	a5,16
80412858:	cd5ff06f          	j	8041252c <vprintfmt+0x174>
8041285c:	007b0793          	addi	a5,s6,7
80412860:	ff87f793          	andi	a5,a5,-8
80412864:	00878b13          	addi	s6,a5,8
80412868:	0007a683          	lw	a3,0(a5)
8041286c:	0047a703          	lw	a4,4(a5)
80412870:	00800793          	li	a5,8
80412874:	cb9ff06f          	j	8041252c <vprintfmt+0x174>
80412878:	00090613          	mv	a2,s2
8041287c:	00048593          	mv	a1,s1
80412880:	02d00513          	li	a0,45
80412884:	01112423          	sw	a7,8(sp)
80412888:	000980e7          	jalr	s3
8041288c:	414006b3          	neg	a3,s4
80412890:	00d037b3          	snez	a5,a3
80412894:	40800733          	neg	a4,s0
80412898:	40f70733          	sub	a4,a4,a5
8041289c:	00812883          	lw	a7,8(sp)
804128a0:	00a00793          	li	a5,10
804128a4:	c89ff06f          	j	8041252c <vprintfmt+0x174>
804128a8:	007b0793          	addi	a5,s6,7
804128ac:	ff87f793          	andi	a5,a5,-8
804128b0:	00878b13          	addi	s6,a5,8
804128b4:	0007a683          	lw	a3,0(a5)
804128b8:	0047a703          	lw	a4,4(a5)
804128bc:	00a00793          	li	a5,10
804128c0:	c6dff06f          	j	8041252c <vprintfmt+0x174>
804128c4:	01a05663          	blez	s10,804128d0 <vprintfmt+0x518>
804128c8:	02d00793          	li	a5,45
804128cc:	eef894e3          	bne	a7,a5,804127b4 <vprintfmt+0x3fc>
804128d0:	00004417          	auipc	s0,0x4
804128d4:	e2540413          	addi	s0,s0,-475 # 804166f5 <error_string+0x225>
804128d8:	02800513          	li	a0,40
804128dc:	02800793          	li	a5,40
804128e0:	d69ff06f          	j	80412648 <vprintfmt+0x290>

804128e4 <printfmt>:
804128e4:	fd010113          	addi	sp,sp,-48
804128e8:	02010313          	addi	t1,sp,32
804128ec:	02e12023          	sw	a4,32(sp)
804128f0:	00030713          	mv	a4,t1
804128f4:	00112e23          	sw	ra,28(sp)
804128f8:	02f12223          	sw	a5,36(sp)
804128fc:	03012423          	sw	a6,40(sp)
80412900:	03112623          	sw	a7,44(sp)
80412904:	00612623          	sw	t1,12(sp)
80412908:	ab1ff0ef          	jal	ra,804123b8 <vprintfmt>
8041290c:	01c12083          	lw	ra,28(sp)
80412910:	03010113          	addi	sp,sp,48
80412914:	00008067          	ret

80412918 <vsnprintf>:
80412918:	fff58593          	addi	a1,a1,-1
8041291c:	fe010113          	addi	sp,sp,-32
80412920:	00b505b3          	add	a1,a0,a1
80412924:	00112e23          	sw	ra,28(sp)
80412928:	00a12223          	sw	a0,4(sp)
8041292c:	00b12423          	sw	a1,8(sp)
80412930:	00012623          	sw	zero,12(sp)
80412934:	04050063          	beqz	a0,80412974 <vsnprintf+0x5c>
80412938:	02a5ee63          	bltu	a1,a0,80412974 <vsnprintf+0x5c>
8041293c:	ffff75b7          	lui	a1,0xffff7
80412940:	00068713          	mv	a4,a3
80412944:	00000517          	auipc	a0,0x0
80412948:	a4c50513          	addi	a0,a0,-1460 # 80412390 <sprintputch>
8041294c:	00060693          	mv	a3,a2
80412950:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a21d>
80412954:	00410613          	addi	a2,sp,4
80412958:	a61ff0ef          	jal	ra,804123b8 <vprintfmt>
8041295c:	00412783          	lw	a5,4(sp)
80412960:	00078023          	sb	zero,0(a5)
80412964:	00c12503          	lw	a0,12(sp)
80412968:	01c12083          	lw	ra,28(sp)
8041296c:	02010113          	addi	sp,sp,32
80412970:	00008067          	ret
80412974:	ffd00513          	li	a0,-3
80412978:	ff1ff06f          	j	80412968 <vsnprintf+0x50>

8041297c <snprintf>:
8041297c:	fc010113          	addi	sp,sp,-64
80412980:	02c10313          	addi	t1,sp,44
80412984:	02d12623          	sw	a3,44(sp)
80412988:	00030693          	mv	a3,t1
8041298c:	00112e23          	sw	ra,28(sp)
80412990:	02e12823          	sw	a4,48(sp)
80412994:	02f12a23          	sw	a5,52(sp)
80412998:	03012c23          	sw	a6,56(sp)
8041299c:	03112e23          	sw	a7,60(sp)
804129a0:	00612623          	sw	t1,12(sp)
804129a4:	f75ff0ef          	jal	ra,80412918 <vsnprintf>
804129a8:	01c12083          	lw	ra,28(sp)
804129ac:	04010113          	addi	sp,sp,64
804129b0:	00008067          	ret

804129b4 <strlen>:
804129b4:	00054783          	lbu	a5,0(a0)
804129b8:	02078063          	beqz	a5,804129d8 <strlen+0x24>
804129bc:	00000793          	li	a5,0
804129c0:	00178793          	addi	a5,a5,1
804129c4:	00f50733          	add	a4,a0,a5
804129c8:	00074703          	lbu	a4,0(a4)
804129cc:	fe071ae3          	bnez	a4,804129c0 <strlen+0xc>
804129d0:	00078513          	mv	a0,a5
804129d4:	00008067          	ret
804129d8:	00000793          	li	a5,0
804129dc:	00078513          	mv	a0,a5
804129e0:	00008067          	ret

804129e4 <strnlen>:
804129e4:	02058863          	beqz	a1,80412a14 <strnlen+0x30>
804129e8:	00054783          	lbu	a5,0(a0)
804129ec:	02078463          	beqz	a5,80412a14 <strnlen+0x30>
804129f0:	00000793          	li	a5,0
804129f4:	00c0006f          	j	80412a00 <strnlen+0x1c>
804129f8:	00074703          	lbu	a4,0(a4)
804129fc:	00070863          	beqz	a4,80412a0c <strnlen+0x28>
80412a00:	00178793          	addi	a5,a5,1
80412a04:	00f50733          	add	a4,a0,a5
80412a08:	fef598e3          	bne	a1,a5,804129f8 <strnlen+0x14>
80412a0c:	00078513          	mv	a0,a5
80412a10:	00008067          	ret
80412a14:	00000793          	li	a5,0
80412a18:	00078513          	mv	a0,a5
80412a1c:	00008067          	ret

80412a20 <strcpy>:
80412a20:	00050793          	mv	a5,a0
80412a24:	00158593          	addi	a1,a1,1
80412a28:	fff5c703          	lbu	a4,-1(a1)
80412a2c:	00178793          	addi	a5,a5,1
80412a30:	fee78fa3          	sb	a4,-1(a5)
80412a34:	fe0718e3          	bnez	a4,80412a24 <strcpy+0x4>
80412a38:	00008067          	ret

80412a3c <strcmp>:
80412a3c:	00054783          	lbu	a5,0(a0)
80412a40:	0005c703          	lbu	a4,0(a1)
80412a44:	00078e63          	beqz	a5,80412a60 <strcmp+0x24>
80412a48:	00e79e63          	bne	a5,a4,80412a64 <strcmp+0x28>
80412a4c:	00150513          	addi	a0,a0,1
80412a50:	00054783          	lbu	a5,0(a0)
80412a54:	00158593          	addi	a1,a1,1
80412a58:	0005c703          	lbu	a4,0(a1)
80412a5c:	fe0796e3          	bnez	a5,80412a48 <strcmp+0xc>
80412a60:	00000793          	li	a5,0
80412a64:	40e78533          	sub	a0,a5,a4
80412a68:	00008067          	ret

80412a6c <strchr>:
80412a6c:	00054783          	lbu	a5,0(a0)
80412a70:	00078e63          	beqz	a5,80412a8c <strchr+0x20>
80412a74:	00b79663          	bne	a5,a1,80412a80 <strchr+0x14>
80412a78:	01c0006f          	j	80412a94 <strchr+0x28>
80412a7c:	00b78a63          	beq	a5,a1,80412a90 <strchr+0x24>
80412a80:	00150513          	addi	a0,a0,1
80412a84:	00054783          	lbu	a5,0(a0)
80412a88:	fe079ae3          	bnez	a5,80412a7c <strchr+0x10>
80412a8c:	00000513          	li	a0,0
80412a90:	00008067          	ret
80412a94:	00008067          	ret

80412a98 <memset>:
80412a98:	00060c63          	beqz	a2,80412ab0 <memset+0x18>
80412a9c:	00c50633          	add	a2,a0,a2
80412aa0:	00050793          	mv	a5,a0
80412aa4:	00178793          	addi	a5,a5,1
80412aa8:	feb78fa3          	sb	a1,-1(a5)
80412aac:	fec79ce3          	bne	a5,a2,80412aa4 <memset+0xc>
80412ab0:	00008067          	ret

80412ab4 <memmove>:
80412ab4:	02a5f663          	bgeu	a1,a0,80412ae0 <memmove+0x2c>
80412ab8:	00c587b3          	add	a5,a1,a2
80412abc:	02f57263          	bgeu	a0,a5,80412ae0 <memmove+0x2c>
80412ac0:	00c50733          	add	a4,a0,a2
80412ac4:	02060e63          	beqz	a2,80412b00 <memmove+0x4c>
80412ac8:	fff78793          	addi	a5,a5,-1
80412acc:	0007c683          	lbu	a3,0(a5)
80412ad0:	fff70713          	addi	a4,a4,-1
80412ad4:	00d70023          	sb	a3,0(a4)
80412ad8:	fef598e3          	bne	a1,a5,80412ac8 <memmove+0x14>
80412adc:	00008067          	ret
80412ae0:	00c586b3          	add	a3,a1,a2
80412ae4:	00050793          	mv	a5,a0
80412ae8:	00060e63          	beqz	a2,80412b04 <memmove+0x50>
80412aec:	00158593          	addi	a1,a1,1
80412af0:	fff5c703          	lbu	a4,-1(a1)
80412af4:	00178793          	addi	a5,a5,1
80412af8:	fee78fa3          	sb	a4,-1(a5)
80412afc:	fed598e3          	bne	a1,a3,80412aec <memmove+0x38>
80412b00:	00008067          	ret
80412b04:	00008067          	ret

80412b08 <memcpy>:
80412b08:	02060063          	beqz	a2,80412b28 <memcpy+0x20>
80412b0c:	00c58633          	add	a2,a1,a2
80412b10:	00050793          	mv	a5,a0
80412b14:	00158593          	addi	a1,a1,1
80412b18:	fff5c703          	lbu	a4,-1(a1)
80412b1c:	00178793          	addi	a5,a5,1
80412b20:	fee78fa3          	sb	a4,-1(a5)
80412b24:	fec598e3          	bne	a1,a2,80412b14 <memcpy+0xc>
80412b28:	00008067          	ret

80412b2c <__mulsi3>:
80412b2c:	00050613          	mv	a2,a0
80412b30:	00000513          	li	a0,0
80412b34:	0015f693          	andi	a3,a1,1
80412b38:	00068463          	beqz	a3,80412b40 <__mulsi3+0x14>
80412b3c:	00c50533          	add	a0,a0,a2
80412b40:	0015d593          	srli	a1,a1,0x1
80412b44:	00161613          	slli	a2,a2,0x1
80412b48:	fe0596e3          	bnez	a1,80412b34 <__mulsi3+0x8>
80412b4c:	00008067          	ret

80412b50 <__divsi3>:
80412b50:	06054063          	bltz	a0,80412bb0 <__umodsi3+0x10>
80412b54:	0605c663          	bltz	a1,80412bc0 <__umodsi3+0x20>

80412b58 <__udivsi3>:
80412b58:	00058613          	mv	a2,a1
80412b5c:	00050593          	mv	a1,a0
80412b60:	fff00513          	li	a0,-1
80412b64:	02060c63          	beqz	a2,80412b9c <__udivsi3+0x44>
80412b68:	00100693          	li	a3,1
80412b6c:	00b67a63          	bgeu	a2,a1,80412b80 <__udivsi3+0x28>
80412b70:	00c05863          	blez	a2,80412b80 <__udivsi3+0x28>
80412b74:	00161613          	slli	a2,a2,0x1
80412b78:	00169693          	slli	a3,a3,0x1
80412b7c:	feb66ae3          	bltu	a2,a1,80412b70 <__udivsi3+0x18>
80412b80:	00000513          	li	a0,0
80412b84:	00c5e663          	bltu	a1,a2,80412b90 <__udivsi3+0x38>
80412b88:	40c585b3          	sub	a1,a1,a2
80412b8c:	00d56533          	or	a0,a0,a3
80412b90:	0016d693          	srli	a3,a3,0x1
80412b94:	00165613          	srli	a2,a2,0x1
80412b98:	fe0696e3          	bnez	a3,80412b84 <__udivsi3+0x2c>
80412b9c:	00008067          	ret

80412ba0 <__umodsi3>:
80412ba0:	00008293          	mv	t0,ra
80412ba4:	fb5ff0ef          	jal	ra,80412b58 <__udivsi3>
80412ba8:	00058513          	mv	a0,a1
80412bac:	00028067          	jr	t0
80412bb0:	40a00533          	neg	a0,a0
80412bb4:	0005d863          	bgez	a1,80412bc4 <__umodsi3+0x24>
80412bb8:	40b005b3          	neg	a1,a1
80412bbc:	f9dff06f          	j	80412b58 <__udivsi3>
80412bc0:	40b005b3          	neg	a1,a1
80412bc4:	00008293          	mv	t0,ra
80412bc8:	f91ff0ef          	jal	ra,80412b58 <__udivsi3>
80412bcc:	40a00533          	neg	a0,a0
80412bd0:	00028067          	jr	t0

80412bd4 <__modsi3>:
80412bd4:	00008293          	mv	t0,ra
80412bd8:	0005ca63          	bltz	a1,80412bec <__modsi3+0x18>
80412bdc:	00054c63          	bltz	a0,80412bf4 <__modsi3+0x20>
80412be0:	f79ff0ef          	jal	ra,80412b58 <__udivsi3>
80412be4:	00058513          	mv	a0,a1
80412be8:	00028067          	jr	t0
80412bec:	40b005b3          	neg	a1,a1
80412bf0:	fe0558e3          	bgez	a0,80412be0 <__modsi3+0xc>
80412bf4:	40a00533          	neg	a0,a0
80412bf8:	f61ff0ef          	jal	ra,80412b58 <__udivsi3>
80412bfc:	40b00533          	neg	a0,a1
80412c00:	00028067          	jr	t0
