
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
8040002c:	6e0120ef          	jal	ra,8041270c <memset>
80400030:	071000ef          	jal	ra,804008a0 <cons_init>
80400034:	00013597          	auipc	a1,0x13
80400038:	84458593          	addi	a1,a1,-1980 # 80412878 <etext>
8040003c:	00013517          	auipc	a0,0x13
80400040:	85850513          	addi	a0,a0,-1960 # 80412894 <etext+0x1c>
80400044:	1b8000ef          	jal	ra,804001fc <cprintf>
80400048:	294000ef          	jal	ra,804002dc <print_kerninfo>
8040004c:	279030ef          	jal	ra,80403ac4 <pmm_init>
80400050:	3d1000ef          	jal	ra,80400c20 <pic_init>
80400054:	5b5000ef          	jal	ra,80400e08 <idt_init>
80400058:	245040ef          	jal	ra,80404a9c <vmm_init>
8040005c:	0010c0ef          	jal	ra,8040c85c <sched_init>
80400060:	209080ef          	jal	ra,80408a68 <proc_init>
80400064:	15d000ef          	jal	ra,804009c0 <ide_init>
80400068:	595030ef          	jal	ra,80403dfc <swap_init>
8040006c:	19c060ef          	jal	ra,80406208 <fs_init>
80400070:	6e0000ef          	jal	ra,80400750 <clock_init>
80400074:	39d000ef          	jal	ra,80400c10 <intr_enable>
80400078:	3d5080ef          	jal	ra,80408c4c <cpu_idle>

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
804000ac:	00012517          	auipc	a0,0x12
804000b0:	7f050513          	addi	a0,a0,2032 # 8041289c <etext+0x24>
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
804001a0:	718000ef          	jal	ra,804008b8 <cons_putc>
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
804001e8:	645110ef          	jal	ra,8041202c <vprintfmt>
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
80400248:	5e5110ef          	jal	ra,8041202c <vprintfmt>
8040024c:	01c12083          	lw	ra,28(sp)
80400250:	00c12503          	lw	a0,12(sp)
80400254:	04010113          	addi	sp,sp,64
80400258:	00008067          	ret

8040025c <cputchar>:
8040025c:	65c0006f          	j	804008b8 <cons_putc>

80400260 <getchar>:
80400260:	ff010113          	addi	sp,sp,-16
80400264:	00112623          	sw	ra,12(sp)
80400268:	68c000ef          	jal	ra,804008f4 <cons_getc>
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
80400294:	394120ef          	jal	ra,80412628 <strlen>
80400298:	00050413          	mv	s0,a0
8040029c:	00150513          	addi	a0,a0,1
804002a0:	6e4020ef          	jal	ra,80402984 <kmalloc>
804002a4:	00050493          	mv	s1,a0
804002a8:	00050c63          	beqz	a0,804002c0 <strdup+0x44>
804002ac:	00040613          	mv	a2,s0
804002b0:	00090593          	mv	a1,s2
804002b4:	00848433          	add	s0,s1,s0
804002b8:	4c4120ef          	jal	ra,8041277c <memcpy>
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
804002e4:	5e850513          	addi	a0,a0,1512 # 804128c8 <etext+0x50>
804002e8:	00112623          	sw	ra,12(sp)
804002ec:	f11ff0ef          	jal	ra,804001fc <cprintf>
804002f0:	00000597          	auipc	a1,0x0
804002f4:	d1c58593          	addi	a1,a1,-740 # 8040000c <kern_init>
804002f8:	00012517          	auipc	a0,0x12
804002fc:	5ec50513          	addi	a0,a0,1516 # 804128e4 <etext+0x6c>
80400300:	efdff0ef          	jal	ra,804001fc <cprintf>
80400304:	00012597          	auipc	a1,0x12
80400308:	57458593          	addi	a1,a1,1396 # 80412878 <etext>
8040030c:	00012517          	auipc	a0,0x12
80400310:	5f450513          	addi	a0,a0,1524 # 80412900 <etext+0x88>
80400314:	ee9ff0ef          	jal	ra,804001fc <cprintf>
80400318:	00099597          	auipc	a1,0x99
8040031c:	d3458593          	addi	a1,a1,-716 # 8049904c <edata>
80400320:	00012517          	auipc	a0,0x12
80400324:	5fc50513          	addi	a0,a0,1532 # 8041291c <etext+0xa4>
80400328:	ed5ff0ef          	jal	ra,804001fc <cprintf>
8040032c:	0009c597          	auipc	a1,0x9c
80400330:	59058593          	addi	a1,a1,1424 # 8049c8bc <end>
80400334:	00012517          	auipc	a0,0x12
80400338:	60450513          	addi	a0,a0,1540 # 80412938 <etext+0xc0>
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
8040036c:	5ec50513          	addi	a0,a0,1516 # 80412954 <etext+0xdc>
80400370:	01010113          	addi	sp,sp,16
80400374:	e89ff06f          	j	804001fc <cprintf>

80400378 <print_stackframe>:
80400378:	ff010113          	addi	sp,sp,-16
8040037c:	00012617          	auipc	a2,0x12
80400380:	52460613          	addi	a2,a2,1316 # 804128a0 <etext+0x28>
80400384:	05b00593          	li	a1,91
80400388:	00012517          	auipc	a0,0x12
8040038c:	52c50513          	addi	a0,a0,1324 # 804128b4 <etext+0x3c>
80400390:	00112623          	sw	ra,12(sp)
80400394:	290000ef          	jal	ra,80400624 <__panic>

80400398 <mon_help>:
80400398:	ff010113          	addi	sp,sp,-16
8040039c:	00012617          	auipc	a2,0x12
804003a0:	69c60613          	addi	a2,a2,1692 # 80412a38 <commands+0xb8>
804003a4:	00012597          	auipc	a1,0x12
804003a8:	6b458593          	addi	a1,a1,1716 # 80412a58 <commands+0xd8>
804003ac:	00012517          	auipc	a0,0x12
804003b0:	6b450513          	addi	a0,a0,1716 # 80412a60 <commands+0xe0>
804003b4:	00112623          	sw	ra,12(sp)
804003b8:	e45ff0ef          	jal	ra,804001fc <cprintf>
804003bc:	00012617          	auipc	a2,0x12
804003c0:	6b060613          	addi	a2,a2,1712 # 80412a6c <commands+0xec>
804003c4:	00012597          	auipc	a1,0x12
804003c8:	6d058593          	addi	a1,a1,1744 # 80412a94 <commands+0x114>
804003cc:	00012517          	auipc	a0,0x12
804003d0:	69450513          	addi	a0,a0,1684 # 80412a60 <commands+0xe0>
804003d4:	e29ff0ef          	jal	ra,804001fc <cprintf>
804003d8:	00012617          	auipc	a2,0x12
804003dc:	6c860613          	addi	a2,a2,1736 # 80412aa0 <commands+0x120>
804003e0:	00012597          	auipc	a1,0x12
804003e4:	6e058593          	addi	a1,a1,1760 # 80412ac0 <commands+0x140>
804003e8:	00012517          	auipc	a0,0x12
804003ec:	67850513          	addi	a0,a0,1656 # 80412a60 <commands+0xe0>
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
8040044c:	55c50513          	addi	a0,a0,1372 # 804129a4 <commands+0x24>
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
80400484:	54c50513          	addi	a0,a0,1356 # 804129cc <commands+0x4c>
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
804004b0:	4d4c8c93          	addi	s9,s9,1236 # 80412980 <commands>
804004b4:	00012997          	auipc	s3,0x12
804004b8:	54098993          	addi	s3,s3,1344 # 804129f4 <commands+0x74>
804004bc:	00012917          	auipc	s2,0x12
804004c0:	53c90913          	addi	s2,s2,1340 # 804129f8 <commands+0x78>
804004c4:	00f00a13          	li	s4,15
804004c8:	00012b17          	auipc	s6,0x12
804004cc:	538b0b13          	addi	s6,s6,1336 # 80412a00 <commands+0x80>
804004d0:	00012a97          	auipc	s5,0x12
804004d4:	588a8a93          	addi	s5,s5,1416 # 80412a58 <commands+0xd8>
804004d8:	00300b93          	li	s7,3
804004dc:	00098513          	mv	a0,s3
804004e0:	b9dff0ef          	jal	ra,8040007c <readline>
804004e4:	00050413          	mv	s0,a0
804004e8:	fe050ae3          	beqz	a0,804004dc <kmonitor+0xa0>
804004ec:	00054583          	lbu	a1,0(a0)
804004f0:	00000493          	li	s1,0
804004f4:	02058063          	beqz	a1,80400514 <kmonitor+0xd8>
804004f8:	00090513          	mv	a0,s2
804004fc:	1e4120ef          	jal	ra,804126e0 <strchr>
80400500:	0a050a63          	beqz	a0,804005b4 <kmonitor+0x178>
80400504:	00144583          	lbu	a1,1(s0)
80400508:	00040023          	sb	zero,0(s0)
8040050c:	00140413          	addi	s0,s0,1
80400510:	fe0594e3          	bnez	a1,804004f8 <kmonitor+0xbc>
80400514:	fc0484e3          	beqz	s1,804004dc <kmonitor+0xa0>
80400518:	00012583          	lw	a1,0(sp)
8040051c:	00012d17          	auipc	s10,0x12
80400520:	464d0d13          	addi	s10,s10,1124 # 80412980 <commands>
80400524:	000a8513          	mv	a0,s5
80400528:	00000413          	li	s0,0
8040052c:	00cd0d13          	addi	s10,s10,12
80400530:	180120ef          	jal	ra,804126b0 <strcmp>
80400534:	02050063          	beqz	a0,80400554 <kmonitor+0x118>
80400538:	00140413          	addi	s0,s0,1
8040053c:	0d740a63          	beq	s0,s7,80400610 <kmonitor+0x1d4>
80400540:	000d2503          	lw	a0,0(s10)
80400544:	00012583          	lw	a1,0(sp)
80400548:	00cd0d13          	addi	s10,s10,12
8040054c:	164120ef          	jal	ra,804126b0 <strcmp>
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
804005f0:	0f0120ef          	jal	ra,804126e0 <strchr>
804005f4:	fe0506e3          	beqz	a0,804005e0 <kmonitor+0x1a4>
804005f8:	00044583          	lbu	a1,0(s0)
804005fc:	ef9ff06f          	j	804004f4 <kmonitor+0xb8>
80400600:	01000593          	li	a1,16
80400604:	000b0513          	mv	a0,s6
80400608:	bf5ff0ef          	jal	ra,804001fc <cprintf>
8040060c:	fb5ff06f          	j	804005c0 <kmonitor+0x184>
80400610:	00012583          	lw	a1,0(sp)
80400614:	00012517          	auipc	a0,0x12
80400618:	40c50513          	addi	a0,a0,1036 # 80412a20 <commands+0xa0>
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
80400674:	45c50513          	addi	a0,a0,1116 # 80412acc <commands+0x14c>
80400678:	00f12623          	sw	a5,12(sp)
8040067c:	b81ff0ef          	jal	ra,804001fc <cprintf>
80400680:	00c12583          	lw	a1,12(sp)
80400684:	00040513          	mv	a0,s0
80400688:	b39ff0ef          	jal	ra,804001c0 <vcprintf>
8040068c:	00012517          	auipc	a0,0x12
80400690:	3a850513          	addi	a0,a0,936 # 80412a34 <commands+0xb4>
80400694:	b69ff0ef          	jal	ra,804001fc <cprintf>
80400698:	580000ef          	jal	ra,80400c18 <intr_disable>
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
804006c8:	42450513          	addi	a0,a0,1060 # 80412ae8 <commands+0x168>
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
804006f8:	34050513          	addi	a0,a0,832 # 80412a34 <commands+0xb4>
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
80400790:	37c50513          	addi	a0,a0,892 # 80412b08 <commands+0x188>
80400794:	01010113          	addi	sp,sp,16
80400798:	a65ff06f          	j	804001fc <cprintf>

8040079c <serial_proc_data>:
8040079c:	00000513          	li	a0,0
804007a0:	00000593          	li	a1,0
804007a4:	00000613          	li	a2,0
804007a8:	00200893          	li	a7,2
804007ac:	00000073          	ecall
804007b0:	00054c63          	bltz	a0,804007c8 <serial_proc_data+0x2c>
804007b4:	07f00793          	li	a5,127
804007b8:	00f50463          	beq	a0,a5,804007c0 <serial_proc_data+0x24>
804007bc:	00008067          	ret
804007c0:	00800513          	li	a0,8
804007c4:	00008067          	ret
804007c8:	fff00513          	li	a0,-1
804007cc:	00008067          	ret

804007d0 <serial_intr>:
804007d0:	ff010113          	addi	sp,sp,-16
804007d4:	00812423          	sw	s0,8(sp)
804007d8:	00912223          	sw	s1,4(sp)
804007dc:	01212023          	sw	s2,0(sp)
804007e0:	00112623          	sw	ra,12(sp)
804007e4:	fff00413          	li	s0,-1
804007e8:	00099497          	auipc	s1,0x99
804007ec:	c6848493          	addi	s1,s1,-920 # 80499450 <cons>
804007f0:	20000913          	li	s2,512
804007f4:	0080006f          	j	804007fc <serial_intr+0x2c>
804007f8:	02051263          	bnez	a0,8040081c <serial_intr+0x4c>
804007fc:	fa1ff0ef          	jal	ra,8040079c <serial_proc_data>
80400800:	fe851ce3          	bne	a0,s0,804007f8 <serial_intr+0x28>
80400804:	00c12083          	lw	ra,12(sp)
80400808:	00812403          	lw	s0,8(sp)
8040080c:	00412483          	lw	s1,4(sp)
80400810:	00012903          	lw	s2,0(sp)
80400814:	01010113          	addi	sp,sp,16
80400818:	00008067          	ret
8040081c:	2044a783          	lw	a5,516(s1)
80400820:	00178713          	addi	a4,a5,1
80400824:	00f487b3          	add	a5,s1,a5
80400828:	00099697          	auipc	a3,0x99
8040082c:	e2e6a623          	sw	a4,-468(a3) # 80499654 <cons+0x204>
80400830:	00a78023          	sb	a0,0(a5)
80400834:	fd2714e3          	bne	a4,s2,804007fc <serial_intr+0x2c>
80400838:	00099797          	auipc	a5,0x99
8040083c:	e007ae23          	sw	zero,-484(a5) # 80499654 <cons+0x204>
80400840:	fbdff06f          	j	804007fc <serial_intr+0x2c>

80400844 <serial_putc>:
80400844:	00a00713          	li	a4,10
80400848:	02e50c63          	beq	a0,a4,80400880 <serial_putc+0x3c>
8040084c:	00800713          	li	a4,8
80400850:	00000593          	li	a1,0
80400854:	00000613          	li	a2,0
80400858:	00100893          	li	a7,1
8040085c:	00e50663          	beq	a0,a4,80400868 <serial_putc+0x24>
80400860:	00000073          	ecall
80400864:	00008067          	ret
80400868:	00000073          	ecall
8040086c:	02000513          	li	a0,32
80400870:	00000073          	ecall
80400874:	00800513          	li	a0,8
80400878:	00000073          	ecall
8040087c:	00008067          	ret
80400880:	00d00513          	li	a0,13
80400884:	00000593          	li	a1,0
80400888:	00000613          	li	a2,0
8040088c:	00100893          	li	a7,1
80400890:	00000073          	ecall
80400894:	00a00513          	li	a0,10
80400898:	00000073          	ecall
8040089c:	00008067          	ret

804008a0 <cons_init>:
804008a0:	00000513          	li	a0,0
804008a4:	00000593          	li	a1,0
804008a8:	00000613          	li	a2,0
804008ac:	00200893          	li	a7,2
804008b0:	00000073          	ecall
804008b4:	00008067          	ret

804008b8 <cons_putc>:
804008b8:	100027f3          	csrr	a5,sstatus
804008bc:	0027f793          	andi	a5,a5,2
804008c0:	00079463          	bnez	a5,804008c8 <cons_putc+0x10>
804008c4:	f81ff06f          	j	80400844 <serial_putc>
804008c8:	ff010113          	addi	sp,sp,-16
804008cc:	00112623          	sw	ra,12(sp)
804008d0:	00812423          	sw	s0,8(sp)
804008d4:	00050413          	mv	s0,a0
804008d8:	340000ef          	jal	ra,80400c18 <intr_disable>
804008dc:	00040513          	mv	a0,s0
804008e0:	f65ff0ef          	jal	ra,80400844 <serial_putc>
804008e4:	00812403          	lw	s0,8(sp)
804008e8:	00c12083          	lw	ra,12(sp)
804008ec:	01010113          	addi	sp,sp,16
804008f0:	3200006f          	j	80400c10 <intr_enable>

804008f4 <cons_getc>:
804008f4:	fe010113          	addi	sp,sp,-32
804008f8:	00112e23          	sw	ra,28(sp)
804008fc:	100027f3          	csrr	a5,sstatus
80400900:	0027f793          	andi	a5,a5,2
80400904:	04079463          	bnez	a5,8040094c <cons_getc+0x58>
80400908:	ec9ff0ef          	jal	ra,804007d0 <serial_intr>
8040090c:	00099797          	auipc	a5,0x99
80400910:	b4478793          	addi	a5,a5,-1212 # 80499450 <cons>
80400914:	2007a703          	lw	a4,512(a5)
80400918:	2047a683          	lw	a3,516(a5)
8040091c:	00000513          	li	a0,0
80400920:	02d70063          	beq	a4,a3,80400940 <cons_getc+0x4c>
80400924:	00170693          	addi	a3,a4,1
80400928:	00e787b3          	add	a5,a5,a4
8040092c:	00099717          	auipc	a4,0x99
80400930:	d2d72223          	sw	a3,-732(a4) # 80499650 <cons+0x200>
80400934:	20000713          	li	a4,512
80400938:	0007c503          	lbu	a0,0(a5)
8040093c:	06e68263          	beq	a3,a4,804009a0 <cons_getc+0xac>
80400940:	01c12083          	lw	ra,28(sp)
80400944:	02010113          	addi	sp,sp,32
80400948:	00008067          	ret
8040094c:	2cc000ef          	jal	ra,80400c18 <intr_disable>
80400950:	e81ff0ef          	jal	ra,804007d0 <serial_intr>
80400954:	00099797          	auipc	a5,0x99
80400958:	afc78793          	addi	a5,a5,-1284 # 80499450 <cons>
8040095c:	2007a703          	lw	a4,512(a5)
80400960:	2047a683          	lw	a3,516(a5)
80400964:	00000513          	li	a0,0
80400968:	02d70063          	beq	a4,a3,80400988 <cons_getc+0x94>
8040096c:	00170693          	addi	a3,a4,1
80400970:	00e787b3          	add	a5,a5,a4
80400974:	00099717          	auipc	a4,0x99
80400978:	ccd72e23          	sw	a3,-804(a4) # 80499650 <cons+0x200>
8040097c:	20000713          	li	a4,512
80400980:	0007c503          	lbu	a0,0(a5)
80400984:	02e68863          	beq	a3,a4,804009b4 <cons_getc+0xc0>
80400988:	00a12623          	sw	a0,12(sp)
8040098c:	284000ef          	jal	ra,80400c10 <intr_enable>
80400990:	01c12083          	lw	ra,28(sp)
80400994:	00c12503          	lw	a0,12(sp)
80400998:	02010113          	addi	sp,sp,32
8040099c:	00008067          	ret
804009a0:	01c12083          	lw	ra,28(sp)
804009a4:	00099797          	auipc	a5,0x99
804009a8:	ca07a623          	sw	zero,-852(a5) # 80499650 <cons+0x200>
804009ac:	02010113          	addi	sp,sp,32
804009b0:	00008067          	ret
804009b4:	00099797          	auipc	a5,0x99
804009b8:	c807ae23          	sw	zero,-868(a5) # 80499650 <cons+0x200>
804009bc:	fcdff06f          	j	80400988 <cons_getc+0x94>

804009c0 <ide_init>:
804009c0:	ff010113          	addi	sp,sp,-16
804009c4:	00099597          	auipc	a1,0x99
804009c8:	cd058593          	addi	a1,a1,-816 # 80499694 <ide_devices+0x3c>
804009cc:	00100513          	li	a0,1
804009d0:	00812423          	sw	s0,8(sp)
804009d4:	00099797          	auipc	a5,0x99
804009d8:	c807a223          	sw	zero,-892(a5) # 80499658 <ide_devices>
804009dc:	00099797          	auipc	a5,0x99
804009e0:	ca07ac23          	sw	zero,-840(a5) # 80499694 <ide_devices+0x3c>
804009e4:	00099797          	auipc	a5,0x99
804009e8:	ce07a623          	sw	zero,-788(a5) # 804996d0 <ide_devices+0x78>
804009ec:	00099797          	auipc	a5,0x99
804009f0:	d207a023          	sw	zero,-736(a5) # 8049970c <ide_devices+0xb4>
804009f4:	00112623          	sw	ra,12(sp)
804009f8:	00099417          	auipc	s0,0x99
804009fc:	c6040413          	addi	s0,s0,-928 # 80499658 <ide_devices>
80400a00:	2fc000ef          	jal	ra,80400cfc <ramdisk_init>
80400a04:	03c42783          	lw	a5,60(s0)
80400a08:	02078663          	beqz	a5,80400a34 <ide_init+0x74>
80400a0c:	00099597          	auipc	a1,0x99
80400a10:	cc458593          	addi	a1,a1,-828 # 804996d0 <ide_devices+0x78>
80400a14:	00200513          	li	a0,2
80400a18:	2e4000ef          	jal	ra,80400cfc <ramdisk_init>
80400a1c:	07842783          	lw	a5,120(s0)
80400a20:	02078a63          	beqz	a5,80400a54 <ide_init+0x94>
80400a24:	00c12083          	lw	ra,12(sp)
80400a28:	00812403          	lw	s0,8(sp)
80400a2c:	01010113          	addi	sp,sp,16
80400a30:	00008067          	ret
80400a34:	00012697          	auipc	a3,0x12
80400a38:	0f068693          	addi	a3,a3,240 # 80412b24 <commands+0x1a4>
80400a3c:	00012617          	auipc	a2,0x12
80400a40:	10060613          	addi	a2,a2,256 # 80412b3c <commands+0x1bc>
80400a44:	01100593          	li	a1,17
80400a48:	00012517          	auipc	a0,0x12
80400a4c:	10c50513          	addi	a0,a0,268 # 80412b54 <commands+0x1d4>
80400a50:	bd5ff0ef          	jal	ra,80400624 <__panic>
80400a54:	00012697          	auipc	a3,0x12
80400a58:	11468693          	addi	a3,a3,276 # 80412b68 <commands+0x1e8>
80400a5c:	00012617          	auipc	a2,0x12
80400a60:	0e060613          	addi	a2,a2,224 # 80412b3c <commands+0x1bc>
80400a64:	01400593          	li	a1,20
80400a68:	00012517          	auipc	a0,0x12
80400a6c:	0ec50513          	addi	a0,a0,236 # 80412b54 <commands+0x1d4>
80400a70:	bb5ff0ef          	jal	ra,80400624 <__panic>

80400a74 <ide_device_valid>:
80400a74:	00300793          	li	a5,3
80400a78:	02a7e463          	bltu	a5,a0,80400aa0 <ide_device_valid+0x2c>
80400a7c:	00451793          	slli	a5,a0,0x4
80400a80:	40a787b3          	sub	a5,a5,a0
80400a84:	00279793          	slli	a5,a5,0x2
80400a88:	00099517          	auipc	a0,0x99
80400a8c:	bd050513          	addi	a0,a0,-1072 # 80499658 <ide_devices>
80400a90:	00f507b3          	add	a5,a0,a5
80400a94:	0007a503          	lw	a0,0(a5)
80400a98:	00a03533          	snez	a0,a0
80400a9c:	00008067          	ret
80400aa0:	00000513          	li	a0,0
80400aa4:	00008067          	ret

80400aa8 <ide_device_size>:
80400aa8:	00300793          	li	a5,3
80400aac:	02a7e663          	bltu	a5,a0,80400ad8 <ide_device_size+0x30>
80400ab0:	00451793          	slli	a5,a0,0x4
80400ab4:	40a787b3          	sub	a5,a5,a0
80400ab8:	00279793          	slli	a5,a5,0x2
80400abc:	00099517          	auipc	a0,0x99
80400ac0:	b9c50513          	addi	a0,a0,-1124 # 80499658 <ide_devices>
80400ac4:	00f507b3          	add	a5,a0,a5
80400ac8:	0007a503          	lw	a0,0(a5)
80400acc:	00050863          	beqz	a0,80400adc <ide_device_size+0x34>
80400ad0:	0087a503          	lw	a0,8(a5)
80400ad4:	00008067          	ret
80400ad8:	00000513          	li	a0,0
80400adc:	00008067          	ret

80400ae0 <ide_read_secs>:
80400ae0:	ff010113          	addi	sp,sp,-16
80400ae4:	00112623          	sw	ra,12(sp)
80400ae8:	08000793          	li	a5,128
80400aec:	04d7e663          	bltu	a5,a3,80400b38 <ide_read_secs+0x58>
80400af0:	00300793          	li	a5,3
80400af4:	04a7e263          	bltu	a5,a0,80400b38 <ide_read_secs+0x58>
80400af8:	00451793          	slli	a5,a0,0x4
80400afc:	40a78533          	sub	a0,a5,a0
80400b00:	00251513          	slli	a0,a0,0x2
80400b04:	00099797          	auipc	a5,0x99
80400b08:	b5478793          	addi	a5,a5,-1196 # 80499658 <ide_devices>
80400b0c:	00a78533          	add	a0,a5,a0
80400b10:	00052783          	lw	a5,0(a0)
80400b14:	02078263          	beqz	a5,80400b38 <ide_read_secs+0x58>
80400b18:	100007b7          	lui	a5,0x10000
80400b1c:	02f5fe63          	bgeu	a1,a5,80400b58 <ide_read_secs+0x78>
80400b20:	00b68733          	add	a4,a3,a1
80400b24:	02e7ea63          	bltu	a5,a4,80400b58 <ide_read_secs+0x78>
80400b28:	00c12083          	lw	ra,12(sp)
80400b2c:	03452303          	lw	t1,52(a0)
80400b30:	01010113          	addi	sp,sp,16
80400b34:	00030067          	jr	t1
80400b38:	00012697          	auipc	a3,0x12
80400b3c:	04868693          	addi	a3,a3,72 # 80412b80 <commands+0x200>
80400b40:	00012617          	auipc	a2,0x12
80400b44:	ffc60613          	addi	a2,a2,-4 # 80412b3c <commands+0x1bc>
80400b48:	02200593          	li	a1,34
80400b4c:	00012517          	auipc	a0,0x12
80400b50:	00850513          	addi	a0,a0,8 # 80412b54 <commands+0x1d4>
80400b54:	ad1ff0ef          	jal	ra,80400624 <__panic>
80400b58:	00012697          	auipc	a3,0x12
80400b5c:	05068693          	addi	a3,a3,80 # 80412ba8 <commands+0x228>
80400b60:	00012617          	auipc	a2,0x12
80400b64:	fdc60613          	addi	a2,a2,-36 # 80412b3c <commands+0x1bc>
80400b68:	02300593          	li	a1,35
80400b6c:	00012517          	auipc	a0,0x12
80400b70:	fe850513          	addi	a0,a0,-24 # 80412b54 <commands+0x1d4>
80400b74:	ab1ff0ef          	jal	ra,80400624 <__panic>

80400b78 <ide_write_secs>:
80400b78:	ff010113          	addi	sp,sp,-16
80400b7c:	00112623          	sw	ra,12(sp)
80400b80:	08000793          	li	a5,128
80400b84:	04d7e663          	bltu	a5,a3,80400bd0 <ide_write_secs+0x58>
80400b88:	00300793          	li	a5,3
80400b8c:	04a7e263          	bltu	a5,a0,80400bd0 <ide_write_secs+0x58>
80400b90:	00451793          	slli	a5,a0,0x4
80400b94:	40a78533          	sub	a0,a5,a0
80400b98:	00251513          	slli	a0,a0,0x2
80400b9c:	00099797          	auipc	a5,0x99
80400ba0:	abc78793          	addi	a5,a5,-1348 # 80499658 <ide_devices>
80400ba4:	00a78533          	add	a0,a5,a0
80400ba8:	00052783          	lw	a5,0(a0)
80400bac:	02078263          	beqz	a5,80400bd0 <ide_write_secs+0x58>
80400bb0:	100007b7          	lui	a5,0x10000
80400bb4:	02f5fe63          	bgeu	a1,a5,80400bf0 <ide_write_secs+0x78>
80400bb8:	00b68733          	add	a4,a3,a1
80400bbc:	02e7ea63          	bltu	a5,a4,80400bf0 <ide_write_secs+0x78>
80400bc0:	00c12083          	lw	ra,12(sp)
80400bc4:	03852303          	lw	t1,56(a0)
80400bc8:	01010113          	addi	sp,sp,16
80400bcc:	00030067          	jr	t1
80400bd0:	00012697          	auipc	a3,0x12
80400bd4:	fb068693          	addi	a3,a3,-80 # 80412b80 <commands+0x200>
80400bd8:	00012617          	auipc	a2,0x12
80400bdc:	f6460613          	addi	a2,a2,-156 # 80412b3c <commands+0x1bc>
80400be0:	02900593          	li	a1,41
80400be4:	00012517          	auipc	a0,0x12
80400be8:	f7050513          	addi	a0,a0,-144 # 80412b54 <commands+0x1d4>
80400bec:	a39ff0ef          	jal	ra,80400624 <__panic>
80400bf0:	00012697          	auipc	a3,0x12
80400bf4:	fb868693          	addi	a3,a3,-72 # 80412ba8 <commands+0x228>
80400bf8:	00012617          	auipc	a2,0x12
80400bfc:	f4460613          	addi	a2,a2,-188 # 80412b3c <commands+0x1bc>
80400c00:	02a00593          	li	a1,42
80400c04:	00012517          	auipc	a0,0x12
80400c08:	f5050513          	addi	a0,a0,-176 # 80412b54 <commands+0x1d4>
80400c0c:	a19ff0ef          	jal	ra,80400624 <__panic>

80400c10 <intr_enable>:
80400c10:	100167f3          	csrrsi	a5,sstatus,2
80400c14:	00008067          	ret

80400c18 <intr_disable>:
80400c18:	100177f3          	csrrci	a5,sstatus,2
80400c1c:	00008067          	ret

80400c20 <pic_init>:
80400c20:	00008067          	ret

80400c24 <ramdisk_write>:
80400c24:	00852783          	lw	a5,8(a0)
80400c28:	ff010113          	addi	sp,sp,-16
80400c2c:	00112623          	sw	ra,12(sp)
80400c30:	40b787b3          	sub	a5,a5,a1
80400c34:	00058713          	mv	a4,a1
80400c38:	00060593          	mv	a1,a2
80400c3c:	00f6f463          	bgeu	a3,a5,80400c44 <ramdisk_write+0x20>
80400c40:	00068793          	mv	a5,a3
80400c44:	00c52503          	lw	a0,12(a0)
80400c48:	00971713          	slli	a4,a4,0x9
80400c4c:	00979613          	slli	a2,a5,0x9
80400c50:	00a70533          	add	a0,a4,a0
80400c54:	329110ef          	jal	ra,8041277c <memcpy>
80400c58:	00c12083          	lw	ra,12(sp)
80400c5c:	00000513          	li	a0,0
80400c60:	01010113          	addi	sp,sp,16
80400c64:	00008067          	ret

80400c68 <ramdisk_read>:
80400c68:	00852783          	lw	a5,8(a0)
80400c6c:	ff010113          	addi	sp,sp,-16
80400c70:	00112623          	sw	ra,12(sp)
80400c74:	40b787b3          	sub	a5,a5,a1
80400c78:	00050713          	mv	a4,a0
80400c7c:	00060513          	mv	a0,a2
80400c80:	00f6f463          	bgeu	a3,a5,80400c88 <ramdisk_read+0x20>
80400c84:	00068793          	mv	a5,a3
80400c88:	00c72703          	lw	a4,12(a4)
80400c8c:	00959593          	slli	a1,a1,0x9
80400c90:	00979613          	slli	a2,a5,0x9
80400c94:	00e585b3          	add	a1,a1,a4
80400c98:	2e5110ef          	jal	ra,8041277c <memcpy>
80400c9c:	00c12083          	lw	ra,12(sp)
80400ca0:	00000513          	li	a0,0
80400ca4:	01010113          	addi	sp,sp,16
80400ca8:	00008067          	ret

80400cac <check_initrd>:
80400cac:	ff010113          	addi	sp,sp,-16
80400cb0:	00112623          	sw	ra,12(sp)
80400cb4:	02b50663          	beq	a0,a1,80400ce0 <check_initrd+0x34>
80400cb8:	40a586b3          	sub	a3,a1,a0
80400cbc:	fff58613          	addi	a2,a1,-1
80400cc0:	00050593          	mv	a1,a0
80400cc4:	00012517          	auipc	a0,0x12
80400cc8:	f3850513          	addi	a0,a0,-200 # 80412bfc <commands+0x27c>
80400ccc:	d30ff0ef          	jal	ra,804001fc <cprintf>
80400cd0:	00c12083          	lw	ra,12(sp)
80400cd4:	00100513          	li	a0,1
80400cd8:	01010113          	addi	sp,sp,16
80400cdc:	00008067          	ret
80400ce0:	00012517          	auipc	a0,0x12
80400ce4:	f0450513          	addi	a0,a0,-252 # 80412be4 <commands+0x264>
80400ce8:	d14ff0ef          	jal	ra,804001fc <cprintf>
80400cec:	00c12083          	lw	ra,12(sp)
80400cf0:	00000513          	li	a0,0
80400cf4:	01010113          	addi	sp,sp,16
80400cf8:	00008067          	ret

80400cfc <ramdisk_init>:
80400cfc:	fe010113          	addi	sp,sp,-32
80400d00:	00812c23          	sw	s0,24(sp)
80400d04:	00058413          	mv	s0,a1
80400d08:	01212823          	sw	s2,16(sp)
80400d0c:	03c00613          	li	a2,60
80400d10:	00050913          	mv	s2,a0
80400d14:	00000593          	li	a1,0
80400d18:	00040513          	mv	a0,s0
80400d1c:	00112e23          	sw	ra,28(sp)
80400d20:	00912a23          	sw	s1,20(sp)
80400d24:	01312623          	sw	s3,12(sp)
80400d28:	1e5110ef          	jal	ra,8041270c <memset>
80400d2c:	00100793          	li	a5,1
80400d30:	0af90663          	beq	s2,a5,80400ddc <ramdisk_init+0xe0>
80400d34:	00200793          	li	a5,2
80400d38:	00098497          	auipc	s1,0x98
80400d3c:	2c848493          	addi	s1,s1,712 # 80499000 <swap_manager_fifo>
80400d40:	00020997          	auipc	s3,0x20
80400d44:	2c098993          	addi	s3,s3,704 # 80421000 <_binary_bin_sfs_img_start>
80400d48:	0af91463          	bne	s2,a5,80400df0 <ramdisk_init+0xf4>
80400d4c:	00048593          	mv	a1,s1
80400d50:	00098513          	mv	a0,s3
80400d54:	f59ff0ef          	jal	ra,80400cac <check_initrd>
80400d58:	02051063          	bnez	a0,80400d78 <ramdisk_init+0x7c>
80400d5c:	01c12083          	lw	ra,28(sp)
80400d60:	01812403          	lw	s0,24(sp)
80400d64:	01412483          	lw	s1,20(sp)
80400d68:	01012903          	lw	s2,16(sp)
80400d6c:	00c12983          	lw	s3,12(sp)
80400d70:	02010113          	addi	sp,sp,32
80400d74:	00008067          	ret
80400d78:	413484b3          	sub	s1,s1,s3
80400d7c:	00100793          	li	a5,1
80400d80:	00f42023          	sw	a5,0(s0)
80400d84:	0094d493          	srli	s1,s1,0x9
80400d88:	fff00793          	li	a5,-1
80400d8c:	00f42223          	sw	a5,4(s0)
80400d90:	00942423          	sw	s1,8(s0)
80400d94:	01342623          	sw	s3,12(s0)
80400d98:	01440513          	addi	a0,s0,20
80400d9c:	00012597          	auipc	a1,0x12
80400da0:	eb458593          	addi	a1,a1,-332 # 80412c50 <commands+0x2d0>
80400da4:	0f1110ef          	jal	ra,80412694 <strcpy>
80400da8:	00000797          	auipc	a5,0x0
80400dac:	ec078793          	addi	a5,a5,-320 # 80400c68 <ramdisk_read>
80400db0:	02f42a23          	sw	a5,52(s0)
80400db4:	00000797          	auipc	a5,0x0
80400db8:	e7078793          	addi	a5,a5,-400 # 80400c24 <ramdisk_write>
80400dbc:	02f42c23          	sw	a5,56(s0)
80400dc0:	01c12083          	lw	ra,28(sp)
80400dc4:	01812403          	lw	s0,24(sp)
80400dc8:	01412483          	lw	s1,20(sp)
80400dcc:	01012903          	lw	s2,16(sp)
80400dd0:	00c12983          	lw	s3,12(sp)
80400dd4:	02010113          	addi	sp,sp,32
80400dd8:	00008067          	ret
80400ddc:	00020497          	auipc	s1,0x20
80400de0:	22448493          	addi	s1,s1,548 # 80421000 <_binary_bin_sfs_img_start>
80400de4:	00018997          	auipc	s3,0x18
80400de8:	21c98993          	addi	s3,s3,540 # 80419000 <_binary_bin_swap_img_start>
80400dec:	f61ff06f          	j	80400d4c <ramdisk_init+0x50>
80400df0:	00012617          	auipc	a2,0x12
80400df4:	e3460613          	addi	a2,a2,-460 # 80412c24 <commands+0x2a4>
80400df8:	03200593          	li	a1,50
80400dfc:	00012517          	auipc	a0,0x12
80400e00:	e3c50513          	addi	a0,a0,-452 # 80412c38 <commands+0x2b8>
80400e04:	821ff0ef          	jal	ra,80400624 <__panic>

80400e08 <idt_init>:
80400e08:	14005073          	csrwi	sscratch,0
80400e0c:	00001797          	auipc	a5,0x1
80400e10:	88878793          	addi	a5,a5,-1912 # 80401694 <__alltraps>
80400e14:	10579073          	csrw	stvec,a5
80400e18:	000407b7          	lui	a5,0x40
80400e1c:	1007a7f3          	csrrs	a5,sstatus,a5
80400e20:	20200793          	li	a5,514
80400e24:	1047a7f3          	csrrs	a5,sie,a5
80400e28:	00008067          	ret

80400e2c <print_regs>:
80400e2c:	00052583          	lw	a1,0(a0)
80400e30:	ff010113          	addi	sp,sp,-16
80400e34:	00812423          	sw	s0,8(sp)
80400e38:	00050413          	mv	s0,a0
80400e3c:	00012517          	auipc	a0,0x12
80400e40:	1f850513          	addi	a0,a0,504 # 80413034 <commands+0x6b4>
80400e44:	00112623          	sw	ra,12(sp)
80400e48:	bb4ff0ef          	jal	ra,804001fc <cprintf>
80400e4c:	00442583          	lw	a1,4(s0)
80400e50:	00012517          	auipc	a0,0x12
80400e54:	1f850513          	addi	a0,a0,504 # 80413048 <commands+0x6c8>
80400e58:	ba4ff0ef          	jal	ra,804001fc <cprintf>
80400e5c:	00842583          	lw	a1,8(s0)
80400e60:	00012517          	auipc	a0,0x12
80400e64:	1fc50513          	addi	a0,a0,508 # 8041305c <commands+0x6dc>
80400e68:	b94ff0ef          	jal	ra,804001fc <cprintf>
80400e6c:	00c42583          	lw	a1,12(s0)
80400e70:	00012517          	auipc	a0,0x12
80400e74:	20050513          	addi	a0,a0,512 # 80413070 <commands+0x6f0>
80400e78:	b84ff0ef          	jal	ra,804001fc <cprintf>
80400e7c:	01042583          	lw	a1,16(s0)
80400e80:	00012517          	auipc	a0,0x12
80400e84:	20450513          	addi	a0,a0,516 # 80413084 <commands+0x704>
80400e88:	b74ff0ef          	jal	ra,804001fc <cprintf>
80400e8c:	01442583          	lw	a1,20(s0)
80400e90:	00012517          	auipc	a0,0x12
80400e94:	20850513          	addi	a0,a0,520 # 80413098 <commands+0x718>
80400e98:	b64ff0ef          	jal	ra,804001fc <cprintf>
80400e9c:	01842583          	lw	a1,24(s0)
80400ea0:	00012517          	auipc	a0,0x12
80400ea4:	20c50513          	addi	a0,a0,524 # 804130ac <commands+0x72c>
80400ea8:	b54ff0ef          	jal	ra,804001fc <cprintf>
80400eac:	01c42583          	lw	a1,28(s0)
80400eb0:	00012517          	auipc	a0,0x12
80400eb4:	21050513          	addi	a0,a0,528 # 804130c0 <commands+0x740>
80400eb8:	b44ff0ef          	jal	ra,804001fc <cprintf>
80400ebc:	02042583          	lw	a1,32(s0)
80400ec0:	00012517          	auipc	a0,0x12
80400ec4:	21450513          	addi	a0,a0,532 # 804130d4 <commands+0x754>
80400ec8:	b34ff0ef          	jal	ra,804001fc <cprintf>
80400ecc:	02442583          	lw	a1,36(s0)
80400ed0:	00012517          	auipc	a0,0x12
80400ed4:	21850513          	addi	a0,a0,536 # 804130e8 <commands+0x768>
80400ed8:	b24ff0ef          	jal	ra,804001fc <cprintf>
80400edc:	02842583          	lw	a1,40(s0)
80400ee0:	00012517          	auipc	a0,0x12
80400ee4:	21c50513          	addi	a0,a0,540 # 804130fc <commands+0x77c>
80400ee8:	b14ff0ef          	jal	ra,804001fc <cprintf>
80400eec:	02c42583          	lw	a1,44(s0)
80400ef0:	00012517          	auipc	a0,0x12
80400ef4:	22050513          	addi	a0,a0,544 # 80413110 <commands+0x790>
80400ef8:	b04ff0ef          	jal	ra,804001fc <cprintf>
80400efc:	03042583          	lw	a1,48(s0)
80400f00:	00012517          	auipc	a0,0x12
80400f04:	22450513          	addi	a0,a0,548 # 80413124 <commands+0x7a4>
80400f08:	af4ff0ef          	jal	ra,804001fc <cprintf>
80400f0c:	03442583          	lw	a1,52(s0)
80400f10:	00012517          	auipc	a0,0x12
80400f14:	22850513          	addi	a0,a0,552 # 80413138 <commands+0x7b8>
80400f18:	ae4ff0ef          	jal	ra,804001fc <cprintf>
80400f1c:	03842583          	lw	a1,56(s0)
80400f20:	00012517          	auipc	a0,0x12
80400f24:	22c50513          	addi	a0,a0,556 # 8041314c <commands+0x7cc>
80400f28:	ad4ff0ef          	jal	ra,804001fc <cprintf>
80400f2c:	03c42583          	lw	a1,60(s0)
80400f30:	00012517          	auipc	a0,0x12
80400f34:	23050513          	addi	a0,a0,560 # 80413160 <commands+0x7e0>
80400f38:	ac4ff0ef          	jal	ra,804001fc <cprintf>
80400f3c:	04042583          	lw	a1,64(s0)
80400f40:	00012517          	auipc	a0,0x12
80400f44:	23450513          	addi	a0,a0,564 # 80413174 <commands+0x7f4>
80400f48:	ab4ff0ef          	jal	ra,804001fc <cprintf>
80400f4c:	04442583          	lw	a1,68(s0)
80400f50:	00012517          	auipc	a0,0x12
80400f54:	23850513          	addi	a0,a0,568 # 80413188 <commands+0x808>
80400f58:	aa4ff0ef          	jal	ra,804001fc <cprintf>
80400f5c:	04842583          	lw	a1,72(s0)
80400f60:	00012517          	auipc	a0,0x12
80400f64:	23c50513          	addi	a0,a0,572 # 8041319c <commands+0x81c>
80400f68:	a94ff0ef          	jal	ra,804001fc <cprintf>
80400f6c:	04c42583          	lw	a1,76(s0)
80400f70:	00012517          	auipc	a0,0x12
80400f74:	24050513          	addi	a0,a0,576 # 804131b0 <commands+0x830>
80400f78:	a84ff0ef          	jal	ra,804001fc <cprintf>
80400f7c:	05042583          	lw	a1,80(s0)
80400f80:	00012517          	auipc	a0,0x12
80400f84:	24450513          	addi	a0,a0,580 # 804131c4 <commands+0x844>
80400f88:	a74ff0ef          	jal	ra,804001fc <cprintf>
80400f8c:	05442583          	lw	a1,84(s0)
80400f90:	00012517          	auipc	a0,0x12
80400f94:	24850513          	addi	a0,a0,584 # 804131d8 <commands+0x858>
80400f98:	a64ff0ef          	jal	ra,804001fc <cprintf>
80400f9c:	05842583          	lw	a1,88(s0)
80400fa0:	00012517          	auipc	a0,0x12
80400fa4:	24c50513          	addi	a0,a0,588 # 804131ec <commands+0x86c>
80400fa8:	a54ff0ef          	jal	ra,804001fc <cprintf>
80400fac:	05c42583          	lw	a1,92(s0)
80400fb0:	00012517          	auipc	a0,0x12
80400fb4:	25050513          	addi	a0,a0,592 # 80413200 <commands+0x880>
80400fb8:	a44ff0ef          	jal	ra,804001fc <cprintf>
80400fbc:	06042583          	lw	a1,96(s0)
80400fc0:	00012517          	auipc	a0,0x12
80400fc4:	25450513          	addi	a0,a0,596 # 80413214 <commands+0x894>
80400fc8:	a34ff0ef          	jal	ra,804001fc <cprintf>
80400fcc:	06442583          	lw	a1,100(s0)
80400fd0:	00012517          	auipc	a0,0x12
80400fd4:	25850513          	addi	a0,a0,600 # 80413228 <commands+0x8a8>
80400fd8:	a24ff0ef          	jal	ra,804001fc <cprintf>
80400fdc:	06842583          	lw	a1,104(s0)
80400fe0:	00012517          	auipc	a0,0x12
80400fe4:	25c50513          	addi	a0,a0,604 # 8041323c <commands+0x8bc>
80400fe8:	a14ff0ef          	jal	ra,804001fc <cprintf>
80400fec:	06c42583          	lw	a1,108(s0)
80400ff0:	00012517          	auipc	a0,0x12
80400ff4:	26050513          	addi	a0,a0,608 # 80413250 <commands+0x8d0>
80400ff8:	a04ff0ef          	jal	ra,804001fc <cprintf>
80400ffc:	07042583          	lw	a1,112(s0)
80401000:	00012517          	auipc	a0,0x12
80401004:	26450513          	addi	a0,a0,612 # 80413264 <commands+0x8e4>
80401008:	9f4ff0ef          	jal	ra,804001fc <cprintf>
8040100c:	07442583          	lw	a1,116(s0)
80401010:	00012517          	auipc	a0,0x12
80401014:	26850513          	addi	a0,a0,616 # 80413278 <commands+0x8f8>
80401018:	9e4ff0ef          	jal	ra,804001fc <cprintf>
8040101c:	07842583          	lw	a1,120(s0)
80401020:	00012517          	auipc	a0,0x12
80401024:	26c50513          	addi	a0,a0,620 # 8041328c <commands+0x90c>
80401028:	9d4ff0ef          	jal	ra,804001fc <cprintf>
8040102c:	07c42583          	lw	a1,124(s0)
80401030:	00812403          	lw	s0,8(sp)
80401034:	00c12083          	lw	ra,12(sp)
80401038:	00012517          	auipc	a0,0x12
8040103c:	26850513          	addi	a0,a0,616 # 804132a0 <commands+0x920>
80401040:	01010113          	addi	sp,sp,16
80401044:	9b8ff06f          	j	804001fc <cprintf>

80401048 <print_trapframe>:
80401048:	ff010113          	addi	sp,sp,-16
8040104c:	00812423          	sw	s0,8(sp)
80401050:	00050593          	mv	a1,a0
80401054:	00050413          	mv	s0,a0
80401058:	00012517          	auipc	a0,0x12
8040105c:	25c50513          	addi	a0,a0,604 # 804132b4 <commands+0x934>
80401060:	00112623          	sw	ra,12(sp)
80401064:	998ff0ef          	jal	ra,804001fc <cprintf>
80401068:	00040513          	mv	a0,s0
8040106c:	dc1ff0ef          	jal	ra,80400e2c <print_regs>
80401070:	08042583          	lw	a1,128(s0)
80401074:	00012517          	auipc	a0,0x12
80401078:	25450513          	addi	a0,a0,596 # 804132c8 <commands+0x948>
8040107c:	980ff0ef          	jal	ra,804001fc <cprintf>
80401080:	08442583          	lw	a1,132(s0)
80401084:	00012517          	auipc	a0,0x12
80401088:	25850513          	addi	a0,a0,600 # 804132dc <commands+0x95c>
8040108c:	970ff0ef          	jal	ra,804001fc <cprintf>
80401090:	08842583          	lw	a1,136(s0)
80401094:	00012517          	auipc	a0,0x12
80401098:	25c50513          	addi	a0,a0,604 # 804132f0 <commands+0x970>
8040109c:	960ff0ef          	jal	ra,804001fc <cprintf>
804010a0:	08c42583          	lw	a1,140(s0)
804010a4:	00812403          	lw	s0,8(sp)
804010a8:	00c12083          	lw	ra,12(sp)
804010ac:	00012517          	auipc	a0,0x12
804010b0:	25850513          	addi	a0,a0,600 # 80413304 <commands+0x984>
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
804010e8:	ee450513          	addi	a0,a0,-284 # 80412fc8 <commands+0x648>
804010ec:	910ff0ef          	jal	ra,804001fc <cprintf>
804010f0:	08c42583          	lw	a1,140(s0)
804010f4:	00d00793          	li	a5,13
804010f8:	08f58463          	beq	a1,a5,80401180 <pgfault_handler+0xc4>
804010fc:	00f00793          	li	a5,15
80401100:	08f58863          	beq	a1,a5,80401190 <pgfault_handler+0xd4>
80401104:	00012517          	auipc	a0,0x12
80401108:	ee850513          	addi	a0,a0,-280 # 80412fec <commands+0x66c>
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
8040114c:	1550306f          	j	80404aa0 <do_pgfault>
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
8040117c:	1250306f          	j	80404aa0 <do_pgfault>
80401180:	00012517          	auipc	a0,0x12
80401184:	e6450513          	addi	a0,a0,-412 # 80412fe4 <commands+0x664>
80401188:	874ff0ef          	jal	ra,804001fc <cprintf>
8040118c:	f85ff06f          	j	80401110 <pgfault_handler+0x54>
80401190:	00012517          	auipc	a0,0x12
80401194:	e5850513          	addi	a0,a0,-424 # 80412fe8 <commands+0x668>
80401198:	864ff0ef          	jal	ra,804001fc <cprintf>
8040119c:	f75ff06f          	j	80401110 <pgfault_handler+0x54>
804011a0:	00012697          	auipc	a3,0x12
804011a4:	e5468693          	addi	a3,a3,-428 # 80412ff4 <commands+0x674>
804011a8:	00012617          	auipc	a2,0x12
804011ac:	99460613          	addi	a2,a2,-1644 # 80412b3c <commands+0x1bc>
804011b0:	08700593          	li	a1,135
804011b4:	00012517          	auipc	a0,0x12
804011b8:	e5450513          	addi	a0,a0,-428 # 80413008 <commands+0x688>
804011bc:	c68ff0ef          	jal	ra,80400624 <__panic>
804011c0:	00040513          	mv	a0,s0
804011c4:	e85ff0ef          	jal	ra,80401048 <print_trapframe>
804011c8:	08842583          	lw	a1,136(s0)
804011cc:	00012517          	auipc	a0,0x12
804011d0:	dfc50513          	addi	a0,a0,-516 # 80412fc8 <commands+0x648>
804011d4:	828ff0ef          	jal	ra,804001fc <cprintf>
804011d8:	08c42583          	lw	a1,140(s0)
804011dc:	00d00793          	li	a5,13
804011e0:	02f58863          	beq	a1,a5,80401210 <pgfault_handler+0x154>
804011e4:	00f00793          	li	a5,15
804011e8:	02f58c63          	beq	a1,a5,80401220 <pgfault_handler+0x164>
804011ec:	00012517          	auipc	a0,0x12
804011f0:	e0050513          	addi	a0,a0,-512 # 80412fec <commands+0x66c>
804011f4:	808ff0ef          	jal	ra,804001fc <cprintf>
804011f8:	00012617          	auipc	a2,0x12
804011fc:	e2460613          	addi	a2,a2,-476 # 8041301c <commands+0x69c>
80401200:	08e00593          	li	a1,142
80401204:	00012517          	auipc	a0,0x12
80401208:	e0450513          	addi	a0,a0,-508 # 80413008 <commands+0x688>
8040120c:	c18ff0ef          	jal	ra,80400624 <__panic>
80401210:	00012517          	auipc	a0,0x12
80401214:	dd450513          	addi	a0,a0,-556 # 80412fe4 <commands+0x664>
80401218:	fe5fe0ef          	jal	ra,804001fc <cprintf>
8040121c:	fddff06f          	j	804011f8 <pgfault_handler+0x13c>
80401220:	00012517          	auipc	a0,0x12
80401224:	dc850513          	addi	a0,a0,-568 # 80412fe8 <commands+0x668>
80401228:	fd5fe0ef          	jal	ra,804001fc <cprintf>
8040122c:	fcdff06f          	j	804011f8 <pgfault_handler+0x13c>

80401230 <interrupt_handler>:
80401230:	08c52783          	lw	a5,140(a0)
80401234:	00b00713          	li	a4,11
80401238:	00179793          	slli	a5,a5,0x1
8040123c:	0017d793          	srli	a5,a5,0x1
80401240:	10f76663          	bltu	a4,a5,8040134c <interrupt_handler+0x11c>
80401244:	00012717          	auipc	a4,0x12
80401248:	a1870713          	addi	a4,a4,-1512 # 80412c5c <commands+0x2dc>
8040124c:	00279793          	slli	a5,a5,0x2
80401250:	00e787b3          	add	a5,a5,a4
80401254:	0007a783          	lw	a5,0(a5)
80401258:	ff010113          	addi	sp,sp,-16
8040125c:	00112623          	sw	ra,12(sp)
80401260:	00e787b3          	add	a5,a5,a4
80401264:	00078067          	jr	a5
80401268:	00c12083          	lw	ra,12(sp)
8040126c:	00012517          	auipc	a0,0x12
80401270:	cb050513          	addi	a0,a0,-848 # 80412f1c <commands+0x59c>
80401274:	01010113          	addi	sp,sp,16
80401278:	f85fe06f          	j	804001fc <cprintf>
8040127c:	00c12083          	lw	ra,12(sp)
80401280:	00012517          	auipc	a0,0x12
80401284:	c7c50513          	addi	a0,a0,-900 # 80412efc <commands+0x57c>
80401288:	01010113          	addi	sp,sp,16
8040128c:	f71fe06f          	j	804001fc <cprintf>
80401290:	00012517          	auipc	a0,0x12
80401294:	c4c50513          	addi	a0,a0,-948 # 80412edc <commands+0x55c>
80401298:	f65fe0ef          	jal	ra,804001fc <cprintf>
8040129c:	d34ff0ef          	jal	ra,804007d0 <serial_intr>
804012a0:	e54ff0ef          	jal	ra,804008f4 <cons_getc>
804012a4:	00c12083          	lw	ra,12(sp)
804012a8:	01010113          	addi	sp,sp,16
804012ac:	4150d06f          	j	8040eec0 <dev_stdin_write>
804012b0:	00c12083          	lw	ra,12(sp)
804012b4:	00012517          	auipc	a0,0x12
804012b8:	c8450513          	addi	a0,a0,-892 # 80412f38 <commands+0x5b8>
804012bc:	01010113          	addi	sp,sp,16
804012c0:	f3dfe06f          	j	804001fc <cprintf>
804012c4:	00c12083          	lw	ra,12(sp)
804012c8:	00012517          	auipc	a0,0x12
804012cc:	ca450513          	addi	a0,a0,-860 # 80412f6c <commands+0x5ec>
804012d0:	01010113          	addi	sp,sp,16
804012d4:	f29fe06f          	j	804001fc <cprintf>
804012d8:	00c12083          	lw	ra,12(sp)
804012dc:	00012517          	auipc	a0,0x12
804012e0:	be450513          	addi	a0,a0,-1052 # 80412ec0 <commands+0x540>
804012e4:	01010113          	addi	sp,sp,16
804012e8:	f15fe06f          	j	804001fc <cprintf>
804012ec:	c24ff0ef          	jal	ra,80400710 <clock_set_next_event>
804012f0:	0009b797          	auipc	a5,0x9b
804012f4:	4fc78793          	addi	a5,a5,1276 # 8049c7ec <ticks>
804012f8:	0007a783          	lw	a5,0(a5)
804012fc:	00178793          	addi	a5,a5,1
80401300:	0009b717          	auipc	a4,0x9b
80401304:	4ef72623          	sw	a5,1260(a4) # 8049c7ec <ticks>
80401308:	1d50b0ef          	jal	ra,8040ccdc <run_timer_list>
8040130c:	f91ff06f          	j	8040129c <interrupt_handler+0x6c>
80401310:	00c12083          	lw	ra,12(sp)
80401314:	00012517          	auipc	a0,0x12
80401318:	c7850513          	addi	a0,a0,-904 # 80412f8c <commands+0x60c>
8040131c:	01010113          	addi	sp,sp,16
80401320:	eddfe06f          	j	804001fc <cprintf>
80401324:	00c12083          	lw	ra,12(sp)
80401328:	00012517          	auipc	a0,0x12
8040132c:	c8450513          	addi	a0,a0,-892 # 80412fac <commands+0x62c>
80401330:	01010113          	addi	sp,sp,16
80401334:	ec9fe06f          	j	804001fc <cprintf>
80401338:	00c12083          	lw	ra,12(sp)
8040133c:	00012517          	auipc	a0,0x12
80401340:	c1450513          	addi	a0,a0,-1004 # 80412f50 <commands+0x5d0>
80401344:	01010113          	addi	sp,sp,16
80401348:	eb5fe06f          	j	804001fc <cprintf>
8040134c:	cfdff06f          	j	80401048 <print_trapframe>

80401350 <exception_handler>:
80401350:	08c52783          	lw	a5,140(a0)
80401354:	00f00713          	li	a4,15
80401358:	22f76263          	bltu	a4,a5,8040157c <exception_handler+0x22c>
8040135c:	00012717          	auipc	a4,0x12
80401360:	93070713          	addi	a4,a4,-1744 # 80412c8c <commands+0x30c>
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
80401390:	a0050513          	addi	a0,a0,-1536 # 80412d8c <commands+0x40c>
80401394:	e69fe0ef          	jal	ra,804001fc <cprintf>
80401398:	08442783          	lw	a5,132(s0)
8040139c:	00c12083          	lw	ra,12(sp)
804013a0:	00412483          	lw	s1,4(sp)
804013a4:	00478793          	addi	a5,a5,4
804013a8:	08f42223          	sw	a5,132(s0)
804013ac:	00812403          	lw	s0,8(sp)
804013b0:	01010113          	addi	sp,sp,16
804013b4:	42d0b06f          	j	8040cfe0 <syscall>
804013b8:	00012517          	auipc	a0,0x12
804013bc:	9f450513          	addi	a0,a0,-1548 # 80412dac <commands+0x42c>
804013c0:	00812403          	lw	s0,8(sp)
804013c4:	00c12083          	lw	ra,12(sp)
804013c8:	00412483          	lw	s1,4(sp)
804013cc:	01010113          	addi	sp,sp,16
804013d0:	e2dfe06f          	j	804001fc <cprintf>
804013d4:	00012517          	auipc	a0,0x12
804013d8:	9f850513          	addi	a0,a0,-1544 # 80412dcc <commands+0x44c>
804013dc:	fe5ff06f          	j	804013c0 <exception_handler+0x70>
804013e0:	00012517          	auipc	a0,0x12
804013e4:	a0c50513          	addi	a0,a0,-1524 # 80412dec <commands+0x46c>
804013e8:	fd9ff06f          	j	804013c0 <exception_handler+0x70>
804013ec:	00012517          	auipc	a0,0x12
804013f0:	a1850513          	addi	a0,a0,-1512 # 80412e04 <commands+0x484>
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
80401420:	a8c50513          	addi	a0,a0,-1396 # 80412ea8 <commands+0x528>
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
80401464:	9d860613          	addi	a2,a2,-1576 # 80412e38 <commands+0x4b8>
80401468:	11900593          	li	a1,281
8040146c:	00012517          	auipc	a0,0x12
80401470:	b9c50513          	addi	a0,a0,-1124 # 80413008 <commands+0x688>
80401474:	9b0ff0ef          	jal	ra,80400624 <__panic>
80401478:	00012517          	auipc	a0,0x12
8040147c:	85450513          	addi	a0,a0,-1964 # 80412ccc <commands+0x34c>
80401480:	f41ff06f          	j	804013c0 <exception_handler+0x70>
80401484:	00012517          	auipc	a0,0x12
80401488:	86850513          	addi	a0,a0,-1944 # 80412cec <commands+0x36c>
8040148c:	f35ff06f          	j	804013c0 <exception_handler+0x70>
80401490:	00012517          	auipc	a0,0x12
80401494:	87850513          	addi	a0,a0,-1928 # 80412d08 <commands+0x388>
80401498:	f29ff06f          	j	804013c0 <exception_handler+0x70>
8040149c:	00012517          	auipc	a0,0x12
804014a0:	88450513          	addi	a0,a0,-1916 # 80412d20 <commands+0x3a0>
804014a4:	f1dff06f          	j	804013c0 <exception_handler+0x70>
804014a8:	00012517          	auipc	a0,0x12
804014ac:	88450513          	addi	a0,a0,-1916 # 80412d2c <commands+0x3ac>
804014b0:	f11ff06f          	j	804013c0 <exception_handler+0x70>
804014b4:	00012517          	auipc	a0,0x12
804014b8:	89450513          	addi	a0,a0,-1900 # 80412d48 <commands+0x3c8>
804014bc:	f05ff06f          	j	804013c0 <exception_handler+0x70>
804014c0:	00012517          	auipc	a0,0x12
804014c4:	89c50513          	addi	a0,a0,-1892 # 80412d5c <commands+0x3dc>
804014c8:	ef9ff06f          	j	804013c0 <exception_handler+0x70>
804014cc:	00012517          	auipc	a0,0x12
804014d0:	8a850513          	addi	a0,a0,-1880 # 80412d74 <commands+0x3f4>
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
80401518:	92460613          	addi	a2,a2,-1756 # 80412e38 <commands+0x4b8>
8040151c:	10800593          	li	a1,264
80401520:	00012517          	auipc	a0,0x12
80401524:	ae850513          	addi	a0,a0,-1304 # 80413008 <commands+0x688>
80401528:	8fcff0ef          	jal	ra,80400624 <__panic>
8040152c:	00012517          	auipc	a0,0x12
80401530:	93c50513          	addi	a0,a0,-1732 # 80412e68 <commands+0x4e8>
80401534:	cc9fe0ef          	jal	ra,804001fc <cprintf>
80401538:	00048693          	mv	a3,s1
8040153c:	00012617          	auipc	a2,0x12
80401540:	94060613          	addi	a2,a2,-1728 # 80412e7c <commands+0x4fc>
80401544:	11c00593          	li	a1,284
80401548:	00012517          	auipc	a0,0x12
8040154c:	ac050513          	addi	a0,a0,-1344 # 80413008 <commands+0x688>
80401550:	8d4ff0ef          	jal	ra,80400624 <__panic>
80401554:	00012517          	auipc	a0,0x12
80401558:	91450513          	addi	a0,a0,-1772 # 80412e68 <commands+0x4e8>
8040155c:	ca1fe0ef          	jal	ra,804001fc <cprintf>
80401560:	00048693          	mv	a3,s1
80401564:	00012617          	auipc	a2,0x12
80401568:	91860613          	addi	a2,a2,-1768 # 80412e7c <commands+0x4fc>
8040156c:	10b00593          	li	a1,267
80401570:	00012517          	auipc	a0,0x12
80401574:	a9850513          	addi	a0,a0,-1384 # 80413008 <commands+0x688>
80401578:	8acff0ef          	jal	ra,80400624 <__panic>
8040157c:	acdff06f          	j	80401048 <print_trapframe>
80401580:	00048693          	mv	a3,s1
80401584:	00012617          	auipc	a2,0x12
80401588:	89460613          	addi	a2,a2,-1900 # 80412e18 <commands+0x498>
8040158c:	10400593          	li	a1,260
80401590:	00012517          	auipc	a0,0x12
80401594:	a7850513          	addi	a0,a0,-1416 # 80413008 <commands+0x688>
80401598:	88cff0ef          	jal	ra,80400624 <__panic>
8040159c:	00048693          	mv	a3,s1
804015a0:	00012617          	auipc	a2,0x12
804015a4:	87860613          	addi	a2,a2,-1928 # 80412e18 <commands+0x498>
804015a8:	11500593          	li	a1,277
804015ac:	00012517          	auipc	a0,0x12
804015b0:	a5c50513          	addi	a0,a0,-1444 # 80413008 <commands+0x688>
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
80401680:	34c0b06f          	j	8040c9cc <schedule>
80401684:	ff700513          	li	a0,-9
80401688:	2d8060ef          	jal	ra,80407960 <do_exit>
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
804017ec:	10200073          	sret

804017f0 <forkrets>:
804017f0:	00050113          	mv	sp,a0
804017f4:	f5dff06f          	j	80401750 <__trapret>

804017f8 <default_init>:
804017f8:	0009b797          	auipc	a5,0x9b
804017fc:	ff878793          	addi	a5,a5,-8 # 8049c7f0 <free_area>
80401800:	00f7a223          	sw	a5,4(a5)
80401804:	00f7a023          	sw	a5,0(a5)
80401808:	0007a423          	sw	zero,8(a5)
8040180c:	00008067          	ret

80401810 <default_nr_free_pages>:
80401810:	0009b797          	auipc	a5,0x9b
80401814:	fe078793          	addi	a5,a5,-32 # 8049c7f0 <free_area>
80401818:	0087a503          	lw	a0,8(a5)
8040181c:	00008067          	ret

80401820 <default_check>:
80401820:	fd010113          	addi	sp,sp,-48
80401824:	03212023          	sw	s2,32(sp)
80401828:	0009b917          	auipc	s2,0x9b
8040182c:	fc890913          	addi	s2,s2,-56 # 8049c7f0 <free_area>
80401830:	00492783          	lw	a5,4(s2)
80401834:	02112623          	sw	ra,44(sp)
80401838:	02812423          	sw	s0,40(sp)
8040183c:	02912223          	sw	s1,36(sp)
80401840:	01312e23          	sw	s3,28(sp)
80401844:	01412c23          	sw	s4,24(sp)
80401848:	01512a23          	sw	s5,20(sp)
8040184c:	01612823          	sw	s6,16(sp)
80401850:	01712623          	sw	s7,12(sp)
80401854:	01812423          	sw	s8,8(sp)
80401858:	3d278e63          	beq	a5,s2,80401c34 <default_check+0x414>
8040185c:	ff87a703          	lw	a4,-8(a5)
80401860:	00175713          	srli	a4,a4,0x1
80401864:	00177713          	andi	a4,a4,1
80401868:	3c070e63          	beqz	a4,80401c44 <default_check+0x424>
8040186c:	00000413          	li	s0,0
80401870:	00000493          	li	s1,0
80401874:	0100006f          	j	80401884 <default_check+0x64>
80401878:	ff87a703          	lw	a4,-8(a5)
8040187c:	00277713          	andi	a4,a4,2
80401880:	3c070263          	beqz	a4,80401c44 <default_check+0x424>
80401884:	ffc7a703          	lw	a4,-4(a5)
80401888:	0047a783          	lw	a5,4(a5)
8040188c:	00148493          	addi	s1,s1,1
80401890:	00e40433          	add	s0,s0,a4
80401894:	00040993          	mv	s3,s0
80401898:	ff2790e3          	bne	a5,s2,80401878 <default_check+0x58>
8040189c:	59c010ef          	jal	ra,80402e38 <nr_free_pages>
804018a0:	013512e3          	bne	a0,s3,804020a4 <default_check+0x884>
804018a4:	00100513          	li	a0,1
804018a8:	45c010ef          	jal	ra,80402d04 <alloc_pages>
804018ac:	00050a13          	mv	s4,a0
804018b0:	52050a63          	beqz	a0,80401de4 <default_check+0x5c4>
804018b4:	00100513          	li	a0,1
804018b8:	44c010ef          	jal	ra,80402d04 <alloc_pages>
804018bc:	00050993          	mv	s3,a0
804018c0:	000502e3          	beqz	a0,804020c4 <default_check+0x8a4>
804018c4:	00100513          	li	a0,1
804018c8:	43c010ef          	jal	ra,80402d04 <alloc_pages>
804018cc:	00050a93          	mv	s5,a0
804018d0:	58050a63          	beqz	a0,80401e64 <default_check+0x644>
804018d4:	393a0863          	beq	s4,s3,80401c64 <default_check+0x444>
804018d8:	38aa0663          	beq	s4,a0,80401c64 <default_check+0x444>
804018dc:	38a98463          	beq	s3,a0,80401c64 <default_check+0x444>
804018e0:	000a2783          	lw	a5,0(s4)
804018e4:	3a079063          	bnez	a5,80401c84 <default_check+0x464>
804018e8:	0009a783          	lw	a5,0(s3)
804018ec:	38079c63          	bnez	a5,80401c84 <default_check+0x464>
804018f0:	00052783          	lw	a5,0(a0)
804018f4:	38079863          	bnez	a5,80401c84 <default_check+0x464>
804018f8:	0009b797          	auipc	a5,0x9b
804018fc:	f1078793          	addi	a5,a5,-240 # 8049c808 <pages>
80401900:	0007a783          	lw	a5,0(a5)
80401904:	00014717          	auipc	a4,0x14
80401908:	76070713          	addi	a4,a4,1888 # 80416064 <nbase>
8040190c:	00072603          	lw	a2,0(a4)
80401910:	0009b717          	auipc	a4,0x9b
80401914:	e8870713          	addi	a4,a4,-376 # 8049c798 <npage>
80401918:	00072683          	lw	a3,0(a4)
8040191c:	40fa0733          	sub	a4,s4,a5
80401920:	40575713          	srai	a4,a4,0x5
80401924:	00c70733          	add	a4,a4,a2
80401928:	00c69693          	slli	a3,a3,0xc
8040192c:	00c71713          	slli	a4,a4,0xc
80401930:	36d77a63          	bgeu	a4,a3,80401ca4 <default_check+0x484>
80401934:	40f98733          	sub	a4,s3,a5
80401938:	40575713          	srai	a4,a4,0x5
8040193c:	00c70733          	add	a4,a4,a2
80401940:	00c71713          	slli	a4,a4,0xc
80401944:	5ad77063          	bgeu	a4,a3,80401ee4 <default_check+0x6c4>
80401948:	40f507b3          	sub	a5,a0,a5
8040194c:	4057d793          	srai	a5,a5,0x5
80401950:	00c787b3          	add	a5,a5,a2
80401954:	00c79793          	slli	a5,a5,0xc
80401958:	3ed7f663          	bgeu	a5,a3,80401d44 <default_check+0x524>
8040195c:	00100513          	li	a0,1
80401960:	00092c03          	lw	s8,0(s2)
80401964:	00492b83          	lw	s7,4(s2)
80401968:	00892b03          	lw	s6,8(s2)
8040196c:	0009b797          	auipc	a5,0x9b
80401970:	e927a423          	sw	s2,-376(a5) # 8049c7f4 <free_area+0x4>
80401974:	0009b797          	auipc	a5,0x9b
80401978:	e727ae23          	sw	s2,-388(a5) # 8049c7f0 <free_area>
8040197c:	0009b797          	auipc	a5,0x9b
80401980:	e607ae23          	sw	zero,-388(a5) # 8049c7f8 <free_area+0x8>
80401984:	380010ef          	jal	ra,80402d04 <alloc_pages>
80401988:	38051e63          	bnez	a0,80401d24 <default_check+0x504>
8040198c:	00100593          	li	a1,1
80401990:	000a0513          	mv	a0,s4
80401994:	438010ef          	jal	ra,80402dcc <free_pages>
80401998:	00100593          	li	a1,1
8040199c:	00098513          	mv	a0,s3
804019a0:	42c010ef          	jal	ra,80402dcc <free_pages>
804019a4:	00100593          	li	a1,1
804019a8:	000a8513          	mv	a0,s5
804019ac:	420010ef          	jal	ra,80402dcc <free_pages>
804019b0:	00892703          	lw	a4,8(s2)
804019b4:	00300793          	li	a5,3
804019b8:	34f71663          	bne	a4,a5,80401d04 <default_check+0x4e4>
804019bc:	00100513          	li	a0,1
804019c0:	344010ef          	jal	ra,80402d04 <alloc_pages>
804019c4:	00050993          	mv	s3,a0
804019c8:	30050e63          	beqz	a0,80401ce4 <default_check+0x4c4>
804019cc:	00100513          	li	a0,1
804019d0:	334010ef          	jal	ra,80402d04 <alloc_pages>
804019d4:	00050a93          	mv	s5,a0
804019d8:	46050663          	beqz	a0,80401e44 <default_check+0x624>
804019dc:	00100513          	li	a0,1
804019e0:	324010ef          	jal	ra,80402d04 <alloc_pages>
804019e4:	00050a13          	mv	s4,a0
804019e8:	42050e63          	beqz	a0,80401e24 <default_check+0x604>
804019ec:	00100513          	li	a0,1
804019f0:	314010ef          	jal	ra,80402d04 <alloc_pages>
804019f4:	40051863          	bnez	a0,80401e04 <default_check+0x5e4>
804019f8:	00100593          	li	a1,1
804019fc:	00098513          	mv	a0,s3
80401a00:	3cc010ef          	jal	ra,80402dcc <free_pages>
80401a04:	00492783          	lw	a5,4(s2)
80401a08:	2b278e63          	beq	a5,s2,80401cc4 <default_check+0x4a4>
80401a0c:	00100513          	li	a0,1
80401a10:	2f4010ef          	jal	ra,80402d04 <alloc_pages>
80401a14:	3aa99863          	bne	s3,a0,80401dc4 <default_check+0x5a4>
80401a18:	00100513          	li	a0,1
80401a1c:	2e8010ef          	jal	ra,80402d04 <alloc_pages>
80401a20:	38051263          	bnez	a0,80401da4 <default_check+0x584>
80401a24:	00892783          	lw	a5,8(s2)
80401a28:	34079e63          	bnez	a5,80401d84 <default_check+0x564>
80401a2c:	00098513          	mv	a0,s3
80401a30:	00100593          	li	a1,1
80401a34:	0009b797          	auipc	a5,0x9b
80401a38:	db87ae23          	sw	s8,-580(a5) # 8049c7f0 <free_area>
80401a3c:	0009b797          	auipc	a5,0x9b
80401a40:	db77ac23          	sw	s7,-584(a5) # 8049c7f4 <free_area+0x4>
80401a44:	0009b797          	auipc	a5,0x9b
80401a48:	db67aa23          	sw	s6,-588(a5) # 8049c7f8 <free_area+0x8>
80401a4c:	380010ef          	jal	ra,80402dcc <free_pages>
80401a50:	00100593          	li	a1,1
80401a54:	000a8513          	mv	a0,s5
80401a58:	374010ef          	jal	ra,80402dcc <free_pages>
80401a5c:	00100593          	li	a1,1
80401a60:	000a0513          	mv	a0,s4
80401a64:	368010ef          	jal	ra,80402dcc <free_pages>
80401a68:	00500513          	li	a0,5
80401a6c:	298010ef          	jal	ra,80402d04 <alloc_pages>
80401a70:	00050993          	mv	s3,a0
80401a74:	2e050863          	beqz	a0,80401d64 <default_check+0x544>
80401a78:	00452783          	lw	a5,4(a0)
80401a7c:	0017d793          	srli	a5,a5,0x1
80401a80:	0017f793          	andi	a5,a5,1
80401a84:	5c079063          	bnez	a5,80402044 <default_check+0x824>
80401a88:	00100513          	li	a0,1
80401a8c:	00092b03          	lw	s6,0(s2)
80401a90:	00492a83          	lw	s5,4(s2)
80401a94:	0009b797          	auipc	a5,0x9b
80401a98:	d527ae23          	sw	s2,-676(a5) # 8049c7f0 <free_area>
80401a9c:	0009b797          	auipc	a5,0x9b
80401aa0:	d527ac23          	sw	s2,-680(a5) # 8049c7f4 <free_area+0x4>
80401aa4:	260010ef          	jal	ra,80402d04 <alloc_pages>
80401aa8:	56051e63          	bnez	a0,80402024 <default_check+0x804>
80401aac:	04098a13          	addi	s4,s3,64
80401ab0:	000a0513          	mv	a0,s4
80401ab4:	00300593          	li	a1,3
80401ab8:	00892b83          	lw	s7,8(s2)
80401abc:	0009b797          	auipc	a5,0x9b
80401ac0:	d207ae23          	sw	zero,-708(a5) # 8049c7f8 <free_area+0x8>
80401ac4:	308010ef          	jal	ra,80402dcc <free_pages>
80401ac8:	00400513          	li	a0,4
80401acc:	238010ef          	jal	ra,80402d04 <alloc_pages>
80401ad0:	52051a63          	bnez	a0,80402004 <default_check+0x7e4>
80401ad4:	0449a783          	lw	a5,68(s3)
80401ad8:	0017d793          	srli	a5,a5,0x1
80401adc:	0017f793          	andi	a5,a5,1
80401ae0:	50078263          	beqz	a5,80401fe4 <default_check+0x7c4>
80401ae4:	0489a703          	lw	a4,72(s3)
80401ae8:	00300793          	li	a5,3
80401aec:	4ef71c63          	bne	a4,a5,80401fe4 <default_check+0x7c4>
80401af0:	00300513          	li	a0,3
80401af4:	210010ef          	jal	ra,80402d04 <alloc_pages>
80401af8:	00050c13          	mv	s8,a0
80401afc:	4c050463          	beqz	a0,80401fc4 <default_check+0x7a4>
80401b00:	00100513          	li	a0,1
80401b04:	200010ef          	jal	ra,80402d04 <alloc_pages>
80401b08:	48051e63          	bnez	a0,80401fa4 <default_check+0x784>
80401b0c:	478a1c63          	bne	s4,s8,80401f84 <default_check+0x764>
80401b10:	00100593          	li	a1,1
80401b14:	00098513          	mv	a0,s3
80401b18:	2b4010ef          	jal	ra,80402dcc <free_pages>
80401b1c:	00300593          	li	a1,3
80401b20:	000a0513          	mv	a0,s4
80401b24:	2a8010ef          	jal	ra,80402dcc <free_pages>
80401b28:	0049a783          	lw	a5,4(s3)
80401b2c:	02098c13          	addi	s8,s3,32
80401b30:	0017d793          	srli	a5,a5,0x1
80401b34:	0017f793          	andi	a5,a5,1
80401b38:	42078663          	beqz	a5,80401f64 <default_check+0x744>
80401b3c:	0089a703          	lw	a4,8(s3)
80401b40:	00100793          	li	a5,1
80401b44:	42f71063          	bne	a4,a5,80401f64 <default_check+0x744>
80401b48:	004a2783          	lw	a5,4(s4)
80401b4c:	0017d793          	srli	a5,a5,0x1
80401b50:	0017f793          	andi	a5,a5,1
80401b54:	3e078863          	beqz	a5,80401f44 <default_check+0x724>
80401b58:	008a2703          	lw	a4,8(s4)
80401b5c:	00300793          	li	a5,3
80401b60:	3ef71263          	bne	a4,a5,80401f44 <default_check+0x724>
80401b64:	00100513          	li	a0,1
80401b68:	19c010ef          	jal	ra,80402d04 <alloc_pages>
80401b6c:	3aa99c63          	bne	s3,a0,80401f24 <default_check+0x704>
80401b70:	00100593          	li	a1,1
80401b74:	258010ef          	jal	ra,80402dcc <free_pages>
80401b78:	00200513          	li	a0,2
80401b7c:	188010ef          	jal	ra,80402d04 <alloc_pages>
80401b80:	38aa1263          	bne	s4,a0,80401f04 <default_check+0x6e4>
80401b84:	00200593          	li	a1,2
80401b88:	244010ef          	jal	ra,80402dcc <free_pages>
80401b8c:	00100593          	li	a1,1
80401b90:	000c0513          	mv	a0,s8
80401b94:	238010ef          	jal	ra,80402dcc <free_pages>
80401b98:	00500513          	li	a0,5
80401b9c:	168010ef          	jal	ra,80402d04 <alloc_pages>
80401ba0:	00050993          	mv	s3,a0
80401ba4:	4c050063          	beqz	a0,80402064 <default_check+0x844>
80401ba8:	00100513          	li	a0,1
80401bac:	158010ef          	jal	ra,80402d04 <alloc_pages>
80401bb0:	30051a63          	bnez	a0,80401ec4 <default_check+0x6a4>
80401bb4:	00892783          	lw	a5,8(s2)
80401bb8:	2e079663          	bnez	a5,80401ea4 <default_check+0x684>
80401bbc:	00500593          	li	a1,5
80401bc0:	00098513          	mv	a0,s3
80401bc4:	0009b797          	auipc	a5,0x9b
80401bc8:	c377aa23          	sw	s7,-972(a5) # 8049c7f8 <free_area+0x8>
80401bcc:	0009b797          	auipc	a5,0x9b
80401bd0:	c367a223          	sw	s6,-988(a5) # 8049c7f0 <free_area>
80401bd4:	0009b797          	auipc	a5,0x9b
80401bd8:	c357a023          	sw	s5,-992(a5) # 8049c7f4 <free_area+0x4>
80401bdc:	1f0010ef          	jal	ra,80402dcc <free_pages>
80401be0:	00492783          	lw	a5,4(s2)
80401be4:	01278c63          	beq	a5,s2,80401bfc <default_check+0x3dc>
80401be8:	ffc7a703          	lw	a4,-4(a5)
80401bec:	0047a783          	lw	a5,4(a5)
80401bf0:	fff48493          	addi	s1,s1,-1
80401bf4:	40e40433          	sub	s0,s0,a4
80401bf8:	ff2798e3          	bne	a5,s2,80401be8 <default_check+0x3c8>
80401bfc:	28049463          	bnez	s1,80401e84 <default_check+0x664>
80401c00:	48041263          	bnez	s0,80402084 <default_check+0x864>
80401c04:	02c12083          	lw	ra,44(sp)
80401c08:	02812403          	lw	s0,40(sp)
80401c0c:	02412483          	lw	s1,36(sp)
80401c10:	02012903          	lw	s2,32(sp)
80401c14:	01c12983          	lw	s3,28(sp)
80401c18:	01812a03          	lw	s4,24(sp)
80401c1c:	01412a83          	lw	s5,20(sp)
80401c20:	01012b03          	lw	s6,16(sp)
80401c24:	00c12b83          	lw	s7,12(sp)
80401c28:	00812c03          	lw	s8,8(sp)
80401c2c:	03010113          	addi	sp,sp,48
80401c30:	00008067          	ret
80401c34:	00000993          	li	s3,0
80401c38:	00000413          	li	s0,0
80401c3c:	00000493          	li	s1,0
80401c40:	c5dff06f          	j	8040189c <default_check+0x7c>
80401c44:	00011697          	auipc	a3,0x11
80401c48:	6d468693          	addi	a3,a3,1748 # 80413318 <commands+0x998>
80401c4c:	00011617          	auipc	a2,0x11
80401c50:	ef060613          	addi	a2,a2,-272 # 80412b3c <commands+0x1bc>
80401c54:	0f000593          	li	a1,240
80401c58:	00011517          	auipc	a0,0x11
80401c5c:	6d050513          	addi	a0,a0,1744 # 80413328 <commands+0x9a8>
80401c60:	9c5fe0ef          	jal	ra,80400624 <__panic>
80401c64:	00011697          	auipc	a3,0x11
80401c68:	74c68693          	addi	a3,a3,1868 # 804133b0 <commands+0xa30>
80401c6c:	00011617          	auipc	a2,0x11
80401c70:	ed060613          	addi	a2,a2,-304 # 80412b3c <commands+0x1bc>
80401c74:	0bd00593          	li	a1,189
80401c78:	00011517          	auipc	a0,0x11
80401c7c:	6b050513          	addi	a0,a0,1712 # 80413328 <commands+0x9a8>
80401c80:	9a5fe0ef          	jal	ra,80400624 <__panic>
80401c84:	00011697          	auipc	a3,0x11
80401c88:	75068693          	addi	a3,a3,1872 # 804133d4 <commands+0xa54>
80401c8c:	00011617          	auipc	a2,0x11
80401c90:	eb060613          	addi	a2,a2,-336 # 80412b3c <commands+0x1bc>
80401c94:	0be00593          	li	a1,190
80401c98:	00011517          	auipc	a0,0x11
80401c9c:	69050513          	addi	a0,a0,1680 # 80413328 <commands+0x9a8>
80401ca0:	985fe0ef          	jal	ra,80400624 <__panic>
80401ca4:	00011697          	auipc	a3,0x11
80401ca8:	76c68693          	addi	a3,a3,1900 # 80413410 <commands+0xa90>
80401cac:	00011617          	auipc	a2,0x11
80401cb0:	e9060613          	addi	a2,a2,-368 # 80412b3c <commands+0x1bc>
80401cb4:	0c000593          	li	a1,192
80401cb8:	00011517          	auipc	a0,0x11
80401cbc:	67050513          	addi	a0,a0,1648 # 80413328 <commands+0x9a8>
80401cc0:	965fe0ef          	jal	ra,80400624 <__panic>
80401cc4:	00011697          	auipc	a3,0x11
80401cc8:	7d468693          	addi	a3,a3,2004 # 80413498 <commands+0xb18>
80401ccc:	00011617          	auipc	a2,0x11
80401cd0:	e7060613          	addi	a2,a2,-400 # 80412b3c <commands+0x1bc>
80401cd4:	0d900593          	li	a1,217
80401cd8:	00011517          	auipc	a0,0x11
80401cdc:	65050513          	addi	a0,a0,1616 # 80413328 <commands+0x9a8>
80401ce0:	945fe0ef          	jal	ra,80400624 <__panic>
80401ce4:	00011697          	auipc	a3,0x11
80401ce8:	67868693          	addi	a3,a3,1656 # 8041335c <commands+0x9dc>
80401cec:	00011617          	auipc	a2,0x11
80401cf0:	e5060613          	addi	a2,a2,-432 # 80412b3c <commands+0x1bc>
80401cf4:	0d200593          	li	a1,210
80401cf8:	00011517          	auipc	a0,0x11
80401cfc:	63050513          	addi	a0,a0,1584 # 80413328 <commands+0x9a8>
80401d00:	925fe0ef          	jal	ra,80400624 <__panic>
80401d04:	00011697          	auipc	a3,0x11
80401d08:	78468693          	addi	a3,a3,1924 # 80413488 <commands+0xb08>
80401d0c:	00011617          	auipc	a2,0x11
80401d10:	e3060613          	addi	a2,a2,-464 # 80412b3c <commands+0x1bc>
80401d14:	0d000593          	li	a1,208
80401d18:	00011517          	auipc	a0,0x11
80401d1c:	61050513          	addi	a0,a0,1552 # 80413328 <commands+0x9a8>
80401d20:	905fe0ef          	jal	ra,80400624 <__panic>
80401d24:	00011697          	auipc	a3,0x11
80401d28:	74c68693          	addi	a3,a3,1868 # 80413470 <commands+0xaf0>
80401d2c:	00011617          	auipc	a2,0x11
80401d30:	e1060613          	addi	a2,a2,-496 # 80412b3c <commands+0x1bc>
80401d34:	0cb00593          	li	a1,203
80401d38:	00011517          	auipc	a0,0x11
80401d3c:	5f050513          	addi	a0,a0,1520 # 80413328 <commands+0x9a8>
80401d40:	8e5fe0ef          	jal	ra,80400624 <__panic>
80401d44:	00011697          	auipc	a3,0x11
80401d48:	70c68693          	addi	a3,a3,1804 # 80413450 <commands+0xad0>
80401d4c:	00011617          	auipc	a2,0x11
80401d50:	df060613          	addi	a2,a2,-528 # 80412b3c <commands+0x1bc>
80401d54:	0c200593          	li	a1,194
80401d58:	00011517          	auipc	a0,0x11
80401d5c:	5d050513          	addi	a0,a0,1488 # 80413328 <commands+0x9a8>
80401d60:	8c5fe0ef          	jal	ra,80400624 <__panic>
80401d64:	00011697          	auipc	a3,0x11
80401d68:	77868693          	addi	a3,a3,1912 # 804134dc <commands+0xb5c>
80401d6c:	00011617          	auipc	a2,0x11
80401d70:	dd060613          	addi	a2,a2,-560 # 80412b3c <commands+0x1bc>
80401d74:	0f800593          	li	a1,248
80401d78:	00011517          	auipc	a0,0x11
80401d7c:	5b050513          	addi	a0,a0,1456 # 80413328 <commands+0x9a8>
80401d80:	8a5fe0ef          	jal	ra,80400624 <__panic>
80401d84:	00011697          	auipc	a3,0x11
80401d88:	74868693          	addi	a3,a3,1864 # 804134cc <commands+0xb4c>
80401d8c:	00011617          	auipc	a2,0x11
80401d90:	db060613          	addi	a2,a2,-592 # 80412b3c <commands+0x1bc>
80401d94:	0df00593          	li	a1,223
80401d98:	00011517          	auipc	a0,0x11
80401d9c:	59050513          	addi	a0,a0,1424 # 80413328 <commands+0x9a8>
80401da0:	885fe0ef          	jal	ra,80400624 <__panic>
80401da4:	00011697          	auipc	a3,0x11
80401da8:	6cc68693          	addi	a3,a3,1740 # 80413470 <commands+0xaf0>
80401dac:	00011617          	auipc	a2,0x11
80401db0:	d9060613          	addi	a2,a2,-624 # 80412b3c <commands+0x1bc>
80401db4:	0dd00593          	li	a1,221
80401db8:	00011517          	auipc	a0,0x11
80401dbc:	57050513          	addi	a0,a0,1392 # 80413328 <commands+0x9a8>
80401dc0:	865fe0ef          	jal	ra,80400624 <__panic>
80401dc4:	00011697          	auipc	a3,0x11
80401dc8:	6ec68693          	addi	a3,a3,1772 # 804134b0 <commands+0xb30>
80401dcc:	00011617          	auipc	a2,0x11
80401dd0:	d7060613          	addi	a2,a2,-656 # 80412b3c <commands+0x1bc>
80401dd4:	0dc00593          	li	a1,220
80401dd8:	00011517          	auipc	a0,0x11
80401ddc:	55050513          	addi	a0,a0,1360 # 80413328 <commands+0x9a8>
80401de0:	845fe0ef          	jal	ra,80400624 <__panic>
80401de4:	00011697          	auipc	a3,0x11
80401de8:	57868693          	addi	a3,a3,1400 # 8041335c <commands+0x9dc>
80401dec:	00011617          	auipc	a2,0x11
80401df0:	d5060613          	addi	a2,a2,-688 # 80412b3c <commands+0x1bc>
80401df4:	0b900593          	li	a1,185
80401df8:	00011517          	auipc	a0,0x11
80401dfc:	53050513          	addi	a0,a0,1328 # 80413328 <commands+0x9a8>
80401e00:	825fe0ef          	jal	ra,80400624 <__panic>
80401e04:	00011697          	auipc	a3,0x11
80401e08:	66c68693          	addi	a3,a3,1644 # 80413470 <commands+0xaf0>
80401e0c:	00011617          	auipc	a2,0x11
80401e10:	d3060613          	addi	a2,a2,-720 # 80412b3c <commands+0x1bc>
80401e14:	0d600593          	li	a1,214
80401e18:	00011517          	auipc	a0,0x11
80401e1c:	51050513          	addi	a0,a0,1296 # 80413328 <commands+0x9a8>
80401e20:	805fe0ef          	jal	ra,80400624 <__panic>
80401e24:	00011697          	auipc	a3,0x11
80401e28:	57068693          	addi	a3,a3,1392 # 80413394 <commands+0xa14>
80401e2c:	00011617          	auipc	a2,0x11
80401e30:	d1060613          	addi	a2,a2,-752 # 80412b3c <commands+0x1bc>
80401e34:	0d400593          	li	a1,212
80401e38:	00011517          	auipc	a0,0x11
80401e3c:	4f050513          	addi	a0,a0,1264 # 80413328 <commands+0x9a8>
80401e40:	fe4fe0ef          	jal	ra,80400624 <__panic>
80401e44:	00011697          	auipc	a3,0x11
80401e48:	53468693          	addi	a3,a3,1332 # 80413378 <commands+0x9f8>
80401e4c:	00011617          	auipc	a2,0x11
80401e50:	cf060613          	addi	a2,a2,-784 # 80412b3c <commands+0x1bc>
80401e54:	0d300593          	li	a1,211
80401e58:	00011517          	auipc	a0,0x11
80401e5c:	4d050513          	addi	a0,a0,1232 # 80413328 <commands+0x9a8>
80401e60:	fc4fe0ef          	jal	ra,80400624 <__panic>
80401e64:	00011697          	auipc	a3,0x11
80401e68:	53068693          	addi	a3,a3,1328 # 80413394 <commands+0xa14>
80401e6c:	00011617          	auipc	a2,0x11
80401e70:	cd060613          	addi	a2,a2,-816 # 80412b3c <commands+0x1bc>
80401e74:	0bb00593          	li	a1,187
80401e78:	00011517          	auipc	a0,0x11
80401e7c:	4b050513          	addi	a0,a0,1200 # 80413328 <commands+0x9a8>
80401e80:	fa4fe0ef          	jal	ra,80400624 <__panic>
80401e84:	00011697          	auipc	a3,0x11
80401e88:	79c68693          	addi	a3,a3,1948 # 80413620 <commands+0xca0>
80401e8c:	00011617          	auipc	a2,0x11
80401e90:	cb060613          	addi	a2,a2,-848 # 80412b3c <commands+0x1bc>
80401e94:	12500593          	li	a1,293
80401e98:	00011517          	auipc	a0,0x11
80401e9c:	49050513          	addi	a0,a0,1168 # 80413328 <commands+0x9a8>
80401ea0:	f84fe0ef          	jal	ra,80400624 <__panic>
80401ea4:	00011697          	auipc	a3,0x11
80401ea8:	62868693          	addi	a3,a3,1576 # 804134cc <commands+0xb4c>
80401eac:	00011617          	auipc	a2,0x11
80401eb0:	c9060613          	addi	a2,a2,-880 # 80412b3c <commands+0x1bc>
80401eb4:	11a00593          	li	a1,282
80401eb8:	00011517          	auipc	a0,0x11
80401ebc:	47050513          	addi	a0,a0,1136 # 80413328 <commands+0x9a8>
80401ec0:	f64fe0ef          	jal	ra,80400624 <__panic>
80401ec4:	00011697          	auipc	a3,0x11
80401ec8:	5ac68693          	addi	a3,a3,1452 # 80413470 <commands+0xaf0>
80401ecc:	00011617          	auipc	a2,0x11
80401ed0:	c7060613          	addi	a2,a2,-912 # 80412b3c <commands+0x1bc>
80401ed4:	11800593          	li	a1,280
80401ed8:	00011517          	auipc	a0,0x11
80401edc:	45050513          	addi	a0,a0,1104 # 80413328 <commands+0x9a8>
80401ee0:	f44fe0ef          	jal	ra,80400624 <__panic>
80401ee4:	00011697          	auipc	a3,0x11
80401ee8:	54c68693          	addi	a3,a3,1356 # 80413430 <commands+0xab0>
80401eec:	00011617          	auipc	a2,0x11
80401ef0:	c5060613          	addi	a2,a2,-944 # 80412b3c <commands+0x1bc>
80401ef4:	0c100593          	li	a1,193
80401ef8:	00011517          	auipc	a0,0x11
80401efc:	43050513          	addi	a0,a0,1072 # 80413328 <commands+0x9a8>
80401f00:	f24fe0ef          	jal	ra,80400624 <__panic>
80401f04:	00011697          	auipc	a3,0x11
80401f08:	6dc68693          	addi	a3,a3,1756 # 804135e0 <commands+0xc60>
80401f0c:	00011617          	auipc	a2,0x11
80401f10:	c3060613          	addi	a2,a2,-976 # 80412b3c <commands+0x1bc>
80401f14:	11200593          	li	a1,274
80401f18:	00011517          	auipc	a0,0x11
80401f1c:	41050513          	addi	a0,a0,1040 # 80413328 <commands+0x9a8>
80401f20:	f04fe0ef          	jal	ra,80400624 <__panic>
80401f24:	00011697          	auipc	a3,0x11
80401f28:	69c68693          	addi	a3,a3,1692 # 804135c0 <commands+0xc40>
80401f2c:	00011617          	auipc	a2,0x11
80401f30:	c1060613          	addi	a2,a2,-1008 # 80412b3c <commands+0x1bc>
80401f34:	11000593          	li	a1,272
80401f38:	00011517          	auipc	a0,0x11
80401f3c:	3f050513          	addi	a0,a0,1008 # 80413328 <commands+0x9a8>
80401f40:	ee4fe0ef          	jal	ra,80400624 <__panic>
80401f44:	00011697          	auipc	a3,0x11
80401f48:	65468693          	addi	a3,a3,1620 # 80413598 <commands+0xc18>
80401f4c:	00011617          	auipc	a2,0x11
80401f50:	bf060613          	addi	a2,a2,-1040 # 80412b3c <commands+0x1bc>
80401f54:	10e00593          	li	a1,270
80401f58:	00011517          	auipc	a0,0x11
80401f5c:	3d050513          	addi	a0,a0,976 # 80413328 <commands+0x9a8>
80401f60:	ec4fe0ef          	jal	ra,80400624 <__panic>
80401f64:	00011697          	auipc	a3,0x11
80401f68:	60c68693          	addi	a3,a3,1548 # 80413570 <commands+0xbf0>
80401f6c:	00011617          	auipc	a2,0x11
80401f70:	bd060613          	addi	a2,a2,-1072 # 80412b3c <commands+0x1bc>
80401f74:	10d00593          	li	a1,269
80401f78:	00011517          	auipc	a0,0x11
80401f7c:	3b050513          	addi	a0,a0,944 # 80413328 <commands+0x9a8>
80401f80:	ea4fe0ef          	jal	ra,80400624 <__panic>
80401f84:	00011697          	auipc	a3,0x11
80401f88:	5dc68693          	addi	a3,a3,1500 # 80413560 <commands+0xbe0>
80401f8c:	00011617          	auipc	a2,0x11
80401f90:	bb060613          	addi	a2,a2,-1104 # 80412b3c <commands+0x1bc>
80401f94:	10800593          	li	a1,264
80401f98:	00011517          	auipc	a0,0x11
80401f9c:	39050513          	addi	a0,a0,912 # 80413328 <commands+0x9a8>
80401fa0:	e84fe0ef          	jal	ra,80400624 <__panic>
80401fa4:	00011697          	auipc	a3,0x11
80401fa8:	4cc68693          	addi	a3,a3,1228 # 80413470 <commands+0xaf0>
80401fac:	00011617          	auipc	a2,0x11
80401fb0:	b9060613          	addi	a2,a2,-1136 # 80412b3c <commands+0x1bc>
80401fb4:	10700593          	li	a1,263
80401fb8:	00011517          	auipc	a0,0x11
80401fbc:	37050513          	addi	a0,a0,880 # 80413328 <commands+0x9a8>
80401fc0:	e64fe0ef          	jal	ra,80400624 <__panic>
80401fc4:	00011697          	auipc	a3,0x11
80401fc8:	57c68693          	addi	a3,a3,1404 # 80413540 <commands+0xbc0>
80401fcc:	00011617          	auipc	a2,0x11
80401fd0:	b7060613          	addi	a2,a2,-1168 # 80412b3c <commands+0x1bc>
80401fd4:	10600593          	li	a1,262
80401fd8:	00011517          	auipc	a0,0x11
80401fdc:	35050513          	addi	a0,a0,848 # 80413328 <commands+0x9a8>
80401fe0:	e44fe0ef          	jal	ra,80400624 <__panic>
80401fe4:	00011697          	auipc	a3,0x11
80401fe8:	53068693          	addi	a3,a3,1328 # 80413514 <commands+0xb94>
80401fec:	00011617          	auipc	a2,0x11
80401ff0:	b5060613          	addi	a2,a2,-1200 # 80412b3c <commands+0x1bc>
80401ff4:	10500593          	li	a1,261
80401ff8:	00011517          	auipc	a0,0x11
80401ffc:	33050513          	addi	a0,a0,816 # 80413328 <commands+0x9a8>
80402000:	e24fe0ef          	jal	ra,80400624 <__panic>
80402004:	00011697          	auipc	a3,0x11
80402008:	4f868693          	addi	a3,a3,1272 # 804134fc <commands+0xb7c>
8040200c:	00011617          	auipc	a2,0x11
80402010:	b3060613          	addi	a2,a2,-1232 # 80412b3c <commands+0x1bc>
80402014:	10400593          	li	a1,260
80402018:	00011517          	auipc	a0,0x11
8040201c:	31050513          	addi	a0,a0,784 # 80413328 <commands+0x9a8>
80402020:	e04fe0ef          	jal	ra,80400624 <__panic>
80402024:	00011697          	auipc	a3,0x11
80402028:	44c68693          	addi	a3,a3,1100 # 80413470 <commands+0xaf0>
8040202c:	00011617          	auipc	a2,0x11
80402030:	b1060613          	addi	a2,a2,-1264 # 80412b3c <commands+0x1bc>
80402034:	0fe00593          	li	a1,254
80402038:	00011517          	auipc	a0,0x11
8040203c:	2f050513          	addi	a0,a0,752 # 80413328 <commands+0x9a8>
80402040:	de4fe0ef          	jal	ra,80400624 <__panic>
80402044:	00011697          	auipc	a3,0x11
80402048:	4a468693          	addi	a3,a3,1188 # 804134e8 <commands+0xb68>
8040204c:	00011617          	auipc	a2,0x11
80402050:	af060613          	addi	a2,a2,-1296 # 80412b3c <commands+0x1bc>
80402054:	0f900593          	li	a1,249
80402058:	00011517          	auipc	a0,0x11
8040205c:	2d050513          	addi	a0,a0,720 # 80413328 <commands+0x9a8>
80402060:	dc4fe0ef          	jal	ra,80400624 <__panic>
80402064:	00011697          	auipc	a3,0x11
80402068:	59c68693          	addi	a3,a3,1436 # 80413600 <commands+0xc80>
8040206c:	00011617          	auipc	a2,0x11
80402070:	ad060613          	addi	a2,a2,-1328 # 80412b3c <commands+0x1bc>
80402074:	11700593          	li	a1,279
80402078:	00011517          	auipc	a0,0x11
8040207c:	2b050513          	addi	a0,a0,688 # 80413328 <commands+0x9a8>
80402080:	da4fe0ef          	jal	ra,80400624 <__panic>
80402084:	00011697          	auipc	a3,0x11
80402088:	5a868693          	addi	a3,a3,1448 # 8041362c <commands+0xcac>
8040208c:	00011617          	auipc	a2,0x11
80402090:	ab060613          	addi	a2,a2,-1360 # 80412b3c <commands+0x1bc>
80402094:	12600593          	li	a1,294
80402098:	00011517          	auipc	a0,0x11
8040209c:	29050513          	addi	a0,a0,656 # 80413328 <commands+0x9a8>
804020a0:	d84fe0ef          	jal	ra,80400624 <__panic>
804020a4:	00011697          	auipc	a3,0x11
804020a8:	29c68693          	addi	a3,a3,668 # 80413340 <commands+0x9c0>
804020ac:	00011617          	auipc	a2,0x11
804020b0:	a9060613          	addi	a2,a2,-1392 # 80412b3c <commands+0x1bc>
804020b4:	0f300593          	li	a1,243
804020b8:	00011517          	auipc	a0,0x11
804020bc:	27050513          	addi	a0,a0,624 # 80413328 <commands+0x9a8>
804020c0:	d64fe0ef          	jal	ra,80400624 <__panic>
804020c4:	00011697          	auipc	a3,0x11
804020c8:	2b468693          	addi	a3,a3,692 # 80413378 <commands+0x9f8>
804020cc:	00011617          	auipc	a2,0x11
804020d0:	a7060613          	addi	a2,a2,-1424 # 80412b3c <commands+0x1bc>
804020d4:	0ba00593          	li	a1,186
804020d8:	00011517          	auipc	a0,0x11
804020dc:	25050513          	addi	a0,a0,592 # 80413328 <commands+0x9a8>
804020e0:	d44fe0ef          	jal	ra,80400624 <__panic>

804020e4 <default_free_pages>:
804020e4:	ff010113          	addi	sp,sp,-16
804020e8:	00112623          	sw	ra,12(sp)
804020ec:	1e058863          	beqz	a1,804022dc <default_free_pages+0x1f8>
804020f0:	00559693          	slli	a3,a1,0x5
804020f4:	00d506b3          	add	a3,a0,a3
804020f8:	04d50863          	beq	a0,a3,80402148 <default_free_pages+0x64>
804020fc:	00452783          	lw	a5,4(a0)
80402100:	0017f793          	andi	a5,a5,1
80402104:	1a079c63          	bnez	a5,804022bc <default_free_pages+0x1d8>
80402108:	00452783          	lw	a5,4(a0)
8040210c:	0017d793          	srli	a5,a5,0x1
80402110:	0017f793          	andi	a5,a5,1
80402114:	1a079463          	bnez	a5,804022bc <default_free_pages+0x1d8>
80402118:	00050793          	mv	a5,a0
8040211c:	01c0006f          	j	80402138 <default_free_pages+0x54>
80402120:	0047a703          	lw	a4,4(a5)
80402124:	00177713          	andi	a4,a4,1
80402128:	18071a63          	bnez	a4,804022bc <default_free_pages+0x1d8>
8040212c:	0047a703          	lw	a4,4(a5)
80402130:	00277713          	andi	a4,a4,2
80402134:	18071463          	bnez	a4,804022bc <default_free_pages+0x1d8>
80402138:	0007a223          	sw	zero,4(a5)
8040213c:	0007a023          	sw	zero,0(a5)
80402140:	02078793          	addi	a5,a5,32
80402144:	fcd79ee3          	bne	a5,a3,80402120 <default_free_pages+0x3c>
80402148:	00452703          	lw	a4,4(a0)
8040214c:	0009a697          	auipc	a3,0x9a
80402150:	6a468693          	addi	a3,a3,1700 # 8049c7f0 <free_area>
80402154:	0046a783          	lw	a5,4(a3)
80402158:	00276713          	ori	a4,a4,2
8040215c:	00e52223          	sw	a4,4(a0)
80402160:	0086a703          	lw	a4,8(a3)
80402164:	00b52423          	sw	a1,8(a0)
80402168:	00b70733          	add	a4,a4,a1
8040216c:	0009a617          	auipc	a2,0x9a
80402170:	68e62623          	sw	a4,1676(a2) # 8049c7f8 <free_area+0x8>
80402174:	0ed78a63          	beq	a5,a3,80402268 <default_free_pages+0x184>
80402178:	ff478713          	addi	a4,a5,-12
8040217c:	0006a803          	lw	a6,0(a3)
80402180:	00000893          	li	a7,0
80402184:	00c50613          	addi	a2,a0,12
80402188:	00e56c63          	bltu	a0,a4,804021a0 <default_free_pages+0xbc>
8040218c:	0047a703          	lw	a4,4(a5)
80402190:	06d70663          	beq	a4,a3,804021fc <default_free_pages+0x118>
80402194:	00070793          	mv	a5,a4
80402198:	ff478713          	addi	a4,a5,-12
8040219c:	fee578e3          	bgeu	a0,a4,8040218c <default_free_pages+0xa8>
804021a0:	00088663          	beqz	a7,804021ac <default_free_pages+0xc8>
804021a4:	0009a897          	auipc	a7,0x9a
804021a8:	6508a623          	sw	a6,1612(a7) # 8049c7f0 <free_area>
804021ac:	0007a803          	lw	a6,0(a5)
804021b0:	00c7a023          	sw	a2,0(a5)
804021b4:	00c82223          	sw	a2,4(a6)
804021b8:	00f52823          	sw	a5,16(a0)
804021bc:	01052623          	sw	a6,12(a0)
804021c0:	08d80663          	beq	a6,a3,8040224c <default_free_pages+0x168>
804021c4:	ffc82883          	lw	a7,-4(a6)
804021c8:	ff480613          	addi	a2,a6,-12
804021cc:	00589713          	slli	a4,a7,0x5
804021d0:	00e60733          	add	a4,a2,a4
804021d4:	06e51863          	bne	a0,a4,80402244 <default_free_pages+0x160>
804021d8:	011585b3          	add	a1,a1,a7
804021dc:	feb82e23          	sw	a1,-4(a6)
804021e0:	00452703          	lw	a4,4(a0)
804021e4:	ffd77713          	andi	a4,a4,-3
804021e8:	00e52223          	sw	a4,4(a0)
804021ec:	00f82223          	sw	a5,4(a6)
804021f0:	0107a023          	sw	a6,0(a5)
804021f4:	00060513          	mv	a0,a2
804021f8:	04c0006f          	j	80402244 <default_free_pages+0x160>
804021fc:	00c7a223          	sw	a2,4(a5)
80402200:	00d52823          	sw	a3,16(a0)
80402204:	0047a703          	lw	a4,4(a5)
80402208:	00f52623          	sw	a5,12(a0)
8040220c:	00060813          	mv	a6,a2
80402210:	00d70863          	beq	a4,a3,80402220 <default_free_pages+0x13c>
80402214:	00100893          	li	a7,1
80402218:	00070793          	mv	a5,a4
8040221c:	f7dff06f          	j	80402198 <default_free_pages+0xb4>
80402220:	00078813          	mv	a6,a5
80402224:	00c6a023          	sw	a2,0(a3)
80402228:	00068793          	mv	a5,a3
8040222c:	00d80c63          	beq	a6,a3,80402244 <default_free_pages+0x160>
80402230:	ffc82883          	lw	a7,-4(a6)
80402234:	ff480613          	addi	a2,a6,-12
80402238:	00589713          	slli	a4,a7,0x5
8040223c:	00e60733          	add	a4,a2,a4
80402240:	f8e50ce3          	beq	a0,a4,804021d8 <default_free_pages+0xf4>
80402244:	ff478713          	addi	a4,a5,-12
80402248:	00d78a63          	beq	a5,a3,8040225c <default_free_pages+0x178>
8040224c:	00852603          	lw	a2,8(a0)
80402250:	00561693          	slli	a3,a2,0x5
80402254:	00d506b3          	add	a3,a0,a3
80402258:	02d70863          	beq	a4,a3,80402288 <default_free_pages+0x1a4>
8040225c:	00c12083          	lw	ra,12(sp)
80402260:	01010113          	addi	sp,sp,16
80402264:	00008067          	ret
80402268:	00c12083          	lw	ra,12(sp)
8040226c:	00c50713          	addi	a4,a0,12
80402270:	00e7a023          	sw	a4,0(a5)
80402274:	00e7a223          	sw	a4,4(a5)
80402278:	00f52823          	sw	a5,16(a0)
8040227c:	00f52623          	sw	a5,12(a0)
80402280:	01010113          	addi	sp,sp,16
80402284:	00008067          	ret
80402288:	ffc7a703          	lw	a4,-4(a5)
8040228c:	0007a583          	lw	a1,0(a5)
80402290:	0047a683          	lw	a3,4(a5)
80402294:	00c70633          	add	a2,a4,a2
80402298:	00c52423          	sw	a2,8(a0)
8040229c:	ff87a703          	lw	a4,-8(a5)
804022a0:	00c12083          	lw	ra,12(sp)
804022a4:	ffd77713          	andi	a4,a4,-3
804022a8:	fee7ac23          	sw	a4,-8(a5)
804022ac:	00d5a223          	sw	a3,4(a1)
804022b0:	00b6a023          	sw	a1,0(a3)
804022b4:	01010113          	addi	sp,sp,16
804022b8:	00008067          	ret
804022bc:	00011697          	auipc	a3,0x11
804022c0:	37c68693          	addi	a3,a3,892 # 80413638 <commands+0xcb8>
804022c4:	00011617          	auipc	a2,0x11
804022c8:	87860613          	addi	a2,a2,-1928 # 80412b3c <commands+0x1bc>
804022cc:	08300593          	li	a1,131
804022d0:	00011517          	auipc	a0,0x11
804022d4:	05850513          	addi	a0,a0,88 # 80413328 <commands+0x9a8>
804022d8:	b4cfe0ef          	jal	ra,80400624 <__panic>
804022dc:	00011697          	auipc	a3,0x11
804022e0:	38468693          	addi	a3,a3,900 # 80413660 <commands+0xce0>
804022e4:	00011617          	auipc	a2,0x11
804022e8:	85860613          	addi	a2,a2,-1960 # 80412b3c <commands+0x1bc>
804022ec:	08000593          	li	a1,128
804022f0:	00011517          	auipc	a0,0x11
804022f4:	03850513          	addi	a0,a0,56 # 80413328 <commands+0x9a8>
804022f8:	b2cfe0ef          	jal	ra,80400624 <__panic>

804022fc <default_alloc_pages>:
804022fc:	0a050263          	beqz	a0,804023a0 <default_alloc_pages+0xa4>
80402300:	0009a617          	auipc	a2,0x9a
80402304:	4f060613          	addi	a2,a2,1264 # 8049c7f0 <free_area>
80402308:	00862583          	lw	a1,8(a2)
8040230c:	00050693          	mv	a3,a0
80402310:	00a5ee63          	bltu	a1,a0,8040232c <default_alloc_pages+0x30>
80402314:	00060793          	mv	a5,a2
80402318:	00c0006f          	j	80402324 <default_alloc_pages+0x28>
8040231c:	ffc7a703          	lw	a4,-4(a5)
80402320:	00d77a63          	bgeu	a4,a3,80402334 <default_alloc_pages+0x38>
80402324:	0047a783          	lw	a5,4(a5)
80402328:	fec79ae3          	bne	a5,a2,8040231c <default_alloc_pages+0x20>
8040232c:	00000513          	li	a0,0
80402330:	00008067          	ret
80402334:	ff478513          	addi	a0,a5,-12
80402338:	fe050ce3          	beqz	a0,80402330 <default_alloc_pages+0x34>
8040233c:	0007a883          	lw	a7,0(a5)
80402340:	0047a303          	lw	t1,4(a5)
80402344:	0068a223          	sw	t1,4(a7)
80402348:	01132023          	sw	a7,0(t1)
8040234c:	02e6fc63          	bgeu	a3,a4,80402384 <default_alloc_pages+0x88>
80402350:	00569813          	slli	a6,a3,0x5
80402354:	01050833          	add	a6,a0,a6
80402358:	00482583          	lw	a1,4(a6)
8040235c:	40d70733          	sub	a4,a4,a3
80402360:	00e82423          	sw	a4,8(a6)
80402364:	0025e713          	ori	a4,a1,2
80402368:	00e82223          	sw	a4,4(a6)
8040236c:	00c80713          	addi	a4,a6,12
80402370:	00e32023          	sw	a4,0(t1)
80402374:	00862583          	lw	a1,8(a2)
80402378:	00e8a223          	sw	a4,4(a7)
8040237c:	00682823          	sw	t1,16(a6)
80402380:	01182623          	sw	a7,12(a6)
80402384:	40d586b3          	sub	a3,a1,a3
80402388:	0009a717          	auipc	a4,0x9a
8040238c:	46d72823          	sw	a3,1136(a4) # 8049c7f8 <free_area+0x8>
80402390:	ff87a703          	lw	a4,-8(a5)
80402394:	ffd77713          	andi	a4,a4,-3
80402398:	fee7ac23          	sw	a4,-8(a5)
8040239c:	00008067          	ret
804023a0:	ff010113          	addi	sp,sp,-16
804023a4:	00011697          	auipc	a3,0x11
804023a8:	2bc68693          	addi	a3,a3,700 # 80413660 <commands+0xce0>
804023ac:	00010617          	auipc	a2,0x10
804023b0:	79060613          	addi	a2,a2,1936 # 80412b3c <commands+0x1bc>
804023b4:	06200593          	li	a1,98
804023b8:	00011517          	auipc	a0,0x11
804023bc:	f7050513          	addi	a0,a0,-144 # 80413328 <commands+0x9a8>
804023c0:	00112623          	sw	ra,12(sp)
804023c4:	a60fe0ef          	jal	ra,80400624 <__panic>

804023c8 <default_init_memmap>:
804023c8:	ff010113          	addi	sp,sp,-16
804023cc:	00112623          	sw	ra,12(sp)
804023d0:	12058e63          	beqz	a1,8040250c <default_init_memmap+0x144>
804023d4:	00559693          	slli	a3,a1,0x5
804023d8:	00d506b3          	add	a3,a0,a3
804023dc:	02d50c63          	beq	a0,a3,80402414 <default_init_memmap+0x4c>
804023e0:	00452703          	lw	a4,4(a0)
804023e4:	00050793          	mv	a5,a0
804023e8:	00177713          	andi	a4,a4,1
804023ec:	00071a63          	bnez	a4,80402400 <default_init_memmap+0x38>
804023f0:	0fc0006f          	j	804024ec <default_init_memmap+0x124>
804023f4:	0047a703          	lw	a4,4(a5)
804023f8:	00177713          	andi	a4,a4,1
804023fc:	0e070863          	beqz	a4,804024ec <default_init_memmap+0x124>
80402400:	0007a423          	sw	zero,8(a5)
80402404:	0007a223          	sw	zero,4(a5)
80402408:	0007a023          	sw	zero,0(a5)
8040240c:	02078793          	addi	a5,a5,32
80402410:	fed792e3          	bne	a5,a3,804023f4 <default_init_memmap+0x2c>
80402414:	00452703          	lw	a4,4(a0)
80402418:	0009a697          	auipc	a3,0x9a
8040241c:	3d868693          	addi	a3,a3,984 # 8049c7f0 <free_area>
80402420:	0046a783          	lw	a5,4(a3)
80402424:	00276713          	ori	a4,a4,2
80402428:	00e52223          	sw	a4,4(a0)
8040242c:	0086a703          	lw	a4,8(a3)
80402430:	00b52423          	sw	a1,8(a0)
80402434:	00b705b3          	add	a1,a4,a1
80402438:	0009a717          	auipc	a4,0x9a
8040243c:	3cb72023          	sw	a1,960(a4) # 8049c7f8 <free_area+0x8>
80402440:	06d78e63          	beq	a5,a3,804024bc <default_init_memmap+0xf4>
80402444:	ff478713          	addi	a4,a5,-12
80402448:	0006a583          	lw	a1,0(a3)
8040244c:	00000813          	li	a6,0
80402450:	00c50613          	addi	a2,a0,12
80402454:	00e56c63          	bltu	a0,a4,8040246c <default_init_memmap+0xa4>
80402458:	0047a703          	lw	a4,4(a5)
8040245c:	02d70e63          	beq	a4,a3,80402498 <default_init_memmap+0xd0>
80402460:	00070793          	mv	a5,a4
80402464:	ff478713          	addi	a4,a5,-12
80402468:	fee578e3          	bgeu	a0,a4,80402458 <default_init_memmap+0x90>
8040246c:	00080663          	beqz	a6,80402478 <default_init_memmap+0xb0>
80402470:	0009a717          	auipc	a4,0x9a
80402474:	38b72023          	sw	a1,896(a4) # 8049c7f0 <free_area>
80402478:	0007a703          	lw	a4,0(a5)
8040247c:	00c12083          	lw	ra,12(sp)
80402480:	00c7a023          	sw	a2,0(a5)
80402484:	00c72223          	sw	a2,4(a4)
80402488:	00f52823          	sw	a5,16(a0)
8040248c:	00e52623          	sw	a4,12(a0)
80402490:	01010113          	addi	sp,sp,16
80402494:	00008067          	ret
80402498:	00c7a223          	sw	a2,4(a5)
8040249c:	00d52823          	sw	a3,16(a0)
804024a0:	0047a703          	lw	a4,4(a5)
804024a4:	00f52623          	sw	a5,12(a0)
804024a8:	00060593          	mv	a1,a2
804024ac:	02d70863          	beq	a4,a3,804024dc <default_init_memmap+0x114>
804024b0:	00100813          	li	a6,1
804024b4:	00070793          	mv	a5,a4
804024b8:	fadff06f          	j	80402464 <default_init_memmap+0x9c>
804024bc:	00c12083          	lw	ra,12(sp)
804024c0:	00c50713          	addi	a4,a0,12
804024c4:	00e7a023          	sw	a4,0(a5)
804024c8:	00e7a223          	sw	a4,4(a5)
804024cc:	00f52823          	sw	a5,16(a0)
804024d0:	00f52623          	sw	a5,12(a0)
804024d4:	01010113          	addi	sp,sp,16
804024d8:	00008067          	ret
804024dc:	00c12083          	lw	ra,12(sp)
804024e0:	00c6a023          	sw	a2,0(a3)
804024e4:	01010113          	addi	sp,sp,16
804024e8:	00008067          	ret
804024ec:	00011697          	auipc	a3,0x11
804024f0:	17c68693          	addi	a3,a3,380 # 80413668 <commands+0xce8>
804024f4:	00010617          	auipc	a2,0x10
804024f8:	64860613          	addi	a2,a2,1608 # 80412b3c <commands+0x1bc>
804024fc:	04900593          	li	a1,73
80402500:	00011517          	auipc	a0,0x11
80402504:	e2850513          	addi	a0,a0,-472 # 80413328 <commands+0x9a8>
80402508:	91cfe0ef          	jal	ra,80400624 <__panic>
8040250c:	00011697          	auipc	a3,0x11
80402510:	15468693          	addi	a3,a3,340 # 80413660 <commands+0xce0>
80402514:	00010617          	auipc	a2,0x10
80402518:	62860613          	addi	a2,a2,1576 # 80412b3c <commands+0x1bc>
8040251c:	04600593          	li	a1,70
80402520:	00011517          	auipc	a0,0x11
80402524:	e0850513          	addi	a0,a0,-504 # 80413328 <commands+0x9a8>
80402528:	8fcfe0ef          	jal	ra,80400624 <__panic>

8040252c <slob_free>:
8040252c:	08050063          	beqz	a0,804025ac <slob_free+0x80>
80402530:	08059063          	bnez	a1,804025b0 <slob_free+0x84>
80402534:	100027f3          	csrr	a5,sstatus
80402538:	0027f793          	andi	a5,a5,2
8040253c:	00000593          	li	a1,0
80402540:	08079663          	bnez	a5,804025cc <slob_free+0xa0>
80402544:	00097797          	auipc	a5,0x97
80402548:	afc78793          	addi	a5,a5,-1284 # 80499040 <slobfree>
8040254c:	0007a783          	lw	a5,0(a5)
80402550:	0047a703          	lw	a4,4(a5)
80402554:	00a7fc63          	bgeu	a5,a0,8040256c <slob_free+0x40>
80402558:	00e56e63          	bltu	a0,a4,80402574 <slob_free+0x48>
8040255c:	00e7fc63          	bgeu	a5,a4,80402574 <slob_free+0x48>
80402560:	00070793          	mv	a5,a4
80402564:	0047a703          	lw	a4,4(a5)
80402568:	fea7e8e3          	bltu	a5,a0,80402558 <slob_free+0x2c>
8040256c:	fee7eae3          	bltu	a5,a4,80402560 <slob_free+0x34>
80402570:	fee578e3          	bgeu	a0,a4,80402560 <slob_free+0x34>
80402574:	00052603          	lw	a2,0(a0)
80402578:	00361693          	slli	a3,a2,0x3
8040257c:	00d506b3          	add	a3,a0,a3
80402580:	0cd70a63          	beq	a4,a3,80402654 <slob_free+0x128>
80402584:	0007a683          	lw	a3,0(a5)
80402588:	00e52223          	sw	a4,4(a0)
8040258c:	00369713          	slli	a4,a3,0x3
80402590:	00e78733          	add	a4,a5,a4
80402594:	0ee50263          	beq	a0,a4,80402678 <slob_free+0x14c>
80402598:	00a7a223          	sw	a0,4(a5)
8040259c:	00097717          	auipc	a4,0x97
804025a0:	aaf72223          	sw	a5,-1372(a4) # 80499040 <slobfree>
804025a4:	00058463          	beqz	a1,804025ac <slob_free+0x80>
804025a8:	e68fe06f          	j	80400c10 <intr_enable>
804025ac:	00008067          	ret
804025b0:	00758593          	addi	a1,a1,7
804025b4:	0035d593          	srli	a1,a1,0x3
804025b8:	00b52023          	sw	a1,0(a0)
804025bc:	100027f3          	csrr	a5,sstatus
804025c0:	0027f793          	andi	a5,a5,2
804025c4:	00000593          	li	a1,0
804025c8:	f6078ee3          	beqz	a5,80402544 <slob_free+0x18>
804025cc:	fe010113          	addi	sp,sp,-32
804025d0:	00a12623          	sw	a0,12(sp)
804025d4:	00112e23          	sw	ra,28(sp)
804025d8:	e40fe0ef          	jal	ra,80400c18 <intr_disable>
804025dc:	00097797          	auipc	a5,0x97
804025e0:	a6478793          	addi	a5,a5,-1436 # 80499040 <slobfree>
804025e4:	0007a783          	lw	a5,0(a5)
804025e8:	00c12503          	lw	a0,12(sp)
804025ec:	00100593          	li	a1,1
804025f0:	0047a703          	lw	a4,4(a5)
804025f4:	00a7fc63          	bgeu	a5,a0,8040260c <slob_free+0xe0>
804025f8:	00e56e63          	bltu	a0,a4,80402614 <slob_free+0xe8>
804025fc:	00e7fc63          	bgeu	a5,a4,80402614 <slob_free+0xe8>
80402600:	00070793          	mv	a5,a4
80402604:	0047a703          	lw	a4,4(a5)
80402608:	fea7e8e3          	bltu	a5,a0,804025f8 <slob_free+0xcc>
8040260c:	fee7eae3          	bltu	a5,a4,80402600 <slob_free+0xd4>
80402610:	fee578e3          	bgeu	a0,a4,80402600 <slob_free+0xd4>
80402614:	00052603          	lw	a2,0(a0)
80402618:	00361693          	slli	a3,a2,0x3
8040261c:	00d506b3          	add	a3,a0,a3
80402620:	06d70e63          	beq	a4,a3,8040269c <slob_free+0x170>
80402624:	00e52223          	sw	a4,4(a0)
80402628:	0007a683          	lw	a3,0(a5)
8040262c:	00369713          	slli	a4,a3,0x3
80402630:	00e78733          	add	a4,a5,a4
80402634:	08e50063          	beq	a0,a4,804026b4 <slob_free+0x188>
80402638:	00a7a223          	sw	a0,4(a5)
8040263c:	00097717          	auipc	a4,0x97
80402640:	a0f72223          	sw	a5,-1532(a4) # 80499040 <slobfree>
80402644:	04059663          	bnez	a1,80402690 <slob_free+0x164>
80402648:	01c12083          	lw	ra,28(sp)
8040264c:	02010113          	addi	sp,sp,32
80402650:	00008067          	ret
80402654:	00072683          	lw	a3,0(a4)
80402658:	00472703          	lw	a4,4(a4)
8040265c:	00c68633          	add	a2,a3,a2
80402660:	00c52023          	sw	a2,0(a0)
80402664:	0007a683          	lw	a3,0(a5)
80402668:	00e52223          	sw	a4,4(a0)
8040266c:	00369713          	slli	a4,a3,0x3
80402670:	00e78733          	add	a4,a5,a4
80402674:	f2e512e3          	bne	a0,a4,80402598 <slob_free+0x6c>
80402678:	00052703          	lw	a4,0(a0)
8040267c:	00452603          	lw	a2,4(a0)
80402680:	00d706b3          	add	a3,a4,a3
80402684:	00d7a023          	sw	a3,0(a5)
80402688:	00c7a223          	sw	a2,4(a5)
8040268c:	f11ff06f          	j	8040259c <slob_free+0x70>
80402690:	01c12083          	lw	ra,28(sp)
80402694:	02010113          	addi	sp,sp,32
80402698:	d78fe06f          	j	80400c10 <intr_enable>
8040269c:	00072683          	lw	a3,0(a4)
804026a0:	00472703          	lw	a4,4(a4)
804026a4:	00c68633          	add	a2,a3,a2
804026a8:	00c52023          	sw	a2,0(a0)
804026ac:	00e52223          	sw	a4,4(a0)
804026b0:	f79ff06f          	j	80402628 <slob_free+0xfc>
804026b4:	00052703          	lw	a4,0(a0)
804026b8:	00452603          	lw	a2,4(a0)
804026bc:	00d706b3          	add	a3,a4,a3
804026c0:	00d7a023          	sw	a3,0(a5)
804026c4:	00c7a223          	sw	a2,4(a5)
804026c8:	f75ff06f          	j	8040263c <slob_free+0x110>

804026cc <__slob_get_free_pages.isra.0>:
804026cc:	00100793          	li	a5,1
804026d0:	ff010113          	addi	sp,sp,-16
804026d4:	00a79533          	sll	a0,a5,a0
804026d8:	00112623          	sw	ra,12(sp)
804026dc:	628000ef          	jal	ra,80402d04 <alloc_pages>
804026e0:	04050a63          	beqz	a0,80402734 <__slob_get_free_pages.isra.0+0x68>
804026e4:	0009a797          	auipc	a5,0x9a
804026e8:	12478793          	addi	a5,a5,292 # 8049c808 <pages>
804026ec:	0007a683          	lw	a3,0(a5)
804026f0:	00014797          	auipc	a5,0x14
804026f4:	97478793          	addi	a5,a5,-1676 # 80416064 <nbase>
804026f8:	40d50533          	sub	a0,a0,a3
804026fc:	0007a683          	lw	a3,0(a5)
80402700:	40555513          	srai	a0,a0,0x5
80402704:	0009a797          	auipc	a5,0x9a
80402708:	09478793          	addi	a5,a5,148 # 8049c798 <npage>
8040270c:	00d50533          	add	a0,a0,a3
80402710:	0007a703          	lw	a4,0(a5)
80402714:	00c51793          	slli	a5,a0,0xc
80402718:	00c7d793          	srli	a5,a5,0xc
8040271c:	00c51513          	slli	a0,a0,0xc
80402720:	02e7f063          	bgeu	a5,a4,80402740 <__slob_get_free_pages.isra.0+0x74>
80402724:	0009a797          	auipc	a5,0x9a
80402728:	0dc78793          	addi	a5,a5,220 # 8049c800 <va_pa_offset>
8040272c:	0007a683          	lw	a3,0(a5)
80402730:	00d50533          	add	a0,a0,a3
80402734:	00c12083          	lw	ra,12(sp)
80402738:	01010113          	addi	sp,sp,16
8040273c:	00008067          	ret
80402740:	00050693          	mv	a3,a0
80402744:	00011617          	auipc	a2,0x11
80402748:	f6460613          	addi	a2,a2,-156 # 804136a8 <default_pmm_manager+0x30>
8040274c:	06e00593          	li	a1,110
80402750:	00011517          	auipc	a0,0x11
80402754:	f7c50513          	addi	a0,a0,-132 # 804136cc <default_pmm_manager+0x54>
80402758:	ecdfd0ef          	jal	ra,80400624 <__panic>

8040275c <slob_alloc.isra.1.constprop.3>:
8040275c:	fe010113          	addi	sp,sp,-32
80402760:	00112e23          	sw	ra,28(sp)
80402764:	00812c23          	sw	s0,24(sp)
80402768:	00912a23          	sw	s1,20(sp)
8040276c:	01212823          	sw	s2,16(sp)
80402770:	01312623          	sw	s3,12(sp)
80402774:	00850713          	addi	a4,a0,8
80402778:	000017b7          	lui	a5,0x1
8040277c:	12f77a63          	bgeu	a4,a5,804028b0 <slob_alloc.isra.1.constprop.3+0x154>
80402780:	00750993          	addi	s3,a0,7
80402784:	0039d913          	srli	s2,s3,0x3
80402788:	10002673          	csrr	a2,sstatus
8040278c:	00267613          	andi	a2,a2,2
80402790:	10061463          	bnez	a2,80402898 <slob_alloc.isra.1.constprop.3+0x13c>
80402794:	00097497          	auipc	s1,0x97
80402798:	8ac48493          	addi	s1,s1,-1876 # 80499040 <slobfree>
8040279c:	0004a683          	lw	a3,0(s1)
804027a0:	0046a783          	lw	a5,4(a3)
804027a4:	0007a703          	lw	a4,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
804027a8:	0f275e63          	bge	a4,s2,804028a4 <slob_alloc.isra.1.constprop.3+0x148>
804027ac:	00d78e63          	beq	a5,a3,804027c8 <slob_alloc.isra.1.constprop.3+0x6c>
804027b0:	0047a403          	lw	s0,4(a5)
804027b4:	00042703          	lw	a4,0(s0)
804027b8:	05275463          	bge	a4,s2,80402800 <slob_alloc.isra.1.constprop.3+0xa4>
804027bc:	0004a683          	lw	a3,0(s1)
804027c0:	00040793          	mv	a5,s0
804027c4:	fed796e3          	bne	a5,a3,804027b0 <slob_alloc.isra.1.constprop.3+0x54>
804027c8:	08061c63          	bnez	a2,80402860 <slob_alloc.isra.1.constprop.3+0x104>
804027cc:	00000513          	li	a0,0
804027d0:	efdff0ef          	jal	ra,804026cc <__slob_get_free_pages.isra.0>
804027d4:	00050413          	mv	s0,a0
804027d8:	04050c63          	beqz	a0,80402830 <slob_alloc.isra.1.constprop.3+0xd4>
804027dc:	000015b7          	lui	a1,0x1
804027e0:	d4dff0ef          	jal	ra,8040252c <slob_free>
804027e4:	10002673          	csrr	a2,sstatus
804027e8:	00267613          	andi	a2,a2,2
804027ec:	06061263          	bnez	a2,80402850 <slob_alloc.isra.1.constprop.3+0xf4>
804027f0:	0004a783          	lw	a5,0(s1)
804027f4:	0047a403          	lw	s0,4(a5)
804027f8:	00042703          	lw	a4,0(s0)
804027fc:	fd2740e3          	blt	a4,s2,804027bc <slob_alloc.isra.1.constprop.3+0x60>
80402800:	08e90663          	beq	s2,a4,8040288c <slob_alloc.isra.1.constprop.3+0x130>
80402804:	ff89f513          	andi	a0,s3,-8
80402808:	00a40533          	add	a0,s0,a0
8040280c:	00a7a223          	sw	a0,4(a5)
80402810:	00442683          	lw	a3,4(s0)
80402814:	41270733          	sub	a4,a4,s2
80402818:	00e52023          	sw	a4,0(a0)
8040281c:	00d52223          	sw	a3,4(a0)
80402820:	01242023          	sw	s2,0(s0)
80402824:	00097717          	auipc	a4,0x97
80402828:	80f72e23          	sw	a5,-2020(a4) # 80499040 <slobfree>
8040282c:	02061e63          	bnez	a2,80402868 <slob_alloc.isra.1.constprop.3+0x10c>
80402830:	00040513          	mv	a0,s0
80402834:	01c12083          	lw	ra,28(sp)
80402838:	01812403          	lw	s0,24(sp)
8040283c:	01412483          	lw	s1,20(sp)
80402840:	01012903          	lw	s2,16(sp)
80402844:	00c12983          	lw	s3,12(sp)
80402848:	02010113          	addi	sp,sp,32
8040284c:	00008067          	ret
80402850:	bc8fe0ef          	jal	ra,80400c18 <intr_disable>
80402854:	00100613          	li	a2,1
80402858:	0004a783          	lw	a5,0(s1)
8040285c:	f99ff06f          	j	804027f4 <slob_alloc.isra.1.constprop.3+0x98>
80402860:	bb0fe0ef          	jal	ra,80400c10 <intr_enable>
80402864:	f69ff06f          	j	804027cc <slob_alloc.isra.1.constprop.3+0x70>
80402868:	ba8fe0ef          	jal	ra,80400c10 <intr_enable>
8040286c:	00040513          	mv	a0,s0
80402870:	01c12083          	lw	ra,28(sp)
80402874:	01812403          	lw	s0,24(sp)
80402878:	01412483          	lw	s1,20(sp)
8040287c:	01012903          	lw	s2,16(sp)
80402880:	00c12983          	lw	s3,12(sp)
80402884:	02010113          	addi	sp,sp,32
80402888:	00008067          	ret
8040288c:	00442703          	lw	a4,4(s0)
80402890:	00e7a223          	sw	a4,4(a5)
80402894:	f91ff06f          	j	80402824 <slob_alloc.isra.1.constprop.3+0xc8>
80402898:	b80fe0ef          	jal	ra,80400c18 <intr_disable>
8040289c:	00100613          	li	a2,1
804028a0:	ef5ff06f          	j	80402794 <slob_alloc.isra.1.constprop.3+0x38>
804028a4:	00078413          	mv	s0,a5
804028a8:	00068793          	mv	a5,a3
804028ac:	f55ff06f          	j	80402800 <slob_alloc.isra.1.constprop.3+0xa4>
804028b0:	00011697          	auipc	a3,0x11
804028b4:	e8c68693          	addi	a3,a3,-372 # 8041373c <default_pmm_manager+0xc4>
804028b8:	00010617          	auipc	a2,0x10
804028bc:	28460613          	addi	a2,a2,644 # 80412b3c <commands+0x1bc>
804028c0:	06400593          	li	a1,100
804028c4:	00011517          	auipc	a0,0x11
804028c8:	e9850513          	addi	a0,a0,-360 # 8041375c <default_pmm_manager+0xe4>
804028cc:	d59fd0ef          	jal	ra,80400624 <__panic>

804028d0 <slob_init>:
804028d0:	ff010113          	addi	sp,sp,-16
804028d4:	00812423          	sw	s0,8(sp)
804028d8:	00096417          	auipc	s0,0x96
804028dc:	76040413          	addi	s0,s0,1888 # 80499038 <arena>
804028e0:	00096797          	auipc	a5,0x96
804028e4:	7487ae23          	sw	s0,1884(a5) # 8049903c <arena+0x4>
804028e8:	00100793          	li	a5,1
804028ec:	00011517          	auipc	a0,0x11
804028f0:	e8450513          	addi	a0,a0,-380 # 80413770 <default_pmm_manager+0xf8>
804028f4:	00096717          	auipc	a4,0x96
804028f8:	74f72223          	sw	a5,1860(a4) # 80499038 <arena>
804028fc:	00112623          	sw	ra,12(sp)
80402900:	00096797          	auipc	a5,0x96
80402904:	7487a023          	sw	s0,1856(a5) # 80499040 <slobfree>
80402908:	0009a797          	auipc	a5,0x9a
8040290c:	e807a423          	sw	zero,-376(a5) # 8049c790 <bigblocks>
80402910:	8edfd0ef          	jal	ra,804001fc <cprintf>
80402914:	00442603          	lw	a2,4(s0)
80402918:	00042683          	lw	a3,0(s0)
8040291c:	00040593          	mv	a1,s0
80402920:	00011517          	auipc	a0,0x11
80402924:	e6450513          	addi	a0,a0,-412 # 80413784 <default_pmm_manager+0x10c>
80402928:	8d5fd0ef          	jal	ra,804001fc <cprintf>
8040292c:	00096797          	auipc	a5,0x96
80402930:	71478793          	addi	a5,a5,1812 # 80499040 <slobfree>
80402934:	0007a583          	lw	a1,0(a5)
80402938:	00000613          	li	a2,0
8040293c:	00058463          	beqz	a1,80402944 <slob_init+0x74>
80402940:	0045a603          	lw	a2,4(a1) # 1004 <_binary_bin_swap_img_size-0x6ffc>
80402944:	00812403          	lw	s0,8(sp)
80402948:	00c12083          	lw	ra,12(sp)
8040294c:	00011517          	auipc	a0,0x11
80402950:	e6850513          	addi	a0,a0,-408 # 804137b4 <default_pmm_manager+0x13c>
80402954:	01010113          	addi	sp,sp,16
80402958:	8a5fd06f          	j	804001fc <cprintf>

8040295c <kmalloc_init>:
8040295c:	ff010113          	addi	sp,sp,-16
80402960:	00112623          	sw	ra,12(sp)
80402964:	f6dff0ef          	jal	ra,804028d0 <slob_init>
80402968:	00c12083          	lw	ra,12(sp)
8040296c:	00011517          	auipc	a0,0x11
80402970:	db450513          	addi	a0,a0,-588 # 80413720 <default_pmm_manager+0xa8>
80402974:	01010113          	addi	sp,sp,16
80402978:	885fd06f          	j	804001fc <cprintf>

8040297c <kallocated>:
8040297c:	00000513          	li	a0,0
80402980:	00008067          	ret

80402984 <kmalloc>:
80402984:	ff010113          	addi	sp,sp,-16
80402988:	01212023          	sw	s2,0(sp)
8040298c:	00001937          	lui	s2,0x1
80402990:	00812423          	sw	s0,8(sp)
80402994:	00112623          	sw	ra,12(sp)
80402998:	00912223          	sw	s1,4(sp)
8040299c:	ff790793          	addi	a5,s2,-9 # ff7 <_binary_bin_swap_img_size-0x7009>
804029a0:	00050413          	mv	s0,a0
804029a4:	08a7f263          	bgeu	a5,a0,80402a28 <kmalloc+0xa4>
804029a8:	00c00513          	li	a0,12
804029ac:	db1ff0ef          	jal	ra,8040275c <slob_alloc.isra.1.constprop.3>
804029b0:	00050493          	mv	s1,a0
804029b4:	08050263          	beqz	a0,80402a38 <kmalloc+0xb4>
804029b8:	00040793          	mv	a5,s0
804029bc:	00000513          	li	a0,0
804029c0:	00895a63          	bge	s2,s0,804029d4 <kmalloc+0x50>
804029c4:	00001737          	lui	a4,0x1
804029c8:	4017d793          	srai	a5,a5,0x1
804029cc:	00150513          	addi	a0,a0,1
804029d0:	fef74ce3          	blt	a4,a5,804029c8 <kmalloc+0x44>
804029d4:	00a4a023          	sw	a0,0(s1)
804029d8:	cf5ff0ef          	jal	ra,804026cc <__slob_get_free_pages.isra.0>
804029dc:	00a4a223          	sw	a0,4(s1)
804029e0:	00050413          	mv	s0,a0
804029e4:	0a050a63          	beqz	a0,80402a98 <kmalloc+0x114>
804029e8:	100027f3          	csrr	a5,sstatus
804029ec:	0027f793          	andi	a5,a5,2
804029f0:	06079463          	bnez	a5,80402a58 <kmalloc+0xd4>
804029f4:	0009a797          	auipc	a5,0x9a
804029f8:	d9c78793          	addi	a5,a5,-612 # 8049c790 <bigblocks>
804029fc:	0007a783          	lw	a5,0(a5)
80402a00:	0009a717          	auipc	a4,0x9a
80402a04:	d8972823          	sw	s1,-624(a4) # 8049c790 <bigblocks>
80402a08:	00f4a423          	sw	a5,8(s1)
80402a0c:	00040513          	mv	a0,s0
80402a10:	00c12083          	lw	ra,12(sp)
80402a14:	00812403          	lw	s0,8(sp)
80402a18:	00412483          	lw	s1,4(sp)
80402a1c:	00012903          	lw	s2,0(sp)
80402a20:	01010113          	addi	sp,sp,16
80402a24:	00008067          	ret
80402a28:	00850513          	addi	a0,a0,8
80402a2c:	d31ff0ef          	jal	ra,8040275c <slob_alloc.isra.1.constprop.3>
80402a30:	00850413          	addi	s0,a0,8
80402a34:	fc051ce3          	bnez	a0,80402a0c <kmalloc+0x88>
80402a38:	00000413          	li	s0,0
80402a3c:	00040513          	mv	a0,s0
80402a40:	00c12083          	lw	ra,12(sp)
80402a44:	00812403          	lw	s0,8(sp)
80402a48:	00412483          	lw	s1,4(sp)
80402a4c:	00012903          	lw	s2,0(sp)
80402a50:	01010113          	addi	sp,sp,16
80402a54:	00008067          	ret
80402a58:	9c0fe0ef          	jal	ra,80400c18 <intr_disable>
80402a5c:	0009a797          	auipc	a5,0x9a
80402a60:	d3478793          	addi	a5,a5,-716 # 8049c790 <bigblocks>
80402a64:	0007a783          	lw	a5,0(a5)
80402a68:	0009a717          	auipc	a4,0x9a
80402a6c:	d2972423          	sw	s1,-728(a4) # 8049c790 <bigblocks>
80402a70:	00f4a423          	sw	a5,8(s1)
80402a74:	99cfe0ef          	jal	ra,80400c10 <intr_enable>
80402a78:	0044a403          	lw	s0,4(s1)
80402a7c:	00c12083          	lw	ra,12(sp)
80402a80:	00412483          	lw	s1,4(sp)
80402a84:	00040513          	mv	a0,s0
80402a88:	00812403          	lw	s0,8(sp)
80402a8c:	00012903          	lw	s2,0(sp)
80402a90:	01010113          	addi	sp,sp,16
80402a94:	00008067          	ret
80402a98:	00c00593          	li	a1,12
80402a9c:	00048513          	mv	a0,s1
80402aa0:	a8dff0ef          	jal	ra,8040252c <slob_free>
80402aa4:	f69ff06f          	j	80402a0c <kmalloc+0x88>

80402aa8 <kfree>:
80402aa8:	14050863          	beqz	a0,80402bf8 <kfree+0x150>
80402aac:	ff010113          	addi	sp,sp,-16
80402ab0:	00912223          	sw	s1,4(sp)
80402ab4:	00112623          	sw	ra,12(sp)
80402ab8:	00812423          	sw	s0,8(sp)
80402abc:	01451793          	slli	a5,a0,0x14
80402ac0:	00050493          	mv	s1,a0
80402ac4:	04079863          	bnez	a5,80402b14 <kfree+0x6c>
80402ac8:	100027f3          	csrr	a5,sstatus
80402acc:	0027f793          	andi	a5,a5,2
80402ad0:	0e079263          	bnez	a5,80402bb4 <kfree+0x10c>
80402ad4:	0009a797          	auipc	a5,0x9a
80402ad8:	cbc78793          	addi	a5,a5,-836 # 8049c790 <bigblocks>
80402adc:	0007a683          	lw	a3,0(a5)
80402ae0:	02068a63          	beqz	a3,80402b14 <kfree+0x6c>
80402ae4:	0046a783          	lw	a5,4(a3)
80402ae8:	0086a403          	lw	s0,8(a3)
80402aec:	10f50863          	beq	a0,a5,80402bfc <kfree+0x154>
80402af0:	00000613          	li	a2,0
80402af4:	00040e63          	beqz	s0,80402b10 <kfree+0x68>
80402af8:	00442703          	lw	a4,4(s0)
80402afc:	00842783          	lw	a5,8(s0)
80402b00:	02970863          	beq	a4,s1,80402b30 <kfree+0x88>
80402b04:	00040693          	mv	a3,s0
80402b08:	00078413          	mv	s0,a5
80402b0c:	fe0416e3          	bnez	s0,80402af8 <kfree+0x50>
80402b10:	0c061663          	bnez	a2,80402bdc <kfree+0x134>
80402b14:	00812403          	lw	s0,8(sp)
80402b18:	00c12083          	lw	ra,12(sp)
80402b1c:	ff848513          	addi	a0,s1,-8
80402b20:	00412483          	lw	s1,4(sp)
80402b24:	00000593          	li	a1,0
80402b28:	01010113          	addi	sp,sp,16
80402b2c:	a01ff06f          	j	8040252c <slob_free>
80402b30:	00f6a423          	sw	a5,8(a3)
80402b34:	0a061e63          	bnez	a2,80402bf0 <kfree+0x148>
80402b38:	804007b7          	lui	a5,0x80400
80402b3c:	00042703          	lw	a4,0(s0)
80402b40:	0cf4e663          	bltu	s1,a5,80402c0c <kfree+0x164>
80402b44:	0009a797          	auipc	a5,0x9a
80402b48:	cbc78793          	addi	a5,a5,-836 # 8049c800 <va_pa_offset>
80402b4c:	0007a683          	lw	a3,0(a5)
80402b50:	0009a797          	auipc	a5,0x9a
80402b54:	c4878793          	addi	a5,a5,-952 # 8049c798 <npage>
80402b58:	0007a783          	lw	a5,0(a5)
80402b5c:	40d484b3          	sub	s1,s1,a3
80402b60:	00c4d493          	srli	s1,s1,0xc
80402b64:	0cf4f263          	bgeu	s1,a5,80402c28 <kfree+0x180>
80402b68:	00013797          	auipc	a5,0x13
80402b6c:	4fc78793          	addi	a5,a5,1276 # 80416064 <nbase>
80402b70:	0007a783          	lw	a5,0(a5)
80402b74:	0009a697          	auipc	a3,0x9a
80402b78:	c9468693          	addi	a3,a3,-876 # 8049c808 <pages>
80402b7c:	0006a503          	lw	a0,0(a3)
80402b80:	40f484b3          	sub	s1,s1,a5
80402b84:	00549493          	slli	s1,s1,0x5
80402b88:	00100593          	li	a1,1
80402b8c:	00950533          	add	a0,a0,s1
80402b90:	00e595b3          	sll	a1,a1,a4
80402b94:	238000ef          	jal	ra,80402dcc <free_pages>
80402b98:	00040513          	mv	a0,s0
80402b9c:	00812403          	lw	s0,8(sp)
80402ba0:	00c12083          	lw	ra,12(sp)
80402ba4:	00412483          	lw	s1,4(sp)
80402ba8:	00c00593          	li	a1,12
80402bac:	01010113          	addi	sp,sp,16
80402bb0:	97dff06f          	j	8040252c <slob_free>
80402bb4:	864fe0ef          	jal	ra,80400c18 <intr_disable>
80402bb8:	0009a797          	auipc	a5,0x9a
80402bbc:	bd878793          	addi	a5,a5,-1064 # 8049c790 <bigblocks>
80402bc0:	0007a683          	lw	a3,0(a5)
80402bc4:	00068c63          	beqz	a3,80402bdc <kfree+0x134>
80402bc8:	0046a783          	lw	a5,4(a3)
80402bcc:	0086a403          	lw	s0,8(a3)
80402bd0:	00f48a63          	beq	s1,a5,80402be4 <kfree+0x13c>
80402bd4:	00100613          	li	a2,1
80402bd8:	f1dff06f          	j	80402af4 <kfree+0x4c>
80402bdc:	834fe0ef          	jal	ra,80400c10 <intr_enable>
80402be0:	f35ff06f          	j	80402b14 <kfree+0x6c>
80402be4:	0009a797          	auipc	a5,0x9a
80402be8:	ba87a623          	sw	s0,-1108(a5) # 8049c790 <bigblocks>
80402bec:	00068413          	mv	s0,a3
80402bf0:	820fe0ef          	jal	ra,80400c10 <intr_enable>
80402bf4:	f45ff06f          	j	80402b38 <kfree+0x90>
80402bf8:	00008067          	ret
80402bfc:	0009a797          	auipc	a5,0x9a
80402c00:	b887aa23          	sw	s0,-1132(a5) # 8049c790 <bigblocks>
80402c04:	00068413          	mv	s0,a3
80402c08:	f31ff06f          	j	80402b38 <kfree+0x90>
80402c0c:	00048693          	mv	a3,s1
80402c10:	00011617          	auipc	a2,0x11
80402c14:	acc60613          	addi	a2,a2,-1332 # 804136dc <default_pmm_manager+0x64>
80402c18:	07000593          	li	a1,112
80402c1c:	00011517          	auipc	a0,0x11
80402c20:	ab050513          	addi	a0,a0,-1360 # 804136cc <default_pmm_manager+0x54>
80402c24:	a01fd0ef          	jal	ra,80400624 <__panic>
80402c28:	00011617          	auipc	a2,0x11
80402c2c:	ad860613          	addi	a2,a2,-1320 # 80413700 <default_pmm_manager+0x88>
80402c30:	06900593          	li	a1,105
80402c34:	00011517          	auipc	a0,0x11
80402c38:	a9850513          	addi	a0,a0,-1384 # 804136cc <default_pmm_manager+0x54>
80402c3c:	9e9fd0ef          	jal	ra,80400624 <__panic>

80402c40 <get_pgtable_items.isra.4.part.5>:
80402c40:	04a5f063          	bgeu	a1,a0,80402c80 <get_pgtable_items.isra.4.part.5+0x40>
80402c44:	00259813          	slli	a6,a1,0x2
80402c48:	010608b3          	add	a7,a2,a6
80402c4c:	0008a783          	lw	a5,0(a7)
80402c50:	0017f793          	andi	a5,a5,1
80402c54:	02079c63          	bnez	a5,80402c8c <get_pgtable_items.isra.4.part.5+0x4c>
80402c58:	00480813          	addi	a6,a6,4
80402c5c:	01060833          	add	a6,a2,a6
80402c60:	0140006f          	j	80402c74 <get_pgtable_items.isra.4.part.5+0x34>
80402c64:	00082783          	lw	a5,0(a6)
80402c68:	00480813          	addi	a6,a6,4
80402c6c:	0017f793          	andi	a5,a5,1
80402c70:	00079e63          	bnez	a5,80402c8c <get_pgtable_items.isra.4.part.5+0x4c>
80402c74:	00158593          	addi	a1,a1,1
80402c78:	00080893          	mv	a7,a6
80402c7c:	fea594e3          	bne	a1,a0,80402c64 <get_pgtable_items.isra.4.part.5+0x24>
80402c80:	00000693          	li	a3,0
80402c84:	00068513          	mv	a0,a3
80402c88:	00008067          	ret
80402c8c:	00b6a023          	sw	a1,0(a3)
80402c90:	0008a683          	lw	a3,0(a7)
80402c94:	00158593          	addi	a1,a1,1
80402c98:	01f6f693          	andi	a3,a3,31
80402c9c:	02a5fe63          	bgeu	a1,a0,80402cd8 <get_pgtable_items.isra.4.part.5+0x98>
80402ca0:	00259793          	slli	a5,a1,0x2
80402ca4:	00f60833          	add	a6,a2,a5
80402ca8:	00082803          	lw	a6,0(a6)
80402cac:	ffc78793          	addi	a5,a5,-4
80402cb0:	00f60633          	add	a2,a2,a5
80402cb4:	01f87813          	andi	a6,a6,31
80402cb8:	00d80c63          	beq	a6,a3,80402cd0 <get_pgtable_items.isra.4.part.5+0x90>
80402cbc:	01c0006f          	j	80402cd8 <get_pgtable_items.isra.4.part.5+0x98>
80402cc0:	00862783          	lw	a5,8(a2)
80402cc4:	00460613          	addi	a2,a2,4
80402cc8:	01f7f793          	andi	a5,a5,31
80402ccc:	00d79663          	bne	a5,a3,80402cd8 <get_pgtable_items.isra.4.part.5+0x98>
80402cd0:	00158593          	addi	a1,a1,1
80402cd4:	fea5e6e3          	bltu	a1,a0,80402cc0 <get_pgtable_items.isra.4.part.5+0x80>
80402cd8:	00b72023          	sw	a1,0(a4)
80402cdc:	00068513          	mv	a0,a3
80402ce0:	00008067          	ret

80402ce4 <pa2page.part.6>:
80402ce4:	ff010113          	addi	sp,sp,-16
80402ce8:	00011617          	auipc	a2,0x11
80402cec:	a1860613          	addi	a2,a2,-1512 # 80413700 <default_pmm_manager+0x88>
80402cf0:	06900593          	li	a1,105
80402cf4:	00011517          	auipc	a0,0x11
80402cf8:	9d850513          	addi	a0,a0,-1576 # 804136cc <default_pmm_manager+0x54>
80402cfc:	00112623          	sw	ra,12(sp)
80402d00:	925fd0ef          	jal	ra,80400624 <__panic>

80402d04 <alloc_pages>:
80402d04:	fd010113          	addi	sp,sp,-48
80402d08:	02812423          	sw	s0,40(sp)
80402d0c:	02912223          	sw	s1,36(sp)
80402d10:	03212023          	sw	s2,32(sp)
80402d14:	01312e23          	sw	s3,28(sp)
80402d18:	01412c23          	sw	s4,24(sp)
80402d1c:	02112623          	sw	ra,44(sp)
80402d20:	00050413          	mv	s0,a0
80402d24:	0009a497          	auipc	s1,0x9a
80402d28:	ad848493          	addi	s1,s1,-1320 # 8049c7fc <pmm_manager>
80402d2c:	00100913          	li	s2,1
80402d30:	0009a997          	auipc	s3,0x9a
80402d34:	a7498993          	addi	s3,s3,-1420 # 8049c7a4 <swap_init_ok>
80402d38:	0009aa17          	auipc	s4,0x9a
80402d3c:	b78a0a13          	addi	s4,s4,-1160 # 8049c8b0 <check_mm_struct>
80402d40:	0300006f          	j	80402d70 <alloc_pages+0x6c>
80402d44:	0004a783          	lw	a5,0(s1)
80402d48:	00c7a783          	lw	a5,12(a5)
80402d4c:	000780e7          	jalr	a5
80402d50:	00000613          	li	a2,0
80402d54:	00040593          	mv	a1,s0
80402d58:	04051a63          	bnez	a0,80402dac <alloc_pages+0xa8>
80402d5c:	04896863          	bltu	s2,s0,80402dac <alloc_pages+0xa8>
80402d60:	0009a783          	lw	a5,0(s3)
80402d64:	04078463          	beqz	a5,80402dac <alloc_pages+0xa8>
80402d68:	000a2503          	lw	a0,0(s4)
80402d6c:	16c010ef          	jal	ra,80403ed8 <swap_out>
80402d70:	100027f3          	csrr	a5,sstatus
80402d74:	0027f793          	andi	a5,a5,2
80402d78:	00040513          	mv	a0,s0
80402d7c:	fc0784e3          	beqz	a5,80402d44 <alloc_pages+0x40>
80402d80:	e99fd0ef          	jal	ra,80400c18 <intr_disable>
80402d84:	0004a783          	lw	a5,0(s1)
80402d88:	00040513          	mv	a0,s0
80402d8c:	00c7a783          	lw	a5,12(a5)
80402d90:	000780e7          	jalr	a5
80402d94:	00a12623          	sw	a0,12(sp)
80402d98:	e79fd0ef          	jal	ra,80400c10 <intr_enable>
80402d9c:	00c12503          	lw	a0,12(sp)
80402da0:	00000613          	li	a2,0
80402da4:	00040593          	mv	a1,s0
80402da8:	fa050ae3          	beqz	a0,80402d5c <alloc_pages+0x58>
80402dac:	02c12083          	lw	ra,44(sp)
80402db0:	02812403          	lw	s0,40(sp)
80402db4:	02412483          	lw	s1,36(sp)
80402db8:	02012903          	lw	s2,32(sp)
80402dbc:	01c12983          	lw	s3,28(sp)
80402dc0:	01812a03          	lw	s4,24(sp)
80402dc4:	03010113          	addi	sp,sp,48
80402dc8:	00008067          	ret

80402dcc <free_pages>:
80402dcc:	100027f3          	csrr	a5,sstatus
80402dd0:	0027f793          	andi	a5,a5,2
80402dd4:	00079c63          	bnez	a5,80402dec <free_pages+0x20>
80402dd8:	0009a797          	auipc	a5,0x9a
80402ddc:	a2478793          	addi	a5,a5,-1500 # 8049c7fc <pmm_manager>
80402de0:	0007a783          	lw	a5,0(a5)
80402de4:	0107a303          	lw	t1,16(a5)
80402de8:	00030067          	jr	t1
80402dec:	ff010113          	addi	sp,sp,-16
80402df0:	00112623          	sw	ra,12(sp)
80402df4:	00812423          	sw	s0,8(sp)
80402df8:	00912223          	sw	s1,4(sp)
80402dfc:	00050413          	mv	s0,a0
80402e00:	00058493          	mv	s1,a1
80402e04:	e15fd0ef          	jal	ra,80400c18 <intr_disable>
80402e08:	0009a797          	auipc	a5,0x9a
80402e0c:	9f478793          	addi	a5,a5,-1548 # 8049c7fc <pmm_manager>
80402e10:	0007a783          	lw	a5,0(a5)
80402e14:	00048593          	mv	a1,s1
80402e18:	00040513          	mv	a0,s0
80402e1c:	0107a783          	lw	a5,16(a5)
80402e20:	000780e7          	jalr	a5
80402e24:	00812403          	lw	s0,8(sp)
80402e28:	00c12083          	lw	ra,12(sp)
80402e2c:	00412483          	lw	s1,4(sp)
80402e30:	01010113          	addi	sp,sp,16
80402e34:	dddfd06f          	j	80400c10 <intr_enable>

80402e38 <nr_free_pages>:
80402e38:	100027f3          	csrr	a5,sstatus
80402e3c:	0027f793          	andi	a5,a5,2
80402e40:	00079c63          	bnez	a5,80402e58 <nr_free_pages+0x20>
80402e44:	0009a797          	auipc	a5,0x9a
80402e48:	9b878793          	addi	a5,a5,-1608 # 8049c7fc <pmm_manager>
80402e4c:	0007a783          	lw	a5,0(a5)
80402e50:	0147a303          	lw	t1,20(a5)
80402e54:	00030067          	jr	t1
80402e58:	ff010113          	addi	sp,sp,-16
80402e5c:	00112623          	sw	ra,12(sp)
80402e60:	00812423          	sw	s0,8(sp)
80402e64:	db5fd0ef          	jal	ra,80400c18 <intr_disable>
80402e68:	0009a797          	auipc	a5,0x9a
80402e6c:	99478793          	addi	a5,a5,-1644 # 8049c7fc <pmm_manager>
80402e70:	0007a783          	lw	a5,0(a5)
80402e74:	0147a783          	lw	a5,20(a5)
80402e78:	000780e7          	jalr	a5
80402e7c:	00050413          	mv	s0,a0
80402e80:	d91fd0ef          	jal	ra,80400c10 <intr_enable>
80402e84:	00040513          	mv	a0,s0
80402e88:	00c12083          	lw	ra,12(sp)
80402e8c:	00812403          	lw	s0,8(sp)
80402e90:	01010113          	addi	sp,sp,16
80402e94:	00008067          	ret

80402e98 <get_pte>:
80402e98:	fe010113          	addi	sp,sp,-32
80402e9c:	01212823          	sw	s2,16(sp)
80402ea0:	0165d913          	srli	s2,a1,0x16
80402ea4:	00291913          	slli	s2,s2,0x2
80402ea8:	01250933          	add	s2,a0,s2
80402eac:	00092683          	lw	a3,0(s2)
80402eb0:	00912a23          	sw	s1,20(sp)
80402eb4:	01312623          	sw	s3,12(sp)
80402eb8:	00112e23          	sw	ra,28(sp)
80402ebc:	00812c23          	sw	s0,24(sp)
80402ec0:	01412423          	sw	s4,8(sp)
80402ec4:	01512223          	sw	s5,4(sp)
80402ec8:	0016f793          	andi	a5,a3,1
80402ecc:	00058493          	mv	s1,a1
80402ed0:	0009a997          	auipc	s3,0x9a
80402ed4:	8c898993          	addi	s3,s3,-1848 # 8049c798 <npage>
80402ed8:	08079863          	bnez	a5,80402f68 <get_pte+0xd0>
80402edc:	0e060463          	beqz	a2,80402fc4 <get_pte+0x12c>
80402ee0:	00100513          	li	a0,1
80402ee4:	e21ff0ef          	jal	ra,80402d04 <alloc_pages>
80402ee8:	00050413          	mv	s0,a0
80402eec:	0c050c63          	beqz	a0,80402fc4 <get_pte+0x12c>
80402ef0:	0009aa97          	auipc	s5,0x9a
80402ef4:	918a8a93          	addi	s5,s5,-1768 # 8049c808 <pages>
80402ef8:	000aa503          	lw	a0,0(s5)
80402efc:	00100793          	li	a5,1
80402f00:	00f42023          	sw	a5,0(s0)
80402f04:	40a40533          	sub	a0,s0,a0
80402f08:	40555513          	srai	a0,a0,0x5
80402f0c:	00080a37          	lui	s4,0x80
80402f10:	0009a997          	auipc	s3,0x9a
80402f14:	88898993          	addi	s3,s3,-1912 # 8049c798 <npage>
80402f18:	01450533          	add	a0,a0,s4
80402f1c:	0009a703          	lw	a4,0(s3)
80402f20:	00c51793          	slli	a5,a0,0xc
80402f24:	00c7d793          	srli	a5,a5,0xc
80402f28:	00c51513          	slli	a0,a0,0xc
80402f2c:	0ae7fc63          	bgeu	a5,a4,80402fe4 <get_pte+0x14c>
80402f30:	0009a797          	auipc	a5,0x9a
80402f34:	8d078793          	addi	a5,a5,-1840 # 8049c800 <va_pa_offset>
80402f38:	0007a783          	lw	a5,0(a5)
80402f3c:	00001637          	lui	a2,0x1
80402f40:	00000593          	li	a1,0
80402f44:	00f50533          	add	a0,a0,a5
80402f48:	7c40f0ef          	jal	ra,8041270c <memset>
80402f4c:	000aa683          	lw	a3,0(s5)
80402f50:	40d406b3          	sub	a3,s0,a3
80402f54:	4056d693          	srai	a3,a3,0x5
80402f58:	014686b3          	add	a3,a3,s4
80402f5c:	00a69693          	slli	a3,a3,0xa
80402f60:	0116e693          	ori	a3,a3,17
80402f64:	00d92023          	sw	a3,0(s2)
80402f68:	00269693          	slli	a3,a3,0x2
80402f6c:	fffff537          	lui	a0,0xfffff
80402f70:	0009a703          	lw	a4,0(s3)
80402f74:	00a6f6b3          	and	a3,a3,a0
80402f78:	00c6d793          	srli	a5,a3,0xc
80402f7c:	04e7f863          	bgeu	a5,a4,80402fcc <get_pte+0x134>
80402f80:	0009a797          	auipc	a5,0x9a
80402f84:	88078793          	addi	a5,a5,-1920 # 8049c800 <va_pa_offset>
80402f88:	0007a503          	lw	a0,0(a5)
80402f8c:	00c4d493          	srli	s1,s1,0xc
80402f90:	3ff4f493          	andi	s1,s1,1023
80402f94:	00a686b3          	add	a3,a3,a0
80402f98:	00249513          	slli	a0,s1,0x2
80402f9c:	00a68533          	add	a0,a3,a0
80402fa0:	01c12083          	lw	ra,28(sp)
80402fa4:	01812403          	lw	s0,24(sp)
80402fa8:	01412483          	lw	s1,20(sp)
80402fac:	01012903          	lw	s2,16(sp)
80402fb0:	00c12983          	lw	s3,12(sp)
80402fb4:	00812a03          	lw	s4,8(sp)
80402fb8:	00412a83          	lw	s5,4(sp)
80402fbc:	02010113          	addi	sp,sp,32
80402fc0:	00008067          	ret
80402fc4:	00000513          	li	a0,0
80402fc8:	fd9ff06f          	j	80402fa0 <get_pte+0x108>
80402fcc:	00010617          	auipc	a2,0x10
80402fd0:	6dc60613          	addi	a2,a2,1756 # 804136a8 <default_pmm_manager+0x30>
80402fd4:	11f00593          	li	a1,287
80402fd8:	00011517          	auipc	a0,0x11
80402fdc:	85450513          	addi	a0,a0,-1964 # 8041382c <default_pmm_manager+0x1b4>
80402fe0:	e44fd0ef          	jal	ra,80400624 <__panic>
80402fe4:	00050693          	mv	a3,a0
80402fe8:	00010617          	auipc	a2,0x10
80402fec:	6c060613          	addi	a2,a2,1728 # 804136a8 <default_pmm_manager+0x30>
80402ff0:	11c00593          	li	a1,284
80402ff4:	00011517          	auipc	a0,0x11
80402ff8:	83850513          	addi	a0,a0,-1992 # 8041382c <default_pmm_manager+0x1b4>
80402ffc:	e28fd0ef          	jal	ra,80400624 <__panic>

80403000 <unmap_range>:
80403000:	fd010113          	addi	sp,sp,-48
80403004:	00c5e7b3          	or	a5,a1,a2
80403008:	02112623          	sw	ra,44(sp)
8040300c:	02812423          	sw	s0,40(sp)
80403010:	02912223          	sw	s1,36(sp)
80403014:	03212023          	sw	s2,32(sp)
80403018:	01312e23          	sw	s3,28(sp)
8040301c:	01412c23          	sw	s4,24(sp)
80403020:	01512a23          	sw	s5,20(sp)
80403024:	01612823          	sw	s6,16(sp)
80403028:	01712623          	sw	s7,12(sp)
8040302c:	01812423          	sw	s8,8(sp)
80403030:	01912223          	sw	s9,4(sp)
80403034:	01479713          	slli	a4,a5,0x14
80403038:	12071463          	bnez	a4,80403160 <unmap_range+0x160>
8040303c:	002007b7          	lui	a5,0x200
80403040:	00058413          	mv	s0,a1
80403044:	0ef5ee63          	bltu	a1,a5,80403140 <unmap_range+0x140>
80403048:	00060913          	mv	s2,a2
8040304c:	0ec5fa63          	bgeu	a1,a2,80403140 <unmap_range+0x140>
80403050:	800007b7          	lui	a5,0x80000
80403054:	0ec7e663          	bltu	a5,a2,80403140 <unmap_range+0x140>
80403058:	00050993          	mv	s3,a0
8040305c:	00001a37          	lui	s4,0x1
80403060:	00099c97          	auipc	s9,0x99
80403064:	738c8c93          	addi	s9,s9,1848 # 8049c798 <npage>
80403068:	00099c17          	auipc	s8,0x99
8040306c:	7a0c0c13          	addi	s8,s8,1952 # 8049c808 <pages>
80403070:	fff80bb7          	lui	s7,0xfff80
80403074:	00400b37          	lui	s6,0x400
80403078:	ffc00ab7          	lui	s5,0xffc00
8040307c:	00000613          	li	a2,0
80403080:	00040593          	mv	a1,s0
80403084:	00098513          	mv	a0,s3
80403088:	e11ff0ef          	jal	ra,80402e98 <get_pte>
8040308c:	00050493          	mv	s1,a0
80403090:	08050863          	beqz	a0,80403120 <unmap_range+0x120>
80403094:	00052783          	lw	a5,0(a0)
80403098:	04079063          	bnez	a5,804030d8 <unmap_range+0xd8>
8040309c:	01440433          	add	s0,s0,s4
804030a0:	fd246ee3          	bltu	s0,s2,8040307c <unmap_range+0x7c>
804030a4:	02c12083          	lw	ra,44(sp)
804030a8:	02812403          	lw	s0,40(sp)
804030ac:	02412483          	lw	s1,36(sp)
804030b0:	02012903          	lw	s2,32(sp)
804030b4:	01c12983          	lw	s3,28(sp)
804030b8:	01812a03          	lw	s4,24(sp)
804030bc:	01412a83          	lw	s5,20(sp)
804030c0:	01012b03          	lw	s6,16(sp)
804030c4:	00c12b83          	lw	s7,12(sp)
804030c8:	00812c03          	lw	s8,8(sp)
804030cc:	00412c83          	lw	s9,4(sp)
804030d0:	03010113          	addi	sp,sp,48
804030d4:	00008067          	ret
804030d8:	0017f713          	andi	a4,a5,1
804030dc:	fc0700e3          	beqz	a4,8040309c <unmap_range+0x9c>
804030e0:	000ca703          	lw	a4,0(s9)
804030e4:	00279793          	slli	a5,a5,0x2
804030e8:	00c7d793          	srli	a5,a5,0xc
804030ec:	08e7fa63          	bgeu	a5,a4,80403180 <unmap_range+0x180>
804030f0:	000c2503          	lw	a0,0(s8)
804030f4:	017787b3          	add	a5,a5,s7
804030f8:	00579793          	slli	a5,a5,0x5
804030fc:	00f50533          	add	a0,a0,a5
80403100:	00052783          	lw	a5,0(a0)
80403104:	fff78793          	addi	a5,a5,-1 # 7fffffff <end+0xffb63743>
80403108:	00f52023          	sw	a5,0(a0)
8040310c:	02078463          	beqz	a5,80403134 <unmap_range+0x134>
80403110:	0004a023          	sw	zero,0(s1)
80403114:	12040073          	sfence.vma	s0
80403118:	01440433          	add	s0,s0,s4
8040311c:	f85ff06f          	j	804030a0 <unmap_range+0xa0>
80403120:	01640433          	add	s0,s0,s6
80403124:	01547433          	and	s0,s0,s5
80403128:	f6040ee3          	beqz	s0,804030a4 <unmap_range+0xa4>
8040312c:	f52468e3          	bltu	s0,s2,8040307c <unmap_range+0x7c>
80403130:	f75ff06f          	j	804030a4 <unmap_range+0xa4>
80403134:	00100593          	li	a1,1
80403138:	c95ff0ef          	jal	ra,80402dcc <free_pages>
8040313c:	fd5ff06f          	j	80403110 <unmap_range+0x110>
80403140:	00011697          	auipc	a3,0x11
80403144:	88468693          	addi	a3,a3,-1916 # 804139c4 <default_pmm_manager+0x34c>
80403148:	00010617          	auipc	a2,0x10
8040314c:	9f460613          	addi	a2,a2,-1548 # 80412b3c <commands+0x1bc>
80403150:	15700593          	li	a1,343
80403154:	00010517          	auipc	a0,0x10
80403158:	6d850513          	addi	a0,a0,1752 # 8041382c <default_pmm_manager+0x1b4>
8040315c:	cc8fd0ef          	jal	ra,80400624 <__panic>
80403160:	00011697          	auipc	a3,0x11
80403164:	83868693          	addi	a3,a3,-1992 # 80413998 <default_pmm_manager+0x320>
80403168:	00010617          	auipc	a2,0x10
8040316c:	9d460613          	addi	a2,a2,-1580 # 80412b3c <commands+0x1bc>
80403170:	15600593          	li	a1,342
80403174:	00010517          	auipc	a0,0x10
80403178:	6b850513          	addi	a0,a0,1720 # 8041382c <default_pmm_manager+0x1b4>
8040317c:	ca8fd0ef          	jal	ra,80400624 <__panic>
80403180:	b65ff0ef          	jal	ra,80402ce4 <pa2page.part.6>

80403184 <exit_range>:
80403184:	fd010113          	addi	sp,sp,-48
80403188:	00c5e7b3          	or	a5,a1,a2
8040318c:	02112623          	sw	ra,44(sp)
80403190:	02812423          	sw	s0,40(sp)
80403194:	02912223          	sw	s1,36(sp)
80403198:	03212023          	sw	s2,32(sp)
8040319c:	01312e23          	sw	s3,28(sp)
804031a0:	01412c23          	sw	s4,24(sp)
804031a4:	01512a23          	sw	s5,20(sp)
804031a8:	01612823          	sw	s6,16(sp)
804031ac:	01712623          	sw	s7,12(sp)
804031b0:	01479713          	slli	a4,a5,0x14
804031b4:	0e071c63          	bnez	a4,804032ac <exit_range+0x128>
804031b8:	002007b7          	lui	a5,0x200
804031bc:	0cf5e863          	bltu	a1,a5,8040328c <exit_range+0x108>
804031c0:	00060913          	mv	s2,a2
804031c4:	0cc5f463          	bgeu	a1,a2,8040328c <exit_range+0x108>
804031c8:	ffc004b7          	lui	s1,0xffc00
804031cc:	800007b7          	lui	a5,0x80000
804031d0:	0095f4b3          	and	s1,a1,s1
804031d4:	0ac7ec63          	bltu	a5,a2,8040328c <exit_range+0x108>
804031d8:	00050a13          	mv	s4,a0
804031dc:	00099b17          	auipc	s6,0x99
804031e0:	5bcb0b13          	addi	s6,s6,1468 # 8049c798 <npage>
804031e4:	00099b97          	auipc	s7,0x99
804031e8:	624b8b93          	addi	s7,s7,1572 # 8049c808 <pages>
804031ec:	fff809b7          	lui	s3,0xfff80
804031f0:	00400ab7          	lui	s5,0x400
804031f4:	0080006f          	j	804031fc <exit_range+0x78>
804031f8:	0524f863          	bgeu	s1,s2,80403248 <exit_range+0xc4>
804031fc:	0164d413          	srli	s0,s1,0x16
80403200:	00241413          	slli	s0,s0,0x2
80403204:	008a0433          	add	s0,s4,s0
80403208:	00042783          	lw	a5,0(s0)
8040320c:	0017f713          	andi	a4,a5,1
80403210:	02070863          	beqz	a4,80403240 <exit_range+0xbc>
80403214:	000b2703          	lw	a4,0(s6)
80403218:	00279793          	slli	a5,a5,0x2
8040321c:	00c7d793          	srli	a5,a5,0xc
80403220:	04e7fa63          	bgeu	a5,a4,80403274 <exit_range+0xf0>
80403224:	000ba503          	lw	a0,0(s7)
80403228:	013787b3          	add	a5,a5,s3
8040322c:	00579793          	slli	a5,a5,0x5
80403230:	00100593          	li	a1,1
80403234:	00f50533          	add	a0,a0,a5
80403238:	b95ff0ef          	jal	ra,80402dcc <free_pages>
8040323c:	00042023          	sw	zero,0(s0)
80403240:	015484b3          	add	s1,s1,s5
80403244:	fa049ae3          	bnez	s1,804031f8 <exit_range+0x74>
80403248:	02c12083          	lw	ra,44(sp)
8040324c:	02812403          	lw	s0,40(sp)
80403250:	02412483          	lw	s1,36(sp)
80403254:	02012903          	lw	s2,32(sp)
80403258:	01c12983          	lw	s3,28(sp)
8040325c:	01812a03          	lw	s4,24(sp)
80403260:	01412a83          	lw	s5,20(sp)
80403264:	01012b03          	lw	s6,16(sp)
80403268:	00c12b83          	lw	s7,12(sp)
8040326c:	03010113          	addi	sp,sp,48
80403270:	00008067          	ret
80403274:	00010617          	auipc	a2,0x10
80403278:	48c60613          	addi	a2,a2,1164 # 80413700 <default_pmm_manager+0x88>
8040327c:	06900593          	li	a1,105
80403280:	00010517          	auipc	a0,0x10
80403284:	44c50513          	addi	a0,a0,1100 # 804136cc <default_pmm_manager+0x54>
80403288:	b9cfd0ef          	jal	ra,80400624 <__panic>
8040328c:	00010697          	auipc	a3,0x10
80403290:	73868693          	addi	a3,a3,1848 # 804139c4 <default_pmm_manager+0x34c>
80403294:	00010617          	auipc	a2,0x10
80403298:	8a860613          	addi	a2,a2,-1880 # 80412b3c <commands+0x1bc>
8040329c:	16800593          	li	a1,360
804032a0:	00010517          	auipc	a0,0x10
804032a4:	58c50513          	addi	a0,a0,1420 # 8041382c <default_pmm_manager+0x1b4>
804032a8:	b7cfd0ef          	jal	ra,80400624 <__panic>
804032ac:	00010697          	auipc	a3,0x10
804032b0:	6ec68693          	addi	a3,a3,1772 # 80413998 <default_pmm_manager+0x320>
804032b4:	00010617          	auipc	a2,0x10
804032b8:	88860613          	addi	a2,a2,-1912 # 80412b3c <commands+0x1bc>
804032bc:	16700593          	li	a1,359
804032c0:	00010517          	auipc	a0,0x10
804032c4:	56c50513          	addi	a0,a0,1388 # 8041382c <default_pmm_manager+0x1b4>
804032c8:	b5cfd0ef          	jal	ra,80400624 <__panic>

804032cc <page_insert>:
804032cc:	fe010113          	addi	sp,sp,-32
804032d0:	01312623          	sw	s3,12(sp)
804032d4:	00060993          	mv	s3,a2
804032d8:	00812c23          	sw	s0,24(sp)
804032dc:	00100613          	li	a2,1
804032e0:	00058413          	mv	s0,a1
804032e4:	00098593          	mv	a1,s3
804032e8:	01212823          	sw	s2,16(sp)
804032ec:	00112e23          	sw	ra,28(sp)
804032f0:	00912a23          	sw	s1,20(sp)
804032f4:	01412423          	sw	s4,8(sp)
804032f8:	00068913          	mv	s2,a3
804032fc:	b9dff0ef          	jal	ra,80402e98 <get_pte>
80403300:	0e050063          	beqz	a0,804033e0 <page_insert+0x114>
80403304:	00042683          	lw	a3,0(s0)
80403308:	00050493          	mv	s1,a0
8040330c:	00168793          	addi	a5,a3,1
80403310:	00f42023          	sw	a5,0(s0)
80403314:	00052783          	lw	a5,0(a0)
80403318:	0017f713          	andi	a4,a5,1
8040331c:	04071c63          	bnez	a4,80403374 <page_insert+0xa8>
80403320:	00099797          	auipc	a5,0x99
80403324:	4e878793          	addi	a5,a5,1256 # 8049c808 <pages>
80403328:	0007a703          	lw	a4,0(a5)
8040332c:	40e40433          	sub	s0,s0,a4
80403330:	000806b7          	lui	a3,0x80
80403334:	40545413          	srai	s0,s0,0x5
80403338:	00d40433          	add	s0,s0,a3
8040333c:	00a41413          	slli	s0,s0,0xa
80403340:	01246433          	or	s0,s0,s2
80403344:	00146413          	ori	s0,s0,1
80403348:	0084a023          	sw	s0,0(s1) # ffc00000 <end+0x7f763744>
8040334c:	12098073          	sfence.vma	s3
80403350:	00000513          	li	a0,0
80403354:	01c12083          	lw	ra,28(sp)
80403358:	01812403          	lw	s0,24(sp)
8040335c:	01412483          	lw	s1,20(sp)
80403360:	01012903          	lw	s2,16(sp)
80403364:	00c12983          	lw	s3,12(sp)
80403368:	00812a03          	lw	s4,8(sp)
8040336c:	02010113          	addi	sp,sp,32
80403370:	00008067          	ret
80403374:	00099717          	auipc	a4,0x99
80403378:	42470713          	addi	a4,a4,1060 # 8049c798 <npage>
8040337c:	00072703          	lw	a4,0(a4)
80403380:	00279793          	slli	a5,a5,0x2
80403384:	00c7d793          	srli	a5,a5,0xc
80403388:	06e7f063          	bgeu	a5,a4,804033e8 <page_insert+0x11c>
8040338c:	00099a17          	auipc	s4,0x99
80403390:	47ca0a13          	addi	s4,s4,1148 # 8049c808 <pages>
80403394:	000a2703          	lw	a4,0(s4)
80403398:	fff80537          	lui	a0,0xfff80
8040339c:	00a78533          	add	a0,a5,a0
804033a0:	00551513          	slli	a0,a0,0x5
804033a4:	00a70533          	add	a0,a4,a0
804033a8:	00a40e63          	beq	s0,a0,804033c4 <page_insert+0xf8>
804033ac:	00052783          	lw	a5,0(a0) # fff80000 <end+0x7fae3744>
804033b0:	fff78793          	addi	a5,a5,-1
804033b4:	00f52023          	sw	a5,0(a0)
804033b8:	00078a63          	beqz	a5,804033cc <page_insert+0x100>
804033bc:	12098073          	sfence.vma	s3
804033c0:	f6dff06f          	j	8040332c <page_insert+0x60>
804033c4:	00d42023          	sw	a3,0(s0)
804033c8:	f65ff06f          	j	8040332c <page_insert+0x60>
804033cc:	00100593          	li	a1,1
804033d0:	9fdff0ef          	jal	ra,80402dcc <free_pages>
804033d4:	000a2703          	lw	a4,0(s4)
804033d8:	12098073          	sfence.vma	s3
804033dc:	f51ff06f          	j	8040332c <page_insert+0x60>
804033e0:	ffc00513          	li	a0,-4
804033e4:	f71ff06f          	j	80403354 <page_insert+0x88>
804033e8:	8fdff0ef          	jal	ra,80402ce4 <pa2page.part.6>

804033ec <copy_range>:
804033ec:	fc010113          	addi	sp,sp,-64
804033f0:	00d667b3          	or	a5,a2,a3
804033f4:	02112e23          	sw	ra,60(sp)
804033f8:	02812c23          	sw	s0,56(sp)
804033fc:	02912a23          	sw	s1,52(sp)
80403400:	03212823          	sw	s2,48(sp)
80403404:	03312623          	sw	s3,44(sp)
80403408:	03412423          	sw	s4,40(sp)
8040340c:	03512223          	sw	s5,36(sp)
80403410:	03612023          	sw	s6,32(sp)
80403414:	01712e23          	sw	s7,28(sp)
80403418:	01812c23          	sw	s8,24(sp)
8040341c:	01912a23          	sw	s9,20(sp)
80403420:	01a12823          	sw	s10,16(sp)
80403424:	01b12623          	sw	s11,12(sp)
80403428:	01479713          	slli	a4,a5,0x14
8040342c:	26071663          	bnez	a4,80403698 <copy_range+0x2ac>
80403430:	002007b7          	lui	a5,0x200
80403434:	00060413          	mv	s0,a2
80403438:	1ef66863          	bltu	a2,a5,80403628 <copy_range+0x23c>
8040343c:	00068493          	mv	s1,a3
80403440:	1ed67463          	bgeu	a2,a3,80403628 <copy_range+0x23c>
80403444:	800007b7          	lui	a5,0x80000
80403448:	1ed7e063          	bltu	a5,a3,80403628 <copy_range+0x23c>
8040344c:	00100a37          	lui	s4,0x100
80403450:	00050a93          	mv	s5,a0
80403454:	00058913          	mv	s2,a1
80403458:	000019b7          	lui	s3,0x1
8040345c:	00099c17          	auipc	s8,0x99
80403460:	33cc0c13          	addi	s8,s8,828 # 8049c798 <npage>
80403464:	00099b97          	auipc	s7,0x99
80403468:	3a4b8b93          	addi	s7,s7,932 # 8049c808 <pages>
8040346c:	00080b37          	lui	s6,0x80
80403470:	fffa0a13          	addi	s4,s4,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
80403474:	00000613          	li	a2,0
80403478:	00040593          	mv	a1,s0
8040347c:	00090513          	mv	a0,s2
80403480:	a19ff0ef          	jal	ra,80402e98 <get_pte>
80403484:	00050c93          	mv	s9,a0
80403488:	14050063          	beqz	a0,804035c8 <copy_range+0x1dc>
8040348c:	00052783          	lw	a5,0(a0)
80403490:	0017f793          	andi	a5,a5,1
80403494:	04079663          	bnez	a5,804034e0 <copy_range+0xf4>
80403498:	01340433          	add	s0,s0,s3
8040349c:	fc946ce3          	bltu	s0,s1,80403474 <copy_range+0x88>
804034a0:	00000513          	li	a0,0
804034a4:	03c12083          	lw	ra,60(sp)
804034a8:	03812403          	lw	s0,56(sp)
804034ac:	03412483          	lw	s1,52(sp)
804034b0:	03012903          	lw	s2,48(sp)
804034b4:	02c12983          	lw	s3,44(sp)
804034b8:	02812a03          	lw	s4,40(sp)
804034bc:	02412a83          	lw	s5,36(sp)
804034c0:	02012b03          	lw	s6,32(sp)
804034c4:	01c12b83          	lw	s7,28(sp)
804034c8:	01812c03          	lw	s8,24(sp)
804034cc:	01412c83          	lw	s9,20(sp)
804034d0:	01012d03          	lw	s10,16(sp)
804034d4:	00c12d83          	lw	s11,12(sp)
804034d8:	04010113          	addi	sp,sp,64
804034dc:	00008067          	ret
804034e0:	00100613          	li	a2,1
804034e4:	00040593          	mv	a1,s0
804034e8:	000a8513          	mv	a0,s5
804034ec:	9adff0ef          	jal	ra,80402e98 <get_pte>
804034f0:	0e050a63          	beqz	a0,804035e4 <copy_range+0x1f8>
804034f4:	000ca783          	lw	a5,0(s9)
804034f8:	0017f713          	andi	a4,a5,1
804034fc:	01f7fc93          	andi	s9,a5,31
80403500:	18070063          	beqz	a4,80403680 <copy_range+0x294>
80403504:	000c2683          	lw	a3,0(s8)
80403508:	00279793          	slli	a5,a5,0x2
8040350c:	00c7d713          	srli	a4,a5,0xc
80403510:	14d77c63          	bgeu	a4,a3,80403668 <copy_range+0x27c>
80403514:	000ba783          	lw	a5,0(s7)
80403518:	fff806b7          	lui	a3,0xfff80
8040351c:	00d70733          	add	a4,a4,a3
80403520:	00571713          	slli	a4,a4,0x5
80403524:	00100513          	li	a0,1
80403528:	00e78db3          	add	s11,a5,a4
8040352c:	fd8ff0ef          	jal	ra,80402d04 <alloc_pages>
80403530:	00050d13          	mv	s10,a0
80403534:	0c0d8a63          	beqz	s11,80403608 <copy_range+0x21c>
80403538:	10050863          	beqz	a0,80403648 <copy_range+0x25c>
8040353c:	000ba703          	lw	a4,0(s7)
80403540:	000c2603          	lw	a2,0(s8)
80403544:	40ed86b3          	sub	a3,s11,a4
80403548:	4056d693          	srai	a3,a3,0x5
8040354c:	016686b3          	add	a3,a3,s6
80403550:	0146f7b3          	and	a5,a3,s4
80403554:	00c69693          	slli	a3,a3,0xc
80403558:	08c7fc63          	bgeu	a5,a2,804035f0 <copy_range+0x204>
8040355c:	40e507b3          	sub	a5,a0,a4
80403560:	00099717          	auipc	a4,0x99
80403564:	2a070713          	addi	a4,a4,672 # 8049c800 <va_pa_offset>
80403568:	00072503          	lw	a0,0(a4)
8040356c:	4057d793          	srai	a5,a5,0x5
80403570:	016787b3          	add	a5,a5,s6
80403574:	0147f733          	and	a4,a5,s4
80403578:	00a685b3          	add	a1,a3,a0
8040357c:	00c79793          	slli	a5,a5,0xc
80403580:	06c77663          	bgeu	a4,a2,804035ec <copy_range+0x200>
80403584:	00001637          	lui	a2,0x1
80403588:	00a78533          	add	a0,a5,a0
8040358c:	1f00f0ef          	jal	ra,8041277c <memcpy>
80403590:	000c8693          	mv	a3,s9
80403594:	00040613          	mv	a2,s0
80403598:	000d0593          	mv	a1,s10
8040359c:	000a8513          	mv	a0,s5
804035a0:	d2dff0ef          	jal	ra,804032cc <page_insert>
804035a4:	ee050ae3          	beqz	a0,80403498 <copy_range+0xac>
804035a8:	00010697          	auipc	a3,0x10
804035ac:	27868693          	addi	a3,a3,632 # 80413820 <default_pmm_manager+0x1a8>
804035b0:	0000f617          	auipc	a2,0xf
804035b4:	58c60613          	addi	a2,a2,1420 # 80412b3c <commands+0x1bc>
804035b8:	1af00593          	li	a1,431
804035bc:	00010517          	auipc	a0,0x10
804035c0:	27050513          	addi	a0,a0,624 # 8041382c <default_pmm_manager+0x1b4>
804035c4:	860fd0ef          	jal	ra,80400624 <__panic>
804035c8:	004007b7          	lui	a5,0x400
804035cc:	00f40433          	add	s0,s0,a5
804035d0:	ffc007b7          	lui	a5,0xffc00
804035d4:	00f47433          	and	s0,s0,a5
804035d8:	ec0404e3          	beqz	s0,804034a0 <copy_range+0xb4>
804035dc:	e8946ce3          	bltu	s0,s1,80403474 <copy_range+0x88>
804035e0:	ec1ff06f          	j	804034a0 <copy_range+0xb4>
804035e4:	ffc00513          	li	a0,-4
804035e8:	ebdff06f          	j	804034a4 <copy_range+0xb8>
804035ec:	00078693          	mv	a3,a5
804035f0:	00010617          	auipc	a2,0x10
804035f4:	0b860613          	addi	a2,a2,184 # 804136a8 <default_pmm_manager+0x30>
804035f8:	06e00593          	li	a1,110
804035fc:	00010517          	auipc	a0,0x10
80403600:	0d050513          	addi	a0,a0,208 # 804136cc <default_pmm_manager+0x54>
80403604:	820fd0ef          	jal	ra,80400624 <__panic>
80403608:	00010697          	auipc	a3,0x10
8040360c:	1f868693          	addi	a3,a3,504 # 80413800 <default_pmm_manager+0x188>
80403610:	0000f617          	auipc	a2,0xf
80403614:	52c60613          	addi	a2,a2,1324 # 80412b3c <commands+0x1bc>
80403618:	19400593          	li	a1,404
8040361c:	00010517          	auipc	a0,0x10
80403620:	21050513          	addi	a0,a0,528 # 8041382c <default_pmm_manager+0x1b4>
80403624:	800fd0ef          	jal	ra,80400624 <__panic>
80403628:	00010697          	auipc	a3,0x10
8040362c:	39c68693          	addi	a3,a3,924 # 804139c4 <default_pmm_manager+0x34c>
80403630:	0000f617          	auipc	a2,0xf
80403634:	50c60613          	addi	a2,a2,1292 # 80412b3c <commands+0x1bc>
80403638:	18000593          	li	a1,384
8040363c:	00010517          	auipc	a0,0x10
80403640:	1f050513          	addi	a0,a0,496 # 8041382c <default_pmm_manager+0x1b4>
80403644:	fe1fc0ef          	jal	ra,80400624 <__panic>
80403648:	00010697          	auipc	a3,0x10
8040364c:	1c868693          	addi	a3,a3,456 # 80413810 <default_pmm_manager+0x198>
80403650:	0000f617          	auipc	a2,0xf
80403654:	4ec60613          	addi	a2,a2,1260 # 80412b3c <commands+0x1bc>
80403658:	19500593          	li	a1,405
8040365c:	00010517          	auipc	a0,0x10
80403660:	1d050513          	addi	a0,a0,464 # 8041382c <default_pmm_manager+0x1b4>
80403664:	fc1fc0ef          	jal	ra,80400624 <__panic>
80403668:	00010617          	auipc	a2,0x10
8040366c:	09860613          	addi	a2,a2,152 # 80413700 <default_pmm_manager+0x88>
80403670:	06900593          	li	a1,105
80403674:	00010517          	auipc	a0,0x10
80403678:	05850513          	addi	a0,a0,88 # 804136cc <default_pmm_manager+0x54>
8040367c:	fa9fc0ef          	jal	ra,80400624 <__panic>
80403680:	00010617          	auipc	a2,0x10
80403684:	15c60613          	addi	a2,a2,348 # 804137dc <default_pmm_manager+0x164>
80403688:	07400593          	li	a1,116
8040368c:	00010517          	auipc	a0,0x10
80403690:	04050513          	addi	a0,a0,64 # 804136cc <default_pmm_manager+0x54>
80403694:	f91fc0ef          	jal	ra,80400624 <__panic>
80403698:	00010697          	auipc	a3,0x10
8040369c:	30068693          	addi	a3,a3,768 # 80413998 <default_pmm_manager+0x320>
804036a0:	0000f617          	auipc	a2,0xf
804036a4:	49c60613          	addi	a2,a2,1180 # 80412b3c <commands+0x1bc>
804036a8:	17f00593          	li	a1,383
804036ac:	00010517          	auipc	a0,0x10
804036b0:	18050513          	addi	a0,a0,384 # 8041382c <default_pmm_manager+0x1b4>
804036b4:	f71fc0ef          	jal	ra,80400624 <__panic>

804036b8 <tlb_invalidate>:
804036b8:	12058073          	sfence.vma	a1
804036bc:	00008067          	ret

804036c0 <pgdir_alloc_page>:
804036c0:	fe010113          	addi	sp,sp,-32
804036c4:	01212823          	sw	s2,16(sp)
804036c8:	00050913          	mv	s2,a0
804036cc:	00100513          	li	a0,1
804036d0:	00812c23          	sw	s0,24(sp)
804036d4:	00912a23          	sw	s1,20(sp)
804036d8:	01312623          	sw	s3,12(sp)
804036dc:	00112e23          	sw	ra,28(sp)
804036e0:	00058493          	mv	s1,a1
804036e4:	00060993          	mv	s3,a2
804036e8:	e1cff0ef          	jal	ra,80402d04 <alloc_pages>
804036ec:	00050413          	mv	s0,a0
804036f0:	04050e63          	beqz	a0,8040374c <pgdir_alloc_page+0x8c>
804036f4:	00050593          	mv	a1,a0
804036f8:	00098693          	mv	a3,s3
804036fc:	00048613          	mv	a2,s1
80403700:	00090513          	mv	a0,s2
80403704:	bc9ff0ef          	jal	ra,804032cc <page_insert>
80403708:	06051263          	bnez	a0,8040376c <pgdir_alloc_page+0xac>
8040370c:	00099797          	auipc	a5,0x99
80403710:	09878793          	addi	a5,a5,152 # 8049c7a4 <swap_init_ok>
80403714:	0007a783          	lw	a5,0(a5)
80403718:	02078a63          	beqz	a5,8040374c <pgdir_alloc_page+0x8c>
8040371c:	00099797          	auipc	a5,0x99
80403720:	19478793          	addi	a5,a5,404 # 8049c8b0 <check_mm_struct>
80403724:	0007a503          	lw	a0,0(a5)
80403728:	02050263          	beqz	a0,8040374c <pgdir_alloc_page+0x8c>
8040372c:	00000693          	li	a3,0
80403730:	00040613          	mv	a2,s0
80403734:	00048593          	mv	a1,s1
80403738:	78c000ef          	jal	ra,80403ec4 <swap_map_swappable>
8040373c:	00042703          	lw	a4,0(s0)
80403740:	00942e23          	sw	s1,28(s0)
80403744:	00100793          	li	a5,1
80403748:	02f71c63          	bne	a4,a5,80403780 <pgdir_alloc_page+0xc0>
8040374c:	00040513          	mv	a0,s0
80403750:	01c12083          	lw	ra,28(sp)
80403754:	01812403          	lw	s0,24(sp)
80403758:	01412483          	lw	s1,20(sp)
8040375c:	01012903          	lw	s2,16(sp)
80403760:	00c12983          	lw	s3,12(sp)
80403764:	02010113          	addi	sp,sp,32
80403768:	00008067          	ret
8040376c:	00040513          	mv	a0,s0
80403770:	00100593          	li	a1,1
80403774:	e58ff0ef          	jal	ra,80402dcc <free_pages>
80403778:	00000413          	li	s0,0
8040377c:	fd1ff06f          	j	8040374c <pgdir_alloc_page+0x8c>
80403780:	00010697          	auipc	a3,0x10
80403784:	0bc68693          	addi	a3,a3,188 # 8041383c <default_pmm_manager+0x1c4>
80403788:	0000f617          	auipc	a2,0xf
8040378c:	3b460613          	addi	a2,a2,948 # 80412b3c <commands+0x1bc>
80403790:	1ee00593          	li	a1,494
80403794:	00010517          	auipc	a0,0x10
80403798:	09850513          	addi	a0,a0,152 # 8041382c <default_pmm_manager+0x1b4>
8040379c:	e89fc0ef          	jal	ra,80400624 <__panic>

804037a0 <print_pgdir>:
804037a0:	fa010113          	addi	sp,sp,-96
804037a4:	00010517          	auipc	a0,0x10
804037a8:	14850513          	addi	a0,a0,328 # 804138ec <default_pmm_manager+0x274>
804037ac:	05512223          	sw	s5,68(sp)
804037b0:	04112e23          	sw	ra,92(sp)
804037b4:	04812c23          	sw	s0,88(sp)
804037b8:	04912a23          	sw	s1,84(sp)
804037bc:	05212823          	sw	s2,80(sp)
804037c0:	05312623          	sw	s3,76(sp)
804037c4:	05412423          	sw	s4,72(sp)
804037c8:	05612023          	sw	s6,64(sp)
804037cc:	03712e23          	sw	s7,60(sp)
804037d0:	03812c23          	sw	s8,56(sp)
804037d4:	03912a23          	sw	s9,52(sp)
804037d8:	03a12823          	sw	s10,48(sp)
804037dc:	03b12623          	sw	s11,44(sp)
804037e0:	a1dfc0ef          	jal	ra,804001fc <cprintf>
804037e4:	00000593          	li	a1,0
804037e8:	00012a23          	sw	zero,20(sp)
804037ec:	00099a97          	auipc	s5,0x99
804037f0:	014a8a93          	addi	s5,s5,20 # 8049c800 <va_pa_offset>
804037f4:	01410713          	addi	a4,sp,20
804037f8:	01010693          	addi	a3,sp,16
804037fc:	fafec637          	lui	a2,0xfafec
80403800:	40000513          	li	a0,1024
80403804:	c3cff0ef          	jal	ra,80402c40 <get_pgtable_items.isra.4.part.5>
80403808:	00050493          	mv	s1,a0
8040380c:	08050663          	beqz	a0,80403898 <print_pgdir+0xf8>
80403810:	01412683          	lw	a3,20(sp)
80403814:	01012603          	lw	a2,16(sp)
80403818:	01b49313          	slli	t1,s1,0x1b
8040381c:	01d49813          	slli	a6,s1,0x1d
80403820:	41f35313          	srai	t1,t1,0x1f
80403824:	41f85813          	srai	a6,a6,0x1f
80403828:	04837313          	andi	t1,t1,72
8040382c:	40c685b3          	sub	a1,a3,a2
80403830:	02d30313          	addi	t1,t1,45
80403834:	04a87813          	andi	a6,a6,74
80403838:	02d80813          	addi	a6,a6,45
8040383c:	00099797          	auipc	a5,0x99
80403840:	f6078793          	addi	a5,a5,-160 # 8049c79c <str.2046>
80403844:	00099897          	auipc	a7,0x99
80403848:	f4688c23          	sb	t1,-168(a7) # 8049c79c <str.2046>
8040384c:	01659713          	slli	a4,a1,0x16
80403850:	07200313          	li	t1,114
80403854:	01669693          	slli	a3,a3,0x16
80403858:	01661613          	slli	a2,a2,0x16
8040385c:	00010517          	auipc	a0,0x10
80403860:	0c450513          	addi	a0,a0,196 # 80413920 <default_pmm_manager+0x2a8>
80403864:	00099897          	auipc	a7,0x99
80403868:	f3088d23          	sb	a6,-198(a7) # 8049c79e <str.2046+0x2>
8040386c:	00099897          	auipc	a7,0x99
80403870:	f26888a3          	sb	t1,-207(a7) # 8049c79d <str.2046+0x1>
80403874:	00099817          	auipc	a6,0x99
80403878:	f20805a3          	sb	zero,-213(a6) # 8049c79f <str.2046+0x3>
8040387c:	981fc0ef          	jal	ra,804001fc <cprintf>
80403880:	00f4f493          	andi	s1,s1,15
80403884:	00100793          	li	a5,1
80403888:	04f48c63          	beq	s1,a5,804038e0 <print_pgdir+0x140>
8040388c:	01412583          	lw	a1,20(sp)
80403890:	3ff00793          	li	a5,1023
80403894:	f6b7f0e3          	bgeu	a5,a1,804037f4 <print_pgdir+0x54>
80403898:	00010517          	auipc	a0,0x10
8040389c:	0cc50513          	addi	a0,a0,204 # 80413964 <default_pmm_manager+0x2ec>
804038a0:	95dfc0ef          	jal	ra,804001fc <cprintf>
804038a4:	05c12083          	lw	ra,92(sp)
804038a8:	05812403          	lw	s0,88(sp)
804038ac:	05412483          	lw	s1,84(sp)
804038b0:	05012903          	lw	s2,80(sp)
804038b4:	04c12983          	lw	s3,76(sp)
804038b8:	04812a03          	lw	s4,72(sp)
804038bc:	04412a83          	lw	s5,68(sp)
804038c0:	04012b03          	lw	s6,64(sp)
804038c4:	03c12b83          	lw	s7,60(sp)
804038c8:	03812c03          	lw	s8,56(sp)
804038cc:	03412c83          	lw	s9,52(sp)
804038d0:	03012d03          	lw	s10,48(sp)
804038d4:	02c12d83          	lw	s11,44(sp)
804038d8:	06010113          	addi	sp,sp,96
804038dc:	00008067          	ret
804038e0:	01012783          	lw	a5,16(sp)
804038e4:	01412583          	lw	a1,20(sp)
804038e8:	00000d93          	li	s11,0
804038ec:	00a79313          	slli	t1,a5,0xa
804038f0:	00f12423          	sw	a5,8(sp)
804038f4:	fafec7b7          	lui	a5,0xfafec
804038f8:	ffc78793          	addi	a5,a5,-4 # fafebffc <end+0x7ab4f740>
804038fc:	00f12623          	sw	a5,12(sp)
80403900:	00812783          	lw	a5,8(sp)
80403904:	00612e23          	sw	t1,28(sp)
80403908:	40030c93          	addi	s9,t1,1024
8040390c:	12b7fe63          	bgeu	a5,a1,80403a48 <print_pgdir+0x2a8>
80403910:	00c12703          	lw	a4,12(sp)
80403914:	00178793          	addi	a5,a5,1
80403918:	00279493          	slli	s1,a5,0x2
8040391c:	00e484b3          	add	s1,s1,a4
80403920:	0004a603          	lw	a2,0(s1)
80403924:	00099a17          	auipc	s4,0x99
80403928:	e74a0a13          	addi	s4,s4,-396 # 8049c798 <npage>
8040392c:	fffff9b7          	lui	s3,0xfffff
80403930:	00261613          	slli	a2,a2,0x2
80403934:	000a2703          	lw	a4,0(s4)
80403938:	00f12423          	sw	a5,8(sp)
8040393c:	00001937          	lui	s2,0x1
80403940:	00c79793          	slli	a5,a5,0xc
80403944:	01367633          	and	a2,a2,s3
80403948:	40f90933          	sub	s2,s2,a5
8040394c:	00c65793          	srli	a5,a2,0xc
80403950:	01c12583          	lw	a1,28(sp)
80403954:	07200c13          	li	s8,114
80403958:	00099b97          	auipc	s7,0x99
8040395c:	e44b8b93          	addi	s7,s7,-444 # 8049c79c <str.2046>
80403960:	0ae7fe63          	bgeu	a5,a4,80403a1c <print_pgdir+0x27c>
80403964:	000aa683          	lw	a3,0(s5)
80403968:	00d60633          	add	a2,a2,a3
8040396c:	01260633          	add	a2,a2,s2
80403970:	0d95f463          	bgeu	a1,s9,80403a38 <print_pgdir+0x298>
80403974:	01c10713          	addi	a4,sp,28
80403978:	01810693          	addi	a3,sp,24
8040397c:	000c8513          	mv	a0,s9
80403980:	ac0ff0ef          	jal	ra,80402c40 <get_pgtable_items.isra.4.part.5>
80403984:	00050b13          	mv	s6,a0
80403988:	0a050863          	beqz	a0,80403a38 <print_pgdir+0x298>
8040398c:	12ad8663          	beq	s11,a0,80403ab8 <print_pgdir+0x318>
80403990:	060d8263          	beqz	s11,804039f4 <print_pgdir+0x254>
80403994:	01bd9e13          	slli	t3,s11,0x1b
80403998:	01dd9d93          	slli	s11,s11,0x1d
8040399c:	41fe5e13          	srai	t3,t3,0x1f
804039a0:	41fddd93          	srai	s11,s11,0x1f
804039a4:	408d05b3          	sub	a1,s10,s0
804039a8:	048e7e13          	andi	t3,t3,72
804039ac:	04adfd93          	andi	s11,s11,74
804039b0:	02de0e13          	addi	t3,t3,45
804039b4:	02dd8d93          	addi	s11,s11,45
804039b8:	000b8793          	mv	a5,s7
804039bc:	00c59713          	slli	a4,a1,0xc
804039c0:	00cd1693          	slli	a3,s10,0xc
804039c4:	00c41613          	slli	a2,s0,0xc
804039c8:	00010517          	auipc	a0,0x10
804039cc:	f7850513          	addi	a0,a0,-136 # 80413940 <default_pmm_manager+0x2c8>
804039d0:	00099817          	auipc	a6,0x99
804039d4:	ddc80623          	sb	t3,-564(a6) # 8049c79c <str.2046>
804039d8:	00099817          	auipc	a6,0x99
804039dc:	dd8802a3          	sb	s8,-571(a6) # 8049c79d <str.2046+0x1>
804039e0:	00099817          	auipc	a6,0x99
804039e4:	dbb80f23          	sb	s11,-578(a6) # 8049c79e <str.2046+0x2>
804039e8:	00099817          	auipc	a6,0x99
804039ec:	da080ba3          	sb	zero,-585(a6) # 8049c79f <str.2046+0x3>
804039f0:	80dfc0ef          	jal	ra,804001fc <cprintf>
804039f4:	01c12d03          	lw	s10,28(sp)
804039f8:	01812403          	lw	s0,24(sp)
804039fc:	000b0d93          	mv	s11,s6
80403a00:	000d0593          	mv	a1,s10
80403a04:	0004a603          	lw	a2,0(s1)
80403a08:	000a2703          	lw	a4,0(s4)
80403a0c:	00261613          	slli	a2,a2,0x2
80403a10:	01367633          	and	a2,a2,s3
80403a14:	00c65793          	srli	a5,a2,0xc
80403a18:	f4e7e6e3          	bltu	a5,a4,80403964 <print_pgdir+0x1c4>
80403a1c:	00060693          	mv	a3,a2
80403a20:	29c00593          	li	a1,668
80403a24:	00010617          	auipc	a2,0x10
80403a28:	c8460613          	addi	a2,a2,-892 # 804136a8 <default_pmm_manager+0x30>
80403a2c:	00010517          	auipc	a0,0x10
80403a30:	e0050513          	addi	a0,a0,-512 # 8041382c <default_pmm_manager+0x1b4>
80403a34:	bf1fc0ef          	jal	ra,80400624 <__panic>
80403a38:	01412583          	lw	a1,20(sp)
80403a3c:	00812783          	lw	a5,8(sp)
80403a40:	400c8c93          	addi	s9,s9,1024
80403a44:	ecb7e6e3          	bltu	a5,a1,80403910 <print_pgdir+0x170>
80403a48:	e40d84e3          	beqz	s11,80403890 <print_pgdir+0xf0>
80403a4c:	01bd9313          	slli	t1,s11,0x1b
80403a50:	01dd9813          	slli	a6,s11,0x1d
80403a54:	41f35313          	srai	t1,t1,0x1f
80403a58:	41f85813          	srai	a6,a6,0x1f
80403a5c:	04837313          	andi	t1,t1,72
80403a60:	408d05b3          	sub	a1,s10,s0
80403a64:	02d30313          	addi	t1,t1,45
80403a68:	04a87813          	andi	a6,a6,74
80403a6c:	02d80813          	addi	a6,a6,45
80403a70:	00099897          	auipc	a7,0x99
80403a74:	d2688623          	sb	t1,-724(a7) # 8049c79c <str.2046>
80403a78:	00099797          	auipc	a5,0x99
80403a7c:	d2478793          	addi	a5,a5,-732 # 8049c79c <str.2046>
80403a80:	07200313          	li	t1,114
80403a84:	00c59713          	slli	a4,a1,0xc
80403a88:	00cd1693          	slli	a3,s10,0xc
80403a8c:	00c41613          	slli	a2,s0,0xc
80403a90:	00010517          	auipc	a0,0x10
80403a94:	eb050513          	addi	a0,a0,-336 # 80413940 <default_pmm_manager+0x2c8>
80403a98:	00099897          	auipc	a7,0x99
80403a9c:	d1088323          	sb	a6,-762(a7) # 8049c79e <str.2046+0x2>
80403aa0:	00099897          	auipc	a7,0x99
80403aa4:	ce688ea3          	sb	t1,-771(a7) # 8049c79d <str.2046+0x1>
80403aa8:	00099817          	auipc	a6,0x99
80403aac:	ce080ba3          	sb	zero,-777(a6) # 8049c79f <str.2046+0x3>
80403ab0:	f4cfc0ef          	jal	ra,804001fc <cprintf>
80403ab4:	dd9ff06f          	j	8040388c <print_pgdir+0xec>
80403ab8:	01c12d03          	lw	s10,28(sp)
80403abc:	000d0593          	mv	a1,s10
80403ac0:	f45ff06f          	j	80403a04 <print_pgdir+0x264>

80403ac4 <pmm_init>:
80403ac4:	00010797          	auipc	a5,0x10
80403ac8:	bb478793          	addi	a5,a5,-1100 # 80413678 <default_pmm_manager>
80403acc:	0007a583          	lw	a1,0(a5)
80403ad0:	fe010113          	addi	sp,sp,-32
80403ad4:	00010517          	auipc	a0,0x10
80403ad8:	d7c50513          	addi	a0,a0,-644 # 80413850 <default_pmm_manager+0x1d8>
80403adc:	00112e23          	sw	ra,28(sp)
80403ae0:	00099717          	auipc	a4,0x99
80403ae4:	d0f72e23          	sw	a5,-740(a4) # 8049c7fc <pmm_manager>
80403ae8:	00812c23          	sw	s0,24(sp)
80403aec:	00912a23          	sw	s1,20(sp)
80403af0:	01212823          	sw	s2,16(sp)
80403af4:	01312623          	sw	s3,12(sp)
80403af8:	01412423          	sw	s4,8(sp)
80403afc:	00099417          	auipc	s0,0x99
80403b00:	d0040413          	addi	s0,s0,-768 # 8049c7fc <pmm_manager>
80403b04:	ef8fc0ef          	jal	ra,804001fc <cprintf>
80403b08:	00042783          	lw	a5,0(s0)
80403b0c:	ffffc497          	auipc	s1,0xffffc
80403b10:	4f448493          	addi	s1,s1,1268 # 80400000 <kern_entry>
80403b14:	0047a783          	lw	a5,4(a5)
80403b18:	000780e7          	jalr	a5
80403b1c:	804007b7          	lui	a5,0x80400
80403b20:	409787b3          	sub	a5,a5,s1
80403b24:	00010517          	auipc	a0,0x10
80403b28:	d4450513          	addi	a0,a0,-700 # 80413868 <default_pmm_manager+0x1f0>
80403b2c:	00099717          	auipc	a4,0x99
80403b30:	ccf72a23          	sw	a5,-812(a4) # 8049c800 <va_pa_offset>
80403b34:	ec8fc0ef          	jal	ra,804001fc <cprintf>
80403b38:	808005b7          	lui	a1,0x80800
80403b3c:	fff58693          	addi	a3,a1,-1 # 807fffff <end+0x363743>
80403b40:	00048613          	mv	a2,s1
80403b44:	409585b3          	sub	a1,a1,s1
80403b48:	00010517          	auipc	a0,0x10
80403b4c:	d3850513          	addi	a0,a0,-712 # 80413880 <default_pmm_manager+0x208>
80403b50:	eacfc0ef          	jal	ra,804001fc <cprintf>
80403b54:	fffff737          	lui	a4,0xfffff
80403b58:	0009a797          	auipc	a5,0x9a
80403b5c:	d6378793          	addi	a5,a5,-669 # 8049d8bb <end+0xfff>
80403b60:	00e7f7b3          	and	a5,a5,a4
80403b64:	00081737          	lui	a4,0x81
80403b68:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403b6c:	00099697          	auipc	a3,0x99
80403b70:	c2e6a623          	sw	a4,-980(a3) # 8049c798 <npage>
80403b74:	000106b7          	lui	a3,0x10
80403b78:	00078513          	mv	a0,a5
80403b7c:	00099717          	auipc	a4,0x99
80403b80:	c8f72623          	sw	a5,-884(a4) # 8049c808 <pages>
80403b84:	00d786b3          	add	a3,a5,a3
80403b88:	0047a703          	lw	a4,4(a5)
80403b8c:	02078793          	addi	a5,a5,32
80403b90:	00176713          	ori	a4,a4,1
80403b94:	fee7a223          	sw	a4,-28(a5)
80403b98:	fef698e3          	bne	a3,a5,80403b88 <pmm_init+0xc4>
80403b9c:	804007b7          	lui	a5,0x80400
80403ba0:	1cf6ea63          	bltu	a3,a5,80403d74 <pmm_init+0x2b0>
80403ba4:	00099497          	auipc	s1,0x99
80403ba8:	c5c48493          	addi	s1,s1,-932 # 8049c800 <va_pa_offset>
80403bac:	0004a783          	lw	a5,0(s1)
80403bb0:	808005b7          	lui	a1,0x80800
80403bb4:	40f686b3          	sub	a3,a3,a5
80403bb8:	14b6e863          	bltu	a3,a1,80403d08 <pmm_init+0x244>
80403bbc:	00100513          	li	a0,1
80403bc0:	944ff0ef          	jal	ra,80402d04 <alloc_pages>
80403bc4:	20050e63          	beqz	a0,80403de0 <pmm_init+0x31c>
80403bc8:	00099797          	auipc	a5,0x99
80403bcc:	c4078793          	addi	a5,a5,-960 # 8049c808 <pages>
80403bd0:	0007a683          	lw	a3,0(a5)
80403bd4:	00099797          	auipc	a5,0x99
80403bd8:	bc478793          	addi	a5,a5,-1084 # 8049c798 <npage>
80403bdc:	0007a703          	lw	a4,0(a5)
80403be0:	40d506b3          	sub	a3,a0,a3
80403be4:	4056d693          	srai	a3,a3,0x5
80403be8:	00080537          	lui	a0,0x80
80403bec:	00a686b3          	add	a3,a3,a0
80403bf0:	00c69793          	slli	a5,a3,0xc
80403bf4:	00c7d793          	srli	a5,a5,0xc
80403bf8:	00c69693          	slli	a3,a3,0xc
80403bfc:	1ce7f663          	bgeu	a5,a4,80403dc8 <pmm_init+0x304>
80403c00:	0004a783          	lw	a5,0(s1)
80403c04:	00001637          	lui	a2,0x1
80403c08:	00000593          	li	a1,0
80403c0c:	00f686b3          	add	a3,a3,a5
80403c10:	00068513          	mv	a0,a3
80403c14:	00099797          	auipc	a5,0x99
80403c18:	b8d7a023          	sw	a3,-1152(a5) # 8049c794 <boot_pgdir>
80403c1c:	2f10e0ef          	jal	ra,8041270c <memset>
80403c20:	00099797          	auipc	a5,0x99
80403c24:	b7478793          	addi	a5,a5,-1164 # 8049c794 <boot_pgdir>
80403c28:	0007a903          	lw	s2,0(a5)
80403c2c:	80400737          	lui	a4,0x80400
80403c30:	16e96e63          	bltu	s2,a4,80403dac <pmm_init+0x2e8>
80403c34:	0004a783          	lw	a5,0(s1)
80403c38:	000016b7          	lui	a3,0x1
80403c3c:	00d905b3          	add	a1,s2,a3
80403c40:	40f90533          	sub	a0,s2,a5
80403c44:	00c55613          	srli	a2,a0,0xc
80403c48:	00a61613          	slli	a2,a2,0xa
80403c4c:	40f707b3          	sub	a5,a4,a5
80403c50:	00166813          	ori	a6,a2,1
80403c54:	00e7c733          	xor	a4,a5,a4
80403c58:	00766613          	ori	a2,a2,7
80403c5c:	fff68693          	addi	a3,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403c60:	00099897          	auipc	a7,0x99
80403c64:	baa8a223          	sw	a0,-1116(a7) # 8049c804 <boot_cr3>
80403c68:	fb05a623          	sw	a6,-84(a1) # 807fffac <end+0x3636f0>
80403c6c:	fac5a823          	sw	a2,-80(a1)
80403c70:	00d77733          	and	a4,a4,a3
80403c74:	10071c63          	bnez	a4,80403d8c <pmm_init+0x2c8>
80403c78:	fffff437          	lui	s0,0xfffff
80403c7c:	0087f7b3          	and	a5,a5,s0
80403c80:	7fc00437          	lui	s0,0x7fc00
80403c84:	804004b7          	lui	s1,0x80400
80403c88:	00878433          	add	s0,a5,s0
80403c8c:	00001a37          	lui	s4,0x1
80403c90:	80c009b7          	lui	s3,0x80c00
80403c94:	00100613          	li	a2,1
80403c98:	00048593          	mv	a1,s1
80403c9c:	00090513          	mv	a0,s2
80403ca0:	9f8ff0ef          	jal	ra,80402e98 <get_pte>
80403ca4:	009407b3          	add	a5,s0,s1
80403ca8:	0a050663          	beqz	a0,80403d54 <pmm_init+0x290>
80403cac:	00c7d793          	srli	a5,a5,0xc
80403cb0:	00a79793          	slli	a5,a5,0xa
80403cb4:	00f7e793          	ori	a5,a5,15
80403cb8:	00f52023          	sw	a5,0(a0) # 80000 <_binary_bin_sfs_img_size+0x8000>
80403cbc:	014484b3          	add	s1,s1,s4
80403cc0:	fd349ae3          	bne	s1,s3,80403c94 <pmm_init+0x1d0>
80403cc4:	00099797          	auipc	a5,0x99
80403cc8:	b4078793          	addi	a5,a5,-1216 # 8049c804 <boot_cr3>
80403ccc:	0007a783          	lw	a5,0(a5)
80403cd0:	80000737          	lui	a4,0x80000
80403cd4:	00c7d793          	srli	a5,a5,0xc
80403cd8:	00e7e7b3          	or	a5,a5,a4
80403cdc:	18079073          	csrw	satp,a5
80403ce0:	12000073          	sfence.vma
80403ce4:	abdff0ef          	jal	ra,804037a0 <print_pgdir>
80403ce8:	01812403          	lw	s0,24(sp)
80403cec:	01c12083          	lw	ra,28(sp)
80403cf0:	01412483          	lw	s1,20(sp)
80403cf4:	01012903          	lw	s2,16(sp)
80403cf8:	00c12983          	lw	s3,12(sp)
80403cfc:	00812a03          	lw	s4,8(sp)
80403d00:	02010113          	addi	sp,sp,32
80403d04:	c59fe06f          	j	8040295c <kmalloc_init>
80403d08:	000017b7          	lui	a5,0x1
80403d0c:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403d10:	00f686b3          	add	a3,a3,a5
80403d14:	00081737          	lui	a4,0x81
80403d18:	00c6d793          	srli	a5,a3,0xc
80403d1c:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403d20:	0ce78c63          	beq	a5,a4,80403df8 <pmm_init+0x334>
80403d24:	00042703          	lw	a4,0(s0) # 7fc00000 <_binary_bin_sfs_img_size+0x7fb88000>
80403d28:	fffff637          	lui	a2,0xfffff
80403d2c:	00c6f6b3          	and	a3,a3,a2
80403d30:	fff80637          	lui	a2,0xfff80
80403d34:	00c787b3          	add	a5,a5,a2
80403d38:	00872703          	lw	a4,8(a4)
80403d3c:	40d585b3          	sub	a1,a1,a3
80403d40:	00579793          	slli	a5,a5,0x5
80403d44:	00c5d593          	srli	a1,a1,0xc
80403d48:	00f50533          	add	a0,a0,a5
80403d4c:	000700e7          	jalr	a4
80403d50:	e6dff06f          	j	80403bbc <pmm_init+0xf8>
80403d54:	00010697          	auipc	a3,0x10
80403d58:	b8868693          	addi	a3,a3,-1144 # 804138dc <default_pmm_manager+0x264>
80403d5c:	0000f617          	auipc	a2,0xf
80403d60:	de060613          	addi	a2,a2,-544 # 80412b3c <commands+0x1bc>
80403d64:	0aa00593          	li	a1,170
80403d68:	00010517          	auipc	a0,0x10
80403d6c:	ac450513          	addi	a0,a0,-1340 # 8041382c <default_pmm_manager+0x1b4>
80403d70:	8b5fc0ef          	jal	ra,80400624 <__panic>
80403d74:	00010617          	auipc	a2,0x10
80403d78:	96860613          	addi	a2,a2,-1688 # 804136dc <default_pmm_manager+0x64>
80403d7c:	08e00593          	li	a1,142
80403d80:	00010517          	auipc	a0,0x10
80403d84:	aac50513          	addi	a0,a0,-1364 # 8041382c <default_pmm_manager+0x1b4>
80403d88:	89dfc0ef          	jal	ra,80400624 <__panic>
80403d8c:	00010697          	auipc	a3,0x10
80403d90:	b3868693          	addi	a3,a3,-1224 # 804138c4 <default_pmm_manager+0x24c>
80403d94:	0000f617          	auipc	a2,0xf
80403d98:	da860613          	addi	a2,a2,-600 # 80412b3c <commands+0x1bc>
80403d9c:	0a400593          	li	a1,164
80403da0:	00010517          	auipc	a0,0x10
80403da4:	a8c50513          	addi	a0,a0,-1396 # 8041382c <default_pmm_manager+0x1b4>
80403da8:	87dfc0ef          	jal	ra,80400624 <__panic>
80403dac:	00090693          	mv	a3,s2
80403db0:	00010617          	auipc	a2,0x10
80403db4:	92c60613          	addi	a2,a2,-1748 # 804136dc <default_pmm_manager+0x64>
80403db8:	0d400593          	li	a1,212
80403dbc:	00010517          	auipc	a0,0x10
80403dc0:	a7050513          	addi	a0,a0,-1424 # 8041382c <default_pmm_manager+0x1b4>
80403dc4:	861fc0ef          	jal	ra,80400624 <__panic>
80403dc8:	00010617          	auipc	a2,0x10
80403dcc:	8e060613          	addi	a2,a2,-1824 # 804136a8 <default_pmm_manager+0x30>
80403dd0:	06e00593          	li	a1,110
80403dd4:	00010517          	auipc	a0,0x10
80403dd8:	8f850513          	addi	a0,a0,-1800 # 804136cc <default_pmm_manager+0x54>
80403ddc:	849fc0ef          	jal	ra,80400624 <__panic>
80403de0:	00010617          	auipc	a2,0x10
80403de4:	ac860613          	addi	a2,a2,-1336 # 804138a8 <default_pmm_manager+0x230>
80403de8:	0b600593          	li	a1,182
80403dec:	00010517          	auipc	a0,0x10
80403df0:	a4050513          	addi	a0,a0,-1472 # 8041382c <default_pmm_manager+0x1b4>
80403df4:	831fc0ef          	jal	ra,80400624 <__panic>
80403df8:	eedfe0ef          	jal	ra,80402ce4 <pa2page.part.6>

80403dfc <swap_init>:
80403dfc:	ff010113          	addi	sp,sp,-16
80403e00:	00112623          	sw	ra,12(sp)
80403e04:	00812423          	sw	s0,8(sp)
80403e08:	29c090ef          	jal	ra,8040d0a4 <swapfs_init>
80403e0c:	00099797          	auipc	a5,0x99
80403e10:	a7478793          	addi	a5,a5,-1420 # 8049c880 <max_swap_offset>
80403e14:	0007a683          	lw	a3,0(a5)
80403e18:	010007b7          	lui	a5,0x1000
80403e1c:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf87ff8>
80403e20:	ff968713          	addi	a4,a3,-7
80403e24:	06e7ea63          	bltu	a5,a4,80403e98 <swap_init+0x9c>
80403e28:	00095797          	auipc	a5,0x95
80403e2c:	1d878793          	addi	a5,a5,472 # 80499000 <swap_manager_fifo>
80403e30:	0047a703          	lw	a4,4(a5)
80403e34:	00099697          	auipc	a3,0x99
80403e38:	96f6a623          	sw	a5,-1684(a3) # 8049c7a0 <sm>
80403e3c:	000700e7          	jalr	a4
80403e40:	00050413          	mv	s0,a0
80403e44:	00050c63          	beqz	a0,80403e5c <swap_init+0x60>
80403e48:	00040513          	mv	a0,s0
80403e4c:	00c12083          	lw	ra,12(sp)
80403e50:	00812403          	lw	s0,8(sp)
80403e54:	01010113          	addi	sp,sp,16
80403e58:	00008067          	ret
80403e5c:	00099797          	auipc	a5,0x99
80403e60:	94478793          	addi	a5,a5,-1724 # 8049c7a0 <sm>
80403e64:	0007a783          	lw	a5,0(a5)
80403e68:	00010517          	auipc	a0,0x10
80403e6c:	bf050513          	addi	a0,a0,-1040 # 80413a58 <default_pmm_manager+0x3e0>
80403e70:	0007a583          	lw	a1,0(a5)
80403e74:	00100793          	li	a5,1
80403e78:	00099717          	auipc	a4,0x99
80403e7c:	92f72623          	sw	a5,-1748(a4) # 8049c7a4 <swap_init_ok>
80403e80:	b7cfc0ef          	jal	ra,804001fc <cprintf>
80403e84:	00040513          	mv	a0,s0
80403e88:	00c12083          	lw	ra,12(sp)
80403e8c:	00812403          	lw	s0,8(sp)
80403e90:	01010113          	addi	sp,sp,16
80403e94:	00008067          	ret
80403e98:	00010617          	auipc	a2,0x10
80403e9c:	b9460613          	addi	a2,a2,-1132 # 80413a2c <default_pmm_manager+0x3b4>
80403ea0:	02500593          	li	a1,37
80403ea4:	00010517          	auipc	a0,0x10
80403ea8:	ba450513          	addi	a0,a0,-1116 # 80413a48 <default_pmm_manager+0x3d0>
80403eac:	f78fc0ef          	jal	ra,80400624 <__panic>

80403eb0 <swap_init_mm>:
80403eb0:	00099797          	auipc	a5,0x99
80403eb4:	8f078793          	addi	a5,a5,-1808 # 8049c7a0 <sm>
80403eb8:	0007a783          	lw	a5,0(a5)
80403ebc:	0087a303          	lw	t1,8(a5)
80403ec0:	00030067          	jr	t1

80403ec4 <swap_map_swappable>:
80403ec4:	00099797          	auipc	a5,0x99
80403ec8:	8dc78793          	addi	a5,a5,-1828 # 8049c7a0 <sm>
80403ecc:	0007a783          	lw	a5,0(a5)
80403ed0:	0107a303          	lw	t1,16(a5)
80403ed4:	00030067          	jr	t1

80403ed8 <swap_out>:
80403ed8:	fc010113          	addi	sp,sp,-64
80403edc:	02112e23          	sw	ra,60(sp)
80403ee0:	02812c23          	sw	s0,56(sp)
80403ee4:	02912a23          	sw	s1,52(sp)
80403ee8:	03212823          	sw	s2,48(sp)
80403eec:	03312623          	sw	s3,44(sp)
80403ef0:	03412423          	sw	s4,40(sp)
80403ef4:	03512223          	sw	s5,36(sp)
80403ef8:	03612023          	sw	s6,32(sp)
80403efc:	01712e23          	sw	s7,28(sp)
80403f00:	01812c23          	sw	s8,24(sp)
80403f04:	14058c63          	beqz	a1,8040405c <swap_out+0x184>
80403f08:	00060a93          	mv	s5,a2
80403f0c:	00050913          	mv	s2,a0
80403f10:	00058a13          	mv	s4,a1
80403f14:	00000413          	li	s0,0
80403f18:	00099997          	auipc	s3,0x99
80403f1c:	88898993          	addi	s3,s3,-1912 # 8049c7a0 <sm>
80403f20:	00010b17          	auipc	s6,0x10
80403f24:	bacb0b13          	addi	s6,s6,-1108 # 80413acc <default_pmm_manager+0x454>
80403f28:	00010b97          	auipc	s7,0x10
80403f2c:	b8cb8b93          	addi	s7,s7,-1140 # 80413ab4 <default_pmm_manager+0x43c>
80403f30:	0580006f          	j	80403f88 <swap_out+0xb0>
80403f34:	00c12783          	lw	a5,12(sp)
80403f38:	00048613          	mv	a2,s1
80403f3c:	00040593          	mv	a1,s0
80403f40:	01c7a683          	lw	a3,28(a5)
80403f44:	000b0513          	mv	a0,s6
80403f48:	00140413          	addi	s0,s0,1
80403f4c:	00c6d693          	srli	a3,a3,0xc
80403f50:	00168693          	addi	a3,a3,1
80403f54:	aa8fc0ef          	jal	ra,804001fc <cprintf>
80403f58:	00c12503          	lw	a0,12(sp)
80403f5c:	00100593          	li	a1,1
80403f60:	01c52783          	lw	a5,28(a0)
80403f64:	00c7d793          	srli	a5,a5,0xc
80403f68:	00178793          	addi	a5,a5,1
80403f6c:	00879793          	slli	a5,a5,0x8
80403f70:	00fc2023          	sw	a5,0(s8)
80403f74:	e59fe0ef          	jal	ra,80402dcc <free_pages>
80403f78:	00c92503          	lw	a0,12(s2) # 100c <_binary_bin_swap_img_size-0x6ff4>
80403f7c:	00048593          	mv	a1,s1
80403f80:	f38ff0ef          	jal	ra,804036b8 <tlb_invalidate>
80403f84:	088a0863          	beq	s4,s0,80404014 <swap_out+0x13c>
80403f88:	0009a783          	lw	a5,0(s3)
80403f8c:	000a8613          	mv	a2,s5
80403f90:	00c10593          	addi	a1,sp,12
80403f94:	0187a783          	lw	a5,24(a5)
80403f98:	00090513          	mv	a0,s2
80403f9c:	000780e7          	jalr	a5
80403fa0:	0a051463          	bnez	a0,80404048 <swap_out+0x170>
80403fa4:	00c12783          	lw	a5,12(sp)
80403fa8:	00c92503          	lw	a0,12(s2)
80403fac:	00000613          	li	a2,0
80403fb0:	01c7a483          	lw	s1,28(a5)
80403fb4:	00048593          	mv	a1,s1
80403fb8:	ee1fe0ef          	jal	ra,80402e98 <get_pte>
80403fbc:	00052783          	lw	a5,0(a0)
80403fc0:	00050c13          	mv	s8,a0
80403fc4:	0017f793          	andi	a5,a5,1
80403fc8:	08078e63          	beqz	a5,80404064 <swap_out+0x18c>
80403fcc:	00c12583          	lw	a1,12(sp)
80403fd0:	01c5a783          	lw	a5,28(a1)
80403fd4:	00c7d793          	srli	a5,a5,0xc
80403fd8:	00178513          	addi	a0,a5,1
80403fdc:	00851513          	slli	a0,a0,0x8
80403fe0:	1d0090ef          	jal	ra,8040d1b0 <swapfs_write>
80403fe4:	f40508e3          	beqz	a0,80403f34 <swap_out+0x5c>
80403fe8:	000b8513          	mv	a0,s7
80403fec:	a10fc0ef          	jal	ra,804001fc <cprintf>
80403ff0:	0009a783          	lw	a5,0(s3)
80403ff4:	00c12603          	lw	a2,12(sp)
80403ff8:	00000693          	li	a3,0
80403ffc:	0107a783          	lw	a5,16(a5)
80404000:	00048593          	mv	a1,s1
80404004:	00090513          	mv	a0,s2
80404008:	00140413          	addi	s0,s0,1
8040400c:	000780e7          	jalr	a5
80404010:	f68a1ce3          	bne	s4,s0,80403f88 <swap_out+0xb0>
80404014:	00040513          	mv	a0,s0
80404018:	03c12083          	lw	ra,60(sp)
8040401c:	03812403          	lw	s0,56(sp)
80404020:	03412483          	lw	s1,52(sp)
80404024:	03012903          	lw	s2,48(sp)
80404028:	02c12983          	lw	s3,44(sp)
8040402c:	02812a03          	lw	s4,40(sp)
80404030:	02412a83          	lw	s5,36(sp)
80404034:	02012b03          	lw	s6,32(sp)
80404038:	01c12b83          	lw	s7,28(sp)
8040403c:	01812c03          	lw	s8,24(sp)
80404040:	04010113          	addi	sp,sp,64
80404044:	00008067          	ret
80404048:	00040593          	mv	a1,s0
8040404c:	00010517          	auipc	a0,0x10
80404050:	a2050513          	addi	a0,a0,-1504 # 80413a6c <default_pmm_manager+0x3f4>
80404054:	9a8fc0ef          	jal	ra,804001fc <cprintf>
80404058:	fbdff06f          	j	80404014 <swap_out+0x13c>
8040405c:	00000413          	li	s0,0
80404060:	fb5ff06f          	j	80404014 <swap_out+0x13c>
80404064:	00010697          	auipc	a3,0x10
80404068:	a3868693          	addi	a3,a3,-1480 # 80413a9c <default_pmm_manager+0x424>
8040406c:	0000f617          	auipc	a2,0xf
80404070:	ad060613          	addi	a2,a2,-1328 # 80412b3c <commands+0x1bc>
80404074:	05500593          	li	a1,85
80404078:	00010517          	auipc	a0,0x10
8040407c:	9d050513          	addi	a0,a0,-1584 # 80413a48 <default_pmm_manager+0x3d0>
80404080:	da4fc0ef          	jal	ra,80400624 <__panic>

80404084 <swap_in>:
80404084:	fe010113          	addi	sp,sp,-32
80404088:	01212823          	sw	s2,16(sp)
8040408c:	00050913          	mv	s2,a0
80404090:	00100513          	li	a0,1
80404094:	00912a23          	sw	s1,20(sp)
80404098:	01312623          	sw	s3,12(sp)
8040409c:	00112e23          	sw	ra,28(sp)
804040a0:	00812c23          	sw	s0,24(sp)
804040a4:	00058493          	mv	s1,a1
804040a8:	00060993          	mv	s3,a2
804040ac:	c59fe0ef          	jal	ra,80402d04 <alloc_pages>
804040b0:	06050263          	beqz	a0,80404114 <swap_in+0x90>
804040b4:	00050413          	mv	s0,a0
804040b8:	00c92503          	lw	a0,12(s2)
804040bc:	00000613          	li	a2,0
804040c0:	00048593          	mv	a1,s1
804040c4:	dd5fe0ef          	jal	ra,80402e98 <get_pte>
804040c8:	00050913          	mv	s2,a0
804040cc:	00052503          	lw	a0,0(a0)
804040d0:	00040593          	mv	a1,s0
804040d4:	01c090ef          	jal	ra,8040d0f0 <swapfs_read>
804040d8:	00092583          	lw	a1,0(s2)
804040dc:	00048613          	mv	a2,s1
804040e0:	00010517          	auipc	a0,0x10
804040e4:	90c50513          	addi	a0,a0,-1780 # 804139ec <default_pmm_manager+0x374>
804040e8:	0085d593          	srli	a1,a1,0x8
804040ec:	910fc0ef          	jal	ra,804001fc <cprintf>
804040f0:	01c12083          	lw	ra,28(sp)
804040f4:	0089a023          	sw	s0,0(s3)
804040f8:	01812403          	lw	s0,24(sp)
804040fc:	01412483          	lw	s1,20(sp)
80404100:	01012903          	lw	s2,16(sp)
80404104:	00c12983          	lw	s3,12(sp)
80404108:	00000513          	li	a0,0
8040410c:	02010113          	addi	sp,sp,32
80404110:	00008067          	ret
80404114:	00010697          	auipc	a3,0x10
80404118:	8c868693          	addi	a3,a3,-1848 # 804139dc <default_pmm_manager+0x364>
8040411c:	0000f617          	auipc	a2,0xf
80404120:	a2060613          	addi	a2,a2,-1504 # 80412b3c <commands+0x1bc>
80404124:	06b00593          	li	a1,107
80404128:	00010517          	auipc	a0,0x10
8040412c:	92050513          	addi	a0,a0,-1760 # 80413a48 <default_pmm_manager+0x3d0>
80404130:	cf4fc0ef          	jal	ra,80400624 <__panic>

80404134 <_fifo_init_mm>:
80404134:	00098797          	auipc	a5,0x98
80404138:	77478793          	addi	a5,a5,1908 # 8049c8a8 <pra_list_head>
8040413c:	00f52a23          	sw	a5,20(a0)
80404140:	00f7a223          	sw	a5,4(a5)
80404144:	00f7a023          	sw	a5,0(a5)
80404148:	00000513          	li	a0,0
8040414c:	00008067          	ret

80404150 <_fifo_init>:
80404150:	00000513          	li	a0,0
80404154:	00008067          	ret

80404158 <_fifo_set_unswappable>:
80404158:	00000513          	li	a0,0
8040415c:	00008067          	ret

80404160 <_fifo_tick_event>:
80404160:	00000513          	li	a0,0
80404164:	00008067          	ret

80404168 <_fifo_check_swap>:
80404168:	fd010113          	addi	sp,sp,-48
8040416c:	01312e23          	sw	s3,28(sp)
80404170:	01412c23          	sw	s4,24(sp)
80404174:	00010517          	auipc	a0,0x10
80404178:	99850513          	addi	a0,a0,-1640 # 80413b0c <default_pmm_manager+0x494>
8040417c:	000039b7          	lui	s3,0x3
80404180:	00c00a13          	li	s4,12
80404184:	02812423          	sw	s0,40(sp)
80404188:	02912223          	sw	s1,36(sp)
8040418c:	02112623          	sw	ra,44(sp)
80404190:	03212023          	sw	s2,32(sp)
80404194:	01512a23          	sw	s5,20(sp)
80404198:	01612823          	sw	s6,16(sp)
8040419c:	01712623          	sw	s7,12(sp)
804041a0:	01812423          	sw	s8,8(sp)
804041a4:	01912223          	sw	s9,4(sp)
804041a8:	00098417          	auipc	s0,0x98
804041ac:	60040413          	addi	s0,s0,1536 # 8049c7a8 <pgfault_num>
804041b0:	84cfc0ef          	jal	ra,804001fc <cprintf>
804041b4:	01498023          	sb	s4,0(s3) # 3000 <_binary_bin_swap_img_size-0x5000>
804041b8:	00042483          	lw	s1,0(s0)
804041bc:	00400793          	li	a5,4
804041c0:	18f49863          	bne	s1,a5,80404350 <_fifo_check_swap+0x1e8>
804041c4:	00010517          	auipc	a0,0x10
804041c8:	99850513          	addi	a0,a0,-1640 # 80413b5c <default_pmm_manager+0x4e4>
804041cc:	00001b37          	lui	s6,0x1
804041d0:	00a00b93          	li	s7,10
804041d4:	828fc0ef          	jal	ra,804001fc <cprintf>
804041d8:	017b0023          	sb	s7,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
804041dc:	00042903          	lw	s2,0(s0)
804041e0:	2e991863          	bne	s2,s1,804044d0 <_fifo_check_swap+0x368>
804041e4:	00010517          	auipc	a0,0x10
804041e8:	9a050513          	addi	a0,a0,-1632 # 80413b84 <default_pmm_manager+0x50c>
804041ec:	00004c37          	lui	s8,0x4
804041f0:	00d00c93          	li	s9,13
804041f4:	808fc0ef          	jal	ra,804001fc <cprintf>
804041f8:	019c0023          	sb	s9,0(s8) # 4000 <_binary_bin_swap_img_size-0x4000>
804041fc:	00042a83          	lw	s5,0(s0)
80404200:	2b2a9863          	bne	s5,s2,804044b0 <_fifo_check_swap+0x348>
80404204:	00010517          	auipc	a0,0x10
80404208:	9a850513          	addi	a0,a0,-1624 # 80413bac <default_pmm_manager+0x534>
8040420c:	000024b7          	lui	s1,0x2
80404210:	00b00913          	li	s2,11
80404214:	fe9fb0ef          	jal	ra,804001fc <cprintf>
80404218:	01248023          	sb	s2,0(s1) # 2000 <_binary_bin_swap_img_size-0x6000>
8040421c:	00042783          	lw	a5,0(s0)
80404220:	27579863          	bne	a5,s5,80404490 <_fifo_check_swap+0x328>
80404224:	00010517          	auipc	a0,0x10
80404228:	9b050513          	addi	a0,a0,-1616 # 80413bd4 <default_pmm_manager+0x55c>
8040422c:	fd1fb0ef          	jal	ra,804001fc <cprintf>
80404230:	000057b7          	lui	a5,0x5
80404234:	00e00713          	li	a4,14
80404238:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
8040423c:	00042a83          	lw	s5,0(s0)
80404240:	00500793          	li	a5,5
80404244:	22fa9663          	bne	s5,a5,80404470 <_fifo_check_swap+0x308>
80404248:	00010517          	auipc	a0,0x10
8040424c:	96450513          	addi	a0,a0,-1692 # 80413bac <default_pmm_manager+0x534>
80404250:	fadfb0ef          	jal	ra,804001fc <cprintf>
80404254:	01248023          	sb	s2,0(s1)
80404258:	00042783          	lw	a5,0(s0)
8040425c:	1f579a63          	bne	a5,s5,80404450 <_fifo_check_swap+0x2e8>
80404260:	00010517          	auipc	a0,0x10
80404264:	8fc50513          	addi	a0,a0,-1796 # 80413b5c <default_pmm_manager+0x4e4>
80404268:	f95fb0ef          	jal	ra,804001fc <cprintf>
8040426c:	017b0023          	sb	s7,0(s6)
80404270:	00042703          	lw	a4,0(s0)
80404274:	00600793          	li	a5,6
80404278:	1af71c63          	bne	a4,a5,80404430 <_fifo_check_swap+0x2c8>
8040427c:	00010517          	auipc	a0,0x10
80404280:	93050513          	addi	a0,a0,-1744 # 80413bac <default_pmm_manager+0x534>
80404284:	f79fb0ef          	jal	ra,804001fc <cprintf>
80404288:	01248023          	sb	s2,0(s1)
8040428c:	00042703          	lw	a4,0(s0)
80404290:	00700793          	li	a5,7
80404294:	16f71e63          	bne	a4,a5,80404410 <_fifo_check_swap+0x2a8>
80404298:	00010517          	auipc	a0,0x10
8040429c:	87450513          	addi	a0,a0,-1932 # 80413b0c <default_pmm_manager+0x494>
804042a0:	f5dfb0ef          	jal	ra,804001fc <cprintf>
804042a4:	01498023          	sb	s4,0(s3)
804042a8:	00042703          	lw	a4,0(s0)
804042ac:	00800793          	li	a5,8
804042b0:	14f71063          	bne	a4,a5,804043f0 <_fifo_check_swap+0x288>
804042b4:	00010517          	auipc	a0,0x10
804042b8:	8d050513          	addi	a0,a0,-1840 # 80413b84 <default_pmm_manager+0x50c>
804042bc:	f41fb0ef          	jal	ra,804001fc <cprintf>
804042c0:	019c0023          	sb	s9,0(s8)
804042c4:	00042703          	lw	a4,0(s0)
804042c8:	00900793          	li	a5,9
804042cc:	10f71263          	bne	a4,a5,804043d0 <_fifo_check_swap+0x268>
804042d0:	00010517          	auipc	a0,0x10
804042d4:	90450513          	addi	a0,a0,-1788 # 80413bd4 <default_pmm_manager+0x55c>
804042d8:	f25fb0ef          	jal	ra,804001fc <cprintf>
804042dc:	000057b7          	lui	a5,0x5
804042e0:	00e00713          	li	a4,14
804042e4:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
804042e8:	00042483          	lw	s1,0(s0)
804042ec:	00a00793          	li	a5,10
804042f0:	0cf49063          	bne	s1,a5,804043b0 <_fifo_check_swap+0x248>
804042f4:	00010517          	auipc	a0,0x10
804042f8:	86850513          	addi	a0,a0,-1944 # 80413b5c <default_pmm_manager+0x4e4>
804042fc:	f01fb0ef          	jal	ra,804001fc <cprintf>
80404300:	000017b7          	lui	a5,0x1
80404304:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
80404308:	08979463          	bne	a5,s1,80404390 <_fifo_check_swap+0x228>
8040430c:	00042703          	lw	a4,0(s0)
80404310:	00b00793          	li	a5,11
80404314:	04f71e63          	bne	a4,a5,80404370 <_fifo_check_swap+0x208>
80404318:	02c12083          	lw	ra,44(sp)
8040431c:	02812403          	lw	s0,40(sp)
80404320:	02412483          	lw	s1,36(sp)
80404324:	02012903          	lw	s2,32(sp)
80404328:	01c12983          	lw	s3,28(sp)
8040432c:	01812a03          	lw	s4,24(sp)
80404330:	01412a83          	lw	s5,20(sp)
80404334:	01012b03          	lw	s6,16(sp)
80404338:	00c12b83          	lw	s7,12(sp)
8040433c:	00812c03          	lw	s8,8(sp)
80404340:	00412c83          	lw	s9,4(sp)
80404344:	00000513          	li	a0,0
80404348:	03010113          	addi	sp,sp,48
8040434c:	00008067          	ret
80404350:	0000f697          	auipc	a3,0xf
80404354:	7e468693          	addi	a3,a3,2020 # 80413b34 <default_pmm_manager+0x4bc>
80404358:	0000e617          	auipc	a2,0xe
8040435c:	7e460613          	addi	a2,a2,2020 # 80412b3c <commands+0x1bc>
80404360:	05f00593          	li	a1,95
80404364:	0000f517          	auipc	a0,0xf
80404368:	7e450513          	addi	a0,a0,2020 # 80413b48 <default_pmm_manager+0x4d0>
8040436c:	ab8fc0ef          	jal	ra,80400624 <__panic>
80404370:	00010697          	auipc	a3,0x10
80404374:	92868693          	addi	a3,a3,-1752 # 80413c98 <default_pmm_manager+0x620>
80404378:	0000e617          	auipc	a2,0xe
8040437c:	7c460613          	addi	a2,a2,1988 # 80412b3c <commands+0x1bc>
80404380:	08100593          	li	a1,129
80404384:	0000f517          	auipc	a0,0xf
80404388:	7c450513          	addi	a0,a0,1988 # 80413b48 <default_pmm_manager+0x4d0>
8040438c:	a98fc0ef          	jal	ra,80400624 <__panic>
80404390:	00010697          	auipc	a3,0x10
80404394:	8e468693          	addi	a3,a3,-1820 # 80413c74 <default_pmm_manager+0x5fc>
80404398:	0000e617          	auipc	a2,0xe
8040439c:	7a460613          	addi	a2,a2,1956 # 80412b3c <commands+0x1bc>
804043a0:	07f00593          	li	a1,127
804043a4:	0000f517          	auipc	a0,0xf
804043a8:	7a450513          	addi	a0,a0,1956 # 80413b48 <default_pmm_manager+0x4d0>
804043ac:	a78fc0ef          	jal	ra,80400624 <__panic>
804043b0:	00010697          	auipc	a3,0x10
804043b4:	8b068693          	addi	a3,a3,-1872 # 80413c60 <default_pmm_manager+0x5e8>
804043b8:	0000e617          	auipc	a2,0xe
804043bc:	78460613          	addi	a2,a2,1924 # 80412b3c <commands+0x1bc>
804043c0:	07d00593          	li	a1,125
804043c4:	0000f517          	auipc	a0,0xf
804043c8:	78450513          	addi	a0,a0,1924 # 80413b48 <default_pmm_manager+0x4d0>
804043cc:	a58fc0ef          	jal	ra,80400624 <__panic>
804043d0:	00010697          	auipc	a3,0x10
804043d4:	87c68693          	addi	a3,a3,-1924 # 80413c4c <default_pmm_manager+0x5d4>
804043d8:	0000e617          	auipc	a2,0xe
804043dc:	76460613          	addi	a2,a2,1892 # 80412b3c <commands+0x1bc>
804043e0:	07a00593          	li	a1,122
804043e4:	0000f517          	auipc	a0,0xf
804043e8:	76450513          	addi	a0,a0,1892 # 80413b48 <default_pmm_manager+0x4d0>
804043ec:	a38fc0ef          	jal	ra,80400624 <__panic>
804043f0:	00010697          	auipc	a3,0x10
804043f4:	84868693          	addi	a3,a3,-1976 # 80413c38 <default_pmm_manager+0x5c0>
804043f8:	0000e617          	auipc	a2,0xe
804043fc:	74460613          	addi	a2,a2,1860 # 80412b3c <commands+0x1bc>
80404400:	07700593          	li	a1,119
80404404:	0000f517          	auipc	a0,0xf
80404408:	74450513          	addi	a0,a0,1860 # 80413b48 <default_pmm_manager+0x4d0>
8040440c:	a18fc0ef          	jal	ra,80400624 <__panic>
80404410:	00010697          	auipc	a3,0x10
80404414:	81468693          	addi	a3,a3,-2028 # 80413c24 <default_pmm_manager+0x5ac>
80404418:	0000e617          	auipc	a2,0xe
8040441c:	72460613          	addi	a2,a2,1828 # 80412b3c <commands+0x1bc>
80404420:	07400593          	li	a1,116
80404424:	0000f517          	auipc	a0,0xf
80404428:	72450513          	addi	a0,a0,1828 # 80413b48 <default_pmm_manager+0x4d0>
8040442c:	9f8fc0ef          	jal	ra,80400624 <__panic>
80404430:	0000f697          	auipc	a3,0xf
80404434:	7e068693          	addi	a3,a3,2016 # 80413c10 <default_pmm_manager+0x598>
80404438:	0000e617          	auipc	a2,0xe
8040443c:	70460613          	addi	a2,a2,1796 # 80412b3c <commands+0x1bc>
80404440:	07100593          	li	a1,113
80404444:	0000f517          	auipc	a0,0xf
80404448:	70450513          	addi	a0,a0,1796 # 80413b48 <default_pmm_manager+0x4d0>
8040444c:	9d8fc0ef          	jal	ra,80400624 <__panic>
80404450:	0000f697          	auipc	a3,0xf
80404454:	7ac68693          	addi	a3,a3,1964 # 80413bfc <default_pmm_manager+0x584>
80404458:	0000e617          	auipc	a2,0xe
8040445c:	6e460613          	addi	a2,a2,1764 # 80412b3c <commands+0x1bc>
80404460:	06e00593          	li	a1,110
80404464:	0000f517          	auipc	a0,0xf
80404468:	6e450513          	addi	a0,a0,1764 # 80413b48 <default_pmm_manager+0x4d0>
8040446c:	9b8fc0ef          	jal	ra,80400624 <__panic>
80404470:	0000f697          	auipc	a3,0xf
80404474:	78c68693          	addi	a3,a3,1932 # 80413bfc <default_pmm_manager+0x584>
80404478:	0000e617          	auipc	a2,0xe
8040447c:	6c460613          	addi	a2,a2,1732 # 80412b3c <commands+0x1bc>
80404480:	06b00593          	li	a1,107
80404484:	0000f517          	auipc	a0,0xf
80404488:	6c450513          	addi	a0,a0,1732 # 80413b48 <default_pmm_manager+0x4d0>
8040448c:	998fc0ef          	jal	ra,80400624 <__panic>
80404490:	0000f697          	auipc	a3,0xf
80404494:	6a468693          	addi	a3,a3,1700 # 80413b34 <default_pmm_manager+0x4bc>
80404498:	0000e617          	auipc	a2,0xe
8040449c:	6a460613          	addi	a2,a2,1700 # 80412b3c <commands+0x1bc>
804044a0:	06800593          	li	a1,104
804044a4:	0000f517          	auipc	a0,0xf
804044a8:	6a450513          	addi	a0,a0,1700 # 80413b48 <default_pmm_manager+0x4d0>
804044ac:	978fc0ef          	jal	ra,80400624 <__panic>
804044b0:	0000f697          	auipc	a3,0xf
804044b4:	68468693          	addi	a3,a3,1668 # 80413b34 <default_pmm_manager+0x4bc>
804044b8:	0000e617          	auipc	a2,0xe
804044bc:	68460613          	addi	a2,a2,1668 # 80412b3c <commands+0x1bc>
804044c0:	06500593          	li	a1,101
804044c4:	0000f517          	auipc	a0,0xf
804044c8:	68450513          	addi	a0,a0,1668 # 80413b48 <default_pmm_manager+0x4d0>
804044cc:	958fc0ef          	jal	ra,80400624 <__panic>
804044d0:	0000f697          	auipc	a3,0xf
804044d4:	66468693          	addi	a3,a3,1636 # 80413b34 <default_pmm_manager+0x4bc>
804044d8:	0000e617          	auipc	a2,0xe
804044dc:	66460613          	addi	a2,a2,1636 # 80412b3c <commands+0x1bc>
804044e0:	06200593          	li	a1,98
804044e4:	0000f517          	auipc	a0,0xf
804044e8:	66450513          	addi	a0,a0,1636 # 80413b48 <default_pmm_manager+0x4d0>
804044ec:	938fc0ef          	jal	ra,80400624 <__panic>

804044f0 <_fifo_swap_out_victim>:
804044f0:	01452783          	lw	a5,20(a0)
804044f4:	ff010113          	addi	sp,sp,-16
804044f8:	00112623          	sw	ra,12(sp)
804044fc:	02078a63          	beqz	a5,80404530 <_fifo_swap_out_victim+0x40>
80404500:	04061863          	bnez	a2,80404550 <_fifo_swap_out_victim+0x60>
80404504:	0047a783          	lw	a5,4(a5)
80404508:	00c12083          	lw	ra,12(sp)
8040450c:	00000513          	li	a0,0
80404510:	0007a683          	lw	a3,0(a5)
80404514:	0047a703          	lw	a4,4(a5)
80404518:	fec78793          	addi	a5,a5,-20
8040451c:	00e6a223          	sw	a4,4(a3)
80404520:	00d72023          	sw	a3,0(a4)
80404524:	00f5a023          	sw	a5,0(a1)
80404528:	01010113          	addi	sp,sp,16
8040452c:	00008067          	ret
80404530:	0000f697          	auipc	a3,0xf
80404534:	79c68693          	addi	a3,a3,1948 # 80413ccc <default_pmm_manager+0x654>
80404538:	0000e617          	auipc	a2,0xe
8040453c:	60460613          	addi	a2,a2,1540 # 80412b3c <commands+0x1bc>
80404540:	05000593          	li	a1,80
80404544:	0000f517          	auipc	a0,0xf
80404548:	60450513          	addi	a0,a0,1540 # 80413b48 <default_pmm_manager+0x4d0>
8040454c:	8d8fc0ef          	jal	ra,80400624 <__panic>
80404550:	0000f697          	auipc	a3,0xf
80404554:	78c68693          	addi	a3,a3,1932 # 80413cdc <default_pmm_manager+0x664>
80404558:	0000e617          	auipc	a2,0xe
8040455c:	5e460613          	addi	a2,a2,1508 # 80412b3c <commands+0x1bc>
80404560:	05100593          	li	a1,81
80404564:	0000f517          	auipc	a0,0xf
80404568:	5e450513          	addi	a0,a0,1508 # 80413b48 <default_pmm_manager+0x4d0>
8040456c:	8b8fc0ef          	jal	ra,80400624 <__panic>

80404570 <_fifo_map_swappable>:
80404570:	01460713          	addi	a4,a2,20
80404574:	01452783          	lw	a5,20(a0)
80404578:	02070263          	beqz	a4,8040459c <_fifo_map_swappable+0x2c>
8040457c:	02078063          	beqz	a5,8040459c <_fifo_map_swappable+0x2c>
80404580:	0007a683          	lw	a3,0(a5)
80404584:	00e7a023          	sw	a4,0(a5)
80404588:	00000513          	li	a0,0
8040458c:	00e6a223          	sw	a4,4(a3)
80404590:	00f62c23          	sw	a5,24(a2)
80404594:	00d62a23          	sw	a3,20(a2)
80404598:	00008067          	ret
8040459c:	ff010113          	addi	sp,sp,-16
804045a0:	0000f697          	auipc	a3,0xf
804045a4:	70c68693          	addi	a3,a3,1804 # 80413cac <default_pmm_manager+0x634>
804045a8:	0000e617          	auipc	a2,0xe
804045ac:	59460613          	addi	a2,a2,1428 # 80412b3c <commands+0x1bc>
804045b0:	03f00593          	li	a1,63
804045b4:	0000f517          	auipc	a0,0xf
804045b8:	59450513          	addi	a0,a0,1428 # 80413b48 <default_pmm_manager+0x4d0>
804045bc:	00112623          	sw	ra,12(sp)
804045c0:	864fc0ef          	jal	ra,80400624 <__panic>

804045c4 <check_vma_overlap.isra.2.part.3>:
804045c4:	ff010113          	addi	sp,sp,-16
804045c8:	0000f697          	auipc	a3,0xf
804045cc:	73868693          	addi	a3,a3,1848 # 80413d00 <default_pmm_manager+0x688>
804045d0:	0000e617          	auipc	a2,0xe
804045d4:	56c60613          	addi	a2,a2,1388 # 80412b3c <commands+0x1bc>
804045d8:	06d00593          	li	a1,109
804045dc:	0000f517          	auipc	a0,0xf
804045e0:	74450513          	addi	a0,a0,1860 # 80413d20 <default_pmm_manager+0x6a8>
804045e4:	00112623          	sw	ra,12(sp)
804045e8:	83cfc0ef          	jal	ra,80400624 <__panic>

804045ec <mm_create>:
804045ec:	ff010113          	addi	sp,sp,-16
804045f0:	02c00513          	li	a0,44
804045f4:	00812423          	sw	s0,8(sp)
804045f8:	00112623          	sw	ra,12(sp)
804045fc:	b88fe0ef          	jal	ra,80402984 <kmalloc>
80404600:	00050413          	mv	s0,a0
80404604:	02050e63          	beqz	a0,80404640 <mm_create+0x54>
80404608:	00098797          	auipc	a5,0x98
8040460c:	19c78793          	addi	a5,a5,412 # 8049c7a4 <swap_init_ok>
80404610:	0007a783          	lw	a5,0(a5)
80404614:	00a42223          	sw	a0,4(s0)
80404618:	00a42023          	sw	a0,0(s0)
8040461c:	00052423          	sw	zero,8(a0)
80404620:	00052623          	sw	zero,12(a0)
80404624:	00052823          	sw	zero,16(a0)
80404628:	02079663          	bnez	a5,80404654 <mm_create+0x68>
8040462c:	00052a23          	sw	zero,20(a0)
80404630:	00042c23          	sw	zero,24(s0)
80404634:	00100593          	li	a1,1
80404638:	01c40513          	addi	a0,s0,28
8040463c:	275000ef          	jal	ra,804050b0 <sem_init>
80404640:	00040513          	mv	a0,s0
80404644:	00c12083          	lw	ra,12(sp)
80404648:	00812403          	lw	s0,8(sp)
8040464c:	01010113          	addi	sp,sp,16
80404650:	00008067          	ret
80404654:	85dff0ef          	jal	ra,80403eb0 <swap_init_mm>
80404658:	fd9ff06f          	j	80404630 <mm_create+0x44>

8040465c <find_vma>:
8040465c:	04050263          	beqz	a0,804046a0 <find_vma+0x44>
80404660:	00852783          	lw	a5,8(a0)
80404664:	00078663          	beqz	a5,80404670 <find_vma+0x14>
80404668:	0047a703          	lw	a4,4(a5)
8040466c:	04e5f063          	bgeu	a1,a4,804046ac <find_vma+0x50>
80404670:	00050793          	mv	a5,a0
80404674:	0047a783          	lw	a5,4(a5)
80404678:	02f50463          	beq	a0,a5,804046a0 <find_vma+0x44>
8040467c:	ff47a703          	lw	a4,-12(a5)
80404680:	fee5eae3          	bltu	a1,a4,80404674 <find_vma+0x18>
80404684:	ff87a703          	lw	a4,-8(a5)
80404688:	fee5f6e3          	bgeu	a1,a4,80404674 <find_vma+0x18>
8040468c:	ff078793          	addi	a5,a5,-16
80404690:	00078863          	beqz	a5,804046a0 <find_vma+0x44>
80404694:	00f52423          	sw	a5,8(a0)
80404698:	00078513          	mv	a0,a5
8040469c:	00008067          	ret
804046a0:	00000793          	li	a5,0
804046a4:	00078513          	mv	a0,a5
804046a8:	00008067          	ret
804046ac:	0087a703          	lw	a4,8(a5)
804046b0:	fce5f0e3          	bgeu	a1,a4,80404670 <find_vma+0x14>
804046b4:	00f52423          	sw	a5,8(a0)
804046b8:	fe1ff06f          	j	80404698 <find_vma+0x3c>

804046bc <insert_vma_struct>:
804046bc:	0045a603          	lw	a2,4(a1)
804046c0:	0085a803          	lw	a6,8(a1)
804046c4:	ff010113          	addi	sp,sp,-16
804046c8:	00112623          	sw	ra,12(sp)
804046cc:	00050713          	mv	a4,a0
804046d0:	01066a63          	bltu	a2,a6,804046e4 <insert_vma_struct+0x28>
804046d4:	07c0006f          	j	80404750 <insert_vma_struct+0x94>
804046d8:	ff47a683          	lw	a3,-12(a5)
804046dc:	06d66463          	bltu	a2,a3,80404744 <insert_vma_struct+0x88>
804046e0:	00078713          	mv	a4,a5
804046e4:	00472783          	lw	a5,4(a4)
804046e8:	fef518e3          	bne	a0,a5,804046d8 <insert_vma_struct+0x1c>
804046ec:	02a70463          	beq	a4,a0,80404714 <insert_vma_struct+0x58>
804046f0:	ff872683          	lw	a3,-8(a4)
804046f4:	ff472883          	lw	a7,-12(a4)
804046f8:	08d8fc63          	bgeu	a7,a3,80404790 <insert_vma_struct+0xd4>
804046fc:	06d66a63          	bltu	a2,a3,80404770 <insert_vma_struct+0xb4>
80404700:	00f50a63          	beq	a0,a5,80404714 <insert_vma_struct+0x58>
80404704:	ff47a683          	lw	a3,-12(a5)
80404708:	0706e463          	bltu	a3,a6,80404770 <insert_vma_struct+0xb4>
8040470c:	ff87a603          	lw	a2,-8(a5)
80404710:	02c6fe63          	bgeu	a3,a2,8040474c <insert_vma_struct+0x90>
80404714:	01052683          	lw	a3,16(a0)
80404718:	00a5a023          	sw	a0,0(a1)
8040471c:	01058613          	addi	a2,a1,16
80404720:	00c7a023          	sw	a2,0(a5)
80404724:	00c72223          	sw	a2,4(a4)
80404728:	00c12083          	lw	ra,12(sp)
8040472c:	00f5aa23          	sw	a5,20(a1)
80404730:	00e5a823          	sw	a4,16(a1)
80404734:	00168693          	addi	a3,a3,1
80404738:	00d52823          	sw	a3,16(a0)
8040473c:	01010113          	addi	sp,sp,16
80404740:	00008067          	ret
80404744:	faa716e3          	bne	a4,a0,804046f0 <insert_vma_struct+0x34>
80404748:	fc1ff06f          	j	80404708 <insert_vma_struct+0x4c>
8040474c:	e79ff0ef          	jal	ra,804045c4 <check_vma_overlap.isra.2.part.3>
80404750:	0000f697          	auipc	a3,0xf
80404754:	6dc68693          	addi	a3,a3,1756 # 80413e2c <default_pmm_manager+0x7b4>
80404758:	0000e617          	auipc	a2,0xe
8040475c:	3e460613          	addi	a2,a2,996 # 80412b3c <commands+0x1bc>
80404760:	07200593          	li	a1,114
80404764:	0000f517          	auipc	a0,0xf
80404768:	5bc50513          	addi	a0,a0,1468 # 80413d20 <default_pmm_manager+0x6a8>
8040476c:	eb9fb0ef          	jal	ra,80400624 <__panic>
80404770:	0000f697          	auipc	a3,0xf
80404774:	6f868693          	addi	a3,a3,1784 # 80413e68 <default_pmm_manager+0x7f0>
80404778:	0000e617          	auipc	a2,0xe
8040477c:	3c460613          	addi	a2,a2,964 # 80412b3c <commands+0x1bc>
80404780:	06c00593          	li	a1,108
80404784:	0000f517          	auipc	a0,0xf
80404788:	59c50513          	addi	a0,a0,1436 # 80413d20 <default_pmm_manager+0x6a8>
8040478c:	e99fb0ef          	jal	ra,80400624 <__panic>
80404790:	0000f697          	auipc	a3,0xf
80404794:	6b868693          	addi	a3,a3,1720 # 80413e48 <default_pmm_manager+0x7d0>
80404798:	0000e617          	auipc	a2,0xe
8040479c:	3a460613          	addi	a2,a2,932 # 80412b3c <commands+0x1bc>
804047a0:	06b00593          	li	a1,107
804047a4:	0000f517          	auipc	a0,0xf
804047a8:	57c50513          	addi	a0,a0,1404 # 80413d20 <default_pmm_manager+0x6a8>
804047ac:	e79fb0ef          	jal	ra,80400624 <__panic>

804047b0 <mm_destroy>:
804047b0:	01852783          	lw	a5,24(a0)
804047b4:	ff010113          	addi	sp,sp,-16
804047b8:	00112623          	sw	ra,12(sp)
804047bc:	00812423          	sw	s0,8(sp)
804047c0:	04079263          	bnez	a5,80404804 <mm_destroy+0x54>
804047c4:	00050413          	mv	s0,a0
804047c8:	00452503          	lw	a0,4(a0)
804047cc:	02a40263          	beq	s0,a0,804047f0 <mm_destroy+0x40>
804047d0:	00052703          	lw	a4,0(a0)
804047d4:	00452783          	lw	a5,4(a0)
804047d8:	ff050513          	addi	a0,a0,-16
804047dc:	00f72223          	sw	a5,4(a4)
804047e0:	00e7a023          	sw	a4,0(a5)
804047e4:	ac4fe0ef          	jal	ra,80402aa8 <kfree>
804047e8:	00442503          	lw	a0,4(s0)
804047ec:	fea412e3          	bne	s0,a0,804047d0 <mm_destroy+0x20>
804047f0:	00040513          	mv	a0,s0
804047f4:	00812403          	lw	s0,8(sp)
804047f8:	00c12083          	lw	ra,12(sp)
804047fc:	01010113          	addi	sp,sp,16
80404800:	aa8fe06f          	j	80402aa8 <kfree>
80404804:	0000f697          	auipc	a3,0xf
80404808:	68468693          	addi	a3,a3,1668 # 80413e88 <default_pmm_manager+0x810>
8040480c:	0000e617          	auipc	a2,0xe
80404810:	33060613          	addi	a2,a2,816 # 80412b3c <commands+0x1bc>
80404814:	09100593          	li	a1,145
80404818:	0000f517          	auipc	a0,0xf
8040481c:	50850513          	addi	a0,a0,1288 # 80413d20 <default_pmm_manager+0x6a8>
80404820:	e05fb0ef          	jal	ra,80400624 <__panic>

80404824 <mm_map>:
80404824:	000017b7          	lui	a5,0x1
80404828:	fe010113          	addi	sp,sp,-32
8040482c:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80404830:	fffff837          	lui	a6,0xfffff
80404834:	00812c23          	sw	s0,24(sp)
80404838:	00f60433          	add	s0,a2,a5
8040483c:	00912a23          	sw	s1,20(sp)
80404840:	00b40433          	add	s0,s0,a1
80404844:	00112e23          	sw	ra,28(sp)
80404848:	01212823          	sw	s2,16(sp)
8040484c:	01312623          	sw	s3,12(sp)
80404850:	01412423          	sw	s4,8(sp)
80404854:	01512223          	sw	s5,4(sp)
80404858:	0105f4b3          	and	s1,a1,a6
8040485c:	002007b7          	lui	a5,0x200
80404860:	01047433          	and	s0,s0,a6
80404864:	08f4e863          	bltu	s1,a5,804048f4 <mm_map+0xd0>
80404868:	0884f663          	bgeu	s1,s0,804048f4 <mm_map+0xd0>
8040486c:	800007b7          	lui	a5,0x80000
80404870:	0887e263          	bltu	a5,s0,804048f4 <mm_map+0xd0>
80404874:	00050993          	mv	s3,a0
80404878:	00070a13          	mv	s4,a4
8040487c:	00068a93          	mv	s5,a3
80404880:	06050e63          	beqz	a0,804048fc <mm_map+0xd8>
80404884:	00048593          	mv	a1,s1
80404888:	dd5ff0ef          	jal	ra,8040465c <find_vma>
8040488c:	00050663          	beqz	a0,80404898 <mm_map+0x74>
80404890:	00452783          	lw	a5,4(a0)
80404894:	0687e063          	bltu	a5,s0,804048f4 <mm_map+0xd0>
80404898:	01800513          	li	a0,24
8040489c:	8e8fe0ef          	jal	ra,80402984 <kmalloc>
804048a0:	00050913          	mv	s2,a0
804048a4:	ffc00513          	li	a0,-4
804048a8:	02090463          	beqz	s2,804048d0 <mm_map+0xac>
804048ac:	00098513          	mv	a0,s3
804048b0:	00992223          	sw	s1,4(s2)
804048b4:	00892423          	sw	s0,8(s2)
804048b8:	01592623          	sw	s5,12(s2)
804048bc:	00090593          	mv	a1,s2
804048c0:	dfdff0ef          	jal	ra,804046bc <insert_vma_struct>
804048c4:	00000513          	li	a0,0
804048c8:	000a0463          	beqz	s4,804048d0 <mm_map+0xac>
804048cc:	012a2023          	sw	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x7000>
804048d0:	01c12083          	lw	ra,28(sp)
804048d4:	01812403          	lw	s0,24(sp)
804048d8:	01412483          	lw	s1,20(sp)
804048dc:	01012903          	lw	s2,16(sp)
804048e0:	00c12983          	lw	s3,12(sp)
804048e4:	00812a03          	lw	s4,8(sp)
804048e8:	00412a83          	lw	s5,4(sp)
804048ec:	02010113          	addi	sp,sp,32
804048f0:	00008067          	ret
804048f4:	ffd00513          	li	a0,-3
804048f8:	fd9ff06f          	j	804048d0 <mm_map+0xac>
804048fc:	0000f697          	auipc	a3,0xf
80404900:	5a068693          	addi	a3,a3,1440 # 80413e9c <default_pmm_manager+0x824>
80404904:	0000e617          	auipc	a2,0xe
80404908:	23860613          	addi	a2,a2,568 # 80412b3c <commands+0x1bc>
8040490c:	0a400593          	li	a1,164
80404910:	0000f517          	auipc	a0,0xf
80404914:	41050513          	addi	a0,a0,1040 # 80413d20 <default_pmm_manager+0x6a8>
80404918:	d0dfb0ef          	jal	ra,80400624 <__panic>

8040491c <dup_mmap>:
8040491c:	fe010113          	addi	sp,sp,-32
80404920:	00112e23          	sw	ra,28(sp)
80404924:	00812c23          	sw	s0,24(sp)
80404928:	00912a23          	sw	s1,20(sp)
8040492c:	01212823          	sw	s2,16(sp)
80404930:	01312623          	sw	s3,12(sp)
80404934:	01412423          	sw	s4,8(sp)
80404938:	01512223          	sw	s5,4(sp)
8040493c:	0a050063          	beqz	a0,804049dc <dup_mmap+0xc0>
80404940:	00050913          	mv	s2,a0
80404944:	00058493          	mv	s1,a1
80404948:	00058413          	mv	s0,a1
8040494c:	02059e63          	bnez	a1,80404988 <dup_mmap+0x6c>
80404950:	08c0006f          	j	804049dc <dup_mmap+0xc0>
80404954:	00050593          	mv	a1,a0
80404958:	0157a223          	sw	s5,4(a5) # 80000004 <end+0xffb63748>
8040495c:	00090513          	mv	a0,s2
80404960:	0147a423          	sw	s4,8(a5)
80404964:	0137a623          	sw	s3,12(a5)
80404968:	d55ff0ef          	jal	ra,804046bc <insert_vma_struct>
8040496c:	ff842683          	lw	a3,-8(s0)
80404970:	ff442603          	lw	a2,-12(s0)
80404974:	00c4a583          	lw	a1,12(s1)
80404978:	00c92503          	lw	a0,12(s2)
8040497c:	00000713          	li	a4,0
80404980:	a6dfe0ef          	jal	ra,804033ec <copy_range>
80404984:	02051463          	bnez	a0,804049ac <dup_mmap+0x90>
80404988:	00042403          	lw	s0,0(s0)
8040498c:	04848463          	beq	s1,s0,804049d4 <dup_mmap+0xb8>
80404990:	01800513          	li	a0,24
80404994:	ff442a83          	lw	s5,-12(s0)
80404998:	ff842a03          	lw	s4,-8(s0)
8040499c:	ffc42983          	lw	s3,-4(s0)
804049a0:	fe5fd0ef          	jal	ra,80402984 <kmalloc>
804049a4:	00050793          	mv	a5,a0
804049a8:	fa0516e3          	bnez	a0,80404954 <dup_mmap+0x38>
804049ac:	ffc00513          	li	a0,-4
804049b0:	01c12083          	lw	ra,28(sp)
804049b4:	01812403          	lw	s0,24(sp)
804049b8:	01412483          	lw	s1,20(sp)
804049bc:	01012903          	lw	s2,16(sp)
804049c0:	00c12983          	lw	s3,12(sp)
804049c4:	00812a03          	lw	s4,8(sp)
804049c8:	00412a83          	lw	s5,4(sp)
804049cc:	02010113          	addi	sp,sp,32
804049d0:	00008067          	ret
804049d4:	00000513          	li	a0,0
804049d8:	fd9ff06f          	j	804049b0 <dup_mmap+0x94>
804049dc:	0000f697          	auipc	a3,0xf
804049e0:	41468693          	addi	a3,a3,1044 # 80413df0 <default_pmm_manager+0x778>
804049e4:	0000e617          	auipc	a2,0xe
804049e8:	15860613          	addi	a2,a2,344 # 80412b3c <commands+0x1bc>
804049ec:	0bc00593          	li	a1,188
804049f0:	0000f517          	auipc	a0,0xf
804049f4:	33050513          	addi	a0,a0,816 # 80413d20 <default_pmm_manager+0x6a8>
804049f8:	c2dfb0ef          	jal	ra,80400624 <__panic>

804049fc <exit_mmap>:
804049fc:	ff010113          	addi	sp,sp,-16
80404a00:	00112623          	sw	ra,12(sp)
80404a04:	00812423          	sw	s0,8(sp)
80404a08:	00912223          	sw	s1,4(sp)
80404a0c:	01212023          	sw	s2,0(sp)
80404a10:	06050663          	beqz	a0,80404a7c <exit_mmap+0x80>
80404a14:	01852783          	lw	a5,24(a0)
80404a18:	00050493          	mv	s1,a0
80404a1c:	06079063          	bnez	a5,80404a7c <exit_mmap+0x80>
80404a20:	00452403          	lw	s0,4(a0)
80404a24:	00c52903          	lw	s2,12(a0)
80404a28:	02850a63          	beq	a0,s0,80404a5c <exit_mmap+0x60>
80404a2c:	ff842603          	lw	a2,-8(s0)
80404a30:	ff442583          	lw	a1,-12(s0)
80404a34:	00090513          	mv	a0,s2
80404a38:	dc8fe0ef          	jal	ra,80403000 <unmap_range>
80404a3c:	00442403          	lw	s0,4(s0)
80404a40:	fe8496e3          	bne	s1,s0,80404a2c <exit_mmap+0x30>
80404a44:	00442403          	lw	s0,4(s0)
80404a48:	00848e63          	beq	s1,s0,80404a64 <exit_mmap+0x68>
80404a4c:	ff842603          	lw	a2,-8(s0)
80404a50:	ff442583          	lw	a1,-12(s0)
80404a54:	00090513          	mv	a0,s2
80404a58:	f2cfe0ef          	jal	ra,80403184 <exit_range>
80404a5c:	00442403          	lw	s0,4(s0)
80404a60:	fe8496e3          	bne	s1,s0,80404a4c <exit_mmap+0x50>
80404a64:	00c12083          	lw	ra,12(sp)
80404a68:	00812403          	lw	s0,8(sp)
80404a6c:	00412483          	lw	s1,4(sp)
80404a70:	00012903          	lw	s2,0(sp)
80404a74:	01010113          	addi	sp,sp,16
80404a78:	00008067          	ret
80404a7c:	0000f697          	auipc	a3,0xf
80404a80:	39068693          	addi	a3,a3,912 # 80413e0c <default_pmm_manager+0x794>
80404a84:	0000e617          	auipc	a2,0xe
80404a88:	0b860613          	addi	a2,a2,184 # 80412b3c <commands+0x1bc>
80404a8c:	0d200593          	li	a1,210
80404a90:	0000f517          	auipc	a0,0xf
80404a94:	29050513          	addi	a0,a0,656 # 80413d20 <default_pmm_manager+0x6a8>
80404a98:	b8dfb0ef          	jal	ra,80400624 <__panic>

80404a9c <vmm_init>:
80404a9c:	00008067          	ret

80404aa0 <do_pgfault>:
80404aa0:	fd010113          	addi	sp,sp,-48
80404aa4:	00060593          	mv	a1,a2
80404aa8:	02912223          	sw	s1,36(sp)
80404aac:	03212023          	sw	s2,32(sp)
80404ab0:	02112623          	sw	ra,44(sp)
80404ab4:	02812423          	sw	s0,40(sp)
80404ab8:	01312e23          	sw	s3,28(sp)
80404abc:	00060493          	mv	s1,a2
80404ac0:	00050913          	mv	s2,a0
80404ac4:	b99ff0ef          	jal	ra,8040465c <find_vma>
80404ac8:	00098797          	auipc	a5,0x98
80404acc:	ce078793          	addi	a5,a5,-800 # 8049c7a8 <pgfault_num>
80404ad0:	0007a783          	lw	a5,0(a5)
80404ad4:	00178793          	addi	a5,a5,1
80404ad8:	00098717          	auipc	a4,0x98
80404adc:	ccf72823          	sw	a5,-816(a4) # 8049c7a8 <pgfault_num>
80404ae0:	10050e63          	beqz	a0,80404bfc <do_pgfault+0x15c>
80404ae4:	00452783          	lw	a5,4(a0)
80404ae8:	10f4ea63          	bltu	s1,a5,80404bfc <do_pgfault+0x15c>
80404aec:	00c52403          	lw	s0,12(a0)
80404af0:	fffff637          	lui	a2,0xfffff
80404af4:	00c92503          	lw	a0,12(s2)
80404af8:	00247413          	andi	s0,s0,2
80404afc:	00c4f4b3          	and	s1,s1,a2
80404b00:	00143413          	seqz	s0,s0
80404b04:	40800433          	neg	s0,s0
80404b08:	00100613          	li	a2,1
80404b0c:	00048593          	mv	a1,s1
80404b10:	ff947413          	andi	s0,s0,-7
80404b14:	b84fe0ef          	jal	ra,80402e98 <get_pte>
80404b18:	01740413          	addi	s0,s0,23
80404b1c:	10050663          	beqz	a0,80404c28 <do_pgfault+0x188>
80404b20:	00052583          	lw	a1,0(a0)
80404b24:	0a058663          	beqz	a1,80404bd0 <do_pgfault+0x130>
80404b28:	00098797          	auipc	a5,0x98
80404b2c:	c7c78793          	addi	a5,a5,-900 # 8049c7a4 <swap_init_ok>
80404b30:	0007a783          	lw	a5,0(a5)
80404b34:	0e078063          	beqz	a5,80404c14 <do_pgfault+0x174>
80404b38:	00c10613          	addi	a2,sp,12
80404b3c:	00048593          	mv	a1,s1
80404b40:	00090513          	mv	a0,s2
80404b44:	00012623          	sw	zero,12(sp)
80404b48:	d3cff0ef          	jal	ra,80404084 <swap_in>
80404b4c:	00050993          	mv	s3,a0
80404b50:	04051a63          	bnez	a0,80404ba4 <do_pgfault+0x104>
80404b54:	00c12583          	lw	a1,12(sp)
80404b58:	00c92503          	lw	a0,12(s2)
80404b5c:	00040693          	mv	a3,s0
80404b60:	00048613          	mv	a2,s1
80404b64:	f68fe0ef          	jal	ra,804032cc <page_insert>
80404b68:	00c12603          	lw	a2,12(sp)
80404b6c:	00100693          	li	a3,1
80404b70:	00048593          	mv	a1,s1
80404b74:	00090513          	mv	a0,s2
80404b78:	b4cff0ef          	jal	ra,80403ec4 <swap_map_swappable>
80404b7c:	00c12783          	lw	a5,12(sp)
80404b80:	0097ae23          	sw	s1,28(a5)
80404b84:	02c12083          	lw	ra,44(sp)
80404b88:	02812403          	lw	s0,40(sp)
80404b8c:	00098513          	mv	a0,s3
80404b90:	02412483          	lw	s1,36(sp)
80404b94:	02012903          	lw	s2,32(sp)
80404b98:	01c12983          	lw	s3,28(sp)
80404b9c:	03010113          	addi	sp,sp,48
80404ba0:	00008067          	ret
80404ba4:	0000f517          	auipc	a0,0xf
80404ba8:	20450513          	addi	a0,a0,516 # 80413da8 <default_pmm_manager+0x730>
80404bac:	e50fb0ef          	jal	ra,804001fc <cprintf>
80404bb0:	02c12083          	lw	ra,44(sp)
80404bb4:	02812403          	lw	s0,40(sp)
80404bb8:	00098513          	mv	a0,s3
80404bbc:	02412483          	lw	s1,36(sp)
80404bc0:	02012903          	lw	s2,32(sp)
80404bc4:	01c12983          	lw	s3,28(sp)
80404bc8:	03010113          	addi	sp,sp,48
80404bcc:	00008067          	ret
80404bd0:	00c92503          	lw	a0,12(s2)
80404bd4:	00040613          	mv	a2,s0
80404bd8:	00048593          	mv	a1,s1
80404bdc:	ae5fe0ef          	jal	ra,804036c0 <pgdir_alloc_page>
80404be0:	00000993          	li	s3,0
80404be4:	fa0510e3          	bnez	a0,80404b84 <do_pgfault+0xe4>
80404be8:	0000f517          	auipc	a0,0xf
80404bec:	19850513          	addi	a0,a0,408 # 80413d80 <default_pmm_manager+0x708>
80404bf0:	e0cfb0ef          	jal	ra,804001fc <cprintf>
80404bf4:	ffc00993          	li	s3,-4
80404bf8:	f8dff06f          	j	80404b84 <do_pgfault+0xe4>
80404bfc:	00048593          	mv	a1,s1
80404c00:	0000f517          	auipc	a0,0xf
80404c04:	13050513          	addi	a0,a0,304 # 80413d30 <default_pmm_manager+0x6b8>
80404c08:	df4fb0ef          	jal	ra,804001fc <cprintf>
80404c0c:	ffd00993          	li	s3,-3
80404c10:	f75ff06f          	j	80404b84 <do_pgfault+0xe4>
80404c14:	0000f517          	auipc	a0,0xf
80404c18:	1b450513          	addi	a0,a0,436 # 80413dc8 <default_pmm_manager+0x750>
80404c1c:	de0fb0ef          	jal	ra,804001fc <cprintf>
80404c20:	ffc00993          	li	s3,-4
80404c24:	f61ff06f          	j	80404b84 <do_pgfault+0xe4>
80404c28:	0000f517          	auipc	a0,0xf
80404c2c:	13850513          	addi	a0,a0,312 # 80413d60 <default_pmm_manager+0x6e8>
80404c30:	dccfb0ef          	jal	ra,804001fc <cprintf>
80404c34:	ffc00993          	li	s3,-4
80404c38:	f4dff06f          	j	80404b84 <do_pgfault+0xe4>

80404c3c <user_mem_check>:
80404c3c:	fe010113          	addi	sp,sp,-32
80404c40:	00812c23          	sw	s0,24(sp)
80404c44:	00112e23          	sw	ra,28(sp)
80404c48:	00912a23          	sw	s1,20(sp)
80404c4c:	01212823          	sw	s2,16(sp)
80404c50:	01312623          	sw	s3,12(sp)
80404c54:	01412423          	sw	s4,8(sp)
80404c58:	00058413          	mv	s0,a1
80404c5c:	08050c63          	beqz	a0,80404cf4 <user_mem_check+0xb8>
80404c60:	002007b7          	lui	a5,0x200
80404c64:	06f5e663          	bltu	a1,a5,80404cd0 <user_mem_check+0x94>
80404c68:	00c584b3          	add	s1,a1,a2
80404c6c:	0695f263          	bgeu	a1,s1,80404cd0 <user_mem_check+0x94>
80404c70:	800007b7          	lui	a5,0x80000
80404c74:	0497ee63          	bltu	a5,s1,80404cd0 <user_mem_check+0x94>
80404c78:	00050913          	mv	s2,a0
80404c7c:	00068993          	mv	s3,a3
80404c80:	00001a37          	lui	s4,0x1
80404c84:	0240006f          	j	80404ca8 <user_mem_check+0x6c>
80404c88:	0027f693          	andi	a3,a5,2
80404c8c:	01470733          	add	a4,a4,s4
80404c90:	0087f793          	andi	a5,a5,8
80404c94:	02068e63          	beqz	a3,80404cd0 <user_mem_check+0x94>
80404c98:	00078463          	beqz	a5,80404ca0 <user_mem_check+0x64>
80404c9c:	02e46a63          	bltu	s0,a4,80404cd0 <user_mem_check+0x94>
80404ca0:	00852403          	lw	s0,8(a0)
80404ca4:	06947463          	bgeu	s0,s1,80404d0c <user_mem_check+0xd0>
80404ca8:	00040593          	mv	a1,s0
80404cac:	00090513          	mv	a0,s2
80404cb0:	9adff0ef          	jal	ra,8040465c <find_vma>
80404cb4:	00050e63          	beqz	a0,80404cd0 <user_mem_check+0x94>
80404cb8:	00452703          	lw	a4,4(a0)
80404cbc:	00e46a63          	bltu	s0,a4,80404cd0 <user_mem_check+0x94>
80404cc0:	00c52783          	lw	a5,12(a0)
80404cc4:	fc0992e3          	bnez	s3,80404c88 <user_mem_check+0x4c>
80404cc8:	0017f793          	andi	a5,a5,1
80404ccc:	fc079ae3          	bnez	a5,80404ca0 <user_mem_check+0x64>
80404cd0:	00000513          	li	a0,0
80404cd4:	01c12083          	lw	ra,28(sp)
80404cd8:	01812403          	lw	s0,24(sp)
80404cdc:	01412483          	lw	s1,20(sp)
80404ce0:	01012903          	lw	s2,16(sp)
80404ce4:	00c12983          	lw	s3,12(sp)
80404ce8:	00812a03          	lw	s4,8(sp)
80404cec:	02010113          	addi	sp,sp,32
80404cf0:	00008067          	ret
80404cf4:	804007b7          	lui	a5,0x80400
80404cf8:	fcf5ece3          	bltu	a1,a5,80404cd0 <user_mem_check+0x94>
80404cfc:	00c58633          	add	a2,a1,a2
80404d00:	fcc5f8e3          	bgeu	a1,a2,80404cd0 <user_mem_check+0x94>
80404d04:	80c007b7          	lui	a5,0x80c00
80404d08:	fcc7e4e3          	bltu	a5,a2,80404cd0 <user_mem_check+0x94>
80404d0c:	00100513          	li	a0,1
80404d10:	fc5ff06f          	j	80404cd4 <user_mem_check+0x98>

80404d14 <copy_from_user>:
80404d14:	ff010113          	addi	sp,sp,-16
80404d18:	00812423          	sw	s0,8(sp)
80404d1c:	00912223          	sw	s1,4(sp)
80404d20:	00060413          	mv	s0,a2
80404d24:	00068493          	mv	s1,a3
80404d28:	01212023          	sw	s2,0(sp)
80404d2c:	00070693          	mv	a3,a4
80404d30:	00058913          	mv	s2,a1
80404d34:	00048613          	mv	a2,s1
80404d38:	00040593          	mv	a1,s0
80404d3c:	00112623          	sw	ra,12(sp)
80404d40:	efdff0ef          	jal	ra,80404c3c <user_mem_check>
80404d44:	00050c63          	beqz	a0,80404d5c <copy_from_user+0x48>
80404d48:	00048613          	mv	a2,s1
80404d4c:	00040593          	mv	a1,s0
80404d50:	00090513          	mv	a0,s2
80404d54:	2290d0ef          	jal	ra,8041277c <memcpy>
80404d58:	00100513          	li	a0,1
80404d5c:	00c12083          	lw	ra,12(sp)
80404d60:	00812403          	lw	s0,8(sp)
80404d64:	00412483          	lw	s1,4(sp)
80404d68:	00012903          	lw	s2,0(sp)
80404d6c:	01010113          	addi	sp,sp,16
80404d70:	00008067          	ret

80404d74 <copy_to_user>:
80404d74:	ff010113          	addi	sp,sp,-16
80404d78:	00812423          	sw	s0,8(sp)
80404d7c:	00068413          	mv	s0,a3
80404d80:	01212023          	sw	s2,0(sp)
80404d84:	00100693          	li	a3,1
80404d88:	00060913          	mv	s2,a2
80404d8c:	00040613          	mv	a2,s0
80404d90:	00912223          	sw	s1,4(sp)
80404d94:	00112623          	sw	ra,12(sp)
80404d98:	00058493          	mv	s1,a1
80404d9c:	ea1ff0ef          	jal	ra,80404c3c <user_mem_check>
80404da0:	00050c63          	beqz	a0,80404db8 <copy_to_user+0x44>
80404da4:	00040613          	mv	a2,s0
80404da8:	00090593          	mv	a1,s2
80404dac:	00048513          	mv	a0,s1
80404db0:	1cd0d0ef          	jal	ra,8041277c <memcpy>
80404db4:	00100513          	li	a0,1
80404db8:	00c12083          	lw	ra,12(sp)
80404dbc:	00812403          	lw	s0,8(sp)
80404dc0:	00412483          	lw	s1,4(sp)
80404dc4:	00012903          	lw	s2,0(sp)
80404dc8:	01010113          	addi	sp,sp,16
80404dcc:	00008067          	ret

80404dd0 <copy_string>:
80404dd0:	fe010113          	addi	sp,sp,-32
80404dd4:	01312623          	sw	s3,12(sp)
80404dd8:	000019b7          	lui	s3,0x1
80404ddc:	013609b3          	add	s3,a2,s3
80404de0:	fffff7b7          	lui	a5,0xfffff
80404de4:	00f9f9b3          	and	s3,s3,a5
80404de8:	00912a23          	sw	s1,20(sp)
80404dec:	01212823          	sw	s2,16(sp)
80404df0:	01412423          	sw	s4,8(sp)
80404df4:	01512223          	sw	s5,4(sp)
80404df8:	00112e23          	sw	ra,28(sp)
80404dfc:	00812c23          	sw	s0,24(sp)
80404e00:	00060493          	mv	s1,a2
80404e04:	00050a93          	mv	s5,a0
80404e08:	00058a13          	mv	s4,a1
80404e0c:	00068913          	mv	s2,a3
80404e10:	40c989b3          	sub	s3,s3,a2
80404e14:	0380006f          	j	80404e4c <copy_string+0x7c>
80404e18:	00048513          	mv	a0,s1
80404e1c:	03d0d0ef          	jal	ra,80412658 <strnlen>
80404e20:	00050793          	mv	a5,a0
80404e24:	00048593          	mv	a1,s1
80404e28:	000a0513          	mv	a0,s4
80404e2c:	00040613          	mv	a2,s0
80404e30:	0687e663          	bltu	a5,s0,80404e9c <copy_string+0xcc>
80404e34:	0529f063          	bgeu	s3,s2,80404e74 <copy_string+0xa4>
80404e38:	1450d0ef          	jal	ra,8041277c <memcpy>
80404e3c:	008a0a33          	add	s4,s4,s0
80404e40:	008484b3          	add	s1,s1,s0
80404e44:	40890933          	sub	s2,s2,s0
80404e48:	000019b7          	lui	s3,0x1
80404e4c:	00000693          	li	a3,0
80404e50:	00048593          	mv	a1,s1
80404e54:	000a8513          	mv	a0,s5
80404e58:	00090413          	mv	s0,s2
80404e5c:	0129f463          	bgeu	s3,s2,80404e64 <copy_string+0x94>
80404e60:	00098413          	mv	s0,s3
80404e64:	00040613          	mv	a2,s0
80404e68:	dd5ff0ef          	jal	ra,80404c3c <user_mem_check>
80404e6c:	00040593          	mv	a1,s0
80404e70:	fa0514e3          	bnez	a0,80404e18 <copy_string+0x48>
80404e74:	00000513          	li	a0,0
80404e78:	01c12083          	lw	ra,28(sp)
80404e7c:	01812403          	lw	s0,24(sp)
80404e80:	01412483          	lw	s1,20(sp)
80404e84:	01012903          	lw	s2,16(sp)
80404e88:	00c12983          	lw	s3,12(sp)
80404e8c:	00812a03          	lw	s4,8(sp)
80404e90:	00412a83          	lw	s5,4(sp)
80404e94:	02010113          	addi	sp,sp,32
80404e98:	00008067          	ret
80404e9c:	00178613          	addi	a2,a5,1 # fffff001 <end+0x7fb62745>
80404ea0:	0dd0d0ef          	jal	ra,8041277c <memcpy>
80404ea4:	00100513          	li	a0,1
80404ea8:	fd1ff06f          	j	80404e78 <copy_string+0xa8>

80404eac <__down.constprop.0>:
80404eac:	fc010113          	addi	sp,sp,-64
80404eb0:	02112e23          	sw	ra,60(sp)
80404eb4:	02812c23          	sw	s0,56(sp)
80404eb8:	02912a23          	sw	s1,52(sp)
80404ebc:	100027f3          	csrr	a5,sstatus
80404ec0:	0027f793          	andi	a5,a5,2
80404ec4:	08079663          	bnez	a5,80404f50 <__down.constprop.0+0xa4>
80404ec8:	00052703          	lw	a4,0(a0)
80404ecc:	02e05263          	blez	a4,80404ef0 <__down.constprop.0+0x44>
80404ed0:	03c12083          	lw	ra,60(sp)
80404ed4:	03812403          	lw	s0,56(sp)
80404ed8:	fff70713          	addi	a4,a4,-1
80404edc:	00e52023          	sw	a4,0(a0)
80404ee0:	03412483          	lw	s1,52(sp)
80404ee4:	00078513          	mv	a0,a5
80404ee8:	04010113          	addi	sp,sp,64
80404eec:	00008067          	ret
80404ef0:	00450413          	addi	s0,a0,4
80404ef4:	01c10493          	addi	s1,sp,28
80404ef8:	10000613          	li	a2,256
80404efc:	00048593          	mv	a1,s1
80404f00:	00040513          	mv	a0,s0
80404f04:	3ac000ef          	jal	ra,804052b0 <wait_current_set>
80404f08:	2c5070ef          	jal	ra,8040c9cc <schedule>
80404f0c:	100027f3          	csrr	a5,sstatus
80404f10:	0027f793          	andi	a5,a5,2
80404f14:	0a079463          	bnez	a5,80404fbc <__down.constprop.0+0x110>
80404f18:	00048513          	mv	a0,s1
80404f1c:	29c000ef          	jal	ra,804051b8 <wait_in_queue>
80404f20:	08051663          	bnez	a0,80404fac <__down.constprop.0+0x100>
80404f24:	02012783          	lw	a5,32(sp)
80404f28:	03c12083          	lw	ra,60(sp)
80404f2c:	03812403          	lw	s0,56(sp)
80404f30:	f0078713          	addi	a4,a5,-256
80404f34:	00e03733          	snez	a4,a4
80404f38:	40e00733          	neg	a4,a4
80404f3c:	00e7f7b3          	and	a5,a5,a4
80404f40:	03412483          	lw	s1,52(sp)
80404f44:	00078513          	mv	a0,a5
80404f48:	04010113          	addi	sp,sp,64
80404f4c:	00008067          	ret
80404f50:	00a12623          	sw	a0,12(sp)
80404f54:	cc5fb0ef          	jal	ra,80400c18 <intr_disable>
80404f58:	00c12503          	lw	a0,12(sp)
80404f5c:	00052783          	lw	a5,0(a0)
80404f60:	02f05663          	blez	a5,80404f8c <__down.constprop.0+0xe0>
80404f64:	fff78793          	addi	a5,a5,-1
80404f68:	00f52023          	sw	a5,0(a0)
80404f6c:	ca5fb0ef          	jal	ra,80400c10 <intr_enable>
80404f70:	03c12083          	lw	ra,60(sp)
80404f74:	03812403          	lw	s0,56(sp)
80404f78:	00000793          	li	a5,0
80404f7c:	03412483          	lw	s1,52(sp)
80404f80:	00078513          	mv	a0,a5
80404f84:	04010113          	addi	sp,sp,64
80404f88:	00008067          	ret
80404f8c:	00450413          	addi	s0,a0,4
80404f90:	01c10493          	addi	s1,sp,28
80404f94:	10000613          	li	a2,256
80404f98:	00048593          	mv	a1,s1
80404f9c:	00040513          	mv	a0,s0
80404fa0:	310000ef          	jal	ra,804052b0 <wait_current_set>
80404fa4:	c6dfb0ef          	jal	ra,80400c10 <intr_enable>
80404fa8:	f61ff06f          	j	80404f08 <__down.constprop.0+0x5c>
80404fac:	00048593          	mv	a1,s1
80404fb0:	00040513          	mv	a0,s0
80404fb4:	1a4000ef          	jal	ra,80405158 <wait_queue_del>
80404fb8:	f6dff06f          	j	80404f24 <__down.constprop.0+0x78>
80404fbc:	c5dfb0ef          	jal	ra,80400c18 <intr_disable>
80404fc0:	00048513          	mv	a0,s1
80404fc4:	1f4000ef          	jal	ra,804051b8 <wait_in_queue>
80404fc8:	00051663          	bnez	a0,80404fd4 <__down.constprop.0+0x128>
80404fcc:	c45fb0ef          	jal	ra,80400c10 <intr_enable>
80404fd0:	f55ff06f          	j	80404f24 <__down.constprop.0+0x78>
80404fd4:	00048593          	mv	a1,s1
80404fd8:	00040513          	mv	a0,s0
80404fdc:	17c000ef          	jal	ra,80405158 <wait_queue_del>
80404fe0:	fedff06f          	j	80404fcc <__down.constprop.0+0x120>

80404fe4 <__up.constprop.1>:
80404fe4:	ff010113          	addi	sp,sp,-16
80404fe8:	00912223          	sw	s1,4(sp)
80404fec:	00112623          	sw	ra,12(sp)
80404ff0:	00812423          	sw	s0,8(sp)
80404ff4:	01212023          	sw	s2,0(sp)
80404ff8:	00050493          	mv	s1,a0
80404ffc:	100027f3          	csrr	a5,sstatus
80405000:	0027f793          	andi	a5,a5,2
80405004:	00000913          	li	s2,0
80405008:	06079e63          	bnez	a5,80405084 <__up.constprop.1+0xa0>
8040500c:	00448413          	addi	s0,s1,4
80405010:	00040513          	mv	a0,s0
80405014:	17c000ef          	jal	ra,80405190 <wait_queue_first>
80405018:	04050e63          	beqz	a0,80405074 <__up.constprop.1+0x90>
8040501c:	00052703          	lw	a4,0(a0)
80405020:	10000793          	li	a5,256
80405024:	0a872703          	lw	a4,168(a4)
80405028:	06f71463          	bne	a4,a5,80405090 <__up.constprop.1+0xac>
8040502c:	00050593          	mv	a1,a0
80405030:	00100693          	li	a3,1
80405034:	10000613          	li	a2,256
80405038:	00040513          	mv	a0,s0
8040503c:	190000ef          	jal	ra,804051cc <wakeup_wait>
80405040:	00091e63          	bnez	s2,8040505c <__up.constprop.1+0x78>
80405044:	00c12083          	lw	ra,12(sp)
80405048:	00812403          	lw	s0,8(sp)
8040504c:	00412483          	lw	s1,4(sp)
80405050:	00012903          	lw	s2,0(sp)
80405054:	01010113          	addi	sp,sp,16
80405058:	00008067          	ret
8040505c:	00812403          	lw	s0,8(sp)
80405060:	00c12083          	lw	ra,12(sp)
80405064:	00412483          	lw	s1,4(sp)
80405068:	00012903          	lw	s2,0(sp)
8040506c:	01010113          	addi	sp,sp,16
80405070:	ba1fb06f          	j	80400c10 <intr_enable>
80405074:	0004a783          	lw	a5,0(s1)
80405078:	00178793          	addi	a5,a5,1
8040507c:	00f4a023          	sw	a5,0(s1)
80405080:	fc1ff06f          	j	80405040 <__up.constprop.1+0x5c>
80405084:	b95fb0ef          	jal	ra,80400c18 <intr_disable>
80405088:	00100913          	li	s2,1
8040508c:	f81ff06f          	j	8040500c <__up.constprop.1+0x28>
80405090:	0000f697          	auipc	a3,0xf
80405094:	e1868693          	addi	a3,a3,-488 # 80413ea8 <default_pmm_manager+0x830>
80405098:	0000e617          	auipc	a2,0xe
8040509c:	aa460613          	addi	a2,a2,-1372 # 80412b3c <commands+0x1bc>
804050a0:	01a00593          	li	a1,26
804050a4:	0000f517          	auipc	a0,0xf
804050a8:	e2c50513          	addi	a0,a0,-468 # 80413ed0 <default_pmm_manager+0x858>
804050ac:	d78fb0ef          	jal	ra,80400624 <__panic>

804050b0 <sem_init>:
804050b0:	00b52023          	sw	a1,0(a0)
804050b4:	00450513          	addi	a0,a0,4
804050b8:	0940006f          	j	8040514c <wait_queue_init>

804050bc <up>:
804050bc:	f29ff06f          	j	80404fe4 <__up.constprop.1>

804050c0 <down>:
804050c0:	ff010113          	addi	sp,sp,-16
804050c4:	00112623          	sw	ra,12(sp)
804050c8:	de5ff0ef          	jal	ra,80404eac <__down.constprop.0>
804050cc:	00051863          	bnez	a0,804050dc <down+0x1c>
804050d0:	00c12083          	lw	ra,12(sp)
804050d4:	01010113          	addi	sp,sp,16
804050d8:	00008067          	ret
804050dc:	0000f697          	auipc	a3,0xf
804050e0:	e0468693          	addi	a3,a3,-508 # 80413ee0 <default_pmm_manager+0x868>
804050e4:	0000e617          	auipc	a2,0xe
804050e8:	a5860613          	addi	a2,a2,-1448 # 80412b3c <commands+0x1bc>
804050ec:	04100593          	li	a1,65
804050f0:	0000f517          	auipc	a0,0xf
804050f4:	de050513          	addi	a0,a0,-544 # 80413ed0 <default_pmm_manager+0x858>
804050f8:	d2cfb0ef          	jal	ra,80400624 <__panic>

804050fc <wait_queue_del.part.1>:
804050fc:	ff010113          	addi	sp,sp,-16
80405100:	0000f697          	auipc	a3,0xf
80405104:	dfc68693          	addi	a3,a3,-516 # 80413efc <default_pmm_manager+0x884>
80405108:	0000e617          	auipc	a2,0xe
8040510c:	a3460613          	addi	a2,a2,-1484 # 80412b3c <commands+0x1bc>
80405110:	01e00593          	li	a1,30
80405114:	0000f517          	auipc	a0,0xf
80405118:	e2850513          	addi	a0,a0,-472 # 80413f3c <default_pmm_manager+0x8c4>
8040511c:	00112623          	sw	ra,12(sp)
80405120:	d04fb0ef          	jal	ra,80400624 <__panic>

80405124 <wait_queue_next.part.2>:
80405124:	ff010113          	addi	sp,sp,-16
80405128:	0000f697          	auipc	a3,0xf
8040512c:	dd468693          	addi	a3,a3,-556 # 80413efc <default_pmm_manager+0x884>
80405130:	0000e617          	auipc	a2,0xe
80405134:	a0c60613          	addi	a2,a2,-1524 # 80412b3c <commands+0x1bc>
80405138:	02400593          	li	a1,36
8040513c:	0000f517          	auipc	a0,0xf
80405140:	e0050513          	addi	a0,a0,-512 # 80413f3c <default_pmm_manager+0x8c4>
80405144:	00112623          	sw	ra,12(sp)
80405148:	cdcfb0ef          	jal	ra,80400624 <__panic>

8040514c <wait_queue_init>:
8040514c:	00a52223          	sw	a0,4(a0)
80405150:	00a52023          	sw	a0,0(a0)
80405154:	00008067          	ret

80405158 <wait_queue_del>:
80405158:	0105a703          	lw	a4,16(a1)
8040515c:	00c58793          	addi	a5,a1,12
80405160:	02e78263          	beq	a5,a4,80405184 <wait_queue_del+0x2c>
80405164:	0085a683          	lw	a3,8(a1)
80405168:	00a69e63          	bne	a3,a0,80405184 <wait_queue_del+0x2c>
8040516c:	00c5a683          	lw	a3,12(a1)
80405170:	00e6a223          	sw	a4,4(a3)
80405174:	00d72023          	sw	a3,0(a4)
80405178:	00f5a823          	sw	a5,16(a1)
8040517c:	00f5a623          	sw	a5,12(a1)
80405180:	00008067          	ret
80405184:	ff010113          	addi	sp,sp,-16
80405188:	00112623          	sw	ra,12(sp)
8040518c:	f71ff0ef          	jal	ra,804050fc <wait_queue_del.part.1>

80405190 <wait_queue_first>:
80405190:	00452783          	lw	a5,4(a0)
80405194:	00f50663          	beq	a0,a5,804051a0 <wait_queue_first+0x10>
80405198:	ff478513          	addi	a0,a5,-12
8040519c:	00008067          	ret
804051a0:	00000513          	li	a0,0
804051a4:	00008067          	ret

804051a8 <wait_queue_empty>:
804051a8:	00452783          	lw	a5,4(a0)
804051ac:	40a78533          	sub	a0,a5,a0
804051b0:	00153513          	seqz	a0,a0
804051b4:	00008067          	ret

804051b8 <wait_in_queue>:
804051b8:	01052783          	lw	a5,16(a0)
804051bc:	00c50513          	addi	a0,a0,12
804051c0:	40a78533          	sub	a0,a5,a0
804051c4:	00a03533          	snez	a0,a0
804051c8:	00008067          	ret

804051cc <wakeup_wait>:
804051cc:	02068663          	beqz	a3,804051f8 <wakeup_wait+0x2c>
804051d0:	0105a703          	lw	a4,16(a1)
804051d4:	00c58793          	addi	a5,a1,12
804051d8:	02e78663          	beq	a5,a4,80405204 <wakeup_wait+0x38>
804051dc:	0085a683          	lw	a3,8(a1)
804051e0:	02d51263          	bne	a0,a3,80405204 <wakeup_wait+0x38>
804051e4:	00c5a683          	lw	a3,12(a1)
804051e8:	00e6a223          	sw	a4,4(a3)
804051ec:	00d72023          	sw	a3,0(a4)
804051f0:	00f5a823          	sw	a5,16(a1)
804051f4:	00f5a623          	sw	a5,12(a1)
804051f8:	0005a503          	lw	a0,0(a1)
804051fc:	00c5a223          	sw	a2,4(a1)
80405200:	6d00706f          	j	8040c8d0 <wakeup_proc>
80405204:	ff010113          	addi	sp,sp,-16
80405208:	00112623          	sw	ra,12(sp)
8040520c:	ef1ff0ef          	jal	ra,804050fc <wait_queue_del.part.1>

80405210 <wakeup_queue>:
80405210:	ff010113          	addi	sp,sp,-16
80405214:	00812423          	sw	s0,8(sp)
80405218:	00452403          	lw	s0,4(a0)
8040521c:	00112623          	sw	ra,12(sp)
80405220:	00912223          	sw	s1,4(sp)
80405224:	01212023          	sw	s2,0(sp)
80405228:	04850263          	beq	a0,s0,8040526c <wakeup_queue+0x5c>
8040522c:	ff440413          	addi	s0,s0,-12
80405230:	02040e63          	beqz	s0,8040526c <wakeup_queue+0x5c>
80405234:	00058913          	mv	s2,a1
80405238:	00050493          	mv	s1,a0
8040523c:	04061463          	bnez	a2,80405284 <wakeup_queue+0x74>
80405240:	00042503          	lw	a0,0(s0)
80405244:	01242223          	sw	s2,4(s0)
80405248:	688070ef          	jal	ra,8040c8d0 <wakeup_proc>
8040524c:	01042783          	lw	a5,16(s0)
80405250:	00c40713          	addi	a4,s0,12
80405254:	04e78c63          	beq	a5,a4,804052ac <wakeup_queue+0x9c>
80405258:	00842703          	lw	a4,8(s0)
8040525c:	04e49863          	bne	s1,a4,804052ac <wakeup_queue+0x9c>
80405260:	00f48663          	beq	s1,a5,8040526c <wakeup_queue+0x5c>
80405264:	ff478413          	addi	s0,a5,-12
80405268:	fc041ce3          	bnez	s0,80405240 <wakeup_queue+0x30>
8040526c:	00c12083          	lw	ra,12(sp)
80405270:	00812403          	lw	s0,8(sp)
80405274:	00412483          	lw	s1,4(sp)
80405278:	00012903          	lw	s2,0(sp)
8040527c:	01010113          	addi	sp,sp,16
80405280:	00008067          	ret
80405284:	00040593          	mv	a1,s0
80405288:	00100693          	li	a3,1
8040528c:	00090613          	mv	a2,s2
80405290:	00048513          	mv	a0,s1
80405294:	f39ff0ef          	jal	ra,804051cc <wakeup_wait>
80405298:	0044a403          	lw	s0,4(s1)
8040529c:	fc8488e3          	beq	s1,s0,8040526c <wakeup_queue+0x5c>
804052a0:	ff440413          	addi	s0,s0,-12
804052a4:	fe0410e3          	bnez	s0,80405284 <wakeup_queue+0x74>
804052a8:	fc5ff06f          	j	8040526c <wakeup_queue+0x5c>
804052ac:	e79ff0ef          	jal	ra,80405124 <wait_queue_next.part.2>

804052b0 <wait_current_set>:
804052b0:	00097797          	auipc	a5,0x97
804052b4:	4fc78793          	addi	a5,a5,1276 # 8049c7ac <current>
804052b8:	0007a783          	lw	a5,0(a5)
804052bc:	04078063          	beqz	a5,804052fc <wait_current_set+0x4c>
804052c0:	00c58713          	addi	a4,a1,12
804052c4:	800006b7          	lui	a3,0x80000
804052c8:	00e5a623          	sw	a4,12(a1)
804052cc:	00f5a023          	sw	a5,0(a1)
804052d0:	00d5a223          	sw	a3,4(a1)
804052d4:	00100693          	li	a3,1
804052d8:	00d7a023          	sw	a3,0(a5)
804052dc:	0ac7a423          	sw	a2,168(a5)
804052e0:	00052783          	lw	a5,0(a0)
804052e4:	00a5a423          	sw	a0,8(a1)
804052e8:	00e52023          	sw	a4,0(a0)
804052ec:	00e7a223          	sw	a4,4(a5)
804052f0:	00a5a823          	sw	a0,16(a1)
804052f4:	00f5a623          	sw	a5,12(a1)
804052f8:	00008067          	ret
804052fc:	ff010113          	addi	sp,sp,-16
80405300:	0000f697          	auipc	a3,0xf
80405304:	bec68693          	addi	a3,a3,-1044 # 80413eec <default_pmm_manager+0x874>
80405308:	0000e617          	auipc	a2,0xe
8040530c:	83460613          	addi	a2,a2,-1996 # 80412b3c <commands+0x1bc>
80405310:	07600593          	li	a1,118
80405314:	0000f517          	auipc	a0,0xf
80405318:	c2850513          	addi	a0,a0,-984 # 80413f3c <default_pmm_manager+0x8c4>
8040531c:	00112623          	sw	ra,12(sp)
80405320:	b04fb0ef          	jal	ra,80400624 <__panic>

80405324 <get_fd_array.part.4>:
80405324:	ff010113          	addi	sp,sp,-16
80405328:	0000f697          	auipc	a3,0xf
8040532c:	f7868693          	addi	a3,a3,-136 # 804142a0 <CSWTCH.69+0x344>
80405330:	0000e617          	auipc	a2,0xe
80405334:	80c60613          	addi	a2,a2,-2036 # 80412b3c <commands+0x1bc>
80405338:	01400593          	li	a1,20
8040533c:	0000f517          	auipc	a0,0xf
80405340:	f9050513          	addi	a0,a0,-112 # 804142cc <CSWTCH.69+0x370>
80405344:	00112623          	sw	ra,12(sp)
80405348:	adcfb0ef          	jal	ra,80400624 <__panic>

8040534c <fd_array_alloc>:
8040534c:	00097797          	auipc	a5,0x97
80405350:	46078793          	addi	a5,a5,1120 # 8049c7ac <current>
80405354:	0007a783          	lw	a5,0(a5)
80405358:	ff010113          	addi	sp,sp,-16
8040535c:	00112623          	sw	ra,12(sp)
80405360:	0dc7a683          	lw	a3,220(a5)
80405364:	0a068463          	beqz	a3,8040540c <fd_array_alloc+0xc0>
80405368:	0086a783          	lw	a5,8(a3)
8040536c:	0af05063          	blez	a5,8040540c <fd_array_alloc+0xc0>
80405370:	ffff7737          	lui	a4,0xffff7
80405374:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <end+0x7fb5a21d>
80405378:	0046a683          	lw	a3,4(a3)
8040537c:	04e50463          	beq	a0,a4,804053c4 <fd_array_alloc+0x78>
80405380:	09000793          	li	a5,144
80405384:	08a7e063          	bltu	a5,a0,80405404 <fd_array_alloc+0xb8>
80405388:	00351793          	slli	a5,a0,0x3
8040538c:	40a787b3          	sub	a5,a5,a0
80405390:	00279793          	slli	a5,a5,0x2
80405394:	00f687b3          	add	a5,a3,a5
80405398:	0007a703          	lw	a4,0(a5)
8040539c:	06071063          	bnez	a4,804053fc <fd_array_alloc+0xb0>
804053a0:	0187a503          	lw	a0,24(a5)
804053a4:	06051663          	bnez	a0,80405410 <fd_array_alloc+0xc4>
804053a8:	00100713          	li	a4,1
804053ac:	00e7a023          	sw	a4,0(a5)
804053b0:	0007aa23          	sw	zero,20(a5)
804053b4:	00f5a023          	sw	a5,0(a1)
804053b8:	00c12083          	lw	ra,12(sp)
804053bc:	01010113          	addi	sp,sp,16
804053c0:	00008067          	ret
804053c4:	0006a783          	lw	a5,0(a3)
804053c8:	02078663          	beqz	a5,804053f4 <fd_array_alloc+0xa8>
804053cc:	00001737          	lui	a4,0x1
804053d0:	fdc70713          	addi	a4,a4,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804053d4:	01c68793          	addi	a5,a3,28
804053d8:	00e686b3          	add	a3,a3,a4
804053dc:	0007a703          	lw	a4,0(a5)
804053e0:	fc0700e3          	beqz	a4,804053a0 <fd_array_alloc+0x54>
804053e4:	01c78793          	addi	a5,a5,28
804053e8:	fef69ae3          	bne	a3,a5,804053dc <fd_array_alloc+0x90>
804053ec:	fea00513          	li	a0,-22
804053f0:	fc9ff06f          	j	804053b8 <fd_array_alloc+0x6c>
804053f4:	00068793          	mv	a5,a3
804053f8:	fa9ff06f          	j	804053a0 <fd_array_alloc+0x54>
804053fc:	ff100513          	li	a0,-15
80405400:	fb9ff06f          	j	804053b8 <fd_array_alloc+0x6c>
80405404:	ffd00513          	li	a0,-3
80405408:	fb1ff06f          	j	804053b8 <fd_array_alloc+0x6c>
8040540c:	f19ff0ef          	jal	ra,80405324 <get_fd_array.part.4>
80405410:	0000f697          	auipc	a3,0xf
80405414:	b7468693          	addi	a3,a3,-1164 # 80413f84 <CSWTCH.69+0x28>
80405418:	0000d617          	auipc	a2,0xd
8040541c:	72460613          	addi	a2,a2,1828 # 80412b3c <commands+0x1bc>
80405420:	03b00593          	li	a1,59
80405424:	0000f517          	auipc	a0,0xf
80405428:	ea850513          	addi	a0,a0,-344 # 804142cc <CSWTCH.69+0x370>
8040542c:	9f8fb0ef          	jal	ra,80400624 <__panic>

80405430 <fd_array_free>:
80405430:	00052783          	lw	a5,0(a0)
80405434:	ff010113          	addi	sp,sp,-16
80405438:	00812423          	sw	s0,8(sp)
8040543c:	00112623          	sw	ra,12(sp)
80405440:	00100713          	li	a4,1
80405444:	00050413          	mv	s0,a0
80405448:	04e78863          	beq	a5,a4,80405498 <fd_array_free+0x68>
8040544c:	00300713          	li	a4,3
80405450:	06e79263          	bne	a5,a4,804054b4 <fd_array_free+0x84>
80405454:	01852783          	lw	a5,24(a0)
80405458:	02078263          	beqz	a5,8040547c <fd_array_free+0x4c>
8040545c:	0000f697          	auipc	a3,0xf
80405460:	b2868693          	addi	a3,a3,-1240 # 80413f84 <CSWTCH.69+0x28>
80405464:	0000d617          	auipc	a2,0xd
80405468:	6d860613          	addi	a2,a2,1752 # 80412b3c <commands+0x1bc>
8040546c:	04500593          	li	a1,69
80405470:	0000f517          	auipc	a0,0xf
80405474:	e5c50513          	addi	a0,a0,-420 # 804142cc <CSWTCH.69+0x370>
80405478:	9acfb0ef          	jal	ra,80400624 <__panic>
8040547c:	01442503          	lw	a0,20(s0)
80405480:	2b1080ef          	jal	ra,8040df30 <vfs_close>
80405484:	00c12083          	lw	ra,12(sp)
80405488:	00042023          	sw	zero,0(s0)
8040548c:	00812403          	lw	s0,8(sp)
80405490:	01010113          	addi	sp,sp,16
80405494:	00008067          	ret
80405498:	01852783          	lw	a5,24(a0)
8040549c:	fc0790e3          	bnez	a5,8040545c <fd_array_free+0x2c>
804054a0:	00042023          	sw	zero,0(s0)
804054a4:	00c12083          	lw	ra,12(sp)
804054a8:	00812403          	lw	s0,8(sp)
804054ac:	01010113          	addi	sp,sp,16
804054b0:	00008067          	ret
804054b4:	0000f697          	auipc	a3,0xf
804054b8:	b1c68693          	addi	a3,a3,-1252 # 80413fd0 <CSWTCH.69+0x74>
804054bc:	0000d617          	auipc	a2,0xd
804054c0:	68060613          	addi	a2,a2,1664 # 80412b3c <commands+0x1bc>
804054c4:	04400593          	li	a1,68
804054c8:	0000f517          	auipc	a0,0xf
804054cc:	e0450513          	addi	a0,a0,-508 # 804142cc <CSWTCH.69+0x370>
804054d0:	954fb0ef          	jal	ra,80400624 <__panic>

804054d4 <fd_array_release>:
804054d4:	00052783          	lw	a5,0(a0)
804054d8:	ff010113          	addi	sp,sp,-16
804054dc:	00112623          	sw	ra,12(sp)
804054e0:	00100693          	li	a3,1
804054e4:	ffe78793          	addi	a5,a5,-2
804054e8:	04f6e863          	bltu	a3,a5,80405538 <fd_array_release+0x64>
804054ec:	01852783          	lw	a5,24(a0)
804054f0:	02f05463          	blez	a5,80405518 <fd_array_release+0x44>
804054f4:	fff78793          	addi	a5,a5,-1
804054f8:	00f52c23          	sw	a5,24(a0)
804054fc:	00078863          	beqz	a5,8040550c <fd_array_release+0x38>
80405500:	00c12083          	lw	ra,12(sp)
80405504:	01010113          	addi	sp,sp,16
80405508:	00008067          	ret
8040550c:	00c12083          	lw	ra,12(sp)
80405510:	01010113          	addi	sp,sp,16
80405514:	f1dff06f          	j	80405430 <fd_array_free>
80405518:	0000f697          	auipc	a3,0xf
8040551c:	b5868693          	addi	a3,a3,-1192 # 80414070 <CSWTCH.69+0x114>
80405520:	0000d617          	auipc	a2,0xd
80405524:	61c60613          	addi	a2,a2,1564 # 80412b3c <commands+0x1bc>
80405528:	05600593          	li	a1,86
8040552c:	0000f517          	auipc	a0,0xf
80405530:	da050513          	addi	a0,a0,-608 # 804142cc <CSWTCH.69+0x370>
80405534:	8f0fb0ef          	jal	ra,80400624 <__panic>
80405538:	0000f697          	auipc	a3,0xf
8040553c:	b0068693          	addi	a3,a3,-1280 # 80414038 <CSWTCH.69+0xdc>
80405540:	0000d617          	auipc	a2,0xd
80405544:	5fc60613          	addi	a2,a2,1532 # 80412b3c <commands+0x1bc>
80405548:	05500593          	li	a1,85
8040554c:	0000f517          	auipc	a0,0xf
80405550:	d8050513          	addi	a0,a0,-640 # 804142cc <CSWTCH.69+0x370>
80405554:	8d0fb0ef          	jal	ra,80400624 <__panic>

80405558 <fd_array_open.part.9>:
80405558:	ff010113          	addi	sp,sp,-16
8040555c:	0000f697          	auipc	a3,0xf
80405560:	aac68693          	addi	a3,a3,-1364 # 80414008 <CSWTCH.69+0xac>
80405564:	0000d617          	auipc	a2,0xd
80405568:	5d860613          	addi	a2,a2,1496 # 80412b3c <commands+0x1bc>
8040556c:	05f00593          	li	a1,95
80405570:	0000f517          	auipc	a0,0xf
80405574:	d5c50513          	addi	a0,a0,-676 # 804142cc <CSWTCH.69+0x370>
80405578:	00112623          	sw	ra,12(sp)
8040557c:	8a8fb0ef          	jal	ra,80400624 <__panic>

80405580 <fd_array_init>:
80405580:	00000793          	li	a5,0
80405584:	09100713          	li	a4,145
80405588:	00f52623          	sw	a5,12(a0)
8040558c:	00052c23          	sw	zero,24(a0)
80405590:	00052023          	sw	zero,0(a0)
80405594:	00178793          	addi	a5,a5,1
80405598:	01c50513          	addi	a0,a0,28
8040559c:	fee796e3          	bne	a5,a4,80405588 <fd_array_init+0x8>
804055a0:	00008067          	ret

804055a4 <fd_array_close>:
804055a4:	00052683          	lw	a3,0(a0)
804055a8:	ff010113          	addi	sp,sp,-16
804055ac:	00112623          	sw	ra,12(sp)
804055b0:	00200793          	li	a5,2
804055b4:	04f69c63          	bne	a3,a5,8040560c <fd_array_close+0x68>
804055b8:	01852783          	lw	a5,24(a0)
804055bc:	02f05863          	blez	a5,804055ec <fd_array_close+0x48>
804055c0:	fff78793          	addi	a5,a5,-1
804055c4:	00300693          	li	a3,3
804055c8:	00d52023          	sw	a3,0(a0)
804055cc:	00f52c23          	sw	a5,24(a0)
804055d0:	00078863          	beqz	a5,804055e0 <fd_array_close+0x3c>
804055d4:	00c12083          	lw	ra,12(sp)
804055d8:	01010113          	addi	sp,sp,16
804055dc:	00008067          	ret
804055e0:	00c12083          	lw	ra,12(sp)
804055e4:	01010113          	addi	sp,sp,16
804055e8:	e49ff06f          	j	80405430 <fd_array_free>
804055ec:	0000f697          	auipc	a3,0xf
804055f0:	a8468693          	addi	a3,a3,-1404 # 80414070 <CSWTCH.69+0x114>
804055f4:	0000d617          	auipc	a2,0xd
804055f8:	54860613          	addi	a2,a2,1352 # 80412b3c <commands+0x1bc>
804055fc:	06800593          	li	a1,104
80405600:	0000f517          	auipc	a0,0xf
80405604:	ccc50513          	addi	a0,a0,-820 # 804142cc <CSWTCH.69+0x370>
80405608:	81cfb0ef          	jal	ra,80400624 <__panic>
8040560c:	0000f697          	auipc	a3,0xf
80405610:	95c68693          	addi	a3,a3,-1700 # 80413f68 <CSWTCH.69+0xc>
80405614:	0000d617          	auipc	a2,0xd
80405618:	52860613          	addi	a2,a2,1320 # 80412b3c <commands+0x1bc>
8040561c:	06700593          	li	a1,103
80405620:	0000f517          	auipc	a0,0xf
80405624:	cac50513          	addi	a0,a0,-852 # 804142cc <CSWTCH.69+0x370>
80405628:	ffdfa0ef          	jal	ra,80400624 <__panic>

8040562c <fd_array_dup>:
8040562c:	fe010113          	addi	sp,sp,-32
80405630:	01212823          	sw	s2,16(sp)
80405634:	00052903          	lw	s2,0(a0)
80405638:	00112e23          	sw	ra,28(sp)
8040563c:	00812c23          	sw	s0,24(sp)
80405640:	00912a23          	sw	s1,20(sp)
80405644:	01312623          	sw	s3,12(sp)
80405648:	00100793          	li	a5,1
8040564c:	06f91e63          	bne	s2,a5,804056c8 <fd_array_dup+0x9c>
80405650:	0005a983          	lw	s3,0(a1)
80405654:	00200793          	li	a5,2
80405658:	06f99863          	bne	s3,a5,804056c8 <fd_array_dup+0x9c>
8040565c:	0145a483          	lw	s1,20(a1)
80405660:	0085a783          	lw	a5,8(a1)
80405664:	0105a683          	lw	a3,16(a1)
80405668:	0045a703          	lw	a4,4(a1)
8040566c:	00050413          	mv	s0,a0
80405670:	00f52423          	sw	a5,8(a0)
80405674:	00d52823          	sw	a3,16(a0)
80405678:	00e52223          	sw	a4,4(a0)
8040567c:	00048513          	mv	a0,s1
80405680:	49d070ef          	jal	ra,8040d31c <inode_ref_inc>
80405684:	00048513          	mv	a0,s1
80405688:	4a9070ef          	jal	ra,8040d330 <inode_open_inc>
8040568c:	00042783          	lw	a5,0(s0)
80405690:	00942a23          	sw	s1,20(s0)
80405694:	05279a63          	bne	a5,s2,804056e8 <fd_array_dup+0xbc>
80405698:	04048863          	beqz	s1,804056e8 <fd_array_dup+0xbc>
8040569c:	01842783          	lw	a5,24(s0)
804056a0:	01342023          	sw	s3,0(s0)
804056a4:	01c12083          	lw	ra,28(sp)
804056a8:	00178793          	addi	a5,a5,1
804056ac:	00f42c23          	sw	a5,24(s0)
804056b0:	01812403          	lw	s0,24(sp)
804056b4:	01412483          	lw	s1,20(sp)
804056b8:	01012903          	lw	s2,16(sp)
804056bc:	00c12983          	lw	s3,12(sp)
804056c0:	02010113          	addi	sp,sp,32
804056c4:	00008067          	ret
804056c8:	0000f697          	auipc	a3,0xf
804056cc:	8d468693          	addi	a3,a3,-1836 # 80413f9c <CSWTCH.69+0x40>
804056d0:	0000d617          	auipc	a2,0xd
804056d4:	46c60613          	addi	a2,a2,1132 # 80412b3c <commands+0x1bc>
804056d8:	07300593          	li	a1,115
804056dc:	0000f517          	auipc	a0,0xf
804056e0:	bf050513          	addi	a0,a0,-1040 # 804142cc <CSWTCH.69+0x370>
804056e4:	f41fa0ef          	jal	ra,80400624 <__panic>
804056e8:	e71ff0ef          	jal	ra,80405558 <fd_array_open.part.9>

804056ec <file_testfd>:
804056ec:	09000793          	li	a5,144
804056f0:	06a7e463          	bltu	a5,a0,80405758 <file_testfd+0x6c>
804056f4:	00097797          	auipc	a5,0x97
804056f8:	0b878793          	addi	a5,a5,184 # 8049c7ac <current>
804056fc:	0007a783          	lw	a5,0(a5)
80405700:	0dc7a703          	lw	a4,220(a5)
80405704:	04070e63          	beqz	a4,80405760 <file_testfd+0x74>
80405708:	00872783          	lw	a5,8(a4)
8040570c:	04f05a63          	blez	a5,80405760 <file_testfd+0x74>
80405710:	00472703          	lw	a4,4(a4)
80405714:	00351793          	slli	a5,a0,0x3
80405718:	40a787b3          	sub	a5,a5,a0
8040571c:	00279793          	slli	a5,a5,0x2
80405720:	00f707b3          	add	a5,a4,a5
80405724:	0007a683          	lw	a3,0(a5)
80405728:	00200713          	li	a4,2
8040572c:	02e69663          	bne	a3,a4,80405758 <file_testfd+0x6c>
80405730:	00c7a703          	lw	a4,12(a5)
80405734:	02e51263          	bne	a0,a4,80405758 <file_testfd+0x6c>
80405738:	00058663          	beqz	a1,80405744 <file_testfd+0x58>
8040573c:	0047a503          	lw	a0,4(a5)
80405740:	00050e63          	beqz	a0,8040575c <file_testfd+0x70>
80405744:	00100513          	li	a0,1
80405748:	00060a63          	beqz	a2,8040575c <file_testfd+0x70>
8040574c:	0087a503          	lw	a0,8(a5)
80405750:	00a03533          	snez	a0,a0
80405754:	00008067          	ret
80405758:	00000513          	li	a0,0
8040575c:	00008067          	ret
80405760:	ff010113          	addi	sp,sp,-16
80405764:	00112623          	sw	ra,12(sp)
80405768:	bbdff0ef          	jal	ra,80405324 <get_fd_array.part.4>

8040576c <file_open>:
8040576c:	fc010113          	addi	sp,sp,-64
80405770:	02112e23          	sw	ra,60(sp)
80405774:	02812c23          	sw	s0,56(sp)
80405778:	02912a23          	sw	s1,52(sp)
8040577c:	03212823          	sw	s2,48(sp)
80405780:	03312623          	sw	s3,44(sp)
80405784:	03412423          	sw	s4,40(sp)
80405788:	0035f793          	andi	a5,a1,3
8040578c:	00300713          	li	a4,3
80405790:	12e78a63          	beq	a5,a4,804058c4 <file_open+0x158>
80405794:	00279793          	slli	a5,a5,0x2
80405798:	0000e717          	auipc	a4,0xe
8040579c:	7c470713          	addi	a4,a4,1988 # 80413f5c <CSWTCH.69>
804057a0:	00050913          	mv	s2,a0
804057a4:	0000e697          	auipc	a3,0xe
804057a8:	7ac68693          	addi	a3,a3,1964 # 80413f50 <CSWTCH.68>
804057ac:	ffff7537          	lui	a0,0xffff7
804057b0:	00f686b3          	add	a3,a3,a5
804057b4:	00058493          	mv	s1,a1
804057b8:	00f707b3          	add	a5,a4,a5
804057bc:	00810593          	addi	a1,sp,8
804057c0:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <end+0x7fb5a21d>
804057c4:	0006aa03          	lw	s4,0(a3)
804057c8:	0007a983          	lw	s3,0(a5)
804057cc:	b81ff0ef          	jal	ra,8040534c <fd_array_alloc>
804057d0:	00050413          	mv	s0,a0
804057d4:	02050463          	beqz	a0,804057fc <file_open+0x90>
804057d8:	00040513          	mv	a0,s0
804057dc:	03c12083          	lw	ra,60(sp)
804057e0:	03812403          	lw	s0,56(sp)
804057e4:	03412483          	lw	s1,52(sp)
804057e8:	03012903          	lw	s2,48(sp)
804057ec:	02c12983          	lw	s3,44(sp)
804057f0:	02812a03          	lw	s4,40(sp)
804057f4:	04010113          	addi	sp,sp,64
804057f8:	00008067          	ret
804057fc:	00c10613          	addi	a2,sp,12
80405800:	00048593          	mv	a1,s1
80405804:	00090513          	mv	a0,s2
80405808:	4d8080ef          	jal	ra,8040dce0 <vfs_open>
8040580c:	00050413          	mv	s0,a0
80405810:	0a051463          	bnez	a0,804058b8 <file_open+0x14c>
80405814:	00812783          	lw	a5,8(sp)
80405818:	0204f593          	andi	a1,s1,32
8040581c:	00c12403          	lw	s0,12(sp)
80405820:	0007a823          	sw	zero,16(a5)
80405824:	04058a63          	beqz	a1,80405878 <file_open+0x10c>
80405828:	0a040463          	beqz	s0,804058d0 <file_open+0x164>
8040582c:	03c42783          	lw	a5,60(s0)
80405830:	0a078063          	beqz	a5,804058d0 <file_open+0x164>
80405834:	0147a783          	lw	a5,20(a5)
80405838:	08078c63          	beqz	a5,804058d0 <file_open+0x164>
8040583c:	00040513          	mv	a0,s0
80405840:	0000f597          	auipc	a1,0xf
80405844:	95058593          	addi	a1,a1,-1712 # 80414190 <CSWTCH.69+0x234>
80405848:	2fd070ef          	jal	ra,8040d344 <inode_check>
8040584c:	03c42783          	lw	a5,60(s0)
80405850:	00c12503          	lw	a0,12(sp)
80405854:	01010593          	addi	a1,sp,16
80405858:	0147a783          	lw	a5,20(a5)
8040585c:	000780e7          	jalr	a5
80405860:	00050413          	mv	s0,a0
80405864:	04051663          	bnez	a0,804058b0 <file_open+0x144>
80405868:	00812783          	lw	a5,8(sp)
8040586c:	01c12703          	lw	a4,28(sp)
80405870:	00c12403          	lw	s0,12(sp)
80405874:	00e7a823          	sw	a4,16(a5)
80405878:	0007a683          	lw	a3,0(a5)
8040587c:	0087aa23          	sw	s0,20(a5)
80405880:	0147a223          	sw	s4,4(a5)
80405884:	0137a423          	sw	s3,8(a5)
80405888:	00100713          	li	a4,1
8040588c:	04e69063          	bne	a3,a4,804058cc <file_open+0x160>
80405890:	02040e63          	beqz	s0,804058cc <file_open+0x160>
80405894:	0187a703          	lw	a4,24(a5)
80405898:	00200693          	li	a3,2
8040589c:	00d7a023          	sw	a3,0(a5)
804058a0:	00170713          	addi	a4,a4,1
804058a4:	00e7ac23          	sw	a4,24(a5)
804058a8:	00c7a403          	lw	s0,12(a5)
804058ac:	f2dff06f          	j	804057d8 <file_open+0x6c>
804058b0:	00c12503          	lw	a0,12(sp)
804058b4:	67c080ef          	jal	ra,8040df30 <vfs_close>
804058b8:	00812503          	lw	a0,8(sp)
804058bc:	b75ff0ef          	jal	ra,80405430 <fd_array_free>
804058c0:	f19ff06f          	j	804057d8 <file_open+0x6c>
804058c4:	ffd00413          	li	s0,-3
804058c8:	f11ff06f          	j	804057d8 <file_open+0x6c>
804058cc:	c8dff0ef          	jal	ra,80405558 <fd_array_open.part.9>
804058d0:	0000f697          	auipc	a3,0xf
804058d4:	87068693          	addi	a3,a3,-1936 # 80414140 <CSWTCH.69+0x1e4>
804058d8:	0000d617          	auipc	a2,0xd
804058dc:	26460613          	addi	a2,a2,612 # 80412b3c <commands+0x1bc>
804058e0:	0b800593          	li	a1,184
804058e4:	0000f517          	auipc	a0,0xf
804058e8:	9e850513          	addi	a0,a0,-1560 # 804142cc <CSWTCH.69+0x370>
804058ec:	d39fa0ef          	jal	ra,80400624 <__panic>

804058f0 <file_close>:
804058f0:	09000793          	li	a5,144
804058f4:	06a7ec63          	bltu	a5,a0,8040596c <file_close+0x7c>
804058f8:	00097797          	auipc	a5,0x97
804058fc:	eb478793          	addi	a5,a5,-332 # 8049c7ac <current>
80405900:	0007a783          	lw	a5,0(a5)
80405904:	ff010113          	addi	sp,sp,-16
80405908:	00112623          	sw	ra,12(sp)
8040590c:	0dc7a683          	lw	a3,220(a5)
80405910:	00050713          	mv	a4,a0
80405914:	06068063          	beqz	a3,80405974 <file_close+0x84>
80405918:	0086a783          	lw	a5,8(a3)
8040591c:	04f05c63          	blez	a5,80405974 <file_close+0x84>
80405920:	00351793          	slli	a5,a0,0x3
80405924:	0046a503          	lw	a0,4(a3)
80405928:	40e787b3          	sub	a5,a5,a4
8040592c:	00279793          	slli	a5,a5,0x2
80405930:	00f50533          	add	a0,a0,a5
80405934:	00052683          	lw	a3,0(a0)
80405938:	00200793          	li	a5,2
8040593c:	02f69063          	bne	a3,a5,8040595c <file_close+0x6c>
80405940:	00c52783          	lw	a5,12(a0)
80405944:	00f71c63          	bne	a4,a5,8040595c <file_close+0x6c>
80405948:	c5dff0ef          	jal	ra,804055a4 <fd_array_close>
8040594c:	00c12083          	lw	ra,12(sp)
80405950:	00000513          	li	a0,0
80405954:	01010113          	addi	sp,sp,16
80405958:	00008067          	ret
8040595c:	00c12083          	lw	ra,12(sp)
80405960:	ffd00513          	li	a0,-3
80405964:	01010113          	addi	sp,sp,16
80405968:	00008067          	ret
8040596c:	ffd00513          	li	a0,-3
80405970:	00008067          	ret
80405974:	9b1ff0ef          	jal	ra,80405324 <get_fd_array.part.4>

80405978 <file_read>:
80405978:	fd010113          	addi	sp,sp,-48
8040597c:	02112623          	sw	ra,44(sp)
80405980:	02812423          	sw	s0,40(sp)
80405984:	02912223          	sw	s1,36(sp)
80405988:	03212023          	sw	s2,32(sp)
8040598c:	01312e23          	sw	s3,28(sp)
80405990:	01412c23          	sw	s4,24(sp)
80405994:	0006a023          	sw	zero,0(a3)
80405998:	09000793          	li	a5,144
8040599c:	10a7e263          	bltu	a5,a0,80405aa0 <file_read+0x128>
804059a0:	00097797          	auipc	a5,0x97
804059a4:	e0c78793          	addi	a5,a5,-500 # 8049c7ac <current>
804059a8:	0007a783          	lw	a5,0(a5)
804059ac:	00068913          	mv	s2,a3
804059b0:	0dc7a703          	lw	a4,220(a5)
804059b4:	0e070a63          	beqz	a4,80405aa8 <file_read+0x130>
804059b8:	00872783          	lw	a5,8(a4)
804059bc:	0ef05663          	blez	a5,80405aa8 <file_read+0x130>
804059c0:	00351793          	slli	a5,a0,0x3
804059c4:	00472403          	lw	s0,4(a4)
804059c8:	40a787b3          	sub	a5,a5,a0
804059cc:	00279793          	slli	a5,a5,0x2
804059d0:	00f40433          	add	s0,s0,a5
804059d4:	00042983          	lw	s3,0(s0)
804059d8:	00200793          	li	a5,2
804059dc:	0cf99263          	bne	s3,a5,80405aa0 <file_read+0x128>
804059e0:	00c42783          	lw	a5,12(s0)
804059e4:	0af51e63          	bne	a0,a5,80405aa0 <file_read+0x128>
804059e8:	00442783          	lw	a5,4(s0)
804059ec:	0a078a63          	beqz	a5,80405aa0 <file_read+0x128>
804059f0:	01842783          	lw	a5,24(s0)
804059f4:	01042683          	lw	a3,16(s0)
804059f8:	00010513          	mv	a0,sp
804059fc:	00178793          	addi	a5,a5,1
80405a00:	00f42c23          	sw	a5,24(s0)
80405a04:	311000ef          	jal	ra,80406514 <iobuf_init>
80405a08:	01442483          	lw	s1,20(s0)
80405a0c:	00050a13          	mv	s4,a0
80405a10:	08048e63          	beqz	s1,80405aac <file_read+0x134>
80405a14:	03c4a783          	lw	a5,60(s1)
80405a18:	08078a63          	beqz	a5,80405aac <file_read+0x134>
80405a1c:	00c7a783          	lw	a5,12(a5)
80405a20:	08078663          	beqz	a5,80405aac <file_read+0x134>
80405a24:	00048513          	mv	a0,s1
80405a28:	0000e597          	auipc	a1,0xe
80405a2c:	7c058593          	addi	a1,a1,1984 # 804141e8 <CSWTCH.69+0x28c>
80405a30:	115070ef          	jal	ra,8040d344 <inode_check>
80405a34:	03c4a783          	lw	a5,60(s1)
80405a38:	01442503          	lw	a0,20(s0)
80405a3c:	000a0593          	mv	a1,s4
80405a40:	00c7a783          	lw	a5,12(a5)
80405a44:	000780e7          	jalr	a5
80405a48:	008a2783          	lw	a5,8(s4) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80405a4c:	00ca2683          	lw	a3,12(s4)
80405a50:	00042703          	lw	a4,0(s0)
80405a54:	00050493          	mv	s1,a0
80405a58:	40d787b3          	sub	a5,a5,a3
80405a5c:	03370a63          	beq	a4,s3,80405a90 <file_read+0x118>
80405a60:	00f92023          	sw	a5,0(s2)
80405a64:	00040513          	mv	a0,s0
80405a68:	a6dff0ef          	jal	ra,804054d4 <fd_array_release>
80405a6c:	02c12083          	lw	ra,44(sp)
80405a70:	02812403          	lw	s0,40(sp)
80405a74:	00048513          	mv	a0,s1
80405a78:	02012903          	lw	s2,32(sp)
80405a7c:	02412483          	lw	s1,36(sp)
80405a80:	01c12983          	lw	s3,28(sp)
80405a84:	01812a03          	lw	s4,24(sp)
80405a88:	03010113          	addi	sp,sp,48
80405a8c:	00008067          	ret
80405a90:	01042703          	lw	a4,16(s0)
80405a94:	00f70733          	add	a4,a4,a5
80405a98:	00e42823          	sw	a4,16(s0)
80405a9c:	fc5ff06f          	j	80405a60 <file_read+0xe8>
80405aa0:	ffd00493          	li	s1,-3
80405aa4:	fc9ff06f          	j	80405a6c <file_read+0xf4>
80405aa8:	87dff0ef          	jal	ra,80405324 <get_fd_array.part.4>
80405aac:	0000e697          	auipc	a3,0xe
80405ab0:	6ec68693          	addi	a3,a3,1772 # 80414198 <CSWTCH.69+0x23c>
80405ab4:	0000d617          	auipc	a2,0xd
80405ab8:	08860613          	addi	a2,a2,136 # 80412b3c <commands+0x1bc>
80405abc:	0e200593          	li	a1,226
80405ac0:	0000f517          	auipc	a0,0xf
80405ac4:	80c50513          	addi	a0,a0,-2036 # 804142cc <CSWTCH.69+0x370>
80405ac8:	b5dfa0ef          	jal	ra,80400624 <__panic>

80405acc <file_write>:
80405acc:	fd010113          	addi	sp,sp,-48
80405ad0:	02112623          	sw	ra,44(sp)
80405ad4:	02812423          	sw	s0,40(sp)
80405ad8:	02912223          	sw	s1,36(sp)
80405adc:	03212023          	sw	s2,32(sp)
80405ae0:	01312e23          	sw	s3,28(sp)
80405ae4:	01412c23          	sw	s4,24(sp)
80405ae8:	0006a023          	sw	zero,0(a3)
80405aec:	09000793          	li	a5,144
80405af0:	10a7e263          	bltu	a5,a0,80405bf4 <file_write+0x128>
80405af4:	00097797          	auipc	a5,0x97
80405af8:	cb878793          	addi	a5,a5,-840 # 8049c7ac <current>
80405afc:	0007a783          	lw	a5,0(a5)
80405b00:	00068913          	mv	s2,a3
80405b04:	0dc7a703          	lw	a4,220(a5)
80405b08:	0e070a63          	beqz	a4,80405bfc <file_write+0x130>
80405b0c:	00872783          	lw	a5,8(a4)
80405b10:	0ef05663          	blez	a5,80405bfc <file_write+0x130>
80405b14:	00351793          	slli	a5,a0,0x3
80405b18:	00472403          	lw	s0,4(a4)
80405b1c:	40a787b3          	sub	a5,a5,a0
80405b20:	00279793          	slli	a5,a5,0x2
80405b24:	00f40433          	add	s0,s0,a5
80405b28:	00042983          	lw	s3,0(s0)
80405b2c:	00200793          	li	a5,2
80405b30:	0cf99263          	bne	s3,a5,80405bf4 <file_write+0x128>
80405b34:	00c42783          	lw	a5,12(s0)
80405b38:	0af51e63          	bne	a0,a5,80405bf4 <file_write+0x128>
80405b3c:	00842783          	lw	a5,8(s0)
80405b40:	0a078a63          	beqz	a5,80405bf4 <file_write+0x128>
80405b44:	01842783          	lw	a5,24(s0)
80405b48:	01042683          	lw	a3,16(s0)
80405b4c:	00010513          	mv	a0,sp
80405b50:	00178793          	addi	a5,a5,1
80405b54:	00f42c23          	sw	a5,24(s0)
80405b58:	1bd000ef          	jal	ra,80406514 <iobuf_init>
80405b5c:	01442483          	lw	s1,20(s0)
80405b60:	00050a13          	mv	s4,a0
80405b64:	08048e63          	beqz	s1,80405c00 <file_write+0x134>
80405b68:	03c4a783          	lw	a5,60(s1)
80405b6c:	08078a63          	beqz	a5,80405c00 <file_write+0x134>
80405b70:	0107a783          	lw	a5,16(a5)
80405b74:	08078663          	beqz	a5,80405c00 <file_write+0x134>
80405b78:	00048513          	mv	a0,s1
80405b7c:	0000e597          	auipc	a1,0xe
80405b80:	71c58593          	addi	a1,a1,1820 # 80414298 <CSWTCH.69+0x33c>
80405b84:	7c0070ef          	jal	ra,8040d344 <inode_check>
80405b88:	03c4a783          	lw	a5,60(s1)
80405b8c:	01442503          	lw	a0,20(s0)
80405b90:	000a0593          	mv	a1,s4
80405b94:	0107a783          	lw	a5,16(a5)
80405b98:	000780e7          	jalr	a5
80405b9c:	008a2783          	lw	a5,8(s4)
80405ba0:	00ca2683          	lw	a3,12(s4)
80405ba4:	00042703          	lw	a4,0(s0)
80405ba8:	00050493          	mv	s1,a0
80405bac:	40d787b3          	sub	a5,a5,a3
80405bb0:	03370a63          	beq	a4,s3,80405be4 <file_write+0x118>
80405bb4:	00f92023          	sw	a5,0(s2)
80405bb8:	00040513          	mv	a0,s0
80405bbc:	919ff0ef          	jal	ra,804054d4 <fd_array_release>
80405bc0:	02c12083          	lw	ra,44(sp)
80405bc4:	02812403          	lw	s0,40(sp)
80405bc8:	00048513          	mv	a0,s1
80405bcc:	02012903          	lw	s2,32(sp)
80405bd0:	02412483          	lw	s1,36(sp)
80405bd4:	01c12983          	lw	s3,28(sp)
80405bd8:	01812a03          	lw	s4,24(sp)
80405bdc:	03010113          	addi	sp,sp,48
80405be0:	00008067          	ret
80405be4:	01042703          	lw	a4,16(s0)
80405be8:	00f70733          	add	a4,a4,a5
80405bec:	00e42823          	sw	a4,16(s0)
80405bf0:	fc5ff06f          	j	80405bb4 <file_write+0xe8>
80405bf4:	ffd00493          	li	s1,-3
80405bf8:	fc9ff06f          	j	80405bc0 <file_write+0xf4>
80405bfc:	f28ff0ef          	jal	ra,80405324 <get_fd_array.part.4>
80405c00:	0000e697          	auipc	a3,0xe
80405c04:	64868693          	addi	a3,a3,1608 # 80414248 <CSWTCH.69+0x2ec>
80405c08:	0000d617          	auipc	a2,0xd
80405c0c:	f3460613          	addi	a2,a2,-204 # 80412b3c <commands+0x1bc>
80405c10:	0fc00593          	li	a1,252
80405c14:	0000e517          	auipc	a0,0xe
80405c18:	6b850513          	addi	a0,a0,1720 # 804142cc <CSWTCH.69+0x370>
80405c1c:	a09fa0ef          	jal	ra,80400624 <__panic>

80405c20 <file_seek>:
80405c20:	fe010113          	addi	sp,sp,-32
80405c24:	00112e23          	sw	ra,28(sp)
80405c28:	00812c23          	sw	s0,24(sp)
80405c2c:	00912a23          	sw	s1,20(sp)
80405c30:	01212823          	sw	s2,16(sp)
80405c34:	09000793          	li	a5,144
80405c38:	12a7ea63          	bltu	a5,a0,80405d6c <file_seek+0x14c>
80405c3c:	00097797          	auipc	a5,0x97
80405c40:	b7078793          	addi	a5,a5,-1168 # 8049c7ac <current>
80405c44:	0007a783          	lw	a5,0(a5)
80405c48:	0dc7a703          	lw	a4,220(a5)
80405c4c:	14070063          	beqz	a4,80405d8c <file_seek+0x16c>
80405c50:	00872783          	lw	a5,8(a4)
80405c54:	12f05c63          	blez	a5,80405d8c <file_seek+0x16c>
80405c58:	00472403          	lw	s0,4(a4)
80405c5c:	00351793          	slli	a5,a0,0x3
80405c60:	40a787b3          	sub	a5,a5,a0
80405c64:	00279793          	slli	a5,a5,0x2
80405c68:	00f40433          	add	s0,s0,a5
80405c6c:	00042703          	lw	a4,0(s0)
80405c70:	00200793          	li	a5,2
80405c74:	0ef71c63          	bne	a4,a5,80405d6c <file_seek+0x14c>
80405c78:	00c42783          	lw	a5,12(s0)
80405c7c:	0ef51863          	bne	a0,a5,80405d6c <file_seek+0x14c>
80405c80:	01842783          	lw	a5,24(s0)
80405c84:	00100693          	li	a3,1
80405c88:	00058913          	mv	s2,a1
80405c8c:	00178793          	addi	a5,a5,1
80405c90:	00f42c23          	sw	a5,24(s0)
80405c94:	0cd60663          	beq	a2,a3,80405d60 <file_seek+0x140>
80405c98:	02e60863          	beq	a2,a4,80405cc8 <file_seek+0xa8>
80405c9c:	ffd00493          	li	s1,-3
80405ca0:	06060a63          	beqz	a2,80405d14 <file_seek+0xf4>
80405ca4:	00040513          	mv	a0,s0
80405ca8:	82dff0ef          	jal	ra,804054d4 <fd_array_release>
80405cac:	01c12083          	lw	ra,28(sp)
80405cb0:	01812403          	lw	s0,24(sp)
80405cb4:	00048513          	mv	a0,s1
80405cb8:	01012903          	lw	s2,16(sp)
80405cbc:	01412483          	lw	s1,20(sp)
80405cc0:	02010113          	addi	sp,sp,32
80405cc4:	00008067          	ret
80405cc8:	01442483          	lw	s1,20(s0)
80405ccc:	0e048263          	beqz	s1,80405db0 <file_seek+0x190>
80405cd0:	03c4a783          	lw	a5,60(s1)
80405cd4:	0c078e63          	beqz	a5,80405db0 <file_seek+0x190>
80405cd8:	0147a783          	lw	a5,20(a5)
80405cdc:	0c078a63          	beqz	a5,80405db0 <file_seek+0x190>
80405ce0:	00048513          	mv	a0,s1
80405ce4:	0000e597          	auipc	a1,0xe
80405ce8:	4ac58593          	addi	a1,a1,1196 # 80414190 <CSWTCH.69+0x234>
80405cec:	658070ef          	jal	ra,8040d344 <inode_check>
80405cf0:	03c4a783          	lw	a5,60(s1)
80405cf4:	01442503          	lw	a0,20(s0)
80405cf8:	00010593          	mv	a1,sp
80405cfc:	0147a783          	lw	a5,20(a5)
80405d00:	000780e7          	jalr	a5
80405d04:	00050493          	mv	s1,a0
80405d08:	f8051ee3          	bnez	a0,80405ca4 <file_seek+0x84>
80405d0c:	00c12783          	lw	a5,12(sp)
80405d10:	00f90933          	add	s2,s2,a5
80405d14:	01442483          	lw	s1,20(s0)
80405d18:	06048c63          	beqz	s1,80405d90 <file_seek+0x170>
80405d1c:	03c4a783          	lw	a5,60(s1)
80405d20:	06078863          	beqz	a5,80405d90 <file_seek+0x170>
80405d24:	02c7a783          	lw	a5,44(a5)
80405d28:	06078463          	beqz	a5,80405d90 <file_seek+0x170>
80405d2c:	00048513          	mv	a0,s1
80405d30:	0000e597          	auipc	a1,0xe
80405d34:	51058593          	addi	a1,a1,1296 # 80414240 <CSWTCH.69+0x2e4>
80405d38:	60c070ef          	jal	ra,8040d344 <inode_check>
80405d3c:	03c4a783          	lw	a5,60(s1)
80405d40:	01442503          	lw	a0,20(s0)
80405d44:	00090593          	mv	a1,s2
80405d48:	02c7a783          	lw	a5,44(a5)
80405d4c:	000780e7          	jalr	a5
80405d50:	00050493          	mv	s1,a0
80405d54:	f40518e3          	bnez	a0,80405ca4 <file_seek+0x84>
80405d58:	01242823          	sw	s2,16(s0)
80405d5c:	f49ff06f          	j	80405ca4 <file_seek+0x84>
80405d60:	01042783          	lw	a5,16(s0)
80405d64:	00f58933          	add	s2,a1,a5
80405d68:	fadff06f          	j	80405d14 <file_seek+0xf4>
80405d6c:	01c12083          	lw	ra,28(sp)
80405d70:	01812403          	lw	s0,24(sp)
80405d74:	ffd00493          	li	s1,-3
80405d78:	00048513          	mv	a0,s1
80405d7c:	01012903          	lw	s2,16(sp)
80405d80:	01412483          	lw	s1,20(sp)
80405d84:	02010113          	addi	sp,sp,32
80405d88:	00008067          	ret
80405d8c:	d98ff0ef          	jal	ra,80405324 <get_fd_array.part.4>
80405d90:	0000e697          	auipc	a3,0xe
80405d94:	46068693          	addi	a3,a3,1120 # 804141f0 <CSWTCH.69+0x294>
80405d98:	0000d617          	auipc	a2,0xd
80405d9c:	da460613          	addi	a2,a2,-604 # 80412b3c <commands+0x1bc>
80405da0:	11e00593          	li	a1,286
80405da4:	0000e517          	auipc	a0,0xe
80405da8:	52850513          	addi	a0,a0,1320 # 804142cc <CSWTCH.69+0x370>
80405dac:	879fa0ef          	jal	ra,80400624 <__panic>
80405db0:	0000e697          	auipc	a3,0xe
80405db4:	39068693          	addi	a3,a3,912 # 80414140 <CSWTCH.69+0x1e4>
80405db8:	0000d617          	auipc	a2,0xd
80405dbc:	d8460613          	addi	a2,a2,-636 # 80412b3c <commands+0x1bc>
80405dc0:	11600593          	li	a1,278
80405dc4:	0000e517          	auipc	a0,0xe
80405dc8:	50850513          	addi	a0,a0,1288 # 804142cc <CSWTCH.69+0x370>
80405dcc:	859fa0ef          	jal	ra,80400624 <__panic>

80405dd0 <file_fstat>:
80405dd0:	ff010113          	addi	sp,sp,-16
80405dd4:	00112623          	sw	ra,12(sp)
80405dd8:	00812423          	sw	s0,8(sp)
80405ddc:	00912223          	sw	s1,4(sp)
80405de0:	01212023          	sw	s2,0(sp)
80405de4:	09000793          	li	a5,144
80405de8:	0aa7ee63          	bltu	a5,a0,80405ea4 <file_fstat+0xd4>
80405dec:	00097797          	auipc	a5,0x97
80405df0:	9c078793          	addi	a5,a5,-1600 # 8049c7ac <current>
80405df4:	0007a783          	lw	a5,0(a5)
80405df8:	00058913          	mv	s2,a1
80405dfc:	0dc7a703          	lw	a4,220(a5)
80405e00:	0c070263          	beqz	a4,80405ec4 <file_fstat+0xf4>
80405e04:	00872783          	lw	a5,8(a4)
80405e08:	0af05e63          	blez	a5,80405ec4 <file_fstat+0xf4>
80405e0c:	00472403          	lw	s0,4(a4)
80405e10:	00351793          	slli	a5,a0,0x3
80405e14:	40a787b3          	sub	a5,a5,a0
80405e18:	00279793          	slli	a5,a5,0x2
80405e1c:	00f40433          	add	s0,s0,a5
80405e20:	00042703          	lw	a4,0(s0)
80405e24:	00200793          	li	a5,2
80405e28:	06f71e63          	bne	a4,a5,80405ea4 <file_fstat+0xd4>
80405e2c:	00c42783          	lw	a5,12(s0)
80405e30:	06f51a63          	bne	a0,a5,80405ea4 <file_fstat+0xd4>
80405e34:	01842783          	lw	a5,24(s0)
80405e38:	01442483          	lw	s1,20(s0)
80405e3c:	00178793          	addi	a5,a5,1
80405e40:	00f42c23          	sw	a5,24(s0)
80405e44:	08048263          	beqz	s1,80405ec8 <file_fstat+0xf8>
80405e48:	03c4a783          	lw	a5,60(s1)
80405e4c:	06078e63          	beqz	a5,80405ec8 <file_fstat+0xf8>
80405e50:	0147a783          	lw	a5,20(a5)
80405e54:	06078a63          	beqz	a5,80405ec8 <file_fstat+0xf8>
80405e58:	00048513          	mv	a0,s1
80405e5c:	0000e597          	auipc	a1,0xe
80405e60:	33458593          	addi	a1,a1,820 # 80414190 <CSWTCH.69+0x234>
80405e64:	4e0070ef          	jal	ra,8040d344 <inode_check>
80405e68:	03c4a783          	lw	a5,60(s1)
80405e6c:	01442503          	lw	a0,20(s0)
80405e70:	00090593          	mv	a1,s2
80405e74:	0147a783          	lw	a5,20(a5)
80405e78:	000780e7          	jalr	a5
80405e7c:	00050493          	mv	s1,a0
80405e80:	00040513          	mv	a0,s0
80405e84:	e50ff0ef          	jal	ra,804054d4 <fd_array_release>
80405e88:	00c12083          	lw	ra,12(sp)
80405e8c:	00812403          	lw	s0,8(sp)
80405e90:	00048513          	mv	a0,s1
80405e94:	00012903          	lw	s2,0(sp)
80405e98:	00412483          	lw	s1,4(sp)
80405e9c:	01010113          	addi	sp,sp,16
80405ea0:	00008067          	ret
80405ea4:	00c12083          	lw	ra,12(sp)
80405ea8:	00812403          	lw	s0,8(sp)
80405eac:	ffd00493          	li	s1,-3
80405eb0:	00048513          	mv	a0,s1
80405eb4:	00012903          	lw	s2,0(sp)
80405eb8:	00412483          	lw	s1,4(sp)
80405ebc:	01010113          	addi	sp,sp,16
80405ec0:	00008067          	ret
80405ec4:	c60ff0ef          	jal	ra,80405324 <get_fd_array.part.4>
80405ec8:	0000e697          	auipc	a3,0xe
80405ecc:	27868693          	addi	a3,a3,632 # 80414140 <CSWTCH.69+0x1e4>
80405ed0:	0000d617          	auipc	a2,0xd
80405ed4:	c6c60613          	addi	a2,a2,-916 # 80412b3c <commands+0x1bc>
80405ed8:	13000593          	li	a1,304
80405edc:	0000e517          	auipc	a0,0xe
80405ee0:	3f050513          	addi	a0,a0,1008 # 804142cc <CSWTCH.69+0x370>
80405ee4:	f40fa0ef          	jal	ra,80400624 <__panic>

80405ee8 <file_fsync>:
80405ee8:	ff010113          	addi	sp,sp,-16
80405eec:	00112623          	sw	ra,12(sp)
80405ef0:	00812423          	sw	s0,8(sp)
80405ef4:	00912223          	sw	s1,4(sp)
80405ef8:	09000793          	li	a5,144
80405efc:	0aa7e863          	bltu	a5,a0,80405fac <file_fsync+0xc4>
80405f00:	00097797          	auipc	a5,0x97
80405f04:	8ac78793          	addi	a5,a5,-1876 # 8049c7ac <current>
80405f08:	0007a783          	lw	a5,0(a5)
80405f0c:	0dc7a703          	lw	a4,220(a5)
80405f10:	0a070c63          	beqz	a4,80405fc8 <file_fsync+0xe0>
80405f14:	00872783          	lw	a5,8(a4)
80405f18:	0af05863          	blez	a5,80405fc8 <file_fsync+0xe0>
80405f1c:	00472403          	lw	s0,4(a4)
80405f20:	00351793          	slli	a5,a0,0x3
80405f24:	40a787b3          	sub	a5,a5,a0
80405f28:	00279793          	slli	a5,a5,0x2
80405f2c:	00f40433          	add	s0,s0,a5
80405f30:	00042703          	lw	a4,0(s0)
80405f34:	00200793          	li	a5,2
80405f38:	06f71a63          	bne	a4,a5,80405fac <file_fsync+0xc4>
80405f3c:	00c42783          	lw	a5,12(s0)
80405f40:	06f51663          	bne	a0,a5,80405fac <file_fsync+0xc4>
80405f44:	01842783          	lw	a5,24(s0)
80405f48:	01442483          	lw	s1,20(s0)
80405f4c:	00178793          	addi	a5,a5,1
80405f50:	00f42c23          	sw	a5,24(s0)
80405f54:	06048c63          	beqz	s1,80405fcc <file_fsync+0xe4>
80405f58:	03c4a783          	lw	a5,60(s1)
80405f5c:	06078863          	beqz	a5,80405fcc <file_fsync+0xe4>
80405f60:	0187a783          	lw	a5,24(a5)
80405f64:	06078463          	beqz	a5,80405fcc <file_fsync+0xe4>
80405f68:	0000e597          	auipc	a1,0xe
80405f6c:	17058593          	addi	a1,a1,368 # 804140d8 <CSWTCH.69+0x17c>
80405f70:	00048513          	mv	a0,s1
80405f74:	3d0070ef          	jal	ra,8040d344 <inode_check>
80405f78:	03c4a783          	lw	a5,60(s1)
80405f7c:	01442503          	lw	a0,20(s0)
80405f80:	0187a783          	lw	a5,24(a5)
80405f84:	000780e7          	jalr	a5
80405f88:	00050493          	mv	s1,a0
80405f8c:	00040513          	mv	a0,s0
80405f90:	d44ff0ef          	jal	ra,804054d4 <fd_array_release>
80405f94:	00c12083          	lw	ra,12(sp)
80405f98:	00812403          	lw	s0,8(sp)
80405f9c:	00048513          	mv	a0,s1
80405fa0:	00412483          	lw	s1,4(sp)
80405fa4:	01010113          	addi	sp,sp,16
80405fa8:	00008067          	ret
80405fac:	00c12083          	lw	ra,12(sp)
80405fb0:	00812403          	lw	s0,8(sp)
80405fb4:	ffd00493          	li	s1,-3
80405fb8:	00048513          	mv	a0,s1
80405fbc:	00412483          	lw	s1,4(sp)
80405fc0:	01010113          	addi	sp,sp,16
80405fc4:	00008067          	ret
80405fc8:	b5cff0ef          	jal	ra,80405324 <get_fd_array.part.4>
80405fcc:	0000e697          	auipc	a3,0xe
80405fd0:	0bc68693          	addi	a3,a3,188 # 80414088 <CSWTCH.69+0x12c>
80405fd4:	0000d617          	auipc	a2,0xd
80405fd8:	b6860613          	addi	a2,a2,-1176 # 80412b3c <commands+0x1bc>
80405fdc:	13e00593          	li	a1,318
80405fe0:	0000e517          	auipc	a0,0xe
80405fe4:	2ec50513          	addi	a0,a0,748 # 804142cc <CSWTCH.69+0x370>
80405fe8:	e3cfa0ef          	jal	ra,80400624 <__panic>

80405fec <file_getdirentry>:
80405fec:	fd010113          	addi	sp,sp,-48
80405ff0:	02112623          	sw	ra,44(sp)
80405ff4:	02812423          	sw	s0,40(sp)
80405ff8:	02912223          	sw	s1,36(sp)
80405ffc:	03212023          	sw	s2,32(sp)
80406000:	01312e23          	sw	s3,28(sp)
80406004:	09000793          	li	a5,144
80406008:	0ea7ec63          	bltu	a5,a0,80406100 <file_getdirentry+0x114>
8040600c:	00096797          	auipc	a5,0x96
80406010:	7a078793          	addi	a5,a5,1952 # 8049c7ac <current>
80406014:	0007a783          	lw	a5,0(a5)
80406018:	00058493          	mv	s1,a1
8040601c:	0dc7a703          	lw	a4,220(a5)
80406020:	10070263          	beqz	a4,80406124 <file_getdirentry+0x138>
80406024:	00872783          	lw	a5,8(a4)
80406028:	0ef05e63          	blez	a5,80406124 <file_getdirentry+0x138>
8040602c:	00472403          	lw	s0,4(a4)
80406030:	00351793          	slli	a5,a0,0x3
80406034:	40a787b3          	sub	a5,a5,a0
80406038:	00279793          	slli	a5,a5,0x2
8040603c:	00f40433          	add	s0,s0,a5
80406040:	00042703          	lw	a4,0(s0)
80406044:	00200793          	li	a5,2
80406048:	0af71c63          	bne	a4,a5,80406100 <file_getdirentry+0x114>
8040604c:	00c42783          	lw	a5,12(s0)
80406050:	0af51863          	bne	a0,a5,80406100 <file_getdirentry+0x114>
80406054:	01842783          	lw	a5,24(s0)
80406058:	10000613          	li	a2,256
8040605c:	00458593          	addi	a1,a1,4
80406060:	00178793          	addi	a5,a5,1
80406064:	00f42c23          	sw	a5,24(s0)
80406068:	0004a683          	lw	a3,0(s1)
8040606c:	00010513          	mv	a0,sp
80406070:	4a4000ef          	jal	ra,80406514 <iobuf_init>
80406074:	01442903          	lw	s2,20(s0)
80406078:	00050993          	mv	s3,a0
8040607c:	0a090663          	beqz	s2,80406128 <file_getdirentry+0x13c>
80406080:	03c92783          	lw	a5,60(s2)
80406084:	0a078263          	beqz	a5,80406128 <file_getdirentry+0x13c>
80406088:	0207a783          	lw	a5,32(a5)
8040608c:	08078e63          	beqz	a5,80406128 <file_getdirentry+0x13c>
80406090:	00090513          	mv	a0,s2
80406094:	0000e597          	auipc	a1,0xe
80406098:	0a058593          	addi	a1,a1,160 # 80414134 <CSWTCH.69+0x1d8>
8040609c:	2a8070ef          	jal	ra,8040d344 <inode_check>
804060a0:	03c92783          	lw	a5,60(s2)
804060a4:	01442503          	lw	a0,20(s0)
804060a8:	00098593          	mv	a1,s3
804060ac:	0207a783          	lw	a5,32(a5)
804060b0:	000780e7          	jalr	a5
804060b4:	00050913          	mv	s2,a0
804060b8:	02050663          	beqz	a0,804060e4 <file_getdirentry+0xf8>
804060bc:	00040513          	mv	a0,s0
804060c0:	c14ff0ef          	jal	ra,804054d4 <fd_array_release>
804060c4:	02c12083          	lw	ra,44(sp)
804060c8:	02812403          	lw	s0,40(sp)
804060cc:	00090513          	mv	a0,s2
804060d0:	02412483          	lw	s1,36(sp)
804060d4:	02012903          	lw	s2,32(sp)
804060d8:	01c12983          	lw	s3,28(sp)
804060dc:	03010113          	addi	sp,sp,48
804060e0:	00008067          	ret
804060e4:	0004a783          	lw	a5,0(s1)
804060e8:	0089a683          	lw	a3,8(s3) # 1008 <_binary_bin_swap_img_size-0x6ff8>
804060ec:	00c9a703          	lw	a4,12(s3)
804060f0:	00d787b3          	add	a5,a5,a3
804060f4:	40e787b3          	sub	a5,a5,a4
804060f8:	00f4a023          	sw	a5,0(s1)
804060fc:	fc1ff06f          	j	804060bc <file_getdirentry+0xd0>
80406100:	02c12083          	lw	ra,44(sp)
80406104:	02812403          	lw	s0,40(sp)
80406108:	ffd00913          	li	s2,-3
8040610c:	00090513          	mv	a0,s2
80406110:	02412483          	lw	s1,36(sp)
80406114:	02012903          	lw	s2,32(sp)
80406118:	01c12983          	lw	s3,28(sp)
8040611c:	03010113          	addi	sp,sp,48
80406120:	00008067          	ret
80406124:	a00ff0ef          	jal	ra,80405324 <get_fd_array.part.4>
80406128:	0000e697          	auipc	a3,0xe
8040612c:	fb868693          	addi	a3,a3,-72 # 804140e0 <CSWTCH.69+0x184>
80406130:	0000d617          	auipc	a2,0xd
80406134:	a0c60613          	addi	a2,a2,-1524 # 80412b3c <commands+0x1bc>
80406138:	14e00593          	li	a1,334
8040613c:	0000e517          	auipc	a0,0xe
80406140:	19050513          	addi	a0,a0,400 # 804142cc <CSWTCH.69+0x370>
80406144:	ce0fa0ef          	jal	ra,80400624 <__panic>

80406148 <file_dup>:
80406148:	09000793          	li	a5,144
8040614c:	0aa7e863          	bltu	a5,a0,804061fc <file_dup+0xb4>
80406150:	00096797          	auipc	a5,0x96
80406154:	65c78793          	addi	a5,a5,1628 # 8049c7ac <current>
80406158:	0007a783          	lw	a5,0(a5)
8040615c:	fe010113          	addi	sp,sp,-32
80406160:	00112e23          	sw	ra,28(sp)
80406164:	0dc7a683          	lw	a3,220(a5)
80406168:	00812c23          	sw	s0,24(sp)
8040616c:	00050713          	mv	a4,a0
80406170:	00058513          	mv	a0,a1
80406174:	08068863          	beqz	a3,80406204 <file_dup+0xbc>
80406178:	0086a783          	lw	a5,8(a3)
8040617c:	08f05463          	blez	a5,80406204 <file_dup+0xbc>
80406180:	0046a403          	lw	s0,4(a3)
80406184:	00371793          	slli	a5,a4,0x3
80406188:	40e787b3          	sub	a5,a5,a4
8040618c:	00279793          	slli	a5,a5,0x2
80406190:	00f40433          	add	s0,s0,a5
80406194:	00042683          	lw	a3,0(s0)
80406198:	00200793          	li	a5,2
8040619c:	04f69663          	bne	a3,a5,804061e8 <file_dup+0xa0>
804061a0:	00c42783          	lw	a5,12(s0)
804061a4:	04f71263          	bne	a4,a5,804061e8 <file_dup+0xa0>
804061a8:	00c10593          	addi	a1,sp,12
804061ac:	9a0ff0ef          	jal	ra,8040534c <fd_array_alloc>
804061b0:	00050a63          	beqz	a0,804061c4 <file_dup+0x7c>
804061b4:	01c12083          	lw	ra,28(sp)
804061b8:	01812403          	lw	s0,24(sp)
804061bc:	02010113          	addi	sp,sp,32
804061c0:	00008067          	ret
804061c4:	00c12503          	lw	a0,12(sp)
804061c8:	00040593          	mv	a1,s0
804061cc:	c60ff0ef          	jal	ra,8040562c <fd_array_dup>
804061d0:	00c12783          	lw	a5,12(sp)
804061d4:	01c12083          	lw	ra,28(sp)
804061d8:	01812403          	lw	s0,24(sp)
804061dc:	00c7a503          	lw	a0,12(a5)
804061e0:	02010113          	addi	sp,sp,32
804061e4:	00008067          	ret
804061e8:	01c12083          	lw	ra,28(sp)
804061ec:	01812403          	lw	s0,24(sp)
804061f0:	ffd00513          	li	a0,-3
804061f4:	02010113          	addi	sp,sp,32
804061f8:	00008067          	ret
804061fc:	ffd00513          	li	a0,-3
80406200:	00008067          	ret
80406204:	920ff0ef          	jal	ra,80405324 <get_fd_array.part.4>

80406208 <fs_init>:
80406208:	ff010113          	addi	sp,sp,-16
8040620c:	00112623          	sw	ra,12(sp)
80406210:	3f0070ef          	jal	ra,8040d600 <vfs_init>
80406214:	68c080ef          	jal	ra,8040e8a0 <dev_init>
80406218:	00c12083          	lw	ra,12(sp)
8040621c:	01010113          	addi	sp,sp,16
80406220:	2ec0906f          	j	8040f50c <sfs_init>

80406224 <fs_cleanup>:
80406224:	7ac0706f          	j	8040d9d0 <vfs_cleanup>

80406228 <lock_files>:
80406228:	00c50513          	addi	a0,a0,12
8040622c:	e95fe06f          	j	804050c0 <down>

80406230 <unlock_files>:
80406230:	00c50513          	addi	a0,a0,12
80406234:	e89fe06f          	j	804050bc <up>

80406238 <files_create>:
80406238:	ff010113          	addi	sp,sp,-16
8040623c:	00001537          	lui	a0,0x1
80406240:	00812423          	sw	s0,8(sp)
80406244:	00112623          	sw	ra,12(sp)
80406248:	f3cfc0ef          	jal	ra,80402984 <kmalloc>
8040624c:	00050413          	mv	s0,a0
80406250:	02050463          	beqz	a0,80406278 <files_create+0x40>
80406254:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6fe8>
80406258:	00042023          	sw	zero,0(s0)
8040625c:	00c50513          	addi	a0,a0,12
80406260:	00f42223          	sw	a5,4(s0)
80406264:	00042423          	sw	zero,8(s0)
80406268:	00100593          	li	a1,1
8040626c:	e45fe0ef          	jal	ra,804050b0 <sem_init>
80406270:	00442503          	lw	a0,4(s0)
80406274:	b0cff0ef          	jal	ra,80405580 <fd_array_init>
80406278:	00040513          	mv	a0,s0
8040627c:	00c12083          	lw	ra,12(sp)
80406280:	00812403          	lw	s0,8(sp)
80406284:	01010113          	addi	sp,sp,16
80406288:	00008067          	ret

8040628c <files_destroy>:
8040628c:	fe010113          	addi	sp,sp,-32
80406290:	00112e23          	sw	ra,28(sp)
80406294:	00812c23          	sw	s0,24(sp)
80406298:	00912a23          	sw	s1,20(sp)
8040629c:	01212823          	sw	s2,16(sp)
804062a0:	01312623          	sw	s3,12(sp)
804062a4:	08050a63          	beqz	a0,80406338 <files_destroy+0xac>
804062a8:	00852783          	lw	a5,8(a0)
804062ac:	00050993          	mv	s3,a0
804062b0:	08079463          	bnez	a5,80406338 <files_destroy+0xac>
804062b4:	00052503          	lw	a0,0(a0)
804062b8:	00050463          	beqz	a0,804062c0 <files_destroy+0x34>
804062bc:	154070ef          	jal	ra,8040d410 <inode_ref_dec>
804062c0:	0049a403          	lw	s0,4(s3)
804062c4:	000014b7          	lui	s1,0x1
804062c8:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804062cc:	009404b3          	add	s1,s0,s1
804062d0:	00200913          	li	s2,2
804062d4:	00042783          	lw	a5,0(s0)
804062d8:	03278863          	beq	a5,s2,80406308 <files_destroy+0x7c>
804062dc:	02079e63          	bnez	a5,80406318 <files_destroy+0x8c>
804062e0:	01c40413          	addi	s0,s0,28
804062e4:	fe8498e3          	bne	s1,s0,804062d4 <files_destroy+0x48>
804062e8:	01812403          	lw	s0,24(sp)
804062ec:	01c12083          	lw	ra,28(sp)
804062f0:	01412483          	lw	s1,20(sp)
804062f4:	01012903          	lw	s2,16(sp)
804062f8:	00098513          	mv	a0,s3
804062fc:	00c12983          	lw	s3,12(sp)
80406300:	02010113          	addi	sp,sp,32
80406304:	fa4fc06f          	j	80402aa8 <kfree>
80406308:	00040513          	mv	a0,s0
8040630c:	a98ff0ef          	jal	ra,804055a4 <fd_array_close>
80406310:	00042783          	lw	a5,0(s0)
80406314:	fc9ff06f          	j	804062dc <files_destroy+0x50>
80406318:	0000e697          	auipc	a3,0xe
8040631c:	03068693          	addi	a3,a3,48 # 80414348 <CSWTCH.69+0x3ec>
80406320:	0000d617          	auipc	a2,0xd
80406324:	81c60613          	addi	a2,a2,-2020 # 80412b3c <commands+0x1bc>
80406328:	03d00593          	li	a1,61
8040632c:	0000e517          	auipc	a0,0xe
80406330:	00c50513          	addi	a0,a0,12 # 80414338 <CSWTCH.69+0x3dc>
80406334:	af0fa0ef          	jal	ra,80400624 <__panic>
80406338:	0000e697          	auipc	a3,0xe
8040633c:	fd468693          	addi	a3,a3,-44 # 8041430c <CSWTCH.69+0x3b0>
80406340:	0000c617          	auipc	a2,0xc
80406344:	7fc60613          	addi	a2,a2,2044 # 80412b3c <commands+0x1bc>
80406348:	03300593          	li	a1,51
8040634c:	0000e517          	auipc	a0,0xe
80406350:	fec50513          	addi	a0,a0,-20 # 80414338 <CSWTCH.69+0x3dc>
80406354:	ad0fa0ef          	jal	ra,80400624 <__panic>

80406358 <files_closeall>:
80406358:	ff010113          	addi	sp,sp,-16
8040635c:	00112623          	sw	ra,12(sp)
80406360:	00812423          	sw	s0,8(sp)
80406364:	00912223          	sw	s1,4(sp)
80406368:	01212023          	sw	s2,0(sp)
8040636c:	06050063          	beqz	a0,804063cc <files_closeall+0x74>
80406370:	00852783          	lw	a5,8(a0)
80406374:	04f05c63          	blez	a5,804063cc <files_closeall+0x74>
80406378:	00452483          	lw	s1,4(a0)
8040637c:	000017b7          	lui	a5,0x1
80406380:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406384:	03848413          	addi	s0,s1,56
80406388:	00200913          	li	s2,2
8040638c:	00f484b3          	add	s1,s1,a5
80406390:	00c0006f          	j	8040639c <files_closeall+0x44>
80406394:	01c40413          	addi	s0,s0,28
80406398:	00848e63          	beq	s1,s0,804063b4 <files_closeall+0x5c>
8040639c:	00042783          	lw	a5,0(s0)
804063a0:	ff279ae3          	bne	a5,s2,80406394 <files_closeall+0x3c>
804063a4:	00040513          	mv	a0,s0
804063a8:	01c40413          	addi	s0,s0,28
804063ac:	9f8ff0ef          	jal	ra,804055a4 <fd_array_close>
804063b0:	fe8496e3          	bne	s1,s0,8040639c <files_closeall+0x44>
804063b4:	00c12083          	lw	ra,12(sp)
804063b8:	00812403          	lw	s0,8(sp)
804063bc:	00412483          	lw	s1,4(sp)
804063c0:	00012903          	lw	s2,0(sp)
804063c4:	01010113          	addi	sp,sp,16
804063c8:	00008067          	ret
804063cc:	0000e697          	auipc	a3,0xe
804063d0:	ed468693          	addi	a3,a3,-300 # 804142a0 <CSWTCH.69+0x344>
804063d4:	0000c617          	auipc	a2,0xc
804063d8:	76860613          	addi	a2,a2,1896 # 80412b3c <commands+0x1bc>
804063dc:	04500593          	li	a1,69
804063e0:	0000e517          	auipc	a0,0xe
804063e4:	f5850513          	addi	a0,a0,-168 # 80414338 <CSWTCH.69+0x3dc>
804063e8:	a3cfa0ef          	jal	ra,80400624 <__panic>

804063ec <dup_files>:
804063ec:	fe010113          	addi	sp,sp,-32
804063f0:	00112e23          	sw	ra,28(sp)
804063f4:	00812c23          	sw	s0,24(sp)
804063f8:	00912a23          	sw	s1,20(sp)
804063fc:	01212823          	sw	s2,16(sp)
80406400:	01312623          	sw	s3,12(sp)
80406404:	01412423          	sw	s4,8(sp)
80406408:	0a050263          	beqz	a0,804064ac <dup_files+0xc0>
8040640c:	00058413          	mv	s0,a1
80406410:	08058e63          	beqz	a1,804064ac <dup_files+0xc0>
80406414:	00852783          	lw	a5,8(a0)
80406418:	00050493          	mv	s1,a0
8040641c:	0a079863          	bnez	a5,804064cc <dup_files+0xe0>
80406420:	0085a783          	lw	a5,8(a1)
80406424:	0af05463          	blez	a5,804064cc <dup_files+0xe0>
80406428:	0005a503          	lw	a0,0(a1)
8040642c:	00a4a023          	sw	a0,0(s1)
80406430:	00050463          	beqz	a0,80406438 <dup_files+0x4c>
80406434:	6e9060ef          	jal	ra,8040d31c <inode_ref_inc>
80406438:	00442403          	lw	s0,4(s0)
8040643c:	00001937          	lui	s2,0x1
80406440:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406444:	0044a483          	lw	s1,4(s1)
80406448:	01240933          	add	s2,s0,s2
8040644c:	00200993          	li	s3,2
80406450:	00100a13          	li	s4,1
80406454:	0100006f          	j	80406464 <dup_files+0x78>
80406458:	01c40413          	addi	s0,s0,28
8040645c:	01c48493          	addi	s1,s1,28
80406460:	02890463          	beq	s2,s0,80406488 <dup_files+0x9c>
80406464:	00042783          	lw	a5,0(s0)
80406468:	ff3798e3          	bne	a5,s3,80406458 <dup_files+0x6c>
8040646c:	0144a023          	sw	s4,0(s1)
80406470:	00040593          	mv	a1,s0
80406474:	00048513          	mv	a0,s1
80406478:	01c40413          	addi	s0,s0,28
8040647c:	9b0ff0ef          	jal	ra,8040562c <fd_array_dup>
80406480:	01c48493          	addi	s1,s1,28
80406484:	fe8910e3          	bne	s2,s0,80406464 <dup_files+0x78>
80406488:	01c12083          	lw	ra,28(sp)
8040648c:	01812403          	lw	s0,24(sp)
80406490:	01412483          	lw	s1,20(sp)
80406494:	01012903          	lw	s2,16(sp)
80406498:	00c12983          	lw	s3,12(sp)
8040649c:	00812a03          	lw	s4,8(sp)
804064a0:	00000513          	li	a0,0
804064a4:	02010113          	addi	sp,sp,32
804064a8:	00008067          	ret
804064ac:	0000e697          	auipc	a3,0xe
804064b0:	94468693          	addi	a3,a3,-1724 # 80413df0 <default_pmm_manager+0x778>
804064b4:	0000c617          	auipc	a2,0xc
804064b8:	68860613          	addi	a2,a2,1672 # 80412b3c <commands+0x1bc>
804064bc:	05300593          	li	a1,83
804064c0:	0000e517          	auipc	a0,0xe
804064c4:	e7850513          	addi	a0,a0,-392 # 80414338 <CSWTCH.69+0x3dc>
804064c8:	95cfa0ef          	jal	ra,80400624 <__panic>
804064cc:	0000e697          	auipc	a3,0xe
804064d0:	e1068693          	addi	a3,a3,-496 # 804142dc <CSWTCH.69+0x380>
804064d4:	0000c617          	auipc	a2,0xc
804064d8:	66860613          	addi	a2,a2,1640 # 80412b3c <commands+0x1bc>
804064dc:	05400593          	li	a1,84
804064e0:	0000e517          	auipc	a0,0xe
804064e4:	e5850513          	addi	a0,a0,-424 # 80414338 <CSWTCH.69+0x3dc>
804064e8:	93cfa0ef          	jal	ra,80400624 <__panic>

804064ec <iobuf_skip.part.0>:
804064ec:	ff010113          	addi	sp,sp,-16
804064f0:	0000e697          	auipc	a3,0xe
804064f4:	e7068693          	addi	a3,a3,-400 # 80414360 <CSWTCH.69+0x404>
804064f8:	0000c617          	auipc	a2,0xc
804064fc:	64460613          	addi	a2,a2,1604 # 80412b3c <commands+0x1bc>
80406500:	04a00593          	li	a1,74
80406504:	0000e517          	auipc	a0,0xe
80406508:	e7050513          	addi	a0,a0,-400 # 80414374 <CSWTCH.69+0x418>
8040650c:	00112623          	sw	ra,12(sp)
80406510:	914fa0ef          	jal	ra,80400624 <__panic>

80406514 <iobuf_init>:
80406514:	00b52023          	sw	a1,0(a0)
80406518:	00d52223          	sw	a3,4(a0)
8040651c:	00c52623          	sw	a2,12(a0)
80406520:	00c52423          	sw	a2,8(a0)
80406524:	00008067          	ret

80406528 <iobuf_move>:
80406528:	fe010113          	addi	sp,sp,-32
8040652c:	00812c23          	sw	s0,24(sp)
80406530:	00c52403          	lw	s0,12(a0)
80406534:	00912a23          	sw	s1,20(sp)
80406538:	01212823          	sw	s2,16(sp)
8040653c:	01312623          	sw	s3,12(sp)
80406540:	00112e23          	sw	ra,28(sp)
80406544:	00050493          	mv	s1,a0
80406548:	00060913          	mv	s2,a2
8040654c:	00058513          	mv	a0,a1
80406550:	00070993          	mv	s3,a4
80406554:	00867463          	bgeu	a2,s0,8040655c <iobuf_move+0x34>
80406558:	00060413          	mv	s0,a2
8040655c:	04040063          	beqz	s0,8040659c <iobuf_move+0x74>
80406560:	0004a583          	lw	a1,0(s1)
80406564:	06069263          	bnez	a3,804065c8 <iobuf_move+0xa0>
80406568:	00040613          	mv	a2,s0
8040656c:	1bc0c0ef          	jal	ra,80412728 <memmove>
80406570:	00c4a783          	lw	a5,12(s1)
80406574:	0687e663          	bltu	a5,s0,804065e0 <iobuf_move+0xb8>
80406578:	0004a683          	lw	a3,0(s1)
8040657c:	0044a703          	lw	a4,4(s1)
80406580:	408787b3          	sub	a5,a5,s0
80406584:	008686b3          	add	a3,a3,s0
80406588:	00870733          	add	a4,a4,s0
8040658c:	00d4a023          	sw	a3,0(s1)
80406590:	00e4a223          	sw	a4,4(s1)
80406594:	00f4a623          	sw	a5,12(s1)
80406598:	40890933          	sub	s2,s2,s0
8040659c:	00098463          	beqz	s3,804065a4 <iobuf_move+0x7c>
804065a0:	0089a023          	sw	s0,0(s3)
804065a4:	00000513          	li	a0,0
804065a8:	02091863          	bnez	s2,804065d8 <iobuf_move+0xb0>
804065ac:	01c12083          	lw	ra,28(sp)
804065b0:	01812403          	lw	s0,24(sp)
804065b4:	01412483          	lw	s1,20(sp)
804065b8:	01012903          	lw	s2,16(sp)
804065bc:	00c12983          	lw	s3,12(sp)
804065c0:	02010113          	addi	sp,sp,32
804065c4:	00008067          	ret
804065c8:	00058793          	mv	a5,a1
804065cc:	00050593          	mv	a1,a0
804065d0:	00078513          	mv	a0,a5
804065d4:	f95ff06f          	j	80406568 <iobuf_move+0x40>
804065d8:	ffc00513          	li	a0,-4
804065dc:	fd1ff06f          	j	804065ac <iobuf_move+0x84>
804065e0:	f0dff0ef          	jal	ra,804064ec <iobuf_skip.part.0>

804065e4 <iobuf_skip>:
804065e4:	00c52783          	lw	a5,12(a0)
804065e8:	02b7e463          	bltu	a5,a1,80406610 <iobuf_skip+0x2c>
804065ec:	00052683          	lw	a3,0(a0)
804065f0:	00452703          	lw	a4,4(a0)
804065f4:	40b787b3          	sub	a5,a5,a1
804065f8:	00b686b3          	add	a3,a3,a1
804065fc:	00b705b3          	add	a1,a4,a1
80406600:	00d52023          	sw	a3,0(a0)
80406604:	00b52223          	sw	a1,4(a0)
80406608:	00f52623          	sw	a5,12(a0)
8040660c:	00008067          	ret
80406610:	ff010113          	addi	sp,sp,-16
80406614:	00112623          	sw	ra,12(sp)
80406618:	ed5ff0ef          	jal	ra,804064ec <iobuf_skip.part.0>

8040661c <copy_path>:
8040661c:	fe010113          	addi	sp,sp,-32
80406620:	01212823          	sw	s2,16(sp)
80406624:	00096917          	auipc	s2,0x96
80406628:	18890913          	addi	s2,s2,392 # 8049c7ac <current>
8040662c:	00092783          	lw	a5,0(s2)
80406630:	01412423          	sw	s4,8(sp)
80406634:	00050a13          	mv	s4,a0
80406638:	00001537          	lui	a0,0x1
8040663c:	00912a23          	sw	s1,20(sp)
80406640:	01312623          	sw	s3,12(sp)
80406644:	00112e23          	sw	ra,28(sp)
80406648:	00812c23          	sw	s0,24(sp)
8040664c:	01512223          	sw	s5,4(sp)
80406650:	00058993          	mv	s3,a1
80406654:	0187a483          	lw	s1,24(a5)
80406658:	b2cfc0ef          	jal	ra,80402984 <kmalloc>
8040665c:	0c050463          	beqz	a0,80406724 <copy_path+0x108>
80406660:	00050413          	mv	s0,a0
80406664:	06048863          	beqz	s1,804066d4 <copy_path+0xb8>
80406668:	01c48a93          	addi	s5,s1,28
8040666c:	000a8513          	mv	a0,s5
80406670:	a51fe0ef          	jal	ra,804050c0 <down>
80406674:	00092783          	lw	a5,0(s2)
80406678:	08078263          	beqz	a5,804066fc <copy_path+0xe0>
8040667c:	0047a783          	lw	a5,4(a5)
80406680:	000016b7          	lui	a3,0x1
80406684:	00098613          	mv	a2,s3
80406688:	02f4a423          	sw	a5,40(s1)
8040668c:	00040593          	mv	a1,s0
80406690:	00048513          	mv	a0,s1
80406694:	f3cfe0ef          	jal	ra,80404dd0 <copy_string>
80406698:	06050e63          	beqz	a0,80406714 <copy_path+0xf8>
8040669c:	000a8513          	mv	a0,s5
804066a0:	a1dfe0ef          	jal	ra,804050bc <up>
804066a4:	0204a423          	sw	zero,40(s1)
804066a8:	008a2023          	sw	s0,0(s4)
804066ac:	00000513          	li	a0,0
804066b0:	01c12083          	lw	ra,28(sp)
804066b4:	01812403          	lw	s0,24(sp)
804066b8:	01412483          	lw	s1,20(sp)
804066bc:	01012903          	lw	s2,16(sp)
804066c0:	00c12983          	lw	s3,12(sp)
804066c4:	00812a03          	lw	s4,8(sp)
804066c8:	00412a83          	lw	s5,4(sp)
804066cc:	02010113          	addi	sp,sp,32
804066d0:	00008067          	ret
804066d4:	00050593          	mv	a1,a0
804066d8:	000016b7          	lui	a3,0x1
804066dc:	00098613          	mv	a2,s3
804066e0:	00000513          	li	a0,0
804066e4:	eecfe0ef          	jal	ra,80404dd0 <copy_string>
804066e8:	fc0510e3          	bnez	a0,804066a8 <copy_path+0x8c>
804066ec:	00040513          	mv	a0,s0
804066f0:	bb8fc0ef          	jal	ra,80402aa8 <kfree>
804066f4:	ffd00513          	li	a0,-3
804066f8:	fb9ff06f          	j	804066b0 <copy_path+0x94>
804066fc:	000016b7          	lui	a3,0x1
80406700:	00098613          	mv	a2,s3
80406704:	00040593          	mv	a1,s0
80406708:	00048513          	mv	a0,s1
8040670c:	ec4fe0ef          	jal	ra,80404dd0 <copy_string>
80406710:	f80516e3          	bnez	a0,8040669c <copy_path+0x80>
80406714:	000a8513          	mv	a0,s5
80406718:	9a5fe0ef          	jal	ra,804050bc <up>
8040671c:	0204a423          	sw	zero,40(s1)
80406720:	fcdff06f          	j	804066ec <copy_path+0xd0>
80406724:	ffc00513          	li	a0,-4
80406728:	f89ff06f          	j	804066b0 <copy_path+0x94>

8040672c <sysfile_open>:
8040672c:	fe010113          	addi	sp,sp,-32
80406730:	00912a23          	sw	s1,20(sp)
80406734:	00058493          	mv	s1,a1
80406738:	00050593          	mv	a1,a0
8040673c:	00c10513          	addi	a0,sp,12
80406740:	00812c23          	sw	s0,24(sp)
80406744:	00112e23          	sw	ra,28(sp)
80406748:	ed5ff0ef          	jal	ra,8040661c <copy_path>
8040674c:	00050413          	mv	s0,a0
80406750:	00051e63          	bnez	a0,8040676c <sysfile_open+0x40>
80406754:	00c12503          	lw	a0,12(sp)
80406758:	00048593          	mv	a1,s1
8040675c:	810ff0ef          	jal	ra,8040576c <file_open>
80406760:	00050413          	mv	s0,a0
80406764:	00c12503          	lw	a0,12(sp)
80406768:	b40fc0ef          	jal	ra,80402aa8 <kfree>
8040676c:	00040513          	mv	a0,s0
80406770:	01c12083          	lw	ra,28(sp)
80406774:	01812403          	lw	s0,24(sp)
80406778:	01412483          	lw	s1,20(sp)
8040677c:	02010113          	addi	sp,sp,32
80406780:	00008067          	ret

80406784 <sysfile_close>:
80406784:	96cff06f          	j	804058f0 <file_close>

80406788 <sysfile_read>:
80406788:	fc010113          	addi	sp,sp,-64
8040678c:	02912a23          	sw	s1,52(sp)
80406790:	02112e23          	sw	ra,60(sp)
80406794:	02812c23          	sw	s0,56(sp)
80406798:	03212823          	sw	s2,48(sp)
8040679c:	03312623          	sw	s3,44(sp)
804067a0:	03412423          	sw	s4,40(sp)
804067a4:	03512223          	sw	s5,36(sp)
804067a8:	03612023          	sw	s6,32(sp)
804067ac:	01712e23          	sw	s7,28(sp)
804067b0:	01812c23          	sw	s8,24(sp)
804067b4:	01912a23          	sw	s9,20(sp)
804067b8:	00000493          	li	s1,0
804067bc:	02061e63          	bnez	a2,804067f8 <sysfile_read+0x70>
804067c0:	03c12083          	lw	ra,60(sp)
804067c4:	03812403          	lw	s0,56(sp)
804067c8:	00048513          	mv	a0,s1
804067cc:	03012903          	lw	s2,48(sp)
804067d0:	03412483          	lw	s1,52(sp)
804067d4:	02c12983          	lw	s3,44(sp)
804067d8:	02812a03          	lw	s4,40(sp)
804067dc:	02412a83          	lw	s5,36(sp)
804067e0:	02012b03          	lw	s6,32(sp)
804067e4:	01c12b83          	lw	s7,28(sp)
804067e8:	01812c03          	lw	s8,24(sp)
804067ec:	01412c83          	lw	s9,20(sp)
804067f0:	04010113          	addi	sp,sp,64
804067f4:	00008067          	ret
804067f8:	00096c97          	auipc	s9,0x96
804067fc:	fb4c8c93          	addi	s9,s9,-76 # 8049c7ac <current>
80406800:	000ca783          	lw	a5,0(s9)
80406804:	00060413          	mv	s0,a2
80406808:	00058b13          	mv	s6,a1
8040680c:	00000613          	li	a2,0
80406810:	00100593          	li	a1,1
80406814:	00050a93          	mv	s5,a0
80406818:	0187a903          	lw	s2,24(a5)
8040681c:	ed1fe0ef          	jal	ra,804056ec <file_testfd>
80406820:	10050063          	beqz	a0,80406920 <sysfile_read+0x198>
80406824:	00001537          	lui	a0,0x1
80406828:	95cfc0ef          	jal	ra,80402984 <kmalloc>
8040682c:	00050993          	mv	s3,a0
80406830:	0e050c63          	beqz	a0,80406928 <sysfile_read+0x1a0>
80406834:	00000b93          	li	s7,0
80406838:	00001a37          	lui	s4,0x1
8040683c:	01c90c13          	addi	s8,s2,28
80406840:	0d446663          	bltu	s0,s4,8040690c <sysfile_read+0x184>
80406844:	01412623          	sw	s4,12(sp)
80406848:	00001637          	lui	a2,0x1
8040684c:	00c10693          	addi	a3,sp,12
80406850:	00098593          	mv	a1,s3
80406854:	000a8513          	mv	a0,s5
80406858:	920ff0ef          	jal	ra,80405978 <file_read>
8040685c:	00c12683          	lw	a3,12(sp)
80406860:	00050493          	mv	s1,a0
80406864:	08068863          	beqz	a3,804068f4 <sysfile_read+0x16c>
80406868:	02090063          	beqz	s2,80406888 <sysfile_read+0x100>
8040686c:	000c0513          	mv	a0,s8
80406870:	851fe0ef          	jal	ra,804050c0 <down>
80406874:	000ca783          	lw	a5,0(s9)
80406878:	0a078063          	beqz	a5,80406918 <sysfile_read+0x190>
8040687c:	0047a783          	lw	a5,4(a5)
80406880:	00c12683          	lw	a3,12(sp)
80406884:	02f92423          	sw	a5,40(s2)
80406888:	00098613          	mv	a2,s3
8040688c:	000b0593          	mv	a1,s6
80406890:	00090513          	mv	a0,s2
80406894:	ce0fe0ef          	jal	ra,80404d74 <copy_to_user>
80406898:	04050063          	beqz	a0,804068d8 <sysfile_read+0x150>
8040689c:	00c12783          	lw	a5,12(sp)
804068a0:	08f46863          	bltu	s0,a5,80406930 <sysfile_read+0x1a8>
804068a4:	00fb0b33          	add	s6,s6,a5
804068a8:	40f40433          	sub	s0,s0,a5
804068ac:	00fb8bb3          	add	s7,s7,a5
804068b0:	02091a63          	bnez	s2,804068e4 <sysfile_read+0x15c>
804068b4:	00049863          	bnez	s1,804068c4 <sysfile_read+0x13c>
804068b8:	00c12783          	lw	a5,12(sp)
804068bc:	02078e63          	beqz	a5,804068f8 <sysfile_read+0x170>
804068c0:	f80410e3          	bnez	s0,80406840 <sysfile_read+0xb8>
804068c4:	00098513          	mv	a0,s3
804068c8:	9e0fc0ef          	jal	ra,80402aa8 <kfree>
804068cc:	ee0b8ae3          	beqz	s7,804067c0 <sysfile_read+0x38>
804068d0:	000b8493          	mv	s1,s7
804068d4:	eedff06f          	j	804067c0 <sysfile_read+0x38>
804068d8:	00049463          	bnez	s1,804068e0 <sysfile_read+0x158>
804068dc:	ffd00493          	li	s1,-3
804068e0:	fe0902e3          	beqz	s2,804068c4 <sysfile_read+0x13c>
804068e4:	000c0513          	mv	a0,s8
804068e8:	fd4fe0ef          	jal	ra,804050bc <up>
804068ec:	02092423          	sw	zero,40(s2)
804068f0:	fc5ff06f          	j	804068b4 <sysfile_read+0x12c>
804068f4:	fc0518e3          	bnez	a0,804068c4 <sysfile_read+0x13c>
804068f8:	00098513          	mv	a0,s3
804068fc:	00000493          	li	s1,0
80406900:	9a8fc0ef          	jal	ra,80402aa8 <kfree>
80406904:	ea0b8ee3          	beqz	s7,804067c0 <sysfile_read+0x38>
80406908:	fc9ff06f          	j	804068d0 <sysfile_read+0x148>
8040690c:	00812623          	sw	s0,12(sp)
80406910:	00040613          	mv	a2,s0
80406914:	f39ff06f          	j	8040684c <sysfile_read+0xc4>
80406918:	00c12683          	lw	a3,12(sp)
8040691c:	f6dff06f          	j	80406888 <sysfile_read+0x100>
80406920:	ffd00493          	li	s1,-3
80406924:	e9dff06f          	j	804067c0 <sysfile_read+0x38>
80406928:	ffc00493          	li	s1,-4
8040692c:	e95ff06f          	j	804067c0 <sysfile_read+0x38>
80406930:	0000e697          	auipc	a3,0xe
80406934:	a5468693          	addi	a3,a3,-1452 # 80414384 <CSWTCH.69+0x428>
80406938:	0000c617          	auipc	a2,0xc
8040693c:	20460613          	addi	a2,a2,516 # 80412b3c <commands+0x1bc>
80406940:	05500593          	li	a1,85
80406944:	0000e517          	auipc	a0,0xe
80406948:	a4c50513          	addi	a0,a0,-1460 # 80414390 <CSWTCH.69+0x434>
8040694c:	cd9f90ef          	jal	ra,80400624 <__panic>

80406950 <sysfile_write>:
80406950:	fc010113          	addi	sp,sp,-64
80406954:	03512223          	sw	s5,36(sp)
80406958:	02112e23          	sw	ra,60(sp)
8040695c:	02812c23          	sw	s0,56(sp)
80406960:	02912a23          	sw	s1,52(sp)
80406964:	03212823          	sw	s2,48(sp)
80406968:	03312623          	sw	s3,44(sp)
8040696c:	03412423          	sw	s4,40(sp)
80406970:	03612023          	sw	s6,32(sp)
80406974:	01712e23          	sw	s7,28(sp)
80406978:	01812c23          	sw	s8,24(sp)
8040697c:	01912a23          	sw	s9,20(sp)
80406980:	00000a93          	li	s5,0
80406984:	02061e63          	bnez	a2,804069c0 <sysfile_write+0x70>
80406988:	03c12083          	lw	ra,60(sp)
8040698c:	03812403          	lw	s0,56(sp)
80406990:	000a8513          	mv	a0,s5
80406994:	03412483          	lw	s1,52(sp)
80406998:	03012903          	lw	s2,48(sp)
8040699c:	02c12983          	lw	s3,44(sp)
804069a0:	02812a03          	lw	s4,40(sp)
804069a4:	02412a83          	lw	s5,36(sp)
804069a8:	02012b03          	lw	s6,32(sp)
804069ac:	01c12b83          	lw	s7,28(sp)
804069b0:	01812c03          	lw	s8,24(sp)
804069b4:	01412c83          	lw	s9,20(sp)
804069b8:	04010113          	addi	sp,sp,64
804069bc:	00008067          	ret
804069c0:	00096b97          	auipc	s7,0x96
804069c4:	decb8b93          	addi	s7,s7,-532 # 8049c7ac <current>
804069c8:	000ba783          	lw	a5,0(s7)
804069cc:	00060413          	mv	s0,a2
804069d0:	00058a13          	mv	s4,a1
804069d4:	00100613          	li	a2,1
804069d8:	00000593          	li	a1,0
804069dc:	00050c93          	mv	s9,a0
804069e0:	0187a483          	lw	s1,24(a5)
804069e4:	d09fe0ef          	jal	ra,804056ec <file_testfd>
804069e8:	0e050e63          	beqz	a0,80406ae4 <sysfile_write+0x194>
804069ec:	00001537          	lui	a0,0x1
804069f0:	f95fb0ef          	jal	ra,80402984 <kmalloc>
804069f4:	00050993          	mv	s3,a0
804069f8:	0e050a63          	beqz	a0,80406aec <sysfile_write+0x19c>
804069fc:	00000c13          	li	s8,0
80406a00:	00001937          	lui	s2,0x1
80406a04:	01c48b13          	addi	s6,s1,28
80406a08:	09246063          	bltu	s0,s2,80406a88 <sysfile_write+0x138>
80406a0c:	01212623          	sw	s2,12(sp)
80406a10:	08048063          	beqz	s1,80406a90 <sysfile_write+0x140>
80406a14:	000b0513          	mv	a0,s6
80406a18:	ea8fe0ef          	jal	ra,804050c0 <down>
80406a1c:	000ba783          	lw	a5,0(s7)
80406a20:	00078663          	beqz	a5,80406a2c <sysfile_write+0xdc>
80406a24:	0047a783          	lw	a5,4(a5)
80406a28:	02f4a423          	sw	a5,40(s1)
80406a2c:	00c12683          	lw	a3,12(sp)
80406a30:	00000713          	li	a4,0
80406a34:	000a0613          	mv	a2,s4
80406a38:	00098593          	mv	a1,s3
80406a3c:	00048513          	mv	a0,s1
80406a40:	ad4fe0ef          	jal	ra,80404d14 <copy_from_user>
80406a44:	06050863          	beqz	a0,80406ab4 <sysfile_write+0x164>
80406a48:	000b0513          	mv	a0,s6
80406a4c:	e70fe0ef          	jal	ra,804050bc <up>
80406a50:	0204a423          	sw	zero,40(s1)
80406a54:	00c12603          	lw	a2,12(sp)
80406a58:	00c10693          	addi	a3,sp,12
80406a5c:	00098593          	mv	a1,s3
80406a60:	000c8513          	mv	a0,s9
80406a64:	868ff0ef          	jal	ra,80405acc <file_write>
80406a68:	00c12783          	lw	a5,12(sp)
80406a6c:	00050a93          	mv	s5,a0
80406a70:	04079c63          	bnez	a5,80406ac8 <sysfile_write+0x178>
80406a74:	00098513          	mv	a0,s3
80406a78:	830fc0ef          	jal	ra,80402aa8 <kfree>
80406a7c:	f00c06e3          	beqz	s8,80406988 <sysfile_write+0x38>
80406a80:	000c0a93          	mv	s5,s8
80406a84:	f05ff06f          	j	80406988 <sysfile_write+0x38>
80406a88:	00812623          	sw	s0,12(sp)
80406a8c:	f80494e3          	bnez	s1,80406a14 <sysfile_write+0xc4>
80406a90:	00c12683          	lw	a3,12(sp)
80406a94:	00000713          	li	a4,0
80406a98:	000a0613          	mv	a2,s4
80406a9c:	00098593          	mv	a1,s3
80406aa0:	00000513          	li	a0,0
80406aa4:	a70fe0ef          	jal	ra,80404d14 <copy_from_user>
80406aa8:	fa0516e3          	bnez	a0,80406a54 <sysfile_write+0x104>
80406aac:	ffd00a93          	li	s5,-3
80406ab0:	fc5ff06f          	j	80406a74 <sysfile_write+0x124>
80406ab4:	000b0513          	mv	a0,s6
80406ab8:	e04fe0ef          	jal	ra,804050bc <up>
80406abc:	ffd00a93          	li	s5,-3
80406ac0:	0204a423          	sw	zero,40(s1)
80406ac4:	fb1ff06f          	j	80406a74 <sysfile_write+0x124>
80406ac8:	02f46663          	bltu	s0,a5,80406af4 <sysfile_write+0x1a4>
80406acc:	00fa0a33          	add	s4,s4,a5
80406ad0:	40f40433          	sub	s0,s0,a5
80406ad4:	00fc0c33          	add	s8,s8,a5
80406ad8:	f8051ee3          	bnez	a0,80406a74 <sysfile_write+0x124>
80406adc:	f20416e3          	bnez	s0,80406a08 <sysfile_write+0xb8>
80406ae0:	f95ff06f          	j	80406a74 <sysfile_write+0x124>
80406ae4:	ffd00a93          	li	s5,-3
80406ae8:	ea1ff06f          	j	80406988 <sysfile_write+0x38>
80406aec:	ffc00a93          	li	s5,-4
80406af0:	e99ff06f          	j	80406988 <sysfile_write+0x38>
80406af4:	0000e697          	auipc	a3,0xe
80406af8:	89068693          	addi	a3,a3,-1904 # 80414384 <CSWTCH.69+0x428>
80406afc:	0000c617          	auipc	a2,0xc
80406b00:	04060613          	addi	a2,a2,64 # 80412b3c <commands+0x1bc>
80406b04:	08a00593          	li	a1,138
80406b08:	0000e517          	auipc	a0,0xe
80406b0c:	88850513          	addi	a0,a0,-1912 # 80414390 <CSWTCH.69+0x434>
80406b10:	b15f90ef          	jal	ra,80400624 <__panic>

80406b14 <sysfile_seek>:
80406b14:	90cff06f          	j	80405c20 <file_seek>

80406b18 <sysfile_fstat>:
80406b18:	fd010113          	addi	sp,sp,-48
80406b1c:	03212023          	sw	s2,32(sp)
80406b20:	00096917          	auipc	s2,0x96
80406b24:	c8c90913          	addi	s2,s2,-884 # 8049c7ac <current>
80406b28:	00092783          	lw	a5,0(s2)
80406b2c:	01312e23          	sw	s3,28(sp)
80406b30:	00058993          	mv	s3,a1
80406b34:	00010593          	mv	a1,sp
80406b38:	02812423          	sw	s0,40(sp)
80406b3c:	02912223          	sw	s1,36(sp)
80406b40:	02112623          	sw	ra,44(sp)
80406b44:	01412c23          	sw	s4,24(sp)
80406b48:	0187a483          	lw	s1,24(a5)
80406b4c:	a84ff0ef          	jal	ra,80405dd0 <file_fstat>
80406b50:	00050413          	mv	s0,a0
80406b54:	04051463          	bnez	a0,80406b9c <sysfile_fstat+0x84>
80406b58:	06048463          	beqz	s1,80406bc0 <sysfile_fstat+0xa8>
80406b5c:	01c48a13          	addi	s4,s1,28
80406b60:	000a0513          	mv	a0,s4
80406b64:	d5cfe0ef          	jal	ra,804050c0 <down>
80406b68:	00092783          	lw	a5,0(s2)
80406b6c:	06078863          	beqz	a5,80406bdc <sysfile_fstat+0xc4>
80406b70:	0047a783          	lw	a5,4(a5)
80406b74:	01000693          	li	a3,16
80406b78:	00010613          	mv	a2,sp
80406b7c:	02f4a423          	sw	a5,40(s1)
80406b80:	00098593          	mv	a1,s3
80406b84:	00048513          	mv	a0,s1
80406b88:	9ecfe0ef          	jal	ra,80404d74 <copy_to_user>
80406b8c:	06050463          	beqz	a0,80406bf4 <sysfile_fstat+0xdc>
80406b90:	000a0513          	mv	a0,s4
80406b94:	d28fe0ef          	jal	ra,804050bc <up>
80406b98:	0204a423          	sw	zero,40(s1)
80406b9c:	00040513          	mv	a0,s0
80406ba0:	02c12083          	lw	ra,44(sp)
80406ba4:	02812403          	lw	s0,40(sp)
80406ba8:	02412483          	lw	s1,36(sp)
80406bac:	02012903          	lw	s2,32(sp)
80406bb0:	01c12983          	lw	s3,28(sp)
80406bb4:	01812a03          	lw	s4,24(sp)
80406bb8:	03010113          	addi	sp,sp,48
80406bbc:	00008067          	ret
80406bc0:	01000693          	li	a3,16
80406bc4:	00010613          	mv	a2,sp
80406bc8:	00098593          	mv	a1,s3
80406bcc:	9a8fe0ef          	jal	ra,80404d74 <copy_to_user>
80406bd0:	fc0516e3          	bnez	a0,80406b9c <sysfile_fstat+0x84>
80406bd4:	ffd00413          	li	s0,-3
80406bd8:	fc5ff06f          	j	80406b9c <sysfile_fstat+0x84>
80406bdc:	01000693          	li	a3,16
80406be0:	00010613          	mv	a2,sp
80406be4:	00098593          	mv	a1,s3
80406be8:	00048513          	mv	a0,s1
80406bec:	988fe0ef          	jal	ra,80404d74 <copy_to_user>
80406bf0:	fa0510e3          	bnez	a0,80406b90 <sysfile_fstat+0x78>
80406bf4:	000a0513          	mv	a0,s4
80406bf8:	cc4fe0ef          	jal	ra,804050bc <up>
80406bfc:	ffd00413          	li	s0,-3
80406c00:	0204a423          	sw	zero,40(s1)
80406c04:	f99ff06f          	j	80406b9c <sysfile_fstat+0x84>

80406c08 <sysfile_fsync>:
80406c08:	ae0ff06f          	j	80405ee8 <file_fsync>

80406c0c <sysfile_getcwd>:
80406c0c:	fd010113          	addi	sp,sp,-48
80406c10:	01312e23          	sw	s3,28(sp)
80406c14:	00096997          	auipc	s3,0x96
80406c18:	b9898993          	addi	s3,s3,-1128 # 8049c7ac <current>
80406c1c:	0009a783          	lw	a5,0(s3)
80406c20:	03212023          	sw	s2,32(sp)
80406c24:	02112623          	sw	ra,44(sp)
80406c28:	02812423          	sw	s0,40(sp)
80406c2c:	02912223          	sw	s1,36(sp)
80406c30:	01412c23          	sw	s4,24(sp)
80406c34:	0187a903          	lw	s2,24(a5)
80406c38:	08058863          	beqz	a1,80406cc8 <sysfile_getcwd+0xbc>
80406c3c:	00050493          	mv	s1,a0
80406c40:	00058413          	mv	s0,a1
80406c44:	06090663          	beqz	s2,80406cb0 <sysfile_getcwd+0xa4>
80406c48:	01c90a13          	addi	s4,s2,28
80406c4c:	000a0513          	mv	a0,s4
80406c50:	c70fe0ef          	jal	ra,804050c0 <down>
80406c54:	0009a783          	lw	a5,0(s3)
80406c58:	00078663          	beqz	a5,80406c64 <sysfile_getcwd+0x58>
80406c5c:	0047a783          	lw	a5,4(a5)
80406c60:	02f92423          	sw	a5,40(s2)
80406c64:	00100693          	li	a3,1
80406c68:	00040613          	mv	a2,s0
80406c6c:	00048593          	mv	a1,s1
80406c70:	00090513          	mv	a0,s2
80406c74:	fc9fd0ef          	jal	ra,80404c3c <user_mem_check>
80406c78:	04051c63          	bnez	a0,80406cd0 <sysfile_getcwd+0xc4>
80406c7c:	ffd00413          	li	s0,-3
80406c80:	000a0513          	mv	a0,s4
80406c84:	c38fe0ef          	jal	ra,804050bc <up>
80406c88:	02092423          	sw	zero,40(s2)
80406c8c:	00040513          	mv	a0,s0
80406c90:	02c12083          	lw	ra,44(sp)
80406c94:	02812403          	lw	s0,40(sp)
80406c98:	02412483          	lw	s1,36(sp)
80406c9c:	02012903          	lw	s2,32(sp)
80406ca0:	01c12983          	lw	s3,28(sp)
80406ca4:	01812a03          	lw	s4,24(sp)
80406ca8:	03010113          	addi	sp,sp,48
80406cac:	00008067          	ret
80406cb0:	00058613          	mv	a2,a1
80406cb4:	00100693          	li	a3,1
80406cb8:	00050593          	mv	a1,a0
80406cbc:	00000513          	li	a0,0
80406cc0:	f7dfd0ef          	jal	ra,80404c3c <user_mem_check>
80406cc4:	02051663          	bnez	a0,80406cf0 <sysfile_getcwd+0xe4>
80406cc8:	ffd00413          	li	s0,-3
80406ccc:	fc1ff06f          	j	80406c8c <sysfile_getcwd+0x80>
80406cd0:	00040613          	mv	a2,s0
80406cd4:	00000693          	li	a3,0
80406cd8:	00048593          	mv	a1,s1
80406cdc:	00010513          	mv	a0,sp
80406ce0:	835ff0ef          	jal	ra,80406514 <iobuf_init>
80406ce4:	6d4070ef          	jal	ra,8040e3b8 <vfs_getcwd>
80406ce8:	00050413          	mv	s0,a0
80406cec:	f95ff06f          	j	80406c80 <sysfile_getcwd+0x74>
80406cf0:	00040613          	mv	a2,s0
80406cf4:	00000693          	li	a3,0
80406cf8:	00048593          	mv	a1,s1
80406cfc:	00010513          	mv	a0,sp
80406d00:	815ff0ef          	jal	ra,80406514 <iobuf_init>
80406d04:	6b4070ef          	jal	ra,8040e3b8 <vfs_getcwd>
80406d08:	00050413          	mv	s0,a0
80406d0c:	f81ff06f          	j	80406c8c <sysfile_getcwd+0x80>

80406d10 <sysfile_getdirentry>:
80406d10:	fe010113          	addi	sp,sp,-32
80406d14:	01212823          	sw	s2,16(sp)
80406d18:	00096917          	auipc	s2,0x96
80406d1c:	a9490913          	addi	s2,s2,-1388 # 8049c7ac <current>
80406d20:	00092783          	lw	a5,0(s2)
80406d24:	01312623          	sw	s3,12(sp)
80406d28:	00050993          	mv	s3,a0
80406d2c:	10400513          	li	a0,260
80406d30:	00912a23          	sw	s1,20(sp)
80406d34:	01412423          	sw	s4,8(sp)
80406d38:	00112e23          	sw	ra,28(sp)
80406d3c:	00812c23          	sw	s0,24(sp)
80406d40:	01512223          	sw	s5,4(sp)
80406d44:	00058a13          	mv	s4,a1
80406d48:	0187a483          	lw	s1,24(a5)
80406d4c:	c39fb0ef          	jal	ra,80402984 <kmalloc>
80406d50:	12050a63          	beqz	a0,80406e84 <sysfile_getdirentry+0x174>
80406d54:	00050413          	mv	s0,a0
80406d58:	0e048063          	beqz	s1,80406e38 <sysfile_getdirentry+0x128>
80406d5c:	01c48a93          	addi	s5,s1,28
80406d60:	000a8513          	mv	a0,s5
80406d64:	b5cfe0ef          	jal	ra,804050c0 <down>
80406d68:	00092783          	lw	a5,0(s2)
80406d6c:	00078663          	beqz	a5,80406d78 <sysfile_getdirentry+0x68>
80406d70:	0047a783          	lw	a5,4(a5)
80406d74:	02f4a423          	sw	a5,40(s1)
80406d78:	00100713          	li	a4,1
80406d7c:	00400693          	li	a3,4
80406d80:	000a0613          	mv	a2,s4
80406d84:	00040593          	mv	a1,s0
80406d88:	00048513          	mv	a0,s1
80406d8c:	f89fd0ef          	jal	ra,80404d14 <copy_from_user>
80406d90:	04051263          	bnez	a0,80406dd4 <sysfile_getdirentry+0xc4>
80406d94:	000a8513          	mv	a0,s5
80406d98:	b24fe0ef          	jal	ra,804050bc <up>
80406d9c:	ffd00993          	li	s3,-3
80406da0:	0204a423          	sw	zero,40(s1)
80406da4:	00040513          	mv	a0,s0
80406da8:	d01fb0ef          	jal	ra,80402aa8 <kfree>
80406dac:	01c12083          	lw	ra,28(sp)
80406db0:	01812403          	lw	s0,24(sp)
80406db4:	00098513          	mv	a0,s3
80406db8:	01412483          	lw	s1,20(sp)
80406dbc:	01012903          	lw	s2,16(sp)
80406dc0:	00c12983          	lw	s3,12(sp)
80406dc4:	00812a03          	lw	s4,8(sp)
80406dc8:	00412a83          	lw	s5,4(sp)
80406dcc:	02010113          	addi	sp,sp,32
80406dd0:	00008067          	ret
80406dd4:	000a8513          	mv	a0,s5
80406dd8:	ae4fe0ef          	jal	ra,804050bc <up>
80406ddc:	00098513          	mv	a0,s3
80406de0:	00040593          	mv	a1,s0
80406de4:	0204a423          	sw	zero,40(s1)
80406de8:	a04ff0ef          	jal	ra,80405fec <file_getdirentry>
80406dec:	00050993          	mv	s3,a0
80406df0:	fa051ae3          	bnez	a0,80406da4 <sysfile_getdirentry+0x94>
80406df4:	000a8513          	mv	a0,s5
80406df8:	ac8fe0ef          	jal	ra,804050c0 <down>
80406dfc:	00092783          	lw	a5,0(s2)
80406e00:	00078663          	beqz	a5,80406e0c <sysfile_getdirentry+0xfc>
80406e04:	0047a783          	lw	a5,4(a5)
80406e08:	02f4a423          	sw	a5,40(s1)
80406e0c:	10400693          	li	a3,260
80406e10:	00040613          	mv	a2,s0
80406e14:	000a0593          	mv	a1,s4
80406e18:	00048513          	mv	a0,s1
80406e1c:	f59fd0ef          	jal	ra,80404d74 <copy_to_user>
80406e20:	00051463          	bnez	a0,80406e28 <sysfile_getdirentry+0x118>
80406e24:	ffd00993          	li	s3,-3
80406e28:	000a8513          	mv	a0,s5
80406e2c:	a90fe0ef          	jal	ra,804050bc <up>
80406e30:	0204a423          	sw	zero,40(s1)
80406e34:	f71ff06f          	j	80406da4 <sysfile_getdirentry+0x94>
80406e38:	00050593          	mv	a1,a0
80406e3c:	00100713          	li	a4,1
80406e40:	00400693          	li	a3,4
80406e44:	000a0613          	mv	a2,s4
80406e48:	00000513          	li	a0,0
80406e4c:	ec9fd0ef          	jal	ra,80404d14 <copy_from_user>
80406e50:	02050663          	beqz	a0,80406e7c <sysfile_getdirentry+0x16c>
80406e54:	00098513          	mv	a0,s3
80406e58:	00040593          	mv	a1,s0
80406e5c:	990ff0ef          	jal	ra,80405fec <file_getdirentry>
80406e60:	00050993          	mv	s3,a0
80406e64:	f40510e3          	bnez	a0,80406da4 <sysfile_getdirentry+0x94>
80406e68:	10400693          	li	a3,260
80406e6c:	00040613          	mv	a2,s0
80406e70:	000a0593          	mv	a1,s4
80406e74:	f01fd0ef          	jal	ra,80404d74 <copy_to_user>
80406e78:	f20516e3          	bnez	a0,80406da4 <sysfile_getdirentry+0x94>
80406e7c:	ffd00993          	li	s3,-3
80406e80:	f25ff06f          	j	80406da4 <sysfile_getdirentry+0x94>
80406e84:	ffc00993          	li	s3,-4
80406e88:	f25ff06f          	j	80406dac <sysfile_getdirentry+0x9c>

80406e8c <sysfile_dup>:
80406e8c:	abcff06f          	j	80406148 <file_dup>

80406e90 <kernel_thread_entry>:
80406e90:	00048513          	mv	a0,s1
80406e94:	000400e7          	jalr	s0
80406e98:	2c9000ef          	jal	ra,80407960 <do_exit>

80406e9c <alloc_proc>:
80406e9c:	ff010113          	addi	sp,sp,-16
80406ea0:	0e000513          	li	a0,224
80406ea4:	00812423          	sw	s0,8(sp)
80406ea8:	00112623          	sw	ra,12(sp)
80406eac:	ad9fb0ef          	jal	ra,80402984 <kmalloc>
80406eb0:	00050413          	mv	s0,a0
80406eb4:	08050c63          	beqz	a0,80406f4c <alloc_proc+0xb0>
80406eb8:	fff00793          	li	a5,-1
80406ebc:	00f52223          	sw	a5,4(a0)
80406ec0:	03800613          	li	a2,56
80406ec4:	00000593          	li	a1,0
80406ec8:	00052023          	sw	zero,0(a0)
80406ecc:	00052423          	sw	zero,8(a0)
80406ed0:	00052623          	sw	zero,12(a0)
80406ed4:	00052823          	sw	zero,16(a0)
80406ed8:	00052a23          	sw	zero,20(a0)
80406edc:	00052c23          	sw	zero,24(a0)
80406ee0:	01c50513          	addi	a0,a0,28
80406ee4:	0290b0ef          	jal	ra,8041270c <memset>
80406ee8:	00096797          	auipc	a5,0x96
80406eec:	91c78793          	addi	a5,a5,-1764 # 8049c804 <boot_cr3>
80406ef0:	0007a783          	lw	a5,0(a5)
80406ef4:	04042a23          	sw	zero,84(s0)
80406ef8:	04042e23          	sw	zero,92(s0)
80406efc:	04f42c23          	sw	a5,88(s0)
80406f00:	03200613          	li	a2,50
80406f04:	00000593          	li	a1,0
80406f08:	06040513          	addi	a0,s0,96
80406f0c:	0010b0ef          	jal	ra,8041270c <memset>
80406f10:	0bc40793          	addi	a5,s0,188
80406f14:	0a042423          	sw	zero,168(s0)
80406f18:	0a042823          	sw	zero,176(s0)
80406f1c:	0a042a23          	sw	zero,180(s0)
80406f20:	0a042623          	sw	zero,172(s0)
80406f24:	0a042c23          	sw	zero,184(s0)
80406f28:	0cf42023          	sw	a5,192(s0)
80406f2c:	0af42e23          	sw	a5,188(s0)
80406f30:	0c042223          	sw	zero,196(s0)
80406f34:	0c042423          	sw	zero,200(s0)
80406f38:	0c042823          	sw	zero,208(s0)
80406f3c:	0c042623          	sw	zero,204(s0)
80406f40:	0c042a23          	sw	zero,212(s0)
80406f44:	0c042c23          	sw	zero,216(s0)
80406f48:	0c042e23          	sw	zero,220(s0)
80406f4c:	00040513          	mv	a0,s0
80406f50:	00c12083          	lw	ra,12(sp)
80406f54:	00812403          	lw	s0,8(sp)
80406f58:	01010113          	addi	sp,sp,16
80406f5c:	00008067          	ret

80406f60 <put_files>:
80406f60:	0dc52503          	lw	a0,220(a0)
80406f64:	00050a63          	beqz	a0,80406f78 <put_files+0x18>
80406f68:	00852783          	lw	a5,8(a0)
80406f6c:	fff78793          	addi	a5,a5,-1
80406f70:	00f52423          	sw	a5,8(a0)
80406f74:	00078463          	beqz	a5,80406f7c <put_files+0x1c>
80406f78:	00008067          	ret
80406f7c:	b10ff06f          	j	8040628c <files_destroy>

80406f80 <forkret>:
80406f80:	00096797          	auipc	a5,0x96
80406f84:	82c78793          	addi	a5,a5,-2004 # 8049c7ac <current>
80406f88:	0007a783          	lw	a5,0(a5)
80406f8c:	0547a503          	lw	a0,84(a5)
80406f90:	861fa06f          	j	804017f0 <forkrets>

80406f94 <load_icode_read>:
80406f94:	fe010113          	addi	sp,sp,-32
80406f98:	00912a23          	sw	s1,20(sp)
80406f9c:	01312623          	sw	s3,12(sp)
80406fa0:	00060493          	mv	s1,a2
80406fa4:	00058993          	mv	s3,a1
80406fa8:	00000613          	li	a2,0
80406fac:	00068593          	mv	a1,a3
80406fb0:	00812c23          	sw	s0,24(sp)
80406fb4:	01212823          	sw	s2,16(sp)
80406fb8:	00112e23          	sw	ra,28(sp)
80406fbc:	00050913          	mv	s2,a0
80406fc0:	b55ff0ef          	jal	ra,80406b14 <sysfile_seek>
80406fc4:	00050413          	mv	s0,a0
80406fc8:	02050263          	beqz	a0,80406fec <load_icode_read+0x58>
80406fcc:	00040513          	mv	a0,s0
80406fd0:	01c12083          	lw	ra,28(sp)
80406fd4:	01812403          	lw	s0,24(sp)
80406fd8:	01412483          	lw	s1,20(sp)
80406fdc:	01012903          	lw	s2,16(sp)
80406fe0:	00c12983          	lw	s3,12(sp)
80406fe4:	02010113          	addi	sp,sp,32
80406fe8:	00008067          	ret
80406fec:	00048613          	mv	a2,s1
80406ff0:	00098593          	mv	a1,s3
80406ff4:	00090513          	mv	a0,s2
80406ff8:	f90ff0ef          	jal	ra,80406788 <sysfile_read>
80406ffc:	fca488e3          	beq	s1,a0,80406fcc <load_icode_read+0x38>
80407000:	00050413          	mv	s0,a0
80407004:	fc0544e3          	bltz	a0,80406fcc <load_icode_read+0x38>
80407008:	fff00413          	li	s0,-1
8040700c:	00040513          	mv	a0,s0
80407010:	01c12083          	lw	ra,28(sp)
80407014:	01812403          	lw	s0,24(sp)
80407018:	01412483          	lw	s1,20(sp)
8040701c:	01012903          	lw	s2,16(sp)
80407020:	00c12983          	lw	s3,12(sp)
80407024:	02010113          	addi	sp,sp,32
80407028:	00008067          	ret

8040702c <user_main>:
8040702c:	00095797          	auipc	a5,0x95
80407030:	78078793          	addi	a5,a5,1920 # 8049c7ac <current>
80407034:	0007a783          	lw	a5,0(a5)
80407038:	fe010113          	addi	sp,sp,-32
8040703c:	00812c23          	sw	s0,24(sp)
80407040:	0047a583          	lw	a1,4(a5)
80407044:	0000d417          	auipc	s0,0xd
80407048:	75840413          	addi	s0,s0,1880 # 8041479c <CSWTCH.69+0x840>
8040704c:	00040613          	mv	a2,s0
80407050:	0000d517          	auipc	a0,0xd
80407054:	75050513          	addi	a0,a0,1872 # 804147a0 <CSWTCH.69+0x844>
80407058:	00112e23          	sw	ra,28(sp)
8040705c:	00812423          	sw	s0,8(sp)
80407060:	00012623          	sw	zero,12(sp)
80407064:	998f90ef          	jal	ra,804001fc <cprintf>
80407068:	00812783          	lw	a5,8(sp)
8040706c:	06078663          	beqz	a5,804070d8 <user_main+0xac>
80407070:	00c10713          	addi	a4,sp,12
80407074:	00000793          	li	a5,0
80407078:	00470713          	addi	a4,a4,4
8040707c:	ffc72683          	lw	a3,-4(a4)
80407080:	00178793          	addi	a5,a5,1
80407084:	fe069ae3          	bnez	a3,80407078 <user_main+0x4c>
80407088:	10002773          	csrr	a4,sstatus
8040708c:	10076713          	ori	a4,a4,256
80407090:	10071073          	csrw	sstatus,a4
80407094:	1424d073          	csrwi	scause,9
80407098:	00810713          	addi	a4,sp,8
8040709c:	00000517          	auipc	a0,0x0
804070a0:	01c50513          	addi	a0,a0,28 # 804070b8 <user_main+0x8c>
804070a4:	14151073          	csrw	sepc,a0
804070a8:	00400513          	li	a0,4
804070ac:	00040593          	mv	a1,s0
804070b0:	00078613          	mv	a2,a5
804070b4:	00070693          	mv	a3,a4
804070b8:	ddcfa06f          	j	80401694 <__alltraps>
804070bc:	00050413          	mv	s0,a0
804070c0:	0000d617          	auipc	a2,0xd
804070c4:	70860613          	addi	a2,a2,1800 # 804147c8 <CSWTCH.69+0x86c>
804070c8:	40500593          	li	a1,1029
804070cc:	0000d517          	auipc	a0,0xd
804070d0:	71850513          	addi	a0,a0,1816 # 804147e4 <CSWTCH.69+0x888>
804070d4:	d50f90ef          	jal	ra,80400624 <__panic>
804070d8:	00000793          	li	a5,0
804070dc:	fadff06f          	j	80407088 <user_main+0x5c>

804070e0 <setup_pgdir.isra.4>:
804070e0:	fe010113          	addi	sp,sp,-32
804070e4:	01212823          	sw	s2,16(sp)
804070e8:	00050913          	mv	s2,a0
804070ec:	00100513          	li	a0,1
804070f0:	00112e23          	sw	ra,28(sp)
804070f4:	00812c23          	sw	s0,24(sp)
804070f8:	00912a23          	sw	s1,20(sp)
804070fc:	01312623          	sw	s3,12(sp)
80407100:	01412423          	sw	s4,8(sp)
80407104:	c01fb0ef          	jal	ra,80402d04 <alloc_pages>
80407108:	0c050263          	beqz	a0,804071cc <setup_pgdir.isra.4+0xec>
8040710c:	00095a17          	auipc	s4,0x95
80407110:	6fca0a13          	addi	s4,s4,1788 # 8049c808 <pages>
80407114:	000a2683          	lw	a3,0(s4)
80407118:	0000f797          	auipc	a5,0xf
8040711c:	f4c78793          	addi	a5,a5,-180 # 80416064 <nbase>
80407120:	0007a983          	lw	s3,0(a5)
80407124:	40d506b3          	sub	a3,a0,a3
80407128:	00095797          	auipc	a5,0x95
8040712c:	67078793          	addi	a5,a5,1648 # 8049c798 <npage>
80407130:	4056d693          	srai	a3,a3,0x5
80407134:	013686b3          	add	a3,a3,s3
80407138:	0007a703          	lw	a4,0(a5)
8040713c:	00c69793          	slli	a5,a3,0xc
80407140:	00c7d793          	srli	a5,a5,0xc
80407144:	00050413          	mv	s0,a0
80407148:	00c69693          	slli	a3,a3,0xc
8040714c:	08e7f463          	bgeu	a5,a4,804071d4 <setup_pgdir.isra.4+0xf4>
80407150:	00095797          	auipc	a5,0x95
80407154:	6b078793          	addi	a5,a5,1712 # 8049c800 <va_pa_offset>
80407158:	0007a483          	lw	s1,0(a5)
8040715c:	00095797          	auipc	a5,0x95
80407160:	63878793          	addi	a5,a5,1592 # 8049c794 <boot_pgdir>
80407164:	0007a583          	lw	a1,0(a5)
80407168:	009684b3          	add	s1,a3,s1
8040716c:	00001637          	lui	a2,0x1
80407170:	00048513          	mv	a0,s1
80407174:	6080b0ef          	jal	ra,8041277c <memcpy>
80407178:	000a2703          	lw	a4,0(s4)
8040717c:	000017b7          	lui	a5,0x1
80407180:	00f487b3          	add	a5,s1,a5
80407184:	40e40433          	sub	s0,s0,a4
80407188:	40545413          	srai	s0,s0,0x5
8040718c:	01340433          	add	s0,s0,s3
80407190:	00a41413          	slli	s0,s0,0xa
80407194:	00146713          	ori	a4,s0,1
80407198:	00746413          	ori	s0,s0,7
8040719c:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x7054>
804071a0:	fa87a823          	sw	s0,-80(a5)
804071a4:	00992023          	sw	s1,0(s2)
804071a8:	00000513          	li	a0,0
804071ac:	01c12083          	lw	ra,28(sp)
804071b0:	01812403          	lw	s0,24(sp)
804071b4:	01412483          	lw	s1,20(sp)
804071b8:	01012903          	lw	s2,16(sp)
804071bc:	00c12983          	lw	s3,12(sp)
804071c0:	00812a03          	lw	s4,8(sp)
804071c4:	02010113          	addi	sp,sp,32
804071c8:	00008067          	ret
804071cc:	ffc00513          	li	a0,-4
804071d0:	fddff06f          	j	804071ac <setup_pgdir.isra.4+0xcc>
804071d4:	0000c617          	auipc	a2,0xc
804071d8:	4d460613          	addi	a2,a2,1236 # 804136a8 <default_pmm_manager+0x30>
804071dc:	06e00593          	li	a1,110
804071e0:	0000c517          	auipc	a0,0xc
804071e4:	4ec50513          	addi	a0,a0,1260 # 804136cc <default_pmm_manager+0x54>
804071e8:	c3cf90ef          	jal	ra,80400624 <__panic>

804071ec <set_proc_name>:
804071ec:	ff010113          	addi	sp,sp,-16
804071f0:	00812423          	sw	s0,8(sp)
804071f4:	06050413          	addi	s0,a0,96
804071f8:	00912223          	sw	s1,4(sp)
804071fc:	03300613          	li	a2,51
80407200:	00058493          	mv	s1,a1
80407204:	00040513          	mv	a0,s0
80407208:	00000593          	li	a1,0
8040720c:	00112623          	sw	ra,12(sp)
80407210:	4fc0b0ef          	jal	ra,8041270c <memset>
80407214:	00040513          	mv	a0,s0
80407218:	00812403          	lw	s0,8(sp)
8040721c:	00c12083          	lw	ra,12(sp)
80407220:	00048593          	mv	a1,s1
80407224:	00412483          	lw	s1,4(sp)
80407228:	03200613          	li	a2,50
8040722c:	01010113          	addi	sp,sp,16
80407230:	54c0b06f          	j	8041277c <memcpy>

80407234 <proc_run>:
80407234:	ff010113          	addi	sp,sp,-16
80407238:	00095797          	auipc	a5,0x95
8040723c:	57478793          	addi	a5,a5,1396 # 8049c7ac <current>
80407240:	00912223          	sw	s1,4(sp)
80407244:	0007a483          	lw	s1,0(a5)
80407248:	00112623          	sw	ra,12(sp)
8040724c:	00812423          	sw	s0,8(sp)
80407250:	01212023          	sw	s2,0(sp)
80407254:	04a48463          	beq	s1,a0,8040729c <proc_run+0x68>
80407258:	00050413          	mv	s0,a0
8040725c:	100027f3          	csrr	a5,sstatus
80407260:	0027f793          	andi	a5,a5,2
80407264:	00000913          	li	s2,0
80407268:	06079263          	bnez	a5,804072cc <proc_run+0x98>
8040726c:	05842783          	lw	a5,88(s0)
80407270:	00095717          	auipc	a4,0x95
80407274:	52872e23          	sw	s0,1340(a4) # 8049c7ac <current>
80407278:	80000737          	lui	a4,0x80000
8040727c:	00c7d793          	srli	a5,a5,0xc
80407280:	00e7e7b3          	or	a5,a5,a4
80407284:	18079073          	csrw	satp,a5
80407288:	12000073          	sfence.vma
8040728c:	01c40593          	addi	a1,s0,28
80407290:	01c48513          	addi	a0,s1,28
80407294:	2d9010ef          	jal	ra,80408d6c <switch_to>
80407298:	00091e63          	bnez	s2,804072b4 <proc_run+0x80>
8040729c:	00c12083          	lw	ra,12(sp)
804072a0:	00812403          	lw	s0,8(sp)
804072a4:	00412483          	lw	s1,4(sp)
804072a8:	00012903          	lw	s2,0(sp)
804072ac:	01010113          	addi	sp,sp,16
804072b0:	00008067          	ret
804072b4:	00812403          	lw	s0,8(sp)
804072b8:	00c12083          	lw	ra,12(sp)
804072bc:	00412483          	lw	s1,4(sp)
804072c0:	00012903          	lw	s2,0(sp)
804072c4:	01010113          	addi	sp,sp,16
804072c8:	949f906f          	j	80400c10 <intr_enable>
804072cc:	94df90ef          	jal	ra,80400c18 <intr_disable>
804072d0:	00100913          	li	s2,1
804072d4:	f99ff06f          	j	8040726c <proc_run+0x38>

804072d8 <find_proc>:
804072d8:	000027b7          	lui	a5,0x2
804072dc:	fff50713          	addi	a4,a0,-1
804072e0:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
804072e4:	04e7ec63          	bltu	a5,a4,8040733c <find_proc+0x64>
804072e8:	ff010113          	addi	sp,sp,-16
804072ec:	00a00593          	li	a1,10
804072f0:	00812423          	sw	s0,8(sp)
804072f4:	00112623          	sw	ra,12(sp)
804072f8:	00050413          	mv	s0,a0
804072fc:	3d10a0ef          	jal	ra,80411ecc <hash32>
80407300:	00092797          	auipc	a5,0x92
80407304:	44878793          	addi	a5,a5,1096 # 80499748 <hash_list>
80407308:	00351513          	slli	a0,a0,0x3
8040730c:	00f50533          	add	a0,a0,a5
80407310:	00050793          	mv	a5,a0
80407314:	00c0006f          	j	80407320 <find_proc+0x48>
80407318:	f687a703          	lw	a4,-152(a5)
8040731c:	02870463          	beq	a4,s0,80407344 <find_proc+0x6c>
80407320:	0047a783          	lw	a5,4(a5)
80407324:	fef51ae3          	bne	a0,a5,80407318 <find_proc+0x40>
80407328:	00c12083          	lw	ra,12(sp)
8040732c:	00812403          	lw	s0,8(sp)
80407330:	00000513          	li	a0,0
80407334:	01010113          	addi	sp,sp,16
80407338:	00008067          	ret
8040733c:	00000513          	li	a0,0
80407340:	00008067          	ret
80407344:	00c12083          	lw	ra,12(sp)
80407348:	00812403          	lw	s0,8(sp)
8040734c:	f6478513          	addi	a0,a5,-156
80407350:	01010113          	addi	sp,sp,16
80407354:	00008067          	ret

80407358 <do_fork>:
80407358:	fc010113          	addi	sp,sp,-64
8040735c:	03612023          	sw	s6,32(sp)
80407360:	00095b17          	auipc	s6,0x95
80407364:	458b0b13          	addi	s6,s6,1112 # 8049c7b8 <nr_process>
80407368:	000b2783          	lw	a5,0(s6)
8040736c:	03212823          	sw	s2,48(sp)
80407370:	02112e23          	sw	ra,60(sp)
80407374:	02812c23          	sw	s0,56(sp)
80407378:	02912a23          	sw	s1,52(sp)
8040737c:	03312623          	sw	s3,44(sp)
80407380:	03412423          	sw	s4,40(sp)
80407384:	03512223          	sw	s5,36(sp)
80407388:	01712e23          	sw	s7,28(sp)
8040738c:	01812c23          	sw	s8,24(sp)
80407390:	01912a23          	sw	s9,20(sp)
80407394:	01a12823          	sw	s10,16(sp)
80407398:	01b12623          	sw	s11,12(sp)
8040739c:	00001937          	lui	s2,0x1
804073a0:	4927de63          	bge	a5,s2,8040783c <do_fork+0x4e4>
804073a4:	00050993          	mv	s3,a0
804073a8:	00058a93          	mv	s5,a1
804073ac:	00060493          	mv	s1,a2
804073b0:	aedff0ef          	jal	ra,80406e9c <alloc_proc>
804073b4:	00050413          	mv	s0,a0
804073b8:	3c050263          	beqz	a0,8040777c <do_fork+0x424>
804073bc:	00095a17          	auipc	s4,0x95
804073c0:	3f0a0a13          	addi	s4,s4,1008 # 8049c7ac <current>
804073c4:	000a2783          	lw	a5,0(s4)
804073c8:	0a87a703          	lw	a4,168(a5)
804073cc:	00f52a23          	sw	a5,20(a0)
804073d0:	46071a63          	bnez	a4,80407844 <do_fork+0x4ec>
804073d4:	00200513          	li	a0,2
804073d8:	92dfb0ef          	jal	ra,80402d04 <alloc_pages>
804073dc:	38050c63          	beqz	a0,80407774 <do_fork+0x41c>
804073e0:	00095c17          	auipc	s8,0x95
804073e4:	428c0c13          	addi	s8,s8,1064 # 8049c808 <pages>
804073e8:	000c2683          	lw	a3,0(s8)
804073ec:	0000f797          	auipc	a5,0xf
804073f0:	c7878793          	addi	a5,a5,-904 # 80416064 <nbase>
804073f4:	0007ab83          	lw	s7,0(a5)
804073f8:	40d506b3          	sub	a3,a0,a3
804073fc:	4056d693          	srai	a3,a3,0x5
80407400:	00095c97          	auipc	s9,0x95
80407404:	398c8c93          	addi	s9,s9,920 # 8049c798 <npage>
80407408:	017686b3          	add	a3,a3,s7
8040740c:	000ca703          	lw	a4,0(s9)
80407410:	00c69793          	slli	a5,a3,0xc
80407414:	00c7d793          	srli	a5,a5,0xc
80407418:	00c69693          	slli	a3,a3,0xc
8040741c:	46e7f463          	bgeu	a5,a4,80407884 <do_fork+0x52c>
80407420:	00095d17          	auipc	s10,0x95
80407424:	3e0d0d13          	addi	s10,s10,992 # 8049c800 <va_pa_offset>
80407428:	000a2703          	lw	a4,0(s4)
8040742c:	000d2783          	lw	a5,0(s10)
80407430:	0dc72d83          	lw	s11,220(a4) # 800000dc <end+0xffb63820>
80407434:	00d786b3          	add	a3,a5,a3
80407438:	00d42623          	sw	a3,12(s0)
8040743c:	420d8463          	beqz	s11,80407864 <do_fork+0x50c>
80407440:	80090913          	addi	s2,s2,-2048 # 800 <_binary_bin_swap_img_size-0x7800>
80407444:	0129f933          	and	s2,s3,s2
80407448:	2a090463          	beqz	s2,804076f0 <do_fork+0x398>
8040744c:	008da783          	lw	a5,8(s11)
80407450:	01872903          	lw	s2,24(a4)
80407454:	00178793          	addi	a5,a5,1
80407458:	00fda423          	sw	a5,8(s11)
8040745c:	0db42e23          	sw	s11,220(s0)
80407460:	02090a63          	beqz	s2,80407494 <do_fork+0x13c>
80407464:	1009f993          	andi	s3,s3,256
80407468:	2a098663          	beqz	s3,80407714 <do_fork+0x3bc>
8040746c:	01892783          	lw	a5,24(s2)
80407470:	00c92683          	lw	a3,12(s2)
80407474:	80400737          	lui	a4,0x80400
80407478:	00178793          	addi	a5,a5,1
8040747c:	00f92c23          	sw	a5,24(s2)
80407480:	01242c23          	sw	s2,24(s0)
80407484:	40e6ec63          	bltu	a3,a4,8040789c <do_fork+0x544>
80407488:	000d2783          	lw	a5,0(s10)
8040748c:	40f686b3          	sub	a3,a3,a5
80407490:	04d42c23          	sw	a3,88(s0)
80407494:	00c42783          	lw	a5,12(s0)
80407498:	00002737          	lui	a4,0x2
8040749c:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_bin_swap_img_size-0x6090>
804074a0:	00e787b3          	add	a5,a5,a4
804074a4:	04f42a23          	sw	a5,84(s0)
804074a8:	00078713          	mv	a4,a5
804074ac:	09048813          	addi	a6,s1,144
804074b0:	0004a503          	lw	a0,0(s1)
804074b4:	0044a583          	lw	a1,4(s1)
804074b8:	0084a603          	lw	a2,8(s1)
804074bc:	00c4a683          	lw	a3,12(s1)
804074c0:	00a72023          	sw	a0,0(a4)
804074c4:	00b72223          	sw	a1,4(a4)
804074c8:	00c72423          	sw	a2,8(a4)
804074cc:	00d72623          	sw	a3,12(a4)
804074d0:	01048493          	addi	s1,s1,16
804074d4:	01070713          	addi	a4,a4,16
804074d8:	fd049ce3          	bne	s1,a6,804074b0 <do_fork+0x158>
804074dc:	0207a423          	sw	zero,40(a5)
804074e0:	1a0a8663          	beqz	s5,8040768c <do_fork+0x334>
804074e4:	0157a423          	sw	s5,8(a5)
804074e8:	00000717          	auipc	a4,0x0
804074ec:	a9870713          	addi	a4,a4,-1384 # 80406f80 <forkret>
804074f0:	00e42e23          	sw	a4,28(s0)
804074f4:	02f42023          	sw	a5,32(s0)
804074f8:	100027f3          	csrr	a5,sstatus
804074fc:	0027f793          	andi	a5,a5,2
80407500:	00000913          	li	s2,0
80407504:	1a079863          	bnez	a5,804076b4 <do_fork+0x35c>
80407508:	00092797          	auipc	a5,0x92
8040750c:	b3c78793          	addi	a5,a5,-1220 # 80499044 <last_pid>
80407510:	0007a503          	lw	a0,0(a5)
80407514:	000027b7          	lui	a5,0x2
80407518:	00150513          	addi	a0,a0,1
8040751c:	00092717          	auipc	a4,0x92
80407520:	b2a72423          	sw	a0,-1240(a4) # 80499044 <last_pid>
80407524:	1af55c63          	bge	a0,a5,804076dc <do_fork+0x384>
80407528:	00092797          	auipc	a5,0x92
8040752c:	b2078793          	addi	a5,a5,-1248 # 80499048 <next_safe>
80407530:	0007a783          	lw	a5,0(a5)
80407534:	00095497          	auipc	s1,0x95
80407538:	38048493          	addi	s1,s1,896 # 8049c8b4 <proc_list>
8040753c:	06f54c63          	blt	a0,a5,804075b4 <do_fork+0x25c>
80407540:	000027b7          	lui	a5,0x2
80407544:	00092717          	auipc	a4,0x92
80407548:	b0f72223          	sw	a5,-1276(a4) # 80499048 <next_safe>
8040754c:	00000593          	li	a1,0
80407550:	00050793          	mv	a5,a0
80407554:	00095497          	auipc	s1,0x95
80407558:	36048493          	addi	s1,s1,864 # 8049c8b4 <proc_list>
8040755c:	000028b7          	lui	a7,0x2
80407560:	00058813          	mv	a6,a1
80407564:	00002637          	lui	a2,0x2
80407568:	00095697          	auipc	a3,0x95
8040756c:	34c68693          	addi	a3,a3,844 # 8049c8b4 <proc_list>
80407570:	0046a683          	lw	a3,4(a3)
80407574:	02968263          	beq	a3,s1,80407598 <do_fork+0x240>
80407578:	f706a703          	lw	a4,-144(a3)
8040757c:	10f70063          	beq	a4,a5,8040767c <do_fork+0x324>
80407580:	fee7d8e3          	bge	a5,a4,80407570 <do_fork+0x218>
80407584:	fec756e3          	bge	a4,a2,80407570 <do_fork+0x218>
80407588:	0046a683          	lw	a3,4(a3)
8040758c:	00070613          	mv	a2,a4
80407590:	00100813          	li	a6,1
80407594:	fe9692e3          	bne	a3,s1,80407578 <do_fork+0x220>
80407598:	00058863          	beqz	a1,804075a8 <do_fork+0x250>
8040759c:	00092717          	auipc	a4,0x92
804075a0:	aaf72423          	sw	a5,-1368(a4) # 80499044 <last_pid>
804075a4:	00078513          	mv	a0,a5
804075a8:	00080663          	beqz	a6,804075b4 <do_fork+0x25c>
804075ac:	00092797          	auipc	a5,0x92
804075b0:	a8c7ae23          	sw	a2,-1380(a5) # 80499048 <next_safe>
804075b4:	00a00593          	li	a1,10
804075b8:	00a42223          	sw	a0,4(s0)
804075bc:	1110a0ef          	jal	ra,80411ecc <hash32>
804075c0:	00092797          	auipc	a5,0x92
804075c4:	18878793          	addi	a5,a5,392 # 80499748 <hash_list>
804075c8:	00351513          	slli	a0,a0,0x3
804075cc:	00f50533          	add	a0,a0,a5
804075d0:	00452583          	lw	a1,4(a0)
804075d4:	01442683          	lw	a3,20(s0)
804075d8:	09c40793          	addi	a5,s0,156
804075dc:	00f5a023          	sw	a5,0(a1)
804075e0:	0044a603          	lw	a2,4(s1)
804075e4:	00f52223          	sw	a5,4(a0)
804075e8:	0ac6a703          	lw	a4,172(a3)
804075ec:	09440793          	addi	a5,s0,148
804075f0:	0ab42023          	sw	a1,160(s0)
804075f4:	08a42e23          	sw	a0,156(s0)
804075f8:	00f62023          	sw	a5,0(a2) # 2000 <_binary_bin_swap_img_size-0x6000>
804075fc:	00095597          	auipc	a1,0x95
80407600:	2af5ae23          	sw	a5,700(a1) # 8049c8b8 <proc_list+0x4>
80407604:	08c42c23          	sw	a2,152(s0)
80407608:	08942a23          	sw	s1,148(s0)
8040760c:	0a042823          	sw	zero,176(s0)
80407610:	0ae42a23          	sw	a4,180(s0)
80407614:	00070463          	beqz	a4,8040761c <do_fork+0x2c4>
80407618:	0a872823          	sw	s0,176(a4)
8040761c:	000b2783          	lw	a5,0(s6)
80407620:	0a86a623          	sw	s0,172(a3)
80407624:	00178793          	addi	a5,a5,1
80407628:	00095717          	auipc	a4,0x95
8040762c:	18f72823          	sw	a5,400(a4) # 8049c7b8 <nr_process>
80407630:	14091a63          	bnez	s2,80407784 <do_fork+0x42c>
80407634:	00040513          	mv	a0,s0
80407638:	298050ef          	jal	ra,8040c8d0 <wakeup_proc>
8040763c:	00442503          	lw	a0,4(s0)
80407640:	03c12083          	lw	ra,60(sp)
80407644:	03812403          	lw	s0,56(sp)
80407648:	03412483          	lw	s1,52(sp)
8040764c:	03012903          	lw	s2,48(sp)
80407650:	02c12983          	lw	s3,44(sp)
80407654:	02812a03          	lw	s4,40(sp)
80407658:	02412a83          	lw	s5,36(sp)
8040765c:	02012b03          	lw	s6,32(sp)
80407660:	01c12b83          	lw	s7,28(sp)
80407664:	01812c03          	lw	s8,24(sp)
80407668:	01412c83          	lw	s9,20(sp)
8040766c:	01012d03          	lw	s10,16(sp)
80407670:	00c12d83          	lw	s11,12(sp)
80407674:	04010113          	addi	sp,sp,64
80407678:	00008067          	ret
8040767c:	00178793          	addi	a5,a5,1
80407680:	14c7da63          	bge	a5,a2,804077d4 <do_fork+0x47c>
80407684:	00100593          	li	a1,1
80407688:	ee9ff06f          	j	80407570 <do_fork+0x218>
8040768c:	00078a93          	mv	s5,a5
80407690:	0157a423          	sw	s5,8(a5)
80407694:	00000717          	auipc	a4,0x0
80407698:	8ec70713          	addi	a4,a4,-1812 # 80406f80 <forkret>
8040769c:	00e42e23          	sw	a4,28(s0)
804076a0:	02f42023          	sw	a5,32(s0)
804076a4:	100027f3          	csrr	a5,sstatus
804076a8:	0027f793          	andi	a5,a5,2
804076ac:	00000913          	li	s2,0
804076b0:	e4078ce3          	beqz	a5,80407508 <do_fork+0x1b0>
804076b4:	d64f90ef          	jal	ra,80400c18 <intr_disable>
804076b8:	00092797          	auipc	a5,0x92
804076bc:	98c78793          	addi	a5,a5,-1652 # 80499044 <last_pid>
804076c0:	0007a503          	lw	a0,0(a5)
804076c4:	000027b7          	lui	a5,0x2
804076c8:	00100913          	li	s2,1
804076cc:	00150513          	addi	a0,a0,1
804076d0:	00092717          	auipc	a4,0x92
804076d4:	96a72a23          	sw	a0,-1676(a4) # 80499044 <last_pid>
804076d8:	e4f548e3          	blt	a0,a5,80407528 <do_fork+0x1d0>
804076dc:	00100793          	li	a5,1
804076e0:	00092717          	auipc	a4,0x92
804076e4:	96f72223          	sw	a5,-1692(a4) # 80499044 <last_pid>
804076e8:	00100513          	li	a0,1
804076ec:	e55ff06f          	j	80407540 <do_fork+0x1e8>
804076f0:	b49fe0ef          	jal	ra,80406238 <files_create>
804076f4:	00050913          	mv	s2,a0
804076f8:	04050263          	beqz	a0,8040773c <do_fork+0x3e4>
804076fc:	000d8593          	mv	a1,s11
80407700:	cedfe0ef          	jal	ra,804063ec <dup_files>
80407704:	0e051063          	bnez	a0,804077e4 <do_fork+0x48c>
80407708:	000a2703          	lw	a4,0(s4)
8040770c:	00090d93          	mv	s11,s2
80407710:	d3dff06f          	j	8040744c <do_fork+0xf4>
80407714:	ed9fc0ef          	jal	ra,804045ec <mm_create>
80407718:	00050993          	mv	s3,a0
8040771c:	00050c63          	beqz	a0,80407734 <do_fork+0x3dc>
80407720:	00c50513          	addi	a0,a0,12
80407724:	9bdff0ef          	jal	ra,804070e0 <setup_pgdir.isra.4>
80407728:	06050263          	beqz	a0,8040778c <do_fork+0x434>
8040772c:	00098513          	mv	a0,s3
80407730:	880fd0ef          	jal	ra,804047b0 <mm_destroy>
80407734:	00040513          	mv	a0,s0
80407738:	829ff0ef          	jal	ra,80406f60 <put_files>
8040773c:	00c42683          	lw	a3,12(s0)
80407740:	804007b7          	lui	a5,0x80400
80407744:	18f6e463          	bltu	a3,a5,804078cc <do_fork+0x574>
80407748:	000d2703          	lw	a4,0(s10)
8040774c:	000ca783          	lw	a5,0(s9)
80407750:	40e686b3          	sub	a3,a3,a4
80407754:	00c6d693          	srli	a3,a3,0xc
80407758:	14f6fe63          	bgeu	a3,a5,804078b4 <do_fork+0x55c>
8040775c:	000c2503          	lw	a0,0(s8)
80407760:	417686b3          	sub	a3,a3,s7
80407764:	00569693          	slli	a3,a3,0x5
80407768:	00200593          	li	a1,2
8040776c:	00d50533          	add	a0,a0,a3
80407770:	e5cfb0ef          	jal	ra,80402dcc <free_pages>
80407774:	00040513          	mv	a0,s0
80407778:	b30fb0ef          	jal	ra,80402aa8 <kfree>
8040777c:	ffc00513          	li	a0,-4
80407780:	ec1ff06f          	j	80407640 <do_fork+0x2e8>
80407784:	c8cf90ef          	jal	ra,80400c10 <intr_enable>
80407788:	eadff06f          	j	80407634 <do_fork+0x2dc>
8040778c:	01c90d93          	addi	s11,s2,28
80407790:	000d8513          	mv	a0,s11
80407794:	92dfd0ef          	jal	ra,804050c0 <down>
80407798:	000a2783          	lw	a5,0(s4)
8040779c:	00078663          	beqz	a5,804077a8 <do_fork+0x450>
804077a0:	0047a783          	lw	a5,4(a5) # 80400004 <end+0xfff63748>
804077a4:	02f92423          	sw	a5,40(s2)
804077a8:	00090593          	mv	a1,s2
804077ac:	00098513          	mv	a0,s3
804077b0:	96cfd0ef          	jal	ra,8040491c <dup_mmap>
804077b4:	00050a13          	mv	s4,a0
804077b8:	000d8513          	mv	a0,s11
804077bc:	901fd0ef          	jal	ra,804050bc <up>
804077c0:	02092423          	sw	zero,40(s2)
804077c4:	020a1663          	bnez	s4,804077f0 <do_fork+0x498>
804077c8:	0000100f          	fence.i
804077cc:	00098913          	mv	s2,s3
804077d0:	c9dff06f          	j	8040746c <do_fork+0x114>
804077d4:	0117c463          	blt	a5,a7,804077dc <do_fork+0x484>
804077d8:	00100793          	li	a5,1
804077dc:	00100593          	li	a1,1
804077e0:	d81ff06f          	j	80407560 <do_fork+0x208>
804077e4:	00090513          	mv	a0,s2
804077e8:	aa5fe0ef          	jal	ra,8040628c <files_destroy>
804077ec:	f51ff06f          	j	8040773c <do_fork+0x3e4>
804077f0:	00098513          	mv	a0,s3
804077f4:	a08fd0ef          	jal	ra,804049fc <exit_mmap>
804077f8:	00c9a683          	lw	a3,12(s3)
804077fc:	804007b7          	lui	a5,0x80400
80407800:	0cf6e663          	bltu	a3,a5,804078cc <do_fork+0x574>
80407804:	000d2703          	lw	a4,0(s10)
80407808:	000ca783          	lw	a5,0(s9)
8040780c:	40e686b3          	sub	a3,a3,a4
80407810:	00c6d693          	srli	a3,a3,0xc
80407814:	0af6f063          	bgeu	a3,a5,804078b4 <do_fork+0x55c>
80407818:	000c2503          	lw	a0,0(s8)
8040781c:	417686b3          	sub	a3,a3,s7
80407820:	00569693          	slli	a3,a3,0x5
80407824:	00d50533          	add	a0,a0,a3
80407828:	00100593          	li	a1,1
8040782c:	da0fb0ef          	jal	ra,80402dcc <free_pages>
80407830:	00098513          	mv	a0,s3
80407834:	f7dfc0ef          	jal	ra,804047b0 <mm_destroy>
80407838:	efdff06f          	j	80407734 <do_fork+0x3dc>
8040783c:	ffb00513          	li	a0,-5
80407840:	e01ff06f          	j	80407640 <do_fork+0x2e8>
80407844:	0000d697          	auipc	a3,0xd
80407848:	d2068693          	addi	a3,a3,-736 # 80414564 <CSWTCH.69+0x608>
8040784c:	0000b617          	auipc	a2,0xb
80407850:	2f060613          	addi	a2,a2,752 # 80412b3c <commands+0x1bc>
80407854:	1f000593          	li	a1,496
80407858:	0000d517          	auipc	a0,0xd
8040785c:	f8c50513          	addi	a0,a0,-116 # 804147e4 <CSWTCH.69+0x888>
80407860:	dc5f80ef          	jal	ra,80400624 <__panic>
80407864:	0000d697          	auipc	a3,0xd
80407868:	d1c68693          	addi	a3,a3,-740 # 80414580 <CSWTCH.69+0x624>
8040786c:	0000b617          	auipc	a2,0xb
80407870:	2d060613          	addi	a2,a2,720 # 80412b3c <commands+0x1bc>
80407874:	19600593          	li	a1,406
80407878:	0000d517          	auipc	a0,0xd
8040787c:	f6c50513          	addi	a0,a0,-148 # 804147e4 <CSWTCH.69+0x888>
80407880:	da5f80ef          	jal	ra,80400624 <__panic>
80407884:	0000c617          	auipc	a2,0xc
80407888:	e2460613          	addi	a2,a2,-476 # 804136a8 <default_pmm_manager+0x30>
8040788c:	06e00593          	li	a1,110
80407890:	0000c517          	auipc	a0,0xc
80407894:	e3c50513          	addi	a0,a0,-452 # 804136cc <default_pmm_manager+0x54>
80407898:	d8df80ef          	jal	ra,80400624 <__panic>
8040789c:	0000c617          	auipc	a2,0xc
804078a0:	e4060613          	addi	a2,a2,-448 # 804136dc <default_pmm_manager+0x64>
804078a4:	17700593          	li	a1,375
804078a8:	0000d517          	auipc	a0,0xd
804078ac:	f3c50513          	addi	a0,a0,-196 # 804147e4 <CSWTCH.69+0x888>
804078b0:	d75f80ef          	jal	ra,80400624 <__panic>
804078b4:	0000c617          	auipc	a2,0xc
804078b8:	e4c60613          	addi	a2,a2,-436 # 80413700 <default_pmm_manager+0x88>
804078bc:	06900593          	li	a1,105
804078c0:	0000c517          	auipc	a0,0xc
804078c4:	e0c50513          	addi	a0,a0,-500 # 804136cc <default_pmm_manager+0x54>
804078c8:	d5df80ef          	jal	ra,80400624 <__panic>
804078cc:	0000c617          	auipc	a2,0xc
804078d0:	e1060613          	addi	a2,a2,-496 # 804136dc <default_pmm_manager+0x64>
804078d4:	07000593          	li	a1,112
804078d8:	0000c517          	auipc	a0,0xc
804078dc:	df450513          	addi	a0,a0,-524 # 804136cc <default_pmm_manager+0x54>
804078e0:	d45f80ef          	jal	ra,80400624 <__panic>

804078e4 <kernel_thread>:
804078e4:	f6010113          	addi	sp,sp,-160
804078e8:	08812c23          	sw	s0,152(sp)
804078ec:	08912a23          	sw	s1,148(sp)
804078f0:	09212823          	sw	s2,144(sp)
804078f4:	00058493          	mv	s1,a1
804078f8:	00050913          	mv	s2,a0
804078fc:	00060413          	mv	s0,a2
80407900:	00000593          	li	a1,0
80407904:	09000613          	li	a2,144
80407908:	00010513          	mv	a0,sp
8040790c:	08112e23          	sw	ra,156(sp)
80407910:	5fd0a0ef          	jal	ra,8041270c <memset>
80407914:	03212023          	sw	s2,32(sp)
80407918:	02912223          	sw	s1,36(sp)
8040791c:	100027f3          	csrr	a5,sstatus
80407920:	edd7f793          	andi	a5,a5,-291
80407924:	1207e793          	ori	a5,a5,288
80407928:	08f12023          	sw	a5,128(sp)
8040792c:	00010613          	mv	a2,sp
80407930:	10046513          	ori	a0,s0,256
80407934:	fffff797          	auipc	a5,0xfffff
80407938:	55c78793          	addi	a5,a5,1372 # 80406e90 <kernel_thread_entry>
8040793c:	00000593          	li	a1,0
80407940:	08f12223          	sw	a5,132(sp)
80407944:	a15ff0ef          	jal	ra,80407358 <do_fork>
80407948:	09c12083          	lw	ra,156(sp)
8040794c:	09812403          	lw	s0,152(sp)
80407950:	09412483          	lw	s1,148(sp)
80407954:	09012903          	lw	s2,144(sp)
80407958:	0a010113          	addi	sp,sp,160
8040795c:	00008067          	ret

80407960 <do_exit>:
80407960:	fe010113          	addi	sp,sp,-32
80407964:	00912a23          	sw	s1,20(sp)
80407968:	00095717          	auipc	a4,0x95
8040796c:	e4870713          	addi	a4,a4,-440 # 8049c7b0 <idleproc>
80407970:	00095497          	auipc	s1,0x95
80407974:	e3c48493          	addi	s1,s1,-452 # 8049c7ac <current>
80407978:	0004a783          	lw	a5,0(s1)
8040797c:	00072703          	lw	a4,0(a4)
80407980:	00112e23          	sw	ra,28(sp)
80407984:	00812c23          	sw	s0,24(sp)
80407988:	01212823          	sw	s2,16(sp)
8040798c:	01312623          	sw	s3,12(sp)
80407990:	01412423          	sw	s4,8(sp)
80407994:	12e78263          	beq	a5,a4,80407ab8 <do_exit+0x158>
80407998:	00095417          	auipc	s0,0x95
8040799c:	e1c40413          	addi	s0,s0,-484 # 8049c7b4 <initproc>
804079a0:	00042703          	lw	a4,0(s0)
804079a4:	18e78e63          	beq	a5,a4,80407b40 <do_exit+0x1e0>
804079a8:	0187a903          	lw	s2,24(a5)
804079ac:	00050993          	mv	s3,a0
804079b0:	02090e63          	beqz	s2,804079ec <do_exit+0x8c>
804079b4:	00095797          	auipc	a5,0x95
804079b8:	e5078793          	addi	a5,a5,-432 # 8049c804 <boot_cr3>
804079bc:	0007a783          	lw	a5,0(a5)
804079c0:	80000737          	lui	a4,0x80000
804079c4:	00c7d793          	srli	a5,a5,0xc
804079c8:	00e7e7b3          	or	a5,a5,a4
804079cc:	18079073          	csrw	satp,a5
804079d0:	12000073          	sfence.vma
804079d4:	01892783          	lw	a5,24(s2)
804079d8:	fff78793          	addi	a5,a5,-1
804079dc:	00f92c23          	sw	a5,24(s2)
804079e0:	0e078863          	beqz	a5,80407ad0 <do_exit+0x170>
804079e4:	0004a783          	lw	a5,0(s1)
804079e8:	0007ac23          	sw	zero,24(a5)
804079ec:	0004a503          	lw	a0,0(s1)
804079f0:	d70ff0ef          	jal	ra,80406f60 <put_files>
804079f4:	0004a783          	lw	a5,0(s1)
804079f8:	00300713          	li	a4,3
804079fc:	00e7a023          	sw	a4,0(a5)
80407a00:	0b37a223          	sw	s3,164(a5)
80407a04:	100027f3          	csrr	a5,sstatus
80407a08:	0027f793          	andi	a5,a5,2
80407a0c:	00000a13          	li	s4,0
80407a10:	14079463          	bnez	a5,80407b58 <do_exit+0x1f8>
80407a14:	0004a703          	lw	a4,0(s1)
80407a18:	800007b7          	lui	a5,0x80000
80407a1c:	00178793          	addi	a5,a5,1 # 80000001 <end+0xffb63745>
80407a20:	01472503          	lw	a0,20(a4) # 80000014 <end+0xffb63758>
80407a24:	0a852703          	lw	a4,168(a0)
80407a28:	12f70e63          	beq	a4,a5,80407b64 <do_exit+0x204>
80407a2c:	0004a683          	lw	a3,0(s1)
80407a30:	800009b7          	lui	s3,0x80000
80407a34:	00300913          	li	s2,3
80407a38:	00198993          	addi	s3,s3,1 # 80000001 <end+0xffb63745>
80407a3c:	0ac6a783          	lw	a5,172(a3)
80407a40:	04078463          	beqz	a5,80407a88 <do_exit+0x128>
80407a44:	0b47a703          	lw	a4,180(a5)
80407a48:	00042503          	lw	a0,0(s0)
80407a4c:	0ae6a623          	sw	a4,172(a3)
80407a50:	0ac52703          	lw	a4,172(a0)
80407a54:	0a07a823          	sw	zero,176(a5)
80407a58:	0ae7aa23          	sw	a4,180(a5)
80407a5c:	00070463          	beqz	a4,80407a64 <do_exit+0x104>
80407a60:	0af72823          	sw	a5,176(a4)
80407a64:	0007a703          	lw	a4,0(a5)
80407a68:	00a7aa23          	sw	a0,20(a5)
80407a6c:	0af52623          	sw	a5,172(a0)
80407a70:	fd2716e3          	bne	a4,s2,80407a3c <do_exit+0xdc>
80407a74:	0a852783          	lw	a5,168(a0)
80407a78:	fd3792e3          	bne	a5,s3,80407a3c <do_exit+0xdc>
80407a7c:	655040ef          	jal	ra,8040c8d0 <wakeup_proc>
80407a80:	0004a683          	lw	a3,0(s1)
80407a84:	fb9ff06f          	j	80407a3c <do_exit+0xdc>
80407a88:	020a1463          	bnez	s4,80407ab0 <do_exit+0x150>
80407a8c:	741040ef          	jal	ra,8040c9cc <schedule>
80407a90:	0004a783          	lw	a5,0(s1)
80407a94:	0000d617          	auipc	a2,0xd
80407a98:	ab060613          	addi	a2,a2,-1360 # 80414544 <CSWTCH.69+0x5e8>
80407a9c:	24c00593          	li	a1,588
80407aa0:	0047a683          	lw	a3,4(a5)
80407aa4:	0000d517          	auipc	a0,0xd
80407aa8:	d4050513          	addi	a0,a0,-704 # 804147e4 <CSWTCH.69+0x888>
80407aac:	b79f80ef          	jal	ra,80400624 <__panic>
80407ab0:	960f90ef          	jal	ra,80400c10 <intr_enable>
80407ab4:	fd9ff06f          	j	80407a8c <do_exit+0x12c>
80407ab8:	0000d617          	auipc	a2,0xd
80407abc:	a6c60613          	addi	a2,a2,-1428 # 80414524 <CSWTCH.69+0x5c8>
80407ac0:	21c00593          	li	a1,540
80407ac4:	0000d517          	auipc	a0,0xd
80407ac8:	d2050513          	addi	a0,a0,-736 # 804147e4 <CSWTCH.69+0x888>
80407acc:	b59f80ef          	jal	ra,80400624 <__panic>
80407ad0:	00090513          	mv	a0,s2
80407ad4:	f29fc0ef          	jal	ra,804049fc <exit_mmap>
80407ad8:	00c92683          	lw	a3,12(s2)
80407adc:	804007b7          	lui	a5,0x80400
80407ae0:	08f6e663          	bltu	a3,a5,80407b6c <do_exit+0x20c>
80407ae4:	00095797          	auipc	a5,0x95
80407ae8:	d1c78793          	addi	a5,a5,-740 # 8049c800 <va_pa_offset>
80407aec:	0007a703          	lw	a4,0(a5)
80407af0:	00095797          	auipc	a5,0x95
80407af4:	ca878793          	addi	a5,a5,-856 # 8049c798 <npage>
80407af8:	0007a783          	lw	a5,0(a5)
80407afc:	40e686b3          	sub	a3,a3,a4
80407b00:	00c6d693          	srli	a3,a3,0xc
80407b04:	08f6f063          	bgeu	a3,a5,80407b84 <do_exit+0x224>
80407b08:	0000e797          	auipc	a5,0xe
80407b0c:	55c78793          	addi	a5,a5,1372 # 80416064 <nbase>
80407b10:	0007a783          	lw	a5,0(a5)
80407b14:	00095717          	auipc	a4,0x95
80407b18:	cf470713          	addi	a4,a4,-780 # 8049c808 <pages>
80407b1c:	00072503          	lw	a0,0(a4)
80407b20:	40f686b3          	sub	a3,a3,a5
80407b24:	00569693          	slli	a3,a3,0x5
80407b28:	00d50533          	add	a0,a0,a3
80407b2c:	00100593          	li	a1,1
80407b30:	a9cfb0ef          	jal	ra,80402dcc <free_pages>
80407b34:	00090513          	mv	a0,s2
80407b38:	c79fc0ef          	jal	ra,804047b0 <mm_destroy>
80407b3c:	ea9ff06f          	j	804079e4 <do_exit+0x84>
80407b40:	0000d617          	auipc	a2,0xd
80407b44:	9f460613          	addi	a2,a2,-1548 # 80414534 <CSWTCH.69+0x5d8>
80407b48:	21f00593          	li	a1,543
80407b4c:	0000d517          	auipc	a0,0xd
80407b50:	c9850513          	addi	a0,a0,-872 # 804147e4 <CSWTCH.69+0x888>
80407b54:	ad1f80ef          	jal	ra,80400624 <__panic>
80407b58:	8c0f90ef          	jal	ra,80400c18 <intr_disable>
80407b5c:	00100a13          	li	s4,1
80407b60:	eb5ff06f          	j	80407a14 <do_exit+0xb4>
80407b64:	56d040ef          	jal	ra,8040c8d0 <wakeup_proc>
80407b68:	ec5ff06f          	j	80407a2c <do_exit+0xcc>
80407b6c:	0000c617          	auipc	a2,0xc
80407b70:	b7060613          	addi	a2,a2,-1168 # 804136dc <default_pmm_manager+0x64>
80407b74:	07000593          	li	a1,112
80407b78:	0000c517          	auipc	a0,0xc
80407b7c:	b5450513          	addi	a0,a0,-1196 # 804136cc <default_pmm_manager+0x54>
80407b80:	aa5f80ef          	jal	ra,80400624 <__panic>
80407b84:	0000c617          	auipc	a2,0xc
80407b88:	b7c60613          	addi	a2,a2,-1156 # 80413700 <default_pmm_manager+0x88>
80407b8c:	06900593          	li	a1,105
80407b90:	0000c517          	auipc	a0,0xc
80407b94:	b3c50513          	addi	a0,a0,-1220 # 804136cc <default_pmm_manager+0x54>
80407b98:	a8df80ef          	jal	ra,80400624 <__panic>

80407b9c <do_wait.part.8>:
80407b9c:	fe010113          	addi	sp,sp,-32
80407ba0:	01412423          	sw	s4,8(sp)
80407ba4:	80000a37          	lui	s4,0x80000
80407ba8:	00912a23          	sw	s1,20(sp)
80407bac:	01212823          	sw	s2,16(sp)
80407bb0:	01312623          	sw	s3,12(sp)
80407bb4:	01512223          	sw	s5,4(sp)
80407bb8:	01612023          	sw	s6,0(sp)
80407bbc:	00112e23          	sw	ra,28(sp)
80407bc0:	00812c23          	sw	s0,24(sp)
80407bc4:	00050993          	mv	s3,a0
80407bc8:	00058b13          	mv	s6,a1
80407bcc:	00095917          	auipc	s2,0x95
80407bd0:	be090913          	addi	s2,s2,-1056 # 8049c7ac <current>
80407bd4:	00300493          	li	s1,3
80407bd8:	00100a93          	li	s5,1
80407bdc:	001a0a13          	addi	s4,s4,1 # 80000001 <end+0xffb63745>
80407be0:	04098663          	beqz	s3,80407c2c <do_wait.part.8+0x90>
80407be4:	00098513          	mv	a0,s3
80407be8:	ef0ff0ef          	jal	ra,804072d8 <find_proc>
80407bec:	00050413          	mv	s0,a0
80407bf0:	18050a63          	beqz	a0,80407d84 <do_wait.part.8+0x1e8>
80407bf4:	00092703          	lw	a4,0(s2)
80407bf8:	01452783          	lw	a5,20(a0)
80407bfc:	18e79463          	bne	a5,a4,80407d84 <do_wait.part.8+0x1e8>
80407c00:	00052783          	lw	a5,0(a0)
80407c04:	04978463          	beq	a5,s1,80407c4c <do_wait.part.8+0xb0>
80407c08:	01572023          	sw	s5,0(a4)
80407c0c:	0b472423          	sw	s4,168(a4)
80407c10:	5bd040ef          	jal	ra,8040c9cc <schedule>
80407c14:	00092783          	lw	a5,0(s2)
80407c18:	05c7a783          	lw	a5,92(a5)
80407c1c:	0017f793          	andi	a5,a5,1
80407c20:	fc0780e3          	beqz	a5,80407be0 <do_wait.part.8+0x44>
80407c24:	ff700513          	li	a0,-9
80407c28:	d39ff0ef          	jal	ra,80407960 <do_exit>
80407c2c:	00092703          	lw	a4,0(s2)
80407c30:	0ac72403          	lw	s0,172(a4)
80407c34:	00041863          	bnez	s0,80407c44 <do_wait.part.8+0xa8>
80407c38:	14c0006f          	j	80407d84 <do_wait.part.8+0x1e8>
80407c3c:	0b442403          	lw	s0,180(s0)
80407c40:	fc0404e3          	beqz	s0,80407c08 <do_wait.part.8+0x6c>
80407c44:	00042783          	lw	a5,0(s0)
80407c48:	fe979ae3          	bne	a5,s1,80407c3c <do_wait.part.8+0xa0>
80407c4c:	00095797          	auipc	a5,0x95
80407c50:	b6478793          	addi	a5,a5,-1180 # 8049c7b0 <idleproc>
80407c54:	0007a783          	lw	a5,0(a5)
80407c58:	14878063          	beq	a5,s0,80407d98 <do_wait.part.8+0x1fc>
80407c5c:	00095797          	auipc	a5,0x95
80407c60:	b5878793          	addi	a5,a5,-1192 # 8049c7b4 <initproc>
80407c64:	0007a783          	lw	a5,0(a5)
80407c68:	12f40863          	beq	s0,a5,80407d98 <do_wait.part.8+0x1fc>
80407c6c:	000b0663          	beqz	s6,80407c78 <do_wait.part.8+0xdc>
80407c70:	0a442783          	lw	a5,164(s0)
80407c74:	00fb2023          	sw	a5,0(s6)
80407c78:	100027f3          	csrr	a5,sstatus
80407c7c:	0027f793          	andi	a5,a5,2
80407c80:	00000593          	li	a1,0
80407c84:	10079463          	bnez	a5,80407d8c <do_wait.part.8+0x1f0>
80407c88:	09c42603          	lw	a2,156(s0)
80407c8c:	0a042683          	lw	a3,160(s0)
80407c90:	0b442703          	lw	a4,180(s0)
80407c94:	0b042783          	lw	a5,176(s0)
80407c98:	00d62223          	sw	a3,4(a2)
80407c9c:	00c6a023          	sw	a2,0(a3)
80407ca0:	09442603          	lw	a2,148(s0)
80407ca4:	09842683          	lw	a3,152(s0)
80407ca8:	00d62223          	sw	a3,4(a2)
80407cac:	00c6a023          	sw	a2,0(a3)
80407cb0:	00070663          	beqz	a4,80407cbc <do_wait.part.8+0x120>
80407cb4:	0af72823          	sw	a5,176(a4)
80407cb8:	0b042783          	lw	a5,176(s0)
80407cbc:	0a078e63          	beqz	a5,80407d78 <do_wait.part.8+0x1dc>
80407cc0:	0ae7aa23          	sw	a4,180(a5)
80407cc4:	00095797          	auipc	a5,0x95
80407cc8:	af478793          	addi	a5,a5,-1292 # 8049c7b8 <nr_process>
80407ccc:	0007a783          	lw	a5,0(a5)
80407cd0:	fff78793          	addi	a5,a5,-1
80407cd4:	00095717          	auipc	a4,0x95
80407cd8:	aef72223          	sw	a5,-1308(a4) # 8049c7b8 <nr_process>
80407cdc:	08059a63          	bnez	a1,80407d70 <do_wait.part.8+0x1d4>
80407ce0:	00c42683          	lw	a3,12(s0)
80407ce4:	804007b7          	lui	a5,0x80400
80407ce8:	0ef6e063          	bltu	a3,a5,80407dc8 <do_wait.part.8+0x22c>
80407cec:	00095797          	auipc	a5,0x95
80407cf0:	b1478793          	addi	a5,a5,-1260 # 8049c800 <va_pa_offset>
80407cf4:	0007a703          	lw	a4,0(a5)
80407cf8:	00095797          	auipc	a5,0x95
80407cfc:	aa078793          	addi	a5,a5,-1376 # 8049c798 <npage>
80407d00:	0007a783          	lw	a5,0(a5)
80407d04:	40e686b3          	sub	a3,a3,a4
80407d08:	00c6d693          	srli	a3,a3,0xc
80407d0c:	0af6f263          	bgeu	a3,a5,80407db0 <do_wait.part.8+0x214>
80407d10:	0000e797          	auipc	a5,0xe
80407d14:	35478793          	addi	a5,a5,852 # 80416064 <nbase>
80407d18:	0007a783          	lw	a5,0(a5)
80407d1c:	00095717          	auipc	a4,0x95
80407d20:	aec70713          	addi	a4,a4,-1300 # 8049c808 <pages>
80407d24:	00072503          	lw	a0,0(a4)
80407d28:	40f686b3          	sub	a3,a3,a5
80407d2c:	00569693          	slli	a3,a3,0x5
80407d30:	00d50533          	add	a0,a0,a3
80407d34:	00200593          	li	a1,2
80407d38:	894fb0ef          	jal	ra,80402dcc <free_pages>
80407d3c:	00040513          	mv	a0,s0
80407d40:	d69fa0ef          	jal	ra,80402aa8 <kfree>
80407d44:	00000513          	li	a0,0
80407d48:	01c12083          	lw	ra,28(sp)
80407d4c:	01812403          	lw	s0,24(sp)
80407d50:	01412483          	lw	s1,20(sp)
80407d54:	01012903          	lw	s2,16(sp)
80407d58:	00c12983          	lw	s3,12(sp)
80407d5c:	00812a03          	lw	s4,8(sp)
80407d60:	00412a83          	lw	s5,4(sp)
80407d64:	00012b03          	lw	s6,0(sp)
80407d68:	02010113          	addi	sp,sp,32
80407d6c:	00008067          	ret
80407d70:	ea1f80ef          	jal	ra,80400c10 <intr_enable>
80407d74:	f6dff06f          	j	80407ce0 <do_wait.part.8+0x144>
80407d78:	01442783          	lw	a5,20(s0)
80407d7c:	0ae7a623          	sw	a4,172(a5)
80407d80:	f45ff06f          	j	80407cc4 <do_wait.part.8+0x128>
80407d84:	ffe00513          	li	a0,-2
80407d88:	fc1ff06f          	j	80407d48 <do_wait.part.8+0x1ac>
80407d8c:	e8df80ef          	jal	ra,80400c18 <intr_disable>
80407d90:	00100593          	li	a1,1
80407d94:	ef5ff06f          	j	80407c88 <do_wait.part.8+0xec>
80407d98:	0000c617          	auipc	a2,0xc
80407d9c:	7fc60613          	addi	a2,a2,2044 # 80414594 <CSWTCH.69+0x638>
80407da0:	3ae00593          	li	a1,942
80407da4:	0000d517          	auipc	a0,0xd
80407da8:	a4050513          	addi	a0,a0,-1472 # 804147e4 <CSWTCH.69+0x888>
80407dac:	879f80ef          	jal	ra,80400624 <__panic>
80407db0:	0000c617          	auipc	a2,0xc
80407db4:	95060613          	addi	a2,a2,-1712 # 80413700 <default_pmm_manager+0x88>
80407db8:	06900593          	li	a1,105
80407dbc:	0000c517          	auipc	a0,0xc
80407dc0:	91050513          	addi	a0,a0,-1776 # 804136cc <default_pmm_manager+0x54>
80407dc4:	861f80ef          	jal	ra,80400624 <__panic>
80407dc8:	0000c617          	auipc	a2,0xc
80407dcc:	91460613          	addi	a2,a2,-1772 # 804136dc <default_pmm_manager+0x64>
80407dd0:	07000593          	li	a1,112
80407dd4:	0000c517          	auipc	a0,0xc
80407dd8:	8f850513          	addi	a0,a0,-1800 # 804136cc <default_pmm_manager+0x54>
80407ddc:	849f80ef          	jal	ra,80400624 <__panic>

80407de0 <init_main>:
80407de0:	6b7377b7          	lui	a5,0x6b737
80407de4:	fe010113          	addi	sp,sp,-32
80407de8:	96478793          	addi	a5,a5,-1692 # 6b736964 <_binary_bin_sfs_img_size+0x6b6be964>
80407dec:	00f12423          	sw	a5,8(sp)
80407df0:	000047b7          	lui	a5,0x4
80407df4:	a3078793          	addi	a5,a5,-1488 # 3a30 <_binary_bin_swap_img_size-0x45d0>
80407df8:	00810513          	addi	a0,sp,8
80407dfc:	00112e23          	sw	ra,28(sp)
80407e00:	00f11623          	sh	a5,12(sp)
80407e04:	00010723          	sb	zero,14(sp)
80407e08:	01d050ef          	jal	ra,8040d624 <vfs_set_bootfs>
80407e0c:	0e051a63          	bnez	a0,80407f00 <init_main+0x120>
80407e10:	828fb0ef          	jal	ra,80402e38 <nr_free_pages>
80407e14:	b69fa0ef          	jal	ra,8040297c <kallocated>
80407e18:	00000613          	li	a2,0
80407e1c:	00000593          	li	a1,0
80407e20:	fffff517          	auipc	a0,0xfffff
80407e24:	20c50513          	addi	a0,a0,524 # 8040702c <user_main>
80407e28:	abdff0ef          	jal	ra,804078e4 <kernel_thread>
80407e2c:	00a04663          	bgtz	a0,80407e38 <init_main+0x58>
80407e30:	0b80006f          	j	80407ee8 <init_main+0x108>
80407e34:	399040ef          	jal	ra,8040c9cc <schedule>
80407e38:	00000593          	li	a1,0
80407e3c:	00000513          	li	a0,0
80407e40:	d5dff0ef          	jal	ra,80407b9c <do_wait.part.8>
80407e44:	fe0508e3          	beqz	a0,80407e34 <init_main+0x54>
80407e48:	bdcfe0ef          	jal	ra,80406224 <fs_cleanup>
80407e4c:	0000c517          	auipc	a0,0xc
80407e50:	79c50513          	addi	a0,a0,1948 # 804145e8 <CSWTCH.69+0x68c>
80407e54:	ba8f80ef          	jal	ra,804001fc <cprintf>
80407e58:	00095797          	auipc	a5,0x95
80407e5c:	95c78793          	addi	a5,a5,-1700 # 8049c7b4 <initproc>
80407e60:	0007a783          	lw	a5,0(a5)
80407e64:	0ac7a703          	lw	a4,172(a5)
80407e68:	06071063          	bnez	a4,80407ec8 <init_main+0xe8>
80407e6c:	0b07a703          	lw	a4,176(a5)
80407e70:	04071c63          	bnez	a4,80407ec8 <init_main+0xe8>
80407e74:	0b47a703          	lw	a4,180(a5)
80407e78:	04071863          	bnez	a4,80407ec8 <init_main+0xe8>
80407e7c:	00095717          	auipc	a4,0x95
80407e80:	93c70713          	addi	a4,a4,-1732 # 8049c7b8 <nr_process>
80407e84:	00072683          	lw	a3,0(a4)
80407e88:	00200713          	li	a4,2
80407e8c:	0ce69863          	bne	a3,a4,80407f5c <init_main+0x17c>
80407e90:	00095697          	auipc	a3,0x95
80407e94:	a2468693          	addi	a3,a3,-1500 # 8049c8b4 <proc_list>
80407e98:	0046a703          	lw	a4,4(a3)
80407e9c:	09478793          	addi	a5,a5,148
80407ea0:	08f71e63          	bne	a4,a5,80407f3c <init_main+0x15c>
80407ea4:	0006a783          	lw	a5,0(a3)
80407ea8:	06f71a63          	bne	a4,a5,80407f1c <init_main+0x13c>
80407eac:	0000d517          	auipc	a0,0xd
80407eb0:	81c50513          	addi	a0,a0,-2020 # 804146c8 <CSWTCH.69+0x76c>
80407eb4:	b48f80ef          	jal	ra,804001fc <cprintf>
80407eb8:	01c12083          	lw	ra,28(sp)
80407ebc:	00000513          	li	a0,0
80407ec0:	02010113          	addi	sp,sp,32
80407ec4:	00008067          	ret
80407ec8:	0000c697          	auipc	a3,0xc
80407ecc:	74468693          	addi	a3,a3,1860 # 8041460c <CSWTCH.69+0x6b0>
80407ed0:	0000b617          	auipc	a2,0xb
80407ed4:	c6c60613          	addi	a2,a2,-916 # 80412b3c <commands+0x1bc>
80407ed8:	42200593          	li	a1,1058
80407edc:	0000d517          	auipc	a0,0xd
80407ee0:	90850513          	addi	a0,a0,-1784 # 804147e4 <CSWTCH.69+0x888>
80407ee4:	f40f80ef          	jal	ra,80400624 <__panic>
80407ee8:	0000c617          	auipc	a2,0xc
80407eec:	6e460613          	addi	a2,a2,1764 # 804145cc <CSWTCH.69+0x670>
80407ef0:	41600593          	li	a1,1046
80407ef4:	0000d517          	auipc	a0,0xd
80407ef8:	8f050513          	addi	a0,a0,-1808 # 804147e4 <CSWTCH.69+0x888>
80407efc:	f28f80ef          	jal	ra,80400624 <__panic>
80407f00:	00050693          	mv	a3,a0
80407f04:	0000c617          	auipc	a2,0xc
80407f08:	6ac60613          	addi	a2,a2,1708 # 804145b0 <CSWTCH.69+0x654>
80407f0c:	40e00593          	li	a1,1038
80407f10:	0000d517          	auipc	a0,0xd
80407f14:	8d450513          	addi	a0,a0,-1836 # 804147e4 <CSWTCH.69+0x888>
80407f18:	f0cf80ef          	jal	ra,80400624 <__panic>
80407f1c:	0000c697          	auipc	a3,0xc
80407f20:	77c68693          	addi	a3,a3,1916 # 80414698 <CSWTCH.69+0x73c>
80407f24:	0000b617          	auipc	a2,0xb
80407f28:	c1860613          	addi	a2,a2,-1000 # 80412b3c <commands+0x1bc>
80407f2c:	42500593          	li	a1,1061
80407f30:	0000d517          	auipc	a0,0xd
80407f34:	8b450513          	addi	a0,a0,-1868 # 804147e4 <CSWTCH.69+0x888>
80407f38:	eecf80ef          	jal	ra,80400624 <__panic>
80407f3c:	0000c697          	auipc	a3,0xc
80407f40:	72c68693          	addi	a3,a3,1836 # 80414668 <CSWTCH.69+0x70c>
80407f44:	0000b617          	auipc	a2,0xb
80407f48:	bf860613          	addi	a2,a2,-1032 # 80412b3c <commands+0x1bc>
80407f4c:	42400593          	li	a1,1060
80407f50:	0000d517          	auipc	a0,0xd
80407f54:	89450513          	addi	a0,a0,-1900 # 804147e4 <CSWTCH.69+0x888>
80407f58:	eccf80ef          	jal	ra,80400624 <__panic>
80407f5c:	0000c697          	auipc	a3,0xc
80407f60:	6fc68693          	addi	a3,a3,1788 # 80414658 <CSWTCH.69+0x6fc>
80407f64:	0000b617          	auipc	a2,0xb
80407f68:	bd860613          	addi	a2,a2,-1064 # 80412b3c <commands+0x1bc>
80407f6c:	42300593          	li	a1,1059
80407f70:	0000d517          	auipc	a0,0xd
80407f74:	87450513          	addi	a0,a0,-1932 # 804147e4 <CSWTCH.69+0x888>
80407f78:	eacf80ef          	jal	ra,80400624 <__panic>

80407f7c <do_execve>:
80407f7c:	e9010113          	addi	sp,sp,-368
80407f80:	15412c23          	sw	s4,344(sp)
80407f84:	00095a17          	auipc	s4,0x95
80407f88:	828a0a13          	addi	s4,s4,-2008 # 8049c7ac <current>
80407f8c:	000a2683          	lw	a3,0(s4)
80407f90:	15612823          	sw	s6,336(sp)
80407f94:	16112623          	sw	ra,364(sp)
80407f98:	16812423          	sw	s0,360(sp)
80407f9c:	16912223          	sw	s1,356(sp)
80407fa0:	17212023          	sw	s2,352(sp)
80407fa4:	15312e23          	sw	s3,348(sp)
80407fa8:	15512a23          	sw	s5,340(sp)
80407fac:	15712623          	sw	s7,332(sp)
80407fb0:	15812423          	sw	s8,328(sp)
80407fb4:	15912223          	sw	s9,324(sp)
80407fb8:	15a12023          	sw	s10,320(sp)
80407fbc:	13b12e23          	sw	s11,316(sp)
80407fc0:	fff58713          	addi	a4,a1,-1
80407fc4:	01f00793          	li	a5,31
80407fc8:	0186ab03          	lw	s6,24(a3)
80407fcc:	6ee7ee63          	bltu	a5,a4,804086c8 <do_execve+0x74c>
80407fd0:	00060d13          	mv	s10,a2
80407fd4:	00050413          	mv	s0,a0
80407fd8:	00058993          	mv	s3,a1
80407fdc:	03300613          	li	a2,51
80407fe0:	00000593          	li	a1,0
80407fe4:	04810513          	addi	a0,sp,72
80407fe8:	7240a0ef          	jal	ra,8041270c <memset>
80407fec:	000b0e63          	beqz	s6,80408008 <do_execve+0x8c>
80407ff0:	01cb0513          	addi	a0,s6,28
80407ff4:	8ccfd0ef          	jal	ra,804050c0 <down>
80407ff8:	000a2783          	lw	a5,0(s4)
80407ffc:	00078663          	beqz	a5,80408008 <do_execve+0x8c>
80408000:	0047a783          	lw	a5,4(a5)
80408004:	02fb2423          	sw	a5,40(s6)
80408008:	1e040863          	beqz	s0,804081f8 <do_execve+0x27c>
8040800c:	03300693          	li	a3,51
80408010:	00040613          	mv	a2,s0
80408014:	04810593          	addi	a1,sp,72
80408018:	000b0513          	mv	a0,s6
8040801c:	db5fc0ef          	jal	ra,80404dd0 <copy_string>
80408020:	020500e3          	beqz	a0,80408840 <do_execve+0x8c4>
80408024:	00299493          	slli	s1,s3,0x2
80408028:	00000693          	li	a3,0
8040802c:	00048613          	mv	a2,s1
80408030:	000d0593          	mv	a1,s10
80408034:	000b0513          	mv	a0,s6
80408038:	000d0c13          	mv	s8,s10
8040803c:	c01fc0ef          	jal	ra,80404c3c <user_mem_check>
80408040:	7e050a63          	beqz	a0,80408834 <do_execve+0x8b8>
80408044:	0b010913          	addi	s2,sp,176
80408048:	00090c93          	mv	s9,s2
8040804c:	00000413          	li	s0,0
80408050:	00001537          	lui	a0,0x1
80408054:	931fa0ef          	jal	ra,80402984 <kmalloc>
80408058:	00050a93          	mv	s5,a0
8040805c:	10050863          	beqz	a0,8040816c <do_execve+0x1f0>
80408060:	000c2603          	lw	a2,0(s8)
80408064:	00050593          	mv	a1,a0
80408068:	000016b7          	lui	a3,0x1
8040806c:	000b0513          	mv	a0,s6
80408070:	d61fc0ef          	jal	ra,80404dd0 <copy_string>
80408074:	16050a63          	beqz	a0,804081e8 <do_execve+0x26c>
80408078:	015ca023          	sw	s5,0(s9)
8040807c:	00140413          	addi	s0,s0,1
80408080:	004c8c93          	addi	s9,s9,4
80408084:	004c0c13          	addi	s8,s8,4
80408088:	fc8994e3          	bne	s3,s0,80408050 <do_execve+0xd4>
8040808c:	000d2a83          	lw	s5,0(s10)
80408090:	080b0c63          	beqz	s6,80408128 <do_execve+0x1ac>
80408094:	01cb0513          	addi	a0,s6,28
80408098:	824fd0ef          	jal	ra,804050bc <up>
8040809c:	000a2783          	lw	a5,0(s4)
804080a0:	020b2423          	sw	zero,40(s6)
804080a4:	0dc7a503          	lw	a0,220(a5)
804080a8:	ab0fe0ef          	jal	ra,80406358 <files_closeall>
804080ac:	00000593          	li	a1,0
804080b0:	000a8513          	mv	a0,s5
804080b4:	e78fe0ef          	jal	ra,8040672c <sysfile_open>
804080b8:	00050c13          	mv	s8,a0
804080bc:	7e054c63          	bltz	a0,804088b4 <do_execve+0x938>
804080c0:	00094797          	auipc	a5,0x94
804080c4:	74478793          	addi	a5,a5,1860 # 8049c804 <boot_cr3>
804080c8:	0007a783          	lw	a5,0(a5)
804080cc:	80000737          	lui	a4,0x80000
804080d0:	00c7d793          	srli	a5,a5,0xc
804080d4:	00e7e7b3          	or	a5,a5,a4
804080d8:	18079073          	csrw	satp,a5
804080dc:	12000073          	sfence.vma
804080e0:	018b2783          	lw	a5,24(s6)
804080e4:	fff78793          	addi	a5,a5,-1
804080e8:	00fb2c23          	sw	a5,24(s6)
804080ec:	3c078e63          	beqz	a5,804084c8 <do_execve+0x54c>
804080f0:	000a2783          	lw	a5,0(s4)
804080f4:	0007ac23          	sw	zero,24(a5)
804080f8:	cf4fc0ef          	jal	ra,804045ec <mm_create>
804080fc:	00050b13          	mv	s6,a0
80408100:	00050c63          	beqz	a0,80408118 <do_execve+0x19c>
80408104:	00c50513          	addi	a0,a0,12 # 100c <_binary_bin_swap_img_size-0x6ff4>
80408108:	fd9fe0ef          	jal	ra,804070e0 <setup_pgdir.isra.4>
8040810c:	10050663          	beqz	a0,80408218 <do_execve+0x29c>
80408110:	000b0513          	mv	a0,s6
80408114:	e9cfc0ef          	jal	ra,804047b0 <mm_destroy>
80408118:	ffc00a93          	li	s5,-4
8040811c:	ffc48413          	addi	s0,s1,-4
80408120:	00890433          	add	s0,s2,s0
80408124:	58c0006f          	j	804086b0 <do_execve+0x734>
80408128:	000a2783          	lw	a5,0(s4)
8040812c:	0dc7a503          	lw	a0,220(a5)
80408130:	a28fe0ef          	jal	ra,80406358 <files_closeall>
80408134:	00000593          	li	a1,0
80408138:	000a8513          	mv	a0,s5
8040813c:	df0fe0ef          	jal	ra,8040672c <sysfile_open>
80408140:	00050c13          	mv	s8,a0
80408144:	76054863          	bltz	a0,804088b4 <do_execve+0x938>
80408148:	000a2783          	lw	a5,0(s4)
8040814c:	0187a783          	lw	a5,24(a5)
80408150:	fa0784e3          	beqz	a5,804080f8 <do_execve+0x17c>
80408154:	0000c617          	auipc	a2,0xc
80408158:	25c60613          	addi	a2,a2,604 # 804143b0 <CSWTCH.69+0x454>
8040815c:	27a00593          	li	a1,634
80408160:	0000c517          	auipc	a0,0xc
80408164:	68450513          	addi	a0,a0,1668 # 804147e4 <CSWTCH.69+0x888>
80408168:	cbcf80ef          	jal	ra,80400624 <__panic>
8040816c:	ffc00a93          	li	s5,-4
80408170:	02040463          	beqz	s0,80408198 <do_execve+0x21c>
80408174:	fff40413          	addi	s0,s0,-1
80408178:	00241413          	slli	s0,s0,0x2
8040817c:	00890433          	add	s0,s2,s0
80408180:	0080006f          	j	80408188 <do_execve+0x20c>
80408184:	00078413          	mv	s0,a5
80408188:	00042503          	lw	a0,0(s0)
8040818c:	91dfa0ef          	jal	ra,80402aa8 <kfree>
80408190:	ffc40793          	addi	a5,s0,-4
80408194:	fe8918e3          	bne	s2,s0,80408184 <do_execve+0x208>
80408198:	000b0863          	beqz	s6,804081a8 <do_execve+0x22c>
8040819c:	01cb0513          	addi	a0,s6,28
804081a0:	f1dfc0ef          	jal	ra,804050bc <up>
804081a4:	020b2423          	sw	zero,40(s6)
804081a8:	16c12083          	lw	ra,364(sp)
804081ac:	16812403          	lw	s0,360(sp)
804081b0:	000a8513          	mv	a0,s5
804081b4:	16412483          	lw	s1,356(sp)
804081b8:	16012903          	lw	s2,352(sp)
804081bc:	15c12983          	lw	s3,348(sp)
804081c0:	15812a03          	lw	s4,344(sp)
804081c4:	15412a83          	lw	s5,340(sp)
804081c8:	15012b03          	lw	s6,336(sp)
804081cc:	14c12b83          	lw	s7,332(sp)
804081d0:	14812c03          	lw	s8,328(sp)
804081d4:	14412c83          	lw	s9,324(sp)
804081d8:	14012d03          	lw	s10,320(sp)
804081dc:	13c12d83          	lw	s11,316(sp)
804081e0:	17010113          	addi	sp,sp,368
804081e4:	00008067          	ret
804081e8:	000a8513          	mv	a0,s5
804081ec:	8bdfa0ef          	jal	ra,80402aa8 <kfree>
804081f0:	ffd00a93          	li	s5,-3
804081f4:	f7dff06f          	j	80408170 <do_execve+0x1f4>
804081f8:	000a2783          	lw	a5,0(s4)
804081fc:	0000c617          	auipc	a2,0xc
80408200:	1a860613          	addi	a2,a2,424 # 804143a4 <CSWTCH.69+0x448>
80408204:	03300593          	li	a1,51
80408208:	0047a683          	lw	a3,4(a5)
8040820c:	04810513          	addi	a0,sp,72
80408210:	3e00a0ef          	jal	ra,804125f0 <snprintf>
80408214:	e11ff06f          	j	80408024 <do_execve+0xa8>
80408218:	00000693          	li	a3,0
8040821c:	03400613          	li	a2,52
80408220:	07c10593          	addi	a1,sp,124
80408224:	000c0513          	mv	a0,s8
80408228:	d6dfe0ef          	jal	ra,80406f94 <load_icode_read>
8040822c:	00050a93          	mv	s5,a0
80408230:	22051863          	bnez	a0,80408460 <do_execve+0x4e4>
80408234:	07c12703          	lw	a4,124(sp)
80408238:	464c47b7          	lui	a5,0x464c4
8040823c:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644c57f>
80408240:	20f71e63          	bne	a4,a5,8040845c <do_execve+0x4e0>
80408244:	0a815783          	lhu	a5,168(sp)
80408248:	00012e23          	sw	zero,28(sp)
8040824c:	04078c63          	beqz	a5,804082a4 <do_execve+0x328>
80408250:	001007b7          	lui	a5,0x100
80408254:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
80408258:	00f12c23          	sw	a5,24(sp)
8040825c:	01c12783          	lw	a5,28(sp)
80408260:	09812683          	lw	a3,152(sp)
80408264:	02000613          	li	a2,32
80408268:	00579793          	slli	a5,a5,0x5
8040826c:	00d786b3          	add	a3,a5,a3
80408270:	02810593          	addi	a1,sp,40
80408274:	000c0513          	mv	a0,s8
80408278:	d1dfe0ef          	jal	ra,80406f94 <load_icode_read>
8040827c:	00050a93          	mv	s5,a0
80408280:	40051663          	bnez	a0,8040868c <do_execve+0x710>
80408284:	02812703          	lw	a4,40(sp)
80408288:	00100793          	li	a5,1
8040828c:	2af70663          	beq	a4,a5,80408538 <do_execve+0x5bc>
80408290:	01c12703          	lw	a4,28(sp)
80408294:	0a815783          	lhu	a5,168(sp)
80408298:	00170713          	addi	a4,a4,1 # 80000001 <end+0xffb63745>
8040829c:	00e12e23          	sw	a4,28(sp)
804082a0:	faf76ee3          	bltu	a4,a5,8040825c <do_execve+0x2e0>
804082a4:	000c0513          	mv	a0,s8
804082a8:	cdcfe0ef          	jal	ra,80406784 <sysfile_close>
804082ac:	00000713          	li	a4,0
804082b0:	00b00693          	li	a3,11
804082b4:	00100637          	lui	a2,0x100
804082b8:	7ff005b7          	lui	a1,0x7ff00
804082bc:	000b0513          	mv	a0,s6
804082c0:	d64fc0ef          	jal	ra,80404824 <mm_map>
804082c4:	00050a93          	mv	s5,a0
804082c8:	3c051263          	bnez	a0,8040868c <do_execve+0x710>
804082cc:	00cb2503          	lw	a0,12(s6)
804082d0:	01f00613          	li	a2,31
804082d4:	7ffff5b7          	lui	a1,0x7ffff
804082d8:	be8fb0ef          	jal	ra,804036c0 <pgdir_alloc_page>
804082dc:	66050863          	beqz	a0,8040894c <do_execve+0x9d0>
804082e0:	00cb2503          	lw	a0,12(s6)
804082e4:	01f00613          	li	a2,31
804082e8:	7fffe5b7          	lui	a1,0x7fffe
804082ec:	bd4fb0ef          	jal	ra,804036c0 <pgdir_alloc_page>
804082f0:	62050e63          	beqz	a0,8040892c <do_execve+0x9b0>
804082f4:	00cb2503          	lw	a0,12(s6)
804082f8:	01f00613          	li	a2,31
804082fc:	7fffd5b7          	lui	a1,0x7fffd
80408300:	bc0fb0ef          	jal	ra,804036c0 <pgdir_alloc_page>
80408304:	60050463          	beqz	a0,8040890c <do_execve+0x990>
80408308:	00cb2503          	lw	a0,12(s6)
8040830c:	01f00613          	li	a2,31
80408310:	7fffc5b7          	lui	a1,0x7fffc
80408314:	bacfb0ef          	jal	ra,804036c0 <pgdir_alloc_page>
80408318:	5c050a63          	beqz	a0,804088ec <do_execve+0x970>
8040831c:	018b2783          	lw	a5,24(s6)
80408320:	000a2703          	lw	a4,0(s4)
80408324:	00cb2683          	lw	a3,12(s6)
80408328:	00178793          	addi	a5,a5,1
8040832c:	00fb2c23          	sw	a5,24(s6)
80408330:	01672c23          	sw	s6,24(a4)
80408334:	804007b7          	lui	a5,0x80400
80408338:	52f6e863          	bltu	a3,a5,80408868 <do_execve+0x8ec>
8040833c:	00094797          	auipc	a5,0x94
80408340:	4c478793          	addi	a5,a5,1220 # 8049c800 <va_pa_offset>
80408344:	0007a783          	lw	a5,0(a5)
80408348:	40f686b3          	sub	a3,a3,a5
8040834c:	00c6d793          	srli	a5,a3,0xc
80408350:	04d72c23          	sw	a3,88(a4)
80408354:	80000737          	lui	a4,0x80000
80408358:	00e7e7b3          	or	a5,a5,a4
8040835c:	18079073          	csrw	satp,a5
80408360:	12000073          	sfence.vma
80408364:	00000c93          	li	s9,0
80408368:	00090c13          	mv	s8,s2
8040836c:	00000b93          	li	s7,0
80408370:	000c2503          	lw	a0,0(s8)
80408374:	000015b7          	lui	a1,0x1
80408378:	001b8b93          	addi	s7,s7,1
8040837c:	2dc0a0ef          	jal	ra,80412658 <strnlen>
80408380:	00150513          	addi	a0,a0,1
80408384:	00ac8cb3          	add	s9,s9,a0
80408388:	004c0c13          	addi	s8,s8,4
8040838c:	ff3be2e3          	bltu	s7,s3,80408370 <do_execve+0x3f4>
80408390:	fffccc93          	not	s9,s9
80408394:	800007b7          	lui	a5,0x80000
80408398:	ffccfc93          	andi	s9,s9,-4
8040839c:	00fc8cb3          	add	s9,s9,a5
804083a0:	409c8b33          	sub	s6,s9,s1
804083a4:	412b07b3          	sub	a5,s6,s2
804083a8:	00090c13          	mv	s8,s2
804083ac:	00000d93          	li	s11,0
804083b0:	00000b93          	li	s7,0
804083b4:	00f12623          	sw	a5,12(sp)
804083b8:	000c2d03          	lw	s10,0(s8)
804083bc:	017c8533          	add	a0,s9,s7
804083c0:	001d8d93          	addi	s11,s11,1
804083c4:	000d0593          	mv	a1,s10
804083c8:	2cc0a0ef          	jal	ra,80412694 <strcpy>
804083cc:	00c12783          	lw	a5,12(sp)
804083d0:	000015b7          	lui	a1,0x1
804083d4:	01878733          	add	a4,a5,s8
804083d8:	00a72023          	sw	a0,0(a4) # 80000000 <end+0xffb63744>
804083dc:	000d0513          	mv	a0,s10
804083e0:	2780a0ef          	jal	ra,80412658 <strnlen>
804083e4:	01750bb3          	add	s7,a0,s7
804083e8:	001b8b93          	addi	s7,s7,1
804083ec:	004c0c13          	addi	s8,s8,4
804083f0:	fd3de4e3          	bltu	s11,s3,804083b8 <do_execve+0x43c>
804083f4:	000a2783          	lw	a5,0(s4)
804083f8:	fe8b2e23          	sw	s0,-4(s6)
804083fc:	09000613          	li	a2,144
80408400:	0547a403          	lw	s0,84(a5) # 80000054 <end+0xffb63798>
80408404:	00000593          	li	a1,0
80408408:	ffcb0b13          	addi	s6,s6,-4
8040840c:	00040513          	mv	a0,s0
80408410:	08042983          	lw	s3,128(s0)
80408414:	2f80a0ef          	jal	ra,8041270c <memset>
80408418:	09412783          	lw	a5,148(sp)
8040841c:	edf9f993          	andi	s3,s3,-289
80408420:	ffc48493          	addi	s1,s1,-4
80408424:	01642423          	sw	s6,8(s0)
80408428:	08f42223          	sw	a5,132(s0)
8040842c:	09342023          	sw	s3,128(s0)
80408430:	009904b3          	add	s1,s2,s1
80408434:	0080006f          	j	8040843c <do_execve+0x4c0>
80408438:	00078493          	mv	s1,a5
8040843c:	0004a503          	lw	a0,0(s1)
80408440:	e68fa0ef          	jal	ra,80402aa8 <kfree>
80408444:	ffc48793          	addi	a5,s1,-4
80408448:	fe9918e3          	bne	s2,s1,80408438 <do_execve+0x4bc>
8040844c:	000a2503          	lw	a0,0(s4)
80408450:	04810593          	addi	a1,sp,72
80408454:	d99fe0ef          	jal	ra,804071ec <set_proc_name>
80408458:	d51ff06f          	j	804081a8 <do_execve+0x22c>
8040845c:	ff800a93          	li	s5,-8
80408460:	00cb2683          	lw	a3,12(s6)
80408464:	804007b7          	lui	a5,0x80400
80408468:	44f6ea63          	bltu	a3,a5,804088bc <do_execve+0x940>
8040846c:	00094797          	auipc	a5,0x94
80408470:	39478793          	addi	a5,a5,916 # 8049c800 <va_pa_offset>
80408474:	0007a703          	lw	a4,0(a5)
80408478:	00094797          	auipc	a5,0x94
8040847c:	32078793          	addi	a5,a5,800 # 8049c798 <npage>
80408480:	0007a783          	lw	a5,0(a5)
80408484:	40e686b3          	sub	a3,a3,a4
80408488:	00c6d693          	srli	a3,a3,0xc
8040848c:	44f6f463          	bgeu	a3,a5,804088d4 <do_execve+0x958>
80408490:	0000e797          	auipc	a5,0xe
80408494:	bd478793          	addi	a5,a5,-1068 # 80416064 <nbase>
80408498:	0007a783          	lw	a5,0(a5)
8040849c:	00094717          	auipc	a4,0x94
804084a0:	36c70713          	addi	a4,a4,876 # 8049c808 <pages>
804084a4:	00072503          	lw	a0,0(a4)
804084a8:	40f686b3          	sub	a3,a3,a5
804084ac:	00569693          	slli	a3,a3,0x5
804084b0:	00d50533          	add	a0,a0,a3
804084b4:	00100593          	li	a1,1
804084b8:	915fa0ef          	jal	ra,80402dcc <free_pages>
804084bc:	000b0513          	mv	a0,s6
804084c0:	af0fc0ef          	jal	ra,804047b0 <mm_destroy>
804084c4:	c59ff06f          	j	8040811c <do_execve+0x1a0>
804084c8:	000b0513          	mv	a0,s6
804084cc:	d30fc0ef          	jal	ra,804049fc <exit_mmap>
804084d0:	00cb2683          	lw	a3,12(s6)
804084d4:	804007b7          	lui	a5,0x80400
804084d8:	3ef6e263          	bltu	a3,a5,804088bc <do_execve+0x940>
804084dc:	00094797          	auipc	a5,0x94
804084e0:	32478793          	addi	a5,a5,804 # 8049c800 <va_pa_offset>
804084e4:	0007a703          	lw	a4,0(a5)
804084e8:	00094797          	auipc	a5,0x94
804084ec:	2b078793          	addi	a5,a5,688 # 8049c798 <npage>
804084f0:	0007a783          	lw	a5,0(a5)
804084f4:	40e686b3          	sub	a3,a3,a4
804084f8:	00c6d693          	srli	a3,a3,0xc
804084fc:	3cf6fc63          	bgeu	a3,a5,804088d4 <do_execve+0x958>
80408500:	0000e797          	auipc	a5,0xe
80408504:	b6478793          	addi	a5,a5,-1180 # 80416064 <nbase>
80408508:	0007a783          	lw	a5,0(a5)
8040850c:	00094717          	auipc	a4,0x94
80408510:	2fc70713          	addi	a4,a4,764 # 8049c808 <pages>
80408514:	00072503          	lw	a0,0(a4)
80408518:	40f686b3          	sub	a3,a3,a5
8040851c:	00569693          	slli	a3,a3,0x5
80408520:	00d50533          	add	a0,a0,a3
80408524:	00100593          	li	a1,1
80408528:	8a5fa0ef          	jal	ra,80402dcc <free_pages>
8040852c:	000b0513          	mv	a0,s6
80408530:	a80fc0ef          	jal	ra,804047b0 <mm_destroy>
80408534:	bbdff06f          	j	804080f0 <do_execve+0x174>
80408538:	03c12603          	lw	a2,60(sp)
8040853c:	03812783          	lw	a5,56(sp)
80408540:	32f66063          	bltu	a2,a5,80408860 <do_execve+0x8e4>
80408544:	04012783          	lw	a5,64(sp)
80408548:	0017f693          	andi	a3,a5,1
8040854c:	00068463          	beqz	a3,80408554 <do_execve+0x5d8>
80408550:	00400693          	li	a3,4
80408554:	0027f713          	andi	a4,a5,2
80408558:	0047f793          	andi	a5,a5,4
8040855c:	12071e63          	bnez	a4,80408698 <do_execve+0x71c>
80408560:	01100713          	li	a4,17
80408564:	00e12a23          	sw	a4,20(sp)
80408568:	00078863          	beqz	a5,80408578 <do_execve+0x5fc>
8040856c:	01300793          	li	a5,19
80408570:	0016e693          	ori	a3,a3,1
80408574:	00f12a23          	sw	a5,20(sp)
80408578:	0026f793          	andi	a5,a3,2
8040857c:	12079263          	bnez	a5,804086a0 <do_execve+0x724>
80408580:	0046f793          	andi	a5,a3,4
80408584:	00078863          	beqz	a5,80408594 <do_execve+0x618>
80408588:	01412783          	lw	a5,20(sp)
8040858c:	0087e793          	ori	a5,a5,8
80408590:	00f12a23          	sw	a5,20(sp)
80408594:	03012583          	lw	a1,48(sp)
80408598:	00000713          	li	a4,0
8040859c:	000b0513          	mv	a0,s6
804085a0:	a84fc0ef          	jal	ra,80404824 <mm_map>
804085a4:	00050a93          	mv	s5,a0
804085a8:	0e051263          	bnez	a0,8040868c <do_execve+0x710>
804085ac:	03012d83          	lw	s11,48(sp)
804085b0:	03812783          	lw	a5,56(sp)
804085b4:	fffff737          	lui	a4,0xfffff
804085b8:	02c12c83          	lw	s9,44(sp)
804085bc:	00fd87b3          	add	a5,s11,a5
804085c0:	00f12623          	sw	a5,12(sp)
804085c4:	00edfd33          	and	s10,s11,a4
804085c8:	0afde463          	bltu	s11,a5,80408670 <do_execve+0x6f4>
804085cc:	28c0006f          	j	80408858 <do_execve+0x8dc>
804085d0:	000017b7          	lui	a5,0x1
804085d4:	41ad85b3          	sub	a1,s11,s10
804085d8:	00fd0d33          	add	s10,s10,a5
804085dc:	00c12783          	lw	a5,12(sp)
804085e0:	41bd08b3          	sub	a7,s10,s11
804085e4:	01a7f463          	bgeu	a5,s10,804085ec <do_execve+0x670>
804085e8:	41b788b3          	sub	a7,a5,s11
804085ec:	00094797          	auipc	a5,0x94
804085f0:	21c78793          	addi	a5,a5,540 # 8049c808 <pages>
804085f4:	0007a783          	lw	a5,0(a5)
804085f8:	0000e717          	auipc	a4,0xe
804085fc:	a6c70713          	addi	a4,a4,-1428 # 80416064 <nbase>
80408600:	00072603          	lw	a2,0(a4)
80408604:	00094717          	auipc	a4,0x94
80408608:	19470713          	addi	a4,a4,404 # 8049c798 <npage>
8040860c:	00072683          	lw	a3,0(a4)
80408610:	40fb87b3          	sub	a5,s7,a5
80408614:	01812703          	lw	a4,24(sp)
80408618:	4057d793          	srai	a5,a5,0x5
8040861c:	00c787b3          	add	a5,a5,a2
80408620:	00e7f633          	and	a2,a5,a4
80408624:	00c79793          	slli	a5,a5,0xc
80408628:	26d67863          	bgeu	a2,a3,80408898 <do_execve+0x91c>
8040862c:	00094717          	auipc	a4,0x94
80408630:	1d470713          	addi	a4,a4,468 # 8049c800 <va_pa_offset>
80408634:	00072503          	lw	a0,0(a4)
80408638:	000c8693          	mv	a3,s9
8040863c:	00088613          	mv	a2,a7
80408640:	00a787b3          	add	a5,a5,a0
80408644:	00b785b3          	add	a1,a5,a1
80408648:	000c0513          	mv	a0,s8
8040864c:	01112823          	sw	a7,16(sp)
80408650:	945fe0ef          	jal	ra,80406f94 <load_icode_read>
80408654:	00050a93          	mv	s5,a0
80408658:	02051a63          	bnez	a0,8040868c <do_execve+0x710>
8040865c:	01012883          	lw	a7,16(sp)
80408660:	00c12783          	lw	a5,12(sp)
80408664:	011d8db3          	add	s11,s11,a7
80408668:	011c8cb3          	add	s9,s9,a7
8040866c:	06fdf263          	bgeu	s11,a5,804086d0 <do_execve+0x754>
80408670:	00cb2503          	lw	a0,12(s6)
80408674:	01412603          	lw	a2,20(sp)
80408678:	000d0593          	mv	a1,s10
8040867c:	844fb0ef          	jal	ra,804036c0 <pgdir_alloc_page>
80408680:	00050b93          	mv	s7,a0
80408684:	f40516e3          	bnez	a0,804085d0 <do_execve+0x654>
80408688:	ffc00a93          	li	s5,-4
8040868c:	000b0513          	mv	a0,s6
80408690:	b6cfc0ef          	jal	ra,804049fc <exit_mmap>
80408694:	dcdff06f          	j	80408460 <do_execve+0x4e4>
80408698:	0026e693          	ori	a3,a3,2
8040869c:	ec0798e3          	bnez	a5,8040856c <do_execve+0x5f0>
804086a0:	01700793          	li	a5,23
804086a4:	00f12a23          	sw	a5,20(sp)
804086a8:	ed9ff06f          	j	80408580 <do_execve+0x604>
804086ac:	00078413          	mv	s0,a5
804086b0:	00042503          	lw	a0,0(s0)
804086b4:	bf4fa0ef          	jal	ra,80402aa8 <kfree>
804086b8:	ffc40793          	addi	a5,s0,-4
804086bc:	fe8918e3          	bne	s2,s0,804086ac <do_execve+0x730>
804086c0:	000a8513          	mv	a0,s5
804086c4:	a9cff0ef          	jal	ra,80407960 <do_exit>
804086c8:	ffd00a93          	li	s5,-3
804086cc:	addff06f          	j	804081a8 <do_execve+0x22c>
804086d0:	03012783          	lw	a5,48(sp)
804086d4:	03c12a83          	lw	s5,60(sp)
804086d8:	01578ab3          	add	s5,a5,s5
804086dc:	0badfa63          	bgeu	s11,s10,80408790 <do_execve+0x814>
804086e0:	bbba88e3          	beq	s5,s11,80408290 <do_execve+0x314>
804086e4:	00001537          	lui	a0,0x1
804086e8:	00ad8533          	add	a0,s11,a0
804086ec:	41a50533          	sub	a0,a0,s10
804086f0:	41ba8cb3          	sub	s9,s5,s11
804086f4:	01aae463          	bltu	s5,s10,804086fc <do_execve+0x780>
804086f8:	41bd0cb3          	sub	s9,s10,s11
804086fc:	00094797          	auipc	a5,0x94
80408700:	10c78793          	addi	a5,a5,268 # 8049c808 <pages>
80408704:	0007a783          	lw	a5,0(a5)
80408708:	0000e717          	auipc	a4,0xe
8040870c:	95c70713          	addi	a4,a4,-1700 # 80416064 <nbase>
80408710:	00072683          	lw	a3,0(a4)
80408714:	00094717          	auipc	a4,0x94
80408718:	08470713          	addi	a4,a4,132 # 8049c798 <npage>
8040871c:	00072603          	lw	a2,0(a4)
80408720:	40fb87b3          	sub	a5,s7,a5
80408724:	01812703          	lw	a4,24(sp)
80408728:	4057d793          	srai	a5,a5,0x5
8040872c:	00d787b3          	add	a5,a5,a3
80408730:	00e7f5b3          	and	a1,a5,a4
80408734:	00c79693          	slli	a3,a5,0xc
80408738:	14c5f463          	bgeu	a1,a2,80408880 <do_execve+0x904>
8040873c:	00094797          	auipc	a5,0x94
80408740:	0c478793          	addi	a5,a5,196 # 8049c800 <va_pa_offset>
80408744:	0007a783          	lw	a5,0(a5)
80408748:	000c8613          	mv	a2,s9
8040874c:	00000593          	li	a1,0
80408750:	00f687b3          	add	a5,a3,a5
80408754:	00a78533          	add	a0,a5,a0
80408758:	7b5090ef          	jal	ra,8041270c <memset>
8040875c:	01bc8833          	add	a6,s9,s11
80408760:	03aaf463          	bgeu	s5,s10,80408788 <do_execve+0x80c>
80408764:	b30a86e3          	beq	s5,a6,80408290 <do_execve+0x314>
80408768:	0000c697          	auipc	a3,0xc
8040876c:	c7068693          	addi	a3,a3,-912 # 804143d8 <CSWTCH.69+0x47c>
80408770:	0000a617          	auipc	a2,0xa
80408774:	3cc60613          	addi	a2,a2,972 # 80412b3c <commands+0x1bc>
80408778:	2d100593          	li	a1,721
8040877c:	0000c517          	auipc	a0,0xc
80408780:	06850513          	addi	a0,a0,104 # 804147e4 <CSWTCH.69+0x888>
80408784:	ea1f70ef          	jal	ra,80400624 <__panic>
80408788:	ffa810e3          	bne	a6,s10,80408768 <do_execve+0x7ec>
8040878c:	000d0d93          	mv	s11,s10
80408790:	00094c97          	auipc	s9,0x94
80408794:	070c8c93          	addi	s9,s9,112 # 8049c800 <va_pa_offset>
80408798:	075dee63          	bltu	s11,s5,80408814 <do_execve+0x898>
8040879c:	af5ff06f          	j	80408290 <do_execve+0x314>
804087a0:	000017b7          	lui	a5,0x1
804087a4:	41ad8533          	sub	a0,s11,s10
804087a8:	00fd0d33          	add	s10,s10,a5
804087ac:	41bd0633          	sub	a2,s10,s11
804087b0:	01aaf463          	bgeu	s5,s10,804087b8 <do_execve+0x83c>
804087b4:	41ba8633          	sub	a2,s5,s11
804087b8:	00094797          	auipc	a5,0x94
804087bc:	05078793          	addi	a5,a5,80 # 8049c808 <pages>
804087c0:	0007a683          	lw	a3,0(a5)
804087c4:	0000e797          	auipc	a5,0xe
804087c8:	8a078793          	addi	a5,a5,-1888 # 80416064 <nbase>
804087cc:	0007a583          	lw	a1,0(a5)
804087d0:	40db86b3          	sub	a3,s7,a3
804087d4:	00094797          	auipc	a5,0x94
804087d8:	fc478793          	addi	a5,a5,-60 # 8049c798 <npage>
804087dc:	01812703          	lw	a4,24(sp)
804087e0:	4056d693          	srai	a3,a3,0x5
804087e4:	0007a783          	lw	a5,0(a5)
804087e8:	00b686b3          	add	a3,a3,a1
804087ec:	00e6f5b3          	and	a1,a3,a4
804087f0:	00c69693          	slli	a3,a3,0xc
804087f4:	08f5f663          	bgeu	a1,a5,80408880 <do_execve+0x904>
804087f8:	000ca783          	lw	a5,0(s9)
804087fc:	00cd8db3          	add	s11,s11,a2
80408800:	00000593          	li	a1,0
80408804:	00f686b3          	add	a3,a3,a5
80408808:	00a68533          	add	a0,a3,a0
8040880c:	701090ef          	jal	ra,8041270c <memset>
80408810:	a95df0e3          	bgeu	s11,s5,80408290 <do_execve+0x314>
80408814:	00cb2503          	lw	a0,12(s6)
80408818:	01412603          	lw	a2,20(sp)
8040881c:	000d0593          	mv	a1,s10
80408820:	ea1fa0ef          	jal	ra,804036c0 <pgdir_alloc_page>
80408824:	00050b93          	mv	s7,a0
80408828:	f6051ce3          	bnez	a0,804087a0 <do_execve+0x824>
8040882c:	ffc00a93          	li	s5,-4
80408830:	e5dff06f          	j	8040868c <do_execve+0x710>
80408834:	ffd00a93          	li	s5,-3
80408838:	960b12e3          	bnez	s6,8040819c <do_execve+0x220>
8040883c:	96dff06f          	j	804081a8 <do_execve+0x22c>
80408840:	e80b04e3          	beqz	s6,804086c8 <do_execve+0x74c>
80408844:	01cb0513          	addi	a0,s6,28
80408848:	875fc0ef          	jal	ra,804050bc <up>
8040884c:	ffd00a93          	li	s5,-3
80408850:	020b2423          	sw	zero,40(s6)
80408854:	955ff06f          	j	804081a8 <do_execve+0x22c>
80408858:	000d8793          	mv	a5,s11
8040885c:	e79ff06f          	j	804086d4 <do_execve+0x758>
80408860:	ff800a93          	li	s5,-8
80408864:	e29ff06f          	j	8040868c <do_execve+0x710>
80408868:	0000b617          	auipc	a2,0xb
8040886c:	e7460613          	addi	a2,a2,-396 # 804136dc <default_pmm_manager+0x64>
80408870:	2ed00593          	li	a1,749
80408874:	0000c517          	auipc	a0,0xc
80408878:	f7050513          	addi	a0,a0,-144 # 804147e4 <CSWTCH.69+0x888>
8040887c:	da9f70ef          	jal	ra,80400624 <__panic>
80408880:	0000b617          	auipc	a2,0xb
80408884:	e2860613          	addi	a2,a2,-472 # 804136a8 <default_pmm_manager+0x30>
80408888:	06e00593          	li	a1,110
8040888c:	0000b517          	auipc	a0,0xb
80408890:	e4050513          	addi	a0,a0,-448 # 804136cc <default_pmm_manager+0x54>
80408894:	d91f70ef          	jal	ra,80400624 <__panic>
80408898:	00078693          	mv	a3,a5
8040889c:	0000b617          	auipc	a2,0xb
804088a0:	e0c60613          	addi	a2,a2,-500 # 804136a8 <default_pmm_manager+0x30>
804088a4:	06e00593          	li	a1,110
804088a8:	0000b517          	auipc	a0,0xb
804088ac:	e2450513          	addi	a0,a0,-476 # 804136cc <default_pmm_manager+0x54>
804088b0:	d75f70ef          	jal	ra,80400624 <__panic>
804088b4:	000c0a93          	mv	s5,s8
804088b8:	865ff06f          	j	8040811c <do_execve+0x1a0>
804088bc:	0000b617          	auipc	a2,0xb
804088c0:	e2060613          	addi	a2,a2,-480 # 804136dc <default_pmm_manager+0x64>
804088c4:	07000593          	li	a1,112
804088c8:	0000b517          	auipc	a0,0xb
804088cc:	e0450513          	addi	a0,a0,-508 # 804136cc <default_pmm_manager+0x54>
804088d0:	d55f70ef          	jal	ra,80400624 <__panic>
804088d4:	0000b617          	auipc	a2,0xb
804088d8:	e2c60613          	addi	a2,a2,-468 # 80413700 <default_pmm_manager+0x88>
804088dc:	06900593          	li	a1,105
804088e0:	0000b517          	auipc	a0,0xb
804088e4:	dec50513          	addi	a0,a0,-532 # 804136cc <default_pmm_manager+0x54>
804088e8:	d3df70ef          	jal	ra,80400624 <__panic>
804088ec:	0000c697          	auipc	a3,0xc
804088f0:	bf468693          	addi	a3,a3,-1036 # 804144e0 <CSWTCH.69+0x584>
804088f4:	0000a617          	auipc	a2,0xa
804088f8:	24860613          	addi	a2,a2,584 # 80412b3c <commands+0x1bc>
804088fc:	2e900593          	li	a1,745
80408900:	0000c517          	auipc	a0,0xc
80408904:	ee450513          	addi	a0,a0,-284 # 804147e4 <CSWTCH.69+0x888>
80408908:	d1df70ef          	jal	ra,80400624 <__panic>
8040890c:	0000c697          	auipc	a3,0xc
80408910:	b9068693          	addi	a3,a3,-1136 # 8041449c <CSWTCH.69+0x540>
80408914:	0000a617          	auipc	a2,0xa
80408918:	22860613          	addi	a2,a2,552 # 80412b3c <commands+0x1bc>
8040891c:	2e800593          	li	a1,744
80408920:	0000c517          	auipc	a0,0xc
80408924:	ec450513          	addi	a0,a0,-316 # 804147e4 <CSWTCH.69+0x888>
80408928:	cfdf70ef          	jal	ra,80400624 <__panic>
8040892c:	0000c697          	auipc	a3,0xc
80408930:	b2c68693          	addi	a3,a3,-1236 # 80414458 <CSWTCH.69+0x4fc>
80408934:	0000a617          	auipc	a2,0xa
80408938:	20860613          	addi	a2,a2,520 # 80412b3c <commands+0x1bc>
8040893c:	2e700593          	li	a1,743
80408940:	0000c517          	auipc	a0,0xc
80408944:	ea450513          	addi	a0,a0,-348 # 804147e4 <CSWTCH.69+0x888>
80408948:	cddf70ef          	jal	ra,80400624 <__panic>
8040894c:	0000c697          	auipc	a3,0xc
80408950:	ac868693          	addi	a3,a3,-1336 # 80414414 <CSWTCH.69+0x4b8>
80408954:	0000a617          	auipc	a2,0xa
80408958:	1e860613          	addi	a2,a2,488 # 80412b3c <commands+0x1bc>
8040895c:	2e600593          	li	a1,742
80408960:	0000c517          	auipc	a0,0xc
80408964:	e8450513          	addi	a0,a0,-380 # 804147e4 <CSWTCH.69+0x888>
80408968:	cbdf70ef          	jal	ra,80400624 <__panic>

8040896c <do_yield>:
8040896c:	00094797          	auipc	a5,0x94
80408970:	e4078793          	addi	a5,a5,-448 # 8049c7ac <current>
80408974:	0007a783          	lw	a5,0(a5)
80408978:	00100713          	li	a4,1
8040897c:	00000513          	li	a0,0
80408980:	00e7a823          	sw	a4,16(a5)
80408984:	00008067          	ret

80408988 <do_wait>:
80408988:	ff010113          	addi	sp,sp,-16
8040898c:	00812423          	sw	s0,8(sp)
80408990:	00912223          	sw	s1,4(sp)
80408994:	00112623          	sw	ra,12(sp)
80408998:	00058413          	mv	s0,a1
8040899c:	00050493          	mv	s1,a0
804089a0:	02058263          	beqz	a1,804089c4 <do_wait+0x3c>
804089a4:	00094797          	auipc	a5,0x94
804089a8:	e0878793          	addi	a5,a5,-504 # 8049c7ac <current>
804089ac:	0007a783          	lw	a5,0(a5)
804089b0:	00100693          	li	a3,1
804089b4:	00400613          	li	a2,4
804089b8:	0187a503          	lw	a0,24(a5)
804089bc:	a80fc0ef          	jal	ra,80404c3c <user_mem_check>
804089c0:	02050063          	beqz	a0,804089e0 <do_wait+0x58>
804089c4:	00040593          	mv	a1,s0
804089c8:	00812403          	lw	s0,8(sp)
804089cc:	00c12083          	lw	ra,12(sp)
804089d0:	00048513          	mv	a0,s1
804089d4:	00412483          	lw	s1,4(sp)
804089d8:	01010113          	addi	sp,sp,16
804089dc:	9c0ff06f          	j	80407b9c <do_wait.part.8>
804089e0:	00c12083          	lw	ra,12(sp)
804089e4:	00812403          	lw	s0,8(sp)
804089e8:	00412483          	lw	s1,4(sp)
804089ec:	ffd00513          	li	a0,-3
804089f0:	01010113          	addi	sp,sp,16
804089f4:	00008067          	ret

804089f8 <do_kill>:
804089f8:	ff010113          	addi	sp,sp,-16
804089fc:	00112623          	sw	ra,12(sp)
80408a00:	00812423          	sw	s0,8(sp)
80408a04:	8d5fe0ef          	jal	ra,804072d8 <find_proc>
80408a08:	04050c63          	beqz	a0,80408a60 <do_kill+0x68>
80408a0c:	05c52703          	lw	a4,92(a0)
80408a10:	00177693          	andi	a3,a4,1
80408a14:	04069263          	bnez	a3,80408a58 <do_kill+0x60>
80408a18:	0a852683          	lw	a3,168(a0)
80408a1c:	00176713          	ori	a4,a4,1
80408a20:	04e52e23          	sw	a4,92(a0)
80408a24:	00000413          	li	s0,0
80408a28:	0006cc63          	bltz	a3,80408a40 <do_kill+0x48>
80408a2c:	00040513          	mv	a0,s0
80408a30:	00c12083          	lw	ra,12(sp)
80408a34:	00812403          	lw	s0,8(sp)
80408a38:	01010113          	addi	sp,sp,16
80408a3c:	00008067          	ret
80408a40:	691030ef          	jal	ra,8040c8d0 <wakeup_proc>
80408a44:	00040513          	mv	a0,s0
80408a48:	00c12083          	lw	ra,12(sp)
80408a4c:	00812403          	lw	s0,8(sp)
80408a50:	01010113          	addi	sp,sp,16
80408a54:	00008067          	ret
80408a58:	ff700413          	li	s0,-9
80408a5c:	fd1ff06f          	j	80408a2c <do_kill+0x34>
80408a60:	ffd00413          	li	s0,-3
80408a64:	fc9ff06f          	j	80408a2c <do_kill+0x34>

80408a68 <proc_init>:
80408a68:	00002737          	lui	a4,0x2
80408a6c:	00094797          	auipc	a5,0x94
80408a70:	e4878793          	addi	a5,a5,-440 # 8049c8b4 <proc_list>
80408a74:	ff010113          	addi	sp,sp,-16
80408a78:	00090697          	auipc	a3,0x90
80408a7c:	5ce6a623          	sw	a4,1484(a3) # 80499044 <last_pid>
80408a80:	00090697          	auipc	a3,0x90
80408a84:	5ce6a423          	sw	a4,1480(a3) # 80499048 <next_safe>
80408a88:	00094717          	auipc	a4,0x94
80408a8c:	e2f72823          	sw	a5,-464(a4) # 8049c8b8 <proc_list+0x4>
80408a90:	00094717          	auipc	a4,0x94
80408a94:	e2f72223          	sw	a5,-476(a4) # 8049c8b4 <proc_list>
80408a98:	00112623          	sw	ra,12(sp)
80408a9c:	00812423          	sw	s0,8(sp)
80408aa0:	00912223          	sw	s1,4(sp)
80408aa4:	01212023          	sw	s2,0(sp)
80408aa8:	00091797          	auipc	a5,0x91
80408aac:	ca078793          	addi	a5,a5,-864 # 80499748 <hash_list>
80408ab0:	00093717          	auipc	a4,0x93
80408ab4:	c9870713          	addi	a4,a4,-872 # 8049b748 <__rq>
80408ab8:	00f7a223          	sw	a5,4(a5)
80408abc:	00f7a023          	sw	a5,0(a5)
80408ac0:	00878793          	addi	a5,a5,8
80408ac4:	fee79ae3          	bne	a5,a4,80408ab8 <proc_init+0x50>
80408ac8:	bd4fe0ef          	jal	ra,80406e9c <alloc_proc>
80408acc:	00094797          	auipc	a5,0x94
80408ad0:	cea7a223          	sw	a0,-796(a5) # 8049c7b0 <idleproc>
80408ad4:	00050413          	mv	s0,a0
80408ad8:	00094497          	auipc	s1,0x94
80408adc:	cd848493          	addi	s1,s1,-808 # 8049c7b0 <idleproc>
80408ae0:	0e050263          	beqz	a0,80408bc4 <proc_init+0x15c>
80408ae4:	00200793          	li	a5,2
80408ae8:	00f52023          	sw	a5,0(a0)
80408aec:	00100913          	li	s2,1
80408af0:	0000e797          	auipc	a5,0xe
80408af4:	51078793          	addi	a5,a5,1296 # 80417000 <bootstack>
80408af8:	00052223          	sw	zero,4(a0)
80408afc:	00f52623          	sw	a5,12(a0)
80408b00:	01252823          	sw	s2,16(a0)
80408b04:	f34fd0ef          	jal	ra,80406238 <files_create>
80408b08:	0ca42e23          	sw	a0,220(s0)
80408b0c:	12050463          	beqz	a0,80408c34 <proc_init+0x1cc>
80408b10:	0004a503          	lw	a0,0(s1)
80408b14:	0000c597          	auipc	a1,0xc
80408b18:	c0c58593          	addi	a1,a1,-1012 # 80414720 <CSWTCH.69+0x7c4>
80408b1c:	0dc52703          	lw	a4,220(a0)
80408b20:	00872783          	lw	a5,8(a4)
80408b24:	00178793          	addi	a5,a5,1
80408b28:	00f72423          	sw	a5,8(a4)
80408b2c:	ec0fe0ef          	jal	ra,804071ec <set_proc_name>
80408b30:	00094797          	auipc	a5,0x94
80408b34:	c8878793          	addi	a5,a5,-888 # 8049c7b8 <nr_process>
80408b38:	0007a783          	lw	a5,0(a5)
80408b3c:	0004a703          	lw	a4,0(s1)
80408b40:	00000613          	li	a2,0
80408b44:	00178793          	addi	a5,a5,1
80408b48:	00000593          	li	a1,0
80408b4c:	fffff517          	auipc	a0,0xfffff
80408b50:	29450513          	addi	a0,a0,660 # 80407de0 <init_main>
80408b54:	00094697          	auipc	a3,0x94
80408b58:	c6f6a223          	sw	a5,-924(a3) # 8049c7b8 <nr_process>
80408b5c:	00094797          	auipc	a5,0x94
80408b60:	c4e7a823          	sw	a4,-944(a5) # 8049c7ac <current>
80408b64:	d81fe0ef          	jal	ra,804078e4 <kernel_thread>
80408b68:	0aa05a63          	blez	a0,80408c1c <proc_init+0x1b4>
80408b6c:	f6cfe0ef          	jal	ra,804072d8 <find_proc>
80408b70:	0000c597          	auipc	a1,0xc
80408b74:	bd458593          	addi	a1,a1,-1068 # 80414744 <CSWTCH.69+0x7e8>
80408b78:	00094797          	auipc	a5,0x94
80408b7c:	c2a7ae23          	sw	a0,-964(a5) # 8049c7b4 <initproc>
80408b80:	e6cfe0ef          	jal	ra,804071ec <set_proc_name>
80408b84:	0004a783          	lw	a5,0(s1)
80408b88:	06078a63          	beqz	a5,80408bfc <proc_init+0x194>
80408b8c:	0047a783          	lw	a5,4(a5)
80408b90:	06079663          	bnez	a5,80408bfc <proc_init+0x194>
80408b94:	00094797          	auipc	a5,0x94
80408b98:	c2078793          	addi	a5,a5,-992 # 8049c7b4 <initproc>
80408b9c:	0007a783          	lw	a5,0(a5)
80408ba0:	02078e63          	beqz	a5,80408bdc <proc_init+0x174>
80408ba4:	0047a783          	lw	a5,4(a5)
80408ba8:	03279a63          	bne	a5,s2,80408bdc <proc_init+0x174>
80408bac:	00c12083          	lw	ra,12(sp)
80408bb0:	00812403          	lw	s0,8(sp)
80408bb4:	00412483          	lw	s1,4(sp)
80408bb8:	00012903          	lw	s2,0(sp)
80408bbc:	01010113          	addi	sp,sp,16
80408bc0:	00008067          	ret
80408bc4:	0000c617          	auipc	a2,0xc
80408bc8:	b2060613          	addi	a2,a2,-1248 # 804146e4 <CSWTCH.69+0x788>
80408bcc:	43b00593          	li	a1,1083
80408bd0:	0000c517          	auipc	a0,0xc
80408bd4:	c1450513          	addi	a0,a0,-1004 # 804147e4 <CSWTCH.69+0x888>
80408bd8:	a4df70ef          	jal	ra,80400624 <__panic>
80408bdc:	0000c697          	auipc	a3,0xc
80408be0:	b9868693          	addi	a3,a3,-1128 # 80414774 <CSWTCH.69+0x818>
80408be4:	0000a617          	auipc	a2,0xa
80408be8:	f5860613          	addi	a2,a2,-168 # 80412b3c <commands+0x1bc>
80408bec:	45600593          	li	a1,1110
80408bf0:	0000c517          	auipc	a0,0xc
80408bf4:	bf450513          	addi	a0,a0,-1036 # 804147e4 <CSWTCH.69+0x888>
80408bf8:	a2df70ef          	jal	ra,80400624 <__panic>
80408bfc:	0000c697          	auipc	a3,0xc
80408c00:	b5068693          	addi	a3,a3,-1200 # 8041474c <CSWTCH.69+0x7f0>
80408c04:	0000a617          	auipc	a2,0xa
80408c08:	f3860613          	addi	a2,a2,-200 # 80412b3c <commands+0x1bc>
80408c0c:	45500593          	li	a1,1109
80408c10:	0000c517          	auipc	a0,0xc
80408c14:	bd450513          	addi	a0,a0,-1068 # 804147e4 <CSWTCH.69+0x888>
80408c18:	a0df70ef          	jal	ra,80400624 <__panic>
80408c1c:	0000c617          	auipc	a2,0xc
80408c20:	b0c60613          	addi	a2,a2,-1268 # 80414728 <CSWTCH.69+0x7cc>
80408c24:	44f00593          	li	a1,1103
80408c28:	0000c517          	auipc	a0,0xc
80408c2c:	bbc50513          	addi	a0,a0,-1092 # 804147e4 <CSWTCH.69+0x888>
80408c30:	9f5f70ef          	jal	ra,80400624 <__panic>
80408c34:	0000c617          	auipc	a2,0xc
80408c38:	ac860613          	addi	a2,a2,-1336 # 804146fc <CSWTCH.69+0x7a0>
80408c3c:	44400593          	li	a1,1092
80408c40:	0000c517          	auipc	a0,0xc
80408c44:	ba450513          	addi	a0,a0,-1116 # 804147e4 <CSWTCH.69+0x888>
80408c48:	9ddf70ef          	jal	ra,80400624 <__panic>

80408c4c <cpu_idle>:
80408c4c:	ff010113          	addi	sp,sp,-16
80408c50:	00812423          	sw	s0,8(sp)
80408c54:	00112623          	sw	ra,12(sp)
80408c58:	00094417          	auipc	s0,0x94
80408c5c:	b5440413          	addi	s0,s0,-1196 # 8049c7ac <current>
80408c60:	00042703          	lw	a4,0(s0)
80408c64:	01072783          	lw	a5,16(a4)
80408c68:	fe078ee3          	beqz	a5,80408c64 <cpu_idle+0x18>
80408c6c:	561030ef          	jal	ra,8040c9cc <schedule>
80408c70:	ff1ff06f          	j	80408c60 <cpu_idle+0x14>

80408c74 <lab6_set_priority>:
80408c74:	00094797          	auipc	a5,0x94
80408c78:	b3878793          	addi	a5,a5,-1224 # 8049c7ac <current>
80408c7c:	0007a783          	lw	a5,0(a5)
80408c80:	00051863          	bnez	a0,80408c90 <lab6_set_priority+0x1c>
80408c84:	00100713          	li	a4,1
80408c88:	0ce7ac23          	sw	a4,216(a5)
80408c8c:	00008067          	ret
80408c90:	0ca7ac23          	sw	a0,216(a5)
80408c94:	00008067          	ret

80408c98 <do_sleep>:
80408c98:	08050063          	beqz	a0,80408d18 <do_sleep+0x80>
80408c9c:	fe010113          	addi	sp,sp,-32
80408ca0:	00812c23          	sw	s0,24(sp)
80408ca4:	00112e23          	sw	ra,28(sp)
80408ca8:	00050413          	mv	s0,a0
80408cac:	100027f3          	csrr	a5,sstatus
80408cb0:	0027f793          	andi	a5,a5,2
80408cb4:	06079663          	bnez	a5,80408d20 <do_sleep+0x88>
80408cb8:	00094797          	auipc	a5,0x94
80408cbc:	af478793          	addi	a5,a5,-1292 # 8049c7ac <current>
80408cc0:	0007a783          	lw	a5,0(a5)
80408cc4:	00810713          	addi	a4,sp,8
80408cc8:	00a12023          	sw	a0,0(sp)
80408ccc:	00e12623          	sw	a4,12(sp)
80408cd0:	00e12423          	sw	a4,8(sp)
80408cd4:	00f12223          	sw	a5,4(sp)
80408cd8:	00100713          	li	a4,1
80408cdc:	00e7a023          	sw	a4,0(a5)
80408ce0:	80000737          	lui	a4,0x80000
80408ce4:	00010413          	mv	s0,sp
80408ce8:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
80408cec:	0ae7a423          	sw	a4,168(a5)
80408cf0:	00040513          	mv	a0,s0
80408cf4:	609030ef          	jal	ra,8040cafc <add_timer>
80408cf8:	4d5030ef          	jal	ra,8040c9cc <schedule>
80408cfc:	00040513          	mv	a0,s0
80408d00:	709030ef          	jal	ra,8040cc08 <del_timer>
80408d04:	01c12083          	lw	ra,28(sp)
80408d08:	01812403          	lw	s0,24(sp)
80408d0c:	00000513          	li	a0,0
80408d10:	02010113          	addi	sp,sp,32
80408d14:	00008067          	ret
80408d18:	00000513          	li	a0,0
80408d1c:	00008067          	ret
80408d20:	ef9f70ef          	jal	ra,80400c18 <intr_disable>
80408d24:	00094797          	auipc	a5,0x94
80408d28:	a8878793          	addi	a5,a5,-1400 # 8049c7ac <current>
80408d2c:	0007a783          	lw	a5,0(a5)
80408d30:	00810713          	addi	a4,sp,8
80408d34:	00812023          	sw	s0,0(sp)
80408d38:	00f12223          	sw	a5,4(sp)
80408d3c:	00e12623          	sw	a4,12(sp)
80408d40:	00e12423          	sw	a4,8(sp)
80408d44:	00100713          	li	a4,1
80408d48:	00e7a023          	sw	a4,0(a5)
80408d4c:	80000737          	lui	a4,0x80000
80408d50:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
80408d54:	00010413          	mv	s0,sp
80408d58:	00040513          	mv	a0,s0
80408d5c:	0ae7a423          	sw	a4,168(a5)
80408d60:	59d030ef          	jal	ra,8040cafc <add_timer>
80408d64:	eadf70ef          	jal	ra,80400c10 <intr_enable>
80408d68:	f91ff06f          	j	80408cf8 <do_sleep+0x60>

80408d6c <switch_to>:
80408d6c:	00152023          	sw	ra,0(a0)
80408d70:	00252223          	sw	sp,4(a0)
80408d74:	00852423          	sw	s0,8(a0)
80408d78:	00952623          	sw	s1,12(a0)
80408d7c:	01252823          	sw	s2,16(a0)
80408d80:	01352a23          	sw	s3,20(a0)
80408d84:	01452c23          	sw	s4,24(a0)
80408d88:	01552e23          	sw	s5,28(a0)
80408d8c:	03652023          	sw	s6,32(a0)
80408d90:	03752223          	sw	s7,36(a0)
80408d94:	03852423          	sw	s8,40(a0)
80408d98:	03952623          	sw	s9,44(a0)
80408d9c:	03a52823          	sw	s10,48(a0)
80408da0:	03b52a23          	sw	s11,52(a0)
80408da4:	0005a083          	lw	ra,0(a1)
80408da8:	0045a103          	lw	sp,4(a1)
80408dac:	0085a403          	lw	s0,8(a1)
80408db0:	00c5a483          	lw	s1,12(a1)
80408db4:	0105a903          	lw	s2,16(a1)
80408db8:	0145a983          	lw	s3,20(a1)
80408dbc:	0185aa03          	lw	s4,24(a1)
80408dc0:	01c5aa83          	lw	s5,28(a1)
80408dc4:	0205ab03          	lw	s6,32(a1)
80408dc8:	0245ab83          	lw	s7,36(a1)
80408dcc:	0285ac03          	lw	s8,40(a1)
80408dd0:	02c5ac83          	lw	s9,44(a1)
80408dd4:	0305ad03          	lw	s10,48(a1)
80408dd8:	0345ad83          	lw	s11,52(a1)
80408ddc:	00008067          	ret

80408de0 <proc_stride_comp_f>:
80408de0:	00c52503          	lw	a0,12(a0)
80408de4:	00c5a783          	lw	a5,12(a1)
80408de8:	40f50533          	sub	a0,a0,a5
80408dec:	00a04863          	bgtz	a0,80408dfc <proc_stride_comp_f+0x1c>
80408df0:	00a03533          	snez	a0,a0
80408df4:	40a00533          	neg	a0,a0
80408df8:	00008067          	ret
80408dfc:	00100513          	li	a0,1
80408e00:	00008067          	ret

80408e04 <stride_init>:
80408e04:	00a52223          	sw	a0,4(a0)
80408e08:	00a52023          	sw	a0,0(a0)
80408e0c:	00052823          	sw	zero,16(a0)
80408e10:	00052423          	sw	zero,8(a0)
80408e14:	00008067          	ret

80408e18 <stride_pick_next>:
80408e18:	ff010113          	addi	sp,sp,-16
80408e1c:	00812423          	sw	s0,8(sp)
80408e20:	01052403          	lw	s0,16(a0)
80408e24:	00112623          	sw	ra,12(sp)
80408e28:	00912223          	sw	s1,4(sp)
80408e2c:	01212023          	sw	s2,0(sp)
80408e30:	04040263          	beqz	s0,80408e74 <stride_pick_next+0x5c>
80408e34:	01042583          	lw	a1,16(s0)
80408e38:	f3840913          	addi	s2,s0,-200
80408e3c:	00c42483          	lw	s1,12(s0)
80408e40:	40000537          	lui	a0,0x40000
80408e44:	02059463          	bnez	a1,80408e6c <stride_pick_next+0x54>
80408e48:	00a484b3          	add	s1,s1,a0
80408e4c:	00942623          	sw	s1,12(s0)
80408e50:	00c12083          	lw	ra,12(sp)
80408e54:	00812403          	lw	s0,8(sp)
80408e58:	00090513          	mv	a0,s2
80408e5c:	00412483          	lw	s1,4(sp)
80408e60:	00012903          	lw	s2,0(sp)
80408e64:	01010113          	addi	sp,sp,16
80408e68:	00008067          	ret
80408e6c:	161090ef          	jal	ra,804127cc <__udivsi3>
80408e70:	fd9ff06f          	j	80408e48 <stride_pick_next+0x30>
80408e74:	00000913          	li	s2,0
80408e78:	fd9ff06f          	j	80408e50 <stride_pick_next+0x38>

80408e7c <stride_proc_tick>:
80408e7c:	0c45a783          	lw	a5,196(a1)
80408e80:	00f05663          	blez	a5,80408e8c <stride_proc_tick+0x10>
80408e84:	fff78793          	addi	a5,a5,-1
80408e88:	0cf5a223          	sw	a5,196(a1)
80408e8c:	00079663          	bnez	a5,80408e98 <stride_proc_tick+0x1c>
80408e90:	00100793          	li	a5,1
80408e94:	00f5a823          	sw	a5,16(a1)
80408e98:	00008067          	ret

80408e9c <skew_heap_merge.constprop.3>:
80408e9c:	ff010113          	addi	sp,sp,-16
80408ea0:	00812423          	sw	s0,8(sp)
80408ea4:	00112623          	sw	ra,12(sp)
80408ea8:	00912223          	sw	s1,4(sp)
80408eac:	01212023          	sw	s2,0(sp)
80408eb0:	00058413          	mv	s0,a1
80408eb4:	02050c63          	beqz	a0,80408eec <skew_heap_merge.constprop.3+0x50>
80408eb8:	00050493          	mv	s1,a0
80408ebc:	06058663          	beqz	a1,80408f28 <skew_heap_merge.constprop.3+0x8c>
80408ec0:	f21ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80408ec4:	fff00793          	li	a5,-1
80408ec8:	04f50063          	beq	a0,a5,80408f08 <skew_heap_merge.constprop.3+0x6c>
80408ecc:	00842583          	lw	a1,8(s0)
80408ed0:	00442903          	lw	s2,4(s0)
80408ed4:	00048513          	mv	a0,s1
80408ed8:	fc5ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80408edc:	00a42223          	sw	a0,4(s0)
80408ee0:	01242423          	sw	s2,8(s0)
80408ee4:	00050463          	beqz	a0,80408eec <skew_heap_merge.constprop.3+0x50>
80408ee8:	00852023          	sw	s0,0(a0) # 40000000 <_binary_bin_sfs_img_size+0x3ff88000>
80408eec:	00040513          	mv	a0,s0
80408ef0:	00c12083          	lw	ra,12(sp)
80408ef4:	00812403          	lw	s0,8(sp)
80408ef8:	00412483          	lw	s1,4(sp)
80408efc:	00012903          	lw	s2,0(sp)
80408f00:	01010113          	addi	sp,sp,16
80408f04:	00008067          	ret
80408f08:	0084a503          	lw	a0,8(s1)
80408f0c:	0044a903          	lw	s2,4(s1)
80408f10:	00040593          	mv	a1,s0
80408f14:	f89ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80408f18:	00a4a223          	sw	a0,4(s1)
80408f1c:	0124a423          	sw	s2,8(s1)
80408f20:	00050463          	beqz	a0,80408f28 <skew_heap_merge.constprop.3+0x8c>
80408f24:	00952023          	sw	s1,0(a0)
80408f28:	00c12083          	lw	ra,12(sp)
80408f2c:	00812403          	lw	s0,8(sp)
80408f30:	00048513          	mv	a0,s1
80408f34:	00012903          	lw	s2,0(sp)
80408f38:	00412483          	lw	s1,4(sp)
80408f3c:	01010113          	addi	sp,sp,16
80408f40:	00008067          	ret

80408f44 <stride_enqueue>:
80408f44:	fb010113          	addi	sp,sp,-80
80408f48:	03312e23          	sw	s3,60(sp)
80408f4c:	01052983          	lw	s3,16(a0)
80408f50:	04812423          	sw	s0,72(sp)
80408f54:	04912223          	sw	s1,68(sp)
80408f58:	05212023          	sw	s2,64(sp)
80408f5c:	04112623          	sw	ra,76(sp)
80408f60:	03412c23          	sw	s4,56(sp)
80408f64:	03512a23          	sw	s5,52(sp)
80408f68:	03612823          	sw	s6,48(sp)
80408f6c:	03712623          	sw	s7,44(sp)
80408f70:	03812423          	sw	s8,40(sp)
80408f74:	03912223          	sw	s9,36(sp)
80408f78:	03a12023          	sw	s10,32(sp)
80408f7c:	01b12e23          	sw	s11,28(sp)
80408f80:	0c05a423          	sw	zero,200(a1)
80408f84:	0c05a823          	sw	zero,208(a1)
80408f88:	0c05a623          	sw	zero,204(a1)
80408f8c:	00050493          	mv	s1,a0
80408f90:	00058413          	mv	s0,a1
80408f94:	0c858913          	addi	s2,a1,200
80408f98:	02098463          	beqz	s3,80408fc0 <stride_enqueue+0x7c>
80408f9c:	0c090c63          	beqz	s2,80409074 <stride_enqueue+0x130>
80408fa0:	00090593          	mv	a1,s2
80408fa4:	00098513          	mv	a0,s3
80408fa8:	e39ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80408fac:	fff00793          	li	a5,-1
80408fb0:	00050a13          	mv	s4,a0
80408fb4:	06f50a63          	beq	a0,a5,80409028 <stride_enqueue+0xe4>
80408fb8:	0d342623          	sw	s3,204(s0)
80408fbc:	0129a023          	sw	s2,0(s3)
80408fc0:	0c442783          	lw	a5,196(s0)
80408fc4:	0124a823          	sw	s2,16(s1)
80408fc8:	00c4a703          	lw	a4,12(s1)
80408fcc:	04079a63          	bnez	a5,80409020 <stride_enqueue+0xdc>
80408fd0:	0ce42223          	sw	a4,196(s0)
80408fd4:	0084a783          	lw	a5,8(s1)
80408fd8:	04c12083          	lw	ra,76(sp)
80408fdc:	0a942c23          	sw	s1,184(s0)
80408fe0:	04812403          	lw	s0,72(sp)
80408fe4:	00178793          	addi	a5,a5,1
80408fe8:	00f4a423          	sw	a5,8(s1)
80408fec:	04012903          	lw	s2,64(sp)
80408ff0:	04412483          	lw	s1,68(sp)
80408ff4:	03c12983          	lw	s3,60(sp)
80408ff8:	03812a03          	lw	s4,56(sp)
80408ffc:	03412a83          	lw	s5,52(sp)
80409000:	03012b03          	lw	s6,48(sp)
80409004:	02c12b83          	lw	s7,44(sp)
80409008:	02812c03          	lw	s8,40(sp)
8040900c:	02412c83          	lw	s9,36(sp)
80409010:	02012d03          	lw	s10,32(sp)
80409014:	01c12d83          	lw	s11,28(sp)
80409018:	05010113          	addi	sp,sp,80
8040901c:	00008067          	ret
80409020:	faf75ae3          	bge	a4,a5,80408fd4 <stride_enqueue+0x90>
80409024:	fadff06f          	j	80408fd0 <stride_enqueue+0x8c>
80409028:	0089aa83          	lw	s5,8(s3)
8040902c:	0049ab03          	lw	s6,4(s3)
80409030:	020a8063          	beqz	s5,80409050 <stride_enqueue+0x10c>
80409034:	00090593          	mv	a1,s2
80409038:	000a8513          	mv	a0,s5
8040903c:	da5ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409040:	00050b93          	mv	s7,a0
80409044:	05450463          	beq	a0,s4,8040908c <stride_enqueue+0x148>
80409048:	0d542623          	sw	s5,204(s0)
8040904c:	012aa023          	sw	s2,0(s5)
80409050:	0129a223          	sw	s2,4(s3)
80409054:	0169a423          	sw	s6,8(s3)
80409058:	0c442783          	lw	a5,196(s0)
8040905c:	01392023          	sw	s3,0(s2)
80409060:	00098913          	mv	s2,s3
80409064:	0124a823          	sw	s2,16(s1)
80409068:	00c4a703          	lw	a4,12(s1)
8040906c:	f60782e3          	beqz	a5,80408fd0 <stride_enqueue+0x8c>
80409070:	fb1ff06f          	j	80409020 <stride_enqueue+0xdc>
80409074:	0c442783          	lw	a5,196(s0)
80409078:	00098913          	mv	s2,s3
8040907c:	0124a823          	sw	s2,16(s1)
80409080:	00c4a703          	lw	a4,12(s1)
80409084:	f40786e3          	beqz	a5,80408fd0 <stride_enqueue+0x8c>
80409088:	f99ff06f          	j	80409020 <stride_enqueue+0xdc>
8040908c:	008aaa03          	lw	s4,8(s5)
80409090:	004aac03          	lw	s8,4(s5)
80409094:	020a0063          	beqz	s4,804090b4 <stride_enqueue+0x170>
80409098:	00090593          	mv	a1,s2
8040909c:	000a0513          	mv	a0,s4
804090a0:	d41ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804090a4:	00050c93          	mv	s9,a0
804090a8:	03750063          	beq	a0,s7,804090c8 <stride_enqueue+0x184>
804090ac:	0d442623          	sw	s4,204(s0)
804090b0:	012a2023          	sw	s2,0(s4)
804090b4:	012aa223          	sw	s2,4(s5)
804090b8:	018aa423          	sw	s8,8(s5)
804090bc:	01592023          	sw	s5,0(s2)
804090c0:	000a8913          	mv	s2,s5
804090c4:	f8dff06f          	j	80409050 <stride_enqueue+0x10c>
804090c8:	008a2b83          	lw	s7,8(s4)
804090cc:	004a2d03          	lw	s10,4(s4)
804090d0:	000b8e63          	beqz	s7,804090ec <stride_enqueue+0x1a8>
804090d4:	00090593          	mv	a1,s2
804090d8:	000b8513          	mv	a0,s7
804090dc:	d05ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804090e0:	03950063          	beq	a0,s9,80409100 <stride_enqueue+0x1bc>
804090e4:	0d742623          	sw	s7,204(s0)
804090e8:	012ba023          	sw	s2,0(s7)
804090ec:	012a2223          	sw	s2,4(s4)
804090f0:	01aa2423          	sw	s10,8(s4)
804090f4:	01492023          	sw	s4,0(s2)
804090f8:	000a0913          	mv	s2,s4
804090fc:	fb9ff06f          	j	804090b4 <stride_enqueue+0x170>
80409100:	008bac83          	lw	s9,8(s7)
80409104:	004bad83          	lw	s11,4(s7)
80409108:	020c8063          	beqz	s9,80409128 <stride_enqueue+0x1e4>
8040910c:	00090593          	mv	a1,s2
80409110:	000c8513          	mv	a0,s9
80409114:	ccdff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409118:	fff00793          	li	a5,-1
8040911c:	02f50063          	beq	a0,a5,8040913c <stride_enqueue+0x1f8>
80409120:	0d942623          	sw	s9,204(s0)
80409124:	012ca023          	sw	s2,0(s9)
80409128:	012ba223          	sw	s2,4(s7)
8040912c:	01bba423          	sw	s11,8(s7)
80409130:	01792023          	sw	s7,0(s2)
80409134:	000b8913          	mv	s2,s7
80409138:	fb5ff06f          	j	804090ec <stride_enqueue+0x1a8>
8040913c:	004ca783          	lw	a5,4(s9)
80409140:	008ca503          	lw	a0,8(s9)
80409144:	00090593          	mv	a1,s2
80409148:	00f12623          	sw	a5,12(sp)
8040914c:	d51ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409150:	00c12783          	lw	a5,12(sp)
80409154:	00aca223          	sw	a0,4(s9)
80409158:	00fca423          	sw	a5,8(s9)
8040915c:	00050863          	beqz	a0,8040916c <stride_enqueue+0x228>
80409160:	01952023          	sw	s9,0(a0)
80409164:	000c8913          	mv	s2,s9
80409168:	fc1ff06f          	j	80409128 <stride_enqueue+0x1e4>
8040916c:	000c8913          	mv	s2,s9
80409170:	fb9ff06f          	j	80409128 <stride_enqueue+0x1e4>

80409174 <stride_dequeue>:
80409174:	0b85a783          	lw	a5,184(a1)
80409178:	fa010113          	addi	sp,sp,-96
8040917c:	04112e23          	sw	ra,92(sp)
80409180:	04812c23          	sw	s0,88(sp)
80409184:	04912a23          	sw	s1,84(sp)
80409188:	05212823          	sw	s2,80(sp)
8040918c:	05312623          	sw	s3,76(sp)
80409190:	05412423          	sw	s4,72(sp)
80409194:	05512223          	sw	s5,68(sp)
80409198:	05612023          	sw	s6,64(sp)
8040919c:	03712e23          	sw	s7,60(sp)
804091a0:	03812c23          	sw	s8,56(sp)
804091a4:	03912a23          	sw	s9,52(sp)
804091a8:	03a12823          	sw	s10,48(sp)
804091ac:	03b12623          	sw	s11,44(sp)
804091b0:	00a78463          	beq	a5,a0,804091b8 <stride_dequeue+0x44>
804091b4:	2790206f          	j	8040bc2c <stride_dequeue+0x2ab8>
804091b8:	00852983          	lw	s3,8(a0)
804091bc:	00050c13          	mv	s8,a0
804091c0:	00098b13          	mv	s6,s3
804091c4:	00099463          	bnez	s3,804091cc <stride_dequeue+0x58>
804091c8:	2650206f          	j	8040bc2c <stride_dequeue+0x2ab8>
804091cc:	0cc5a903          	lw	s2,204(a1)
804091d0:	00058493          	mv	s1,a1
804091d4:	01052a83          	lw	s5,16(a0)
804091d8:	0c85ad03          	lw	s10,200(a1)
804091dc:	0d05a403          	lw	s0,208(a1)
804091e0:	3c090e63          	beqz	s2,804095bc <stride_dequeue+0x448>
804091e4:	58040c63          	beqz	s0,8040977c <stride_dequeue+0x608>
804091e8:	00040593          	mv	a1,s0
804091ec:	00090513          	mv	a0,s2
804091f0:	bf1ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804091f4:	fff00c93          	li	s9,-1
804091f8:	00050a13          	mv	s4,a0
804091fc:	21950663          	beq	a0,s9,80409408 <stride_dequeue+0x294>
80409200:	00842a03          	lw	s4,8(s0)
80409204:	00442b83          	lw	s7,4(s0)
80409208:	180a0a63          	beqz	s4,8040939c <stride_dequeue+0x228>
8040920c:	000a0593          	mv	a1,s4
80409210:	00090513          	mv	a0,s2
80409214:	bcdff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409218:	3b950e63          	beq	a0,s9,804095d4 <stride_dequeue+0x460>
8040921c:	004a2783          	lw	a5,4(s4)
80409220:	008a2d83          	lw	s11,8(s4)
80409224:	00f12023          	sw	a5,0(sp)
80409228:	160d8063          	beqz	s11,80409388 <stride_dequeue+0x214>
8040922c:	000d8593          	mv	a1,s11
80409230:	00090513          	mv	a0,s2
80409234:	badff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409238:	2b9500e3          	beq	a0,s9,80409cd8 <stride_dequeue+0xb64>
8040923c:	004da783          	lw	a5,4(s11)
80409240:	008dac83          	lw	s9,8(s11)
80409244:	00f12223          	sw	a5,4(sp)
80409248:	120c8663          	beqz	s9,80409374 <stride_dequeue+0x200>
8040924c:	000c8593          	mv	a1,s9
80409250:	00090513          	mv	a0,s2
80409254:	b8dff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409258:	fff00893          	li	a7,-1
8040925c:	171504e3          	beq	a0,a7,80409bc4 <stride_dequeue+0xa50>
80409260:	004ca783          	lw	a5,4(s9)
80409264:	008ca803          	lw	a6,8(s9)
80409268:	00f12423          	sw	a5,8(sp)
8040926c:	0e080a63          	beqz	a6,80409360 <stride_dequeue+0x1ec>
80409270:	00080593          	mv	a1,a6
80409274:	00090513          	mv	a0,s2
80409278:	01012623          	sw	a6,12(sp)
8040927c:	b65ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409280:	fff00893          	li	a7,-1
80409284:	00c12803          	lw	a6,12(sp)
80409288:	01151463          	bne	a0,a7,80409290 <stride_dequeue+0x11c>
8040928c:	02c0106f          	j	8040a2b8 <stride_dequeue+0x1144>
80409290:	00482703          	lw	a4,4(a6) # fffff004 <end+0x7fb62748>
80409294:	00882783          	lw	a5,8(a6)
80409298:	00e12623          	sw	a4,12(sp)
8040929c:	0a078863          	beqz	a5,8040934c <stride_dequeue+0x1d8>
804092a0:	00078593          	mv	a1,a5
804092a4:	00090513          	mv	a0,s2
804092a8:	01012a23          	sw	a6,20(sp)
804092ac:	00f12823          	sw	a5,16(sp)
804092b0:	b31ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804092b4:	fff00893          	li	a7,-1
804092b8:	01012783          	lw	a5,16(sp)
804092bc:	01412803          	lw	a6,20(sp)
804092c0:	01151463          	bne	a0,a7,804092c8 <stride_dequeue+0x154>
804092c4:	7900106f          	j	8040aa54 <stride_dequeue+0x18e0>
804092c8:	0047a703          	lw	a4,4(a5)
804092cc:	0087ab03          	lw	s6,8(a5)
804092d0:	00e12823          	sw	a4,16(sp)
804092d4:	060b0263          	beqz	s6,80409338 <stride_dequeue+0x1c4>
804092d8:	000b0593          	mv	a1,s6
804092dc:	00090513          	mv	a0,s2
804092e0:	00f12c23          	sw	a5,24(sp)
804092e4:	01012a23          	sw	a6,20(sp)
804092e8:	af9ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804092ec:	fff00893          	li	a7,-1
804092f0:	01412803          	lw	a6,20(sp)
804092f4:	01812783          	lw	a5,24(sp)
804092f8:	01151463          	bne	a0,a7,80409300 <stride_dequeue+0x18c>
804092fc:	0a00206f          	j	8040b39c <stride_dequeue+0x2228>
80409300:	008b2583          	lw	a1,8(s6)
80409304:	004b2983          	lw	s3,4(s6)
80409308:	00090513          	mv	a0,s2
8040930c:	00f12c23          	sw	a5,24(sp)
80409310:	01012a23          	sw	a6,20(sp)
80409314:	b89ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409318:	00ab2223          	sw	a0,4(s6)
8040931c:	013b2423          	sw	s3,8(s6)
80409320:	01412803          	lw	a6,20(sp)
80409324:	01812783          	lw	a5,24(sp)
80409328:	00050463          	beqz	a0,80409330 <stride_dequeue+0x1bc>
8040932c:	01652023          	sw	s6,0(a0)
80409330:	008c2983          	lw	s3,8(s8)
80409334:	000b0913          	mv	s2,s6
80409338:	01012703          	lw	a4,16(sp)
8040933c:	0127a223          	sw	s2,4(a5)
80409340:	00e7a423          	sw	a4,8(a5)
80409344:	00f92023          	sw	a5,0(s2)
80409348:	00078913          	mv	s2,a5
8040934c:	00c12783          	lw	a5,12(sp)
80409350:	01282223          	sw	s2,4(a6)
80409354:	00f82423          	sw	a5,8(a6)
80409358:	01092023          	sw	a6,0(s2)
8040935c:	00080913          	mv	s2,a6
80409360:	00812783          	lw	a5,8(sp)
80409364:	012ca223          	sw	s2,4(s9)
80409368:	00fca423          	sw	a5,8(s9)
8040936c:	01992023          	sw	s9,0(s2)
80409370:	000c8913          	mv	s2,s9
80409374:	00412783          	lw	a5,4(sp)
80409378:	012da223          	sw	s2,4(s11)
8040937c:	00fda423          	sw	a5,8(s11)
80409380:	01b92023          	sw	s11,0(s2)
80409384:	000d8913          	mv	s2,s11
80409388:	00012783          	lw	a5,0(sp)
8040938c:	012a2223          	sw	s2,4(s4)
80409390:	00fa2423          	sw	a5,8(s4)
80409394:	01492023          	sw	s4,0(s2)
80409398:	000a0913          	mv	s2,s4
8040939c:	01242223          	sw	s2,4(s0)
804093a0:	01742423          	sw	s7,8(s0)
804093a4:	00892023          	sw	s0,0(s2)
804093a8:	01a42023          	sw	s10,0(s0)
804093ac:	200d0c63          	beqz	s10,804095c4 <stride_dequeue+0x450>
804093b0:	004d2683          	lw	a3,4(s10)
804093b4:	0c848493          	addi	s1,s1,200
804093b8:	20968a63          	beq	a3,s1,804095cc <stride_dequeue+0x458>
804093bc:	008d2423          	sw	s0,8(s10)
804093c0:	05c12083          	lw	ra,92(sp)
804093c4:	05812403          	lw	s0,88(sp)
804093c8:	fff98993          	addi	s3,s3,-1
804093cc:	015c2823          	sw	s5,16(s8)
804093d0:	013c2423          	sw	s3,8(s8)
804093d4:	05412483          	lw	s1,84(sp)
804093d8:	05012903          	lw	s2,80(sp)
804093dc:	04c12983          	lw	s3,76(sp)
804093e0:	04812a03          	lw	s4,72(sp)
804093e4:	04412a83          	lw	s5,68(sp)
804093e8:	04012b03          	lw	s6,64(sp)
804093ec:	03c12b83          	lw	s7,60(sp)
804093f0:	03812c03          	lw	s8,56(sp)
804093f4:	03412c83          	lw	s9,52(sp)
804093f8:	03012d03          	lw	s10,48(sp)
804093fc:	02c12d83          	lw	s11,44(sp)
80409400:	06010113          	addi	sp,sp,96
80409404:	00008067          	ret
80409408:	00892d83          	lw	s11,8(s2)
8040940c:	00492b83          	lw	s7,4(s2)
80409410:	180d8a63          	beqz	s11,804095a4 <stride_dequeue+0x430>
80409414:	00040593          	mv	a1,s0
80409418:	000d8513          	mv	a0,s11
8040941c:	9c5ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409420:	37450463          	beq	a0,s4,80409788 <stride_dequeue+0x614>
80409424:	00442783          	lw	a5,4(s0)
80409428:	00842c83          	lw	s9,8(s0)
8040942c:	00f12023          	sw	a5,0(sp)
80409430:	160c8263          	beqz	s9,80409594 <stride_dequeue+0x420>
80409434:	000c8593          	mv	a1,s9
80409438:	000d8513          	mv	a0,s11
8040943c:	9a5ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409440:	4d450863          	beq	a0,s4,80409910 <stride_dequeue+0x79c>
80409444:	004ca783          	lw	a5,4(s9)
80409448:	008caa03          	lw	s4,8(s9)
8040944c:	00f12223          	sw	a5,4(sp)
80409450:	120a0863          	beqz	s4,80409580 <stride_dequeue+0x40c>
80409454:	000a0593          	mv	a1,s4
80409458:	000d8513          	mv	a0,s11
8040945c:	985ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409460:	fff00893          	li	a7,-1
80409464:	551502e3          	beq	a0,a7,8040a1a8 <stride_dequeue+0x1034>
80409468:	004a2783          	lw	a5,4(s4)
8040946c:	008a2803          	lw	a6,8(s4)
80409470:	00f12423          	sw	a5,8(sp)
80409474:	0e080c63          	beqz	a6,8040956c <stride_dequeue+0x3f8>
80409478:	00080593          	mv	a1,a6
8040947c:	000d8513          	mv	a0,s11
80409480:	01012623          	sw	a6,12(sp)
80409484:	95dff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409488:	fff00893          	li	a7,-1
8040948c:	00c12803          	lw	a6,12(sp)
80409490:	01151463          	bne	a0,a7,80409498 <stride_dequeue+0x324>
80409494:	4000106f          	j	8040a894 <stride_dequeue+0x1720>
80409498:	00482783          	lw	a5,4(a6)
8040949c:	00882303          	lw	t1,8(a6)
804094a0:	00f12623          	sw	a5,12(sp)
804094a4:	0a030a63          	beqz	t1,80409558 <stride_dequeue+0x3e4>
804094a8:	00030593          	mv	a1,t1
804094ac:	000d8513          	mv	a0,s11
804094b0:	01012a23          	sw	a6,20(sp)
804094b4:	00612823          	sw	t1,16(sp)
804094b8:	929ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804094bc:	fff00893          	li	a7,-1
804094c0:	01012303          	lw	t1,16(sp)
804094c4:	01412803          	lw	a6,20(sp)
804094c8:	01151463          	bne	a0,a7,804094d0 <stride_dequeue+0x35c>
804094cc:	5cd0106f          	j	8040b298 <stride_dequeue+0x2124>
804094d0:	00432783          	lw	a5,4(t1)
804094d4:	00832983          	lw	s3,8(t1)
804094d8:	00f12823          	sw	a5,16(sp)
804094dc:	00099463          	bnez	s3,804094e4 <stride_dequeue+0x370>
804094e0:	44c0206f          	j	8040b92c <stride_dequeue+0x27b8>
804094e4:	00098593          	mv	a1,s3
804094e8:	000d8513          	mv	a0,s11
804094ec:	00612c23          	sw	t1,24(sp)
804094f0:	01012a23          	sw	a6,20(sp)
804094f4:	8edff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804094f8:	fff00893          	li	a7,-1
804094fc:	01412803          	lw	a6,20(sp)
80409500:	01812303          	lw	t1,24(sp)
80409504:	01151463          	bne	a0,a7,8040950c <stride_dequeue+0x398>
80409508:	6ac0206f          	j	8040bbb4 <stride_dequeue+0x2a40>
8040950c:	0089a583          	lw	a1,8(s3)
80409510:	0049ab03          	lw	s6,4(s3)
80409514:	000d8513          	mv	a0,s11
80409518:	00612c23          	sw	t1,24(sp)
8040951c:	01012a23          	sw	a6,20(sp)
80409520:	97dff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409524:	00a9a223          	sw	a0,4(s3)
80409528:	0169a423          	sw	s6,8(s3)
8040952c:	01412803          	lw	a6,20(sp)
80409530:	01812303          	lw	t1,24(sp)
80409534:	00050463          	beqz	a0,8040953c <stride_dequeue+0x3c8>
80409538:	01352023          	sw	s3,0(a0)
8040953c:	008c2b03          	lw	s6,8(s8)
80409540:	01012783          	lw	a5,16(sp)
80409544:	01332223          	sw	s3,4(t1)
80409548:	00030d93          	mv	s11,t1
8040954c:	00f32423          	sw	a5,8(t1)
80409550:	0069a023          	sw	t1,0(s3)
80409554:	000b0993          	mv	s3,s6
80409558:	00c12783          	lw	a5,12(sp)
8040955c:	01b82223          	sw	s11,4(a6)
80409560:	00f82423          	sw	a5,8(a6)
80409564:	010da023          	sw	a6,0(s11)
80409568:	00080d93          	mv	s11,a6
8040956c:	00812783          	lw	a5,8(sp)
80409570:	01ba2223          	sw	s11,4(s4)
80409574:	00fa2423          	sw	a5,8(s4)
80409578:	014da023          	sw	s4,0(s11)
8040957c:	000a0d93          	mv	s11,s4
80409580:	00412783          	lw	a5,4(sp)
80409584:	01bca223          	sw	s11,4(s9)
80409588:	00fca423          	sw	a5,8(s9)
8040958c:	019da023          	sw	s9,0(s11)
80409590:	000c8d93          	mv	s11,s9
80409594:	00012783          	lw	a5,0(sp)
80409598:	01b42223          	sw	s11,4(s0)
8040959c:	00f42423          	sw	a5,8(s0)
804095a0:	008da023          	sw	s0,0(s11)
804095a4:	00892223          	sw	s0,4(s2)
804095a8:	01792423          	sw	s7,8(s2)
804095ac:	01242023          	sw	s2,0(s0)
804095b0:	00090413          	mv	s0,s2
804095b4:	01a42023          	sw	s10,0(s0)
804095b8:	df5ff06f          	j	804093ac <stride_dequeue+0x238>
804095bc:	de0416e3          	bnez	s0,804093a8 <stride_dequeue+0x234>
804095c0:	de0d18e3          	bnez	s10,804093b0 <stride_dequeue+0x23c>
804095c4:	00040a93          	mv	s5,s0
804095c8:	df9ff06f          	j	804093c0 <stride_dequeue+0x24c>
804095cc:	008d2223          	sw	s0,4(s10)
804095d0:	df1ff06f          	j	804093c0 <stride_dequeue+0x24c>
804095d4:	00892d83          	lw	s11,8(s2)
804095d8:	00a12023          	sw	a0,0(sp)
804095dc:	00492c83          	lw	s9,4(s2)
804095e0:	180d8663          	beqz	s11,8040976c <stride_dequeue+0x5f8>
804095e4:	000a0593          	mv	a1,s4
804095e8:	000d8513          	mv	a0,s11
804095ec:	ff4ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804095f0:	00012783          	lw	a5,0(sp)
804095f4:	46f50263          	beq	a0,a5,80409a58 <stride_dequeue+0x8e4>
804095f8:	004a2783          	lw	a5,4(s4)
804095fc:	008a2603          	lw	a2,8(s4)
80409600:	00f12023          	sw	a5,0(sp)
80409604:	14060c63          	beqz	a2,8040975c <stride_dequeue+0x5e8>
80409608:	00060593          	mv	a1,a2
8040960c:	000d8513          	mv	a0,s11
80409610:	00c12223          	sw	a2,4(sp)
80409614:	fccff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409618:	fff00893          	li	a7,-1
8040961c:	00412603          	lw	a2,4(sp)
80409620:	25150ce3          	beq	a0,a7,8040a078 <stride_dequeue+0xf04>
80409624:	00462783          	lw	a5,4(a2)
80409628:	00862803          	lw	a6,8(a2)
8040962c:	00f12223          	sw	a5,4(sp)
80409630:	10080c63          	beqz	a6,80409748 <stride_dequeue+0x5d4>
80409634:	00080593          	mv	a1,a6
80409638:	000d8513          	mv	a0,s11
8040963c:	00c12623          	sw	a2,12(sp)
80409640:	01012423          	sw	a6,8(sp)
80409644:	f9cff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409648:	fff00893          	li	a7,-1
8040964c:	00812803          	lw	a6,8(sp)
80409650:	00c12603          	lw	a2,12(sp)
80409654:	01151463          	bne	a0,a7,8040965c <stride_dequeue+0x4e8>
80409658:	3100106f          	j	8040a968 <stride_dequeue+0x17f4>
8040965c:	00482783          	lw	a5,4(a6)
80409660:	00882303          	lw	t1,8(a6)
80409664:	00f12423          	sw	a5,8(sp)
80409668:	0c030663          	beqz	t1,80409734 <stride_dequeue+0x5c0>
8040966c:	00030593          	mv	a1,t1
80409670:	000d8513          	mv	a0,s11
80409674:	01012a23          	sw	a6,20(sp)
80409678:	00c12823          	sw	a2,16(sp)
8040967c:	00612623          	sw	t1,12(sp)
80409680:	f60ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409684:	fff00893          	li	a7,-1
80409688:	00c12303          	lw	t1,12(sp)
8040968c:	01012603          	lw	a2,16(sp)
80409690:	01412803          	lw	a6,20(sp)
80409694:	01151463          	bne	a0,a7,8040969c <stride_dequeue+0x528>
80409698:	2e90106f          	j	8040b180 <stride_dequeue+0x200c>
8040969c:	00432783          	lw	a5,4(t1)
804096a0:	00832983          	lw	s3,8(t1)
804096a4:	00f12623          	sw	a5,12(sp)
804096a8:	00099463          	bnez	s3,804096b0 <stride_dequeue+0x53c>
804096ac:	4240206f          	j	8040bad0 <stride_dequeue+0x295c>
804096b0:	00098593          	mv	a1,s3
804096b4:	000d8513          	mv	a0,s11
804096b8:	00612c23          	sw	t1,24(sp)
804096bc:	01012a23          	sw	a6,20(sp)
804096c0:	00c12823          	sw	a2,16(sp)
804096c4:	f1cff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804096c8:	fff00893          	li	a7,-1
804096cc:	01012603          	lw	a2,16(sp)
804096d0:	01412803          	lw	a6,20(sp)
804096d4:	01812303          	lw	t1,24(sp)
804096d8:	01151463          	bne	a0,a7,804096e0 <stride_dequeue+0x56c>
804096dc:	3fc0206f          	j	8040bad8 <stride_dequeue+0x2964>
804096e0:	0089a583          	lw	a1,8(s3)
804096e4:	0049ab03          	lw	s6,4(s3)
804096e8:	000d8513          	mv	a0,s11
804096ec:	00612c23          	sw	t1,24(sp)
804096f0:	01012a23          	sw	a6,20(sp)
804096f4:	00c12823          	sw	a2,16(sp)
804096f8:	fa4ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
804096fc:	00a9a223          	sw	a0,4(s3)
80409700:	0169a423          	sw	s6,8(s3)
80409704:	01012603          	lw	a2,16(sp)
80409708:	01412803          	lw	a6,20(sp)
8040970c:	01812303          	lw	t1,24(sp)
80409710:	00050463          	beqz	a0,80409718 <stride_dequeue+0x5a4>
80409714:	01352023          	sw	s3,0(a0)
80409718:	008c2b03          	lw	s6,8(s8)
8040971c:	00c12783          	lw	a5,12(sp)
80409720:	01332223          	sw	s3,4(t1)
80409724:	00030d93          	mv	s11,t1
80409728:	00f32423          	sw	a5,8(t1)
8040972c:	0069a023          	sw	t1,0(s3)
80409730:	000b0993          	mv	s3,s6
80409734:	00812783          	lw	a5,8(sp)
80409738:	01b82223          	sw	s11,4(a6)
8040973c:	00f82423          	sw	a5,8(a6)
80409740:	010da023          	sw	a6,0(s11)
80409744:	00080d93          	mv	s11,a6
80409748:	00412783          	lw	a5,4(sp)
8040974c:	01b62223          	sw	s11,4(a2)
80409750:	00f62423          	sw	a5,8(a2)
80409754:	00cda023          	sw	a2,0(s11)
80409758:	00060d93          	mv	s11,a2
8040975c:	00012783          	lw	a5,0(sp)
80409760:	01ba2223          	sw	s11,4(s4)
80409764:	00fa2423          	sw	a5,8(s4)
80409768:	014da023          	sw	s4,0(s11)
8040976c:	01492223          	sw	s4,4(s2)
80409770:	01992423          	sw	s9,8(s2)
80409774:	012a2023          	sw	s2,0(s4)
80409778:	c25ff06f          	j	8040939c <stride_dequeue+0x228>
8040977c:	00090413          	mv	s0,s2
80409780:	01a42023          	sw	s10,0(s0)
80409784:	c29ff06f          	j	804093ac <stride_dequeue+0x238>
80409788:	004da783          	lw	a5,4(s11)
8040978c:	008dac83          	lw	s9,8(s11)
80409790:	00a12223          	sw	a0,4(sp)
80409794:	00f12023          	sw	a5,0(sp)
80409798:	160c8063          	beqz	s9,804098f8 <stride_dequeue+0x784>
8040979c:	00040593          	mv	a1,s0
804097a0:	000c8513          	mv	a0,s9
804097a4:	e3cff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804097a8:	00412783          	lw	a5,4(sp)
804097ac:	66f50a63          	beq	a0,a5,80409e20 <stride_dequeue+0xcac>
804097b0:	00442783          	lw	a5,4(s0)
804097b4:	00842a03          	lw	s4,8(s0)
804097b8:	00f12223          	sw	a5,4(sp)
804097bc:	120a0663          	beqz	s4,804098e8 <stride_dequeue+0x774>
804097c0:	000a0593          	mv	a1,s4
804097c4:	000c8513          	mv	a0,s9
804097c8:	e18ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804097cc:	fff00893          	li	a7,-1
804097d0:	4f1506e3          	beq	a0,a7,8040a4bc <stride_dequeue+0x1348>
804097d4:	004a2783          	lw	a5,4(s4)
804097d8:	008a2803          	lw	a6,8(s4)
804097dc:	00f12423          	sw	a5,8(sp)
804097e0:	0e080a63          	beqz	a6,804098d4 <stride_dequeue+0x760>
804097e4:	00080593          	mv	a1,a6
804097e8:	000c8513          	mv	a0,s9
804097ec:	01012623          	sw	a6,12(sp)
804097f0:	df0ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804097f4:	fff00893          	li	a7,-1
804097f8:	00c12803          	lw	a6,12(sp)
804097fc:	01151463          	bne	a0,a7,80409804 <stride_dequeue+0x690>
80409800:	5640106f          	j	8040ad64 <stride_dequeue+0x1bf0>
80409804:	00482783          	lw	a5,4(a6)
80409808:	00882983          	lw	s3,8(a6)
8040980c:	00f12623          	sw	a5,12(sp)
80409810:	00099463          	bnez	s3,80409818 <stride_dequeue+0x6a4>
80409814:	4380206f          	j	8040bc4c <stride_dequeue+0x2ad8>
80409818:	00098593          	mv	a1,s3
8040981c:	000c8513          	mv	a0,s9
80409820:	01012823          	sw	a6,16(sp)
80409824:	dbcff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409828:	fff00893          	li	a7,-1
8040982c:	01012803          	lw	a6,16(sp)
80409830:	01151463          	bne	a0,a7,80409838 <stride_dequeue+0x6c4>
80409834:	0780206f          	j	8040b8ac <stride_dequeue+0x2738>
80409838:	0049a783          	lw	a5,4(s3)
8040983c:	0089ae03          	lw	t3,8(s3)
80409840:	00f12823          	sw	a5,16(sp)
80409844:	060e0463          	beqz	t3,804098ac <stride_dequeue+0x738>
80409848:	000e0593          	mv	a1,t3
8040984c:	000c8513          	mv	a0,s9
80409850:	01012c23          	sw	a6,24(sp)
80409854:	01c12a23          	sw	t3,20(sp)
80409858:	d88ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040985c:	fff00893          	li	a7,-1
80409860:	01412e03          	lw	t3,20(sp)
80409864:	01812803          	lw	a6,24(sp)
80409868:	01151463          	bne	a0,a7,80409870 <stride_dequeue+0x6fc>
8040986c:	6a40206f          	j	8040bf10 <stride_dequeue+0x2d9c>
80409870:	008e2583          	lw	a1,8(t3)
80409874:	000c8513          	mv	a0,s9
80409878:	004e2b03          	lw	s6,4(t3)
8040987c:	01012c23          	sw	a6,24(sp)
80409880:	01c12a23          	sw	t3,20(sp)
80409884:	e18ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409888:	01412e03          	lw	t3,20(sp)
8040988c:	01812803          	lw	a6,24(sp)
80409890:	00ae2223          	sw	a0,4(t3)
80409894:	016e2423          	sw	s6,8(t3)
80409898:	00051463          	bnez	a0,804098a0 <stride_dequeue+0x72c>
8040989c:	0e90206f          	j	8040c184 <stride_dequeue+0x3010>
804098a0:	008c2b03          	lw	s6,8(s8)
804098a4:	01c52023          	sw	t3,0(a0)
804098a8:	000e0c93          	mv	s9,t3
804098ac:	01012783          	lw	a5,16(sp)
804098b0:	0199a223          	sw	s9,4(s3)
804098b4:	00f9a423          	sw	a5,8(s3)
804098b8:	013ca023          	sw	s3,0(s9)
804098bc:	00c12783          	lw	a5,12(sp)
804098c0:	01382223          	sw	s3,4(a6)
804098c4:	00080c93          	mv	s9,a6
804098c8:	00f82423          	sw	a5,8(a6)
804098cc:	0109a023          	sw	a6,0(s3)
804098d0:	000b0993          	mv	s3,s6
804098d4:	00812783          	lw	a5,8(sp)
804098d8:	019a2223          	sw	s9,4(s4)
804098dc:	00fa2423          	sw	a5,8(s4)
804098e0:	014ca023          	sw	s4,0(s9)
804098e4:	000a0c93          	mv	s9,s4
804098e8:	00412783          	lw	a5,4(sp)
804098ec:	01942223          	sw	s9,4(s0)
804098f0:	00f42423          	sw	a5,8(s0)
804098f4:	008ca023          	sw	s0,0(s9)
804098f8:	00012783          	lw	a5,0(sp)
804098fc:	008da223          	sw	s0,4(s11)
80409900:	00fda423          	sw	a5,8(s11)
80409904:	01b42023          	sw	s11,0(s0)
80409908:	000d8413          	mv	s0,s11
8040990c:	c99ff06f          	j	804095a4 <stride_dequeue+0x430>
80409910:	004da783          	lw	a5,4(s11)
80409914:	008daa03          	lw	s4,8(s11)
80409918:	00f12223          	sw	a5,4(sp)
8040991c:	120a0463          	beqz	s4,80409a44 <stride_dequeue+0x8d0>
80409920:	000c8593          	mv	a1,s9
80409924:	000a0513          	mv	a0,s4
80409928:	cb8ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040992c:	fff00893          	li	a7,-1
80409930:	4b1500e3          	beq	a0,a7,8040a5d0 <stride_dequeue+0x145c>
80409934:	004ca783          	lw	a5,4(s9)
80409938:	008ca803          	lw	a6,8(s9)
8040993c:	00f12423          	sw	a5,8(sp)
80409940:	0e080a63          	beqz	a6,80409a34 <stride_dequeue+0x8c0>
80409944:	00080593          	mv	a1,a6
80409948:	000a0513          	mv	a0,s4
8040994c:	01012623          	sw	a6,12(sp)
80409950:	c90ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409954:	fff00893          	li	a7,-1
80409958:	00c12803          	lw	a6,12(sp)
8040995c:	01151463          	bne	a0,a7,80409964 <stride_dequeue+0x7f0>
80409960:	4e00106f          	j	8040ae40 <stride_dequeue+0x1ccc>
80409964:	00482783          	lw	a5,4(a6)
80409968:	00882983          	lw	s3,8(a6)
8040996c:	00f12623          	sw	a5,12(sp)
80409970:	00099463          	bnez	s3,80409978 <stride_dequeue+0x804>
80409974:	2b00206f          	j	8040bc24 <stride_dequeue+0x2ab0>
80409978:	00098593          	mv	a1,s3
8040997c:	000a0513          	mv	a0,s4
80409980:	01012823          	sw	a6,16(sp)
80409984:	c5cff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409988:	fff00893          	li	a7,-1
8040998c:	01012803          	lw	a6,16(sp)
80409990:	01151463          	bne	a0,a7,80409998 <stride_dequeue+0x824>
80409994:	7a10106f          	j	8040b934 <stride_dequeue+0x27c0>
80409998:	0049a783          	lw	a5,4(s3)
8040999c:	0089ae03          	lw	t3,8(s3)
804099a0:	00f12823          	sw	a5,16(sp)
804099a4:	060e0463          	beqz	t3,80409a0c <stride_dequeue+0x898>
804099a8:	000e0593          	mv	a1,t3
804099ac:	000a0513          	mv	a0,s4
804099b0:	01012c23          	sw	a6,24(sp)
804099b4:	01c12a23          	sw	t3,20(sp)
804099b8:	c28ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
804099bc:	fff00893          	li	a7,-1
804099c0:	01412e03          	lw	t3,20(sp)
804099c4:	01812803          	lw	a6,24(sp)
804099c8:	01151463          	bne	a0,a7,804099d0 <stride_dequeue+0x85c>
804099cc:	59c0206f          	j	8040bf68 <stride_dequeue+0x2df4>
804099d0:	008e2583          	lw	a1,8(t3)
804099d4:	000a0513          	mv	a0,s4
804099d8:	004e2b03          	lw	s6,4(t3)
804099dc:	01012c23          	sw	a6,24(sp)
804099e0:	01c12a23          	sw	t3,20(sp)
804099e4:	cb8ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
804099e8:	01412e03          	lw	t3,20(sp)
804099ec:	01812803          	lw	a6,24(sp)
804099f0:	00ae2223          	sw	a0,4(t3)
804099f4:	016e2423          	sw	s6,8(t3)
804099f8:	00051463          	bnez	a0,80409a00 <stride_dequeue+0x88c>
804099fc:	7d00206f          	j	8040c1cc <stride_dequeue+0x3058>
80409a00:	008c2b03          	lw	s6,8(s8)
80409a04:	01c52023          	sw	t3,0(a0)
80409a08:	000e0a13          	mv	s4,t3
80409a0c:	01012783          	lw	a5,16(sp)
80409a10:	0149a223          	sw	s4,4(s3)
80409a14:	00f9a423          	sw	a5,8(s3)
80409a18:	013a2023          	sw	s3,0(s4)
80409a1c:	00c12783          	lw	a5,12(sp)
80409a20:	01382223          	sw	s3,4(a6)
80409a24:	00080a13          	mv	s4,a6
80409a28:	00f82423          	sw	a5,8(a6)
80409a2c:	0109a023          	sw	a6,0(s3)
80409a30:	000b0993          	mv	s3,s6
80409a34:	00812783          	lw	a5,8(sp)
80409a38:	014ca223          	sw	s4,4(s9)
80409a3c:	00fca423          	sw	a5,8(s9)
80409a40:	019a2023          	sw	s9,0(s4)
80409a44:	00412783          	lw	a5,4(sp)
80409a48:	019da223          	sw	s9,4(s11)
80409a4c:	00fda423          	sw	a5,8(s11)
80409a50:	01bca023          	sw	s11,0(s9)
80409a54:	b41ff06f          	j	80409594 <stride_dequeue+0x420>
80409a58:	004da783          	lw	a5,4(s11)
80409a5c:	008da603          	lw	a2,8(s11)
80409a60:	00f12023          	sw	a5,0(sp)
80409a64:	14060463          	beqz	a2,80409bac <stride_dequeue+0xa38>
80409a68:	00060513          	mv	a0,a2
80409a6c:	000a0593          	mv	a1,s4
80409a70:	00c12223          	sw	a2,4(sp)
80409a74:	b6cff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409a78:	fff00893          	li	a7,-1
80409a7c:	00412603          	lw	a2,4(sp)
80409a80:	111502e3          	beq	a0,a7,8040a384 <stride_dequeue+0x1210>
80409a84:	004a2783          	lw	a5,4(s4)
80409a88:	008a2803          	lw	a6,8(s4)
80409a8c:	00f12223          	sw	a5,4(sp)
80409a90:	10080663          	beqz	a6,80409b9c <stride_dequeue+0xa28>
80409a94:	00080593          	mv	a1,a6
80409a98:	00060513          	mv	a0,a2
80409a9c:	01012623          	sw	a6,12(sp)
80409aa0:	00c12423          	sw	a2,8(sp)
80409aa4:	b3cff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409aa8:	fff00893          	li	a7,-1
80409aac:	00812603          	lw	a2,8(sp)
80409ab0:	00c12803          	lw	a6,12(sp)
80409ab4:	01151463          	bne	a0,a7,80409abc <stride_dequeue+0x948>
80409ab8:	5540106f          	j	8040b00c <stride_dequeue+0x1e98>
80409abc:	00482783          	lw	a5,4(a6)
80409ac0:	00882983          	lw	s3,8(a6)
80409ac4:	00f12423          	sw	a5,8(sp)
80409ac8:	00099463          	bnez	s3,80409ad0 <stride_dequeue+0x95c>
80409acc:	1980206f          	j	8040bc64 <stride_dequeue+0x2af0>
80409ad0:	00060513          	mv	a0,a2
80409ad4:	00098593          	mv	a1,s3
80409ad8:	01012823          	sw	a6,16(sp)
80409adc:	00c12623          	sw	a2,12(sp)
80409ae0:	b00ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409ae4:	fff00893          	li	a7,-1
80409ae8:	00c12603          	lw	a2,12(sp)
80409aec:	01012803          	lw	a6,16(sp)
80409af0:	01151463          	bne	a0,a7,80409af8 <stride_dequeue+0x984>
80409af4:	4290106f          	j	8040b71c <stride_dequeue+0x25a8>
80409af8:	0049a783          	lw	a5,4(s3)
80409afc:	0089ae03          	lw	t3,8(s3)
80409b00:	00f12623          	sw	a5,12(sp)
80409b04:	060e0863          	beqz	t3,80409b74 <stride_dequeue+0xa00>
80409b08:	000e0593          	mv	a1,t3
80409b0c:	00060513          	mv	a0,a2
80409b10:	01012c23          	sw	a6,24(sp)
80409b14:	01c12a23          	sw	t3,20(sp)
80409b18:	00c12823          	sw	a2,16(sp)
80409b1c:	ac4ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409b20:	01812803          	lw	a6,24(sp)
80409b24:	01412e03          	lw	t3,20(sp)
80409b28:	fff00893          	li	a7,-1
80409b2c:	01012a23          	sw	a6,20(sp)
80409b30:	01012603          	lw	a2,16(sp)
80409b34:	01151463          	bne	a0,a7,80409b3c <stride_dequeue+0x9c8>
80409b38:	3a00206f          	j	8040bed8 <stride_dequeue+0x2d64>
80409b3c:	008e2583          	lw	a1,8(t3)
80409b40:	00060513          	mv	a0,a2
80409b44:	004e2b03          	lw	s6,4(t3)
80409b48:	01c12823          	sw	t3,16(sp)
80409b4c:	b50ff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409b50:	01012e03          	lw	t3,16(sp)
80409b54:	01412803          	lw	a6,20(sp)
80409b58:	00ae2223          	sw	a0,4(t3)
80409b5c:	016e2423          	sw	s6,8(t3)
80409b60:	00051463          	bnez	a0,80409b68 <stride_dequeue+0x9f4>
80409b64:	62c0206f          	j	8040c190 <stride_dequeue+0x301c>
80409b68:	008c2b03          	lw	s6,8(s8)
80409b6c:	01c52023          	sw	t3,0(a0)
80409b70:	000e0613          	mv	a2,t3
80409b74:	00c12783          	lw	a5,12(sp)
80409b78:	00c9a223          	sw	a2,4(s3)
80409b7c:	00f9a423          	sw	a5,8(s3)
80409b80:	01362023          	sw	s3,0(a2)
80409b84:	00812783          	lw	a5,8(sp)
80409b88:	01382223          	sw	s3,4(a6)
80409b8c:	00080613          	mv	a2,a6
80409b90:	00f82423          	sw	a5,8(a6)
80409b94:	0109a023          	sw	a6,0(s3)
80409b98:	000b0993          	mv	s3,s6
80409b9c:	00412783          	lw	a5,4(sp)
80409ba0:	00ca2223          	sw	a2,4(s4)
80409ba4:	00fa2423          	sw	a5,8(s4)
80409ba8:	01462023          	sw	s4,0(a2)
80409bac:	00012783          	lw	a5,0(sp)
80409bb0:	014da223          	sw	s4,4(s11)
80409bb4:	00fda423          	sw	a5,8(s11)
80409bb8:	01ba2023          	sw	s11,0(s4)
80409bbc:	000d8a13          	mv	s4,s11
80409bc0:	badff06f          	j	8040976c <stride_dequeue+0x5f8>
80409bc4:	00492783          	lw	a5,4(s2)
80409bc8:	00892883          	lw	a7,8(s2)
80409bcc:	00a12623          	sw	a0,12(sp)
80409bd0:	00f12423          	sw	a5,8(sp)
80409bd4:	0e088863          	beqz	a7,80409cc4 <stride_dequeue+0xb50>
80409bd8:	00088513          	mv	a0,a7
80409bdc:	000c8593          	mv	a1,s9
80409be0:	01112823          	sw	a7,16(sp)
80409be4:	9fcff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409be8:	00c12803          	lw	a6,12(sp)
80409bec:	01012883          	lw	a7,16(sp)
80409bf0:	2f050ce3          	beq	a0,a6,8040a6e8 <stride_dequeue+0x1574>
80409bf4:	004ca783          	lw	a5,4(s9)
80409bf8:	008ca303          	lw	t1,8(s9)
80409bfc:	01012823          	sw	a6,16(sp)
80409c00:	00f12623          	sw	a5,12(sp)
80409c04:	0a030863          	beqz	t1,80409cb4 <stride_dequeue+0xb40>
80409c08:	00030593          	mv	a1,t1
80409c0c:	00088513          	mv	a0,a7
80409c10:	00612c23          	sw	t1,24(sp)
80409c14:	01112a23          	sw	a7,20(sp)
80409c18:	9c8ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409c1c:	01012803          	lw	a6,16(sp)
80409c20:	01412883          	lw	a7,20(sp)
80409c24:	01812303          	lw	t1,24(sp)
80409c28:	01051463          	bne	a0,a6,80409c30 <stride_dequeue+0xabc>
80409c2c:	6f00106f          	j	8040b31c <stride_dequeue+0x21a8>
80409c30:	00432783          	lw	a5,4(t1)
80409c34:	00832983          	lw	s3,8(t1)
80409c38:	01012a23          	sw	a6,20(sp)
80409c3c:	00f12823          	sw	a5,16(sp)
80409c40:	00099463          	bnez	s3,80409c48 <stride_dequeue+0xad4>
80409c44:	3e50106f          	j	8040b828 <stride_dequeue+0x26b4>
80409c48:	00088513          	mv	a0,a7
80409c4c:	00098593          	mv	a1,s3
80409c50:	00612e23          	sw	t1,28(sp)
80409c54:	01112c23          	sw	a7,24(sp)
80409c58:	988ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409c5c:	01412803          	lw	a6,20(sp)
80409c60:	01812883          	lw	a7,24(sp)
80409c64:	01c12303          	lw	t1,28(sp)
80409c68:	01051463          	bne	a0,a6,80409c70 <stride_dequeue+0xafc>
80409c6c:	6d90106f          	j	8040bb44 <stride_dequeue+0x29d0>
80409c70:	0089a583          	lw	a1,8(s3)
80409c74:	0049ab03          	lw	s6,4(s3)
80409c78:	00088513          	mv	a0,a7
80409c7c:	00612a23          	sw	t1,20(sp)
80409c80:	a1cff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409c84:	00a9a223          	sw	a0,4(s3)
80409c88:	0169a423          	sw	s6,8(s3)
80409c8c:	01412303          	lw	t1,20(sp)
80409c90:	00050463          	beqz	a0,80409c98 <stride_dequeue+0xb24>
80409c94:	01352023          	sw	s3,0(a0)
80409c98:	008c2b03          	lw	s6,8(s8)
80409c9c:	01012783          	lw	a5,16(sp)
80409ca0:	01332223          	sw	s3,4(t1)
80409ca4:	00030893          	mv	a7,t1
80409ca8:	00f32423          	sw	a5,8(t1)
80409cac:	0069a023          	sw	t1,0(s3)
80409cb0:	000b0993          	mv	s3,s6
80409cb4:	00c12783          	lw	a5,12(sp)
80409cb8:	011ca223          	sw	a7,4(s9)
80409cbc:	00fca423          	sw	a5,8(s9)
80409cc0:	0198a023          	sw	s9,0(a7) # 2000 <_binary_bin_swap_img_size-0x6000>
80409cc4:	00812783          	lw	a5,8(sp)
80409cc8:	01992223          	sw	s9,4(s2)
80409ccc:	00f92423          	sw	a5,8(s2)
80409cd0:	012ca023          	sw	s2,0(s9)
80409cd4:	ea0ff06f          	j	80409374 <stride_dequeue+0x200>
80409cd8:	00492783          	lw	a5,4(s2)
80409cdc:	00892c83          	lw	s9,8(s2)
80409ce0:	00f12223          	sw	a5,4(sp)
80409ce4:	120c8463          	beqz	s9,80409e0c <stride_dequeue+0xc98>
80409ce8:	000d8593          	mv	a1,s11
80409cec:	000c8513          	mv	a0,s9
80409cf0:	8f0ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409cf4:	fff00893          	li	a7,-1
80409cf8:	27150663          	beq	a0,a7,80409f64 <stride_dequeue+0xdf0>
80409cfc:	004da783          	lw	a5,4(s11)
80409d00:	008da803          	lw	a6,8(s11)
80409d04:	00f12423          	sw	a5,8(sp)
80409d08:	0e080a63          	beqz	a6,80409dfc <stride_dequeue+0xc88>
80409d0c:	00080593          	mv	a1,a6
80409d10:	000c8513          	mv	a0,s9
80409d14:	01012623          	sw	a6,12(sp)
80409d18:	8c8ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409d1c:	fff00893          	li	a7,-1
80409d20:	00c12803          	lw	a6,12(sp)
80409d24:	29150ee3          	beq	a0,a7,8040a7c0 <stride_dequeue+0x164c>
80409d28:	00482783          	lw	a5,4(a6)
80409d2c:	00882303          	lw	t1,8(a6)
80409d30:	00f12623          	sw	a5,12(sp)
80409d34:	0a030a63          	beqz	t1,80409de8 <stride_dequeue+0xc74>
80409d38:	00030593          	mv	a1,t1
80409d3c:	000c8513          	mv	a0,s9
80409d40:	01012a23          	sw	a6,20(sp)
80409d44:	00612823          	sw	t1,16(sp)
80409d48:	898ff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409d4c:	fff00893          	li	a7,-1
80409d50:	01012303          	lw	t1,16(sp)
80409d54:	01412803          	lw	a6,20(sp)
80409d58:	01151463          	bne	a0,a7,80409d60 <stride_dequeue+0xbec>
80409d5c:	4b80106f          	j	8040b214 <stride_dequeue+0x20a0>
80409d60:	00432783          	lw	a5,4(t1)
80409d64:	00832983          	lw	s3,8(t1)
80409d68:	00f12823          	sw	a5,16(sp)
80409d6c:	00099463          	bnez	s3,80409d74 <stride_dequeue+0xc00>
80409d70:	4c10106f          	j	8040ba30 <stride_dequeue+0x28bc>
80409d74:	00098593          	mv	a1,s3
80409d78:	000c8513          	mv	a0,s9
80409d7c:	00612c23          	sw	t1,24(sp)
80409d80:	01012a23          	sw	a6,20(sp)
80409d84:	85cff0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409d88:	fff00893          	li	a7,-1
80409d8c:	01412803          	lw	a6,20(sp)
80409d90:	01812303          	lw	t1,24(sp)
80409d94:	01151463          	bne	a0,a7,80409d9c <stride_dequeue+0xc28>
80409d98:	5e90106f          	j	8040bb80 <stride_dequeue+0x2a0c>
80409d9c:	0089a583          	lw	a1,8(s3)
80409da0:	0049ab03          	lw	s6,4(s3)
80409da4:	000c8513          	mv	a0,s9
80409da8:	00612c23          	sw	t1,24(sp)
80409dac:	01012a23          	sw	a6,20(sp)
80409db0:	8ecff0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409db4:	00a9a223          	sw	a0,4(s3)
80409db8:	0169a423          	sw	s6,8(s3)
80409dbc:	01412803          	lw	a6,20(sp)
80409dc0:	01812303          	lw	t1,24(sp)
80409dc4:	00050463          	beqz	a0,80409dcc <stride_dequeue+0xc58>
80409dc8:	01352023          	sw	s3,0(a0)
80409dcc:	008c2b03          	lw	s6,8(s8)
80409dd0:	01012783          	lw	a5,16(sp)
80409dd4:	01332223          	sw	s3,4(t1)
80409dd8:	00030c93          	mv	s9,t1
80409ddc:	00f32423          	sw	a5,8(t1)
80409de0:	0069a023          	sw	t1,0(s3)
80409de4:	000b0993          	mv	s3,s6
80409de8:	00c12783          	lw	a5,12(sp)
80409dec:	01982223          	sw	s9,4(a6)
80409df0:	00f82423          	sw	a5,8(a6)
80409df4:	010ca023          	sw	a6,0(s9)
80409df8:	00080c93          	mv	s9,a6
80409dfc:	00812783          	lw	a5,8(sp)
80409e00:	019da223          	sw	s9,4(s11)
80409e04:	00fda423          	sw	a5,8(s11)
80409e08:	01bca023          	sw	s11,0(s9)
80409e0c:	00412783          	lw	a5,4(sp)
80409e10:	01b92223          	sw	s11,4(s2)
80409e14:	00f92423          	sw	a5,8(s2)
80409e18:	012da023          	sw	s2,0(s11)
80409e1c:	d6cff06f          	j	80409388 <stride_dequeue+0x214>
80409e20:	004ca783          	lw	a5,4(s9)
80409e24:	008caa03          	lw	s4,8(s9)
80409e28:	00f12223          	sw	a5,4(sp)
80409e2c:	120a0063          	beqz	s4,80409f4c <stride_dequeue+0xdd8>
80409e30:	00040593          	mv	a1,s0
80409e34:	000a0513          	mv	a0,s4
80409e38:	fa9fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409e3c:	fff00893          	li	a7,-1
80409e40:	49150ee3          	beq	a0,a7,8040aadc <stride_dequeue+0x1968>
80409e44:	00442783          	lw	a5,4(s0)
80409e48:	00842983          	lw	s3,8(s0)
80409e4c:	00f12423          	sw	a5,8(sp)
80409e50:	00099463          	bnez	s3,80409e58 <stride_dequeue+0xce4>
80409e54:	4710106f          	j	8040bac4 <stride_dequeue+0x2950>
80409e58:	00098593          	mv	a1,s3
80409e5c:	000a0513          	mv	a0,s4
80409e60:	f81fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409e64:	fff00893          	li	a7,-1
80409e68:	01151463          	bne	a0,a7,80409e70 <stride_dequeue+0xcfc>
80409e6c:	5dc0106f          	j	8040b448 <stride_dequeue+0x22d4>
80409e70:	0049a783          	lw	a5,4(s3)
80409e74:	0089a303          	lw	t1,8(s3)
80409e78:	00f12623          	sw	a5,12(sp)
80409e7c:	0a030663          	beqz	t1,80409f28 <stride_dequeue+0xdb4>
80409e80:	00030593          	mv	a1,t1
80409e84:	000a0513          	mv	a0,s4
80409e88:	00612823          	sw	t1,16(sp)
80409e8c:	f55fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409e90:	fff00893          	li	a7,-1
80409e94:	01012303          	lw	t1,16(sp)
80409e98:	01151463          	bne	a0,a7,80409ea0 <stride_dequeue+0xd2c>
80409e9c:	1cc0206f          	j	8040c068 <stride_dequeue+0x2ef4>
80409ea0:	00432783          	lw	a5,4(t1)
80409ea4:	00832e03          	lw	t3,8(t1)
80409ea8:	00f12823          	sw	a5,16(sp)
80409eac:	060e0463          	beqz	t3,80409f14 <stride_dequeue+0xda0>
80409eb0:	000e0593          	mv	a1,t3
80409eb4:	000a0513          	mv	a0,s4
80409eb8:	00612c23          	sw	t1,24(sp)
80409ebc:	01c12a23          	sw	t3,20(sp)
80409ec0:	f21fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409ec4:	fff00893          	li	a7,-1
80409ec8:	01412e03          	lw	t3,20(sp)
80409ecc:	01812303          	lw	t1,24(sp)
80409ed0:	01151463          	bne	a0,a7,80409ed8 <stride_dequeue+0xd64>
80409ed4:	66c0206f          	j	8040c540 <stride_dequeue+0x33cc>
80409ed8:	008e2583          	lw	a1,8(t3)
80409edc:	000a0513          	mv	a0,s4
80409ee0:	004e2b03          	lw	s6,4(t3)
80409ee4:	00612c23          	sw	t1,24(sp)
80409ee8:	01c12a23          	sw	t3,20(sp)
80409eec:	fb1fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
80409ef0:	01412e03          	lw	t3,20(sp)
80409ef4:	01812303          	lw	t1,24(sp)
80409ef8:	00ae2223          	sw	a0,4(t3)
80409efc:	016e2423          	sw	s6,8(t3)
80409f00:	00051463          	bnez	a0,80409f08 <stride_dequeue+0xd94>
80409f04:	1110206f          	j	8040c814 <stride_dequeue+0x36a0>
80409f08:	008c2b03          	lw	s6,8(s8)
80409f0c:	01c52023          	sw	t3,0(a0)
80409f10:	000e0a13          	mv	s4,t3
80409f14:	01012783          	lw	a5,16(sp)
80409f18:	01432223          	sw	s4,4(t1)
80409f1c:	00f32423          	sw	a5,8(t1)
80409f20:	006a2023          	sw	t1,0(s4)
80409f24:	00030a13          	mv	s4,t1
80409f28:	00c12783          	lw	a5,12(sp)
80409f2c:	0149a223          	sw	s4,4(s3)
80409f30:	00f9a423          	sw	a5,8(s3)
80409f34:	013a2023          	sw	s3,0(s4)
80409f38:	00812783          	lw	a5,8(sp)
80409f3c:	01342223          	sw	s3,4(s0)
80409f40:	00f42423          	sw	a5,8(s0)
80409f44:	0089a023          	sw	s0,0(s3)
80409f48:	000b0993          	mv	s3,s6
80409f4c:	00412783          	lw	a5,4(sp)
80409f50:	008ca223          	sw	s0,4(s9)
80409f54:	00fca423          	sw	a5,8(s9)
80409f58:	01942023          	sw	s9,0(s0)
80409f5c:	000c8413          	mv	s0,s9
80409f60:	999ff06f          	j	804098f8 <stride_dequeue+0x784>
80409f64:	004ca783          	lw	a5,4(s9)
80409f68:	008ca883          	lw	a7,8(s9)
80409f6c:	00a12623          	sw	a0,12(sp)
80409f70:	00f12423          	sw	a5,8(sp)
80409f74:	0e088663          	beqz	a7,8040a060 <stride_dequeue+0xeec>
80409f78:	00088513          	mv	a0,a7
80409f7c:	000d8593          	mv	a1,s11
80409f80:	01112823          	sw	a7,16(sp)
80409f84:	e5dfe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409f88:	00c12803          	lw	a6,12(sp)
80409f8c:	01012883          	lw	a7,16(sp)
80409f90:	41050ae3          	beq	a0,a6,8040aba4 <stride_dequeue+0x1a30>
80409f94:	004da783          	lw	a5,4(s11)
80409f98:	008da983          	lw	s3,8(s11)
80409f9c:	01012823          	sw	a6,16(sp)
80409fa0:	00f12623          	sw	a5,12(sp)
80409fa4:	00099463          	bnez	s3,80409fac <stride_dequeue+0xe38>
80409fa8:	4b50106f          	j	8040bc5c <stride_dequeue+0x2ae8>
80409fac:	00088513          	mv	a0,a7
80409fb0:	00098593          	mv	a1,s3
80409fb4:	01112a23          	sw	a7,20(sp)
80409fb8:	e29fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409fbc:	01012803          	lw	a6,16(sp)
80409fc0:	01412883          	lw	a7,20(sp)
80409fc4:	01051463          	bne	a0,a6,80409fcc <stride_dequeue+0xe58>
80409fc8:	64c0106f          	j	8040b614 <stride_dequeue+0x24a0>
80409fcc:	0049a783          	lw	a5,4(s3)
80409fd0:	0089ae03          	lw	t3,8(s3)
80409fd4:	01012a23          	sw	a6,20(sp)
80409fd8:	00f12823          	sw	a5,16(sp)
80409fdc:	060e0063          	beqz	t3,8040a03c <stride_dequeue+0xec8>
80409fe0:	000e0593          	mv	a1,t3
80409fe4:	00088513          	mv	a0,a7
80409fe8:	01c12e23          	sw	t3,28(sp)
80409fec:	01112c23          	sw	a7,24(sp)
80409ff0:	df1fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
80409ff4:	01412803          	lw	a6,20(sp)
80409ff8:	01812883          	lw	a7,24(sp)
80409ffc:	01c12e03          	lw	t3,28(sp)
8040a000:	01051463          	bne	a0,a6,8040a008 <stride_dequeue+0xe94>
8040a004:	0bc0206f          	j	8040c0c0 <stride_dequeue+0x2f4c>
8040a008:	008e2583          	lw	a1,8(t3)
8040a00c:	00088513          	mv	a0,a7
8040a010:	004e2b03          	lw	s6,4(t3)
8040a014:	01c12a23          	sw	t3,20(sp)
8040a018:	e85fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a01c:	01412e03          	lw	t3,20(sp)
8040a020:	00ae2223          	sw	a0,4(t3)
8040a024:	016e2423          	sw	s6,8(t3)
8040a028:	00051463          	bnez	a0,8040a030 <stride_dequeue+0xebc>
8040a02c:	2380206f          	j	8040c264 <stride_dequeue+0x30f0>
8040a030:	008c2b03          	lw	s6,8(s8)
8040a034:	01c52023          	sw	t3,0(a0)
8040a038:	000e0893          	mv	a7,t3
8040a03c:	01012783          	lw	a5,16(sp)
8040a040:	0119a223          	sw	a7,4(s3)
8040a044:	00f9a423          	sw	a5,8(s3)
8040a048:	0138a023          	sw	s3,0(a7)
8040a04c:	00c12783          	lw	a5,12(sp)
8040a050:	013da223          	sw	s3,4(s11)
8040a054:	00fda423          	sw	a5,8(s11)
8040a058:	01b9a023          	sw	s11,0(s3)
8040a05c:	000b0993          	mv	s3,s6
8040a060:	00812783          	lw	a5,8(sp)
8040a064:	01bca223          	sw	s11,4(s9)
8040a068:	00fca423          	sw	a5,8(s9)
8040a06c:	019da023          	sw	s9,0(s11)
8040a070:	000c8d93          	mv	s11,s9
8040a074:	d99ff06f          	j	80409e0c <stride_dequeue+0xc98>
8040a078:	004da783          	lw	a5,4(s11)
8040a07c:	008da883          	lw	a7,8(s11)
8040a080:	00a12423          	sw	a0,8(sp)
8040a084:	00f12223          	sw	a5,4(sp)
8040a088:	10088663          	beqz	a7,8040a194 <stride_dequeue+0x1020>
8040a08c:	00060593          	mv	a1,a2
8040a090:	00088513          	mv	a0,a7
8040a094:	00c12823          	sw	a2,16(sp)
8040a098:	01112623          	sw	a7,12(sp)
8040a09c:	d45fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a0a0:	00812803          	lw	a6,8(sp)
8040a0a4:	00c12883          	lw	a7,12(sp)
8040a0a8:	01012603          	lw	a2,16(sp)
8040a0ac:	670508e3          	beq	a0,a6,8040af1c <stride_dequeue+0x1da8>
8040a0b0:	00462783          	lw	a5,4(a2)
8040a0b4:	00862983          	lw	s3,8(a2)
8040a0b8:	01012623          	sw	a6,12(sp)
8040a0bc:	00f12423          	sw	a5,8(sp)
8040a0c0:	00099463          	bnez	s3,8040a0c8 <stride_dequeue+0xf54>
8040a0c4:	3910106f          	j	8040bc54 <stride_dequeue+0x2ae0>
8040a0c8:	00088513          	mv	a0,a7
8040a0cc:	00098593          	mv	a1,s3
8040a0d0:	00c12a23          	sw	a2,20(sp)
8040a0d4:	01112823          	sw	a7,16(sp)
8040a0d8:	d09fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a0dc:	00c12803          	lw	a6,12(sp)
8040a0e0:	01012883          	lw	a7,16(sp)
8040a0e4:	01412603          	lw	a2,20(sp)
8040a0e8:	01051463          	bne	a0,a6,8040a0f0 <stride_dequeue+0xf7c>
8040a0ec:	5a40106f          	j	8040b690 <stride_dequeue+0x251c>
8040a0f0:	0049a783          	lw	a5,4(s3)
8040a0f4:	0089ae03          	lw	t3,8(s3)
8040a0f8:	01012823          	sw	a6,16(sp)
8040a0fc:	00f12623          	sw	a5,12(sp)
8040a100:	060e0863          	beqz	t3,8040a170 <stride_dequeue+0xffc>
8040a104:	000e0593          	mv	a1,t3
8040a108:	00088513          	mv	a0,a7
8040a10c:	00c12e23          	sw	a2,28(sp)
8040a110:	01c12c23          	sw	t3,24(sp)
8040a114:	01112a23          	sw	a7,20(sp)
8040a118:	cc9fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a11c:	01c12603          	lw	a2,28(sp)
8040a120:	01012803          	lw	a6,16(sp)
8040a124:	01412883          	lw	a7,20(sp)
8040a128:	00c12a23          	sw	a2,20(sp)
8040a12c:	01812e03          	lw	t3,24(sp)
8040a130:	01051463          	bne	a0,a6,8040a138 <stride_dequeue+0xfc4>
8040a134:	5210106f          	j	8040be54 <stride_dequeue+0x2ce0>
8040a138:	008e2583          	lw	a1,8(t3)
8040a13c:	00088513          	mv	a0,a7
8040a140:	004e2b03          	lw	s6,4(t3)
8040a144:	01c12823          	sw	t3,16(sp)
8040a148:	d55fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a14c:	01012e03          	lw	t3,16(sp)
8040a150:	01412603          	lw	a2,20(sp)
8040a154:	00ae2223          	sw	a0,4(t3)
8040a158:	016e2423          	sw	s6,8(t3)
8040a15c:	00051463          	bnez	a0,8040a164 <stride_dequeue+0xff0>
8040a160:	1280206f          	j	8040c288 <stride_dequeue+0x3114>
8040a164:	008c2b03          	lw	s6,8(s8)
8040a168:	01c52023          	sw	t3,0(a0)
8040a16c:	000e0893          	mv	a7,t3
8040a170:	00c12783          	lw	a5,12(sp)
8040a174:	0119a223          	sw	a7,4(s3)
8040a178:	00f9a423          	sw	a5,8(s3)
8040a17c:	0138a023          	sw	s3,0(a7)
8040a180:	00812783          	lw	a5,8(sp)
8040a184:	01362223          	sw	s3,4(a2)
8040a188:	00f62423          	sw	a5,8(a2)
8040a18c:	00c9a023          	sw	a2,0(s3)
8040a190:	000b0993          	mv	s3,s6
8040a194:	00412783          	lw	a5,4(sp)
8040a198:	00cda223          	sw	a2,4(s11)
8040a19c:	00fda423          	sw	a5,8(s11)
8040a1a0:	01b62023          	sw	s11,0(a2)
8040a1a4:	db8ff06f          	j	8040975c <stride_dequeue+0x5e8>
8040a1a8:	004da783          	lw	a5,4(s11)
8040a1ac:	008da883          	lw	a7,8(s11)
8040a1b0:	00a12623          	sw	a0,12(sp)
8040a1b4:	00f12423          	sw	a5,8(sp)
8040a1b8:	0e088663          	beqz	a7,8040a2a4 <stride_dequeue+0x1130>
8040a1bc:	00088513          	mv	a0,a7
8040a1c0:	000a0593          	mv	a1,s4
8040a1c4:	01112823          	sw	a7,16(sp)
8040a1c8:	c19fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a1cc:	00c12803          	lw	a6,12(sp)
8040a1d0:	01012883          	lw	a7,16(sp)
8040a1d4:	2b0508e3          	beq	a0,a6,8040ac84 <stride_dequeue+0x1b10>
8040a1d8:	004a2783          	lw	a5,4(s4)
8040a1dc:	008a2983          	lw	s3,8(s4)
8040a1e0:	01012823          	sw	a6,16(sp)
8040a1e4:	00f12623          	sw	a5,12(sp)
8040a1e8:	00099463          	bnez	s3,8040a1f0 <stride_dequeue+0x107c>
8040a1ec:	2810106f          	j	8040bc6c <stride_dequeue+0x2af8>
8040a1f0:	00088513          	mv	a0,a7
8040a1f4:	00098593          	mv	a1,s3
8040a1f8:	01112a23          	sw	a7,20(sp)
8040a1fc:	be5fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a200:	01012803          	lw	a6,16(sp)
8040a204:	01412883          	lw	a7,20(sp)
8040a208:	01051463          	bne	a0,a6,8040a210 <stride_dequeue+0x109c>
8040a20c:	38c0106f          	j	8040b598 <stride_dequeue+0x2424>
8040a210:	0049a783          	lw	a5,4(s3)
8040a214:	0089ae03          	lw	t3,8(s3)
8040a218:	01012a23          	sw	a6,20(sp)
8040a21c:	00f12823          	sw	a5,16(sp)
8040a220:	060e0063          	beqz	t3,8040a280 <stride_dequeue+0x110c>
8040a224:	000e0593          	mv	a1,t3
8040a228:	00088513          	mv	a0,a7
8040a22c:	01c12e23          	sw	t3,28(sp)
8040a230:	01112c23          	sw	a7,24(sp)
8040a234:	badfe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a238:	01412803          	lw	a6,20(sp)
8040a23c:	01812883          	lw	a7,24(sp)
8040a240:	01c12e03          	lw	t3,28(sp)
8040a244:	01051463          	bne	a0,a6,8040a24c <stride_dequeue+0x10d8>
8040a248:	2890106f          	j	8040bcd0 <stride_dequeue+0x2b5c>
8040a24c:	008e2583          	lw	a1,8(t3)
8040a250:	00088513          	mv	a0,a7
8040a254:	004e2b03          	lw	s6,4(t3)
8040a258:	01c12a23          	sw	t3,20(sp)
8040a25c:	c41fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a260:	01412e03          	lw	t3,20(sp)
8040a264:	00ae2223          	sw	a0,4(t3)
8040a268:	016e2423          	sw	s6,8(t3)
8040a26c:	00051463          	bnez	a0,8040a274 <stride_dequeue+0x1100>
8040a270:	7b50106f          	j	8040c224 <stride_dequeue+0x30b0>
8040a274:	008c2b03          	lw	s6,8(s8)
8040a278:	01c52023          	sw	t3,0(a0)
8040a27c:	000e0893          	mv	a7,t3
8040a280:	01012783          	lw	a5,16(sp)
8040a284:	0119a223          	sw	a7,4(s3)
8040a288:	00f9a423          	sw	a5,8(s3)
8040a28c:	0138a023          	sw	s3,0(a7)
8040a290:	00c12783          	lw	a5,12(sp)
8040a294:	013a2223          	sw	s3,4(s4)
8040a298:	00fa2423          	sw	a5,8(s4)
8040a29c:	0149a023          	sw	s4,0(s3)
8040a2a0:	000b0993          	mv	s3,s6
8040a2a4:	00812783          	lw	a5,8(sp)
8040a2a8:	014da223          	sw	s4,4(s11)
8040a2ac:	00fda423          	sw	a5,8(s11)
8040a2b0:	01ba2023          	sw	s11,0(s4)
8040a2b4:	accff06f          	j	80409580 <stride_dequeue+0x40c>
8040a2b8:	00492783          	lw	a5,4(s2)
8040a2bc:	00892883          	lw	a7,8(s2)
8040a2c0:	00a12823          	sw	a0,16(sp)
8040a2c4:	00f12623          	sw	a5,12(sp)
8040a2c8:	0a088463          	beqz	a7,8040a370 <stride_dequeue+0x11fc>
8040a2cc:	00080593          	mv	a1,a6
8040a2d0:	00088513          	mv	a0,a7
8040a2d4:	01012c23          	sw	a6,24(sp)
8040a2d8:	01112a23          	sw	a7,20(sp)
8040a2dc:	b05fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a2e0:	01012303          	lw	t1,16(sp)
8040a2e4:	01412883          	lw	a7,20(sp)
8040a2e8:	01812803          	lw	a6,24(sp)
8040a2ec:	606508e3          	beq	a0,t1,8040b0fc <stride_dequeue+0x1f88>
8040a2f0:	00482783          	lw	a5,4(a6)
8040a2f4:	00882983          	lw	s3,8(a6)
8040a2f8:	00612a23          	sw	t1,20(sp)
8040a2fc:	00f12823          	sw	a5,16(sp)
8040a300:	00099463          	bnez	s3,8040a308 <stride_dequeue+0x1194>
8040a304:	28c0106f          	j	8040b590 <stride_dequeue+0x241c>
8040a308:	00088513          	mv	a0,a7
8040a30c:	00098593          	mv	a1,s3
8040a310:	01012e23          	sw	a6,28(sp)
8040a314:	01112c23          	sw	a7,24(sp)
8040a318:	ac9fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a31c:	01412303          	lw	t1,20(sp)
8040a320:	01812883          	lw	a7,24(sp)
8040a324:	01c12803          	lw	a6,28(sp)
8040a328:	00651463          	bne	a0,t1,8040a330 <stride_dequeue+0x11bc>
8040a32c:	0bd0106f          	j	8040bbe8 <stride_dequeue+0x2a74>
8040a330:	0089a583          	lw	a1,8(s3)
8040a334:	0049ab03          	lw	s6,4(s3)
8040a338:	00088513          	mv	a0,a7
8040a33c:	01012a23          	sw	a6,20(sp)
8040a340:	b5dfe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a344:	00a9a223          	sw	a0,4(s3)
8040a348:	0169a423          	sw	s6,8(s3)
8040a34c:	01412803          	lw	a6,20(sp)
8040a350:	00050463          	beqz	a0,8040a358 <stride_dequeue+0x11e4>
8040a354:	01352023          	sw	s3,0(a0)
8040a358:	008c2b03          	lw	s6,8(s8)
8040a35c:	01012783          	lw	a5,16(sp)
8040a360:	01382223          	sw	s3,4(a6)
8040a364:	00f82423          	sw	a5,8(a6)
8040a368:	0109a023          	sw	a6,0(s3)
8040a36c:	000b0993          	mv	s3,s6
8040a370:	00c12783          	lw	a5,12(sp)
8040a374:	01092223          	sw	a6,4(s2)
8040a378:	00f92423          	sw	a5,8(s2)
8040a37c:	01282023          	sw	s2,0(a6)
8040a380:	fe1fe06f          	j	80409360 <stride_dequeue+0x1ec>
8040a384:	00462783          	lw	a5,4(a2)
8040a388:	00862983          	lw	s3,8(a2)
8040a38c:	00a12423          	sw	a0,8(sp)
8040a390:	00f12223          	sw	a5,4(sp)
8040a394:	10098663          	beqz	s3,8040a4a0 <stride_dequeue+0x132c>
8040a398:	000a0593          	mv	a1,s4
8040a39c:	00098513          	mv	a0,s3
8040a3a0:	00c12623          	sw	a2,12(sp)
8040a3a4:	a3dfe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a3a8:	00812303          	lw	t1,8(sp)
8040a3ac:	00c12603          	lw	a2,12(sp)
8040a3b0:	00651463          	bne	a0,t1,8040a3b8 <stride_dequeue+0x1244>
8040a3b4:	0180106f          	j	8040b3cc <stride_dequeue+0x2258>
8040a3b8:	004a2783          	lw	a5,4(s4)
8040a3bc:	008a2883          	lw	a7,8(s4)
8040a3c0:	00612623          	sw	t1,12(sp)
8040a3c4:	00f12423          	sw	a5,8(sp)
8040a3c8:	0c088463          	beqz	a7,8040a490 <stride_dequeue+0x131c>
8040a3cc:	00088593          	mv	a1,a7
8040a3d0:	00098513          	mv	a0,s3
8040a3d4:	00c12a23          	sw	a2,20(sp)
8040a3d8:	01112823          	sw	a7,16(sp)
8040a3dc:	a05fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a3e0:	00c12303          	lw	t1,12(sp)
8040a3e4:	01012883          	lw	a7,16(sp)
8040a3e8:	01412603          	lw	a2,20(sp)
8040a3ec:	00651463          	bne	a0,t1,8040a3f4 <stride_dequeue+0x1280>
8040a3f0:	4a10106f          	j	8040c090 <stride_dequeue+0x2f1c>
8040a3f4:	0048a783          	lw	a5,4(a7)
8040a3f8:	0088ae03          	lw	t3,8(a7)
8040a3fc:	00612e23          	sw	t1,28(sp)
8040a400:	00f12623          	sw	a5,12(sp)
8040a404:	060e0c63          	beqz	t3,8040a47c <stride_dequeue+0x1308>
8040a408:	000e0593          	mv	a1,t3
8040a40c:	00098513          	mv	a0,s3
8040a410:	01112c23          	sw	a7,24(sp)
8040a414:	00c12a23          	sw	a2,20(sp)
8040a418:	01c12823          	sw	t3,16(sp)
8040a41c:	9c5fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a420:	01c12303          	lw	t1,28(sp)
8040a424:	01012e03          	lw	t3,16(sp)
8040a428:	01412603          	lw	a2,20(sp)
8040a42c:	01812883          	lw	a7,24(sp)
8040a430:	00651463          	bne	a0,t1,8040a438 <stride_dequeue+0x12c4>
8040a434:	7d50106f          	j	8040c408 <stride_dequeue+0x3294>
8040a438:	008e2583          	lw	a1,8(t3)
8040a43c:	00098513          	mv	a0,s3
8040a440:	004e2b03          	lw	s6,4(t3)
8040a444:	01112c23          	sw	a7,24(sp)
8040a448:	00c12a23          	sw	a2,20(sp)
8040a44c:	01c12823          	sw	t3,16(sp)
8040a450:	a4dfe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a454:	01012e03          	lw	t3,16(sp)
8040a458:	01412603          	lw	a2,20(sp)
8040a45c:	01812883          	lw	a7,24(sp)
8040a460:	00ae2223          	sw	a0,4(t3)
8040a464:	016e2423          	sw	s6,8(t3)
8040a468:	00051463          	bnez	a0,8040a470 <stride_dequeue+0x12fc>
8040a46c:	2e80206f          	j	8040c754 <stride_dequeue+0x35e0>
8040a470:	008c2b03          	lw	s6,8(s8)
8040a474:	01c52023          	sw	t3,0(a0)
8040a478:	000e0993          	mv	s3,t3
8040a47c:	00c12783          	lw	a5,12(sp)
8040a480:	0138a223          	sw	s3,4(a7)
8040a484:	00f8a423          	sw	a5,8(a7)
8040a488:	0119a023          	sw	a7,0(s3)
8040a48c:	00088993          	mv	s3,a7
8040a490:	00812783          	lw	a5,8(sp)
8040a494:	013a2223          	sw	s3,4(s4)
8040a498:	00fa2423          	sw	a5,8(s4)
8040a49c:	0149a023          	sw	s4,0(s3)
8040a4a0:	00412783          	lw	a5,4(sp)
8040a4a4:	01462223          	sw	s4,4(a2)
8040a4a8:	000b0993          	mv	s3,s6
8040a4ac:	00f62423          	sw	a5,8(a2)
8040a4b0:	00ca2023          	sw	a2,0(s4)
8040a4b4:	00060a13          	mv	s4,a2
8040a4b8:	ef4ff06f          	j	80409bac <stride_dequeue+0xa38>
8040a4bc:	004ca783          	lw	a5,4(s9)
8040a4c0:	008ca983          	lw	s3,8(s9)
8040a4c4:	00a12623          	sw	a0,12(sp)
8040a4c8:	00f12423          	sw	a5,8(sp)
8040a4cc:	0e098663          	beqz	s3,8040a5b8 <stride_dequeue+0x1444>
8040a4d0:	000a0593          	mv	a1,s4
8040a4d4:	00098513          	mv	a0,s3
8040a4d8:	909fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a4dc:	00c12303          	lw	t1,12(sp)
8040a4e0:	00651463          	bne	a0,t1,8040a4e8 <stride_dequeue+0x1374>
8040a4e4:	7d10006f          	j	8040b4b4 <stride_dequeue+0x2340>
8040a4e8:	004a2783          	lw	a5,4(s4)
8040a4ec:	008a2883          	lw	a7,8(s4)
8040a4f0:	00612823          	sw	t1,16(sp)
8040a4f4:	00f12623          	sw	a5,12(sp)
8040a4f8:	0a088863          	beqz	a7,8040a5a8 <stride_dequeue+0x1434>
8040a4fc:	00088593          	mv	a1,a7
8040a500:	00098513          	mv	a0,s3
8040a504:	01112a23          	sw	a7,20(sp)
8040a508:	8d9fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a50c:	01012303          	lw	t1,16(sp)
8040a510:	01412883          	lw	a7,20(sp)
8040a514:	00651463          	bne	a0,t1,8040a51c <stride_dequeue+0x13a8>
8040a518:	1990106f          	j	8040beb0 <stride_dequeue+0x2d3c>
8040a51c:	0048a783          	lw	a5,4(a7)
8040a520:	0088ae03          	lw	t3,8(a7)
8040a524:	00612e23          	sw	t1,28(sp)
8040a528:	00f12823          	sw	a5,16(sp)
8040a52c:	060e0463          	beqz	t3,8040a594 <stride_dequeue+0x1420>
8040a530:	000e0593          	mv	a1,t3
8040a534:	00098513          	mv	a0,s3
8040a538:	01112c23          	sw	a7,24(sp)
8040a53c:	01c12a23          	sw	t3,20(sp)
8040a540:	8a1fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a544:	01c12303          	lw	t1,28(sp)
8040a548:	01412e03          	lw	t3,20(sp)
8040a54c:	01812883          	lw	a7,24(sp)
8040a550:	00651463          	bne	a0,t1,8040a558 <stride_dequeue+0x13e4>
8040a554:	07c0206f          	j	8040c5d0 <stride_dequeue+0x345c>
8040a558:	008e2583          	lw	a1,8(t3)
8040a55c:	00098513          	mv	a0,s3
8040a560:	004e2b03          	lw	s6,4(t3)
8040a564:	01112c23          	sw	a7,24(sp)
8040a568:	01c12a23          	sw	t3,20(sp)
8040a56c:	931fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a570:	01412e03          	lw	t3,20(sp)
8040a574:	01812883          	lw	a7,24(sp)
8040a578:	00ae2223          	sw	a0,4(t3)
8040a57c:	016e2423          	sw	s6,8(t3)
8040a580:	00051463          	bnez	a0,8040a588 <stride_dequeue+0x1414>
8040a584:	2780206f          	j	8040c7fc <stride_dequeue+0x3688>
8040a588:	008c2b03          	lw	s6,8(s8)
8040a58c:	01c52023          	sw	t3,0(a0)
8040a590:	000e0993          	mv	s3,t3
8040a594:	01012783          	lw	a5,16(sp)
8040a598:	0138a223          	sw	s3,4(a7)
8040a59c:	00f8a423          	sw	a5,8(a7)
8040a5a0:	0119a023          	sw	a7,0(s3)
8040a5a4:	00088993          	mv	s3,a7
8040a5a8:	00c12783          	lw	a5,12(sp)
8040a5ac:	013a2223          	sw	s3,4(s4)
8040a5b0:	00fa2423          	sw	a5,8(s4)
8040a5b4:	0149a023          	sw	s4,0(s3)
8040a5b8:	00812783          	lw	a5,8(sp)
8040a5bc:	014ca223          	sw	s4,4(s9)
8040a5c0:	000b0993          	mv	s3,s6
8040a5c4:	00fca423          	sw	a5,8(s9)
8040a5c8:	019a2023          	sw	s9,0(s4)
8040a5cc:	b1cff06f          	j	804098e8 <stride_dequeue+0x774>
8040a5d0:	004a2783          	lw	a5,4(s4)
8040a5d4:	008a2983          	lw	s3,8(s4)
8040a5d8:	00a12623          	sw	a0,12(sp)
8040a5dc:	00f12423          	sw	a5,8(sp)
8040a5e0:	0e098663          	beqz	s3,8040a6cc <stride_dequeue+0x1558>
8040a5e4:	000c8593          	mv	a1,s9
8040a5e8:	00098513          	mv	a0,s3
8040a5ec:	ff4fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a5f0:	00c12303          	lw	t1,12(sp)
8040a5f4:	00651463          	bne	a0,t1,8040a5fc <stride_dequeue+0x1488>
8040a5f8:	7290006f          	j	8040b520 <stride_dequeue+0x23ac>
8040a5fc:	004ca783          	lw	a5,4(s9)
8040a600:	008ca883          	lw	a7,8(s9)
8040a604:	00612823          	sw	t1,16(sp)
8040a608:	00f12623          	sw	a5,12(sp)
8040a60c:	0a088863          	beqz	a7,8040a6bc <stride_dequeue+0x1548>
8040a610:	00088593          	mv	a1,a7
8040a614:	00098513          	mv	a0,s3
8040a618:	01112a23          	sw	a7,20(sp)
8040a61c:	fc4fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a620:	01012303          	lw	t1,16(sp)
8040a624:	01412883          	lw	a7,20(sp)
8040a628:	00651463          	bne	a0,t1,8040a630 <stride_dequeue+0x14bc>
8040a62c:	05d0106f          	j	8040be88 <stride_dequeue+0x2d14>
8040a630:	0048a783          	lw	a5,4(a7)
8040a634:	0088ae03          	lw	t3,8(a7)
8040a638:	00612e23          	sw	t1,28(sp)
8040a63c:	00f12823          	sw	a5,16(sp)
8040a640:	060e0463          	beqz	t3,8040a6a8 <stride_dequeue+0x1534>
8040a644:	000e0593          	mv	a1,t3
8040a648:	00098513          	mv	a0,s3
8040a64c:	01112c23          	sw	a7,24(sp)
8040a650:	01c12a23          	sw	t3,20(sp)
8040a654:	f8cfe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a658:	01c12303          	lw	t1,28(sp)
8040a65c:	01412e03          	lw	t3,20(sp)
8040a660:	01812883          	lw	a7,24(sp)
8040a664:	00651463          	bne	a0,t1,8040a66c <stride_dequeue+0x14f8>
8040a668:	0040206f          	j	8040c66c <stride_dequeue+0x34f8>
8040a66c:	008e2583          	lw	a1,8(t3)
8040a670:	00098513          	mv	a0,s3
8040a674:	004e2b03          	lw	s6,4(t3)
8040a678:	01112c23          	sw	a7,24(sp)
8040a67c:	01c12a23          	sw	t3,20(sp)
8040a680:	81dfe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a684:	01412e03          	lw	t3,20(sp)
8040a688:	01812883          	lw	a7,24(sp)
8040a68c:	00ae2223          	sw	a0,4(t3)
8040a690:	016e2423          	sw	s6,8(t3)
8040a694:	00051463          	bnez	a0,8040a69c <stride_dequeue+0x1528>
8040a698:	11c0206f          	j	8040c7b4 <stride_dequeue+0x3640>
8040a69c:	008c2b03          	lw	s6,8(s8)
8040a6a0:	01c52023          	sw	t3,0(a0)
8040a6a4:	000e0993          	mv	s3,t3
8040a6a8:	01012783          	lw	a5,16(sp)
8040a6ac:	0138a223          	sw	s3,4(a7)
8040a6b0:	00f8a423          	sw	a5,8(a7)
8040a6b4:	0119a023          	sw	a7,0(s3)
8040a6b8:	00088993          	mv	s3,a7
8040a6bc:	00c12783          	lw	a5,12(sp)
8040a6c0:	013ca223          	sw	s3,4(s9)
8040a6c4:	00fca423          	sw	a5,8(s9)
8040a6c8:	0199a023          	sw	s9,0(s3)
8040a6cc:	00812783          	lw	a5,8(sp)
8040a6d0:	019a2223          	sw	s9,4(s4)
8040a6d4:	000b0993          	mv	s3,s6
8040a6d8:	00fa2423          	sw	a5,8(s4)
8040a6dc:	014ca023          	sw	s4,0(s9)
8040a6e0:	000a0c93          	mv	s9,s4
8040a6e4:	b60ff06f          	j	80409a44 <stride_dequeue+0x8d0>
8040a6e8:	0048a783          	lw	a5,4(a7)
8040a6ec:	0088a983          	lw	s3,8(a7)
8040a6f0:	00a12823          	sw	a0,16(sp)
8040a6f4:	00f12623          	sw	a5,12(sp)
8040a6f8:	0a098663          	beqz	s3,8040a7a4 <stride_dequeue+0x1630>
8040a6fc:	000c8593          	mv	a1,s9
8040a700:	00098513          	mv	a0,s3
8040a704:	01112a23          	sw	a7,20(sp)
8040a708:	ed8fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a70c:	01012303          	lw	t1,16(sp)
8040a710:	01412883          	lw	a7,20(sp)
8040a714:	00651463          	bne	a0,t1,8040a71c <stride_dequeue+0x15a8>
8040a718:	2980106f          	j	8040b9b0 <stride_dequeue+0x283c>
8040a71c:	004ca783          	lw	a5,4(s9)
8040a720:	008cae03          	lw	t3,8(s9)
8040a724:	00612a23          	sw	t1,20(sp)
8040a728:	00f12823          	sw	a5,16(sp)
8040a72c:	060e0463          	beqz	t3,8040a794 <stride_dequeue+0x1620>
8040a730:	000e0593          	mv	a1,t3
8040a734:	00098513          	mv	a0,s3
8040a738:	01112e23          	sw	a7,28(sp)
8040a73c:	01c12c23          	sw	t3,24(sp)
8040a740:	ea0fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a744:	01412303          	lw	t1,20(sp)
8040a748:	01812e03          	lw	t3,24(sp)
8040a74c:	01c12883          	lw	a7,28(sp)
8040a750:	00651463          	bne	a0,t1,8040a758 <stride_dequeue+0x15e4>
8040a754:	0e50106f          	j	8040c038 <stride_dequeue+0x2ec4>
8040a758:	008e2583          	lw	a1,8(t3)
8040a75c:	00098513          	mv	a0,s3
8040a760:	004e2b03          	lw	s6,4(t3)
8040a764:	01112c23          	sw	a7,24(sp)
8040a768:	01c12a23          	sw	t3,20(sp)
8040a76c:	f30fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a770:	01412e03          	lw	t3,20(sp)
8040a774:	01812883          	lw	a7,24(sp)
8040a778:	00ae2223          	sw	a0,4(t3)
8040a77c:	016e2423          	sw	s6,8(t3)
8040a780:	00051463          	bnez	a0,8040a788 <stride_dequeue+0x1614>
8040a784:	2ed0106f          	j	8040c270 <stride_dequeue+0x30fc>
8040a788:	008c2b03          	lw	s6,8(s8)
8040a78c:	01c52023          	sw	t3,0(a0)
8040a790:	000e0993          	mv	s3,t3
8040a794:	01012783          	lw	a5,16(sp)
8040a798:	013ca223          	sw	s3,4(s9)
8040a79c:	00fca423          	sw	a5,8(s9)
8040a7a0:	0199a023          	sw	s9,0(s3)
8040a7a4:	00c12783          	lw	a5,12(sp)
8040a7a8:	0198a223          	sw	s9,4(a7)
8040a7ac:	000b0993          	mv	s3,s6
8040a7b0:	00f8a423          	sw	a5,8(a7)
8040a7b4:	011ca023          	sw	a7,0(s9)
8040a7b8:	00088c93          	mv	s9,a7
8040a7bc:	d08ff06f          	j	80409cc4 <stride_dequeue+0xb50>
8040a7c0:	004ca783          	lw	a5,4(s9)
8040a7c4:	008ca983          	lw	s3,8(s9)
8040a7c8:	00a12823          	sw	a0,16(sp)
8040a7cc:	00f12623          	sw	a5,12(sp)
8040a7d0:	0a098663          	beqz	s3,8040a87c <stride_dequeue+0x1708>
8040a7d4:	00080593          	mv	a1,a6
8040a7d8:	00098513          	mv	a0,s3
8040a7dc:	01012a23          	sw	a6,20(sp)
8040a7e0:	e00fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a7e4:	01012303          	lw	t1,16(sp)
8040a7e8:	01412803          	lw	a6,20(sp)
8040a7ec:	00651463          	bne	a0,t1,8040a7f4 <stride_dequeue+0x1680>
8040a7f0:	7b90006f          	j	8040b7a8 <stride_dequeue+0x2634>
8040a7f4:	00482783          	lw	a5,4(a6)
8040a7f8:	00882e03          	lw	t3,8(a6)
8040a7fc:	00612a23          	sw	t1,20(sp)
8040a800:	00f12823          	sw	a5,16(sp)
8040a804:	060e0463          	beqz	t3,8040a86c <stride_dequeue+0x16f8>
8040a808:	000e0593          	mv	a1,t3
8040a80c:	00098513          	mv	a0,s3
8040a810:	01012e23          	sw	a6,28(sp)
8040a814:	01c12c23          	sw	t3,24(sp)
8040a818:	dc8fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a81c:	01412303          	lw	t1,20(sp)
8040a820:	01812e03          	lw	t3,24(sp)
8040a824:	01c12803          	lw	a6,28(sp)
8040a828:	00651463          	bne	a0,t1,8040a830 <stride_dequeue+0x16bc>
8040a82c:	7a80106f          	j	8040bfd4 <stride_dequeue+0x2e60>
8040a830:	008e2583          	lw	a1,8(t3)
8040a834:	00098513          	mv	a0,s3
8040a838:	004e2b03          	lw	s6,4(t3)
8040a83c:	01012c23          	sw	a6,24(sp)
8040a840:	01c12a23          	sw	t3,20(sp)
8040a844:	e58fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a848:	01412e03          	lw	t3,20(sp)
8040a84c:	01812803          	lw	a6,24(sp)
8040a850:	00ae2223          	sw	a0,4(t3)
8040a854:	016e2423          	sw	s6,8(t3)
8040a858:	00051463          	bnez	a0,8040a860 <stride_dequeue+0x16ec>
8040a85c:	1950106f          	j	8040c1f0 <stride_dequeue+0x307c>
8040a860:	008c2b03          	lw	s6,8(s8)
8040a864:	01c52023          	sw	t3,0(a0)
8040a868:	000e0993          	mv	s3,t3
8040a86c:	01012783          	lw	a5,16(sp)
8040a870:	01382223          	sw	s3,4(a6)
8040a874:	00f82423          	sw	a5,8(a6)
8040a878:	0109a023          	sw	a6,0(s3)
8040a87c:	00c12783          	lw	a5,12(sp)
8040a880:	010ca223          	sw	a6,4(s9)
8040a884:	000b0993          	mv	s3,s6
8040a888:	00fca423          	sw	a5,8(s9)
8040a88c:	01982023          	sw	s9,0(a6)
8040a890:	d6cff06f          	j	80409dfc <stride_dequeue+0xc88>
8040a894:	004da783          	lw	a5,4(s11)
8040a898:	008da983          	lw	s3,8(s11)
8040a89c:	00a12823          	sw	a0,16(sp)
8040a8a0:	00f12623          	sw	a5,12(sp)
8040a8a4:	0a098663          	beqz	s3,8040a950 <stride_dequeue+0x17dc>
8040a8a8:	00080593          	mv	a1,a6
8040a8ac:	00098513          	mv	a0,s3
8040a8b0:	01012a23          	sw	a6,20(sp)
8040a8b4:	d2cfe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a8b8:	01012303          	lw	t1,16(sp)
8040a8bc:	01412803          	lw	a6,20(sp)
8040a8c0:	00651463          	bne	a0,t1,8040a8c8 <stride_dequeue+0x1754>
8040a8c4:	76d0006f          	j	8040b830 <stride_dequeue+0x26bc>
8040a8c8:	00482783          	lw	a5,4(a6)
8040a8cc:	00882e03          	lw	t3,8(a6)
8040a8d0:	00612a23          	sw	t1,20(sp)
8040a8d4:	00f12823          	sw	a5,16(sp)
8040a8d8:	060e0463          	beqz	t3,8040a940 <stride_dequeue+0x17cc>
8040a8dc:	000e0593          	mv	a1,t3
8040a8e0:	00098513          	mv	a0,s3
8040a8e4:	01012e23          	sw	a6,28(sp)
8040a8e8:	01c12c23          	sw	t3,24(sp)
8040a8ec:	cf4fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a8f0:	01412303          	lw	t1,20(sp)
8040a8f4:	01812e03          	lw	t3,24(sp)
8040a8f8:	01c12803          	lw	a6,28(sp)
8040a8fc:	00651463          	bne	a0,t1,8040a904 <stride_dequeue+0x1790>
8040a900:	4f40106f          	j	8040bdf4 <stride_dequeue+0x2c80>
8040a904:	008e2583          	lw	a1,8(t3)
8040a908:	00098513          	mv	a0,s3
8040a90c:	004e2b03          	lw	s6,4(t3)
8040a910:	01012c23          	sw	a6,24(sp)
8040a914:	01c12a23          	sw	t3,20(sp)
8040a918:	d84fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040a91c:	01412e03          	lw	t3,20(sp)
8040a920:	01812803          	lw	a6,24(sp)
8040a924:	00ae2223          	sw	a0,4(t3)
8040a928:	016e2423          	sw	s6,8(t3)
8040a92c:	00051463          	bnez	a0,8040a934 <stride_dequeue+0x17c0>
8040a930:	0a90106f          	j	8040c1d8 <stride_dequeue+0x3064>
8040a934:	008c2b03          	lw	s6,8(s8)
8040a938:	01c52023          	sw	t3,0(a0)
8040a93c:	000e0993          	mv	s3,t3
8040a940:	01012783          	lw	a5,16(sp)
8040a944:	01382223          	sw	s3,4(a6)
8040a948:	00f82423          	sw	a5,8(a6)
8040a94c:	0109a023          	sw	a6,0(s3)
8040a950:	00c12783          	lw	a5,12(sp)
8040a954:	010da223          	sw	a6,4(s11)
8040a958:	000b0993          	mv	s3,s6
8040a95c:	00fda423          	sw	a5,8(s11)
8040a960:	01b82023          	sw	s11,0(a6)
8040a964:	c09fe06f          	j	8040956c <stride_dequeue+0x3f8>
8040a968:	004da783          	lw	a5,4(s11)
8040a96c:	008da983          	lw	s3,8(s11)
8040a970:	00a12623          	sw	a0,12(sp)
8040a974:	00f12423          	sw	a5,8(sp)
8040a978:	0c098263          	beqz	s3,8040aa3c <stride_dequeue+0x18c8>
8040a97c:	00080593          	mv	a1,a6
8040a980:	00098513          	mv	a0,s3
8040a984:	00c12a23          	sw	a2,20(sp)
8040a988:	01012823          	sw	a6,16(sp)
8040a98c:	c54fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a990:	00c12303          	lw	t1,12(sp)
8040a994:	01012803          	lw	a6,16(sp)
8040a998:	01412603          	lw	a2,20(sp)
8040a99c:	00651463          	bne	a0,t1,8040a9a4 <stride_dequeue+0x1830>
8040a9a0:	0980106f          	j	8040ba38 <stride_dequeue+0x28c4>
8040a9a4:	00482783          	lw	a5,4(a6)
8040a9a8:	00882e03          	lw	t3,8(a6)
8040a9ac:	00612823          	sw	t1,16(sp)
8040a9b0:	00f12623          	sw	a5,12(sp)
8040a9b4:	060e0c63          	beqz	t3,8040aa2c <stride_dequeue+0x18b8>
8040a9b8:	000e0593          	mv	a1,t3
8040a9bc:	00098513          	mv	a0,s3
8040a9c0:	01012e23          	sw	a6,28(sp)
8040a9c4:	00c12c23          	sw	a2,24(sp)
8040a9c8:	01c12a23          	sw	t3,20(sp)
8040a9cc:	c14fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040a9d0:	01012303          	lw	t1,16(sp)
8040a9d4:	01412e03          	lw	t3,20(sp)
8040a9d8:	01812603          	lw	a2,24(sp)
8040a9dc:	01c12803          	lw	a6,28(sp)
8040a9e0:	00651463          	bne	a0,t1,8040a9e8 <stride_dequeue+0x1874>
8040a9e4:	3b00106f          	j	8040bd94 <stride_dequeue+0x2c20>
8040a9e8:	008e2583          	lw	a1,8(t3)
8040a9ec:	00098513          	mv	a0,s3
8040a9f0:	004e2b03          	lw	s6,4(t3)
8040a9f4:	01012c23          	sw	a6,24(sp)
8040a9f8:	00c12a23          	sw	a2,20(sp)
8040a9fc:	01c12823          	sw	t3,16(sp)
8040aa00:	c9cfe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040aa04:	01012e03          	lw	t3,16(sp)
8040aa08:	01412603          	lw	a2,20(sp)
8040aa0c:	01812803          	lw	a6,24(sp)
8040aa10:	00ae2223          	sw	a0,4(t3)
8040aa14:	016e2423          	sw	s6,8(t3)
8040aa18:	00051463          	bnez	a0,8040aa20 <stride_dequeue+0x18ac>
8040aa1c:	0610106f          	j	8040c27c <stride_dequeue+0x3108>
8040aa20:	008c2b03          	lw	s6,8(s8)
8040aa24:	01c52023          	sw	t3,0(a0)
8040aa28:	000e0993          	mv	s3,t3
8040aa2c:	00c12783          	lw	a5,12(sp)
8040aa30:	01382223          	sw	s3,4(a6)
8040aa34:	00f82423          	sw	a5,8(a6)
8040aa38:	0109a023          	sw	a6,0(s3)
8040aa3c:	00812783          	lw	a5,8(sp)
8040aa40:	010da223          	sw	a6,4(s11)
8040aa44:	000b0993          	mv	s3,s6
8040aa48:	00fda423          	sw	a5,8(s11)
8040aa4c:	01b82023          	sw	s11,0(a6)
8040aa50:	cf9fe06f          	j	80409748 <stride_dequeue+0x5d4>
8040aa54:	00492703          	lw	a4,4(s2)
8040aa58:	00892983          	lw	s3,8(s2)
8040aa5c:	00a12a23          	sw	a0,20(sp)
8040aa60:	00e12823          	sw	a4,16(sp)
8040aa64:	06098063          	beqz	s3,8040aac4 <stride_dequeue+0x1950>
8040aa68:	00078593          	mv	a1,a5
8040aa6c:	00098513          	mv	a0,s3
8040aa70:	01012e23          	sw	a6,28(sp)
8040aa74:	00f12c23          	sw	a5,24(sp)
8040aa78:	b68fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040aa7c:	01412e03          	lw	t3,20(sp)
8040aa80:	01812783          	lw	a5,24(sp)
8040aa84:	01c12803          	lw	a6,28(sp)
8040aa88:	01c51463          	bne	a0,t3,8040aa90 <stride_dequeue+0x191c>
8040aa8c:	0840106f          	j	8040bb10 <stride_dequeue+0x299c>
8040aa90:	0087a583          	lw	a1,8(a5)
8040aa94:	00098513          	mv	a0,s3
8040aa98:	0047ab03          	lw	s6,4(a5)
8040aa9c:	01012c23          	sw	a6,24(sp)
8040aaa0:	00f12a23          	sw	a5,20(sp)
8040aaa4:	bf8fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040aaa8:	01412783          	lw	a5,20(sp)
8040aaac:	01812803          	lw	a6,24(sp)
8040aab0:	00a7a223          	sw	a0,4(a5)
8040aab4:	0167a423          	sw	s6,8(a5)
8040aab8:	00050463          	beqz	a0,8040aac0 <stride_dequeue+0x194c>
8040aabc:	00f52023          	sw	a5,0(a0)
8040aac0:	008c2b03          	lw	s6,8(s8)
8040aac4:	01012703          	lw	a4,16(sp)
8040aac8:	00f92223          	sw	a5,4(s2)
8040aacc:	000b0993          	mv	s3,s6
8040aad0:	00e92423          	sw	a4,8(s2)
8040aad4:	0127a023          	sw	s2,0(a5)
8040aad8:	875fe06f          	j	8040934c <stride_dequeue+0x1d8>
8040aadc:	004a2783          	lw	a5,4(s4)
8040aae0:	008a2983          	lw	s3,8(s4)
8040aae4:	00a12623          	sw	a0,12(sp)
8040aae8:	00f12423          	sw	a5,8(sp)
8040aaec:	00099463          	bnez	s3,8040aaf4 <stride_dequeue+0x1980>
8040aaf0:	4180106f          	j	8040bf08 <stride_dequeue+0x2d94>
8040aaf4:	00040593          	mv	a1,s0
8040aaf8:	00098513          	mv	a0,s3
8040aafc:	ae4fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040ab00:	00c12803          	lw	a6,12(sp)
8040ab04:	01051463          	bne	a0,a6,8040ab0c <stride_dequeue+0x1998>
8040ab08:	16c0106f          	j	8040bc74 <stride_dequeue+0x2b00>
8040ab0c:	00442783          	lw	a5,4(s0)
8040ab10:	00842883          	lw	a7,8(s0)
8040ab14:	01012a23          	sw	a6,20(sp)
8040ab18:	00f12623          	sw	a5,12(sp)
8040ab1c:	04088c63          	beqz	a7,8040ab74 <stride_dequeue+0x1a00>
8040ab20:	00088593          	mv	a1,a7
8040ab24:	00098513          	mv	a0,s3
8040ab28:	01112823          	sw	a7,16(sp)
8040ab2c:	ab4fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040ab30:	01412803          	lw	a6,20(sp)
8040ab34:	01012883          	lw	a7,16(sp)
8040ab38:	01051463          	bne	a0,a6,8040ab40 <stride_dequeue+0x19cc>
8040ab3c:	6c00106f          	j	8040c1fc <stride_dequeue+0x3088>
8040ab40:	0088a583          	lw	a1,8(a7)
8040ab44:	00098513          	mv	a0,s3
8040ab48:	0048ab03          	lw	s6,4(a7)
8040ab4c:	01112823          	sw	a7,16(sp)
8040ab50:	b4cfe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040ab54:	01012883          	lw	a7,16(sp)
8040ab58:	00a8a223          	sw	a0,4(a7)
8040ab5c:	0168a423          	sw	s6,8(a7)
8040ab60:	00051463          	bnez	a0,8040ab68 <stride_dequeue+0x19f4>
8040ab64:	7900106f          	j	8040c2f4 <stride_dequeue+0x3180>
8040ab68:	008c2b03          	lw	s6,8(s8)
8040ab6c:	01152023          	sw	a7,0(a0)
8040ab70:	00088993          	mv	s3,a7
8040ab74:	00c12783          	lw	a5,12(sp)
8040ab78:	01342223          	sw	s3,4(s0)
8040ab7c:	00f42423          	sw	a5,8(s0)
8040ab80:	0089a023          	sw	s0,0(s3)
8040ab84:	00040993          	mv	s3,s0
8040ab88:	00812783          	lw	a5,8(sp)
8040ab8c:	013a2223          	sw	s3,4(s4)
8040ab90:	000a0413          	mv	s0,s4
8040ab94:	00fa2423          	sw	a5,8(s4)
8040ab98:	0149a023          	sw	s4,0(s3)
8040ab9c:	000b0993          	mv	s3,s6
8040aba0:	bacff06f          	j	80409f4c <stride_dequeue+0xdd8>
8040aba4:	0048a783          	lw	a5,4(a7)
8040aba8:	0088a983          	lw	s3,8(a7)
8040abac:	00a12823          	sw	a0,16(sp)
8040abb0:	00f12623          	sw	a5,12(sp)
8040abb4:	00099463          	bnez	s3,8040abbc <stride_dequeue+0x1a48>
8040abb8:	5a40106f          	j	8040c15c <stride_dequeue+0x2fe8>
8040abbc:	000d8593          	mv	a1,s11
8040abc0:	00098513          	mv	a0,s3
8040abc4:	01112a23          	sw	a7,20(sp)
8040abc8:	a18fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040abcc:	01012303          	lw	t1,16(sp)
8040abd0:	01412883          	lw	a7,20(sp)
8040abd4:	00651463          	bne	a0,t1,8040abdc <stride_dequeue+0x1a68>
8040abd8:	54c0106f          	j	8040c124 <stride_dequeue+0x2fb0>
8040abdc:	004da783          	lw	a5,4(s11)
8040abe0:	008dae03          	lw	t3,8(s11)
8040abe4:	00612e23          	sw	t1,28(sp)
8040abe8:	00f12823          	sw	a5,16(sp)
8040abec:	060e0463          	beqz	t3,8040ac54 <stride_dequeue+0x1ae0>
8040abf0:	000e0593          	mv	a1,t3
8040abf4:	00098513          	mv	a0,s3
8040abf8:	01112c23          	sw	a7,24(sp)
8040abfc:	01c12a23          	sw	t3,20(sp)
8040ac00:	9e0fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040ac04:	01c12303          	lw	t1,28(sp)
8040ac08:	01412e03          	lw	t3,20(sp)
8040ac0c:	01812883          	lw	a7,24(sp)
8040ac10:	00651463          	bne	a0,t1,8040ac18 <stride_dequeue+0x1aa4>
8040ac14:	2890106f          	j	8040c69c <stride_dequeue+0x3528>
8040ac18:	008e2583          	lw	a1,8(t3)
8040ac1c:	00098513          	mv	a0,s3
8040ac20:	004e2b03          	lw	s6,4(t3)
8040ac24:	01112c23          	sw	a7,24(sp)
8040ac28:	01c12a23          	sw	t3,20(sp)
8040ac2c:	a70fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040ac30:	01412e03          	lw	t3,20(sp)
8040ac34:	01812883          	lw	a7,24(sp)
8040ac38:	00ae2223          	sw	a0,4(t3)
8040ac3c:	016e2423          	sw	s6,8(t3)
8040ac40:	00051463          	bnez	a0,8040ac48 <stride_dequeue+0x1ad4>
8040ac44:	3590106f          	j	8040c79c <stride_dequeue+0x3628>
8040ac48:	008c2b03          	lw	s6,8(s8)
8040ac4c:	01c52023          	sw	t3,0(a0)
8040ac50:	000e0993          	mv	s3,t3
8040ac54:	01012783          	lw	a5,16(sp)
8040ac58:	013da223          	sw	s3,4(s11)
8040ac5c:	00fda423          	sw	a5,8(s11)
8040ac60:	01b9a023          	sw	s11,0(s3)
8040ac64:	000d8993          	mv	s3,s11
8040ac68:	00c12783          	lw	a5,12(sp)
8040ac6c:	0138a223          	sw	s3,4(a7)
8040ac70:	00088d93          	mv	s11,a7
8040ac74:	00f8a423          	sw	a5,8(a7)
8040ac78:	0119a023          	sw	a7,0(s3)
8040ac7c:	000b0993          	mv	s3,s6
8040ac80:	be0ff06f          	j	8040a060 <stride_dequeue+0xeec>
8040ac84:	0048a783          	lw	a5,4(a7)
8040ac88:	0088a983          	lw	s3,8(a7)
8040ac8c:	00a12823          	sw	a0,16(sp)
8040ac90:	00f12623          	sw	a5,12(sp)
8040ac94:	00099463          	bnez	s3,8040ac9c <stride_dequeue+0x1b28>
8040ac98:	4e40106f          	j	8040c17c <stride_dequeue+0x3008>
8040ac9c:	000a0593          	mv	a1,s4
8040aca0:	00098513          	mv	a0,s3
8040aca4:	01112a23          	sw	a7,20(sp)
8040aca8:	938fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040acac:	01012303          	lw	t1,16(sp)
8040acb0:	01412883          	lw	a7,20(sp)
8040acb4:	00651463          	bne	a0,t1,8040acbc <stride_dequeue+0x1b48>
8040acb8:	0ac0106f          	j	8040bd64 <stride_dequeue+0x2bf0>
8040acbc:	004a2783          	lw	a5,4(s4)
8040acc0:	008a2e03          	lw	t3,8(s4)
8040acc4:	00612e23          	sw	t1,28(sp)
8040acc8:	00f12823          	sw	a5,16(sp)
8040accc:	060e0463          	beqz	t3,8040ad34 <stride_dequeue+0x1bc0>
8040acd0:	000e0593          	mv	a1,t3
8040acd4:	00098513          	mv	a0,s3
8040acd8:	01112c23          	sw	a7,24(sp)
8040acdc:	01c12a23          	sw	t3,20(sp)
8040ace0:	900fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040ace4:	01c12303          	lw	t1,28(sp)
8040ace8:	01412e03          	lw	t3,20(sp)
8040acec:	01812883          	lw	a7,24(sp)
8040acf0:	00651463          	bne	a0,t1,8040acf8 <stride_dequeue+0x1b84>
8040acf4:	07d0106f          	j	8040c570 <stride_dequeue+0x33fc>
8040acf8:	008e2583          	lw	a1,8(t3)
8040acfc:	00098513          	mv	a0,s3
8040ad00:	004e2b03          	lw	s6,4(t3)
8040ad04:	01112c23          	sw	a7,24(sp)
8040ad08:	01c12a23          	sw	t3,20(sp)
8040ad0c:	990fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040ad10:	01412e03          	lw	t3,20(sp)
8040ad14:	01812883          	lw	a7,24(sp)
8040ad18:	00ae2223          	sw	a0,4(t3)
8040ad1c:	016e2423          	sw	s6,8(t3)
8040ad20:	00051463          	bnez	a0,8040ad28 <stride_dequeue+0x1bb4>
8040ad24:	2190106f          	j	8040c73c <stride_dequeue+0x35c8>
8040ad28:	008c2b03          	lw	s6,8(s8)
8040ad2c:	01c52023          	sw	t3,0(a0)
8040ad30:	000e0993          	mv	s3,t3
8040ad34:	01012783          	lw	a5,16(sp)
8040ad38:	013a2223          	sw	s3,4(s4)
8040ad3c:	00fa2423          	sw	a5,8(s4)
8040ad40:	0149a023          	sw	s4,0(s3)
8040ad44:	000a0993          	mv	s3,s4
8040ad48:	00c12783          	lw	a5,12(sp)
8040ad4c:	0138a223          	sw	s3,4(a7)
8040ad50:	00088a13          	mv	s4,a7
8040ad54:	00f8a423          	sw	a5,8(a7)
8040ad58:	0119a023          	sw	a7,0(s3)
8040ad5c:	000b0993          	mv	s3,s6
8040ad60:	d44ff06f          	j	8040a2a4 <stride_dequeue+0x1130>
8040ad64:	004ca783          	lw	a5,4(s9)
8040ad68:	008ca983          	lw	s3,8(s9)
8040ad6c:	00a12823          	sw	a0,16(sp)
8040ad70:	00f12623          	sw	a5,12(sp)
8040ad74:	00099463          	bnez	s3,8040ad7c <stride_dequeue+0x1c08>
8040ad78:	3dc0106f          	j	8040c154 <stride_dequeue+0x2fe0>
8040ad7c:	00080593          	mv	a1,a6
8040ad80:	00098513          	mv	a0,s3
8040ad84:	01012a23          	sw	a6,20(sp)
8040ad88:	858fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040ad8c:	01012303          	lw	t1,16(sp)
8040ad90:	01412803          	lw	a6,20(sp)
8040ad94:	00651463          	bne	a0,t1,8040ad9c <stride_dequeue+0x1c28>
8040ad98:	1a80106f          	j	8040bf40 <stride_dequeue+0x2dcc>
8040ad9c:	00482783          	lw	a5,4(a6)
8040ada0:	00882e03          	lw	t3,8(a6)
8040ada4:	00612e23          	sw	t1,28(sp)
8040ada8:	00f12823          	sw	a5,16(sp)
8040adac:	060e0463          	beqz	t3,8040ae14 <stride_dequeue+0x1ca0>
8040adb0:	000e0593          	mv	a1,t3
8040adb4:	00098513          	mv	a0,s3
8040adb8:	01012c23          	sw	a6,24(sp)
8040adbc:	01c12a23          	sw	t3,20(sp)
8040adc0:	820fe0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040adc4:	01c12303          	lw	t1,28(sp)
8040adc8:	01412e03          	lw	t3,20(sp)
8040adcc:	01812803          	lw	a6,24(sp)
8040add0:	00651463          	bne	a0,t1,8040add8 <stride_dequeue+0x1c64>
8040add4:	7cc0106f          	j	8040c5a0 <stride_dequeue+0x342c>
8040add8:	008e2583          	lw	a1,8(t3)
8040addc:	00098513          	mv	a0,s3
8040ade0:	004e2b03          	lw	s6,4(t3)
8040ade4:	01012c23          	sw	a6,24(sp)
8040ade8:	01c12a23          	sw	t3,20(sp)
8040adec:	8b0fe0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040adf0:	01412e03          	lw	t3,20(sp)
8040adf4:	01812803          	lw	a6,24(sp)
8040adf8:	00ae2223          	sw	a0,4(t3)
8040adfc:	016e2423          	sw	s6,8(t3)
8040ae00:	00051463          	bnez	a0,8040ae08 <stride_dequeue+0x1c94>
8040ae04:	1450106f          	j	8040c748 <stride_dequeue+0x35d4>
8040ae08:	008c2b03          	lw	s6,8(s8)
8040ae0c:	01c52023          	sw	t3,0(a0)
8040ae10:	000e0993          	mv	s3,t3
8040ae14:	01012783          	lw	a5,16(sp)
8040ae18:	01382223          	sw	s3,4(a6)
8040ae1c:	00f82423          	sw	a5,8(a6)
8040ae20:	0109a023          	sw	a6,0(s3)
8040ae24:	00080993          	mv	s3,a6
8040ae28:	00c12783          	lw	a5,12(sp)
8040ae2c:	013ca223          	sw	s3,4(s9)
8040ae30:	00fca423          	sw	a5,8(s9)
8040ae34:	0199a023          	sw	s9,0(s3)
8040ae38:	000b0993          	mv	s3,s6
8040ae3c:	a99fe06f          	j	804098d4 <stride_dequeue+0x760>
8040ae40:	004a2783          	lw	a5,4(s4)
8040ae44:	008a2983          	lw	s3,8(s4)
8040ae48:	00a12823          	sw	a0,16(sp)
8040ae4c:	00f12623          	sw	a5,12(sp)
8040ae50:	00099463          	bnez	s3,8040ae58 <stride_dequeue+0x1ce4>
8040ae54:	3100106f          	j	8040c164 <stride_dequeue+0x2ff0>
8040ae58:	00080593          	mv	a1,a6
8040ae5c:	00098513          	mv	a0,s3
8040ae60:	01012a23          	sw	a6,20(sp)
8040ae64:	f7dfd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040ae68:	01012303          	lw	t1,16(sp)
8040ae6c:	01412803          	lw	a6,20(sp)
8040ae70:	00651463          	bne	a0,t1,8040ae78 <stride_dequeue+0x1d04>
8040ae74:	7590006f          	j	8040bdcc <stride_dequeue+0x2c58>
8040ae78:	00482783          	lw	a5,4(a6)
8040ae7c:	00882e03          	lw	t3,8(a6)
8040ae80:	00612e23          	sw	t1,28(sp)
8040ae84:	00f12823          	sw	a5,16(sp)
8040ae88:	060e0463          	beqz	t3,8040aef0 <stride_dequeue+0x1d7c>
8040ae8c:	000e0593          	mv	a1,t3
8040ae90:	00098513          	mv	a0,s3
8040ae94:	01012c23          	sw	a6,24(sp)
8040ae98:	01c12a23          	sw	t3,20(sp)
8040ae9c:	f45fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040aea0:	01c12303          	lw	t1,28(sp)
8040aea4:	01412e03          	lw	t3,20(sp)
8040aea8:	01812803          	lw	a6,24(sp)
8040aeac:	00651463          	bne	a0,t1,8040aeb4 <stride_dequeue+0x1d40>
8040aeb0:	4500106f          	j	8040c300 <stride_dequeue+0x318c>
8040aeb4:	008e2583          	lw	a1,8(t3)
8040aeb8:	00098513          	mv	a0,s3
8040aebc:	004e2b03          	lw	s6,4(t3)
8040aec0:	01012c23          	sw	a6,24(sp)
8040aec4:	01c12a23          	sw	t3,20(sp)
8040aec8:	fd5fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040aecc:	01412e03          	lw	t3,20(sp)
8040aed0:	01812803          	lw	a6,24(sp)
8040aed4:	00ae2223          	sw	a0,4(t3)
8040aed8:	016e2423          	sw	s6,8(t3)
8040aedc:	00051463          	bnez	a0,8040aee4 <stride_dequeue+0x1d70>
8040aee0:	0f90106f          	j	8040c7d8 <stride_dequeue+0x3664>
8040aee4:	008c2b03          	lw	s6,8(s8)
8040aee8:	01c52023          	sw	t3,0(a0)
8040aeec:	000e0993          	mv	s3,t3
8040aef0:	01012783          	lw	a5,16(sp)
8040aef4:	01382223          	sw	s3,4(a6)
8040aef8:	00f82423          	sw	a5,8(a6)
8040aefc:	0109a023          	sw	a6,0(s3)
8040af00:	00080993          	mv	s3,a6
8040af04:	00c12783          	lw	a5,12(sp)
8040af08:	013a2223          	sw	s3,4(s4)
8040af0c:	00fa2423          	sw	a5,8(s4)
8040af10:	0149a023          	sw	s4,0(s3)
8040af14:	000b0993          	mv	s3,s6
8040af18:	b1dfe06f          	j	80409a34 <stride_dequeue+0x8c0>
8040af1c:	0048a783          	lw	a5,4(a7)
8040af20:	0088a983          	lw	s3,8(a7)
8040af24:	00a12623          	sw	a0,12(sp)
8040af28:	00f12423          	sw	a5,8(sp)
8040af2c:	00099463          	bnez	s3,8040af34 <stride_dequeue+0x1dc0>
8040af30:	2440106f          	j	8040c174 <stride_dequeue+0x3000>
8040af34:	00060593          	mv	a1,a2
8040af38:	00098513          	mv	a0,s3
8040af3c:	01112a23          	sw	a7,20(sp)
8040af40:	ea1fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040af44:	00c12303          	lw	t1,12(sp)
8040af48:	01012603          	lw	a2,16(sp)
8040af4c:	01412883          	lw	a7,20(sp)
8040af50:	5e6502e3          	beq	a0,t1,8040bd34 <stride_dequeue+0x2bc0>
8040af54:	00462783          	lw	a5,4(a2)
8040af58:	00862e03          	lw	t3,8(a2)
8040af5c:	00612e23          	sw	t1,28(sp)
8040af60:	00f12623          	sw	a5,12(sp)
8040af64:	060e0c63          	beqz	t3,8040afdc <stride_dequeue+0x1e68>
8040af68:	000e0593          	mv	a1,t3
8040af6c:	00098513          	mv	a0,s3
8040af70:	01112c23          	sw	a7,24(sp)
8040af74:	00c12a23          	sw	a2,20(sp)
8040af78:	01c12823          	sw	t3,16(sp)
8040af7c:	e65fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040af80:	01c12303          	lw	t1,28(sp)
8040af84:	01012e03          	lw	t3,16(sp)
8040af88:	01412603          	lw	a2,20(sp)
8040af8c:	01812883          	lw	a7,24(sp)
8040af90:	00651463          	bne	a0,t1,8040af98 <stride_dequeue+0x1e24>
8040af94:	3d00106f          	j	8040c364 <stride_dequeue+0x31f0>
8040af98:	008e2583          	lw	a1,8(t3)
8040af9c:	00098513          	mv	a0,s3
8040afa0:	004e2b03          	lw	s6,4(t3)
8040afa4:	01112c23          	sw	a7,24(sp)
8040afa8:	00c12a23          	sw	a2,20(sp)
8040afac:	01c12823          	sw	t3,16(sp)
8040afb0:	eedfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040afb4:	01012e03          	lw	t3,16(sp)
8040afb8:	01412603          	lw	a2,20(sp)
8040afbc:	01812883          	lw	a7,24(sp)
8040afc0:	00ae2223          	sw	a0,4(t3)
8040afc4:	016e2423          	sw	s6,8(t3)
8040afc8:	00051463          	bnez	a0,8040afd0 <stride_dequeue+0x1e5c>
8040afcc:	0190106f          	j	8040c7e4 <stride_dequeue+0x3670>
8040afd0:	008c2b03          	lw	s6,8(s8)
8040afd4:	01c52023          	sw	t3,0(a0)
8040afd8:	000e0993          	mv	s3,t3
8040afdc:	00c12783          	lw	a5,12(sp)
8040afe0:	01362223          	sw	s3,4(a2)
8040afe4:	00f62423          	sw	a5,8(a2)
8040afe8:	00c9a023          	sw	a2,0(s3)
8040afec:	00060993          	mv	s3,a2
8040aff0:	00812783          	lw	a5,8(sp)
8040aff4:	0138a223          	sw	s3,4(a7)
8040aff8:	00088613          	mv	a2,a7
8040affc:	00f8a423          	sw	a5,8(a7)
8040b000:	0119a023          	sw	a7,0(s3)
8040b004:	000b0993          	mv	s3,s6
8040b008:	98cff06f          	j	8040a194 <stride_dequeue+0x1020>
8040b00c:	00462783          	lw	a5,4(a2)
8040b010:	00862983          	lw	s3,8(a2)
8040b014:	00a12623          	sw	a0,12(sp)
8040b018:	00f12423          	sw	a5,8(sp)
8040b01c:	00099463          	bnez	s3,8040b024 <stride_dequeue+0x1eb0>
8040b020:	14c0106f          	j	8040c16c <stride_dequeue+0x2ff8>
8040b024:	00080593          	mv	a1,a6
8040b028:	00098513          	mv	a0,s3
8040b02c:	00c12a23          	sw	a2,20(sp)
8040b030:	01012823          	sw	a6,16(sp)
8040b034:	dadfd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b038:	00c12303          	lw	t1,12(sp)
8040b03c:	01012803          	lw	a6,16(sp)
8040b040:	01412603          	lw	a2,20(sp)
8040b044:	5e6500e3          	beq	a0,t1,8040be24 <stride_dequeue+0x2cb0>
8040b048:	00482783          	lw	a5,4(a6)
8040b04c:	00882e03          	lw	t3,8(a6)
8040b050:	00612e23          	sw	t1,28(sp)
8040b054:	00f12623          	sw	a5,12(sp)
8040b058:	060e0c63          	beqz	t3,8040b0d0 <stride_dequeue+0x1f5c>
8040b05c:	000e0593          	mv	a1,t3
8040b060:	00098513          	mv	a0,s3
8040b064:	01012c23          	sw	a6,24(sp)
8040b068:	00c12a23          	sw	a2,20(sp)
8040b06c:	01c12823          	sw	t3,16(sp)
8040b070:	d71fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b074:	01c12303          	lw	t1,28(sp)
8040b078:	01012e03          	lw	t3,16(sp)
8040b07c:	01412603          	lw	a2,20(sp)
8040b080:	01812803          	lw	a6,24(sp)
8040b084:	00651463          	bne	a0,t1,8040b08c <stride_dequeue+0x1f18>
8040b088:	3b80106f          	j	8040c440 <stride_dequeue+0x32cc>
8040b08c:	008e2583          	lw	a1,8(t3)
8040b090:	00098513          	mv	a0,s3
8040b094:	004e2b03          	lw	s6,4(t3)
8040b098:	01012c23          	sw	a6,24(sp)
8040b09c:	00c12a23          	sw	a2,20(sp)
8040b0a0:	01c12823          	sw	t3,16(sp)
8040b0a4:	df9fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b0a8:	01012e03          	lw	t3,16(sp)
8040b0ac:	01412603          	lw	a2,20(sp)
8040b0b0:	01812803          	lw	a6,24(sp)
8040b0b4:	00ae2223          	sw	a0,4(t3)
8040b0b8:	016e2423          	sw	s6,8(t3)
8040b0bc:	00051463          	bnez	a0,8040b0c4 <stride_dequeue+0x1f50>
8040b0c0:	6ac0106f          	j	8040c76c <stride_dequeue+0x35f8>
8040b0c4:	008c2b03          	lw	s6,8(s8)
8040b0c8:	01c52023          	sw	t3,0(a0)
8040b0cc:	000e0993          	mv	s3,t3
8040b0d0:	00c12783          	lw	a5,12(sp)
8040b0d4:	01382223          	sw	s3,4(a6)
8040b0d8:	00f82423          	sw	a5,8(a6)
8040b0dc:	0109a023          	sw	a6,0(s3)
8040b0e0:	00080993          	mv	s3,a6
8040b0e4:	00812783          	lw	a5,8(sp)
8040b0e8:	01362223          	sw	s3,4(a2)
8040b0ec:	00f62423          	sw	a5,8(a2)
8040b0f0:	00c9a023          	sw	a2,0(s3)
8040b0f4:	000b0993          	mv	s3,s6
8040b0f8:	aa5fe06f          	j	80409b9c <stride_dequeue+0xa28>
8040b0fc:	0048a783          	lw	a5,4(a7)
8040b100:	0088a983          	lw	s3,8(a7)
8040b104:	00a12a23          	sw	a0,20(sp)
8040b108:	00f12823          	sw	a5,16(sp)
8040b10c:	04098c63          	beqz	s3,8040b164 <stride_dequeue+0x1ff0>
8040b110:	00080593          	mv	a1,a6
8040b114:	00098513          	mv	a0,s3
8040b118:	01112e23          	sw	a7,28(sp)
8040b11c:	cc5fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b120:	01412e03          	lw	t3,20(sp)
8040b124:	01812803          	lw	a6,24(sp)
8040b128:	01c12883          	lw	a7,28(sp)
8040b12c:	3dc50ae3          	beq	a0,t3,8040bd00 <stride_dequeue+0x2b8c>
8040b130:	00882583          	lw	a1,8(a6)
8040b134:	00098513          	mv	a0,s3
8040b138:	00482b03          	lw	s6,4(a6)
8040b13c:	01112c23          	sw	a7,24(sp)
8040b140:	01012a23          	sw	a6,20(sp)
8040b144:	d59fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b148:	01412803          	lw	a6,20(sp)
8040b14c:	01812883          	lw	a7,24(sp)
8040b150:	00a82223          	sw	a0,4(a6)
8040b154:	01682423          	sw	s6,8(a6)
8040b158:	00050463          	beqz	a0,8040b160 <stride_dequeue+0x1fec>
8040b15c:	01052023          	sw	a6,0(a0)
8040b160:	008c2b03          	lw	s6,8(s8)
8040b164:	01012783          	lw	a5,16(sp)
8040b168:	0108a223          	sw	a6,4(a7)
8040b16c:	000b0993          	mv	s3,s6
8040b170:	00f8a423          	sw	a5,8(a7)
8040b174:	01182023          	sw	a7,0(a6)
8040b178:	00088813          	mv	a6,a7
8040b17c:	9f4ff06f          	j	8040a370 <stride_dequeue+0x11fc>
8040b180:	004da783          	lw	a5,4(s11)
8040b184:	008da983          	lw	s3,8(s11)
8040b188:	00a12823          	sw	a0,16(sp)
8040b18c:	00f12623          	sw	a5,12(sp)
8040b190:	06098663          	beqz	s3,8040b1fc <stride_dequeue+0x2088>
8040b194:	00030593          	mv	a1,t1
8040b198:	00098513          	mv	a0,s3
8040b19c:	01012e23          	sw	a6,28(sp)
8040b1a0:	00c12c23          	sw	a2,24(sp)
8040b1a4:	00612a23          	sw	t1,20(sp)
8040b1a8:	c39fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b1ac:	01012e03          	lw	t3,16(sp)
8040b1b0:	01412303          	lw	t1,20(sp)
8040b1b4:	01812603          	lw	a2,24(sp)
8040b1b8:	01c12803          	lw	a6,28(sp)
8040b1bc:	5dc50ee3          	beq	a0,t3,8040bf98 <stride_dequeue+0x2e24>
8040b1c0:	00832583          	lw	a1,8(t1)
8040b1c4:	00098513          	mv	a0,s3
8040b1c8:	00432b03          	lw	s6,4(t1)
8040b1cc:	01012c23          	sw	a6,24(sp)
8040b1d0:	00c12a23          	sw	a2,20(sp)
8040b1d4:	00612823          	sw	t1,16(sp)
8040b1d8:	cc5fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b1dc:	01012303          	lw	t1,16(sp)
8040b1e0:	01412603          	lw	a2,20(sp)
8040b1e4:	01812803          	lw	a6,24(sp)
8040b1e8:	00a32223          	sw	a0,4(t1)
8040b1ec:	01632423          	sw	s6,8(t1)
8040b1f0:	00050463          	beqz	a0,8040b1f8 <stride_dequeue+0x2084>
8040b1f4:	00652023          	sw	t1,0(a0)
8040b1f8:	008c2b03          	lw	s6,8(s8)
8040b1fc:	00c12783          	lw	a5,12(sp)
8040b200:	006da223          	sw	t1,4(s11)
8040b204:	000b0993          	mv	s3,s6
8040b208:	00fda423          	sw	a5,8(s11)
8040b20c:	01b32023          	sw	s11,0(t1)
8040b210:	d24fe06f          	j	80409734 <stride_dequeue+0x5c0>
8040b214:	004ca783          	lw	a5,4(s9)
8040b218:	008ca983          	lw	s3,8(s9)
8040b21c:	00a12a23          	sw	a0,20(sp)
8040b220:	00f12823          	sw	a5,16(sp)
8040b224:	04098e63          	beqz	s3,8040b280 <stride_dequeue+0x210c>
8040b228:	00030593          	mv	a1,t1
8040b22c:	00098513          	mv	a0,s3
8040b230:	01012e23          	sw	a6,28(sp)
8040b234:	00612c23          	sw	t1,24(sp)
8040b238:	ba9fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b23c:	01412e03          	lw	t3,20(sp)
8040b240:	01812303          	lw	t1,24(sp)
8040b244:	01c12803          	lw	a6,28(sp)
8040b248:	25c50ae3          	beq	a0,t3,8040bc9c <stride_dequeue+0x2b28>
8040b24c:	00832583          	lw	a1,8(t1)
8040b250:	00098513          	mv	a0,s3
8040b254:	00432b03          	lw	s6,4(t1)
8040b258:	01012c23          	sw	a6,24(sp)
8040b25c:	00612a23          	sw	t1,20(sp)
8040b260:	c3dfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b264:	01412303          	lw	t1,20(sp)
8040b268:	01812803          	lw	a6,24(sp)
8040b26c:	00a32223          	sw	a0,4(t1)
8040b270:	01632423          	sw	s6,8(t1)
8040b274:	00050463          	beqz	a0,8040b27c <stride_dequeue+0x2108>
8040b278:	00652023          	sw	t1,0(a0)
8040b27c:	008c2b03          	lw	s6,8(s8)
8040b280:	01012783          	lw	a5,16(sp)
8040b284:	006ca223          	sw	t1,4(s9)
8040b288:	000b0993          	mv	s3,s6
8040b28c:	00fca423          	sw	a5,8(s9)
8040b290:	01932023          	sw	s9,0(t1)
8040b294:	b55fe06f          	j	80409de8 <stride_dequeue+0xc74>
8040b298:	004da783          	lw	a5,4(s11)
8040b29c:	008da983          	lw	s3,8(s11)
8040b2a0:	00a12a23          	sw	a0,20(sp)
8040b2a4:	00f12823          	sw	a5,16(sp)
8040b2a8:	04098e63          	beqz	s3,8040b304 <stride_dequeue+0x2190>
8040b2ac:	00030593          	mv	a1,t1
8040b2b0:	00098513          	mv	a0,s3
8040b2b4:	01012e23          	sw	a6,28(sp)
8040b2b8:	00612c23          	sw	t1,24(sp)
8040b2bc:	b25fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b2c0:	01412e03          	lw	t3,20(sp)
8040b2c4:	01812303          	lw	t1,24(sp)
8040b2c8:	01c12803          	lw	a6,28(sp)
8040b2cc:	53c50ce3          	beq	a0,t3,8040c004 <stride_dequeue+0x2e90>
8040b2d0:	00832583          	lw	a1,8(t1)
8040b2d4:	00098513          	mv	a0,s3
8040b2d8:	00432b03          	lw	s6,4(t1)
8040b2dc:	01012c23          	sw	a6,24(sp)
8040b2e0:	00612a23          	sw	t1,20(sp)
8040b2e4:	bb9fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b2e8:	01412303          	lw	t1,20(sp)
8040b2ec:	01812803          	lw	a6,24(sp)
8040b2f0:	00a32223          	sw	a0,4(t1)
8040b2f4:	01632423          	sw	s6,8(t1)
8040b2f8:	00050463          	beqz	a0,8040b300 <stride_dequeue+0x218c>
8040b2fc:	00652023          	sw	t1,0(a0)
8040b300:	008c2b03          	lw	s6,8(s8)
8040b304:	01012783          	lw	a5,16(sp)
8040b308:	006da223          	sw	t1,4(s11)
8040b30c:	000b0993          	mv	s3,s6
8040b310:	00fda423          	sw	a5,8(s11)
8040b314:	01b32023          	sw	s11,0(t1)
8040b318:	a40fe06f          	j	80409558 <stride_dequeue+0x3e4>
8040b31c:	0048a783          	lw	a5,4(a7)
8040b320:	0088a983          	lw	s3,8(a7)
8040b324:	00a12a23          	sw	a0,20(sp)
8040b328:	00f12823          	sw	a5,16(sp)
8040b32c:	04098c63          	beqz	s3,8040b384 <stride_dequeue+0x2210>
8040b330:	00030593          	mv	a1,t1
8040b334:	00098513          	mv	a0,s3
8040b338:	01112e23          	sw	a7,28(sp)
8040b33c:	aa5fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b340:	01412e03          	lw	t3,20(sp)
8040b344:	01812303          	lw	t1,24(sp)
8040b348:	01c12883          	lw	a7,28(sp)
8040b34c:	5bc502e3          	beq	a0,t3,8040c0f0 <stride_dequeue+0x2f7c>
8040b350:	00832583          	lw	a1,8(t1)
8040b354:	00098513          	mv	a0,s3
8040b358:	00432b03          	lw	s6,4(t1)
8040b35c:	01112c23          	sw	a7,24(sp)
8040b360:	00612a23          	sw	t1,20(sp)
8040b364:	b39fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b368:	01412303          	lw	t1,20(sp)
8040b36c:	01812883          	lw	a7,24(sp)
8040b370:	00a32223          	sw	a0,4(t1)
8040b374:	01632423          	sw	s6,8(t1)
8040b378:	00050463          	beqz	a0,8040b380 <stride_dequeue+0x220c>
8040b37c:	00652023          	sw	t1,0(a0)
8040b380:	008c2b03          	lw	s6,8(s8)
8040b384:	01012783          	lw	a5,16(sp)
8040b388:	0068a223          	sw	t1,4(a7)
8040b38c:	000b0993          	mv	s3,s6
8040b390:	00f8a423          	sw	a5,8(a7)
8040b394:	01132023          	sw	a7,0(t1)
8040b398:	91dfe06f          	j	80409cb4 <stride_dequeue+0xb40>
8040b39c:	00892503          	lw	a0,8(s2)
8040b3a0:	00492983          	lw	s3,4(s2)
8040b3a4:	000b0593          	mv	a1,s6
8040b3a8:	af5fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b3ac:	00a92223          	sw	a0,4(s2)
8040b3b0:	01392423          	sw	s3,8(s2)
8040b3b4:	01412803          	lw	a6,20(sp)
8040b3b8:	01812783          	lw	a5,24(sp)
8040b3bc:	00050463          	beqz	a0,8040b3c4 <stride_dequeue+0x2250>
8040b3c0:	01252023          	sw	s2,0(a0)
8040b3c4:	008c2983          	lw	s3,8(s8)
8040b3c8:	f71fd06f          	j	80409338 <stride_dequeue+0x1c4>
8040b3cc:	0049a703          	lw	a4,4(s3)
8040b3d0:	0089a783          	lw	a5,8(s3)
8040b3d4:	00a12a23          	sw	a0,20(sp)
8040b3d8:	00e12423          	sw	a4,8(sp)
8040b3dc:	04078a63          	beqz	a5,8040b430 <stride_dequeue+0x22bc>
8040b3e0:	00078513          	mv	a0,a5
8040b3e4:	000a0593          	mv	a1,s4
8040b3e8:	00c12823          	sw	a2,16(sp)
8040b3ec:	00f12623          	sw	a5,12(sp)
8040b3f0:	9f1fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b3f4:	01412883          	lw	a7,20(sp)
8040b3f8:	00c12783          	lw	a5,12(sp)
8040b3fc:	01012603          	lw	a2,16(sp)
8040b400:	631508e3          	beq	a0,a7,8040c230 <stride_dequeue+0x30bc>
8040b404:	008a2583          	lw	a1,8(s4)
8040b408:	004a2b03          	lw	s6,4(s4)
8040b40c:	00078513          	mv	a0,a5
8040b410:	00c12623          	sw	a2,12(sp)
8040b414:	a89fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b418:	00aa2223          	sw	a0,4(s4)
8040b41c:	016a2423          	sw	s6,8(s4)
8040b420:	00c12603          	lw	a2,12(sp)
8040b424:	00050463          	beqz	a0,8040b42c <stride_dequeue+0x22b8>
8040b428:	01452023          	sw	s4,0(a0)
8040b42c:	008c2b03          	lw	s6,8(s8)
8040b430:	00812783          	lw	a5,8(sp)
8040b434:	0149a223          	sw	s4,4(s3)
8040b438:	00f9a423          	sw	a5,8(s3)
8040b43c:	013a2023          	sw	s3,0(s4)
8040b440:	00098a13          	mv	s4,s3
8040b444:	85cff06f          	j	8040a4a0 <stride_dequeue+0x132c>
8040b448:	004a2703          	lw	a4,4(s4)
8040b44c:	008a2783          	lw	a5,8(s4)
8040b450:	00a12a23          	sw	a0,20(sp)
8040b454:	00e12623          	sw	a4,12(sp)
8040b458:	04078263          	beqz	a5,8040b49c <stride_dequeue+0x2328>
8040b45c:	00078513          	mv	a0,a5
8040b460:	00098593          	mv	a1,s3
8040b464:	00f12823          	sw	a5,16(sp)
8040b468:	979fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b46c:	01412303          	lw	t1,20(sp)
8040b470:	01012783          	lw	a5,16(sp)
8040b474:	526504e3          	beq	a0,t1,8040c19c <stride_dequeue+0x3028>
8040b478:	0089a583          	lw	a1,8(s3)
8040b47c:	0049ab03          	lw	s6,4(s3)
8040b480:	00078513          	mv	a0,a5
8040b484:	a19fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b488:	00a9a223          	sw	a0,4(s3)
8040b48c:	0169a423          	sw	s6,8(s3)
8040b490:	00050463          	beqz	a0,8040b498 <stride_dequeue+0x2324>
8040b494:	01352023          	sw	s3,0(a0)
8040b498:	008c2b03          	lw	s6,8(s8)
8040b49c:	00c12783          	lw	a5,12(sp)
8040b4a0:	013a2223          	sw	s3,4(s4)
8040b4a4:	00fa2423          	sw	a5,8(s4)
8040b4a8:	0149a023          	sw	s4,0(s3)
8040b4ac:	000a0993          	mv	s3,s4
8040b4b0:	a89fe06f          	j	80409f38 <stride_dequeue+0xdc4>
8040b4b4:	0049a703          	lw	a4,4(s3)
8040b4b8:	0089a783          	lw	a5,8(s3)
8040b4bc:	00a12a23          	sw	a0,20(sp)
8040b4c0:	00e12623          	sw	a4,12(sp)
8040b4c4:	04078263          	beqz	a5,8040b508 <stride_dequeue+0x2394>
8040b4c8:	00078513          	mv	a0,a5
8040b4cc:	000a0593          	mv	a1,s4
8040b4d0:	00f12823          	sw	a5,16(sp)
8040b4d4:	90dfd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b4d8:	01412883          	lw	a7,20(sp)
8040b4dc:	01012783          	lw	a5,16(sp)
8040b4e0:	5f1502e3          	beq	a0,a7,8040c2c4 <stride_dequeue+0x3150>
8040b4e4:	008a2583          	lw	a1,8(s4)
8040b4e8:	004a2b03          	lw	s6,4(s4)
8040b4ec:	00078513          	mv	a0,a5
8040b4f0:	9adfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b4f4:	00aa2223          	sw	a0,4(s4)
8040b4f8:	016a2423          	sw	s6,8(s4)
8040b4fc:	00050463          	beqz	a0,8040b504 <stride_dequeue+0x2390>
8040b500:	01452023          	sw	s4,0(a0)
8040b504:	008c2b03          	lw	s6,8(s8)
8040b508:	00c12783          	lw	a5,12(sp)
8040b50c:	0149a223          	sw	s4,4(s3)
8040b510:	00f9a423          	sw	a5,8(s3)
8040b514:	013a2023          	sw	s3,0(s4)
8040b518:	00098a13          	mv	s4,s3
8040b51c:	89cff06f          	j	8040a5b8 <stride_dequeue+0x1444>
8040b520:	0049a703          	lw	a4,4(s3)
8040b524:	0089a783          	lw	a5,8(s3)
8040b528:	00a12a23          	sw	a0,20(sp)
8040b52c:	00e12623          	sw	a4,12(sp)
8040b530:	04078263          	beqz	a5,8040b574 <stride_dequeue+0x2400>
8040b534:	00078513          	mv	a0,a5
8040b538:	000c8593          	mv	a1,s9
8040b53c:	00f12823          	sw	a5,16(sp)
8040b540:	8a1fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b544:	01412883          	lw	a7,20(sp)
8040b548:	01012783          	lw	a5,16(sp)
8040b54c:	551504e3          	beq	a0,a7,8040c294 <stride_dequeue+0x3120>
8040b550:	008ca583          	lw	a1,8(s9)
8040b554:	004cab03          	lw	s6,4(s9)
8040b558:	00078513          	mv	a0,a5
8040b55c:	941fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b560:	00aca223          	sw	a0,4(s9)
8040b564:	016ca423          	sw	s6,8(s9)
8040b568:	00050463          	beqz	a0,8040b570 <stride_dequeue+0x23fc>
8040b56c:	01952023          	sw	s9,0(a0)
8040b570:	008c2b03          	lw	s6,8(s8)
8040b574:	00c12783          	lw	a5,12(sp)
8040b578:	0199a223          	sw	s9,4(s3)
8040b57c:	00f9a423          	sw	a5,8(s3)
8040b580:	013ca023          	sw	s3,0(s9)
8040b584:	00098c93          	mv	s9,s3
8040b588:	944ff06f          	j	8040a6cc <stride_dequeue+0x1558>
8040b58c:	008c2b03          	lw	s6,8(s8)
8040b590:	00088993          	mv	s3,a7
8040b594:	dc9fe06f          	j	8040a35c <stride_dequeue+0x11e8>
8040b598:	0048a783          	lw	a5,4(a7)
8040b59c:	0088a803          	lw	a6,8(a7)
8040b5a0:	00a12e23          	sw	a0,28(sp)
8040b5a4:	00f12823          	sw	a5,16(sp)
8040b5a8:	04080a63          	beqz	a6,8040b5fc <stride_dequeue+0x2488>
8040b5ac:	00080513          	mv	a0,a6
8040b5b0:	00098593          	mv	a1,s3
8040b5b4:	01112c23          	sw	a7,24(sp)
8040b5b8:	01012a23          	sw	a6,20(sp)
8040b5bc:	825fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b5c0:	01c12e03          	lw	t3,28(sp)
8040b5c4:	01412803          	lw	a6,20(sp)
8040b5c8:	01812883          	lw	a7,24(sp)
8040b5cc:	57c502e3          	beq	a0,t3,8040c330 <stride_dequeue+0x31bc>
8040b5d0:	0089a583          	lw	a1,8(s3)
8040b5d4:	0049ab03          	lw	s6,4(s3)
8040b5d8:	00080513          	mv	a0,a6
8040b5dc:	01112a23          	sw	a7,20(sp)
8040b5e0:	8bdfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b5e4:	00a9a223          	sw	a0,4(s3)
8040b5e8:	0169a423          	sw	s6,8(s3)
8040b5ec:	01412883          	lw	a7,20(sp)
8040b5f0:	00050463          	beqz	a0,8040b5f8 <stride_dequeue+0x2484>
8040b5f4:	01352023          	sw	s3,0(a0)
8040b5f8:	008c2b03          	lw	s6,8(s8)
8040b5fc:	01012783          	lw	a5,16(sp)
8040b600:	0138a223          	sw	s3,4(a7)
8040b604:	00f8a423          	sw	a5,8(a7)
8040b608:	0119a023          	sw	a7,0(s3)
8040b60c:	00088993          	mv	s3,a7
8040b610:	c81fe06f          	j	8040a290 <stride_dequeue+0x111c>
8040b614:	0048a783          	lw	a5,4(a7)
8040b618:	0088a803          	lw	a6,8(a7)
8040b61c:	00a12e23          	sw	a0,28(sp)
8040b620:	00f12823          	sw	a5,16(sp)
8040b624:	04080a63          	beqz	a6,8040b678 <stride_dequeue+0x2504>
8040b628:	00080513          	mv	a0,a6
8040b62c:	00098593          	mv	a1,s3
8040b630:	01112c23          	sw	a7,24(sp)
8040b634:	01012a23          	sw	a6,20(sp)
8040b638:	fa8fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b63c:	01c12e03          	lw	t3,28(sp)
8040b640:	01412803          	lw	a6,20(sp)
8040b644:	01812883          	lw	a7,24(sp)
8040b648:	69c508e3          	beq	a0,t3,8040c4d8 <stride_dequeue+0x3364>
8040b64c:	0089a583          	lw	a1,8(s3)
8040b650:	0049ab03          	lw	s6,4(s3)
8040b654:	00080513          	mv	a0,a6
8040b658:	01112a23          	sw	a7,20(sp)
8040b65c:	841fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b660:	00a9a223          	sw	a0,4(s3)
8040b664:	0169a423          	sw	s6,8(s3)
8040b668:	01412883          	lw	a7,20(sp)
8040b66c:	00050463          	beqz	a0,8040b674 <stride_dequeue+0x2500>
8040b670:	01352023          	sw	s3,0(a0)
8040b674:	008c2b03          	lw	s6,8(s8)
8040b678:	01012783          	lw	a5,16(sp)
8040b67c:	0138a223          	sw	s3,4(a7)
8040b680:	00f8a423          	sw	a5,8(a7)
8040b684:	0119a023          	sw	a7,0(s3)
8040b688:	00088993          	mv	s3,a7
8040b68c:	9c1fe06f          	j	8040a04c <stride_dequeue+0xed8>
8040b690:	0048a783          	lw	a5,4(a7)
8040b694:	0088a803          	lw	a6,8(a7)
8040b698:	00a12e23          	sw	a0,28(sp)
8040b69c:	00f12623          	sw	a5,12(sp)
8040b6a0:	06080263          	beqz	a6,8040b704 <stride_dequeue+0x2590>
8040b6a4:	00080513          	mv	a0,a6
8040b6a8:	00098593          	mv	a1,s3
8040b6ac:	01112c23          	sw	a7,24(sp)
8040b6b0:	01012823          	sw	a6,16(sp)
8040b6b4:	f2cfd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b6b8:	01c12e03          	lw	t3,28(sp)
8040b6bc:	01012803          	lw	a6,16(sp)
8040b6c0:	01412603          	lw	a2,20(sp)
8040b6c4:	01812883          	lw	a7,24(sp)
8040b6c8:	01c51463          	bne	a0,t3,8040b6d0 <stride_dequeue+0x255c>
8040b6cc:	7690006f          	j	8040c634 <stride_dequeue+0x34c0>
8040b6d0:	0089a583          	lw	a1,8(s3)
8040b6d4:	0049ab03          	lw	s6,4(s3)
8040b6d8:	00080513          	mv	a0,a6
8040b6dc:	01112a23          	sw	a7,20(sp)
8040b6e0:	00c12823          	sw	a2,16(sp)
8040b6e4:	fb8fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b6e8:	00a9a223          	sw	a0,4(s3)
8040b6ec:	0169a423          	sw	s6,8(s3)
8040b6f0:	01012603          	lw	a2,16(sp)
8040b6f4:	01412883          	lw	a7,20(sp)
8040b6f8:	00050463          	beqz	a0,8040b700 <stride_dequeue+0x258c>
8040b6fc:	01352023          	sw	s3,0(a0)
8040b700:	008c2b03          	lw	s6,8(s8)
8040b704:	00c12783          	lw	a5,12(sp)
8040b708:	0138a223          	sw	s3,4(a7)
8040b70c:	00f8a423          	sw	a5,8(a7)
8040b710:	0119a023          	sw	a7,0(s3)
8040b714:	00088993          	mv	s3,a7
8040b718:	a69fe06f          	j	8040a180 <stride_dequeue+0x100c>
8040b71c:	00462783          	lw	a5,4(a2)
8040b720:	00862883          	lw	a7,8(a2)
8040b724:	00a12e23          	sw	a0,28(sp)
8040b728:	00f12623          	sw	a5,12(sp)
8040b72c:	06088263          	beqz	a7,8040b790 <stride_dequeue+0x261c>
8040b730:	00088513          	mv	a0,a7
8040b734:	00098593          	mv	a1,s3
8040b738:	01012c23          	sw	a6,24(sp)
8040b73c:	00c12a23          	sw	a2,20(sp)
8040b740:	01112823          	sw	a7,16(sp)
8040b744:	e9cfd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b748:	01c12e03          	lw	t3,28(sp)
8040b74c:	01012883          	lw	a7,16(sp)
8040b750:	01412603          	lw	a2,20(sp)
8040b754:	01812803          	lw	a6,24(sp)
8040b758:	45c502e3          	beq	a0,t3,8040c39c <stride_dequeue+0x3228>
8040b75c:	0089a583          	lw	a1,8(s3)
8040b760:	0049ab03          	lw	s6,4(s3)
8040b764:	00088513          	mv	a0,a7
8040b768:	01012a23          	sw	a6,20(sp)
8040b76c:	00c12823          	sw	a2,16(sp)
8040b770:	f2cfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b774:	00a9a223          	sw	a0,4(s3)
8040b778:	0169a423          	sw	s6,8(s3)
8040b77c:	01012603          	lw	a2,16(sp)
8040b780:	01412803          	lw	a6,20(sp)
8040b784:	00050463          	beqz	a0,8040b78c <stride_dequeue+0x2618>
8040b788:	01352023          	sw	s3,0(a0)
8040b78c:	008c2b03          	lw	s6,8(s8)
8040b790:	00c12783          	lw	a5,12(sp)
8040b794:	01362223          	sw	s3,4(a2)
8040b798:	00f62423          	sw	a5,8(a2)
8040b79c:	00c9a023          	sw	a2,0(s3)
8040b7a0:	00060993          	mv	s3,a2
8040b7a4:	be0fe06f          	j	80409b84 <stride_dequeue+0xa10>
8040b7a8:	0049a783          	lw	a5,4(s3)
8040b7ac:	0089a303          	lw	t1,8(s3)
8040b7b0:	00a12e23          	sw	a0,28(sp)
8040b7b4:	00f12823          	sw	a5,16(sp)
8040b7b8:	04030a63          	beqz	t1,8040b80c <stride_dequeue+0x2698>
8040b7bc:	00080593          	mv	a1,a6
8040b7c0:	00030513          	mv	a0,t1
8040b7c4:	01012c23          	sw	a6,24(sp)
8040b7c8:	00612a23          	sw	t1,20(sp)
8040b7cc:	e14fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b7d0:	01c12e03          	lw	t3,28(sp)
8040b7d4:	01412303          	lw	t1,20(sp)
8040b7d8:	01812803          	lw	a6,24(sp)
8040b7dc:	4dc506e3          	beq	a0,t3,8040c4a8 <stride_dequeue+0x3334>
8040b7e0:	00882583          	lw	a1,8(a6)
8040b7e4:	00030513          	mv	a0,t1
8040b7e8:	00482b03          	lw	s6,4(a6)
8040b7ec:	01012a23          	sw	a6,20(sp)
8040b7f0:	eacfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b7f4:	01412803          	lw	a6,20(sp)
8040b7f8:	00a82223          	sw	a0,4(a6)
8040b7fc:	01682423          	sw	s6,8(a6)
8040b800:	00050463          	beqz	a0,8040b808 <stride_dequeue+0x2694>
8040b804:	01052023          	sw	a6,0(a0)
8040b808:	008c2b03          	lw	s6,8(s8)
8040b80c:	01012783          	lw	a5,16(sp)
8040b810:	0109a223          	sw	a6,4(s3)
8040b814:	00f9a423          	sw	a5,8(s3)
8040b818:	01382023          	sw	s3,0(a6)
8040b81c:	00098813          	mv	a6,s3
8040b820:	85cff06f          	j	8040a87c <stride_dequeue+0x1708>
8040b824:	008c2b03          	lw	s6,8(s8)
8040b828:	00088993          	mv	s3,a7
8040b82c:	c70fe06f          	j	80409c9c <stride_dequeue+0xb28>
8040b830:	0049a783          	lw	a5,4(s3)
8040b834:	0089a303          	lw	t1,8(s3)
8040b838:	00a12e23          	sw	a0,28(sp)
8040b83c:	00f12823          	sw	a5,16(sp)
8040b840:	04030a63          	beqz	t1,8040b894 <stride_dequeue+0x2720>
8040b844:	00080593          	mv	a1,a6
8040b848:	00030513          	mv	a0,t1
8040b84c:	01012c23          	sw	a6,24(sp)
8040b850:	00612a23          	sw	t1,20(sp)
8040b854:	d8cfd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b858:	01c12e03          	lw	t3,28(sp)
8040b85c:	01412303          	lw	t1,20(sp)
8040b860:	01812803          	lw	a6,24(sp)
8040b864:	41c50ae3          	beq	a0,t3,8040c478 <stride_dequeue+0x3304>
8040b868:	00882583          	lw	a1,8(a6)
8040b86c:	00030513          	mv	a0,t1
8040b870:	00482b03          	lw	s6,4(a6)
8040b874:	01012a23          	sw	a6,20(sp)
8040b878:	e24fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b87c:	01412803          	lw	a6,20(sp)
8040b880:	00a82223          	sw	a0,4(a6)
8040b884:	01682423          	sw	s6,8(a6)
8040b888:	00050463          	beqz	a0,8040b890 <stride_dequeue+0x271c>
8040b88c:	01052023          	sw	a6,0(a0)
8040b890:	008c2b03          	lw	s6,8(s8)
8040b894:	01012783          	lw	a5,16(sp)
8040b898:	0109a223          	sw	a6,4(s3)
8040b89c:	00f9a423          	sw	a5,8(s3)
8040b8a0:	01382023          	sw	s3,0(a6)
8040b8a4:	00098813          	mv	a6,s3
8040b8a8:	8a8ff06f          	j	8040a950 <stride_dequeue+0x17dc>
8040b8ac:	004ca783          	lw	a5,4(s9)
8040b8b0:	008ca883          	lw	a7,8(s9)
8040b8b4:	00a12e23          	sw	a0,28(sp)
8040b8b8:	00f12823          	sw	a5,16(sp)
8040b8bc:	04088a63          	beqz	a7,8040b910 <stride_dequeue+0x279c>
8040b8c0:	00088513          	mv	a0,a7
8040b8c4:	00098593          	mv	a1,s3
8040b8c8:	01012c23          	sw	a6,24(sp)
8040b8cc:	01112a23          	sw	a7,20(sp)
8040b8d0:	d10fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b8d4:	01c12e03          	lw	t3,28(sp)
8040b8d8:	01412883          	lw	a7,20(sp)
8040b8dc:	01812803          	lw	a6,24(sp)
8040b8e0:	53c500e3          	beq	a0,t3,8040c600 <stride_dequeue+0x348c>
8040b8e4:	0089a583          	lw	a1,8(s3)
8040b8e8:	0049ab03          	lw	s6,4(s3)
8040b8ec:	00088513          	mv	a0,a7
8040b8f0:	01012a23          	sw	a6,20(sp)
8040b8f4:	da8fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b8f8:	00a9a223          	sw	a0,4(s3)
8040b8fc:	0169a423          	sw	s6,8(s3)
8040b900:	01412803          	lw	a6,20(sp)
8040b904:	00050463          	beqz	a0,8040b90c <stride_dequeue+0x2798>
8040b908:	01352023          	sw	s3,0(a0)
8040b90c:	008c2b03          	lw	s6,8(s8)
8040b910:	01012783          	lw	a5,16(sp)
8040b914:	013ca223          	sw	s3,4(s9)
8040b918:	00fca423          	sw	a5,8(s9)
8040b91c:	0199a023          	sw	s9,0(s3)
8040b920:	000c8993          	mv	s3,s9
8040b924:	f99fd06f          	j	804098bc <stride_dequeue+0x748>
8040b928:	008c2b03          	lw	s6,8(s8)
8040b92c:	000d8993          	mv	s3,s11
8040b930:	c11fd06f          	j	80409540 <stride_dequeue+0x3cc>
8040b934:	004a2783          	lw	a5,4(s4)
8040b938:	008a2883          	lw	a7,8(s4)
8040b93c:	00a12e23          	sw	a0,28(sp)
8040b940:	00f12823          	sw	a5,16(sp)
8040b944:	04088a63          	beqz	a7,8040b998 <stride_dequeue+0x2824>
8040b948:	00088513          	mv	a0,a7
8040b94c:	00098593          	mv	a1,s3
8040b950:	01012c23          	sw	a6,24(sp)
8040b954:	01112a23          	sw	a7,20(sp)
8040b958:	c88fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b95c:	01c12e03          	lw	t3,28(sp)
8040b960:	01412883          	lw	a7,20(sp)
8040b964:	01812803          	lw	a6,24(sp)
8040b968:	57c502e3          	beq	a0,t3,8040c6cc <stride_dequeue+0x3558>
8040b96c:	0089a583          	lw	a1,8(s3)
8040b970:	0049ab03          	lw	s6,4(s3)
8040b974:	00088513          	mv	a0,a7
8040b978:	01012a23          	sw	a6,20(sp)
8040b97c:	d20fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b980:	00a9a223          	sw	a0,4(s3)
8040b984:	0169a423          	sw	s6,8(s3)
8040b988:	01412803          	lw	a6,20(sp)
8040b98c:	00050463          	beqz	a0,8040b994 <stride_dequeue+0x2820>
8040b990:	01352023          	sw	s3,0(a0)
8040b994:	008c2b03          	lw	s6,8(s8)
8040b998:	01012783          	lw	a5,16(sp)
8040b99c:	013a2223          	sw	s3,4(s4)
8040b9a0:	00fa2423          	sw	a5,8(s4)
8040b9a4:	0149a023          	sw	s4,0(s3)
8040b9a8:	000a0993          	mv	s3,s4
8040b9ac:	870fe06f          	j	80409a1c <stride_dequeue+0x8a8>
8040b9b0:	0049a783          	lw	a5,4(s3)
8040b9b4:	0089a303          	lw	t1,8(s3)
8040b9b8:	00a12e23          	sw	a0,28(sp)
8040b9bc:	00f12823          	sw	a5,16(sp)
8040b9c0:	04030a63          	beqz	t1,8040ba14 <stride_dequeue+0x28a0>
8040b9c4:	00030513          	mv	a0,t1
8040b9c8:	000c8593          	mv	a1,s9
8040b9cc:	01112c23          	sw	a7,24(sp)
8040b9d0:	00612a23          	sw	t1,20(sp)
8040b9d4:	c0cfd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040b9d8:	01c12e03          	lw	t3,28(sp)
8040b9dc:	01412303          	lw	t1,20(sp)
8040b9e0:	01812883          	lw	a7,24(sp)
8040b9e4:	1fc508e3          	beq	a0,t3,8040c3d4 <stride_dequeue+0x3260>
8040b9e8:	008ca583          	lw	a1,8(s9)
8040b9ec:	004cab03          	lw	s6,4(s9)
8040b9f0:	00030513          	mv	a0,t1
8040b9f4:	01112a23          	sw	a7,20(sp)
8040b9f8:	ca4fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040b9fc:	00aca223          	sw	a0,4(s9)
8040ba00:	016ca423          	sw	s6,8(s9)
8040ba04:	01412883          	lw	a7,20(sp)
8040ba08:	00050463          	beqz	a0,8040ba10 <stride_dequeue+0x289c>
8040ba0c:	01952023          	sw	s9,0(a0)
8040ba10:	008c2b03          	lw	s6,8(s8)
8040ba14:	01012783          	lw	a5,16(sp)
8040ba18:	0199a223          	sw	s9,4(s3)
8040ba1c:	00f9a423          	sw	a5,8(s3)
8040ba20:	013ca023          	sw	s3,0(s9)
8040ba24:	00098c93          	mv	s9,s3
8040ba28:	d7dfe06f          	j	8040a7a4 <stride_dequeue+0x1630>
8040ba2c:	008c2b03          	lw	s6,8(s8)
8040ba30:	000c8993          	mv	s3,s9
8040ba34:	b9cfe06f          	j	80409dd0 <stride_dequeue+0xc5c>
8040ba38:	0049a783          	lw	a5,4(s3)
8040ba3c:	0089a303          	lw	t1,8(s3)
8040ba40:	00a12e23          	sw	a0,28(sp)
8040ba44:	00f12623          	sw	a5,12(sp)
8040ba48:	06030263          	beqz	t1,8040baac <stride_dequeue+0x2938>
8040ba4c:	00080593          	mv	a1,a6
8040ba50:	00030513          	mv	a0,t1
8040ba54:	00c12c23          	sw	a2,24(sp)
8040ba58:	01012a23          	sw	a6,20(sp)
8040ba5c:	00612823          	sw	t1,16(sp)
8040ba60:	b80fd0ef          	jal	ra,80408de0 <proc_stride_comp_f>
8040ba64:	01812603          	lw	a2,24(sp)
8040ba68:	01c12e03          	lw	t3,28(sp)
8040ba6c:	01412803          	lw	a6,20(sp)
8040ba70:	00c12a23          	sw	a2,20(sp)
8040ba74:	01012303          	lw	t1,16(sp)
8040ba78:	29c50ae3          	beq	a0,t3,8040c50c <stride_dequeue+0x3398>
8040ba7c:	00882583          	lw	a1,8(a6)
8040ba80:	00030513          	mv	a0,t1
8040ba84:	00482b03          	lw	s6,4(a6)
8040ba88:	01012823          	sw	a6,16(sp)
8040ba8c:	c10fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040ba90:	01012803          	lw	a6,16(sp)
8040ba94:	01412603          	lw	a2,20(sp)
8040ba98:	00a82223          	sw	a0,4(a6)
8040ba9c:	01682423          	sw	s6,8(a6)
8040baa0:	00050463          	beqz	a0,8040baa8 <stride_dequeue+0x2934>
8040baa4:	01052023          	sw	a6,0(a0)
8040baa8:	008c2b03          	lw	s6,8(s8)
8040baac:	00c12783          	lw	a5,12(sp)
8040bab0:	0109a223          	sw	a6,4(s3)
8040bab4:	00f9a423          	sw	a5,8(s3)
8040bab8:	01382023          	sw	s3,0(a6)
8040babc:	00098813          	mv	a6,s3
8040bac0:	f7dfe06f          	j	8040aa3c <stride_dequeue+0x18c8>
8040bac4:	000a0993          	mv	s3,s4
8040bac8:	c70fe06f          	j	80409f38 <stride_dequeue+0xdc4>
8040bacc:	008c2b03          	lw	s6,8(s8)
8040bad0:	000d8993          	mv	s3,s11
8040bad4:	c49fd06f          	j	8040971c <stride_dequeue+0x5a8>
8040bad8:	008da503          	lw	a0,8(s11)
8040badc:	004dab03          	lw	s6,4(s11)
8040bae0:	00098593          	mv	a1,s3
8040bae4:	bb8fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bae8:	00ada223          	sw	a0,4(s11)
8040baec:	016da423          	sw	s6,8(s11)
8040baf0:	01012603          	lw	a2,16(sp)
8040baf4:	01412803          	lw	a6,20(sp)
8040baf8:	01812303          	lw	t1,24(sp)
8040bafc:	fc0508e3          	beqz	a0,8040bacc <stride_dequeue+0x2958>
8040bb00:	01b52023          	sw	s11,0(a0)
8040bb04:	000d8993          	mv	s3,s11
8040bb08:	008c2b03          	lw	s6,8(s8)
8040bb0c:	c11fd06f          	j	8040971c <stride_dequeue+0x5a8>
8040bb10:	0089a503          	lw	a0,8(s3)
8040bb14:	0049ab03          	lw	s6,4(s3)
8040bb18:	00078593          	mv	a1,a5
8040bb1c:	01012a23          	sw	a6,20(sp)
8040bb20:	b7cfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bb24:	00a9a223          	sw	a0,4(s3)
8040bb28:	0169a423          	sw	s6,8(s3)
8040bb2c:	01412803          	lw	a6,20(sp)
8040bb30:	6a050a63          	beqz	a0,8040c1e4 <stride_dequeue+0x3070>
8040bb34:	01352023          	sw	s3,0(a0)
8040bb38:	00098793          	mv	a5,s3
8040bb3c:	008c2b03          	lw	s6,8(s8)
8040bb40:	f85fe06f          	j	8040aac4 <stride_dequeue+0x1950>
8040bb44:	0088a503          	lw	a0,8(a7)
8040bb48:	00098593          	mv	a1,s3
8040bb4c:	0048ab03          	lw	s6,4(a7)
8040bb50:	00612c23          	sw	t1,24(sp)
8040bb54:	01112a23          	sw	a7,20(sp)
8040bb58:	b44fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bb5c:	01412883          	lw	a7,20(sp)
8040bb60:	01812303          	lw	t1,24(sp)
8040bb64:	00a8a223          	sw	a0,4(a7)
8040bb68:	0168a423          	sw	s6,8(a7)
8040bb6c:	ca050ce3          	beqz	a0,8040b824 <stride_dequeue+0x26b0>
8040bb70:	01152023          	sw	a7,0(a0)
8040bb74:	00088993          	mv	s3,a7
8040bb78:	008c2b03          	lw	s6,8(s8)
8040bb7c:	920fe06f          	j	80409c9c <stride_dequeue+0xb28>
8040bb80:	008ca503          	lw	a0,8(s9)
8040bb84:	004cab03          	lw	s6,4(s9)
8040bb88:	00098593          	mv	a1,s3
8040bb8c:	b10fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bb90:	00aca223          	sw	a0,4(s9)
8040bb94:	016ca423          	sw	s6,8(s9)
8040bb98:	01412803          	lw	a6,20(sp)
8040bb9c:	01812303          	lw	t1,24(sp)
8040bba0:	e80506e3          	beqz	a0,8040ba2c <stride_dequeue+0x28b8>
8040bba4:	01952023          	sw	s9,0(a0)
8040bba8:	000c8993          	mv	s3,s9
8040bbac:	008c2b03          	lw	s6,8(s8)
8040bbb0:	a20fe06f          	j	80409dd0 <stride_dequeue+0xc5c>
8040bbb4:	008da503          	lw	a0,8(s11)
8040bbb8:	004dab03          	lw	s6,4(s11)
8040bbbc:	00098593          	mv	a1,s3
8040bbc0:	adcfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bbc4:	00ada223          	sw	a0,4(s11)
8040bbc8:	016da423          	sw	s6,8(s11)
8040bbcc:	01412803          	lw	a6,20(sp)
8040bbd0:	01812303          	lw	t1,24(sp)
8040bbd4:	d4050ae3          	beqz	a0,8040b928 <stride_dequeue+0x27b4>
8040bbd8:	01b52023          	sw	s11,0(a0)
8040bbdc:	000d8993          	mv	s3,s11
8040bbe0:	008c2b03          	lw	s6,8(s8)
8040bbe4:	95dfd06f          	j	80409540 <stride_dequeue+0x3cc>
8040bbe8:	0088a503          	lw	a0,8(a7)
8040bbec:	00098593          	mv	a1,s3
8040bbf0:	0048ab03          	lw	s6,4(a7)
8040bbf4:	01012c23          	sw	a6,24(sp)
8040bbf8:	01112a23          	sw	a7,20(sp)
8040bbfc:	aa0fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bc00:	01412883          	lw	a7,20(sp)
8040bc04:	01812803          	lw	a6,24(sp)
8040bc08:	00a8a223          	sw	a0,4(a7)
8040bc0c:	0168a423          	sw	s6,8(a7)
8040bc10:	96050ee3          	beqz	a0,8040b58c <stride_dequeue+0x2418>
8040bc14:	01152023          	sw	a7,0(a0)
8040bc18:	00088993          	mv	s3,a7
8040bc1c:	008c2b03          	lw	s6,8(s8)
8040bc20:	f3cfe06f          	j	8040a35c <stride_dequeue+0x11e8>
8040bc24:	000a0993          	mv	s3,s4
8040bc28:	df5fd06f          	j	80409a1c <stride_dequeue+0x8a8>
8040bc2c:	00009697          	auipc	a3,0x9
8040bc30:	be068693          	addi	a3,a3,-1056 # 8041480c <CSWTCH.69+0x8b0>
8040bc34:	00007617          	auipc	a2,0x7
8040bc38:	f0860613          	addi	a2,a2,-248 # 80412b3c <commands+0x1bc>
8040bc3c:	06300593          	li	a1,99
8040bc40:	00009517          	auipc	a0,0x9
8040bc44:	bf050513          	addi	a0,a0,-1040 # 80414830 <CSWTCH.69+0x8d4>
8040bc48:	9ddf40ef          	jal	ra,80400624 <__panic>
8040bc4c:	000c8993          	mv	s3,s9
8040bc50:	c6dfd06f          	j	804098bc <stride_dequeue+0x748>
8040bc54:	00088993          	mv	s3,a7
8040bc58:	d28fe06f          	j	8040a180 <stride_dequeue+0x100c>
8040bc5c:	00088993          	mv	s3,a7
8040bc60:	becfe06f          	j	8040a04c <stride_dequeue+0xed8>
8040bc64:	00060993          	mv	s3,a2
8040bc68:	f1dfd06f          	j	80409b84 <stride_dequeue+0xa10>
8040bc6c:	00088993          	mv	s3,a7
8040bc70:	e20fe06f          	j	8040a290 <stride_dequeue+0x111c>
8040bc74:	0089a503          	lw	a0,8(s3)
8040bc78:	0049ab03          	lw	s6,4(s3)
8040bc7c:	00040593          	mv	a1,s0
8040bc80:	a1cfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bc84:	00a9a223          	sw	a0,4(s3)
8040bc88:	0169a423          	sw	s6,8(s3)
8040bc8c:	00050463          	beqz	a0,8040bc94 <stride_dequeue+0x2b20>
8040bc90:	01352023          	sw	s3,0(a0)
8040bc94:	008c2b03          	lw	s6,8(s8)
8040bc98:	ef1fe06f          	j	8040ab88 <stride_dequeue+0x1a14>
8040bc9c:	0089a503          	lw	a0,8(s3)
8040bca0:	0049ab03          	lw	s6,4(s3)
8040bca4:	00030593          	mv	a1,t1
8040bca8:	01012a23          	sw	a6,20(sp)
8040bcac:	9f0fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bcb0:	00a9a223          	sw	a0,4(s3)
8040bcb4:	0169a423          	sw	s6,8(s3)
8040bcb8:	01412803          	lw	a6,20(sp)
8040bcbc:	300508e3          	beqz	a0,8040c7cc <stride_dequeue+0x3658>
8040bcc0:	01352023          	sw	s3,0(a0)
8040bcc4:	00098313          	mv	t1,s3
8040bcc8:	008c2b03          	lw	s6,8(s8)
8040bccc:	db4ff06f          	j	8040b280 <stride_dequeue+0x210c>
8040bcd0:	0088a503          	lw	a0,8(a7)
8040bcd4:	000e0593          	mv	a1,t3
8040bcd8:	0048ab03          	lw	s6,4(a7)
8040bcdc:	01112a23          	sw	a7,20(sp)
8040bce0:	9bcfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bce4:	01412883          	lw	a7,20(sp)
8040bce8:	00a8a223          	sw	a0,4(a7)
8040bcec:	0168a423          	sw	s6,8(a7)
8040bcf0:	00050463          	beqz	a0,8040bcf8 <stride_dequeue+0x2b84>
8040bcf4:	01152023          	sw	a7,0(a0)
8040bcf8:	008c2b03          	lw	s6,8(s8)
8040bcfc:	d84fe06f          	j	8040a280 <stride_dequeue+0x110c>
8040bd00:	0089a503          	lw	a0,8(s3)
8040bd04:	0049ab03          	lw	s6,4(s3)
8040bd08:	00080593          	mv	a1,a6
8040bd0c:	01112a23          	sw	a7,20(sp)
8040bd10:	98cfd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bd14:	00a9a223          	sw	a0,4(s3)
8040bd18:	0169a423          	sw	s6,8(s3)
8040bd1c:	01412883          	lw	a7,20(sp)
8040bd20:	300506e3          	beqz	a0,8040c82c <stride_dequeue+0x36b8>
8040bd24:	01352023          	sw	s3,0(a0)
8040bd28:	00098813          	mv	a6,s3
8040bd2c:	008c2b03          	lw	s6,8(s8)
8040bd30:	c34ff06f          	j	8040b164 <stride_dequeue+0x1ff0>
8040bd34:	0089a503          	lw	a0,8(s3)
8040bd38:	0049ab03          	lw	s6,4(s3)
8040bd3c:	00060593          	mv	a1,a2
8040bd40:	01112623          	sw	a7,12(sp)
8040bd44:	958fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bd48:	00a9a223          	sw	a0,4(s3)
8040bd4c:	0169a423          	sw	s6,8(s3)
8040bd50:	00c12883          	lw	a7,12(sp)
8040bd54:	00050463          	beqz	a0,8040bd5c <stride_dequeue+0x2be8>
8040bd58:	01352023          	sw	s3,0(a0)
8040bd5c:	008c2b03          	lw	s6,8(s8)
8040bd60:	a90ff06f          	j	8040aff0 <stride_dequeue+0x1e7c>
8040bd64:	0089a503          	lw	a0,8(s3)
8040bd68:	0049ab03          	lw	s6,4(s3)
8040bd6c:	000a0593          	mv	a1,s4
8040bd70:	01112823          	sw	a7,16(sp)
8040bd74:	928fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bd78:	00a9a223          	sw	a0,4(s3)
8040bd7c:	0169a423          	sw	s6,8(s3)
8040bd80:	01012883          	lw	a7,16(sp)
8040bd84:	00050463          	beqz	a0,8040bd8c <stride_dequeue+0x2c18>
8040bd88:	01352023          	sw	s3,0(a0)
8040bd8c:	008c2b03          	lw	s6,8(s8)
8040bd90:	fb9fe06f          	j	8040ad48 <stride_dequeue+0x1bd4>
8040bd94:	0089a503          	lw	a0,8(s3)
8040bd98:	0049ab03          	lw	s6,4(s3)
8040bd9c:	000e0593          	mv	a1,t3
8040bda0:	01012a23          	sw	a6,20(sp)
8040bda4:	00c12823          	sw	a2,16(sp)
8040bda8:	8f4fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bdac:	00a9a223          	sw	a0,4(s3)
8040bdb0:	0169a423          	sw	s6,8(s3)
8040bdb4:	01012603          	lw	a2,16(sp)
8040bdb8:	01412803          	lw	a6,20(sp)
8040bdbc:	00050463          	beqz	a0,8040bdc4 <stride_dequeue+0x2c50>
8040bdc0:	01352023          	sw	s3,0(a0)
8040bdc4:	008c2b03          	lw	s6,8(s8)
8040bdc8:	c65fe06f          	j	8040aa2c <stride_dequeue+0x18b8>
8040bdcc:	0089a503          	lw	a0,8(s3)
8040bdd0:	0049ab03          	lw	s6,4(s3)
8040bdd4:	00080593          	mv	a1,a6
8040bdd8:	8c4fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bddc:	00a9a223          	sw	a0,4(s3)
8040bde0:	0169a423          	sw	s6,8(s3)
8040bde4:	00050463          	beqz	a0,8040bdec <stride_dequeue+0x2c78>
8040bde8:	01352023          	sw	s3,0(a0)
8040bdec:	008c2b03          	lw	s6,8(s8)
8040bdf0:	914ff06f          	j	8040af04 <stride_dequeue+0x1d90>
8040bdf4:	0089a503          	lw	a0,8(s3)
8040bdf8:	0049ab03          	lw	s6,4(s3)
8040bdfc:	000e0593          	mv	a1,t3
8040be00:	01012a23          	sw	a6,20(sp)
8040be04:	898fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040be08:	00a9a223          	sw	a0,4(s3)
8040be0c:	0169a423          	sw	s6,8(s3)
8040be10:	01412803          	lw	a6,20(sp)
8040be14:	00050463          	beqz	a0,8040be1c <stride_dequeue+0x2ca8>
8040be18:	01352023          	sw	s3,0(a0)
8040be1c:	008c2b03          	lw	s6,8(s8)
8040be20:	b21fe06f          	j	8040a940 <stride_dequeue+0x17cc>
8040be24:	0089a503          	lw	a0,8(s3)
8040be28:	0049ab03          	lw	s6,4(s3)
8040be2c:	00080593          	mv	a1,a6
8040be30:	00c12623          	sw	a2,12(sp)
8040be34:	868fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040be38:	00a9a223          	sw	a0,4(s3)
8040be3c:	0169a423          	sw	s6,8(s3)
8040be40:	00c12603          	lw	a2,12(sp)
8040be44:	00050463          	beqz	a0,8040be4c <stride_dequeue+0x2cd8>
8040be48:	01352023          	sw	s3,0(a0)
8040be4c:	008c2b03          	lw	s6,8(s8)
8040be50:	a94ff06f          	j	8040b0e4 <stride_dequeue+0x1f70>
8040be54:	0088a503          	lw	a0,8(a7)
8040be58:	000e0593          	mv	a1,t3
8040be5c:	0048ab03          	lw	s6,4(a7)
8040be60:	01112823          	sw	a7,16(sp)
8040be64:	838fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040be68:	01012883          	lw	a7,16(sp)
8040be6c:	01412603          	lw	a2,20(sp)
8040be70:	00a8a223          	sw	a0,4(a7)
8040be74:	0168a423          	sw	s6,8(a7)
8040be78:	00050463          	beqz	a0,8040be80 <stride_dequeue+0x2d0c>
8040be7c:	01152023          	sw	a7,0(a0)
8040be80:	008c2b03          	lw	s6,8(s8)
8040be84:	aecfe06f          	j	8040a170 <stride_dequeue+0xffc>
8040be88:	0089a503          	lw	a0,8(s3)
8040be8c:	0049ab03          	lw	s6,4(s3)
8040be90:	00088593          	mv	a1,a7
8040be94:	808fd0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040be98:	00a9a223          	sw	a0,4(s3)
8040be9c:	0169a423          	sw	s6,8(s3)
8040bea0:	00050463          	beqz	a0,8040bea8 <stride_dequeue+0x2d34>
8040bea4:	01352023          	sw	s3,0(a0)
8040bea8:	008c2b03          	lw	s6,8(s8)
8040beac:	811fe06f          	j	8040a6bc <stride_dequeue+0x1548>
8040beb0:	0089a503          	lw	a0,8(s3)
8040beb4:	0049ab03          	lw	s6,4(s3)
8040beb8:	00088593          	mv	a1,a7
8040bebc:	fe1fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bec0:	00a9a223          	sw	a0,4(s3)
8040bec4:	0169a423          	sw	s6,8(s3)
8040bec8:	00050463          	beqz	a0,8040bed0 <stride_dequeue+0x2d5c>
8040becc:	01352023          	sw	s3,0(a0)
8040bed0:	008c2b03          	lw	s6,8(s8)
8040bed4:	ed4fe06f          	j	8040a5a8 <stride_dequeue+0x1434>
8040bed8:	00862503          	lw	a0,8(a2)
8040bedc:	000e0593          	mv	a1,t3
8040bee0:	00462b03          	lw	s6,4(a2)
8040bee4:	fb9fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bee8:	01012603          	lw	a2,16(sp)
8040beec:	01412803          	lw	a6,20(sp)
8040bef0:	00a62223          	sw	a0,4(a2)
8040bef4:	01662423          	sw	s6,8(a2)
8040bef8:	00050463          	beqz	a0,8040bf00 <stride_dequeue+0x2d8c>
8040befc:	00c52023          	sw	a2,0(a0)
8040bf00:	008c2b03          	lw	s6,8(s8)
8040bf04:	c71fd06f          	j	80409b74 <stride_dequeue+0xa00>
8040bf08:	00040993          	mv	s3,s0
8040bf0c:	c7dfe06f          	j	8040ab88 <stride_dequeue+0x1a14>
8040bf10:	008ca503          	lw	a0,8(s9)
8040bf14:	004cab03          	lw	s6,4(s9)
8040bf18:	000e0593          	mv	a1,t3
8040bf1c:	01012a23          	sw	a6,20(sp)
8040bf20:	f7dfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bf24:	00aca223          	sw	a0,4(s9)
8040bf28:	016ca423          	sw	s6,8(s9)
8040bf2c:	01412803          	lw	a6,20(sp)
8040bf30:	00050463          	beqz	a0,8040bf38 <stride_dequeue+0x2dc4>
8040bf34:	01952023          	sw	s9,0(a0)
8040bf38:	008c2b03          	lw	s6,8(s8)
8040bf3c:	971fd06f          	j	804098ac <stride_dequeue+0x738>
8040bf40:	0089a503          	lw	a0,8(s3)
8040bf44:	0049ab03          	lw	s6,4(s3)
8040bf48:	00080593          	mv	a1,a6
8040bf4c:	f51fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bf50:	00a9a223          	sw	a0,4(s3)
8040bf54:	0169a423          	sw	s6,8(s3)
8040bf58:	00050463          	beqz	a0,8040bf60 <stride_dequeue+0x2dec>
8040bf5c:	01352023          	sw	s3,0(a0)
8040bf60:	008c2b03          	lw	s6,8(s8)
8040bf64:	ec5fe06f          	j	8040ae28 <stride_dequeue+0x1cb4>
8040bf68:	008a2503          	lw	a0,8(s4)
8040bf6c:	004a2b03          	lw	s6,4(s4)
8040bf70:	000e0593          	mv	a1,t3
8040bf74:	01012a23          	sw	a6,20(sp)
8040bf78:	f25fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bf7c:	00aa2223          	sw	a0,4(s4)
8040bf80:	016a2423          	sw	s6,8(s4)
8040bf84:	01412803          	lw	a6,20(sp)
8040bf88:	00050463          	beqz	a0,8040bf90 <stride_dequeue+0x2e1c>
8040bf8c:	01452023          	sw	s4,0(a0)
8040bf90:	008c2b03          	lw	s6,8(s8)
8040bf94:	a79fd06f          	j	80409a0c <stride_dequeue+0x898>
8040bf98:	0089a503          	lw	a0,8(s3)
8040bf9c:	0049ab03          	lw	s6,4(s3)
8040bfa0:	00030593          	mv	a1,t1
8040bfa4:	01012a23          	sw	a6,20(sp)
8040bfa8:	00c12823          	sw	a2,16(sp)
8040bfac:	ef1fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bfb0:	00a9a223          	sw	a0,4(s3)
8040bfb4:	0169a423          	sw	s6,8(s3)
8040bfb8:	01012603          	lw	a2,16(sp)
8040bfbc:	01412803          	lw	a6,20(sp)
8040bfc0:	06050ce3          	beqz	a0,8040c838 <stride_dequeue+0x36c4>
8040bfc4:	01352023          	sw	s3,0(a0)
8040bfc8:	00098313          	mv	t1,s3
8040bfcc:	008c2b03          	lw	s6,8(s8)
8040bfd0:	a2cff06f          	j	8040b1fc <stride_dequeue+0x2088>
8040bfd4:	0089a503          	lw	a0,8(s3)
8040bfd8:	0049ab03          	lw	s6,4(s3)
8040bfdc:	000e0593          	mv	a1,t3
8040bfe0:	01012a23          	sw	a6,20(sp)
8040bfe4:	eb9fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040bfe8:	00a9a223          	sw	a0,4(s3)
8040bfec:	0169a423          	sw	s6,8(s3)
8040bff0:	01412803          	lw	a6,20(sp)
8040bff4:	00050463          	beqz	a0,8040bffc <stride_dequeue+0x2e88>
8040bff8:	01352023          	sw	s3,0(a0)
8040bffc:	008c2b03          	lw	s6,8(s8)
8040c000:	86dfe06f          	j	8040a86c <stride_dequeue+0x16f8>
8040c004:	0089a503          	lw	a0,8(s3)
8040c008:	0049ab03          	lw	s6,4(s3)
8040c00c:	00030593          	mv	a1,t1
8040c010:	01012a23          	sw	a6,20(sp)
8040c014:	e89fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c018:	00a9a223          	sw	a0,4(s3)
8040c01c:	0169a423          	sw	s6,8(s3)
8040c020:	01412803          	lw	a6,20(sp)
8040c024:	76050663          	beqz	a0,8040c790 <stride_dequeue+0x361c>
8040c028:	01352023          	sw	s3,0(a0)
8040c02c:	00098313          	mv	t1,s3
8040c030:	008c2b03          	lw	s6,8(s8)
8040c034:	ad0ff06f          	j	8040b304 <stride_dequeue+0x2190>
8040c038:	0089a503          	lw	a0,8(s3)
8040c03c:	0049ab03          	lw	s6,4(s3)
8040c040:	000e0593          	mv	a1,t3
8040c044:	01112a23          	sw	a7,20(sp)
8040c048:	e55fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c04c:	00a9a223          	sw	a0,4(s3)
8040c050:	0169a423          	sw	s6,8(s3)
8040c054:	01412883          	lw	a7,20(sp)
8040c058:	00050463          	beqz	a0,8040c060 <stride_dequeue+0x2eec>
8040c05c:	01352023          	sw	s3,0(a0)
8040c060:	008c2b03          	lw	s6,8(s8)
8040c064:	f30fe06f          	j	8040a794 <stride_dequeue+0x1620>
8040c068:	008a2503          	lw	a0,8(s4)
8040c06c:	004a2b03          	lw	s6,4(s4)
8040c070:	00030593          	mv	a1,t1
8040c074:	e29fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c078:	00aa2223          	sw	a0,4(s4)
8040c07c:	016a2423          	sw	s6,8(s4)
8040c080:	00050463          	beqz	a0,8040c088 <stride_dequeue+0x2f14>
8040c084:	01452023          	sw	s4,0(a0)
8040c088:	008c2b03          	lw	s6,8(s8)
8040c08c:	e9dfd06f          	j	80409f28 <stride_dequeue+0xdb4>
8040c090:	0089a503          	lw	a0,8(s3)
8040c094:	0049ab03          	lw	s6,4(s3)
8040c098:	00088593          	mv	a1,a7
8040c09c:	00c12623          	sw	a2,12(sp)
8040c0a0:	dfdfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c0a4:	00a9a223          	sw	a0,4(s3)
8040c0a8:	0169a423          	sw	s6,8(s3)
8040c0ac:	00c12603          	lw	a2,12(sp)
8040c0b0:	00050463          	beqz	a0,8040c0b8 <stride_dequeue+0x2f44>
8040c0b4:	01352023          	sw	s3,0(a0)
8040c0b8:	008c2b03          	lw	s6,8(s8)
8040c0bc:	bd4fe06f          	j	8040a490 <stride_dequeue+0x131c>
8040c0c0:	0088a503          	lw	a0,8(a7)
8040c0c4:	000e0593          	mv	a1,t3
8040c0c8:	0048ab03          	lw	s6,4(a7)
8040c0cc:	01112a23          	sw	a7,20(sp)
8040c0d0:	dcdfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c0d4:	01412883          	lw	a7,20(sp)
8040c0d8:	00a8a223          	sw	a0,4(a7)
8040c0dc:	0168a423          	sw	s6,8(a7)
8040c0e0:	00050463          	beqz	a0,8040c0e8 <stride_dequeue+0x2f74>
8040c0e4:	01152023          	sw	a7,0(a0)
8040c0e8:	008c2b03          	lw	s6,8(s8)
8040c0ec:	f51fd06f          	j	8040a03c <stride_dequeue+0xec8>
8040c0f0:	0089a503          	lw	a0,8(s3)
8040c0f4:	0049ab03          	lw	s6,4(s3)
8040c0f8:	00030593          	mv	a1,t1
8040c0fc:	01112a23          	sw	a7,20(sp)
8040c100:	d9dfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c104:	00a9a223          	sw	a0,4(s3)
8040c108:	0169a423          	sw	s6,8(s3)
8040c10c:	01412883          	lw	a7,20(sp)
8040c110:	5e050863          	beqz	a0,8040c700 <stride_dequeue+0x358c>
8040c114:	01352023          	sw	s3,0(a0)
8040c118:	00098313          	mv	t1,s3
8040c11c:	008c2b03          	lw	s6,8(s8)
8040c120:	a64ff06f          	j	8040b384 <stride_dequeue+0x2210>
8040c124:	0089a503          	lw	a0,8(s3)
8040c128:	0049ab03          	lw	s6,4(s3)
8040c12c:	000d8593          	mv	a1,s11
8040c130:	01112823          	sw	a7,16(sp)
8040c134:	d69fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c138:	00a9a223          	sw	a0,4(s3)
8040c13c:	0169a423          	sw	s6,8(s3)
8040c140:	01012883          	lw	a7,16(sp)
8040c144:	00050463          	beqz	a0,8040c14c <stride_dequeue+0x2fd8>
8040c148:	01352023          	sw	s3,0(a0)
8040c14c:	008c2b03          	lw	s6,8(s8)
8040c150:	b19fe06f          	j	8040ac68 <stride_dequeue+0x1af4>
8040c154:	00080993          	mv	s3,a6
8040c158:	cd1fe06f          	j	8040ae28 <stride_dequeue+0x1cb4>
8040c15c:	000d8993          	mv	s3,s11
8040c160:	b09fe06f          	j	8040ac68 <stride_dequeue+0x1af4>
8040c164:	00080993          	mv	s3,a6
8040c168:	d9dfe06f          	j	8040af04 <stride_dequeue+0x1d90>
8040c16c:	00080993          	mv	s3,a6
8040c170:	f75fe06f          	j	8040b0e4 <stride_dequeue+0x1f70>
8040c174:	00060993          	mv	s3,a2
8040c178:	e79fe06f          	j	8040aff0 <stride_dequeue+0x1e7c>
8040c17c:	000a0993          	mv	s3,s4
8040c180:	bc9fe06f          	j	8040ad48 <stride_dequeue+0x1bd4>
8040c184:	008c2b03          	lw	s6,8(s8)
8040c188:	000e0c93          	mv	s9,t3
8040c18c:	f20fd06f          	j	804098ac <stride_dequeue+0x738>
8040c190:	008c2b03          	lw	s6,8(s8)
8040c194:	000e0613          	mv	a2,t3
8040c198:	9ddfd06f          	j	80409b74 <stride_dequeue+0xa00>
8040c19c:	0087a503          	lw	a0,8(a5)
8040c1a0:	00098593          	mv	a1,s3
8040c1a4:	0047ab03          	lw	s6,4(a5)
8040c1a8:	cf5fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c1ac:	01012783          	lw	a5,16(sp)
8040c1b0:	00a7a223          	sw	a0,4(a5)
8040c1b4:	0167a423          	sw	s6,8(a5)
8040c1b8:	68050663          	beqz	a0,8040c844 <stride_dequeue+0x36d0>
8040c1bc:	00f52023          	sw	a5,0(a0)
8040c1c0:	00078993          	mv	s3,a5
8040c1c4:	008c2b03          	lw	s6,8(s8)
8040c1c8:	ad4ff06f          	j	8040b49c <stride_dequeue+0x2328>
8040c1cc:	008c2b03          	lw	s6,8(s8)
8040c1d0:	000e0a13          	mv	s4,t3
8040c1d4:	839fd06f          	j	80409a0c <stride_dequeue+0x898>
8040c1d8:	008c2b03          	lw	s6,8(s8)
8040c1dc:	000e0993          	mv	s3,t3
8040c1e0:	f60fe06f          	j	8040a940 <stride_dequeue+0x17cc>
8040c1e4:	008c2b03          	lw	s6,8(s8)
8040c1e8:	00098793          	mv	a5,s3
8040c1ec:	8d9fe06f          	j	8040aac4 <stride_dequeue+0x1950>
8040c1f0:	008c2b03          	lw	s6,8(s8)
8040c1f4:	000e0993          	mv	s3,t3
8040c1f8:	e74fe06f          	j	8040a86c <stride_dequeue+0x16f8>
8040c1fc:	0089a503          	lw	a0,8(s3)
8040c200:	0049ab03          	lw	s6,4(s3)
8040c204:	00088593          	mv	a1,a7
8040c208:	c95fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c20c:	00a9a223          	sw	a0,4(s3)
8040c210:	0169a423          	sw	s6,8(s3)
8040c214:	00050463          	beqz	a0,8040c21c <stride_dequeue+0x30a8>
8040c218:	01352023          	sw	s3,0(a0)
8040c21c:	008c2b03          	lw	s6,8(s8)
8040c220:	955fe06f          	j	8040ab74 <stride_dequeue+0x1a00>
8040c224:	008c2b03          	lw	s6,8(s8)
8040c228:	000e0893          	mv	a7,t3
8040c22c:	854fe06f          	j	8040a280 <stride_dequeue+0x110c>
8040c230:	0087a503          	lw	a0,8(a5)
8040c234:	000a0593          	mv	a1,s4
8040c238:	0047ab03          	lw	s6,4(a5)
8040c23c:	c61fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c240:	00c12783          	lw	a5,12(sp)
8040c244:	01012603          	lw	a2,16(sp)
8040c248:	00a7a223          	sw	a0,4(a5)
8040c24c:	0167a423          	sw	s6,8(a5)
8040c250:	52050a63          	beqz	a0,8040c784 <stride_dequeue+0x3610>
8040c254:	00f52023          	sw	a5,0(a0)
8040c258:	00078a13          	mv	s4,a5
8040c25c:	008c2b03          	lw	s6,8(s8)
8040c260:	9d0ff06f          	j	8040b430 <stride_dequeue+0x22bc>
8040c264:	008c2b03          	lw	s6,8(s8)
8040c268:	000e0893          	mv	a7,t3
8040c26c:	dd1fd06f          	j	8040a03c <stride_dequeue+0xec8>
8040c270:	008c2b03          	lw	s6,8(s8)
8040c274:	000e0993          	mv	s3,t3
8040c278:	d1cfe06f          	j	8040a794 <stride_dequeue+0x1620>
8040c27c:	008c2b03          	lw	s6,8(s8)
8040c280:	000e0993          	mv	s3,t3
8040c284:	fa8fe06f          	j	8040aa2c <stride_dequeue+0x18b8>
8040c288:	008c2b03          	lw	s6,8(s8)
8040c28c:	000e0893          	mv	a7,t3
8040c290:	ee1fd06f          	j	8040a170 <stride_dequeue+0xffc>
8040c294:	0087a503          	lw	a0,8(a5)
8040c298:	000c8593          	mv	a1,s9
8040c29c:	0047ab03          	lw	s6,4(a5)
8040c2a0:	bfdfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c2a4:	01012783          	lw	a5,16(sp)
8040c2a8:	00a7a223          	sw	a0,4(a5)
8040c2ac:	0167a423          	sw	s6,8(a5)
8040c2b0:	44050e63          	beqz	a0,8040c70c <stride_dequeue+0x3598>
8040c2b4:	00f52023          	sw	a5,0(a0)
8040c2b8:	00078c93          	mv	s9,a5
8040c2bc:	008c2b03          	lw	s6,8(s8)
8040c2c0:	ab4ff06f          	j	8040b574 <stride_dequeue+0x2400>
8040c2c4:	0087a503          	lw	a0,8(a5)
8040c2c8:	000a0593          	mv	a1,s4
8040c2cc:	0047ab03          	lw	s6,4(a5)
8040c2d0:	bcdfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c2d4:	01012783          	lw	a5,16(sp)
8040c2d8:	00a7a223          	sw	a0,4(a5)
8040c2dc:	0167a423          	sw	s6,8(a5)
8040c2e0:	52050463          	beqz	a0,8040c808 <stride_dequeue+0x3694>
8040c2e4:	00f52023          	sw	a5,0(a0)
8040c2e8:	00078a13          	mv	s4,a5
8040c2ec:	008c2b03          	lw	s6,8(s8)
8040c2f0:	a18ff06f          	j	8040b508 <stride_dequeue+0x2394>
8040c2f4:	008c2b03          	lw	s6,8(s8)
8040c2f8:	00088993          	mv	s3,a7
8040c2fc:	879fe06f          	j	8040ab74 <stride_dequeue+0x1a00>
8040c300:	0089a503          	lw	a0,8(s3)
8040c304:	0049ab03          	lw	s6,4(s3)
8040c308:	000e0593          	mv	a1,t3
8040c30c:	01012a23          	sw	a6,20(sp)
8040c310:	b8dfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c314:	00a9a223          	sw	a0,4(s3)
8040c318:	0169a423          	sw	s6,8(s3)
8040c31c:	01412803          	lw	a6,20(sp)
8040c320:	00050463          	beqz	a0,8040c328 <stride_dequeue+0x31b4>
8040c324:	01352023          	sw	s3,0(a0)
8040c328:	008c2b03          	lw	s6,8(s8)
8040c32c:	bc5fe06f          	j	8040aef0 <stride_dequeue+0x1d7c>
8040c330:	00882503          	lw	a0,8(a6)
8040c334:	00098593          	mv	a1,s3
8040c338:	00482b03          	lw	s6,4(a6)
8040c33c:	b61fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c340:	01412803          	lw	a6,20(sp)
8040c344:	01812883          	lw	a7,24(sp)
8040c348:	00a82223          	sw	a0,4(a6)
8040c34c:	01682423          	sw	s6,8(a6)
8040c350:	4a050063          	beqz	a0,8040c7f0 <stride_dequeue+0x367c>
8040c354:	01052023          	sw	a6,0(a0)
8040c358:	00080993          	mv	s3,a6
8040c35c:	008c2b03          	lw	s6,8(s8)
8040c360:	a9cff06f          	j	8040b5fc <stride_dequeue+0x2488>
8040c364:	0089a503          	lw	a0,8(s3)
8040c368:	0049ab03          	lw	s6,4(s3)
8040c36c:	000e0593          	mv	a1,t3
8040c370:	01112a23          	sw	a7,20(sp)
8040c374:	00c12823          	sw	a2,16(sp)
8040c378:	b25fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c37c:	00a9a223          	sw	a0,4(s3)
8040c380:	0169a423          	sw	s6,8(s3)
8040c384:	01012603          	lw	a2,16(sp)
8040c388:	01412883          	lw	a7,20(sp)
8040c38c:	00050463          	beqz	a0,8040c394 <stride_dequeue+0x3220>
8040c390:	01352023          	sw	s3,0(a0)
8040c394:	008c2b03          	lw	s6,8(s8)
8040c398:	c45fe06f          	j	8040afdc <stride_dequeue+0x1e68>
8040c39c:	0088a503          	lw	a0,8(a7)
8040c3a0:	00098593          	mv	a1,s3
8040c3a4:	0048ab03          	lw	s6,4(a7)
8040c3a8:	af5fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c3ac:	01012883          	lw	a7,16(sp)
8040c3b0:	01412603          	lw	a2,20(sp)
8040c3b4:	01812803          	lw	a6,24(sp)
8040c3b8:	00a8a223          	sw	a0,4(a7)
8040c3bc:	0168a423          	sw	s6,8(a7)
8040c3c0:	48050863          	beqz	a0,8040c850 <stride_dequeue+0x36dc>
8040c3c4:	01152023          	sw	a7,0(a0)
8040c3c8:	00088993          	mv	s3,a7
8040c3cc:	008c2b03          	lw	s6,8(s8)
8040c3d0:	bc0ff06f          	j	8040b790 <stride_dequeue+0x261c>
8040c3d4:	00832503          	lw	a0,8(t1)
8040c3d8:	000c8593          	mv	a1,s9
8040c3dc:	00432b03          	lw	s6,4(t1)
8040c3e0:	abdfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c3e4:	01412303          	lw	t1,20(sp)
8040c3e8:	01812883          	lw	a7,24(sp)
8040c3ec:	00a32223          	sw	a0,4(t1)
8040c3f0:	01632423          	sw	s6,8(t1)
8040c3f4:	36050663          	beqz	a0,8040c760 <stride_dequeue+0x35ec>
8040c3f8:	00652023          	sw	t1,0(a0)
8040c3fc:	00030c93          	mv	s9,t1
8040c400:	008c2b03          	lw	s6,8(s8)
8040c404:	e10ff06f          	j	8040ba14 <stride_dequeue+0x28a0>
8040c408:	0089a503          	lw	a0,8(s3)
8040c40c:	0049ab03          	lw	s6,4(s3)
8040c410:	000e0593          	mv	a1,t3
8040c414:	01112a23          	sw	a7,20(sp)
8040c418:	00c12823          	sw	a2,16(sp)
8040c41c:	a81fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c420:	00a9a223          	sw	a0,4(s3)
8040c424:	0169a423          	sw	s6,8(s3)
8040c428:	01012603          	lw	a2,16(sp)
8040c42c:	01412883          	lw	a7,20(sp)
8040c430:	00050463          	beqz	a0,8040c438 <stride_dequeue+0x32c4>
8040c434:	01352023          	sw	s3,0(a0)
8040c438:	008c2b03          	lw	s6,8(s8)
8040c43c:	840fe06f          	j	8040a47c <stride_dequeue+0x1308>
8040c440:	0089a503          	lw	a0,8(s3)
8040c444:	0049ab03          	lw	s6,4(s3)
8040c448:	000e0593          	mv	a1,t3
8040c44c:	01012a23          	sw	a6,20(sp)
8040c450:	00c12823          	sw	a2,16(sp)
8040c454:	a49fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c458:	00a9a223          	sw	a0,4(s3)
8040c45c:	0169a423          	sw	s6,8(s3)
8040c460:	01012603          	lw	a2,16(sp)
8040c464:	01412803          	lw	a6,20(sp)
8040c468:	00050463          	beqz	a0,8040c470 <stride_dequeue+0x32fc>
8040c46c:	01352023          	sw	s3,0(a0)
8040c470:	008c2b03          	lw	s6,8(s8)
8040c474:	c5dfe06f          	j	8040b0d0 <stride_dequeue+0x1f5c>
8040c478:	00832503          	lw	a0,8(t1)
8040c47c:	00080593          	mv	a1,a6
8040c480:	00432b03          	lw	s6,4(t1)
8040c484:	a19fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c488:	01412303          	lw	t1,20(sp)
8040c48c:	00a32223          	sw	a0,4(t1)
8040c490:	01632423          	sw	s6,8(t1)
8040c494:	2e050263          	beqz	a0,8040c778 <stride_dequeue+0x3604>
8040c498:	00652023          	sw	t1,0(a0)
8040c49c:	00030813          	mv	a6,t1
8040c4a0:	008c2b03          	lw	s6,8(s8)
8040c4a4:	bf0ff06f          	j	8040b894 <stride_dequeue+0x2720>
8040c4a8:	00832503          	lw	a0,8(t1)
8040c4ac:	00080593          	mv	a1,a6
8040c4b0:	00432b03          	lw	s6,4(t1)
8040c4b4:	9e9fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c4b8:	01412303          	lw	t1,20(sp)
8040c4bc:	00a32223          	sw	a0,4(t1)
8040c4c0:	01632423          	sw	s6,8(t1)
8040c4c4:	2e050263          	beqz	a0,8040c7a8 <stride_dequeue+0x3634>
8040c4c8:	00652023          	sw	t1,0(a0)
8040c4cc:	00030813          	mv	a6,t1
8040c4d0:	008c2b03          	lw	s6,8(s8)
8040c4d4:	b38ff06f          	j	8040b80c <stride_dequeue+0x2698>
8040c4d8:	00882503          	lw	a0,8(a6)
8040c4dc:	00098593          	mv	a1,s3
8040c4e0:	00482b03          	lw	s6,4(a6)
8040c4e4:	9b9fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c4e8:	01412803          	lw	a6,20(sp)
8040c4ec:	01812883          	lw	a7,24(sp)
8040c4f0:	00a82223          	sw	a0,4(a6)
8040c4f4:	01682423          	sw	s6,8(a6)
8040c4f8:	22050663          	beqz	a0,8040c724 <stride_dequeue+0x35b0>
8040c4fc:	01052023          	sw	a6,0(a0)
8040c500:	00080993          	mv	s3,a6
8040c504:	008c2b03          	lw	s6,8(s8)
8040c508:	970ff06f          	j	8040b678 <stride_dequeue+0x2504>
8040c50c:	00832503          	lw	a0,8(t1)
8040c510:	00080593          	mv	a1,a6
8040c514:	00432b03          	lw	s6,4(t1)
8040c518:	985fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c51c:	01012303          	lw	t1,16(sp)
8040c520:	01412603          	lw	a2,20(sp)
8040c524:	00a32223          	sw	a0,4(t1)
8040c528:	01632423          	sw	s6,8(t1)
8040c52c:	2e050a63          	beqz	a0,8040c820 <stride_dequeue+0x36ac>
8040c530:	00652023          	sw	t1,0(a0)
8040c534:	00030813          	mv	a6,t1
8040c538:	008c2b03          	lw	s6,8(s8)
8040c53c:	d70ff06f          	j	8040baac <stride_dequeue+0x2938>
8040c540:	008a2503          	lw	a0,8(s4)
8040c544:	004a2b03          	lw	s6,4(s4)
8040c548:	000e0593          	mv	a1,t3
8040c54c:	00612a23          	sw	t1,20(sp)
8040c550:	94dfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c554:	00aa2223          	sw	a0,4(s4)
8040c558:	016a2423          	sw	s6,8(s4)
8040c55c:	01412303          	lw	t1,20(sp)
8040c560:	00050463          	beqz	a0,8040c568 <stride_dequeue+0x33f4>
8040c564:	01452023          	sw	s4,0(a0)
8040c568:	008c2b03          	lw	s6,8(s8)
8040c56c:	9a9fd06f          	j	80409f14 <stride_dequeue+0xda0>
8040c570:	0089a503          	lw	a0,8(s3)
8040c574:	0049ab03          	lw	s6,4(s3)
8040c578:	000e0593          	mv	a1,t3
8040c57c:	01112a23          	sw	a7,20(sp)
8040c580:	91dfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c584:	00a9a223          	sw	a0,4(s3)
8040c588:	0169a423          	sw	s6,8(s3)
8040c58c:	01412883          	lw	a7,20(sp)
8040c590:	00050463          	beqz	a0,8040c598 <stride_dequeue+0x3424>
8040c594:	01352023          	sw	s3,0(a0)
8040c598:	008c2b03          	lw	s6,8(s8)
8040c59c:	f98fe06f          	j	8040ad34 <stride_dequeue+0x1bc0>
8040c5a0:	0089a503          	lw	a0,8(s3)
8040c5a4:	0049ab03          	lw	s6,4(s3)
8040c5a8:	000e0593          	mv	a1,t3
8040c5ac:	01012a23          	sw	a6,20(sp)
8040c5b0:	8edfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c5b4:	00a9a223          	sw	a0,4(s3)
8040c5b8:	0169a423          	sw	s6,8(s3)
8040c5bc:	01412803          	lw	a6,20(sp)
8040c5c0:	00050463          	beqz	a0,8040c5c8 <stride_dequeue+0x3454>
8040c5c4:	01352023          	sw	s3,0(a0)
8040c5c8:	008c2b03          	lw	s6,8(s8)
8040c5cc:	849fe06f          	j	8040ae14 <stride_dequeue+0x1ca0>
8040c5d0:	0089a503          	lw	a0,8(s3)
8040c5d4:	0049ab03          	lw	s6,4(s3)
8040c5d8:	000e0593          	mv	a1,t3
8040c5dc:	01112a23          	sw	a7,20(sp)
8040c5e0:	8bdfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c5e4:	00a9a223          	sw	a0,4(s3)
8040c5e8:	0169a423          	sw	s6,8(s3)
8040c5ec:	01412883          	lw	a7,20(sp)
8040c5f0:	00050463          	beqz	a0,8040c5f8 <stride_dequeue+0x3484>
8040c5f4:	01352023          	sw	s3,0(a0)
8040c5f8:	008c2b03          	lw	s6,8(s8)
8040c5fc:	f99fd06f          	j	8040a594 <stride_dequeue+0x1420>
8040c600:	0088a503          	lw	a0,8(a7)
8040c604:	00098593          	mv	a1,s3
8040c608:	0048ab03          	lw	s6,4(a7)
8040c60c:	891fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c610:	01412883          	lw	a7,20(sp)
8040c614:	01812803          	lw	a6,24(sp)
8040c618:	00a8a223          	sw	a0,4(a7)
8040c61c:	0168a423          	sw	s6,8(a7)
8040c620:	0e050c63          	beqz	a0,8040c718 <stride_dequeue+0x35a4>
8040c624:	01152023          	sw	a7,0(a0)
8040c628:	00088993          	mv	s3,a7
8040c62c:	008c2b03          	lw	s6,8(s8)
8040c630:	ae0ff06f          	j	8040b910 <stride_dequeue+0x279c>
8040c634:	00882503          	lw	a0,8(a6)
8040c638:	00098593          	mv	a1,s3
8040c63c:	00482b03          	lw	s6,4(a6)
8040c640:	85dfc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c644:	01012803          	lw	a6,16(sp)
8040c648:	01412603          	lw	a2,20(sp)
8040c64c:	01812883          	lw	a7,24(sp)
8040c650:	00a82223          	sw	a0,4(a6)
8040c654:	01682423          	sw	s6,8(a6)
8040c658:	16050463          	beqz	a0,8040c7c0 <stride_dequeue+0x364c>
8040c65c:	01052023          	sw	a6,0(a0)
8040c660:	00080993          	mv	s3,a6
8040c664:	008c2b03          	lw	s6,8(s8)
8040c668:	89cff06f          	j	8040b704 <stride_dequeue+0x2590>
8040c66c:	0089a503          	lw	a0,8(s3)
8040c670:	0049ab03          	lw	s6,4(s3)
8040c674:	000e0593          	mv	a1,t3
8040c678:	01112a23          	sw	a7,20(sp)
8040c67c:	821fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c680:	00a9a223          	sw	a0,4(s3)
8040c684:	0169a423          	sw	s6,8(s3)
8040c688:	01412883          	lw	a7,20(sp)
8040c68c:	00050463          	beqz	a0,8040c694 <stride_dequeue+0x3520>
8040c690:	01352023          	sw	s3,0(a0)
8040c694:	008c2b03          	lw	s6,8(s8)
8040c698:	810fe06f          	j	8040a6a8 <stride_dequeue+0x1534>
8040c69c:	0089a503          	lw	a0,8(s3)
8040c6a0:	0049ab03          	lw	s6,4(s3)
8040c6a4:	000e0593          	mv	a1,t3
8040c6a8:	01112a23          	sw	a7,20(sp)
8040c6ac:	ff0fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c6b0:	00a9a223          	sw	a0,4(s3)
8040c6b4:	0169a423          	sw	s6,8(s3)
8040c6b8:	01412883          	lw	a7,20(sp)
8040c6bc:	00050463          	beqz	a0,8040c6c4 <stride_dequeue+0x3550>
8040c6c0:	01352023          	sw	s3,0(a0)
8040c6c4:	008c2b03          	lw	s6,8(s8)
8040c6c8:	d8cfe06f          	j	8040ac54 <stride_dequeue+0x1ae0>
8040c6cc:	0088a503          	lw	a0,8(a7)
8040c6d0:	00098593          	mv	a1,s3
8040c6d4:	0048ab03          	lw	s6,4(a7)
8040c6d8:	fc4fc0ef          	jal	ra,80408e9c <skew_heap_merge.constprop.3>
8040c6dc:	01412883          	lw	a7,20(sp)
8040c6e0:	01812803          	lw	a6,24(sp)
8040c6e4:	00a8a223          	sw	a0,4(a7)
8040c6e8:	0168a423          	sw	s6,8(a7)
8040c6ec:	04050263          	beqz	a0,8040c730 <stride_dequeue+0x35bc>
8040c6f0:	01152023          	sw	a7,0(a0)
8040c6f4:	00088993          	mv	s3,a7
8040c6f8:	008c2b03          	lw	s6,8(s8)
8040c6fc:	a9cff06f          	j	8040b998 <stride_dequeue+0x2824>
8040c700:	008c2b03          	lw	s6,8(s8)
8040c704:	00098313          	mv	t1,s3
8040c708:	c7dfe06f          	j	8040b384 <stride_dequeue+0x2210>
8040c70c:	008c2b03          	lw	s6,8(s8)
8040c710:	00078c93          	mv	s9,a5
8040c714:	e61fe06f          	j	8040b574 <stride_dequeue+0x2400>
8040c718:	008c2b03          	lw	s6,8(s8)
8040c71c:	00088993          	mv	s3,a7
8040c720:	9f0ff06f          	j	8040b910 <stride_dequeue+0x279c>
8040c724:	008c2b03          	lw	s6,8(s8)
8040c728:	00080993          	mv	s3,a6
8040c72c:	f4dfe06f          	j	8040b678 <stride_dequeue+0x2504>
8040c730:	008c2b03          	lw	s6,8(s8)
8040c734:	00088993          	mv	s3,a7
8040c738:	a60ff06f          	j	8040b998 <stride_dequeue+0x2824>
8040c73c:	008c2b03          	lw	s6,8(s8)
8040c740:	000e0993          	mv	s3,t3
8040c744:	df0fe06f          	j	8040ad34 <stride_dequeue+0x1bc0>
8040c748:	008c2b03          	lw	s6,8(s8)
8040c74c:	000e0993          	mv	s3,t3
8040c750:	ec4fe06f          	j	8040ae14 <stride_dequeue+0x1ca0>
8040c754:	008c2b03          	lw	s6,8(s8)
8040c758:	000e0993          	mv	s3,t3
8040c75c:	d21fd06f          	j	8040a47c <stride_dequeue+0x1308>
8040c760:	008c2b03          	lw	s6,8(s8)
8040c764:	00030c93          	mv	s9,t1
8040c768:	aacff06f          	j	8040ba14 <stride_dequeue+0x28a0>
8040c76c:	008c2b03          	lw	s6,8(s8)
8040c770:	000e0993          	mv	s3,t3
8040c774:	95dfe06f          	j	8040b0d0 <stride_dequeue+0x1f5c>
8040c778:	008c2b03          	lw	s6,8(s8)
8040c77c:	00030813          	mv	a6,t1
8040c780:	914ff06f          	j	8040b894 <stride_dequeue+0x2720>
8040c784:	008c2b03          	lw	s6,8(s8)
8040c788:	00078a13          	mv	s4,a5
8040c78c:	ca5fe06f          	j	8040b430 <stride_dequeue+0x22bc>
8040c790:	008c2b03          	lw	s6,8(s8)
8040c794:	00098313          	mv	t1,s3
8040c798:	b6dfe06f          	j	8040b304 <stride_dequeue+0x2190>
8040c79c:	008c2b03          	lw	s6,8(s8)
8040c7a0:	000e0993          	mv	s3,t3
8040c7a4:	cb0fe06f          	j	8040ac54 <stride_dequeue+0x1ae0>
8040c7a8:	008c2b03          	lw	s6,8(s8)
8040c7ac:	00030813          	mv	a6,t1
8040c7b0:	85cff06f          	j	8040b80c <stride_dequeue+0x2698>
8040c7b4:	008c2b03          	lw	s6,8(s8)
8040c7b8:	000e0993          	mv	s3,t3
8040c7bc:	eedfd06f          	j	8040a6a8 <stride_dequeue+0x1534>
8040c7c0:	008c2b03          	lw	s6,8(s8)
8040c7c4:	00080993          	mv	s3,a6
8040c7c8:	f3dfe06f          	j	8040b704 <stride_dequeue+0x2590>
8040c7cc:	008c2b03          	lw	s6,8(s8)
8040c7d0:	00098313          	mv	t1,s3
8040c7d4:	aadfe06f          	j	8040b280 <stride_dequeue+0x210c>
8040c7d8:	008c2b03          	lw	s6,8(s8)
8040c7dc:	000e0993          	mv	s3,t3
8040c7e0:	f10fe06f          	j	8040aef0 <stride_dequeue+0x1d7c>
8040c7e4:	008c2b03          	lw	s6,8(s8)
8040c7e8:	000e0993          	mv	s3,t3
8040c7ec:	ff0fe06f          	j	8040afdc <stride_dequeue+0x1e68>
8040c7f0:	008c2b03          	lw	s6,8(s8)
8040c7f4:	00080993          	mv	s3,a6
8040c7f8:	e05fe06f          	j	8040b5fc <stride_dequeue+0x2488>
8040c7fc:	008c2b03          	lw	s6,8(s8)
8040c800:	000e0993          	mv	s3,t3
8040c804:	d91fd06f          	j	8040a594 <stride_dequeue+0x1420>
8040c808:	008c2b03          	lw	s6,8(s8)
8040c80c:	00078a13          	mv	s4,a5
8040c810:	cf9fe06f          	j	8040b508 <stride_dequeue+0x2394>
8040c814:	008c2b03          	lw	s6,8(s8)
8040c818:	000e0a13          	mv	s4,t3
8040c81c:	ef8fd06f          	j	80409f14 <stride_dequeue+0xda0>
8040c820:	008c2b03          	lw	s6,8(s8)
8040c824:	00030813          	mv	a6,t1
8040c828:	a84ff06f          	j	8040baac <stride_dequeue+0x2938>
8040c82c:	008c2b03          	lw	s6,8(s8)
8040c830:	00098813          	mv	a6,s3
8040c834:	931fe06f          	j	8040b164 <stride_dequeue+0x1ff0>
8040c838:	008c2b03          	lw	s6,8(s8)
8040c83c:	00098313          	mv	t1,s3
8040c840:	9bdfe06f          	j	8040b1fc <stride_dequeue+0x2088>
8040c844:	008c2b03          	lw	s6,8(s8)
8040c848:	00078993          	mv	s3,a5
8040c84c:	c51fe06f          	j	8040b49c <stride_dequeue+0x2328>
8040c850:	008c2b03          	lw	s6,8(s8)
8040c854:	00088993          	mv	s3,a7
8040c858:	f39fe06f          	j	8040b790 <stride_dequeue+0x261c>

8040c85c <sched_init>:
8040c85c:	ff010113          	addi	sp,sp,-16
8040c860:	0008c697          	auipc	a3,0x8c
8040c864:	7c068693          	addi	a3,a3,1984 # 80499020 <default_sched_class>
8040c868:	00812423          	sw	s0,8(sp)
8040c86c:	00112623          	sw	ra,12(sp)
8040c870:	00090797          	auipc	a5,0x90
8040c874:	f5478793          	addi	a5,a5,-172 # 8049c7c4 <timer_list>
8040c878:	0046a603          	lw	a2,4(a3)
8040c87c:	0008f717          	auipc	a4,0x8f
8040c880:	ecc70713          	addi	a4,a4,-308 # 8049b748 <__rq>
8040c884:	00f7a223          	sw	a5,4(a5)
8040c888:	00f7a023          	sw	a5,0(a5)
8040c88c:	00500793          	li	a5,5
8040c890:	00090417          	auipc	s0,0x90
8040c894:	f3040413          	addi	s0,s0,-208 # 8049c7c0 <sched_class>
8040c898:	00f72623          	sw	a5,12(a4)
8040c89c:	00070513          	mv	a0,a4
8040c8a0:	00d42023          	sw	a3,0(s0)
8040c8a4:	00090797          	auipc	a5,0x90
8040c8a8:	f0e7ac23          	sw	a4,-232(a5) # 8049c7bc <rq>
8040c8ac:	000600e7          	jalr	a2
8040c8b0:	00042783          	lw	a5,0(s0)
8040c8b4:	00812403          	lw	s0,8(sp)
8040c8b8:	00c12083          	lw	ra,12(sp)
8040c8bc:	0007a583          	lw	a1,0(a5)
8040c8c0:	00008517          	auipc	a0,0x8
8040c8c4:	04050513          	addi	a0,a0,64 # 80414900 <CSWTCH.69+0x9a4>
8040c8c8:	01010113          	addi	sp,sp,16
8040c8cc:	931f306f          	j	804001fc <cprintf>

8040c8d0 <wakeup_proc>:
8040c8d0:	00052703          	lw	a4,0(a0)
8040c8d4:	ff010113          	addi	sp,sp,-16
8040c8d8:	00112623          	sw	ra,12(sp)
8040c8dc:	00812423          	sw	s0,8(sp)
8040c8e0:	00912223          	sw	s1,4(sp)
8040c8e4:	00300793          	li	a5,3
8040c8e8:	0cf70263          	beq	a4,a5,8040c9ac <wakeup_proc+0xdc>
8040c8ec:	00050413          	mv	s0,a0
8040c8f0:	100027f3          	csrr	a5,sstatus
8040c8f4:	0027f793          	andi	a5,a5,2
8040c8f8:	00000493          	li	s1,0
8040c8fc:	0a079063          	bnez	a5,8040c99c <wakeup_proc+0xcc>
8040c900:	00200793          	li	a5,2
8040c904:	06f70e63          	beq	a4,a5,8040c980 <wakeup_proc+0xb0>
8040c908:	00090717          	auipc	a4,0x90
8040c90c:	ea470713          	addi	a4,a4,-348 # 8049c7ac <current>
8040c910:	00072703          	lw	a4,0(a4)
8040c914:	0a042423          	sw	zero,168(s0)
8040c918:	00f42023          	sw	a5,0(s0)
8040c91c:	02870c63          	beq	a4,s0,8040c954 <wakeup_proc+0x84>
8040c920:	00090797          	auipc	a5,0x90
8040c924:	e9078793          	addi	a5,a5,-368 # 8049c7b0 <idleproc>
8040c928:	0007a783          	lw	a5,0(a5)
8040c92c:	02f40463          	beq	s0,a5,8040c954 <wakeup_proc+0x84>
8040c930:	00090797          	auipc	a5,0x90
8040c934:	e9078793          	addi	a5,a5,-368 # 8049c7c0 <sched_class>
8040c938:	0007a783          	lw	a5,0(a5)
8040c93c:	00090717          	auipc	a4,0x90
8040c940:	e8070713          	addi	a4,a4,-384 # 8049c7bc <rq>
8040c944:	00072503          	lw	a0,0(a4)
8040c948:	0087a783          	lw	a5,8(a5)
8040c94c:	00040593          	mv	a1,s0
8040c950:	000780e7          	jalr	a5
8040c954:	00049c63          	bnez	s1,8040c96c <wakeup_proc+0x9c>
8040c958:	00c12083          	lw	ra,12(sp)
8040c95c:	00812403          	lw	s0,8(sp)
8040c960:	00412483          	lw	s1,4(sp)
8040c964:	01010113          	addi	sp,sp,16
8040c968:	00008067          	ret
8040c96c:	00812403          	lw	s0,8(sp)
8040c970:	00c12083          	lw	ra,12(sp)
8040c974:	00412483          	lw	s1,4(sp)
8040c978:	01010113          	addi	sp,sp,16
8040c97c:	a94f406f          	j	80400c10 <intr_enable>
8040c980:	00008617          	auipc	a2,0x8
8040c984:	fc860613          	addi	a2,a2,-56 # 80414948 <CSWTCH.69+0x9ec>
8040c988:	04800593          	li	a1,72
8040c98c:	00008517          	auipc	a0,0x8
8040c990:	fa450513          	addi	a0,a0,-92 # 80414930 <CSWTCH.69+0x9d4>
8040c994:	d15f30ef          	jal	ra,804006a8 <__warn>
8040c998:	fbdff06f          	j	8040c954 <wakeup_proc+0x84>
8040c99c:	a7cf40ef          	jal	ra,80400c18 <intr_disable>
8040c9a0:	00042703          	lw	a4,0(s0)
8040c9a4:	00100493          	li	s1,1
8040c9a8:	f59ff06f          	j	8040c900 <wakeup_proc+0x30>
8040c9ac:	00008697          	auipc	a3,0x8
8040c9b0:	f6868693          	addi	a3,a3,-152 # 80414914 <CSWTCH.69+0x9b8>
8040c9b4:	00006617          	auipc	a2,0x6
8040c9b8:	18860613          	addi	a2,a2,392 # 80412b3c <commands+0x1bc>
8040c9bc:	03c00593          	li	a1,60
8040c9c0:	00008517          	auipc	a0,0x8
8040c9c4:	f7050513          	addi	a0,a0,-144 # 80414930 <CSWTCH.69+0x9d4>
8040c9c8:	c5df30ef          	jal	ra,80400624 <__panic>

8040c9cc <schedule>:
8040c9cc:	fe010113          	addi	sp,sp,-32
8040c9d0:	00112e23          	sw	ra,28(sp)
8040c9d4:	00812c23          	sw	s0,24(sp)
8040c9d8:	00912a23          	sw	s1,20(sp)
8040c9dc:	01212823          	sw	s2,16(sp)
8040c9e0:	01312623          	sw	s3,12(sp)
8040c9e4:	01412423          	sw	s4,8(sp)
8040c9e8:	100027f3          	csrr	a5,sstatus
8040c9ec:	0027f793          	andi	a5,a5,2
8040c9f0:	00000a13          	li	s4,0
8040c9f4:	0e079e63          	bnez	a5,8040caf0 <schedule+0x124>
8040c9f8:	00090497          	auipc	s1,0x90
8040c9fc:	db448493          	addi	s1,s1,-588 # 8049c7ac <current>
8040ca00:	0004a583          	lw	a1,0(s1)
8040ca04:	00090997          	auipc	s3,0x90
8040ca08:	dbc98993          	addi	s3,s3,-580 # 8049c7c0 <sched_class>
8040ca0c:	00090917          	auipc	s2,0x90
8040ca10:	db090913          	addi	s2,s2,-592 # 8049c7bc <rq>
8040ca14:	0005a683          	lw	a3,0(a1)
8040ca18:	0005a823          	sw	zero,16(a1)
8040ca1c:	00200713          	li	a4,2
8040ca20:	0009a783          	lw	a5,0(s3)
8040ca24:	00092503          	lw	a0,0(s2)
8040ca28:	06e68463          	beq	a3,a4,8040ca90 <schedule+0xc4>
8040ca2c:	0107a783          	lw	a5,16(a5)
8040ca30:	000780e7          	jalr	a5
8040ca34:	00050413          	mv	s0,a0
8040ca38:	08050463          	beqz	a0,8040cac0 <schedule+0xf4>
8040ca3c:	0009a783          	lw	a5,0(s3)
8040ca40:	00092503          	lw	a0,0(s2)
8040ca44:	00040593          	mv	a1,s0
8040ca48:	00c7a783          	lw	a5,12(a5)
8040ca4c:	000780e7          	jalr	a5
8040ca50:	00842783          	lw	a5,8(s0)
8040ca54:	0004a703          	lw	a4,0(s1)
8040ca58:	00178793          	addi	a5,a5,1
8040ca5c:	00f42423          	sw	a5,8(s0)
8040ca60:	00870663          	beq	a4,s0,8040ca6c <schedule+0xa0>
8040ca64:	00040513          	mv	a0,s0
8040ca68:	fccfa0ef          	jal	ra,80407234 <proc_run>
8040ca6c:	060a1263          	bnez	s4,8040cad0 <schedule+0x104>
8040ca70:	01c12083          	lw	ra,28(sp)
8040ca74:	01812403          	lw	s0,24(sp)
8040ca78:	01412483          	lw	s1,20(sp)
8040ca7c:	01012903          	lw	s2,16(sp)
8040ca80:	00c12983          	lw	s3,12(sp)
8040ca84:	00812a03          	lw	s4,8(sp)
8040ca88:	02010113          	addi	sp,sp,32
8040ca8c:	00008067          	ret
8040ca90:	00090717          	auipc	a4,0x90
8040ca94:	d2070713          	addi	a4,a4,-736 # 8049c7b0 <idleproc>
8040ca98:	00072703          	lw	a4,0(a4)
8040ca9c:	f8e588e3          	beq	a1,a4,8040ca2c <schedule+0x60>
8040caa0:	0087a783          	lw	a5,8(a5)
8040caa4:	000780e7          	jalr	a5
8040caa8:	0009a783          	lw	a5,0(s3)
8040caac:	00092503          	lw	a0,0(s2)
8040cab0:	0107a783          	lw	a5,16(a5)
8040cab4:	000780e7          	jalr	a5
8040cab8:	00050413          	mv	s0,a0
8040cabc:	f80510e3          	bnez	a0,8040ca3c <schedule+0x70>
8040cac0:	00090797          	auipc	a5,0x90
8040cac4:	cf078793          	addi	a5,a5,-784 # 8049c7b0 <idleproc>
8040cac8:	0007a403          	lw	s0,0(a5)
8040cacc:	f85ff06f          	j	8040ca50 <schedule+0x84>
8040cad0:	01812403          	lw	s0,24(sp)
8040cad4:	01c12083          	lw	ra,28(sp)
8040cad8:	01412483          	lw	s1,20(sp)
8040cadc:	01012903          	lw	s2,16(sp)
8040cae0:	00c12983          	lw	s3,12(sp)
8040cae4:	00812a03          	lw	s4,8(sp)
8040cae8:	02010113          	addi	sp,sp,32
8040caec:	924f406f          	j	80400c10 <intr_enable>
8040caf0:	928f40ef          	jal	ra,80400c18 <intr_disable>
8040caf4:	00100a13          	li	s4,1
8040caf8:	f01ff06f          	j	8040c9f8 <schedule+0x2c>

8040cafc <add_timer>:
8040cafc:	fe010113          	addi	sp,sp,-32
8040cb00:	00112e23          	sw	ra,28(sp)
8040cb04:	100027f3          	csrr	a5,sstatus
8040cb08:	0027f793          	andi	a5,a5,2
8040cb0c:	00000813          	li	a6,0
8040cb10:	0a079263          	bnez	a5,8040cbb4 <add_timer+0xb8>
8040cb14:	00052703          	lw	a4,0(a0)
8040cb18:	0a070863          	beqz	a4,8040cbc8 <add_timer+0xcc>
8040cb1c:	00452783          	lw	a5,4(a0)
8040cb20:	0a078463          	beqz	a5,8040cbc8 <add_timer+0xcc>
8040cb24:	00c52783          	lw	a5,12(a0)
8040cb28:	00850593          	addi	a1,a0,8
8040cb2c:	0af59e63          	bne	a1,a5,8040cbe8 <add_timer+0xec>
8040cb30:	00090617          	auipc	a2,0x90
8040cb34:	c9460613          	addi	a2,a2,-876 # 8049c7c4 <timer_list>
8040cb38:	00462783          	lw	a5,4(a2)
8040cb3c:	00c79c63          	bne	a5,a2,8040cb54 <add_timer+0x58>
8040cb40:	0480006f          	j	8040cb88 <add_timer+0x8c>
8040cb44:	0047a783          	lw	a5,4(a5)
8040cb48:	40d70733          	sub	a4,a4,a3
8040cb4c:	00e52023          	sw	a4,0(a0)
8040cb50:	02c78c63          	beq	a5,a2,8040cb88 <add_timer+0x8c>
8040cb54:	ff87a683          	lw	a3,-8(a5)
8040cb58:	fed776e3          	bgeu	a4,a3,8040cb44 <add_timer+0x48>
8040cb5c:	40e68733          	sub	a4,a3,a4
8040cb60:	fee7ac23          	sw	a4,-8(a5)
8040cb64:	0007a703          	lw	a4,0(a5)
8040cb68:	00b7a023          	sw	a1,0(a5)
8040cb6c:	00b72223          	sw	a1,4(a4)
8040cb70:	00f52623          	sw	a5,12(a0)
8040cb74:	00e52423          	sw	a4,8(a0)
8040cb78:	02080863          	beqz	a6,8040cba8 <add_timer+0xac>
8040cb7c:	01c12083          	lw	ra,28(sp)
8040cb80:	02010113          	addi	sp,sp,32
8040cb84:	88cf406f          	j	80400c10 <intr_enable>
8040cb88:	00090797          	auipc	a5,0x90
8040cb8c:	c3c78793          	addi	a5,a5,-964 # 8049c7c4 <timer_list>
8040cb90:	0007a703          	lw	a4,0(a5)
8040cb94:	00b7a023          	sw	a1,0(a5)
8040cb98:	00b72223          	sw	a1,4(a4)
8040cb9c:	00f52623          	sw	a5,12(a0)
8040cba0:	00e52423          	sw	a4,8(a0)
8040cba4:	fc081ce3          	bnez	a6,8040cb7c <add_timer+0x80>
8040cba8:	01c12083          	lw	ra,28(sp)
8040cbac:	02010113          	addi	sp,sp,32
8040cbb0:	00008067          	ret
8040cbb4:	00a12623          	sw	a0,12(sp)
8040cbb8:	860f40ef          	jal	ra,80400c18 <intr_disable>
8040cbbc:	00100813          	li	a6,1
8040cbc0:	00c12503          	lw	a0,12(sp)
8040cbc4:	f51ff06f          	j	8040cb14 <add_timer+0x18>
8040cbc8:	00008697          	auipc	a3,0x8
8040cbcc:	c9068693          	addi	a3,a3,-880 # 80414858 <CSWTCH.69+0x8fc>
8040cbd0:	00006617          	auipc	a2,0x6
8040cbd4:	f6c60613          	addi	a2,a2,-148 # 80412b3c <commands+0x1bc>
8040cbd8:	06b00593          	li	a1,107
8040cbdc:	00008517          	auipc	a0,0x8
8040cbe0:	d5450513          	addi	a0,a0,-684 # 80414930 <CSWTCH.69+0x9d4>
8040cbe4:	a41f30ef          	jal	ra,80400624 <__panic>
8040cbe8:	00008697          	auipc	a3,0x8
8040cbec:	c9c68693          	addi	a3,a3,-868 # 80414884 <CSWTCH.69+0x928>
8040cbf0:	00006617          	auipc	a2,0x6
8040cbf4:	f4c60613          	addi	a2,a2,-180 # 80412b3c <commands+0x1bc>
8040cbf8:	06c00593          	li	a1,108
8040cbfc:	00008517          	auipc	a0,0x8
8040cc00:	d3450513          	addi	a0,a0,-716 # 80414930 <CSWTCH.69+0x9d4>
8040cc04:	a21f30ef          	jal	ra,80400624 <__panic>

8040cc08 <del_timer>:
8040cc08:	fe010113          	addi	sp,sp,-32
8040cc0c:	00112e23          	sw	ra,28(sp)
8040cc10:	00812c23          	sw	s0,24(sp)
8040cc14:	100027f3          	csrr	a5,sstatus
8040cc18:	0027f793          	andi	a5,a5,2
8040cc1c:	00850413          	addi	s0,a0,8
8040cc20:	06079c63          	bnez	a5,8040cc98 <del_timer+0x90>
8040cc24:	00c52783          	lw	a5,12(a0)
8040cc28:	06f40063          	beq	s0,a5,8040cc88 <del_timer+0x80>
8040cc2c:	00052683          	lw	a3,0(a0)
8040cc30:	00852703          	lw	a4,8(a0)
8040cc34:	04068263          	beqz	a3,8040cc78 <del_timer+0x70>
8040cc38:	00090617          	auipc	a2,0x90
8040cc3c:	b8c60613          	addi	a2,a2,-1140 # 8049c7c4 <timer_list>
8040cc40:	00000593          	li	a1,0
8040cc44:	02c78a63          	beq	a5,a2,8040cc78 <del_timer+0x70>
8040cc48:	ff87a603          	lw	a2,-8(a5)
8040cc4c:	00d606b3          	add	a3,a2,a3
8040cc50:	fed7ac23          	sw	a3,-8(a5)
8040cc54:	00f72223          	sw	a5,4(a4)
8040cc58:	00e7a023          	sw	a4,0(a5)
8040cc5c:	00852623          	sw	s0,12(a0)
8040cc60:	00852423          	sw	s0,8(a0)
8040cc64:	02058263          	beqz	a1,8040cc88 <del_timer+0x80>
8040cc68:	01812403          	lw	s0,24(sp)
8040cc6c:	01c12083          	lw	ra,28(sp)
8040cc70:	02010113          	addi	sp,sp,32
8040cc74:	f9df306f          	j	80400c10 <intr_enable>
8040cc78:	00f72223          	sw	a5,4(a4)
8040cc7c:	00e7a023          	sw	a4,0(a5)
8040cc80:	00852623          	sw	s0,12(a0)
8040cc84:	00852423          	sw	s0,8(a0)
8040cc88:	01c12083          	lw	ra,28(sp)
8040cc8c:	01812403          	lw	s0,24(sp)
8040cc90:	02010113          	addi	sp,sp,32
8040cc94:	00008067          	ret
8040cc98:	00a12623          	sw	a0,12(sp)
8040cc9c:	f7df30ef          	jal	ra,80400c18 <intr_disable>
8040cca0:	00c12503          	lw	a0,12(sp)
8040cca4:	00c52783          	lw	a5,12(a0)
8040cca8:	fc8780e3          	beq	a5,s0,8040cc68 <del_timer+0x60>
8040ccac:	00052683          	lw	a3,0(a0)
8040ccb0:	00852703          	lw	a4,8(a0)
8040ccb4:	00068a63          	beqz	a3,8040ccc8 <del_timer+0xc0>
8040ccb8:	00090617          	auipc	a2,0x90
8040ccbc:	b0c60613          	addi	a2,a2,-1268 # 8049c7c4 <timer_list>
8040ccc0:	00100593          	li	a1,1
8040ccc4:	f8c792e3          	bne	a5,a2,8040cc48 <del_timer+0x40>
8040ccc8:	00f72223          	sw	a5,4(a4)
8040cccc:	00e7a023          	sw	a4,0(a5)
8040ccd0:	00852623          	sw	s0,12(a0)
8040ccd4:	00852423          	sw	s0,8(a0)
8040ccd8:	f91ff06f          	j	8040cc68 <del_timer+0x60>

8040ccdc <run_timer_list>:
8040ccdc:	fe010113          	addi	sp,sp,-32
8040cce0:	00112e23          	sw	ra,28(sp)
8040cce4:	00812c23          	sw	s0,24(sp)
8040cce8:	00912a23          	sw	s1,20(sp)
8040ccec:	01212823          	sw	s2,16(sp)
8040ccf0:	01312623          	sw	s3,12(sp)
8040ccf4:	01412423          	sw	s4,8(sp)
8040ccf8:	01512223          	sw	s5,4(sp)
8040ccfc:	01612023          	sw	s6,0(sp)
8040cd00:	100027f3          	csrr	a5,sstatus
8040cd04:	0027f793          	andi	a5,a5,2
8040cd08:	00000b13          	li	s6,0
8040cd0c:	12079c63          	bnez	a5,8040ce44 <run_timer_list+0x168>
8040cd10:	00090997          	auipc	s3,0x90
8040cd14:	ab498993          	addi	s3,s3,-1356 # 8049c7c4 <timer_list>
8040cd18:	0049a403          	lw	s0,4(s3)
8040cd1c:	09340663          	beq	s0,s3,8040cda8 <run_timer_list+0xcc>
8040cd20:	ff842783          	lw	a5,-8(s0)
8040cd24:	ff840913          	addi	s2,s0,-8
8040cd28:	14078463          	beqz	a5,8040ce70 <run_timer_list+0x194>
8040cd2c:	fff78793          	addi	a5,a5,-1
8040cd30:	fef42c23          	sw	a5,-8(s0)
8040cd34:	06079a63          	bnez	a5,8040cda8 <run_timer_list+0xcc>
8040cd38:	00008a97          	auipc	s5,0x8
8040cd3c:	ba8a8a93          	addi	s5,s5,-1112 # 804148e0 <CSWTCH.69+0x984>
8040cd40:	00008a17          	auipc	s4,0x8
8040cd44:	bf0a0a13          	addi	s4,s4,-1040 # 80414930 <CSWTCH.69+0x9d4>
8040cd48:	0280006f          	j	8040cd70 <run_timer_list+0x94>
8040cd4c:	1007d263          	bgez	a5,8040ce50 <run_timer_list+0x174>
8040cd50:	00048513          	mv	a0,s1
8040cd54:	b7dff0ef          	jal	ra,8040c8d0 <wakeup_proc>
8040cd58:	00090513          	mv	a0,s2
8040cd5c:	eadff0ef          	jal	ra,8040cc08 <del_timer>
8040cd60:	05340463          	beq	s0,s3,8040cda8 <run_timer_list+0xcc>
8040cd64:	ff842783          	lw	a5,-8(s0)
8040cd68:	ff840913          	addi	s2,s0,-8
8040cd6c:	02079e63          	bnez	a5,8040cda8 <run_timer_list+0xcc>
8040cd70:	00492483          	lw	s1,4(s2)
8040cd74:	00442403          	lw	s0,4(s0)
8040cd78:	0a84a783          	lw	a5,168(s1)
8040cd7c:	fc0798e3          	bnez	a5,8040cd4c <run_timer_list+0x70>
8040cd80:	0044a683          	lw	a3,4(s1)
8040cd84:	000a8613          	mv	a2,s5
8040cd88:	0a200593          	li	a1,162
8040cd8c:	000a0513          	mv	a0,s4
8040cd90:	919f30ef          	jal	ra,804006a8 <__warn>
8040cd94:	00048513          	mv	a0,s1
8040cd98:	b39ff0ef          	jal	ra,8040c8d0 <wakeup_proc>
8040cd9c:	00090513          	mv	a0,s2
8040cda0:	e69ff0ef          	jal	ra,8040cc08 <del_timer>
8040cda4:	fd3410e3          	bne	s0,s3,8040cd64 <run_timer_list+0x88>
8040cda8:	00090797          	auipc	a5,0x90
8040cdac:	a0478793          	addi	a5,a5,-1532 # 8049c7ac <current>
8040cdb0:	0007a583          	lw	a1,0(a5)
8040cdb4:	00090797          	auipc	a5,0x90
8040cdb8:	9fc78793          	addi	a5,a5,-1540 # 8049c7b0 <idleproc>
8040cdbc:	0007a783          	lw	a5,0(a5)
8040cdc0:	06f58c63          	beq	a1,a5,8040ce38 <run_timer_list+0x15c>
8040cdc4:	00090797          	auipc	a5,0x90
8040cdc8:	9fc78793          	addi	a5,a5,-1540 # 8049c7c0 <sched_class>
8040cdcc:	0007a783          	lw	a5,0(a5)
8040cdd0:	00090717          	auipc	a4,0x90
8040cdd4:	9ec70713          	addi	a4,a4,-1556 # 8049c7bc <rq>
8040cdd8:	00072503          	lw	a0,0(a4)
8040cddc:	0147a783          	lw	a5,20(a5)
8040cde0:	000780e7          	jalr	a5
8040cde4:	020b1663          	bnez	s6,8040ce10 <run_timer_list+0x134>
8040cde8:	01c12083          	lw	ra,28(sp)
8040cdec:	01812403          	lw	s0,24(sp)
8040cdf0:	01412483          	lw	s1,20(sp)
8040cdf4:	01012903          	lw	s2,16(sp)
8040cdf8:	00c12983          	lw	s3,12(sp)
8040cdfc:	00812a03          	lw	s4,8(sp)
8040ce00:	00412a83          	lw	s5,4(sp)
8040ce04:	00012b03          	lw	s6,0(sp)
8040ce08:	02010113          	addi	sp,sp,32
8040ce0c:	00008067          	ret
8040ce10:	01812403          	lw	s0,24(sp)
8040ce14:	01c12083          	lw	ra,28(sp)
8040ce18:	01412483          	lw	s1,20(sp)
8040ce1c:	01012903          	lw	s2,16(sp)
8040ce20:	00c12983          	lw	s3,12(sp)
8040ce24:	00812a03          	lw	s4,8(sp)
8040ce28:	00412a83          	lw	s5,4(sp)
8040ce2c:	00012b03          	lw	s6,0(sp)
8040ce30:	02010113          	addi	sp,sp,32
8040ce34:	dddf306f          	j	80400c10 <intr_enable>
8040ce38:	00100793          	li	a5,1
8040ce3c:	00f5a823          	sw	a5,16(a1)
8040ce40:	fa5ff06f          	j	8040cde4 <run_timer_list+0x108>
8040ce44:	dd5f30ef          	jal	ra,80400c18 <intr_disable>
8040ce48:	00100b13          	li	s6,1
8040ce4c:	ec5ff06f          	j	8040cd10 <run_timer_list+0x34>
8040ce50:	00008697          	auipc	a3,0x8
8040ce54:	a6c68693          	addi	a3,a3,-1428 # 804148bc <CSWTCH.69+0x960>
8040ce58:	00006617          	auipc	a2,0x6
8040ce5c:	ce460613          	addi	a2,a2,-796 # 80412b3c <commands+0x1bc>
8040ce60:	09f00593          	li	a1,159
8040ce64:	00008517          	auipc	a0,0x8
8040ce68:	acc50513          	addi	a0,a0,-1332 # 80414930 <CSWTCH.69+0x9d4>
8040ce6c:	fb8f30ef          	jal	ra,80400624 <__panic>
8040ce70:	00008697          	auipc	a3,0x8
8040ce74:	a3868693          	addi	a3,a3,-1480 # 804148a8 <CSWTCH.69+0x94c>
8040ce78:	00006617          	auipc	a2,0x6
8040ce7c:	cc460613          	addi	a2,a2,-828 # 80412b3c <commands+0x1bc>
8040ce80:	09900593          	li	a1,153
8040ce84:	00008517          	auipc	a0,0x8
8040ce88:	aac50513          	addi	a0,a0,-1364 # 80414930 <CSWTCH.69+0x9d4>
8040ce8c:	f98f30ef          	jal	ra,80400624 <__panic>

8040ce90 <sys_getpid>:
8040ce90:	00090797          	auipc	a5,0x90
8040ce94:	91c78793          	addi	a5,a5,-1764 # 8049c7ac <current>
8040ce98:	0007a783          	lw	a5,0(a5)
8040ce9c:	0047a503          	lw	a0,4(a5)
8040cea0:	00008067          	ret

8040cea4 <sys_gettime>:
8040cea4:	00090797          	auipc	a5,0x90
8040cea8:	94878793          	addi	a5,a5,-1720 # 8049c7ec <ticks>
8040ceac:	0007a503          	lw	a0,0(a5)
8040ceb0:	00008067          	ret

8040ceb4 <sys_lab6_set_priority>:
8040ceb4:	00052503          	lw	a0,0(a0)
8040ceb8:	ff010113          	addi	sp,sp,-16
8040cebc:	00112623          	sw	ra,12(sp)
8040cec0:	db5fb0ef          	jal	ra,80408c74 <lab6_set_priority>
8040cec4:	00c12083          	lw	ra,12(sp)
8040cec8:	00000513          	li	a0,0
8040cecc:	01010113          	addi	sp,sp,16
8040ced0:	00008067          	ret

8040ced4 <sys_dup>:
8040ced4:	00452583          	lw	a1,4(a0)
8040ced8:	00052503          	lw	a0,0(a0)
8040cedc:	fb1f906f          	j	80406e8c <sysfile_dup>

8040cee0 <sys_getdirentry>:
8040cee0:	00452583          	lw	a1,4(a0)
8040cee4:	00052503          	lw	a0,0(a0)
8040cee8:	e29f906f          	j	80406d10 <sysfile_getdirentry>

8040ceec <sys_getcwd>:
8040ceec:	00452583          	lw	a1,4(a0)
8040cef0:	00052503          	lw	a0,0(a0)
8040cef4:	d19f906f          	j	80406c0c <sysfile_getcwd>

8040cef8 <sys_fsync>:
8040cef8:	00052503          	lw	a0,0(a0)
8040cefc:	d0df906f          	j	80406c08 <sysfile_fsync>

8040cf00 <sys_fstat>:
8040cf00:	00452583          	lw	a1,4(a0)
8040cf04:	00052503          	lw	a0,0(a0)
8040cf08:	c11f906f          	j	80406b18 <sysfile_fstat>

8040cf0c <sys_seek>:
8040cf0c:	00852603          	lw	a2,8(a0)
8040cf10:	00452583          	lw	a1,4(a0)
8040cf14:	00052503          	lw	a0,0(a0)
8040cf18:	bfdf906f          	j	80406b14 <sysfile_seek>

8040cf1c <sys_write>:
8040cf1c:	00852603          	lw	a2,8(a0)
8040cf20:	00452583          	lw	a1,4(a0)
8040cf24:	00052503          	lw	a0,0(a0)
8040cf28:	a29f906f          	j	80406950 <sysfile_write>

8040cf2c <sys_read>:
8040cf2c:	00852603          	lw	a2,8(a0)
8040cf30:	00452583          	lw	a1,4(a0)
8040cf34:	00052503          	lw	a0,0(a0)
8040cf38:	851f906f          	j	80406788 <sysfile_read>

8040cf3c <sys_close>:
8040cf3c:	00052503          	lw	a0,0(a0)
8040cf40:	845f906f          	j	80406784 <sysfile_close>

8040cf44 <sys_open>:
8040cf44:	00452583          	lw	a1,4(a0)
8040cf48:	00052503          	lw	a0,0(a0)
8040cf4c:	fe0f906f          	j	8040672c <sysfile_open>

8040cf50 <sys_pgdir>:
8040cf50:	ff010113          	addi	sp,sp,-16
8040cf54:	00112623          	sw	ra,12(sp)
8040cf58:	849f60ef          	jal	ra,804037a0 <print_pgdir>
8040cf5c:	00c12083          	lw	ra,12(sp)
8040cf60:	00000513          	li	a0,0
8040cf64:	01010113          	addi	sp,sp,16
8040cf68:	00008067          	ret

8040cf6c <sys_putc>:
8040cf6c:	00052503          	lw	a0,0(a0)
8040cf70:	ff010113          	addi	sp,sp,-16
8040cf74:	00112623          	sw	ra,12(sp)
8040cf78:	ae4f30ef          	jal	ra,8040025c <cputchar>
8040cf7c:	00c12083          	lw	ra,12(sp)
8040cf80:	00000513          	li	a0,0
8040cf84:	01010113          	addi	sp,sp,16
8040cf88:	00008067          	ret

8040cf8c <sys_kill>:
8040cf8c:	00052503          	lw	a0,0(a0)
8040cf90:	a69fb06f          	j	804089f8 <do_kill>

8040cf94 <sys_sleep>:
8040cf94:	00052503          	lw	a0,0(a0)
8040cf98:	d01fb06f          	j	80408c98 <do_sleep>

8040cf9c <sys_yield>:
8040cf9c:	9d1fb06f          	j	8040896c <do_yield>

8040cfa0 <sys_exec>:
8040cfa0:	00852603          	lw	a2,8(a0)
8040cfa4:	00452583          	lw	a1,4(a0)
8040cfa8:	00052503          	lw	a0,0(a0)
8040cfac:	fd1fa06f          	j	80407f7c <do_execve>

8040cfb0 <sys_wait>:
8040cfb0:	00452583          	lw	a1,4(a0)
8040cfb4:	00052503          	lw	a0,0(a0)
8040cfb8:	9d1fb06f          	j	80408988 <do_wait>

8040cfbc <sys_fork>:
8040cfbc:	0008f797          	auipc	a5,0x8f
8040cfc0:	7f078793          	addi	a5,a5,2032 # 8049c7ac <current>
8040cfc4:	0007a783          	lw	a5,0(a5)
8040cfc8:	00000513          	li	a0,0
8040cfcc:	0547a603          	lw	a2,84(a5)
8040cfd0:	00862583          	lw	a1,8(a2)
8040cfd4:	b84fa06f          	j	80407358 <do_fork>

8040cfd8 <sys_exit>:
8040cfd8:	00052503          	lw	a0,0(a0)
8040cfdc:	985fa06f          	j	80407960 <do_exit>

8040cfe0 <syscall>:
8040cfe0:	fd010113          	addi	sp,sp,-48
8040cfe4:	02912223          	sw	s1,36(sp)
8040cfe8:	0008f497          	auipc	s1,0x8f
8040cfec:	7c448493          	addi	s1,s1,1988 # 8049c7ac <current>
8040cff0:	0004a703          	lw	a4,0(s1)
8040cff4:	02812423          	sw	s0,40(sp)
8040cff8:	03212023          	sw	s2,32(sp)
8040cffc:	05472403          	lw	s0,84(a4)
8040d000:	02112623          	sw	ra,44(sp)
8040d004:	0ff00793          	li	a5,255
8040d008:	02842903          	lw	s2,40(s0)
8040d00c:	0727e463          	bltu	a5,s2,8040d074 <syscall+0x94>
8040d010:	00291713          	slli	a4,s2,0x2
8040d014:	00008797          	auipc	a5,0x8
8040d018:	99478793          	addi	a5,a5,-1644 # 804149a8 <syscalls>
8040d01c:	00e787b3          	add	a5,a5,a4
8040d020:	0007a783          	lw	a5,0(a5)
8040d024:	04078863          	beqz	a5,8040d074 <syscall+0x94>
8040d028:	02c42503          	lw	a0,44(s0)
8040d02c:	03042583          	lw	a1,48(s0)
8040d030:	03442603          	lw	a2,52(s0)
8040d034:	03842683          	lw	a3,56(s0)
8040d038:	03c42703          	lw	a4,60(s0)
8040d03c:	00a12623          	sw	a0,12(sp)
8040d040:	00b12823          	sw	a1,16(sp)
8040d044:	00c12a23          	sw	a2,20(sp)
8040d048:	00d12c23          	sw	a3,24(sp)
8040d04c:	00e12e23          	sw	a4,28(sp)
8040d050:	00c10513          	addi	a0,sp,12
8040d054:	000780e7          	jalr	a5
8040d058:	02a42423          	sw	a0,40(s0)
8040d05c:	02c12083          	lw	ra,44(sp)
8040d060:	02812403          	lw	s0,40(sp)
8040d064:	02412483          	lw	s1,36(sp)
8040d068:	02012903          	lw	s2,32(sp)
8040d06c:	03010113          	addi	sp,sp,48
8040d070:	00008067          	ret
8040d074:	00040513          	mv	a0,s0
8040d078:	fd1f30ef          	jal	ra,80401048 <print_trapframe>
8040d07c:	0004a783          	lw	a5,0(s1)
8040d080:	00090693          	mv	a3,s2
8040d084:	00008617          	auipc	a2,0x8
8040d088:	8e060613          	addi	a2,a2,-1824 # 80414964 <CSWTCH.69+0xa08>
8040d08c:	0047a703          	lw	a4,4(a5)
8040d090:	0cd00593          	li	a1,205
8040d094:	06078793          	addi	a5,a5,96
8040d098:	00008517          	auipc	a0,0x8
8040d09c:	8f850513          	addi	a0,a0,-1800 # 80414990 <CSWTCH.69+0xa34>
8040d0a0:	d84f30ef          	jal	ra,80400624 <__panic>

8040d0a4 <swapfs_init>:
8040d0a4:	ff010113          	addi	sp,sp,-16
8040d0a8:	00100513          	li	a0,1
8040d0ac:	00112623          	sw	ra,12(sp)
8040d0b0:	9c5f30ef          	jal	ra,80400a74 <ide_device_valid>
8040d0b4:	02050263          	beqz	a0,8040d0d8 <swapfs_init+0x34>
8040d0b8:	00100513          	li	a0,1
8040d0bc:	9edf30ef          	jal	ra,80400aa8 <ide_device_size>
8040d0c0:	00c12083          	lw	ra,12(sp)
8040d0c4:	00355513          	srli	a0,a0,0x3
8040d0c8:	0008f797          	auipc	a5,0x8f
8040d0cc:	7aa7ac23          	sw	a0,1976(a5) # 8049c880 <max_swap_offset>
8040d0d0:	01010113          	addi	sp,sp,16
8040d0d4:	00008067          	ret
8040d0d8:	00008617          	auipc	a2,0x8
8040d0dc:	cd060613          	addi	a2,a2,-816 # 80414da8 <syscalls+0x400>
8040d0e0:	00d00593          	li	a1,13
8040d0e4:	00008517          	auipc	a0,0x8
8040d0e8:	ce050513          	addi	a0,a0,-800 # 80414dc4 <syscalls+0x41c>
8040d0ec:	d38f30ef          	jal	ra,80400624 <__panic>

8040d0f0 <swapfs_read>:
8040d0f0:	ff010113          	addi	sp,sp,-16
8040d0f4:	00112623          	sw	ra,12(sp)
8040d0f8:	00855793          	srli	a5,a0,0x8
8040d0fc:	06078e63          	beqz	a5,8040d178 <swapfs_read+0x88>
8040d100:	0008f717          	auipc	a4,0x8f
8040d104:	78070713          	addi	a4,a4,1920 # 8049c880 <max_swap_offset>
8040d108:	00072703          	lw	a4,0(a4)
8040d10c:	06e7f663          	bgeu	a5,a4,8040d178 <swapfs_read+0x88>
8040d110:	0008f717          	auipc	a4,0x8f
8040d114:	6f870713          	addi	a4,a4,1784 # 8049c808 <pages>
8040d118:	00072603          	lw	a2,0(a4)
8040d11c:	00009717          	auipc	a4,0x9
8040d120:	f4870713          	addi	a4,a4,-184 # 80416064 <nbase>
8040d124:	40c58633          	sub	a2,a1,a2
8040d128:	00072583          	lw	a1,0(a4)
8040d12c:	40565613          	srai	a2,a2,0x5
8040d130:	0008f717          	auipc	a4,0x8f
8040d134:	66870713          	addi	a4,a4,1640 # 8049c798 <npage>
8040d138:	00b60633          	add	a2,a2,a1
8040d13c:	00072683          	lw	a3,0(a4)
8040d140:	00c61713          	slli	a4,a2,0xc
8040d144:	00c75713          	srli	a4,a4,0xc
8040d148:	00379593          	slli	a1,a5,0x3
8040d14c:	00c61613          	slli	a2,a2,0xc
8040d150:	04d77263          	bgeu	a4,a3,8040d194 <swapfs_read+0xa4>
8040d154:	0008f797          	auipc	a5,0x8f
8040d158:	6ac78793          	addi	a5,a5,1708 # 8049c800 <va_pa_offset>
8040d15c:	0007a783          	lw	a5,0(a5)
8040d160:	00c12083          	lw	ra,12(sp)
8040d164:	00800693          	li	a3,8
8040d168:	00f60633          	add	a2,a2,a5
8040d16c:	00100513          	li	a0,1
8040d170:	01010113          	addi	sp,sp,16
8040d174:	96df306f          	j	80400ae0 <ide_read_secs>
8040d178:	00050693          	mv	a3,a0
8040d17c:	00008617          	auipc	a2,0x8
8040d180:	c6060613          	addi	a2,a2,-928 # 80414ddc <syscalls+0x434>
8040d184:	01400593          	li	a1,20
8040d188:	00008517          	auipc	a0,0x8
8040d18c:	c3c50513          	addi	a0,a0,-964 # 80414dc4 <syscalls+0x41c>
8040d190:	c94f30ef          	jal	ra,80400624 <__panic>
8040d194:	00060693          	mv	a3,a2
8040d198:	06e00593          	li	a1,110
8040d19c:	00006617          	auipc	a2,0x6
8040d1a0:	50c60613          	addi	a2,a2,1292 # 804136a8 <default_pmm_manager+0x30>
8040d1a4:	00006517          	auipc	a0,0x6
8040d1a8:	52850513          	addi	a0,a0,1320 # 804136cc <default_pmm_manager+0x54>
8040d1ac:	c78f30ef          	jal	ra,80400624 <__panic>

8040d1b0 <swapfs_write>:
8040d1b0:	ff010113          	addi	sp,sp,-16
8040d1b4:	00112623          	sw	ra,12(sp)
8040d1b8:	00855793          	srli	a5,a0,0x8
8040d1bc:	06078e63          	beqz	a5,8040d238 <swapfs_write+0x88>
8040d1c0:	0008f717          	auipc	a4,0x8f
8040d1c4:	6c070713          	addi	a4,a4,1728 # 8049c880 <max_swap_offset>
8040d1c8:	00072703          	lw	a4,0(a4)
8040d1cc:	06e7f663          	bgeu	a5,a4,8040d238 <swapfs_write+0x88>
8040d1d0:	0008f717          	auipc	a4,0x8f
8040d1d4:	63870713          	addi	a4,a4,1592 # 8049c808 <pages>
8040d1d8:	00072603          	lw	a2,0(a4)
8040d1dc:	00009717          	auipc	a4,0x9
8040d1e0:	e8870713          	addi	a4,a4,-376 # 80416064 <nbase>
8040d1e4:	40c58633          	sub	a2,a1,a2
8040d1e8:	00072583          	lw	a1,0(a4)
8040d1ec:	40565613          	srai	a2,a2,0x5
8040d1f0:	0008f717          	auipc	a4,0x8f
8040d1f4:	5a870713          	addi	a4,a4,1448 # 8049c798 <npage>
8040d1f8:	00b60633          	add	a2,a2,a1
8040d1fc:	00072683          	lw	a3,0(a4)
8040d200:	00c61713          	slli	a4,a2,0xc
8040d204:	00c75713          	srli	a4,a4,0xc
8040d208:	00379593          	slli	a1,a5,0x3
8040d20c:	00c61613          	slli	a2,a2,0xc
8040d210:	04d77263          	bgeu	a4,a3,8040d254 <swapfs_write+0xa4>
8040d214:	0008f797          	auipc	a5,0x8f
8040d218:	5ec78793          	addi	a5,a5,1516 # 8049c800 <va_pa_offset>
8040d21c:	0007a783          	lw	a5,0(a5)
8040d220:	00c12083          	lw	ra,12(sp)
8040d224:	00800693          	li	a3,8
8040d228:	00f60633          	add	a2,a2,a5
8040d22c:	00100513          	li	a0,1
8040d230:	01010113          	addi	sp,sp,16
8040d234:	945f306f          	j	80400b78 <ide_write_secs>
8040d238:	00050693          	mv	a3,a0
8040d23c:	00008617          	auipc	a2,0x8
8040d240:	ba060613          	addi	a2,a2,-1120 # 80414ddc <syscalls+0x434>
8040d244:	01900593          	li	a1,25
8040d248:	00008517          	auipc	a0,0x8
8040d24c:	b7c50513          	addi	a0,a0,-1156 # 80414dc4 <syscalls+0x41c>
8040d250:	bd4f30ef          	jal	ra,80400624 <__panic>
8040d254:	00060693          	mv	a3,a2
8040d258:	06e00593          	li	a1,110
8040d25c:	00006617          	auipc	a2,0x6
8040d260:	44c60613          	addi	a2,a2,1100 # 804136a8 <default_pmm_manager+0x30>
8040d264:	00006517          	auipc	a0,0x6
8040d268:	46850513          	addi	a0,a0,1128 # 804136cc <default_pmm_manager+0x54>
8040d26c:	bb8f30ef          	jal	ra,80400624 <__panic>

8040d270 <__alloc_inode>:
8040d270:	ff010113          	addi	sp,sp,-16
8040d274:	00812423          	sw	s0,8(sp)
8040d278:	00050413          	mv	s0,a0
8040d27c:	04000513          	li	a0,64
8040d280:	00112623          	sw	ra,12(sp)
8040d284:	f00f50ef          	jal	ra,80402984 <kmalloc>
8040d288:	00050463          	beqz	a0,8040d290 <__alloc_inode+0x20>
8040d28c:	02852623          	sw	s0,44(a0)
8040d290:	00c12083          	lw	ra,12(sp)
8040d294:	00812403          	lw	s0,8(sp)
8040d298:	01010113          	addi	sp,sp,16
8040d29c:	00008067          	ret

8040d2a0 <inode_init>:
8040d2a0:	00100793          	li	a5,1
8040d2a4:	02052a23          	sw	zero,52(a0)
8040d2a8:	02b52e23          	sw	a1,60(a0)
8040d2ac:	02c52c23          	sw	a2,56(a0)
8040d2b0:	02f52823          	sw	a5,48(a0)
8040d2b4:	00008067          	ret

8040d2b8 <inode_kill>:
8040d2b8:	03052703          	lw	a4,48(a0)
8040d2bc:	ff010113          	addi	sp,sp,-16
8040d2c0:	00112623          	sw	ra,12(sp)
8040d2c4:	00071c63          	bnez	a4,8040d2dc <inode_kill+0x24>
8040d2c8:	03452783          	lw	a5,52(a0)
8040d2cc:	02079863          	bnez	a5,8040d2fc <inode_kill+0x44>
8040d2d0:	00c12083          	lw	ra,12(sp)
8040d2d4:	01010113          	addi	sp,sp,16
8040d2d8:	fd0f506f          	j	80402aa8 <kfree>
8040d2dc:	00008697          	auipc	a3,0x8
8040d2e0:	bd868693          	addi	a3,a3,-1064 # 80414eb4 <syscalls+0x50c>
8040d2e4:	00006617          	auipc	a2,0x6
8040d2e8:	85860613          	addi	a2,a2,-1960 # 80412b3c <commands+0x1bc>
8040d2ec:	02900593          	li	a1,41
8040d2f0:	00008517          	auipc	a0,0x8
8040d2f4:	be050513          	addi	a0,a0,-1056 # 80414ed0 <syscalls+0x528>
8040d2f8:	b2cf30ef          	jal	ra,80400624 <__panic>
8040d2fc:	00008697          	auipc	a3,0x8
8040d300:	be868693          	addi	a3,a3,-1048 # 80414ee4 <syscalls+0x53c>
8040d304:	00006617          	auipc	a2,0x6
8040d308:	83860613          	addi	a2,a2,-1992 # 80412b3c <commands+0x1bc>
8040d30c:	02a00593          	li	a1,42
8040d310:	00008517          	auipc	a0,0x8
8040d314:	bc050513          	addi	a0,a0,-1088 # 80414ed0 <syscalls+0x528>
8040d318:	b0cf30ef          	jal	ra,80400624 <__panic>

8040d31c <inode_ref_inc>:
8040d31c:	03052783          	lw	a5,48(a0)
8040d320:	00178793          	addi	a5,a5,1
8040d324:	02f52823          	sw	a5,48(a0)
8040d328:	00078513          	mv	a0,a5
8040d32c:	00008067          	ret

8040d330 <inode_open_inc>:
8040d330:	03452783          	lw	a5,52(a0)
8040d334:	00178793          	addi	a5,a5,1
8040d338:	02f52a23          	sw	a5,52(a0)
8040d33c:	00078513          	mv	a0,a5
8040d340:	00008067          	ret

8040d344 <inode_check>:
8040d344:	ff010113          	addi	sp,sp,-16
8040d348:	00112623          	sw	ra,12(sp)
8040d34c:	04050263          	beqz	a0,8040d390 <inode_check+0x4c>
8040d350:	03c52783          	lw	a5,60(a0)
8040d354:	02078e63          	beqz	a5,8040d390 <inode_check+0x4c>
8040d358:	0007a703          	lw	a4,0(a5)
8040d35c:	8c4ba7b7          	lui	a5,0x8c4ba
8040d360:	47678793          	addi	a5,a5,1142 # 8c4ba476 <end+0xc01dbba>
8040d364:	08f71663          	bne	a4,a5,8040d3f0 <inode_check+0xac>
8040d368:	03052703          	lw	a4,48(a0)
8040d36c:	03452783          	lw	a5,52(a0)
8040d370:	06f74063          	blt	a4,a5,8040d3d0 <inode_check+0x8c>
8040d374:	0407ce63          	bltz	a5,8040d3d0 <inode_check+0x8c>
8040d378:	000106b7          	lui	a3,0x10
8040d37c:	02d75a63          	bge	a4,a3,8040d3b0 <inode_check+0x6c>
8040d380:	02d7d863          	bge	a5,a3,8040d3b0 <inode_check+0x6c>
8040d384:	00c12083          	lw	ra,12(sp)
8040d388:	01010113          	addi	sp,sp,16
8040d38c:	00008067          	ret
8040d390:	00008697          	auipc	a3,0x8
8040d394:	a6c68693          	addi	a3,a3,-1428 # 80414dfc <syscalls+0x454>
8040d398:	00005617          	auipc	a2,0x5
8040d39c:	7a460613          	addi	a2,a2,1956 # 80412b3c <commands+0x1bc>
8040d3a0:	06e00593          	li	a1,110
8040d3a4:	00008517          	auipc	a0,0x8
8040d3a8:	b2c50513          	addi	a0,a0,-1236 # 80414ed0 <syscalls+0x528>
8040d3ac:	a78f30ef          	jal	ra,80400624 <__panic>
8040d3b0:	00008697          	auipc	a3,0x8
8040d3b4:	ac868693          	addi	a3,a3,-1336 # 80414e78 <syscalls+0x4d0>
8040d3b8:	00005617          	auipc	a2,0x5
8040d3bc:	78460613          	addi	a2,a2,1924 # 80412b3c <commands+0x1bc>
8040d3c0:	07200593          	li	a1,114
8040d3c4:	00008517          	auipc	a0,0x8
8040d3c8:	b0c50513          	addi	a0,a0,-1268 # 80414ed0 <syscalls+0x528>
8040d3cc:	a58f30ef          	jal	ra,80400624 <__panic>
8040d3d0:	00008697          	auipc	a3,0x8
8040d3d4:	a7c68693          	addi	a3,a3,-1412 # 80414e4c <syscalls+0x4a4>
8040d3d8:	00005617          	auipc	a2,0x5
8040d3dc:	76460613          	addi	a2,a2,1892 # 80412b3c <commands+0x1bc>
8040d3e0:	07100593          	li	a1,113
8040d3e4:	00008517          	auipc	a0,0x8
8040d3e8:	aec50513          	addi	a0,a0,-1300 # 80414ed0 <syscalls+0x528>
8040d3ec:	a38f30ef          	jal	ra,80400624 <__panic>
8040d3f0:	00008697          	auipc	a3,0x8
8040d3f4:	a3468693          	addi	a3,a3,-1484 # 80414e24 <syscalls+0x47c>
8040d3f8:	00005617          	auipc	a2,0x5
8040d3fc:	74460613          	addi	a2,a2,1860 # 80412b3c <commands+0x1bc>
8040d400:	06f00593          	li	a1,111
8040d404:	00008517          	auipc	a0,0x8
8040d408:	acc50513          	addi	a0,a0,-1332 # 80414ed0 <syscalls+0x528>
8040d40c:	a18f30ef          	jal	ra,80400624 <__panic>

8040d410 <inode_ref_dec>:
8040d410:	ff010113          	addi	sp,sp,-16
8040d414:	00812423          	sw	s0,8(sp)
8040d418:	03052403          	lw	s0,48(a0)
8040d41c:	00112623          	sw	ra,12(sp)
8040d420:	00912223          	sw	s1,4(sp)
8040d424:	01212023          	sw	s2,0(sp)
8040d428:	0a805663          	blez	s0,8040d4d4 <inode_ref_dec+0xc4>
8040d42c:	fff40413          	addi	s0,s0,-1
8040d430:	02852823          	sw	s0,48(a0)
8040d434:	00050493          	mv	s1,a0
8040d438:	02041a63          	bnez	s0,8040d46c <inode_ref_dec+0x5c>
8040d43c:	03c52783          	lw	a5,60(a0)
8040d440:	06078a63          	beqz	a5,8040d4b4 <inode_ref_dec+0xa4>
8040d444:	0247a903          	lw	s2,36(a5)
8040d448:	06090663          	beqz	s2,8040d4b4 <inode_ref_dec+0xa4>
8040d44c:	00008597          	auipc	a1,0x8
8040d450:	bb458593          	addi	a1,a1,-1100 # 80415000 <syscalls+0x658>
8040d454:	ef1ff0ef          	jal	ra,8040d344 <inode_check>
8040d458:	00048513          	mv	a0,s1
8040d45c:	000900e7          	jalr	s2
8040d460:	00050663          	beqz	a0,8040d46c <inode_ref_dec+0x5c>
8040d464:	ff100793          	li	a5,-15
8040d468:	02f51063          	bne	a0,a5,8040d488 <inode_ref_dec+0x78>
8040d46c:	00040513          	mv	a0,s0
8040d470:	00c12083          	lw	ra,12(sp)
8040d474:	00812403          	lw	s0,8(sp)
8040d478:	00412483          	lw	s1,4(sp)
8040d47c:	00012903          	lw	s2,0(sp)
8040d480:	01010113          	addi	sp,sp,16
8040d484:	00008067          	ret
8040d488:	00050593          	mv	a1,a0
8040d48c:	00008517          	auipc	a0,0x8
8040d490:	b7c50513          	addi	a0,a0,-1156 # 80415008 <syscalls+0x660>
8040d494:	d69f20ef          	jal	ra,804001fc <cprintf>
8040d498:	00040513          	mv	a0,s0
8040d49c:	00c12083          	lw	ra,12(sp)
8040d4a0:	00812403          	lw	s0,8(sp)
8040d4a4:	00412483          	lw	s1,4(sp)
8040d4a8:	00012903          	lw	s2,0(sp)
8040d4ac:	01010113          	addi	sp,sp,16
8040d4b0:	00008067          	ret
8040d4b4:	00008697          	auipc	a3,0x8
8040d4b8:	afc68693          	addi	a3,a3,-1284 # 80414fb0 <syscalls+0x608>
8040d4bc:	00005617          	auipc	a2,0x5
8040d4c0:	68060613          	addi	a2,a2,1664 # 80412b3c <commands+0x1bc>
8040d4c4:	04400593          	li	a1,68
8040d4c8:	00008517          	auipc	a0,0x8
8040d4cc:	a0850513          	addi	a0,a0,-1528 # 80414ed0 <syscalls+0x528>
8040d4d0:	954f30ef          	jal	ra,80400624 <__panic>
8040d4d4:	00008697          	auipc	a3,0x8
8040d4d8:	ac068693          	addi	a3,a3,-1344 # 80414f94 <syscalls+0x5ec>
8040d4dc:	00005617          	auipc	a2,0x5
8040d4e0:	66060613          	addi	a2,a2,1632 # 80412b3c <commands+0x1bc>
8040d4e4:	03f00593          	li	a1,63
8040d4e8:	00008517          	auipc	a0,0x8
8040d4ec:	9e850513          	addi	a0,a0,-1560 # 80414ed0 <syscalls+0x528>
8040d4f0:	934f30ef          	jal	ra,80400624 <__panic>

8040d4f4 <inode_open_dec>:
8040d4f4:	ff010113          	addi	sp,sp,-16
8040d4f8:	00812423          	sw	s0,8(sp)
8040d4fc:	03452403          	lw	s0,52(a0)
8040d500:	00112623          	sw	ra,12(sp)
8040d504:	00912223          	sw	s1,4(sp)
8040d508:	01212023          	sw	s2,0(sp)
8040d50c:	0a805263          	blez	s0,8040d5b0 <inode_open_dec+0xbc>
8040d510:	fff40413          	addi	s0,s0,-1
8040d514:	02852a23          	sw	s0,52(a0)
8040d518:	00050493          	mv	s1,a0
8040d51c:	02041663          	bnez	s0,8040d548 <inode_open_dec+0x54>
8040d520:	03c52783          	lw	a5,60(a0)
8040d524:	06078663          	beqz	a5,8040d590 <inode_open_dec+0x9c>
8040d528:	0087a903          	lw	s2,8(a5)
8040d52c:	06090263          	beqz	s2,8040d590 <inode_open_dec+0x9c>
8040d530:	00008597          	auipc	a1,0x8
8040d534:	a3c58593          	addi	a1,a1,-1476 # 80414f6c <syscalls+0x5c4>
8040d538:	e0dff0ef          	jal	ra,8040d344 <inode_check>
8040d53c:	00048513          	mv	a0,s1
8040d540:	000900e7          	jalr	s2
8040d544:	02051063          	bnez	a0,8040d564 <inode_open_dec+0x70>
8040d548:	00040513          	mv	a0,s0
8040d54c:	00c12083          	lw	ra,12(sp)
8040d550:	00812403          	lw	s0,8(sp)
8040d554:	00412483          	lw	s1,4(sp)
8040d558:	00012903          	lw	s2,0(sp)
8040d55c:	01010113          	addi	sp,sp,16
8040d560:	00008067          	ret
8040d564:	00050593          	mv	a1,a0
8040d568:	00008517          	auipc	a0,0x8
8040d56c:	a0c50513          	addi	a0,a0,-1524 # 80414f74 <syscalls+0x5cc>
8040d570:	c8df20ef          	jal	ra,804001fc <cprintf>
8040d574:	00040513          	mv	a0,s0
8040d578:	00c12083          	lw	ra,12(sp)
8040d57c:	00812403          	lw	s0,8(sp)
8040d580:	00412483          	lw	s1,4(sp)
8040d584:	00012903          	lw	s2,0(sp)
8040d588:	01010113          	addi	sp,sp,16
8040d58c:	00008067          	ret
8040d590:	00008697          	auipc	a3,0x8
8040d594:	98c68693          	addi	a3,a3,-1652 # 80414f1c <syscalls+0x574>
8040d598:	00005617          	auipc	a2,0x5
8040d59c:	5a460613          	addi	a2,a2,1444 # 80412b3c <commands+0x1bc>
8040d5a0:	06100593          	li	a1,97
8040d5a4:	00008517          	auipc	a0,0x8
8040d5a8:	92c50513          	addi	a0,a0,-1748 # 80414ed0 <syscalls+0x528>
8040d5ac:	878f30ef          	jal	ra,80400624 <__panic>
8040d5b0:	00008697          	auipc	a3,0x8
8040d5b4:	95068693          	addi	a3,a3,-1712 # 80414f00 <syscalls+0x558>
8040d5b8:	00005617          	auipc	a2,0x5
8040d5bc:	58460613          	addi	a2,a2,1412 # 80412b3c <commands+0x1bc>
8040d5c0:	05c00593          	li	a1,92
8040d5c4:	00008517          	auipc	a0,0x8
8040d5c8:	90c50513          	addi	a0,a0,-1780 # 80414ed0 <syscalls+0x528>
8040d5cc:	858f30ef          	jal	ra,80400624 <__panic>

8040d5d0 <__alloc_fs>:
8040d5d0:	ff010113          	addi	sp,sp,-16
8040d5d4:	00812423          	sw	s0,8(sp)
8040d5d8:	00050413          	mv	s0,a0
8040d5dc:	08000513          	li	a0,128
8040d5e0:	00112623          	sw	ra,12(sp)
8040d5e4:	ba0f50ef          	jal	ra,80402984 <kmalloc>
8040d5e8:	00050463          	beqz	a0,8040d5f0 <__alloc_fs+0x20>
8040d5ec:	06852623          	sw	s0,108(a0)
8040d5f0:	00c12083          	lw	ra,12(sp)
8040d5f4:	00812403          	lw	s0,8(sp)
8040d5f8:	01010113          	addi	sp,sp,16
8040d5fc:	00008067          	ret

8040d600 <vfs_init>:
8040d600:	ff010113          	addi	sp,sp,-16
8040d604:	00100593          	li	a1,1
8040d608:	0008e517          	auipc	a0,0x8e
8040d60c:	15450513          	addi	a0,a0,340 # 8049b75c <bootfs_sem>
8040d610:	00112623          	sw	ra,12(sp)
8040d614:	a9df70ef          	jal	ra,804050b0 <sem_init>
8040d618:	00c12083          	lw	ra,12(sp)
8040d61c:	01010113          	addi	sp,sp,16
8040d620:	3900006f          	j	8040d9b0 <vfs_devlist_init>

8040d624 <vfs_set_bootfs>:
8040d624:	fe010113          	addi	sp,sp,-32
8040d628:	00812c23          	sw	s0,24(sp)
8040d62c:	00112e23          	sw	ra,28(sp)
8040d630:	00912a23          	sw	s1,20(sp)
8040d634:	00012623          	sw	zero,12(sp)
8040d638:	00050413          	mv	s0,a0
8040d63c:	04050a63          	beqz	a0,8040d690 <vfs_set_bootfs+0x6c>
8040d640:	03a00593          	li	a1,58
8040d644:	09c050ef          	jal	ra,804126e0 <strchr>
8040d648:	08050e63          	beqz	a0,8040d6e4 <vfs_set_bootfs+0xc0>
8040d64c:	00154783          	lbu	a5,1(a0)
8040d650:	08079a63          	bnez	a5,8040d6e4 <vfs_set_bootfs+0xc0>
8040d654:	00040513          	mv	a0,s0
8040d658:	509000ef          	jal	ra,8040e360 <vfs_chdir>
8040d65c:	00050413          	mv	s0,a0
8040d660:	00050e63          	beqz	a0,8040d67c <vfs_set_bootfs+0x58>
8040d664:	00040513          	mv	a0,s0
8040d668:	01c12083          	lw	ra,28(sp)
8040d66c:	01812403          	lw	s0,24(sp)
8040d670:	01412483          	lw	s1,20(sp)
8040d674:	02010113          	addi	sp,sp,32
8040d678:	00008067          	ret
8040d67c:	00c10513          	addi	a0,sp,12
8040d680:	375000ef          	jal	ra,8040e1f4 <vfs_get_curdir>
8040d684:	00050413          	mv	s0,a0
8040d688:	fc051ee3          	bnez	a0,8040d664 <vfs_set_bootfs+0x40>
8040d68c:	00c12403          	lw	s0,12(sp)
8040d690:	0008e517          	auipc	a0,0x8e
8040d694:	0cc50513          	addi	a0,a0,204 # 8049b75c <bootfs_sem>
8040d698:	a29f70ef          	jal	ra,804050c0 <down>
8040d69c:	0008f797          	auipc	a5,0x8f
8040d6a0:	13078793          	addi	a5,a5,304 # 8049c7cc <bootfs_node>
8040d6a4:	0007a483          	lw	s1,0(a5)
8040d6a8:	0008e517          	auipc	a0,0x8e
8040d6ac:	0b450513          	addi	a0,a0,180 # 8049b75c <bootfs_sem>
8040d6b0:	0008f797          	auipc	a5,0x8f
8040d6b4:	1087ae23          	sw	s0,284(a5) # 8049c7cc <bootfs_node>
8040d6b8:	00000413          	li	s0,0
8040d6bc:	a01f70ef          	jal	ra,804050bc <up>
8040d6c0:	fa0482e3          	beqz	s1,8040d664 <vfs_set_bootfs+0x40>
8040d6c4:	00048513          	mv	a0,s1
8040d6c8:	d49ff0ef          	jal	ra,8040d410 <inode_ref_dec>
8040d6cc:	00040513          	mv	a0,s0
8040d6d0:	01c12083          	lw	ra,28(sp)
8040d6d4:	01812403          	lw	s0,24(sp)
8040d6d8:	01412483          	lw	s1,20(sp)
8040d6dc:	02010113          	addi	sp,sp,32
8040d6e0:	00008067          	ret
8040d6e4:	ffd00413          	li	s0,-3
8040d6e8:	f7dff06f          	j	8040d664 <vfs_set_bootfs+0x40>

8040d6ec <vfs_get_bootfs>:
8040d6ec:	ff010113          	addi	sp,sp,-16
8040d6f0:	00912223          	sw	s1,4(sp)
8040d6f4:	0008f497          	auipc	s1,0x8f
8040d6f8:	0d848493          	addi	s1,s1,216 # 8049c7cc <bootfs_node>
8040d6fc:	0004a783          	lw	a5,0(s1)
8040d700:	00112623          	sw	ra,12(sp)
8040d704:	00812423          	sw	s0,8(sp)
8040d708:	04078c63          	beqz	a5,8040d760 <vfs_get_bootfs+0x74>
8040d70c:	00050413          	mv	s0,a0
8040d710:	0008e517          	auipc	a0,0x8e
8040d714:	04c50513          	addi	a0,a0,76 # 8049b75c <bootfs_sem>
8040d718:	9a9f70ef          	jal	ra,804050c0 <down>
8040d71c:	0004a483          	lw	s1,0(s1)
8040d720:	02048a63          	beqz	s1,8040d754 <vfs_get_bootfs+0x68>
8040d724:	00048513          	mv	a0,s1
8040d728:	bf5ff0ef          	jal	ra,8040d31c <inode_ref_inc>
8040d72c:	0008e517          	auipc	a0,0x8e
8040d730:	03050513          	addi	a0,a0,48 # 8049b75c <bootfs_sem>
8040d734:	989f70ef          	jal	ra,804050bc <up>
8040d738:	00000513          	li	a0,0
8040d73c:	00942023          	sw	s1,0(s0)
8040d740:	00c12083          	lw	ra,12(sp)
8040d744:	00812403          	lw	s0,8(sp)
8040d748:	00412483          	lw	s1,4(sp)
8040d74c:	01010113          	addi	sp,sp,16
8040d750:	00008067          	ret
8040d754:	0008e517          	auipc	a0,0x8e
8040d758:	00850513          	addi	a0,a0,8 # 8049b75c <bootfs_sem>
8040d75c:	961f70ef          	jal	ra,804050bc <up>
8040d760:	ff000513          	li	a0,-16
8040d764:	fddff06f          	j	8040d740 <vfs_get_bootfs+0x54>

8040d768 <vfs_do_add>:
8040d768:	fe010113          	addi	sp,sp,-32
8040d76c:	00112e23          	sw	ra,28(sp)
8040d770:	00812c23          	sw	s0,24(sp)
8040d774:	00912a23          	sw	s1,20(sp)
8040d778:	01212823          	sw	s2,16(sp)
8040d77c:	01312623          	sw	s3,12(sp)
8040d780:	01412423          	sw	s4,8(sp)
8040d784:	01512223          	sw	s5,4(sp)
8040d788:	01612023          	sw	s6,0(sp)
8040d78c:	14050863          	beqz	a0,8040d8dc <vfs_do_add+0x174>
8040d790:	00050413          	mv	s0,a0
8040d794:	00058a13          	mv	s4,a1
8040d798:	00060b13          	mv	s6,a2
8040d79c:	00068a93          	mv	s5,a3
8040d7a0:	0e058663          	beqz	a1,8040d88c <vfs_do_add+0x124>
8040d7a4:	02c5a703          	lw	a4,44(a1)
8040d7a8:	000017b7          	lui	a5,0x1
8040d7ac:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d7b0:	0ef71063          	bne	a4,a5,8040d890 <vfs_do_add+0x128>
8040d7b4:	00040513          	mv	a0,s0
8040d7b8:	671040ef          	jal	ra,80412628 <strlen>
8040d7bc:	01f00793          	li	a5,31
8040d7c0:	10a7e663          	bltu	a5,a0,8040d8cc <vfs_do_add+0x164>
8040d7c4:	00040513          	mv	a0,s0
8040d7c8:	ab5f20ef          	jal	ra,8040027c <strdup>
8040d7cc:	00050493          	mv	s1,a0
8040d7d0:	10050263          	beqz	a0,8040d8d4 <vfs_do_add+0x16c>
8040d7d4:	01800513          	li	a0,24
8040d7d8:	9acf50ef          	jal	ra,80402984 <kmalloc>
8040d7dc:	00050993          	mv	s3,a0
8040d7e0:	08050e63          	beqz	a0,8040d87c <vfs_do_add+0x114>
8040d7e4:	0008e517          	auipc	a0,0x8e
8040d7e8:	f8450513          	addi	a0,a0,-124 # 8049b768 <vdev_list_sem>
8040d7ec:	0008f917          	auipc	s2,0x8f
8040d7f0:	fe490913          	addi	s2,s2,-28 # 8049c7d0 <vdev_list>
8040d7f4:	8cdf70ef          	jal	ra,804050c0 <down>
8040d7f8:	00090413          	mv	s0,s2
8040d7fc:	0140006f          	j	8040d810 <vfs_do_add+0xa8>
8040d800:	ff042503          	lw	a0,-16(s0)
8040d804:	00048593          	mv	a1,s1
8040d808:	6a9040ef          	jal	ra,804126b0 <strcmp>
8040d80c:	0a050263          	beqz	a0,8040d8b0 <vfs_do_add+0x148>
8040d810:	00442403          	lw	s0,4(s0)
8040d814:	ff2416e3          	bne	s0,s2,8040d800 <vfs_do_add+0x98>
8040d818:	00442703          	lw	a4,4(s0)
8040d81c:	01098793          	addi	a5,s3,16
8040d820:	0099a023          	sw	s1,0(s3)
8040d824:	0149a223          	sw	s4,4(s3)
8040d828:	0159a623          	sw	s5,12(s3)
8040d82c:	0169a423          	sw	s6,8(s3)
8040d830:	00f72023          	sw	a5,0(a4)
8040d834:	0089a823          	sw	s0,16(s3)
8040d838:	00e9aa23          	sw	a4,20(s3)
8040d83c:	0008e517          	auipc	a0,0x8e
8040d840:	f2c50513          	addi	a0,a0,-212 # 8049b768 <vdev_list_sem>
8040d844:	00f42223          	sw	a5,4(s0)
8040d848:	00000413          	li	s0,0
8040d84c:	871f70ef          	jal	ra,804050bc <up>
8040d850:	00040513          	mv	a0,s0
8040d854:	01c12083          	lw	ra,28(sp)
8040d858:	01812403          	lw	s0,24(sp)
8040d85c:	01412483          	lw	s1,20(sp)
8040d860:	01012903          	lw	s2,16(sp)
8040d864:	00c12983          	lw	s3,12(sp)
8040d868:	00812a03          	lw	s4,8(sp)
8040d86c:	00412a83          	lw	s5,4(sp)
8040d870:	00012b03          	lw	s6,0(sp)
8040d874:	02010113          	addi	sp,sp,32
8040d878:	00008067          	ret
8040d87c:	ffc00413          	li	s0,-4
8040d880:	00048513          	mv	a0,s1
8040d884:	a24f50ef          	jal	ra,80402aa8 <kfree>
8040d888:	fc9ff06f          	j	8040d850 <vfs_do_add+0xe8>
8040d88c:	f20684e3          	beqz	a3,8040d7b4 <vfs_do_add+0x4c>
8040d890:	00007697          	auipc	a3,0x7
8040d894:	7c068693          	addi	a3,a3,1984 # 80415050 <syscalls+0x6a8>
8040d898:	00005617          	auipc	a2,0x5
8040d89c:	2a460613          	addi	a2,a2,676 # 80412b3c <commands+0x1bc>
8040d8a0:	08f00593          	li	a1,143
8040d8a4:	00007517          	auipc	a0,0x7
8040d8a8:	79450513          	addi	a0,a0,1940 # 80415038 <syscalls+0x690>
8040d8ac:	d79f20ef          	jal	ra,80400624 <__panic>
8040d8b0:	0008e517          	auipc	a0,0x8e
8040d8b4:	eb850513          	addi	a0,a0,-328 # 8049b768 <vdev_list_sem>
8040d8b8:	805f70ef          	jal	ra,804050bc <up>
8040d8bc:	00098513          	mv	a0,s3
8040d8c0:	9e8f50ef          	jal	ra,80402aa8 <kfree>
8040d8c4:	fe900413          	li	s0,-23
8040d8c8:	fb9ff06f          	j	8040d880 <vfs_do_add+0x118>
8040d8cc:	ff400413          	li	s0,-12
8040d8d0:	f81ff06f          	j	8040d850 <vfs_do_add+0xe8>
8040d8d4:	ffc00413          	li	s0,-4
8040d8d8:	f79ff06f          	j	8040d850 <vfs_do_add+0xe8>
8040d8dc:	00007697          	auipc	a3,0x7
8040d8e0:	74c68693          	addi	a3,a3,1868 # 80415028 <syscalls+0x680>
8040d8e4:	00005617          	auipc	a2,0x5
8040d8e8:	25860613          	addi	a2,a2,600 # 80412b3c <commands+0x1bc>
8040d8ec:	08e00593          	li	a1,142
8040d8f0:	00007517          	auipc	a0,0x7
8040d8f4:	74850513          	addi	a0,a0,1864 # 80415038 <syscalls+0x690>
8040d8f8:	d2df20ef          	jal	ra,80400624 <__panic>

8040d8fc <find_mount>:
8040d8fc:	fe010113          	addi	sp,sp,-32
8040d900:	00812c23          	sw	s0,24(sp)
8040d904:	00912a23          	sw	s1,20(sp)
8040d908:	01212823          	sw	s2,16(sp)
8040d90c:	01312623          	sw	s3,12(sp)
8040d910:	0008f497          	auipc	s1,0x8f
8040d914:	ec048493          	addi	s1,s1,-320 # 8049c7d0 <vdev_list>
8040d918:	00112e23          	sw	ra,28(sp)
8040d91c:	00050913          	mv	s2,a0
8040d920:	00058993          	mv	s3,a1
8040d924:	00048413          	mv	s0,s1
8040d928:	06050463          	beqz	a0,8040d990 <find_mount+0x94>
8040d92c:	00442403          	lw	s0,4(s0)
8040d930:	04940063          	beq	s0,s1,8040d970 <find_mount+0x74>
8040d934:	ffc42783          	lw	a5,-4(s0)
8040d938:	fe078ae3          	beqz	a5,8040d92c <find_mount+0x30>
8040d93c:	ff042503          	lw	a0,-16(s0)
8040d940:	00090593          	mv	a1,s2
8040d944:	56d040ef          	jal	ra,804126b0 <strcmp>
8040d948:	fe0512e3          	bnez	a0,8040d92c <find_mount+0x30>
8040d94c:	ff040413          	addi	s0,s0,-16
8040d950:	0089a023          	sw	s0,0(s3)
8040d954:	01c12083          	lw	ra,28(sp)
8040d958:	01812403          	lw	s0,24(sp)
8040d95c:	01412483          	lw	s1,20(sp)
8040d960:	01012903          	lw	s2,16(sp)
8040d964:	00c12983          	lw	s3,12(sp)
8040d968:	02010113          	addi	sp,sp,32
8040d96c:	00008067          	ret
8040d970:	01c12083          	lw	ra,28(sp)
8040d974:	01812403          	lw	s0,24(sp)
8040d978:	01412483          	lw	s1,20(sp)
8040d97c:	01012903          	lw	s2,16(sp)
8040d980:	00c12983          	lw	s3,12(sp)
8040d984:	ff300513          	li	a0,-13
8040d988:	02010113          	addi	sp,sp,32
8040d98c:	00008067          	ret
8040d990:	00007697          	auipc	a3,0x7
8040d994:	69868693          	addi	a3,a3,1688 # 80415028 <syscalls+0x680>
8040d998:	00005617          	auipc	a2,0x5
8040d99c:	1a460613          	addi	a2,a2,420 # 80412b3c <commands+0x1bc>
8040d9a0:	0cd00593          	li	a1,205
8040d9a4:	00007517          	auipc	a0,0x7
8040d9a8:	69450513          	addi	a0,a0,1684 # 80415038 <syscalls+0x690>
8040d9ac:	c79f20ef          	jal	ra,80400624 <__panic>

8040d9b0 <vfs_devlist_init>:
8040d9b0:	0008f797          	auipc	a5,0x8f
8040d9b4:	e2078793          	addi	a5,a5,-480 # 8049c7d0 <vdev_list>
8040d9b8:	00100593          	li	a1,1
8040d9bc:	0008e517          	auipc	a0,0x8e
8040d9c0:	dac50513          	addi	a0,a0,-596 # 8049b768 <vdev_list_sem>
8040d9c4:	00f7a223          	sw	a5,4(a5)
8040d9c8:	00f7a023          	sw	a5,0(a5)
8040d9cc:	ee4f706f          	j	804050b0 <sem_init>

8040d9d0 <vfs_cleanup>:
8040d9d0:	ff010113          	addi	sp,sp,-16
8040d9d4:	00912223          	sw	s1,4(sp)
8040d9d8:	0008f497          	auipc	s1,0x8f
8040d9dc:	df848493          	addi	s1,s1,-520 # 8049c7d0 <vdev_list>
8040d9e0:	0044a783          	lw	a5,4(s1)
8040d9e4:	00112623          	sw	ra,12(sp)
8040d9e8:	00812423          	sw	s0,8(sp)
8040d9ec:	04978a63          	beq	a5,s1,8040da40 <vfs_cleanup+0x70>
8040d9f0:	0008e517          	auipc	a0,0x8e
8040d9f4:	d7850513          	addi	a0,a0,-648 # 8049b768 <vdev_list_sem>
8040d9f8:	ec8f70ef          	jal	ra,804050c0 <down>
8040d9fc:	00048413          	mv	s0,s1
8040da00:	00442403          	lw	s0,4(s0)
8040da04:	02940063          	beq	s0,s1,8040da24 <vfs_cleanup+0x54>
8040da08:	ff842783          	lw	a5,-8(s0)
8040da0c:	00078513          	mv	a0,a5
8040da10:	fe0788e3          	beqz	a5,8040da00 <vfs_cleanup+0x30>
8040da14:	07c7a783          	lw	a5,124(a5)
8040da18:	000780e7          	jalr	a5
8040da1c:	00442403          	lw	s0,4(s0)
8040da20:	fe9414e3          	bne	s0,s1,8040da08 <vfs_cleanup+0x38>
8040da24:	00812403          	lw	s0,8(sp)
8040da28:	00c12083          	lw	ra,12(sp)
8040da2c:	00412483          	lw	s1,4(sp)
8040da30:	0008e517          	auipc	a0,0x8e
8040da34:	d3850513          	addi	a0,a0,-712 # 8049b768 <vdev_list_sem>
8040da38:	01010113          	addi	sp,sp,16
8040da3c:	e80f706f          	j	804050bc <up>
8040da40:	00c12083          	lw	ra,12(sp)
8040da44:	00812403          	lw	s0,8(sp)
8040da48:	00412483          	lw	s1,4(sp)
8040da4c:	01010113          	addi	sp,sp,16
8040da50:	00008067          	ret

8040da54 <vfs_get_root>:
8040da54:	fe010113          	addi	sp,sp,-32
8040da58:	00112e23          	sw	ra,28(sp)
8040da5c:	00812c23          	sw	s0,24(sp)
8040da60:	00912a23          	sw	s1,20(sp)
8040da64:	01212823          	sw	s2,16(sp)
8040da68:	01312623          	sw	s3,12(sp)
8040da6c:	01412423          	sw	s4,8(sp)
8040da70:	0c050263          	beqz	a0,8040db34 <vfs_get_root+0xe0>
8040da74:	0008f917          	auipc	s2,0x8f
8040da78:	d5c90913          	addi	s2,s2,-676 # 8049c7d0 <vdev_list>
8040da7c:	00492783          	lw	a5,4(s2)
8040da80:	0b278663          	beq	a5,s2,8040db2c <vfs_get_root+0xd8>
8040da84:	00050993          	mv	s3,a0
8040da88:	0008e517          	auipc	a0,0x8e
8040da8c:	ce050513          	addi	a0,a0,-800 # 8049b768 <vdev_list_sem>
8040da90:	00058a13          	mv	s4,a1
8040da94:	00090413          	mv	s0,s2
8040da98:	e28f70ef          	jal	ra,804050c0 <down>
8040da9c:	0180006f          	j	8040dab4 <vfs_get_root+0x60>
8040daa0:	ff042583          	lw	a1,-16(s0)
8040daa4:	00098513          	mv	a0,s3
8040daa8:	409040ef          	jal	ra,804126b0 <strcmp>
8040daac:	00050493          	mv	s1,a0
8040dab0:	04050063          	beqz	a0,8040daf0 <vfs_get_root+0x9c>
8040dab4:	00442403          	lw	s0,4(s0)
8040dab8:	ff2414e3          	bne	s0,s2,8040daa0 <vfs_get_root+0x4c>
8040dabc:	ff300493          	li	s1,-13
8040dac0:	0008e517          	auipc	a0,0x8e
8040dac4:	ca850513          	addi	a0,a0,-856 # 8049b768 <vdev_list_sem>
8040dac8:	df4f70ef          	jal	ra,804050bc <up>
8040dacc:	01c12083          	lw	ra,28(sp)
8040dad0:	01812403          	lw	s0,24(sp)
8040dad4:	00048513          	mv	a0,s1
8040dad8:	01012903          	lw	s2,16(sp)
8040dadc:	01412483          	lw	s1,20(sp)
8040dae0:	00c12983          	lw	s3,12(sp)
8040dae4:	00812a03          	lw	s4,8(sp)
8040dae8:	02010113          	addi	sp,sp,32
8040daec:	00008067          	ret
8040daf0:	ff842503          	lw	a0,-8(s0)
8040daf4:	00050c63          	beqz	a0,8040db0c <vfs_get_root+0xb8>
8040daf8:	07452783          	lw	a5,116(a0)
8040dafc:	000780e7          	jalr	a5
8040db00:	00050a63          	beqz	a0,8040db14 <vfs_get_root+0xc0>
8040db04:	00aa2023          	sw	a0,0(s4)
8040db08:	fb9ff06f          	j	8040dac0 <vfs_get_root+0x6c>
8040db0c:	ffc42783          	lw	a5,-4(s0)
8040db10:	00078663          	beqz	a5,8040db1c <vfs_get_root+0xc8>
8040db14:	ff200493          	li	s1,-14
8040db18:	fa9ff06f          	j	8040dac0 <vfs_get_root+0x6c>
8040db1c:	ff442503          	lw	a0,-12(s0)
8040db20:	ffcff0ef          	jal	ra,8040d31c <inode_ref_inc>
8040db24:	ff442503          	lw	a0,-12(s0)
8040db28:	fd9ff06f          	j	8040db00 <vfs_get_root+0xac>
8040db2c:	ff300493          	li	s1,-13
8040db30:	f9dff06f          	j	8040dacc <vfs_get_root+0x78>
8040db34:	00007697          	auipc	a3,0x7
8040db38:	4f468693          	addi	a3,a3,1268 # 80415028 <syscalls+0x680>
8040db3c:	00005617          	auipc	a2,0x5
8040db40:	00060613          	mv	a2,a2
8040db44:	04500593          	li	a1,69
8040db48:	00007517          	auipc	a0,0x7
8040db4c:	4f050513          	addi	a0,a0,1264 # 80415038 <syscalls+0x690>
8040db50:	ad5f20ef          	jal	ra,80400624 <__panic>

8040db54 <vfs_get_devname>:
8040db54:	0008f697          	auipc	a3,0x8f
8040db58:	c7c68693          	addi	a3,a3,-900 # 8049c7d0 <vdev_list>
8040db5c:	00068793          	mv	a5,a3
8040db60:	00051863          	bnez	a0,8040db70 <vfs_get_devname+0x1c>
8040db64:	0240006f          	j	8040db88 <vfs_get_devname+0x34>
8040db68:	ff87a703          	lw	a4,-8(a5)
8040db6c:	00a70a63          	beq	a4,a0,8040db80 <vfs_get_devname+0x2c>
8040db70:	0047a783          	lw	a5,4(a5)
8040db74:	fed79ae3          	bne	a5,a3,8040db68 <vfs_get_devname+0x14>
8040db78:	00000513          	li	a0,0
8040db7c:	00008067          	ret
8040db80:	ff07a503          	lw	a0,-16(a5)
8040db84:	00008067          	ret
8040db88:	ff010113          	addi	sp,sp,-16
8040db8c:	00007697          	auipc	a3,0x7
8040db90:	52068693          	addi	a3,a3,1312 # 804150ac <syscalls+0x704>
8040db94:	00005617          	auipc	a2,0x5
8040db98:	fa860613          	addi	a2,a2,-88 # 80412b3c <commands+0x1bc>
8040db9c:	06a00593          	li	a1,106
8040dba0:	00007517          	auipc	a0,0x7
8040dba4:	49850513          	addi	a0,a0,1176 # 80415038 <syscalls+0x690>
8040dba8:	00112623          	sw	ra,12(sp)
8040dbac:	a79f20ef          	jal	ra,80400624 <__panic>

8040dbb0 <vfs_add_dev>:
8040dbb0:	00060693          	mv	a3,a2
8040dbb4:	00000613          	li	a2,0
8040dbb8:	bb1ff06f          	j	8040d768 <vfs_do_add>

8040dbbc <vfs_mount>:
8040dbbc:	fe010113          	addi	sp,sp,-32
8040dbc0:	00812c23          	sw	s0,24(sp)
8040dbc4:	00050413          	mv	s0,a0
8040dbc8:	0008e517          	auipc	a0,0x8e
8040dbcc:	ba050513          	addi	a0,a0,-1120 # 8049b768 <vdev_list_sem>
8040dbd0:	00112e23          	sw	ra,28(sp)
8040dbd4:	00912a23          	sw	s1,20(sp)
8040dbd8:	00058493          	mv	s1,a1
8040dbdc:	ce4f70ef          	jal	ra,804050c0 <down>
8040dbe0:	00040513          	mv	a0,s0
8040dbe4:	00c10593          	addi	a1,sp,12
8040dbe8:	d15ff0ef          	jal	ra,8040d8fc <find_mount>
8040dbec:	00050413          	mv	s0,a0
8040dbf0:	06051263          	bnez	a0,8040dc54 <vfs_mount+0x98>
8040dbf4:	00c12583          	lw	a1,12(sp)
8040dbf8:	0085a783          	lw	a5,8(a1)
8040dbfc:	06079e63          	bnez	a5,8040dc78 <vfs_mount+0xbc>
8040dc00:	0005a783          	lw	a5,0(a1)
8040dc04:	08078e63          	beqz	a5,8040dca0 <vfs_mount+0xe4>
8040dc08:	00c5a783          	lw	a5,12(a1)
8040dc0c:	08078a63          	beqz	a5,8040dca0 <vfs_mount+0xe4>
8040dc10:	0045a503          	lw	a0,4(a1)
8040dc14:	06050663          	beqz	a0,8040dc80 <vfs_mount+0xc4>
8040dc18:	02c52703          	lw	a4,44(a0)
8040dc1c:	000017b7          	lui	a5,0x1
8040dc20:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040dc24:	04f71e63          	bne	a4,a5,8040dc80 <vfs_mount+0xc4>
8040dc28:	00858593          	addi	a1,a1,8
8040dc2c:	000480e7          	jalr	s1
8040dc30:	00050413          	mv	s0,a0
8040dc34:	02051063          	bnez	a0,8040dc54 <vfs_mount+0x98>
8040dc38:	00c12783          	lw	a5,12(sp)
8040dc3c:	0087a703          	lw	a4,8(a5)
8040dc40:	08070063          	beqz	a4,8040dcc0 <vfs_mount+0x104>
8040dc44:	0007a583          	lw	a1,0(a5)
8040dc48:	00007517          	auipc	a0,0x7
8040dc4c:	4e450513          	addi	a0,a0,1252 # 8041512c <syscalls+0x784>
8040dc50:	dacf20ef          	jal	ra,804001fc <cprintf>
8040dc54:	0008e517          	auipc	a0,0x8e
8040dc58:	b1450513          	addi	a0,a0,-1260 # 8049b768 <vdev_list_sem>
8040dc5c:	c60f70ef          	jal	ra,804050bc <up>
8040dc60:	00040513          	mv	a0,s0
8040dc64:	01c12083          	lw	ra,28(sp)
8040dc68:	01812403          	lw	s0,24(sp)
8040dc6c:	01412483          	lw	s1,20(sp)
8040dc70:	02010113          	addi	sp,sp,32
8040dc74:	00008067          	ret
8040dc78:	ff100413          	li	s0,-15
8040dc7c:	fd9ff06f          	j	8040dc54 <vfs_mount+0x98>
8040dc80:	00007697          	auipc	a3,0x7
8040dc84:	46468693          	addi	a3,a3,1124 # 804150e4 <syscalls+0x73c>
8040dc88:	00005617          	auipc	a2,0x5
8040dc8c:	eb460613          	addi	a2,a2,-332 # 80412b3c <commands+0x1bc>
8040dc90:	0ed00593          	li	a1,237
8040dc94:	00007517          	auipc	a0,0x7
8040dc98:	3a450513          	addi	a0,a0,932 # 80415038 <syscalls+0x690>
8040dc9c:	989f20ef          	jal	ra,80400624 <__panic>
8040dca0:	00007697          	auipc	a3,0x7
8040dca4:	41868693          	addi	a3,a3,1048 # 804150b8 <syscalls+0x710>
8040dca8:	00005617          	auipc	a2,0x5
8040dcac:	e9460613          	addi	a2,a2,-364 # 80412b3c <commands+0x1bc>
8040dcb0:	0eb00593          	li	a1,235
8040dcb4:	00007517          	auipc	a0,0x7
8040dcb8:	38450513          	addi	a0,a0,900 # 80415038 <syscalls+0x690>
8040dcbc:	969f20ef          	jal	ra,80400624 <__panic>
8040dcc0:	00007697          	auipc	a3,0x7
8040dcc4:	45868693          	addi	a3,a3,1112 # 80415118 <syscalls+0x770>
8040dcc8:	00005617          	auipc	a2,0x5
8040dccc:	e7460613          	addi	a2,a2,-396 # 80412b3c <commands+0x1bc>
8040dcd0:	0ef00593          	li	a1,239
8040dcd4:	00007517          	auipc	a0,0x7
8040dcd8:	36450513          	addi	a0,a0,868 # 80415038 <syscalls+0x690>
8040dcdc:	949f20ef          	jal	ra,80400624 <__panic>

8040dce0 <vfs_open>:
8040dce0:	fd010113          	addi	sp,sp,-48
8040dce4:	02112623          	sw	ra,44(sp)
8040dce8:	02812423          	sw	s0,40(sp)
8040dcec:	02912223          	sw	s1,36(sp)
8040dcf0:	03212023          	sw	s2,32(sp)
8040dcf4:	01312e23          	sw	s3,28(sp)
8040dcf8:	01412c23          	sw	s4,24(sp)
8040dcfc:	01512a23          	sw	s5,20(sp)
8040dd00:	0035f793          	andi	a5,a1,3
8040dd04:	16078e63          	beqz	a5,8040de80 <vfs_open+0x1a0>
8040dd08:	00200713          	li	a4,2
8040dd0c:	0cf76c63          	bltu	a4,a5,8040dde4 <vfs_open+0x104>
8040dd10:	0105fa93          	andi	s5,a1,16
8040dd14:	00058493          	mv	s1,a1
8040dd18:	00410593          	addi	a1,sp,4
8040dd1c:	00060993          	mv	s3,a2
8040dd20:	00050913          	mv	s2,a0
8040dd24:	39c000ef          	jal	ra,8040e0c0 <vfs_lookup>
8040dd28:	00050413          	mv	s0,a0
8040dd2c:	0044fa13          	andi	s4,s1,4
8040dd30:	0e051063          	bnez	a0,8040de10 <vfs_open+0x130>
8040dd34:	00c4f793          	andi	a5,s1,12
8040dd38:	00c00713          	li	a4,12
8040dd3c:	16e78663          	beq	a5,a4,8040dea8 <vfs_open+0x1c8>
8040dd40:	00412403          	lw	s0,4(sp)
8040dd44:	1a040663          	beqz	s0,8040def0 <vfs_open+0x210>
8040dd48:	03c42783          	lw	a5,60(s0)
8040dd4c:	16078263          	beqz	a5,8040deb0 <vfs_open+0x1d0>
8040dd50:	0047a783          	lw	a5,4(a5)
8040dd54:	14078e63          	beqz	a5,8040deb0 <vfs_open+0x1d0>
8040dd58:	00040513          	mv	a0,s0
8040dd5c:	00007597          	auipc	a1,0x7
8040dd60:	4b058593          	addi	a1,a1,1200 # 8041520c <syscalls+0x864>
8040dd64:	de0ff0ef          	jal	ra,8040d344 <inode_check>
8040dd68:	03c42783          	lw	a5,60(s0)
8040dd6c:	00412503          	lw	a0,4(sp)
8040dd70:	00048593          	mv	a1,s1
8040dd74:	0047a783          	lw	a5,4(a5)
8040dd78:	000780e7          	jalr	a5
8040dd7c:	00050413          	mv	s0,a0
8040dd80:	00412503          	lw	a0,4(sp)
8040dd84:	10041e63          	bnez	s0,8040dea0 <vfs_open+0x1c0>
8040dd88:	015a6a33          	or	s4,s4,s5
8040dd8c:	da4ff0ef          	jal	ra,8040d330 <inode_open_inc>
8040dd90:	040a0463          	beqz	s4,8040ddd8 <vfs_open+0xf8>
8040dd94:	00412483          	lw	s1,4(sp)
8040dd98:	12048c63          	beqz	s1,8040ded0 <vfs_open+0x1f0>
8040dd9c:	03c4a783          	lw	a5,60(s1)
8040dda0:	12078863          	beqz	a5,8040ded0 <vfs_open+0x1f0>
8040dda4:	0307a783          	lw	a5,48(a5)
8040dda8:	12078463          	beqz	a5,8040ded0 <vfs_open+0x1f0>
8040ddac:	00007597          	auipc	a1,0x7
8040ddb0:	4bc58593          	addi	a1,a1,1212 # 80415268 <syscalls+0x8c0>
8040ddb4:	00048513          	mv	a0,s1
8040ddb8:	d8cff0ef          	jal	ra,8040d344 <inode_check>
8040ddbc:	03c4a783          	lw	a5,60(s1)
8040ddc0:	00412503          	lw	a0,4(sp)
8040ddc4:	00000593          	li	a1,0
8040ddc8:	0307a783          	lw	a5,48(a5)
8040ddcc:	000780e7          	jalr	a5
8040ddd0:	00050793          	mv	a5,a0
8040ddd4:	0a051e63          	bnez	a0,8040de90 <vfs_open+0x1b0>
8040ddd8:	00412783          	lw	a5,4(sp)
8040dddc:	00f9a023          	sw	a5,0(s3)
8040dde0:	0080006f          	j	8040dde8 <vfs_open+0x108>
8040dde4:	ffd00413          	li	s0,-3
8040dde8:	00040513          	mv	a0,s0
8040ddec:	02c12083          	lw	ra,44(sp)
8040ddf0:	02812403          	lw	s0,40(sp)
8040ddf4:	02412483          	lw	s1,36(sp)
8040ddf8:	02012903          	lw	s2,32(sp)
8040ddfc:	01c12983          	lw	s3,28(sp)
8040de00:	01812a03          	lw	s4,24(sp)
8040de04:	01412a83          	lw	s5,20(sp)
8040de08:	03010113          	addi	sp,sp,48
8040de0c:	00008067          	ret
8040de10:	ff000793          	li	a5,-16
8040de14:	fcf51ae3          	bne	a0,a5,8040dde8 <vfs_open+0x108>
8040de18:	fc0a08e3          	beqz	s4,8040dde8 <vfs_open+0x108>
8040de1c:	00810613          	addi	a2,sp,8
8040de20:	00c10593          	addi	a1,sp,12
8040de24:	00090513          	mv	a0,s2
8040de28:	37c000ef          	jal	ra,8040e1a4 <vfs_lookup_parent>
8040de2c:	00050413          	mv	s0,a0
8040de30:	fa051ce3          	bnez	a0,8040dde8 <vfs_open+0x108>
8040de34:	00c12403          	lw	s0,12(sp)
8040de38:	0c040c63          	beqz	s0,8040df10 <vfs_open+0x230>
8040de3c:	03c42783          	lw	a5,60(s0)
8040de40:	0c078863          	beqz	a5,8040df10 <vfs_open+0x230>
8040de44:	0347a783          	lw	a5,52(a5)
8040de48:	0c078463          	beqz	a5,8040df10 <vfs_open+0x230>
8040de4c:	00040513          	mv	a0,s0
8040de50:	00007597          	auipc	a1,0x7
8040de54:	35458593          	addi	a1,a1,852 # 804151a4 <syscalls+0x7fc>
8040de58:	cecff0ef          	jal	ra,8040d344 <inode_check>
8040de5c:	03c42783          	lw	a5,60(s0)
8040de60:	00812583          	lw	a1,8(sp)
8040de64:	00c12503          	lw	a0,12(sp)
8040de68:	0347a783          	lw	a5,52(a5)
8040de6c:	0034d613          	srli	a2,s1,0x3
8040de70:	00410693          	addi	a3,sp,4
8040de74:	00167613          	andi	a2,a2,1
8040de78:	000780e7          	jalr	a5
8040de7c:	ec5ff06f          	j	8040dd40 <vfs_open+0x60>
8040de80:	0105fa93          	andi	s5,a1,16
8040de84:	ffd00413          	li	s0,-3
8040de88:	f60a90e3          	bnez	s5,8040dde8 <vfs_open+0x108>
8040de8c:	e89ff06f          	j	8040dd14 <vfs_open+0x34>
8040de90:	00412503          	lw	a0,4(sp)
8040de94:	00078413          	mv	s0,a5
8040de98:	e5cff0ef          	jal	ra,8040d4f4 <inode_open_dec>
8040de9c:	00412503          	lw	a0,4(sp)
8040dea0:	d70ff0ef          	jal	ra,8040d410 <inode_ref_dec>
8040dea4:	f45ff06f          	j	8040dde8 <vfs_open+0x108>
8040dea8:	fe900413          	li	s0,-23
8040deac:	f3dff06f          	j	8040dde8 <vfs_open+0x108>
8040deb0:	00007697          	auipc	a3,0x7
8040deb4:	30c68693          	addi	a3,a3,780 # 804151bc <syscalls+0x814>
8040deb8:	00005617          	auipc	a2,0x5
8040debc:	c8460613          	addi	a2,a2,-892 # 80412b3c <commands+0x1bc>
8040dec0:	03300593          	li	a1,51
8040dec4:	00007517          	auipc	a0,0x7
8040dec8:	2c850513          	addi	a0,a0,712 # 8041518c <syscalls+0x7e4>
8040decc:	f58f20ef          	jal	ra,80400624 <__panic>
8040ded0:	00007697          	auipc	a3,0x7
8040ded4:	34468693          	addi	a3,a3,836 # 80415214 <syscalls+0x86c>
8040ded8:	00005617          	auipc	a2,0x5
8040dedc:	c6460613          	addi	a2,a2,-924 # 80412b3c <commands+0x1bc>
8040dee0:	03a00593          	li	a1,58
8040dee4:	00007517          	auipc	a0,0x7
8040dee8:	2a850513          	addi	a0,a0,680 # 8041518c <syscalls+0x7e4>
8040deec:	f38f20ef          	jal	ra,80400624 <__panic>
8040def0:	00007697          	auipc	a3,0x7
8040def4:	2bc68693          	addi	a3,a3,700 # 804151ac <syscalls+0x804>
8040def8:	00005617          	auipc	a2,0x5
8040defc:	c4460613          	addi	a2,a2,-956 # 80412b3c <commands+0x1bc>
8040df00:	03100593          	li	a1,49
8040df04:	00007517          	auipc	a0,0x7
8040df08:	28850513          	addi	a0,a0,648 # 8041518c <syscalls+0x7e4>
8040df0c:	f18f20ef          	jal	ra,80400624 <__panic>
8040df10:	00007697          	auipc	a3,0x7
8040df14:	22c68693          	addi	a3,a3,556 # 8041513c <syscalls+0x794>
8040df18:	00005617          	auipc	a2,0x5
8040df1c:	c2460613          	addi	a2,a2,-988 # 80412b3c <commands+0x1bc>
8040df20:	02c00593          	li	a1,44
8040df24:	00007517          	auipc	a0,0x7
8040df28:	26850513          	addi	a0,a0,616 # 8041518c <syscalls+0x7e4>
8040df2c:	ef8f20ef          	jal	ra,80400624 <__panic>

8040df30 <vfs_close>:
8040df30:	ff010113          	addi	sp,sp,-16
8040df34:	00112623          	sw	ra,12(sp)
8040df38:	00812423          	sw	s0,8(sp)
8040df3c:	00050413          	mv	s0,a0
8040df40:	db4ff0ef          	jal	ra,8040d4f4 <inode_open_dec>
8040df44:	00040513          	mv	a0,s0
8040df48:	cc8ff0ef          	jal	ra,8040d410 <inode_ref_dec>
8040df4c:	00c12083          	lw	ra,12(sp)
8040df50:	00812403          	lw	s0,8(sp)
8040df54:	00000513          	li	a0,0
8040df58:	01010113          	addi	sp,sp,16
8040df5c:	00008067          	ret

8040df60 <get_device>:
8040df60:	fe010113          	addi	sp,sp,-32
8040df64:	00812c23          	sw	s0,24(sp)
8040df68:	00912a23          	sw	s1,20(sp)
8040df6c:	01212823          	sw	s2,16(sp)
8040df70:	00112e23          	sw	ra,28(sp)
8040df74:	00054783          	lbu	a5,0(a0)
8040df78:	00050413          	mv	s0,a0
8040df7c:	00058913          	mv	s2,a1
8040df80:	00060493          	mv	s1,a2
8040df84:	04078263          	beqz	a5,8040dfc8 <get_device+0x68>
8040df88:	03a00713          	li	a4,58
8040df8c:	0ae78463          	beq	a5,a4,8040e034 <get_device+0xd4>
8040df90:	02f00713          	li	a4,47
8040df94:	0ee78e63          	beq	a5,a4,8040e090 <get_device+0x130>
8040df98:	00150693          	addi	a3,a0,1
8040df9c:	00000793          	li	a5,0
8040dfa0:	03a00813          	li	a6,58
8040dfa4:	02f00893          	li	a7,47
8040dfa8:	0140006f          	j	8040dfbc <get_device+0x5c>
8040dfac:	05070063          	beq	a4,a6,8040dfec <get_device+0x8c>
8040dfb0:	00168693          	addi	a3,a3,1
8040dfb4:	00050793          	mv	a5,a0
8040dfb8:	01170863          	beq	a4,a7,8040dfc8 <get_device+0x68>
8040dfbc:	0006c703          	lbu	a4,0(a3)
8040dfc0:	00178513          	addi	a0,a5,1
8040dfc4:	fe0714e3          	bnez	a4,8040dfac <get_device+0x4c>
8040dfc8:	00892023          	sw	s0,0(s2)
8040dfcc:	00048513          	mv	a0,s1
8040dfd0:	224000ef          	jal	ra,8040e1f4 <vfs_get_curdir>
8040dfd4:	01c12083          	lw	ra,28(sp)
8040dfd8:	01812403          	lw	s0,24(sp)
8040dfdc:	01412483          	lw	s1,20(sp)
8040dfe0:	01012903          	lw	s2,16(sp)
8040dfe4:	02010113          	addi	sp,sp,32
8040dfe8:	00008067          	ret
8040dfec:	00278793          	addi	a5,a5,2
8040dff0:	00068023          	sb	zero,0(a3)
8040dff4:	00f407b3          	add	a5,s0,a5
8040dff8:	02f00693          	li	a3,47
8040dffc:	00078513          	mv	a0,a5
8040e000:	00178793          	addi	a5,a5,1
8040e004:	fff7c703          	lbu	a4,-1(a5)
8040e008:	fed70ae3          	beq	a4,a3,8040dffc <get_device+0x9c>
8040e00c:	00a92023          	sw	a0,0(s2)
8040e010:	00048593          	mv	a1,s1
8040e014:	00040513          	mv	a0,s0
8040e018:	a3dff0ef          	jal	ra,8040da54 <vfs_get_root>
8040e01c:	01c12083          	lw	ra,28(sp)
8040e020:	01812403          	lw	s0,24(sp)
8040e024:	01412483          	lw	s1,20(sp)
8040e028:	01012903          	lw	s2,16(sp)
8040e02c:	02010113          	addi	sp,sp,32
8040e030:	00008067          	ret
8040e034:	00c10513          	addi	a0,sp,12
8040e038:	1bc000ef          	jal	ra,8040e1f4 <vfs_get_curdir>
8040e03c:	fe0510e3          	bnez	a0,8040e01c <get_device+0xbc>
8040e040:	00c12783          	lw	a5,12(sp)
8040e044:	0387a503          	lw	a0,56(a5)
8040e048:	04050c63          	beqz	a0,8040e0a0 <get_device+0x140>
8040e04c:	07452783          	lw	a5,116(a0)
8040e050:	000780e7          	jalr	a5
8040e054:	00a4a023          	sw	a0,0(s1)
8040e058:	00c12503          	lw	a0,12(sp)
8040e05c:	bb4ff0ef          	jal	ra,8040d410 <inode_ref_dec>
8040e060:	02f00713          	li	a4,47
8040e064:	00140413          	addi	s0,s0,1
8040e068:	00044783          	lbu	a5,0(s0)
8040e06c:	fee78ce3          	beq	a5,a4,8040e064 <get_device+0x104>
8040e070:	00892023          	sw	s0,0(s2)
8040e074:	01c12083          	lw	ra,28(sp)
8040e078:	01812403          	lw	s0,24(sp)
8040e07c:	01412483          	lw	s1,20(sp)
8040e080:	01012903          	lw	s2,16(sp)
8040e084:	00000513          	li	a0,0
8040e088:	02010113          	addi	sp,sp,32
8040e08c:	00008067          	ret
8040e090:	00060513          	mv	a0,a2
8040e094:	e58ff0ef          	jal	ra,8040d6ec <vfs_get_bootfs>
8040e098:	fc0504e3          	beqz	a0,8040e060 <get_device+0x100>
8040e09c:	f81ff06f          	j	8040e01c <get_device+0xbc>
8040e0a0:	00007697          	auipc	a3,0x7
8040e0a4:	1d468693          	addi	a3,a3,468 # 80415274 <syscalls+0x8cc>
8040e0a8:	00005617          	auipc	a2,0x5
8040e0ac:	a9460613          	addi	a2,a2,-1388 # 80412b3c <commands+0x1bc>
8040e0b0:	03900593          	li	a1,57
8040e0b4:	00007517          	auipc	a0,0x7
8040e0b8:	1d450513          	addi	a0,a0,468 # 80415288 <syscalls+0x8e0>
8040e0bc:	d68f20ef          	jal	ra,80400624 <__panic>

8040e0c0 <vfs_lookup>:
8040e0c0:	fd010113          	addi	sp,sp,-48
8040e0c4:	03212023          	sw	s2,32(sp)
8040e0c8:	01c10613          	addi	a2,sp,28
8040e0cc:	00058913          	mv	s2,a1
8040e0d0:	00c10593          	addi	a1,sp,12
8040e0d4:	02812423          	sw	s0,40(sp)
8040e0d8:	02112623          	sw	ra,44(sp)
8040e0dc:	02912223          	sw	s1,36(sp)
8040e0e0:	00a12623          	sw	a0,12(sp)
8040e0e4:	e7dff0ef          	jal	ra,8040df60 <get_device>
8040e0e8:	00050413          	mv	s0,a0
8040e0ec:	04051e63          	bnez	a0,8040e148 <vfs_lookup+0x88>
8040e0f0:	00c12783          	lw	a5,12(sp)
8040e0f4:	01c12483          	lw	s1,28(sp)
8040e0f8:	0007c783          	lbu	a5,0(a5)
8040e0fc:	06078463          	beqz	a5,8040e164 <vfs_lookup+0xa4>
8040e100:	08048263          	beqz	s1,8040e184 <vfs_lookup+0xc4>
8040e104:	03c4a783          	lw	a5,60(s1)
8040e108:	06078e63          	beqz	a5,8040e184 <vfs_lookup+0xc4>
8040e10c:	0387a783          	lw	a5,56(a5)
8040e110:	06078a63          	beqz	a5,8040e184 <vfs_lookup+0xc4>
8040e114:	00048513          	mv	a0,s1
8040e118:	00007597          	auipc	a1,0x7
8040e11c:	1d858593          	addi	a1,a1,472 # 804152f0 <syscalls+0x948>
8040e120:	a24ff0ef          	jal	ra,8040d344 <inode_check>
8040e124:	03c4a783          	lw	a5,60(s1)
8040e128:	00c12583          	lw	a1,12(sp)
8040e12c:	01c12503          	lw	a0,28(sp)
8040e130:	0387a783          	lw	a5,56(a5)
8040e134:	00090613          	mv	a2,s2
8040e138:	000780e7          	jalr	a5
8040e13c:	00050413          	mv	s0,a0
8040e140:	01c12503          	lw	a0,28(sp)
8040e144:	accff0ef          	jal	ra,8040d410 <inode_ref_dec>
8040e148:	00040513          	mv	a0,s0
8040e14c:	02c12083          	lw	ra,44(sp)
8040e150:	02812403          	lw	s0,40(sp)
8040e154:	02412483          	lw	s1,36(sp)
8040e158:	02012903          	lw	s2,32(sp)
8040e15c:	03010113          	addi	sp,sp,48
8040e160:	00008067          	ret
8040e164:	00040513          	mv	a0,s0
8040e168:	02c12083          	lw	ra,44(sp)
8040e16c:	02812403          	lw	s0,40(sp)
8040e170:	00992023          	sw	s1,0(s2)
8040e174:	02412483          	lw	s1,36(sp)
8040e178:	02012903          	lw	s2,32(sp)
8040e17c:	03010113          	addi	sp,sp,48
8040e180:	00008067          	ret
8040e184:	00007697          	auipc	a3,0x7
8040e188:	11c68693          	addi	a3,a3,284 # 804152a0 <syscalls+0x8f8>
8040e18c:	00005617          	auipc	a2,0x5
8040e190:	9b060613          	addi	a2,a2,-1616 # 80412b3c <commands+0x1bc>
8040e194:	04f00593          	li	a1,79
8040e198:	00007517          	auipc	a0,0x7
8040e19c:	0f050513          	addi	a0,a0,240 # 80415288 <syscalls+0x8e0>
8040e1a0:	c84f20ef          	jal	ra,80400624 <__panic>

8040e1a4 <vfs_lookup_parent>:
8040e1a4:	fd010113          	addi	sp,sp,-48
8040e1a8:	02812423          	sw	s0,40(sp)
8040e1ac:	02912223          	sw	s1,36(sp)
8040e1b0:	00058413          	mv	s0,a1
8040e1b4:	00060493          	mv	s1,a2
8040e1b8:	00c10593          	addi	a1,sp,12
8040e1bc:	01c10613          	addi	a2,sp,28
8040e1c0:	02112623          	sw	ra,44(sp)
8040e1c4:	00a12623          	sw	a0,12(sp)
8040e1c8:	d99ff0ef          	jal	ra,8040df60 <get_device>
8040e1cc:	00051a63          	bnez	a0,8040e1e0 <vfs_lookup_parent+0x3c>
8040e1d0:	00c12783          	lw	a5,12(sp)
8040e1d4:	00f4a023          	sw	a5,0(s1)
8040e1d8:	01c12783          	lw	a5,28(sp)
8040e1dc:	00f42023          	sw	a5,0(s0)
8040e1e0:	02c12083          	lw	ra,44(sp)
8040e1e4:	02812403          	lw	s0,40(sp)
8040e1e8:	02412483          	lw	s1,36(sp)
8040e1ec:	03010113          	addi	sp,sp,48
8040e1f0:	00008067          	ret

8040e1f4 <vfs_get_curdir>:
8040e1f4:	0008e797          	auipc	a5,0x8e
8040e1f8:	5b878793          	addi	a5,a5,1464 # 8049c7ac <current>
8040e1fc:	0007a783          	lw	a5,0(a5)
8040e200:	ff010113          	addi	sp,sp,-16
8040e204:	00812423          	sw	s0,8(sp)
8040e208:	0dc7a783          	lw	a5,220(a5)
8040e20c:	00112623          	sw	ra,12(sp)
8040e210:	00912223          	sw	s1,4(sp)
8040e214:	0007a403          	lw	s0,0(a5)
8040e218:	02040663          	beqz	s0,8040e244 <vfs_get_curdir+0x50>
8040e21c:	00050493          	mv	s1,a0
8040e220:	00040513          	mv	a0,s0
8040e224:	8f8ff0ef          	jal	ra,8040d31c <inode_ref_inc>
8040e228:	00000513          	li	a0,0
8040e22c:	0084a023          	sw	s0,0(s1)
8040e230:	00c12083          	lw	ra,12(sp)
8040e234:	00812403          	lw	s0,8(sp)
8040e238:	00412483          	lw	s1,4(sp)
8040e23c:	01010113          	addi	sp,sp,16
8040e240:	00008067          	ret
8040e244:	ff000513          	li	a0,-16
8040e248:	fe9ff06f          	j	8040e230 <vfs_get_curdir+0x3c>

8040e24c <vfs_set_curdir>:
8040e24c:	fd010113          	addi	sp,sp,-48
8040e250:	02912223          	sw	s1,36(sp)
8040e254:	0008e497          	auipc	s1,0x8e
8040e258:	55848493          	addi	s1,s1,1368 # 8049c7ac <current>
8040e25c:	0004a783          	lw	a5,0(s1)
8040e260:	02812423          	sw	s0,40(sp)
8040e264:	00050413          	mv	s0,a0
8040e268:	0dc7a503          	lw	a0,220(a5)
8040e26c:	01312e23          	sw	s3,28(sp)
8040e270:	02112623          	sw	ra,44(sp)
8040e274:	03212023          	sw	s2,32(sp)
8040e278:	fb1f70ef          	jal	ra,80406228 <lock_files>
8040e27c:	0004a783          	lw	a5,0(s1)
8040e280:	0dc7a503          	lw	a0,220(a5)
8040e284:	00052983          	lw	s3,0(a0)
8040e288:	0b340863          	beq	s0,s3,8040e338 <vfs_set_curdir+0xec>
8040e28c:	08040a63          	beqz	s0,8040e320 <vfs_set_curdir+0xd4>
8040e290:	03c42783          	lw	a5,60(s0)
8040e294:	0a078663          	beqz	a5,8040e340 <vfs_set_curdir+0xf4>
8040e298:	0287a783          	lw	a5,40(a5)
8040e29c:	0a078263          	beqz	a5,8040e340 <vfs_set_curdir+0xf4>
8040e2a0:	00007597          	auipc	a1,0x7
8040e2a4:	12058593          	addi	a1,a1,288 # 804153c0 <syscalls+0xa18>
8040e2a8:	00040513          	mv	a0,s0
8040e2ac:	898ff0ef          	jal	ra,8040d344 <inode_check>
8040e2b0:	03c42783          	lw	a5,60(s0)
8040e2b4:	00c10593          	addi	a1,sp,12
8040e2b8:	00040513          	mv	a0,s0
8040e2bc:	0287a783          	lw	a5,40(a5)
8040e2c0:	000780e7          	jalr	a5
8040e2c4:	00050913          	mv	s2,a0
8040e2c8:	00051e63          	bnez	a0,8040e2e4 <vfs_set_curdir+0x98>
8040e2cc:	00c12683          	lw	a3,12(sp)
8040e2d0:	000077b7          	lui	a5,0x7
8040e2d4:	00002737          	lui	a4,0x2
8040e2d8:	00d7f7b3          	and	a5,a5,a3
8040e2dc:	fee00913          	li	s2,-18
8040e2e0:	02e78863          	beq	a5,a4,8040e310 <vfs_set_curdir+0xc4>
8040e2e4:	0004a783          	lw	a5,0(s1)
8040e2e8:	0dc7a503          	lw	a0,220(a5) # 70dc <_binary_bin_swap_img_size-0xf24>
8040e2ec:	f45f70ef          	jal	ra,80406230 <unlock_files>
8040e2f0:	02c12083          	lw	ra,44(sp)
8040e2f4:	02812403          	lw	s0,40(sp)
8040e2f8:	00090513          	mv	a0,s2
8040e2fc:	02412483          	lw	s1,36(sp)
8040e300:	02012903          	lw	s2,32(sp)
8040e304:	01c12983          	lw	s3,28(sp)
8040e308:	03010113          	addi	sp,sp,48
8040e30c:	00008067          	ret
8040e310:	00040513          	mv	a0,s0
8040e314:	808ff0ef          	jal	ra,8040d31c <inode_ref_inc>
8040e318:	0004a783          	lw	a5,0(s1)
8040e31c:	0dc7a503          	lw	a0,220(a5)
8040e320:	00852023          	sw	s0,0(a0)
8040e324:	00000913          	li	s2,0
8040e328:	fc0982e3          	beqz	s3,8040e2ec <vfs_set_curdir+0xa0>
8040e32c:	00098513          	mv	a0,s3
8040e330:	8e0ff0ef          	jal	ra,8040d410 <inode_ref_dec>
8040e334:	fb1ff06f          	j	8040e2e4 <vfs_set_curdir+0x98>
8040e338:	00000913          	li	s2,0
8040e33c:	fb1ff06f          	j	8040e2ec <vfs_set_curdir+0xa0>
8040e340:	00007697          	auipc	a3,0x7
8040e344:	01868693          	addi	a3,a3,24 # 80415358 <syscalls+0x9b0>
8040e348:	00004617          	auipc	a2,0x4
8040e34c:	7f460613          	addi	a2,a2,2036 # 80412b3c <commands+0x1bc>
8040e350:	04300593          	li	a1,67
8040e354:	00007517          	auipc	a0,0x7
8040e358:	05450513          	addi	a0,a0,84 # 804153a8 <syscalls+0xa00>
8040e35c:	ac8f20ef          	jal	ra,80400624 <__panic>

8040e360 <vfs_chdir>:
8040e360:	fe010113          	addi	sp,sp,-32
8040e364:	00c10593          	addi	a1,sp,12
8040e368:	00812c23          	sw	s0,24(sp)
8040e36c:	00112e23          	sw	ra,28(sp)
8040e370:	d51ff0ef          	jal	ra,8040e0c0 <vfs_lookup>
8040e374:	00050413          	mv	s0,a0
8040e378:	00050c63          	beqz	a0,8040e390 <vfs_chdir+0x30>
8040e37c:	00040513          	mv	a0,s0
8040e380:	01c12083          	lw	ra,28(sp)
8040e384:	01812403          	lw	s0,24(sp)
8040e388:	02010113          	addi	sp,sp,32
8040e38c:	00008067          	ret
8040e390:	00c12503          	lw	a0,12(sp)
8040e394:	eb9ff0ef          	jal	ra,8040e24c <vfs_set_curdir>
8040e398:	00050413          	mv	s0,a0
8040e39c:	00c12503          	lw	a0,12(sp)
8040e3a0:	870ff0ef          	jal	ra,8040d410 <inode_ref_dec>
8040e3a4:	00040513          	mv	a0,s0
8040e3a8:	01c12083          	lw	ra,28(sp)
8040e3ac:	01812403          	lw	s0,24(sp)
8040e3b0:	02010113          	addi	sp,sp,32
8040e3b4:	00008067          	ret

8040e3b8 <vfs_getcwd>:
8040e3b8:	0008e797          	auipc	a5,0x8e
8040e3bc:	3f478793          	addi	a5,a5,1012 # 8049c7ac <current>
8040e3c0:	0007a783          	lw	a5,0(a5)
8040e3c4:	fe010113          	addi	sp,sp,-32
8040e3c8:	00812c23          	sw	s0,24(sp)
8040e3cc:	0dc7a783          	lw	a5,220(a5)
8040e3d0:	00112e23          	sw	ra,28(sp)
8040e3d4:	00912a23          	sw	s1,20(sp)
8040e3d8:	0007a403          	lw	s0,0(a5)
8040e3dc:	01212823          	sw	s2,16(sp)
8040e3e0:	0c040663          	beqz	s0,8040e4ac <vfs_getcwd+0xf4>
8040e3e4:	00050493          	mv	s1,a0
8040e3e8:	00040513          	mv	a0,s0
8040e3ec:	f31fe0ef          	jal	ra,8040d31c <inode_ref_inc>
8040e3f0:	03842503          	lw	a0,56(s0)
8040e3f4:	0c050063          	beqz	a0,8040e4b4 <vfs_getcwd+0xfc>
8040e3f8:	f5cff0ef          	jal	ra,8040db54 <vfs_get_devname>
8040e3fc:	00050913          	mv	s2,a0
8040e400:	228040ef          	jal	ra,80412628 <strlen>
8040e404:	00050613          	mv	a2,a0
8040e408:	00090593          	mv	a1,s2
8040e40c:	00000713          	li	a4,0
8040e410:	00100693          	li	a3,1
8040e414:	00048513          	mv	a0,s1
8040e418:	910f80ef          	jal	ra,80406528 <iobuf_move>
8040e41c:	00050913          	mv	s2,a0
8040e420:	02050463          	beqz	a0,8040e448 <vfs_getcwd+0x90>
8040e424:	00040513          	mv	a0,s0
8040e428:	fe9fe0ef          	jal	ra,8040d410 <inode_ref_dec>
8040e42c:	01c12083          	lw	ra,28(sp)
8040e430:	01812403          	lw	s0,24(sp)
8040e434:	00090513          	mv	a0,s2
8040e438:	01412483          	lw	s1,20(sp)
8040e43c:	01012903          	lw	s2,16(sp)
8040e440:	02010113          	addi	sp,sp,32
8040e444:	00008067          	ret
8040e448:	03a00793          	li	a5,58
8040e44c:	00000713          	li	a4,0
8040e450:	00100693          	li	a3,1
8040e454:	00100613          	li	a2,1
8040e458:	00f10593          	addi	a1,sp,15
8040e45c:	00048513          	mv	a0,s1
8040e460:	00f107a3          	sb	a5,15(sp)
8040e464:	8c4f80ef          	jal	ra,80406528 <iobuf_move>
8040e468:	00050913          	mv	s2,a0
8040e46c:	fa051ce3          	bnez	a0,8040e424 <vfs_getcwd+0x6c>
8040e470:	03c42783          	lw	a5,60(s0)
8040e474:	06078063          	beqz	a5,8040e4d4 <vfs_getcwd+0x11c>
8040e478:	01c7a783          	lw	a5,28(a5)
8040e47c:	04078c63          	beqz	a5,8040e4d4 <vfs_getcwd+0x11c>
8040e480:	00007597          	auipc	a1,0x7
8040e484:	ecc58593          	addi	a1,a1,-308 # 8041534c <syscalls+0x9a4>
8040e488:	00040513          	mv	a0,s0
8040e48c:	eb9fe0ef          	jal	ra,8040d344 <inode_check>
8040e490:	03c42783          	lw	a5,60(s0)
8040e494:	00048593          	mv	a1,s1
8040e498:	00040513          	mv	a0,s0
8040e49c:	01c7a783          	lw	a5,28(a5)
8040e4a0:	000780e7          	jalr	a5
8040e4a4:	00050913          	mv	s2,a0
8040e4a8:	f7dff06f          	j	8040e424 <vfs_getcwd+0x6c>
8040e4ac:	ff000913          	li	s2,-16
8040e4b0:	f7dff06f          	j	8040e42c <vfs_getcwd+0x74>
8040e4b4:	00007697          	auipc	a3,0x7
8040e4b8:	dc068693          	addi	a3,a3,-576 # 80415274 <syscalls+0x8cc>
8040e4bc:	00004617          	auipc	a2,0x4
8040e4c0:	68060613          	addi	a2,a2,1664 # 80412b3c <commands+0x1bc>
8040e4c4:	06e00593          	li	a1,110
8040e4c8:	00007517          	auipc	a0,0x7
8040e4cc:	ee050513          	addi	a0,a0,-288 # 804153a8 <syscalls+0xa00>
8040e4d0:	954f20ef          	jal	ra,80400624 <__panic>
8040e4d4:	00007697          	auipc	a3,0x7
8040e4d8:	e2468693          	addi	a3,a3,-476 # 804152f8 <syscalls+0x950>
8040e4dc:	00004617          	auipc	a2,0x4
8040e4e0:	66060613          	addi	a2,a2,1632 # 80412b3c <commands+0x1bc>
8040e4e4:	07800593          	li	a1,120
8040e4e8:	00007517          	auipc	a0,0x7
8040e4ec:	ec050513          	addi	a0,a0,-320 # 804153a8 <syscalls+0xa00>
8040e4f0:	934f20ef          	jal	ra,80400624 <__panic>

8040e4f4 <dev_lookup>:
8040e4f4:	0005c703          	lbu	a4,0(a1)
8040e4f8:	02071e63          	bnez	a4,8040e534 <dev_lookup+0x40>
8040e4fc:	ff010113          	addi	sp,sp,-16
8040e500:	00812423          	sw	s0,8(sp)
8040e504:	00912223          	sw	s1,4(sp)
8040e508:	00112623          	sw	ra,12(sp)
8040e50c:	00050493          	mv	s1,a0
8040e510:	00060413          	mv	s0,a2
8040e514:	e09fe0ef          	jal	ra,8040d31c <inode_ref_inc>
8040e518:	00c12083          	lw	ra,12(sp)
8040e51c:	00942023          	sw	s1,0(s0)
8040e520:	00812403          	lw	s0,8(sp)
8040e524:	00412483          	lw	s1,4(sp)
8040e528:	00000513          	li	a0,0
8040e52c:	01010113          	addi	sp,sp,16
8040e530:	00008067          	ret
8040e534:	ff000513          	li	a0,-16
8040e538:	00008067          	ret

8040e53c <dev_ioctl>:
8040e53c:	00050e63          	beqz	a0,8040e558 <dev_ioctl+0x1c>
8040e540:	02c52683          	lw	a3,44(a0)
8040e544:	00001737          	lui	a4,0x1
8040e548:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e54c:	00e69663          	bne	a3,a4,8040e558 <dev_ioctl+0x1c>
8040e550:	01452303          	lw	t1,20(a0)
8040e554:	00030067          	jr	t1
8040e558:	ff010113          	addi	sp,sp,-16
8040e55c:	00007697          	auipc	a3,0x7
8040e560:	b8868693          	addi	a3,a3,-1144 # 804150e4 <syscalls+0x73c>
8040e564:	00004617          	auipc	a2,0x4
8040e568:	5d860613          	addi	a2,a2,1496 # 80412b3c <commands+0x1bc>
8040e56c:	03500593          	li	a1,53
8040e570:	00007517          	auipc	a0,0x7
8040e574:	e5850513          	addi	a0,a0,-424 # 804153c8 <syscalls+0xa20>
8040e578:	00112623          	sw	ra,12(sp)
8040e57c:	8a8f20ef          	jal	ra,80400624 <__panic>

8040e580 <dev_tryseek>:
8040e580:	ff010113          	addi	sp,sp,-16
8040e584:	00112623          	sw	ra,12(sp)
8040e588:	00812423          	sw	s0,8(sp)
8040e58c:	00912223          	sw	s1,4(sp)
8040e590:	01212023          	sw	s2,0(sp)
8040e594:	06050663          	beqz	a0,8040e600 <dev_tryseek+0x80>
8040e598:	02c52703          	lw	a4,44(a0)
8040e59c:	000017b7          	lui	a5,0x1
8040e5a0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e5a4:	04f71e63          	bne	a4,a5,8040e600 <dev_tryseek+0x80>
8040e5a8:	00052483          	lw	s1,0(a0)
8040e5ac:	04048663          	beqz	s1,8040e5f8 <dev_tryseek+0x78>
8040e5b0:	00452903          	lw	s2,4(a0)
8040e5b4:	00058413          	mv	s0,a1
8040e5b8:	00058513          	mv	a0,a1
8040e5bc:	00090593          	mv	a1,s2
8040e5c0:	254040ef          	jal	ra,80412814 <__umodsi3>
8040e5c4:	02051a63          	bnez	a0,8040e5f8 <dev_tryseek+0x78>
8040e5c8:	02044863          	bltz	s0,8040e5f8 <dev_tryseek+0x78>
8040e5cc:	00090593          	mv	a1,s2
8040e5d0:	00048513          	mv	a0,s1
8040e5d4:	1cc040ef          	jal	ra,804127a0 <__mulsi3>
8040e5d8:	02a47063          	bgeu	s0,a0,8040e5f8 <dev_tryseek+0x78>
8040e5dc:	00000513          	li	a0,0
8040e5e0:	00c12083          	lw	ra,12(sp)
8040e5e4:	00812403          	lw	s0,8(sp)
8040e5e8:	00412483          	lw	s1,4(sp)
8040e5ec:	00012903          	lw	s2,0(sp)
8040e5f0:	01010113          	addi	sp,sp,16
8040e5f4:	00008067          	ret
8040e5f8:	ffd00513          	li	a0,-3
8040e5fc:	fe5ff06f          	j	8040e5e0 <dev_tryseek+0x60>
8040e600:	00007697          	auipc	a3,0x7
8040e604:	ae468693          	addi	a3,a3,-1308 # 804150e4 <syscalls+0x73c>
8040e608:	00004617          	auipc	a2,0x4
8040e60c:	53460613          	addi	a2,a2,1332 # 80412b3c <commands+0x1bc>
8040e610:	05f00593          	li	a1,95
8040e614:	00007517          	auipc	a0,0x7
8040e618:	db450513          	addi	a0,a0,-588 # 804153c8 <syscalls+0xa20>
8040e61c:	808f20ef          	jal	ra,80400624 <__panic>

8040e620 <dev_gettype>:
8040e620:	02050e63          	beqz	a0,8040e65c <dev_gettype+0x3c>
8040e624:	02c52703          	lw	a4,44(a0)
8040e628:	000017b7          	lui	a5,0x1
8040e62c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e630:	02f71663          	bne	a4,a5,8040e65c <dev_gettype+0x3c>
8040e634:	00052703          	lw	a4,0(a0)
8040e638:	000057b7          	lui	a5,0x5
8040e63c:	00070863          	beqz	a4,8040e64c <dev_gettype+0x2c>
8040e640:	00f5a023          	sw	a5,0(a1)
8040e644:	00000513          	li	a0,0
8040e648:	00008067          	ret
8040e64c:	000047b7          	lui	a5,0x4
8040e650:	00f5a023          	sw	a5,0(a1)
8040e654:	00000513          	li	a0,0
8040e658:	00008067          	ret
8040e65c:	ff010113          	addi	sp,sp,-16
8040e660:	00007697          	auipc	a3,0x7
8040e664:	a8468693          	addi	a3,a3,-1404 # 804150e4 <syscalls+0x73c>
8040e668:	00004617          	auipc	a2,0x4
8040e66c:	4d460613          	addi	a2,a2,1236 # 80412b3c <commands+0x1bc>
8040e670:	05300593          	li	a1,83
8040e674:	00007517          	auipc	a0,0x7
8040e678:	d5450513          	addi	a0,a0,-684 # 804153c8 <syscalls+0xa20>
8040e67c:	00112623          	sw	ra,12(sp)
8040e680:	fa5f10ef          	jal	ra,80400624 <__panic>

8040e684 <dev_write>:
8040e684:	02050063          	beqz	a0,8040e6a4 <dev_write+0x20>
8040e688:	02c52683          	lw	a3,44(a0)
8040e68c:	00001737          	lui	a4,0x1
8040e690:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e694:	00e69863          	bne	a3,a4,8040e6a4 <dev_write+0x20>
8040e698:	01052303          	lw	t1,16(a0)
8040e69c:	00100613          	li	a2,1
8040e6a0:	00030067          	jr	t1
8040e6a4:	ff010113          	addi	sp,sp,-16
8040e6a8:	00007697          	auipc	a3,0x7
8040e6ac:	a3c68693          	addi	a3,a3,-1476 # 804150e4 <syscalls+0x73c>
8040e6b0:	00004617          	auipc	a2,0x4
8040e6b4:	48c60613          	addi	a2,a2,1164 # 80412b3c <commands+0x1bc>
8040e6b8:	02c00593          	li	a1,44
8040e6bc:	00007517          	auipc	a0,0x7
8040e6c0:	d0c50513          	addi	a0,a0,-756 # 804153c8 <syscalls+0xa20>
8040e6c4:	00112623          	sw	ra,12(sp)
8040e6c8:	f5df10ef          	jal	ra,80400624 <__panic>

8040e6cc <dev_read>:
8040e6cc:	02050063          	beqz	a0,8040e6ec <dev_read+0x20>
8040e6d0:	02c52683          	lw	a3,44(a0)
8040e6d4:	00001737          	lui	a4,0x1
8040e6d8:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e6dc:	00e69863          	bne	a3,a4,8040e6ec <dev_read+0x20>
8040e6e0:	01052303          	lw	t1,16(a0)
8040e6e4:	00000613          	li	a2,0
8040e6e8:	00030067          	jr	t1
8040e6ec:	ff010113          	addi	sp,sp,-16
8040e6f0:	00007697          	auipc	a3,0x7
8040e6f4:	9f468693          	addi	a3,a3,-1548 # 804150e4 <syscalls+0x73c>
8040e6f8:	00004617          	auipc	a2,0x4
8040e6fc:	44460613          	addi	a2,a2,1092 # 80412b3c <commands+0x1bc>
8040e700:	02300593          	li	a1,35
8040e704:	00007517          	auipc	a0,0x7
8040e708:	cc450513          	addi	a0,a0,-828 # 804153c8 <syscalls+0xa20>
8040e70c:	00112623          	sw	ra,12(sp)
8040e710:	f15f10ef          	jal	ra,80400624 <__panic>

8040e714 <dev_close>:
8040e714:	00050e63          	beqz	a0,8040e730 <dev_close+0x1c>
8040e718:	02c52683          	lw	a3,44(a0)
8040e71c:	00001737          	lui	a4,0x1
8040e720:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e724:	00e69663          	bne	a3,a4,8040e730 <dev_close+0x1c>
8040e728:	00c52303          	lw	t1,12(a0)
8040e72c:	00030067          	jr	t1
8040e730:	ff010113          	addi	sp,sp,-16
8040e734:	00007697          	auipc	a3,0x7
8040e738:	9b068693          	addi	a3,a3,-1616 # 804150e4 <syscalls+0x73c>
8040e73c:	00004617          	auipc	a2,0x4
8040e740:	40060613          	addi	a2,a2,1024 # 80412b3c <commands+0x1bc>
8040e744:	01a00593          	li	a1,26
8040e748:	00007517          	auipc	a0,0x7
8040e74c:	c8050513          	addi	a0,a0,-896 # 804153c8 <syscalls+0xa20>
8040e750:	00112623          	sw	ra,12(sp)
8040e754:	ed1f10ef          	jal	ra,80400624 <__panic>

8040e758 <dev_open>:
8040e758:	03c5f713          	andi	a4,a1,60
8040e75c:	02071063          	bnez	a4,8040e77c <dev_open+0x24>
8040e760:	02050263          	beqz	a0,8040e784 <dev_open+0x2c>
8040e764:	02c52683          	lw	a3,44(a0)
8040e768:	00001737          	lui	a4,0x1
8040e76c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e770:	00e69a63          	bne	a3,a4,8040e784 <dev_open+0x2c>
8040e774:	00852303          	lw	t1,8(a0)
8040e778:	00030067          	jr	t1
8040e77c:	ffd00513          	li	a0,-3
8040e780:	00008067          	ret
8040e784:	ff010113          	addi	sp,sp,-16
8040e788:	00007697          	auipc	a3,0x7
8040e78c:	95c68693          	addi	a3,a3,-1700 # 804150e4 <syscalls+0x73c>
8040e790:	00004617          	auipc	a2,0x4
8040e794:	3ac60613          	addi	a2,a2,940 # 80412b3c <commands+0x1bc>
8040e798:	01100593          	li	a1,17
8040e79c:	00007517          	auipc	a0,0x7
8040e7a0:	c2c50513          	addi	a0,a0,-980 # 804153c8 <syscalls+0xa20>
8040e7a4:	00112623          	sw	ra,12(sp)
8040e7a8:	e7df10ef          	jal	ra,80400624 <__panic>

8040e7ac <dev_fstat>:
8040e7ac:	ff010113          	addi	sp,sp,-16
8040e7b0:	00912223          	sw	s1,4(sp)
8040e7b4:	00058493          	mv	s1,a1
8040e7b8:	00812423          	sw	s0,8(sp)
8040e7bc:	01000613          	li	a2,16
8040e7c0:	00050413          	mv	s0,a0
8040e7c4:	00000593          	li	a1,0
8040e7c8:	00048513          	mv	a0,s1
8040e7cc:	00112623          	sw	ra,12(sp)
8040e7d0:	01212023          	sw	s2,0(sp)
8040e7d4:	739030ef          	jal	ra,8041270c <memset>
8040e7d8:	08040463          	beqz	s0,8040e860 <dev_fstat+0xb4>
8040e7dc:	03c42783          	lw	a5,60(s0)
8040e7e0:	08078063          	beqz	a5,8040e860 <dev_fstat+0xb4>
8040e7e4:	0287a783          	lw	a5,40(a5) # 4028 <_binary_bin_swap_img_size-0x3fd8>
8040e7e8:	06078c63          	beqz	a5,8040e860 <dev_fstat+0xb4>
8040e7ec:	00007597          	auipc	a1,0x7
8040e7f0:	bd458593          	addi	a1,a1,-1068 # 804153c0 <syscalls+0xa18>
8040e7f4:	00040513          	mv	a0,s0
8040e7f8:	b4dfe0ef          	jal	ra,8040d344 <inode_check>
8040e7fc:	03c42783          	lw	a5,60(s0)
8040e800:	00048593          	mv	a1,s1
8040e804:	00040513          	mv	a0,s0
8040e808:	0287a783          	lw	a5,40(a5)
8040e80c:	000780e7          	jalr	a5
8040e810:	00050913          	mv	s2,a0
8040e814:	02051863          	bnez	a0,8040e844 <dev_fstat+0x98>
8040e818:	02c42703          	lw	a4,44(s0)
8040e81c:	000017b7          	lui	a5,0x1
8040e820:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e824:	04f71e63          	bne	a4,a5,8040e880 <dev_fstat+0xd4>
8040e828:	00042583          	lw	a1,0(s0)
8040e82c:	00442503          	lw	a0,4(s0)
8040e830:	00100793          	li	a5,1
8040e834:	00f4a223          	sw	a5,4(s1)
8040e838:	00b4a423          	sw	a1,8(s1)
8040e83c:	765030ef          	jal	ra,804127a0 <__mulsi3>
8040e840:	00a4a623          	sw	a0,12(s1)
8040e844:	00c12083          	lw	ra,12(sp)
8040e848:	00812403          	lw	s0,8(sp)
8040e84c:	00090513          	mv	a0,s2
8040e850:	00412483          	lw	s1,4(sp)
8040e854:	00012903          	lw	s2,0(sp)
8040e858:	01010113          	addi	sp,sp,16
8040e85c:	00008067          	ret
8040e860:	00007697          	auipc	a3,0x7
8040e864:	af868693          	addi	a3,a3,-1288 # 80415358 <syscalls+0x9b0>
8040e868:	00004617          	auipc	a2,0x4
8040e86c:	2d460613          	addi	a2,a2,724 # 80412b3c <commands+0x1bc>
8040e870:	04200593          	li	a1,66
8040e874:	00007517          	auipc	a0,0x7
8040e878:	b5450513          	addi	a0,a0,-1196 # 804153c8 <syscalls+0xa20>
8040e87c:	da9f10ef          	jal	ra,80400624 <__panic>
8040e880:	00007697          	auipc	a3,0x7
8040e884:	86468693          	addi	a3,a3,-1948 # 804150e4 <syscalls+0x73c>
8040e888:	00004617          	auipc	a2,0x4
8040e88c:	2b460613          	addi	a2,a2,692 # 80412b3c <commands+0x1bc>
8040e890:	04500593          	li	a1,69
8040e894:	00007517          	auipc	a0,0x7
8040e898:	b3450513          	addi	a0,a0,-1228 # 804153c8 <syscalls+0xa20>
8040e89c:	d89f10ef          	jal	ra,80400624 <__panic>

8040e8a0 <dev_init>:
8040e8a0:	ff010113          	addi	sp,sp,-16
8040e8a4:	00112623          	sw	ra,12(sp)
8040e8a8:	700000ef          	jal	ra,8040efa8 <dev_init_stdin>
8040e8ac:	081000ef          	jal	ra,8040f12c <dev_init_stdout>
8040e8b0:	00c12083          	lw	ra,12(sp)
8040e8b4:	01010113          	addi	sp,sp,16
8040e8b8:	2bc0006f          	j	8040eb74 <dev_init_disk0>

8040e8bc <dev_create_inode>:
8040e8bc:	00001537          	lui	a0,0x1
8040e8c0:	ff010113          	addi	sp,sp,-16
8040e8c4:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e8c8:	00812423          	sw	s0,8(sp)
8040e8cc:	00112623          	sw	ra,12(sp)
8040e8d0:	9a1fe0ef          	jal	ra,8040d270 <__alloc_inode>
8040e8d4:	00050413          	mv	s0,a0
8040e8d8:	00050a63          	beqz	a0,8040e8ec <dev_create_inode+0x30>
8040e8dc:	00000613          	li	a2,0
8040e8e0:	00007597          	auipc	a1,0x7
8040e8e4:	afc58593          	addi	a1,a1,-1284 # 804153dc <dev_node_ops>
8040e8e8:	9b9fe0ef          	jal	ra,8040d2a0 <inode_init>
8040e8ec:	00040513          	mv	a0,s0
8040e8f0:	00c12083          	lw	ra,12(sp)
8040e8f4:	00812403          	lw	s0,8(sp)
8040e8f8:	01010113          	addi	sp,sp,16
8040e8fc:	00008067          	ret

8040e900 <disk0_open>:
8040e900:	00000513          	li	a0,0
8040e904:	00008067          	ret

8040e908 <disk0_close>:
8040e908:	00000513          	li	a0,0
8040e90c:	00008067          	ret

8040e910 <disk0_ioctl>:
8040e910:	fec00513          	li	a0,-20
8040e914:	00008067          	ret

8040e918 <disk0_io>:
8040e918:	fc010113          	addi	sp,sp,-64
8040e91c:	0045a703          	lw	a4,4(a1)
8040e920:	02812c23          	sw	s0,56(sp)
8040e924:	00c5a403          	lw	s0,12(a1)
8040e928:	000016b7          	lui	a3,0x1
8040e92c:	03312623          	sw	s3,44(sp)
8040e930:	03612023          	sw	s6,32(sp)
8040e934:	41f75993          	srai	s3,a4,0x1f
8040e938:	fff68b13          	addi	s6,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040e93c:	008767b3          	or	a5,a4,s0
8040e940:	0169f9b3          	and	s3,s3,s6
8040e944:	02112e23          	sw	ra,60(sp)
8040e948:	02912a23          	sw	s1,52(sp)
8040e94c:	03212823          	sw	s2,48(sp)
8040e950:	03412423          	sw	s4,40(sp)
8040e954:	03512223          	sw	s5,36(sp)
8040e958:	01712e23          	sw	s7,28(sp)
8040e95c:	01812c23          	sw	s8,24(sp)
8040e960:	01912a23          	sw	s9,20(sp)
8040e964:	01a12823          	sw	s10,16(sp)
8040e968:	0167f7b3          	and	a5,a5,s6
8040e96c:	00e989b3          	add	s3,s3,a4
8040e970:	16079263          	bnez	a5,8040ead4 <disk0_io+0x1bc>
8040e974:	00052783          	lw	a5,0(a0)
8040e978:	40c9d993          	srai	s3,s3,0xc
8040e97c:	00c45713          	srli	a4,s0,0xc
8040e980:	00e98733          	add	a4,s3,a4
8040e984:	14e7e863          	bltu	a5,a4,8040ead4 <disk0_io+0x1bc>
8040e988:	00000513          	li	a0,0
8040e98c:	02d47e63          	bgeu	s0,a3,8040e9c8 <disk0_io+0xb0>
8040e990:	03c12083          	lw	ra,60(sp)
8040e994:	03812403          	lw	s0,56(sp)
8040e998:	03412483          	lw	s1,52(sp)
8040e99c:	03012903          	lw	s2,48(sp)
8040e9a0:	02c12983          	lw	s3,44(sp)
8040e9a4:	02812a03          	lw	s4,40(sp)
8040e9a8:	02412a83          	lw	s5,36(sp)
8040e9ac:	02012b03          	lw	s6,32(sp)
8040e9b0:	01c12b83          	lw	s7,28(sp)
8040e9b4:	01812c03          	lw	s8,24(sp)
8040e9b8:	01412c83          	lw	s9,20(sp)
8040e9bc:	01012d03          	lw	s10,16(sp)
8040e9c0:	04010113          	addi	sp,sp,64
8040e9c4:	00008067          	ret
8040e9c8:	0008d517          	auipc	a0,0x8d
8040e9cc:	dac50513          	addi	a0,a0,-596 # 8049b774 <disk0_sem>
8040e9d0:	00060c13          	mv	s8,a2
8040e9d4:	00058b93          	mv	s7,a1
8040e9d8:	0008ea17          	auipc	s4,0x8e
8040e9dc:	e00a0a13          	addi	s4,s4,-512 # 8049c7d8 <disk0_buffer>
8040e9e0:	ee0f60ef          	jal	ra,804050c0 <down>
8040e9e4:	00004cb7          	lui	s9,0x4
8040e9e8:	0600006f          	j	8040ea48 <disk0_io+0x130>
8040e9ec:	00c45493          	srli	s1,s0,0xc
8040e9f0:	00349d13          	slli	s10,s1,0x3
8040e9f4:	00040913          	mv	s2,s0
8040e9f8:	00399a93          	slli	s5,s3,0x3
8040e9fc:	00058613          	mv	a2,a1
8040ea00:	000d0693          	mv	a3,s10
8040ea04:	000a8593          	mv	a1,s5
8040ea08:	00200513          	li	a0,2
8040ea0c:	8d4f20ef          	jal	ra,80400ae0 <ide_read_secs>
8040ea10:	10051663          	bnez	a0,8040eb1c <disk0_io+0x204>
8040ea14:	000a2583          	lw	a1,0(s4)
8040ea18:	00c10713          	addi	a4,sp,12
8040ea1c:	00100693          	li	a3,1
8040ea20:	00090613          	mv	a2,s2
8040ea24:	000b8513          	mv	a0,s7
8040ea28:	b01f70ef          	jal	ra,80406528 <iobuf_move>
8040ea2c:	00c12783          	lw	a5,12(sp)
8040ea30:	0b279663          	bne	a5,s2,8040eadc <disk0_io+0x1c4>
8040ea34:	016977b3          	and	a5,s2,s6
8040ea38:	0a079263          	bnez	a5,8040eadc <disk0_io+0x1c4>
8040ea3c:	41240433          	sub	s0,s0,s2
8040ea40:	009989b3          	add	s3,s3,s1
8040ea44:	06040e63          	beqz	s0,8040eac0 <disk0_io+0x1a8>
8040ea48:	000a2583          	lw	a1,0(s4)
8040ea4c:	000c1c63          	bnez	s8,8040ea64 <disk0_io+0x14c>
8040ea50:	f9946ee3          	bltu	s0,s9,8040e9ec <disk0_io+0xd4>
8040ea54:	02000d13          	li	s10,32
8040ea58:	00400493          	li	s1,4
8040ea5c:	00004937          	lui	s2,0x4
8040ea60:	f99ff06f          	j	8040e9f8 <disk0_io+0xe0>
8040ea64:	00c10713          	addi	a4,sp,12
8040ea68:	00000693          	li	a3,0
8040ea6c:	00004637          	lui	a2,0x4
8040ea70:	000b8513          	mv	a0,s7
8040ea74:	ab5f70ef          	jal	ra,80406528 <iobuf_move>
8040ea78:	00c12483          	lw	s1,12(sp)
8040ea7c:	08048063          	beqz	s1,8040eafc <disk0_io+0x1e4>
8040ea80:	06946e63          	bltu	s0,s1,8040eafc <disk0_io+0x1e4>
8040ea84:	0164f7b3          	and	a5,s1,s6
8040ea88:	06079a63          	bnez	a5,8040eafc <disk0_io+0x1e4>
8040ea8c:	00c4d493          	srli	s1,s1,0xc
8040ea90:	000a2603          	lw	a2,0(s4)
8040ea94:	00399913          	slli	s2,s3,0x3
8040ea98:	00349a93          	slli	s5,s1,0x3
8040ea9c:	000a8693          	mv	a3,s5
8040eaa0:	00090593          	mv	a1,s2
8040eaa4:	00200513          	li	a0,2
8040eaa8:	8d0f20ef          	jal	ra,80400b78 <ide_write_secs>
8040eaac:	08051e63          	bnez	a0,8040eb48 <disk0_io+0x230>
8040eab0:	00c12903          	lw	s2,12(sp)
8040eab4:	009989b3          	add	s3,s3,s1
8040eab8:	41240433          	sub	s0,s0,s2
8040eabc:	f80416e3          	bnez	s0,8040ea48 <disk0_io+0x130>
8040eac0:	0008d517          	auipc	a0,0x8d
8040eac4:	cb450513          	addi	a0,a0,-844 # 8049b774 <disk0_sem>
8040eac8:	df4f60ef          	jal	ra,804050bc <up>
8040eacc:	00000513          	li	a0,0
8040ead0:	ec1ff06f          	j	8040e990 <disk0_io+0x78>
8040ead4:	ffd00513          	li	a0,-3
8040ead8:	eb9ff06f          	j	8040e990 <disk0_io+0x78>
8040eadc:	00007697          	auipc	a3,0x7
8040eae0:	aac68693          	addi	a3,a3,-1364 # 80415588 <dev_node_ops+0x1ac>
8040eae4:	00004617          	auipc	a2,0x4
8040eae8:	05860613          	addi	a2,a2,88 # 80412b3c <commands+0x1bc>
8040eaec:	06200593          	li	a1,98
8040eaf0:	00007517          	auipc	a0,0x7
8040eaf4:	9e850513          	addi	a0,a0,-1560 # 804154d8 <dev_node_ops+0xfc>
8040eaf8:	b2df10ef          	jal	ra,80400624 <__panic>
8040eafc:	00007697          	auipc	a3,0x7
8040eb00:	99c68693          	addi	a3,a3,-1636 # 80415498 <dev_node_ops+0xbc>
8040eb04:	00004617          	auipc	a2,0x4
8040eb08:	03860613          	addi	a2,a2,56 # 80412b3c <commands+0x1bc>
8040eb0c:	05700593          	li	a1,87
8040eb10:	00007517          	auipc	a0,0x7
8040eb14:	9c850513          	addi	a0,a0,-1592 # 804154d8 <dev_node_ops+0xfc>
8040eb18:	b0df10ef          	jal	ra,80400624 <__panic>
8040eb1c:	00050893          	mv	a7,a0
8040eb20:	000d0813          	mv	a6,s10
8040eb24:	00048793          	mv	a5,s1
8040eb28:	000a8713          	mv	a4,s5
8040eb2c:	00098693          	mv	a3,s3
8040eb30:	00007617          	auipc	a2,0x7
8040eb34:	a1060613          	addi	a2,a2,-1520 # 80415540 <dev_node_ops+0x164>
8040eb38:	02e00593          	li	a1,46
8040eb3c:	00007517          	auipc	a0,0x7
8040eb40:	99c50513          	addi	a0,a0,-1636 # 804154d8 <dev_node_ops+0xfc>
8040eb44:	ae1f10ef          	jal	ra,80400624 <__panic>
8040eb48:	00050893          	mv	a7,a0
8040eb4c:	000a8813          	mv	a6,s5
8040eb50:	00048793          	mv	a5,s1
8040eb54:	00090713          	mv	a4,s2
8040eb58:	00098693          	mv	a3,s3
8040eb5c:	00007617          	auipc	a2,0x7
8040eb60:	99860613          	addi	a2,a2,-1640 # 804154f4 <dev_node_ops+0x118>
8040eb64:	03800593          	li	a1,56
8040eb68:	00007517          	auipc	a0,0x7
8040eb6c:	97050513          	addi	a0,a0,-1680 # 804154d8 <dev_node_ops+0xfc>
8040eb70:	ab5f10ef          	jal	ra,80400624 <__panic>

8040eb74 <dev_init_disk0>:
8040eb74:	ff010113          	addi	sp,sp,-16
8040eb78:	00112623          	sw	ra,12(sp)
8040eb7c:	00812423          	sw	s0,8(sp)
8040eb80:	00912223          	sw	s1,4(sp)
8040eb84:	d39ff0ef          	jal	ra,8040e8bc <dev_create_inode>
8040eb88:	0a050c63          	beqz	a0,8040ec40 <dev_init_disk0+0xcc>
8040eb8c:	02c52703          	lw	a4,44(a0)
8040eb90:	000014b7          	lui	s1,0x1
8040eb94:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040eb98:	00050413          	mv	s0,a0
8040eb9c:	10f71463          	bne	a4,a5,8040eca4 <dev_init_disk0+0x130>
8040eba0:	00200513          	li	a0,2
8040eba4:	ed1f10ef          	jal	ra,80400a74 <ide_device_valid>
8040eba8:	0e050263          	beqz	a0,8040ec8c <dev_init_disk0+0x118>
8040ebac:	00200513          	li	a0,2
8040ebb0:	ef9f10ef          	jal	ra,80400aa8 <ide_device_size>
8040ebb4:	00355793          	srli	a5,a0,0x3
8040ebb8:	00f42023          	sw	a5,0(s0)
8040ebbc:	00000797          	auipc	a5,0x0
8040ebc0:	d4478793          	addi	a5,a5,-700 # 8040e900 <disk0_open>
8040ebc4:	00f42423          	sw	a5,8(s0)
8040ebc8:	00000797          	auipc	a5,0x0
8040ebcc:	d4078793          	addi	a5,a5,-704 # 8040e908 <disk0_close>
8040ebd0:	00f42623          	sw	a5,12(s0)
8040ebd4:	00000797          	auipc	a5,0x0
8040ebd8:	d4478793          	addi	a5,a5,-700 # 8040e918 <disk0_io>
8040ebdc:	00f42823          	sw	a5,16(s0)
8040ebe0:	00000797          	auipc	a5,0x0
8040ebe4:	d3078793          	addi	a5,a5,-720 # 8040e910 <disk0_ioctl>
8040ebe8:	00f42a23          	sw	a5,20(s0)
8040ebec:	00100593          	li	a1,1
8040ebf0:	0008d517          	auipc	a0,0x8d
8040ebf4:	b8450513          	addi	a0,a0,-1148 # 8049b774 <disk0_sem>
8040ebf8:	00942223          	sw	s1,4(s0)
8040ebfc:	cb4f60ef          	jal	ra,804050b0 <sem_init>
8040ec00:	00004537          	lui	a0,0x4
8040ec04:	d81f30ef          	jal	ra,80402984 <kmalloc>
8040ec08:	0008e797          	auipc	a5,0x8e
8040ec0c:	bca7a823          	sw	a0,-1072(a5) # 8049c7d8 <disk0_buffer>
8040ec10:	06050263          	beqz	a0,8040ec74 <dev_init_disk0+0x100>
8040ec14:	00100613          	li	a2,1
8040ec18:	00040593          	mv	a1,s0
8040ec1c:	00007517          	auipc	a0,0x7
8040ec20:	85850513          	addi	a0,a0,-1960 # 80415474 <dev_node_ops+0x98>
8040ec24:	f8dfe0ef          	jal	ra,8040dbb0 <vfs_add_dev>
8040ec28:	02051863          	bnez	a0,8040ec58 <dev_init_disk0+0xe4>
8040ec2c:	00c12083          	lw	ra,12(sp)
8040ec30:	00812403          	lw	s0,8(sp)
8040ec34:	00412483          	lw	s1,4(sp)
8040ec38:	01010113          	addi	sp,sp,16
8040ec3c:	00008067          	ret
8040ec40:	00006617          	auipc	a2,0x6
8040ec44:	7dc60613          	addi	a2,a2,2012 # 8041541c <dev_node_ops+0x40>
8040ec48:	08700593          	li	a1,135
8040ec4c:	00007517          	auipc	a0,0x7
8040ec50:	88c50513          	addi	a0,a0,-1908 # 804154d8 <dev_node_ops+0xfc>
8040ec54:	9d1f10ef          	jal	ra,80400624 <__panic>
8040ec58:	00050693          	mv	a3,a0
8040ec5c:	00007617          	auipc	a2,0x7
8040ec60:	82060613          	addi	a2,a2,-2016 # 8041547c <dev_node_ops+0xa0>
8040ec64:	08d00593          	li	a1,141
8040ec68:	00007517          	auipc	a0,0x7
8040ec6c:	87050513          	addi	a0,a0,-1936 # 804154d8 <dev_node_ops+0xfc>
8040ec70:	9b5f10ef          	jal	ra,80400624 <__panic>
8040ec74:	00006617          	auipc	a2,0x6
8040ec78:	7e460613          	addi	a2,a2,2020 # 80415458 <dev_node_ops+0x7c>
8040ec7c:	07f00593          	li	a1,127
8040ec80:	00007517          	auipc	a0,0x7
8040ec84:	85850513          	addi	a0,a0,-1960 # 804154d8 <dev_node_ops+0xfc>
8040ec88:	99df10ef          	jal	ra,80400624 <__panic>
8040ec8c:	00006617          	auipc	a2,0x6
8040ec90:	7ac60613          	addi	a2,a2,1964 # 80415438 <dev_node_ops+0x5c>
8040ec94:	07300593          	li	a1,115
8040ec98:	00007517          	auipc	a0,0x7
8040ec9c:	84050513          	addi	a0,a0,-1984 # 804154d8 <dev_node_ops+0xfc>
8040eca0:	985f10ef          	jal	ra,80400624 <__panic>
8040eca4:	00006697          	auipc	a3,0x6
8040eca8:	44068693          	addi	a3,a3,1088 # 804150e4 <syscalls+0x73c>
8040ecac:	00004617          	auipc	a2,0x4
8040ecb0:	e9060613          	addi	a2,a2,-368 # 80412b3c <commands+0x1bc>
8040ecb4:	08900593          	li	a1,137
8040ecb8:	00007517          	auipc	a0,0x7
8040ecbc:	82050513          	addi	a0,a0,-2016 # 804154d8 <dev_node_ops+0xfc>
8040ecc0:	965f10ef          	jal	ra,80400624 <__panic>

8040ecc4 <stdin_open>:
8040ecc4:	00000513          	li	a0,0
8040ecc8:	00059463          	bnez	a1,8040ecd0 <stdin_open+0xc>
8040eccc:	00008067          	ret
8040ecd0:	ffd00513          	li	a0,-3
8040ecd4:	00008067          	ret

8040ecd8 <stdin_close>:
8040ecd8:	00000513          	li	a0,0
8040ecdc:	00008067          	ret

8040ece0 <stdin_ioctl>:
8040ece0:	ffd00513          	li	a0,-3
8040ece4:	00008067          	ret

8040ece8 <stdin_io>:
8040ece8:	fb010113          	addi	sp,sp,-80
8040ecec:	04112623          	sw	ra,76(sp)
8040ecf0:	04812423          	sw	s0,72(sp)
8040ecf4:	04912223          	sw	s1,68(sp)
8040ecf8:	05212023          	sw	s2,64(sp)
8040ecfc:	03312e23          	sw	s3,60(sp)
8040ed00:	03412c23          	sw	s4,56(sp)
8040ed04:	03512a23          	sw	s5,52(sp)
8040ed08:	03612823          	sw	s6,48(sp)
8040ed0c:	03712623          	sw	s7,44(sp)
8040ed10:	03812423          	sw	s8,40(sp)
8040ed14:	03912223          	sw	s9,36(sp)
8040ed18:	1a061063          	bnez	a2,8040eeb8 <stdin_io+0x1d0>
8040ed1c:	00058493          	mv	s1,a1
8040ed20:	0005ac83          	lw	s9,0(a1)
8040ed24:	00c5ac03          	lw	s8,12(a1)
8040ed28:	100027f3          	csrr	a5,sstatus
8040ed2c:	0027f793          	andi	a5,a5,2
8040ed30:	16079863          	bnez	a5,8040eea0 <stdin_io+0x1b8>
8040ed34:	00000913          	li	s2,0
8040ed38:	160c0063          	beqz	s8,8040ee98 <stdin_io+0x1b0>
8040ed3c:	0008eb97          	auipc	s7,0x8e
8040ed40:	aa8b8b93          	addi	s7,s7,-1368 # 8049c7e4 <p_rpos>
8040ed44:	000ba783          	lw	a5,0(s7)
8040ed48:	800009b7          	lui	s3,0x80000
8040ed4c:	00001a37          	lui	s4,0x1
8040ed50:	00000413          	li	s0,0
8040ed54:	0008eb17          	auipc	s6,0x8e
8040ed58:	a94b0b13          	addi	s6,s6,-1388 # 8049c7e8 <p_wpos>
8040ed5c:	00498993          	addi	s3,s3,4 # 80000004 <end+0xffb63748>
8040ed60:	0008ea97          	auipc	s5,0x8e
8040ed64:	a7ca8a93          	addi	s5,s5,-1412 # 8049c7dc <__wait_queue>
8040ed68:	fffa0a13          	addi	s4,s4,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040ed6c:	000b2703          	lw	a4,0(s6)
8040ed70:	02e7de63          	bge	a5,a4,8040edac <stdin_io+0xc4>
8040ed74:	0d80006f          	j	8040ee4c <stdin_io+0x164>
8040ed78:	c55fd0ef          	jal	ra,8040c9cc <schedule>
8040ed7c:	100027f3          	csrr	a5,sstatus
8040ed80:	0027f793          	andi	a5,a5,2
8040ed84:	00000913          	li	s2,0
8040ed88:	04079863          	bnez	a5,8040edd8 <stdin_io+0xf0>
8040ed8c:	00c10513          	addi	a0,sp,12
8040ed90:	c28f60ef          	jal	ra,804051b8 <wait_in_queue>
8040ed94:	04051c63          	bnez	a0,8040edec <stdin_io+0x104>
8040ed98:	01012783          	lw	a5,16(sp)
8040ed9c:	07379263          	bne	a5,s3,8040ee00 <stdin_io+0x118>
8040eda0:	000ba783          	lw	a5,0(s7)
8040eda4:	000b2703          	lw	a4,0(s6)
8040eda8:	0ae7c263          	blt	a5,a4,8040ee4c <stdin_io+0x164>
8040edac:	00098613          	mv	a2,s3
8040edb0:	00c10593          	addi	a1,sp,12
8040edb4:	000a8513          	mv	a0,s5
8040edb8:	cf8f60ef          	jal	ra,804052b0 <wait_current_set>
8040edbc:	fa090ee3          	beqz	s2,8040ed78 <stdin_io+0x90>
8040edc0:	e51f10ef          	jal	ra,80400c10 <intr_enable>
8040edc4:	c09fd0ef          	jal	ra,8040c9cc <schedule>
8040edc8:	100027f3          	csrr	a5,sstatus
8040edcc:	0027f793          	andi	a5,a5,2
8040edd0:	00000913          	li	s2,0
8040edd4:	fa078ce3          	beqz	a5,8040ed8c <stdin_io+0xa4>
8040edd8:	e41f10ef          	jal	ra,80400c18 <intr_disable>
8040eddc:	00c10513          	addi	a0,sp,12
8040ede0:	00100913          	li	s2,1
8040ede4:	bd4f60ef          	jal	ra,804051b8 <wait_in_queue>
8040ede8:	fa0508e3          	beqz	a0,8040ed98 <stdin_io+0xb0>
8040edec:	00c10593          	addi	a1,sp,12
8040edf0:	000a8513          	mv	a0,s5
8040edf4:	b64f60ef          	jal	ra,80405158 <wait_queue_del>
8040edf8:	01012783          	lw	a5,16(sp)
8040edfc:	fb3782e3          	beq	a5,s3,8040eda0 <stdin_io+0xb8>
8040ee00:	08091863          	bnez	s2,8040ee90 <stdin_io+0x1a8>
8040ee04:	08040a63          	beqz	s0,8040ee98 <stdin_io+0x1b0>
8040ee08:	00c4a783          	lw	a5,12(s1)
8040ee0c:	408787b3          	sub	a5,a5,s0
8040ee10:	00f4a623          	sw	a5,12(s1)
8040ee14:	00040513          	mv	a0,s0
8040ee18:	04c12083          	lw	ra,76(sp)
8040ee1c:	04812403          	lw	s0,72(sp)
8040ee20:	04412483          	lw	s1,68(sp)
8040ee24:	04012903          	lw	s2,64(sp)
8040ee28:	03c12983          	lw	s3,60(sp)
8040ee2c:	03812a03          	lw	s4,56(sp)
8040ee30:	03412a83          	lw	s5,52(sp)
8040ee34:	03012b03          	lw	s6,48(sp)
8040ee38:	02c12b83          	lw	s7,44(sp)
8040ee3c:	02812c03          	lw	s8,40(sp)
8040ee40:	02412c83          	lw	s9,36(sp)
8040ee44:	05010113          	addi	sp,sp,80
8040ee48:	00008067          	ret
8040ee4c:	41f7d713          	srai	a4,a5,0x1f
8040ee50:	01475693          	srli	a3,a4,0x14
8040ee54:	00d78733          	add	a4,a5,a3
8040ee58:	01477733          	and	a4,a4,s4
8040ee5c:	40d70733          	sub	a4,a4,a3
8040ee60:	0008d697          	auipc	a3,0x8d
8040ee64:	92068693          	addi	a3,a3,-1760 # 8049b780 <stdin_buffer>
8040ee68:	00e68733          	add	a4,a3,a4
8040ee6c:	00074683          	lbu	a3,0(a4)
8040ee70:	00178793          	addi	a5,a5,1
8040ee74:	008c8733          	add	a4,s9,s0
8040ee78:	00d70023          	sb	a3,0(a4)
8040ee7c:	00140413          	addi	s0,s0,1
8040ee80:	0008e717          	auipc	a4,0x8e
8040ee84:	96f72223          	sw	a5,-1692(a4) # 8049c7e4 <p_rpos>
8040ee88:	ef8462e3          	bltu	s0,s8,8040ed6c <stdin_io+0x84>
8040ee8c:	f6090ee3          	beqz	s2,8040ee08 <stdin_io+0x120>
8040ee90:	d81f10ef          	jal	ra,80400c10 <intr_enable>
8040ee94:	f6041ae3          	bnez	s0,8040ee08 <stdin_io+0x120>
8040ee98:	00000413          	li	s0,0
8040ee9c:	f79ff06f          	j	8040ee14 <stdin_io+0x12c>
8040eea0:	d79f10ef          	jal	ra,80400c18 <intr_disable>
8040eea4:	00100913          	li	s2,1
8040eea8:	e80c1ae3          	bnez	s8,8040ed3c <stdin_io+0x54>
8040eeac:	d65f10ef          	jal	ra,80400c10 <intr_enable>
8040eeb0:	00000413          	li	s0,0
8040eeb4:	f61ff06f          	j	8040ee14 <stdin_io+0x12c>
8040eeb8:	ffd00413          	li	s0,-3
8040eebc:	f59ff06f          	j	8040ee14 <stdin_io+0x12c>

8040eec0 <dev_stdin_write>:
8040eec0:	00051463          	bnez	a0,8040eec8 <dev_stdin_write+0x8>
8040eec4:	00008067          	ret
8040eec8:	ff010113          	addi	sp,sp,-16
8040eecc:	00912223          	sw	s1,4(sp)
8040eed0:	00112623          	sw	ra,12(sp)
8040eed4:	00812423          	sw	s0,8(sp)
8040eed8:	00050493          	mv	s1,a0
8040eedc:	100027f3          	csrr	a5,sstatus
8040eee0:	0027f793          	andi	a5,a5,2
8040eee4:	00000413          	li	s0,0
8040eee8:	0a079a63          	bnez	a5,8040ef9c <dev_stdin_write+0xdc>
8040eeec:	0008e797          	auipc	a5,0x8e
8040eef0:	8fc78793          	addi	a5,a5,-1796 # 8049c7e8 <p_wpos>
8040eef4:	0007a703          	lw	a4,0(a5)
8040eef8:	000015b7          	lui	a1,0x1
8040eefc:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040ef00:	41f75693          	srai	a3,a4,0x1f
8040ef04:	0146d693          	srli	a3,a3,0x14
8040ef08:	00d707b3          	add	a5,a4,a3
8040ef0c:	00c7f7b3          	and	a5,a5,a2
8040ef10:	0008e617          	auipc	a2,0x8e
8040ef14:	8d460613          	addi	a2,a2,-1836 # 8049c7e4 <p_rpos>
8040ef18:	00062603          	lw	a2,0(a2)
8040ef1c:	40d787b3          	sub	a5,a5,a3
8040ef20:	0008d697          	auipc	a3,0x8d
8040ef24:	86068693          	addi	a3,a3,-1952 # 8049b780 <stdin_buffer>
8040ef28:	00f687b3          	add	a5,a3,a5
8040ef2c:	00978023          	sb	s1,0(a5)
8040ef30:	40c707b3          	sub	a5,a4,a2
8040ef34:	00b7d863          	bge	a5,a1,8040ef44 <dev_stdin_write+0x84>
8040ef38:	00170713          	addi	a4,a4,1
8040ef3c:	0008e797          	auipc	a5,0x8e
8040ef40:	8ae7a623          	sw	a4,-1876(a5) # 8049c7e8 <p_wpos>
8040ef44:	0008e517          	auipc	a0,0x8e
8040ef48:	89850513          	addi	a0,a0,-1896 # 8049c7dc <__wait_queue>
8040ef4c:	a5cf60ef          	jal	ra,804051a8 <wait_queue_empty>
8040ef50:	00050e63          	beqz	a0,8040ef6c <dev_stdin_write+0xac>
8040ef54:	02041a63          	bnez	s0,8040ef88 <dev_stdin_write+0xc8>
8040ef58:	00c12083          	lw	ra,12(sp)
8040ef5c:	00812403          	lw	s0,8(sp)
8040ef60:	00412483          	lw	s1,4(sp)
8040ef64:	01010113          	addi	sp,sp,16
8040ef68:	00008067          	ret
8040ef6c:	800005b7          	lui	a1,0x80000
8040ef70:	00100613          	li	a2,1
8040ef74:	00458593          	addi	a1,a1,4 # 80000004 <end+0xffb63748>
8040ef78:	0008e517          	auipc	a0,0x8e
8040ef7c:	86450513          	addi	a0,a0,-1948 # 8049c7dc <__wait_queue>
8040ef80:	a90f60ef          	jal	ra,80405210 <wakeup_queue>
8040ef84:	fc040ae3          	beqz	s0,8040ef58 <dev_stdin_write+0x98>
8040ef88:	00812403          	lw	s0,8(sp)
8040ef8c:	00c12083          	lw	ra,12(sp)
8040ef90:	00412483          	lw	s1,4(sp)
8040ef94:	01010113          	addi	sp,sp,16
8040ef98:	c79f106f          	j	80400c10 <intr_enable>
8040ef9c:	c7df10ef          	jal	ra,80400c18 <intr_disable>
8040efa0:	00100413          	li	s0,1
8040efa4:	f49ff06f          	j	8040eeec <dev_stdin_write+0x2c>

8040efa8 <dev_init_stdin>:
8040efa8:	ff010113          	addi	sp,sp,-16
8040efac:	00112623          	sw	ra,12(sp)
8040efb0:	00812423          	sw	s0,8(sp)
8040efb4:	909ff0ef          	jal	ra,8040e8bc <dev_create_inode>
8040efb8:	08050c63          	beqz	a0,8040f050 <dev_init_stdin+0xa8>
8040efbc:	02c52703          	lw	a4,44(a0)
8040efc0:	000017b7          	lui	a5,0x1
8040efc4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040efc8:	00050413          	mv	s0,a0
8040efcc:	0af71c63          	bne	a4,a5,8040f084 <dev_init_stdin+0xdc>
8040efd0:	00100793          	li	a5,1
8040efd4:	00f42223          	sw	a5,4(s0)
8040efd8:	00000797          	auipc	a5,0x0
8040efdc:	cec78793          	addi	a5,a5,-788 # 8040ecc4 <stdin_open>
8040efe0:	00f42423          	sw	a5,8(s0)
8040efe4:	00000797          	auipc	a5,0x0
8040efe8:	cf478793          	addi	a5,a5,-780 # 8040ecd8 <stdin_close>
8040efec:	00f42623          	sw	a5,12(s0)
8040eff0:	00000797          	auipc	a5,0x0
8040eff4:	cf878793          	addi	a5,a5,-776 # 8040ece8 <stdin_io>
8040eff8:	00f42823          	sw	a5,16(s0)
8040effc:	00000797          	auipc	a5,0x0
8040f000:	ce478793          	addi	a5,a5,-796 # 8040ece0 <stdin_ioctl>
8040f004:	00f42a23          	sw	a5,20(s0)
8040f008:	0008d517          	auipc	a0,0x8d
8040f00c:	7d450513          	addi	a0,a0,2004 # 8049c7dc <__wait_queue>
8040f010:	00042023          	sw	zero,0(s0)
8040f014:	0008d797          	auipc	a5,0x8d
8040f018:	7c07aa23          	sw	zero,2004(a5) # 8049c7e8 <p_wpos>
8040f01c:	0008d797          	auipc	a5,0x8d
8040f020:	7c07a423          	sw	zero,1992(a5) # 8049c7e4 <p_rpos>
8040f024:	928f60ef          	jal	ra,8040514c <wait_queue_init>
8040f028:	00000613          	li	a2,0
8040f02c:	00040593          	mv	a1,s0
8040f030:	00006517          	auipc	a0,0x6
8040f034:	5c050513          	addi	a0,a0,1472 # 804155f0 <dev_node_ops+0x214>
8040f038:	b79fe0ef          	jal	ra,8040dbb0 <vfs_add_dev>
8040f03c:	02051663          	bnez	a0,8040f068 <dev_init_stdin+0xc0>
8040f040:	00c12083          	lw	ra,12(sp)
8040f044:	00812403          	lw	s0,8(sp)
8040f048:	01010113          	addi	sp,sp,16
8040f04c:	00008067          	ret
8040f050:	00006617          	auipc	a2,0x6
8040f054:	56860613          	addi	a2,a2,1384 # 804155b8 <dev_node_ops+0x1dc>
8040f058:	07500593          	li	a1,117
8040f05c:	00006517          	auipc	a0,0x6
8040f060:	57850513          	addi	a0,a0,1400 # 804155d4 <dev_node_ops+0x1f8>
8040f064:	dc0f10ef          	jal	ra,80400624 <__panic>
8040f068:	00050693          	mv	a3,a0
8040f06c:	00006617          	auipc	a2,0x6
8040f070:	58c60613          	addi	a2,a2,1420 # 804155f8 <dev_node_ops+0x21c>
8040f074:	07b00593          	li	a1,123
8040f078:	00006517          	auipc	a0,0x6
8040f07c:	55c50513          	addi	a0,a0,1372 # 804155d4 <dev_node_ops+0x1f8>
8040f080:	da4f10ef          	jal	ra,80400624 <__panic>
8040f084:	00006697          	auipc	a3,0x6
8040f088:	06068693          	addi	a3,a3,96 # 804150e4 <syscalls+0x73c>
8040f08c:	00004617          	auipc	a2,0x4
8040f090:	ab060613          	addi	a2,a2,-1360 # 80412b3c <commands+0x1bc>
8040f094:	07700593          	li	a1,119
8040f098:	00006517          	auipc	a0,0x6
8040f09c:	53c50513          	addi	a0,a0,1340 # 804155d4 <dev_node_ops+0x1f8>
8040f0a0:	d84f10ef          	jal	ra,80400624 <__panic>

8040f0a4 <stdout_open>:
8040f0a4:	00100793          	li	a5,1
8040f0a8:	00000513          	li	a0,0
8040f0ac:	00f59463          	bne	a1,a5,8040f0b4 <stdout_open+0x10>
8040f0b0:	00008067          	ret
8040f0b4:	ffd00513          	li	a0,-3
8040f0b8:	00008067          	ret

8040f0bc <stdout_close>:
8040f0bc:	00000513          	li	a0,0
8040f0c0:	00008067          	ret

8040f0c4 <stdout_ioctl>:
8040f0c4:	ffd00513          	li	a0,-3
8040f0c8:	00008067          	ret

8040f0cc <stdout_io>:
8040f0cc:	04060c63          	beqz	a2,8040f124 <stdout_io+0x58>
8040f0d0:	00c5a783          	lw	a5,12(a1)
8040f0d4:	ff010113          	addi	sp,sp,-16
8040f0d8:	00812423          	sw	s0,8(sp)
8040f0dc:	00912223          	sw	s1,4(sp)
8040f0e0:	00112623          	sw	ra,12(sp)
8040f0e4:	00058493          	mv	s1,a1
8040f0e8:	0005a403          	lw	s0,0(a1)
8040f0ec:	02078063          	beqz	a5,8040f10c <stdout_io+0x40>
8040f0f0:	00140413          	addi	s0,s0,1
8040f0f4:	fff44503          	lbu	a0,-1(s0)
8040f0f8:	964f10ef          	jal	ra,8040025c <cputchar>
8040f0fc:	00c4a783          	lw	a5,12(s1)
8040f100:	fff78793          	addi	a5,a5,-1
8040f104:	00f4a623          	sw	a5,12(s1)
8040f108:	fe0794e3          	bnez	a5,8040f0f0 <stdout_io+0x24>
8040f10c:	00c12083          	lw	ra,12(sp)
8040f110:	00812403          	lw	s0,8(sp)
8040f114:	00412483          	lw	s1,4(sp)
8040f118:	00000513          	li	a0,0
8040f11c:	01010113          	addi	sp,sp,16
8040f120:	00008067          	ret
8040f124:	ffd00513          	li	a0,-3
8040f128:	00008067          	ret

8040f12c <dev_init_stdout>:
8040f12c:	ff010113          	addi	sp,sp,-16
8040f130:	00112623          	sw	ra,12(sp)
8040f134:	f88ff0ef          	jal	ra,8040e8bc <dev_create_inode>
8040f138:	06050a63          	beqz	a0,8040f1ac <dev_init_stdout+0x80>
8040f13c:	02c52703          	lw	a4,44(a0)
8040f140:	000017b7          	lui	a5,0x1
8040f144:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f148:	08f71c63          	bne	a4,a5,8040f1e0 <dev_init_stdout+0xb4>
8040f14c:	00100793          	li	a5,1
8040f150:	00f52223          	sw	a5,4(a0)
8040f154:	00000797          	auipc	a5,0x0
8040f158:	f5078793          	addi	a5,a5,-176 # 8040f0a4 <stdout_open>
8040f15c:	00f52423          	sw	a5,8(a0)
8040f160:	00000797          	auipc	a5,0x0
8040f164:	f5c78793          	addi	a5,a5,-164 # 8040f0bc <stdout_close>
8040f168:	00f52623          	sw	a5,12(a0)
8040f16c:	00000797          	auipc	a5,0x0
8040f170:	f6078793          	addi	a5,a5,-160 # 8040f0cc <stdout_io>
8040f174:	00f52823          	sw	a5,16(a0)
8040f178:	00000797          	auipc	a5,0x0
8040f17c:	f4c78793          	addi	a5,a5,-180 # 8040f0c4 <stdout_ioctl>
8040f180:	00052023          	sw	zero,0(a0)
8040f184:	00f52a23          	sw	a5,20(a0)
8040f188:	00050593          	mv	a1,a0
8040f18c:	00000613          	li	a2,0
8040f190:	00006517          	auipc	a0,0x6
8040f194:	4bc50513          	addi	a0,a0,1212 # 8041564c <dev_node_ops+0x270>
8040f198:	a19fe0ef          	jal	ra,8040dbb0 <vfs_add_dev>
8040f19c:	02051463          	bnez	a0,8040f1c4 <dev_init_stdout+0x98>
8040f1a0:	00c12083          	lw	ra,12(sp)
8040f1a4:	01010113          	addi	sp,sp,16
8040f1a8:	00008067          	ret
8040f1ac:	00006617          	auipc	a2,0x6
8040f1b0:	46860613          	addi	a2,a2,1128 # 80415614 <dev_node_ops+0x238>
8040f1b4:	03700593          	li	a1,55
8040f1b8:	00006517          	auipc	a0,0x6
8040f1bc:	47850513          	addi	a0,a0,1144 # 80415630 <dev_node_ops+0x254>
8040f1c0:	c64f10ef          	jal	ra,80400624 <__panic>
8040f1c4:	00050693          	mv	a3,a0
8040f1c8:	00006617          	auipc	a2,0x6
8040f1cc:	48c60613          	addi	a2,a2,1164 # 80415654 <dev_node_ops+0x278>
8040f1d0:	03d00593          	li	a1,61
8040f1d4:	00006517          	auipc	a0,0x6
8040f1d8:	45c50513          	addi	a0,a0,1116 # 80415630 <dev_node_ops+0x254>
8040f1dc:	c48f10ef          	jal	ra,80400624 <__panic>
8040f1e0:	00006697          	auipc	a3,0x6
8040f1e4:	f0468693          	addi	a3,a3,-252 # 804150e4 <syscalls+0x73c>
8040f1e8:	00004617          	auipc	a2,0x4
8040f1ec:	95460613          	addi	a2,a2,-1708 # 80412b3c <commands+0x1bc>
8040f1f0:	03900593          	li	a1,57
8040f1f4:	00006517          	auipc	a0,0x6
8040f1f8:	43c50513          	addi	a0,a0,1084 # 80415630 <dev_node_ops+0x254>
8040f1fc:	c28f10ef          	jal	ra,80400624 <__panic>

8040f200 <bitmap_translate.isra.0.part.1>:
8040f200:	ff010113          	addi	sp,sp,-16
8040f204:	00006697          	auipc	a3,0x6
8040f208:	4e468693          	addi	a3,a3,1252 # 804156e8 <dev_node_ops+0x30c>
8040f20c:	00004617          	auipc	a2,0x4
8040f210:	93060613          	addi	a2,a2,-1744 # 80412b3c <commands+0x1bc>
8040f214:	04c00593          	li	a1,76
8040f218:	00006517          	auipc	a0,0x6
8040f21c:	4e850513          	addi	a0,a0,1256 # 80415700 <dev_node_ops+0x324>
8040f220:	00112623          	sw	ra,12(sp)
8040f224:	c00f10ef          	jal	ra,80400624 <__panic>

8040f228 <bitmap_create>:
8040f228:	fe010113          	addi	sp,sp,-32
8040f22c:	00112e23          	sw	ra,28(sp)
8040f230:	00812c23          	sw	s0,24(sp)
8040f234:	00912a23          	sw	s1,20(sp)
8040f238:	01212823          	sw	s2,16(sp)
8040f23c:	01312623          	sw	s3,12(sp)
8040f240:	01412423          	sw	s4,8(sp)
8040f244:	fff50713          	addi	a4,a0,-1
8040f248:	fde00793          	li	a5,-34
8040f24c:	0ce7e663          	bltu	a5,a4,8040f318 <bitmap_create+0xf0>
8040f250:	00050413          	mv	s0,a0
8040f254:	00c00513          	li	a0,12
8040f258:	f2cf30ef          	jal	ra,80402984 <kmalloc>
8040f25c:	00050493          	mv	s1,a0
8040f260:	08050263          	beqz	a0,8040f2e4 <bitmap_create+0xbc>
8040f264:	01f40993          	addi	s3,s0,31
8040f268:	0059d913          	srli	s2,s3,0x5
8040f26c:	00291a13          	slli	s4,s2,0x2
8040f270:	000a0513          	mv	a0,s4
8040f274:	f10f30ef          	jal	ra,80402984 <kmalloc>
8040f278:	08050863          	beqz	a0,8040f308 <bitmap_create+0xe0>
8040f27c:	0084a023          	sw	s0,0(s1)
8040f280:	0124a223          	sw	s2,4(s1)
8040f284:	000a0613          	mv	a2,s4
8040f288:	0ff00593          	li	a1,255
8040f28c:	480030ef          	jal	ra,8041270c <memset>
8040f290:	00a4a423          	sw	a0,8(s1)
8040f294:	fe09f993          	andi	s3,s3,-32
8040f298:	04898663          	beq	s3,s0,8040f2e4 <bitmap_create+0xbc>
8040f29c:	fff90913          	addi	s2,s2,-1 # 3fff <_binary_bin_swap_img_size-0x4001>
8040f2a0:	00591793          	slli	a5,s2,0x5
8040f2a4:	00545713          	srli	a4,s0,0x5
8040f2a8:	40f407b3          	sub	a5,s0,a5
8040f2ac:	0b271663          	bne	a4,s2,8040f358 <bitmap_create+0x130>
8040f2b0:	fff78693          	addi	a3,a5,-1
8040f2b4:	01e00613          	li	a2,30
8040f2b8:	08d66063          	bltu	a2,a3,8040f338 <bitmap_create+0x110>
8040f2bc:	00271713          	slli	a4,a4,0x2
8040f2c0:	00e50533          	add	a0,a0,a4
8040f2c4:	00052703          	lw	a4,0(a0)
8040f2c8:	00100593          	li	a1,1
8040f2cc:	02000613          	li	a2,32
8040f2d0:	00f596b3          	sll	a3,a1,a5
8040f2d4:	00178793          	addi	a5,a5,1
8040f2d8:	00d74733          	xor	a4,a4,a3
8040f2dc:	fec79ae3          	bne	a5,a2,8040f2d0 <bitmap_create+0xa8>
8040f2e0:	00e52023          	sw	a4,0(a0)
8040f2e4:	01c12083          	lw	ra,28(sp)
8040f2e8:	01812403          	lw	s0,24(sp)
8040f2ec:	00048513          	mv	a0,s1
8040f2f0:	01012903          	lw	s2,16(sp)
8040f2f4:	01412483          	lw	s1,20(sp)
8040f2f8:	00c12983          	lw	s3,12(sp)
8040f2fc:	00812a03          	lw	s4,8(sp)
8040f300:	02010113          	addi	sp,sp,32
8040f304:	00008067          	ret
8040f308:	00048513          	mv	a0,s1
8040f30c:	f9cf30ef          	jal	ra,80402aa8 <kfree>
8040f310:	00000493          	li	s1,0
8040f314:	fd1ff06f          	j	8040f2e4 <bitmap_create+0xbc>
8040f318:	00006697          	auipc	a3,0x6
8040f31c:	35868693          	addi	a3,a3,856 # 80415670 <dev_node_ops+0x294>
8040f320:	00004617          	auipc	a2,0x4
8040f324:	81c60613          	addi	a2,a2,-2020 # 80412b3c <commands+0x1bc>
8040f328:	01500593          	li	a1,21
8040f32c:	00006517          	auipc	a0,0x6
8040f330:	3d450513          	addi	a0,a0,980 # 80415700 <dev_node_ops+0x324>
8040f334:	af0f10ef          	jal	ra,80400624 <__panic>
8040f338:	00006697          	auipc	a3,0x6
8040f33c:	37868693          	addi	a3,a3,888 # 804156b0 <dev_node_ops+0x2d4>
8040f340:	00003617          	auipc	a2,0x3
8040f344:	7fc60613          	addi	a2,a2,2044 # 80412b3c <commands+0x1bc>
8040f348:	02b00593          	li	a1,43
8040f34c:	00006517          	auipc	a0,0x6
8040f350:	3b450513          	addi	a0,a0,948 # 80415700 <dev_node_ops+0x324>
8040f354:	ad0f10ef          	jal	ra,80400624 <__panic>
8040f358:	00006697          	auipc	a3,0x6
8040f35c:	34068693          	addi	a3,a3,832 # 80415698 <dev_node_ops+0x2bc>
8040f360:	00003617          	auipc	a2,0x3
8040f364:	7dc60613          	addi	a2,a2,2012 # 80412b3c <commands+0x1bc>
8040f368:	02a00593          	li	a1,42
8040f36c:	00006517          	auipc	a0,0x6
8040f370:	39450513          	addi	a0,a0,916 # 80415700 <dev_node_ops+0x324>
8040f374:	ab0f10ef          	jal	ra,80400624 <__panic>

8040f378 <bitmap_alloc>:
8040f378:	00452603          	lw	a2,4(a0)
8040f37c:	00852803          	lw	a6,8(a0)
8040f380:	02060663          	beqz	a2,8040f3ac <bitmap_alloc+0x34>
8040f384:	00082703          	lw	a4,0(a6)
8040f388:	00480793          	addi	a5,a6,4
8040f38c:	00070c63          	beqz	a4,8040f3a4 <bitmap_alloc+0x2c>
8040f390:	0240006f          	j	8040f3b4 <bitmap_alloc+0x3c>
8040f394:	00078813          	mv	a6,a5
8040f398:	00478793          	addi	a5,a5,4
8040f39c:	ffc7a683          	lw	a3,-4(a5)
8040f3a0:	00069e63          	bnez	a3,8040f3bc <bitmap_alloc+0x44>
8040f3a4:	00170713          	addi	a4,a4,1
8040f3a8:	fee616e3          	bne	a2,a4,8040f394 <bitmap_alloc+0x1c>
8040f3ac:	ffc00513          	li	a0,-4
8040f3b0:	00008067          	ret
8040f3b4:	00070693          	mv	a3,a4
8040f3b8:	00000713          	li	a4,0
8040f3bc:	00000793          	li	a5,0
8040f3c0:	00100893          	li	a7,1
8040f3c4:	02000313          	li	t1,32
8040f3c8:	00c0006f          	j	8040f3d4 <bitmap_alloc+0x5c>
8040f3cc:	00178793          	addi	a5,a5,1
8040f3d0:	02678663          	beq	a5,t1,8040f3fc <bitmap_alloc+0x84>
8040f3d4:	00f89633          	sll	a2,a7,a5
8040f3d8:	00c6f533          	and	a0,a3,a2
8040f3dc:	fe0508e3          	beqz	a0,8040f3cc <bitmap_alloc+0x54>
8040f3e0:	00c6c6b3          	xor	a3,a3,a2
8040f3e4:	00571713          	slli	a4,a4,0x5
8040f3e8:	00d82023          	sw	a3,0(a6)
8040f3ec:	00f70733          	add	a4,a4,a5
8040f3f0:	00e5a023          	sw	a4,0(a1)
8040f3f4:	00000513          	li	a0,0
8040f3f8:	00008067          	ret
8040f3fc:	ff010113          	addi	sp,sp,-16
8040f400:	00005697          	auipc	a3,0x5
8040f404:	a9868693          	addi	a3,a3,-1384 # 80413e98 <default_pmm_manager+0x820>
8040f408:	00003617          	auipc	a2,0x3
8040f40c:	73460613          	addi	a2,a2,1844 # 80412b3c <commands+0x1bc>
8040f410:	04300593          	li	a1,67
8040f414:	00006517          	auipc	a0,0x6
8040f418:	2ec50513          	addi	a0,a0,748 # 80415700 <dev_node_ops+0x324>
8040f41c:	00112623          	sw	ra,12(sp)
8040f420:	a04f10ef          	jal	ra,80400624 <__panic>

8040f424 <bitmap_test>:
8040f424:	00052783          	lw	a5,0(a0)
8040f428:	02f5f463          	bgeu	a1,a5,8040f450 <bitmap_test+0x2c>
8040f42c:	00852783          	lw	a5,8(a0)
8040f430:	0055d713          	srli	a4,a1,0x5
8040f434:	00271713          	slli	a4,a4,0x2
8040f438:	00e787b3          	add	a5,a5,a4
8040f43c:	0007a503          	lw	a0,0(a5)
8040f440:	00100793          	li	a5,1
8040f444:	00b795b3          	sll	a1,a5,a1
8040f448:	00a5f533          	and	a0,a1,a0
8040f44c:	00008067          	ret
8040f450:	ff010113          	addi	sp,sp,-16
8040f454:	00112623          	sw	ra,12(sp)
8040f458:	da9ff0ef          	jal	ra,8040f200 <bitmap_translate.isra.0.part.1>

8040f45c <bitmap_free>:
8040f45c:	00052783          	lw	a5,0(a0)
8040f460:	ff010113          	addi	sp,sp,-16
8040f464:	00112623          	sw	ra,12(sp)
8040f468:	02f5fe63          	bgeu	a1,a5,8040f4a4 <bitmap_free+0x48>
8040f46c:	00852783          	lw	a5,8(a0)
8040f470:	0055d713          	srli	a4,a1,0x5
8040f474:	00271713          	slli	a4,a4,0x2
8040f478:	00e787b3          	add	a5,a5,a4
8040f47c:	0007a703          	lw	a4,0(a5)
8040f480:	00100693          	li	a3,1
8040f484:	00b695b3          	sll	a1,a3,a1
8040f488:	00b776b3          	and	a3,a4,a1
8040f48c:	00069e63          	bnez	a3,8040f4a8 <bitmap_free+0x4c>
8040f490:	00c12083          	lw	ra,12(sp)
8040f494:	00b76733          	or	a4,a4,a1
8040f498:	00e7a023          	sw	a4,0(a5)
8040f49c:	01010113          	addi	sp,sp,16
8040f4a0:	00008067          	ret
8040f4a4:	d5dff0ef          	jal	ra,8040f200 <bitmap_translate.isra.0.part.1>
8040f4a8:	00006697          	auipc	a3,0x6
8040f4ac:	23068693          	addi	a3,a3,560 # 804156d8 <dev_node_ops+0x2fc>
8040f4b0:	00003617          	auipc	a2,0x3
8040f4b4:	68c60613          	addi	a2,a2,1676 # 80412b3c <commands+0x1bc>
8040f4b8:	05f00593          	li	a1,95
8040f4bc:	00006517          	auipc	a0,0x6
8040f4c0:	24450513          	addi	a0,a0,580 # 80415700 <dev_node_ops+0x324>
8040f4c4:	960f10ef          	jal	ra,80400624 <__panic>

8040f4c8 <bitmap_destroy>:
8040f4c8:	ff010113          	addi	sp,sp,-16
8040f4cc:	00812423          	sw	s0,8(sp)
8040f4d0:	00050413          	mv	s0,a0
8040f4d4:	00852503          	lw	a0,8(a0)
8040f4d8:	00112623          	sw	ra,12(sp)
8040f4dc:	dccf30ef          	jal	ra,80402aa8 <kfree>
8040f4e0:	00040513          	mv	a0,s0
8040f4e4:	00812403          	lw	s0,8(sp)
8040f4e8:	00c12083          	lw	ra,12(sp)
8040f4ec:	01010113          	addi	sp,sp,16
8040f4f0:	db8f306f          	j	80402aa8 <kfree>

8040f4f4 <bitmap_getdata>:
8040f4f4:	00058863          	beqz	a1,8040f504 <bitmap_getdata+0x10>
8040f4f8:	00452783          	lw	a5,4(a0)
8040f4fc:	00279793          	slli	a5,a5,0x2
8040f500:	00f5a023          	sw	a5,0(a1)
8040f504:	00852503          	lw	a0,8(a0)
8040f508:	00008067          	ret

8040f50c <sfs_init>:
8040f50c:	ff010113          	addi	sp,sp,-16
8040f510:	00006517          	auipc	a0,0x6
8040f514:	f6450513          	addi	a0,a0,-156 # 80415474 <dev_node_ops+0x98>
8040f518:	00112623          	sw	ra,12(sp)
8040f51c:	784000ef          	jal	ra,8040fca0 <sfs_mount>
8040f520:	00051863          	bnez	a0,8040f530 <sfs_init+0x24>
8040f524:	00c12083          	lw	ra,12(sp)
8040f528:	01010113          	addi	sp,sp,16
8040f52c:	00008067          	ret
8040f530:	00050693          	mv	a3,a0
8040f534:	00006617          	auipc	a2,0x6
8040f538:	1e460613          	addi	a2,a2,484 # 80415718 <dev_node_ops+0x33c>
8040f53c:	01000593          	li	a1,16
8040f540:	00006517          	auipc	a0,0x6
8040f544:	1f850513          	addi	a0,a0,504 # 80415738 <dev_node_ops+0x35c>
8040f548:	8dcf10ef          	jal	ra,80400624 <__panic>

8040f54c <sfs_sync>:
8040f54c:	fe010113          	addi	sp,sp,-32
8040f550:	00112e23          	sw	ra,28(sp)
8040f554:	00812c23          	sw	s0,24(sp)
8040f558:	00912a23          	sw	s1,20(sp)
8040f55c:	01212823          	sw	s2,16(sp)
8040f560:	01312623          	sw	s3,12(sp)
8040f564:	01412423          	sw	s4,8(sp)
8040f568:	12050a63          	beqz	a0,8040f69c <sfs_sync+0x150>
8040f56c:	06c52783          	lw	a5,108(a0)
8040f570:	00050a13          	mv	s4,a0
8040f574:	12079463          	bnez	a5,8040f69c <sfs_sync+0x150>
8040f578:	135020ef          	jal	ra,80411eac <lock_sfs_fs>
8040f57c:	064a2403          	lw	s0,100(s4)
8040f580:	060a0913          	addi	s2,s4,96
8040f584:	06890263          	beq	s2,s0,8040f5e8 <sfs_sync+0x9c>
8040f588:	fe440493          	addi	s1,s0,-28
8040f58c:	0e048863          	beqz	s1,8040f67c <sfs_sync+0x130>
8040f590:	02042783          	lw	a5,32(s0)
8040f594:	0e078463          	beqz	a5,8040f67c <sfs_sync+0x130>
8040f598:	0187a783          	lw	a5,24(a5)
8040f59c:	0e078063          	beqz	a5,8040f67c <sfs_sync+0x130>
8040f5a0:	00005997          	auipc	s3,0x5
8040f5a4:	b3898993          	addi	s3,s3,-1224 # 804140d8 <CSWTCH.69+0x17c>
8040f5a8:	01c0006f          	j	8040f5c4 <sfs_sync+0x78>
8040f5ac:	fe440493          	addi	s1,s0,-28
8040f5b0:	0c048663          	beqz	s1,8040f67c <sfs_sync+0x130>
8040f5b4:	02042783          	lw	a5,32(s0)
8040f5b8:	0c078263          	beqz	a5,8040f67c <sfs_sync+0x130>
8040f5bc:	0187a783          	lw	a5,24(a5)
8040f5c0:	0a078e63          	beqz	a5,8040f67c <sfs_sync+0x130>
8040f5c4:	00098593          	mv	a1,s3
8040f5c8:	00048513          	mv	a0,s1
8040f5cc:	d79fd0ef          	jal	ra,8040d344 <inode_check>
8040f5d0:	02042783          	lw	a5,32(s0)
8040f5d4:	00048513          	mv	a0,s1
8040f5d8:	0187a783          	lw	a5,24(a5)
8040f5dc:	000780e7          	jalr	a5
8040f5e0:	00442403          	lw	s0,4(s0)
8040f5e4:	fc8914e3          	bne	s2,s0,8040f5ac <sfs_sync+0x60>
8040f5e8:	000a0513          	mv	a0,s4
8040f5ec:	0d1020ef          	jal	ra,80411ebc <unlock_sfs_fs>
8040f5f0:	034a2503          	lw	a0,52(s4)
8040f5f4:	02051263          	bnez	a0,8040f618 <sfs_sync+0xcc>
8040f5f8:	01c12083          	lw	ra,28(sp)
8040f5fc:	01812403          	lw	s0,24(sp)
8040f600:	01412483          	lw	s1,20(sp)
8040f604:	01012903          	lw	s2,16(sp)
8040f608:	00c12983          	lw	s3,12(sp)
8040f60c:	00812a03          	lw	s4,8(sp)
8040f610:	02010113          	addi	sp,sp,32
8040f614:	00008067          	ret
8040f618:	020a2a23          	sw	zero,52(s4)
8040f61c:	000a0513          	mv	a0,s4
8040f620:	700020ef          	jal	ra,80411d20 <sfs_sync_super>
8040f624:	02050663          	beqz	a0,8040f650 <sfs_sync+0x104>
8040f628:	01c12083          	lw	ra,28(sp)
8040f62c:	01812403          	lw	s0,24(sp)
8040f630:	00100793          	li	a5,1
8040f634:	02fa2a23          	sw	a5,52(s4)
8040f638:	01412483          	lw	s1,20(sp)
8040f63c:	01012903          	lw	s2,16(sp)
8040f640:	00c12983          	lw	s3,12(sp)
8040f644:	00812a03          	lw	s4,8(sp)
8040f648:	02010113          	addi	sp,sp,32
8040f64c:	00008067          	ret
8040f650:	000a0513          	mv	a0,s4
8040f654:	744020ef          	jal	ra,80411d98 <sfs_sync_freemap>
8040f658:	fc0518e3          	bnez	a0,8040f628 <sfs_sync+0xdc>
8040f65c:	01c12083          	lw	ra,28(sp)
8040f660:	01812403          	lw	s0,24(sp)
8040f664:	01412483          	lw	s1,20(sp)
8040f668:	01012903          	lw	s2,16(sp)
8040f66c:	00c12983          	lw	s3,12(sp)
8040f670:	00812a03          	lw	s4,8(sp)
8040f674:	02010113          	addi	sp,sp,32
8040f678:	00008067          	ret
8040f67c:	00005697          	auipc	a3,0x5
8040f680:	a0c68693          	addi	a3,a3,-1524 # 80414088 <CSWTCH.69+0x12c>
8040f684:	00003617          	auipc	a2,0x3
8040f688:	4b860613          	addi	a2,a2,1208 # 80412b3c <commands+0x1bc>
8040f68c:	01b00593          	li	a1,27
8040f690:	00006517          	auipc	a0,0x6
8040f694:	22050513          	addi	a0,a0,544 # 804158b0 <dev_node_ops+0x4d4>
8040f698:	f8df00ef          	jal	ra,80400624 <__panic>
8040f69c:	00006697          	auipc	a3,0x6
8040f6a0:	1e868693          	addi	a3,a3,488 # 80415884 <dev_node_ops+0x4a8>
8040f6a4:	00003617          	auipc	a2,0x3
8040f6a8:	49860613          	addi	a2,a2,1176 # 80412b3c <commands+0x1bc>
8040f6ac:	01500593          	li	a1,21
8040f6b0:	00006517          	auipc	a0,0x6
8040f6b4:	20050513          	addi	a0,a0,512 # 804158b0 <dev_node_ops+0x4d4>
8040f6b8:	f6df00ef          	jal	ra,80400624 <__panic>

8040f6bc <sfs_init_read>:
8040f6bc:	fe010113          	addi	sp,sp,-32
8040f6c0:	00060793          	mv	a5,a2
8040f6c4:	00812c23          	sw	s0,24(sp)
8040f6c8:	00c59693          	slli	a3,a1,0xc
8040f6cc:	00050413          	mv	s0,a0
8040f6d0:	00078593          	mv	a1,a5
8040f6d4:	00001637          	lui	a2,0x1
8040f6d8:	00010513          	mv	a0,sp
8040f6dc:	00112e23          	sw	ra,28(sp)
8040f6e0:	e35f60ef          	jal	ra,80406514 <iobuf_init>
8040f6e4:	01042783          	lw	a5,16(s0)
8040f6e8:	00050593          	mv	a1,a0
8040f6ec:	00000613          	li	a2,0
8040f6f0:	00040513          	mv	a0,s0
8040f6f4:	000780e7          	jalr	a5
8040f6f8:	01c12083          	lw	ra,28(sp)
8040f6fc:	01812403          	lw	s0,24(sp)
8040f700:	02010113          	addi	sp,sp,32
8040f704:	00008067          	ret

8040f708 <sfs_unmount>:
8040f708:	ff010113          	addi	sp,sp,-16
8040f70c:	00112623          	sw	ra,12(sp)
8040f710:	00812423          	sw	s0,8(sp)
8040f714:	00912223          	sw	s1,4(sp)
8040f718:	06050263          	beqz	a0,8040f77c <sfs_unmount+0x74>
8040f71c:	06c52783          	lw	a5,108(a0)
8040f720:	00050413          	mv	s0,a0
8040f724:	04079c63          	bnez	a5,8040f77c <sfs_unmount+0x74>
8040f728:	06452703          	lw	a4,100(a0)
8040f72c:	06050793          	addi	a5,a0,96
8040f730:	04f71263          	bne	a4,a5,8040f774 <sfs_unmount+0x6c>
8040f734:	03452483          	lw	s1,52(a0)
8040f738:	06049263          	bnez	s1,8040f79c <sfs_unmount+0x94>
8040f73c:	03052503          	lw	a0,48(a0)
8040f740:	d89ff0ef          	jal	ra,8040f4c8 <bitmap_destroy>
8040f744:	03842503          	lw	a0,56(s0)
8040f748:	b60f30ef          	jal	ra,80402aa8 <kfree>
8040f74c:	06842503          	lw	a0,104(s0)
8040f750:	b58f30ef          	jal	ra,80402aa8 <kfree>
8040f754:	00040513          	mv	a0,s0
8040f758:	b50f30ef          	jal	ra,80402aa8 <kfree>
8040f75c:	00c12083          	lw	ra,12(sp)
8040f760:	00812403          	lw	s0,8(sp)
8040f764:	00048513          	mv	a0,s1
8040f768:	00412483          	lw	s1,4(sp)
8040f76c:	01010113          	addi	sp,sp,16
8040f770:	00008067          	ret
8040f774:	ff100493          	li	s1,-15
8040f778:	fe5ff06f          	j	8040f75c <sfs_unmount+0x54>
8040f77c:	00006697          	auipc	a3,0x6
8040f780:	10868693          	addi	a3,a3,264 # 80415884 <dev_node_ops+0x4a8>
8040f784:	00003617          	auipc	a2,0x3
8040f788:	3b860613          	addi	a2,a2,952 # 80412b3c <commands+0x1bc>
8040f78c:	04100593          	li	a1,65
8040f790:	00006517          	auipc	a0,0x6
8040f794:	12050513          	addi	a0,a0,288 # 804158b0 <dev_node_ops+0x4d4>
8040f798:	e8df00ef          	jal	ra,80400624 <__panic>
8040f79c:	00006697          	auipc	a3,0x6
8040f7a0:	12c68693          	addi	a3,a3,300 # 804158c8 <dev_node_ops+0x4ec>
8040f7a4:	00003617          	auipc	a2,0x3
8040f7a8:	39860613          	addi	a2,a2,920 # 80412b3c <commands+0x1bc>
8040f7ac:	04500593          	li	a1,69
8040f7b0:	00006517          	auipc	a0,0x6
8040f7b4:	10050513          	addi	a0,a0,256 # 804158b0 <dev_node_ops+0x4d4>
8040f7b8:	e6df00ef          	jal	ra,80400624 <__panic>

8040f7bc <sfs_cleanup>:
8040f7bc:	ff010113          	addi	sp,sp,-16
8040f7c0:	00112623          	sw	ra,12(sp)
8040f7c4:	00812423          	sw	s0,8(sp)
8040f7c8:	00912223          	sw	s1,4(sp)
8040f7cc:	01212023          	sw	s2,0(sp)
8040f7d0:	08050e63          	beqz	a0,8040f86c <sfs_cleanup+0xb0>
8040f7d4:	06c52783          	lw	a5,108(a0)
8040f7d8:	00050493          	mv	s1,a0
8040f7dc:	08079863          	bnez	a5,8040f86c <sfs_cleanup+0xb0>
8040f7e0:	00452703          	lw	a4,4(a0)
8040f7e4:	00852683          	lw	a3,8(a0)
8040f7e8:	00c50913          	addi	s2,a0,12
8040f7ec:	00090593          	mv	a1,s2
8040f7f0:	40d70633          	sub	a2,a4,a3
8040f7f4:	00006517          	auipc	a0,0x6
8040f7f8:	f5850513          	addi	a0,a0,-168 # 8041574c <dev_node_ops+0x370>
8040f7fc:	a01f00ef          	jal	ra,804001fc <cprintf>
8040f800:	02000413          	li	s0,32
8040f804:	00c0006f          	j	8040f810 <sfs_cleanup+0x54>
8040f808:	fff40413          	addi	s0,s0,-1
8040f80c:	02040663          	beqz	s0,8040f838 <sfs_cleanup+0x7c>
8040f810:	0704a783          	lw	a5,112(s1)
8040f814:	00048513          	mv	a0,s1
8040f818:	000780e7          	jalr	a5
8040f81c:	fe0516e3          	bnez	a0,8040f808 <sfs_cleanup+0x4c>
8040f820:	00c12083          	lw	ra,12(sp)
8040f824:	00812403          	lw	s0,8(sp)
8040f828:	00412483          	lw	s1,4(sp)
8040f82c:	00012903          	lw	s2,0(sp)
8040f830:	01010113          	addi	sp,sp,16
8040f834:	00008067          	ret
8040f838:	00812403          	lw	s0,8(sp)
8040f83c:	00c12083          	lw	ra,12(sp)
8040f840:	00412483          	lw	s1,4(sp)
8040f844:	00090693          	mv	a3,s2
8040f848:	00012903          	lw	s2,0(sp)
8040f84c:	00050713          	mv	a4,a0
8040f850:	00006617          	auipc	a2,0x6
8040f854:	f1c60613          	addi	a2,a2,-228 # 8041576c <dev_node_ops+0x390>
8040f858:	05f00593          	li	a1,95
8040f85c:	00006517          	auipc	a0,0x6
8040f860:	05450513          	addi	a0,a0,84 # 804158b0 <dev_node_ops+0x4d4>
8040f864:	01010113          	addi	sp,sp,16
8040f868:	e41f006f          	j	804006a8 <__warn>
8040f86c:	00006697          	auipc	a3,0x6
8040f870:	01868693          	addi	a3,a3,24 # 80415884 <dev_node_ops+0x4a8>
8040f874:	00003617          	auipc	a2,0x3
8040f878:	2c860613          	addi	a2,a2,712 # 80412b3c <commands+0x1bc>
8040f87c:	05400593          	li	a1,84
8040f880:	00006517          	auipc	a0,0x6
8040f884:	03050513          	addi	a0,a0,48 # 804158b0 <dev_node_ops+0x4d4>
8040f888:	d9df00ef          	jal	ra,80400624 <__panic>

8040f88c <sfs_get_root>:
8040f88c:	fe010113          	addi	sp,sp,-32
8040f890:	00112e23          	sw	ra,28(sp)
8040f894:	02050663          	beqz	a0,8040f8c0 <sfs_get_root+0x34>
8040f898:	06c52783          	lw	a5,108(a0)
8040f89c:	02079263          	bnez	a5,8040f8c0 <sfs_get_root+0x34>
8040f8a0:	00100613          	li	a2,1
8040f8a4:	00c10593          	addi	a1,sp,12
8040f8a8:	0e5010ef          	jal	ra,8041118c <sfs_load_inode>
8040f8ac:	02051a63          	bnez	a0,8040f8e0 <sfs_get_root+0x54>
8040f8b0:	01c12083          	lw	ra,28(sp)
8040f8b4:	00c12503          	lw	a0,12(sp)
8040f8b8:	02010113          	addi	sp,sp,32
8040f8bc:	00008067          	ret
8040f8c0:	00006697          	auipc	a3,0x6
8040f8c4:	fc468693          	addi	a3,a3,-60 # 80415884 <dev_node_ops+0x4a8>
8040f8c8:	00003617          	auipc	a2,0x3
8040f8cc:	27460613          	addi	a2,a2,628 # 80412b3c <commands+0x1bc>
8040f8d0:	03600593          	li	a1,54
8040f8d4:	00006517          	auipc	a0,0x6
8040f8d8:	fdc50513          	addi	a0,a0,-36 # 804158b0 <dev_node_ops+0x4d4>
8040f8dc:	d49f00ef          	jal	ra,80400624 <__panic>
8040f8e0:	00050693          	mv	a3,a0
8040f8e4:	00006617          	auipc	a2,0x6
8040f8e8:	f8460613          	addi	a2,a2,-124 # 80415868 <dev_node_ops+0x48c>
8040f8ec:	03700593          	li	a1,55
8040f8f0:	00006517          	auipc	a0,0x6
8040f8f4:	fc050513          	addi	a0,a0,-64 # 804158b0 <dev_node_ops+0x4d4>
8040f8f8:	d2df00ef          	jal	ra,80400624 <__panic>

8040f8fc <sfs_do_mount>:
8040f8fc:	00452703          	lw	a4,4(a0)
8040f900:	fa010113          	addi	sp,sp,-96
8040f904:	04112e23          	sw	ra,92(sp)
8040f908:	04812c23          	sw	s0,88(sp)
8040f90c:	04912a23          	sw	s1,84(sp)
8040f910:	05212823          	sw	s2,80(sp)
8040f914:	05312623          	sw	s3,76(sp)
8040f918:	05412423          	sw	s4,72(sp)
8040f91c:	05512223          	sw	s5,68(sp)
8040f920:	05612023          	sw	s6,64(sp)
8040f924:	03712e23          	sw	s7,60(sp)
8040f928:	03812c23          	sw	s8,56(sp)
8040f92c:	03912a23          	sw	s9,52(sp)
8040f930:	03a12823          	sw	s10,48(sp)
8040f934:	03b12623          	sw	s11,44(sp)
8040f938:	000017b7          	lui	a5,0x1
8040f93c:	2ef71263          	bne	a4,a5,8040fc20 <sfs_do_mount+0x324>
8040f940:	00050913          	mv	s2,a0
8040f944:	00000513          	li	a0,0
8040f948:	00058a93          	mv	s5,a1
8040f94c:	c85fd0ef          	jal	ra,8040d5d0 <__alloc_fs>
8040f950:	00050413          	mv	s0,a0
8040f954:	2e050263          	beqz	a0,8040fc38 <sfs_do_mount+0x33c>
8040f958:	06c52a03          	lw	s4,108(a0)
8040f95c:	300a1263          	bnez	s4,8040fc60 <sfs_do_mount+0x364>
8040f960:	03252623          	sw	s2,44(a0)
8040f964:	00001537          	lui	a0,0x1
8040f968:	81cf30ef          	jal	ra,80402984 <kmalloc>
8040f96c:	02a42c23          	sw	a0,56(s0)
8040f970:	00050493          	mv	s1,a0
8040f974:	1a050c63          	beqz	a0,8040fb2c <sfs_do_mount+0x230>
8040f978:	00050613          	mv	a2,a0
8040f97c:	00000593          	li	a1,0
8040f980:	00090513          	mv	a0,s2
8040f984:	d39ff0ef          	jal	ra,8040f6bc <sfs_init_read>
8040f988:	00050b13          	mv	s6,a0
8040f98c:	14051863          	bnez	a0,8040fadc <sfs_do_mount+0x1e0>
8040f990:	0004a583          	lw	a1,0(s1)
8040f994:	2f8dc637          	lui	a2,0x2f8dc
8040f998:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f863e2a>
8040f99c:	1ac59863          	bne	a1,a2,8040fb4c <sfs_do_mount+0x250>
8040f9a0:	0044a783          	lw	a5,4(s1)
8040f9a4:	00092603          	lw	a2,0(s2)
8040f9a8:	18f66663          	bltu	a2,a5,8040fb34 <sfs_do_mount+0x238>
8040f9ac:	020485a3          	sb	zero,43(s1)
8040f9b0:	0084af03          	lw	t5,8(s1)
8040f9b4:	00c4ae83          	lw	t4,12(s1)
8040f9b8:	0104ae03          	lw	t3,16(s1)
8040f9bc:	0144a303          	lw	t1,20(s1)
8040f9c0:	0184a883          	lw	a7,24(s1)
8040f9c4:	01c4a803          	lw	a6,28(s1)
8040f9c8:	0204a603          	lw	a2,32(s1)
8040f9cc:	0244a683          	lw	a3,36(s1)
8040f9d0:	0284a703          	lw	a4,40(s1)
8040f9d4:	00002537          	lui	a0,0x2
8040f9d8:	00f42223          	sw	a5,4(s0)
8040f9dc:	00b42023          	sw	a1,0(s0)
8040f9e0:	01e42423          	sw	t5,8(s0)
8040f9e4:	01d42623          	sw	t4,12(s0)
8040f9e8:	01c42823          	sw	t3,16(s0)
8040f9ec:	00642a23          	sw	t1,20(s0)
8040f9f0:	01142c23          	sw	a7,24(s0)
8040f9f4:	01042e23          	sw	a6,28(s0)
8040f9f8:	02c42023          	sw	a2,32(s0)
8040f9fc:	02d42223          	sw	a3,36(s0)
8040fa00:	02e42423          	sw	a4,40(s0)
8040fa04:	f81f20ef          	jal	ra,80402984 <kmalloc>
8040fa08:	00a12423          	sw	a0,8(sp)
8040fa0c:	06a42423          	sw	a0,104(s0)
8040fa10:	00050793          	mv	a5,a0
8040fa14:	20050a63          	beqz	a0,8040fc28 <sfs_do_mount+0x32c>
8040fa18:	00002737          	lui	a4,0x2
8040fa1c:	00e50733          	add	a4,a0,a4
8040fa20:	00f7a223          	sw	a5,4(a5) # 1004 <_binary_bin_swap_img_size-0x6ffc>
8040fa24:	00f7a023          	sw	a5,0(a5)
8040fa28:	00878793          	addi	a5,a5,8
8040fa2c:	fee79ae3          	bne	a5,a4,8040fa20 <sfs_do_mount+0x124>
8040fa30:	0044ab83          	lw	s7,4(s1)
8040fa34:	00008737          	lui	a4,0x8
8040fa38:	fff70993          	addi	s3,a4,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8040fa3c:	ffff87b7          	lui	a5,0xffff8
8040fa40:	013b8bb3          	add	s7,s7,s3
8040fa44:	00fbfbb3          	and	s7,s7,a5
8040fa48:	000b8513          	mv	a0,s7
8040fa4c:	fdcff0ef          	jal	ra,8040f228 <bitmap_create>
8040fa50:	02a42823          	sw	a0,48(s0)
8040fa54:	00050c93          	mv	s9,a0
8040fa58:	1c050063          	beqz	a0,8040fc18 <sfs_do_mount+0x31c>
8040fa5c:	0044a703          	lw	a4,4(s1)
8040fa60:	01c10593          	addi	a1,sp,28
8040fa64:	01370733          	add	a4,a4,s3
8040fa68:	00f75713          	srli	a4,a4,0xf
8040fa6c:	00e12623          	sw	a4,12(sp)
8040fa70:	a85ff0ef          	jal	ra,8040f4f4 <bitmap_getdata>
8040fa74:	00050c13          	mv	s8,a0
8040fa78:	1c050463          	beqz	a0,8040fc40 <sfs_do_mount+0x344>
8040fa7c:	00c12703          	lw	a4,12(sp)
8040fa80:	01c12683          	lw	a3,28(sp)
8040fa84:	00c71613          	slli	a2,a4,0xc
8040fa88:	1ad61c63          	bne	a2,a3,8040fc40 <sfs_do_mount+0x344>
8040fa8c:	00200993          	li	s3,2
8040fa90:	00001db7          	lui	s11,0x1
8040fa94:	00270d13          	addi	s10,a4,2
8040fa98:	00071a63          	bnez	a4,8040faac <sfs_do_mount+0x1b0>
8040fa9c:	0c40006f          	j	8040fb60 <sfs_do_mount+0x264>
8040faa0:	00198993          	addi	s3,s3,1
8040faa4:	01bc0c33          	add	s8,s8,s11
8040faa8:	0ba98c63          	beq	s3,s10,8040fb60 <sfs_do_mount+0x264>
8040faac:	000c0613          	mv	a2,s8
8040fab0:	00098593          	mv	a1,s3
8040fab4:	00090513          	mv	a0,s2
8040fab8:	c05ff0ef          	jal	ra,8040f6bc <sfs_init_read>
8040fabc:	fe0502e3          	beqz	a0,8040faa0 <sfs_do_mount+0x1a4>
8040fac0:	00a12623          	sw	a0,12(sp)
8040fac4:	000c8513          	mv	a0,s9
8040fac8:	a01ff0ef          	jal	ra,8040f4c8 <bitmap_destroy>
8040facc:	00c12703          	lw	a4,12(sp)
8040fad0:	00070b13          	mv	s6,a4
8040fad4:	00812503          	lw	a0,8(sp)
8040fad8:	fd1f20ef          	jal	ra,80402aa8 <kfree>
8040fadc:	00048513          	mv	a0,s1
8040fae0:	fc9f20ef          	jal	ra,80402aa8 <kfree>
8040fae4:	00040513          	mv	a0,s0
8040fae8:	fc1f20ef          	jal	ra,80402aa8 <kfree>
8040faec:	05c12083          	lw	ra,92(sp)
8040faf0:	05812403          	lw	s0,88(sp)
8040faf4:	000b0513          	mv	a0,s6
8040faf8:	05412483          	lw	s1,84(sp)
8040fafc:	05012903          	lw	s2,80(sp)
8040fb00:	04c12983          	lw	s3,76(sp)
8040fb04:	04812a03          	lw	s4,72(sp)
8040fb08:	04412a83          	lw	s5,68(sp)
8040fb0c:	04012b03          	lw	s6,64(sp)
8040fb10:	03c12b83          	lw	s7,60(sp)
8040fb14:	03812c03          	lw	s8,56(sp)
8040fb18:	03412c83          	lw	s9,52(sp)
8040fb1c:	03012d03          	lw	s10,48(sp)
8040fb20:	02c12d83          	lw	s11,44(sp)
8040fb24:	06010113          	addi	sp,sp,96
8040fb28:	00008067          	ret
8040fb2c:	ffc00b13          	li	s6,-4
8040fb30:	fb5ff06f          	j	8040fae4 <sfs_do_mount+0x1e8>
8040fb34:	00078593          	mv	a1,a5
8040fb38:	00006517          	auipc	a0,0x6
8040fb3c:	c8850513          	addi	a0,a0,-888 # 804157c0 <dev_node_ops+0x3e4>
8040fb40:	ebcf00ef          	jal	ra,804001fc <cprintf>
8040fb44:	ffd00b13          	li	s6,-3
8040fb48:	f95ff06f          	j	8040fadc <sfs_do_mount+0x1e0>
8040fb4c:	00006517          	auipc	a0,0x6
8040fb50:	c3c50513          	addi	a0,a0,-964 # 80415788 <dev_node_ops+0x3ac>
8040fb54:	ea8f00ef          	jal	ra,804001fc <cprintf>
8040fb58:	ffd00b13          	li	s6,-3
8040fb5c:	f81ff06f          	j	8040fadc <sfs_do_mount+0x1e0>
8040fb60:	00442903          	lw	s2,4(s0)
8040fb64:	00000493          	li	s1,0
8040fb68:	0c0b8463          	beqz	s7,8040fc30 <sfs_do_mount+0x334>
8040fb6c:	00048593          	mv	a1,s1
8040fb70:	000c8513          	mv	a0,s9
8040fb74:	8b1ff0ef          	jal	ra,8040f424 <bitmap_test>
8040fb78:	00a03533          	snez	a0,a0
8040fb7c:	00148493          	addi	s1,s1,1
8040fb80:	00aa0a33          	add	s4,s4,a0
8040fb84:	fe9b94e3          	bne	s7,s1,8040fb6c <sfs_do_mount+0x270>
8040fb88:	00842783          	lw	a5,8(s0)
8040fb8c:	0f479a63          	bne	a5,s4,8040fc80 <sfs_do_mount+0x384>
8040fb90:	00100593          	li	a1,1
8040fb94:	03c40513          	addi	a0,s0,60
8040fb98:	02042a23          	sw	zero,52(s0)
8040fb9c:	d14f50ef          	jal	ra,804050b0 <sem_init>
8040fba0:	00100593          	li	a1,1
8040fba4:	04840513          	addi	a0,s0,72
8040fba8:	d08f50ef          	jal	ra,804050b0 <sem_init>
8040fbac:	00100593          	li	a1,1
8040fbb0:	05440513          	addi	a0,s0,84
8040fbb4:	cfcf50ef          	jal	ra,804050b0 <sem_init>
8040fbb8:	06040793          	addi	a5,s0,96
8040fbbc:	06f42223          	sw	a5,100(s0)
8040fbc0:	06f42023          	sw	a5,96(s0)
8040fbc4:	00090713          	mv	a4,s2
8040fbc8:	000a0693          	mv	a3,s4
8040fbcc:	41490633          	sub	a2,s2,s4
8040fbd0:	00c40593          	addi	a1,s0,12
8040fbd4:	00006517          	auipc	a0,0x6
8040fbd8:	c7450513          	addi	a0,a0,-908 # 80415848 <dev_node_ops+0x46c>
8040fbdc:	e20f00ef          	jal	ra,804001fc <cprintf>
8040fbe0:	00000797          	auipc	a5,0x0
8040fbe4:	96c78793          	addi	a5,a5,-1684 # 8040f54c <sfs_sync>
8040fbe8:	06f42823          	sw	a5,112(s0)
8040fbec:	00000797          	auipc	a5,0x0
8040fbf0:	ca078793          	addi	a5,a5,-864 # 8040f88c <sfs_get_root>
8040fbf4:	06f42a23          	sw	a5,116(s0)
8040fbf8:	00000797          	auipc	a5,0x0
8040fbfc:	b1078793          	addi	a5,a5,-1264 # 8040f708 <sfs_unmount>
8040fc00:	06f42c23          	sw	a5,120(s0)
8040fc04:	00000797          	auipc	a5,0x0
8040fc08:	bb878793          	addi	a5,a5,-1096 # 8040f7bc <sfs_cleanup>
8040fc0c:	06f42e23          	sw	a5,124(s0)
8040fc10:	008aa023          	sw	s0,0(s5)
8040fc14:	ed9ff06f          	j	8040faec <sfs_do_mount+0x1f0>
8040fc18:	ffc00b13          	li	s6,-4
8040fc1c:	eb9ff06f          	j	8040fad4 <sfs_do_mount+0x1d8>
8040fc20:	ff200b13          	li	s6,-14
8040fc24:	ec9ff06f          	j	8040faec <sfs_do_mount+0x1f0>
8040fc28:	ffc00b13          	li	s6,-4
8040fc2c:	eb1ff06f          	j	8040fadc <sfs_do_mount+0x1e0>
8040fc30:	00000a13          	li	s4,0
8040fc34:	f55ff06f          	j	8040fb88 <sfs_do_mount+0x28c>
8040fc38:	ffc00b13          	li	s6,-4
8040fc3c:	eb1ff06f          	j	8040faec <sfs_do_mount+0x1f0>
8040fc40:	00006697          	auipc	a3,0x6
8040fc44:	bb068693          	addi	a3,a3,-1104 # 804157f0 <dev_node_ops+0x414>
8040fc48:	00003617          	auipc	a2,0x3
8040fc4c:	ef460613          	addi	a2,a2,-268 # 80412b3c <commands+0x1bc>
8040fc50:	08300593          	li	a1,131
8040fc54:	00006517          	auipc	a0,0x6
8040fc58:	c5c50513          	addi	a0,a0,-932 # 804158b0 <dev_node_ops+0x4d4>
8040fc5c:	9c9f00ef          	jal	ra,80400624 <__panic>
8040fc60:	00006697          	auipc	a3,0x6
8040fc64:	c2468693          	addi	a3,a3,-988 # 80415884 <dev_node_ops+0x4a8>
8040fc68:	00003617          	auipc	a2,0x3
8040fc6c:	ed460613          	addi	a2,a2,-300 # 80412b3c <commands+0x1bc>
8040fc70:	0a300593          	li	a1,163
8040fc74:	00006517          	auipc	a0,0x6
8040fc78:	c3c50513          	addi	a0,a0,-964 # 804158b0 <dev_node_ops+0x4d4>
8040fc7c:	9a9f00ef          	jal	ra,80400624 <__panic>
8040fc80:	00006697          	auipc	a3,0x6
8040fc84:	b9c68693          	addi	a3,a3,-1124 # 8041581c <dev_node_ops+0x440>
8040fc88:	00003617          	auipc	a2,0x3
8040fc8c:	eb460613          	addi	a2,a2,-332 # 80412b3c <commands+0x1bc>
8040fc90:	0e000593          	li	a1,224
8040fc94:	00006517          	auipc	a0,0x6
8040fc98:	c1c50513          	addi	a0,a0,-996 # 804158b0 <dev_node_ops+0x4d4>
8040fc9c:	989f00ef          	jal	ra,80400624 <__panic>

8040fca0 <sfs_mount>:
8040fca0:	00000597          	auipc	a1,0x0
8040fca4:	c5c58593          	addi	a1,a1,-932 # 8040f8fc <sfs_do_mount>
8040fca8:	f15fd06f          	j	8040dbbc <vfs_mount>

8040fcac <sfs_opendir>:
8040fcac:	0235f593          	andi	a1,a1,35
8040fcb0:	00000513          	li	a0,0
8040fcb4:	00059463          	bnez	a1,8040fcbc <sfs_opendir+0x10>
8040fcb8:	00008067          	ret
8040fcbc:	fef00513          	li	a0,-17
8040fcc0:	00008067          	ret

8040fcc4 <sfs_openfile>:
8040fcc4:	00000513          	li	a0,0
8040fcc8:	00008067          	ret

8040fccc <sfs_fsync>:
8040fccc:	fe010113          	addi	sp,sp,-32
8040fcd0:	01212823          	sw	s2,16(sp)
8040fcd4:	03852903          	lw	s2,56(a0)
8040fcd8:	00112e23          	sw	ra,28(sp)
8040fcdc:	00812c23          	sw	s0,24(sp)
8040fce0:	00912a23          	sw	s1,20(sp)
8040fce4:	01312623          	sw	s3,12(sp)
8040fce8:	0a090a63          	beqz	s2,8040fd9c <sfs_fsync+0xd0>
8040fcec:	06c92783          	lw	a5,108(s2)
8040fcf0:	0a079663          	bnez	a5,8040fd9c <sfs_fsync+0xd0>
8040fcf4:	02c52703          	lw	a4,44(a0)
8040fcf8:	000017b7          	lui	a5,0x1
8040fcfc:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040fd00:	00050413          	mv	s0,a0
8040fd04:	0af71c63          	bne	a4,a5,8040fdbc <sfs_fsync+0xf0>
8040fd08:	00852483          	lw	s1,8(a0)
8040fd0c:	02049263          	bnez	s1,8040fd30 <sfs_fsync+0x64>
8040fd10:	01c12083          	lw	ra,28(sp)
8040fd14:	01812403          	lw	s0,24(sp)
8040fd18:	00048513          	mv	a0,s1
8040fd1c:	01012903          	lw	s2,16(sp)
8040fd20:	01412483          	lw	s1,20(sp)
8040fd24:	00c12983          	lw	s3,12(sp)
8040fd28:	02010113          	addi	sp,sp,32
8040fd2c:	00008067          	ret
8040fd30:	01050993          	addi	s3,a0,16
8040fd34:	00098513          	mv	a0,s3
8040fd38:	b88f50ef          	jal	ra,804050c0 <down>
8040fd3c:	00842483          	lw	s1,8(s0)
8040fd40:	02049663          	bnez	s1,8040fd6c <sfs_fsync+0xa0>
8040fd44:	00098513          	mv	a0,s3
8040fd48:	b74f50ef          	jal	ra,804050bc <up>
8040fd4c:	01c12083          	lw	ra,28(sp)
8040fd50:	01812403          	lw	s0,24(sp)
8040fd54:	00048513          	mv	a0,s1
8040fd58:	01012903          	lw	s2,16(sp)
8040fd5c:	01412483          	lw	s1,20(sp)
8040fd60:	00c12983          	lw	s3,12(sp)
8040fd64:	02010113          	addi	sp,sp,32
8040fd68:	00008067          	ret
8040fd6c:	00442683          	lw	a3,4(s0)
8040fd70:	00042583          	lw	a1,0(s0)
8040fd74:	00042423          	sw	zero,8(s0)
8040fd78:	00000713          	li	a4,0
8040fd7c:	04000613          	li	a2,64
8040fd80:	00090513          	mv	a0,s2
8040fd84:	691010ef          	jal	ra,80411c14 <sfs_wbuf>
8040fd88:	00050493          	mv	s1,a0
8040fd8c:	fa050ce3          	beqz	a0,8040fd44 <sfs_fsync+0x78>
8040fd90:	00100793          	li	a5,1
8040fd94:	00f42423          	sw	a5,8(s0)
8040fd98:	fadff06f          	j	8040fd44 <sfs_fsync+0x78>
8040fd9c:	00006697          	auipc	a3,0x6
8040fda0:	ae868693          	addi	a3,a3,-1304 # 80415884 <dev_node_ops+0x4a8>
8040fda4:	00003617          	auipc	a2,0x3
8040fda8:	d9860613          	addi	a2,a2,-616 # 80412b3c <commands+0x1bc>
8040fdac:	2c700593          	li	a1,711
8040fdb0:	00006517          	auipc	a0,0x6
8040fdb4:	c7050513          	addi	a0,a0,-912 # 80415a20 <dev_node_ops+0x644>
8040fdb8:	86df00ef          	jal	ra,80400624 <__panic>
8040fdbc:	00006697          	auipc	a3,0x6
8040fdc0:	c7c68693          	addi	a3,a3,-900 # 80415a38 <dev_node_ops+0x65c>
8040fdc4:	00003617          	auipc	a2,0x3
8040fdc8:	d7860613          	addi	a2,a2,-648 # 80412b3c <commands+0x1bc>
8040fdcc:	2c800593          	li	a1,712
8040fdd0:	00006517          	auipc	a0,0x6
8040fdd4:	c5050513          	addi	a0,a0,-944 # 80415a20 <dev_node_ops+0x644>
8040fdd8:	84df00ef          	jal	ra,80400624 <__panic>

8040fddc <sfs_gettype>:
8040fddc:	ff010113          	addi	sp,sp,-16
8040fde0:	00112623          	sw	ra,12(sp)
8040fde4:	06050e63          	beqz	a0,8040fe60 <sfs_gettype+0x84>
8040fde8:	02c52683          	lw	a3,44(a0)
8040fdec:	000017b7          	lui	a5,0x1
8040fdf0:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040fdf4:	06e69663          	bne	a3,a4,8040fe60 <sfs_gettype+0x84>
8040fdf8:	00052683          	lw	a3,0(a0)
8040fdfc:	00200713          	li	a4,2
8040fe00:	0046d683          	lhu	a3,4(a3)
8040fe04:	04e68263          	beq	a3,a4,8040fe48 <sfs_gettype+0x6c>
8040fe08:	00300713          	li	a4,3
8040fe0c:	02e68263          	beq	a3,a4,8040fe30 <sfs_gettype+0x54>
8040fe10:	00100713          	li	a4,1
8040fe14:	02e68063          	beq	a3,a4,8040fe34 <sfs_gettype+0x58>
8040fe18:	00006617          	auipc	a2,0x6
8040fe1c:	c5860613          	addi	a2,a2,-936 # 80415a70 <dev_node_ops+0x694>
8040fe20:	38f00593          	li	a1,911
8040fe24:	00006517          	auipc	a0,0x6
8040fe28:	bfc50513          	addi	a0,a0,-1028 # 80415a20 <dev_node_ops+0x644>
8040fe2c:	ff8f00ef          	jal	ra,80400624 <__panic>
8040fe30:	000037b7          	lui	a5,0x3
8040fe34:	00c12083          	lw	ra,12(sp)
8040fe38:	00f5a023          	sw	a5,0(a1)
8040fe3c:	00000513          	li	a0,0
8040fe40:	01010113          	addi	sp,sp,16
8040fe44:	00008067          	ret
8040fe48:	00c12083          	lw	ra,12(sp)
8040fe4c:	000027b7          	lui	a5,0x2
8040fe50:	00f5a023          	sw	a5,0(a1)
8040fe54:	00000513          	li	a0,0
8040fe58:	01010113          	addi	sp,sp,16
8040fe5c:	00008067          	ret
8040fe60:	00006697          	auipc	a3,0x6
8040fe64:	bd868693          	addi	a3,a3,-1064 # 80415a38 <dev_node_ops+0x65c>
8040fe68:	00003617          	auipc	a2,0x3
8040fe6c:	cd460613          	addi	a2,a2,-812 # 80412b3c <commands+0x1bc>
8040fe70:	38300593          	li	a1,899
8040fe74:	00006517          	auipc	a0,0x6
8040fe78:	bac50513          	addi	a0,a0,-1108 # 80415a20 <dev_node_ops+0x644>
8040fe7c:	fa8f00ef          	jal	ra,80400624 <__panic>

8040fe80 <sfs_block_inuse.isra.3>:
8040fe80:	ff010113          	addi	sp,sp,-16
8040fe84:	00112623          	sw	ra,12(sp)
8040fe88:	02060263          	beqz	a2,8040feac <sfs_block_inuse.isra.3+0x2c>
8040fe8c:	02a67063          	bgeu	a2,a0,8040feac <sfs_block_inuse.isra.3+0x2c>
8040fe90:	0005a503          	lw	a0,0(a1)
8040fe94:	00060593          	mv	a1,a2
8040fe98:	d8cff0ef          	jal	ra,8040f424 <bitmap_test>
8040fe9c:	00c12083          	lw	ra,12(sp)
8040fea0:	00153513          	seqz	a0,a0
8040fea4:	01010113          	addi	sp,sp,16
8040fea8:	00008067          	ret
8040feac:	00060713          	mv	a4,a2
8040feb0:	00050693          	mv	a3,a0
8040feb4:	00006617          	auipc	a2,0x6
8040feb8:	a6c60613          	addi	a2,a2,-1428 # 80415920 <dev_node_ops+0x544>
8040febc:	05300593          	li	a1,83
8040fec0:	00006517          	auipc	a0,0x6
8040fec4:	b6050513          	addi	a0,a0,-1184 # 80415a20 <dev_node_ops+0x644>
8040fec8:	f5cf00ef          	jal	ra,80400624 <__panic>

8040fecc <sfs_block_alloc>:
8040fecc:	ff010113          	addi	sp,sp,-16
8040fed0:	00812423          	sw	s0,8(sp)
8040fed4:	00050413          	mv	s0,a0
8040fed8:	03052503          	lw	a0,48(a0)
8040fedc:	00912223          	sw	s1,4(sp)
8040fee0:	00112623          	sw	ra,12(sp)
8040fee4:	00058493          	mv	s1,a1
8040fee8:	c90ff0ef          	jal	ra,8040f378 <bitmap_alloc>
8040feec:	04051863          	bnez	a0,8040ff3c <sfs_block_alloc+0x70>
8040fef0:	00842783          	lw	a5,8(s0)
8040fef4:	06078e63          	beqz	a5,8040ff70 <sfs_block_alloc+0xa4>
8040fef8:	fff78793          	addi	a5,a5,-1 # 1fff <_binary_bin_swap_img_size-0x6001>
8040fefc:	00f42423          	sw	a5,8(s0)
8040ff00:	00100793          	li	a5,1
8040ff04:	02f42a23          	sw	a5,52(s0)
8040ff08:	0004a603          	lw	a2,0(s1)
8040ff0c:	00442503          	lw	a0,4(s0)
8040ff10:	03040593          	addi	a1,s0,48
8040ff14:	f6dff0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
8040ff18:	02050c63          	beqz	a0,8040ff50 <sfs_block_alloc+0x84>
8040ff1c:	00040513          	mv	a0,s0
8040ff20:	00812403          	lw	s0,8(sp)
8040ff24:	0004a583          	lw	a1,0(s1)
8040ff28:	00c12083          	lw	ra,12(sp)
8040ff2c:	00412483          	lw	s1,4(sp)
8040ff30:	00100613          	li	a2,1
8040ff34:	01010113          	addi	sp,sp,16
8040ff38:	6bd0106f          	j	80411df4 <sfs_clear_block>
8040ff3c:	00c12083          	lw	ra,12(sp)
8040ff40:	00812403          	lw	s0,8(sp)
8040ff44:	00412483          	lw	s1,4(sp)
8040ff48:	01010113          	addi	sp,sp,16
8040ff4c:	00008067          	ret
8040ff50:	00006697          	auipc	a3,0x6
8040ff54:	9ac68693          	addi	a3,a3,-1620 # 804158fc <dev_node_ops+0x520>
8040ff58:	00003617          	auipc	a2,0x3
8040ff5c:	be460613          	addi	a2,a2,-1052 # 80412b3c <commands+0x1bc>
8040ff60:	06100593          	li	a1,97
8040ff64:	00006517          	auipc	a0,0x6
8040ff68:	abc50513          	addi	a0,a0,-1348 # 80415a20 <dev_node_ops+0x644>
8040ff6c:	eb8f00ef          	jal	ra,80400624 <__panic>
8040ff70:	00006697          	auipc	a3,0x6
8040ff74:	96c68693          	addi	a3,a3,-1684 # 804158dc <dev_node_ops+0x500>
8040ff78:	00003617          	auipc	a2,0x3
8040ff7c:	bc460613          	addi	a2,a2,-1084 # 80412b3c <commands+0x1bc>
8040ff80:	05f00593          	li	a1,95
8040ff84:	00006517          	auipc	a0,0x6
8040ff88:	a9c50513          	addi	a0,a0,-1380 # 80415a20 <dev_node_ops+0x644>
8040ff8c:	e98f00ef          	jal	ra,80400624 <__panic>

8040ff90 <sfs_block_free>:
8040ff90:	ff010113          	addi	sp,sp,-16
8040ff94:	00812423          	sw	s0,8(sp)
8040ff98:	00050413          	mv	s0,a0
8040ff9c:	00452503          	lw	a0,4(a0)
8040ffa0:	00912223          	sw	s1,4(sp)
8040ffa4:	00058613          	mv	a2,a1
8040ffa8:	00058493          	mv	s1,a1
8040ffac:	03040593          	addi	a1,s0,48
8040ffb0:	00112623          	sw	ra,12(sp)
8040ffb4:	ecdff0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
8040ffb8:	02050c63          	beqz	a0,8040fff0 <sfs_block_free+0x60>
8040ffbc:	03042503          	lw	a0,48(s0)
8040ffc0:	00048593          	mv	a1,s1
8040ffc4:	c98ff0ef          	jal	ra,8040f45c <bitmap_free>
8040ffc8:	00842783          	lw	a5,8(s0)
8040ffcc:	00100713          	li	a4,1
8040ffd0:	02e42a23          	sw	a4,52(s0)
8040ffd4:	00178793          	addi	a5,a5,1
8040ffd8:	00f42423          	sw	a5,8(s0)
8040ffdc:	00c12083          	lw	ra,12(sp)
8040ffe0:	00812403          	lw	s0,8(sp)
8040ffe4:	00412483          	lw	s1,4(sp)
8040ffe8:	01010113          	addi	sp,sp,16
8040ffec:	00008067          	ret
8040fff0:	00006697          	auipc	a3,0x6
8040fff4:	9c868693          	addi	a3,a3,-1592 # 804159b8 <dev_node_ops+0x5dc>
8040fff8:	00003617          	auipc	a2,0x3
8040fffc:	b4460613          	addi	a2,a2,-1212 # 80412b3c <commands+0x1bc>
80410000:	06a00593          	li	a1,106
80410004:	00006517          	auipc	a0,0x6
80410008:	a1c50513          	addi	a0,a0,-1508 # 80415a20 <dev_node_ops+0x644>
8041000c:	e18f00ef          	jal	ra,80400624 <__panic>

80410010 <sfs_reclaim>:
80410010:	ff010113          	addi	sp,sp,-16
80410014:	00912223          	sw	s1,4(sp)
80410018:	03852483          	lw	s1,56(a0)
8041001c:	00112623          	sw	ra,12(sp)
80410020:	00812423          	sw	s0,8(sp)
80410024:	01212023          	sw	s2,0(sp)
80410028:	16048c63          	beqz	s1,804101a0 <sfs_reclaim+0x190>
8041002c:	06c4a783          	lw	a5,108(s1)
80410030:	16079863          	bnez	a5,804101a0 <sfs_reclaim+0x190>
80410034:	02c52703          	lw	a4,44(a0)
80410038:	000017b7          	lui	a5,0x1
8041003c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410040:	00050413          	mv	s0,a0
80410044:	18f71e63          	bne	a4,a5,804101e0 <sfs_reclaim+0x1d0>
80410048:	00048513          	mv	a0,s1
8041004c:	661010ef          	jal	ra,80411eac <lock_sfs_fs>
80410050:	00c42783          	lw	a5,12(s0)
80410054:	16f05663          	blez	a5,804101c0 <sfs_reclaim+0x1b0>
80410058:	fff78793          	addi	a5,a5,-1
8041005c:	00f42623          	sw	a5,12(s0)
80410060:	0e079463          	bnez	a5,80410148 <sfs_reclaim+0x138>
80410064:	03042903          	lw	s2,48(s0)
80410068:	0e091063          	bnez	s2,80410148 <sfs_reclaim+0x138>
8041006c:	00042783          	lw	a5,0(s0)
80410070:	0067d783          	lhu	a5,6(a5)
80410074:	02079e63          	bnez	a5,804100b0 <sfs_reclaim+0xa0>
80410078:	03c42783          	lw	a5,60(s0)
8041007c:	18078263          	beqz	a5,80410200 <sfs_reclaim+0x1f0>
80410080:	0307a783          	lw	a5,48(a5)
80410084:	16078e63          	beqz	a5,80410200 <sfs_reclaim+0x1f0>
80410088:	00005597          	auipc	a1,0x5
8041008c:	1e058593          	addi	a1,a1,480 # 80415268 <syscalls+0x8c0>
80410090:	00040513          	mv	a0,s0
80410094:	ab0fd0ef          	jal	ra,8040d344 <inode_check>
80410098:	03c42783          	lw	a5,60(s0)
8041009c:	00000593          	li	a1,0
804100a0:	00040513          	mv	a0,s0
804100a4:	0307a783          	lw	a5,48(a5)
804100a8:	000780e7          	jalr	a5
804100ac:	0e051663          	bnez	a0,80410198 <sfs_reclaim+0x188>
804100b0:	00842783          	lw	a5,8(s0)
804100b4:	02078c63          	beqz	a5,804100ec <sfs_reclaim+0xdc>
804100b8:	03c42783          	lw	a5,60(s0)
804100bc:	16078263          	beqz	a5,80410220 <sfs_reclaim+0x210>
804100c0:	0187a783          	lw	a5,24(a5)
804100c4:	14078e63          	beqz	a5,80410220 <sfs_reclaim+0x210>
804100c8:	00040513          	mv	a0,s0
804100cc:	00004597          	auipc	a1,0x4
804100d0:	00c58593          	addi	a1,a1,12 # 804140d8 <CSWTCH.69+0x17c>
804100d4:	a70fd0ef          	jal	ra,8040d344 <inode_check>
804100d8:	03c42783          	lw	a5,60(s0)
804100dc:	00040513          	mv	a0,s0
804100e0:	0187a783          	lw	a5,24(a5)
804100e4:	000780e7          	jalr	a5
804100e8:	0a051863          	bnez	a0,80410198 <sfs_reclaim+0x188>
804100ec:	01c42703          	lw	a4,28(s0)
804100f0:	02042783          	lw	a5,32(s0)
804100f4:	00048513          	mv	a0,s1
804100f8:	00f72223          	sw	a5,4(a4)
804100fc:	00e7a023          	sw	a4,0(a5)
80410100:	02442703          	lw	a4,36(s0)
80410104:	02842783          	lw	a5,40(s0)
80410108:	00f72223          	sw	a5,4(a4)
8041010c:	00e7a023          	sw	a4,0(a5)
80410110:	5ad010ef          	jal	ra,80411ebc <unlock_sfs_fs>
80410114:	00042503          	lw	a0,0(s0)
80410118:	00655783          	lhu	a5,6(a0)
8041011c:	04078a63          	beqz	a5,80410170 <sfs_reclaim+0x160>
80410120:	989f20ef          	jal	ra,80402aa8 <kfree>
80410124:	00040513          	mv	a0,s0
80410128:	990fd0ef          	jal	ra,8040d2b8 <inode_kill>
8041012c:	00c12083          	lw	ra,12(sp)
80410130:	00812403          	lw	s0,8(sp)
80410134:	00090513          	mv	a0,s2
80410138:	00412483          	lw	s1,4(sp)
8041013c:	00012903          	lw	s2,0(sp)
80410140:	01010113          	addi	sp,sp,16
80410144:	00008067          	ret
80410148:	ff100913          	li	s2,-15
8041014c:	00048513          	mv	a0,s1
80410150:	56d010ef          	jal	ra,80411ebc <unlock_sfs_fs>
80410154:	00c12083          	lw	ra,12(sp)
80410158:	00812403          	lw	s0,8(sp)
8041015c:	00090513          	mv	a0,s2
80410160:	00412483          	lw	s1,4(sp)
80410164:	00012903          	lw	s2,0(sp)
80410168:	01010113          	addi	sp,sp,16
8041016c:	00008067          	ret
80410170:	00442583          	lw	a1,4(s0)
80410174:	00048513          	mv	a0,s1
80410178:	e19ff0ef          	jal	ra,8040ff90 <sfs_block_free>
8041017c:	00042503          	lw	a0,0(s0)
80410180:	03c52583          	lw	a1,60(a0)
80410184:	f8058ee3          	beqz	a1,80410120 <sfs_reclaim+0x110>
80410188:	00048513          	mv	a0,s1
8041018c:	e05ff0ef          	jal	ra,8040ff90 <sfs_block_free>
80410190:	00042503          	lw	a0,0(s0)
80410194:	f8dff06f          	j	80410120 <sfs_reclaim+0x110>
80410198:	00050913          	mv	s2,a0
8041019c:	fb1ff06f          	j	8041014c <sfs_reclaim+0x13c>
804101a0:	00005697          	auipc	a3,0x5
804101a4:	6e468693          	addi	a3,a3,1764 # 80415884 <dev_node_ops+0x4a8>
804101a8:	00003617          	auipc	a2,0x3
804101ac:	99460613          	addi	a2,a2,-1644 # 80412b3c <commands+0x1bc>
804101b0:	35800593          	li	a1,856
804101b4:	00006517          	auipc	a0,0x6
804101b8:	86c50513          	addi	a0,a0,-1940 # 80415a20 <dev_node_ops+0x644>
804101bc:	c68f00ef          	jal	ra,80400624 <__panic>
804101c0:	00006697          	auipc	a3,0x6
804101c4:	9f468693          	addi	a3,a3,-1548 # 80415bb4 <sfs_node_fileops+0x40>
804101c8:	00003617          	auipc	a2,0x3
804101cc:	97460613          	addi	a2,a2,-1676 # 80412b3c <commands+0x1bc>
804101d0:	35e00593          	li	a1,862
804101d4:	00006517          	auipc	a0,0x6
804101d8:	84c50513          	addi	a0,a0,-1972 # 80415a20 <dev_node_ops+0x644>
804101dc:	c48f00ef          	jal	ra,80400624 <__panic>
804101e0:	00006697          	auipc	a3,0x6
804101e4:	85868693          	addi	a3,a3,-1960 # 80415a38 <dev_node_ops+0x65c>
804101e8:	00003617          	auipc	a2,0x3
804101ec:	95460613          	addi	a2,a2,-1708 # 80412b3c <commands+0x1bc>
804101f0:	35900593          	li	a1,857
804101f4:	00006517          	auipc	a0,0x6
804101f8:	82c50513          	addi	a0,a0,-2004 # 80415a20 <dev_node_ops+0x644>
804101fc:	c28f00ef          	jal	ra,80400624 <__panic>
80410200:	00005697          	auipc	a3,0x5
80410204:	01468693          	addi	a3,a3,20 # 80415214 <syscalls+0x86c>
80410208:	00003617          	auipc	a2,0x3
8041020c:	93460613          	addi	a2,a2,-1740 # 80412b3c <commands+0x1bc>
80410210:	36300593          	li	a1,867
80410214:	00006517          	auipc	a0,0x6
80410218:	80c50513          	addi	a0,a0,-2036 # 80415a20 <dev_node_ops+0x644>
8041021c:	c08f00ef          	jal	ra,80400624 <__panic>
80410220:	00004697          	auipc	a3,0x4
80410224:	e6868693          	addi	a3,a3,-408 # 80414088 <CSWTCH.69+0x12c>
80410228:	00003617          	auipc	a2,0x3
8041022c:	91460613          	addi	a2,a2,-1772 # 80412b3c <commands+0x1bc>
80410230:	36800593          	li	a1,872
80410234:	00005517          	auipc	a0,0x5
80410238:	7ec50513          	addi	a0,a0,2028 # 80415a20 <dev_node_ops+0x644>
8041023c:	be8f00ef          	jal	ra,80400624 <__panic>

80410240 <sfs_bmap_load_nolock>:
80410240:	fc010113          	addi	sp,sp,-64
80410244:	03212823          	sw	s2,48(sp)
80410248:	0005a903          	lw	s2,0(a1)
8041024c:	03312623          	sw	s3,44(sp)
80410250:	02112e23          	sw	ra,60(sp)
80410254:	00892983          	lw	s3,8(s2)
80410258:	02812c23          	sw	s0,56(sp)
8041025c:	02912a23          	sw	s1,52(sp)
80410260:	03412423          	sw	s4,40(sp)
80410264:	03512223          	sw	s5,36(sp)
80410268:	03612023          	sw	s6,32(sp)
8041026c:	01712e23          	sw	s7,28(sp)
80410270:	01812c23          	sw	s8,24(sp)
80410274:	01912a23          	sw	s9,20(sp)
80410278:	01a12823          	sw	s10,16(sp)
8041027c:	22c9e863          	bltu	s3,a2,804104ac <sfs_bmap_load_nolock+0x26c>
80410280:	00b00793          	li	a5,11
80410284:	00058b13          	mv	s6,a1
80410288:	00060413          	mv	s0,a2
8041028c:	00050a13          	mv	s4,a0
80410290:	00068c13          	mv	s8,a3
80410294:	08c7fe63          	bgeu	a5,a2,80410330 <sfs_bmap_load_nolock+0xf0>
80410298:	ff460713          	addi	a4,a2,-12
8041029c:	3ff00793          	li	a5,1023
804102a0:	22e7e663          	bltu	a5,a4,804104cc <sfs_bmap_load_nolock+0x28c>
804102a4:	03c92c83          	lw	s9,60(s2)
804102a8:	00012623          	sw	zero,12(sp)
804102ac:	00271b93          	slli	s7,a4,0x2
804102b0:	01912423          	sw	s9,8(sp)
804102b4:	180c9a63          	bnez	s9,80410448 <sfs_bmap_load_nolock+0x208>
804102b8:	0cc98263          	beq	s3,a2,8041037c <sfs_bmap_load_nolock+0x13c>
804102bc:	03050a93          	addi	s5,a0,48
804102c0:	00000493          	li	s1,0
804102c4:	004a2503          	lw	a0,4(s4)
804102c8:	00048613          	mv	a2,s1
804102cc:	000a8593          	mv	a1,s5
804102d0:	bb1ff0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
804102d4:	08050463          	beqz	a0,8041035c <sfs_bmap_load_nolock+0x11c>
804102d8:	00899863          	bne	s3,s0,804102e8 <sfs_bmap_load_nolock+0xa8>
804102dc:	00892783          	lw	a5,8(s2)
804102e0:	00178793          	addi	a5,a5,1
804102e4:	00f92423          	sw	a5,8(s2)
804102e8:	00000a93          	li	s5,0
804102ec:	000c0463          	beqz	s8,804102f4 <sfs_bmap_load_nolock+0xb4>
804102f0:	009c2023          	sw	s1,0(s8)
804102f4:	03c12083          	lw	ra,60(sp)
804102f8:	03812403          	lw	s0,56(sp)
804102fc:	000a8513          	mv	a0,s5
80410300:	03412483          	lw	s1,52(sp)
80410304:	03012903          	lw	s2,48(sp)
80410308:	02c12983          	lw	s3,44(sp)
8041030c:	02812a03          	lw	s4,40(sp)
80410310:	02412a83          	lw	s5,36(sp)
80410314:	02012b03          	lw	s6,32(sp)
80410318:	01c12b83          	lw	s7,28(sp)
8041031c:	01812c03          	lw	s8,24(sp)
80410320:	01412c83          	lw	s9,20(sp)
80410324:	01012d03          	lw	s10,16(sp)
80410328:	04010113          	addi	sp,sp,64
8041032c:	00008067          	ret
80410330:	00261b93          	slli	s7,a2,0x2
80410334:	01790bb3          	add	s7,s2,s7
80410338:	00cba483          	lw	s1,12(s7)
8041033c:	00912223          	sw	s1,4(sp)
80410340:	10049063          	bnez	s1,80410440 <sfs_bmap_load_nolock+0x200>
80410344:	0cc98463          	beq	s3,a2,8041040c <sfs_bmap_load_nolock+0x1cc>
80410348:	00452503          	lw	a0,4(a0)
8041034c:	00000613          	li	a2,0
80410350:	030a0593          	addi	a1,s4,48
80410354:	b2dff0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
80410358:	f80518e3          	bnez	a0,804102e8 <sfs_bmap_load_nolock+0xa8>
8041035c:	00005697          	auipc	a3,0x5
80410360:	65c68693          	addi	a3,a3,1628 # 804159b8 <dev_node_ops+0x5dc>
80410364:	00002617          	auipc	a2,0x2
80410368:	7d860613          	addi	a2,a2,2008 # 80412b3c <commands+0x1bc>
8041036c:	16b00593          	li	a1,363
80410370:	00005517          	auipc	a0,0x5
80410374:	6b050513          	addi	a0,a0,1712 # 80415a20 <dev_node_ops+0x644>
80410378:	aacf00ef          	jal	ra,80400624 <__panic>
8041037c:	00810593          	addi	a1,sp,8
80410380:	b4dff0ef          	jal	ra,8040fecc <sfs_block_alloc>
80410384:	00050a93          	mv	s5,a0
80410388:	00c10d13          	addi	s10,sp,12
8041038c:	f60514e3          	bnez	a0,804102f4 <sfs_bmap_load_nolock+0xb4>
80410390:	000d0593          	mv	a1,s10
80410394:	000a0513          	mv	a0,s4
80410398:	b35ff0ef          	jal	ra,8040fecc <sfs_block_alloc>
8041039c:	00050a93          	mv	s5,a0
804103a0:	0e051c63          	bnez	a0,80410498 <sfs_bmap_load_nolock+0x258>
804103a4:	00812683          	lw	a3,8(sp)
804103a8:	000b8713          	mv	a4,s7
804103ac:	00400613          	li	a2,4
804103b0:	000d0593          	mv	a1,s10
804103b4:	000a0513          	mv	a0,s4
804103b8:	05d010ef          	jal	ra,80411c14 <sfs_wbuf>
804103bc:	00050a93          	mv	s5,a0
804103c0:	0c051663          	bnez	a0,8041048c <sfs_bmap_load_nolock+0x24c>
804103c4:	00c12483          	lw	s1,12(sp)
804103c8:	03c92703          	lw	a4,60(s2)
804103cc:	00812783          	lw	a5,8(sp)
804103d0:	00912223          	sw	s1,4(sp)
804103d4:	00f70a63          	beq	a4,a5,804103e8 <sfs_bmap_load_nolock+0x1a8>
804103d8:	12071663          	bnez	a4,80410504 <sfs_bmap_load_nolock+0x2c4>
804103dc:	02f92e23          	sw	a5,60(s2)
804103e0:	00100793          	li	a5,1
804103e4:	00fb2423          	sw	a5,8(s6)
804103e8:	030a0a93          	addi	s5,s4,48
804103ec:	ec048ce3          	beqz	s1,804102c4 <sfs_bmap_load_nolock+0x84>
804103f0:	004a2503          	lw	a0,4(s4)
804103f4:	00048613          	mv	a2,s1
804103f8:	000a8593          	mv	a1,s5
804103fc:	a85ff0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
80410400:	0e050263          	beqz	a0,804104e4 <sfs_bmap_load_nolock+0x2a4>
80410404:	00412483          	lw	s1,4(sp)
80410408:	ebdff06f          	j	804102c4 <sfs_bmap_load_nolock+0x84>
8041040c:	00410593          	addi	a1,sp,4
80410410:	abdff0ef          	jal	ra,8040fecc <sfs_block_alloc>
80410414:	00050a93          	mv	s5,a0
80410418:	ec051ee3          	bnez	a0,804102f4 <sfs_bmap_load_nolock+0xb4>
8041041c:	00412483          	lw	s1,4(sp)
80410420:	00100793          	li	a5,1
80410424:	009ba623          	sw	s1,12(s7)
80410428:	00fb2423          	sw	a5,8(s6)
8041042c:	fbdff06f          	j	804103e8 <sfs_bmap_load_nolock+0x1a8>
80410430:	03c92703          	lw	a4,60(s2)
80410434:	00812783          	lw	a5,8(sp)
80410438:	00912223          	sw	s1,4(sp)
8041043c:	f8e79ee3          	bne	a5,a4,804103d8 <sfs_bmap_load_nolock+0x198>
80410440:	030a0a93          	addi	s5,s4,48
80410444:	fadff06f          	j	804103f0 <sfs_bmap_load_nolock+0x1b0>
80410448:	00c10d13          	addi	s10,sp,12
8041044c:	000b8713          	mv	a4,s7
80410450:	000c8693          	mv	a3,s9
80410454:	00400613          	li	a2,4
80410458:	000d0593          	mv	a1,s10
8041045c:	6ec010ef          	jal	ra,80411b48 <sfs_rbuf>
80410460:	00050a93          	mv	s5,a0
80410464:	e80518e3          	bnez	a0,804102f4 <sfs_bmap_load_nolock+0xb4>
80410468:	00c12483          	lw	s1,12(sp)
8041046c:	fc0492e3          	bnez	s1,80410430 <sfs_bmap_load_nolock+0x1f0>
80410470:	f28980e3          	beq	s3,s0,80410390 <sfs_bmap_load_nolock+0x150>
80410474:	03c92703          	lw	a4,60(s2)
80410478:	00812783          	lw	a5,8(sp)
8041047c:	00012223          	sw	zero,4(sp)
80410480:	f4e79ce3          	bne	a5,a4,804103d8 <sfs_bmap_load_nolock+0x198>
80410484:	030a0a93          	addi	s5,s4,48
80410488:	e3dff06f          	j	804102c4 <sfs_bmap_load_nolock+0x84>
8041048c:	00c12583          	lw	a1,12(sp)
80410490:	000a0513          	mv	a0,s4
80410494:	afdff0ef          	jal	ra,8040ff90 <sfs_block_free>
80410498:	00812583          	lw	a1,8(sp)
8041049c:	e4bc8ce3          	beq	s9,a1,804102f4 <sfs_bmap_load_nolock+0xb4>
804104a0:	000a0513          	mv	a0,s4
804104a4:	aedff0ef          	jal	ra,8040ff90 <sfs_block_free>
804104a8:	e4dff06f          	j	804102f4 <sfs_bmap_load_nolock+0xb4>
804104ac:	00005697          	auipc	a3,0x5
804104b0:	4a868693          	addi	a3,a3,1192 # 80415954 <dev_node_ops+0x578>
804104b4:	00002617          	auipc	a2,0x2
804104b8:	68860613          	addi	a2,a2,1672 # 80412b3c <commands+0x1bc>
804104bc:	16400593          	li	a1,356
804104c0:	00005517          	auipc	a0,0x5
804104c4:	56050513          	addi	a0,a0,1376 # 80415a20 <dev_node_ops+0x644>
804104c8:	95cf00ef          	jal	ra,80400624 <__panic>
804104cc:	00005617          	auipc	a2,0x5
804104d0:	4b460613          	addi	a2,a2,1204 # 80415980 <dev_node_ops+0x5a4>
804104d4:	11e00593          	li	a1,286
804104d8:	00005517          	auipc	a0,0x5
804104dc:	54850513          	addi	a0,a0,1352 # 80415a20 <dev_node_ops+0x644>
804104e0:	944f00ef          	jal	ra,80400624 <__panic>
804104e4:	00005697          	auipc	a3,0x5
804104e8:	4c868693          	addi	a3,a3,1224 # 804159ac <dev_node_ops+0x5d0>
804104ec:	00002617          	auipc	a2,0x2
804104f0:	65060613          	addi	a2,a2,1616 # 80412b3c <commands+0x1bc>
804104f4:	12100593          	li	a1,289
804104f8:	00005517          	auipc	a0,0x5
804104fc:	52850513          	addi	a0,a0,1320 # 80415a20 <dev_node_ops+0x644>
80410500:	924f00ef          	jal	ra,80400624 <__panic>
80410504:	00005697          	auipc	a3,0x5
80410508:	46868693          	addi	a3,a3,1128 # 8041596c <dev_node_ops+0x590>
8041050c:	00002617          	auipc	a2,0x2
80410510:	63060613          	addi	a2,a2,1584 # 80412b3c <commands+0x1bc>
80410514:	11800593          	li	a1,280
80410518:	00005517          	auipc	a0,0x5
8041051c:	50850513          	addi	a0,a0,1288 # 80415a20 <dev_node_ops+0x644>
80410520:	904f00ef          	jal	ra,80400624 <__panic>

80410524 <sfs_io_nolock>:
80410524:	fa010113          	addi	sp,sp,-96
80410528:	03812c23          	sw	s8,56(sp)
8041052c:	00058c13          	mv	s8,a1
80410530:	0005a583          	lw	a1,0(a1)
80410534:	03912a23          	sw	s9,52(sp)
80410538:	00050c93          	mv	s9,a0
8041053c:	0045d503          	lhu	a0,4(a1)
80410540:	04112e23          	sw	ra,92(sp)
80410544:	04812c23          	sw	s0,88(sp)
80410548:	04912a23          	sw	s1,84(sp)
8041054c:	05212823          	sw	s2,80(sp)
80410550:	05312623          	sw	s3,76(sp)
80410554:	05412423          	sw	s4,72(sp)
80410558:	05512223          	sw	s5,68(sp)
8041055c:	05612023          	sw	s6,64(sp)
80410560:	03712e23          	sw	s7,60(sp)
80410564:	03a12823          	sw	s10,48(sp)
80410568:	03b12623          	sw	s11,44(sp)
8041056c:	00200813          	li	a6,2
80410570:	27050863          	beq	a0,a6,804107e0 <sfs_io_nolock+0x2bc>
80410574:	00072403          	lw	s0,0(a4)
80410578:	00070b93          	mv	s7,a4
8041057c:	000ba023          	sw	zero,0(s7)
80410580:	08000737          	lui	a4,0x8000
80410584:	00068493          	mv	s1,a3
80410588:	00068d93          	mv	s11,a3
8041058c:	00868433          	add	s0,a3,s0
80410590:	24e6f463          	bgeu	a3,a4,804107d8 <sfs_io_nolock+0x2b4>
80410594:	24d44263          	blt	s0,a3,804107d8 <sfs_io_nolock+0x2b4>
80410598:	00000513          	li	a0,0
8041059c:	0e868e63          	beq	a3,s0,80410698 <sfs_io_nolock+0x174>
804105a0:	00060993          	mv	s3,a2
804105a4:	00877463          	bgeu	a4,s0,804105ac <sfs_io_nolock+0x88>
804105a8:	08000437          	lui	s0,0x8000
804105ac:	12078463          	beqz	a5,804106d4 <sfs_io_nolock+0x1b0>
804105b0:	00001797          	auipc	a5,0x1
804105b4:	59078793          	addi	a5,a5,1424 # 80411b40 <sfs_wblock>
804105b8:	00f12623          	sw	a5,12(sp)
804105bc:	00001797          	auipc	a5,0x1
804105c0:	65878793          	addi	a5,a5,1624 # 80411c14 <sfs_wbuf>
804105c4:	00f12423          	sw	a5,8(sp)
804105c8:	41f4d913          	srai	s2,s1,0x1f
804105cc:	00001637          	lui	a2,0x1
804105d0:	fff60713          	addi	a4,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
804105d4:	01495693          	srli	a3,s2,0x14
804105d8:	41f45a13          	srai	s4,s0,0x1f
804105dc:	00e97933          	and	s2,s2,a4
804105e0:	00ea7ab3          	and	s5,s4,a4
804105e4:	00d48d33          	add	s10,s1,a3
804105e8:	00990933          	add	s2,s2,s1
804105ec:	008a8ab3          	add	s5,s5,s0
804105f0:	00ed7d33          	and	s10,s10,a4
804105f4:	40c95913          	srai	s2,s2,0xc
804105f8:	40cada93          	srai	s5,s5,0xc
804105fc:	40dd0d33          	sub	s10,s10,a3
80410600:	412a8ab3          	sub	s5,s5,s2
80410604:	100d0063          	beqz	s10,80410704 <sfs_io_nolock+0x1e0>
80410608:	40940b33          	sub	s6,s0,s1
8041060c:	140a9463          	bnez	s5,80410754 <sfs_io_nolock+0x230>
80410610:	01c10693          	addi	a3,sp,28
80410614:	00090613          	mv	a2,s2
80410618:	000c0593          	mv	a1,s8
8041061c:	000c8513          	mv	a0,s9
80410620:	c21ff0ef          	jal	ra,80410240 <sfs_bmap_load_nolock>
80410624:	14051663          	bnez	a0,80410770 <sfs_io_nolock+0x24c>
80410628:	01c12683          	lw	a3,28(sp)
8041062c:	00812783          	lw	a5,8(sp)
80410630:	000d0713          	mv	a4,s10
80410634:	000b0613          	mv	a2,s6
80410638:	00098593          	mv	a1,s3
8041063c:	000c8513          	mv	a0,s9
80410640:	000780e7          	jalr	a5
80410644:	12051663          	bnez	a0,80410770 <sfs_io_nolock+0x24c>
80410648:	180a8463          	beqz	s5,804107d0 <sfs_io_nolock+0x2ac>
8041064c:	fffa8a93          	addi	s5,s5,-1
80410650:	016989b3          	add	s3,s3,s6
80410654:	00190913          	addi	s2,s2,1
80410658:	0a0a9a63          	bnez	s5,8041070c <sfs_io_nolock+0x1e8>
8041065c:	014a5793          	srli	a5,s4,0x14
80410660:	00f40433          	add	s0,s0,a5
80410664:	01441413          	slli	s0,s0,0x14
80410668:	01445413          	srli	s0,s0,0x14
8041066c:	40f40433          	sub	s0,s0,a5
80410670:	12041263          	bnez	s0,80410794 <sfs_io_nolock+0x270>
80410674:	01648db3          	add	s11,s1,s6
80410678:	00000513          	li	a0,0
8041067c:	000c2783          	lw	a5,0(s8)
80410680:	016ba023          	sw	s6,0(s7)
80410684:	0007a703          	lw	a4,0(a5)
80410688:	01b77863          	bgeu	a4,s11,80410698 <sfs_io_nolock+0x174>
8041068c:	01b7a023          	sw	s11,0(a5)
80410690:	00100793          	li	a5,1
80410694:	00fc2423          	sw	a5,8(s8)
80410698:	05c12083          	lw	ra,92(sp)
8041069c:	05812403          	lw	s0,88(sp)
804106a0:	05412483          	lw	s1,84(sp)
804106a4:	05012903          	lw	s2,80(sp)
804106a8:	04c12983          	lw	s3,76(sp)
804106ac:	04812a03          	lw	s4,72(sp)
804106b0:	04412a83          	lw	s5,68(sp)
804106b4:	04012b03          	lw	s6,64(sp)
804106b8:	03c12b83          	lw	s7,60(sp)
804106bc:	03812c03          	lw	s8,56(sp)
804106c0:	03412c83          	lw	s9,52(sp)
804106c4:	03012d03          	lw	s10,48(sp)
804106c8:	02c12d83          	lw	s11,44(sp)
804106cc:	06010113          	addi	sp,sp,96
804106d0:	00008067          	ret
804106d4:	0005a783          	lw	a5,0(a1)
804106d8:	00000513          	li	a0,0
804106dc:	faf4fee3          	bgeu	s1,a5,80410698 <sfs_io_nolock+0x174>
804106e0:	0887fc63          	bgeu	a5,s0,80410778 <sfs_io_nolock+0x254>
804106e4:	00078413          	mv	s0,a5
804106e8:	00001797          	auipc	a5,0x1
804106ec:	45078793          	addi	a5,a5,1104 # 80411b38 <sfs_rblock>
804106f0:	00f12623          	sw	a5,12(sp)
804106f4:	00001797          	auipc	a5,0x1
804106f8:	45478793          	addi	a5,a5,1108 # 80411b48 <sfs_rbuf>
804106fc:	00f12423          	sw	a5,8(sp)
80410700:	ec9ff06f          	j	804105c8 <sfs_io_nolock+0xa4>
80410704:	00000b13          	li	s6,0
80410708:	f40a8ae3          	beqz	s5,8041065c <sfs_io_nolock+0x138>
8041070c:	01c10693          	addi	a3,sp,28
80410710:	00090613          	mv	a2,s2
80410714:	000c0593          	mv	a1,s8
80410718:	000c8513          	mv	a0,s9
8041071c:	b25ff0ef          	jal	ra,80410240 <sfs_bmap_load_nolock>
80410720:	0a051863          	bnez	a0,804107d0 <sfs_io_nolock+0x2ac>
80410724:	01c12603          	lw	a2,28(sp)
80410728:	00c12783          	lw	a5,12(sp)
8041072c:	000a8693          	mv	a3,s5
80410730:	00098593          	mv	a1,s3
80410734:	000c8513          	mv	a0,s9
80410738:	000780e7          	jalr	a5
8041073c:	08051a63          	bnez	a0,804107d0 <sfs_io_nolock+0x2ac>
80410740:	00ca9713          	slli	a4,s5,0xc
80410744:	00eb0b33          	add	s6,s6,a4
80410748:	00e989b3          	add	s3,s3,a4
8041074c:	01590933          	add	s2,s2,s5
80410750:	f0dff06f          	j	8041065c <sfs_io_nolock+0x138>
80410754:	41a60b33          	sub	s6,a2,s10
80410758:	01c10693          	addi	a3,sp,28
8041075c:	00090613          	mv	a2,s2
80410760:	000c0593          	mv	a1,s8
80410764:	000c8513          	mv	a0,s9
80410768:	ad9ff0ef          	jal	ra,80410240 <sfs_bmap_load_nolock>
8041076c:	ea050ee3          	beqz	a0,80410628 <sfs_io_nolock+0x104>
80410770:	00000b13          	li	s6,0
80410774:	f09ff06f          	j	8041067c <sfs_io_nolock+0x158>
80410778:	00001797          	auipc	a5,0x1
8041077c:	3c078793          	addi	a5,a5,960 # 80411b38 <sfs_rblock>
80410780:	00f12623          	sw	a5,12(sp)
80410784:	00001797          	auipc	a5,0x1
80410788:	3c478793          	addi	a5,a5,964 # 80411b48 <sfs_rbuf>
8041078c:	00f12423          	sw	a5,8(sp)
80410790:	e39ff06f          	j	804105c8 <sfs_io_nolock+0xa4>
80410794:	01c10693          	addi	a3,sp,28
80410798:	00090613          	mv	a2,s2
8041079c:	000c0593          	mv	a1,s8
804107a0:	000c8513          	mv	a0,s9
804107a4:	a9dff0ef          	jal	ra,80410240 <sfs_bmap_load_nolock>
804107a8:	02051463          	bnez	a0,804107d0 <sfs_io_nolock+0x2ac>
804107ac:	01c12683          	lw	a3,28(sp)
804107b0:	00812783          	lw	a5,8(sp)
804107b4:	00000713          	li	a4,0
804107b8:	00040613          	mv	a2,s0
804107bc:	00098593          	mv	a1,s3
804107c0:	000c8513          	mv	a0,s9
804107c4:	000780e7          	jalr	a5
804107c8:	00051463          	bnez	a0,804107d0 <sfs_io_nolock+0x2ac>
804107cc:	008b0b33          	add	s6,s6,s0
804107d0:	01648db3          	add	s11,s1,s6
804107d4:	ea9ff06f          	j	8041067c <sfs_io_nolock+0x158>
804107d8:	ffd00513          	li	a0,-3
804107dc:	ebdff06f          	j	80410698 <sfs_io_nolock+0x174>
804107e0:	00005697          	auipc	a3,0x5
804107e4:	2a868693          	addi	a3,a3,680 # 80415a88 <dev_node_ops+0x6ac>
804107e8:	00002617          	auipc	a2,0x2
804107ec:	35460613          	addi	a2,a2,852 # 80412b3c <commands+0x1bc>
804107f0:	22b00593          	li	a1,555
804107f4:	00005517          	auipc	a0,0x5
804107f8:	22c50513          	addi	a0,a0,556 # 80415a20 <dev_node_ops+0x644>
804107fc:	e29ef0ef          	jal	ra,80400624 <__panic>

80410800 <sfs_dirent_read_nolock>:
80410800:	0005a783          	lw	a5,0(a1)
80410804:	fe010113          	addi	sp,sp,-32
80410808:	00112e23          	sw	ra,28(sp)
8041080c:	0047d803          	lhu	a6,4(a5)
80410810:	00812c23          	sw	s0,24(sp)
80410814:	00912a23          	sw	s1,20(sp)
80410818:	00200713          	li	a4,2
8041081c:	06e81e63          	bne	a6,a4,80410898 <sfs_dirent_read_nolock+0x98>
80410820:	0087a783          	lw	a5,8(a5)
80410824:	06f67a63          	bgeu	a2,a5,80410898 <sfs_dirent_read_nolock+0x98>
80410828:	00068493          	mv	s1,a3
8041082c:	00c10693          	addi	a3,sp,12
80410830:	00050413          	mv	s0,a0
80410834:	a0dff0ef          	jal	ra,80410240 <sfs_bmap_load_nolock>
80410838:	00050c63          	beqz	a0,80410850 <sfs_dirent_read_nolock+0x50>
8041083c:	01c12083          	lw	ra,28(sp)
80410840:	01812403          	lw	s0,24(sp)
80410844:	01412483          	lw	s1,20(sp)
80410848:	02010113          	addi	sp,sp,32
8041084c:	00008067          	ret
80410850:	00c12603          	lw	a2,12(sp)
80410854:	00442503          	lw	a0,4(s0) # 8000004 <_binary_bin_sfs_img_size+0x7f88004>
80410858:	03040593          	addi	a1,s0,48
8041085c:	e24ff0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
80410860:	04050c63          	beqz	a0,804108b8 <sfs_dirent_read_nolock+0xb8>
80410864:	00c12683          	lw	a3,12(sp)
80410868:	00000713          	li	a4,0
8041086c:	10400613          	li	a2,260
80410870:	00048593          	mv	a1,s1
80410874:	00040513          	mv	a0,s0
80410878:	2d0010ef          	jal	ra,80411b48 <sfs_rbuf>
8041087c:	fc0510e3          	bnez	a0,8041083c <sfs_dirent_read_nolock+0x3c>
80410880:	100481a3          	sb	zero,259(s1)
80410884:	01c12083          	lw	ra,28(sp)
80410888:	01812403          	lw	s0,24(sp)
8041088c:	01412483          	lw	s1,20(sp)
80410890:	02010113          	addi	sp,sp,32
80410894:	00008067          	ret
80410898:	00005697          	auipc	a3,0x5
8041089c:	13c68693          	addi	a3,a3,316 # 804159d4 <dev_node_ops+0x5f8>
804108a0:	00002617          	auipc	a2,0x2
804108a4:	29c60613          	addi	a2,a2,668 # 80412b3c <commands+0x1bc>
804108a8:	18e00593          	li	a1,398
804108ac:	00005517          	auipc	a0,0x5
804108b0:	17450513          	addi	a0,a0,372 # 80415a20 <dev_node_ops+0x644>
804108b4:	d71ef0ef          	jal	ra,80400624 <__panic>
804108b8:	00005697          	auipc	a3,0x5
804108bc:	10068693          	addi	a3,a3,256 # 804159b8 <dev_node_ops+0x5dc>
804108c0:	00002617          	auipc	a2,0x2
804108c4:	27c60613          	addi	a2,a2,636 # 80412b3c <commands+0x1bc>
804108c8:	19500593          	li	a1,405
804108cc:	00005517          	auipc	a0,0x5
804108d0:	15450513          	addi	a0,a0,340 # 80415a20 <dev_node_ops+0x644>
804108d4:	d51ef0ef          	jal	ra,80400624 <__panic>

804108d8 <sfs_getdirentry>:
804108d8:	fd010113          	addi	sp,sp,-48
804108dc:	02912223          	sw	s1,36(sp)
804108e0:	00050493          	mv	s1,a0
804108e4:	10400513          	li	a0,260
804108e8:	01812423          	sw	s8,8(sp)
804108ec:	02112623          	sw	ra,44(sp)
804108f0:	02812423          	sw	s0,40(sp)
804108f4:	03212023          	sw	s2,32(sp)
804108f8:	01312e23          	sw	s3,28(sp)
804108fc:	01412c23          	sw	s4,24(sp)
80410900:	01512a23          	sw	s5,20(sp)
80410904:	01612823          	sw	s6,16(sp)
80410908:	01712623          	sw	s7,12(sp)
8041090c:	00058c13          	mv	s8,a1
80410910:	874f20ef          	jal	ra,80402984 <kmalloc>
80410914:	12050a63          	beqz	a0,80410a48 <sfs_getdirentry+0x170>
80410918:	0384aa83          	lw	s5,56(s1)
8041091c:	120a8a63          	beqz	s5,80410a50 <sfs_getdirentry+0x178>
80410920:	06caa783          	lw	a5,108(s5)
80410924:	12079663          	bnez	a5,80410a50 <sfs_getdirentry+0x178>
80410928:	02c4a703          	lw	a4,44(s1)
8041092c:	000017b7          	lui	a5,0x1
80410930:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410934:	12f71e63          	bne	a4,a5,80410a70 <sfs_getdirentry+0x198>
80410938:	004c2403          	lw	s0,4(s8)
8041093c:	00050913          	mv	s2,a0
80410940:	0e044663          	bltz	s0,80410a2c <sfs_getdirentry+0x154>
80410944:	0ff47793          	andi	a5,s0,255
80410948:	0e079263          	bnez	a5,80410a2c <sfs_getdirentry+0x154>
8041094c:	0004a783          	lw	a5,0(s1)
80410950:	00845413          	srli	s0,s0,0x8
80410954:	0087a783          	lw	a5,8(a5)
80410958:	0e87e263          	bltu	a5,s0,80410a3c <sfs_getdirentry+0x164>
8041095c:	01048b93          	addi	s7,s1,16
80410960:	000b8513          	mv	a0,s7
80410964:	f5cf40ef          	jal	ra,804050c0 <down>
80410968:	0004a783          	lw	a5,0(s1)
8041096c:	0087ab03          	lw	s6,8(a5)
80410970:	0b605663          	blez	s6,80410a1c <sfs_getdirentry+0x144>
80410974:	00000993          	li	s3,0
80410978:	01c0006f          	j	80410994 <sfs_getdirentry+0xbc>
8041097c:	00092783          	lw	a5,0(s2)
80410980:	00078663          	beqz	a5,8041098c <sfs_getdirentry+0xb4>
80410984:	02040c63          	beqz	s0,804109bc <sfs_getdirentry+0xe4>
80410988:	fff40413          	addi	s0,s0,-1
8041098c:	00198993          	addi	s3,s3,1
80410990:	093b0663          	beq	s6,s3,80410a1c <sfs_getdirentry+0x144>
80410994:	00090693          	mv	a3,s2
80410998:	00098613          	mv	a2,s3
8041099c:	00048593          	mv	a1,s1
804109a0:	000a8513          	mv	a0,s5
804109a4:	e5dff0ef          	jal	ra,80410800 <sfs_dirent_read_nolock>
804109a8:	00050a13          	mv	s4,a0
804109ac:	fc0508e3          	beqz	a0,8041097c <sfs_getdirentry+0xa4>
804109b0:	000b8513          	mv	a0,s7
804109b4:	f08f40ef          	jal	ra,804050bc <up>
804109b8:	0280006f          	j	804109e0 <sfs_getdirentry+0x108>
804109bc:	000b8513          	mv	a0,s7
804109c0:	efcf40ef          	jal	ra,804050bc <up>
804109c4:	00000713          	li	a4,0
804109c8:	00100693          	li	a3,1
804109cc:	10000613          	li	a2,256
804109d0:	00490593          	addi	a1,s2,4
804109d4:	000c0513          	mv	a0,s8
804109d8:	b51f50ef          	jal	ra,80406528 <iobuf_move>
804109dc:	00050a13          	mv	s4,a0
804109e0:	00090513          	mv	a0,s2
804109e4:	8c4f20ef          	jal	ra,80402aa8 <kfree>
804109e8:	02c12083          	lw	ra,44(sp)
804109ec:	02812403          	lw	s0,40(sp)
804109f0:	000a0513          	mv	a0,s4
804109f4:	02412483          	lw	s1,36(sp)
804109f8:	02012903          	lw	s2,32(sp)
804109fc:	01c12983          	lw	s3,28(sp)
80410a00:	01812a03          	lw	s4,24(sp)
80410a04:	01412a83          	lw	s5,20(sp)
80410a08:	01012b03          	lw	s6,16(sp)
80410a0c:	00c12b83          	lw	s7,12(sp)
80410a10:	00812c03          	lw	s8,8(sp)
80410a14:	03010113          	addi	sp,sp,48
80410a18:	00008067          	ret
80410a1c:	000b8513          	mv	a0,s7
80410a20:	ff000a13          	li	s4,-16
80410a24:	e98f40ef          	jal	ra,804050bc <up>
80410a28:	fb9ff06f          	j	804109e0 <sfs_getdirentry+0x108>
80410a2c:	00090513          	mv	a0,s2
80410a30:	878f20ef          	jal	ra,80402aa8 <kfree>
80410a34:	ffd00a13          	li	s4,-3
80410a38:	fb1ff06f          	j	804109e8 <sfs_getdirentry+0x110>
80410a3c:	86cf20ef          	jal	ra,80402aa8 <kfree>
80410a40:	ff000a13          	li	s4,-16
80410a44:	fa5ff06f          	j	804109e8 <sfs_getdirentry+0x110>
80410a48:	ffc00a13          	li	s4,-4
80410a4c:	f9dff06f          	j	804109e8 <sfs_getdirentry+0x110>
80410a50:	00005697          	auipc	a3,0x5
80410a54:	e3468693          	addi	a3,a3,-460 # 80415884 <dev_node_ops+0x4a8>
80410a58:	00002617          	auipc	a2,0x2
80410a5c:	0e460613          	addi	a2,a2,228 # 80412b3c <commands+0x1bc>
80410a60:	33a00593          	li	a1,826
80410a64:	00005517          	auipc	a0,0x5
80410a68:	fbc50513          	addi	a0,a0,-68 # 80415a20 <dev_node_ops+0x644>
80410a6c:	bb9ef0ef          	jal	ra,80400624 <__panic>
80410a70:	00005697          	auipc	a3,0x5
80410a74:	fc868693          	addi	a3,a3,-56 # 80415a38 <dev_node_ops+0x65c>
80410a78:	00002617          	auipc	a2,0x2
80410a7c:	0c460613          	addi	a2,a2,196 # 80412b3c <commands+0x1bc>
80410a80:	33b00593          	li	a1,827
80410a84:	00005517          	auipc	a0,0x5
80410a88:	f9c50513          	addi	a0,a0,-100 # 80415a20 <dev_node_ops+0x644>
80410a8c:	b99ef0ef          	jal	ra,80400624 <__panic>

80410a90 <sfs_truncfile>:
80410a90:	fa010113          	addi	sp,sp,-96
80410a94:	04112e23          	sw	ra,92(sp)
80410a98:	04812c23          	sw	s0,88(sp)
80410a9c:	04912a23          	sw	s1,84(sp)
80410aa0:	05212823          	sw	s2,80(sp)
80410aa4:	05312623          	sw	s3,76(sp)
80410aa8:	05412423          	sw	s4,72(sp)
80410aac:	05512223          	sw	s5,68(sp)
80410ab0:	05612023          	sw	s6,64(sp)
80410ab4:	03712e23          	sw	s7,60(sp)
80410ab8:	03812c23          	sw	s8,56(sp)
80410abc:	03912a23          	sw	s9,52(sp)
80410ac0:	03a12823          	sw	s10,48(sp)
80410ac4:	03b12623          	sw	s11,44(sp)
80410ac8:	080007b7          	lui	a5,0x8000
80410acc:	1eb7ec63          	bltu	a5,a1,80410cc4 <sfs_truncfile+0x234>
80410ad0:	03852d03          	lw	s10,56(a0)
80410ad4:	00050913          	mv	s2,a0
80410ad8:	00058a13          	mv	s4,a1
80410adc:	1e0d0863          	beqz	s10,80410ccc <sfs_truncfile+0x23c>
80410ae0:	06cd2783          	lw	a5,108(s10)
80410ae4:	1e079463          	bnez	a5,80410ccc <sfs_truncfile+0x23c>
80410ae8:	02c52703          	lw	a4,44(a0)
80410aec:	000014b7          	lui	s1,0x1
80410af0:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410af4:	20f71c63          	bne	a4,a5,80410d0c <sfs_truncfile+0x27c>
80410af8:	00052a83          	lw	s5,0(a0)
80410afc:	fff48493          	addi	s1,s1,-1
80410b00:	009584b3          	add	s1,a1,s1
80410b04:	000aa783          	lw	a5,0(s5)
80410b08:	00c4d493          	srli	s1,s1,0xc
80410b0c:	04f59863          	bne	a1,a5,80410b5c <sfs_truncfile+0xcc>
80410b10:	008aa783          	lw	a5,8(s5)
80410b14:	00000c93          	li	s9,0
80410b18:	20f49a63          	bne	s1,a5,80410d2c <sfs_truncfile+0x29c>
80410b1c:	05c12083          	lw	ra,92(sp)
80410b20:	05812403          	lw	s0,88(sp)
80410b24:	000c8513          	mv	a0,s9
80410b28:	05412483          	lw	s1,84(sp)
80410b2c:	05012903          	lw	s2,80(sp)
80410b30:	04c12983          	lw	s3,76(sp)
80410b34:	04812a03          	lw	s4,72(sp)
80410b38:	04412a83          	lw	s5,68(sp)
80410b3c:	04012b03          	lw	s6,64(sp)
80410b40:	03c12b83          	lw	s7,60(sp)
80410b44:	03812c03          	lw	s8,56(sp)
80410b48:	03412c83          	lw	s9,52(sp)
80410b4c:	03012d03          	lw	s10,48(sp)
80410b50:	02c12d83          	lw	s11,44(sp)
80410b54:	06010113          	addi	sp,sp,96
80410b58:	00008067          	ret
80410b5c:	01050b13          	addi	s6,a0,16
80410b60:	000b0513          	mv	a0,s6
80410b64:	d5cf40ef          	jal	ra,804050c0 <down>
80410b68:	008aa403          	lw	s0,8(s5)
80410b6c:	0e946063          	bltu	s0,s1,80410c4c <sfs_truncfile+0x1bc>
80410b70:	1084f263          	bgeu	s1,s0,80410c74 <sfs_truncfile+0x1e4>
80410b74:	00092d83          	lw	s11,0(s2)
80410b78:	008da783          	lw	a5,8(s11) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80410b7c:	16078863          	beqz	a5,80410cec <sfs_truncfile+0x25c>
80410b80:	030d0713          	addi	a4,s10,48
80410b84:	00b00b93          	li	s7,11
80410b88:	00e12623          	sw	a4,12(sp)
80410b8c:	00100c13          	li	s8,1
80410b90:	0900006f          	j	80410c20 <sfs_truncfile+0x190>
80410b94:	ff378993          	addi	s3,a5,-13 # 7fffff3 <_binary_bin_sfs_img_size+0x7f87ff3>
80410b98:	3ff00793          	li	a5,1023
80410b9c:	0737e063          	bltu	a5,s3,80410bfc <sfs_truncfile+0x16c>
80410ba0:	03cda783          	lw	a5,60(s11)
80410ba4:	04078c63          	beqz	a5,80410bfc <sfs_truncfile+0x16c>
80410ba8:	004d2503          	lw	a0,4(s10)
80410bac:	00c12583          	lw	a1,12(sp)
80410bb0:	00078613          	mv	a2,a5
80410bb4:	00f12423          	sw	a5,8(sp)
80410bb8:	ac8ff0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
80410bbc:	00812783          	lw	a5,8(sp)
80410bc0:	18050663          	beqz	a0,80410d4c <sfs_truncfile+0x2bc>
80410bc4:	00299993          	slli	s3,s3,0x2
80410bc8:	00098713          	mv	a4,s3
80410bcc:	00078693          	mv	a3,a5
80410bd0:	00400613          	li	a2,4
80410bd4:	01810593          	addi	a1,sp,24
80410bd8:	000d0513          	mv	a0,s10
80410bdc:	00f12423          	sw	a5,8(sp)
80410be0:	00012e23          	sw	zero,28(sp)
80410be4:	765000ef          	jal	ra,80411b48 <sfs_rbuf>
80410be8:	00050c93          	mv	s9,a0
80410bec:	08051e63          	bnez	a0,80410c88 <sfs_truncfile+0x1f8>
80410bf0:	01812703          	lw	a4,24(sp)
80410bf4:	00812783          	lw	a5,8(sp)
80410bf8:	08071e63          	bnez	a4,80410c94 <sfs_truncfile+0x204>
80410bfc:	008da783          	lw	a5,8(s11)
80410c00:	fff40413          	addi	s0,s0,-1
80410c04:	fff78793          	addi	a5,a5,-1
80410c08:	00fda423          	sw	a5,8(s11)
80410c0c:	01892423          	sw	s8,8(s2)
80410c10:	06848063          	beq	s1,s0,80410c70 <sfs_truncfile+0x1e0>
80410c14:	00092d83          	lw	s11,0(s2)
80410c18:	008da783          	lw	a5,8(s11)
80410c1c:	0c078863          	beqz	a5,80410cec <sfs_truncfile+0x25c>
80410c20:	fff78713          	addi	a4,a5,-1
80410c24:	f6ebe8e3          	bltu	s7,a4,80410b94 <sfs_truncfile+0x104>
80410c28:	00279793          	slli	a5,a5,0x2
80410c2c:	00fd89b3          	add	s3,s11,a5
80410c30:	0089a583          	lw	a1,8(s3)
80410c34:	fc0584e3          	beqz	a1,80410bfc <sfs_truncfile+0x16c>
80410c38:	000d0513          	mv	a0,s10
80410c3c:	b54ff0ef          	jal	ra,8040ff90 <sfs_block_free>
80410c40:	0009a423          	sw	zero,8(s3)
80410c44:	01892423          	sw	s8,8(s2)
80410c48:	fb5ff06f          	j	80410bfc <sfs_truncfile+0x16c>
80410c4c:	00000693          	li	a3,0
80410c50:	00040613          	mv	a2,s0
80410c54:	00090593          	mv	a1,s2
80410c58:	000d0513          	mv	a0,s10
80410c5c:	de4ff0ef          	jal	ra,80410240 <sfs_bmap_load_nolock>
80410c60:	00050c93          	mv	s9,a0
80410c64:	02051263          	bnez	a0,80410c88 <sfs_truncfile+0x1f8>
80410c68:	00140413          	addi	s0,s0,1
80410c6c:	fe8490e3          	bne	s1,s0,80410c4c <sfs_truncfile+0x1bc>
80410c70:	008aa403          	lw	s0,8(s5)
80410c74:	0e849c63          	bne	s1,s0,80410d6c <sfs_truncfile+0x2dc>
80410c78:	014aa023          	sw	s4,0(s5)
80410c7c:	00100793          	li	a5,1
80410c80:	00f92423          	sw	a5,8(s2)
80410c84:	00000c93          	li	s9,0
80410c88:	000b0513          	mv	a0,s6
80410c8c:	c30f40ef          	jal	ra,804050bc <up>
80410c90:	e8dff06f          	j	80410b1c <sfs_truncfile+0x8c>
80410c94:	00098713          	mv	a4,s3
80410c98:	00078693          	mv	a3,a5
80410c9c:	00400613          	li	a2,4
80410ca0:	01c10593          	addi	a1,sp,28
80410ca4:	000d0513          	mv	a0,s10
80410ca8:	76d000ef          	jal	ra,80411c14 <sfs_wbuf>
80410cac:	00050c93          	mv	s9,a0
80410cb0:	fc051ce3          	bnez	a0,80410c88 <sfs_truncfile+0x1f8>
80410cb4:	01812583          	lw	a1,24(sp)
80410cb8:	000d0513          	mv	a0,s10
80410cbc:	ad4ff0ef          	jal	ra,8040ff90 <sfs_block_free>
80410cc0:	f3dff06f          	j	80410bfc <sfs_truncfile+0x16c>
80410cc4:	ffd00c93          	li	s9,-3
80410cc8:	e55ff06f          	j	80410b1c <sfs_truncfile+0x8c>
80410ccc:	00005697          	auipc	a3,0x5
80410cd0:	bb868693          	addi	a3,a3,-1096 # 80415884 <dev_node_ops+0x4a8>
80410cd4:	00002617          	auipc	a2,0x2
80410cd8:	e6860613          	addi	a2,a2,-408 # 80412b3c <commands+0x1bc>
80410cdc:	3a900593          	li	a1,937
80410ce0:	00005517          	auipc	a0,0x5
80410ce4:	d4050513          	addi	a0,a0,-704 # 80415a20 <dev_node_ops+0x644>
80410ce8:	93def0ef          	jal	ra,80400624 <__panic>
80410cec:	00005697          	auipc	a3,0x5
80410cf0:	ef868693          	addi	a3,a3,-264 # 80415be4 <sfs_node_fileops+0x70>
80410cf4:	00002617          	auipc	a2,0x2
80410cf8:	e4860613          	addi	a2,a2,-440 # 80412b3c <commands+0x1bc>
80410cfc:	17b00593          	li	a1,379
80410d00:	00005517          	auipc	a0,0x5
80410d04:	d2050513          	addi	a0,a0,-736 # 80415a20 <dev_node_ops+0x644>
80410d08:	91def0ef          	jal	ra,80400624 <__panic>
80410d0c:	00005697          	auipc	a3,0x5
80410d10:	d2c68693          	addi	a3,a3,-724 # 80415a38 <dev_node_ops+0x65c>
80410d14:	00002617          	auipc	a2,0x2
80410d18:	e2860613          	addi	a2,a2,-472 # 80412b3c <commands+0x1bc>
80410d1c:	3aa00593          	li	a1,938
80410d20:	00005517          	auipc	a0,0x5
80410d24:	d0050513          	addi	a0,a0,-768 # 80415a20 <dev_node_ops+0x644>
80410d28:	8fdef0ef          	jal	ra,80400624 <__panic>
80410d2c:	00005697          	auipc	a3,0x5
80410d30:	ea068693          	addi	a3,a3,-352 # 80415bcc <sfs_node_fileops+0x58>
80410d34:	00002617          	auipc	a2,0x2
80410d38:	e0860613          	addi	a2,a2,-504 # 80412b3c <commands+0x1bc>
80410d3c:	3b100593          	li	a1,945
80410d40:	00005517          	auipc	a0,0x5
80410d44:	ce050513          	addi	a0,a0,-800 # 80415a20 <dev_node_ops+0x644>
80410d48:	8ddef0ef          	jal	ra,80400624 <__panic>
80410d4c:	00005697          	auipc	a3,0x5
80410d50:	eac68693          	addi	a3,a3,-340 # 80415bf8 <sfs_node_fileops+0x84>
80410d54:	00002617          	auipc	a2,0x2
80410d58:	de860613          	addi	a2,a2,-536 # 80412b3c <commands+0x1bc>
80410d5c:	12b00593          	li	a1,299
80410d60:	00005517          	auipc	a0,0x5
80410d64:	cc050513          	addi	a0,a0,-832 # 80415a20 <dev_node_ops+0x644>
80410d68:	8bdef0ef          	jal	ra,80400624 <__panic>
80410d6c:	00005697          	auipc	a3,0x5
80410d70:	ec068693          	addi	a3,a3,-320 # 80415c2c <sfs_node_fileops+0xb8>
80410d74:	00002617          	auipc	a2,0x2
80410d78:	dc860613          	addi	a2,a2,-568 # 80412b3c <commands+0x1bc>
80410d7c:	3ca00593          	li	a1,970
80410d80:	00005517          	auipc	a0,0x5
80410d84:	ca050513          	addi	a0,a0,-864 # 80415a20 <dev_node_ops+0x644>
80410d88:	89def0ef          	jal	ra,80400624 <__panic>

80410d8c <sfs_tryseek>:
80410d8c:	080007b7          	lui	a5,0x8000
80410d90:	08f5fa63          	bgeu	a1,a5,80410e24 <sfs_tryseek+0x98>
80410d94:	ff010113          	addi	sp,sp,-16
80410d98:	00812423          	sw	s0,8(sp)
80410d9c:	00912223          	sw	s1,4(sp)
80410da0:	00112623          	sw	ra,12(sp)
80410da4:	00050413          	mv	s0,a0
80410da8:	00058493          	mv	s1,a1
80410dac:	08050063          	beqz	a0,80410e2c <sfs_tryseek+0xa0>
80410db0:	02c52703          	lw	a4,44(a0)
80410db4:	000017b7          	lui	a5,0x1
80410db8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410dbc:	06f71863          	bne	a4,a5,80410e2c <sfs_tryseek+0xa0>
80410dc0:	00052783          	lw	a5,0(a0)
80410dc4:	0007a783          	lw	a5,0(a5)
80410dc8:	04b7f263          	bgeu	a5,a1,80410e0c <sfs_tryseek+0x80>
80410dcc:	03c52783          	lw	a5,60(a0)
80410dd0:	06078e63          	beqz	a5,80410e4c <sfs_tryseek+0xc0>
80410dd4:	0307a783          	lw	a5,48(a5)
80410dd8:	06078a63          	beqz	a5,80410e4c <sfs_tryseek+0xc0>
80410ddc:	00004597          	auipc	a1,0x4
80410de0:	48c58593          	addi	a1,a1,1164 # 80415268 <syscalls+0x8c0>
80410de4:	d60fc0ef          	jal	ra,8040d344 <inode_check>
80410de8:	03c42783          	lw	a5,60(s0)
80410dec:	00040513          	mv	a0,s0
80410df0:	00812403          	lw	s0,8(sp)
80410df4:	00c12083          	lw	ra,12(sp)
80410df8:	00048593          	mv	a1,s1
80410dfc:	0307a303          	lw	t1,48(a5)
80410e00:	00412483          	lw	s1,4(sp)
80410e04:	01010113          	addi	sp,sp,16
80410e08:	00030067          	jr	t1
80410e0c:	00c12083          	lw	ra,12(sp)
80410e10:	00812403          	lw	s0,8(sp)
80410e14:	00412483          	lw	s1,4(sp)
80410e18:	00000513          	li	a0,0
80410e1c:	01010113          	addi	sp,sp,16
80410e20:	00008067          	ret
80410e24:	ffd00513          	li	a0,-3
80410e28:	00008067          	ret
80410e2c:	00005697          	auipc	a3,0x5
80410e30:	c0c68693          	addi	a3,a3,-1012 # 80415a38 <dev_node_ops+0x65c>
80410e34:	00002617          	auipc	a2,0x2
80410e38:	d0860613          	addi	a2,a2,-760 # 80412b3c <commands+0x1bc>
80410e3c:	39a00593          	li	a1,922
80410e40:	00005517          	auipc	a0,0x5
80410e44:	be050513          	addi	a0,a0,-1056 # 80415a20 <dev_node_ops+0x644>
80410e48:	fdcef0ef          	jal	ra,80400624 <__panic>
80410e4c:	00004697          	auipc	a3,0x4
80410e50:	3c868693          	addi	a3,a3,968 # 80415214 <syscalls+0x86c>
80410e54:	00002617          	auipc	a2,0x2
80410e58:	ce860613          	addi	a2,a2,-792 # 80412b3c <commands+0x1bc>
80410e5c:	39c00593          	li	a1,924
80410e60:	00005517          	auipc	a0,0x5
80410e64:	bc050513          	addi	a0,a0,-1088 # 80415a20 <dev_node_ops+0x644>
80410e68:	fbcef0ef          	jal	ra,80400624 <__panic>

80410e6c <sfs_close>:
80410e6c:	ff010113          	addi	sp,sp,-16
80410e70:	00112623          	sw	ra,12(sp)
80410e74:	00812423          	sw	s0,8(sp)
80410e78:	04050063          	beqz	a0,80410eb8 <sfs_close+0x4c>
80410e7c:	03c52783          	lw	a5,60(a0)
80410e80:	00050413          	mv	s0,a0
80410e84:	02078a63          	beqz	a5,80410eb8 <sfs_close+0x4c>
80410e88:	0187a783          	lw	a5,24(a5)
80410e8c:	02078663          	beqz	a5,80410eb8 <sfs_close+0x4c>
80410e90:	00003597          	auipc	a1,0x3
80410e94:	24858593          	addi	a1,a1,584 # 804140d8 <CSWTCH.69+0x17c>
80410e98:	cacfc0ef          	jal	ra,8040d344 <inode_check>
80410e9c:	03c42783          	lw	a5,60(s0)
80410ea0:	00040513          	mv	a0,s0
80410ea4:	00812403          	lw	s0,8(sp)
80410ea8:	00c12083          	lw	ra,12(sp)
80410eac:	0187a303          	lw	t1,24(a5)
80410eb0:	01010113          	addi	sp,sp,16
80410eb4:	00030067          	jr	t1
80410eb8:	00003697          	auipc	a3,0x3
80410ebc:	1d068693          	addi	a3,a3,464 # 80414088 <CSWTCH.69+0x12c>
80410ec0:	00002617          	auipc	a2,0x2
80410ec4:	c7c60613          	addi	a2,a2,-900 # 80412b3c <commands+0x1bc>
80410ec8:	21c00593          	li	a1,540
80410ecc:	00005517          	auipc	a0,0x5
80410ed0:	b5450513          	addi	a0,a0,-1196 # 80415a20 <dev_node_ops+0x644>
80410ed4:	f50ef0ef          	jal	ra,80400624 <__panic>

80410ed8 <sfs_fstat>:
80410ed8:	ff010113          	addi	sp,sp,-16
80410edc:	00912223          	sw	s1,4(sp)
80410ee0:	00058493          	mv	s1,a1
80410ee4:	00812423          	sw	s0,8(sp)
80410ee8:	01000613          	li	a2,16
80410eec:	00050413          	mv	s0,a0
80410ef0:	00000593          	li	a1,0
80410ef4:	00048513          	mv	a0,s1
80410ef8:	00112623          	sw	ra,12(sp)
80410efc:	011010ef          	jal	ra,8041270c <memset>
80410f00:	06040e63          	beqz	s0,80410f7c <sfs_fstat+0xa4>
80410f04:	03c42783          	lw	a5,60(s0)
80410f08:	06078a63          	beqz	a5,80410f7c <sfs_fstat+0xa4>
80410f0c:	0287a783          	lw	a5,40(a5)
80410f10:	06078663          	beqz	a5,80410f7c <sfs_fstat+0xa4>
80410f14:	00004597          	auipc	a1,0x4
80410f18:	4ac58593          	addi	a1,a1,1196 # 804153c0 <syscalls+0xa18>
80410f1c:	00040513          	mv	a0,s0
80410f20:	c24fc0ef          	jal	ra,8040d344 <inode_check>
80410f24:	03c42783          	lw	a5,60(s0)
80410f28:	00048593          	mv	a1,s1
80410f2c:	00040513          	mv	a0,s0
80410f30:	0287a783          	lw	a5,40(a5)
80410f34:	000780e7          	jalr	a5
80410f38:	02051863          	bnez	a0,80410f68 <sfs_fstat+0x90>
80410f3c:	02c42703          	lw	a4,44(s0)
80410f40:	000017b7          	lui	a5,0x1
80410f44:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410f48:	04f71a63          	bne	a4,a5,80410f9c <sfs_fstat+0xc4>
80410f4c:	00042783          	lw	a5,0(s0)
80410f50:	0067d683          	lhu	a3,6(a5)
80410f54:	0087a703          	lw	a4,8(a5)
80410f58:	0007a783          	lw	a5,0(a5)
80410f5c:	00d4a223          	sw	a3,4(s1)
80410f60:	00e4a423          	sw	a4,8(s1)
80410f64:	00f4a623          	sw	a5,12(s1)
80410f68:	00c12083          	lw	ra,12(sp)
80410f6c:	00812403          	lw	s0,8(sp)
80410f70:	00412483          	lw	s1,4(sp)
80410f74:	01010113          	addi	sp,sp,16
80410f78:	00008067          	ret
80410f7c:	00004697          	auipc	a3,0x4
80410f80:	3dc68693          	addi	a3,a3,988 # 80415358 <syscalls+0x9b0>
80410f84:	00002617          	auipc	a2,0x2
80410f88:	bb860613          	addi	a2,a2,-1096 # 80412b3c <commands+0x1bc>
80410f8c:	2b800593          	li	a1,696
80410f90:	00005517          	auipc	a0,0x5
80410f94:	a9050513          	addi	a0,a0,-1392 # 80415a20 <dev_node_ops+0x644>
80410f98:	e8cef0ef          	jal	ra,80400624 <__panic>
80410f9c:	00005697          	auipc	a3,0x5
80410fa0:	a9c68693          	addi	a3,a3,-1380 # 80415a38 <dev_node_ops+0x65c>
80410fa4:	00002617          	auipc	a2,0x2
80410fa8:	b9860613          	addi	a2,a2,-1128 # 80412b3c <commands+0x1bc>
80410fac:	2bb00593          	li	a1,699
80410fb0:	00005517          	auipc	a0,0x5
80410fb4:	a7050513          	addi	a0,a0,-1424 # 80415a20 <dev_node_ops+0x644>
80410fb8:	e6cef0ef          	jal	ra,80400624 <__panic>

80410fbc <sfs_io.part.12>:
80410fbc:	ff010113          	addi	sp,sp,-16
80410fc0:	00005697          	auipc	a3,0x5
80410fc4:	a7868693          	addi	a3,a3,-1416 # 80415a38 <dev_node_ops+0x65c>
80410fc8:	00002617          	auipc	a2,0x2
80410fcc:	b7460613          	addi	a2,a2,-1164 # 80412b3c <commands+0x1bc>
80410fd0:	29700593          	li	a1,663
80410fd4:	00005517          	auipc	a0,0x5
80410fd8:	a4c50513          	addi	a0,a0,-1460 # 80415a20 <dev_node_ops+0x644>
80410fdc:	00112623          	sw	ra,12(sp)
80410fe0:	e44ef0ef          	jal	ra,80400624 <__panic>

80410fe4 <sfs_read>:
80410fe4:	fd010113          	addi	sp,sp,-48
80410fe8:	03212023          	sw	s2,32(sp)
80410fec:	03852903          	lw	s2,56(a0)
80410ff0:	02112623          	sw	ra,44(sp)
80410ff4:	02812423          	sw	s0,40(sp)
80410ff8:	02912223          	sw	s1,36(sp)
80410ffc:	01312e23          	sw	s3,28(sp)
80411000:	08090a63          	beqz	s2,80411094 <sfs_read+0xb0>
80411004:	06c92783          	lw	a5,108(s2)
80411008:	08079663          	bnez	a5,80411094 <sfs_read+0xb0>
8041100c:	02c52703          	lw	a4,44(a0)
80411010:	000017b7          	lui	a5,0x1
80411014:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411018:	00050413          	mv	s0,a0
8041101c:	08f71c63          	bne	a4,a5,804110b4 <sfs_read+0xd0>
80411020:	01050993          	addi	s3,a0,16
80411024:	00098513          	mv	a0,s3
80411028:	00058493          	mv	s1,a1
8041102c:	894f40ef          	jal	ra,804050c0 <down>
80411030:	00c4a803          	lw	a6,12(s1)
80411034:	0044a683          	lw	a3,4(s1)
80411038:	0004a603          	lw	a2,0(s1)
8041103c:	00040593          	mv	a1,s0
80411040:	00000793          	li	a5,0
80411044:	00c10713          	addi	a4,sp,12
80411048:	00090513          	mv	a0,s2
8041104c:	01012623          	sw	a6,12(sp)
80411050:	cd4ff0ef          	jal	ra,80410524 <sfs_io_nolock>
80411054:	00c12583          	lw	a1,12(sp)
80411058:	00050413          	mv	s0,a0
8041105c:	02059663          	bnez	a1,80411088 <sfs_read+0xa4>
80411060:	00098513          	mv	a0,s3
80411064:	858f40ef          	jal	ra,804050bc <up>
80411068:	00040513          	mv	a0,s0
8041106c:	02c12083          	lw	ra,44(sp)
80411070:	02812403          	lw	s0,40(sp)
80411074:	02412483          	lw	s1,36(sp)
80411078:	02012903          	lw	s2,32(sp)
8041107c:	01c12983          	lw	s3,28(sp)
80411080:	03010113          	addi	sp,sp,48
80411084:	00008067          	ret
80411088:	00048513          	mv	a0,s1
8041108c:	d58f50ef          	jal	ra,804065e4 <iobuf_skip>
80411090:	fd1ff06f          	j	80411060 <sfs_read+0x7c>
80411094:	00004697          	auipc	a3,0x4
80411098:	7f068693          	addi	a3,a3,2032 # 80415884 <dev_node_ops+0x4a8>
8041109c:	00002617          	auipc	a2,0x2
804110a0:	aa060613          	addi	a2,a2,-1376 # 80412b3c <commands+0x1bc>
804110a4:	29600593          	li	a1,662
804110a8:	00005517          	auipc	a0,0x5
804110ac:	97850513          	addi	a0,a0,-1672 # 80415a20 <dev_node_ops+0x644>
804110b0:	d74ef0ef          	jal	ra,80400624 <__panic>
804110b4:	f09ff0ef          	jal	ra,80410fbc <sfs_io.part.12>

804110b8 <sfs_write>:
804110b8:	fd010113          	addi	sp,sp,-48
804110bc:	03212023          	sw	s2,32(sp)
804110c0:	03852903          	lw	s2,56(a0)
804110c4:	02112623          	sw	ra,44(sp)
804110c8:	02812423          	sw	s0,40(sp)
804110cc:	02912223          	sw	s1,36(sp)
804110d0:	01312e23          	sw	s3,28(sp)
804110d4:	08090a63          	beqz	s2,80411168 <sfs_write+0xb0>
804110d8:	06c92783          	lw	a5,108(s2)
804110dc:	08079663          	bnez	a5,80411168 <sfs_write+0xb0>
804110e0:	02c52703          	lw	a4,44(a0)
804110e4:	000017b7          	lui	a5,0x1
804110e8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804110ec:	00050413          	mv	s0,a0
804110f0:	08f71c63          	bne	a4,a5,80411188 <sfs_write+0xd0>
804110f4:	01050993          	addi	s3,a0,16
804110f8:	00098513          	mv	a0,s3
804110fc:	00058493          	mv	s1,a1
80411100:	fc1f30ef          	jal	ra,804050c0 <down>
80411104:	00c4a803          	lw	a6,12(s1)
80411108:	0044a683          	lw	a3,4(s1)
8041110c:	0004a603          	lw	a2,0(s1)
80411110:	00040593          	mv	a1,s0
80411114:	00100793          	li	a5,1
80411118:	00c10713          	addi	a4,sp,12
8041111c:	00090513          	mv	a0,s2
80411120:	01012623          	sw	a6,12(sp)
80411124:	c00ff0ef          	jal	ra,80410524 <sfs_io_nolock>
80411128:	00c12583          	lw	a1,12(sp)
8041112c:	00050413          	mv	s0,a0
80411130:	02059663          	bnez	a1,8041115c <sfs_write+0xa4>
80411134:	00098513          	mv	a0,s3
80411138:	f85f30ef          	jal	ra,804050bc <up>
8041113c:	00040513          	mv	a0,s0
80411140:	02c12083          	lw	ra,44(sp)
80411144:	02812403          	lw	s0,40(sp)
80411148:	02412483          	lw	s1,36(sp)
8041114c:	02012903          	lw	s2,32(sp)
80411150:	01c12983          	lw	s3,28(sp)
80411154:	03010113          	addi	sp,sp,48
80411158:	00008067          	ret
8041115c:	00048513          	mv	a0,s1
80411160:	c84f50ef          	jal	ra,804065e4 <iobuf_skip>
80411164:	fd1ff06f          	j	80411134 <sfs_write+0x7c>
80411168:	00004697          	auipc	a3,0x4
8041116c:	71c68693          	addi	a3,a3,1820 # 80415884 <dev_node_ops+0x4a8>
80411170:	00002617          	auipc	a2,0x2
80411174:	9cc60613          	addi	a2,a2,-1588 # 80412b3c <commands+0x1bc>
80411178:	29600593          	li	a1,662
8041117c:	00005517          	auipc	a0,0x5
80411180:	8a450513          	addi	a0,a0,-1884 # 80415a20 <dev_node_ops+0x644>
80411184:	ca0ef0ef          	jal	ra,80400624 <__panic>
80411188:	e35ff0ef          	jal	ra,80410fbc <sfs_io.part.12>

8041118c <sfs_load_inode>:
8041118c:	fe010113          	addi	sp,sp,-32
80411190:	00112e23          	sw	ra,28(sp)
80411194:	00812c23          	sw	s0,24(sp)
80411198:	01212823          	sw	s2,16(sp)
8041119c:	01312623          	sw	s3,12(sp)
804111a0:	00050913          	mv	s2,a0
804111a4:	00060993          	mv	s3,a2
804111a8:	01412423          	sw	s4,8(sp)
804111ac:	00912a23          	sw	s1,20(sp)
804111b0:	00058a13          	mv	s4,a1
804111b4:	01512223          	sw	s5,4(sp)
804111b8:	4f5000ef          	jal	ra,80411eac <lock_sfs_fs>
804111bc:	00a00593          	li	a1,10
804111c0:	06892403          	lw	s0,104(s2)
804111c4:	00098513          	mv	a0,s3
804111c8:	505000ef          	jal	ra,80411ecc <hash32>
804111cc:	00351513          	slli	a0,a0,0x3
804111d0:	00a40533          	add	a0,s0,a0
804111d4:	00050413          	mv	s0,a0
804111d8:	00c0006f          	j	804111e4 <sfs_load_inode+0x58>
804111dc:	fe042783          	lw	a5,-32(s0)
804111e0:	10f98a63          	beq	s3,a5,804112f4 <sfs_load_inode+0x168>
804111e4:	00442403          	lw	s0,4(s0)
804111e8:	fe851ae3          	bne	a0,s0,804111dc <sfs_load_inode+0x50>
804111ec:	04000513          	li	a0,64
804111f0:	f94f10ef          	jal	ra,80402984 <kmalloc>
804111f4:	00050a93          	mv	s5,a0
804111f8:	14050e63          	beqz	a0,80411354 <sfs_load_inode+0x1c8>
804111fc:	00492503          	lw	a0,4(s2)
80411200:	00098613          	mv	a2,s3
80411204:	03090593          	addi	a1,s2,48
80411208:	c79fe0ef          	jal	ra,8040fe80 <sfs_block_inuse.isra.3>
8041120c:	1e050863          	beqz	a0,804113fc <sfs_load_inode+0x270>
80411210:	00000713          	li	a4,0
80411214:	00098693          	mv	a3,s3
80411218:	04000613          	li	a2,64
8041121c:	000a8593          	mv	a1,s5
80411220:	00090513          	mv	a0,s2
80411224:	125000ef          	jal	ra,80411b48 <sfs_rbuf>
80411228:	00050413          	mv	s0,a0
8041122c:	12051e63          	bnez	a0,80411368 <sfs_load_inode+0x1dc>
80411230:	006ad783          	lhu	a5,6(s5)
80411234:	1a078463          	beqz	a5,804113dc <sfs_load_inode+0x250>
80411238:	00001537          	lui	a0,0x1
8041123c:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411240:	830fc0ef          	jal	ra,8040d270 <__alloc_inode>
80411244:	00050493          	mv	s1,a0
80411248:	10050e63          	beqz	a0,80411364 <sfs_load_inode+0x1d8>
8041124c:	004ad683          	lhu	a3,4(s5)
80411250:	00100793          	li	a5,1
80411254:	12f69063          	bne	a3,a5,80411374 <sfs_load_inode+0x1e8>
80411258:	00005597          	auipc	a1,0x5
8041125c:	91c58593          	addi	a1,a1,-1764 # 80415b74 <sfs_node_fileops>
80411260:	00090613          	mv	a2,s2
80411264:	00048513          	mv	a0,s1
80411268:	838fc0ef          	jal	ra,8040d2a0 <inode_init>
8041126c:	02c4a403          	lw	s0,44(s1)
80411270:	000017b7          	lui	a5,0x1
80411274:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411278:	14f41263          	bne	s0,a5,804113bc <sfs_load_inode+0x230>
8041127c:	00100793          	li	a5,1
80411280:	00f4a623          	sw	a5,12(s1)
80411284:	0154a023          	sw	s5,0(s1)
80411288:	0134a223          	sw	s3,4(s1)
8041128c:	0004a423          	sw	zero,8(s1)
80411290:	00100593          	li	a1,1
80411294:	01048513          	addi	a0,s1,16
80411298:	e19f30ef          	jal	ra,804050b0 <sem_init>
8041129c:	02c4a783          	lw	a5,44(s1)
804112a0:	0e879e63          	bne	a5,s0,8041139c <sfs_load_inode+0x210>
804112a4:	06492683          	lw	a3,100(s2)
804112a8:	01c48793          	addi	a5,s1,28
804112ac:	06090713          	addi	a4,s2,96
804112b0:	00f6a023          	sw	a5,0(a3)
804112b4:	06f92223          	sw	a5,100(s2)
804112b8:	0044a503          	lw	a0,4(s1)
804112bc:	00e4ae23          	sw	a4,28(s1)
804112c0:	02d4a023          	sw	a3,32(s1)
804112c4:	06892403          	lw	s0,104(s2)
804112c8:	00a00593          	li	a1,10
804112cc:	401000ef          	jal	ra,80411ecc <hash32>
804112d0:	00351513          	slli	a0,a0,0x3
804112d4:	00a40533          	add	a0,s0,a0
804112d8:	00452783          	lw	a5,4(a0)
804112dc:	02448713          	addi	a4,s1,36
804112e0:	00e7a023          	sw	a4,0(a5)
804112e4:	00e52223          	sw	a4,4(a0)
804112e8:	02f4a423          	sw	a5,40(s1)
804112ec:	02a4a223          	sw	a0,36(s1)
804112f0:	01c0006f          	j	8041130c <sfs_load_inode+0x180>
804112f4:	fdc40493          	addi	s1,s0,-36
804112f8:	00048513          	mv	a0,s1
804112fc:	820fc0ef          	jal	ra,8040d31c <inode_ref_inc>
80411300:	00100793          	li	a5,1
80411304:	04f50063          	beq	a0,a5,80411344 <sfs_load_inode+0x1b8>
80411308:	ee0482e3          	beqz	s1,804111ec <sfs_load_inode+0x60>
8041130c:	00090513          	mv	a0,s2
80411310:	3ad000ef          	jal	ra,80411ebc <unlock_sfs_fs>
80411314:	00000413          	li	s0,0
80411318:	009a2023          	sw	s1,0(s4)
8041131c:	00040513          	mv	a0,s0
80411320:	01c12083          	lw	ra,28(sp)
80411324:	01812403          	lw	s0,24(sp)
80411328:	01412483          	lw	s1,20(sp)
8041132c:	01012903          	lw	s2,16(sp)
80411330:	00c12983          	lw	s3,12(sp)
80411334:	00812a03          	lw	s4,8(sp)
80411338:	00412a83          	lw	s5,4(sp)
8041133c:	02010113          	addi	sp,sp,32
80411340:	00008067          	ret
80411344:	fe842783          	lw	a5,-24(s0)
80411348:	00178793          	addi	a5,a5,1
8041134c:	fef42423          	sw	a5,-24(s0)
80411350:	fb9ff06f          	j	80411308 <sfs_load_inode+0x17c>
80411354:	ffc00413          	li	s0,-4
80411358:	00090513          	mv	a0,s2
8041135c:	361000ef          	jal	ra,80411ebc <unlock_sfs_fs>
80411360:	fbdff06f          	j	8041131c <sfs_load_inode+0x190>
80411364:	ffc00413          	li	s0,-4
80411368:	000a8513          	mv	a0,s5
8041136c:	f3cf10ef          	jal	ra,80402aa8 <kfree>
80411370:	fe9ff06f          	j	80411358 <sfs_load_inode+0x1cc>
80411374:	00200793          	li	a5,2
80411378:	00004597          	auipc	a1,0x4
8041137c:	7bc58593          	addi	a1,a1,1980 # 80415b34 <sfs_node_dirops>
80411380:	eef680e3          	beq	a3,a5,80411260 <sfs_load_inode+0xd4>
80411384:	00004617          	auipc	a2,0x4
80411388:	6ec60613          	addi	a2,a2,1772 # 80415a70 <dev_node_ops+0x694>
8041138c:	02e00593          	li	a1,46
80411390:	00004517          	auipc	a0,0x4
80411394:	69050513          	addi	a0,a0,1680 # 80415a20 <dev_node_ops+0x644>
80411398:	a8cef0ef          	jal	ra,80400624 <__panic>
8041139c:	00004697          	auipc	a3,0x4
804113a0:	69c68693          	addi	a3,a3,1692 # 80415a38 <dev_node_ops+0x65c>
804113a4:	00001617          	auipc	a2,0x1
804113a8:	79860613          	addi	a2,a2,1944 # 80412b3c <commands+0x1bc>
804113ac:	0b100593          	li	a1,177
804113b0:	00004517          	auipc	a0,0x4
804113b4:	67050513          	addi	a0,a0,1648 # 80415a20 <dev_node_ops+0x644>
804113b8:	a6cef0ef          	jal	ra,80400624 <__panic>
804113bc:	00004697          	auipc	a3,0x4
804113c0:	67c68693          	addi	a3,a3,1660 # 80415a38 <dev_node_ops+0x65c>
804113c4:	00001617          	auipc	a2,0x1
804113c8:	77860613          	addi	a2,a2,1912 # 80412b3c <commands+0x1bc>
804113cc:	07700593          	li	a1,119
804113d0:	00004517          	auipc	a0,0x4
804113d4:	65050513          	addi	a0,a0,1616 # 80415a20 <dev_node_ops+0x644>
804113d8:	a4cef0ef          	jal	ra,80400624 <__panic>
804113dc:	00004697          	auipc	a3,0x4
804113e0:	6c868693          	addi	a3,a3,1736 # 80415aa4 <dev_node_ops+0x6c8>
804113e4:	00001617          	auipc	a2,0x1
804113e8:	75860613          	addi	a2,a2,1880 # 80412b3c <commands+0x1bc>
804113ec:	0ad00593          	li	a1,173
804113f0:	00004517          	auipc	a0,0x4
804113f4:	63050513          	addi	a0,a0,1584 # 80415a20 <dev_node_ops+0x644>
804113f8:	a2cef0ef          	jal	ra,80400624 <__panic>
804113fc:	00004697          	auipc	a3,0x4
80411400:	5bc68693          	addi	a3,a3,1468 # 804159b8 <dev_node_ops+0x5dc>
80411404:	00001617          	auipc	a2,0x1
80411408:	73860613          	addi	a2,a2,1848 # 80412b3c <commands+0x1bc>
8041140c:	0a800593          	li	a1,168
80411410:	00004517          	auipc	a0,0x4
80411414:	61050513          	addi	a0,a0,1552 # 80415a20 <dev_node_ops+0x644>
80411418:	a0cef0ef          	jal	ra,80400624 <__panic>

8041141c <sfs_lookup_once.constprop.13>:
8041141c:	fd010113          	addi	sp,sp,-48
80411420:	01312e23          	sw	s3,28(sp)
80411424:	01058993          	addi	s3,a1,16
80411428:	01712623          	sw	s7,12(sp)
8041142c:	00050b93          	mv	s7,a0
80411430:	00098513          	mv	a0,s3
80411434:	02112623          	sw	ra,44(sp)
80411438:	03212023          	sw	s2,32(sp)
8041143c:	01512a23          	sw	s5,20(sp)
80411440:	01812423          	sw	s8,8(sp)
80411444:	00060a93          	mv	s5,a2
80411448:	00058913          	mv	s2,a1
8041144c:	00068c13          	mv	s8,a3
80411450:	02812423          	sw	s0,40(sp)
80411454:	02912223          	sw	s1,36(sp)
80411458:	01412c23          	sw	s4,24(sp)
8041145c:	01612823          	sw	s6,16(sp)
80411460:	01912223          	sw	s9,4(sp)
80411464:	c5df30ef          	jal	ra,804050c0 <down>
80411468:	000a8513          	mv	a0,s5
8041146c:	1bc010ef          	jal	ra,80412628 <strlen>
80411470:	0ff00793          	li	a5,255
80411474:	10a7ee63          	bltu	a5,a0,80411590 <sfs_lookup_once.constprop.13+0x174>
80411478:	10400513          	li	a0,260
8041147c:	d08f10ef          	jal	ra,80402984 <kmalloc>
80411480:	00050413          	mv	s0,a0
80411484:	0e050e63          	beqz	a0,80411580 <sfs_lookup_once.constprop.13+0x164>
80411488:	00092783          	lw	a5,0(s2)
8041148c:	0087ab03          	lw	s6,8(a5)
80411490:	09605a63          	blez	s6,80411524 <sfs_lookup_once.constprop.13+0x108>
80411494:	00000493          	li	s1,0
80411498:	00450c93          	addi	s9,a0,4
8041149c:	0240006f          	j	804114c0 <sfs_lookup_once.constprop.13+0xa4>
804114a0:	00042783          	lw	a5,0(s0)
804114a4:	00078a63          	beqz	a5,804114b8 <sfs_lookup_once.constprop.13+0x9c>
804114a8:	000c8593          	mv	a1,s9
804114ac:	000a8513          	mv	a0,s5
804114b0:	200010ef          	jal	ra,804126b0 <strcmp>
804114b4:	06050c63          	beqz	a0,8041152c <sfs_lookup_once.constprop.13+0x110>
804114b8:	00148493          	addi	s1,s1,1
804114bc:	069b0463          	beq	s6,s1,80411524 <sfs_lookup_once.constprop.13+0x108>
804114c0:	00040693          	mv	a3,s0
804114c4:	00048613          	mv	a2,s1
804114c8:	00090593          	mv	a1,s2
804114cc:	000b8513          	mv	a0,s7
804114d0:	b30ff0ef          	jal	ra,80410800 <sfs_dirent_read_nolock>
804114d4:	00050a13          	mv	s4,a0
804114d8:	fc0504e3          	beqz	a0,804114a0 <sfs_lookup_once.constprop.13+0x84>
804114dc:	00040513          	mv	a0,s0
804114e0:	dc8f10ef          	jal	ra,80402aa8 <kfree>
804114e4:	00098513          	mv	a0,s3
804114e8:	bd5f30ef          	jal	ra,804050bc <up>
804114ec:	02c12083          	lw	ra,44(sp)
804114f0:	02812403          	lw	s0,40(sp)
804114f4:	000a0513          	mv	a0,s4
804114f8:	02412483          	lw	s1,36(sp)
804114fc:	02012903          	lw	s2,32(sp)
80411500:	01c12983          	lw	s3,28(sp)
80411504:	01812a03          	lw	s4,24(sp)
80411508:	01412a83          	lw	s5,20(sp)
8041150c:	01012b03          	lw	s6,16(sp)
80411510:	00c12b83          	lw	s7,12(sp)
80411514:	00812c03          	lw	s8,8(sp)
80411518:	00412c83          	lw	s9,4(sp)
8041151c:	03010113          	addi	sp,sp,48
80411520:	00008067          	ret
80411524:	ff000a13          	li	s4,-16
80411528:	fb5ff06f          	j	804114dc <sfs_lookup_once.constprop.13+0xc0>
8041152c:	00040513          	mv	a0,s0
80411530:	00042483          	lw	s1,0(s0)
80411534:	d74f10ef          	jal	ra,80402aa8 <kfree>
80411538:	00098513          	mv	a0,s3
8041153c:	b81f30ef          	jal	ra,804050bc <up>
80411540:	02812403          	lw	s0,40(sp)
80411544:	02c12083          	lw	ra,44(sp)
80411548:	02012903          	lw	s2,32(sp)
8041154c:	01c12983          	lw	s3,28(sp)
80411550:	01812a03          	lw	s4,24(sp)
80411554:	01412a83          	lw	s5,20(sp)
80411558:	01012b03          	lw	s6,16(sp)
8041155c:	00412c83          	lw	s9,4(sp)
80411560:	00048613          	mv	a2,s1
80411564:	000c0593          	mv	a1,s8
80411568:	02412483          	lw	s1,36(sp)
8041156c:	00812c03          	lw	s8,8(sp)
80411570:	000b8513          	mv	a0,s7
80411574:	00c12b83          	lw	s7,12(sp)
80411578:	03010113          	addi	sp,sp,48
8041157c:	c11ff06f          	j	8041118c <sfs_load_inode>
80411580:	00098513          	mv	a0,s3
80411584:	b39f30ef          	jal	ra,804050bc <up>
80411588:	ffc00a13          	li	s4,-4
8041158c:	f61ff06f          	j	804114ec <sfs_lookup_once.constprop.13+0xd0>
80411590:	00004697          	auipc	a3,0x4
80411594:	54868693          	addi	a3,a3,1352 # 80415ad8 <dev_node_ops+0x6fc>
80411598:	00001617          	auipc	a2,0x1
8041159c:	5a460613          	addi	a2,a2,1444 # 80412b3c <commands+0x1bc>
804115a0:	1ba00593          	li	a1,442
804115a4:	00004517          	auipc	a0,0x4
804115a8:	47c50513          	addi	a0,a0,1148 # 80415a20 <dev_node_ops+0x644>
804115ac:	878ef0ef          	jal	ra,80400624 <__panic>

804115b0 <sfs_namefile>:
804115b0:	00c5a703          	lw	a4,12(a1)
804115b4:	fa010113          	addi	sp,sp,-96
804115b8:	04112e23          	sw	ra,92(sp)
804115bc:	04812c23          	sw	s0,88(sp)
804115c0:	04912a23          	sw	s1,84(sp)
804115c4:	05212823          	sw	s2,80(sp)
804115c8:	05312623          	sw	s3,76(sp)
804115cc:	05412423          	sw	s4,72(sp)
804115d0:	05512223          	sw	s5,68(sp)
804115d4:	05612023          	sw	s6,64(sp)
804115d8:	03712e23          	sw	s7,60(sp)
804115dc:	03812c23          	sw	s8,56(sp)
804115e0:	03912a23          	sw	s9,52(sp)
804115e4:	03a12823          	sw	s10,48(sp)
804115e8:	03b12623          	sw	s11,44(sp)
804115ec:	00b12623          	sw	a1,12(sp)
804115f0:	00200793          	li	a5,2
804115f4:	24e7f063          	bgeu	a5,a4,80411834 <sfs_namefile+0x284>
804115f8:	00050493          	mv	s1,a0
804115fc:	10400513          	li	a0,260
80411600:	b84f10ef          	jal	ra,80402984 <kmalloc>
80411604:	00050a93          	mv	s5,a0
80411608:	22050663          	beqz	a0,80411834 <sfs_namefile+0x284>
8041160c:	0384ab03          	lw	s6,56(s1)
80411610:	260b0663          	beqz	s6,8041187c <sfs_namefile+0x2cc>
80411614:	06cb2783          	lw	a5,108(s6)
80411618:	26079263          	bnez	a5,8041187c <sfs_namefile+0x2cc>
8041161c:	02c4ac03          	lw	s8,44(s1)
80411620:	000017b7          	lui	a5,0x1
80411624:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411628:	26fc1a63          	bne	s8,a5,8041189c <sfs_namefile+0x2ec>
8041162c:	00c12703          	lw	a4,12(sp)
80411630:	00048513          	mv	a0,s1
80411634:	00048413          	mv	s0,s1
80411638:	00c72783          	lw	a5,12(a4) # 800000c <_binary_bin_sfs_img_size+0x7f8800c>
8041163c:	00072903          	lw	s2,0(a4)
80411640:	00004c97          	auipc	s9,0x4
80411644:	4bcc8c93          	addi	s9,s9,1212 # 80415afc <dev_node_ops+0x720>
80411648:	ffe78a13          	addi	s4,a5,-2
8041164c:	00f90933          	add	s2,s2,a5
80411650:	ccdfb0ef          	jal	ra,8040d31c <inode_ref_inc>
80411654:	01c10693          	addi	a3,sp,28
80411658:	000c8613          	mv	a2,s9
8041165c:	00040593          	mv	a1,s0
80411660:	000b0513          	mv	a0,s6
80411664:	01812423          	sw	s8,8(sp)
80411668:	db5ff0ef          	jal	ra,8041141c <sfs_lookup_once.constprop.13>
8041166c:	004a8b93          	addi	s7,s5,4
80411670:	00050d93          	mv	s11,a0
80411674:	0e051863          	bnez	a0,80411764 <sfs_namefile+0x1b4>
80411678:	00048513          	mv	a0,s1
8041167c:	00442983          	lw	s3,4(s0)
80411680:	d91fb0ef          	jal	ra,8040d410 <inode_ref_dec>
80411684:	01c12d03          	lw	s10,28(sp)
80411688:	149d0663          	beq	s10,s1,804117d4 <sfs_namefile+0x224>
8041168c:	1c0d0863          	beqz	s10,8041185c <sfs_namefile+0x2ac>
80411690:	02cd2683          	lw	a3,44(s10)
80411694:	00812783          	lw	a5,8(sp)
80411698:	1cf69263          	bne	a3,a5,8041185c <sfs_namefile+0x2ac>
8041169c:	004d2683          	lw	a3,4(s10)
804116a0:	000d0413          	mv	s0,s10
804116a4:	19368c63          	beq	a3,s3,8041183c <sfs_namefile+0x28c>
804116a8:	000d2683          	lw	a3,0(s10)
804116ac:	00200793          	li	a5,2
804116b0:	0046d683          	lhu	a3,4(a3)
804116b4:	18f69463          	bne	a3,a5,8041183c <sfs_namefile+0x28c>
804116b8:	010d0493          	addi	s1,s10,16
804116bc:	00048513          	mv	a0,s1
804116c0:	a01f30ef          	jal	ra,804050c0 <down>
804116c4:	000d2683          	lw	a3,0(s10)
804116c8:	0086ac03          	lw	s8,8(a3)
804116cc:	01804c63          	bgtz	s8,804116e4 <sfs_namefile+0x134>
804116d0:	0e40006f          	j	804117b4 <sfs_namefile+0x204>
804116d4:	000aa683          	lw	a3,0(s5)
804116d8:	02d98663          	beq	s3,a3,80411704 <sfs_namefile+0x154>
804116dc:	001d8d93          	addi	s11,s11,1
804116e0:	0dbc0a63          	beq	s8,s11,804117b4 <sfs_namefile+0x204>
804116e4:	000a8693          	mv	a3,s5
804116e8:	000d8613          	mv	a2,s11
804116ec:	000d0593          	mv	a1,s10
804116f0:	000b0513          	mv	a0,s6
804116f4:	90cff0ef          	jal	ra,80410800 <sfs_dirent_read_nolock>
804116f8:	00050693          	mv	a3,a0
804116fc:	fc050ce3          	beqz	a0,804116d4 <sfs_namefile+0x124>
80411700:	0b80006f          	j	804117b8 <sfs_namefile+0x208>
80411704:	00048513          	mv	a0,s1
80411708:	9b5f30ef          	jal	ra,804050bc <up>
8041170c:	000b8513          	mv	a0,s7
80411710:	719000ef          	jal	ra,80412628 <strlen>
80411714:	00150713          	addi	a4,a0,1
80411718:	10ea6863          	bltu	s4,a4,80411828 <sfs_namefile+0x278>
8041171c:	fff54993          	not	s3,a0
80411720:	013909b3          	add	s3,s2,s3
80411724:	00050613          	mv	a2,a0
80411728:	000b8593          	mv	a1,s7
8041172c:	00098513          	mv	a0,s3
80411730:	40ea0a33          	sub	s4,s4,a4
80411734:	048010ef          	jal	ra,8041277c <memcpy>
80411738:	02f00793          	li	a5,47
8041173c:	fef90fa3          	sb	a5,-1(s2)
80411740:	01c10693          	addi	a3,sp,28
80411744:	000c8613          	mv	a2,s9
80411748:	00040593          	mv	a1,s0
8041174c:	000b0513          	mv	a0,s6
80411750:	ccdff0ef          	jal	ra,8041141c <sfs_lookup_once.constprop.13>
80411754:	000d0493          	mv	s1,s10
80411758:	00098913          	mv	s2,s3
8041175c:	00050d93          	mv	s11,a0
80411760:	f0050ce3          	beqz	a0,80411678 <sfs_namefile+0xc8>
80411764:	00048513          	mv	a0,s1
80411768:	ca9fb0ef          	jal	ra,8040d410 <inode_ref_dec>
8041176c:	000a8513          	mv	a0,s5
80411770:	b38f10ef          	jal	ra,80402aa8 <kfree>
80411774:	05c12083          	lw	ra,92(sp)
80411778:	05812403          	lw	s0,88(sp)
8041177c:	000d8513          	mv	a0,s11
80411780:	05412483          	lw	s1,84(sp)
80411784:	05012903          	lw	s2,80(sp)
80411788:	04c12983          	lw	s3,76(sp)
8041178c:	04812a03          	lw	s4,72(sp)
80411790:	04412a83          	lw	s5,68(sp)
80411794:	04012b03          	lw	s6,64(sp)
80411798:	03c12b83          	lw	s7,60(sp)
8041179c:	03812c03          	lw	s8,56(sp)
804117a0:	03412c83          	lw	s9,52(sp)
804117a4:	03012d03          	lw	s10,48(sp)
804117a8:	02c12d83          	lw	s11,44(sp)
804117ac:	06010113          	addi	sp,sp,96
804117b0:	00008067          	ret
804117b4:	ff000693          	li	a3,-16
804117b8:	00048513          	mv	a0,s1
804117bc:	00d12423          	sw	a3,8(sp)
804117c0:	8fdf30ef          	jal	ra,804050bc <up>
804117c4:	00812683          	lw	a3,8(sp)
804117c8:	000d0493          	mv	s1,s10
804117cc:	00068d93          	mv	s11,a3
804117d0:	f95ff06f          	j	80411764 <sfs_namefile+0x1b4>
804117d4:	00048513          	mv	a0,s1
804117d8:	c39fb0ef          	jal	ra,8040d410 <inode_ref_dec>
804117dc:	00c12403          	lw	s0,12(sp)
804117e0:	00090593          	mv	a1,s2
804117e4:	00c42783          	lw	a5,12(s0)
804117e8:	00042503          	lw	a0,0(s0)
804117ec:	ffe78793          	addi	a5,a5,-2
804117f0:	41478a33          	sub	s4,a5,s4
804117f4:	000a0613          	mv	a2,s4
804117f8:	00150513          	addi	a0,a0,1
804117fc:	72d000ef          	jal	ra,80412728 <memmove>
80411800:	02f00793          	li	a5,47
80411804:	fef50fa3          	sb	a5,-1(a0)
80411808:	01450533          	add	a0,a0,s4
8041180c:	00050023          	sb	zero,0(a0)
80411810:	000a0593          	mv	a1,s4
80411814:	00040513          	mv	a0,s0
80411818:	dcdf40ef          	jal	ra,804065e4 <iobuf_skip>
8041181c:	000a8513          	mv	a0,s5
80411820:	a88f10ef          	jal	ra,80402aa8 <kfree>
80411824:	f51ff06f          	j	80411774 <sfs_namefile+0x1c4>
80411828:	000d0493          	mv	s1,s10
8041182c:	ffc00d93          	li	s11,-4
80411830:	f35ff06f          	j	80411764 <sfs_namefile+0x1b4>
80411834:	ffc00d93          	li	s11,-4
80411838:	f3dff06f          	j	80411774 <sfs_namefile+0x1c4>
8041183c:	00004697          	auipc	a3,0x4
80411840:	2c468693          	addi	a3,a3,708 # 80415b00 <dev_node_ops+0x724>
80411844:	00001617          	auipc	a2,0x1
80411848:	2f860613          	addi	a2,a2,760 # 80412b3c <commands+0x1bc>
8041184c:	2f900593          	li	a1,761
80411850:	00004517          	auipc	a0,0x4
80411854:	1d050513          	addi	a0,a0,464 # 80415a20 <dev_node_ops+0x644>
80411858:	dcdee0ef          	jal	ra,80400624 <__panic>
8041185c:	00004697          	auipc	a3,0x4
80411860:	1dc68693          	addi	a3,a3,476 # 80415a38 <dev_node_ops+0x65c>
80411864:	00001617          	auipc	a2,0x1
80411868:	2d860613          	addi	a2,a2,728 # 80412b3c <commands+0x1bc>
8041186c:	2f800593          	li	a1,760
80411870:	00004517          	auipc	a0,0x4
80411874:	1b050513          	addi	a0,a0,432 # 80415a20 <dev_node_ops+0x644>
80411878:	dadee0ef          	jal	ra,80400624 <__panic>
8041187c:	00004697          	auipc	a3,0x4
80411880:	00868693          	addi	a3,a3,8 # 80415884 <dev_node_ops+0x4a8>
80411884:	00001617          	auipc	a2,0x1
80411888:	2b860613          	addi	a2,a2,696 # 80412b3c <commands+0x1bc>
8041188c:	2e400593          	li	a1,740
80411890:	00004517          	auipc	a0,0x4
80411894:	19050513          	addi	a0,a0,400 # 80415a20 <dev_node_ops+0x644>
80411898:	d8dee0ef          	jal	ra,80400624 <__panic>
8041189c:	00004697          	auipc	a3,0x4
804118a0:	19c68693          	addi	a3,a3,412 # 80415a38 <dev_node_ops+0x65c>
804118a4:	00001617          	auipc	a2,0x1
804118a8:	29860613          	addi	a2,a2,664 # 80412b3c <commands+0x1bc>
804118ac:	2e500593          	li	a1,741
804118b0:	00004517          	auipc	a0,0x4
804118b4:	17050513          	addi	a0,a0,368 # 80415a20 <dev_node_ops+0x644>
804118b8:	d6dee0ef          	jal	ra,80400624 <__panic>

804118bc <sfs_lookup>:
804118bc:	fd010113          	addi	sp,sp,-48
804118c0:	02912223          	sw	s1,36(sp)
804118c4:	03852483          	lw	s1,56(a0)
804118c8:	02112623          	sw	ra,44(sp)
804118cc:	02812423          	sw	s0,40(sp)
804118d0:	03212023          	sw	s2,32(sp)
804118d4:	01312e23          	sw	s3,28(sp)
804118d8:	0c048463          	beqz	s1,804119a0 <sfs_lookup+0xe4>
804118dc:	06c4a783          	lw	a5,108(s1)
804118e0:	0c079063          	bnez	a5,804119a0 <sfs_lookup+0xe4>
804118e4:	0005c783          	lbu	a5,0(a1)
804118e8:	00058913          	mv	s2,a1
804118ec:	08078a63          	beqz	a5,80411980 <sfs_lookup+0xc4>
804118f0:	02f00713          	li	a4,47
804118f4:	08e78663          	beq	a5,a4,80411980 <sfs_lookup+0xc4>
804118f8:	00050413          	mv	s0,a0
804118fc:	00060993          	mv	s3,a2
80411900:	a1dfb0ef          	jal	ra,8040d31c <inode_ref_inc>
80411904:	02c42703          	lw	a4,44(s0)
80411908:	000017b7          	lui	a5,0x1
8041190c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411910:	0af71863          	bne	a4,a5,804119c0 <sfs_lookup+0x104>
80411914:	00042703          	lw	a4,0(s0)
80411918:	00200793          	li	a5,2
8041191c:	00475703          	lhu	a4,4(a4)
80411920:	04f71863          	bne	a4,a5,80411970 <sfs_lookup+0xb4>
80411924:	00048513          	mv	a0,s1
80411928:	00c10693          	addi	a3,sp,12
8041192c:	00090613          	mv	a2,s2
80411930:	00040593          	mv	a1,s0
80411934:	ae9ff0ef          	jal	ra,8041141c <sfs_lookup_once.constprop.13>
80411938:	00050493          	mv	s1,a0
8041193c:	00040513          	mv	a0,s0
80411940:	ad1fb0ef          	jal	ra,8040d410 <inode_ref_dec>
80411944:	00049663          	bnez	s1,80411950 <sfs_lookup+0x94>
80411948:	00c12783          	lw	a5,12(sp)
8041194c:	00f9a023          	sw	a5,0(s3)
80411950:	02c12083          	lw	ra,44(sp)
80411954:	02812403          	lw	s0,40(sp)
80411958:	00048513          	mv	a0,s1
8041195c:	02012903          	lw	s2,32(sp)
80411960:	02412483          	lw	s1,36(sp)
80411964:	01c12983          	lw	s3,28(sp)
80411968:	03010113          	addi	sp,sp,48
8041196c:	00008067          	ret
80411970:	00040513          	mv	a0,s0
80411974:	a9dfb0ef          	jal	ra,8040d410 <inode_ref_dec>
80411978:	fee00493          	li	s1,-18
8041197c:	fd5ff06f          	j	80411950 <sfs_lookup+0x94>
80411980:	00004697          	auipc	a3,0x4
80411984:	13868693          	addi	a3,a3,312 # 80415ab8 <dev_node_ops+0x6dc>
80411988:	00001617          	auipc	a2,0x1
8041198c:	1b460613          	addi	a2,a2,436 # 80412b3c <commands+0x1bc>
80411990:	3db00593          	li	a1,987
80411994:	00004517          	auipc	a0,0x4
80411998:	08c50513          	addi	a0,a0,140 # 80415a20 <dev_node_ops+0x644>
8041199c:	c89ee0ef          	jal	ra,80400624 <__panic>
804119a0:	00004697          	auipc	a3,0x4
804119a4:	ee468693          	addi	a3,a3,-284 # 80415884 <dev_node_ops+0x4a8>
804119a8:	00001617          	auipc	a2,0x1
804119ac:	19460613          	addi	a2,a2,404 # 80412b3c <commands+0x1bc>
804119b0:	3da00593          	li	a1,986
804119b4:	00004517          	auipc	a0,0x4
804119b8:	06c50513          	addi	a0,a0,108 # 80415a20 <dev_node_ops+0x644>
804119bc:	c69ee0ef          	jal	ra,80400624 <__panic>
804119c0:	00004697          	auipc	a3,0x4
804119c4:	07868693          	addi	a3,a3,120 # 80415a38 <dev_node_ops+0x65c>
804119c8:	00001617          	auipc	a2,0x1
804119cc:	17460613          	addi	a2,a2,372 # 80412b3c <commands+0x1bc>
804119d0:	3dd00593          	li	a1,989
804119d4:	00004517          	auipc	a0,0x4
804119d8:	04c50513          	addi	a0,a0,76 # 80415a20 <dev_node_ops+0x644>
804119dc:	c49ee0ef          	jal	ra,80400624 <__panic>

804119e0 <sfs_rwblock_nolock.isra.0>:
804119e0:	fe010113          	addi	sp,sp,-32
804119e4:	00812c23          	sw	s0,24(sp)
804119e8:	00912a23          	sw	s1,20(sp)
804119ec:	00112e23          	sw	ra,28(sp)
804119f0:	00058493          	mv	s1,a1
804119f4:	00070413          	mv	s0,a4
804119f8:	00060593          	mv	a1,a2
804119fc:	00069463          	bnez	a3,80411a04 <sfs_rwblock_nolock.isra.0+0x24>
80411a00:	04079463          	bnez	a5,80411a48 <sfs_rwblock_nolock.isra.0+0x68>
80411a04:	00052783          	lw	a5,0(a0)
80411a08:	04f6f063          	bgeu	a3,a5,80411a48 <sfs_rwblock_nolock.isra.0+0x68>
80411a0c:	00001637          	lui	a2,0x1
80411a10:	00c69693          	slli	a3,a3,0xc
80411a14:	00010513          	mv	a0,sp
80411a18:	afdf40ef          	jal	ra,80406514 <iobuf_init>
80411a1c:	0004a783          	lw	a5,0(s1)
80411a20:	00050593          	mv	a1,a0
80411a24:	00040613          	mv	a2,s0
80411a28:	0107a703          	lw	a4,16(a5)
80411a2c:	00078513          	mv	a0,a5
80411a30:	000700e7          	jalr	a4
80411a34:	01c12083          	lw	ra,28(sp)
80411a38:	01812403          	lw	s0,24(sp)
80411a3c:	01412483          	lw	s1,20(sp)
80411a40:	02010113          	addi	sp,sp,32
80411a44:	00008067          	ret
80411a48:	00004697          	auipc	a3,0x4
80411a4c:	24068693          	addi	a3,a3,576 # 80415c88 <sfs_node_fileops+0x114>
80411a50:	00001617          	auipc	a2,0x1
80411a54:	0ec60613          	addi	a2,a2,236 # 80412b3c <commands+0x1bc>
80411a58:	01500593          	li	a1,21
80411a5c:	00004517          	auipc	a0,0x4
80411a60:	26050513          	addi	a0,a0,608 # 80415cbc <sfs_node_fileops+0x148>
80411a64:	bc1ee0ef          	jal	ra,80400624 <__panic>

80411a68 <sfs_rwblock>:
80411a68:	fd010113          	addi	sp,sp,-48
80411a6c:	02812423          	sw	s0,40(sp)
80411a70:	03212023          	sw	s2,32(sp)
80411a74:	01812423          	sw	s8,8(sp)
80411a78:	00060413          	mv	s0,a2
80411a7c:	00050c13          	mv	s8,a0
80411a80:	00068913          	mv	s2,a3
80411a84:	02912223          	sw	s1,36(sp)
80411a88:	01312e23          	sw	s3,28(sp)
80411a8c:	01412c23          	sw	s4,24(sp)
80411a90:	01512a23          	sw	s5,20(sp)
80411a94:	01612823          	sw	s6,16(sp)
80411a98:	01712623          	sw	s7,12(sp)
80411a9c:	02112623          	sw	ra,44(sp)
80411aa0:	00058493          	mv	s1,a1
80411aa4:	00070a93          	mv	s5,a4
80411aa8:	00450a13          	addi	s4,a0,4
80411aac:	01240bb3          	add	s7,s0,s2
80411ab0:	404000ef          	jal	ra,80411eb4 <lock_sfs_io>
80411ab4:	02cc0993          	addi	s3,s8,44
80411ab8:	00001b37          	lui	s6,0x1
80411abc:	00091863          	bnez	s2,80411acc <sfs_rwblock+0x64>
80411ac0:	0700006f          	j	80411b30 <sfs_rwblock+0xc8>
80411ac4:	016484b3          	add	s1,s1,s6
80411ac8:	068b8463          	beq	s7,s0,80411b30 <sfs_rwblock+0xc8>
80411acc:	00040693          	mv	a3,s0
80411ad0:	00048613          	mv	a2,s1
80411ad4:	00100793          	li	a5,1
80411ad8:	000a8713          	mv	a4,s5
80411adc:	00098593          	mv	a1,s3
80411ae0:	000a0513          	mv	a0,s4
80411ae4:	efdff0ef          	jal	ra,804119e0 <sfs_rwblock_nolock.isra.0>
80411ae8:	00050913          	mv	s2,a0
80411aec:	00140413          	addi	s0,s0,1
80411af0:	fc050ae3          	beqz	a0,80411ac4 <sfs_rwblock+0x5c>
80411af4:	000c0513          	mv	a0,s8
80411af8:	3cc000ef          	jal	ra,80411ec4 <unlock_sfs_io>
80411afc:	02c12083          	lw	ra,44(sp)
80411b00:	02812403          	lw	s0,40(sp)
80411b04:	00090513          	mv	a0,s2
80411b08:	02412483          	lw	s1,36(sp)
80411b0c:	02012903          	lw	s2,32(sp)
80411b10:	01c12983          	lw	s3,28(sp)
80411b14:	01812a03          	lw	s4,24(sp)
80411b18:	01412a83          	lw	s5,20(sp)
80411b1c:	01012b03          	lw	s6,16(sp)
80411b20:	00c12b83          	lw	s7,12(sp)
80411b24:	00812c03          	lw	s8,8(sp)
80411b28:	03010113          	addi	sp,sp,48
80411b2c:	00008067          	ret
80411b30:	00000913          	li	s2,0
80411b34:	fc1ff06f          	j	80411af4 <sfs_rwblock+0x8c>

80411b38 <sfs_rblock>:
80411b38:	00000713          	li	a4,0
80411b3c:	f2dff06f          	j	80411a68 <sfs_rwblock>

80411b40 <sfs_wblock>:
80411b40:	00100713          	li	a4,1
80411b44:	f25ff06f          	j	80411a68 <sfs_rwblock>

80411b48 <sfs_rbuf>:
80411b48:	fe010113          	addi	sp,sp,-32
80411b4c:	00112e23          	sw	ra,28(sp)
80411b50:	00812c23          	sw	s0,24(sp)
80411b54:	00912a23          	sw	s1,20(sp)
80411b58:	01212823          	sw	s2,16(sp)
80411b5c:	01312623          	sw	s3,12(sp)
80411b60:	01412423          	sw	s4,8(sp)
80411b64:	000017b7          	lui	a5,0x1
80411b68:	08f77663          	bgeu	a4,a5,80411bf4 <sfs_rbuf+0xac>
80411b6c:	00070493          	mv	s1,a4
80411b70:	00c70733          	add	a4,a4,a2
80411b74:	00060993          	mv	s3,a2
80411b78:	06e7ee63          	bltu	a5,a4,80411bf4 <sfs_rbuf+0xac>
80411b7c:	00050413          	mv	s0,a0
80411b80:	00068913          	mv	s2,a3
80411b84:	00058a13          	mv	s4,a1
80411b88:	32c000ef          	jal	ra,80411eb4 <lock_sfs_io>
80411b8c:	03842603          	lw	a2,56(s0)
80411b90:	00090693          	mv	a3,s2
80411b94:	00100793          	li	a5,1
80411b98:	00000713          	li	a4,0
80411b9c:	02c40593          	addi	a1,s0,44
80411ba0:	00440513          	addi	a0,s0,4
80411ba4:	e3dff0ef          	jal	ra,804119e0 <sfs_rwblock_nolock.isra.0>
80411ba8:	00050913          	mv	s2,a0
80411bac:	02050863          	beqz	a0,80411bdc <sfs_rbuf+0x94>
80411bb0:	00040513          	mv	a0,s0
80411bb4:	310000ef          	jal	ra,80411ec4 <unlock_sfs_io>
80411bb8:	01c12083          	lw	ra,28(sp)
80411bbc:	01812403          	lw	s0,24(sp)
80411bc0:	00090513          	mv	a0,s2
80411bc4:	01412483          	lw	s1,20(sp)
80411bc8:	01012903          	lw	s2,16(sp)
80411bcc:	00c12983          	lw	s3,12(sp)
80411bd0:	00812a03          	lw	s4,8(sp)
80411bd4:	02010113          	addi	sp,sp,32
80411bd8:	00008067          	ret
80411bdc:	03842583          	lw	a1,56(s0)
80411be0:	00098613          	mv	a2,s3
80411be4:	000a0513          	mv	a0,s4
80411be8:	009585b3          	add	a1,a1,s1
80411bec:	391000ef          	jal	ra,8041277c <memcpy>
80411bf0:	fc1ff06f          	j	80411bb0 <sfs_rbuf+0x68>
80411bf4:	00004697          	auipc	a3,0x4
80411bf8:	05068693          	addi	a3,a3,80 # 80415c44 <sfs_node_fileops+0xd0>
80411bfc:	00001617          	auipc	a2,0x1
80411c00:	f4060613          	addi	a2,a2,-192 # 80412b3c <commands+0x1bc>
80411c04:	05500593          	li	a1,85
80411c08:	00004517          	auipc	a0,0x4
80411c0c:	0b450513          	addi	a0,a0,180 # 80415cbc <sfs_node_fileops+0x148>
80411c10:	a15ee0ef          	jal	ra,80400624 <__panic>

80411c14 <sfs_wbuf>:
80411c14:	fd010113          	addi	sp,sp,-48
80411c18:	02112623          	sw	ra,44(sp)
80411c1c:	02812423          	sw	s0,40(sp)
80411c20:	02912223          	sw	s1,36(sp)
80411c24:	03212023          	sw	s2,32(sp)
80411c28:	01312e23          	sw	s3,28(sp)
80411c2c:	01412c23          	sw	s4,24(sp)
80411c30:	01512a23          	sw	s5,20(sp)
80411c34:	01612823          	sw	s6,16(sp)
80411c38:	01712623          	sw	s7,12(sp)
80411c3c:	000017b7          	lui	a5,0x1
80411c40:	0cf77063          	bgeu	a4,a5,80411d00 <sfs_wbuf+0xec>
80411c44:	00070493          	mv	s1,a4
80411c48:	00c70733          	add	a4,a4,a2
80411c4c:	00060a13          	mv	s4,a2
80411c50:	0ae7e863          	bltu	a5,a4,80411d00 <sfs_wbuf+0xec>
80411c54:	00050413          	mv	s0,a0
80411c58:	00058b93          	mv	s7,a1
80411c5c:	00068993          	mv	s3,a3
80411c60:	254000ef          	jal	ra,80411eb4 <lock_sfs_io>
80411c64:	03842603          	lw	a2,56(s0)
80411c68:	00440a93          	addi	s5,s0,4
80411c6c:	02c40b13          	addi	s6,s0,44
80411c70:	00100793          	li	a5,1
80411c74:	00000713          	li	a4,0
80411c78:	00098693          	mv	a3,s3
80411c7c:	000b0593          	mv	a1,s6
80411c80:	000a8513          	mv	a0,s5
80411c84:	d5dff0ef          	jal	ra,804119e0 <sfs_rwblock_nolock.isra.0>
80411c88:	00050913          	mv	s2,a0
80411c8c:	02050e63          	beqz	a0,80411cc8 <sfs_wbuf+0xb4>
80411c90:	00040513          	mv	a0,s0
80411c94:	230000ef          	jal	ra,80411ec4 <unlock_sfs_io>
80411c98:	02c12083          	lw	ra,44(sp)
80411c9c:	02812403          	lw	s0,40(sp)
80411ca0:	00090513          	mv	a0,s2
80411ca4:	02412483          	lw	s1,36(sp)
80411ca8:	02012903          	lw	s2,32(sp)
80411cac:	01c12983          	lw	s3,28(sp)
80411cb0:	01812a03          	lw	s4,24(sp)
80411cb4:	01412a83          	lw	s5,20(sp)
80411cb8:	01012b03          	lw	s6,16(sp)
80411cbc:	00c12b83          	lw	s7,12(sp)
80411cc0:	03010113          	addi	sp,sp,48
80411cc4:	00008067          	ret
80411cc8:	03842503          	lw	a0,56(s0)
80411ccc:	000a0613          	mv	a2,s4
80411cd0:	000b8593          	mv	a1,s7
80411cd4:	00950533          	add	a0,a0,s1
80411cd8:	2a5000ef          	jal	ra,8041277c <memcpy>
80411cdc:	03842603          	lw	a2,56(s0)
80411ce0:	00100793          	li	a5,1
80411ce4:	00100713          	li	a4,1
80411ce8:	00098693          	mv	a3,s3
80411cec:	000b0593          	mv	a1,s6
80411cf0:	000a8513          	mv	a0,s5
80411cf4:	cedff0ef          	jal	ra,804119e0 <sfs_rwblock_nolock.isra.0>
80411cf8:	00050913          	mv	s2,a0
80411cfc:	f95ff06f          	j	80411c90 <sfs_wbuf+0x7c>
80411d00:	00004697          	auipc	a3,0x4
80411d04:	f4468693          	addi	a3,a3,-188 # 80415c44 <sfs_node_fileops+0xd0>
80411d08:	00001617          	auipc	a2,0x1
80411d0c:	e3460613          	addi	a2,a2,-460 # 80412b3c <commands+0x1bc>
80411d10:	06b00593          	li	a1,107
80411d14:	00004517          	auipc	a0,0x4
80411d18:	fa850513          	addi	a0,a0,-88 # 80415cbc <sfs_node_fileops+0x148>
80411d1c:	909ee0ef          	jal	ra,80400624 <__panic>

80411d20 <sfs_sync_super>:
80411d20:	ff010113          	addi	sp,sp,-16
80411d24:	00112623          	sw	ra,12(sp)
80411d28:	00812423          	sw	s0,8(sp)
80411d2c:	00912223          	sw	s1,4(sp)
80411d30:	00050413          	mv	s0,a0
80411d34:	180000ef          	jal	ra,80411eb4 <lock_sfs_io>
80411d38:	03842503          	lw	a0,56(s0)
80411d3c:	00001637          	lui	a2,0x1
80411d40:	00000593          	li	a1,0
80411d44:	1c9000ef          	jal	ra,8041270c <memset>
80411d48:	03842503          	lw	a0,56(s0)
80411d4c:	00040593          	mv	a1,s0
80411d50:	02c00613          	li	a2,44
80411d54:	229000ef          	jal	ra,8041277c <memcpy>
80411d58:	03842603          	lw	a2,56(s0)
80411d5c:	02c40593          	addi	a1,s0,44
80411d60:	00000793          	li	a5,0
80411d64:	00100713          	li	a4,1
80411d68:	00000693          	li	a3,0
80411d6c:	00440513          	addi	a0,s0,4
80411d70:	c71ff0ef          	jal	ra,804119e0 <sfs_rwblock_nolock.isra.0>
80411d74:	00050493          	mv	s1,a0
80411d78:	00040513          	mv	a0,s0
80411d7c:	148000ef          	jal	ra,80411ec4 <unlock_sfs_io>
80411d80:	00c12083          	lw	ra,12(sp)
80411d84:	00812403          	lw	s0,8(sp)
80411d88:	00048513          	mv	a0,s1
80411d8c:	00412483          	lw	s1,4(sp)
80411d90:	01010113          	addi	sp,sp,16
80411d94:	00008067          	ret

80411d98 <sfs_sync_freemap>:
80411d98:	ff010113          	addi	sp,sp,-16
80411d9c:	00812423          	sw	s0,8(sp)
80411da0:	00452403          	lw	s0,4(a0)
80411da4:	00912223          	sw	s1,4(sp)
80411da8:	000086b7          	lui	a3,0x8
80411dac:	00050493          	mv	s1,a0
80411db0:	03052503          	lw	a0,48(a0)
80411db4:	fff68693          	addi	a3,a3,-1 # 7fff <_binary_bin_swap_img_size-0x1>
80411db8:	00d40433          	add	s0,s0,a3
80411dbc:	00000593          	li	a1,0
80411dc0:	00112623          	sw	ra,12(sp)
80411dc4:	00f45413          	srli	s0,s0,0xf
80411dc8:	f2cfd0ef          	jal	ra,8040f4f4 <bitmap_getdata>
80411dcc:	00040693          	mv	a3,s0
80411dd0:	00812403          	lw	s0,8(sp)
80411dd4:	00c12083          	lw	ra,12(sp)
80411dd8:	00050593          	mv	a1,a0
80411ddc:	00048513          	mv	a0,s1
80411de0:	00412483          	lw	s1,4(sp)
80411de4:	00100713          	li	a4,1
80411de8:	00200613          	li	a2,2
80411dec:	01010113          	addi	sp,sp,16
80411df0:	c79ff06f          	j	80411a68 <sfs_rwblock>

80411df4 <sfs_clear_block>:
80411df4:	fe010113          	addi	sp,sp,-32
80411df8:	00112e23          	sw	ra,28(sp)
80411dfc:	00812c23          	sw	s0,24(sp)
80411e00:	00912a23          	sw	s1,20(sp)
80411e04:	00058413          	mv	s0,a1
80411e08:	00060493          	mv	s1,a2
80411e0c:	01212823          	sw	s2,16(sp)
80411e10:	01312623          	sw	s3,12(sp)
80411e14:	00050913          	mv	s2,a0
80411e18:	01412423          	sw	s4,8(sp)
80411e1c:	01512223          	sw	s5,4(sp)
80411e20:	094000ef          	jal	ra,80411eb4 <lock_sfs_io>
80411e24:	03892503          	lw	a0,56(s2)
80411e28:	00001637          	lui	a2,0x1
80411e2c:	00000593          	li	a1,0
80411e30:	0dd000ef          	jal	ra,8041270c <memset>
80411e34:	00940ab3          	add	s5,s0,s1
80411e38:	00490a13          	addi	s4,s2,4
80411e3c:	02c90993          	addi	s3,s2,44
80411e40:	00049663          	bnez	s1,80411e4c <sfs_clear_block+0x58>
80411e44:	0600006f          	j	80411ea4 <sfs_clear_block+0xb0>
80411e48:	05540e63          	beq	s0,s5,80411ea4 <sfs_clear_block+0xb0>
80411e4c:	03892603          	lw	a2,56(s2)
80411e50:	00040693          	mv	a3,s0
80411e54:	00100793          	li	a5,1
80411e58:	00100713          	li	a4,1
80411e5c:	00098593          	mv	a1,s3
80411e60:	000a0513          	mv	a0,s4
80411e64:	b7dff0ef          	jal	ra,804119e0 <sfs_rwblock_nolock.isra.0>
80411e68:	00050493          	mv	s1,a0
80411e6c:	00140413          	addi	s0,s0,1
80411e70:	fc050ce3          	beqz	a0,80411e48 <sfs_clear_block+0x54>
80411e74:	00090513          	mv	a0,s2
80411e78:	04c000ef          	jal	ra,80411ec4 <unlock_sfs_io>
80411e7c:	01c12083          	lw	ra,28(sp)
80411e80:	01812403          	lw	s0,24(sp)
80411e84:	00048513          	mv	a0,s1
80411e88:	01012903          	lw	s2,16(sp)
80411e8c:	01412483          	lw	s1,20(sp)
80411e90:	00c12983          	lw	s3,12(sp)
80411e94:	00812a03          	lw	s4,8(sp)
80411e98:	00412a83          	lw	s5,4(sp)
80411e9c:	02010113          	addi	sp,sp,32
80411ea0:	00008067          	ret
80411ea4:	00000493          	li	s1,0
80411ea8:	fcdff06f          	j	80411e74 <sfs_clear_block+0x80>

80411eac <lock_sfs_fs>:
80411eac:	03c50513          	addi	a0,a0,60
80411eb0:	a10f306f          	j	804050c0 <down>

80411eb4 <lock_sfs_io>:
80411eb4:	04850513          	addi	a0,a0,72
80411eb8:	a08f306f          	j	804050c0 <down>

80411ebc <unlock_sfs_fs>:
80411ebc:	03c50513          	addi	a0,a0,60
80411ec0:	9fcf306f          	j	804050bc <up>

80411ec4 <unlock_sfs_io>:
80411ec4:	04850513          	addi	a0,a0,72
80411ec8:	9f4f306f          	j	804050bc <up>

80411ecc <hash32>:
80411ecc:	00351793          	slli	a5,a0,0x3
80411ed0:	40a787b3          	sub	a5,a5,a0
80411ed4:	00679793          	slli	a5,a5,0x6
80411ed8:	40a78733          	sub	a4,a5,a0
80411edc:	00371793          	slli	a5,a4,0x3
80411ee0:	40e787b3          	sub	a5,a5,a4
80411ee4:	00379793          	slli	a5,a5,0x3
80411ee8:	00a787b3          	add	a5,a5,a0
80411eec:	01079793          	slli	a5,a5,0x10
80411ef0:	40f50533          	sub	a0,a0,a5
80411ef4:	02000793          	li	a5,32
80411ef8:	40b785b3          	sub	a1,a5,a1
80411efc:	00b55533          	srl	a0,a0,a1
80411f00:	00008067          	ret

80411f04 <printnum>:
80411f04:	fd010113          	addi	sp,sp,-48
80411f08:	02912223          	sw	s1,36(sp)
80411f0c:	01312e23          	sw	s3,28(sp)
80411f10:	00050493          	mv	s1,a0
80411f14:	00058993          	mv	s3,a1
80411f18:	00068513          	mv	a0,a3
80411f1c:	00078593          	mv	a1,a5
80411f20:	02812423          	sw	s0,40(sp)
80411f24:	03212023          	sw	s2,32(sp)
80411f28:	01412c23          	sw	s4,24(sp)
80411f2c:	01512a23          	sw	s5,20(sp)
80411f30:	01612823          	sw	s6,16(sp)
80411f34:	01712623          	sw	s7,12(sp)
80411f38:	01812423          	sw	s8,8(sp)
80411f3c:	02112623          	sw	ra,44(sp)
80411f40:	00068b13          	mv	s6,a3
80411f44:	00078a93          	mv	s5,a5
80411f48:	00070c13          	mv	s8,a4
80411f4c:	00060913          	mv	s2,a2
80411f50:	00088a13          	mv	s4,a7
80411f54:	fff80413          	addi	s0,a6,-1
80411f58:	0bd000ef          	jal	ra,80412814 <__umodsi3>
80411f5c:	00050b93          	mv	s7,a0
80411f60:	060c1863          	bnez	s8,80411fd0 <printnum+0xcc>
80411f64:	075b7663          	bgeu	s6,s5,80411fd0 <printnum+0xcc>
80411f68:	00805e63          	blez	s0,80411f84 <printnum+0x80>
80411f6c:	fff40413          	addi	s0,s0,-1
80411f70:	00098613          	mv	a2,s3
80411f74:	00090593          	mv	a1,s2
80411f78:	000a0513          	mv	a0,s4
80411f7c:	000480e7          	jalr	s1
80411f80:	fe0416e3          	bnez	s0,80411f6c <printnum+0x68>
80411f84:	00004517          	auipc	a0,0x4
80411f88:	f0c50513          	addi	a0,a0,-244 # 80415e90 <error_string+0x64>
80411f8c:	01750533          	add	a0,a0,s7
80411f90:	02812403          	lw	s0,40(sp)
80411f94:	02c12083          	lw	ra,44(sp)
80411f98:	01812a03          	lw	s4,24(sp)
80411f9c:	01412a83          	lw	s5,20(sp)
80411fa0:	01012b03          	lw	s6,16(sp)
80411fa4:	00c12b83          	lw	s7,12(sp)
80411fa8:	00812c03          	lw	s8,8(sp)
80411fac:	00054503          	lbu	a0,0(a0)
80411fb0:	00098613          	mv	a2,s3
80411fb4:	00090593          	mv	a1,s2
80411fb8:	01c12983          	lw	s3,28(sp)
80411fbc:	02012903          	lw	s2,32(sp)
80411fc0:	00048313          	mv	t1,s1
80411fc4:	02412483          	lw	s1,36(sp)
80411fc8:	03010113          	addi	sp,sp,48
80411fcc:	00030067          	jr	t1
80411fd0:	000a8593          	mv	a1,s5
80411fd4:	000b0513          	mv	a0,s6
80411fd8:	7f4000ef          	jal	ra,804127cc <__udivsi3>
80411fdc:	00050693          	mv	a3,a0
80411fe0:	000a0893          	mv	a7,s4
80411fe4:	00040813          	mv	a6,s0
80411fe8:	000a8793          	mv	a5,s5
80411fec:	00000713          	li	a4,0
80411ff0:	00090613          	mv	a2,s2
80411ff4:	00098593          	mv	a1,s3
80411ff8:	00048513          	mv	a0,s1
80411ffc:	f09ff0ef          	jal	ra,80411f04 <printnum>
80412000:	f85ff06f          	j	80411f84 <printnum+0x80>

80412004 <sprintputch>:
80412004:	0085a783          	lw	a5,8(a1)
80412008:	0005a703          	lw	a4,0(a1)
8041200c:	0045a683          	lw	a3,4(a1)
80412010:	00178793          	addi	a5,a5,1 # 1001 <_binary_bin_swap_img_size-0x6fff>
80412014:	00f5a423          	sw	a5,8(a1)
80412018:	00d77863          	bgeu	a4,a3,80412028 <sprintputch+0x24>
8041201c:	00170793          	addi	a5,a4,1
80412020:	00f5a023          	sw	a5,0(a1)
80412024:	00a70023          	sb	a0,0(a4)
80412028:	00008067          	ret

8041202c <vprintfmt>:
8041202c:	fb010113          	addi	sp,sp,-80
80412030:	04912223          	sw	s1,68(sp)
80412034:	05212023          	sw	s2,64(sp)
80412038:	03312e23          	sw	s3,60(sp)
8041203c:	03512a23          	sw	s5,52(sp)
80412040:	03612823          	sw	s6,48(sp)
80412044:	03712623          	sw	s7,44(sp)
80412048:	03812423          	sw	s8,40(sp)
8041204c:	01b12e23          	sw	s11,28(sp)
80412050:	04112623          	sw	ra,76(sp)
80412054:	04812423          	sw	s0,72(sp)
80412058:	03412c23          	sw	s4,56(sp)
8041205c:	03912223          	sw	s9,36(sp)
80412060:	03a12023          	sw	s10,32(sp)
80412064:	00050993          	mv	s3,a0
80412068:	00058913          	mv	s2,a1
8041206c:	00060493          	mv	s1,a2
80412070:	00068d93          	mv	s11,a3
80412074:	00070b13          	mv	s6,a4
80412078:	00004a97          	auipc	s5,0x4
8041207c:	c5ca8a93          	addi	s5,s5,-932 # 80415cd4 <sfs_node_fileops+0x160>
80412080:	fff00b93          	li	s7,-1
80412084:	05e00c13          	li	s8,94
80412088:	000dc503          	lbu	a0,0(s11)
8041208c:	02500793          	li	a5,37
80412090:	001d8413          	addi	s0,s11,1
80412094:	02f50663          	beq	a0,a5,804120c0 <vprintfmt+0x94>
80412098:	06050663          	beqz	a0,80412104 <vprintfmt+0xd8>
8041209c:	02500a13          	li	s4,37
804120a0:	0080006f          	j	804120a8 <vprintfmt+0x7c>
804120a4:	06050063          	beqz	a0,80412104 <vprintfmt+0xd8>
804120a8:	00090613          	mv	a2,s2
804120ac:	00048593          	mv	a1,s1
804120b0:	00140413          	addi	s0,s0,1
804120b4:	000980e7          	jalr	s3
804120b8:	fff44503          	lbu	a0,-1(s0)
804120bc:	ff4514e3          	bne	a0,s4,804120a4 <vprintfmt+0x78>
804120c0:	00044503          	lbu	a0,0(s0)
804120c4:	02000893          	li	a7,32
804120c8:	00000a13          	li	s4,0
804120cc:	00000593          	li	a1,0
804120d0:	fff00c93          	li	s9,-1
804120d4:	fff00d13          	li	s10,-1
804120d8:	05500693          	li	a3,85
804120dc:	00900613          	li	a2,9
804120e0:	fdd50793          	addi	a5,a0,-35
804120e4:	0ff7f793          	andi	a5,a5,255
804120e8:	00140d93          	addi	s11,s0,1
804120ec:	2ef6e663          	bltu	a3,a5,804123d8 <vprintfmt+0x3ac>
804120f0:	00279793          	slli	a5,a5,0x2
804120f4:	015787b3          	add	a5,a5,s5
804120f8:	0007a783          	lw	a5,0(a5)
804120fc:	015787b3          	add	a5,a5,s5
80412100:	00078067          	jr	a5
80412104:	04c12083          	lw	ra,76(sp)
80412108:	04812403          	lw	s0,72(sp)
8041210c:	04412483          	lw	s1,68(sp)
80412110:	04012903          	lw	s2,64(sp)
80412114:	03c12983          	lw	s3,60(sp)
80412118:	03812a03          	lw	s4,56(sp)
8041211c:	03412a83          	lw	s5,52(sp)
80412120:	03012b03          	lw	s6,48(sp)
80412124:	02c12b83          	lw	s7,44(sp)
80412128:	02812c03          	lw	s8,40(sp)
8041212c:	02412c83          	lw	s9,36(sp)
80412130:	02012d03          	lw	s10,32(sp)
80412134:	01c12d83          	lw	s11,28(sp)
80412138:	05010113          	addi	sp,sp,80
8041213c:	00008067          	ret
80412140:	00050893          	mv	a7,a0
80412144:	00144503          	lbu	a0,1(s0)
80412148:	000d8413          	mv	s0,s11
8041214c:	f95ff06f          	j	804120e0 <vprintfmt+0xb4>
80412150:	000b2c83          	lw	s9,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
80412154:	00144503          	lbu	a0,1(s0)
80412158:	004b0b13          	addi	s6,s6,4
8041215c:	000d8413          	mv	s0,s11
80412160:	f80d50e3          	bgez	s10,804120e0 <vprintfmt+0xb4>
80412164:	000c8d13          	mv	s10,s9
80412168:	fff00c93          	li	s9,-1
8041216c:	f75ff06f          	j	804120e0 <vprintfmt+0xb4>
80412170:	fffd4793          	not	a5,s10
80412174:	41f7d793          	srai	a5,a5,0x1f
80412178:	00144503          	lbu	a0,1(s0)
8041217c:	00fd7d33          	and	s10,s10,a5
80412180:	000d8413          	mv	s0,s11
80412184:	f5dff06f          	j	804120e0 <vprintfmt+0xb4>
80412188:	00100793          	li	a5,1
8041218c:	32b7c463          	blt	a5,a1,804124b4 <vprintfmt+0x488>
80412190:	000b2683          	lw	a3,0(s6)
80412194:	00000713          	li	a4,0
80412198:	004b0b13          	addi	s6,s6,4
8041219c:	01000793          	li	a5,16
804121a0:	000d0813          	mv	a6,s10
804121a4:	00048613          	mv	a2,s1
804121a8:	00090593          	mv	a1,s2
804121ac:	00098513          	mv	a0,s3
804121b0:	d55ff0ef          	jal	ra,80411f04 <printnum>
804121b4:	ed5ff06f          	j	80412088 <vprintfmt+0x5c>
804121b8:	00144303          	lbu	t1,1(s0)
804121bc:	fd050c93          	addi	s9,a0,-48
804121c0:	000d8413          	mv	s0,s11
804121c4:	fd030793          	addi	a5,t1,-48
804121c8:	00030513          	mv	a0,t1
804121cc:	f8f66ae3          	bltu	a2,a5,80412160 <vprintfmt+0x134>
804121d0:	002c9793          	slli	a5,s9,0x2
804121d4:	01978733          	add	a4,a5,s9
804121d8:	00140413          	addi	s0,s0,1
804121dc:	00171713          	slli	a4,a4,0x1
804121e0:	00670733          	add	a4,a4,t1
804121e4:	00044303          	lbu	t1,0(s0)
804121e8:	fd070c93          	addi	s9,a4,-48
804121ec:	fd030793          	addi	a5,t1,-48
804121f0:	00030513          	mv	a0,t1
804121f4:	fcf67ee3          	bgeu	a2,a5,804121d0 <vprintfmt+0x1a4>
804121f8:	f69ff06f          	j	80412160 <vprintfmt+0x134>
804121fc:	000b2503          	lw	a0,0(s6)
80412200:	00090613          	mv	a2,s2
80412204:	00048593          	mv	a1,s1
80412208:	004b0b13          	addi	s6,s6,4
8041220c:	000980e7          	jalr	s3
80412210:	e79ff06f          	j	80412088 <vprintfmt+0x5c>
80412214:	00100793          	li	a5,1
80412218:	28b7c263          	blt	a5,a1,8041249c <vprintfmt+0x470>
8041221c:	000b2a03          	lw	s4,0(s6)
80412220:	004b0793          	addi	a5,s6,4
80412224:	00078b13          	mv	s6,a5
80412228:	41fa5413          	srai	s0,s4,0x1f
8041222c:	2c044063          	bltz	s0,804124ec <vprintfmt+0x4c0>
80412230:	000a0693          	mv	a3,s4
80412234:	00040713          	mv	a4,s0
80412238:	00a00793          	li	a5,10
8041223c:	f65ff06f          	j	804121a0 <vprintfmt+0x174>
80412240:	000b2703          	lw	a4,0(s6)
80412244:	01800693          	li	a3,24
80412248:	004b0b13          	addi	s6,s6,4
8041224c:	41f75793          	srai	a5,a4,0x1f
80412250:	00e7c733          	xor	a4,a5,a4
80412254:	40f70733          	sub	a4,a4,a5
80412258:	1ae6ca63          	blt	a3,a4,8041240c <vprintfmt+0x3e0>
8041225c:	00271793          	slli	a5,a4,0x2
80412260:	00004697          	auipc	a3,0x4
80412264:	bcc68693          	addi	a3,a3,-1076 # 80415e2c <error_string>
80412268:	00f687b3          	add	a5,a3,a5
8041226c:	0007a783          	lw	a5,0(a5)
80412270:	18078e63          	beqz	a5,8041240c <vprintfmt+0x3e0>
80412274:	00078713          	mv	a4,a5
80412278:	00000697          	auipc	a3,0x0
8041227c:	62468693          	addi	a3,a3,1572 # 8041289c <etext+0x24>
80412280:	00048613          	mv	a2,s1
80412284:	00090593          	mv	a1,s2
80412288:	00098513          	mv	a0,s3
8041228c:	2cc000ef          	jal	ra,80412558 <printfmt>
80412290:	df9ff06f          	j	80412088 <vprintfmt+0x5c>
80412294:	000b2783          	lw	a5,0(s6)
80412298:	004b0b13          	addi	s6,s6,4
8041229c:	28078e63          	beqz	a5,80412538 <vprintfmt+0x50c>
804122a0:	00178413          	addi	s0,a5,1
804122a4:	1fa05063          	blez	s10,80412484 <vprintfmt+0x458>
804122a8:	02d00693          	li	a3,45
804122ac:	18d89663          	bne	a7,a3,80412438 <vprintfmt+0x40c>
804122b0:	0007c783          	lbu	a5,0(a5)
804122b4:	00078513          	mv	a0,a5
804122b8:	04078263          	beqz	a5,804122fc <vprintfmt+0x2d0>
804122bc:	000cc663          	bltz	s9,804122c8 <vprintfmt+0x29c>
804122c0:	fffc8c93          	addi	s9,s9,-1
804122c4:	037c8a63          	beq	s9,s7,804122f8 <vprintfmt+0x2cc>
804122c8:	00090613          	mv	a2,s2
804122cc:	00048593          	mv	a1,s1
804122d0:	1c0a0263          	beqz	s4,80412494 <vprintfmt+0x468>
804122d4:	fe078793          	addi	a5,a5,-32
804122d8:	1afc7e63          	bgeu	s8,a5,80412494 <vprintfmt+0x468>
804122dc:	03f00513          	li	a0,63
804122e0:	000980e7          	jalr	s3
804122e4:	00140413          	addi	s0,s0,1
804122e8:	fff44783          	lbu	a5,-1(s0)
804122ec:	fffd0d13          	addi	s10,s10,-1
804122f0:	00078513          	mv	a0,a5
804122f4:	fc0794e3          	bnez	a5,804122bc <vprintfmt+0x290>
804122f8:	d9a058e3          	blez	s10,80412088 <vprintfmt+0x5c>
804122fc:	fffd0d13          	addi	s10,s10,-1
80412300:	00090613          	mv	a2,s2
80412304:	00048593          	mv	a1,s1
80412308:	02000513          	li	a0,32
8041230c:	000980e7          	jalr	s3
80412310:	d60d0ce3          	beqz	s10,80412088 <vprintfmt+0x5c>
80412314:	fffd0d13          	addi	s10,s10,-1
80412318:	00090613          	mv	a2,s2
8041231c:	00048593          	mv	a1,s1
80412320:	02000513          	li	a0,32
80412324:	000980e7          	jalr	s3
80412328:	fc0d1ae3          	bnez	s10,804122fc <vprintfmt+0x2d0>
8041232c:	d5dff06f          	j	80412088 <vprintfmt+0x5c>
80412330:	00100793          	li	a5,1
80412334:	18b7ce63          	blt	a5,a1,804124d0 <vprintfmt+0x4a4>
80412338:	000b2683          	lw	a3,0(s6)
8041233c:	00000713          	li	a4,0
80412340:	004b0b13          	addi	s6,s6,4
80412344:	00800793          	li	a5,8
80412348:	e59ff06f          	j	804121a0 <vprintfmt+0x174>
8041234c:	03000513          	li	a0,48
80412350:	00090613          	mv	a2,s2
80412354:	00048593          	mv	a1,s1
80412358:	01112423          	sw	a7,8(sp)
8041235c:	000980e7          	jalr	s3
80412360:	00090613          	mv	a2,s2
80412364:	00048593          	mv	a1,s1
80412368:	07800513          	li	a0,120
8041236c:	000980e7          	jalr	s3
80412370:	004b0b13          	addi	s6,s6,4
80412374:	ffcb2683          	lw	a3,-4(s6)
80412378:	00000713          	li	a4,0
8041237c:	01000793          	li	a5,16
80412380:	00812883          	lw	a7,8(sp)
80412384:	e1dff06f          	j	804121a0 <vprintfmt+0x174>
80412388:	00144503          	lbu	a0,1(s0)
8041238c:	00158593          	addi	a1,a1,1
80412390:	000d8413          	mv	s0,s11
80412394:	d4dff06f          	j	804120e0 <vprintfmt+0xb4>
80412398:	00144503          	lbu	a0,1(s0)
8041239c:	00100a13          	li	s4,1
804123a0:	000d8413          	mv	s0,s11
804123a4:	d3dff06f          	j	804120e0 <vprintfmt+0xb4>
804123a8:	00090613          	mv	a2,s2
804123ac:	00048593          	mv	a1,s1
804123b0:	02500513          	li	a0,37
804123b4:	000980e7          	jalr	s3
804123b8:	cd1ff06f          	j	80412088 <vprintfmt+0x5c>
804123bc:	00100793          	li	a5,1
804123c0:	14b7ce63          	blt	a5,a1,8041251c <vprintfmt+0x4f0>
804123c4:	000b2683          	lw	a3,0(s6)
804123c8:	00000713          	li	a4,0
804123cc:	004b0b13          	addi	s6,s6,4
804123d0:	00a00793          	li	a5,10
804123d4:	dcdff06f          	j	804121a0 <vprintfmt+0x174>
804123d8:	00090613          	mv	a2,s2
804123dc:	00048593          	mv	a1,s1
804123e0:	02500513          	li	a0,37
804123e4:	000980e7          	jalr	s3
804123e8:	fff44703          	lbu	a4,-1(s0)
804123ec:	02500793          	li	a5,37
804123f0:	00040d93          	mv	s11,s0
804123f4:	c8f70ae3          	beq	a4,a5,80412088 <vprintfmt+0x5c>
804123f8:	02500713          	li	a4,37
804123fc:	fffd8d93          	addi	s11,s11,-1
80412400:	fffdc783          	lbu	a5,-1(s11)
80412404:	fee79ce3          	bne	a5,a4,804123fc <vprintfmt+0x3d0>
80412408:	c81ff06f          	j	80412088 <vprintfmt+0x5c>
8041240c:	00004697          	auipc	a3,0x4
80412410:	c4c68693          	addi	a3,a3,-948 # 80416058 <error_string+0x22c>
80412414:	00048613          	mv	a2,s1
80412418:	00090593          	mv	a1,s2
8041241c:	00098513          	mv	a0,s3
80412420:	138000ef          	jal	ra,80412558 <printfmt>
80412424:	c65ff06f          	j	80412088 <vprintfmt+0x5c>
80412428:	00004797          	auipc	a5,0x4
8041242c:	c2878793          	addi	a5,a5,-984 # 80416050 <error_string+0x224>
80412430:	00004417          	auipc	s0,0x4
80412434:	c2140413          	addi	s0,s0,-991 # 80416051 <error_string+0x225>
80412438:	00078513          	mv	a0,a5
8041243c:	000c8593          	mv	a1,s9
80412440:	01112623          	sw	a7,12(sp)
80412444:	00f12423          	sw	a5,8(sp)
80412448:	210000ef          	jal	ra,80412658 <strnlen>
8041244c:	40ad0d33          	sub	s10,s10,a0
80412450:	00812783          	lw	a5,8(sp)
80412454:	00c12883          	lw	a7,12(sp)
80412458:	03a05663          	blez	s10,80412484 <vprintfmt+0x458>
8041245c:	00088513          	mv	a0,a7
80412460:	00090613          	mv	a2,s2
80412464:	00048593          	mv	a1,s1
80412468:	00f12623          	sw	a5,12(sp)
8041246c:	01112423          	sw	a7,8(sp)
80412470:	fffd0d13          	addi	s10,s10,-1
80412474:	000980e7          	jalr	s3
80412478:	00812883          	lw	a7,8(sp)
8041247c:	00c12783          	lw	a5,12(sp)
80412480:	fc0d1ee3          	bnez	s10,8041245c <vprintfmt+0x430>
80412484:	0007c783          	lbu	a5,0(a5)
80412488:	00078513          	mv	a0,a5
8041248c:	e20798e3          	bnez	a5,804122bc <vprintfmt+0x290>
80412490:	bf9ff06f          	j	80412088 <vprintfmt+0x5c>
80412494:	000980e7          	jalr	s3
80412498:	e4dff06f          	j	804122e4 <vprintfmt+0x2b8>
8041249c:	007b0793          	addi	a5,s6,7
804124a0:	ff87f793          	andi	a5,a5,-8
804124a4:	00878b13          	addi	s6,a5,8
804124a8:	0007aa03          	lw	s4,0(a5)
804124ac:	0047a403          	lw	s0,4(a5)
804124b0:	d7dff06f          	j	8041222c <vprintfmt+0x200>
804124b4:	007b0793          	addi	a5,s6,7
804124b8:	ff87f793          	andi	a5,a5,-8
804124bc:	00878b13          	addi	s6,a5,8
804124c0:	0007a683          	lw	a3,0(a5)
804124c4:	0047a703          	lw	a4,4(a5)
804124c8:	01000793          	li	a5,16
804124cc:	cd5ff06f          	j	804121a0 <vprintfmt+0x174>
804124d0:	007b0793          	addi	a5,s6,7
804124d4:	ff87f793          	andi	a5,a5,-8
804124d8:	00878b13          	addi	s6,a5,8
804124dc:	0007a683          	lw	a3,0(a5)
804124e0:	0047a703          	lw	a4,4(a5)
804124e4:	00800793          	li	a5,8
804124e8:	cb9ff06f          	j	804121a0 <vprintfmt+0x174>
804124ec:	00090613          	mv	a2,s2
804124f0:	00048593          	mv	a1,s1
804124f4:	02d00513          	li	a0,45
804124f8:	01112423          	sw	a7,8(sp)
804124fc:	000980e7          	jalr	s3
80412500:	414006b3          	neg	a3,s4
80412504:	00d037b3          	snez	a5,a3
80412508:	40800733          	neg	a4,s0
8041250c:	40f70733          	sub	a4,a4,a5
80412510:	00812883          	lw	a7,8(sp)
80412514:	00a00793          	li	a5,10
80412518:	c89ff06f          	j	804121a0 <vprintfmt+0x174>
8041251c:	007b0793          	addi	a5,s6,7
80412520:	ff87f793          	andi	a5,a5,-8
80412524:	00878b13          	addi	s6,a5,8
80412528:	0007a683          	lw	a3,0(a5)
8041252c:	0047a703          	lw	a4,4(a5)
80412530:	00a00793          	li	a5,10
80412534:	c6dff06f          	j	804121a0 <vprintfmt+0x174>
80412538:	01a05663          	blez	s10,80412544 <vprintfmt+0x518>
8041253c:	02d00793          	li	a5,45
80412540:	eef894e3          	bne	a7,a5,80412428 <vprintfmt+0x3fc>
80412544:	00004417          	auipc	s0,0x4
80412548:	b0d40413          	addi	s0,s0,-1267 # 80416051 <error_string+0x225>
8041254c:	02800513          	li	a0,40
80412550:	02800793          	li	a5,40
80412554:	d69ff06f          	j	804122bc <vprintfmt+0x290>

80412558 <printfmt>:
80412558:	fd010113          	addi	sp,sp,-48
8041255c:	02010313          	addi	t1,sp,32
80412560:	02e12023          	sw	a4,32(sp)
80412564:	00030713          	mv	a4,t1
80412568:	00112e23          	sw	ra,28(sp)
8041256c:	02f12223          	sw	a5,36(sp)
80412570:	03012423          	sw	a6,40(sp)
80412574:	03112623          	sw	a7,44(sp)
80412578:	00612623          	sw	t1,12(sp)
8041257c:	ab1ff0ef          	jal	ra,8041202c <vprintfmt>
80412580:	01c12083          	lw	ra,28(sp)
80412584:	03010113          	addi	sp,sp,48
80412588:	00008067          	ret

8041258c <vsnprintf>:
8041258c:	fff58593          	addi	a1,a1,-1
80412590:	fe010113          	addi	sp,sp,-32
80412594:	00b505b3          	add	a1,a0,a1
80412598:	00112e23          	sw	ra,28(sp)
8041259c:	00a12223          	sw	a0,4(sp)
804125a0:	00b12423          	sw	a1,8(sp)
804125a4:	00012623          	sw	zero,12(sp)
804125a8:	04050063          	beqz	a0,804125e8 <vsnprintf+0x5c>
804125ac:	02a5ee63          	bltu	a1,a0,804125e8 <vsnprintf+0x5c>
804125b0:	ffff75b7          	lui	a1,0xffff7
804125b4:	00068713          	mv	a4,a3
804125b8:	00000517          	auipc	a0,0x0
804125bc:	a4c50513          	addi	a0,a0,-1460 # 80412004 <sprintputch>
804125c0:	00060693          	mv	a3,a2
804125c4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a21d>
804125c8:	00410613          	addi	a2,sp,4
804125cc:	a61ff0ef          	jal	ra,8041202c <vprintfmt>
804125d0:	00412783          	lw	a5,4(sp)
804125d4:	00078023          	sb	zero,0(a5)
804125d8:	00c12503          	lw	a0,12(sp)
804125dc:	01c12083          	lw	ra,28(sp)
804125e0:	02010113          	addi	sp,sp,32
804125e4:	00008067          	ret
804125e8:	ffd00513          	li	a0,-3
804125ec:	ff1ff06f          	j	804125dc <vsnprintf+0x50>

804125f0 <snprintf>:
804125f0:	fc010113          	addi	sp,sp,-64
804125f4:	02c10313          	addi	t1,sp,44
804125f8:	02d12623          	sw	a3,44(sp)
804125fc:	00030693          	mv	a3,t1
80412600:	00112e23          	sw	ra,28(sp)
80412604:	02e12823          	sw	a4,48(sp)
80412608:	02f12a23          	sw	a5,52(sp)
8041260c:	03012c23          	sw	a6,56(sp)
80412610:	03112e23          	sw	a7,60(sp)
80412614:	00612623          	sw	t1,12(sp)
80412618:	f75ff0ef          	jal	ra,8041258c <vsnprintf>
8041261c:	01c12083          	lw	ra,28(sp)
80412620:	04010113          	addi	sp,sp,64
80412624:	00008067          	ret

80412628 <strlen>:
80412628:	00054783          	lbu	a5,0(a0)
8041262c:	02078063          	beqz	a5,8041264c <strlen+0x24>
80412630:	00000793          	li	a5,0
80412634:	00178793          	addi	a5,a5,1
80412638:	00f50733          	add	a4,a0,a5
8041263c:	00074703          	lbu	a4,0(a4)
80412640:	fe071ae3          	bnez	a4,80412634 <strlen+0xc>
80412644:	00078513          	mv	a0,a5
80412648:	00008067          	ret
8041264c:	00000793          	li	a5,0
80412650:	00078513          	mv	a0,a5
80412654:	00008067          	ret

80412658 <strnlen>:
80412658:	02058863          	beqz	a1,80412688 <strnlen+0x30>
8041265c:	00054783          	lbu	a5,0(a0)
80412660:	02078463          	beqz	a5,80412688 <strnlen+0x30>
80412664:	00000793          	li	a5,0
80412668:	00c0006f          	j	80412674 <strnlen+0x1c>
8041266c:	00074703          	lbu	a4,0(a4)
80412670:	00070863          	beqz	a4,80412680 <strnlen+0x28>
80412674:	00178793          	addi	a5,a5,1
80412678:	00f50733          	add	a4,a0,a5
8041267c:	fef598e3          	bne	a1,a5,8041266c <strnlen+0x14>
80412680:	00078513          	mv	a0,a5
80412684:	00008067          	ret
80412688:	00000793          	li	a5,0
8041268c:	00078513          	mv	a0,a5
80412690:	00008067          	ret

80412694 <strcpy>:
80412694:	00050793          	mv	a5,a0
80412698:	00158593          	addi	a1,a1,1
8041269c:	fff5c703          	lbu	a4,-1(a1)
804126a0:	00178793          	addi	a5,a5,1
804126a4:	fee78fa3          	sb	a4,-1(a5)
804126a8:	fe0718e3          	bnez	a4,80412698 <strcpy+0x4>
804126ac:	00008067          	ret

804126b0 <strcmp>:
804126b0:	00054783          	lbu	a5,0(a0)
804126b4:	0005c703          	lbu	a4,0(a1)
804126b8:	00078e63          	beqz	a5,804126d4 <strcmp+0x24>
804126bc:	00e79e63          	bne	a5,a4,804126d8 <strcmp+0x28>
804126c0:	00150513          	addi	a0,a0,1
804126c4:	00054783          	lbu	a5,0(a0)
804126c8:	00158593          	addi	a1,a1,1
804126cc:	0005c703          	lbu	a4,0(a1)
804126d0:	fe0796e3          	bnez	a5,804126bc <strcmp+0xc>
804126d4:	00000793          	li	a5,0
804126d8:	40e78533          	sub	a0,a5,a4
804126dc:	00008067          	ret

804126e0 <strchr>:
804126e0:	00054783          	lbu	a5,0(a0)
804126e4:	00078e63          	beqz	a5,80412700 <strchr+0x20>
804126e8:	00b79663          	bne	a5,a1,804126f4 <strchr+0x14>
804126ec:	01c0006f          	j	80412708 <strchr+0x28>
804126f0:	00b78a63          	beq	a5,a1,80412704 <strchr+0x24>
804126f4:	00150513          	addi	a0,a0,1
804126f8:	00054783          	lbu	a5,0(a0)
804126fc:	fe079ae3          	bnez	a5,804126f0 <strchr+0x10>
80412700:	00000513          	li	a0,0
80412704:	00008067          	ret
80412708:	00008067          	ret

8041270c <memset>:
8041270c:	00060c63          	beqz	a2,80412724 <memset+0x18>
80412710:	00c50633          	add	a2,a0,a2
80412714:	00050793          	mv	a5,a0
80412718:	00178793          	addi	a5,a5,1
8041271c:	feb78fa3          	sb	a1,-1(a5)
80412720:	fec79ce3          	bne	a5,a2,80412718 <memset+0xc>
80412724:	00008067          	ret

80412728 <memmove>:
80412728:	02a5f663          	bgeu	a1,a0,80412754 <memmove+0x2c>
8041272c:	00c587b3          	add	a5,a1,a2
80412730:	02f57263          	bgeu	a0,a5,80412754 <memmove+0x2c>
80412734:	00c50733          	add	a4,a0,a2
80412738:	02060e63          	beqz	a2,80412774 <memmove+0x4c>
8041273c:	fff78793          	addi	a5,a5,-1
80412740:	0007c683          	lbu	a3,0(a5)
80412744:	fff70713          	addi	a4,a4,-1
80412748:	00d70023          	sb	a3,0(a4)
8041274c:	fef598e3          	bne	a1,a5,8041273c <memmove+0x14>
80412750:	00008067          	ret
80412754:	00c586b3          	add	a3,a1,a2
80412758:	00050793          	mv	a5,a0
8041275c:	00060e63          	beqz	a2,80412778 <memmove+0x50>
80412760:	00158593          	addi	a1,a1,1
80412764:	fff5c703          	lbu	a4,-1(a1)
80412768:	00178793          	addi	a5,a5,1
8041276c:	fee78fa3          	sb	a4,-1(a5)
80412770:	fed598e3          	bne	a1,a3,80412760 <memmove+0x38>
80412774:	00008067          	ret
80412778:	00008067          	ret

8041277c <memcpy>:
8041277c:	02060063          	beqz	a2,8041279c <memcpy+0x20>
80412780:	00c58633          	add	a2,a1,a2
80412784:	00050793          	mv	a5,a0
80412788:	00158593          	addi	a1,a1,1
8041278c:	fff5c703          	lbu	a4,-1(a1)
80412790:	00178793          	addi	a5,a5,1
80412794:	fee78fa3          	sb	a4,-1(a5)
80412798:	fec598e3          	bne	a1,a2,80412788 <memcpy+0xc>
8041279c:	00008067          	ret

804127a0 <__mulsi3>:
804127a0:	00050613          	mv	a2,a0
804127a4:	00000513          	li	a0,0
804127a8:	0015f693          	andi	a3,a1,1
804127ac:	00068463          	beqz	a3,804127b4 <__mulsi3+0x14>
804127b0:	00c50533          	add	a0,a0,a2
804127b4:	0015d593          	srli	a1,a1,0x1
804127b8:	00161613          	slli	a2,a2,0x1
804127bc:	fe0596e3          	bnez	a1,804127a8 <__mulsi3+0x8>
804127c0:	00008067          	ret

804127c4 <__divsi3>:
804127c4:	06054063          	bltz	a0,80412824 <__umodsi3+0x10>
804127c8:	0605c663          	bltz	a1,80412834 <__umodsi3+0x20>

804127cc <__udivsi3>:
804127cc:	00058613          	mv	a2,a1
804127d0:	00050593          	mv	a1,a0
804127d4:	fff00513          	li	a0,-1
804127d8:	02060c63          	beqz	a2,80412810 <__udivsi3+0x44>
804127dc:	00100693          	li	a3,1
804127e0:	00b67a63          	bgeu	a2,a1,804127f4 <__udivsi3+0x28>
804127e4:	00c05863          	blez	a2,804127f4 <__udivsi3+0x28>
804127e8:	00161613          	slli	a2,a2,0x1
804127ec:	00169693          	slli	a3,a3,0x1
804127f0:	feb66ae3          	bltu	a2,a1,804127e4 <__udivsi3+0x18>
804127f4:	00000513          	li	a0,0
804127f8:	00c5e663          	bltu	a1,a2,80412804 <__udivsi3+0x38>
804127fc:	40c585b3          	sub	a1,a1,a2
80412800:	00d56533          	or	a0,a0,a3
80412804:	0016d693          	srli	a3,a3,0x1
80412808:	00165613          	srli	a2,a2,0x1
8041280c:	fe0696e3          	bnez	a3,804127f8 <__udivsi3+0x2c>
80412810:	00008067          	ret

80412814 <__umodsi3>:
80412814:	00008293          	mv	t0,ra
80412818:	fb5ff0ef          	jal	ra,804127cc <__udivsi3>
8041281c:	00058513          	mv	a0,a1
80412820:	00028067          	jr	t0
80412824:	40a00533          	neg	a0,a0
80412828:	0005d863          	bgez	a1,80412838 <__umodsi3+0x24>
8041282c:	40b005b3          	neg	a1,a1
80412830:	f9dff06f          	j	804127cc <__udivsi3>
80412834:	40b005b3          	neg	a1,a1
80412838:	00008293          	mv	t0,ra
8041283c:	f91ff0ef          	jal	ra,804127cc <__udivsi3>
80412840:	40a00533          	neg	a0,a0
80412844:	00028067          	jr	t0

80412848 <__modsi3>:
80412848:	00008293          	mv	t0,ra
8041284c:	0005ca63          	bltz	a1,80412860 <__modsi3+0x18>
80412850:	00054c63          	bltz	a0,80412868 <__modsi3+0x20>
80412854:	f79ff0ef          	jal	ra,804127cc <__udivsi3>
80412858:	00058513          	mv	a0,a1
8041285c:	00028067          	jr	t0
80412860:	40b005b3          	neg	a1,a1
80412864:	fe0558e3          	bgez	a0,80412854 <__modsi3+0xc>
80412868:	40a00533          	neg	a0,a0
8041286c:	f61ff0ef          	jal	ra,804127cc <__udivsi3>
80412870:	40b00533          	neg	a0,a1
80412874:	00028067          	jr	t0
