
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
8040002c:	384130ef          	jal	ra,804133b0 <memset>
80400030:	04d000ef          	jal	ra,8040087c <cons_init>
80400034:	00013597          	auipc	a1,0x13
80400038:	4e858593          	addi	a1,a1,1256 # 8041351c <etext>
8040003c:	00013517          	auipc	a0,0x13
80400040:	4fc50513          	addi	a0,a0,1276 # 80413538 <etext+0x1c>
80400044:	1b8000ef          	jal	ra,804001fc <cprintf>
80400048:	294000ef          	jal	ra,804002dc <print_kerninfo>
8040004c:	2a1030ef          	jal	ra,80403aec <pmm_init>
80400050:	3e5000ef          	jal	ra,80400c34 <pic_init>
80400054:	5c9000ef          	jal	ra,80400e1c <idt_init>
80400058:	168050ef          	jal	ra,804051c0 <vmm_init>
8040005c:	4a40d0ef          	jal	ra,8040d500 <sched_init>
80400060:	6ac090ef          	jal	ra,8040970c <proc_init>
80400064:	171000ef          	jal	ra,804009d4 <ide_init>
80400068:	531030ef          	jal	ra,80403d98 <swap_init>
8040006c:	641060ef          	jal	ra,80406eac <fs_init>
80400070:	6e0000ef          	jal	ra,80400750 <clock_init>
80400074:	3b1000ef          	jal	ra,80400c24 <intr_enable>
80400078:	079090ef          	jal	ra,804098f0 <cpu_idle>

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
804000b0:	49450513          	addi	a0,a0,1172 # 80413540 <etext+0x24>
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
804001e8:	2e9120ef          	jal	ra,80412cd0 <vprintfmt>
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
80400248:	289120ef          	jal	ra,80412cd0 <vprintfmt>
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
80400294:	038130ef          	jal	ra,804132cc <strlen>
80400298:	00050413          	mv	s0,a0
8040029c:	00150513          	addi	a0,a0,1
804002a0:	560020ef          	jal	ra,80402800 <kmalloc>
804002a4:	00050493          	mv	s1,a0
804002a8:	00050c63          	beqz	a0,804002c0 <strdup+0x44>
804002ac:	00040613          	mv	a2,s0
804002b0:	00090593          	mv	a1,s2
804002b4:	00848433          	add	s0,s1,s0
804002b8:	168130ef          	jal	ra,80413420 <memcpy>
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
804002e4:	28c50513          	addi	a0,a0,652 # 8041356c <etext+0x50>
804002e8:	00112623          	sw	ra,12(sp)
804002ec:	f11ff0ef          	jal	ra,804001fc <cprintf>
804002f0:	00000597          	auipc	a1,0x0
804002f4:	d1c58593          	addi	a1,a1,-740 # 8040000c <kern_init>
804002f8:	00013517          	auipc	a0,0x13
804002fc:	29050513          	addi	a0,a0,656 # 80413588 <etext+0x6c>
80400300:	efdff0ef          	jal	ra,804001fc <cprintf>
80400304:	00013597          	auipc	a1,0x13
80400308:	21858593          	addi	a1,a1,536 # 8041351c <etext>
8040030c:	00013517          	auipc	a0,0x13
80400310:	29850513          	addi	a0,a0,664 # 804135a4 <etext+0x88>
80400314:	ee9ff0ef          	jal	ra,804001fc <cprintf>
80400318:	00099597          	auipc	a1,0x99
8040031c:	d3458593          	addi	a1,a1,-716 # 8049904c <edata>
80400320:	00013517          	auipc	a0,0x13
80400324:	2a050513          	addi	a0,a0,672 # 804135c0 <etext+0xa4>
80400328:	ed5ff0ef          	jal	ra,804001fc <cprintf>
8040032c:	0009c597          	auipc	a1,0x9c
80400330:	59458593          	addi	a1,a1,1428 # 8049c8c0 <end>
80400334:	00013517          	auipc	a0,0x13
80400338:	2a850513          	addi	a0,a0,680 # 804135dc <etext+0xc0>
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
80400368:	00013517          	auipc	a0,0x13
8040036c:	29050513          	addi	a0,a0,656 # 804135f8 <etext+0xdc>
80400370:	01010113          	addi	sp,sp,16
80400374:	e89ff06f          	j	804001fc <cprintf>

80400378 <print_stackframe>:
80400378:	ff010113          	addi	sp,sp,-16
8040037c:	00013617          	auipc	a2,0x13
80400380:	1c860613          	addi	a2,a2,456 # 80413544 <etext+0x28>
80400384:	05b00593          	li	a1,91
80400388:	00013517          	auipc	a0,0x13
8040038c:	1d050513          	addi	a0,a0,464 # 80413558 <etext+0x3c>
80400390:	00112623          	sw	ra,12(sp)
80400394:	290000ef          	jal	ra,80400624 <__panic>

80400398 <mon_help>:
80400398:	ff010113          	addi	sp,sp,-16
8040039c:	00013617          	auipc	a2,0x13
804003a0:	34060613          	addi	a2,a2,832 # 804136dc <commands+0xb8>
804003a4:	00013597          	auipc	a1,0x13
804003a8:	35858593          	addi	a1,a1,856 # 804136fc <commands+0xd8>
804003ac:	00013517          	auipc	a0,0x13
804003b0:	35850513          	addi	a0,a0,856 # 80413704 <commands+0xe0>
804003b4:	00112623          	sw	ra,12(sp)
804003b8:	e45ff0ef          	jal	ra,804001fc <cprintf>
804003bc:	00013617          	auipc	a2,0x13
804003c0:	35460613          	addi	a2,a2,852 # 80413710 <commands+0xec>
804003c4:	00013597          	auipc	a1,0x13
804003c8:	37458593          	addi	a1,a1,884 # 80413738 <commands+0x114>
804003cc:	00013517          	auipc	a0,0x13
804003d0:	33850513          	addi	a0,a0,824 # 80413704 <commands+0xe0>
804003d4:	e29ff0ef          	jal	ra,804001fc <cprintf>
804003d8:	00013617          	auipc	a2,0x13
804003dc:	36c60613          	addi	a2,a2,876 # 80413744 <commands+0x120>
804003e0:	00013597          	auipc	a1,0x13
804003e4:	38458593          	addi	a1,a1,900 # 80413764 <commands+0x140>
804003e8:	00013517          	auipc	a0,0x13
804003ec:	31c50513          	addi	a0,a0,796 # 80413704 <commands+0xe0>
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
8040044c:	20050513          	addi	a0,a0,512 # 80413648 <commands+0x24>
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
80400484:	1f050513          	addi	a0,a0,496 # 80413670 <commands+0x4c>
80400488:	d75ff0ef          	jal	ra,804001fc <cprintf>
8040048c:	000c0663          	beqz	s8,80400498 <kmonitor+0x5c>
80400490:	000c0513          	mv	a0,s8
80400494:	3c5000ef          	jal	ra,80401058 <print_trapframe>
80400498:	00000513          	li	a0,0
8040049c:	00000593          	li	a1,0
804004a0:	00000613          	li	a2,0
804004a4:	00800893          	li	a7,8
804004a8:	00000073          	ecall
804004ac:	00013c97          	auipc	s9,0x13
804004b0:	178c8c93          	addi	s9,s9,376 # 80413624 <commands>
804004b4:	00013997          	auipc	s3,0x13
804004b8:	1e498993          	addi	s3,s3,484 # 80413698 <commands+0x74>
804004bc:	00013917          	auipc	s2,0x13
804004c0:	1e090913          	addi	s2,s2,480 # 8041369c <commands+0x78>
804004c4:	00f00a13          	li	s4,15
804004c8:	00013b17          	auipc	s6,0x13
804004cc:	1dcb0b13          	addi	s6,s6,476 # 804136a4 <commands+0x80>
804004d0:	00013a97          	auipc	s5,0x13
804004d4:	22ca8a93          	addi	s5,s5,556 # 804136fc <commands+0xd8>
804004d8:	00300b93          	li	s7,3
804004dc:	00098513          	mv	a0,s3
804004e0:	b9dff0ef          	jal	ra,8040007c <readline>
804004e4:	00050413          	mv	s0,a0
804004e8:	fe050ae3          	beqz	a0,804004dc <kmonitor+0xa0>
804004ec:	00054583          	lbu	a1,0(a0)
804004f0:	00000493          	li	s1,0
804004f4:	02058063          	beqz	a1,80400514 <kmonitor+0xd8>
804004f8:	00090513          	mv	a0,s2
804004fc:	689120ef          	jal	ra,80413384 <strchr>
80400500:	0a050a63          	beqz	a0,804005b4 <kmonitor+0x178>
80400504:	00144583          	lbu	a1,1(s0)
80400508:	00040023          	sb	zero,0(s0)
8040050c:	00140413          	addi	s0,s0,1
80400510:	fe0594e3          	bnez	a1,804004f8 <kmonitor+0xbc>
80400514:	fc0484e3          	beqz	s1,804004dc <kmonitor+0xa0>
80400518:	00012583          	lw	a1,0(sp)
8040051c:	00013d17          	auipc	s10,0x13
80400520:	108d0d13          	addi	s10,s10,264 # 80413624 <commands>
80400524:	000a8513          	mv	a0,s5
80400528:	00000413          	li	s0,0
8040052c:	00cd0d13          	addi	s10,s10,12
80400530:	625120ef          	jal	ra,80413354 <strcmp>
80400534:	02050063          	beqz	a0,80400554 <kmonitor+0x118>
80400538:	00140413          	addi	s0,s0,1
8040053c:	0d740a63          	beq	s0,s7,80400610 <kmonitor+0x1d4>
80400540:	000d2503          	lw	a0,0(s10)
80400544:	00012583          	lw	a1,0(sp)
80400548:	00cd0d13          	addi	s10,s10,12
8040054c:	609120ef          	jal	ra,80413354 <strcmp>
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
804005f0:	595120ef          	jal	ra,80413384 <strchr>
804005f4:	fe0506e3          	beqz	a0,804005e0 <kmonitor+0x1a4>
804005f8:	00044583          	lbu	a1,0(s0)
804005fc:	ef9ff06f          	j	804004f4 <kmonitor+0xb8>
80400600:	01000593          	li	a1,16
80400604:	000b0513          	mv	a0,s6
80400608:	bf5ff0ef          	jal	ra,804001fc <cprintf>
8040060c:	fb5ff06f          	j	804005c0 <kmonitor+0x184>
80400610:	00012583          	lw	a1,0(sp)
80400614:	00013517          	auipc	a0,0x13
80400618:	0b050513          	addi	a0,a0,176 # 804136c4 <commands+0xa0>
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
80400670:	00013517          	auipc	a0,0x13
80400674:	10050513          	addi	a0,a0,256 # 80413770 <commands+0x14c>
80400678:	00f12623          	sw	a5,12(sp)
8040067c:	b81ff0ef          	jal	ra,804001fc <cprintf>
80400680:	00c12583          	lw	a1,12(sp)
80400684:	00040513          	mv	a0,s0
80400688:	b39ff0ef          	jal	ra,804001c0 <vcprintf>
8040068c:	00014517          	auipc	a0,0x14
80400690:	fc850513          	addi	a0,a0,-56 # 80414654 <default_pmm_manager+0x5f8>
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
804006c4:	00013517          	auipc	a0,0x13
804006c8:	0c850513          	addi	a0,a0,200 # 8041378c <commands+0x168>
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
804006f4:	00014517          	auipc	a0,0x14
804006f8:	f6050513          	addi	a0,a0,-160 # 80414654 <default_pmm_manager+0x5f8>
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
8040078c:	00013517          	auipc	a0,0x13
80400790:	02050513          	addi	a0,a0,32 # 804137ac <commands+0x188>
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
80400a48:	00013697          	auipc	a3,0x13
80400a4c:	d8068693          	addi	a3,a3,-640 # 804137c8 <commands+0x1a4>
80400a50:	00013617          	auipc	a2,0x13
80400a54:	d9060613          	addi	a2,a2,-624 # 804137e0 <commands+0x1bc>
80400a58:	01100593          	li	a1,17
80400a5c:	00013517          	auipc	a0,0x13
80400a60:	d9c50513          	addi	a0,a0,-612 # 804137f8 <commands+0x1d4>
80400a64:	bc1ff0ef          	jal	ra,80400624 <__panic>
80400a68:	00013697          	auipc	a3,0x13
80400a6c:	da468693          	addi	a3,a3,-604 # 8041380c <commands+0x1e8>
80400a70:	00013617          	auipc	a2,0x13
80400a74:	d7060613          	addi	a2,a2,-656 # 804137e0 <commands+0x1bc>
80400a78:	01400593          	li	a1,20
80400a7c:	00013517          	auipc	a0,0x13
80400a80:	d7c50513          	addi	a0,a0,-644 # 804137f8 <commands+0x1d4>
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
80400b4c:	00013697          	auipc	a3,0x13
80400b50:	cd868693          	addi	a3,a3,-808 # 80413824 <commands+0x200>
80400b54:	00013617          	auipc	a2,0x13
80400b58:	c8c60613          	addi	a2,a2,-884 # 804137e0 <commands+0x1bc>
80400b5c:	02200593          	li	a1,34
80400b60:	00013517          	auipc	a0,0x13
80400b64:	c9850513          	addi	a0,a0,-872 # 804137f8 <commands+0x1d4>
80400b68:	abdff0ef          	jal	ra,80400624 <__panic>
80400b6c:	00013697          	auipc	a3,0x13
80400b70:	ce068693          	addi	a3,a3,-800 # 8041384c <commands+0x228>
80400b74:	00013617          	auipc	a2,0x13
80400b78:	c6c60613          	addi	a2,a2,-916 # 804137e0 <commands+0x1bc>
80400b7c:	02300593          	li	a1,35
80400b80:	00013517          	auipc	a0,0x13
80400b84:	c7850513          	addi	a0,a0,-904 # 804137f8 <commands+0x1d4>
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
80400be4:	00013697          	auipc	a3,0x13
80400be8:	c4068693          	addi	a3,a3,-960 # 80413824 <commands+0x200>
80400bec:	00013617          	auipc	a2,0x13
80400bf0:	bf460613          	addi	a2,a2,-1036 # 804137e0 <commands+0x1bc>
80400bf4:	02900593          	li	a1,41
80400bf8:	00013517          	auipc	a0,0x13
80400bfc:	c0050513          	addi	a0,a0,-1024 # 804137f8 <commands+0x1d4>
80400c00:	a25ff0ef          	jal	ra,80400624 <__panic>
80400c04:	00013697          	auipc	a3,0x13
80400c08:	c4868693          	addi	a3,a3,-952 # 8041384c <commands+0x228>
80400c0c:	00013617          	auipc	a2,0x13
80400c10:	bd460613          	addi	a2,a2,-1068 # 804137e0 <commands+0x1bc>
80400c14:	02a00593          	li	a1,42
80400c18:	00013517          	auipc	a0,0x13
80400c1c:	be050513          	addi	a0,a0,-1056 # 804137f8 <commands+0x1d4>
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
80400c68:	7b8120ef          	jal	ra,80413420 <memcpy>
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
80400cac:	774120ef          	jal	ra,80413420 <memcpy>
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
80400cd8:	00013517          	auipc	a0,0x13
80400cdc:	bc850513          	addi	a0,a0,-1080 # 804138a0 <commands+0x27c>
80400ce0:	d1cff0ef          	jal	ra,804001fc <cprintf>
80400ce4:	00c12083          	lw	ra,12(sp)
80400ce8:	00100513          	li	a0,1
80400cec:	01010113          	addi	sp,sp,16
80400cf0:	00008067          	ret
80400cf4:	00013517          	auipc	a0,0x13
80400cf8:	b9450513          	addi	a0,a0,-1132 # 80413888 <commands+0x264>
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
80400d3c:	674120ef          	jal	ra,804133b0 <memset>
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
80400db0:	00013597          	auipc	a1,0x13
80400db4:	b4458593          	addi	a1,a1,-1212 # 804138f4 <commands+0x2d0>
80400db8:	580120ef          	jal	ra,80413338 <strcpy>
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
80400e04:	00013617          	auipc	a2,0x13
80400e08:	ac460613          	addi	a2,a2,-1340 # 804138c8 <commands+0x2a4>
80400e0c:	03200593          	li	a1,50
80400e10:	00013517          	auipc	a0,0x13
80400e14:	acc50513          	addi	a0,a0,-1332 # 804138dc <commands+0x2b8>
80400e18:	80dff0ef          	jal	ra,80400624 <__panic>

80400e1c <idt_init>:
80400e1c:	14005073          	csrwi	sscratch,0
80400e20:	00000797          	auipc	a5,0x0
80400e24:	68078793          	addi	a5,a5,1664 # 804014a0 <__alltraps>
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
80400e4c:	00013517          	auipc	a0,0x13
80400e50:	bcc50513          	addi	a0,a0,-1076 # 80413a18 <commands+0x3f4>
80400e54:	00112623          	sw	ra,12(sp)
80400e58:	ba4ff0ef          	jal	ra,804001fc <cprintf>
80400e5c:	00442583          	lw	a1,4(s0)
80400e60:	00013517          	auipc	a0,0x13
80400e64:	bcc50513          	addi	a0,a0,-1076 # 80413a2c <commands+0x408>
80400e68:	b94ff0ef          	jal	ra,804001fc <cprintf>
80400e6c:	00842583          	lw	a1,8(s0)
80400e70:	00013517          	auipc	a0,0x13
80400e74:	bd050513          	addi	a0,a0,-1072 # 80413a40 <commands+0x41c>
80400e78:	b84ff0ef          	jal	ra,804001fc <cprintf>
80400e7c:	00c42583          	lw	a1,12(s0)
80400e80:	00013517          	auipc	a0,0x13
80400e84:	bd450513          	addi	a0,a0,-1068 # 80413a54 <commands+0x430>
80400e88:	b74ff0ef          	jal	ra,804001fc <cprintf>
80400e8c:	01042583          	lw	a1,16(s0)
80400e90:	00013517          	auipc	a0,0x13
80400e94:	bd850513          	addi	a0,a0,-1064 # 80413a68 <commands+0x444>
80400e98:	b64ff0ef          	jal	ra,804001fc <cprintf>
80400e9c:	01442583          	lw	a1,20(s0)
80400ea0:	00013517          	auipc	a0,0x13
80400ea4:	bdc50513          	addi	a0,a0,-1060 # 80413a7c <commands+0x458>
80400ea8:	b54ff0ef          	jal	ra,804001fc <cprintf>
80400eac:	01842583          	lw	a1,24(s0)
80400eb0:	00013517          	auipc	a0,0x13
80400eb4:	be050513          	addi	a0,a0,-1056 # 80413a90 <commands+0x46c>
80400eb8:	b44ff0ef          	jal	ra,804001fc <cprintf>
80400ebc:	01c42583          	lw	a1,28(s0)
80400ec0:	00013517          	auipc	a0,0x13
80400ec4:	be450513          	addi	a0,a0,-1052 # 80413aa4 <commands+0x480>
80400ec8:	b34ff0ef          	jal	ra,804001fc <cprintf>
80400ecc:	02042583          	lw	a1,32(s0)
80400ed0:	00013517          	auipc	a0,0x13
80400ed4:	be850513          	addi	a0,a0,-1048 # 80413ab8 <commands+0x494>
80400ed8:	b24ff0ef          	jal	ra,804001fc <cprintf>
80400edc:	02442583          	lw	a1,36(s0)
80400ee0:	00013517          	auipc	a0,0x13
80400ee4:	bec50513          	addi	a0,a0,-1044 # 80413acc <commands+0x4a8>
80400ee8:	b14ff0ef          	jal	ra,804001fc <cprintf>
80400eec:	02842583          	lw	a1,40(s0)
80400ef0:	00013517          	auipc	a0,0x13
80400ef4:	bf050513          	addi	a0,a0,-1040 # 80413ae0 <commands+0x4bc>
80400ef8:	b04ff0ef          	jal	ra,804001fc <cprintf>
80400efc:	02c42583          	lw	a1,44(s0)
80400f00:	00013517          	auipc	a0,0x13
80400f04:	bf450513          	addi	a0,a0,-1036 # 80413af4 <commands+0x4d0>
80400f08:	af4ff0ef          	jal	ra,804001fc <cprintf>
80400f0c:	03042583          	lw	a1,48(s0)
80400f10:	00013517          	auipc	a0,0x13
80400f14:	bf850513          	addi	a0,a0,-1032 # 80413b08 <commands+0x4e4>
80400f18:	ae4ff0ef          	jal	ra,804001fc <cprintf>
80400f1c:	03442583          	lw	a1,52(s0)
80400f20:	00013517          	auipc	a0,0x13
80400f24:	bfc50513          	addi	a0,a0,-1028 # 80413b1c <commands+0x4f8>
80400f28:	ad4ff0ef          	jal	ra,804001fc <cprintf>
80400f2c:	03842583          	lw	a1,56(s0)
80400f30:	00013517          	auipc	a0,0x13
80400f34:	c0050513          	addi	a0,a0,-1024 # 80413b30 <commands+0x50c>
80400f38:	ac4ff0ef          	jal	ra,804001fc <cprintf>
80400f3c:	03c42583          	lw	a1,60(s0)
80400f40:	00013517          	auipc	a0,0x13
80400f44:	c0450513          	addi	a0,a0,-1020 # 80413b44 <commands+0x520>
80400f48:	ab4ff0ef          	jal	ra,804001fc <cprintf>
80400f4c:	04042583          	lw	a1,64(s0)
80400f50:	00013517          	auipc	a0,0x13
80400f54:	c0850513          	addi	a0,a0,-1016 # 80413b58 <commands+0x534>
80400f58:	aa4ff0ef          	jal	ra,804001fc <cprintf>
80400f5c:	04442583          	lw	a1,68(s0)
80400f60:	00013517          	auipc	a0,0x13
80400f64:	c0c50513          	addi	a0,a0,-1012 # 80413b6c <commands+0x548>
80400f68:	a94ff0ef          	jal	ra,804001fc <cprintf>
80400f6c:	04842583          	lw	a1,72(s0)
80400f70:	00013517          	auipc	a0,0x13
80400f74:	c1050513          	addi	a0,a0,-1008 # 80413b80 <commands+0x55c>
80400f78:	a84ff0ef          	jal	ra,804001fc <cprintf>
80400f7c:	04c42583          	lw	a1,76(s0)
80400f80:	00013517          	auipc	a0,0x13
80400f84:	c1450513          	addi	a0,a0,-1004 # 80413b94 <commands+0x570>
80400f88:	a74ff0ef          	jal	ra,804001fc <cprintf>
80400f8c:	05042583          	lw	a1,80(s0)
80400f90:	00013517          	auipc	a0,0x13
80400f94:	c1850513          	addi	a0,a0,-1000 # 80413ba8 <commands+0x584>
80400f98:	a64ff0ef          	jal	ra,804001fc <cprintf>
80400f9c:	05442583          	lw	a1,84(s0)
80400fa0:	00013517          	auipc	a0,0x13
80400fa4:	c1c50513          	addi	a0,a0,-996 # 80413bbc <commands+0x598>
80400fa8:	a54ff0ef          	jal	ra,804001fc <cprintf>
80400fac:	05842583          	lw	a1,88(s0)
80400fb0:	00013517          	auipc	a0,0x13
80400fb4:	c2050513          	addi	a0,a0,-992 # 80413bd0 <commands+0x5ac>
80400fb8:	a44ff0ef          	jal	ra,804001fc <cprintf>
80400fbc:	05c42583          	lw	a1,92(s0)
80400fc0:	00013517          	auipc	a0,0x13
80400fc4:	c2450513          	addi	a0,a0,-988 # 80413be4 <commands+0x5c0>
80400fc8:	a34ff0ef          	jal	ra,804001fc <cprintf>
80400fcc:	06042583          	lw	a1,96(s0)
80400fd0:	00013517          	auipc	a0,0x13
80400fd4:	c2850513          	addi	a0,a0,-984 # 80413bf8 <commands+0x5d4>
80400fd8:	a24ff0ef          	jal	ra,804001fc <cprintf>
80400fdc:	06442583          	lw	a1,100(s0)
80400fe0:	00013517          	auipc	a0,0x13
80400fe4:	c2c50513          	addi	a0,a0,-980 # 80413c0c <commands+0x5e8>
80400fe8:	a14ff0ef          	jal	ra,804001fc <cprintf>
80400fec:	06842583          	lw	a1,104(s0)
80400ff0:	00013517          	auipc	a0,0x13
80400ff4:	c3050513          	addi	a0,a0,-976 # 80413c20 <commands+0x5fc>
80400ff8:	a04ff0ef          	jal	ra,804001fc <cprintf>
80400ffc:	06c42583          	lw	a1,108(s0)
80401000:	00013517          	auipc	a0,0x13
80401004:	c3450513          	addi	a0,a0,-972 # 80413c34 <commands+0x610>
80401008:	9f4ff0ef          	jal	ra,804001fc <cprintf>
8040100c:	07042583          	lw	a1,112(s0)
80401010:	00013517          	auipc	a0,0x13
80401014:	c3850513          	addi	a0,a0,-968 # 80413c48 <commands+0x624>
80401018:	9e4ff0ef          	jal	ra,804001fc <cprintf>
8040101c:	07442583          	lw	a1,116(s0)
80401020:	00013517          	auipc	a0,0x13
80401024:	c3c50513          	addi	a0,a0,-964 # 80413c5c <commands+0x638>
80401028:	9d4ff0ef          	jal	ra,804001fc <cprintf>
8040102c:	07842583          	lw	a1,120(s0)
80401030:	00013517          	auipc	a0,0x13
80401034:	c4050513          	addi	a0,a0,-960 # 80413c70 <commands+0x64c>
80401038:	9c4ff0ef          	jal	ra,804001fc <cprintf>
8040103c:	07c42583          	lw	a1,124(s0)
80401040:	00812403          	lw	s0,8(sp)
80401044:	00c12083          	lw	ra,12(sp)
80401048:	00013517          	auipc	a0,0x13
8040104c:	c3c50513          	addi	a0,a0,-964 # 80413c84 <commands+0x660>
80401050:	01010113          	addi	sp,sp,16
80401054:	9a8ff06f          	j	804001fc <cprintf>

80401058 <print_trapframe>:
80401058:	ff010113          	addi	sp,sp,-16
8040105c:	00812423          	sw	s0,8(sp)
80401060:	00050593          	mv	a1,a0
80401064:	00050413          	mv	s0,a0
80401068:	00013517          	auipc	a0,0x13
8040106c:	c3050513          	addi	a0,a0,-976 # 80413c98 <commands+0x674>
80401070:	00112623          	sw	ra,12(sp)
80401074:	988ff0ef          	jal	ra,804001fc <cprintf>
80401078:	00040513          	mv	a0,s0
8040107c:	dc1ff0ef          	jal	ra,80400e3c <print_regs>
80401080:	08042583          	lw	a1,128(s0)
80401084:	00013517          	auipc	a0,0x13
80401088:	c2850513          	addi	a0,a0,-984 # 80413cac <commands+0x688>
8040108c:	970ff0ef          	jal	ra,804001fc <cprintf>
80401090:	08442583          	lw	a1,132(s0)
80401094:	00013517          	auipc	a0,0x13
80401098:	c2c50513          	addi	a0,a0,-980 # 80413cc0 <commands+0x69c>
8040109c:	960ff0ef          	jal	ra,804001fc <cprintf>
804010a0:	08842583          	lw	a1,136(s0)
804010a4:	00013517          	auipc	a0,0x13
804010a8:	c3050513          	addi	a0,a0,-976 # 80413cd4 <commands+0x6b0>
804010ac:	950ff0ef          	jal	ra,804001fc <cprintf>
804010b0:	08c42583          	lw	a1,140(s0)
804010b4:	00812403          	lw	s0,8(sp)
804010b8:	00c12083          	lw	ra,12(sp)
804010bc:	00013517          	auipc	a0,0x13
804010c0:	c2c50513          	addi	a0,a0,-980 # 80413ce8 <commands+0x6c4>
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
80401140:	6040406f          	j	80405744 <do_pgfault>
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
80401170:	5d40406f          	j	80405744 <do_pgfault>
80401174:	00013697          	auipc	a3,0x13
80401178:	84c68693          	addi	a3,a3,-1972 # 804139c0 <commands+0x39c>
8040117c:	00012617          	auipc	a2,0x12
80401180:	66460613          	addi	a2,a2,1636 # 804137e0 <commands+0x1bc>
80401184:	08c00593          	li	a1,140
80401188:	00013517          	auipc	a0,0x13
8040118c:	82450513          	addi	a0,a0,-2012 # 804139ac <commands+0x388>
80401190:	c94ff0ef          	jal	ra,80400624 <__panic>
80401194:	00012617          	auipc	a2,0x12
80401198:	7e860613          	addi	a2,a2,2024 # 8041397c <commands+0x358>
8040119c:	08700593          	li	a1,135
804011a0:	00013517          	auipc	a0,0x13
804011a4:	80c50513          	addi	a0,a0,-2036 # 804139ac <commands+0x388>
804011a8:	c7cff0ef          	jal	ra,80400624 <__panic>
804011ac:	eadff0ef          	jal	ra,80401058 <print_trapframe>
804011b0:	08842583          	lw	a1,136(s0)
804011b4:	00013517          	auipc	a0,0x13
804011b8:	82050513          	addi	a0,a0,-2016 # 804139d4 <commands+0x3b0>
804011bc:	840ff0ef          	jal	ra,804001fc <cprintf>
804011c0:	08c42583          	lw	a1,140(s0)
804011c4:	00d00793          	li	a5,13
804011c8:	02f58863          	beq	a1,a5,804011f8 <pgfault_handler+0x12c>
804011cc:	00f00793          	li	a5,15
804011d0:	02f58c63          	beq	a1,a5,80401208 <pgfault_handler+0x13c>
804011d4:	00013517          	auipc	a0,0x13
804011d8:	82450513          	addi	a0,a0,-2012 # 804139f8 <commands+0x3d4>
804011dc:	820ff0ef          	jal	ra,804001fc <cprintf>
804011e0:	00013617          	auipc	a2,0x13
804011e4:	82060613          	addi	a2,a2,-2016 # 80413a00 <commands+0x3dc>
804011e8:	09300593          	li	a1,147
804011ec:	00012517          	auipc	a0,0x12
804011f0:	7c050513          	addi	a0,a0,1984 # 804139ac <commands+0x388>
804011f4:	c30ff0ef          	jal	ra,80400624 <__panic>
804011f8:	00012517          	auipc	a0,0x12
804011fc:	7f850513          	addi	a0,a0,2040 # 804139f0 <commands+0x3cc>
80401200:	ffdfe0ef          	jal	ra,804001fc <cprintf>
80401204:	fddff06f          	j	804011e0 <pgfault_handler+0x114>
80401208:	00012517          	auipc	a0,0x12
8040120c:	7ec50513          	addi	a0,a0,2028 # 804139f4 <commands+0x3d0>
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
80401258:	7280c0ef          	jal	ra,8040d980 <run_timer_list>
8040125c:	dacff0ef          	jal	ra,80400808 <serial_intr>
80401260:	ea8ff0ef          	jal	ra,80400908 <cons_getc>
80401264:	00c12083          	lw	ra,12(sp)
80401268:	01010113          	addi	sp,sp,16
8040126c:	0f90e06f          	j	8040fb64 <dev_stdin_write>
80401270:	00c12083          	lw	ra,12(sp)
80401274:	01010113          	addi	sp,sp,16
80401278:	00008067          	ret

8040127c <exception_handler>:
8040127c:	08c52783          	lw	a5,140(a0)
80401280:	ff010113          	addi	sp,sp,-16
80401284:	00812423          	sw	s0,8(sp)
80401288:	00112623          	sw	ra,12(sp)
8040128c:	00d00713          	li	a4,13
80401290:	00050413          	mv	s0,a0
80401294:	06e78c63          	beq	a5,a4,8040130c <exception_handler+0x90>
80401298:	02f76663          	bltu	a4,a5,804012c4 <exception_handler+0x48>
8040129c:	ff878793          	addi	a5,a5,-8
804012a0:	00100713          	li	a4,1
804012a4:	06f76863          	bltu	a4,a5,80401314 <exception_handler+0x98>
804012a8:	08452783          	lw	a5,132(a0)
804012ac:	00812403          	lw	s0,8(sp)
804012b0:	00c12083          	lw	ra,12(sp)
804012b4:	00478793          	addi	a5,a5,4
804012b8:	08f52223          	sw	a5,132(a0)
804012bc:	01010113          	addi	sp,sp,16
804012c0:	1c50c06f          	j	8040dc84 <syscall>
804012c4:	00f00713          	li	a4,15
804012c8:	04e79663          	bne	a5,a4,80401314 <exception_handler+0x98>
804012cc:	e01ff0ef          	jal	ra,804010cc <pgfault_handler>
804012d0:	04050263          	beqz	a0,80401314 <exception_handler+0x98>
804012d4:	0009b797          	auipc	a5,0x9b
804012d8:	4dc78793          	addi	a5,a5,1244 # 8049c7b0 <current>
804012dc:	0007a783          	lw	a5,0(a5)
804012e0:	0a078663          	beqz	a5,8040138c <exception_handler+0x110>
804012e4:	08042783          	lw	a5,128(s0)
804012e8:	00050693          	mv	a3,a0
804012ec:	1007f793          	andi	a5,a5,256
804012f0:	06078663          	beqz	a5,8040135c <exception_handler+0xe0>
804012f4:	00012617          	auipc	a2,0x12
804012f8:	62c60613          	addi	a2,a2,1580 # 80413920 <commands+0x2fc>
804012fc:	0e700593          	li	a1,231
80401300:	00012517          	auipc	a0,0x12
80401304:	6ac50513          	addi	a0,a0,1708 # 804139ac <commands+0x388>
80401308:	b1cff0ef          	jal	ra,80400624 <__panic>
8040130c:	dc1ff0ef          	jal	ra,804010cc <pgfault_handler>
80401310:	00051a63          	bnez	a0,80401324 <exception_handler+0xa8>
80401314:	00c12083          	lw	ra,12(sp)
80401318:	00812403          	lw	s0,8(sp)
8040131c:	01010113          	addi	sp,sp,16
80401320:	00008067          	ret
80401324:	0009b797          	auipc	a5,0x9b
80401328:	48c78793          	addi	a5,a5,1164 # 8049c7b0 <current>
8040132c:	0007a783          	lw	a5,0(a5)
80401330:	06078c63          	beqz	a5,804013a8 <exception_handler+0x12c>
80401334:	08042783          	lw	a5,128(s0)
80401338:	00050693          	mv	a3,a0
8040133c:	1007f793          	andi	a5,a5,256
80401340:	02078a63          	beqz	a5,80401374 <exception_handler+0xf8>
80401344:	00012617          	auipc	a2,0x12
80401348:	5dc60613          	addi	a2,a2,1500 # 80413920 <commands+0x2fc>
8040134c:	0da00593          	li	a1,218
80401350:	00012517          	auipc	a0,0x12
80401354:	65c50513          	addi	a0,a0,1628 # 804139ac <commands+0x388>
80401358:	accff0ef          	jal	ra,80400624 <__panic>
8040135c:	00012617          	auipc	a2,0x12
80401360:	5f460613          	addi	a2,a2,1524 # 80413950 <commands+0x32c>
80401364:	0e900593          	li	a1,233
80401368:	00012517          	auipc	a0,0x12
8040136c:	64450513          	addi	a0,a0,1604 # 804139ac <commands+0x388>
80401370:	ab4ff0ef          	jal	ra,80400624 <__panic>
80401374:	00012617          	auipc	a2,0x12
80401378:	5dc60613          	addi	a2,a2,1500 # 80413950 <commands+0x32c>
8040137c:	0dc00593          	li	a1,220
80401380:	00012517          	auipc	a0,0x12
80401384:	62c50513          	addi	a0,a0,1580 # 804139ac <commands+0x388>
80401388:	a9cff0ef          	jal	ra,80400624 <__panic>
8040138c:	00050693          	mv	a3,a0
80401390:	00012617          	auipc	a2,0x12
80401394:	57060613          	addi	a2,a2,1392 # 80413900 <commands+0x2dc>
80401398:	0e400593          	li	a1,228
8040139c:	00012517          	auipc	a0,0x12
804013a0:	61050513          	addi	a0,a0,1552 # 804139ac <commands+0x388>
804013a4:	a80ff0ef          	jal	ra,80400624 <__panic>
804013a8:	00050693          	mv	a3,a0
804013ac:	00012617          	auipc	a2,0x12
804013b0:	55460613          	addi	a2,a2,1364 # 80413900 <commands+0x2dc>
804013b4:	0d700593          	li	a1,215
804013b8:	00012517          	auipc	a0,0x12
804013bc:	5f450513          	addi	a0,a0,1524 # 804139ac <commands+0x388>
804013c0:	a64ff0ef          	jal	ra,80400624 <__panic>

804013c4 <trap>:
804013c4:	ff010113          	addi	sp,sp,-16
804013c8:	00812423          	sw	s0,8(sp)
804013cc:	0009b417          	auipc	s0,0x9b
804013d0:	3e440413          	addi	s0,s0,996 # 8049c7b0 <current>
804013d4:	00042703          	lw	a4,0(s0)
804013d8:	00112623          	sw	ra,12(sp)
804013dc:	00912223          	sw	s1,4(sp)
804013e0:	01212023          	sw	s2,0(sp)
804013e4:	08c52683          	lw	a3,140(a0)
804013e8:	04070e63          	beqz	a4,80401444 <trap+0x80>
804013ec:	08052483          	lw	s1,128(a0)
804013f0:	05472903          	lw	s2,84(a4)
804013f4:	04a72a23          	sw	a0,84(a4)
804013f8:	1004f493          	andi	s1,s1,256
804013fc:	0406c063          	bltz	a3,8040143c <trap+0x78>
80401400:	e7dff0ef          	jal	ra,8040127c <exception_handler>
80401404:	00042783          	lw	a5,0(s0)
80401408:	0527aa23          	sw	s2,84(a5)
8040140c:	00049c63          	bnez	s1,80401424 <trap+0x60>
80401410:	05c7a703          	lw	a4,92(a5)
80401414:	00177713          	andi	a4,a4,1
80401418:	06071c63          	bnez	a4,80401490 <trap+0xcc>
8040141c:	0107a783          	lw	a5,16(a5)
80401420:	04079c63          	bnez	a5,80401478 <trap+0xb4>
80401424:	00c12083          	lw	ra,12(sp)
80401428:	00812403          	lw	s0,8(sp)
8040142c:	00412483          	lw	s1,4(sp)
80401430:	00012903          	lw	s2,0(sp)
80401434:	01010113          	addi	sp,sp,16
80401438:	00008067          	ret
8040143c:	dddff0ef          	jal	ra,80401218 <interrupt_handler>
80401440:	fc5ff06f          	j	80401404 <trap+0x40>
80401444:	0006ce63          	bltz	a3,80401460 <trap+0x9c>
80401448:	00812403          	lw	s0,8(sp)
8040144c:	00c12083          	lw	ra,12(sp)
80401450:	00412483          	lw	s1,4(sp)
80401454:	00012903          	lw	s2,0(sp)
80401458:	01010113          	addi	sp,sp,16
8040145c:	e21ff06f          	j	8040127c <exception_handler>
80401460:	00812403          	lw	s0,8(sp)
80401464:	00c12083          	lw	ra,12(sp)
80401468:	00412483          	lw	s1,4(sp)
8040146c:	00012903          	lw	s2,0(sp)
80401470:	01010113          	addi	sp,sp,16
80401474:	da5ff06f          	j	80401218 <interrupt_handler>
80401478:	00812403          	lw	s0,8(sp)
8040147c:	00c12083          	lw	ra,12(sp)
80401480:	00412483          	lw	s1,4(sp)
80401484:	00012903          	lw	s2,0(sp)
80401488:	01010113          	addi	sp,sp,16
8040148c:	1e40c06f          	j	8040d670 <schedule>
80401490:	ff700513          	li	a0,-9
80401494:	16c070ef          	jal	ra,80408600 <do_exit>
80401498:	00042783          	lw	a5,0(s0)
8040149c:	f81ff06f          	j	8040141c <trap+0x58>

804014a0 <__alltraps>:
804014a0:	14011173          	csrrw	sp,sscratch,sp
804014a4:	00011463          	bnez	sp,804014ac <__alltraps+0xc>
804014a8:	14011173          	csrrw	sp,sscratch,sp
804014ac:	f7010113          	addi	sp,sp,-144
804014b0:	00012023          	sw	zero,0(sp)
804014b4:	00112223          	sw	ra,4(sp)
804014b8:	00312623          	sw	gp,12(sp)
804014bc:	00412823          	sw	tp,16(sp)
804014c0:	00512a23          	sw	t0,20(sp)
804014c4:	00612c23          	sw	t1,24(sp)
804014c8:	00712e23          	sw	t2,28(sp)
804014cc:	02812023          	sw	s0,32(sp)
804014d0:	02912223          	sw	s1,36(sp)
804014d4:	02a12423          	sw	a0,40(sp)
804014d8:	02b12623          	sw	a1,44(sp)
804014dc:	02c12823          	sw	a2,48(sp)
804014e0:	02d12a23          	sw	a3,52(sp)
804014e4:	02e12c23          	sw	a4,56(sp)
804014e8:	02f12e23          	sw	a5,60(sp)
804014ec:	05012023          	sw	a6,64(sp)
804014f0:	05112223          	sw	a7,68(sp)
804014f4:	05212423          	sw	s2,72(sp)
804014f8:	05312623          	sw	s3,76(sp)
804014fc:	05412823          	sw	s4,80(sp)
80401500:	05512a23          	sw	s5,84(sp)
80401504:	05612c23          	sw	s6,88(sp)
80401508:	05712e23          	sw	s7,92(sp)
8040150c:	07812023          	sw	s8,96(sp)
80401510:	07912223          	sw	s9,100(sp)
80401514:	07a12423          	sw	s10,104(sp)
80401518:	07b12623          	sw	s11,108(sp)
8040151c:	07c12823          	sw	t3,112(sp)
80401520:	07d12a23          	sw	t4,116(sp)
80401524:	07e12c23          	sw	t5,120(sp)
80401528:	07f12e23          	sw	t6,124(sp)
8040152c:	14002473          	csrr	s0,sscratch
80401530:	100024f3          	csrr	s1,sstatus
80401534:	14102973          	csrr	s2,sepc
80401538:	143029f3          	csrr	s3,stval
8040153c:	14202a73          	csrr	s4,scause
80401540:	1004fa93          	andi	s5,s1,256
80401544:	000a9663          	bnez	s5,80401550 <__alltraps+0xb0>
80401548:	00812423          	sw	s0,8(sp)
8040154c:	00c0006f          	j	80401558 <__alltraps+0xb8>
80401550:	09010a93          	addi	s5,sp,144
80401554:	01512423          	sw	s5,8(sp)
80401558:	14001073          	csrw	sscratch,zero
8040155c:	08912023          	sw	s1,128(sp)
80401560:	09212223          	sw	s2,132(sp)
80401564:	09312423          	sw	s3,136(sp)
80401568:	09412623          	sw	s4,140(sp)
8040156c:	00010513          	mv	a0,sp
80401570:	e55ff0ef          	jal	ra,804013c4 <trap>

80401574 <__trapret>:
80401574:	08012483          	lw	s1,128(sp)
80401578:	08412903          	lw	s2,132(sp)
8040157c:	1004f413          	andi	s0,s1,256
80401580:	00040463          	beqz	s0,80401588 <__trapret+0x14>
80401584:	0180006f          	j	8040159c <__trapret+0x28>
80401588:	09010413          	addi	s0,sp,144
8040158c:	14041073          	csrw	sscratch,s0
80401590:	0000100f          	fence.i
80401594:	12000073          	sfence.vma
80401598:	0000100f          	fence.i
8040159c:	10049073          	csrw	sstatus,s1
804015a0:	14191073          	csrw	sepc,s2
804015a4:	00412083          	lw	ra,4(sp)
804015a8:	00c12183          	lw	gp,12(sp)
804015ac:	01012203          	lw	tp,16(sp)
804015b0:	01412283          	lw	t0,20(sp)
804015b4:	01812303          	lw	t1,24(sp)
804015b8:	01c12383          	lw	t2,28(sp)
804015bc:	02012403          	lw	s0,32(sp)
804015c0:	02412483          	lw	s1,36(sp)
804015c4:	02812503          	lw	a0,40(sp)
804015c8:	02c12583          	lw	a1,44(sp)
804015cc:	03012603          	lw	a2,48(sp)
804015d0:	03412683          	lw	a3,52(sp)
804015d4:	03812703          	lw	a4,56(sp)
804015d8:	03c12783          	lw	a5,60(sp)
804015dc:	04012803          	lw	a6,64(sp)
804015e0:	04412883          	lw	a7,68(sp)
804015e4:	04812903          	lw	s2,72(sp)
804015e8:	04c12983          	lw	s3,76(sp)
804015ec:	05012a03          	lw	s4,80(sp)
804015f0:	05412a83          	lw	s5,84(sp)
804015f4:	05812b03          	lw	s6,88(sp)
804015f8:	05c12b83          	lw	s7,92(sp)
804015fc:	06012c03          	lw	s8,96(sp)
80401600:	06412c83          	lw	s9,100(sp)
80401604:	06812d03          	lw	s10,104(sp)
80401608:	06c12d83          	lw	s11,108(sp)
8040160c:	07012e03          	lw	t3,112(sp)
80401610:	07412e83          	lw	t4,116(sp)
80401614:	07812f03          	lw	t5,120(sp)
80401618:	07c12f83          	lw	t6,124(sp)
8040161c:	00812103          	lw	sp,8(sp)
80401620:	10200073          	sret

80401624 <forkrets>:
80401624:	00050113          	mv	sp,a0
80401628:	f4dff06f          	j	80401574 <__trapret>

8040162c <sret_test_ok>:
8040162c:	00100893          	li	a7,1
80401630:	05300513          	li	a0,83
80401634:	00000073          	ecall
80401638:	05200513          	li	a0,82
8040163c:	00000073          	ecall
80401640:	04500513          	li	a0,69
80401644:	00000073          	ecall
80401648:	05400513          	li	a0,84
8040164c:	00000073          	ecall
80401650:	05f00513          	li	a0,95
80401654:	00000073          	ecall
80401658:	04f00513          	li	a0,79
8040165c:	00000073          	ecall
80401660:	04b00513          	li	a0,75
80401664:	00000073          	ecall
80401668:	00a00513          	li	a0,10
8040166c:	00000073          	ecall
80401670:	0000006f          	j	80401670 <sret_test_ok+0x44>

80401674 <default_init>:
80401674:	0009b797          	auipc	a5,0x9b
80401678:	18078793          	addi	a5,a5,384 # 8049c7f4 <free_area>
8040167c:	00f7a223          	sw	a5,4(a5)
80401680:	00f7a023          	sw	a5,0(a5)
80401684:	0007a423          	sw	zero,8(a5)
80401688:	00008067          	ret

8040168c <default_nr_free_pages>:
8040168c:	0009b797          	auipc	a5,0x9b
80401690:	16878793          	addi	a5,a5,360 # 8049c7f4 <free_area>
80401694:	0087a503          	lw	a0,8(a5)
80401698:	00008067          	ret

8040169c <default_check>:
8040169c:	fd010113          	addi	sp,sp,-48
804016a0:	03212023          	sw	s2,32(sp)
804016a4:	0009b917          	auipc	s2,0x9b
804016a8:	15090913          	addi	s2,s2,336 # 8049c7f4 <free_area>
804016ac:	00492783          	lw	a5,4(s2)
804016b0:	02112623          	sw	ra,44(sp)
804016b4:	02812423          	sw	s0,40(sp)
804016b8:	02912223          	sw	s1,36(sp)
804016bc:	01312e23          	sw	s3,28(sp)
804016c0:	01412c23          	sw	s4,24(sp)
804016c4:	01512a23          	sw	s5,20(sp)
804016c8:	01612823          	sw	s6,16(sp)
804016cc:	01712623          	sw	s7,12(sp)
804016d0:	01812423          	sw	s8,8(sp)
804016d4:	3d278e63          	beq	a5,s2,80401ab0 <default_check+0x414>
804016d8:	ff87a703          	lw	a4,-8(a5)
804016dc:	00175713          	srli	a4,a4,0x1
804016e0:	00177713          	andi	a4,a4,1
804016e4:	3c070e63          	beqz	a4,80401ac0 <default_check+0x424>
804016e8:	00000413          	li	s0,0
804016ec:	00000493          	li	s1,0
804016f0:	0100006f          	j	80401700 <default_check+0x64>
804016f4:	ff87a703          	lw	a4,-8(a5)
804016f8:	00277713          	andi	a4,a4,2
804016fc:	3c070263          	beqz	a4,80401ac0 <default_check+0x424>
80401700:	ffc7a703          	lw	a4,-4(a5)
80401704:	0047a783          	lw	a5,4(a5)
80401708:	00148493          	addi	s1,s1,1
8040170c:	00e40433          	add	s0,s0,a4
80401710:	00040993          	mv	s3,s0
80401714:	ff2790e3          	bne	a5,s2,804016f4 <default_check+0x58>
80401718:	59c010ef          	jal	ra,80402cb4 <nr_free_pages>
8040171c:	013512e3          	bne	a0,s3,80401f20 <default_check+0x884>
80401720:	00100513          	li	a0,1
80401724:	45c010ef          	jal	ra,80402b80 <alloc_pages>
80401728:	00050a13          	mv	s4,a0
8040172c:	52050a63          	beqz	a0,80401c60 <default_check+0x5c4>
80401730:	00100513          	li	a0,1
80401734:	44c010ef          	jal	ra,80402b80 <alloc_pages>
80401738:	00050993          	mv	s3,a0
8040173c:	000502e3          	beqz	a0,80401f40 <default_check+0x8a4>
80401740:	00100513          	li	a0,1
80401744:	43c010ef          	jal	ra,80402b80 <alloc_pages>
80401748:	00050a93          	mv	s5,a0
8040174c:	58050a63          	beqz	a0,80401ce0 <default_check+0x644>
80401750:	393a0863          	beq	s4,s3,80401ae0 <default_check+0x444>
80401754:	38aa0663          	beq	s4,a0,80401ae0 <default_check+0x444>
80401758:	38a98463          	beq	s3,a0,80401ae0 <default_check+0x444>
8040175c:	000a2783          	lw	a5,0(s4)
80401760:	3a079063          	bnez	a5,80401b00 <default_check+0x464>
80401764:	0009a783          	lw	a5,0(s3)
80401768:	38079c63          	bnez	a5,80401b00 <default_check+0x464>
8040176c:	00052783          	lw	a5,0(a0)
80401770:	38079863          	bnez	a5,80401b00 <default_check+0x464>
80401774:	0009b797          	auipc	a5,0x9b
80401778:	09878793          	addi	a5,a5,152 # 8049c80c <pages>
8040177c:	0007a783          	lw	a5,0(a5)
80401780:	00015717          	auipc	a4,0x15
80401784:	6e070713          	addi	a4,a4,1760 # 80416e60 <nbase>
80401788:	00072603          	lw	a2,0(a4)
8040178c:	0009b717          	auipc	a4,0x9b
80401790:	01070713          	addi	a4,a4,16 # 8049c79c <npage>
80401794:	00072683          	lw	a3,0(a4)
80401798:	40fa0733          	sub	a4,s4,a5
8040179c:	40575713          	srai	a4,a4,0x5
804017a0:	00c70733          	add	a4,a4,a2
804017a4:	00c69693          	slli	a3,a3,0xc
804017a8:	00c71713          	slli	a4,a4,0xc
804017ac:	36d77a63          	bgeu	a4,a3,80401b20 <default_check+0x484>
804017b0:	40f98733          	sub	a4,s3,a5
804017b4:	40575713          	srai	a4,a4,0x5
804017b8:	00c70733          	add	a4,a4,a2
804017bc:	00c71713          	slli	a4,a4,0xc
804017c0:	5ad77063          	bgeu	a4,a3,80401d60 <default_check+0x6c4>
804017c4:	40f507b3          	sub	a5,a0,a5
804017c8:	4057d793          	srai	a5,a5,0x5
804017cc:	00c787b3          	add	a5,a5,a2
804017d0:	00c79793          	slli	a5,a5,0xc
804017d4:	3ed7f663          	bgeu	a5,a3,80401bc0 <default_check+0x524>
804017d8:	00100513          	li	a0,1
804017dc:	00092c03          	lw	s8,0(s2)
804017e0:	00492b83          	lw	s7,4(s2)
804017e4:	00892b03          	lw	s6,8(s2)
804017e8:	0009b797          	auipc	a5,0x9b
804017ec:	0127a823          	sw	s2,16(a5) # 8049c7f8 <free_area+0x4>
804017f0:	0009b797          	auipc	a5,0x9b
804017f4:	0127a223          	sw	s2,4(a5) # 8049c7f4 <free_area>
804017f8:	0009b797          	auipc	a5,0x9b
804017fc:	0007a223          	sw	zero,4(a5) # 8049c7fc <free_area+0x8>
80401800:	380010ef          	jal	ra,80402b80 <alloc_pages>
80401804:	38051e63          	bnez	a0,80401ba0 <default_check+0x504>
80401808:	00100593          	li	a1,1
8040180c:	000a0513          	mv	a0,s4
80401810:	438010ef          	jal	ra,80402c48 <free_pages>
80401814:	00100593          	li	a1,1
80401818:	00098513          	mv	a0,s3
8040181c:	42c010ef          	jal	ra,80402c48 <free_pages>
80401820:	00100593          	li	a1,1
80401824:	000a8513          	mv	a0,s5
80401828:	420010ef          	jal	ra,80402c48 <free_pages>
8040182c:	00892703          	lw	a4,8(s2)
80401830:	00300793          	li	a5,3
80401834:	34f71663          	bne	a4,a5,80401b80 <default_check+0x4e4>
80401838:	00100513          	li	a0,1
8040183c:	344010ef          	jal	ra,80402b80 <alloc_pages>
80401840:	00050993          	mv	s3,a0
80401844:	30050e63          	beqz	a0,80401b60 <default_check+0x4c4>
80401848:	00100513          	li	a0,1
8040184c:	334010ef          	jal	ra,80402b80 <alloc_pages>
80401850:	00050a93          	mv	s5,a0
80401854:	46050663          	beqz	a0,80401cc0 <default_check+0x624>
80401858:	00100513          	li	a0,1
8040185c:	324010ef          	jal	ra,80402b80 <alloc_pages>
80401860:	00050a13          	mv	s4,a0
80401864:	42050e63          	beqz	a0,80401ca0 <default_check+0x604>
80401868:	00100513          	li	a0,1
8040186c:	314010ef          	jal	ra,80402b80 <alloc_pages>
80401870:	40051863          	bnez	a0,80401c80 <default_check+0x5e4>
80401874:	00100593          	li	a1,1
80401878:	00098513          	mv	a0,s3
8040187c:	3cc010ef          	jal	ra,80402c48 <free_pages>
80401880:	00492783          	lw	a5,4(s2)
80401884:	2b278e63          	beq	a5,s2,80401b40 <default_check+0x4a4>
80401888:	00100513          	li	a0,1
8040188c:	2f4010ef          	jal	ra,80402b80 <alloc_pages>
80401890:	3aa99863          	bne	s3,a0,80401c40 <default_check+0x5a4>
80401894:	00100513          	li	a0,1
80401898:	2e8010ef          	jal	ra,80402b80 <alloc_pages>
8040189c:	38051263          	bnez	a0,80401c20 <default_check+0x584>
804018a0:	00892783          	lw	a5,8(s2)
804018a4:	34079e63          	bnez	a5,80401c00 <default_check+0x564>
804018a8:	00098513          	mv	a0,s3
804018ac:	00100593          	li	a1,1
804018b0:	0009b797          	auipc	a5,0x9b
804018b4:	f587a223          	sw	s8,-188(a5) # 8049c7f4 <free_area>
804018b8:	0009b797          	auipc	a5,0x9b
804018bc:	f577a023          	sw	s7,-192(a5) # 8049c7f8 <free_area+0x4>
804018c0:	0009b797          	auipc	a5,0x9b
804018c4:	f367ae23          	sw	s6,-196(a5) # 8049c7fc <free_area+0x8>
804018c8:	380010ef          	jal	ra,80402c48 <free_pages>
804018cc:	00100593          	li	a1,1
804018d0:	000a8513          	mv	a0,s5
804018d4:	374010ef          	jal	ra,80402c48 <free_pages>
804018d8:	00100593          	li	a1,1
804018dc:	000a0513          	mv	a0,s4
804018e0:	368010ef          	jal	ra,80402c48 <free_pages>
804018e4:	00500513          	li	a0,5
804018e8:	298010ef          	jal	ra,80402b80 <alloc_pages>
804018ec:	00050993          	mv	s3,a0
804018f0:	2e050863          	beqz	a0,80401be0 <default_check+0x544>
804018f4:	00452783          	lw	a5,4(a0)
804018f8:	0017d793          	srli	a5,a5,0x1
804018fc:	0017f793          	andi	a5,a5,1
80401900:	5c079063          	bnez	a5,80401ec0 <default_check+0x824>
80401904:	00100513          	li	a0,1
80401908:	00092b03          	lw	s6,0(s2)
8040190c:	00492a83          	lw	s5,4(s2)
80401910:	0009b797          	auipc	a5,0x9b
80401914:	ef27a223          	sw	s2,-284(a5) # 8049c7f4 <free_area>
80401918:	0009b797          	auipc	a5,0x9b
8040191c:	ef27a023          	sw	s2,-288(a5) # 8049c7f8 <free_area+0x4>
80401920:	260010ef          	jal	ra,80402b80 <alloc_pages>
80401924:	56051e63          	bnez	a0,80401ea0 <default_check+0x804>
80401928:	04098a13          	addi	s4,s3,64
8040192c:	000a0513          	mv	a0,s4
80401930:	00300593          	li	a1,3
80401934:	00892b83          	lw	s7,8(s2)
80401938:	0009b797          	auipc	a5,0x9b
8040193c:	ec07a223          	sw	zero,-316(a5) # 8049c7fc <free_area+0x8>
80401940:	308010ef          	jal	ra,80402c48 <free_pages>
80401944:	00400513          	li	a0,4
80401948:	238010ef          	jal	ra,80402b80 <alloc_pages>
8040194c:	52051a63          	bnez	a0,80401e80 <default_check+0x7e4>
80401950:	0449a783          	lw	a5,68(s3)
80401954:	0017d793          	srli	a5,a5,0x1
80401958:	0017f793          	andi	a5,a5,1
8040195c:	50078263          	beqz	a5,80401e60 <default_check+0x7c4>
80401960:	0489a703          	lw	a4,72(s3)
80401964:	00300793          	li	a5,3
80401968:	4ef71c63          	bne	a4,a5,80401e60 <default_check+0x7c4>
8040196c:	00300513          	li	a0,3
80401970:	210010ef          	jal	ra,80402b80 <alloc_pages>
80401974:	00050c13          	mv	s8,a0
80401978:	4c050463          	beqz	a0,80401e40 <default_check+0x7a4>
8040197c:	00100513          	li	a0,1
80401980:	200010ef          	jal	ra,80402b80 <alloc_pages>
80401984:	48051e63          	bnez	a0,80401e20 <default_check+0x784>
80401988:	478a1c63          	bne	s4,s8,80401e00 <default_check+0x764>
8040198c:	00100593          	li	a1,1
80401990:	00098513          	mv	a0,s3
80401994:	2b4010ef          	jal	ra,80402c48 <free_pages>
80401998:	00300593          	li	a1,3
8040199c:	000a0513          	mv	a0,s4
804019a0:	2a8010ef          	jal	ra,80402c48 <free_pages>
804019a4:	0049a783          	lw	a5,4(s3)
804019a8:	02098c13          	addi	s8,s3,32
804019ac:	0017d793          	srli	a5,a5,0x1
804019b0:	0017f793          	andi	a5,a5,1
804019b4:	42078663          	beqz	a5,80401de0 <default_check+0x744>
804019b8:	0089a703          	lw	a4,8(s3)
804019bc:	00100793          	li	a5,1
804019c0:	42f71063          	bne	a4,a5,80401de0 <default_check+0x744>
804019c4:	004a2783          	lw	a5,4(s4)
804019c8:	0017d793          	srli	a5,a5,0x1
804019cc:	0017f793          	andi	a5,a5,1
804019d0:	3e078863          	beqz	a5,80401dc0 <default_check+0x724>
804019d4:	008a2703          	lw	a4,8(s4)
804019d8:	00300793          	li	a5,3
804019dc:	3ef71263          	bne	a4,a5,80401dc0 <default_check+0x724>
804019e0:	00100513          	li	a0,1
804019e4:	19c010ef          	jal	ra,80402b80 <alloc_pages>
804019e8:	3aa99c63          	bne	s3,a0,80401da0 <default_check+0x704>
804019ec:	00100593          	li	a1,1
804019f0:	258010ef          	jal	ra,80402c48 <free_pages>
804019f4:	00200513          	li	a0,2
804019f8:	188010ef          	jal	ra,80402b80 <alloc_pages>
804019fc:	38aa1263          	bne	s4,a0,80401d80 <default_check+0x6e4>
80401a00:	00200593          	li	a1,2
80401a04:	244010ef          	jal	ra,80402c48 <free_pages>
80401a08:	00100593          	li	a1,1
80401a0c:	000c0513          	mv	a0,s8
80401a10:	238010ef          	jal	ra,80402c48 <free_pages>
80401a14:	00500513          	li	a0,5
80401a18:	168010ef          	jal	ra,80402b80 <alloc_pages>
80401a1c:	00050993          	mv	s3,a0
80401a20:	4c050063          	beqz	a0,80401ee0 <default_check+0x844>
80401a24:	00100513          	li	a0,1
80401a28:	158010ef          	jal	ra,80402b80 <alloc_pages>
80401a2c:	30051a63          	bnez	a0,80401d40 <default_check+0x6a4>
80401a30:	00892783          	lw	a5,8(s2)
80401a34:	2e079663          	bnez	a5,80401d20 <default_check+0x684>
80401a38:	00500593          	li	a1,5
80401a3c:	00098513          	mv	a0,s3
80401a40:	0009b797          	auipc	a5,0x9b
80401a44:	db77ae23          	sw	s7,-580(a5) # 8049c7fc <free_area+0x8>
80401a48:	0009b797          	auipc	a5,0x9b
80401a4c:	db67a623          	sw	s6,-596(a5) # 8049c7f4 <free_area>
80401a50:	0009b797          	auipc	a5,0x9b
80401a54:	db57a423          	sw	s5,-600(a5) # 8049c7f8 <free_area+0x4>
80401a58:	1f0010ef          	jal	ra,80402c48 <free_pages>
80401a5c:	00492783          	lw	a5,4(s2)
80401a60:	01278c63          	beq	a5,s2,80401a78 <default_check+0x3dc>
80401a64:	ffc7a703          	lw	a4,-4(a5)
80401a68:	0047a783          	lw	a5,4(a5)
80401a6c:	fff48493          	addi	s1,s1,-1
80401a70:	40e40433          	sub	s0,s0,a4
80401a74:	ff2798e3          	bne	a5,s2,80401a64 <default_check+0x3c8>
80401a78:	28049463          	bnez	s1,80401d00 <default_check+0x664>
80401a7c:	48041263          	bnez	s0,80401f00 <default_check+0x864>
80401a80:	02c12083          	lw	ra,44(sp)
80401a84:	02812403          	lw	s0,40(sp)
80401a88:	02412483          	lw	s1,36(sp)
80401a8c:	02012903          	lw	s2,32(sp)
80401a90:	01c12983          	lw	s3,28(sp)
80401a94:	01812a03          	lw	s4,24(sp)
80401a98:	01412a83          	lw	s5,20(sp)
80401a9c:	01012b03          	lw	s6,16(sp)
80401aa0:	00c12b83          	lw	s7,12(sp)
80401aa4:	00812c03          	lw	s8,8(sp)
80401aa8:	03010113          	addi	sp,sp,48
80401aac:	00008067          	ret
80401ab0:	00000993          	li	s3,0
80401ab4:	00000413          	li	s0,0
80401ab8:	00000493          	li	s1,0
80401abc:	c5dff06f          	j	80401718 <default_check+0x7c>
80401ac0:	00012697          	auipc	a3,0x12
80401ac4:	23c68693          	addi	a3,a3,572 # 80413cfc <commands+0x6d8>
80401ac8:	00012617          	auipc	a2,0x12
80401acc:	d1860613          	addi	a2,a2,-744 # 804137e0 <commands+0x1bc>
80401ad0:	0f000593          	li	a1,240
80401ad4:	00012517          	auipc	a0,0x12
80401ad8:	23850513          	addi	a0,a0,568 # 80413d0c <commands+0x6e8>
80401adc:	b49fe0ef          	jal	ra,80400624 <__panic>
80401ae0:	00012697          	auipc	a3,0x12
80401ae4:	2b468693          	addi	a3,a3,692 # 80413d94 <commands+0x770>
80401ae8:	00012617          	auipc	a2,0x12
80401aec:	cf860613          	addi	a2,a2,-776 # 804137e0 <commands+0x1bc>
80401af0:	0bd00593          	li	a1,189
80401af4:	00012517          	auipc	a0,0x12
80401af8:	21850513          	addi	a0,a0,536 # 80413d0c <commands+0x6e8>
80401afc:	b29fe0ef          	jal	ra,80400624 <__panic>
80401b00:	00012697          	auipc	a3,0x12
80401b04:	2b868693          	addi	a3,a3,696 # 80413db8 <commands+0x794>
80401b08:	00012617          	auipc	a2,0x12
80401b0c:	cd860613          	addi	a2,a2,-808 # 804137e0 <commands+0x1bc>
80401b10:	0be00593          	li	a1,190
80401b14:	00012517          	auipc	a0,0x12
80401b18:	1f850513          	addi	a0,a0,504 # 80413d0c <commands+0x6e8>
80401b1c:	b09fe0ef          	jal	ra,80400624 <__panic>
80401b20:	00012697          	auipc	a3,0x12
80401b24:	2d468693          	addi	a3,a3,724 # 80413df4 <commands+0x7d0>
80401b28:	00012617          	auipc	a2,0x12
80401b2c:	cb860613          	addi	a2,a2,-840 # 804137e0 <commands+0x1bc>
80401b30:	0c000593          	li	a1,192
80401b34:	00012517          	auipc	a0,0x12
80401b38:	1d850513          	addi	a0,a0,472 # 80413d0c <commands+0x6e8>
80401b3c:	ae9fe0ef          	jal	ra,80400624 <__panic>
80401b40:	00012697          	auipc	a3,0x12
80401b44:	33c68693          	addi	a3,a3,828 # 80413e7c <commands+0x858>
80401b48:	00012617          	auipc	a2,0x12
80401b4c:	c9860613          	addi	a2,a2,-872 # 804137e0 <commands+0x1bc>
80401b50:	0d900593          	li	a1,217
80401b54:	00012517          	auipc	a0,0x12
80401b58:	1b850513          	addi	a0,a0,440 # 80413d0c <commands+0x6e8>
80401b5c:	ac9fe0ef          	jal	ra,80400624 <__panic>
80401b60:	00012697          	auipc	a3,0x12
80401b64:	1e068693          	addi	a3,a3,480 # 80413d40 <commands+0x71c>
80401b68:	00012617          	auipc	a2,0x12
80401b6c:	c7860613          	addi	a2,a2,-904 # 804137e0 <commands+0x1bc>
80401b70:	0d200593          	li	a1,210
80401b74:	00012517          	auipc	a0,0x12
80401b78:	19850513          	addi	a0,a0,408 # 80413d0c <commands+0x6e8>
80401b7c:	aa9fe0ef          	jal	ra,80400624 <__panic>
80401b80:	00012697          	auipc	a3,0x12
80401b84:	2ec68693          	addi	a3,a3,748 # 80413e6c <commands+0x848>
80401b88:	00012617          	auipc	a2,0x12
80401b8c:	c5860613          	addi	a2,a2,-936 # 804137e0 <commands+0x1bc>
80401b90:	0d000593          	li	a1,208
80401b94:	00012517          	auipc	a0,0x12
80401b98:	17850513          	addi	a0,a0,376 # 80413d0c <commands+0x6e8>
80401b9c:	a89fe0ef          	jal	ra,80400624 <__panic>
80401ba0:	00012697          	auipc	a3,0x12
80401ba4:	2b468693          	addi	a3,a3,692 # 80413e54 <commands+0x830>
80401ba8:	00012617          	auipc	a2,0x12
80401bac:	c3860613          	addi	a2,a2,-968 # 804137e0 <commands+0x1bc>
80401bb0:	0cb00593          	li	a1,203
80401bb4:	00012517          	auipc	a0,0x12
80401bb8:	15850513          	addi	a0,a0,344 # 80413d0c <commands+0x6e8>
80401bbc:	a69fe0ef          	jal	ra,80400624 <__panic>
80401bc0:	00012697          	auipc	a3,0x12
80401bc4:	27468693          	addi	a3,a3,628 # 80413e34 <commands+0x810>
80401bc8:	00012617          	auipc	a2,0x12
80401bcc:	c1860613          	addi	a2,a2,-1000 # 804137e0 <commands+0x1bc>
80401bd0:	0c200593          	li	a1,194
80401bd4:	00012517          	auipc	a0,0x12
80401bd8:	13850513          	addi	a0,a0,312 # 80413d0c <commands+0x6e8>
80401bdc:	a49fe0ef          	jal	ra,80400624 <__panic>
80401be0:	00012697          	auipc	a3,0x12
80401be4:	2e068693          	addi	a3,a3,736 # 80413ec0 <commands+0x89c>
80401be8:	00012617          	auipc	a2,0x12
80401bec:	bf860613          	addi	a2,a2,-1032 # 804137e0 <commands+0x1bc>
80401bf0:	0f800593          	li	a1,248
80401bf4:	00012517          	auipc	a0,0x12
80401bf8:	11850513          	addi	a0,a0,280 # 80413d0c <commands+0x6e8>
80401bfc:	a29fe0ef          	jal	ra,80400624 <__panic>
80401c00:	00012697          	auipc	a3,0x12
80401c04:	2b068693          	addi	a3,a3,688 # 80413eb0 <commands+0x88c>
80401c08:	00012617          	auipc	a2,0x12
80401c0c:	bd860613          	addi	a2,a2,-1064 # 804137e0 <commands+0x1bc>
80401c10:	0df00593          	li	a1,223
80401c14:	00012517          	auipc	a0,0x12
80401c18:	0f850513          	addi	a0,a0,248 # 80413d0c <commands+0x6e8>
80401c1c:	a09fe0ef          	jal	ra,80400624 <__panic>
80401c20:	00012697          	auipc	a3,0x12
80401c24:	23468693          	addi	a3,a3,564 # 80413e54 <commands+0x830>
80401c28:	00012617          	auipc	a2,0x12
80401c2c:	bb860613          	addi	a2,a2,-1096 # 804137e0 <commands+0x1bc>
80401c30:	0dd00593          	li	a1,221
80401c34:	00012517          	auipc	a0,0x12
80401c38:	0d850513          	addi	a0,a0,216 # 80413d0c <commands+0x6e8>
80401c3c:	9e9fe0ef          	jal	ra,80400624 <__panic>
80401c40:	00012697          	auipc	a3,0x12
80401c44:	25468693          	addi	a3,a3,596 # 80413e94 <commands+0x870>
80401c48:	00012617          	auipc	a2,0x12
80401c4c:	b9860613          	addi	a2,a2,-1128 # 804137e0 <commands+0x1bc>
80401c50:	0dc00593          	li	a1,220
80401c54:	00012517          	auipc	a0,0x12
80401c58:	0b850513          	addi	a0,a0,184 # 80413d0c <commands+0x6e8>
80401c5c:	9c9fe0ef          	jal	ra,80400624 <__panic>
80401c60:	00012697          	auipc	a3,0x12
80401c64:	0e068693          	addi	a3,a3,224 # 80413d40 <commands+0x71c>
80401c68:	00012617          	auipc	a2,0x12
80401c6c:	b7860613          	addi	a2,a2,-1160 # 804137e0 <commands+0x1bc>
80401c70:	0b900593          	li	a1,185
80401c74:	00012517          	auipc	a0,0x12
80401c78:	09850513          	addi	a0,a0,152 # 80413d0c <commands+0x6e8>
80401c7c:	9a9fe0ef          	jal	ra,80400624 <__panic>
80401c80:	00012697          	auipc	a3,0x12
80401c84:	1d468693          	addi	a3,a3,468 # 80413e54 <commands+0x830>
80401c88:	00012617          	auipc	a2,0x12
80401c8c:	b5860613          	addi	a2,a2,-1192 # 804137e0 <commands+0x1bc>
80401c90:	0d600593          	li	a1,214
80401c94:	00012517          	auipc	a0,0x12
80401c98:	07850513          	addi	a0,a0,120 # 80413d0c <commands+0x6e8>
80401c9c:	989fe0ef          	jal	ra,80400624 <__panic>
80401ca0:	00012697          	auipc	a3,0x12
80401ca4:	0d868693          	addi	a3,a3,216 # 80413d78 <commands+0x754>
80401ca8:	00012617          	auipc	a2,0x12
80401cac:	b3860613          	addi	a2,a2,-1224 # 804137e0 <commands+0x1bc>
80401cb0:	0d400593          	li	a1,212
80401cb4:	00012517          	auipc	a0,0x12
80401cb8:	05850513          	addi	a0,a0,88 # 80413d0c <commands+0x6e8>
80401cbc:	969fe0ef          	jal	ra,80400624 <__panic>
80401cc0:	00012697          	auipc	a3,0x12
80401cc4:	09c68693          	addi	a3,a3,156 # 80413d5c <commands+0x738>
80401cc8:	00012617          	auipc	a2,0x12
80401ccc:	b1860613          	addi	a2,a2,-1256 # 804137e0 <commands+0x1bc>
80401cd0:	0d300593          	li	a1,211
80401cd4:	00012517          	auipc	a0,0x12
80401cd8:	03850513          	addi	a0,a0,56 # 80413d0c <commands+0x6e8>
80401cdc:	949fe0ef          	jal	ra,80400624 <__panic>
80401ce0:	00012697          	auipc	a3,0x12
80401ce4:	09868693          	addi	a3,a3,152 # 80413d78 <commands+0x754>
80401ce8:	00012617          	auipc	a2,0x12
80401cec:	af860613          	addi	a2,a2,-1288 # 804137e0 <commands+0x1bc>
80401cf0:	0bb00593          	li	a1,187
80401cf4:	00012517          	auipc	a0,0x12
80401cf8:	01850513          	addi	a0,a0,24 # 80413d0c <commands+0x6e8>
80401cfc:	929fe0ef          	jal	ra,80400624 <__panic>
80401d00:	00012697          	auipc	a3,0x12
80401d04:	30468693          	addi	a3,a3,772 # 80414004 <commands+0x9e0>
80401d08:	00012617          	auipc	a2,0x12
80401d0c:	ad860613          	addi	a2,a2,-1320 # 804137e0 <commands+0x1bc>
80401d10:	12500593          	li	a1,293
80401d14:	00012517          	auipc	a0,0x12
80401d18:	ff850513          	addi	a0,a0,-8 # 80413d0c <commands+0x6e8>
80401d1c:	909fe0ef          	jal	ra,80400624 <__panic>
80401d20:	00012697          	auipc	a3,0x12
80401d24:	19068693          	addi	a3,a3,400 # 80413eb0 <commands+0x88c>
80401d28:	00012617          	auipc	a2,0x12
80401d2c:	ab860613          	addi	a2,a2,-1352 # 804137e0 <commands+0x1bc>
80401d30:	11a00593          	li	a1,282
80401d34:	00012517          	auipc	a0,0x12
80401d38:	fd850513          	addi	a0,a0,-40 # 80413d0c <commands+0x6e8>
80401d3c:	8e9fe0ef          	jal	ra,80400624 <__panic>
80401d40:	00012697          	auipc	a3,0x12
80401d44:	11468693          	addi	a3,a3,276 # 80413e54 <commands+0x830>
80401d48:	00012617          	auipc	a2,0x12
80401d4c:	a9860613          	addi	a2,a2,-1384 # 804137e0 <commands+0x1bc>
80401d50:	11800593          	li	a1,280
80401d54:	00012517          	auipc	a0,0x12
80401d58:	fb850513          	addi	a0,a0,-72 # 80413d0c <commands+0x6e8>
80401d5c:	8c9fe0ef          	jal	ra,80400624 <__panic>
80401d60:	00012697          	auipc	a3,0x12
80401d64:	0b468693          	addi	a3,a3,180 # 80413e14 <commands+0x7f0>
80401d68:	00012617          	auipc	a2,0x12
80401d6c:	a7860613          	addi	a2,a2,-1416 # 804137e0 <commands+0x1bc>
80401d70:	0c100593          	li	a1,193
80401d74:	00012517          	auipc	a0,0x12
80401d78:	f9850513          	addi	a0,a0,-104 # 80413d0c <commands+0x6e8>
80401d7c:	8a9fe0ef          	jal	ra,80400624 <__panic>
80401d80:	00012697          	auipc	a3,0x12
80401d84:	24468693          	addi	a3,a3,580 # 80413fc4 <commands+0x9a0>
80401d88:	00012617          	auipc	a2,0x12
80401d8c:	a5860613          	addi	a2,a2,-1448 # 804137e0 <commands+0x1bc>
80401d90:	11200593          	li	a1,274
80401d94:	00012517          	auipc	a0,0x12
80401d98:	f7850513          	addi	a0,a0,-136 # 80413d0c <commands+0x6e8>
80401d9c:	889fe0ef          	jal	ra,80400624 <__panic>
80401da0:	00012697          	auipc	a3,0x12
80401da4:	20468693          	addi	a3,a3,516 # 80413fa4 <commands+0x980>
80401da8:	00012617          	auipc	a2,0x12
80401dac:	a3860613          	addi	a2,a2,-1480 # 804137e0 <commands+0x1bc>
80401db0:	11000593          	li	a1,272
80401db4:	00012517          	auipc	a0,0x12
80401db8:	f5850513          	addi	a0,a0,-168 # 80413d0c <commands+0x6e8>
80401dbc:	869fe0ef          	jal	ra,80400624 <__panic>
80401dc0:	00012697          	auipc	a3,0x12
80401dc4:	1bc68693          	addi	a3,a3,444 # 80413f7c <commands+0x958>
80401dc8:	00012617          	auipc	a2,0x12
80401dcc:	a1860613          	addi	a2,a2,-1512 # 804137e0 <commands+0x1bc>
80401dd0:	10e00593          	li	a1,270
80401dd4:	00012517          	auipc	a0,0x12
80401dd8:	f3850513          	addi	a0,a0,-200 # 80413d0c <commands+0x6e8>
80401ddc:	849fe0ef          	jal	ra,80400624 <__panic>
80401de0:	00012697          	auipc	a3,0x12
80401de4:	17468693          	addi	a3,a3,372 # 80413f54 <commands+0x930>
80401de8:	00012617          	auipc	a2,0x12
80401dec:	9f860613          	addi	a2,a2,-1544 # 804137e0 <commands+0x1bc>
80401df0:	10d00593          	li	a1,269
80401df4:	00012517          	auipc	a0,0x12
80401df8:	f1850513          	addi	a0,a0,-232 # 80413d0c <commands+0x6e8>
80401dfc:	829fe0ef          	jal	ra,80400624 <__panic>
80401e00:	00012697          	auipc	a3,0x12
80401e04:	14468693          	addi	a3,a3,324 # 80413f44 <commands+0x920>
80401e08:	00012617          	auipc	a2,0x12
80401e0c:	9d860613          	addi	a2,a2,-1576 # 804137e0 <commands+0x1bc>
80401e10:	10800593          	li	a1,264
80401e14:	00012517          	auipc	a0,0x12
80401e18:	ef850513          	addi	a0,a0,-264 # 80413d0c <commands+0x6e8>
80401e1c:	809fe0ef          	jal	ra,80400624 <__panic>
80401e20:	00012697          	auipc	a3,0x12
80401e24:	03468693          	addi	a3,a3,52 # 80413e54 <commands+0x830>
80401e28:	00012617          	auipc	a2,0x12
80401e2c:	9b860613          	addi	a2,a2,-1608 # 804137e0 <commands+0x1bc>
80401e30:	10700593          	li	a1,263
80401e34:	00012517          	auipc	a0,0x12
80401e38:	ed850513          	addi	a0,a0,-296 # 80413d0c <commands+0x6e8>
80401e3c:	fe8fe0ef          	jal	ra,80400624 <__panic>
80401e40:	00012697          	auipc	a3,0x12
80401e44:	0e468693          	addi	a3,a3,228 # 80413f24 <commands+0x900>
80401e48:	00012617          	auipc	a2,0x12
80401e4c:	99860613          	addi	a2,a2,-1640 # 804137e0 <commands+0x1bc>
80401e50:	10600593          	li	a1,262
80401e54:	00012517          	auipc	a0,0x12
80401e58:	eb850513          	addi	a0,a0,-328 # 80413d0c <commands+0x6e8>
80401e5c:	fc8fe0ef          	jal	ra,80400624 <__panic>
80401e60:	00012697          	auipc	a3,0x12
80401e64:	09868693          	addi	a3,a3,152 # 80413ef8 <commands+0x8d4>
80401e68:	00012617          	auipc	a2,0x12
80401e6c:	97860613          	addi	a2,a2,-1672 # 804137e0 <commands+0x1bc>
80401e70:	10500593          	li	a1,261
80401e74:	00012517          	auipc	a0,0x12
80401e78:	e9850513          	addi	a0,a0,-360 # 80413d0c <commands+0x6e8>
80401e7c:	fa8fe0ef          	jal	ra,80400624 <__panic>
80401e80:	00012697          	auipc	a3,0x12
80401e84:	06068693          	addi	a3,a3,96 # 80413ee0 <commands+0x8bc>
80401e88:	00012617          	auipc	a2,0x12
80401e8c:	95860613          	addi	a2,a2,-1704 # 804137e0 <commands+0x1bc>
80401e90:	10400593          	li	a1,260
80401e94:	00012517          	auipc	a0,0x12
80401e98:	e7850513          	addi	a0,a0,-392 # 80413d0c <commands+0x6e8>
80401e9c:	f88fe0ef          	jal	ra,80400624 <__panic>
80401ea0:	00012697          	auipc	a3,0x12
80401ea4:	fb468693          	addi	a3,a3,-76 # 80413e54 <commands+0x830>
80401ea8:	00012617          	auipc	a2,0x12
80401eac:	93860613          	addi	a2,a2,-1736 # 804137e0 <commands+0x1bc>
80401eb0:	0fe00593          	li	a1,254
80401eb4:	00012517          	auipc	a0,0x12
80401eb8:	e5850513          	addi	a0,a0,-424 # 80413d0c <commands+0x6e8>
80401ebc:	f68fe0ef          	jal	ra,80400624 <__panic>
80401ec0:	00012697          	auipc	a3,0x12
80401ec4:	00c68693          	addi	a3,a3,12 # 80413ecc <commands+0x8a8>
80401ec8:	00012617          	auipc	a2,0x12
80401ecc:	91860613          	addi	a2,a2,-1768 # 804137e0 <commands+0x1bc>
80401ed0:	0f900593          	li	a1,249
80401ed4:	00012517          	auipc	a0,0x12
80401ed8:	e3850513          	addi	a0,a0,-456 # 80413d0c <commands+0x6e8>
80401edc:	f48fe0ef          	jal	ra,80400624 <__panic>
80401ee0:	00012697          	auipc	a3,0x12
80401ee4:	10468693          	addi	a3,a3,260 # 80413fe4 <commands+0x9c0>
80401ee8:	00012617          	auipc	a2,0x12
80401eec:	8f860613          	addi	a2,a2,-1800 # 804137e0 <commands+0x1bc>
80401ef0:	11700593          	li	a1,279
80401ef4:	00012517          	auipc	a0,0x12
80401ef8:	e1850513          	addi	a0,a0,-488 # 80413d0c <commands+0x6e8>
80401efc:	f28fe0ef          	jal	ra,80400624 <__panic>
80401f00:	00012697          	auipc	a3,0x12
80401f04:	11068693          	addi	a3,a3,272 # 80414010 <commands+0x9ec>
80401f08:	00012617          	auipc	a2,0x12
80401f0c:	8d860613          	addi	a2,a2,-1832 # 804137e0 <commands+0x1bc>
80401f10:	12600593          	li	a1,294
80401f14:	00012517          	auipc	a0,0x12
80401f18:	df850513          	addi	a0,a0,-520 # 80413d0c <commands+0x6e8>
80401f1c:	f08fe0ef          	jal	ra,80400624 <__panic>
80401f20:	00012697          	auipc	a3,0x12
80401f24:	e0468693          	addi	a3,a3,-508 # 80413d24 <commands+0x700>
80401f28:	00012617          	auipc	a2,0x12
80401f2c:	8b860613          	addi	a2,a2,-1864 # 804137e0 <commands+0x1bc>
80401f30:	0f300593          	li	a1,243
80401f34:	00012517          	auipc	a0,0x12
80401f38:	dd850513          	addi	a0,a0,-552 # 80413d0c <commands+0x6e8>
80401f3c:	ee8fe0ef          	jal	ra,80400624 <__panic>
80401f40:	00012697          	auipc	a3,0x12
80401f44:	e1c68693          	addi	a3,a3,-484 # 80413d5c <commands+0x738>
80401f48:	00012617          	auipc	a2,0x12
80401f4c:	89860613          	addi	a2,a2,-1896 # 804137e0 <commands+0x1bc>
80401f50:	0ba00593          	li	a1,186
80401f54:	00012517          	auipc	a0,0x12
80401f58:	db850513          	addi	a0,a0,-584 # 80413d0c <commands+0x6e8>
80401f5c:	ec8fe0ef          	jal	ra,80400624 <__panic>

80401f60 <default_free_pages>:
80401f60:	ff010113          	addi	sp,sp,-16
80401f64:	00112623          	sw	ra,12(sp)
80401f68:	1e058863          	beqz	a1,80402158 <default_free_pages+0x1f8>
80401f6c:	00559693          	slli	a3,a1,0x5
80401f70:	00d506b3          	add	a3,a0,a3
80401f74:	04d50863          	beq	a0,a3,80401fc4 <default_free_pages+0x64>
80401f78:	00452783          	lw	a5,4(a0)
80401f7c:	0017f793          	andi	a5,a5,1
80401f80:	1a079c63          	bnez	a5,80402138 <default_free_pages+0x1d8>
80401f84:	00452783          	lw	a5,4(a0)
80401f88:	0017d793          	srli	a5,a5,0x1
80401f8c:	0017f793          	andi	a5,a5,1
80401f90:	1a079463          	bnez	a5,80402138 <default_free_pages+0x1d8>
80401f94:	00050793          	mv	a5,a0
80401f98:	01c0006f          	j	80401fb4 <default_free_pages+0x54>
80401f9c:	0047a703          	lw	a4,4(a5)
80401fa0:	00177713          	andi	a4,a4,1
80401fa4:	18071a63          	bnez	a4,80402138 <default_free_pages+0x1d8>
80401fa8:	0047a703          	lw	a4,4(a5)
80401fac:	00277713          	andi	a4,a4,2
80401fb0:	18071463          	bnez	a4,80402138 <default_free_pages+0x1d8>
80401fb4:	0007a223          	sw	zero,4(a5)
80401fb8:	0007a023          	sw	zero,0(a5)
80401fbc:	02078793          	addi	a5,a5,32
80401fc0:	fcd79ee3          	bne	a5,a3,80401f9c <default_free_pages+0x3c>
80401fc4:	00452703          	lw	a4,4(a0)
80401fc8:	0009b697          	auipc	a3,0x9b
80401fcc:	82c68693          	addi	a3,a3,-2004 # 8049c7f4 <free_area>
80401fd0:	0046a783          	lw	a5,4(a3)
80401fd4:	00276713          	ori	a4,a4,2
80401fd8:	00e52223          	sw	a4,4(a0)
80401fdc:	0086a703          	lw	a4,8(a3)
80401fe0:	00b52423          	sw	a1,8(a0)
80401fe4:	00b70733          	add	a4,a4,a1
80401fe8:	0009b617          	auipc	a2,0x9b
80401fec:	80e62a23          	sw	a4,-2028(a2) # 8049c7fc <free_area+0x8>
80401ff0:	0ed78a63          	beq	a5,a3,804020e4 <default_free_pages+0x184>
80401ff4:	ff478713          	addi	a4,a5,-12
80401ff8:	0006a803          	lw	a6,0(a3)
80401ffc:	00000893          	li	a7,0
80402000:	00c50613          	addi	a2,a0,12
80402004:	00e56c63          	bltu	a0,a4,8040201c <default_free_pages+0xbc>
80402008:	0047a703          	lw	a4,4(a5)
8040200c:	06d70663          	beq	a4,a3,80402078 <default_free_pages+0x118>
80402010:	00070793          	mv	a5,a4
80402014:	ff478713          	addi	a4,a5,-12
80402018:	fee578e3          	bgeu	a0,a4,80402008 <default_free_pages+0xa8>
8040201c:	00088663          	beqz	a7,80402028 <default_free_pages+0xc8>
80402020:	0009a897          	auipc	a7,0x9a
80402024:	7d08aa23          	sw	a6,2004(a7) # 8049c7f4 <free_area>
80402028:	0007a803          	lw	a6,0(a5)
8040202c:	00c7a023          	sw	a2,0(a5)
80402030:	00c82223          	sw	a2,4(a6)
80402034:	00f52823          	sw	a5,16(a0)
80402038:	01052623          	sw	a6,12(a0)
8040203c:	08d80663          	beq	a6,a3,804020c8 <default_free_pages+0x168>
80402040:	ffc82883          	lw	a7,-4(a6)
80402044:	ff480613          	addi	a2,a6,-12
80402048:	00589713          	slli	a4,a7,0x5
8040204c:	00e60733          	add	a4,a2,a4
80402050:	06e51863          	bne	a0,a4,804020c0 <default_free_pages+0x160>
80402054:	011585b3          	add	a1,a1,a7
80402058:	feb82e23          	sw	a1,-4(a6)
8040205c:	00452703          	lw	a4,4(a0)
80402060:	ffd77713          	andi	a4,a4,-3
80402064:	00e52223          	sw	a4,4(a0)
80402068:	00f82223          	sw	a5,4(a6)
8040206c:	0107a023          	sw	a6,0(a5)
80402070:	00060513          	mv	a0,a2
80402074:	04c0006f          	j	804020c0 <default_free_pages+0x160>
80402078:	00c7a223          	sw	a2,4(a5)
8040207c:	00d52823          	sw	a3,16(a0)
80402080:	0047a703          	lw	a4,4(a5)
80402084:	00f52623          	sw	a5,12(a0)
80402088:	00060813          	mv	a6,a2
8040208c:	00d70863          	beq	a4,a3,8040209c <default_free_pages+0x13c>
80402090:	00100893          	li	a7,1
80402094:	00070793          	mv	a5,a4
80402098:	f7dff06f          	j	80402014 <default_free_pages+0xb4>
8040209c:	00078813          	mv	a6,a5
804020a0:	00c6a023          	sw	a2,0(a3)
804020a4:	00068793          	mv	a5,a3
804020a8:	00d80c63          	beq	a6,a3,804020c0 <default_free_pages+0x160>
804020ac:	ffc82883          	lw	a7,-4(a6)
804020b0:	ff480613          	addi	a2,a6,-12
804020b4:	00589713          	slli	a4,a7,0x5
804020b8:	00e60733          	add	a4,a2,a4
804020bc:	f8e50ce3          	beq	a0,a4,80402054 <default_free_pages+0xf4>
804020c0:	ff478713          	addi	a4,a5,-12
804020c4:	00d78a63          	beq	a5,a3,804020d8 <default_free_pages+0x178>
804020c8:	00852603          	lw	a2,8(a0)
804020cc:	00561693          	slli	a3,a2,0x5
804020d0:	00d506b3          	add	a3,a0,a3
804020d4:	02d70863          	beq	a4,a3,80402104 <default_free_pages+0x1a4>
804020d8:	00c12083          	lw	ra,12(sp)
804020dc:	01010113          	addi	sp,sp,16
804020e0:	00008067          	ret
804020e4:	00c12083          	lw	ra,12(sp)
804020e8:	00c50713          	addi	a4,a0,12
804020ec:	00e7a023          	sw	a4,0(a5)
804020f0:	00e7a223          	sw	a4,4(a5)
804020f4:	00f52823          	sw	a5,16(a0)
804020f8:	00f52623          	sw	a5,12(a0)
804020fc:	01010113          	addi	sp,sp,16
80402100:	00008067          	ret
80402104:	ffc7a703          	lw	a4,-4(a5)
80402108:	0007a583          	lw	a1,0(a5)
8040210c:	0047a683          	lw	a3,4(a5)
80402110:	00c70633          	add	a2,a4,a2
80402114:	00c52423          	sw	a2,8(a0)
80402118:	ff87a703          	lw	a4,-8(a5)
8040211c:	00c12083          	lw	ra,12(sp)
80402120:	ffd77713          	andi	a4,a4,-3
80402124:	fee7ac23          	sw	a4,-8(a5)
80402128:	00d5a223          	sw	a3,4(a1)
8040212c:	00b6a023          	sw	a1,0(a3)
80402130:	01010113          	addi	sp,sp,16
80402134:	00008067          	ret
80402138:	00012697          	auipc	a3,0x12
8040213c:	ee468693          	addi	a3,a3,-284 # 8041401c <commands+0x9f8>
80402140:	00011617          	auipc	a2,0x11
80402144:	6a060613          	addi	a2,a2,1696 # 804137e0 <commands+0x1bc>
80402148:	08300593          	li	a1,131
8040214c:	00012517          	auipc	a0,0x12
80402150:	bc050513          	addi	a0,a0,-1088 # 80413d0c <commands+0x6e8>
80402154:	cd0fe0ef          	jal	ra,80400624 <__panic>
80402158:	00012697          	auipc	a3,0x12
8040215c:	eec68693          	addi	a3,a3,-276 # 80414044 <commands+0xa20>
80402160:	00011617          	auipc	a2,0x11
80402164:	68060613          	addi	a2,a2,1664 # 804137e0 <commands+0x1bc>
80402168:	08000593          	li	a1,128
8040216c:	00012517          	auipc	a0,0x12
80402170:	ba050513          	addi	a0,a0,-1120 # 80413d0c <commands+0x6e8>
80402174:	cb0fe0ef          	jal	ra,80400624 <__panic>

80402178 <default_alloc_pages>:
80402178:	0a050263          	beqz	a0,8040221c <default_alloc_pages+0xa4>
8040217c:	0009a617          	auipc	a2,0x9a
80402180:	67860613          	addi	a2,a2,1656 # 8049c7f4 <free_area>
80402184:	00862583          	lw	a1,8(a2)
80402188:	00050693          	mv	a3,a0
8040218c:	00a5ee63          	bltu	a1,a0,804021a8 <default_alloc_pages+0x30>
80402190:	00060793          	mv	a5,a2
80402194:	00c0006f          	j	804021a0 <default_alloc_pages+0x28>
80402198:	ffc7a703          	lw	a4,-4(a5)
8040219c:	00d77a63          	bgeu	a4,a3,804021b0 <default_alloc_pages+0x38>
804021a0:	0047a783          	lw	a5,4(a5)
804021a4:	fec79ae3          	bne	a5,a2,80402198 <default_alloc_pages+0x20>
804021a8:	00000513          	li	a0,0
804021ac:	00008067          	ret
804021b0:	ff478513          	addi	a0,a5,-12
804021b4:	fe050ce3          	beqz	a0,804021ac <default_alloc_pages+0x34>
804021b8:	0007a883          	lw	a7,0(a5)
804021bc:	0047a303          	lw	t1,4(a5)
804021c0:	0068a223          	sw	t1,4(a7)
804021c4:	01132023          	sw	a7,0(t1)
804021c8:	02e6fc63          	bgeu	a3,a4,80402200 <default_alloc_pages+0x88>
804021cc:	00569813          	slli	a6,a3,0x5
804021d0:	01050833          	add	a6,a0,a6
804021d4:	00482583          	lw	a1,4(a6)
804021d8:	40d70733          	sub	a4,a4,a3
804021dc:	00e82423          	sw	a4,8(a6)
804021e0:	0025e713          	ori	a4,a1,2
804021e4:	00e82223          	sw	a4,4(a6)
804021e8:	00c80713          	addi	a4,a6,12
804021ec:	00e32023          	sw	a4,0(t1)
804021f0:	00862583          	lw	a1,8(a2)
804021f4:	00e8a223          	sw	a4,4(a7)
804021f8:	00682823          	sw	t1,16(a6)
804021fc:	01182623          	sw	a7,12(a6)
80402200:	40d586b3          	sub	a3,a1,a3
80402204:	0009a717          	auipc	a4,0x9a
80402208:	5ed72c23          	sw	a3,1528(a4) # 8049c7fc <free_area+0x8>
8040220c:	ff87a703          	lw	a4,-8(a5)
80402210:	ffd77713          	andi	a4,a4,-3
80402214:	fee7ac23          	sw	a4,-8(a5)
80402218:	00008067          	ret
8040221c:	ff010113          	addi	sp,sp,-16
80402220:	00012697          	auipc	a3,0x12
80402224:	e2468693          	addi	a3,a3,-476 # 80414044 <commands+0xa20>
80402228:	00011617          	auipc	a2,0x11
8040222c:	5b860613          	addi	a2,a2,1464 # 804137e0 <commands+0x1bc>
80402230:	06200593          	li	a1,98
80402234:	00012517          	auipc	a0,0x12
80402238:	ad850513          	addi	a0,a0,-1320 # 80413d0c <commands+0x6e8>
8040223c:	00112623          	sw	ra,12(sp)
80402240:	be4fe0ef          	jal	ra,80400624 <__panic>

80402244 <default_init_memmap>:
80402244:	ff010113          	addi	sp,sp,-16
80402248:	00112623          	sw	ra,12(sp)
8040224c:	12058e63          	beqz	a1,80402388 <default_init_memmap+0x144>
80402250:	00559693          	slli	a3,a1,0x5
80402254:	00d506b3          	add	a3,a0,a3
80402258:	02d50c63          	beq	a0,a3,80402290 <default_init_memmap+0x4c>
8040225c:	00452703          	lw	a4,4(a0)
80402260:	00050793          	mv	a5,a0
80402264:	00177713          	andi	a4,a4,1
80402268:	00071a63          	bnez	a4,8040227c <default_init_memmap+0x38>
8040226c:	0fc0006f          	j	80402368 <default_init_memmap+0x124>
80402270:	0047a703          	lw	a4,4(a5)
80402274:	00177713          	andi	a4,a4,1
80402278:	0e070863          	beqz	a4,80402368 <default_init_memmap+0x124>
8040227c:	0007a423          	sw	zero,8(a5)
80402280:	0007a223          	sw	zero,4(a5)
80402284:	0007a023          	sw	zero,0(a5)
80402288:	02078793          	addi	a5,a5,32
8040228c:	fed792e3          	bne	a5,a3,80402270 <default_init_memmap+0x2c>
80402290:	00452703          	lw	a4,4(a0)
80402294:	0009a697          	auipc	a3,0x9a
80402298:	56068693          	addi	a3,a3,1376 # 8049c7f4 <free_area>
8040229c:	0046a783          	lw	a5,4(a3)
804022a0:	00276713          	ori	a4,a4,2
804022a4:	00e52223          	sw	a4,4(a0)
804022a8:	0086a703          	lw	a4,8(a3)
804022ac:	00b52423          	sw	a1,8(a0)
804022b0:	00b705b3          	add	a1,a4,a1
804022b4:	0009a717          	auipc	a4,0x9a
804022b8:	54b72423          	sw	a1,1352(a4) # 8049c7fc <free_area+0x8>
804022bc:	06d78e63          	beq	a5,a3,80402338 <default_init_memmap+0xf4>
804022c0:	ff478713          	addi	a4,a5,-12
804022c4:	0006a583          	lw	a1,0(a3)
804022c8:	00000813          	li	a6,0
804022cc:	00c50613          	addi	a2,a0,12
804022d0:	00e56c63          	bltu	a0,a4,804022e8 <default_init_memmap+0xa4>
804022d4:	0047a703          	lw	a4,4(a5)
804022d8:	02d70e63          	beq	a4,a3,80402314 <default_init_memmap+0xd0>
804022dc:	00070793          	mv	a5,a4
804022e0:	ff478713          	addi	a4,a5,-12
804022e4:	fee578e3          	bgeu	a0,a4,804022d4 <default_init_memmap+0x90>
804022e8:	00080663          	beqz	a6,804022f4 <default_init_memmap+0xb0>
804022ec:	0009a717          	auipc	a4,0x9a
804022f0:	50b72423          	sw	a1,1288(a4) # 8049c7f4 <free_area>
804022f4:	0007a703          	lw	a4,0(a5)
804022f8:	00c12083          	lw	ra,12(sp)
804022fc:	00c7a023          	sw	a2,0(a5)
80402300:	00c72223          	sw	a2,4(a4)
80402304:	00f52823          	sw	a5,16(a0)
80402308:	00e52623          	sw	a4,12(a0)
8040230c:	01010113          	addi	sp,sp,16
80402310:	00008067          	ret
80402314:	00c7a223          	sw	a2,4(a5)
80402318:	00d52823          	sw	a3,16(a0)
8040231c:	0047a703          	lw	a4,4(a5)
80402320:	00f52623          	sw	a5,12(a0)
80402324:	00060593          	mv	a1,a2
80402328:	02d70863          	beq	a4,a3,80402358 <default_init_memmap+0x114>
8040232c:	00100813          	li	a6,1
80402330:	00070793          	mv	a5,a4
80402334:	fadff06f          	j	804022e0 <default_init_memmap+0x9c>
80402338:	00c12083          	lw	ra,12(sp)
8040233c:	00c50713          	addi	a4,a0,12
80402340:	00e7a023          	sw	a4,0(a5)
80402344:	00e7a223          	sw	a4,4(a5)
80402348:	00f52823          	sw	a5,16(a0)
8040234c:	00f52623          	sw	a5,12(a0)
80402350:	01010113          	addi	sp,sp,16
80402354:	00008067          	ret
80402358:	00c12083          	lw	ra,12(sp)
8040235c:	00c6a023          	sw	a2,0(a3)
80402360:	01010113          	addi	sp,sp,16
80402364:	00008067          	ret
80402368:	00012697          	auipc	a3,0x12
8040236c:	ce468693          	addi	a3,a3,-796 # 8041404c <commands+0xa28>
80402370:	00011617          	auipc	a2,0x11
80402374:	47060613          	addi	a2,a2,1136 # 804137e0 <commands+0x1bc>
80402378:	04900593          	li	a1,73
8040237c:	00012517          	auipc	a0,0x12
80402380:	99050513          	addi	a0,a0,-1648 # 80413d0c <commands+0x6e8>
80402384:	aa0fe0ef          	jal	ra,80400624 <__panic>
80402388:	00012697          	auipc	a3,0x12
8040238c:	cbc68693          	addi	a3,a3,-836 # 80414044 <commands+0xa20>
80402390:	00011617          	auipc	a2,0x11
80402394:	45060613          	addi	a2,a2,1104 # 804137e0 <commands+0x1bc>
80402398:	04600593          	li	a1,70
8040239c:	00012517          	auipc	a0,0x12
804023a0:	97050513          	addi	a0,a0,-1680 # 80413d0c <commands+0x6e8>
804023a4:	a80fe0ef          	jal	ra,80400624 <__panic>

804023a8 <slob_free>:
804023a8:	08050063          	beqz	a0,80402428 <slob_free+0x80>
804023ac:	08059063          	bnez	a1,8040242c <slob_free+0x84>
804023b0:	100027f3          	csrr	a5,sstatus
804023b4:	0027f793          	andi	a5,a5,2
804023b8:	00000593          	li	a1,0
804023bc:	08079663          	bnez	a5,80402448 <slob_free+0xa0>
804023c0:	00097797          	auipc	a5,0x97
804023c4:	c8078793          	addi	a5,a5,-896 # 80499040 <slobfree>
804023c8:	0007a783          	lw	a5,0(a5)
804023cc:	0047a703          	lw	a4,4(a5)
804023d0:	00a7fc63          	bgeu	a5,a0,804023e8 <slob_free+0x40>
804023d4:	00e56e63          	bltu	a0,a4,804023f0 <slob_free+0x48>
804023d8:	00e7fc63          	bgeu	a5,a4,804023f0 <slob_free+0x48>
804023dc:	00070793          	mv	a5,a4
804023e0:	0047a703          	lw	a4,4(a5)
804023e4:	fea7e8e3          	bltu	a5,a0,804023d4 <slob_free+0x2c>
804023e8:	fee7eae3          	bltu	a5,a4,804023dc <slob_free+0x34>
804023ec:	fee578e3          	bgeu	a0,a4,804023dc <slob_free+0x34>
804023f0:	00052603          	lw	a2,0(a0)
804023f4:	00361693          	slli	a3,a2,0x3
804023f8:	00d506b3          	add	a3,a0,a3
804023fc:	0cd70a63          	beq	a4,a3,804024d0 <slob_free+0x128>
80402400:	0007a683          	lw	a3,0(a5)
80402404:	00e52223          	sw	a4,4(a0)
80402408:	00369713          	slli	a4,a3,0x3
8040240c:	00e78733          	add	a4,a5,a4
80402410:	0ee50263          	beq	a0,a4,804024f4 <slob_free+0x14c>
80402414:	00a7a223          	sw	a0,4(a5)
80402418:	00097717          	auipc	a4,0x97
8040241c:	c2f72423          	sw	a5,-984(a4) # 80499040 <slobfree>
80402420:	00058463          	beqz	a1,80402428 <slob_free+0x80>
80402424:	801fe06f          	j	80400c24 <intr_enable>
80402428:	00008067          	ret
8040242c:	00758593          	addi	a1,a1,7
80402430:	0035d593          	srli	a1,a1,0x3
80402434:	00b52023          	sw	a1,0(a0)
80402438:	100027f3          	csrr	a5,sstatus
8040243c:	0027f793          	andi	a5,a5,2
80402440:	00000593          	li	a1,0
80402444:	f6078ee3          	beqz	a5,804023c0 <slob_free+0x18>
80402448:	fe010113          	addi	sp,sp,-32
8040244c:	00a12623          	sw	a0,12(sp)
80402450:	00112e23          	sw	ra,28(sp)
80402454:	fd8fe0ef          	jal	ra,80400c2c <intr_disable>
80402458:	00097797          	auipc	a5,0x97
8040245c:	be878793          	addi	a5,a5,-1048 # 80499040 <slobfree>
80402460:	0007a783          	lw	a5,0(a5)
80402464:	00c12503          	lw	a0,12(sp)
80402468:	00100593          	li	a1,1
8040246c:	0047a703          	lw	a4,4(a5)
80402470:	00a7fc63          	bgeu	a5,a0,80402488 <slob_free+0xe0>
80402474:	00e56e63          	bltu	a0,a4,80402490 <slob_free+0xe8>
80402478:	00e7fc63          	bgeu	a5,a4,80402490 <slob_free+0xe8>
8040247c:	00070793          	mv	a5,a4
80402480:	0047a703          	lw	a4,4(a5)
80402484:	fea7e8e3          	bltu	a5,a0,80402474 <slob_free+0xcc>
80402488:	fee7eae3          	bltu	a5,a4,8040247c <slob_free+0xd4>
8040248c:	fee578e3          	bgeu	a0,a4,8040247c <slob_free+0xd4>
80402490:	00052603          	lw	a2,0(a0)
80402494:	00361693          	slli	a3,a2,0x3
80402498:	00d506b3          	add	a3,a0,a3
8040249c:	06d70e63          	beq	a4,a3,80402518 <slob_free+0x170>
804024a0:	00e52223          	sw	a4,4(a0)
804024a4:	0007a683          	lw	a3,0(a5)
804024a8:	00369713          	slli	a4,a3,0x3
804024ac:	00e78733          	add	a4,a5,a4
804024b0:	08e50063          	beq	a0,a4,80402530 <slob_free+0x188>
804024b4:	00a7a223          	sw	a0,4(a5)
804024b8:	00097717          	auipc	a4,0x97
804024bc:	b8f72423          	sw	a5,-1144(a4) # 80499040 <slobfree>
804024c0:	04059663          	bnez	a1,8040250c <slob_free+0x164>
804024c4:	01c12083          	lw	ra,28(sp)
804024c8:	02010113          	addi	sp,sp,32
804024cc:	00008067          	ret
804024d0:	00072683          	lw	a3,0(a4)
804024d4:	00472703          	lw	a4,4(a4)
804024d8:	00c68633          	add	a2,a3,a2
804024dc:	00c52023          	sw	a2,0(a0)
804024e0:	0007a683          	lw	a3,0(a5)
804024e4:	00e52223          	sw	a4,4(a0)
804024e8:	00369713          	slli	a4,a3,0x3
804024ec:	00e78733          	add	a4,a5,a4
804024f0:	f2e512e3          	bne	a0,a4,80402414 <slob_free+0x6c>
804024f4:	00052703          	lw	a4,0(a0)
804024f8:	00452603          	lw	a2,4(a0)
804024fc:	00d706b3          	add	a3,a4,a3
80402500:	00d7a023          	sw	a3,0(a5)
80402504:	00c7a223          	sw	a2,4(a5)
80402508:	f11ff06f          	j	80402418 <slob_free+0x70>
8040250c:	01c12083          	lw	ra,28(sp)
80402510:	02010113          	addi	sp,sp,32
80402514:	f10fe06f          	j	80400c24 <intr_enable>
80402518:	00072683          	lw	a3,0(a4)
8040251c:	00472703          	lw	a4,4(a4)
80402520:	00c68633          	add	a2,a3,a2
80402524:	00c52023          	sw	a2,0(a0)
80402528:	00e52223          	sw	a4,4(a0)
8040252c:	f79ff06f          	j	804024a4 <slob_free+0xfc>
80402530:	00052703          	lw	a4,0(a0)
80402534:	00452603          	lw	a2,4(a0)
80402538:	00d706b3          	add	a3,a4,a3
8040253c:	00d7a023          	sw	a3,0(a5)
80402540:	00c7a223          	sw	a2,4(a5)
80402544:	f75ff06f          	j	804024b8 <slob_free+0x110>

80402548 <__slob_get_free_pages.isra.0>:
80402548:	00100793          	li	a5,1
8040254c:	ff010113          	addi	sp,sp,-16
80402550:	00a79533          	sll	a0,a5,a0
80402554:	00112623          	sw	ra,12(sp)
80402558:	628000ef          	jal	ra,80402b80 <alloc_pages>
8040255c:	04050a63          	beqz	a0,804025b0 <__slob_get_free_pages.isra.0+0x68>
80402560:	0009a797          	auipc	a5,0x9a
80402564:	2ac78793          	addi	a5,a5,684 # 8049c80c <pages>
80402568:	0007a683          	lw	a3,0(a5)
8040256c:	00015797          	auipc	a5,0x15
80402570:	8f478793          	addi	a5,a5,-1804 # 80416e60 <nbase>
80402574:	40d50533          	sub	a0,a0,a3
80402578:	0007a683          	lw	a3,0(a5)
8040257c:	40555513          	srai	a0,a0,0x5
80402580:	0009a797          	auipc	a5,0x9a
80402584:	21c78793          	addi	a5,a5,540 # 8049c79c <npage>
80402588:	00d50533          	add	a0,a0,a3
8040258c:	0007a703          	lw	a4,0(a5)
80402590:	00c51793          	slli	a5,a0,0xc
80402594:	00c7d793          	srli	a5,a5,0xc
80402598:	00c51513          	slli	a0,a0,0xc
8040259c:	02e7f063          	bgeu	a5,a4,804025bc <__slob_get_free_pages.isra.0+0x74>
804025a0:	0009a797          	auipc	a5,0x9a
804025a4:	26478793          	addi	a5,a5,612 # 8049c804 <va_pa_offset>
804025a8:	0007a683          	lw	a3,0(a5)
804025ac:	00d50533          	add	a0,a0,a3
804025b0:	00c12083          	lw	ra,12(sp)
804025b4:	01010113          	addi	sp,sp,16
804025b8:	00008067          	ret
804025bc:	00050693          	mv	a3,a0
804025c0:	00012617          	auipc	a2,0x12
804025c4:	acc60613          	addi	a2,a2,-1332 # 8041408c <default_pmm_manager+0x30>
804025c8:	06e00593          	li	a1,110
804025cc:	00012517          	auipc	a0,0x12
804025d0:	ae450513          	addi	a0,a0,-1308 # 804140b0 <default_pmm_manager+0x54>
804025d4:	850fe0ef          	jal	ra,80400624 <__panic>

804025d8 <slob_alloc.isra.1.constprop.3>:
804025d8:	fe010113          	addi	sp,sp,-32
804025dc:	00112e23          	sw	ra,28(sp)
804025e0:	00812c23          	sw	s0,24(sp)
804025e4:	00912a23          	sw	s1,20(sp)
804025e8:	01212823          	sw	s2,16(sp)
804025ec:	01312623          	sw	s3,12(sp)
804025f0:	00850713          	addi	a4,a0,8
804025f4:	000017b7          	lui	a5,0x1
804025f8:	12f77a63          	bgeu	a4,a5,8040272c <slob_alloc.isra.1.constprop.3+0x154>
804025fc:	00750993          	addi	s3,a0,7
80402600:	0039d913          	srli	s2,s3,0x3
80402604:	10002673          	csrr	a2,sstatus
80402608:	00267613          	andi	a2,a2,2
8040260c:	10061463          	bnez	a2,80402714 <slob_alloc.isra.1.constprop.3+0x13c>
80402610:	00097497          	auipc	s1,0x97
80402614:	a3048493          	addi	s1,s1,-1488 # 80499040 <slobfree>
80402618:	0004a683          	lw	a3,0(s1)
8040261c:	0046a783          	lw	a5,4(a3)
80402620:	0007a703          	lw	a4,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
80402624:	0f275e63          	bge	a4,s2,80402720 <slob_alloc.isra.1.constprop.3+0x148>
80402628:	00d78e63          	beq	a5,a3,80402644 <slob_alloc.isra.1.constprop.3+0x6c>
8040262c:	0047a403          	lw	s0,4(a5)
80402630:	00042703          	lw	a4,0(s0)
80402634:	05275463          	bge	a4,s2,8040267c <slob_alloc.isra.1.constprop.3+0xa4>
80402638:	0004a683          	lw	a3,0(s1)
8040263c:	00040793          	mv	a5,s0
80402640:	fed796e3          	bne	a5,a3,8040262c <slob_alloc.isra.1.constprop.3+0x54>
80402644:	08061c63          	bnez	a2,804026dc <slob_alloc.isra.1.constprop.3+0x104>
80402648:	00000513          	li	a0,0
8040264c:	efdff0ef          	jal	ra,80402548 <__slob_get_free_pages.isra.0>
80402650:	00050413          	mv	s0,a0
80402654:	04050c63          	beqz	a0,804026ac <slob_alloc.isra.1.constprop.3+0xd4>
80402658:	000015b7          	lui	a1,0x1
8040265c:	d4dff0ef          	jal	ra,804023a8 <slob_free>
80402660:	10002673          	csrr	a2,sstatus
80402664:	00267613          	andi	a2,a2,2
80402668:	06061263          	bnez	a2,804026cc <slob_alloc.isra.1.constprop.3+0xf4>
8040266c:	0004a783          	lw	a5,0(s1)
80402670:	0047a403          	lw	s0,4(a5)
80402674:	00042703          	lw	a4,0(s0)
80402678:	fd2740e3          	blt	a4,s2,80402638 <slob_alloc.isra.1.constprop.3+0x60>
8040267c:	08e90663          	beq	s2,a4,80402708 <slob_alloc.isra.1.constprop.3+0x130>
80402680:	ff89f513          	andi	a0,s3,-8
80402684:	00a40533          	add	a0,s0,a0
80402688:	00a7a223          	sw	a0,4(a5)
8040268c:	00442683          	lw	a3,4(s0)
80402690:	41270733          	sub	a4,a4,s2
80402694:	00e52023          	sw	a4,0(a0)
80402698:	00d52223          	sw	a3,4(a0)
8040269c:	01242023          	sw	s2,0(s0)
804026a0:	00097717          	auipc	a4,0x97
804026a4:	9af72023          	sw	a5,-1632(a4) # 80499040 <slobfree>
804026a8:	02061e63          	bnez	a2,804026e4 <slob_alloc.isra.1.constprop.3+0x10c>
804026ac:	00040513          	mv	a0,s0
804026b0:	01c12083          	lw	ra,28(sp)
804026b4:	01812403          	lw	s0,24(sp)
804026b8:	01412483          	lw	s1,20(sp)
804026bc:	01012903          	lw	s2,16(sp)
804026c0:	00c12983          	lw	s3,12(sp)
804026c4:	02010113          	addi	sp,sp,32
804026c8:	00008067          	ret
804026cc:	d60fe0ef          	jal	ra,80400c2c <intr_disable>
804026d0:	00100613          	li	a2,1
804026d4:	0004a783          	lw	a5,0(s1)
804026d8:	f99ff06f          	j	80402670 <slob_alloc.isra.1.constprop.3+0x98>
804026dc:	d48fe0ef          	jal	ra,80400c24 <intr_enable>
804026e0:	f69ff06f          	j	80402648 <slob_alloc.isra.1.constprop.3+0x70>
804026e4:	d40fe0ef          	jal	ra,80400c24 <intr_enable>
804026e8:	00040513          	mv	a0,s0
804026ec:	01c12083          	lw	ra,28(sp)
804026f0:	01812403          	lw	s0,24(sp)
804026f4:	01412483          	lw	s1,20(sp)
804026f8:	01012903          	lw	s2,16(sp)
804026fc:	00c12983          	lw	s3,12(sp)
80402700:	02010113          	addi	sp,sp,32
80402704:	00008067          	ret
80402708:	00442703          	lw	a4,4(s0)
8040270c:	00e7a223          	sw	a4,4(a5)
80402710:	f91ff06f          	j	804026a0 <slob_alloc.isra.1.constprop.3+0xc8>
80402714:	d18fe0ef          	jal	ra,80400c2c <intr_disable>
80402718:	00100613          	li	a2,1
8040271c:	ef5ff06f          	j	80402610 <slob_alloc.isra.1.constprop.3+0x38>
80402720:	00078413          	mv	s0,a5
80402724:	00068793          	mv	a5,a3
80402728:	f55ff06f          	j	8040267c <slob_alloc.isra.1.constprop.3+0xa4>
8040272c:	00012697          	auipc	a3,0x12
80402730:	9f468693          	addi	a3,a3,-1548 # 80414120 <default_pmm_manager+0xc4>
80402734:	00011617          	auipc	a2,0x11
80402738:	0ac60613          	addi	a2,a2,172 # 804137e0 <commands+0x1bc>
8040273c:	06400593          	li	a1,100
80402740:	00012517          	auipc	a0,0x12
80402744:	a0050513          	addi	a0,a0,-1536 # 80414140 <default_pmm_manager+0xe4>
80402748:	eddfd0ef          	jal	ra,80400624 <__panic>

8040274c <slob_init>:
8040274c:	ff010113          	addi	sp,sp,-16
80402750:	00812423          	sw	s0,8(sp)
80402754:	00097417          	auipc	s0,0x97
80402758:	8e440413          	addi	s0,s0,-1820 # 80499038 <arena>
8040275c:	00097797          	auipc	a5,0x97
80402760:	8e87a023          	sw	s0,-1824(a5) # 8049903c <arena+0x4>
80402764:	00100793          	li	a5,1
80402768:	00012517          	auipc	a0,0x12
8040276c:	9ec50513          	addi	a0,a0,-1556 # 80414154 <default_pmm_manager+0xf8>
80402770:	00097717          	auipc	a4,0x97
80402774:	8cf72423          	sw	a5,-1848(a4) # 80499038 <arena>
80402778:	00112623          	sw	ra,12(sp)
8040277c:	00097797          	auipc	a5,0x97
80402780:	8c87a223          	sw	s0,-1852(a5) # 80499040 <slobfree>
80402784:	0009a797          	auipc	a5,0x9a
80402788:	0007a823          	sw	zero,16(a5) # 8049c794 <bigblocks>
8040278c:	a71fd0ef          	jal	ra,804001fc <cprintf>
80402790:	00442603          	lw	a2,4(s0)
80402794:	00042683          	lw	a3,0(s0)
80402798:	00040593          	mv	a1,s0
8040279c:	00012517          	auipc	a0,0x12
804027a0:	9cc50513          	addi	a0,a0,-1588 # 80414168 <default_pmm_manager+0x10c>
804027a4:	a59fd0ef          	jal	ra,804001fc <cprintf>
804027a8:	00097797          	auipc	a5,0x97
804027ac:	89878793          	addi	a5,a5,-1896 # 80499040 <slobfree>
804027b0:	0007a583          	lw	a1,0(a5)
804027b4:	00000613          	li	a2,0
804027b8:	00058463          	beqz	a1,804027c0 <slob_init+0x74>
804027bc:	0045a603          	lw	a2,4(a1) # 1004 <_binary_bin_swap_img_size-0x6ffc>
804027c0:	00812403          	lw	s0,8(sp)
804027c4:	00c12083          	lw	ra,12(sp)
804027c8:	00012517          	auipc	a0,0x12
804027cc:	9d050513          	addi	a0,a0,-1584 # 80414198 <default_pmm_manager+0x13c>
804027d0:	01010113          	addi	sp,sp,16
804027d4:	a29fd06f          	j	804001fc <cprintf>

804027d8 <kmalloc_init>:
804027d8:	ff010113          	addi	sp,sp,-16
804027dc:	00112623          	sw	ra,12(sp)
804027e0:	f6dff0ef          	jal	ra,8040274c <slob_init>
804027e4:	00c12083          	lw	ra,12(sp)
804027e8:	00012517          	auipc	a0,0x12
804027ec:	91c50513          	addi	a0,a0,-1764 # 80414104 <default_pmm_manager+0xa8>
804027f0:	01010113          	addi	sp,sp,16
804027f4:	a09fd06f          	j	804001fc <cprintf>

804027f8 <kallocated>:
804027f8:	00000513          	li	a0,0
804027fc:	00008067          	ret

80402800 <kmalloc>:
80402800:	ff010113          	addi	sp,sp,-16
80402804:	01212023          	sw	s2,0(sp)
80402808:	00001937          	lui	s2,0x1
8040280c:	00812423          	sw	s0,8(sp)
80402810:	00112623          	sw	ra,12(sp)
80402814:	00912223          	sw	s1,4(sp)
80402818:	ff790793          	addi	a5,s2,-9 # ff7 <_binary_bin_swap_img_size-0x7009>
8040281c:	00050413          	mv	s0,a0
80402820:	08a7f263          	bgeu	a5,a0,804028a4 <kmalloc+0xa4>
80402824:	00c00513          	li	a0,12
80402828:	db1ff0ef          	jal	ra,804025d8 <slob_alloc.isra.1.constprop.3>
8040282c:	00050493          	mv	s1,a0
80402830:	08050263          	beqz	a0,804028b4 <kmalloc+0xb4>
80402834:	00040793          	mv	a5,s0
80402838:	00000513          	li	a0,0
8040283c:	00895a63          	bge	s2,s0,80402850 <kmalloc+0x50>
80402840:	00001737          	lui	a4,0x1
80402844:	4017d793          	srai	a5,a5,0x1
80402848:	00150513          	addi	a0,a0,1
8040284c:	fef74ce3          	blt	a4,a5,80402844 <kmalloc+0x44>
80402850:	00a4a023          	sw	a0,0(s1)
80402854:	cf5ff0ef          	jal	ra,80402548 <__slob_get_free_pages.isra.0>
80402858:	00a4a223          	sw	a0,4(s1)
8040285c:	00050413          	mv	s0,a0
80402860:	0a050a63          	beqz	a0,80402914 <kmalloc+0x114>
80402864:	100027f3          	csrr	a5,sstatus
80402868:	0027f793          	andi	a5,a5,2
8040286c:	06079463          	bnez	a5,804028d4 <kmalloc+0xd4>
80402870:	0009a797          	auipc	a5,0x9a
80402874:	f2478793          	addi	a5,a5,-220 # 8049c794 <bigblocks>
80402878:	0007a783          	lw	a5,0(a5)
8040287c:	0009a717          	auipc	a4,0x9a
80402880:	f0972c23          	sw	s1,-232(a4) # 8049c794 <bigblocks>
80402884:	00f4a423          	sw	a5,8(s1)
80402888:	00040513          	mv	a0,s0
8040288c:	00c12083          	lw	ra,12(sp)
80402890:	00812403          	lw	s0,8(sp)
80402894:	00412483          	lw	s1,4(sp)
80402898:	00012903          	lw	s2,0(sp)
8040289c:	01010113          	addi	sp,sp,16
804028a0:	00008067          	ret
804028a4:	00850513          	addi	a0,a0,8
804028a8:	d31ff0ef          	jal	ra,804025d8 <slob_alloc.isra.1.constprop.3>
804028ac:	00850413          	addi	s0,a0,8
804028b0:	fc051ce3          	bnez	a0,80402888 <kmalloc+0x88>
804028b4:	00000413          	li	s0,0
804028b8:	00040513          	mv	a0,s0
804028bc:	00c12083          	lw	ra,12(sp)
804028c0:	00812403          	lw	s0,8(sp)
804028c4:	00412483          	lw	s1,4(sp)
804028c8:	00012903          	lw	s2,0(sp)
804028cc:	01010113          	addi	sp,sp,16
804028d0:	00008067          	ret
804028d4:	b58fe0ef          	jal	ra,80400c2c <intr_disable>
804028d8:	0009a797          	auipc	a5,0x9a
804028dc:	ebc78793          	addi	a5,a5,-324 # 8049c794 <bigblocks>
804028e0:	0007a783          	lw	a5,0(a5)
804028e4:	0009a717          	auipc	a4,0x9a
804028e8:	ea972823          	sw	s1,-336(a4) # 8049c794 <bigblocks>
804028ec:	00f4a423          	sw	a5,8(s1)
804028f0:	b34fe0ef          	jal	ra,80400c24 <intr_enable>
804028f4:	0044a403          	lw	s0,4(s1)
804028f8:	00c12083          	lw	ra,12(sp)
804028fc:	00412483          	lw	s1,4(sp)
80402900:	00040513          	mv	a0,s0
80402904:	00812403          	lw	s0,8(sp)
80402908:	00012903          	lw	s2,0(sp)
8040290c:	01010113          	addi	sp,sp,16
80402910:	00008067          	ret
80402914:	00c00593          	li	a1,12
80402918:	00048513          	mv	a0,s1
8040291c:	a8dff0ef          	jal	ra,804023a8 <slob_free>
80402920:	f69ff06f          	j	80402888 <kmalloc+0x88>

80402924 <kfree>:
80402924:	14050863          	beqz	a0,80402a74 <kfree+0x150>
80402928:	ff010113          	addi	sp,sp,-16
8040292c:	00912223          	sw	s1,4(sp)
80402930:	00112623          	sw	ra,12(sp)
80402934:	00812423          	sw	s0,8(sp)
80402938:	01451793          	slli	a5,a0,0x14
8040293c:	00050493          	mv	s1,a0
80402940:	04079863          	bnez	a5,80402990 <kfree+0x6c>
80402944:	100027f3          	csrr	a5,sstatus
80402948:	0027f793          	andi	a5,a5,2
8040294c:	0e079263          	bnez	a5,80402a30 <kfree+0x10c>
80402950:	0009a797          	auipc	a5,0x9a
80402954:	e4478793          	addi	a5,a5,-444 # 8049c794 <bigblocks>
80402958:	0007a683          	lw	a3,0(a5)
8040295c:	02068a63          	beqz	a3,80402990 <kfree+0x6c>
80402960:	0046a783          	lw	a5,4(a3)
80402964:	0086a403          	lw	s0,8(a3)
80402968:	10f50863          	beq	a0,a5,80402a78 <kfree+0x154>
8040296c:	00000613          	li	a2,0
80402970:	00040e63          	beqz	s0,8040298c <kfree+0x68>
80402974:	00442703          	lw	a4,4(s0)
80402978:	00842783          	lw	a5,8(s0)
8040297c:	02970863          	beq	a4,s1,804029ac <kfree+0x88>
80402980:	00040693          	mv	a3,s0
80402984:	00078413          	mv	s0,a5
80402988:	fe0416e3          	bnez	s0,80402974 <kfree+0x50>
8040298c:	0c061663          	bnez	a2,80402a58 <kfree+0x134>
80402990:	00812403          	lw	s0,8(sp)
80402994:	00c12083          	lw	ra,12(sp)
80402998:	ff848513          	addi	a0,s1,-8
8040299c:	00412483          	lw	s1,4(sp)
804029a0:	00000593          	li	a1,0
804029a4:	01010113          	addi	sp,sp,16
804029a8:	a01ff06f          	j	804023a8 <slob_free>
804029ac:	00f6a423          	sw	a5,8(a3)
804029b0:	0a061e63          	bnez	a2,80402a6c <kfree+0x148>
804029b4:	804007b7          	lui	a5,0x80400
804029b8:	00042703          	lw	a4,0(s0)
804029bc:	0cf4e663          	bltu	s1,a5,80402a88 <kfree+0x164>
804029c0:	0009a797          	auipc	a5,0x9a
804029c4:	e4478793          	addi	a5,a5,-444 # 8049c804 <va_pa_offset>
804029c8:	0007a683          	lw	a3,0(a5)
804029cc:	0009a797          	auipc	a5,0x9a
804029d0:	dd078793          	addi	a5,a5,-560 # 8049c79c <npage>
804029d4:	0007a783          	lw	a5,0(a5)
804029d8:	40d484b3          	sub	s1,s1,a3
804029dc:	00c4d493          	srli	s1,s1,0xc
804029e0:	0cf4f263          	bgeu	s1,a5,80402aa4 <kfree+0x180>
804029e4:	00014797          	auipc	a5,0x14
804029e8:	47c78793          	addi	a5,a5,1148 # 80416e60 <nbase>
804029ec:	0007a783          	lw	a5,0(a5)
804029f0:	0009a697          	auipc	a3,0x9a
804029f4:	e1c68693          	addi	a3,a3,-484 # 8049c80c <pages>
804029f8:	0006a503          	lw	a0,0(a3)
804029fc:	40f484b3          	sub	s1,s1,a5
80402a00:	00549493          	slli	s1,s1,0x5
80402a04:	00100593          	li	a1,1
80402a08:	00950533          	add	a0,a0,s1
80402a0c:	00e595b3          	sll	a1,a1,a4
80402a10:	238000ef          	jal	ra,80402c48 <free_pages>
80402a14:	00040513          	mv	a0,s0
80402a18:	00812403          	lw	s0,8(sp)
80402a1c:	00c12083          	lw	ra,12(sp)
80402a20:	00412483          	lw	s1,4(sp)
80402a24:	00c00593          	li	a1,12
80402a28:	01010113          	addi	sp,sp,16
80402a2c:	97dff06f          	j	804023a8 <slob_free>
80402a30:	9fcfe0ef          	jal	ra,80400c2c <intr_disable>
80402a34:	0009a797          	auipc	a5,0x9a
80402a38:	d6078793          	addi	a5,a5,-672 # 8049c794 <bigblocks>
80402a3c:	0007a683          	lw	a3,0(a5)
80402a40:	00068c63          	beqz	a3,80402a58 <kfree+0x134>
80402a44:	0046a783          	lw	a5,4(a3)
80402a48:	0086a403          	lw	s0,8(a3)
80402a4c:	00f48a63          	beq	s1,a5,80402a60 <kfree+0x13c>
80402a50:	00100613          	li	a2,1
80402a54:	f1dff06f          	j	80402970 <kfree+0x4c>
80402a58:	9ccfe0ef          	jal	ra,80400c24 <intr_enable>
80402a5c:	f35ff06f          	j	80402990 <kfree+0x6c>
80402a60:	0009a797          	auipc	a5,0x9a
80402a64:	d287aa23          	sw	s0,-716(a5) # 8049c794 <bigblocks>
80402a68:	00068413          	mv	s0,a3
80402a6c:	9b8fe0ef          	jal	ra,80400c24 <intr_enable>
80402a70:	f45ff06f          	j	804029b4 <kfree+0x90>
80402a74:	00008067          	ret
80402a78:	0009a797          	auipc	a5,0x9a
80402a7c:	d087ae23          	sw	s0,-740(a5) # 8049c794 <bigblocks>
80402a80:	00068413          	mv	s0,a3
80402a84:	f31ff06f          	j	804029b4 <kfree+0x90>
80402a88:	00048693          	mv	a3,s1
80402a8c:	00011617          	auipc	a2,0x11
80402a90:	63460613          	addi	a2,a2,1588 # 804140c0 <default_pmm_manager+0x64>
80402a94:	07000593          	li	a1,112
80402a98:	00011517          	auipc	a0,0x11
80402a9c:	61850513          	addi	a0,a0,1560 # 804140b0 <default_pmm_manager+0x54>
80402aa0:	b85fd0ef          	jal	ra,80400624 <__panic>
80402aa4:	00011617          	auipc	a2,0x11
80402aa8:	64060613          	addi	a2,a2,1600 # 804140e4 <default_pmm_manager+0x88>
80402aac:	06900593          	li	a1,105
80402ab0:	00011517          	auipc	a0,0x11
80402ab4:	60050513          	addi	a0,a0,1536 # 804140b0 <default_pmm_manager+0x54>
80402ab8:	b6dfd0ef          	jal	ra,80400624 <__panic>

80402abc <get_pgtable_items.isra.4.part.5>:
80402abc:	04a5f063          	bgeu	a1,a0,80402afc <get_pgtable_items.isra.4.part.5+0x40>
80402ac0:	00259813          	slli	a6,a1,0x2
80402ac4:	010608b3          	add	a7,a2,a6
80402ac8:	0008a783          	lw	a5,0(a7)
80402acc:	0017f793          	andi	a5,a5,1
80402ad0:	02079c63          	bnez	a5,80402b08 <get_pgtable_items.isra.4.part.5+0x4c>
80402ad4:	00480813          	addi	a6,a6,4
80402ad8:	01060833          	add	a6,a2,a6
80402adc:	0140006f          	j	80402af0 <get_pgtable_items.isra.4.part.5+0x34>
80402ae0:	00082783          	lw	a5,0(a6)
80402ae4:	00480813          	addi	a6,a6,4
80402ae8:	0017f793          	andi	a5,a5,1
80402aec:	00079e63          	bnez	a5,80402b08 <get_pgtable_items.isra.4.part.5+0x4c>
80402af0:	00158593          	addi	a1,a1,1
80402af4:	00080893          	mv	a7,a6
80402af8:	fea594e3          	bne	a1,a0,80402ae0 <get_pgtable_items.isra.4.part.5+0x24>
80402afc:	00000693          	li	a3,0
80402b00:	00068513          	mv	a0,a3
80402b04:	00008067          	ret
80402b08:	00b6a023          	sw	a1,0(a3)
80402b0c:	0008a683          	lw	a3,0(a7)
80402b10:	00158593          	addi	a1,a1,1
80402b14:	01f6f693          	andi	a3,a3,31
80402b18:	02a5fe63          	bgeu	a1,a0,80402b54 <get_pgtable_items.isra.4.part.5+0x98>
80402b1c:	00259793          	slli	a5,a1,0x2
80402b20:	00f60833          	add	a6,a2,a5
80402b24:	00082803          	lw	a6,0(a6)
80402b28:	ffc78793          	addi	a5,a5,-4
80402b2c:	00f60633          	add	a2,a2,a5
80402b30:	01f87813          	andi	a6,a6,31
80402b34:	00d80c63          	beq	a6,a3,80402b4c <get_pgtable_items.isra.4.part.5+0x90>
80402b38:	01c0006f          	j	80402b54 <get_pgtable_items.isra.4.part.5+0x98>
80402b3c:	00862783          	lw	a5,8(a2)
80402b40:	00460613          	addi	a2,a2,4
80402b44:	01f7f793          	andi	a5,a5,31
80402b48:	00d79663          	bne	a5,a3,80402b54 <get_pgtable_items.isra.4.part.5+0x98>
80402b4c:	00158593          	addi	a1,a1,1
80402b50:	fea5e6e3          	bltu	a1,a0,80402b3c <get_pgtable_items.isra.4.part.5+0x80>
80402b54:	00b72023          	sw	a1,0(a4)
80402b58:	00068513          	mv	a0,a3
80402b5c:	00008067          	ret

80402b60 <pa2page.part.6>:
80402b60:	ff010113          	addi	sp,sp,-16
80402b64:	00011617          	auipc	a2,0x11
80402b68:	58060613          	addi	a2,a2,1408 # 804140e4 <default_pmm_manager+0x88>
80402b6c:	06900593          	li	a1,105
80402b70:	00011517          	auipc	a0,0x11
80402b74:	54050513          	addi	a0,a0,1344 # 804140b0 <default_pmm_manager+0x54>
80402b78:	00112623          	sw	ra,12(sp)
80402b7c:	aa9fd0ef          	jal	ra,80400624 <__panic>

80402b80 <alloc_pages>:
80402b80:	fd010113          	addi	sp,sp,-48
80402b84:	02812423          	sw	s0,40(sp)
80402b88:	02912223          	sw	s1,36(sp)
80402b8c:	03212023          	sw	s2,32(sp)
80402b90:	01312e23          	sw	s3,28(sp)
80402b94:	01412c23          	sw	s4,24(sp)
80402b98:	02112623          	sw	ra,44(sp)
80402b9c:	00050413          	mv	s0,a0
80402ba0:	0009a497          	auipc	s1,0x9a
80402ba4:	c6048493          	addi	s1,s1,-928 # 8049c800 <pmm_manager>
80402ba8:	00100913          	li	s2,1
80402bac:	0009a997          	auipc	s3,0x9a
80402bb0:	bfc98993          	addi	s3,s3,-1028 # 8049c7a8 <swap_init_ok>
80402bb4:	0009aa17          	auipc	s4,0x9a
80402bb8:	d00a0a13          	addi	s4,s4,-768 # 8049c8b4 <check_mm_struct>
80402bbc:	0300006f          	j	80402bec <alloc_pages+0x6c>
80402bc0:	0004a783          	lw	a5,0(s1)
80402bc4:	00c7a783          	lw	a5,12(a5)
80402bc8:	000780e7          	jalr	a5
80402bcc:	00000613          	li	a2,0
80402bd0:	00040593          	mv	a1,s0
80402bd4:	04051a63          	bnez	a0,80402c28 <alloc_pages+0xa8>
80402bd8:	04896863          	bltu	s2,s0,80402c28 <alloc_pages+0xa8>
80402bdc:	0009a783          	lw	a5,0(s3)
80402be0:	04078463          	beqz	a5,80402c28 <alloc_pages+0xa8>
80402be4:	000a2503          	lw	a0,0(s4)
80402be8:	1c5010ef          	jal	ra,804045ac <swap_out>
80402bec:	100027f3          	csrr	a5,sstatus
80402bf0:	0027f793          	andi	a5,a5,2
80402bf4:	00040513          	mv	a0,s0
80402bf8:	fc0784e3          	beqz	a5,80402bc0 <alloc_pages+0x40>
80402bfc:	830fe0ef          	jal	ra,80400c2c <intr_disable>
80402c00:	0004a783          	lw	a5,0(s1)
80402c04:	00040513          	mv	a0,s0
80402c08:	00c7a783          	lw	a5,12(a5)
80402c0c:	000780e7          	jalr	a5
80402c10:	00a12623          	sw	a0,12(sp)
80402c14:	810fe0ef          	jal	ra,80400c24 <intr_enable>
80402c18:	00c12503          	lw	a0,12(sp)
80402c1c:	00000613          	li	a2,0
80402c20:	00040593          	mv	a1,s0
80402c24:	fa050ae3          	beqz	a0,80402bd8 <alloc_pages+0x58>
80402c28:	02c12083          	lw	ra,44(sp)
80402c2c:	02812403          	lw	s0,40(sp)
80402c30:	02412483          	lw	s1,36(sp)
80402c34:	02012903          	lw	s2,32(sp)
80402c38:	01c12983          	lw	s3,28(sp)
80402c3c:	01812a03          	lw	s4,24(sp)
80402c40:	03010113          	addi	sp,sp,48
80402c44:	00008067          	ret

80402c48 <free_pages>:
80402c48:	100027f3          	csrr	a5,sstatus
80402c4c:	0027f793          	andi	a5,a5,2
80402c50:	00079c63          	bnez	a5,80402c68 <free_pages+0x20>
80402c54:	0009a797          	auipc	a5,0x9a
80402c58:	bac78793          	addi	a5,a5,-1108 # 8049c800 <pmm_manager>
80402c5c:	0007a783          	lw	a5,0(a5)
80402c60:	0107a303          	lw	t1,16(a5)
80402c64:	00030067          	jr	t1
80402c68:	ff010113          	addi	sp,sp,-16
80402c6c:	00112623          	sw	ra,12(sp)
80402c70:	00812423          	sw	s0,8(sp)
80402c74:	00912223          	sw	s1,4(sp)
80402c78:	00050413          	mv	s0,a0
80402c7c:	00058493          	mv	s1,a1
80402c80:	fadfd0ef          	jal	ra,80400c2c <intr_disable>
80402c84:	0009a797          	auipc	a5,0x9a
80402c88:	b7c78793          	addi	a5,a5,-1156 # 8049c800 <pmm_manager>
80402c8c:	0007a783          	lw	a5,0(a5)
80402c90:	00048593          	mv	a1,s1
80402c94:	00040513          	mv	a0,s0
80402c98:	0107a783          	lw	a5,16(a5)
80402c9c:	000780e7          	jalr	a5
80402ca0:	00812403          	lw	s0,8(sp)
80402ca4:	00c12083          	lw	ra,12(sp)
80402ca8:	00412483          	lw	s1,4(sp)
80402cac:	01010113          	addi	sp,sp,16
80402cb0:	f75fd06f          	j	80400c24 <intr_enable>

80402cb4 <nr_free_pages>:
80402cb4:	100027f3          	csrr	a5,sstatus
80402cb8:	0027f793          	andi	a5,a5,2
80402cbc:	00079c63          	bnez	a5,80402cd4 <nr_free_pages+0x20>
80402cc0:	0009a797          	auipc	a5,0x9a
80402cc4:	b4078793          	addi	a5,a5,-1216 # 8049c800 <pmm_manager>
80402cc8:	0007a783          	lw	a5,0(a5)
80402ccc:	0147a303          	lw	t1,20(a5)
80402cd0:	00030067          	jr	t1
80402cd4:	ff010113          	addi	sp,sp,-16
80402cd8:	00112623          	sw	ra,12(sp)
80402cdc:	00812423          	sw	s0,8(sp)
80402ce0:	f4dfd0ef          	jal	ra,80400c2c <intr_disable>
80402ce4:	0009a797          	auipc	a5,0x9a
80402ce8:	b1c78793          	addi	a5,a5,-1252 # 8049c800 <pmm_manager>
80402cec:	0007a783          	lw	a5,0(a5)
80402cf0:	0147a783          	lw	a5,20(a5)
80402cf4:	000780e7          	jalr	a5
80402cf8:	00050413          	mv	s0,a0
80402cfc:	f29fd0ef          	jal	ra,80400c24 <intr_enable>
80402d00:	00040513          	mv	a0,s0
80402d04:	00c12083          	lw	ra,12(sp)
80402d08:	00812403          	lw	s0,8(sp)
80402d0c:	01010113          	addi	sp,sp,16
80402d10:	00008067          	ret

80402d14 <get_pte>:
80402d14:	fe010113          	addi	sp,sp,-32
80402d18:	01212823          	sw	s2,16(sp)
80402d1c:	0165d913          	srli	s2,a1,0x16
80402d20:	00291913          	slli	s2,s2,0x2
80402d24:	01250933          	add	s2,a0,s2
80402d28:	00092683          	lw	a3,0(s2)
80402d2c:	00912a23          	sw	s1,20(sp)
80402d30:	01312623          	sw	s3,12(sp)
80402d34:	00112e23          	sw	ra,28(sp)
80402d38:	00812c23          	sw	s0,24(sp)
80402d3c:	01412423          	sw	s4,8(sp)
80402d40:	01512223          	sw	s5,4(sp)
80402d44:	0016f793          	andi	a5,a3,1
80402d48:	00058493          	mv	s1,a1
80402d4c:	0009a997          	auipc	s3,0x9a
80402d50:	a5098993          	addi	s3,s3,-1456 # 8049c79c <npage>
80402d54:	08079863          	bnez	a5,80402de4 <get_pte+0xd0>
80402d58:	0e060463          	beqz	a2,80402e40 <get_pte+0x12c>
80402d5c:	00100513          	li	a0,1
80402d60:	e21ff0ef          	jal	ra,80402b80 <alloc_pages>
80402d64:	00050413          	mv	s0,a0
80402d68:	0c050c63          	beqz	a0,80402e40 <get_pte+0x12c>
80402d6c:	0009aa97          	auipc	s5,0x9a
80402d70:	aa0a8a93          	addi	s5,s5,-1376 # 8049c80c <pages>
80402d74:	000aa503          	lw	a0,0(s5)
80402d78:	00100793          	li	a5,1
80402d7c:	00f42023          	sw	a5,0(s0)
80402d80:	40a40533          	sub	a0,s0,a0
80402d84:	40555513          	srai	a0,a0,0x5
80402d88:	00080a37          	lui	s4,0x80
80402d8c:	0009a997          	auipc	s3,0x9a
80402d90:	a1098993          	addi	s3,s3,-1520 # 8049c79c <npage>
80402d94:	01450533          	add	a0,a0,s4
80402d98:	0009a703          	lw	a4,0(s3)
80402d9c:	00c51793          	slli	a5,a0,0xc
80402da0:	00c7d793          	srli	a5,a5,0xc
80402da4:	00c51513          	slli	a0,a0,0xc
80402da8:	0ae7fc63          	bgeu	a5,a4,80402e60 <get_pte+0x14c>
80402dac:	0009a797          	auipc	a5,0x9a
80402db0:	a5878793          	addi	a5,a5,-1448 # 8049c804 <va_pa_offset>
80402db4:	0007a783          	lw	a5,0(a5)
80402db8:	00001637          	lui	a2,0x1
80402dbc:	00000593          	li	a1,0
80402dc0:	00f50533          	add	a0,a0,a5
80402dc4:	5ec100ef          	jal	ra,804133b0 <memset>
80402dc8:	000aa683          	lw	a3,0(s5)
80402dcc:	40d406b3          	sub	a3,s0,a3
80402dd0:	4056d693          	srai	a3,a3,0x5
80402dd4:	014686b3          	add	a3,a3,s4
80402dd8:	00a69693          	slli	a3,a3,0xa
80402ddc:	0d16e693          	ori	a3,a3,209
80402de0:	00d92023          	sw	a3,0(s2)
80402de4:	00269693          	slli	a3,a3,0x2
80402de8:	fffff537          	lui	a0,0xfffff
80402dec:	0009a703          	lw	a4,0(s3)
80402df0:	00a6f6b3          	and	a3,a3,a0
80402df4:	00c6d793          	srli	a5,a3,0xc
80402df8:	04e7f863          	bgeu	a5,a4,80402e48 <get_pte+0x134>
80402dfc:	0009a797          	auipc	a5,0x9a
80402e00:	a0878793          	addi	a5,a5,-1528 # 8049c804 <va_pa_offset>
80402e04:	0007a503          	lw	a0,0(a5)
80402e08:	00c4d493          	srli	s1,s1,0xc
80402e0c:	3ff4f493          	andi	s1,s1,1023
80402e10:	00a686b3          	add	a3,a3,a0
80402e14:	00249513          	slli	a0,s1,0x2
80402e18:	00a68533          	add	a0,a3,a0
80402e1c:	01c12083          	lw	ra,28(sp)
80402e20:	01812403          	lw	s0,24(sp)
80402e24:	01412483          	lw	s1,20(sp)
80402e28:	01012903          	lw	s2,16(sp)
80402e2c:	00c12983          	lw	s3,12(sp)
80402e30:	00812a03          	lw	s4,8(sp)
80402e34:	00412a83          	lw	s5,4(sp)
80402e38:	02010113          	addi	sp,sp,32
80402e3c:	00008067          	ret
80402e40:	00000513          	li	a0,0
80402e44:	fd9ff06f          	j	80402e1c <get_pte+0x108>
80402e48:	00011617          	auipc	a2,0x11
80402e4c:	24460613          	addi	a2,a2,580 # 8041408c <default_pmm_manager+0x30>
80402e50:	12200593          	li	a1,290
80402e54:	00011517          	auipc	a0,0x11
80402e58:	3e450513          	addi	a0,a0,996 # 80414238 <default_pmm_manager+0x1dc>
80402e5c:	fc8fd0ef          	jal	ra,80400624 <__panic>
80402e60:	00050693          	mv	a3,a0
80402e64:	00011617          	auipc	a2,0x11
80402e68:	22860613          	addi	a2,a2,552 # 8041408c <default_pmm_manager+0x30>
80402e6c:	11f00593          	li	a1,287
80402e70:	00011517          	auipc	a0,0x11
80402e74:	3c850513          	addi	a0,a0,968 # 80414238 <default_pmm_manager+0x1dc>
80402e78:	facfd0ef          	jal	ra,80400624 <__panic>

80402e7c <boot_map_segment>:
80402e7c:	000017b7          	lui	a5,0x1
80402e80:	fe010113          	addi	sp,sp,-32
80402e84:	00d5c833          	xor	a6,a1,a3
80402e88:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80402e8c:	00112e23          	sw	ra,28(sp)
80402e90:	00812c23          	sw	s0,24(sp)
80402e94:	00912a23          	sw	s1,20(sp)
80402e98:	01212823          	sw	s2,16(sp)
80402e9c:	01312623          	sw	s3,12(sp)
80402ea0:	01412423          	sw	s4,8(sp)
80402ea4:	01512223          	sw	s5,4(sp)
80402ea8:	00f87833          	and	a6,a6,a5
80402eac:	0a081463          	bnez	a6,80402f54 <boot_map_segment+0xd8>
80402eb0:	00f60633          	add	a2,a2,a5
80402eb4:	fffff937          	lui	s2,0xfffff
80402eb8:	00c65613          	srli	a2,a2,0xc
80402ebc:	0126f6b3          	and	a3,a3,s2
80402ec0:	00c61613          	slli	a2,a2,0xc
80402ec4:	00050993          	mv	s3,a0
80402ec8:	00070a13          	mv	s4,a4
80402ecc:	00058413          	mv	s0,a1
80402ed0:	00b604b3          	add	s1,a2,a1
80402ed4:	40b68933          	sub	s2,a3,a1
80402ed8:	00001ab7          	lui	s5,0x1
80402edc:	00100613          	li	a2,1
80402ee0:	00040593          	mv	a1,s0
80402ee4:	00098513          	mv	a0,s3
80402ee8:	e2dff0ef          	jal	ra,80402d14 <get_pte>
80402eec:	008907b3          	add	a5,s2,s0
80402ef0:	04050263          	beqz	a0,80402f34 <boot_map_segment+0xb8>
80402ef4:	00c7d793          	srli	a5,a5,0xc
80402ef8:	00a79793          	slli	a5,a5,0xa
80402efc:	0147e7b3          	or	a5,a5,s4
80402f00:	0c17e793          	ori	a5,a5,193
80402f04:	00f52023          	sw	a5,0(a0)
80402f08:	01540433          	add	s0,s0,s5
80402f0c:	fc8498e3          	bne	s1,s0,80402edc <boot_map_segment+0x60>
80402f10:	01c12083          	lw	ra,28(sp)
80402f14:	01812403          	lw	s0,24(sp)
80402f18:	01412483          	lw	s1,20(sp)
80402f1c:	01012903          	lw	s2,16(sp)
80402f20:	00c12983          	lw	s3,12(sp)
80402f24:	00812a03          	lw	s4,8(sp)
80402f28:	00412a83          	lw	s5,4(sp)
80402f2c:	02010113          	addi	sp,sp,32
80402f30:	00008067          	ret
80402f34:	00011697          	auipc	a3,0x11
80402f38:	2a468693          	addi	a3,a3,676 # 804141d8 <default_pmm_manager+0x17c>
80402f3c:	00011617          	auipc	a2,0x11
80402f40:	8a460613          	addi	a2,a2,-1884 # 804137e0 <commands+0x1bc>
80402f44:	0aa00593          	li	a1,170
80402f48:	00011517          	auipc	a0,0x11
80402f4c:	2f050513          	addi	a0,a0,752 # 80414238 <default_pmm_manager+0x1dc>
80402f50:	ed4fd0ef          	jal	ra,80400624 <__panic>
80402f54:	00011697          	auipc	a3,0x11
80402f58:	26c68693          	addi	a3,a3,620 # 804141c0 <default_pmm_manager+0x164>
80402f5c:	00011617          	auipc	a2,0x11
80402f60:	88460613          	addi	a2,a2,-1916 # 804137e0 <commands+0x1bc>
80402f64:	0a400593          	li	a1,164
80402f68:	00011517          	auipc	a0,0x11
80402f6c:	2d050513          	addi	a0,a0,720 # 80414238 <default_pmm_manager+0x1dc>
80402f70:	eb4fd0ef          	jal	ra,80400624 <__panic>

80402f74 <unmap_range>:
80402f74:	fd010113          	addi	sp,sp,-48
80402f78:	00c5e7b3          	or	a5,a1,a2
80402f7c:	02112623          	sw	ra,44(sp)
80402f80:	02812423          	sw	s0,40(sp)
80402f84:	02912223          	sw	s1,36(sp)
80402f88:	03212023          	sw	s2,32(sp)
80402f8c:	01312e23          	sw	s3,28(sp)
80402f90:	01412c23          	sw	s4,24(sp)
80402f94:	01512a23          	sw	s5,20(sp)
80402f98:	01612823          	sw	s6,16(sp)
80402f9c:	01712623          	sw	s7,12(sp)
80402fa0:	01812423          	sw	s8,8(sp)
80402fa4:	01912223          	sw	s9,4(sp)
80402fa8:	01479713          	slli	a4,a5,0x14
80402fac:	12071463          	bnez	a4,804030d4 <unmap_range+0x160>
80402fb0:	002007b7          	lui	a5,0x200
80402fb4:	00058413          	mv	s0,a1
80402fb8:	0ef5ee63          	bltu	a1,a5,804030b4 <unmap_range+0x140>
80402fbc:	00060913          	mv	s2,a2
80402fc0:	0ec5fa63          	bgeu	a1,a2,804030b4 <unmap_range+0x140>
80402fc4:	800007b7          	lui	a5,0x80000
80402fc8:	0ec7e663          	bltu	a5,a2,804030b4 <unmap_range+0x140>
80402fcc:	00050993          	mv	s3,a0
80402fd0:	00001a37          	lui	s4,0x1
80402fd4:	00099c97          	auipc	s9,0x99
80402fd8:	7c8c8c93          	addi	s9,s9,1992 # 8049c79c <npage>
80402fdc:	0009ac17          	auipc	s8,0x9a
80402fe0:	830c0c13          	addi	s8,s8,-2000 # 8049c80c <pages>
80402fe4:	fff80bb7          	lui	s7,0xfff80
80402fe8:	00400b37          	lui	s6,0x400
80402fec:	ffc00ab7          	lui	s5,0xffc00
80402ff0:	00000613          	li	a2,0
80402ff4:	00040593          	mv	a1,s0
80402ff8:	00098513          	mv	a0,s3
80402ffc:	d19ff0ef          	jal	ra,80402d14 <get_pte>
80403000:	00050493          	mv	s1,a0
80403004:	08050863          	beqz	a0,80403094 <unmap_range+0x120>
80403008:	00052783          	lw	a5,0(a0)
8040300c:	04079063          	bnez	a5,8040304c <unmap_range+0xd8>
80403010:	01440433          	add	s0,s0,s4
80403014:	fd246ee3          	bltu	s0,s2,80402ff0 <unmap_range+0x7c>
80403018:	02c12083          	lw	ra,44(sp)
8040301c:	02812403          	lw	s0,40(sp)
80403020:	02412483          	lw	s1,36(sp)
80403024:	02012903          	lw	s2,32(sp)
80403028:	01c12983          	lw	s3,28(sp)
8040302c:	01812a03          	lw	s4,24(sp)
80403030:	01412a83          	lw	s5,20(sp)
80403034:	01012b03          	lw	s6,16(sp)
80403038:	00c12b83          	lw	s7,12(sp)
8040303c:	00812c03          	lw	s8,8(sp)
80403040:	00412c83          	lw	s9,4(sp)
80403044:	03010113          	addi	sp,sp,48
80403048:	00008067          	ret
8040304c:	0017f713          	andi	a4,a5,1
80403050:	fc0700e3          	beqz	a4,80403010 <unmap_range+0x9c>
80403054:	000ca703          	lw	a4,0(s9)
80403058:	00279793          	slli	a5,a5,0x2
8040305c:	00c7d793          	srli	a5,a5,0xc
80403060:	08e7fa63          	bgeu	a5,a4,804030f4 <unmap_range+0x180>
80403064:	000c2503          	lw	a0,0(s8)
80403068:	017787b3          	add	a5,a5,s7
8040306c:	00579793          	slli	a5,a5,0x5
80403070:	00f50533          	add	a0,a0,a5
80403074:	00052783          	lw	a5,0(a0)
80403078:	fff78793          	addi	a5,a5,-1 # 7fffffff <end+0xffb6373f>
8040307c:	00f52023          	sw	a5,0(a0)
80403080:	02078463          	beqz	a5,804030a8 <unmap_range+0x134>
80403084:	0004a023          	sw	zero,0(s1)
80403088:	12040073          	sfence.vma	s0
8040308c:	01440433          	add	s0,s0,s4
80403090:	f85ff06f          	j	80403014 <unmap_range+0xa0>
80403094:	01640433          	add	s0,s0,s6
80403098:	01547433          	and	s0,s0,s5
8040309c:	f6040ee3          	beqz	s0,80403018 <unmap_range+0xa4>
804030a0:	f52468e3          	bltu	s0,s2,80402ff0 <unmap_range+0x7c>
804030a4:	f75ff06f          	j	80403018 <unmap_range+0xa4>
804030a8:	00100593          	li	a1,1
804030ac:	b9dff0ef          	jal	ra,80402c48 <free_pages>
804030b0:	fd5ff06f          	j	80403084 <unmap_range+0x110>
804030b4:	00011697          	auipc	a3,0x11
804030b8:	2f468693          	addi	a3,a3,756 # 804143a8 <default_pmm_manager+0x34c>
804030bc:	00010617          	auipc	a2,0x10
804030c0:	72460613          	addi	a2,a2,1828 # 804137e0 <commands+0x1bc>
804030c4:	15a00593          	li	a1,346
804030c8:	00011517          	auipc	a0,0x11
804030cc:	17050513          	addi	a0,a0,368 # 80414238 <default_pmm_manager+0x1dc>
804030d0:	d54fd0ef          	jal	ra,80400624 <__panic>
804030d4:	00011697          	auipc	a3,0x11
804030d8:	2a868693          	addi	a3,a3,680 # 8041437c <default_pmm_manager+0x320>
804030dc:	00010617          	auipc	a2,0x10
804030e0:	70460613          	addi	a2,a2,1796 # 804137e0 <commands+0x1bc>
804030e4:	15900593          	li	a1,345
804030e8:	00011517          	auipc	a0,0x11
804030ec:	15050513          	addi	a0,a0,336 # 80414238 <default_pmm_manager+0x1dc>
804030f0:	d34fd0ef          	jal	ra,80400624 <__panic>
804030f4:	a6dff0ef          	jal	ra,80402b60 <pa2page.part.6>

804030f8 <exit_range>:
804030f8:	fd010113          	addi	sp,sp,-48
804030fc:	00c5e7b3          	or	a5,a1,a2
80403100:	02112623          	sw	ra,44(sp)
80403104:	02812423          	sw	s0,40(sp)
80403108:	02912223          	sw	s1,36(sp)
8040310c:	03212023          	sw	s2,32(sp)
80403110:	01312e23          	sw	s3,28(sp)
80403114:	01412c23          	sw	s4,24(sp)
80403118:	01512a23          	sw	s5,20(sp)
8040311c:	01612823          	sw	s6,16(sp)
80403120:	01712623          	sw	s7,12(sp)
80403124:	01479713          	slli	a4,a5,0x14
80403128:	0e071c63          	bnez	a4,80403220 <exit_range+0x128>
8040312c:	002007b7          	lui	a5,0x200
80403130:	0cf5e863          	bltu	a1,a5,80403200 <exit_range+0x108>
80403134:	00060913          	mv	s2,a2
80403138:	0cc5f463          	bgeu	a1,a2,80403200 <exit_range+0x108>
8040313c:	ffc004b7          	lui	s1,0xffc00
80403140:	800007b7          	lui	a5,0x80000
80403144:	0095f4b3          	and	s1,a1,s1
80403148:	0ac7ec63          	bltu	a5,a2,80403200 <exit_range+0x108>
8040314c:	00050a13          	mv	s4,a0
80403150:	00099b17          	auipc	s6,0x99
80403154:	64cb0b13          	addi	s6,s6,1612 # 8049c79c <npage>
80403158:	00099b97          	auipc	s7,0x99
8040315c:	6b4b8b93          	addi	s7,s7,1716 # 8049c80c <pages>
80403160:	fff809b7          	lui	s3,0xfff80
80403164:	00400ab7          	lui	s5,0x400
80403168:	0080006f          	j	80403170 <exit_range+0x78>
8040316c:	0524f863          	bgeu	s1,s2,804031bc <exit_range+0xc4>
80403170:	0164d413          	srli	s0,s1,0x16
80403174:	00241413          	slli	s0,s0,0x2
80403178:	008a0433          	add	s0,s4,s0
8040317c:	00042783          	lw	a5,0(s0)
80403180:	0017f713          	andi	a4,a5,1
80403184:	02070863          	beqz	a4,804031b4 <exit_range+0xbc>
80403188:	000b2703          	lw	a4,0(s6)
8040318c:	00279793          	slli	a5,a5,0x2
80403190:	00c7d793          	srli	a5,a5,0xc
80403194:	04e7fa63          	bgeu	a5,a4,804031e8 <exit_range+0xf0>
80403198:	000ba503          	lw	a0,0(s7)
8040319c:	013787b3          	add	a5,a5,s3
804031a0:	00579793          	slli	a5,a5,0x5
804031a4:	00100593          	li	a1,1
804031a8:	00f50533          	add	a0,a0,a5
804031ac:	a9dff0ef          	jal	ra,80402c48 <free_pages>
804031b0:	00042023          	sw	zero,0(s0)
804031b4:	015484b3          	add	s1,s1,s5
804031b8:	fa049ae3          	bnez	s1,8040316c <exit_range+0x74>
804031bc:	02c12083          	lw	ra,44(sp)
804031c0:	02812403          	lw	s0,40(sp)
804031c4:	02412483          	lw	s1,36(sp)
804031c8:	02012903          	lw	s2,32(sp)
804031cc:	01c12983          	lw	s3,28(sp)
804031d0:	01812a03          	lw	s4,24(sp)
804031d4:	01412a83          	lw	s5,20(sp)
804031d8:	01012b03          	lw	s6,16(sp)
804031dc:	00c12b83          	lw	s7,12(sp)
804031e0:	03010113          	addi	sp,sp,48
804031e4:	00008067          	ret
804031e8:	00011617          	auipc	a2,0x11
804031ec:	efc60613          	addi	a2,a2,-260 # 804140e4 <default_pmm_manager+0x88>
804031f0:	06900593          	li	a1,105
804031f4:	00011517          	auipc	a0,0x11
804031f8:	ebc50513          	addi	a0,a0,-324 # 804140b0 <default_pmm_manager+0x54>
804031fc:	c28fd0ef          	jal	ra,80400624 <__panic>
80403200:	00011697          	auipc	a3,0x11
80403204:	1a868693          	addi	a3,a3,424 # 804143a8 <default_pmm_manager+0x34c>
80403208:	00010617          	auipc	a2,0x10
8040320c:	5d860613          	addi	a2,a2,1496 # 804137e0 <commands+0x1bc>
80403210:	16b00593          	li	a1,363
80403214:	00011517          	auipc	a0,0x11
80403218:	02450513          	addi	a0,a0,36 # 80414238 <default_pmm_manager+0x1dc>
8040321c:	c08fd0ef          	jal	ra,80400624 <__panic>
80403220:	00011697          	auipc	a3,0x11
80403224:	15c68693          	addi	a3,a3,348 # 8041437c <default_pmm_manager+0x320>
80403228:	00010617          	auipc	a2,0x10
8040322c:	5b860613          	addi	a2,a2,1464 # 804137e0 <commands+0x1bc>
80403230:	16a00593          	li	a1,362
80403234:	00011517          	auipc	a0,0x11
80403238:	00450513          	addi	a0,a0,4 # 80414238 <default_pmm_manager+0x1dc>
8040323c:	be8fd0ef          	jal	ra,80400624 <__panic>

80403240 <page_remove>:
80403240:	ff010113          	addi	sp,sp,-16
80403244:	00000613          	li	a2,0
80403248:	00912223          	sw	s1,4(sp)
8040324c:	00112623          	sw	ra,12(sp)
80403250:	00812423          	sw	s0,8(sp)
80403254:	00058493          	mv	s1,a1
80403258:	abdff0ef          	jal	ra,80402d14 <get_pte>
8040325c:	00050a63          	beqz	a0,80403270 <page_remove+0x30>
80403260:	00052783          	lw	a5,0(a0)
80403264:	00050413          	mv	s0,a0
80403268:	0017f713          	andi	a4,a5,1
8040326c:	00071c63          	bnez	a4,80403284 <page_remove+0x44>
80403270:	00c12083          	lw	ra,12(sp)
80403274:	00812403          	lw	s0,8(sp)
80403278:	00412483          	lw	s1,4(sp)
8040327c:	01010113          	addi	sp,sp,16
80403280:	00008067          	ret
80403284:	00099717          	auipc	a4,0x99
80403288:	51870713          	addi	a4,a4,1304 # 8049c79c <npage>
8040328c:	00072703          	lw	a4,0(a4)
80403290:	00279793          	slli	a5,a5,0x2
80403294:	00c7d793          	srli	a5,a5,0xc
80403298:	04e7fc63          	bgeu	a5,a4,804032f0 <page_remove+0xb0>
8040329c:	00099717          	auipc	a4,0x99
804032a0:	57070713          	addi	a4,a4,1392 # 8049c80c <pages>
804032a4:	00072503          	lw	a0,0(a4)
804032a8:	fff80737          	lui	a4,0xfff80
804032ac:	00e787b3          	add	a5,a5,a4
804032b0:	00579793          	slli	a5,a5,0x5
804032b4:	00f50533          	add	a0,a0,a5
804032b8:	00052783          	lw	a5,0(a0)
804032bc:	fff78793          	addi	a5,a5,-1 # 7fffffff <end+0xffb6373f>
804032c0:	00f52023          	sw	a5,0(a0)
804032c4:	02078063          	beqz	a5,804032e4 <page_remove+0xa4>
804032c8:	00042023          	sw	zero,0(s0)
804032cc:	12048073          	sfence.vma	s1
804032d0:	00c12083          	lw	ra,12(sp)
804032d4:	00812403          	lw	s0,8(sp)
804032d8:	00412483          	lw	s1,4(sp)
804032dc:	01010113          	addi	sp,sp,16
804032e0:	00008067          	ret
804032e4:	00100593          	li	a1,1
804032e8:	961ff0ef          	jal	ra,80402c48 <free_pages>
804032ec:	fddff06f          	j	804032c8 <page_remove+0x88>
804032f0:	871ff0ef          	jal	ra,80402b60 <pa2page.part.6>

804032f4 <page_insert>:
804032f4:	fe010113          	addi	sp,sp,-32
804032f8:	01312623          	sw	s3,12(sp)
804032fc:	00060993          	mv	s3,a2
80403300:	00812c23          	sw	s0,24(sp)
80403304:	00100613          	li	a2,1
80403308:	00058413          	mv	s0,a1
8040330c:	00098593          	mv	a1,s3
80403310:	01212823          	sw	s2,16(sp)
80403314:	00112e23          	sw	ra,28(sp)
80403318:	00912a23          	sw	s1,20(sp)
8040331c:	01412423          	sw	s4,8(sp)
80403320:	00068913          	mv	s2,a3
80403324:	9f1ff0ef          	jal	ra,80402d14 <get_pte>
80403328:	0e050063          	beqz	a0,80403408 <page_insert+0x114>
8040332c:	00042683          	lw	a3,0(s0)
80403330:	00050493          	mv	s1,a0
80403334:	00168793          	addi	a5,a3,1
80403338:	00f42023          	sw	a5,0(s0)
8040333c:	00052783          	lw	a5,0(a0)
80403340:	0017f713          	andi	a4,a5,1
80403344:	04071c63          	bnez	a4,8040339c <page_insert+0xa8>
80403348:	00099797          	auipc	a5,0x99
8040334c:	4c478793          	addi	a5,a5,1220 # 8049c80c <pages>
80403350:	0007a703          	lw	a4,0(a5)
80403354:	40e40433          	sub	s0,s0,a4
80403358:	000806b7          	lui	a3,0x80
8040335c:	40545413          	srai	s0,s0,0x5
80403360:	00d40433          	add	s0,s0,a3
80403364:	00a41413          	slli	s0,s0,0xa
80403368:	01246433          	or	s0,s0,s2
8040336c:	0c146413          	ori	s0,s0,193
80403370:	0084a023          	sw	s0,0(s1) # ffc00000 <end+0x7f763740>
80403374:	12098073          	sfence.vma	s3
80403378:	00000513          	li	a0,0
8040337c:	01c12083          	lw	ra,28(sp)
80403380:	01812403          	lw	s0,24(sp)
80403384:	01412483          	lw	s1,20(sp)
80403388:	01012903          	lw	s2,16(sp)
8040338c:	00c12983          	lw	s3,12(sp)
80403390:	00812a03          	lw	s4,8(sp)
80403394:	02010113          	addi	sp,sp,32
80403398:	00008067          	ret
8040339c:	00099717          	auipc	a4,0x99
804033a0:	40070713          	addi	a4,a4,1024 # 8049c79c <npage>
804033a4:	00072703          	lw	a4,0(a4)
804033a8:	00279793          	slli	a5,a5,0x2
804033ac:	00c7d793          	srli	a5,a5,0xc
804033b0:	06e7f063          	bgeu	a5,a4,80403410 <page_insert+0x11c>
804033b4:	00099a17          	auipc	s4,0x99
804033b8:	458a0a13          	addi	s4,s4,1112 # 8049c80c <pages>
804033bc:	000a2703          	lw	a4,0(s4)
804033c0:	fff80537          	lui	a0,0xfff80
804033c4:	00a78533          	add	a0,a5,a0
804033c8:	00551513          	slli	a0,a0,0x5
804033cc:	00a70533          	add	a0,a4,a0
804033d0:	00a40e63          	beq	s0,a0,804033ec <page_insert+0xf8>
804033d4:	00052783          	lw	a5,0(a0) # fff80000 <end+0x7fae3740>
804033d8:	fff78793          	addi	a5,a5,-1
804033dc:	00f52023          	sw	a5,0(a0)
804033e0:	00078a63          	beqz	a5,804033f4 <page_insert+0x100>
804033e4:	12098073          	sfence.vma	s3
804033e8:	f6dff06f          	j	80403354 <page_insert+0x60>
804033ec:	00d42023          	sw	a3,0(s0)
804033f0:	f65ff06f          	j	80403354 <page_insert+0x60>
804033f4:	00100593          	li	a1,1
804033f8:	851ff0ef          	jal	ra,80402c48 <free_pages>
804033fc:	000a2703          	lw	a4,0(s4)
80403400:	12098073          	sfence.vma	s3
80403404:	f51ff06f          	j	80403354 <page_insert+0x60>
80403408:	ffc00513          	li	a0,-4
8040340c:	f71ff06f          	j	8040337c <page_insert+0x88>
80403410:	f50ff0ef          	jal	ra,80402b60 <pa2page.part.6>

80403414 <copy_range>:
80403414:	fc010113          	addi	sp,sp,-64
80403418:	00d667b3          	or	a5,a2,a3
8040341c:	02112e23          	sw	ra,60(sp)
80403420:	02812c23          	sw	s0,56(sp)
80403424:	02912a23          	sw	s1,52(sp)
80403428:	03212823          	sw	s2,48(sp)
8040342c:	03312623          	sw	s3,44(sp)
80403430:	03412423          	sw	s4,40(sp)
80403434:	03512223          	sw	s5,36(sp)
80403438:	03612023          	sw	s6,32(sp)
8040343c:	01712e23          	sw	s7,28(sp)
80403440:	01812c23          	sw	s8,24(sp)
80403444:	01912a23          	sw	s9,20(sp)
80403448:	01a12823          	sw	s10,16(sp)
8040344c:	01b12623          	sw	s11,12(sp)
80403450:	01479713          	slli	a4,a5,0x14
80403454:	26071663          	bnez	a4,804036c0 <copy_range+0x2ac>
80403458:	002007b7          	lui	a5,0x200
8040345c:	00060413          	mv	s0,a2
80403460:	1ef66863          	bltu	a2,a5,80403650 <copy_range+0x23c>
80403464:	00068493          	mv	s1,a3
80403468:	1ed67463          	bgeu	a2,a3,80403650 <copy_range+0x23c>
8040346c:	800007b7          	lui	a5,0x80000
80403470:	1ed7e063          	bltu	a5,a3,80403650 <copy_range+0x23c>
80403474:	00100a37          	lui	s4,0x100
80403478:	00050a93          	mv	s5,a0
8040347c:	00058913          	mv	s2,a1
80403480:	000019b7          	lui	s3,0x1
80403484:	00099c17          	auipc	s8,0x99
80403488:	318c0c13          	addi	s8,s8,792 # 8049c79c <npage>
8040348c:	00099b97          	auipc	s7,0x99
80403490:	380b8b93          	addi	s7,s7,896 # 8049c80c <pages>
80403494:	00080b37          	lui	s6,0x80
80403498:	fffa0a13          	addi	s4,s4,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
8040349c:	00000613          	li	a2,0
804034a0:	00040593          	mv	a1,s0
804034a4:	00090513          	mv	a0,s2
804034a8:	86dff0ef          	jal	ra,80402d14 <get_pte>
804034ac:	00050c93          	mv	s9,a0
804034b0:	14050063          	beqz	a0,804035f0 <copy_range+0x1dc>
804034b4:	00052783          	lw	a5,0(a0)
804034b8:	0017f793          	andi	a5,a5,1
804034bc:	04079663          	bnez	a5,80403508 <copy_range+0xf4>
804034c0:	01340433          	add	s0,s0,s3
804034c4:	fc946ce3          	bltu	s0,s1,8040349c <copy_range+0x88>
804034c8:	00000513          	li	a0,0
804034cc:	03c12083          	lw	ra,60(sp)
804034d0:	03812403          	lw	s0,56(sp)
804034d4:	03412483          	lw	s1,52(sp)
804034d8:	03012903          	lw	s2,48(sp)
804034dc:	02c12983          	lw	s3,44(sp)
804034e0:	02812a03          	lw	s4,40(sp)
804034e4:	02412a83          	lw	s5,36(sp)
804034e8:	02012b03          	lw	s6,32(sp)
804034ec:	01c12b83          	lw	s7,28(sp)
804034f0:	01812c03          	lw	s8,24(sp)
804034f4:	01412c83          	lw	s9,20(sp)
804034f8:	01012d03          	lw	s10,16(sp)
804034fc:	00c12d83          	lw	s11,12(sp)
80403500:	04010113          	addi	sp,sp,64
80403504:	00008067          	ret
80403508:	00100613          	li	a2,1
8040350c:	00040593          	mv	a1,s0
80403510:	000a8513          	mv	a0,s5
80403514:	801ff0ef          	jal	ra,80402d14 <get_pte>
80403518:	0e050a63          	beqz	a0,8040360c <copy_range+0x1f8>
8040351c:	000ca783          	lw	a5,0(s9)
80403520:	0017f713          	andi	a4,a5,1
80403524:	01f7fc93          	andi	s9,a5,31
80403528:	18070063          	beqz	a4,804036a8 <copy_range+0x294>
8040352c:	000c2683          	lw	a3,0(s8)
80403530:	00279793          	slli	a5,a5,0x2
80403534:	00c7d713          	srli	a4,a5,0xc
80403538:	14d77c63          	bgeu	a4,a3,80403690 <copy_range+0x27c>
8040353c:	000ba783          	lw	a5,0(s7)
80403540:	fff806b7          	lui	a3,0xfff80
80403544:	00d70733          	add	a4,a4,a3
80403548:	00571713          	slli	a4,a4,0x5
8040354c:	00100513          	li	a0,1
80403550:	00e78db3          	add	s11,a5,a4
80403554:	e2cff0ef          	jal	ra,80402b80 <alloc_pages>
80403558:	00050d13          	mv	s10,a0
8040355c:	0c0d8a63          	beqz	s11,80403630 <copy_range+0x21c>
80403560:	10050863          	beqz	a0,80403670 <copy_range+0x25c>
80403564:	000ba703          	lw	a4,0(s7)
80403568:	000c2603          	lw	a2,0(s8)
8040356c:	40ed86b3          	sub	a3,s11,a4
80403570:	4056d693          	srai	a3,a3,0x5
80403574:	016686b3          	add	a3,a3,s6
80403578:	0146f7b3          	and	a5,a3,s4
8040357c:	00c69693          	slli	a3,a3,0xc
80403580:	08c7fc63          	bgeu	a5,a2,80403618 <copy_range+0x204>
80403584:	40e507b3          	sub	a5,a0,a4
80403588:	00099717          	auipc	a4,0x99
8040358c:	27c70713          	addi	a4,a4,636 # 8049c804 <va_pa_offset>
80403590:	00072503          	lw	a0,0(a4)
80403594:	4057d793          	srai	a5,a5,0x5
80403598:	016787b3          	add	a5,a5,s6
8040359c:	0147f733          	and	a4,a5,s4
804035a0:	00a685b3          	add	a1,a3,a0
804035a4:	00c79793          	slli	a5,a5,0xc
804035a8:	06c77663          	bgeu	a4,a2,80403614 <copy_range+0x200>
804035ac:	00001637          	lui	a2,0x1
804035b0:	00a78533          	add	a0,a5,a0
804035b4:	66d0f0ef          	jal	ra,80413420 <memcpy>
804035b8:	000c8693          	mv	a3,s9
804035bc:	00040613          	mv	a2,s0
804035c0:	000d0593          	mv	a1,s10
804035c4:	000a8513          	mv	a0,s5
804035c8:	d2dff0ef          	jal	ra,804032f4 <page_insert>
804035cc:	ee050ae3          	beqz	a0,804034c0 <copy_range+0xac>
804035d0:	00011697          	auipc	a3,0x11
804035d4:	c5c68693          	addi	a3,a3,-932 # 8041422c <default_pmm_manager+0x1d0>
804035d8:	00010617          	auipc	a2,0x10
804035dc:	20860613          	addi	a2,a2,520 # 804137e0 <commands+0x1bc>
804035e0:	1b200593          	li	a1,434
804035e4:	00011517          	auipc	a0,0x11
804035e8:	c5450513          	addi	a0,a0,-940 # 80414238 <default_pmm_manager+0x1dc>
804035ec:	838fd0ef          	jal	ra,80400624 <__panic>
804035f0:	004007b7          	lui	a5,0x400
804035f4:	00f40433          	add	s0,s0,a5
804035f8:	ffc007b7          	lui	a5,0xffc00
804035fc:	00f47433          	and	s0,s0,a5
80403600:	ec0404e3          	beqz	s0,804034c8 <copy_range+0xb4>
80403604:	e8946ce3          	bltu	s0,s1,8040349c <copy_range+0x88>
80403608:	ec1ff06f          	j	804034c8 <copy_range+0xb4>
8040360c:	ffc00513          	li	a0,-4
80403610:	ebdff06f          	j	804034cc <copy_range+0xb8>
80403614:	00078693          	mv	a3,a5
80403618:	00011617          	auipc	a2,0x11
8040361c:	a7460613          	addi	a2,a2,-1420 # 8041408c <default_pmm_manager+0x30>
80403620:	06e00593          	li	a1,110
80403624:	00011517          	auipc	a0,0x11
80403628:	a8c50513          	addi	a0,a0,-1396 # 804140b0 <default_pmm_manager+0x54>
8040362c:	ff9fc0ef          	jal	ra,80400624 <__panic>
80403630:	00011697          	auipc	a3,0x11
80403634:	bdc68693          	addi	a3,a3,-1060 # 8041420c <default_pmm_manager+0x1b0>
80403638:	00010617          	auipc	a2,0x10
8040363c:	1a860613          	addi	a2,a2,424 # 804137e0 <commands+0x1bc>
80403640:	19700593          	li	a1,407
80403644:	00011517          	auipc	a0,0x11
80403648:	bf450513          	addi	a0,a0,-1036 # 80414238 <default_pmm_manager+0x1dc>
8040364c:	fd9fc0ef          	jal	ra,80400624 <__panic>
80403650:	00011697          	auipc	a3,0x11
80403654:	d5868693          	addi	a3,a3,-680 # 804143a8 <default_pmm_manager+0x34c>
80403658:	00010617          	auipc	a2,0x10
8040365c:	18860613          	addi	a2,a2,392 # 804137e0 <commands+0x1bc>
80403660:	18300593          	li	a1,387
80403664:	00011517          	auipc	a0,0x11
80403668:	bd450513          	addi	a0,a0,-1068 # 80414238 <default_pmm_manager+0x1dc>
8040366c:	fb9fc0ef          	jal	ra,80400624 <__panic>
80403670:	00011697          	auipc	a3,0x11
80403674:	bac68693          	addi	a3,a3,-1108 # 8041421c <default_pmm_manager+0x1c0>
80403678:	00010617          	auipc	a2,0x10
8040367c:	16860613          	addi	a2,a2,360 # 804137e0 <commands+0x1bc>
80403680:	19800593          	li	a1,408
80403684:	00011517          	auipc	a0,0x11
80403688:	bb450513          	addi	a0,a0,-1100 # 80414238 <default_pmm_manager+0x1dc>
8040368c:	f99fc0ef          	jal	ra,80400624 <__panic>
80403690:	00011617          	auipc	a2,0x11
80403694:	a5460613          	addi	a2,a2,-1452 # 804140e4 <default_pmm_manager+0x88>
80403698:	06900593          	li	a1,105
8040369c:	00011517          	auipc	a0,0x11
804036a0:	a1450513          	addi	a0,a0,-1516 # 804140b0 <default_pmm_manager+0x54>
804036a4:	f81fc0ef          	jal	ra,80400624 <__panic>
804036a8:	00011617          	auipc	a2,0x11
804036ac:	b4060613          	addi	a2,a2,-1216 # 804141e8 <default_pmm_manager+0x18c>
804036b0:	07400593          	li	a1,116
804036b4:	00011517          	auipc	a0,0x11
804036b8:	9fc50513          	addi	a0,a0,-1540 # 804140b0 <default_pmm_manager+0x54>
804036bc:	f69fc0ef          	jal	ra,80400624 <__panic>
804036c0:	00011697          	auipc	a3,0x11
804036c4:	cbc68693          	addi	a3,a3,-836 # 8041437c <default_pmm_manager+0x320>
804036c8:	00010617          	auipc	a2,0x10
804036cc:	11860613          	addi	a2,a2,280 # 804137e0 <commands+0x1bc>
804036d0:	18200593          	li	a1,386
804036d4:	00011517          	auipc	a0,0x11
804036d8:	b6450513          	addi	a0,a0,-1180 # 80414238 <default_pmm_manager+0x1dc>
804036dc:	f49fc0ef          	jal	ra,80400624 <__panic>

804036e0 <tlb_invalidate>:
804036e0:	12058073          	sfence.vma	a1
804036e4:	00008067          	ret

804036e8 <pgdir_alloc_page>:
804036e8:	fe010113          	addi	sp,sp,-32
804036ec:	01212823          	sw	s2,16(sp)
804036f0:	00050913          	mv	s2,a0
804036f4:	00100513          	li	a0,1
804036f8:	00812c23          	sw	s0,24(sp)
804036fc:	00912a23          	sw	s1,20(sp)
80403700:	01312623          	sw	s3,12(sp)
80403704:	00112e23          	sw	ra,28(sp)
80403708:	00058493          	mv	s1,a1
8040370c:	00060993          	mv	s3,a2
80403710:	c70ff0ef          	jal	ra,80402b80 <alloc_pages>
80403714:	00050413          	mv	s0,a0
80403718:	04050e63          	beqz	a0,80403774 <pgdir_alloc_page+0x8c>
8040371c:	00050593          	mv	a1,a0
80403720:	00098693          	mv	a3,s3
80403724:	00048613          	mv	a2,s1
80403728:	00090513          	mv	a0,s2
8040372c:	bc9ff0ef          	jal	ra,804032f4 <page_insert>
80403730:	06051263          	bnez	a0,80403794 <pgdir_alloc_page+0xac>
80403734:	00099797          	auipc	a5,0x99
80403738:	07478793          	addi	a5,a5,116 # 8049c7a8 <swap_init_ok>
8040373c:	0007a783          	lw	a5,0(a5)
80403740:	02078a63          	beqz	a5,80403774 <pgdir_alloc_page+0x8c>
80403744:	00099797          	auipc	a5,0x99
80403748:	17078793          	addi	a5,a5,368 # 8049c8b4 <check_mm_struct>
8040374c:	0007a503          	lw	a0,0(a5)
80403750:	02050263          	beqz	a0,80403774 <pgdir_alloc_page+0x8c>
80403754:	00000693          	li	a3,0
80403758:	00040613          	mv	a2,s0
8040375c:	00048593          	mv	a1,s1
80403760:	639000ef          	jal	ra,80404598 <swap_map_swappable>
80403764:	00042703          	lw	a4,0(s0)
80403768:	00942e23          	sw	s1,28(s0)
8040376c:	00100793          	li	a5,1
80403770:	02f71c63          	bne	a4,a5,804037a8 <pgdir_alloc_page+0xc0>
80403774:	00040513          	mv	a0,s0
80403778:	01c12083          	lw	ra,28(sp)
8040377c:	01812403          	lw	s0,24(sp)
80403780:	01412483          	lw	s1,20(sp)
80403784:	01012903          	lw	s2,16(sp)
80403788:	00c12983          	lw	s3,12(sp)
8040378c:	02010113          	addi	sp,sp,32
80403790:	00008067          	ret
80403794:	00040513          	mv	a0,s0
80403798:	00100593          	li	a1,1
8040379c:	cacff0ef          	jal	ra,80402c48 <free_pages>
804037a0:	00000413          	li	s0,0
804037a4:	fd1ff06f          	j	80403774 <pgdir_alloc_page+0x8c>
804037a8:	00011697          	auipc	a3,0x11
804037ac:	aa068693          	addi	a3,a3,-1376 # 80414248 <default_pmm_manager+0x1ec>
804037b0:	00010617          	auipc	a2,0x10
804037b4:	03060613          	addi	a2,a2,48 # 804137e0 <commands+0x1bc>
804037b8:	1f100593          	li	a1,497
804037bc:	00011517          	auipc	a0,0x11
804037c0:	a7c50513          	addi	a0,a0,-1412 # 80414238 <default_pmm_manager+0x1dc>
804037c4:	e61fc0ef          	jal	ra,80400624 <__panic>

804037c8 <print_pgdir>:
804037c8:	fa010113          	addi	sp,sp,-96
804037cc:	00011517          	auipc	a0,0x11
804037d0:	b0450513          	addi	a0,a0,-1276 # 804142d0 <default_pmm_manager+0x274>
804037d4:	05512223          	sw	s5,68(sp)
804037d8:	04112e23          	sw	ra,92(sp)
804037dc:	04812c23          	sw	s0,88(sp)
804037e0:	04912a23          	sw	s1,84(sp)
804037e4:	05212823          	sw	s2,80(sp)
804037e8:	05312623          	sw	s3,76(sp)
804037ec:	05412423          	sw	s4,72(sp)
804037f0:	05612023          	sw	s6,64(sp)
804037f4:	03712e23          	sw	s7,60(sp)
804037f8:	03812c23          	sw	s8,56(sp)
804037fc:	03912a23          	sw	s9,52(sp)
80403800:	03a12823          	sw	s10,48(sp)
80403804:	03b12623          	sw	s11,44(sp)
80403808:	9f5fc0ef          	jal	ra,804001fc <cprintf>
8040380c:	00000593          	li	a1,0
80403810:	00012a23          	sw	zero,20(sp)
80403814:	00099a97          	auipc	s5,0x99
80403818:	ff0a8a93          	addi	s5,s5,-16 # 8049c804 <va_pa_offset>
8040381c:	01410713          	addi	a4,sp,20
80403820:	01010693          	addi	a3,sp,16
80403824:	fafec637          	lui	a2,0xfafec
80403828:	40000513          	li	a0,1024
8040382c:	a90ff0ef          	jal	ra,80402abc <get_pgtable_items.isra.4.part.5>
80403830:	00050493          	mv	s1,a0
80403834:	08050663          	beqz	a0,804038c0 <print_pgdir+0xf8>
80403838:	01412683          	lw	a3,20(sp)
8040383c:	01012603          	lw	a2,16(sp)
80403840:	01b49313          	slli	t1,s1,0x1b
80403844:	01d49813          	slli	a6,s1,0x1d
80403848:	41f35313          	srai	t1,t1,0x1f
8040384c:	41f85813          	srai	a6,a6,0x1f
80403850:	04837313          	andi	t1,t1,72
80403854:	40c685b3          	sub	a1,a3,a2
80403858:	02d30313          	addi	t1,t1,45
8040385c:	04a87813          	andi	a6,a6,74
80403860:	02d80813          	addi	a6,a6,45
80403864:	00099797          	auipc	a5,0x99
80403868:	f3c78793          	addi	a5,a5,-196 # 8049c7a0 <str.2046>
8040386c:	00099897          	auipc	a7,0x99
80403870:	f2688a23          	sb	t1,-204(a7) # 8049c7a0 <str.2046>
80403874:	01659713          	slli	a4,a1,0x16
80403878:	07200313          	li	t1,114
8040387c:	01669693          	slli	a3,a3,0x16
80403880:	01661613          	slli	a2,a2,0x16
80403884:	00011517          	auipc	a0,0x11
80403888:	a8050513          	addi	a0,a0,-1408 # 80414304 <default_pmm_manager+0x2a8>
8040388c:	00099897          	auipc	a7,0x99
80403890:	f1088b23          	sb	a6,-234(a7) # 8049c7a2 <str.2046+0x2>
80403894:	00099897          	auipc	a7,0x99
80403898:	f06886a3          	sb	t1,-243(a7) # 8049c7a1 <str.2046+0x1>
8040389c:	00099817          	auipc	a6,0x99
804038a0:	f00803a3          	sb	zero,-249(a6) # 8049c7a3 <str.2046+0x3>
804038a4:	959fc0ef          	jal	ra,804001fc <cprintf>
804038a8:	00f4f493          	andi	s1,s1,15
804038ac:	00100793          	li	a5,1
804038b0:	04f48c63          	beq	s1,a5,80403908 <print_pgdir+0x140>
804038b4:	01412583          	lw	a1,20(sp)
804038b8:	3ff00793          	li	a5,1023
804038bc:	f6b7f0e3          	bgeu	a5,a1,8040381c <print_pgdir+0x54>
804038c0:	00011517          	auipc	a0,0x11
804038c4:	a8850513          	addi	a0,a0,-1400 # 80414348 <default_pmm_manager+0x2ec>
804038c8:	935fc0ef          	jal	ra,804001fc <cprintf>
804038cc:	05c12083          	lw	ra,92(sp)
804038d0:	05812403          	lw	s0,88(sp)
804038d4:	05412483          	lw	s1,84(sp)
804038d8:	05012903          	lw	s2,80(sp)
804038dc:	04c12983          	lw	s3,76(sp)
804038e0:	04812a03          	lw	s4,72(sp)
804038e4:	04412a83          	lw	s5,68(sp)
804038e8:	04012b03          	lw	s6,64(sp)
804038ec:	03c12b83          	lw	s7,60(sp)
804038f0:	03812c03          	lw	s8,56(sp)
804038f4:	03412c83          	lw	s9,52(sp)
804038f8:	03012d03          	lw	s10,48(sp)
804038fc:	02c12d83          	lw	s11,44(sp)
80403900:	06010113          	addi	sp,sp,96
80403904:	00008067          	ret
80403908:	01012783          	lw	a5,16(sp)
8040390c:	01412583          	lw	a1,20(sp)
80403910:	00000d93          	li	s11,0
80403914:	00a79313          	slli	t1,a5,0xa
80403918:	00f12423          	sw	a5,8(sp)
8040391c:	fafec7b7          	lui	a5,0xfafec
80403920:	ffc78793          	addi	a5,a5,-4 # fafebffc <end+0x7ab4f73c>
80403924:	00f12623          	sw	a5,12(sp)
80403928:	00812783          	lw	a5,8(sp)
8040392c:	00612e23          	sw	t1,28(sp)
80403930:	40030c93          	addi	s9,t1,1024
80403934:	12b7fe63          	bgeu	a5,a1,80403a70 <print_pgdir+0x2a8>
80403938:	00c12703          	lw	a4,12(sp)
8040393c:	00178793          	addi	a5,a5,1
80403940:	00279493          	slli	s1,a5,0x2
80403944:	00e484b3          	add	s1,s1,a4
80403948:	0004a603          	lw	a2,0(s1)
8040394c:	00099a17          	auipc	s4,0x99
80403950:	e50a0a13          	addi	s4,s4,-432 # 8049c79c <npage>
80403954:	fffff9b7          	lui	s3,0xfffff
80403958:	00261613          	slli	a2,a2,0x2
8040395c:	000a2703          	lw	a4,0(s4)
80403960:	00f12423          	sw	a5,8(sp)
80403964:	00001937          	lui	s2,0x1
80403968:	00c79793          	slli	a5,a5,0xc
8040396c:	01367633          	and	a2,a2,s3
80403970:	40f90933          	sub	s2,s2,a5
80403974:	00c65793          	srli	a5,a2,0xc
80403978:	01c12583          	lw	a1,28(sp)
8040397c:	07200c13          	li	s8,114
80403980:	00099b97          	auipc	s7,0x99
80403984:	e20b8b93          	addi	s7,s7,-480 # 8049c7a0 <str.2046>
80403988:	0ae7fe63          	bgeu	a5,a4,80403a44 <print_pgdir+0x27c>
8040398c:	000aa683          	lw	a3,0(s5)
80403990:	00d60633          	add	a2,a2,a3
80403994:	01260633          	add	a2,a2,s2
80403998:	0d95f463          	bgeu	a1,s9,80403a60 <print_pgdir+0x298>
8040399c:	01c10713          	addi	a4,sp,28
804039a0:	01810693          	addi	a3,sp,24
804039a4:	000c8513          	mv	a0,s9
804039a8:	914ff0ef          	jal	ra,80402abc <get_pgtable_items.isra.4.part.5>
804039ac:	00050b13          	mv	s6,a0
804039b0:	0a050863          	beqz	a0,80403a60 <print_pgdir+0x298>
804039b4:	12ad8663          	beq	s11,a0,80403ae0 <print_pgdir+0x318>
804039b8:	060d8263          	beqz	s11,80403a1c <print_pgdir+0x254>
804039bc:	01bd9e13          	slli	t3,s11,0x1b
804039c0:	01dd9d93          	slli	s11,s11,0x1d
804039c4:	41fe5e13          	srai	t3,t3,0x1f
804039c8:	41fddd93          	srai	s11,s11,0x1f
804039cc:	408d05b3          	sub	a1,s10,s0
804039d0:	048e7e13          	andi	t3,t3,72
804039d4:	04adfd93          	andi	s11,s11,74
804039d8:	02de0e13          	addi	t3,t3,45
804039dc:	02dd8d93          	addi	s11,s11,45
804039e0:	000b8793          	mv	a5,s7
804039e4:	00c59713          	slli	a4,a1,0xc
804039e8:	00cd1693          	slli	a3,s10,0xc
804039ec:	00c41613          	slli	a2,s0,0xc
804039f0:	00011517          	auipc	a0,0x11
804039f4:	93450513          	addi	a0,a0,-1740 # 80414324 <default_pmm_manager+0x2c8>
804039f8:	00099817          	auipc	a6,0x99
804039fc:	dbc80423          	sb	t3,-600(a6) # 8049c7a0 <str.2046>
80403a00:	00099817          	auipc	a6,0x99
80403a04:	db8800a3          	sb	s8,-607(a6) # 8049c7a1 <str.2046+0x1>
80403a08:	00099817          	auipc	a6,0x99
80403a0c:	d9b80d23          	sb	s11,-614(a6) # 8049c7a2 <str.2046+0x2>
80403a10:	00099817          	auipc	a6,0x99
80403a14:	d80809a3          	sb	zero,-621(a6) # 8049c7a3 <str.2046+0x3>
80403a18:	fe4fc0ef          	jal	ra,804001fc <cprintf>
80403a1c:	01c12d03          	lw	s10,28(sp)
80403a20:	01812403          	lw	s0,24(sp)
80403a24:	000b0d93          	mv	s11,s6
80403a28:	000d0593          	mv	a1,s10
80403a2c:	0004a603          	lw	a2,0(s1)
80403a30:	000a2703          	lw	a4,0(s4)
80403a34:	00261613          	slli	a2,a2,0x2
80403a38:	01367633          	and	a2,a2,s3
80403a3c:	00c65793          	srli	a5,a2,0xc
80403a40:	f4e7e6e3          	bltu	a5,a4,8040398c <print_pgdir+0x1c4>
80403a44:	00060693          	mv	a3,a2
80403a48:	29f00593          	li	a1,671
80403a4c:	00010617          	auipc	a2,0x10
80403a50:	64060613          	addi	a2,a2,1600 # 8041408c <default_pmm_manager+0x30>
80403a54:	00010517          	auipc	a0,0x10
80403a58:	7e450513          	addi	a0,a0,2020 # 80414238 <default_pmm_manager+0x1dc>
80403a5c:	bc9fc0ef          	jal	ra,80400624 <__panic>
80403a60:	01412583          	lw	a1,20(sp)
80403a64:	00812783          	lw	a5,8(sp)
80403a68:	400c8c93          	addi	s9,s9,1024
80403a6c:	ecb7e6e3          	bltu	a5,a1,80403938 <print_pgdir+0x170>
80403a70:	e40d84e3          	beqz	s11,804038b8 <print_pgdir+0xf0>
80403a74:	01bd9313          	slli	t1,s11,0x1b
80403a78:	01dd9813          	slli	a6,s11,0x1d
80403a7c:	41f35313          	srai	t1,t1,0x1f
80403a80:	41f85813          	srai	a6,a6,0x1f
80403a84:	04837313          	andi	t1,t1,72
80403a88:	408d05b3          	sub	a1,s10,s0
80403a8c:	02d30313          	addi	t1,t1,45
80403a90:	04a87813          	andi	a6,a6,74
80403a94:	02d80813          	addi	a6,a6,45
80403a98:	00099897          	auipc	a7,0x99
80403a9c:	d0688423          	sb	t1,-760(a7) # 8049c7a0 <str.2046>
80403aa0:	00099797          	auipc	a5,0x99
80403aa4:	d0078793          	addi	a5,a5,-768 # 8049c7a0 <str.2046>
80403aa8:	07200313          	li	t1,114
80403aac:	00c59713          	slli	a4,a1,0xc
80403ab0:	00cd1693          	slli	a3,s10,0xc
80403ab4:	00c41613          	slli	a2,s0,0xc
80403ab8:	00011517          	auipc	a0,0x11
80403abc:	86c50513          	addi	a0,a0,-1940 # 80414324 <default_pmm_manager+0x2c8>
80403ac0:	00099897          	auipc	a7,0x99
80403ac4:	cf088123          	sb	a6,-798(a7) # 8049c7a2 <str.2046+0x2>
80403ac8:	00099897          	auipc	a7,0x99
80403acc:	cc688ca3          	sb	t1,-807(a7) # 8049c7a1 <str.2046+0x1>
80403ad0:	00099817          	auipc	a6,0x99
80403ad4:	cc0809a3          	sb	zero,-813(a6) # 8049c7a3 <str.2046+0x3>
80403ad8:	f24fc0ef          	jal	ra,804001fc <cprintf>
80403adc:	dd9ff06f          	j	804038b4 <print_pgdir+0xec>
80403ae0:	01c12d03          	lw	s10,28(sp)
80403ae4:	000d0593          	mv	a1,s10
80403ae8:	f45ff06f          	j	80403a2c <print_pgdir+0x264>

80403aec <pmm_init>:
80403aec:	00010797          	auipc	a5,0x10
80403af0:	57078793          	addi	a5,a5,1392 # 8041405c <default_pmm_manager>
80403af4:	0007a583          	lw	a1,0(a5)
80403af8:	ff010113          	addi	sp,sp,-16
80403afc:	00010517          	auipc	a0,0x10
80403b00:	76050513          	addi	a0,a0,1888 # 8041425c <default_pmm_manager+0x200>
80403b04:	00112623          	sw	ra,12(sp)
80403b08:	00812423          	sw	s0,8(sp)
80403b0c:	00912223          	sw	s1,4(sp)
80403b10:	00099717          	auipc	a4,0x99
80403b14:	cef72823          	sw	a5,-784(a4) # 8049c800 <pmm_manager>
80403b18:	00099417          	auipc	s0,0x99
80403b1c:	ce840413          	addi	s0,s0,-792 # 8049c800 <pmm_manager>
80403b20:	edcfc0ef          	jal	ra,804001fc <cprintf>
80403b24:	00042783          	lw	a5,0(s0)
80403b28:	ffffc497          	auipc	s1,0xffffc
80403b2c:	4d848493          	addi	s1,s1,1240 # 80400000 <kern_entry>
80403b30:	0047a783          	lw	a5,4(a5)
80403b34:	000780e7          	jalr	a5
80403b38:	804007b7          	lui	a5,0x80400
80403b3c:	409787b3          	sub	a5,a5,s1
80403b40:	00010517          	auipc	a0,0x10
80403b44:	73450513          	addi	a0,a0,1844 # 80414274 <default_pmm_manager+0x218>
80403b48:	00099717          	auipc	a4,0x99
80403b4c:	caf72e23          	sw	a5,-836(a4) # 8049c804 <va_pa_offset>
80403b50:	eacfc0ef          	jal	ra,804001fc <cprintf>
80403b54:	808005b7          	lui	a1,0x80800
80403b58:	fff58693          	addi	a3,a1,-1 # 807fffff <end+0x36373f>
80403b5c:	00048613          	mv	a2,s1
80403b60:	409585b3          	sub	a1,a1,s1
80403b64:	00010517          	auipc	a0,0x10
80403b68:	72850513          	addi	a0,a0,1832 # 8041428c <default_pmm_manager+0x230>
80403b6c:	e90fc0ef          	jal	ra,804001fc <cprintf>
80403b70:	fffff7b7          	lui	a5,0xfffff
80403b74:	0009a697          	auipc	a3,0x9a
80403b78:	d4b68693          	addi	a3,a3,-693 # 8049d8bf <end+0xfff>
80403b7c:	00f6f6b3          	and	a3,a3,a5
80403b80:	000817b7          	lui	a5,0x81
80403b84:	80078793          	addi	a5,a5,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403b88:	00099717          	auipc	a4,0x99
80403b8c:	c0f72a23          	sw	a5,-1004(a4) # 8049c79c <npage>
80403b90:	00099797          	auipc	a5,0x99
80403b94:	c6d7ae23          	sw	a3,-900(a5) # 8049c80c <pages>
80403b98:	000107b7          	lui	a5,0x10
80403b9c:	00068513          	mv	a0,a3
80403ba0:	00f687b3          	add	a5,a3,a5
80403ba4:	0046a703          	lw	a4,4(a3)
80403ba8:	02068693          	addi	a3,a3,32
80403bac:	00176713          	ori	a4,a4,1
80403bb0:	fee6a223          	sw	a4,-28(a3)
80403bb4:	fef698e3          	bne	a3,a5,80403ba4 <pmm_init+0xb8>
80403bb8:	804007b7          	lui	a5,0x80400
80403bbc:	16f6ea63          	bltu	a3,a5,80403d30 <pmm_init+0x244>
80403bc0:	00099497          	auipc	s1,0x99
80403bc4:	c4448493          	addi	s1,s1,-956 # 8049c804 <va_pa_offset>
80403bc8:	0004a783          	lw	a5,0(s1)
80403bcc:	808005b7          	lui	a1,0x80800
80403bd0:	40f686b3          	sub	a3,a3,a5
80403bd4:	10b6e863          	bltu	a3,a1,80403ce4 <pmm_init+0x1f8>
80403bd8:	00100513          	li	a0,1
80403bdc:	fa5fe0ef          	jal	ra,80402b80 <alloc_pages>
80403be0:	18050e63          	beqz	a0,80403d7c <pmm_init+0x290>
80403be4:	00099797          	auipc	a5,0x99
80403be8:	c2878793          	addi	a5,a5,-984 # 8049c80c <pages>
80403bec:	0007a683          	lw	a3,0(a5)
80403bf0:	00099797          	auipc	a5,0x99
80403bf4:	bac78793          	addi	a5,a5,-1108 # 8049c79c <npage>
80403bf8:	0007a703          	lw	a4,0(a5)
80403bfc:	40d506b3          	sub	a3,a0,a3
80403c00:	4056d693          	srai	a3,a3,0x5
80403c04:	00080537          	lui	a0,0x80
80403c08:	00a686b3          	add	a3,a3,a0
80403c0c:	00c69793          	slli	a5,a3,0xc
80403c10:	00c7d793          	srli	a5,a5,0xc
80403c14:	00c69693          	slli	a3,a3,0xc
80403c18:	14e7f663          	bgeu	a5,a4,80403d64 <pmm_init+0x278>
80403c1c:	0004a783          	lw	a5,0(s1)
80403c20:	00001637          	lui	a2,0x1
80403c24:	00000593          	li	a1,0
80403c28:	00f686b3          	add	a3,a3,a5
80403c2c:	00068513          	mv	a0,a3
80403c30:	00099417          	auipc	s0,0x99
80403c34:	b6840413          	addi	s0,s0,-1176 # 8049c798 <boot_pgdir>
80403c38:	00099797          	auipc	a5,0x99
80403c3c:	b6d7a023          	sw	a3,-1184(a5) # 8049c798 <boot_pgdir>
80403c40:	7700f0ef          	jal	ra,804133b0 <memset>
80403c44:	00042503          	lw	a0,0(s0)
80403c48:	80400637          	lui	a2,0x80400
80403c4c:	0ec56e63          	bltu	a0,a2,80403d48 <pmm_init+0x25c>
80403c50:	0004a683          	lw	a3,0(s1)
80403c54:	00001737          	lui	a4,0x1
80403c58:	00e50733          	add	a4,a0,a4
80403c5c:	40d50833          	sub	a6,a0,a3
80403c60:	00c85793          	srli	a5,a6,0xc
80403c64:	00a79793          	slli	a5,a5,0xa
80403c68:	0c17e593          	ori	a1,a5,193
80403c6c:	0c77e793          	ori	a5,a5,199
80403c70:	faf72823          	sw	a5,-80(a4) # fb0 <_binary_bin_swap_img_size-0x7050>
80403c74:	40d606b3          	sub	a3,a2,a3
80403c78:	fab72623          	sw	a1,-84(a4)
80403c7c:	00800637          	lui	a2,0x800
80403c80:	00f00713          	li	a4,15
80403c84:	804005b7          	lui	a1,0x80400
80403c88:	00099797          	auipc	a5,0x99
80403c8c:	b907a023          	sw	a6,-1152(a5) # 8049c808 <boot_cr3>
80403c90:	9ecff0ef          	jal	ra,80402e7c <boot_map_segment>
80403c94:	00042503          	lw	a0,0(s0)
80403c98:	00700713          	li	a4,7
80403c9c:	100006b7          	lui	a3,0x10000
80403ca0:	00001637          	lui	a2,0x1
80403ca4:	100005b7          	lui	a1,0x10000
80403ca8:	9d4ff0ef          	jal	ra,80402e7c <boot_map_segment>
80403cac:	00099797          	auipc	a5,0x99
80403cb0:	b5c78793          	addi	a5,a5,-1188 # 8049c808 <boot_cr3>
80403cb4:	0007a783          	lw	a5,0(a5)
80403cb8:	80000737          	lui	a4,0x80000
80403cbc:	00c7d793          	srli	a5,a5,0xc
80403cc0:	00e7e7b3          	or	a5,a5,a4
80403cc4:	18079073          	csrw	satp,a5
80403cc8:	12000073          	sfence.vma
80403ccc:	afdff0ef          	jal	ra,804037c8 <print_pgdir>
80403cd0:	00812403          	lw	s0,8(sp)
80403cd4:	00c12083          	lw	ra,12(sp)
80403cd8:	00412483          	lw	s1,4(sp)
80403cdc:	01010113          	addi	sp,sp,16
80403ce0:	af9fe06f          	j	804027d8 <kmalloc_init>
80403ce4:	000017b7          	lui	a5,0x1
80403ce8:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403cec:	00f686b3          	add	a3,a3,a5
80403cf0:	00081737          	lui	a4,0x81
80403cf4:	00c6d793          	srli	a5,a3,0xc
80403cf8:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403cfc:	08e78c63          	beq	a5,a4,80403d94 <pmm_init+0x2a8>
80403d00:	00042703          	lw	a4,0(s0)
80403d04:	fffff637          	lui	a2,0xfffff
80403d08:	00c6f6b3          	and	a3,a3,a2
80403d0c:	fff80637          	lui	a2,0xfff80
80403d10:	00c787b3          	add	a5,a5,a2
80403d14:	00872703          	lw	a4,8(a4)
80403d18:	40d585b3          	sub	a1,a1,a3
80403d1c:	00579793          	slli	a5,a5,0x5
80403d20:	00c5d593          	srli	a1,a1,0xc
80403d24:	00f50533          	add	a0,a0,a5
80403d28:	000700e7          	jalr	a4
80403d2c:	eadff06f          	j	80403bd8 <pmm_init+0xec>
80403d30:	00010617          	auipc	a2,0x10
80403d34:	39060613          	addi	a2,a2,912 # 804140c0 <default_pmm_manager+0x64>
80403d38:	08e00593          	li	a1,142
80403d3c:	00010517          	auipc	a0,0x10
80403d40:	4fc50513          	addi	a0,a0,1276 # 80414238 <default_pmm_manager+0x1dc>
80403d44:	8e1fc0ef          	jal	ra,80400624 <__panic>
80403d48:	00050693          	mv	a3,a0
80403d4c:	00010617          	auipc	a2,0x10
80403d50:	37460613          	addi	a2,a2,884 # 804140c0 <default_pmm_manager+0x64>
80403d54:	0d400593          	li	a1,212
80403d58:	00010517          	auipc	a0,0x10
80403d5c:	4e050513          	addi	a0,a0,1248 # 80414238 <default_pmm_manager+0x1dc>
80403d60:	8c5fc0ef          	jal	ra,80400624 <__panic>
80403d64:	00010617          	auipc	a2,0x10
80403d68:	32860613          	addi	a2,a2,808 # 8041408c <default_pmm_manager+0x30>
80403d6c:	06e00593          	li	a1,110
80403d70:	00010517          	auipc	a0,0x10
80403d74:	34050513          	addi	a0,a0,832 # 804140b0 <default_pmm_manager+0x54>
80403d78:	8adfc0ef          	jal	ra,80400624 <__panic>
80403d7c:	00010617          	auipc	a2,0x10
80403d80:	53860613          	addi	a2,a2,1336 # 804142b4 <default_pmm_manager+0x258>
80403d84:	0b600593          	li	a1,182
80403d88:	00010517          	auipc	a0,0x10
80403d8c:	4b050513          	addi	a0,a0,1200 # 80414238 <default_pmm_manager+0x1dc>
80403d90:	895fc0ef          	jal	ra,80400624 <__panic>
80403d94:	dcdfe0ef          	jal	ra,80402b60 <pa2page.part.6>

80403d98 <swap_init>:
80403d98:	fa010113          	addi	sp,sp,-96
80403d9c:	04112e23          	sw	ra,92(sp)
80403da0:	04812c23          	sw	s0,88(sp)
80403da4:	04912a23          	sw	s1,84(sp)
80403da8:	05212823          	sw	s2,80(sp)
80403dac:	05312623          	sw	s3,76(sp)
80403db0:	05412423          	sw	s4,72(sp)
80403db4:	05512223          	sw	s5,68(sp)
80403db8:	05612023          	sw	s6,64(sp)
80403dbc:	03712e23          	sw	s7,60(sp)
80403dc0:	03812c23          	sw	s8,56(sp)
80403dc4:	03912a23          	sw	s9,52(sp)
80403dc8:	03a12823          	sw	s10,48(sp)
80403dcc:	03b12623          	sw	s11,44(sp)
80403dd0:	779090ef          	jal	ra,8040dd48 <swapfs_init>
80403dd4:	00099797          	auipc	a5,0x99
80403dd8:	ab078793          	addi	a5,a5,-1360 # 8049c884 <max_swap_offset>
80403ddc:	0007a683          	lw	a3,0(a5)
80403de0:	010007b7          	lui	a5,0x1000
80403de4:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf87ff8>
80403de8:	ff968713          	addi	a4,a3,-7 # ffffff9 <_binary_bin_sfs_img_size+0xff87ff9>
80403dec:	56e7e063          	bltu	a5,a4,8040434c <swap_init+0x5b4>
80403df0:	00095797          	auipc	a5,0x95
80403df4:	21078793          	addi	a5,a5,528 # 80499000 <swap_manager_fifo>
80403df8:	0047a703          	lw	a4,4(a5)
80403dfc:	00099697          	auipc	a3,0x99
80403e00:	9af6a423          	sw	a5,-1624(a3) # 8049c7a4 <sm>
80403e04:	000700e7          	jalr	a4
80403e08:	00050b13          	mv	s6,a0
80403e0c:	04050263          	beqz	a0,80403e50 <swap_init+0xb8>
80403e10:	05c12083          	lw	ra,92(sp)
80403e14:	05812403          	lw	s0,88(sp)
80403e18:	000b0513          	mv	a0,s6
80403e1c:	05412483          	lw	s1,84(sp)
80403e20:	05012903          	lw	s2,80(sp)
80403e24:	04c12983          	lw	s3,76(sp)
80403e28:	04812a03          	lw	s4,72(sp)
80403e2c:	04412a83          	lw	s5,68(sp)
80403e30:	04012b03          	lw	s6,64(sp)
80403e34:	03c12b83          	lw	s7,60(sp)
80403e38:	03812c03          	lw	s8,56(sp)
80403e3c:	03412c83          	lw	s9,52(sp)
80403e40:	03012d03          	lw	s10,48(sp)
80403e44:	02c12d83          	lw	s11,44(sp)
80403e48:	06010113          	addi	sp,sp,96
80403e4c:	00008067          	ret
80403e50:	00099797          	auipc	a5,0x99
80403e54:	95478793          	addi	a5,a5,-1708 # 8049c7a4 <sm>
80403e58:	0007a783          	lw	a5,0(a5)
80403e5c:	00010517          	auipc	a0,0x10
80403e60:	5e050513          	addi	a0,a0,1504 # 8041443c <default_pmm_manager+0x3e0>
80403e64:	00099497          	auipc	s1,0x99
80403e68:	99048493          	addi	s1,s1,-1648 # 8049c7f4 <free_area>
80403e6c:	0007a583          	lw	a1,0(a5)
80403e70:	00100793          	li	a5,1
80403e74:	00099717          	auipc	a4,0x99
80403e78:	92f72a23          	sw	a5,-1740(a4) # 8049c7a8 <swap_init_ok>
80403e7c:	b80fc0ef          	jal	ra,804001fc <cprintf>
80403e80:	0044a783          	lw	a5,4(s1)
80403e84:	3e978463          	beq	a5,s1,8040426c <swap_init+0x4d4>
80403e88:	ff87a703          	lw	a4,-8(a5)
80403e8c:	00175713          	srli	a4,a4,0x1
80403e90:	00177713          	andi	a4,a4,1
80403e94:	3e070463          	beqz	a4,8040427c <swap_init+0x4e4>
80403e98:	00000413          	li	s0,0
80403e9c:	00000913          	li	s2,0
80403ea0:	0100006f          	j	80403eb0 <swap_init+0x118>
80403ea4:	ff87a703          	lw	a4,-8(a5)
80403ea8:	00277713          	andi	a4,a4,2
80403eac:	3c070863          	beqz	a4,8040427c <swap_init+0x4e4>
80403eb0:	ffc7a703          	lw	a4,-4(a5)
80403eb4:	0047a783          	lw	a5,4(a5)
80403eb8:	00190913          	addi	s2,s2,1 # 1001 <_binary_bin_swap_img_size-0x6fff>
80403ebc:	00e40433          	add	s0,s0,a4
80403ec0:	00040993          	mv	s3,s0
80403ec4:	fe9790e3          	bne	a5,s1,80403ea4 <swap_init+0x10c>
80403ec8:	dedfe0ef          	jal	ra,80402cb4 <nr_free_pages>
80403ecc:	69351c63          	bne	a0,s3,80404564 <swap_init+0x7cc>
80403ed0:	00040613          	mv	a2,s0
80403ed4:	00090593          	mv	a1,s2
80403ed8:	00010517          	auipc	a0,0x10
80403edc:	57850513          	addi	a0,a0,1400 # 80414450 <default_pmm_manager+0x3f4>
80403ee0:	b1cfc0ef          	jal	ra,804001fc <cprintf>
80403ee4:	5dd000ef          	jal	ra,80404cc0 <mm_create>
80403ee8:	00050c13          	mv	s8,a0
80403eec:	5e050c63          	beqz	a0,804044e4 <swap_init+0x74c>
80403ef0:	00099797          	auipc	a5,0x99
80403ef4:	9c478793          	addi	a5,a5,-1596 # 8049c8b4 <check_mm_struct>
80403ef8:	0007a783          	lw	a5,0(a5)
80403efc:	60079463          	bnez	a5,80404504 <swap_init+0x76c>
80403f00:	00099797          	auipc	a5,0x99
80403f04:	89878793          	addi	a5,a5,-1896 # 8049c798 <boot_pgdir>
80403f08:	0007ab83          	lw	s7,0(a5)
80403f0c:	00099797          	auipc	a5,0x99
80403f10:	9aa7a423          	sw	a0,-1624(a5) # 8049c8b4 <check_mm_struct>
80403f14:	000ba783          	lw	a5,0(s7)
80403f18:	01752623          	sw	s7,12(a0)
80403f1c:	60079463          	bnez	a5,80404524 <swap_init+0x78c>
80403f20:	000065b7          	lui	a1,0x6
80403f24:	00300613          	li	a2,3
80403f28:	00001537          	lui	a0,0x1
80403f2c:	605000ef          	jal	ra,80404d30 <vma_create>
80403f30:	00050593          	mv	a1,a0
80403f34:	60050863          	beqz	a0,80404544 <swap_init+0x7ac>
80403f38:	000c0513          	mv	a0,s8
80403f3c:	6a5000ef          	jal	ra,80404de0 <insert_vma_struct>
80403f40:	00010517          	auipc	a0,0x10
80403f44:	57850513          	addi	a0,a0,1400 # 804144b8 <default_pmm_manager+0x45c>
80403f48:	ab4fc0ef          	jal	ra,804001fc <cprintf>
80403f4c:	00cc2503          	lw	a0,12(s8)
80403f50:	00100613          	li	a2,1
80403f54:	000015b7          	lui	a1,0x1
80403f58:	dbdfe0ef          	jal	ra,80402d14 <get_pte>
80403f5c:	4e050463          	beqz	a0,80404444 <swap_init+0x6ac>
80403f60:	00010517          	auipc	a0,0x10
80403f64:	5a050513          	addi	a0,a0,1440 # 80414500 <default_pmm_manager+0x4a4>
80403f68:	00099a17          	auipc	s4,0x99
80403f6c:	8a8a0a13          	addi	s4,s4,-1880 # 8049c810 <check_rp>
80403f70:	a8cfc0ef          	jal	ra,804001fc <cprintf>
80403f74:	00099a97          	auipc	s5,0x99
80403f78:	8aca8a93          	addi	s5,s5,-1876 # 8049c820 <swap_in_seq_no>
80403f7c:	000a0993          	mv	s3,s4
80403f80:	00100513          	li	a0,1
80403f84:	bfdfe0ef          	jal	ra,80402b80 <alloc_pages>
80403f88:	00a9a023          	sw	a0,0(s3) # fffff000 <end+0x7fb62740>
80403f8c:	38050063          	beqz	a0,8040430c <swap_init+0x574>
80403f90:	00452783          	lw	a5,4(a0)
80403f94:	0027f793          	andi	a5,a5,2
80403f98:	34079a63          	bnez	a5,804042ec <swap_init+0x554>
80403f9c:	00498993          	addi	s3,s3,4
80403fa0:	ff5990e3          	bne	s3,s5,80403f80 <swap_init+0x1e8>
80403fa4:	0004a783          	lw	a5,0(s1)
80403fa8:	0044a983          	lw	s3,4(s1)
80403fac:	00099d17          	auipc	s10,0x99
80403fb0:	864d0d13          	addi	s10,s10,-1948 # 8049c810 <check_rp>
80403fb4:	00f12c23          	sw	a5,24(sp)
80403fb8:	0084a783          	lw	a5,8(s1)
80403fbc:	00f12e23          	sw	a5,28(sp)
80403fc0:	00099797          	auipc	a5,0x99
80403fc4:	8297ac23          	sw	s1,-1992(a5) # 8049c7f8 <free_area+0x4>
80403fc8:	00099797          	auipc	a5,0x99
80403fcc:	8297a623          	sw	s1,-2004(a5) # 8049c7f4 <free_area>
80403fd0:	00099797          	auipc	a5,0x99
80403fd4:	8207a623          	sw	zero,-2004(a5) # 8049c7fc <free_area+0x8>
80403fd8:	000d2503          	lw	a0,0(s10)
80403fdc:	00100593          	li	a1,1
80403fe0:	004d0d13          	addi	s10,s10,4
80403fe4:	c65fe0ef          	jal	ra,80402c48 <free_pages>
80403fe8:	ff5d18e3          	bne	s10,s5,80403fd8 <swap_init+0x240>
80403fec:	0084ad03          	lw	s10,8(s1)
80403ff0:	00400793          	li	a5,4
80403ff4:	42fd1863          	bne	s10,a5,80404424 <swap_init+0x68c>
80403ff8:	00010517          	auipc	a0,0x10
80403ffc:	58050513          	addi	a0,a0,1408 # 80414578 <default_pmm_manager+0x51c>
80404000:	9fcfc0ef          	jal	ra,804001fc <cprintf>
80404004:	000016b7          	lui	a3,0x1
80404008:	00098797          	auipc	a5,0x98
8040400c:	7a07a223          	sw	zero,1956(a5) # 8049c7ac <pgfault_num>
80404010:	00a00613          	li	a2,10
80404014:	00098797          	auipc	a5,0x98
80404018:	79878793          	addi	a5,a5,1944 # 8049c7ac <pgfault_num>
8040401c:	00c68023          	sb	a2,0(a3) # 1000 <_binary_bin_swap_img_size-0x7000>
80404020:	0007a703          	lw	a4,0(a5)
80404024:	00100593          	li	a1,1
80404028:	3ab71e63          	bne	a4,a1,804043e4 <swap_init+0x64c>
8040402c:	00c68823          	sb	a2,16(a3)
80404030:	0007a683          	lw	a3,0(a5)
80404034:	3ce69863          	bne	a3,a4,80404404 <swap_init+0x66c>
80404038:	000026b7          	lui	a3,0x2
8040403c:	00b00613          	li	a2,11
80404040:	00c68023          	sb	a2,0(a3) # 2000 <_binary_bin_swap_img_size-0x6000>
80404044:	0007a703          	lw	a4,0(a5)
80404048:	00200593          	li	a1,2
8040404c:	30b71c63          	bne	a4,a1,80404364 <swap_init+0x5cc>
80404050:	00c68823          	sb	a2,16(a3)
80404054:	0007a683          	lw	a3,0(a5)
80404058:	32e69663          	bne	a3,a4,80404384 <swap_init+0x5ec>
8040405c:	000036b7          	lui	a3,0x3
80404060:	00c00613          	li	a2,12
80404064:	00c68023          	sb	a2,0(a3) # 3000 <_binary_bin_swap_img_size-0x5000>
80404068:	0007a703          	lw	a4,0(a5)
8040406c:	00300593          	li	a1,3
80404070:	32b71a63          	bne	a4,a1,804043a4 <swap_init+0x60c>
80404074:	00c68823          	sb	a2,16(a3)
80404078:	0007a683          	lw	a3,0(a5)
8040407c:	34e69463          	bne	a3,a4,804043c4 <swap_init+0x62c>
80404080:	000046b7          	lui	a3,0x4
80404084:	00d00613          	li	a2,13
80404088:	00c68023          	sb	a2,0(a3) # 4000 <_binary_bin_swap_img_size-0x4000>
8040408c:	0007a703          	lw	a4,0(a5)
80404090:	3da71a63          	bne	a4,s10,80404464 <swap_init+0x6cc>
80404094:	00c68823          	sb	a2,16(a3)
80404098:	0007a783          	lw	a5,0(a5)
8040409c:	3ee79463          	bne	a5,a4,80404484 <swap_init+0x6ec>
804040a0:	0084a783          	lw	a5,8(s1)
804040a4:	40079063          	bnez	a5,804044a4 <swap_init+0x70c>
804040a8:	00098797          	auipc	a5,0x98
804040ac:	77878793          	addi	a5,a5,1912 # 8049c820 <swap_in_seq_no>
804040b0:	00098717          	auipc	a4,0x98
804040b4:	79870713          	addi	a4,a4,1944 # 8049c848 <swap_out_seq_no>
804040b8:	00098617          	auipc	a2,0x98
804040bc:	79060613          	addi	a2,a2,1936 # 8049c848 <swap_out_seq_no>
804040c0:	fff00693          	li	a3,-1
804040c4:	00d7a023          	sw	a3,0(a5)
804040c8:	00d72023          	sw	a3,0(a4)
804040cc:	00478793          	addi	a5,a5,4
804040d0:	00470713          	addi	a4,a4,4
804040d4:	fec798e3          	bne	a5,a2,804040c4 <swap_init+0x32c>
804040d8:	00098697          	auipc	a3,0x98
804040dc:	7c468693          	addi	a3,a3,1988 # 8049c89c <check_ptep>
804040e0:	00098817          	auipc	a6,0x98
804040e4:	73080813          	addi	a6,a6,1840 # 8049c810 <check_rp>
804040e8:	00001737          	lui	a4,0x1
804040ec:	00098d97          	auipc	s11,0x98
804040f0:	6b0d8d93          	addi	s11,s11,1712 # 8049c79c <npage>
804040f4:	00013c97          	auipc	s9,0x13
804040f8:	d6cc8c93          	addi	s9,s9,-660 # 80416e60 <nbase>
804040fc:	00098d17          	auipc	s10,0x98
80404100:	710d0d13          	addi	s10,s10,1808 # 8049c80c <pages>
80404104:	00070593          	mv	a1,a4
80404108:	0006a023          	sw	zero,0(a3)
8040410c:	00000613          	li	a2,0
80404110:	000b8513          	mv	a0,s7
80404114:	01012a23          	sw	a6,20(sp)
80404118:	00e12823          	sw	a4,16(sp)
8040411c:	00d12623          	sw	a3,12(sp)
80404120:	bf5fe0ef          	jal	ra,80402d14 <get_pte>
80404124:	00c12683          	lw	a3,12(sp)
80404128:	01012703          	lw	a4,16(sp)
8040412c:	01412803          	lw	a6,20(sp)
80404130:	00a6a023          	sw	a0,0(a3)
80404134:	1e050c63          	beqz	a0,8040432c <swap_init+0x594>
80404138:	00052783          	lw	a5,0(a0)
8040413c:	0017f613          	andi	a2,a5,1
80404140:	18060a63          	beqz	a2,804042d4 <swap_init+0x53c>
80404144:	000da603          	lw	a2,0(s11)
80404148:	00279793          	slli	a5,a5,0x2
8040414c:	00c7d793          	srli	a5,a5,0xc
80404150:	14c7f663          	bgeu	a5,a2,8040429c <swap_init+0x504>
80404154:	000ca603          	lw	a2,0(s9)
80404158:	00082583          	lw	a1,0(a6)
8040415c:	00060513          	mv	a0,a2
80404160:	00c12623          	sw	a2,12(sp)
80404164:	000d2603          	lw	a2,0(s10)
80404168:	40a787b3          	sub	a5,a5,a0
8040416c:	00579793          	slli	a5,a5,0x5
80404170:	00f607b3          	add	a5,a2,a5
80404174:	14f59063          	bne	a1,a5,804042b4 <swap_init+0x51c>
80404178:	000017b7          	lui	a5,0x1
8040417c:	00f70733          	add	a4,a4,a5
80404180:	000057b7          	lui	a5,0x5
80404184:	00468693          	addi	a3,a3,4
80404188:	00480813          	addi	a6,a6,4
8040418c:	f6f71ce3          	bne	a4,a5,80404104 <swap_init+0x36c>
80404190:	00010517          	auipc	a0,0x10
80404194:	4a050513          	addi	a0,a0,1184 # 80414630 <default_pmm_manager+0x5d4>
80404198:	864fc0ef          	jal	ra,804001fc <cprintf>
8040419c:	00098797          	auipc	a5,0x98
804041a0:	60878793          	addi	a5,a5,1544 # 8049c7a4 <sm>
804041a4:	0007a783          	lw	a5,0(a5)
804041a8:	01c7a783          	lw	a5,28(a5)
804041ac:	000780e7          	jalr	a5
804041b0:	30051a63          	bnez	a0,804044c4 <swap_init+0x72c>
804041b4:	000a2503          	lw	a0,0(s4)
804041b8:	00100593          	li	a1,1
804041bc:	004a0a13          	addi	s4,s4,4
804041c0:	a89fe0ef          	jal	ra,80402c48 <free_pages>
804041c4:	ff5a18e3          	bne	s4,s5,804041b4 <swap_init+0x41c>
804041c8:	000ba783          	lw	a5,0(s7)
804041cc:	000da703          	lw	a4,0(s11)
804041d0:	00279793          	slli	a5,a5,0x2
804041d4:	00c7d793          	srli	a5,a5,0xc
804041d8:	0ce7f263          	bgeu	a5,a4,8040429c <swap_init+0x504>
804041dc:	00c12703          	lw	a4,12(sp)
804041e0:	000d2503          	lw	a0,0(s10)
804041e4:	00100593          	li	a1,1
804041e8:	40e787b3          	sub	a5,a5,a4
804041ec:	00579793          	slli	a5,a5,0x5
804041f0:	00f50533          	add	a0,a0,a5
804041f4:	a55fe0ef          	jal	ra,80402c48 <free_pages>
804041f8:	000ba023          	sw	zero,0(s7)
804041fc:	000c2623          	sw	zero,12(s8)
80404200:	000c0513          	mv	a0,s8
80404204:	4d1000ef          	jal	ra,80404ed4 <mm_destroy>
80404208:	00098797          	auipc	a5,0x98
8040420c:	6a07a623          	sw	zero,1708(a5) # 8049c8b4 <check_mm_struct>
80404210:	01c12783          	lw	a5,28(sp)
80404214:	00098717          	auipc	a4,0x98
80404218:	5ef72423          	sw	a5,1512(a4) # 8049c7fc <free_area+0x8>
8040421c:	01812783          	lw	a5,24(sp)
80404220:	00098717          	auipc	a4,0x98
80404224:	5cf72a23          	sw	a5,1492(a4) # 8049c7f4 <free_area>
80404228:	00098797          	auipc	a5,0x98
8040422c:	5d37a823          	sw	s3,1488(a5) # 8049c7f8 <free_area+0x4>
80404230:	00998c63          	beq	s3,s1,80404248 <swap_init+0x4b0>
80404234:	ffc9a783          	lw	a5,-4(s3)
80404238:	0049a983          	lw	s3,4(s3)
8040423c:	fff90913          	addi	s2,s2,-1
80404240:	40f40433          	sub	s0,s0,a5
80404244:	fe9998e3          	bne	s3,s1,80404234 <swap_init+0x49c>
80404248:	00040613          	mv	a2,s0
8040424c:	00090593          	mv	a1,s2
80404250:	00010517          	auipc	a0,0x10
80404254:	40850513          	addi	a0,a0,1032 # 80414658 <default_pmm_manager+0x5fc>
80404258:	fa5fb0ef          	jal	ra,804001fc <cprintf>
8040425c:	00010517          	auipc	a0,0x10
80404260:	41850513          	addi	a0,a0,1048 # 80414674 <default_pmm_manager+0x618>
80404264:	f99fb0ef          	jal	ra,804001fc <cprintf>
80404268:	ba9ff06f          	j	80403e10 <swap_init+0x78>
8040426c:	00000413          	li	s0,0
80404270:	00000913          	li	s2,0
80404274:	00000993          	li	s3,0
80404278:	c51ff06f          	j	80403ec8 <swap_init+0x130>
8040427c:	00010697          	auipc	a3,0x10
80404280:	a8068693          	addi	a3,a3,-1408 # 80413cfc <commands+0x6d8>
80404284:	0000f617          	auipc	a2,0xf
80404288:	55c60613          	addi	a2,a2,1372 # 804137e0 <commands+0x1bc>
8040428c:	0a200593          	li	a1,162
80404290:	00010517          	auipc	a0,0x10
80404294:	19c50513          	addi	a0,a0,412 # 8041442c <default_pmm_manager+0x3d0>
80404298:	b8cfc0ef          	jal	ra,80400624 <__panic>
8040429c:	00010617          	auipc	a2,0x10
804042a0:	e4860613          	addi	a2,a2,-440 # 804140e4 <default_pmm_manager+0x88>
804042a4:	06900593          	li	a1,105
804042a8:	00010517          	auipc	a0,0x10
804042ac:	e0850513          	addi	a0,a0,-504 # 804140b0 <default_pmm_manager+0x54>
804042b0:	b74fc0ef          	jal	ra,80400624 <__panic>
804042b4:	00010697          	auipc	a3,0x10
804042b8:	35468693          	addi	a3,a3,852 # 80414608 <default_pmm_manager+0x5ac>
804042bc:	0000f617          	auipc	a2,0xf
804042c0:	52460613          	addi	a2,a2,1316 # 804137e0 <commands+0x1bc>
804042c4:	0e400593          	li	a1,228
804042c8:	00010517          	auipc	a0,0x10
804042cc:	16450513          	addi	a0,a0,356 # 8041442c <default_pmm_manager+0x3d0>
804042d0:	b54fc0ef          	jal	ra,80400624 <__panic>
804042d4:	00010617          	auipc	a2,0x10
804042d8:	f1460613          	addi	a2,a2,-236 # 804141e8 <default_pmm_manager+0x18c>
804042dc:	07400593          	li	a1,116
804042e0:	00010517          	auipc	a0,0x10
804042e4:	dd050513          	addi	a0,a0,-560 # 804140b0 <default_pmm_manager+0x54>
804042e8:	b3cfc0ef          	jal	ra,80400624 <__panic>
804042ec:	00010697          	auipc	a3,0x10
804042f0:	24c68693          	addi	a3,a3,588 # 80414538 <default_pmm_manager+0x4dc>
804042f4:	0000f617          	auipc	a2,0xf
804042f8:	4ec60613          	addi	a2,a2,1260 # 804137e0 <commands+0x1bc>
804042fc:	0c400593          	li	a1,196
80404300:	00010517          	auipc	a0,0x10
80404304:	12c50513          	addi	a0,a0,300 # 8041442c <default_pmm_manager+0x3d0>
80404308:	b1cfc0ef          	jal	ra,80400624 <__panic>
8040430c:	00010697          	auipc	a3,0x10
80404310:	21868693          	addi	a3,a3,536 # 80414524 <default_pmm_manager+0x4c8>
80404314:	0000f617          	auipc	a2,0xf
80404318:	4cc60613          	addi	a2,a2,1228 # 804137e0 <commands+0x1bc>
8040431c:	0c300593          	li	a1,195
80404320:	00010517          	auipc	a0,0x10
80404324:	10c50513          	addi	a0,a0,268 # 8041442c <default_pmm_manager+0x3d0>
80404328:	afcfc0ef          	jal	ra,80400624 <__panic>
8040432c:	00010697          	auipc	a3,0x10
80404330:	2c468693          	addi	a3,a3,708 # 804145f0 <default_pmm_manager+0x594>
80404334:	0000f617          	auipc	a2,0xf
80404338:	4ac60613          	addi	a2,a2,1196 # 804137e0 <commands+0x1bc>
8040433c:	0e300593          	li	a1,227
80404340:	00010517          	auipc	a0,0x10
80404344:	0ec50513          	addi	a0,a0,236 # 8041442c <default_pmm_manager+0x3d0>
80404348:	adcfc0ef          	jal	ra,80400624 <__panic>
8040434c:	00010617          	auipc	a2,0x10
80404350:	0c460613          	addi	a2,a2,196 # 80414410 <default_pmm_manager+0x3b4>
80404354:	02500593          	li	a1,37
80404358:	00010517          	auipc	a0,0x10
8040435c:	0d450513          	addi	a0,a0,212 # 8041442c <default_pmm_manager+0x3d0>
80404360:	ac4fc0ef          	jal	ra,80400624 <__panic>
80404364:	00010697          	auipc	a3,0x10
80404368:	25068693          	addi	a3,a3,592 # 804145b4 <default_pmm_manager+0x558>
8040436c:	0000f617          	auipc	a2,0xf
80404370:	47460613          	addi	a2,a2,1140 # 804137e0 <commands+0x1bc>
80404374:	08100593          	li	a1,129
80404378:	00010517          	auipc	a0,0x10
8040437c:	0b450513          	addi	a0,a0,180 # 8041442c <default_pmm_manager+0x3d0>
80404380:	aa4fc0ef          	jal	ra,80400624 <__panic>
80404384:	00010697          	auipc	a3,0x10
80404388:	23068693          	addi	a3,a3,560 # 804145b4 <default_pmm_manager+0x558>
8040438c:	0000f617          	auipc	a2,0xf
80404390:	45460613          	addi	a2,a2,1108 # 804137e0 <commands+0x1bc>
80404394:	08300593          	li	a1,131
80404398:	00010517          	auipc	a0,0x10
8040439c:	09450513          	addi	a0,a0,148 # 8041442c <default_pmm_manager+0x3d0>
804043a0:	a84fc0ef          	jal	ra,80400624 <__panic>
804043a4:	00010697          	auipc	a3,0x10
804043a8:	22468693          	addi	a3,a3,548 # 804145c8 <default_pmm_manager+0x56c>
804043ac:	0000f617          	auipc	a2,0xf
804043b0:	43460613          	addi	a2,a2,1076 # 804137e0 <commands+0x1bc>
804043b4:	08500593          	li	a1,133
804043b8:	00010517          	auipc	a0,0x10
804043bc:	07450513          	addi	a0,a0,116 # 8041442c <default_pmm_manager+0x3d0>
804043c0:	a64fc0ef          	jal	ra,80400624 <__panic>
804043c4:	00010697          	auipc	a3,0x10
804043c8:	20468693          	addi	a3,a3,516 # 804145c8 <default_pmm_manager+0x56c>
804043cc:	0000f617          	auipc	a2,0xf
804043d0:	41460613          	addi	a2,a2,1044 # 804137e0 <commands+0x1bc>
804043d4:	08700593          	li	a1,135
804043d8:	00010517          	auipc	a0,0x10
804043dc:	05450513          	addi	a0,a0,84 # 8041442c <default_pmm_manager+0x3d0>
804043e0:	a44fc0ef          	jal	ra,80400624 <__panic>
804043e4:	00010697          	auipc	a3,0x10
804043e8:	1bc68693          	addi	a3,a3,444 # 804145a0 <default_pmm_manager+0x544>
804043ec:	0000f617          	auipc	a2,0xf
804043f0:	3f460613          	addi	a2,a2,1012 # 804137e0 <commands+0x1bc>
804043f4:	07d00593          	li	a1,125
804043f8:	00010517          	auipc	a0,0x10
804043fc:	03450513          	addi	a0,a0,52 # 8041442c <default_pmm_manager+0x3d0>
80404400:	a24fc0ef          	jal	ra,80400624 <__panic>
80404404:	00010697          	auipc	a3,0x10
80404408:	19c68693          	addi	a3,a3,412 # 804145a0 <default_pmm_manager+0x544>
8040440c:	0000f617          	auipc	a2,0xf
80404410:	3d460613          	addi	a2,a2,980 # 804137e0 <commands+0x1bc>
80404414:	07f00593          	li	a1,127
80404418:	00010517          	auipc	a0,0x10
8040441c:	01450513          	addi	a0,a0,20 # 8041442c <default_pmm_manager+0x3d0>
80404420:	a04fc0ef          	jal	ra,80400624 <__panic>
80404424:	00010697          	auipc	a3,0x10
80404428:	13068693          	addi	a3,a3,304 # 80414554 <default_pmm_manager+0x4f8>
8040442c:	0000f617          	auipc	a2,0xf
80404430:	3b460613          	addi	a2,a2,948 # 804137e0 <commands+0x1bc>
80404434:	0d100593          	li	a1,209
80404438:	00010517          	auipc	a0,0x10
8040443c:	ff450513          	addi	a0,a0,-12 # 8041442c <default_pmm_manager+0x3d0>
80404440:	9e4fc0ef          	jal	ra,80400624 <__panic>
80404444:	00010697          	auipc	a3,0x10
80404448:	0a868693          	addi	a3,a3,168 # 804144ec <default_pmm_manager+0x490>
8040444c:	0000f617          	auipc	a2,0xf
80404450:	39460613          	addi	a2,a2,916 # 804137e0 <commands+0x1bc>
80404454:	0be00593          	li	a1,190
80404458:	00010517          	auipc	a0,0x10
8040445c:	fd450513          	addi	a0,a0,-44 # 8041442c <default_pmm_manager+0x3d0>
80404460:	9c4fc0ef          	jal	ra,80400624 <__panic>
80404464:	00010697          	auipc	a3,0x10
80404468:	17868693          	addi	a3,a3,376 # 804145dc <default_pmm_manager+0x580>
8040446c:	0000f617          	auipc	a2,0xf
80404470:	37460613          	addi	a2,a2,884 # 804137e0 <commands+0x1bc>
80404474:	08900593          	li	a1,137
80404478:	00010517          	auipc	a0,0x10
8040447c:	fb450513          	addi	a0,a0,-76 # 8041442c <default_pmm_manager+0x3d0>
80404480:	9a4fc0ef          	jal	ra,80400624 <__panic>
80404484:	00010697          	auipc	a3,0x10
80404488:	15868693          	addi	a3,a3,344 # 804145dc <default_pmm_manager+0x580>
8040448c:	0000f617          	auipc	a2,0xf
80404490:	35460613          	addi	a2,a2,852 # 804137e0 <commands+0x1bc>
80404494:	08b00593          	li	a1,139
80404498:	00010517          	auipc	a0,0x10
8040449c:	f9450513          	addi	a0,a0,-108 # 8041442c <default_pmm_manager+0x3d0>
804044a0:	984fc0ef          	jal	ra,80400624 <__panic>
804044a4:	00010697          	auipc	a3,0x10
804044a8:	a0c68693          	addi	a3,a3,-1524 # 80413eb0 <commands+0x88c>
804044ac:	0000f617          	auipc	a2,0xf
804044b0:	33460613          	addi	a2,a2,820 # 804137e0 <commands+0x1bc>
804044b4:	0da00593          	li	a1,218
804044b8:	00010517          	auipc	a0,0x10
804044bc:	f7450513          	addi	a0,a0,-140 # 8041442c <default_pmm_manager+0x3d0>
804044c0:	964fc0ef          	jal	ra,80400624 <__panic>
804044c4:	00010697          	auipc	a3,0x10
804044c8:	d6868693          	addi	a3,a3,-664 # 8041422c <default_pmm_manager+0x1d0>
804044cc:	0000f617          	auipc	a2,0xf
804044d0:	31460613          	addi	a2,a2,788 # 804137e0 <commands+0x1bc>
804044d4:	0ea00593          	li	a1,234
804044d8:	00010517          	auipc	a0,0x10
804044dc:	f5450513          	addi	a0,a0,-172 # 8041442c <default_pmm_manager+0x3d0>
804044e0:	944fc0ef          	jal	ra,80400624 <__panic>
804044e4:	00010697          	auipc	a3,0x10
804044e8:	f9468693          	addi	a3,a3,-108 # 80414478 <default_pmm_manager+0x41c>
804044ec:	0000f617          	auipc	a2,0xf
804044f0:	2f460613          	addi	a2,a2,756 # 804137e0 <commands+0x1bc>
804044f4:	0aa00593          	li	a1,170
804044f8:	00010517          	auipc	a0,0x10
804044fc:	f3450513          	addi	a0,a0,-204 # 8041442c <default_pmm_manager+0x3d0>
80404500:	924fc0ef          	jal	ra,80400624 <__panic>
80404504:	00010697          	auipc	a3,0x10
80404508:	f8068693          	addi	a3,a3,-128 # 80414484 <default_pmm_manager+0x428>
8040450c:	0000f617          	auipc	a2,0xf
80404510:	2d460613          	addi	a2,a2,724 # 804137e0 <commands+0x1bc>
80404514:	0ad00593          	li	a1,173
80404518:	00010517          	auipc	a0,0x10
8040451c:	f1450513          	addi	a0,a0,-236 # 8041442c <default_pmm_manager+0x3d0>
80404520:	904fc0ef          	jal	ra,80400624 <__panic>
80404524:	00010697          	auipc	a3,0x10
80404528:	f7868693          	addi	a3,a3,-136 # 8041449c <default_pmm_manager+0x440>
8040452c:	0000f617          	auipc	a2,0xf
80404530:	2b460613          	addi	a2,a2,692 # 804137e0 <commands+0x1bc>
80404534:	0b200593          	li	a1,178
80404538:	00010517          	auipc	a0,0x10
8040453c:	ef450513          	addi	a0,a0,-268 # 8041442c <default_pmm_manager+0x3d0>
80404540:	8e4fc0ef          	jal	ra,80400624 <__panic>
80404544:	00010697          	auipc	a3,0x10
80404548:	f6868693          	addi	a3,a3,-152 # 804144ac <default_pmm_manager+0x450>
8040454c:	0000f617          	auipc	a2,0xf
80404550:	29460613          	addi	a2,a2,660 # 804137e0 <commands+0x1bc>
80404554:	0b600593          	li	a1,182
80404558:	00010517          	auipc	a0,0x10
8040455c:	ed450513          	addi	a0,a0,-300 # 8041442c <default_pmm_manager+0x3d0>
80404560:	8c4fc0ef          	jal	ra,80400624 <__panic>
80404564:	0000f697          	auipc	a3,0xf
80404568:	7c068693          	addi	a3,a3,1984 # 80413d24 <commands+0x700>
8040456c:	0000f617          	auipc	a2,0xf
80404570:	27460613          	addi	a2,a2,628 # 804137e0 <commands+0x1bc>
80404574:	0a500593          	li	a1,165
80404578:	00010517          	auipc	a0,0x10
8040457c:	eb450513          	addi	a0,a0,-332 # 8041442c <default_pmm_manager+0x3d0>
80404580:	8a4fc0ef          	jal	ra,80400624 <__panic>

80404584 <swap_init_mm>:
80404584:	00098797          	auipc	a5,0x98
80404588:	22078793          	addi	a5,a5,544 # 8049c7a4 <sm>
8040458c:	0007a783          	lw	a5,0(a5)
80404590:	0087a303          	lw	t1,8(a5)
80404594:	00030067          	jr	t1

80404598 <swap_map_swappable>:
80404598:	00098797          	auipc	a5,0x98
8040459c:	20c78793          	addi	a5,a5,524 # 8049c7a4 <sm>
804045a0:	0007a783          	lw	a5,0(a5)
804045a4:	0107a303          	lw	t1,16(a5)
804045a8:	00030067          	jr	t1

804045ac <swap_out>:
804045ac:	fc010113          	addi	sp,sp,-64
804045b0:	02112e23          	sw	ra,60(sp)
804045b4:	02812c23          	sw	s0,56(sp)
804045b8:	02912a23          	sw	s1,52(sp)
804045bc:	03212823          	sw	s2,48(sp)
804045c0:	03312623          	sw	s3,44(sp)
804045c4:	03412423          	sw	s4,40(sp)
804045c8:	03512223          	sw	s5,36(sp)
804045cc:	03612023          	sw	s6,32(sp)
804045d0:	01712e23          	sw	s7,28(sp)
804045d4:	01812c23          	sw	s8,24(sp)
804045d8:	14058c63          	beqz	a1,80404730 <swap_out+0x184>
804045dc:	00060a93          	mv	s5,a2
804045e0:	00050913          	mv	s2,a0
804045e4:	00058a13          	mv	s4,a1
804045e8:	00000413          	li	s0,0
804045ec:	00098997          	auipc	s3,0x98
804045f0:	1b898993          	addi	s3,s3,440 # 8049c7a4 <sm>
804045f4:	00010b17          	auipc	s6,0x10
804045f8:	0fcb0b13          	addi	s6,s6,252 # 804146f0 <default_pmm_manager+0x694>
804045fc:	00010b97          	auipc	s7,0x10
80404600:	0dcb8b93          	addi	s7,s7,220 # 804146d8 <default_pmm_manager+0x67c>
80404604:	0580006f          	j	8040465c <swap_out+0xb0>
80404608:	00c12783          	lw	a5,12(sp)
8040460c:	00048613          	mv	a2,s1
80404610:	00040593          	mv	a1,s0
80404614:	01c7a683          	lw	a3,28(a5)
80404618:	000b0513          	mv	a0,s6
8040461c:	00140413          	addi	s0,s0,1
80404620:	00c6d693          	srli	a3,a3,0xc
80404624:	00168693          	addi	a3,a3,1
80404628:	bd5fb0ef          	jal	ra,804001fc <cprintf>
8040462c:	00c12503          	lw	a0,12(sp)
80404630:	00100593          	li	a1,1
80404634:	01c52783          	lw	a5,28(a0)
80404638:	00c7d793          	srli	a5,a5,0xc
8040463c:	00178793          	addi	a5,a5,1
80404640:	00879793          	slli	a5,a5,0x8
80404644:	00fc2023          	sw	a5,0(s8)
80404648:	e00fe0ef          	jal	ra,80402c48 <free_pages>
8040464c:	00c92503          	lw	a0,12(s2)
80404650:	00048593          	mv	a1,s1
80404654:	88cff0ef          	jal	ra,804036e0 <tlb_invalidate>
80404658:	088a0863          	beq	s4,s0,804046e8 <swap_out+0x13c>
8040465c:	0009a783          	lw	a5,0(s3)
80404660:	000a8613          	mv	a2,s5
80404664:	00c10593          	addi	a1,sp,12
80404668:	0187a783          	lw	a5,24(a5)
8040466c:	00090513          	mv	a0,s2
80404670:	000780e7          	jalr	a5
80404674:	0a051463          	bnez	a0,8040471c <swap_out+0x170>
80404678:	00c12783          	lw	a5,12(sp)
8040467c:	00c92503          	lw	a0,12(s2)
80404680:	00000613          	li	a2,0
80404684:	01c7a483          	lw	s1,28(a5)
80404688:	00048593          	mv	a1,s1
8040468c:	e88fe0ef          	jal	ra,80402d14 <get_pte>
80404690:	00052783          	lw	a5,0(a0)
80404694:	00050c13          	mv	s8,a0
80404698:	0017f793          	andi	a5,a5,1
8040469c:	08078e63          	beqz	a5,80404738 <swap_out+0x18c>
804046a0:	00c12583          	lw	a1,12(sp)
804046a4:	01c5a783          	lw	a5,28(a1) # 101c <_binary_bin_swap_img_size-0x6fe4>
804046a8:	00c7d793          	srli	a5,a5,0xc
804046ac:	00178513          	addi	a0,a5,1
804046b0:	00851513          	slli	a0,a0,0x8
804046b4:	7a0090ef          	jal	ra,8040de54 <swapfs_write>
804046b8:	f40508e3          	beqz	a0,80404608 <swap_out+0x5c>
804046bc:	000b8513          	mv	a0,s7
804046c0:	b3dfb0ef          	jal	ra,804001fc <cprintf>
804046c4:	0009a783          	lw	a5,0(s3)
804046c8:	00c12603          	lw	a2,12(sp)
804046cc:	00000693          	li	a3,0
804046d0:	0107a783          	lw	a5,16(a5)
804046d4:	00048593          	mv	a1,s1
804046d8:	00090513          	mv	a0,s2
804046dc:	00140413          	addi	s0,s0,1
804046e0:	000780e7          	jalr	a5
804046e4:	f68a1ce3          	bne	s4,s0,8040465c <swap_out+0xb0>
804046e8:	00040513          	mv	a0,s0
804046ec:	03c12083          	lw	ra,60(sp)
804046f0:	03812403          	lw	s0,56(sp)
804046f4:	03412483          	lw	s1,52(sp)
804046f8:	03012903          	lw	s2,48(sp)
804046fc:	02c12983          	lw	s3,44(sp)
80404700:	02812a03          	lw	s4,40(sp)
80404704:	02412a83          	lw	s5,36(sp)
80404708:	02012b03          	lw	s6,32(sp)
8040470c:	01c12b83          	lw	s7,28(sp)
80404710:	01812c03          	lw	s8,24(sp)
80404714:	04010113          	addi	sp,sp,64
80404718:	00008067          	ret
8040471c:	00040593          	mv	a1,s0
80404720:	00010517          	auipc	a0,0x10
80404724:	f7050513          	addi	a0,a0,-144 # 80414690 <default_pmm_manager+0x634>
80404728:	ad5fb0ef          	jal	ra,804001fc <cprintf>
8040472c:	fbdff06f          	j	804046e8 <swap_out+0x13c>
80404730:	00000413          	li	s0,0
80404734:	fb5ff06f          	j	804046e8 <swap_out+0x13c>
80404738:	00010697          	auipc	a3,0x10
8040473c:	f8868693          	addi	a3,a3,-120 # 804146c0 <default_pmm_manager+0x664>
80404740:	0000f617          	auipc	a2,0xf
80404744:	0a060613          	addi	a2,a2,160 # 804137e0 <commands+0x1bc>
80404748:	05500593          	li	a1,85
8040474c:	00010517          	auipc	a0,0x10
80404750:	ce050513          	addi	a0,a0,-800 # 8041442c <default_pmm_manager+0x3d0>
80404754:	ed1fb0ef          	jal	ra,80400624 <__panic>

80404758 <swap_in>:
80404758:	fe010113          	addi	sp,sp,-32
8040475c:	01212823          	sw	s2,16(sp)
80404760:	00050913          	mv	s2,a0
80404764:	00100513          	li	a0,1
80404768:	00912a23          	sw	s1,20(sp)
8040476c:	01312623          	sw	s3,12(sp)
80404770:	00112e23          	sw	ra,28(sp)
80404774:	00812c23          	sw	s0,24(sp)
80404778:	00058493          	mv	s1,a1
8040477c:	00060993          	mv	s3,a2
80404780:	c00fe0ef          	jal	ra,80402b80 <alloc_pages>
80404784:	06050263          	beqz	a0,804047e8 <swap_in+0x90>
80404788:	00050413          	mv	s0,a0
8040478c:	00c92503          	lw	a0,12(s2)
80404790:	00000613          	li	a2,0
80404794:	00048593          	mv	a1,s1
80404798:	d7cfe0ef          	jal	ra,80402d14 <get_pte>
8040479c:	00050913          	mv	s2,a0
804047a0:	00052503          	lw	a0,0(a0)
804047a4:	00040593          	mv	a1,s0
804047a8:	5ec090ef          	jal	ra,8040dd94 <swapfs_read>
804047ac:	00092583          	lw	a1,0(s2)
804047b0:	00048613          	mv	a2,s1
804047b4:	00010517          	auipc	a0,0x10
804047b8:	c1c50513          	addi	a0,a0,-996 # 804143d0 <default_pmm_manager+0x374>
804047bc:	0085d593          	srli	a1,a1,0x8
804047c0:	a3dfb0ef          	jal	ra,804001fc <cprintf>
804047c4:	01c12083          	lw	ra,28(sp)
804047c8:	0089a023          	sw	s0,0(s3)
804047cc:	01812403          	lw	s0,24(sp)
804047d0:	01412483          	lw	s1,20(sp)
804047d4:	01012903          	lw	s2,16(sp)
804047d8:	00c12983          	lw	s3,12(sp)
804047dc:	00000513          	li	a0,0
804047e0:	02010113          	addi	sp,sp,32
804047e4:	00008067          	ret
804047e8:	00010697          	auipc	a3,0x10
804047ec:	bd868693          	addi	a3,a3,-1064 # 804143c0 <default_pmm_manager+0x364>
804047f0:	0000f617          	auipc	a2,0xf
804047f4:	ff060613          	addi	a2,a2,-16 # 804137e0 <commands+0x1bc>
804047f8:	06b00593          	li	a1,107
804047fc:	00010517          	auipc	a0,0x10
80404800:	c3050513          	addi	a0,a0,-976 # 8041442c <default_pmm_manager+0x3d0>
80404804:	e21fb0ef          	jal	ra,80400624 <__panic>

80404808 <_fifo_init_mm>:
80404808:	00098797          	auipc	a5,0x98
8040480c:	0a478793          	addi	a5,a5,164 # 8049c8ac <pra_list_head>
80404810:	00f52a23          	sw	a5,20(a0)
80404814:	00f7a223          	sw	a5,4(a5)
80404818:	00f7a023          	sw	a5,0(a5)
8040481c:	00000513          	li	a0,0
80404820:	00008067          	ret

80404824 <_fifo_init>:
80404824:	00000513          	li	a0,0
80404828:	00008067          	ret

8040482c <_fifo_set_unswappable>:
8040482c:	00000513          	li	a0,0
80404830:	00008067          	ret

80404834 <_fifo_tick_event>:
80404834:	00000513          	li	a0,0
80404838:	00008067          	ret

8040483c <_fifo_check_swap>:
8040483c:	fd010113          	addi	sp,sp,-48
80404840:	01312e23          	sw	s3,28(sp)
80404844:	01412c23          	sw	s4,24(sp)
80404848:	00010517          	auipc	a0,0x10
8040484c:	ee850513          	addi	a0,a0,-280 # 80414730 <default_pmm_manager+0x6d4>
80404850:	000039b7          	lui	s3,0x3
80404854:	00c00a13          	li	s4,12
80404858:	02812423          	sw	s0,40(sp)
8040485c:	02912223          	sw	s1,36(sp)
80404860:	02112623          	sw	ra,44(sp)
80404864:	03212023          	sw	s2,32(sp)
80404868:	01512a23          	sw	s5,20(sp)
8040486c:	01612823          	sw	s6,16(sp)
80404870:	01712623          	sw	s7,12(sp)
80404874:	01812423          	sw	s8,8(sp)
80404878:	01912223          	sw	s9,4(sp)
8040487c:	00098417          	auipc	s0,0x98
80404880:	f3040413          	addi	s0,s0,-208 # 8049c7ac <pgfault_num>
80404884:	979fb0ef          	jal	ra,804001fc <cprintf>
80404888:	01498023          	sb	s4,0(s3) # 3000 <_binary_bin_swap_img_size-0x5000>
8040488c:	00042483          	lw	s1,0(s0)
80404890:	00400793          	li	a5,4
80404894:	18f49863          	bne	s1,a5,80404a24 <_fifo_check_swap+0x1e8>
80404898:	00010517          	auipc	a0,0x10
8040489c:	ed450513          	addi	a0,a0,-300 # 8041476c <default_pmm_manager+0x710>
804048a0:	00001b37          	lui	s6,0x1
804048a4:	00a00b93          	li	s7,10
804048a8:	955fb0ef          	jal	ra,804001fc <cprintf>
804048ac:	017b0023          	sb	s7,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
804048b0:	00042903          	lw	s2,0(s0)
804048b4:	2e991863          	bne	s2,s1,80404ba4 <_fifo_check_swap+0x368>
804048b8:	00010517          	auipc	a0,0x10
804048bc:	edc50513          	addi	a0,a0,-292 # 80414794 <default_pmm_manager+0x738>
804048c0:	00004c37          	lui	s8,0x4
804048c4:	00d00c93          	li	s9,13
804048c8:	935fb0ef          	jal	ra,804001fc <cprintf>
804048cc:	019c0023          	sb	s9,0(s8) # 4000 <_binary_bin_swap_img_size-0x4000>
804048d0:	00042a83          	lw	s5,0(s0)
804048d4:	2b2a9863          	bne	s5,s2,80404b84 <_fifo_check_swap+0x348>
804048d8:	00010517          	auipc	a0,0x10
804048dc:	ee450513          	addi	a0,a0,-284 # 804147bc <default_pmm_manager+0x760>
804048e0:	000024b7          	lui	s1,0x2
804048e4:	00b00913          	li	s2,11
804048e8:	915fb0ef          	jal	ra,804001fc <cprintf>
804048ec:	01248023          	sb	s2,0(s1) # 2000 <_binary_bin_swap_img_size-0x6000>
804048f0:	00042783          	lw	a5,0(s0)
804048f4:	27579863          	bne	a5,s5,80404b64 <_fifo_check_swap+0x328>
804048f8:	00010517          	auipc	a0,0x10
804048fc:	eec50513          	addi	a0,a0,-276 # 804147e4 <default_pmm_manager+0x788>
80404900:	8fdfb0ef          	jal	ra,804001fc <cprintf>
80404904:	000057b7          	lui	a5,0x5
80404908:	00e00713          	li	a4,14
8040490c:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80404910:	00042a83          	lw	s5,0(s0)
80404914:	00500793          	li	a5,5
80404918:	22fa9663          	bne	s5,a5,80404b44 <_fifo_check_swap+0x308>
8040491c:	00010517          	auipc	a0,0x10
80404920:	ea050513          	addi	a0,a0,-352 # 804147bc <default_pmm_manager+0x760>
80404924:	8d9fb0ef          	jal	ra,804001fc <cprintf>
80404928:	01248023          	sb	s2,0(s1)
8040492c:	00042783          	lw	a5,0(s0)
80404930:	1f579a63          	bne	a5,s5,80404b24 <_fifo_check_swap+0x2e8>
80404934:	00010517          	auipc	a0,0x10
80404938:	e3850513          	addi	a0,a0,-456 # 8041476c <default_pmm_manager+0x710>
8040493c:	8c1fb0ef          	jal	ra,804001fc <cprintf>
80404940:	017b0023          	sb	s7,0(s6)
80404944:	00042703          	lw	a4,0(s0)
80404948:	00600793          	li	a5,6
8040494c:	1af71c63          	bne	a4,a5,80404b04 <_fifo_check_swap+0x2c8>
80404950:	00010517          	auipc	a0,0x10
80404954:	e6c50513          	addi	a0,a0,-404 # 804147bc <default_pmm_manager+0x760>
80404958:	8a5fb0ef          	jal	ra,804001fc <cprintf>
8040495c:	01248023          	sb	s2,0(s1)
80404960:	00042703          	lw	a4,0(s0)
80404964:	00700793          	li	a5,7
80404968:	16f71e63          	bne	a4,a5,80404ae4 <_fifo_check_swap+0x2a8>
8040496c:	00010517          	auipc	a0,0x10
80404970:	dc450513          	addi	a0,a0,-572 # 80414730 <default_pmm_manager+0x6d4>
80404974:	889fb0ef          	jal	ra,804001fc <cprintf>
80404978:	01498023          	sb	s4,0(s3)
8040497c:	00042703          	lw	a4,0(s0)
80404980:	00800793          	li	a5,8
80404984:	14f71063          	bne	a4,a5,80404ac4 <_fifo_check_swap+0x288>
80404988:	00010517          	auipc	a0,0x10
8040498c:	e0c50513          	addi	a0,a0,-500 # 80414794 <default_pmm_manager+0x738>
80404990:	86dfb0ef          	jal	ra,804001fc <cprintf>
80404994:	019c0023          	sb	s9,0(s8)
80404998:	00042703          	lw	a4,0(s0)
8040499c:	00900793          	li	a5,9
804049a0:	10f71263          	bne	a4,a5,80404aa4 <_fifo_check_swap+0x268>
804049a4:	00010517          	auipc	a0,0x10
804049a8:	e4050513          	addi	a0,a0,-448 # 804147e4 <default_pmm_manager+0x788>
804049ac:	851fb0ef          	jal	ra,804001fc <cprintf>
804049b0:	000057b7          	lui	a5,0x5
804049b4:	00e00713          	li	a4,14
804049b8:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
804049bc:	00042483          	lw	s1,0(s0)
804049c0:	00a00793          	li	a5,10
804049c4:	0cf49063          	bne	s1,a5,80404a84 <_fifo_check_swap+0x248>
804049c8:	00010517          	auipc	a0,0x10
804049cc:	da450513          	addi	a0,a0,-604 # 8041476c <default_pmm_manager+0x710>
804049d0:	82dfb0ef          	jal	ra,804001fc <cprintf>
804049d4:	000017b7          	lui	a5,0x1
804049d8:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
804049dc:	08979463          	bne	a5,s1,80404a64 <_fifo_check_swap+0x228>
804049e0:	00042703          	lw	a4,0(s0)
804049e4:	00b00793          	li	a5,11
804049e8:	04f71e63          	bne	a4,a5,80404a44 <_fifo_check_swap+0x208>
804049ec:	02c12083          	lw	ra,44(sp)
804049f0:	02812403          	lw	s0,40(sp)
804049f4:	02412483          	lw	s1,36(sp)
804049f8:	02012903          	lw	s2,32(sp)
804049fc:	01c12983          	lw	s3,28(sp)
80404a00:	01812a03          	lw	s4,24(sp)
80404a04:	01412a83          	lw	s5,20(sp)
80404a08:	01012b03          	lw	s6,16(sp)
80404a0c:	00c12b83          	lw	s7,12(sp)
80404a10:	00812c03          	lw	s8,8(sp)
80404a14:	00412c83          	lw	s9,4(sp)
80404a18:	00000513          	li	a0,0
80404a1c:	03010113          	addi	sp,sp,48
80404a20:	00008067          	ret
80404a24:	00010697          	auipc	a3,0x10
80404a28:	bb868693          	addi	a3,a3,-1096 # 804145dc <default_pmm_manager+0x580>
80404a2c:	0000f617          	auipc	a2,0xf
80404a30:	db460613          	addi	a2,a2,-588 # 804137e0 <commands+0x1bc>
80404a34:	05f00593          	li	a1,95
80404a38:	00010517          	auipc	a0,0x10
80404a3c:	d2050513          	addi	a0,a0,-736 # 80414758 <default_pmm_manager+0x6fc>
80404a40:	be5fb0ef          	jal	ra,80400624 <__panic>
80404a44:	00010697          	auipc	a3,0x10
80404a48:	e6468693          	addi	a3,a3,-412 # 804148a8 <default_pmm_manager+0x84c>
80404a4c:	0000f617          	auipc	a2,0xf
80404a50:	d9460613          	addi	a2,a2,-620 # 804137e0 <commands+0x1bc>
80404a54:	08100593          	li	a1,129
80404a58:	00010517          	auipc	a0,0x10
80404a5c:	d0050513          	addi	a0,a0,-768 # 80414758 <default_pmm_manager+0x6fc>
80404a60:	bc5fb0ef          	jal	ra,80400624 <__panic>
80404a64:	00010697          	auipc	a3,0x10
80404a68:	e2068693          	addi	a3,a3,-480 # 80414884 <default_pmm_manager+0x828>
80404a6c:	0000f617          	auipc	a2,0xf
80404a70:	d7460613          	addi	a2,a2,-652 # 804137e0 <commands+0x1bc>
80404a74:	07f00593          	li	a1,127
80404a78:	00010517          	auipc	a0,0x10
80404a7c:	ce050513          	addi	a0,a0,-800 # 80414758 <default_pmm_manager+0x6fc>
80404a80:	ba5fb0ef          	jal	ra,80400624 <__panic>
80404a84:	00010697          	auipc	a3,0x10
80404a88:	dec68693          	addi	a3,a3,-532 # 80414870 <default_pmm_manager+0x814>
80404a8c:	0000f617          	auipc	a2,0xf
80404a90:	d5460613          	addi	a2,a2,-684 # 804137e0 <commands+0x1bc>
80404a94:	07d00593          	li	a1,125
80404a98:	00010517          	auipc	a0,0x10
80404a9c:	cc050513          	addi	a0,a0,-832 # 80414758 <default_pmm_manager+0x6fc>
80404aa0:	b85fb0ef          	jal	ra,80400624 <__panic>
80404aa4:	00010697          	auipc	a3,0x10
80404aa8:	db868693          	addi	a3,a3,-584 # 8041485c <default_pmm_manager+0x800>
80404aac:	0000f617          	auipc	a2,0xf
80404ab0:	d3460613          	addi	a2,a2,-716 # 804137e0 <commands+0x1bc>
80404ab4:	07a00593          	li	a1,122
80404ab8:	00010517          	auipc	a0,0x10
80404abc:	ca050513          	addi	a0,a0,-864 # 80414758 <default_pmm_manager+0x6fc>
80404ac0:	b65fb0ef          	jal	ra,80400624 <__panic>
80404ac4:	00010697          	auipc	a3,0x10
80404ac8:	d8468693          	addi	a3,a3,-636 # 80414848 <default_pmm_manager+0x7ec>
80404acc:	0000f617          	auipc	a2,0xf
80404ad0:	d1460613          	addi	a2,a2,-748 # 804137e0 <commands+0x1bc>
80404ad4:	07700593          	li	a1,119
80404ad8:	00010517          	auipc	a0,0x10
80404adc:	c8050513          	addi	a0,a0,-896 # 80414758 <default_pmm_manager+0x6fc>
80404ae0:	b45fb0ef          	jal	ra,80400624 <__panic>
80404ae4:	00010697          	auipc	a3,0x10
80404ae8:	d5068693          	addi	a3,a3,-688 # 80414834 <default_pmm_manager+0x7d8>
80404aec:	0000f617          	auipc	a2,0xf
80404af0:	cf460613          	addi	a2,a2,-780 # 804137e0 <commands+0x1bc>
80404af4:	07400593          	li	a1,116
80404af8:	00010517          	auipc	a0,0x10
80404afc:	c6050513          	addi	a0,a0,-928 # 80414758 <default_pmm_manager+0x6fc>
80404b00:	b25fb0ef          	jal	ra,80400624 <__panic>
80404b04:	00010697          	auipc	a3,0x10
80404b08:	d1c68693          	addi	a3,a3,-740 # 80414820 <default_pmm_manager+0x7c4>
80404b0c:	0000f617          	auipc	a2,0xf
80404b10:	cd460613          	addi	a2,a2,-812 # 804137e0 <commands+0x1bc>
80404b14:	07100593          	li	a1,113
80404b18:	00010517          	auipc	a0,0x10
80404b1c:	c4050513          	addi	a0,a0,-960 # 80414758 <default_pmm_manager+0x6fc>
80404b20:	b05fb0ef          	jal	ra,80400624 <__panic>
80404b24:	00010697          	auipc	a3,0x10
80404b28:	ce868693          	addi	a3,a3,-792 # 8041480c <default_pmm_manager+0x7b0>
80404b2c:	0000f617          	auipc	a2,0xf
80404b30:	cb460613          	addi	a2,a2,-844 # 804137e0 <commands+0x1bc>
80404b34:	06e00593          	li	a1,110
80404b38:	00010517          	auipc	a0,0x10
80404b3c:	c2050513          	addi	a0,a0,-992 # 80414758 <default_pmm_manager+0x6fc>
80404b40:	ae5fb0ef          	jal	ra,80400624 <__panic>
80404b44:	00010697          	auipc	a3,0x10
80404b48:	cc868693          	addi	a3,a3,-824 # 8041480c <default_pmm_manager+0x7b0>
80404b4c:	0000f617          	auipc	a2,0xf
80404b50:	c9460613          	addi	a2,a2,-876 # 804137e0 <commands+0x1bc>
80404b54:	06b00593          	li	a1,107
80404b58:	00010517          	auipc	a0,0x10
80404b5c:	c0050513          	addi	a0,a0,-1024 # 80414758 <default_pmm_manager+0x6fc>
80404b60:	ac5fb0ef          	jal	ra,80400624 <__panic>
80404b64:	00010697          	auipc	a3,0x10
80404b68:	a7868693          	addi	a3,a3,-1416 # 804145dc <default_pmm_manager+0x580>
80404b6c:	0000f617          	auipc	a2,0xf
80404b70:	c7460613          	addi	a2,a2,-908 # 804137e0 <commands+0x1bc>
80404b74:	06800593          	li	a1,104
80404b78:	00010517          	auipc	a0,0x10
80404b7c:	be050513          	addi	a0,a0,-1056 # 80414758 <default_pmm_manager+0x6fc>
80404b80:	aa5fb0ef          	jal	ra,80400624 <__panic>
80404b84:	00010697          	auipc	a3,0x10
80404b88:	a5868693          	addi	a3,a3,-1448 # 804145dc <default_pmm_manager+0x580>
80404b8c:	0000f617          	auipc	a2,0xf
80404b90:	c5460613          	addi	a2,a2,-940 # 804137e0 <commands+0x1bc>
80404b94:	06500593          	li	a1,101
80404b98:	00010517          	auipc	a0,0x10
80404b9c:	bc050513          	addi	a0,a0,-1088 # 80414758 <default_pmm_manager+0x6fc>
80404ba0:	a85fb0ef          	jal	ra,80400624 <__panic>
80404ba4:	00010697          	auipc	a3,0x10
80404ba8:	a3868693          	addi	a3,a3,-1480 # 804145dc <default_pmm_manager+0x580>
80404bac:	0000f617          	auipc	a2,0xf
80404bb0:	c3460613          	addi	a2,a2,-972 # 804137e0 <commands+0x1bc>
80404bb4:	06200593          	li	a1,98
80404bb8:	00010517          	auipc	a0,0x10
80404bbc:	ba050513          	addi	a0,a0,-1120 # 80414758 <default_pmm_manager+0x6fc>
80404bc0:	a65fb0ef          	jal	ra,80400624 <__panic>

80404bc4 <_fifo_swap_out_victim>:
80404bc4:	01452783          	lw	a5,20(a0)
80404bc8:	ff010113          	addi	sp,sp,-16
80404bcc:	00112623          	sw	ra,12(sp)
80404bd0:	02078a63          	beqz	a5,80404c04 <_fifo_swap_out_victim+0x40>
80404bd4:	04061863          	bnez	a2,80404c24 <_fifo_swap_out_victim+0x60>
80404bd8:	0047a783          	lw	a5,4(a5)
80404bdc:	00c12083          	lw	ra,12(sp)
80404be0:	00000513          	li	a0,0
80404be4:	0007a683          	lw	a3,0(a5)
80404be8:	0047a703          	lw	a4,4(a5)
80404bec:	fec78793          	addi	a5,a5,-20
80404bf0:	00e6a223          	sw	a4,4(a3)
80404bf4:	00d72023          	sw	a3,0(a4)
80404bf8:	00f5a023          	sw	a5,0(a1)
80404bfc:	01010113          	addi	sp,sp,16
80404c00:	00008067          	ret
80404c04:	00010697          	auipc	a3,0x10
80404c08:	cd868693          	addi	a3,a3,-808 # 804148dc <default_pmm_manager+0x880>
80404c0c:	0000f617          	auipc	a2,0xf
80404c10:	bd460613          	addi	a2,a2,-1068 # 804137e0 <commands+0x1bc>
80404c14:	05000593          	li	a1,80
80404c18:	00010517          	auipc	a0,0x10
80404c1c:	b4050513          	addi	a0,a0,-1216 # 80414758 <default_pmm_manager+0x6fc>
80404c20:	a05fb0ef          	jal	ra,80400624 <__panic>
80404c24:	00010697          	auipc	a3,0x10
80404c28:	cc868693          	addi	a3,a3,-824 # 804148ec <default_pmm_manager+0x890>
80404c2c:	0000f617          	auipc	a2,0xf
80404c30:	bb460613          	addi	a2,a2,-1100 # 804137e0 <commands+0x1bc>
80404c34:	05100593          	li	a1,81
80404c38:	00010517          	auipc	a0,0x10
80404c3c:	b2050513          	addi	a0,a0,-1248 # 80414758 <default_pmm_manager+0x6fc>
80404c40:	9e5fb0ef          	jal	ra,80400624 <__panic>

80404c44 <_fifo_map_swappable>:
80404c44:	01460713          	addi	a4,a2,20
80404c48:	01452783          	lw	a5,20(a0)
80404c4c:	02070263          	beqz	a4,80404c70 <_fifo_map_swappable+0x2c>
80404c50:	02078063          	beqz	a5,80404c70 <_fifo_map_swappable+0x2c>
80404c54:	0007a683          	lw	a3,0(a5)
80404c58:	00e7a023          	sw	a4,0(a5)
80404c5c:	00000513          	li	a0,0
80404c60:	00e6a223          	sw	a4,4(a3)
80404c64:	00f62c23          	sw	a5,24(a2)
80404c68:	00d62a23          	sw	a3,20(a2)
80404c6c:	00008067          	ret
80404c70:	ff010113          	addi	sp,sp,-16
80404c74:	00010697          	auipc	a3,0x10
80404c78:	c4868693          	addi	a3,a3,-952 # 804148bc <default_pmm_manager+0x860>
80404c7c:	0000f617          	auipc	a2,0xf
80404c80:	b6460613          	addi	a2,a2,-1180 # 804137e0 <commands+0x1bc>
80404c84:	03f00593          	li	a1,63
80404c88:	00010517          	auipc	a0,0x10
80404c8c:	ad050513          	addi	a0,a0,-1328 # 80414758 <default_pmm_manager+0x6fc>
80404c90:	00112623          	sw	ra,12(sp)
80404c94:	991fb0ef          	jal	ra,80400624 <__panic>

80404c98 <check_vma_overlap.isra.2.part.3>:
80404c98:	ff010113          	addi	sp,sp,-16
80404c9c:	00010697          	auipc	a3,0x10
80404ca0:	c7468693          	addi	a3,a3,-908 # 80414910 <default_pmm_manager+0x8b4>
80404ca4:	0000f617          	auipc	a2,0xf
80404ca8:	b3c60613          	addi	a2,a2,-1220 # 804137e0 <commands+0x1bc>
80404cac:	06d00593          	li	a1,109
80404cb0:	00010517          	auipc	a0,0x10
80404cb4:	c8050513          	addi	a0,a0,-896 # 80414930 <default_pmm_manager+0x8d4>
80404cb8:	00112623          	sw	ra,12(sp)
80404cbc:	969fb0ef          	jal	ra,80400624 <__panic>

80404cc0 <mm_create>:
80404cc0:	ff010113          	addi	sp,sp,-16
80404cc4:	02c00513          	li	a0,44
80404cc8:	00812423          	sw	s0,8(sp)
80404ccc:	00112623          	sw	ra,12(sp)
80404cd0:	b31fd0ef          	jal	ra,80402800 <kmalloc>
80404cd4:	00050413          	mv	s0,a0
80404cd8:	02050e63          	beqz	a0,80404d14 <mm_create+0x54>
80404cdc:	00098797          	auipc	a5,0x98
80404ce0:	acc78793          	addi	a5,a5,-1332 # 8049c7a8 <swap_init_ok>
80404ce4:	0007a783          	lw	a5,0(a5)
80404ce8:	00a42223          	sw	a0,4(s0)
80404cec:	00a42023          	sw	a0,0(s0)
80404cf0:	00052423          	sw	zero,8(a0)
80404cf4:	00052623          	sw	zero,12(a0)
80404cf8:	00052823          	sw	zero,16(a0)
80404cfc:	02079663          	bnez	a5,80404d28 <mm_create+0x68>
80404d00:	00052a23          	sw	zero,20(a0)
80404d04:	00042c23          	sw	zero,24(s0)
80404d08:	00100593          	li	a1,1
80404d0c:	01c40513          	addi	a0,s0,28
80404d10:	044010ef          	jal	ra,80405d54 <sem_init>
80404d14:	00040513          	mv	a0,s0
80404d18:	00c12083          	lw	ra,12(sp)
80404d1c:	00812403          	lw	s0,8(sp)
80404d20:	01010113          	addi	sp,sp,16
80404d24:	00008067          	ret
80404d28:	85dff0ef          	jal	ra,80404584 <swap_init_mm>
80404d2c:	fd9ff06f          	j	80404d04 <mm_create+0x44>

80404d30 <vma_create>:
80404d30:	ff010113          	addi	sp,sp,-16
80404d34:	01212023          	sw	s2,0(sp)
80404d38:	00050913          	mv	s2,a0
80404d3c:	01800513          	li	a0,24
80404d40:	00812423          	sw	s0,8(sp)
80404d44:	00912223          	sw	s1,4(sp)
80404d48:	00112623          	sw	ra,12(sp)
80404d4c:	00058493          	mv	s1,a1
80404d50:	00060413          	mv	s0,a2
80404d54:	aadfd0ef          	jal	ra,80402800 <kmalloc>
80404d58:	00050863          	beqz	a0,80404d68 <vma_create+0x38>
80404d5c:	01252223          	sw	s2,4(a0)
80404d60:	00952423          	sw	s1,8(a0)
80404d64:	00852623          	sw	s0,12(a0)
80404d68:	00c12083          	lw	ra,12(sp)
80404d6c:	00812403          	lw	s0,8(sp)
80404d70:	00412483          	lw	s1,4(sp)
80404d74:	00012903          	lw	s2,0(sp)
80404d78:	01010113          	addi	sp,sp,16
80404d7c:	00008067          	ret

80404d80 <find_vma>:
80404d80:	04050263          	beqz	a0,80404dc4 <find_vma+0x44>
80404d84:	00852783          	lw	a5,8(a0)
80404d88:	00078663          	beqz	a5,80404d94 <find_vma+0x14>
80404d8c:	0047a703          	lw	a4,4(a5)
80404d90:	04e5f063          	bgeu	a1,a4,80404dd0 <find_vma+0x50>
80404d94:	00050793          	mv	a5,a0
80404d98:	0047a783          	lw	a5,4(a5)
80404d9c:	02f50463          	beq	a0,a5,80404dc4 <find_vma+0x44>
80404da0:	ff47a703          	lw	a4,-12(a5)
80404da4:	fee5eae3          	bltu	a1,a4,80404d98 <find_vma+0x18>
80404da8:	ff87a703          	lw	a4,-8(a5)
80404dac:	fee5f6e3          	bgeu	a1,a4,80404d98 <find_vma+0x18>
80404db0:	ff078793          	addi	a5,a5,-16
80404db4:	00078863          	beqz	a5,80404dc4 <find_vma+0x44>
80404db8:	00f52423          	sw	a5,8(a0)
80404dbc:	00078513          	mv	a0,a5
80404dc0:	00008067          	ret
80404dc4:	00000793          	li	a5,0
80404dc8:	00078513          	mv	a0,a5
80404dcc:	00008067          	ret
80404dd0:	0087a703          	lw	a4,8(a5)
80404dd4:	fce5f0e3          	bgeu	a1,a4,80404d94 <find_vma+0x14>
80404dd8:	00f52423          	sw	a5,8(a0)
80404ddc:	fe1ff06f          	j	80404dbc <find_vma+0x3c>

80404de0 <insert_vma_struct>:
80404de0:	0045a603          	lw	a2,4(a1)
80404de4:	0085a803          	lw	a6,8(a1)
80404de8:	ff010113          	addi	sp,sp,-16
80404dec:	00112623          	sw	ra,12(sp)
80404df0:	00050713          	mv	a4,a0
80404df4:	01066a63          	bltu	a2,a6,80404e08 <insert_vma_struct+0x28>
80404df8:	07c0006f          	j	80404e74 <insert_vma_struct+0x94>
80404dfc:	ff47a683          	lw	a3,-12(a5)
80404e00:	06d66463          	bltu	a2,a3,80404e68 <insert_vma_struct+0x88>
80404e04:	00078713          	mv	a4,a5
80404e08:	00472783          	lw	a5,4(a4)
80404e0c:	fef518e3          	bne	a0,a5,80404dfc <insert_vma_struct+0x1c>
80404e10:	02a70463          	beq	a4,a0,80404e38 <insert_vma_struct+0x58>
80404e14:	ff872683          	lw	a3,-8(a4)
80404e18:	ff472883          	lw	a7,-12(a4)
80404e1c:	08d8fc63          	bgeu	a7,a3,80404eb4 <insert_vma_struct+0xd4>
80404e20:	06d66a63          	bltu	a2,a3,80404e94 <insert_vma_struct+0xb4>
80404e24:	00f50a63          	beq	a0,a5,80404e38 <insert_vma_struct+0x58>
80404e28:	ff47a683          	lw	a3,-12(a5)
80404e2c:	0706e463          	bltu	a3,a6,80404e94 <insert_vma_struct+0xb4>
80404e30:	ff87a603          	lw	a2,-8(a5)
80404e34:	02c6fe63          	bgeu	a3,a2,80404e70 <insert_vma_struct+0x90>
80404e38:	01052683          	lw	a3,16(a0)
80404e3c:	00a5a023          	sw	a0,0(a1)
80404e40:	01058613          	addi	a2,a1,16
80404e44:	00c7a023          	sw	a2,0(a5)
80404e48:	00c72223          	sw	a2,4(a4)
80404e4c:	00c12083          	lw	ra,12(sp)
80404e50:	00f5aa23          	sw	a5,20(a1)
80404e54:	00e5a823          	sw	a4,16(a1)
80404e58:	00168693          	addi	a3,a3,1
80404e5c:	00d52823          	sw	a3,16(a0)
80404e60:	01010113          	addi	sp,sp,16
80404e64:	00008067          	ret
80404e68:	faa716e3          	bne	a4,a0,80404e14 <insert_vma_struct+0x34>
80404e6c:	fc1ff06f          	j	80404e2c <insert_vma_struct+0x4c>
80404e70:	e29ff0ef          	jal	ra,80404c98 <check_vma_overlap.isra.2.part.3>
80404e74:	00010697          	auipc	a3,0x10
80404e78:	bc868693          	addi	a3,a3,-1080 # 80414a3c <default_pmm_manager+0x9e0>
80404e7c:	0000f617          	auipc	a2,0xf
80404e80:	96460613          	addi	a2,a2,-1692 # 804137e0 <commands+0x1bc>
80404e84:	07200593          	li	a1,114
80404e88:	00010517          	auipc	a0,0x10
80404e8c:	aa850513          	addi	a0,a0,-1368 # 80414930 <default_pmm_manager+0x8d4>
80404e90:	f94fb0ef          	jal	ra,80400624 <__panic>
80404e94:	00010697          	auipc	a3,0x10
80404e98:	be468693          	addi	a3,a3,-1052 # 80414a78 <default_pmm_manager+0xa1c>
80404e9c:	0000f617          	auipc	a2,0xf
80404ea0:	94460613          	addi	a2,a2,-1724 # 804137e0 <commands+0x1bc>
80404ea4:	06c00593          	li	a1,108
80404ea8:	00010517          	auipc	a0,0x10
80404eac:	a8850513          	addi	a0,a0,-1400 # 80414930 <default_pmm_manager+0x8d4>
80404eb0:	f74fb0ef          	jal	ra,80400624 <__panic>
80404eb4:	00010697          	auipc	a3,0x10
80404eb8:	ba468693          	addi	a3,a3,-1116 # 80414a58 <default_pmm_manager+0x9fc>
80404ebc:	0000f617          	auipc	a2,0xf
80404ec0:	92460613          	addi	a2,a2,-1756 # 804137e0 <commands+0x1bc>
80404ec4:	06b00593          	li	a1,107
80404ec8:	00010517          	auipc	a0,0x10
80404ecc:	a6850513          	addi	a0,a0,-1432 # 80414930 <default_pmm_manager+0x8d4>
80404ed0:	f54fb0ef          	jal	ra,80400624 <__panic>

80404ed4 <mm_destroy>:
80404ed4:	01852783          	lw	a5,24(a0)
80404ed8:	ff010113          	addi	sp,sp,-16
80404edc:	00112623          	sw	ra,12(sp)
80404ee0:	00812423          	sw	s0,8(sp)
80404ee4:	04079263          	bnez	a5,80404f28 <mm_destroy+0x54>
80404ee8:	00050413          	mv	s0,a0
80404eec:	00452503          	lw	a0,4(a0)
80404ef0:	02a40263          	beq	s0,a0,80404f14 <mm_destroy+0x40>
80404ef4:	00052703          	lw	a4,0(a0)
80404ef8:	00452783          	lw	a5,4(a0)
80404efc:	ff050513          	addi	a0,a0,-16
80404f00:	00f72223          	sw	a5,4(a4)
80404f04:	00e7a023          	sw	a4,0(a5)
80404f08:	a1dfd0ef          	jal	ra,80402924 <kfree>
80404f0c:	00442503          	lw	a0,4(s0)
80404f10:	fea412e3          	bne	s0,a0,80404ef4 <mm_destroy+0x20>
80404f14:	00040513          	mv	a0,s0
80404f18:	00812403          	lw	s0,8(sp)
80404f1c:	00c12083          	lw	ra,12(sp)
80404f20:	01010113          	addi	sp,sp,16
80404f24:	a01fd06f          	j	80402924 <kfree>
80404f28:	00010697          	auipc	a3,0x10
80404f2c:	b7068693          	addi	a3,a3,-1168 # 80414a98 <default_pmm_manager+0xa3c>
80404f30:	0000f617          	auipc	a2,0xf
80404f34:	8b060613          	addi	a2,a2,-1872 # 804137e0 <commands+0x1bc>
80404f38:	09100593          	li	a1,145
80404f3c:	00010517          	auipc	a0,0x10
80404f40:	9f450513          	addi	a0,a0,-1548 # 80414930 <default_pmm_manager+0x8d4>
80404f44:	ee0fb0ef          	jal	ra,80400624 <__panic>

80404f48 <mm_map>:
80404f48:	000017b7          	lui	a5,0x1
80404f4c:	fe010113          	addi	sp,sp,-32
80404f50:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80404f54:	fffff837          	lui	a6,0xfffff
80404f58:	00812c23          	sw	s0,24(sp)
80404f5c:	00f60433          	add	s0,a2,a5
80404f60:	00912a23          	sw	s1,20(sp)
80404f64:	00b40433          	add	s0,s0,a1
80404f68:	00112e23          	sw	ra,28(sp)
80404f6c:	01212823          	sw	s2,16(sp)
80404f70:	01312623          	sw	s3,12(sp)
80404f74:	01412423          	sw	s4,8(sp)
80404f78:	01512223          	sw	s5,4(sp)
80404f7c:	0105f4b3          	and	s1,a1,a6
80404f80:	002007b7          	lui	a5,0x200
80404f84:	01047433          	and	s0,s0,a6
80404f88:	08f4e863          	bltu	s1,a5,80405018 <mm_map+0xd0>
80404f8c:	0884f663          	bgeu	s1,s0,80405018 <mm_map+0xd0>
80404f90:	800007b7          	lui	a5,0x80000
80404f94:	0887e263          	bltu	a5,s0,80405018 <mm_map+0xd0>
80404f98:	00050993          	mv	s3,a0
80404f9c:	00070a13          	mv	s4,a4
80404fa0:	00068a93          	mv	s5,a3
80404fa4:	06050e63          	beqz	a0,80405020 <mm_map+0xd8>
80404fa8:	00048593          	mv	a1,s1
80404fac:	dd5ff0ef          	jal	ra,80404d80 <find_vma>
80404fb0:	00050663          	beqz	a0,80404fbc <mm_map+0x74>
80404fb4:	00452783          	lw	a5,4(a0)
80404fb8:	0687e063          	bltu	a5,s0,80405018 <mm_map+0xd0>
80404fbc:	01800513          	li	a0,24
80404fc0:	841fd0ef          	jal	ra,80402800 <kmalloc>
80404fc4:	00050913          	mv	s2,a0
80404fc8:	ffc00513          	li	a0,-4
80404fcc:	02090463          	beqz	s2,80404ff4 <mm_map+0xac>
80404fd0:	00098513          	mv	a0,s3
80404fd4:	00992223          	sw	s1,4(s2)
80404fd8:	00892423          	sw	s0,8(s2)
80404fdc:	01592623          	sw	s5,12(s2)
80404fe0:	00090593          	mv	a1,s2
80404fe4:	dfdff0ef          	jal	ra,80404de0 <insert_vma_struct>
80404fe8:	00000513          	li	a0,0
80404fec:	000a0463          	beqz	s4,80404ff4 <mm_map+0xac>
80404ff0:	012a2023          	sw	s2,0(s4)
80404ff4:	01c12083          	lw	ra,28(sp)
80404ff8:	01812403          	lw	s0,24(sp)
80404ffc:	01412483          	lw	s1,20(sp)
80405000:	01012903          	lw	s2,16(sp)
80405004:	00c12983          	lw	s3,12(sp)
80405008:	00812a03          	lw	s4,8(sp)
8040500c:	00412a83          	lw	s5,4(sp)
80405010:	02010113          	addi	sp,sp,32
80405014:	00008067          	ret
80405018:	ffd00513          	li	a0,-3
8040501c:	fd9ff06f          	j	80404ff4 <mm_map+0xac>
80405020:	0000f697          	auipc	a3,0xf
80405024:	45868693          	addi	a3,a3,1112 # 80414478 <default_pmm_manager+0x41c>
80405028:	0000e617          	auipc	a2,0xe
8040502c:	7b860613          	addi	a2,a2,1976 # 804137e0 <commands+0x1bc>
80405030:	0a400593          	li	a1,164
80405034:	00010517          	auipc	a0,0x10
80405038:	8fc50513          	addi	a0,a0,-1796 # 80414930 <default_pmm_manager+0x8d4>
8040503c:	de8fb0ef          	jal	ra,80400624 <__panic>

80405040 <dup_mmap>:
80405040:	fe010113          	addi	sp,sp,-32
80405044:	00112e23          	sw	ra,28(sp)
80405048:	00812c23          	sw	s0,24(sp)
8040504c:	00912a23          	sw	s1,20(sp)
80405050:	01212823          	sw	s2,16(sp)
80405054:	01312623          	sw	s3,12(sp)
80405058:	01412423          	sw	s4,8(sp)
8040505c:	01512223          	sw	s5,4(sp)
80405060:	0a050063          	beqz	a0,80405100 <dup_mmap+0xc0>
80405064:	00050913          	mv	s2,a0
80405068:	00058493          	mv	s1,a1
8040506c:	00058413          	mv	s0,a1
80405070:	02059e63          	bnez	a1,804050ac <dup_mmap+0x6c>
80405074:	08c0006f          	j	80405100 <dup_mmap+0xc0>
80405078:	00050593          	mv	a1,a0
8040507c:	0157a223          	sw	s5,4(a5) # 80000004 <end+0xffb63744>
80405080:	00090513          	mv	a0,s2
80405084:	0147a423          	sw	s4,8(a5)
80405088:	0137a623          	sw	s3,12(a5)
8040508c:	d55ff0ef          	jal	ra,80404de0 <insert_vma_struct>
80405090:	ff842683          	lw	a3,-8(s0)
80405094:	ff442603          	lw	a2,-12(s0)
80405098:	00c4a583          	lw	a1,12(s1)
8040509c:	00c92503          	lw	a0,12(s2)
804050a0:	00000713          	li	a4,0
804050a4:	b70fe0ef          	jal	ra,80403414 <copy_range>
804050a8:	02051463          	bnez	a0,804050d0 <dup_mmap+0x90>
804050ac:	00042403          	lw	s0,0(s0)
804050b0:	04848463          	beq	s1,s0,804050f8 <dup_mmap+0xb8>
804050b4:	01800513          	li	a0,24
804050b8:	ff442a83          	lw	s5,-12(s0)
804050bc:	ff842a03          	lw	s4,-8(s0)
804050c0:	ffc42983          	lw	s3,-4(s0)
804050c4:	f3cfd0ef          	jal	ra,80402800 <kmalloc>
804050c8:	00050793          	mv	a5,a0
804050cc:	fa0516e3          	bnez	a0,80405078 <dup_mmap+0x38>
804050d0:	ffc00513          	li	a0,-4
804050d4:	01c12083          	lw	ra,28(sp)
804050d8:	01812403          	lw	s0,24(sp)
804050dc:	01412483          	lw	s1,20(sp)
804050e0:	01012903          	lw	s2,16(sp)
804050e4:	00c12983          	lw	s3,12(sp)
804050e8:	00812a03          	lw	s4,8(sp)
804050ec:	00412a83          	lw	s5,4(sp)
804050f0:	02010113          	addi	sp,sp,32
804050f4:	00008067          	ret
804050f8:	00000513          	li	a0,0
804050fc:	fd9ff06f          	j	804050d4 <dup_mmap+0x94>
80405100:	00010697          	auipc	a3,0x10
80405104:	90068693          	addi	a3,a3,-1792 # 80414a00 <default_pmm_manager+0x9a4>
80405108:	0000e617          	auipc	a2,0xe
8040510c:	6d860613          	addi	a2,a2,1752 # 804137e0 <commands+0x1bc>
80405110:	0bc00593          	li	a1,188
80405114:	00010517          	auipc	a0,0x10
80405118:	81c50513          	addi	a0,a0,-2020 # 80414930 <default_pmm_manager+0x8d4>
8040511c:	d08fb0ef          	jal	ra,80400624 <__panic>

80405120 <exit_mmap>:
80405120:	ff010113          	addi	sp,sp,-16
80405124:	00112623          	sw	ra,12(sp)
80405128:	00812423          	sw	s0,8(sp)
8040512c:	00912223          	sw	s1,4(sp)
80405130:	01212023          	sw	s2,0(sp)
80405134:	06050663          	beqz	a0,804051a0 <exit_mmap+0x80>
80405138:	01852783          	lw	a5,24(a0)
8040513c:	00050493          	mv	s1,a0
80405140:	06079063          	bnez	a5,804051a0 <exit_mmap+0x80>
80405144:	00452403          	lw	s0,4(a0)
80405148:	00c52903          	lw	s2,12(a0)
8040514c:	02850a63          	beq	a0,s0,80405180 <exit_mmap+0x60>
80405150:	ff842603          	lw	a2,-8(s0)
80405154:	ff442583          	lw	a1,-12(s0)
80405158:	00090513          	mv	a0,s2
8040515c:	e19fd0ef          	jal	ra,80402f74 <unmap_range>
80405160:	00442403          	lw	s0,4(s0)
80405164:	fe8496e3          	bne	s1,s0,80405150 <exit_mmap+0x30>
80405168:	00442403          	lw	s0,4(s0)
8040516c:	00848e63          	beq	s1,s0,80405188 <exit_mmap+0x68>
80405170:	ff842603          	lw	a2,-8(s0)
80405174:	ff442583          	lw	a1,-12(s0)
80405178:	00090513          	mv	a0,s2
8040517c:	f7dfd0ef          	jal	ra,804030f8 <exit_range>
80405180:	00442403          	lw	s0,4(s0)
80405184:	fe8496e3          	bne	s1,s0,80405170 <exit_mmap+0x50>
80405188:	00c12083          	lw	ra,12(sp)
8040518c:	00812403          	lw	s0,8(sp)
80405190:	00412483          	lw	s1,4(sp)
80405194:	00012903          	lw	s2,0(sp)
80405198:	01010113          	addi	sp,sp,16
8040519c:	00008067          	ret
804051a0:	00010697          	auipc	a3,0x10
804051a4:	87c68693          	addi	a3,a3,-1924 # 80414a1c <default_pmm_manager+0x9c0>
804051a8:	0000e617          	auipc	a2,0xe
804051ac:	63860613          	addi	a2,a2,1592 # 804137e0 <commands+0x1bc>
804051b0:	0d200593          	li	a1,210
804051b4:	0000f517          	auipc	a0,0xf
804051b8:	77c50513          	addi	a0,a0,1916 # 80414930 <default_pmm_manager+0x8d4>
804051bc:	c68fb0ef          	jal	ra,80400624 <__panic>

804051c0 <vmm_init>:
804051c0:	fe010113          	addi	sp,sp,-32
804051c4:	00112e23          	sw	ra,28(sp)
804051c8:	00812c23          	sw	s0,24(sp)
804051cc:	00912a23          	sw	s1,20(sp)
804051d0:	01212823          	sw	s2,16(sp)
804051d4:	01312623          	sw	s3,12(sp)
804051d8:	01412423          	sw	s4,8(sp)
804051dc:	01512223          	sw	s5,4(sp)
804051e0:	ad5fd0ef          	jal	ra,80402cb4 <nr_free_pages>
804051e4:	ad1fd0ef          	jal	ra,80402cb4 <nr_free_pages>
804051e8:	ad9ff0ef          	jal	ra,80404cc0 <mm_create>
804051ec:	00050413          	mv	s0,a0
804051f0:	03200493          	li	s1,50
804051f4:	02051263          	bnez	a0,80405218 <vmm_init+0x58>
804051f8:	4740006f          	j	8040566c <vmm_init+0x4ac>
804051fc:	00952223          	sw	s1,4(a0)
80405200:	00f52423          	sw	a5,8(a0)
80405204:	00052623          	sw	zero,12(a0)
80405208:	ffb48493          	addi	s1,s1,-5
8040520c:	00040513          	mv	a0,s0
80405210:	bd1ff0ef          	jal	ra,80404de0 <insert_vma_struct>
80405214:	02048c63          	beqz	s1,8040524c <vmm_init+0x8c>
80405218:	01800513          	li	a0,24
8040521c:	de4fd0ef          	jal	ra,80402800 <kmalloc>
80405220:	00050593          	mv	a1,a0
80405224:	00248793          	addi	a5,s1,2
80405228:	fc051ae3          	bnez	a0,804051fc <vmm_init+0x3c>
8040522c:	0000f697          	auipc	a3,0xf
80405230:	28068693          	addi	a3,a3,640 # 804144ac <default_pmm_manager+0x450>
80405234:	0000e617          	auipc	a2,0xe
80405238:	5ac60613          	addi	a2,a2,1452 # 804137e0 <commands+0x1bc>
8040523c:	10a00593          	li	a1,266
80405240:	0000f517          	auipc	a0,0xf
80405244:	6f050513          	addi	a0,a0,1776 # 80414930 <default_pmm_manager+0x8d4>
80405248:	bdcfb0ef          	jal	ra,80400624 <__panic>
8040524c:	03700493          	li	s1,55
80405250:	1f900913          	li	s2,505
80405254:	0200006f          	j	80405274 <vmm_init+0xb4>
80405258:	00952223          	sw	s1,4(a0)
8040525c:	00f52423          	sw	a5,8(a0)
80405260:	00052623          	sw	zero,12(a0)
80405264:	00548493          	addi	s1,s1,5
80405268:	00040513          	mv	a0,s0
8040526c:	b75ff0ef          	jal	ra,80404de0 <insert_vma_struct>
80405270:	03248c63          	beq	s1,s2,804052a8 <vmm_init+0xe8>
80405274:	01800513          	li	a0,24
80405278:	d88fd0ef          	jal	ra,80402800 <kmalloc>
8040527c:	00050593          	mv	a1,a0
80405280:	00248793          	addi	a5,s1,2
80405284:	fc051ae3          	bnez	a0,80405258 <vmm_init+0x98>
80405288:	0000f697          	auipc	a3,0xf
8040528c:	22468693          	addi	a3,a3,548 # 804144ac <default_pmm_manager+0x450>
80405290:	0000e617          	auipc	a2,0xe
80405294:	55060613          	addi	a2,a2,1360 # 804137e0 <commands+0x1bc>
80405298:	11000593          	li	a1,272
8040529c:	0000f517          	auipc	a0,0xf
804052a0:	69450513          	addi	a0,a0,1684 # 80414930 <default_pmm_manager+0x8d4>
804052a4:	b80fb0ef          	jal	ra,80400624 <__panic>
804052a8:	00442703          	lw	a4,4(s0)
804052ac:	00700793          	li	a5,7
804052b0:	1fb00593          	li	a1,507
804052b4:	2ee40c63          	beq	s0,a4,804055ac <vmm_init+0x3ec>
804052b8:	ff472603          	lw	a2,-12(a4)
804052bc:	ffe78693          	addi	a3,a5,-2
804052c0:	26d61663          	bne	a2,a3,8040552c <vmm_init+0x36c>
804052c4:	ff872683          	lw	a3,-8(a4)
804052c8:	26d79263          	bne	a5,a3,8040552c <vmm_init+0x36c>
804052cc:	00578793          	addi	a5,a5,5
804052d0:	00472703          	lw	a4,4(a4)
804052d4:	feb790e3          	bne	a5,a1,804052b4 <vmm_init+0xf4>
804052d8:	00700913          	li	s2,7
804052dc:	00500493          	li	s1,5
804052e0:	1f900a93          	li	s5,505
804052e4:	00048593          	mv	a1,s1
804052e8:	00040513          	mv	a0,s0
804052ec:	a95ff0ef          	jal	ra,80404d80 <find_vma>
804052f0:	00050a13          	mv	s4,a0
804052f4:	32050c63          	beqz	a0,8040562c <vmm_init+0x46c>
804052f8:	00148593          	addi	a1,s1,1
804052fc:	00040513          	mv	a0,s0
80405300:	a81ff0ef          	jal	ra,80404d80 <find_vma>
80405304:	00050993          	mv	s3,a0
80405308:	30050263          	beqz	a0,8040560c <vmm_init+0x44c>
8040530c:	00090593          	mv	a1,s2
80405310:	00040513          	mv	a0,s0
80405314:	a6dff0ef          	jal	ra,80404d80 <find_vma>
80405318:	2c051a63          	bnez	a0,804055ec <vmm_init+0x42c>
8040531c:	00348593          	addi	a1,s1,3
80405320:	00040513          	mv	a0,s0
80405324:	a5dff0ef          	jal	ra,80404d80 <find_vma>
80405328:	2a051263          	bnez	a0,804055cc <vmm_init+0x40c>
8040532c:	00448593          	addi	a1,s1,4
80405330:	00040513          	mv	a0,s0
80405334:	a4dff0ef          	jal	ra,80404d80 <find_vma>
80405338:	30051a63          	bnez	a0,8040564c <vmm_init+0x48c>
8040533c:	004a2783          	lw	a5,4(s4)
80405340:	20979663          	bne	a5,s1,8040554c <vmm_init+0x38c>
80405344:	008a2783          	lw	a5,8(s4)
80405348:	21279263          	bne	a5,s2,8040554c <vmm_init+0x38c>
8040534c:	0049a783          	lw	a5,4(s3)
80405350:	20979e63          	bne	a5,s1,8040556c <vmm_init+0x3ac>
80405354:	0089a783          	lw	a5,8(s3)
80405358:	21279a63          	bne	a5,s2,8040556c <vmm_init+0x3ac>
8040535c:	00548493          	addi	s1,s1,5
80405360:	00590913          	addi	s2,s2,5
80405364:	f95490e3          	bne	s1,s5,804052e4 <vmm_init+0x124>
80405368:	00400493          	li	s1,4
8040536c:	fff00913          	li	s2,-1
80405370:	00048593          	mv	a1,s1
80405374:	00040513          	mv	a0,s0
80405378:	a09ff0ef          	jal	ra,80404d80 <find_vma>
8040537c:	02050e63          	beqz	a0,804053b8 <vmm_init+0x1f8>
80405380:	00852683          	lw	a3,8(a0)
80405384:	00452603          	lw	a2,4(a0)
80405388:	00048593          	mv	a1,s1
8040538c:	00010517          	auipc	a0,0x10
80405390:	82050513          	addi	a0,a0,-2016 # 80414bac <default_pmm_manager+0xb50>
80405394:	e69fa0ef          	jal	ra,804001fc <cprintf>
80405398:	00010697          	auipc	a3,0x10
8040539c:	83c68693          	addi	a3,a3,-1988 # 80414bd4 <default_pmm_manager+0xb78>
804053a0:	0000e617          	auipc	a2,0xe
804053a4:	44060613          	addi	a2,a2,1088 # 804137e0 <commands+0x1bc>
804053a8:	13300593          	li	a1,307
804053ac:	0000f517          	auipc	a0,0xf
804053b0:	58450513          	addi	a0,a0,1412 # 80414930 <default_pmm_manager+0x8d4>
804053b4:	a70fb0ef          	jal	ra,80400624 <__panic>
804053b8:	fff48493          	addi	s1,s1,-1
804053bc:	fb249ae3          	bne	s1,s2,80405370 <vmm_init+0x1b0>
804053c0:	00040513          	mv	a0,s0
804053c4:	b11ff0ef          	jal	ra,80404ed4 <mm_destroy>
804053c8:	00010517          	auipc	a0,0x10
804053cc:	82050513          	addi	a0,a0,-2016 # 80414be8 <default_pmm_manager+0xb8c>
804053d0:	e2dfa0ef          	jal	ra,804001fc <cprintf>
804053d4:	8e1fd0ef          	jal	ra,80402cb4 <nr_free_pages>
804053d8:	00050913          	mv	s2,a0
804053dc:	8e5ff0ef          	jal	ra,80404cc0 <mm_create>
804053e0:	00097797          	auipc	a5,0x97
804053e4:	4ca7aa23          	sw	a0,1236(a5) # 8049c8b4 <check_mm_struct>
804053e8:	00050413          	mv	s0,a0
804053ec:	2e050063          	beqz	a0,804056cc <vmm_init+0x50c>
804053f0:	00097797          	auipc	a5,0x97
804053f4:	3a878793          	addi	a5,a5,936 # 8049c798 <boot_pgdir>
804053f8:	0007a483          	lw	s1,0(a5)
804053fc:	0004a783          	lw	a5,0(s1)
80405400:	00952623          	sw	s1,12(a0)
80405404:	28079463          	bnez	a5,8040568c <vmm_init+0x4cc>
80405408:	01800513          	li	a0,24
8040540c:	bf4fd0ef          	jal	ra,80402800 <kmalloc>
80405410:	00050993          	mv	s3,a0
80405414:	16050c63          	beqz	a0,8040558c <vmm_init+0x3cc>
80405418:	004007b7          	lui	a5,0x400
8040541c:	00f9a423          	sw	a5,8(s3)
80405420:	00200793          	li	a5,2
80405424:	00050593          	mv	a1,a0
80405428:	00f9a623          	sw	a5,12(s3)
8040542c:	00040513          	mv	a0,s0
80405430:	0009a223          	sw	zero,4(s3)
80405434:	9adff0ef          	jal	ra,80404de0 <insert_vma_struct>
80405438:	10000593          	li	a1,256
8040543c:	00040513          	mv	a0,s0
80405440:	941ff0ef          	jal	ra,80404d80 <find_vma>
80405444:	10000793          	li	a5,256
80405448:	16400713          	li	a4,356
8040544c:	2aa99063          	bne	s3,a0,804056ec <vmm_init+0x52c>
80405450:	00f78023          	sb	a5,0(a5) # 400000 <_binary_bin_sfs_img_size+0x388000>
80405454:	00178793          	addi	a5,a5,1
80405458:	fee79ce3          	bne	a5,a4,80405450 <vmm_init+0x290>
8040545c:	00001737          	lui	a4,0x1
80405460:	10000793          	li	a5,256
80405464:	35670713          	addi	a4,a4,854 # 1356 <_binary_bin_swap_img_size-0x6caa>
80405468:	16400613          	li	a2,356
8040546c:	0007c683          	lbu	a3,0(a5)
80405470:	00178793          	addi	a5,a5,1
80405474:	40d70733          	sub	a4,a4,a3
80405478:	fec79ae3          	bne	a5,a2,8040546c <vmm_init+0x2ac>
8040547c:	2a071463          	bnez	a4,80405724 <vmm_init+0x564>
80405480:	00000593          	li	a1,0
80405484:	00048513          	mv	a0,s1
80405488:	db9fd0ef          	jal	ra,80403240 <page_remove>
8040548c:	0004a783          	lw	a5,0(s1)
80405490:	00097717          	auipc	a4,0x97
80405494:	30c70713          	addi	a4,a4,780 # 8049c79c <npage>
80405498:	00072703          	lw	a4,0(a4)
8040549c:	00279793          	slli	a5,a5,0x2
804054a0:	00c7d793          	srli	a5,a5,0xc
804054a4:	26e7f463          	bgeu	a5,a4,8040570c <vmm_init+0x54c>
804054a8:	00012717          	auipc	a4,0x12
804054ac:	9b870713          	addi	a4,a4,-1608 # 80416e60 <nbase>
804054b0:	00072703          	lw	a4,0(a4)
804054b4:	00097697          	auipc	a3,0x97
804054b8:	35868693          	addi	a3,a3,856 # 8049c80c <pages>
804054bc:	0006a503          	lw	a0,0(a3)
804054c0:	40e787b3          	sub	a5,a5,a4
804054c4:	00579793          	slli	a5,a5,0x5
804054c8:	00f50533          	add	a0,a0,a5
804054cc:	00100593          	li	a1,1
804054d0:	f78fd0ef          	jal	ra,80402c48 <free_pages>
804054d4:	0004a023          	sw	zero,0(s1)
804054d8:	00042623          	sw	zero,12(s0)
804054dc:	00040513          	mv	a0,s0
804054e0:	9f5ff0ef          	jal	ra,80404ed4 <mm_destroy>
804054e4:	00097797          	auipc	a5,0x97
804054e8:	3c07a823          	sw	zero,976(a5) # 8049c8b4 <check_mm_struct>
804054ec:	fc8fd0ef          	jal	ra,80402cb4 <nr_free_pages>
804054f0:	1aa91e63          	bne	s2,a0,804056ac <vmm_init+0x4ec>
804054f4:	0000f517          	auipc	a0,0xf
804054f8:	77c50513          	addi	a0,a0,1916 # 80414c70 <default_pmm_manager+0xc14>
804054fc:	d01fa0ef          	jal	ra,804001fc <cprintf>
80405500:	01812403          	lw	s0,24(sp)
80405504:	01c12083          	lw	ra,28(sp)
80405508:	01412483          	lw	s1,20(sp)
8040550c:	01012903          	lw	s2,16(sp)
80405510:	00c12983          	lw	s3,12(sp)
80405514:	00812a03          	lw	s4,8(sp)
80405518:	00412a83          	lw	s5,4(sp)
8040551c:	0000f517          	auipc	a0,0xf
80405520:	77050513          	addi	a0,a0,1904 # 80414c8c <default_pmm_manager+0xc30>
80405524:	02010113          	addi	sp,sp,32
80405528:	cd5fa06f          	j	804001fc <cprintf>
8040552c:	0000f697          	auipc	a3,0xf
80405530:	59868693          	addi	a3,a3,1432 # 80414ac4 <default_pmm_manager+0xa68>
80405534:	0000e617          	auipc	a2,0xe
80405538:	2ac60613          	addi	a2,a2,684 # 804137e0 <commands+0x1bc>
8040553c:	11900593          	li	a1,281
80405540:	0000f517          	auipc	a0,0xf
80405544:	3f050513          	addi	a0,a0,1008 # 80414930 <default_pmm_manager+0x8d4>
80405548:	8dcfb0ef          	jal	ra,80400624 <__panic>
8040554c:	0000f697          	auipc	a3,0xf
80405550:	60068693          	addi	a3,a3,1536 # 80414b4c <default_pmm_manager+0xaf0>
80405554:	0000e617          	auipc	a2,0xe
80405558:	28c60613          	addi	a2,a2,652 # 804137e0 <commands+0x1bc>
8040555c:	12900593          	li	a1,297
80405560:	0000f517          	auipc	a0,0xf
80405564:	3d050513          	addi	a0,a0,976 # 80414930 <default_pmm_manager+0x8d4>
80405568:	8bcfb0ef          	jal	ra,80400624 <__panic>
8040556c:	0000f697          	auipc	a3,0xf
80405570:	61068693          	addi	a3,a3,1552 # 80414b7c <default_pmm_manager+0xb20>
80405574:	0000e617          	auipc	a2,0xe
80405578:	26c60613          	addi	a2,a2,620 # 804137e0 <commands+0x1bc>
8040557c:	12a00593          	li	a1,298
80405580:	0000f517          	auipc	a0,0xf
80405584:	3b050513          	addi	a0,a0,944 # 80414930 <default_pmm_manager+0x8d4>
80405588:	89cfb0ef          	jal	ra,80400624 <__panic>
8040558c:	0000f697          	auipc	a3,0xf
80405590:	f2068693          	addi	a3,a3,-224 # 804144ac <default_pmm_manager+0x450>
80405594:	0000e617          	auipc	a2,0xe
80405598:	24c60613          	addi	a2,a2,588 # 804137e0 <commands+0x1bc>
8040559c:	14900593          	li	a1,329
804055a0:	0000f517          	auipc	a0,0xf
804055a4:	39050513          	addi	a0,a0,912 # 80414930 <default_pmm_manager+0x8d4>
804055a8:	87cfb0ef          	jal	ra,80400624 <__panic>
804055ac:	0000f697          	auipc	a3,0xf
804055b0:	50068693          	addi	a3,a3,1280 # 80414aac <default_pmm_manager+0xa50>
804055b4:	0000e617          	auipc	a2,0xe
804055b8:	22c60613          	addi	a2,a2,556 # 804137e0 <commands+0x1bc>
804055bc:	11700593          	li	a1,279
804055c0:	0000f517          	auipc	a0,0xf
804055c4:	37050513          	addi	a0,a0,880 # 80414930 <default_pmm_manager+0x8d4>
804055c8:	85cfb0ef          	jal	ra,80400624 <__panic>
804055cc:	0000f697          	auipc	a3,0xf
804055d0:	56068693          	addi	a3,a3,1376 # 80414b2c <default_pmm_manager+0xad0>
804055d4:	0000e617          	auipc	a2,0xe
804055d8:	20c60613          	addi	a2,a2,524 # 804137e0 <commands+0x1bc>
804055dc:	12500593          	li	a1,293
804055e0:	0000f517          	auipc	a0,0xf
804055e4:	35050513          	addi	a0,a0,848 # 80414930 <default_pmm_manager+0x8d4>
804055e8:	83cfb0ef          	jal	ra,80400624 <__panic>
804055ec:	0000f697          	auipc	a3,0xf
804055f0:	53068693          	addi	a3,a3,1328 # 80414b1c <default_pmm_manager+0xac0>
804055f4:	0000e617          	auipc	a2,0xe
804055f8:	1ec60613          	addi	a2,a2,492 # 804137e0 <commands+0x1bc>
804055fc:	12300593          	li	a1,291
80405600:	0000f517          	auipc	a0,0xf
80405604:	33050513          	addi	a0,a0,816 # 80414930 <default_pmm_manager+0x8d4>
80405608:	81cfb0ef          	jal	ra,80400624 <__panic>
8040560c:	0000f697          	auipc	a3,0xf
80405610:	50068693          	addi	a3,a3,1280 # 80414b0c <default_pmm_manager+0xab0>
80405614:	0000e617          	auipc	a2,0xe
80405618:	1cc60613          	addi	a2,a2,460 # 804137e0 <commands+0x1bc>
8040561c:	12100593          	li	a1,289
80405620:	0000f517          	auipc	a0,0xf
80405624:	31050513          	addi	a0,a0,784 # 80414930 <default_pmm_manager+0x8d4>
80405628:	ffdfa0ef          	jal	ra,80400624 <__panic>
8040562c:	0000f697          	auipc	a3,0xf
80405630:	4d068693          	addi	a3,a3,1232 # 80414afc <default_pmm_manager+0xaa0>
80405634:	0000e617          	auipc	a2,0xe
80405638:	1ac60613          	addi	a2,a2,428 # 804137e0 <commands+0x1bc>
8040563c:	11f00593          	li	a1,287
80405640:	0000f517          	auipc	a0,0xf
80405644:	2f050513          	addi	a0,a0,752 # 80414930 <default_pmm_manager+0x8d4>
80405648:	fddfa0ef          	jal	ra,80400624 <__panic>
8040564c:	0000f697          	auipc	a3,0xf
80405650:	4f068693          	addi	a3,a3,1264 # 80414b3c <default_pmm_manager+0xae0>
80405654:	0000e617          	auipc	a2,0xe
80405658:	18c60613          	addi	a2,a2,396 # 804137e0 <commands+0x1bc>
8040565c:	12700593          	li	a1,295
80405660:	0000f517          	auipc	a0,0xf
80405664:	2d050513          	addi	a0,a0,720 # 80414930 <default_pmm_manager+0x8d4>
80405668:	fbdfa0ef          	jal	ra,80400624 <__panic>
8040566c:	0000f697          	auipc	a3,0xf
80405670:	e0c68693          	addi	a3,a3,-500 # 80414478 <default_pmm_manager+0x41c>
80405674:	0000e617          	auipc	a2,0xe
80405678:	16c60613          	addi	a2,a2,364 # 804137e0 <commands+0x1bc>
8040567c:	10300593          	li	a1,259
80405680:	0000f517          	auipc	a0,0xf
80405684:	2b050513          	addi	a0,a0,688 # 80414930 <default_pmm_manager+0x8d4>
80405688:	f9dfa0ef          	jal	ra,80400624 <__panic>
8040568c:	0000f697          	auipc	a3,0xf
80405690:	e1068693          	addi	a3,a3,-496 # 8041449c <default_pmm_manager+0x440>
80405694:	0000e617          	auipc	a2,0xe
80405698:	14c60613          	addi	a2,a2,332 # 804137e0 <commands+0x1bc>
8040569c:	14600593          	li	a1,326
804056a0:	0000f517          	auipc	a0,0xf
804056a4:	29050513          	addi	a0,a0,656 # 80414930 <default_pmm_manager+0x8d4>
804056a8:	f7dfa0ef          	jal	ra,80400624 <__panic>
804056ac:	0000f697          	auipc	a3,0xf
804056b0:	59c68693          	addi	a3,a3,1436 # 80414c48 <default_pmm_manager+0xbec>
804056b4:	0000e617          	auipc	a2,0xe
804056b8:	12c60613          	addi	a2,a2,300 # 804137e0 <commands+0x1bc>
804056bc:	16200593          	li	a1,354
804056c0:	0000f517          	auipc	a0,0xf
804056c4:	27050513          	addi	a0,a0,624 # 80414930 <default_pmm_manager+0x8d4>
804056c8:	f5dfa0ef          	jal	ra,80400624 <__panic>
804056cc:	0000f697          	auipc	a3,0xf
804056d0:	53c68693          	addi	a3,a3,1340 # 80414c08 <default_pmm_manager+0xbac>
804056d4:	0000e617          	auipc	a2,0xe
804056d8:	10c60613          	addi	a2,a2,268 # 804137e0 <commands+0x1bc>
804056dc:	14200593          	li	a1,322
804056e0:	0000f517          	auipc	a0,0xf
804056e4:	25050513          	addi	a0,a0,592 # 80414930 <default_pmm_manager+0x8d4>
804056e8:	f3dfa0ef          	jal	ra,80400624 <__panic>
804056ec:	0000f697          	auipc	a3,0xf
804056f0:	53468693          	addi	a3,a3,1332 # 80414c20 <default_pmm_manager+0xbc4>
804056f4:	0000e617          	auipc	a2,0xe
804056f8:	0ec60613          	addi	a2,a2,236 # 804137e0 <commands+0x1bc>
804056fc:	14e00593          	li	a1,334
80405700:	0000f517          	auipc	a0,0xf
80405704:	23050513          	addi	a0,a0,560 # 80414930 <default_pmm_manager+0x8d4>
80405708:	f1dfa0ef          	jal	ra,80400624 <__panic>
8040570c:	0000f617          	auipc	a2,0xf
80405710:	9d860613          	addi	a2,a2,-1576 # 804140e4 <default_pmm_manager+0x88>
80405714:	06900593          	li	a1,105
80405718:	0000f517          	auipc	a0,0xf
8040571c:	99850513          	addi	a0,a0,-1640 # 804140b0 <default_pmm_manager+0x54>
80405720:	f05fa0ef          	jal	ra,80400624 <__panic>
80405724:	0000f697          	auipc	a3,0xf
80405728:	51868693          	addi	a3,a3,1304 # 80414c3c <default_pmm_manager+0xbe0>
8040572c:	0000e617          	auipc	a2,0xe
80405730:	0b460613          	addi	a2,a2,180 # 804137e0 <commands+0x1bc>
80405734:	15800593          	li	a1,344
80405738:	0000f517          	auipc	a0,0xf
8040573c:	1f850513          	addi	a0,a0,504 # 80414930 <default_pmm_manager+0x8d4>
80405740:	ee5fa0ef          	jal	ra,80400624 <__panic>

80405744 <do_pgfault>:
80405744:	fd010113          	addi	sp,sp,-48
80405748:	00060593          	mv	a1,a2
8040574c:	02912223          	sw	s1,36(sp)
80405750:	03212023          	sw	s2,32(sp)
80405754:	02112623          	sw	ra,44(sp)
80405758:	02812423          	sw	s0,40(sp)
8040575c:	01312e23          	sw	s3,28(sp)
80405760:	00060493          	mv	s1,a2
80405764:	00050913          	mv	s2,a0
80405768:	e18ff0ef          	jal	ra,80404d80 <find_vma>
8040576c:	00097797          	auipc	a5,0x97
80405770:	04078793          	addi	a5,a5,64 # 8049c7ac <pgfault_num>
80405774:	0007a783          	lw	a5,0(a5)
80405778:	00178793          	addi	a5,a5,1
8040577c:	00097717          	auipc	a4,0x97
80405780:	02f72823          	sw	a5,48(a4) # 8049c7ac <pgfault_num>
80405784:	10050e63          	beqz	a0,804058a0 <do_pgfault+0x15c>
80405788:	00452783          	lw	a5,4(a0)
8040578c:	10f4ea63          	bltu	s1,a5,804058a0 <do_pgfault+0x15c>
80405790:	00c52403          	lw	s0,12(a0)
80405794:	fffff637          	lui	a2,0xfffff
80405798:	00c92503          	lw	a0,12(s2)
8040579c:	00247413          	andi	s0,s0,2
804057a0:	00c4f4b3          	and	s1,s1,a2
804057a4:	00143413          	seqz	s0,s0
804057a8:	40800433          	neg	s0,s0
804057ac:	00100613          	li	a2,1
804057b0:	00048593          	mv	a1,s1
804057b4:	ff947413          	andi	s0,s0,-7
804057b8:	d5cfd0ef          	jal	ra,80402d14 <get_pte>
804057bc:	01740413          	addi	s0,s0,23
804057c0:	10050663          	beqz	a0,804058cc <do_pgfault+0x188>
804057c4:	00052583          	lw	a1,0(a0)
804057c8:	0a058663          	beqz	a1,80405874 <do_pgfault+0x130>
804057cc:	00097797          	auipc	a5,0x97
804057d0:	fdc78793          	addi	a5,a5,-36 # 8049c7a8 <swap_init_ok>
804057d4:	0007a783          	lw	a5,0(a5)
804057d8:	0e078063          	beqz	a5,804058b8 <do_pgfault+0x174>
804057dc:	00c10613          	addi	a2,sp,12
804057e0:	00048593          	mv	a1,s1
804057e4:	00090513          	mv	a0,s2
804057e8:	00012623          	sw	zero,12(sp)
804057ec:	f6dfe0ef          	jal	ra,80404758 <swap_in>
804057f0:	00050993          	mv	s3,a0
804057f4:	04051a63          	bnez	a0,80405848 <do_pgfault+0x104>
804057f8:	00c12583          	lw	a1,12(sp)
804057fc:	00c92503          	lw	a0,12(s2)
80405800:	00040693          	mv	a3,s0
80405804:	00048613          	mv	a2,s1
80405808:	aedfd0ef          	jal	ra,804032f4 <page_insert>
8040580c:	00c12603          	lw	a2,12(sp)
80405810:	00100693          	li	a3,1
80405814:	00048593          	mv	a1,s1
80405818:	00090513          	mv	a0,s2
8040581c:	d7dfe0ef          	jal	ra,80404598 <swap_map_swappable>
80405820:	00c12783          	lw	a5,12(sp)
80405824:	0097ae23          	sw	s1,28(a5)
80405828:	02c12083          	lw	ra,44(sp)
8040582c:	02812403          	lw	s0,40(sp)
80405830:	00098513          	mv	a0,s3
80405834:	02412483          	lw	s1,36(sp)
80405838:	02012903          	lw	s2,32(sp)
8040583c:	01c12983          	lw	s3,28(sp)
80405840:	03010113          	addi	sp,sp,48
80405844:	00008067          	ret
80405848:	0000f517          	auipc	a0,0xf
8040584c:	17050513          	addi	a0,a0,368 # 804149b8 <default_pmm_manager+0x95c>
80405850:	9adfa0ef          	jal	ra,804001fc <cprintf>
80405854:	02c12083          	lw	ra,44(sp)
80405858:	02812403          	lw	s0,40(sp)
8040585c:	00098513          	mv	a0,s3
80405860:	02412483          	lw	s1,36(sp)
80405864:	02012903          	lw	s2,32(sp)
80405868:	01c12983          	lw	s3,28(sp)
8040586c:	03010113          	addi	sp,sp,48
80405870:	00008067          	ret
80405874:	00c92503          	lw	a0,12(s2)
80405878:	00040613          	mv	a2,s0
8040587c:	00048593          	mv	a1,s1
80405880:	e69fd0ef          	jal	ra,804036e8 <pgdir_alloc_page>
80405884:	00000993          	li	s3,0
80405888:	fa0510e3          	bnez	a0,80405828 <do_pgfault+0xe4>
8040588c:	0000f517          	auipc	a0,0xf
80405890:	10450513          	addi	a0,a0,260 # 80414990 <default_pmm_manager+0x934>
80405894:	969fa0ef          	jal	ra,804001fc <cprintf>
80405898:	ffc00993          	li	s3,-4
8040589c:	f8dff06f          	j	80405828 <do_pgfault+0xe4>
804058a0:	00048593          	mv	a1,s1
804058a4:	0000f517          	auipc	a0,0xf
804058a8:	09c50513          	addi	a0,a0,156 # 80414940 <default_pmm_manager+0x8e4>
804058ac:	951fa0ef          	jal	ra,804001fc <cprintf>
804058b0:	ffd00993          	li	s3,-3
804058b4:	f75ff06f          	j	80405828 <do_pgfault+0xe4>
804058b8:	0000f517          	auipc	a0,0xf
804058bc:	12050513          	addi	a0,a0,288 # 804149d8 <default_pmm_manager+0x97c>
804058c0:	93dfa0ef          	jal	ra,804001fc <cprintf>
804058c4:	ffc00993          	li	s3,-4
804058c8:	f61ff06f          	j	80405828 <do_pgfault+0xe4>
804058cc:	0000f517          	auipc	a0,0xf
804058d0:	0a450513          	addi	a0,a0,164 # 80414970 <default_pmm_manager+0x914>
804058d4:	929fa0ef          	jal	ra,804001fc <cprintf>
804058d8:	ffc00993          	li	s3,-4
804058dc:	f4dff06f          	j	80405828 <do_pgfault+0xe4>

804058e0 <user_mem_check>:
804058e0:	fe010113          	addi	sp,sp,-32
804058e4:	00812c23          	sw	s0,24(sp)
804058e8:	00112e23          	sw	ra,28(sp)
804058ec:	00912a23          	sw	s1,20(sp)
804058f0:	01212823          	sw	s2,16(sp)
804058f4:	01312623          	sw	s3,12(sp)
804058f8:	01412423          	sw	s4,8(sp)
804058fc:	00058413          	mv	s0,a1
80405900:	08050c63          	beqz	a0,80405998 <user_mem_check+0xb8>
80405904:	002007b7          	lui	a5,0x200
80405908:	06f5e663          	bltu	a1,a5,80405974 <user_mem_check+0x94>
8040590c:	00c584b3          	add	s1,a1,a2
80405910:	0695f263          	bgeu	a1,s1,80405974 <user_mem_check+0x94>
80405914:	800007b7          	lui	a5,0x80000
80405918:	0497ee63          	bltu	a5,s1,80405974 <user_mem_check+0x94>
8040591c:	00050913          	mv	s2,a0
80405920:	00068993          	mv	s3,a3
80405924:	00001a37          	lui	s4,0x1
80405928:	0240006f          	j	8040594c <user_mem_check+0x6c>
8040592c:	0027f693          	andi	a3,a5,2
80405930:	01470733          	add	a4,a4,s4
80405934:	0087f793          	andi	a5,a5,8
80405938:	02068e63          	beqz	a3,80405974 <user_mem_check+0x94>
8040593c:	00078463          	beqz	a5,80405944 <user_mem_check+0x64>
80405940:	02e46a63          	bltu	s0,a4,80405974 <user_mem_check+0x94>
80405944:	00852403          	lw	s0,8(a0)
80405948:	06947463          	bgeu	s0,s1,804059b0 <user_mem_check+0xd0>
8040594c:	00040593          	mv	a1,s0
80405950:	00090513          	mv	a0,s2
80405954:	c2cff0ef          	jal	ra,80404d80 <find_vma>
80405958:	00050e63          	beqz	a0,80405974 <user_mem_check+0x94>
8040595c:	00452703          	lw	a4,4(a0)
80405960:	00e46a63          	bltu	s0,a4,80405974 <user_mem_check+0x94>
80405964:	00c52783          	lw	a5,12(a0)
80405968:	fc0992e3          	bnez	s3,8040592c <user_mem_check+0x4c>
8040596c:	0017f793          	andi	a5,a5,1
80405970:	fc079ae3          	bnez	a5,80405944 <user_mem_check+0x64>
80405974:	00000513          	li	a0,0
80405978:	01c12083          	lw	ra,28(sp)
8040597c:	01812403          	lw	s0,24(sp)
80405980:	01412483          	lw	s1,20(sp)
80405984:	01012903          	lw	s2,16(sp)
80405988:	00c12983          	lw	s3,12(sp)
8040598c:	00812a03          	lw	s4,8(sp)
80405990:	02010113          	addi	sp,sp,32
80405994:	00008067          	ret
80405998:	804007b7          	lui	a5,0x80400
8040599c:	fcf5ece3          	bltu	a1,a5,80405974 <user_mem_check+0x94>
804059a0:	00c58633          	add	a2,a1,a2
804059a4:	fcc5f8e3          	bgeu	a1,a2,80405974 <user_mem_check+0x94>
804059a8:	80c007b7          	lui	a5,0x80c00
804059ac:	fcc7e4e3          	bltu	a5,a2,80405974 <user_mem_check+0x94>
804059b0:	00100513          	li	a0,1
804059b4:	fc5ff06f          	j	80405978 <user_mem_check+0x98>

804059b8 <copy_from_user>:
804059b8:	ff010113          	addi	sp,sp,-16
804059bc:	00812423          	sw	s0,8(sp)
804059c0:	00912223          	sw	s1,4(sp)
804059c4:	00060413          	mv	s0,a2
804059c8:	00068493          	mv	s1,a3
804059cc:	01212023          	sw	s2,0(sp)
804059d0:	00070693          	mv	a3,a4
804059d4:	00058913          	mv	s2,a1
804059d8:	00048613          	mv	a2,s1
804059dc:	00040593          	mv	a1,s0
804059e0:	00112623          	sw	ra,12(sp)
804059e4:	efdff0ef          	jal	ra,804058e0 <user_mem_check>
804059e8:	00050c63          	beqz	a0,80405a00 <copy_from_user+0x48>
804059ec:	00048613          	mv	a2,s1
804059f0:	00040593          	mv	a1,s0
804059f4:	00090513          	mv	a0,s2
804059f8:	2290d0ef          	jal	ra,80413420 <memcpy>
804059fc:	00100513          	li	a0,1
80405a00:	00c12083          	lw	ra,12(sp)
80405a04:	00812403          	lw	s0,8(sp)
80405a08:	00412483          	lw	s1,4(sp)
80405a0c:	00012903          	lw	s2,0(sp)
80405a10:	01010113          	addi	sp,sp,16
80405a14:	00008067          	ret

80405a18 <copy_to_user>:
80405a18:	ff010113          	addi	sp,sp,-16
80405a1c:	00812423          	sw	s0,8(sp)
80405a20:	00068413          	mv	s0,a3
80405a24:	01212023          	sw	s2,0(sp)
80405a28:	00100693          	li	a3,1
80405a2c:	00060913          	mv	s2,a2
80405a30:	00040613          	mv	a2,s0
80405a34:	00912223          	sw	s1,4(sp)
80405a38:	00112623          	sw	ra,12(sp)
80405a3c:	00058493          	mv	s1,a1
80405a40:	ea1ff0ef          	jal	ra,804058e0 <user_mem_check>
80405a44:	00050c63          	beqz	a0,80405a5c <copy_to_user+0x44>
80405a48:	00040613          	mv	a2,s0
80405a4c:	00090593          	mv	a1,s2
80405a50:	00048513          	mv	a0,s1
80405a54:	1cd0d0ef          	jal	ra,80413420 <memcpy>
80405a58:	00100513          	li	a0,1
80405a5c:	00c12083          	lw	ra,12(sp)
80405a60:	00812403          	lw	s0,8(sp)
80405a64:	00412483          	lw	s1,4(sp)
80405a68:	00012903          	lw	s2,0(sp)
80405a6c:	01010113          	addi	sp,sp,16
80405a70:	00008067          	ret

80405a74 <copy_string>:
80405a74:	fe010113          	addi	sp,sp,-32
80405a78:	01312623          	sw	s3,12(sp)
80405a7c:	000019b7          	lui	s3,0x1
80405a80:	013609b3          	add	s3,a2,s3
80405a84:	fffff7b7          	lui	a5,0xfffff
80405a88:	00f9f9b3          	and	s3,s3,a5
80405a8c:	00912a23          	sw	s1,20(sp)
80405a90:	01212823          	sw	s2,16(sp)
80405a94:	01412423          	sw	s4,8(sp)
80405a98:	01512223          	sw	s5,4(sp)
80405a9c:	00112e23          	sw	ra,28(sp)
80405aa0:	00812c23          	sw	s0,24(sp)
80405aa4:	00060493          	mv	s1,a2
80405aa8:	00050a93          	mv	s5,a0
80405aac:	00058a13          	mv	s4,a1
80405ab0:	00068913          	mv	s2,a3
80405ab4:	40c989b3          	sub	s3,s3,a2
80405ab8:	0380006f          	j	80405af0 <copy_string+0x7c>
80405abc:	00048513          	mv	a0,s1
80405ac0:	03d0d0ef          	jal	ra,804132fc <strnlen>
80405ac4:	00050793          	mv	a5,a0
80405ac8:	00048593          	mv	a1,s1
80405acc:	000a0513          	mv	a0,s4
80405ad0:	00040613          	mv	a2,s0
80405ad4:	0687e663          	bltu	a5,s0,80405b40 <copy_string+0xcc>
80405ad8:	0529f063          	bgeu	s3,s2,80405b18 <copy_string+0xa4>
80405adc:	1450d0ef          	jal	ra,80413420 <memcpy>
80405ae0:	008a0a33          	add	s4,s4,s0
80405ae4:	008484b3          	add	s1,s1,s0
80405ae8:	40890933          	sub	s2,s2,s0
80405aec:	000019b7          	lui	s3,0x1
80405af0:	00000693          	li	a3,0
80405af4:	00048593          	mv	a1,s1
80405af8:	000a8513          	mv	a0,s5
80405afc:	00090413          	mv	s0,s2
80405b00:	0129f463          	bgeu	s3,s2,80405b08 <copy_string+0x94>
80405b04:	00098413          	mv	s0,s3
80405b08:	00040613          	mv	a2,s0
80405b0c:	dd5ff0ef          	jal	ra,804058e0 <user_mem_check>
80405b10:	00040593          	mv	a1,s0
80405b14:	fa0514e3          	bnez	a0,80405abc <copy_string+0x48>
80405b18:	00000513          	li	a0,0
80405b1c:	01c12083          	lw	ra,28(sp)
80405b20:	01812403          	lw	s0,24(sp)
80405b24:	01412483          	lw	s1,20(sp)
80405b28:	01012903          	lw	s2,16(sp)
80405b2c:	00c12983          	lw	s3,12(sp)
80405b30:	00812a03          	lw	s4,8(sp)
80405b34:	00412a83          	lw	s5,4(sp)
80405b38:	02010113          	addi	sp,sp,32
80405b3c:	00008067          	ret
80405b40:	00178613          	addi	a2,a5,1 # fffff001 <end+0x7fb62741>
80405b44:	0dd0d0ef          	jal	ra,80413420 <memcpy>
80405b48:	00100513          	li	a0,1
80405b4c:	fd1ff06f          	j	80405b1c <copy_string+0xa8>

80405b50 <__down.constprop.0>:
80405b50:	fc010113          	addi	sp,sp,-64
80405b54:	02112e23          	sw	ra,60(sp)
80405b58:	02812c23          	sw	s0,56(sp)
80405b5c:	02912a23          	sw	s1,52(sp)
80405b60:	100027f3          	csrr	a5,sstatus
80405b64:	0027f793          	andi	a5,a5,2
80405b68:	08079663          	bnez	a5,80405bf4 <__down.constprop.0+0xa4>
80405b6c:	00052703          	lw	a4,0(a0)
80405b70:	02e05263          	blez	a4,80405b94 <__down.constprop.0+0x44>
80405b74:	03c12083          	lw	ra,60(sp)
80405b78:	03812403          	lw	s0,56(sp)
80405b7c:	fff70713          	addi	a4,a4,-1
80405b80:	00e52023          	sw	a4,0(a0)
80405b84:	03412483          	lw	s1,52(sp)
80405b88:	00078513          	mv	a0,a5
80405b8c:	04010113          	addi	sp,sp,64
80405b90:	00008067          	ret
80405b94:	00450413          	addi	s0,a0,4
80405b98:	01c10493          	addi	s1,sp,28
80405b9c:	10000613          	li	a2,256
80405ba0:	00048593          	mv	a1,s1
80405ba4:	00040513          	mv	a0,s0
80405ba8:	3ac000ef          	jal	ra,80405f54 <wait_current_set>
80405bac:	2c5070ef          	jal	ra,8040d670 <schedule>
80405bb0:	100027f3          	csrr	a5,sstatus
80405bb4:	0027f793          	andi	a5,a5,2
80405bb8:	0a079463          	bnez	a5,80405c60 <__down.constprop.0+0x110>
80405bbc:	00048513          	mv	a0,s1
80405bc0:	29c000ef          	jal	ra,80405e5c <wait_in_queue>
80405bc4:	08051663          	bnez	a0,80405c50 <__down.constprop.0+0x100>
80405bc8:	02012783          	lw	a5,32(sp)
80405bcc:	03c12083          	lw	ra,60(sp)
80405bd0:	03812403          	lw	s0,56(sp)
80405bd4:	f0078713          	addi	a4,a5,-256
80405bd8:	00e03733          	snez	a4,a4
80405bdc:	40e00733          	neg	a4,a4
80405be0:	00e7f7b3          	and	a5,a5,a4
80405be4:	03412483          	lw	s1,52(sp)
80405be8:	00078513          	mv	a0,a5
80405bec:	04010113          	addi	sp,sp,64
80405bf0:	00008067          	ret
80405bf4:	00a12623          	sw	a0,12(sp)
80405bf8:	834fb0ef          	jal	ra,80400c2c <intr_disable>
80405bfc:	00c12503          	lw	a0,12(sp)
80405c00:	00052783          	lw	a5,0(a0)
80405c04:	02f05663          	blez	a5,80405c30 <__down.constprop.0+0xe0>
80405c08:	fff78793          	addi	a5,a5,-1
80405c0c:	00f52023          	sw	a5,0(a0)
80405c10:	814fb0ef          	jal	ra,80400c24 <intr_enable>
80405c14:	03c12083          	lw	ra,60(sp)
80405c18:	03812403          	lw	s0,56(sp)
80405c1c:	00000793          	li	a5,0
80405c20:	03412483          	lw	s1,52(sp)
80405c24:	00078513          	mv	a0,a5
80405c28:	04010113          	addi	sp,sp,64
80405c2c:	00008067          	ret
80405c30:	00450413          	addi	s0,a0,4
80405c34:	01c10493          	addi	s1,sp,28
80405c38:	10000613          	li	a2,256
80405c3c:	00048593          	mv	a1,s1
80405c40:	00040513          	mv	a0,s0
80405c44:	310000ef          	jal	ra,80405f54 <wait_current_set>
80405c48:	fddfa0ef          	jal	ra,80400c24 <intr_enable>
80405c4c:	f61ff06f          	j	80405bac <__down.constprop.0+0x5c>
80405c50:	00048593          	mv	a1,s1
80405c54:	00040513          	mv	a0,s0
80405c58:	1a4000ef          	jal	ra,80405dfc <wait_queue_del>
80405c5c:	f6dff06f          	j	80405bc8 <__down.constprop.0+0x78>
80405c60:	fcdfa0ef          	jal	ra,80400c2c <intr_disable>
80405c64:	00048513          	mv	a0,s1
80405c68:	1f4000ef          	jal	ra,80405e5c <wait_in_queue>
80405c6c:	00051663          	bnez	a0,80405c78 <__down.constprop.0+0x128>
80405c70:	fb5fa0ef          	jal	ra,80400c24 <intr_enable>
80405c74:	f55ff06f          	j	80405bc8 <__down.constprop.0+0x78>
80405c78:	00048593          	mv	a1,s1
80405c7c:	00040513          	mv	a0,s0
80405c80:	17c000ef          	jal	ra,80405dfc <wait_queue_del>
80405c84:	fedff06f          	j	80405c70 <__down.constprop.0+0x120>

80405c88 <__up.constprop.1>:
80405c88:	ff010113          	addi	sp,sp,-16
80405c8c:	00912223          	sw	s1,4(sp)
80405c90:	00112623          	sw	ra,12(sp)
80405c94:	00812423          	sw	s0,8(sp)
80405c98:	01212023          	sw	s2,0(sp)
80405c9c:	00050493          	mv	s1,a0
80405ca0:	100027f3          	csrr	a5,sstatus
80405ca4:	0027f793          	andi	a5,a5,2
80405ca8:	00000913          	li	s2,0
80405cac:	06079e63          	bnez	a5,80405d28 <__up.constprop.1+0xa0>
80405cb0:	00448413          	addi	s0,s1,4
80405cb4:	00040513          	mv	a0,s0
80405cb8:	17c000ef          	jal	ra,80405e34 <wait_queue_first>
80405cbc:	04050e63          	beqz	a0,80405d18 <__up.constprop.1+0x90>
80405cc0:	00052703          	lw	a4,0(a0)
80405cc4:	10000793          	li	a5,256
80405cc8:	0a872703          	lw	a4,168(a4)
80405ccc:	06f71463          	bne	a4,a5,80405d34 <__up.constprop.1+0xac>
80405cd0:	00050593          	mv	a1,a0
80405cd4:	00100693          	li	a3,1
80405cd8:	10000613          	li	a2,256
80405cdc:	00040513          	mv	a0,s0
80405ce0:	190000ef          	jal	ra,80405e70 <wakeup_wait>
80405ce4:	00091e63          	bnez	s2,80405d00 <__up.constprop.1+0x78>
80405ce8:	00c12083          	lw	ra,12(sp)
80405cec:	00812403          	lw	s0,8(sp)
80405cf0:	00412483          	lw	s1,4(sp)
80405cf4:	00012903          	lw	s2,0(sp)
80405cf8:	01010113          	addi	sp,sp,16
80405cfc:	00008067          	ret
80405d00:	00812403          	lw	s0,8(sp)
80405d04:	00c12083          	lw	ra,12(sp)
80405d08:	00412483          	lw	s1,4(sp)
80405d0c:	00012903          	lw	s2,0(sp)
80405d10:	01010113          	addi	sp,sp,16
80405d14:	f11fa06f          	j	80400c24 <intr_enable>
80405d18:	0004a783          	lw	a5,0(s1)
80405d1c:	00178793          	addi	a5,a5,1
80405d20:	00f4a023          	sw	a5,0(s1)
80405d24:	fc1ff06f          	j	80405ce4 <__up.constprop.1+0x5c>
80405d28:	f05fa0ef          	jal	ra,80400c2c <intr_disable>
80405d2c:	00100913          	li	s2,1
80405d30:	f81ff06f          	j	80405cb0 <__up.constprop.1+0x28>
80405d34:	0000f697          	auipc	a3,0xf
80405d38:	f7068693          	addi	a3,a3,-144 # 80414ca4 <default_pmm_manager+0xc48>
80405d3c:	0000e617          	auipc	a2,0xe
80405d40:	aa460613          	addi	a2,a2,-1372 # 804137e0 <commands+0x1bc>
80405d44:	01a00593          	li	a1,26
80405d48:	0000f517          	auipc	a0,0xf
80405d4c:	f8450513          	addi	a0,a0,-124 # 80414ccc <default_pmm_manager+0xc70>
80405d50:	8d5fa0ef          	jal	ra,80400624 <__panic>

80405d54 <sem_init>:
80405d54:	00b52023          	sw	a1,0(a0)
80405d58:	00450513          	addi	a0,a0,4
80405d5c:	0940006f          	j	80405df0 <wait_queue_init>

80405d60 <up>:
80405d60:	f29ff06f          	j	80405c88 <__up.constprop.1>

80405d64 <down>:
80405d64:	ff010113          	addi	sp,sp,-16
80405d68:	00112623          	sw	ra,12(sp)
80405d6c:	de5ff0ef          	jal	ra,80405b50 <__down.constprop.0>
80405d70:	00051863          	bnez	a0,80405d80 <down+0x1c>
80405d74:	00c12083          	lw	ra,12(sp)
80405d78:	01010113          	addi	sp,sp,16
80405d7c:	00008067          	ret
80405d80:	0000f697          	auipc	a3,0xf
80405d84:	f5c68693          	addi	a3,a3,-164 # 80414cdc <default_pmm_manager+0xc80>
80405d88:	0000e617          	auipc	a2,0xe
80405d8c:	a5860613          	addi	a2,a2,-1448 # 804137e0 <commands+0x1bc>
80405d90:	04100593          	li	a1,65
80405d94:	0000f517          	auipc	a0,0xf
80405d98:	f3850513          	addi	a0,a0,-200 # 80414ccc <default_pmm_manager+0xc70>
80405d9c:	889fa0ef          	jal	ra,80400624 <__panic>

80405da0 <wait_queue_del.part.1>:
80405da0:	ff010113          	addi	sp,sp,-16
80405da4:	0000f697          	auipc	a3,0xf
80405da8:	f5468693          	addi	a3,a3,-172 # 80414cf8 <default_pmm_manager+0xc9c>
80405dac:	0000e617          	auipc	a2,0xe
80405db0:	a3460613          	addi	a2,a2,-1484 # 804137e0 <commands+0x1bc>
80405db4:	01e00593          	li	a1,30
80405db8:	0000f517          	auipc	a0,0xf
80405dbc:	f8050513          	addi	a0,a0,-128 # 80414d38 <default_pmm_manager+0xcdc>
80405dc0:	00112623          	sw	ra,12(sp)
80405dc4:	861fa0ef          	jal	ra,80400624 <__panic>

80405dc8 <wait_queue_next.part.2>:
80405dc8:	ff010113          	addi	sp,sp,-16
80405dcc:	0000f697          	auipc	a3,0xf
80405dd0:	f2c68693          	addi	a3,a3,-212 # 80414cf8 <default_pmm_manager+0xc9c>
80405dd4:	0000e617          	auipc	a2,0xe
80405dd8:	a0c60613          	addi	a2,a2,-1524 # 804137e0 <commands+0x1bc>
80405ddc:	02400593          	li	a1,36
80405de0:	0000f517          	auipc	a0,0xf
80405de4:	f5850513          	addi	a0,a0,-168 # 80414d38 <default_pmm_manager+0xcdc>
80405de8:	00112623          	sw	ra,12(sp)
80405dec:	839fa0ef          	jal	ra,80400624 <__panic>

80405df0 <wait_queue_init>:
80405df0:	00a52223          	sw	a0,4(a0)
80405df4:	00a52023          	sw	a0,0(a0)
80405df8:	00008067          	ret

80405dfc <wait_queue_del>:
80405dfc:	0105a703          	lw	a4,16(a1)
80405e00:	00c58793          	addi	a5,a1,12
80405e04:	02e78263          	beq	a5,a4,80405e28 <wait_queue_del+0x2c>
80405e08:	0085a683          	lw	a3,8(a1)
80405e0c:	00a69e63          	bne	a3,a0,80405e28 <wait_queue_del+0x2c>
80405e10:	00c5a683          	lw	a3,12(a1)
80405e14:	00e6a223          	sw	a4,4(a3)
80405e18:	00d72023          	sw	a3,0(a4)
80405e1c:	00f5a823          	sw	a5,16(a1)
80405e20:	00f5a623          	sw	a5,12(a1)
80405e24:	00008067          	ret
80405e28:	ff010113          	addi	sp,sp,-16
80405e2c:	00112623          	sw	ra,12(sp)
80405e30:	f71ff0ef          	jal	ra,80405da0 <wait_queue_del.part.1>

80405e34 <wait_queue_first>:
80405e34:	00452783          	lw	a5,4(a0)
80405e38:	00f50663          	beq	a0,a5,80405e44 <wait_queue_first+0x10>
80405e3c:	ff478513          	addi	a0,a5,-12
80405e40:	00008067          	ret
80405e44:	00000513          	li	a0,0
80405e48:	00008067          	ret

80405e4c <wait_queue_empty>:
80405e4c:	00452783          	lw	a5,4(a0)
80405e50:	40a78533          	sub	a0,a5,a0
80405e54:	00153513          	seqz	a0,a0
80405e58:	00008067          	ret

80405e5c <wait_in_queue>:
80405e5c:	01052783          	lw	a5,16(a0)
80405e60:	00c50513          	addi	a0,a0,12
80405e64:	40a78533          	sub	a0,a5,a0
80405e68:	00a03533          	snez	a0,a0
80405e6c:	00008067          	ret

80405e70 <wakeup_wait>:
80405e70:	02068663          	beqz	a3,80405e9c <wakeup_wait+0x2c>
80405e74:	0105a703          	lw	a4,16(a1)
80405e78:	00c58793          	addi	a5,a1,12
80405e7c:	02e78663          	beq	a5,a4,80405ea8 <wakeup_wait+0x38>
80405e80:	0085a683          	lw	a3,8(a1)
80405e84:	02d51263          	bne	a0,a3,80405ea8 <wakeup_wait+0x38>
80405e88:	00c5a683          	lw	a3,12(a1)
80405e8c:	00e6a223          	sw	a4,4(a3)
80405e90:	00d72023          	sw	a3,0(a4)
80405e94:	00f5a823          	sw	a5,16(a1)
80405e98:	00f5a623          	sw	a5,12(a1)
80405e9c:	0005a503          	lw	a0,0(a1)
80405ea0:	00c5a223          	sw	a2,4(a1)
80405ea4:	6d00706f          	j	8040d574 <wakeup_proc>
80405ea8:	ff010113          	addi	sp,sp,-16
80405eac:	00112623          	sw	ra,12(sp)
80405eb0:	ef1ff0ef          	jal	ra,80405da0 <wait_queue_del.part.1>

80405eb4 <wakeup_queue>:
80405eb4:	ff010113          	addi	sp,sp,-16
80405eb8:	00812423          	sw	s0,8(sp)
80405ebc:	00452403          	lw	s0,4(a0)
80405ec0:	00112623          	sw	ra,12(sp)
80405ec4:	00912223          	sw	s1,4(sp)
80405ec8:	01212023          	sw	s2,0(sp)
80405ecc:	04850263          	beq	a0,s0,80405f10 <wakeup_queue+0x5c>
80405ed0:	ff440413          	addi	s0,s0,-12
80405ed4:	02040e63          	beqz	s0,80405f10 <wakeup_queue+0x5c>
80405ed8:	00058913          	mv	s2,a1
80405edc:	00050493          	mv	s1,a0
80405ee0:	04061463          	bnez	a2,80405f28 <wakeup_queue+0x74>
80405ee4:	00042503          	lw	a0,0(s0)
80405ee8:	01242223          	sw	s2,4(s0)
80405eec:	688070ef          	jal	ra,8040d574 <wakeup_proc>
80405ef0:	01042783          	lw	a5,16(s0)
80405ef4:	00c40713          	addi	a4,s0,12
80405ef8:	04e78c63          	beq	a5,a4,80405f50 <wakeup_queue+0x9c>
80405efc:	00842703          	lw	a4,8(s0)
80405f00:	04e49863          	bne	s1,a4,80405f50 <wakeup_queue+0x9c>
80405f04:	00f48663          	beq	s1,a5,80405f10 <wakeup_queue+0x5c>
80405f08:	ff478413          	addi	s0,a5,-12
80405f0c:	fc041ce3          	bnez	s0,80405ee4 <wakeup_queue+0x30>
80405f10:	00c12083          	lw	ra,12(sp)
80405f14:	00812403          	lw	s0,8(sp)
80405f18:	00412483          	lw	s1,4(sp)
80405f1c:	00012903          	lw	s2,0(sp)
80405f20:	01010113          	addi	sp,sp,16
80405f24:	00008067          	ret
80405f28:	00040593          	mv	a1,s0
80405f2c:	00100693          	li	a3,1
80405f30:	00090613          	mv	a2,s2
80405f34:	00048513          	mv	a0,s1
80405f38:	f39ff0ef          	jal	ra,80405e70 <wakeup_wait>
80405f3c:	0044a403          	lw	s0,4(s1)
80405f40:	fc8488e3          	beq	s1,s0,80405f10 <wakeup_queue+0x5c>
80405f44:	ff440413          	addi	s0,s0,-12
80405f48:	fe0410e3          	bnez	s0,80405f28 <wakeup_queue+0x74>
80405f4c:	fc5ff06f          	j	80405f10 <wakeup_queue+0x5c>
80405f50:	e79ff0ef          	jal	ra,80405dc8 <wait_queue_next.part.2>

80405f54 <wait_current_set>:
80405f54:	00097797          	auipc	a5,0x97
80405f58:	85c78793          	addi	a5,a5,-1956 # 8049c7b0 <current>
80405f5c:	0007a783          	lw	a5,0(a5)
80405f60:	04078063          	beqz	a5,80405fa0 <wait_current_set+0x4c>
80405f64:	00c58713          	addi	a4,a1,12
80405f68:	800006b7          	lui	a3,0x80000
80405f6c:	00e5a623          	sw	a4,12(a1)
80405f70:	00f5a023          	sw	a5,0(a1)
80405f74:	00d5a223          	sw	a3,4(a1)
80405f78:	00100693          	li	a3,1
80405f7c:	00d7a023          	sw	a3,0(a5)
80405f80:	0ac7a423          	sw	a2,168(a5)
80405f84:	00052783          	lw	a5,0(a0)
80405f88:	00a5a423          	sw	a0,8(a1)
80405f8c:	00e52023          	sw	a4,0(a0)
80405f90:	00e7a223          	sw	a4,4(a5)
80405f94:	00a5a823          	sw	a0,16(a1)
80405f98:	00f5a623          	sw	a5,12(a1)
80405f9c:	00008067          	ret
80405fa0:	ff010113          	addi	sp,sp,-16
80405fa4:	0000f697          	auipc	a3,0xf
80405fa8:	d4468693          	addi	a3,a3,-700 # 80414ce8 <default_pmm_manager+0xc8c>
80405fac:	0000e617          	auipc	a2,0xe
80405fb0:	83460613          	addi	a2,a2,-1996 # 804137e0 <commands+0x1bc>
80405fb4:	07600593          	li	a1,118
80405fb8:	0000f517          	auipc	a0,0xf
80405fbc:	d8050513          	addi	a0,a0,-640 # 80414d38 <default_pmm_manager+0xcdc>
80405fc0:	00112623          	sw	ra,12(sp)
80405fc4:	e60fa0ef          	jal	ra,80400624 <__panic>

80405fc8 <get_fd_array.part.4>:
80405fc8:	ff010113          	addi	sp,sp,-16
80405fcc:	0000f697          	auipc	a3,0xf
80405fd0:	0d068693          	addi	a3,a3,208 # 8041509c <CSWTCH.69+0x344>
80405fd4:	0000e617          	auipc	a2,0xe
80405fd8:	80c60613          	addi	a2,a2,-2036 # 804137e0 <commands+0x1bc>
80405fdc:	01400593          	li	a1,20
80405fe0:	0000f517          	auipc	a0,0xf
80405fe4:	0e850513          	addi	a0,a0,232 # 804150c8 <CSWTCH.69+0x370>
80405fe8:	00112623          	sw	ra,12(sp)
80405fec:	e38fa0ef          	jal	ra,80400624 <__panic>

80405ff0 <fd_array_alloc>:
80405ff0:	00096797          	auipc	a5,0x96
80405ff4:	7c078793          	addi	a5,a5,1984 # 8049c7b0 <current>
80405ff8:	0007a783          	lw	a5,0(a5)
80405ffc:	ff010113          	addi	sp,sp,-16
80406000:	00112623          	sw	ra,12(sp)
80406004:	0dc7a683          	lw	a3,220(a5)
80406008:	0a068463          	beqz	a3,804060b0 <fd_array_alloc+0xc0>
8040600c:	0086a783          	lw	a5,8(a3)
80406010:	0af05063          	blez	a5,804060b0 <fd_array_alloc+0xc0>
80406014:	ffff7737          	lui	a4,0xffff7
80406018:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <end+0x7fb5a219>
8040601c:	0046a683          	lw	a3,4(a3)
80406020:	04e50463          	beq	a0,a4,80406068 <fd_array_alloc+0x78>
80406024:	09000793          	li	a5,144
80406028:	08a7e063          	bltu	a5,a0,804060a8 <fd_array_alloc+0xb8>
8040602c:	00351793          	slli	a5,a0,0x3
80406030:	40a787b3          	sub	a5,a5,a0
80406034:	00279793          	slli	a5,a5,0x2
80406038:	00f687b3          	add	a5,a3,a5
8040603c:	0007a703          	lw	a4,0(a5)
80406040:	06071063          	bnez	a4,804060a0 <fd_array_alloc+0xb0>
80406044:	0187a503          	lw	a0,24(a5)
80406048:	06051663          	bnez	a0,804060b4 <fd_array_alloc+0xc4>
8040604c:	00100713          	li	a4,1
80406050:	00e7a023          	sw	a4,0(a5)
80406054:	0007aa23          	sw	zero,20(a5)
80406058:	00f5a023          	sw	a5,0(a1)
8040605c:	00c12083          	lw	ra,12(sp)
80406060:	01010113          	addi	sp,sp,16
80406064:	00008067          	ret
80406068:	0006a783          	lw	a5,0(a3)
8040606c:	02078663          	beqz	a5,80406098 <fd_array_alloc+0xa8>
80406070:	00001737          	lui	a4,0x1
80406074:	fdc70713          	addi	a4,a4,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406078:	01c68793          	addi	a5,a3,28
8040607c:	00e686b3          	add	a3,a3,a4
80406080:	0007a703          	lw	a4,0(a5)
80406084:	fc0700e3          	beqz	a4,80406044 <fd_array_alloc+0x54>
80406088:	01c78793          	addi	a5,a5,28
8040608c:	fef69ae3          	bne	a3,a5,80406080 <fd_array_alloc+0x90>
80406090:	fea00513          	li	a0,-22
80406094:	fc9ff06f          	j	8040605c <fd_array_alloc+0x6c>
80406098:	00068793          	mv	a5,a3
8040609c:	fa9ff06f          	j	80406044 <fd_array_alloc+0x54>
804060a0:	ff100513          	li	a0,-15
804060a4:	fb9ff06f          	j	8040605c <fd_array_alloc+0x6c>
804060a8:	ffd00513          	li	a0,-3
804060ac:	fb1ff06f          	j	8040605c <fd_array_alloc+0x6c>
804060b0:	f19ff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>
804060b4:	0000f697          	auipc	a3,0xf
804060b8:	ccc68693          	addi	a3,a3,-820 # 80414d80 <CSWTCH.69+0x28>
804060bc:	0000d617          	auipc	a2,0xd
804060c0:	72460613          	addi	a2,a2,1828 # 804137e0 <commands+0x1bc>
804060c4:	03b00593          	li	a1,59
804060c8:	0000f517          	auipc	a0,0xf
804060cc:	00050513          	mv	a0,a0
804060d0:	d54fa0ef          	jal	ra,80400624 <__panic>

804060d4 <fd_array_free>:
804060d4:	00052783          	lw	a5,0(a0) # 804150c8 <CSWTCH.69+0x370>
804060d8:	ff010113          	addi	sp,sp,-16
804060dc:	00812423          	sw	s0,8(sp)
804060e0:	00112623          	sw	ra,12(sp)
804060e4:	00100713          	li	a4,1
804060e8:	00050413          	mv	s0,a0
804060ec:	04e78863          	beq	a5,a4,8040613c <fd_array_free+0x68>
804060f0:	00300713          	li	a4,3
804060f4:	06e79263          	bne	a5,a4,80406158 <fd_array_free+0x84>
804060f8:	01852783          	lw	a5,24(a0)
804060fc:	02078263          	beqz	a5,80406120 <fd_array_free+0x4c>
80406100:	0000f697          	auipc	a3,0xf
80406104:	c8068693          	addi	a3,a3,-896 # 80414d80 <CSWTCH.69+0x28>
80406108:	0000d617          	auipc	a2,0xd
8040610c:	6d860613          	addi	a2,a2,1752 # 804137e0 <commands+0x1bc>
80406110:	04500593          	li	a1,69
80406114:	0000f517          	auipc	a0,0xf
80406118:	fb450513          	addi	a0,a0,-76 # 804150c8 <CSWTCH.69+0x370>
8040611c:	d08fa0ef          	jal	ra,80400624 <__panic>
80406120:	01442503          	lw	a0,20(s0)
80406124:	2b1080ef          	jal	ra,8040ebd4 <vfs_close>
80406128:	00c12083          	lw	ra,12(sp)
8040612c:	00042023          	sw	zero,0(s0)
80406130:	00812403          	lw	s0,8(sp)
80406134:	01010113          	addi	sp,sp,16
80406138:	00008067          	ret
8040613c:	01852783          	lw	a5,24(a0)
80406140:	fc0790e3          	bnez	a5,80406100 <fd_array_free+0x2c>
80406144:	00042023          	sw	zero,0(s0)
80406148:	00c12083          	lw	ra,12(sp)
8040614c:	00812403          	lw	s0,8(sp)
80406150:	01010113          	addi	sp,sp,16
80406154:	00008067          	ret
80406158:	0000f697          	auipc	a3,0xf
8040615c:	c7468693          	addi	a3,a3,-908 # 80414dcc <CSWTCH.69+0x74>
80406160:	0000d617          	auipc	a2,0xd
80406164:	68060613          	addi	a2,a2,1664 # 804137e0 <commands+0x1bc>
80406168:	04400593          	li	a1,68
8040616c:	0000f517          	auipc	a0,0xf
80406170:	f5c50513          	addi	a0,a0,-164 # 804150c8 <CSWTCH.69+0x370>
80406174:	cb0fa0ef          	jal	ra,80400624 <__panic>

80406178 <fd_array_release>:
80406178:	00052783          	lw	a5,0(a0)
8040617c:	ff010113          	addi	sp,sp,-16
80406180:	00112623          	sw	ra,12(sp)
80406184:	00100693          	li	a3,1
80406188:	ffe78793          	addi	a5,a5,-2
8040618c:	04f6e863          	bltu	a3,a5,804061dc <fd_array_release+0x64>
80406190:	01852783          	lw	a5,24(a0)
80406194:	02f05463          	blez	a5,804061bc <fd_array_release+0x44>
80406198:	fff78793          	addi	a5,a5,-1
8040619c:	00f52c23          	sw	a5,24(a0)
804061a0:	00078863          	beqz	a5,804061b0 <fd_array_release+0x38>
804061a4:	00c12083          	lw	ra,12(sp)
804061a8:	01010113          	addi	sp,sp,16
804061ac:	00008067          	ret
804061b0:	00c12083          	lw	ra,12(sp)
804061b4:	01010113          	addi	sp,sp,16
804061b8:	f1dff06f          	j	804060d4 <fd_array_free>
804061bc:	0000f697          	auipc	a3,0xf
804061c0:	cb068693          	addi	a3,a3,-848 # 80414e6c <CSWTCH.69+0x114>
804061c4:	0000d617          	auipc	a2,0xd
804061c8:	61c60613          	addi	a2,a2,1564 # 804137e0 <commands+0x1bc>
804061cc:	05600593          	li	a1,86
804061d0:	0000f517          	auipc	a0,0xf
804061d4:	ef850513          	addi	a0,a0,-264 # 804150c8 <CSWTCH.69+0x370>
804061d8:	c4cfa0ef          	jal	ra,80400624 <__panic>
804061dc:	0000f697          	auipc	a3,0xf
804061e0:	c5868693          	addi	a3,a3,-936 # 80414e34 <CSWTCH.69+0xdc>
804061e4:	0000d617          	auipc	a2,0xd
804061e8:	5fc60613          	addi	a2,a2,1532 # 804137e0 <commands+0x1bc>
804061ec:	05500593          	li	a1,85
804061f0:	0000f517          	auipc	a0,0xf
804061f4:	ed850513          	addi	a0,a0,-296 # 804150c8 <CSWTCH.69+0x370>
804061f8:	c2cfa0ef          	jal	ra,80400624 <__panic>

804061fc <fd_array_open.part.9>:
804061fc:	ff010113          	addi	sp,sp,-16
80406200:	0000f697          	auipc	a3,0xf
80406204:	c0468693          	addi	a3,a3,-1020 # 80414e04 <CSWTCH.69+0xac>
80406208:	0000d617          	auipc	a2,0xd
8040620c:	5d860613          	addi	a2,a2,1496 # 804137e0 <commands+0x1bc>
80406210:	05f00593          	li	a1,95
80406214:	0000f517          	auipc	a0,0xf
80406218:	eb450513          	addi	a0,a0,-332 # 804150c8 <CSWTCH.69+0x370>
8040621c:	00112623          	sw	ra,12(sp)
80406220:	c04fa0ef          	jal	ra,80400624 <__panic>

80406224 <fd_array_init>:
80406224:	00000793          	li	a5,0
80406228:	09100713          	li	a4,145
8040622c:	00f52623          	sw	a5,12(a0)
80406230:	00052c23          	sw	zero,24(a0)
80406234:	00052023          	sw	zero,0(a0)
80406238:	00178793          	addi	a5,a5,1
8040623c:	01c50513          	addi	a0,a0,28
80406240:	fee796e3          	bne	a5,a4,8040622c <fd_array_init+0x8>
80406244:	00008067          	ret

80406248 <fd_array_close>:
80406248:	00052683          	lw	a3,0(a0)
8040624c:	ff010113          	addi	sp,sp,-16
80406250:	00112623          	sw	ra,12(sp)
80406254:	00200793          	li	a5,2
80406258:	04f69c63          	bne	a3,a5,804062b0 <fd_array_close+0x68>
8040625c:	01852783          	lw	a5,24(a0)
80406260:	02f05863          	blez	a5,80406290 <fd_array_close+0x48>
80406264:	fff78793          	addi	a5,a5,-1
80406268:	00300693          	li	a3,3
8040626c:	00d52023          	sw	a3,0(a0)
80406270:	00f52c23          	sw	a5,24(a0)
80406274:	00078863          	beqz	a5,80406284 <fd_array_close+0x3c>
80406278:	00c12083          	lw	ra,12(sp)
8040627c:	01010113          	addi	sp,sp,16
80406280:	00008067          	ret
80406284:	00c12083          	lw	ra,12(sp)
80406288:	01010113          	addi	sp,sp,16
8040628c:	e49ff06f          	j	804060d4 <fd_array_free>
80406290:	0000f697          	auipc	a3,0xf
80406294:	bdc68693          	addi	a3,a3,-1060 # 80414e6c <CSWTCH.69+0x114>
80406298:	0000d617          	auipc	a2,0xd
8040629c:	54860613          	addi	a2,a2,1352 # 804137e0 <commands+0x1bc>
804062a0:	06800593          	li	a1,104
804062a4:	0000f517          	auipc	a0,0xf
804062a8:	e2450513          	addi	a0,a0,-476 # 804150c8 <CSWTCH.69+0x370>
804062ac:	b78fa0ef          	jal	ra,80400624 <__panic>
804062b0:	0000f697          	auipc	a3,0xf
804062b4:	ab468693          	addi	a3,a3,-1356 # 80414d64 <CSWTCH.69+0xc>
804062b8:	0000d617          	auipc	a2,0xd
804062bc:	52860613          	addi	a2,a2,1320 # 804137e0 <commands+0x1bc>
804062c0:	06700593          	li	a1,103
804062c4:	0000f517          	auipc	a0,0xf
804062c8:	e0450513          	addi	a0,a0,-508 # 804150c8 <CSWTCH.69+0x370>
804062cc:	b58fa0ef          	jal	ra,80400624 <__panic>

804062d0 <fd_array_dup>:
804062d0:	fe010113          	addi	sp,sp,-32
804062d4:	01212823          	sw	s2,16(sp)
804062d8:	00052903          	lw	s2,0(a0)
804062dc:	00112e23          	sw	ra,28(sp)
804062e0:	00812c23          	sw	s0,24(sp)
804062e4:	00912a23          	sw	s1,20(sp)
804062e8:	01312623          	sw	s3,12(sp)
804062ec:	00100793          	li	a5,1
804062f0:	06f91e63          	bne	s2,a5,8040636c <fd_array_dup+0x9c>
804062f4:	0005a983          	lw	s3,0(a1)
804062f8:	00200793          	li	a5,2
804062fc:	06f99863          	bne	s3,a5,8040636c <fd_array_dup+0x9c>
80406300:	0145a483          	lw	s1,20(a1)
80406304:	0085a783          	lw	a5,8(a1)
80406308:	0105a683          	lw	a3,16(a1)
8040630c:	0045a703          	lw	a4,4(a1)
80406310:	00050413          	mv	s0,a0
80406314:	00f52423          	sw	a5,8(a0)
80406318:	00d52823          	sw	a3,16(a0)
8040631c:	00e52223          	sw	a4,4(a0)
80406320:	00048513          	mv	a0,s1
80406324:	49d070ef          	jal	ra,8040dfc0 <inode_ref_inc>
80406328:	00048513          	mv	a0,s1
8040632c:	4a9070ef          	jal	ra,8040dfd4 <inode_open_inc>
80406330:	00042783          	lw	a5,0(s0)
80406334:	00942a23          	sw	s1,20(s0)
80406338:	05279a63          	bne	a5,s2,8040638c <fd_array_dup+0xbc>
8040633c:	04048863          	beqz	s1,8040638c <fd_array_dup+0xbc>
80406340:	01842783          	lw	a5,24(s0)
80406344:	01342023          	sw	s3,0(s0)
80406348:	01c12083          	lw	ra,28(sp)
8040634c:	00178793          	addi	a5,a5,1
80406350:	00f42c23          	sw	a5,24(s0)
80406354:	01812403          	lw	s0,24(sp)
80406358:	01412483          	lw	s1,20(sp)
8040635c:	01012903          	lw	s2,16(sp)
80406360:	00c12983          	lw	s3,12(sp)
80406364:	02010113          	addi	sp,sp,32
80406368:	00008067          	ret
8040636c:	0000f697          	auipc	a3,0xf
80406370:	a2c68693          	addi	a3,a3,-1492 # 80414d98 <CSWTCH.69+0x40>
80406374:	0000d617          	auipc	a2,0xd
80406378:	46c60613          	addi	a2,a2,1132 # 804137e0 <commands+0x1bc>
8040637c:	07300593          	li	a1,115
80406380:	0000f517          	auipc	a0,0xf
80406384:	d4850513          	addi	a0,a0,-696 # 804150c8 <CSWTCH.69+0x370>
80406388:	a9cfa0ef          	jal	ra,80400624 <__panic>
8040638c:	e71ff0ef          	jal	ra,804061fc <fd_array_open.part.9>

80406390 <file_testfd>:
80406390:	09000793          	li	a5,144
80406394:	06a7e463          	bltu	a5,a0,804063fc <file_testfd+0x6c>
80406398:	00096797          	auipc	a5,0x96
8040639c:	41878793          	addi	a5,a5,1048 # 8049c7b0 <current>
804063a0:	0007a783          	lw	a5,0(a5)
804063a4:	0dc7a703          	lw	a4,220(a5)
804063a8:	04070e63          	beqz	a4,80406404 <file_testfd+0x74>
804063ac:	00872783          	lw	a5,8(a4)
804063b0:	04f05a63          	blez	a5,80406404 <file_testfd+0x74>
804063b4:	00472703          	lw	a4,4(a4)
804063b8:	00351793          	slli	a5,a0,0x3
804063bc:	40a787b3          	sub	a5,a5,a0
804063c0:	00279793          	slli	a5,a5,0x2
804063c4:	00f707b3          	add	a5,a4,a5
804063c8:	0007a683          	lw	a3,0(a5)
804063cc:	00200713          	li	a4,2
804063d0:	02e69663          	bne	a3,a4,804063fc <file_testfd+0x6c>
804063d4:	00c7a703          	lw	a4,12(a5)
804063d8:	02e51263          	bne	a0,a4,804063fc <file_testfd+0x6c>
804063dc:	00058663          	beqz	a1,804063e8 <file_testfd+0x58>
804063e0:	0047a503          	lw	a0,4(a5)
804063e4:	00050e63          	beqz	a0,80406400 <file_testfd+0x70>
804063e8:	00100513          	li	a0,1
804063ec:	00060a63          	beqz	a2,80406400 <file_testfd+0x70>
804063f0:	0087a503          	lw	a0,8(a5)
804063f4:	00a03533          	snez	a0,a0
804063f8:	00008067          	ret
804063fc:	00000513          	li	a0,0
80406400:	00008067          	ret
80406404:	ff010113          	addi	sp,sp,-16
80406408:	00112623          	sw	ra,12(sp)
8040640c:	bbdff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>

80406410 <file_open>:
80406410:	fc010113          	addi	sp,sp,-64
80406414:	02112e23          	sw	ra,60(sp)
80406418:	02812c23          	sw	s0,56(sp)
8040641c:	02912a23          	sw	s1,52(sp)
80406420:	03212823          	sw	s2,48(sp)
80406424:	03312623          	sw	s3,44(sp)
80406428:	03412423          	sw	s4,40(sp)
8040642c:	0035f793          	andi	a5,a1,3
80406430:	00300713          	li	a4,3
80406434:	12e78a63          	beq	a5,a4,80406568 <file_open+0x158>
80406438:	00279793          	slli	a5,a5,0x2
8040643c:	0000f717          	auipc	a4,0xf
80406440:	91c70713          	addi	a4,a4,-1764 # 80414d58 <CSWTCH.69>
80406444:	00050913          	mv	s2,a0
80406448:	0000f697          	auipc	a3,0xf
8040644c:	90468693          	addi	a3,a3,-1788 # 80414d4c <CSWTCH.68>
80406450:	ffff7537          	lui	a0,0xffff7
80406454:	00f686b3          	add	a3,a3,a5
80406458:	00058493          	mv	s1,a1
8040645c:	00f707b3          	add	a5,a4,a5
80406460:	00810593          	addi	a1,sp,8
80406464:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <end+0x7fb5a219>
80406468:	0006aa03          	lw	s4,0(a3)
8040646c:	0007a983          	lw	s3,0(a5)
80406470:	b81ff0ef          	jal	ra,80405ff0 <fd_array_alloc>
80406474:	00050413          	mv	s0,a0
80406478:	02050463          	beqz	a0,804064a0 <file_open+0x90>
8040647c:	00040513          	mv	a0,s0
80406480:	03c12083          	lw	ra,60(sp)
80406484:	03812403          	lw	s0,56(sp)
80406488:	03412483          	lw	s1,52(sp)
8040648c:	03012903          	lw	s2,48(sp)
80406490:	02c12983          	lw	s3,44(sp)
80406494:	02812a03          	lw	s4,40(sp)
80406498:	04010113          	addi	sp,sp,64
8040649c:	00008067          	ret
804064a0:	00c10613          	addi	a2,sp,12
804064a4:	00048593          	mv	a1,s1
804064a8:	00090513          	mv	a0,s2
804064ac:	4d8080ef          	jal	ra,8040e984 <vfs_open>
804064b0:	00050413          	mv	s0,a0
804064b4:	0a051463          	bnez	a0,8040655c <file_open+0x14c>
804064b8:	00812783          	lw	a5,8(sp)
804064bc:	0204f593          	andi	a1,s1,32
804064c0:	00c12403          	lw	s0,12(sp)
804064c4:	0007a823          	sw	zero,16(a5)
804064c8:	04058a63          	beqz	a1,8040651c <file_open+0x10c>
804064cc:	0a040463          	beqz	s0,80406574 <file_open+0x164>
804064d0:	03c42783          	lw	a5,60(s0)
804064d4:	0a078063          	beqz	a5,80406574 <file_open+0x164>
804064d8:	0147a783          	lw	a5,20(a5)
804064dc:	08078c63          	beqz	a5,80406574 <file_open+0x164>
804064e0:	00040513          	mv	a0,s0
804064e4:	0000f597          	auipc	a1,0xf
804064e8:	aa858593          	addi	a1,a1,-1368 # 80414f8c <CSWTCH.69+0x234>
804064ec:	2fd070ef          	jal	ra,8040dfe8 <inode_check>
804064f0:	03c42783          	lw	a5,60(s0)
804064f4:	00c12503          	lw	a0,12(sp)
804064f8:	01010593          	addi	a1,sp,16
804064fc:	0147a783          	lw	a5,20(a5)
80406500:	000780e7          	jalr	a5
80406504:	00050413          	mv	s0,a0
80406508:	04051663          	bnez	a0,80406554 <file_open+0x144>
8040650c:	00812783          	lw	a5,8(sp)
80406510:	01c12703          	lw	a4,28(sp)
80406514:	00c12403          	lw	s0,12(sp)
80406518:	00e7a823          	sw	a4,16(a5)
8040651c:	0007a683          	lw	a3,0(a5)
80406520:	0087aa23          	sw	s0,20(a5)
80406524:	0147a223          	sw	s4,4(a5)
80406528:	0137a423          	sw	s3,8(a5)
8040652c:	00100713          	li	a4,1
80406530:	04e69063          	bne	a3,a4,80406570 <file_open+0x160>
80406534:	02040e63          	beqz	s0,80406570 <file_open+0x160>
80406538:	0187a703          	lw	a4,24(a5)
8040653c:	00200693          	li	a3,2
80406540:	00d7a023          	sw	a3,0(a5)
80406544:	00170713          	addi	a4,a4,1
80406548:	00e7ac23          	sw	a4,24(a5)
8040654c:	00c7a403          	lw	s0,12(a5)
80406550:	f2dff06f          	j	8040647c <file_open+0x6c>
80406554:	00c12503          	lw	a0,12(sp)
80406558:	67c080ef          	jal	ra,8040ebd4 <vfs_close>
8040655c:	00812503          	lw	a0,8(sp)
80406560:	b75ff0ef          	jal	ra,804060d4 <fd_array_free>
80406564:	f19ff06f          	j	8040647c <file_open+0x6c>
80406568:	ffd00413          	li	s0,-3
8040656c:	f11ff06f          	j	8040647c <file_open+0x6c>
80406570:	c8dff0ef          	jal	ra,804061fc <fd_array_open.part.9>
80406574:	0000f697          	auipc	a3,0xf
80406578:	9c868693          	addi	a3,a3,-1592 # 80414f3c <CSWTCH.69+0x1e4>
8040657c:	0000d617          	auipc	a2,0xd
80406580:	26460613          	addi	a2,a2,612 # 804137e0 <commands+0x1bc>
80406584:	0b800593          	li	a1,184
80406588:	0000f517          	auipc	a0,0xf
8040658c:	b4050513          	addi	a0,a0,-1216 # 804150c8 <CSWTCH.69+0x370>
80406590:	894fa0ef          	jal	ra,80400624 <__panic>

80406594 <file_close>:
80406594:	09000793          	li	a5,144
80406598:	06a7ec63          	bltu	a5,a0,80406610 <file_close+0x7c>
8040659c:	00096797          	auipc	a5,0x96
804065a0:	21478793          	addi	a5,a5,532 # 8049c7b0 <current>
804065a4:	0007a783          	lw	a5,0(a5)
804065a8:	ff010113          	addi	sp,sp,-16
804065ac:	00112623          	sw	ra,12(sp)
804065b0:	0dc7a683          	lw	a3,220(a5)
804065b4:	00050713          	mv	a4,a0
804065b8:	06068063          	beqz	a3,80406618 <file_close+0x84>
804065bc:	0086a783          	lw	a5,8(a3)
804065c0:	04f05c63          	blez	a5,80406618 <file_close+0x84>
804065c4:	00351793          	slli	a5,a0,0x3
804065c8:	0046a503          	lw	a0,4(a3)
804065cc:	40e787b3          	sub	a5,a5,a4
804065d0:	00279793          	slli	a5,a5,0x2
804065d4:	00f50533          	add	a0,a0,a5
804065d8:	00052683          	lw	a3,0(a0)
804065dc:	00200793          	li	a5,2
804065e0:	02f69063          	bne	a3,a5,80406600 <file_close+0x6c>
804065e4:	00c52783          	lw	a5,12(a0)
804065e8:	00f71c63          	bne	a4,a5,80406600 <file_close+0x6c>
804065ec:	c5dff0ef          	jal	ra,80406248 <fd_array_close>
804065f0:	00c12083          	lw	ra,12(sp)
804065f4:	00000513          	li	a0,0
804065f8:	01010113          	addi	sp,sp,16
804065fc:	00008067          	ret
80406600:	00c12083          	lw	ra,12(sp)
80406604:	ffd00513          	li	a0,-3
80406608:	01010113          	addi	sp,sp,16
8040660c:	00008067          	ret
80406610:	ffd00513          	li	a0,-3
80406614:	00008067          	ret
80406618:	9b1ff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>

8040661c <file_read>:
8040661c:	fd010113          	addi	sp,sp,-48
80406620:	02112623          	sw	ra,44(sp)
80406624:	02812423          	sw	s0,40(sp)
80406628:	02912223          	sw	s1,36(sp)
8040662c:	03212023          	sw	s2,32(sp)
80406630:	01312e23          	sw	s3,28(sp)
80406634:	01412c23          	sw	s4,24(sp)
80406638:	0006a023          	sw	zero,0(a3)
8040663c:	09000793          	li	a5,144
80406640:	10a7e263          	bltu	a5,a0,80406744 <file_read+0x128>
80406644:	00096797          	auipc	a5,0x96
80406648:	16c78793          	addi	a5,a5,364 # 8049c7b0 <current>
8040664c:	0007a783          	lw	a5,0(a5)
80406650:	00068913          	mv	s2,a3
80406654:	0dc7a703          	lw	a4,220(a5)
80406658:	0e070a63          	beqz	a4,8040674c <file_read+0x130>
8040665c:	00872783          	lw	a5,8(a4)
80406660:	0ef05663          	blez	a5,8040674c <file_read+0x130>
80406664:	00351793          	slli	a5,a0,0x3
80406668:	00472403          	lw	s0,4(a4)
8040666c:	40a787b3          	sub	a5,a5,a0
80406670:	00279793          	slli	a5,a5,0x2
80406674:	00f40433          	add	s0,s0,a5
80406678:	00042983          	lw	s3,0(s0)
8040667c:	00200793          	li	a5,2
80406680:	0cf99263          	bne	s3,a5,80406744 <file_read+0x128>
80406684:	00c42783          	lw	a5,12(s0)
80406688:	0af51e63          	bne	a0,a5,80406744 <file_read+0x128>
8040668c:	00442783          	lw	a5,4(s0)
80406690:	0a078a63          	beqz	a5,80406744 <file_read+0x128>
80406694:	01842783          	lw	a5,24(s0)
80406698:	01042683          	lw	a3,16(s0)
8040669c:	00010513          	mv	a0,sp
804066a0:	00178793          	addi	a5,a5,1
804066a4:	00f42c23          	sw	a5,24(s0)
804066a8:	311000ef          	jal	ra,804071b8 <iobuf_init>
804066ac:	01442483          	lw	s1,20(s0)
804066b0:	00050a13          	mv	s4,a0
804066b4:	08048e63          	beqz	s1,80406750 <file_read+0x134>
804066b8:	03c4a783          	lw	a5,60(s1)
804066bc:	08078a63          	beqz	a5,80406750 <file_read+0x134>
804066c0:	00c7a783          	lw	a5,12(a5)
804066c4:	08078663          	beqz	a5,80406750 <file_read+0x134>
804066c8:	00048513          	mv	a0,s1
804066cc:	0000f597          	auipc	a1,0xf
804066d0:	91858593          	addi	a1,a1,-1768 # 80414fe4 <CSWTCH.69+0x28c>
804066d4:	115070ef          	jal	ra,8040dfe8 <inode_check>
804066d8:	03c4a783          	lw	a5,60(s1)
804066dc:	01442503          	lw	a0,20(s0)
804066e0:	000a0593          	mv	a1,s4
804066e4:	00c7a783          	lw	a5,12(a5)
804066e8:	000780e7          	jalr	a5
804066ec:	008a2783          	lw	a5,8(s4) # 1008 <_binary_bin_swap_img_size-0x6ff8>
804066f0:	00ca2683          	lw	a3,12(s4)
804066f4:	00042703          	lw	a4,0(s0)
804066f8:	00050493          	mv	s1,a0
804066fc:	40d787b3          	sub	a5,a5,a3
80406700:	03370a63          	beq	a4,s3,80406734 <file_read+0x118>
80406704:	00f92023          	sw	a5,0(s2)
80406708:	00040513          	mv	a0,s0
8040670c:	a6dff0ef          	jal	ra,80406178 <fd_array_release>
80406710:	02c12083          	lw	ra,44(sp)
80406714:	02812403          	lw	s0,40(sp)
80406718:	00048513          	mv	a0,s1
8040671c:	02012903          	lw	s2,32(sp)
80406720:	02412483          	lw	s1,36(sp)
80406724:	01c12983          	lw	s3,28(sp)
80406728:	01812a03          	lw	s4,24(sp)
8040672c:	03010113          	addi	sp,sp,48
80406730:	00008067          	ret
80406734:	01042703          	lw	a4,16(s0)
80406738:	00f70733          	add	a4,a4,a5
8040673c:	00e42823          	sw	a4,16(s0)
80406740:	fc5ff06f          	j	80406704 <file_read+0xe8>
80406744:	ffd00493          	li	s1,-3
80406748:	fc9ff06f          	j	80406710 <file_read+0xf4>
8040674c:	87dff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>
80406750:	0000f697          	auipc	a3,0xf
80406754:	84468693          	addi	a3,a3,-1980 # 80414f94 <CSWTCH.69+0x23c>
80406758:	0000d617          	auipc	a2,0xd
8040675c:	08860613          	addi	a2,a2,136 # 804137e0 <commands+0x1bc>
80406760:	0e200593          	li	a1,226
80406764:	0000f517          	auipc	a0,0xf
80406768:	96450513          	addi	a0,a0,-1692 # 804150c8 <CSWTCH.69+0x370>
8040676c:	eb9f90ef          	jal	ra,80400624 <__panic>

80406770 <file_write>:
80406770:	fd010113          	addi	sp,sp,-48
80406774:	02112623          	sw	ra,44(sp)
80406778:	02812423          	sw	s0,40(sp)
8040677c:	02912223          	sw	s1,36(sp)
80406780:	03212023          	sw	s2,32(sp)
80406784:	01312e23          	sw	s3,28(sp)
80406788:	01412c23          	sw	s4,24(sp)
8040678c:	0006a023          	sw	zero,0(a3)
80406790:	09000793          	li	a5,144
80406794:	10a7e263          	bltu	a5,a0,80406898 <file_write+0x128>
80406798:	00096797          	auipc	a5,0x96
8040679c:	01878793          	addi	a5,a5,24 # 8049c7b0 <current>
804067a0:	0007a783          	lw	a5,0(a5)
804067a4:	00068913          	mv	s2,a3
804067a8:	0dc7a703          	lw	a4,220(a5)
804067ac:	0e070a63          	beqz	a4,804068a0 <file_write+0x130>
804067b0:	00872783          	lw	a5,8(a4)
804067b4:	0ef05663          	blez	a5,804068a0 <file_write+0x130>
804067b8:	00351793          	slli	a5,a0,0x3
804067bc:	00472403          	lw	s0,4(a4)
804067c0:	40a787b3          	sub	a5,a5,a0
804067c4:	00279793          	slli	a5,a5,0x2
804067c8:	00f40433          	add	s0,s0,a5
804067cc:	00042983          	lw	s3,0(s0)
804067d0:	00200793          	li	a5,2
804067d4:	0cf99263          	bne	s3,a5,80406898 <file_write+0x128>
804067d8:	00c42783          	lw	a5,12(s0)
804067dc:	0af51e63          	bne	a0,a5,80406898 <file_write+0x128>
804067e0:	00842783          	lw	a5,8(s0)
804067e4:	0a078a63          	beqz	a5,80406898 <file_write+0x128>
804067e8:	01842783          	lw	a5,24(s0)
804067ec:	01042683          	lw	a3,16(s0)
804067f0:	00010513          	mv	a0,sp
804067f4:	00178793          	addi	a5,a5,1
804067f8:	00f42c23          	sw	a5,24(s0)
804067fc:	1bd000ef          	jal	ra,804071b8 <iobuf_init>
80406800:	01442483          	lw	s1,20(s0)
80406804:	00050a13          	mv	s4,a0
80406808:	08048e63          	beqz	s1,804068a4 <file_write+0x134>
8040680c:	03c4a783          	lw	a5,60(s1)
80406810:	08078a63          	beqz	a5,804068a4 <file_write+0x134>
80406814:	0107a783          	lw	a5,16(a5)
80406818:	08078663          	beqz	a5,804068a4 <file_write+0x134>
8040681c:	00048513          	mv	a0,s1
80406820:	0000f597          	auipc	a1,0xf
80406824:	87458593          	addi	a1,a1,-1932 # 80415094 <CSWTCH.69+0x33c>
80406828:	7c0070ef          	jal	ra,8040dfe8 <inode_check>
8040682c:	03c4a783          	lw	a5,60(s1)
80406830:	01442503          	lw	a0,20(s0)
80406834:	000a0593          	mv	a1,s4
80406838:	0107a783          	lw	a5,16(a5)
8040683c:	000780e7          	jalr	a5
80406840:	008a2783          	lw	a5,8(s4)
80406844:	00ca2683          	lw	a3,12(s4)
80406848:	00042703          	lw	a4,0(s0)
8040684c:	00050493          	mv	s1,a0
80406850:	40d787b3          	sub	a5,a5,a3
80406854:	03370a63          	beq	a4,s3,80406888 <file_write+0x118>
80406858:	00f92023          	sw	a5,0(s2)
8040685c:	00040513          	mv	a0,s0
80406860:	919ff0ef          	jal	ra,80406178 <fd_array_release>
80406864:	02c12083          	lw	ra,44(sp)
80406868:	02812403          	lw	s0,40(sp)
8040686c:	00048513          	mv	a0,s1
80406870:	02012903          	lw	s2,32(sp)
80406874:	02412483          	lw	s1,36(sp)
80406878:	01c12983          	lw	s3,28(sp)
8040687c:	01812a03          	lw	s4,24(sp)
80406880:	03010113          	addi	sp,sp,48
80406884:	00008067          	ret
80406888:	01042703          	lw	a4,16(s0)
8040688c:	00f70733          	add	a4,a4,a5
80406890:	00e42823          	sw	a4,16(s0)
80406894:	fc5ff06f          	j	80406858 <file_write+0xe8>
80406898:	ffd00493          	li	s1,-3
8040689c:	fc9ff06f          	j	80406864 <file_write+0xf4>
804068a0:	f28ff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>
804068a4:	0000e697          	auipc	a3,0xe
804068a8:	7a068693          	addi	a3,a3,1952 # 80415044 <CSWTCH.69+0x2ec>
804068ac:	0000d617          	auipc	a2,0xd
804068b0:	f3460613          	addi	a2,a2,-204 # 804137e0 <commands+0x1bc>
804068b4:	0fc00593          	li	a1,252
804068b8:	0000f517          	auipc	a0,0xf
804068bc:	81050513          	addi	a0,a0,-2032 # 804150c8 <CSWTCH.69+0x370>
804068c0:	d65f90ef          	jal	ra,80400624 <__panic>

804068c4 <file_seek>:
804068c4:	fe010113          	addi	sp,sp,-32
804068c8:	00112e23          	sw	ra,28(sp)
804068cc:	00812c23          	sw	s0,24(sp)
804068d0:	00912a23          	sw	s1,20(sp)
804068d4:	01212823          	sw	s2,16(sp)
804068d8:	09000793          	li	a5,144
804068dc:	12a7ea63          	bltu	a5,a0,80406a10 <file_seek+0x14c>
804068e0:	00096797          	auipc	a5,0x96
804068e4:	ed078793          	addi	a5,a5,-304 # 8049c7b0 <current>
804068e8:	0007a783          	lw	a5,0(a5)
804068ec:	0dc7a703          	lw	a4,220(a5)
804068f0:	14070063          	beqz	a4,80406a30 <file_seek+0x16c>
804068f4:	00872783          	lw	a5,8(a4)
804068f8:	12f05c63          	blez	a5,80406a30 <file_seek+0x16c>
804068fc:	00472403          	lw	s0,4(a4)
80406900:	00351793          	slli	a5,a0,0x3
80406904:	40a787b3          	sub	a5,a5,a0
80406908:	00279793          	slli	a5,a5,0x2
8040690c:	00f40433          	add	s0,s0,a5
80406910:	00042703          	lw	a4,0(s0)
80406914:	00200793          	li	a5,2
80406918:	0ef71c63          	bne	a4,a5,80406a10 <file_seek+0x14c>
8040691c:	00c42783          	lw	a5,12(s0)
80406920:	0ef51863          	bne	a0,a5,80406a10 <file_seek+0x14c>
80406924:	01842783          	lw	a5,24(s0)
80406928:	00100693          	li	a3,1
8040692c:	00058913          	mv	s2,a1
80406930:	00178793          	addi	a5,a5,1
80406934:	00f42c23          	sw	a5,24(s0)
80406938:	0cd60663          	beq	a2,a3,80406a04 <file_seek+0x140>
8040693c:	02e60863          	beq	a2,a4,8040696c <file_seek+0xa8>
80406940:	ffd00493          	li	s1,-3
80406944:	06060a63          	beqz	a2,804069b8 <file_seek+0xf4>
80406948:	00040513          	mv	a0,s0
8040694c:	82dff0ef          	jal	ra,80406178 <fd_array_release>
80406950:	01c12083          	lw	ra,28(sp)
80406954:	01812403          	lw	s0,24(sp)
80406958:	00048513          	mv	a0,s1
8040695c:	01012903          	lw	s2,16(sp)
80406960:	01412483          	lw	s1,20(sp)
80406964:	02010113          	addi	sp,sp,32
80406968:	00008067          	ret
8040696c:	01442483          	lw	s1,20(s0)
80406970:	0e048263          	beqz	s1,80406a54 <file_seek+0x190>
80406974:	03c4a783          	lw	a5,60(s1)
80406978:	0c078e63          	beqz	a5,80406a54 <file_seek+0x190>
8040697c:	0147a783          	lw	a5,20(a5)
80406980:	0c078a63          	beqz	a5,80406a54 <file_seek+0x190>
80406984:	00048513          	mv	a0,s1
80406988:	0000e597          	auipc	a1,0xe
8040698c:	60458593          	addi	a1,a1,1540 # 80414f8c <CSWTCH.69+0x234>
80406990:	658070ef          	jal	ra,8040dfe8 <inode_check>
80406994:	03c4a783          	lw	a5,60(s1)
80406998:	01442503          	lw	a0,20(s0)
8040699c:	00010593          	mv	a1,sp
804069a0:	0147a783          	lw	a5,20(a5)
804069a4:	000780e7          	jalr	a5
804069a8:	00050493          	mv	s1,a0
804069ac:	f8051ee3          	bnez	a0,80406948 <file_seek+0x84>
804069b0:	00c12783          	lw	a5,12(sp)
804069b4:	00f90933          	add	s2,s2,a5
804069b8:	01442483          	lw	s1,20(s0)
804069bc:	06048c63          	beqz	s1,80406a34 <file_seek+0x170>
804069c0:	03c4a783          	lw	a5,60(s1)
804069c4:	06078863          	beqz	a5,80406a34 <file_seek+0x170>
804069c8:	02c7a783          	lw	a5,44(a5)
804069cc:	06078463          	beqz	a5,80406a34 <file_seek+0x170>
804069d0:	00048513          	mv	a0,s1
804069d4:	0000e597          	auipc	a1,0xe
804069d8:	66858593          	addi	a1,a1,1640 # 8041503c <CSWTCH.69+0x2e4>
804069dc:	60c070ef          	jal	ra,8040dfe8 <inode_check>
804069e0:	03c4a783          	lw	a5,60(s1)
804069e4:	01442503          	lw	a0,20(s0)
804069e8:	00090593          	mv	a1,s2
804069ec:	02c7a783          	lw	a5,44(a5)
804069f0:	000780e7          	jalr	a5
804069f4:	00050493          	mv	s1,a0
804069f8:	f40518e3          	bnez	a0,80406948 <file_seek+0x84>
804069fc:	01242823          	sw	s2,16(s0)
80406a00:	f49ff06f          	j	80406948 <file_seek+0x84>
80406a04:	01042783          	lw	a5,16(s0)
80406a08:	00f58933          	add	s2,a1,a5
80406a0c:	fadff06f          	j	804069b8 <file_seek+0xf4>
80406a10:	01c12083          	lw	ra,28(sp)
80406a14:	01812403          	lw	s0,24(sp)
80406a18:	ffd00493          	li	s1,-3
80406a1c:	00048513          	mv	a0,s1
80406a20:	01012903          	lw	s2,16(sp)
80406a24:	01412483          	lw	s1,20(sp)
80406a28:	02010113          	addi	sp,sp,32
80406a2c:	00008067          	ret
80406a30:	d98ff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>
80406a34:	0000e697          	auipc	a3,0xe
80406a38:	5b868693          	addi	a3,a3,1464 # 80414fec <CSWTCH.69+0x294>
80406a3c:	0000d617          	auipc	a2,0xd
80406a40:	da460613          	addi	a2,a2,-604 # 804137e0 <commands+0x1bc>
80406a44:	11e00593          	li	a1,286
80406a48:	0000e517          	auipc	a0,0xe
80406a4c:	68050513          	addi	a0,a0,1664 # 804150c8 <CSWTCH.69+0x370>
80406a50:	bd5f90ef          	jal	ra,80400624 <__panic>
80406a54:	0000e697          	auipc	a3,0xe
80406a58:	4e868693          	addi	a3,a3,1256 # 80414f3c <CSWTCH.69+0x1e4>
80406a5c:	0000d617          	auipc	a2,0xd
80406a60:	d8460613          	addi	a2,a2,-636 # 804137e0 <commands+0x1bc>
80406a64:	11600593          	li	a1,278
80406a68:	0000e517          	auipc	a0,0xe
80406a6c:	66050513          	addi	a0,a0,1632 # 804150c8 <CSWTCH.69+0x370>
80406a70:	bb5f90ef          	jal	ra,80400624 <__panic>

80406a74 <file_fstat>:
80406a74:	ff010113          	addi	sp,sp,-16
80406a78:	00112623          	sw	ra,12(sp)
80406a7c:	00812423          	sw	s0,8(sp)
80406a80:	00912223          	sw	s1,4(sp)
80406a84:	01212023          	sw	s2,0(sp)
80406a88:	09000793          	li	a5,144
80406a8c:	0aa7ee63          	bltu	a5,a0,80406b48 <file_fstat+0xd4>
80406a90:	00096797          	auipc	a5,0x96
80406a94:	d2078793          	addi	a5,a5,-736 # 8049c7b0 <current>
80406a98:	0007a783          	lw	a5,0(a5)
80406a9c:	00058913          	mv	s2,a1
80406aa0:	0dc7a703          	lw	a4,220(a5)
80406aa4:	0c070263          	beqz	a4,80406b68 <file_fstat+0xf4>
80406aa8:	00872783          	lw	a5,8(a4)
80406aac:	0af05e63          	blez	a5,80406b68 <file_fstat+0xf4>
80406ab0:	00472403          	lw	s0,4(a4)
80406ab4:	00351793          	slli	a5,a0,0x3
80406ab8:	40a787b3          	sub	a5,a5,a0
80406abc:	00279793          	slli	a5,a5,0x2
80406ac0:	00f40433          	add	s0,s0,a5
80406ac4:	00042703          	lw	a4,0(s0)
80406ac8:	00200793          	li	a5,2
80406acc:	06f71e63          	bne	a4,a5,80406b48 <file_fstat+0xd4>
80406ad0:	00c42783          	lw	a5,12(s0)
80406ad4:	06f51a63          	bne	a0,a5,80406b48 <file_fstat+0xd4>
80406ad8:	01842783          	lw	a5,24(s0)
80406adc:	01442483          	lw	s1,20(s0)
80406ae0:	00178793          	addi	a5,a5,1
80406ae4:	00f42c23          	sw	a5,24(s0)
80406ae8:	08048263          	beqz	s1,80406b6c <file_fstat+0xf8>
80406aec:	03c4a783          	lw	a5,60(s1)
80406af0:	06078e63          	beqz	a5,80406b6c <file_fstat+0xf8>
80406af4:	0147a783          	lw	a5,20(a5)
80406af8:	06078a63          	beqz	a5,80406b6c <file_fstat+0xf8>
80406afc:	00048513          	mv	a0,s1
80406b00:	0000e597          	auipc	a1,0xe
80406b04:	48c58593          	addi	a1,a1,1164 # 80414f8c <CSWTCH.69+0x234>
80406b08:	4e0070ef          	jal	ra,8040dfe8 <inode_check>
80406b0c:	03c4a783          	lw	a5,60(s1)
80406b10:	01442503          	lw	a0,20(s0)
80406b14:	00090593          	mv	a1,s2
80406b18:	0147a783          	lw	a5,20(a5)
80406b1c:	000780e7          	jalr	a5
80406b20:	00050493          	mv	s1,a0
80406b24:	00040513          	mv	a0,s0
80406b28:	e50ff0ef          	jal	ra,80406178 <fd_array_release>
80406b2c:	00c12083          	lw	ra,12(sp)
80406b30:	00812403          	lw	s0,8(sp)
80406b34:	00048513          	mv	a0,s1
80406b38:	00012903          	lw	s2,0(sp)
80406b3c:	00412483          	lw	s1,4(sp)
80406b40:	01010113          	addi	sp,sp,16
80406b44:	00008067          	ret
80406b48:	00c12083          	lw	ra,12(sp)
80406b4c:	00812403          	lw	s0,8(sp)
80406b50:	ffd00493          	li	s1,-3
80406b54:	00048513          	mv	a0,s1
80406b58:	00012903          	lw	s2,0(sp)
80406b5c:	00412483          	lw	s1,4(sp)
80406b60:	01010113          	addi	sp,sp,16
80406b64:	00008067          	ret
80406b68:	c60ff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>
80406b6c:	0000e697          	auipc	a3,0xe
80406b70:	3d068693          	addi	a3,a3,976 # 80414f3c <CSWTCH.69+0x1e4>
80406b74:	0000d617          	auipc	a2,0xd
80406b78:	c6c60613          	addi	a2,a2,-916 # 804137e0 <commands+0x1bc>
80406b7c:	13000593          	li	a1,304
80406b80:	0000e517          	auipc	a0,0xe
80406b84:	54850513          	addi	a0,a0,1352 # 804150c8 <CSWTCH.69+0x370>
80406b88:	a9df90ef          	jal	ra,80400624 <__panic>

80406b8c <file_fsync>:
80406b8c:	ff010113          	addi	sp,sp,-16
80406b90:	00112623          	sw	ra,12(sp)
80406b94:	00812423          	sw	s0,8(sp)
80406b98:	00912223          	sw	s1,4(sp)
80406b9c:	09000793          	li	a5,144
80406ba0:	0aa7e863          	bltu	a5,a0,80406c50 <file_fsync+0xc4>
80406ba4:	00096797          	auipc	a5,0x96
80406ba8:	c0c78793          	addi	a5,a5,-1012 # 8049c7b0 <current>
80406bac:	0007a783          	lw	a5,0(a5)
80406bb0:	0dc7a703          	lw	a4,220(a5)
80406bb4:	0a070c63          	beqz	a4,80406c6c <file_fsync+0xe0>
80406bb8:	00872783          	lw	a5,8(a4)
80406bbc:	0af05863          	blez	a5,80406c6c <file_fsync+0xe0>
80406bc0:	00472403          	lw	s0,4(a4)
80406bc4:	00351793          	slli	a5,a0,0x3
80406bc8:	40a787b3          	sub	a5,a5,a0
80406bcc:	00279793          	slli	a5,a5,0x2
80406bd0:	00f40433          	add	s0,s0,a5
80406bd4:	00042703          	lw	a4,0(s0)
80406bd8:	00200793          	li	a5,2
80406bdc:	06f71a63          	bne	a4,a5,80406c50 <file_fsync+0xc4>
80406be0:	00c42783          	lw	a5,12(s0)
80406be4:	06f51663          	bne	a0,a5,80406c50 <file_fsync+0xc4>
80406be8:	01842783          	lw	a5,24(s0)
80406bec:	01442483          	lw	s1,20(s0)
80406bf0:	00178793          	addi	a5,a5,1
80406bf4:	00f42c23          	sw	a5,24(s0)
80406bf8:	06048c63          	beqz	s1,80406c70 <file_fsync+0xe4>
80406bfc:	03c4a783          	lw	a5,60(s1)
80406c00:	06078863          	beqz	a5,80406c70 <file_fsync+0xe4>
80406c04:	0187a783          	lw	a5,24(a5)
80406c08:	06078463          	beqz	a5,80406c70 <file_fsync+0xe4>
80406c0c:	0000e597          	auipc	a1,0xe
80406c10:	2c858593          	addi	a1,a1,712 # 80414ed4 <CSWTCH.69+0x17c>
80406c14:	00048513          	mv	a0,s1
80406c18:	3d0070ef          	jal	ra,8040dfe8 <inode_check>
80406c1c:	03c4a783          	lw	a5,60(s1)
80406c20:	01442503          	lw	a0,20(s0)
80406c24:	0187a783          	lw	a5,24(a5)
80406c28:	000780e7          	jalr	a5
80406c2c:	00050493          	mv	s1,a0
80406c30:	00040513          	mv	a0,s0
80406c34:	d44ff0ef          	jal	ra,80406178 <fd_array_release>
80406c38:	00c12083          	lw	ra,12(sp)
80406c3c:	00812403          	lw	s0,8(sp)
80406c40:	00048513          	mv	a0,s1
80406c44:	00412483          	lw	s1,4(sp)
80406c48:	01010113          	addi	sp,sp,16
80406c4c:	00008067          	ret
80406c50:	00c12083          	lw	ra,12(sp)
80406c54:	00812403          	lw	s0,8(sp)
80406c58:	ffd00493          	li	s1,-3
80406c5c:	00048513          	mv	a0,s1
80406c60:	00412483          	lw	s1,4(sp)
80406c64:	01010113          	addi	sp,sp,16
80406c68:	00008067          	ret
80406c6c:	b5cff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>
80406c70:	0000e697          	auipc	a3,0xe
80406c74:	21468693          	addi	a3,a3,532 # 80414e84 <CSWTCH.69+0x12c>
80406c78:	0000d617          	auipc	a2,0xd
80406c7c:	b6860613          	addi	a2,a2,-1176 # 804137e0 <commands+0x1bc>
80406c80:	13e00593          	li	a1,318
80406c84:	0000e517          	auipc	a0,0xe
80406c88:	44450513          	addi	a0,a0,1092 # 804150c8 <CSWTCH.69+0x370>
80406c8c:	999f90ef          	jal	ra,80400624 <__panic>

80406c90 <file_getdirentry>:
80406c90:	fd010113          	addi	sp,sp,-48
80406c94:	02112623          	sw	ra,44(sp)
80406c98:	02812423          	sw	s0,40(sp)
80406c9c:	02912223          	sw	s1,36(sp)
80406ca0:	03212023          	sw	s2,32(sp)
80406ca4:	01312e23          	sw	s3,28(sp)
80406ca8:	09000793          	li	a5,144
80406cac:	0ea7ec63          	bltu	a5,a0,80406da4 <file_getdirentry+0x114>
80406cb0:	00096797          	auipc	a5,0x96
80406cb4:	b0078793          	addi	a5,a5,-1280 # 8049c7b0 <current>
80406cb8:	0007a783          	lw	a5,0(a5)
80406cbc:	00058493          	mv	s1,a1
80406cc0:	0dc7a703          	lw	a4,220(a5)
80406cc4:	10070263          	beqz	a4,80406dc8 <file_getdirentry+0x138>
80406cc8:	00872783          	lw	a5,8(a4)
80406ccc:	0ef05e63          	blez	a5,80406dc8 <file_getdirentry+0x138>
80406cd0:	00472403          	lw	s0,4(a4)
80406cd4:	00351793          	slli	a5,a0,0x3
80406cd8:	40a787b3          	sub	a5,a5,a0
80406cdc:	00279793          	slli	a5,a5,0x2
80406ce0:	00f40433          	add	s0,s0,a5
80406ce4:	00042703          	lw	a4,0(s0)
80406ce8:	00200793          	li	a5,2
80406cec:	0af71c63          	bne	a4,a5,80406da4 <file_getdirentry+0x114>
80406cf0:	00c42783          	lw	a5,12(s0)
80406cf4:	0af51863          	bne	a0,a5,80406da4 <file_getdirentry+0x114>
80406cf8:	01842783          	lw	a5,24(s0)
80406cfc:	10000613          	li	a2,256
80406d00:	00458593          	addi	a1,a1,4
80406d04:	00178793          	addi	a5,a5,1
80406d08:	00f42c23          	sw	a5,24(s0)
80406d0c:	0004a683          	lw	a3,0(s1)
80406d10:	00010513          	mv	a0,sp
80406d14:	4a4000ef          	jal	ra,804071b8 <iobuf_init>
80406d18:	01442903          	lw	s2,20(s0)
80406d1c:	00050993          	mv	s3,a0
80406d20:	0a090663          	beqz	s2,80406dcc <file_getdirentry+0x13c>
80406d24:	03c92783          	lw	a5,60(s2)
80406d28:	0a078263          	beqz	a5,80406dcc <file_getdirentry+0x13c>
80406d2c:	0207a783          	lw	a5,32(a5)
80406d30:	08078e63          	beqz	a5,80406dcc <file_getdirentry+0x13c>
80406d34:	00090513          	mv	a0,s2
80406d38:	0000e597          	auipc	a1,0xe
80406d3c:	1f858593          	addi	a1,a1,504 # 80414f30 <CSWTCH.69+0x1d8>
80406d40:	2a8070ef          	jal	ra,8040dfe8 <inode_check>
80406d44:	03c92783          	lw	a5,60(s2)
80406d48:	01442503          	lw	a0,20(s0)
80406d4c:	00098593          	mv	a1,s3
80406d50:	0207a783          	lw	a5,32(a5)
80406d54:	000780e7          	jalr	a5
80406d58:	00050913          	mv	s2,a0
80406d5c:	02050663          	beqz	a0,80406d88 <file_getdirentry+0xf8>
80406d60:	00040513          	mv	a0,s0
80406d64:	c14ff0ef          	jal	ra,80406178 <fd_array_release>
80406d68:	02c12083          	lw	ra,44(sp)
80406d6c:	02812403          	lw	s0,40(sp)
80406d70:	00090513          	mv	a0,s2
80406d74:	02412483          	lw	s1,36(sp)
80406d78:	02012903          	lw	s2,32(sp)
80406d7c:	01c12983          	lw	s3,28(sp)
80406d80:	03010113          	addi	sp,sp,48
80406d84:	00008067          	ret
80406d88:	0004a783          	lw	a5,0(s1)
80406d8c:	0089a683          	lw	a3,8(s3) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80406d90:	00c9a703          	lw	a4,12(s3)
80406d94:	00d787b3          	add	a5,a5,a3
80406d98:	40e787b3          	sub	a5,a5,a4
80406d9c:	00f4a023          	sw	a5,0(s1)
80406da0:	fc1ff06f          	j	80406d60 <file_getdirentry+0xd0>
80406da4:	02c12083          	lw	ra,44(sp)
80406da8:	02812403          	lw	s0,40(sp)
80406dac:	ffd00913          	li	s2,-3
80406db0:	00090513          	mv	a0,s2
80406db4:	02412483          	lw	s1,36(sp)
80406db8:	02012903          	lw	s2,32(sp)
80406dbc:	01c12983          	lw	s3,28(sp)
80406dc0:	03010113          	addi	sp,sp,48
80406dc4:	00008067          	ret
80406dc8:	a00ff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>
80406dcc:	0000e697          	auipc	a3,0xe
80406dd0:	11068693          	addi	a3,a3,272 # 80414edc <CSWTCH.69+0x184>
80406dd4:	0000d617          	auipc	a2,0xd
80406dd8:	a0c60613          	addi	a2,a2,-1524 # 804137e0 <commands+0x1bc>
80406ddc:	14e00593          	li	a1,334
80406de0:	0000e517          	auipc	a0,0xe
80406de4:	2e850513          	addi	a0,a0,744 # 804150c8 <CSWTCH.69+0x370>
80406de8:	83df90ef          	jal	ra,80400624 <__panic>

80406dec <file_dup>:
80406dec:	09000793          	li	a5,144
80406df0:	0aa7e863          	bltu	a5,a0,80406ea0 <file_dup+0xb4>
80406df4:	00096797          	auipc	a5,0x96
80406df8:	9bc78793          	addi	a5,a5,-1604 # 8049c7b0 <current>
80406dfc:	0007a783          	lw	a5,0(a5)
80406e00:	fe010113          	addi	sp,sp,-32
80406e04:	00112e23          	sw	ra,28(sp)
80406e08:	0dc7a683          	lw	a3,220(a5)
80406e0c:	00812c23          	sw	s0,24(sp)
80406e10:	00050713          	mv	a4,a0
80406e14:	00058513          	mv	a0,a1
80406e18:	08068863          	beqz	a3,80406ea8 <file_dup+0xbc>
80406e1c:	0086a783          	lw	a5,8(a3)
80406e20:	08f05463          	blez	a5,80406ea8 <file_dup+0xbc>
80406e24:	0046a403          	lw	s0,4(a3)
80406e28:	00371793          	slli	a5,a4,0x3
80406e2c:	40e787b3          	sub	a5,a5,a4
80406e30:	00279793          	slli	a5,a5,0x2
80406e34:	00f40433          	add	s0,s0,a5
80406e38:	00042683          	lw	a3,0(s0)
80406e3c:	00200793          	li	a5,2
80406e40:	04f69663          	bne	a3,a5,80406e8c <file_dup+0xa0>
80406e44:	00c42783          	lw	a5,12(s0)
80406e48:	04f71263          	bne	a4,a5,80406e8c <file_dup+0xa0>
80406e4c:	00c10593          	addi	a1,sp,12
80406e50:	9a0ff0ef          	jal	ra,80405ff0 <fd_array_alloc>
80406e54:	00050a63          	beqz	a0,80406e68 <file_dup+0x7c>
80406e58:	01c12083          	lw	ra,28(sp)
80406e5c:	01812403          	lw	s0,24(sp)
80406e60:	02010113          	addi	sp,sp,32
80406e64:	00008067          	ret
80406e68:	00c12503          	lw	a0,12(sp)
80406e6c:	00040593          	mv	a1,s0
80406e70:	c60ff0ef          	jal	ra,804062d0 <fd_array_dup>
80406e74:	00c12783          	lw	a5,12(sp)
80406e78:	01c12083          	lw	ra,28(sp)
80406e7c:	01812403          	lw	s0,24(sp)
80406e80:	00c7a503          	lw	a0,12(a5)
80406e84:	02010113          	addi	sp,sp,32
80406e88:	00008067          	ret
80406e8c:	01c12083          	lw	ra,28(sp)
80406e90:	01812403          	lw	s0,24(sp)
80406e94:	ffd00513          	li	a0,-3
80406e98:	02010113          	addi	sp,sp,32
80406e9c:	00008067          	ret
80406ea0:	ffd00513          	li	a0,-3
80406ea4:	00008067          	ret
80406ea8:	920ff0ef          	jal	ra,80405fc8 <get_fd_array.part.4>

80406eac <fs_init>:
80406eac:	ff010113          	addi	sp,sp,-16
80406eb0:	00112623          	sw	ra,12(sp)
80406eb4:	3f0070ef          	jal	ra,8040e2a4 <vfs_init>
80406eb8:	68c080ef          	jal	ra,8040f544 <dev_init>
80406ebc:	00c12083          	lw	ra,12(sp)
80406ec0:	01010113          	addi	sp,sp,16
80406ec4:	2ec0906f          	j	804101b0 <sfs_init>

80406ec8 <fs_cleanup>:
80406ec8:	7ac0706f          	j	8040e674 <vfs_cleanup>

80406ecc <lock_files>:
80406ecc:	00c50513          	addi	a0,a0,12
80406ed0:	e95fe06f          	j	80405d64 <down>

80406ed4 <unlock_files>:
80406ed4:	00c50513          	addi	a0,a0,12
80406ed8:	e89fe06f          	j	80405d60 <up>

80406edc <files_create>:
80406edc:	ff010113          	addi	sp,sp,-16
80406ee0:	00001537          	lui	a0,0x1
80406ee4:	00812423          	sw	s0,8(sp)
80406ee8:	00112623          	sw	ra,12(sp)
80406eec:	915fb0ef          	jal	ra,80402800 <kmalloc>
80406ef0:	00050413          	mv	s0,a0
80406ef4:	02050463          	beqz	a0,80406f1c <files_create+0x40>
80406ef8:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6fe8>
80406efc:	00042023          	sw	zero,0(s0)
80406f00:	00c50513          	addi	a0,a0,12
80406f04:	00f42223          	sw	a5,4(s0)
80406f08:	00042423          	sw	zero,8(s0)
80406f0c:	00100593          	li	a1,1
80406f10:	e45fe0ef          	jal	ra,80405d54 <sem_init>
80406f14:	00442503          	lw	a0,4(s0)
80406f18:	b0cff0ef          	jal	ra,80406224 <fd_array_init>
80406f1c:	00040513          	mv	a0,s0
80406f20:	00c12083          	lw	ra,12(sp)
80406f24:	00812403          	lw	s0,8(sp)
80406f28:	01010113          	addi	sp,sp,16
80406f2c:	00008067          	ret

80406f30 <files_destroy>:
80406f30:	fe010113          	addi	sp,sp,-32
80406f34:	00112e23          	sw	ra,28(sp)
80406f38:	00812c23          	sw	s0,24(sp)
80406f3c:	00912a23          	sw	s1,20(sp)
80406f40:	01212823          	sw	s2,16(sp)
80406f44:	01312623          	sw	s3,12(sp)
80406f48:	08050a63          	beqz	a0,80406fdc <files_destroy+0xac>
80406f4c:	00852783          	lw	a5,8(a0)
80406f50:	00050993          	mv	s3,a0
80406f54:	08079463          	bnez	a5,80406fdc <files_destroy+0xac>
80406f58:	00052503          	lw	a0,0(a0)
80406f5c:	00050463          	beqz	a0,80406f64 <files_destroy+0x34>
80406f60:	154070ef          	jal	ra,8040e0b4 <inode_ref_dec>
80406f64:	0049a403          	lw	s0,4(s3)
80406f68:	000014b7          	lui	s1,0x1
80406f6c:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406f70:	009404b3          	add	s1,s0,s1
80406f74:	00200913          	li	s2,2
80406f78:	00042783          	lw	a5,0(s0)
80406f7c:	03278863          	beq	a5,s2,80406fac <files_destroy+0x7c>
80406f80:	02079e63          	bnez	a5,80406fbc <files_destroy+0x8c>
80406f84:	01c40413          	addi	s0,s0,28
80406f88:	fe8498e3          	bne	s1,s0,80406f78 <files_destroy+0x48>
80406f8c:	01812403          	lw	s0,24(sp)
80406f90:	01c12083          	lw	ra,28(sp)
80406f94:	01412483          	lw	s1,20(sp)
80406f98:	01012903          	lw	s2,16(sp)
80406f9c:	00098513          	mv	a0,s3
80406fa0:	00c12983          	lw	s3,12(sp)
80406fa4:	02010113          	addi	sp,sp,32
80406fa8:	97dfb06f          	j	80402924 <kfree>
80406fac:	00040513          	mv	a0,s0
80406fb0:	a98ff0ef          	jal	ra,80406248 <fd_array_close>
80406fb4:	00042783          	lw	a5,0(s0)
80406fb8:	fc9ff06f          	j	80406f80 <files_destroy+0x50>
80406fbc:	0000e697          	auipc	a3,0xe
80406fc0:	18868693          	addi	a3,a3,392 # 80415144 <CSWTCH.69+0x3ec>
80406fc4:	0000d617          	auipc	a2,0xd
80406fc8:	81c60613          	addi	a2,a2,-2020 # 804137e0 <commands+0x1bc>
80406fcc:	03d00593          	li	a1,61
80406fd0:	0000e517          	auipc	a0,0xe
80406fd4:	16450513          	addi	a0,a0,356 # 80415134 <CSWTCH.69+0x3dc>
80406fd8:	e4cf90ef          	jal	ra,80400624 <__panic>
80406fdc:	0000e697          	auipc	a3,0xe
80406fe0:	12c68693          	addi	a3,a3,300 # 80415108 <CSWTCH.69+0x3b0>
80406fe4:	0000c617          	auipc	a2,0xc
80406fe8:	7fc60613          	addi	a2,a2,2044 # 804137e0 <commands+0x1bc>
80406fec:	03300593          	li	a1,51
80406ff0:	0000e517          	auipc	a0,0xe
80406ff4:	14450513          	addi	a0,a0,324 # 80415134 <CSWTCH.69+0x3dc>
80406ff8:	e2cf90ef          	jal	ra,80400624 <__panic>

80406ffc <files_closeall>:
80406ffc:	ff010113          	addi	sp,sp,-16
80407000:	00112623          	sw	ra,12(sp)
80407004:	00812423          	sw	s0,8(sp)
80407008:	00912223          	sw	s1,4(sp)
8040700c:	01212023          	sw	s2,0(sp)
80407010:	06050063          	beqz	a0,80407070 <files_closeall+0x74>
80407014:	00852783          	lw	a5,8(a0)
80407018:	04f05c63          	blez	a5,80407070 <files_closeall+0x74>
8040701c:	00452483          	lw	s1,4(a0)
80407020:	000017b7          	lui	a5,0x1
80407024:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80407028:	03848413          	addi	s0,s1,56
8040702c:	00200913          	li	s2,2
80407030:	00f484b3          	add	s1,s1,a5
80407034:	00c0006f          	j	80407040 <files_closeall+0x44>
80407038:	01c40413          	addi	s0,s0,28
8040703c:	00848e63          	beq	s1,s0,80407058 <files_closeall+0x5c>
80407040:	00042783          	lw	a5,0(s0)
80407044:	ff279ae3          	bne	a5,s2,80407038 <files_closeall+0x3c>
80407048:	00040513          	mv	a0,s0
8040704c:	01c40413          	addi	s0,s0,28
80407050:	9f8ff0ef          	jal	ra,80406248 <fd_array_close>
80407054:	fe8496e3          	bne	s1,s0,80407040 <files_closeall+0x44>
80407058:	00c12083          	lw	ra,12(sp)
8040705c:	00812403          	lw	s0,8(sp)
80407060:	00412483          	lw	s1,4(sp)
80407064:	00012903          	lw	s2,0(sp)
80407068:	01010113          	addi	sp,sp,16
8040706c:	00008067          	ret
80407070:	0000e697          	auipc	a3,0xe
80407074:	02c68693          	addi	a3,a3,44 # 8041509c <CSWTCH.69+0x344>
80407078:	0000c617          	auipc	a2,0xc
8040707c:	76860613          	addi	a2,a2,1896 # 804137e0 <commands+0x1bc>
80407080:	04500593          	li	a1,69
80407084:	0000e517          	auipc	a0,0xe
80407088:	0b050513          	addi	a0,a0,176 # 80415134 <CSWTCH.69+0x3dc>
8040708c:	d98f90ef          	jal	ra,80400624 <__panic>

80407090 <dup_files>:
80407090:	fe010113          	addi	sp,sp,-32
80407094:	00112e23          	sw	ra,28(sp)
80407098:	00812c23          	sw	s0,24(sp)
8040709c:	00912a23          	sw	s1,20(sp)
804070a0:	01212823          	sw	s2,16(sp)
804070a4:	01312623          	sw	s3,12(sp)
804070a8:	01412423          	sw	s4,8(sp)
804070ac:	0a050263          	beqz	a0,80407150 <dup_files+0xc0>
804070b0:	00058413          	mv	s0,a1
804070b4:	08058e63          	beqz	a1,80407150 <dup_files+0xc0>
804070b8:	00852783          	lw	a5,8(a0)
804070bc:	00050493          	mv	s1,a0
804070c0:	0a079863          	bnez	a5,80407170 <dup_files+0xe0>
804070c4:	0085a783          	lw	a5,8(a1)
804070c8:	0af05463          	blez	a5,80407170 <dup_files+0xe0>
804070cc:	0005a503          	lw	a0,0(a1)
804070d0:	00a4a023          	sw	a0,0(s1)
804070d4:	00050463          	beqz	a0,804070dc <dup_files+0x4c>
804070d8:	6e9060ef          	jal	ra,8040dfc0 <inode_ref_inc>
804070dc:	00442403          	lw	s0,4(s0)
804070e0:	00001937          	lui	s2,0x1
804070e4:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804070e8:	0044a483          	lw	s1,4(s1)
804070ec:	01240933          	add	s2,s0,s2
804070f0:	00200993          	li	s3,2
804070f4:	00100a13          	li	s4,1
804070f8:	0100006f          	j	80407108 <dup_files+0x78>
804070fc:	01c40413          	addi	s0,s0,28
80407100:	01c48493          	addi	s1,s1,28
80407104:	02890463          	beq	s2,s0,8040712c <dup_files+0x9c>
80407108:	00042783          	lw	a5,0(s0)
8040710c:	ff3798e3          	bne	a5,s3,804070fc <dup_files+0x6c>
80407110:	0144a023          	sw	s4,0(s1)
80407114:	00040593          	mv	a1,s0
80407118:	00048513          	mv	a0,s1
8040711c:	01c40413          	addi	s0,s0,28
80407120:	9b0ff0ef          	jal	ra,804062d0 <fd_array_dup>
80407124:	01c48493          	addi	s1,s1,28
80407128:	fe8910e3          	bne	s2,s0,80407108 <dup_files+0x78>
8040712c:	01c12083          	lw	ra,28(sp)
80407130:	01812403          	lw	s0,24(sp)
80407134:	01412483          	lw	s1,20(sp)
80407138:	01012903          	lw	s2,16(sp)
8040713c:	00c12983          	lw	s3,12(sp)
80407140:	00812a03          	lw	s4,8(sp)
80407144:	00000513          	li	a0,0
80407148:	02010113          	addi	sp,sp,32
8040714c:	00008067          	ret
80407150:	0000e697          	auipc	a3,0xe
80407154:	8b068693          	addi	a3,a3,-1872 # 80414a00 <default_pmm_manager+0x9a4>
80407158:	0000c617          	auipc	a2,0xc
8040715c:	68860613          	addi	a2,a2,1672 # 804137e0 <commands+0x1bc>
80407160:	05300593          	li	a1,83
80407164:	0000e517          	auipc	a0,0xe
80407168:	fd050513          	addi	a0,a0,-48 # 80415134 <CSWTCH.69+0x3dc>
8040716c:	cb8f90ef          	jal	ra,80400624 <__panic>
80407170:	0000e697          	auipc	a3,0xe
80407174:	f6868693          	addi	a3,a3,-152 # 804150d8 <CSWTCH.69+0x380>
80407178:	0000c617          	auipc	a2,0xc
8040717c:	66860613          	addi	a2,a2,1640 # 804137e0 <commands+0x1bc>
80407180:	05400593          	li	a1,84
80407184:	0000e517          	auipc	a0,0xe
80407188:	fb050513          	addi	a0,a0,-80 # 80415134 <CSWTCH.69+0x3dc>
8040718c:	c98f90ef          	jal	ra,80400624 <__panic>

80407190 <iobuf_skip.part.0>:
80407190:	ff010113          	addi	sp,sp,-16
80407194:	0000e697          	auipc	a3,0xe
80407198:	fc868693          	addi	a3,a3,-56 # 8041515c <CSWTCH.69+0x404>
8040719c:	0000c617          	auipc	a2,0xc
804071a0:	64460613          	addi	a2,a2,1604 # 804137e0 <commands+0x1bc>
804071a4:	04a00593          	li	a1,74
804071a8:	0000e517          	auipc	a0,0xe
804071ac:	fc850513          	addi	a0,a0,-56 # 80415170 <CSWTCH.69+0x418>
804071b0:	00112623          	sw	ra,12(sp)
804071b4:	c70f90ef          	jal	ra,80400624 <__panic>

804071b8 <iobuf_init>:
804071b8:	00b52023          	sw	a1,0(a0)
804071bc:	00d52223          	sw	a3,4(a0)
804071c0:	00c52623          	sw	a2,12(a0)
804071c4:	00c52423          	sw	a2,8(a0)
804071c8:	00008067          	ret

804071cc <iobuf_move>:
804071cc:	fe010113          	addi	sp,sp,-32
804071d0:	00812c23          	sw	s0,24(sp)
804071d4:	00c52403          	lw	s0,12(a0)
804071d8:	00912a23          	sw	s1,20(sp)
804071dc:	01212823          	sw	s2,16(sp)
804071e0:	01312623          	sw	s3,12(sp)
804071e4:	00112e23          	sw	ra,28(sp)
804071e8:	00050493          	mv	s1,a0
804071ec:	00060913          	mv	s2,a2
804071f0:	00058513          	mv	a0,a1
804071f4:	00070993          	mv	s3,a4
804071f8:	00867463          	bgeu	a2,s0,80407200 <iobuf_move+0x34>
804071fc:	00060413          	mv	s0,a2
80407200:	04040063          	beqz	s0,80407240 <iobuf_move+0x74>
80407204:	0004a583          	lw	a1,0(s1)
80407208:	06069263          	bnez	a3,8040726c <iobuf_move+0xa0>
8040720c:	00040613          	mv	a2,s0
80407210:	1bc0c0ef          	jal	ra,804133cc <memmove>
80407214:	00c4a783          	lw	a5,12(s1)
80407218:	0687e663          	bltu	a5,s0,80407284 <iobuf_move+0xb8>
8040721c:	0004a683          	lw	a3,0(s1)
80407220:	0044a703          	lw	a4,4(s1)
80407224:	408787b3          	sub	a5,a5,s0
80407228:	008686b3          	add	a3,a3,s0
8040722c:	00870733          	add	a4,a4,s0
80407230:	00d4a023          	sw	a3,0(s1)
80407234:	00e4a223          	sw	a4,4(s1)
80407238:	00f4a623          	sw	a5,12(s1)
8040723c:	40890933          	sub	s2,s2,s0
80407240:	00098463          	beqz	s3,80407248 <iobuf_move+0x7c>
80407244:	0089a023          	sw	s0,0(s3)
80407248:	00000513          	li	a0,0
8040724c:	02091863          	bnez	s2,8040727c <iobuf_move+0xb0>
80407250:	01c12083          	lw	ra,28(sp)
80407254:	01812403          	lw	s0,24(sp)
80407258:	01412483          	lw	s1,20(sp)
8040725c:	01012903          	lw	s2,16(sp)
80407260:	00c12983          	lw	s3,12(sp)
80407264:	02010113          	addi	sp,sp,32
80407268:	00008067          	ret
8040726c:	00058793          	mv	a5,a1
80407270:	00050593          	mv	a1,a0
80407274:	00078513          	mv	a0,a5
80407278:	f95ff06f          	j	8040720c <iobuf_move+0x40>
8040727c:	ffc00513          	li	a0,-4
80407280:	fd1ff06f          	j	80407250 <iobuf_move+0x84>
80407284:	f0dff0ef          	jal	ra,80407190 <iobuf_skip.part.0>

80407288 <iobuf_skip>:
80407288:	00c52783          	lw	a5,12(a0)
8040728c:	02b7e463          	bltu	a5,a1,804072b4 <iobuf_skip+0x2c>
80407290:	00052683          	lw	a3,0(a0)
80407294:	00452703          	lw	a4,4(a0)
80407298:	40b787b3          	sub	a5,a5,a1
8040729c:	00b686b3          	add	a3,a3,a1
804072a0:	00b705b3          	add	a1,a4,a1
804072a4:	00d52023          	sw	a3,0(a0)
804072a8:	00b52223          	sw	a1,4(a0)
804072ac:	00f52623          	sw	a5,12(a0)
804072b0:	00008067          	ret
804072b4:	ff010113          	addi	sp,sp,-16
804072b8:	00112623          	sw	ra,12(sp)
804072bc:	ed5ff0ef          	jal	ra,80407190 <iobuf_skip.part.0>

804072c0 <copy_path>:
804072c0:	fe010113          	addi	sp,sp,-32
804072c4:	01212823          	sw	s2,16(sp)
804072c8:	00095917          	auipc	s2,0x95
804072cc:	4e890913          	addi	s2,s2,1256 # 8049c7b0 <current>
804072d0:	00092783          	lw	a5,0(s2)
804072d4:	01412423          	sw	s4,8(sp)
804072d8:	00050a13          	mv	s4,a0
804072dc:	00001537          	lui	a0,0x1
804072e0:	00912a23          	sw	s1,20(sp)
804072e4:	01312623          	sw	s3,12(sp)
804072e8:	00112e23          	sw	ra,28(sp)
804072ec:	00812c23          	sw	s0,24(sp)
804072f0:	01512223          	sw	s5,4(sp)
804072f4:	00058993          	mv	s3,a1
804072f8:	0187a483          	lw	s1,24(a5)
804072fc:	d04fb0ef          	jal	ra,80402800 <kmalloc>
80407300:	0c050463          	beqz	a0,804073c8 <copy_path+0x108>
80407304:	00050413          	mv	s0,a0
80407308:	06048863          	beqz	s1,80407378 <copy_path+0xb8>
8040730c:	01c48a93          	addi	s5,s1,28
80407310:	000a8513          	mv	a0,s5
80407314:	a51fe0ef          	jal	ra,80405d64 <down>
80407318:	00092783          	lw	a5,0(s2)
8040731c:	08078263          	beqz	a5,804073a0 <copy_path+0xe0>
80407320:	0047a783          	lw	a5,4(a5)
80407324:	000016b7          	lui	a3,0x1
80407328:	00098613          	mv	a2,s3
8040732c:	02f4a423          	sw	a5,40(s1)
80407330:	00040593          	mv	a1,s0
80407334:	00048513          	mv	a0,s1
80407338:	f3cfe0ef          	jal	ra,80405a74 <copy_string>
8040733c:	06050e63          	beqz	a0,804073b8 <copy_path+0xf8>
80407340:	000a8513          	mv	a0,s5
80407344:	a1dfe0ef          	jal	ra,80405d60 <up>
80407348:	0204a423          	sw	zero,40(s1)
8040734c:	008a2023          	sw	s0,0(s4)
80407350:	00000513          	li	a0,0
80407354:	01c12083          	lw	ra,28(sp)
80407358:	01812403          	lw	s0,24(sp)
8040735c:	01412483          	lw	s1,20(sp)
80407360:	01012903          	lw	s2,16(sp)
80407364:	00c12983          	lw	s3,12(sp)
80407368:	00812a03          	lw	s4,8(sp)
8040736c:	00412a83          	lw	s5,4(sp)
80407370:	02010113          	addi	sp,sp,32
80407374:	00008067          	ret
80407378:	00050593          	mv	a1,a0
8040737c:	000016b7          	lui	a3,0x1
80407380:	00098613          	mv	a2,s3
80407384:	00000513          	li	a0,0
80407388:	eecfe0ef          	jal	ra,80405a74 <copy_string>
8040738c:	fc0510e3          	bnez	a0,8040734c <copy_path+0x8c>
80407390:	00040513          	mv	a0,s0
80407394:	d90fb0ef          	jal	ra,80402924 <kfree>
80407398:	ffd00513          	li	a0,-3
8040739c:	fb9ff06f          	j	80407354 <copy_path+0x94>
804073a0:	000016b7          	lui	a3,0x1
804073a4:	00098613          	mv	a2,s3
804073a8:	00040593          	mv	a1,s0
804073ac:	00048513          	mv	a0,s1
804073b0:	ec4fe0ef          	jal	ra,80405a74 <copy_string>
804073b4:	f80516e3          	bnez	a0,80407340 <copy_path+0x80>
804073b8:	000a8513          	mv	a0,s5
804073bc:	9a5fe0ef          	jal	ra,80405d60 <up>
804073c0:	0204a423          	sw	zero,40(s1)
804073c4:	fcdff06f          	j	80407390 <copy_path+0xd0>
804073c8:	ffc00513          	li	a0,-4
804073cc:	f89ff06f          	j	80407354 <copy_path+0x94>

804073d0 <sysfile_open>:
804073d0:	fe010113          	addi	sp,sp,-32
804073d4:	00912a23          	sw	s1,20(sp)
804073d8:	00058493          	mv	s1,a1
804073dc:	00050593          	mv	a1,a0
804073e0:	00c10513          	addi	a0,sp,12
804073e4:	00812c23          	sw	s0,24(sp)
804073e8:	00112e23          	sw	ra,28(sp)
804073ec:	ed5ff0ef          	jal	ra,804072c0 <copy_path>
804073f0:	00050413          	mv	s0,a0
804073f4:	00051e63          	bnez	a0,80407410 <sysfile_open+0x40>
804073f8:	00c12503          	lw	a0,12(sp)
804073fc:	00048593          	mv	a1,s1
80407400:	810ff0ef          	jal	ra,80406410 <file_open>
80407404:	00050413          	mv	s0,a0
80407408:	00c12503          	lw	a0,12(sp)
8040740c:	d18fb0ef          	jal	ra,80402924 <kfree>
80407410:	00040513          	mv	a0,s0
80407414:	01c12083          	lw	ra,28(sp)
80407418:	01812403          	lw	s0,24(sp)
8040741c:	01412483          	lw	s1,20(sp)
80407420:	02010113          	addi	sp,sp,32
80407424:	00008067          	ret

80407428 <sysfile_close>:
80407428:	96cff06f          	j	80406594 <file_close>

8040742c <sysfile_read>:
8040742c:	fc010113          	addi	sp,sp,-64
80407430:	02912a23          	sw	s1,52(sp)
80407434:	02112e23          	sw	ra,60(sp)
80407438:	02812c23          	sw	s0,56(sp)
8040743c:	03212823          	sw	s2,48(sp)
80407440:	03312623          	sw	s3,44(sp)
80407444:	03412423          	sw	s4,40(sp)
80407448:	03512223          	sw	s5,36(sp)
8040744c:	03612023          	sw	s6,32(sp)
80407450:	01712e23          	sw	s7,28(sp)
80407454:	01812c23          	sw	s8,24(sp)
80407458:	01912a23          	sw	s9,20(sp)
8040745c:	00000493          	li	s1,0
80407460:	02061e63          	bnez	a2,8040749c <sysfile_read+0x70>
80407464:	03c12083          	lw	ra,60(sp)
80407468:	03812403          	lw	s0,56(sp)
8040746c:	00048513          	mv	a0,s1
80407470:	03012903          	lw	s2,48(sp)
80407474:	03412483          	lw	s1,52(sp)
80407478:	02c12983          	lw	s3,44(sp)
8040747c:	02812a03          	lw	s4,40(sp)
80407480:	02412a83          	lw	s5,36(sp)
80407484:	02012b03          	lw	s6,32(sp)
80407488:	01c12b83          	lw	s7,28(sp)
8040748c:	01812c03          	lw	s8,24(sp)
80407490:	01412c83          	lw	s9,20(sp)
80407494:	04010113          	addi	sp,sp,64
80407498:	00008067          	ret
8040749c:	00095c97          	auipc	s9,0x95
804074a0:	314c8c93          	addi	s9,s9,788 # 8049c7b0 <current>
804074a4:	000ca783          	lw	a5,0(s9)
804074a8:	00060413          	mv	s0,a2
804074ac:	00058b13          	mv	s6,a1
804074b0:	00000613          	li	a2,0
804074b4:	00100593          	li	a1,1
804074b8:	00050a93          	mv	s5,a0
804074bc:	0187a903          	lw	s2,24(a5)
804074c0:	ed1fe0ef          	jal	ra,80406390 <file_testfd>
804074c4:	10050063          	beqz	a0,804075c4 <sysfile_read+0x198>
804074c8:	00001537          	lui	a0,0x1
804074cc:	b34fb0ef          	jal	ra,80402800 <kmalloc>
804074d0:	00050993          	mv	s3,a0
804074d4:	0e050c63          	beqz	a0,804075cc <sysfile_read+0x1a0>
804074d8:	00000b93          	li	s7,0
804074dc:	00001a37          	lui	s4,0x1
804074e0:	01c90c13          	addi	s8,s2,28
804074e4:	0d446663          	bltu	s0,s4,804075b0 <sysfile_read+0x184>
804074e8:	01412623          	sw	s4,12(sp)
804074ec:	00001637          	lui	a2,0x1
804074f0:	00c10693          	addi	a3,sp,12
804074f4:	00098593          	mv	a1,s3
804074f8:	000a8513          	mv	a0,s5
804074fc:	920ff0ef          	jal	ra,8040661c <file_read>
80407500:	00c12683          	lw	a3,12(sp)
80407504:	00050493          	mv	s1,a0
80407508:	08068863          	beqz	a3,80407598 <sysfile_read+0x16c>
8040750c:	02090063          	beqz	s2,8040752c <sysfile_read+0x100>
80407510:	000c0513          	mv	a0,s8
80407514:	851fe0ef          	jal	ra,80405d64 <down>
80407518:	000ca783          	lw	a5,0(s9)
8040751c:	0a078063          	beqz	a5,804075bc <sysfile_read+0x190>
80407520:	0047a783          	lw	a5,4(a5)
80407524:	00c12683          	lw	a3,12(sp)
80407528:	02f92423          	sw	a5,40(s2)
8040752c:	00098613          	mv	a2,s3
80407530:	000b0593          	mv	a1,s6
80407534:	00090513          	mv	a0,s2
80407538:	ce0fe0ef          	jal	ra,80405a18 <copy_to_user>
8040753c:	04050063          	beqz	a0,8040757c <sysfile_read+0x150>
80407540:	00c12783          	lw	a5,12(sp)
80407544:	08f46863          	bltu	s0,a5,804075d4 <sysfile_read+0x1a8>
80407548:	00fb0b33          	add	s6,s6,a5
8040754c:	40f40433          	sub	s0,s0,a5
80407550:	00fb8bb3          	add	s7,s7,a5
80407554:	02091a63          	bnez	s2,80407588 <sysfile_read+0x15c>
80407558:	00049863          	bnez	s1,80407568 <sysfile_read+0x13c>
8040755c:	00c12783          	lw	a5,12(sp)
80407560:	02078e63          	beqz	a5,8040759c <sysfile_read+0x170>
80407564:	f80410e3          	bnez	s0,804074e4 <sysfile_read+0xb8>
80407568:	00098513          	mv	a0,s3
8040756c:	bb8fb0ef          	jal	ra,80402924 <kfree>
80407570:	ee0b8ae3          	beqz	s7,80407464 <sysfile_read+0x38>
80407574:	000b8493          	mv	s1,s7
80407578:	eedff06f          	j	80407464 <sysfile_read+0x38>
8040757c:	00049463          	bnez	s1,80407584 <sysfile_read+0x158>
80407580:	ffd00493          	li	s1,-3
80407584:	fe0902e3          	beqz	s2,80407568 <sysfile_read+0x13c>
80407588:	000c0513          	mv	a0,s8
8040758c:	fd4fe0ef          	jal	ra,80405d60 <up>
80407590:	02092423          	sw	zero,40(s2)
80407594:	fc5ff06f          	j	80407558 <sysfile_read+0x12c>
80407598:	fc0518e3          	bnez	a0,80407568 <sysfile_read+0x13c>
8040759c:	00098513          	mv	a0,s3
804075a0:	00000493          	li	s1,0
804075a4:	b80fb0ef          	jal	ra,80402924 <kfree>
804075a8:	ea0b8ee3          	beqz	s7,80407464 <sysfile_read+0x38>
804075ac:	fc9ff06f          	j	80407574 <sysfile_read+0x148>
804075b0:	00812623          	sw	s0,12(sp)
804075b4:	00040613          	mv	a2,s0
804075b8:	f39ff06f          	j	804074f0 <sysfile_read+0xc4>
804075bc:	00c12683          	lw	a3,12(sp)
804075c0:	f6dff06f          	j	8040752c <sysfile_read+0x100>
804075c4:	ffd00493          	li	s1,-3
804075c8:	e9dff06f          	j	80407464 <sysfile_read+0x38>
804075cc:	ffc00493          	li	s1,-4
804075d0:	e95ff06f          	j	80407464 <sysfile_read+0x38>
804075d4:	0000e697          	auipc	a3,0xe
804075d8:	bac68693          	addi	a3,a3,-1108 # 80415180 <CSWTCH.69+0x428>
804075dc:	0000c617          	auipc	a2,0xc
804075e0:	20460613          	addi	a2,a2,516 # 804137e0 <commands+0x1bc>
804075e4:	05500593          	li	a1,85
804075e8:	0000e517          	auipc	a0,0xe
804075ec:	ba450513          	addi	a0,a0,-1116 # 8041518c <CSWTCH.69+0x434>
804075f0:	834f90ef          	jal	ra,80400624 <__panic>

804075f4 <sysfile_write>:
804075f4:	fc010113          	addi	sp,sp,-64
804075f8:	03512223          	sw	s5,36(sp)
804075fc:	02112e23          	sw	ra,60(sp)
80407600:	02812c23          	sw	s0,56(sp)
80407604:	02912a23          	sw	s1,52(sp)
80407608:	03212823          	sw	s2,48(sp)
8040760c:	03312623          	sw	s3,44(sp)
80407610:	03412423          	sw	s4,40(sp)
80407614:	03612023          	sw	s6,32(sp)
80407618:	01712e23          	sw	s7,28(sp)
8040761c:	01812c23          	sw	s8,24(sp)
80407620:	01912a23          	sw	s9,20(sp)
80407624:	00000a93          	li	s5,0
80407628:	02061e63          	bnez	a2,80407664 <sysfile_write+0x70>
8040762c:	03c12083          	lw	ra,60(sp)
80407630:	03812403          	lw	s0,56(sp)
80407634:	000a8513          	mv	a0,s5
80407638:	03412483          	lw	s1,52(sp)
8040763c:	03012903          	lw	s2,48(sp)
80407640:	02c12983          	lw	s3,44(sp)
80407644:	02812a03          	lw	s4,40(sp)
80407648:	02412a83          	lw	s5,36(sp)
8040764c:	02012b03          	lw	s6,32(sp)
80407650:	01c12b83          	lw	s7,28(sp)
80407654:	01812c03          	lw	s8,24(sp)
80407658:	01412c83          	lw	s9,20(sp)
8040765c:	04010113          	addi	sp,sp,64
80407660:	00008067          	ret
80407664:	00095b97          	auipc	s7,0x95
80407668:	14cb8b93          	addi	s7,s7,332 # 8049c7b0 <current>
8040766c:	000ba783          	lw	a5,0(s7)
80407670:	00060413          	mv	s0,a2
80407674:	00058a13          	mv	s4,a1
80407678:	00100613          	li	a2,1
8040767c:	00000593          	li	a1,0
80407680:	00050c93          	mv	s9,a0
80407684:	0187a483          	lw	s1,24(a5)
80407688:	d09fe0ef          	jal	ra,80406390 <file_testfd>
8040768c:	0e050e63          	beqz	a0,80407788 <sysfile_write+0x194>
80407690:	00001537          	lui	a0,0x1
80407694:	96cfb0ef          	jal	ra,80402800 <kmalloc>
80407698:	00050993          	mv	s3,a0
8040769c:	0e050a63          	beqz	a0,80407790 <sysfile_write+0x19c>
804076a0:	00000c13          	li	s8,0
804076a4:	00001937          	lui	s2,0x1
804076a8:	01c48b13          	addi	s6,s1,28
804076ac:	09246063          	bltu	s0,s2,8040772c <sysfile_write+0x138>
804076b0:	01212623          	sw	s2,12(sp)
804076b4:	08048063          	beqz	s1,80407734 <sysfile_write+0x140>
804076b8:	000b0513          	mv	a0,s6
804076bc:	ea8fe0ef          	jal	ra,80405d64 <down>
804076c0:	000ba783          	lw	a5,0(s7)
804076c4:	00078663          	beqz	a5,804076d0 <sysfile_write+0xdc>
804076c8:	0047a783          	lw	a5,4(a5)
804076cc:	02f4a423          	sw	a5,40(s1)
804076d0:	00c12683          	lw	a3,12(sp)
804076d4:	00000713          	li	a4,0
804076d8:	000a0613          	mv	a2,s4
804076dc:	00098593          	mv	a1,s3
804076e0:	00048513          	mv	a0,s1
804076e4:	ad4fe0ef          	jal	ra,804059b8 <copy_from_user>
804076e8:	06050863          	beqz	a0,80407758 <sysfile_write+0x164>
804076ec:	000b0513          	mv	a0,s6
804076f0:	e70fe0ef          	jal	ra,80405d60 <up>
804076f4:	0204a423          	sw	zero,40(s1)
804076f8:	00c12603          	lw	a2,12(sp)
804076fc:	00c10693          	addi	a3,sp,12
80407700:	00098593          	mv	a1,s3
80407704:	000c8513          	mv	a0,s9
80407708:	868ff0ef          	jal	ra,80406770 <file_write>
8040770c:	00c12783          	lw	a5,12(sp)
80407710:	00050a93          	mv	s5,a0
80407714:	04079c63          	bnez	a5,8040776c <sysfile_write+0x178>
80407718:	00098513          	mv	a0,s3
8040771c:	a08fb0ef          	jal	ra,80402924 <kfree>
80407720:	f00c06e3          	beqz	s8,8040762c <sysfile_write+0x38>
80407724:	000c0a93          	mv	s5,s8
80407728:	f05ff06f          	j	8040762c <sysfile_write+0x38>
8040772c:	00812623          	sw	s0,12(sp)
80407730:	f80494e3          	bnez	s1,804076b8 <sysfile_write+0xc4>
80407734:	00c12683          	lw	a3,12(sp)
80407738:	00000713          	li	a4,0
8040773c:	000a0613          	mv	a2,s4
80407740:	00098593          	mv	a1,s3
80407744:	00000513          	li	a0,0
80407748:	a70fe0ef          	jal	ra,804059b8 <copy_from_user>
8040774c:	fa0516e3          	bnez	a0,804076f8 <sysfile_write+0x104>
80407750:	ffd00a93          	li	s5,-3
80407754:	fc5ff06f          	j	80407718 <sysfile_write+0x124>
80407758:	000b0513          	mv	a0,s6
8040775c:	e04fe0ef          	jal	ra,80405d60 <up>
80407760:	ffd00a93          	li	s5,-3
80407764:	0204a423          	sw	zero,40(s1)
80407768:	fb1ff06f          	j	80407718 <sysfile_write+0x124>
8040776c:	02f46663          	bltu	s0,a5,80407798 <sysfile_write+0x1a4>
80407770:	00fa0a33          	add	s4,s4,a5
80407774:	40f40433          	sub	s0,s0,a5
80407778:	00fc0c33          	add	s8,s8,a5
8040777c:	f8051ee3          	bnez	a0,80407718 <sysfile_write+0x124>
80407780:	f20416e3          	bnez	s0,804076ac <sysfile_write+0xb8>
80407784:	f95ff06f          	j	80407718 <sysfile_write+0x124>
80407788:	ffd00a93          	li	s5,-3
8040778c:	ea1ff06f          	j	8040762c <sysfile_write+0x38>
80407790:	ffc00a93          	li	s5,-4
80407794:	e99ff06f          	j	8040762c <sysfile_write+0x38>
80407798:	0000e697          	auipc	a3,0xe
8040779c:	9e868693          	addi	a3,a3,-1560 # 80415180 <CSWTCH.69+0x428>
804077a0:	0000c617          	auipc	a2,0xc
804077a4:	04060613          	addi	a2,a2,64 # 804137e0 <commands+0x1bc>
804077a8:	08a00593          	li	a1,138
804077ac:	0000e517          	auipc	a0,0xe
804077b0:	9e050513          	addi	a0,a0,-1568 # 8041518c <CSWTCH.69+0x434>
804077b4:	e71f80ef          	jal	ra,80400624 <__panic>

804077b8 <sysfile_seek>:
804077b8:	90cff06f          	j	804068c4 <file_seek>

804077bc <sysfile_fstat>:
804077bc:	fd010113          	addi	sp,sp,-48
804077c0:	03212023          	sw	s2,32(sp)
804077c4:	00095917          	auipc	s2,0x95
804077c8:	fec90913          	addi	s2,s2,-20 # 8049c7b0 <current>
804077cc:	00092783          	lw	a5,0(s2)
804077d0:	01312e23          	sw	s3,28(sp)
804077d4:	00058993          	mv	s3,a1
804077d8:	00010593          	mv	a1,sp
804077dc:	02812423          	sw	s0,40(sp)
804077e0:	02912223          	sw	s1,36(sp)
804077e4:	02112623          	sw	ra,44(sp)
804077e8:	01412c23          	sw	s4,24(sp)
804077ec:	0187a483          	lw	s1,24(a5)
804077f0:	a84ff0ef          	jal	ra,80406a74 <file_fstat>
804077f4:	00050413          	mv	s0,a0
804077f8:	04051463          	bnez	a0,80407840 <sysfile_fstat+0x84>
804077fc:	06048463          	beqz	s1,80407864 <sysfile_fstat+0xa8>
80407800:	01c48a13          	addi	s4,s1,28
80407804:	000a0513          	mv	a0,s4
80407808:	d5cfe0ef          	jal	ra,80405d64 <down>
8040780c:	00092783          	lw	a5,0(s2)
80407810:	06078863          	beqz	a5,80407880 <sysfile_fstat+0xc4>
80407814:	0047a783          	lw	a5,4(a5)
80407818:	01000693          	li	a3,16
8040781c:	00010613          	mv	a2,sp
80407820:	02f4a423          	sw	a5,40(s1)
80407824:	00098593          	mv	a1,s3
80407828:	00048513          	mv	a0,s1
8040782c:	9ecfe0ef          	jal	ra,80405a18 <copy_to_user>
80407830:	06050463          	beqz	a0,80407898 <sysfile_fstat+0xdc>
80407834:	000a0513          	mv	a0,s4
80407838:	d28fe0ef          	jal	ra,80405d60 <up>
8040783c:	0204a423          	sw	zero,40(s1)
80407840:	00040513          	mv	a0,s0
80407844:	02c12083          	lw	ra,44(sp)
80407848:	02812403          	lw	s0,40(sp)
8040784c:	02412483          	lw	s1,36(sp)
80407850:	02012903          	lw	s2,32(sp)
80407854:	01c12983          	lw	s3,28(sp)
80407858:	01812a03          	lw	s4,24(sp)
8040785c:	03010113          	addi	sp,sp,48
80407860:	00008067          	ret
80407864:	01000693          	li	a3,16
80407868:	00010613          	mv	a2,sp
8040786c:	00098593          	mv	a1,s3
80407870:	9a8fe0ef          	jal	ra,80405a18 <copy_to_user>
80407874:	fc0516e3          	bnez	a0,80407840 <sysfile_fstat+0x84>
80407878:	ffd00413          	li	s0,-3
8040787c:	fc5ff06f          	j	80407840 <sysfile_fstat+0x84>
80407880:	01000693          	li	a3,16
80407884:	00010613          	mv	a2,sp
80407888:	00098593          	mv	a1,s3
8040788c:	00048513          	mv	a0,s1
80407890:	988fe0ef          	jal	ra,80405a18 <copy_to_user>
80407894:	fa0510e3          	bnez	a0,80407834 <sysfile_fstat+0x78>
80407898:	000a0513          	mv	a0,s4
8040789c:	cc4fe0ef          	jal	ra,80405d60 <up>
804078a0:	ffd00413          	li	s0,-3
804078a4:	0204a423          	sw	zero,40(s1)
804078a8:	f99ff06f          	j	80407840 <sysfile_fstat+0x84>

804078ac <sysfile_fsync>:
804078ac:	ae0ff06f          	j	80406b8c <file_fsync>

804078b0 <sysfile_getcwd>:
804078b0:	fd010113          	addi	sp,sp,-48
804078b4:	01312e23          	sw	s3,28(sp)
804078b8:	00095997          	auipc	s3,0x95
804078bc:	ef898993          	addi	s3,s3,-264 # 8049c7b0 <current>
804078c0:	0009a783          	lw	a5,0(s3)
804078c4:	03212023          	sw	s2,32(sp)
804078c8:	02112623          	sw	ra,44(sp)
804078cc:	02812423          	sw	s0,40(sp)
804078d0:	02912223          	sw	s1,36(sp)
804078d4:	01412c23          	sw	s4,24(sp)
804078d8:	0187a903          	lw	s2,24(a5)
804078dc:	08058863          	beqz	a1,8040796c <sysfile_getcwd+0xbc>
804078e0:	00050493          	mv	s1,a0
804078e4:	00058413          	mv	s0,a1
804078e8:	06090663          	beqz	s2,80407954 <sysfile_getcwd+0xa4>
804078ec:	01c90a13          	addi	s4,s2,28
804078f0:	000a0513          	mv	a0,s4
804078f4:	c70fe0ef          	jal	ra,80405d64 <down>
804078f8:	0009a783          	lw	a5,0(s3)
804078fc:	00078663          	beqz	a5,80407908 <sysfile_getcwd+0x58>
80407900:	0047a783          	lw	a5,4(a5)
80407904:	02f92423          	sw	a5,40(s2)
80407908:	00100693          	li	a3,1
8040790c:	00040613          	mv	a2,s0
80407910:	00048593          	mv	a1,s1
80407914:	00090513          	mv	a0,s2
80407918:	fc9fd0ef          	jal	ra,804058e0 <user_mem_check>
8040791c:	04051c63          	bnez	a0,80407974 <sysfile_getcwd+0xc4>
80407920:	ffd00413          	li	s0,-3
80407924:	000a0513          	mv	a0,s4
80407928:	c38fe0ef          	jal	ra,80405d60 <up>
8040792c:	02092423          	sw	zero,40(s2)
80407930:	00040513          	mv	a0,s0
80407934:	02c12083          	lw	ra,44(sp)
80407938:	02812403          	lw	s0,40(sp)
8040793c:	02412483          	lw	s1,36(sp)
80407940:	02012903          	lw	s2,32(sp)
80407944:	01c12983          	lw	s3,28(sp)
80407948:	01812a03          	lw	s4,24(sp)
8040794c:	03010113          	addi	sp,sp,48
80407950:	00008067          	ret
80407954:	00058613          	mv	a2,a1
80407958:	00100693          	li	a3,1
8040795c:	00050593          	mv	a1,a0
80407960:	00000513          	li	a0,0
80407964:	f7dfd0ef          	jal	ra,804058e0 <user_mem_check>
80407968:	02051663          	bnez	a0,80407994 <sysfile_getcwd+0xe4>
8040796c:	ffd00413          	li	s0,-3
80407970:	fc1ff06f          	j	80407930 <sysfile_getcwd+0x80>
80407974:	00040613          	mv	a2,s0
80407978:	00000693          	li	a3,0
8040797c:	00048593          	mv	a1,s1
80407980:	00010513          	mv	a0,sp
80407984:	835ff0ef          	jal	ra,804071b8 <iobuf_init>
80407988:	6d4070ef          	jal	ra,8040f05c <vfs_getcwd>
8040798c:	00050413          	mv	s0,a0
80407990:	f95ff06f          	j	80407924 <sysfile_getcwd+0x74>
80407994:	00040613          	mv	a2,s0
80407998:	00000693          	li	a3,0
8040799c:	00048593          	mv	a1,s1
804079a0:	00010513          	mv	a0,sp
804079a4:	815ff0ef          	jal	ra,804071b8 <iobuf_init>
804079a8:	6b4070ef          	jal	ra,8040f05c <vfs_getcwd>
804079ac:	00050413          	mv	s0,a0
804079b0:	f81ff06f          	j	80407930 <sysfile_getcwd+0x80>

804079b4 <sysfile_getdirentry>:
804079b4:	fe010113          	addi	sp,sp,-32
804079b8:	01212823          	sw	s2,16(sp)
804079bc:	00095917          	auipc	s2,0x95
804079c0:	df490913          	addi	s2,s2,-524 # 8049c7b0 <current>
804079c4:	00092783          	lw	a5,0(s2)
804079c8:	01312623          	sw	s3,12(sp)
804079cc:	00050993          	mv	s3,a0
804079d0:	10400513          	li	a0,260
804079d4:	00912a23          	sw	s1,20(sp)
804079d8:	01412423          	sw	s4,8(sp)
804079dc:	00112e23          	sw	ra,28(sp)
804079e0:	00812c23          	sw	s0,24(sp)
804079e4:	01512223          	sw	s5,4(sp)
804079e8:	00058a13          	mv	s4,a1
804079ec:	0187a483          	lw	s1,24(a5)
804079f0:	e11fa0ef          	jal	ra,80402800 <kmalloc>
804079f4:	12050a63          	beqz	a0,80407b28 <sysfile_getdirentry+0x174>
804079f8:	00050413          	mv	s0,a0
804079fc:	0e048063          	beqz	s1,80407adc <sysfile_getdirentry+0x128>
80407a00:	01c48a93          	addi	s5,s1,28
80407a04:	000a8513          	mv	a0,s5
80407a08:	b5cfe0ef          	jal	ra,80405d64 <down>
80407a0c:	00092783          	lw	a5,0(s2)
80407a10:	00078663          	beqz	a5,80407a1c <sysfile_getdirentry+0x68>
80407a14:	0047a783          	lw	a5,4(a5)
80407a18:	02f4a423          	sw	a5,40(s1)
80407a1c:	00100713          	li	a4,1
80407a20:	00400693          	li	a3,4
80407a24:	000a0613          	mv	a2,s4
80407a28:	00040593          	mv	a1,s0
80407a2c:	00048513          	mv	a0,s1
80407a30:	f89fd0ef          	jal	ra,804059b8 <copy_from_user>
80407a34:	04051263          	bnez	a0,80407a78 <sysfile_getdirentry+0xc4>
80407a38:	000a8513          	mv	a0,s5
80407a3c:	b24fe0ef          	jal	ra,80405d60 <up>
80407a40:	ffd00993          	li	s3,-3
80407a44:	0204a423          	sw	zero,40(s1)
80407a48:	00040513          	mv	a0,s0
80407a4c:	ed9fa0ef          	jal	ra,80402924 <kfree>
80407a50:	01c12083          	lw	ra,28(sp)
80407a54:	01812403          	lw	s0,24(sp)
80407a58:	00098513          	mv	a0,s3
80407a5c:	01412483          	lw	s1,20(sp)
80407a60:	01012903          	lw	s2,16(sp)
80407a64:	00c12983          	lw	s3,12(sp)
80407a68:	00812a03          	lw	s4,8(sp)
80407a6c:	00412a83          	lw	s5,4(sp)
80407a70:	02010113          	addi	sp,sp,32
80407a74:	00008067          	ret
80407a78:	000a8513          	mv	a0,s5
80407a7c:	ae4fe0ef          	jal	ra,80405d60 <up>
80407a80:	00098513          	mv	a0,s3
80407a84:	00040593          	mv	a1,s0
80407a88:	0204a423          	sw	zero,40(s1)
80407a8c:	a04ff0ef          	jal	ra,80406c90 <file_getdirentry>
80407a90:	00050993          	mv	s3,a0
80407a94:	fa051ae3          	bnez	a0,80407a48 <sysfile_getdirentry+0x94>
80407a98:	000a8513          	mv	a0,s5
80407a9c:	ac8fe0ef          	jal	ra,80405d64 <down>
80407aa0:	00092783          	lw	a5,0(s2)
80407aa4:	00078663          	beqz	a5,80407ab0 <sysfile_getdirentry+0xfc>
80407aa8:	0047a783          	lw	a5,4(a5)
80407aac:	02f4a423          	sw	a5,40(s1)
80407ab0:	10400693          	li	a3,260
80407ab4:	00040613          	mv	a2,s0
80407ab8:	000a0593          	mv	a1,s4
80407abc:	00048513          	mv	a0,s1
80407ac0:	f59fd0ef          	jal	ra,80405a18 <copy_to_user>
80407ac4:	00051463          	bnez	a0,80407acc <sysfile_getdirentry+0x118>
80407ac8:	ffd00993          	li	s3,-3
80407acc:	000a8513          	mv	a0,s5
80407ad0:	a90fe0ef          	jal	ra,80405d60 <up>
80407ad4:	0204a423          	sw	zero,40(s1)
80407ad8:	f71ff06f          	j	80407a48 <sysfile_getdirentry+0x94>
80407adc:	00050593          	mv	a1,a0
80407ae0:	00100713          	li	a4,1
80407ae4:	00400693          	li	a3,4
80407ae8:	000a0613          	mv	a2,s4
80407aec:	00000513          	li	a0,0
80407af0:	ec9fd0ef          	jal	ra,804059b8 <copy_from_user>
80407af4:	02050663          	beqz	a0,80407b20 <sysfile_getdirentry+0x16c>
80407af8:	00098513          	mv	a0,s3
80407afc:	00040593          	mv	a1,s0
80407b00:	990ff0ef          	jal	ra,80406c90 <file_getdirentry>
80407b04:	00050993          	mv	s3,a0
80407b08:	f40510e3          	bnez	a0,80407a48 <sysfile_getdirentry+0x94>
80407b0c:	10400693          	li	a3,260
80407b10:	00040613          	mv	a2,s0
80407b14:	000a0593          	mv	a1,s4
80407b18:	f01fd0ef          	jal	ra,80405a18 <copy_to_user>
80407b1c:	f20516e3          	bnez	a0,80407a48 <sysfile_getdirentry+0x94>
80407b20:	ffd00993          	li	s3,-3
80407b24:	f25ff06f          	j	80407a48 <sysfile_getdirentry+0x94>
80407b28:	ffc00993          	li	s3,-4
80407b2c:	f25ff06f          	j	80407a50 <sysfile_getdirentry+0x9c>

80407b30 <sysfile_dup>:
80407b30:	abcff06f          	j	80406dec <file_dup>

80407b34 <kernel_thread_entry>:
80407b34:	00048513          	mv	a0,s1
80407b38:	000400e7          	jalr	s0
80407b3c:	2c5000ef          	jal	ra,80408600 <do_exit>

80407b40 <alloc_proc>:
80407b40:	ff010113          	addi	sp,sp,-16
80407b44:	0e000513          	li	a0,224
80407b48:	00812423          	sw	s0,8(sp)
80407b4c:	00112623          	sw	ra,12(sp)
80407b50:	cb1fa0ef          	jal	ra,80402800 <kmalloc>
80407b54:	00050413          	mv	s0,a0
80407b58:	08050c63          	beqz	a0,80407bf0 <alloc_proc+0xb0>
80407b5c:	fff00793          	li	a5,-1
80407b60:	00f52223          	sw	a5,4(a0)
80407b64:	03800613          	li	a2,56
80407b68:	00000593          	li	a1,0
80407b6c:	00052023          	sw	zero,0(a0)
80407b70:	00052423          	sw	zero,8(a0)
80407b74:	00052623          	sw	zero,12(a0)
80407b78:	00052823          	sw	zero,16(a0)
80407b7c:	00052a23          	sw	zero,20(a0)
80407b80:	00052c23          	sw	zero,24(a0)
80407b84:	01c50513          	addi	a0,a0,28
80407b88:	0290b0ef          	jal	ra,804133b0 <memset>
80407b8c:	00095797          	auipc	a5,0x95
80407b90:	c7c78793          	addi	a5,a5,-900 # 8049c808 <boot_cr3>
80407b94:	0007a783          	lw	a5,0(a5)
80407b98:	04042a23          	sw	zero,84(s0)
80407b9c:	04042e23          	sw	zero,92(s0)
80407ba0:	04f42c23          	sw	a5,88(s0)
80407ba4:	03200613          	li	a2,50
80407ba8:	00000593          	li	a1,0
80407bac:	06040513          	addi	a0,s0,96
80407bb0:	0010b0ef          	jal	ra,804133b0 <memset>
80407bb4:	0bc40793          	addi	a5,s0,188
80407bb8:	0a042423          	sw	zero,168(s0)
80407bbc:	0a042823          	sw	zero,176(s0)
80407bc0:	0a042a23          	sw	zero,180(s0)
80407bc4:	0a042623          	sw	zero,172(s0)
80407bc8:	0a042c23          	sw	zero,184(s0)
80407bcc:	0cf42023          	sw	a5,192(s0)
80407bd0:	0af42e23          	sw	a5,188(s0)
80407bd4:	0c042223          	sw	zero,196(s0)
80407bd8:	0c042423          	sw	zero,200(s0)
80407bdc:	0c042823          	sw	zero,208(s0)
80407be0:	0c042623          	sw	zero,204(s0)
80407be4:	0c042a23          	sw	zero,212(s0)
80407be8:	0c042c23          	sw	zero,216(s0)
80407bec:	0c042e23          	sw	zero,220(s0)
80407bf0:	00040513          	mv	a0,s0
80407bf4:	00c12083          	lw	ra,12(sp)
80407bf8:	00812403          	lw	s0,8(sp)
80407bfc:	01010113          	addi	sp,sp,16
80407c00:	00008067          	ret

80407c04 <put_files>:
80407c04:	0dc52503          	lw	a0,220(a0)
80407c08:	00050a63          	beqz	a0,80407c1c <put_files+0x18>
80407c0c:	00852783          	lw	a5,8(a0)
80407c10:	fff78793          	addi	a5,a5,-1
80407c14:	00f52423          	sw	a5,8(a0)
80407c18:	00078463          	beqz	a5,80407c20 <put_files+0x1c>
80407c1c:	00008067          	ret
80407c20:	b10ff06f          	j	80406f30 <files_destroy>

80407c24 <forkret>:
80407c24:	0000100f          	fence.i
80407c28:	00095797          	auipc	a5,0x95
80407c2c:	b8878793          	addi	a5,a5,-1144 # 8049c7b0 <current>
80407c30:	0007a783          	lw	a5,0(a5)
80407c34:	0547a503          	lw	a0,84(a5)
80407c38:	9edf906f          	j	80401624 <forkrets>

80407c3c <load_icode_read>:
80407c3c:	fe010113          	addi	sp,sp,-32
80407c40:	00912a23          	sw	s1,20(sp)
80407c44:	01312623          	sw	s3,12(sp)
80407c48:	00060493          	mv	s1,a2
80407c4c:	00058993          	mv	s3,a1
80407c50:	00000613          	li	a2,0
80407c54:	00068593          	mv	a1,a3
80407c58:	00812c23          	sw	s0,24(sp)
80407c5c:	01212823          	sw	s2,16(sp)
80407c60:	00112e23          	sw	ra,28(sp)
80407c64:	00050913          	mv	s2,a0
80407c68:	b51ff0ef          	jal	ra,804077b8 <sysfile_seek>
80407c6c:	00050413          	mv	s0,a0
80407c70:	02050263          	beqz	a0,80407c94 <load_icode_read+0x58>
80407c74:	00040513          	mv	a0,s0
80407c78:	01c12083          	lw	ra,28(sp)
80407c7c:	01812403          	lw	s0,24(sp)
80407c80:	01412483          	lw	s1,20(sp)
80407c84:	01012903          	lw	s2,16(sp)
80407c88:	00c12983          	lw	s3,12(sp)
80407c8c:	02010113          	addi	sp,sp,32
80407c90:	00008067          	ret
80407c94:	00048613          	mv	a2,s1
80407c98:	00098593          	mv	a1,s3
80407c9c:	00090513          	mv	a0,s2
80407ca0:	f8cff0ef          	jal	ra,8040742c <sysfile_read>
80407ca4:	fca488e3          	beq	s1,a0,80407c74 <load_icode_read+0x38>
80407ca8:	00050413          	mv	s0,a0
80407cac:	fc0544e3          	bltz	a0,80407c74 <load_icode_read+0x38>
80407cb0:	fff00413          	li	s0,-1
80407cb4:	00040513          	mv	a0,s0
80407cb8:	01c12083          	lw	ra,28(sp)
80407cbc:	01812403          	lw	s0,24(sp)
80407cc0:	01412483          	lw	s1,20(sp)
80407cc4:	01012903          	lw	s2,16(sp)
80407cc8:	00c12983          	lw	s3,12(sp)
80407ccc:	02010113          	addi	sp,sp,32
80407cd0:	00008067          	ret

80407cd4 <user_main>:
80407cd4:	00095797          	auipc	a5,0x95
80407cd8:	adc78793          	addi	a5,a5,-1316 # 8049c7b0 <current>
80407cdc:	0007a783          	lw	a5,0(a5)
80407ce0:	fe010113          	addi	sp,sp,-32
80407ce4:	00812c23          	sw	s0,24(sp)
80407ce8:	0047a583          	lw	a1,4(a5)
80407cec:	0000e417          	auipc	s0,0xe
80407cf0:	8ac40413          	addi	s0,s0,-1876 # 80415598 <CSWTCH.69+0x840>
80407cf4:	00040613          	mv	a2,s0
80407cf8:	0000e517          	auipc	a0,0xe
80407cfc:	8a450513          	addi	a0,a0,-1884 # 8041559c <CSWTCH.69+0x844>
80407d00:	00112e23          	sw	ra,28(sp)
80407d04:	00812423          	sw	s0,8(sp)
80407d08:	00012623          	sw	zero,12(sp)
80407d0c:	cf0f80ef          	jal	ra,804001fc <cprintf>
80407d10:	00812783          	lw	a5,8(sp)
80407d14:	06078663          	beqz	a5,80407d80 <user_main+0xac>
80407d18:	00c10713          	addi	a4,sp,12
80407d1c:	00000793          	li	a5,0
80407d20:	00470713          	addi	a4,a4,4
80407d24:	ffc72683          	lw	a3,-4(a4)
80407d28:	00178793          	addi	a5,a5,1
80407d2c:	fe069ae3          	bnez	a3,80407d20 <user_main+0x4c>
80407d30:	10002773          	csrr	a4,sstatus
80407d34:	10076713          	ori	a4,a4,256
80407d38:	10071073          	csrw	sstatus,a4
80407d3c:	1424d073          	csrwi	scause,9
80407d40:	00810713          	addi	a4,sp,8
80407d44:	00000517          	auipc	a0,0x0
80407d48:	01c50513          	addi	a0,a0,28 # 80407d60 <user_main+0x8c>
80407d4c:	14151073          	csrw	sepc,a0
80407d50:	00400513          	li	a0,4
80407d54:	00040593          	mv	a1,s0
80407d58:	00078613          	mv	a2,a5
80407d5c:	00070693          	mv	a3,a4
80407d60:	f40f906f          	j	804014a0 <__alltraps>
80407d64:	00050413          	mv	s0,a0
80407d68:	0000e617          	auipc	a2,0xe
80407d6c:	85c60613          	addi	a2,a2,-1956 # 804155c4 <CSWTCH.69+0x86c>
80407d70:	40400593          	li	a1,1028
80407d74:	0000e517          	auipc	a0,0xe
80407d78:	86c50513          	addi	a0,a0,-1940 # 804155e0 <CSWTCH.69+0x888>
80407d7c:	8a9f80ef          	jal	ra,80400624 <__panic>
80407d80:	00000793          	li	a5,0
80407d84:	fadff06f          	j	80407d30 <user_main+0x5c>

80407d88 <setup_pgdir.isra.4>:
80407d88:	fe010113          	addi	sp,sp,-32
80407d8c:	01212823          	sw	s2,16(sp)
80407d90:	00050913          	mv	s2,a0
80407d94:	00100513          	li	a0,1
80407d98:	00112e23          	sw	ra,28(sp)
80407d9c:	00812c23          	sw	s0,24(sp)
80407da0:	00912a23          	sw	s1,20(sp)
80407da4:	01312623          	sw	s3,12(sp)
80407da8:	01412423          	sw	s4,8(sp)
80407dac:	dd5fa0ef          	jal	ra,80402b80 <alloc_pages>
80407db0:	0c050263          	beqz	a0,80407e74 <setup_pgdir.isra.4+0xec>
80407db4:	00095a17          	auipc	s4,0x95
80407db8:	a58a0a13          	addi	s4,s4,-1448 # 8049c80c <pages>
80407dbc:	000a2683          	lw	a3,0(s4)
80407dc0:	0000f797          	auipc	a5,0xf
80407dc4:	0a078793          	addi	a5,a5,160 # 80416e60 <nbase>
80407dc8:	0007a983          	lw	s3,0(a5)
80407dcc:	40d506b3          	sub	a3,a0,a3
80407dd0:	00095797          	auipc	a5,0x95
80407dd4:	9cc78793          	addi	a5,a5,-1588 # 8049c79c <npage>
80407dd8:	4056d693          	srai	a3,a3,0x5
80407ddc:	013686b3          	add	a3,a3,s3
80407de0:	0007a703          	lw	a4,0(a5)
80407de4:	00c69793          	slli	a5,a3,0xc
80407de8:	00c7d793          	srli	a5,a5,0xc
80407dec:	00050413          	mv	s0,a0
80407df0:	00c69693          	slli	a3,a3,0xc
80407df4:	08e7f463          	bgeu	a5,a4,80407e7c <setup_pgdir.isra.4+0xf4>
80407df8:	00095797          	auipc	a5,0x95
80407dfc:	a0c78793          	addi	a5,a5,-1524 # 8049c804 <va_pa_offset>
80407e00:	0007a483          	lw	s1,0(a5)
80407e04:	00095797          	auipc	a5,0x95
80407e08:	99478793          	addi	a5,a5,-1644 # 8049c798 <boot_pgdir>
80407e0c:	0007a583          	lw	a1,0(a5)
80407e10:	009684b3          	add	s1,a3,s1
80407e14:	00001637          	lui	a2,0x1
80407e18:	00048513          	mv	a0,s1
80407e1c:	6040b0ef          	jal	ra,80413420 <memcpy>
80407e20:	000a2703          	lw	a4,0(s4)
80407e24:	000017b7          	lui	a5,0x1
80407e28:	00f487b3          	add	a5,s1,a5
80407e2c:	40e40433          	sub	s0,s0,a4
80407e30:	40545413          	srai	s0,s0,0x5
80407e34:	01340433          	add	s0,s0,s3
80407e38:	00a41413          	slli	s0,s0,0xa
80407e3c:	0c146713          	ori	a4,s0,193
80407e40:	0c746413          	ori	s0,s0,199
80407e44:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x7054>
80407e48:	fa87a823          	sw	s0,-80(a5)
80407e4c:	00992023          	sw	s1,0(s2)
80407e50:	00000513          	li	a0,0
80407e54:	01c12083          	lw	ra,28(sp)
80407e58:	01812403          	lw	s0,24(sp)
80407e5c:	01412483          	lw	s1,20(sp)
80407e60:	01012903          	lw	s2,16(sp)
80407e64:	00c12983          	lw	s3,12(sp)
80407e68:	00812a03          	lw	s4,8(sp)
80407e6c:	02010113          	addi	sp,sp,32
80407e70:	00008067          	ret
80407e74:	ffc00513          	li	a0,-4
80407e78:	fddff06f          	j	80407e54 <setup_pgdir.isra.4+0xcc>
80407e7c:	0000c617          	auipc	a2,0xc
80407e80:	21060613          	addi	a2,a2,528 # 8041408c <default_pmm_manager+0x30>
80407e84:	06e00593          	li	a1,110
80407e88:	0000c517          	auipc	a0,0xc
80407e8c:	22850513          	addi	a0,a0,552 # 804140b0 <default_pmm_manager+0x54>
80407e90:	f94f80ef          	jal	ra,80400624 <__panic>

80407e94 <set_proc_name>:
80407e94:	ff010113          	addi	sp,sp,-16
80407e98:	00812423          	sw	s0,8(sp)
80407e9c:	06050413          	addi	s0,a0,96
80407ea0:	00912223          	sw	s1,4(sp)
80407ea4:	03300613          	li	a2,51
80407ea8:	00058493          	mv	s1,a1
80407eac:	00040513          	mv	a0,s0
80407eb0:	00000593          	li	a1,0
80407eb4:	00112623          	sw	ra,12(sp)
80407eb8:	4f80b0ef          	jal	ra,804133b0 <memset>
80407ebc:	00040513          	mv	a0,s0
80407ec0:	00812403          	lw	s0,8(sp)
80407ec4:	00c12083          	lw	ra,12(sp)
80407ec8:	00048593          	mv	a1,s1
80407ecc:	00412483          	lw	s1,4(sp)
80407ed0:	03200613          	li	a2,50
80407ed4:	01010113          	addi	sp,sp,16
80407ed8:	5480b06f          	j	80413420 <memcpy>

80407edc <proc_run>:
80407edc:	ff010113          	addi	sp,sp,-16
80407ee0:	00095797          	auipc	a5,0x95
80407ee4:	8d078793          	addi	a5,a5,-1840 # 8049c7b0 <current>
80407ee8:	00912223          	sw	s1,4(sp)
80407eec:	0007a483          	lw	s1,0(a5)
80407ef0:	00112623          	sw	ra,12(sp)
80407ef4:	00812423          	sw	s0,8(sp)
80407ef8:	01212023          	sw	s2,0(sp)
80407efc:	04a48463          	beq	s1,a0,80407f44 <proc_run+0x68>
80407f00:	00050413          	mv	s0,a0
80407f04:	100027f3          	csrr	a5,sstatus
80407f08:	0027f793          	andi	a5,a5,2
80407f0c:	00000913          	li	s2,0
80407f10:	06079263          	bnez	a5,80407f74 <proc_run+0x98>
80407f14:	05842783          	lw	a5,88(s0)
80407f18:	00095717          	auipc	a4,0x95
80407f1c:	88872c23          	sw	s0,-1896(a4) # 8049c7b0 <current>
80407f20:	80000737          	lui	a4,0x80000
80407f24:	00c7d793          	srli	a5,a5,0xc
80407f28:	00e7e7b3          	or	a5,a5,a4
80407f2c:	18079073          	csrw	satp,a5
80407f30:	12000073          	sfence.vma
80407f34:	01c40593          	addi	a1,s0,28
80407f38:	01c48513          	addi	a0,s1,28
80407f3c:	2d5010ef          	jal	ra,80409a10 <switch_to>
80407f40:	00091e63          	bnez	s2,80407f5c <proc_run+0x80>
80407f44:	00c12083          	lw	ra,12(sp)
80407f48:	00812403          	lw	s0,8(sp)
80407f4c:	00412483          	lw	s1,4(sp)
80407f50:	00012903          	lw	s2,0(sp)
80407f54:	01010113          	addi	sp,sp,16
80407f58:	00008067          	ret
80407f5c:	00812403          	lw	s0,8(sp)
80407f60:	00c12083          	lw	ra,12(sp)
80407f64:	00412483          	lw	s1,4(sp)
80407f68:	00012903          	lw	s2,0(sp)
80407f6c:	01010113          	addi	sp,sp,16
80407f70:	cb5f806f          	j	80400c24 <intr_enable>
80407f74:	cb9f80ef          	jal	ra,80400c2c <intr_disable>
80407f78:	00100913          	li	s2,1
80407f7c:	f99ff06f          	j	80407f14 <proc_run+0x38>

80407f80 <find_proc>:
80407f80:	000027b7          	lui	a5,0x2
80407f84:	fff50713          	addi	a4,a0,-1
80407f88:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
80407f8c:	04e7ec63          	bltu	a5,a4,80407fe4 <find_proc+0x64>
80407f90:	ff010113          	addi	sp,sp,-16
80407f94:	00a00593          	li	a1,10
80407f98:	00812423          	sw	s0,8(sp)
80407f9c:	00112623          	sw	ra,12(sp)
80407fa0:	00050413          	mv	s0,a0
80407fa4:	3cd0a0ef          	jal	ra,80412b70 <hash32>
80407fa8:	00091797          	auipc	a5,0x91
80407fac:	7a078793          	addi	a5,a5,1952 # 80499748 <hash_list>
80407fb0:	00351513          	slli	a0,a0,0x3
80407fb4:	00f50533          	add	a0,a0,a5
80407fb8:	00050793          	mv	a5,a0
80407fbc:	00c0006f          	j	80407fc8 <find_proc+0x48>
80407fc0:	f687a703          	lw	a4,-152(a5)
80407fc4:	02870463          	beq	a4,s0,80407fec <find_proc+0x6c>
80407fc8:	0047a783          	lw	a5,4(a5)
80407fcc:	fef51ae3          	bne	a0,a5,80407fc0 <find_proc+0x40>
80407fd0:	00c12083          	lw	ra,12(sp)
80407fd4:	00812403          	lw	s0,8(sp)
80407fd8:	00000513          	li	a0,0
80407fdc:	01010113          	addi	sp,sp,16
80407fe0:	00008067          	ret
80407fe4:	00000513          	li	a0,0
80407fe8:	00008067          	ret
80407fec:	00c12083          	lw	ra,12(sp)
80407ff0:	00812403          	lw	s0,8(sp)
80407ff4:	f6478513          	addi	a0,a5,-156
80407ff8:	01010113          	addi	sp,sp,16
80407ffc:	00008067          	ret

80408000 <do_fork>:
80408000:	fc010113          	addi	sp,sp,-64
80408004:	03612023          	sw	s6,32(sp)
80408008:	00094b17          	auipc	s6,0x94
8040800c:	7b4b0b13          	addi	s6,s6,1972 # 8049c7bc <nr_process>
80408010:	000b2783          	lw	a5,0(s6)
80408014:	03212823          	sw	s2,48(sp)
80408018:	02112e23          	sw	ra,60(sp)
8040801c:	02812c23          	sw	s0,56(sp)
80408020:	02912a23          	sw	s1,52(sp)
80408024:	03312623          	sw	s3,44(sp)
80408028:	03412423          	sw	s4,40(sp)
8040802c:	03512223          	sw	s5,36(sp)
80408030:	01712e23          	sw	s7,28(sp)
80408034:	01812c23          	sw	s8,24(sp)
80408038:	01912a23          	sw	s9,20(sp)
8040803c:	01a12823          	sw	s10,16(sp)
80408040:	01b12623          	sw	s11,12(sp)
80408044:	00001937          	lui	s2,0x1
80408048:	4927da63          	bge	a5,s2,804084dc <do_fork+0x4dc>
8040804c:	00050993          	mv	s3,a0
80408050:	00058a93          	mv	s5,a1
80408054:	00060493          	mv	s1,a2
80408058:	ae9ff0ef          	jal	ra,80407b40 <alloc_proc>
8040805c:	00050413          	mv	s0,a0
80408060:	3c050263          	beqz	a0,80408424 <do_fork+0x424>
80408064:	00094a17          	auipc	s4,0x94
80408068:	74ca0a13          	addi	s4,s4,1868 # 8049c7b0 <current>
8040806c:	000a2783          	lw	a5,0(s4)
80408070:	0a87a703          	lw	a4,168(a5)
80408074:	00f52a23          	sw	a5,20(a0)
80408078:	48071263          	bnez	a4,804084fc <do_fork+0x4fc>
8040807c:	00200513          	li	a0,2
80408080:	b01fa0ef          	jal	ra,80402b80 <alloc_pages>
80408084:	38050c63          	beqz	a0,8040841c <do_fork+0x41c>
80408088:	00094c17          	auipc	s8,0x94
8040808c:	784c0c13          	addi	s8,s8,1924 # 8049c80c <pages>
80408090:	000c2683          	lw	a3,0(s8)
80408094:	0000f797          	auipc	a5,0xf
80408098:	dcc78793          	addi	a5,a5,-564 # 80416e60 <nbase>
8040809c:	0007ab83          	lw	s7,0(a5)
804080a0:	40d506b3          	sub	a3,a0,a3
804080a4:	4056d693          	srai	a3,a3,0x5
804080a8:	00094c97          	auipc	s9,0x94
804080ac:	6f4c8c93          	addi	s9,s9,1780 # 8049c79c <npage>
804080b0:	017686b3          	add	a3,a3,s7
804080b4:	000ca703          	lw	a4,0(s9)
804080b8:	00c69793          	slli	a5,a3,0xc
804080bc:	00c7d793          	srli	a5,a5,0xc
804080c0:	00c69693          	slli	a3,a3,0xc
804080c4:	42e7f063          	bgeu	a5,a4,804084e4 <do_fork+0x4e4>
804080c8:	00094d17          	auipc	s10,0x94
804080cc:	73cd0d13          	addi	s10,s10,1852 # 8049c804 <va_pa_offset>
804080d0:	000a2703          	lw	a4,0(s4)
804080d4:	000d2783          	lw	a5,0(s10)
804080d8:	0dc72d83          	lw	s11,220(a4) # 800000dc <end+0xffb6381c>
804080dc:	00d786b3          	add	a3,a5,a3
804080e0:	00d42623          	sw	a3,12(s0)
804080e4:	420d8c63          	beqz	s11,8040851c <do_fork+0x51c>
804080e8:	80090913          	addi	s2,s2,-2048 # 800 <_binary_bin_swap_img_size-0x7800>
804080ec:	0129f933          	and	s2,s3,s2
804080f0:	2a090463          	beqz	s2,80408398 <do_fork+0x398>
804080f4:	008da783          	lw	a5,8(s11)
804080f8:	01872903          	lw	s2,24(a4)
804080fc:	00178793          	addi	a5,a5,1
80408100:	00fda423          	sw	a5,8(s11)
80408104:	0db42e23          	sw	s11,220(s0)
80408108:	02090a63          	beqz	s2,8040813c <do_fork+0x13c>
8040810c:	1009f993          	andi	s3,s3,256
80408110:	2a098663          	beqz	s3,804083bc <do_fork+0x3bc>
80408114:	01892783          	lw	a5,24(s2)
80408118:	00c92683          	lw	a3,12(s2)
8040811c:	80400737          	lui	a4,0x80400
80408120:	00178793          	addi	a5,a5,1
80408124:	00f92c23          	sw	a5,24(s2)
80408128:	01242c23          	sw	s2,24(s0)
8040812c:	40e6e863          	bltu	a3,a4,8040853c <do_fork+0x53c>
80408130:	000d2783          	lw	a5,0(s10)
80408134:	40f686b3          	sub	a3,a3,a5
80408138:	04d42c23          	sw	a3,88(s0)
8040813c:	00c42783          	lw	a5,12(s0)
80408140:	00002737          	lui	a4,0x2
80408144:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_bin_swap_img_size-0x6090>
80408148:	00e787b3          	add	a5,a5,a4
8040814c:	04f42a23          	sw	a5,84(s0)
80408150:	00078713          	mv	a4,a5
80408154:	09048813          	addi	a6,s1,144
80408158:	0004a503          	lw	a0,0(s1)
8040815c:	0044a583          	lw	a1,4(s1)
80408160:	0084a603          	lw	a2,8(s1)
80408164:	00c4a683          	lw	a3,12(s1)
80408168:	00a72023          	sw	a0,0(a4)
8040816c:	00b72223          	sw	a1,4(a4)
80408170:	00c72423          	sw	a2,8(a4)
80408174:	00d72623          	sw	a3,12(a4)
80408178:	01048493          	addi	s1,s1,16
8040817c:	01070713          	addi	a4,a4,16
80408180:	fd049ce3          	bne	s1,a6,80408158 <do_fork+0x158>
80408184:	0207a423          	sw	zero,40(a5)
80408188:	1a0a8663          	beqz	s5,80408334 <do_fork+0x334>
8040818c:	0157a423          	sw	s5,8(a5)
80408190:	00000717          	auipc	a4,0x0
80408194:	a9470713          	addi	a4,a4,-1388 # 80407c24 <forkret>
80408198:	00e42e23          	sw	a4,28(s0)
8040819c:	02f42023          	sw	a5,32(s0)
804081a0:	100027f3          	csrr	a5,sstatus
804081a4:	0027f793          	andi	a5,a5,2
804081a8:	00000913          	li	s2,0
804081ac:	1a079863          	bnez	a5,8040835c <do_fork+0x35c>
804081b0:	00091797          	auipc	a5,0x91
804081b4:	e9478793          	addi	a5,a5,-364 # 80499044 <last_pid>
804081b8:	0007a503          	lw	a0,0(a5)
804081bc:	000027b7          	lui	a5,0x2
804081c0:	00150513          	addi	a0,a0,1
804081c4:	00091717          	auipc	a4,0x91
804081c8:	e8a72023          	sw	a0,-384(a4) # 80499044 <last_pid>
804081cc:	1af55c63          	bge	a0,a5,80408384 <do_fork+0x384>
804081d0:	00091797          	auipc	a5,0x91
804081d4:	e7878793          	addi	a5,a5,-392 # 80499048 <next_safe>
804081d8:	0007a783          	lw	a5,0(a5)
804081dc:	00094497          	auipc	s1,0x94
804081e0:	6dc48493          	addi	s1,s1,1756 # 8049c8b8 <proc_list>
804081e4:	06f54c63          	blt	a0,a5,8040825c <do_fork+0x25c>
804081e8:	000027b7          	lui	a5,0x2
804081ec:	00091717          	auipc	a4,0x91
804081f0:	e4f72e23          	sw	a5,-420(a4) # 80499048 <next_safe>
804081f4:	00000593          	li	a1,0
804081f8:	00050793          	mv	a5,a0
804081fc:	00094497          	auipc	s1,0x94
80408200:	6bc48493          	addi	s1,s1,1724 # 8049c8b8 <proc_list>
80408204:	000028b7          	lui	a7,0x2
80408208:	00058813          	mv	a6,a1
8040820c:	00002637          	lui	a2,0x2
80408210:	00094697          	auipc	a3,0x94
80408214:	6a868693          	addi	a3,a3,1704 # 8049c8b8 <proc_list>
80408218:	0046a683          	lw	a3,4(a3)
8040821c:	02968263          	beq	a3,s1,80408240 <do_fork+0x240>
80408220:	f706a703          	lw	a4,-144(a3)
80408224:	10f70063          	beq	a4,a5,80408324 <do_fork+0x324>
80408228:	fee7d8e3          	bge	a5,a4,80408218 <do_fork+0x218>
8040822c:	fec756e3          	bge	a4,a2,80408218 <do_fork+0x218>
80408230:	0046a683          	lw	a3,4(a3)
80408234:	00070613          	mv	a2,a4
80408238:	00100813          	li	a6,1
8040823c:	fe9692e3          	bne	a3,s1,80408220 <do_fork+0x220>
80408240:	00058863          	beqz	a1,80408250 <do_fork+0x250>
80408244:	00091717          	auipc	a4,0x91
80408248:	e0f72023          	sw	a5,-512(a4) # 80499044 <last_pid>
8040824c:	00078513          	mv	a0,a5
80408250:	00080663          	beqz	a6,8040825c <do_fork+0x25c>
80408254:	00091797          	auipc	a5,0x91
80408258:	dec7aa23          	sw	a2,-524(a5) # 80499048 <next_safe>
8040825c:	00a00593          	li	a1,10
80408260:	00a42223          	sw	a0,4(s0)
80408264:	10d0a0ef          	jal	ra,80412b70 <hash32>
80408268:	00091797          	auipc	a5,0x91
8040826c:	4e078793          	addi	a5,a5,1248 # 80499748 <hash_list>
80408270:	00351513          	slli	a0,a0,0x3
80408274:	00f50533          	add	a0,a0,a5
80408278:	00452583          	lw	a1,4(a0)
8040827c:	01442683          	lw	a3,20(s0)
80408280:	09c40793          	addi	a5,s0,156
80408284:	00f5a023          	sw	a5,0(a1)
80408288:	0044a603          	lw	a2,4(s1)
8040828c:	00f52223          	sw	a5,4(a0)
80408290:	0ac6a703          	lw	a4,172(a3)
80408294:	09440793          	addi	a5,s0,148
80408298:	0ab42023          	sw	a1,160(s0)
8040829c:	08a42e23          	sw	a0,156(s0)
804082a0:	00f62023          	sw	a5,0(a2) # 2000 <_binary_bin_swap_img_size-0x6000>
804082a4:	00094597          	auipc	a1,0x94
804082a8:	60f5ac23          	sw	a5,1560(a1) # 8049c8bc <proc_list+0x4>
804082ac:	08c42c23          	sw	a2,152(s0)
804082b0:	08942a23          	sw	s1,148(s0)
804082b4:	0a042823          	sw	zero,176(s0)
804082b8:	0ae42a23          	sw	a4,180(s0)
804082bc:	00070463          	beqz	a4,804082c4 <do_fork+0x2c4>
804082c0:	0a872823          	sw	s0,176(a4)
804082c4:	000b2783          	lw	a5,0(s6)
804082c8:	0a86a623          	sw	s0,172(a3)
804082cc:	00178793          	addi	a5,a5,1
804082d0:	00094717          	auipc	a4,0x94
804082d4:	4ef72623          	sw	a5,1260(a4) # 8049c7bc <nr_process>
804082d8:	14091a63          	bnez	s2,8040842c <do_fork+0x42c>
804082dc:	00040513          	mv	a0,s0
804082e0:	294050ef          	jal	ra,8040d574 <wakeup_proc>
804082e4:	00442503          	lw	a0,4(s0)
804082e8:	03c12083          	lw	ra,60(sp)
804082ec:	03812403          	lw	s0,56(sp)
804082f0:	03412483          	lw	s1,52(sp)
804082f4:	03012903          	lw	s2,48(sp)
804082f8:	02c12983          	lw	s3,44(sp)
804082fc:	02812a03          	lw	s4,40(sp)
80408300:	02412a83          	lw	s5,36(sp)
80408304:	02012b03          	lw	s6,32(sp)
80408308:	01c12b83          	lw	s7,28(sp)
8040830c:	01812c03          	lw	s8,24(sp)
80408310:	01412c83          	lw	s9,20(sp)
80408314:	01012d03          	lw	s10,16(sp)
80408318:	00c12d83          	lw	s11,12(sp)
8040831c:	04010113          	addi	sp,sp,64
80408320:	00008067          	ret
80408324:	00178793          	addi	a5,a5,1
80408328:	18c7dc63          	bge	a5,a2,804084c0 <do_fork+0x4c0>
8040832c:	00100593          	li	a1,1
80408330:	ee9ff06f          	j	80408218 <do_fork+0x218>
80408334:	00078a93          	mv	s5,a5
80408338:	0157a423          	sw	s5,8(a5)
8040833c:	00000717          	auipc	a4,0x0
80408340:	8e870713          	addi	a4,a4,-1816 # 80407c24 <forkret>
80408344:	00e42e23          	sw	a4,28(s0)
80408348:	02f42023          	sw	a5,32(s0)
8040834c:	100027f3          	csrr	a5,sstatus
80408350:	0027f793          	andi	a5,a5,2
80408354:	00000913          	li	s2,0
80408358:	e4078ce3          	beqz	a5,804081b0 <do_fork+0x1b0>
8040835c:	8d1f80ef          	jal	ra,80400c2c <intr_disable>
80408360:	00091797          	auipc	a5,0x91
80408364:	ce478793          	addi	a5,a5,-796 # 80499044 <last_pid>
80408368:	0007a503          	lw	a0,0(a5)
8040836c:	000027b7          	lui	a5,0x2
80408370:	00100913          	li	s2,1
80408374:	00150513          	addi	a0,a0,1
80408378:	00091717          	auipc	a4,0x91
8040837c:	cca72623          	sw	a0,-820(a4) # 80499044 <last_pid>
80408380:	e4f548e3          	blt	a0,a5,804081d0 <do_fork+0x1d0>
80408384:	00100793          	li	a5,1
80408388:	00091717          	auipc	a4,0x91
8040838c:	caf72e23          	sw	a5,-836(a4) # 80499044 <last_pid>
80408390:	00100513          	li	a0,1
80408394:	e55ff06f          	j	804081e8 <do_fork+0x1e8>
80408398:	b45fe0ef          	jal	ra,80406edc <files_create>
8040839c:	00050913          	mv	s2,a0
804083a0:	04050263          	beqz	a0,804083e4 <do_fork+0x3e4>
804083a4:	000d8593          	mv	a1,s11
804083a8:	ce9fe0ef          	jal	ra,80407090 <dup_files>
804083ac:	12051263          	bnez	a0,804084d0 <do_fork+0x4d0>
804083b0:	000a2703          	lw	a4,0(s4)
804083b4:	00090d93          	mv	s11,s2
804083b8:	d3dff06f          	j	804080f4 <do_fork+0xf4>
804083bc:	905fc0ef          	jal	ra,80404cc0 <mm_create>
804083c0:	00050993          	mv	s3,a0
804083c4:	00050c63          	beqz	a0,804083dc <do_fork+0x3dc>
804083c8:	00c50513          	addi	a0,a0,12
804083cc:	9bdff0ef          	jal	ra,80407d88 <setup_pgdir.isra.4>
804083d0:	06050263          	beqz	a0,80408434 <do_fork+0x434>
804083d4:	00098513          	mv	a0,s3
804083d8:	afdfc0ef          	jal	ra,80404ed4 <mm_destroy>
804083dc:	00040513          	mv	a0,s0
804083e0:	825ff0ef          	jal	ra,80407c04 <put_files>
804083e4:	00c42683          	lw	a3,12(s0)
804083e8:	804007b7          	lui	a5,0x80400
804083ec:	18f6e063          	bltu	a3,a5,8040856c <do_fork+0x56c>
804083f0:	000d2703          	lw	a4,0(s10)
804083f4:	000ca783          	lw	a5,0(s9)
804083f8:	40e686b3          	sub	a3,a3,a4
804083fc:	00c6d693          	srli	a3,a3,0xc
80408400:	14f6fa63          	bgeu	a3,a5,80408554 <do_fork+0x554>
80408404:	000c2503          	lw	a0,0(s8)
80408408:	417686b3          	sub	a3,a3,s7
8040840c:	00569693          	slli	a3,a3,0x5
80408410:	00200593          	li	a1,2
80408414:	00d50533          	add	a0,a0,a3
80408418:	831fa0ef          	jal	ra,80402c48 <free_pages>
8040841c:	00040513          	mv	a0,s0
80408420:	d04fa0ef          	jal	ra,80402924 <kfree>
80408424:	ffc00513          	li	a0,-4
80408428:	ec1ff06f          	j	804082e8 <do_fork+0x2e8>
8040842c:	ff8f80ef          	jal	ra,80400c24 <intr_enable>
80408430:	eadff06f          	j	804082dc <do_fork+0x2dc>
80408434:	01c90d93          	addi	s11,s2,28
80408438:	000d8513          	mv	a0,s11
8040843c:	929fd0ef          	jal	ra,80405d64 <down>
80408440:	000a2783          	lw	a5,0(s4)
80408444:	00078663          	beqz	a5,80408450 <do_fork+0x450>
80408448:	0047a783          	lw	a5,4(a5) # 80400004 <end+0xfff63744>
8040844c:	02f92423          	sw	a5,40(s2)
80408450:	00090593          	mv	a1,s2
80408454:	00098513          	mv	a0,s3
80408458:	be9fc0ef          	jal	ra,80405040 <dup_mmap>
8040845c:	00050a13          	mv	s4,a0
80408460:	000d8513          	mv	a0,s11
80408464:	8fdfd0ef          	jal	ra,80405d60 <up>
80408468:	02092423          	sw	zero,40(s2)
8040846c:	00098913          	mv	s2,s3
80408470:	ca0a02e3          	beqz	s4,80408114 <do_fork+0x114>
80408474:	00098513          	mv	a0,s3
80408478:	ca9fc0ef          	jal	ra,80405120 <exit_mmap>
8040847c:	00c9a683          	lw	a3,12(s3)
80408480:	804007b7          	lui	a5,0x80400
80408484:	0ef6e463          	bltu	a3,a5,8040856c <do_fork+0x56c>
80408488:	000d2703          	lw	a4,0(s10)
8040848c:	000ca783          	lw	a5,0(s9)
80408490:	40e686b3          	sub	a3,a3,a4
80408494:	00c6d693          	srli	a3,a3,0xc
80408498:	0af6fe63          	bgeu	a3,a5,80408554 <do_fork+0x554>
8040849c:	000c2503          	lw	a0,0(s8)
804084a0:	417686b3          	sub	a3,a3,s7
804084a4:	00569693          	slli	a3,a3,0x5
804084a8:	00d50533          	add	a0,a0,a3
804084ac:	00100593          	li	a1,1
804084b0:	f98fa0ef          	jal	ra,80402c48 <free_pages>
804084b4:	00098513          	mv	a0,s3
804084b8:	a1dfc0ef          	jal	ra,80404ed4 <mm_destroy>
804084bc:	f21ff06f          	j	804083dc <do_fork+0x3dc>
804084c0:	0117c463          	blt	a5,a7,804084c8 <do_fork+0x4c8>
804084c4:	00100793          	li	a5,1
804084c8:	00100593          	li	a1,1
804084cc:	d3dff06f          	j	80408208 <do_fork+0x208>
804084d0:	00090513          	mv	a0,s2
804084d4:	a5dfe0ef          	jal	ra,80406f30 <files_destroy>
804084d8:	f0dff06f          	j	804083e4 <do_fork+0x3e4>
804084dc:	ffb00513          	li	a0,-5
804084e0:	e09ff06f          	j	804082e8 <do_fork+0x2e8>
804084e4:	0000c617          	auipc	a2,0xc
804084e8:	ba860613          	addi	a2,a2,-1112 # 8041408c <default_pmm_manager+0x30>
804084ec:	06e00593          	li	a1,110
804084f0:	0000c517          	auipc	a0,0xc
804084f4:	bc050513          	addi	a0,a0,-1088 # 804140b0 <default_pmm_manager+0x54>
804084f8:	92cf80ef          	jal	ra,80400624 <__panic>
804084fc:	0000d697          	auipc	a3,0xd
80408500:	e6468693          	addi	a3,a3,-412 # 80415360 <CSWTCH.69+0x608>
80408504:	0000b617          	auipc	a2,0xb
80408508:	2dc60613          	addi	a2,a2,732 # 804137e0 <commands+0x1bc>
8040850c:	1ef00593          	li	a1,495
80408510:	0000d517          	auipc	a0,0xd
80408514:	0d050513          	addi	a0,a0,208 # 804155e0 <CSWTCH.69+0x888>
80408518:	90cf80ef          	jal	ra,80400624 <__panic>
8040851c:	0000d697          	auipc	a3,0xd
80408520:	e6068693          	addi	a3,a3,-416 # 8041537c <CSWTCH.69+0x624>
80408524:	0000b617          	auipc	a2,0xb
80408528:	2bc60613          	addi	a2,a2,700 # 804137e0 <commands+0x1bc>
8040852c:	19500593          	li	a1,405
80408530:	0000d517          	auipc	a0,0xd
80408534:	0b050513          	addi	a0,a0,176 # 804155e0 <CSWTCH.69+0x888>
80408538:	8ecf80ef          	jal	ra,80400624 <__panic>
8040853c:	0000c617          	auipc	a2,0xc
80408540:	b8460613          	addi	a2,a2,-1148 # 804140c0 <default_pmm_manager+0x64>
80408544:	17600593          	li	a1,374
80408548:	0000d517          	auipc	a0,0xd
8040854c:	09850513          	addi	a0,a0,152 # 804155e0 <CSWTCH.69+0x888>
80408550:	8d4f80ef          	jal	ra,80400624 <__panic>
80408554:	0000c617          	auipc	a2,0xc
80408558:	b9060613          	addi	a2,a2,-1136 # 804140e4 <default_pmm_manager+0x88>
8040855c:	06900593          	li	a1,105
80408560:	0000c517          	auipc	a0,0xc
80408564:	b5050513          	addi	a0,a0,-1200 # 804140b0 <default_pmm_manager+0x54>
80408568:	8bcf80ef          	jal	ra,80400624 <__panic>
8040856c:	0000c617          	auipc	a2,0xc
80408570:	b5460613          	addi	a2,a2,-1196 # 804140c0 <default_pmm_manager+0x64>
80408574:	07000593          	li	a1,112
80408578:	0000c517          	auipc	a0,0xc
8040857c:	b3850513          	addi	a0,a0,-1224 # 804140b0 <default_pmm_manager+0x54>
80408580:	8a4f80ef          	jal	ra,80400624 <__panic>

80408584 <kernel_thread>:
80408584:	f6010113          	addi	sp,sp,-160
80408588:	08812c23          	sw	s0,152(sp)
8040858c:	08912a23          	sw	s1,148(sp)
80408590:	09212823          	sw	s2,144(sp)
80408594:	00058493          	mv	s1,a1
80408598:	00050913          	mv	s2,a0
8040859c:	00060413          	mv	s0,a2
804085a0:	00000593          	li	a1,0
804085a4:	09000613          	li	a2,144
804085a8:	00010513          	mv	a0,sp
804085ac:	08112e23          	sw	ra,156(sp)
804085b0:	6010a0ef          	jal	ra,804133b0 <memset>
804085b4:	03212023          	sw	s2,32(sp)
804085b8:	02912223          	sw	s1,36(sp)
804085bc:	100027f3          	csrr	a5,sstatus
804085c0:	edd7f793          	andi	a5,a5,-291
804085c4:	1207e793          	ori	a5,a5,288
804085c8:	08f12023          	sw	a5,128(sp)
804085cc:	00010613          	mv	a2,sp
804085d0:	10046513          	ori	a0,s0,256
804085d4:	fffff797          	auipc	a5,0xfffff
804085d8:	56078793          	addi	a5,a5,1376 # 80407b34 <kernel_thread_entry>
804085dc:	00000593          	li	a1,0
804085e0:	08f12223          	sw	a5,132(sp)
804085e4:	a1dff0ef          	jal	ra,80408000 <do_fork>
804085e8:	09c12083          	lw	ra,156(sp)
804085ec:	09812403          	lw	s0,152(sp)
804085f0:	09412483          	lw	s1,148(sp)
804085f4:	09012903          	lw	s2,144(sp)
804085f8:	0a010113          	addi	sp,sp,160
804085fc:	00008067          	ret

80408600 <do_exit>:
80408600:	fe010113          	addi	sp,sp,-32
80408604:	00912a23          	sw	s1,20(sp)
80408608:	00094717          	auipc	a4,0x94
8040860c:	1ac70713          	addi	a4,a4,428 # 8049c7b4 <idleproc>
80408610:	00094497          	auipc	s1,0x94
80408614:	1a048493          	addi	s1,s1,416 # 8049c7b0 <current>
80408618:	0004a783          	lw	a5,0(s1)
8040861c:	00072703          	lw	a4,0(a4)
80408620:	00112e23          	sw	ra,28(sp)
80408624:	00812c23          	sw	s0,24(sp)
80408628:	01212823          	sw	s2,16(sp)
8040862c:	01312623          	sw	s3,12(sp)
80408630:	01412423          	sw	s4,8(sp)
80408634:	12e78263          	beq	a5,a4,80408758 <do_exit+0x158>
80408638:	00094417          	auipc	s0,0x94
8040863c:	18040413          	addi	s0,s0,384 # 8049c7b8 <initproc>
80408640:	00042703          	lw	a4,0(s0)
80408644:	18e78e63          	beq	a5,a4,804087e0 <do_exit+0x1e0>
80408648:	0187a903          	lw	s2,24(a5)
8040864c:	00050993          	mv	s3,a0
80408650:	02090e63          	beqz	s2,8040868c <do_exit+0x8c>
80408654:	00094797          	auipc	a5,0x94
80408658:	1b478793          	addi	a5,a5,436 # 8049c808 <boot_cr3>
8040865c:	0007a783          	lw	a5,0(a5)
80408660:	80000737          	lui	a4,0x80000
80408664:	00c7d793          	srli	a5,a5,0xc
80408668:	00e7e7b3          	or	a5,a5,a4
8040866c:	18079073          	csrw	satp,a5
80408670:	12000073          	sfence.vma
80408674:	01892783          	lw	a5,24(s2)
80408678:	fff78793          	addi	a5,a5,-1
8040867c:	00f92c23          	sw	a5,24(s2)
80408680:	0e078863          	beqz	a5,80408770 <do_exit+0x170>
80408684:	0004a783          	lw	a5,0(s1)
80408688:	0007ac23          	sw	zero,24(a5)
8040868c:	0004a503          	lw	a0,0(s1)
80408690:	d74ff0ef          	jal	ra,80407c04 <put_files>
80408694:	0004a783          	lw	a5,0(s1)
80408698:	00300713          	li	a4,3
8040869c:	00e7a023          	sw	a4,0(a5)
804086a0:	0b37a223          	sw	s3,164(a5)
804086a4:	100027f3          	csrr	a5,sstatus
804086a8:	0027f793          	andi	a5,a5,2
804086ac:	00000a13          	li	s4,0
804086b0:	14079463          	bnez	a5,804087f8 <do_exit+0x1f8>
804086b4:	0004a703          	lw	a4,0(s1)
804086b8:	800007b7          	lui	a5,0x80000
804086bc:	00178793          	addi	a5,a5,1 # 80000001 <end+0xffb63741>
804086c0:	01472503          	lw	a0,20(a4) # 80000014 <end+0xffb63754>
804086c4:	0a852703          	lw	a4,168(a0)
804086c8:	12f70e63          	beq	a4,a5,80408804 <do_exit+0x204>
804086cc:	0004a683          	lw	a3,0(s1)
804086d0:	800009b7          	lui	s3,0x80000
804086d4:	00300913          	li	s2,3
804086d8:	00198993          	addi	s3,s3,1 # 80000001 <end+0xffb63741>
804086dc:	0ac6a783          	lw	a5,172(a3)
804086e0:	04078463          	beqz	a5,80408728 <do_exit+0x128>
804086e4:	0b47a703          	lw	a4,180(a5)
804086e8:	00042503          	lw	a0,0(s0)
804086ec:	0ae6a623          	sw	a4,172(a3)
804086f0:	0ac52703          	lw	a4,172(a0)
804086f4:	0a07a823          	sw	zero,176(a5)
804086f8:	0ae7aa23          	sw	a4,180(a5)
804086fc:	00070463          	beqz	a4,80408704 <do_exit+0x104>
80408700:	0af72823          	sw	a5,176(a4)
80408704:	0007a703          	lw	a4,0(a5)
80408708:	00a7aa23          	sw	a0,20(a5)
8040870c:	0af52623          	sw	a5,172(a0)
80408710:	fd2716e3          	bne	a4,s2,804086dc <do_exit+0xdc>
80408714:	0a852783          	lw	a5,168(a0)
80408718:	fd3792e3          	bne	a5,s3,804086dc <do_exit+0xdc>
8040871c:	659040ef          	jal	ra,8040d574 <wakeup_proc>
80408720:	0004a683          	lw	a3,0(s1)
80408724:	fb9ff06f          	j	804086dc <do_exit+0xdc>
80408728:	020a1463          	bnez	s4,80408750 <do_exit+0x150>
8040872c:	745040ef          	jal	ra,8040d670 <schedule>
80408730:	0004a783          	lw	a5,0(s1)
80408734:	0000d617          	auipc	a2,0xd
80408738:	c0c60613          	addi	a2,a2,-1012 # 80415340 <CSWTCH.69+0x5e8>
8040873c:	24b00593          	li	a1,587
80408740:	0047a683          	lw	a3,4(a5)
80408744:	0000d517          	auipc	a0,0xd
80408748:	e9c50513          	addi	a0,a0,-356 # 804155e0 <CSWTCH.69+0x888>
8040874c:	ed9f70ef          	jal	ra,80400624 <__panic>
80408750:	cd4f80ef          	jal	ra,80400c24 <intr_enable>
80408754:	fd9ff06f          	j	8040872c <do_exit+0x12c>
80408758:	0000d617          	auipc	a2,0xd
8040875c:	bc860613          	addi	a2,a2,-1080 # 80415320 <CSWTCH.69+0x5c8>
80408760:	21b00593          	li	a1,539
80408764:	0000d517          	auipc	a0,0xd
80408768:	e7c50513          	addi	a0,a0,-388 # 804155e0 <CSWTCH.69+0x888>
8040876c:	eb9f70ef          	jal	ra,80400624 <__panic>
80408770:	00090513          	mv	a0,s2
80408774:	9adfc0ef          	jal	ra,80405120 <exit_mmap>
80408778:	00c92683          	lw	a3,12(s2)
8040877c:	804007b7          	lui	a5,0x80400
80408780:	08f6e663          	bltu	a3,a5,8040880c <do_exit+0x20c>
80408784:	00094797          	auipc	a5,0x94
80408788:	08078793          	addi	a5,a5,128 # 8049c804 <va_pa_offset>
8040878c:	0007a703          	lw	a4,0(a5)
80408790:	00094797          	auipc	a5,0x94
80408794:	00c78793          	addi	a5,a5,12 # 8049c79c <npage>
80408798:	0007a783          	lw	a5,0(a5)
8040879c:	40e686b3          	sub	a3,a3,a4
804087a0:	00c6d693          	srli	a3,a3,0xc
804087a4:	08f6f063          	bgeu	a3,a5,80408824 <do_exit+0x224>
804087a8:	0000e797          	auipc	a5,0xe
804087ac:	6b878793          	addi	a5,a5,1720 # 80416e60 <nbase>
804087b0:	0007a783          	lw	a5,0(a5)
804087b4:	00094717          	auipc	a4,0x94
804087b8:	05870713          	addi	a4,a4,88 # 8049c80c <pages>
804087bc:	00072503          	lw	a0,0(a4)
804087c0:	40f686b3          	sub	a3,a3,a5
804087c4:	00569693          	slli	a3,a3,0x5
804087c8:	00d50533          	add	a0,a0,a3
804087cc:	00100593          	li	a1,1
804087d0:	c78fa0ef          	jal	ra,80402c48 <free_pages>
804087d4:	00090513          	mv	a0,s2
804087d8:	efcfc0ef          	jal	ra,80404ed4 <mm_destroy>
804087dc:	ea9ff06f          	j	80408684 <do_exit+0x84>
804087e0:	0000d617          	auipc	a2,0xd
804087e4:	b5060613          	addi	a2,a2,-1200 # 80415330 <CSWTCH.69+0x5d8>
804087e8:	21e00593          	li	a1,542
804087ec:	0000d517          	auipc	a0,0xd
804087f0:	df450513          	addi	a0,a0,-524 # 804155e0 <CSWTCH.69+0x888>
804087f4:	e31f70ef          	jal	ra,80400624 <__panic>
804087f8:	c34f80ef          	jal	ra,80400c2c <intr_disable>
804087fc:	00100a13          	li	s4,1
80408800:	eb5ff06f          	j	804086b4 <do_exit+0xb4>
80408804:	571040ef          	jal	ra,8040d574 <wakeup_proc>
80408808:	ec5ff06f          	j	804086cc <do_exit+0xcc>
8040880c:	0000c617          	auipc	a2,0xc
80408810:	8b460613          	addi	a2,a2,-1868 # 804140c0 <default_pmm_manager+0x64>
80408814:	07000593          	li	a1,112
80408818:	0000c517          	auipc	a0,0xc
8040881c:	89850513          	addi	a0,a0,-1896 # 804140b0 <default_pmm_manager+0x54>
80408820:	e05f70ef          	jal	ra,80400624 <__panic>
80408824:	0000c617          	auipc	a2,0xc
80408828:	8c060613          	addi	a2,a2,-1856 # 804140e4 <default_pmm_manager+0x88>
8040882c:	06900593          	li	a1,105
80408830:	0000c517          	auipc	a0,0xc
80408834:	88050513          	addi	a0,a0,-1920 # 804140b0 <default_pmm_manager+0x54>
80408838:	dedf70ef          	jal	ra,80400624 <__panic>

8040883c <do_wait.part.8>:
8040883c:	fe010113          	addi	sp,sp,-32
80408840:	01412423          	sw	s4,8(sp)
80408844:	80000a37          	lui	s4,0x80000
80408848:	00912a23          	sw	s1,20(sp)
8040884c:	01212823          	sw	s2,16(sp)
80408850:	01312623          	sw	s3,12(sp)
80408854:	01512223          	sw	s5,4(sp)
80408858:	01612023          	sw	s6,0(sp)
8040885c:	00112e23          	sw	ra,28(sp)
80408860:	00812c23          	sw	s0,24(sp)
80408864:	00050993          	mv	s3,a0
80408868:	00058b13          	mv	s6,a1
8040886c:	00094917          	auipc	s2,0x94
80408870:	f4490913          	addi	s2,s2,-188 # 8049c7b0 <current>
80408874:	00300493          	li	s1,3
80408878:	00100a93          	li	s5,1
8040887c:	001a0a13          	addi	s4,s4,1 # 80000001 <end+0xffb63741>
80408880:	04098663          	beqz	s3,804088cc <do_wait.part.8+0x90>
80408884:	00098513          	mv	a0,s3
80408888:	ef8ff0ef          	jal	ra,80407f80 <find_proc>
8040888c:	00050413          	mv	s0,a0
80408890:	18050a63          	beqz	a0,80408a24 <do_wait.part.8+0x1e8>
80408894:	00092703          	lw	a4,0(s2)
80408898:	01452783          	lw	a5,20(a0)
8040889c:	18e79463          	bne	a5,a4,80408a24 <do_wait.part.8+0x1e8>
804088a0:	00052783          	lw	a5,0(a0)
804088a4:	04978463          	beq	a5,s1,804088ec <do_wait.part.8+0xb0>
804088a8:	01572023          	sw	s5,0(a4)
804088ac:	0b472423          	sw	s4,168(a4)
804088b0:	5c1040ef          	jal	ra,8040d670 <schedule>
804088b4:	00092783          	lw	a5,0(s2)
804088b8:	05c7a783          	lw	a5,92(a5)
804088bc:	0017f793          	andi	a5,a5,1
804088c0:	fc0780e3          	beqz	a5,80408880 <do_wait.part.8+0x44>
804088c4:	ff700513          	li	a0,-9
804088c8:	d39ff0ef          	jal	ra,80408600 <do_exit>
804088cc:	00092703          	lw	a4,0(s2)
804088d0:	0ac72403          	lw	s0,172(a4)
804088d4:	00041863          	bnez	s0,804088e4 <do_wait.part.8+0xa8>
804088d8:	14c0006f          	j	80408a24 <do_wait.part.8+0x1e8>
804088dc:	0b442403          	lw	s0,180(s0)
804088e0:	fc0404e3          	beqz	s0,804088a8 <do_wait.part.8+0x6c>
804088e4:	00042783          	lw	a5,0(s0)
804088e8:	fe979ae3          	bne	a5,s1,804088dc <do_wait.part.8+0xa0>
804088ec:	00094797          	auipc	a5,0x94
804088f0:	ec878793          	addi	a5,a5,-312 # 8049c7b4 <idleproc>
804088f4:	0007a783          	lw	a5,0(a5)
804088f8:	14878063          	beq	a5,s0,80408a38 <do_wait.part.8+0x1fc>
804088fc:	00094797          	auipc	a5,0x94
80408900:	ebc78793          	addi	a5,a5,-324 # 8049c7b8 <initproc>
80408904:	0007a783          	lw	a5,0(a5)
80408908:	12f40863          	beq	s0,a5,80408a38 <do_wait.part.8+0x1fc>
8040890c:	000b0663          	beqz	s6,80408918 <do_wait.part.8+0xdc>
80408910:	0a442783          	lw	a5,164(s0)
80408914:	00fb2023          	sw	a5,0(s6)
80408918:	100027f3          	csrr	a5,sstatus
8040891c:	0027f793          	andi	a5,a5,2
80408920:	00000593          	li	a1,0
80408924:	10079463          	bnez	a5,80408a2c <do_wait.part.8+0x1f0>
80408928:	09c42603          	lw	a2,156(s0)
8040892c:	0a042683          	lw	a3,160(s0)
80408930:	0b442703          	lw	a4,180(s0)
80408934:	0b042783          	lw	a5,176(s0)
80408938:	00d62223          	sw	a3,4(a2)
8040893c:	00c6a023          	sw	a2,0(a3)
80408940:	09442603          	lw	a2,148(s0)
80408944:	09842683          	lw	a3,152(s0)
80408948:	00d62223          	sw	a3,4(a2)
8040894c:	00c6a023          	sw	a2,0(a3)
80408950:	00070663          	beqz	a4,8040895c <do_wait.part.8+0x120>
80408954:	0af72823          	sw	a5,176(a4)
80408958:	0b042783          	lw	a5,176(s0)
8040895c:	0a078e63          	beqz	a5,80408a18 <do_wait.part.8+0x1dc>
80408960:	0ae7aa23          	sw	a4,180(a5)
80408964:	00094797          	auipc	a5,0x94
80408968:	e5878793          	addi	a5,a5,-424 # 8049c7bc <nr_process>
8040896c:	0007a783          	lw	a5,0(a5)
80408970:	fff78793          	addi	a5,a5,-1
80408974:	00094717          	auipc	a4,0x94
80408978:	e4f72423          	sw	a5,-440(a4) # 8049c7bc <nr_process>
8040897c:	08059a63          	bnez	a1,80408a10 <do_wait.part.8+0x1d4>
80408980:	00c42683          	lw	a3,12(s0)
80408984:	804007b7          	lui	a5,0x80400
80408988:	0ef6e063          	bltu	a3,a5,80408a68 <do_wait.part.8+0x22c>
8040898c:	00094797          	auipc	a5,0x94
80408990:	e7878793          	addi	a5,a5,-392 # 8049c804 <va_pa_offset>
80408994:	0007a703          	lw	a4,0(a5)
80408998:	00094797          	auipc	a5,0x94
8040899c:	e0478793          	addi	a5,a5,-508 # 8049c79c <npage>
804089a0:	0007a783          	lw	a5,0(a5)
804089a4:	40e686b3          	sub	a3,a3,a4
804089a8:	00c6d693          	srli	a3,a3,0xc
804089ac:	0af6f263          	bgeu	a3,a5,80408a50 <do_wait.part.8+0x214>
804089b0:	0000e797          	auipc	a5,0xe
804089b4:	4b078793          	addi	a5,a5,1200 # 80416e60 <nbase>
804089b8:	0007a783          	lw	a5,0(a5)
804089bc:	00094717          	auipc	a4,0x94
804089c0:	e5070713          	addi	a4,a4,-432 # 8049c80c <pages>
804089c4:	00072503          	lw	a0,0(a4)
804089c8:	40f686b3          	sub	a3,a3,a5
804089cc:	00569693          	slli	a3,a3,0x5
804089d0:	00d50533          	add	a0,a0,a3
804089d4:	00200593          	li	a1,2
804089d8:	a70fa0ef          	jal	ra,80402c48 <free_pages>
804089dc:	00040513          	mv	a0,s0
804089e0:	f45f90ef          	jal	ra,80402924 <kfree>
804089e4:	00000513          	li	a0,0
804089e8:	01c12083          	lw	ra,28(sp)
804089ec:	01812403          	lw	s0,24(sp)
804089f0:	01412483          	lw	s1,20(sp)
804089f4:	01012903          	lw	s2,16(sp)
804089f8:	00c12983          	lw	s3,12(sp)
804089fc:	00812a03          	lw	s4,8(sp)
80408a00:	00412a83          	lw	s5,4(sp)
80408a04:	00012b03          	lw	s6,0(sp)
80408a08:	02010113          	addi	sp,sp,32
80408a0c:	00008067          	ret
80408a10:	a14f80ef          	jal	ra,80400c24 <intr_enable>
80408a14:	f6dff06f          	j	80408980 <do_wait.part.8+0x144>
80408a18:	01442783          	lw	a5,20(s0)
80408a1c:	0ae7a623          	sw	a4,172(a5)
80408a20:	f45ff06f          	j	80408964 <do_wait.part.8+0x128>
80408a24:	ffe00513          	li	a0,-2
80408a28:	fc1ff06f          	j	804089e8 <do_wait.part.8+0x1ac>
80408a2c:	a00f80ef          	jal	ra,80400c2c <intr_disable>
80408a30:	00100593          	li	a1,1
80408a34:	ef5ff06f          	j	80408928 <do_wait.part.8+0xec>
80408a38:	0000d617          	auipc	a2,0xd
80408a3c:	95860613          	addi	a2,a2,-1704 # 80415390 <CSWTCH.69+0x638>
80408a40:	3ad00593          	li	a1,941
80408a44:	0000d517          	auipc	a0,0xd
80408a48:	b9c50513          	addi	a0,a0,-1124 # 804155e0 <CSWTCH.69+0x888>
80408a4c:	bd9f70ef          	jal	ra,80400624 <__panic>
80408a50:	0000b617          	auipc	a2,0xb
80408a54:	69460613          	addi	a2,a2,1684 # 804140e4 <default_pmm_manager+0x88>
80408a58:	06900593          	li	a1,105
80408a5c:	0000b517          	auipc	a0,0xb
80408a60:	65450513          	addi	a0,a0,1620 # 804140b0 <default_pmm_manager+0x54>
80408a64:	bc1f70ef          	jal	ra,80400624 <__panic>
80408a68:	0000b617          	auipc	a2,0xb
80408a6c:	65860613          	addi	a2,a2,1624 # 804140c0 <default_pmm_manager+0x64>
80408a70:	07000593          	li	a1,112
80408a74:	0000b517          	auipc	a0,0xb
80408a78:	63c50513          	addi	a0,a0,1596 # 804140b0 <default_pmm_manager+0x54>
80408a7c:	ba9f70ef          	jal	ra,80400624 <__panic>

80408a80 <init_main>:
80408a80:	6b7377b7          	lui	a5,0x6b737
80408a84:	fe010113          	addi	sp,sp,-32
80408a88:	96478793          	addi	a5,a5,-1692 # 6b736964 <_binary_bin_sfs_img_size+0x6b6be964>
80408a8c:	00f12423          	sw	a5,8(sp)
80408a90:	000047b7          	lui	a5,0x4
80408a94:	a3078793          	addi	a5,a5,-1488 # 3a30 <_binary_bin_swap_img_size-0x45d0>
80408a98:	00810513          	addi	a0,sp,8
80408a9c:	00112e23          	sw	ra,28(sp)
80408aa0:	00f11623          	sh	a5,12(sp)
80408aa4:	00010723          	sb	zero,14(sp)
80408aa8:	021050ef          	jal	ra,8040e2c8 <vfs_set_bootfs>
80408aac:	0e051a63          	bnez	a0,80408ba0 <init_main+0x120>
80408ab0:	a04fa0ef          	jal	ra,80402cb4 <nr_free_pages>
80408ab4:	d45f90ef          	jal	ra,804027f8 <kallocated>
80408ab8:	00000613          	li	a2,0
80408abc:	00000593          	li	a1,0
80408ac0:	fffff517          	auipc	a0,0xfffff
80408ac4:	21450513          	addi	a0,a0,532 # 80407cd4 <user_main>
80408ac8:	abdff0ef          	jal	ra,80408584 <kernel_thread>
80408acc:	00a04663          	bgtz	a0,80408ad8 <init_main+0x58>
80408ad0:	0b80006f          	j	80408b88 <init_main+0x108>
80408ad4:	39d040ef          	jal	ra,8040d670 <schedule>
80408ad8:	00000593          	li	a1,0
80408adc:	00000513          	li	a0,0
80408ae0:	d5dff0ef          	jal	ra,8040883c <do_wait.part.8>
80408ae4:	fe0508e3          	beqz	a0,80408ad4 <init_main+0x54>
80408ae8:	be0fe0ef          	jal	ra,80406ec8 <fs_cleanup>
80408aec:	0000d517          	auipc	a0,0xd
80408af0:	8f850513          	addi	a0,a0,-1800 # 804153e4 <CSWTCH.69+0x68c>
80408af4:	f08f70ef          	jal	ra,804001fc <cprintf>
80408af8:	00094797          	auipc	a5,0x94
80408afc:	cc078793          	addi	a5,a5,-832 # 8049c7b8 <initproc>
80408b00:	0007a783          	lw	a5,0(a5)
80408b04:	0ac7a703          	lw	a4,172(a5)
80408b08:	06071063          	bnez	a4,80408b68 <init_main+0xe8>
80408b0c:	0b07a703          	lw	a4,176(a5)
80408b10:	04071c63          	bnez	a4,80408b68 <init_main+0xe8>
80408b14:	0b47a703          	lw	a4,180(a5)
80408b18:	04071863          	bnez	a4,80408b68 <init_main+0xe8>
80408b1c:	00094717          	auipc	a4,0x94
80408b20:	ca070713          	addi	a4,a4,-864 # 8049c7bc <nr_process>
80408b24:	00072683          	lw	a3,0(a4)
80408b28:	00200713          	li	a4,2
80408b2c:	0ce69863          	bne	a3,a4,80408bfc <init_main+0x17c>
80408b30:	00094697          	auipc	a3,0x94
80408b34:	d8868693          	addi	a3,a3,-632 # 8049c8b8 <proc_list>
80408b38:	0046a703          	lw	a4,4(a3)
80408b3c:	09478793          	addi	a5,a5,148
80408b40:	08f71e63          	bne	a4,a5,80408bdc <init_main+0x15c>
80408b44:	0006a783          	lw	a5,0(a3)
80408b48:	06f71a63          	bne	a4,a5,80408bbc <init_main+0x13c>
80408b4c:	0000d517          	auipc	a0,0xd
80408b50:	97850513          	addi	a0,a0,-1672 # 804154c4 <CSWTCH.69+0x76c>
80408b54:	ea8f70ef          	jal	ra,804001fc <cprintf>
80408b58:	01c12083          	lw	ra,28(sp)
80408b5c:	00000513          	li	a0,0
80408b60:	02010113          	addi	sp,sp,32
80408b64:	00008067          	ret
80408b68:	0000d697          	auipc	a3,0xd
80408b6c:	8a068693          	addi	a3,a3,-1888 # 80415408 <CSWTCH.69+0x6b0>
80408b70:	0000b617          	auipc	a2,0xb
80408b74:	c7060613          	addi	a2,a2,-912 # 804137e0 <commands+0x1bc>
80408b78:	42100593          	li	a1,1057
80408b7c:	0000d517          	auipc	a0,0xd
80408b80:	a6450513          	addi	a0,a0,-1436 # 804155e0 <CSWTCH.69+0x888>
80408b84:	aa1f70ef          	jal	ra,80400624 <__panic>
80408b88:	0000d617          	auipc	a2,0xd
80408b8c:	84060613          	addi	a2,a2,-1984 # 804153c8 <CSWTCH.69+0x670>
80408b90:	41500593          	li	a1,1045
80408b94:	0000d517          	auipc	a0,0xd
80408b98:	a4c50513          	addi	a0,a0,-1460 # 804155e0 <CSWTCH.69+0x888>
80408b9c:	a89f70ef          	jal	ra,80400624 <__panic>
80408ba0:	00050693          	mv	a3,a0
80408ba4:	0000d617          	auipc	a2,0xd
80408ba8:	80860613          	addi	a2,a2,-2040 # 804153ac <CSWTCH.69+0x654>
80408bac:	40d00593          	li	a1,1037
80408bb0:	0000d517          	auipc	a0,0xd
80408bb4:	a3050513          	addi	a0,a0,-1488 # 804155e0 <CSWTCH.69+0x888>
80408bb8:	a6df70ef          	jal	ra,80400624 <__panic>
80408bbc:	0000d697          	auipc	a3,0xd
80408bc0:	8d868693          	addi	a3,a3,-1832 # 80415494 <CSWTCH.69+0x73c>
80408bc4:	0000b617          	auipc	a2,0xb
80408bc8:	c1c60613          	addi	a2,a2,-996 # 804137e0 <commands+0x1bc>
80408bcc:	42400593          	li	a1,1060
80408bd0:	0000d517          	auipc	a0,0xd
80408bd4:	a1050513          	addi	a0,a0,-1520 # 804155e0 <CSWTCH.69+0x888>
80408bd8:	a4df70ef          	jal	ra,80400624 <__panic>
80408bdc:	0000d697          	auipc	a3,0xd
80408be0:	88868693          	addi	a3,a3,-1912 # 80415464 <CSWTCH.69+0x70c>
80408be4:	0000b617          	auipc	a2,0xb
80408be8:	bfc60613          	addi	a2,a2,-1028 # 804137e0 <commands+0x1bc>
80408bec:	42300593          	li	a1,1059
80408bf0:	0000d517          	auipc	a0,0xd
80408bf4:	9f050513          	addi	a0,a0,-1552 # 804155e0 <CSWTCH.69+0x888>
80408bf8:	a2df70ef          	jal	ra,80400624 <__panic>
80408bfc:	0000d697          	auipc	a3,0xd
80408c00:	85868693          	addi	a3,a3,-1960 # 80415454 <CSWTCH.69+0x6fc>
80408c04:	0000b617          	auipc	a2,0xb
80408c08:	bdc60613          	addi	a2,a2,-1060 # 804137e0 <commands+0x1bc>
80408c0c:	42200593          	li	a1,1058
80408c10:	0000d517          	auipc	a0,0xd
80408c14:	9d050513          	addi	a0,a0,-1584 # 804155e0 <CSWTCH.69+0x888>
80408c18:	a0df70ef          	jal	ra,80400624 <__panic>

80408c1c <do_execve>:
80408c1c:	e9010113          	addi	sp,sp,-368
80408c20:	15412c23          	sw	s4,344(sp)
80408c24:	00094a17          	auipc	s4,0x94
80408c28:	b8ca0a13          	addi	s4,s4,-1140 # 8049c7b0 <current>
80408c2c:	000a2683          	lw	a3,0(s4)
80408c30:	15612823          	sw	s6,336(sp)
80408c34:	16112623          	sw	ra,364(sp)
80408c38:	16812423          	sw	s0,360(sp)
80408c3c:	16912223          	sw	s1,356(sp)
80408c40:	17212023          	sw	s2,352(sp)
80408c44:	15312e23          	sw	s3,348(sp)
80408c48:	15512a23          	sw	s5,340(sp)
80408c4c:	15712623          	sw	s7,332(sp)
80408c50:	15812423          	sw	s8,328(sp)
80408c54:	15912223          	sw	s9,324(sp)
80408c58:	15a12023          	sw	s10,320(sp)
80408c5c:	13b12e23          	sw	s11,316(sp)
80408c60:	fff58713          	addi	a4,a1,-1
80408c64:	01f00793          	li	a5,31
80408c68:	0186ab03          	lw	s6,24(a3)
80408c6c:	70e7e063          	bltu	a5,a4,8040936c <do_execve+0x750>
80408c70:	00060d13          	mv	s10,a2
80408c74:	00050413          	mv	s0,a0
80408c78:	00058993          	mv	s3,a1
80408c7c:	03300613          	li	a2,51
80408c80:	00000593          	li	a1,0
80408c84:	04810513          	addi	a0,sp,72
80408c88:	7280a0ef          	jal	ra,804133b0 <memset>
80408c8c:	000b0e63          	beqz	s6,80408ca8 <do_execve+0x8c>
80408c90:	01cb0513          	addi	a0,s6,28
80408c94:	8d0fd0ef          	jal	ra,80405d64 <down>
80408c98:	000a2783          	lw	a5,0(s4)
80408c9c:	00078663          	beqz	a5,80408ca8 <do_execve+0x8c>
80408ca0:	0047a783          	lw	a5,4(a5)
80408ca4:	02fb2423          	sw	a5,40(s6)
80408ca8:	1e040863          	beqz	s0,80408e98 <do_execve+0x27c>
80408cac:	03300693          	li	a3,51
80408cb0:	00040613          	mv	a2,s0
80408cb4:	04810593          	addi	a1,sp,72
80408cb8:	000b0513          	mv	a0,s6
80408cbc:	db9fc0ef          	jal	ra,80405a74 <copy_string>
80408cc0:	020502e3          	beqz	a0,804094e4 <do_execve+0x8c8>
80408cc4:	00299493          	slli	s1,s3,0x2
80408cc8:	00000693          	li	a3,0
80408ccc:	00048613          	mv	a2,s1
80408cd0:	000d0593          	mv	a1,s10
80408cd4:	000b0513          	mv	a0,s6
80408cd8:	000d0c13          	mv	s8,s10
80408cdc:	c05fc0ef          	jal	ra,804058e0 <user_mem_check>
80408ce0:	7e050c63          	beqz	a0,804094d8 <do_execve+0x8bc>
80408ce4:	0b010913          	addi	s2,sp,176
80408ce8:	00090c93          	mv	s9,s2
80408cec:	00000413          	li	s0,0
80408cf0:	00001537          	lui	a0,0x1
80408cf4:	b0df90ef          	jal	ra,80402800 <kmalloc>
80408cf8:	00050a93          	mv	s5,a0
80408cfc:	10050863          	beqz	a0,80408e0c <do_execve+0x1f0>
80408d00:	000c2603          	lw	a2,0(s8)
80408d04:	00050593          	mv	a1,a0
80408d08:	000016b7          	lui	a3,0x1
80408d0c:	000b0513          	mv	a0,s6
80408d10:	d65fc0ef          	jal	ra,80405a74 <copy_string>
80408d14:	16050a63          	beqz	a0,80408e88 <do_execve+0x26c>
80408d18:	015ca023          	sw	s5,0(s9)
80408d1c:	00140413          	addi	s0,s0,1
80408d20:	004c8c93          	addi	s9,s9,4
80408d24:	004c0c13          	addi	s8,s8,4
80408d28:	fc8994e3          	bne	s3,s0,80408cf0 <do_execve+0xd4>
80408d2c:	000d2a83          	lw	s5,0(s10)
80408d30:	080b0c63          	beqz	s6,80408dc8 <do_execve+0x1ac>
80408d34:	01cb0513          	addi	a0,s6,28
80408d38:	828fd0ef          	jal	ra,80405d60 <up>
80408d3c:	000a2783          	lw	a5,0(s4)
80408d40:	020b2423          	sw	zero,40(s6)
80408d44:	0dc7a503          	lw	a0,220(a5)
80408d48:	ab4fe0ef          	jal	ra,80406ffc <files_closeall>
80408d4c:	00000593          	li	a1,0
80408d50:	000a8513          	mv	a0,s5
80408d54:	e7cfe0ef          	jal	ra,804073d0 <sysfile_open>
80408d58:	00050c13          	mv	s8,a0
80408d5c:	7e054e63          	bltz	a0,80409558 <do_execve+0x93c>
80408d60:	00094797          	auipc	a5,0x94
80408d64:	aa878793          	addi	a5,a5,-1368 # 8049c808 <boot_cr3>
80408d68:	0007a783          	lw	a5,0(a5)
80408d6c:	80000737          	lui	a4,0x80000
80408d70:	00c7d793          	srli	a5,a5,0xc
80408d74:	00e7e7b3          	or	a5,a5,a4
80408d78:	18079073          	csrw	satp,a5
80408d7c:	12000073          	sfence.vma
80408d80:	018b2783          	lw	a5,24(s6)
80408d84:	fff78793          	addi	a5,a5,-1
80408d88:	00fb2c23          	sw	a5,24(s6)
80408d8c:	3e078063          	beqz	a5,8040916c <do_execve+0x550>
80408d90:	000a2783          	lw	a5,0(s4)
80408d94:	0007ac23          	sw	zero,24(a5)
80408d98:	f29fb0ef          	jal	ra,80404cc0 <mm_create>
80408d9c:	00050b13          	mv	s6,a0
80408da0:	00050c63          	beqz	a0,80408db8 <do_execve+0x19c>
80408da4:	00c50513          	addi	a0,a0,12 # 100c <_binary_bin_swap_img_size-0x6ff4>
80408da8:	fe1fe0ef          	jal	ra,80407d88 <setup_pgdir.isra.4>
80408dac:	10050663          	beqz	a0,80408eb8 <do_execve+0x29c>
80408db0:	000b0513          	mv	a0,s6
80408db4:	920fc0ef          	jal	ra,80404ed4 <mm_destroy>
80408db8:	ffc00a93          	li	s5,-4
80408dbc:	ffc48413          	addi	s0,s1,-4
80408dc0:	00890433          	add	s0,s2,s0
80408dc4:	5900006f          	j	80409354 <do_execve+0x738>
80408dc8:	000a2783          	lw	a5,0(s4)
80408dcc:	0dc7a503          	lw	a0,220(a5)
80408dd0:	a2cfe0ef          	jal	ra,80406ffc <files_closeall>
80408dd4:	00000593          	li	a1,0
80408dd8:	000a8513          	mv	a0,s5
80408ddc:	df4fe0ef          	jal	ra,804073d0 <sysfile_open>
80408de0:	00050c13          	mv	s8,a0
80408de4:	76054a63          	bltz	a0,80409558 <do_execve+0x93c>
80408de8:	000a2783          	lw	a5,0(s4)
80408dec:	0187a783          	lw	a5,24(a5)
80408df0:	fa0784e3          	beqz	a5,80408d98 <do_execve+0x17c>
80408df4:	0000c617          	auipc	a2,0xc
80408df8:	3b860613          	addi	a2,a2,952 # 804151ac <CSWTCH.69+0x454>
80408dfc:	27900593          	li	a1,633
80408e00:	0000c517          	auipc	a0,0xc
80408e04:	7e050513          	addi	a0,a0,2016 # 804155e0 <CSWTCH.69+0x888>
80408e08:	81df70ef          	jal	ra,80400624 <__panic>
80408e0c:	ffc00a93          	li	s5,-4
80408e10:	02040463          	beqz	s0,80408e38 <do_execve+0x21c>
80408e14:	fff40413          	addi	s0,s0,-1
80408e18:	00241413          	slli	s0,s0,0x2
80408e1c:	00890433          	add	s0,s2,s0
80408e20:	0080006f          	j	80408e28 <do_execve+0x20c>
80408e24:	00078413          	mv	s0,a5
80408e28:	00042503          	lw	a0,0(s0)
80408e2c:	af9f90ef          	jal	ra,80402924 <kfree>
80408e30:	ffc40793          	addi	a5,s0,-4
80408e34:	fe8918e3          	bne	s2,s0,80408e24 <do_execve+0x208>
80408e38:	000b0863          	beqz	s6,80408e48 <do_execve+0x22c>
80408e3c:	01cb0513          	addi	a0,s6,28
80408e40:	f21fc0ef          	jal	ra,80405d60 <up>
80408e44:	020b2423          	sw	zero,40(s6)
80408e48:	16c12083          	lw	ra,364(sp)
80408e4c:	16812403          	lw	s0,360(sp)
80408e50:	000a8513          	mv	a0,s5
80408e54:	16412483          	lw	s1,356(sp)
80408e58:	16012903          	lw	s2,352(sp)
80408e5c:	15c12983          	lw	s3,348(sp)
80408e60:	15812a03          	lw	s4,344(sp)
80408e64:	15412a83          	lw	s5,340(sp)
80408e68:	15012b03          	lw	s6,336(sp)
80408e6c:	14c12b83          	lw	s7,332(sp)
80408e70:	14812c03          	lw	s8,328(sp)
80408e74:	14412c83          	lw	s9,324(sp)
80408e78:	14012d03          	lw	s10,320(sp)
80408e7c:	13c12d83          	lw	s11,316(sp)
80408e80:	17010113          	addi	sp,sp,368
80408e84:	00008067          	ret
80408e88:	000a8513          	mv	a0,s5
80408e8c:	a99f90ef          	jal	ra,80402924 <kfree>
80408e90:	ffd00a93          	li	s5,-3
80408e94:	f7dff06f          	j	80408e10 <do_execve+0x1f4>
80408e98:	000a2783          	lw	a5,0(s4)
80408e9c:	0000c617          	auipc	a2,0xc
80408ea0:	30460613          	addi	a2,a2,772 # 804151a0 <CSWTCH.69+0x448>
80408ea4:	03300593          	li	a1,51
80408ea8:	0047a683          	lw	a3,4(a5)
80408eac:	04810513          	addi	a0,sp,72
80408eb0:	3e40a0ef          	jal	ra,80413294 <snprintf>
80408eb4:	e11ff06f          	j	80408cc4 <do_execve+0xa8>
80408eb8:	00000693          	li	a3,0
80408ebc:	03400613          	li	a2,52
80408ec0:	07c10593          	addi	a1,sp,124
80408ec4:	000c0513          	mv	a0,s8
80408ec8:	d75fe0ef          	jal	ra,80407c3c <load_icode_read>
80408ecc:	00050a93          	mv	s5,a0
80408ed0:	22051a63          	bnez	a0,80409104 <do_execve+0x4e8>
80408ed4:	07c12703          	lw	a4,124(sp)
80408ed8:	464c47b7          	lui	a5,0x464c4
80408edc:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644c57f>
80408ee0:	22f71063          	bne	a4,a5,80409100 <do_execve+0x4e4>
80408ee4:	0a815783          	lhu	a5,168(sp)
80408ee8:	00012e23          	sw	zero,28(sp)
80408eec:	04078c63          	beqz	a5,80408f44 <do_execve+0x328>
80408ef0:	001007b7          	lui	a5,0x100
80408ef4:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
80408ef8:	00f12c23          	sw	a5,24(sp)
80408efc:	01c12783          	lw	a5,28(sp)
80408f00:	09812683          	lw	a3,152(sp)
80408f04:	02000613          	li	a2,32
80408f08:	00579793          	slli	a5,a5,0x5
80408f0c:	00d786b3          	add	a3,a5,a3
80408f10:	02810593          	addi	a1,sp,40
80408f14:	000c0513          	mv	a0,s8
80408f18:	d25fe0ef          	jal	ra,80407c3c <load_icode_read>
80408f1c:	00050a93          	mv	s5,a0
80408f20:	40051863          	bnez	a0,80409330 <do_execve+0x714>
80408f24:	02812703          	lw	a4,40(sp)
80408f28:	00100793          	li	a5,1
80408f2c:	2af70863          	beq	a4,a5,804091dc <do_execve+0x5c0>
80408f30:	01c12703          	lw	a4,28(sp)
80408f34:	0a815783          	lhu	a5,168(sp)
80408f38:	00170713          	addi	a4,a4,1 # 80000001 <end+0xffb63741>
80408f3c:	00e12e23          	sw	a4,28(sp)
80408f40:	faf76ee3          	bltu	a4,a5,80408efc <do_execve+0x2e0>
80408f44:	000c0513          	mv	a0,s8
80408f48:	ce0fe0ef          	jal	ra,80407428 <sysfile_close>
80408f4c:	00000713          	li	a4,0
80408f50:	00b00693          	li	a3,11
80408f54:	00100637          	lui	a2,0x100
80408f58:	7ff005b7          	lui	a1,0x7ff00
80408f5c:	000b0513          	mv	a0,s6
80408f60:	fe9fb0ef          	jal	ra,80404f48 <mm_map>
80408f64:	00050a93          	mv	s5,a0
80408f68:	3c051463          	bnez	a0,80409330 <do_execve+0x714>
80408f6c:	00cb2503          	lw	a0,12(s6)
80408f70:	01f00613          	li	a2,31
80408f74:	7ffff5b7          	lui	a1,0x7ffff
80408f78:	f70fa0ef          	jal	ra,804036e8 <pgdir_alloc_page>
80408f7c:	66050a63          	beqz	a0,804095f0 <do_execve+0x9d4>
80408f80:	00cb2503          	lw	a0,12(s6)
80408f84:	01f00613          	li	a2,31
80408f88:	7fffe5b7          	lui	a1,0x7fffe
80408f8c:	f5cfa0ef          	jal	ra,804036e8 <pgdir_alloc_page>
80408f90:	64050063          	beqz	a0,804095d0 <do_execve+0x9b4>
80408f94:	00cb2503          	lw	a0,12(s6)
80408f98:	01f00613          	li	a2,31
80408f9c:	7fffd5b7          	lui	a1,0x7fffd
80408fa0:	f48fa0ef          	jal	ra,804036e8 <pgdir_alloc_page>
80408fa4:	60050663          	beqz	a0,804095b0 <do_execve+0x994>
80408fa8:	00cb2503          	lw	a0,12(s6)
80408fac:	01f00613          	li	a2,31
80408fb0:	7fffc5b7          	lui	a1,0x7fffc
80408fb4:	f34fa0ef          	jal	ra,804036e8 <pgdir_alloc_page>
80408fb8:	5c050c63          	beqz	a0,80409590 <do_execve+0x974>
80408fbc:	018b2783          	lw	a5,24(s6)
80408fc0:	000a2703          	lw	a4,0(s4)
80408fc4:	00cb2683          	lw	a3,12(s6)
80408fc8:	00178793          	addi	a5,a5,1
80408fcc:	00fb2c23          	sw	a5,24(s6)
80408fd0:	01672c23          	sw	s6,24(a4)
80408fd4:	804007b7          	lui	a5,0x80400
80408fd8:	52f6ea63          	bltu	a3,a5,8040950c <do_execve+0x8f0>
80408fdc:	00094797          	auipc	a5,0x94
80408fe0:	82878793          	addi	a5,a5,-2008 # 8049c804 <va_pa_offset>
80408fe4:	0007a783          	lw	a5,0(a5)
80408fe8:	40f686b3          	sub	a3,a3,a5
80408fec:	00c6d793          	srli	a5,a3,0xc
80408ff0:	04d72c23          	sw	a3,88(a4)
80408ff4:	80000737          	lui	a4,0x80000
80408ff8:	00e7e7b3          	or	a5,a5,a4
80408ffc:	18079073          	csrw	satp,a5
80409000:	12000073          	sfence.vma
80409004:	00000c93          	li	s9,0
80409008:	00090c13          	mv	s8,s2
8040900c:	00000b93          	li	s7,0
80409010:	000c2503          	lw	a0,0(s8)
80409014:	000015b7          	lui	a1,0x1
80409018:	001b8b93          	addi	s7,s7,1
8040901c:	2e00a0ef          	jal	ra,804132fc <strnlen>
80409020:	00150513          	addi	a0,a0,1
80409024:	00ac8cb3          	add	s9,s9,a0
80409028:	004c0c13          	addi	s8,s8,4
8040902c:	ff3be2e3          	bltu	s7,s3,80409010 <do_execve+0x3f4>
80409030:	fffccc93          	not	s9,s9
80409034:	800007b7          	lui	a5,0x80000
80409038:	ffccfc93          	andi	s9,s9,-4
8040903c:	00fc8cb3          	add	s9,s9,a5
80409040:	409c8b33          	sub	s6,s9,s1
80409044:	412b07b3          	sub	a5,s6,s2
80409048:	00090c13          	mv	s8,s2
8040904c:	00000d93          	li	s11,0
80409050:	00000b93          	li	s7,0
80409054:	00f12623          	sw	a5,12(sp)
80409058:	000c2d03          	lw	s10,0(s8)
8040905c:	017c8533          	add	a0,s9,s7
80409060:	001d8d93          	addi	s11,s11,1
80409064:	000d0593          	mv	a1,s10
80409068:	2d00a0ef          	jal	ra,80413338 <strcpy>
8040906c:	00c12783          	lw	a5,12(sp)
80409070:	000015b7          	lui	a1,0x1
80409074:	01878733          	add	a4,a5,s8
80409078:	00a72023          	sw	a0,0(a4) # 80000000 <end+0xffb63740>
8040907c:	000d0513          	mv	a0,s10
80409080:	27c0a0ef          	jal	ra,804132fc <strnlen>
80409084:	01750bb3          	add	s7,a0,s7
80409088:	001b8b93          	addi	s7,s7,1
8040908c:	004c0c13          	addi	s8,s8,4
80409090:	fd3de4e3          	bltu	s11,s3,80409058 <do_execve+0x43c>
80409094:	000a2783          	lw	a5,0(s4)
80409098:	fe8b2e23          	sw	s0,-4(s6)
8040909c:	09000613          	li	a2,144
804090a0:	0547a403          	lw	s0,84(a5) # 80000054 <end+0xffb63794>
804090a4:	00000593          	li	a1,0
804090a8:	ffcb0b13          	addi	s6,s6,-4
804090ac:	08042983          	lw	s3,128(s0)
804090b0:	00040513          	mv	a0,s0
804090b4:	2fc0a0ef          	jal	ra,804133b0 <memset>
804090b8:	09412783          	lw	a5,148(sp)
804090bc:	edf9f993          	andi	s3,s3,-289
804090c0:	0209e993          	ori	s3,s3,32
804090c4:	ffc48493          	addi	s1,s1,-4
804090c8:	01642423          	sw	s6,8(s0)
804090cc:	08f42223          	sw	a5,132(s0)
804090d0:	09342023          	sw	s3,128(s0)
804090d4:	009904b3          	add	s1,s2,s1
804090d8:	0080006f          	j	804090e0 <do_execve+0x4c4>
804090dc:	00078493          	mv	s1,a5
804090e0:	0004a503          	lw	a0,0(s1)
804090e4:	841f90ef          	jal	ra,80402924 <kfree>
804090e8:	ffc48793          	addi	a5,s1,-4
804090ec:	fe9918e3          	bne	s2,s1,804090dc <do_execve+0x4c0>
804090f0:	000a2503          	lw	a0,0(s4)
804090f4:	04810593          	addi	a1,sp,72
804090f8:	d9dfe0ef          	jal	ra,80407e94 <set_proc_name>
804090fc:	d4dff06f          	j	80408e48 <do_execve+0x22c>
80409100:	ff800a93          	li	s5,-8
80409104:	00cb2683          	lw	a3,12(s6)
80409108:	804007b7          	lui	a5,0x80400
8040910c:	44f6ea63          	bltu	a3,a5,80409560 <do_execve+0x944>
80409110:	00093797          	auipc	a5,0x93
80409114:	6f478793          	addi	a5,a5,1780 # 8049c804 <va_pa_offset>
80409118:	0007a703          	lw	a4,0(a5)
8040911c:	00093797          	auipc	a5,0x93
80409120:	68078793          	addi	a5,a5,1664 # 8049c79c <npage>
80409124:	0007a783          	lw	a5,0(a5)
80409128:	40e686b3          	sub	a3,a3,a4
8040912c:	00c6d693          	srli	a3,a3,0xc
80409130:	44f6f463          	bgeu	a3,a5,80409578 <do_execve+0x95c>
80409134:	0000e797          	auipc	a5,0xe
80409138:	d2c78793          	addi	a5,a5,-724 # 80416e60 <nbase>
8040913c:	0007a783          	lw	a5,0(a5)
80409140:	00093717          	auipc	a4,0x93
80409144:	6cc70713          	addi	a4,a4,1740 # 8049c80c <pages>
80409148:	00072503          	lw	a0,0(a4)
8040914c:	40f686b3          	sub	a3,a3,a5
80409150:	00569693          	slli	a3,a3,0x5
80409154:	00d50533          	add	a0,a0,a3
80409158:	00100593          	li	a1,1
8040915c:	aedf90ef          	jal	ra,80402c48 <free_pages>
80409160:	000b0513          	mv	a0,s6
80409164:	d71fb0ef          	jal	ra,80404ed4 <mm_destroy>
80409168:	c55ff06f          	j	80408dbc <do_execve+0x1a0>
8040916c:	000b0513          	mv	a0,s6
80409170:	fb1fb0ef          	jal	ra,80405120 <exit_mmap>
80409174:	00cb2683          	lw	a3,12(s6)
80409178:	804007b7          	lui	a5,0x80400
8040917c:	3ef6e263          	bltu	a3,a5,80409560 <do_execve+0x944>
80409180:	00093797          	auipc	a5,0x93
80409184:	68478793          	addi	a5,a5,1668 # 8049c804 <va_pa_offset>
80409188:	0007a703          	lw	a4,0(a5)
8040918c:	00093797          	auipc	a5,0x93
80409190:	61078793          	addi	a5,a5,1552 # 8049c79c <npage>
80409194:	0007a783          	lw	a5,0(a5)
80409198:	40e686b3          	sub	a3,a3,a4
8040919c:	00c6d693          	srli	a3,a3,0xc
804091a0:	3cf6fc63          	bgeu	a3,a5,80409578 <do_execve+0x95c>
804091a4:	0000e797          	auipc	a5,0xe
804091a8:	cbc78793          	addi	a5,a5,-836 # 80416e60 <nbase>
804091ac:	0007a783          	lw	a5,0(a5)
804091b0:	00093717          	auipc	a4,0x93
804091b4:	65c70713          	addi	a4,a4,1628 # 8049c80c <pages>
804091b8:	00072503          	lw	a0,0(a4)
804091bc:	40f686b3          	sub	a3,a3,a5
804091c0:	00569693          	slli	a3,a3,0x5
804091c4:	00d50533          	add	a0,a0,a3
804091c8:	00100593          	li	a1,1
804091cc:	a7df90ef          	jal	ra,80402c48 <free_pages>
804091d0:	000b0513          	mv	a0,s6
804091d4:	d01fb0ef          	jal	ra,80404ed4 <mm_destroy>
804091d8:	bb9ff06f          	j	80408d90 <do_execve+0x174>
804091dc:	03c12603          	lw	a2,60(sp)
804091e0:	03812783          	lw	a5,56(sp)
804091e4:	32f66063          	bltu	a2,a5,80409504 <do_execve+0x8e8>
804091e8:	04012783          	lw	a5,64(sp)
804091ec:	0017f693          	andi	a3,a5,1
804091f0:	00068463          	beqz	a3,804091f8 <do_execve+0x5dc>
804091f4:	00400693          	li	a3,4
804091f8:	0027f713          	andi	a4,a5,2
804091fc:	0047f793          	andi	a5,a5,4
80409200:	12071e63          	bnez	a4,8040933c <do_execve+0x720>
80409204:	01100713          	li	a4,17
80409208:	00e12a23          	sw	a4,20(sp)
8040920c:	00078863          	beqz	a5,8040921c <do_execve+0x600>
80409210:	01300793          	li	a5,19
80409214:	0016e693          	ori	a3,a3,1
80409218:	00f12a23          	sw	a5,20(sp)
8040921c:	0026f793          	andi	a5,a3,2
80409220:	12079263          	bnez	a5,80409344 <do_execve+0x728>
80409224:	0046f793          	andi	a5,a3,4
80409228:	00078863          	beqz	a5,80409238 <do_execve+0x61c>
8040922c:	01412783          	lw	a5,20(sp)
80409230:	0087e793          	ori	a5,a5,8
80409234:	00f12a23          	sw	a5,20(sp)
80409238:	03012583          	lw	a1,48(sp)
8040923c:	00000713          	li	a4,0
80409240:	000b0513          	mv	a0,s6
80409244:	d05fb0ef          	jal	ra,80404f48 <mm_map>
80409248:	00050a93          	mv	s5,a0
8040924c:	0e051263          	bnez	a0,80409330 <do_execve+0x714>
80409250:	03012d83          	lw	s11,48(sp)
80409254:	03812783          	lw	a5,56(sp)
80409258:	fffff737          	lui	a4,0xfffff
8040925c:	02c12c83          	lw	s9,44(sp)
80409260:	00fd87b3          	add	a5,s11,a5
80409264:	00f12623          	sw	a5,12(sp)
80409268:	00edfd33          	and	s10,s11,a4
8040926c:	0afde463          	bltu	s11,a5,80409314 <do_execve+0x6f8>
80409270:	28c0006f          	j	804094fc <do_execve+0x8e0>
80409274:	000017b7          	lui	a5,0x1
80409278:	41ad85b3          	sub	a1,s11,s10
8040927c:	00fd0d33          	add	s10,s10,a5
80409280:	00c12783          	lw	a5,12(sp)
80409284:	41bd08b3          	sub	a7,s10,s11
80409288:	01a7f463          	bgeu	a5,s10,80409290 <do_execve+0x674>
8040928c:	41b788b3          	sub	a7,a5,s11
80409290:	00093797          	auipc	a5,0x93
80409294:	57c78793          	addi	a5,a5,1404 # 8049c80c <pages>
80409298:	0007a783          	lw	a5,0(a5)
8040929c:	0000e717          	auipc	a4,0xe
804092a0:	bc470713          	addi	a4,a4,-1084 # 80416e60 <nbase>
804092a4:	00072603          	lw	a2,0(a4)
804092a8:	00093717          	auipc	a4,0x93
804092ac:	4f470713          	addi	a4,a4,1268 # 8049c79c <npage>
804092b0:	00072683          	lw	a3,0(a4)
804092b4:	40fb87b3          	sub	a5,s7,a5
804092b8:	01812703          	lw	a4,24(sp)
804092bc:	4057d793          	srai	a5,a5,0x5
804092c0:	00c787b3          	add	a5,a5,a2
804092c4:	00e7f633          	and	a2,a5,a4
804092c8:	00c79793          	slli	a5,a5,0xc
804092cc:	26d67863          	bgeu	a2,a3,8040953c <do_execve+0x920>
804092d0:	00093717          	auipc	a4,0x93
804092d4:	53470713          	addi	a4,a4,1332 # 8049c804 <va_pa_offset>
804092d8:	00072503          	lw	a0,0(a4)
804092dc:	000c8693          	mv	a3,s9
804092e0:	00088613          	mv	a2,a7
804092e4:	00a787b3          	add	a5,a5,a0
804092e8:	00b785b3          	add	a1,a5,a1
804092ec:	000c0513          	mv	a0,s8
804092f0:	01112823          	sw	a7,16(sp)
804092f4:	949fe0ef          	jal	ra,80407c3c <load_icode_read>
804092f8:	00050a93          	mv	s5,a0
804092fc:	02051a63          	bnez	a0,80409330 <do_execve+0x714>
80409300:	01012883          	lw	a7,16(sp)
80409304:	00c12783          	lw	a5,12(sp)
80409308:	011d8db3          	add	s11,s11,a7
8040930c:	011c8cb3          	add	s9,s9,a7
80409310:	06fdf263          	bgeu	s11,a5,80409374 <do_execve+0x758>
80409314:	00cb2503          	lw	a0,12(s6)
80409318:	01412603          	lw	a2,20(sp)
8040931c:	000d0593          	mv	a1,s10
80409320:	bc8fa0ef          	jal	ra,804036e8 <pgdir_alloc_page>
80409324:	00050b93          	mv	s7,a0
80409328:	f40516e3          	bnez	a0,80409274 <do_execve+0x658>
8040932c:	ffc00a93          	li	s5,-4
80409330:	000b0513          	mv	a0,s6
80409334:	dedfb0ef          	jal	ra,80405120 <exit_mmap>
80409338:	dcdff06f          	j	80409104 <do_execve+0x4e8>
8040933c:	0026e693          	ori	a3,a3,2
80409340:	ec0798e3          	bnez	a5,80409210 <do_execve+0x5f4>
80409344:	01700793          	li	a5,23
80409348:	00f12a23          	sw	a5,20(sp)
8040934c:	ed9ff06f          	j	80409224 <do_execve+0x608>
80409350:	00078413          	mv	s0,a5
80409354:	00042503          	lw	a0,0(s0)
80409358:	dccf90ef          	jal	ra,80402924 <kfree>
8040935c:	ffc40793          	addi	a5,s0,-4
80409360:	fe8918e3          	bne	s2,s0,80409350 <do_execve+0x734>
80409364:	000a8513          	mv	a0,s5
80409368:	a98ff0ef          	jal	ra,80408600 <do_exit>
8040936c:	ffd00a93          	li	s5,-3
80409370:	ad9ff06f          	j	80408e48 <do_execve+0x22c>
80409374:	03012783          	lw	a5,48(sp)
80409378:	03c12a83          	lw	s5,60(sp)
8040937c:	01578ab3          	add	s5,a5,s5
80409380:	0badfa63          	bgeu	s11,s10,80409434 <do_execve+0x818>
80409384:	bbba86e3          	beq	s5,s11,80408f30 <do_execve+0x314>
80409388:	00001537          	lui	a0,0x1
8040938c:	00ad8533          	add	a0,s11,a0
80409390:	41a50533          	sub	a0,a0,s10
80409394:	41ba8cb3          	sub	s9,s5,s11
80409398:	01aae463          	bltu	s5,s10,804093a0 <do_execve+0x784>
8040939c:	41bd0cb3          	sub	s9,s10,s11
804093a0:	00093797          	auipc	a5,0x93
804093a4:	46c78793          	addi	a5,a5,1132 # 8049c80c <pages>
804093a8:	0007a783          	lw	a5,0(a5)
804093ac:	0000e717          	auipc	a4,0xe
804093b0:	ab470713          	addi	a4,a4,-1356 # 80416e60 <nbase>
804093b4:	00072683          	lw	a3,0(a4)
804093b8:	00093717          	auipc	a4,0x93
804093bc:	3e470713          	addi	a4,a4,996 # 8049c79c <npage>
804093c0:	00072603          	lw	a2,0(a4)
804093c4:	40fb87b3          	sub	a5,s7,a5
804093c8:	01812703          	lw	a4,24(sp)
804093cc:	4057d793          	srai	a5,a5,0x5
804093d0:	00d787b3          	add	a5,a5,a3
804093d4:	00e7f5b3          	and	a1,a5,a4
804093d8:	00c79693          	slli	a3,a5,0xc
804093dc:	14c5f463          	bgeu	a1,a2,80409524 <do_execve+0x908>
804093e0:	00093797          	auipc	a5,0x93
804093e4:	42478793          	addi	a5,a5,1060 # 8049c804 <va_pa_offset>
804093e8:	0007a783          	lw	a5,0(a5)
804093ec:	000c8613          	mv	a2,s9
804093f0:	00000593          	li	a1,0
804093f4:	00f687b3          	add	a5,a3,a5
804093f8:	00a78533          	add	a0,a5,a0
804093fc:	7b5090ef          	jal	ra,804133b0 <memset>
80409400:	01bc8833          	add	a6,s9,s11
80409404:	03aaf463          	bgeu	s5,s10,8040942c <do_execve+0x810>
80409408:	b30a84e3          	beq	s5,a6,80408f30 <do_execve+0x314>
8040940c:	0000c697          	auipc	a3,0xc
80409410:	dc868693          	addi	a3,a3,-568 # 804151d4 <CSWTCH.69+0x47c>
80409414:	0000a617          	auipc	a2,0xa
80409418:	3cc60613          	addi	a2,a2,972 # 804137e0 <commands+0x1bc>
8040941c:	2d000593          	li	a1,720
80409420:	0000c517          	auipc	a0,0xc
80409424:	1c050513          	addi	a0,a0,448 # 804155e0 <CSWTCH.69+0x888>
80409428:	9fcf70ef          	jal	ra,80400624 <__panic>
8040942c:	ffa810e3          	bne	a6,s10,8040940c <do_execve+0x7f0>
80409430:	000d0d93          	mv	s11,s10
80409434:	00093c97          	auipc	s9,0x93
80409438:	3d0c8c93          	addi	s9,s9,976 # 8049c804 <va_pa_offset>
8040943c:	075dee63          	bltu	s11,s5,804094b8 <do_execve+0x89c>
80409440:	af1ff06f          	j	80408f30 <do_execve+0x314>
80409444:	000017b7          	lui	a5,0x1
80409448:	41ad8533          	sub	a0,s11,s10
8040944c:	00fd0d33          	add	s10,s10,a5
80409450:	41bd0633          	sub	a2,s10,s11
80409454:	01aaf463          	bgeu	s5,s10,8040945c <do_execve+0x840>
80409458:	41ba8633          	sub	a2,s5,s11
8040945c:	00093797          	auipc	a5,0x93
80409460:	3b078793          	addi	a5,a5,944 # 8049c80c <pages>
80409464:	0007a683          	lw	a3,0(a5)
80409468:	0000e797          	auipc	a5,0xe
8040946c:	9f878793          	addi	a5,a5,-1544 # 80416e60 <nbase>
80409470:	0007a583          	lw	a1,0(a5)
80409474:	40db86b3          	sub	a3,s7,a3
80409478:	00093797          	auipc	a5,0x93
8040947c:	32478793          	addi	a5,a5,804 # 8049c79c <npage>
80409480:	01812703          	lw	a4,24(sp)
80409484:	4056d693          	srai	a3,a3,0x5
80409488:	0007a783          	lw	a5,0(a5)
8040948c:	00b686b3          	add	a3,a3,a1
80409490:	00e6f5b3          	and	a1,a3,a4
80409494:	00c69693          	slli	a3,a3,0xc
80409498:	08f5f663          	bgeu	a1,a5,80409524 <do_execve+0x908>
8040949c:	000ca783          	lw	a5,0(s9)
804094a0:	00cd8db3          	add	s11,s11,a2
804094a4:	00000593          	li	a1,0
804094a8:	00f686b3          	add	a3,a3,a5
804094ac:	00a68533          	add	a0,a3,a0
804094b0:	701090ef          	jal	ra,804133b0 <memset>
804094b4:	a75dfee3          	bgeu	s11,s5,80408f30 <do_execve+0x314>
804094b8:	00cb2503          	lw	a0,12(s6)
804094bc:	01412603          	lw	a2,20(sp)
804094c0:	000d0593          	mv	a1,s10
804094c4:	a24fa0ef          	jal	ra,804036e8 <pgdir_alloc_page>
804094c8:	00050b93          	mv	s7,a0
804094cc:	f6051ce3          	bnez	a0,80409444 <do_execve+0x828>
804094d0:	ffc00a93          	li	s5,-4
804094d4:	e5dff06f          	j	80409330 <do_execve+0x714>
804094d8:	ffd00a93          	li	s5,-3
804094dc:	960b10e3          	bnez	s6,80408e3c <do_execve+0x220>
804094e0:	969ff06f          	j	80408e48 <do_execve+0x22c>
804094e4:	e80b04e3          	beqz	s6,8040936c <do_execve+0x750>
804094e8:	01cb0513          	addi	a0,s6,28
804094ec:	875fc0ef          	jal	ra,80405d60 <up>
804094f0:	ffd00a93          	li	s5,-3
804094f4:	020b2423          	sw	zero,40(s6)
804094f8:	951ff06f          	j	80408e48 <do_execve+0x22c>
804094fc:	000d8793          	mv	a5,s11
80409500:	e79ff06f          	j	80409378 <do_execve+0x75c>
80409504:	ff800a93          	li	s5,-8
80409508:	e29ff06f          	j	80409330 <do_execve+0x714>
8040950c:	0000b617          	auipc	a2,0xb
80409510:	bb460613          	addi	a2,a2,-1100 # 804140c0 <default_pmm_manager+0x64>
80409514:	2ec00593          	li	a1,748
80409518:	0000c517          	auipc	a0,0xc
8040951c:	0c850513          	addi	a0,a0,200 # 804155e0 <CSWTCH.69+0x888>
80409520:	904f70ef          	jal	ra,80400624 <__panic>
80409524:	0000b617          	auipc	a2,0xb
80409528:	b6860613          	addi	a2,a2,-1176 # 8041408c <default_pmm_manager+0x30>
8040952c:	06e00593          	li	a1,110
80409530:	0000b517          	auipc	a0,0xb
80409534:	b8050513          	addi	a0,a0,-1152 # 804140b0 <default_pmm_manager+0x54>
80409538:	8ecf70ef          	jal	ra,80400624 <__panic>
8040953c:	00078693          	mv	a3,a5
80409540:	0000b617          	auipc	a2,0xb
80409544:	b4c60613          	addi	a2,a2,-1204 # 8041408c <default_pmm_manager+0x30>
80409548:	06e00593          	li	a1,110
8040954c:	0000b517          	auipc	a0,0xb
80409550:	b6450513          	addi	a0,a0,-1180 # 804140b0 <default_pmm_manager+0x54>
80409554:	8d0f70ef          	jal	ra,80400624 <__panic>
80409558:	000c0a93          	mv	s5,s8
8040955c:	861ff06f          	j	80408dbc <do_execve+0x1a0>
80409560:	0000b617          	auipc	a2,0xb
80409564:	b6060613          	addi	a2,a2,-1184 # 804140c0 <default_pmm_manager+0x64>
80409568:	07000593          	li	a1,112
8040956c:	0000b517          	auipc	a0,0xb
80409570:	b4450513          	addi	a0,a0,-1212 # 804140b0 <default_pmm_manager+0x54>
80409574:	8b0f70ef          	jal	ra,80400624 <__panic>
80409578:	0000b617          	auipc	a2,0xb
8040957c:	b6c60613          	addi	a2,a2,-1172 # 804140e4 <default_pmm_manager+0x88>
80409580:	06900593          	li	a1,105
80409584:	0000b517          	auipc	a0,0xb
80409588:	b2c50513          	addi	a0,a0,-1236 # 804140b0 <default_pmm_manager+0x54>
8040958c:	898f70ef          	jal	ra,80400624 <__panic>
80409590:	0000c697          	auipc	a3,0xc
80409594:	d4c68693          	addi	a3,a3,-692 # 804152dc <CSWTCH.69+0x584>
80409598:	0000a617          	auipc	a2,0xa
8040959c:	24860613          	addi	a2,a2,584 # 804137e0 <commands+0x1bc>
804095a0:	2e800593          	li	a1,744
804095a4:	0000c517          	auipc	a0,0xc
804095a8:	03c50513          	addi	a0,a0,60 # 804155e0 <CSWTCH.69+0x888>
804095ac:	878f70ef          	jal	ra,80400624 <__panic>
804095b0:	0000c697          	auipc	a3,0xc
804095b4:	ce868693          	addi	a3,a3,-792 # 80415298 <CSWTCH.69+0x540>
804095b8:	0000a617          	auipc	a2,0xa
804095bc:	22860613          	addi	a2,a2,552 # 804137e0 <commands+0x1bc>
804095c0:	2e700593          	li	a1,743
804095c4:	0000c517          	auipc	a0,0xc
804095c8:	01c50513          	addi	a0,a0,28 # 804155e0 <CSWTCH.69+0x888>
804095cc:	858f70ef          	jal	ra,80400624 <__panic>
804095d0:	0000c697          	auipc	a3,0xc
804095d4:	c8468693          	addi	a3,a3,-892 # 80415254 <CSWTCH.69+0x4fc>
804095d8:	0000a617          	auipc	a2,0xa
804095dc:	20860613          	addi	a2,a2,520 # 804137e0 <commands+0x1bc>
804095e0:	2e600593          	li	a1,742
804095e4:	0000c517          	auipc	a0,0xc
804095e8:	ffc50513          	addi	a0,a0,-4 # 804155e0 <CSWTCH.69+0x888>
804095ec:	838f70ef          	jal	ra,80400624 <__panic>
804095f0:	0000c697          	auipc	a3,0xc
804095f4:	c2068693          	addi	a3,a3,-992 # 80415210 <CSWTCH.69+0x4b8>
804095f8:	0000a617          	auipc	a2,0xa
804095fc:	1e860613          	addi	a2,a2,488 # 804137e0 <commands+0x1bc>
80409600:	2e500593          	li	a1,741
80409604:	0000c517          	auipc	a0,0xc
80409608:	fdc50513          	addi	a0,a0,-36 # 804155e0 <CSWTCH.69+0x888>
8040960c:	818f70ef          	jal	ra,80400624 <__panic>

80409610 <do_yield>:
80409610:	00093797          	auipc	a5,0x93
80409614:	1a078793          	addi	a5,a5,416 # 8049c7b0 <current>
80409618:	0007a783          	lw	a5,0(a5)
8040961c:	00100713          	li	a4,1
80409620:	00000513          	li	a0,0
80409624:	00e7a823          	sw	a4,16(a5)
80409628:	00008067          	ret

8040962c <do_wait>:
8040962c:	ff010113          	addi	sp,sp,-16
80409630:	00812423          	sw	s0,8(sp)
80409634:	00912223          	sw	s1,4(sp)
80409638:	00112623          	sw	ra,12(sp)
8040963c:	00058413          	mv	s0,a1
80409640:	00050493          	mv	s1,a0
80409644:	02058263          	beqz	a1,80409668 <do_wait+0x3c>
80409648:	00093797          	auipc	a5,0x93
8040964c:	16878793          	addi	a5,a5,360 # 8049c7b0 <current>
80409650:	0007a783          	lw	a5,0(a5)
80409654:	00100693          	li	a3,1
80409658:	00400613          	li	a2,4
8040965c:	0187a503          	lw	a0,24(a5)
80409660:	a80fc0ef          	jal	ra,804058e0 <user_mem_check>
80409664:	02050063          	beqz	a0,80409684 <do_wait+0x58>
80409668:	00040593          	mv	a1,s0
8040966c:	00812403          	lw	s0,8(sp)
80409670:	00c12083          	lw	ra,12(sp)
80409674:	00048513          	mv	a0,s1
80409678:	00412483          	lw	s1,4(sp)
8040967c:	01010113          	addi	sp,sp,16
80409680:	9bcff06f          	j	8040883c <do_wait.part.8>
80409684:	00c12083          	lw	ra,12(sp)
80409688:	00812403          	lw	s0,8(sp)
8040968c:	00412483          	lw	s1,4(sp)
80409690:	ffd00513          	li	a0,-3
80409694:	01010113          	addi	sp,sp,16
80409698:	00008067          	ret

8040969c <do_kill>:
8040969c:	ff010113          	addi	sp,sp,-16
804096a0:	00112623          	sw	ra,12(sp)
804096a4:	00812423          	sw	s0,8(sp)
804096a8:	8d9fe0ef          	jal	ra,80407f80 <find_proc>
804096ac:	04050c63          	beqz	a0,80409704 <do_kill+0x68>
804096b0:	05c52703          	lw	a4,92(a0)
804096b4:	00177693          	andi	a3,a4,1
804096b8:	04069263          	bnez	a3,804096fc <do_kill+0x60>
804096bc:	0a852683          	lw	a3,168(a0)
804096c0:	00176713          	ori	a4,a4,1
804096c4:	04e52e23          	sw	a4,92(a0)
804096c8:	00000413          	li	s0,0
804096cc:	0006cc63          	bltz	a3,804096e4 <do_kill+0x48>
804096d0:	00040513          	mv	a0,s0
804096d4:	00c12083          	lw	ra,12(sp)
804096d8:	00812403          	lw	s0,8(sp)
804096dc:	01010113          	addi	sp,sp,16
804096e0:	00008067          	ret
804096e4:	691030ef          	jal	ra,8040d574 <wakeup_proc>
804096e8:	00040513          	mv	a0,s0
804096ec:	00c12083          	lw	ra,12(sp)
804096f0:	00812403          	lw	s0,8(sp)
804096f4:	01010113          	addi	sp,sp,16
804096f8:	00008067          	ret
804096fc:	ff700413          	li	s0,-9
80409700:	fd1ff06f          	j	804096d0 <do_kill+0x34>
80409704:	ffd00413          	li	s0,-3
80409708:	fc9ff06f          	j	804096d0 <do_kill+0x34>

8040970c <proc_init>:
8040970c:	00002737          	lui	a4,0x2
80409710:	00093797          	auipc	a5,0x93
80409714:	1a878793          	addi	a5,a5,424 # 8049c8b8 <proc_list>
80409718:	ff010113          	addi	sp,sp,-16
8040971c:	00090697          	auipc	a3,0x90
80409720:	92e6a423          	sw	a4,-1752(a3) # 80499044 <last_pid>
80409724:	00090697          	auipc	a3,0x90
80409728:	92e6a223          	sw	a4,-1756(a3) # 80499048 <next_safe>
8040972c:	00093717          	auipc	a4,0x93
80409730:	18f72823          	sw	a5,400(a4) # 8049c8bc <proc_list+0x4>
80409734:	00093717          	auipc	a4,0x93
80409738:	18f72223          	sw	a5,388(a4) # 8049c8b8 <proc_list>
8040973c:	00112623          	sw	ra,12(sp)
80409740:	00812423          	sw	s0,8(sp)
80409744:	00912223          	sw	s1,4(sp)
80409748:	01212023          	sw	s2,0(sp)
8040974c:	00090797          	auipc	a5,0x90
80409750:	ffc78793          	addi	a5,a5,-4 # 80499748 <hash_list>
80409754:	00092717          	auipc	a4,0x92
80409758:	ff470713          	addi	a4,a4,-12 # 8049b748 <__rq>
8040975c:	00f7a223          	sw	a5,4(a5)
80409760:	00f7a023          	sw	a5,0(a5)
80409764:	00878793          	addi	a5,a5,8
80409768:	fee79ae3          	bne	a5,a4,8040975c <proc_init+0x50>
8040976c:	bd4fe0ef          	jal	ra,80407b40 <alloc_proc>
80409770:	00093797          	auipc	a5,0x93
80409774:	04a7a223          	sw	a0,68(a5) # 8049c7b4 <idleproc>
80409778:	00050413          	mv	s0,a0
8040977c:	00093497          	auipc	s1,0x93
80409780:	03848493          	addi	s1,s1,56 # 8049c7b4 <idleproc>
80409784:	0e050263          	beqz	a0,80409868 <proc_init+0x15c>
80409788:	00200793          	li	a5,2
8040978c:	00f52023          	sw	a5,0(a0)
80409790:	00100913          	li	s2,1
80409794:	0000e797          	auipc	a5,0xe
80409798:	86c78793          	addi	a5,a5,-1940 # 80417000 <bootstack>
8040979c:	00052223          	sw	zero,4(a0)
804097a0:	00f52623          	sw	a5,12(a0)
804097a4:	01252823          	sw	s2,16(a0)
804097a8:	f34fd0ef          	jal	ra,80406edc <files_create>
804097ac:	0ca42e23          	sw	a0,220(s0)
804097b0:	12050463          	beqz	a0,804098d8 <proc_init+0x1cc>
804097b4:	0004a503          	lw	a0,0(s1)
804097b8:	0000c597          	auipc	a1,0xc
804097bc:	d6458593          	addi	a1,a1,-668 # 8041551c <CSWTCH.69+0x7c4>
804097c0:	0dc52703          	lw	a4,220(a0)
804097c4:	00872783          	lw	a5,8(a4)
804097c8:	00178793          	addi	a5,a5,1
804097cc:	00f72423          	sw	a5,8(a4)
804097d0:	ec4fe0ef          	jal	ra,80407e94 <set_proc_name>
804097d4:	00093797          	auipc	a5,0x93
804097d8:	fe878793          	addi	a5,a5,-24 # 8049c7bc <nr_process>
804097dc:	0007a783          	lw	a5,0(a5)
804097e0:	0004a703          	lw	a4,0(s1)
804097e4:	00000613          	li	a2,0
804097e8:	00178793          	addi	a5,a5,1
804097ec:	00000593          	li	a1,0
804097f0:	fffff517          	auipc	a0,0xfffff
804097f4:	29050513          	addi	a0,a0,656 # 80408a80 <init_main>
804097f8:	00093697          	auipc	a3,0x93
804097fc:	fcf6a223          	sw	a5,-60(a3) # 8049c7bc <nr_process>
80409800:	00093797          	auipc	a5,0x93
80409804:	fae7a823          	sw	a4,-80(a5) # 8049c7b0 <current>
80409808:	d7dfe0ef          	jal	ra,80408584 <kernel_thread>
8040980c:	0aa05a63          	blez	a0,804098c0 <proc_init+0x1b4>
80409810:	f70fe0ef          	jal	ra,80407f80 <find_proc>
80409814:	0000c597          	auipc	a1,0xc
80409818:	d2c58593          	addi	a1,a1,-724 # 80415540 <CSWTCH.69+0x7e8>
8040981c:	00093797          	auipc	a5,0x93
80409820:	f8a7ae23          	sw	a0,-100(a5) # 8049c7b8 <initproc>
80409824:	e70fe0ef          	jal	ra,80407e94 <set_proc_name>
80409828:	0004a783          	lw	a5,0(s1)
8040982c:	06078a63          	beqz	a5,804098a0 <proc_init+0x194>
80409830:	0047a783          	lw	a5,4(a5)
80409834:	06079663          	bnez	a5,804098a0 <proc_init+0x194>
80409838:	00093797          	auipc	a5,0x93
8040983c:	f8078793          	addi	a5,a5,-128 # 8049c7b8 <initproc>
80409840:	0007a783          	lw	a5,0(a5)
80409844:	02078e63          	beqz	a5,80409880 <proc_init+0x174>
80409848:	0047a783          	lw	a5,4(a5)
8040984c:	03279a63          	bne	a5,s2,80409880 <proc_init+0x174>
80409850:	00c12083          	lw	ra,12(sp)
80409854:	00812403          	lw	s0,8(sp)
80409858:	00412483          	lw	s1,4(sp)
8040985c:	00012903          	lw	s2,0(sp)
80409860:	01010113          	addi	sp,sp,16
80409864:	00008067          	ret
80409868:	0000c617          	auipc	a2,0xc
8040986c:	c7860613          	addi	a2,a2,-904 # 804154e0 <CSWTCH.69+0x788>
80409870:	43a00593          	li	a1,1082
80409874:	0000c517          	auipc	a0,0xc
80409878:	d6c50513          	addi	a0,a0,-660 # 804155e0 <CSWTCH.69+0x888>
8040987c:	da9f60ef          	jal	ra,80400624 <__panic>
80409880:	0000c697          	auipc	a3,0xc
80409884:	cf068693          	addi	a3,a3,-784 # 80415570 <CSWTCH.69+0x818>
80409888:	0000a617          	auipc	a2,0xa
8040988c:	f5860613          	addi	a2,a2,-168 # 804137e0 <commands+0x1bc>
80409890:	45500593          	li	a1,1109
80409894:	0000c517          	auipc	a0,0xc
80409898:	d4c50513          	addi	a0,a0,-692 # 804155e0 <CSWTCH.69+0x888>
8040989c:	d89f60ef          	jal	ra,80400624 <__panic>
804098a0:	0000c697          	auipc	a3,0xc
804098a4:	ca868693          	addi	a3,a3,-856 # 80415548 <CSWTCH.69+0x7f0>
804098a8:	0000a617          	auipc	a2,0xa
804098ac:	f3860613          	addi	a2,a2,-200 # 804137e0 <commands+0x1bc>
804098b0:	45400593          	li	a1,1108
804098b4:	0000c517          	auipc	a0,0xc
804098b8:	d2c50513          	addi	a0,a0,-724 # 804155e0 <CSWTCH.69+0x888>
804098bc:	d69f60ef          	jal	ra,80400624 <__panic>
804098c0:	0000c617          	auipc	a2,0xc
804098c4:	c6460613          	addi	a2,a2,-924 # 80415524 <CSWTCH.69+0x7cc>
804098c8:	44e00593          	li	a1,1102
804098cc:	0000c517          	auipc	a0,0xc
804098d0:	d1450513          	addi	a0,a0,-748 # 804155e0 <CSWTCH.69+0x888>
804098d4:	d51f60ef          	jal	ra,80400624 <__panic>
804098d8:	0000c617          	auipc	a2,0xc
804098dc:	c2060613          	addi	a2,a2,-992 # 804154f8 <CSWTCH.69+0x7a0>
804098e0:	44300593          	li	a1,1091
804098e4:	0000c517          	auipc	a0,0xc
804098e8:	cfc50513          	addi	a0,a0,-772 # 804155e0 <CSWTCH.69+0x888>
804098ec:	d39f60ef          	jal	ra,80400624 <__panic>

804098f0 <cpu_idle>:
804098f0:	ff010113          	addi	sp,sp,-16
804098f4:	00812423          	sw	s0,8(sp)
804098f8:	00112623          	sw	ra,12(sp)
804098fc:	00093417          	auipc	s0,0x93
80409900:	eb440413          	addi	s0,s0,-332 # 8049c7b0 <current>
80409904:	00042703          	lw	a4,0(s0)
80409908:	01072783          	lw	a5,16(a4)
8040990c:	fe078ee3          	beqz	a5,80409908 <cpu_idle+0x18>
80409910:	561030ef          	jal	ra,8040d670 <schedule>
80409914:	ff1ff06f          	j	80409904 <cpu_idle+0x14>

80409918 <lab6_set_priority>:
80409918:	00093797          	auipc	a5,0x93
8040991c:	e9878793          	addi	a5,a5,-360 # 8049c7b0 <current>
80409920:	0007a783          	lw	a5,0(a5)
80409924:	00051863          	bnez	a0,80409934 <lab6_set_priority+0x1c>
80409928:	00100713          	li	a4,1
8040992c:	0ce7ac23          	sw	a4,216(a5)
80409930:	00008067          	ret
80409934:	0ca7ac23          	sw	a0,216(a5)
80409938:	00008067          	ret

8040993c <do_sleep>:
8040993c:	08050063          	beqz	a0,804099bc <do_sleep+0x80>
80409940:	fe010113          	addi	sp,sp,-32
80409944:	00812c23          	sw	s0,24(sp)
80409948:	00112e23          	sw	ra,28(sp)
8040994c:	00050413          	mv	s0,a0
80409950:	100027f3          	csrr	a5,sstatus
80409954:	0027f793          	andi	a5,a5,2
80409958:	06079663          	bnez	a5,804099c4 <do_sleep+0x88>
8040995c:	00093797          	auipc	a5,0x93
80409960:	e5478793          	addi	a5,a5,-428 # 8049c7b0 <current>
80409964:	0007a783          	lw	a5,0(a5)
80409968:	00810713          	addi	a4,sp,8
8040996c:	00a12023          	sw	a0,0(sp)
80409970:	00e12623          	sw	a4,12(sp)
80409974:	00e12423          	sw	a4,8(sp)
80409978:	00f12223          	sw	a5,4(sp)
8040997c:	00100713          	li	a4,1
80409980:	00e7a023          	sw	a4,0(a5)
80409984:	80000737          	lui	a4,0x80000
80409988:	00010413          	mv	s0,sp
8040998c:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63742>
80409990:	0ae7a423          	sw	a4,168(a5)
80409994:	00040513          	mv	a0,s0
80409998:	609030ef          	jal	ra,8040d7a0 <add_timer>
8040999c:	4d5030ef          	jal	ra,8040d670 <schedule>
804099a0:	00040513          	mv	a0,s0
804099a4:	709030ef          	jal	ra,8040d8ac <del_timer>
804099a8:	01c12083          	lw	ra,28(sp)
804099ac:	01812403          	lw	s0,24(sp)
804099b0:	00000513          	li	a0,0
804099b4:	02010113          	addi	sp,sp,32
804099b8:	00008067          	ret
804099bc:	00000513          	li	a0,0
804099c0:	00008067          	ret
804099c4:	a68f70ef          	jal	ra,80400c2c <intr_disable>
804099c8:	00093797          	auipc	a5,0x93
804099cc:	de878793          	addi	a5,a5,-536 # 8049c7b0 <current>
804099d0:	0007a783          	lw	a5,0(a5)
804099d4:	00810713          	addi	a4,sp,8
804099d8:	00812023          	sw	s0,0(sp)
804099dc:	00f12223          	sw	a5,4(sp)
804099e0:	00e12623          	sw	a4,12(sp)
804099e4:	00e12423          	sw	a4,8(sp)
804099e8:	00100713          	li	a4,1
804099ec:	00e7a023          	sw	a4,0(a5)
804099f0:	80000737          	lui	a4,0x80000
804099f4:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63742>
804099f8:	00010413          	mv	s0,sp
804099fc:	00040513          	mv	a0,s0
80409a00:	0ae7a423          	sw	a4,168(a5)
80409a04:	59d030ef          	jal	ra,8040d7a0 <add_timer>
80409a08:	a1cf70ef          	jal	ra,80400c24 <intr_enable>
80409a0c:	f91ff06f          	j	8040999c <do_sleep+0x60>

80409a10 <switch_to>:
80409a10:	00152023          	sw	ra,0(a0)
80409a14:	00252223          	sw	sp,4(a0)
80409a18:	00852423          	sw	s0,8(a0)
80409a1c:	00952623          	sw	s1,12(a0)
80409a20:	01252823          	sw	s2,16(a0)
80409a24:	01352a23          	sw	s3,20(a0)
80409a28:	01452c23          	sw	s4,24(a0)
80409a2c:	01552e23          	sw	s5,28(a0)
80409a30:	03652023          	sw	s6,32(a0)
80409a34:	03752223          	sw	s7,36(a0)
80409a38:	03852423          	sw	s8,40(a0)
80409a3c:	03952623          	sw	s9,44(a0)
80409a40:	03a52823          	sw	s10,48(a0)
80409a44:	03b52a23          	sw	s11,52(a0)
80409a48:	0005a083          	lw	ra,0(a1)
80409a4c:	0045a103          	lw	sp,4(a1)
80409a50:	0085a403          	lw	s0,8(a1)
80409a54:	00c5a483          	lw	s1,12(a1)
80409a58:	0105a903          	lw	s2,16(a1)
80409a5c:	0145a983          	lw	s3,20(a1)
80409a60:	0185aa03          	lw	s4,24(a1)
80409a64:	01c5aa83          	lw	s5,28(a1)
80409a68:	0205ab03          	lw	s6,32(a1)
80409a6c:	0245ab83          	lw	s7,36(a1)
80409a70:	0285ac03          	lw	s8,40(a1)
80409a74:	02c5ac83          	lw	s9,44(a1)
80409a78:	0305ad03          	lw	s10,48(a1)
80409a7c:	0345ad83          	lw	s11,52(a1)
80409a80:	00008067          	ret

80409a84 <proc_stride_comp_f>:
80409a84:	00c52503          	lw	a0,12(a0)
80409a88:	00c5a783          	lw	a5,12(a1)
80409a8c:	40f50533          	sub	a0,a0,a5
80409a90:	00a04863          	bgtz	a0,80409aa0 <proc_stride_comp_f+0x1c>
80409a94:	00a03533          	snez	a0,a0
80409a98:	40a00533          	neg	a0,a0
80409a9c:	00008067          	ret
80409aa0:	00100513          	li	a0,1
80409aa4:	00008067          	ret

80409aa8 <stride_init>:
80409aa8:	00a52223          	sw	a0,4(a0)
80409aac:	00a52023          	sw	a0,0(a0)
80409ab0:	00052823          	sw	zero,16(a0)
80409ab4:	00052423          	sw	zero,8(a0)
80409ab8:	00008067          	ret

80409abc <stride_pick_next>:
80409abc:	ff010113          	addi	sp,sp,-16
80409ac0:	00812423          	sw	s0,8(sp)
80409ac4:	01052403          	lw	s0,16(a0)
80409ac8:	00112623          	sw	ra,12(sp)
80409acc:	00912223          	sw	s1,4(sp)
80409ad0:	01212023          	sw	s2,0(sp)
80409ad4:	04040263          	beqz	s0,80409b18 <stride_pick_next+0x5c>
80409ad8:	01042583          	lw	a1,16(s0)
80409adc:	f3840913          	addi	s2,s0,-200
80409ae0:	00c42483          	lw	s1,12(s0)
80409ae4:	40000537          	lui	a0,0x40000
80409ae8:	02059463          	bnez	a1,80409b10 <stride_pick_next+0x54>
80409aec:	00a484b3          	add	s1,s1,a0
80409af0:	00942623          	sw	s1,12(s0)
80409af4:	00c12083          	lw	ra,12(sp)
80409af8:	00812403          	lw	s0,8(sp)
80409afc:	00090513          	mv	a0,s2
80409b00:	00412483          	lw	s1,4(sp)
80409b04:	00012903          	lw	s2,0(sp)
80409b08:	01010113          	addi	sp,sp,16
80409b0c:	00008067          	ret
80409b10:	161090ef          	jal	ra,80413470 <__udivsi3>
80409b14:	fd9ff06f          	j	80409aec <stride_pick_next+0x30>
80409b18:	00000913          	li	s2,0
80409b1c:	fd9ff06f          	j	80409af4 <stride_pick_next+0x38>

80409b20 <stride_proc_tick>:
80409b20:	0c45a783          	lw	a5,196(a1)
80409b24:	00f05663          	blez	a5,80409b30 <stride_proc_tick+0x10>
80409b28:	fff78793          	addi	a5,a5,-1
80409b2c:	0cf5a223          	sw	a5,196(a1)
80409b30:	00079663          	bnez	a5,80409b3c <stride_proc_tick+0x1c>
80409b34:	00100793          	li	a5,1
80409b38:	00f5a823          	sw	a5,16(a1)
80409b3c:	00008067          	ret

80409b40 <skew_heap_merge.constprop.3>:
80409b40:	ff010113          	addi	sp,sp,-16
80409b44:	00812423          	sw	s0,8(sp)
80409b48:	00112623          	sw	ra,12(sp)
80409b4c:	00912223          	sw	s1,4(sp)
80409b50:	01212023          	sw	s2,0(sp)
80409b54:	00058413          	mv	s0,a1
80409b58:	02050c63          	beqz	a0,80409b90 <skew_heap_merge.constprop.3+0x50>
80409b5c:	00050493          	mv	s1,a0
80409b60:	06058663          	beqz	a1,80409bcc <skew_heap_merge.constprop.3+0x8c>
80409b64:	f21ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409b68:	fff00793          	li	a5,-1
80409b6c:	04f50063          	beq	a0,a5,80409bac <skew_heap_merge.constprop.3+0x6c>
80409b70:	00842583          	lw	a1,8(s0)
80409b74:	00442903          	lw	s2,4(s0)
80409b78:	00048513          	mv	a0,s1
80409b7c:	fc5ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
80409b80:	00a42223          	sw	a0,4(s0)
80409b84:	01242423          	sw	s2,8(s0)
80409b88:	00050463          	beqz	a0,80409b90 <skew_heap_merge.constprop.3+0x50>
80409b8c:	00852023          	sw	s0,0(a0) # 40000000 <_binary_bin_sfs_img_size+0x3ff88000>
80409b90:	00040513          	mv	a0,s0
80409b94:	00c12083          	lw	ra,12(sp)
80409b98:	00812403          	lw	s0,8(sp)
80409b9c:	00412483          	lw	s1,4(sp)
80409ba0:	00012903          	lw	s2,0(sp)
80409ba4:	01010113          	addi	sp,sp,16
80409ba8:	00008067          	ret
80409bac:	0084a503          	lw	a0,8(s1)
80409bb0:	0044a903          	lw	s2,4(s1)
80409bb4:	00040593          	mv	a1,s0
80409bb8:	f89ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
80409bbc:	00a4a223          	sw	a0,4(s1)
80409bc0:	0124a423          	sw	s2,8(s1)
80409bc4:	00050463          	beqz	a0,80409bcc <skew_heap_merge.constprop.3+0x8c>
80409bc8:	00952023          	sw	s1,0(a0)
80409bcc:	00c12083          	lw	ra,12(sp)
80409bd0:	00812403          	lw	s0,8(sp)
80409bd4:	00048513          	mv	a0,s1
80409bd8:	00012903          	lw	s2,0(sp)
80409bdc:	00412483          	lw	s1,4(sp)
80409be0:	01010113          	addi	sp,sp,16
80409be4:	00008067          	ret

80409be8 <stride_enqueue>:
80409be8:	fb010113          	addi	sp,sp,-80
80409bec:	03312e23          	sw	s3,60(sp)
80409bf0:	01052983          	lw	s3,16(a0)
80409bf4:	04812423          	sw	s0,72(sp)
80409bf8:	04912223          	sw	s1,68(sp)
80409bfc:	05212023          	sw	s2,64(sp)
80409c00:	04112623          	sw	ra,76(sp)
80409c04:	03412c23          	sw	s4,56(sp)
80409c08:	03512a23          	sw	s5,52(sp)
80409c0c:	03612823          	sw	s6,48(sp)
80409c10:	03712623          	sw	s7,44(sp)
80409c14:	03812423          	sw	s8,40(sp)
80409c18:	03912223          	sw	s9,36(sp)
80409c1c:	03a12023          	sw	s10,32(sp)
80409c20:	01b12e23          	sw	s11,28(sp)
80409c24:	0c05a423          	sw	zero,200(a1)
80409c28:	0c05a823          	sw	zero,208(a1)
80409c2c:	0c05a623          	sw	zero,204(a1)
80409c30:	00050493          	mv	s1,a0
80409c34:	00058413          	mv	s0,a1
80409c38:	0c858913          	addi	s2,a1,200
80409c3c:	02098463          	beqz	s3,80409c64 <stride_enqueue+0x7c>
80409c40:	0c090c63          	beqz	s2,80409d18 <stride_enqueue+0x130>
80409c44:	00090593          	mv	a1,s2
80409c48:	00098513          	mv	a0,s3
80409c4c:	e39ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409c50:	fff00793          	li	a5,-1
80409c54:	00050a13          	mv	s4,a0
80409c58:	06f50a63          	beq	a0,a5,80409ccc <stride_enqueue+0xe4>
80409c5c:	0d342623          	sw	s3,204(s0)
80409c60:	0129a023          	sw	s2,0(s3)
80409c64:	0c442783          	lw	a5,196(s0)
80409c68:	0124a823          	sw	s2,16(s1)
80409c6c:	00c4a703          	lw	a4,12(s1)
80409c70:	04079a63          	bnez	a5,80409cc4 <stride_enqueue+0xdc>
80409c74:	0ce42223          	sw	a4,196(s0)
80409c78:	0084a783          	lw	a5,8(s1)
80409c7c:	04c12083          	lw	ra,76(sp)
80409c80:	0a942c23          	sw	s1,184(s0)
80409c84:	04812403          	lw	s0,72(sp)
80409c88:	00178793          	addi	a5,a5,1
80409c8c:	00f4a423          	sw	a5,8(s1)
80409c90:	04012903          	lw	s2,64(sp)
80409c94:	04412483          	lw	s1,68(sp)
80409c98:	03c12983          	lw	s3,60(sp)
80409c9c:	03812a03          	lw	s4,56(sp)
80409ca0:	03412a83          	lw	s5,52(sp)
80409ca4:	03012b03          	lw	s6,48(sp)
80409ca8:	02c12b83          	lw	s7,44(sp)
80409cac:	02812c03          	lw	s8,40(sp)
80409cb0:	02412c83          	lw	s9,36(sp)
80409cb4:	02012d03          	lw	s10,32(sp)
80409cb8:	01c12d83          	lw	s11,28(sp)
80409cbc:	05010113          	addi	sp,sp,80
80409cc0:	00008067          	ret
80409cc4:	faf75ae3          	bge	a4,a5,80409c78 <stride_enqueue+0x90>
80409cc8:	fadff06f          	j	80409c74 <stride_enqueue+0x8c>
80409ccc:	0089aa83          	lw	s5,8(s3)
80409cd0:	0049ab03          	lw	s6,4(s3)
80409cd4:	020a8063          	beqz	s5,80409cf4 <stride_enqueue+0x10c>
80409cd8:	00090593          	mv	a1,s2
80409cdc:	000a8513          	mv	a0,s5
80409ce0:	da5ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409ce4:	00050b93          	mv	s7,a0
80409ce8:	05450463          	beq	a0,s4,80409d30 <stride_enqueue+0x148>
80409cec:	0d542623          	sw	s5,204(s0)
80409cf0:	012aa023          	sw	s2,0(s5)
80409cf4:	0129a223          	sw	s2,4(s3)
80409cf8:	0169a423          	sw	s6,8(s3)
80409cfc:	0c442783          	lw	a5,196(s0)
80409d00:	01392023          	sw	s3,0(s2)
80409d04:	00098913          	mv	s2,s3
80409d08:	0124a823          	sw	s2,16(s1)
80409d0c:	00c4a703          	lw	a4,12(s1)
80409d10:	f60782e3          	beqz	a5,80409c74 <stride_enqueue+0x8c>
80409d14:	fb1ff06f          	j	80409cc4 <stride_enqueue+0xdc>
80409d18:	0c442783          	lw	a5,196(s0)
80409d1c:	00098913          	mv	s2,s3
80409d20:	0124a823          	sw	s2,16(s1)
80409d24:	00c4a703          	lw	a4,12(s1)
80409d28:	f40786e3          	beqz	a5,80409c74 <stride_enqueue+0x8c>
80409d2c:	f99ff06f          	j	80409cc4 <stride_enqueue+0xdc>
80409d30:	008aaa03          	lw	s4,8(s5)
80409d34:	004aac03          	lw	s8,4(s5)
80409d38:	020a0063          	beqz	s4,80409d58 <stride_enqueue+0x170>
80409d3c:	00090593          	mv	a1,s2
80409d40:	000a0513          	mv	a0,s4
80409d44:	d41ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409d48:	00050c93          	mv	s9,a0
80409d4c:	03750063          	beq	a0,s7,80409d6c <stride_enqueue+0x184>
80409d50:	0d442623          	sw	s4,204(s0)
80409d54:	012a2023          	sw	s2,0(s4)
80409d58:	012aa223          	sw	s2,4(s5)
80409d5c:	018aa423          	sw	s8,8(s5)
80409d60:	01592023          	sw	s5,0(s2)
80409d64:	000a8913          	mv	s2,s5
80409d68:	f8dff06f          	j	80409cf4 <stride_enqueue+0x10c>
80409d6c:	008a2b83          	lw	s7,8(s4)
80409d70:	004a2d03          	lw	s10,4(s4)
80409d74:	000b8e63          	beqz	s7,80409d90 <stride_enqueue+0x1a8>
80409d78:	00090593          	mv	a1,s2
80409d7c:	000b8513          	mv	a0,s7
80409d80:	d05ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409d84:	03950063          	beq	a0,s9,80409da4 <stride_enqueue+0x1bc>
80409d88:	0d742623          	sw	s7,204(s0)
80409d8c:	012ba023          	sw	s2,0(s7)
80409d90:	012a2223          	sw	s2,4(s4)
80409d94:	01aa2423          	sw	s10,8(s4)
80409d98:	01492023          	sw	s4,0(s2)
80409d9c:	000a0913          	mv	s2,s4
80409da0:	fb9ff06f          	j	80409d58 <stride_enqueue+0x170>
80409da4:	008bac83          	lw	s9,8(s7)
80409da8:	004bad83          	lw	s11,4(s7)
80409dac:	020c8063          	beqz	s9,80409dcc <stride_enqueue+0x1e4>
80409db0:	00090593          	mv	a1,s2
80409db4:	000c8513          	mv	a0,s9
80409db8:	ccdff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409dbc:	fff00793          	li	a5,-1
80409dc0:	02f50063          	beq	a0,a5,80409de0 <stride_enqueue+0x1f8>
80409dc4:	0d942623          	sw	s9,204(s0)
80409dc8:	012ca023          	sw	s2,0(s9)
80409dcc:	012ba223          	sw	s2,4(s7)
80409dd0:	01bba423          	sw	s11,8(s7)
80409dd4:	01792023          	sw	s7,0(s2)
80409dd8:	000b8913          	mv	s2,s7
80409ddc:	fb5ff06f          	j	80409d90 <stride_enqueue+0x1a8>
80409de0:	004ca783          	lw	a5,4(s9)
80409de4:	008ca503          	lw	a0,8(s9)
80409de8:	00090593          	mv	a1,s2
80409dec:	00f12623          	sw	a5,12(sp)
80409df0:	d51ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
80409df4:	00c12783          	lw	a5,12(sp)
80409df8:	00aca223          	sw	a0,4(s9)
80409dfc:	00fca423          	sw	a5,8(s9)
80409e00:	00050863          	beqz	a0,80409e10 <stride_enqueue+0x228>
80409e04:	01952023          	sw	s9,0(a0)
80409e08:	000c8913          	mv	s2,s9
80409e0c:	fc1ff06f          	j	80409dcc <stride_enqueue+0x1e4>
80409e10:	000c8913          	mv	s2,s9
80409e14:	fb9ff06f          	j	80409dcc <stride_enqueue+0x1e4>

80409e18 <stride_dequeue>:
80409e18:	0b85a783          	lw	a5,184(a1)
80409e1c:	fa010113          	addi	sp,sp,-96
80409e20:	04112e23          	sw	ra,92(sp)
80409e24:	04812c23          	sw	s0,88(sp)
80409e28:	04912a23          	sw	s1,84(sp)
80409e2c:	05212823          	sw	s2,80(sp)
80409e30:	05312623          	sw	s3,76(sp)
80409e34:	05412423          	sw	s4,72(sp)
80409e38:	05512223          	sw	s5,68(sp)
80409e3c:	05612023          	sw	s6,64(sp)
80409e40:	03712e23          	sw	s7,60(sp)
80409e44:	03812c23          	sw	s8,56(sp)
80409e48:	03912a23          	sw	s9,52(sp)
80409e4c:	03a12823          	sw	s10,48(sp)
80409e50:	03b12623          	sw	s11,44(sp)
80409e54:	00a78463          	beq	a5,a0,80409e5c <stride_dequeue+0x44>
80409e58:	2790206f          	j	8040c8d0 <stride_dequeue+0x2ab8>
80409e5c:	00852983          	lw	s3,8(a0)
80409e60:	00050c13          	mv	s8,a0
80409e64:	00098b13          	mv	s6,s3
80409e68:	00099463          	bnez	s3,80409e70 <stride_dequeue+0x58>
80409e6c:	2650206f          	j	8040c8d0 <stride_dequeue+0x2ab8>
80409e70:	0cc5a903          	lw	s2,204(a1)
80409e74:	00058493          	mv	s1,a1
80409e78:	01052a83          	lw	s5,16(a0)
80409e7c:	0c85ad03          	lw	s10,200(a1)
80409e80:	0d05a403          	lw	s0,208(a1)
80409e84:	3c090e63          	beqz	s2,8040a260 <stride_dequeue+0x448>
80409e88:	58040c63          	beqz	s0,8040a420 <stride_dequeue+0x608>
80409e8c:	00040593          	mv	a1,s0
80409e90:	00090513          	mv	a0,s2
80409e94:	bf1ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409e98:	fff00c93          	li	s9,-1
80409e9c:	00050a13          	mv	s4,a0
80409ea0:	21950663          	beq	a0,s9,8040a0ac <stride_dequeue+0x294>
80409ea4:	00842a03          	lw	s4,8(s0)
80409ea8:	00442b83          	lw	s7,4(s0)
80409eac:	180a0a63          	beqz	s4,8040a040 <stride_dequeue+0x228>
80409eb0:	000a0593          	mv	a1,s4
80409eb4:	00090513          	mv	a0,s2
80409eb8:	bcdff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409ebc:	3b950e63          	beq	a0,s9,8040a278 <stride_dequeue+0x460>
80409ec0:	004a2783          	lw	a5,4(s4)
80409ec4:	008a2d83          	lw	s11,8(s4)
80409ec8:	00f12023          	sw	a5,0(sp)
80409ecc:	160d8063          	beqz	s11,8040a02c <stride_dequeue+0x214>
80409ed0:	000d8593          	mv	a1,s11
80409ed4:	00090513          	mv	a0,s2
80409ed8:	badff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409edc:	2b9500e3          	beq	a0,s9,8040a97c <stride_dequeue+0xb64>
80409ee0:	004da783          	lw	a5,4(s11)
80409ee4:	008dac83          	lw	s9,8(s11)
80409ee8:	00f12223          	sw	a5,4(sp)
80409eec:	120c8663          	beqz	s9,8040a018 <stride_dequeue+0x200>
80409ef0:	000c8593          	mv	a1,s9
80409ef4:	00090513          	mv	a0,s2
80409ef8:	b8dff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409efc:	fff00893          	li	a7,-1
80409f00:	171504e3          	beq	a0,a7,8040a868 <stride_dequeue+0xa50>
80409f04:	004ca783          	lw	a5,4(s9)
80409f08:	008ca803          	lw	a6,8(s9)
80409f0c:	00f12423          	sw	a5,8(sp)
80409f10:	0e080a63          	beqz	a6,8040a004 <stride_dequeue+0x1ec>
80409f14:	00080593          	mv	a1,a6
80409f18:	00090513          	mv	a0,s2
80409f1c:	01012623          	sw	a6,12(sp)
80409f20:	b65ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409f24:	fff00893          	li	a7,-1
80409f28:	00c12803          	lw	a6,12(sp)
80409f2c:	01151463          	bne	a0,a7,80409f34 <stride_dequeue+0x11c>
80409f30:	02c0106f          	j	8040af5c <stride_dequeue+0x1144>
80409f34:	00482703          	lw	a4,4(a6) # fffff004 <end+0x7fb62744>
80409f38:	00882783          	lw	a5,8(a6)
80409f3c:	00e12623          	sw	a4,12(sp)
80409f40:	0a078863          	beqz	a5,80409ff0 <stride_dequeue+0x1d8>
80409f44:	00078593          	mv	a1,a5
80409f48:	00090513          	mv	a0,s2
80409f4c:	01012a23          	sw	a6,20(sp)
80409f50:	00f12823          	sw	a5,16(sp)
80409f54:	b31ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409f58:	fff00893          	li	a7,-1
80409f5c:	01012783          	lw	a5,16(sp)
80409f60:	01412803          	lw	a6,20(sp)
80409f64:	01151463          	bne	a0,a7,80409f6c <stride_dequeue+0x154>
80409f68:	7900106f          	j	8040b6f8 <stride_dequeue+0x18e0>
80409f6c:	0047a703          	lw	a4,4(a5)
80409f70:	0087ab03          	lw	s6,8(a5)
80409f74:	00e12823          	sw	a4,16(sp)
80409f78:	060b0263          	beqz	s6,80409fdc <stride_dequeue+0x1c4>
80409f7c:	000b0593          	mv	a1,s6
80409f80:	00090513          	mv	a0,s2
80409f84:	00f12c23          	sw	a5,24(sp)
80409f88:	01012a23          	sw	a6,20(sp)
80409f8c:	af9ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
80409f90:	fff00893          	li	a7,-1
80409f94:	01412803          	lw	a6,20(sp)
80409f98:	01812783          	lw	a5,24(sp)
80409f9c:	01151463          	bne	a0,a7,80409fa4 <stride_dequeue+0x18c>
80409fa0:	0a00206f          	j	8040c040 <stride_dequeue+0x2228>
80409fa4:	008b2583          	lw	a1,8(s6)
80409fa8:	004b2983          	lw	s3,4(s6)
80409fac:	00090513          	mv	a0,s2
80409fb0:	00f12c23          	sw	a5,24(sp)
80409fb4:	01012a23          	sw	a6,20(sp)
80409fb8:	b89ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
80409fbc:	00ab2223          	sw	a0,4(s6)
80409fc0:	013b2423          	sw	s3,8(s6)
80409fc4:	01412803          	lw	a6,20(sp)
80409fc8:	01812783          	lw	a5,24(sp)
80409fcc:	00050463          	beqz	a0,80409fd4 <stride_dequeue+0x1bc>
80409fd0:	01652023          	sw	s6,0(a0)
80409fd4:	008c2983          	lw	s3,8(s8)
80409fd8:	000b0913          	mv	s2,s6
80409fdc:	01012703          	lw	a4,16(sp)
80409fe0:	0127a223          	sw	s2,4(a5)
80409fe4:	00e7a423          	sw	a4,8(a5)
80409fe8:	00f92023          	sw	a5,0(s2)
80409fec:	00078913          	mv	s2,a5
80409ff0:	00c12783          	lw	a5,12(sp)
80409ff4:	01282223          	sw	s2,4(a6)
80409ff8:	00f82423          	sw	a5,8(a6)
80409ffc:	01092023          	sw	a6,0(s2)
8040a000:	00080913          	mv	s2,a6
8040a004:	00812783          	lw	a5,8(sp)
8040a008:	012ca223          	sw	s2,4(s9)
8040a00c:	00fca423          	sw	a5,8(s9)
8040a010:	01992023          	sw	s9,0(s2)
8040a014:	000c8913          	mv	s2,s9
8040a018:	00412783          	lw	a5,4(sp)
8040a01c:	012da223          	sw	s2,4(s11)
8040a020:	00fda423          	sw	a5,8(s11)
8040a024:	01b92023          	sw	s11,0(s2)
8040a028:	000d8913          	mv	s2,s11
8040a02c:	00012783          	lw	a5,0(sp)
8040a030:	012a2223          	sw	s2,4(s4)
8040a034:	00fa2423          	sw	a5,8(s4)
8040a038:	01492023          	sw	s4,0(s2)
8040a03c:	000a0913          	mv	s2,s4
8040a040:	01242223          	sw	s2,4(s0)
8040a044:	01742423          	sw	s7,8(s0)
8040a048:	00892023          	sw	s0,0(s2)
8040a04c:	01a42023          	sw	s10,0(s0)
8040a050:	200d0c63          	beqz	s10,8040a268 <stride_dequeue+0x450>
8040a054:	004d2683          	lw	a3,4(s10)
8040a058:	0c848493          	addi	s1,s1,200
8040a05c:	20968a63          	beq	a3,s1,8040a270 <stride_dequeue+0x458>
8040a060:	008d2423          	sw	s0,8(s10)
8040a064:	05c12083          	lw	ra,92(sp)
8040a068:	05812403          	lw	s0,88(sp)
8040a06c:	fff98993          	addi	s3,s3,-1
8040a070:	015c2823          	sw	s5,16(s8)
8040a074:	013c2423          	sw	s3,8(s8)
8040a078:	05412483          	lw	s1,84(sp)
8040a07c:	05012903          	lw	s2,80(sp)
8040a080:	04c12983          	lw	s3,76(sp)
8040a084:	04812a03          	lw	s4,72(sp)
8040a088:	04412a83          	lw	s5,68(sp)
8040a08c:	04012b03          	lw	s6,64(sp)
8040a090:	03c12b83          	lw	s7,60(sp)
8040a094:	03812c03          	lw	s8,56(sp)
8040a098:	03412c83          	lw	s9,52(sp)
8040a09c:	03012d03          	lw	s10,48(sp)
8040a0a0:	02c12d83          	lw	s11,44(sp)
8040a0a4:	06010113          	addi	sp,sp,96
8040a0a8:	00008067          	ret
8040a0ac:	00892d83          	lw	s11,8(s2)
8040a0b0:	00492b83          	lw	s7,4(s2)
8040a0b4:	180d8a63          	beqz	s11,8040a248 <stride_dequeue+0x430>
8040a0b8:	00040593          	mv	a1,s0
8040a0bc:	000d8513          	mv	a0,s11
8040a0c0:	9c5ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a0c4:	37450463          	beq	a0,s4,8040a42c <stride_dequeue+0x614>
8040a0c8:	00442783          	lw	a5,4(s0)
8040a0cc:	00842c83          	lw	s9,8(s0)
8040a0d0:	00f12023          	sw	a5,0(sp)
8040a0d4:	160c8263          	beqz	s9,8040a238 <stride_dequeue+0x420>
8040a0d8:	000c8593          	mv	a1,s9
8040a0dc:	000d8513          	mv	a0,s11
8040a0e0:	9a5ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a0e4:	4d450863          	beq	a0,s4,8040a5b4 <stride_dequeue+0x79c>
8040a0e8:	004ca783          	lw	a5,4(s9)
8040a0ec:	008caa03          	lw	s4,8(s9)
8040a0f0:	00f12223          	sw	a5,4(sp)
8040a0f4:	120a0863          	beqz	s4,8040a224 <stride_dequeue+0x40c>
8040a0f8:	000a0593          	mv	a1,s4
8040a0fc:	000d8513          	mv	a0,s11
8040a100:	985ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a104:	fff00893          	li	a7,-1
8040a108:	551502e3          	beq	a0,a7,8040ae4c <stride_dequeue+0x1034>
8040a10c:	004a2783          	lw	a5,4(s4)
8040a110:	008a2803          	lw	a6,8(s4)
8040a114:	00f12423          	sw	a5,8(sp)
8040a118:	0e080c63          	beqz	a6,8040a210 <stride_dequeue+0x3f8>
8040a11c:	00080593          	mv	a1,a6
8040a120:	000d8513          	mv	a0,s11
8040a124:	01012623          	sw	a6,12(sp)
8040a128:	95dff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a12c:	fff00893          	li	a7,-1
8040a130:	00c12803          	lw	a6,12(sp)
8040a134:	01151463          	bne	a0,a7,8040a13c <stride_dequeue+0x324>
8040a138:	4000106f          	j	8040b538 <stride_dequeue+0x1720>
8040a13c:	00482783          	lw	a5,4(a6)
8040a140:	00882303          	lw	t1,8(a6)
8040a144:	00f12623          	sw	a5,12(sp)
8040a148:	0a030a63          	beqz	t1,8040a1fc <stride_dequeue+0x3e4>
8040a14c:	00030593          	mv	a1,t1
8040a150:	000d8513          	mv	a0,s11
8040a154:	01012a23          	sw	a6,20(sp)
8040a158:	00612823          	sw	t1,16(sp)
8040a15c:	929ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a160:	fff00893          	li	a7,-1
8040a164:	01012303          	lw	t1,16(sp)
8040a168:	01412803          	lw	a6,20(sp)
8040a16c:	01151463          	bne	a0,a7,8040a174 <stride_dequeue+0x35c>
8040a170:	5cd0106f          	j	8040bf3c <stride_dequeue+0x2124>
8040a174:	00432783          	lw	a5,4(t1)
8040a178:	00832983          	lw	s3,8(t1)
8040a17c:	00f12823          	sw	a5,16(sp)
8040a180:	00099463          	bnez	s3,8040a188 <stride_dequeue+0x370>
8040a184:	44c0206f          	j	8040c5d0 <stride_dequeue+0x27b8>
8040a188:	00098593          	mv	a1,s3
8040a18c:	000d8513          	mv	a0,s11
8040a190:	00612c23          	sw	t1,24(sp)
8040a194:	01012a23          	sw	a6,20(sp)
8040a198:	8edff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a19c:	fff00893          	li	a7,-1
8040a1a0:	01412803          	lw	a6,20(sp)
8040a1a4:	01812303          	lw	t1,24(sp)
8040a1a8:	01151463          	bne	a0,a7,8040a1b0 <stride_dequeue+0x398>
8040a1ac:	6ac0206f          	j	8040c858 <stride_dequeue+0x2a40>
8040a1b0:	0089a583          	lw	a1,8(s3)
8040a1b4:	0049ab03          	lw	s6,4(s3)
8040a1b8:	000d8513          	mv	a0,s11
8040a1bc:	00612c23          	sw	t1,24(sp)
8040a1c0:	01012a23          	sw	a6,20(sp)
8040a1c4:	97dff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040a1c8:	00a9a223          	sw	a0,4(s3)
8040a1cc:	0169a423          	sw	s6,8(s3)
8040a1d0:	01412803          	lw	a6,20(sp)
8040a1d4:	01812303          	lw	t1,24(sp)
8040a1d8:	00050463          	beqz	a0,8040a1e0 <stride_dequeue+0x3c8>
8040a1dc:	01352023          	sw	s3,0(a0)
8040a1e0:	008c2b03          	lw	s6,8(s8)
8040a1e4:	01012783          	lw	a5,16(sp)
8040a1e8:	01332223          	sw	s3,4(t1)
8040a1ec:	00030d93          	mv	s11,t1
8040a1f0:	00f32423          	sw	a5,8(t1)
8040a1f4:	0069a023          	sw	t1,0(s3)
8040a1f8:	000b0993          	mv	s3,s6
8040a1fc:	00c12783          	lw	a5,12(sp)
8040a200:	01b82223          	sw	s11,4(a6)
8040a204:	00f82423          	sw	a5,8(a6)
8040a208:	010da023          	sw	a6,0(s11)
8040a20c:	00080d93          	mv	s11,a6
8040a210:	00812783          	lw	a5,8(sp)
8040a214:	01ba2223          	sw	s11,4(s4)
8040a218:	00fa2423          	sw	a5,8(s4)
8040a21c:	014da023          	sw	s4,0(s11)
8040a220:	000a0d93          	mv	s11,s4
8040a224:	00412783          	lw	a5,4(sp)
8040a228:	01bca223          	sw	s11,4(s9)
8040a22c:	00fca423          	sw	a5,8(s9)
8040a230:	019da023          	sw	s9,0(s11)
8040a234:	000c8d93          	mv	s11,s9
8040a238:	00012783          	lw	a5,0(sp)
8040a23c:	01b42223          	sw	s11,4(s0)
8040a240:	00f42423          	sw	a5,8(s0)
8040a244:	008da023          	sw	s0,0(s11)
8040a248:	00892223          	sw	s0,4(s2)
8040a24c:	01792423          	sw	s7,8(s2)
8040a250:	01242023          	sw	s2,0(s0)
8040a254:	00090413          	mv	s0,s2
8040a258:	01a42023          	sw	s10,0(s0)
8040a25c:	df5ff06f          	j	8040a050 <stride_dequeue+0x238>
8040a260:	de0416e3          	bnez	s0,8040a04c <stride_dequeue+0x234>
8040a264:	de0d18e3          	bnez	s10,8040a054 <stride_dequeue+0x23c>
8040a268:	00040a93          	mv	s5,s0
8040a26c:	df9ff06f          	j	8040a064 <stride_dequeue+0x24c>
8040a270:	008d2223          	sw	s0,4(s10)
8040a274:	df1ff06f          	j	8040a064 <stride_dequeue+0x24c>
8040a278:	00892d83          	lw	s11,8(s2)
8040a27c:	00a12023          	sw	a0,0(sp)
8040a280:	00492c83          	lw	s9,4(s2)
8040a284:	180d8663          	beqz	s11,8040a410 <stride_dequeue+0x5f8>
8040a288:	000a0593          	mv	a1,s4
8040a28c:	000d8513          	mv	a0,s11
8040a290:	ff4ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a294:	00012783          	lw	a5,0(sp)
8040a298:	46f50263          	beq	a0,a5,8040a6fc <stride_dequeue+0x8e4>
8040a29c:	004a2783          	lw	a5,4(s4)
8040a2a0:	008a2603          	lw	a2,8(s4)
8040a2a4:	00f12023          	sw	a5,0(sp)
8040a2a8:	14060c63          	beqz	a2,8040a400 <stride_dequeue+0x5e8>
8040a2ac:	00060593          	mv	a1,a2
8040a2b0:	000d8513          	mv	a0,s11
8040a2b4:	00c12223          	sw	a2,4(sp)
8040a2b8:	fccff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a2bc:	fff00893          	li	a7,-1
8040a2c0:	00412603          	lw	a2,4(sp)
8040a2c4:	25150ce3          	beq	a0,a7,8040ad1c <stride_dequeue+0xf04>
8040a2c8:	00462783          	lw	a5,4(a2)
8040a2cc:	00862803          	lw	a6,8(a2)
8040a2d0:	00f12223          	sw	a5,4(sp)
8040a2d4:	10080c63          	beqz	a6,8040a3ec <stride_dequeue+0x5d4>
8040a2d8:	00080593          	mv	a1,a6
8040a2dc:	000d8513          	mv	a0,s11
8040a2e0:	00c12623          	sw	a2,12(sp)
8040a2e4:	01012423          	sw	a6,8(sp)
8040a2e8:	f9cff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a2ec:	fff00893          	li	a7,-1
8040a2f0:	00812803          	lw	a6,8(sp)
8040a2f4:	00c12603          	lw	a2,12(sp)
8040a2f8:	01151463          	bne	a0,a7,8040a300 <stride_dequeue+0x4e8>
8040a2fc:	3100106f          	j	8040b60c <stride_dequeue+0x17f4>
8040a300:	00482783          	lw	a5,4(a6)
8040a304:	00882303          	lw	t1,8(a6)
8040a308:	00f12423          	sw	a5,8(sp)
8040a30c:	0c030663          	beqz	t1,8040a3d8 <stride_dequeue+0x5c0>
8040a310:	00030593          	mv	a1,t1
8040a314:	000d8513          	mv	a0,s11
8040a318:	01012a23          	sw	a6,20(sp)
8040a31c:	00c12823          	sw	a2,16(sp)
8040a320:	00612623          	sw	t1,12(sp)
8040a324:	f60ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a328:	fff00893          	li	a7,-1
8040a32c:	00c12303          	lw	t1,12(sp)
8040a330:	01012603          	lw	a2,16(sp)
8040a334:	01412803          	lw	a6,20(sp)
8040a338:	01151463          	bne	a0,a7,8040a340 <stride_dequeue+0x528>
8040a33c:	2e90106f          	j	8040be24 <stride_dequeue+0x200c>
8040a340:	00432783          	lw	a5,4(t1)
8040a344:	00832983          	lw	s3,8(t1)
8040a348:	00f12623          	sw	a5,12(sp)
8040a34c:	00099463          	bnez	s3,8040a354 <stride_dequeue+0x53c>
8040a350:	4240206f          	j	8040c774 <stride_dequeue+0x295c>
8040a354:	00098593          	mv	a1,s3
8040a358:	000d8513          	mv	a0,s11
8040a35c:	00612c23          	sw	t1,24(sp)
8040a360:	01012a23          	sw	a6,20(sp)
8040a364:	00c12823          	sw	a2,16(sp)
8040a368:	f1cff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a36c:	fff00893          	li	a7,-1
8040a370:	01012603          	lw	a2,16(sp)
8040a374:	01412803          	lw	a6,20(sp)
8040a378:	01812303          	lw	t1,24(sp)
8040a37c:	01151463          	bne	a0,a7,8040a384 <stride_dequeue+0x56c>
8040a380:	3fc0206f          	j	8040c77c <stride_dequeue+0x2964>
8040a384:	0089a583          	lw	a1,8(s3)
8040a388:	0049ab03          	lw	s6,4(s3)
8040a38c:	000d8513          	mv	a0,s11
8040a390:	00612c23          	sw	t1,24(sp)
8040a394:	01012a23          	sw	a6,20(sp)
8040a398:	00c12823          	sw	a2,16(sp)
8040a39c:	fa4ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040a3a0:	00a9a223          	sw	a0,4(s3)
8040a3a4:	0169a423          	sw	s6,8(s3)
8040a3a8:	01012603          	lw	a2,16(sp)
8040a3ac:	01412803          	lw	a6,20(sp)
8040a3b0:	01812303          	lw	t1,24(sp)
8040a3b4:	00050463          	beqz	a0,8040a3bc <stride_dequeue+0x5a4>
8040a3b8:	01352023          	sw	s3,0(a0)
8040a3bc:	008c2b03          	lw	s6,8(s8)
8040a3c0:	00c12783          	lw	a5,12(sp)
8040a3c4:	01332223          	sw	s3,4(t1)
8040a3c8:	00030d93          	mv	s11,t1
8040a3cc:	00f32423          	sw	a5,8(t1)
8040a3d0:	0069a023          	sw	t1,0(s3)
8040a3d4:	000b0993          	mv	s3,s6
8040a3d8:	00812783          	lw	a5,8(sp)
8040a3dc:	01b82223          	sw	s11,4(a6)
8040a3e0:	00f82423          	sw	a5,8(a6)
8040a3e4:	010da023          	sw	a6,0(s11)
8040a3e8:	00080d93          	mv	s11,a6
8040a3ec:	00412783          	lw	a5,4(sp)
8040a3f0:	01b62223          	sw	s11,4(a2)
8040a3f4:	00f62423          	sw	a5,8(a2)
8040a3f8:	00cda023          	sw	a2,0(s11)
8040a3fc:	00060d93          	mv	s11,a2
8040a400:	00012783          	lw	a5,0(sp)
8040a404:	01ba2223          	sw	s11,4(s4)
8040a408:	00fa2423          	sw	a5,8(s4)
8040a40c:	014da023          	sw	s4,0(s11)
8040a410:	01492223          	sw	s4,4(s2)
8040a414:	01992423          	sw	s9,8(s2)
8040a418:	012a2023          	sw	s2,0(s4)
8040a41c:	c25ff06f          	j	8040a040 <stride_dequeue+0x228>
8040a420:	00090413          	mv	s0,s2
8040a424:	01a42023          	sw	s10,0(s0)
8040a428:	c29ff06f          	j	8040a050 <stride_dequeue+0x238>
8040a42c:	004da783          	lw	a5,4(s11)
8040a430:	008dac83          	lw	s9,8(s11)
8040a434:	00a12223          	sw	a0,4(sp)
8040a438:	00f12023          	sw	a5,0(sp)
8040a43c:	160c8063          	beqz	s9,8040a59c <stride_dequeue+0x784>
8040a440:	00040593          	mv	a1,s0
8040a444:	000c8513          	mv	a0,s9
8040a448:	e3cff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a44c:	00412783          	lw	a5,4(sp)
8040a450:	66f50a63          	beq	a0,a5,8040aac4 <stride_dequeue+0xcac>
8040a454:	00442783          	lw	a5,4(s0)
8040a458:	00842a03          	lw	s4,8(s0)
8040a45c:	00f12223          	sw	a5,4(sp)
8040a460:	120a0663          	beqz	s4,8040a58c <stride_dequeue+0x774>
8040a464:	000a0593          	mv	a1,s4
8040a468:	000c8513          	mv	a0,s9
8040a46c:	e18ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a470:	fff00893          	li	a7,-1
8040a474:	4f1506e3          	beq	a0,a7,8040b160 <stride_dequeue+0x1348>
8040a478:	004a2783          	lw	a5,4(s4)
8040a47c:	008a2803          	lw	a6,8(s4)
8040a480:	00f12423          	sw	a5,8(sp)
8040a484:	0e080a63          	beqz	a6,8040a578 <stride_dequeue+0x760>
8040a488:	00080593          	mv	a1,a6
8040a48c:	000c8513          	mv	a0,s9
8040a490:	01012623          	sw	a6,12(sp)
8040a494:	df0ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a498:	fff00893          	li	a7,-1
8040a49c:	00c12803          	lw	a6,12(sp)
8040a4a0:	01151463          	bne	a0,a7,8040a4a8 <stride_dequeue+0x690>
8040a4a4:	5640106f          	j	8040ba08 <stride_dequeue+0x1bf0>
8040a4a8:	00482783          	lw	a5,4(a6)
8040a4ac:	00882983          	lw	s3,8(a6)
8040a4b0:	00f12623          	sw	a5,12(sp)
8040a4b4:	00099463          	bnez	s3,8040a4bc <stride_dequeue+0x6a4>
8040a4b8:	4380206f          	j	8040c8f0 <stride_dequeue+0x2ad8>
8040a4bc:	00098593          	mv	a1,s3
8040a4c0:	000c8513          	mv	a0,s9
8040a4c4:	01012823          	sw	a6,16(sp)
8040a4c8:	dbcff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a4cc:	fff00893          	li	a7,-1
8040a4d0:	01012803          	lw	a6,16(sp)
8040a4d4:	01151463          	bne	a0,a7,8040a4dc <stride_dequeue+0x6c4>
8040a4d8:	0780206f          	j	8040c550 <stride_dequeue+0x2738>
8040a4dc:	0049a783          	lw	a5,4(s3)
8040a4e0:	0089ae03          	lw	t3,8(s3)
8040a4e4:	00f12823          	sw	a5,16(sp)
8040a4e8:	060e0463          	beqz	t3,8040a550 <stride_dequeue+0x738>
8040a4ec:	000e0593          	mv	a1,t3
8040a4f0:	000c8513          	mv	a0,s9
8040a4f4:	01012c23          	sw	a6,24(sp)
8040a4f8:	01c12a23          	sw	t3,20(sp)
8040a4fc:	d88ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a500:	fff00893          	li	a7,-1
8040a504:	01412e03          	lw	t3,20(sp)
8040a508:	01812803          	lw	a6,24(sp)
8040a50c:	01151463          	bne	a0,a7,8040a514 <stride_dequeue+0x6fc>
8040a510:	6a40206f          	j	8040cbb4 <stride_dequeue+0x2d9c>
8040a514:	008e2583          	lw	a1,8(t3)
8040a518:	000c8513          	mv	a0,s9
8040a51c:	004e2b03          	lw	s6,4(t3)
8040a520:	01012c23          	sw	a6,24(sp)
8040a524:	01c12a23          	sw	t3,20(sp)
8040a528:	e18ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040a52c:	01412e03          	lw	t3,20(sp)
8040a530:	01812803          	lw	a6,24(sp)
8040a534:	00ae2223          	sw	a0,4(t3)
8040a538:	016e2423          	sw	s6,8(t3)
8040a53c:	00051463          	bnez	a0,8040a544 <stride_dequeue+0x72c>
8040a540:	0e90206f          	j	8040ce28 <stride_dequeue+0x3010>
8040a544:	008c2b03          	lw	s6,8(s8)
8040a548:	01c52023          	sw	t3,0(a0)
8040a54c:	000e0c93          	mv	s9,t3
8040a550:	01012783          	lw	a5,16(sp)
8040a554:	0199a223          	sw	s9,4(s3)
8040a558:	00f9a423          	sw	a5,8(s3)
8040a55c:	013ca023          	sw	s3,0(s9)
8040a560:	00c12783          	lw	a5,12(sp)
8040a564:	01382223          	sw	s3,4(a6)
8040a568:	00080c93          	mv	s9,a6
8040a56c:	00f82423          	sw	a5,8(a6)
8040a570:	0109a023          	sw	a6,0(s3)
8040a574:	000b0993          	mv	s3,s6
8040a578:	00812783          	lw	a5,8(sp)
8040a57c:	019a2223          	sw	s9,4(s4)
8040a580:	00fa2423          	sw	a5,8(s4)
8040a584:	014ca023          	sw	s4,0(s9)
8040a588:	000a0c93          	mv	s9,s4
8040a58c:	00412783          	lw	a5,4(sp)
8040a590:	01942223          	sw	s9,4(s0)
8040a594:	00f42423          	sw	a5,8(s0)
8040a598:	008ca023          	sw	s0,0(s9)
8040a59c:	00012783          	lw	a5,0(sp)
8040a5a0:	008da223          	sw	s0,4(s11)
8040a5a4:	00fda423          	sw	a5,8(s11)
8040a5a8:	01b42023          	sw	s11,0(s0)
8040a5ac:	000d8413          	mv	s0,s11
8040a5b0:	c99ff06f          	j	8040a248 <stride_dequeue+0x430>
8040a5b4:	004da783          	lw	a5,4(s11)
8040a5b8:	008daa03          	lw	s4,8(s11)
8040a5bc:	00f12223          	sw	a5,4(sp)
8040a5c0:	120a0463          	beqz	s4,8040a6e8 <stride_dequeue+0x8d0>
8040a5c4:	000c8593          	mv	a1,s9
8040a5c8:	000a0513          	mv	a0,s4
8040a5cc:	cb8ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a5d0:	fff00893          	li	a7,-1
8040a5d4:	4b1500e3          	beq	a0,a7,8040b274 <stride_dequeue+0x145c>
8040a5d8:	004ca783          	lw	a5,4(s9)
8040a5dc:	008ca803          	lw	a6,8(s9)
8040a5e0:	00f12423          	sw	a5,8(sp)
8040a5e4:	0e080a63          	beqz	a6,8040a6d8 <stride_dequeue+0x8c0>
8040a5e8:	00080593          	mv	a1,a6
8040a5ec:	000a0513          	mv	a0,s4
8040a5f0:	01012623          	sw	a6,12(sp)
8040a5f4:	c90ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a5f8:	fff00893          	li	a7,-1
8040a5fc:	00c12803          	lw	a6,12(sp)
8040a600:	01151463          	bne	a0,a7,8040a608 <stride_dequeue+0x7f0>
8040a604:	4e00106f          	j	8040bae4 <stride_dequeue+0x1ccc>
8040a608:	00482783          	lw	a5,4(a6)
8040a60c:	00882983          	lw	s3,8(a6)
8040a610:	00f12623          	sw	a5,12(sp)
8040a614:	00099463          	bnez	s3,8040a61c <stride_dequeue+0x804>
8040a618:	2b00206f          	j	8040c8c8 <stride_dequeue+0x2ab0>
8040a61c:	00098593          	mv	a1,s3
8040a620:	000a0513          	mv	a0,s4
8040a624:	01012823          	sw	a6,16(sp)
8040a628:	c5cff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a62c:	fff00893          	li	a7,-1
8040a630:	01012803          	lw	a6,16(sp)
8040a634:	01151463          	bne	a0,a7,8040a63c <stride_dequeue+0x824>
8040a638:	7a10106f          	j	8040c5d8 <stride_dequeue+0x27c0>
8040a63c:	0049a783          	lw	a5,4(s3)
8040a640:	0089ae03          	lw	t3,8(s3)
8040a644:	00f12823          	sw	a5,16(sp)
8040a648:	060e0463          	beqz	t3,8040a6b0 <stride_dequeue+0x898>
8040a64c:	000e0593          	mv	a1,t3
8040a650:	000a0513          	mv	a0,s4
8040a654:	01012c23          	sw	a6,24(sp)
8040a658:	01c12a23          	sw	t3,20(sp)
8040a65c:	c28ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a660:	fff00893          	li	a7,-1
8040a664:	01412e03          	lw	t3,20(sp)
8040a668:	01812803          	lw	a6,24(sp)
8040a66c:	01151463          	bne	a0,a7,8040a674 <stride_dequeue+0x85c>
8040a670:	59c0206f          	j	8040cc0c <stride_dequeue+0x2df4>
8040a674:	008e2583          	lw	a1,8(t3)
8040a678:	000a0513          	mv	a0,s4
8040a67c:	004e2b03          	lw	s6,4(t3)
8040a680:	01012c23          	sw	a6,24(sp)
8040a684:	01c12a23          	sw	t3,20(sp)
8040a688:	cb8ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040a68c:	01412e03          	lw	t3,20(sp)
8040a690:	01812803          	lw	a6,24(sp)
8040a694:	00ae2223          	sw	a0,4(t3)
8040a698:	016e2423          	sw	s6,8(t3)
8040a69c:	00051463          	bnez	a0,8040a6a4 <stride_dequeue+0x88c>
8040a6a0:	7d00206f          	j	8040ce70 <stride_dequeue+0x3058>
8040a6a4:	008c2b03          	lw	s6,8(s8)
8040a6a8:	01c52023          	sw	t3,0(a0)
8040a6ac:	000e0a13          	mv	s4,t3
8040a6b0:	01012783          	lw	a5,16(sp)
8040a6b4:	0149a223          	sw	s4,4(s3)
8040a6b8:	00f9a423          	sw	a5,8(s3)
8040a6bc:	013a2023          	sw	s3,0(s4)
8040a6c0:	00c12783          	lw	a5,12(sp)
8040a6c4:	01382223          	sw	s3,4(a6)
8040a6c8:	00080a13          	mv	s4,a6
8040a6cc:	00f82423          	sw	a5,8(a6)
8040a6d0:	0109a023          	sw	a6,0(s3)
8040a6d4:	000b0993          	mv	s3,s6
8040a6d8:	00812783          	lw	a5,8(sp)
8040a6dc:	014ca223          	sw	s4,4(s9)
8040a6e0:	00fca423          	sw	a5,8(s9)
8040a6e4:	019a2023          	sw	s9,0(s4)
8040a6e8:	00412783          	lw	a5,4(sp)
8040a6ec:	019da223          	sw	s9,4(s11)
8040a6f0:	00fda423          	sw	a5,8(s11)
8040a6f4:	01bca023          	sw	s11,0(s9)
8040a6f8:	b41ff06f          	j	8040a238 <stride_dequeue+0x420>
8040a6fc:	004da783          	lw	a5,4(s11)
8040a700:	008da603          	lw	a2,8(s11)
8040a704:	00f12023          	sw	a5,0(sp)
8040a708:	14060463          	beqz	a2,8040a850 <stride_dequeue+0xa38>
8040a70c:	00060513          	mv	a0,a2
8040a710:	000a0593          	mv	a1,s4
8040a714:	00c12223          	sw	a2,4(sp)
8040a718:	b6cff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a71c:	fff00893          	li	a7,-1
8040a720:	00412603          	lw	a2,4(sp)
8040a724:	111502e3          	beq	a0,a7,8040b028 <stride_dequeue+0x1210>
8040a728:	004a2783          	lw	a5,4(s4)
8040a72c:	008a2803          	lw	a6,8(s4)
8040a730:	00f12223          	sw	a5,4(sp)
8040a734:	10080663          	beqz	a6,8040a840 <stride_dequeue+0xa28>
8040a738:	00080593          	mv	a1,a6
8040a73c:	00060513          	mv	a0,a2
8040a740:	01012623          	sw	a6,12(sp)
8040a744:	00c12423          	sw	a2,8(sp)
8040a748:	b3cff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a74c:	fff00893          	li	a7,-1
8040a750:	00812603          	lw	a2,8(sp)
8040a754:	00c12803          	lw	a6,12(sp)
8040a758:	01151463          	bne	a0,a7,8040a760 <stride_dequeue+0x948>
8040a75c:	5540106f          	j	8040bcb0 <stride_dequeue+0x1e98>
8040a760:	00482783          	lw	a5,4(a6)
8040a764:	00882983          	lw	s3,8(a6)
8040a768:	00f12423          	sw	a5,8(sp)
8040a76c:	00099463          	bnez	s3,8040a774 <stride_dequeue+0x95c>
8040a770:	1980206f          	j	8040c908 <stride_dequeue+0x2af0>
8040a774:	00060513          	mv	a0,a2
8040a778:	00098593          	mv	a1,s3
8040a77c:	01012823          	sw	a6,16(sp)
8040a780:	00c12623          	sw	a2,12(sp)
8040a784:	b00ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a788:	fff00893          	li	a7,-1
8040a78c:	00c12603          	lw	a2,12(sp)
8040a790:	01012803          	lw	a6,16(sp)
8040a794:	01151463          	bne	a0,a7,8040a79c <stride_dequeue+0x984>
8040a798:	4290106f          	j	8040c3c0 <stride_dequeue+0x25a8>
8040a79c:	0049a783          	lw	a5,4(s3)
8040a7a0:	0089ae03          	lw	t3,8(s3)
8040a7a4:	00f12623          	sw	a5,12(sp)
8040a7a8:	060e0863          	beqz	t3,8040a818 <stride_dequeue+0xa00>
8040a7ac:	000e0593          	mv	a1,t3
8040a7b0:	00060513          	mv	a0,a2
8040a7b4:	01012c23          	sw	a6,24(sp)
8040a7b8:	01c12a23          	sw	t3,20(sp)
8040a7bc:	00c12823          	sw	a2,16(sp)
8040a7c0:	ac4ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a7c4:	01812803          	lw	a6,24(sp)
8040a7c8:	01412e03          	lw	t3,20(sp)
8040a7cc:	fff00893          	li	a7,-1
8040a7d0:	01012a23          	sw	a6,20(sp)
8040a7d4:	01012603          	lw	a2,16(sp)
8040a7d8:	01151463          	bne	a0,a7,8040a7e0 <stride_dequeue+0x9c8>
8040a7dc:	3a00206f          	j	8040cb7c <stride_dequeue+0x2d64>
8040a7e0:	008e2583          	lw	a1,8(t3)
8040a7e4:	00060513          	mv	a0,a2
8040a7e8:	004e2b03          	lw	s6,4(t3)
8040a7ec:	01c12823          	sw	t3,16(sp)
8040a7f0:	b50ff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040a7f4:	01012e03          	lw	t3,16(sp)
8040a7f8:	01412803          	lw	a6,20(sp)
8040a7fc:	00ae2223          	sw	a0,4(t3)
8040a800:	016e2423          	sw	s6,8(t3)
8040a804:	00051463          	bnez	a0,8040a80c <stride_dequeue+0x9f4>
8040a808:	62c0206f          	j	8040ce34 <stride_dequeue+0x301c>
8040a80c:	008c2b03          	lw	s6,8(s8)
8040a810:	01c52023          	sw	t3,0(a0)
8040a814:	000e0613          	mv	a2,t3
8040a818:	00c12783          	lw	a5,12(sp)
8040a81c:	00c9a223          	sw	a2,4(s3)
8040a820:	00f9a423          	sw	a5,8(s3)
8040a824:	01362023          	sw	s3,0(a2)
8040a828:	00812783          	lw	a5,8(sp)
8040a82c:	01382223          	sw	s3,4(a6)
8040a830:	00080613          	mv	a2,a6
8040a834:	00f82423          	sw	a5,8(a6)
8040a838:	0109a023          	sw	a6,0(s3)
8040a83c:	000b0993          	mv	s3,s6
8040a840:	00412783          	lw	a5,4(sp)
8040a844:	00ca2223          	sw	a2,4(s4)
8040a848:	00fa2423          	sw	a5,8(s4)
8040a84c:	01462023          	sw	s4,0(a2)
8040a850:	00012783          	lw	a5,0(sp)
8040a854:	014da223          	sw	s4,4(s11)
8040a858:	00fda423          	sw	a5,8(s11)
8040a85c:	01ba2023          	sw	s11,0(s4)
8040a860:	000d8a13          	mv	s4,s11
8040a864:	badff06f          	j	8040a410 <stride_dequeue+0x5f8>
8040a868:	00492783          	lw	a5,4(s2)
8040a86c:	00892883          	lw	a7,8(s2)
8040a870:	00a12623          	sw	a0,12(sp)
8040a874:	00f12423          	sw	a5,8(sp)
8040a878:	0e088863          	beqz	a7,8040a968 <stride_dequeue+0xb50>
8040a87c:	00088513          	mv	a0,a7
8040a880:	000c8593          	mv	a1,s9
8040a884:	01112823          	sw	a7,16(sp)
8040a888:	9fcff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a88c:	00c12803          	lw	a6,12(sp)
8040a890:	01012883          	lw	a7,16(sp)
8040a894:	2f050ce3          	beq	a0,a6,8040b38c <stride_dequeue+0x1574>
8040a898:	004ca783          	lw	a5,4(s9)
8040a89c:	008ca303          	lw	t1,8(s9)
8040a8a0:	01012823          	sw	a6,16(sp)
8040a8a4:	00f12623          	sw	a5,12(sp)
8040a8a8:	0a030863          	beqz	t1,8040a958 <stride_dequeue+0xb40>
8040a8ac:	00030593          	mv	a1,t1
8040a8b0:	00088513          	mv	a0,a7
8040a8b4:	00612c23          	sw	t1,24(sp)
8040a8b8:	01112a23          	sw	a7,20(sp)
8040a8bc:	9c8ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a8c0:	01012803          	lw	a6,16(sp)
8040a8c4:	01412883          	lw	a7,20(sp)
8040a8c8:	01812303          	lw	t1,24(sp)
8040a8cc:	01051463          	bne	a0,a6,8040a8d4 <stride_dequeue+0xabc>
8040a8d0:	6f00106f          	j	8040bfc0 <stride_dequeue+0x21a8>
8040a8d4:	00432783          	lw	a5,4(t1)
8040a8d8:	00832983          	lw	s3,8(t1)
8040a8dc:	01012a23          	sw	a6,20(sp)
8040a8e0:	00f12823          	sw	a5,16(sp)
8040a8e4:	00099463          	bnez	s3,8040a8ec <stride_dequeue+0xad4>
8040a8e8:	3e50106f          	j	8040c4cc <stride_dequeue+0x26b4>
8040a8ec:	00088513          	mv	a0,a7
8040a8f0:	00098593          	mv	a1,s3
8040a8f4:	00612e23          	sw	t1,28(sp)
8040a8f8:	01112c23          	sw	a7,24(sp)
8040a8fc:	988ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a900:	01412803          	lw	a6,20(sp)
8040a904:	01812883          	lw	a7,24(sp)
8040a908:	01c12303          	lw	t1,28(sp)
8040a90c:	01051463          	bne	a0,a6,8040a914 <stride_dequeue+0xafc>
8040a910:	6d90106f          	j	8040c7e8 <stride_dequeue+0x29d0>
8040a914:	0089a583          	lw	a1,8(s3)
8040a918:	0049ab03          	lw	s6,4(s3)
8040a91c:	00088513          	mv	a0,a7
8040a920:	00612a23          	sw	t1,20(sp)
8040a924:	a1cff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040a928:	00a9a223          	sw	a0,4(s3)
8040a92c:	0169a423          	sw	s6,8(s3)
8040a930:	01412303          	lw	t1,20(sp)
8040a934:	00050463          	beqz	a0,8040a93c <stride_dequeue+0xb24>
8040a938:	01352023          	sw	s3,0(a0)
8040a93c:	008c2b03          	lw	s6,8(s8)
8040a940:	01012783          	lw	a5,16(sp)
8040a944:	01332223          	sw	s3,4(t1)
8040a948:	00030893          	mv	a7,t1
8040a94c:	00f32423          	sw	a5,8(t1)
8040a950:	0069a023          	sw	t1,0(s3)
8040a954:	000b0993          	mv	s3,s6
8040a958:	00c12783          	lw	a5,12(sp)
8040a95c:	011ca223          	sw	a7,4(s9)
8040a960:	00fca423          	sw	a5,8(s9)
8040a964:	0198a023          	sw	s9,0(a7) # 2000 <_binary_bin_swap_img_size-0x6000>
8040a968:	00812783          	lw	a5,8(sp)
8040a96c:	01992223          	sw	s9,4(s2)
8040a970:	00f92423          	sw	a5,8(s2)
8040a974:	012ca023          	sw	s2,0(s9)
8040a978:	ea0ff06f          	j	8040a018 <stride_dequeue+0x200>
8040a97c:	00492783          	lw	a5,4(s2)
8040a980:	00892c83          	lw	s9,8(s2)
8040a984:	00f12223          	sw	a5,4(sp)
8040a988:	120c8463          	beqz	s9,8040aab0 <stride_dequeue+0xc98>
8040a98c:	000d8593          	mv	a1,s11
8040a990:	000c8513          	mv	a0,s9
8040a994:	8f0ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a998:	fff00893          	li	a7,-1
8040a99c:	27150663          	beq	a0,a7,8040ac08 <stride_dequeue+0xdf0>
8040a9a0:	004da783          	lw	a5,4(s11)
8040a9a4:	008da803          	lw	a6,8(s11)
8040a9a8:	00f12423          	sw	a5,8(sp)
8040a9ac:	0e080a63          	beqz	a6,8040aaa0 <stride_dequeue+0xc88>
8040a9b0:	00080593          	mv	a1,a6
8040a9b4:	000c8513          	mv	a0,s9
8040a9b8:	01012623          	sw	a6,12(sp)
8040a9bc:	8c8ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a9c0:	fff00893          	li	a7,-1
8040a9c4:	00c12803          	lw	a6,12(sp)
8040a9c8:	29150ee3          	beq	a0,a7,8040b464 <stride_dequeue+0x164c>
8040a9cc:	00482783          	lw	a5,4(a6)
8040a9d0:	00882303          	lw	t1,8(a6)
8040a9d4:	00f12623          	sw	a5,12(sp)
8040a9d8:	0a030a63          	beqz	t1,8040aa8c <stride_dequeue+0xc74>
8040a9dc:	00030593          	mv	a1,t1
8040a9e0:	000c8513          	mv	a0,s9
8040a9e4:	01012a23          	sw	a6,20(sp)
8040a9e8:	00612823          	sw	t1,16(sp)
8040a9ec:	898ff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040a9f0:	fff00893          	li	a7,-1
8040a9f4:	01012303          	lw	t1,16(sp)
8040a9f8:	01412803          	lw	a6,20(sp)
8040a9fc:	01151463          	bne	a0,a7,8040aa04 <stride_dequeue+0xbec>
8040aa00:	4b80106f          	j	8040beb8 <stride_dequeue+0x20a0>
8040aa04:	00432783          	lw	a5,4(t1)
8040aa08:	00832983          	lw	s3,8(t1)
8040aa0c:	00f12823          	sw	a5,16(sp)
8040aa10:	00099463          	bnez	s3,8040aa18 <stride_dequeue+0xc00>
8040aa14:	4c10106f          	j	8040c6d4 <stride_dequeue+0x28bc>
8040aa18:	00098593          	mv	a1,s3
8040aa1c:	000c8513          	mv	a0,s9
8040aa20:	00612c23          	sw	t1,24(sp)
8040aa24:	01012a23          	sw	a6,20(sp)
8040aa28:	85cff0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040aa2c:	fff00893          	li	a7,-1
8040aa30:	01412803          	lw	a6,20(sp)
8040aa34:	01812303          	lw	t1,24(sp)
8040aa38:	01151463          	bne	a0,a7,8040aa40 <stride_dequeue+0xc28>
8040aa3c:	5e90106f          	j	8040c824 <stride_dequeue+0x2a0c>
8040aa40:	0089a583          	lw	a1,8(s3)
8040aa44:	0049ab03          	lw	s6,4(s3)
8040aa48:	000c8513          	mv	a0,s9
8040aa4c:	00612c23          	sw	t1,24(sp)
8040aa50:	01012a23          	sw	a6,20(sp)
8040aa54:	8ecff0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040aa58:	00a9a223          	sw	a0,4(s3)
8040aa5c:	0169a423          	sw	s6,8(s3)
8040aa60:	01412803          	lw	a6,20(sp)
8040aa64:	01812303          	lw	t1,24(sp)
8040aa68:	00050463          	beqz	a0,8040aa70 <stride_dequeue+0xc58>
8040aa6c:	01352023          	sw	s3,0(a0)
8040aa70:	008c2b03          	lw	s6,8(s8)
8040aa74:	01012783          	lw	a5,16(sp)
8040aa78:	01332223          	sw	s3,4(t1)
8040aa7c:	00030c93          	mv	s9,t1
8040aa80:	00f32423          	sw	a5,8(t1)
8040aa84:	0069a023          	sw	t1,0(s3)
8040aa88:	000b0993          	mv	s3,s6
8040aa8c:	00c12783          	lw	a5,12(sp)
8040aa90:	01982223          	sw	s9,4(a6)
8040aa94:	00f82423          	sw	a5,8(a6)
8040aa98:	010ca023          	sw	a6,0(s9)
8040aa9c:	00080c93          	mv	s9,a6
8040aaa0:	00812783          	lw	a5,8(sp)
8040aaa4:	019da223          	sw	s9,4(s11)
8040aaa8:	00fda423          	sw	a5,8(s11)
8040aaac:	01bca023          	sw	s11,0(s9)
8040aab0:	00412783          	lw	a5,4(sp)
8040aab4:	01b92223          	sw	s11,4(s2)
8040aab8:	00f92423          	sw	a5,8(s2)
8040aabc:	012da023          	sw	s2,0(s11)
8040aac0:	d6cff06f          	j	8040a02c <stride_dequeue+0x214>
8040aac4:	004ca783          	lw	a5,4(s9)
8040aac8:	008caa03          	lw	s4,8(s9)
8040aacc:	00f12223          	sw	a5,4(sp)
8040aad0:	120a0063          	beqz	s4,8040abf0 <stride_dequeue+0xdd8>
8040aad4:	00040593          	mv	a1,s0
8040aad8:	000a0513          	mv	a0,s4
8040aadc:	fa9fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040aae0:	fff00893          	li	a7,-1
8040aae4:	49150ee3          	beq	a0,a7,8040b780 <stride_dequeue+0x1968>
8040aae8:	00442783          	lw	a5,4(s0)
8040aaec:	00842983          	lw	s3,8(s0)
8040aaf0:	00f12423          	sw	a5,8(sp)
8040aaf4:	00099463          	bnez	s3,8040aafc <stride_dequeue+0xce4>
8040aaf8:	4710106f          	j	8040c768 <stride_dequeue+0x2950>
8040aafc:	00098593          	mv	a1,s3
8040ab00:	000a0513          	mv	a0,s4
8040ab04:	f81fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ab08:	fff00893          	li	a7,-1
8040ab0c:	01151463          	bne	a0,a7,8040ab14 <stride_dequeue+0xcfc>
8040ab10:	5dc0106f          	j	8040c0ec <stride_dequeue+0x22d4>
8040ab14:	0049a783          	lw	a5,4(s3)
8040ab18:	0089a303          	lw	t1,8(s3)
8040ab1c:	00f12623          	sw	a5,12(sp)
8040ab20:	0a030663          	beqz	t1,8040abcc <stride_dequeue+0xdb4>
8040ab24:	00030593          	mv	a1,t1
8040ab28:	000a0513          	mv	a0,s4
8040ab2c:	00612823          	sw	t1,16(sp)
8040ab30:	f55fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ab34:	fff00893          	li	a7,-1
8040ab38:	01012303          	lw	t1,16(sp)
8040ab3c:	01151463          	bne	a0,a7,8040ab44 <stride_dequeue+0xd2c>
8040ab40:	1cc0206f          	j	8040cd0c <stride_dequeue+0x2ef4>
8040ab44:	00432783          	lw	a5,4(t1)
8040ab48:	00832e03          	lw	t3,8(t1)
8040ab4c:	00f12823          	sw	a5,16(sp)
8040ab50:	060e0463          	beqz	t3,8040abb8 <stride_dequeue+0xda0>
8040ab54:	000e0593          	mv	a1,t3
8040ab58:	000a0513          	mv	a0,s4
8040ab5c:	00612c23          	sw	t1,24(sp)
8040ab60:	01c12a23          	sw	t3,20(sp)
8040ab64:	f21fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ab68:	fff00893          	li	a7,-1
8040ab6c:	01412e03          	lw	t3,20(sp)
8040ab70:	01812303          	lw	t1,24(sp)
8040ab74:	01151463          	bne	a0,a7,8040ab7c <stride_dequeue+0xd64>
8040ab78:	66c0206f          	j	8040d1e4 <stride_dequeue+0x33cc>
8040ab7c:	008e2583          	lw	a1,8(t3)
8040ab80:	000a0513          	mv	a0,s4
8040ab84:	004e2b03          	lw	s6,4(t3)
8040ab88:	00612c23          	sw	t1,24(sp)
8040ab8c:	01c12a23          	sw	t3,20(sp)
8040ab90:	fb1fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ab94:	01412e03          	lw	t3,20(sp)
8040ab98:	01812303          	lw	t1,24(sp)
8040ab9c:	00ae2223          	sw	a0,4(t3)
8040aba0:	016e2423          	sw	s6,8(t3)
8040aba4:	00051463          	bnez	a0,8040abac <stride_dequeue+0xd94>
8040aba8:	1110206f          	j	8040d4b8 <stride_dequeue+0x36a0>
8040abac:	008c2b03          	lw	s6,8(s8)
8040abb0:	01c52023          	sw	t3,0(a0)
8040abb4:	000e0a13          	mv	s4,t3
8040abb8:	01012783          	lw	a5,16(sp)
8040abbc:	01432223          	sw	s4,4(t1)
8040abc0:	00f32423          	sw	a5,8(t1)
8040abc4:	006a2023          	sw	t1,0(s4)
8040abc8:	00030a13          	mv	s4,t1
8040abcc:	00c12783          	lw	a5,12(sp)
8040abd0:	0149a223          	sw	s4,4(s3)
8040abd4:	00f9a423          	sw	a5,8(s3)
8040abd8:	013a2023          	sw	s3,0(s4)
8040abdc:	00812783          	lw	a5,8(sp)
8040abe0:	01342223          	sw	s3,4(s0)
8040abe4:	00f42423          	sw	a5,8(s0)
8040abe8:	0089a023          	sw	s0,0(s3)
8040abec:	000b0993          	mv	s3,s6
8040abf0:	00412783          	lw	a5,4(sp)
8040abf4:	008ca223          	sw	s0,4(s9)
8040abf8:	00fca423          	sw	a5,8(s9)
8040abfc:	01942023          	sw	s9,0(s0)
8040ac00:	000c8413          	mv	s0,s9
8040ac04:	999ff06f          	j	8040a59c <stride_dequeue+0x784>
8040ac08:	004ca783          	lw	a5,4(s9)
8040ac0c:	008ca883          	lw	a7,8(s9)
8040ac10:	00a12623          	sw	a0,12(sp)
8040ac14:	00f12423          	sw	a5,8(sp)
8040ac18:	0e088663          	beqz	a7,8040ad04 <stride_dequeue+0xeec>
8040ac1c:	00088513          	mv	a0,a7
8040ac20:	000d8593          	mv	a1,s11
8040ac24:	01112823          	sw	a7,16(sp)
8040ac28:	e5dfe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ac2c:	00c12803          	lw	a6,12(sp)
8040ac30:	01012883          	lw	a7,16(sp)
8040ac34:	41050ae3          	beq	a0,a6,8040b848 <stride_dequeue+0x1a30>
8040ac38:	004da783          	lw	a5,4(s11)
8040ac3c:	008da983          	lw	s3,8(s11)
8040ac40:	01012823          	sw	a6,16(sp)
8040ac44:	00f12623          	sw	a5,12(sp)
8040ac48:	00099463          	bnez	s3,8040ac50 <stride_dequeue+0xe38>
8040ac4c:	4b50106f          	j	8040c900 <stride_dequeue+0x2ae8>
8040ac50:	00088513          	mv	a0,a7
8040ac54:	00098593          	mv	a1,s3
8040ac58:	01112a23          	sw	a7,20(sp)
8040ac5c:	e29fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ac60:	01012803          	lw	a6,16(sp)
8040ac64:	01412883          	lw	a7,20(sp)
8040ac68:	01051463          	bne	a0,a6,8040ac70 <stride_dequeue+0xe58>
8040ac6c:	64c0106f          	j	8040c2b8 <stride_dequeue+0x24a0>
8040ac70:	0049a783          	lw	a5,4(s3)
8040ac74:	0089ae03          	lw	t3,8(s3)
8040ac78:	01012a23          	sw	a6,20(sp)
8040ac7c:	00f12823          	sw	a5,16(sp)
8040ac80:	060e0063          	beqz	t3,8040ace0 <stride_dequeue+0xec8>
8040ac84:	000e0593          	mv	a1,t3
8040ac88:	00088513          	mv	a0,a7
8040ac8c:	01c12e23          	sw	t3,28(sp)
8040ac90:	01112c23          	sw	a7,24(sp)
8040ac94:	df1fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ac98:	01412803          	lw	a6,20(sp)
8040ac9c:	01812883          	lw	a7,24(sp)
8040aca0:	01c12e03          	lw	t3,28(sp)
8040aca4:	01051463          	bne	a0,a6,8040acac <stride_dequeue+0xe94>
8040aca8:	0bc0206f          	j	8040cd64 <stride_dequeue+0x2f4c>
8040acac:	008e2583          	lw	a1,8(t3)
8040acb0:	00088513          	mv	a0,a7
8040acb4:	004e2b03          	lw	s6,4(t3)
8040acb8:	01c12a23          	sw	t3,20(sp)
8040acbc:	e85fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040acc0:	01412e03          	lw	t3,20(sp)
8040acc4:	00ae2223          	sw	a0,4(t3)
8040acc8:	016e2423          	sw	s6,8(t3)
8040accc:	00051463          	bnez	a0,8040acd4 <stride_dequeue+0xebc>
8040acd0:	2380206f          	j	8040cf08 <stride_dequeue+0x30f0>
8040acd4:	008c2b03          	lw	s6,8(s8)
8040acd8:	01c52023          	sw	t3,0(a0)
8040acdc:	000e0893          	mv	a7,t3
8040ace0:	01012783          	lw	a5,16(sp)
8040ace4:	0119a223          	sw	a7,4(s3)
8040ace8:	00f9a423          	sw	a5,8(s3)
8040acec:	0138a023          	sw	s3,0(a7)
8040acf0:	00c12783          	lw	a5,12(sp)
8040acf4:	013da223          	sw	s3,4(s11)
8040acf8:	00fda423          	sw	a5,8(s11)
8040acfc:	01b9a023          	sw	s11,0(s3)
8040ad00:	000b0993          	mv	s3,s6
8040ad04:	00812783          	lw	a5,8(sp)
8040ad08:	01bca223          	sw	s11,4(s9)
8040ad0c:	00fca423          	sw	a5,8(s9)
8040ad10:	019da023          	sw	s9,0(s11)
8040ad14:	000c8d93          	mv	s11,s9
8040ad18:	d99ff06f          	j	8040aab0 <stride_dequeue+0xc98>
8040ad1c:	004da783          	lw	a5,4(s11)
8040ad20:	008da883          	lw	a7,8(s11)
8040ad24:	00a12423          	sw	a0,8(sp)
8040ad28:	00f12223          	sw	a5,4(sp)
8040ad2c:	10088663          	beqz	a7,8040ae38 <stride_dequeue+0x1020>
8040ad30:	00060593          	mv	a1,a2
8040ad34:	00088513          	mv	a0,a7
8040ad38:	00c12823          	sw	a2,16(sp)
8040ad3c:	01112623          	sw	a7,12(sp)
8040ad40:	d45fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ad44:	00812803          	lw	a6,8(sp)
8040ad48:	00c12883          	lw	a7,12(sp)
8040ad4c:	01012603          	lw	a2,16(sp)
8040ad50:	670508e3          	beq	a0,a6,8040bbc0 <stride_dequeue+0x1da8>
8040ad54:	00462783          	lw	a5,4(a2)
8040ad58:	00862983          	lw	s3,8(a2)
8040ad5c:	01012623          	sw	a6,12(sp)
8040ad60:	00f12423          	sw	a5,8(sp)
8040ad64:	00099463          	bnez	s3,8040ad6c <stride_dequeue+0xf54>
8040ad68:	3910106f          	j	8040c8f8 <stride_dequeue+0x2ae0>
8040ad6c:	00088513          	mv	a0,a7
8040ad70:	00098593          	mv	a1,s3
8040ad74:	00c12a23          	sw	a2,20(sp)
8040ad78:	01112823          	sw	a7,16(sp)
8040ad7c:	d09fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ad80:	00c12803          	lw	a6,12(sp)
8040ad84:	01012883          	lw	a7,16(sp)
8040ad88:	01412603          	lw	a2,20(sp)
8040ad8c:	01051463          	bne	a0,a6,8040ad94 <stride_dequeue+0xf7c>
8040ad90:	5a40106f          	j	8040c334 <stride_dequeue+0x251c>
8040ad94:	0049a783          	lw	a5,4(s3)
8040ad98:	0089ae03          	lw	t3,8(s3)
8040ad9c:	01012823          	sw	a6,16(sp)
8040ada0:	00f12623          	sw	a5,12(sp)
8040ada4:	060e0863          	beqz	t3,8040ae14 <stride_dequeue+0xffc>
8040ada8:	000e0593          	mv	a1,t3
8040adac:	00088513          	mv	a0,a7
8040adb0:	00c12e23          	sw	a2,28(sp)
8040adb4:	01c12c23          	sw	t3,24(sp)
8040adb8:	01112a23          	sw	a7,20(sp)
8040adbc:	cc9fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040adc0:	01c12603          	lw	a2,28(sp)
8040adc4:	01012803          	lw	a6,16(sp)
8040adc8:	01412883          	lw	a7,20(sp)
8040adcc:	00c12a23          	sw	a2,20(sp)
8040add0:	01812e03          	lw	t3,24(sp)
8040add4:	01051463          	bne	a0,a6,8040addc <stride_dequeue+0xfc4>
8040add8:	5210106f          	j	8040caf8 <stride_dequeue+0x2ce0>
8040addc:	008e2583          	lw	a1,8(t3)
8040ade0:	00088513          	mv	a0,a7
8040ade4:	004e2b03          	lw	s6,4(t3)
8040ade8:	01c12823          	sw	t3,16(sp)
8040adec:	d55fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040adf0:	01012e03          	lw	t3,16(sp)
8040adf4:	01412603          	lw	a2,20(sp)
8040adf8:	00ae2223          	sw	a0,4(t3)
8040adfc:	016e2423          	sw	s6,8(t3)
8040ae00:	00051463          	bnez	a0,8040ae08 <stride_dequeue+0xff0>
8040ae04:	1280206f          	j	8040cf2c <stride_dequeue+0x3114>
8040ae08:	008c2b03          	lw	s6,8(s8)
8040ae0c:	01c52023          	sw	t3,0(a0)
8040ae10:	000e0893          	mv	a7,t3
8040ae14:	00c12783          	lw	a5,12(sp)
8040ae18:	0119a223          	sw	a7,4(s3)
8040ae1c:	00f9a423          	sw	a5,8(s3)
8040ae20:	0138a023          	sw	s3,0(a7)
8040ae24:	00812783          	lw	a5,8(sp)
8040ae28:	01362223          	sw	s3,4(a2)
8040ae2c:	00f62423          	sw	a5,8(a2)
8040ae30:	00c9a023          	sw	a2,0(s3)
8040ae34:	000b0993          	mv	s3,s6
8040ae38:	00412783          	lw	a5,4(sp)
8040ae3c:	00cda223          	sw	a2,4(s11)
8040ae40:	00fda423          	sw	a5,8(s11)
8040ae44:	01b62023          	sw	s11,0(a2)
8040ae48:	db8ff06f          	j	8040a400 <stride_dequeue+0x5e8>
8040ae4c:	004da783          	lw	a5,4(s11)
8040ae50:	008da883          	lw	a7,8(s11)
8040ae54:	00a12623          	sw	a0,12(sp)
8040ae58:	00f12423          	sw	a5,8(sp)
8040ae5c:	0e088663          	beqz	a7,8040af48 <stride_dequeue+0x1130>
8040ae60:	00088513          	mv	a0,a7
8040ae64:	000a0593          	mv	a1,s4
8040ae68:	01112823          	sw	a7,16(sp)
8040ae6c:	c19fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ae70:	00c12803          	lw	a6,12(sp)
8040ae74:	01012883          	lw	a7,16(sp)
8040ae78:	2b0508e3          	beq	a0,a6,8040b928 <stride_dequeue+0x1b10>
8040ae7c:	004a2783          	lw	a5,4(s4)
8040ae80:	008a2983          	lw	s3,8(s4)
8040ae84:	01012823          	sw	a6,16(sp)
8040ae88:	00f12623          	sw	a5,12(sp)
8040ae8c:	00099463          	bnez	s3,8040ae94 <stride_dequeue+0x107c>
8040ae90:	2810106f          	j	8040c910 <stride_dequeue+0x2af8>
8040ae94:	00088513          	mv	a0,a7
8040ae98:	00098593          	mv	a1,s3
8040ae9c:	01112a23          	sw	a7,20(sp)
8040aea0:	be5fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040aea4:	01012803          	lw	a6,16(sp)
8040aea8:	01412883          	lw	a7,20(sp)
8040aeac:	01051463          	bne	a0,a6,8040aeb4 <stride_dequeue+0x109c>
8040aeb0:	38c0106f          	j	8040c23c <stride_dequeue+0x2424>
8040aeb4:	0049a783          	lw	a5,4(s3)
8040aeb8:	0089ae03          	lw	t3,8(s3)
8040aebc:	01012a23          	sw	a6,20(sp)
8040aec0:	00f12823          	sw	a5,16(sp)
8040aec4:	060e0063          	beqz	t3,8040af24 <stride_dequeue+0x110c>
8040aec8:	000e0593          	mv	a1,t3
8040aecc:	00088513          	mv	a0,a7
8040aed0:	01c12e23          	sw	t3,28(sp)
8040aed4:	01112c23          	sw	a7,24(sp)
8040aed8:	badfe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040aedc:	01412803          	lw	a6,20(sp)
8040aee0:	01812883          	lw	a7,24(sp)
8040aee4:	01c12e03          	lw	t3,28(sp)
8040aee8:	01051463          	bne	a0,a6,8040aef0 <stride_dequeue+0x10d8>
8040aeec:	2890106f          	j	8040c974 <stride_dequeue+0x2b5c>
8040aef0:	008e2583          	lw	a1,8(t3)
8040aef4:	00088513          	mv	a0,a7
8040aef8:	004e2b03          	lw	s6,4(t3)
8040aefc:	01c12a23          	sw	t3,20(sp)
8040af00:	c41fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040af04:	01412e03          	lw	t3,20(sp)
8040af08:	00ae2223          	sw	a0,4(t3)
8040af0c:	016e2423          	sw	s6,8(t3)
8040af10:	00051463          	bnez	a0,8040af18 <stride_dequeue+0x1100>
8040af14:	7b50106f          	j	8040cec8 <stride_dequeue+0x30b0>
8040af18:	008c2b03          	lw	s6,8(s8)
8040af1c:	01c52023          	sw	t3,0(a0)
8040af20:	000e0893          	mv	a7,t3
8040af24:	01012783          	lw	a5,16(sp)
8040af28:	0119a223          	sw	a7,4(s3)
8040af2c:	00f9a423          	sw	a5,8(s3)
8040af30:	0138a023          	sw	s3,0(a7)
8040af34:	00c12783          	lw	a5,12(sp)
8040af38:	013a2223          	sw	s3,4(s4)
8040af3c:	00fa2423          	sw	a5,8(s4)
8040af40:	0149a023          	sw	s4,0(s3)
8040af44:	000b0993          	mv	s3,s6
8040af48:	00812783          	lw	a5,8(sp)
8040af4c:	014da223          	sw	s4,4(s11)
8040af50:	00fda423          	sw	a5,8(s11)
8040af54:	01ba2023          	sw	s11,0(s4)
8040af58:	accff06f          	j	8040a224 <stride_dequeue+0x40c>
8040af5c:	00492783          	lw	a5,4(s2)
8040af60:	00892883          	lw	a7,8(s2)
8040af64:	00a12823          	sw	a0,16(sp)
8040af68:	00f12623          	sw	a5,12(sp)
8040af6c:	0a088463          	beqz	a7,8040b014 <stride_dequeue+0x11fc>
8040af70:	00080593          	mv	a1,a6
8040af74:	00088513          	mv	a0,a7
8040af78:	01012c23          	sw	a6,24(sp)
8040af7c:	01112a23          	sw	a7,20(sp)
8040af80:	b05fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040af84:	01012303          	lw	t1,16(sp)
8040af88:	01412883          	lw	a7,20(sp)
8040af8c:	01812803          	lw	a6,24(sp)
8040af90:	606508e3          	beq	a0,t1,8040bda0 <stride_dequeue+0x1f88>
8040af94:	00482783          	lw	a5,4(a6)
8040af98:	00882983          	lw	s3,8(a6)
8040af9c:	00612a23          	sw	t1,20(sp)
8040afa0:	00f12823          	sw	a5,16(sp)
8040afa4:	00099463          	bnez	s3,8040afac <stride_dequeue+0x1194>
8040afa8:	28c0106f          	j	8040c234 <stride_dequeue+0x241c>
8040afac:	00088513          	mv	a0,a7
8040afb0:	00098593          	mv	a1,s3
8040afb4:	01012e23          	sw	a6,28(sp)
8040afb8:	01112c23          	sw	a7,24(sp)
8040afbc:	ac9fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040afc0:	01412303          	lw	t1,20(sp)
8040afc4:	01812883          	lw	a7,24(sp)
8040afc8:	01c12803          	lw	a6,28(sp)
8040afcc:	00651463          	bne	a0,t1,8040afd4 <stride_dequeue+0x11bc>
8040afd0:	0bd0106f          	j	8040c88c <stride_dequeue+0x2a74>
8040afd4:	0089a583          	lw	a1,8(s3)
8040afd8:	0049ab03          	lw	s6,4(s3)
8040afdc:	00088513          	mv	a0,a7
8040afe0:	01012a23          	sw	a6,20(sp)
8040afe4:	b5dfe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040afe8:	00a9a223          	sw	a0,4(s3)
8040afec:	0169a423          	sw	s6,8(s3)
8040aff0:	01412803          	lw	a6,20(sp)
8040aff4:	00050463          	beqz	a0,8040affc <stride_dequeue+0x11e4>
8040aff8:	01352023          	sw	s3,0(a0)
8040affc:	008c2b03          	lw	s6,8(s8)
8040b000:	01012783          	lw	a5,16(sp)
8040b004:	01382223          	sw	s3,4(a6)
8040b008:	00f82423          	sw	a5,8(a6)
8040b00c:	0109a023          	sw	a6,0(s3)
8040b010:	000b0993          	mv	s3,s6
8040b014:	00c12783          	lw	a5,12(sp)
8040b018:	01092223          	sw	a6,4(s2)
8040b01c:	00f92423          	sw	a5,8(s2)
8040b020:	01282023          	sw	s2,0(a6)
8040b024:	fe1fe06f          	j	8040a004 <stride_dequeue+0x1ec>
8040b028:	00462783          	lw	a5,4(a2)
8040b02c:	00862983          	lw	s3,8(a2)
8040b030:	00a12423          	sw	a0,8(sp)
8040b034:	00f12223          	sw	a5,4(sp)
8040b038:	10098663          	beqz	s3,8040b144 <stride_dequeue+0x132c>
8040b03c:	000a0593          	mv	a1,s4
8040b040:	00098513          	mv	a0,s3
8040b044:	00c12623          	sw	a2,12(sp)
8040b048:	a3dfe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b04c:	00812303          	lw	t1,8(sp)
8040b050:	00c12603          	lw	a2,12(sp)
8040b054:	00651463          	bne	a0,t1,8040b05c <stride_dequeue+0x1244>
8040b058:	0180106f          	j	8040c070 <stride_dequeue+0x2258>
8040b05c:	004a2783          	lw	a5,4(s4)
8040b060:	008a2883          	lw	a7,8(s4)
8040b064:	00612623          	sw	t1,12(sp)
8040b068:	00f12423          	sw	a5,8(sp)
8040b06c:	0c088463          	beqz	a7,8040b134 <stride_dequeue+0x131c>
8040b070:	00088593          	mv	a1,a7
8040b074:	00098513          	mv	a0,s3
8040b078:	00c12a23          	sw	a2,20(sp)
8040b07c:	01112823          	sw	a7,16(sp)
8040b080:	a05fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b084:	00c12303          	lw	t1,12(sp)
8040b088:	01012883          	lw	a7,16(sp)
8040b08c:	01412603          	lw	a2,20(sp)
8040b090:	00651463          	bne	a0,t1,8040b098 <stride_dequeue+0x1280>
8040b094:	4a10106f          	j	8040cd34 <stride_dequeue+0x2f1c>
8040b098:	0048a783          	lw	a5,4(a7)
8040b09c:	0088ae03          	lw	t3,8(a7)
8040b0a0:	00612e23          	sw	t1,28(sp)
8040b0a4:	00f12623          	sw	a5,12(sp)
8040b0a8:	060e0c63          	beqz	t3,8040b120 <stride_dequeue+0x1308>
8040b0ac:	000e0593          	mv	a1,t3
8040b0b0:	00098513          	mv	a0,s3
8040b0b4:	01112c23          	sw	a7,24(sp)
8040b0b8:	00c12a23          	sw	a2,20(sp)
8040b0bc:	01c12823          	sw	t3,16(sp)
8040b0c0:	9c5fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b0c4:	01c12303          	lw	t1,28(sp)
8040b0c8:	01012e03          	lw	t3,16(sp)
8040b0cc:	01412603          	lw	a2,20(sp)
8040b0d0:	01812883          	lw	a7,24(sp)
8040b0d4:	00651463          	bne	a0,t1,8040b0dc <stride_dequeue+0x12c4>
8040b0d8:	7d50106f          	j	8040d0ac <stride_dequeue+0x3294>
8040b0dc:	008e2583          	lw	a1,8(t3)
8040b0e0:	00098513          	mv	a0,s3
8040b0e4:	004e2b03          	lw	s6,4(t3)
8040b0e8:	01112c23          	sw	a7,24(sp)
8040b0ec:	00c12a23          	sw	a2,20(sp)
8040b0f0:	01c12823          	sw	t3,16(sp)
8040b0f4:	a4dfe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b0f8:	01012e03          	lw	t3,16(sp)
8040b0fc:	01412603          	lw	a2,20(sp)
8040b100:	01812883          	lw	a7,24(sp)
8040b104:	00ae2223          	sw	a0,4(t3)
8040b108:	016e2423          	sw	s6,8(t3)
8040b10c:	00051463          	bnez	a0,8040b114 <stride_dequeue+0x12fc>
8040b110:	2e80206f          	j	8040d3f8 <stride_dequeue+0x35e0>
8040b114:	008c2b03          	lw	s6,8(s8)
8040b118:	01c52023          	sw	t3,0(a0)
8040b11c:	000e0993          	mv	s3,t3
8040b120:	00c12783          	lw	a5,12(sp)
8040b124:	0138a223          	sw	s3,4(a7)
8040b128:	00f8a423          	sw	a5,8(a7)
8040b12c:	0119a023          	sw	a7,0(s3)
8040b130:	00088993          	mv	s3,a7
8040b134:	00812783          	lw	a5,8(sp)
8040b138:	013a2223          	sw	s3,4(s4)
8040b13c:	00fa2423          	sw	a5,8(s4)
8040b140:	0149a023          	sw	s4,0(s3)
8040b144:	00412783          	lw	a5,4(sp)
8040b148:	01462223          	sw	s4,4(a2)
8040b14c:	000b0993          	mv	s3,s6
8040b150:	00f62423          	sw	a5,8(a2)
8040b154:	00ca2023          	sw	a2,0(s4)
8040b158:	00060a13          	mv	s4,a2
8040b15c:	ef4ff06f          	j	8040a850 <stride_dequeue+0xa38>
8040b160:	004ca783          	lw	a5,4(s9)
8040b164:	008ca983          	lw	s3,8(s9)
8040b168:	00a12623          	sw	a0,12(sp)
8040b16c:	00f12423          	sw	a5,8(sp)
8040b170:	0e098663          	beqz	s3,8040b25c <stride_dequeue+0x1444>
8040b174:	000a0593          	mv	a1,s4
8040b178:	00098513          	mv	a0,s3
8040b17c:	909fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b180:	00c12303          	lw	t1,12(sp)
8040b184:	00651463          	bne	a0,t1,8040b18c <stride_dequeue+0x1374>
8040b188:	7d10006f          	j	8040c158 <stride_dequeue+0x2340>
8040b18c:	004a2783          	lw	a5,4(s4)
8040b190:	008a2883          	lw	a7,8(s4)
8040b194:	00612823          	sw	t1,16(sp)
8040b198:	00f12623          	sw	a5,12(sp)
8040b19c:	0a088863          	beqz	a7,8040b24c <stride_dequeue+0x1434>
8040b1a0:	00088593          	mv	a1,a7
8040b1a4:	00098513          	mv	a0,s3
8040b1a8:	01112a23          	sw	a7,20(sp)
8040b1ac:	8d9fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b1b0:	01012303          	lw	t1,16(sp)
8040b1b4:	01412883          	lw	a7,20(sp)
8040b1b8:	00651463          	bne	a0,t1,8040b1c0 <stride_dequeue+0x13a8>
8040b1bc:	1990106f          	j	8040cb54 <stride_dequeue+0x2d3c>
8040b1c0:	0048a783          	lw	a5,4(a7)
8040b1c4:	0088ae03          	lw	t3,8(a7)
8040b1c8:	00612e23          	sw	t1,28(sp)
8040b1cc:	00f12823          	sw	a5,16(sp)
8040b1d0:	060e0463          	beqz	t3,8040b238 <stride_dequeue+0x1420>
8040b1d4:	000e0593          	mv	a1,t3
8040b1d8:	00098513          	mv	a0,s3
8040b1dc:	01112c23          	sw	a7,24(sp)
8040b1e0:	01c12a23          	sw	t3,20(sp)
8040b1e4:	8a1fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b1e8:	01c12303          	lw	t1,28(sp)
8040b1ec:	01412e03          	lw	t3,20(sp)
8040b1f0:	01812883          	lw	a7,24(sp)
8040b1f4:	00651463          	bne	a0,t1,8040b1fc <stride_dequeue+0x13e4>
8040b1f8:	07c0206f          	j	8040d274 <stride_dequeue+0x345c>
8040b1fc:	008e2583          	lw	a1,8(t3)
8040b200:	00098513          	mv	a0,s3
8040b204:	004e2b03          	lw	s6,4(t3)
8040b208:	01112c23          	sw	a7,24(sp)
8040b20c:	01c12a23          	sw	t3,20(sp)
8040b210:	931fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b214:	01412e03          	lw	t3,20(sp)
8040b218:	01812883          	lw	a7,24(sp)
8040b21c:	00ae2223          	sw	a0,4(t3)
8040b220:	016e2423          	sw	s6,8(t3)
8040b224:	00051463          	bnez	a0,8040b22c <stride_dequeue+0x1414>
8040b228:	2780206f          	j	8040d4a0 <stride_dequeue+0x3688>
8040b22c:	008c2b03          	lw	s6,8(s8)
8040b230:	01c52023          	sw	t3,0(a0)
8040b234:	000e0993          	mv	s3,t3
8040b238:	01012783          	lw	a5,16(sp)
8040b23c:	0138a223          	sw	s3,4(a7)
8040b240:	00f8a423          	sw	a5,8(a7)
8040b244:	0119a023          	sw	a7,0(s3)
8040b248:	00088993          	mv	s3,a7
8040b24c:	00c12783          	lw	a5,12(sp)
8040b250:	013a2223          	sw	s3,4(s4)
8040b254:	00fa2423          	sw	a5,8(s4)
8040b258:	0149a023          	sw	s4,0(s3)
8040b25c:	00812783          	lw	a5,8(sp)
8040b260:	014ca223          	sw	s4,4(s9)
8040b264:	000b0993          	mv	s3,s6
8040b268:	00fca423          	sw	a5,8(s9)
8040b26c:	019a2023          	sw	s9,0(s4)
8040b270:	b1cff06f          	j	8040a58c <stride_dequeue+0x774>
8040b274:	004a2783          	lw	a5,4(s4)
8040b278:	008a2983          	lw	s3,8(s4)
8040b27c:	00a12623          	sw	a0,12(sp)
8040b280:	00f12423          	sw	a5,8(sp)
8040b284:	0e098663          	beqz	s3,8040b370 <stride_dequeue+0x1558>
8040b288:	000c8593          	mv	a1,s9
8040b28c:	00098513          	mv	a0,s3
8040b290:	ff4fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b294:	00c12303          	lw	t1,12(sp)
8040b298:	00651463          	bne	a0,t1,8040b2a0 <stride_dequeue+0x1488>
8040b29c:	7290006f          	j	8040c1c4 <stride_dequeue+0x23ac>
8040b2a0:	004ca783          	lw	a5,4(s9)
8040b2a4:	008ca883          	lw	a7,8(s9)
8040b2a8:	00612823          	sw	t1,16(sp)
8040b2ac:	00f12623          	sw	a5,12(sp)
8040b2b0:	0a088863          	beqz	a7,8040b360 <stride_dequeue+0x1548>
8040b2b4:	00088593          	mv	a1,a7
8040b2b8:	00098513          	mv	a0,s3
8040b2bc:	01112a23          	sw	a7,20(sp)
8040b2c0:	fc4fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b2c4:	01012303          	lw	t1,16(sp)
8040b2c8:	01412883          	lw	a7,20(sp)
8040b2cc:	00651463          	bne	a0,t1,8040b2d4 <stride_dequeue+0x14bc>
8040b2d0:	05d0106f          	j	8040cb2c <stride_dequeue+0x2d14>
8040b2d4:	0048a783          	lw	a5,4(a7)
8040b2d8:	0088ae03          	lw	t3,8(a7)
8040b2dc:	00612e23          	sw	t1,28(sp)
8040b2e0:	00f12823          	sw	a5,16(sp)
8040b2e4:	060e0463          	beqz	t3,8040b34c <stride_dequeue+0x1534>
8040b2e8:	000e0593          	mv	a1,t3
8040b2ec:	00098513          	mv	a0,s3
8040b2f0:	01112c23          	sw	a7,24(sp)
8040b2f4:	01c12a23          	sw	t3,20(sp)
8040b2f8:	f8cfe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b2fc:	01c12303          	lw	t1,28(sp)
8040b300:	01412e03          	lw	t3,20(sp)
8040b304:	01812883          	lw	a7,24(sp)
8040b308:	00651463          	bne	a0,t1,8040b310 <stride_dequeue+0x14f8>
8040b30c:	0040206f          	j	8040d310 <stride_dequeue+0x34f8>
8040b310:	008e2583          	lw	a1,8(t3)
8040b314:	00098513          	mv	a0,s3
8040b318:	004e2b03          	lw	s6,4(t3)
8040b31c:	01112c23          	sw	a7,24(sp)
8040b320:	01c12a23          	sw	t3,20(sp)
8040b324:	81dfe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b328:	01412e03          	lw	t3,20(sp)
8040b32c:	01812883          	lw	a7,24(sp)
8040b330:	00ae2223          	sw	a0,4(t3)
8040b334:	016e2423          	sw	s6,8(t3)
8040b338:	00051463          	bnez	a0,8040b340 <stride_dequeue+0x1528>
8040b33c:	11c0206f          	j	8040d458 <stride_dequeue+0x3640>
8040b340:	008c2b03          	lw	s6,8(s8)
8040b344:	01c52023          	sw	t3,0(a0)
8040b348:	000e0993          	mv	s3,t3
8040b34c:	01012783          	lw	a5,16(sp)
8040b350:	0138a223          	sw	s3,4(a7)
8040b354:	00f8a423          	sw	a5,8(a7)
8040b358:	0119a023          	sw	a7,0(s3)
8040b35c:	00088993          	mv	s3,a7
8040b360:	00c12783          	lw	a5,12(sp)
8040b364:	013ca223          	sw	s3,4(s9)
8040b368:	00fca423          	sw	a5,8(s9)
8040b36c:	0199a023          	sw	s9,0(s3)
8040b370:	00812783          	lw	a5,8(sp)
8040b374:	019a2223          	sw	s9,4(s4)
8040b378:	000b0993          	mv	s3,s6
8040b37c:	00fa2423          	sw	a5,8(s4)
8040b380:	014ca023          	sw	s4,0(s9)
8040b384:	000a0c93          	mv	s9,s4
8040b388:	b60ff06f          	j	8040a6e8 <stride_dequeue+0x8d0>
8040b38c:	0048a783          	lw	a5,4(a7)
8040b390:	0088a983          	lw	s3,8(a7)
8040b394:	00a12823          	sw	a0,16(sp)
8040b398:	00f12623          	sw	a5,12(sp)
8040b39c:	0a098663          	beqz	s3,8040b448 <stride_dequeue+0x1630>
8040b3a0:	000c8593          	mv	a1,s9
8040b3a4:	00098513          	mv	a0,s3
8040b3a8:	01112a23          	sw	a7,20(sp)
8040b3ac:	ed8fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b3b0:	01012303          	lw	t1,16(sp)
8040b3b4:	01412883          	lw	a7,20(sp)
8040b3b8:	00651463          	bne	a0,t1,8040b3c0 <stride_dequeue+0x15a8>
8040b3bc:	2980106f          	j	8040c654 <stride_dequeue+0x283c>
8040b3c0:	004ca783          	lw	a5,4(s9)
8040b3c4:	008cae03          	lw	t3,8(s9)
8040b3c8:	00612a23          	sw	t1,20(sp)
8040b3cc:	00f12823          	sw	a5,16(sp)
8040b3d0:	060e0463          	beqz	t3,8040b438 <stride_dequeue+0x1620>
8040b3d4:	000e0593          	mv	a1,t3
8040b3d8:	00098513          	mv	a0,s3
8040b3dc:	01112e23          	sw	a7,28(sp)
8040b3e0:	01c12c23          	sw	t3,24(sp)
8040b3e4:	ea0fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b3e8:	01412303          	lw	t1,20(sp)
8040b3ec:	01812e03          	lw	t3,24(sp)
8040b3f0:	01c12883          	lw	a7,28(sp)
8040b3f4:	00651463          	bne	a0,t1,8040b3fc <stride_dequeue+0x15e4>
8040b3f8:	0e50106f          	j	8040ccdc <stride_dequeue+0x2ec4>
8040b3fc:	008e2583          	lw	a1,8(t3)
8040b400:	00098513          	mv	a0,s3
8040b404:	004e2b03          	lw	s6,4(t3)
8040b408:	01112c23          	sw	a7,24(sp)
8040b40c:	01c12a23          	sw	t3,20(sp)
8040b410:	f30fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b414:	01412e03          	lw	t3,20(sp)
8040b418:	01812883          	lw	a7,24(sp)
8040b41c:	00ae2223          	sw	a0,4(t3)
8040b420:	016e2423          	sw	s6,8(t3)
8040b424:	00051463          	bnez	a0,8040b42c <stride_dequeue+0x1614>
8040b428:	2ed0106f          	j	8040cf14 <stride_dequeue+0x30fc>
8040b42c:	008c2b03          	lw	s6,8(s8)
8040b430:	01c52023          	sw	t3,0(a0)
8040b434:	000e0993          	mv	s3,t3
8040b438:	01012783          	lw	a5,16(sp)
8040b43c:	013ca223          	sw	s3,4(s9)
8040b440:	00fca423          	sw	a5,8(s9)
8040b444:	0199a023          	sw	s9,0(s3)
8040b448:	00c12783          	lw	a5,12(sp)
8040b44c:	0198a223          	sw	s9,4(a7)
8040b450:	000b0993          	mv	s3,s6
8040b454:	00f8a423          	sw	a5,8(a7)
8040b458:	011ca023          	sw	a7,0(s9)
8040b45c:	00088c93          	mv	s9,a7
8040b460:	d08ff06f          	j	8040a968 <stride_dequeue+0xb50>
8040b464:	004ca783          	lw	a5,4(s9)
8040b468:	008ca983          	lw	s3,8(s9)
8040b46c:	00a12823          	sw	a0,16(sp)
8040b470:	00f12623          	sw	a5,12(sp)
8040b474:	0a098663          	beqz	s3,8040b520 <stride_dequeue+0x1708>
8040b478:	00080593          	mv	a1,a6
8040b47c:	00098513          	mv	a0,s3
8040b480:	01012a23          	sw	a6,20(sp)
8040b484:	e00fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b488:	01012303          	lw	t1,16(sp)
8040b48c:	01412803          	lw	a6,20(sp)
8040b490:	00651463          	bne	a0,t1,8040b498 <stride_dequeue+0x1680>
8040b494:	7b90006f          	j	8040c44c <stride_dequeue+0x2634>
8040b498:	00482783          	lw	a5,4(a6)
8040b49c:	00882e03          	lw	t3,8(a6)
8040b4a0:	00612a23          	sw	t1,20(sp)
8040b4a4:	00f12823          	sw	a5,16(sp)
8040b4a8:	060e0463          	beqz	t3,8040b510 <stride_dequeue+0x16f8>
8040b4ac:	000e0593          	mv	a1,t3
8040b4b0:	00098513          	mv	a0,s3
8040b4b4:	01012e23          	sw	a6,28(sp)
8040b4b8:	01c12c23          	sw	t3,24(sp)
8040b4bc:	dc8fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b4c0:	01412303          	lw	t1,20(sp)
8040b4c4:	01812e03          	lw	t3,24(sp)
8040b4c8:	01c12803          	lw	a6,28(sp)
8040b4cc:	00651463          	bne	a0,t1,8040b4d4 <stride_dequeue+0x16bc>
8040b4d0:	7a80106f          	j	8040cc78 <stride_dequeue+0x2e60>
8040b4d4:	008e2583          	lw	a1,8(t3)
8040b4d8:	00098513          	mv	a0,s3
8040b4dc:	004e2b03          	lw	s6,4(t3)
8040b4e0:	01012c23          	sw	a6,24(sp)
8040b4e4:	01c12a23          	sw	t3,20(sp)
8040b4e8:	e58fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b4ec:	01412e03          	lw	t3,20(sp)
8040b4f0:	01812803          	lw	a6,24(sp)
8040b4f4:	00ae2223          	sw	a0,4(t3)
8040b4f8:	016e2423          	sw	s6,8(t3)
8040b4fc:	00051463          	bnez	a0,8040b504 <stride_dequeue+0x16ec>
8040b500:	1950106f          	j	8040ce94 <stride_dequeue+0x307c>
8040b504:	008c2b03          	lw	s6,8(s8)
8040b508:	01c52023          	sw	t3,0(a0)
8040b50c:	000e0993          	mv	s3,t3
8040b510:	01012783          	lw	a5,16(sp)
8040b514:	01382223          	sw	s3,4(a6)
8040b518:	00f82423          	sw	a5,8(a6)
8040b51c:	0109a023          	sw	a6,0(s3)
8040b520:	00c12783          	lw	a5,12(sp)
8040b524:	010ca223          	sw	a6,4(s9)
8040b528:	000b0993          	mv	s3,s6
8040b52c:	00fca423          	sw	a5,8(s9)
8040b530:	01982023          	sw	s9,0(a6)
8040b534:	d6cff06f          	j	8040aaa0 <stride_dequeue+0xc88>
8040b538:	004da783          	lw	a5,4(s11)
8040b53c:	008da983          	lw	s3,8(s11)
8040b540:	00a12823          	sw	a0,16(sp)
8040b544:	00f12623          	sw	a5,12(sp)
8040b548:	0a098663          	beqz	s3,8040b5f4 <stride_dequeue+0x17dc>
8040b54c:	00080593          	mv	a1,a6
8040b550:	00098513          	mv	a0,s3
8040b554:	01012a23          	sw	a6,20(sp)
8040b558:	d2cfe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b55c:	01012303          	lw	t1,16(sp)
8040b560:	01412803          	lw	a6,20(sp)
8040b564:	00651463          	bne	a0,t1,8040b56c <stride_dequeue+0x1754>
8040b568:	76d0006f          	j	8040c4d4 <stride_dequeue+0x26bc>
8040b56c:	00482783          	lw	a5,4(a6)
8040b570:	00882e03          	lw	t3,8(a6)
8040b574:	00612a23          	sw	t1,20(sp)
8040b578:	00f12823          	sw	a5,16(sp)
8040b57c:	060e0463          	beqz	t3,8040b5e4 <stride_dequeue+0x17cc>
8040b580:	000e0593          	mv	a1,t3
8040b584:	00098513          	mv	a0,s3
8040b588:	01012e23          	sw	a6,28(sp)
8040b58c:	01c12c23          	sw	t3,24(sp)
8040b590:	cf4fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b594:	01412303          	lw	t1,20(sp)
8040b598:	01812e03          	lw	t3,24(sp)
8040b59c:	01c12803          	lw	a6,28(sp)
8040b5a0:	00651463          	bne	a0,t1,8040b5a8 <stride_dequeue+0x1790>
8040b5a4:	4f40106f          	j	8040ca98 <stride_dequeue+0x2c80>
8040b5a8:	008e2583          	lw	a1,8(t3)
8040b5ac:	00098513          	mv	a0,s3
8040b5b0:	004e2b03          	lw	s6,4(t3)
8040b5b4:	01012c23          	sw	a6,24(sp)
8040b5b8:	01c12a23          	sw	t3,20(sp)
8040b5bc:	d84fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b5c0:	01412e03          	lw	t3,20(sp)
8040b5c4:	01812803          	lw	a6,24(sp)
8040b5c8:	00ae2223          	sw	a0,4(t3)
8040b5cc:	016e2423          	sw	s6,8(t3)
8040b5d0:	00051463          	bnez	a0,8040b5d8 <stride_dequeue+0x17c0>
8040b5d4:	0a90106f          	j	8040ce7c <stride_dequeue+0x3064>
8040b5d8:	008c2b03          	lw	s6,8(s8)
8040b5dc:	01c52023          	sw	t3,0(a0)
8040b5e0:	000e0993          	mv	s3,t3
8040b5e4:	01012783          	lw	a5,16(sp)
8040b5e8:	01382223          	sw	s3,4(a6)
8040b5ec:	00f82423          	sw	a5,8(a6)
8040b5f0:	0109a023          	sw	a6,0(s3)
8040b5f4:	00c12783          	lw	a5,12(sp)
8040b5f8:	010da223          	sw	a6,4(s11)
8040b5fc:	000b0993          	mv	s3,s6
8040b600:	00fda423          	sw	a5,8(s11)
8040b604:	01b82023          	sw	s11,0(a6)
8040b608:	c09fe06f          	j	8040a210 <stride_dequeue+0x3f8>
8040b60c:	004da783          	lw	a5,4(s11)
8040b610:	008da983          	lw	s3,8(s11)
8040b614:	00a12623          	sw	a0,12(sp)
8040b618:	00f12423          	sw	a5,8(sp)
8040b61c:	0c098263          	beqz	s3,8040b6e0 <stride_dequeue+0x18c8>
8040b620:	00080593          	mv	a1,a6
8040b624:	00098513          	mv	a0,s3
8040b628:	00c12a23          	sw	a2,20(sp)
8040b62c:	01012823          	sw	a6,16(sp)
8040b630:	c54fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b634:	00c12303          	lw	t1,12(sp)
8040b638:	01012803          	lw	a6,16(sp)
8040b63c:	01412603          	lw	a2,20(sp)
8040b640:	00651463          	bne	a0,t1,8040b648 <stride_dequeue+0x1830>
8040b644:	0980106f          	j	8040c6dc <stride_dequeue+0x28c4>
8040b648:	00482783          	lw	a5,4(a6)
8040b64c:	00882e03          	lw	t3,8(a6)
8040b650:	00612823          	sw	t1,16(sp)
8040b654:	00f12623          	sw	a5,12(sp)
8040b658:	060e0c63          	beqz	t3,8040b6d0 <stride_dequeue+0x18b8>
8040b65c:	000e0593          	mv	a1,t3
8040b660:	00098513          	mv	a0,s3
8040b664:	01012e23          	sw	a6,28(sp)
8040b668:	00c12c23          	sw	a2,24(sp)
8040b66c:	01c12a23          	sw	t3,20(sp)
8040b670:	c14fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b674:	01012303          	lw	t1,16(sp)
8040b678:	01412e03          	lw	t3,20(sp)
8040b67c:	01812603          	lw	a2,24(sp)
8040b680:	01c12803          	lw	a6,28(sp)
8040b684:	00651463          	bne	a0,t1,8040b68c <stride_dequeue+0x1874>
8040b688:	3b00106f          	j	8040ca38 <stride_dequeue+0x2c20>
8040b68c:	008e2583          	lw	a1,8(t3)
8040b690:	00098513          	mv	a0,s3
8040b694:	004e2b03          	lw	s6,4(t3)
8040b698:	01012c23          	sw	a6,24(sp)
8040b69c:	00c12a23          	sw	a2,20(sp)
8040b6a0:	01c12823          	sw	t3,16(sp)
8040b6a4:	c9cfe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b6a8:	01012e03          	lw	t3,16(sp)
8040b6ac:	01412603          	lw	a2,20(sp)
8040b6b0:	01812803          	lw	a6,24(sp)
8040b6b4:	00ae2223          	sw	a0,4(t3)
8040b6b8:	016e2423          	sw	s6,8(t3)
8040b6bc:	00051463          	bnez	a0,8040b6c4 <stride_dequeue+0x18ac>
8040b6c0:	0610106f          	j	8040cf20 <stride_dequeue+0x3108>
8040b6c4:	008c2b03          	lw	s6,8(s8)
8040b6c8:	01c52023          	sw	t3,0(a0)
8040b6cc:	000e0993          	mv	s3,t3
8040b6d0:	00c12783          	lw	a5,12(sp)
8040b6d4:	01382223          	sw	s3,4(a6)
8040b6d8:	00f82423          	sw	a5,8(a6)
8040b6dc:	0109a023          	sw	a6,0(s3)
8040b6e0:	00812783          	lw	a5,8(sp)
8040b6e4:	010da223          	sw	a6,4(s11)
8040b6e8:	000b0993          	mv	s3,s6
8040b6ec:	00fda423          	sw	a5,8(s11)
8040b6f0:	01b82023          	sw	s11,0(a6)
8040b6f4:	cf9fe06f          	j	8040a3ec <stride_dequeue+0x5d4>
8040b6f8:	00492703          	lw	a4,4(s2)
8040b6fc:	00892983          	lw	s3,8(s2)
8040b700:	00a12a23          	sw	a0,20(sp)
8040b704:	00e12823          	sw	a4,16(sp)
8040b708:	06098063          	beqz	s3,8040b768 <stride_dequeue+0x1950>
8040b70c:	00078593          	mv	a1,a5
8040b710:	00098513          	mv	a0,s3
8040b714:	01012e23          	sw	a6,28(sp)
8040b718:	00f12c23          	sw	a5,24(sp)
8040b71c:	b68fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b720:	01412e03          	lw	t3,20(sp)
8040b724:	01812783          	lw	a5,24(sp)
8040b728:	01c12803          	lw	a6,28(sp)
8040b72c:	01c51463          	bne	a0,t3,8040b734 <stride_dequeue+0x191c>
8040b730:	0840106f          	j	8040c7b4 <stride_dequeue+0x299c>
8040b734:	0087a583          	lw	a1,8(a5)
8040b738:	00098513          	mv	a0,s3
8040b73c:	0047ab03          	lw	s6,4(a5)
8040b740:	01012c23          	sw	a6,24(sp)
8040b744:	00f12a23          	sw	a5,20(sp)
8040b748:	bf8fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b74c:	01412783          	lw	a5,20(sp)
8040b750:	01812803          	lw	a6,24(sp)
8040b754:	00a7a223          	sw	a0,4(a5)
8040b758:	0167a423          	sw	s6,8(a5)
8040b75c:	00050463          	beqz	a0,8040b764 <stride_dequeue+0x194c>
8040b760:	00f52023          	sw	a5,0(a0)
8040b764:	008c2b03          	lw	s6,8(s8)
8040b768:	01012703          	lw	a4,16(sp)
8040b76c:	00f92223          	sw	a5,4(s2)
8040b770:	000b0993          	mv	s3,s6
8040b774:	00e92423          	sw	a4,8(s2)
8040b778:	0127a023          	sw	s2,0(a5)
8040b77c:	875fe06f          	j	80409ff0 <stride_dequeue+0x1d8>
8040b780:	004a2783          	lw	a5,4(s4)
8040b784:	008a2983          	lw	s3,8(s4)
8040b788:	00a12623          	sw	a0,12(sp)
8040b78c:	00f12423          	sw	a5,8(sp)
8040b790:	00099463          	bnez	s3,8040b798 <stride_dequeue+0x1980>
8040b794:	4180106f          	j	8040cbac <stride_dequeue+0x2d94>
8040b798:	00040593          	mv	a1,s0
8040b79c:	00098513          	mv	a0,s3
8040b7a0:	ae4fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b7a4:	00c12803          	lw	a6,12(sp)
8040b7a8:	01051463          	bne	a0,a6,8040b7b0 <stride_dequeue+0x1998>
8040b7ac:	16c0106f          	j	8040c918 <stride_dequeue+0x2b00>
8040b7b0:	00442783          	lw	a5,4(s0)
8040b7b4:	00842883          	lw	a7,8(s0)
8040b7b8:	01012a23          	sw	a6,20(sp)
8040b7bc:	00f12623          	sw	a5,12(sp)
8040b7c0:	04088c63          	beqz	a7,8040b818 <stride_dequeue+0x1a00>
8040b7c4:	00088593          	mv	a1,a7
8040b7c8:	00098513          	mv	a0,s3
8040b7cc:	01112823          	sw	a7,16(sp)
8040b7d0:	ab4fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b7d4:	01412803          	lw	a6,20(sp)
8040b7d8:	01012883          	lw	a7,16(sp)
8040b7dc:	01051463          	bne	a0,a6,8040b7e4 <stride_dequeue+0x19cc>
8040b7e0:	6c00106f          	j	8040cea0 <stride_dequeue+0x3088>
8040b7e4:	0088a583          	lw	a1,8(a7)
8040b7e8:	00098513          	mv	a0,s3
8040b7ec:	0048ab03          	lw	s6,4(a7)
8040b7f0:	01112823          	sw	a7,16(sp)
8040b7f4:	b4cfe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b7f8:	01012883          	lw	a7,16(sp)
8040b7fc:	00a8a223          	sw	a0,4(a7)
8040b800:	0168a423          	sw	s6,8(a7)
8040b804:	00051463          	bnez	a0,8040b80c <stride_dequeue+0x19f4>
8040b808:	7900106f          	j	8040cf98 <stride_dequeue+0x3180>
8040b80c:	008c2b03          	lw	s6,8(s8)
8040b810:	01152023          	sw	a7,0(a0)
8040b814:	00088993          	mv	s3,a7
8040b818:	00c12783          	lw	a5,12(sp)
8040b81c:	01342223          	sw	s3,4(s0)
8040b820:	00f42423          	sw	a5,8(s0)
8040b824:	0089a023          	sw	s0,0(s3)
8040b828:	00040993          	mv	s3,s0
8040b82c:	00812783          	lw	a5,8(sp)
8040b830:	013a2223          	sw	s3,4(s4)
8040b834:	000a0413          	mv	s0,s4
8040b838:	00fa2423          	sw	a5,8(s4)
8040b83c:	0149a023          	sw	s4,0(s3)
8040b840:	000b0993          	mv	s3,s6
8040b844:	bacff06f          	j	8040abf0 <stride_dequeue+0xdd8>
8040b848:	0048a783          	lw	a5,4(a7)
8040b84c:	0088a983          	lw	s3,8(a7)
8040b850:	00a12823          	sw	a0,16(sp)
8040b854:	00f12623          	sw	a5,12(sp)
8040b858:	00099463          	bnez	s3,8040b860 <stride_dequeue+0x1a48>
8040b85c:	5a40106f          	j	8040ce00 <stride_dequeue+0x2fe8>
8040b860:	000d8593          	mv	a1,s11
8040b864:	00098513          	mv	a0,s3
8040b868:	01112a23          	sw	a7,20(sp)
8040b86c:	a18fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b870:	01012303          	lw	t1,16(sp)
8040b874:	01412883          	lw	a7,20(sp)
8040b878:	00651463          	bne	a0,t1,8040b880 <stride_dequeue+0x1a68>
8040b87c:	54c0106f          	j	8040cdc8 <stride_dequeue+0x2fb0>
8040b880:	004da783          	lw	a5,4(s11)
8040b884:	008dae03          	lw	t3,8(s11)
8040b888:	00612e23          	sw	t1,28(sp)
8040b88c:	00f12823          	sw	a5,16(sp)
8040b890:	060e0463          	beqz	t3,8040b8f8 <stride_dequeue+0x1ae0>
8040b894:	000e0593          	mv	a1,t3
8040b898:	00098513          	mv	a0,s3
8040b89c:	01112c23          	sw	a7,24(sp)
8040b8a0:	01c12a23          	sw	t3,20(sp)
8040b8a4:	9e0fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b8a8:	01c12303          	lw	t1,28(sp)
8040b8ac:	01412e03          	lw	t3,20(sp)
8040b8b0:	01812883          	lw	a7,24(sp)
8040b8b4:	00651463          	bne	a0,t1,8040b8bc <stride_dequeue+0x1aa4>
8040b8b8:	2890106f          	j	8040d340 <stride_dequeue+0x3528>
8040b8bc:	008e2583          	lw	a1,8(t3)
8040b8c0:	00098513          	mv	a0,s3
8040b8c4:	004e2b03          	lw	s6,4(t3)
8040b8c8:	01112c23          	sw	a7,24(sp)
8040b8cc:	01c12a23          	sw	t3,20(sp)
8040b8d0:	a70fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b8d4:	01412e03          	lw	t3,20(sp)
8040b8d8:	01812883          	lw	a7,24(sp)
8040b8dc:	00ae2223          	sw	a0,4(t3)
8040b8e0:	016e2423          	sw	s6,8(t3)
8040b8e4:	00051463          	bnez	a0,8040b8ec <stride_dequeue+0x1ad4>
8040b8e8:	3590106f          	j	8040d440 <stride_dequeue+0x3628>
8040b8ec:	008c2b03          	lw	s6,8(s8)
8040b8f0:	01c52023          	sw	t3,0(a0)
8040b8f4:	000e0993          	mv	s3,t3
8040b8f8:	01012783          	lw	a5,16(sp)
8040b8fc:	013da223          	sw	s3,4(s11)
8040b900:	00fda423          	sw	a5,8(s11)
8040b904:	01b9a023          	sw	s11,0(s3)
8040b908:	000d8993          	mv	s3,s11
8040b90c:	00c12783          	lw	a5,12(sp)
8040b910:	0138a223          	sw	s3,4(a7)
8040b914:	00088d93          	mv	s11,a7
8040b918:	00f8a423          	sw	a5,8(a7)
8040b91c:	0119a023          	sw	a7,0(s3)
8040b920:	000b0993          	mv	s3,s6
8040b924:	be0ff06f          	j	8040ad04 <stride_dequeue+0xeec>
8040b928:	0048a783          	lw	a5,4(a7)
8040b92c:	0088a983          	lw	s3,8(a7)
8040b930:	00a12823          	sw	a0,16(sp)
8040b934:	00f12623          	sw	a5,12(sp)
8040b938:	00099463          	bnez	s3,8040b940 <stride_dequeue+0x1b28>
8040b93c:	4e40106f          	j	8040ce20 <stride_dequeue+0x3008>
8040b940:	000a0593          	mv	a1,s4
8040b944:	00098513          	mv	a0,s3
8040b948:	01112a23          	sw	a7,20(sp)
8040b94c:	938fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b950:	01012303          	lw	t1,16(sp)
8040b954:	01412883          	lw	a7,20(sp)
8040b958:	00651463          	bne	a0,t1,8040b960 <stride_dequeue+0x1b48>
8040b95c:	0ac0106f          	j	8040ca08 <stride_dequeue+0x2bf0>
8040b960:	004a2783          	lw	a5,4(s4)
8040b964:	008a2e03          	lw	t3,8(s4)
8040b968:	00612e23          	sw	t1,28(sp)
8040b96c:	00f12823          	sw	a5,16(sp)
8040b970:	060e0463          	beqz	t3,8040b9d8 <stride_dequeue+0x1bc0>
8040b974:	000e0593          	mv	a1,t3
8040b978:	00098513          	mv	a0,s3
8040b97c:	01112c23          	sw	a7,24(sp)
8040b980:	01c12a23          	sw	t3,20(sp)
8040b984:	900fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040b988:	01c12303          	lw	t1,28(sp)
8040b98c:	01412e03          	lw	t3,20(sp)
8040b990:	01812883          	lw	a7,24(sp)
8040b994:	00651463          	bne	a0,t1,8040b99c <stride_dequeue+0x1b84>
8040b998:	07d0106f          	j	8040d214 <stride_dequeue+0x33fc>
8040b99c:	008e2583          	lw	a1,8(t3)
8040b9a0:	00098513          	mv	a0,s3
8040b9a4:	004e2b03          	lw	s6,4(t3)
8040b9a8:	01112c23          	sw	a7,24(sp)
8040b9ac:	01c12a23          	sw	t3,20(sp)
8040b9b0:	990fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040b9b4:	01412e03          	lw	t3,20(sp)
8040b9b8:	01812883          	lw	a7,24(sp)
8040b9bc:	00ae2223          	sw	a0,4(t3)
8040b9c0:	016e2423          	sw	s6,8(t3)
8040b9c4:	00051463          	bnez	a0,8040b9cc <stride_dequeue+0x1bb4>
8040b9c8:	2190106f          	j	8040d3e0 <stride_dequeue+0x35c8>
8040b9cc:	008c2b03          	lw	s6,8(s8)
8040b9d0:	01c52023          	sw	t3,0(a0)
8040b9d4:	000e0993          	mv	s3,t3
8040b9d8:	01012783          	lw	a5,16(sp)
8040b9dc:	013a2223          	sw	s3,4(s4)
8040b9e0:	00fa2423          	sw	a5,8(s4)
8040b9e4:	0149a023          	sw	s4,0(s3)
8040b9e8:	000a0993          	mv	s3,s4
8040b9ec:	00c12783          	lw	a5,12(sp)
8040b9f0:	0138a223          	sw	s3,4(a7)
8040b9f4:	00088a13          	mv	s4,a7
8040b9f8:	00f8a423          	sw	a5,8(a7)
8040b9fc:	0119a023          	sw	a7,0(s3)
8040ba00:	000b0993          	mv	s3,s6
8040ba04:	d44ff06f          	j	8040af48 <stride_dequeue+0x1130>
8040ba08:	004ca783          	lw	a5,4(s9)
8040ba0c:	008ca983          	lw	s3,8(s9)
8040ba10:	00a12823          	sw	a0,16(sp)
8040ba14:	00f12623          	sw	a5,12(sp)
8040ba18:	00099463          	bnez	s3,8040ba20 <stride_dequeue+0x1c08>
8040ba1c:	3dc0106f          	j	8040cdf8 <stride_dequeue+0x2fe0>
8040ba20:	00080593          	mv	a1,a6
8040ba24:	00098513          	mv	a0,s3
8040ba28:	01012a23          	sw	a6,20(sp)
8040ba2c:	858fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ba30:	01012303          	lw	t1,16(sp)
8040ba34:	01412803          	lw	a6,20(sp)
8040ba38:	00651463          	bne	a0,t1,8040ba40 <stride_dequeue+0x1c28>
8040ba3c:	1a80106f          	j	8040cbe4 <stride_dequeue+0x2dcc>
8040ba40:	00482783          	lw	a5,4(a6)
8040ba44:	00882e03          	lw	t3,8(a6)
8040ba48:	00612e23          	sw	t1,28(sp)
8040ba4c:	00f12823          	sw	a5,16(sp)
8040ba50:	060e0463          	beqz	t3,8040bab8 <stride_dequeue+0x1ca0>
8040ba54:	000e0593          	mv	a1,t3
8040ba58:	00098513          	mv	a0,s3
8040ba5c:	01012c23          	sw	a6,24(sp)
8040ba60:	01c12a23          	sw	t3,20(sp)
8040ba64:	820fe0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040ba68:	01c12303          	lw	t1,28(sp)
8040ba6c:	01412e03          	lw	t3,20(sp)
8040ba70:	01812803          	lw	a6,24(sp)
8040ba74:	00651463          	bne	a0,t1,8040ba7c <stride_dequeue+0x1c64>
8040ba78:	7cc0106f          	j	8040d244 <stride_dequeue+0x342c>
8040ba7c:	008e2583          	lw	a1,8(t3)
8040ba80:	00098513          	mv	a0,s3
8040ba84:	004e2b03          	lw	s6,4(t3)
8040ba88:	01012c23          	sw	a6,24(sp)
8040ba8c:	01c12a23          	sw	t3,20(sp)
8040ba90:	8b0fe0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ba94:	01412e03          	lw	t3,20(sp)
8040ba98:	01812803          	lw	a6,24(sp)
8040ba9c:	00ae2223          	sw	a0,4(t3)
8040baa0:	016e2423          	sw	s6,8(t3)
8040baa4:	00051463          	bnez	a0,8040baac <stride_dequeue+0x1c94>
8040baa8:	1450106f          	j	8040d3ec <stride_dequeue+0x35d4>
8040baac:	008c2b03          	lw	s6,8(s8)
8040bab0:	01c52023          	sw	t3,0(a0)
8040bab4:	000e0993          	mv	s3,t3
8040bab8:	01012783          	lw	a5,16(sp)
8040babc:	01382223          	sw	s3,4(a6)
8040bac0:	00f82423          	sw	a5,8(a6)
8040bac4:	0109a023          	sw	a6,0(s3)
8040bac8:	00080993          	mv	s3,a6
8040bacc:	00c12783          	lw	a5,12(sp)
8040bad0:	013ca223          	sw	s3,4(s9)
8040bad4:	00fca423          	sw	a5,8(s9)
8040bad8:	0199a023          	sw	s9,0(s3)
8040badc:	000b0993          	mv	s3,s6
8040bae0:	a99fe06f          	j	8040a578 <stride_dequeue+0x760>
8040bae4:	004a2783          	lw	a5,4(s4)
8040bae8:	008a2983          	lw	s3,8(s4)
8040baec:	00a12823          	sw	a0,16(sp)
8040baf0:	00f12623          	sw	a5,12(sp)
8040baf4:	00099463          	bnez	s3,8040bafc <stride_dequeue+0x1ce4>
8040baf8:	3100106f          	j	8040ce08 <stride_dequeue+0x2ff0>
8040bafc:	00080593          	mv	a1,a6
8040bb00:	00098513          	mv	a0,s3
8040bb04:	01012a23          	sw	a6,20(sp)
8040bb08:	f7dfd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bb0c:	01012303          	lw	t1,16(sp)
8040bb10:	01412803          	lw	a6,20(sp)
8040bb14:	00651463          	bne	a0,t1,8040bb1c <stride_dequeue+0x1d04>
8040bb18:	7590006f          	j	8040ca70 <stride_dequeue+0x2c58>
8040bb1c:	00482783          	lw	a5,4(a6)
8040bb20:	00882e03          	lw	t3,8(a6)
8040bb24:	00612e23          	sw	t1,28(sp)
8040bb28:	00f12823          	sw	a5,16(sp)
8040bb2c:	060e0463          	beqz	t3,8040bb94 <stride_dequeue+0x1d7c>
8040bb30:	000e0593          	mv	a1,t3
8040bb34:	00098513          	mv	a0,s3
8040bb38:	01012c23          	sw	a6,24(sp)
8040bb3c:	01c12a23          	sw	t3,20(sp)
8040bb40:	f45fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bb44:	01c12303          	lw	t1,28(sp)
8040bb48:	01412e03          	lw	t3,20(sp)
8040bb4c:	01812803          	lw	a6,24(sp)
8040bb50:	00651463          	bne	a0,t1,8040bb58 <stride_dequeue+0x1d40>
8040bb54:	4500106f          	j	8040cfa4 <stride_dequeue+0x318c>
8040bb58:	008e2583          	lw	a1,8(t3)
8040bb5c:	00098513          	mv	a0,s3
8040bb60:	004e2b03          	lw	s6,4(t3)
8040bb64:	01012c23          	sw	a6,24(sp)
8040bb68:	01c12a23          	sw	t3,20(sp)
8040bb6c:	fd5fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040bb70:	01412e03          	lw	t3,20(sp)
8040bb74:	01812803          	lw	a6,24(sp)
8040bb78:	00ae2223          	sw	a0,4(t3)
8040bb7c:	016e2423          	sw	s6,8(t3)
8040bb80:	00051463          	bnez	a0,8040bb88 <stride_dequeue+0x1d70>
8040bb84:	0f90106f          	j	8040d47c <stride_dequeue+0x3664>
8040bb88:	008c2b03          	lw	s6,8(s8)
8040bb8c:	01c52023          	sw	t3,0(a0)
8040bb90:	000e0993          	mv	s3,t3
8040bb94:	01012783          	lw	a5,16(sp)
8040bb98:	01382223          	sw	s3,4(a6)
8040bb9c:	00f82423          	sw	a5,8(a6)
8040bba0:	0109a023          	sw	a6,0(s3)
8040bba4:	00080993          	mv	s3,a6
8040bba8:	00c12783          	lw	a5,12(sp)
8040bbac:	013a2223          	sw	s3,4(s4)
8040bbb0:	00fa2423          	sw	a5,8(s4)
8040bbb4:	0149a023          	sw	s4,0(s3)
8040bbb8:	000b0993          	mv	s3,s6
8040bbbc:	b1dfe06f          	j	8040a6d8 <stride_dequeue+0x8c0>
8040bbc0:	0048a783          	lw	a5,4(a7)
8040bbc4:	0088a983          	lw	s3,8(a7)
8040bbc8:	00a12623          	sw	a0,12(sp)
8040bbcc:	00f12423          	sw	a5,8(sp)
8040bbd0:	00099463          	bnez	s3,8040bbd8 <stride_dequeue+0x1dc0>
8040bbd4:	2440106f          	j	8040ce18 <stride_dequeue+0x3000>
8040bbd8:	00060593          	mv	a1,a2
8040bbdc:	00098513          	mv	a0,s3
8040bbe0:	01112a23          	sw	a7,20(sp)
8040bbe4:	ea1fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bbe8:	00c12303          	lw	t1,12(sp)
8040bbec:	01012603          	lw	a2,16(sp)
8040bbf0:	01412883          	lw	a7,20(sp)
8040bbf4:	5e6502e3          	beq	a0,t1,8040c9d8 <stride_dequeue+0x2bc0>
8040bbf8:	00462783          	lw	a5,4(a2)
8040bbfc:	00862e03          	lw	t3,8(a2)
8040bc00:	00612e23          	sw	t1,28(sp)
8040bc04:	00f12623          	sw	a5,12(sp)
8040bc08:	060e0c63          	beqz	t3,8040bc80 <stride_dequeue+0x1e68>
8040bc0c:	000e0593          	mv	a1,t3
8040bc10:	00098513          	mv	a0,s3
8040bc14:	01112c23          	sw	a7,24(sp)
8040bc18:	00c12a23          	sw	a2,20(sp)
8040bc1c:	01c12823          	sw	t3,16(sp)
8040bc20:	e65fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bc24:	01c12303          	lw	t1,28(sp)
8040bc28:	01012e03          	lw	t3,16(sp)
8040bc2c:	01412603          	lw	a2,20(sp)
8040bc30:	01812883          	lw	a7,24(sp)
8040bc34:	00651463          	bne	a0,t1,8040bc3c <stride_dequeue+0x1e24>
8040bc38:	3d00106f          	j	8040d008 <stride_dequeue+0x31f0>
8040bc3c:	008e2583          	lw	a1,8(t3)
8040bc40:	00098513          	mv	a0,s3
8040bc44:	004e2b03          	lw	s6,4(t3)
8040bc48:	01112c23          	sw	a7,24(sp)
8040bc4c:	00c12a23          	sw	a2,20(sp)
8040bc50:	01c12823          	sw	t3,16(sp)
8040bc54:	eedfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040bc58:	01012e03          	lw	t3,16(sp)
8040bc5c:	01412603          	lw	a2,20(sp)
8040bc60:	01812883          	lw	a7,24(sp)
8040bc64:	00ae2223          	sw	a0,4(t3)
8040bc68:	016e2423          	sw	s6,8(t3)
8040bc6c:	00051463          	bnez	a0,8040bc74 <stride_dequeue+0x1e5c>
8040bc70:	0190106f          	j	8040d488 <stride_dequeue+0x3670>
8040bc74:	008c2b03          	lw	s6,8(s8)
8040bc78:	01c52023          	sw	t3,0(a0)
8040bc7c:	000e0993          	mv	s3,t3
8040bc80:	00c12783          	lw	a5,12(sp)
8040bc84:	01362223          	sw	s3,4(a2)
8040bc88:	00f62423          	sw	a5,8(a2)
8040bc8c:	00c9a023          	sw	a2,0(s3)
8040bc90:	00060993          	mv	s3,a2
8040bc94:	00812783          	lw	a5,8(sp)
8040bc98:	0138a223          	sw	s3,4(a7)
8040bc9c:	00088613          	mv	a2,a7
8040bca0:	00f8a423          	sw	a5,8(a7)
8040bca4:	0119a023          	sw	a7,0(s3)
8040bca8:	000b0993          	mv	s3,s6
8040bcac:	98cff06f          	j	8040ae38 <stride_dequeue+0x1020>
8040bcb0:	00462783          	lw	a5,4(a2)
8040bcb4:	00862983          	lw	s3,8(a2)
8040bcb8:	00a12623          	sw	a0,12(sp)
8040bcbc:	00f12423          	sw	a5,8(sp)
8040bcc0:	00099463          	bnez	s3,8040bcc8 <stride_dequeue+0x1eb0>
8040bcc4:	14c0106f          	j	8040ce10 <stride_dequeue+0x2ff8>
8040bcc8:	00080593          	mv	a1,a6
8040bccc:	00098513          	mv	a0,s3
8040bcd0:	00c12a23          	sw	a2,20(sp)
8040bcd4:	01012823          	sw	a6,16(sp)
8040bcd8:	dadfd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bcdc:	00c12303          	lw	t1,12(sp)
8040bce0:	01012803          	lw	a6,16(sp)
8040bce4:	01412603          	lw	a2,20(sp)
8040bce8:	5e6500e3          	beq	a0,t1,8040cac8 <stride_dequeue+0x2cb0>
8040bcec:	00482783          	lw	a5,4(a6)
8040bcf0:	00882e03          	lw	t3,8(a6)
8040bcf4:	00612e23          	sw	t1,28(sp)
8040bcf8:	00f12623          	sw	a5,12(sp)
8040bcfc:	060e0c63          	beqz	t3,8040bd74 <stride_dequeue+0x1f5c>
8040bd00:	000e0593          	mv	a1,t3
8040bd04:	00098513          	mv	a0,s3
8040bd08:	01012c23          	sw	a6,24(sp)
8040bd0c:	00c12a23          	sw	a2,20(sp)
8040bd10:	01c12823          	sw	t3,16(sp)
8040bd14:	d71fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bd18:	01c12303          	lw	t1,28(sp)
8040bd1c:	01012e03          	lw	t3,16(sp)
8040bd20:	01412603          	lw	a2,20(sp)
8040bd24:	01812803          	lw	a6,24(sp)
8040bd28:	00651463          	bne	a0,t1,8040bd30 <stride_dequeue+0x1f18>
8040bd2c:	3b80106f          	j	8040d0e4 <stride_dequeue+0x32cc>
8040bd30:	008e2583          	lw	a1,8(t3)
8040bd34:	00098513          	mv	a0,s3
8040bd38:	004e2b03          	lw	s6,4(t3)
8040bd3c:	01012c23          	sw	a6,24(sp)
8040bd40:	00c12a23          	sw	a2,20(sp)
8040bd44:	01c12823          	sw	t3,16(sp)
8040bd48:	df9fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040bd4c:	01012e03          	lw	t3,16(sp)
8040bd50:	01412603          	lw	a2,20(sp)
8040bd54:	01812803          	lw	a6,24(sp)
8040bd58:	00ae2223          	sw	a0,4(t3)
8040bd5c:	016e2423          	sw	s6,8(t3)
8040bd60:	00051463          	bnez	a0,8040bd68 <stride_dequeue+0x1f50>
8040bd64:	6ac0106f          	j	8040d410 <stride_dequeue+0x35f8>
8040bd68:	008c2b03          	lw	s6,8(s8)
8040bd6c:	01c52023          	sw	t3,0(a0)
8040bd70:	000e0993          	mv	s3,t3
8040bd74:	00c12783          	lw	a5,12(sp)
8040bd78:	01382223          	sw	s3,4(a6)
8040bd7c:	00f82423          	sw	a5,8(a6)
8040bd80:	0109a023          	sw	a6,0(s3)
8040bd84:	00080993          	mv	s3,a6
8040bd88:	00812783          	lw	a5,8(sp)
8040bd8c:	01362223          	sw	s3,4(a2)
8040bd90:	00f62423          	sw	a5,8(a2)
8040bd94:	00c9a023          	sw	a2,0(s3)
8040bd98:	000b0993          	mv	s3,s6
8040bd9c:	aa5fe06f          	j	8040a840 <stride_dequeue+0xa28>
8040bda0:	0048a783          	lw	a5,4(a7)
8040bda4:	0088a983          	lw	s3,8(a7)
8040bda8:	00a12a23          	sw	a0,20(sp)
8040bdac:	00f12823          	sw	a5,16(sp)
8040bdb0:	04098c63          	beqz	s3,8040be08 <stride_dequeue+0x1ff0>
8040bdb4:	00080593          	mv	a1,a6
8040bdb8:	00098513          	mv	a0,s3
8040bdbc:	01112e23          	sw	a7,28(sp)
8040bdc0:	cc5fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bdc4:	01412e03          	lw	t3,20(sp)
8040bdc8:	01812803          	lw	a6,24(sp)
8040bdcc:	01c12883          	lw	a7,28(sp)
8040bdd0:	3dc50ae3          	beq	a0,t3,8040c9a4 <stride_dequeue+0x2b8c>
8040bdd4:	00882583          	lw	a1,8(a6)
8040bdd8:	00098513          	mv	a0,s3
8040bddc:	00482b03          	lw	s6,4(a6)
8040bde0:	01112c23          	sw	a7,24(sp)
8040bde4:	01012a23          	sw	a6,20(sp)
8040bde8:	d59fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040bdec:	01412803          	lw	a6,20(sp)
8040bdf0:	01812883          	lw	a7,24(sp)
8040bdf4:	00a82223          	sw	a0,4(a6)
8040bdf8:	01682423          	sw	s6,8(a6)
8040bdfc:	00050463          	beqz	a0,8040be04 <stride_dequeue+0x1fec>
8040be00:	01052023          	sw	a6,0(a0)
8040be04:	008c2b03          	lw	s6,8(s8)
8040be08:	01012783          	lw	a5,16(sp)
8040be0c:	0108a223          	sw	a6,4(a7)
8040be10:	000b0993          	mv	s3,s6
8040be14:	00f8a423          	sw	a5,8(a7)
8040be18:	01182023          	sw	a7,0(a6)
8040be1c:	00088813          	mv	a6,a7
8040be20:	9f4ff06f          	j	8040b014 <stride_dequeue+0x11fc>
8040be24:	004da783          	lw	a5,4(s11)
8040be28:	008da983          	lw	s3,8(s11)
8040be2c:	00a12823          	sw	a0,16(sp)
8040be30:	00f12623          	sw	a5,12(sp)
8040be34:	06098663          	beqz	s3,8040bea0 <stride_dequeue+0x2088>
8040be38:	00030593          	mv	a1,t1
8040be3c:	00098513          	mv	a0,s3
8040be40:	01012e23          	sw	a6,28(sp)
8040be44:	00c12c23          	sw	a2,24(sp)
8040be48:	00612a23          	sw	t1,20(sp)
8040be4c:	c39fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040be50:	01012e03          	lw	t3,16(sp)
8040be54:	01412303          	lw	t1,20(sp)
8040be58:	01812603          	lw	a2,24(sp)
8040be5c:	01c12803          	lw	a6,28(sp)
8040be60:	5dc50ee3          	beq	a0,t3,8040cc3c <stride_dequeue+0x2e24>
8040be64:	00832583          	lw	a1,8(t1)
8040be68:	00098513          	mv	a0,s3
8040be6c:	00432b03          	lw	s6,4(t1)
8040be70:	01012c23          	sw	a6,24(sp)
8040be74:	00c12a23          	sw	a2,20(sp)
8040be78:	00612823          	sw	t1,16(sp)
8040be7c:	cc5fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040be80:	01012303          	lw	t1,16(sp)
8040be84:	01412603          	lw	a2,20(sp)
8040be88:	01812803          	lw	a6,24(sp)
8040be8c:	00a32223          	sw	a0,4(t1)
8040be90:	01632423          	sw	s6,8(t1)
8040be94:	00050463          	beqz	a0,8040be9c <stride_dequeue+0x2084>
8040be98:	00652023          	sw	t1,0(a0)
8040be9c:	008c2b03          	lw	s6,8(s8)
8040bea0:	00c12783          	lw	a5,12(sp)
8040bea4:	006da223          	sw	t1,4(s11)
8040bea8:	000b0993          	mv	s3,s6
8040beac:	00fda423          	sw	a5,8(s11)
8040beb0:	01b32023          	sw	s11,0(t1)
8040beb4:	d24fe06f          	j	8040a3d8 <stride_dequeue+0x5c0>
8040beb8:	004ca783          	lw	a5,4(s9)
8040bebc:	008ca983          	lw	s3,8(s9)
8040bec0:	00a12a23          	sw	a0,20(sp)
8040bec4:	00f12823          	sw	a5,16(sp)
8040bec8:	04098e63          	beqz	s3,8040bf24 <stride_dequeue+0x210c>
8040becc:	00030593          	mv	a1,t1
8040bed0:	00098513          	mv	a0,s3
8040bed4:	01012e23          	sw	a6,28(sp)
8040bed8:	00612c23          	sw	t1,24(sp)
8040bedc:	ba9fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bee0:	01412e03          	lw	t3,20(sp)
8040bee4:	01812303          	lw	t1,24(sp)
8040bee8:	01c12803          	lw	a6,28(sp)
8040beec:	25c50ae3          	beq	a0,t3,8040c940 <stride_dequeue+0x2b28>
8040bef0:	00832583          	lw	a1,8(t1)
8040bef4:	00098513          	mv	a0,s3
8040bef8:	00432b03          	lw	s6,4(t1)
8040befc:	01012c23          	sw	a6,24(sp)
8040bf00:	00612a23          	sw	t1,20(sp)
8040bf04:	c3dfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040bf08:	01412303          	lw	t1,20(sp)
8040bf0c:	01812803          	lw	a6,24(sp)
8040bf10:	00a32223          	sw	a0,4(t1)
8040bf14:	01632423          	sw	s6,8(t1)
8040bf18:	00050463          	beqz	a0,8040bf20 <stride_dequeue+0x2108>
8040bf1c:	00652023          	sw	t1,0(a0)
8040bf20:	008c2b03          	lw	s6,8(s8)
8040bf24:	01012783          	lw	a5,16(sp)
8040bf28:	006ca223          	sw	t1,4(s9)
8040bf2c:	000b0993          	mv	s3,s6
8040bf30:	00fca423          	sw	a5,8(s9)
8040bf34:	01932023          	sw	s9,0(t1)
8040bf38:	b55fe06f          	j	8040aa8c <stride_dequeue+0xc74>
8040bf3c:	004da783          	lw	a5,4(s11)
8040bf40:	008da983          	lw	s3,8(s11)
8040bf44:	00a12a23          	sw	a0,20(sp)
8040bf48:	00f12823          	sw	a5,16(sp)
8040bf4c:	04098e63          	beqz	s3,8040bfa8 <stride_dequeue+0x2190>
8040bf50:	00030593          	mv	a1,t1
8040bf54:	00098513          	mv	a0,s3
8040bf58:	01012e23          	sw	a6,28(sp)
8040bf5c:	00612c23          	sw	t1,24(sp)
8040bf60:	b25fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bf64:	01412e03          	lw	t3,20(sp)
8040bf68:	01812303          	lw	t1,24(sp)
8040bf6c:	01c12803          	lw	a6,28(sp)
8040bf70:	53c50ce3          	beq	a0,t3,8040cca8 <stride_dequeue+0x2e90>
8040bf74:	00832583          	lw	a1,8(t1)
8040bf78:	00098513          	mv	a0,s3
8040bf7c:	00432b03          	lw	s6,4(t1)
8040bf80:	01012c23          	sw	a6,24(sp)
8040bf84:	00612a23          	sw	t1,20(sp)
8040bf88:	bb9fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040bf8c:	01412303          	lw	t1,20(sp)
8040bf90:	01812803          	lw	a6,24(sp)
8040bf94:	00a32223          	sw	a0,4(t1)
8040bf98:	01632423          	sw	s6,8(t1)
8040bf9c:	00050463          	beqz	a0,8040bfa4 <stride_dequeue+0x218c>
8040bfa0:	00652023          	sw	t1,0(a0)
8040bfa4:	008c2b03          	lw	s6,8(s8)
8040bfa8:	01012783          	lw	a5,16(sp)
8040bfac:	006da223          	sw	t1,4(s11)
8040bfb0:	000b0993          	mv	s3,s6
8040bfb4:	00fda423          	sw	a5,8(s11)
8040bfb8:	01b32023          	sw	s11,0(t1)
8040bfbc:	a40fe06f          	j	8040a1fc <stride_dequeue+0x3e4>
8040bfc0:	0048a783          	lw	a5,4(a7)
8040bfc4:	0088a983          	lw	s3,8(a7)
8040bfc8:	00a12a23          	sw	a0,20(sp)
8040bfcc:	00f12823          	sw	a5,16(sp)
8040bfd0:	04098c63          	beqz	s3,8040c028 <stride_dequeue+0x2210>
8040bfd4:	00030593          	mv	a1,t1
8040bfd8:	00098513          	mv	a0,s3
8040bfdc:	01112e23          	sw	a7,28(sp)
8040bfe0:	aa5fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040bfe4:	01412e03          	lw	t3,20(sp)
8040bfe8:	01812303          	lw	t1,24(sp)
8040bfec:	01c12883          	lw	a7,28(sp)
8040bff0:	5bc502e3          	beq	a0,t3,8040cd94 <stride_dequeue+0x2f7c>
8040bff4:	00832583          	lw	a1,8(t1)
8040bff8:	00098513          	mv	a0,s3
8040bffc:	00432b03          	lw	s6,4(t1)
8040c000:	01112c23          	sw	a7,24(sp)
8040c004:	00612a23          	sw	t1,20(sp)
8040c008:	b39fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c00c:	01412303          	lw	t1,20(sp)
8040c010:	01812883          	lw	a7,24(sp)
8040c014:	00a32223          	sw	a0,4(t1)
8040c018:	01632423          	sw	s6,8(t1)
8040c01c:	00050463          	beqz	a0,8040c024 <stride_dequeue+0x220c>
8040c020:	00652023          	sw	t1,0(a0)
8040c024:	008c2b03          	lw	s6,8(s8)
8040c028:	01012783          	lw	a5,16(sp)
8040c02c:	0068a223          	sw	t1,4(a7)
8040c030:	000b0993          	mv	s3,s6
8040c034:	00f8a423          	sw	a5,8(a7)
8040c038:	01132023          	sw	a7,0(t1)
8040c03c:	91dfe06f          	j	8040a958 <stride_dequeue+0xb40>
8040c040:	00892503          	lw	a0,8(s2)
8040c044:	00492983          	lw	s3,4(s2)
8040c048:	000b0593          	mv	a1,s6
8040c04c:	af5fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c050:	00a92223          	sw	a0,4(s2)
8040c054:	01392423          	sw	s3,8(s2)
8040c058:	01412803          	lw	a6,20(sp)
8040c05c:	01812783          	lw	a5,24(sp)
8040c060:	00050463          	beqz	a0,8040c068 <stride_dequeue+0x2250>
8040c064:	01252023          	sw	s2,0(a0)
8040c068:	008c2983          	lw	s3,8(s8)
8040c06c:	f71fd06f          	j	80409fdc <stride_dequeue+0x1c4>
8040c070:	0049a703          	lw	a4,4(s3)
8040c074:	0089a783          	lw	a5,8(s3)
8040c078:	00a12a23          	sw	a0,20(sp)
8040c07c:	00e12423          	sw	a4,8(sp)
8040c080:	04078a63          	beqz	a5,8040c0d4 <stride_dequeue+0x22bc>
8040c084:	00078513          	mv	a0,a5
8040c088:	000a0593          	mv	a1,s4
8040c08c:	00c12823          	sw	a2,16(sp)
8040c090:	00f12623          	sw	a5,12(sp)
8040c094:	9f1fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c098:	01412883          	lw	a7,20(sp)
8040c09c:	00c12783          	lw	a5,12(sp)
8040c0a0:	01012603          	lw	a2,16(sp)
8040c0a4:	631508e3          	beq	a0,a7,8040ced4 <stride_dequeue+0x30bc>
8040c0a8:	008a2583          	lw	a1,8(s4)
8040c0ac:	004a2b03          	lw	s6,4(s4)
8040c0b0:	00078513          	mv	a0,a5
8040c0b4:	00c12623          	sw	a2,12(sp)
8040c0b8:	a89fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c0bc:	00aa2223          	sw	a0,4(s4)
8040c0c0:	016a2423          	sw	s6,8(s4)
8040c0c4:	00c12603          	lw	a2,12(sp)
8040c0c8:	00050463          	beqz	a0,8040c0d0 <stride_dequeue+0x22b8>
8040c0cc:	01452023          	sw	s4,0(a0)
8040c0d0:	008c2b03          	lw	s6,8(s8)
8040c0d4:	00812783          	lw	a5,8(sp)
8040c0d8:	0149a223          	sw	s4,4(s3)
8040c0dc:	00f9a423          	sw	a5,8(s3)
8040c0e0:	013a2023          	sw	s3,0(s4)
8040c0e4:	00098a13          	mv	s4,s3
8040c0e8:	85cff06f          	j	8040b144 <stride_dequeue+0x132c>
8040c0ec:	004a2703          	lw	a4,4(s4)
8040c0f0:	008a2783          	lw	a5,8(s4)
8040c0f4:	00a12a23          	sw	a0,20(sp)
8040c0f8:	00e12623          	sw	a4,12(sp)
8040c0fc:	04078263          	beqz	a5,8040c140 <stride_dequeue+0x2328>
8040c100:	00078513          	mv	a0,a5
8040c104:	00098593          	mv	a1,s3
8040c108:	00f12823          	sw	a5,16(sp)
8040c10c:	979fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c110:	01412303          	lw	t1,20(sp)
8040c114:	01012783          	lw	a5,16(sp)
8040c118:	526504e3          	beq	a0,t1,8040ce40 <stride_dequeue+0x3028>
8040c11c:	0089a583          	lw	a1,8(s3)
8040c120:	0049ab03          	lw	s6,4(s3)
8040c124:	00078513          	mv	a0,a5
8040c128:	a19fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c12c:	00a9a223          	sw	a0,4(s3)
8040c130:	0169a423          	sw	s6,8(s3)
8040c134:	00050463          	beqz	a0,8040c13c <stride_dequeue+0x2324>
8040c138:	01352023          	sw	s3,0(a0)
8040c13c:	008c2b03          	lw	s6,8(s8)
8040c140:	00c12783          	lw	a5,12(sp)
8040c144:	013a2223          	sw	s3,4(s4)
8040c148:	00fa2423          	sw	a5,8(s4)
8040c14c:	0149a023          	sw	s4,0(s3)
8040c150:	000a0993          	mv	s3,s4
8040c154:	a89fe06f          	j	8040abdc <stride_dequeue+0xdc4>
8040c158:	0049a703          	lw	a4,4(s3)
8040c15c:	0089a783          	lw	a5,8(s3)
8040c160:	00a12a23          	sw	a0,20(sp)
8040c164:	00e12623          	sw	a4,12(sp)
8040c168:	04078263          	beqz	a5,8040c1ac <stride_dequeue+0x2394>
8040c16c:	00078513          	mv	a0,a5
8040c170:	000a0593          	mv	a1,s4
8040c174:	00f12823          	sw	a5,16(sp)
8040c178:	90dfd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c17c:	01412883          	lw	a7,20(sp)
8040c180:	01012783          	lw	a5,16(sp)
8040c184:	5f1502e3          	beq	a0,a7,8040cf68 <stride_dequeue+0x3150>
8040c188:	008a2583          	lw	a1,8(s4)
8040c18c:	004a2b03          	lw	s6,4(s4)
8040c190:	00078513          	mv	a0,a5
8040c194:	9adfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c198:	00aa2223          	sw	a0,4(s4)
8040c19c:	016a2423          	sw	s6,8(s4)
8040c1a0:	00050463          	beqz	a0,8040c1a8 <stride_dequeue+0x2390>
8040c1a4:	01452023          	sw	s4,0(a0)
8040c1a8:	008c2b03          	lw	s6,8(s8)
8040c1ac:	00c12783          	lw	a5,12(sp)
8040c1b0:	0149a223          	sw	s4,4(s3)
8040c1b4:	00f9a423          	sw	a5,8(s3)
8040c1b8:	013a2023          	sw	s3,0(s4)
8040c1bc:	00098a13          	mv	s4,s3
8040c1c0:	89cff06f          	j	8040b25c <stride_dequeue+0x1444>
8040c1c4:	0049a703          	lw	a4,4(s3)
8040c1c8:	0089a783          	lw	a5,8(s3)
8040c1cc:	00a12a23          	sw	a0,20(sp)
8040c1d0:	00e12623          	sw	a4,12(sp)
8040c1d4:	04078263          	beqz	a5,8040c218 <stride_dequeue+0x2400>
8040c1d8:	00078513          	mv	a0,a5
8040c1dc:	000c8593          	mv	a1,s9
8040c1e0:	00f12823          	sw	a5,16(sp)
8040c1e4:	8a1fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c1e8:	01412883          	lw	a7,20(sp)
8040c1ec:	01012783          	lw	a5,16(sp)
8040c1f0:	551504e3          	beq	a0,a7,8040cf38 <stride_dequeue+0x3120>
8040c1f4:	008ca583          	lw	a1,8(s9)
8040c1f8:	004cab03          	lw	s6,4(s9)
8040c1fc:	00078513          	mv	a0,a5
8040c200:	941fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c204:	00aca223          	sw	a0,4(s9)
8040c208:	016ca423          	sw	s6,8(s9)
8040c20c:	00050463          	beqz	a0,8040c214 <stride_dequeue+0x23fc>
8040c210:	01952023          	sw	s9,0(a0)
8040c214:	008c2b03          	lw	s6,8(s8)
8040c218:	00c12783          	lw	a5,12(sp)
8040c21c:	0199a223          	sw	s9,4(s3)
8040c220:	00f9a423          	sw	a5,8(s3)
8040c224:	013ca023          	sw	s3,0(s9)
8040c228:	00098c93          	mv	s9,s3
8040c22c:	944ff06f          	j	8040b370 <stride_dequeue+0x1558>
8040c230:	008c2b03          	lw	s6,8(s8)
8040c234:	00088993          	mv	s3,a7
8040c238:	dc9fe06f          	j	8040b000 <stride_dequeue+0x11e8>
8040c23c:	0048a783          	lw	a5,4(a7)
8040c240:	0088a803          	lw	a6,8(a7)
8040c244:	00a12e23          	sw	a0,28(sp)
8040c248:	00f12823          	sw	a5,16(sp)
8040c24c:	04080a63          	beqz	a6,8040c2a0 <stride_dequeue+0x2488>
8040c250:	00080513          	mv	a0,a6
8040c254:	00098593          	mv	a1,s3
8040c258:	01112c23          	sw	a7,24(sp)
8040c25c:	01012a23          	sw	a6,20(sp)
8040c260:	825fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c264:	01c12e03          	lw	t3,28(sp)
8040c268:	01412803          	lw	a6,20(sp)
8040c26c:	01812883          	lw	a7,24(sp)
8040c270:	57c502e3          	beq	a0,t3,8040cfd4 <stride_dequeue+0x31bc>
8040c274:	0089a583          	lw	a1,8(s3)
8040c278:	0049ab03          	lw	s6,4(s3)
8040c27c:	00080513          	mv	a0,a6
8040c280:	01112a23          	sw	a7,20(sp)
8040c284:	8bdfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c288:	00a9a223          	sw	a0,4(s3)
8040c28c:	0169a423          	sw	s6,8(s3)
8040c290:	01412883          	lw	a7,20(sp)
8040c294:	00050463          	beqz	a0,8040c29c <stride_dequeue+0x2484>
8040c298:	01352023          	sw	s3,0(a0)
8040c29c:	008c2b03          	lw	s6,8(s8)
8040c2a0:	01012783          	lw	a5,16(sp)
8040c2a4:	0138a223          	sw	s3,4(a7)
8040c2a8:	00f8a423          	sw	a5,8(a7)
8040c2ac:	0119a023          	sw	a7,0(s3)
8040c2b0:	00088993          	mv	s3,a7
8040c2b4:	c81fe06f          	j	8040af34 <stride_dequeue+0x111c>
8040c2b8:	0048a783          	lw	a5,4(a7)
8040c2bc:	0088a803          	lw	a6,8(a7)
8040c2c0:	00a12e23          	sw	a0,28(sp)
8040c2c4:	00f12823          	sw	a5,16(sp)
8040c2c8:	04080a63          	beqz	a6,8040c31c <stride_dequeue+0x2504>
8040c2cc:	00080513          	mv	a0,a6
8040c2d0:	00098593          	mv	a1,s3
8040c2d4:	01112c23          	sw	a7,24(sp)
8040c2d8:	01012a23          	sw	a6,20(sp)
8040c2dc:	fa8fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c2e0:	01c12e03          	lw	t3,28(sp)
8040c2e4:	01412803          	lw	a6,20(sp)
8040c2e8:	01812883          	lw	a7,24(sp)
8040c2ec:	69c508e3          	beq	a0,t3,8040d17c <stride_dequeue+0x3364>
8040c2f0:	0089a583          	lw	a1,8(s3)
8040c2f4:	0049ab03          	lw	s6,4(s3)
8040c2f8:	00080513          	mv	a0,a6
8040c2fc:	01112a23          	sw	a7,20(sp)
8040c300:	841fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c304:	00a9a223          	sw	a0,4(s3)
8040c308:	0169a423          	sw	s6,8(s3)
8040c30c:	01412883          	lw	a7,20(sp)
8040c310:	00050463          	beqz	a0,8040c318 <stride_dequeue+0x2500>
8040c314:	01352023          	sw	s3,0(a0)
8040c318:	008c2b03          	lw	s6,8(s8)
8040c31c:	01012783          	lw	a5,16(sp)
8040c320:	0138a223          	sw	s3,4(a7)
8040c324:	00f8a423          	sw	a5,8(a7)
8040c328:	0119a023          	sw	a7,0(s3)
8040c32c:	00088993          	mv	s3,a7
8040c330:	9c1fe06f          	j	8040acf0 <stride_dequeue+0xed8>
8040c334:	0048a783          	lw	a5,4(a7)
8040c338:	0088a803          	lw	a6,8(a7)
8040c33c:	00a12e23          	sw	a0,28(sp)
8040c340:	00f12623          	sw	a5,12(sp)
8040c344:	06080263          	beqz	a6,8040c3a8 <stride_dequeue+0x2590>
8040c348:	00080513          	mv	a0,a6
8040c34c:	00098593          	mv	a1,s3
8040c350:	01112c23          	sw	a7,24(sp)
8040c354:	01012823          	sw	a6,16(sp)
8040c358:	f2cfd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c35c:	01c12e03          	lw	t3,28(sp)
8040c360:	01012803          	lw	a6,16(sp)
8040c364:	01412603          	lw	a2,20(sp)
8040c368:	01812883          	lw	a7,24(sp)
8040c36c:	01c51463          	bne	a0,t3,8040c374 <stride_dequeue+0x255c>
8040c370:	7690006f          	j	8040d2d8 <stride_dequeue+0x34c0>
8040c374:	0089a583          	lw	a1,8(s3)
8040c378:	0049ab03          	lw	s6,4(s3)
8040c37c:	00080513          	mv	a0,a6
8040c380:	01112a23          	sw	a7,20(sp)
8040c384:	00c12823          	sw	a2,16(sp)
8040c388:	fb8fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c38c:	00a9a223          	sw	a0,4(s3)
8040c390:	0169a423          	sw	s6,8(s3)
8040c394:	01012603          	lw	a2,16(sp)
8040c398:	01412883          	lw	a7,20(sp)
8040c39c:	00050463          	beqz	a0,8040c3a4 <stride_dequeue+0x258c>
8040c3a0:	01352023          	sw	s3,0(a0)
8040c3a4:	008c2b03          	lw	s6,8(s8)
8040c3a8:	00c12783          	lw	a5,12(sp)
8040c3ac:	0138a223          	sw	s3,4(a7)
8040c3b0:	00f8a423          	sw	a5,8(a7)
8040c3b4:	0119a023          	sw	a7,0(s3)
8040c3b8:	00088993          	mv	s3,a7
8040c3bc:	a69fe06f          	j	8040ae24 <stride_dequeue+0x100c>
8040c3c0:	00462783          	lw	a5,4(a2)
8040c3c4:	00862883          	lw	a7,8(a2)
8040c3c8:	00a12e23          	sw	a0,28(sp)
8040c3cc:	00f12623          	sw	a5,12(sp)
8040c3d0:	06088263          	beqz	a7,8040c434 <stride_dequeue+0x261c>
8040c3d4:	00088513          	mv	a0,a7
8040c3d8:	00098593          	mv	a1,s3
8040c3dc:	01012c23          	sw	a6,24(sp)
8040c3e0:	00c12a23          	sw	a2,20(sp)
8040c3e4:	01112823          	sw	a7,16(sp)
8040c3e8:	e9cfd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c3ec:	01c12e03          	lw	t3,28(sp)
8040c3f0:	01012883          	lw	a7,16(sp)
8040c3f4:	01412603          	lw	a2,20(sp)
8040c3f8:	01812803          	lw	a6,24(sp)
8040c3fc:	45c502e3          	beq	a0,t3,8040d040 <stride_dequeue+0x3228>
8040c400:	0089a583          	lw	a1,8(s3)
8040c404:	0049ab03          	lw	s6,4(s3)
8040c408:	00088513          	mv	a0,a7
8040c40c:	01012a23          	sw	a6,20(sp)
8040c410:	00c12823          	sw	a2,16(sp)
8040c414:	f2cfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c418:	00a9a223          	sw	a0,4(s3)
8040c41c:	0169a423          	sw	s6,8(s3)
8040c420:	01012603          	lw	a2,16(sp)
8040c424:	01412803          	lw	a6,20(sp)
8040c428:	00050463          	beqz	a0,8040c430 <stride_dequeue+0x2618>
8040c42c:	01352023          	sw	s3,0(a0)
8040c430:	008c2b03          	lw	s6,8(s8)
8040c434:	00c12783          	lw	a5,12(sp)
8040c438:	01362223          	sw	s3,4(a2)
8040c43c:	00f62423          	sw	a5,8(a2)
8040c440:	00c9a023          	sw	a2,0(s3)
8040c444:	00060993          	mv	s3,a2
8040c448:	be0fe06f          	j	8040a828 <stride_dequeue+0xa10>
8040c44c:	0049a783          	lw	a5,4(s3)
8040c450:	0089a303          	lw	t1,8(s3)
8040c454:	00a12e23          	sw	a0,28(sp)
8040c458:	00f12823          	sw	a5,16(sp)
8040c45c:	04030a63          	beqz	t1,8040c4b0 <stride_dequeue+0x2698>
8040c460:	00080593          	mv	a1,a6
8040c464:	00030513          	mv	a0,t1
8040c468:	01012c23          	sw	a6,24(sp)
8040c46c:	00612a23          	sw	t1,20(sp)
8040c470:	e14fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c474:	01c12e03          	lw	t3,28(sp)
8040c478:	01412303          	lw	t1,20(sp)
8040c47c:	01812803          	lw	a6,24(sp)
8040c480:	4dc506e3          	beq	a0,t3,8040d14c <stride_dequeue+0x3334>
8040c484:	00882583          	lw	a1,8(a6)
8040c488:	00030513          	mv	a0,t1
8040c48c:	00482b03          	lw	s6,4(a6)
8040c490:	01012a23          	sw	a6,20(sp)
8040c494:	eacfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c498:	01412803          	lw	a6,20(sp)
8040c49c:	00a82223          	sw	a0,4(a6)
8040c4a0:	01682423          	sw	s6,8(a6)
8040c4a4:	00050463          	beqz	a0,8040c4ac <stride_dequeue+0x2694>
8040c4a8:	01052023          	sw	a6,0(a0)
8040c4ac:	008c2b03          	lw	s6,8(s8)
8040c4b0:	01012783          	lw	a5,16(sp)
8040c4b4:	0109a223          	sw	a6,4(s3)
8040c4b8:	00f9a423          	sw	a5,8(s3)
8040c4bc:	01382023          	sw	s3,0(a6)
8040c4c0:	00098813          	mv	a6,s3
8040c4c4:	85cff06f          	j	8040b520 <stride_dequeue+0x1708>
8040c4c8:	008c2b03          	lw	s6,8(s8)
8040c4cc:	00088993          	mv	s3,a7
8040c4d0:	c70fe06f          	j	8040a940 <stride_dequeue+0xb28>
8040c4d4:	0049a783          	lw	a5,4(s3)
8040c4d8:	0089a303          	lw	t1,8(s3)
8040c4dc:	00a12e23          	sw	a0,28(sp)
8040c4e0:	00f12823          	sw	a5,16(sp)
8040c4e4:	04030a63          	beqz	t1,8040c538 <stride_dequeue+0x2720>
8040c4e8:	00080593          	mv	a1,a6
8040c4ec:	00030513          	mv	a0,t1
8040c4f0:	01012c23          	sw	a6,24(sp)
8040c4f4:	00612a23          	sw	t1,20(sp)
8040c4f8:	d8cfd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c4fc:	01c12e03          	lw	t3,28(sp)
8040c500:	01412303          	lw	t1,20(sp)
8040c504:	01812803          	lw	a6,24(sp)
8040c508:	41c50ae3          	beq	a0,t3,8040d11c <stride_dequeue+0x3304>
8040c50c:	00882583          	lw	a1,8(a6)
8040c510:	00030513          	mv	a0,t1
8040c514:	00482b03          	lw	s6,4(a6)
8040c518:	01012a23          	sw	a6,20(sp)
8040c51c:	e24fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c520:	01412803          	lw	a6,20(sp)
8040c524:	00a82223          	sw	a0,4(a6)
8040c528:	01682423          	sw	s6,8(a6)
8040c52c:	00050463          	beqz	a0,8040c534 <stride_dequeue+0x271c>
8040c530:	01052023          	sw	a6,0(a0)
8040c534:	008c2b03          	lw	s6,8(s8)
8040c538:	01012783          	lw	a5,16(sp)
8040c53c:	0109a223          	sw	a6,4(s3)
8040c540:	00f9a423          	sw	a5,8(s3)
8040c544:	01382023          	sw	s3,0(a6)
8040c548:	00098813          	mv	a6,s3
8040c54c:	8a8ff06f          	j	8040b5f4 <stride_dequeue+0x17dc>
8040c550:	004ca783          	lw	a5,4(s9)
8040c554:	008ca883          	lw	a7,8(s9)
8040c558:	00a12e23          	sw	a0,28(sp)
8040c55c:	00f12823          	sw	a5,16(sp)
8040c560:	04088a63          	beqz	a7,8040c5b4 <stride_dequeue+0x279c>
8040c564:	00088513          	mv	a0,a7
8040c568:	00098593          	mv	a1,s3
8040c56c:	01012c23          	sw	a6,24(sp)
8040c570:	01112a23          	sw	a7,20(sp)
8040c574:	d10fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c578:	01c12e03          	lw	t3,28(sp)
8040c57c:	01412883          	lw	a7,20(sp)
8040c580:	01812803          	lw	a6,24(sp)
8040c584:	53c500e3          	beq	a0,t3,8040d2a4 <stride_dequeue+0x348c>
8040c588:	0089a583          	lw	a1,8(s3)
8040c58c:	0049ab03          	lw	s6,4(s3)
8040c590:	00088513          	mv	a0,a7
8040c594:	01012a23          	sw	a6,20(sp)
8040c598:	da8fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c59c:	00a9a223          	sw	a0,4(s3)
8040c5a0:	0169a423          	sw	s6,8(s3)
8040c5a4:	01412803          	lw	a6,20(sp)
8040c5a8:	00050463          	beqz	a0,8040c5b0 <stride_dequeue+0x2798>
8040c5ac:	01352023          	sw	s3,0(a0)
8040c5b0:	008c2b03          	lw	s6,8(s8)
8040c5b4:	01012783          	lw	a5,16(sp)
8040c5b8:	013ca223          	sw	s3,4(s9)
8040c5bc:	00fca423          	sw	a5,8(s9)
8040c5c0:	0199a023          	sw	s9,0(s3)
8040c5c4:	000c8993          	mv	s3,s9
8040c5c8:	f99fd06f          	j	8040a560 <stride_dequeue+0x748>
8040c5cc:	008c2b03          	lw	s6,8(s8)
8040c5d0:	000d8993          	mv	s3,s11
8040c5d4:	c11fd06f          	j	8040a1e4 <stride_dequeue+0x3cc>
8040c5d8:	004a2783          	lw	a5,4(s4)
8040c5dc:	008a2883          	lw	a7,8(s4)
8040c5e0:	00a12e23          	sw	a0,28(sp)
8040c5e4:	00f12823          	sw	a5,16(sp)
8040c5e8:	04088a63          	beqz	a7,8040c63c <stride_dequeue+0x2824>
8040c5ec:	00088513          	mv	a0,a7
8040c5f0:	00098593          	mv	a1,s3
8040c5f4:	01012c23          	sw	a6,24(sp)
8040c5f8:	01112a23          	sw	a7,20(sp)
8040c5fc:	c88fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c600:	01c12e03          	lw	t3,28(sp)
8040c604:	01412883          	lw	a7,20(sp)
8040c608:	01812803          	lw	a6,24(sp)
8040c60c:	57c502e3          	beq	a0,t3,8040d370 <stride_dequeue+0x3558>
8040c610:	0089a583          	lw	a1,8(s3)
8040c614:	0049ab03          	lw	s6,4(s3)
8040c618:	00088513          	mv	a0,a7
8040c61c:	01012a23          	sw	a6,20(sp)
8040c620:	d20fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c624:	00a9a223          	sw	a0,4(s3)
8040c628:	0169a423          	sw	s6,8(s3)
8040c62c:	01412803          	lw	a6,20(sp)
8040c630:	00050463          	beqz	a0,8040c638 <stride_dequeue+0x2820>
8040c634:	01352023          	sw	s3,0(a0)
8040c638:	008c2b03          	lw	s6,8(s8)
8040c63c:	01012783          	lw	a5,16(sp)
8040c640:	013a2223          	sw	s3,4(s4)
8040c644:	00fa2423          	sw	a5,8(s4)
8040c648:	0149a023          	sw	s4,0(s3)
8040c64c:	000a0993          	mv	s3,s4
8040c650:	870fe06f          	j	8040a6c0 <stride_dequeue+0x8a8>
8040c654:	0049a783          	lw	a5,4(s3)
8040c658:	0089a303          	lw	t1,8(s3)
8040c65c:	00a12e23          	sw	a0,28(sp)
8040c660:	00f12823          	sw	a5,16(sp)
8040c664:	04030a63          	beqz	t1,8040c6b8 <stride_dequeue+0x28a0>
8040c668:	00030513          	mv	a0,t1
8040c66c:	000c8593          	mv	a1,s9
8040c670:	01112c23          	sw	a7,24(sp)
8040c674:	00612a23          	sw	t1,20(sp)
8040c678:	c0cfd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c67c:	01c12e03          	lw	t3,28(sp)
8040c680:	01412303          	lw	t1,20(sp)
8040c684:	01812883          	lw	a7,24(sp)
8040c688:	1fc508e3          	beq	a0,t3,8040d078 <stride_dequeue+0x3260>
8040c68c:	008ca583          	lw	a1,8(s9)
8040c690:	004cab03          	lw	s6,4(s9)
8040c694:	00030513          	mv	a0,t1
8040c698:	01112a23          	sw	a7,20(sp)
8040c69c:	ca4fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c6a0:	00aca223          	sw	a0,4(s9)
8040c6a4:	016ca423          	sw	s6,8(s9)
8040c6a8:	01412883          	lw	a7,20(sp)
8040c6ac:	00050463          	beqz	a0,8040c6b4 <stride_dequeue+0x289c>
8040c6b0:	01952023          	sw	s9,0(a0)
8040c6b4:	008c2b03          	lw	s6,8(s8)
8040c6b8:	01012783          	lw	a5,16(sp)
8040c6bc:	0199a223          	sw	s9,4(s3)
8040c6c0:	00f9a423          	sw	a5,8(s3)
8040c6c4:	013ca023          	sw	s3,0(s9)
8040c6c8:	00098c93          	mv	s9,s3
8040c6cc:	d7dfe06f          	j	8040b448 <stride_dequeue+0x1630>
8040c6d0:	008c2b03          	lw	s6,8(s8)
8040c6d4:	000c8993          	mv	s3,s9
8040c6d8:	b9cfe06f          	j	8040aa74 <stride_dequeue+0xc5c>
8040c6dc:	0049a783          	lw	a5,4(s3)
8040c6e0:	0089a303          	lw	t1,8(s3)
8040c6e4:	00a12e23          	sw	a0,28(sp)
8040c6e8:	00f12623          	sw	a5,12(sp)
8040c6ec:	06030263          	beqz	t1,8040c750 <stride_dequeue+0x2938>
8040c6f0:	00080593          	mv	a1,a6
8040c6f4:	00030513          	mv	a0,t1
8040c6f8:	00c12c23          	sw	a2,24(sp)
8040c6fc:	01012a23          	sw	a6,20(sp)
8040c700:	00612823          	sw	t1,16(sp)
8040c704:	b80fd0ef          	jal	ra,80409a84 <proc_stride_comp_f>
8040c708:	01812603          	lw	a2,24(sp)
8040c70c:	01c12e03          	lw	t3,28(sp)
8040c710:	01412803          	lw	a6,20(sp)
8040c714:	00c12a23          	sw	a2,20(sp)
8040c718:	01012303          	lw	t1,16(sp)
8040c71c:	29c50ae3          	beq	a0,t3,8040d1b0 <stride_dequeue+0x3398>
8040c720:	00882583          	lw	a1,8(a6)
8040c724:	00030513          	mv	a0,t1
8040c728:	00482b03          	lw	s6,4(a6)
8040c72c:	01012823          	sw	a6,16(sp)
8040c730:	c10fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c734:	01012803          	lw	a6,16(sp)
8040c738:	01412603          	lw	a2,20(sp)
8040c73c:	00a82223          	sw	a0,4(a6)
8040c740:	01682423          	sw	s6,8(a6)
8040c744:	00050463          	beqz	a0,8040c74c <stride_dequeue+0x2934>
8040c748:	01052023          	sw	a6,0(a0)
8040c74c:	008c2b03          	lw	s6,8(s8)
8040c750:	00c12783          	lw	a5,12(sp)
8040c754:	0109a223          	sw	a6,4(s3)
8040c758:	00f9a423          	sw	a5,8(s3)
8040c75c:	01382023          	sw	s3,0(a6)
8040c760:	00098813          	mv	a6,s3
8040c764:	f7dfe06f          	j	8040b6e0 <stride_dequeue+0x18c8>
8040c768:	000a0993          	mv	s3,s4
8040c76c:	c70fe06f          	j	8040abdc <stride_dequeue+0xdc4>
8040c770:	008c2b03          	lw	s6,8(s8)
8040c774:	000d8993          	mv	s3,s11
8040c778:	c49fd06f          	j	8040a3c0 <stride_dequeue+0x5a8>
8040c77c:	008da503          	lw	a0,8(s11)
8040c780:	004dab03          	lw	s6,4(s11)
8040c784:	00098593          	mv	a1,s3
8040c788:	bb8fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c78c:	00ada223          	sw	a0,4(s11)
8040c790:	016da423          	sw	s6,8(s11)
8040c794:	01012603          	lw	a2,16(sp)
8040c798:	01412803          	lw	a6,20(sp)
8040c79c:	01812303          	lw	t1,24(sp)
8040c7a0:	fc0508e3          	beqz	a0,8040c770 <stride_dequeue+0x2958>
8040c7a4:	01b52023          	sw	s11,0(a0)
8040c7a8:	000d8993          	mv	s3,s11
8040c7ac:	008c2b03          	lw	s6,8(s8)
8040c7b0:	c11fd06f          	j	8040a3c0 <stride_dequeue+0x5a8>
8040c7b4:	0089a503          	lw	a0,8(s3)
8040c7b8:	0049ab03          	lw	s6,4(s3)
8040c7bc:	00078593          	mv	a1,a5
8040c7c0:	01012a23          	sw	a6,20(sp)
8040c7c4:	b7cfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c7c8:	00a9a223          	sw	a0,4(s3)
8040c7cc:	0169a423          	sw	s6,8(s3)
8040c7d0:	01412803          	lw	a6,20(sp)
8040c7d4:	6a050a63          	beqz	a0,8040ce88 <stride_dequeue+0x3070>
8040c7d8:	01352023          	sw	s3,0(a0)
8040c7dc:	00098793          	mv	a5,s3
8040c7e0:	008c2b03          	lw	s6,8(s8)
8040c7e4:	f85fe06f          	j	8040b768 <stride_dequeue+0x1950>
8040c7e8:	0088a503          	lw	a0,8(a7)
8040c7ec:	00098593          	mv	a1,s3
8040c7f0:	0048ab03          	lw	s6,4(a7)
8040c7f4:	00612c23          	sw	t1,24(sp)
8040c7f8:	01112a23          	sw	a7,20(sp)
8040c7fc:	b44fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c800:	01412883          	lw	a7,20(sp)
8040c804:	01812303          	lw	t1,24(sp)
8040c808:	00a8a223          	sw	a0,4(a7)
8040c80c:	0168a423          	sw	s6,8(a7)
8040c810:	ca050ce3          	beqz	a0,8040c4c8 <stride_dequeue+0x26b0>
8040c814:	01152023          	sw	a7,0(a0)
8040c818:	00088993          	mv	s3,a7
8040c81c:	008c2b03          	lw	s6,8(s8)
8040c820:	920fe06f          	j	8040a940 <stride_dequeue+0xb28>
8040c824:	008ca503          	lw	a0,8(s9)
8040c828:	004cab03          	lw	s6,4(s9)
8040c82c:	00098593          	mv	a1,s3
8040c830:	b10fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c834:	00aca223          	sw	a0,4(s9)
8040c838:	016ca423          	sw	s6,8(s9)
8040c83c:	01412803          	lw	a6,20(sp)
8040c840:	01812303          	lw	t1,24(sp)
8040c844:	e80506e3          	beqz	a0,8040c6d0 <stride_dequeue+0x28b8>
8040c848:	01952023          	sw	s9,0(a0)
8040c84c:	000c8993          	mv	s3,s9
8040c850:	008c2b03          	lw	s6,8(s8)
8040c854:	a20fe06f          	j	8040aa74 <stride_dequeue+0xc5c>
8040c858:	008da503          	lw	a0,8(s11)
8040c85c:	004dab03          	lw	s6,4(s11)
8040c860:	00098593          	mv	a1,s3
8040c864:	adcfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c868:	00ada223          	sw	a0,4(s11)
8040c86c:	016da423          	sw	s6,8(s11)
8040c870:	01412803          	lw	a6,20(sp)
8040c874:	01812303          	lw	t1,24(sp)
8040c878:	d4050ae3          	beqz	a0,8040c5cc <stride_dequeue+0x27b4>
8040c87c:	01b52023          	sw	s11,0(a0)
8040c880:	000d8993          	mv	s3,s11
8040c884:	008c2b03          	lw	s6,8(s8)
8040c888:	95dfd06f          	j	8040a1e4 <stride_dequeue+0x3cc>
8040c88c:	0088a503          	lw	a0,8(a7)
8040c890:	00098593          	mv	a1,s3
8040c894:	0048ab03          	lw	s6,4(a7)
8040c898:	01012c23          	sw	a6,24(sp)
8040c89c:	01112a23          	sw	a7,20(sp)
8040c8a0:	aa0fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c8a4:	01412883          	lw	a7,20(sp)
8040c8a8:	01812803          	lw	a6,24(sp)
8040c8ac:	00a8a223          	sw	a0,4(a7)
8040c8b0:	0168a423          	sw	s6,8(a7)
8040c8b4:	96050ee3          	beqz	a0,8040c230 <stride_dequeue+0x2418>
8040c8b8:	01152023          	sw	a7,0(a0)
8040c8bc:	00088993          	mv	s3,a7
8040c8c0:	008c2b03          	lw	s6,8(s8)
8040c8c4:	f3cfe06f          	j	8040b000 <stride_dequeue+0x11e8>
8040c8c8:	000a0993          	mv	s3,s4
8040c8cc:	df5fd06f          	j	8040a6c0 <stride_dequeue+0x8a8>
8040c8d0:	00009697          	auipc	a3,0x9
8040c8d4:	d3868693          	addi	a3,a3,-712 # 80415608 <CSWTCH.69+0x8b0>
8040c8d8:	00007617          	auipc	a2,0x7
8040c8dc:	f0860613          	addi	a2,a2,-248 # 804137e0 <commands+0x1bc>
8040c8e0:	06300593          	li	a1,99
8040c8e4:	00009517          	auipc	a0,0x9
8040c8e8:	d4850513          	addi	a0,a0,-696 # 8041562c <CSWTCH.69+0x8d4>
8040c8ec:	d39f30ef          	jal	ra,80400624 <__panic>
8040c8f0:	000c8993          	mv	s3,s9
8040c8f4:	c6dfd06f          	j	8040a560 <stride_dequeue+0x748>
8040c8f8:	00088993          	mv	s3,a7
8040c8fc:	d28fe06f          	j	8040ae24 <stride_dequeue+0x100c>
8040c900:	00088993          	mv	s3,a7
8040c904:	becfe06f          	j	8040acf0 <stride_dequeue+0xed8>
8040c908:	00060993          	mv	s3,a2
8040c90c:	f1dfd06f          	j	8040a828 <stride_dequeue+0xa10>
8040c910:	00088993          	mv	s3,a7
8040c914:	e20fe06f          	j	8040af34 <stride_dequeue+0x111c>
8040c918:	0089a503          	lw	a0,8(s3)
8040c91c:	0049ab03          	lw	s6,4(s3)
8040c920:	00040593          	mv	a1,s0
8040c924:	a1cfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c928:	00a9a223          	sw	a0,4(s3)
8040c92c:	0169a423          	sw	s6,8(s3)
8040c930:	00050463          	beqz	a0,8040c938 <stride_dequeue+0x2b20>
8040c934:	01352023          	sw	s3,0(a0)
8040c938:	008c2b03          	lw	s6,8(s8)
8040c93c:	ef1fe06f          	j	8040b82c <stride_dequeue+0x1a14>
8040c940:	0089a503          	lw	a0,8(s3)
8040c944:	0049ab03          	lw	s6,4(s3)
8040c948:	00030593          	mv	a1,t1
8040c94c:	01012a23          	sw	a6,20(sp)
8040c950:	9f0fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c954:	00a9a223          	sw	a0,4(s3)
8040c958:	0169a423          	sw	s6,8(s3)
8040c95c:	01412803          	lw	a6,20(sp)
8040c960:	300508e3          	beqz	a0,8040d470 <stride_dequeue+0x3658>
8040c964:	01352023          	sw	s3,0(a0)
8040c968:	00098313          	mv	t1,s3
8040c96c:	008c2b03          	lw	s6,8(s8)
8040c970:	db4ff06f          	j	8040bf24 <stride_dequeue+0x210c>
8040c974:	0088a503          	lw	a0,8(a7)
8040c978:	000e0593          	mv	a1,t3
8040c97c:	0048ab03          	lw	s6,4(a7)
8040c980:	01112a23          	sw	a7,20(sp)
8040c984:	9bcfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c988:	01412883          	lw	a7,20(sp)
8040c98c:	00a8a223          	sw	a0,4(a7)
8040c990:	0168a423          	sw	s6,8(a7)
8040c994:	00050463          	beqz	a0,8040c99c <stride_dequeue+0x2b84>
8040c998:	01152023          	sw	a7,0(a0)
8040c99c:	008c2b03          	lw	s6,8(s8)
8040c9a0:	d84fe06f          	j	8040af24 <stride_dequeue+0x110c>
8040c9a4:	0089a503          	lw	a0,8(s3)
8040c9a8:	0049ab03          	lw	s6,4(s3)
8040c9ac:	00080593          	mv	a1,a6
8040c9b0:	01112a23          	sw	a7,20(sp)
8040c9b4:	98cfd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c9b8:	00a9a223          	sw	a0,4(s3)
8040c9bc:	0169a423          	sw	s6,8(s3)
8040c9c0:	01412883          	lw	a7,20(sp)
8040c9c4:	300506e3          	beqz	a0,8040d4d0 <stride_dequeue+0x36b8>
8040c9c8:	01352023          	sw	s3,0(a0)
8040c9cc:	00098813          	mv	a6,s3
8040c9d0:	008c2b03          	lw	s6,8(s8)
8040c9d4:	c34ff06f          	j	8040be08 <stride_dequeue+0x1ff0>
8040c9d8:	0089a503          	lw	a0,8(s3)
8040c9dc:	0049ab03          	lw	s6,4(s3)
8040c9e0:	00060593          	mv	a1,a2
8040c9e4:	01112623          	sw	a7,12(sp)
8040c9e8:	958fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040c9ec:	00a9a223          	sw	a0,4(s3)
8040c9f0:	0169a423          	sw	s6,8(s3)
8040c9f4:	00c12883          	lw	a7,12(sp)
8040c9f8:	00050463          	beqz	a0,8040ca00 <stride_dequeue+0x2be8>
8040c9fc:	01352023          	sw	s3,0(a0)
8040ca00:	008c2b03          	lw	s6,8(s8)
8040ca04:	a90ff06f          	j	8040bc94 <stride_dequeue+0x1e7c>
8040ca08:	0089a503          	lw	a0,8(s3)
8040ca0c:	0049ab03          	lw	s6,4(s3)
8040ca10:	000a0593          	mv	a1,s4
8040ca14:	01112823          	sw	a7,16(sp)
8040ca18:	928fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ca1c:	00a9a223          	sw	a0,4(s3)
8040ca20:	0169a423          	sw	s6,8(s3)
8040ca24:	01012883          	lw	a7,16(sp)
8040ca28:	00050463          	beqz	a0,8040ca30 <stride_dequeue+0x2c18>
8040ca2c:	01352023          	sw	s3,0(a0)
8040ca30:	008c2b03          	lw	s6,8(s8)
8040ca34:	fb9fe06f          	j	8040b9ec <stride_dequeue+0x1bd4>
8040ca38:	0089a503          	lw	a0,8(s3)
8040ca3c:	0049ab03          	lw	s6,4(s3)
8040ca40:	000e0593          	mv	a1,t3
8040ca44:	01012a23          	sw	a6,20(sp)
8040ca48:	00c12823          	sw	a2,16(sp)
8040ca4c:	8f4fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ca50:	00a9a223          	sw	a0,4(s3)
8040ca54:	0169a423          	sw	s6,8(s3)
8040ca58:	01012603          	lw	a2,16(sp)
8040ca5c:	01412803          	lw	a6,20(sp)
8040ca60:	00050463          	beqz	a0,8040ca68 <stride_dequeue+0x2c50>
8040ca64:	01352023          	sw	s3,0(a0)
8040ca68:	008c2b03          	lw	s6,8(s8)
8040ca6c:	c65fe06f          	j	8040b6d0 <stride_dequeue+0x18b8>
8040ca70:	0089a503          	lw	a0,8(s3)
8040ca74:	0049ab03          	lw	s6,4(s3)
8040ca78:	00080593          	mv	a1,a6
8040ca7c:	8c4fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ca80:	00a9a223          	sw	a0,4(s3)
8040ca84:	0169a423          	sw	s6,8(s3)
8040ca88:	00050463          	beqz	a0,8040ca90 <stride_dequeue+0x2c78>
8040ca8c:	01352023          	sw	s3,0(a0)
8040ca90:	008c2b03          	lw	s6,8(s8)
8040ca94:	914ff06f          	j	8040bba8 <stride_dequeue+0x1d90>
8040ca98:	0089a503          	lw	a0,8(s3)
8040ca9c:	0049ab03          	lw	s6,4(s3)
8040caa0:	000e0593          	mv	a1,t3
8040caa4:	01012a23          	sw	a6,20(sp)
8040caa8:	898fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040caac:	00a9a223          	sw	a0,4(s3)
8040cab0:	0169a423          	sw	s6,8(s3)
8040cab4:	01412803          	lw	a6,20(sp)
8040cab8:	00050463          	beqz	a0,8040cac0 <stride_dequeue+0x2ca8>
8040cabc:	01352023          	sw	s3,0(a0)
8040cac0:	008c2b03          	lw	s6,8(s8)
8040cac4:	b21fe06f          	j	8040b5e4 <stride_dequeue+0x17cc>
8040cac8:	0089a503          	lw	a0,8(s3)
8040cacc:	0049ab03          	lw	s6,4(s3)
8040cad0:	00080593          	mv	a1,a6
8040cad4:	00c12623          	sw	a2,12(sp)
8040cad8:	868fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cadc:	00a9a223          	sw	a0,4(s3)
8040cae0:	0169a423          	sw	s6,8(s3)
8040cae4:	00c12603          	lw	a2,12(sp)
8040cae8:	00050463          	beqz	a0,8040caf0 <stride_dequeue+0x2cd8>
8040caec:	01352023          	sw	s3,0(a0)
8040caf0:	008c2b03          	lw	s6,8(s8)
8040caf4:	a94ff06f          	j	8040bd88 <stride_dequeue+0x1f70>
8040caf8:	0088a503          	lw	a0,8(a7)
8040cafc:	000e0593          	mv	a1,t3
8040cb00:	0048ab03          	lw	s6,4(a7)
8040cb04:	01112823          	sw	a7,16(sp)
8040cb08:	838fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cb0c:	01012883          	lw	a7,16(sp)
8040cb10:	01412603          	lw	a2,20(sp)
8040cb14:	00a8a223          	sw	a0,4(a7)
8040cb18:	0168a423          	sw	s6,8(a7)
8040cb1c:	00050463          	beqz	a0,8040cb24 <stride_dequeue+0x2d0c>
8040cb20:	01152023          	sw	a7,0(a0)
8040cb24:	008c2b03          	lw	s6,8(s8)
8040cb28:	aecfe06f          	j	8040ae14 <stride_dequeue+0xffc>
8040cb2c:	0089a503          	lw	a0,8(s3)
8040cb30:	0049ab03          	lw	s6,4(s3)
8040cb34:	00088593          	mv	a1,a7
8040cb38:	808fd0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cb3c:	00a9a223          	sw	a0,4(s3)
8040cb40:	0169a423          	sw	s6,8(s3)
8040cb44:	00050463          	beqz	a0,8040cb4c <stride_dequeue+0x2d34>
8040cb48:	01352023          	sw	s3,0(a0)
8040cb4c:	008c2b03          	lw	s6,8(s8)
8040cb50:	811fe06f          	j	8040b360 <stride_dequeue+0x1548>
8040cb54:	0089a503          	lw	a0,8(s3)
8040cb58:	0049ab03          	lw	s6,4(s3)
8040cb5c:	00088593          	mv	a1,a7
8040cb60:	fe1fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cb64:	00a9a223          	sw	a0,4(s3)
8040cb68:	0169a423          	sw	s6,8(s3)
8040cb6c:	00050463          	beqz	a0,8040cb74 <stride_dequeue+0x2d5c>
8040cb70:	01352023          	sw	s3,0(a0)
8040cb74:	008c2b03          	lw	s6,8(s8)
8040cb78:	ed4fe06f          	j	8040b24c <stride_dequeue+0x1434>
8040cb7c:	00862503          	lw	a0,8(a2)
8040cb80:	000e0593          	mv	a1,t3
8040cb84:	00462b03          	lw	s6,4(a2)
8040cb88:	fb9fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cb8c:	01012603          	lw	a2,16(sp)
8040cb90:	01412803          	lw	a6,20(sp)
8040cb94:	00a62223          	sw	a0,4(a2)
8040cb98:	01662423          	sw	s6,8(a2)
8040cb9c:	00050463          	beqz	a0,8040cba4 <stride_dequeue+0x2d8c>
8040cba0:	00c52023          	sw	a2,0(a0)
8040cba4:	008c2b03          	lw	s6,8(s8)
8040cba8:	c71fd06f          	j	8040a818 <stride_dequeue+0xa00>
8040cbac:	00040993          	mv	s3,s0
8040cbb0:	c7dfe06f          	j	8040b82c <stride_dequeue+0x1a14>
8040cbb4:	008ca503          	lw	a0,8(s9)
8040cbb8:	004cab03          	lw	s6,4(s9)
8040cbbc:	000e0593          	mv	a1,t3
8040cbc0:	01012a23          	sw	a6,20(sp)
8040cbc4:	f7dfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cbc8:	00aca223          	sw	a0,4(s9)
8040cbcc:	016ca423          	sw	s6,8(s9)
8040cbd0:	01412803          	lw	a6,20(sp)
8040cbd4:	00050463          	beqz	a0,8040cbdc <stride_dequeue+0x2dc4>
8040cbd8:	01952023          	sw	s9,0(a0)
8040cbdc:	008c2b03          	lw	s6,8(s8)
8040cbe0:	971fd06f          	j	8040a550 <stride_dequeue+0x738>
8040cbe4:	0089a503          	lw	a0,8(s3)
8040cbe8:	0049ab03          	lw	s6,4(s3)
8040cbec:	00080593          	mv	a1,a6
8040cbf0:	f51fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cbf4:	00a9a223          	sw	a0,4(s3)
8040cbf8:	0169a423          	sw	s6,8(s3)
8040cbfc:	00050463          	beqz	a0,8040cc04 <stride_dequeue+0x2dec>
8040cc00:	01352023          	sw	s3,0(a0)
8040cc04:	008c2b03          	lw	s6,8(s8)
8040cc08:	ec5fe06f          	j	8040bacc <stride_dequeue+0x1cb4>
8040cc0c:	008a2503          	lw	a0,8(s4)
8040cc10:	004a2b03          	lw	s6,4(s4)
8040cc14:	000e0593          	mv	a1,t3
8040cc18:	01012a23          	sw	a6,20(sp)
8040cc1c:	f25fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cc20:	00aa2223          	sw	a0,4(s4)
8040cc24:	016a2423          	sw	s6,8(s4)
8040cc28:	01412803          	lw	a6,20(sp)
8040cc2c:	00050463          	beqz	a0,8040cc34 <stride_dequeue+0x2e1c>
8040cc30:	01452023          	sw	s4,0(a0)
8040cc34:	008c2b03          	lw	s6,8(s8)
8040cc38:	a79fd06f          	j	8040a6b0 <stride_dequeue+0x898>
8040cc3c:	0089a503          	lw	a0,8(s3)
8040cc40:	0049ab03          	lw	s6,4(s3)
8040cc44:	00030593          	mv	a1,t1
8040cc48:	01012a23          	sw	a6,20(sp)
8040cc4c:	00c12823          	sw	a2,16(sp)
8040cc50:	ef1fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cc54:	00a9a223          	sw	a0,4(s3)
8040cc58:	0169a423          	sw	s6,8(s3)
8040cc5c:	01012603          	lw	a2,16(sp)
8040cc60:	01412803          	lw	a6,20(sp)
8040cc64:	06050ce3          	beqz	a0,8040d4dc <stride_dequeue+0x36c4>
8040cc68:	01352023          	sw	s3,0(a0)
8040cc6c:	00098313          	mv	t1,s3
8040cc70:	008c2b03          	lw	s6,8(s8)
8040cc74:	a2cff06f          	j	8040bea0 <stride_dequeue+0x2088>
8040cc78:	0089a503          	lw	a0,8(s3)
8040cc7c:	0049ab03          	lw	s6,4(s3)
8040cc80:	000e0593          	mv	a1,t3
8040cc84:	01012a23          	sw	a6,20(sp)
8040cc88:	eb9fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cc8c:	00a9a223          	sw	a0,4(s3)
8040cc90:	0169a423          	sw	s6,8(s3)
8040cc94:	01412803          	lw	a6,20(sp)
8040cc98:	00050463          	beqz	a0,8040cca0 <stride_dequeue+0x2e88>
8040cc9c:	01352023          	sw	s3,0(a0)
8040cca0:	008c2b03          	lw	s6,8(s8)
8040cca4:	86dfe06f          	j	8040b510 <stride_dequeue+0x16f8>
8040cca8:	0089a503          	lw	a0,8(s3)
8040ccac:	0049ab03          	lw	s6,4(s3)
8040ccb0:	00030593          	mv	a1,t1
8040ccb4:	01012a23          	sw	a6,20(sp)
8040ccb8:	e89fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ccbc:	00a9a223          	sw	a0,4(s3)
8040ccc0:	0169a423          	sw	s6,8(s3)
8040ccc4:	01412803          	lw	a6,20(sp)
8040ccc8:	76050663          	beqz	a0,8040d434 <stride_dequeue+0x361c>
8040cccc:	01352023          	sw	s3,0(a0)
8040ccd0:	00098313          	mv	t1,s3
8040ccd4:	008c2b03          	lw	s6,8(s8)
8040ccd8:	ad0ff06f          	j	8040bfa8 <stride_dequeue+0x2190>
8040ccdc:	0089a503          	lw	a0,8(s3)
8040cce0:	0049ab03          	lw	s6,4(s3)
8040cce4:	000e0593          	mv	a1,t3
8040cce8:	01112a23          	sw	a7,20(sp)
8040ccec:	e55fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ccf0:	00a9a223          	sw	a0,4(s3)
8040ccf4:	0169a423          	sw	s6,8(s3)
8040ccf8:	01412883          	lw	a7,20(sp)
8040ccfc:	00050463          	beqz	a0,8040cd04 <stride_dequeue+0x2eec>
8040cd00:	01352023          	sw	s3,0(a0)
8040cd04:	008c2b03          	lw	s6,8(s8)
8040cd08:	f30fe06f          	j	8040b438 <stride_dequeue+0x1620>
8040cd0c:	008a2503          	lw	a0,8(s4)
8040cd10:	004a2b03          	lw	s6,4(s4)
8040cd14:	00030593          	mv	a1,t1
8040cd18:	e29fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cd1c:	00aa2223          	sw	a0,4(s4)
8040cd20:	016a2423          	sw	s6,8(s4)
8040cd24:	00050463          	beqz	a0,8040cd2c <stride_dequeue+0x2f14>
8040cd28:	01452023          	sw	s4,0(a0)
8040cd2c:	008c2b03          	lw	s6,8(s8)
8040cd30:	e9dfd06f          	j	8040abcc <stride_dequeue+0xdb4>
8040cd34:	0089a503          	lw	a0,8(s3)
8040cd38:	0049ab03          	lw	s6,4(s3)
8040cd3c:	00088593          	mv	a1,a7
8040cd40:	00c12623          	sw	a2,12(sp)
8040cd44:	dfdfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cd48:	00a9a223          	sw	a0,4(s3)
8040cd4c:	0169a423          	sw	s6,8(s3)
8040cd50:	00c12603          	lw	a2,12(sp)
8040cd54:	00050463          	beqz	a0,8040cd5c <stride_dequeue+0x2f44>
8040cd58:	01352023          	sw	s3,0(a0)
8040cd5c:	008c2b03          	lw	s6,8(s8)
8040cd60:	bd4fe06f          	j	8040b134 <stride_dequeue+0x131c>
8040cd64:	0088a503          	lw	a0,8(a7)
8040cd68:	000e0593          	mv	a1,t3
8040cd6c:	0048ab03          	lw	s6,4(a7)
8040cd70:	01112a23          	sw	a7,20(sp)
8040cd74:	dcdfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cd78:	01412883          	lw	a7,20(sp)
8040cd7c:	00a8a223          	sw	a0,4(a7)
8040cd80:	0168a423          	sw	s6,8(a7)
8040cd84:	00050463          	beqz	a0,8040cd8c <stride_dequeue+0x2f74>
8040cd88:	01152023          	sw	a7,0(a0)
8040cd8c:	008c2b03          	lw	s6,8(s8)
8040cd90:	f51fd06f          	j	8040ace0 <stride_dequeue+0xec8>
8040cd94:	0089a503          	lw	a0,8(s3)
8040cd98:	0049ab03          	lw	s6,4(s3)
8040cd9c:	00030593          	mv	a1,t1
8040cda0:	01112a23          	sw	a7,20(sp)
8040cda4:	d9dfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cda8:	00a9a223          	sw	a0,4(s3)
8040cdac:	0169a423          	sw	s6,8(s3)
8040cdb0:	01412883          	lw	a7,20(sp)
8040cdb4:	5e050863          	beqz	a0,8040d3a4 <stride_dequeue+0x358c>
8040cdb8:	01352023          	sw	s3,0(a0)
8040cdbc:	00098313          	mv	t1,s3
8040cdc0:	008c2b03          	lw	s6,8(s8)
8040cdc4:	a64ff06f          	j	8040c028 <stride_dequeue+0x2210>
8040cdc8:	0089a503          	lw	a0,8(s3)
8040cdcc:	0049ab03          	lw	s6,4(s3)
8040cdd0:	000d8593          	mv	a1,s11
8040cdd4:	01112823          	sw	a7,16(sp)
8040cdd8:	d69fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cddc:	00a9a223          	sw	a0,4(s3)
8040cde0:	0169a423          	sw	s6,8(s3)
8040cde4:	01012883          	lw	a7,16(sp)
8040cde8:	00050463          	beqz	a0,8040cdf0 <stride_dequeue+0x2fd8>
8040cdec:	01352023          	sw	s3,0(a0)
8040cdf0:	008c2b03          	lw	s6,8(s8)
8040cdf4:	b19fe06f          	j	8040b90c <stride_dequeue+0x1af4>
8040cdf8:	00080993          	mv	s3,a6
8040cdfc:	cd1fe06f          	j	8040bacc <stride_dequeue+0x1cb4>
8040ce00:	000d8993          	mv	s3,s11
8040ce04:	b09fe06f          	j	8040b90c <stride_dequeue+0x1af4>
8040ce08:	00080993          	mv	s3,a6
8040ce0c:	d9dfe06f          	j	8040bba8 <stride_dequeue+0x1d90>
8040ce10:	00080993          	mv	s3,a6
8040ce14:	f75fe06f          	j	8040bd88 <stride_dequeue+0x1f70>
8040ce18:	00060993          	mv	s3,a2
8040ce1c:	e79fe06f          	j	8040bc94 <stride_dequeue+0x1e7c>
8040ce20:	000a0993          	mv	s3,s4
8040ce24:	bc9fe06f          	j	8040b9ec <stride_dequeue+0x1bd4>
8040ce28:	008c2b03          	lw	s6,8(s8)
8040ce2c:	000e0c93          	mv	s9,t3
8040ce30:	f20fd06f          	j	8040a550 <stride_dequeue+0x738>
8040ce34:	008c2b03          	lw	s6,8(s8)
8040ce38:	000e0613          	mv	a2,t3
8040ce3c:	9ddfd06f          	j	8040a818 <stride_dequeue+0xa00>
8040ce40:	0087a503          	lw	a0,8(a5)
8040ce44:	00098593          	mv	a1,s3
8040ce48:	0047ab03          	lw	s6,4(a5)
8040ce4c:	cf5fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ce50:	01012783          	lw	a5,16(sp)
8040ce54:	00a7a223          	sw	a0,4(a5)
8040ce58:	0167a423          	sw	s6,8(a5)
8040ce5c:	68050663          	beqz	a0,8040d4e8 <stride_dequeue+0x36d0>
8040ce60:	00f52023          	sw	a5,0(a0)
8040ce64:	00078993          	mv	s3,a5
8040ce68:	008c2b03          	lw	s6,8(s8)
8040ce6c:	ad4ff06f          	j	8040c140 <stride_dequeue+0x2328>
8040ce70:	008c2b03          	lw	s6,8(s8)
8040ce74:	000e0a13          	mv	s4,t3
8040ce78:	839fd06f          	j	8040a6b0 <stride_dequeue+0x898>
8040ce7c:	008c2b03          	lw	s6,8(s8)
8040ce80:	000e0993          	mv	s3,t3
8040ce84:	f60fe06f          	j	8040b5e4 <stride_dequeue+0x17cc>
8040ce88:	008c2b03          	lw	s6,8(s8)
8040ce8c:	00098793          	mv	a5,s3
8040ce90:	8d9fe06f          	j	8040b768 <stride_dequeue+0x1950>
8040ce94:	008c2b03          	lw	s6,8(s8)
8040ce98:	000e0993          	mv	s3,t3
8040ce9c:	e74fe06f          	j	8040b510 <stride_dequeue+0x16f8>
8040cea0:	0089a503          	lw	a0,8(s3)
8040cea4:	0049ab03          	lw	s6,4(s3)
8040cea8:	00088593          	mv	a1,a7
8040ceac:	c95fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040ceb0:	00a9a223          	sw	a0,4(s3)
8040ceb4:	0169a423          	sw	s6,8(s3)
8040ceb8:	00050463          	beqz	a0,8040cec0 <stride_dequeue+0x30a8>
8040cebc:	01352023          	sw	s3,0(a0)
8040cec0:	008c2b03          	lw	s6,8(s8)
8040cec4:	955fe06f          	j	8040b818 <stride_dequeue+0x1a00>
8040cec8:	008c2b03          	lw	s6,8(s8)
8040cecc:	000e0893          	mv	a7,t3
8040ced0:	854fe06f          	j	8040af24 <stride_dequeue+0x110c>
8040ced4:	0087a503          	lw	a0,8(a5)
8040ced8:	000a0593          	mv	a1,s4
8040cedc:	0047ab03          	lw	s6,4(a5)
8040cee0:	c61fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cee4:	00c12783          	lw	a5,12(sp)
8040cee8:	01012603          	lw	a2,16(sp)
8040ceec:	00a7a223          	sw	a0,4(a5)
8040cef0:	0167a423          	sw	s6,8(a5)
8040cef4:	52050a63          	beqz	a0,8040d428 <stride_dequeue+0x3610>
8040cef8:	00f52023          	sw	a5,0(a0)
8040cefc:	00078a13          	mv	s4,a5
8040cf00:	008c2b03          	lw	s6,8(s8)
8040cf04:	9d0ff06f          	j	8040c0d4 <stride_dequeue+0x22bc>
8040cf08:	008c2b03          	lw	s6,8(s8)
8040cf0c:	000e0893          	mv	a7,t3
8040cf10:	dd1fd06f          	j	8040ace0 <stride_dequeue+0xec8>
8040cf14:	008c2b03          	lw	s6,8(s8)
8040cf18:	000e0993          	mv	s3,t3
8040cf1c:	d1cfe06f          	j	8040b438 <stride_dequeue+0x1620>
8040cf20:	008c2b03          	lw	s6,8(s8)
8040cf24:	000e0993          	mv	s3,t3
8040cf28:	fa8fe06f          	j	8040b6d0 <stride_dequeue+0x18b8>
8040cf2c:	008c2b03          	lw	s6,8(s8)
8040cf30:	000e0893          	mv	a7,t3
8040cf34:	ee1fd06f          	j	8040ae14 <stride_dequeue+0xffc>
8040cf38:	0087a503          	lw	a0,8(a5)
8040cf3c:	000c8593          	mv	a1,s9
8040cf40:	0047ab03          	lw	s6,4(a5)
8040cf44:	bfdfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cf48:	01012783          	lw	a5,16(sp)
8040cf4c:	00a7a223          	sw	a0,4(a5)
8040cf50:	0167a423          	sw	s6,8(a5)
8040cf54:	44050e63          	beqz	a0,8040d3b0 <stride_dequeue+0x3598>
8040cf58:	00f52023          	sw	a5,0(a0)
8040cf5c:	00078c93          	mv	s9,a5
8040cf60:	008c2b03          	lw	s6,8(s8)
8040cf64:	ab4ff06f          	j	8040c218 <stride_dequeue+0x2400>
8040cf68:	0087a503          	lw	a0,8(a5)
8040cf6c:	000a0593          	mv	a1,s4
8040cf70:	0047ab03          	lw	s6,4(a5)
8040cf74:	bcdfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cf78:	01012783          	lw	a5,16(sp)
8040cf7c:	00a7a223          	sw	a0,4(a5)
8040cf80:	0167a423          	sw	s6,8(a5)
8040cf84:	52050463          	beqz	a0,8040d4ac <stride_dequeue+0x3694>
8040cf88:	00f52023          	sw	a5,0(a0)
8040cf8c:	00078a13          	mv	s4,a5
8040cf90:	008c2b03          	lw	s6,8(s8)
8040cf94:	a18ff06f          	j	8040c1ac <stride_dequeue+0x2394>
8040cf98:	008c2b03          	lw	s6,8(s8)
8040cf9c:	00088993          	mv	s3,a7
8040cfa0:	879fe06f          	j	8040b818 <stride_dequeue+0x1a00>
8040cfa4:	0089a503          	lw	a0,8(s3)
8040cfa8:	0049ab03          	lw	s6,4(s3)
8040cfac:	000e0593          	mv	a1,t3
8040cfb0:	01012a23          	sw	a6,20(sp)
8040cfb4:	b8dfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cfb8:	00a9a223          	sw	a0,4(s3)
8040cfbc:	0169a423          	sw	s6,8(s3)
8040cfc0:	01412803          	lw	a6,20(sp)
8040cfc4:	00050463          	beqz	a0,8040cfcc <stride_dequeue+0x31b4>
8040cfc8:	01352023          	sw	s3,0(a0)
8040cfcc:	008c2b03          	lw	s6,8(s8)
8040cfd0:	bc5fe06f          	j	8040bb94 <stride_dequeue+0x1d7c>
8040cfd4:	00882503          	lw	a0,8(a6)
8040cfd8:	00098593          	mv	a1,s3
8040cfdc:	00482b03          	lw	s6,4(a6)
8040cfe0:	b61fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040cfe4:	01412803          	lw	a6,20(sp)
8040cfe8:	01812883          	lw	a7,24(sp)
8040cfec:	00a82223          	sw	a0,4(a6)
8040cff0:	01682423          	sw	s6,8(a6)
8040cff4:	4a050063          	beqz	a0,8040d494 <stride_dequeue+0x367c>
8040cff8:	01052023          	sw	a6,0(a0)
8040cffc:	00080993          	mv	s3,a6
8040d000:	008c2b03          	lw	s6,8(s8)
8040d004:	a9cff06f          	j	8040c2a0 <stride_dequeue+0x2488>
8040d008:	0089a503          	lw	a0,8(s3)
8040d00c:	0049ab03          	lw	s6,4(s3)
8040d010:	000e0593          	mv	a1,t3
8040d014:	01112a23          	sw	a7,20(sp)
8040d018:	00c12823          	sw	a2,16(sp)
8040d01c:	b25fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d020:	00a9a223          	sw	a0,4(s3)
8040d024:	0169a423          	sw	s6,8(s3)
8040d028:	01012603          	lw	a2,16(sp)
8040d02c:	01412883          	lw	a7,20(sp)
8040d030:	00050463          	beqz	a0,8040d038 <stride_dequeue+0x3220>
8040d034:	01352023          	sw	s3,0(a0)
8040d038:	008c2b03          	lw	s6,8(s8)
8040d03c:	c45fe06f          	j	8040bc80 <stride_dequeue+0x1e68>
8040d040:	0088a503          	lw	a0,8(a7)
8040d044:	00098593          	mv	a1,s3
8040d048:	0048ab03          	lw	s6,4(a7)
8040d04c:	af5fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d050:	01012883          	lw	a7,16(sp)
8040d054:	01412603          	lw	a2,20(sp)
8040d058:	01812803          	lw	a6,24(sp)
8040d05c:	00a8a223          	sw	a0,4(a7)
8040d060:	0168a423          	sw	s6,8(a7)
8040d064:	48050863          	beqz	a0,8040d4f4 <stride_dequeue+0x36dc>
8040d068:	01152023          	sw	a7,0(a0)
8040d06c:	00088993          	mv	s3,a7
8040d070:	008c2b03          	lw	s6,8(s8)
8040d074:	bc0ff06f          	j	8040c434 <stride_dequeue+0x261c>
8040d078:	00832503          	lw	a0,8(t1)
8040d07c:	000c8593          	mv	a1,s9
8040d080:	00432b03          	lw	s6,4(t1)
8040d084:	abdfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d088:	01412303          	lw	t1,20(sp)
8040d08c:	01812883          	lw	a7,24(sp)
8040d090:	00a32223          	sw	a0,4(t1)
8040d094:	01632423          	sw	s6,8(t1)
8040d098:	36050663          	beqz	a0,8040d404 <stride_dequeue+0x35ec>
8040d09c:	00652023          	sw	t1,0(a0)
8040d0a0:	00030c93          	mv	s9,t1
8040d0a4:	008c2b03          	lw	s6,8(s8)
8040d0a8:	e10ff06f          	j	8040c6b8 <stride_dequeue+0x28a0>
8040d0ac:	0089a503          	lw	a0,8(s3)
8040d0b0:	0049ab03          	lw	s6,4(s3)
8040d0b4:	000e0593          	mv	a1,t3
8040d0b8:	01112a23          	sw	a7,20(sp)
8040d0bc:	00c12823          	sw	a2,16(sp)
8040d0c0:	a81fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d0c4:	00a9a223          	sw	a0,4(s3)
8040d0c8:	0169a423          	sw	s6,8(s3)
8040d0cc:	01012603          	lw	a2,16(sp)
8040d0d0:	01412883          	lw	a7,20(sp)
8040d0d4:	00050463          	beqz	a0,8040d0dc <stride_dequeue+0x32c4>
8040d0d8:	01352023          	sw	s3,0(a0)
8040d0dc:	008c2b03          	lw	s6,8(s8)
8040d0e0:	840fe06f          	j	8040b120 <stride_dequeue+0x1308>
8040d0e4:	0089a503          	lw	a0,8(s3)
8040d0e8:	0049ab03          	lw	s6,4(s3)
8040d0ec:	000e0593          	mv	a1,t3
8040d0f0:	01012a23          	sw	a6,20(sp)
8040d0f4:	00c12823          	sw	a2,16(sp)
8040d0f8:	a49fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d0fc:	00a9a223          	sw	a0,4(s3)
8040d100:	0169a423          	sw	s6,8(s3)
8040d104:	01012603          	lw	a2,16(sp)
8040d108:	01412803          	lw	a6,20(sp)
8040d10c:	00050463          	beqz	a0,8040d114 <stride_dequeue+0x32fc>
8040d110:	01352023          	sw	s3,0(a0)
8040d114:	008c2b03          	lw	s6,8(s8)
8040d118:	c5dfe06f          	j	8040bd74 <stride_dequeue+0x1f5c>
8040d11c:	00832503          	lw	a0,8(t1)
8040d120:	00080593          	mv	a1,a6
8040d124:	00432b03          	lw	s6,4(t1)
8040d128:	a19fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d12c:	01412303          	lw	t1,20(sp)
8040d130:	00a32223          	sw	a0,4(t1)
8040d134:	01632423          	sw	s6,8(t1)
8040d138:	2e050263          	beqz	a0,8040d41c <stride_dequeue+0x3604>
8040d13c:	00652023          	sw	t1,0(a0)
8040d140:	00030813          	mv	a6,t1
8040d144:	008c2b03          	lw	s6,8(s8)
8040d148:	bf0ff06f          	j	8040c538 <stride_dequeue+0x2720>
8040d14c:	00832503          	lw	a0,8(t1)
8040d150:	00080593          	mv	a1,a6
8040d154:	00432b03          	lw	s6,4(t1)
8040d158:	9e9fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d15c:	01412303          	lw	t1,20(sp)
8040d160:	00a32223          	sw	a0,4(t1)
8040d164:	01632423          	sw	s6,8(t1)
8040d168:	2e050263          	beqz	a0,8040d44c <stride_dequeue+0x3634>
8040d16c:	00652023          	sw	t1,0(a0)
8040d170:	00030813          	mv	a6,t1
8040d174:	008c2b03          	lw	s6,8(s8)
8040d178:	b38ff06f          	j	8040c4b0 <stride_dequeue+0x2698>
8040d17c:	00882503          	lw	a0,8(a6)
8040d180:	00098593          	mv	a1,s3
8040d184:	00482b03          	lw	s6,4(a6)
8040d188:	9b9fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d18c:	01412803          	lw	a6,20(sp)
8040d190:	01812883          	lw	a7,24(sp)
8040d194:	00a82223          	sw	a0,4(a6)
8040d198:	01682423          	sw	s6,8(a6)
8040d19c:	22050663          	beqz	a0,8040d3c8 <stride_dequeue+0x35b0>
8040d1a0:	01052023          	sw	a6,0(a0)
8040d1a4:	00080993          	mv	s3,a6
8040d1a8:	008c2b03          	lw	s6,8(s8)
8040d1ac:	970ff06f          	j	8040c31c <stride_dequeue+0x2504>
8040d1b0:	00832503          	lw	a0,8(t1)
8040d1b4:	00080593          	mv	a1,a6
8040d1b8:	00432b03          	lw	s6,4(t1)
8040d1bc:	985fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d1c0:	01012303          	lw	t1,16(sp)
8040d1c4:	01412603          	lw	a2,20(sp)
8040d1c8:	00a32223          	sw	a0,4(t1)
8040d1cc:	01632423          	sw	s6,8(t1)
8040d1d0:	2e050a63          	beqz	a0,8040d4c4 <stride_dequeue+0x36ac>
8040d1d4:	00652023          	sw	t1,0(a0)
8040d1d8:	00030813          	mv	a6,t1
8040d1dc:	008c2b03          	lw	s6,8(s8)
8040d1e0:	d70ff06f          	j	8040c750 <stride_dequeue+0x2938>
8040d1e4:	008a2503          	lw	a0,8(s4)
8040d1e8:	004a2b03          	lw	s6,4(s4)
8040d1ec:	000e0593          	mv	a1,t3
8040d1f0:	00612a23          	sw	t1,20(sp)
8040d1f4:	94dfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d1f8:	00aa2223          	sw	a0,4(s4)
8040d1fc:	016a2423          	sw	s6,8(s4)
8040d200:	01412303          	lw	t1,20(sp)
8040d204:	00050463          	beqz	a0,8040d20c <stride_dequeue+0x33f4>
8040d208:	01452023          	sw	s4,0(a0)
8040d20c:	008c2b03          	lw	s6,8(s8)
8040d210:	9a9fd06f          	j	8040abb8 <stride_dequeue+0xda0>
8040d214:	0089a503          	lw	a0,8(s3)
8040d218:	0049ab03          	lw	s6,4(s3)
8040d21c:	000e0593          	mv	a1,t3
8040d220:	01112a23          	sw	a7,20(sp)
8040d224:	91dfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d228:	00a9a223          	sw	a0,4(s3)
8040d22c:	0169a423          	sw	s6,8(s3)
8040d230:	01412883          	lw	a7,20(sp)
8040d234:	00050463          	beqz	a0,8040d23c <stride_dequeue+0x3424>
8040d238:	01352023          	sw	s3,0(a0)
8040d23c:	008c2b03          	lw	s6,8(s8)
8040d240:	f98fe06f          	j	8040b9d8 <stride_dequeue+0x1bc0>
8040d244:	0089a503          	lw	a0,8(s3)
8040d248:	0049ab03          	lw	s6,4(s3)
8040d24c:	000e0593          	mv	a1,t3
8040d250:	01012a23          	sw	a6,20(sp)
8040d254:	8edfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d258:	00a9a223          	sw	a0,4(s3)
8040d25c:	0169a423          	sw	s6,8(s3)
8040d260:	01412803          	lw	a6,20(sp)
8040d264:	00050463          	beqz	a0,8040d26c <stride_dequeue+0x3454>
8040d268:	01352023          	sw	s3,0(a0)
8040d26c:	008c2b03          	lw	s6,8(s8)
8040d270:	849fe06f          	j	8040bab8 <stride_dequeue+0x1ca0>
8040d274:	0089a503          	lw	a0,8(s3)
8040d278:	0049ab03          	lw	s6,4(s3)
8040d27c:	000e0593          	mv	a1,t3
8040d280:	01112a23          	sw	a7,20(sp)
8040d284:	8bdfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d288:	00a9a223          	sw	a0,4(s3)
8040d28c:	0169a423          	sw	s6,8(s3)
8040d290:	01412883          	lw	a7,20(sp)
8040d294:	00050463          	beqz	a0,8040d29c <stride_dequeue+0x3484>
8040d298:	01352023          	sw	s3,0(a0)
8040d29c:	008c2b03          	lw	s6,8(s8)
8040d2a0:	f99fd06f          	j	8040b238 <stride_dequeue+0x1420>
8040d2a4:	0088a503          	lw	a0,8(a7)
8040d2a8:	00098593          	mv	a1,s3
8040d2ac:	0048ab03          	lw	s6,4(a7)
8040d2b0:	891fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d2b4:	01412883          	lw	a7,20(sp)
8040d2b8:	01812803          	lw	a6,24(sp)
8040d2bc:	00a8a223          	sw	a0,4(a7)
8040d2c0:	0168a423          	sw	s6,8(a7)
8040d2c4:	0e050c63          	beqz	a0,8040d3bc <stride_dequeue+0x35a4>
8040d2c8:	01152023          	sw	a7,0(a0)
8040d2cc:	00088993          	mv	s3,a7
8040d2d0:	008c2b03          	lw	s6,8(s8)
8040d2d4:	ae0ff06f          	j	8040c5b4 <stride_dequeue+0x279c>
8040d2d8:	00882503          	lw	a0,8(a6)
8040d2dc:	00098593          	mv	a1,s3
8040d2e0:	00482b03          	lw	s6,4(a6)
8040d2e4:	85dfc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d2e8:	01012803          	lw	a6,16(sp)
8040d2ec:	01412603          	lw	a2,20(sp)
8040d2f0:	01812883          	lw	a7,24(sp)
8040d2f4:	00a82223          	sw	a0,4(a6)
8040d2f8:	01682423          	sw	s6,8(a6)
8040d2fc:	16050463          	beqz	a0,8040d464 <stride_dequeue+0x364c>
8040d300:	01052023          	sw	a6,0(a0)
8040d304:	00080993          	mv	s3,a6
8040d308:	008c2b03          	lw	s6,8(s8)
8040d30c:	89cff06f          	j	8040c3a8 <stride_dequeue+0x2590>
8040d310:	0089a503          	lw	a0,8(s3)
8040d314:	0049ab03          	lw	s6,4(s3)
8040d318:	000e0593          	mv	a1,t3
8040d31c:	01112a23          	sw	a7,20(sp)
8040d320:	821fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d324:	00a9a223          	sw	a0,4(s3)
8040d328:	0169a423          	sw	s6,8(s3)
8040d32c:	01412883          	lw	a7,20(sp)
8040d330:	00050463          	beqz	a0,8040d338 <stride_dequeue+0x3520>
8040d334:	01352023          	sw	s3,0(a0)
8040d338:	008c2b03          	lw	s6,8(s8)
8040d33c:	810fe06f          	j	8040b34c <stride_dequeue+0x1534>
8040d340:	0089a503          	lw	a0,8(s3)
8040d344:	0049ab03          	lw	s6,4(s3)
8040d348:	000e0593          	mv	a1,t3
8040d34c:	01112a23          	sw	a7,20(sp)
8040d350:	ff0fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d354:	00a9a223          	sw	a0,4(s3)
8040d358:	0169a423          	sw	s6,8(s3)
8040d35c:	01412883          	lw	a7,20(sp)
8040d360:	00050463          	beqz	a0,8040d368 <stride_dequeue+0x3550>
8040d364:	01352023          	sw	s3,0(a0)
8040d368:	008c2b03          	lw	s6,8(s8)
8040d36c:	d8cfe06f          	j	8040b8f8 <stride_dequeue+0x1ae0>
8040d370:	0088a503          	lw	a0,8(a7)
8040d374:	00098593          	mv	a1,s3
8040d378:	0048ab03          	lw	s6,4(a7)
8040d37c:	fc4fc0ef          	jal	ra,80409b40 <skew_heap_merge.constprop.3>
8040d380:	01412883          	lw	a7,20(sp)
8040d384:	01812803          	lw	a6,24(sp)
8040d388:	00a8a223          	sw	a0,4(a7)
8040d38c:	0168a423          	sw	s6,8(a7)
8040d390:	04050263          	beqz	a0,8040d3d4 <stride_dequeue+0x35bc>
8040d394:	01152023          	sw	a7,0(a0)
8040d398:	00088993          	mv	s3,a7
8040d39c:	008c2b03          	lw	s6,8(s8)
8040d3a0:	a9cff06f          	j	8040c63c <stride_dequeue+0x2824>
8040d3a4:	008c2b03          	lw	s6,8(s8)
8040d3a8:	00098313          	mv	t1,s3
8040d3ac:	c7dfe06f          	j	8040c028 <stride_dequeue+0x2210>
8040d3b0:	008c2b03          	lw	s6,8(s8)
8040d3b4:	00078c93          	mv	s9,a5
8040d3b8:	e61fe06f          	j	8040c218 <stride_dequeue+0x2400>
8040d3bc:	008c2b03          	lw	s6,8(s8)
8040d3c0:	00088993          	mv	s3,a7
8040d3c4:	9f0ff06f          	j	8040c5b4 <stride_dequeue+0x279c>
8040d3c8:	008c2b03          	lw	s6,8(s8)
8040d3cc:	00080993          	mv	s3,a6
8040d3d0:	f4dfe06f          	j	8040c31c <stride_dequeue+0x2504>
8040d3d4:	008c2b03          	lw	s6,8(s8)
8040d3d8:	00088993          	mv	s3,a7
8040d3dc:	a60ff06f          	j	8040c63c <stride_dequeue+0x2824>
8040d3e0:	008c2b03          	lw	s6,8(s8)
8040d3e4:	000e0993          	mv	s3,t3
8040d3e8:	df0fe06f          	j	8040b9d8 <stride_dequeue+0x1bc0>
8040d3ec:	008c2b03          	lw	s6,8(s8)
8040d3f0:	000e0993          	mv	s3,t3
8040d3f4:	ec4fe06f          	j	8040bab8 <stride_dequeue+0x1ca0>
8040d3f8:	008c2b03          	lw	s6,8(s8)
8040d3fc:	000e0993          	mv	s3,t3
8040d400:	d21fd06f          	j	8040b120 <stride_dequeue+0x1308>
8040d404:	008c2b03          	lw	s6,8(s8)
8040d408:	00030c93          	mv	s9,t1
8040d40c:	aacff06f          	j	8040c6b8 <stride_dequeue+0x28a0>
8040d410:	008c2b03          	lw	s6,8(s8)
8040d414:	000e0993          	mv	s3,t3
8040d418:	95dfe06f          	j	8040bd74 <stride_dequeue+0x1f5c>
8040d41c:	008c2b03          	lw	s6,8(s8)
8040d420:	00030813          	mv	a6,t1
8040d424:	914ff06f          	j	8040c538 <stride_dequeue+0x2720>
8040d428:	008c2b03          	lw	s6,8(s8)
8040d42c:	00078a13          	mv	s4,a5
8040d430:	ca5fe06f          	j	8040c0d4 <stride_dequeue+0x22bc>
8040d434:	008c2b03          	lw	s6,8(s8)
8040d438:	00098313          	mv	t1,s3
8040d43c:	b6dfe06f          	j	8040bfa8 <stride_dequeue+0x2190>
8040d440:	008c2b03          	lw	s6,8(s8)
8040d444:	000e0993          	mv	s3,t3
8040d448:	cb0fe06f          	j	8040b8f8 <stride_dequeue+0x1ae0>
8040d44c:	008c2b03          	lw	s6,8(s8)
8040d450:	00030813          	mv	a6,t1
8040d454:	85cff06f          	j	8040c4b0 <stride_dequeue+0x2698>
8040d458:	008c2b03          	lw	s6,8(s8)
8040d45c:	000e0993          	mv	s3,t3
8040d460:	eedfd06f          	j	8040b34c <stride_dequeue+0x1534>
8040d464:	008c2b03          	lw	s6,8(s8)
8040d468:	00080993          	mv	s3,a6
8040d46c:	f3dfe06f          	j	8040c3a8 <stride_dequeue+0x2590>
8040d470:	008c2b03          	lw	s6,8(s8)
8040d474:	00098313          	mv	t1,s3
8040d478:	aadfe06f          	j	8040bf24 <stride_dequeue+0x210c>
8040d47c:	008c2b03          	lw	s6,8(s8)
8040d480:	000e0993          	mv	s3,t3
8040d484:	f10fe06f          	j	8040bb94 <stride_dequeue+0x1d7c>
8040d488:	008c2b03          	lw	s6,8(s8)
8040d48c:	000e0993          	mv	s3,t3
8040d490:	ff0fe06f          	j	8040bc80 <stride_dequeue+0x1e68>
8040d494:	008c2b03          	lw	s6,8(s8)
8040d498:	00080993          	mv	s3,a6
8040d49c:	e05fe06f          	j	8040c2a0 <stride_dequeue+0x2488>
8040d4a0:	008c2b03          	lw	s6,8(s8)
8040d4a4:	000e0993          	mv	s3,t3
8040d4a8:	d91fd06f          	j	8040b238 <stride_dequeue+0x1420>
8040d4ac:	008c2b03          	lw	s6,8(s8)
8040d4b0:	00078a13          	mv	s4,a5
8040d4b4:	cf9fe06f          	j	8040c1ac <stride_dequeue+0x2394>
8040d4b8:	008c2b03          	lw	s6,8(s8)
8040d4bc:	000e0a13          	mv	s4,t3
8040d4c0:	ef8fd06f          	j	8040abb8 <stride_dequeue+0xda0>
8040d4c4:	008c2b03          	lw	s6,8(s8)
8040d4c8:	00030813          	mv	a6,t1
8040d4cc:	a84ff06f          	j	8040c750 <stride_dequeue+0x2938>
8040d4d0:	008c2b03          	lw	s6,8(s8)
8040d4d4:	00098813          	mv	a6,s3
8040d4d8:	931fe06f          	j	8040be08 <stride_dequeue+0x1ff0>
8040d4dc:	008c2b03          	lw	s6,8(s8)
8040d4e0:	00098313          	mv	t1,s3
8040d4e4:	9bdfe06f          	j	8040bea0 <stride_dequeue+0x2088>
8040d4e8:	008c2b03          	lw	s6,8(s8)
8040d4ec:	00078993          	mv	s3,a5
8040d4f0:	c51fe06f          	j	8040c140 <stride_dequeue+0x2328>
8040d4f4:	008c2b03          	lw	s6,8(s8)
8040d4f8:	00088993          	mv	s3,a7
8040d4fc:	f39fe06f          	j	8040c434 <stride_dequeue+0x261c>

8040d500 <sched_init>:
8040d500:	ff010113          	addi	sp,sp,-16
8040d504:	0008c697          	auipc	a3,0x8c
8040d508:	b1c68693          	addi	a3,a3,-1252 # 80499020 <default_sched_class>
8040d50c:	00812423          	sw	s0,8(sp)
8040d510:	00112623          	sw	ra,12(sp)
8040d514:	0008f797          	auipc	a5,0x8f
8040d518:	2b478793          	addi	a5,a5,692 # 8049c7c8 <timer_list>
8040d51c:	0046a603          	lw	a2,4(a3)
8040d520:	0008e717          	auipc	a4,0x8e
8040d524:	22870713          	addi	a4,a4,552 # 8049b748 <__rq>
8040d528:	00f7a223          	sw	a5,4(a5)
8040d52c:	00f7a023          	sw	a5,0(a5)
8040d530:	00500793          	li	a5,5
8040d534:	0008f417          	auipc	s0,0x8f
8040d538:	29040413          	addi	s0,s0,656 # 8049c7c4 <sched_class>
8040d53c:	00f72623          	sw	a5,12(a4)
8040d540:	00070513          	mv	a0,a4
8040d544:	00d42023          	sw	a3,0(s0)
8040d548:	0008f797          	auipc	a5,0x8f
8040d54c:	26e7ac23          	sw	a4,632(a5) # 8049c7c0 <rq>
8040d550:	000600e7          	jalr	a2
8040d554:	00042783          	lw	a5,0(s0)
8040d558:	00812403          	lw	s0,8(sp)
8040d55c:	00c12083          	lw	ra,12(sp)
8040d560:	0007a583          	lw	a1,0(a5)
8040d564:	00008517          	auipc	a0,0x8
8040d568:	19850513          	addi	a0,a0,408 # 804156fc <CSWTCH.69+0x9a4>
8040d56c:	01010113          	addi	sp,sp,16
8040d570:	c8df206f          	j	804001fc <cprintf>

8040d574 <wakeup_proc>:
8040d574:	00052703          	lw	a4,0(a0)
8040d578:	ff010113          	addi	sp,sp,-16
8040d57c:	00112623          	sw	ra,12(sp)
8040d580:	00812423          	sw	s0,8(sp)
8040d584:	00912223          	sw	s1,4(sp)
8040d588:	00300793          	li	a5,3
8040d58c:	0cf70263          	beq	a4,a5,8040d650 <wakeup_proc+0xdc>
8040d590:	00050413          	mv	s0,a0
8040d594:	100027f3          	csrr	a5,sstatus
8040d598:	0027f793          	andi	a5,a5,2
8040d59c:	00000493          	li	s1,0
8040d5a0:	0a079063          	bnez	a5,8040d640 <wakeup_proc+0xcc>
8040d5a4:	00200793          	li	a5,2
8040d5a8:	06f70e63          	beq	a4,a5,8040d624 <wakeup_proc+0xb0>
8040d5ac:	0008f717          	auipc	a4,0x8f
8040d5b0:	20470713          	addi	a4,a4,516 # 8049c7b0 <current>
8040d5b4:	00072703          	lw	a4,0(a4)
8040d5b8:	0a042423          	sw	zero,168(s0)
8040d5bc:	00f42023          	sw	a5,0(s0)
8040d5c0:	02870c63          	beq	a4,s0,8040d5f8 <wakeup_proc+0x84>
8040d5c4:	0008f797          	auipc	a5,0x8f
8040d5c8:	1f078793          	addi	a5,a5,496 # 8049c7b4 <idleproc>
8040d5cc:	0007a783          	lw	a5,0(a5)
8040d5d0:	02f40463          	beq	s0,a5,8040d5f8 <wakeup_proc+0x84>
8040d5d4:	0008f797          	auipc	a5,0x8f
8040d5d8:	1f078793          	addi	a5,a5,496 # 8049c7c4 <sched_class>
8040d5dc:	0007a783          	lw	a5,0(a5)
8040d5e0:	0008f717          	auipc	a4,0x8f
8040d5e4:	1e070713          	addi	a4,a4,480 # 8049c7c0 <rq>
8040d5e8:	00072503          	lw	a0,0(a4)
8040d5ec:	0087a783          	lw	a5,8(a5)
8040d5f0:	00040593          	mv	a1,s0
8040d5f4:	000780e7          	jalr	a5
8040d5f8:	00049c63          	bnez	s1,8040d610 <wakeup_proc+0x9c>
8040d5fc:	00c12083          	lw	ra,12(sp)
8040d600:	00812403          	lw	s0,8(sp)
8040d604:	00412483          	lw	s1,4(sp)
8040d608:	01010113          	addi	sp,sp,16
8040d60c:	00008067          	ret
8040d610:	00812403          	lw	s0,8(sp)
8040d614:	00c12083          	lw	ra,12(sp)
8040d618:	00412483          	lw	s1,4(sp)
8040d61c:	01010113          	addi	sp,sp,16
8040d620:	e04f306f          	j	80400c24 <intr_enable>
8040d624:	00008617          	auipc	a2,0x8
8040d628:	12060613          	addi	a2,a2,288 # 80415744 <CSWTCH.69+0x9ec>
8040d62c:	04800593          	li	a1,72
8040d630:	00008517          	auipc	a0,0x8
8040d634:	0fc50513          	addi	a0,a0,252 # 8041572c <CSWTCH.69+0x9d4>
8040d638:	870f30ef          	jal	ra,804006a8 <__warn>
8040d63c:	fbdff06f          	j	8040d5f8 <wakeup_proc+0x84>
8040d640:	decf30ef          	jal	ra,80400c2c <intr_disable>
8040d644:	00042703          	lw	a4,0(s0)
8040d648:	00100493          	li	s1,1
8040d64c:	f59ff06f          	j	8040d5a4 <wakeup_proc+0x30>
8040d650:	00008697          	auipc	a3,0x8
8040d654:	0c068693          	addi	a3,a3,192 # 80415710 <CSWTCH.69+0x9b8>
8040d658:	00006617          	auipc	a2,0x6
8040d65c:	18860613          	addi	a2,a2,392 # 804137e0 <commands+0x1bc>
8040d660:	03c00593          	li	a1,60
8040d664:	00008517          	auipc	a0,0x8
8040d668:	0c850513          	addi	a0,a0,200 # 8041572c <CSWTCH.69+0x9d4>
8040d66c:	fb9f20ef          	jal	ra,80400624 <__panic>

8040d670 <schedule>:
8040d670:	fe010113          	addi	sp,sp,-32
8040d674:	00112e23          	sw	ra,28(sp)
8040d678:	00812c23          	sw	s0,24(sp)
8040d67c:	00912a23          	sw	s1,20(sp)
8040d680:	01212823          	sw	s2,16(sp)
8040d684:	01312623          	sw	s3,12(sp)
8040d688:	01412423          	sw	s4,8(sp)
8040d68c:	100027f3          	csrr	a5,sstatus
8040d690:	0027f793          	andi	a5,a5,2
8040d694:	00000a13          	li	s4,0
8040d698:	0e079e63          	bnez	a5,8040d794 <schedule+0x124>
8040d69c:	0008f497          	auipc	s1,0x8f
8040d6a0:	11448493          	addi	s1,s1,276 # 8049c7b0 <current>
8040d6a4:	0004a583          	lw	a1,0(s1)
8040d6a8:	0008f997          	auipc	s3,0x8f
8040d6ac:	11c98993          	addi	s3,s3,284 # 8049c7c4 <sched_class>
8040d6b0:	0008f917          	auipc	s2,0x8f
8040d6b4:	11090913          	addi	s2,s2,272 # 8049c7c0 <rq>
8040d6b8:	0005a683          	lw	a3,0(a1)
8040d6bc:	0005a823          	sw	zero,16(a1)
8040d6c0:	00200713          	li	a4,2
8040d6c4:	0009a783          	lw	a5,0(s3)
8040d6c8:	00092503          	lw	a0,0(s2)
8040d6cc:	06e68463          	beq	a3,a4,8040d734 <schedule+0xc4>
8040d6d0:	0107a783          	lw	a5,16(a5)
8040d6d4:	000780e7          	jalr	a5
8040d6d8:	00050413          	mv	s0,a0
8040d6dc:	08050463          	beqz	a0,8040d764 <schedule+0xf4>
8040d6e0:	0009a783          	lw	a5,0(s3)
8040d6e4:	00092503          	lw	a0,0(s2)
8040d6e8:	00040593          	mv	a1,s0
8040d6ec:	00c7a783          	lw	a5,12(a5)
8040d6f0:	000780e7          	jalr	a5
8040d6f4:	00842783          	lw	a5,8(s0)
8040d6f8:	0004a703          	lw	a4,0(s1)
8040d6fc:	00178793          	addi	a5,a5,1
8040d700:	00f42423          	sw	a5,8(s0)
8040d704:	00870663          	beq	a4,s0,8040d710 <schedule+0xa0>
8040d708:	00040513          	mv	a0,s0
8040d70c:	fd0fa0ef          	jal	ra,80407edc <proc_run>
8040d710:	060a1263          	bnez	s4,8040d774 <schedule+0x104>
8040d714:	01c12083          	lw	ra,28(sp)
8040d718:	01812403          	lw	s0,24(sp)
8040d71c:	01412483          	lw	s1,20(sp)
8040d720:	01012903          	lw	s2,16(sp)
8040d724:	00c12983          	lw	s3,12(sp)
8040d728:	00812a03          	lw	s4,8(sp)
8040d72c:	02010113          	addi	sp,sp,32
8040d730:	00008067          	ret
8040d734:	0008f717          	auipc	a4,0x8f
8040d738:	08070713          	addi	a4,a4,128 # 8049c7b4 <idleproc>
8040d73c:	00072703          	lw	a4,0(a4)
8040d740:	f8e588e3          	beq	a1,a4,8040d6d0 <schedule+0x60>
8040d744:	0087a783          	lw	a5,8(a5)
8040d748:	000780e7          	jalr	a5
8040d74c:	0009a783          	lw	a5,0(s3)
8040d750:	00092503          	lw	a0,0(s2)
8040d754:	0107a783          	lw	a5,16(a5)
8040d758:	000780e7          	jalr	a5
8040d75c:	00050413          	mv	s0,a0
8040d760:	f80510e3          	bnez	a0,8040d6e0 <schedule+0x70>
8040d764:	0008f797          	auipc	a5,0x8f
8040d768:	05078793          	addi	a5,a5,80 # 8049c7b4 <idleproc>
8040d76c:	0007a403          	lw	s0,0(a5)
8040d770:	f85ff06f          	j	8040d6f4 <schedule+0x84>
8040d774:	01812403          	lw	s0,24(sp)
8040d778:	01c12083          	lw	ra,28(sp)
8040d77c:	01412483          	lw	s1,20(sp)
8040d780:	01012903          	lw	s2,16(sp)
8040d784:	00c12983          	lw	s3,12(sp)
8040d788:	00812a03          	lw	s4,8(sp)
8040d78c:	02010113          	addi	sp,sp,32
8040d790:	c94f306f          	j	80400c24 <intr_enable>
8040d794:	c98f30ef          	jal	ra,80400c2c <intr_disable>
8040d798:	00100a13          	li	s4,1
8040d79c:	f01ff06f          	j	8040d69c <schedule+0x2c>

8040d7a0 <add_timer>:
8040d7a0:	fe010113          	addi	sp,sp,-32
8040d7a4:	00112e23          	sw	ra,28(sp)
8040d7a8:	100027f3          	csrr	a5,sstatus
8040d7ac:	0027f793          	andi	a5,a5,2
8040d7b0:	00000813          	li	a6,0
8040d7b4:	0a079263          	bnez	a5,8040d858 <add_timer+0xb8>
8040d7b8:	00052703          	lw	a4,0(a0)
8040d7bc:	0a070863          	beqz	a4,8040d86c <add_timer+0xcc>
8040d7c0:	00452783          	lw	a5,4(a0)
8040d7c4:	0a078463          	beqz	a5,8040d86c <add_timer+0xcc>
8040d7c8:	00c52783          	lw	a5,12(a0)
8040d7cc:	00850593          	addi	a1,a0,8
8040d7d0:	0af59e63          	bne	a1,a5,8040d88c <add_timer+0xec>
8040d7d4:	0008f617          	auipc	a2,0x8f
8040d7d8:	ff460613          	addi	a2,a2,-12 # 8049c7c8 <timer_list>
8040d7dc:	00462783          	lw	a5,4(a2)
8040d7e0:	00c79c63          	bne	a5,a2,8040d7f8 <add_timer+0x58>
8040d7e4:	0480006f          	j	8040d82c <add_timer+0x8c>
8040d7e8:	0047a783          	lw	a5,4(a5)
8040d7ec:	40d70733          	sub	a4,a4,a3
8040d7f0:	00e52023          	sw	a4,0(a0)
8040d7f4:	02c78c63          	beq	a5,a2,8040d82c <add_timer+0x8c>
8040d7f8:	ff87a683          	lw	a3,-8(a5)
8040d7fc:	fed776e3          	bgeu	a4,a3,8040d7e8 <add_timer+0x48>
8040d800:	40e68733          	sub	a4,a3,a4
8040d804:	fee7ac23          	sw	a4,-8(a5)
8040d808:	0007a703          	lw	a4,0(a5)
8040d80c:	00b7a023          	sw	a1,0(a5)
8040d810:	00b72223          	sw	a1,4(a4)
8040d814:	00f52623          	sw	a5,12(a0)
8040d818:	00e52423          	sw	a4,8(a0)
8040d81c:	02080863          	beqz	a6,8040d84c <add_timer+0xac>
8040d820:	01c12083          	lw	ra,28(sp)
8040d824:	02010113          	addi	sp,sp,32
8040d828:	bfcf306f          	j	80400c24 <intr_enable>
8040d82c:	0008f797          	auipc	a5,0x8f
8040d830:	f9c78793          	addi	a5,a5,-100 # 8049c7c8 <timer_list>
8040d834:	0007a703          	lw	a4,0(a5)
8040d838:	00b7a023          	sw	a1,0(a5)
8040d83c:	00b72223          	sw	a1,4(a4)
8040d840:	00f52623          	sw	a5,12(a0)
8040d844:	00e52423          	sw	a4,8(a0)
8040d848:	fc081ce3          	bnez	a6,8040d820 <add_timer+0x80>
8040d84c:	01c12083          	lw	ra,28(sp)
8040d850:	02010113          	addi	sp,sp,32
8040d854:	00008067          	ret
8040d858:	00a12623          	sw	a0,12(sp)
8040d85c:	bd0f30ef          	jal	ra,80400c2c <intr_disable>
8040d860:	00100813          	li	a6,1
8040d864:	00c12503          	lw	a0,12(sp)
8040d868:	f51ff06f          	j	8040d7b8 <add_timer+0x18>
8040d86c:	00008697          	auipc	a3,0x8
8040d870:	de868693          	addi	a3,a3,-536 # 80415654 <CSWTCH.69+0x8fc>
8040d874:	00006617          	auipc	a2,0x6
8040d878:	f6c60613          	addi	a2,a2,-148 # 804137e0 <commands+0x1bc>
8040d87c:	06b00593          	li	a1,107
8040d880:	00008517          	auipc	a0,0x8
8040d884:	eac50513          	addi	a0,a0,-340 # 8041572c <CSWTCH.69+0x9d4>
8040d888:	d9df20ef          	jal	ra,80400624 <__panic>
8040d88c:	00008697          	auipc	a3,0x8
8040d890:	df468693          	addi	a3,a3,-524 # 80415680 <CSWTCH.69+0x928>
8040d894:	00006617          	auipc	a2,0x6
8040d898:	f4c60613          	addi	a2,a2,-180 # 804137e0 <commands+0x1bc>
8040d89c:	06c00593          	li	a1,108
8040d8a0:	00008517          	auipc	a0,0x8
8040d8a4:	e8c50513          	addi	a0,a0,-372 # 8041572c <CSWTCH.69+0x9d4>
8040d8a8:	d7df20ef          	jal	ra,80400624 <__panic>

8040d8ac <del_timer>:
8040d8ac:	fe010113          	addi	sp,sp,-32
8040d8b0:	00112e23          	sw	ra,28(sp)
8040d8b4:	00812c23          	sw	s0,24(sp)
8040d8b8:	100027f3          	csrr	a5,sstatus
8040d8bc:	0027f793          	andi	a5,a5,2
8040d8c0:	00850413          	addi	s0,a0,8
8040d8c4:	06079c63          	bnez	a5,8040d93c <del_timer+0x90>
8040d8c8:	00c52783          	lw	a5,12(a0)
8040d8cc:	06f40063          	beq	s0,a5,8040d92c <del_timer+0x80>
8040d8d0:	00052683          	lw	a3,0(a0)
8040d8d4:	00852703          	lw	a4,8(a0)
8040d8d8:	04068263          	beqz	a3,8040d91c <del_timer+0x70>
8040d8dc:	0008f617          	auipc	a2,0x8f
8040d8e0:	eec60613          	addi	a2,a2,-276 # 8049c7c8 <timer_list>
8040d8e4:	00000593          	li	a1,0
8040d8e8:	02c78a63          	beq	a5,a2,8040d91c <del_timer+0x70>
8040d8ec:	ff87a603          	lw	a2,-8(a5)
8040d8f0:	00d606b3          	add	a3,a2,a3
8040d8f4:	fed7ac23          	sw	a3,-8(a5)
8040d8f8:	00f72223          	sw	a5,4(a4)
8040d8fc:	00e7a023          	sw	a4,0(a5)
8040d900:	00852623          	sw	s0,12(a0)
8040d904:	00852423          	sw	s0,8(a0)
8040d908:	02058263          	beqz	a1,8040d92c <del_timer+0x80>
8040d90c:	01812403          	lw	s0,24(sp)
8040d910:	01c12083          	lw	ra,28(sp)
8040d914:	02010113          	addi	sp,sp,32
8040d918:	b0cf306f          	j	80400c24 <intr_enable>
8040d91c:	00f72223          	sw	a5,4(a4)
8040d920:	00e7a023          	sw	a4,0(a5)
8040d924:	00852623          	sw	s0,12(a0)
8040d928:	00852423          	sw	s0,8(a0)
8040d92c:	01c12083          	lw	ra,28(sp)
8040d930:	01812403          	lw	s0,24(sp)
8040d934:	02010113          	addi	sp,sp,32
8040d938:	00008067          	ret
8040d93c:	00a12623          	sw	a0,12(sp)
8040d940:	aecf30ef          	jal	ra,80400c2c <intr_disable>
8040d944:	00c12503          	lw	a0,12(sp)
8040d948:	00c52783          	lw	a5,12(a0)
8040d94c:	fc8780e3          	beq	a5,s0,8040d90c <del_timer+0x60>
8040d950:	00052683          	lw	a3,0(a0)
8040d954:	00852703          	lw	a4,8(a0)
8040d958:	00068a63          	beqz	a3,8040d96c <del_timer+0xc0>
8040d95c:	0008f617          	auipc	a2,0x8f
8040d960:	e6c60613          	addi	a2,a2,-404 # 8049c7c8 <timer_list>
8040d964:	00100593          	li	a1,1
8040d968:	f8c792e3          	bne	a5,a2,8040d8ec <del_timer+0x40>
8040d96c:	00f72223          	sw	a5,4(a4)
8040d970:	00e7a023          	sw	a4,0(a5)
8040d974:	00852623          	sw	s0,12(a0)
8040d978:	00852423          	sw	s0,8(a0)
8040d97c:	f91ff06f          	j	8040d90c <del_timer+0x60>

8040d980 <run_timer_list>:
8040d980:	fe010113          	addi	sp,sp,-32
8040d984:	00112e23          	sw	ra,28(sp)
8040d988:	00812c23          	sw	s0,24(sp)
8040d98c:	00912a23          	sw	s1,20(sp)
8040d990:	01212823          	sw	s2,16(sp)
8040d994:	01312623          	sw	s3,12(sp)
8040d998:	01412423          	sw	s4,8(sp)
8040d99c:	01512223          	sw	s5,4(sp)
8040d9a0:	01612023          	sw	s6,0(sp)
8040d9a4:	100027f3          	csrr	a5,sstatus
8040d9a8:	0027f793          	andi	a5,a5,2
8040d9ac:	00000b13          	li	s6,0
8040d9b0:	12079c63          	bnez	a5,8040dae8 <run_timer_list+0x168>
8040d9b4:	0008f997          	auipc	s3,0x8f
8040d9b8:	e1498993          	addi	s3,s3,-492 # 8049c7c8 <timer_list>
8040d9bc:	0049a403          	lw	s0,4(s3)
8040d9c0:	09340663          	beq	s0,s3,8040da4c <run_timer_list+0xcc>
8040d9c4:	ff842783          	lw	a5,-8(s0)
8040d9c8:	ff840913          	addi	s2,s0,-8
8040d9cc:	14078463          	beqz	a5,8040db14 <run_timer_list+0x194>
8040d9d0:	fff78793          	addi	a5,a5,-1
8040d9d4:	fef42c23          	sw	a5,-8(s0)
8040d9d8:	06079a63          	bnez	a5,8040da4c <run_timer_list+0xcc>
8040d9dc:	00008a97          	auipc	s5,0x8
8040d9e0:	d00a8a93          	addi	s5,s5,-768 # 804156dc <CSWTCH.69+0x984>
8040d9e4:	00008a17          	auipc	s4,0x8
8040d9e8:	d48a0a13          	addi	s4,s4,-696 # 8041572c <CSWTCH.69+0x9d4>
8040d9ec:	0280006f          	j	8040da14 <run_timer_list+0x94>
8040d9f0:	1007d263          	bgez	a5,8040daf4 <run_timer_list+0x174>
8040d9f4:	00048513          	mv	a0,s1
8040d9f8:	b7dff0ef          	jal	ra,8040d574 <wakeup_proc>
8040d9fc:	00090513          	mv	a0,s2
8040da00:	eadff0ef          	jal	ra,8040d8ac <del_timer>
8040da04:	05340463          	beq	s0,s3,8040da4c <run_timer_list+0xcc>
8040da08:	ff842783          	lw	a5,-8(s0)
8040da0c:	ff840913          	addi	s2,s0,-8
8040da10:	02079e63          	bnez	a5,8040da4c <run_timer_list+0xcc>
8040da14:	00492483          	lw	s1,4(s2)
8040da18:	00442403          	lw	s0,4(s0)
8040da1c:	0a84a783          	lw	a5,168(s1)
8040da20:	fc0798e3          	bnez	a5,8040d9f0 <run_timer_list+0x70>
8040da24:	0044a683          	lw	a3,4(s1)
8040da28:	000a8613          	mv	a2,s5
8040da2c:	0a200593          	li	a1,162
8040da30:	000a0513          	mv	a0,s4
8040da34:	c75f20ef          	jal	ra,804006a8 <__warn>
8040da38:	00048513          	mv	a0,s1
8040da3c:	b39ff0ef          	jal	ra,8040d574 <wakeup_proc>
8040da40:	00090513          	mv	a0,s2
8040da44:	e69ff0ef          	jal	ra,8040d8ac <del_timer>
8040da48:	fd3410e3          	bne	s0,s3,8040da08 <run_timer_list+0x88>
8040da4c:	0008f797          	auipc	a5,0x8f
8040da50:	d6478793          	addi	a5,a5,-668 # 8049c7b0 <current>
8040da54:	0007a583          	lw	a1,0(a5)
8040da58:	0008f797          	auipc	a5,0x8f
8040da5c:	d5c78793          	addi	a5,a5,-676 # 8049c7b4 <idleproc>
8040da60:	0007a783          	lw	a5,0(a5)
8040da64:	06f58c63          	beq	a1,a5,8040dadc <run_timer_list+0x15c>
8040da68:	0008f797          	auipc	a5,0x8f
8040da6c:	d5c78793          	addi	a5,a5,-676 # 8049c7c4 <sched_class>
8040da70:	0007a783          	lw	a5,0(a5)
8040da74:	0008f717          	auipc	a4,0x8f
8040da78:	d4c70713          	addi	a4,a4,-692 # 8049c7c0 <rq>
8040da7c:	00072503          	lw	a0,0(a4)
8040da80:	0147a783          	lw	a5,20(a5)
8040da84:	000780e7          	jalr	a5
8040da88:	020b1663          	bnez	s6,8040dab4 <run_timer_list+0x134>
8040da8c:	01c12083          	lw	ra,28(sp)
8040da90:	01812403          	lw	s0,24(sp)
8040da94:	01412483          	lw	s1,20(sp)
8040da98:	01012903          	lw	s2,16(sp)
8040da9c:	00c12983          	lw	s3,12(sp)
8040daa0:	00812a03          	lw	s4,8(sp)
8040daa4:	00412a83          	lw	s5,4(sp)
8040daa8:	00012b03          	lw	s6,0(sp)
8040daac:	02010113          	addi	sp,sp,32
8040dab0:	00008067          	ret
8040dab4:	01812403          	lw	s0,24(sp)
8040dab8:	01c12083          	lw	ra,28(sp)
8040dabc:	01412483          	lw	s1,20(sp)
8040dac0:	01012903          	lw	s2,16(sp)
8040dac4:	00c12983          	lw	s3,12(sp)
8040dac8:	00812a03          	lw	s4,8(sp)
8040dacc:	00412a83          	lw	s5,4(sp)
8040dad0:	00012b03          	lw	s6,0(sp)
8040dad4:	02010113          	addi	sp,sp,32
8040dad8:	94cf306f          	j	80400c24 <intr_enable>
8040dadc:	00100793          	li	a5,1
8040dae0:	00f5a823          	sw	a5,16(a1)
8040dae4:	fa5ff06f          	j	8040da88 <run_timer_list+0x108>
8040dae8:	944f30ef          	jal	ra,80400c2c <intr_disable>
8040daec:	00100b13          	li	s6,1
8040daf0:	ec5ff06f          	j	8040d9b4 <run_timer_list+0x34>
8040daf4:	00008697          	auipc	a3,0x8
8040daf8:	bc468693          	addi	a3,a3,-1084 # 804156b8 <CSWTCH.69+0x960>
8040dafc:	00006617          	auipc	a2,0x6
8040db00:	ce460613          	addi	a2,a2,-796 # 804137e0 <commands+0x1bc>
8040db04:	09f00593          	li	a1,159
8040db08:	00008517          	auipc	a0,0x8
8040db0c:	c2450513          	addi	a0,a0,-988 # 8041572c <CSWTCH.69+0x9d4>
8040db10:	b15f20ef          	jal	ra,80400624 <__panic>
8040db14:	00008697          	auipc	a3,0x8
8040db18:	b9068693          	addi	a3,a3,-1136 # 804156a4 <CSWTCH.69+0x94c>
8040db1c:	00006617          	auipc	a2,0x6
8040db20:	cc460613          	addi	a2,a2,-828 # 804137e0 <commands+0x1bc>
8040db24:	09900593          	li	a1,153
8040db28:	00008517          	auipc	a0,0x8
8040db2c:	c0450513          	addi	a0,a0,-1020 # 8041572c <CSWTCH.69+0x9d4>
8040db30:	af5f20ef          	jal	ra,80400624 <__panic>

8040db34 <sys_getpid>:
8040db34:	0008f797          	auipc	a5,0x8f
8040db38:	c7c78793          	addi	a5,a5,-900 # 8049c7b0 <current>
8040db3c:	0007a783          	lw	a5,0(a5)
8040db40:	0047a503          	lw	a0,4(a5)
8040db44:	00008067          	ret

8040db48 <sys_gettime>:
8040db48:	0008f797          	auipc	a5,0x8f
8040db4c:	ca878793          	addi	a5,a5,-856 # 8049c7f0 <ticks>
8040db50:	0007a503          	lw	a0,0(a5)
8040db54:	00008067          	ret

8040db58 <sys_lab6_set_priority>:
8040db58:	00052503          	lw	a0,0(a0)
8040db5c:	ff010113          	addi	sp,sp,-16
8040db60:	00112623          	sw	ra,12(sp)
8040db64:	db5fb0ef          	jal	ra,80409918 <lab6_set_priority>
8040db68:	00c12083          	lw	ra,12(sp)
8040db6c:	00000513          	li	a0,0
8040db70:	01010113          	addi	sp,sp,16
8040db74:	00008067          	ret

8040db78 <sys_dup>:
8040db78:	00452583          	lw	a1,4(a0)
8040db7c:	00052503          	lw	a0,0(a0)
8040db80:	fb1f906f          	j	80407b30 <sysfile_dup>

8040db84 <sys_getdirentry>:
8040db84:	00452583          	lw	a1,4(a0)
8040db88:	00052503          	lw	a0,0(a0)
8040db8c:	e29f906f          	j	804079b4 <sysfile_getdirentry>

8040db90 <sys_getcwd>:
8040db90:	00452583          	lw	a1,4(a0)
8040db94:	00052503          	lw	a0,0(a0)
8040db98:	d19f906f          	j	804078b0 <sysfile_getcwd>

8040db9c <sys_fsync>:
8040db9c:	00052503          	lw	a0,0(a0)
8040dba0:	d0df906f          	j	804078ac <sysfile_fsync>

8040dba4 <sys_fstat>:
8040dba4:	00452583          	lw	a1,4(a0)
8040dba8:	00052503          	lw	a0,0(a0)
8040dbac:	c11f906f          	j	804077bc <sysfile_fstat>

8040dbb0 <sys_seek>:
8040dbb0:	00852603          	lw	a2,8(a0)
8040dbb4:	00452583          	lw	a1,4(a0)
8040dbb8:	00052503          	lw	a0,0(a0)
8040dbbc:	bfdf906f          	j	804077b8 <sysfile_seek>

8040dbc0 <sys_write>:
8040dbc0:	00852603          	lw	a2,8(a0)
8040dbc4:	00452583          	lw	a1,4(a0)
8040dbc8:	00052503          	lw	a0,0(a0)
8040dbcc:	a29f906f          	j	804075f4 <sysfile_write>

8040dbd0 <sys_read>:
8040dbd0:	00852603          	lw	a2,8(a0)
8040dbd4:	00452583          	lw	a1,4(a0)
8040dbd8:	00052503          	lw	a0,0(a0)
8040dbdc:	851f906f          	j	8040742c <sysfile_read>

8040dbe0 <sys_close>:
8040dbe0:	00052503          	lw	a0,0(a0)
8040dbe4:	845f906f          	j	80407428 <sysfile_close>

8040dbe8 <sys_open>:
8040dbe8:	00452583          	lw	a1,4(a0)
8040dbec:	00052503          	lw	a0,0(a0)
8040dbf0:	fe0f906f          	j	804073d0 <sysfile_open>

8040dbf4 <sys_pgdir>:
8040dbf4:	ff010113          	addi	sp,sp,-16
8040dbf8:	00112623          	sw	ra,12(sp)
8040dbfc:	bcdf50ef          	jal	ra,804037c8 <print_pgdir>
8040dc00:	00c12083          	lw	ra,12(sp)
8040dc04:	00000513          	li	a0,0
8040dc08:	01010113          	addi	sp,sp,16
8040dc0c:	00008067          	ret

8040dc10 <sys_putc>:
8040dc10:	00052503          	lw	a0,0(a0)
8040dc14:	ff010113          	addi	sp,sp,-16
8040dc18:	00112623          	sw	ra,12(sp)
8040dc1c:	e40f20ef          	jal	ra,8040025c <cputchar>
8040dc20:	00c12083          	lw	ra,12(sp)
8040dc24:	00000513          	li	a0,0
8040dc28:	01010113          	addi	sp,sp,16
8040dc2c:	00008067          	ret

8040dc30 <sys_kill>:
8040dc30:	00052503          	lw	a0,0(a0)
8040dc34:	a69fb06f          	j	8040969c <do_kill>

8040dc38 <sys_sleep>:
8040dc38:	00052503          	lw	a0,0(a0)
8040dc3c:	d01fb06f          	j	8040993c <do_sleep>

8040dc40 <sys_yield>:
8040dc40:	9d1fb06f          	j	80409610 <do_yield>

8040dc44 <sys_exec>:
8040dc44:	00852603          	lw	a2,8(a0)
8040dc48:	00452583          	lw	a1,4(a0)
8040dc4c:	00052503          	lw	a0,0(a0)
8040dc50:	fcdfa06f          	j	80408c1c <do_execve>

8040dc54 <sys_wait>:
8040dc54:	00452583          	lw	a1,4(a0)
8040dc58:	00052503          	lw	a0,0(a0)
8040dc5c:	9d1fb06f          	j	8040962c <do_wait>

8040dc60 <sys_fork>:
8040dc60:	0008f797          	auipc	a5,0x8f
8040dc64:	b5078793          	addi	a5,a5,-1200 # 8049c7b0 <current>
8040dc68:	0007a783          	lw	a5,0(a5)
8040dc6c:	00000513          	li	a0,0
8040dc70:	0547a603          	lw	a2,84(a5)
8040dc74:	00862583          	lw	a1,8(a2)
8040dc78:	b88fa06f          	j	80408000 <do_fork>

8040dc7c <sys_exit>:
8040dc7c:	00052503          	lw	a0,0(a0)
8040dc80:	981fa06f          	j	80408600 <do_exit>

8040dc84 <syscall>:
8040dc84:	fd010113          	addi	sp,sp,-48
8040dc88:	02912223          	sw	s1,36(sp)
8040dc8c:	0008f497          	auipc	s1,0x8f
8040dc90:	b2448493          	addi	s1,s1,-1244 # 8049c7b0 <current>
8040dc94:	0004a703          	lw	a4,0(s1)
8040dc98:	02812423          	sw	s0,40(sp)
8040dc9c:	03212023          	sw	s2,32(sp)
8040dca0:	05472403          	lw	s0,84(a4)
8040dca4:	02112623          	sw	ra,44(sp)
8040dca8:	0ff00793          	li	a5,255
8040dcac:	02842903          	lw	s2,40(s0)
8040dcb0:	0727e463          	bltu	a5,s2,8040dd18 <syscall+0x94>
8040dcb4:	00291713          	slli	a4,s2,0x2
8040dcb8:	00008797          	auipc	a5,0x8
8040dcbc:	aec78793          	addi	a5,a5,-1300 # 804157a4 <syscalls>
8040dcc0:	00e787b3          	add	a5,a5,a4
8040dcc4:	0007a783          	lw	a5,0(a5)
8040dcc8:	04078863          	beqz	a5,8040dd18 <syscall+0x94>
8040dccc:	02c42503          	lw	a0,44(s0)
8040dcd0:	03042583          	lw	a1,48(s0)
8040dcd4:	03442603          	lw	a2,52(s0)
8040dcd8:	03842683          	lw	a3,56(s0)
8040dcdc:	03c42703          	lw	a4,60(s0)
8040dce0:	00a12623          	sw	a0,12(sp)
8040dce4:	00b12823          	sw	a1,16(sp)
8040dce8:	00c12a23          	sw	a2,20(sp)
8040dcec:	00d12c23          	sw	a3,24(sp)
8040dcf0:	00e12e23          	sw	a4,28(sp)
8040dcf4:	00c10513          	addi	a0,sp,12
8040dcf8:	000780e7          	jalr	a5
8040dcfc:	02a42423          	sw	a0,40(s0)
8040dd00:	02c12083          	lw	ra,44(sp)
8040dd04:	02812403          	lw	s0,40(sp)
8040dd08:	02412483          	lw	s1,36(sp)
8040dd0c:	02012903          	lw	s2,32(sp)
8040dd10:	03010113          	addi	sp,sp,48
8040dd14:	00008067          	ret
8040dd18:	00040513          	mv	a0,s0
8040dd1c:	b3cf30ef          	jal	ra,80401058 <print_trapframe>
8040dd20:	0004a783          	lw	a5,0(s1)
8040dd24:	00090693          	mv	a3,s2
8040dd28:	00008617          	auipc	a2,0x8
8040dd2c:	a3860613          	addi	a2,a2,-1480 # 80415760 <CSWTCH.69+0xa08>
8040dd30:	0047a703          	lw	a4,4(a5)
8040dd34:	0cd00593          	li	a1,205
8040dd38:	06078793          	addi	a5,a5,96
8040dd3c:	00008517          	auipc	a0,0x8
8040dd40:	a5050513          	addi	a0,a0,-1456 # 8041578c <CSWTCH.69+0xa34>
8040dd44:	8e1f20ef          	jal	ra,80400624 <__panic>

8040dd48 <swapfs_init>:
8040dd48:	ff010113          	addi	sp,sp,-16
8040dd4c:	00100513          	li	a0,1
8040dd50:	00112623          	sw	ra,12(sp)
8040dd54:	d35f20ef          	jal	ra,80400a88 <ide_device_valid>
8040dd58:	02050263          	beqz	a0,8040dd7c <swapfs_init+0x34>
8040dd5c:	00100513          	li	a0,1
8040dd60:	d5df20ef          	jal	ra,80400abc <ide_device_size>
8040dd64:	00c12083          	lw	ra,12(sp)
8040dd68:	00355513          	srli	a0,a0,0x3
8040dd6c:	0008f797          	auipc	a5,0x8f
8040dd70:	b0a7ac23          	sw	a0,-1256(a5) # 8049c884 <max_swap_offset>
8040dd74:	01010113          	addi	sp,sp,16
8040dd78:	00008067          	ret
8040dd7c:	00008617          	auipc	a2,0x8
8040dd80:	e2860613          	addi	a2,a2,-472 # 80415ba4 <syscalls+0x400>
8040dd84:	00d00593          	li	a1,13
8040dd88:	00008517          	auipc	a0,0x8
8040dd8c:	e3850513          	addi	a0,a0,-456 # 80415bc0 <syscalls+0x41c>
8040dd90:	895f20ef          	jal	ra,80400624 <__panic>

8040dd94 <swapfs_read>:
8040dd94:	ff010113          	addi	sp,sp,-16
8040dd98:	00112623          	sw	ra,12(sp)
8040dd9c:	00855793          	srli	a5,a0,0x8
8040dda0:	06078e63          	beqz	a5,8040de1c <swapfs_read+0x88>
8040dda4:	0008f717          	auipc	a4,0x8f
8040dda8:	ae070713          	addi	a4,a4,-1312 # 8049c884 <max_swap_offset>
8040ddac:	00072703          	lw	a4,0(a4)
8040ddb0:	06e7f663          	bgeu	a5,a4,8040de1c <swapfs_read+0x88>
8040ddb4:	0008f717          	auipc	a4,0x8f
8040ddb8:	a5870713          	addi	a4,a4,-1448 # 8049c80c <pages>
8040ddbc:	00072603          	lw	a2,0(a4)
8040ddc0:	00009717          	auipc	a4,0x9
8040ddc4:	0a070713          	addi	a4,a4,160 # 80416e60 <nbase>
8040ddc8:	40c58633          	sub	a2,a1,a2
8040ddcc:	00072583          	lw	a1,0(a4)
8040ddd0:	40565613          	srai	a2,a2,0x5
8040ddd4:	0008f717          	auipc	a4,0x8f
8040ddd8:	9c870713          	addi	a4,a4,-1592 # 8049c79c <npage>
8040dddc:	00b60633          	add	a2,a2,a1
8040dde0:	00072683          	lw	a3,0(a4)
8040dde4:	00c61713          	slli	a4,a2,0xc
8040dde8:	00c75713          	srli	a4,a4,0xc
8040ddec:	00379593          	slli	a1,a5,0x3
8040ddf0:	00c61613          	slli	a2,a2,0xc
8040ddf4:	04d77263          	bgeu	a4,a3,8040de38 <swapfs_read+0xa4>
8040ddf8:	0008f797          	auipc	a5,0x8f
8040ddfc:	a0c78793          	addi	a5,a5,-1524 # 8049c804 <va_pa_offset>
8040de00:	0007a783          	lw	a5,0(a5)
8040de04:	00c12083          	lw	ra,12(sp)
8040de08:	00800693          	li	a3,8
8040de0c:	00f60633          	add	a2,a2,a5
8040de10:	00100513          	li	a0,1
8040de14:	01010113          	addi	sp,sp,16
8040de18:	cddf206f          	j	80400af4 <ide_read_secs>
8040de1c:	00050693          	mv	a3,a0
8040de20:	00008617          	auipc	a2,0x8
8040de24:	db860613          	addi	a2,a2,-584 # 80415bd8 <syscalls+0x434>
8040de28:	01400593          	li	a1,20
8040de2c:	00008517          	auipc	a0,0x8
8040de30:	d9450513          	addi	a0,a0,-620 # 80415bc0 <syscalls+0x41c>
8040de34:	ff0f20ef          	jal	ra,80400624 <__panic>
8040de38:	00060693          	mv	a3,a2
8040de3c:	06e00593          	li	a1,110
8040de40:	00006617          	auipc	a2,0x6
8040de44:	24c60613          	addi	a2,a2,588 # 8041408c <default_pmm_manager+0x30>
8040de48:	00006517          	auipc	a0,0x6
8040de4c:	26850513          	addi	a0,a0,616 # 804140b0 <default_pmm_manager+0x54>
8040de50:	fd4f20ef          	jal	ra,80400624 <__panic>

8040de54 <swapfs_write>:
8040de54:	ff010113          	addi	sp,sp,-16
8040de58:	00112623          	sw	ra,12(sp)
8040de5c:	00855793          	srli	a5,a0,0x8
8040de60:	06078e63          	beqz	a5,8040dedc <swapfs_write+0x88>
8040de64:	0008f717          	auipc	a4,0x8f
8040de68:	a2070713          	addi	a4,a4,-1504 # 8049c884 <max_swap_offset>
8040de6c:	00072703          	lw	a4,0(a4)
8040de70:	06e7f663          	bgeu	a5,a4,8040dedc <swapfs_write+0x88>
8040de74:	0008f717          	auipc	a4,0x8f
8040de78:	99870713          	addi	a4,a4,-1640 # 8049c80c <pages>
8040de7c:	00072603          	lw	a2,0(a4)
8040de80:	00009717          	auipc	a4,0x9
8040de84:	fe070713          	addi	a4,a4,-32 # 80416e60 <nbase>
8040de88:	40c58633          	sub	a2,a1,a2
8040de8c:	00072583          	lw	a1,0(a4)
8040de90:	40565613          	srai	a2,a2,0x5
8040de94:	0008f717          	auipc	a4,0x8f
8040de98:	90870713          	addi	a4,a4,-1784 # 8049c79c <npage>
8040de9c:	00b60633          	add	a2,a2,a1
8040dea0:	00072683          	lw	a3,0(a4)
8040dea4:	00c61713          	slli	a4,a2,0xc
8040dea8:	00c75713          	srli	a4,a4,0xc
8040deac:	00379593          	slli	a1,a5,0x3
8040deb0:	00c61613          	slli	a2,a2,0xc
8040deb4:	04d77263          	bgeu	a4,a3,8040def8 <swapfs_write+0xa4>
8040deb8:	0008f797          	auipc	a5,0x8f
8040debc:	94c78793          	addi	a5,a5,-1716 # 8049c804 <va_pa_offset>
8040dec0:	0007a783          	lw	a5,0(a5)
8040dec4:	00c12083          	lw	ra,12(sp)
8040dec8:	00800693          	li	a3,8
8040decc:	00f60633          	add	a2,a2,a5
8040ded0:	00100513          	li	a0,1
8040ded4:	01010113          	addi	sp,sp,16
8040ded8:	cb5f206f          	j	80400b8c <ide_write_secs>
8040dedc:	00050693          	mv	a3,a0
8040dee0:	00008617          	auipc	a2,0x8
8040dee4:	cf860613          	addi	a2,a2,-776 # 80415bd8 <syscalls+0x434>
8040dee8:	01900593          	li	a1,25
8040deec:	00008517          	auipc	a0,0x8
8040def0:	cd450513          	addi	a0,a0,-812 # 80415bc0 <syscalls+0x41c>
8040def4:	f30f20ef          	jal	ra,80400624 <__panic>
8040def8:	00060693          	mv	a3,a2
8040defc:	06e00593          	li	a1,110
8040df00:	00006617          	auipc	a2,0x6
8040df04:	18c60613          	addi	a2,a2,396 # 8041408c <default_pmm_manager+0x30>
8040df08:	00006517          	auipc	a0,0x6
8040df0c:	1a850513          	addi	a0,a0,424 # 804140b0 <default_pmm_manager+0x54>
8040df10:	f14f20ef          	jal	ra,80400624 <__panic>

8040df14 <__alloc_inode>:
8040df14:	ff010113          	addi	sp,sp,-16
8040df18:	00812423          	sw	s0,8(sp)
8040df1c:	00050413          	mv	s0,a0
8040df20:	04000513          	li	a0,64
8040df24:	00112623          	sw	ra,12(sp)
8040df28:	8d9f40ef          	jal	ra,80402800 <kmalloc>
8040df2c:	00050463          	beqz	a0,8040df34 <__alloc_inode+0x20>
8040df30:	02852623          	sw	s0,44(a0)
8040df34:	00c12083          	lw	ra,12(sp)
8040df38:	00812403          	lw	s0,8(sp)
8040df3c:	01010113          	addi	sp,sp,16
8040df40:	00008067          	ret

8040df44 <inode_init>:
8040df44:	00100793          	li	a5,1
8040df48:	02052a23          	sw	zero,52(a0)
8040df4c:	02b52e23          	sw	a1,60(a0)
8040df50:	02c52c23          	sw	a2,56(a0)
8040df54:	02f52823          	sw	a5,48(a0)
8040df58:	00008067          	ret

8040df5c <inode_kill>:
8040df5c:	03052703          	lw	a4,48(a0)
8040df60:	ff010113          	addi	sp,sp,-16
8040df64:	00112623          	sw	ra,12(sp)
8040df68:	00071c63          	bnez	a4,8040df80 <inode_kill+0x24>
8040df6c:	03452783          	lw	a5,52(a0)
8040df70:	02079863          	bnez	a5,8040dfa0 <inode_kill+0x44>
8040df74:	00c12083          	lw	ra,12(sp)
8040df78:	01010113          	addi	sp,sp,16
8040df7c:	9a9f406f          	j	80402924 <kfree>
8040df80:	00008697          	auipc	a3,0x8
8040df84:	d3068693          	addi	a3,a3,-720 # 80415cb0 <syscalls+0x50c>
8040df88:	00006617          	auipc	a2,0x6
8040df8c:	85860613          	addi	a2,a2,-1960 # 804137e0 <commands+0x1bc>
8040df90:	02900593          	li	a1,41
8040df94:	00008517          	auipc	a0,0x8
8040df98:	d3850513          	addi	a0,a0,-712 # 80415ccc <syscalls+0x528>
8040df9c:	e88f20ef          	jal	ra,80400624 <__panic>
8040dfa0:	00008697          	auipc	a3,0x8
8040dfa4:	d4068693          	addi	a3,a3,-704 # 80415ce0 <syscalls+0x53c>
8040dfa8:	00006617          	auipc	a2,0x6
8040dfac:	83860613          	addi	a2,a2,-1992 # 804137e0 <commands+0x1bc>
8040dfb0:	02a00593          	li	a1,42
8040dfb4:	00008517          	auipc	a0,0x8
8040dfb8:	d1850513          	addi	a0,a0,-744 # 80415ccc <syscalls+0x528>
8040dfbc:	e68f20ef          	jal	ra,80400624 <__panic>

8040dfc0 <inode_ref_inc>:
8040dfc0:	03052783          	lw	a5,48(a0)
8040dfc4:	00178793          	addi	a5,a5,1
8040dfc8:	02f52823          	sw	a5,48(a0)
8040dfcc:	00078513          	mv	a0,a5
8040dfd0:	00008067          	ret

8040dfd4 <inode_open_inc>:
8040dfd4:	03452783          	lw	a5,52(a0)
8040dfd8:	00178793          	addi	a5,a5,1
8040dfdc:	02f52a23          	sw	a5,52(a0)
8040dfe0:	00078513          	mv	a0,a5
8040dfe4:	00008067          	ret

8040dfe8 <inode_check>:
8040dfe8:	ff010113          	addi	sp,sp,-16
8040dfec:	00112623          	sw	ra,12(sp)
8040dff0:	04050263          	beqz	a0,8040e034 <inode_check+0x4c>
8040dff4:	03c52783          	lw	a5,60(a0)
8040dff8:	02078e63          	beqz	a5,8040e034 <inode_check+0x4c>
8040dffc:	0007a703          	lw	a4,0(a5)
8040e000:	8c4ba7b7          	lui	a5,0x8c4ba
8040e004:	47678793          	addi	a5,a5,1142 # 8c4ba476 <end+0xc01dbb6>
8040e008:	08f71663          	bne	a4,a5,8040e094 <inode_check+0xac>
8040e00c:	03052703          	lw	a4,48(a0)
8040e010:	03452783          	lw	a5,52(a0)
8040e014:	06f74063          	blt	a4,a5,8040e074 <inode_check+0x8c>
8040e018:	0407ce63          	bltz	a5,8040e074 <inode_check+0x8c>
8040e01c:	000106b7          	lui	a3,0x10
8040e020:	02d75a63          	bge	a4,a3,8040e054 <inode_check+0x6c>
8040e024:	02d7d863          	bge	a5,a3,8040e054 <inode_check+0x6c>
8040e028:	00c12083          	lw	ra,12(sp)
8040e02c:	01010113          	addi	sp,sp,16
8040e030:	00008067          	ret
8040e034:	00008697          	auipc	a3,0x8
8040e038:	bc468693          	addi	a3,a3,-1084 # 80415bf8 <syscalls+0x454>
8040e03c:	00005617          	auipc	a2,0x5
8040e040:	7a460613          	addi	a2,a2,1956 # 804137e0 <commands+0x1bc>
8040e044:	06e00593          	li	a1,110
8040e048:	00008517          	auipc	a0,0x8
8040e04c:	c8450513          	addi	a0,a0,-892 # 80415ccc <syscalls+0x528>
8040e050:	dd4f20ef          	jal	ra,80400624 <__panic>
8040e054:	00008697          	auipc	a3,0x8
8040e058:	c2068693          	addi	a3,a3,-992 # 80415c74 <syscalls+0x4d0>
8040e05c:	00005617          	auipc	a2,0x5
8040e060:	78460613          	addi	a2,a2,1924 # 804137e0 <commands+0x1bc>
8040e064:	07200593          	li	a1,114
8040e068:	00008517          	auipc	a0,0x8
8040e06c:	c6450513          	addi	a0,a0,-924 # 80415ccc <syscalls+0x528>
8040e070:	db4f20ef          	jal	ra,80400624 <__panic>
8040e074:	00008697          	auipc	a3,0x8
8040e078:	bd468693          	addi	a3,a3,-1068 # 80415c48 <syscalls+0x4a4>
8040e07c:	00005617          	auipc	a2,0x5
8040e080:	76460613          	addi	a2,a2,1892 # 804137e0 <commands+0x1bc>
8040e084:	07100593          	li	a1,113
8040e088:	00008517          	auipc	a0,0x8
8040e08c:	c4450513          	addi	a0,a0,-956 # 80415ccc <syscalls+0x528>
8040e090:	d94f20ef          	jal	ra,80400624 <__panic>
8040e094:	00008697          	auipc	a3,0x8
8040e098:	b8c68693          	addi	a3,a3,-1140 # 80415c20 <syscalls+0x47c>
8040e09c:	00005617          	auipc	a2,0x5
8040e0a0:	74460613          	addi	a2,a2,1860 # 804137e0 <commands+0x1bc>
8040e0a4:	06f00593          	li	a1,111
8040e0a8:	00008517          	auipc	a0,0x8
8040e0ac:	c2450513          	addi	a0,a0,-988 # 80415ccc <syscalls+0x528>
8040e0b0:	d74f20ef          	jal	ra,80400624 <__panic>

8040e0b4 <inode_ref_dec>:
8040e0b4:	ff010113          	addi	sp,sp,-16
8040e0b8:	00812423          	sw	s0,8(sp)
8040e0bc:	03052403          	lw	s0,48(a0)
8040e0c0:	00112623          	sw	ra,12(sp)
8040e0c4:	00912223          	sw	s1,4(sp)
8040e0c8:	01212023          	sw	s2,0(sp)
8040e0cc:	0a805663          	blez	s0,8040e178 <inode_ref_dec+0xc4>
8040e0d0:	fff40413          	addi	s0,s0,-1
8040e0d4:	02852823          	sw	s0,48(a0)
8040e0d8:	00050493          	mv	s1,a0
8040e0dc:	02041a63          	bnez	s0,8040e110 <inode_ref_dec+0x5c>
8040e0e0:	03c52783          	lw	a5,60(a0)
8040e0e4:	06078a63          	beqz	a5,8040e158 <inode_ref_dec+0xa4>
8040e0e8:	0247a903          	lw	s2,36(a5)
8040e0ec:	06090663          	beqz	s2,8040e158 <inode_ref_dec+0xa4>
8040e0f0:	00008597          	auipc	a1,0x8
8040e0f4:	d0c58593          	addi	a1,a1,-756 # 80415dfc <syscalls+0x658>
8040e0f8:	ef1ff0ef          	jal	ra,8040dfe8 <inode_check>
8040e0fc:	00048513          	mv	a0,s1
8040e100:	000900e7          	jalr	s2
8040e104:	00050663          	beqz	a0,8040e110 <inode_ref_dec+0x5c>
8040e108:	ff100793          	li	a5,-15
8040e10c:	02f51063          	bne	a0,a5,8040e12c <inode_ref_dec+0x78>
8040e110:	00040513          	mv	a0,s0
8040e114:	00c12083          	lw	ra,12(sp)
8040e118:	00812403          	lw	s0,8(sp)
8040e11c:	00412483          	lw	s1,4(sp)
8040e120:	00012903          	lw	s2,0(sp)
8040e124:	01010113          	addi	sp,sp,16
8040e128:	00008067          	ret
8040e12c:	00050593          	mv	a1,a0
8040e130:	00008517          	auipc	a0,0x8
8040e134:	cd450513          	addi	a0,a0,-812 # 80415e04 <syscalls+0x660>
8040e138:	8c4f20ef          	jal	ra,804001fc <cprintf>
8040e13c:	00040513          	mv	a0,s0
8040e140:	00c12083          	lw	ra,12(sp)
8040e144:	00812403          	lw	s0,8(sp)
8040e148:	00412483          	lw	s1,4(sp)
8040e14c:	00012903          	lw	s2,0(sp)
8040e150:	01010113          	addi	sp,sp,16
8040e154:	00008067          	ret
8040e158:	00008697          	auipc	a3,0x8
8040e15c:	c5468693          	addi	a3,a3,-940 # 80415dac <syscalls+0x608>
8040e160:	00005617          	auipc	a2,0x5
8040e164:	68060613          	addi	a2,a2,1664 # 804137e0 <commands+0x1bc>
8040e168:	04400593          	li	a1,68
8040e16c:	00008517          	auipc	a0,0x8
8040e170:	b6050513          	addi	a0,a0,-1184 # 80415ccc <syscalls+0x528>
8040e174:	cb0f20ef          	jal	ra,80400624 <__panic>
8040e178:	00008697          	auipc	a3,0x8
8040e17c:	c1868693          	addi	a3,a3,-1000 # 80415d90 <syscalls+0x5ec>
8040e180:	00005617          	auipc	a2,0x5
8040e184:	66060613          	addi	a2,a2,1632 # 804137e0 <commands+0x1bc>
8040e188:	03f00593          	li	a1,63
8040e18c:	00008517          	auipc	a0,0x8
8040e190:	b4050513          	addi	a0,a0,-1216 # 80415ccc <syscalls+0x528>
8040e194:	c90f20ef          	jal	ra,80400624 <__panic>

8040e198 <inode_open_dec>:
8040e198:	ff010113          	addi	sp,sp,-16
8040e19c:	00812423          	sw	s0,8(sp)
8040e1a0:	03452403          	lw	s0,52(a0)
8040e1a4:	00112623          	sw	ra,12(sp)
8040e1a8:	00912223          	sw	s1,4(sp)
8040e1ac:	01212023          	sw	s2,0(sp)
8040e1b0:	0a805263          	blez	s0,8040e254 <inode_open_dec+0xbc>
8040e1b4:	fff40413          	addi	s0,s0,-1
8040e1b8:	02852a23          	sw	s0,52(a0)
8040e1bc:	00050493          	mv	s1,a0
8040e1c0:	02041663          	bnez	s0,8040e1ec <inode_open_dec+0x54>
8040e1c4:	03c52783          	lw	a5,60(a0)
8040e1c8:	06078663          	beqz	a5,8040e234 <inode_open_dec+0x9c>
8040e1cc:	0087a903          	lw	s2,8(a5)
8040e1d0:	06090263          	beqz	s2,8040e234 <inode_open_dec+0x9c>
8040e1d4:	00008597          	auipc	a1,0x8
8040e1d8:	b9458593          	addi	a1,a1,-1132 # 80415d68 <syscalls+0x5c4>
8040e1dc:	e0dff0ef          	jal	ra,8040dfe8 <inode_check>
8040e1e0:	00048513          	mv	a0,s1
8040e1e4:	000900e7          	jalr	s2
8040e1e8:	02051063          	bnez	a0,8040e208 <inode_open_dec+0x70>
8040e1ec:	00040513          	mv	a0,s0
8040e1f0:	00c12083          	lw	ra,12(sp)
8040e1f4:	00812403          	lw	s0,8(sp)
8040e1f8:	00412483          	lw	s1,4(sp)
8040e1fc:	00012903          	lw	s2,0(sp)
8040e200:	01010113          	addi	sp,sp,16
8040e204:	00008067          	ret
8040e208:	00050593          	mv	a1,a0
8040e20c:	00008517          	auipc	a0,0x8
8040e210:	b6450513          	addi	a0,a0,-1180 # 80415d70 <syscalls+0x5cc>
8040e214:	fe9f10ef          	jal	ra,804001fc <cprintf>
8040e218:	00040513          	mv	a0,s0
8040e21c:	00c12083          	lw	ra,12(sp)
8040e220:	00812403          	lw	s0,8(sp)
8040e224:	00412483          	lw	s1,4(sp)
8040e228:	00012903          	lw	s2,0(sp)
8040e22c:	01010113          	addi	sp,sp,16
8040e230:	00008067          	ret
8040e234:	00008697          	auipc	a3,0x8
8040e238:	ae468693          	addi	a3,a3,-1308 # 80415d18 <syscalls+0x574>
8040e23c:	00005617          	auipc	a2,0x5
8040e240:	5a460613          	addi	a2,a2,1444 # 804137e0 <commands+0x1bc>
8040e244:	06100593          	li	a1,97
8040e248:	00008517          	auipc	a0,0x8
8040e24c:	a8450513          	addi	a0,a0,-1404 # 80415ccc <syscalls+0x528>
8040e250:	bd4f20ef          	jal	ra,80400624 <__panic>
8040e254:	00008697          	auipc	a3,0x8
8040e258:	aa868693          	addi	a3,a3,-1368 # 80415cfc <syscalls+0x558>
8040e25c:	00005617          	auipc	a2,0x5
8040e260:	58460613          	addi	a2,a2,1412 # 804137e0 <commands+0x1bc>
8040e264:	05c00593          	li	a1,92
8040e268:	00008517          	auipc	a0,0x8
8040e26c:	a6450513          	addi	a0,a0,-1436 # 80415ccc <syscalls+0x528>
8040e270:	bb4f20ef          	jal	ra,80400624 <__panic>

8040e274 <__alloc_fs>:
8040e274:	ff010113          	addi	sp,sp,-16
8040e278:	00812423          	sw	s0,8(sp)
8040e27c:	00050413          	mv	s0,a0
8040e280:	08000513          	li	a0,128
8040e284:	00112623          	sw	ra,12(sp)
8040e288:	d78f40ef          	jal	ra,80402800 <kmalloc>
8040e28c:	00050463          	beqz	a0,8040e294 <__alloc_fs+0x20>
8040e290:	06852623          	sw	s0,108(a0)
8040e294:	00c12083          	lw	ra,12(sp)
8040e298:	00812403          	lw	s0,8(sp)
8040e29c:	01010113          	addi	sp,sp,16
8040e2a0:	00008067          	ret

8040e2a4 <vfs_init>:
8040e2a4:	ff010113          	addi	sp,sp,-16
8040e2a8:	00100593          	li	a1,1
8040e2ac:	0008d517          	auipc	a0,0x8d
8040e2b0:	4b050513          	addi	a0,a0,1200 # 8049b75c <bootfs_sem>
8040e2b4:	00112623          	sw	ra,12(sp)
8040e2b8:	a9df70ef          	jal	ra,80405d54 <sem_init>
8040e2bc:	00c12083          	lw	ra,12(sp)
8040e2c0:	01010113          	addi	sp,sp,16
8040e2c4:	3900006f          	j	8040e654 <vfs_devlist_init>

8040e2c8 <vfs_set_bootfs>:
8040e2c8:	fe010113          	addi	sp,sp,-32
8040e2cc:	00812c23          	sw	s0,24(sp)
8040e2d0:	00112e23          	sw	ra,28(sp)
8040e2d4:	00912a23          	sw	s1,20(sp)
8040e2d8:	00012623          	sw	zero,12(sp)
8040e2dc:	00050413          	mv	s0,a0
8040e2e0:	04050a63          	beqz	a0,8040e334 <vfs_set_bootfs+0x6c>
8040e2e4:	03a00593          	li	a1,58
8040e2e8:	09c050ef          	jal	ra,80413384 <strchr>
8040e2ec:	08050e63          	beqz	a0,8040e388 <vfs_set_bootfs+0xc0>
8040e2f0:	00154783          	lbu	a5,1(a0)
8040e2f4:	08079a63          	bnez	a5,8040e388 <vfs_set_bootfs+0xc0>
8040e2f8:	00040513          	mv	a0,s0
8040e2fc:	509000ef          	jal	ra,8040f004 <vfs_chdir>
8040e300:	00050413          	mv	s0,a0
8040e304:	00050e63          	beqz	a0,8040e320 <vfs_set_bootfs+0x58>
8040e308:	00040513          	mv	a0,s0
8040e30c:	01c12083          	lw	ra,28(sp)
8040e310:	01812403          	lw	s0,24(sp)
8040e314:	01412483          	lw	s1,20(sp)
8040e318:	02010113          	addi	sp,sp,32
8040e31c:	00008067          	ret
8040e320:	00c10513          	addi	a0,sp,12
8040e324:	375000ef          	jal	ra,8040ee98 <vfs_get_curdir>
8040e328:	00050413          	mv	s0,a0
8040e32c:	fc051ee3          	bnez	a0,8040e308 <vfs_set_bootfs+0x40>
8040e330:	00c12403          	lw	s0,12(sp)
8040e334:	0008d517          	auipc	a0,0x8d
8040e338:	42850513          	addi	a0,a0,1064 # 8049b75c <bootfs_sem>
8040e33c:	a29f70ef          	jal	ra,80405d64 <down>
8040e340:	0008e797          	auipc	a5,0x8e
8040e344:	49078793          	addi	a5,a5,1168 # 8049c7d0 <bootfs_node>
8040e348:	0007a483          	lw	s1,0(a5)
8040e34c:	0008d517          	auipc	a0,0x8d
8040e350:	41050513          	addi	a0,a0,1040 # 8049b75c <bootfs_sem>
8040e354:	0008e797          	auipc	a5,0x8e
8040e358:	4687ae23          	sw	s0,1148(a5) # 8049c7d0 <bootfs_node>
8040e35c:	00000413          	li	s0,0
8040e360:	a01f70ef          	jal	ra,80405d60 <up>
8040e364:	fa0482e3          	beqz	s1,8040e308 <vfs_set_bootfs+0x40>
8040e368:	00048513          	mv	a0,s1
8040e36c:	d49ff0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040e370:	00040513          	mv	a0,s0
8040e374:	01c12083          	lw	ra,28(sp)
8040e378:	01812403          	lw	s0,24(sp)
8040e37c:	01412483          	lw	s1,20(sp)
8040e380:	02010113          	addi	sp,sp,32
8040e384:	00008067          	ret
8040e388:	ffd00413          	li	s0,-3
8040e38c:	f7dff06f          	j	8040e308 <vfs_set_bootfs+0x40>

8040e390 <vfs_get_bootfs>:
8040e390:	ff010113          	addi	sp,sp,-16
8040e394:	00912223          	sw	s1,4(sp)
8040e398:	0008e497          	auipc	s1,0x8e
8040e39c:	43848493          	addi	s1,s1,1080 # 8049c7d0 <bootfs_node>
8040e3a0:	0004a783          	lw	a5,0(s1)
8040e3a4:	00112623          	sw	ra,12(sp)
8040e3a8:	00812423          	sw	s0,8(sp)
8040e3ac:	04078c63          	beqz	a5,8040e404 <vfs_get_bootfs+0x74>
8040e3b0:	00050413          	mv	s0,a0
8040e3b4:	0008d517          	auipc	a0,0x8d
8040e3b8:	3a850513          	addi	a0,a0,936 # 8049b75c <bootfs_sem>
8040e3bc:	9a9f70ef          	jal	ra,80405d64 <down>
8040e3c0:	0004a483          	lw	s1,0(s1)
8040e3c4:	02048a63          	beqz	s1,8040e3f8 <vfs_get_bootfs+0x68>
8040e3c8:	00048513          	mv	a0,s1
8040e3cc:	bf5ff0ef          	jal	ra,8040dfc0 <inode_ref_inc>
8040e3d0:	0008d517          	auipc	a0,0x8d
8040e3d4:	38c50513          	addi	a0,a0,908 # 8049b75c <bootfs_sem>
8040e3d8:	989f70ef          	jal	ra,80405d60 <up>
8040e3dc:	00000513          	li	a0,0
8040e3e0:	00942023          	sw	s1,0(s0)
8040e3e4:	00c12083          	lw	ra,12(sp)
8040e3e8:	00812403          	lw	s0,8(sp)
8040e3ec:	00412483          	lw	s1,4(sp)
8040e3f0:	01010113          	addi	sp,sp,16
8040e3f4:	00008067          	ret
8040e3f8:	0008d517          	auipc	a0,0x8d
8040e3fc:	36450513          	addi	a0,a0,868 # 8049b75c <bootfs_sem>
8040e400:	961f70ef          	jal	ra,80405d60 <up>
8040e404:	ff000513          	li	a0,-16
8040e408:	fddff06f          	j	8040e3e4 <vfs_get_bootfs+0x54>

8040e40c <vfs_do_add>:
8040e40c:	fe010113          	addi	sp,sp,-32
8040e410:	00112e23          	sw	ra,28(sp)
8040e414:	00812c23          	sw	s0,24(sp)
8040e418:	00912a23          	sw	s1,20(sp)
8040e41c:	01212823          	sw	s2,16(sp)
8040e420:	01312623          	sw	s3,12(sp)
8040e424:	01412423          	sw	s4,8(sp)
8040e428:	01512223          	sw	s5,4(sp)
8040e42c:	01612023          	sw	s6,0(sp)
8040e430:	14050863          	beqz	a0,8040e580 <vfs_do_add+0x174>
8040e434:	00050413          	mv	s0,a0
8040e438:	00058a13          	mv	s4,a1
8040e43c:	00060b13          	mv	s6,a2
8040e440:	00068a93          	mv	s5,a3
8040e444:	0e058663          	beqz	a1,8040e530 <vfs_do_add+0x124>
8040e448:	02c5a703          	lw	a4,44(a1)
8040e44c:	000017b7          	lui	a5,0x1
8040e450:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e454:	0ef71063          	bne	a4,a5,8040e534 <vfs_do_add+0x128>
8040e458:	00040513          	mv	a0,s0
8040e45c:	671040ef          	jal	ra,804132cc <strlen>
8040e460:	01f00793          	li	a5,31
8040e464:	10a7e663          	bltu	a5,a0,8040e570 <vfs_do_add+0x164>
8040e468:	00040513          	mv	a0,s0
8040e46c:	e11f10ef          	jal	ra,8040027c <strdup>
8040e470:	00050493          	mv	s1,a0
8040e474:	10050263          	beqz	a0,8040e578 <vfs_do_add+0x16c>
8040e478:	01800513          	li	a0,24
8040e47c:	b84f40ef          	jal	ra,80402800 <kmalloc>
8040e480:	00050993          	mv	s3,a0
8040e484:	08050e63          	beqz	a0,8040e520 <vfs_do_add+0x114>
8040e488:	0008d517          	auipc	a0,0x8d
8040e48c:	2e050513          	addi	a0,a0,736 # 8049b768 <vdev_list_sem>
8040e490:	0008e917          	auipc	s2,0x8e
8040e494:	34490913          	addi	s2,s2,836 # 8049c7d4 <vdev_list>
8040e498:	8cdf70ef          	jal	ra,80405d64 <down>
8040e49c:	00090413          	mv	s0,s2
8040e4a0:	0140006f          	j	8040e4b4 <vfs_do_add+0xa8>
8040e4a4:	ff042503          	lw	a0,-16(s0)
8040e4a8:	00048593          	mv	a1,s1
8040e4ac:	6a9040ef          	jal	ra,80413354 <strcmp>
8040e4b0:	0a050263          	beqz	a0,8040e554 <vfs_do_add+0x148>
8040e4b4:	00442403          	lw	s0,4(s0)
8040e4b8:	ff2416e3          	bne	s0,s2,8040e4a4 <vfs_do_add+0x98>
8040e4bc:	00442703          	lw	a4,4(s0)
8040e4c0:	01098793          	addi	a5,s3,16
8040e4c4:	0099a023          	sw	s1,0(s3)
8040e4c8:	0149a223          	sw	s4,4(s3)
8040e4cc:	0159a623          	sw	s5,12(s3)
8040e4d0:	0169a423          	sw	s6,8(s3)
8040e4d4:	00f72023          	sw	a5,0(a4)
8040e4d8:	0089a823          	sw	s0,16(s3)
8040e4dc:	00e9aa23          	sw	a4,20(s3)
8040e4e0:	0008d517          	auipc	a0,0x8d
8040e4e4:	28850513          	addi	a0,a0,648 # 8049b768 <vdev_list_sem>
8040e4e8:	00f42223          	sw	a5,4(s0)
8040e4ec:	00000413          	li	s0,0
8040e4f0:	871f70ef          	jal	ra,80405d60 <up>
8040e4f4:	00040513          	mv	a0,s0
8040e4f8:	01c12083          	lw	ra,28(sp)
8040e4fc:	01812403          	lw	s0,24(sp)
8040e500:	01412483          	lw	s1,20(sp)
8040e504:	01012903          	lw	s2,16(sp)
8040e508:	00c12983          	lw	s3,12(sp)
8040e50c:	00812a03          	lw	s4,8(sp)
8040e510:	00412a83          	lw	s5,4(sp)
8040e514:	00012b03          	lw	s6,0(sp)
8040e518:	02010113          	addi	sp,sp,32
8040e51c:	00008067          	ret
8040e520:	ffc00413          	li	s0,-4
8040e524:	00048513          	mv	a0,s1
8040e528:	bfcf40ef          	jal	ra,80402924 <kfree>
8040e52c:	fc9ff06f          	j	8040e4f4 <vfs_do_add+0xe8>
8040e530:	f20684e3          	beqz	a3,8040e458 <vfs_do_add+0x4c>
8040e534:	00008697          	auipc	a3,0x8
8040e538:	91868693          	addi	a3,a3,-1768 # 80415e4c <syscalls+0x6a8>
8040e53c:	00005617          	auipc	a2,0x5
8040e540:	2a460613          	addi	a2,a2,676 # 804137e0 <commands+0x1bc>
8040e544:	08f00593          	li	a1,143
8040e548:	00008517          	auipc	a0,0x8
8040e54c:	8ec50513          	addi	a0,a0,-1812 # 80415e34 <syscalls+0x690>
8040e550:	8d4f20ef          	jal	ra,80400624 <__panic>
8040e554:	0008d517          	auipc	a0,0x8d
8040e558:	21450513          	addi	a0,a0,532 # 8049b768 <vdev_list_sem>
8040e55c:	805f70ef          	jal	ra,80405d60 <up>
8040e560:	00098513          	mv	a0,s3
8040e564:	bc0f40ef          	jal	ra,80402924 <kfree>
8040e568:	fe900413          	li	s0,-23
8040e56c:	fb9ff06f          	j	8040e524 <vfs_do_add+0x118>
8040e570:	ff400413          	li	s0,-12
8040e574:	f81ff06f          	j	8040e4f4 <vfs_do_add+0xe8>
8040e578:	ffc00413          	li	s0,-4
8040e57c:	f79ff06f          	j	8040e4f4 <vfs_do_add+0xe8>
8040e580:	00008697          	auipc	a3,0x8
8040e584:	8a468693          	addi	a3,a3,-1884 # 80415e24 <syscalls+0x680>
8040e588:	00005617          	auipc	a2,0x5
8040e58c:	25860613          	addi	a2,a2,600 # 804137e0 <commands+0x1bc>
8040e590:	08e00593          	li	a1,142
8040e594:	00008517          	auipc	a0,0x8
8040e598:	8a050513          	addi	a0,a0,-1888 # 80415e34 <syscalls+0x690>
8040e59c:	888f20ef          	jal	ra,80400624 <__panic>

8040e5a0 <find_mount>:
8040e5a0:	fe010113          	addi	sp,sp,-32
8040e5a4:	00812c23          	sw	s0,24(sp)
8040e5a8:	00912a23          	sw	s1,20(sp)
8040e5ac:	01212823          	sw	s2,16(sp)
8040e5b0:	01312623          	sw	s3,12(sp)
8040e5b4:	0008e497          	auipc	s1,0x8e
8040e5b8:	22048493          	addi	s1,s1,544 # 8049c7d4 <vdev_list>
8040e5bc:	00112e23          	sw	ra,28(sp)
8040e5c0:	00050913          	mv	s2,a0
8040e5c4:	00058993          	mv	s3,a1
8040e5c8:	00048413          	mv	s0,s1
8040e5cc:	06050463          	beqz	a0,8040e634 <find_mount+0x94>
8040e5d0:	00442403          	lw	s0,4(s0)
8040e5d4:	04940063          	beq	s0,s1,8040e614 <find_mount+0x74>
8040e5d8:	ffc42783          	lw	a5,-4(s0)
8040e5dc:	fe078ae3          	beqz	a5,8040e5d0 <find_mount+0x30>
8040e5e0:	ff042503          	lw	a0,-16(s0)
8040e5e4:	00090593          	mv	a1,s2
8040e5e8:	56d040ef          	jal	ra,80413354 <strcmp>
8040e5ec:	fe0512e3          	bnez	a0,8040e5d0 <find_mount+0x30>
8040e5f0:	ff040413          	addi	s0,s0,-16
8040e5f4:	0089a023          	sw	s0,0(s3)
8040e5f8:	01c12083          	lw	ra,28(sp)
8040e5fc:	01812403          	lw	s0,24(sp)
8040e600:	01412483          	lw	s1,20(sp)
8040e604:	01012903          	lw	s2,16(sp)
8040e608:	00c12983          	lw	s3,12(sp)
8040e60c:	02010113          	addi	sp,sp,32
8040e610:	00008067          	ret
8040e614:	01c12083          	lw	ra,28(sp)
8040e618:	01812403          	lw	s0,24(sp)
8040e61c:	01412483          	lw	s1,20(sp)
8040e620:	01012903          	lw	s2,16(sp)
8040e624:	00c12983          	lw	s3,12(sp)
8040e628:	ff300513          	li	a0,-13
8040e62c:	02010113          	addi	sp,sp,32
8040e630:	00008067          	ret
8040e634:	00007697          	auipc	a3,0x7
8040e638:	7f068693          	addi	a3,a3,2032 # 80415e24 <syscalls+0x680>
8040e63c:	00005617          	auipc	a2,0x5
8040e640:	1a460613          	addi	a2,a2,420 # 804137e0 <commands+0x1bc>
8040e644:	0cd00593          	li	a1,205
8040e648:	00007517          	auipc	a0,0x7
8040e64c:	7ec50513          	addi	a0,a0,2028 # 80415e34 <syscalls+0x690>
8040e650:	fd5f10ef          	jal	ra,80400624 <__panic>

8040e654 <vfs_devlist_init>:
8040e654:	0008e797          	auipc	a5,0x8e
8040e658:	18078793          	addi	a5,a5,384 # 8049c7d4 <vdev_list>
8040e65c:	00100593          	li	a1,1
8040e660:	0008d517          	auipc	a0,0x8d
8040e664:	10850513          	addi	a0,a0,264 # 8049b768 <vdev_list_sem>
8040e668:	00f7a223          	sw	a5,4(a5)
8040e66c:	00f7a023          	sw	a5,0(a5)
8040e670:	ee4f706f          	j	80405d54 <sem_init>

8040e674 <vfs_cleanup>:
8040e674:	ff010113          	addi	sp,sp,-16
8040e678:	00912223          	sw	s1,4(sp)
8040e67c:	0008e497          	auipc	s1,0x8e
8040e680:	15848493          	addi	s1,s1,344 # 8049c7d4 <vdev_list>
8040e684:	0044a783          	lw	a5,4(s1)
8040e688:	00112623          	sw	ra,12(sp)
8040e68c:	00812423          	sw	s0,8(sp)
8040e690:	04978a63          	beq	a5,s1,8040e6e4 <vfs_cleanup+0x70>
8040e694:	0008d517          	auipc	a0,0x8d
8040e698:	0d450513          	addi	a0,a0,212 # 8049b768 <vdev_list_sem>
8040e69c:	ec8f70ef          	jal	ra,80405d64 <down>
8040e6a0:	00048413          	mv	s0,s1
8040e6a4:	00442403          	lw	s0,4(s0)
8040e6a8:	02940063          	beq	s0,s1,8040e6c8 <vfs_cleanup+0x54>
8040e6ac:	ff842783          	lw	a5,-8(s0)
8040e6b0:	00078513          	mv	a0,a5
8040e6b4:	fe0788e3          	beqz	a5,8040e6a4 <vfs_cleanup+0x30>
8040e6b8:	07c7a783          	lw	a5,124(a5)
8040e6bc:	000780e7          	jalr	a5
8040e6c0:	00442403          	lw	s0,4(s0)
8040e6c4:	fe9414e3          	bne	s0,s1,8040e6ac <vfs_cleanup+0x38>
8040e6c8:	00812403          	lw	s0,8(sp)
8040e6cc:	00c12083          	lw	ra,12(sp)
8040e6d0:	00412483          	lw	s1,4(sp)
8040e6d4:	0008d517          	auipc	a0,0x8d
8040e6d8:	09450513          	addi	a0,a0,148 # 8049b768 <vdev_list_sem>
8040e6dc:	01010113          	addi	sp,sp,16
8040e6e0:	e80f706f          	j	80405d60 <up>
8040e6e4:	00c12083          	lw	ra,12(sp)
8040e6e8:	00812403          	lw	s0,8(sp)
8040e6ec:	00412483          	lw	s1,4(sp)
8040e6f0:	01010113          	addi	sp,sp,16
8040e6f4:	00008067          	ret

8040e6f8 <vfs_get_root>:
8040e6f8:	fe010113          	addi	sp,sp,-32
8040e6fc:	00112e23          	sw	ra,28(sp)
8040e700:	00812c23          	sw	s0,24(sp)
8040e704:	00912a23          	sw	s1,20(sp)
8040e708:	01212823          	sw	s2,16(sp)
8040e70c:	01312623          	sw	s3,12(sp)
8040e710:	01412423          	sw	s4,8(sp)
8040e714:	0c050263          	beqz	a0,8040e7d8 <vfs_get_root+0xe0>
8040e718:	0008e917          	auipc	s2,0x8e
8040e71c:	0bc90913          	addi	s2,s2,188 # 8049c7d4 <vdev_list>
8040e720:	00492783          	lw	a5,4(s2)
8040e724:	0b278663          	beq	a5,s2,8040e7d0 <vfs_get_root+0xd8>
8040e728:	00050993          	mv	s3,a0
8040e72c:	0008d517          	auipc	a0,0x8d
8040e730:	03c50513          	addi	a0,a0,60 # 8049b768 <vdev_list_sem>
8040e734:	00058a13          	mv	s4,a1
8040e738:	00090413          	mv	s0,s2
8040e73c:	e28f70ef          	jal	ra,80405d64 <down>
8040e740:	0180006f          	j	8040e758 <vfs_get_root+0x60>
8040e744:	ff042583          	lw	a1,-16(s0)
8040e748:	00098513          	mv	a0,s3
8040e74c:	409040ef          	jal	ra,80413354 <strcmp>
8040e750:	00050493          	mv	s1,a0
8040e754:	04050063          	beqz	a0,8040e794 <vfs_get_root+0x9c>
8040e758:	00442403          	lw	s0,4(s0)
8040e75c:	ff2414e3          	bne	s0,s2,8040e744 <vfs_get_root+0x4c>
8040e760:	ff300493          	li	s1,-13
8040e764:	0008d517          	auipc	a0,0x8d
8040e768:	00450513          	addi	a0,a0,4 # 8049b768 <vdev_list_sem>
8040e76c:	df4f70ef          	jal	ra,80405d60 <up>
8040e770:	01c12083          	lw	ra,28(sp)
8040e774:	01812403          	lw	s0,24(sp)
8040e778:	00048513          	mv	a0,s1
8040e77c:	01012903          	lw	s2,16(sp)
8040e780:	01412483          	lw	s1,20(sp)
8040e784:	00c12983          	lw	s3,12(sp)
8040e788:	00812a03          	lw	s4,8(sp)
8040e78c:	02010113          	addi	sp,sp,32
8040e790:	00008067          	ret
8040e794:	ff842503          	lw	a0,-8(s0)
8040e798:	00050c63          	beqz	a0,8040e7b0 <vfs_get_root+0xb8>
8040e79c:	07452783          	lw	a5,116(a0)
8040e7a0:	000780e7          	jalr	a5
8040e7a4:	00050a63          	beqz	a0,8040e7b8 <vfs_get_root+0xc0>
8040e7a8:	00aa2023          	sw	a0,0(s4)
8040e7ac:	fb9ff06f          	j	8040e764 <vfs_get_root+0x6c>
8040e7b0:	ffc42783          	lw	a5,-4(s0)
8040e7b4:	00078663          	beqz	a5,8040e7c0 <vfs_get_root+0xc8>
8040e7b8:	ff200493          	li	s1,-14
8040e7bc:	fa9ff06f          	j	8040e764 <vfs_get_root+0x6c>
8040e7c0:	ff442503          	lw	a0,-12(s0)
8040e7c4:	ffcff0ef          	jal	ra,8040dfc0 <inode_ref_inc>
8040e7c8:	ff442503          	lw	a0,-12(s0)
8040e7cc:	fd9ff06f          	j	8040e7a4 <vfs_get_root+0xac>
8040e7d0:	ff300493          	li	s1,-13
8040e7d4:	f9dff06f          	j	8040e770 <vfs_get_root+0x78>
8040e7d8:	00007697          	auipc	a3,0x7
8040e7dc:	64c68693          	addi	a3,a3,1612 # 80415e24 <syscalls+0x680>
8040e7e0:	00005617          	auipc	a2,0x5
8040e7e4:	00060613          	mv	a2,a2
8040e7e8:	04500593          	li	a1,69
8040e7ec:	00007517          	auipc	a0,0x7
8040e7f0:	64850513          	addi	a0,a0,1608 # 80415e34 <syscalls+0x690>
8040e7f4:	e31f10ef          	jal	ra,80400624 <__panic>

8040e7f8 <vfs_get_devname>:
8040e7f8:	0008e697          	auipc	a3,0x8e
8040e7fc:	fdc68693          	addi	a3,a3,-36 # 8049c7d4 <vdev_list>
8040e800:	00068793          	mv	a5,a3
8040e804:	00051863          	bnez	a0,8040e814 <vfs_get_devname+0x1c>
8040e808:	0240006f          	j	8040e82c <vfs_get_devname+0x34>
8040e80c:	ff87a703          	lw	a4,-8(a5)
8040e810:	00a70a63          	beq	a4,a0,8040e824 <vfs_get_devname+0x2c>
8040e814:	0047a783          	lw	a5,4(a5)
8040e818:	fed79ae3          	bne	a5,a3,8040e80c <vfs_get_devname+0x14>
8040e81c:	00000513          	li	a0,0
8040e820:	00008067          	ret
8040e824:	ff07a503          	lw	a0,-16(a5)
8040e828:	00008067          	ret
8040e82c:	ff010113          	addi	sp,sp,-16
8040e830:	00007697          	auipc	a3,0x7
8040e834:	67868693          	addi	a3,a3,1656 # 80415ea8 <syscalls+0x704>
8040e838:	00005617          	auipc	a2,0x5
8040e83c:	fa860613          	addi	a2,a2,-88 # 804137e0 <commands+0x1bc>
8040e840:	06a00593          	li	a1,106
8040e844:	00007517          	auipc	a0,0x7
8040e848:	5f050513          	addi	a0,a0,1520 # 80415e34 <syscalls+0x690>
8040e84c:	00112623          	sw	ra,12(sp)
8040e850:	dd5f10ef          	jal	ra,80400624 <__panic>

8040e854 <vfs_add_dev>:
8040e854:	00060693          	mv	a3,a2
8040e858:	00000613          	li	a2,0
8040e85c:	bb1ff06f          	j	8040e40c <vfs_do_add>

8040e860 <vfs_mount>:
8040e860:	fe010113          	addi	sp,sp,-32
8040e864:	00812c23          	sw	s0,24(sp)
8040e868:	00050413          	mv	s0,a0
8040e86c:	0008d517          	auipc	a0,0x8d
8040e870:	efc50513          	addi	a0,a0,-260 # 8049b768 <vdev_list_sem>
8040e874:	00112e23          	sw	ra,28(sp)
8040e878:	00912a23          	sw	s1,20(sp)
8040e87c:	00058493          	mv	s1,a1
8040e880:	ce4f70ef          	jal	ra,80405d64 <down>
8040e884:	00040513          	mv	a0,s0
8040e888:	00c10593          	addi	a1,sp,12
8040e88c:	d15ff0ef          	jal	ra,8040e5a0 <find_mount>
8040e890:	00050413          	mv	s0,a0
8040e894:	06051263          	bnez	a0,8040e8f8 <vfs_mount+0x98>
8040e898:	00c12583          	lw	a1,12(sp)
8040e89c:	0085a783          	lw	a5,8(a1)
8040e8a0:	06079e63          	bnez	a5,8040e91c <vfs_mount+0xbc>
8040e8a4:	0005a783          	lw	a5,0(a1)
8040e8a8:	08078e63          	beqz	a5,8040e944 <vfs_mount+0xe4>
8040e8ac:	00c5a783          	lw	a5,12(a1)
8040e8b0:	08078a63          	beqz	a5,8040e944 <vfs_mount+0xe4>
8040e8b4:	0045a503          	lw	a0,4(a1)
8040e8b8:	06050663          	beqz	a0,8040e924 <vfs_mount+0xc4>
8040e8bc:	02c52703          	lw	a4,44(a0)
8040e8c0:	000017b7          	lui	a5,0x1
8040e8c4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e8c8:	04f71e63          	bne	a4,a5,8040e924 <vfs_mount+0xc4>
8040e8cc:	00858593          	addi	a1,a1,8
8040e8d0:	000480e7          	jalr	s1
8040e8d4:	00050413          	mv	s0,a0
8040e8d8:	02051063          	bnez	a0,8040e8f8 <vfs_mount+0x98>
8040e8dc:	00c12783          	lw	a5,12(sp)
8040e8e0:	0087a703          	lw	a4,8(a5)
8040e8e4:	08070063          	beqz	a4,8040e964 <vfs_mount+0x104>
8040e8e8:	0007a583          	lw	a1,0(a5)
8040e8ec:	00007517          	auipc	a0,0x7
8040e8f0:	63c50513          	addi	a0,a0,1596 # 80415f28 <syscalls+0x784>
8040e8f4:	909f10ef          	jal	ra,804001fc <cprintf>
8040e8f8:	0008d517          	auipc	a0,0x8d
8040e8fc:	e7050513          	addi	a0,a0,-400 # 8049b768 <vdev_list_sem>
8040e900:	c60f70ef          	jal	ra,80405d60 <up>
8040e904:	00040513          	mv	a0,s0
8040e908:	01c12083          	lw	ra,28(sp)
8040e90c:	01812403          	lw	s0,24(sp)
8040e910:	01412483          	lw	s1,20(sp)
8040e914:	02010113          	addi	sp,sp,32
8040e918:	00008067          	ret
8040e91c:	ff100413          	li	s0,-15
8040e920:	fd9ff06f          	j	8040e8f8 <vfs_mount+0x98>
8040e924:	00007697          	auipc	a3,0x7
8040e928:	5bc68693          	addi	a3,a3,1468 # 80415ee0 <syscalls+0x73c>
8040e92c:	00005617          	auipc	a2,0x5
8040e930:	eb460613          	addi	a2,a2,-332 # 804137e0 <commands+0x1bc>
8040e934:	0ed00593          	li	a1,237
8040e938:	00007517          	auipc	a0,0x7
8040e93c:	4fc50513          	addi	a0,a0,1276 # 80415e34 <syscalls+0x690>
8040e940:	ce5f10ef          	jal	ra,80400624 <__panic>
8040e944:	00007697          	auipc	a3,0x7
8040e948:	57068693          	addi	a3,a3,1392 # 80415eb4 <syscalls+0x710>
8040e94c:	00005617          	auipc	a2,0x5
8040e950:	e9460613          	addi	a2,a2,-364 # 804137e0 <commands+0x1bc>
8040e954:	0eb00593          	li	a1,235
8040e958:	00007517          	auipc	a0,0x7
8040e95c:	4dc50513          	addi	a0,a0,1244 # 80415e34 <syscalls+0x690>
8040e960:	cc5f10ef          	jal	ra,80400624 <__panic>
8040e964:	00007697          	auipc	a3,0x7
8040e968:	5b068693          	addi	a3,a3,1456 # 80415f14 <syscalls+0x770>
8040e96c:	00005617          	auipc	a2,0x5
8040e970:	e7460613          	addi	a2,a2,-396 # 804137e0 <commands+0x1bc>
8040e974:	0ef00593          	li	a1,239
8040e978:	00007517          	auipc	a0,0x7
8040e97c:	4bc50513          	addi	a0,a0,1212 # 80415e34 <syscalls+0x690>
8040e980:	ca5f10ef          	jal	ra,80400624 <__panic>

8040e984 <vfs_open>:
8040e984:	fd010113          	addi	sp,sp,-48
8040e988:	02112623          	sw	ra,44(sp)
8040e98c:	02812423          	sw	s0,40(sp)
8040e990:	02912223          	sw	s1,36(sp)
8040e994:	03212023          	sw	s2,32(sp)
8040e998:	01312e23          	sw	s3,28(sp)
8040e99c:	01412c23          	sw	s4,24(sp)
8040e9a0:	01512a23          	sw	s5,20(sp)
8040e9a4:	0035f793          	andi	a5,a1,3
8040e9a8:	16078e63          	beqz	a5,8040eb24 <vfs_open+0x1a0>
8040e9ac:	00200713          	li	a4,2
8040e9b0:	0cf76c63          	bltu	a4,a5,8040ea88 <vfs_open+0x104>
8040e9b4:	0105fa93          	andi	s5,a1,16
8040e9b8:	00058493          	mv	s1,a1
8040e9bc:	00410593          	addi	a1,sp,4
8040e9c0:	00060993          	mv	s3,a2
8040e9c4:	00050913          	mv	s2,a0
8040e9c8:	39c000ef          	jal	ra,8040ed64 <vfs_lookup>
8040e9cc:	00050413          	mv	s0,a0
8040e9d0:	0044fa13          	andi	s4,s1,4
8040e9d4:	0e051063          	bnez	a0,8040eab4 <vfs_open+0x130>
8040e9d8:	00c4f793          	andi	a5,s1,12
8040e9dc:	00c00713          	li	a4,12
8040e9e0:	16e78663          	beq	a5,a4,8040eb4c <vfs_open+0x1c8>
8040e9e4:	00412403          	lw	s0,4(sp)
8040e9e8:	1a040663          	beqz	s0,8040eb94 <vfs_open+0x210>
8040e9ec:	03c42783          	lw	a5,60(s0)
8040e9f0:	16078263          	beqz	a5,8040eb54 <vfs_open+0x1d0>
8040e9f4:	0047a783          	lw	a5,4(a5)
8040e9f8:	14078e63          	beqz	a5,8040eb54 <vfs_open+0x1d0>
8040e9fc:	00040513          	mv	a0,s0
8040ea00:	00007597          	auipc	a1,0x7
8040ea04:	60858593          	addi	a1,a1,1544 # 80416008 <syscalls+0x864>
8040ea08:	de0ff0ef          	jal	ra,8040dfe8 <inode_check>
8040ea0c:	03c42783          	lw	a5,60(s0)
8040ea10:	00412503          	lw	a0,4(sp)
8040ea14:	00048593          	mv	a1,s1
8040ea18:	0047a783          	lw	a5,4(a5)
8040ea1c:	000780e7          	jalr	a5
8040ea20:	00050413          	mv	s0,a0
8040ea24:	00412503          	lw	a0,4(sp)
8040ea28:	10041e63          	bnez	s0,8040eb44 <vfs_open+0x1c0>
8040ea2c:	015a6a33          	or	s4,s4,s5
8040ea30:	da4ff0ef          	jal	ra,8040dfd4 <inode_open_inc>
8040ea34:	040a0463          	beqz	s4,8040ea7c <vfs_open+0xf8>
8040ea38:	00412483          	lw	s1,4(sp)
8040ea3c:	12048c63          	beqz	s1,8040eb74 <vfs_open+0x1f0>
8040ea40:	03c4a783          	lw	a5,60(s1)
8040ea44:	12078863          	beqz	a5,8040eb74 <vfs_open+0x1f0>
8040ea48:	0307a783          	lw	a5,48(a5)
8040ea4c:	12078463          	beqz	a5,8040eb74 <vfs_open+0x1f0>
8040ea50:	00007597          	auipc	a1,0x7
8040ea54:	61458593          	addi	a1,a1,1556 # 80416064 <syscalls+0x8c0>
8040ea58:	00048513          	mv	a0,s1
8040ea5c:	d8cff0ef          	jal	ra,8040dfe8 <inode_check>
8040ea60:	03c4a783          	lw	a5,60(s1)
8040ea64:	00412503          	lw	a0,4(sp)
8040ea68:	00000593          	li	a1,0
8040ea6c:	0307a783          	lw	a5,48(a5)
8040ea70:	000780e7          	jalr	a5
8040ea74:	00050793          	mv	a5,a0
8040ea78:	0a051e63          	bnez	a0,8040eb34 <vfs_open+0x1b0>
8040ea7c:	00412783          	lw	a5,4(sp)
8040ea80:	00f9a023          	sw	a5,0(s3)
8040ea84:	0080006f          	j	8040ea8c <vfs_open+0x108>
8040ea88:	ffd00413          	li	s0,-3
8040ea8c:	00040513          	mv	a0,s0
8040ea90:	02c12083          	lw	ra,44(sp)
8040ea94:	02812403          	lw	s0,40(sp)
8040ea98:	02412483          	lw	s1,36(sp)
8040ea9c:	02012903          	lw	s2,32(sp)
8040eaa0:	01c12983          	lw	s3,28(sp)
8040eaa4:	01812a03          	lw	s4,24(sp)
8040eaa8:	01412a83          	lw	s5,20(sp)
8040eaac:	03010113          	addi	sp,sp,48
8040eab0:	00008067          	ret
8040eab4:	ff000793          	li	a5,-16
8040eab8:	fcf51ae3          	bne	a0,a5,8040ea8c <vfs_open+0x108>
8040eabc:	fc0a08e3          	beqz	s4,8040ea8c <vfs_open+0x108>
8040eac0:	00810613          	addi	a2,sp,8
8040eac4:	00c10593          	addi	a1,sp,12
8040eac8:	00090513          	mv	a0,s2
8040eacc:	37c000ef          	jal	ra,8040ee48 <vfs_lookup_parent>
8040ead0:	00050413          	mv	s0,a0
8040ead4:	fa051ce3          	bnez	a0,8040ea8c <vfs_open+0x108>
8040ead8:	00c12403          	lw	s0,12(sp)
8040eadc:	0c040c63          	beqz	s0,8040ebb4 <vfs_open+0x230>
8040eae0:	03c42783          	lw	a5,60(s0)
8040eae4:	0c078863          	beqz	a5,8040ebb4 <vfs_open+0x230>
8040eae8:	0347a783          	lw	a5,52(a5)
8040eaec:	0c078463          	beqz	a5,8040ebb4 <vfs_open+0x230>
8040eaf0:	00040513          	mv	a0,s0
8040eaf4:	00007597          	auipc	a1,0x7
8040eaf8:	4ac58593          	addi	a1,a1,1196 # 80415fa0 <syscalls+0x7fc>
8040eafc:	cecff0ef          	jal	ra,8040dfe8 <inode_check>
8040eb00:	03c42783          	lw	a5,60(s0)
8040eb04:	00812583          	lw	a1,8(sp)
8040eb08:	00c12503          	lw	a0,12(sp)
8040eb0c:	0347a783          	lw	a5,52(a5)
8040eb10:	0034d613          	srli	a2,s1,0x3
8040eb14:	00410693          	addi	a3,sp,4
8040eb18:	00167613          	andi	a2,a2,1
8040eb1c:	000780e7          	jalr	a5
8040eb20:	ec5ff06f          	j	8040e9e4 <vfs_open+0x60>
8040eb24:	0105fa93          	andi	s5,a1,16
8040eb28:	ffd00413          	li	s0,-3
8040eb2c:	f60a90e3          	bnez	s5,8040ea8c <vfs_open+0x108>
8040eb30:	e89ff06f          	j	8040e9b8 <vfs_open+0x34>
8040eb34:	00412503          	lw	a0,4(sp)
8040eb38:	00078413          	mv	s0,a5
8040eb3c:	e5cff0ef          	jal	ra,8040e198 <inode_open_dec>
8040eb40:	00412503          	lw	a0,4(sp)
8040eb44:	d70ff0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040eb48:	f45ff06f          	j	8040ea8c <vfs_open+0x108>
8040eb4c:	fe900413          	li	s0,-23
8040eb50:	f3dff06f          	j	8040ea8c <vfs_open+0x108>
8040eb54:	00007697          	auipc	a3,0x7
8040eb58:	46468693          	addi	a3,a3,1124 # 80415fb8 <syscalls+0x814>
8040eb5c:	00005617          	auipc	a2,0x5
8040eb60:	c8460613          	addi	a2,a2,-892 # 804137e0 <commands+0x1bc>
8040eb64:	03300593          	li	a1,51
8040eb68:	00007517          	auipc	a0,0x7
8040eb6c:	42050513          	addi	a0,a0,1056 # 80415f88 <syscalls+0x7e4>
8040eb70:	ab5f10ef          	jal	ra,80400624 <__panic>
8040eb74:	00007697          	auipc	a3,0x7
8040eb78:	49c68693          	addi	a3,a3,1180 # 80416010 <syscalls+0x86c>
8040eb7c:	00005617          	auipc	a2,0x5
8040eb80:	c6460613          	addi	a2,a2,-924 # 804137e0 <commands+0x1bc>
8040eb84:	03a00593          	li	a1,58
8040eb88:	00007517          	auipc	a0,0x7
8040eb8c:	40050513          	addi	a0,a0,1024 # 80415f88 <syscalls+0x7e4>
8040eb90:	a95f10ef          	jal	ra,80400624 <__panic>
8040eb94:	00007697          	auipc	a3,0x7
8040eb98:	41468693          	addi	a3,a3,1044 # 80415fa8 <syscalls+0x804>
8040eb9c:	00005617          	auipc	a2,0x5
8040eba0:	c4460613          	addi	a2,a2,-956 # 804137e0 <commands+0x1bc>
8040eba4:	03100593          	li	a1,49
8040eba8:	00007517          	auipc	a0,0x7
8040ebac:	3e050513          	addi	a0,a0,992 # 80415f88 <syscalls+0x7e4>
8040ebb0:	a75f10ef          	jal	ra,80400624 <__panic>
8040ebb4:	00007697          	auipc	a3,0x7
8040ebb8:	38468693          	addi	a3,a3,900 # 80415f38 <syscalls+0x794>
8040ebbc:	00005617          	auipc	a2,0x5
8040ebc0:	c2460613          	addi	a2,a2,-988 # 804137e0 <commands+0x1bc>
8040ebc4:	02c00593          	li	a1,44
8040ebc8:	00007517          	auipc	a0,0x7
8040ebcc:	3c050513          	addi	a0,a0,960 # 80415f88 <syscalls+0x7e4>
8040ebd0:	a55f10ef          	jal	ra,80400624 <__panic>

8040ebd4 <vfs_close>:
8040ebd4:	ff010113          	addi	sp,sp,-16
8040ebd8:	00112623          	sw	ra,12(sp)
8040ebdc:	00812423          	sw	s0,8(sp)
8040ebe0:	00050413          	mv	s0,a0
8040ebe4:	db4ff0ef          	jal	ra,8040e198 <inode_open_dec>
8040ebe8:	00040513          	mv	a0,s0
8040ebec:	cc8ff0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040ebf0:	00c12083          	lw	ra,12(sp)
8040ebf4:	00812403          	lw	s0,8(sp)
8040ebf8:	00000513          	li	a0,0
8040ebfc:	01010113          	addi	sp,sp,16
8040ec00:	00008067          	ret

8040ec04 <get_device>:
8040ec04:	fe010113          	addi	sp,sp,-32
8040ec08:	00812c23          	sw	s0,24(sp)
8040ec0c:	00912a23          	sw	s1,20(sp)
8040ec10:	01212823          	sw	s2,16(sp)
8040ec14:	00112e23          	sw	ra,28(sp)
8040ec18:	00054783          	lbu	a5,0(a0)
8040ec1c:	00050413          	mv	s0,a0
8040ec20:	00058913          	mv	s2,a1
8040ec24:	00060493          	mv	s1,a2
8040ec28:	04078263          	beqz	a5,8040ec6c <get_device+0x68>
8040ec2c:	03a00713          	li	a4,58
8040ec30:	0ae78463          	beq	a5,a4,8040ecd8 <get_device+0xd4>
8040ec34:	02f00713          	li	a4,47
8040ec38:	0ee78e63          	beq	a5,a4,8040ed34 <get_device+0x130>
8040ec3c:	00150693          	addi	a3,a0,1
8040ec40:	00000793          	li	a5,0
8040ec44:	03a00813          	li	a6,58
8040ec48:	02f00893          	li	a7,47
8040ec4c:	0140006f          	j	8040ec60 <get_device+0x5c>
8040ec50:	05070063          	beq	a4,a6,8040ec90 <get_device+0x8c>
8040ec54:	00168693          	addi	a3,a3,1
8040ec58:	00050793          	mv	a5,a0
8040ec5c:	01170863          	beq	a4,a7,8040ec6c <get_device+0x68>
8040ec60:	0006c703          	lbu	a4,0(a3)
8040ec64:	00178513          	addi	a0,a5,1
8040ec68:	fe0714e3          	bnez	a4,8040ec50 <get_device+0x4c>
8040ec6c:	00892023          	sw	s0,0(s2)
8040ec70:	00048513          	mv	a0,s1
8040ec74:	224000ef          	jal	ra,8040ee98 <vfs_get_curdir>
8040ec78:	01c12083          	lw	ra,28(sp)
8040ec7c:	01812403          	lw	s0,24(sp)
8040ec80:	01412483          	lw	s1,20(sp)
8040ec84:	01012903          	lw	s2,16(sp)
8040ec88:	02010113          	addi	sp,sp,32
8040ec8c:	00008067          	ret
8040ec90:	00278793          	addi	a5,a5,2
8040ec94:	00068023          	sb	zero,0(a3)
8040ec98:	00f407b3          	add	a5,s0,a5
8040ec9c:	02f00693          	li	a3,47
8040eca0:	00078513          	mv	a0,a5
8040eca4:	00178793          	addi	a5,a5,1
8040eca8:	fff7c703          	lbu	a4,-1(a5)
8040ecac:	fed70ae3          	beq	a4,a3,8040eca0 <get_device+0x9c>
8040ecb0:	00a92023          	sw	a0,0(s2)
8040ecb4:	00048593          	mv	a1,s1
8040ecb8:	00040513          	mv	a0,s0
8040ecbc:	a3dff0ef          	jal	ra,8040e6f8 <vfs_get_root>
8040ecc0:	01c12083          	lw	ra,28(sp)
8040ecc4:	01812403          	lw	s0,24(sp)
8040ecc8:	01412483          	lw	s1,20(sp)
8040eccc:	01012903          	lw	s2,16(sp)
8040ecd0:	02010113          	addi	sp,sp,32
8040ecd4:	00008067          	ret
8040ecd8:	00c10513          	addi	a0,sp,12
8040ecdc:	1bc000ef          	jal	ra,8040ee98 <vfs_get_curdir>
8040ece0:	fe0510e3          	bnez	a0,8040ecc0 <get_device+0xbc>
8040ece4:	00c12783          	lw	a5,12(sp)
8040ece8:	0387a503          	lw	a0,56(a5)
8040ecec:	04050c63          	beqz	a0,8040ed44 <get_device+0x140>
8040ecf0:	07452783          	lw	a5,116(a0)
8040ecf4:	000780e7          	jalr	a5
8040ecf8:	00a4a023          	sw	a0,0(s1)
8040ecfc:	00c12503          	lw	a0,12(sp)
8040ed00:	bb4ff0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040ed04:	02f00713          	li	a4,47
8040ed08:	00140413          	addi	s0,s0,1
8040ed0c:	00044783          	lbu	a5,0(s0)
8040ed10:	fee78ce3          	beq	a5,a4,8040ed08 <get_device+0x104>
8040ed14:	00892023          	sw	s0,0(s2)
8040ed18:	01c12083          	lw	ra,28(sp)
8040ed1c:	01812403          	lw	s0,24(sp)
8040ed20:	01412483          	lw	s1,20(sp)
8040ed24:	01012903          	lw	s2,16(sp)
8040ed28:	00000513          	li	a0,0
8040ed2c:	02010113          	addi	sp,sp,32
8040ed30:	00008067          	ret
8040ed34:	00060513          	mv	a0,a2
8040ed38:	e58ff0ef          	jal	ra,8040e390 <vfs_get_bootfs>
8040ed3c:	fc0504e3          	beqz	a0,8040ed04 <get_device+0x100>
8040ed40:	f81ff06f          	j	8040ecc0 <get_device+0xbc>
8040ed44:	00007697          	auipc	a3,0x7
8040ed48:	32c68693          	addi	a3,a3,812 # 80416070 <syscalls+0x8cc>
8040ed4c:	00005617          	auipc	a2,0x5
8040ed50:	a9460613          	addi	a2,a2,-1388 # 804137e0 <commands+0x1bc>
8040ed54:	03900593          	li	a1,57
8040ed58:	00007517          	auipc	a0,0x7
8040ed5c:	32c50513          	addi	a0,a0,812 # 80416084 <syscalls+0x8e0>
8040ed60:	8c5f10ef          	jal	ra,80400624 <__panic>

8040ed64 <vfs_lookup>:
8040ed64:	fd010113          	addi	sp,sp,-48
8040ed68:	03212023          	sw	s2,32(sp)
8040ed6c:	01c10613          	addi	a2,sp,28
8040ed70:	00058913          	mv	s2,a1
8040ed74:	00c10593          	addi	a1,sp,12
8040ed78:	02812423          	sw	s0,40(sp)
8040ed7c:	02112623          	sw	ra,44(sp)
8040ed80:	02912223          	sw	s1,36(sp)
8040ed84:	00a12623          	sw	a0,12(sp)
8040ed88:	e7dff0ef          	jal	ra,8040ec04 <get_device>
8040ed8c:	00050413          	mv	s0,a0
8040ed90:	04051e63          	bnez	a0,8040edec <vfs_lookup+0x88>
8040ed94:	00c12783          	lw	a5,12(sp)
8040ed98:	01c12483          	lw	s1,28(sp)
8040ed9c:	0007c783          	lbu	a5,0(a5)
8040eda0:	06078463          	beqz	a5,8040ee08 <vfs_lookup+0xa4>
8040eda4:	08048263          	beqz	s1,8040ee28 <vfs_lookup+0xc4>
8040eda8:	03c4a783          	lw	a5,60(s1)
8040edac:	06078e63          	beqz	a5,8040ee28 <vfs_lookup+0xc4>
8040edb0:	0387a783          	lw	a5,56(a5)
8040edb4:	06078a63          	beqz	a5,8040ee28 <vfs_lookup+0xc4>
8040edb8:	00048513          	mv	a0,s1
8040edbc:	00007597          	auipc	a1,0x7
8040edc0:	33058593          	addi	a1,a1,816 # 804160ec <syscalls+0x948>
8040edc4:	a24ff0ef          	jal	ra,8040dfe8 <inode_check>
8040edc8:	03c4a783          	lw	a5,60(s1)
8040edcc:	00c12583          	lw	a1,12(sp)
8040edd0:	01c12503          	lw	a0,28(sp)
8040edd4:	0387a783          	lw	a5,56(a5)
8040edd8:	00090613          	mv	a2,s2
8040eddc:	000780e7          	jalr	a5
8040ede0:	00050413          	mv	s0,a0
8040ede4:	01c12503          	lw	a0,28(sp)
8040ede8:	accff0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040edec:	00040513          	mv	a0,s0
8040edf0:	02c12083          	lw	ra,44(sp)
8040edf4:	02812403          	lw	s0,40(sp)
8040edf8:	02412483          	lw	s1,36(sp)
8040edfc:	02012903          	lw	s2,32(sp)
8040ee00:	03010113          	addi	sp,sp,48
8040ee04:	00008067          	ret
8040ee08:	00040513          	mv	a0,s0
8040ee0c:	02c12083          	lw	ra,44(sp)
8040ee10:	02812403          	lw	s0,40(sp)
8040ee14:	00992023          	sw	s1,0(s2)
8040ee18:	02412483          	lw	s1,36(sp)
8040ee1c:	02012903          	lw	s2,32(sp)
8040ee20:	03010113          	addi	sp,sp,48
8040ee24:	00008067          	ret
8040ee28:	00007697          	auipc	a3,0x7
8040ee2c:	27468693          	addi	a3,a3,628 # 8041609c <syscalls+0x8f8>
8040ee30:	00005617          	auipc	a2,0x5
8040ee34:	9b060613          	addi	a2,a2,-1616 # 804137e0 <commands+0x1bc>
8040ee38:	04f00593          	li	a1,79
8040ee3c:	00007517          	auipc	a0,0x7
8040ee40:	24850513          	addi	a0,a0,584 # 80416084 <syscalls+0x8e0>
8040ee44:	fe0f10ef          	jal	ra,80400624 <__panic>

8040ee48 <vfs_lookup_parent>:
8040ee48:	fd010113          	addi	sp,sp,-48
8040ee4c:	02812423          	sw	s0,40(sp)
8040ee50:	02912223          	sw	s1,36(sp)
8040ee54:	00058413          	mv	s0,a1
8040ee58:	00060493          	mv	s1,a2
8040ee5c:	00c10593          	addi	a1,sp,12
8040ee60:	01c10613          	addi	a2,sp,28
8040ee64:	02112623          	sw	ra,44(sp)
8040ee68:	00a12623          	sw	a0,12(sp)
8040ee6c:	d99ff0ef          	jal	ra,8040ec04 <get_device>
8040ee70:	00051a63          	bnez	a0,8040ee84 <vfs_lookup_parent+0x3c>
8040ee74:	00c12783          	lw	a5,12(sp)
8040ee78:	00f4a023          	sw	a5,0(s1)
8040ee7c:	01c12783          	lw	a5,28(sp)
8040ee80:	00f42023          	sw	a5,0(s0)
8040ee84:	02c12083          	lw	ra,44(sp)
8040ee88:	02812403          	lw	s0,40(sp)
8040ee8c:	02412483          	lw	s1,36(sp)
8040ee90:	03010113          	addi	sp,sp,48
8040ee94:	00008067          	ret

8040ee98 <vfs_get_curdir>:
8040ee98:	0008e797          	auipc	a5,0x8e
8040ee9c:	91878793          	addi	a5,a5,-1768 # 8049c7b0 <current>
8040eea0:	0007a783          	lw	a5,0(a5)
8040eea4:	ff010113          	addi	sp,sp,-16
8040eea8:	00812423          	sw	s0,8(sp)
8040eeac:	0dc7a783          	lw	a5,220(a5)
8040eeb0:	00112623          	sw	ra,12(sp)
8040eeb4:	00912223          	sw	s1,4(sp)
8040eeb8:	0007a403          	lw	s0,0(a5)
8040eebc:	02040663          	beqz	s0,8040eee8 <vfs_get_curdir+0x50>
8040eec0:	00050493          	mv	s1,a0
8040eec4:	00040513          	mv	a0,s0
8040eec8:	8f8ff0ef          	jal	ra,8040dfc0 <inode_ref_inc>
8040eecc:	00000513          	li	a0,0
8040eed0:	0084a023          	sw	s0,0(s1)
8040eed4:	00c12083          	lw	ra,12(sp)
8040eed8:	00812403          	lw	s0,8(sp)
8040eedc:	00412483          	lw	s1,4(sp)
8040eee0:	01010113          	addi	sp,sp,16
8040eee4:	00008067          	ret
8040eee8:	ff000513          	li	a0,-16
8040eeec:	fe9ff06f          	j	8040eed4 <vfs_get_curdir+0x3c>

8040eef0 <vfs_set_curdir>:
8040eef0:	fd010113          	addi	sp,sp,-48
8040eef4:	02912223          	sw	s1,36(sp)
8040eef8:	0008e497          	auipc	s1,0x8e
8040eefc:	8b848493          	addi	s1,s1,-1864 # 8049c7b0 <current>
8040ef00:	0004a783          	lw	a5,0(s1)
8040ef04:	02812423          	sw	s0,40(sp)
8040ef08:	00050413          	mv	s0,a0
8040ef0c:	0dc7a503          	lw	a0,220(a5)
8040ef10:	01312e23          	sw	s3,28(sp)
8040ef14:	02112623          	sw	ra,44(sp)
8040ef18:	03212023          	sw	s2,32(sp)
8040ef1c:	fb1f70ef          	jal	ra,80406ecc <lock_files>
8040ef20:	0004a783          	lw	a5,0(s1)
8040ef24:	0dc7a503          	lw	a0,220(a5)
8040ef28:	00052983          	lw	s3,0(a0)
8040ef2c:	0b340863          	beq	s0,s3,8040efdc <vfs_set_curdir+0xec>
8040ef30:	08040a63          	beqz	s0,8040efc4 <vfs_set_curdir+0xd4>
8040ef34:	03c42783          	lw	a5,60(s0)
8040ef38:	0a078663          	beqz	a5,8040efe4 <vfs_set_curdir+0xf4>
8040ef3c:	0287a783          	lw	a5,40(a5)
8040ef40:	0a078263          	beqz	a5,8040efe4 <vfs_set_curdir+0xf4>
8040ef44:	00007597          	auipc	a1,0x7
8040ef48:	27858593          	addi	a1,a1,632 # 804161bc <syscalls+0xa18>
8040ef4c:	00040513          	mv	a0,s0
8040ef50:	898ff0ef          	jal	ra,8040dfe8 <inode_check>
8040ef54:	03c42783          	lw	a5,60(s0)
8040ef58:	00c10593          	addi	a1,sp,12
8040ef5c:	00040513          	mv	a0,s0
8040ef60:	0287a783          	lw	a5,40(a5)
8040ef64:	000780e7          	jalr	a5
8040ef68:	00050913          	mv	s2,a0
8040ef6c:	00051e63          	bnez	a0,8040ef88 <vfs_set_curdir+0x98>
8040ef70:	00c12683          	lw	a3,12(sp)
8040ef74:	000077b7          	lui	a5,0x7
8040ef78:	00002737          	lui	a4,0x2
8040ef7c:	00d7f7b3          	and	a5,a5,a3
8040ef80:	fee00913          	li	s2,-18
8040ef84:	02e78863          	beq	a5,a4,8040efb4 <vfs_set_curdir+0xc4>
8040ef88:	0004a783          	lw	a5,0(s1)
8040ef8c:	0dc7a503          	lw	a0,220(a5) # 70dc <_binary_bin_swap_img_size-0xf24>
8040ef90:	f45f70ef          	jal	ra,80406ed4 <unlock_files>
8040ef94:	02c12083          	lw	ra,44(sp)
8040ef98:	02812403          	lw	s0,40(sp)
8040ef9c:	00090513          	mv	a0,s2
8040efa0:	02412483          	lw	s1,36(sp)
8040efa4:	02012903          	lw	s2,32(sp)
8040efa8:	01c12983          	lw	s3,28(sp)
8040efac:	03010113          	addi	sp,sp,48
8040efb0:	00008067          	ret
8040efb4:	00040513          	mv	a0,s0
8040efb8:	808ff0ef          	jal	ra,8040dfc0 <inode_ref_inc>
8040efbc:	0004a783          	lw	a5,0(s1)
8040efc0:	0dc7a503          	lw	a0,220(a5)
8040efc4:	00852023          	sw	s0,0(a0)
8040efc8:	00000913          	li	s2,0
8040efcc:	fc0982e3          	beqz	s3,8040ef90 <vfs_set_curdir+0xa0>
8040efd0:	00098513          	mv	a0,s3
8040efd4:	8e0ff0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040efd8:	fb1ff06f          	j	8040ef88 <vfs_set_curdir+0x98>
8040efdc:	00000913          	li	s2,0
8040efe0:	fb1ff06f          	j	8040ef90 <vfs_set_curdir+0xa0>
8040efe4:	00007697          	auipc	a3,0x7
8040efe8:	17068693          	addi	a3,a3,368 # 80416154 <syscalls+0x9b0>
8040efec:	00004617          	auipc	a2,0x4
8040eff0:	7f460613          	addi	a2,a2,2036 # 804137e0 <commands+0x1bc>
8040eff4:	04300593          	li	a1,67
8040eff8:	00007517          	auipc	a0,0x7
8040effc:	1ac50513          	addi	a0,a0,428 # 804161a4 <syscalls+0xa00>
8040f000:	e24f10ef          	jal	ra,80400624 <__panic>

8040f004 <vfs_chdir>:
8040f004:	fe010113          	addi	sp,sp,-32
8040f008:	00c10593          	addi	a1,sp,12
8040f00c:	00812c23          	sw	s0,24(sp)
8040f010:	00112e23          	sw	ra,28(sp)
8040f014:	d51ff0ef          	jal	ra,8040ed64 <vfs_lookup>
8040f018:	00050413          	mv	s0,a0
8040f01c:	00050c63          	beqz	a0,8040f034 <vfs_chdir+0x30>
8040f020:	00040513          	mv	a0,s0
8040f024:	01c12083          	lw	ra,28(sp)
8040f028:	01812403          	lw	s0,24(sp)
8040f02c:	02010113          	addi	sp,sp,32
8040f030:	00008067          	ret
8040f034:	00c12503          	lw	a0,12(sp)
8040f038:	eb9ff0ef          	jal	ra,8040eef0 <vfs_set_curdir>
8040f03c:	00050413          	mv	s0,a0
8040f040:	00c12503          	lw	a0,12(sp)
8040f044:	870ff0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040f048:	00040513          	mv	a0,s0
8040f04c:	01c12083          	lw	ra,28(sp)
8040f050:	01812403          	lw	s0,24(sp)
8040f054:	02010113          	addi	sp,sp,32
8040f058:	00008067          	ret

8040f05c <vfs_getcwd>:
8040f05c:	0008d797          	auipc	a5,0x8d
8040f060:	75478793          	addi	a5,a5,1876 # 8049c7b0 <current>
8040f064:	0007a783          	lw	a5,0(a5)
8040f068:	fe010113          	addi	sp,sp,-32
8040f06c:	00812c23          	sw	s0,24(sp)
8040f070:	0dc7a783          	lw	a5,220(a5)
8040f074:	00112e23          	sw	ra,28(sp)
8040f078:	00912a23          	sw	s1,20(sp)
8040f07c:	0007a403          	lw	s0,0(a5)
8040f080:	01212823          	sw	s2,16(sp)
8040f084:	0c040663          	beqz	s0,8040f150 <vfs_getcwd+0xf4>
8040f088:	00050493          	mv	s1,a0
8040f08c:	00040513          	mv	a0,s0
8040f090:	f31fe0ef          	jal	ra,8040dfc0 <inode_ref_inc>
8040f094:	03842503          	lw	a0,56(s0)
8040f098:	0c050063          	beqz	a0,8040f158 <vfs_getcwd+0xfc>
8040f09c:	f5cff0ef          	jal	ra,8040e7f8 <vfs_get_devname>
8040f0a0:	00050913          	mv	s2,a0
8040f0a4:	228040ef          	jal	ra,804132cc <strlen>
8040f0a8:	00050613          	mv	a2,a0
8040f0ac:	00090593          	mv	a1,s2
8040f0b0:	00000713          	li	a4,0
8040f0b4:	00100693          	li	a3,1
8040f0b8:	00048513          	mv	a0,s1
8040f0bc:	910f80ef          	jal	ra,804071cc <iobuf_move>
8040f0c0:	00050913          	mv	s2,a0
8040f0c4:	02050463          	beqz	a0,8040f0ec <vfs_getcwd+0x90>
8040f0c8:	00040513          	mv	a0,s0
8040f0cc:	fe9fe0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8040f0d0:	01c12083          	lw	ra,28(sp)
8040f0d4:	01812403          	lw	s0,24(sp)
8040f0d8:	00090513          	mv	a0,s2
8040f0dc:	01412483          	lw	s1,20(sp)
8040f0e0:	01012903          	lw	s2,16(sp)
8040f0e4:	02010113          	addi	sp,sp,32
8040f0e8:	00008067          	ret
8040f0ec:	03a00793          	li	a5,58
8040f0f0:	00000713          	li	a4,0
8040f0f4:	00100693          	li	a3,1
8040f0f8:	00100613          	li	a2,1
8040f0fc:	00f10593          	addi	a1,sp,15
8040f100:	00048513          	mv	a0,s1
8040f104:	00f107a3          	sb	a5,15(sp)
8040f108:	8c4f80ef          	jal	ra,804071cc <iobuf_move>
8040f10c:	00050913          	mv	s2,a0
8040f110:	fa051ce3          	bnez	a0,8040f0c8 <vfs_getcwd+0x6c>
8040f114:	03c42783          	lw	a5,60(s0)
8040f118:	06078063          	beqz	a5,8040f178 <vfs_getcwd+0x11c>
8040f11c:	01c7a783          	lw	a5,28(a5)
8040f120:	04078c63          	beqz	a5,8040f178 <vfs_getcwd+0x11c>
8040f124:	00007597          	auipc	a1,0x7
8040f128:	02458593          	addi	a1,a1,36 # 80416148 <syscalls+0x9a4>
8040f12c:	00040513          	mv	a0,s0
8040f130:	eb9fe0ef          	jal	ra,8040dfe8 <inode_check>
8040f134:	03c42783          	lw	a5,60(s0)
8040f138:	00048593          	mv	a1,s1
8040f13c:	00040513          	mv	a0,s0
8040f140:	01c7a783          	lw	a5,28(a5)
8040f144:	000780e7          	jalr	a5
8040f148:	00050913          	mv	s2,a0
8040f14c:	f7dff06f          	j	8040f0c8 <vfs_getcwd+0x6c>
8040f150:	ff000913          	li	s2,-16
8040f154:	f7dff06f          	j	8040f0d0 <vfs_getcwd+0x74>
8040f158:	00007697          	auipc	a3,0x7
8040f15c:	f1868693          	addi	a3,a3,-232 # 80416070 <syscalls+0x8cc>
8040f160:	00004617          	auipc	a2,0x4
8040f164:	68060613          	addi	a2,a2,1664 # 804137e0 <commands+0x1bc>
8040f168:	06e00593          	li	a1,110
8040f16c:	00007517          	auipc	a0,0x7
8040f170:	03850513          	addi	a0,a0,56 # 804161a4 <syscalls+0xa00>
8040f174:	cb0f10ef          	jal	ra,80400624 <__panic>
8040f178:	00007697          	auipc	a3,0x7
8040f17c:	f7c68693          	addi	a3,a3,-132 # 804160f4 <syscalls+0x950>
8040f180:	00004617          	auipc	a2,0x4
8040f184:	66060613          	addi	a2,a2,1632 # 804137e0 <commands+0x1bc>
8040f188:	07800593          	li	a1,120
8040f18c:	00007517          	auipc	a0,0x7
8040f190:	01850513          	addi	a0,a0,24 # 804161a4 <syscalls+0xa00>
8040f194:	c90f10ef          	jal	ra,80400624 <__panic>

8040f198 <dev_lookup>:
8040f198:	0005c703          	lbu	a4,0(a1)
8040f19c:	02071e63          	bnez	a4,8040f1d8 <dev_lookup+0x40>
8040f1a0:	ff010113          	addi	sp,sp,-16
8040f1a4:	00812423          	sw	s0,8(sp)
8040f1a8:	00912223          	sw	s1,4(sp)
8040f1ac:	00112623          	sw	ra,12(sp)
8040f1b0:	00050493          	mv	s1,a0
8040f1b4:	00060413          	mv	s0,a2
8040f1b8:	e09fe0ef          	jal	ra,8040dfc0 <inode_ref_inc>
8040f1bc:	00c12083          	lw	ra,12(sp)
8040f1c0:	00942023          	sw	s1,0(s0)
8040f1c4:	00812403          	lw	s0,8(sp)
8040f1c8:	00412483          	lw	s1,4(sp)
8040f1cc:	00000513          	li	a0,0
8040f1d0:	01010113          	addi	sp,sp,16
8040f1d4:	00008067          	ret
8040f1d8:	ff000513          	li	a0,-16
8040f1dc:	00008067          	ret

8040f1e0 <dev_ioctl>:
8040f1e0:	00050e63          	beqz	a0,8040f1fc <dev_ioctl+0x1c>
8040f1e4:	02c52683          	lw	a3,44(a0)
8040f1e8:	00001737          	lui	a4,0x1
8040f1ec:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f1f0:	00e69663          	bne	a3,a4,8040f1fc <dev_ioctl+0x1c>
8040f1f4:	01452303          	lw	t1,20(a0)
8040f1f8:	00030067          	jr	t1
8040f1fc:	ff010113          	addi	sp,sp,-16
8040f200:	00007697          	auipc	a3,0x7
8040f204:	ce068693          	addi	a3,a3,-800 # 80415ee0 <syscalls+0x73c>
8040f208:	00004617          	auipc	a2,0x4
8040f20c:	5d860613          	addi	a2,a2,1496 # 804137e0 <commands+0x1bc>
8040f210:	03500593          	li	a1,53
8040f214:	00007517          	auipc	a0,0x7
8040f218:	fb050513          	addi	a0,a0,-80 # 804161c4 <syscalls+0xa20>
8040f21c:	00112623          	sw	ra,12(sp)
8040f220:	c04f10ef          	jal	ra,80400624 <__panic>

8040f224 <dev_tryseek>:
8040f224:	ff010113          	addi	sp,sp,-16
8040f228:	00112623          	sw	ra,12(sp)
8040f22c:	00812423          	sw	s0,8(sp)
8040f230:	00912223          	sw	s1,4(sp)
8040f234:	01212023          	sw	s2,0(sp)
8040f238:	06050663          	beqz	a0,8040f2a4 <dev_tryseek+0x80>
8040f23c:	02c52703          	lw	a4,44(a0)
8040f240:	000017b7          	lui	a5,0x1
8040f244:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f248:	04f71e63          	bne	a4,a5,8040f2a4 <dev_tryseek+0x80>
8040f24c:	00052483          	lw	s1,0(a0)
8040f250:	04048663          	beqz	s1,8040f29c <dev_tryseek+0x78>
8040f254:	00452903          	lw	s2,4(a0)
8040f258:	00058413          	mv	s0,a1
8040f25c:	00058513          	mv	a0,a1
8040f260:	00090593          	mv	a1,s2
8040f264:	254040ef          	jal	ra,804134b8 <__umodsi3>
8040f268:	02051a63          	bnez	a0,8040f29c <dev_tryseek+0x78>
8040f26c:	02044863          	bltz	s0,8040f29c <dev_tryseek+0x78>
8040f270:	00090593          	mv	a1,s2
8040f274:	00048513          	mv	a0,s1
8040f278:	1cc040ef          	jal	ra,80413444 <__mulsi3>
8040f27c:	02a47063          	bgeu	s0,a0,8040f29c <dev_tryseek+0x78>
8040f280:	00000513          	li	a0,0
8040f284:	00c12083          	lw	ra,12(sp)
8040f288:	00812403          	lw	s0,8(sp)
8040f28c:	00412483          	lw	s1,4(sp)
8040f290:	00012903          	lw	s2,0(sp)
8040f294:	01010113          	addi	sp,sp,16
8040f298:	00008067          	ret
8040f29c:	ffd00513          	li	a0,-3
8040f2a0:	fe5ff06f          	j	8040f284 <dev_tryseek+0x60>
8040f2a4:	00007697          	auipc	a3,0x7
8040f2a8:	c3c68693          	addi	a3,a3,-964 # 80415ee0 <syscalls+0x73c>
8040f2ac:	00004617          	auipc	a2,0x4
8040f2b0:	53460613          	addi	a2,a2,1332 # 804137e0 <commands+0x1bc>
8040f2b4:	05f00593          	li	a1,95
8040f2b8:	00007517          	auipc	a0,0x7
8040f2bc:	f0c50513          	addi	a0,a0,-244 # 804161c4 <syscalls+0xa20>
8040f2c0:	b64f10ef          	jal	ra,80400624 <__panic>

8040f2c4 <dev_gettype>:
8040f2c4:	02050e63          	beqz	a0,8040f300 <dev_gettype+0x3c>
8040f2c8:	02c52703          	lw	a4,44(a0)
8040f2cc:	000017b7          	lui	a5,0x1
8040f2d0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f2d4:	02f71663          	bne	a4,a5,8040f300 <dev_gettype+0x3c>
8040f2d8:	00052703          	lw	a4,0(a0)
8040f2dc:	000057b7          	lui	a5,0x5
8040f2e0:	00070863          	beqz	a4,8040f2f0 <dev_gettype+0x2c>
8040f2e4:	00f5a023          	sw	a5,0(a1)
8040f2e8:	00000513          	li	a0,0
8040f2ec:	00008067          	ret
8040f2f0:	000047b7          	lui	a5,0x4
8040f2f4:	00f5a023          	sw	a5,0(a1)
8040f2f8:	00000513          	li	a0,0
8040f2fc:	00008067          	ret
8040f300:	ff010113          	addi	sp,sp,-16
8040f304:	00007697          	auipc	a3,0x7
8040f308:	bdc68693          	addi	a3,a3,-1060 # 80415ee0 <syscalls+0x73c>
8040f30c:	00004617          	auipc	a2,0x4
8040f310:	4d460613          	addi	a2,a2,1236 # 804137e0 <commands+0x1bc>
8040f314:	05300593          	li	a1,83
8040f318:	00007517          	auipc	a0,0x7
8040f31c:	eac50513          	addi	a0,a0,-340 # 804161c4 <syscalls+0xa20>
8040f320:	00112623          	sw	ra,12(sp)
8040f324:	b00f10ef          	jal	ra,80400624 <__panic>

8040f328 <dev_write>:
8040f328:	02050063          	beqz	a0,8040f348 <dev_write+0x20>
8040f32c:	02c52683          	lw	a3,44(a0)
8040f330:	00001737          	lui	a4,0x1
8040f334:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f338:	00e69863          	bne	a3,a4,8040f348 <dev_write+0x20>
8040f33c:	01052303          	lw	t1,16(a0)
8040f340:	00100613          	li	a2,1
8040f344:	00030067          	jr	t1
8040f348:	ff010113          	addi	sp,sp,-16
8040f34c:	00007697          	auipc	a3,0x7
8040f350:	b9468693          	addi	a3,a3,-1132 # 80415ee0 <syscalls+0x73c>
8040f354:	00004617          	auipc	a2,0x4
8040f358:	48c60613          	addi	a2,a2,1164 # 804137e0 <commands+0x1bc>
8040f35c:	02c00593          	li	a1,44
8040f360:	00007517          	auipc	a0,0x7
8040f364:	e6450513          	addi	a0,a0,-412 # 804161c4 <syscalls+0xa20>
8040f368:	00112623          	sw	ra,12(sp)
8040f36c:	ab8f10ef          	jal	ra,80400624 <__panic>

8040f370 <dev_read>:
8040f370:	02050063          	beqz	a0,8040f390 <dev_read+0x20>
8040f374:	02c52683          	lw	a3,44(a0)
8040f378:	00001737          	lui	a4,0x1
8040f37c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f380:	00e69863          	bne	a3,a4,8040f390 <dev_read+0x20>
8040f384:	01052303          	lw	t1,16(a0)
8040f388:	00000613          	li	a2,0
8040f38c:	00030067          	jr	t1
8040f390:	ff010113          	addi	sp,sp,-16
8040f394:	00007697          	auipc	a3,0x7
8040f398:	b4c68693          	addi	a3,a3,-1204 # 80415ee0 <syscalls+0x73c>
8040f39c:	00004617          	auipc	a2,0x4
8040f3a0:	44460613          	addi	a2,a2,1092 # 804137e0 <commands+0x1bc>
8040f3a4:	02300593          	li	a1,35
8040f3a8:	00007517          	auipc	a0,0x7
8040f3ac:	e1c50513          	addi	a0,a0,-484 # 804161c4 <syscalls+0xa20>
8040f3b0:	00112623          	sw	ra,12(sp)
8040f3b4:	a70f10ef          	jal	ra,80400624 <__panic>

8040f3b8 <dev_close>:
8040f3b8:	00050e63          	beqz	a0,8040f3d4 <dev_close+0x1c>
8040f3bc:	02c52683          	lw	a3,44(a0)
8040f3c0:	00001737          	lui	a4,0x1
8040f3c4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f3c8:	00e69663          	bne	a3,a4,8040f3d4 <dev_close+0x1c>
8040f3cc:	00c52303          	lw	t1,12(a0)
8040f3d0:	00030067          	jr	t1
8040f3d4:	ff010113          	addi	sp,sp,-16
8040f3d8:	00007697          	auipc	a3,0x7
8040f3dc:	b0868693          	addi	a3,a3,-1272 # 80415ee0 <syscalls+0x73c>
8040f3e0:	00004617          	auipc	a2,0x4
8040f3e4:	40060613          	addi	a2,a2,1024 # 804137e0 <commands+0x1bc>
8040f3e8:	01a00593          	li	a1,26
8040f3ec:	00007517          	auipc	a0,0x7
8040f3f0:	dd850513          	addi	a0,a0,-552 # 804161c4 <syscalls+0xa20>
8040f3f4:	00112623          	sw	ra,12(sp)
8040f3f8:	a2cf10ef          	jal	ra,80400624 <__panic>

8040f3fc <dev_open>:
8040f3fc:	03c5f713          	andi	a4,a1,60
8040f400:	02071063          	bnez	a4,8040f420 <dev_open+0x24>
8040f404:	02050263          	beqz	a0,8040f428 <dev_open+0x2c>
8040f408:	02c52683          	lw	a3,44(a0)
8040f40c:	00001737          	lui	a4,0x1
8040f410:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f414:	00e69a63          	bne	a3,a4,8040f428 <dev_open+0x2c>
8040f418:	00852303          	lw	t1,8(a0)
8040f41c:	00030067          	jr	t1
8040f420:	ffd00513          	li	a0,-3
8040f424:	00008067          	ret
8040f428:	ff010113          	addi	sp,sp,-16
8040f42c:	00007697          	auipc	a3,0x7
8040f430:	ab468693          	addi	a3,a3,-1356 # 80415ee0 <syscalls+0x73c>
8040f434:	00004617          	auipc	a2,0x4
8040f438:	3ac60613          	addi	a2,a2,940 # 804137e0 <commands+0x1bc>
8040f43c:	01100593          	li	a1,17
8040f440:	00007517          	auipc	a0,0x7
8040f444:	d8450513          	addi	a0,a0,-636 # 804161c4 <syscalls+0xa20>
8040f448:	00112623          	sw	ra,12(sp)
8040f44c:	9d8f10ef          	jal	ra,80400624 <__panic>

8040f450 <dev_fstat>:
8040f450:	ff010113          	addi	sp,sp,-16
8040f454:	00912223          	sw	s1,4(sp)
8040f458:	00058493          	mv	s1,a1
8040f45c:	00812423          	sw	s0,8(sp)
8040f460:	01000613          	li	a2,16
8040f464:	00050413          	mv	s0,a0
8040f468:	00000593          	li	a1,0
8040f46c:	00048513          	mv	a0,s1
8040f470:	00112623          	sw	ra,12(sp)
8040f474:	01212023          	sw	s2,0(sp)
8040f478:	739030ef          	jal	ra,804133b0 <memset>
8040f47c:	08040463          	beqz	s0,8040f504 <dev_fstat+0xb4>
8040f480:	03c42783          	lw	a5,60(s0)
8040f484:	08078063          	beqz	a5,8040f504 <dev_fstat+0xb4>
8040f488:	0287a783          	lw	a5,40(a5) # 4028 <_binary_bin_swap_img_size-0x3fd8>
8040f48c:	06078c63          	beqz	a5,8040f504 <dev_fstat+0xb4>
8040f490:	00007597          	auipc	a1,0x7
8040f494:	d2c58593          	addi	a1,a1,-724 # 804161bc <syscalls+0xa18>
8040f498:	00040513          	mv	a0,s0
8040f49c:	b4dfe0ef          	jal	ra,8040dfe8 <inode_check>
8040f4a0:	03c42783          	lw	a5,60(s0)
8040f4a4:	00048593          	mv	a1,s1
8040f4a8:	00040513          	mv	a0,s0
8040f4ac:	0287a783          	lw	a5,40(a5)
8040f4b0:	000780e7          	jalr	a5
8040f4b4:	00050913          	mv	s2,a0
8040f4b8:	02051863          	bnez	a0,8040f4e8 <dev_fstat+0x98>
8040f4bc:	02c42703          	lw	a4,44(s0)
8040f4c0:	000017b7          	lui	a5,0x1
8040f4c4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f4c8:	04f71e63          	bne	a4,a5,8040f524 <dev_fstat+0xd4>
8040f4cc:	00042583          	lw	a1,0(s0)
8040f4d0:	00442503          	lw	a0,4(s0)
8040f4d4:	00100793          	li	a5,1
8040f4d8:	00f4a223          	sw	a5,4(s1)
8040f4dc:	00b4a423          	sw	a1,8(s1)
8040f4e0:	765030ef          	jal	ra,80413444 <__mulsi3>
8040f4e4:	00a4a623          	sw	a0,12(s1)
8040f4e8:	00c12083          	lw	ra,12(sp)
8040f4ec:	00812403          	lw	s0,8(sp)
8040f4f0:	00090513          	mv	a0,s2
8040f4f4:	00412483          	lw	s1,4(sp)
8040f4f8:	00012903          	lw	s2,0(sp)
8040f4fc:	01010113          	addi	sp,sp,16
8040f500:	00008067          	ret
8040f504:	00007697          	auipc	a3,0x7
8040f508:	c5068693          	addi	a3,a3,-944 # 80416154 <syscalls+0x9b0>
8040f50c:	00004617          	auipc	a2,0x4
8040f510:	2d460613          	addi	a2,a2,724 # 804137e0 <commands+0x1bc>
8040f514:	04200593          	li	a1,66
8040f518:	00007517          	auipc	a0,0x7
8040f51c:	cac50513          	addi	a0,a0,-852 # 804161c4 <syscalls+0xa20>
8040f520:	904f10ef          	jal	ra,80400624 <__panic>
8040f524:	00007697          	auipc	a3,0x7
8040f528:	9bc68693          	addi	a3,a3,-1604 # 80415ee0 <syscalls+0x73c>
8040f52c:	00004617          	auipc	a2,0x4
8040f530:	2b460613          	addi	a2,a2,692 # 804137e0 <commands+0x1bc>
8040f534:	04500593          	li	a1,69
8040f538:	00007517          	auipc	a0,0x7
8040f53c:	c8c50513          	addi	a0,a0,-884 # 804161c4 <syscalls+0xa20>
8040f540:	8e4f10ef          	jal	ra,80400624 <__panic>

8040f544 <dev_init>:
8040f544:	ff010113          	addi	sp,sp,-16
8040f548:	00112623          	sw	ra,12(sp)
8040f54c:	700000ef          	jal	ra,8040fc4c <dev_init_stdin>
8040f550:	081000ef          	jal	ra,8040fdd0 <dev_init_stdout>
8040f554:	00c12083          	lw	ra,12(sp)
8040f558:	01010113          	addi	sp,sp,16
8040f55c:	2bc0006f          	j	8040f818 <dev_init_disk0>

8040f560 <dev_create_inode>:
8040f560:	00001537          	lui	a0,0x1
8040f564:	ff010113          	addi	sp,sp,-16
8040f568:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f56c:	00812423          	sw	s0,8(sp)
8040f570:	00112623          	sw	ra,12(sp)
8040f574:	9a1fe0ef          	jal	ra,8040df14 <__alloc_inode>
8040f578:	00050413          	mv	s0,a0
8040f57c:	00050a63          	beqz	a0,8040f590 <dev_create_inode+0x30>
8040f580:	00000613          	li	a2,0
8040f584:	00007597          	auipc	a1,0x7
8040f588:	c5458593          	addi	a1,a1,-940 # 804161d8 <dev_node_ops>
8040f58c:	9b9fe0ef          	jal	ra,8040df44 <inode_init>
8040f590:	00040513          	mv	a0,s0
8040f594:	00c12083          	lw	ra,12(sp)
8040f598:	00812403          	lw	s0,8(sp)
8040f59c:	01010113          	addi	sp,sp,16
8040f5a0:	00008067          	ret

8040f5a4 <disk0_open>:
8040f5a4:	00000513          	li	a0,0
8040f5a8:	00008067          	ret

8040f5ac <disk0_close>:
8040f5ac:	00000513          	li	a0,0
8040f5b0:	00008067          	ret

8040f5b4 <disk0_ioctl>:
8040f5b4:	fec00513          	li	a0,-20
8040f5b8:	00008067          	ret

8040f5bc <disk0_io>:
8040f5bc:	fc010113          	addi	sp,sp,-64
8040f5c0:	0045a703          	lw	a4,4(a1)
8040f5c4:	02812c23          	sw	s0,56(sp)
8040f5c8:	00c5a403          	lw	s0,12(a1)
8040f5cc:	000016b7          	lui	a3,0x1
8040f5d0:	03312623          	sw	s3,44(sp)
8040f5d4:	03612023          	sw	s6,32(sp)
8040f5d8:	41f75993          	srai	s3,a4,0x1f
8040f5dc:	fff68b13          	addi	s6,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040f5e0:	008767b3          	or	a5,a4,s0
8040f5e4:	0169f9b3          	and	s3,s3,s6
8040f5e8:	02112e23          	sw	ra,60(sp)
8040f5ec:	02912a23          	sw	s1,52(sp)
8040f5f0:	03212823          	sw	s2,48(sp)
8040f5f4:	03412423          	sw	s4,40(sp)
8040f5f8:	03512223          	sw	s5,36(sp)
8040f5fc:	01712e23          	sw	s7,28(sp)
8040f600:	01812c23          	sw	s8,24(sp)
8040f604:	01912a23          	sw	s9,20(sp)
8040f608:	01a12823          	sw	s10,16(sp)
8040f60c:	0167f7b3          	and	a5,a5,s6
8040f610:	00e989b3          	add	s3,s3,a4
8040f614:	16079263          	bnez	a5,8040f778 <disk0_io+0x1bc>
8040f618:	00052783          	lw	a5,0(a0)
8040f61c:	40c9d993          	srai	s3,s3,0xc
8040f620:	00c45713          	srli	a4,s0,0xc
8040f624:	00e98733          	add	a4,s3,a4
8040f628:	14e7e863          	bltu	a5,a4,8040f778 <disk0_io+0x1bc>
8040f62c:	00000513          	li	a0,0
8040f630:	02d47e63          	bgeu	s0,a3,8040f66c <disk0_io+0xb0>
8040f634:	03c12083          	lw	ra,60(sp)
8040f638:	03812403          	lw	s0,56(sp)
8040f63c:	03412483          	lw	s1,52(sp)
8040f640:	03012903          	lw	s2,48(sp)
8040f644:	02c12983          	lw	s3,44(sp)
8040f648:	02812a03          	lw	s4,40(sp)
8040f64c:	02412a83          	lw	s5,36(sp)
8040f650:	02012b03          	lw	s6,32(sp)
8040f654:	01c12b83          	lw	s7,28(sp)
8040f658:	01812c03          	lw	s8,24(sp)
8040f65c:	01412c83          	lw	s9,20(sp)
8040f660:	01012d03          	lw	s10,16(sp)
8040f664:	04010113          	addi	sp,sp,64
8040f668:	00008067          	ret
8040f66c:	0008c517          	auipc	a0,0x8c
8040f670:	10850513          	addi	a0,a0,264 # 8049b774 <disk0_sem>
8040f674:	00060c13          	mv	s8,a2
8040f678:	00058b93          	mv	s7,a1
8040f67c:	0008da17          	auipc	s4,0x8d
8040f680:	160a0a13          	addi	s4,s4,352 # 8049c7dc <disk0_buffer>
8040f684:	ee0f60ef          	jal	ra,80405d64 <down>
8040f688:	00004cb7          	lui	s9,0x4
8040f68c:	0600006f          	j	8040f6ec <disk0_io+0x130>
8040f690:	00c45493          	srli	s1,s0,0xc
8040f694:	00349d13          	slli	s10,s1,0x3
8040f698:	00040913          	mv	s2,s0
8040f69c:	00399a93          	slli	s5,s3,0x3
8040f6a0:	00058613          	mv	a2,a1
8040f6a4:	000d0693          	mv	a3,s10
8040f6a8:	000a8593          	mv	a1,s5
8040f6ac:	00200513          	li	a0,2
8040f6b0:	c44f10ef          	jal	ra,80400af4 <ide_read_secs>
8040f6b4:	10051663          	bnez	a0,8040f7c0 <disk0_io+0x204>
8040f6b8:	000a2583          	lw	a1,0(s4)
8040f6bc:	00c10713          	addi	a4,sp,12
8040f6c0:	00100693          	li	a3,1
8040f6c4:	00090613          	mv	a2,s2
8040f6c8:	000b8513          	mv	a0,s7
8040f6cc:	b01f70ef          	jal	ra,804071cc <iobuf_move>
8040f6d0:	00c12783          	lw	a5,12(sp)
8040f6d4:	0b279663          	bne	a5,s2,8040f780 <disk0_io+0x1c4>
8040f6d8:	016977b3          	and	a5,s2,s6
8040f6dc:	0a079263          	bnez	a5,8040f780 <disk0_io+0x1c4>
8040f6e0:	41240433          	sub	s0,s0,s2
8040f6e4:	009989b3          	add	s3,s3,s1
8040f6e8:	06040e63          	beqz	s0,8040f764 <disk0_io+0x1a8>
8040f6ec:	000a2583          	lw	a1,0(s4)
8040f6f0:	000c1c63          	bnez	s8,8040f708 <disk0_io+0x14c>
8040f6f4:	f9946ee3          	bltu	s0,s9,8040f690 <disk0_io+0xd4>
8040f6f8:	02000d13          	li	s10,32
8040f6fc:	00400493          	li	s1,4
8040f700:	00004937          	lui	s2,0x4
8040f704:	f99ff06f          	j	8040f69c <disk0_io+0xe0>
8040f708:	00c10713          	addi	a4,sp,12
8040f70c:	00000693          	li	a3,0
8040f710:	00004637          	lui	a2,0x4
8040f714:	000b8513          	mv	a0,s7
8040f718:	ab5f70ef          	jal	ra,804071cc <iobuf_move>
8040f71c:	00c12483          	lw	s1,12(sp)
8040f720:	08048063          	beqz	s1,8040f7a0 <disk0_io+0x1e4>
8040f724:	06946e63          	bltu	s0,s1,8040f7a0 <disk0_io+0x1e4>
8040f728:	0164f7b3          	and	a5,s1,s6
8040f72c:	06079a63          	bnez	a5,8040f7a0 <disk0_io+0x1e4>
8040f730:	00c4d493          	srli	s1,s1,0xc
8040f734:	000a2603          	lw	a2,0(s4)
8040f738:	00399913          	slli	s2,s3,0x3
8040f73c:	00349a93          	slli	s5,s1,0x3
8040f740:	000a8693          	mv	a3,s5
8040f744:	00090593          	mv	a1,s2
8040f748:	00200513          	li	a0,2
8040f74c:	c40f10ef          	jal	ra,80400b8c <ide_write_secs>
8040f750:	08051e63          	bnez	a0,8040f7ec <disk0_io+0x230>
8040f754:	00c12903          	lw	s2,12(sp)
8040f758:	009989b3          	add	s3,s3,s1
8040f75c:	41240433          	sub	s0,s0,s2
8040f760:	f80416e3          	bnez	s0,8040f6ec <disk0_io+0x130>
8040f764:	0008c517          	auipc	a0,0x8c
8040f768:	01050513          	addi	a0,a0,16 # 8049b774 <disk0_sem>
8040f76c:	df4f60ef          	jal	ra,80405d60 <up>
8040f770:	00000513          	li	a0,0
8040f774:	ec1ff06f          	j	8040f634 <disk0_io+0x78>
8040f778:	ffd00513          	li	a0,-3
8040f77c:	eb9ff06f          	j	8040f634 <disk0_io+0x78>
8040f780:	00007697          	auipc	a3,0x7
8040f784:	c0468693          	addi	a3,a3,-1020 # 80416384 <dev_node_ops+0x1ac>
8040f788:	00004617          	auipc	a2,0x4
8040f78c:	05860613          	addi	a2,a2,88 # 804137e0 <commands+0x1bc>
8040f790:	06200593          	li	a1,98
8040f794:	00007517          	auipc	a0,0x7
8040f798:	b4050513          	addi	a0,a0,-1216 # 804162d4 <dev_node_ops+0xfc>
8040f79c:	e89f00ef          	jal	ra,80400624 <__panic>
8040f7a0:	00007697          	auipc	a3,0x7
8040f7a4:	af468693          	addi	a3,a3,-1292 # 80416294 <dev_node_ops+0xbc>
8040f7a8:	00004617          	auipc	a2,0x4
8040f7ac:	03860613          	addi	a2,a2,56 # 804137e0 <commands+0x1bc>
8040f7b0:	05700593          	li	a1,87
8040f7b4:	00007517          	auipc	a0,0x7
8040f7b8:	b2050513          	addi	a0,a0,-1248 # 804162d4 <dev_node_ops+0xfc>
8040f7bc:	e69f00ef          	jal	ra,80400624 <__panic>
8040f7c0:	00050893          	mv	a7,a0
8040f7c4:	000d0813          	mv	a6,s10
8040f7c8:	00048793          	mv	a5,s1
8040f7cc:	000a8713          	mv	a4,s5
8040f7d0:	00098693          	mv	a3,s3
8040f7d4:	00007617          	auipc	a2,0x7
8040f7d8:	b6860613          	addi	a2,a2,-1176 # 8041633c <dev_node_ops+0x164>
8040f7dc:	02e00593          	li	a1,46
8040f7e0:	00007517          	auipc	a0,0x7
8040f7e4:	af450513          	addi	a0,a0,-1292 # 804162d4 <dev_node_ops+0xfc>
8040f7e8:	e3df00ef          	jal	ra,80400624 <__panic>
8040f7ec:	00050893          	mv	a7,a0
8040f7f0:	000a8813          	mv	a6,s5
8040f7f4:	00048793          	mv	a5,s1
8040f7f8:	00090713          	mv	a4,s2
8040f7fc:	00098693          	mv	a3,s3
8040f800:	00007617          	auipc	a2,0x7
8040f804:	af060613          	addi	a2,a2,-1296 # 804162f0 <dev_node_ops+0x118>
8040f808:	03800593          	li	a1,56
8040f80c:	00007517          	auipc	a0,0x7
8040f810:	ac850513          	addi	a0,a0,-1336 # 804162d4 <dev_node_ops+0xfc>
8040f814:	e11f00ef          	jal	ra,80400624 <__panic>

8040f818 <dev_init_disk0>:
8040f818:	ff010113          	addi	sp,sp,-16
8040f81c:	00112623          	sw	ra,12(sp)
8040f820:	00812423          	sw	s0,8(sp)
8040f824:	00912223          	sw	s1,4(sp)
8040f828:	d39ff0ef          	jal	ra,8040f560 <dev_create_inode>
8040f82c:	0a050c63          	beqz	a0,8040f8e4 <dev_init_disk0+0xcc>
8040f830:	02c52703          	lw	a4,44(a0)
8040f834:	000014b7          	lui	s1,0x1
8040f838:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f83c:	00050413          	mv	s0,a0
8040f840:	10f71463          	bne	a4,a5,8040f948 <dev_init_disk0+0x130>
8040f844:	00200513          	li	a0,2
8040f848:	a40f10ef          	jal	ra,80400a88 <ide_device_valid>
8040f84c:	0e050263          	beqz	a0,8040f930 <dev_init_disk0+0x118>
8040f850:	00200513          	li	a0,2
8040f854:	a68f10ef          	jal	ra,80400abc <ide_device_size>
8040f858:	00355793          	srli	a5,a0,0x3
8040f85c:	00f42023          	sw	a5,0(s0)
8040f860:	00000797          	auipc	a5,0x0
8040f864:	d4478793          	addi	a5,a5,-700 # 8040f5a4 <disk0_open>
8040f868:	00f42423          	sw	a5,8(s0)
8040f86c:	00000797          	auipc	a5,0x0
8040f870:	d4078793          	addi	a5,a5,-704 # 8040f5ac <disk0_close>
8040f874:	00f42623          	sw	a5,12(s0)
8040f878:	00000797          	auipc	a5,0x0
8040f87c:	d4478793          	addi	a5,a5,-700 # 8040f5bc <disk0_io>
8040f880:	00f42823          	sw	a5,16(s0)
8040f884:	00000797          	auipc	a5,0x0
8040f888:	d3078793          	addi	a5,a5,-720 # 8040f5b4 <disk0_ioctl>
8040f88c:	00f42a23          	sw	a5,20(s0)
8040f890:	00100593          	li	a1,1
8040f894:	0008c517          	auipc	a0,0x8c
8040f898:	ee050513          	addi	a0,a0,-288 # 8049b774 <disk0_sem>
8040f89c:	00942223          	sw	s1,4(s0)
8040f8a0:	cb4f60ef          	jal	ra,80405d54 <sem_init>
8040f8a4:	00004537          	lui	a0,0x4
8040f8a8:	f59f20ef          	jal	ra,80402800 <kmalloc>
8040f8ac:	0008d797          	auipc	a5,0x8d
8040f8b0:	f2a7a823          	sw	a0,-208(a5) # 8049c7dc <disk0_buffer>
8040f8b4:	06050263          	beqz	a0,8040f918 <dev_init_disk0+0x100>
8040f8b8:	00100613          	li	a2,1
8040f8bc:	00040593          	mv	a1,s0
8040f8c0:	00007517          	auipc	a0,0x7
8040f8c4:	9b050513          	addi	a0,a0,-1616 # 80416270 <dev_node_ops+0x98>
8040f8c8:	f8dfe0ef          	jal	ra,8040e854 <vfs_add_dev>
8040f8cc:	02051863          	bnez	a0,8040f8fc <dev_init_disk0+0xe4>
8040f8d0:	00c12083          	lw	ra,12(sp)
8040f8d4:	00812403          	lw	s0,8(sp)
8040f8d8:	00412483          	lw	s1,4(sp)
8040f8dc:	01010113          	addi	sp,sp,16
8040f8e0:	00008067          	ret
8040f8e4:	00007617          	auipc	a2,0x7
8040f8e8:	93460613          	addi	a2,a2,-1740 # 80416218 <dev_node_ops+0x40>
8040f8ec:	08700593          	li	a1,135
8040f8f0:	00007517          	auipc	a0,0x7
8040f8f4:	9e450513          	addi	a0,a0,-1564 # 804162d4 <dev_node_ops+0xfc>
8040f8f8:	d2df00ef          	jal	ra,80400624 <__panic>
8040f8fc:	00050693          	mv	a3,a0
8040f900:	00007617          	auipc	a2,0x7
8040f904:	97860613          	addi	a2,a2,-1672 # 80416278 <dev_node_ops+0xa0>
8040f908:	08d00593          	li	a1,141
8040f90c:	00007517          	auipc	a0,0x7
8040f910:	9c850513          	addi	a0,a0,-1592 # 804162d4 <dev_node_ops+0xfc>
8040f914:	d11f00ef          	jal	ra,80400624 <__panic>
8040f918:	00007617          	auipc	a2,0x7
8040f91c:	93c60613          	addi	a2,a2,-1732 # 80416254 <dev_node_ops+0x7c>
8040f920:	07f00593          	li	a1,127
8040f924:	00007517          	auipc	a0,0x7
8040f928:	9b050513          	addi	a0,a0,-1616 # 804162d4 <dev_node_ops+0xfc>
8040f92c:	cf9f00ef          	jal	ra,80400624 <__panic>
8040f930:	00007617          	auipc	a2,0x7
8040f934:	90460613          	addi	a2,a2,-1788 # 80416234 <dev_node_ops+0x5c>
8040f938:	07300593          	li	a1,115
8040f93c:	00007517          	auipc	a0,0x7
8040f940:	99850513          	addi	a0,a0,-1640 # 804162d4 <dev_node_ops+0xfc>
8040f944:	ce1f00ef          	jal	ra,80400624 <__panic>
8040f948:	00006697          	auipc	a3,0x6
8040f94c:	59868693          	addi	a3,a3,1432 # 80415ee0 <syscalls+0x73c>
8040f950:	00004617          	auipc	a2,0x4
8040f954:	e9060613          	addi	a2,a2,-368 # 804137e0 <commands+0x1bc>
8040f958:	08900593          	li	a1,137
8040f95c:	00007517          	auipc	a0,0x7
8040f960:	97850513          	addi	a0,a0,-1672 # 804162d4 <dev_node_ops+0xfc>
8040f964:	cc1f00ef          	jal	ra,80400624 <__panic>

8040f968 <stdin_open>:
8040f968:	00000513          	li	a0,0
8040f96c:	00059463          	bnez	a1,8040f974 <stdin_open+0xc>
8040f970:	00008067          	ret
8040f974:	ffd00513          	li	a0,-3
8040f978:	00008067          	ret

8040f97c <stdin_close>:
8040f97c:	00000513          	li	a0,0
8040f980:	00008067          	ret

8040f984 <stdin_ioctl>:
8040f984:	ffd00513          	li	a0,-3
8040f988:	00008067          	ret

8040f98c <stdin_io>:
8040f98c:	fb010113          	addi	sp,sp,-80
8040f990:	04112623          	sw	ra,76(sp)
8040f994:	04812423          	sw	s0,72(sp)
8040f998:	04912223          	sw	s1,68(sp)
8040f99c:	05212023          	sw	s2,64(sp)
8040f9a0:	03312e23          	sw	s3,60(sp)
8040f9a4:	03412c23          	sw	s4,56(sp)
8040f9a8:	03512a23          	sw	s5,52(sp)
8040f9ac:	03612823          	sw	s6,48(sp)
8040f9b0:	03712623          	sw	s7,44(sp)
8040f9b4:	03812423          	sw	s8,40(sp)
8040f9b8:	03912223          	sw	s9,36(sp)
8040f9bc:	1a061063          	bnez	a2,8040fb5c <stdin_io+0x1d0>
8040f9c0:	00058493          	mv	s1,a1
8040f9c4:	0005ac83          	lw	s9,0(a1)
8040f9c8:	00c5ac03          	lw	s8,12(a1)
8040f9cc:	100027f3          	csrr	a5,sstatus
8040f9d0:	0027f793          	andi	a5,a5,2
8040f9d4:	16079863          	bnez	a5,8040fb44 <stdin_io+0x1b8>
8040f9d8:	00000913          	li	s2,0
8040f9dc:	160c0063          	beqz	s8,8040fb3c <stdin_io+0x1b0>
8040f9e0:	0008db97          	auipc	s7,0x8d
8040f9e4:	e08b8b93          	addi	s7,s7,-504 # 8049c7e8 <p_rpos>
8040f9e8:	000ba783          	lw	a5,0(s7)
8040f9ec:	800009b7          	lui	s3,0x80000
8040f9f0:	00001a37          	lui	s4,0x1
8040f9f4:	00000413          	li	s0,0
8040f9f8:	0008db17          	auipc	s6,0x8d
8040f9fc:	df4b0b13          	addi	s6,s6,-524 # 8049c7ec <p_wpos>
8040fa00:	00498993          	addi	s3,s3,4 # 80000004 <end+0xffb63744>
8040fa04:	0008da97          	auipc	s5,0x8d
8040fa08:	ddca8a93          	addi	s5,s5,-548 # 8049c7e0 <__wait_queue>
8040fa0c:	fffa0a13          	addi	s4,s4,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040fa10:	000b2703          	lw	a4,0(s6)
8040fa14:	02e7de63          	bge	a5,a4,8040fa50 <stdin_io+0xc4>
8040fa18:	0d80006f          	j	8040faf0 <stdin_io+0x164>
8040fa1c:	c55fd0ef          	jal	ra,8040d670 <schedule>
8040fa20:	100027f3          	csrr	a5,sstatus
8040fa24:	0027f793          	andi	a5,a5,2
8040fa28:	00000913          	li	s2,0
8040fa2c:	04079863          	bnez	a5,8040fa7c <stdin_io+0xf0>
8040fa30:	00c10513          	addi	a0,sp,12
8040fa34:	c28f60ef          	jal	ra,80405e5c <wait_in_queue>
8040fa38:	04051c63          	bnez	a0,8040fa90 <stdin_io+0x104>
8040fa3c:	01012783          	lw	a5,16(sp)
8040fa40:	07379263          	bne	a5,s3,8040faa4 <stdin_io+0x118>
8040fa44:	000ba783          	lw	a5,0(s7)
8040fa48:	000b2703          	lw	a4,0(s6)
8040fa4c:	0ae7c263          	blt	a5,a4,8040faf0 <stdin_io+0x164>
8040fa50:	00098613          	mv	a2,s3
8040fa54:	00c10593          	addi	a1,sp,12
8040fa58:	000a8513          	mv	a0,s5
8040fa5c:	cf8f60ef          	jal	ra,80405f54 <wait_current_set>
8040fa60:	fa090ee3          	beqz	s2,8040fa1c <stdin_io+0x90>
8040fa64:	9c0f10ef          	jal	ra,80400c24 <intr_enable>
8040fa68:	c09fd0ef          	jal	ra,8040d670 <schedule>
8040fa6c:	100027f3          	csrr	a5,sstatus
8040fa70:	0027f793          	andi	a5,a5,2
8040fa74:	00000913          	li	s2,0
8040fa78:	fa078ce3          	beqz	a5,8040fa30 <stdin_io+0xa4>
8040fa7c:	9b0f10ef          	jal	ra,80400c2c <intr_disable>
8040fa80:	00c10513          	addi	a0,sp,12
8040fa84:	00100913          	li	s2,1
8040fa88:	bd4f60ef          	jal	ra,80405e5c <wait_in_queue>
8040fa8c:	fa0508e3          	beqz	a0,8040fa3c <stdin_io+0xb0>
8040fa90:	00c10593          	addi	a1,sp,12
8040fa94:	000a8513          	mv	a0,s5
8040fa98:	b64f60ef          	jal	ra,80405dfc <wait_queue_del>
8040fa9c:	01012783          	lw	a5,16(sp)
8040faa0:	fb3782e3          	beq	a5,s3,8040fa44 <stdin_io+0xb8>
8040faa4:	08091863          	bnez	s2,8040fb34 <stdin_io+0x1a8>
8040faa8:	08040a63          	beqz	s0,8040fb3c <stdin_io+0x1b0>
8040faac:	00c4a783          	lw	a5,12(s1)
8040fab0:	408787b3          	sub	a5,a5,s0
8040fab4:	00f4a623          	sw	a5,12(s1)
8040fab8:	00040513          	mv	a0,s0
8040fabc:	04c12083          	lw	ra,76(sp)
8040fac0:	04812403          	lw	s0,72(sp)
8040fac4:	04412483          	lw	s1,68(sp)
8040fac8:	04012903          	lw	s2,64(sp)
8040facc:	03c12983          	lw	s3,60(sp)
8040fad0:	03812a03          	lw	s4,56(sp)
8040fad4:	03412a83          	lw	s5,52(sp)
8040fad8:	03012b03          	lw	s6,48(sp)
8040fadc:	02c12b83          	lw	s7,44(sp)
8040fae0:	02812c03          	lw	s8,40(sp)
8040fae4:	02412c83          	lw	s9,36(sp)
8040fae8:	05010113          	addi	sp,sp,80
8040faec:	00008067          	ret
8040faf0:	41f7d713          	srai	a4,a5,0x1f
8040faf4:	01475693          	srli	a3,a4,0x14
8040faf8:	00d78733          	add	a4,a5,a3
8040fafc:	01477733          	and	a4,a4,s4
8040fb00:	40d70733          	sub	a4,a4,a3
8040fb04:	0008c697          	auipc	a3,0x8c
8040fb08:	c7c68693          	addi	a3,a3,-900 # 8049b780 <stdin_buffer>
8040fb0c:	00e68733          	add	a4,a3,a4
8040fb10:	00074683          	lbu	a3,0(a4)
8040fb14:	00178793          	addi	a5,a5,1
8040fb18:	008c8733          	add	a4,s9,s0
8040fb1c:	00d70023          	sb	a3,0(a4)
8040fb20:	00140413          	addi	s0,s0,1
8040fb24:	0008d717          	auipc	a4,0x8d
8040fb28:	ccf72223          	sw	a5,-828(a4) # 8049c7e8 <p_rpos>
8040fb2c:	ef8462e3          	bltu	s0,s8,8040fa10 <stdin_io+0x84>
8040fb30:	f6090ee3          	beqz	s2,8040faac <stdin_io+0x120>
8040fb34:	8f0f10ef          	jal	ra,80400c24 <intr_enable>
8040fb38:	f6041ae3          	bnez	s0,8040faac <stdin_io+0x120>
8040fb3c:	00000413          	li	s0,0
8040fb40:	f79ff06f          	j	8040fab8 <stdin_io+0x12c>
8040fb44:	8e8f10ef          	jal	ra,80400c2c <intr_disable>
8040fb48:	00100913          	li	s2,1
8040fb4c:	e80c1ae3          	bnez	s8,8040f9e0 <stdin_io+0x54>
8040fb50:	8d4f10ef          	jal	ra,80400c24 <intr_enable>
8040fb54:	00000413          	li	s0,0
8040fb58:	f61ff06f          	j	8040fab8 <stdin_io+0x12c>
8040fb5c:	ffd00413          	li	s0,-3
8040fb60:	f59ff06f          	j	8040fab8 <stdin_io+0x12c>

8040fb64 <dev_stdin_write>:
8040fb64:	00051463          	bnez	a0,8040fb6c <dev_stdin_write+0x8>
8040fb68:	00008067          	ret
8040fb6c:	ff010113          	addi	sp,sp,-16
8040fb70:	00912223          	sw	s1,4(sp)
8040fb74:	00112623          	sw	ra,12(sp)
8040fb78:	00812423          	sw	s0,8(sp)
8040fb7c:	00050493          	mv	s1,a0
8040fb80:	100027f3          	csrr	a5,sstatus
8040fb84:	0027f793          	andi	a5,a5,2
8040fb88:	00000413          	li	s0,0
8040fb8c:	0a079a63          	bnez	a5,8040fc40 <dev_stdin_write+0xdc>
8040fb90:	0008d797          	auipc	a5,0x8d
8040fb94:	c5c78793          	addi	a5,a5,-932 # 8049c7ec <p_wpos>
8040fb98:	0007a703          	lw	a4,0(a5)
8040fb9c:	000015b7          	lui	a1,0x1
8040fba0:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040fba4:	41f75693          	srai	a3,a4,0x1f
8040fba8:	0146d693          	srli	a3,a3,0x14
8040fbac:	00d707b3          	add	a5,a4,a3
8040fbb0:	00c7f7b3          	and	a5,a5,a2
8040fbb4:	0008d617          	auipc	a2,0x8d
8040fbb8:	c3460613          	addi	a2,a2,-972 # 8049c7e8 <p_rpos>
8040fbbc:	00062603          	lw	a2,0(a2)
8040fbc0:	40d787b3          	sub	a5,a5,a3
8040fbc4:	0008c697          	auipc	a3,0x8c
8040fbc8:	bbc68693          	addi	a3,a3,-1092 # 8049b780 <stdin_buffer>
8040fbcc:	00f687b3          	add	a5,a3,a5
8040fbd0:	00978023          	sb	s1,0(a5)
8040fbd4:	40c707b3          	sub	a5,a4,a2
8040fbd8:	00b7d863          	bge	a5,a1,8040fbe8 <dev_stdin_write+0x84>
8040fbdc:	00170713          	addi	a4,a4,1
8040fbe0:	0008d797          	auipc	a5,0x8d
8040fbe4:	c0e7a623          	sw	a4,-1012(a5) # 8049c7ec <p_wpos>
8040fbe8:	0008d517          	auipc	a0,0x8d
8040fbec:	bf850513          	addi	a0,a0,-1032 # 8049c7e0 <__wait_queue>
8040fbf0:	a5cf60ef          	jal	ra,80405e4c <wait_queue_empty>
8040fbf4:	00050e63          	beqz	a0,8040fc10 <dev_stdin_write+0xac>
8040fbf8:	02041a63          	bnez	s0,8040fc2c <dev_stdin_write+0xc8>
8040fbfc:	00c12083          	lw	ra,12(sp)
8040fc00:	00812403          	lw	s0,8(sp)
8040fc04:	00412483          	lw	s1,4(sp)
8040fc08:	01010113          	addi	sp,sp,16
8040fc0c:	00008067          	ret
8040fc10:	800005b7          	lui	a1,0x80000
8040fc14:	00100613          	li	a2,1
8040fc18:	00458593          	addi	a1,a1,4 # 80000004 <end+0xffb63744>
8040fc1c:	0008d517          	auipc	a0,0x8d
8040fc20:	bc450513          	addi	a0,a0,-1084 # 8049c7e0 <__wait_queue>
8040fc24:	a90f60ef          	jal	ra,80405eb4 <wakeup_queue>
8040fc28:	fc040ae3          	beqz	s0,8040fbfc <dev_stdin_write+0x98>
8040fc2c:	00812403          	lw	s0,8(sp)
8040fc30:	00c12083          	lw	ra,12(sp)
8040fc34:	00412483          	lw	s1,4(sp)
8040fc38:	01010113          	addi	sp,sp,16
8040fc3c:	fe9f006f          	j	80400c24 <intr_enable>
8040fc40:	fedf00ef          	jal	ra,80400c2c <intr_disable>
8040fc44:	00100413          	li	s0,1
8040fc48:	f49ff06f          	j	8040fb90 <dev_stdin_write+0x2c>

8040fc4c <dev_init_stdin>:
8040fc4c:	ff010113          	addi	sp,sp,-16
8040fc50:	00112623          	sw	ra,12(sp)
8040fc54:	00812423          	sw	s0,8(sp)
8040fc58:	909ff0ef          	jal	ra,8040f560 <dev_create_inode>
8040fc5c:	08050c63          	beqz	a0,8040fcf4 <dev_init_stdin+0xa8>
8040fc60:	02c52703          	lw	a4,44(a0)
8040fc64:	000017b7          	lui	a5,0x1
8040fc68:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040fc6c:	00050413          	mv	s0,a0
8040fc70:	0af71c63          	bne	a4,a5,8040fd28 <dev_init_stdin+0xdc>
8040fc74:	00100793          	li	a5,1
8040fc78:	00f42223          	sw	a5,4(s0)
8040fc7c:	00000797          	auipc	a5,0x0
8040fc80:	cec78793          	addi	a5,a5,-788 # 8040f968 <stdin_open>
8040fc84:	00f42423          	sw	a5,8(s0)
8040fc88:	00000797          	auipc	a5,0x0
8040fc8c:	cf478793          	addi	a5,a5,-780 # 8040f97c <stdin_close>
8040fc90:	00f42623          	sw	a5,12(s0)
8040fc94:	00000797          	auipc	a5,0x0
8040fc98:	cf878793          	addi	a5,a5,-776 # 8040f98c <stdin_io>
8040fc9c:	00f42823          	sw	a5,16(s0)
8040fca0:	00000797          	auipc	a5,0x0
8040fca4:	ce478793          	addi	a5,a5,-796 # 8040f984 <stdin_ioctl>
8040fca8:	00f42a23          	sw	a5,20(s0)
8040fcac:	0008d517          	auipc	a0,0x8d
8040fcb0:	b3450513          	addi	a0,a0,-1228 # 8049c7e0 <__wait_queue>
8040fcb4:	00042023          	sw	zero,0(s0)
8040fcb8:	0008d797          	auipc	a5,0x8d
8040fcbc:	b207aa23          	sw	zero,-1228(a5) # 8049c7ec <p_wpos>
8040fcc0:	0008d797          	auipc	a5,0x8d
8040fcc4:	b207a423          	sw	zero,-1240(a5) # 8049c7e8 <p_rpos>
8040fcc8:	928f60ef          	jal	ra,80405df0 <wait_queue_init>
8040fccc:	00000613          	li	a2,0
8040fcd0:	00040593          	mv	a1,s0
8040fcd4:	00006517          	auipc	a0,0x6
8040fcd8:	71850513          	addi	a0,a0,1816 # 804163ec <dev_node_ops+0x214>
8040fcdc:	b79fe0ef          	jal	ra,8040e854 <vfs_add_dev>
8040fce0:	02051663          	bnez	a0,8040fd0c <dev_init_stdin+0xc0>
8040fce4:	00c12083          	lw	ra,12(sp)
8040fce8:	00812403          	lw	s0,8(sp)
8040fcec:	01010113          	addi	sp,sp,16
8040fcf0:	00008067          	ret
8040fcf4:	00006617          	auipc	a2,0x6
8040fcf8:	6c060613          	addi	a2,a2,1728 # 804163b4 <dev_node_ops+0x1dc>
8040fcfc:	07500593          	li	a1,117
8040fd00:	00006517          	auipc	a0,0x6
8040fd04:	6d050513          	addi	a0,a0,1744 # 804163d0 <dev_node_ops+0x1f8>
8040fd08:	91df00ef          	jal	ra,80400624 <__panic>
8040fd0c:	00050693          	mv	a3,a0
8040fd10:	00006617          	auipc	a2,0x6
8040fd14:	6e460613          	addi	a2,a2,1764 # 804163f4 <dev_node_ops+0x21c>
8040fd18:	07b00593          	li	a1,123
8040fd1c:	00006517          	auipc	a0,0x6
8040fd20:	6b450513          	addi	a0,a0,1716 # 804163d0 <dev_node_ops+0x1f8>
8040fd24:	901f00ef          	jal	ra,80400624 <__panic>
8040fd28:	00006697          	auipc	a3,0x6
8040fd2c:	1b868693          	addi	a3,a3,440 # 80415ee0 <syscalls+0x73c>
8040fd30:	00004617          	auipc	a2,0x4
8040fd34:	ab060613          	addi	a2,a2,-1360 # 804137e0 <commands+0x1bc>
8040fd38:	07700593          	li	a1,119
8040fd3c:	00006517          	auipc	a0,0x6
8040fd40:	69450513          	addi	a0,a0,1684 # 804163d0 <dev_node_ops+0x1f8>
8040fd44:	8e1f00ef          	jal	ra,80400624 <__panic>

8040fd48 <stdout_open>:
8040fd48:	00100793          	li	a5,1
8040fd4c:	00000513          	li	a0,0
8040fd50:	00f59463          	bne	a1,a5,8040fd58 <stdout_open+0x10>
8040fd54:	00008067          	ret
8040fd58:	ffd00513          	li	a0,-3
8040fd5c:	00008067          	ret

8040fd60 <stdout_close>:
8040fd60:	00000513          	li	a0,0
8040fd64:	00008067          	ret

8040fd68 <stdout_ioctl>:
8040fd68:	ffd00513          	li	a0,-3
8040fd6c:	00008067          	ret

8040fd70 <stdout_io>:
8040fd70:	04060c63          	beqz	a2,8040fdc8 <stdout_io+0x58>
8040fd74:	00c5a783          	lw	a5,12(a1)
8040fd78:	ff010113          	addi	sp,sp,-16
8040fd7c:	00812423          	sw	s0,8(sp)
8040fd80:	00912223          	sw	s1,4(sp)
8040fd84:	00112623          	sw	ra,12(sp)
8040fd88:	00058493          	mv	s1,a1
8040fd8c:	0005a403          	lw	s0,0(a1)
8040fd90:	02078063          	beqz	a5,8040fdb0 <stdout_io+0x40>
8040fd94:	00140413          	addi	s0,s0,1
8040fd98:	fff44503          	lbu	a0,-1(s0)
8040fd9c:	cc0f00ef          	jal	ra,8040025c <cputchar>
8040fda0:	00c4a783          	lw	a5,12(s1)
8040fda4:	fff78793          	addi	a5,a5,-1
8040fda8:	00f4a623          	sw	a5,12(s1)
8040fdac:	fe0794e3          	bnez	a5,8040fd94 <stdout_io+0x24>
8040fdb0:	00c12083          	lw	ra,12(sp)
8040fdb4:	00812403          	lw	s0,8(sp)
8040fdb8:	00412483          	lw	s1,4(sp)
8040fdbc:	00000513          	li	a0,0
8040fdc0:	01010113          	addi	sp,sp,16
8040fdc4:	00008067          	ret
8040fdc8:	ffd00513          	li	a0,-3
8040fdcc:	00008067          	ret

8040fdd0 <dev_init_stdout>:
8040fdd0:	ff010113          	addi	sp,sp,-16
8040fdd4:	00112623          	sw	ra,12(sp)
8040fdd8:	f88ff0ef          	jal	ra,8040f560 <dev_create_inode>
8040fddc:	06050a63          	beqz	a0,8040fe50 <dev_init_stdout+0x80>
8040fde0:	02c52703          	lw	a4,44(a0)
8040fde4:	000017b7          	lui	a5,0x1
8040fde8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040fdec:	08f71c63          	bne	a4,a5,8040fe84 <dev_init_stdout+0xb4>
8040fdf0:	00100793          	li	a5,1
8040fdf4:	00f52223          	sw	a5,4(a0)
8040fdf8:	00000797          	auipc	a5,0x0
8040fdfc:	f5078793          	addi	a5,a5,-176 # 8040fd48 <stdout_open>
8040fe00:	00f52423          	sw	a5,8(a0)
8040fe04:	00000797          	auipc	a5,0x0
8040fe08:	f5c78793          	addi	a5,a5,-164 # 8040fd60 <stdout_close>
8040fe0c:	00f52623          	sw	a5,12(a0)
8040fe10:	00000797          	auipc	a5,0x0
8040fe14:	f6078793          	addi	a5,a5,-160 # 8040fd70 <stdout_io>
8040fe18:	00f52823          	sw	a5,16(a0)
8040fe1c:	00000797          	auipc	a5,0x0
8040fe20:	f4c78793          	addi	a5,a5,-180 # 8040fd68 <stdout_ioctl>
8040fe24:	00052023          	sw	zero,0(a0)
8040fe28:	00f52a23          	sw	a5,20(a0)
8040fe2c:	00050593          	mv	a1,a0
8040fe30:	00000613          	li	a2,0
8040fe34:	00006517          	auipc	a0,0x6
8040fe38:	61450513          	addi	a0,a0,1556 # 80416448 <dev_node_ops+0x270>
8040fe3c:	a19fe0ef          	jal	ra,8040e854 <vfs_add_dev>
8040fe40:	02051463          	bnez	a0,8040fe68 <dev_init_stdout+0x98>
8040fe44:	00c12083          	lw	ra,12(sp)
8040fe48:	01010113          	addi	sp,sp,16
8040fe4c:	00008067          	ret
8040fe50:	00006617          	auipc	a2,0x6
8040fe54:	5c060613          	addi	a2,a2,1472 # 80416410 <dev_node_ops+0x238>
8040fe58:	03700593          	li	a1,55
8040fe5c:	00006517          	auipc	a0,0x6
8040fe60:	5d050513          	addi	a0,a0,1488 # 8041642c <dev_node_ops+0x254>
8040fe64:	fc0f00ef          	jal	ra,80400624 <__panic>
8040fe68:	00050693          	mv	a3,a0
8040fe6c:	00006617          	auipc	a2,0x6
8040fe70:	5e460613          	addi	a2,a2,1508 # 80416450 <dev_node_ops+0x278>
8040fe74:	03d00593          	li	a1,61
8040fe78:	00006517          	auipc	a0,0x6
8040fe7c:	5b450513          	addi	a0,a0,1460 # 8041642c <dev_node_ops+0x254>
8040fe80:	fa4f00ef          	jal	ra,80400624 <__panic>
8040fe84:	00006697          	auipc	a3,0x6
8040fe88:	05c68693          	addi	a3,a3,92 # 80415ee0 <syscalls+0x73c>
8040fe8c:	00004617          	auipc	a2,0x4
8040fe90:	95460613          	addi	a2,a2,-1708 # 804137e0 <commands+0x1bc>
8040fe94:	03900593          	li	a1,57
8040fe98:	00006517          	auipc	a0,0x6
8040fe9c:	59450513          	addi	a0,a0,1428 # 8041642c <dev_node_ops+0x254>
8040fea0:	f84f00ef          	jal	ra,80400624 <__panic>

8040fea4 <bitmap_translate.isra.0.part.1>:
8040fea4:	ff010113          	addi	sp,sp,-16
8040fea8:	00006697          	auipc	a3,0x6
8040feac:	63c68693          	addi	a3,a3,1596 # 804164e4 <dev_node_ops+0x30c>
8040feb0:	00004617          	auipc	a2,0x4
8040feb4:	93060613          	addi	a2,a2,-1744 # 804137e0 <commands+0x1bc>
8040feb8:	04c00593          	li	a1,76
8040febc:	00006517          	auipc	a0,0x6
8040fec0:	64050513          	addi	a0,a0,1600 # 804164fc <dev_node_ops+0x324>
8040fec4:	00112623          	sw	ra,12(sp)
8040fec8:	f5cf00ef          	jal	ra,80400624 <__panic>

8040fecc <bitmap_create>:
8040fecc:	fe010113          	addi	sp,sp,-32
8040fed0:	00112e23          	sw	ra,28(sp)
8040fed4:	00812c23          	sw	s0,24(sp)
8040fed8:	00912a23          	sw	s1,20(sp)
8040fedc:	01212823          	sw	s2,16(sp)
8040fee0:	01312623          	sw	s3,12(sp)
8040fee4:	01412423          	sw	s4,8(sp)
8040fee8:	fff50713          	addi	a4,a0,-1
8040feec:	fde00793          	li	a5,-34
8040fef0:	0ce7e663          	bltu	a5,a4,8040ffbc <bitmap_create+0xf0>
8040fef4:	00050413          	mv	s0,a0
8040fef8:	00c00513          	li	a0,12
8040fefc:	905f20ef          	jal	ra,80402800 <kmalloc>
8040ff00:	00050493          	mv	s1,a0
8040ff04:	08050263          	beqz	a0,8040ff88 <bitmap_create+0xbc>
8040ff08:	01f40993          	addi	s3,s0,31
8040ff0c:	0059d913          	srli	s2,s3,0x5
8040ff10:	00291a13          	slli	s4,s2,0x2
8040ff14:	000a0513          	mv	a0,s4
8040ff18:	8e9f20ef          	jal	ra,80402800 <kmalloc>
8040ff1c:	08050863          	beqz	a0,8040ffac <bitmap_create+0xe0>
8040ff20:	0084a023          	sw	s0,0(s1)
8040ff24:	0124a223          	sw	s2,4(s1)
8040ff28:	000a0613          	mv	a2,s4
8040ff2c:	0ff00593          	li	a1,255
8040ff30:	480030ef          	jal	ra,804133b0 <memset>
8040ff34:	00a4a423          	sw	a0,8(s1)
8040ff38:	fe09f993          	andi	s3,s3,-32
8040ff3c:	04898663          	beq	s3,s0,8040ff88 <bitmap_create+0xbc>
8040ff40:	fff90913          	addi	s2,s2,-1 # 3fff <_binary_bin_swap_img_size-0x4001>
8040ff44:	00591793          	slli	a5,s2,0x5
8040ff48:	00545713          	srli	a4,s0,0x5
8040ff4c:	40f407b3          	sub	a5,s0,a5
8040ff50:	0b271663          	bne	a4,s2,8040fffc <bitmap_create+0x130>
8040ff54:	fff78693          	addi	a3,a5,-1
8040ff58:	01e00613          	li	a2,30
8040ff5c:	08d66063          	bltu	a2,a3,8040ffdc <bitmap_create+0x110>
8040ff60:	00271713          	slli	a4,a4,0x2
8040ff64:	00e50533          	add	a0,a0,a4
8040ff68:	00052703          	lw	a4,0(a0)
8040ff6c:	00100593          	li	a1,1
8040ff70:	02000613          	li	a2,32
8040ff74:	00f596b3          	sll	a3,a1,a5
8040ff78:	00178793          	addi	a5,a5,1
8040ff7c:	00d74733          	xor	a4,a4,a3
8040ff80:	fec79ae3          	bne	a5,a2,8040ff74 <bitmap_create+0xa8>
8040ff84:	00e52023          	sw	a4,0(a0)
8040ff88:	01c12083          	lw	ra,28(sp)
8040ff8c:	01812403          	lw	s0,24(sp)
8040ff90:	00048513          	mv	a0,s1
8040ff94:	01012903          	lw	s2,16(sp)
8040ff98:	01412483          	lw	s1,20(sp)
8040ff9c:	00c12983          	lw	s3,12(sp)
8040ffa0:	00812a03          	lw	s4,8(sp)
8040ffa4:	02010113          	addi	sp,sp,32
8040ffa8:	00008067          	ret
8040ffac:	00048513          	mv	a0,s1
8040ffb0:	975f20ef          	jal	ra,80402924 <kfree>
8040ffb4:	00000493          	li	s1,0
8040ffb8:	fd1ff06f          	j	8040ff88 <bitmap_create+0xbc>
8040ffbc:	00006697          	auipc	a3,0x6
8040ffc0:	4b068693          	addi	a3,a3,1200 # 8041646c <dev_node_ops+0x294>
8040ffc4:	00004617          	auipc	a2,0x4
8040ffc8:	81c60613          	addi	a2,a2,-2020 # 804137e0 <commands+0x1bc>
8040ffcc:	01500593          	li	a1,21
8040ffd0:	00006517          	auipc	a0,0x6
8040ffd4:	52c50513          	addi	a0,a0,1324 # 804164fc <dev_node_ops+0x324>
8040ffd8:	e4cf00ef          	jal	ra,80400624 <__panic>
8040ffdc:	00006697          	auipc	a3,0x6
8040ffe0:	4d068693          	addi	a3,a3,1232 # 804164ac <dev_node_ops+0x2d4>
8040ffe4:	00003617          	auipc	a2,0x3
8040ffe8:	7fc60613          	addi	a2,a2,2044 # 804137e0 <commands+0x1bc>
8040ffec:	02b00593          	li	a1,43
8040fff0:	00006517          	auipc	a0,0x6
8040fff4:	50c50513          	addi	a0,a0,1292 # 804164fc <dev_node_ops+0x324>
8040fff8:	e2cf00ef          	jal	ra,80400624 <__panic>
8040fffc:	00006697          	auipc	a3,0x6
80410000:	49868693          	addi	a3,a3,1176 # 80416494 <dev_node_ops+0x2bc>
80410004:	00003617          	auipc	a2,0x3
80410008:	7dc60613          	addi	a2,a2,2012 # 804137e0 <commands+0x1bc>
8041000c:	02a00593          	li	a1,42
80410010:	00006517          	auipc	a0,0x6
80410014:	4ec50513          	addi	a0,a0,1260 # 804164fc <dev_node_ops+0x324>
80410018:	e0cf00ef          	jal	ra,80400624 <__panic>

8041001c <bitmap_alloc>:
8041001c:	00452603          	lw	a2,4(a0)
80410020:	00852803          	lw	a6,8(a0)
80410024:	02060663          	beqz	a2,80410050 <bitmap_alloc+0x34>
80410028:	00082703          	lw	a4,0(a6)
8041002c:	00480793          	addi	a5,a6,4
80410030:	00070c63          	beqz	a4,80410048 <bitmap_alloc+0x2c>
80410034:	0240006f          	j	80410058 <bitmap_alloc+0x3c>
80410038:	00078813          	mv	a6,a5
8041003c:	00478793          	addi	a5,a5,4
80410040:	ffc7a683          	lw	a3,-4(a5)
80410044:	00069e63          	bnez	a3,80410060 <bitmap_alloc+0x44>
80410048:	00170713          	addi	a4,a4,1
8041004c:	fee616e3          	bne	a2,a4,80410038 <bitmap_alloc+0x1c>
80410050:	ffc00513          	li	a0,-4
80410054:	00008067          	ret
80410058:	00070693          	mv	a3,a4
8041005c:	00000713          	li	a4,0
80410060:	00000793          	li	a5,0
80410064:	00100893          	li	a7,1
80410068:	02000313          	li	t1,32
8041006c:	00c0006f          	j	80410078 <bitmap_alloc+0x5c>
80410070:	00178793          	addi	a5,a5,1
80410074:	02678663          	beq	a5,t1,804100a0 <bitmap_alloc+0x84>
80410078:	00f89633          	sll	a2,a7,a5
8041007c:	00c6f533          	and	a0,a3,a2
80410080:	fe0508e3          	beqz	a0,80410070 <bitmap_alloc+0x54>
80410084:	00c6c6b3          	xor	a3,a3,a2
80410088:	00571713          	slli	a4,a4,0x5
8041008c:	00d82023          	sw	a3,0(a6)
80410090:	00f70733          	add	a4,a4,a5
80410094:	00e5a023          	sw	a4,0(a1)
80410098:	00000513          	li	a0,0
8041009c:	00008067          	ret
804100a0:	ff010113          	addi	sp,sp,-16
804100a4:	00005697          	auipc	a3,0x5
804100a8:	a0468693          	addi	a3,a3,-1532 # 80414aa8 <default_pmm_manager+0xa4c>
804100ac:	00003617          	auipc	a2,0x3
804100b0:	73460613          	addi	a2,a2,1844 # 804137e0 <commands+0x1bc>
804100b4:	04300593          	li	a1,67
804100b8:	00006517          	auipc	a0,0x6
804100bc:	44450513          	addi	a0,a0,1092 # 804164fc <dev_node_ops+0x324>
804100c0:	00112623          	sw	ra,12(sp)
804100c4:	d60f00ef          	jal	ra,80400624 <__panic>

804100c8 <bitmap_test>:
804100c8:	00052783          	lw	a5,0(a0)
804100cc:	02f5f463          	bgeu	a1,a5,804100f4 <bitmap_test+0x2c>
804100d0:	00852783          	lw	a5,8(a0)
804100d4:	0055d713          	srli	a4,a1,0x5
804100d8:	00271713          	slli	a4,a4,0x2
804100dc:	00e787b3          	add	a5,a5,a4
804100e0:	0007a503          	lw	a0,0(a5)
804100e4:	00100793          	li	a5,1
804100e8:	00b795b3          	sll	a1,a5,a1
804100ec:	00a5f533          	and	a0,a1,a0
804100f0:	00008067          	ret
804100f4:	ff010113          	addi	sp,sp,-16
804100f8:	00112623          	sw	ra,12(sp)
804100fc:	da9ff0ef          	jal	ra,8040fea4 <bitmap_translate.isra.0.part.1>

80410100 <bitmap_free>:
80410100:	00052783          	lw	a5,0(a0)
80410104:	ff010113          	addi	sp,sp,-16
80410108:	00112623          	sw	ra,12(sp)
8041010c:	02f5fe63          	bgeu	a1,a5,80410148 <bitmap_free+0x48>
80410110:	00852783          	lw	a5,8(a0)
80410114:	0055d713          	srli	a4,a1,0x5
80410118:	00271713          	slli	a4,a4,0x2
8041011c:	00e787b3          	add	a5,a5,a4
80410120:	0007a703          	lw	a4,0(a5)
80410124:	00100693          	li	a3,1
80410128:	00b695b3          	sll	a1,a3,a1
8041012c:	00b776b3          	and	a3,a4,a1
80410130:	00069e63          	bnez	a3,8041014c <bitmap_free+0x4c>
80410134:	00c12083          	lw	ra,12(sp)
80410138:	00b76733          	or	a4,a4,a1
8041013c:	00e7a023          	sw	a4,0(a5)
80410140:	01010113          	addi	sp,sp,16
80410144:	00008067          	ret
80410148:	d5dff0ef          	jal	ra,8040fea4 <bitmap_translate.isra.0.part.1>
8041014c:	00006697          	auipc	a3,0x6
80410150:	38868693          	addi	a3,a3,904 # 804164d4 <dev_node_ops+0x2fc>
80410154:	00003617          	auipc	a2,0x3
80410158:	68c60613          	addi	a2,a2,1676 # 804137e0 <commands+0x1bc>
8041015c:	05f00593          	li	a1,95
80410160:	00006517          	auipc	a0,0x6
80410164:	39c50513          	addi	a0,a0,924 # 804164fc <dev_node_ops+0x324>
80410168:	cbcf00ef          	jal	ra,80400624 <__panic>

8041016c <bitmap_destroy>:
8041016c:	ff010113          	addi	sp,sp,-16
80410170:	00812423          	sw	s0,8(sp)
80410174:	00050413          	mv	s0,a0
80410178:	00852503          	lw	a0,8(a0)
8041017c:	00112623          	sw	ra,12(sp)
80410180:	fa4f20ef          	jal	ra,80402924 <kfree>
80410184:	00040513          	mv	a0,s0
80410188:	00812403          	lw	s0,8(sp)
8041018c:	00c12083          	lw	ra,12(sp)
80410190:	01010113          	addi	sp,sp,16
80410194:	f90f206f          	j	80402924 <kfree>

80410198 <bitmap_getdata>:
80410198:	00058863          	beqz	a1,804101a8 <bitmap_getdata+0x10>
8041019c:	00452783          	lw	a5,4(a0)
804101a0:	00279793          	slli	a5,a5,0x2
804101a4:	00f5a023          	sw	a5,0(a1)
804101a8:	00852503          	lw	a0,8(a0)
804101ac:	00008067          	ret

804101b0 <sfs_init>:
804101b0:	ff010113          	addi	sp,sp,-16
804101b4:	00006517          	auipc	a0,0x6
804101b8:	0bc50513          	addi	a0,a0,188 # 80416270 <dev_node_ops+0x98>
804101bc:	00112623          	sw	ra,12(sp)
804101c0:	784000ef          	jal	ra,80410944 <sfs_mount>
804101c4:	00051863          	bnez	a0,804101d4 <sfs_init+0x24>
804101c8:	00c12083          	lw	ra,12(sp)
804101cc:	01010113          	addi	sp,sp,16
804101d0:	00008067          	ret
804101d4:	00050693          	mv	a3,a0
804101d8:	00006617          	auipc	a2,0x6
804101dc:	33c60613          	addi	a2,a2,828 # 80416514 <dev_node_ops+0x33c>
804101e0:	01000593          	li	a1,16
804101e4:	00006517          	auipc	a0,0x6
804101e8:	35050513          	addi	a0,a0,848 # 80416534 <dev_node_ops+0x35c>
804101ec:	c38f00ef          	jal	ra,80400624 <__panic>

804101f0 <sfs_sync>:
804101f0:	fe010113          	addi	sp,sp,-32
804101f4:	00112e23          	sw	ra,28(sp)
804101f8:	00812c23          	sw	s0,24(sp)
804101fc:	00912a23          	sw	s1,20(sp)
80410200:	01212823          	sw	s2,16(sp)
80410204:	01312623          	sw	s3,12(sp)
80410208:	01412423          	sw	s4,8(sp)
8041020c:	12050a63          	beqz	a0,80410340 <sfs_sync+0x150>
80410210:	06c52783          	lw	a5,108(a0)
80410214:	00050a13          	mv	s4,a0
80410218:	12079463          	bnez	a5,80410340 <sfs_sync+0x150>
8041021c:	135020ef          	jal	ra,80412b50 <lock_sfs_fs>
80410220:	064a2403          	lw	s0,100(s4)
80410224:	060a0913          	addi	s2,s4,96
80410228:	06890263          	beq	s2,s0,8041028c <sfs_sync+0x9c>
8041022c:	fe440493          	addi	s1,s0,-28
80410230:	0e048863          	beqz	s1,80410320 <sfs_sync+0x130>
80410234:	02042783          	lw	a5,32(s0)
80410238:	0e078463          	beqz	a5,80410320 <sfs_sync+0x130>
8041023c:	0187a783          	lw	a5,24(a5)
80410240:	0e078063          	beqz	a5,80410320 <sfs_sync+0x130>
80410244:	00005997          	auipc	s3,0x5
80410248:	c9098993          	addi	s3,s3,-880 # 80414ed4 <CSWTCH.69+0x17c>
8041024c:	01c0006f          	j	80410268 <sfs_sync+0x78>
80410250:	fe440493          	addi	s1,s0,-28
80410254:	0c048663          	beqz	s1,80410320 <sfs_sync+0x130>
80410258:	02042783          	lw	a5,32(s0)
8041025c:	0c078263          	beqz	a5,80410320 <sfs_sync+0x130>
80410260:	0187a783          	lw	a5,24(a5)
80410264:	0a078e63          	beqz	a5,80410320 <sfs_sync+0x130>
80410268:	00098593          	mv	a1,s3
8041026c:	00048513          	mv	a0,s1
80410270:	d79fd0ef          	jal	ra,8040dfe8 <inode_check>
80410274:	02042783          	lw	a5,32(s0)
80410278:	00048513          	mv	a0,s1
8041027c:	0187a783          	lw	a5,24(a5)
80410280:	000780e7          	jalr	a5
80410284:	00442403          	lw	s0,4(s0)
80410288:	fc8914e3          	bne	s2,s0,80410250 <sfs_sync+0x60>
8041028c:	000a0513          	mv	a0,s4
80410290:	0d1020ef          	jal	ra,80412b60 <unlock_sfs_fs>
80410294:	034a2503          	lw	a0,52(s4)
80410298:	02051263          	bnez	a0,804102bc <sfs_sync+0xcc>
8041029c:	01c12083          	lw	ra,28(sp)
804102a0:	01812403          	lw	s0,24(sp)
804102a4:	01412483          	lw	s1,20(sp)
804102a8:	01012903          	lw	s2,16(sp)
804102ac:	00c12983          	lw	s3,12(sp)
804102b0:	00812a03          	lw	s4,8(sp)
804102b4:	02010113          	addi	sp,sp,32
804102b8:	00008067          	ret
804102bc:	020a2a23          	sw	zero,52(s4)
804102c0:	000a0513          	mv	a0,s4
804102c4:	700020ef          	jal	ra,804129c4 <sfs_sync_super>
804102c8:	02050663          	beqz	a0,804102f4 <sfs_sync+0x104>
804102cc:	01c12083          	lw	ra,28(sp)
804102d0:	01812403          	lw	s0,24(sp)
804102d4:	00100793          	li	a5,1
804102d8:	02fa2a23          	sw	a5,52(s4)
804102dc:	01412483          	lw	s1,20(sp)
804102e0:	01012903          	lw	s2,16(sp)
804102e4:	00c12983          	lw	s3,12(sp)
804102e8:	00812a03          	lw	s4,8(sp)
804102ec:	02010113          	addi	sp,sp,32
804102f0:	00008067          	ret
804102f4:	000a0513          	mv	a0,s4
804102f8:	744020ef          	jal	ra,80412a3c <sfs_sync_freemap>
804102fc:	fc0518e3          	bnez	a0,804102cc <sfs_sync+0xdc>
80410300:	01c12083          	lw	ra,28(sp)
80410304:	01812403          	lw	s0,24(sp)
80410308:	01412483          	lw	s1,20(sp)
8041030c:	01012903          	lw	s2,16(sp)
80410310:	00c12983          	lw	s3,12(sp)
80410314:	00812a03          	lw	s4,8(sp)
80410318:	02010113          	addi	sp,sp,32
8041031c:	00008067          	ret
80410320:	00005697          	auipc	a3,0x5
80410324:	b6468693          	addi	a3,a3,-1180 # 80414e84 <CSWTCH.69+0x12c>
80410328:	00003617          	auipc	a2,0x3
8041032c:	4b860613          	addi	a2,a2,1208 # 804137e0 <commands+0x1bc>
80410330:	01b00593          	li	a1,27
80410334:	00006517          	auipc	a0,0x6
80410338:	37850513          	addi	a0,a0,888 # 804166ac <dev_node_ops+0x4d4>
8041033c:	ae8f00ef          	jal	ra,80400624 <__panic>
80410340:	00006697          	auipc	a3,0x6
80410344:	34068693          	addi	a3,a3,832 # 80416680 <dev_node_ops+0x4a8>
80410348:	00003617          	auipc	a2,0x3
8041034c:	49860613          	addi	a2,a2,1176 # 804137e0 <commands+0x1bc>
80410350:	01500593          	li	a1,21
80410354:	00006517          	auipc	a0,0x6
80410358:	35850513          	addi	a0,a0,856 # 804166ac <dev_node_ops+0x4d4>
8041035c:	ac8f00ef          	jal	ra,80400624 <__panic>

80410360 <sfs_init_read>:
80410360:	fe010113          	addi	sp,sp,-32
80410364:	00060793          	mv	a5,a2
80410368:	00812c23          	sw	s0,24(sp)
8041036c:	00c59693          	slli	a3,a1,0xc
80410370:	00050413          	mv	s0,a0
80410374:	00078593          	mv	a1,a5
80410378:	00001637          	lui	a2,0x1
8041037c:	00010513          	mv	a0,sp
80410380:	00112e23          	sw	ra,28(sp)
80410384:	e35f60ef          	jal	ra,804071b8 <iobuf_init>
80410388:	01042783          	lw	a5,16(s0)
8041038c:	00050593          	mv	a1,a0
80410390:	00000613          	li	a2,0
80410394:	00040513          	mv	a0,s0
80410398:	000780e7          	jalr	a5
8041039c:	01c12083          	lw	ra,28(sp)
804103a0:	01812403          	lw	s0,24(sp)
804103a4:	02010113          	addi	sp,sp,32
804103a8:	00008067          	ret

804103ac <sfs_unmount>:
804103ac:	ff010113          	addi	sp,sp,-16
804103b0:	00112623          	sw	ra,12(sp)
804103b4:	00812423          	sw	s0,8(sp)
804103b8:	00912223          	sw	s1,4(sp)
804103bc:	06050263          	beqz	a0,80410420 <sfs_unmount+0x74>
804103c0:	06c52783          	lw	a5,108(a0)
804103c4:	00050413          	mv	s0,a0
804103c8:	04079c63          	bnez	a5,80410420 <sfs_unmount+0x74>
804103cc:	06452703          	lw	a4,100(a0)
804103d0:	06050793          	addi	a5,a0,96
804103d4:	04f71263          	bne	a4,a5,80410418 <sfs_unmount+0x6c>
804103d8:	03452483          	lw	s1,52(a0)
804103dc:	06049263          	bnez	s1,80410440 <sfs_unmount+0x94>
804103e0:	03052503          	lw	a0,48(a0)
804103e4:	d89ff0ef          	jal	ra,8041016c <bitmap_destroy>
804103e8:	03842503          	lw	a0,56(s0)
804103ec:	d38f20ef          	jal	ra,80402924 <kfree>
804103f0:	06842503          	lw	a0,104(s0)
804103f4:	d30f20ef          	jal	ra,80402924 <kfree>
804103f8:	00040513          	mv	a0,s0
804103fc:	d28f20ef          	jal	ra,80402924 <kfree>
80410400:	00c12083          	lw	ra,12(sp)
80410404:	00812403          	lw	s0,8(sp)
80410408:	00048513          	mv	a0,s1
8041040c:	00412483          	lw	s1,4(sp)
80410410:	01010113          	addi	sp,sp,16
80410414:	00008067          	ret
80410418:	ff100493          	li	s1,-15
8041041c:	fe5ff06f          	j	80410400 <sfs_unmount+0x54>
80410420:	00006697          	auipc	a3,0x6
80410424:	26068693          	addi	a3,a3,608 # 80416680 <dev_node_ops+0x4a8>
80410428:	00003617          	auipc	a2,0x3
8041042c:	3b860613          	addi	a2,a2,952 # 804137e0 <commands+0x1bc>
80410430:	04100593          	li	a1,65
80410434:	00006517          	auipc	a0,0x6
80410438:	27850513          	addi	a0,a0,632 # 804166ac <dev_node_ops+0x4d4>
8041043c:	9e8f00ef          	jal	ra,80400624 <__panic>
80410440:	00006697          	auipc	a3,0x6
80410444:	28468693          	addi	a3,a3,644 # 804166c4 <dev_node_ops+0x4ec>
80410448:	00003617          	auipc	a2,0x3
8041044c:	39860613          	addi	a2,a2,920 # 804137e0 <commands+0x1bc>
80410450:	04500593          	li	a1,69
80410454:	00006517          	auipc	a0,0x6
80410458:	25850513          	addi	a0,a0,600 # 804166ac <dev_node_ops+0x4d4>
8041045c:	9c8f00ef          	jal	ra,80400624 <__panic>

80410460 <sfs_cleanup>:
80410460:	ff010113          	addi	sp,sp,-16
80410464:	00112623          	sw	ra,12(sp)
80410468:	00812423          	sw	s0,8(sp)
8041046c:	00912223          	sw	s1,4(sp)
80410470:	01212023          	sw	s2,0(sp)
80410474:	08050e63          	beqz	a0,80410510 <sfs_cleanup+0xb0>
80410478:	06c52783          	lw	a5,108(a0)
8041047c:	00050493          	mv	s1,a0
80410480:	08079863          	bnez	a5,80410510 <sfs_cleanup+0xb0>
80410484:	00452703          	lw	a4,4(a0)
80410488:	00852683          	lw	a3,8(a0)
8041048c:	00c50913          	addi	s2,a0,12
80410490:	00090593          	mv	a1,s2
80410494:	40d70633          	sub	a2,a4,a3
80410498:	00006517          	auipc	a0,0x6
8041049c:	0b050513          	addi	a0,a0,176 # 80416548 <dev_node_ops+0x370>
804104a0:	d5def0ef          	jal	ra,804001fc <cprintf>
804104a4:	02000413          	li	s0,32
804104a8:	00c0006f          	j	804104b4 <sfs_cleanup+0x54>
804104ac:	fff40413          	addi	s0,s0,-1
804104b0:	02040663          	beqz	s0,804104dc <sfs_cleanup+0x7c>
804104b4:	0704a783          	lw	a5,112(s1)
804104b8:	00048513          	mv	a0,s1
804104bc:	000780e7          	jalr	a5
804104c0:	fe0516e3          	bnez	a0,804104ac <sfs_cleanup+0x4c>
804104c4:	00c12083          	lw	ra,12(sp)
804104c8:	00812403          	lw	s0,8(sp)
804104cc:	00412483          	lw	s1,4(sp)
804104d0:	00012903          	lw	s2,0(sp)
804104d4:	01010113          	addi	sp,sp,16
804104d8:	00008067          	ret
804104dc:	00812403          	lw	s0,8(sp)
804104e0:	00c12083          	lw	ra,12(sp)
804104e4:	00412483          	lw	s1,4(sp)
804104e8:	00090693          	mv	a3,s2
804104ec:	00012903          	lw	s2,0(sp)
804104f0:	00050713          	mv	a4,a0
804104f4:	00006617          	auipc	a2,0x6
804104f8:	07460613          	addi	a2,a2,116 # 80416568 <dev_node_ops+0x390>
804104fc:	05f00593          	li	a1,95
80410500:	00006517          	auipc	a0,0x6
80410504:	1ac50513          	addi	a0,a0,428 # 804166ac <dev_node_ops+0x4d4>
80410508:	01010113          	addi	sp,sp,16
8041050c:	99cf006f          	j	804006a8 <__warn>
80410510:	00006697          	auipc	a3,0x6
80410514:	17068693          	addi	a3,a3,368 # 80416680 <dev_node_ops+0x4a8>
80410518:	00003617          	auipc	a2,0x3
8041051c:	2c860613          	addi	a2,a2,712 # 804137e0 <commands+0x1bc>
80410520:	05400593          	li	a1,84
80410524:	00006517          	auipc	a0,0x6
80410528:	18850513          	addi	a0,a0,392 # 804166ac <dev_node_ops+0x4d4>
8041052c:	8f8f00ef          	jal	ra,80400624 <__panic>

80410530 <sfs_get_root>:
80410530:	fe010113          	addi	sp,sp,-32
80410534:	00112e23          	sw	ra,28(sp)
80410538:	02050663          	beqz	a0,80410564 <sfs_get_root+0x34>
8041053c:	06c52783          	lw	a5,108(a0)
80410540:	02079263          	bnez	a5,80410564 <sfs_get_root+0x34>
80410544:	00100613          	li	a2,1
80410548:	00c10593          	addi	a1,sp,12
8041054c:	0e5010ef          	jal	ra,80411e30 <sfs_load_inode>
80410550:	02051a63          	bnez	a0,80410584 <sfs_get_root+0x54>
80410554:	01c12083          	lw	ra,28(sp)
80410558:	00c12503          	lw	a0,12(sp)
8041055c:	02010113          	addi	sp,sp,32
80410560:	00008067          	ret
80410564:	00006697          	auipc	a3,0x6
80410568:	11c68693          	addi	a3,a3,284 # 80416680 <dev_node_ops+0x4a8>
8041056c:	00003617          	auipc	a2,0x3
80410570:	27460613          	addi	a2,a2,628 # 804137e0 <commands+0x1bc>
80410574:	03600593          	li	a1,54
80410578:	00006517          	auipc	a0,0x6
8041057c:	13450513          	addi	a0,a0,308 # 804166ac <dev_node_ops+0x4d4>
80410580:	8a4f00ef          	jal	ra,80400624 <__panic>
80410584:	00050693          	mv	a3,a0
80410588:	00006617          	auipc	a2,0x6
8041058c:	0dc60613          	addi	a2,a2,220 # 80416664 <dev_node_ops+0x48c>
80410590:	03700593          	li	a1,55
80410594:	00006517          	auipc	a0,0x6
80410598:	11850513          	addi	a0,a0,280 # 804166ac <dev_node_ops+0x4d4>
8041059c:	888f00ef          	jal	ra,80400624 <__panic>

804105a0 <sfs_do_mount>:
804105a0:	00452703          	lw	a4,4(a0)
804105a4:	fa010113          	addi	sp,sp,-96
804105a8:	04112e23          	sw	ra,92(sp)
804105ac:	04812c23          	sw	s0,88(sp)
804105b0:	04912a23          	sw	s1,84(sp)
804105b4:	05212823          	sw	s2,80(sp)
804105b8:	05312623          	sw	s3,76(sp)
804105bc:	05412423          	sw	s4,72(sp)
804105c0:	05512223          	sw	s5,68(sp)
804105c4:	05612023          	sw	s6,64(sp)
804105c8:	03712e23          	sw	s7,60(sp)
804105cc:	03812c23          	sw	s8,56(sp)
804105d0:	03912a23          	sw	s9,52(sp)
804105d4:	03a12823          	sw	s10,48(sp)
804105d8:	03b12623          	sw	s11,44(sp)
804105dc:	000017b7          	lui	a5,0x1
804105e0:	2ef71263          	bne	a4,a5,804108c4 <sfs_do_mount+0x324>
804105e4:	00050913          	mv	s2,a0
804105e8:	00000513          	li	a0,0
804105ec:	00058a93          	mv	s5,a1
804105f0:	c85fd0ef          	jal	ra,8040e274 <__alloc_fs>
804105f4:	00050413          	mv	s0,a0
804105f8:	2e050263          	beqz	a0,804108dc <sfs_do_mount+0x33c>
804105fc:	06c52a03          	lw	s4,108(a0)
80410600:	300a1263          	bnez	s4,80410904 <sfs_do_mount+0x364>
80410604:	03252623          	sw	s2,44(a0)
80410608:	00001537          	lui	a0,0x1
8041060c:	9f4f20ef          	jal	ra,80402800 <kmalloc>
80410610:	02a42c23          	sw	a0,56(s0)
80410614:	00050493          	mv	s1,a0
80410618:	1a050c63          	beqz	a0,804107d0 <sfs_do_mount+0x230>
8041061c:	00050613          	mv	a2,a0
80410620:	00000593          	li	a1,0
80410624:	00090513          	mv	a0,s2
80410628:	d39ff0ef          	jal	ra,80410360 <sfs_init_read>
8041062c:	00050b13          	mv	s6,a0
80410630:	14051863          	bnez	a0,80410780 <sfs_do_mount+0x1e0>
80410634:	0004a583          	lw	a1,0(s1)
80410638:	2f8dc637          	lui	a2,0x2f8dc
8041063c:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f863e2a>
80410640:	1ac59863          	bne	a1,a2,804107f0 <sfs_do_mount+0x250>
80410644:	0044a783          	lw	a5,4(s1)
80410648:	00092603          	lw	a2,0(s2)
8041064c:	18f66663          	bltu	a2,a5,804107d8 <sfs_do_mount+0x238>
80410650:	020485a3          	sb	zero,43(s1)
80410654:	0084af03          	lw	t5,8(s1)
80410658:	00c4ae83          	lw	t4,12(s1)
8041065c:	0104ae03          	lw	t3,16(s1)
80410660:	0144a303          	lw	t1,20(s1)
80410664:	0184a883          	lw	a7,24(s1)
80410668:	01c4a803          	lw	a6,28(s1)
8041066c:	0204a603          	lw	a2,32(s1)
80410670:	0244a683          	lw	a3,36(s1)
80410674:	0284a703          	lw	a4,40(s1)
80410678:	00002537          	lui	a0,0x2
8041067c:	00f42223          	sw	a5,4(s0)
80410680:	00b42023          	sw	a1,0(s0)
80410684:	01e42423          	sw	t5,8(s0)
80410688:	01d42623          	sw	t4,12(s0)
8041068c:	01c42823          	sw	t3,16(s0)
80410690:	00642a23          	sw	t1,20(s0)
80410694:	01142c23          	sw	a7,24(s0)
80410698:	01042e23          	sw	a6,28(s0)
8041069c:	02c42023          	sw	a2,32(s0)
804106a0:	02d42223          	sw	a3,36(s0)
804106a4:	02e42423          	sw	a4,40(s0)
804106a8:	958f20ef          	jal	ra,80402800 <kmalloc>
804106ac:	00a12423          	sw	a0,8(sp)
804106b0:	06a42423          	sw	a0,104(s0)
804106b4:	00050793          	mv	a5,a0
804106b8:	20050a63          	beqz	a0,804108cc <sfs_do_mount+0x32c>
804106bc:	00002737          	lui	a4,0x2
804106c0:	00e50733          	add	a4,a0,a4
804106c4:	00f7a223          	sw	a5,4(a5) # 1004 <_binary_bin_swap_img_size-0x6ffc>
804106c8:	00f7a023          	sw	a5,0(a5)
804106cc:	00878793          	addi	a5,a5,8
804106d0:	fee79ae3          	bne	a5,a4,804106c4 <sfs_do_mount+0x124>
804106d4:	0044ab83          	lw	s7,4(s1)
804106d8:	00008737          	lui	a4,0x8
804106dc:	fff70993          	addi	s3,a4,-1 # 7fff <_binary_bin_swap_img_size-0x1>
804106e0:	ffff87b7          	lui	a5,0xffff8
804106e4:	013b8bb3          	add	s7,s7,s3
804106e8:	00fbfbb3          	and	s7,s7,a5
804106ec:	000b8513          	mv	a0,s7
804106f0:	fdcff0ef          	jal	ra,8040fecc <bitmap_create>
804106f4:	02a42823          	sw	a0,48(s0)
804106f8:	00050c93          	mv	s9,a0
804106fc:	1c050063          	beqz	a0,804108bc <sfs_do_mount+0x31c>
80410700:	0044a703          	lw	a4,4(s1)
80410704:	01c10593          	addi	a1,sp,28
80410708:	01370733          	add	a4,a4,s3
8041070c:	00f75713          	srli	a4,a4,0xf
80410710:	00e12623          	sw	a4,12(sp)
80410714:	a85ff0ef          	jal	ra,80410198 <bitmap_getdata>
80410718:	00050c13          	mv	s8,a0
8041071c:	1c050463          	beqz	a0,804108e4 <sfs_do_mount+0x344>
80410720:	00c12703          	lw	a4,12(sp)
80410724:	01c12683          	lw	a3,28(sp)
80410728:	00c71613          	slli	a2,a4,0xc
8041072c:	1ad61c63          	bne	a2,a3,804108e4 <sfs_do_mount+0x344>
80410730:	00200993          	li	s3,2
80410734:	00001db7          	lui	s11,0x1
80410738:	00270d13          	addi	s10,a4,2
8041073c:	00071a63          	bnez	a4,80410750 <sfs_do_mount+0x1b0>
80410740:	0c40006f          	j	80410804 <sfs_do_mount+0x264>
80410744:	00198993          	addi	s3,s3,1
80410748:	01bc0c33          	add	s8,s8,s11
8041074c:	0ba98c63          	beq	s3,s10,80410804 <sfs_do_mount+0x264>
80410750:	000c0613          	mv	a2,s8
80410754:	00098593          	mv	a1,s3
80410758:	00090513          	mv	a0,s2
8041075c:	c05ff0ef          	jal	ra,80410360 <sfs_init_read>
80410760:	fe0502e3          	beqz	a0,80410744 <sfs_do_mount+0x1a4>
80410764:	00a12623          	sw	a0,12(sp)
80410768:	000c8513          	mv	a0,s9
8041076c:	a01ff0ef          	jal	ra,8041016c <bitmap_destroy>
80410770:	00c12703          	lw	a4,12(sp)
80410774:	00070b13          	mv	s6,a4
80410778:	00812503          	lw	a0,8(sp)
8041077c:	9a8f20ef          	jal	ra,80402924 <kfree>
80410780:	00048513          	mv	a0,s1
80410784:	9a0f20ef          	jal	ra,80402924 <kfree>
80410788:	00040513          	mv	a0,s0
8041078c:	998f20ef          	jal	ra,80402924 <kfree>
80410790:	05c12083          	lw	ra,92(sp)
80410794:	05812403          	lw	s0,88(sp)
80410798:	000b0513          	mv	a0,s6
8041079c:	05412483          	lw	s1,84(sp)
804107a0:	05012903          	lw	s2,80(sp)
804107a4:	04c12983          	lw	s3,76(sp)
804107a8:	04812a03          	lw	s4,72(sp)
804107ac:	04412a83          	lw	s5,68(sp)
804107b0:	04012b03          	lw	s6,64(sp)
804107b4:	03c12b83          	lw	s7,60(sp)
804107b8:	03812c03          	lw	s8,56(sp)
804107bc:	03412c83          	lw	s9,52(sp)
804107c0:	03012d03          	lw	s10,48(sp)
804107c4:	02c12d83          	lw	s11,44(sp)
804107c8:	06010113          	addi	sp,sp,96
804107cc:	00008067          	ret
804107d0:	ffc00b13          	li	s6,-4
804107d4:	fb5ff06f          	j	80410788 <sfs_do_mount+0x1e8>
804107d8:	00078593          	mv	a1,a5
804107dc:	00006517          	auipc	a0,0x6
804107e0:	de050513          	addi	a0,a0,-544 # 804165bc <dev_node_ops+0x3e4>
804107e4:	a19ef0ef          	jal	ra,804001fc <cprintf>
804107e8:	ffd00b13          	li	s6,-3
804107ec:	f95ff06f          	j	80410780 <sfs_do_mount+0x1e0>
804107f0:	00006517          	auipc	a0,0x6
804107f4:	d9450513          	addi	a0,a0,-620 # 80416584 <dev_node_ops+0x3ac>
804107f8:	a05ef0ef          	jal	ra,804001fc <cprintf>
804107fc:	ffd00b13          	li	s6,-3
80410800:	f81ff06f          	j	80410780 <sfs_do_mount+0x1e0>
80410804:	00442903          	lw	s2,4(s0)
80410808:	00000493          	li	s1,0
8041080c:	0c0b8463          	beqz	s7,804108d4 <sfs_do_mount+0x334>
80410810:	00048593          	mv	a1,s1
80410814:	000c8513          	mv	a0,s9
80410818:	8b1ff0ef          	jal	ra,804100c8 <bitmap_test>
8041081c:	00a03533          	snez	a0,a0
80410820:	00148493          	addi	s1,s1,1
80410824:	00aa0a33          	add	s4,s4,a0
80410828:	fe9b94e3          	bne	s7,s1,80410810 <sfs_do_mount+0x270>
8041082c:	00842783          	lw	a5,8(s0)
80410830:	0f479a63          	bne	a5,s4,80410924 <sfs_do_mount+0x384>
80410834:	00100593          	li	a1,1
80410838:	03c40513          	addi	a0,s0,60
8041083c:	02042a23          	sw	zero,52(s0)
80410840:	d14f50ef          	jal	ra,80405d54 <sem_init>
80410844:	00100593          	li	a1,1
80410848:	04840513          	addi	a0,s0,72
8041084c:	d08f50ef          	jal	ra,80405d54 <sem_init>
80410850:	00100593          	li	a1,1
80410854:	05440513          	addi	a0,s0,84
80410858:	cfcf50ef          	jal	ra,80405d54 <sem_init>
8041085c:	06040793          	addi	a5,s0,96
80410860:	06f42223          	sw	a5,100(s0)
80410864:	06f42023          	sw	a5,96(s0)
80410868:	00090713          	mv	a4,s2
8041086c:	000a0693          	mv	a3,s4
80410870:	41490633          	sub	a2,s2,s4
80410874:	00c40593          	addi	a1,s0,12
80410878:	00006517          	auipc	a0,0x6
8041087c:	dcc50513          	addi	a0,a0,-564 # 80416644 <dev_node_ops+0x46c>
80410880:	97def0ef          	jal	ra,804001fc <cprintf>
80410884:	00000797          	auipc	a5,0x0
80410888:	96c78793          	addi	a5,a5,-1684 # 804101f0 <sfs_sync>
8041088c:	06f42823          	sw	a5,112(s0)
80410890:	00000797          	auipc	a5,0x0
80410894:	ca078793          	addi	a5,a5,-864 # 80410530 <sfs_get_root>
80410898:	06f42a23          	sw	a5,116(s0)
8041089c:	00000797          	auipc	a5,0x0
804108a0:	b1078793          	addi	a5,a5,-1264 # 804103ac <sfs_unmount>
804108a4:	06f42c23          	sw	a5,120(s0)
804108a8:	00000797          	auipc	a5,0x0
804108ac:	bb878793          	addi	a5,a5,-1096 # 80410460 <sfs_cleanup>
804108b0:	06f42e23          	sw	a5,124(s0)
804108b4:	008aa023          	sw	s0,0(s5)
804108b8:	ed9ff06f          	j	80410790 <sfs_do_mount+0x1f0>
804108bc:	ffc00b13          	li	s6,-4
804108c0:	eb9ff06f          	j	80410778 <sfs_do_mount+0x1d8>
804108c4:	ff200b13          	li	s6,-14
804108c8:	ec9ff06f          	j	80410790 <sfs_do_mount+0x1f0>
804108cc:	ffc00b13          	li	s6,-4
804108d0:	eb1ff06f          	j	80410780 <sfs_do_mount+0x1e0>
804108d4:	00000a13          	li	s4,0
804108d8:	f55ff06f          	j	8041082c <sfs_do_mount+0x28c>
804108dc:	ffc00b13          	li	s6,-4
804108e0:	eb1ff06f          	j	80410790 <sfs_do_mount+0x1f0>
804108e4:	00006697          	auipc	a3,0x6
804108e8:	d0868693          	addi	a3,a3,-760 # 804165ec <dev_node_ops+0x414>
804108ec:	00003617          	auipc	a2,0x3
804108f0:	ef460613          	addi	a2,a2,-268 # 804137e0 <commands+0x1bc>
804108f4:	08300593          	li	a1,131
804108f8:	00006517          	auipc	a0,0x6
804108fc:	db450513          	addi	a0,a0,-588 # 804166ac <dev_node_ops+0x4d4>
80410900:	d25ef0ef          	jal	ra,80400624 <__panic>
80410904:	00006697          	auipc	a3,0x6
80410908:	d7c68693          	addi	a3,a3,-644 # 80416680 <dev_node_ops+0x4a8>
8041090c:	00003617          	auipc	a2,0x3
80410910:	ed460613          	addi	a2,a2,-300 # 804137e0 <commands+0x1bc>
80410914:	0a300593          	li	a1,163
80410918:	00006517          	auipc	a0,0x6
8041091c:	d9450513          	addi	a0,a0,-620 # 804166ac <dev_node_ops+0x4d4>
80410920:	d05ef0ef          	jal	ra,80400624 <__panic>
80410924:	00006697          	auipc	a3,0x6
80410928:	cf468693          	addi	a3,a3,-780 # 80416618 <dev_node_ops+0x440>
8041092c:	00003617          	auipc	a2,0x3
80410930:	eb460613          	addi	a2,a2,-332 # 804137e0 <commands+0x1bc>
80410934:	0e000593          	li	a1,224
80410938:	00006517          	auipc	a0,0x6
8041093c:	d7450513          	addi	a0,a0,-652 # 804166ac <dev_node_ops+0x4d4>
80410940:	ce5ef0ef          	jal	ra,80400624 <__panic>

80410944 <sfs_mount>:
80410944:	00000597          	auipc	a1,0x0
80410948:	c5c58593          	addi	a1,a1,-932 # 804105a0 <sfs_do_mount>
8041094c:	f15fd06f          	j	8040e860 <vfs_mount>

80410950 <sfs_opendir>:
80410950:	0235f593          	andi	a1,a1,35
80410954:	00000513          	li	a0,0
80410958:	00059463          	bnez	a1,80410960 <sfs_opendir+0x10>
8041095c:	00008067          	ret
80410960:	fef00513          	li	a0,-17
80410964:	00008067          	ret

80410968 <sfs_openfile>:
80410968:	00000513          	li	a0,0
8041096c:	00008067          	ret

80410970 <sfs_fsync>:
80410970:	fe010113          	addi	sp,sp,-32
80410974:	01212823          	sw	s2,16(sp)
80410978:	03852903          	lw	s2,56(a0)
8041097c:	00112e23          	sw	ra,28(sp)
80410980:	00812c23          	sw	s0,24(sp)
80410984:	00912a23          	sw	s1,20(sp)
80410988:	01312623          	sw	s3,12(sp)
8041098c:	0a090a63          	beqz	s2,80410a40 <sfs_fsync+0xd0>
80410990:	06c92783          	lw	a5,108(s2)
80410994:	0a079663          	bnez	a5,80410a40 <sfs_fsync+0xd0>
80410998:	02c52703          	lw	a4,44(a0)
8041099c:	000017b7          	lui	a5,0x1
804109a0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804109a4:	00050413          	mv	s0,a0
804109a8:	0af71c63          	bne	a4,a5,80410a60 <sfs_fsync+0xf0>
804109ac:	00852483          	lw	s1,8(a0)
804109b0:	02049263          	bnez	s1,804109d4 <sfs_fsync+0x64>
804109b4:	01c12083          	lw	ra,28(sp)
804109b8:	01812403          	lw	s0,24(sp)
804109bc:	00048513          	mv	a0,s1
804109c0:	01012903          	lw	s2,16(sp)
804109c4:	01412483          	lw	s1,20(sp)
804109c8:	00c12983          	lw	s3,12(sp)
804109cc:	02010113          	addi	sp,sp,32
804109d0:	00008067          	ret
804109d4:	01050993          	addi	s3,a0,16
804109d8:	00098513          	mv	a0,s3
804109dc:	b88f50ef          	jal	ra,80405d64 <down>
804109e0:	00842483          	lw	s1,8(s0)
804109e4:	02049663          	bnez	s1,80410a10 <sfs_fsync+0xa0>
804109e8:	00098513          	mv	a0,s3
804109ec:	b74f50ef          	jal	ra,80405d60 <up>
804109f0:	01c12083          	lw	ra,28(sp)
804109f4:	01812403          	lw	s0,24(sp)
804109f8:	00048513          	mv	a0,s1
804109fc:	01012903          	lw	s2,16(sp)
80410a00:	01412483          	lw	s1,20(sp)
80410a04:	00c12983          	lw	s3,12(sp)
80410a08:	02010113          	addi	sp,sp,32
80410a0c:	00008067          	ret
80410a10:	00442683          	lw	a3,4(s0)
80410a14:	00042583          	lw	a1,0(s0)
80410a18:	00042423          	sw	zero,8(s0)
80410a1c:	00000713          	li	a4,0
80410a20:	04000613          	li	a2,64
80410a24:	00090513          	mv	a0,s2
80410a28:	691010ef          	jal	ra,804128b8 <sfs_wbuf>
80410a2c:	00050493          	mv	s1,a0
80410a30:	fa050ce3          	beqz	a0,804109e8 <sfs_fsync+0x78>
80410a34:	00100793          	li	a5,1
80410a38:	00f42423          	sw	a5,8(s0)
80410a3c:	fadff06f          	j	804109e8 <sfs_fsync+0x78>
80410a40:	00006697          	auipc	a3,0x6
80410a44:	c4068693          	addi	a3,a3,-960 # 80416680 <dev_node_ops+0x4a8>
80410a48:	00003617          	auipc	a2,0x3
80410a4c:	d9860613          	addi	a2,a2,-616 # 804137e0 <commands+0x1bc>
80410a50:	2c700593          	li	a1,711
80410a54:	00006517          	auipc	a0,0x6
80410a58:	dc850513          	addi	a0,a0,-568 # 8041681c <dev_node_ops+0x644>
80410a5c:	bc9ef0ef          	jal	ra,80400624 <__panic>
80410a60:	00006697          	auipc	a3,0x6
80410a64:	dd468693          	addi	a3,a3,-556 # 80416834 <dev_node_ops+0x65c>
80410a68:	00003617          	auipc	a2,0x3
80410a6c:	d7860613          	addi	a2,a2,-648 # 804137e0 <commands+0x1bc>
80410a70:	2c800593          	li	a1,712
80410a74:	00006517          	auipc	a0,0x6
80410a78:	da850513          	addi	a0,a0,-600 # 8041681c <dev_node_ops+0x644>
80410a7c:	ba9ef0ef          	jal	ra,80400624 <__panic>

80410a80 <sfs_gettype>:
80410a80:	ff010113          	addi	sp,sp,-16
80410a84:	00112623          	sw	ra,12(sp)
80410a88:	06050e63          	beqz	a0,80410b04 <sfs_gettype+0x84>
80410a8c:	02c52683          	lw	a3,44(a0)
80410a90:	000017b7          	lui	a5,0x1
80410a94:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410a98:	06e69663          	bne	a3,a4,80410b04 <sfs_gettype+0x84>
80410a9c:	00052683          	lw	a3,0(a0)
80410aa0:	00200713          	li	a4,2
80410aa4:	0046d683          	lhu	a3,4(a3)
80410aa8:	04e68263          	beq	a3,a4,80410aec <sfs_gettype+0x6c>
80410aac:	00300713          	li	a4,3
80410ab0:	02e68263          	beq	a3,a4,80410ad4 <sfs_gettype+0x54>
80410ab4:	00100713          	li	a4,1
80410ab8:	02e68063          	beq	a3,a4,80410ad8 <sfs_gettype+0x58>
80410abc:	00006617          	auipc	a2,0x6
80410ac0:	db060613          	addi	a2,a2,-592 # 8041686c <dev_node_ops+0x694>
80410ac4:	38f00593          	li	a1,911
80410ac8:	00006517          	auipc	a0,0x6
80410acc:	d5450513          	addi	a0,a0,-684 # 8041681c <dev_node_ops+0x644>
80410ad0:	b55ef0ef          	jal	ra,80400624 <__panic>
80410ad4:	000037b7          	lui	a5,0x3
80410ad8:	00c12083          	lw	ra,12(sp)
80410adc:	00f5a023          	sw	a5,0(a1)
80410ae0:	00000513          	li	a0,0
80410ae4:	01010113          	addi	sp,sp,16
80410ae8:	00008067          	ret
80410aec:	00c12083          	lw	ra,12(sp)
80410af0:	000027b7          	lui	a5,0x2
80410af4:	00f5a023          	sw	a5,0(a1)
80410af8:	00000513          	li	a0,0
80410afc:	01010113          	addi	sp,sp,16
80410b00:	00008067          	ret
80410b04:	00006697          	auipc	a3,0x6
80410b08:	d3068693          	addi	a3,a3,-720 # 80416834 <dev_node_ops+0x65c>
80410b0c:	00003617          	auipc	a2,0x3
80410b10:	cd460613          	addi	a2,a2,-812 # 804137e0 <commands+0x1bc>
80410b14:	38300593          	li	a1,899
80410b18:	00006517          	auipc	a0,0x6
80410b1c:	d0450513          	addi	a0,a0,-764 # 8041681c <dev_node_ops+0x644>
80410b20:	b05ef0ef          	jal	ra,80400624 <__panic>

80410b24 <sfs_block_inuse.isra.3>:
80410b24:	ff010113          	addi	sp,sp,-16
80410b28:	00112623          	sw	ra,12(sp)
80410b2c:	02060263          	beqz	a2,80410b50 <sfs_block_inuse.isra.3+0x2c>
80410b30:	02a67063          	bgeu	a2,a0,80410b50 <sfs_block_inuse.isra.3+0x2c>
80410b34:	0005a503          	lw	a0,0(a1)
80410b38:	00060593          	mv	a1,a2
80410b3c:	d8cff0ef          	jal	ra,804100c8 <bitmap_test>
80410b40:	00c12083          	lw	ra,12(sp)
80410b44:	00153513          	seqz	a0,a0
80410b48:	01010113          	addi	sp,sp,16
80410b4c:	00008067          	ret
80410b50:	00060713          	mv	a4,a2
80410b54:	00050693          	mv	a3,a0
80410b58:	00006617          	auipc	a2,0x6
80410b5c:	bc460613          	addi	a2,a2,-1084 # 8041671c <dev_node_ops+0x544>
80410b60:	05300593          	li	a1,83
80410b64:	00006517          	auipc	a0,0x6
80410b68:	cb850513          	addi	a0,a0,-840 # 8041681c <dev_node_ops+0x644>
80410b6c:	ab9ef0ef          	jal	ra,80400624 <__panic>

80410b70 <sfs_block_alloc>:
80410b70:	ff010113          	addi	sp,sp,-16
80410b74:	00812423          	sw	s0,8(sp)
80410b78:	00050413          	mv	s0,a0
80410b7c:	03052503          	lw	a0,48(a0)
80410b80:	00912223          	sw	s1,4(sp)
80410b84:	00112623          	sw	ra,12(sp)
80410b88:	00058493          	mv	s1,a1
80410b8c:	c90ff0ef          	jal	ra,8041001c <bitmap_alloc>
80410b90:	04051863          	bnez	a0,80410be0 <sfs_block_alloc+0x70>
80410b94:	00842783          	lw	a5,8(s0)
80410b98:	06078e63          	beqz	a5,80410c14 <sfs_block_alloc+0xa4>
80410b9c:	fff78793          	addi	a5,a5,-1 # 1fff <_binary_bin_swap_img_size-0x6001>
80410ba0:	00f42423          	sw	a5,8(s0)
80410ba4:	00100793          	li	a5,1
80410ba8:	02f42a23          	sw	a5,52(s0)
80410bac:	0004a603          	lw	a2,0(s1)
80410bb0:	00442503          	lw	a0,4(s0)
80410bb4:	03040593          	addi	a1,s0,48
80410bb8:	f6dff0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
80410bbc:	02050c63          	beqz	a0,80410bf4 <sfs_block_alloc+0x84>
80410bc0:	00040513          	mv	a0,s0
80410bc4:	00812403          	lw	s0,8(sp)
80410bc8:	0004a583          	lw	a1,0(s1)
80410bcc:	00c12083          	lw	ra,12(sp)
80410bd0:	00412483          	lw	s1,4(sp)
80410bd4:	00100613          	li	a2,1
80410bd8:	01010113          	addi	sp,sp,16
80410bdc:	6bd0106f          	j	80412a98 <sfs_clear_block>
80410be0:	00c12083          	lw	ra,12(sp)
80410be4:	00812403          	lw	s0,8(sp)
80410be8:	00412483          	lw	s1,4(sp)
80410bec:	01010113          	addi	sp,sp,16
80410bf0:	00008067          	ret
80410bf4:	00006697          	auipc	a3,0x6
80410bf8:	b0468693          	addi	a3,a3,-1276 # 804166f8 <dev_node_ops+0x520>
80410bfc:	00003617          	auipc	a2,0x3
80410c00:	be460613          	addi	a2,a2,-1052 # 804137e0 <commands+0x1bc>
80410c04:	06100593          	li	a1,97
80410c08:	00006517          	auipc	a0,0x6
80410c0c:	c1450513          	addi	a0,a0,-1004 # 8041681c <dev_node_ops+0x644>
80410c10:	a15ef0ef          	jal	ra,80400624 <__panic>
80410c14:	00006697          	auipc	a3,0x6
80410c18:	ac468693          	addi	a3,a3,-1340 # 804166d8 <dev_node_ops+0x500>
80410c1c:	00003617          	auipc	a2,0x3
80410c20:	bc460613          	addi	a2,a2,-1084 # 804137e0 <commands+0x1bc>
80410c24:	05f00593          	li	a1,95
80410c28:	00006517          	auipc	a0,0x6
80410c2c:	bf450513          	addi	a0,a0,-1036 # 8041681c <dev_node_ops+0x644>
80410c30:	9f5ef0ef          	jal	ra,80400624 <__panic>

80410c34 <sfs_block_free>:
80410c34:	ff010113          	addi	sp,sp,-16
80410c38:	00812423          	sw	s0,8(sp)
80410c3c:	00050413          	mv	s0,a0
80410c40:	00452503          	lw	a0,4(a0)
80410c44:	00912223          	sw	s1,4(sp)
80410c48:	00058613          	mv	a2,a1
80410c4c:	00058493          	mv	s1,a1
80410c50:	03040593          	addi	a1,s0,48
80410c54:	00112623          	sw	ra,12(sp)
80410c58:	ecdff0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
80410c5c:	02050c63          	beqz	a0,80410c94 <sfs_block_free+0x60>
80410c60:	03042503          	lw	a0,48(s0)
80410c64:	00048593          	mv	a1,s1
80410c68:	c98ff0ef          	jal	ra,80410100 <bitmap_free>
80410c6c:	00842783          	lw	a5,8(s0)
80410c70:	00100713          	li	a4,1
80410c74:	02e42a23          	sw	a4,52(s0)
80410c78:	00178793          	addi	a5,a5,1
80410c7c:	00f42423          	sw	a5,8(s0)
80410c80:	00c12083          	lw	ra,12(sp)
80410c84:	00812403          	lw	s0,8(sp)
80410c88:	00412483          	lw	s1,4(sp)
80410c8c:	01010113          	addi	sp,sp,16
80410c90:	00008067          	ret
80410c94:	00006697          	auipc	a3,0x6
80410c98:	b2068693          	addi	a3,a3,-1248 # 804167b4 <dev_node_ops+0x5dc>
80410c9c:	00003617          	auipc	a2,0x3
80410ca0:	b4460613          	addi	a2,a2,-1212 # 804137e0 <commands+0x1bc>
80410ca4:	06a00593          	li	a1,106
80410ca8:	00006517          	auipc	a0,0x6
80410cac:	b7450513          	addi	a0,a0,-1164 # 8041681c <dev_node_ops+0x644>
80410cb0:	975ef0ef          	jal	ra,80400624 <__panic>

80410cb4 <sfs_reclaim>:
80410cb4:	ff010113          	addi	sp,sp,-16
80410cb8:	00912223          	sw	s1,4(sp)
80410cbc:	03852483          	lw	s1,56(a0)
80410cc0:	00112623          	sw	ra,12(sp)
80410cc4:	00812423          	sw	s0,8(sp)
80410cc8:	01212023          	sw	s2,0(sp)
80410ccc:	16048c63          	beqz	s1,80410e44 <sfs_reclaim+0x190>
80410cd0:	06c4a783          	lw	a5,108(s1)
80410cd4:	16079863          	bnez	a5,80410e44 <sfs_reclaim+0x190>
80410cd8:	02c52703          	lw	a4,44(a0)
80410cdc:	000017b7          	lui	a5,0x1
80410ce0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410ce4:	00050413          	mv	s0,a0
80410ce8:	18f71e63          	bne	a4,a5,80410e84 <sfs_reclaim+0x1d0>
80410cec:	00048513          	mv	a0,s1
80410cf0:	661010ef          	jal	ra,80412b50 <lock_sfs_fs>
80410cf4:	00c42783          	lw	a5,12(s0)
80410cf8:	16f05663          	blez	a5,80410e64 <sfs_reclaim+0x1b0>
80410cfc:	fff78793          	addi	a5,a5,-1
80410d00:	00f42623          	sw	a5,12(s0)
80410d04:	0e079463          	bnez	a5,80410dec <sfs_reclaim+0x138>
80410d08:	03042903          	lw	s2,48(s0)
80410d0c:	0e091063          	bnez	s2,80410dec <sfs_reclaim+0x138>
80410d10:	00042783          	lw	a5,0(s0)
80410d14:	0067d783          	lhu	a5,6(a5)
80410d18:	02079e63          	bnez	a5,80410d54 <sfs_reclaim+0xa0>
80410d1c:	03c42783          	lw	a5,60(s0)
80410d20:	18078263          	beqz	a5,80410ea4 <sfs_reclaim+0x1f0>
80410d24:	0307a783          	lw	a5,48(a5)
80410d28:	16078e63          	beqz	a5,80410ea4 <sfs_reclaim+0x1f0>
80410d2c:	00005597          	auipc	a1,0x5
80410d30:	33858593          	addi	a1,a1,824 # 80416064 <syscalls+0x8c0>
80410d34:	00040513          	mv	a0,s0
80410d38:	ab0fd0ef          	jal	ra,8040dfe8 <inode_check>
80410d3c:	03c42783          	lw	a5,60(s0)
80410d40:	00000593          	li	a1,0
80410d44:	00040513          	mv	a0,s0
80410d48:	0307a783          	lw	a5,48(a5)
80410d4c:	000780e7          	jalr	a5
80410d50:	0e051663          	bnez	a0,80410e3c <sfs_reclaim+0x188>
80410d54:	00842783          	lw	a5,8(s0)
80410d58:	02078c63          	beqz	a5,80410d90 <sfs_reclaim+0xdc>
80410d5c:	03c42783          	lw	a5,60(s0)
80410d60:	16078263          	beqz	a5,80410ec4 <sfs_reclaim+0x210>
80410d64:	0187a783          	lw	a5,24(a5)
80410d68:	14078e63          	beqz	a5,80410ec4 <sfs_reclaim+0x210>
80410d6c:	00040513          	mv	a0,s0
80410d70:	00004597          	auipc	a1,0x4
80410d74:	16458593          	addi	a1,a1,356 # 80414ed4 <CSWTCH.69+0x17c>
80410d78:	a70fd0ef          	jal	ra,8040dfe8 <inode_check>
80410d7c:	03c42783          	lw	a5,60(s0)
80410d80:	00040513          	mv	a0,s0
80410d84:	0187a783          	lw	a5,24(a5)
80410d88:	000780e7          	jalr	a5
80410d8c:	0a051863          	bnez	a0,80410e3c <sfs_reclaim+0x188>
80410d90:	01c42703          	lw	a4,28(s0)
80410d94:	02042783          	lw	a5,32(s0)
80410d98:	00048513          	mv	a0,s1
80410d9c:	00f72223          	sw	a5,4(a4)
80410da0:	00e7a023          	sw	a4,0(a5)
80410da4:	02442703          	lw	a4,36(s0)
80410da8:	02842783          	lw	a5,40(s0)
80410dac:	00f72223          	sw	a5,4(a4)
80410db0:	00e7a023          	sw	a4,0(a5)
80410db4:	5ad010ef          	jal	ra,80412b60 <unlock_sfs_fs>
80410db8:	00042503          	lw	a0,0(s0)
80410dbc:	00655783          	lhu	a5,6(a0)
80410dc0:	04078a63          	beqz	a5,80410e14 <sfs_reclaim+0x160>
80410dc4:	b61f10ef          	jal	ra,80402924 <kfree>
80410dc8:	00040513          	mv	a0,s0
80410dcc:	990fd0ef          	jal	ra,8040df5c <inode_kill>
80410dd0:	00c12083          	lw	ra,12(sp)
80410dd4:	00812403          	lw	s0,8(sp)
80410dd8:	00090513          	mv	a0,s2
80410ddc:	00412483          	lw	s1,4(sp)
80410de0:	00012903          	lw	s2,0(sp)
80410de4:	01010113          	addi	sp,sp,16
80410de8:	00008067          	ret
80410dec:	ff100913          	li	s2,-15
80410df0:	00048513          	mv	a0,s1
80410df4:	56d010ef          	jal	ra,80412b60 <unlock_sfs_fs>
80410df8:	00c12083          	lw	ra,12(sp)
80410dfc:	00812403          	lw	s0,8(sp)
80410e00:	00090513          	mv	a0,s2
80410e04:	00412483          	lw	s1,4(sp)
80410e08:	00012903          	lw	s2,0(sp)
80410e0c:	01010113          	addi	sp,sp,16
80410e10:	00008067          	ret
80410e14:	00442583          	lw	a1,4(s0)
80410e18:	00048513          	mv	a0,s1
80410e1c:	e19ff0ef          	jal	ra,80410c34 <sfs_block_free>
80410e20:	00042503          	lw	a0,0(s0)
80410e24:	03c52583          	lw	a1,60(a0)
80410e28:	f8058ee3          	beqz	a1,80410dc4 <sfs_reclaim+0x110>
80410e2c:	00048513          	mv	a0,s1
80410e30:	e05ff0ef          	jal	ra,80410c34 <sfs_block_free>
80410e34:	00042503          	lw	a0,0(s0)
80410e38:	f8dff06f          	j	80410dc4 <sfs_reclaim+0x110>
80410e3c:	00050913          	mv	s2,a0
80410e40:	fb1ff06f          	j	80410df0 <sfs_reclaim+0x13c>
80410e44:	00006697          	auipc	a3,0x6
80410e48:	83c68693          	addi	a3,a3,-1988 # 80416680 <dev_node_ops+0x4a8>
80410e4c:	00003617          	auipc	a2,0x3
80410e50:	99460613          	addi	a2,a2,-1644 # 804137e0 <commands+0x1bc>
80410e54:	35800593          	li	a1,856
80410e58:	00006517          	auipc	a0,0x6
80410e5c:	9c450513          	addi	a0,a0,-1596 # 8041681c <dev_node_ops+0x644>
80410e60:	fc4ef0ef          	jal	ra,80400624 <__panic>
80410e64:	00006697          	auipc	a3,0x6
80410e68:	b4c68693          	addi	a3,a3,-1204 # 804169b0 <sfs_node_fileops+0x40>
80410e6c:	00003617          	auipc	a2,0x3
80410e70:	97460613          	addi	a2,a2,-1676 # 804137e0 <commands+0x1bc>
80410e74:	35e00593          	li	a1,862
80410e78:	00006517          	auipc	a0,0x6
80410e7c:	9a450513          	addi	a0,a0,-1628 # 8041681c <dev_node_ops+0x644>
80410e80:	fa4ef0ef          	jal	ra,80400624 <__panic>
80410e84:	00006697          	auipc	a3,0x6
80410e88:	9b068693          	addi	a3,a3,-1616 # 80416834 <dev_node_ops+0x65c>
80410e8c:	00003617          	auipc	a2,0x3
80410e90:	95460613          	addi	a2,a2,-1708 # 804137e0 <commands+0x1bc>
80410e94:	35900593          	li	a1,857
80410e98:	00006517          	auipc	a0,0x6
80410e9c:	98450513          	addi	a0,a0,-1660 # 8041681c <dev_node_ops+0x644>
80410ea0:	f84ef0ef          	jal	ra,80400624 <__panic>
80410ea4:	00005697          	auipc	a3,0x5
80410ea8:	16c68693          	addi	a3,a3,364 # 80416010 <syscalls+0x86c>
80410eac:	00003617          	auipc	a2,0x3
80410eb0:	93460613          	addi	a2,a2,-1740 # 804137e0 <commands+0x1bc>
80410eb4:	36300593          	li	a1,867
80410eb8:	00006517          	auipc	a0,0x6
80410ebc:	96450513          	addi	a0,a0,-1692 # 8041681c <dev_node_ops+0x644>
80410ec0:	f64ef0ef          	jal	ra,80400624 <__panic>
80410ec4:	00004697          	auipc	a3,0x4
80410ec8:	fc068693          	addi	a3,a3,-64 # 80414e84 <CSWTCH.69+0x12c>
80410ecc:	00003617          	auipc	a2,0x3
80410ed0:	91460613          	addi	a2,a2,-1772 # 804137e0 <commands+0x1bc>
80410ed4:	36800593          	li	a1,872
80410ed8:	00006517          	auipc	a0,0x6
80410edc:	94450513          	addi	a0,a0,-1724 # 8041681c <dev_node_ops+0x644>
80410ee0:	f44ef0ef          	jal	ra,80400624 <__panic>

80410ee4 <sfs_bmap_load_nolock>:
80410ee4:	fc010113          	addi	sp,sp,-64
80410ee8:	03212823          	sw	s2,48(sp)
80410eec:	0005a903          	lw	s2,0(a1)
80410ef0:	03312623          	sw	s3,44(sp)
80410ef4:	02112e23          	sw	ra,60(sp)
80410ef8:	00892983          	lw	s3,8(s2)
80410efc:	02812c23          	sw	s0,56(sp)
80410f00:	02912a23          	sw	s1,52(sp)
80410f04:	03412423          	sw	s4,40(sp)
80410f08:	03512223          	sw	s5,36(sp)
80410f0c:	03612023          	sw	s6,32(sp)
80410f10:	01712e23          	sw	s7,28(sp)
80410f14:	01812c23          	sw	s8,24(sp)
80410f18:	01912a23          	sw	s9,20(sp)
80410f1c:	01a12823          	sw	s10,16(sp)
80410f20:	22c9e863          	bltu	s3,a2,80411150 <sfs_bmap_load_nolock+0x26c>
80410f24:	00b00793          	li	a5,11
80410f28:	00058b13          	mv	s6,a1
80410f2c:	00060413          	mv	s0,a2
80410f30:	00050a13          	mv	s4,a0
80410f34:	00068c13          	mv	s8,a3
80410f38:	08c7fe63          	bgeu	a5,a2,80410fd4 <sfs_bmap_load_nolock+0xf0>
80410f3c:	ff460713          	addi	a4,a2,-12
80410f40:	3ff00793          	li	a5,1023
80410f44:	22e7e663          	bltu	a5,a4,80411170 <sfs_bmap_load_nolock+0x28c>
80410f48:	03c92c83          	lw	s9,60(s2)
80410f4c:	00012623          	sw	zero,12(sp)
80410f50:	00271b93          	slli	s7,a4,0x2
80410f54:	01912423          	sw	s9,8(sp)
80410f58:	180c9a63          	bnez	s9,804110ec <sfs_bmap_load_nolock+0x208>
80410f5c:	0cc98263          	beq	s3,a2,80411020 <sfs_bmap_load_nolock+0x13c>
80410f60:	03050a93          	addi	s5,a0,48
80410f64:	00000493          	li	s1,0
80410f68:	004a2503          	lw	a0,4(s4)
80410f6c:	00048613          	mv	a2,s1
80410f70:	000a8593          	mv	a1,s5
80410f74:	bb1ff0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
80410f78:	08050463          	beqz	a0,80411000 <sfs_bmap_load_nolock+0x11c>
80410f7c:	00899863          	bne	s3,s0,80410f8c <sfs_bmap_load_nolock+0xa8>
80410f80:	00892783          	lw	a5,8(s2)
80410f84:	00178793          	addi	a5,a5,1
80410f88:	00f92423          	sw	a5,8(s2)
80410f8c:	00000a93          	li	s5,0
80410f90:	000c0463          	beqz	s8,80410f98 <sfs_bmap_load_nolock+0xb4>
80410f94:	009c2023          	sw	s1,0(s8)
80410f98:	03c12083          	lw	ra,60(sp)
80410f9c:	03812403          	lw	s0,56(sp)
80410fa0:	000a8513          	mv	a0,s5
80410fa4:	03412483          	lw	s1,52(sp)
80410fa8:	03012903          	lw	s2,48(sp)
80410fac:	02c12983          	lw	s3,44(sp)
80410fb0:	02812a03          	lw	s4,40(sp)
80410fb4:	02412a83          	lw	s5,36(sp)
80410fb8:	02012b03          	lw	s6,32(sp)
80410fbc:	01c12b83          	lw	s7,28(sp)
80410fc0:	01812c03          	lw	s8,24(sp)
80410fc4:	01412c83          	lw	s9,20(sp)
80410fc8:	01012d03          	lw	s10,16(sp)
80410fcc:	04010113          	addi	sp,sp,64
80410fd0:	00008067          	ret
80410fd4:	00261b93          	slli	s7,a2,0x2
80410fd8:	01790bb3          	add	s7,s2,s7
80410fdc:	00cba483          	lw	s1,12(s7)
80410fe0:	00912223          	sw	s1,4(sp)
80410fe4:	10049063          	bnez	s1,804110e4 <sfs_bmap_load_nolock+0x200>
80410fe8:	0cc98463          	beq	s3,a2,804110b0 <sfs_bmap_load_nolock+0x1cc>
80410fec:	00452503          	lw	a0,4(a0)
80410ff0:	00000613          	li	a2,0
80410ff4:	030a0593          	addi	a1,s4,48
80410ff8:	b2dff0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
80410ffc:	f80518e3          	bnez	a0,80410f8c <sfs_bmap_load_nolock+0xa8>
80411000:	00005697          	auipc	a3,0x5
80411004:	7b468693          	addi	a3,a3,1972 # 804167b4 <dev_node_ops+0x5dc>
80411008:	00002617          	auipc	a2,0x2
8041100c:	7d860613          	addi	a2,a2,2008 # 804137e0 <commands+0x1bc>
80411010:	16b00593          	li	a1,363
80411014:	00006517          	auipc	a0,0x6
80411018:	80850513          	addi	a0,a0,-2040 # 8041681c <dev_node_ops+0x644>
8041101c:	e08ef0ef          	jal	ra,80400624 <__panic>
80411020:	00810593          	addi	a1,sp,8
80411024:	b4dff0ef          	jal	ra,80410b70 <sfs_block_alloc>
80411028:	00050a93          	mv	s5,a0
8041102c:	00c10d13          	addi	s10,sp,12
80411030:	f60514e3          	bnez	a0,80410f98 <sfs_bmap_load_nolock+0xb4>
80411034:	000d0593          	mv	a1,s10
80411038:	000a0513          	mv	a0,s4
8041103c:	b35ff0ef          	jal	ra,80410b70 <sfs_block_alloc>
80411040:	00050a93          	mv	s5,a0
80411044:	0e051c63          	bnez	a0,8041113c <sfs_bmap_load_nolock+0x258>
80411048:	00812683          	lw	a3,8(sp)
8041104c:	000b8713          	mv	a4,s7
80411050:	00400613          	li	a2,4
80411054:	000d0593          	mv	a1,s10
80411058:	000a0513          	mv	a0,s4
8041105c:	05d010ef          	jal	ra,804128b8 <sfs_wbuf>
80411060:	00050a93          	mv	s5,a0
80411064:	0c051663          	bnez	a0,80411130 <sfs_bmap_load_nolock+0x24c>
80411068:	00c12483          	lw	s1,12(sp)
8041106c:	03c92703          	lw	a4,60(s2)
80411070:	00812783          	lw	a5,8(sp)
80411074:	00912223          	sw	s1,4(sp)
80411078:	00f70a63          	beq	a4,a5,8041108c <sfs_bmap_load_nolock+0x1a8>
8041107c:	12071663          	bnez	a4,804111a8 <sfs_bmap_load_nolock+0x2c4>
80411080:	02f92e23          	sw	a5,60(s2)
80411084:	00100793          	li	a5,1
80411088:	00fb2423          	sw	a5,8(s6)
8041108c:	030a0a93          	addi	s5,s4,48
80411090:	ec048ce3          	beqz	s1,80410f68 <sfs_bmap_load_nolock+0x84>
80411094:	004a2503          	lw	a0,4(s4)
80411098:	00048613          	mv	a2,s1
8041109c:	000a8593          	mv	a1,s5
804110a0:	a85ff0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
804110a4:	0e050263          	beqz	a0,80411188 <sfs_bmap_load_nolock+0x2a4>
804110a8:	00412483          	lw	s1,4(sp)
804110ac:	ebdff06f          	j	80410f68 <sfs_bmap_load_nolock+0x84>
804110b0:	00410593          	addi	a1,sp,4
804110b4:	abdff0ef          	jal	ra,80410b70 <sfs_block_alloc>
804110b8:	00050a93          	mv	s5,a0
804110bc:	ec051ee3          	bnez	a0,80410f98 <sfs_bmap_load_nolock+0xb4>
804110c0:	00412483          	lw	s1,4(sp)
804110c4:	00100793          	li	a5,1
804110c8:	009ba623          	sw	s1,12(s7)
804110cc:	00fb2423          	sw	a5,8(s6)
804110d0:	fbdff06f          	j	8041108c <sfs_bmap_load_nolock+0x1a8>
804110d4:	03c92703          	lw	a4,60(s2)
804110d8:	00812783          	lw	a5,8(sp)
804110dc:	00912223          	sw	s1,4(sp)
804110e0:	f8e79ee3          	bne	a5,a4,8041107c <sfs_bmap_load_nolock+0x198>
804110e4:	030a0a93          	addi	s5,s4,48
804110e8:	fadff06f          	j	80411094 <sfs_bmap_load_nolock+0x1b0>
804110ec:	00c10d13          	addi	s10,sp,12
804110f0:	000b8713          	mv	a4,s7
804110f4:	000c8693          	mv	a3,s9
804110f8:	00400613          	li	a2,4
804110fc:	000d0593          	mv	a1,s10
80411100:	6ec010ef          	jal	ra,804127ec <sfs_rbuf>
80411104:	00050a93          	mv	s5,a0
80411108:	e80518e3          	bnez	a0,80410f98 <sfs_bmap_load_nolock+0xb4>
8041110c:	00c12483          	lw	s1,12(sp)
80411110:	fc0492e3          	bnez	s1,804110d4 <sfs_bmap_load_nolock+0x1f0>
80411114:	f28980e3          	beq	s3,s0,80411034 <sfs_bmap_load_nolock+0x150>
80411118:	03c92703          	lw	a4,60(s2)
8041111c:	00812783          	lw	a5,8(sp)
80411120:	00012223          	sw	zero,4(sp)
80411124:	f4e79ce3          	bne	a5,a4,8041107c <sfs_bmap_load_nolock+0x198>
80411128:	030a0a93          	addi	s5,s4,48
8041112c:	e3dff06f          	j	80410f68 <sfs_bmap_load_nolock+0x84>
80411130:	00c12583          	lw	a1,12(sp)
80411134:	000a0513          	mv	a0,s4
80411138:	afdff0ef          	jal	ra,80410c34 <sfs_block_free>
8041113c:	00812583          	lw	a1,8(sp)
80411140:	e4bc8ce3          	beq	s9,a1,80410f98 <sfs_bmap_load_nolock+0xb4>
80411144:	000a0513          	mv	a0,s4
80411148:	aedff0ef          	jal	ra,80410c34 <sfs_block_free>
8041114c:	e4dff06f          	j	80410f98 <sfs_bmap_load_nolock+0xb4>
80411150:	00005697          	auipc	a3,0x5
80411154:	60068693          	addi	a3,a3,1536 # 80416750 <dev_node_ops+0x578>
80411158:	00002617          	auipc	a2,0x2
8041115c:	68860613          	addi	a2,a2,1672 # 804137e0 <commands+0x1bc>
80411160:	16400593          	li	a1,356
80411164:	00005517          	auipc	a0,0x5
80411168:	6b850513          	addi	a0,a0,1720 # 8041681c <dev_node_ops+0x644>
8041116c:	cb8ef0ef          	jal	ra,80400624 <__panic>
80411170:	00005617          	auipc	a2,0x5
80411174:	60c60613          	addi	a2,a2,1548 # 8041677c <dev_node_ops+0x5a4>
80411178:	11e00593          	li	a1,286
8041117c:	00005517          	auipc	a0,0x5
80411180:	6a050513          	addi	a0,a0,1696 # 8041681c <dev_node_ops+0x644>
80411184:	ca0ef0ef          	jal	ra,80400624 <__panic>
80411188:	00005697          	auipc	a3,0x5
8041118c:	62068693          	addi	a3,a3,1568 # 804167a8 <dev_node_ops+0x5d0>
80411190:	00002617          	auipc	a2,0x2
80411194:	65060613          	addi	a2,a2,1616 # 804137e0 <commands+0x1bc>
80411198:	12100593          	li	a1,289
8041119c:	00005517          	auipc	a0,0x5
804111a0:	68050513          	addi	a0,a0,1664 # 8041681c <dev_node_ops+0x644>
804111a4:	c80ef0ef          	jal	ra,80400624 <__panic>
804111a8:	00005697          	auipc	a3,0x5
804111ac:	5c068693          	addi	a3,a3,1472 # 80416768 <dev_node_ops+0x590>
804111b0:	00002617          	auipc	a2,0x2
804111b4:	63060613          	addi	a2,a2,1584 # 804137e0 <commands+0x1bc>
804111b8:	11800593          	li	a1,280
804111bc:	00005517          	auipc	a0,0x5
804111c0:	66050513          	addi	a0,a0,1632 # 8041681c <dev_node_ops+0x644>
804111c4:	c60ef0ef          	jal	ra,80400624 <__panic>

804111c8 <sfs_io_nolock>:
804111c8:	fa010113          	addi	sp,sp,-96
804111cc:	03812c23          	sw	s8,56(sp)
804111d0:	00058c13          	mv	s8,a1
804111d4:	0005a583          	lw	a1,0(a1)
804111d8:	03912a23          	sw	s9,52(sp)
804111dc:	00050c93          	mv	s9,a0
804111e0:	0045d503          	lhu	a0,4(a1)
804111e4:	04112e23          	sw	ra,92(sp)
804111e8:	04812c23          	sw	s0,88(sp)
804111ec:	04912a23          	sw	s1,84(sp)
804111f0:	05212823          	sw	s2,80(sp)
804111f4:	05312623          	sw	s3,76(sp)
804111f8:	05412423          	sw	s4,72(sp)
804111fc:	05512223          	sw	s5,68(sp)
80411200:	05612023          	sw	s6,64(sp)
80411204:	03712e23          	sw	s7,60(sp)
80411208:	03a12823          	sw	s10,48(sp)
8041120c:	03b12623          	sw	s11,44(sp)
80411210:	00200813          	li	a6,2
80411214:	27050863          	beq	a0,a6,80411484 <sfs_io_nolock+0x2bc>
80411218:	00072403          	lw	s0,0(a4)
8041121c:	00070b93          	mv	s7,a4
80411220:	000ba023          	sw	zero,0(s7)
80411224:	08000737          	lui	a4,0x8000
80411228:	00068493          	mv	s1,a3
8041122c:	00068d93          	mv	s11,a3
80411230:	00868433          	add	s0,a3,s0
80411234:	24e6f463          	bgeu	a3,a4,8041147c <sfs_io_nolock+0x2b4>
80411238:	24d44263          	blt	s0,a3,8041147c <sfs_io_nolock+0x2b4>
8041123c:	00000513          	li	a0,0
80411240:	0e868e63          	beq	a3,s0,8041133c <sfs_io_nolock+0x174>
80411244:	00060993          	mv	s3,a2
80411248:	00877463          	bgeu	a4,s0,80411250 <sfs_io_nolock+0x88>
8041124c:	08000437          	lui	s0,0x8000
80411250:	12078463          	beqz	a5,80411378 <sfs_io_nolock+0x1b0>
80411254:	00001797          	auipc	a5,0x1
80411258:	59078793          	addi	a5,a5,1424 # 804127e4 <sfs_wblock>
8041125c:	00f12623          	sw	a5,12(sp)
80411260:	00001797          	auipc	a5,0x1
80411264:	65878793          	addi	a5,a5,1624 # 804128b8 <sfs_wbuf>
80411268:	00f12423          	sw	a5,8(sp)
8041126c:	41f4d913          	srai	s2,s1,0x1f
80411270:	00001637          	lui	a2,0x1
80411274:	fff60713          	addi	a4,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
80411278:	01495693          	srli	a3,s2,0x14
8041127c:	41f45a13          	srai	s4,s0,0x1f
80411280:	00e97933          	and	s2,s2,a4
80411284:	00ea7ab3          	and	s5,s4,a4
80411288:	00d48d33          	add	s10,s1,a3
8041128c:	00990933          	add	s2,s2,s1
80411290:	008a8ab3          	add	s5,s5,s0
80411294:	00ed7d33          	and	s10,s10,a4
80411298:	40c95913          	srai	s2,s2,0xc
8041129c:	40cada93          	srai	s5,s5,0xc
804112a0:	40dd0d33          	sub	s10,s10,a3
804112a4:	412a8ab3          	sub	s5,s5,s2
804112a8:	100d0063          	beqz	s10,804113a8 <sfs_io_nolock+0x1e0>
804112ac:	40940b33          	sub	s6,s0,s1
804112b0:	140a9463          	bnez	s5,804113f8 <sfs_io_nolock+0x230>
804112b4:	01c10693          	addi	a3,sp,28
804112b8:	00090613          	mv	a2,s2
804112bc:	000c0593          	mv	a1,s8
804112c0:	000c8513          	mv	a0,s9
804112c4:	c21ff0ef          	jal	ra,80410ee4 <sfs_bmap_load_nolock>
804112c8:	14051663          	bnez	a0,80411414 <sfs_io_nolock+0x24c>
804112cc:	01c12683          	lw	a3,28(sp)
804112d0:	00812783          	lw	a5,8(sp)
804112d4:	000d0713          	mv	a4,s10
804112d8:	000b0613          	mv	a2,s6
804112dc:	00098593          	mv	a1,s3
804112e0:	000c8513          	mv	a0,s9
804112e4:	000780e7          	jalr	a5
804112e8:	12051663          	bnez	a0,80411414 <sfs_io_nolock+0x24c>
804112ec:	180a8463          	beqz	s5,80411474 <sfs_io_nolock+0x2ac>
804112f0:	fffa8a93          	addi	s5,s5,-1
804112f4:	016989b3          	add	s3,s3,s6
804112f8:	00190913          	addi	s2,s2,1
804112fc:	0a0a9a63          	bnez	s5,804113b0 <sfs_io_nolock+0x1e8>
80411300:	014a5793          	srli	a5,s4,0x14
80411304:	00f40433          	add	s0,s0,a5
80411308:	01441413          	slli	s0,s0,0x14
8041130c:	01445413          	srli	s0,s0,0x14
80411310:	40f40433          	sub	s0,s0,a5
80411314:	12041263          	bnez	s0,80411438 <sfs_io_nolock+0x270>
80411318:	01648db3          	add	s11,s1,s6
8041131c:	00000513          	li	a0,0
80411320:	000c2783          	lw	a5,0(s8)
80411324:	016ba023          	sw	s6,0(s7)
80411328:	0007a703          	lw	a4,0(a5)
8041132c:	01b77863          	bgeu	a4,s11,8041133c <sfs_io_nolock+0x174>
80411330:	01b7a023          	sw	s11,0(a5)
80411334:	00100793          	li	a5,1
80411338:	00fc2423          	sw	a5,8(s8)
8041133c:	05c12083          	lw	ra,92(sp)
80411340:	05812403          	lw	s0,88(sp)
80411344:	05412483          	lw	s1,84(sp)
80411348:	05012903          	lw	s2,80(sp)
8041134c:	04c12983          	lw	s3,76(sp)
80411350:	04812a03          	lw	s4,72(sp)
80411354:	04412a83          	lw	s5,68(sp)
80411358:	04012b03          	lw	s6,64(sp)
8041135c:	03c12b83          	lw	s7,60(sp)
80411360:	03812c03          	lw	s8,56(sp)
80411364:	03412c83          	lw	s9,52(sp)
80411368:	03012d03          	lw	s10,48(sp)
8041136c:	02c12d83          	lw	s11,44(sp)
80411370:	06010113          	addi	sp,sp,96
80411374:	00008067          	ret
80411378:	0005a783          	lw	a5,0(a1)
8041137c:	00000513          	li	a0,0
80411380:	faf4fee3          	bgeu	s1,a5,8041133c <sfs_io_nolock+0x174>
80411384:	0887fc63          	bgeu	a5,s0,8041141c <sfs_io_nolock+0x254>
80411388:	00078413          	mv	s0,a5
8041138c:	00001797          	auipc	a5,0x1
80411390:	45078793          	addi	a5,a5,1104 # 804127dc <sfs_rblock>
80411394:	00f12623          	sw	a5,12(sp)
80411398:	00001797          	auipc	a5,0x1
8041139c:	45478793          	addi	a5,a5,1108 # 804127ec <sfs_rbuf>
804113a0:	00f12423          	sw	a5,8(sp)
804113a4:	ec9ff06f          	j	8041126c <sfs_io_nolock+0xa4>
804113a8:	00000b13          	li	s6,0
804113ac:	f40a8ae3          	beqz	s5,80411300 <sfs_io_nolock+0x138>
804113b0:	01c10693          	addi	a3,sp,28
804113b4:	00090613          	mv	a2,s2
804113b8:	000c0593          	mv	a1,s8
804113bc:	000c8513          	mv	a0,s9
804113c0:	b25ff0ef          	jal	ra,80410ee4 <sfs_bmap_load_nolock>
804113c4:	0a051863          	bnez	a0,80411474 <sfs_io_nolock+0x2ac>
804113c8:	01c12603          	lw	a2,28(sp)
804113cc:	00c12783          	lw	a5,12(sp)
804113d0:	000a8693          	mv	a3,s5
804113d4:	00098593          	mv	a1,s3
804113d8:	000c8513          	mv	a0,s9
804113dc:	000780e7          	jalr	a5
804113e0:	08051a63          	bnez	a0,80411474 <sfs_io_nolock+0x2ac>
804113e4:	00ca9713          	slli	a4,s5,0xc
804113e8:	00eb0b33          	add	s6,s6,a4
804113ec:	00e989b3          	add	s3,s3,a4
804113f0:	01590933          	add	s2,s2,s5
804113f4:	f0dff06f          	j	80411300 <sfs_io_nolock+0x138>
804113f8:	41a60b33          	sub	s6,a2,s10
804113fc:	01c10693          	addi	a3,sp,28
80411400:	00090613          	mv	a2,s2
80411404:	000c0593          	mv	a1,s8
80411408:	000c8513          	mv	a0,s9
8041140c:	ad9ff0ef          	jal	ra,80410ee4 <sfs_bmap_load_nolock>
80411410:	ea050ee3          	beqz	a0,804112cc <sfs_io_nolock+0x104>
80411414:	00000b13          	li	s6,0
80411418:	f09ff06f          	j	80411320 <sfs_io_nolock+0x158>
8041141c:	00001797          	auipc	a5,0x1
80411420:	3c078793          	addi	a5,a5,960 # 804127dc <sfs_rblock>
80411424:	00f12623          	sw	a5,12(sp)
80411428:	00001797          	auipc	a5,0x1
8041142c:	3c478793          	addi	a5,a5,964 # 804127ec <sfs_rbuf>
80411430:	00f12423          	sw	a5,8(sp)
80411434:	e39ff06f          	j	8041126c <sfs_io_nolock+0xa4>
80411438:	01c10693          	addi	a3,sp,28
8041143c:	00090613          	mv	a2,s2
80411440:	000c0593          	mv	a1,s8
80411444:	000c8513          	mv	a0,s9
80411448:	a9dff0ef          	jal	ra,80410ee4 <sfs_bmap_load_nolock>
8041144c:	02051463          	bnez	a0,80411474 <sfs_io_nolock+0x2ac>
80411450:	01c12683          	lw	a3,28(sp)
80411454:	00812783          	lw	a5,8(sp)
80411458:	00000713          	li	a4,0
8041145c:	00040613          	mv	a2,s0
80411460:	00098593          	mv	a1,s3
80411464:	000c8513          	mv	a0,s9
80411468:	000780e7          	jalr	a5
8041146c:	00051463          	bnez	a0,80411474 <sfs_io_nolock+0x2ac>
80411470:	008b0b33          	add	s6,s6,s0
80411474:	01648db3          	add	s11,s1,s6
80411478:	ea9ff06f          	j	80411320 <sfs_io_nolock+0x158>
8041147c:	ffd00513          	li	a0,-3
80411480:	ebdff06f          	j	8041133c <sfs_io_nolock+0x174>
80411484:	00005697          	auipc	a3,0x5
80411488:	40068693          	addi	a3,a3,1024 # 80416884 <dev_node_ops+0x6ac>
8041148c:	00002617          	auipc	a2,0x2
80411490:	35460613          	addi	a2,a2,852 # 804137e0 <commands+0x1bc>
80411494:	22b00593          	li	a1,555
80411498:	00005517          	auipc	a0,0x5
8041149c:	38450513          	addi	a0,a0,900 # 8041681c <dev_node_ops+0x644>
804114a0:	984ef0ef          	jal	ra,80400624 <__panic>

804114a4 <sfs_dirent_read_nolock>:
804114a4:	0005a783          	lw	a5,0(a1)
804114a8:	fe010113          	addi	sp,sp,-32
804114ac:	00112e23          	sw	ra,28(sp)
804114b0:	0047d803          	lhu	a6,4(a5)
804114b4:	00812c23          	sw	s0,24(sp)
804114b8:	00912a23          	sw	s1,20(sp)
804114bc:	00200713          	li	a4,2
804114c0:	06e81e63          	bne	a6,a4,8041153c <sfs_dirent_read_nolock+0x98>
804114c4:	0087a783          	lw	a5,8(a5)
804114c8:	06f67a63          	bgeu	a2,a5,8041153c <sfs_dirent_read_nolock+0x98>
804114cc:	00068493          	mv	s1,a3
804114d0:	00c10693          	addi	a3,sp,12
804114d4:	00050413          	mv	s0,a0
804114d8:	a0dff0ef          	jal	ra,80410ee4 <sfs_bmap_load_nolock>
804114dc:	00050c63          	beqz	a0,804114f4 <sfs_dirent_read_nolock+0x50>
804114e0:	01c12083          	lw	ra,28(sp)
804114e4:	01812403          	lw	s0,24(sp)
804114e8:	01412483          	lw	s1,20(sp)
804114ec:	02010113          	addi	sp,sp,32
804114f0:	00008067          	ret
804114f4:	00c12603          	lw	a2,12(sp)
804114f8:	00442503          	lw	a0,4(s0) # 8000004 <_binary_bin_sfs_img_size+0x7f88004>
804114fc:	03040593          	addi	a1,s0,48
80411500:	e24ff0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
80411504:	04050c63          	beqz	a0,8041155c <sfs_dirent_read_nolock+0xb8>
80411508:	00c12683          	lw	a3,12(sp)
8041150c:	00000713          	li	a4,0
80411510:	10400613          	li	a2,260
80411514:	00048593          	mv	a1,s1
80411518:	00040513          	mv	a0,s0
8041151c:	2d0010ef          	jal	ra,804127ec <sfs_rbuf>
80411520:	fc0510e3          	bnez	a0,804114e0 <sfs_dirent_read_nolock+0x3c>
80411524:	100481a3          	sb	zero,259(s1)
80411528:	01c12083          	lw	ra,28(sp)
8041152c:	01812403          	lw	s0,24(sp)
80411530:	01412483          	lw	s1,20(sp)
80411534:	02010113          	addi	sp,sp,32
80411538:	00008067          	ret
8041153c:	00005697          	auipc	a3,0x5
80411540:	29468693          	addi	a3,a3,660 # 804167d0 <dev_node_ops+0x5f8>
80411544:	00002617          	auipc	a2,0x2
80411548:	29c60613          	addi	a2,a2,668 # 804137e0 <commands+0x1bc>
8041154c:	18e00593          	li	a1,398
80411550:	00005517          	auipc	a0,0x5
80411554:	2cc50513          	addi	a0,a0,716 # 8041681c <dev_node_ops+0x644>
80411558:	8ccef0ef          	jal	ra,80400624 <__panic>
8041155c:	00005697          	auipc	a3,0x5
80411560:	25868693          	addi	a3,a3,600 # 804167b4 <dev_node_ops+0x5dc>
80411564:	00002617          	auipc	a2,0x2
80411568:	27c60613          	addi	a2,a2,636 # 804137e0 <commands+0x1bc>
8041156c:	19500593          	li	a1,405
80411570:	00005517          	auipc	a0,0x5
80411574:	2ac50513          	addi	a0,a0,684 # 8041681c <dev_node_ops+0x644>
80411578:	8acef0ef          	jal	ra,80400624 <__panic>

8041157c <sfs_getdirentry>:
8041157c:	fd010113          	addi	sp,sp,-48
80411580:	02912223          	sw	s1,36(sp)
80411584:	00050493          	mv	s1,a0
80411588:	10400513          	li	a0,260
8041158c:	01812423          	sw	s8,8(sp)
80411590:	02112623          	sw	ra,44(sp)
80411594:	02812423          	sw	s0,40(sp)
80411598:	03212023          	sw	s2,32(sp)
8041159c:	01312e23          	sw	s3,28(sp)
804115a0:	01412c23          	sw	s4,24(sp)
804115a4:	01512a23          	sw	s5,20(sp)
804115a8:	01612823          	sw	s6,16(sp)
804115ac:	01712623          	sw	s7,12(sp)
804115b0:	00058c13          	mv	s8,a1
804115b4:	a4cf10ef          	jal	ra,80402800 <kmalloc>
804115b8:	12050a63          	beqz	a0,804116ec <sfs_getdirentry+0x170>
804115bc:	0384aa83          	lw	s5,56(s1)
804115c0:	120a8a63          	beqz	s5,804116f4 <sfs_getdirentry+0x178>
804115c4:	06caa783          	lw	a5,108(s5)
804115c8:	12079663          	bnez	a5,804116f4 <sfs_getdirentry+0x178>
804115cc:	02c4a703          	lw	a4,44(s1)
804115d0:	000017b7          	lui	a5,0x1
804115d4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804115d8:	12f71e63          	bne	a4,a5,80411714 <sfs_getdirentry+0x198>
804115dc:	004c2403          	lw	s0,4(s8)
804115e0:	00050913          	mv	s2,a0
804115e4:	0e044663          	bltz	s0,804116d0 <sfs_getdirentry+0x154>
804115e8:	0ff47793          	andi	a5,s0,255
804115ec:	0e079263          	bnez	a5,804116d0 <sfs_getdirentry+0x154>
804115f0:	0004a783          	lw	a5,0(s1)
804115f4:	00845413          	srli	s0,s0,0x8
804115f8:	0087a783          	lw	a5,8(a5)
804115fc:	0e87e263          	bltu	a5,s0,804116e0 <sfs_getdirentry+0x164>
80411600:	01048b93          	addi	s7,s1,16
80411604:	000b8513          	mv	a0,s7
80411608:	f5cf40ef          	jal	ra,80405d64 <down>
8041160c:	0004a783          	lw	a5,0(s1)
80411610:	0087ab03          	lw	s6,8(a5)
80411614:	0b605663          	blez	s6,804116c0 <sfs_getdirentry+0x144>
80411618:	00000993          	li	s3,0
8041161c:	01c0006f          	j	80411638 <sfs_getdirentry+0xbc>
80411620:	00092783          	lw	a5,0(s2)
80411624:	00078663          	beqz	a5,80411630 <sfs_getdirentry+0xb4>
80411628:	02040c63          	beqz	s0,80411660 <sfs_getdirentry+0xe4>
8041162c:	fff40413          	addi	s0,s0,-1
80411630:	00198993          	addi	s3,s3,1
80411634:	093b0663          	beq	s6,s3,804116c0 <sfs_getdirentry+0x144>
80411638:	00090693          	mv	a3,s2
8041163c:	00098613          	mv	a2,s3
80411640:	00048593          	mv	a1,s1
80411644:	000a8513          	mv	a0,s5
80411648:	e5dff0ef          	jal	ra,804114a4 <sfs_dirent_read_nolock>
8041164c:	00050a13          	mv	s4,a0
80411650:	fc0508e3          	beqz	a0,80411620 <sfs_getdirentry+0xa4>
80411654:	000b8513          	mv	a0,s7
80411658:	f08f40ef          	jal	ra,80405d60 <up>
8041165c:	0280006f          	j	80411684 <sfs_getdirentry+0x108>
80411660:	000b8513          	mv	a0,s7
80411664:	efcf40ef          	jal	ra,80405d60 <up>
80411668:	00000713          	li	a4,0
8041166c:	00100693          	li	a3,1
80411670:	10000613          	li	a2,256
80411674:	00490593          	addi	a1,s2,4
80411678:	000c0513          	mv	a0,s8
8041167c:	b51f50ef          	jal	ra,804071cc <iobuf_move>
80411680:	00050a13          	mv	s4,a0
80411684:	00090513          	mv	a0,s2
80411688:	a9cf10ef          	jal	ra,80402924 <kfree>
8041168c:	02c12083          	lw	ra,44(sp)
80411690:	02812403          	lw	s0,40(sp)
80411694:	000a0513          	mv	a0,s4
80411698:	02412483          	lw	s1,36(sp)
8041169c:	02012903          	lw	s2,32(sp)
804116a0:	01c12983          	lw	s3,28(sp)
804116a4:	01812a03          	lw	s4,24(sp)
804116a8:	01412a83          	lw	s5,20(sp)
804116ac:	01012b03          	lw	s6,16(sp)
804116b0:	00c12b83          	lw	s7,12(sp)
804116b4:	00812c03          	lw	s8,8(sp)
804116b8:	03010113          	addi	sp,sp,48
804116bc:	00008067          	ret
804116c0:	000b8513          	mv	a0,s7
804116c4:	ff000a13          	li	s4,-16
804116c8:	e98f40ef          	jal	ra,80405d60 <up>
804116cc:	fb9ff06f          	j	80411684 <sfs_getdirentry+0x108>
804116d0:	00090513          	mv	a0,s2
804116d4:	a50f10ef          	jal	ra,80402924 <kfree>
804116d8:	ffd00a13          	li	s4,-3
804116dc:	fb1ff06f          	j	8041168c <sfs_getdirentry+0x110>
804116e0:	a44f10ef          	jal	ra,80402924 <kfree>
804116e4:	ff000a13          	li	s4,-16
804116e8:	fa5ff06f          	j	8041168c <sfs_getdirentry+0x110>
804116ec:	ffc00a13          	li	s4,-4
804116f0:	f9dff06f          	j	8041168c <sfs_getdirentry+0x110>
804116f4:	00005697          	auipc	a3,0x5
804116f8:	f8c68693          	addi	a3,a3,-116 # 80416680 <dev_node_ops+0x4a8>
804116fc:	00002617          	auipc	a2,0x2
80411700:	0e460613          	addi	a2,a2,228 # 804137e0 <commands+0x1bc>
80411704:	33a00593          	li	a1,826
80411708:	00005517          	auipc	a0,0x5
8041170c:	11450513          	addi	a0,a0,276 # 8041681c <dev_node_ops+0x644>
80411710:	f15ee0ef          	jal	ra,80400624 <__panic>
80411714:	00005697          	auipc	a3,0x5
80411718:	12068693          	addi	a3,a3,288 # 80416834 <dev_node_ops+0x65c>
8041171c:	00002617          	auipc	a2,0x2
80411720:	0c460613          	addi	a2,a2,196 # 804137e0 <commands+0x1bc>
80411724:	33b00593          	li	a1,827
80411728:	00005517          	auipc	a0,0x5
8041172c:	0f450513          	addi	a0,a0,244 # 8041681c <dev_node_ops+0x644>
80411730:	ef5ee0ef          	jal	ra,80400624 <__panic>

80411734 <sfs_truncfile>:
80411734:	fa010113          	addi	sp,sp,-96
80411738:	04112e23          	sw	ra,92(sp)
8041173c:	04812c23          	sw	s0,88(sp)
80411740:	04912a23          	sw	s1,84(sp)
80411744:	05212823          	sw	s2,80(sp)
80411748:	05312623          	sw	s3,76(sp)
8041174c:	05412423          	sw	s4,72(sp)
80411750:	05512223          	sw	s5,68(sp)
80411754:	05612023          	sw	s6,64(sp)
80411758:	03712e23          	sw	s7,60(sp)
8041175c:	03812c23          	sw	s8,56(sp)
80411760:	03912a23          	sw	s9,52(sp)
80411764:	03a12823          	sw	s10,48(sp)
80411768:	03b12623          	sw	s11,44(sp)
8041176c:	080007b7          	lui	a5,0x8000
80411770:	1eb7ec63          	bltu	a5,a1,80411968 <sfs_truncfile+0x234>
80411774:	03852d03          	lw	s10,56(a0)
80411778:	00050913          	mv	s2,a0
8041177c:	00058a13          	mv	s4,a1
80411780:	1e0d0863          	beqz	s10,80411970 <sfs_truncfile+0x23c>
80411784:	06cd2783          	lw	a5,108(s10)
80411788:	1e079463          	bnez	a5,80411970 <sfs_truncfile+0x23c>
8041178c:	02c52703          	lw	a4,44(a0)
80411790:	000014b7          	lui	s1,0x1
80411794:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411798:	20f71c63          	bne	a4,a5,804119b0 <sfs_truncfile+0x27c>
8041179c:	00052a83          	lw	s5,0(a0)
804117a0:	fff48493          	addi	s1,s1,-1
804117a4:	009584b3          	add	s1,a1,s1
804117a8:	000aa783          	lw	a5,0(s5)
804117ac:	00c4d493          	srli	s1,s1,0xc
804117b0:	04f59863          	bne	a1,a5,80411800 <sfs_truncfile+0xcc>
804117b4:	008aa783          	lw	a5,8(s5)
804117b8:	00000c93          	li	s9,0
804117bc:	20f49a63          	bne	s1,a5,804119d0 <sfs_truncfile+0x29c>
804117c0:	05c12083          	lw	ra,92(sp)
804117c4:	05812403          	lw	s0,88(sp)
804117c8:	000c8513          	mv	a0,s9
804117cc:	05412483          	lw	s1,84(sp)
804117d0:	05012903          	lw	s2,80(sp)
804117d4:	04c12983          	lw	s3,76(sp)
804117d8:	04812a03          	lw	s4,72(sp)
804117dc:	04412a83          	lw	s5,68(sp)
804117e0:	04012b03          	lw	s6,64(sp)
804117e4:	03c12b83          	lw	s7,60(sp)
804117e8:	03812c03          	lw	s8,56(sp)
804117ec:	03412c83          	lw	s9,52(sp)
804117f0:	03012d03          	lw	s10,48(sp)
804117f4:	02c12d83          	lw	s11,44(sp)
804117f8:	06010113          	addi	sp,sp,96
804117fc:	00008067          	ret
80411800:	01050b13          	addi	s6,a0,16
80411804:	000b0513          	mv	a0,s6
80411808:	d5cf40ef          	jal	ra,80405d64 <down>
8041180c:	008aa403          	lw	s0,8(s5)
80411810:	0e946063          	bltu	s0,s1,804118f0 <sfs_truncfile+0x1bc>
80411814:	1084f263          	bgeu	s1,s0,80411918 <sfs_truncfile+0x1e4>
80411818:	00092d83          	lw	s11,0(s2)
8041181c:	008da783          	lw	a5,8(s11) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80411820:	16078863          	beqz	a5,80411990 <sfs_truncfile+0x25c>
80411824:	030d0713          	addi	a4,s10,48
80411828:	00b00b93          	li	s7,11
8041182c:	00e12623          	sw	a4,12(sp)
80411830:	00100c13          	li	s8,1
80411834:	0900006f          	j	804118c4 <sfs_truncfile+0x190>
80411838:	ff378993          	addi	s3,a5,-13 # 7fffff3 <_binary_bin_sfs_img_size+0x7f87ff3>
8041183c:	3ff00793          	li	a5,1023
80411840:	0737e063          	bltu	a5,s3,804118a0 <sfs_truncfile+0x16c>
80411844:	03cda783          	lw	a5,60(s11)
80411848:	04078c63          	beqz	a5,804118a0 <sfs_truncfile+0x16c>
8041184c:	004d2503          	lw	a0,4(s10)
80411850:	00c12583          	lw	a1,12(sp)
80411854:	00078613          	mv	a2,a5
80411858:	00f12423          	sw	a5,8(sp)
8041185c:	ac8ff0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
80411860:	00812783          	lw	a5,8(sp)
80411864:	18050663          	beqz	a0,804119f0 <sfs_truncfile+0x2bc>
80411868:	00299993          	slli	s3,s3,0x2
8041186c:	00098713          	mv	a4,s3
80411870:	00078693          	mv	a3,a5
80411874:	00400613          	li	a2,4
80411878:	01810593          	addi	a1,sp,24
8041187c:	000d0513          	mv	a0,s10
80411880:	00f12423          	sw	a5,8(sp)
80411884:	00012e23          	sw	zero,28(sp)
80411888:	765000ef          	jal	ra,804127ec <sfs_rbuf>
8041188c:	00050c93          	mv	s9,a0
80411890:	08051e63          	bnez	a0,8041192c <sfs_truncfile+0x1f8>
80411894:	01812703          	lw	a4,24(sp)
80411898:	00812783          	lw	a5,8(sp)
8041189c:	08071e63          	bnez	a4,80411938 <sfs_truncfile+0x204>
804118a0:	008da783          	lw	a5,8(s11)
804118a4:	fff40413          	addi	s0,s0,-1
804118a8:	fff78793          	addi	a5,a5,-1
804118ac:	00fda423          	sw	a5,8(s11)
804118b0:	01892423          	sw	s8,8(s2)
804118b4:	06848063          	beq	s1,s0,80411914 <sfs_truncfile+0x1e0>
804118b8:	00092d83          	lw	s11,0(s2)
804118bc:	008da783          	lw	a5,8(s11)
804118c0:	0c078863          	beqz	a5,80411990 <sfs_truncfile+0x25c>
804118c4:	fff78713          	addi	a4,a5,-1
804118c8:	f6ebe8e3          	bltu	s7,a4,80411838 <sfs_truncfile+0x104>
804118cc:	00279793          	slli	a5,a5,0x2
804118d0:	00fd89b3          	add	s3,s11,a5
804118d4:	0089a583          	lw	a1,8(s3)
804118d8:	fc0584e3          	beqz	a1,804118a0 <sfs_truncfile+0x16c>
804118dc:	000d0513          	mv	a0,s10
804118e0:	b54ff0ef          	jal	ra,80410c34 <sfs_block_free>
804118e4:	0009a423          	sw	zero,8(s3)
804118e8:	01892423          	sw	s8,8(s2)
804118ec:	fb5ff06f          	j	804118a0 <sfs_truncfile+0x16c>
804118f0:	00000693          	li	a3,0
804118f4:	00040613          	mv	a2,s0
804118f8:	00090593          	mv	a1,s2
804118fc:	000d0513          	mv	a0,s10
80411900:	de4ff0ef          	jal	ra,80410ee4 <sfs_bmap_load_nolock>
80411904:	00050c93          	mv	s9,a0
80411908:	02051263          	bnez	a0,8041192c <sfs_truncfile+0x1f8>
8041190c:	00140413          	addi	s0,s0,1
80411910:	fe8490e3          	bne	s1,s0,804118f0 <sfs_truncfile+0x1bc>
80411914:	008aa403          	lw	s0,8(s5)
80411918:	0e849c63          	bne	s1,s0,80411a10 <sfs_truncfile+0x2dc>
8041191c:	014aa023          	sw	s4,0(s5)
80411920:	00100793          	li	a5,1
80411924:	00f92423          	sw	a5,8(s2)
80411928:	00000c93          	li	s9,0
8041192c:	000b0513          	mv	a0,s6
80411930:	c30f40ef          	jal	ra,80405d60 <up>
80411934:	e8dff06f          	j	804117c0 <sfs_truncfile+0x8c>
80411938:	00098713          	mv	a4,s3
8041193c:	00078693          	mv	a3,a5
80411940:	00400613          	li	a2,4
80411944:	01c10593          	addi	a1,sp,28
80411948:	000d0513          	mv	a0,s10
8041194c:	76d000ef          	jal	ra,804128b8 <sfs_wbuf>
80411950:	00050c93          	mv	s9,a0
80411954:	fc051ce3          	bnez	a0,8041192c <sfs_truncfile+0x1f8>
80411958:	01812583          	lw	a1,24(sp)
8041195c:	000d0513          	mv	a0,s10
80411960:	ad4ff0ef          	jal	ra,80410c34 <sfs_block_free>
80411964:	f3dff06f          	j	804118a0 <sfs_truncfile+0x16c>
80411968:	ffd00c93          	li	s9,-3
8041196c:	e55ff06f          	j	804117c0 <sfs_truncfile+0x8c>
80411970:	00005697          	auipc	a3,0x5
80411974:	d1068693          	addi	a3,a3,-752 # 80416680 <dev_node_ops+0x4a8>
80411978:	00002617          	auipc	a2,0x2
8041197c:	e6860613          	addi	a2,a2,-408 # 804137e0 <commands+0x1bc>
80411980:	3a900593          	li	a1,937
80411984:	00005517          	auipc	a0,0x5
80411988:	e9850513          	addi	a0,a0,-360 # 8041681c <dev_node_ops+0x644>
8041198c:	c99ee0ef          	jal	ra,80400624 <__panic>
80411990:	00005697          	auipc	a3,0x5
80411994:	05068693          	addi	a3,a3,80 # 804169e0 <sfs_node_fileops+0x70>
80411998:	00002617          	auipc	a2,0x2
8041199c:	e4860613          	addi	a2,a2,-440 # 804137e0 <commands+0x1bc>
804119a0:	17b00593          	li	a1,379
804119a4:	00005517          	auipc	a0,0x5
804119a8:	e7850513          	addi	a0,a0,-392 # 8041681c <dev_node_ops+0x644>
804119ac:	c79ee0ef          	jal	ra,80400624 <__panic>
804119b0:	00005697          	auipc	a3,0x5
804119b4:	e8468693          	addi	a3,a3,-380 # 80416834 <dev_node_ops+0x65c>
804119b8:	00002617          	auipc	a2,0x2
804119bc:	e2860613          	addi	a2,a2,-472 # 804137e0 <commands+0x1bc>
804119c0:	3aa00593          	li	a1,938
804119c4:	00005517          	auipc	a0,0x5
804119c8:	e5850513          	addi	a0,a0,-424 # 8041681c <dev_node_ops+0x644>
804119cc:	c59ee0ef          	jal	ra,80400624 <__panic>
804119d0:	00005697          	auipc	a3,0x5
804119d4:	ff868693          	addi	a3,a3,-8 # 804169c8 <sfs_node_fileops+0x58>
804119d8:	00002617          	auipc	a2,0x2
804119dc:	e0860613          	addi	a2,a2,-504 # 804137e0 <commands+0x1bc>
804119e0:	3b100593          	li	a1,945
804119e4:	00005517          	auipc	a0,0x5
804119e8:	e3850513          	addi	a0,a0,-456 # 8041681c <dev_node_ops+0x644>
804119ec:	c39ee0ef          	jal	ra,80400624 <__panic>
804119f0:	00005697          	auipc	a3,0x5
804119f4:	00468693          	addi	a3,a3,4 # 804169f4 <sfs_node_fileops+0x84>
804119f8:	00002617          	auipc	a2,0x2
804119fc:	de860613          	addi	a2,a2,-536 # 804137e0 <commands+0x1bc>
80411a00:	12b00593          	li	a1,299
80411a04:	00005517          	auipc	a0,0x5
80411a08:	e1850513          	addi	a0,a0,-488 # 8041681c <dev_node_ops+0x644>
80411a0c:	c19ee0ef          	jal	ra,80400624 <__panic>
80411a10:	00005697          	auipc	a3,0x5
80411a14:	01868693          	addi	a3,a3,24 # 80416a28 <sfs_node_fileops+0xb8>
80411a18:	00002617          	auipc	a2,0x2
80411a1c:	dc860613          	addi	a2,a2,-568 # 804137e0 <commands+0x1bc>
80411a20:	3ca00593          	li	a1,970
80411a24:	00005517          	auipc	a0,0x5
80411a28:	df850513          	addi	a0,a0,-520 # 8041681c <dev_node_ops+0x644>
80411a2c:	bf9ee0ef          	jal	ra,80400624 <__panic>

80411a30 <sfs_tryseek>:
80411a30:	080007b7          	lui	a5,0x8000
80411a34:	08f5fa63          	bgeu	a1,a5,80411ac8 <sfs_tryseek+0x98>
80411a38:	ff010113          	addi	sp,sp,-16
80411a3c:	00812423          	sw	s0,8(sp)
80411a40:	00912223          	sw	s1,4(sp)
80411a44:	00112623          	sw	ra,12(sp)
80411a48:	00050413          	mv	s0,a0
80411a4c:	00058493          	mv	s1,a1
80411a50:	08050063          	beqz	a0,80411ad0 <sfs_tryseek+0xa0>
80411a54:	02c52703          	lw	a4,44(a0)
80411a58:	000017b7          	lui	a5,0x1
80411a5c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411a60:	06f71863          	bne	a4,a5,80411ad0 <sfs_tryseek+0xa0>
80411a64:	00052783          	lw	a5,0(a0)
80411a68:	0007a783          	lw	a5,0(a5)
80411a6c:	04b7f263          	bgeu	a5,a1,80411ab0 <sfs_tryseek+0x80>
80411a70:	03c52783          	lw	a5,60(a0)
80411a74:	06078e63          	beqz	a5,80411af0 <sfs_tryseek+0xc0>
80411a78:	0307a783          	lw	a5,48(a5)
80411a7c:	06078a63          	beqz	a5,80411af0 <sfs_tryseek+0xc0>
80411a80:	00004597          	auipc	a1,0x4
80411a84:	5e458593          	addi	a1,a1,1508 # 80416064 <syscalls+0x8c0>
80411a88:	d60fc0ef          	jal	ra,8040dfe8 <inode_check>
80411a8c:	03c42783          	lw	a5,60(s0)
80411a90:	00040513          	mv	a0,s0
80411a94:	00812403          	lw	s0,8(sp)
80411a98:	00c12083          	lw	ra,12(sp)
80411a9c:	00048593          	mv	a1,s1
80411aa0:	0307a303          	lw	t1,48(a5)
80411aa4:	00412483          	lw	s1,4(sp)
80411aa8:	01010113          	addi	sp,sp,16
80411aac:	00030067          	jr	t1
80411ab0:	00c12083          	lw	ra,12(sp)
80411ab4:	00812403          	lw	s0,8(sp)
80411ab8:	00412483          	lw	s1,4(sp)
80411abc:	00000513          	li	a0,0
80411ac0:	01010113          	addi	sp,sp,16
80411ac4:	00008067          	ret
80411ac8:	ffd00513          	li	a0,-3
80411acc:	00008067          	ret
80411ad0:	00005697          	auipc	a3,0x5
80411ad4:	d6468693          	addi	a3,a3,-668 # 80416834 <dev_node_ops+0x65c>
80411ad8:	00002617          	auipc	a2,0x2
80411adc:	d0860613          	addi	a2,a2,-760 # 804137e0 <commands+0x1bc>
80411ae0:	39a00593          	li	a1,922
80411ae4:	00005517          	auipc	a0,0x5
80411ae8:	d3850513          	addi	a0,a0,-712 # 8041681c <dev_node_ops+0x644>
80411aec:	b39ee0ef          	jal	ra,80400624 <__panic>
80411af0:	00004697          	auipc	a3,0x4
80411af4:	52068693          	addi	a3,a3,1312 # 80416010 <syscalls+0x86c>
80411af8:	00002617          	auipc	a2,0x2
80411afc:	ce860613          	addi	a2,a2,-792 # 804137e0 <commands+0x1bc>
80411b00:	39c00593          	li	a1,924
80411b04:	00005517          	auipc	a0,0x5
80411b08:	d1850513          	addi	a0,a0,-744 # 8041681c <dev_node_ops+0x644>
80411b0c:	b19ee0ef          	jal	ra,80400624 <__panic>

80411b10 <sfs_close>:
80411b10:	ff010113          	addi	sp,sp,-16
80411b14:	00112623          	sw	ra,12(sp)
80411b18:	00812423          	sw	s0,8(sp)
80411b1c:	04050063          	beqz	a0,80411b5c <sfs_close+0x4c>
80411b20:	03c52783          	lw	a5,60(a0)
80411b24:	00050413          	mv	s0,a0
80411b28:	02078a63          	beqz	a5,80411b5c <sfs_close+0x4c>
80411b2c:	0187a783          	lw	a5,24(a5)
80411b30:	02078663          	beqz	a5,80411b5c <sfs_close+0x4c>
80411b34:	00003597          	auipc	a1,0x3
80411b38:	3a058593          	addi	a1,a1,928 # 80414ed4 <CSWTCH.69+0x17c>
80411b3c:	cacfc0ef          	jal	ra,8040dfe8 <inode_check>
80411b40:	03c42783          	lw	a5,60(s0)
80411b44:	00040513          	mv	a0,s0
80411b48:	00812403          	lw	s0,8(sp)
80411b4c:	00c12083          	lw	ra,12(sp)
80411b50:	0187a303          	lw	t1,24(a5)
80411b54:	01010113          	addi	sp,sp,16
80411b58:	00030067          	jr	t1
80411b5c:	00003697          	auipc	a3,0x3
80411b60:	32868693          	addi	a3,a3,808 # 80414e84 <CSWTCH.69+0x12c>
80411b64:	00002617          	auipc	a2,0x2
80411b68:	c7c60613          	addi	a2,a2,-900 # 804137e0 <commands+0x1bc>
80411b6c:	21c00593          	li	a1,540
80411b70:	00005517          	auipc	a0,0x5
80411b74:	cac50513          	addi	a0,a0,-852 # 8041681c <dev_node_ops+0x644>
80411b78:	aadee0ef          	jal	ra,80400624 <__panic>

80411b7c <sfs_fstat>:
80411b7c:	ff010113          	addi	sp,sp,-16
80411b80:	00912223          	sw	s1,4(sp)
80411b84:	00058493          	mv	s1,a1
80411b88:	00812423          	sw	s0,8(sp)
80411b8c:	01000613          	li	a2,16
80411b90:	00050413          	mv	s0,a0
80411b94:	00000593          	li	a1,0
80411b98:	00048513          	mv	a0,s1
80411b9c:	00112623          	sw	ra,12(sp)
80411ba0:	011010ef          	jal	ra,804133b0 <memset>
80411ba4:	06040e63          	beqz	s0,80411c20 <sfs_fstat+0xa4>
80411ba8:	03c42783          	lw	a5,60(s0)
80411bac:	06078a63          	beqz	a5,80411c20 <sfs_fstat+0xa4>
80411bb0:	0287a783          	lw	a5,40(a5)
80411bb4:	06078663          	beqz	a5,80411c20 <sfs_fstat+0xa4>
80411bb8:	00004597          	auipc	a1,0x4
80411bbc:	60458593          	addi	a1,a1,1540 # 804161bc <syscalls+0xa18>
80411bc0:	00040513          	mv	a0,s0
80411bc4:	c24fc0ef          	jal	ra,8040dfe8 <inode_check>
80411bc8:	03c42783          	lw	a5,60(s0)
80411bcc:	00048593          	mv	a1,s1
80411bd0:	00040513          	mv	a0,s0
80411bd4:	0287a783          	lw	a5,40(a5)
80411bd8:	000780e7          	jalr	a5
80411bdc:	02051863          	bnez	a0,80411c0c <sfs_fstat+0x90>
80411be0:	02c42703          	lw	a4,44(s0)
80411be4:	000017b7          	lui	a5,0x1
80411be8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411bec:	04f71a63          	bne	a4,a5,80411c40 <sfs_fstat+0xc4>
80411bf0:	00042783          	lw	a5,0(s0)
80411bf4:	0067d683          	lhu	a3,6(a5)
80411bf8:	0087a703          	lw	a4,8(a5)
80411bfc:	0007a783          	lw	a5,0(a5)
80411c00:	00d4a223          	sw	a3,4(s1)
80411c04:	00e4a423          	sw	a4,8(s1)
80411c08:	00f4a623          	sw	a5,12(s1)
80411c0c:	00c12083          	lw	ra,12(sp)
80411c10:	00812403          	lw	s0,8(sp)
80411c14:	00412483          	lw	s1,4(sp)
80411c18:	01010113          	addi	sp,sp,16
80411c1c:	00008067          	ret
80411c20:	00004697          	auipc	a3,0x4
80411c24:	53468693          	addi	a3,a3,1332 # 80416154 <syscalls+0x9b0>
80411c28:	00002617          	auipc	a2,0x2
80411c2c:	bb860613          	addi	a2,a2,-1096 # 804137e0 <commands+0x1bc>
80411c30:	2b800593          	li	a1,696
80411c34:	00005517          	auipc	a0,0x5
80411c38:	be850513          	addi	a0,a0,-1048 # 8041681c <dev_node_ops+0x644>
80411c3c:	9e9ee0ef          	jal	ra,80400624 <__panic>
80411c40:	00005697          	auipc	a3,0x5
80411c44:	bf468693          	addi	a3,a3,-1036 # 80416834 <dev_node_ops+0x65c>
80411c48:	00002617          	auipc	a2,0x2
80411c4c:	b9860613          	addi	a2,a2,-1128 # 804137e0 <commands+0x1bc>
80411c50:	2bb00593          	li	a1,699
80411c54:	00005517          	auipc	a0,0x5
80411c58:	bc850513          	addi	a0,a0,-1080 # 8041681c <dev_node_ops+0x644>
80411c5c:	9c9ee0ef          	jal	ra,80400624 <__panic>

80411c60 <sfs_io.part.12>:
80411c60:	ff010113          	addi	sp,sp,-16
80411c64:	00005697          	auipc	a3,0x5
80411c68:	bd068693          	addi	a3,a3,-1072 # 80416834 <dev_node_ops+0x65c>
80411c6c:	00002617          	auipc	a2,0x2
80411c70:	b7460613          	addi	a2,a2,-1164 # 804137e0 <commands+0x1bc>
80411c74:	29700593          	li	a1,663
80411c78:	00005517          	auipc	a0,0x5
80411c7c:	ba450513          	addi	a0,a0,-1116 # 8041681c <dev_node_ops+0x644>
80411c80:	00112623          	sw	ra,12(sp)
80411c84:	9a1ee0ef          	jal	ra,80400624 <__panic>

80411c88 <sfs_read>:
80411c88:	fd010113          	addi	sp,sp,-48
80411c8c:	03212023          	sw	s2,32(sp)
80411c90:	03852903          	lw	s2,56(a0)
80411c94:	02112623          	sw	ra,44(sp)
80411c98:	02812423          	sw	s0,40(sp)
80411c9c:	02912223          	sw	s1,36(sp)
80411ca0:	01312e23          	sw	s3,28(sp)
80411ca4:	08090a63          	beqz	s2,80411d38 <sfs_read+0xb0>
80411ca8:	06c92783          	lw	a5,108(s2)
80411cac:	08079663          	bnez	a5,80411d38 <sfs_read+0xb0>
80411cb0:	02c52703          	lw	a4,44(a0)
80411cb4:	000017b7          	lui	a5,0x1
80411cb8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411cbc:	00050413          	mv	s0,a0
80411cc0:	08f71c63          	bne	a4,a5,80411d58 <sfs_read+0xd0>
80411cc4:	01050993          	addi	s3,a0,16
80411cc8:	00098513          	mv	a0,s3
80411ccc:	00058493          	mv	s1,a1
80411cd0:	894f40ef          	jal	ra,80405d64 <down>
80411cd4:	00c4a803          	lw	a6,12(s1)
80411cd8:	0044a683          	lw	a3,4(s1)
80411cdc:	0004a603          	lw	a2,0(s1)
80411ce0:	00040593          	mv	a1,s0
80411ce4:	00000793          	li	a5,0
80411ce8:	00c10713          	addi	a4,sp,12
80411cec:	00090513          	mv	a0,s2
80411cf0:	01012623          	sw	a6,12(sp)
80411cf4:	cd4ff0ef          	jal	ra,804111c8 <sfs_io_nolock>
80411cf8:	00c12583          	lw	a1,12(sp)
80411cfc:	00050413          	mv	s0,a0
80411d00:	02059663          	bnez	a1,80411d2c <sfs_read+0xa4>
80411d04:	00098513          	mv	a0,s3
80411d08:	858f40ef          	jal	ra,80405d60 <up>
80411d0c:	00040513          	mv	a0,s0
80411d10:	02c12083          	lw	ra,44(sp)
80411d14:	02812403          	lw	s0,40(sp)
80411d18:	02412483          	lw	s1,36(sp)
80411d1c:	02012903          	lw	s2,32(sp)
80411d20:	01c12983          	lw	s3,28(sp)
80411d24:	03010113          	addi	sp,sp,48
80411d28:	00008067          	ret
80411d2c:	00048513          	mv	a0,s1
80411d30:	d58f50ef          	jal	ra,80407288 <iobuf_skip>
80411d34:	fd1ff06f          	j	80411d04 <sfs_read+0x7c>
80411d38:	00005697          	auipc	a3,0x5
80411d3c:	94868693          	addi	a3,a3,-1720 # 80416680 <dev_node_ops+0x4a8>
80411d40:	00002617          	auipc	a2,0x2
80411d44:	aa060613          	addi	a2,a2,-1376 # 804137e0 <commands+0x1bc>
80411d48:	29600593          	li	a1,662
80411d4c:	00005517          	auipc	a0,0x5
80411d50:	ad050513          	addi	a0,a0,-1328 # 8041681c <dev_node_ops+0x644>
80411d54:	8d1ee0ef          	jal	ra,80400624 <__panic>
80411d58:	f09ff0ef          	jal	ra,80411c60 <sfs_io.part.12>

80411d5c <sfs_write>:
80411d5c:	fd010113          	addi	sp,sp,-48
80411d60:	03212023          	sw	s2,32(sp)
80411d64:	03852903          	lw	s2,56(a0)
80411d68:	02112623          	sw	ra,44(sp)
80411d6c:	02812423          	sw	s0,40(sp)
80411d70:	02912223          	sw	s1,36(sp)
80411d74:	01312e23          	sw	s3,28(sp)
80411d78:	08090a63          	beqz	s2,80411e0c <sfs_write+0xb0>
80411d7c:	06c92783          	lw	a5,108(s2)
80411d80:	08079663          	bnez	a5,80411e0c <sfs_write+0xb0>
80411d84:	02c52703          	lw	a4,44(a0)
80411d88:	000017b7          	lui	a5,0x1
80411d8c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411d90:	00050413          	mv	s0,a0
80411d94:	08f71c63          	bne	a4,a5,80411e2c <sfs_write+0xd0>
80411d98:	01050993          	addi	s3,a0,16
80411d9c:	00098513          	mv	a0,s3
80411da0:	00058493          	mv	s1,a1
80411da4:	fc1f30ef          	jal	ra,80405d64 <down>
80411da8:	00c4a803          	lw	a6,12(s1)
80411dac:	0044a683          	lw	a3,4(s1)
80411db0:	0004a603          	lw	a2,0(s1)
80411db4:	00040593          	mv	a1,s0
80411db8:	00100793          	li	a5,1
80411dbc:	00c10713          	addi	a4,sp,12
80411dc0:	00090513          	mv	a0,s2
80411dc4:	01012623          	sw	a6,12(sp)
80411dc8:	c00ff0ef          	jal	ra,804111c8 <sfs_io_nolock>
80411dcc:	00c12583          	lw	a1,12(sp)
80411dd0:	00050413          	mv	s0,a0
80411dd4:	02059663          	bnez	a1,80411e00 <sfs_write+0xa4>
80411dd8:	00098513          	mv	a0,s3
80411ddc:	f85f30ef          	jal	ra,80405d60 <up>
80411de0:	00040513          	mv	a0,s0
80411de4:	02c12083          	lw	ra,44(sp)
80411de8:	02812403          	lw	s0,40(sp)
80411dec:	02412483          	lw	s1,36(sp)
80411df0:	02012903          	lw	s2,32(sp)
80411df4:	01c12983          	lw	s3,28(sp)
80411df8:	03010113          	addi	sp,sp,48
80411dfc:	00008067          	ret
80411e00:	00048513          	mv	a0,s1
80411e04:	c84f50ef          	jal	ra,80407288 <iobuf_skip>
80411e08:	fd1ff06f          	j	80411dd8 <sfs_write+0x7c>
80411e0c:	00005697          	auipc	a3,0x5
80411e10:	87468693          	addi	a3,a3,-1932 # 80416680 <dev_node_ops+0x4a8>
80411e14:	00002617          	auipc	a2,0x2
80411e18:	9cc60613          	addi	a2,a2,-1588 # 804137e0 <commands+0x1bc>
80411e1c:	29600593          	li	a1,662
80411e20:	00005517          	auipc	a0,0x5
80411e24:	9fc50513          	addi	a0,a0,-1540 # 8041681c <dev_node_ops+0x644>
80411e28:	ffcee0ef          	jal	ra,80400624 <__panic>
80411e2c:	e35ff0ef          	jal	ra,80411c60 <sfs_io.part.12>

80411e30 <sfs_load_inode>:
80411e30:	fe010113          	addi	sp,sp,-32
80411e34:	00112e23          	sw	ra,28(sp)
80411e38:	00812c23          	sw	s0,24(sp)
80411e3c:	01212823          	sw	s2,16(sp)
80411e40:	01312623          	sw	s3,12(sp)
80411e44:	00050913          	mv	s2,a0
80411e48:	00060993          	mv	s3,a2
80411e4c:	01412423          	sw	s4,8(sp)
80411e50:	00912a23          	sw	s1,20(sp)
80411e54:	00058a13          	mv	s4,a1
80411e58:	01512223          	sw	s5,4(sp)
80411e5c:	4f5000ef          	jal	ra,80412b50 <lock_sfs_fs>
80411e60:	00a00593          	li	a1,10
80411e64:	06892403          	lw	s0,104(s2)
80411e68:	00098513          	mv	a0,s3
80411e6c:	505000ef          	jal	ra,80412b70 <hash32>
80411e70:	00351513          	slli	a0,a0,0x3
80411e74:	00a40533          	add	a0,s0,a0
80411e78:	00050413          	mv	s0,a0
80411e7c:	00c0006f          	j	80411e88 <sfs_load_inode+0x58>
80411e80:	fe042783          	lw	a5,-32(s0)
80411e84:	10f98a63          	beq	s3,a5,80411f98 <sfs_load_inode+0x168>
80411e88:	00442403          	lw	s0,4(s0)
80411e8c:	fe851ae3          	bne	a0,s0,80411e80 <sfs_load_inode+0x50>
80411e90:	04000513          	li	a0,64
80411e94:	96df00ef          	jal	ra,80402800 <kmalloc>
80411e98:	00050a93          	mv	s5,a0
80411e9c:	14050e63          	beqz	a0,80411ff8 <sfs_load_inode+0x1c8>
80411ea0:	00492503          	lw	a0,4(s2)
80411ea4:	00098613          	mv	a2,s3
80411ea8:	03090593          	addi	a1,s2,48
80411eac:	c79fe0ef          	jal	ra,80410b24 <sfs_block_inuse.isra.3>
80411eb0:	1e050863          	beqz	a0,804120a0 <sfs_load_inode+0x270>
80411eb4:	00000713          	li	a4,0
80411eb8:	00098693          	mv	a3,s3
80411ebc:	04000613          	li	a2,64
80411ec0:	000a8593          	mv	a1,s5
80411ec4:	00090513          	mv	a0,s2
80411ec8:	125000ef          	jal	ra,804127ec <sfs_rbuf>
80411ecc:	00050413          	mv	s0,a0
80411ed0:	12051e63          	bnez	a0,8041200c <sfs_load_inode+0x1dc>
80411ed4:	006ad783          	lhu	a5,6(s5)
80411ed8:	1a078463          	beqz	a5,80412080 <sfs_load_inode+0x250>
80411edc:	00001537          	lui	a0,0x1
80411ee0:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411ee4:	830fc0ef          	jal	ra,8040df14 <__alloc_inode>
80411ee8:	00050493          	mv	s1,a0
80411eec:	10050e63          	beqz	a0,80412008 <sfs_load_inode+0x1d8>
80411ef0:	004ad683          	lhu	a3,4(s5)
80411ef4:	00100793          	li	a5,1
80411ef8:	12f69063          	bne	a3,a5,80412018 <sfs_load_inode+0x1e8>
80411efc:	00005597          	auipc	a1,0x5
80411f00:	a7458593          	addi	a1,a1,-1420 # 80416970 <sfs_node_fileops>
80411f04:	00090613          	mv	a2,s2
80411f08:	00048513          	mv	a0,s1
80411f0c:	838fc0ef          	jal	ra,8040df44 <inode_init>
80411f10:	02c4a403          	lw	s0,44(s1)
80411f14:	000017b7          	lui	a5,0x1
80411f18:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411f1c:	14f41263          	bne	s0,a5,80412060 <sfs_load_inode+0x230>
80411f20:	00100793          	li	a5,1
80411f24:	00f4a623          	sw	a5,12(s1)
80411f28:	0154a023          	sw	s5,0(s1)
80411f2c:	0134a223          	sw	s3,4(s1)
80411f30:	0004a423          	sw	zero,8(s1)
80411f34:	00100593          	li	a1,1
80411f38:	01048513          	addi	a0,s1,16
80411f3c:	e19f30ef          	jal	ra,80405d54 <sem_init>
80411f40:	02c4a783          	lw	a5,44(s1)
80411f44:	0e879e63          	bne	a5,s0,80412040 <sfs_load_inode+0x210>
80411f48:	06492683          	lw	a3,100(s2)
80411f4c:	01c48793          	addi	a5,s1,28
80411f50:	06090713          	addi	a4,s2,96
80411f54:	00f6a023          	sw	a5,0(a3)
80411f58:	06f92223          	sw	a5,100(s2)
80411f5c:	0044a503          	lw	a0,4(s1)
80411f60:	00e4ae23          	sw	a4,28(s1)
80411f64:	02d4a023          	sw	a3,32(s1)
80411f68:	06892403          	lw	s0,104(s2)
80411f6c:	00a00593          	li	a1,10
80411f70:	401000ef          	jal	ra,80412b70 <hash32>
80411f74:	00351513          	slli	a0,a0,0x3
80411f78:	00a40533          	add	a0,s0,a0
80411f7c:	00452783          	lw	a5,4(a0)
80411f80:	02448713          	addi	a4,s1,36
80411f84:	00e7a023          	sw	a4,0(a5)
80411f88:	00e52223          	sw	a4,4(a0)
80411f8c:	02f4a423          	sw	a5,40(s1)
80411f90:	02a4a223          	sw	a0,36(s1)
80411f94:	01c0006f          	j	80411fb0 <sfs_load_inode+0x180>
80411f98:	fdc40493          	addi	s1,s0,-36
80411f9c:	00048513          	mv	a0,s1
80411fa0:	820fc0ef          	jal	ra,8040dfc0 <inode_ref_inc>
80411fa4:	00100793          	li	a5,1
80411fa8:	04f50063          	beq	a0,a5,80411fe8 <sfs_load_inode+0x1b8>
80411fac:	ee0482e3          	beqz	s1,80411e90 <sfs_load_inode+0x60>
80411fb0:	00090513          	mv	a0,s2
80411fb4:	3ad000ef          	jal	ra,80412b60 <unlock_sfs_fs>
80411fb8:	00000413          	li	s0,0
80411fbc:	009a2023          	sw	s1,0(s4)
80411fc0:	00040513          	mv	a0,s0
80411fc4:	01c12083          	lw	ra,28(sp)
80411fc8:	01812403          	lw	s0,24(sp)
80411fcc:	01412483          	lw	s1,20(sp)
80411fd0:	01012903          	lw	s2,16(sp)
80411fd4:	00c12983          	lw	s3,12(sp)
80411fd8:	00812a03          	lw	s4,8(sp)
80411fdc:	00412a83          	lw	s5,4(sp)
80411fe0:	02010113          	addi	sp,sp,32
80411fe4:	00008067          	ret
80411fe8:	fe842783          	lw	a5,-24(s0)
80411fec:	00178793          	addi	a5,a5,1
80411ff0:	fef42423          	sw	a5,-24(s0)
80411ff4:	fb9ff06f          	j	80411fac <sfs_load_inode+0x17c>
80411ff8:	ffc00413          	li	s0,-4
80411ffc:	00090513          	mv	a0,s2
80412000:	361000ef          	jal	ra,80412b60 <unlock_sfs_fs>
80412004:	fbdff06f          	j	80411fc0 <sfs_load_inode+0x190>
80412008:	ffc00413          	li	s0,-4
8041200c:	000a8513          	mv	a0,s5
80412010:	915f00ef          	jal	ra,80402924 <kfree>
80412014:	fe9ff06f          	j	80411ffc <sfs_load_inode+0x1cc>
80412018:	00200793          	li	a5,2
8041201c:	00005597          	auipc	a1,0x5
80412020:	91458593          	addi	a1,a1,-1772 # 80416930 <sfs_node_dirops>
80412024:	eef680e3          	beq	a3,a5,80411f04 <sfs_load_inode+0xd4>
80412028:	00005617          	auipc	a2,0x5
8041202c:	84460613          	addi	a2,a2,-1980 # 8041686c <dev_node_ops+0x694>
80412030:	02e00593          	li	a1,46
80412034:	00004517          	auipc	a0,0x4
80412038:	7e850513          	addi	a0,a0,2024 # 8041681c <dev_node_ops+0x644>
8041203c:	de8ee0ef          	jal	ra,80400624 <__panic>
80412040:	00004697          	auipc	a3,0x4
80412044:	7f468693          	addi	a3,a3,2036 # 80416834 <dev_node_ops+0x65c>
80412048:	00001617          	auipc	a2,0x1
8041204c:	79860613          	addi	a2,a2,1944 # 804137e0 <commands+0x1bc>
80412050:	0b100593          	li	a1,177
80412054:	00004517          	auipc	a0,0x4
80412058:	7c850513          	addi	a0,a0,1992 # 8041681c <dev_node_ops+0x644>
8041205c:	dc8ee0ef          	jal	ra,80400624 <__panic>
80412060:	00004697          	auipc	a3,0x4
80412064:	7d468693          	addi	a3,a3,2004 # 80416834 <dev_node_ops+0x65c>
80412068:	00001617          	auipc	a2,0x1
8041206c:	77860613          	addi	a2,a2,1912 # 804137e0 <commands+0x1bc>
80412070:	07700593          	li	a1,119
80412074:	00004517          	auipc	a0,0x4
80412078:	7a850513          	addi	a0,a0,1960 # 8041681c <dev_node_ops+0x644>
8041207c:	da8ee0ef          	jal	ra,80400624 <__panic>
80412080:	00005697          	auipc	a3,0x5
80412084:	82068693          	addi	a3,a3,-2016 # 804168a0 <dev_node_ops+0x6c8>
80412088:	00001617          	auipc	a2,0x1
8041208c:	75860613          	addi	a2,a2,1880 # 804137e0 <commands+0x1bc>
80412090:	0ad00593          	li	a1,173
80412094:	00004517          	auipc	a0,0x4
80412098:	78850513          	addi	a0,a0,1928 # 8041681c <dev_node_ops+0x644>
8041209c:	d88ee0ef          	jal	ra,80400624 <__panic>
804120a0:	00004697          	auipc	a3,0x4
804120a4:	71468693          	addi	a3,a3,1812 # 804167b4 <dev_node_ops+0x5dc>
804120a8:	00001617          	auipc	a2,0x1
804120ac:	73860613          	addi	a2,a2,1848 # 804137e0 <commands+0x1bc>
804120b0:	0a800593          	li	a1,168
804120b4:	00004517          	auipc	a0,0x4
804120b8:	76850513          	addi	a0,a0,1896 # 8041681c <dev_node_ops+0x644>
804120bc:	d68ee0ef          	jal	ra,80400624 <__panic>

804120c0 <sfs_lookup_once.constprop.13>:
804120c0:	fd010113          	addi	sp,sp,-48
804120c4:	01312e23          	sw	s3,28(sp)
804120c8:	01058993          	addi	s3,a1,16
804120cc:	01712623          	sw	s7,12(sp)
804120d0:	00050b93          	mv	s7,a0
804120d4:	00098513          	mv	a0,s3
804120d8:	02112623          	sw	ra,44(sp)
804120dc:	03212023          	sw	s2,32(sp)
804120e0:	01512a23          	sw	s5,20(sp)
804120e4:	01812423          	sw	s8,8(sp)
804120e8:	00060a93          	mv	s5,a2
804120ec:	00058913          	mv	s2,a1
804120f0:	00068c13          	mv	s8,a3
804120f4:	02812423          	sw	s0,40(sp)
804120f8:	02912223          	sw	s1,36(sp)
804120fc:	01412c23          	sw	s4,24(sp)
80412100:	01612823          	sw	s6,16(sp)
80412104:	01912223          	sw	s9,4(sp)
80412108:	c5df30ef          	jal	ra,80405d64 <down>
8041210c:	000a8513          	mv	a0,s5
80412110:	1bc010ef          	jal	ra,804132cc <strlen>
80412114:	0ff00793          	li	a5,255
80412118:	10a7ee63          	bltu	a5,a0,80412234 <sfs_lookup_once.constprop.13+0x174>
8041211c:	10400513          	li	a0,260
80412120:	ee0f00ef          	jal	ra,80402800 <kmalloc>
80412124:	00050413          	mv	s0,a0
80412128:	0e050e63          	beqz	a0,80412224 <sfs_lookup_once.constprop.13+0x164>
8041212c:	00092783          	lw	a5,0(s2)
80412130:	0087ab03          	lw	s6,8(a5)
80412134:	09605a63          	blez	s6,804121c8 <sfs_lookup_once.constprop.13+0x108>
80412138:	00000493          	li	s1,0
8041213c:	00450c93          	addi	s9,a0,4
80412140:	0240006f          	j	80412164 <sfs_lookup_once.constprop.13+0xa4>
80412144:	00042783          	lw	a5,0(s0)
80412148:	00078a63          	beqz	a5,8041215c <sfs_lookup_once.constprop.13+0x9c>
8041214c:	000c8593          	mv	a1,s9
80412150:	000a8513          	mv	a0,s5
80412154:	200010ef          	jal	ra,80413354 <strcmp>
80412158:	06050c63          	beqz	a0,804121d0 <sfs_lookup_once.constprop.13+0x110>
8041215c:	00148493          	addi	s1,s1,1
80412160:	069b0463          	beq	s6,s1,804121c8 <sfs_lookup_once.constprop.13+0x108>
80412164:	00040693          	mv	a3,s0
80412168:	00048613          	mv	a2,s1
8041216c:	00090593          	mv	a1,s2
80412170:	000b8513          	mv	a0,s7
80412174:	b30ff0ef          	jal	ra,804114a4 <sfs_dirent_read_nolock>
80412178:	00050a13          	mv	s4,a0
8041217c:	fc0504e3          	beqz	a0,80412144 <sfs_lookup_once.constprop.13+0x84>
80412180:	00040513          	mv	a0,s0
80412184:	fa0f00ef          	jal	ra,80402924 <kfree>
80412188:	00098513          	mv	a0,s3
8041218c:	bd5f30ef          	jal	ra,80405d60 <up>
80412190:	02c12083          	lw	ra,44(sp)
80412194:	02812403          	lw	s0,40(sp)
80412198:	000a0513          	mv	a0,s4
8041219c:	02412483          	lw	s1,36(sp)
804121a0:	02012903          	lw	s2,32(sp)
804121a4:	01c12983          	lw	s3,28(sp)
804121a8:	01812a03          	lw	s4,24(sp)
804121ac:	01412a83          	lw	s5,20(sp)
804121b0:	01012b03          	lw	s6,16(sp)
804121b4:	00c12b83          	lw	s7,12(sp)
804121b8:	00812c03          	lw	s8,8(sp)
804121bc:	00412c83          	lw	s9,4(sp)
804121c0:	03010113          	addi	sp,sp,48
804121c4:	00008067          	ret
804121c8:	ff000a13          	li	s4,-16
804121cc:	fb5ff06f          	j	80412180 <sfs_lookup_once.constprop.13+0xc0>
804121d0:	00040513          	mv	a0,s0
804121d4:	00042483          	lw	s1,0(s0)
804121d8:	f4cf00ef          	jal	ra,80402924 <kfree>
804121dc:	00098513          	mv	a0,s3
804121e0:	b81f30ef          	jal	ra,80405d60 <up>
804121e4:	02812403          	lw	s0,40(sp)
804121e8:	02c12083          	lw	ra,44(sp)
804121ec:	02012903          	lw	s2,32(sp)
804121f0:	01c12983          	lw	s3,28(sp)
804121f4:	01812a03          	lw	s4,24(sp)
804121f8:	01412a83          	lw	s5,20(sp)
804121fc:	01012b03          	lw	s6,16(sp)
80412200:	00412c83          	lw	s9,4(sp)
80412204:	00048613          	mv	a2,s1
80412208:	000c0593          	mv	a1,s8
8041220c:	02412483          	lw	s1,36(sp)
80412210:	00812c03          	lw	s8,8(sp)
80412214:	000b8513          	mv	a0,s7
80412218:	00c12b83          	lw	s7,12(sp)
8041221c:	03010113          	addi	sp,sp,48
80412220:	c11ff06f          	j	80411e30 <sfs_load_inode>
80412224:	00098513          	mv	a0,s3
80412228:	b39f30ef          	jal	ra,80405d60 <up>
8041222c:	ffc00a13          	li	s4,-4
80412230:	f61ff06f          	j	80412190 <sfs_lookup_once.constprop.13+0xd0>
80412234:	00004697          	auipc	a3,0x4
80412238:	6a068693          	addi	a3,a3,1696 # 804168d4 <dev_node_ops+0x6fc>
8041223c:	00001617          	auipc	a2,0x1
80412240:	5a460613          	addi	a2,a2,1444 # 804137e0 <commands+0x1bc>
80412244:	1ba00593          	li	a1,442
80412248:	00004517          	auipc	a0,0x4
8041224c:	5d450513          	addi	a0,a0,1492 # 8041681c <dev_node_ops+0x644>
80412250:	bd4ee0ef          	jal	ra,80400624 <__panic>

80412254 <sfs_namefile>:
80412254:	00c5a703          	lw	a4,12(a1)
80412258:	fa010113          	addi	sp,sp,-96
8041225c:	04112e23          	sw	ra,92(sp)
80412260:	04812c23          	sw	s0,88(sp)
80412264:	04912a23          	sw	s1,84(sp)
80412268:	05212823          	sw	s2,80(sp)
8041226c:	05312623          	sw	s3,76(sp)
80412270:	05412423          	sw	s4,72(sp)
80412274:	05512223          	sw	s5,68(sp)
80412278:	05612023          	sw	s6,64(sp)
8041227c:	03712e23          	sw	s7,60(sp)
80412280:	03812c23          	sw	s8,56(sp)
80412284:	03912a23          	sw	s9,52(sp)
80412288:	03a12823          	sw	s10,48(sp)
8041228c:	03b12623          	sw	s11,44(sp)
80412290:	00b12623          	sw	a1,12(sp)
80412294:	00200793          	li	a5,2
80412298:	24e7f063          	bgeu	a5,a4,804124d8 <sfs_namefile+0x284>
8041229c:	00050493          	mv	s1,a0
804122a0:	10400513          	li	a0,260
804122a4:	d5cf00ef          	jal	ra,80402800 <kmalloc>
804122a8:	00050a93          	mv	s5,a0
804122ac:	22050663          	beqz	a0,804124d8 <sfs_namefile+0x284>
804122b0:	0384ab03          	lw	s6,56(s1)
804122b4:	260b0663          	beqz	s6,80412520 <sfs_namefile+0x2cc>
804122b8:	06cb2783          	lw	a5,108(s6)
804122bc:	26079263          	bnez	a5,80412520 <sfs_namefile+0x2cc>
804122c0:	02c4ac03          	lw	s8,44(s1)
804122c4:	000017b7          	lui	a5,0x1
804122c8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804122cc:	26fc1a63          	bne	s8,a5,80412540 <sfs_namefile+0x2ec>
804122d0:	00c12703          	lw	a4,12(sp)
804122d4:	00048513          	mv	a0,s1
804122d8:	00048413          	mv	s0,s1
804122dc:	00c72783          	lw	a5,12(a4) # 800000c <_binary_bin_sfs_img_size+0x7f8800c>
804122e0:	00072903          	lw	s2,0(a4)
804122e4:	00004c97          	auipc	s9,0x4
804122e8:	614c8c93          	addi	s9,s9,1556 # 804168f8 <dev_node_ops+0x720>
804122ec:	ffe78a13          	addi	s4,a5,-2
804122f0:	00f90933          	add	s2,s2,a5
804122f4:	ccdfb0ef          	jal	ra,8040dfc0 <inode_ref_inc>
804122f8:	01c10693          	addi	a3,sp,28
804122fc:	000c8613          	mv	a2,s9
80412300:	00040593          	mv	a1,s0
80412304:	000b0513          	mv	a0,s6
80412308:	01812423          	sw	s8,8(sp)
8041230c:	db5ff0ef          	jal	ra,804120c0 <sfs_lookup_once.constprop.13>
80412310:	004a8b93          	addi	s7,s5,4
80412314:	00050d93          	mv	s11,a0
80412318:	0e051863          	bnez	a0,80412408 <sfs_namefile+0x1b4>
8041231c:	00048513          	mv	a0,s1
80412320:	00442983          	lw	s3,4(s0)
80412324:	d91fb0ef          	jal	ra,8040e0b4 <inode_ref_dec>
80412328:	01c12d03          	lw	s10,28(sp)
8041232c:	149d0663          	beq	s10,s1,80412478 <sfs_namefile+0x224>
80412330:	1c0d0863          	beqz	s10,80412500 <sfs_namefile+0x2ac>
80412334:	02cd2683          	lw	a3,44(s10)
80412338:	00812783          	lw	a5,8(sp)
8041233c:	1cf69263          	bne	a3,a5,80412500 <sfs_namefile+0x2ac>
80412340:	004d2683          	lw	a3,4(s10)
80412344:	000d0413          	mv	s0,s10
80412348:	19368c63          	beq	a3,s3,804124e0 <sfs_namefile+0x28c>
8041234c:	000d2683          	lw	a3,0(s10)
80412350:	00200793          	li	a5,2
80412354:	0046d683          	lhu	a3,4(a3)
80412358:	18f69463          	bne	a3,a5,804124e0 <sfs_namefile+0x28c>
8041235c:	010d0493          	addi	s1,s10,16
80412360:	00048513          	mv	a0,s1
80412364:	a01f30ef          	jal	ra,80405d64 <down>
80412368:	000d2683          	lw	a3,0(s10)
8041236c:	0086ac03          	lw	s8,8(a3)
80412370:	01804c63          	bgtz	s8,80412388 <sfs_namefile+0x134>
80412374:	0e40006f          	j	80412458 <sfs_namefile+0x204>
80412378:	000aa683          	lw	a3,0(s5)
8041237c:	02d98663          	beq	s3,a3,804123a8 <sfs_namefile+0x154>
80412380:	001d8d93          	addi	s11,s11,1
80412384:	0dbc0a63          	beq	s8,s11,80412458 <sfs_namefile+0x204>
80412388:	000a8693          	mv	a3,s5
8041238c:	000d8613          	mv	a2,s11
80412390:	000d0593          	mv	a1,s10
80412394:	000b0513          	mv	a0,s6
80412398:	90cff0ef          	jal	ra,804114a4 <sfs_dirent_read_nolock>
8041239c:	00050693          	mv	a3,a0
804123a0:	fc050ce3          	beqz	a0,80412378 <sfs_namefile+0x124>
804123a4:	0b80006f          	j	8041245c <sfs_namefile+0x208>
804123a8:	00048513          	mv	a0,s1
804123ac:	9b5f30ef          	jal	ra,80405d60 <up>
804123b0:	000b8513          	mv	a0,s7
804123b4:	719000ef          	jal	ra,804132cc <strlen>
804123b8:	00150713          	addi	a4,a0,1
804123bc:	10ea6863          	bltu	s4,a4,804124cc <sfs_namefile+0x278>
804123c0:	fff54993          	not	s3,a0
804123c4:	013909b3          	add	s3,s2,s3
804123c8:	00050613          	mv	a2,a0
804123cc:	000b8593          	mv	a1,s7
804123d0:	00098513          	mv	a0,s3
804123d4:	40ea0a33          	sub	s4,s4,a4
804123d8:	048010ef          	jal	ra,80413420 <memcpy>
804123dc:	02f00793          	li	a5,47
804123e0:	fef90fa3          	sb	a5,-1(s2)
804123e4:	01c10693          	addi	a3,sp,28
804123e8:	000c8613          	mv	a2,s9
804123ec:	00040593          	mv	a1,s0
804123f0:	000b0513          	mv	a0,s6
804123f4:	ccdff0ef          	jal	ra,804120c0 <sfs_lookup_once.constprop.13>
804123f8:	000d0493          	mv	s1,s10
804123fc:	00098913          	mv	s2,s3
80412400:	00050d93          	mv	s11,a0
80412404:	f0050ce3          	beqz	a0,8041231c <sfs_namefile+0xc8>
80412408:	00048513          	mv	a0,s1
8041240c:	ca9fb0ef          	jal	ra,8040e0b4 <inode_ref_dec>
80412410:	000a8513          	mv	a0,s5
80412414:	d10f00ef          	jal	ra,80402924 <kfree>
80412418:	05c12083          	lw	ra,92(sp)
8041241c:	05812403          	lw	s0,88(sp)
80412420:	000d8513          	mv	a0,s11
80412424:	05412483          	lw	s1,84(sp)
80412428:	05012903          	lw	s2,80(sp)
8041242c:	04c12983          	lw	s3,76(sp)
80412430:	04812a03          	lw	s4,72(sp)
80412434:	04412a83          	lw	s5,68(sp)
80412438:	04012b03          	lw	s6,64(sp)
8041243c:	03c12b83          	lw	s7,60(sp)
80412440:	03812c03          	lw	s8,56(sp)
80412444:	03412c83          	lw	s9,52(sp)
80412448:	03012d03          	lw	s10,48(sp)
8041244c:	02c12d83          	lw	s11,44(sp)
80412450:	06010113          	addi	sp,sp,96
80412454:	00008067          	ret
80412458:	ff000693          	li	a3,-16
8041245c:	00048513          	mv	a0,s1
80412460:	00d12423          	sw	a3,8(sp)
80412464:	8fdf30ef          	jal	ra,80405d60 <up>
80412468:	00812683          	lw	a3,8(sp)
8041246c:	000d0493          	mv	s1,s10
80412470:	00068d93          	mv	s11,a3
80412474:	f95ff06f          	j	80412408 <sfs_namefile+0x1b4>
80412478:	00048513          	mv	a0,s1
8041247c:	c39fb0ef          	jal	ra,8040e0b4 <inode_ref_dec>
80412480:	00c12403          	lw	s0,12(sp)
80412484:	00090593          	mv	a1,s2
80412488:	00c42783          	lw	a5,12(s0)
8041248c:	00042503          	lw	a0,0(s0)
80412490:	ffe78793          	addi	a5,a5,-2
80412494:	41478a33          	sub	s4,a5,s4
80412498:	000a0613          	mv	a2,s4
8041249c:	00150513          	addi	a0,a0,1
804124a0:	72d000ef          	jal	ra,804133cc <memmove>
804124a4:	02f00793          	li	a5,47
804124a8:	fef50fa3          	sb	a5,-1(a0)
804124ac:	01450533          	add	a0,a0,s4
804124b0:	00050023          	sb	zero,0(a0)
804124b4:	000a0593          	mv	a1,s4
804124b8:	00040513          	mv	a0,s0
804124bc:	dcdf40ef          	jal	ra,80407288 <iobuf_skip>
804124c0:	000a8513          	mv	a0,s5
804124c4:	c60f00ef          	jal	ra,80402924 <kfree>
804124c8:	f51ff06f          	j	80412418 <sfs_namefile+0x1c4>
804124cc:	000d0493          	mv	s1,s10
804124d0:	ffc00d93          	li	s11,-4
804124d4:	f35ff06f          	j	80412408 <sfs_namefile+0x1b4>
804124d8:	ffc00d93          	li	s11,-4
804124dc:	f3dff06f          	j	80412418 <sfs_namefile+0x1c4>
804124e0:	00004697          	auipc	a3,0x4
804124e4:	41c68693          	addi	a3,a3,1052 # 804168fc <dev_node_ops+0x724>
804124e8:	00001617          	auipc	a2,0x1
804124ec:	2f860613          	addi	a2,a2,760 # 804137e0 <commands+0x1bc>
804124f0:	2f900593          	li	a1,761
804124f4:	00004517          	auipc	a0,0x4
804124f8:	32850513          	addi	a0,a0,808 # 8041681c <dev_node_ops+0x644>
804124fc:	928ee0ef          	jal	ra,80400624 <__panic>
80412500:	00004697          	auipc	a3,0x4
80412504:	33468693          	addi	a3,a3,820 # 80416834 <dev_node_ops+0x65c>
80412508:	00001617          	auipc	a2,0x1
8041250c:	2d860613          	addi	a2,a2,728 # 804137e0 <commands+0x1bc>
80412510:	2f800593          	li	a1,760
80412514:	00004517          	auipc	a0,0x4
80412518:	30850513          	addi	a0,a0,776 # 8041681c <dev_node_ops+0x644>
8041251c:	908ee0ef          	jal	ra,80400624 <__panic>
80412520:	00004697          	auipc	a3,0x4
80412524:	16068693          	addi	a3,a3,352 # 80416680 <dev_node_ops+0x4a8>
80412528:	00001617          	auipc	a2,0x1
8041252c:	2b860613          	addi	a2,a2,696 # 804137e0 <commands+0x1bc>
80412530:	2e400593          	li	a1,740
80412534:	00004517          	auipc	a0,0x4
80412538:	2e850513          	addi	a0,a0,744 # 8041681c <dev_node_ops+0x644>
8041253c:	8e8ee0ef          	jal	ra,80400624 <__panic>
80412540:	00004697          	auipc	a3,0x4
80412544:	2f468693          	addi	a3,a3,756 # 80416834 <dev_node_ops+0x65c>
80412548:	00001617          	auipc	a2,0x1
8041254c:	29860613          	addi	a2,a2,664 # 804137e0 <commands+0x1bc>
80412550:	2e500593          	li	a1,741
80412554:	00004517          	auipc	a0,0x4
80412558:	2c850513          	addi	a0,a0,712 # 8041681c <dev_node_ops+0x644>
8041255c:	8c8ee0ef          	jal	ra,80400624 <__panic>

80412560 <sfs_lookup>:
80412560:	fd010113          	addi	sp,sp,-48
80412564:	02912223          	sw	s1,36(sp)
80412568:	03852483          	lw	s1,56(a0)
8041256c:	02112623          	sw	ra,44(sp)
80412570:	02812423          	sw	s0,40(sp)
80412574:	03212023          	sw	s2,32(sp)
80412578:	01312e23          	sw	s3,28(sp)
8041257c:	0c048463          	beqz	s1,80412644 <sfs_lookup+0xe4>
80412580:	06c4a783          	lw	a5,108(s1)
80412584:	0c079063          	bnez	a5,80412644 <sfs_lookup+0xe4>
80412588:	0005c783          	lbu	a5,0(a1)
8041258c:	00058913          	mv	s2,a1
80412590:	08078a63          	beqz	a5,80412624 <sfs_lookup+0xc4>
80412594:	02f00713          	li	a4,47
80412598:	08e78663          	beq	a5,a4,80412624 <sfs_lookup+0xc4>
8041259c:	00050413          	mv	s0,a0
804125a0:	00060993          	mv	s3,a2
804125a4:	a1dfb0ef          	jal	ra,8040dfc0 <inode_ref_inc>
804125a8:	02c42703          	lw	a4,44(s0)
804125ac:	000017b7          	lui	a5,0x1
804125b0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804125b4:	0af71863          	bne	a4,a5,80412664 <sfs_lookup+0x104>
804125b8:	00042703          	lw	a4,0(s0)
804125bc:	00200793          	li	a5,2
804125c0:	00475703          	lhu	a4,4(a4)
804125c4:	04f71863          	bne	a4,a5,80412614 <sfs_lookup+0xb4>
804125c8:	00048513          	mv	a0,s1
804125cc:	00c10693          	addi	a3,sp,12
804125d0:	00090613          	mv	a2,s2
804125d4:	00040593          	mv	a1,s0
804125d8:	ae9ff0ef          	jal	ra,804120c0 <sfs_lookup_once.constprop.13>
804125dc:	00050493          	mv	s1,a0
804125e0:	00040513          	mv	a0,s0
804125e4:	ad1fb0ef          	jal	ra,8040e0b4 <inode_ref_dec>
804125e8:	00049663          	bnez	s1,804125f4 <sfs_lookup+0x94>
804125ec:	00c12783          	lw	a5,12(sp)
804125f0:	00f9a023          	sw	a5,0(s3)
804125f4:	02c12083          	lw	ra,44(sp)
804125f8:	02812403          	lw	s0,40(sp)
804125fc:	00048513          	mv	a0,s1
80412600:	02012903          	lw	s2,32(sp)
80412604:	02412483          	lw	s1,36(sp)
80412608:	01c12983          	lw	s3,28(sp)
8041260c:	03010113          	addi	sp,sp,48
80412610:	00008067          	ret
80412614:	00040513          	mv	a0,s0
80412618:	a9dfb0ef          	jal	ra,8040e0b4 <inode_ref_dec>
8041261c:	fee00493          	li	s1,-18
80412620:	fd5ff06f          	j	804125f4 <sfs_lookup+0x94>
80412624:	00004697          	auipc	a3,0x4
80412628:	29068693          	addi	a3,a3,656 # 804168b4 <dev_node_ops+0x6dc>
8041262c:	00001617          	auipc	a2,0x1
80412630:	1b460613          	addi	a2,a2,436 # 804137e0 <commands+0x1bc>
80412634:	3db00593          	li	a1,987
80412638:	00004517          	auipc	a0,0x4
8041263c:	1e450513          	addi	a0,a0,484 # 8041681c <dev_node_ops+0x644>
80412640:	fe5ed0ef          	jal	ra,80400624 <__panic>
80412644:	00004697          	auipc	a3,0x4
80412648:	03c68693          	addi	a3,a3,60 # 80416680 <dev_node_ops+0x4a8>
8041264c:	00001617          	auipc	a2,0x1
80412650:	19460613          	addi	a2,a2,404 # 804137e0 <commands+0x1bc>
80412654:	3da00593          	li	a1,986
80412658:	00004517          	auipc	a0,0x4
8041265c:	1c450513          	addi	a0,a0,452 # 8041681c <dev_node_ops+0x644>
80412660:	fc5ed0ef          	jal	ra,80400624 <__panic>
80412664:	00004697          	auipc	a3,0x4
80412668:	1d068693          	addi	a3,a3,464 # 80416834 <dev_node_ops+0x65c>
8041266c:	00001617          	auipc	a2,0x1
80412670:	17460613          	addi	a2,a2,372 # 804137e0 <commands+0x1bc>
80412674:	3dd00593          	li	a1,989
80412678:	00004517          	auipc	a0,0x4
8041267c:	1a450513          	addi	a0,a0,420 # 8041681c <dev_node_ops+0x644>
80412680:	fa5ed0ef          	jal	ra,80400624 <__panic>

80412684 <sfs_rwblock_nolock.isra.0>:
80412684:	fe010113          	addi	sp,sp,-32
80412688:	00812c23          	sw	s0,24(sp)
8041268c:	00912a23          	sw	s1,20(sp)
80412690:	00112e23          	sw	ra,28(sp)
80412694:	00058493          	mv	s1,a1
80412698:	00070413          	mv	s0,a4
8041269c:	00060593          	mv	a1,a2
804126a0:	00069463          	bnez	a3,804126a8 <sfs_rwblock_nolock.isra.0+0x24>
804126a4:	04079463          	bnez	a5,804126ec <sfs_rwblock_nolock.isra.0+0x68>
804126a8:	00052783          	lw	a5,0(a0)
804126ac:	04f6f063          	bgeu	a3,a5,804126ec <sfs_rwblock_nolock.isra.0+0x68>
804126b0:	00001637          	lui	a2,0x1
804126b4:	00c69693          	slli	a3,a3,0xc
804126b8:	00010513          	mv	a0,sp
804126bc:	afdf40ef          	jal	ra,804071b8 <iobuf_init>
804126c0:	0004a783          	lw	a5,0(s1)
804126c4:	00050593          	mv	a1,a0
804126c8:	00040613          	mv	a2,s0
804126cc:	0107a703          	lw	a4,16(a5)
804126d0:	00078513          	mv	a0,a5
804126d4:	000700e7          	jalr	a4
804126d8:	01c12083          	lw	ra,28(sp)
804126dc:	01812403          	lw	s0,24(sp)
804126e0:	01412483          	lw	s1,20(sp)
804126e4:	02010113          	addi	sp,sp,32
804126e8:	00008067          	ret
804126ec:	00004697          	auipc	a3,0x4
804126f0:	39868693          	addi	a3,a3,920 # 80416a84 <sfs_node_fileops+0x114>
804126f4:	00001617          	auipc	a2,0x1
804126f8:	0ec60613          	addi	a2,a2,236 # 804137e0 <commands+0x1bc>
804126fc:	01500593          	li	a1,21
80412700:	00004517          	auipc	a0,0x4
80412704:	3b850513          	addi	a0,a0,952 # 80416ab8 <sfs_node_fileops+0x148>
80412708:	f1ded0ef          	jal	ra,80400624 <__panic>

8041270c <sfs_rwblock>:
8041270c:	fd010113          	addi	sp,sp,-48
80412710:	02812423          	sw	s0,40(sp)
80412714:	03212023          	sw	s2,32(sp)
80412718:	01812423          	sw	s8,8(sp)
8041271c:	00060413          	mv	s0,a2
80412720:	00050c13          	mv	s8,a0
80412724:	00068913          	mv	s2,a3
80412728:	02912223          	sw	s1,36(sp)
8041272c:	01312e23          	sw	s3,28(sp)
80412730:	01412c23          	sw	s4,24(sp)
80412734:	01512a23          	sw	s5,20(sp)
80412738:	01612823          	sw	s6,16(sp)
8041273c:	01712623          	sw	s7,12(sp)
80412740:	02112623          	sw	ra,44(sp)
80412744:	00058493          	mv	s1,a1
80412748:	00070a93          	mv	s5,a4
8041274c:	00450a13          	addi	s4,a0,4
80412750:	01240bb3          	add	s7,s0,s2
80412754:	404000ef          	jal	ra,80412b58 <lock_sfs_io>
80412758:	02cc0993          	addi	s3,s8,44
8041275c:	00001b37          	lui	s6,0x1
80412760:	00091863          	bnez	s2,80412770 <sfs_rwblock+0x64>
80412764:	0700006f          	j	804127d4 <sfs_rwblock+0xc8>
80412768:	016484b3          	add	s1,s1,s6
8041276c:	068b8463          	beq	s7,s0,804127d4 <sfs_rwblock+0xc8>
80412770:	00040693          	mv	a3,s0
80412774:	00048613          	mv	a2,s1
80412778:	00100793          	li	a5,1
8041277c:	000a8713          	mv	a4,s5
80412780:	00098593          	mv	a1,s3
80412784:	000a0513          	mv	a0,s4
80412788:	efdff0ef          	jal	ra,80412684 <sfs_rwblock_nolock.isra.0>
8041278c:	00050913          	mv	s2,a0
80412790:	00140413          	addi	s0,s0,1
80412794:	fc050ae3          	beqz	a0,80412768 <sfs_rwblock+0x5c>
80412798:	000c0513          	mv	a0,s8
8041279c:	3cc000ef          	jal	ra,80412b68 <unlock_sfs_io>
804127a0:	02c12083          	lw	ra,44(sp)
804127a4:	02812403          	lw	s0,40(sp)
804127a8:	00090513          	mv	a0,s2
804127ac:	02412483          	lw	s1,36(sp)
804127b0:	02012903          	lw	s2,32(sp)
804127b4:	01c12983          	lw	s3,28(sp)
804127b8:	01812a03          	lw	s4,24(sp)
804127bc:	01412a83          	lw	s5,20(sp)
804127c0:	01012b03          	lw	s6,16(sp)
804127c4:	00c12b83          	lw	s7,12(sp)
804127c8:	00812c03          	lw	s8,8(sp)
804127cc:	03010113          	addi	sp,sp,48
804127d0:	00008067          	ret
804127d4:	00000913          	li	s2,0
804127d8:	fc1ff06f          	j	80412798 <sfs_rwblock+0x8c>

804127dc <sfs_rblock>:
804127dc:	00000713          	li	a4,0
804127e0:	f2dff06f          	j	8041270c <sfs_rwblock>

804127e4 <sfs_wblock>:
804127e4:	00100713          	li	a4,1
804127e8:	f25ff06f          	j	8041270c <sfs_rwblock>

804127ec <sfs_rbuf>:
804127ec:	fe010113          	addi	sp,sp,-32
804127f0:	00112e23          	sw	ra,28(sp)
804127f4:	00812c23          	sw	s0,24(sp)
804127f8:	00912a23          	sw	s1,20(sp)
804127fc:	01212823          	sw	s2,16(sp)
80412800:	01312623          	sw	s3,12(sp)
80412804:	01412423          	sw	s4,8(sp)
80412808:	000017b7          	lui	a5,0x1
8041280c:	08f77663          	bgeu	a4,a5,80412898 <sfs_rbuf+0xac>
80412810:	00070493          	mv	s1,a4
80412814:	00c70733          	add	a4,a4,a2
80412818:	00060993          	mv	s3,a2
8041281c:	06e7ee63          	bltu	a5,a4,80412898 <sfs_rbuf+0xac>
80412820:	00050413          	mv	s0,a0
80412824:	00068913          	mv	s2,a3
80412828:	00058a13          	mv	s4,a1
8041282c:	32c000ef          	jal	ra,80412b58 <lock_sfs_io>
80412830:	03842603          	lw	a2,56(s0)
80412834:	00090693          	mv	a3,s2
80412838:	00100793          	li	a5,1
8041283c:	00000713          	li	a4,0
80412840:	02c40593          	addi	a1,s0,44
80412844:	00440513          	addi	a0,s0,4
80412848:	e3dff0ef          	jal	ra,80412684 <sfs_rwblock_nolock.isra.0>
8041284c:	00050913          	mv	s2,a0
80412850:	02050863          	beqz	a0,80412880 <sfs_rbuf+0x94>
80412854:	00040513          	mv	a0,s0
80412858:	310000ef          	jal	ra,80412b68 <unlock_sfs_io>
8041285c:	01c12083          	lw	ra,28(sp)
80412860:	01812403          	lw	s0,24(sp)
80412864:	00090513          	mv	a0,s2
80412868:	01412483          	lw	s1,20(sp)
8041286c:	01012903          	lw	s2,16(sp)
80412870:	00c12983          	lw	s3,12(sp)
80412874:	00812a03          	lw	s4,8(sp)
80412878:	02010113          	addi	sp,sp,32
8041287c:	00008067          	ret
80412880:	03842583          	lw	a1,56(s0)
80412884:	00098613          	mv	a2,s3
80412888:	000a0513          	mv	a0,s4
8041288c:	009585b3          	add	a1,a1,s1
80412890:	391000ef          	jal	ra,80413420 <memcpy>
80412894:	fc1ff06f          	j	80412854 <sfs_rbuf+0x68>
80412898:	00004697          	auipc	a3,0x4
8041289c:	1a868693          	addi	a3,a3,424 # 80416a40 <sfs_node_fileops+0xd0>
804128a0:	00001617          	auipc	a2,0x1
804128a4:	f4060613          	addi	a2,a2,-192 # 804137e0 <commands+0x1bc>
804128a8:	05500593          	li	a1,85
804128ac:	00004517          	auipc	a0,0x4
804128b0:	20c50513          	addi	a0,a0,524 # 80416ab8 <sfs_node_fileops+0x148>
804128b4:	d71ed0ef          	jal	ra,80400624 <__panic>

804128b8 <sfs_wbuf>:
804128b8:	fd010113          	addi	sp,sp,-48
804128bc:	02112623          	sw	ra,44(sp)
804128c0:	02812423          	sw	s0,40(sp)
804128c4:	02912223          	sw	s1,36(sp)
804128c8:	03212023          	sw	s2,32(sp)
804128cc:	01312e23          	sw	s3,28(sp)
804128d0:	01412c23          	sw	s4,24(sp)
804128d4:	01512a23          	sw	s5,20(sp)
804128d8:	01612823          	sw	s6,16(sp)
804128dc:	01712623          	sw	s7,12(sp)
804128e0:	000017b7          	lui	a5,0x1
804128e4:	0cf77063          	bgeu	a4,a5,804129a4 <sfs_wbuf+0xec>
804128e8:	00070493          	mv	s1,a4
804128ec:	00c70733          	add	a4,a4,a2
804128f0:	00060a13          	mv	s4,a2
804128f4:	0ae7e863          	bltu	a5,a4,804129a4 <sfs_wbuf+0xec>
804128f8:	00050413          	mv	s0,a0
804128fc:	00058b93          	mv	s7,a1
80412900:	00068993          	mv	s3,a3
80412904:	254000ef          	jal	ra,80412b58 <lock_sfs_io>
80412908:	03842603          	lw	a2,56(s0)
8041290c:	00440a93          	addi	s5,s0,4
80412910:	02c40b13          	addi	s6,s0,44
80412914:	00100793          	li	a5,1
80412918:	00000713          	li	a4,0
8041291c:	00098693          	mv	a3,s3
80412920:	000b0593          	mv	a1,s6
80412924:	000a8513          	mv	a0,s5
80412928:	d5dff0ef          	jal	ra,80412684 <sfs_rwblock_nolock.isra.0>
8041292c:	00050913          	mv	s2,a0
80412930:	02050e63          	beqz	a0,8041296c <sfs_wbuf+0xb4>
80412934:	00040513          	mv	a0,s0
80412938:	230000ef          	jal	ra,80412b68 <unlock_sfs_io>
8041293c:	02c12083          	lw	ra,44(sp)
80412940:	02812403          	lw	s0,40(sp)
80412944:	00090513          	mv	a0,s2
80412948:	02412483          	lw	s1,36(sp)
8041294c:	02012903          	lw	s2,32(sp)
80412950:	01c12983          	lw	s3,28(sp)
80412954:	01812a03          	lw	s4,24(sp)
80412958:	01412a83          	lw	s5,20(sp)
8041295c:	01012b03          	lw	s6,16(sp)
80412960:	00c12b83          	lw	s7,12(sp)
80412964:	03010113          	addi	sp,sp,48
80412968:	00008067          	ret
8041296c:	03842503          	lw	a0,56(s0)
80412970:	000a0613          	mv	a2,s4
80412974:	000b8593          	mv	a1,s7
80412978:	00950533          	add	a0,a0,s1
8041297c:	2a5000ef          	jal	ra,80413420 <memcpy>
80412980:	03842603          	lw	a2,56(s0)
80412984:	00100793          	li	a5,1
80412988:	00100713          	li	a4,1
8041298c:	00098693          	mv	a3,s3
80412990:	000b0593          	mv	a1,s6
80412994:	000a8513          	mv	a0,s5
80412998:	cedff0ef          	jal	ra,80412684 <sfs_rwblock_nolock.isra.0>
8041299c:	00050913          	mv	s2,a0
804129a0:	f95ff06f          	j	80412934 <sfs_wbuf+0x7c>
804129a4:	00004697          	auipc	a3,0x4
804129a8:	09c68693          	addi	a3,a3,156 # 80416a40 <sfs_node_fileops+0xd0>
804129ac:	00001617          	auipc	a2,0x1
804129b0:	e3460613          	addi	a2,a2,-460 # 804137e0 <commands+0x1bc>
804129b4:	06b00593          	li	a1,107
804129b8:	00004517          	auipc	a0,0x4
804129bc:	10050513          	addi	a0,a0,256 # 80416ab8 <sfs_node_fileops+0x148>
804129c0:	c65ed0ef          	jal	ra,80400624 <__panic>

804129c4 <sfs_sync_super>:
804129c4:	ff010113          	addi	sp,sp,-16
804129c8:	00112623          	sw	ra,12(sp)
804129cc:	00812423          	sw	s0,8(sp)
804129d0:	00912223          	sw	s1,4(sp)
804129d4:	00050413          	mv	s0,a0
804129d8:	180000ef          	jal	ra,80412b58 <lock_sfs_io>
804129dc:	03842503          	lw	a0,56(s0)
804129e0:	00001637          	lui	a2,0x1
804129e4:	00000593          	li	a1,0
804129e8:	1c9000ef          	jal	ra,804133b0 <memset>
804129ec:	03842503          	lw	a0,56(s0)
804129f0:	00040593          	mv	a1,s0
804129f4:	02c00613          	li	a2,44
804129f8:	229000ef          	jal	ra,80413420 <memcpy>
804129fc:	03842603          	lw	a2,56(s0)
80412a00:	02c40593          	addi	a1,s0,44
80412a04:	00000793          	li	a5,0
80412a08:	00100713          	li	a4,1
80412a0c:	00000693          	li	a3,0
80412a10:	00440513          	addi	a0,s0,4
80412a14:	c71ff0ef          	jal	ra,80412684 <sfs_rwblock_nolock.isra.0>
80412a18:	00050493          	mv	s1,a0
80412a1c:	00040513          	mv	a0,s0
80412a20:	148000ef          	jal	ra,80412b68 <unlock_sfs_io>
80412a24:	00c12083          	lw	ra,12(sp)
80412a28:	00812403          	lw	s0,8(sp)
80412a2c:	00048513          	mv	a0,s1
80412a30:	00412483          	lw	s1,4(sp)
80412a34:	01010113          	addi	sp,sp,16
80412a38:	00008067          	ret

80412a3c <sfs_sync_freemap>:
80412a3c:	ff010113          	addi	sp,sp,-16
80412a40:	00812423          	sw	s0,8(sp)
80412a44:	00452403          	lw	s0,4(a0)
80412a48:	00912223          	sw	s1,4(sp)
80412a4c:	000086b7          	lui	a3,0x8
80412a50:	00050493          	mv	s1,a0
80412a54:	03052503          	lw	a0,48(a0)
80412a58:	fff68693          	addi	a3,a3,-1 # 7fff <_binary_bin_swap_img_size-0x1>
80412a5c:	00d40433          	add	s0,s0,a3
80412a60:	00000593          	li	a1,0
80412a64:	00112623          	sw	ra,12(sp)
80412a68:	00f45413          	srli	s0,s0,0xf
80412a6c:	f2cfd0ef          	jal	ra,80410198 <bitmap_getdata>
80412a70:	00040693          	mv	a3,s0
80412a74:	00812403          	lw	s0,8(sp)
80412a78:	00c12083          	lw	ra,12(sp)
80412a7c:	00050593          	mv	a1,a0
80412a80:	00048513          	mv	a0,s1
80412a84:	00412483          	lw	s1,4(sp)
80412a88:	00100713          	li	a4,1
80412a8c:	00200613          	li	a2,2
80412a90:	01010113          	addi	sp,sp,16
80412a94:	c79ff06f          	j	8041270c <sfs_rwblock>

80412a98 <sfs_clear_block>:
80412a98:	fe010113          	addi	sp,sp,-32
80412a9c:	00112e23          	sw	ra,28(sp)
80412aa0:	00812c23          	sw	s0,24(sp)
80412aa4:	00912a23          	sw	s1,20(sp)
80412aa8:	00058413          	mv	s0,a1
80412aac:	00060493          	mv	s1,a2
80412ab0:	01212823          	sw	s2,16(sp)
80412ab4:	01312623          	sw	s3,12(sp)
80412ab8:	00050913          	mv	s2,a0
80412abc:	01412423          	sw	s4,8(sp)
80412ac0:	01512223          	sw	s5,4(sp)
80412ac4:	094000ef          	jal	ra,80412b58 <lock_sfs_io>
80412ac8:	03892503          	lw	a0,56(s2)
80412acc:	00001637          	lui	a2,0x1
80412ad0:	00000593          	li	a1,0
80412ad4:	0dd000ef          	jal	ra,804133b0 <memset>
80412ad8:	00940ab3          	add	s5,s0,s1
80412adc:	00490a13          	addi	s4,s2,4
80412ae0:	02c90993          	addi	s3,s2,44
80412ae4:	00049663          	bnez	s1,80412af0 <sfs_clear_block+0x58>
80412ae8:	0600006f          	j	80412b48 <sfs_clear_block+0xb0>
80412aec:	05540e63          	beq	s0,s5,80412b48 <sfs_clear_block+0xb0>
80412af0:	03892603          	lw	a2,56(s2)
80412af4:	00040693          	mv	a3,s0
80412af8:	00100793          	li	a5,1
80412afc:	00100713          	li	a4,1
80412b00:	00098593          	mv	a1,s3
80412b04:	000a0513          	mv	a0,s4
80412b08:	b7dff0ef          	jal	ra,80412684 <sfs_rwblock_nolock.isra.0>
80412b0c:	00050493          	mv	s1,a0
80412b10:	00140413          	addi	s0,s0,1
80412b14:	fc050ce3          	beqz	a0,80412aec <sfs_clear_block+0x54>
80412b18:	00090513          	mv	a0,s2
80412b1c:	04c000ef          	jal	ra,80412b68 <unlock_sfs_io>
80412b20:	01c12083          	lw	ra,28(sp)
80412b24:	01812403          	lw	s0,24(sp)
80412b28:	00048513          	mv	a0,s1
80412b2c:	01012903          	lw	s2,16(sp)
80412b30:	01412483          	lw	s1,20(sp)
80412b34:	00c12983          	lw	s3,12(sp)
80412b38:	00812a03          	lw	s4,8(sp)
80412b3c:	00412a83          	lw	s5,4(sp)
80412b40:	02010113          	addi	sp,sp,32
80412b44:	00008067          	ret
80412b48:	00000493          	li	s1,0
80412b4c:	fcdff06f          	j	80412b18 <sfs_clear_block+0x80>

80412b50 <lock_sfs_fs>:
80412b50:	03c50513          	addi	a0,a0,60
80412b54:	a10f306f          	j	80405d64 <down>

80412b58 <lock_sfs_io>:
80412b58:	04850513          	addi	a0,a0,72
80412b5c:	a08f306f          	j	80405d64 <down>

80412b60 <unlock_sfs_fs>:
80412b60:	03c50513          	addi	a0,a0,60
80412b64:	9fcf306f          	j	80405d60 <up>

80412b68 <unlock_sfs_io>:
80412b68:	04850513          	addi	a0,a0,72
80412b6c:	9f4f306f          	j	80405d60 <up>

80412b70 <hash32>:
80412b70:	00351793          	slli	a5,a0,0x3
80412b74:	40a787b3          	sub	a5,a5,a0
80412b78:	00679793          	slli	a5,a5,0x6
80412b7c:	40a78733          	sub	a4,a5,a0
80412b80:	00371793          	slli	a5,a4,0x3
80412b84:	40e787b3          	sub	a5,a5,a4
80412b88:	00379793          	slli	a5,a5,0x3
80412b8c:	00a787b3          	add	a5,a5,a0
80412b90:	01079793          	slli	a5,a5,0x10
80412b94:	40f50533          	sub	a0,a0,a5
80412b98:	02000793          	li	a5,32
80412b9c:	40b785b3          	sub	a1,a5,a1
80412ba0:	00b55533          	srl	a0,a0,a1
80412ba4:	00008067          	ret

80412ba8 <printnum>:
80412ba8:	fd010113          	addi	sp,sp,-48
80412bac:	02912223          	sw	s1,36(sp)
80412bb0:	01312e23          	sw	s3,28(sp)
80412bb4:	00050493          	mv	s1,a0
80412bb8:	00058993          	mv	s3,a1
80412bbc:	00068513          	mv	a0,a3
80412bc0:	00078593          	mv	a1,a5
80412bc4:	02812423          	sw	s0,40(sp)
80412bc8:	03212023          	sw	s2,32(sp)
80412bcc:	01412c23          	sw	s4,24(sp)
80412bd0:	01512a23          	sw	s5,20(sp)
80412bd4:	01612823          	sw	s6,16(sp)
80412bd8:	01712623          	sw	s7,12(sp)
80412bdc:	01812423          	sw	s8,8(sp)
80412be0:	02112623          	sw	ra,44(sp)
80412be4:	00068b13          	mv	s6,a3
80412be8:	00078a93          	mv	s5,a5
80412bec:	00070c13          	mv	s8,a4
80412bf0:	00060913          	mv	s2,a2
80412bf4:	00088a13          	mv	s4,a7
80412bf8:	fff80413          	addi	s0,a6,-1
80412bfc:	0bd000ef          	jal	ra,804134b8 <__umodsi3>
80412c00:	00050b93          	mv	s7,a0
80412c04:	060c1863          	bnez	s8,80412c74 <printnum+0xcc>
80412c08:	075b7663          	bgeu	s6,s5,80412c74 <printnum+0xcc>
80412c0c:	00805e63          	blez	s0,80412c28 <printnum+0x80>
80412c10:	fff40413          	addi	s0,s0,-1
80412c14:	00098613          	mv	a2,s3
80412c18:	00090593          	mv	a1,s2
80412c1c:	000a0513          	mv	a0,s4
80412c20:	000480e7          	jalr	s1
80412c24:	fe0416e3          	bnez	s0,80412c10 <printnum+0x68>
80412c28:	00004517          	auipc	a0,0x4
80412c2c:	06450513          	addi	a0,a0,100 # 80416c8c <error_string+0x64>
80412c30:	01750533          	add	a0,a0,s7
80412c34:	02812403          	lw	s0,40(sp)
80412c38:	02c12083          	lw	ra,44(sp)
80412c3c:	01812a03          	lw	s4,24(sp)
80412c40:	01412a83          	lw	s5,20(sp)
80412c44:	01012b03          	lw	s6,16(sp)
80412c48:	00c12b83          	lw	s7,12(sp)
80412c4c:	00812c03          	lw	s8,8(sp)
80412c50:	00054503          	lbu	a0,0(a0)
80412c54:	00098613          	mv	a2,s3
80412c58:	00090593          	mv	a1,s2
80412c5c:	01c12983          	lw	s3,28(sp)
80412c60:	02012903          	lw	s2,32(sp)
80412c64:	00048313          	mv	t1,s1
80412c68:	02412483          	lw	s1,36(sp)
80412c6c:	03010113          	addi	sp,sp,48
80412c70:	00030067          	jr	t1
80412c74:	000a8593          	mv	a1,s5
80412c78:	000b0513          	mv	a0,s6
80412c7c:	7f4000ef          	jal	ra,80413470 <__udivsi3>
80412c80:	00050693          	mv	a3,a0
80412c84:	000a0893          	mv	a7,s4
80412c88:	00040813          	mv	a6,s0
80412c8c:	000a8793          	mv	a5,s5
80412c90:	00000713          	li	a4,0
80412c94:	00090613          	mv	a2,s2
80412c98:	00098593          	mv	a1,s3
80412c9c:	00048513          	mv	a0,s1
80412ca0:	f09ff0ef          	jal	ra,80412ba8 <printnum>
80412ca4:	f85ff06f          	j	80412c28 <printnum+0x80>

80412ca8 <sprintputch>:
80412ca8:	0085a783          	lw	a5,8(a1)
80412cac:	0005a703          	lw	a4,0(a1)
80412cb0:	0045a683          	lw	a3,4(a1)
80412cb4:	00178793          	addi	a5,a5,1 # 1001 <_binary_bin_swap_img_size-0x6fff>
80412cb8:	00f5a423          	sw	a5,8(a1)
80412cbc:	00d77863          	bgeu	a4,a3,80412ccc <sprintputch+0x24>
80412cc0:	00170793          	addi	a5,a4,1
80412cc4:	00f5a023          	sw	a5,0(a1)
80412cc8:	00a70023          	sb	a0,0(a4)
80412ccc:	00008067          	ret

80412cd0 <vprintfmt>:
80412cd0:	fb010113          	addi	sp,sp,-80
80412cd4:	04912223          	sw	s1,68(sp)
80412cd8:	05212023          	sw	s2,64(sp)
80412cdc:	03312e23          	sw	s3,60(sp)
80412ce0:	03512a23          	sw	s5,52(sp)
80412ce4:	03612823          	sw	s6,48(sp)
80412ce8:	03712623          	sw	s7,44(sp)
80412cec:	03812423          	sw	s8,40(sp)
80412cf0:	01b12e23          	sw	s11,28(sp)
80412cf4:	04112623          	sw	ra,76(sp)
80412cf8:	04812423          	sw	s0,72(sp)
80412cfc:	03412c23          	sw	s4,56(sp)
80412d00:	03912223          	sw	s9,36(sp)
80412d04:	03a12023          	sw	s10,32(sp)
80412d08:	00050993          	mv	s3,a0
80412d0c:	00058913          	mv	s2,a1
80412d10:	00060493          	mv	s1,a2
80412d14:	00068d93          	mv	s11,a3
80412d18:	00070b13          	mv	s6,a4
80412d1c:	00004a97          	auipc	s5,0x4
80412d20:	db4a8a93          	addi	s5,s5,-588 # 80416ad0 <sfs_node_fileops+0x160>
80412d24:	fff00b93          	li	s7,-1
80412d28:	05e00c13          	li	s8,94
80412d2c:	000dc503          	lbu	a0,0(s11)
80412d30:	02500793          	li	a5,37
80412d34:	001d8413          	addi	s0,s11,1
80412d38:	02f50663          	beq	a0,a5,80412d64 <vprintfmt+0x94>
80412d3c:	06050663          	beqz	a0,80412da8 <vprintfmt+0xd8>
80412d40:	02500a13          	li	s4,37
80412d44:	0080006f          	j	80412d4c <vprintfmt+0x7c>
80412d48:	06050063          	beqz	a0,80412da8 <vprintfmt+0xd8>
80412d4c:	00090613          	mv	a2,s2
80412d50:	00048593          	mv	a1,s1
80412d54:	00140413          	addi	s0,s0,1
80412d58:	000980e7          	jalr	s3
80412d5c:	fff44503          	lbu	a0,-1(s0)
80412d60:	ff4514e3          	bne	a0,s4,80412d48 <vprintfmt+0x78>
80412d64:	00044503          	lbu	a0,0(s0)
80412d68:	02000893          	li	a7,32
80412d6c:	00000a13          	li	s4,0
80412d70:	00000593          	li	a1,0
80412d74:	fff00c93          	li	s9,-1
80412d78:	fff00d13          	li	s10,-1
80412d7c:	05500693          	li	a3,85
80412d80:	00900613          	li	a2,9
80412d84:	fdd50793          	addi	a5,a0,-35
80412d88:	0ff7f793          	andi	a5,a5,255
80412d8c:	00140d93          	addi	s11,s0,1
80412d90:	2ef6e663          	bltu	a3,a5,8041307c <vprintfmt+0x3ac>
80412d94:	00279793          	slli	a5,a5,0x2
80412d98:	015787b3          	add	a5,a5,s5
80412d9c:	0007a783          	lw	a5,0(a5)
80412da0:	015787b3          	add	a5,a5,s5
80412da4:	00078067          	jr	a5
80412da8:	04c12083          	lw	ra,76(sp)
80412dac:	04812403          	lw	s0,72(sp)
80412db0:	04412483          	lw	s1,68(sp)
80412db4:	04012903          	lw	s2,64(sp)
80412db8:	03c12983          	lw	s3,60(sp)
80412dbc:	03812a03          	lw	s4,56(sp)
80412dc0:	03412a83          	lw	s5,52(sp)
80412dc4:	03012b03          	lw	s6,48(sp)
80412dc8:	02c12b83          	lw	s7,44(sp)
80412dcc:	02812c03          	lw	s8,40(sp)
80412dd0:	02412c83          	lw	s9,36(sp)
80412dd4:	02012d03          	lw	s10,32(sp)
80412dd8:	01c12d83          	lw	s11,28(sp)
80412ddc:	05010113          	addi	sp,sp,80
80412de0:	00008067          	ret
80412de4:	00050893          	mv	a7,a0
80412de8:	00144503          	lbu	a0,1(s0)
80412dec:	000d8413          	mv	s0,s11
80412df0:	f95ff06f          	j	80412d84 <vprintfmt+0xb4>
80412df4:	000b2c83          	lw	s9,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
80412df8:	00144503          	lbu	a0,1(s0)
80412dfc:	004b0b13          	addi	s6,s6,4
80412e00:	000d8413          	mv	s0,s11
80412e04:	f80d50e3          	bgez	s10,80412d84 <vprintfmt+0xb4>
80412e08:	000c8d13          	mv	s10,s9
80412e0c:	fff00c93          	li	s9,-1
80412e10:	f75ff06f          	j	80412d84 <vprintfmt+0xb4>
80412e14:	fffd4793          	not	a5,s10
80412e18:	41f7d793          	srai	a5,a5,0x1f
80412e1c:	00144503          	lbu	a0,1(s0)
80412e20:	00fd7d33          	and	s10,s10,a5
80412e24:	000d8413          	mv	s0,s11
80412e28:	f5dff06f          	j	80412d84 <vprintfmt+0xb4>
80412e2c:	00100793          	li	a5,1
80412e30:	32b7c463          	blt	a5,a1,80413158 <vprintfmt+0x488>
80412e34:	000b2683          	lw	a3,0(s6)
80412e38:	00000713          	li	a4,0
80412e3c:	004b0b13          	addi	s6,s6,4
80412e40:	01000793          	li	a5,16
80412e44:	000d0813          	mv	a6,s10
80412e48:	00048613          	mv	a2,s1
80412e4c:	00090593          	mv	a1,s2
80412e50:	00098513          	mv	a0,s3
80412e54:	d55ff0ef          	jal	ra,80412ba8 <printnum>
80412e58:	ed5ff06f          	j	80412d2c <vprintfmt+0x5c>
80412e5c:	00144303          	lbu	t1,1(s0)
80412e60:	fd050c93          	addi	s9,a0,-48
80412e64:	000d8413          	mv	s0,s11
80412e68:	fd030793          	addi	a5,t1,-48
80412e6c:	00030513          	mv	a0,t1
80412e70:	f8f66ae3          	bltu	a2,a5,80412e04 <vprintfmt+0x134>
80412e74:	002c9793          	slli	a5,s9,0x2
80412e78:	01978733          	add	a4,a5,s9
80412e7c:	00140413          	addi	s0,s0,1
80412e80:	00171713          	slli	a4,a4,0x1
80412e84:	00670733          	add	a4,a4,t1
80412e88:	00044303          	lbu	t1,0(s0)
80412e8c:	fd070c93          	addi	s9,a4,-48
80412e90:	fd030793          	addi	a5,t1,-48
80412e94:	00030513          	mv	a0,t1
80412e98:	fcf67ee3          	bgeu	a2,a5,80412e74 <vprintfmt+0x1a4>
80412e9c:	f69ff06f          	j	80412e04 <vprintfmt+0x134>
80412ea0:	000b2503          	lw	a0,0(s6)
80412ea4:	00090613          	mv	a2,s2
80412ea8:	00048593          	mv	a1,s1
80412eac:	004b0b13          	addi	s6,s6,4
80412eb0:	000980e7          	jalr	s3
80412eb4:	e79ff06f          	j	80412d2c <vprintfmt+0x5c>
80412eb8:	00100793          	li	a5,1
80412ebc:	28b7c263          	blt	a5,a1,80413140 <vprintfmt+0x470>
80412ec0:	000b2a03          	lw	s4,0(s6)
80412ec4:	004b0793          	addi	a5,s6,4
80412ec8:	00078b13          	mv	s6,a5
80412ecc:	41fa5413          	srai	s0,s4,0x1f
80412ed0:	2c044063          	bltz	s0,80413190 <vprintfmt+0x4c0>
80412ed4:	000a0693          	mv	a3,s4
80412ed8:	00040713          	mv	a4,s0
80412edc:	00a00793          	li	a5,10
80412ee0:	f65ff06f          	j	80412e44 <vprintfmt+0x174>
80412ee4:	000b2703          	lw	a4,0(s6)
80412ee8:	01800693          	li	a3,24
80412eec:	004b0b13          	addi	s6,s6,4
80412ef0:	41f75793          	srai	a5,a4,0x1f
80412ef4:	00e7c733          	xor	a4,a5,a4
80412ef8:	40f70733          	sub	a4,a4,a5
80412efc:	1ae6ca63          	blt	a3,a4,804130b0 <vprintfmt+0x3e0>
80412f00:	00271793          	slli	a5,a4,0x2
80412f04:	00004697          	auipc	a3,0x4
80412f08:	d2468693          	addi	a3,a3,-732 # 80416c28 <error_string>
80412f0c:	00f687b3          	add	a5,a3,a5
80412f10:	0007a783          	lw	a5,0(a5)
80412f14:	18078e63          	beqz	a5,804130b0 <vprintfmt+0x3e0>
80412f18:	00078713          	mv	a4,a5
80412f1c:	00000697          	auipc	a3,0x0
80412f20:	62468693          	addi	a3,a3,1572 # 80413540 <etext+0x24>
80412f24:	00048613          	mv	a2,s1
80412f28:	00090593          	mv	a1,s2
80412f2c:	00098513          	mv	a0,s3
80412f30:	2cc000ef          	jal	ra,804131fc <printfmt>
80412f34:	df9ff06f          	j	80412d2c <vprintfmt+0x5c>
80412f38:	000b2783          	lw	a5,0(s6)
80412f3c:	004b0b13          	addi	s6,s6,4
80412f40:	28078e63          	beqz	a5,804131dc <vprintfmt+0x50c>
80412f44:	00178413          	addi	s0,a5,1
80412f48:	1fa05063          	blez	s10,80413128 <vprintfmt+0x458>
80412f4c:	02d00693          	li	a3,45
80412f50:	18d89663          	bne	a7,a3,804130dc <vprintfmt+0x40c>
80412f54:	0007c783          	lbu	a5,0(a5)
80412f58:	00078513          	mv	a0,a5
80412f5c:	04078263          	beqz	a5,80412fa0 <vprintfmt+0x2d0>
80412f60:	000cc663          	bltz	s9,80412f6c <vprintfmt+0x29c>
80412f64:	fffc8c93          	addi	s9,s9,-1
80412f68:	037c8a63          	beq	s9,s7,80412f9c <vprintfmt+0x2cc>
80412f6c:	00090613          	mv	a2,s2
80412f70:	00048593          	mv	a1,s1
80412f74:	1c0a0263          	beqz	s4,80413138 <vprintfmt+0x468>
80412f78:	fe078793          	addi	a5,a5,-32
80412f7c:	1afc7e63          	bgeu	s8,a5,80413138 <vprintfmt+0x468>
80412f80:	03f00513          	li	a0,63
80412f84:	000980e7          	jalr	s3
80412f88:	00140413          	addi	s0,s0,1
80412f8c:	fff44783          	lbu	a5,-1(s0)
80412f90:	fffd0d13          	addi	s10,s10,-1
80412f94:	00078513          	mv	a0,a5
80412f98:	fc0794e3          	bnez	a5,80412f60 <vprintfmt+0x290>
80412f9c:	d9a058e3          	blez	s10,80412d2c <vprintfmt+0x5c>
80412fa0:	fffd0d13          	addi	s10,s10,-1
80412fa4:	00090613          	mv	a2,s2
80412fa8:	00048593          	mv	a1,s1
80412fac:	02000513          	li	a0,32
80412fb0:	000980e7          	jalr	s3
80412fb4:	d60d0ce3          	beqz	s10,80412d2c <vprintfmt+0x5c>
80412fb8:	fffd0d13          	addi	s10,s10,-1
80412fbc:	00090613          	mv	a2,s2
80412fc0:	00048593          	mv	a1,s1
80412fc4:	02000513          	li	a0,32
80412fc8:	000980e7          	jalr	s3
80412fcc:	fc0d1ae3          	bnez	s10,80412fa0 <vprintfmt+0x2d0>
80412fd0:	d5dff06f          	j	80412d2c <vprintfmt+0x5c>
80412fd4:	00100793          	li	a5,1
80412fd8:	18b7ce63          	blt	a5,a1,80413174 <vprintfmt+0x4a4>
80412fdc:	000b2683          	lw	a3,0(s6)
80412fe0:	00000713          	li	a4,0
80412fe4:	004b0b13          	addi	s6,s6,4
80412fe8:	00800793          	li	a5,8
80412fec:	e59ff06f          	j	80412e44 <vprintfmt+0x174>
80412ff0:	03000513          	li	a0,48
80412ff4:	00090613          	mv	a2,s2
80412ff8:	00048593          	mv	a1,s1
80412ffc:	01112423          	sw	a7,8(sp)
80413000:	000980e7          	jalr	s3
80413004:	00090613          	mv	a2,s2
80413008:	00048593          	mv	a1,s1
8041300c:	07800513          	li	a0,120
80413010:	000980e7          	jalr	s3
80413014:	004b0b13          	addi	s6,s6,4
80413018:	ffcb2683          	lw	a3,-4(s6)
8041301c:	00000713          	li	a4,0
80413020:	01000793          	li	a5,16
80413024:	00812883          	lw	a7,8(sp)
80413028:	e1dff06f          	j	80412e44 <vprintfmt+0x174>
8041302c:	00144503          	lbu	a0,1(s0)
80413030:	00158593          	addi	a1,a1,1
80413034:	000d8413          	mv	s0,s11
80413038:	d4dff06f          	j	80412d84 <vprintfmt+0xb4>
8041303c:	00144503          	lbu	a0,1(s0)
80413040:	00100a13          	li	s4,1
80413044:	000d8413          	mv	s0,s11
80413048:	d3dff06f          	j	80412d84 <vprintfmt+0xb4>
8041304c:	00090613          	mv	a2,s2
80413050:	00048593          	mv	a1,s1
80413054:	02500513          	li	a0,37
80413058:	000980e7          	jalr	s3
8041305c:	cd1ff06f          	j	80412d2c <vprintfmt+0x5c>
80413060:	00100793          	li	a5,1
80413064:	14b7ce63          	blt	a5,a1,804131c0 <vprintfmt+0x4f0>
80413068:	000b2683          	lw	a3,0(s6)
8041306c:	00000713          	li	a4,0
80413070:	004b0b13          	addi	s6,s6,4
80413074:	00a00793          	li	a5,10
80413078:	dcdff06f          	j	80412e44 <vprintfmt+0x174>
8041307c:	00090613          	mv	a2,s2
80413080:	00048593          	mv	a1,s1
80413084:	02500513          	li	a0,37
80413088:	000980e7          	jalr	s3
8041308c:	fff44703          	lbu	a4,-1(s0)
80413090:	02500793          	li	a5,37
80413094:	00040d93          	mv	s11,s0
80413098:	c8f70ae3          	beq	a4,a5,80412d2c <vprintfmt+0x5c>
8041309c:	02500713          	li	a4,37
804130a0:	fffd8d93          	addi	s11,s11,-1
804130a4:	fffdc783          	lbu	a5,-1(s11)
804130a8:	fee79ce3          	bne	a5,a4,804130a0 <vprintfmt+0x3d0>
804130ac:	c81ff06f          	j	80412d2c <vprintfmt+0x5c>
804130b0:	00004697          	auipc	a3,0x4
804130b4:	da468693          	addi	a3,a3,-604 # 80416e54 <error_string+0x22c>
804130b8:	00048613          	mv	a2,s1
804130bc:	00090593          	mv	a1,s2
804130c0:	00098513          	mv	a0,s3
804130c4:	138000ef          	jal	ra,804131fc <printfmt>
804130c8:	c65ff06f          	j	80412d2c <vprintfmt+0x5c>
804130cc:	00004797          	auipc	a5,0x4
804130d0:	d8078793          	addi	a5,a5,-640 # 80416e4c <error_string+0x224>
804130d4:	00004417          	auipc	s0,0x4
804130d8:	d7940413          	addi	s0,s0,-647 # 80416e4d <error_string+0x225>
804130dc:	00078513          	mv	a0,a5
804130e0:	000c8593          	mv	a1,s9
804130e4:	01112623          	sw	a7,12(sp)
804130e8:	00f12423          	sw	a5,8(sp)
804130ec:	210000ef          	jal	ra,804132fc <strnlen>
804130f0:	40ad0d33          	sub	s10,s10,a0
804130f4:	00812783          	lw	a5,8(sp)
804130f8:	00c12883          	lw	a7,12(sp)
804130fc:	03a05663          	blez	s10,80413128 <vprintfmt+0x458>
80413100:	00088513          	mv	a0,a7
80413104:	00090613          	mv	a2,s2
80413108:	00048593          	mv	a1,s1
8041310c:	00f12623          	sw	a5,12(sp)
80413110:	01112423          	sw	a7,8(sp)
80413114:	fffd0d13          	addi	s10,s10,-1
80413118:	000980e7          	jalr	s3
8041311c:	00812883          	lw	a7,8(sp)
80413120:	00c12783          	lw	a5,12(sp)
80413124:	fc0d1ee3          	bnez	s10,80413100 <vprintfmt+0x430>
80413128:	0007c783          	lbu	a5,0(a5)
8041312c:	00078513          	mv	a0,a5
80413130:	e20798e3          	bnez	a5,80412f60 <vprintfmt+0x290>
80413134:	bf9ff06f          	j	80412d2c <vprintfmt+0x5c>
80413138:	000980e7          	jalr	s3
8041313c:	e4dff06f          	j	80412f88 <vprintfmt+0x2b8>
80413140:	007b0793          	addi	a5,s6,7
80413144:	ff87f793          	andi	a5,a5,-8
80413148:	00878b13          	addi	s6,a5,8
8041314c:	0007aa03          	lw	s4,0(a5)
80413150:	0047a403          	lw	s0,4(a5)
80413154:	d7dff06f          	j	80412ed0 <vprintfmt+0x200>
80413158:	007b0793          	addi	a5,s6,7
8041315c:	ff87f793          	andi	a5,a5,-8
80413160:	00878b13          	addi	s6,a5,8
80413164:	0007a683          	lw	a3,0(a5)
80413168:	0047a703          	lw	a4,4(a5)
8041316c:	01000793          	li	a5,16
80413170:	cd5ff06f          	j	80412e44 <vprintfmt+0x174>
80413174:	007b0793          	addi	a5,s6,7
80413178:	ff87f793          	andi	a5,a5,-8
8041317c:	00878b13          	addi	s6,a5,8
80413180:	0007a683          	lw	a3,0(a5)
80413184:	0047a703          	lw	a4,4(a5)
80413188:	00800793          	li	a5,8
8041318c:	cb9ff06f          	j	80412e44 <vprintfmt+0x174>
80413190:	00090613          	mv	a2,s2
80413194:	00048593          	mv	a1,s1
80413198:	02d00513          	li	a0,45
8041319c:	01112423          	sw	a7,8(sp)
804131a0:	000980e7          	jalr	s3
804131a4:	414006b3          	neg	a3,s4
804131a8:	00d037b3          	snez	a5,a3
804131ac:	40800733          	neg	a4,s0
804131b0:	40f70733          	sub	a4,a4,a5
804131b4:	00812883          	lw	a7,8(sp)
804131b8:	00a00793          	li	a5,10
804131bc:	c89ff06f          	j	80412e44 <vprintfmt+0x174>
804131c0:	007b0793          	addi	a5,s6,7
804131c4:	ff87f793          	andi	a5,a5,-8
804131c8:	00878b13          	addi	s6,a5,8
804131cc:	0007a683          	lw	a3,0(a5)
804131d0:	0047a703          	lw	a4,4(a5)
804131d4:	00a00793          	li	a5,10
804131d8:	c6dff06f          	j	80412e44 <vprintfmt+0x174>
804131dc:	01a05663          	blez	s10,804131e8 <vprintfmt+0x518>
804131e0:	02d00793          	li	a5,45
804131e4:	eef894e3          	bne	a7,a5,804130cc <vprintfmt+0x3fc>
804131e8:	00004417          	auipc	s0,0x4
804131ec:	c6540413          	addi	s0,s0,-923 # 80416e4d <error_string+0x225>
804131f0:	02800513          	li	a0,40
804131f4:	02800793          	li	a5,40
804131f8:	d69ff06f          	j	80412f60 <vprintfmt+0x290>

804131fc <printfmt>:
804131fc:	fd010113          	addi	sp,sp,-48
80413200:	02010313          	addi	t1,sp,32
80413204:	02e12023          	sw	a4,32(sp)
80413208:	00030713          	mv	a4,t1
8041320c:	00112e23          	sw	ra,28(sp)
80413210:	02f12223          	sw	a5,36(sp)
80413214:	03012423          	sw	a6,40(sp)
80413218:	03112623          	sw	a7,44(sp)
8041321c:	00612623          	sw	t1,12(sp)
80413220:	ab1ff0ef          	jal	ra,80412cd0 <vprintfmt>
80413224:	01c12083          	lw	ra,28(sp)
80413228:	03010113          	addi	sp,sp,48
8041322c:	00008067          	ret

80413230 <vsnprintf>:
80413230:	fff58593          	addi	a1,a1,-1
80413234:	fe010113          	addi	sp,sp,-32
80413238:	00b505b3          	add	a1,a0,a1
8041323c:	00112e23          	sw	ra,28(sp)
80413240:	00a12223          	sw	a0,4(sp)
80413244:	00b12423          	sw	a1,8(sp)
80413248:	00012623          	sw	zero,12(sp)
8041324c:	04050063          	beqz	a0,8041328c <vsnprintf+0x5c>
80413250:	02a5ee63          	bltu	a1,a0,8041328c <vsnprintf+0x5c>
80413254:	ffff75b7          	lui	a1,0xffff7
80413258:	00068713          	mv	a4,a3
8041325c:	00000517          	auipc	a0,0x0
80413260:	a4c50513          	addi	a0,a0,-1460 # 80412ca8 <sprintputch>
80413264:	00060693          	mv	a3,a2
80413268:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a219>
8041326c:	00410613          	addi	a2,sp,4
80413270:	a61ff0ef          	jal	ra,80412cd0 <vprintfmt>
80413274:	00412783          	lw	a5,4(sp)
80413278:	00078023          	sb	zero,0(a5)
8041327c:	00c12503          	lw	a0,12(sp)
80413280:	01c12083          	lw	ra,28(sp)
80413284:	02010113          	addi	sp,sp,32
80413288:	00008067          	ret
8041328c:	ffd00513          	li	a0,-3
80413290:	ff1ff06f          	j	80413280 <vsnprintf+0x50>

80413294 <snprintf>:
80413294:	fc010113          	addi	sp,sp,-64
80413298:	02c10313          	addi	t1,sp,44
8041329c:	02d12623          	sw	a3,44(sp)
804132a0:	00030693          	mv	a3,t1
804132a4:	00112e23          	sw	ra,28(sp)
804132a8:	02e12823          	sw	a4,48(sp)
804132ac:	02f12a23          	sw	a5,52(sp)
804132b0:	03012c23          	sw	a6,56(sp)
804132b4:	03112e23          	sw	a7,60(sp)
804132b8:	00612623          	sw	t1,12(sp)
804132bc:	f75ff0ef          	jal	ra,80413230 <vsnprintf>
804132c0:	01c12083          	lw	ra,28(sp)
804132c4:	04010113          	addi	sp,sp,64
804132c8:	00008067          	ret

804132cc <strlen>:
804132cc:	00054783          	lbu	a5,0(a0)
804132d0:	02078063          	beqz	a5,804132f0 <strlen+0x24>
804132d4:	00000793          	li	a5,0
804132d8:	00178793          	addi	a5,a5,1
804132dc:	00f50733          	add	a4,a0,a5
804132e0:	00074703          	lbu	a4,0(a4)
804132e4:	fe071ae3          	bnez	a4,804132d8 <strlen+0xc>
804132e8:	00078513          	mv	a0,a5
804132ec:	00008067          	ret
804132f0:	00000793          	li	a5,0
804132f4:	00078513          	mv	a0,a5
804132f8:	00008067          	ret

804132fc <strnlen>:
804132fc:	02058863          	beqz	a1,8041332c <strnlen+0x30>
80413300:	00054783          	lbu	a5,0(a0)
80413304:	02078463          	beqz	a5,8041332c <strnlen+0x30>
80413308:	00000793          	li	a5,0
8041330c:	00c0006f          	j	80413318 <strnlen+0x1c>
80413310:	00074703          	lbu	a4,0(a4)
80413314:	00070863          	beqz	a4,80413324 <strnlen+0x28>
80413318:	00178793          	addi	a5,a5,1
8041331c:	00f50733          	add	a4,a0,a5
80413320:	fef598e3          	bne	a1,a5,80413310 <strnlen+0x14>
80413324:	00078513          	mv	a0,a5
80413328:	00008067          	ret
8041332c:	00000793          	li	a5,0
80413330:	00078513          	mv	a0,a5
80413334:	00008067          	ret

80413338 <strcpy>:
80413338:	00050793          	mv	a5,a0
8041333c:	00158593          	addi	a1,a1,1
80413340:	fff5c703          	lbu	a4,-1(a1)
80413344:	00178793          	addi	a5,a5,1
80413348:	fee78fa3          	sb	a4,-1(a5)
8041334c:	fe0718e3          	bnez	a4,8041333c <strcpy+0x4>
80413350:	00008067          	ret

80413354 <strcmp>:
80413354:	00054783          	lbu	a5,0(a0)
80413358:	0005c703          	lbu	a4,0(a1)
8041335c:	00078e63          	beqz	a5,80413378 <strcmp+0x24>
80413360:	00e79e63          	bne	a5,a4,8041337c <strcmp+0x28>
80413364:	00150513          	addi	a0,a0,1
80413368:	00054783          	lbu	a5,0(a0)
8041336c:	00158593          	addi	a1,a1,1
80413370:	0005c703          	lbu	a4,0(a1)
80413374:	fe0796e3          	bnez	a5,80413360 <strcmp+0xc>
80413378:	00000793          	li	a5,0
8041337c:	40e78533          	sub	a0,a5,a4
80413380:	00008067          	ret

80413384 <strchr>:
80413384:	00054783          	lbu	a5,0(a0)
80413388:	00078e63          	beqz	a5,804133a4 <strchr+0x20>
8041338c:	00b79663          	bne	a5,a1,80413398 <strchr+0x14>
80413390:	01c0006f          	j	804133ac <strchr+0x28>
80413394:	00b78a63          	beq	a5,a1,804133a8 <strchr+0x24>
80413398:	00150513          	addi	a0,a0,1
8041339c:	00054783          	lbu	a5,0(a0)
804133a0:	fe079ae3          	bnez	a5,80413394 <strchr+0x10>
804133a4:	00000513          	li	a0,0
804133a8:	00008067          	ret
804133ac:	00008067          	ret

804133b0 <memset>:
804133b0:	00060c63          	beqz	a2,804133c8 <memset+0x18>
804133b4:	00c50633          	add	a2,a0,a2
804133b8:	00050793          	mv	a5,a0
804133bc:	00178793          	addi	a5,a5,1
804133c0:	feb78fa3          	sb	a1,-1(a5)
804133c4:	fec79ce3          	bne	a5,a2,804133bc <memset+0xc>
804133c8:	00008067          	ret

804133cc <memmove>:
804133cc:	02a5f663          	bgeu	a1,a0,804133f8 <memmove+0x2c>
804133d0:	00c587b3          	add	a5,a1,a2
804133d4:	02f57263          	bgeu	a0,a5,804133f8 <memmove+0x2c>
804133d8:	00c50733          	add	a4,a0,a2
804133dc:	02060e63          	beqz	a2,80413418 <memmove+0x4c>
804133e0:	fff78793          	addi	a5,a5,-1
804133e4:	0007c683          	lbu	a3,0(a5)
804133e8:	fff70713          	addi	a4,a4,-1
804133ec:	00d70023          	sb	a3,0(a4)
804133f0:	fef598e3          	bne	a1,a5,804133e0 <memmove+0x14>
804133f4:	00008067          	ret
804133f8:	00c586b3          	add	a3,a1,a2
804133fc:	00050793          	mv	a5,a0
80413400:	00060e63          	beqz	a2,8041341c <memmove+0x50>
80413404:	00158593          	addi	a1,a1,1
80413408:	fff5c703          	lbu	a4,-1(a1)
8041340c:	00178793          	addi	a5,a5,1
80413410:	fee78fa3          	sb	a4,-1(a5)
80413414:	fed598e3          	bne	a1,a3,80413404 <memmove+0x38>
80413418:	00008067          	ret
8041341c:	00008067          	ret

80413420 <memcpy>:
80413420:	02060063          	beqz	a2,80413440 <memcpy+0x20>
80413424:	00c58633          	add	a2,a1,a2
80413428:	00050793          	mv	a5,a0
8041342c:	00158593          	addi	a1,a1,1
80413430:	fff5c703          	lbu	a4,-1(a1)
80413434:	00178793          	addi	a5,a5,1
80413438:	fee78fa3          	sb	a4,-1(a5)
8041343c:	fec598e3          	bne	a1,a2,8041342c <memcpy+0xc>
80413440:	00008067          	ret

80413444 <__mulsi3>:
80413444:	00050613          	mv	a2,a0
80413448:	00000513          	li	a0,0
8041344c:	0015f693          	andi	a3,a1,1
80413450:	00068463          	beqz	a3,80413458 <__mulsi3+0x14>
80413454:	00c50533          	add	a0,a0,a2
80413458:	0015d593          	srli	a1,a1,0x1
8041345c:	00161613          	slli	a2,a2,0x1
80413460:	fe0596e3          	bnez	a1,8041344c <__mulsi3+0x8>
80413464:	00008067          	ret

80413468 <__divsi3>:
80413468:	06054063          	bltz	a0,804134c8 <__umodsi3+0x10>
8041346c:	0605c663          	bltz	a1,804134d8 <__umodsi3+0x20>

80413470 <__udivsi3>:
80413470:	00058613          	mv	a2,a1
80413474:	00050593          	mv	a1,a0
80413478:	fff00513          	li	a0,-1
8041347c:	02060c63          	beqz	a2,804134b4 <__udivsi3+0x44>
80413480:	00100693          	li	a3,1
80413484:	00b67a63          	bgeu	a2,a1,80413498 <__udivsi3+0x28>
80413488:	00c05863          	blez	a2,80413498 <__udivsi3+0x28>
8041348c:	00161613          	slli	a2,a2,0x1
80413490:	00169693          	slli	a3,a3,0x1
80413494:	feb66ae3          	bltu	a2,a1,80413488 <__udivsi3+0x18>
80413498:	00000513          	li	a0,0
8041349c:	00c5e663          	bltu	a1,a2,804134a8 <__udivsi3+0x38>
804134a0:	40c585b3          	sub	a1,a1,a2
804134a4:	00d56533          	or	a0,a0,a3
804134a8:	0016d693          	srli	a3,a3,0x1
804134ac:	00165613          	srli	a2,a2,0x1
804134b0:	fe0696e3          	bnez	a3,8041349c <__udivsi3+0x2c>
804134b4:	00008067          	ret

804134b8 <__umodsi3>:
804134b8:	00008293          	mv	t0,ra
804134bc:	fb5ff0ef          	jal	ra,80413470 <__udivsi3>
804134c0:	00058513          	mv	a0,a1
804134c4:	00028067          	jr	t0
804134c8:	40a00533          	neg	a0,a0
804134cc:	0005d863          	bgez	a1,804134dc <__umodsi3+0x24>
804134d0:	40b005b3          	neg	a1,a1
804134d4:	f9dff06f          	j	80413470 <__udivsi3>
804134d8:	40b005b3          	neg	a1,a1
804134dc:	00008293          	mv	t0,ra
804134e0:	f91ff0ef          	jal	ra,80413470 <__udivsi3>
804134e4:	40a00533          	neg	a0,a0
804134e8:	00028067          	jr	t0

804134ec <__modsi3>:
804134ec:	00008293          	mv	t0,ra
804134f0:	0005ca63          	bltz	a1,80413504 <__modsi3+0x18>
804134f4:	00054c63          	bltz	a0,8041350c <__modsi3+0x20>
804134f8:	f79ff0ef          	jal	ra,80413470 <__udivsi3>
804134fc:	00058513          	mv	a0,a1
80413500:	00028067          	jr	t0
80413504:	40b005b3          	neg	a1,a1
80413508:	fe0558e3          	bgez	a0,804134f8 <__modsi3+0xc>
8041350c:	40a00533          	neg	a0,a0
80413510:	f61ff0ef          	jal	ra,80413470 <__udivsi3>
80413514:	40b00533          	neg	a0,a1
80413518:	00028067          	jr	t0
