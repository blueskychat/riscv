
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
8040002c:	495120ef          	jal	ra,80412cc0 <memset>
80400030:	081000ef          	jal	ra,804008b0 <cons_init>
80400034:	00013597          	auipc	a1,0x13
80400038:	df858593          	addi	a1,a1,-520 # 80412e2c <etext>
8040003c:	00013517          	auipc	a0,0x13
80400040:	e0c50513          	addi	a0,a0,-500 # 80412e48 <etext+0x1c>
80400044:	1b8000ef          	jal	ra,804001fc <cprintf>
80400048:	294000ef          	jal	ra,804002dc <print_kerninfo>
8040004c:	3f5030ef          	jal	ra,80403c40 <pmm_init>
80400050:	471000ef          	jal	ra,80400cc0 <pic_init>
80400054:	655000ef          	jal	ra,80400ea8 <idt_init>
80400058:	3c1040ef          	jal	ra,80404c18 <vmm_init>
8040005c:	2b10c0ef          	jal	ra,8040cb0c <sched_init>
80400060:	4a5080ef          	jal	ra,80408d04 <proc_init>
80400064:	1fd000ef          	jal	ra,80400a60 <ide_init>
80400068:	711030ef          	jal	ra,80403f78 <swap_init>
8040006c:	318060ef          	jal	ra,80406384 <fs_init>
80400070:	6e0000ef          	jal	ra,80400750 <clock_init>
80400074:	43d000ef          	jal	ra,80400cb0 <intr_enable>
80400078:	671080ef          	jal	ra,80408ee8 <cpu_idle>

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
804000b0:	da450513          	addi	a0,a0,-604 # 80412e50 <etext+0x24>
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
804001a0:	728000ef          	jal	ra,804008c8 <cons_putc>
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
804001e8:	3f8120ef          	jal	ra,804125e0 <vprintfmt>
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
80400248:	398120ef          	jal	ra,804125e0 <vprintfmt>
8040024c:	01c12083          	lw	ra,28(sp)
80400250:	00c12503          	lw	a0,12(sp)
80400254:	04010113          	addi	sp,sp,64
80400258:	00008067          	ret

8040025c <cputchar>:
8040025c:	66c0006f          	j	804008c8 <cons_putc>

80400260 <getchar>:
80400260:	ff010113          	addi	sp,sp,-16
80400264:	00112623          	sw	ra,12(sp)
80400268:	6dc000ef          	jal	ra,80400944 <cons_getc>
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
80400294:	149120ef          	jal	ra,80412bdc <strlen>
80400298:	00050413          	mv	s0,a0
8040029c:	00150513          	addi	a0,a0,1
804002a0:	7ec020ef          	jal	ra,80402a8c <kmalloc>
804002a4:	00050493          	mv	s1,a0
804002a8:	00050c63          	beqz	a0,804002c0 <strdup+0x44>
804002ac:	00040613          	mv	a2,s0
804002b0:	00090593          	mv	a1,s2
804002b4:	00848433          	add	s0,s1,s0
804002b8:	279120ef          	jal	ra,80412d30 <memcpy>
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
804002e4:	b9c50513          	addi	a0,a0,-1124 # 80412e7c <etext+0x50>
804002e8:	00112623          	sw	ra,12(sp)
804002ec:	f11ff0ef          	jal	ra,804001fc <cprintf>
804002f0:	00000597          	auipc	a1,0x0
804002f4:	d1c58593          	addi	a1,a1,-740 # 8040000c <kern_init>
804002f8:	00013517          	auipc	a0,0x13
804002fc:	ba050513          	addi	a0,a0,-1120 # 80412e98 <etext+0x6c>
80400300:	efdff0ef          	jal	ra,804001fc <cprintf>
80400304:	00013597          	auipc	a1,0x13
80400308:	b2858593          	addi	a1,a1,-1240 # 80412e2c <etext>
8040030c:	00013517          	auipc	a0,0x13
80400310:	ba850513          	addi	a0,a0,-1112 # 80412eb4 <etext+0x88>
80400314:	ee9ff0ef          	jal	ra,804001fc <cprintf>
80400318:	00099597          	auipc	a1,0x99
8040031c:	d3458593          	addi	a1,a1,-716 # 8049904c <edata>
80400320:	00013517          	auipc	a0,0x13
80400324:	bb050513          	addi	a0,a0,-1104 # 80412ed0 <etext+0xa4>
80400328:	ed5ff0ef          	jal	ra,804001fc <cprintf>
8040032c:	0009c597          	auipc	a1,0x9c
80400330:	59058593          	addi	a1,a1,1424 # 8049c8bc <end>
80400334:	00013517          	auipc	a0,0x13
80400338:	bb850513          	addi	a0,a0,-1096 # 80412eec <etext+0xc0>
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
8040036c:	ba050513          	addi	a0,a0,-1120 # 80412f08 <etext+0xdc>
80400370:	01010113          	addi	sp,sp,16
80400374:	e89ff06f          	j	804001fc <cprintf>

80400378 <print_stackframe>:
80400378:	ff010113          	addi	sp,sp,-16
8040037c:	00013617          	auipc	a2,0x13
80400380:	ad860613          	addi	a2,a2,-1320 # 80412e54 <etext+0x28>
80400384:	05b00593          	li	a1,91
80400388:	00013517          	auipc	a0,0x13
8040038c:	ae050513          	addi	a0,a0,-1312 # 80412e68 <etext+0x3c>
80400390:	00112623          	sw	ra,12(sp)
80400394:	290000ef          	jal	ra,80400624 <__panic>

80400398 <mon_help>:
80400398:	ff010113          	addi	sp,sp,-16
8040039c:	00013617          	auipc	a2,0x13
804003a0:	c5060613          	addi	a2,a2,-944 # 80412fec <commands+0xb8>
804003a4:	00013597          	auipc	a1,0x13
804003a8:	c6858593          	addi	a1,a1,-920 # 8041300c <commands+0xd8>
804003ac:	00013517          	auipc	a0,0x13
804003b0:	c6850513          	addi	a0,a0,-920 # 80413014 <commands+0xe0>
804003b4:	00112623          	sw	ra,12(sp)
804003b8:	e45ff0ef          	jal	ra,804001fc <cprintf>
804003bc:	00013617          	auipc	a2,0x13
804003c0:	c6460613          	addi	a2,a2,-924 # 80413020 <commands+0xec>
804003c4:	00013597          	auipc	a1,0x13
804003c8:	c8458593          	addi	a1,a1,-892 # 80413048 <commands+0x114>
804003cc:	00013517          	auipc	a0,0x13
804003d0:	c4850513          	addi	a0,a0,-952 # 80413014 <commands+0xe0>
804003d4:	e29ff0ef          	jal	ra,804001fc <cprintf>
804003d8:	00013617          	auipc	a2,0x13
804003dc:	c7c60613          	addi	a2,a2,-900 # 80413054 <commands+0x120>
804003e0:	00013597          	auipc	a1,0x13
804003e4:	c9458593          	addi	a1,a1,-876 # 80413074 <commands+0x140>
804003e8:	00013517          	auipc	a0,0x13
804003ec:	c2c50513          	addi	a0,a0,-980 # 80413014 <commands+0xe0>
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
8040044c:	b1050513          	addi	a0,a0,-1264 # 80412f58 <commands+0x24>
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
80400484:	b0050513          	addi	a0,a0,-1280 # 80412f80 <commands+0x4c>
80400488:	d75ff0ef          	jal	ra,804001fc <cprintf>
8040048c:	000c0663          	beqz	s8,80400498 <kmonitor+0x5c>
80400490:	000c0513          	mv	a0,s8
80400494:	455000ef          	jal	ra,804010e8 <print_trapframe>
80400498:	00000513          	li	a0,0
8040049c:	00000593          	li	a1,0
804004a0:	00000613          	li	a2,0
804004a4:	00800893          	li	a7,8
804004a8:	00000073          	ecall
804004ac:	00013c97          	auipc	s9,0x13
804004b0:	a88c8c93          	addi	s9,s9,-1400 # 80412f34 <commands>
804004b4:	00013997          	auipc	s3,0x13
804004b8:	af498993          	addi	s3,s3,-1292 # 80412fa8 <commands+0x74>
804004bc:	00013917          	auipc	s2,0x13
804004c0:	af090913          	addi	s2,s2,-1296 # 80412fac <commands+0x78>
804004c4:	00f00a13          	li	s4,15
804004c8:	00013b17          	auipc	s6,0x13
804004cc:	aecb0b13          	addi	s6,s6,-1300 # 80412fb4 <commands+0x80>
804004d0:	00013a97          	auipc	s5,0x13
804004d4:	b3ca8a93          	addi	s5,s5,-1220 # 8041300c <commands+0xd8>
804004d8:	00300b93          	li	s7,3
804004dc:	00098513          	mv	a0,s3
804004e0:	b9dff0ef          	jal	ra,8040007c <readline>
804004e4:	00050413          	mv	s0,a0
804004e8:	fe050ae3          	beqz	a0,804004dc <kmonitor+0xa0>
804004ec:	00054583          	lbu	a1,0(a0)
804004f0:	00000493          	li	s1,0
804004f4:	02058063          	beqz	a1,80400514 <kmonitor+0xd8>
804004f8:	00090513          	mv	a0,s2
804004fc:	798120ef          	jal	ra,80412c94 <strchr>
80400500:	0a050a63          	beqz	a0,804005b4 <kmonitor+0x178>
80400504:	00144583          	lbu	a1,1(s0)
80400508:	00040023          	sb	zero,0(s0)
8040050c:	00140413          	addi	s0,s0,1
80400510:	fe0594e3          	bnez	a1,804004f8 <kmonitor+0xbc>
80400514:	fc0484e3          	beqz	s1,804004dc <kmonitor+0xa0>
80400518:	00012583          	lw	a1,0(sp)
8040051c:	00013d17          	auipc	s10,0x13
80400520:	a18d0d13          	addi	s10,s10,-1512 # 80412f34 <commands>
80400524:	000a8513          	mv	a0,s5
80400528:	00000413          	li	s0,0
8040052c:	00cd0d13          	addi	s10,s10,12
80400530:	734120ef          	jal	ra,80412c64 <strcmp>
80400534:	02050063          	beqz	a0,80400554 <kmonitor+0x118>
80400538:	00140413          	addi	s0,s0,1
8040053c:	0d740a63          	beq	s0,s7,80400610 <kmonitor+0x1d4>
80400540:	000d2503          	lw	a0,0(s10)
80400544:	00012583          	lw	a1,0(sp)
80400548:	00cd0d13          	addi	s10,s10,12
8040054c:	718120ef          	jal	ra,80412c64 <strcmp>
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
804005f0:	6a4120ef          	jal	ra,80412c94 <strchr>
804005f4:	fe0506e3          	beqz	a0,804005e0 <kmonitor+0x1a4>
804005f8:	00044583          	lbu	a1,0(s0)
804005fc:	ef9ff06f          	j	804004f4 <kmonitor+0xb8>
80400600:	01000593          	li	a1,16
80400604:	000b0513          	mv	a0,s6
80400608:	bf5ff0ef          	jal	ra,804001fc <cprintf>
8040060c:	fb5ff06f          	j	804005c0 <kmonitor+0x184>
80400610:	00012583          	lw	a1,0(sp)
80400614:	00013517          	auipc	a0,0x13
80400618:	9c050513          	addi	a0,a0,-1600 # 80412fd4 <commands+0xa0>
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
80400674:	a1050513          	addi	a0,a0,-1520 # 80413080 <commands+0x14c>
80400678:	00f12623          	sw	a5,12(sp)
8040067c:	b81ff0ef          	jal	ra,804001fc <cprintf>
80400680:	00c12583          	lw	a1,12(sp)
80400684:	00040513          	mv	a0,s0
80400688:	b39ff0ef          	jal	ra,804001c0 <vcprintf>
8040068c:	00013517          	auipc	a0,0x13
80400690:	95c50513          	addi	a0,a0,-1700 # 80412fe8 <commands+0xb4>
80400694:	b69ff0ef          	jal	ra,804001fc <cprintf>
80400698:	620000ef          	jal	ra,80400cb8 <intr_disable>
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
804006c8:	9d850513          	addi	a0,a0,-1576 # 8041309c <commands+0x168>
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
804006f4:	00013517          	auipc	a0,0x13
804006f8:	8f450513          	addi	a0,a0,-1804 # 80412fe8 <commands+0xb4>
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
8040078c:	00013517          	auipc	a0,0x13
80400790:	93050513          	addi	a0,a0,-1744 # 804130bc <commands+0x188>
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
804007c4:	ff010113          	addi	sp,sp,-16
804007c8:	00112623          	sw	ra,12(sp)
804007cc:	00812423          	sw	s0,8(sp)
804007d0:	00000513          	li	a0,0
804007d4:	00000593          	li	a1,0
804007d8:	00000613          	li	a2,0
804007dc:	00200893          	li	a7,2
804007e0:	00000073          	ecall
804007e4:	04054863          	bltz	a0,80400834 <serial_proc_data+0x70>
804007e8:	00050413          	mv	s0,a0
804007ec:	00051c63          	bnez	a0,80400804 <serial_proc_data+0x40>
804007f0:	00040513          	mv	a0,s0
804007f4:	00c12083          	lw	ra,12(sp)
804007f8:	00812403          	lw	s0,8(sp)
804007fc:	01010113          	addi	sp,sp,16
80400800:	00008067          	ret
80400804:	00050593          	mv	a1,a0
80400808:	00013517          	auipc	a0,0x13
8040080c:	8f850513          	addi	a0,a0,-1800 # 80413100 <commands+0x1cc>
80400810:	9edff0ef          	jal	ra,804001fc <cprintf>
80400814:	07f00793          	li	a5,127
80400818:	fcf41ce3          	bne	s0,a5,804007f0 <serial_proc_data+0x2c>
8040081c:	00800413          	li	s0,8
80400820:	00040513          	mv	a0,s0
80400824:	00c12083          	lw	ra,12(sp)
80400828:	00812403          	lw	s0,8(sp)
8040082c:	01010113          	addi	sp,sp,16
80400830:	00008067          	ret
80400834:	fff00413          	li	s0,-1
80400838:	fb9ff06f          	j	804007f0 <serial_proc_data+0x2c>

8040083c <serial_intr>:
8040083c:	ff010113          	addi	sp,sp,-16
80400840:	00812423          	sw	s0,8(sp)
80400844:	00912223          	sw	s1,4(sp)
80400848:	01212023          	sw	s2,0(sp)
8040084c:	00112623          	sw	ra,12(sp)
80400850:	fff00413          	li	s0,-1
80400854:	00099497          	auipc	s1,0x99
80400858:	bfc48493          	addi	s1,s1,-1028 # 80499450 <cons>
8040085c:	20000913          	li	s2,512
80400860:	0080006f          	j	80400868 <serial_intr+0x2c>
80400864:	02051263          	bnez	a0,80400888 <serial_intr+0x4c>
80400868:	f5dff0ef          	jal	ra,804007c4 <serial_proc_data>
8040086c:	fe851ce3          	bne	a0,s0,80400864 <serial_intr+0x28>
80400870:	00c12083          	lw	ra,12(sp)
80400874:	00812403          	lw	s0,8(sp)
80400878:	00412483          	lw	s1,4(sp)
8040087c:	00012903          	lw	s2,0(sp)
80400880:	01010113          	addi	sp,sp,16
80400884:	00008067          	ret
80400888:	2044a783          	lw	a5,516(s1)
8040088c:	00178713          	addi	a4,a5,1
80400890:	00f487b3          	add	a5,s1,a5
80400894:	00099697          	auipc	a3,0x99
80400898:	dce6a023          	sw	a4,-576(a3) # 80499654 <cons+0x204>
8040089c:	00a78023          	sb	a0,0(a5)
804008a0:	fd2714e3          	bne	a4,s2,80400868 <serial_intr+0x2c>
804008a4:	00099797          	auipc	a5,0x99
804008a8:	da07a823          	sw	zero,-592(a5) # 80499654 <cons+0x204>
804008ac:	fbdff06f          	j	80400868 <serial_intr+0x2c>

804008b0 <cons_init>:
804008b0:	00000513          	li	a0,0
804008b4:	00000593          	li	a1,0
804008b8:	00000613          	li	a2,0
804008bc:	00200893          	li	a7,2
804008c0:	00000073          	ecall
804008c4:	00008067          	ret

804008c8 <cons_putc>:
804008c8:	fe010113          	addi	sp,sp,-32
804008cc:	00112e23          	sw	ra,28(sp)
804008d0:	00812c23          	sw	s0,24(sp)
804008d4:	100027f3          	csrr	a5,sstatus
804008d8:	0027f793          	andi	a5,a5,2
804008dc:	00000413          	li	s0,0
804008e0:	04079863          	bnez	a5,80400930 <cons_putc+0x68>
804008e4:	00800793          	li	a5,8
804008e8:	02f50663          	beq	a0,a5,80400914 <cons_putc+0x4c>
804008ec:	00000593          	li	a1,0
804008f0:	00000613          	li	a2,0
804008f4:	00100893          	li	a7,1
804008f8:	00000073          	ecall
804008fc:	f41ff0ef          	jal	ra,8040083c <serial_intr>
80400900:	02041063          	bnez	s0,80400920 <cons_putc+0x58>
80400904:	01c12083          	lw	ra,28(sp)
80400908:	01812403          	lw	s0,24(sp)
8040090c:	02010113          	addi	sp,sp,32
80400910:	00008067          	ret
80400914:	e89ff0ef          	jal	ra,8040079c <serial_putc.part.0>
80400918:	f25ff0ef          	jal	ra,8040083c <serial_intr>
8040091c:	fe0404e3          	beqz	s0,80400904 <cons_putc+0x3c>
80400920:	01812403          	lw	s0,24(sp)
80400924:	01c12083          	lw	ra,28(sp)
80400928:	02010113          	addi	sp,sp,32
8040092c:	3840006f          	j	80400cb0 <intr_enable>
80400930:	00a12623          	sw	a0,12(sp)
80400934:	384000ef          	jal	ra,80400cb8 <intr_disable>
80400938:	00100413          	li	s0,1
8040093c:	00c12503          	lw	a0,12(sp)
80400940:	fa5ff06f          	j	804008e4 <cons_putc+0x1c>

80400944 <cons_getc>:
80400944:	ff010113          	addi	sp,sp,-16
80400948:	00112623          	sw	ra,12(sp)
8040094c:	00812423          	sw	s0,8(sp)
80400950:	100027f3          	csrr	a5,sstatus
80400954:	0027f793          	andi	a5,a5,2
80400958:	06079063          	bnez	a5,804009b8 <cons_getc+0x74>
8040095c:	ee1ff0ef          	jal	ra,8040083c <serial_intr>
80400960:	00099797          	auipc	a5,0x99
80400964:	af078793          	addi	a5,a5,-1296 # 80499450 <cons>
80400968:	2007a703          	lw	a4,512(a5)
8040096c:	2047a683          	lw	a3,516(a5)
80400970:	00000413          	li	s0,0
80400974:	02d70863          	beq	a4,a3,804009a4 <cons_getc+0x60>
80400978:	00170613          	addi	a2,a4,1
8040097c:	00e787b3          	add	a5,a5,a4
80400980:	00099717          	auipc	a4,0x99
80400984:	ccc72823          	sw	a2,-816(a4) # 80499650 <cons+0x200>
80400988:	20000713          	li	a4,512
8040098c:	0007c403          	lbu	s0,0(a5)
80400990:	08e60463          	beq	a2,a4,80400a18 <cons_getc+0xd4>
80400994:	00040593          	mv	a1,s0
80400998:	00012517          	auipc	a0,0x12
8040099c:	74050513          	addi	a0,a0,1856 # 804130d8 <commands+0x1a4>
804009a0:	85dff0ef          	jal	ra,804001fc <cprintf>
804009a4:	00040513          	mv	a0,s0
804009a8:	00c12083          	lw	ra,12(sp)
804009ac:	00812403          	lw	s0,8(sp)
804009b0:	01010113          	addi	sp,sp,16
804009b4:	00008067          	ret
804009b8:	300000ef          	jal	ra,80400cb8 <intr_disable>
804009bc:	e81ff0ef          	jal	ra,8040083c <serial_intr>
804009c0:	00099797          	auipc	a5,0x99
804009c4:	a9078793          	addi	a5,a5,-1392 # 80499450 <cons>
804009c8:	2007a703          	lw	a4,512(a5)
804009cc:	2047a683          	lw	a3,516(a5)
804009d0:	06d70463          	beq	a4,a3,80400a38 <cons_getc+0xf4>
804009d4:	00170613          	addi	a2,a4,1
804009d8:	00e787b3          	add	a5,a5,a4
804009dc:	00099717          	auipc	a4,0x99
804009e0:	c6c72a23          	sw	a2,-908(a4) # 80499650 <cons+0x200>
804009e4:	20000713          	li	a4,512
804009e8:	0007c403          	lbu	s0,0(a5)
804009ec:	04e60a63          	beq	a2,a4,80400a40 <cons_getc+0xfc>
804009f0:	00040593          	mv	a1,s0
804009f4:	00012517          	auipc	a0,0x12
804009f8:	6e450513          	addi	a0,a0,1764 # 804130d8 <commands+0x1a4>
804009fc:	801ff0ef          	jal	ra,804001fc <cprintf>
80400a00:	2b0000ef          	jal	ra,80400cb0 <intr_enable>
80400a04:	00040513          	mv	a0,s0
80400a08:	00c12083          	lw	ra,12(sp)
80400a0c:	00812403          	lw	s0,8(sp)
80400a10:	01010113          	addi	sp,sp,16
80400a14:	00008067          	ret
80400a18:	00000613          	li	a2,0
80400a1c:	00040593          	mv	a1,s0
80400a20:	00012517          	auipc	a0,0x12
80400a24:	6b850513          	addi	a0,a0,1720 # 804130d8 <commands+0x1a4>
80400a28:	00099797          	auipc	a5,0x99
80400a2c:	c207a423          	sw	zero,-984(a5) # 80499650 <cons+0x200>
80400a30:	fccff0ef          	jal	ra,804001fc <cprintf>
80400a34:	f71ff06f          	j	804009a4 <cons_getc+0x60>
80400a38:	00000413          	li	s0,0
80400a3c:	fc5ff06f          	j	80400a00 <cons_getc+0xbc>
80400a40:	00000613          	li	a2,0
80400a44:	00040593          	mv	a1,s0
80400a48:	00012517          	auipc	a0,0x12
80400a4c:	69050513          	addi	a0,a0,1680 # 804130d8 <commands+0x1a4>
80400a50:	00099797          	auipc	a5,0x99
80400a54:	c007a023          	sw	zero,-1024(a5) # 80499650 <cons+0x200>
80400a58:	fa4ff0ef          	jal	ra,804001fc <cprintf>
80400a5c:	fa5ff06f          	j	80400a00 <cons_getc+0xbc>

80400a60 <ide_init>:
80400a60:	ff010113          	addi	sp,sp,-16
80400a64:	00099597          	auipc	a1,0x99
80400a68:	c3058593          	addi	a1,a1,-976 # 80499694 <ide_devices+0x3c>
80400a6c:	00100513          	li	a0,1
80400a70:	00812423          	sw	s0,8(sp)
80400a74:	00099797          	auipc	a5,0x99
80400a78:	be07a223          	sw	zero,-1052(a5) # 80499658 <ide_devices>
80400a7c:	00099797          	auipc	a5,0x99
80400a80:	c007ac23          	sw	zero,-1000(a5) # 80499694 <ide_devices+0x3c>
80400a84:	00099797          	auipc	a5,0x99
80400a88:	c407a623          	sw	zero,-948(a5) # 804996d0 <ide_devices+0x78>
80400a8c:	00099797          	auipc	a5,0x99
80400a90:	c807a023          	sw	zero,-896(a5) # 8049970c <ide_devices+0xb4>
80400a94:	00112623          	sw	ra,12(sp)
80400a98:	00099417          	auipc	s0,0x99
80400a9c:	bc040413          	addi	s0,s0,-1088 # 80499658 <ide_devices>
80400aa0:	2fc000ef          	jal	ra,80400d9c <ramdisk_init>
80400aa4:	03c42783          	lw	a5,60(s0)
80400aa8:	02078663          	beqz	a5,80400ad4 <ide_init+0x74>
80400aac:	00099597          	auipc	a1,0x99
80400ab0:	c2458593          	addi	a1,a1,-988 # 804996d0 <ide_devices+0x78>
80400ab4:	00200513          	li	a0,2
80400ab8:	2e4000ef          	jal	ra,80400d9c <ramdisk_init>
80400abc:	07842783          	lw	a5,120(s0)
80400ac0:	02078a63          	beqz	a5,80400af4 <ide_init+0x94>
80400ac4:	00c12083          	lw	ra,12(sp)
80400ac8:	00812403          	lw	s0,8(sp)
80400acc:	01010113          	addi	sp,sp,16
80400ad0:	00008067          	ret
80400ad4:	00012697          	auipc	a3,0x12
80400ad8:	64068693          	addi	a3,a3,1600 # 80413114 <commands+0x1e0>
80400adc:	00012617          	auipc	a2,0x12
80400ae0:	65060613          	addi	a2,a2,1616 # 8041312c <commands+0x1f8>
80400ae4:	01100593          	li	a1,17
80400ae8:	00012517          	auipc	a0,0x12
80400aec:	65c50513          	addi	a0,a0,1628 # 80413144 <commands+0x210>
80400af0:	b35ff0ef          	jal	ra,80400624 <__panic>
80400af4:	00012697          	auipc	a3,0x12
80400af8:	66468693          	addi	a3,a3,1636 # 80413158 <commands+0x224>
80400afc:	00012617          	auipc	a2,0x12
80400b00:	63060613          	addi	a2,a2,1584 # 8041312c <commands+0x1f8>
80400b04:	01400593          	li	a1,20
80400b08:	00012517          	auipc	a0,0x12
80400b0c:	63c50513          	addi	a0,a0,1596 # 80413144 <commands+0x210>
80400b10:	b15ff0ef          	jal	ra,80400624 <__panic>

80400b14 <ide_device_valid>:
80400b14:	00300793          	li	a5,3
80400b18:	02a7e463          	bltu	a5,a0,80400b40 <ide_device_valid+0x2c>
80400b1c:	00451793          	slli	a5,a0,0x4
80400b20:	40a787b3          	sub	a5,a5,a0
80400b24:	00279793          	slli	a5,a5,0x2
80400b28:	00099517          	auipc	a0,0x99
80400b2c:	b3050513          	addi	a0,a0,-1232 # 80499658 <ide_devices>
80400b30:	00f507b3          	add	a5,a0,a5
80400b34:	0007a503          	lw	a0,0(a5)
80400b38:	00a03533          	snez	a0,a0
80400b3c:	00008067          	ret
80400b40:	00000513          	li	a0,0
80400b44:	00008067          	ret

80400b48 <ide_device_size>:
80400b48:	00300793          	li	a5,3
80400b4c:	02a7e663          	bltu	a5,a0,80400b78 <ide_device_size+0x30>
80400b50:	00451793          	slli	a5,a0,0x4
80400b54:	40a787b3          	sub	a5,a5,a0
80400b58:	00279793          	slli	a5,a5,0x2
80400b5c:	00099517          	auipc	a0,0x99
80400b60:	afc50513          	addi	a0,a0,-1284 # 80499658 <ide_devices>
80400b64:	00f507b3          	add	a5,a0,a5
80400b68:	0007a503          	lw	a0,0(a5)
80400b6c:	00050863          	beqz	a0,80400b7c <ide_device_size+0x34>
80400b70:	0087a503          	lw	a0,8(a5)
80400b74:	00008067          	ret
80400b78:	00000513          	li	a0,0
80400b7c:	00008067          	ret

80400b80 <ide_read_secs>:
80400b80:	ff010113          	addi	sp,sp,-16
80400b84:	00112623          	sw	ra,12(sp)
80400b88:	08000793          	li	a5,128
80400b8c:	04d7e663          	bltu	a5,a3,80400bd8 <ide_read_secs+0x58>
80400b90:	00300793          	li	a5,3
80400b94:	04a7e263          	bltu	a5,a0,80400bd8 <ide_read_secs+0x58>
80400b98:	00451793          	slli	a5,a0,0x4
80400b9c:	40a78533          	sub	a0,a5,a0
80400ba0:	00251513          	slli	a0,a0,0x2
80400ba4:	00099797          	auipc	a5,0x99
80400ba8:	ab478793          	addi	a5,a5,-1356 # 80499658 <ide_devices>
80400bac:	00a78533          	add	a0,a5,a0
80400bb0:	00052783          	lw	a5,0(a0)
80400bb4:	02078263          	beqz	a5,80400bd8 <ide_read_secs+0x58>
80400bb8:	100007b7          	lui	a5,0x10000
80400bbc:	02f5fe63          	bgeu	a1,a5,80400bf8 <ide_read_secs+0x78>
80400bc0:	00b68733          	add	a4,a3,a1
80400bc4:	02e7ea63          	bltu	a5,a4,80400bf8 <ide_read_secs+0x78>
80400bc8:	00c12083          	lw	ra,12(sp)
80400bcc:	03452303          	lw	t1,52(a0)
80400bd0:	01010113          	addi	sp,sp,16
80400bd4:	00030067          	jr	t1
80400bd8:	00012697          	auipc	a3,0x12
80400bdc:	59868693          	addi	a3,a3,1432 # 80413170 <commands+0x23c>
80400be0:	00012617          	auipc	a2,0x12
80400be4:	54c60613          	addi	a2,a2,1356 # 8041312c <commands+0x1f8>
80400be8:	02200593          	li	a1,34
80400bec:	00012517          	auipc	a0,0x12
80400bf0:	55850513          	addi	a0,a0,1368 # 80413144 <commands+0x210>
80400bf4:	a31ff0ef          	jal	ra,80400624 <__panic>
80400bf8:	00012697          	auipc	a3,0x12
80400bfc:	5a068693          	addi	a3,a3,1440 # 80413198 <commands+0x264>
80400c00:	00012617          	auipc	a2,0x12
80400c04:	52c60613          	addi	a2,a2,1324 # 8041312c <commands+0x1f8>
80400c08:	02300593          	li	a1,35
80400c0c:	00012517          	auipc	a0,0x12
80400c10:	53850513          	addi	a0,a0,1336 # 80413144 <commands+0x210>
80400c14:	a11ff0ef          	jal	ra,80400624 <__panic>

80400c18 <ide_write_secs>:
80400c18:	ff010113          	addi	sp,sp,-16
80400c1c:	00112623          	sw	ra,12(sp)
80400c20:	08000793          	li	a5,128
80400c24:	04d7e663          	bltu	a5,a3,80400c70 <ide_write_secs+0x58>
80400c28:	00300793          	li	a5,3
80400c2c:	04a7e263          	bltu	a5,a0,80400c70 <ide_write_secs+0x58>
80400c30:	00451793          	slli	a5,a0,0x4
80400c34:	40a78533          	sub	a0,a5,a0
80400c38:	00251513          	slli	a0,a0,0x2
80400c3c:	00099797          	auipc	a5,0x99
80400c40:	a1c78793          	addi	a5,a5,-1508 # 80499658 <ide_devices>
80400c44:	00a78533          	add	a0,a5,a0
80400c48:	00052783          	lw	a5,0(a0)
80400c4c:	02078263          	beqz	a5,80400c70 <ide_write_secs+0x58>
80400c50:	100007b7          	lui	a5,0x10000
80400c54:	02f5fe63          	bgeu	a1,a5,80400c90 <ide_write_secs+0x78>
80400c58:	00b68733          	add	a4,a3,a1
80400c5c:	02e7ea63          	bltu	a5,a4,80400c90 <ide_write_secs+0x78>
80400c60:	00c12083          	lw	ra,12(sp)
80400c64:	03852303          	lw	t1,56(a0)
80400c68:	01010113          	addi	sp,sp,16
80400c6c:	00030067          	jr	t1
80400c70:	00012697          	auipc	a3,0x12
80400c74:	50068693          	addi	a3,a3,1280 # 80413170 <commands+0x23c>
80400c78:	00012617          	auipc	a2,0x12
80400c7c:	4b460613          	addi	a2,a2,1204 # 8041312c <commands+0x1f8>
80400c80:	02900593          	li	a1,41
80400c84:	00012517          	auipc	a0,0x12
80400c88:	4c050513          	addi	a0,a0,1216 # 80413144 <commands+0x210>
80400c8c:	999ff0ef          	jal	ra,80400624 <__panic>
80400c90:	00012697          	auipc	a3,0x12
80400c94:	50868693          	addi	a3,a3,1288 # 80413198 <commands+0x264>
80400c98:	00012617          	auipc	a2,0x12
80400c9c:	49460613          	addi	a2,a2,1172 # 8041312c <commands+0x1f8>
80400ca0:	02a00593          	li	a1,42
80400ca4:	00012517          	auipc	a0,0x12
80400ca8:	4a050513          	addi	a0,a0,1184 # 80413144 <commands+0x210>
80400cac:	979ff0ef          	jal	ra,80400624 <__panic>

80400cb0 <intr_enable>:
80400cb0:	100167f3          	csrrsi	a5,sstatus,2
80400cb4:	00008067          	ret

80400cb8 <intr_disable>:
80400cb8:	100177f3          	csrrci	a5,sstatus,2
80400cbc:	00008067          	ret

80400cc0 <pic_init>:
80400cc0:	00008067          	ret

80400cc4 <ramdisk_write>:
80400cc4:	00852783          	lw	a5,8(a0)
80400cc8:	ff010113          	addi	sp,sp,-16
80400ccc:	00112623          	sw	ra,12(sp)
80400cd0:	40b787b3          	sub	a5,a5,a1
80400cd4:	00058713          	mv	a4,a1
80400cd8:	00060593          	mv	a1,a2
80400cdc:	00f6f463          	bgeu	a3,a5,80400ce4 <ramdisk_write+0x20>
80400ce0:	00068793          	mv	a5,a3
80400ce4:	00c52503          	lw	a0,12(a0)
80400ce8:	00971713          	slli	a4,a4,0x9
80400cec:	00979613          	slli	a2,a5,0x9
80400cf0:	00a70533          	add	a0,a4,a0
80400cf4:	03c120ef          	jal	ra,80412d30 <memcpy>
80400cf8:	00c12083          	lw	ra,12(sp)
80400cfc:	00000513          	li	a0,0
80400d00:	01010113          	addi	sp,sp,16
80400d04:	00008067          	ret

80400d08 <ramdisk_read>:
80400d08:	00852783          	lw	a5,8(a0)
80400d0c:	ff010113          	addi	sp,sp,-16
80400d10:	00112623          	sw	ra,12(sp)
80400d14:	40b787b3          	sub	a5,a5,a1
80400d18:	00050713          	mv	a4,a0
80400d1c:	00060513          	mv	a0,a2
80400d20:	00f6f463          	bgeu	a3,a5,80400d28 <ramdisk_read+0x20>
80400d24:	00068793          	mv	a5,a3
80400d28:	00c72703          	lw	a4,12(a4)
80400d2c:	00959593          	slli	a1,a1,0x9
80400d30:	00979613          	slli	a2,a5,0x9
80400d34:	00e585b3          	add	a1,a1,a4
80400d38:	7f9110ef          	jal	ra,80412d30 <memcpy>
80400d3c:	00c12083          	lw	ra,12(sp)
80400d40:	00000513          	li	a0,0
80400d44:	01010113          	addi	sp,sp,16
80400d48:	00008067          	ret

80400d4c <check_initrd>:
80400d4c:	ff010113          	addi	sp,sp,-16
80400d50:	00112623          	sw	ra,12(sp)
80400d54:	02b50663          	beq	a0,a1,80400d80 <check_initrd+0x34>
80400d58:	40a586b3          	sub	a3,a1,a0
80400d5c:	fff58613          	addi	a2,a1,-1
80400d60:	00050593          	mv	a1,a0
80400d64:	00012517          	auipc	a0,0x12
80400d68:	48850513          	addi	a0,a0,1160 # 804131ec <commands+0x2b8>
80400d6c:	c90ff0ef          	jal	ra,804001fc <cprintf>
80400d70:	00c12083          	lw	ra,12(sp)
80400d74:	00100513          	li	a0,1
80400d78:	01010113          	addi	sp,sp,16
80400d7c:	00008067          	ret
80400d80:	00012517          	auipc	a0,0x12
80400d84:	45450513          	addi	a0,a0,1108 # 804131d4 <commands+0x2a0>
80400d88:	c74ff0ef          	jal	ra,804001fc <cprintf>
80400d8c:	00c12083          	lw	ra,12(sp)
80400d90:	00000513          	li	a0,0
80400d94:	01010113          	addi	sp,sp,16
80400d98:	00008067          	ret

80400d9c <ramdisk_init>:
80400d9c:	fe010113          	addi	sp,sp,-32
80400da0:	00812c23          	sw	s0,24(sp)
80400da4:	00058413          	mv	s0,a1
80400da8:	01212823          	sw	s2,16(sp)
80400dac:	03c00613          	li	a2,60
80400db0:	00050913          	mv	s2,a0
80400db4:	00000593          	li	a1,0
80400db8:	00040513          	mv	a0,s0
80400dbc:	00112e23          	sw	ra,28(sp)
80400dc0:	00912a23          	sw	s1,20(sp)
80400dc4:	01312623          	sw	s3,12(sp)
80400dc8:	6f9110ef          	jal	ra,80412cc0 <memset>
80400dcc:	00100793          	li	a5,1
80400dd0:	0af90663          	beq	s2,a5,80400e7c <ramdisk_init+0xe0>
80400dd4:	00200793          	li	a5,2
80400dd8:	00098497          	auipc	s1,0x98
80400ddc:	22848493          	addi	s1,s1,552 # 80499000 <swap_manager_fifo>
80400de0:	00020997          	auipc	s3,0x20
80400de4:	22098993          	addi	s3,s3,544 # 80421000 <_binary_bin_sfs_img_start>
80400de8:	0af91463          	bne	s2,a5,80400e90 <ramdisk_init+0xf4>
80400dec:	00048593          	mv	a1,s1
80400df0:	00098513          	mv	a0,s3
80400df4:	f59ff0ef          	jal	ra,80400d4c <check_initrd>
80400df8:	02051063          	bnez	a0,80400e18 <ramdisk_init+0x7c>
80400dfc:	01c12083          	lw	ra,28(sp)
80400e00:	01812403          	lw	s0,24(sp)
80400e04:	01412483          	lw	s1,20(sp)
80400e08:	01012903          	lw	s2,16(sp)
80400e0c:	00c12983          	lw	s3,12(sp)
80400e10:	02010113          	addi	sp,sp,32
80400e14:	00008067          	ret
80400e18:	413484b3          	sub	s1,s1,s3
80400e1c:	00100793          	li	a5,1
80400e20:	00f42023          	sw	a5,0(s0)
80400e24:	0094d493          	srli	s1,s1,0x9
80400e28:	fff00793          	li	a5,-1
80400e2c:	00f42223          	sw	a5,4(s0)
80400e30:	00942423          	sw	s1,8(s0)
80400e34:	01342623          	sw	s3,12(s0)
80400e38:	01440513          	addi	a0,s0,20
80400e3c:	00012597          	auipc	a1,0x12
80400e40:	40458593          	addi	a1,a1,1028 # 80413240 <commands+0x30c>
80400e44:	605110ef          	jal	ra,80412c48 <strcpy>
80400e48:	00000797          	auipc	a5,0x0
80400e4c:	ec078793          	addi	a5,a5,-320 # 80400d08 <ramdisk_read>
80400e50:	02f42a23          	sw	a5,52(s0)
80400e54:	00000797          	auipc	a5,0x0
80400e58:	e7078793          	addi	a5,a5,-400 # 80400cc4 <ramdisk_write>
80400e5c:	02f42c23          	sw	a5,56(s0)
80400e60:	01c12083          	lw	ra,28(sp)
80400e64:	01812403          	lw	s0,24(sp)
80400e68:	01412483          	lw	s1,20(sp)
80400e6c:	01012903          	lw	s2,16(sp)
80400e70:	00c12983          	lw	s3,12(sp)
80400e74:	02010113          	addi	sp,sp,32
80400e78:	00008067          	ret
80400e7c:	00020497          	auipc	s1,0x20
80400e80:	18448493          	addi	s1,s1,388 # 80421000 <_binary_bin_sfs_img_start>
80400e84:	00018997          	auipc	s3,0x18
80400e88:	17c98993          	addi	s3,s3,380 # 80419000 <_binary_bin_swap_img_start>
80400e8c:	f61ff06f          	j	80400dec <ramdisk_init+0x50>
80400e90:	00012617          	auipc	a2,0x12
80400e94:	38460613          	addi	a2,a2,900 # 80413214 <commands+0x2e0>
80400e98:	03200593          	li	a1,50
80400e9c:	00012517          	auipc	a0,0x12
80400ea0:	38c50513          	addi	a0,a0,908 # 80413228 <commands+0x2f4>
80400ea4:	f80ff0ef          	jal	ra,80400624 <__panic>

80400ea8 <idt_init>:
80400ea8:	14005073          	csrwi	sscratch,0
80400eac:	00001797          	auipc	a5,0x1
80400eb0:	8b478793          	addi	a5,a5,-1868 # 80401760 <__alltraps>
80400eb4:	10579073          	csrw	stvec,a5
80400eb8:	000407b7          	lui	a5,0x40
80400ebc:	1007a7f3          	csrrs	a5,sstatus,a5
80400ec0:	20200793          	li	a5,514
80400ec4:	1047a7f3          	csrrs	a5,sie,a5
80400ec8:	00008067          	ret

80400ecc <print_regs>:
80400ecc:	00052583          	lw	a1,0(a0)
80400ed0:	ff010113          	addi	sp,sp,-16
80400ed4:	00812423          	sw	s0,8(sp)
80400ed8:	00050413          	mv	s0,a0
80400edc:	00012517          	auipc	a0,0x12
80400ee0:	74850513          	addi	a0,a0,1864 # 80413624 <commands+0x6f0>
80400ee4:	00112623          	sw	ra,12(sp)
80400ee8:	b14ff0ef          	jal	ra,804001fc <cprintf>
80400eec:	00442583          	lw	a1,4(s0)
80400ef0:	00012517          	auipc	a0,0x12
80400ef4:	74850513          	addi	a0,a0,1864 # 80413638 <commands+0x704>
80400ef8:	b04ff0ef          	jal	ra,804001fc <cprintf>
80400efc:	00842583          	lw	a1,8(s0)
80400f00:	00012517          	auipc	a0,0x12
80400f04:	74c50513          	addi	a0,a0,1868 # 8041364c <commands+0x718>
80400f08:	af4ff0ef          	jal	ra,804001fc <cprintf>
80400f0c:	00c42583          	lw	a1,12(s0)
80400f10:	00012517          	auipc	a0,0x12
80400f14:	75050513          	addi	a0,a0,1872 # 80413660 <commands+0x72c>
80400f18:	ae4ff0ef          	jal	ra,804001fc <cprintf>
80400f1c:	01042583          	lw	a1,16(s0)
80400f20:	00012517          	auipc	a0,0x12
80400f24:	75450513          	addi	a0,a0,1876 # 80413674 <commands+0x740>
80400f28:	ad4ff0ef          	jal	ra,804001fc <cprintf>
80400f2c:	01442583          	lw	a1,20(s0)
80400f30:	00012517          	auipc	a0,0x12
80400f34:	75850513          	addi	a0,a0,1880 # 80413688 <commands+0x754>
80400f38:	ac4ff0ef          	jal	ra,804001fc <cprintf>
80400f3c:	01842583          	lw	a1,24(s0)
80400f40:	00012517          	auipc	a0,0x12
80400f44:	75c50513          	addi	a0,a0,1884 # 8041369c <commands+0x768>
80400f48:	ab4ff0ef          	jal	ra,804001fc <cprintf>
80400f4c:	01c42583          	lw	a1,28(s0)
80400f50:	00012517          	auipc	a0,0x12
80400f54:	76050513          	addi	a0,a0,1888 # 804136b0 <commands+0x77c>
80400f58:	aa4ff0ef          	jal	ra,804001fc <cprintf>
80400f5c:	02042583          	lw	a1,32(s0)
80400f60:	00012517          	auipc	a0,0x12
80400f64:	76450513          	addi	a0,a0,1892 # 804136c4 <commands+0x790>
80400f68:	a94ff0ef          	jal	ra,804001fc <cprintf>
80400f6c:	02442583          	lw	a1,36(s0)
80400f70:	00012517          	auipc	a0,0x12
80400f74:	76850513          	addi	a0,a0,1896 # 804136d8 <commands+0x7a4>
80400f78:	a84ff0ef          	jal	ra,804001fc <cprintf>
80400f7c:	02842583          	lw	a1,40(s0)
80400f80:	00012517          	auipc	a0,0x12
80400f84:	76c50513          	addi	a0,a0,1900 # 804136ec <commands+0x7b8>
80400f88:	a74ff0ef          	jal	ra,804001fc <cprintf>
80400f8c:	02c42583          	lw	a1,44(s0)
80400f90:	00012517          	auipc	a0,0x12
80400f94:	77050513          	addi	a0,a0,1904 # 80413700 <commands+0x7cc>
80400f98:	a64ff0ef          	jal	ra,804001fc <cprintf>
80400f9c:	03042583          	lw	a1,48(s0)
80400fa0:	00012517          	auipc	a0,0x12
80400fa4:	77450513          	addi	a0,a0,1908 # 80413714 <commands+0x7e0>
80400fa8:	a54ff0ef          	jal	ra,804001fc <cprintf>
80400fac:	03442583          	lw	a1,52(s0)
80400fb0:	00012517          	auipc	a0,0x12
80400fb4:	77850513          	addi	a0,a0,1912 # 80413728 <commands+0x7f4>
80400fb8:	a44ff0ef          	jal	ra,804001fc <cprintf>
80400fbc:	03842583          	lw	a1,56(s0)
80400fc0:	00012517          	auipc	a0,0x12
80400fc4:	77c50513          	addi	a0,a0,1916 # 8041373c <commands+0x808>
80400fc8:	a34ff0ef          	jal	ra,804001fc <cprintf>
80400fcc:	03c42583          	lw	a1,60(s0)
80400fd0:	00012517          	auipc	a0,0x12
80400fd4:	78050513          	addi	a0,a0,1920 # 80413750 <commands+0x81c>
80400fd8:	a24ff0ef          	jal	ra,804001fc <cprintf>
80400fdc:	04042583          	lw	a1,64(s0)
80400fe0:	00012517          	auipc	a0,0x12
80400fe4:	78450513          	addi	a0,a0,1924 # 80413764 <commands+0x830>
80400fe8:	a14ff0ef          	jal	ra,804001fc <cprintf>
80400fec:	04442583          	lw	a1,68(s0)
80400ff0:	00012517          	auipc	a0,0x12
80400ff4:	78850513          	addi	a0,a0,1928 # 80413778 <commands+0x844>
80400ff8:	a04ff0ef          	jal	ra,804001fc <cprintf>
80400ffc:	04842583          	lw	a1,72(s0)
80401000:	00012517          	auipc	a0,0x12
80401004:	78c50513          	addi	a0,a0,1932 # 8041378c <commands+0x858>
80401008:	9f4ff0ef          	jal	ra,804001fc <cprintf>
8040100c:	04c42583          	lw	a1,76(s0)
80401010:	00012517          	auipc	a0,0x12
80401014:	79050513          	addi	a0,a0,1936 # 804137a0 <commands+0x86c>
80401018:	9e4ff0ef          	jal	ra,804001fc <cprintf>
8040101c:	05042583          	lw	a1,80(s0)
80401020:	00012517          	auipc	a0,0x12
80401024:	79450513          	addi	a0,a0,1940 # 804137b4 <commands+0x880>
80401028:	9d4ff0ef          	jal	ra,804001fc <cprintf>
8040102c:	05442583          	lw	a1,84(s0)
80401030:	00012517          	auipc	a0,0x12
80401034:	79850513          	addi	a0,a0,1944 # 804137c8 <commands+0x894>
80401038:	9c4ff0ef          	jal	ra,804001fc <cprintf>
8040103c:	05842583          	lw	a1,88(s0)
80401040:	00012517          	auipc	a0,0x12
80401044:	79c50513          	addi	a0,a0,1948 # 804137dc <commands+0x8a8>
80401048:	9b4ff0ef          	jal	ra,804001fc <cprintf>
8040104c:	05c42583          	lw	a1,92(s0)
80401050:	00012517          	auipc	a0,0x12
80401054:	7a050513          	addi	a0,a0,1952 # 804137f0 <commands+0x8bc>
80401058:	9a4ff0ef          	jal	ra,804001fc <cprintf>
8040105c:	06042583          	lw	a1,96(s0)
80401060:	00012517          	auipc	a0,0x12
80401064:	7a450513          	addi	a0,a0,1956 # 80413804 <commands+0x8d0>
80401068:	994ff0ef          	jal	ra,804001fc <cprintf>
8040106c:	06442583          	lw	a1,100(s0)
80401070:	00012517          	auipc	a0,0x12
80401074:	7a850513          	addi	a0,a0,1960 # 80413818 <commands+0x8e4>
80401078:	984ff0ef          	jal	ra,804001fc <cprintf>
8040107c:	06842583          	lw	a1,104(s0)
80401080:	00012517          	auipc	a0,0x12
80401084:	7ac50513          	addi	a0,a0,1964 # 8041382c <commands+0x8f8>
80401088:	974ff0ef          	jal	ra,804001fc <cprintf>
8040108c:	06c42583          	lw	a1,108(s0)
80401090:	00012517          	auipc	a0,0x12
80401094:	7b050513          	addi	a0,a0,1968 # 80413840 <commands+0x90c>
80401098:	964ff0ef          	jal	ra,804001fc <cprintf>
8040109c:	07042583          	lw	a1,112(s0)
804010a0:	00012517          	auipc	a0,0x12
804010a4:	7b450513          	addi	a0,a0,1972 # 80413854 <commands+0x920>
804010a8:	954ff0ef          	jal	ra,804001fc <cprintf>
804010ac:	07442583          	lw	a1,116(s0)
804010b0:	00012517          	auipc	a0,0x12
804010b4:	7b850513          	addi	a0,a0,1976 # 80413868 <commands+0x934>
804010b8:	944ff0ef          	jal	ra,804001fc <cprintf>
804010bc:	07842583          	lw	a1,120(s0)
804010c0:	00012517          	auipc	a0,0x12
804010c4:	7bc50513          	addi	a0,a0,1980 # 8041387c <commands+0x948>
804010c8:	934ff0ef          	jal	ra,804001fc <cprintf>
804010cc:	07c42583          	lw	a1,124(s0)
804010d0:	00812403          	lw	s0,8(sp)
804010d4:	00c12083          	lw	ra,12(sp)
804010d8:	00012517          	auipc	a0,0x12
804010dc:	7b850513          	addi	a0,a0,1976 # 80413890 <commands+0x95c>
804010e0:	01010113          	addi	sp,sp,16
804010e4:	918ff06f          	j	804001fc <cprintf>

804010e8 <print_trapframe>:
804010e8:	ff010113          	addi	sp,sp,-16
804010ec:	00812423          	sw	s0,8(sp)
804010f0:	00050593          	mv	a1,a0
804010f4:	00050413          	mv	s0,a0
804010f8:	00012517          	auipc	a0,0x12
804010fc:	7ac50513          	addi	a0,a0,1964 # 804138a4 <commands+0x970>
80401100:	00112623          	sw	ra,12(sp)
80401104:	8f8ff0ef          	jal	ra,804001fc <cprintf>
80401108:	00040513          	mv	a0,s0
8040110c:	dc1ff0ef          	jal	ra,80400ecc <print_regs>
80401110:	08042583          	lw	a1,128(s0)
80401114:	00012517          	auipc	a0,0x12
80401118:	7a450513          	addi	a0,a0,1956 # 804138b8 <commands+0x984>
8040111c:	8e0ff0ef          	jal	ra,804001fc <cprintf>
80401120:	08442583          	lw	a1,132(s0)
80401124:	00012517          	auipc	a0,0x12
80401128:	7a850513          	addi	a0,a0,1960 # 804138cc <commands+0x998>
8040112c:	8d0ff0ef          	jal	ra,804001fc <cprintf>
80401130:	08842583          	lw	a1,136(s0)
80401134:	00012517          	auipc	a0,0x12
80401138:	7ac50513          	addi	a0,a0,1964 # 804138e0 <commands+0x9ac>
8040113c:	8c0ff0ef          	jal	ra,804001fc <cprintf>
80401140:	08c42583          	lw	a1,140(s0)
80401144:	00812403          	lw	s0,8(sp)
80401148:	00c12083          	lw	ra,12(sp)
8040114c:	00012517          	auipc	a0,0x12
80401150:	7a850513          	addi	a0,a0,1960 # 804138f4 <commands+0x9c0>
80401154:	01010113          	addi	sp,sp,16
80401158:	8a4ff06f          	j	804001fc <cprintf>

8040115c <pgfault_handler>:
8040115c:	ff010113          	addi	sp,sp,-16
80401160:	00912223          	sw	s1,4(sp)
80401164:	0009b497          	auipc	s1,0x9b
80401168:	74c48493          	addi	s1,s1,1868 # 8049c8b0 <check_mm_struct>
8040116c:	0004a783          	lw	a5,0(s1)
80401170:	00812423          	sw	s0,8(sp)
80401174:	00112623          	sw	ra,12(sp)
80401178:	00050413          	mv	s0,a0
8040117c:	06078a63          	beqz	a5,804011f0 <pgfault_handler+0x94>
80401180:	08852583          	lw	a1,136(a0)
80401184:	00012517          	auipc	a0,0x12
80401188:	43450513          	addi	a0,a0,1076 # 804135b8 <commands+0x684>
8040118c:	870ff0ef          	jal	ra,804001fc <cprintf>
80401190:	08c42583          	lw	a1,140(s0)
80401194:	00d00793          	li	a5,13
80401198:	08f58463          	beq	a1,a5,80401220 <pgfault_handler+0xc4>
8040119c:	00f00793          	li	a5,15
804011a0:	08f58863          	beq	a1,a5,80401230 <pgfault_handler+0xd4>
804011a4:	00012517          	auipc	a0,0x12
804011a8:	43850513          	addi	a0,a0,1080 # 804135dc <commands+0x6a8>
804011ac:	850ff0ef          	jal	ra,804001fc <cprintf>
804011b0:	0004a503          	lw	a0,0(s1)
804011b4:	0009b797          	auipc	a5,0x9b
804011b8:	5f878793          	addi	a5,a5,1528 # 8049c7ac <current>
804011bc:	0007a703          	lw	a4,0(a5)
804011c0:	02050c63          	beqz	a0,804011f8 <pgfault_handler+0x9c>
804011c4:	0009b797          	auipc	a5,0x9b
804011c8:	5ec78793          	addi	a5,a5,1516 # 8049c7b0 <idleproc>
804011cc:	0007a783          	lw	a5,0(a5)
804011d0:	06e79863          	bne	a5,a4,80401240 <pgfault_handler+0xe4>
804011d4:	08842603          	lw	a2,136(s0)
804011d8:	08c42583          	lw	a1,140(s0)
804011dc:	00812403          	lw	s0,8(sp)
804011e0:	00c12083          	lw	ra,12(sp)
804011e4:	00412483          	lw	s1,4(sp)
804011e8:	01010113          	addi	sp,sp,16
804011ec:	2310306f          	j	80404c1c <do_pgfault>
804011f0:	0009b797          	auipc	a5,0x9b
804011f4:	5bc78793          	addi	a5,a5,1468 # 8049c7ac <current>
804011f8:	0007a783          	lw	a5,0(a5)
804011fc:	06078263          	beqz	a5,80401260 <pgfault_handler+0x104>
80401200:	08842603          	lw	a2,136(s0)
80401204:	08c42583          	lw	a1,140(s0)
80401208:	00812403          	lw	s0,8(sp)
8040120c:	00c12083          	lw	ra,12(sp)
80401210:	00412483          	lw	s1,4(sp)
80401214:	0187a503          	lw	a0,24(a5)
80401218:	01010113          	addi	sp,sp,16
8040121c:	2010306f          	j	80404c1c <do_pgfault>
80401220:	00012517          	auipc	a0,0x12
80401224:	3b450513          	addi	a0,a0,948 # 804135d4 <commands+0x6a0>
80401228:	fd5fe0ef          	jal	ra,804001fc <cprintf>
8040122c:	f85ff06f          	j	804011b0 <pgfault_handler+0x54>
80401230:	00012517          	auipc	a0,0x12
80401234:	3a850513          	addi	a0,a0,936 # 804135d8 <commands+0x6a4>
80401238:	fc5fe0ef          	jal	ra,804001fc <cprintf>
8040123c:	f75ff06f          	j	804011b0 <pgfault_handler+0x54>
80401240:	00012697          	auipc	a3,0x12
80401244:	3a468693          	addi	a3,a3,932 # 804135e4 <commands+0x6b0>
80401248:	00012617          	auipc	a2,0x12
8040124c:	ee460613          	addi	a2,a2,-284 # 8041312c <commands+0x1f8>
80401250:	08700593          	li	a1,135
80401254:	00012517          	auipc	a0,0x12
80401258:	3a450513          	addi	a0,a0,932 # 804135f8 <commands+0x6c4>
8040125c:	bc8ff0ef          	jal	ra,80400624 <__panic>
80401260:	00040513          	mv	a0,s0
80401264:	e85ff0ef          	jal	ra,804010e8 <print_trapframe>
80401268:	08842583          	lw	a1,136(s0)
8040126c:	00012517          	auipc	a0,0x12
80401270:	34c50513          	addi	a0,a0,844 # 804135b8 <commands+0x684>
80401274:	f89fe0ef          	jal	ra,804001fc <cprintf>
80401278:	08c42583          	lw	a1,140(s0)
8040127c:	00d00793          	li	a5,13
80401280:	02f58863          	beq	a1,a5,804012b0 <pgfault_handler+0x154>
80401284:	00f00793          	li	a5,15
80401288:	02f58c63          	beq	a1,a5,804012c0 <pgfault_handler+0x164>
8040128c:	00012517          	auipc	a0,0x12
80401290:	35050513          	addi	a0,a0,848 # 804135dc <commands+0x6a8>
80401294:	f69fe0ef          	jal	ra,804001fc <cprintf>
80401298:	00012617          	auipc	a2,0x12
8040129c:	37460613          	addi	a2,a2,884 # 8041360c <commands+0x6d8>
804012a0:	08e00593          	li	a1,142
804012a4:	00012517          	auipc	a0,0x12
804012a8:	35450513          	addi	a0,a0,852 # 804135f8 <commands+0x6c4>
804012ac:	b78ff0ef          	jal	ra,80400624 <__panic>
804012b0:	00012517          	auipc	a0,0x12
804012b4:	32450513          	addi	a0,a0,804 # 804135d4 <commands+0x6a0>
804012b8:	f45fe0ef          	jal	ra,804001fc <cprintf>
804012bc:	fddff06f          	j	80401298 <pgfault_handler+0x13c>
804012c0:	00012517          	auipc	a0,0x12
804012c4:	31850513          	addi	a0,a0,792 # 804135d8 <commands+0x6a4>
804012c8:	f35fe0ef          	jal	ra,804001fc <cprintf>
804012cc:	fcdff06f          	j	80401298 <pgfault_handler+0x13c>

804012d0 <interrupt_handler>:
804012d0:	08c52783          	lw	a5,140(a0)
804012d4:	00b00713          	li	a4,11
804012d8:	00179793          	slli	a5,a5,0x1
804012dc:	0017d793          	srli	a5,a5,0x1
804012e0:	12f76c63          	bltu	a4,a5,80401418 <interrupt_handler+0x148>
804012e4:	00012717          	auipc	a4,0x12
804012e8:	f6870713          	addi	a4,a4,-152 # 8041324c <commands+0x318>
804012ec:	00279793          	slli	a5,a5,0x2
804012f0:	00e787b3          	add	a5,a5,a4
804012f4:	0007a783          	lw	a5,0(a5)
804012f8:	ff010113          	addi	sp,sp,-16
804012fc:	00112623          	sw	ra,12(sp)
80401300:	00e787b3          	add	a5,a5,a4
80401304:	00078067          	jr	a5
80401308:	00c12083          	lw	ra,12(sp)
8040130c:	00012517          	auipc	a0,0x12
80401310:	20050513          	addi	a0,a0,512 # 8041350c <commands+0x5d8>
80401314:	01010113          	addi	sp,sp,16
80401318:	ee5fe06f          	j	804001fc <cprintf>
8040131c:	00c12083          	lw	ra,12(sp)
80401320:	00012517          	auipc	a0,0x12
80401324:	1cc50513          	addi	a0,a0,460 # 804134ec <commands+0x5b8>
80401328:	01010113          	addi	sp,sp,16
8040132c:	ed1fe06f          	j	804001fc <cprintf>
80401330:	00012517          	auipc	a0,0x12
80401334:	19c50513          	addi	a0,a0,412 # 804134cc <commands+0x598>
80401338:	ec5fe0ef          	jal	ra,804001fc <cprintf>
8040133c:	d00ff0ef          	jal	ra,8040083c <serial_intr>
80401340:	e04ff0ef          	jal	ra,80400944 <cons_getc>
80401344:	00c12083          	lw	ra,12(sp)
80401348:	01010113          	addi	sp,sp,16
8040134c:	1280e06f          	j	8040f474 <dev_stdin_write>
80401350:	00c12083          	lw	ra,12(sp)
80401354:	00012517          	auipc	a0,0x12
80401358:	1d450513          	addi	a0,a0,468 # 80413528 <commands+0x5f4>
8040135c:	01010113          	addi	sp,sp,16
80401360:	e9dfe06f          	j	804001fc <cprintf>
80401364:	00012517          	auipc	a0,0x12
80401368:	1f850513          	addi	a0,a0,504 # 8041355c <commands+0x628>
8040136c:	e91fe0ef          	jal	ra,804001fc <cprintf>
80401370:	cccff0ef          	jal	ra,8040083c <serial_intr>
80401374:	0080006f          	j	8040137c <interrupt_handler+0xac>
80401378:	0fc0e0ef          	jal	ra,8040f474 <dev_stdin_write>
8040137c:	dc8ff0ef          	jal	ra,80400944 <cons_getc>
80401380:	fe051ce3          	bnez	a0,80401378 <interrupt_handler+0xa8>
80401384:	00c12083          	lw	ra,12(sp)
80401388:	01010113          	addi	sp,sp,16
8040138c:	00008067          	ret
80401390:	00c12083          	lw	ra,12(sp)
80401394:	00012517          	auipc	a0,0x12
80401398:	11c50513          	addi	a0,a0,284 # 804134b0 <commands+0x57c>
8040139c:	01010113          	addi	sp,sp,16
804013a0:	e5dfe06f          	j	804001fc <cprintf>
804013a4:	b6cff0ef          	jal	ra,80400710 <clock_set_next_event>
804013a8:	0009b797          	auipc	a5,0x9b
804013ac:	44478793          	addi	a5,a5,1092 # 8049c7ec <ticks>
804013b0:	0007a783          	lw	a5,0(a5)
804013b4:	00178793          	addi	a5,a5,1
804013b8:	0009b717          	auipc	a4,0x9b
804013bc:	42f72a23          	sw	a5,1076(a4) # 8049c7ec <ticks>
804013c0:	3fd0b0ef          	jal	ra,8040cfbc <run_timer_list>
804013c4:	c78ff0ef          	jal	ra,8040083c <serial_intr>
804013c8:	0080006f          	j	804013d0 <interrupt_handler+0x100>
804013cc:	0a80e0ef          	jal	ra,8040f474 <dev_stdin_write>
804013d0:	d74ff0ef          	jal	ra,80400944 <cons_getc>
804013d4:	fe051ce3          	bnez	a0,804013cc <interrupt_handler+0xfc>
804013d8:	fadff06f          	j	80401384 <interrupt_handler+0xb4>
804013dc:	00c12083          	lw	ra,12(sp)
804013e0:	00012517          	auipc	a0,0x12
804013e4:	19c50513          	addi	a0,a0,412 # 8041357c <commands+0x648>
804013e8:	01010113          	addi	sp,sp,16
804013ec:	e11fe06f          	j	804001fc <cprintf>
804013f0:	00c12083          	lw	ra,12(sp)
804013f4:	00012517          	auipc	a0,0x12
804013f8:	1a850513          	addi	a0,a0,424 # 8041359c <commands+0x668>
804013fc:	01010113          	addi	sp,sp,16
80401400:	dfdfe06f          	j	804001fc <cprintf>
80401404:	00c12083          	lw	ra,12(sp)
80401408:	00012517          	auipc	a0,0x12
8040140c:	13850513          	addi	a0,a0,312 # 80413540 <commands+0x60c>
80401410:	01010113          	addi	sp,sp,16
80401414:	de9fe06f          	j	804001fc <cprintf>
80401418:	cd1ff06f          	j	804010e8 <print_trapframe>

8040141c <exception_handler>:
8040141c:	08c52783          	lw	a5,140(a0)
80401420:	00f00713          	li	a4,15
80401424:	22f76263          	bltu	a4,a5,80401648 <exception_handler+0x22c>
80401428:	00012717          	auipc	a4,0x12
8040142c:	e5470713          	addi	a4,a4,-428 # 8041327c <commands+0x348>
80401430:	00279793          	slli	a5,a5,0x2
80401434:	00e787b3          	add	a5,a5,a4
80401438:	0007a783          	lw	a5,0(a5)
8040143c:	ff010113          	addi	sp,sp,-16
80401440:	00812423          	sw	s0,8(sp)
80401444:	00112623          	sw	ra,12(sp)
80401448:	00912223          	sw	s1,4(sp)
8040144c:	00e787b3          	add	a5,a5,a4
80401450:	00050413          	mv	s0,a0
80401454:	00078067          	jr	a5
80401458:	00012517          	auipc	a0,0x12
8040145c:	f2450513          	addi	a0,a0,-220 # 8041337c <commands+0x448>
80401460:	d9dfe0ef          	jal	ra,804001fc <cprintf>
80401464:	08442783          	lw	a5,132(s0)
80401468:	00c12083          	lw	ra,12(sp)
8040146c:	00412483          	lw	s1,4(sp)
80401470:	00478793          	addi	a5,a5,4
80401474:	08f42223          	sw	a5,132(s0)
80401478:	00812403          	lw	s0,8(sp)
8040147c:	01010113          	addi	sp,sp,16
80401480:	1140c06f          	j	8040d594 <syscall>
80401484:	00012517          	auipc	a0,0x12
80401488:	f1850513          	addi	a0,a0,-232 # 8041339c <commands+0x468>
8040148c:	00812403          	lw	s0,8(sp)
80401490:	00c12083          	lw	ra,12(sp)
80401494:	00412483          	lw	s1,4(sp)
80401498:	01010113          	addi	sp,sp,16
8040149c:	d61fe06f          	j	804001fc <cprintf>
804014a0:	00012517          	auipc	a0,0x12
804014a4:	f1c50513          	addi	a0,a0,-228 # 804133bc <commands+0x488>
804014a8:	fe5ff06f          	j	8040148c <exception_handler+0x70>
804014ac:	00012517          	auipc	a0,0x12
804014b0:	f3050513          	addi	a0,a0,-208 # 804133dc <commands+0x4a8>
804014b4:	fd9ff06f          	j	8040148c <exception_handler+0x70>
804014b8:	00012517          	auipc	a0,0x12
804014bc:	f3c50513          	addi	a0,a0,-196 # 804133f4 <commands+0x4c0>
804014c0:	d3dfe0ef          	jal	ra,804001fc <cprintf>
804014c4:	00040513          	mv	a0,s0
804014c8:	c95ff0ef          	jal	ra,8040115c <pgfault_handler>
804014cc:	00050493          	mv	s1,a0
804014d0:	0e051463          	bnez	a0,804015b8 <exception_handler+0x19c>
804014d4:	00c12083          	lw	ra,12(sp)
804014d8:	00812403          	lw	s0,8(sp)
804014dc:	00412483          	lw	s1,4(sp)
804014e0:	01010113          	addi	sp,sp,16
804014e4:	00008067          	ret
804014e8:	00012517          	auipc	a0,0x12
804014ec:	fb050513          	addi	a0,a0,-80 # 80413498 <commands+0x564>
804014f0:	d0dfe0ef          	jal	ra,804001fc <cprintf>
804014f4:	00040513          	mv	a0,s0
804014f8:	c65ff0ef          	jal	ra,8040115c <pgfault_handler>
804014fc:	00050493          	mv	s1,a0
80401500:	fc050ae3          	beqz	a0,804014d4 <exception_handler+0xb8>
80401504:	00040513          	mv	a0,s0
80401508:	be1ff0ef          	jal	ra,804010e8 <print_trapframe>
8040150c:	0009b797          	auipc	a5,0x9b
80401510:	2a078793          	addi	a5,a5,672 # 8049c7ac <current>
80401514:	0007a783          	lw	a5,0(a5)
80401518:	14078863          	beqz	a5,80401668 <exception_handler+0x24c>
8040151c:	08042783          	lw	a5,128(s0)
80401520:	1007f793          	andi	a5,a5,256
80401524:	0c078a63          	beqz	a5,804015f8 <exception_handler+0x1dc>
80401528:	00048693          	mv	a3,s1
8040152c:	00012617          	auipc	a2,0x12
80401530:	efc60613          	addi	a2,a2,-260 # 80413428 <commands+0x4f4>
80401534:	12500593          	li	a1,293
80401538:	00012517          	auipc	a0,0x12
8040153c:	0c050513          	addi	a0,a0,192 # 804135f8 <commands+0x6c4>
80401540:	8e4ff0ef          	jal	ra,80400624 <__panic>
80401544:	00012517          	auipc	a0,0x12
80401548:	d7850513          	addi	a0,a0,-648 # 804132bc <commands+0x388>
8040154c:	f41ff06f          	j	8040148c <exception_handler+0x70>
80401550:	00012517          	auipc	a0,0x12
80401554:	d8c50513          	addi	a0,a0,-628 # 804132dc <commands+0x3a8>
80401558:	f35ff06f          	j	8040148c <exception_handler+0x70>
8040155c:	00012517          	auipc	a0,0x12
80401560:	d9c50513          	addi	a0,a0,-612 # 804132f8 <commands+0x3c4>
80401564:	f29ff06f          	j	8040148c <exception_handler+0x70>
80401568:	00012517          	auipc	a0,0x12
8040156c:	da850513          	addi	a0,a0,-600 # 80413310 <commands+0x3dc>
80401570:	f1dff06f          	j	8040148c <exception_handler+0x70>
80401574:	00012517          	auipc	a0,0x12
80401578:	da850513          	addi	a0,a0,-600 # 8041331c <commands+0x3e8>
8040157c:	f11ff06f          	j	8040148c <exception_handler+0x70>
80401580:	00012517          	auipc	a0,0x12
80401584:	db850513          	addi	a0,a0,-584 # 80413338 <commands+0x404>
80401588:	f05ff06f          	j	8040148c <exception_handler+0x70>
8040158c:	00012517          	auipc	a0,0x12
80401590:	dc050513          	addi	a0,a0,-576 # 8041334c <commands+0x418>
80401594:	ef9ff06f          	j	8040148c <exception_handler+0x70>
80401598:	00012517          	auipc	a0,0x12
8040159c:	dcc50513          	addi	a0,a0,-564 # 80413364 <commands+0x430>
804015a0:	eedff06f          	j	8040148c <exception_handler+0x70>
804015a4:	00812403          	lw	s0,8(sp)
804015a8:	00c12083          	lw	ra,12(sp)
804015ac:	00412483          	lw	s1,4(sp)
804015b0:	01010113          	addi	sp,sp,16
804015b4:	b35ff06f          	j	804010e8 <print_trapframe>
804015b8:	00040513          	mv	a0,s0
804015bc:	b2dff0ef          	jal	ra,804010e8 <print_trapframe>
804015c0:	0009b797          	auipc	a5,0x9b
804015c4:	1ec78793          	addi	a5,a5,492 # 8049c7ac <current>
804015c8:	0007a783          	lw	a5,0(a5)
804015cc:	08078063          	beqz	a5,8040164c <exception_handler+0x230>
804015d0:	08042783          	lw	a5,128(s0)
804015d4:	1007f793          	andi	a5,a5,256
804015d8:	04078463          	beqz	a5,80401620 <exception_handler+0x204>
804015dc:	00048693          	mv	a3,s1
804015e0:	00012617          	auipc	a2,0x12
804015e4:	e4860613          	addi	a2,a2,-440 # 80413428 <commands+0x4f4>
804015e8:	11400593          	li	a1,276
804015ec:	00012517          	auipc	a0,0x12
804015f0:	00c50513          	addi	a0,a0,12 # 804135f8 <commands+0x6c4>
804015f4:	830ff0ef          	jal	ra,80400624 <__panic>
804015f8:	00012517          	auipc	a0,0x12
804015fc:	e6050513          	addi	a0,a0,-416 # 80413458 <commands+0x524>
80401600:	bfdfe0ef          	jal	ra,804001fc <cprintf>
80401604:	00048693          	mv	a3,s1
80401608:	00012617          	auipc	a2,0x12
8040160c:	e6460613          	addi	a2,a2,-412 # 8041346c <commands+0x538>
80401610:	12800593          	li	a1,296
80401614:	00012517          	auipc	a0,0x12
80401618:	fe450513          	addi	a0,a0,-28 # 804135f8 <commands+0x6c4>
8040161c:	808ff0ef          	jal	ra,80400624 <__panic>
80401620:	00012517          	auipc	a0,0x12
80401624:	e3850513          	addi	a0,a0,-456 # 80413458 <commands+0x524>
80401628:	bd5fe0ef          	jal	ra,804001fc <cprintf>
8040162c:	00048693          	mv	a3,s1
80401630:	00012617          	auipc	a2,0x12
80401634:	e3c60613          	addi	a2,a2,-452 # 8041346c <commands+0x538>
80401638:	11700593          	li	a1,279
8040163c:	00012517          	auipc	a0,0x12
80401640:	fbc50513          	addi	a0,a0,-68 # 804135f8 <commands+0x6c4>
80401644:	fe1fe0ef          	jal	ra,80400624 <__panic>
80401648:	aa1ff06f          	j	804010e8 <print_trapframe>
8040164c:	00048693          	mv	a3,s1
80401650:	00012617          	auipc	a2,0x12
80401654:	db860613          	addi	a2,a2,-584 # 80413408 <commands+0x4d4>
80401658:	11000593          	li	a1,272
8040165c:	00012517          	auipc	a0,0x12
80401660:	f9c50513          	addi	a0,a0,-100 # 804135f8 <commands+0x6c4>
80401664:	fc1fe0ef          	jal	ra,80400624 <__panic>
80401668:	00048693          	mv	a3,s1
8040166c:	00012617          	auipc	a2,0x12
80401670:	d9c60613          	addi	a2,a2,-612 # 80413408 <commands+0x4d4>
80401674:	12100593          	li	a1,289
80401678:	00012517          	auipc	a0,0x12
8040167c:	f8050513          	addi	a0,a0,-128 # 804135f8 <commands+0x6c4>
80401680:	fa5fe0ef          	jal	ra,80400624 <__panic>

80401684 <trap>:
80401684:	ff010113          	addi	sp,sp,-16
80401688:	00812423          	sw	s0,8(sp)
8040168c:	0009b417          	auipc	s0,0x9b
80401690:	12040413          	addi	s0,s0,288 # 8049c7ac <current>
80401694:	00042703          	lw	a4,0(s0)
80401698:	00112623          	sw	ra,12(sp)
8040169c:	00912223          	sw	s1,4(sp)
804016a0:	01212023          	sw	s2,0(sp)
804016a4:	08c52683          	lw	a3,140(a0)
804016a8:	04070e63          	beqz	a4,80401704 <trap+0x80>
804016ac:	08052483          	lw	s1,128(a0)
804016b0:	05472903          	lw	s2,84(a4)
804016b4:	04a72a23          	sw	a0,84(a4)
804016b8:	1004f493          	andi	s1,s1,256
804016bc:	0406c063          	bltz	a3,804016fc <trap+0x78>
804016c0:	d5dff0ef          	jal	ra,8040141c <exception_handler>
804016c4:	00042783          	lw	a5,0(s0)
804016c8:	0527aa23          	sw	s2,84(a5)
804016cc:	00049c63          	bnez	s1,804016e4 <trap+0x60>
804016d0:	05c7a703          	lw	a4,92(a5)
804016d4:	00177713          	andi	a4,a4,1
804016d8:	06071c63          	bnez	a4,80401750 <trap+0xcc>
804016dc:	0107a783          	lw	a5,16(a5)
804016e0:	04079c63          	bnez	a5,80401738 <trap+0xb4>
804016e4:	00c12083          	lw	ra,12(sp)
804016e8:	00812403          	lw	s0,8(sp)
804016ec:	00412483          	lw	s1,4(sp)
804016f0:	00012903          	lw	s2,0(sp)
804016f4:	01010113          	addi	sp,sp,16
804016f8:	00008067          	ret
804016fc:	bd5ff0ef          	jal	ra,804012d0 <interrupt_handler>
80401700:	fc5ff06f          	j	804016c4 <trap+0x40>
80401704:	0006ce63          	bltz	a3,80401720 <trap+0x9c>
80401708:	00812403          	lw	s0,8(sp)
8040170c:	00c12083          	lw	ra,12(sp)
80401710:	00412483          	lw	s1,4(sp)
80401714:	00012903          	lw	s2,0(sp)
80401718:	01010113          	addi	sp,sp,16
8040171c:	d01ff06f          	j	8040141c <exception_handler>
80401720:	00812403          	lw	s0,8(sp)
80401724:	00c12083          	lw	ra,12(sp)
80401728:	00412483          	lw	s1,4(sp)
8040172c:	00012903          	lw	s2,0(sp)
80401730:	01010113          	addi	sp,sp,16
80401734:	b9dff06f          	j	804012d0 <interrupt_handler>
80401738:	00812403          	lw	s0,8(sp)
8040173c:	00c12083          	lw	ra,12(sp)
80401740:	00412483          	lw	s1,4(sp)
80401744:	00012903          	lw	s2,0(sp)
80401748:	01010113          	addi	sp,sp,16
8040174c:	5600b06f          	j	8040ccac <schedule>
80401750:	ff700513          	li	a0,-9
80401754:	388060ef          	jal	ra,80407adc <do_exit>
80401758:	00042783          	lw	a5,0(s0)
8040175c:	f81ff06f          	j	804016dc <trap+0x58>

80401760 <__alltraps>:
80401760:	14011173          	csrrw	sp,sscratch,sp
80401764:	00011463          	bnez	sp,8040176c <__alltraps+0xc>
80401768:	14002173          	csrr	sp,sscratch
8040176c:	f7010113          	addi	sp,sp,-144
80401770:	00012023          	sw	zero,0(sp)
80401774:	00112223          	sw	ra,4(sp)
80401778:	00312623          	sw	gp,12(sp)
8040177c:	00412823          	sw	tp,16(sp)
80401780:	00512a23          	sw	t0,20(sp)
80401784:	00612c23          	sw	t1,24(sp)
80401788:	00712e23          	sw	t2,28(sp)
8040178c:	02812023          	sw	s0,32(sp)
80401790:	02912223          	sw	s1,36(sp)
80401794:	02a12423          	sw	a0,40(sp)
80401798:	02b12623          	sw	a1,44(sp)
8040179c:	02c12823          	sw	a2,48(sp)
804017a0:	02d12a23          	sw	a3,52(sp)
804017a4:	02e12c23          	sw	a4,56(sp)
804017a8:	02f12e23          	sw	a5,60(sp)
804017ac:	05012023          	sw	a6,64(sp)
804017b0:	05112223          	sw	a7,68(sp)
804017b4:	05212423          	sw	s2,72(sp)
804017b8:	05312623          	sw	s3,76(sp)
804017bc:	05412823          	sw	s4,80(sp)
804017c0:	05512a23          	sw	s5,84(sp)
804017c4:	05612c23          	sw	s6,88(sp)
804017c8:	05712e23          	sw	s7,92(sp)
804017cc:	07812023          	sw	s8,96(sp)
804017d0:	07912223          	sw	s9,100(sp)
804017d4:	07a12423          	sw	s10,104(sp)
804017d8:	07b12623          	sw	s11,108(sp)
804017dc:	07c12823          	sw	t3,112(sp)
804017e0:	07d12a23          	sw	t4,116(sp)
804017e4:	07e12c23          	sw	t5,120(sp)
804017e8:	07f12e23          	sw	t6,124(sp)
804017ec:	14001473          	csrrw	s0,sscratch,zero
804017f0:	100024f3          	csrr	s1,sstatus
804017f4:	14102973          	csrr	s2,sepc
804017f8:	143029f3          	csrr	s3,stval
804017fc:	14202a73          	csrr	s4,scause
80401800:	00812423          	sw	s0,8(sp)
80401804:	08912023          	sw	s1,128(sp)
80401808:	09212223          	sw	s2,132(sp)
8040180c:	09312423          	sw	s3,136(sp)
80401810:	09412623          	sw	s4,140(sp)
80401814:	00010513          	mv	a0,sp
80401818:	e6dff0ef          	jal	ra,80401684 <trap>

8040181c <__trapret>:
8040181c:	08012483          	lw	s1,128(sp)
80401820:	08412903          	lw	s2,132(sp)
80401824:	1004f413          	andi	s0,s1,256
80401828:	00041663          	bnez	s0,80401834 <__trapret+0x18>
8040182c:	09010413          	addi	s0,sp,144
80401830:	14041073          	csrw	sscratch,s0
80401834:	10049073          	csrw	sstatus,s1
80401838:	14191073          	csrw	sepc,s2
8040183c:	00412083          	lw	ra,4(sp)
80401840:	00c12183          	lw	gp,12(sp)
80401844:	01012203          	lw	tp,16(sp)
80401848:	01412283          	lw	t0,20(sp)
8040184c:	01812303          	lw	t1,24(sp)
80401850:	01c12383          	lw	t2,28(sp)
80401854:	02012403          	lw	s0,32(sp)
80401858:	02412483          	lw	s1,36(sp)
8040185c:	02812503          	lw	a0,40(sp)
80401860:	02c12583          	lw	a1,44(sp)
80401864:	03012603          	lw	a2,48(sp)
80401868:	03412683          	lw	a3,52(sp)
8040186c:	03812703          	lw	a4,56(sp)
80401870:	03c12783          	lw	a5,60(sp)
80401874:	04012803          	lw	a6,64(sp)
80401878:	04412883          	lw	a7,68(sp)
8040187c:	04812903          	lw	s2,72(sp)
80401880:	04c12983          	lw	s3,76(sp)
80401884:	05012a03          	lw	s4,80(sp)
80401888:	05412a83          	lw	s5,84(sp)
8040188c:	05812b03          	lw	s6,88(sp)
80401890:	05c12b83          	lw	s7,92(sp)
80401894:	06012c03          	lw	s8,96(sp)
80401898:	06412c83          	lw	s9,100(sp)
8040189c:	06812d03          	lw	s10,104(sp)
804018a0:	06c12d83          	lw	s11,108(sp)
804018a4:	07012e03          	lw	t3,112(sp)
804018a8:	07412e83          	lw	t4,116(sp)
804018ac:	07812f03          	lw	t5,120(sp)
804018b0:	07c12f83          	lw	t6,124(sp)
804018b4:	00812103          	lw	sp,8(sp)
804018b8:	0ff0000f          	fence
804018bc:	12000073          	sfence.vma
804018c0:	10200073          	sret

804018c4 <forkrets>:
804018c4:	00050113          	mv	sp,a0
804018c8:	10017073          	csrci	sstatus,2
804018cc:	0000100f          	fence.i
804018d0:	00000013          	nop
804018d4:	00000013          	nop
804018d8:	00000013          	nop
804018dc:	00000013          	nop
804018e0:	00000013          	nop
804018e4:	00000013          	nop
804018e8:	00000013          	nop
804018ec:	00000013          	nop
804018f0:	0ff0000f          	fence
804018f4:	0000100f          	fence.i
804018f8:	12000073          	sfence.vma
804018fc:	f21ff06f          	j	8040181c <__trapret>

80401900 <default_init>:
80401900:	0009b797          	auipc	a5,0x9b
80401904:	ef078793          	addi	a5,a5,-272 # 8049c7f0 <free_area>
80401908:	00f7a223          	sw	a5,4(a5)
8040190c:	00f7a023          	sw	a5,0(a5)
80401910:	0007a423          	sw	zero,8(a5)
80401914:	00008067          	ret

80401918 <default_nr_free_pages>:
80401918:	0009b797          	auipc	a5,0x9b
8040191c:	ed878793          	addi	a5,a5,-296 # 8049c7f0 <free_area>
80401920:	0087a503          	lw	a0,8(a5)
80401924:	00008067          	ret

80401928 <default_check>:
80401928:	fd010113          	addi	sp,sp,-48
8040192c:	03212023          	sw	s2,32(sp)
80401930:	0009b917          	auipc	s2,0x9b
80401934:	ec090913          	addi	s2,s2,-320 # 8049c7f0 <free_area>
80401938:	00492783          	lw	a5,4(s2)
8040193c:	02112623          	sw	ra,44(sp)
80401940:	02812423          	sw	s0,40(sp)
80401944:	02912223          	sw	s1,36(sp)
80401948:	01312e23          	sw	s3,28(sp)
8040194c:	01412c23          	sw	s4,24(sp)
80401950:	01512a23          	sw	s5,20(sp)
80401954:	01612823          	sw	s6,16(sp)
80401958:	01712623          	sw	s7,12(sp)
8040195c:	01812423          	sw	s8,8(sp)
80401960:	3d278e63          	beq	a5,s2,80401d3c <default_check+0x414>
80401964:	ff87a703          	lw	a4,-8(a5)
80401968:	00175713          	srli	a4,a4,0x1
8040196c:	00177713          	andi	a4,a4,1
80401970:	3c070e63          	beqz	a4,80401d4c <default_check+0x424>
80401974:	00000413          	li	s0,0
80401978:	00000493          	li	s1,0
8040197c:	0100006f          	j	8040198c <default_check+0x64>
80401980:	ff87a703          	lw	a4,-8(a5)
80401984:	00277713          	andi	a4,a4,2
80401988:	3c070263          	beqz	a4,80401d4c <default_check+0x424>
8040198c:	ffc7a703          	lw	a4,-4(a5)
80401990:	0047a783          	lw	a5,4(a5)
80401994:	00148493          	addi	s1,s1,1
80401998:	00e40433          	add	s0,s0,a4
8040199c:	00040993          	mv	s3,s0
804019a0:	ff2790e3          	bne	a5,s2,80401980 <default_check+0x58>
804019a4:	59c010ef          	jal	ra,80402f40 <nr_free_pages>
804019a8:	013512e3          	bne	a0,s3,804021ac <default_check+0x884>
804019ac:	00100513          	li	a0,1
804019b0:	45c010ef          	jal	ra,80402e0c <alloc_pages>
804019b4:	00050a13          	mv	s4,a0
804019b8:	52050a63          	beqz	a0,80401eec <default_check+0x5c4>
804019bc:	00100513          	li	a0,1
804019c0:	44c010ef          	jal	ra,80402e0c <alloc_pages>
804019c4:	00050993          	mv	s3,a0
804019c8:	000502e3          	beqz	a0,804021cc <default_check+0x8a4>
804019cc:	00100513          	li	a0,1
804019d0:	43c010ef          	jal	ra,80402e0c <alloc_pages>
804019d4:	00050a93          	mv	s5,a0
804019d8:	58050a63          	beqz	a0,80401f6c <default_check+0x644>
804019dc:	393a0863          	beq	s4,s3,80401d6c <default_check+0x444>
804019e0:	38aa0663          	beq	s4,a0,80401d6c <default_check+0x444>
804019e4:	38a98463          	beq	s3,a0,80401d6c <default_check+0x444>
804019e8:	000a2783          	lw	a5,0(s4)
804019ec:	3a079063          	bnez	a5,80401d8c <default_check+0x464>
804019f0:	0009a783          	lw	a5,0(s3)
804019f4:	38079c63          	bnez	a5,80401d8c <default_check+0x464>
804019f8:	00052783          	lw	a5,0(a0)
804019fc:	38079863          	bnez	a5,80401d8c <default_check+0x464>
80401a00:	0009b797          	auipc	a5,0x9b
80401a04:	e0878793          	addi	a5,a5,-504 # 8049c808 <pages>
80401a08:	0007a783          	lw	a5,0(a5)
80401a0c:	00015717          	auipc	a4,0x15
80401a10:	01870713          	addi	a4,a4,24 # 80416a24 <nbase>
80401a14:	00072603          	lw	a2,0(a4)
80401a18:	0009b717          	auipc	a4,0x9b
80401a1c:	d8070713          	addi	a4,a4,-640 # 8049c798 <npage>
80401a20:	00072683          	lw	a3,0(a4)
80401a24:	40fa0733          	sub	a4,s4,a5
80401a28:	40575713          	srai	a4,a4,0x5
80401a2c:	00c70733          	add	a4,a4,a2
80401a30:	00c69693          	slli	a3,a3,0xc
80401a34:	00c71713          	slli	a4,a4,0xc
80401a38:	36d77a63          	bgeu	a4,a3,80401dac <default_check+0x484>
80401a3c:	40f98733          	sub	a4,s3,a5
80401a40:	40575713          	srai	a4,a4,0x5
80401a44:	00c70733          	add	a4,a4,a2
80401a48:	00c71713          	slli	a4,a4,0xc
80401a4c:	5ad77063          	bgeu	a4,a3,80401fec <default_check+0x6c4>
80401a50:	40f507b3          	sub	a5,a0,a5
80401a54:	4057d793          	srai	a5,a5,0x5
80401a58:	00c787b3          	add	a5,a5,a2
80401a5c:	00c79793          	slli	a5,a5,0xc
80401a60:	3ed7f663          	bgeu	a5,a3,80401e4c <default_check+0x524>
80401a64:	00100513          	li	a0,1
80401a68:	00092c03          	lw	s8,0(s2)
80401a6c:	00492b83          	lw	s7,4(s2)
80401a70:	00892b03          	lw	s6,8(s2)
80401a74:	0009b797          	auipc	a5,0x9b
80401a78:	d927a023          	sw	s2,-640(a5) # 8049c7f4 <free_area+0x4>
80401a7c:	0009b797          	auipc	a5,0x9b
80401a80:	d727aa23          	sw	s2,-652(a5) # 8049c7f0 <free_area>
80401a84:	0009b797          	auipc	a5,0x9b
80401a88:	d607aa23          	sw	zero,-652(a5) # 8049c7f8 <free_area+0x8>
80401a8c:	380010ef          	jal	ra,80402e0c <alloc_pages>
80401a90:	38051e63          	bnez	a0,80401e2c <default_check+0x504>
80401a94:	00100593          	li	a1,1
80401a98:	000a0513          	mv	a0,s4
80401a9c:	438010ef          	jal	ra,80402ed4 <free_pages>
80401aa0:	00100593          	li	a1,1
80401aa4:	00098513          	mv	a0,s3
80401aa8:	42c010ef          	jal	ra,80402ed4 <free_pages>
80401aac:	00100593          	li	a1,1
80401ab0:	000a8513          	mv	a0,s5
80401ab4:	420010ef          	jal	ra,80402ed4 <free_pages>
80401ab8:	00892703          	lw	a4,8(s2)
80401abc:	00300793          	li	a5,3
80401ac0:	34f71663          	bne	a4,a5,80401e0c <default_check+0x4e4>
80401ac4:	00100513          	li	a0,1
80401ac8:	344010ef          	jal	ra,80402e0c <alloc_pages>
80401acc:	00050993          	mv	s3,a0
80401ad0:	30050e63          	beqz	a0,80401dec <default_check+0x4c4>
80401ad4:	00100513          	li	a0,1
80401ad8:	334010ef          	jal	ra,80402e0c <alloc_pages>
80401adc:	00050a93          	mv	s5,a0
80401ae0:	46050663          	beqz	a0,80401f4c <default_check+0x624>
80401ae4:	00100513          	li	a0,1
80401ae8:	324010ef          	jal	ra,80402e0c <alloc_pages>
80401aec:	00050a13          	mv	s4,a0
80401af0:	42050e63          	beqz	a0,80401f2c <default_check+0x604>
80401af4:	00100513          	li	a0,1
80401af8:	314010ef          	jal	ra,80402e0c <alloc_pages>
80401afc:	40051863          	bnez	a0,80401f0c <default_check+0x5e4>
80401b00:	00100593          	li	a1,1
80401b04:	00098513          	mv	a0,s3
80401b08:	3cc010ef          	jal	ra,80402ed4 <free_pages>
80401b0c:	00492783          	lw	a5,4(s2)
80401b10:	2b278e63          	beq	a5,s2,80401dcc <default_check+0x4a4>
80401b14:	00100513          	li	a0,1
80401b18:	2f4010ef          	jal	ra,80402e0c <alloc_pages>
80401b1c:	3aa99863          	bne	s3,a0,80401ecc <default_check+0x5a4>
80401b20:	00100513          	li	a0,1
80401b24:	2e8010ef          	jal	ra,80402e0c <alloc_pages>
80401b28:	38051263          	bnez	a0,80401eac <default_check+0x584>
80401b2c:	00892783          	lw	a5,8(s2)
80401b30:	34079e63          	bnez	a5,80401e8c <default_check+0x564>
80401b34:	00098513          	mv	a0,s3
80401b38:	00100593          	li	a1,1
80401b3c:	0009b797          	auipc	a5,0x9b
80401b40:	cb87aa23          	sw	s8,-844(a5) # 8049c7f0 <free_area>
80401b44:	0009b797          	auipc	a5,0x9b
80401b48:	cb77a823          	sw	s7,-848(a5) # 8049c7f4 <free_area+0x4>
80401b4c:	0009b797          	auipc	a5,0x9b
80401b50:	cb67a623          	sw	s6,-852(a5) # 8049c7f8 <free_area+0x8>
80401b54:	380010ef          	jal	ra,80402ed4 <free_pages>
80401b58:	00100593          	li	a1,1
80401b5c:	000a8513          	mv	a0,s5
80401b60:	374010ef          	jal	ra,80402ed4 <free_pages>
80401b64:	00100593          	li	a1,1
80401b68:	000a0513          	mv	a0,s4
80401b6c:	368010ef          	jal	ra,80402ed4 <free_pages>
80401b70:	00500513          	li	a0,5
80401b74:	298010ef          	jal	ra,80402e0c <alloc_pages>
80401b78:	00050993          	mv	s3,a0
80401b7c:	2e050863          	beqz	a0,80401e6c <default_check+0x544>
80401b80:	00452783          	lw	a5,4(a0)
80401b84:	0017d793          	srli	a5,a5,0x1
80401b88:	0017f793          	andi	a5,a5,1
80401b8c:	5c079063          	bnez	a5,8040214c <default_check+0x824>
80401b90:	00100513          	li	a0,1
80401b94:	00092b03          	lw	s6,0(s2)
80401b98:	00492a83          	lw	s5,4(s2)
80401b9c:	0009b797          	auipc	a5,0x9b
80401ba0:	c527aa23          	sw	s2,-940(a5) # 8049c7f0 <free_area>
80401ba4:	0009b797          	auipc	a5,0x9b
80401ba8:	c527a823          	sw	s2,-944(a5) # 8049c7f4 <free_area+0x4>
80401bac:	260010ef          	jal	ra,80402e0c <alloc_pages>
80401bb0:	56051e63          	bnez	a0,8040212c <default_check+0x804>
80401bb4:	04098a13          	addi	s4,s3,64
80401bb8:	000a0513          	mv	a0,s4
80401bbc:	00300593          	li	a1,3
80401bc0:	00892b83          	lw	s7,8(s2)
80401bc4:	0009b797          	auipc	a5,0x9b
80401bc8:	c207aa23          	sw	zero,-972(a5) # 8049c7f8 <free_area+0x8>
80401bcc:	308010ef          	jal	ra,80402ed4 <free_pages>
80401bd0:	00400513          	li	a0,4
80401bd4:	238010ef          	jal	ra,80402e0c <alloc_pages>
80401bd8:	52051a63          	bnez	a0,8040210c <default_check+0x7e4>
80401bdc:	0449a783          	lw	a5,68(s3)
80401be0:	0017d793          	srli	a5,a5,0x1
80401be4:	0017f793          	andi	a5,a5,1
80401be8:	50078263          	beqz	a5,804020ec <default_check+0x7c4>
80401bec:	0489a703          	lw	a4,72(s3)
80401bf0:	00300793          	li	a5,3
80401bf4:	4ef71c63          	bne	a4,a5,804020ec <default_check+0x7c4>
80401bf8:	00300513          	li	a0,3
80401bfc:	210010ef          	jal	ra,80402e0c <alloc_pages>
80401c00:	00050c13          	mv	s8,a0
80401c04:	4c050463          	beqz	a0,804020cc <default_check+0x7a4>
80401c08:	00100513          	li	a0,1
80401c0c:	200010ef          	jal	ra,80402e0c <alloc_pages>
80401c10:	48051e63          	bnez	a0,804020ac <default_check+0x784>
80401c14:	478a1c63          	bne	s4,s8,8040208c <default_check+0x764>
80401c18:	00100593          	li	a1,1
80401c1c:	00098513          	mv	a0,s3
80401c20:	2b4010ef          	jal	ra,80402ed4 <free_pages>
80401c24:	00300593          	li	a1,3
80401c28:	000a0513          	mv	a0,s4
80401c2c:	2a8010ef          	jal	ra,80402ed4 <free_pages>
80401c30:	0049a783          	lw	a5,4(s3)
80401c34:	02098c13          	addi	s8,s3,32
80401c38:	0017d793          	srli	a5,a5,0x1
80401c3c:	0017f793          	andi	a5,a5,1
80401c40:	42078663          	beqz	a5,8040206c <default_check+0x744>
80401c44:	0089a703          	lw	a4,8(s3)
80401c48:	00100793          	li	a5,1
80401c4c:	42f71063          	bne	a4,a5,8040206c <default_check+0x744>
80401c50:	004a2783          	lw	a5,4(s4)
80401c54:	0017d793          	srli	a5,a5,0x1
80401c58:	0017f793          	andi	a5,a5,1
80401c5c:	3e078863          	beqz	a5,8040204c <default_check+0x724>
80401c60:	008a2703          	lw	a4,8(s4)
80401c64:	00300793          	li	a5,3
80401c68:	3ef71263          	bne	a4,a5,8040204c <default_check+0x724>
80401c6c:	00100513          	li	a0,1
80401c70:	19c010ef          	jal	ra,80402e0c <alloc_pages>
80401c74:	3aa99c63          	bne	s3,a0,8040202c <default_check+0x704>
80401c78:	00100593          	li	a1,1
80401c7c:	258010ef          	jal	ra,80402ed4 <free_pages>
80401c80:	00200513          	li	a0,2
80401c84:	188010ef          	jal	ra,80402e0c <alloc_pages>
80401c88:	38aa1263          	bne	s4,a0,8040200c <default_check+0x6e4>
80401c8c:	00200593          	li	a1,2
80401c90:	244010ef          	jal	ra,80402ed4 <free_pages>
80401c94:	00100593          	li	a1,1
80401c98:	000c0513          	mv	a0,s8
80401c9c:	238010ef          	jal	ra,80402ed4 <free_pages>
80401ca0:	00500513          	li	a0,5
80401ca4:	168010ef          	jal	ra,80402e0c <alloc_pages>
80401ca8:	00050993          	mv	s3,a0
80401cac:	4c050063          	beqz	a0,8040216c <default_check+0x844>
80401cb0:	00100513          	li	a0,1
80401cb4:	158010ef          	jal	ra,80402e0c <alloc_pages>
80401cb8:	30051a63          	bnez	a0,80401fcc <default_check+0x6a4>
80401cbc:	00892783          	lw	a5,8(s2)
80401cc0:	2e079663          	bnez	a5,80401fac <default_check+0x684>
80401cc4:	00500593          	li	a1,5
80401cc8:	00098513          	mv	a0,s3
80401ccc:	0009b797          	auipc	a5,0x9b
80401cd0:	b377a623          	sw	s7,-1236(a5) # 8049c7f8 <free_area+0x8>
80401cd4:	0009b797          	auipc	a5,0x9b
80401cd8:	b167ae23          	sw	s6,-1252(a5) # 8049c7f0 <free_area>
80401cdc:	0009b797          	auipc	a5,0x9b
80401ce0:	b157ac23          	sw	s5,-1256(a5) # 8049c7f4 <free_area+0x4>
80401ce4:	1f0010ef          	jal	ra,80402ed4 <free_pages>
80401ce8:	00492783          	lw	a5,4(s2)
80401cec:	01278c63          	beq	a5,s2,80401d04 <default_check+0x3dc>
80401cf0:	ffc7a703          	lw	a4,-4(a5)
80401cf4:	0047a783          	lw	a5,4(a5)
80401cf8:	fff48493          	addi	s1,s1,-1
80401cfc:	40e40433          	sub	s0,s0,a4
80401d00:	ff2798e3          	bne	a5,s2,80401cf0 <default_check+0x3c8>
80401d04:	28049463          	bnez	s1,80401f8c <default_check+0x664>
80401d08:	48041263          	bnez	s0,8040218c <default_check+0x864>
80401d0c:	02c12083          	lw	ra,44(sp)
80401d10:	02812403          	lw	s0,40(sp)
80401d14:	02412483          	lw	s1,36(sp)
80401d18:	02012903          	lw	s2,32(sp)
80401d1c:	01c12983          	lw	s3,28(sp)
80401d20:	01812a03          	lw	s4,24(sp)
80401d24:	01412a83          	lw	s5,20(sp)
80401d28:	01012b03          	lw	s6,16(sp)
80401d2c:	00c12b83          	lw	s7,12(sp)
80401d30:	00812c03          	lw	s8,8(sp)
80401d34:	03010113          	addi	sp,sp,48
80401d38:	00008067          	ret
80401d3c:	00000993          	li	s3,0
80401d40:	00000413          	li	s0,0
80401d44:	00000493          	li	s1,0
80401d48:	c5dff06f          	j	804019a4 <default_check+0x7c>
80401d4c:	00012697          	auipc	a3,0x12
80401d50:	bbc68693          	addi	a3,a3,-1092 # 80413908 <commands+0x9d4>
80401d54:	00011617          	auipc	a2,0x11
80401d58:	3d860613          	addi	a2,a2,984 # 8041312c <commands+0x1f8>
80401d5c:	0f000593          	li	a1,240
80401d60:	00012517          	auipc	a0,0x12
80401d64:	bb850513          	addi	a0,a0,-1096 # 80413918 <commands+0x9e4>
80401d68:	8bdfe0ef          	jal	ra,80400624 <__panic>
80401d6c:	00012697          	auipc	a3,0x12
80401d70:	c3468693          	addi	a3,a3,-972 # 804139a0 <commands+0xa6c>
80401d74:	00011617          	auipc	a2,0x11
80401d78:	3b860613          	addi	a2,a2,952 # 8041312c <commands+0x1f8>
80401d7c:	0bd00593          	li	a1,189
80401d80:	00012517          	auipc	a0,0x12
80401d84:	b9850513          	addi	a0,a0,-1128 # 80413918 <commands+0x9e4>
80401d88:	89dfe0ef          	jal	ra,80400624 <__panic>
80401d8c:	00012697          	auipc	a3,0x12
80401d90:	c3868693          	addi	a3,a3,-968 # 804139c4 <commands+0xa90>
80401d94:	00011617          	auipc	a2,0x11
80401d98:	39860613          	addi	a2,a2,920 # 8041312c <commands+0x1f8>
80401d9c:	0be00593          	li	a1,190
80401da0:	00012517          	auipc	a0,0x12
80401da4:	b7850513          	addi	a0,a0,-1160 # 80413918 <commands+0x9e4>
80401da8:	87dfe0ef          	jal	ra,80400624 <__panic>
80401dac:	00012697          	auipc	a3,0x12
80401db0:	c5468693          	addi	a3,a3,-940 # 80413a00 <commands+0xacc>
80401db4:	00011617          	auipc	a2,0x11
80401db8:	37860613          	addi	a2,a2,888 # 8041312c <commands+0x1f8>
80401dbc:	0c000593          	li	a1,192
80401dc0:	00012517          	auipc	a0,0x12
80401dc4:	b5850513          	addi	a0,a0,-1192 # 80413918 <commands+0x9e4>
80401dc8:	85dfe0ef          	jal	ra,80400624 <__panic>
80401dcc:	00012697          	auipc	a3,0x12
80401dd0:	cbc68693          	addi	a3,a3,-836 # 80413a88 <commands+0xb54>
80401dd4:	00011617          	auipc	a2,0x11
80401dd8:	35860613          	addi	a2,a2,856 # 8041312c <commands+0x1f8>
80401ddc:	0d900593          	li	a1,217
80401de0:	00012517          	auipc	a0,0x12
80401de4:	b3850513          	addi	a0,a0,-1224 # 80413918 <commands+0x9e4>
80401de8:	83dfe0ef          	jal	ra,80400624 <__panic>
80401dec:	00012697          	auipc	a3,0x12
80401df0:	b6068693          	addi	a3,a3,-1184 # 8041394c <commands+0xa18>
80401df4:	00011617          	auipc	a2,0x11
80401df8:	33860613          	addi	a2,a2,824 # 8041312c <commands+0x1f8>
80401dfc:	0d200593          	li	a1,210
80401e00:	00012517          	auipc	a0,0x12
80401e04:	b1850513          	addi	a0,a0,-1256 # 80413918 <commands+0x9e4>
80401e08:	81dfe0ef          	jal	ra,80400624 <__panic>
80401e0c:	00012697          	auipc	a3,0x12
80401e10:	c6c68693          	addi	a3,a3,-916 # 80413a78 <commands+0xb44>
80401e14:	00011617          	auipc	a2,0x11
80401e18:	31860613          	addi	a2,a2,792 # 8041312c <commands+0x1f8>
80401e1c:	0d000593          	li	a1,208
80401e20:	00012517          	auipc	a0,0x12
80401e24:	af850513          	addi	a0,a0,-1288 # 80413918 <commands+0x9e4>
80401e28:	ffcfe0ef          	jal	ra,80400624 <__panic>
80401e2c:	00012697          	auipc	a3,0x12
80401e30:	c3468693          	addi	a3,a3,-972 # 80413a60 <commands+0xb2c>
80401e34:	00011617          	auipc	a2,0x11
80401e38:	2f860613          	addi	a2,a2,760 # 8041312c <commands+0x1f8>
80401e3c:	0cb00593          	li	a1,203
80401e40:	00012517          	auipc	a0,0x12
80401e44:	ad850513          	addi	a0,a0,-1320 # 80413918 <commands+0x9e4>
80401e48:	fdcfe0ef          	jal	ra,80400624 <__panic>
80401e4c:	00012697          	auipc	a3,0x12
80401e50:	bf468693          	addi	a3,a3,-1036 # 80413a40 <commands+0xb0c>
80401e54:	00011617          	auipc	a2,0x11
80401e58:	2d860613          	addi	a2,a2,728 # 8041312c <commands+0x1f8>
80401e5c:	0c200593          	li	a1,194
80401e60:	00012517          	auipc	a0,0x12
80401e64:	ab850513          	addi	a0,a0,-1352 # 80413918 <commands+0x9e4>
80401e68:	fbcfe0ef          	jal	ra,80400624 <__panic>
80401e6c:	00012697          	auipc	a3,0x12
80401e70:	c6068693          	addi	a3,a3,-928 # 80413acc <commands+0xb98>
80401e74:	00011617          	auipc	a2,0x11
80401e78:	2b860613          	addi	a2,a2,696 # 8041312c <commands+0x1f8>
80401e7c:	0f800593          	li	a1,248
80401e80:	00012517          	auipc	a0,0x12
80401e84:	a9850513          	addi	a0,a0,-1384 # 80413918 <commands+0x9e4>
80401e88:	f9cfe0ef          	jal	ra,80400624 <__panic>
80401e8c:	00012697          	auipc	a3,0x12
80401e90:	c3068693          	addi	a3,a3,-976 # 80413abc <commands+0xb88>
80401e94:	00011617          	auipc	a2,0x11
80401e98:	29860613          	addi	a2,a2,664 # 8041312c <commands+0x1f8>
80401e9c:	0df00593          	li	a1,223
80401ea0:	00012517          	auipc	a0,0x12
80401ea4:	a7850513          	addi	a0,a0,-1416 # 80413918 <commands+0x9e4>
80401ea8:	f7cfe0ef          	jal	ra,80400624 <__panic>
80401eac:	00012697          	auipc	a3,0x12
80401eb0:	bb468693          	addi	a3,a3,-1100 # 80413a60 <commands+0xb2c>
80401eb4:	00011617          	auipc	a2,0x11
80401eb8:	27860613          	addi	a2,a2,632 # 8041312c <commands+0x1f8>
80401ebc:	0dd00593          	li	a1,221
80401ec0:	00012517          	auipc	a0,0x12
80401ec4:	a5850513          	addi	a0,a0,-1448 # 80413918 <commands+0x9e4>
80401ec8:	f5cfe0ef          	jal	ra,80400624 <__panic>
80401ecc:	00012697          	auipc	a3,0x12
80401ed0:	bd468693          	addi	a3,a3,-1068 # 80413aa0 <commands+0xb6c>
80401ed4:	00011617          	auipc	a2,0x11
80401ed8:	25860613          	addi	a2,a2,600 # 8041312c <commands+0x1f8>
80401edc:	0dc00593          	li	a1,220
80401ee0:	00012517          	auipc	a0,0x12
80401ee4:	a3850513          	addi	a0,a0,-1480 # 80413918 <commands+0x9e4>
80401ee8:	f3cfe0ef          	jal	ra,80400624 <__panic>
80401eec:	00012697          	auipc	a3,0x12
80401ef0:	a6068693          	addi	a3,a3,-1440 # 8041394c <commands+0xa18>
80401ef4:	00011617          	auipc	a2,0x11
80401ef8:	23860613          	addi	a2,a2,568 # 8041312c <commands+0x1f8>
80401efc:	0b900593          	li	a1,185
80401f00:	00012517          	auipc	a0,0x12
80401f04:	a1850513          	addi	a0,a0,-1512 # 80413918 <commands+0x9e4>
80401f08:	f1cfe0ef          	jal	ra,80400624 <__panic>
80401f0c:	00012697          	auipc	a3,0x12
80401f10:	b5468693          	addi	a3,a3,-1196 # 80413a60 <commands+0xb2c>
80401f14:	00011617          	auipc	a2,0x11
80401f18:	21860613          	addi	a2,a2,536 # 8041312c <commands+0x1f8>
80401f1c:	0d600593          	li	a1,214
80401f20:	00012517          	auipc	a0,0x12
80401f24:	9f850513          	addi	a0,a0,-1544 # 80413918 <commands+0x9e4>
80401f28:	efcfe0ef          	jal	ra,80400624 <__panic>
80401f2c:	00012697          	auipc	a3,0x12
80401f30:	a5868693          	addi	a3,a3,-1448 # 80413984 <commands+0xa50>
80401f34:	00011617          	auipc	a2,0x11
80401f38:	1f860613          	addi	a2,a2,504 # 8041312c <commands+0x1f8>
80401f3c:	0d400593          	li	a1,212
80401f40:	00012517          	auipc	a0,0x12
80401f44:	9d850513          	addi	a0,a0,-1576 # 80413918 <commands+0x9e4>
80401f48:	edcfe0ef          	jal	ra,80400624 <__panic>
80401f4c:	00012697          	auipc	a3,0x12
80401f50:	a1c68693          	addi	a3,a3,-1508 # 80413968 <commands+0xa34>
80401f54:	00011617          	auipc	a2,0x11
80401f58:	1d860613          	addi	a2,a2,472 # 8041312c <commands+0x1f8>
80401f5c:	0d300593          	li	a1,211
80401f60:	00012517          	auipc	a0,0x12
80401f64:	9b850513          	addi	a0,a0,-1608 # 80413918 <commands+0x9e4>
80401f68:	ebcfe0ef          	jal	ra,80400624 <__panic>
80401f6c:	00012697          	auipc	a3,0x12
80401f70:	a1868693          	addi	a3,a3,-1512 # 80413984 <commands+0xa50>
80401f74:	00011617          	auipc	a2,0x11
80401f78:	1b860613          	addi	a2,a2,440 # 8041312c <commands+0x1f8>
80401f7c:	0bb00593          	li	a1,187
80401f80:	00012517          	auipc	a0,0x12
80401f84:	99850513          	addi	a0,a0,-1640 # 80413918 <commands+0x9e4>
80401f88:	e9cfe0ef          	jal	ra,80400624 <__panic>
80401f8c:	00012697          	auipc	a3,0x12
80401f90:	c8468693          	addi	a3,a3,-892 # 80413c10 <commands+0xcdc>
80401f94:	00011617          	auipc	a2,0x11
80401f98:	19860613          	addi	a2,a2,408 # 8041312c <commands+0x1f8>
80401f9c:	12500593          	li	a1,293
80401fa0:	00012517          	auipc	a0,0x12
80401fa4:	97850513          	addi	a0,a0,-1672 # 80413918 <commands+0x9e4>
80401fa8:	e7cfe0ef          	jal	ra,80400624 <__panic>
80401fac:	00012697          	auipc	a3,0x12
80401fb0:	b1068693          	addi	a3,a3,-1264 # 80413abc <commands+0xb88>
80401fb4:	00011617          	auipc	a2,0x11
80401fb8:	17860613          	addi	a2,a2,376 # 8041312c <commands+0x1f8>
80401fbc:	11a00593          	li	a1,282
80401fc0:	00012517          	auipc	a0,0x12
80401fc4:	95850513          	addi	a0,a0,-1704 # 80413918 <commands+0x9e4>
80401fc8:	e5cfe0ef          	jal	ra,80400624 <__panic>
80401fcc:	00012697          	auipc	a3,0x12
80401fd0:	a9468693          	addi	a3,a3,-1388 # 80413a60 <commands+0xb2c>
80401fd4:	00011617          	auipc	a2,0x11
80401fd8:	15860613          	addi	a2,a2,344 # 8041312c <commands+0x1f8>
80401fdc:	11800593          	li	a1,280
80401fe0:	00012517          	auipc	a0,0x12
80401fe4:	93850513          	addi	a0,a0,-1736 # 80413918 <commands+0x9e4>
80401fe8:	e3cfe0ef          	jal	ra,80400624 <__panic>
80401fec:	00012697          	auipc	a3,0x12
80401ff0:	a3468693          	addi	a3,a3,-1484 # 80413a20 <commands+0xaec>
80401ff4:	00011617          	auipc	a2,0x11
80401ff8:	13860613          	addi	a2,a2,312 # 8041312c <commands+0x1f8>
80401ffc:	0c100593          	li	a1,193
80402000:	00012517          	auipc	a0,0x12
80402004:	91850513          	addi	a0,a0,-1768 # 80413918 <commands+0x9e4>
80402008:	e1cfe0ef          	jal	ra,80400624 <__panic>
8040200c:	00012697          	auipc	a3,0x12
80402010:	bc468693          	addi	a3,a3,-1084 # 80413bd0 <commands+0xc9c>
80402014:	00011617          	auipc	a2,0x11
80402018:	11860613          	addi	a2,a2,280 # 8041312c <commands+0x1f8>
8040201c:	11200593          	li	a1,274
80402020:	00012517          	auipc	a0,0x12
80402024:	8f850513          	addi	a0,a0,-1800 # 80413918 <commands+0x9e4>
80402028:	dfcfe0ef          	jal	ra,80400624 <__panic>
8040202c:	00012697          	auipc	a3,0x12
80402030:	b8468693          	addi	a3,a3,-1148 # 80413bb0 <commands+0xc7c>
80402034:	00011617          	auipc	a2,0x11
80402038:	0f860613          	addi	a2,a2,248 # 8041312c <commands+0x1f8>
8040203c:	11000593          	li	a1,272
80402040:	00012517          	auipc	a0,0x12
80402044:	8d850513          	addi	a0,a0,-1832 # 80413918 <commands+0x9e4>
80402048:	ddcfe0ef          	jal	ra,80400624 <__panic>
8040204c:	00012697          	auipc	a3,0x12
80402050:	b3c68693          	addi	a3,a3,-1220 # 80413b88 <commands+0xc54>
80402054:	00011617          	auipc	a2,0x11
80402058:	0d860613          	addi	a2,a2,216 # 8041312c <commands+0x1f8>
8040205c:	10e00593          	li	a1,270
80402060:	00012517          	auipc	a0,0x12
80402064:	8b850513          	addi	a0,a0,-1864 # 80413918 <commands+0x9e4>
80402068:	dbcfe0ef          	jal	ra,80400624 <__panic>
8040206c:	00012697          	auipc	a3,0x12
80402070:	af468693          	addi	a3,a3,-1292 # 80413b60 <commands+0xc2c>
80402074:	00011617          	auipc	a2,0x11
80402078:	0b860613          	addi	a2,a2,184 # 8041312c <commands+0x1f8>
8040207c:	10d00593          	li	a1,269
80402080:	00012517          	auipc	a0,0x12
80402084:	89850513          	addi	a0,a0,-1896 # 80413918 <commands+0x9e4>
80402088:	d9cfe0ef          	jal	ra,80400624 <__panic>
8040208c:	00012697          	auipc	a3,0x12
80402090:	ac468693          	addi	a3,a3,-1340 # 80413b50 <commands+0xc1c>
80402094:	00011617          	auipc	a2,0x11
80402098:	09860613          	addi	a2,a2,152 # 8041312c <commands+0x1f8>
8040209c:	10800593          	li	a1,264
804020a0:	00012517          	auipc	a0,0x12
804020a4:	87850513          	addi	a0,a0,-1928 # 80413918 <commands+0x9e4>
804020a8:	d7cfe0ef          	jal	ra,80400624 <__panic>
804020ac:	00012697          	auipc	a3,0x12
804020b0:	9b468693          	addi	a3,a3,-1612 # 80413a60 <commands+0xb2c>
804020b4:	00011617          	auipc	a2,0x11
804020b8:	07860613          	addi	a2,a2,120 # 8041312c <commands+0x1f8>
804020bc:	10700593          	li	a1,263
804020c0:	00012517          	auipc	a0,0x12
804020c4:	85850513          	addi	a0,a0,-1960 # 80413918 <commands+0x9e4>
804020c8:	d5cfe0ef          	jal	ra,80400624 <__panic>
804020cc:	00012697          	auipc	a3,0x12
804020d0:	a6468693          	addi	a3,a3,-1436 # 80413b30 <commands+0xbfc>
804020d4:	00011617          	auipc	a2,0x11
804020d8:	05860613          	addi	a2,a2,88 # 8041312c <commands+0x1f8>
804020dc:	10600593          	li	a1,262
804020e0:	00012517          	auipc	a0,0x12
804020e4:	83850513          	addi	a0,a0,-1992 # 80413918 <commands+0x9e4>
804020e8:	d3cfe0ef          	jal	ra,80400624 <__panic>
804020ec:	00012697          	auipc	a3,0x12
804020f0:	a1868693          	addi	a3,a3,-1512 # 80413b04 <commands+0xbd0>
804020f4:	00011617          	auipc	a2,0x11
804020f8:	03860613          	addi	a2,a2,56 # 8041312c <commands+0x1f8>
804020fc:	10500593          	li	a1,261
80402100:	00012517          	auipc	a0,0x12
80402104:	81850513          	addi	a0,a0,-2024 # 80413918 <commands+0x9e4>
80402108:	d1cfe0ef          	jal	ra,80400624 <__panic>
8040210c:	00012697          	auipc	a3,0x12
80402110:	9e068693          	addi	a3,a3,-1568 # 80413aec <commands+0xbb8>
80402114:	00011617          	auipc	a2,0x11
80402118:	01860613          	addi	a2,a2,24 # 8041312c <commands+0x1f8>
8040211c:	10400593          	li	a1,260
80402120:	00011517          	auipc	a0,0x11
80402124:	7f850513          	addi	a0,a0,2040 # 80413918 <commands+0x9e4>
80402128:	cfcfe0ef          	jal	ra,80400624 <__panic>
8040212c:	00012697          	auipc	a3,0x12
80402130:	93468693          	addi	a3,a3,-1740 # 80413a60 <commands+0xb2c>
80402134:	00011617          	auipc	a2,0x11
80402138:	ff860613          	addi	a2,a2,-8 # 8041312c <commands+0x1f8>
8040213c:	0fe00593          	li	a1,254
80402140:	00011517          	auipc	a0,0x11
80402144:	7d850513          	addi	a0,a0,2008 # 80413918 <commands+0x9e4>
80402148:	cdcfe0ef          	jal	ra,80400624 <__panic>
8040214c:	00012697          	auipc	a3,0x12
80402150:	98c68693          	addi	a3,a3,-1652 # 80413ad8 <commands+0xba4>
80402154:	00011617          	auipc	a2,0x11
80402158:	fd860613          	addi	a2,a2,-40 # 8041312c <commands+0x1f8>
8040215c:	0f900593          	li	a1,249
80402160:	00011517          	auipc	a0,0x11
80402164:	7b850513          	addi	a0,a0,1976 # 80413918 <commands+0x9e4>
80402168:	cbcfe0ef          	jal	ra,80400624 <__panic>
8040216c:	00012697          	auipc	a3,0x12
80402170:	a8468693          	addi	a3,a3,-1404 # 80413bf0 <commands+0xcbc>
80402174:	00011617          	auipc	a2,0x11
80402178:	fb860613          	addi	a2,a2,-72 # 8041312c <commands+0x1f8>
8040217c:	11700593          	li	a1,279
80402180:	00011517          	auipc	a0,0x11
80402184:	79850513          	addi	a0,a0,1944 # 80413918 <commands+0x9e4>
80402188:	c9cfe0ef          	jal	ra,80400624 <__panic>
8040218c:	00012697          	auipc	a3,0x12
80402190:	a9068693          	addi	a3,a3,-1392 # 80413c1c <commands+0xce8>
80402194:	00011617          	auipc	a2,0x11
80402198:	f9860613          	addi	a2,a2,-104 # 8041312c <commands+0x1f8>
8040219c:	12600593          	li	a1,294
804021a0:	00011517          	auipc	a0,0x11
804021a4:	77850513          	addi	a0,a0,1912 # 80413918 <commands+0x9e4>
804021a8:	c7cfe0ef          	jal	ra,80400624 <__panic>
804021ac:	00011697          	auipc	a3,0x11
804021b0:	78468693          	addi	a3,a3,1924 # 80413930 <commands+0x9fc>
804021b4:	00011617          	auipc	a2,0x11
804021b8:	f7860613          	addi	a2,a2,-136 # 8041312c <commands+0x1f8>
804021bc:	0f300593          	li	a1,243
804021c0:	00011517          	auipc	a0,0x11
804021c4:	75850513          	addi	a0,a0,1880 # 80413918 <commands+0x9e4>
804021c8:	c5cfe0ef          	jal	ra,80400624 <__panic>
804021cc:	00011697          	auipc	a3,0x11
804021d0:	79c68693          	addi	a3,a3,1948 # 80413968 <commands+0xa34>
804021d4:	00011617          	auipc	a2,0x11
804021d8:	f5860613          	addi	a2,a2,-168 # 8041312c <commands+0x1f8>
804021dc:	0ba00593          	li	a1,186
804021e0:	00011517          	auipc	a0,0x11
804021e4:	73850513          	addi	a0,a0,1848 # 80413918 <commands+0x9e4>
804021e8:	c3cfe0ef          	jal	ra,80400624 <__panic>

804021ec <default_free_pages>:
804021ec:	ff010113          	addi	sp,sp,-16
804021f0:	00112623          	sw	ra,12(sp)
804021f4:	1e058863          	beqz	a1,804023e4 <default_free_pages+0x1f8>
804021f8:	00559693          	slli	a3,a1,0x5
804021fc:	00d506b3          	add	a3,a0,a3
80402200:	04d50863          	beq	a0,a3,80402250 <default_free_pages+0x64>
80402204:	00452783          	lw	a5,4(a0)
80402208:	0017f793          	andi	a5,a5,1
8040220c:	1a079c63          	bnez	a5,804023c4 <default_free_pages+0x1d8>
80402210:	00452783          	lw	a5,4(a0)
80402214:	0017d793          	srli	a5,a5,0x1
80402218:	0017f793          	andi	a5,a5,1
8040221c:	1a079463          	bnez	a5,804023c4 <default_free_pages+0x1d8>
80402220:	00050793          	mv	a5,a0
80402224:	01c0006f          	j	80402240 <default_free_pages+0x54>
80402228:	0047a703          	lw	a4,4(a5)
8040222c:	00177713          	andi	a4,a4,1
80402230:	18071a63          	bnez	a4,804023c4 <default_free_pages+0x1d8>
80402234:	0047a703          	lw	a4,4(a5)
80402238:	00277713          	andi	a4,a4,2
8040223c:	18071463          	bnez	a4,804023c4 <default_free_pages+0x1d8>
80402240:	0007a223          	sw	zero,4(a5)
80402244:	0007a023          	sw	zero,0(a5)
80402248:	02078793          	addi	a5,a5,32
8040224c:	fcd79ee3          	bne	a5,a3,80402228 <default_free_pages+0x3c>
80402250:	00452703          	lw	a4,4(a0)
80402254:	0009a697          	auipc	a3,0x9a
80402258:	59c68693          	addi	a3,a3,1436 # 8049c7f0 <free_area>
8040225c:	0046a783          	lw	a5,4(a3)
80402260:	00276713          	ori	a4,a4,2
80402264:	00e52223          	sw	a4,4(a0)
80402268:	0086a703          	lw	a4,8(a3)
8040226c:	00b52423          	sw	a1,8(a0)
80402270:	00b70733          	add	a4,a4,a1
80402274:	0009a617          	auipc	a2,0x9a
80402278:	58e62223          	sw	a4,1412(a2) # 8049c7f8 <free_area+0x8>
8040227c:	0ed78a63          	beq	a5,a3,80402370 <default_free_pages+0x184>
80402280:	ff478713          	addi	a4,a5,-12
80402284:	0006a803          	lw	a6,0(a3)
80402288:	00000893          	li	a7,0
8040228c:	00c50613          	addi	a2,a0,12
80402290:	00e56c63          	bltu	a0,a4,804022a8 <default_free_pages+0xbc>
80402294:	0047a703          	lw	a4,4(a5)
80402298:	06d70663          	beq	a4,a3,80402304 <default_free_pages+0x118>
8040229c:	00070793          	mv	a5,a4
804022a0:	ff478713          	addi	a4,a5,-12
804022a4:	fee578e3          	bgeu	a0,a4,80402294 <default_free_pages+0xa8>
804022a8:	00088663          	beqz	a7,804022b4 <default_free_pages+0xc8>
804022ac:	0009a897          	auipc	a7,0x9a
804022b0:	5508a223          	sw	a6,1348(a7) # 8049c7f0 <free_area>
804022b4:	0007a803          	lw	a6,0(a5)
804022b8:	00c7a023          	sw	a2,0(a5)
804022bc:	00c82223          	sw	a2,4(a6)
804022c0:	00f52823          	sw	a5,16(a0)
804022c4:	01052623          	sw	a6,12(a0)
804022c8:	08d80663          	beq	a6,a3,80402354 <default_free_pages+0x168>
804022cc:	ffc82883          	lw	a7,-4(a6)
804022d0:	ff480613          	addi	a2,a6,-12
804022d4:	00589713          	slli	a4,a7,0x5
804022d8:	00e60733          	add	a4,a2,a4
804022dc:	06e51863          	bne	a0,a4,8040234c <default_free_pages+0x160>
804022e0:	011585b3          	add	a1,a1,a7
804022e4:	feb82e23          	sw	a1,-4(a6)
804022e8:	00452703          	lw	a4,4(a0)
804022ec:	ffd77713          	andi	a4,a4,-3
804022f0:	00e52223          	sw	a4,4(a0)
804022f4:	00f82223          	sw	a5,4(a6)
804022f8:	0107a023          	sw	a6,0(a5)
804022fc:	00060513          	mv	a0,a2
80402300:	04c0006f          	j	8040234c <default_free_pages+0x160>
80402304:	00c7a223          	sw	a2,4(a5)
80402308:	00d52823          	sw	a3,16(a0)
8040230c:	0047a703          	lw	a4,4(a5)
80402310:	00f52623          	sw	a5,12(a0)
80402314:	00060813          	mv	a6,a2
80402318:	00d70863          	beq	a4,a3,80402328 <default_free_pages+0x13c>
8040231c:	00100893          	li	a7,1
80402320:	00070793          	mv	a5,a4
80402324:	f7dff06f          	j	804022a0 <default_free_pages+0xb4>
80402328:	00078813          	mv	a6,a5
8040232c:	00c6a023          	sw	a2,0(a3)
80402330:	00068793          	mv	a5,a3
80402334:	00d80c63          	beq	a6,a3,8040234c <default_free_pages+0x160>
80402338:	ffc82883          	lw	a7,-4(a6)
8040233c:	ff480613          	addi	a2,a6,-12
80402340:	00589713          	slli	a4,a7,0x5
80402344:	00e60733          	add	a4,a2,a4
80402348:	f8e50ce3          	beq	a0,a4,804022e0 <default_free_pages+0xf4>
8040234c:	ff478713          	addi	a4,a5,-12
80402350:	00d78a63          	beq	a5,a3,80402364 <default_free_pages+0x178>
80402354:	00852603          	lw	a2,8(a0)
80402358:	00561693          	slli	a3,a2,0x5
8040235c:	00d506b3          	add	a3,a0,a3
80402360:	02d70863          	beq	a4,a3,80402390 <default_free_pages+0x1a4>
80402364:	00c12083          	lw	ra,12(sp)
80402368:	01010113          	addi	sp,sp,16
8040236c:	00008067          	ret
80402370:	00c12083          	lw	ra,12(sp)
80402374:	00c50713          	addi	a4,a0,12
80402378:	00e7a023          	sw	a4,0(a5)
8040237c:	00e7a223          	sw	a4,4(a5)
80402380:	00f52823          	sw	a5,16(a0)
80402384:	00f52623          	sw	a5,12(a0)
80402388:	01010113          	addi	sp,sp,16
8040238c:	00008067          	ret
80402390:	ffc7a703          	lw	a4,-4(a5)
80402394:	0007a583          	lw	a1,0(a5)
80402398:	0047a683          	lw	a3,4(a5)
8040239c:	00c70633          	add	a2,a4,a2
804023a0:	00c52423          	sw	a2,8(a0)
804023a4:	ff87a703          	lw	a4,-8(a5)
804023a8:	00c12083          	lw	ra,12(sp)
804023ac:	ffd77713          	andi	a4,a4,-3
804023b0:	fee7ac23          	sw	a4,-8(a5)
804023b4:	00d5a223          	sw	a3,4(a1)
804023b8:	00b6a023          	sw	a1,0(a3)
804023bc:	01010113          	addi	sp,sp,16
804023c0:	00008067          	ret
804023c4:	00012697          	auipc	a3,0x12
804023c8:	86468693          	addi	a3,a3,-1948 # 80413c28 <commands+0xcf4>
804023cc:	00011617          	auipc	a2,0x11
804023d0:	d6060613          	addi	a2,a2,-672 # 8041312c <commands+0x1f8>
804023d4:	08300593          	li	a1,131
804023d8:	00011517          	auipc	a0,0x11
804023dc:	54050513          	addi	a0,a0,1344 # 80413918 <commands+0x9e4>
804023e0:	a44fe0ef          	jal	ra,80400624 <__panic>
804023e4:	00012697          	auipc	a3,0x12
804023e8:	86c68693          	addi	a3,a3,-1940 # 80413c50 <commands+0xd1c>
804023ec:	00011617          	auipc	a2,0x11
804023f0:	d4060613          	addi	a2,a2,-704 # 8041312c <commands+0x1f8>
804023f4:	08000593          	li	a1,128
804023f8:	00011517          	auipc	a0,0x11
804023fc:	52050513          	addi	a0,a0,1312 # 80413918 <commands+0x9e4>
80402400:	a24fe0ef          	jal	ra,80400624 <__panic>

80402404 <default_alloc_pages>:
80402404:	0a050263          	beqz	a0,804024a8 <default_alloc_pages+0xa4>
80402408:	0009a617          	auipc	a2,0x9a
8040240c:	3e860613          	addi	a2,a2,1000 # 8049c7f0 <free_area>
80402410:	00862583          	lw	a1,8(a2)
80402414:	00050693          	mv	a3,a0
80402418:	00a5ee63          	bltu	a1,a0,80402434 <default_alloc_pages+0x30>
8040241c:	00060793          	mv	a5,a2
80402420:	00c0006f          	j	8040242c <default_alloc_pages+0x28>
80402424:	ffc7a703          	lw	a4,-4(a5)
80402428:	00d77a63          	bgeu	a4,a3,8040243c <default_alloc_pages+0x38>
8040242c:	0047a783          	lw	a5,4(a5)
80402430:	fec79ae3          	bne	a5,a2,80402424 <default_alloc_pages+0x20>
80402434:	00000513          	li	a0,0
80402438:	00008067          	ret
8040243c:	ff478513          	addi	a0,a5,-12
80402440:	fe050ce3          	beqz	a0,80402438 <default_alloc_pages+0x34>
80402444:	0007a883          	lw	a7,0(a5)
80402448:	0047a303          	lw	t1,4(a5)
8040244c:	0068a223          	sw	t1,4(a7)
80402450:	01132023          	sw	a7,0(t1)
80402454:	02e6fc63          	bgeu	a3,a4,8040248c <default_alloc_pages+0x88>
80402458:	00569813          	slli	a6,a3,0x5
8040245c:	01050833          	add	a6,a0,a6
80402460:	00482583          	lw	a1,4(a6)
80402464:	40d70733          	sub	a4,a4,a3
80402468:	00e82423          	sw	a4,8(a6)
8040246c:	0025e713          	ori	a4,a1,2
80402470:	00e82223          	sw	a4,4(a6)
80402474:	00c80713          	addi	a4,a6,12
80402478:	00e32023          	sw	a4,0(t1)
8040247c:	00862583          	lw	a1,8(a2)
80402480:	00e8a223          	sw	a4,4(a7)
80402484:	00682823          	sw	t1,16(a6)
80402488:	01182623          	sw	a7,12(a6)
8040248c:	40d586b3          	sub	a3,a1,a3
80402490:	0009a717          	auipc	a4,0x9a
80402494:	36d72423          	sw	a3,872(a4) # 8049c7f8 <free_area+0x8>
80402498:	ff87a703          	lw	a4,-8(a5)
8040249c:	ffd77713          	andi	a4,a4,-3
804024a0:	fee7ac23          	sw	a4,-8(a5)
804024a4:	00008067          	ret
804024a8:	ff010113          	addi	sp,sp,-16
804024ac:	00011697          	auipc	a3,0x11
804024b0:	7a468693          	addi	a3,a3,1956 # 80413c50 <commands+0xd1c>
804024b4:	00011617          	auipc	a2,0x11
804024b8:	c7860613          	addi	a2,a2,-904 # 8041312c <commands+0x1f8>
804024bc:	06200593          	li	a1,98
804024c0:	00011517          	auipc	a0,0x11
804024c4:	45850513          	addi	a0,a0,1112 # 80413918 <commands+0x9e4>
804024c8:	00112623          	sw	ra,12(sp)
804024cc:	958fe0ef          	jal	ra,80400624 <__panic>

804024d0 <default_init_memmap>:
804024d0:	ff010113          	addi	sp,sp,-16
804024d4:	00112623          	sw	ra,12(sp)
804024d8:	12058e63          	beqz	a1,80402614 <default_init_memmap+0x144>
804024dc:	00559693          	slli	a3,a1,0x5
804024e0:	00d506b3          	add	a3,a0,a3
804024e4:	02d50c63          	beq	a0,a3,8040251c <default_init_memmap+0x4c>
804024e8:	00452703          	lw	a4,4(a0)
804024ec:	00050793          	mv	a5,a0
804024f0:	00177713          	andi	a4,a4,1
804024f4:	00071a63          	bnez	a4,80402508 <default_init_memmap+0x38>
804024f8:	0fc0006f          	j	804025f4 <default_init_memmap+0x124>
804024fc:	0047a703          	lw	a4,4(a5)
80402500:	00177713          	andi	a4,a4,1
80402504:	0e070863          	beqz	a4,804025f4 <default_init_memmap+0x124>
80402508:	0007a423          	sw	zero,8(a5)
8040250c:	0007a223          	sw	zero,4(a5)
80402510:	0007a023          	sw	zero,0(a5)
80402514:	02078793          	addi	a5,a5,32
80402518:	fed792e3          	bne	a5,a3,804024fc <default_init_memmap+0x2c>
8040251c:	00452703          	lw	a4,4(a0)
80402520:	0009a697          	auipc	a3,0x9a
80402524:	2d068693          	addi	a3,a3,720 # 8049c7f0 <free_area>
80402528:	0046a783          	lw	a5,4(a3)
8040252c:	00276713          	ori	a4,a4,2
80402530:	00e52223          	sw	a4,4(a0)
80402534:	0086a703          	lw	a4,8(a3)
80402538:	00b52423          	sw	a1,8(a0)
8040253c:	00b705b3          	add	a1,a4,a1
80402540:	0009a717          	auipc	a4,0x9a
80402544:	2ab72c23          	sw	a1,696(a4) # 8049c7f8 <free_area+0x8>
80402548:	06d78e63          	beq	a5,a3,804025c4 <default_init_memmap+0xf4>
8040254c:	ff478713          	addi	a4,a5,-12
80402550:	0006a583          	lw	a1,0(a3)
80402554:	00000813          	li	a6,0
80402558:	00c50613          	addi	a2,a0,12
8040255c:	00e56c63          	bltu	a0,a4,80402574 <default_init_memmap+0xa4>
80402560:	0047a703          	lw	a4,4(a5)
80402564:	02d70e63          	beq	a4,a3,804025a0 <default_init_memmap+0xd0>
80402568:	00070793          	mv	a5,a4
8040256c:	ff478713          	addi	a4,a5,-12
80402570:	fee578e3          	bgeu	a0,a4,80402560 <default_init_memmap+0x90>
80402574:	00080663          	beqz	a6,80402580 <default_init_memmap+0xb0>
80402578:	0009a717          	auipc	a4,0x9a
8040257c:	26b72c23          	sw	a1,632(a4) # 8049c7f0 <free_area>
80402580:	0007a703          	lw	a4,0(a5)
80402584:	00c12083          	lw	ra,12(sp)
80402588:	00c7a023          	sw	a2,0(a5)
8040258c:	00c72223          	sw	a2,4(a4)
80402590:	00f52823          	sw	a5,16(a0)
80402594:	00e52623          	sw	a4,12(a0)
80402598:	01010113          	addi	sp,sp,16
8040259c:	00008067          	ret
804025a0:	00c7a223          	sw	a2,4(a5)
804025a4:	00d52823          	sw	a3,16(a0)
804025a8:	0047a703          	lw	a4,4(a5)
804025ac:	00f52623          	sw	a5,12(a0)
804025b0:	00060593          	mv	a1,a2
804025b4:	02d70863          	beq	a4,a3,804025e4 <default_init_memmap+0x114>
804025b8:	00100813          	li	a6,1
804025bc:	00070793          	mv	a5,a4
804025c0:	fadff06f          	j	8040256c <default_init_memmap+0x9c>
804025c4:	00c12083          	lw	ra,12(sp)
804025c8:	00c50713          	addi	a4,a0,12
804025cc:	00e7a023          	sw	a4,0(a5)
804025d0:	00e7a223          	sw	a4,4(a5)
804025d4:	00f52823          	sw	a5,16(a0)
804025d8:	00f52623          	sw	a5,12(a0)
804025dc:	01010113          	addi	sp,sp,16
804025e0:	00008067          	ret
804025e4:	00c12083          	lw	ra,12(sp)
804025e8:	00c6a023          	sw	a2,0(a3)
804025ec:	01010113          	addi	sp,sp,16
804025f0:	00008067          	ret
804025f4:	00011697          	auipc	a3,0x11
804025f8:	66468693          	addi	a3,a3,1636 # 80413c58 <commands+0xd24>
804025fc:	00011617          	auipc	a2,0x11
80402600:	b3060613          	addi	a2,a2,-1232 # 8041312c <commands+0x1f8>
80402604:	04900593          	li	a1,73
80402608:	00011517          	auipc	a0,0x11
8040260c:	31050513          	addi	a0,a0,784 # 80413918 <commands+0x9e4>
80402610:	814fe0ef          	jal	ra,80400624 <__panic>
80402614:	00011697          	auipc	a3,0x11
80402618:	63c68693          	addi	a3,a3,1596 # 80413c50 <commands+0xd1c>
8040261c:	00011617          	auipc	a2,0x11
80402620:	b1060613          	addi	a2,a2,-1264 # 8041312c <commands+0x1f8>
80402624:	04600593          	li	a1,70
80402628:	00011517          	auipc	a0,0x11
8040262c:	2f050513          	addi	a0,a0,752 # 80413918 <commands+0x9e4>
80402630:	ff5fd0ef          	jal	ra,80400624 <__panic>

80402634 <slob_free>:
80402634:	08050063          	beqz	a0,804026b4 <slob_free+0x80>
80402638:	08059063          	bnez	a1,804026b8 <slob_free+0x84>
8040263c:	100027f3          	csrr	a5,sstatus
80402640:	0027f793          	andi	a5,a5,2
80402644:	00000593          	li	a1,0
80402648:	08079663          	bnez	a5,804026d4 <slob_free+0xa0>
8040264c:	00097797          	auipc	a5,0x97
80402650:	9f478793          	addi	a5,a5,-1548 # 80499040 <slobfree>
80402654:	0007a783          	lw	a5,0(a5)
80402658:	0047a703          	lw	a4,4(a5)
8040265c:	00a7fc63          	bgeu	a5,a0,80402674 <slob_free+0x40>
80402660:	00e56e63          	bltu	a0,a4,8040267c <slob_free+0x48>
80402664:	00e7fc63          	bgeu	a5,a4,8040267c <slob_free+0x48>
80402668:	00070793          	mv	a5,a4
8040266c:	0047a703          	lw	a4,4(a5)
80402670:	fea7e8e3          	bltu	a5,a0,80402660 <slob_free+0x2c>
80402674:	fee7eae3          	bltu	a5,a4,80402668 <slob_free+0x34>
80402678:	fee578e3          	bgeu	a0,a4,80402668 <slob_free+0x34>
8040267c:	00052603          	lw	a2,0(a0)
80402680:	00361693          	slli	a3,a2,0x3
80402684:	00d506b3          	add	a3,a0,a3
80402688:	0cd70a63          	beq	a4,a3,8040275c <slob_free+0x128>
8040268c:	0007a683          	lw	a3,0(a5)
80402690:	00e52223          	sw	a4,4(a0)
80402694:	00369713          	slli	a4,a3,0x3
80402698:	00e78733          	add	a4,a5,a4
8040269c:	0ee50263          	beq	a0,a4,80402780 <slob_free+0x14c>
804026a0:	00a7a223          	sw	a0,4(a5)
804026a4:	00097717          	auipc	a4,0x97
804026a8:	98f72e23          	sw	a5,-1636(a4) # 80499040 <slobfree>
804026ac:	00058463          	beqz	a1,804026b4 <slob_free+0x80>
804026b0:	e00fe06f          	j	80400cb0 <intr_enable>
804026b4:	00008067          	ret
804026b8:	00758593          	addi	a1,a1,7
804026bc:	0035d593          	srli	a1,a1,0x3
804026c0:	00b52023          	sw	a1,0(a0)
804026c4:	100027f3          	csrr	a5,sstatus
804026c8:	0027f793          	andi	a5,a5,2
804026cc:	00000593          	li	a1,0
804026d0:	f6078ee3          	beqz	a5,8040264c <slob_free+0x18>
804026d4:	fe010113          	addi	sp,sp,-32
804026d8:	00a12623          	sw	a0,12(sp)
804026dc:	00112e23          	sw	ra,28(sp)
804026e0:	dd8fe0ef          	jal	ra,80400cb8 <intr_disable>
804026e4:	00097797          	auipc	a5,0x97
804026e8:	95c78793          	addi	a5,a5,-1700 # 80499040 <slobfree>
804026ec:	0007a783          	lw	a5,0(a5)
804026f0:	00c12503          	lw	a0,12(sp)
804026f4:	00100593          	li	a1,1
804026f8:	0047a703          	lw	a4,4(a5)
804026fc:	00a7fc63          	bgeu	a5,a0,80402714 <slob_free+0xe0>
80402700:	00e56e63          	bltu	a0,a4,8040271c <slob_free+0xe8>
80402704:	00e7fc63          	bgeu	a5,a4,8040271c <slob_free+0xe8>
80402708:	00070793          	mv	a5,a4
8040270c:	0047a703          	lw	a4,4(a5)
80402710:	fea7e8e3          	bltu	a5,a0,80402700 <slob_free+0xcc>
80402714:	fee7eae3          	bltu	a5,a4,80402708 <slob_free+0xd4>
80402718:	fee578e3          	bgeu	a0,a4,80402708 <slob_free+0xd4>
8040271c:	00052603          	lw	a2,0(a0)
80402720:	00361693          	slli	a3,a2,0x3
80402724:	00d506b3          	add	a3,a0,a3
80402728:	06d70e63          	beq	a4,a3,804027a4 <slob_free+0x170>
8040272c:	00e52223          	sw	a4,4(a0)
80402730:	0007a683          	lw	a3,0(a5)
80402734:	00369713          	slli	a4,a3,0x3
80402738:	00e78733          	add	a4,a5,a4
8040273c:	08e50063          	beq	a0,a4,804027bc <slob_free+0x188>
80402740:	00a7a223          	sw	a0,4(a5)
80402744:	00097717          	auipc	a4,0x97
80402748:	8ef72e23          	sw	a5,-1796(a4) # 80499040 <slobfree>
8040274c:	04059663          	bnez	a1,80402798 <slob_free+0x164>
80402750:	01c12083          	lw	ra,28(sp)
80402754:	02010113          	addi	sp,sp,32
80402758:	00008067          	ret
8040275c:	00072683          	lw	a3,0(a4)
80402760:	00472703          	lw	a4,4(a4)
80402764:	00c68633          	add	a2,a3,a2
80402768:	00c52023          	sw	a2,0(a0)
8040276c:	0007a683          	lw	a3,0(a5)
80402770:	00e52223          	sw	a4,4(a0)
80402774:	00369713          	slli	a4,a3,0x3
80402778:	00e78733          	add	a4,a5,a4
8040277c:	f2e512e3          	bne	a0,a4,804026a0 <slob_free+0x6c>
80402780:	00052703          	lw	a4,0(a0)
80402784:	00452603          	lw	a2,4(a0)
80402788:	00d706b3          	add	a3,a4,a3
8040278c:	00d7a023          	sw	a3,0(a5)
80402790:	00c7a223          	sw	a2,4(a5)
80402794:	f11ff06f          	j	804026a4 <slob_free+0x70>
80402798:	01c12083          	lw	ra,28(sp)
8040279c:	02010113          	addi	sp,sp,32
804027a0:	d10fe06f          	j	80400cb0 <intr_enable>
804027a4:	00072683          	lw	a3,0(a4)
804027a8:	00472703          	lw	a4,4(a4)
804027ac:	00c68633          	add	a2,a3,a2
804027b0:	00c52023          	sw	a2,0(a0)
804027b4:	00e52223          	sw	a4,4(a0)
804027b8:	f79ff06f          	j	80402730 <slob_free+0xfc>
804027bc:	00052703          	lw	a4,0(a0)
804027c0:	00452603          	lw	a2,4(a0)
804027c4:	00d706b3          	add	a3,a4,a3
804027c8:	00d7a023          	sw	a3,0(a5)
804027cc:	00c7a223          	sw	a2,4(a5)
804027d0:	f75ff06f          	j	80402744 <slob_free+0x110>

804027d4 <__slob_get_free_pages.isra.0>:
804027d4:	00100793          	li	a5,1
804027d8:	ff010113          	addi	sp,sp,-16
804027dc:	00a79533          	sll	a0,a5,a0
804027e0:	00112623          	sw	ra,12(sp)
804027e4:	628000ef          	jal	ra,80402e0c <alloc_pages>
804027e8:	04050a63          	beqz	a0,8040283c <__slob_get_free_pages.isra.0+0x68>
804027ec:	0009a797          	auipc	a5,0x9a
804027f0:	01c78793          	addi	a5,a5,28 # 8049c808 <pages>
804027f4:	0007a683          	lw	a3,0(a5)
804027f8:	00014797          	auipc	a5,0x14
804027fc:	22c78793          	addi	a5,a5,556 # 80416a24 <nbase>
80402800:	40d50533          	sub	a0,a0,a3
80402804:	0007a683          	lw	a3,0(a5)
80402808:	40555513          	srai	a0,a0,0x5
8040280c:	0009a797          	auipc	a5,0x9a
80402810:	f8c78793          	addi	a5,a5,-116 # 8049c798 <npage>
80402814:	00d50533          	add	a0,a0,a3
80402818:	0007a703          	lw	a4,0(a5)
8040281c:	00c51793          	slli	a5,a0,0xc
80402820:	00c7d793          	srli	a5,a5,0xc
80402824:	00c51513          	slli	a0,a0,0xc
80402828:	02e7f063          	bgeu	a5,a4,80402848 <__slob_get_free_pages.isra.0+0x74>
8040282c:	0009a797          	auipc	a5,0x9a
80402830:	fd478793          	addi	a5,a5,-44 # 8049c800 <va_pa_offset>
80402834:	0007a683          	lw	a3,0(a5)
80402838:	00d50533          	add	a0,a0,a3
8040283c:	00c12083          	lw	ra,12(sp)
80402840:	01010113          	addi	sp,sp,16
80402844:	00008067          	ret
80402848:	00050693          	mv	a3,a0
8040284c:	00011617          	auipc	a2,0x11
80402850:	44c60613          	addi	a2,a2,1100 # 80413c98 <default_pmm_manager+0x30>
80402854:	06e00593          	li	a1,110
80402858:	00011517          	auipc	a0,0x11
8040285c:	46450513          	addi	a0,a0,1124 # 80413cbc <default_pmm_manager+0x54>
80402860:	dc5fd0ef          	jal	ra,80400624 <__panic>

80402864 <slob_alloc.isra.1.constprop.3>:
80402864:	fe010113          	addi	sp,sp,-32
80402868:	00112e23          	sw	ra,28(sp)
8040286c:	00812c23          	sw	s0,24(sp)
80402870:	00912a23          	sw	s1,20(sp)
80402874:	01212823          	sw	s2,16(sp)
80402878:	01312623          	sw	s3,12(sp)
8040287c:	00850713          	addi	a4,a0,8
80402880:	000017b7          	lui	a5,0x1
80402884:	12f77a63          	bgeu	a4,a5,804029b8 <slob_alloc.isra.1.constprop.3+0x154>
80402888:	00750993          	addi	s3,a0,7
8040288c:	0039d913          	srli	s2,s3,0x3
80402890:	10002673          	csrr	a2,sstatus
80402894:	00267613          	andi	a2,a2,2
80402898:	10061463          	bnez	a2,804029a0 <slob_alloc.isra.1.constprop.3+0x13c>
8040289c:	00096497          	auipc	s1,0x96
804028a0:	7a448493          	addi	s1,s1,1956 # 80499040 <slobfree>
804028a4:	0004a683          	lw	a3,0(s1)
804028a8:	0046a783          	lw	a5,4(a3)
804028ac:	0007a703          	lw	a4,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
804028b0:	0f275e63          	bge	a4,s2,804029ac <slob_alloc.isra.1.constprop.3+0x148>
804028b4:	00d78e63          	beq	a5,a3,804028d0 <slob_alloc.isra.1.constprop.3+0x6c>
804028b8:	0047a403          	lw	s0,4(a5)
804028bc:	00042703          	lw	a4,0(s0)
804028c0:	05275463          	bge	a4,s2,80402908 <slob_alloc.isra.1.constprop.3+0xa4>
804028c4:	0004a683          	lw	a3,0(s1)
804028c8:	00040793          	mv	a5,s0
804028cc:	fed796e3          	bne	a5,a3,804028b8 <slob_alloc.isra.1.constprop.3+0x54>
804028d0:	08061c63          	bnez	a2,80402968 <slob_alloc.isra.1.constprop.3+0x104>
804028d4:	00000513          	li	a0,0
804028d8:	efdff0ef          	jal	ra,804027d4 <__slob_get_free_pages.isra.0>
804028dc:	00050413          	mv	s0,a0
804028e0:	04050c63          	beqz	a0,80402938 <slob_alloc.isra.1.constprop.3+0xd4>
804028e4:	000015b7          	lui	a1,0x1
804028e8:	d4dff0ef          	jal	ra,80402634 <slob_free>
804028ec:	10002673          	csrr	a2,sstatus
804028f0:	00267613          	andi	a2,a2,2
804028f4:	06061263          	bnez	a2,80402958 <slob_alloc.isra.1.constprop.3+0xf4>
804028f8:	0004a783          	lw	a5,0(s1)
804028fc:	0047a403          	lw	s0,4(a5)
80402900:	00042703          	lw	a4,0(s0)
80402904:	fd2740e3          	blt	a4,s2,804028c4 <slob_alloc.isra.1.constprop.3+0x60>
80402908:	08e90663          	beq	s2,a4,80402994 <slob_alloc.isra.1.constprop.3+0x130>
8040290c:	ff89f513          	andi	a0,s3,-8
80402910:	00a40533          	add	a0,s0,a0
80402914:	00a7a223          	sw	a0,4(a5)
80402918:	00442683          	lw	a3,4(s0)
8040291c:	41270733          	sub	a4,a4,s2
80402920:	00e52023          	sw	a4,0(a0)
80402924:	00d52223          	sw	a3,4(a0)
80402928:	01242023          	sw	s2,0(s0)
8040292c:	00096717          	auipc	a4,0x96
80402930:	70f72a23          	sw	a5,1812(a4) # 80499040 <slobfree>
80402934:	02061e63          	bnez	a2,80402970 <slob_alloc.isra.1.constprop.3+0x10c>
80402938:	00040513          	mv	a0,s0
8040293c:	01c12083          	lw	ra,28(sp)
80402940:	01812403          	lw	s0,24(sp)
80402944:	01412483          	lw	s1,20(sp)
80402948:	01012903          	lw	s2,16(sp)
8040294c:	00c12983          	lw	s3,12(sp)
80402950:	02010113          	addi	sp,sp,32
80402954:	00008067          	ret
80402958:	b60fe0ef          	jal	ra,80400cb8 <intr_disable>
8040295c:	00100613          	li	a2,1
80402960:	0004a783          	lw	a5,0(s1)
80402964:	f99ff06f          	j	804028fc <slob_alloc.isra.1.constprop.3+0x98>
80402968:	b48fe0ef          	jal	ra,80400cb0 <intr_enable>
8040296c:	f69ff06f          	j	804028d4 <slob_alloc.isra.1.constprop.3+0x70>
80402970:	b40fe0ef          	jal	ra,80400cb0 <intr_enable>
80402974:	00040513          	mv	a0,s0
80402978:	01c12083          	lw	ra,28(sp)
8040297c:	01812403          	lw	s0,24(sp)
80402980:	01412483          	lw	s1,20(sp)
80402984:	01012903          	lw	s2,16(sp)
80402988:	00c12983          	lw	s3,12(sp)
8040298c:	02010113          	addi	sp,sp,32
80402990:	00008067          	ret
80402994:	00442703          	lw	a4,4(s0)
80402998:	00e7a223          	sw	a4,4(a5)
8040299c:	f91ff06f          	j	8040292c <slob_alloc.isra.1.constprop.3+0xc8>
804029a0:	b18fe0ef          	jal	ra,80400cb8 <intr_disable>
804029a4:	00100613          	li	a2,1
804029a8:	ef5ff06f          	j	8040289c <slob_alloc.isra.1.constprop.3+0x38>
804029ac:	00078413          	mv	s0,a5
804029b0:	00068793          	mv	a5,a3
804029b4:	f55ff06f          	j	80402908 <slob_alloc.isra.1.constprop.3+0xa4>
804029b8:	00011697          	auipc	a3,0x11
804029bc:	37468693          	addi	a3,a3,884 # 80413d2c <default_pmm_manager+0xc4>
804029c0:	00010617          	auipc	a2,0x10
804029c4:	76c60613          	addi	a2,a2,1900 # 8041312c <commands+0x1f8>
804029c8:	06400593          	li	a1,100
804029cc:	00011517          	auipc	a0,0x11
804029d0:	38050513          	addi	a0,a0,896 # 80413d4c <default_pmm_manager+0xe4>
804029d4:	c51fd0ef          	jal	ra,80400624 <__panic>

804029d8 <slob_init>:
804029d8:	ff010113          	addi	sp,sp,-16
804029dc:	00812423          	sw	s0,8(sp)
804029e0:	00096417          	auipc	s0,0x96
804029e4:	65840413          	addi	s0,s0,1624 # 80499038 <arena>
804029e8:	00096797          	auipc	a5,0x96
804029ec:	6487aa23          	sw	s0,1620(a5) # 8049903c <arena+0x4>
804029f0:	00100793          	li	a5,1
804029f4:	00011517          	auipc	a0,0x11
804029f8:	36c50513          	addi	a0,a0,876 # 80413d60 <default_pmm_manager+0xf8>
804029fc:	00096717          	auipc	a4,0x96
80402a00:	62f72e23          	sw	a5,1596(a4) # 80499038 <arena>
80402a04:	00112623          	sw	ra,12(sp)
80402a08:	00096797          	auipc	a5,0x96
80402a0c:	6287ac23          	sw	s0,1592(a5) # 80499040 <slobfree>
80402a10:	0009a797          	auipc	a5,0x9a
80402a14:	d807a023          	sw	zero,-640(a5) # 8049c790 <bigblocks>
80402a18:	fe4fd0ef          	jal	ra,804001fc <cprintf>
80402a1c:	00442603          	lw	a2,4(s0)
80402a20:	00042683          	lw	a3,0(s0)
80402a24:	00040593          	mv	a1,s0
80402a28:	00011517          	auipc	a0,0x11
80402a2c:	34c50513          	addi	a0,a0,844 # 80413d74 <default_pmm_manager+0x10c>
80402a30:	fccfd0ef          	jal	ra,804001fc <cprintf>
80402a34:	00096797          	auipc	a5,0x96
80402a38:	60c78793          	addi	a5,a5,1548 # 80499040 <slobfree>
80402a3c:	0007a583          	lw	a1,0(a5)
80402a40:	00000613          	li	a2,0
80402a44:	00058463          	beqz	a1,80402a4c <slob_init+0x74>
80402a48:	0045a603          	lw	a2,4(a1) # 1004 <_binary_bin_swap_img_size-0x6ffc>
80402a4c:	00812403          	lw	s0,8(sp)
80402a50:	00c12083          	lw	ra,12(sp)
80402a54:	00011517          	auipc	a0,0x11
80402a58:	35050513          	addi	a0,a0,848 # 80413da4 <default_pmm_manager+0x13c>
80402a5c:	01010113          	addi	sp,sp,16
80402a60:	f9cfd06f          	j	804001fc <cprintf>

80402a64 <kmalloc_init>:
80402a64:	ff010113          	addi	sp,sp,-16
80402a68:	00112623          	sw	ra,12(sp)
80402a6c:	f6dff0ef          	jal	ra,804029d8 <slob_init>
80402a70:	00c12083          	lw	ra,12(sp)
80402a74:	00011517          	auipc	a0,0x11
80402a78:	29c50513          	addi	a0,a0,668 # 80413d10 <default_pmm_manager+0xa8>
80402a7c:	01010113          	addi	sp,sp,16
80402a80:	f7cfd06f          	j	804001fc <cprintf>

80402a84 <kallocated>:
80402a84:	00000513          	li	a0,0
80402a88:	00008067          	ret

80402a8c <kmalloc>:
80402a8c:	ff010113          	addi	sp,sp,-16
80402a90:	01212023          	sw	s2,0(sp)
80402a94:	00001937          	lui	s2,0x1
80402a98:	00812423          	sw	s0,8(sp)
80402a9c:	00112623          	sw	ra,12(sp)
80402aa0:	00912223          	sw	s1,4(sp)
80402aa4:	ff790793          	addi	a5,s2,-9 # ff7 <_binary_bin_swap_img_size-0x7009>
80402aa8:	00050413          	mv	s0,a0
80402aac:	08a7f263          	bgeu	a5,a0,80402b30 <kmalloc+0xa4>
80402ab0:	00c00513          	li	a0,12
80402ab4:	db1ff0ef          	jal	ra,80402864 <slob_alloc.isra.1.constprop.3>
80402ab8:	00050493          	mv	s1,a0
80402abc:	08050263          	beqz	a0,80402b40 <kmalloc+0xb4>
80402ac0:	00040793          	mv	a5,s0
80402ac4:	00000513          	li	a0,0
80402ac8:	00895a63          	bge	s2,s0,80402adc <kmalloc+0x50>
80402acc:	00001737          	lui	a4,0x1
80402ad0:	4017d793          	srai	a5,a5,0x1
80402ad4:	00150513          	addi	a0,a0,1
80402ad8:	fef74ce3          	blt	a4,a5,80402ad0 <kmalloc+0x44>
80402adc:	00a4a023          	sw	a0,0(s1)
80402ae0:	cf5ff0ef          	jal	ra,804027d4 <__slob_get_free_pages.isra.0>
80402ae4:	00a4a223          	sw	a0,4(s1)
80402ae8:	00050413          	mv	s0,a0
80402aec:	0a050a63          	beqz	a0,80402ba0 <kmalloc+0x114>
80402af0:	100027f3          	csrr	a5,sstatus
80402af4:	0027f793          	andi	a5,a5,2
80402af8:	06079463          	bnez	a5,80402b60 <kmalloc+0xd4>
80402afc:	0009a797          	auipc	a5,0x9a
80402b00:	c9478793          	addi	a5,a5,-876 # 8049c790 <bigblocks>
80402b04:	0007a783          	lw	a5,0(a5)
80402b08:	0009a717          	auipc	a4,0x9a
80402b0c:	c8972423          	sw	s1,-888(a4) # 8049c790 <bigblocks>
80402b10:	00f4a423          	sw	a5,8(s1)
80402b14:	00040513          	mv	a0,s0
80402b18:	00c12083          	lw	ra,12(sp)
80402b1c:	00812403          	lw	s0,8(sp)
80402b20:	00412483          	lw	s1,4(sp)
80402b24:	00012903          	lw	s2,0(sp)
80402b28:	01010113          	addi	sp,sp,16
80402b2c:	00008067          	ret
80402b30:	00850513          	addi	a0,a0,8
80402b34:	d31ff0ef          	jal	ra,80402864 <slob_alloc.isra.1.constprop.3>
80402b38:	00850413          	addi	s0,a0,8
80402b3c:	fc051ce3          	bnez	a0,80402b14 <kmalloc+0x88>
80402b40:	00000413          	li	s0,0
80402b44:	00040513          	mv	a0,s0
80402b48:	00c12083          	lw	ra,12(sp)
80402b4c:	00812403          	lw	s0,8(sp)
80402b50:	00412483          	lw	s1,4(sp)
80402b54:	00012903          	lw	s2,0(sp)
80402b58:	01010113          	addi	sp,sp,16
80402b5c:	00008067          	ret
80402b60:	958fe0ef          	jal	ra,80400cb8 <intr_disable>
80402b64:	0009a797          	auipc	a5,0x9a
80402b68:	c2c78793          	addi	a5,a5,-980 # 8049c790 <bigblocks>
80402b6c:	0007a783          	lw	a5,0(a5)
80402b70:	0009a717          	auipc	a4,0x9a
80402b74:	c2972023          	sw	s1,-992(a4) # 8049c790 <bigblocks>
80402b78:	00f4a423          	sw	a5,8(s1)
80402b7c:	934fe0ef          	jal	ra,80400cb0 <intr_enable>
80402b80:	0044a403          	lw	s0,4(s1)
80402b84:	00c12083          	lw	ra,12(sp)
80402b88:	00412483          	lw	s1,4(sp)
80402b8c:	00040513          	mv	a0,s0
80402b90:	00812403          	lw	s0,8(sp)
80402b94:	00012903          	lw	s2,0(sp)
80402b98:	01010113          	addi	sp,sp,16
80402b9c:	00008067          	ret
80402ba0:	00c00593          	li	a1,12
80402ba4:	00048513          	mv	a0,s1
80402ba8:	a8dff0ef          	jal	ra,80402634 <slob_free>
80402bac:	f69ff06f          	j	80402b14 <kmalloc+0x88>

80402bb0 <kfree>:
80402bb0:	14050863          	beqz	a0,80402d00 <kfree+0x150>
80402bb4:	ff010113          	addi	sp,sp,-16
80402bb8:	00912223          	sw	s1,4(sp)
80402bbc:	00112623          	sw	ra,12(sp)
80402bc0:	00812423          	sw	s0,8(sp)
80402bc4:	01451793          	slli	a5,a0,0x14
80402bc8:	00050493          	mv	s1,a0
80402bcc:	04079863          	bnez	a5,80402c1c <kfree+0x6c>
80402bd0:	100027f3          	csrr	a5,sstatus
80402bd4:	0027f793          	andi	a5,a5,2
80402bd8:	0e079263          	bnez	a5,80402cbc <kfree+0x10c>
80402bdc:	0009a797          	auipc	a5,0x9a
80402be0:	bb478793          	addi	a5,a5,-1100 # 8049c790 <bigblocks>
80402be4:	0007a683          	lw	a3,0(a5)
80402be8:	02068a63          	beqz	a3,80402c1c <kfree+0x6c>
80402bec:	0046a783          	lw	a5,4(a3)
80402bf0:	0086a403          	lw	s0,8(a3)
80402bf4:	10f50863          	beq	a0,a5,80402d04 <kfree+0x154>
80402bf8:	00000613          	li	a2,0
80402bfc:	00040e63          	beqz	s0,80402c18 <kfree+0x68>
80402c00:	00442703          	lw	a4,4(s0)
80402c04:	00842783          	lw	a5,8(s0)
80402c08:	02970863          	beq	a4,s1,80402c38 <kfree+0x88>
80402c0c:	00040693          	mv	a3,s0
80402c10:	00078413          	mv	s0,a5
80402c14:	fe0416e3          	bnez	s0,80402c00 <kfree+0x50>
80402c18:	0c061663          	bnez	a2,80402ce4 <kfree+0x134>
80402c1c:	00812403          	lw	s0,8(sp)
80402c20:	00c12083          	lw	ra,12(sp)
80402c24:	ff848513          	addi	a0,s1,-8
80402c28:	00412483          	lw	s1,4(sp)
80402c2c:	00000593          	li	a1,0
80402c30:	01010113          	addi	sp,sp,16
80402c34:	a01ff06f          	j	80402634 <slob_free>
80402c38:	00f6a423          	sw	a5,8(a3)
80402c3c:	0a061e63          	bnez	a2,80402cf8 <kfree+0x148>
80402c40:	804007b7          	lui	a5,0x80400
80402c44:	00042703          	lw	a4,0(s0)
80402c48:	0cf4e663          	bltu	s1,a5,80402d14 <kfree+0x164>
80402c4c:	0009a797          	auipc	a5,0x9a
80402c50:	bb478793          	addi	a5,a5,-1100 # 8049c800 <va_pa_offset>
80402c54:	0007a683          	lw	a3,0(a5)
80402c58:	0009a797          	auipc	a5,0x9a
80402c5c:	b4078793          	addi	a5,a5,-1216 # 8049c798 <npage>
80402c60:	0007a783          	lw	a5,0(a5)
80402c64:	40d484b3          	sub	s1,s1,a3
80402c68:	00c4d493          	srli	s1,s1,0xc
80402c6c:	0cf4f263          	bgeu	s1,a5,80402d30 <kfree+0x180>
80402c70:	00014797          	auipc	a5,0x14
80402c74:	db478793          	addi	a5,a5,-588 # 80416a24 <nbase>
80402c78:	0007a783          	lw	a5,0(a5)
80402c7c:	0009a697          	auipc	a3,0x9a
80402c80:	b8c68693          	addi	a3,a3,-1140 # 8049c808 <pages>
80402c84:	0006a503          	lw	a0,0(a3)
80402c88:	40f484b3          	sub	s1,s1,a5
80402c8c:	00549493          	slli	s1,s1,0x5
80402c90:	00100593          	li	a1,1
80402c94:	00950533          	add	a0,a0,s1
80402c98:	00e595b3          	sll	a1,a1,a4
80402c9c:	238000ef          	jal	ra,80402ed4 <free_pages>
80402ca0:	00040513          	mv	a0,s0
80402ca4:	00812403          	lw	s0,8(sp)
80402ca8:	00c12083          	lw	ra,12(sp)
80402cac:	00412483          	lw	s1,4(sp)
80402cb0:	00c00593          	li	a1,12
80402cb4:	01010113          	addi	sp,sp,16
80402cb8:	97dff06f          	j	80402634 <slob_free>
80402cbc:	ffdfd0ef          	jal	ra,80400cb8 <intr_disable>
80402cc0:	0009a797          	auipc	a5,0x9a
80402cc4:	ad078793          	addi	a5,a5,-1328 # 8049c790 <bigblocks>
80402cc8:	0007a683          	lw	a3,0(a5)
80402ccc:	00068c63          	beqz	a3,80402ce4 <kfree+0x134>
80402cd0:	0046a783          	lw	a5,4(a3)
80402cd4:	0086a403          	lw	s0,8(a3)
80402cd8:	00f48a63          	beq	s1,a5,80402cec <kfree+0x13c>
80402cdc:	00100613          	li	a2,1
80402ce0:	f1dff06f          	j	80402bfc <kfree+0x4c>
80402ce4:	fcdfd0ef          	jal	ra,80400cb0 <intr_enable>
80402ce8:	f35ff06f          	j	80402c1c <kfree+0x6c>
80402cec:	0009a797          	auipc	a5,0x9a
80402cf0:	aa87a223          	sw	s0,-1372(a5) # 8049c790 <bigblocks>
80402cf4:	00068413          	mv	s0,a3
80402cf8:	fb9fd0ef          	jal	ra,80400cb0 <intr_enable>
80402cfc:	f45ff06f          	j	80402c40 <kfree+0x90>
80402d00:	00008067          	ret
80402d04:	0009a797          	auipc	a5,0x9a
80402d08:	a887a623          	sw	s0,-1396(a5) # 8049c790 <bigblocks>
80402d0c:	00068413          	mv	s0,a3
80402d10:	f31ff06f          	j	80402c40 <kfree+0x90>
80402d14:	00048693          	mv	a3,s1
80402d18:	00011617          	auipc	a2,0x11
80402d1c:	fb460613          	addi	a2,a2,-76 # 80413ccc <default_pmm_manager+0x64>
80402d20:	07000593          	li	a1,112
80402d24:	00011517          	auipc	a0,0x11
80402d28:	f9850513          	addi	a0,a0,-104 # 80413cbc <default_pmm_manager+0x54>
80402d2c:	8f9fd0ef          	jal	ra,80400624 <__panic>
80402d30:	00011617          	auipc	a2,0x11
80402d34:	fc060613          	addi	a2,a2,-64 # 80413cf0 <default_pmm_manager+0x88>
80402d38:	06900593          	li	a1,105
80402d3c:	00011517          	auipc	a0,0x11
80402d40:	f8050513          	addi	a0,a0,-128 # 80413cbc <default_pmm_manager+0x54>
80402d44:	8e1fd0ef          	jal	ra,80400624 <__panic>

80402d48 <get_pgtable_items.isra.4.part.5>:
80402d48:	04a5f063          	bgeu	a1,a0,80402d88 <get_pgtable_items.isra.4.part.5+0x40>
80402d4c:	00259813          	slli	a6,a1,0x2
80402d50:	010608b3          	add	a7,a2,a6
80402d54:	0008a783          	lw	a5,0(a7)
80402d58:	0017f793          	andi	a5,a5,1
80402d5c:	02079c63          	bnez	a5,80402d94 <get_pgtable_items.isra.4.part.5+0x4c>
80402d60:	00480813          	addi	a6,a6,4
80402d64:	01060833          	add	a6,a2,a6
80402d68:	0140006f          	j	80402d7c <get_pgtable_items.isra.4.part.5+0x34>
80402d6c:	00082783          	lw	a5,0(a6)
80402d70:	00480813          	addi	a6,a6,4
80402d74:	0017f793          	andi	a5,a5,1
80402d78:	00079e63          	bnez	a5,80402d94 <get_pgtable_items.isra.4.part.5+0x4c>
80402d7c:	00158593          	addi	a1,a1,1
80402d80:	00080893          	mv	a7,a6
80402d84:	fea594e3          	bne	a1,a0,80402d6c <get_pgtable_items.isra.4.part.5+0x24>
80402d88:	00000693          	li	a3,0
80402d8c:	00068513          	mv	a0,a3
80402d90:	00008067          	ret
80402d94:	00b6a023          	sw	a1,0(a3)
80402d98:	0008a683          	lw	a3,0(a7)
80402d9c:	00158593          	addi	a1,a1,1
80402da0:	01f6f693          	andi	a3,a3,31
80402da4:	02a5fe63          	bgeu	a1,a0,80402de0 <get_pgtable_items.isra.4.part.5+0x98>
80402da8:	00259793          	slli	a5,a1,0x2
80402dac:	00f60833          	add	a6,a2,a5
80402db0:	00082803          	lw	a6,0(a6)
80402db4:	ffc78793          	addi	a5,a5,-4
80402db8:	00f60633          	add	a2,a2,a5
80402dbc:	01f87813          	andi	a6,a6,31
80402dc0:	00d80c63          	beq	a6,a3,80402dd8 <get_pgtable_items.isra.4.part.5+0x90>
80402dc4:	01c0006f          	j	80402de0 <get_pgtable_items.isra.4.part.5+0x98>
80402dc8:	00862783          	lw	a5,8(a2)
80402dcc:	00460613          	addi	a2,a2,4
80402dd0:	01f7f793          	andi	a5,a5,31
80402dd4:	00d79663          	bne	a5,a3,80402de0 <get_pgtable_items.isra.4.part.5+0x98>
80402dd8:	00158593          	addi	a1,a1,1
80402ddc:	fea5e6e3          	bltu	a1,a0,80402dc8 <get_pgtable_items.isra.4.part.5+0x80>
80402de0:	00b72023          	sw	a1,0(a4)
80402de4:	00068513          	mv	a0,a3
80402de8:	00008067          	ret

80402dec <pa2page.part.6>:
80402dec:	ff010113          	addi	sp,sp,-16
80402df0:	00011617          	auipc	a2,0x11
80402df4:	f0060613          	addi	a2,a2,-256 # 80413cf0 <default_pmm_manager+0x88>
80402df8:	06900593          	li	a1,105
80402dfc:	00011517          	auipc	a0,0x11
80402e00:	ec050513          	addi	a0,a0,-320 # 80413cbc <default_pmm_manager+0x54>
80402e04:	00112623          	sw	ra,12(sp)
80402e08:	81dfd0ef          	jal	ra,80400624 <__panic>

80402e0c <alloc_pages>:
80402e0c:	fd010113          	addi	sp,sp,-48
80402e10:	02812423          	sw	s0,40(sp)
80402e14:	02912223          	sw	s1,36(sp)
80402e18:	03212023          	sw	s2,32(sp)
80402e1c:	01312e23          	sw	s3,28(sp)
80402e20:	01412c23          	sw	s4,24(sp)
80402e24:	02112623          	sw	ra,44(sp)
80402e28:	00050413          	mv	s0,a0
80402e2c:	0009a497          	auipc	s1,0x9a
80402e30:	9d048493          	addi	s1,s1,-1584 # 8049c7fc <pmm_manager>
80402e34:	00100913          	li	s2,1
80402e38:	0009a997          	auipc	s3,0x9a
80402e3c:	96c98993          	addi	s3,s3,-1684 # 8049c7a4 <swap_init_ok>
80402e40:	0009aa17          	auipc	s4,0x9a
80402e44:	a70a0a13          	addi	s4,s4,-1424 # 8049c8b0 <check_mm_struct>
80402e48:	0300006f          	j	80402e78 <alloc_pages+0x6c>
80402e4c:	0004a783          	lw	a5,0(s1)
80402e50:	00c7a783          	lw	a5,12(a5)
80402e54:	000780e7          	jalr	a5
80402e58:	00000613          	li	a2,0
80402e5c:	00040593          	mv	a1,s0
80402e60:	04051a63          	bnez	a0,80402eb4 <alloc_pages+0xa8>
80402e64:	04896863          	bltu	s2,s0,80402eb4 <alloc_pages+0xa8>
80402e68:	0009a783          	lw	a5,0(s3)
80402e6c:	04078463          	beqz	a5,80402eb4 <alloc_pages+0xa8>
80402e70:	000a2503          	lw	a0,0(s4)
80402e74:	1e0010ef          	jal	ra,80404054 <swap_out>
80402e78:	100027f3          	csrr	a5,sstatus
80402e7c:	0027f793          	andi	a5,a5,2
80402e80:	00040513          	mv	a0,s0
80402e84:	fc0784e3          	beqz	a5,80402e4c <alloc_pages+0x40>
80402e88:	e31fd0ef          	jal	ra,80400cb8 <intr_disable>
80402e8c:	0004a783          	lw	a5,0(s1)
80402e90:	00040513          	mv	a0,s0
80402e94:	00c7a783          	lw	a5,12(a5)
80402e98:	000780e7          	jalr	a5
80402e9c:	00a12623          	sw	a0,12(sp)
80402ea0:	e11fd0ef          	jal	ra,80400cb0 <intr_enable>
80402ea4:	00c12503          	lw	a0,12(sp)
80402ea8:	00000613          	li	a2,0
80402eac:	00040593          	mv	a1,s0
80402eb0:	fa050ae3          	beqz	a0,80402e64 <alloc_pages+0x58>
80402eb4:	02c12083          	lw	ra,44(sp)
80402eb8:	02812403          	lw	s0,40(sp)
80402ebc:	02412483          	lw	s1,36(sp)
80402ec0:	02012903          	lw	s2,32(sp)
80402ec4:	01c12983          	lw	s3,28(sp)
80402ec8:	01812a03          	lw	s4,24(sp)
80402ecc:	03010113          	addi	sp,sp,48
80402ed0:	00008067          	ret

80402ed4 <free_pages>:
80402ed4:	100027f3          	csrr	a5,sstatus
80402ed8:	0027f793          	andi	a5,a5,2
80402edc:	00079c63          	bnez	a5,80402ef4 <free_pages+0x20>
80402ee0:	0009a797          	auipc	a5,0x9a
80402ee4:	91c78793          	addi	a5,a5,-1764 # 8049c7fc <pmm_manager>
80402ee8:	0007a783          	lw	a5,0(a5)
80402eec:	0107a303          	lw	t1,16(a5)
80402ef0:	00030067          	jr	t1
80402ef4:	ff010113          	addi	sp,sp,-16
80402ef8:	00112623          	sw	ra,12(sp)
80402efc:	00812423          	sw	s0,8(sp)
80402f00:	00912223          	sw	s1,4(sp)
80402f04:	00050413          	mv	s0,a0
80402f08:	00058493          	mv	s1,a1
80402f0c:	dadfd0ef          	jal	ra,80400cb8 <intr_disable>
80402f10:	0009a797          	auipc	a5,0x9a
80402f14:	8ec78793          	addi	a5,a5,-1812 # 8049c7fc <pmm_manager>
80402f18:	0007a783          	lw	a5,0(a5)
80402f1c:	00048593          	mv	a1,s1
80402f20:	00040513          	mv	a0,s0
80402f24:	0107a783          	lw	a5,16(a5)
80402f28:	000780e7          	jalr	a5
80402f2c:	00812403          	lw	s0,8(sp)
80402f30:	00c12083          	lw	ra,12(sp)
80402f34:	00412483          	lw	s1,4(sp)
80402f38:	01010113          	addi	sp,sp,16
80402f3c:	d75fd06f          	j	80400cb0 <intr_enable>

80402f40 <nr_free_pages>:
80402f40:	100027f3          	csrr	a5,sstatus
80402f44:	0027f793          	andi	a5,a5,2
80402f48:	00079c63          	bnez	a5,80402f60 <nr_free_pages+0x20>
80402f4c:	0009a797          	auipc	a5,0x9a
80402f50:	8b078793          	addi	a5,a5,-1872 # 8049c7fc <pmm_manager>
80402f54:	0007a783          	lw	a5,0(a5)
80402f58:	0147a303          	lw	t1,20(a5)
80402f5c:	00030067          	jr	t1
80402f60:	ff010113          	addi	sp,sp,-16
80402f64:	00112623          	sw	ra,12(sp)
80402f68:	00812423          	sw	s0,8(sp)
80402f6c:	d4dfd0ef          	jal	ra,80400cb8 <intr_disable>
80402f70:	0009a797          	auipc	a5,0x9a
80402f74:	88c78793          	addi	a5,a5,-1908 # 8049c7fc <pmm_manager>
80402f78:	0007a783          	lw	a5,0(a5)
80402f7c:	0147a783          	lw	a5,20(a5)
80402f80:	000780e7          	jalr	a5
80402f84:	00050413          	mv	s0,a0
80402f88:	d29fd0ef          	jal	ra,80400cb0 <intr_enable>
80402f8c:	00040513          	mv	a0,s0
80402f90:	00c12083          	lw	ra,12(sp)
80402f94:	00812403          	lw	s0,8(sp)
80402f98:	01010113          	addi	sp,sp,16
80402f9c:	00008067          	ret

80402fa0 <get_pte>:
80402fa0:	fe010113          	addi	sp,sp,-32
80402fa4:	01212823          	sw	s2,16(sp)
80402fa8:	0165d913          	srli	s2,a1,0x16
80402fac:	00291913          	slli	s2,s2,0x2
80402fb0:	01250933          	add	s2,a0,s2
80402fb4:	00092683          	lw	a3,0(s2)
80402fb8:	00912a23          	sw	s1,20(sp)
80402fbc:	01312623          	sw	s3,12(sp)
80402fc0:	00112e23          	sw	ra,28(sp)
80402fc4:	00812c23          	sw	s0,24(sp)
80402fc8:	01412423          	sw	s4,8(sp)
80402fcc:	01512223          	sw	s5,4(sp)
80402fd0:	0016f793          	andi	a5,a3,1
80402fd4:	00058493          	mv	s1,a1
80402fd8:	00099997          	auipc	s3,0x99
80402fdc:	7c098993          	addi	s3,s3,1984 # 8049c798 <npage>
80402fe0:	08079863          	bnez	a5,80403070 <get_pte+0xd0>
80402fe4:	0e060463          	beqz	a2,804030cc <get_pte+0x12c>
80402fe8:	00100513          	li	a0,1
80402fec:	e21ff0ef          	jal	ra,80402e0c <alloc_pages>
80402ff0:	00050413          	mv	s0,a0
80402ff4:	0c050c63          	beqz	a0,804030cc <get_pte+0x12c>
80402ff8:	0009aa97          	auipc	s5,0x9a
80402ffc:	810a8a93          	addi	s5,s5,-2032 # 8049c808 <pages>
80403000:	000aa503          	lw	a0,0(s5)
80403004:	00100793          	li	a5,1
80403008:	00f42023          	sw	a5,0(s0)
8040300c:	40a40533          	sub	a0,s0,a0
80403010:	40555513          	srai	a0,a0,0x5
80403014:	00080a37          	lui	s4,0x80
80403018:	00099997          	auipc	s3,0x99
8040301c:	78098993          	addi	s3,s3,1920 # 8049c798 <npage>
80403020:	01450533          	add	a0,a0,s4
80403024:	0009a703          	lw	a4,0(s3)
80403028:	00c51793          	slli	a5,a0,0xc
8040302c:	00c7d793          	srli	a5,a5,0xc
80403030:	00c51513          	slli	a0,a0,0xc
80403034:	0ae7fc63          	bgeu	a5,a4,804030ec <get_pte+0x14c>
80403038:	00099797          	auipc	a5,0x99
8040303c:	7c878793          	addi	a5,a5,1992 # 8049c800 <va_pa_offset>
80403040:	0007a783          	lw	a5,0(a5)
80403044:	00001637          	lui	a2,0x1
80403048:	00000593          	li	a1,0
8040304c:	00f50533          	add	a0,a0,a5
80403050:	4710f0ef          	jal	ra,80412cc0 <memset>
80403054:	000aa683          	lw	a3,0(s5)
80403058:	40d406b3          	sub	a3,s0,a3
8040305c:	4056d693          	srai	a3,a3,0x5
80403060:	014686b3          	add	a3,a3,s4
80403064:	00a69693          	slli	a3,a3,0xa
80403068:	0116e693          	ori	a3,a3,17
8040306c:	00d92023          	sw	a3,0(s2)
80403070:	00269693          	slli	a3,a3,0x2
80403074:	fffff537          	lui	a0,0xfffff
80403078:	0009a703          	lw	a4,0(s3)
8040307c:	00a6f6b3          	and	a3,a3,a0
80403080:	00c6d793          	srli	a5,a3,0xc
80403084:	04e7f863          	bgeu	a5,a4,804030d4 <get_pte+0x134>
80403088:	00099797          	auipc	a5,0x99
8040308c:	77878793          	addi	a5,a5,1912 # 8049c800 <va_pa_offset>
80403090:	0007a503          	lw	a0,0(a5)
80403094:	00c4d493          	srli	s1,s1,0xc
80403098:	3ff4f493          	andi	s1,s1,1023
8040309c:	00a686b3          	add	a3,a3,a0
804030a0:	00249513          	slli	a0,s1,0x2
804030a4:	00a68533          	add	a0,a3,a0
804030a8:	01c12083          	lw	ra,28(sp)
804030ac:	01812403          	lw	s0,24(sp)
804030b0:	01412483          	lw	s1,20(sp)
804030b4:	01012903          	lw	s2,16(sp)
804030b8:	00c12983          	lw	s3,12(sp)
804030bc:	00812a03          	lw	s4,8(sp)
804030c0:	00412a83          	lw	s5,4(sp)
804030c4:	02010113          	addi	sp,sp,32
804030c8:	00008067          	ret
804030cc:	00000513          	li	a0,0
804030d0:	fd9ff06f          	j	804030a8 <get_pte+0x108>
804030d4:	00011617          	auipc	a2,0x11
804030d8:	bc460613          	addi	a2,a2,-1084 # 80413c98 <default_pmm_manager+0x30>
804030dc:	12100593          	li	a1,289
804030e0:	00011517          	auipc	a0,0x11
804030e4:	d5850513          	addi	a0,a0,-680 # 80413e38 <default_pmm_manager+0x1d0>
804030e8:	d3cfd0ef          	jal	ra,80400624 <__panic>
804030ec:	00050693          	mv	a3,a0
804030f0:	00011617          	auipc	a2,0x11
804030f4:	ba860613          	addi	a2,a2,-1112 # 80413c98 <default_pmm_manager+0x30>
804030f8:	11e00593          	li	a1,286
804030fc:	00011517          	auipc	a0,0x11
80403100:	d3c50513          	addi	a0,a0,-708 # 80413e38 <default_pmm_manager+0x1d0>
80403104:	d20fd0ef          	jal	ra,80400624 <__panic>

80403108 <unmap_range>:
80403108:	fd010113          	addi	sp,sp,-48
8040310c:	00c5e7b3          	or	a5,a1,a2
80403110:	02112623          	sw	ra,44(sp)
80403114:	02812423          	sw	s0,40(sp)
80403118:	02912223          	sw	s1,36(sp)
8040311c:	03212023          	sw	s2,32(sp)
80403120:	01312e23          	sw	s3,28(sp)
80403124:	01412c23          	sw	s4,24(sp)
80403128:	01512a23          	sw	s5,20(sp)
8040312c:	01612823          	sw	s6,16(sp)
80403130:	01712623          	sw	s7,12(sp)
80403134:	01812423          	sw	s8,8(sp)
80403138:	01912223          	sw	s9,4(sp)
8040313c:	01479713          	slli	a4,a5,0x14
80403140:	12071463          	bnez	a4,80403268 <unmap_range+0x160>
80403144:	002007b7          	lui	a5,0x200
80403148:	00058413          	mv	s0,a1
8040314c:	0ef5ee63          	bltu	a1,a5,80403248 <unmap_range+0x140>
80403150:	00060913          	mv	s2,a2
80403154:	0ec5fa63          	bgeu	a1,a2,80403248 <unmap_range+0x140>
80403158:	800007b7          	lui	a5,0x80000
8040315c:	0ec7e663          	bltu	a5,a2,80403248 <unmap_range+0x140>
80403160:	00050993          	mv	s3,a0
80403164:	00001a37          	lui	s4,0x1
80403168:	00099c97          	auipc	s9,0x99
8040316c:	630c8c93          	addi	s9,s9,1584 # 8049c798 <npage>
80403170:	00099c17          	auipc	s8,0x99
80403174:	698c0c13          	addi	s8,s8,1688 # 8049c808 <pages>
80403178:	fff80bb7          	lui	s7,0xfff80
8040317c:	00400b37          	lui	s6,0x400
80403180:	ffc00ab7          	lui	s5,0xffc00
80403184:	00000613          	li	a2,0
80403188:	00040593          	mv	a1,s0
8040318c:	00098513          	mv	a0,s3
80403190:	e11ff0ef          	jal	ra,80402fa0 <get_pte>
80403194:	00050493          	mv	s1,a0
80403198:	08050863          	beqz	a0,80403228 <unmap_range+0x120>
8040319c:	00052783          	lw	a5,0(a0)
804031a0:	04079063          	bnez	a5,804031e0 <unmap_range+0xd8>
804031a4:	01440433          	add	s0,s0,s4
804031a8:	fd246ee3          	bltu	s0,s2,80403184 <unmap_range+0x7c>
804031ac:	02c12083          	lw	ra,44(sp)
804031b0:	02812403          	lw	s0,40(sp)
804031b4:	02412483          	lw	s1,36(sp)
804031b8:	02012903          	lw	s2,32(sp)
804031bc:	01c12983          	lw	s3,28(sp)
804031c0:	01812a03          	lw	s4,24(sp)
804031c4:	01412a83          	lw	s5,20(sp)
804031c8:	01012b03          	lw	s6,16(sp)
804031cc:	00c12b83          	lw	s7,12(sp)
804031d0:	00812c03          	lw	s8,8(sp)
804031d4:	00412c83          	lw	s9,4(sp)
804031d8:	03010113          	addi	sp,sp,48
804031dc:	00008067          	ret
804031e0:	0017f713          	andi	a4,a5,1
804031e4:	fc0700e3          	beqz	a4,804031a4 <unmap_range+0x9c>
804031e8:	000ca703          	lw	a4,0(s9)
804031ec:	00279793          	slli	a5,a5,0x2
804031f0:	00c7d793          	srli	a5,a5,0xc
804031f4:	08e7fa63          	bgeu	a5,a4,80403288 <unmap_range+0x180>
804031f8:	000c2503          	lw	a0,0(s8)
804031fc:	017787b3          	add	a5,a5,s7
80403200:	00579793          	slli	a5,a5,0x5
80403204:	00f50533          	add	a0,a0,a5
80403208:	00052783          	lw	a5,0(a0)
8040320c:	fff78793          	addi	a5,a5,-1 # 7fffffff <end+0xffb63743>
80403210:	00f52023          	sw	a5,0(a0)
80403214:	02078463          	beqz	a5,8040323c <unmap_range+0x134>
80403218:	0004a023          	sw	zero,0(s1)
8040321c:	12040073          	sfence.vma	s0
80403220:	01440433          	add	s0,s0,s4
80403224:	f85ff06f          	j	804031a8 <unmap_range+0xa0>
80403228:	01640433          	add	s0,s0,s6
8040322c:	01547433          	and	s0,s0,s5
80403230:	f6040ee3          	beqz	s0,804031ac <unmap_range+0xa4>
80403234:	f52468e3          	bltu	s0,s2,80403184 <unmap_range+0x7c>
80403238:	f75ff06f          	j	804031ac <unmap_range+0xa4>
8040323c:	00100593          	li	a1,1
80403240:	c95ff0ef          	jal	ra,80402ed4 <free_pages>
80403244:	fd5ff06f          	j	80403218 <unmap_range+0x110>
80403248:	00011697          	auipc	a3,0x11
8040324c:	d8868693          	addi	a3,a3,-632 # 80413fd0 <default_pmm_manager+0x368>
80403250:	00010617          	auipc	a2,0x10
80403254:	edc60613          	addi	a2,a2,-292 # 8041312c <commands+0x1f8>
80403258:	15900593          	li	a1,345
8040325c:	00011517          	auipc	a0,0x11
80403260:	bdc50513          	addi	a0,a0,-1060 # 80413e38 <default_pmm_manager+0x1d0>
80403264:	bc0fd0ef          	jal	ra,80400624 <__panic>
80403268:	00011697          	auipc	a3,0x11
8040326c:	d3c68693          	addi	a3,a3,-708 # 80413fa4 <default_pmm_manager+0x33c>
80403270:	00010617          	auipc	a2,0x10
80403274:	ebc60613          	addi	a2,a2,-324 # 8041312c <commands+0x1f8>
80403278:	15800593          	li	a1,344
8040327c:	00011517          	auipc	a0,0x11
80403280:	bbc50513          	addi	a0,a0,-1092 # 80413e38 <default_pmm_manager+0x1d0>
80403284:	ba0fd0ef          	jal	ra,80400624 <__panic>
80403288:	b65ff0ef          	jal	ra,80402dec <pa2page.part.6>

8040328c <exit_range>:
8040328c:	fd010113          	addi	sp,sp,-48
80403290:	00c5e7b3          	or	a5,a1,a2
80403294:	02112623          	sw	ra,44(sp)
80403298:	02812423          	sw	s0,40(sp)
8040329c:	02912223          	sw	s1,36(sp)
804032a0:	03212023          	sw	s2,32(sp)
804032a4:	01312e23          	sw	s3,28(sp)
804032a8:	01412c23          	sw	s4,24(sp)
804032ac:	01512a23          	sw	s5,20(sp)
804032b0:	01612823          	sw	s6,16(sp)
804032b4:	01712623          	sw	s7,12(sp)
804032b8:	01479713          	slli	a4,a5,0x14
804032bc:	0e071c63          	bnez	a4,804033b4 <exit_range+0x128>
804032c0:	002007b7          	lui	a5,0x200
804032c4:	0cf5e863          	bltu	a1,a5,80403394 <exit_range+0x108>
804032c8:	00060913          	mv	s2,a2
804032cc:	0cc5f463          	bgeu	a1,a2,80403394 <exit_range+0x108>
804032d0:	ffc004b7          	lui	s1,0xffc00
804032d4:	800007b7          	lui	a5,0x80000
804032d8:	0095f4b3          	and	s1,a1,s1
804032dc:	0ac7ec63          	bltu	a5,a2,80403394 <exit_range+0x108>
804032e0:	00050a13          	mv	s4,a0
804032e4:	00099b17          	auipc	s6,0x99
804032e8:	4b4b0b13          	addi	s6,s6,1204 # 8049c798 <npage>
804032ec:	00099b97          	auipc	s7,0x99
804032f0:	51cb8b93          	addi	s7,s7,1308 # 8049c808 <pages>
804032f4:	fff809b7          	lui	s3,0xfff80
804032f8:	00400ab7          	lui	s5,0x400
804032fc:	0080006f          	j	80403304 <exit_range+0x78>
80403300:	0524f863          	bgeu	s1,s2,80403350 <exit_range+0xc4>
80403304:	0164d413          	srli	s0,s1,0x16
80403308:	00241413          	slli	s0,s0,0x2
8040330c:	008a0433          	add	s0,s4,s0
80403310:	00042783          	lw	a5,0(s0)
80403314:	0017f713          	andi	a4,a5,1
80403318:	02070863          	beqz	a4,80403348 <exit_range+0xbc>
8040331c:	000b2703          	lw	a4,0(s6)
80403320:	00279793          	slli	a5,a5,0x2
80403324:	00c7d793          	srli	a5,a5,0xc
80403328:	04e7fa63          	bgeu	a5,a4,8040337c <exit_range+0xf0>
8040332c:	000ba503          	lw	a0,0(s7)
80403330:	013787b3          	add	a5,a5,s3
80403334:	00579793          	slli	a5,a5,0x5
80403338:	00100593          	li	a1,1
8040333c:	00f50533          	add	a0,a0,a5
80403340:	b95ff0ef          	jal	ra,80402ed4 <free_pages>
80403344:	00042023          	sw	zero,0(s0)
80403348:	015484b3          	add	s1,s1,s5
8040334c:	fa049ae3          	bnez	s1,80403300 <exit_range+0x74>
80403350:	02c12083          	lw	ra,44(sp)
80403354:	02812403          	lw	s0,40(sp)
80403358:	02412483          	lw	s1,36(sp)
8040335c:	02012903          	lw	s2,32(sp)
80403360:	01c12983          	lw	s3,28(sp)
80403364:	01812a03          	lw	s4,24(sp)
80403368:	01412a83          	lw	s5,20(sp)
8040336c:	01012b03          	lw	s6,16(sp)
80403370:	00c12b83          	lw	s7,12(sp)
80403374:	03010113          	addi	sp,sp,48
80403378:	00008067          	ret
8040337c:	00011617          	auipc	a2,0x11
80403380:	97460613          	addi	a2,a2,-1676 # 80413cf0 <default_pmm_manager+0x88>
80403384:	06900593          	li	a1,105
80403388:	00011517          	auipc	a0,0x11
8040338c:	93450513          	addi	a0,a0,-1740 # 80413cbc <default_pmm_manager+0x54>
80403390:	a94fd0ef          	jal	ra,80400624 <__panic>
80403394:	00011697          	auipc	a3,0x11
80403398:	c3c68693          	addi	a3,a3,-964 # 80413fd0 <default_pmm_manager+0x368>
8040339c:	00010617          	auipc	a2,0x10
804033a0:	d9060613          	addi	a2,a2,-624 # 8041312c <commands+0x1f8>
804033a4:	16a00593          	li	a1,362
804033a8:	00011517          	auipc	a0,0x11
804033ac:	a9050513          	addi	a0,a0,-1392 # 80413e38 <default_pmm_manager+0x1d0>
804033b0:	a74fd0ef          	jal	ra,80400624 <__panic>
804033b4:	00011697          	auipc	a3,0x11
804033b8:	bf068693          	addi	a3,a3,-1040 # 80413fa4 <default_pmm_manager+0x33c>
804033bc:	00010617          	auipc	a2,0x10
804033c0:	d7060613          	addi	a2,a2,-656 # 8041312c <commands+0x1f8>
804033c4:	16900593          	li	a1,361
804033c8:	00011517          	auipc	a0,0x11
804033cc:	a7050513          	addi	a0,a0,-1424 # 80413e38 <default_pmm_manager+0x1d0>
804033d0:	a54fd0ef          	jal	ra,80400624 <__panic>

804033d4 <page_insert>:
804033d4:	fe010113          	addi	sp,sp,-32
804033d8:	01312623          	sw	s3,12(sp)
804033dc:	00060993          	mv	s3,a2
804033e0:	00812c23          	sw	s0,24(sp)
804033e4:	00100613          	li	a2,1
804033e8:	00058413          	mv	s0,a1
804033ec:	00098593          	mv	a1,s3
804033f0:	01212823          	sw	s2,16(sp)
804033f4:	00112e23          	sw	ra,28(sp)
804033f8:	00912a23          	sw	s1,20(sp)
804033fc:	01412423          	sw	s4,8(sp)
80403400:	00068913          	mv	s2,a3
80403404:	b9dff0ef          	jal	ra,80402fa0 <get_pte>
80403408:	0e050063          	beqz	a0,804034e8 <page_insert+0x114>
8040340c:	00042683          	lw	a3,0(s0)
80403410:	00050493          	mv	s1,a0
80403414:	00168793          	addi	a5,a3,1
80403418:	00f42023          	sw	a5,0(s0)
8040341c:	00052783          	lw	a5,0(a0)
80403420:	0017f713          	andi	a4,a5,1
80403424:	04071c63          	bnez	a4,8040347c <page_insert+0xa8>
80403428:	00099797          	auipc	a5,0x99
8040342c:	3e078793          	addi	a5,a5,992 # 8049c808 <pages>
80403430:	0007a703          	lw	a4,0(a5)
80403434:	40e40433          	sub	s0,s0,a4
80403438:	000806b7          	lui	a3,0x80
8040343c:	40545413          	srai	s0,s0,0x5
80403440:	00d40433          	add	s0,s0,a3
80403444:	00a41413          	slli	s0,s0,0xa
80403448:	01246433          	or	s0,s0,s2
8040344c:	00146413          	ori	s0,s0,1
80403450:	0084a023          	sw	s0,0(s1) # ffc00000 <end+0x7f763744>
80403454:	12098073          	sfence.vma	s3
80403458:	00000513          	li	a0,0
8040345c:	01c12083          	lw	ra,28(sp)
80403460:	01812403          	lw	s0,24(sp)
80403464:	01412483          	lw	s1,20(sp)
80403468:	01012903          	lw	s2,16(sp)
8040346c:	00c12983          	lw	s3,12(sp)
80403470:	00812a03          	lw	s4,8(sp)
80403474:	02010113          	addi	sp,sp,32
80403478:	00008067          	ret
8040347c:	00099717          	auipc	a4,0x99
80403480:	31c70713          	addi	a4,a4,796 # 8049c798 <npage>
80403484:	00072703          	lw	a4,0(a4)
80403488:	00279793          	slli	a5,a5,0x2
8040348c:	00c7d793          	srli	a5,a5,0xc
80403490:	06e7f063          	bgeu	a5,a4,804034f0 <page_insert+0x11c>
80403494:	00099a17          	auipc	s4,0x99
80403498:	374a0a13          	addi	s4,s4,884 # 8049c808 <pages>
8040349c:	000a2703          	lw	a4,0(s4)
804034a0:	fff80537          	lui	a0,0xfff80
804034a4:	00a78533          	add	a0,a5,a0
804034a8:	00551513          	slli	a0,a0,0x5
804034ac:	00a70533          	add	a0,a4,a0
804034b0:	00a40e63          	beq	s0,a0,804034cc <page_insert+0xf8>
804034b4:	00052783          	lw	a5,0(a0) # fff80000 <end+0x7fae3744>
804034b8:	fff78793          	addi	a5,a5,-1
804034bc:	00f52023          	sw	a5,0(a0)
804034c0:	00078a63          	beqz	a5,804034d4 <page_insert+0x100>
804034c4:	12098073          	sfence.vma	s3
804034c8:	f6dff06f          	j	80403434 <page_insert+0x60>
804034cc:	00d42023          	sw	a3,0(s0)
804034d0:	f65ff06f          	j	80403434 <page_insert+0x60>
804034d4:	00100593          	li	a1,1
804034d8:	9fdff0ef          	jal	ra,80402ed4 <free_pages>
804034dc:	000a2703          	lw	a4,0(s4)
804034e0:	12098073          	sfence.vma	s3
804034e4:	f51ff06f          	j	80403434 <page_insert+0x60>
804034e8:	ffc00513          	li	a0,-4
804034ec:	f71ff06f          	j	8040345c <page_insert+0x88>
804034f0:	8fdff0ef          	jal	ra,80402dec <pa2page.part.6>

804034f4 <copy_range>:
804034f4:	fb010113          	addi	sp,sp,-80
804034f8:	00d667b3          	or	a5,a2,a3
804034fc:	04112623          	sw	ra,76(sp)
80403500:	04812423          	sw	s0,72(sp)
80403504:	04912223          	sw	s1,68(sp)
80403508:	05212023          	sw	s2,64(sp)
8040350c:	03312e23          	sw	s3,60(sp)
80403510:	03412c23          	sw	s4,56(sp)
80403514:	03512a23          	sw	s5,52(sp)
80403518:	03612823          	sw	s6,48(sp)
8040351c:	03712623          	sw	s7,44(sp)
80403520:	03812423          	sw	s8,40(sp)
80403524:	03912223          	sw	s9,36(sp)
80403528:	03a12023          	sw	s10,32(sp)
8040352c:	01b12e23          	sw	s11,28(sp)
80403530:	01479713          	slli	a4,a5,0x14
80403534:	2e071063          	bnez	a4,80403814 <copy_range+0x320>
80403538:	002007b7          	lui	a5,0x200
8040353c:	00060413          	mv	s0,a2
80403540:	26f66263          	bltu	a2,a5,804037a4 <copy_range+0x2b0>
80403544:	00068913          	mv	s2,a3
80403548:	24d67e63          	bgeu	a2,a3,804037a4 <copy_range+0x2b0>
8040354c:	800007b7          	lui	a5,0x80000
80403550:	24d7ea63          	bltu	a5,a3,804037a4 <copy_range+0x2b0>
80403554:	001007b7          	lui	a5,0x100
80403558:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
8040355c:	00050c13          	mv	s8,a0
80403560:	00058a13          	mv	s4,a1
80403564:	00001ab7          	lui	s5,0x1
80403568:	00099d17          	auipc	s10,0x99
8040356c:	230d0d13          	addi	s10,s10,560 # 8049c798 <npage>
80403570:	00099c97          	auipc	s9,0x99
80403574:	298c8c93          	addi	s9,s9,664 # 8049c808 <pages>
80403578:	00f12223          	sw	a5,4(sp)
8040357c:	00011b17          	auipc	s6,0x11
80403580:	8a8b0b13          	addi	s6,s6,-1880 # 80413e24 <default_pmm_manager+0x1bc>
80403584:	00000613          	li	a2,0
80403588:	00040593          	mv	a1,s0
8040358c:	000a0513          	mv	a0,s4
80403590:	a11ff0ef          	jal	ra,80402fa0 <get_pte>
80403594:	00050493          	mv	s1,a0
80403598:	16050a63          	beqz	a0,8040370c <copy_range+0x218>
8040359c:	00052783          	lw	a5,0(a0)
804035a0:	0017f793          	andi	a5,a5,1
804035a4:	04079663          	bnez	a5,804035f0 <copy_range+0xfc>
804035a8:	01540433          	add	s0,s0,s5
804035ac:	fd246ce3          	bltu	s0,s2,80403584 <copy_range+0x90>
804035b0:	00000513          	li	a0,0
804035b4:	04c12083          	lw	ra,76(sp)
804035b8:	04812403          	lw	s0,72(sp)
804035bc:	04412483          	lw	s1,68(sp)
804035c0:	04012903          	lw	s2,64(sp)
804035c4:	03c12983          	lw	s3,60(sp)
804035c8:	03812a03          	lw	s4,56(sp)
804035cc:	03412a83          	lw	s5,52(sp)
804035d0:	03012b03          	lw	s6,48(sp)
804035d4:	02c12b83          	lw	s7,44(sp)
804035d8:	02812c03          	lw	s8,40(sp)
804035dc:	02412c83          	lw	s9,36(sp)
804035e0:	02012d03          	lw	s10,32(sp)
804035e4:	01c12d83          	lw	s11,28(sp)
804035e8:	05010113          	addi	sp,sp,80
804035ec:	00008067          	ret
804035f0:	00100613          	li	a2,1
804035f4:	00040593          	mv	a1,s0
804035f8:	000c0513          	mv	a0,s8
804035fc:	9a5ff0ef          	jal	ra,80402fa0 <get_pte>
80403600:	16050063          	beqz	a0,80403760 <copy_range+0x26c>
80403604:	0004a783          	lw	a5,0(s1)
80403608:	01f7f693          	andi	a3,a5,31
8040360c:	0017f713          	andi	a4,a5,1
80403610:	00d12423          	sw	a3,8(sp)
80403614:	1e070463          	beqz	a4,804037fc <copy_range+0x308>
80403618:	000d2703          	lw	a4,0(s10)
8040361c:	00279793          	slli	a5,a5,0x2
80403620:	00c7d793          	srli	a5,a5,0xc
80403624:	1ce7f063          	bgeu	a5,a4,804037e4 <copy_range+0x2f0>
80403628:	000cab83          	lw	s7,0(s9)
8040362c:	fff80737          	lui	a4,0xfff80
80403630:	00e787b3          	add	a5,a5,a4
80403634:	00579793          	slli	a5,a5,0x5
80403638:	00100513          	li	a0,1
8040363c:	00fb8bb3          	add	s7,s7,a5
80403640:	fccff0ef          	jal	ra,80402e0c <alloc_pages>
80403644:	00050993          	mv	s3,a0
80403648:	120b8e63          	beqz	s7,80403784 <copy_range+0x290>
8040364c:	16050c63          	beqz	a0,804037c4 <copy_range+0x2d0>
80403650:	000ca783          	lw	a5,0(s9)
80403654:	00412703          	lw	a4,4(sp)
80403658:	000805b7          	lui	a1,0x80
8040365c:	40fb86b3          	sub	a3,s7,a5
80403660:	4056d693          	srai	a3,a3,0x5
80403664:	000d2603          	lw	a2,0(s10)
80403668:	00b686b3          	add	a3,a3,a1
8040366c:	00e6f733          	and	a4,a3,a4
80403670:	00c69693          	slli	a3,a3,0xc
80403674:	0ec77c63          	bgeu	a4,a2,8040376c <copy_range+0x278>
80403678:	00099717          	auipc	a4,0x99
8040367c:	18870713          	addi	a4,a4,392 # 8049c800 <va_pa_offset>
80403680:	00072703          	lw	a4,0(a4)
80403684:	40f504b3          	sub	s1,a0,a5
80403688:	00412783          	lw	a5,4(sp)
8040368c:	4054d493          	srai	s1,s1,0x5
80403690:	00b484b3          	add	s1,s1,a1
80403694:	00e68db3          	add	s11,a3,a4
80403698:	01b12623          	sw	s11,12(sp)
8040369c:	00f4f6b3          	and	a3,s1,a5
804036a0:	00c49493          	slli	s1,s1,0xc
804036a4:	0cc6f263          	bgeu	a3,a2,80403768 <copy_range+0x274>
804036a8:	00e484b3          	add	s1,s1,a4
804036ac:	0000100f          	fence.i
804036b0:	80000737          	lui	a4,0x80000
804036b4:	00e40733          	add	a4,s0,a4
804036b8:	000026b7          	lui	a3,0x2
804036bc:	06d76663          	bltu	a4,a3,80403728 <copy_range+0x234>
804036c0:	00c12583          	lw	a1,12(sp)
804036c4:	00001637          	lui	a2,0x1
804036c8:	00048513          	mv	a0,s1
804036cc:	6640f0ef          	jal	ra,80412d30 <memcpy>
804036d0:	0000100f          	fence.i
804036d4:	00812683          	lw	a3,8(sp)
804036d8:	00040613          	mv	a2,s0
804036dc:	00098593          	mv	a1,s3
804036e0:	000c0513          	mv	a0,s8
804036e4:	cf1ff0ef          	jal	ra,804033d4 <page_insert>
804036e8:	ec0500e3          	beqz	a0,804035a8 <copy_range+0xb4>
804036ec:	00010697          	auipc	a3,0x10
804036f0:	74068693          	addi	a3,a3,1856 # 80413e2c <default_pmm_manager+0x1c4>
804036f4:	00010617          	auipc	a2,0x10
804036f8:	a3860613          	addi	a2,a2,-1480 # 8041312c <commands+0x1f8>
804036fc:	1c100593          	li	a1,449
80403700:	00010517          	auipc	a0,0x10
80403704:	73850513          	addi	a0,a0,1848 # 80413e38 <default_pmm_manager+0x1d0>
80403708:	f1dfc0ef          	jal	ra,80400624 <__panic>
8040370c:	004007b7          	lui	a5,0x400
80403710:	00f40433          	add	s0,s0,a5
80403714:	ffc007b7          	lui	a5,0xffc00
80403718:	00f47433          	and	s0,s0,a5
8040371c:	e8040ae3          	beqz	s0,804035b0 <copy_range+0xbc>
80403720:	e72462e3          	bltu	s0,s2,80403584 <copy_range+0x90>
80403724:	e8dff06f          	j	804035b0 <copy_range+0xbc>
80403728:	00040593          	mv	a1,s0
8040372c:	00010517          	auipc	a0,0x10
80403730:	6e450513          	addi	a0,a0,1764 # 80413e10 <default_pmm_manager+0x1a8>
80403734:	ac9fc0ef          	jal	ra,804001fc <cprintf>
80403738:	010d8b93          	addi	s7,s11,16
8040373c:	000dc583          	lbu	a1,0(s11)
80403740:	000b0513          	mv	a0,s6
80403744:	001d8d93          	addi	s11,s11,1
80403748:	ab5fc0ef          	jal	ra,804001fc <cprintf>
8040374c:	ff7d98e3          	bne	s11,s7,8040373c <copy_range+0x248>
80403750:	00010517          	auipc	a0,0x10
80403754:	89850513          	addi	a0,a0,-1896 # 80412fe8 <commands+0xb4>
80403758:	aa5fc0ef          	jal	ra,804001fc <cprintf>
8040375c:	f65ff06f          	j	804036c0 <copy_range+0x1cc>
80403760:	ffc00513          	li	a0,-4
80403764:	e51ff06f          	j	804035b4 <copy_range+0xc0>
80403768:	00048693          	mv	a3,s1
8040376c:	00010617          	auipc	a2,0x10
80403770:	52c60613          	addi	a2,a2,1324 # 80413c98 <default_pmm_manager+0x30>
80403774:	06e00593          	li	a1,110
80403778:	00010517          	auipc	a0,0x10
8040377c:	54450513          	addi	a0,a0,1348 # 80413cbc <default_pmm_manager+0x54>
80403780:	ea5fc0ef          	jal	ra,80400624 <__panic>
80403784:	00010697          	auipc	a3,0x10
80403788:	66c68693          	addi	a3,a3,1644 # 80413df0 <default_pmm_manager+0x188>
8040378c:	00010617          	auipc	a2,0x10
80403790:	9a060613          	addi	a2,a2,-1632 # 8041312c <commands+0x1f8>
80403794:	19600593          	li	a1,406
80403798:	00010517          	auipc	a0,0x10
8040379c:	6a050513          	addi	a0,a0,1696 # 80413e38 <default_pmm_manager+0x1d0>
804037a0:	e85fc0ef          	jal	ra,80400624 <__panic>
804037a4:	00011697          	auipc	a3,0x11
804037a8:	82c68693          	addi	a3,a3,-2004 # 80413fd0 <default_pmm_manager+0x368>
804037ac:	00010617          	auipc	a2,0x10
804037b0:	98060613          	addi	a2,a2,-1664 # 8041312c <commands+0x1f8>
804037b4:	18200593          	li	a1,386
804037b8:	00010517          	auipc	a0,0x10
804037bc:	68050513          	addi	a0,a0,1664 # 80413e38 <default_pmm_manager+0x1d0>
804037c0:	e65fc0ef          	jal	ra,80400624 <__panic>
804037c4:	00010697          	auipc	a3,0x10
804037c8:	63c68693          	addi	a3,a3,1596 # 80413e00 <default_pmm_manager+0x198>
804037cc:	00010617          	auipc	a2,0x10
804037d0:	96060613          	addi	a2,a2,-1696 # 8041312c <commands+0x1f8>
804037d4:	19700593          	li	a1,407
804037d8:	00010517          	auipc	a0,0x10
804037dc:	66050513          	addi	a0,a0,1632 # 80413e38 <default_pmm_manager+0x1d0>
804037e0:	e45fc0ef          	jal	ra,80400624 <__panic>
804037e4:	00010617          	auipc	a2,0x10
804037e8:	50c60613          	addi	a2,a2,1292 # 80413cf0 <default_pmm_manager+0x88>
804037ec:	06900593          	li	a1,105
804037f0:	00010517          	auipc	a0,0x10
804037f4:	4cc50513          	addi	a0,a0,1228 # 80413cbc <default_pmm_manager+0x54>
804037f8:	e2dfc0ef          	jal	ra,80400624 <__panic>
804037fc:	00010617          	auipc	a2,0x10
80403800:	5d060613          	addi	a2,a2,1488 # 80413dcc <default_pmm_manager+0x164>
80403804:	07400593          	li	a1,116
80403808:	00010517          	auipc	a0,0x10
8040380c:	4b450513          	addi	a0,a0,1204 # 80413cbc <default_pmm_manager+0x54>
80403810:	e15fc0ef          	jal	ra,80400624 <__panic>
80403814:	00010697          	auipc	a3,0x10
80403818:	79068693          	addi	a3,a3,1936 # 80413fa4 <default_pmm_manager+0x33c>
8040381c:	00010617          	auipc	a2,0x10
80403820:	91060613          	addi	a2,a2,-1776 # 8041312c <commands+0x1f8>
80403824:	18100593          	li	a1,385
80403828:	00010517          	auipc	a0,0x10
8040382c:	61050513          	addi	a0,a0,1552 # 80413e38 <default_pmm_manager+0x1d0>
80403830:	df5fc0ef          	jal	ra,80400624 <__panic>

80403834 <tlb_invalidate>:
80403834:	12058073          	sfence.vma	a1
80403838:	00008067          	ret

8040383c <pgdir_alloc_page>:
8040383c:	fe010113          	addi	sp,sp,-32
80403840:	01212823          	sw	s2,16(sp)
80403844:	00050913          	mv	s2,a0
80403848:	00100513          	li	a0,1
8040384c:	00812c23          	sw	s0,24(sp)
80403850:	00912a23          	sw	s1,20(sp)
80403854:	01312623          	sw	s3,12(sp)
80403858:	00112e23          	sw	ra,28(sp)
8040385c:	00058493          	mv	s1,a1
80403860:	00060993          	mv	s3,a2
80403864:	da8ff0ef          	jal	ra,80402e0c <alloc_pages>
80403868:	00050413          	mv	s0,a0
8040386c:	04050e63          	beqz	a0,804038c8 <pgdir_alloc_page+0x8c>
80403870:	00050593          	mv	a1,a0
80403874:	00098693          	mv	a3,s3
80403878:	00048613          	mv	a2,s1
8040387c:	00090513          	mv	a0,s2
80403880:	b55ff0ef          	jal	ra,804033d4 <page_insert>
80403884:	06051263          	bnez	a0,804038e8 <pgdir_alloc_page+0xac>
80403888:	00099797          	auipc	a5,0x99
8040388c:	f1c78793          	addi	a5,a5,-228 # 8049c7a4 <swap_init_ok>
80403890:	0007a783          	lw	a5,0(a5)
80403894:	02078a63          	beqz	a5,804038c8 <pgdir_alloc_page+0x8c>
80403898:	00099797          	auipc	a5,0x99
8040389c:	01878793          	addi	a5,a5,24 # 8049c8b0 <check_mm_struct>
804038a0:	0007a503          	lw	a0,0(a5)
804038a4:	02050263          	beqz	a0,804038c8 <pgdir_alloc_page+0x8c>
804038a8:	00000693          	li	a3,0
804038ac:	00040613          	mv	a2,s0
804038b0:	00048593          	mv	a1,s1
804038b4:	78c000ef          	jal	ra,80404040 <swap_map_swappable>
804038b8:	00042703          	lw	a4,0(s0)
804038bc:	00942e23          	sw	s1,28(s0)
804038c0:	00100793          	li	a5,1
804038c4:	02f71c63          	bne	a4,a5,804038fc <pgdir_alloc_page+0xc0>
804038c8:	00040513          	mv	a0,s0
804038cc:	01c12083          	lw	ra,28(sp)
804038d0:	01812403          	lw	s0,24(sp)
804038d4:	01412483          	lw	s1,20(sp)
804038d8:	01012903          	lw	s2,16(sp)
804038dc:	00c12983          	lw	s3,12(sp)
804038e0:	02010113          	addi	sp,sp,32
804038e4:	00008067          	ret
804038e8:	00040513          	mv	a0,s0
804038ec:	00100593          	li	a1,1
804038f0:	de4ff0ef          	jal	ra,80402ed4 <free_pages>
804038f4:	00000413          	li	s0,0
804038f8:	fd1ff06f          	j	804038c8 <pgdir_alloc_page+0x8c>
804038fc:	00010697          	auipc	a3,0x10
80403900:	54c68693          	addi	a3,a3,1356 # 80413e48 <default_pmm_manager+0x1e0>
80403904:	00010617          	auipc	a2,0x10
80403908:	82860613          	addi	a2,a2,-2008 # 8041312c <commands+0x1f8>
8040390c:	20000593          	li	a1,512
80403910:	00010517          	auipc	a0,0x10
80403914:	52850513          	addi	a0,a0,1320 # 80413e38 <default_pmm_manager+0x1d0>
80403918:	d0dfc0ef          	jal	ra,80400624 <__panic>

8040391c <print_pgdir>:
8040391c:	fa010113          	addi	sp,sp,-96
80403920:	00010517          	auipc	a0,0x10
80403924:	5d850513          	addi	a0,a0,1496 # 80413ef8 <default_pmm_manager+0x290>
80403928:	05512223          	sw	s5,68(sp)
8040392c:	04112e23          	sw	ra,92(sp)
80403930:	04812c23          	sw	s0,88(sp)
80403934:	04912a23          	sw	s1,84(sp)
80403938:	05212823          	sw	s2,80(sp)
8040393c:	05312623          	sw	s3,76(sp)
80403940:	05412423          	sw	s4,72(sp)
80403944:	05612023          	sw	s6,64(sp)
80403948:	03712e23          	sw	s7,60(sp)
8040394c:	03812c23          	sw	s8,56(sp)
80403950:	03912a23          	sw	s9,52(sp)
80403954:	03a12823          	sw	s10,48(sp)
80403958:	03b12623          	sw	s11,44(sp)
8040395c:	8a1fc0ef          	jal	ra,804001fc <cprintf>
80403960:	00000593          	li	a1,0
80403964:	00012a23          	sw	zero,20(sp)
80403968:	00099a97          	auipc	s5,0x99
8040396c:	e98a8a93          	addi	s5,s5,-360 # 8049c800 <va_pa_offset>
80403970:	01410713          	addi	a4,sp,20
80403974:	01010693          	addi	a3,sp,16
80403978:	fafec637          	lui	a2,0xfafec
8040397c:	40000513          	li	a0,1024
80403980:	bc8ff0ef          	jal	ra,80402d48 <get_pgtable_items.isra.4.part.5>
80403984:	00050493          	mv	s1,a0
80403988:	08050663          	beqz	a0,80403a14 <print_pgdir+0xf8>
8040398c:	01412683          	lw	a3,20(sp)
80403990:	01012603          	lw	a2,16(sp)
80403994:	01b49313          	slli	t1,s1,0x1b
80403998:	01d49813          	slli	a6,s1,0x1d
8040399c:	41f35313          	srai	t1,t1,0x1f
804039a0:	41f85813          	srai	a6,a6,0x1f
804039a4:	04837313          	andi	t1,t1,72
804039a8:	40c685b3          	sub	a1,a3,a2
804039ac:	02d30313          	addi	t1,t1,45
804039b0:	04a87813          	andi	a6,a6,74
804039b4:	02d80813          	addi	a6,a6,45
804039b8:	00099797          	auipc	a5,0x99
804039bc:	de478793          	addi	a5,a5,-540 # 8049c79c <str.2051>
804039c0:	00099897          	auipc	a7,0x99
804039c4:	dc688e23          	sb	t1,-548(a7) # 8049c79c <str.2051>
804039c8:	01659713          	slli	a4,a1,0x16
804039cc:	07200313          	li	t1,114
804039d0:	01669693          	slli	a3,a3,0x16
804039d4:	01661613          	slli	a2,a2,0x16
804039d8:	00010517          	auipc	a0,0x10
804039dc:	55450513          	addi	a0,a0,1364 # 80413f2c <default_pmm_manager+0x2c4>
804039e0:	00099897          	auipc	a7,0x99
804039e4:	db088f23          	sb	a6,-578(a7) # 8049c79e <str.2051+0x2>
804039e8:	00099897          	auipc	a7,0x99
804039ec:	da688aa3          	sb	t1,-587(a7) # 8049c79d <str.2051+0x1>
804039f0:	00099817          	auipc	a6,0x99
804039f4:	da0807a3          	sb	zero,-593(a6) # 8049c79f <str.2051+0x3>
804039f8:	805fc0ef          	jal	ra,804001fc <cprintf>
804039fc:	00f4f493          	andi	s1,s1,15
80403a00:	00100793          	li	a5,1
80403a04:	04f48c63          	beq	s1,a5,80403a5c <print_pgdir+0x140>
80403a08:	01412583          	lw	a1,20(sp)
80403a0c:	3ff00793          	li	a5,1023
80403a10:	f6b7f0e3          	bgeu	a5,a1,80403970 <print_pgdir+0x54>
80403a14:	00010517          	auipc	a0,0x10
80403a18:	55c50513          	addi	a0,a0,1372 # 80413f70 <default_pmm_manager+0x308>
80403a1c:	fe0fc0ef          	jal	ra,804001fc <cprintf>
80403a20:	05c12083          	lw	ra,92(sp)
80403a24:	05812403          	lw	s0,88(sp)
80403a28:	05412483          	lw	s1,84(sp)
80403a2c:	05012903          	lw	s2,80(sp)
80403a30:	04c12983          	lw	s3,76(sp)
80403a34:	04812a03          	lw	s4,72(sp)
80403a38:	04412a83          	lw	s5,68(sp)
80403a3c:	04012b03          	lw	s6,64(sp)
80403a40:	03c12b83          	lw	s7,60(sp)
80403a44:	03812c03          	lw	s8,56(sp)
80403a48:	03412c83          	lw	s9,52(sp)
80403a4c:	03012d03          	lw	s10,48(sp)
80403a50:	02c12d83          	lw	s11,44(sp)
80403a54:	06010113          	addi	sp,sp,96
80403a58:	00008067          	ret
80403a5c:	01012783          	lw	a5,16(sp)
80403a60:	01412583          	lw	a1,20(sp)
80403a64:	00000d93          	li	s11,0
80403a68:	00a79313          	slli	t1,a5,0xa
80403a6c:	00f12423          	sw	a5,8(sp)
80403a70:	fafec7b7          	lui	a5,0xfafec
80403a74:	ffc78793          	addi	a5,a5,-4 # fafebffc <end+0x7ab4f740>
80403a78:	00f12623          	sw	a5,12(sp)
80403a7c:	00812783          	lw	a5,8(sp)
80403a80:	00612e23          	sw	t1,28(sp)
80403a84:	40030c93          	addi	s9,t1,1024
80403a88:	12b7fe63          	bgeu	a5,a1,80403bc4 <print_pgdir+0x2a8>
80403a8c:	00c12703          	lw	a4,12(sp)
80403a90:	00178793          	addi	a5,a5,1
80403a94:	00279493          	slli	s1,a5,0x2
80403a98:	00e484b3          	add	s1,s1,a4
80403a9c:	0004a603          	lw	a2,0(s1)
80403aa0:	00099a17          	auipc	s4,0x99
80403aa4:	cf8a0a13          	addi	s4,s4,-776 # 8049c798 <npage>
80403aa8:	fffff9b7          	lui	s3,0xfffff
80403aac:	00261613          	slli	a2,a2,0x2
80403ab0:	000a2703          	lw	a4,0(s4)
80403ab4:	00f12423          	sw	a5,8(sp)
80403ab8:	00001937          	lui	s2,0x1
80403abc:	00c79793          	slli	a5,a5,0xc
80403ac0:	01367633          	and	a2,a2,s3
80403ac4:	40f90933          	sub	s2,s2,a5
80403ac8:	00c65793          	srli	a5,a2,0xc
80403acc:	01c12583          	lw	a1,28(sp)
80403ad0:	07200c13          	li	s8,114
80403ad4:	00099b97          	auipc	s7,0x99
80403ad8:	cc8b8b93          	addi	s7,s7,-824 # 8049c79c <str.2051>
80403adc:	0ae7fe63          	bgeu	a5,a4,80403b98 <print_pgdir+0x27c>
80403ae0:	000aa683          	lw	a3,0(s5)
80403ae4:	00d60633          	add	a2,a2,a3
80403ae8:	01260633          	add	a2,a2,s2
80403aec:	0d95f463          	bgeu	a1,s9,80403bb4 <print_pgdir+0x298>
80403af0:	01c10713          	addi	a4,sp,28
80403af4:	01810693          	addi	a3,sp,24
80403af8:	000c8513          	mv	a0,s9
80403afc:	a4cff0ef          	jal	ra,80402d48 <get_pgtable_items.isra.4.part.5>
80403b00:	00050b13          	mv	s6,a0
80403b04:	0a050863          	beqz	a0,80403bb4 <print_pgdir+0x298>
80403b08:	12ad8663          	beq	s11,a0,80403c34 <print_pgdir+0x318>
80403b0c:	060d8263          	beqz	s11,80403b70 <print_pgdir+0x254>
80403b10:	01bd9e13          	slli	t3,s11,0x1b
80403b14:	01dd9d93          	slli	s11,s11,0x1d
80403b18:	41fe5e13          	srai	t3,t3,0x1f
80403b1c:	41fddd93          	srai	s11,s11,0x1f
80403b20:	408d05b3          	sub	a1,s10,s0
80403b24:	048e7e13          	andi	t3,t3,72
80403b28:	04adfd93          	andi	s11,s11,74
80403b2c:	02de0e13          	addi	t3,t3,45
80403b30:	02dd8d93          	addi	s11,s11,45
80403b34:	000b8793          	mv	a5,s7
80403b38:	00c59713          	slli	a4,a1,0xc
80403b3c:	00cd1693          	slli	a3,s10,0xc
80403b40:	00c41613          	slli	a2,s0,0xc
80403b44:	00010517          	auipc	a0,0x10
80403b48:	40850513          	addi	a0,a0,1032 # 80413f4c <default_pmm_manager+0x2e4>
80403b4c:	00099817          	auipc	a6,0x99
80403b50:	c5c80823          	sb	t3,-944(a6) # 8049c79c <str.2051>
80403b54:	00099817          	auipc	a6,0x99
80403b58:	c58804a3          	sb	s8,-951(a6) # 8049c79d <str.2051+0x1>
80403b5c:	00099817          	auipc	a6,0x99
80403b60:	c5b80123          	sb	s11,-958(a6) # 8049c79e <str.2051+0x2>
80403b64:	00099817          	auipc	a6,0x99
80403b68:	c2080da3          	sb	zero,-965(a6) # 8049c79f <str.2051+0x3>
80403b6c:	e90fc0ef          	jal	ra,804001fc <cprintf>
80403b70:	01c12d03          	lw	s10,28(sp)
80403b74:	01812403          	lw	s0,24(sp)
80403b78:	000b0d93          	mv	s11,s6
80403b7c:	000d0593          	mv	a1,s10
80403b80:	0004a603          	lw	a2,0(s1)
80403b84:	000a2703          	lw	a4,0(s4)
80403b88:	00261613          	slli	a2,a2,0x2
80403b8c:	01367633          	and	a2,a2,s3
80403b90:	00c65793          	srli	a5,a2,0xc
80403b94:	f4e7e6e3          	bltu	a5,a4,80403ae0 <print_pgdir+0x1c4>
80403b98:	00060693          	mv	a3,a2
80403b9c:	2ae00593          	li	a1,686
80403ba0:	00010617          	auipc	a2,0x10
80403ba4:	0f860613          	addi	a2,a2,248 # 80413c98 <default_pmm_manager+0x30>
80403ba8:	00010517          	auipc	a0,0x10
80403bac:	29050513          	addi	a0,a0,656 # 80413e38 <default_pmm_manager+0x1d0>
80403bb0:	a75fc0ef          	jal	ra,80400624 <__panic>
80403bb4:	01412583          	lw	a1,20(sp)
80403bb8:	00812783          	lw	a5,8(sp)
80403bbc:	400c8c93          	addi	s9,s9,1024
80403bc0:	ecb7e6e3          	bltu	a5,a1,80403a8c <print_pgdir+0x170>
80403bc4:	e40d84e3          	beqz	s11,80403a0c <print_pgdir+0xf0>
80403bc8:	01bd9313          	slli	t1,s11,0x1b
80403bcc:	01dd9813          	slli	a6,s11,0x1d
80403bd0:	41f35313          	srai	t1,t1,0x1f
80403bd4:	41f85813          	srai	a6,a6,0x1f
80403bd8:	04837313          	andi	t1,t1,72
80403bdc:	408d05b3          	sub	a1,s10,s0
80403be0:	02d30313          	addi	t1,t1,45
80403be4:	04a87813          	andi	a6,a6,74
80403be8:	02d80813          	addi	a6,a6,45
80403bec:	00099897          	auipc	a7,0x99
80403bf0:	ba688823          	sb	t1,-1104(a7) # 8049c79c <str.2051>
80403bf4:	00099797          	auipc	a5,0x99
80403bf8:	ba878793          	addi	a5,a5,-1112 # 8049c79c <str.2051>
80403bfc:	07200313          	li	t1,114
80403c00:	00c59713          	slli	a4,a1,0xc
80403c04:	00cd1693          	slli	a3,s10,0xc
80403c08:	00c41613          	slli	a2,s0,0xc
80403c0c:	00010517          	auipc	a0,0x10
80403c10:	34050513          	addi	a0,a0,832 # 80413f4c <default_pmm_manager+0x2e4>
80403c14:	00099897          	auipc	a7,0x99
80403c18:	b9088523          	sb	a6,-1142(a7) # 8049c79e <str.2051+0x2>
80403c1c:	00099897          	auipc	a7,0x99
80403c20:	b86880a3          	sb	t1,-1151(a7) # 8049c79d <str.2051+0x1>
80403c24:	00099817          	auipc	a6,0x99
80403c28:	b6080da3          	sb	zero,-1157(a6) # 8049c79f <str.2051+0x3>
80403c2c:	dd0fc0ef          	jal	ra,804001fc <cprintf>
80403c30:	dd9ff06f          	j	80403a08 <print_pgdir+0xec>
80403c34:	01c12d03          	lw	s10,28(sp)
80403c38:	000d0593          	mv	a1,s10
80403c3c:	f45ff06f          	j	80403b80 <print_pgdir+0x264>

80403c40 <pmm_init>:
80403c40:	00010797          	auipc	a5,0x10
80403c44:	02878793          	addi	a5,a5,40 # 80413c68 <default_pmm_manager>
80403c48:	0007a583          	lw	a1,0(a5)
80403c4c:	fe010113          	addi	sp,sp,-32
80403c50:	00010517          	auipc	a0,0x10
80403c54:	20c50513          	addi	a0,a0,524 # 80413e5c <default_pmm_manager+0x1f4>
80403c58:	00112e23          	sw	ra,28(sp)
80403c5c:	00099717          	auipc	a4,0x99
80403c60:	baf72023          	sw	a5,-1120(a4) # 8049c7fc <pmm_manager>
80403c64:	00812c23          	sw	s0,24(sp)
80403c68:	00912a23          	sw	s1,20(sp)
80403c6c:	01212823          	sw	s2,16(sp)
80403c70:	01312623          	sw	s3,12(sp)
80403c74:	01412423          	sw	s4,8(sp)
80403c78:	00099417          	auipc	s0,0x99
80403c7c:	b8440413          	addi	s0,s0,-1148 # 8049c7fc <pmm_manager>
80403c80:	d7cfc0ef          	jal	ra,804001fc <cprintf>
80403c84:	00042783          	lw	a5,0(s0)
80403c88:	ffffc497          	auipc	s1,0xffffc
80403c8c:	37848493          	addi	s1,s1,888 # 80400000 <kern_entry>
80403c90:	0047a783          	lw	a5,4(a5)
80403c94:	000780e7          	jalr	a5
80403c98:	804007b7          	lui	a5,0x80400
80403c9c:	409787b3          	sub	a5,a5,s1
80403ca0:	00010517          	auipc	a0,0x10
80403ca4:	1d450513          	addi	a0,a0,468 # 80413e74 <default_pmm_manager+0x20c>
80403ca8:	00099717          	auipc	a4,0x99
80403cac:	b4f72c23          	sw	a5,-1192(a4) # 8049c800 <va_pa_offset>
80403cb0:	d4cfc0ef          	jal	ra,804001fc <cprintf>
80403cb4:	808005b7          	lui	a1,0x80800
80403cb8:	fff58693          	addi	a3,a1,-1 # 807fffff <end+0x363743>
80403cbc:	00048613          	mv	a2,s1
80403cc0:	409585b3          	sub	a1,a1,s1
80403cc4:	00010517          	auipc	a0,0x10
80403cc8:	1c850513          	addi	a0,a0,456 # 80413e8c <default_pmm_manager+0x224>
80403ccc:	d30fc0ef          	jal	ra,804001fc <cprintf>
80403cd0:	fffff737          	lui	a4,0xfffff
80403cd4:	0009a797          	auipc	a5,0x9a
80403cd8:	be778793          	addi	a5,a5,-1049 # 8049d8bb <end+0xfff>
80403cdc:	00e7f7b3          	and	a5,a5,a4
80403ce0:	00081737          	lui	a4,0x81
80403ce4:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403ce8:	00099697          	auipc	a3,0x99
80403cec:	aae6a823          	sw	a4,-1360(a3) # 8049c798 <npage>
80403cf0:	000106b7          	lui	a3,0x10
80403cf4:	00078513          	mv	a0,a5
80403cf8:	00099717          	auipc	a4,0x99
80403cfc:	b0f72823          	sw	a5,-1264(a4) # 8049c808 <pages>
80403d00:	00d786b3          	add	a3,a5,a3
80403d04:	0047a703          	lw	a4,4(a5)
80403d08:	02078793          	addi	a5,a5,32
80403d0c:	00176713          	ori	a4,a4,1
80403d10:	fee7a223          	sw	a4,-28(a5)
80403d14:	fef698e3          	bne	a3,a5,80403d04 <pmm_init+0xc4>
80403d18:	804007b7          	lui	a5,0x80400
80403d1c:	1cf6ea63          	bltu	a3,a5,80403ef0 <pmm_init+0x2b0>
80403d20:	00099497          	auipc	s1,0x99
80403d24:	ae048493          	addi	s1,s1,-1312 # 8049c800 <va_pa_offset>
80403d28:	0004a783          	lw	a5,0(s1)
80403d2c:	808005b7          	lui	a1,0x80800
80403d30:	40f686b3          	sub	a3,a3,a5
80403d34:	14b6e863          	bltu	a3,a1,80403e84 <pmm_init+0x244>
80403d38:	00100513          	li	a0,1
80403d3c:	8d0ff0ef          	jal	ra,80402e0c <alloc_pages>
80403d40:	20050e63          	beqz	a0,80403f5c <pmm_init+0x31c>
80403d44:	00099797          	auipc	a5,0x99
80403d48:	ac478793          	addi	a5,a5,-1340 # 8049c808 <pages>
80403d4c:	0007a683          	lw	a3,0(a5)
80403d50:	00099797          	auipc	a5,0x99
80403d54:	a4878793          	addi	a5,a5,-1464 # 8049c798 <npage>
80403d58:	0007a703          	lw	a4,0(a5)
80403d5c:	40d506b3          	sub	a3,a0,a3
80403d60:	4056d693          	srai	a3,a3,0x5
80403d64:	00080537          	lui	a0,0x80
80403d68:	00a686b3          	add	a3,a3,a0
80403d6c:	00c69793          	slli	a5,a3,0xc
80403d70:	00c7d793          	srli	a5,a5,0xc
80403d74:	00c69693          	slli	a3,a3,0xc
80403d78:	1ce7f663          	bgeu	a5,a4,80403f44 <pmm_init+0x304>
80403d7c:	0004a783          	lw	a5,0(s1)
80403d80:	00001637          	lui	a2,0x1
80403d84:	00000593          	li	a1,0
80403d88:	00f686b3          	add	a3,a3,a5
80403d8c:	00068513          	mv	a0,a3
80403d90:	00099797          	auipc	a5,0x99
80403d94:	a0d7a223          	sw	a3,-1532(a5) # 8049c794 <boot_pgdir>
80403d98:	7290e0ef          	jal	ra,80412cc0 <memset>
80403d9c:	00099797          	auipc	a5,0x99
80403da0:	9f878793          	addi	a5,a5,-1544 # 8049c794 <boot_pgdir>
80403da4:	0007a903          	lw	s2,0(a5)
80403da8:	80400737          	lui	a4,0x80400
80403dac:	16e96e63          	bltu	s2,a4,80403f28 <pmm_init+0x2e8>
80403db0:	0004a783          	lw	a5,0(s1)
80403db4:	000016b7          	lui	a3,0x1
80403db8:	00d905b3          	add	a1,s2,a3
80403dbc:	40f90533          	sub	a0,s2,a5
80403dc0:	00c55613          	srli	a2,a0,0xc
80403dc4:	00a61613          	slli	a2,a2,0xa
80403dc8:	40f707b3          	sub	a5,a4,a5
80403dcc:	00166813          	ori	a6,a2,1
80403dd0:	00e7c733          	xor	a4,a5,a4
80403dd4:	00766613          	ori	a2,a2,7
80403dd8:	fff68693          	addi	a3,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403ddc:	00099897          	auipc	a7,0x99
80403de0:	a2a8a423          	sw	a0,-1496(a7) # 8049c804 <boot_cr3>
80403de4:	fb05a623          	sw	a6,-84(a1) # 807fffac <end+0x3636f0>
80403de8:	fac5a823          	sw	a2,-80(a1)
80403dec:	00d77733          	and	a4,a4,a3
80403df0:	10071c63          	bnez	a4,80403f08 <pmm_init+0x2c8>
80403df4:	fffff437          	lui	s0,0xfffff
80403df8:	0087f7b3          	and	a5,a5,s0
80403dfc:	7fc00437          	lui	s0,0x7fc00
80403e00:	804004b7          	lui	s1,0x80400
80403e04:	00878433          	add	s0,a5,s0
80403e08:	00001a37          	lui	s4,0x1
80403e0c:	80c009b7          	lui	s3,0x80c00
80403e10:	00100613          	li	a2,1
80403e14:	00048593          	mv	a1,s1
80403e18:	00090513          	mv	a0,s2
80403e1c:	984ff0ef          	jal	ra,80402fa0 <get_pte>
80403e20:	009407b3          	add	a5,s0,s1
80403e24:	0a050663          	beqz	a0,80403ed0 <pmm_init+0x290>
80403e28:	00c7d793          	srli	a5,a5,0xc
80403e2c:	00a79793          	slli	a5,a5,0xa
80403e30:	00f7e793          	ori	a5,a5,15
80403e34:	00f52023          	sw	a5,0(a0) # 80000 <_binary_bin_sfs_img_size+0x8000>
80403e38:	014484b3          	add	s1,s1,s4
80403e3c:	fd349ae3          	bne	s1,s3,80403e10 <pmm_init+0x1d0>
80403e40:	00099797          	auipc	a5,0x99
80403e44:	9c478793          	addi	a5,a5,-1596 # 8049c804 <boot_cr3>
80403e48:	0007a783          	lw	a5,0(a5)
80403e4c:	80000737          	lui	a4,0x80000
80403e50:	00c7d793          	srli	a5,a5,0xc
80403e54:	00e7e7b3          	or	a5,a5,a4
80403e58:	18079073          	csrw	satp,a5
80403e5c:	12000073          	sfence.vma
80403e60:	abdff0ef          	jal	ra,8040391c <print_pgdir>
80403e64:	01812403          	lw	s0,24(sp)
80403e68:	01c12083          	lw	ra,28(sp)
80403e6c:	01412483          	lw	s1,20(sp)
80403e70:	01012903          	lw	s2,16(sp)
80403e74:	00c12983          	lw	s3,12(sp)
80403e78:	00812a03          	lw	s4,8(sp)
80403e7c:	02010113          	addi	sp,sp,32
80403e80:	be5fe06f          	j	80402a64 <kmalloc_init>
80403e84:	000017b7          	lui	a5,0x1
80403e88:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80403e8c:	00f686b3          	add	a3,a3,a5
80403e90:	00081737          	lui	a4,0x81
80403e94:	00c6d793          	srli	a5,a3,0xc
80403e98:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80403e9c:	0ce78c63          	beq	a5,a4,80403f74 <pmm_init+0x334>
80403ea0:	00042703          	lw	a4,0(s0) # 7fc00000 <_binary_bin_sfs_img_size+0x7fb88000>
80403ea4:	fffff637          	lui	a2,0xfffff
80403ea8:	00c6f6b3          	and	a3,a3,a2
80403eac:	fff80637          	lui	a2,0xfff80
80403eb0:	00c787b3          	add	a5,a5,a2
80403eb4:	00872703          	lw	a4,8(a4)
80403eb8:	40d585b3          	sub	a1,a1,a3
80403ebc:	00579793          	slli	a5,a5,0x5
80403ec0:	00c5d593          	srli	a1,a1,0xc
80403ec4:	00f50533          	add	a0,a0,a5
80403ec8:	000700e7          	jalr	a4
80403ecc:	e6dff06f          	j	80403d38 <pmm_init+0xf8>
80403ed0:	00010697          	auipc	a3,0x10
80403ed4:	01868693          	addi	a3,a3,24 # 80413ee8 <default_pmm_manager+0x280>
80403ed8:	0000f617          	auipc	a2,0xf
80403edc:	25460613          	addi	a2,a2,596 # 8041312c <commands+0x1f8>
80403ee0:	0aa00593          	li	a1,170
80403ee4:	00010517          	auipc	a0,0x10
80403ee8:	f5450513          	addi	a0,a0,-172 # 80413e38 <default_pmm_manager+0x1d0>
80403eec:	f38fc0ef          	jal	ra,80400624 <__panic>
80403ef0:	00010617          	auipc	a2,0x10
80403ef4:	ddc60613          	addi	a2,a2,-548 # 80413ccc <default_pmm_manager+0x64>
80403ef8:	08e00593          	li	a1,142
80403efc:	00010517          	auipc	a0,0x10
80403f00:	f3c50513          	addi	a0,a0,-196 # 80413e38 <default_pmm_manager+0x1d0>
80403f04:	f20fc0ef          	jal	ra,80400624 <__panic>
80403f08:	00010697          	auipc	a3,0x10
80403f0c:	fc868693          	addi	a3,a3,-56 # 80413ed0 <default_pmm_manager+0x268>
80403f10:	0000f617          	auipc	a2,0xf
80403f14:	21c60613          	addi	a2,a2,540 # 8041312c <commands+0x1f8>
80403f18:	0a400593          	li	a1,164
80403f1c:	00010517          	auipc	a0,0x10
80403f20:	f1c50513          	addi	a0,a0,-228 # 80413e38 <default_pmm_manager+0x1d0>
80403f24:	f00fc0ef          	jal	ra,80400624 <__panic>
80403f28:	00090693          	mv	a3,s2
80403f2c:	00010617          	auipc	a2,0x10
80403f30:	da060613          	addi	a2,a2,-608 # 80413ccc <default_pmm_manager+0x64>
80403f34:	0d400593          	li	a1,212
80403f38:	00010517          	auipc	a0,0x10
80403f3c:	f0050513          	addi	a0,a0,-256 # 80413e38 <default_pmm_manager+0x1d0>
80403f40:	ee4fc0ef          	jal	ra,80400624 <__panic>
80403f44:	00010617          	auipc	a2,0x10
80403f48:	d5460613          	addi	a2,a2,-684 # 80413c98 <default_pmm_manager+0x30>
80403f4c:	06e00593          	li	a1,110
80403f50:	00010517          	auipc	a0,0x10
80403f54:	d6c50513          	addi	a0,a0,-660 # 80413cbc <default_pmm_manager+0x54>
80403f58:	eccfc0ef          	jal	ra,80400624 <__panic>
80403f5c:	00010617          	auipc	a2,0x10
80403f60:	f5860613          	addi	a2,a2,-168 # 80413eb4 <default_pmm_manager+0x24c>
80403f64:	0b600593          	li	a1,182
80403f68:	00010517          	auipc	a0,0x10
80403f6c:	ed050513          	addi	a0,a0,-304 # 80413e38 <default_pmm_manager+0x1d0>
80403f70:	eb4fc0ef          	jal	ra,80400624 <__panic>
80403f74:	e79fe0ef          	jal	ra,80402dec <pa2page.part.6>

80403f78 <swap_init>:
80403f78:	ff010113          	addi	sp,sp,-16
80403f7c:	00112623          	sw	ra,12(sp)
80403f80:	00812423          	sw	s0,8(sp)
80403f84:	6d4090ef          	jal	ra,8040d658 <swapfs_init>
80403f88:	00099797          	auipc	a5,0x99
80403f8c:	8f878793          	addi	a5,a5,-1800 # 8049c880 <max_swap_offset>
80403f90:	0007a683          	lw	a3,0(a5)
80403f94:	010007b7          	lui	a5,0x1000
80403f98:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf87ff8>
80403f9c:	ff968713          	addi	a4,a3,-7
80403fa0:	06e7ea63          	bltu	a5,a4,80404014 <swap_init+0x9c>
80403fa4:	00095797          	auipc	a5,0x95
80403fa8:	05c78793          	addi	a5,a5,92 # 80499000 <swap_manager_fifo>
80403fac:	0047a703          	lw	a4,4(a5)
80403fb0:	00098697          	auipc	a3,0x98
80403fb4:	7ef6a823          	sw	a5,2032(a3) # 8049c7a0 <sm>
80403fb8:	000700e7          	jalr	a4
80403fbc:	00050413          	mv	s0,a0
80403fc0:	00050c63          	beqz	a0,80403fd8 <swap_init+0x60>
80403fc4:	00040513          	mv	a0,s0
80403fc8:	00c12083          	lw	ra,12(sp)
80403fcc:	00812403          	lw	s0,8(sp)
80403fd0:	01010113          	addi	sp,sp,16
80403fd4:	00008067          	ret
80403fd8:	00098797          	auipc	a5,0x98
80403fdc:	7c878793          	addi	a5,a5,1992 # 8049c7a0 <sm>
80403fe0:	0007a783          	lw	a5,0(a5)
80403fe4:	00010517          	auipc	a0,0x10
80403fe8:	08050513          	addi	a0,a0,128 # 80414064 <default_pmm_manager+0x3fc>
80403fec:	0007a583          	lw	a1,0(a5)
80403ff0:	00100793          	li	a5,1
80403ff4:	00098717          	auipc	a4,0x98
80403ff8:	7af72823          	sw	a5,1968(a4) # 8049c7a4 <swap_init_ok>
80403ffc:	a00fc0ef          	jal	ra,804001fc <cprintf>
80404000:	00040513          	mv	a0,s0
80404004:	00c12083          	lw	ra,12(sp)
80404008:	00812403          	lw	s0,8(sp)
8040400c:	01010113          	addi	sp,sp,16
80404010:	00008067          	ret
80404014:	00010617          	auipc	a2,0x10
80404018:	02460613          	addi	a2,a2,36 # 80414038 <default_pmm_manager+0x3d0>
8040401c:	02500593          	li	a1,37
80404020:	00010517          	auipc	a0,0x10
80404024:	03450513          	addi	a0,a0,52 # 80414054 <default_pmm_manager+0x3ec>
80404028:	dfcfc0ef          	jal	ra,80400624 <__panic>

8040402c <swap_init_mm>:
8040402c:	00098797          	auipc	a5,0x98
80404030:	77478793          	addi	a5,a5,1908 # 8049c7a0 <sm>
80404034:	0007a783          	lw	a5,0(a5)
80404038:	0087a303          	lw	t1,8(a5)
8040403c:	00030067          	jr	t1

80404040 <swap_map_swappable>:
80404040:	00098797          	auipc	a5,0x98
80404044:	76078793          	addi	a5,a5,1888 # 8049c7a0 <sm>
80404048:	0007a783          	lw	a5,0(a5)
8040404c:	0107a303          	lw	t1,16(a5)
80404050:	00030067          	jr	t1

80404054 <swap_out>:
80404054:	fc010113          	addi	sp,sp,-64
80404058:	02112e23          	sw	ra,60(sp)
8040405c:	02812c23          	sw	s0,56(sp)
80404060:	02912a23          	sw	s1,52(sp)
80404064:	03212823          	sw	s2,48(sp)
80404068:	03312623          	sw	s3,44(sp)
8040406c:	03412423          	sw	s4,40(sp)
80404070:	03512223          	sw	s5,36(sp)
80404074:	03612023          	sw	s6,32(sp)
80404078:	01712e23          	sw	s7,28(sp)
8040407c:	01812c23          	sw	s8,24(sp)
80404080:	14058c63          	beqz	a1,804041d8 <swap_out+0x184>
80404084:	00060a93          	mv	s5,a2
80404088:	00050913          	mv	s2,a0
8040408c:	00058a13          	mv	s4,a1
80404090:	00000413          	li	s0,0
80404094:	00098997          	auipc	s3,0x98
80404098:	70c98993          	addi	s3,s3,1804 # 8049c7a0 <sm>
8040409c:	00010b17          	auipc	s6,0x10
804040a0:	03cb0b13          	addi	s6,s6,60 # 804140d8 <default_pmm_manager+0x470>
804040a4:	00010b97          	auipc	s7,0x10
804040a8:	01cb8b93          	addi	s7,s7,28 # 804140c0 <default_pmm_manager+0x458>
804040ac:	0580006f          	j	80404104 <swap_out+0xb0>
804040b0:	00c12783          	lw	a5,12(sp)
804040b4:	00048613          	mv	a2,s1
804040b8:	00040593          	mv	a1,s0
804040bc:	01c7a683          	lw	a3,28(a5)
804040c0:	000b0513          	mv	a0,s6
804040c4:	00140413          	addi	s0,s0,1
804040c8:	00c6d693          	srli	a3,a3,0xc
804040cc:	00168693          	addi	a3,a3,1
804040d0:	92cfc0ef          	jal	ra,804001fc <cprintf>
804040d4:	00c12503          	lw	a0,12(sp)
804040d8:	00100593          	li	a1,1
804040dc:	01c52783          	lw	a5,28(a0)
804040e0:	00c7d793          	srli	a5,a5,0xc
804040e4:	00178793          	addi	a5,a5,1
804040e8:	00879793          	slli	a5,a5,0x8
804040ec:	00fc2023          	sw	a5,0(s8)
804040f0:	de5fe0ef          	jal	ra,80402ed4 <free_pages>
804040f4:	00c92503          	lw	a0,12(s2) # 100c <_binary_bin_swap_img_size-0x6ff4>
804040f8:	00048593          	mv	a1,s1
804040fc:	f38ff0ef          	jal	ra,80403834 <tlb_invalidate>
80404100:	088a0863          	beq	s4,s0,80404190 <swap_out+0x13c>
80404104:	0009a783          	lw	a5,0(s3)
80404108:	000a8613          	mv	a2,s5
8040410c:	00c10593          	addi	a1,sp,12
80404110:	0187a783          	lw	a5,24(a5)
80404114:	00090513          	mv	a0,s2
80404118:	000780e7          	jalr	a5
8040411c:	0a051463          	bnez	a0,804041c4 <swap_out+0x170>
80404120:	00c12783          	lw	a5,12(sp)
80404124:	00c92503          	lw	a0,12(s2)
80404128:	00000613          	li	a2,0
8040412c:	01c7a483          	lw	s1,28(a5)
80404130:	00048593          	mv	a1,s1
80404134:	e6dfe0ef          	jal	ra,80402fa0 <get_pte>
80404138:	00052783          	lw	a5,0(a0)
8040413c:	00050c13          	mv	s8,a0
80404140:	0017f793          	andi	a5,a5,1
80404144:	08078e63          	beqz	a5,804041e0 <swap_out+0x18c>
80404148:	00c12583          	lw	a1,12(sp)
8040414c:	01c5a783          	lw	a5,28(a1)
80404150:	00c7d793          	srli	a5,a5,0xc
80404154:	00178513          	addi	a0,a5,1
80404158:	00851513          	slli	a0,a0,0x8
8040415c:	608090ef          	jal	ra,8040d764 <swapfs_write>
80404160:	f40508e3          	beqz	a0,804040b0 <swap_out+0x5c>
80404164:	000b8513          	mv	a0,s7
80404168:	894fc0ef          	jal	ra,804001fc <cprintf>
8040416c:	0009a783          	lw	a5,0(s3)
80404170:	00c12603          	lw	a2,12(sp)
80404174:	00000693          	li	a3,0
80404178:	0107a783          	lw	a5,16(a5)
8040417c:	00048593          	mv	a1,s1
80404180:	00090513          	mv	a0,s2
80404184:	00140413          	addi	s0,s0,1
80404188:	000780e7          	jalr	a5
8040418c:	f68a1ce3          	bne	s4,s0,80404104 <swap_out+0xb0>
80404190:	00040513          	mv	a0,s0
80404194:	03c12083          	lw	ra,60(sp)
80404198:	03812403          	lw	s0,56(sp)
8040419c:	03412483          	lw	s1,52(sp)
804041a0:	03012903          	lw	s2,48(sp)
804041a4:	02c12983          	lw	s3,44(sp)
804041a8:	02812a03          	lw	s4,40(sp)
804041ac:	02412a83          	lw	s5,36(sp)
804041b0:	02012b03          	lw	s6,32(sp)
804041b4:	01c12b83          	lw	s7,28(sp)
804041b8:	01812c03          	lw	s8,24(sp)
804041bc:	04010113          	addi	sp,sp,64
804041c0:	00008067          	ret
804041c4:	00040593          	mv	a1,s0
804041c8:	00010517          	auipc	a0,0x10
804041cc:	eb050513          	addi	a0,a0,-336 # 80414078 <default_pmm_manager+0x410>
804041d0:	82cfc0ef          	jal	ra,804001fc <cprintf>
804041d4:	fbdff06f          	j	80404190 <swap_out+0x13c>
804041d8:	00000413          	li	s0,0
804041dc:	fb5ff06f          	j	80404190 <swap_out+0x13c>
804041e0:	00010697          	auipc	a3,0x10
804041e4:	ec868693          	addi	a3,a3,-312 # 804140a8 <default_pmm_manager+0x440>
804041e8:	0000f617          	auipc	a2,0xf
804041ec:	f4460613          	addi	a2,a2,-188 # 8041312c <commands+0x1f8>
804041f0:	05500593          	li	a1,85
804041f4:	00010517          	auipc	a0,0x10
804041f8:	e6050513          	addi	a0,a0,-416 # 80414054 <default_pmm_manager+0x3ec>
804041fc:	c28fc0ef          	jal	ra,80400624 <__panic>

80404200 <swap_in>:
80404200:	fe010113          	addi	sp,sp,-32
80404204:	01212823          	sw	s2,16(sp)
80404208:	00050913          	mv	s2,a0
8040420c:	00100513          	li	a0,1
80404210:	00912a23          	sw	s1,20(sp)
80404214:	01312623          	sw	s3,12(sp)
80404218:	00112e23          	sw	ra,28(sp)
8040421c:	00812c23          	sw	s0,24(sp)
80404220:	00058493          	mv	s1,a1
80404224:	00060993          	mv	s3,a2
80404228:	be5fe0ef          	jal	ra,80402e0c <alloc_pages>
8040422c:	06050263          	beqz	a0,80404290 <swap_in+0x90>
80404230:	00050413          	mv	s0,a0
80404234:	00c92503          	lw	a0,12(s2)
80404238:	00000613          	li	a2,0
8040423c:	00048593          	mv	a1,s1
80404240:	d61fe0ef          	jal	ra,80402fa0 <get_pte>
80404244:	00050913          	mv	s2,a0
80404248:	00052503          	lw	a0,0(a0)
8040424c:	00040593          	mv	a1,s0
80404250:	454090ef          	jal	ra,8040d6a4 <swapfs_read>
80404254:	00092583          	lw	a1,0(s2)
80404258:	00048613          	mv	a2,s1
8040425c:	00010517          	auipc	a0,0x10
80404260:	d9c50513          	addi	a0,a0,-612 # 80413ff8 <default_pmm_manager+0x390>
80404264:	0085d593          	srli	a1,a1,0x8
80404268:	f95fb0ef          	jal	ra,804001fc <cprintf>
8040426c:	01c12083          	lw	ra,28(sp)
80404270:	0089a023          	sw	s0,0(s3)
80404274:	01812403          	lw	s0,24(sp)
80404278:	01412483          	lw	s1,20(sp)
8040427c:	01012903          	lw	s2,16(sp)
80404280:	00c12983          	lw	s3,12(sp)
80404284:	00000513          	li	a0,0
80404288:	02010113          	addi	sp,sp,32
8040428c:	00008067          	ret
80404290:	00010697          	auipc	a3,0x10
80404294:	d5868693          	addi	a3,a3,-680 # 80413fe8 <default_pmm_manager+0x380>
80404298:	0000f617          	auipc	a2,0xf
8040429c:	e9460613          	addi	a2,a2,-364 # 8041312c <commands+0x1f8>
804042a0:	06b00593          	li	a1,107
804042a4:	00010517          	auipc	a0,0x10
804042a8:	db050513          	addi	a0,a0,-592 # 80414054 <default_pmm_manager+0x3ec>
804042ac:	b78fc0ef          	jal	ra,80400624 <__panic>

804042b0 <_fifo_init_mm>:
804042b0:	00098797          	auipc	a5,0x98
804042b4:	5f878793          	addi	a5,a5,1528 # 8049c8a8 <pra_list_head>
804042b8:	00f52a23          	sw	a5,20(a0)
804042bc:	00f7a223          	sw	a5,4(a5)
804042c0:	00f7a023          	sw	a5,0(a5)
804042c4:	00000513          	li	a0,0
804042c8:	00008067          	ret

804042cc <_fifo_init>:
804042cc:	00000513          	li	a0,0
804042d0:	00008067          	ret

804042d4 <_fifo_set_unswappable>:
804042d4:	00000513          	li	a0,0
804042d8:	00008067          	ret

804042dc <_fifo_tick_event>:
804042dc:	00000513          	li	a0,0
804042e0:	00008067          	ret

804042e4 <_fifo_check_swap>:
804042e4:	fd010113          	addi	sp,sp,-48
804042e8:	01312e23          	sw	s3,28(sp)
804042ec:	01412c23          	sw	s4,24(sp)
804042f0:	00010517          	auipc	a0,0x10
804042f4:	e2850513          	addi	a0,a0,-472 # 80414118 <default_pmm_manager+0x4b0>
804042f8:	000039b7          	lui	s3,0x3
804042fc:	00c00a13          	li	s4,12
80404300:	02812423          	sw	s0,40(sp)
80404304:	02912223          	sw	s1,36(sp)
80404308:	02112623          	sw	ra,44(sp)
8040430c:	03212023          	sw	s2,32(sp)
80404310:	01512a23          	sw	s5,20(sp)
80404314:	01612823          	sw	s6,16(sp)
80404318:	01712623          	sw	s7,12(sp)
8040431c:	01812423          	sw	s8,8(sp)
80404320:	01912223          	sw	s9,4(sp)
80404324:	00098417          	auipc	s0,0x98
80404328:	48440413          	addi	s0,s0,1156 # 8049c7a8 <pgfault_num>
8040432c:	ed1fb0ef          	jal	ra,804001fc <cprintf>
80404330:	01498023          	sb	s4,0(s3) # 3000 <_binary_bin_swap_img_size-0x5000>
80404334:	00042483          	lw	s1,0(s0)
80404338:	00400793          	li	a5,4
8040433c:	18f49863          	bne	s1,a5,804044cc <_fifo_check_swap+0x1e8>
80404340:	00010517          	auipc	a0,0x10
80404344:	e2850513          	addi	a0,a0,-472 # 80414168 <default_pmm_manager+0x500>
80404348:	00001b37          	lui	s6,0x1
8040434c:	00a00b93          	li	s7,10
80404350:	eadfb0ef          	jal	ra,804001fc <cprintf>
80404354:	017b0023          	sb	s7,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
80404358:	00042903          	lw	s2,0(s0)
8040435c:	2e991863          	bne	s2,s1,8040464c <_fifo_check_swap+0x368>
80404360:	00010517          	auipc	a0,0x10
80404364:	e3050513          	addi	a0,a0,-464 # 80414190 <default_pmm_manager+0x528>
80404368:	00004c37          	lui	s8,0x4
8040436c:	00d00c93          	li	s9,13
80404370:	e8dfb0ef          	jal	ra,804001fc <cprintf>
80404374:	019c0023          	sb	s9,0(s8) # 4000 <_binary_bin_swap_img_size-0x4000>
80404378:	00042a83          	lw	s5,0(s0)
8040437c:	2b2a9863          	bne	s5,s2,8040462c <_fifo_check_swap+0x348>
80404380:	00010517          	auipc	a0,0x10
80404384:	e3850513          	addi	a0,a0,-456 # 804141b8 <default_pmm_manager+0x550>
80404388:	000024b7          	lui	s1,0x2
8040438c:	00b00913          	li	s2,11
80404390:	e6dfb0ef          	jal	ra,804001fc <cprintf>
80404394:	01248023          	sb	s2,0(s1) # 2000 <_binary_bin_swap_img_size-0x6000>
80404398:	00042783          	lw	a5,0(s0)
8040439c:	27579863          	bne	a5,s5,8040460c <_fifo_check_swap+0x328>
804043a0:	00010517          	auipc	a0,0x10
804043a4:	e4050513          	addi	a0,a0,-448 # 804141e0 <default_pmm_manager+0x578>
804043a8:	e55fb0ef          	jal	ra,804001fc <cprintf>
804043ac:	000057b7          	lui	a5,0x5
804043b0:	00e00713          	li	a4,14
804043b4:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
804043b8:	00042a83          	lw	s5,0(s0)
804043bc:	00500793          	li	a5,5
804043c0:	22fa9663          	bne	s5,a5,804045ec <_fifo_check_swap+0x308>
804043c4:	00010517          	auipc	a0,0x10
804043c8:	df450513          	addi	a0,a0,-524 # 804141b8 <default_pmm_manager+0x550>
804043cc:	e31fb0ef          	jal	ra,804001fc <cprintf>
804043d0:	01248023          	sb	s2,0(s1)
804043d4:	00042783          	lw	a5,0(s0)
804043d8:	1f579a63          	bne	a5,s5,804045cc <_fifo_check_swap+0x2e8>
804043dc:	00010517          	auipc	a0,0x10
804043e0:	d8c50513          	addi	a0,a0,-628 # 80414168 <default_pmm_manager+0x500>
804043e4:	e19fb0ef          	jal	ra,804001fc <cprintf>
804043e8:	017b0023          	sb	s7,0(s6)
804043ec:	00042703          	lw	a4,0(s0)
804043f0:	00600793          	li	a5,6
804043f4:	1af71c63          	bne	a4,a5,804045ac <_fifo_check_swap+0x2c8>
804043f8:	00010517          	auipc	a0,0x10
804043fc:	dc050513          	addi	a0,a0,-576 # 804141b8 <default_pmm_manager+0x550>
80404400:	dfdfb0ef          	jal	ra,804001fc <cprintf>
80404404:	01248023          	sb	s2,0(s1)
80404408:	00042703          	lw	a4,0(s0)
8040440c:	00700793          	li	a5,7
80404410:	16f71e63          	bne	a4,a5,8040458c <_fifo_check_swap+0x2a8>
80404414:	00010517          	auipc	a0,0x10
80404418:	d0450513          	addi	a0,a0,-764 # 80414118 <default_pmm_manager+0x4b0>
8040441c:	de1fb0ef          	jal	ra,804001fc <cprintf>
80404420:	01498023          	sb	s4,0(s3)
80404424:	00042703          	lw	a4,0(s0)
80404428:	00800793          	li	a5,8
8040442c:	14f71063          	bne	a4,a5,8040456c <_fifo_check_swap+0x288>
80404430:	00010517          	auipc	a0,0x10
80404434:	d6050513          	addi	a0,a0,-672 # 80414190 <default_pmm_manager+0x528>
80404438:	dc5fb0ef          	jal	ra,804001fc <cprintf>
8040443c:	019c0023          	sb	s9,0(s8)
80404440:	00042703          	lw	a4,0(s0)
80404444:	00900793          	li	a5,9
80404448:	10f71263          	bne	a4,a5,8040454c <_fifo_check_swap+0x268>
8040444c:	00010517          	auipc	a0,0x10
80404450:	d9450513          	addi	a0,a0,-620 # 804141e0 <default_pmm_manager+0x578>
80404454:	da9fb0ef          	jal	ra,804001fc <cprintf>
80404458:	000057b7          	lui	a5,0x5
8040445c:	00e00713          	li	a4,14
80404460:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80404464:	00042483          	lw	s1,0(s0)
80404468:	00a00793          	li	a5,10
8040446c:	0cf49063          	bne	s1,a5,8040452c <_fifo_check_swap+0x248>
80404470:	00010517          	auipc	a0,0x10
80404474:	cf850513          	addi	a0,a0,-776 # 80414168 <default_pmm_manager+0x500>
80404478:	d85fb0ef          	jal	ra,804001fc <cprintf>
8040447c:	000017b7          	lui	a5,0x1
80404480:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
80404484:	08979463          	bne	a5,s1,8040450c <_fifo_check_swap+0x228>
80404488:	00042703          	lw	a4,0(s0)
8040448c:	00b00793          	li	a5,11
80404490:	04f71e63          	bne	a4,a5,804044ec <_fifo_check_swap+0x208>
80404494:	02c12083          	lw	ra,44(sp)
80404498:	02812403          	lw	s0,40(sp)
8040449c:	02412483          	lw	s1,36(sp)
804044a0:	02012903          	lw	s2,32(sp)
804044a4:	01c12983          	lw	s3,28(sp)
804044a8:	01812a03          	lw	s4,24(sp)
804044ac:	01412a83          	lw	s5,20(sp)
804044b0:	01012b03          	lw	s6,16(sp)
804044b4:	00c12b83          	lw	s7,12(sp)
804044b8:	00812c03          	lw	s8,8(sp)
804044bc:	00412c83          	lw	s9,4(sp)
804044c0:	00000513          	li	a0,0
804044c4:	03010113          	addi	sp,sp,48
804044c8:	00008067          	ret
804044cc:	00010697          	auipc	a3,0x10
804044d0:	c7468693          	addi	a3,a3,-908 # 80414140 <default_pmm_manager+0x4d8>
804044d4:	0000f617          	auipc	a2,0xf
804044d8:	c5860613          	addi	a2,a2,-936 # 8041312c <commands+0x1f8>
804044dc:	05f00593          	li	a1,95
804044e0:	00010517          	auipc	a0,0x10
804044e4:	c7450513          	addi	a0,a0,-908 # 80414154 <default_pmm_manager+0x4ec>
804044e8:	93cfc0ef          	jal	ra,80400624 <__panic>
804044ec:	00010697          	auipc	a3,0x10
804044f0:	db868693          	addi	a3,a3,-584 # 804142a4 <default_pmm_manager+0x63c>
804044f4:	0000f617          	auipc	a2,0xf
804044f8:	c3860613          	addi	a2,a2,-968 # 8041312c <commands+0x1f8>
804044fc:	08100593          	li	a1,129
80404500:	00010517          	auipc	a0,0x10
80404504:	c5450513          	addi	a0,a0,-940 # 80414154 <default_pmm_manager+0x4ec>
80404508:	91cfc0ef          	jal	ra,80400624 <__panic>
8040450c:	00010697          	auipc	a3,0x10
80404510:	d7468693          	addi	a3,a3,-652 # 80414280 <default_pmm_manager+0x618>
80404514:	0000f617          	auipc	a2,0xf
80404518:	c1860613          	addi	a2,a2,-1000 # 8041312c <commands+0x1f8>
8040451c:	07f00593          	li	a1,127
80404520:	00010517          	auipc	a0,0x10
80404524:	c3450513          	addi	a0,a0,-972 # 80414154 <default_pmm_manager+0x4ec>
80404528:	8fcfc0ef          	jal	ra,80400624 <__panic>
8040452c:	00010697          	auipc	a3,0x10
80404530:	d4068693          	addi	a3,a3,-704 # 8041426c <default_pmm_manager+0x604>
80404534:	0000f617          	auipc	a2,0xf
80404538:	bf860613          	addi	a2,a2,-1032 # 8041312c <commands+0x1f8>
8040453c:	07d00593          	li	a1,125
80404540:	00010517          	auipc	a0,0x10
80404544:	c1450513          	addi	a0,a0,-1004 # 80414154 <default_pmm_manager+0x4ec>
80404548:	8dcfc0ef          	jal	ra,80400624 <__panic>
8040454c:	00010697          	auipc	a3,0x10
80404550:	d0c68693          	addi	a3,a3,-756 # 80414258 <default_pmm_manager+0x5f0>
80404554:	0000f617          	auipc	a2,0xf
80404558:	bd860613          	addi	a2,a2,-1064 # 8041312c <commands+0x1f8>
8040455c:	07a00593          	li	a1,122
80404560:	00010517          	auipc	a0,0x10
80404564:	bf450513          	addi	a0,a0,-1036 # 80414154 <default_pmm_manager+0x4ec>
80404568:	8bcfc0ef          	jal	ra,80400624 <__panic>
8040456c:	00010697          	auipc	a3,0x10
80404570:	cd868693          	addi	a3,a3,-808 # 80414244 <default_pmm_manager+0x5dc>
80404574:	0000f617          	auipc	a2,0xf
80404578:	bb860613          	addi	a2,a2,-1096 # 8041312c <commands+0x1f8>
8040457c:	07700593          	li	a1,119
80404580:	00010517          	auipc	a0,0x10
80404584:	bd450513          	addi	a0,a0,-1068 # 80414154 <default_pmm_manager+0x4ec>
80404588:	89cfc0ef          	jal	ra,80400624 <__panic>
8040458c:	00010697          	auipc	a3,0x10
80404590:	ca468693          	addi	a3,a3,-860 # 80414230 <default_pmm_manager+0x5c8>
80404594:	0000f617          	auipc	a2,0xf
80404598:	b9860613          	addi	a2,a2,-1128 # 8041312c <commands+0x1f8>
8040459c:	07400593          	li	a1,116
804045a0:	00010517          	auipc	a0,0x10
804045a4:	bb450513          	addi	a0,a0,-1100 # 80414154 <default_pmm_manager+0x4ec>
804045a8:	87cfc0ef          	jal	ra,80400624 <__panic>
804045ac:	00010697          	auipc	a3,0x10
804045b0:	c7068693          	addi	a3,a3,-912 # 8041421c <default_pmm_manager+0x5b4>
804045b4:	0000f617          	auipc	a2,0xf
804045b8:	b7860613          	addi	a2,a2,-1160 # 8041312c <commands+0x1f8>
804045bc:	07100593          	li	a1,113
804045c0:	00010517          	auipc	a0,0x10
804045c4:	b9450513          	addi	a0,a0,-1132 # 80414154 <default_pmm_manager+0x4ec>
804045c8:	85cfc0ef          	jal	ra,80400624 <__panic>
804045cc:	00010697          	auipc	a3,0x10
804045d0:	c3c68693          	addi	a3,a3,-964 # 80414208 <default_pmm_manager+0x5a0>
804045d4:	0000f617          	auipc	a2,0xf
804045d8:	b5860613          	addi	a2,a2,-1192 # 8041312c <commands+0x1f8>
804045dc:	06e00593          	li	a1,110
804045e0:	00010517          	auipc	a0,0x10
804045e4:	b7450513          	addi	a0,a0,-1164 # 80414154 <default_pmm_manager+0x4ec>
804045e8:	83cfc0ef          	jal	ra,80400624 <__panic>
804045ec:	00010697          	auipc	a3,0x10
804045f0:	c1c68693          	addi	a3,a3,-996 # 80414208 <default_pmm_manager+0x5a0>
804045f4:	0000f617          	auipc	a2,0xf
804045f8:	b3860613          	addi	a2,a2,-1224 # 8041312c <commands+0x1f8>
804045fc:	06b00593          	li	a1,107
80404600:	00010517          	auipc	a0,0x10
80404604:	b5450513          	addi	a0,a0,-1196 # 80414154 <default_pmm_manager+0x4ec>
80404608:	81cfc0ef          	jal	ra,80400624 <__panic>
8040460c:	00010697          	auipc	a3,0x10
80404610:	b3468693          	addi	a3,a3,-1228 # 80414140 <default_pmm_manager+0x4d8>
80404614:	0000f617          	auipc	a2,0xf
80404618:	b1860613          	addi	a2,a2,-1256 # 8041312c <commands+0x1f8>
8040461c:	06800593          	li	a1,104
80404620:	00010517          	auipc	a0,0x10
80404624:	b3450513          	addi	a0,a0,-1228 # 80414154 <default_pmm_manager+0x4ec>
80404628:	ffdfb0ef          	jal	ra,80400624 <__panic>
8040462c:	00010697          	auipc	a3,0x10
80404630:	b1468693          	addi	a3,a3,-1260 # 80414140 <default_pmm_manager+0x4d8>
80404634:	0000f617          	auipc	a2,0xf
80404638:	af860613          	addi	a2,a2,-1288 # 8041312c <commands+0x1f8>
8040463c:	06500593          	li	a1,101
80404640:	00010517          	auipc	a0,0x10
80404644:	b1450513          	addi	a0,a0,-1260 # 80414154 <default_pmm_manager+0x4ec>
80404648:	fddfb0ef          	jal	ra,80400624 <__panic>
8040464c:	00010697          	auipc	a3,0x10
80404650:	af468693          	addi	a3,a3,-1292 # 80414140 <default_pmm_manager+0x4d8>
80404654:	0000f617          	auipc	a2,0xf
80404658:	ad860613          	addi	a2,a2,-1320 # 8041312c <commands+0x1f8>
8040465c:	06200593          	li	a1,98
80404660:	00010517          	auipc	a0,0x10
80404664:	af450513          	addi	a0,a0,-1292 # 80414154 <default_pmm_manager+0x4ec>
80404668:	fbdfb0ef          	jal	ra,80400624 <__panic>

8040466c <_fifo_swap_out_victim>:
8040466c:	01452783          	lw	a5,20(a0)
80404670:	ff010113          	addi	sp,sp,-16
80404674:	00112623          	sw	ra,12(sp)
80404678:	02078a63          	beqz	a5,804046ac <_fifo_swap_out_victim+0x40>
8040467c:	04061863          	bnez	a2,804046cc <_fifo_swap_out_victim+0x60>
80404680:	0047a783          	lw	a5,4(a5)
80404684:	00c12083          	lw	ra,12(sp)
80404688:	00000513          	li	a0,0
8040468c:	0007a683          	lw	a3,0(a5)
80404690:	0047a703          	lw	a4,4(a5)
80404694:	fec78793          	addi	a5,a5,-20
80404698:	00e6a223          	sw	a4,4(a3)
8040469c:	00d72023          	sw	a3,0(a4)
804046a0:	00f5a023          	sw	a5,0(a1)
804046a4:	01010113          	addi	sp,sp,16
804046a8:	00008067          	ret
804046ac:	00010697          	auipc	a3,0x10
804046b0:	c2c68693          	addi	a3,a3,-980 # 804142d8 <default_pmm_manager+0x670>
804046b4:	0000f617          	auipc	a2,0xf
804046b8:	a7860613          	addi	a2,a2,-1416 # 8041312c <commands+0x1f8>
804046bc:	05000593          	li	a1,80
804046c0:	00010517          	auipc	a0,0x10
804046c4:	a9450513          	addi	a0,a0,-1388 # 80414154 <default_pmm_manager+0x4ec>
804046c8:	f5dfb0ef          	jal	ra,80400624 <__panic>
804046cc:	00010697          	auipc	a3,0x10
804046d0:	c1c68693          	addi	a3,a3,-996 # 804142e8 <default_pmm_manager+0x680>
804046d4:	0000f617          	auipc	a2,0xf
804046d8:	a5860613          	addi	a2,a2,-1448 # 8041312c <commands+0x1f8>
804046dc:	05100593          	li	a1,81
804046e0:	00010517          	auipc	a0,0x10
804046e4:	a7450513          	addi	a0,a0,-1420 # 80414154 <default_pmm_manager+0x4ec>
804046e8:	f3dfb0ef          	jal	ra,80400624 <__panic>

804046ec <_fifo_map_swappable>:
804046ec:	01460713          	addi	a4,a2,20
804046f0:	01452783          	lw	a5,20(a0)
804046f4:	02070263          	beqz	a4,80404718 <_fifo_map_swappable+0x2c>
804046f8:	02078063          	beqz	a5,80404718 <_fifo_map_swappable+0x2c>
804046fc:	0007a683          	lw	a3,0(a5)
80404700:	00e7a023          	sw	a4,0(a5)
80404704:	00000513          	li	a0,0
80404708:	00e6a223          	sw	a4,4(a3)
8040470c:	00f62c23          	sw	a5,24(a2)
80404710:	00d62a23          	sw	a3,20(a2)
80404714:	00008067          	ret
80404718:	ff010113          	addi	sp,sp,-16
8040471c:	00010697          	auipc	a3,0x10
80404720:	b9c68693          	addi	a3,a3,-1124 # 804142b8 <default_pmm_manager+0x650>
80404724:	0000f617          	auipc	a2,0xf
80404728:	a0860613          	addi	a2,a2,-1528 # 8041312c <commands+0x1f8>
8040472c:	03f00593          	li	a1,63
80404730:	00010517          	auipc	a0,0x10
80404734:	a2450513          	addi	a0,a0,-1500 # 80414154 <default_pmm_manager+0x4ec>
80404738:	00112623          	sw	ra,12(sp)
8040473c:	ee9fb0ef          	jal	ra,80400624 <__panic>

80404740 <check_vma_overlap.isra.2.part.3>:
80404740:	ff010113          	addi	sp,sp,-16
80404744:	00010697          	auipc	a3,0x10
80404748:	bc868693          	addi	a3,a3,-1080 # 8041430c <default_pmm_manager+0x6a4>
8040474c:	0000f617          	auipc	a2,0xf
80404750:	9e060613          	addi	a2,a2,-1568 # 8041312c <commands+0x1f8>
80404754:	06d00593          	li	a1,109
80404758:	00010517          	auipc	a0,0x10
8040475c:	bd450513          	addi	a0,a0,-1068 # 8041432c <default_pmm_manager+0x6c4>
80404760:	00112623          	sw	ra,12(sp)
80404764:	ec1fb0ef          	jal	ra,80400624 <__panic>

80404768 <mm_create>:
80404768:	ff010113          	addi	sp,sp,-16
8040476c:	02c00513          	li	a0,44
80404770:	00812423          	sw	s0,8(sp)
80404774:	00112623          	sw	ra,12(sp)
80404778:	b14fe0ef          	jal	ra,80402a8c <kmalloc>
8040477c:	00050413          	mv	s0,a0
80404780:	02050e63          	beqz	a0,804047bc <mm_create+0x54>
80404784:	00098797          	auipc	a5,0x98
80404788:	02078793          	addi	a5,a5,32 # 8049c7a4 <swap_init_ok>
8040478c:	0007a783          	lw	a5,0(a5)
80404790:	00a42223          	sw	a0,4(s0)
80404794:	00a42023          	sw	a0,0(s0)
80404798:	00052423          	sw	zero,8(a0)
8040479c:	00052623          	sw	zero,12(a0)
804047a0:	00052823          	sw	zero,16(a0)
804047a4:	02079663          	bnez	a5,804047d0 <mm_create+0x68>
804047a8:	00052a23          	sw	zero,20(a0)
804047ac:	00042c23          	sw	zero,24(s0)
804047b0:	00100593          	li	a1,1
804047b4:	01c40513          	addi	a0,s0,28
804047b8:	275000ef          	jal	ra,8040522c <sem_init>
804047bc:	00040513          	mv	a0,s0
804047c0:	00c12083          	lw	ra,12(sp)
804047c4:	00812403          	lw	s0,8(sp)
804047c8:	01010113          	addi	sp,sp,16
804047cc:	00008067          	ret
804047d0:	85dff0ef          	jal	ra,8040402c <swap_init_mm>
804047d4:	fd9ff06f          	j	804047ac <mm_create+0x44>

804047d8 <find_vma>:
804047d8:	04050263          	beqz	a0,8040481c <find_vma+0x44>
804047dc:	00852783          	lw	a5,8(a0)
804047e0:	00078663          	beqz	a5,804047ec <find_vma+0x14>
804047e4:	0047a703          	lw	a4,4(a5)
804047e8:	04e5f063          	bgeu	a1,a4,80404828 <find_vma+0x50>
804047ec:	00050793          	mv	a5,a0
804047f0:	0047a783          	lw	a5,4(a5)
804047f4:	02f50463          	beq	a0,a5,8040481c <find_vma+0x44>
804047f8:	ff47a703          	lw	a4,-12(a5)
804047fc:	fee5eae3          	bltu	a1,a4,804047f0 <find_vma+0x18>
80404800:	ff87a703          	lw	a4,-8(a5)
80404804:	fee5f6e3          	bgeu	a1,a4,804047f0 <find_vma+0x18>
80404808:	ff078793          	addi	a5,a5,-16
8040480c:	00078863          	beqz	a5,8040481c <find_vma+0x44>
80404810:	00f52423          	sw	a5,8(a0)
80404814:	00078513          	mv	a0,a5
80404818:	00008067          	ret
8040481c:	00000793          	li	a5,0
80404820:	00078513          	mv	a0,a5
80404824:	00008067          	ret
80404828:	0087a703          	lw	a4,8(a5)
8040482c:	fce5f0e3          	bgeu	a1,a4,804047ec <find_vma+0x14>
80404830:	00f52423          	sw	a5,8(a0)
80404834:	fe1ff06f          	j	80404814 <find_vma+0x3c>

80404838 <insert_vma_struct>:
80404838:	0045a603          	lw	a2,4(a1)
8040483c:	0085a803          	lw	a6,8(a1)
80404840:	ff010113          	addi	sp,sp,-16
80404844:	00112623          	sw	ra,12(sp)
80404848:	00050713          	mv	a4,a0
8040484c:	01066a63          	bltu	a2,a6,80404860 <insert_vma_struct+0x28>
80404850:	07c0006f          	j	804048cc <insert_vma_struct+0x94>
80404854:	ff47a683          	lw	a3,-12(a5)
80404858:	06d66463          	bltu	a2,a3,804048c0 <insert_vma_struct+0x88>
8040485c:	00078713          	mv	a4,a5
80404860:	00472783          	lw	a5,4(a4)
80404864:	fef518e3          	bne	a0,a5,80404854 <insert_vma_struct+0x1c>
80404868:	02a70463          	beq	a4,a0,80404890 <insert_vma_struct+0x58>
8040486c:	ff872683          	lw	a3,-8(a4)
80404870:	ff472883          	lw	a7,-12(a4)
80404874:	08d8fc63          	bgeu	a7,a3,8040490c <insert_vma_struct+0xd4>
80404878:	06d66a63          	bltu	a2,a3,804048ec <insert_vma_struct+0xb4>
8040487c:	00f50a63          	beq	a0,a5,80404890 <insert_vma_struct+0x58>
80404880:	ff47a683          	lw	a3,-12(a5)
80404884:	0706e463          	bltu	a3,a6,804048ec <insert_vma_struct+0xb4>
80404888:	ff87a603          	lw	a2,-8(a5)
8040488c:	02c6fe63          	bgeu	a3,a2,804048c8 <insert_vma_struct+0x90>
80404890:	01052683          	lw	a3,16(a0)
80404894:	00a5a023          	sw	a0,0(a1)
80404898:	01058613          	addi	a2,a1,16
8040489c:	00c7a023          	sw	a2,0(a5)
804048a0:	00c72223          	sw	a2,4(a4)
804048a4:	00c12083          	lw	ra,12(sp)
804048a8:	00f5aa23          	sw	a5,20(a1)
804048ac:	00e5a823          	sw	a4,16(a1)
804048b0:	00168693          	addi	a3,a3,1
804048b4:	00d52823          	sw	a3,16(a0)
804048b8:	01010113          	addi	sp,sp,16
804048bc:	00008067          	ret
804048c0:	faa716e3          	bne	a4,a0,8040486c <insert_vma_struct+0x34>
804048c4:	fc1ff06f          	j	80404884 <insert_vma_struct+0x4c>
804048c8:	e79ff0ef          	jal	ra,80404740 <check_vma_overlap.isra.2.part.3>
804048cc:	00010697          	auipc	a3,0x10
804048d0:	b6c68693          	addi	a3,a3,-1172 # 80414438 <default_pmm_manager+0x7d0>
804048d4:	0000f617          	auipc	a2,0xf
804048d8:	85860613          	addi	a2,a2,-1960 # 8041312c <commands+0x1f8>
804048dc:	07200593          	li	a1,114
804048e0:	00010517          	auipc	a0,0x10
804048e4:	a4c50513          	addi	a0,a0,-1460 # 8041432c <default_pmm_manager+0x6c4>
804048e8:	d3dfb0ef          	jal	ra,80400624 <__panic>
804048ec:	00010697          	auipc	a3,0x10
804048f0:	b8868693          	addi	a3,a3,-1144 # 80414474 <default_pmm_manager+0x80c>
804048f4:	0000f617          	auipc	a2,0xf
804048f8:	83860613          	addi	a2,a2,-1992 # 8041312c <commands+0x1f8>
804048fc:	06c00593          	li	a1,108
80404900:	00010517          	auipc	a0,0x10
80404904:	a2c50513          	addi	a0,a0,-1492 # 8041432c <default_pmm_manager+0x6c4>
80404908:	d1dfb0ef          	jal	ra,80400624 <__panic>
8040490c:	00010697          	auipc	a3,0x10
80404910:	b4868693          	addi	a3,a3,-1208 # 80414454 <default_pmm_manager+0x7ec>
80404914:	0000f617          	auipc	a2,0xf
80404918:	81860613          	addi	a2,a2,-2024 # 8041312c <commands+0x1f8>
8040491c:	06b00593          	li	a1,107
80404920:	00010517          	auipc	a0,0x10
80404924:	a0c50513          	addi	a0,a0,-1524 # 8041432c <default_pmm_manager+0x6c4>
80404928:	cfdfb0ef          	jal	ra,80400624 <__panic>

8040492c <mm_destroy>:
8040492c:	01852783          	lw	a5,24(a0)
80404930:	ff010113          	addi	sp,sp,-16
80404934:	00112623          	sw	ra,12(sp)
80404938:	00812423          	sw	s0,8(sp)
8040493c:	04079263          	bnez	a5,80404980 <mm_destroy+0x54>
80404940:	00050413          	mv	s0,a0
80404944:	00452503          	lw	a0,4(a0)
80404948:	02a40263          	beq	s0,a0,8040496c <mm_destroy+0x40>
8040494c:	00052703          	lw	a4,0(a0)
80404950:	00452783          	lw	a5,4(a0)
80404954:	ff050513          	addi	a0,a0,-16
80404958:	00f72223          	sw	a5,4(a4)
8040495c:	00e7a023          	sw	a4,0(a5)
80404960:	a50fe0ef          	jal	ra,80402bb0 <kfree>
80404964:	00442503          	lw	a0,4(s0)
80404968:	fea412e3          	bne	s0,a0,8040494c <mm_destroy+0x20>
8040496c:	00040513          	mv	a0,s0
80404970:	00812403          	lw	s0,8(sp)
80404974:	00c12083          	lw	ra,12(sp)
80404978:	01010113          	addi	sp,sp,16
8040497c:	a34fe06f          	j	80402bb0 <kfree>
80404980:	00010697          	auipc	a3,0x10
80404984:	b1468693          	addi	a3,a3,-1260 # 80414494 <default_pmm_manager+0x82c>
80404988:	0000e617          	auipc	a2,0xe
8040498c:	7a460613          	addi	a2,a2,1956 # 8041312c <commands+0x1f8>
80404990:	09100593          	li	a1,145
80404994:	00010517          	auipc	a0,0x10
80404998:	99850513          	addi	a0,a0,-1640 # 8041432c <default_pmm_manager+0x6c4>
8040499c:	c89fb0ef          	jal	ra,80400624 <__panic>

804049a0 <mm_map>:
804049a0:	000017b7          	lui	a5,0x1
804049a4:	fe010113          	addi	sp,sp,-32
804049a8:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
804049ac:	fffff837          	lui	a6,0xfffff
804049b0:	00812c23          	sw	s0,24(sp)
804049b4:	00f60433          	add	s0,a2,a5
804049b8:	00912a23          	sw	s1,20(sp)
804049bc:	00b40433          	add	s0,s0,a1
804049c0:	00112e23          	sw	ra,28(sp)
804049c4:	01212823          	sw	s2,16(sp)
804049c8:	01312623          	sw	s3,12(sp)
804049cc:	01412423          	sw	s4,8(sp)
804049d0:	01512223          	sw	s5,4(sp)
804049d4:	0105f4b3          	and	s1,a1,a6
804049d8:	002007b7          	lui	a5,0x200
804049dc:	01047433          	and	s0,s0,a6
804049e0:	08f4e863          	bltu	s1,a5,80404a70 <mm_map+0xd0>
804049e4:	0884f663          	bgeu	s1,s0,80404a70 <mm_map+0xd0>
804049e8:	800007b7          	lui	a5,0x80000
804049ec:	0887e263          	bltu	a5,s0,80404a70 <mm_map+0xd0>
804049f0:	00050993          	mv	s3,a0
804049f4:	00070a13          	mv	s4,a4
804049f8:	00068a93          	mv	s5,a3
804049fc:	06050e63          	beqz	a0,80404a78 <mm_map+0xd8>
80404a00:	00048593          	mv	a1,s1
80404a04:	dd5ff0ef          	jal	ra,804047d8 <find_vma>
80404a08:	00050663          	beqz	a0,80404a14 <mm_map+0x74>
80404a0c:	00452783          	lw	a5,4(a0)
80404a10:	0687e063          	bltu	a5,s0,80404a70 <mm_map+0xd0>
80404a14:	01800513          	li	a0,24
80404a18:	874fe0ef          	jal	ra,80402a8c <kmalloc>
80404a1c:	00050913          	mv	s2,a0
80404a20:	ffc00513          	li	a0,-4
80404a24:	02090463          	beqz	s2,80404a4c <mm_map+0xac>
80404a28:	00098513          	mv	a0,s3
80404a2c:	00992223          	sw	s1,4(s2)
80404a30:	00892423          	sw	s0,8(s2)
80404a34:	01592623          	sw	s5,12(s2)
80404a38:	00090593          	mv	a1,s2
80404a3c:	dfdff0ef          	jal	ra,80404838 <insert_vma_struct>
80404a40:	00000513          	li	a0,0
80404a44:	000a0463          	beqz	s4,80404a4c <mm_map+0xac>
80404a48:	012a2023          	sw	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x7000>
80404a4c:	01c12083          	lw	ra,28(sp)
80404a50:	01812403          	lw	s0,24(sp)
80404a54:	01412483          	lw	s1,20(sp)
80404a58:	01012903          	lw	s2,16(sp)
80404a5c:	00c12983          	lw	s3,12(sp)
80404a60:	00812a03          	lw	s4,8(sp)
80404a64:	00412a83          	lw	s5,4(sp)
80404a68:	02010113          	addi	sp,sp,32
80404a6c:	00008067          	ret
80404a70:	ffd00513          	li	a0,-3
80404a74:	fd9ff06f          	j	80404a4c <mm_map+0xac>
80404a78:	00010697          	auipc	a3,0x10
80404a7c:	a3068693          	addi	a3,a3,-1488 # 804144a8 <default_pmm_manager+0x840>
80404a80:	0000e617          	auipc	a2,0xe
80404a84:	6ac60613          	addi	a2,a2,1708 # 8041312c <commands+0x1f8>
80404a88:	0a400593          	li	a1,164
80404a8c:	00010517          	auipc	a0,0x10
80404a90:	8a050513          	addi	a0,a0,-1888 # 8041432c <default_pmm_manager+0x6c4>
80404a94:	b91fb0ef          	jal	ra,80400624 <__panic>

80404a98 <dup_mmap>:
80404a98:	fe010113          	addi	sp,sp,-32
80404a9c:	00112e23          	sw	ra,28(sp)
80404aa0:	00812c23          	sw	s0,24(sp)
80404aa4:	00912a23          	sw	s1,20(sp)
80404aa8:	01212823          	sw	s2,16(sp)
80404aac:	01312623          	sw	s3,12(sp)
80404ab0:	01412423          	sw	s4,8(sp)
80404ab4:	01512223          	sw	s5,4(sp)
80404ab8:	0a050063          	beqz	a0,80404b58 <dup_mmap+0xc0>
80404abc:	00050913          	mv	s2,a0
80404ac0:	00058493          	mv	s1,a1
80404ac4:	00058413          	mv	s0,a1
80404ac8:	02059e63          	bnez	a1,80404b04 <dup_mmap+0x6c>
80404acc:	08c0006f          	j	80404b58 <dup_mmap+0xc0>
80404ad0:	00050593          	mv	a1,a0
80404ad4:	0157a223          	sw	s5,4(a5) # 80000004 <end+0xffb63748>
80404ad8:	00090513          	mv	a0,s2
80404adc:	0147a423          	sw	s4,8(a5)
80404ae0:	0137a623          	sw	s3,12(a5)
80404ae4:	d55ff0ef          	jal	ra,80404838 <insert_vma_struct>
80404ae8:	ff842683          	lw	a3,-8(s0)
80404aec:	ff442603          	lw	a2,-12(s0)
80404af0:	00c4a583          	lw	a1,12(s1)
80404af4:	00c92503          	lw	a0,12(s2)
80404af8:	00000713          	li	a4,0
80404afc:	9f9fe0ef          	jal	ra,804034f4 <copy_range>
80404b00:	02051463          	bnez	a0,80404b28 <dup_mmap+0x90>
80404b04:	00042403          	lw	s0,0(s0)
80404b08:	04848463          	beq	s1,s0,80404b50 <dup_mmap+0xb8>
80404b0c:	01800513          	li	a0,24
80404b10:	ff442a83          	lw	s5,-12(s0)
80404b14:	ff842a03          	lw	s4,-8(s0)
80404b18:	ffc42983          	lw	s3,-4(s0)
80404b1c:	f71fd0ef          	jal	ra,80402a8c <kmalloc>
80404b20:	00050793          	mv	a5,a0
80404b24:	fa0516e3          	bnez	a0,80404ad0 <dup_mmap+0x38>
80404b28:	ffc00513          	li	a0,-4
80404b2c:	01c12083          	lw	ra,28(sp)
80404b30:	01812403          	lw	s0,24(sp)
80404b34:	01412483          	lw	s1,20(sp)
80404b38:	01012903          	lw	s2,16(sp)
80404b3c:	00c12983          	lw	s3,12(sp)
80404b40:	00812a03          	lw	s4,8(sp)
80404b44:	00412a83          	lw	s5,4(sp)
80404b48:	02010113          	addi	sp,sp,32
80404b4c:	00008067          	ret
80404b50:	00000513          	li	a0,0
80404b54:	fd9ff06f          	j	80404b2c <dup_mmap+0x94>
80404b58:	00010697          	auipc	a3,0x10
80404b5c:	8a468693          	addi	a3,a3,-1884 # 804143fc <default_pmm_manager+0x794>
80404b60:	0000e617          	auipc	a2,0xe
80404b64:	5cc60613          	addi	a2,a2,1484 # 8041312c <commands+0x1f8>
80404b68:	0bc00593          	li	a1,188
80404b6c:	0000f517          	auipc	a0,0xf
80404b70:	7c050513          	addi	a0,a0,1984 # 8041432c <default_pmm_manager+0x6c4>
80404b74:	ab1fb0ef          	jal	ra,80400624 <__panic>

80404b78 <exit_mmap>:
80404b78:	ff010113          	addi	sp,sp,-16
80404b7c:	00112623          	sw	ra,12(sp)
80404b80:	00812423          	sw	s0,8(sp)
80404b84:	00912223          	sw	s1,4(sp)
80404b88:	01212023          	sw	s2,0(sp)
80404b8c:	06050663          	beqz	a0,80404bf8 <exit_mmap+0x80>
80404b90:	01852783          	lw	a5,24(a0)
80404b94:	00050493          	mv	s1,a0
80404b98:	06079063          	bnez	a5,80404bf8 <exit_mmap+0x80>
80404b9c:	00452403          	lw	s0,4(a0)
80404ba0:	00c52903          	lw	s2,12(a0)
80404ba4:	02850a63          	beq	a0,s0,80404bd8 <exit_mmap+0x60>
80404ba8:	ff842603          	lw	a2,-8(s0)
80404bac:	ff442583          	lw	a1,-12(s0)
80404bb0:	00090513          	mv	a0,s2
80404bb4:	d54fe0ef          	jal	ra,80403108 <unmap_range>
80404bb8:	00442403          	lw	s0,4(s0)
80404bbc:	fe8496e3          	bne	s1,s0,80404ba8 <exit_mmap+0x30>
80404bc0:	00442403          	lw	s0,4(s0)
80404bc4:	00848e63          	beq	s1,s0,80404be0 <exit_mmap+0x68>
80404bc8:	ff842603          	lw	a2,-8(s0)
80404bcc:	ff442583          	lw	a1,-12(s0)
80404bd0:	00090513          	mv	a0,s2
80404bd4:	eb8fe0ef          	jal	ra,8040328c <exit_range>
80404bd8:	00442403          	lw	s0,4(s0)
80404bdc:	fe8496e3          	bne	s1,s0,80404bc8 <exit_mmap+0x50>
80404be0:	00c12083          	lw	ra,12(sp)
80404be4:	00812403          	lw	s0,8(sp)
80404be8:	00412483          	lw	s1,4(sp)
80404bec:	00012903          	lw	s2,0(sp)
80404bf0:	01010113          	addi	sp,sp,16
80404bf4:	00008067          	ret
80404bf8:	00010697          	auipc	a3,0x10
80404bfc:	82068693          	addi	a3,a3,-2016 # 80414418 <default_pmm_manager+0x7b0>
80404c00:	0000e617          	auipc	a2,0xe
80404c04:	52c60613          	addi	a2,a2,1324 # 8041312c <commands+0x1f8>
80404c08:	0d200593          	li	a1,210
80404c0c:	0000f517          	auipc	a0,0xf
80404c10:	72050513          	addi	a0,a0,1824 # 8041432c <default_pmm_manager+0x6c4>
80404c14:	a11fb0ef          	jal	ra,80400624 <__panic>

80404c18 <vmm_init>:
80404c18:	00008067          	ret

80404c1c <do_pgfault>:
80404c1c:	fd010113          	addi	sp,sp,-48
80404c20:	00060593          	mv	a1,a2
80404c24:	02912223          	sw	s1,36(sp)
80404c28:	03212023          	sw	s2,32(sp)
80404c2c:	02112623          	sw	ra,44(sp)
80404c30:	02812423          	sw	s0,40(sp)
80404c34:	01312e23          	sw	s3,28(sp)
80404c38:	00060493          	mv	s1,a2
80404c3c:	00050913          	mv	s2,a0
80404c40:	b99ff0ef          	jal	ra,804047d8 <find_vma>
80404c44:	00098797          	auipc	a5,0x98
80404c48:	b6478793          	addi	a5,a5,-1180 # 8049c7a8 <pgfault_num>
80404c4c:	0007a783          	lw	a5,0(a5)
80404c50:	00178793          	addi	a5,a5,1
80404c54:	00098717          	auipc	a4,0x98
80404c58:	b4f72a23          	sw	a5,-1196(a4) # 8049c7a8 <pgfault_num>
80404c5c:	10050e63          	beqz	a0,80404d78 <do_pgfault+0x15c>
80404c60:	00452783          	lw	a5,4(a0)
80404c64:	10f4ea63          	bltu	s1,a5,80404d78 <do_pgfault+0x15c>
80404c68:	00c52403          	lw	s0,12(a0)
80404c6c:	fffff637          	lui	a2,0xfffff
80404c70:	00c92503          	lw	a0,12(s2)
80404c74:	00247413          	andi	s0,s0,2
80404c78:	00c4f4b3          	and	s1,s1,a2
80404c7c:	00143413          	seqz	s0,s0
80404c80:	40800433          	neg	s0,s0
80404c84:	00100613          	li	a2,1
80404c88:	00048593          	mv	a1,s1
80404c8c:	ff947413          	andi	s0,s0,-7
80404c90:	b10fe0ef          	jal	ra,80402fa0 <get_pte>
80404c94:	01740413          	addi	s0,s0,23
80404c98:	10050663          	beqz	a0,80404da4 <do_pgfault+0x188>
80404c9c:	00052583          	lw	a1,0(a0)
80404ca0:	0a058663          	beqz	a1,80404d4c <do_pgfault+0x130>
80404ca4:	00098797          	auipc	a5,0x98
80404ca8:	b0078793          	addi	a5,a5,-1280 # 8049c7a4 <swap_init_ok>
80404cac:	0007a783          	lw	a5,0(a5)
80404cb0:	0e078063          	beqz	a5,80404d90 <do_pgfault+0x174>
80404cb4:	00c10613          	addi	a2,sp,12
80404cb8:	00048593          	mv	a1,s1
80404cbc:	00090513          	mv	a0,s2
80404cc0:	00012623          	sw	zero,12(sp)
80404cc4:	d3cff0ef          	jal	ra,80404200 <swap_in>
80404cc8:	00050993          	mv	s3,a0
80404ccc:	04051a63          	bnez	a0,80404d20 <do_pgfault+0x104>
80404cd0:	00c12583          	lw	a1,12(sp)
80404cd4:	00c92503          	lw	a0,12(s2)
80404cd8:	00040693          	mv	a3,s0
80404cdc:	00048613          	mv	a2,s1
80404ce0:	ef4fe0ef          	jal	ra,804033d4 <page_insert>
80404ce4:	00c12603          	lw	a2,12(sp)
80404ce8:	00100693          	li	a3,1
80404cec:	00048593          	mv	a1,s1
80404cf0:	00090513          	mv	a0,s2
80404cf4:	b4cff0ef          	jal	ra,80404040 <swap_map_swappable>
80404cf8:	00c12783          	lw	a5,12(sp)
80404cfc:	0097ae23          	sw	s1,28(a5)
80404d00:	02c12083          	lw	ra,44(sp)
80404d04:	02812403          	lw	s0,40(sp)
80404d08:	00098513          	mv	a0,s3
80404d0c:	02412483          	lw	s1,36(sp)
80404d10:	02012903          	lw	s2,32(sp)
80404d14:	01c12983          	lw	s3,28(sp)
80404d18:	03010113          	addi	sp,sp,48
80404d1c:	00008067          	ret
80404d20:	0000f517          	auipc	a0,0xf
80404d24:	69450513          	addi	a0,a0,1684 # 804143b4 <default_pmm_manager+0x74c>
80404d28:	cd4fb0ef          	jal	ra,804001fc <cprintf>
80404d2c:	02c12083          	lw	ra,44(sp)
80404d30:	02812403          	lw	s0,40(sp)
80404d34:	00098513          	mv	a0,s3
80404d38:	02412483          	lw	s1,36(sp)
80404d3c:	02012903          	lw	s2,32(sp)
80404d40:	01c12983          	lw	s3,28(sp)
80404d44:	03010113          	addi	sp,sp,48
80404d48:	00008067          	ret
80404d4c:	00c92503          	lw	a0,12(s2)
80404d50:	00040613          	mv	a2,s0
80404d54:	00048593          	mv	a1,s1
80404d58:	ae5fe0ef          	jal	ra,8040383c <pgdir_alloc_page>
80404d5c:	00000993          	li	s3,0
80404d60:	fa0510e3          	bnez	a0,80404d00 <do_pgfault+0xe4>
80404d64:	0000f517          	auipc	a0,0xf
80404d68:	62850513          	addi	a0,a0,1576 # 8041438c <default_pmm_manager+0x724>
80404d6c:	c90fb0ef          	jal	ra,804001fc <cprintf>
80404d70:	ffc00993          	li	s3,-4
80404d74:	f8dff06f          	j	80404d00 <do_pgfault+0xe4>
80404d78:	00048593          	mv	a1,s1
80404d7c:	0000f517          	auipc	a0,0xf
80404d80:	5c050513          	addi	a0,a0,1472 # 8041433c <default_pmm_manager+0x6d4>
80404d84:	c78fb0ef          	jal	ra,804001fc <cprintf>
80404d88:	ffd00993          	li	s3,-3
80404d8c:	f75ff06f          	j	80404d00 <do_pgfault+0xe4>
80404d90:	0000f517          	auipc	a0,0xf
80404d94:	64450513          	addi	a0,a0,1604 # 804143d4 <default_pmm_manager+0x76c>
80404d98:	c64fb0ef          	jal	ra,804001fc <cprintf>
80404d9c:	ffc00993          	li	s3,-4
80404da0:	f61ff06f          	j	80404d00 <do_pgfault+0xe4>
80404da4:	0000f517          	auipc	a0,0xf
80404da8:	5c850513          	addi	a0,a0,1480 # 8041436c <default_pmm_manager+0x704>
80404dac:	c50fb0ef          	jal	ra,804001fc <cprintf>
80404db0:	ffc00993          	li	s3,-4
80404db4:	f4dff06f          	j	80404d00 <do_pgfault+0xe4>

80404db8 <user_mem_check>:
80404db8:	fe010113          	addi	sp,sp,-32
80404dbc:	00812c23          	sw	s0,24(sp)
80404dc0:	00112e23          	sw	ra,28(sp)
80404dc4:	00912a23          	sw	s1,20(sp)
80404dc8:	01212823          	sw	s2,16(sp)
80404dcc:	01312623          	sw	s3,12(sp)
80404dd0:	01412423          	sw	s4,8(sp)
80404dd4:	00058413          	mv	s0,a1
80404dd8:	08050c63          	beqz	a0,80404e70 <user_mem_check+0xb8>
80404ddc:	002007b7          	lui	a5,0x200
80404de0:	06f5e663          	bltu	a1,a5,80404e4c <user_mem_check+0x94>
80404de4:	00c584b3          	add	s1,a1,a2
80404de8:	0695f263          	bgeu	a1,s1,80404e4c <user_mem_check+0x94>
80404dec:	800007b7          	lui	a5,0x80000
80404df0:	0497ee63          	bltu	a5,s1,80404e4c <user_mem_check+0x94>
80404df4:	00050913          	mv	s2,a0
80404df8:	00068993          	mv	s3,a3
80404dfc:	00001a37          	lui	s4,0x1
80404e00:	0240006f          	j	80404e24 <user_mem_check+0x6c>
80404e04:	0027f693          	andi	a3,a5,2
80404e08:	01470733          	add	a4,a4,s4
80404e0c:	0087f793          	andi	a5,a5,8
80404e10:	02068e63          	beqz	a3,80404e4c <user_mem_check+0x94>
80404e14:	00078463          	beqz	a5,80404e1c <user_mem_check+0x64>
80404e18:	02e46a63          	bltu	s0,a4,80404e4c <user_mem_check+0x94>
80404e1c:	00852403          	lw	s0,8(a0)
80404e20:	06947463          	bgeu	s0,s1,80404e88 <user_mem_check+0xd0>
80404e24:	00040593          	mv	a1,s0
80404e28:	00090513          	mv	a0,s2
80404e2c:	9adff0ef          	jal	ra,804047d8 <find_vma>
80404e30:	00050e63          	beqz	a0,80404e4c <user_mem_check+0x94>
80404e34:	00452703          	lw	a4,4(a0)
80404e38:	00e46a63          	bltu	s0,a4,80404e4c <user_mem_check+0x94>
80404e3c:	00c52783          	lw	a5,12(a0)
80404e40:	fc0992e3          	bnez	s3,80404e04 <user_mem_check+0x4c>
80404e44:	0017f793          	andi	a5,a5,1
80404e48:	fc079ae3          	bnez	a5,80404e1c <user_mem_check+0x64>
80404e4c:	00000513          	li	a0,0
80404e50:	01c12083          	lw	ra,28(sp)
80404e54:	01812403          	lw	s0,24(sp)
80404e58:	01412483          	lw	s1,20(sp)
80404e5c:	01012903          	lw	s2,16(sp)
80404e60:	00c12983          	lw	s3,12(sp)
80404e64:	00812a03          	lw	s4,8(sp)
80404e68:	02010113          	addi	sp,sp,32
80404e6c:	00008067          	ret
80404e70:	804007b7          	lui	a5,0x80400
80404e74:	fcf5ece3          	bltu	a1,a5,80404e4c <user_mem_check+0x94>
80404e78:	00c58633          	add	a2,a1,a2
80404e7c:	fcc5f8e3          	bgeu	a1,a2,80404e4c <user_mem_check+0x94>
80404e80:	80c007b7          	lui	a5,0x80c00
80404e84:	fcc7e4e3          	bltu	a5,a2,80404e4c <user_mem_check+0x94>
80404e88:	00100513          	li	a0,1
80404e8c:	fc5ff06f          	j	80404e50 <user_mem_check+0x98>

80404e90 <copy_from_user>:
80404e90:	ff010113          	addi	sp,sp,-16
80404e94:	00812423          	sw	s0,8(sp)
80404e98:	00912223          	sw	s1,4(sp)
80404e9c:	00060413          	mv	s0,a2
80404ea0:	00068493          	mv	s1,a3
80404ea4:	01212023          	sw	s2,0(sp)
80404ea8:	00070693          	mv	a3,a4
80404eac:	00058913          	mv	s2,a1
80404eb0:	00048613          	mv	a2,s1
80404eb4:	00040593          	mv	a1,s0
80404eb8:	00112623          	sw	ra,12(sp)
80404ebc:	efdff0ef          	jal	ra,80404db8 <user_mem_check>
80404ec0:	00050c63          	beqz	a0,80404ed8 <copy_from_user+0x48>
80404ec4:	00048613          	mv	a2,s1
80404ec8:	00040593          	mv	a1,s0
80404ecc:	00090513          	mv	a0,s2
80404ed0:	6610d0ef          	jal	ra,80412d30 <memcpy>
80404ed4:	00100513          	li	a0,1
80404ed8:	00c12083          	lw	ra,12(sp)
80404edc:	00812403          	lw	s0,8(sp)
80404ee0:	00412483          	lw	s1,4(sp)
80404ee4:	00012903          	lw	s2,0(sp)
80404ee8:	01010113          	addi	sp,sp,16
80404eec:	00008067          	ret

80404ef0 <copy_to_user>:
80404ef0:	ff010113          	addi	sp,sp,-16
80404ef4:	00812423          	sw	s0,8(sp)
80404ef8:	00068413          	mv	s0,a3
80404efc:	01212023          	sw	s2,0(sp)
80404f00:	00100693          	li	a3,1
80404f04:	00060913          	mv	s2,a2
80404f08:	00040613          	mv	a2,s0
80404f0c:	00912223          	sw	s1,4(sp)
80404f10:	00112623          	sw	ra,12(sp)
80404f14:	00058493          	mv	s1,a1
80404f18:	ea1ff0ef          	jal	ra,80404db8 <user_mem_check>
80404f1c:	00050c63          	beqz	a0,80404f34 <copy_to_user+0x44>
80404f20:	00040613          	mv	a2,s0
80404f24:	00090593          	mv	a1,s2
80404f28:	00048513          	mv	a0,s1
80404f2c:	6050d0ef          	jal	ra,80412d30 <memcpy>
80404f30:	00100513          	li	a0,1
80404f34:	00c12083          	lw	ra,12(sp)
80404f38:	00812403          	lw	s0,8(sp)
80404f3c:	00412483          	lw	s1,4(sp)
80404f40:	00012903          	lw	s2,0(sp)
80404f44:	01010113          	addi	sp,sp,16
80404f48:	00008067          	ret

80404f4c <copy_string>:
80404f4c:	fe010113          	addi	sp,sp,-32
80404f50:	01312623          	sw	s3,12(sp)
80404f54:	000019b7          	lui	s3,0x1
80404f58:	013609b3          	add	s3,a2,s3
80404f5c:	fffff7b7          	lui	a5,0xfffff
80404f60:	00f9f9b3          	and	s3,s3,a5
80404f64:	00912a23          	sw	s1,20(sp)
80404f68:	01212823          	sw	s2,16(sp)
80404f6c:	01412423          	sw	s4,8(sp)
80404f70:	01512223          	sw	s5,4(sp)
80404f74:	00112e23          	sw	ra,28(sp)
80404f78:	00812c23          	sw	s0,24(sp)
80404f7c:	00060493          	mv	s1,a2
80404f80:	00050a93          	mv	s5,a0
80404f84:	00058a13          	mv	s4,a1
80404f88:	00068913          	mv	s2,a3
80404f8c:	40c989b3          	sub	s3,s3,a2
80404f90:	0380006f          	j	80404fc8 <copy_string+0x7c>
80404f94:	00048513          	mv	a0,s1
80404f98:	4750d0ef          	jal	ra,80412c0c <strnlen>
80404f9c:	00050793          	mv	a5,a0
80404fa0:	00048593          	mv	a1,s1
80404fa4:	000a0513          	mv	a0,s4
80404fa8:	00040613          	mv	a2,s0
80404fac:	0687e663          	bltu	a5,s0,80405018 <copy_string+0xcc>
80404fb0:	0529f063          	bgeu	s3,s2,80404ff0 <copy_string+0xa4>
80404fb4:	57d0d0ef          	jal	ra,80412d30 <memcpy>
80404fb8:	008a0a33          	add	s4,s4,s0
80404fbc:	008484b3          	add	s1,s1,s0
80404fc0:	40890933          	sub	s2,s2,s0
80404fc4:	000019b7          	lui	s3,0x1
80404fc8:	00000693          	li	a3,0
80404fcc:	00048593          	mv	a1,s1
80404fd0:	000a8513          	mv	a0,s5
80404fd4:	00090413          	mv	s0,s2
80404fd8:	0129f463          	bgeu	s3,s2,80404fe0 <copy_string+0x94>
80404fdc:	00098413          	mv	s0,s3
80404fe0:	00040613          	mv	a2,s0
80404fe4:	dd5ff0ef          	jal	ra,80404db8 <user_mem_check>
80404fe8:	00040593          	mv	a1,s0
80404fec:	fa0514e3          	bnez	a0,80404f94 <copy_string+0x48>
80404ff0:	00000513          	li	a0,0
80404ff4:	01c12083          	lw	ra,28(sp)
80404ff8:	01812403          	lw	s0,24(sp)
80404ffc:	01412483          	lw	s1,20(sp)
80405000:	01012903          	lw	s2,16(sp)
80405004:	00c12983          	lw	s3,12(sp)
80405008:	00812a03          	lw	s4,8(sp)
8040500c:	00412a83          	lw	s5,4(sp)
80405010:	02010113          	addi	sp,sp,32
80405014:	00008067          	ret
80405018:	00178613          	addi	a2,a5,1 # fffff001 <end+0x7fb62745>
8040501c:	5150d0ef          	jal	ra,80412d30 <memcpy>
80405020:	00100513          	li	a0,1
80405024:	fd1ff06f          	j	80404ff4 <copy_string+0xa8>

80405028 <__down.constprop.0>:
80405028:	fc010113          	addi	sp,sp,-64
8040502c:	02112e23          	sw	ra,60(sp)
80405030:	02812c23          	sw	s0,56(sp)
80405034:	02912a23          	sw	s1,52(sp)
80405038:	100027f3          	csrr	a5,sstatus
8040503c:	0027f793          	andi	a5,a5,2
80405040:	08079663          	bnez	a5,804050cc <__down.constprop.0+0xa4>
80405044:	00052703          	lw	a4,0(a0)
80405048:	02e05263          	blez	a4,8040506c <__down.constprop.0+0x44>
8040504c:	03c12083          	lw	ra,60(sp)
80405050:	03812403          	lw	s0,56(sp)
80405054:	fff70713          	addi	a4,a4,-1
80405058:	00e52023          	sw	a4,0(a0)
8040505c:	03412483          	lw	s1,52(sp)
80405060:	00078513          	mv	a0,a5
80405064:	04010113          	addi	sp,sp,64
80405068:	00008067          	ret
8040506c:	00450413          	addi	s0,a0,4
80405070:	01c10493          	addi	s1,sp,28
80405074:	10000613          	li	a2,256
80405078:	00048593          	mv	a1,s1
8040507c:	00040513          	mv	a0,s0
80405080:	3ac000ef          	jal	ra,8040542c <wait_current_set>
80405084:	429070ef          	jal	ra,8040ccac <schedule>
80405088:	100027f3          	csrr	a5,sstatus
8040508c:	0027f793          	andi	a5,a5,2
80405090:	0a079463          	bnez	a5,80405138 <__down.constprop.0+0x110>
80405094:	00048513          	mv	a0,s1
80405098:	29c000ef          	jal	ra,80405334 <wait_in_queue>
8040509c:	08051663          	bnez	a0,80405128 <__down.constprop.0+0x100>
804050a0:	02012783          	lw	a5,32(sp)
804050a4:	03c12083          	lw	ra,60(sp)
804050a8:	03812403          	lw	s0,56(sp)
804050ac:	f0078713          	addi	a4,a5,-256
804050b0:	00e03733          	snez	a4,a4
804050b4:	40e00733          	neg	a4,a4
804050b8:	00e7f7b3          	and	a5,a5,a4
804050bc:	03412483          	lw	s1,52(sp)
804050c0:	00078513          	mv	a0,a5
804050c4:	04010113          	addi	sp,sp,64
804050c8:	00008067          	ret
804050cc:	00a12623          	sw	a0,12(sp)
804050d0:	be9fb0ef          	jal	ra,80400cb8 <intr_disable>
804050d4:	00c12503          	lw	a0,12(sp)
804050d8:	00052783          	lw	a5,0(a0)
804050dc:	02f05663          	blez	a5,80405108 <__down.constprop.0+0xe0>
804050e0:	fff78793          	addi	a5,a5,-1
804050e4:	00f52023          	sw	a5,0(a0)
804050e8:	bc9fb0ef          	jal	ra,80400cb0 <intr_enable>
804050ec:	03c12083          	lw	ra,60(sp)
804050f0:	03812403          	lw	s0,56(sp)
804050f4:	00000793          	li	a5,0
804050f8:	03412483          	lw	s1,52(sp)
804050fc:	00078513          	mv	a0,a5
80405100:	04010113          	addi	sp,sp,64
80405104:	00008067          	ret
80405108:	00450413          	addi	s0,a0,4
8040510c:	01c10493          	addi	s1,sp,28
80405110:	10000613          	li	a2,256
80405114:	00048593          	mv	a1,s1
80405118:	00040513          	mv	a0,s0
8040511c:	310000ef          	jal	ra,8040542c <wait_current_set>
80405120:	b91fb0ef          	jal	ra,80400cb0 <intr_enable>
80405124:	f61ff06f          	j	80405084 <__down.constprop.0+0x5c>
80405128:	00048593          	mv	a1,s1
8040512c:	00040513          	mv	a0,s0
80405130:	1a4000ef          	jal	ra,804052d4 <wait_queue_del>
80405134:	f6dff06f          	j	804050a0 <__down.constprop.0+0x78>
80405138:	b81fb0ef          	jal	ra,80400cb8 <intr_disable>
8040513c:	00048513          	mv	a0,s1
80405140:	1f4000ef          	jal	ra,80405334 <wait_in_queue>
80405144:	00051663          	bnez	a0,80405150 <__down.constprop.0+0x128>
80405148:	b69fb0ef          	jal	ra,80400cb0 <intr_enable>
8040514c:	f55ff06f          	j	804050a0 <__down.constprop.0+0x78>
80405150:	00048593          	mv	a1,s1
80405154:	00040513          	mv	a0,s0
80405158:	17c000ef          	jal	ra,804052d4 <wait_queue_del>
8040515c:	fedff06f          	j	80405148 <__down.constprop.0+0x120>

80405160 <__up.constprop.1>:
80405160:	ff010113          	addi	sp,sp,-16
80405164:	00912223          	sw	s1,4(sp)
80405168:	00112623          	sw	ra,12(sp)
8040516c:	00812423          	sw	s0,8(sp)
80405170:	01212023          	sw	s2,0(sp)
80405174:	00050493          	mv	s1,a0
80405178:	100027f3          	csrr	a5,sstatus
8040517c:	0027f793          	andi	a5,a5,2
80405180:	00000913          	li	s2,0
80405184:	06079e63          	bnez	a5,80405200 <__up.constprop.1+0xa0>
80405188:	00448413          	addi	s0,s1,4
8040518c:	00040513          	mv	a0,s0
80405190:	17c000ef          	jal	ra,8040530c <wait_queue_first>
80405194:	04050e63          	beqz	a0,804051f0 <__up.constprop.1+0x90>
80405198:	00052703          	lw	a4,0(a0)
8040519c:	10000793          	li	a5,256
804051a0:	0a872703          	lw	a4,168(a4)
804051a4:	06f71463          	bne	a4,a5,8040520c <__up.constprop.1+0xac>
804051a8:	00050593          	mv	a1,a0
804051ac:	00100693          	li	a3,1
804051b0:	10000613          	li	a2,256
804051b4:	00040513          	mv	a0,s0
804051b8:	190000ef          	jal	ra,80405348 <wakeup_wait>
804051bc:	00091e63          	bnez	s2,804051d8 <__up.constprop.1+0x78>
804051c0:	00c12083          	lw	ra,12(sp)
804051c4:	00812403          	lw	s0,8(sp)
804051c8:	00412483          	lw	s1,4(sp)
804051cc:	00012903          	lw	s2,0(sp)
804051d0:	01010113          	addi	sp,sp,16
804051d4:	00008067          	ret
804051d8:	00812403          	lw	s0,8(sp)
804051dc:	00c12083          	lw	ra,12(sp)
804051e0:	00412483          	lw	s1,4(sp)
804051e4:	00012903          	lw	s2,0(sp)
804051e8:	01010113          	addi	sp,sp,16
804051ec:	ac5fb06f          	j	80400cb0 <intr_enable>
804051f0:	0004a783          	lw	a5,0(s1)
804051f4:	00178793          	addi	a5,a5,1
804051f8:	00f4a023          	sw	a5,0(s1)
804051fc:	fc1ff06f          	j	804051bc <__up.constprop.1+0x5c>
80405200:	ab9fb0ef          	jal	ra,80400cb8 <intr_disable>
80405204:	00100913          	li	s2,1
80405208:	f81ff06f          	j	80405188 <__up.constprop.1+0x28>
8040520c:	0000f697          	auipc	a3,0xf
80405210:	2a868693          	addi	a3,a3,680 # 804144b4 <default_pmm_manager+0x84c>
80405214:	0000e617          	auipc	a2,0xe
80405218:	f1860613          	addi	a2,a2,-232 # 8041312c <commands+0x1f8>
8040521c:	01a00593          	li	a1,26
80405220:	0000f517          	auipc	a0,0xf
80405224:	2bc50513          	addi	a0,a0,700 # 804144dc <default_pmm_manager+0x874>
80405228:	bfcfb0ef          	jal	ra,80400624 <__panic>

8040522c <sem_init>:
8040522c:	00b52023          	sw	a1,0(a0)
80405230:	00450513          	addi	a0,a0,4
80405234:	0940006f          	j	804052c8 <wait_queue_init>

80405238 <up>:
80405238:	f29ff06f          	j	80405160 <__up.constprop.1>

8040523c <down>:
8040523c:	ff010113          	addi	sp,sp,-16
80405240:	00112623          	sw	ra,12(sp)
80405244:	de5ff0ef          	jal	ra,80405028 <__down.constprop.0>
80405248:	00051863          	bnez	a0,80405258 <down+0x1c>
8040524c:	00c12083          	lw	ra,12(sp)
80405250:	01010113          	addi	sp,sp,16
80405254:	00008067          	ret
80405258:	0000f697          	auipc	a3,0xf
8040525c:	29468693          	addi	a3,a3,660 # 804144ec <default_pmm_manager+0x884>
80405260:	0000e617          	auipc	a2,0xe
80405264:	ecc60613          	addi	a2,a2,-308 # 8041312c <commands+0x1f8>
80405268:	04100593          	li	a1,65
8040526c:	0000f517          	auipc	a0,0xf
80405270:	27050513          	addi	a0,a0,624 # 804144dc <default_pmm_manager+0x874>
80405274:	bb0fb0ef          	jal	ra,80400624 <__panic>

80405278 <wait_queue_del.part.1>:
80405278:	ff010113          	addi	sp,sp,-16
8040527c:	0000f697          	auipc	a3,0xf
80405280:	28c68693          	addi	a3,a3,652 # 80414508 <default_pmm_manager+0x8a0>
80405284:	0000e617          	auipc	a2,0xe
80405288:	ea860613          	addi	a2,a2,-344 # 8041312c <commands+0x1f8>
8040528c:	01e00593          	li	a1,30
80405290:	0000f517          	auipc	a0,0xf
80405294:	2b850513          	addi	a0,a0,696 # 80414548 <default_pmm_manager+0x8e0>
80405298:	00112623          	sw	ra,12(sp)
8040529c:	b88fb0ef          	jal	ra,80400624 <__panic>

804052a0 <wait_queue_next.part.2>:
804052a0:	ff010113          	addi	sp,sp,-16
804052a4:	0000f697          	auipc	a3,0xf
804052a8:	26468693          	addi	a3,a3,612 # 80414508 <default_pmm_manager+0x8a0>
804052ac:	0000e617          	auipc	a2,0xe
804052b0:	e8060613          	addi	a2,a2,-384 # 8041312c <commands+0x1f8>
804052b4:	02400593          	li	a1,36
804052b8:	0000f517          	auipc	a0,0xf
804052bc:	29050513          	addi	a0,a0,656 # 80414548 <default_pmm_manager+0x8e0>
804052c0:	00112623          	sw	ra,12(sp)
804052c4:	b60fb0ef          	jal	ra,80400624 <__panic>

804052c8 <wait_queue_init>:
804052c8:	00a52223          	sw	a0,4(a0)
804052cc:	00a52023          	sw	a0,0(a0)
804052d0:	00008067          	ret

804052d4 <wait_queue_del>:
804052d4:	0105a703          	lw	a4,16(a1)
804052d8:	00c58793          	addi	a5,a1,12
804052dc:	02e78263          	beq	a5,a4,80405300 <wait_queue_del+0x2c>
804052e0:	0085a683          	lw	a3,8(a1)
804052e4:	00a69e63          	bne	a3,a0,80405300 <wait_queue_del+0x2c>
804052e8:	00c5a683          	lw	a3,12(a1)
804052ec:	00e6a223          	sw	a4,4(a3)
804052f0:	00d72023          	sw	a3,0(a4)
804052f4:	00f5a823          	sw	a5,16(a1)
804052f8:	00f5a623          	sw	a5,12(a1)
804052fc:	00008067          	ret
80405300:	ff010113          	addi	sp,sp,-16
80405304:	00112623          	sw	ra,12(sp)
80405308:	f71ff0ef          	jal	ra,80405278 <wait_queue_del.part.1>

8040530c <wait_queue_first>:
8040530c:	00452783          	lw	a5,4(a0)
80405310:	00f50663          	beq	a0,a5,8040531c <wait_queue_first+0x10>
80405314:	ff478513          	addi	a0,a5,-12
80405318:	00008067          	ret
8040531c:	00000513          	li	a0,0
80405320:	00008067          	ret

80405324 <wait_queue_empty>:
80405324:	00452783          	lw	a5,4(a0)
80405328:	40a78533          	sub	a0,a5,a0
8040532c:	00153513          	seqz	a0,a0
80405330:	00008067          	ret

80405334 <wait_in_queue>:
80405334:	01052783          	lw	a5,16(a0)
80405338:	00c50513          	addi	a0,a0,12
8040533c:	40a78533          	sub	a0,a5,a0
80405340:	00a03533          	snez	a0,a0
80405344:	00008067          	ret

80405348 <wakeup_wait>:
80405348:	02068663          	beqz	a3,80405374 <wakeup_wait+0x2c>
8040534c:	0105a703          	lw	a4,16(a1)
80405350:	00c58793          	addi	a5,a1,12
80405354:	02e78663          	beq	a5,a4,80405380 <wakeup_wait+0x38>
80405358:	0085a683          	lw	a3,8(a1)
8040535c:	02d51263          	bne	a0,a3,80405380 <wakeup_wait+0x38>
80405360:	00c5a683          	lw	a3,12(a1)
80405364:	00e6a223          	sw	a4,4(a3)
80405368:	00d72023          	sw	a3,0(a4)
8040536c:	00f5a823          	sw	a5,16(a1)
80405370:	00f5a623          	sw	a5,12(a1)
80405374:	0005a503          	lw	a0,0(a1)
80405378:	00c5a223          	sw	a2,4(a1)
8040537c:	0050706f          	j	8040cb80 <wakeup_proc>
80405380:	ff010113          	addi	sp,sp,-16
80405384:	00112623          	sw	ra,12(sp)
80405388:	ef1ff0ef          	jal	ra,80405278 <wait_queue_del.part.1>

8040538c <wakeup_queue>:
8040538c:	ff010113          	addi	sp,sp,-16
80405390:	00812423          	sw	s0,8(sp)
80405394:	00452403          	lw	s0,4(a0)
80405398:	00112623          	sw	ra,12(sp)
8040539c:	00912223          	sw	s1,4(sp)
804053a0:	01212023          	sw	s2,0(sp)
804053a4:	04850263          	beq	a0,s0,804053e8 <wakeup_queue+0x5c>
804053a8:	ff440413          	addi	s0,s0,-12
804053ac:	02040e63          	beqz	s0,804053e8 <wakeup_queue+0x5c>
804053b0:	00058913          	mv	s2,a1
804053b4:	00050493          	mv	s1,a0
804053b8:	04061463          	bnez	a2,80405400 <wakeup_queue+0x74>
804053bc:	00042503          	lw	a0,0(s0)
804053c0:	01242223          	sw	s2,4(s0)
804053c4:	7bc070ef          	jal	ra,8040cb80 <wakeup_proc>
804053c8:	01042783          	lw	a5,16(s0)
804053cc:	00c40713          	addi	a4,s0,12
804053d0:	04e78c63          	beq	a5,a4,80405428 <wakeup_queue+0x9c>
804053d4:	00842703          	lw	a4,8(s0)
804053d8:	04e49863          	bne	s1,a4,80405428 <wakeup_queue+0x9c>
804053dc:	00f48663          	beq	s1,a5,804053e8 <wakeup_queue+0x5c>
804053e0:	ff478413          	addi	s0,a5,-12
804053e4:	fc041ce3          	bnez	s0,804053bc <wakeup_queue+0x30>
804053e8:	00c12083          	lw	ra,12(sp)
804053ec:	00812403          	lw	s0,8(sp)
804053f0:	00412483          	lw	s1,4(sp)
804053f4:	00012903          	lw	s2,0(sp)
804053f8:	01010113          	addi	sp,sp,16
804053fc:	00008067          	ret
80405400:	00040593          	mv	a1,s0
80405404:	00100693          	li	a3,1
80405408:	00090613          	mv	a2,s2
8040540c:	00048513          	mv	a0,s1
80405410:	f39ff0ef          	jal	ra,80405348 <wakeup_wait>
80405414:	0044a403          	lw	s0,4(s1)
80405418:	fc8488e3          	beq	s1,s0,804053e8 <wakeup_queue+0x5c>
8040541c:	ff440413          	addi	s0,s0,-12
80405420:	fe0410e3          	bnez	s0,80405400 <wakeup_queue+0x74>
80405424:	fc5ff06f          	j	804053e8 <wakeup_queue+0x5c>
80405428:	e79ff0ef          	jal	ra,804052a0 <wait_queue_next.part.2>

8040542c <wait_current_set>:
8040542c:	00097797          	auipc	a5,0x97
80405430:	38078793          	addi	a5,a5,896 # 8049c7ac <current>
80405434:	0007a783          	lw	a5,0(a5)
80405438:	04078063          	beqz	a5,80405478 <wait_current_set+0x4c>
8040543c:	00c58713          	addi	a4,a1,12
80405440:	800006b7          	lui	a3,0x80000
80405444:	00e5a623          	sw	a4,12(a1)
80405448:	00f5a023          	sw	a5,0(a1)
8040544c:	00d5a223          	sw	a3,4(a1)
80405450:	00100693          	li	a3,1
80405454:	00d7a023          	sw	a3,0(a5)
80405458:	0ac7a423          	sw	a2,168(a5)
8040545c:	00052783          	lw	a5,0(a0)
80405460:	00a5a423          	sw	a0,8(a1)
80405464:	00e52023          	sw	a4,0(a0)
80405468:	00e7a223          	sw	a4,4(a5)
8040546c:	00a5a823          	sw	a0,16(a1)
80405470:	00f5a623          	sw	a5,12(a1)
80405474:	00008067          	ret
80405478:	ff010113          	addi	sp,sp,-16
8040547c:	0000f697          	auipc	a3,0xf
80405480:	07c68693          	addi	a3,a3,124 # 804144f8 <default_pmm_manager+0x890>
80405484:	0000e617          	auipc	a2,0xe
80405488:	ca860613          	addi	a2,a2,-856 # 8041312c <commands+0x1f8>
8040548c:	07600593          	li	a1,118
80405490:	0000f517          	auipc	a0,0xf
80405494:	0b850513          	addi	a0,a0,184 # 80414548 <default_pmm_manager+0x8e0>
80405498:	00112623          	sw	ra,12(sp)
8040549c:	988fb0ef          	jal	ra,80400624 <__panic>

804054a0 <get_fd_array.part.4>:
804054a0:	ff010113          	addi	sp,sp,-16
804054a4:	0000f697          	auipc	a3,0xf
804054a8:	40868693          	addi	a3,a3,1032 # 804148ac <CSWTCH.69+0x344>
804054ac:	0000e617          	auipc	a2,0xe
804054b0:	c8060613          	addi	a2,a2,-896 # 8041312c <commands+0x1f8>
804054b4:	01400593          	li	a1,20
804054b8:	0000f517          	auipc	a0,0xf
804054bc:	42050513          	addi	a0,a0,1056 # 804148d8 <CSWTCH.69+0x370>
804054c0:	00112623          	sw	ra,12(sp)
804054c4:	960fb0ef          	jal	ra,80400624 <__panic>

804054c8 <fd_array_alloc>:
804054c8:	00097797          	auipc	a5,0x97
804054cc:	2e478793          	addi	a5,a5,740 # 8049c7ac <current>
804054d0:	0007a783          	lw	a5,0(a5)
804054d4:	ff010113          	addi	sp,sp,-16
804054d8:	00112623          	sw	ra,12(sp)
804054dc:	0dc7a683          	lw	a3,220(a5)
804054e0:	0a068463          	beqz	a3,80405588 <fd_array_alloc+0xc0>
804054e4:	0086a783          	lw	a5,8(a3)
804054e8:	0af05063          	blez	a5,80405588 <fd_array_alloc+0xc0>
804054ec:	ffff7737          	lui	a4,0xffff7
804054f0:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <end+0x7fb5a21d>
804054f4:	0046a683          	lw	a3,4(a3)
804054f8:	04e50463          	beq	a0,a4,80405540 <fd_array_alloc+0x78>
804054fc:	09000793          	li	a5,144
80405500:	08a7e063          	bltu	a5,a0,80405580 <fd_array_alloc+0xb8>
80405504:	00351793          	slli	a5,a0,0x3
80405508:	40a787b3          	sub	a5,a5,a0
8040550c:	00279793          	slli	a5,a5,0x2
80405510:	00f687b3          	add	a5,a3,a5
80405514:	0007a703          	lw	a4,0(a5)
80405518:	06071063          	bnez	a4,80405578 <fd_array_alloc+0xb0>
8040551c:	0187a503          	lw	a0,24(a5)
80405520:	06051663          	bnez	a0,8040558c <fd_array_alloc+0xc4>
80405524:	00100713          	li	a4,1
80405528:	00e7a023          	sw	a4,0(a5)
8040552c:	0007aa23          	sw	zero,20(a5)
80405530:	00f5a023          	sw	a5,0(a1)
80405534:	00c12083          	lw	ra,12(sp)
80405538:	01010113          	addi	sp,sp,16
8040553c:	00008067          	ret
80405540:	0006a783          	lw	a5,0(a3)
80405544:	02078663          	beqz	a5,80405570 <fd_array_alloc+0xa8>
80405548:	00001737          	lui	a4,0x1
8040554c:	fdc70713          	addi	a4,a4,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80405550:	01c68793          	addi	a5,a3,28
80405554:	00e686b3          	add	a3,a3,a4
80405558:	0007a703          	lw	a4,0(a5)
8040555c:	fc0700e3          	beqz	a4,8040551c <fd_array_alloc+0x54>
80405560:	01c78793          	addi	a5,a5,28
80405564:	fef69ae3          	bne	a3,a5,80405558 <fd_array_alloc+0x90>
80405568:	fea00513          	li	a0,-22
8040556c:	fc9ff06f          	j	80405534 <fd_array_alloc+0x6c>
80405570:	00068793          	mv	a5,a3
80405574:	fa9ff06f          	j	8040551c <fd_array_alloc+0x54>
80405578:	ff100513          	li	a0,-15
8040557c:	fb9ff06f          	j	80405534 <fd_array_alloc+0x6c>
80405580:	ffd00513          	li	a0,-3
80405584:	fb1ff06f          	j	80405534 <fd_array_alloc+0x6c>
80405588:	f19ff0ef          	jal	ra,804054a0 <get_fd_array.part.4>
8040558c:	0000f697          	auipc	a3,0xf
80405590:	00468693          	addi	a3,a3,4 # 80414590 <CSWTCH.69+0x28>
80405594:	0000e617          	auipc	a2,0xe
80405598:	b9860613          	addi	a2,a2,-1128 # 8041312c <commands+0x1f8>
8040559c:	03b00593          	li	a1,59
804055a0:	0000f517          	auipc	a0,0xf
804055a4:	33850513          	addi	a0,a0,824 # 804148d8 <CSWTCH.69+0x370>
804055a8:	87cfb0ef          	jal	ra,80400624 <__panic>

804055ac <fd_array_free>:
804055ac:	00052783          	lw	a5,0(a0)
804055b0:	ff010113          	addi	sp,sp,-16
804055b4:	00812423          	sw	s0,8(sp)
804055b8:	00112623          	sw	ra,12(sp)
804055bc:	00100713          	li	a4,1
804055c0:	00050413          	mv	s0,a0
804055c4:	04e78863          	beq	a5,a4,80405614 <fd_array_free+0x68>
804055c8:	00300713          	li	a4,3
804055cc:	06e79263          	bne	a5,a4,80405630 <fd_array_free+0x84>
804055d0:	01852783          	lw	a5,24(a0)
804055d4:	02078263          	beqz	a5,804055f8 <fd_array_free+0x4c>
804055d8:	0000f697          	auipc	a3,0xf
804055dc:	fb868693          	addi	a3,a3,-72 # 80414590 <CSWTCH.69+0x28>
804055e0:	0000e617          	auipc	a2,0xe
804055e4:	b4c60613          	addi	a2,a2,-1204 # 8041312c <commands+0x1f8>
804055e8:	04500593          	li	a1,69
804055ec:	0000f517          	auipc	a0,0xf
804055f0:	2ec50513          	addi	a0,a0,748 # 804148d8 <CSWTCH.69+0x370>
804055f4:	830fb0ef          	jal	ra,80400624 <__panic>
804055f8:	01442503          	lw	a0,20(s0)
804055fc:	6e9080ef          	jal	ra,8040e4e4 <vfs_close>
80405600:	00c12083          	lw	ra,12(sp)
80405604:	00042023          	sw	zero,0(s0)
80405608:	00812403          	lw	s0,8(sp)
8040560c:	01010113          	addi	sp,sp,16
80405610:	00008067          	ret
80405614:	01852783          	lw	a5,24(a0)
80405618:	fc0790e3          	bnez	a5,804055d8 <fd_array_free+0x2c>
8040561c:	00042023          	sw	zero,0(s0)
80405620:	00c12083          	lw	ra,12(sp)
80405624:	00812403          	lw	s0,8(sp)
80405628:	01010113          	addi	sp,sp,16
8040562c:	00008067          	ret
80405630:	0000f697          	auipc	a3,0xf
80405634:	fac68693          	addi	a3,a3,-84 # 804145dc <CSWTCH.69+0x74>
80405638:	0000e617          	auipc	a2,0xe
8040563c:	af460613          	addi	a2,a2,-1292 # 8041312c <commands+0x1f8>
80405640:	04400593          	li	a1,68
80405644:	0000f517          	auipc	a0,0xf
80405648:	29450513          	addi	a0,a0,660 # 804148d8 <CSWTCH.69+0x370>
8040564c:	fd9fa0ef          	jal	ra,80400624 <__panic>

80405650 <fd_array_release>:
80405650:	00052783          	lw	a5,0(a0)
80405654:	ff010113          	addi	sp,sp,-16
80405658:	00112623          	sw	ra,12(sp)
8040565c:	00100693          	li	a3,1
80405660:	ffe78793          	addi	a5,a5,-2
80405664:	04f6e863          	bltu	a3,a5,804056b4 <fd_array_release+0x64>
80405668:	01852783          	lw	a5,24(a0)
8040566c:	02f05463          	blez	a5,80405694 <fd_array_release+0x44>
80405670:	fff78793          	addi	a5,a5,-1
80405674:	00f52c23          	sw	a5,24(a0)
80405678:	00078863          	beqz	a5,80405688 <fd_array_release+0x38>
8040567c:	00c12083          	lw	ra,12(sp)
80405680:	01010113          	addi	sp,sp,16
80405684:	00008067          	ret
80405688:	00c12083          	lw	ra,12(sp)
8040568c:	01010113          	addi	sp,sp,16
80405690:	f1dff06f          	j	804055ac <fd_array_free>
80405694:	0000f697          	auipc	a3,0xf
80405698:	fe868693          	addi	a3,a3,-24 # 8041467c <CSWTCH.69+0x114>
8040569c:	0000e617          	auipc	a2,0xe
804056a0:	a9060613          	addi	a2,a2,-1392 # 8041312c <commands+0x1f8>
804056a4:	05600593          	li	a1,86
804056a8:	0000f517          	auipc	a0,0xf
804056ac:	23050513          	addi	a0,a0,560 # 804148d8 <CSWTCH.69+0x370>
804056b0:	f75fa0ef          	jal	ra,80400624 <__panic>
804056b4:	0000f697          	auipc	a3,0xf
804056b8:	f9068693          	addi	a3,a3,-112 # 80414644 <CSWTCH.69+0xdc>
804056bc:	0000e617          	auipc	a2,0xe
804056c0:	a7060613          	addi	a2,a2,-1424 # 8041312c <commands+0x1f8>
804056c4:	05500593          	li	a1,85
804056c8:	0000f517          	auipc	a0,0xf
804056cc:	21050513          	addi	a0,a0,528 # 804148d8 <CSWTCH.69+0x370>
804056d0:	f55fa0ef          	jal	ra,80400624 <__panic>

804056d4 <fd_array_open.part.9>:
804056d4:	ff010113          	addi	sp,sp,-16
804056d8:	0000f697          	auipc	a3,0xf
804056dc:	f3c68693          	addi	a3,a3,-196 # 80414614 <CSWTCH.69+0xac>
804056e0:	0000e617          	auipc	a2,0xe
804056e4:	a4c60613          	addi	a2,a2,-1460 # 8041312c <commands+0x1f8>
804056e8:	05f00593          	li	a1,95
804056ec:	0000f517          	auipc	a0,0xf
804056f0:	1ec50513          	addi	a0,a0,492 # 804148d8 <CSWTCH.69+0x370>
804056f4:	00112623          	sw	ra,12(sp)
804056f8:	f2dfa0ef          	jal	ra,80400624 <__panic>

804056fc <fd_array_init>:
804056fc:	00000793          	li	a5,0
80405700:	09100713          	li	a4,145
80405704:	00f52623          	sw	a5,12(a0)
80405708:	00052c23          	sw	zero,24(a0)
8040570c:	00052023          	sw	zero,0(a0)
80405710:	00178793          	addi	a5,a5,1
80405714:	01c50513          	addi	a0,a0,28
80405718:	fee796e3          	bne	a5,a4,80405704 <fd_array_init+0x8>
8040571c:	00008067          	ret

80405720 <fd_array_close>:
80405720:	00052683          	lw	a3,0(a0)
80405724:	ff010113          	addi	sp,sp,-16
80405728:	00112623          	sw	ra,12(sp)
8040572c:	00200793          	li	a5,2
80405730:	04f69c63          	bne	a3,a5,80405788 <fd_array_close+0x68>
80405734:	01852783          	lw	a5,24(a0)
80405738:	02f05863          	blez	a5,80405768 <fd_array_close+0x48>
8040573c:	fff78793          	addi	a5,a5,-1
80405740:	00300693          	li	a3,3
80405744:	00d52023          	sw	a3,0(a0)
80405748:	00f52c23          	sw	a5,24(a0)
8040574c:	00078863          	beqz	a5,8040575c <fd_array_close+0x3c>
80405750:	00c12083          	lw	ra,12(sp)
80405754:	01010113          	addi	sp,sp,16
80405758:	00008067          	ret
8040575c:	00c12083          	lw	ra,12(sp)
80405760:	01010113          	addi	sp,sp,16
80405764:	e49ff06f          	j	804055ac <fd_array_free>
80405768:	0000f697          	auipc	a3,0xf
8040576c:	f1468693          	addi	a3,a3,-236 # 8041467c <CSWTCH.69+0x114>
80405770:	0000e617          	auipc	a2,0xe
80405774:	9bc60613          	addi	a2,a2,-1604 # 8041312c <commands+0x1f8>
80405778:	06800593          	li	a1,104
8040577c:	0000f517          	auipc	a0,0xf
80405780:	15c50513          	addi	a0,a0,348 # 804148d8 <CSWTCH.69+0x370>
80405784:	ea1fa0ef          	jal	ra,80400624 <__panic>
80405788:	0000f697          	auipc	a3,0xf
8040578c:	dec68693          	addi	a3,a3,-532 # 80414574 <CSWTCH.69+0xc>
80405790:	0000e617          	auipc	a2,0xe
80405794:	99c60613          	addi	a2,a2,-1636 # 8041312c <commands+0x1f8>
80405798:	06700593          	li	a1,103
8040579c:	0000f517          	auipc	a0,0xf
804057a0:	13c50513          	addi	a0,a0,316 # 804148d8 <CSWTCH.69+0x370>
804057a4:	e81fa0ef          	jal	ra,80400624 <__panic>

804057a8 <fd_array_dup>:
804057a8:	fe010113          	addi	sp,sp,-32
804057ac:	01212823          	sw	s2,16(sp)
804057b0:	00052903          	lw	s2,0(a0)
804057b4:	00112e23          	sw	ra,28(sp)
804057b8:	00812c23          	sw	s0,24(sp)
804057bc:	00912a23          	sw	s1,20(sp)
804057c0:	01312623          	sw	s3,12(sp)
804057c4:	00100793          	li	a5,1
804057c8:	06f91e63          	bne	s2,a5,80405844 <fd_array_dup+0x9c>
804057cc:	0005a983          	lw	s3,0(a1)
804057d0:	00200793          	li	a5,2
804057d4:	06f99863          	bne	s3,a5,80405844 <fd_array_dup+0x9c>
804057d8:	0145a483          	lw	s1,20(a1)
804057dc:	0085a783          	lw	a5,8(a1)
804057e0:	0105a683          	lw	a3,16(a1)
804057e4:	0045a703          	lw	a4,4(a1)
804057e8:	00050413          	mv	s0,a0
804057ec:	00f52423          	sw	a5,8(a0)
804057f0:	00d52823          	sw	a3,16(a0)
804057f4:	00e52223          	sw	a4,4(a0)
804057f8:	00048513          	mv	a0,s1
804057fc:	0d4080ef          	jal	ra,8040d8d0 <inode_ref_inc>
80405800:	00048513          	mv	a0,s1
80405804:	0e0080ef          	jal	ra,8040d8e4 <inode_open_inc>
80405808:	00042783          	lw	a5,0(s0)
8040580c:	00942a23          	sw	s1,20(s0)
80405810:	05279a63          	bne	a5,s2,80405864 <fd_array_dup+0xbc>
80405814:	04048863          	beqz	s1,80405864 <fd_array_dup+0xbc>
80405818:	01842783          	lw	a5,24(s0)
8040581c:	01342023          	sw	s3,0(s0)
80405820:	01c12083          	lw	ra,28(sp)
80405824:	00178793          	addi	a5,a5,1
80405828:	00f42c23          	sw	a5,24(s0)
8040582c:	01812403          	lw	s0,24(sp)
80405830:	01412483          	lw	s1,20(sp)
80405834:	01012903          	lw	s2,16(sp)
80405838:	00c12983          	lw	s3,12(sp)
8040583c:	02010113          	addi	sp,sp,32
80405840:	00008067          	ret
80405844:	0000f697          	auipc	a3,0xf
80405848:	d6468693          	addi	a3,a3,-668 # 804145a8 <CSWTCH.69+0x40>
8040584c:	0000e617          	auipc	a2,0xe
80405850:	8e060613          	addi	a2,a2,-1824 # 8041312c <commands+0x1f8>
80405854:	07300593          	li	a1,115
80405858:	0000f517          	auipc	a0,0xf
8040585c:	08050513          	addi	a0,a0,128 # 804148d8 <CSWTCH.69+0x370>
80405860:	dc5fa0ef          	jal	ra,80400624 <__panic>
80405864:	e71ff0ef          	jal	ra,804056d4 <fd_array_open.part.9>

80405868 <file_testfd>:
80405868:	09000793          	li	a5,144
8040586c:	06a7e463          	bltu	a5,a0,804058d4 <file_testfd+0x6c>
80405870:	00097797          	auipc	a5,0x97
80405874:	f3c78793          	addi	a5,a5,-196 # 8049c7ac <current>
80405878:	0007a783          	lw	a5,0(a5)
8040587c:	0dc7a703          	lw	a4,220(a5)
80405880:	04070e63          	beqz	a4,804058dc <file_testfd+0x74>
80405884:	00872783          	lw	a5,8(a4)
80405888:	04f05a63          	blez	a5,804058dc <file_testfd+0x74>
8040588c:	00472703          	lw	a4,4(a4)
80405890:	00351793          	slli	a5,a0,0x3
80405894:	40a787b3          	sub	a5,a5,a0
80405898:	00279793          	slli	a5,a5,0x2
8040589c:	00f707b3          	add	a5,a4,a5
804058a0:	0007a683          	lw	a3,0(a5)
804058a4:	00200713          	li	a4,2
804058a8:	02e69663          	bne	a3,a4,804058d4 <file_testfd+0x6c>
804058ac:	00c7a703          	lw	a4,12(a5)
804058b0:	02e51263          	bne	a0,a4,804058d4 <file_testfd+0x6c>
804058b4:	00058663          	beqz	a1,804058c0 <file_testfd+0x58>
804058b8:	0047a503          	lw	a0,4(a5)
804058bc:	00050e63          	beqz	a0,804058d8 <file_testfd+0x70>
804058c0:	00100513          	li	a0,1
804058c4:	00060a63          	beqz	a2,804058d8 <file_testfd+0x70>
804058c8:	0087a503          	lw	a0,8(a5)
804058cc:	00a03533          	snez	a0,a0
804058d0:	00008067          	ret
804058d4:	00000513          	li	a0,0
804058d8:	00008067          	ret
804058dc:	ff010113          	addi	sp,sp,-16
804058e0:	00112623          	sw	ra,12(sp)
804058e4:	bbdff0ef          	jal	ra,804054a0 <get_fd_array.part.4>

804058e8 <file_open>:
804058e8:	fc010113          	addi	sp,sp,-64
804058ec:	02112e23          	sw	ra,60(sp)
804058f0:	02812c23          	sw	s0,56(sp)
804058f4:	02912a23          	sw	s1,52(sp)
804058f8:	03212823          	sw	s2,48(sp)
804058fc:	03312623          	sw	s3,44(sp)
80405900:	03412423          	sw	s4,40(sp)
80405904:	0035f793          	andi	a5,a1,3
80405908:	00300713          	li	a4,3
8040590c:	12e78a63          	beq	a5,a4,80405a40 <file_open+0x158>
80405910:	00279793          	slli	a5,a5,0x2
80405914:	0000f717          	auipc	a4,0xf
80405918:	c5470713          	addi	a4,a4,-940 # 80414568 <CSWTCH.69>
8040591c:	00050913          	mv	s2,a0
80405920:	0000f697          	auipc	a3,0xf
80405924:	c3c68693          	addi	a3,a3,-964 # 8041455c <CSWTCH.68>
80405928:	ffff7537          	lui	a0,0xffff7
8040592c:	00f686b3          	add	a3,a3,a5
80405930:	00058493          	mv	s1,a1
80405934:	00f707b3          	add	a5,a4,a5
80405938:	00810593          	addi	a1,sp,8
8040593c:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <end+0x7fb5a21d>
80405940:	0006aa03          	lw	s4,0(a3)
80405944:	0007a983          	lw	s3,0(a5)
80405948:	b81ff0ef          	jal	ra,804054c8 <fd_array_alloc>
8040594c:	00050413          	mv	s0,a0
80405950:	02050463          	beqz	a0,80405978 <file_open+0x90>
80405954:	00040513          	mv	a0,s0
80405958:	03c12083          	lw	ra,60(sp)
8040595c:	03812403          	lw	s0,56(sp)
80405960:	03412483          	lw	s1,52(sp)
80405964:	03012903          	lw	s2,48(sp)
80405968:	02c12983          	lw	s3,44(sp)
8040596c:	02812a03          	lw	s4,40(sp)
80405970:	04010113          	addi	sp,sp,64
80405974:	00008067          	ret
80405978:	00c10613          	addi	a2,sp,12
8040597c:	00048593          	mv	a1,s1
80405980:	00090513          	mv	a0,s2
80405984:	111080ef          	jal	ra,8040e294 <vfs_open>
80405988:	00050413          	mv	s0,a0
8040598c:	0a051463          	bnez	a0,80405a34 <file_open+0x14c>
80405990:	00812783          	lw	a5,8(sp)
80405994:	0204f593          	andi	a1,s1,32
80405998:	00c12403          	lw	s0,12(sp)
8040599c:	0007a823          	sw	zero,16(a5)
804059a0:	04058a63          	beqz	a1,804059f4 <file_open+0x10c>
804059a4:	0a040463          	beqz	s0,80405a4c <file_open+0x164>
804059a8:	03c42783          	lw	a5,60(s0)
804059ac:	0a078063          	beqz	a5,80405a4c <file_open+0x164>
804059b0:	0147a783          	lw	a5,20(a5)
804059b4:	08078c63          	beqz	a5,80405a4c <file_open+0x164>
804059b8:	00040513          	mv	a0,s0
804059bc:	0000f597          	auipc	a1,0xf
804059c0:	de058593          	addi	a1,a1,-544 # 8041479c <CSWTCH.69+0x234>
804059c4:	735070ef          	jal	ra,8040d8f8 <inode_check>
804059c8:	03c42783          	lw	a5,60(s0)
804059cc:	00c12503          	lw	a0,12(sp)
804059d0:	01010593          	addi	a1,sp,16
804059d4:	0147a783          	lw	a5,20(a5)
804059d8:	000780e7          	jalr	a5
804059dc:	00050413          	mv	s0,a0
804059e0:	04051663          	bnez	a0,80405a2c <file_open+0x144>
804059e4:	00812783          	lw	a5,8(sp)
804059e8:	01c12703          	lw	a4,28(sp)
804059ec:	00c12403          	lw	s0,12(sp)
804059f0:	00e7a823          	sw	a4,16(a5)
804059f4:	0007a683          	lw	a3,0(a5)
804059f8:	0087aa23          	sw	s0,20(a5)
804059fc:	0147a223          	sw	s4,4(a5)
80405a00:	0137a423          	sw	s3,8(a5)
80405a04:	00100713          	li	a4,1
80405a08:	04e69063          	bne	a3,a4,80405a48 <file_open+0x160>
80405a0c:	02040e63          	beqz	s0,80405a48 <file_open+0x160>
80405a10:	0187a703          	lw	a4,24(a5)
80405a14:	00200693          	li	a3,2
80405a18:	00d7a023          	sw	a3,0(a5)
80405a1c:	00170713          	addi	a4,a4,1
80405a20:	00e7ac23          	sw	a4,24(a5)
80405a24:	00c7a403          	lw	s0,12(a5)
80405a28:	f2dff06f          	j	80405954 <file_open+0x6c>
80405a2c:	00c12503          	lw	a0,12(sp)
80405a30:	2b5080ef          	jal	ra,8040e4e4 <vfs_close>
80405a34:	00812503          	lw	a0,8(sp)
80405a38:	b75ff0ef          	jal	ra,804055ac <fd_array_free>
80405a3c:	f19ff06f          	j	80405954 <file_open+0x6c>
80405a40:	ffd00413          	li	s0,-3
80405a44:	f11ff06f          	j	80405954 <file_open+0x6c>
80405a48:	c8dff0ef          	jal	ra,804056d4 <fd_array_open.part.9>
80405a4c:	0000f697          	auipc	a3,0xf
80405a50:	d0068693          	addi	a3,a3,-768 # 8041474c <CSWTCH.69+0x1e4>
80405a54:	0000d617          	auipc	a2,0xd
80405a58:	6d860613          	addi	a2,a2,1752 # 8041312c <commands+0x1f8>
80405a5c:	0b800593          	li	a1,184
80405a60:	0000f517          	auipc	a0,0xf
80405a64:	e7850513          	addi	a0,a0,-392 # 804148d8 <CSWTCH.69+0x370>
80405a68:	bbdfa0ef          	jal	ra,80400624 <__panic>

80405a6c <file_close>:
80405a6c:	09000793          	li	a5,144
80405a70:	06a7ec63          	bltu	a5,a0,80405ae8 <file_close+0x7c>
80405a74:	00097797          	auipc	a5,0x97
80405a78:	d3878793          	addi	a5,a5,-712 # 8049c7ac <current>
80405a7c:	0007a783          	lw	a5,0(a5)
80405a80:	ff010113          	addi	sp,sp,-16
80405a84:	00112623          	sw	ra,12(sp)
80405a88:	0dc7a683          	lw	a3,220(a5)
80405a8c:	00050713          	mv	a4,a0
80405a90:	06068063          	beqz	a3,80405af0 <file_close+0x84>
80405a94:	0086a783          	lw	a5,8(a3)
80405a98:	04f05c63          	blez	a5,80405af0 <file_close+0x84>
80405a9c:	00351793          	slli	a5,a0,0x3
80405aa0:	0046a503          	lw	a0,4(a3)
80405aa4:	40e787b3          	sub	a5,a5,a4
80405aa8:	00279793          	slli	a5,a5,0x2
80405aac:	00f50533          	add	a0,a0,a5
80405ab0:	00052683          	lw	a3,0(a0)
80405ab4:	00200793          	li	a5,2
80405ab8:	02f69063          	bne	a3,a5,80405ad8 <file_close+0x6c>
80405abc:	00c52783          	lw	a5,12(a0)
80405ac0:	00f71c63          	bne	a4,a5,80405ad8 <file_close+0x6c>
80405ac4:	c5dff0ef          	jal	ra,80405720 <fd_array_close>
80405ac8:	00c12083          	lw	ra,12(sp)
80405acc:	00000513          	li	a0,0
80405ad0:	01010113          	addi	sp,sp,16
80405ad4:	00008067          	ret
80405ad8:	00c12083          	lw	ra,12(sp)
80405adc:	ffd00513          	li	a0,-3
80405ae0:	01010113          	addi	sp,sp,16
80405ae4:	00008067          	ret
80405ae8:	ffd00513          	li	a0,-3
80405aec:	00008067          	ret
80405af0:	9b1ff0ef          	jal	ra,804054a0 <get_fd_array.part.4>

80405af4 <file_read>:
80405af4:	fd010113          	addi	sp,sp,-48
80405af8:	02112623          	sw	ra,44(sp)
80405afc:	02812423          	sw	s0,40(sp)
80405b00:	02912223          	sw	s1,36(sp)
80405b04:	03212023          	sw	s2,32(sp)
80405b08:	01312e23          	sw	s3,28(sp)
80405b0c:	01412c23          	sw	s4,24(sp)
80405b10:	0006a023          	sw	zero,0(a3)
80405b14:	09000793          	li	a5,144
80405b18:	10a7e263          	bltu	a5,a0,80405c1c <file_read+0x128>
80405b1c:	00097797          	auipc	a5,0x97
80405b20:	c9078793          	addi	a5,a5,-880 # 8049c7ac <current>
80405b24:	0007a783          	lw	a5,0(a5)
80405b28:	00068913          	mv	s2,a3
80405b2c:	0dc7a703          	lw	a4,220(a5)
80405b30:	0e070a63          	beqz	a4,80405c24 <file_read+0x130>
80405b34:	00872783          	lw	a5,8(a4)
80405b38:	0ef05663          	blez	a5,80405c24 <file_read+0x130>
80405b3c:	00351793          	slli	a5,a0,0x3
80405b40:	00472403          	lw	s0,4(a4)
80405b44:	40a787b3          	sub	a5,a5,a0
80405b48:	00279793          	slli	a5,a5,0x2
80405b4c:	00f40433          	add	s0,s0,a5
80405b50:	00042983          	lw	s3,0(s0)
80405b54:	00200793          	li	a5,2
80405b58:	0cf99263          	bne	s3,a5,80405c1c <file_read+0x128>
80405b5c:	00c42783          	lw	a5,12(s0)
80405b60:	0af51e63          	bne	a0,a5,80405c1c <file_read+0x128>
80405b64:	00442783          	lw	a5,4(s0)
80405b68:	0a078a63          	beqz	a5,80405c1c <file_read+0x128>
80405b6c:	01842783          	lw	a5,24(s0)
80405b70:	01042683          	lw	a3,16(s0)
80405b74:	00010513          	mv	a0,sp
80405b78:	00178793          	addi	a5,a5,1
80405b7c:	00f42c23          	sw	a5,24(s0)
80405b80:	311000ef          	jal	ra,80406690 <iobuf_init>
80405b84:	01442483          	lw	s1,20(s0)
80405b88:	00050a13          	mv	s4,a0
80405b8c:	08048e63          	beqz	s1,80405c28 <file_read+0x134>
80405b90:	03c4a783          	lw	a5,60(s1)
80405b94:	08078a63          	beqz	a5,80405c28 <file_read+0x134>
80405b98:	00c7a783          	lw	a5,12(a5)
80405b9c:	08078663          	beqz	a5,80405c28 <file_read+0x134>
80405ba0:	00048513          	mv	a0,s1
80405ba4:	0000f597          	auipc	a1,0xf
80405ba8:	c5058593          	addi	a1,a1,-944 # 804147f4 <CSWTCH.69+0x28c>
80405bac:	54d070ef          	jal	ra,8040d8f8 <inode_check>
80405bb0:	03c4a783          	lw	a5,60(s1)
80405bb4:	01442503          	lw	a0,20(s0)
80405bb8:	000a0593          	mv	a1,s4
80405bbc:	00c7a783          	lw	a5,12(a5)
80405bc0:	000780e7          	jalr	a5
80405bc4:	008a2783          	lw	a5,8(s4) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80405bc8:	00ca2683          	lw	a3,12(s4)
80405bcc:	00042703          	lw	a4,0(s0)
80405bd0:	00050493          	mv	s1,a0
80405bd4:	40d787b3          	sub	a5,a5,a3
80405bd8:	03370a63          	beq	a4,s3,80405c0c <file_read+0x118>
80405bdc:	00f92023          	sw	a5,0(s2)
80405be0:	00040513          	mv	a0,s0
80405be4:	a6dff0ef          	jal	ra,80405650 <fd_array_release>
80405be8:	02c12083          	lw	ra,44(sp)
80405bec:	02812403          	lw	s0,40(sp)
80405bf0:	00048513          	mv	a0,s1
80405bf4:	02012903          	lw	s2,32(sp)
80405bf8:	02412483          	lw	s1,36(sp)
80405bfc:	01c12983          	lw	s3,28(sp)
80405c00:	01812a03          	lw	s4,24(sp)
80405c04:	03010113          	addi	sp,sp,48
80405c08:	00008067          	ret
80405c0c:	01042703          	lw	a4,16(s0)
80405c10:	00f70733          	add	a4,a4,a5
80405c14:	00e42823          	sw	a4,16(s0)
80405c18:	fc5ff06f          	j	80405bdc <file_read+0xe8>
80405c1c:	ffd00493          	li	s1,-3
80405c20:	fc9ff06f          	j	80405be8 <file_read+0xf4>
80405c24:	87dff0ef          	jal	ra,804054a0 <get_fd_array.part.4>
80405c28:	0000f697          	auipc	a3,0xf
80405c2c:	b7c68693          	addi	a3,a3,-1156 # 804147a4 <CSWTCH.69+0x23c>
80405c30:	0000d617          	auipc	a2,0xd
80405c34:	4fc60613          	addi	a2,a2,1276 # 8041312c <commands+0x1f8>
80405c38:	0e200593          	li	a1,226
80405c3c:	0000f517          	auipc	a0,0xf
80405c40:	c9c50513          	addi	a0,a0,-868 # 804148d8 <CSWTCH.69+0x370>
80405c44:	9e1fa0ef          	jal	ra,80400624 <__panic>

80405c48 <file_write>:
80405c48:	fd010113          	addi	sp,sp,-48
80405c4c:	02112623          	sw	ra,44(sp)
80405c50:	02812423          	sw	s0,40(sp)
80405c54:	02912223          	sw	s1,36(sp)
80405c58:	03212023          	sw	s2,32(sp)
80405c5c:	01312e23          	sw	s3,28(sp)
80405c60:	01412c23          	sw	s4,24(sp)
80405c64:	0006a023          	sw	zero,0(a3)
80405c68:	09000793          	li	a5,144
80405c6c:	10a7e263          	bltu	a5,a0,80405d70 <file_write+0x128>
80405c70:	00097797          	auipc	a5,0x97
80405c74:	b3c78793          	addi	a5,a5,-1220 # 8049c7ac <current>
80405c78:	0007a783          	lw	a5,0(a5)
80405c7c:	00068913          	mv	s2,a3
80405c80:	0dc7a703          	lw	a4,220(a5)
80405c84:	0e070a63          	beqz	a4,80405d78 <file_write+0x130>
80405c88:	00872783          	lw	a5,8(a4)
80405c8c:	0ef05663          	blez	a5,80405d78 <file_write+0x130>
80405c90:	00351793          	slli	a5,a0,0x3
80405c94:	00472403          	lw	s0,4(a4)
80405c98:	40a787b3          	sub	a5,a5,a0
80405c9c:	00279793          	slli	a5,a5,0x2
80405ca0:	00f40433          	add	s0,s0,a5
80405ca4:	00042983          	lw	s3,0(s0)
80405ca8:	00200793          	li	a5,2
80405cac:	0cf99263          	bne	s3,a5,80405d70 <file_write+0x128>
80405cb0:	00c42783          	lw	a5,12(s0)
80405cb4:	0af51e63          	bne	a0,a5,80405d70 <file_write+0x128>
80405cb8:	00842783          	lw	a5,8(s0)
80405cbc:	0a078a63          	beqz	a5,80405d70 <file_write+0x128>
80405cc0:	01842783          	lw	a5,24(s0)
80405cc4:	01042683          	lw	a3,16(s0)
80405cc8:	00010513          	mv	a0,sp
80405ccc:	00178793          	addi	a5,a5,1
80405cd0:	00f42c23          	sw	a5,24(s0)
80405cd4:	1bd000ef          	jal	ra,80406690 <iobuf_init>
80405cd8:	01442483          	lw	s1,20(s0)
80405cdc:	00050a13          	mv	s4,a0
80405ce0:	08048e63          	beqz	s1,80405d7c <file_write+0x134>
80405ce4:	03c4a783          	lw	a5,60(s1)
80405ce8:	08078a63          	beqz	a5,80405d7c <file_write+0x134>
80405cec:	0107a783          	lw	a5,16(a5)
80405cf0:	08078663          	beqz	a5,80405d7c <file_write+0x134>
80405cf4:	00048513          	mv	a0,s1
80405cf8:	0000f597          	auipc	a1,0xf
80405cfc:	bac58593          	addi	a1,a1,-1108 # 804148a4 <CSWTCH.69+0x33c>
80405d00:	3f9070ef          	jal	ra,8040d8f8 <inode_check>
80405d04:	03c4a783          	lw	a5,60(s1)
80405d08:	01442503          	lw	a0,20(s0)
80405d0c:	000a0593          	mv	a1,s4
80405d10:	0107a783          	lw	a5,16(a5)
80405d14:	000780e7          	jalr	a5
80405d18:	008a2783          	lw	a5,8(s4)
80405d1c:	00ca2683          	lw	a3,12(s4)
80405d20:	00042703          	lw	a4,0(s0)
80405d24:	00050493          	mv	s1,a0
80405d28:	40d787b3          	sub	a5,a5,a3
80405d2c:	03370a63          	beq	a4,s3,80405d60 <file_write+0x118>
80405d30:	00f92023          	sw	a5,0(s2)
80405d34:	00040513          	mv	a0,s0
80405d38:	919ff0ef          	jal	ra,80405650 <fd_array_release>
80405d3c:	02c12083          	lw	ra,44(sp)
80405d40:	02812403          	lw	s0,40(sp)
80405d44:	00048513          	mv	a0,s1
80405d48:	02012903          	lw	s2,32(sp)
80405d4c:	02412483          	lw	s1,36(sp)
80405d50:	01c12983          	lw	s3,28(sp)
80405d54:	01812a03          	lw	s4,24(sp)
80405d58:	03010113          	addi	sp,sp,48
80405d5c:	00008067          	ret
80405d60:	01042703          	lw	a4,16(s0)
80405d64:	00f70733          	add	a4,a4,a5
80405d68:	00e42823          	sw	a4,16(s0)
80405d6c:	fc5ff06f          	j	80405d30 <file_write+0xe8>
80405d70:	ffd00493          	li	s1,-3
80405d74:	fc9ff06f          	j	80405d3c <file_write+0xf4>
80405d78:	f28ff0ef          	jal	ra,804054a0 <get_fd_array.part.4>
80405d7c:	0000f697          	auipc	a3,0xf
80405d80:	ad868693          	addi	a3,a3,-1320 # 80414854 <CSWTCH.69+0x2ec>
80405d84:	0000d617          	auipc	a2,0xd
80405d88:	3a860613          	addi	a2,a2,936 # 8041312c <commands+0x1f8>
80405d8c:	0fc00593          	li	a1,252
80405d90:	0000f517          	auipc	a0,0xf
80405d94:	b4850513          	addi	a0,a0,-1208 # 804148d8 <CSWTCH.69+0x370>
80405d98:	88dfa0ef          	jal	ra,80400624 <__panic>

80405d9c <file_seek>:
80405d9c:	fe010113          	addi	sp,sp,-32
80405da0:	00112e23          	sw	ra,28(sp)
80405da4:	00812c23          	sw	s0,24(sp)
80405da8:	00912a23          	sw	s1,20(sp)
80405dac:	01212823          	sw	s2,16(sp)
80405db0:	09000793          	li	a5,144
80405db4:	12a7ea63          	bltu	a5,a0,80405ee8 <file_seek+0x14c>
80405db8:	00097797          	auipc	a5,0x97
80405dbc:	9f478793          	addi	a5,a5,-1548 # 8049c7ac <current>
80405dc0:	0007a783          	lw	a5,0(a5)
80405dc4:	0dc7a703          	lw	a4,220(a5)
80405dc8:	14070063          	beqz	a4,80405f08 <file_seek+0x16c>
80405dcc:	00872783          	lw	a5,8(a4)
80405dd0:	12f05c63          	blez	a5,80405f08 <file_seek+0x16c>
80405dd4:	00472403          	lw	s0,4(a4)
80405dd8:	00351793          	slli	a5,a0,0x3
80405ddc:	40a787b3          	sub	a5,a5,a0
80405de0:	00279793          	slli	a5,a5,0x2
80405de4:	00f40433          	add	s0,s0,a5
80405de8:	00042703          	lw	a4,0(s0)
80405dec:	00200793          	li	a5,2
80405df0:	0ef71c63          	bne	a4,a5,80405ee8 <file_seek+0x14c>
80405df4:	00c42783          	lw	a5,12(s0)
80405df8:	0ef51863          	bne	a0,a5,80405ee8 <file_seek+0x14c>
80405dfc:	01842783          	lw	a5,24(s0)
80405e00:	00100693          	li	a3,1
80405e04:	00058913          	mv	s2,a1
80405e08:	00178793          	addi	a5,a5,1
80405e0c:	00f42c23          	sw	a5,24(s0)
80405e10:	0cd60663          	beq	a2,a3,80405edc <file_seek+0x140>
80405e14:	02e60863          	beq	a2,a4,80405e44 <file_seek+0xa8>
80405e18:	ffd00493          	li	s1,-3
80405e1c:	06060a63          	beqz	a2,80405e90 <file_seek+0xf4>
80405e20:	00040513          	mv	a0,s0
80405e24:	82dff0ef          	jal	ra,80405650 <fd_array_release>
80405e28:	01c12083          	lw	ra,28(sp)
80405e2c:	01812403          	lw	s0,24(sp)
80405e30:	00048513          	mv	a0,s1
80405e34:	01012903          	lw	s2,16(sp)
80405e38:	01412483          	lw	s1,20(sp)
80405e3c:	02010113          	addi	sp,sp,32
80405e40:	00008067          	ret
80405e44:	01442483          	lw	s1,20(s0)
80405e48:	0e048263          	beqz	s1,80405f2c <file_seek+0x190>
80405e4c:	03c4a783          	lw	a5,60(s1)
80405e50:	0c078e63          	beqz	a5,80405f2c <file_seek+0x190>
80405e54:	0147a783          	lw	a5,20(a5)
80405e58:	0c078a63          	beqz	a5,80405f2c <file_seek+0x190>
80405e5c:	00048513          	mv	a0,s1
80405e60:	0000f597          	auipc	a1,0xf
80405e64:	93c58593          	addi	a1,a1,-1732 # 8041479c <CSWTCH.69+0x234>
80405e68:	291070ef          	jal	ra,8040d8f8 <inode_check>
80405e6c:	03c4a783          	lw	a5,60(s1)
80405e70:	01442503          	lw	a0,20(s0)
80405e74:	00010593          	mv	a1,sp
80405e78:	0147a783          	lw	a5,20(a5)
80405e7c:	000780e7          	jalr	a5
80405e80:	00050493          	mv	s1,a0
80405e84:	f8051ee3          	bnez	a0,80405e20 <file_seek+0x84>
80405e88:	00c12783          	lw	a5,12(sp)
80405e8c:	00f90933          	add	s2,s2,a5
80405e90:	01442483          	lw	s1,20(s0)
80405e94:	06048c63          	beqz	s1,80405f0c <file_seek+0x170>
80405e98:	03c4a783          	lw	a5,60(s1)
80405e9c:	06078863          	beqz	a5,80405f0c <file_seek+0x170>
80405ea0:	02c7a783          	lw	a5,44(a5)
80405ea4:	06078463          	beqz	a5,80405f0c <file_seek+0x170>
80405ea8:	00048513          	mv	a0,s1
80405eac:	0000f597          	auipc	a1,0xf
80405eb0:	9a058593          	addi	a1,a1,-1632 # 8041484c <CSWTCH.69+0x2e4>
80405eb4:	245070ef          	jal	ra,8040d8f8 <inode_check>
80405eb8:	03c4a783          	lw	a5,60(s1)
80405ebc:	01442503          	lw	a0,20(s0)
80405ec0:	00090593          	mv	a1,s2
80405ec4:	02c7a783          	lw	a5,44(a5)
80405ec8:	000780e7          	jalr	a5
80405ecc:	00050493          	mv	s1,a0
80405ed0:	f40518e3          	bnez	a0,80405e20 <file_seek+0x84>
80405ed4:	01242823          	sw	s2,16(s0)
80405ed8:	f49ff06f          	j	80405e20 <file_seek+0x84>
80405edc:	01042783          	lw	a5,16(s0)
80405ee0:	00f58933          	add	s2,a1,a5
80405ee4:	fadff06f          	j	80405e90 <file_seek+0xf4>
80405ee8:	01c12083          	lw	ra,28(sp)
80405eec:	01812403          	lw	s0,24(sp)
80405ef0:	ffd00493          	li	s1,-3
80405ef4:	00048513          	mv	a0,s1
80405ef8:	01012903          	lw	s2,16(sp)
80405efc:	01412483          	lw	s1,20(sp)
80405f00:	02010113          	addi	sp,sp,32
80405f04:	00008067          	ret
80405f08:	d98ff0ef          	jal	ra,804054a0 <get_fd_array.part.4>
80405f0c:	0000f697          	auipc	a3,0xf
80405f10:	8f068693          	addi	a3,a3,-1808 # 804147fc <CSWTCH.69+0x294>
80405f14:	0000d617          	auipc	a2,0xd
80405f18:	21860613          	addi	a2,a2,536 # 8041312c <commands+0x1f8>
80405f1c:	11e00593          	li	a1,286
80405f20:	0000f517          	auipc	a0,0xf
80405f24:	9b850513          	addi	a0,a0,-1608 # 804148d8 <CSWTCH.69+0x370>
80405f28:	efcfa0ef          	jal	ra,80400624 <__panic>
80405f2c:	0000f697          	auipc	a3,0xf
80405f30:	82068693          	addi	a3,a3,-2016 # 8041474c <CSWTCH.69+0x1e4>
80405f34:	0000d617          	auipc	a2,0xd
80405f38:	1f860613          	addi	a2,a2,504 # 8041312c <commands+0x1f8>
80405f3c:	11600593          	li	a1,278
80405f40:	0000f517          	auipc	a0,0xf
80405f44:	99850513          	addi	a0,a0,-1640 # 804148d8 <CSWTCH.69+0x370>
80405f48:	edcfa0ef          	jal	ra,80400624 <__panic>

80405f4c <file_fstat>:
80405f4c:	ff010113          	addi	sp,sp,-16
80405f50:	00112623          	sw	ra,12(sp)
80405f54:	00812423          	sw	s0,8(sp)
80405f58:	00912223          	sw	s1,4(sp)
80405f5c:	01212023          	sw	s2,0(sp)
80405f60:	09000793          	li	a5,144
80405f64:	0aa7ee63          	bltu	a5,a0,80406020 <file_fstat+0xd4>
80405f68:	00097797          	auipc	a5,0x97
80405f6c:	84478793          	addi	a5,a5,-1980 # 8049c7ac <current>
80405f70:	0007a783          	lw	a5,0(a5)
80405f74:	00058913          	mv	s2,a1
80405f78:	0dc7a703          	lw	a4,220(a5)
80405f7c:	0c070263          	beqz	a4,80406040 <file_fstat+0xf4>
80405f80:	00872783          	lw	a5,8(a4)
80405f84:	0af05e63          	blez	a5,80406040 <file_fstat+0xf4>
80405f88:	00472403          	lw	s0,4(a4)
80405f8c:	00351793          	slli	a5,a0,0x3
80405f90:	40a787b3          	sub	a5,a5,a0
80405f94:	00279793          	slli	a5,a5,0x2
80405f98:	00f40433          	add	s0,s0,a5
80405f9c:	00042703          	lw	a4,0(s0)
80405fa0:	00200793          	li	a5,2
80405fa4:	06f71e63          	bne	a4,a5,80406020 <file_fstat+0xd4>
80405fa8:	00c42783          	lw	a5,12(s0)
80405fac:	06f51a63          	bne	a0,a5,80406020 <file_fstat+0xd4>
80405fb0:	01842783          	lw	a5,24(s0)
80405fb4:	01442483          	lw	s1,20(s0)
80405fb8:	00178793          	addi	a5,a5,1
80405fbc:	00f42c23          	sw	a5,24(s0)
80405fc0:	08048263          	beqz	s1,80406044 <file_fstat+0xf8>
80405fc4:	03c4a783          	lw	a5,60(s1)
80405fc8:	06078e63          	beqz	a5,80406044 <file_fstat+0xf8>
80405fcc:	0147a783          	lw	a5,20(a5)
80405fd0:	06078a63          	beqz	a5,80406044 <file_fstat+0xf8>
80405fd4:	00048513          	mv	a0,s1
80405fd8:	0000e597          	auipc	a1,0xe
80405fdc:	7c458593          	addi	a1,a1,1988 # 8041479c <CSWTCH.69+0x234>
80405fe0:	119070ef          	jal	ra,8040d8f8 <inode_check>
80405fe4:	03c4a783          	lw	a5,60(s1)
80405fe8:	01442503          	lw	a0,20(s0)
80405fec:	00090593          	mv	a1,s2
80405ff0:	0147a783          	lw	a5,20(a5)
80405ff4:	000780e7          	jalr	a5
80405ff8:	00050493          	mv	s1,a0
80405ffc:	00040513          	mv	a0,s0
80406000:	e50ff0ef          	jal	ra,80405650 <fd_array_release>
80406004:	00c12083          	lw	ra,12(sp)
80406008:	00812403          	lw	s0,8(sp)
8040600c:	00048513          	mv	a0,s1
80406010:	00012903          	lw	s2,0(sp)
80406014:	00412483          	lw	s1,4(sp)
80406018:	01010113          	addi	sp,sp,16
8040601c:	00008067          	ret
80406020:	00c12083          	lw	ra,12(sp)
80406024:	00812403          	lw	s0,8(sp)
80406028:	ffd00493          	li	s1,-3
8040602c:	00048513          	mv	a0,s1
80406030:	00012903          	lw	s2,0(sp)
80406034:	00412483          	lw	s1,4(sp)
80406038:	01010113          	addi	sp,sp,16
8040603c:	00008067          	ret
80406040:	c60ff0ef          	jal	ra,804054a0 <get_fd_array.part.4>
80406044:	0000e697          	auipc	a3,0xe
80406048:	70868693          	addi	a3,a3,1800 # 8041474c <CSWTCH.69+0x1e4>
8040604c:	0000d617          	auipc	a2,0xd
80406050:	0e060613          	addi	a2,a2,224 # 8041312c <commands+0x1f8>
80406054:	13000593          	li	a1,304
80406058:	0000f517          	auipc	a0,0xf
8040605c:	88050513          	addi	a0,a0,-1920 # 804148d8 <CSWTCH.69+0x370>
80406060:	dc4fa0ef          	jal	ra,80400624 <__panic>

80406064 <file_fsync>:
80406064:	ff010113          	addi	sp,sp,-16
80406068:	00112623          	sw	ra,12(sp)
8040606c:	00812423          	sw	s0,8(sp)
80406070:	00912223          	sw	s1,4(sp)
80406074:	09000793          	li	a5,144
80406078:	0aa7e863          	bltu	a5,a0,80406128 <file_fsync+0xc4>
8040607c:	00096797          	auipc	a5,0x96
80406080:	73078793          	addi	a5,a5,1840 # 8049c7ac <current>
80406084:	0007a783          	lw	a5,0(a5)
80406088:	0dc7a703          	lw	a4,220(a5)
8040608c:	0a070c63          	beqz	a4,80406144 <file_fsync+0xe0>
80406090:	00872783          	lw	a5,8(a4)
80406094:	0af05863          	blez	a5,80406144 <file_fsync+0xe0>
80406098:	00472403          	lw	s0,4(a4)
8040609c:	00351793          	slli	a5,a0,0x3
804060a0:	40a787b3          	sub	a5,a5,a0
804060a4:	00279793          	slli	a5,a5,0x2
804060a8:	00f40433          	add	s0,s0,a5
804060ac:	00042703          	lw	a4,0(s0)
804060b0:	00200793          	li	a5,2
804060b4:	06f71a63          	bne	a4,a5,80406128 <file_fsync+0xc4>
804060b8:	00c42783          	lw	a5,12(s0)
804060bc:	06f51663          	bne	a0,a5,80406128 <file_fsync+0xc4>
804060c0:	01842783          	lw	a5,24(s0)
804060c4:	01442483          	lw	s1,20(s0)
804060c8:	00178793          	addi	a5,a5,1
804060cc:	00f42c23          	sw	a5,24(s0)
804060d0:	06048c63          	beqz	s1,80406148 <file_fsync+0xe4>
804060d4:	03c4a783          	lw	a5,60(s1)
804060d8:	06078863          	beqz	a5,80406148 <file_fsync+0xe4>
804060dc:	0187a783          	lw	a5,24(a5)
804060e0:	06078463          	beqz	a5,80406148 <file_fsync+0xe4>
804060e4:	0000e597          	auipc	a1,0xe
804060e8:	60058593          	addi	a1,a1,1536 # 804146e4 <CSWTCH.69+0x17c>
804060ec:	00048513          	mv	a0,s1
804060f0:	009070ef          	jal	ra,8040d8f8 <inode_check>
804060f4:	03c4a783          	lw	a5,60(s1)
804060f8:	01442503          	lw	a0,20(s0)
804060fc:	0187a783          	lw	a5,24(a5)
80406100:	000780e7          	jalr	a5
80406104:	00050493          	mv	s1,a0
80406108:	00040513          	mv	a0,s0
8040610c:	d44ff0ef          	jal	ra,80405650 <fd_array_release>
80406110:	00c12083          	lw	ra,12(sp)
80406114:	00812403          	lw	s0,8(sp)
80406118:	00048513          	mv	a0,s1
8040611c:	00412483          	lw	s1,4(sp)
80406120:	01010113          	addi	sp,sp,16
80406124:	00008067          	ret
80406128:	00c12083          	lw	ra,12(sp)
8040612c:	00812403          	lw	s0,8(sp)
80406130:	ffd00493          	li	s1,-3
80406134:	00048513          	mv	a0,s1
80406138:	00412483          	lw	s1,4(sp)
8040613c:	01010113          	addi	sp,sp,16
80406140:	00008067          	ret
80406144:	b5cff0ef          	jal	ra,804054a0 <get_fd_array.part.4>
80406148:	0000e697          	auipc	a3,0xe
8040614c:	54c68693          	addi	a3,a3,1356 # 80414694 <CSWTCH.69+0x12c>
80406150:	0000d617          	auipc	a2,0xd
80406154:	fdc60613          	addi	a2,a2,-36 # 8041312c <commands+0x1f8>
80406158:	13e00593          	li	a1,318
8040615c:	0000e517          	auipc	a0,0xe
80406160:	77c50513          	addi	a0,a0,1916 # 804148d8 <CSWTCH.69+0x370>
80406164:	cc0fa0ef          	jal	ra,80400624 <__panic>

80406168 <file_getdirentry>:
80406168:	fd010113          	addi	sp,sp,-48
8040616c:	02112623          	sw	ra,44(sp)
80406170:	02812423          	sw	s0,40(sp)
80406174:	02912223          	sw	s1,36(sp)
80406178:	03212023          	sw	s2,32(sp)
8040617c:	01312e23          	sw	s3,28(sp)
80406180:	09000793          	li	a5,144
80406184:	0ea7ec63          	bltu	a5,a0,8040627c <file_getdirentry+0x114>
80406188:	00096797          	auipc	a5,0x96
8040618c:	62478793          	addi	a5,a5,1572 # 8049c7ac <current>
80406190:	0007a783          	lw	a5,0(a5)
80406194:	00058493          	mv	s1,a1
80406198:	0dc7a703          	lw	a4,220(a5)
8040619c:	10070263          	beqz	a4,804062a0 <file_getdirentry+0x138>
804061a0:	00872783          	lw	a5,8(a4)
804061a4:	0ef05e63          	blez	a5,804062a0 <file_getdirentry+0x138>
804061a8:	00472403          	lw	s0,4(a4)
804061ac:	00351793          	slli	a5,a0,0x3
804061b0:	40a787b3          	sub	a5,a5,a0
804061b4:	00279793          	slli	a5,a5,0x2
804061b8:	00f40433          	add	s0,s0,a5
804061bc:	00042703          	lw	a4,0(s0)
804061c0:	00200793          	li	a5,2
804061c4:	0af71c63          	bne	a4,a5,8040627c <file_getdirentry+0x114>
804061c8:	00c42783          	lw	a5,12(s0)
804061cc:	0af51863          	bne	a0,a5,8040627c <file_getdirentry+0x114>
804061d0:	01842783          	lw	a5,24(s0)
804061d4:	10000613          	li	a2,256
804061d8:	00458593          	addi	a1,a1,4
804061dc:	00178793          	addi	a5,a5,1
804061e0:	00f42c23          	sw	a5,24(s0)
804061e4:	0004a683          	lw	a3,0(s1)
804061e8:	00010513          	mv	a0,sp
804061ec:	4a4000ef          	jal	ra,80406690 <iobuf_init>
804061f0:	01442903          	lw	s2,20(s0)
804061f4:	00050993          	mv	s3,a0
804061f8:	0a090663          	beqz	s2,804062a4 <file_getdirentry+0x13c>
804061fc:	03c92783          	lw	a5,60(s2)
80406200:	0a078263          	beqz	a5,804062a4 <file_getdirentry+0x13c>
80406204:	0207a783          	lw	a5,32(a5)
80406208:	08078e63          	beqz	a5,804062a4 <file_getdirentry+0x13c>
8040620c:	00090513          	mv	a0,s2
80406210:	0000e597          	auipc	a1,0xe
80406214:	53058593          	addi	a1,a1,1328 # 80414740 <CSWTCH.69+0x1d8>
80406218:	6e0070ef          	jal	ra,8040d8f8 <inode_check>
8040621c:	03c92783          	lw	a5,60(s2)
80406220:	01442503          	lw	a0,20(s0)
80406224:	00098593          	mv	a1,s3
80406228:	0207a783          	lw	a5,32(a5)
8040622c:	000780e7          	jalr	a5
80406230:	00050913          	mv	s2,a0
80406234:	02050663          	beqz	a0,80406260 <file_getdirentry+0xf8>
80406238:	00040513          	mv	a0,s0
8040623c:	c14ff0ef          	jal	ra,80405650 <fd_array_release>
80406240:	02c12083          	lw	ra,44(sp)
80406244:	02812403          	lw	s0,40(sp)
80406248:	00090513          	mv	a0,s2
8040624c:	02412483          	lw	s1,36(sp)
80406250:	02012903          	lw	s2,32(sp)
80406254:	01c12983          	lw	s3,28(sp)
80406258:	03010113          	addi	sp,sp,48
8040625c:	00008067          	ret
80406260:	0004a783          	lw	a5,0(s1)
80406264:	0089a683          	lw	a3,8(s3) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80406268:	00c9a703          	lw	a4,12(s3)
8040626c:	00d787b3          	add	a5,a5,a3
80406270:	40e787b3          	sub	a5,a5,a4
80406274:	00f4a023          	sw	a5,0(s1)
80406278:	fc1ff06f          	j	80406238 <file_getdirentry+0xd0>
8040627c:	02c12083          	lw	ra,44(sp)
80406280:	02812403          	lw	s0,40(sp)
80406284:	ffd00913          	li	s2,-3
80406288:	00090513          	mv	a0,s2
8040628c:	02412483          	lw	s1,36(sp)
80406290:	02012903          	lw	s2,32(sp)
80406294:	01c12983          	lw	s3,28(sp)
80406298:	03010113          	addi	sp,sp,48
8040629c:	00008067          	ret
804062a0:	a00ff0ef          	jal	ra,804054a0 <get_fd_array.part.4>
804062a4:	0000e697          	auipc	a3,0xe
804062a8:	44868693          	addi	a3,a3,1096 # 804146ec <CSWTCH.69+0x184>
804062ac:	0000d617          	auipc	a2,0xd
804062b0:	e8060613          	addi	a2,a2,-384 # 8041312c <commands+0x1f8>
804062b4:	14e00593          	li	a1,334
804062b8:	0000e517          	auipc	a0,0xe
804062bc:	62050513          	addi	a0,a0,1568 # 804148d8 <CSWTCH.69+0x370>
804062c0:	b64fa0ef          	jal	ra,80400624 <__panic>

804062c4 <file_dup>:
804062c4:	09000793          	li	a5,144
804062c8:	0aa7e863          	bltu	a5,a0,80406378 <file_dup+0xb4>
804062cc:	00096797          	auipc	a5,0x96
804062d0:	4e078793          	addi	a5,a5,1248 # 8049c7ac <current>
804062d4:	0007a783          	lw	a5,0(a5)
804062d8:	fe010113          	addi	sp,sp,-32
804062dc:	00112e23          	sw	ra,28(sp)
804062e0:	0dc7a683          	lw	a3,220(a5)
804062e4:	00812c23          	sw	s0,24(sp)
804062e8:	00050713          	mv	a4,a0
804062ec:	00058513          	mv	a0,a1
804062f0:	08068863          	beqz	a3,80406380 <file_dup+0xbc>
804062f4:	0086a783          	lw	a5,8(a3)
804062f8:	08f05463          	blez	a5,80406380 <file_dup+0xbc>
804062fc:	0046a403          	lw	s0,4(a3)
80406300:	00371793          	slli	a5,a4,0x3
80406304:	40e787b3          	sub	a5,a5,a4
80406308:	00279793          	slli	a5,a5,0x2
8040630c:	00f40433          	add	s0,s0,a5
80406310:	00042683          	lw	a3,0(s0)
80406314:	00200793          	li	a5,2
80406318:	04f69663          	bne	a3,a5,80406364 <file_dup+0xa0>
8040631c:	00c42783          	lw	a5,12(s0)
80406320:	04f71263          	bne	a4,a5,80406364 <file_dup+0xa0>
80406324:	00c10593          	addi	a1,sp,12
80406328:	9a0ff0ef          	jal	ra,804054c8 <fd_array_alloc>
8040632c:	00050a63          	beqz	a0,80406340 <file_dup+0x7c>
80406330:	01c12083          	lw	ra,28(sp)
80406334:	01812403          	lw	s0,24(sp)
80406338:	02010113          	addi	sp,sp,32
8040633c:	00008067          	ret
80406340:	00c12503          	lw	a0,12(sp)
80406344:	00040593          	mv	a1,s0
80406348:	c60ff0ef          	jal	ra,804057a8 <fd_array_dup>
8040634c:	00c12783          	lw	a5,12(sp)
80406350:	01c12083          	lw	ra,28(sp)
80406354:	01812403          	lw	s0,24(sp)
80406358:	00c7a503          	lw	a0,12(a5)
8040635c:	02010113          	addi	sp,sp,32
80406360:	00008067          	ret
80406364:	01c12083          	lw	ra,28(sp)
80406368:	01812403          	lw	s0,24(sp)
8040636c:	ffd00513          	li	a0,-3
80406370:	02010113          	addi	sp,sp,32
80406374:	00008067          	ret
80406378:	ffd00513          	li	a0,-3
8040637c:	00008067          	ret
80406380:	920ff0ef          	jal	ra,804054a0 <get_fd_array.part.4>

80406384 <fs_init>:
80406384:	ff010113          	addi	sp,sp,-16
80406388:	00112623          	sw	ra,12(sp)
8040638c:	029070ef          	jal	ra,8040dbb4 <vfs_init>
80406390:	2c5080ef          	jal	ra,8040ee54 <dev_init>
80406394:	00c12083          	lw	ra,12(sp)
80406398:	01010113          	addi	sp,sp,16
8040639c:	7240906f          	j	8040fac0 <sfs_init>

804063a0 <fs_cleanup>:
804063a0:	3e50706f          	j	8040df84 <vfs_cleanup>

804063a4 <lock_files>:
804063a4:	00c50513          	addi	a0,a0,12
804063a8:	e95fe06f          	j	8040523c <down>

804063ac <unlock_files>:
804063ac:	00c50513          	addi	a0,a0,12
804063b0:	e89fe06f          	j	80405238 <up>

804063b4 <files_create>:
804063b4:	ff010113          	addi	sp,sp,-16
804063b8:	00001537          	lui	a0,0x1
804063bc:	00812423          	sw	s0,8(sp)
804063c0:	00112623          	sw	ra,12(sp)
804063c4:	ec8fc0ef          	jal	ra,80402a8c <kmalloc>
804063c8:	00050413          	mv	s0,a0
804063cc:	02050463          	beqz	a0,804063f4 <files_create+0x40>
804063d0:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6fe8>
804063d4:	00042023          	sw	zero,0(s0)
804063d8:	00c50513          	addi	a0,a0,12
804063dc:	00f42223          	sw	a5,4(s0)
804063e0:	00042423          	sw	zero,8(s0)
804063e4:	00100593          	li	a1,1
804063e8:	e45fe0ef          	jal	ra,8040522c <sem_init>
804063ec:	00442503          	lw	a0,4(s0)
804063f0:	b0cff0ef          	jal	ra,804056fc <fd_array_init>
804063f4:	00040513          	mv	a0,s0
804063f8:	00c12083          	lw	ra,12(sp)
804063fc:	00812403          	lw	s0,8(sp)
80406400:	01010113          	addi	sp,sp,16
80406404:	00008067          	ret

80406408 <files_destroy>:
80406408:	fe010113          	addi	sp,sp,-32
8040640c:	00112e23          	sw	ra,28(sp)
80406410:	00812c23          	sw	s0,24(sp)
80406414:	00912a23          	sw	s1,20(sp)
80406418:	01212823          	sw	s2,16(sp)
8040641c:	01312623          	sw	s3,12(sp)
80406420:	08050a63          	beqz	a0,804064b4 <files_destroy+0xac>
80406424:	00852783          	lw	a5,8(a0)
80406428:	00050993          	mv	s3,a0
8040642c:	08079463          	bnez	a5,804064b4 <files_destroy+0xac>
80406430:	00052503          	lw	a0,0(a0)
80406434:	00050463          	beqz	a0,8040643c <files_destroy+0x34>
80406438:	58c070ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040643c:	0049a403          	lw	s0,4(s3)
80406440:	000014b7          	lui	s1,0x1
80406444:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406448:	009404b3          	add	s1,s0,s1
8040644c:	00200913          	li	s2,2
80406450:	00042783          	lw	a5,0(s0)
80406454:	03278863          	beq	a5,s2,80406484 <files_destroy+0x7c>
80406458:	02079e63          	bnez	a5,80406494 <files_destroy+0x8c>
8040645c:	01c40413          	addi	s0,s0,28
80406460:	fe8498e3          	bne	s1,s0,80406450 <files_destroy+0x48>
80406464:	01812403          	lw	s0,24(sp)
80406468:	01c12083          	lw	ra,28(sp)
8040646c:	01412483          	lw	s1,20(sp)
80406470:	01012903          	lw	s2,16(sp)
80406474:	00098513          	mv	a0,s3
80406478:	00c12983          	lw	s3,12(sp)
8040647c:	02010113          	addi	sp,sp,32
80406480:	f30fc06f          	j	80402bb0 <kfree>
80406484:	00040513          	mv	a0,s0
80406488:	a98ff0ef          	jal	ra,80405720 <fd_array_close>
8040648c:	00042783          	lw	a5,0(s0)
80406490:	fc9ff06f          	j	80406458 <files_destroy+0x50>
80406494:	0000e697          	auipc	a3,0xe
80406498:	4c068693          	addi	a3,a3,1216 # 80414954 <CSWTCH.69+0x3ec>
8040649c:	0000d617          	auipc	a2,0xd
804064a0:	c9060613          	addi	a2,a2,-880 # 8041312c <commands+0x1f8>
804064a4:	03d00593          	li	a1,61
804064a8:	0000e517          	auipc	a0,0xe
804064ac:	49c50513          	addi	a0,a0,1180 # 80414944 <CSWTCH.69+0x3dc>
804064b0:	974fa0ef          	jal	ra,80400624 <__panic>
804064b4:	0000e697          	auipc	a3,0xe
804064b8:	46468693          	addi	a3,a3,1124 # 80414918 <CSWTCH.69+0x3b0>
804064bc:	0000d617          	auipc	a2,0xd
804064c0:	c7060613          	addi	a2,a2,-912 # 8041312c <commands+0x1f8>
804064c4:	03300593          	li	a1,51
804064c8:	0000e517          	auipc	a0,0xe
804064cc:	47c50513          	addi	a0,a0,1148 # 80414944 <CSWTCH.69+0x3dc>
804064d0:	954fa0ef          	jal	ra,80400624 <__panic>

804064d4 <files_closeall>:
804064d4:	ff010113          	addi	sp,sp,-16
804064d8:	00112623          	sw	ra,12(sp)
804064dc:	00812423          	sw	s0,8(sp)
804064e0:	00912223          	sw	s1,4(sp)
804064e4:	01212023          	sw	s2,0(sp)
804064e8:	06050063          	beqz	a0,80406548 <files_closeall+0x74>
804064ec:	00852783          	lw	a5,8(a0)
804064f0:	04f05c63          	blez	a5,80406548 <files_closeall+0x74>
804064f4:	00452483          	lw	s1,4(a0)
804064f8:	000017b7          	lui	a5,0x1
804064fc:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80406500:	03848413          	addi	s0,s1,56
80406504:	00200913          	li	s2,2
80406508:	00f484b3          	add	s1,s1,a5
8040650c:	00c0006f          	j	80406518 <files_closeall+0x44>
80406510:	01c40413          	addi	s0,s0,28
80406514:	00848e63          	beq	s1,s0,80406530 <files_closeall+0x5c>
80406518:	00042783          	lw	a5,0(s0)
8040651c:	ff279ae3          	bne	a5,s2,80406510 <files_closeall+0x3c>
80406520:	00040513          	mv	a0,s0
80406524:	01c40413          	addi	s0,s0,28
80406528:	9f8ff0ef          	jal	ra,80405720 <fd_array_close>
8040652c:	fe8496e3          	bne	s1,s0,80406518 <files_closeall+0x44>
80406530:	00c12083          	lw	ra,12(sp)
80406534:	00812403          	lw	s0,8(sp)
80406538:	00412483          	lw	s1,4(sp)
8040653c:	00012903          	lw	s2,0(sp)
80406540:	01010113          	addi	sp,sp,16
80406544:	00008067          	ret
80406548:	0000e697          	auipc	a3,0xe
8040654c:	36468693          	addi	a3,a3,868 # 804148ac <CSWTCH.69+0x344>
80406550:	0000d617          	auipc	a2,0xd
80406554:	bdc60613          	addi	a2,a2,-1060 # 8041312c <commands+0x1f8>
80406558:	04500593          	li	a1,69
8040655c:	0000e517          	auipc	a0,0xe
80406560:	3e850513          	addi	a0,a0,1000 # 80414944 <CSWTCH.69+0x3dc>
80406564:	8c0fa0ef          	jal	ra,80400624 <__panic>

80406568 <dup_files>:
80406568:	fe010113          	addi	sp,sp,-32
8040656c:	00112e23          	sw	ra,28(sp)
80406570:	00812c23          	sw	s0,24(sp)
80406574:	00912a23          	sw	s1,20(sp)
80406578:	01212823          	sw	s2,16(sp)
8040657c:	01312623          	sw	s3,12(sp)
80406580:	01412423          	sw	s4,8(sp)
80406584:	0a050263          	beqz	a0,80406628 <dup_files+0xc0>
80406588:	00058413          	mv	s0,a1
8040658c:	08058e63          	beqz	a1,80406628 <dup_files+0xc0>
80406590:	00852783          	lw	a5,8(a0)
80406594:	00050493          	mv	s1,a0
80406598:	0a079863          	bnez	a5,80406648 <dup_files+0xe0>
8040659c:	0085a783          	lw	a5,8(a1)
804065a0:	0af05463          	blez	a5,80406648 <dup_files+0xe0>
804065a4:	0005a503          	lw	a0,0(a1)
804065a8:	00a4a023          	sw	a0,0(s1)
804065ac:	00050463          	beqz	a0,804065b4 <dup_files+0x4c>
804065b0:	320070ef          	jal	ra,8040d8d0 <inode_ref_inc>
804065b4:	00442403          	lw	s0,4(s0)
804065b8:	00001937          	lui	s2,0x1
804065bc:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804065c0:	0044a483          	lw	s1,4(s1)
804065c4:	01240933          	add	s2,s0,s2
804065c8:	00200993          	li	s3,2
804065cc:	00100a13          	li	s4,1
804065d0:	0100006f          	j	804065e0 <dup_files+0x78>
804065d4:	01c40413          	addi	s0,s0,28
804065d8:	01c48493          	addi	s1,s1,28
804065dc:	02890463          	beq	s2,s0,80406604 <dup_files+0x9c>
804065e0:	00042783          	lw	a5,0(s0)
804065e4:	ff3798e3          	bne	a5,s3,804065d4 <dup_files+0x6c>
804065e8:	0144a023          	sw	s4,0(s1)
804065ec:	00040593          	mv	a1,s0
804065f0:	00048513          	mv	a0,s1
804065f4:	01c40413          	addi	s0,s0,28
804065f8:	9b0ff0ef          	jal	ra,804057a8 <fd_array_dup>
804065fc:	01c48493          	addi	s1,s1,28
80406600:	fe8910e3          	bne	s2,s0,804065e0 <dup_files+0x78>
80406604:	01c12083          	lw	ra,28(sp)
80406608:	01812403          	lw	s0,24(sp)
8040660c:	01412483          	lw	s1,20(sp)
80406610:	01012903          	lw	s2,16(sp)
80406614:	00c12983          	lw	s3,12(sp)
80406618:	00812a03          	lw	s4,8(sp)
8040661c:	00000513          	li	a0,0
80406620:	02010113          	addi	sp,sp,32
80406624:	00008067          	ret
80406628:	0000e697          	auipc	a3,0xe
8040662c:	dd468693          	addi	a3,a3,-556 # 804143fc <default_pmm_manager+0x794>
80406630:	0000d617          	auipc	a2,0xd
80406634:	afc60613          	addi	a2,a2,-1284 # 8041312c <commands+0x1f8>
80406638:	05300593          	li	a1,83
8040663c:	0000e517          	auipc	a0,0xe
80406640:	30850513          	addi	a0,a0,776 # 80414944 <CSWTCH.69+0x3dc>
80406644:	fe1f90ef          	jal	ra,80400624 <__panic>
80406648:	0000e697          	auipc	a3,0xe
8040664c:	2a068693          	addi	a3,a3,672 # 804148e8 <CSWTCH.69+0x380>
80406650:	0000d617          	auipc	a2,0xd
80406654:	adc60613          	addi	a2,a2,-1316 # 8041312c <commands+0x1f8>
80406658:	05400593          	li	a1,84
8040665c:	0000e517          	auipc	a0,0xe
80406660:	2e850513          	addi	a0,a0,744 # 80414944 <CSWTCH.69+0x3dc>
80406664:	fc1f90ef          	jal	ra,80400624 <__panic>

80406668 <iobuf_skip.part.0>:
80406668:	ff010113          	addi	sp,sp,-16
8040666c:	0000e697          	auipc	a3,0xe
80406670:	30068693          	addi	a3,a3,768 # 8041496c <CSWTCH.69+0x404>
80406674:	0000d617          	auipc	a2,0xd
80406678:	ab860613          	addi	a2,a2,-1352 # 8041312c <commands+0x1f8>
8040667c:	04a00593          	li	a1,74
80406680:	0000e517          	auipc	a0,0xe
80406684:	30050513          	addi	a0,a0,768 # 80414980 <CSWTCH.69+0x418>
80406688:	00112623          	sw	ra,12(sp)
8040668c:	f99f90ef          	jal	ra,80400624 <__panic>

80406690 <iobuf_init>:
80406690:	00b52023          	sw	a1,0(a0)
80406694:	00d52223          	sw	a3,4(a0)
80406698:	00c52623          	sw	a2,12(a0)
8040669c:	00c52423          	sw	a2,8(a0)
804066a0:	00008067          	ret

804066a4 <iobuf_move>:
804066a4:	fe010113          	addi	sp,sp,-32
804066a8:	00812c23          	sw	s0,24(sp)
804066ac:	00c52403          	lw	s0,12(a0)
804066b0:	00912a23          	sw	s1,20(sp)
804066b4:	01212823          	sw	s2,16(sp)
804066b8:	01312623          	sw	s3,12(sp)
804066bc:	00112e23          	sw	ra,28(sp)
804066c0:	00050493          	mv	s1,a0
804066c4:	00060913          	mv	s2,a2
804066c8:	00058513          	mv	a0,a1
804066cc:	00070993          	mv	s3,a4
804066d0:	00867463          	bgeu	a2,s0,804066d8 <iobuf_move+0x34>
804066d4:	00060413          	mv	s0,a2
804066d8:	04040063          	beqz	s0,80406718 <iobuf_move+0x74>
804066dc:	0004a583          	lw	a1,0(s1)
804066e0:	06069263          	bnez	a3,80406744 <iobuf_move+0xa0>
804066e4:	00040613          	mv	a2,s0
804066e8:	5f40c0ef          	jal	ra,80412cdc <memmove>
804066ec:	00c4a783          	lw	a5,12(s1)
804066f0:	0687e663          	bltu	a5,s0,8040675c <iobuf_move+0xb8>
804066f4:	0004a683          	lw	a3,0(s1)
804066f8:	0044a703          	lw	a4,4(s1)
804066fc:	408787b3          	sub	a5,a5,s0
80406700:	008686b3          	add	a3,a3,s0
80406704:	00870733          	add	a4,a4,s0
80406708:	00d4a023          	sw	a3,0(s1)
8040670c:	00e4a223          	sw	a4,4(s1)
80406710:	00f4a623          	sw	a5,12(s1)
80406714:	40890933          	sub	s2,s2,s0
80406718:	00098463          	beqz	s3,80406720 <iobuf_move+0x7c>
8040671c:	0089a023          	sw	s0,0(s3)
80406720:	00000513          	li	a0,0
80406724:	02091863          	bnez	s2,80406754 <iobuf_move+0xb0>
80406728:	01c12083          	lw	ra,28(sp)
8040672c:	01812403          	lw	s0,24(sp)
80406730:	01412483          	lw	s1,20(sp)
80406734:	01012903          	lw	s2,16(sp)
80406738:	00c12983          	lw	s3,12(sp)
8040673c:	02010113          	addi	sp,sp,32
80406740:	00008067          	ret
80406744:	00058793          	mv	a5,a1
80406748:	00050593          	mv	a1,a0
8040674c:	00078513          	mv	a0,a5
80406750:	f95ff06f          	j	804066e4 <iobuf_move+0x40>
80406754:	ffc00513          	li	a0,-4
80406758:	fd1ff06f          	j	80406728 <iobuf_move+0x84>
8040675c:	f0dff0ef          	jal	ra,80406668 <iobuf_skip.part.0>

80406760 <iobuf_skip>:
80406760:	00c52783          	lw	a5,12(a0)
80406764:	02b7e463          	bltu	a5,a1,8040678c <iobuf_skip+0x2c>
80406768:	00052683          	lw	a3,0(a0)
8040676c:	00452703          	lw	a4,4(a0)
80406770:	40b787b3          	sub	a5,a5,a1
80406774:	00b686b3          	add	a3,a3,a1
80406778:	00b705b3          	add	a1,a4,a1
8040677c:	00d52023          	sw	a3,0(a0)
80406780:	00b52223          	sw	a1,4(a0)
80406784:	00f52623          	sw	a5,12(a0)
80406788:	00008067          	ret
8040678c:	ff010113          	addi	sp,sp,-16
80406790:	00112623          	sw	ra,12(sp)
80406794:	ed5ff0ef          	jal	ra,80406668 <iobuf_skip.part.0>

80406798 <copy_path>:
80406798:	fe010113          	addi	sp,sp,-32
8040679c:	01212823          	sw	s2,16(sp)
804067a0:	00096917          	auipc	s2,0x96
804067a4:	00c90913          	addi	s2,s2,12 # 8049c7ac <current>
804067a8:	00092783          	lw	a5,0(s2)
804067ac:	01412423          	sw	s4,8(sp)
804067b0:	00050a13          	mv	s4,a0
804067b4:	00001537          	lui	a0,0x1
804067b8:	00912a23          	sw	s1,20(sp)
804067bc:	01312623          	sw	s3,12(sp)
804067c0:	00112e23          	sw	ra,28(sp)
804067c4:	00812c23          	sw	s0,24(sp)
804067c8:	01512223          	sw	s5,4(sp)
804067cc:	00058993          	mv	s3,a1
804067d0:	0187a483          	lw	s1,24(a5)
804067d4:	ab8fc0ef          	jal	ra,80402a8c <kmalloc>
804067d8:	0c050463          	beqz	a0,804068a0 <copy_path+0x108>
804067dc:	00050413          	mv	s0,a0
804067e0:	06048863          	beqz	s1,80406850 <copy_path+0xb8>
804067e4:	01c48a93          	addi	s5,s1,28
804067e8:	000a8513          	mv	a0,s5
804067ec:	a51fe0ef          	jal	ra,8040523c <down>
804067f0:	00092783          	lw	a5,0(s2)
804067f4:	08078263          	beqz	a5,80406878 <copy_path+0xe0>
804067f8:	0047a783          	lw	a5,4(a5)
804067fc:	000016b7          	lui	a3,0x1
80406800:	00098613          	mv	a2,s3
80406804:	02f4a423          	sw	a5,40(s1)
80406808:	00040593          	mv	a1,s0
8040680c:	00048513          	mv	a0,s1
80406810:	f3cfe0ef          	jal	ra,80404f4c <copy_string>
80406814:	06050e63          	beqz	a0,80406890 <copy_path+0xf8>
80406818:	000a8513          	mv	a0,s5
8040681c:	a1dfe0ef          	jal	ra,80405238 <up>
80406820:	0204a423          	sw	zero,40(s1)
80406824:	008a2023          	sw	s0,0(s4)
80406828:	00000513          	li	a0,0
8040682c:	01c12083          	lw	ra,28(sp)
80406830:	01812403          	lw	s0,24(sp)
80406834:	01412483          	lw	s1,20(sp)
80406838:	01012903          	lw	s2,16(sp)
8040683c:	00c12983          	lw	s3,12(sp)
80406840:	00812a03          	lw	s4,8(sp)
80406844:	00412a83          	lw	s5,4(sp)
80406848:	02010113          	addi	sp,sp,32
8040684c:	00008067          	ret
80406850:	00050593          	mv	a1,a0
80406854:	000016b7          	lui	a3,0x1
80406858:	00098613          	mv	a2,s3
8040685c:	00000513          	li	a0,0
80406860:	eecfe0ef          	jal	ra,80404f4c <copy_string>
80406864:	fc0510e3          	bnez	a0,80406824 <copy_path+0x8c>
80406868:	00040513          	mv	a0,s0
8040686c:	b44fc0ef          	jal	ra,80402bb0 <kfree>
80406870:	ffd00513          	li	a0,-3
80406874:	fb9ff06f          	j	8040682c <copy_path+0x94>
80406878:	000016b7          	lui	a3,0x1
8040687c:	00098613          	mv	a2,s3
80406880:	00040593          	mv	a1,s0
80406884:	00048513          	mv	a0,s1
80406888:	ec4fe0ef          	jal	ra,80404f4c <copy_string>
8040688c:	f80516e3          	bnez	a0,80406818 <copy_path+0x80>
80406890:	000a8513          	mv	a0,s5
80406894:	9a5fe0ef          	jal	ra,80405238 <up>
80406898:	0204a423          	sw	zero,40(s1)
8040689c:	fcdff06f          	j	80406868 <copy_path+0xd0>
804068a0:	ffc00513          	li	a0,-4
804068a4:	f89ff06f          	j	8040682c <copy_path+0x94>

804068a8 <sysfile_open>:
804068a8:	fe010113          	addi	sp,sp,-32
804068ac:	00912a23          	sw	s1,20(sp)
804068b0:	00058493          	mv	s1,a1
804068b4:	00050593          	mv	a1,a0
804068b8:	00c10513          	addi	a0,sp,12
804068bc:	00812c23          	sw	s0,24(sp)
804068c0:	00112e23          	sw	ra,28(sp)
804068c4:	ed5ff0ef          	jal	ra,80406798 <copy_path>
804068c8:	00050413          	mv	s0,a0
804068cc:	00051e63          	bnez	a0,804068e8 <sysfile_open+0x40>
804068d0:	00c12503          	lw	a0,12(sp)
804068d4:	00048593          	mv	a1,s1
804068d8:	810ff0ef          	jal	ra,804058e8 <file_open>
804068dc:	00050413          	mv	s0,a0
804068e0:	00c12503          	lw	a0,12(sp)
804068e4:	accfc0ef          	jal	ra,80402bb0 <kfree>
804068e8:	00040513          	mv	a0,s0
804068ec:	01c12083          	lw	ra,28(sp)
804068f0:	01812403          	lw	s0,24(sp)
804068f4:	01412483          	lw	s1,20(sp)
804068f8:	02010113          	addi	sp,sp,32
804068fc:	00008067          	ret

80406900 <sysfile_close>:
80406900:	96cff06f          	j	80405a6c <file_close>

80406904 <sysfile_read>:
80406904:	fc010113          	addi	sp,sp,-64
80406908:	02912a23          	sw	s1,52(sp)
8040690c:	02112e23          	sw	ra,60(sp)
80406910:	02812c23          	sw	s0,56(sp)
80406914:	03212823          	sw	s2,48(sp)
80406918:	03312623          	sw	s3,44(sp)
8040691c:	03412423          	sw	s4,40(sp)
80406920:	03512223          	sw	s5,36(sp)
80406924:	03612023          	sw	s6,32(sp)
80406928:	01712e23          	sw	s7,28(sp)
8040692c:	01812c23          	sw	s8,24(sp)
80406930:	01912a23          	sw	s9,20(sp)
80406934:	00000493          	li	s1,0
80406938:	02061e63          	bnez	a2,80406974 <sysfile_read+0x70>
8040693c:	03c12083          	lw	ra,60(sp)
80406940:	03812403          	lw	s0,56(sp)
80406944:	00048513          	mv	a0,s1
80406948:	03012903          	lw	s2,48(sp)
8040694c:	03412483          	lw	s1,52(sp)
80406950:	02c12983          	lw	s3,44(sp)
80406954:	02812a03          	lw	s4,40(sp)
80406958:	02412a83          	lw	s5,36(sp)
8040695c:	02012b03          	lw	s6,32(sp)
80406960:	01c12b83          	lw	s7,28(sp)
80406964:	01812c03          	lw	s8,24(sp)
80406968:	01412c83          	lw	s9,20(sp)
8040696c:	04010113          	addi	sp,sp,64
80406970:	00008067          	ret
80406974:	00096c97          	auipc	s9,0x96
80406978:	e38c8c93          	addi	s9,s9,-456 # 8049c7ac <current>
8040697c:	000ca783          	lw	a5,0(s9)
80406980:	00060413          	mv	s0,a2
80406984:	00058b13          	mv	s6,a1
80406988:	00000613          	li	a2,0
8040698c:	00100593          	li	a1,1
80406990:	00050a93          	mv	s5,a0
80406994:	0187a903          	lw	s2,24(a5)
80406998:	ed1fe0ef          	jal	ra,80405868 <file_testfd>
8040699c:	10050063          	beqz	a0,80406a9c <sysfile_read+0x198>
804069a0:	00001537          	lui	a0,0x1
804069a4:	8e8fc0ef          	jal	ra,80402a8c <kmalloc>
804069a8:	00050993          	mv	s3,a0
804069ac:	0e050c63          	beqz	a0,80406aa4 <sysfile_read+0x1a0>
804069b0:	00000b93          	li	s7,0
804069b4:	00001a37          	lui	s4,0x1
804069b8:	01c90c13          	addi	s8,s2,28
804069bc:	0d446663          	bltu	s0,s4,80406a88 <sysfile_read+0x184>
804069c0:	01412623          	sw	s4,12(sp)
804069c4:	00001637          	lui	a2,0x1
804069c8:	00c10693          	addi	a3,sp,12
804069cc:	00098593          	mv	a1,s3
804069d0:	000a8513          	mv	a0,s5
804069d4:	920ff0ef          	jal	ra,80405af4 <file_read>
804069d8:	00c12683          	lw	a3,12(sp)
804069dc:	00050493          	mv	s1,a0
804069e0:	08068863          	beqz	a3,80406a70 <sysfile_read+0x16c>
804069e4:	02090063          	beqz	s2,80406a04 <sysfile_read+0x100>
804069e8:	000c0513          	mv	a0,s8
804069ec:	851fe0ef          	jal	ra,8040523c <down>
804069f0:	000ca783          	lw	a5,0(s9)
804069f4:	0a078063          	beqz	a5,80406a94 <sysfile_read+0x190>
804069f8:	0047a783          	lw	a5,4(a5)
804069fc:	00c12683          	lw	a3,12(sp)
80406a00:	02f92423          	sw	a5,40(s2)
80406a04:	00098613          	mv	a2,s3
80406a08:	000b0593          	mv	a1,s6
80406a0c:	00090513          	mv	a0,s2
80406a10:	ce0fe0ef          	jal	ra,80404ef0 <copy_to_user>
80406a14:	04050063          	beqz	a0,80406a54 <sysfile_read+0x150>
80406a18:	00c12783          	lw	a5,12(sp)
80406a1c:	08f46863          	bltu	s0,a5,80406aac <sysfile_read+0x1a8>
80406a20:	00fb0b33          	add	s6,s6,a5
80406a24:	40f40433          	sub	s0,s0,a5
80406a28:	00fb8bb3          	add	s7,s7,a5
80406a2c:	02091a63          	bnez	s2,80406a60 <sysfile_read+0x15c>
80406a30:	00049863          	bnez	s1,80406a40 <sysfile_read+0x13c>
80406a34:	00c12783          	lw	a5,12(sp)
80406a38:	02078e63          	beqz	a5,80406a74 <sysfile_read+0x170>
80406a3c:	f80410e3          	bnez	s0,804069bc <sysfile_read+0xb8>
80406a40:	00098513          	mv	a0,s3
80406a44:	96cfc0ef          	jal	ra,80402bb0 <kfree>
80406a48:	ee0b8ae3          	beqz	s7,8040693c <sysfile_read+0x38>
80406a4c:	000b8493          	mv	s1,s7
80406a50:	eedff06f          	j	8040693c <sysfile_read+0x38>
80406a54:	00049463          	bnez	s1,80406a5c <sysfile_read+0x158>
80406a58:	ffd00493          	li	s1,-3
80406a5c:	fe0902e3          	beqz	s2,80406a40 <sysfile_read+0x13c>
80406a60:	000c0513          	mv	a0,s8
80406a64:	fd4fe0ef          	jal	ra,80405238 <up>
80406a68:	02092423          	sw	zero,40(s2)
80406a6c:	fc5ff06f          	j	80406a30 <sysfile_read+0x12c>
80406a70:	fc0518e3          	bnez	a0,80406a40 <sysfile_read+0x13c>
80406a74:	00098513          	mv	a0,s3
80406a78:	00000493          	li	s1,0
80406a7c:	934fc0ef          	jal	ra,80402bb0 <kfree>
80406a80:	ea0b8ee3          	beqz	s7,8040693c <sysfile_read+0x38>
80406a84:	fc9ff06f          	j	80406a4c <sysfile_read+0x148>
80406a88:	00812623          	sw	s0,12(sp)
80406a8c:	00040613          	mv	a2,s0
80406a90:	f39ff06f          	j	804069c8 <sysfile_read+0xc4>
80406a94:	00c12683          	lw	a3,12(sp)
80406a98:	f6dff06f          	j	80406a04 <sysfile_read+0x100>
80406a9c:	ffd00493          	li	s1,-3
80406aa0:	e9dff06f          	j	8040693c <sysfile_read+0x38>
80406aa4:	ffc00493          	li	s1,-4
80406aa8:	e95ff06f          	j	8040693c <sysfile_read+0x38>
80406aac:	0000e697          	auipc	a3,0xe
80406ab0:	ee468693          	addi	a3,a3,-284 # 80414990 <CSWTCH.69+0x428>
80406ab4:	0000c617          	auipc	a2,0xc
80406ab8:	67860613          	addi	a2,a2,1656 # 8041312c <commands+0x1f8>
80406abc:	05500593          	li	a1,85
80406ac0:	0000e517          	auipc	a0,0xe
80406ac4:	edc50513          	addi	a0,a0,-292 # 8041499c <CSWTCH.69+0x434>
80406ac8:	b5df90ef          	jal	ra,80400624 <__panic>

80406acc <sysfile_write>:
80406acc:	fc010113          	addi	sp,sp,-64
80406ad0:	03512223          	sw	s5,36(sp)
80406ad4:	02112e23          	sw	ra,60(sp)
80406ad8:	02812c23          	sw	s0,56(sp)
80406adc:	02912a23          	sw	s1,52(sp)
80406ae0:	03212823          	sw	s2,48(sp)
80406ae4:	03312623          	sw	s3,44(sp)
80406ae8:	03412423          	sw	s4,40(sp)
80406aec:	03612023          	sw	s6,32(sp)
80406af0:	01712e23          	sw	s7,28(sp)
80406af4:	01812c23          	sw	s8,24(sp)
80406af8:	01912a23          	sw	s9,20(sp)
80406afc:	00000a93          	li	s5,0
80406b00:	02061e63          	bnez	a2,80406b3c <sysfile_write+0x70>
80406b04:	03c12083          	lw	ra,60(sp)
80406b08:	03812403          	lw	s0,56(sp)
80406b0c:	000a8513          	mv	a0,s5
80406b10:	03412483          	lw	s1,52(sp)
80406b14:	03012903          	lw	s2,48(sp)
80406b18:	02c12983          	lw	s3,44(sp)
80406b1c:	02812a03          	lw	s4,40(sp)
80406b20:	02412a83          	lw	s5,36(sp)
80406b24:	02012b03          	lw	s6,32(sp)
80406b28:	01c12b83          	lw	s7,28(sp)
80406b2c:	01812c03          	lw	s8,24(sp)
80406b30:	01412c83          	lw	s9,20(sp)
80406b34:	04010113          	addi	sp,sp,64
80406b38:	00008067          	ret
80406b3c:	00096b97          	auipc	s7,0x96
80406b40:	c70b8b93          	addi	s7,s7,-912 # 8049c7ac <current>
80406b44:	000ba783          	lw	a5,0(s7)
80406b48:	00060413          	mv	s0,a2
80406b4c:	00058a13          	mv	s4,a1
80406b50:	00100613          	li	a2,1
80406b54:	00000593          	li	a1,0
80406b58:	00050c93          	mv	s9,a0
80406b5c:	0187a483          	lw	s1,24(a5)
80406b60:	d09fe0ef          	jal	ra,80405868 <file_testfd>
80406b64:	0e050e63          	beqz	a0,80406c60 <sysfile_write+0x194>
80406b68:	00001537          	lui	a0,0x1
80406b6c:	f21fb0ef          	jal	ra,80402a8c <kmalloc>
80406b70:	00050993          	mv	s3,a0
80406b74:	0e050a63          	beqz	a0,80406c68 <sysfile_write+0x19c>
80406b78:	00000c13          	li	s8,0
80406b7c:	00001937          	lui	s2,0x1
80406b80:	01c48b13          	addi	s6,s1,28
80406b84:	09246063          	bltu	s0,s2,80406c04 <sysfile_write+0x138>
80406b88:	01212623          	sw	s2,12(sp)
80406b8c:	08048063          	beqz	s1,80406c0c <sysfile_write+0x140>
80406b90:	000b0513          	mv	a0,s6
80406b94:	ea8fe0ef          	jal	ra,8040523c <down>
80406b98:	000ba783          	lw	a5,0(s7)
80406b9c:	00078663          	beqz	a5,80406ba8 <sysfile_write+0xdc>
80406ba0:	0047a783          	lw	a5,4(a5)
80406ba4:	02f4a423          	sw	a5,40(s1)
80406ba8:	00c12683          	lw	a3,12(sp)
80406bac:	00000713          	li	a4,0
80406bb0:	000a0613          	mv	a2,s4
80406bb4:	00098593          	mv	a1,s3
80406bb8:	00048513          	mv	a0,s1
80406bbc:	ad4fe0ef          	jal	ra,80404e90 <copy_from_user>
80406bc0:	06050863          	beqz	a0,80406c30 <sysfile_write+0x164>
80406bc4:	000b0513          	mv	a0,s6
80406bc8:	e70fe0ef          	jal	ra,80405238 <up>
80406bcc:	0204a423          	sw	zero,40(s1)
80406bd0:	00c12603          	lw	a2,12(sp)
80406bd4:	00c10693          	addi	a3,sp,12
80406bd8:	00098593          	mv	a1,s3
80406bdc:	000c8513          	mv	a0,s9
80406be0:	868ff0ef          	jal	ra,80405c48 <file_write>
80406be4:	00c12783          	lw	a5,12(sp)
80406be8:	00050a93          	mv	s5,a0
80406bec:	04079c63          	bnez	a5,80406c44 <sysfile_write+0x178>
80406bf0:	00098513          	mv	a0,s3
80406bf4:	fbdfb0ef          	jal	ra,80402bb0 <kfree>
80406bf8:	f00c06e3          	beqz	s8,80406b04 <sysfile_write+0x38>
80406bfc:	000c0a93          	mv	s5,s8
80406c00:	f05ff06f          	j	80406b04 <sysfile_write+0x38>
80406c04:	00812623          	sw	s0,12(sp)
80406c08:	f80494e3          	bnez	s1,80406b90 <sysfile_write+0xc4>
80406c0c:	00c12683          	lw	a3,12(sp)
80406c10:	00000713          	li	a4,0
80406c14:	000a0613          	mv	a2,s4
80406c18:	00098593          	mv	a1,s3
80406c1c:	00000513          	li	a0,0
80406c20:	a70fe0ef          	jal	ra,80404e90 <copy_from_user>
80406c24:	fa0516e3          	bnez	a0,80406bd0 <sysfile_write+0x104>
80406c28:	ffd00a93          	li	s5,-3
80406c2c:	fc5ff06f          	j	80406bf0 <sysfile_write+0x124>
80406c30:	000b0513          	mv	a0,s6
80406c34:	e04fe0ef          	jal	ra,80405238 <up>
80406c38:	ffd00a93          	li	s5,-3
80406c3c:	0204a423          	sw	zero,40(s1)
80406c40:	fb1ff06f          	j	80406bf0 <sysfile_write+0x124>
80406c44:	02f46663          	bltu	s0,a5,80406c70 <sysfile_write+0x1a4>
80406c48:	00fa0a33          	add	s4,s4,a5
80406c4c:	40f40433          	sub	s0,s0,a5
80406c50:	00fc0c33          	add	s8,s8,a5
80406c54:	f8051ee3          	bnez	a0,80406bf0 <sysfile_write+0x124>
80406c58:	f20416e3          	bnez	s0,80406b84 <sysfile_write+0xb8>
80406c5c:	f95ff06f          	j	80406bf0 <sysfile_write+0x124>
80406c60:	ffd00a93          	li	s5,-3
80406c64:	ea1ff06f          	j	80406b04 <sysfile_write+0x38>
80406c68:	ffc00a93          	li	s5,-4
80406c6c:	e99ff06f          	j	80406b04 <sysfile_write+0x38>
80406c70:	0000e697          	auipc	a3,0xe
80406c74:	d2068693          	addi	a3,a3,-736 # 80414990 <CSWTCH.69+0x428>
80406c78:	0000c617          	auipc	a2,0xc
80406c7c:	4b460613          	addi	a2,a2,1204 # 8041312c <commands+0x1f8>
80406c80:	08a00593          	li	a1,138
80406c84:	0000e517          	auipc	a0,0xe
80406c88:	d1850513          	addi	a0,a0,-744 # 8041499c <CSWTCH.69+0x434>
80406c8c:	999f90ef          	jal	ra,80400624 <__panic>

80406c90 <sysfile_seek>:
80406c90:	90cff06f          	j	80405d9c <file_seek>

80406c94 <sysfile_fstat>:
80406c94:	fd010113          	addi	sp,sp,-48
80406c98:	03212023          	sw	s2,32(sp)
80406c9c:	00096917          	auipc	s2,0x96
80406ca0:	b1090913          	addi	s2,s2,-1264 # 8049c7ac <current>
80406ca4:	00092783          	lw	a5,0(s2)
80406ca8:	01312e23          	sw	s3,28(sp)
80406cac:	00058993          	mv	s3,a1
80406cb0:	00010593          	mv	a1,sp
80406cb4:	02812423          	sw	s0,40(sp)
80406cb8:	02912223          	sw	s1,36(sp)
80406cbc:	02112623          	sw	ra,44(sp)
80406cc0:	01412c23          	sw	s4,24(sp)
80406cc4:	0187a483          	lw	s1,24(a5)
80406cc8:	a84ff0ef          	jal	ra,80405f4c <file_fstat>
80406ccc:	00050413          	mv	s0,a0
80406cd0:	04051463          	bnez	a0,80406d18 <sysfile_fstat+0x84>
80406cd4:	06048463          	beqz	s1,80406d3c <sysfile_fstat+0xa8>
80406cd8:	01c48a13          	addi	s4,s1,28
80406cdc:	000a0513          	mv	a0,s4
80406ce0:	d5cfe0ef          	jal	ra,8040523c <down>
80406ce4:	00092783          	lw	a5,0(s2)
80406ce8:	06078863          	beqz	a5,80406d58 <sysfile_fstat+0xc4>
80406cec:	0047a783          	lw	a5,4(a5)
80406cf0:	01000693          	li	a3,16
80406cf4:	00010613          	mv	a2,sp
80406cf8:	02f4a423          	sw	a5,40(s1)
80406cfc:	00098593          	mv	a1,s3
80406d00:	00048513          	mv	a0,s1
80406d04:	9ecfe0ef          	jal	ra,80404ef0 <copy_to_user>
80406d08:	06050463          	beqz	a0,80406d70 <sysfile_fstat+0xdc>
80406d0c:	000a0513          	mv	a0,s4
80406d10:	d28fe0ef          	jal	ra,80405238 <up>
80406d14:	0204a423          	sw	zero,40(s1)
80406d18:	00040513          	mv	a0,s0
80406d1c:	02c12083          	lw	ra,44(sp)
80406d20:	02812403          	lw	s0,40(sp)
80406d24:	02412483          	lw	s1,36(sp)
80406d28:	02012903          	lw	s2,32(sp)
80406d2c:	01c12983          	lw	s3,28(sp)
80406d30:	01812a03          	lw	s4,24(sp)
80406d34:	03010113          	addi	sp,sp,48
80406d38:	00008067          	ret
80406d3c:	01000693          	li	a3,16
80406d40:	00010613          	mv	a2,sp
80406d44:	00098593          	mv	a1,s3
80406d48:	9a8fe0ef          	jal	ra,80404ef0 <copy_to_user>
80406d4c:	fc0516e3          	bnez	a0,80406d18 <sysfile_fstat+0x84>
80406d50:	ffd00413          	li	s0,-3
80406d54:	fc5ff06f          	j	80406d18 <sysfile_fstat+0x84>
80406d58:	01000693          	li	a3,16
80406d5c:	00010613          	mv	a2,sp
80406d60:	00098593          	mv	a1,s3
80406d64:	00048513          	mv	a0,s1
80406d68:	988fe0ef          	jal	ra,80404ef0 <copy_to_user>
80406d6c:	fa0510e3          	bnez	a0,80406d0c <sysfile_fstat+0x78>
80406d70:	000a0513          	mv	a0,s4
80406d74:	cc4fe0ef          	jal	ra,80405238 <up>
80406d78:	ffd00413          	li	s0,-3
80406d7c:	0204a423          	sw	zero,40(s1)
80406d80:	f99ff06f          	j	80406d18 <sysfile_fstat+0x84>

80406d84 <sysfile_fsync>:
80406d84:	ae0ff06f          	j	80406064 <file_fsync>

80406d88 <sysfile_getcwd>:
80406d88:	fd010113          	addi	sp,sp,-48
80406d8c:	01312e23          	sw	s3,28(sp)
80406d90:	00096997          	auipc	s3,0x96
80406d94:	a1c98993          	addi	s3,s3,-1508 # 8049c7ac <current>
80406d98:	0009a783          	lw	a5,0(s3)
80406d9c:	03212023          	sw	s2,32(sp)
80406da0:	02112623          	sw	ra,44(sp)
80406da4:	02812423          	sw	s0,40(sp)
80406da8:	02912223          	sw	s1,36(sp)
80406dac:	01412c23          	sw	s4,24(sp)
80406db0:	0187a903          	lw	s2,24(a5)
80406db4:	08058863          	beqz	a1,80406e44 <sysfile_getcwd+0xbc>
80406db8:	00050493          	mv	s1,a0
80406dbc:	00058413          	mv	s0,a1
80406dc0:	06090663          	beqz	s2,80406e2c <sysfile_getcwd+0xa4>
80406dc4:	01c90a13          	addi	s4,s2,28
80406dc8:	000a0513          	mv	a0,s4
80406dcc:	c70fe0ef          	jal	ra,8040523c <down>
80406dd0:	0009a783          	lw	a5,0(s3)
80406dd4:	00078663          	beqz	a5,80406de0 <sysfile_getcwd+0x58>
80406dd8:	0047a783          	lw	a5,4(a5)
80406ddc:	02f92423          	sw	a5,40(s2)
80406de0:	00100693          	li	a3,1
80406de4:	00040613          	mv	a2,s0
80406de8:	00048593          	mv	a1,s1
80406dec:	00090513          	mv	a0,s2
80406df0:	fc9fd0ef          	jal	ra,80404db8 <user_mem_check>
80406df4:	04051c63          	bnez	a0,80406e4c <sysfile_getcwd+0xc4>
80406df8:	ffd00413          	li	s0,-3
80406dfc:	000a0513          	mv	a0,s4
80406e00:	c38fe0ef          	jal	ra,80405238 <up>
80406e04:	02092423          	sw	zero,40(s2)
80406e08:	00040513          	mv	a0,s0
80406e0c:	02c12083          	lw	ra,44(sp)
80406e10:	02812403          	lw	s0,40(sp)
80406e14:	02412483          	lw	s1,36(sp)
80406e18:	02012903          	lw	s2,32(sp)
80406e1c:	01c12983          	lw	s3,28(sp)
80406e20:	01812a03          	lw	s4,24(sp)
80406e24:	03010113          	addi	sp,sp,48
80406e28:	00008067          	ret
80406e2c:	00058613          	mv	a2,a1
80406e30:	00100693          	li	a3,1
80406e34:	00050593          	mv	a1,a0
80406e38:	00000513          	li	a0,0
80406e3c:	f7dfd0ef          	jal	ra,80404db8 <user_mem_check>
80406e40:	02051663          	bnez	a0,80406e6c <sysfile_getcwd+0xe4>
80406e44:	ffd00413          	li	s0,-3
80406e48:	fc1ff06f          	j	80406e08 <sysfile_getcwd+0x80>
80406e4c:	00040613          	mv	a2,s0
80406e50:	00000693          	li	a3,0
80406e54:	00048593          	mv	a1,s1
80406e58:	00010513          	mv	a0,sp
80406e5c:	835ff0ef          	jal	ra,80406690 <iobuf_init>
80406e60:	30d070ef          	jal	ra,8040e96c <vfs_getcwd>
80406e64:	00050413          	mv	s0,a0
80406e68:	f95ff06f          	j	80406dfc <sysfile_getcwd+0x74>
80406e6c:	00040613          	mv	a2,s0
80406e70:	00000693          	li	a3,0
80406e74:	00048593          	mv	a1,s1
80406e78:	00010513          	mv	a0,sp
80406e7c:	815ff0ef          	jal	ra,80406690 <iobuf_init>
80406e80:	2ed070ef          	jal	ra,8040e96c <vfs_getcwd>
80406e84:	00050413          	mv	s0,a0
80406e88:	f81ff06f          	j	80406e08 <sysfile_getcwd+0x80>

80406e8c <sysfile_getdirentry>:
80406e8c:	fe010113          	addi	sp,sp,-32
80406e90:	01212823          	sw	s2,16(sp)
80406e94:	00096917          	auipc	s2,0x96
80406e98:	91890913          	addi	s2,s2,-1768 # 8049c7ac <current>
80406e9c:	00092783          	lw	a5,0(s2)
80406ea0:	01312623          	sw	s3,12(sp)
80406ea4:	00050993          	mv	s3,a0
80406ea8:	10400513          	li	a0,260
80406eac:	00912a23          	sw	s1,20(sp)
80406eb0:	01412423          	sw	s4,8(sp)
80406eb4:	00112e23          	sw	ra,28(sp)
80406eb8:	00812c23          	sw	s0,24(sp)
80406ebc:	01512223          	sw	s5,4(sp)
80406ec0:	00058a13          	mv	s4,a1
80406ec4:	0187a483          	lw	s1,24(a5)
80406ec8:	bc5fb0ef          	jal	ra,80402a8c <kmalloc>
80406ecc:	12050a63          	beqz	a0,80407000 <sysfile_getdirentry+0x174>
80406ed0:	00050413          	mv	s0,a0
80406ed4:	0e048063          	beqz	s1,80406fb4 <sysfile_getdirentry+0x128>
80406ed8:	01c48a93          	addi	s5,s1,28
80406edc:	000a8513          	mv	a0,s5
80406ee0:	b5cfe0ef          	jal	ra,8040523c <down>
80406ee4:	00092783          	lw	a5,0(s2)
80406ee8:	00078663          	beqz	a5,80406ef4 <sysfile_getdirentry+0x68>
80406eec:	0047a783          	lw	a5,4(a5)
80406ef0:	02f4a423          	sw	a5,40(s1)
80406ef4:	00100713          	li	a4,1
80406ef8:	00400693          	li	a3,4
80406efc:	000a0613          	mv	a2,s4
80406f00:	00040593          	mv	a1,s0
80406f04:	00048513          	mv	a0,s1
80406f08:	f89fd0ef          	jal	ra,80404e90 <copy_from_user>
80406f0c:	04051263          	bnez	a0,80406f50 <sysfile_getdirentry+0xc4>
80406f10:	000a8513          	mv	a0,s5
80406f14:	b24fe0ef          	jal	ra,80405238 <up>
80406f18:	ffd00993          	li	s3,-3
80406f1c:	0204a423          	sw	zero,40(s1)
80406f20:	00040513          	mv	a0,s0
80406f24:	c8dfb0ef          	jal	ra,80402bb0 <kfree>
80406f28:	01c12083          	lw	ra,28(sp)
80406f2c:	01812403          	lw	s0,24(sp)
80406f30:	00098513          	mv	a0,s3
80406f34:	01412483          	lw	s1,20(sp)
80406f38:	01012903          	lw	s2,16(sp)
80406f3c:	00c12983          	lw	s3,12(sp)
80406f40:	00812a03          	lw	s4,8(sp)
80406f44:	00412a83          	lw	s5,4(sp)
80406f48:	02010113          	addi	sp,sp,32
80406f4c:	00008067          	ret
80406f50:	000a8513          	mv	a0,s5
80406f54:	ae4fe0ef          	jal	ra,80405238 <up>
80406f58:	00098513          	mv	a0,s3
80406f5c:	00040593          	mv	a1,s0
80406f60:	0204a423          	sw	zero,40(s1)
80406f64:	a04ff0ef          	jal	ra,80406168 <file_getdirentry>
80406f68:	00050993          	mv	s3,a0
80406f6c:	fa051ae3          	bnez	a0,80406f20 <sysfile_getdirentry+0x94>
80406f70:	000a8513          	mv	a0,s5
80406f74:	ac8fe0ef          	jal	ra,8040523c <down>
80406f78:	00092783          	lw	a5,0(s2)
80406f7c:	00078663          	beqz	a5,80406f88 <sysfile_getdirentry+0xfc>
80406f80:	0047a783          	lw	a5,4(a5)
80406f84:	02f4a423          	sw	a5,40(s1)
80406f88:	10400693          	li	a3,260
80406f8c:	00040613          	mv	a2,s0
80406f90:	000a0593          	mv	a1,s4
80406f94:	00048513          	mv	a0,s1
80406f98:	f59fd0ef          	jal	ra,80404ef0 <copy_to_user>
80406f9c:	00051463          	bnez	a0,80406fa4 <sysfile_getdirentry+0x118>
80406fa0:	ffd00993          	li	s3,-3
80406fa4:	000a8513          	mv	a0,s5
80406fa8:	a90fe0ef          	jal	ra,80405238 <up>
80406fac:	0204a423          	sw	zero,40(s1)
80406fb0:	f71ff06f          	j	80406f20 <sysfile_getdirentry+0x94>
80406fb4:	00050593          	mv	a1,a0
80406fb8:	00100713          	li	a4,1
80406fbc:	00400693          	li	a3,4
80406fc0:	000a0613          	mv	a2,s4
80406fc4:	00000513          	li	a0,0
80406fc8:	ec9fd0ef          	jal	ra,80404e90 <copy_from_user>
80406fcc:	02050663          	beqz	a0,80406ff8 <sysfile_getdirentry+0x16c>
80406fd0:	00098513          	mv	a0,s3
80406fd4:	00040593          	mv	a1,s0
80406fd8:	990ff0ef          	jal	ra,80406168 <file_getdirentry>
80406fdc:	00050993          	mv	s3,a0
80406fe0:	f40510e3          	bnez	a0,80406f20 <sysfile_getdirentry+0x94>
80406fe4:	10400693          	li	a3,260
80406fe8:	00040613          	mv	a2,s0
80406fec:	000a0593          	mv	a1,s4
80406ff0:	f01fd0ef          	jal	ra,80404ef0 <copy_to_user>
80406ff4:	f20516e3          	bnez	a0,80406f20 <sysfile_getdirentry+0x94>
80406ff8:	ffd00993          	li	s3,-3
80406ffc:	f25ff06f          	j	80406f20 <sysfile_getdirentry+0x94>
80407000:	ffc00993          	li	s3,-4
80407004:	f25ff06f          	j	80406f28 <sysfile_getdirentry+0x9c>

80407008 <sysfile_dup>:
80407008:	abcff06f          	j	804062c4 <file_dup>

8040700c <kernel_thread_entry>:
8040700c:	00048513          	mv	a0,s1
80407010:	000400e7          	jalr	s0
80407014:	2c9000ef          	jal	ra,80407adc <do_exit>

80407018 <alloc_proc>:
80407018:	ff010113          	addi	sp,sp,-16
8040701c:	0e000513          	li	a0,224
80407020:	00812423          	sw	s0,8(sp)
80407024:	00112623          	sw	ra,12(sp)
80407028:	a65fb0ef          	jal	ra,80402a8c <kmalloc>
8040702c:	00050413          	mv	s0,a0
80407030:	08050c63          	beqz	a0,804070c8 <alloc_proc+0xb0>
80407034:	fff00793          	li	a5,-1
80407038:	00f52223          	sw	a5,4(a0)
8040703c:	03800613          	li	a2,56
80407040:	00000593          	li	a1,0
80407044:	00052023          	sw	zero,0(a0)
80407048:	00052423          	sw	zero,8(a0)
8040704c:	00052623          	sw	zero,12(a0)
80407050:	00052823          	sw	zero,16(a0)
80407054:	00052a23          	sw	zero,20(a0)
80407058:	00052c23          	sw	zero,24(a0)
8040705c:	01c50513          	addi	a0,a0,28
80407060:	4610b0ef          	jal	ra,80412cc0 <memset>
80407064:	00095797          	auipc	a5,0x95
80407068:	7a078793          	addi	a5,a5,1952 # 8049c804 <boot_cr3>
8040706c:	0007a783          	lw	a5,0(a5)
80407070:	04042a23          	sw	zero,84(s0)
80407074:	04042e23          	sw	zero,92(s0)
80407078:	04f42c23          	sw	a5,88(s0)
8040707c:	03200613          	li	a2,50
80407080:	00000593          	li	a1,0
80407084:	06040513          	addi	a0,s0,96
80407088:	4390b0ef          	jal	ra,80412cc0 <memset>
8040708c:	0bc40793          	addi	a5,s0,188
80407090:	0a042423          	sw	zero,168(s0)
80407094:	0a042823          	sw	zero,176(s0)
80407098:	0a042a23          	sw	zero,180(s0)
8040709c:	0a042623          	sw	zero,172(s0)
804070a0:	0a042c23          	sw	zero,184(s0)
804070a4:	0cf42023          	sw	a5,192(s0)
804070a8:	0af42e23          	sw	a5,188(s0)
804070ac:	0c042223          	sw	zero,196(s0)
804070b0:	0c042423          	sw	zero,200(s0)
804070b4:	0c042823          	sw	zero,208(s0)
804070b8:	0c042623          	sw	zero,204(s0)
804070bc:	0c042a23          	sw	zero,212(s0)
804070c0:	0c042c23          	sw	zero,216(s0)
804070c4:	0c042e23          	sw	zero,220(s0)
804070c8:	00040513          	mv	a0,s0
804070cc:	00c12083          	lw	ra,12(sp)
804070d0:	00812403          	lw	s0,8(sp)
804070d4:	01010113          	addi	sp,sp,16
804070d8:	00008067          	ret

804070dc <put_files>:
804070dc:	0dc52503          	lw	a0,220(a0)
804070e0:	00050a63          	beqz	a0,804070f4 <put_files+0x18>
804070e4:	00852783          	lw	a5,8(a0)
804070e8:	fff78793          	addi	a5,a5,-1
804070ec:	00f52423          	sw	a5,8(a0)
804070f0:	00078463          	beqz	a5,804070f8 <put_files+0x1c>
804070f4:	00008067          	ret
804070f8:	b10ff06f          	j	80406408 <files_destroy>

804070fc <forkret>:
804070fc:	00095797          	auipc	a5,0x95
80407100:	6b078793          	addi	a5,a5,1712 # 8049c7ac <current>
80407104:	0007a783          	lw	a5,0(a5)
80407108:	0547a503          	lw	a0,84(a5)
8040710c:	fb8fa06f          	j	804018c4 <forkrets>

80407110 <load_icode_read>:
80407110:	fe010113          	addi	sp,sp,-32
80407114:	00912a23          	sw	s1,20(sp)
80407118:	01312623          	sw	s3,12(sp)
8040711c:	00060493          	mv	s1,a2
80407120:	00058993          	mv	s3,a1
80407124:	00000613          	li	a2,0
80407128:	00068593          	mv	a1,a3
8040712c:	00812c23          	sw	s0,24(sp)
80407130:	01212823          	sw	s2,16(sp)
80407134:	00112e23          	sw	ra,28(sp)
80407138:	00050913          	mv	s2,a0
8040713c:	b55ff0ef          	jal	ra,80406c90 <sysfile_seek>
80407140:	00050413          	mv	s0,a0
80407144:	02050263          	beqz	a0,80407168 <load_icode_read+0x58>
80407148:	00040513          	mv	a0,s0
8040714c:	01c12083          	lw	ra,28(sp)
80407150:	01812403          	lw	s0,24(sp)
80407154:	01412483          	lw	s1,20(sp)
80407158:	01012903          	lw	s2,16(sp)
8040715c:	00c12983          	lw	s3,12(sp)
80407160:	02010113          	addi	sp,sp,32
80407164:	00008067          	ret
80407168:	00048613          	mv	a2,s1
8040716c:	00098593          	mv	a1,s3
80407170:	00090513          	mv	a0,s2
80407174:	f90ff0ef          	jal	ra,80406904 <sysfile_read>
80407178:	fca488e3          	beq	s1,a0,80407148 <load_icode_read+0x38>
8040717c:	00050413          	mv	s0,a0
80407180:	fc0544e3          	bltz	a0,80407148 <load_icode_read+0x38>
80407184:	fff00413          	li	s0,-1
80407188:	00040513          	mv	a0,s0
8040718c:	01c12083          	lw	ra,28(sp)
80407190:	01812403          	lw	s0,24(sp)
80407194:	01412483          	lw	s1,20(sp)
80407198:	01012903          	lw	s2,16(sp)
8040719c:	00c12983          	lw	s3,12(sp)
804071a0:	02010113          	addi	sp,sp,32
804071a4:	00008067          	ret

804071a8 <user_main>:
804071a8:	00095797          	auipc	a5,0x95
804071ac:	60478793          	addi	a5,a5,1540 # 8049c7ac <current>
804071b0:	0007a783          	lw	a5,0(a5)
804071b4:	fe010113          	addi	sp,sp,-32
804071b8:	00812c23          	sw	s0,24(sp)
804071bc:	0047a583          	lw	a1,4(a5)
804071c0:	0000e417          	auipc	s0,0xe
804071c4:	df840413          	addi	s0,s0,-520 # 80414fb8 <CSWTCH.69+0xa50>
804071c8:	00040613          	mv	a2,s0
804071cc:	0000e517          	auipc	a0,0xe
804071d0:	df050513          	addi	a0,a0,-528 # 80414fbc <CSWTCH.69+0xa54>
804071d4:	00112e23          	sw	ra,28(sp)
804071d8:	00812423          	sw	s0,8(sp)
804071dc:	00012623          	sw	zero,12(sp)
804071e0:	81cf90ef          	jal	ra,804001fc <cprintf>
804071e4:	00812783          	lw	a5,8(sp)
804071e8:	06078663          	beqz	a5,80407254 <user_main+0xac>
804071ec:	00c10713          	addi	a4,sp,12
804071f0:	00000793          	li	a5,0
804071f4:	00470713          	addi	a4,a4,4
804071f8:	ffc72683          	lw	a3,-4(a4)
804071fc:	00178793          	addi	a5,a5,1
80407200:	fe069ae3          	bnez	a3,804071f4 <user_main+0x4c>
80407204:	10002773          	csrr	a4,sstatus
80407208:	10076713          	ori	a4,a4,256
8040720c:	10071073          	csrw	sstatus,a4
80407210:	1424d073          	csrwi	scause,9
80407214:	00810713          	addi	a4,sp,8
80407218:	00000517          	auipc	a0,0x0
8040721c:	01c50513          	addi	a0,a0,28 # 80407234 <user_main+0x8c>
80407220:	14151073          	csrw	sepc,a0
80407224:	00400513          	li	a0,4
80407228:	00040593          	mv	a1,s0
8040722c:	00078613          	mv	a2,a5
80407230:	00070693          	mv	a3,a4
80407234:	d2cfa06f          	j	80401760 <__alltraps>
80407238:	00050413          	mv	s0,a0
8040723c:	0000e617          	auipc	a2,0xe
80407240:	da860613          	addi	a2,a2,-600 # 80414fe4 <CSWTCH.69+0xa7c>
80407244:	42300593          	li	a1,1059
80407248:	0000e517          	auipc	a0,0xe
8040724c:	db850513          	addi	a0,a0,-584 # 80415000 <CSWTCH.69+0xa98>
80407250:	bd4f90ef          	jal	ra,80400624 <__panic>
80407254:	00000793          	li	a5,0
80407258:	fadff06f          	j	80407204 <user_main+0x5c>

8040725c <setup_pgdir.isra.4>:
8040725c:	fe010113          	addi	sp,sp,-32
80407260:	01212823          	sw	s2,16(sp)
80407264:	00050913          	mv	s2,a0
80407268:	00100513          	li	a0,1
8040726c:	00112e23          	sw	ra,28(sp)
80407270:	00812c23          	sw	s0,24(sp)
80407274:	00912a23          	sw	s1,20(sp)
80407278:	01312623          	sw	s3,12(sp)
8040727c:	01412423          	sw	s4,8(sp)
80407280:	b8dfb0ef          	jal	ra,80402e0c <alloc_pages>
80407284:	0c050263          	beqz	a0,80407348 <setup_pgdir.isra.4+0xec>
80407288:	00095a17          	auipc	s4,0x95
8040728c:	580a0a13          	addi	s4,s4,1408 # 8049c808 <pages>
80407290:	000a2683          	lw	a3,0(s4)
80407294:	0000f797          	auipc	a5,0xf
80407298:	79078793          	addi	a5,a5,1936 # 80416a24 <nbase>
8040729c:	0007a983          	lw	s3,0(a5)
804072a0:	40d506b3          	sub	a3,a0,a3
804072a4:	00095797          	auipc	a5,0x95
804072a8:	4f478793          	addi	a5,a5,1268 # 8049c798 <npage>
804072ac:	4056d693          	srai	a3,a3,0x5
804072b0:	013686b3          	add	a3,a3,s3
804072b4:	0007a703          	lw	a4,0(a5)
804072b8:	00c69793          	slli	a5,a3,0xc
804072bc:	00c7d793          	srli	a5,a5,0xc
804072c0:	00050413          	mv	s0,a0
804072c4:	00c69693          	slli	a3,a3,0xc
804072c8:	08e7f463          	bgeu	a5,a4,80407350 <setup_pgdir.isra.4+0xf4>
804072cc:	00095797          	auipc	a5,0x95
804072d0:	53478793          	addi	a5,a5,1332 # 8049c800 <va_pa_offset>
804072d4:	0007a483          	lw	s1,0(a5)
804072d8:	00095797          	auipc	a5,0x95
804072dc:	4bc78793          	addi	a5,a5,1212 # 8049c794 <boot_pgdir>
804072e0:	0007a583          	lw	a1,0(a5)
804072e4:	009684b3          	add	s1,a3,s1
804072e8:	00001637          	lui	a2,0x1
804072ec:	00048513          	mv	a0,s1
804072f0:	2410b0ef          	jal	ra,80412d30 <memcpy>
804072f4:	000a2703          	lw	a4,0(s4)
804072f8:	000017b7          	lui	a5,0x1
804072fc:	00f487b3          	add	a5,s1,a5
80407300:	40e40433          	sub	s0,s0,a4
80407304:	40545413          	srai	s0,s0,0x5
80407308:	01340433          	add	s0,s0,s3
8040730c:	00a41413          	slli	s0,s0,0xa
80407310:	00146713          	ori	a4,s0,1
80407314:	00746413          	ori	s0,s0,7
80407318:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x7054>
8040731c:	fa87a823          	sw	s0,-80(a5)
80407320:	00992023          	sw	s1,0(s2)
80407324:	00000513          	li	a0,0
80407328:	01c12083          	lw	ra,28(sp)
8040732c:	01812403          	lw	s0,24(sp)
80407330:	01412483          	lw	s1,20(sp)
80407334:	01012903          	lw	s2,16(sp)
80407338:	00c12983          	lw	s3,12(sp)
8040733c:	00812a03          	lw	s4,8(sp)
80407340:	02010113          	addi	sp,sp,32
80407344:	00008067          	ret
80407348:	ffc00513          	li	a0,-4
8040734c:	fddff06f          	j	80407328 <setup_pgdir.isra.4+0xcc>
80407350:	0000d617          	auipc	a2,0xd
80407354:	94860613          	addi	a2,a2,-1720 # 80413c98 <default_pmm_manager+0x30>
80407358:	06e00593          	li	a1,110
8040735c:	0000d517          	auipc	a0,0xd
80407360:	96050513          	addi	a0,a0,-1696 # 80413cbc <default_pmm_manager+0x54>
80407364:	ac0f90ef          	jal	ra,80400624 <__panic>

80407368 <set_proc_name>:
80407368:	ff010113          	addi	sp,sp,-16
8040736c:	00812423          	sw	s0,8(sp)
80407370:	06050413          	addi	s0,a0,96
80407374:	00912223          	sw	s1,4(sp)
80407378:	03300613          	li	a2,51
8040737c:	00058493          	mv	s1,a1
80407380:	00040513          	mv	a0,s0
80407384:	00000593          	li	a1,0
80407388:	00112623          	sw	ra,12(sp)
8040738c:	1350b0ef          	jal	ra,80412cc0 <memset>
80407390:	00040513          	mv	a0,s0
80407394:	00812403          	lw	s0,8(sp)
80407398:	00c12083          	lw	ra,12(sp)
8040739c:	00048593          	mv	a1,s1
804073a0:	00412483          	lw	s1,4(sp)
804073a4:	03200613          	li	a2,50
804073a8:	01010113          	addi	sp,sp,16
804073ac:	1850b06f          	j	80412d30 <memcpy>

804073b0 <proc_run>:
804073b0:	ff010113          	addi	sp,sp,-16
804073b4:	00095797          	auipc	a5,0x95
804073b8:	3f878793          	addi	a5,a5,1016 # 8049c7ac <current>
804073bc:	00912223          	sw	s1,4(sp)
804073c0:	0007a483          	lw	s1,0(a5)
804073c4:	00112623          	sw	ra,12(sp)
804073c8:	00812423          	sw	s0,8(sp)
804073cc:	01212023          	sw	s2,0(sp)
804073d0:	04a48463          	beq	s1,a0,80407418 <proc_run+0x68>
804073d4:	00050413          	mv	s0,a0
804073d8:	100027f3          	csrr	a5,sstatus
804073dc:	0027f793          	andi	a5,a5,2
804073e0:	00000913          	li	s2,0
804073e4:	06079263          	bnez	a5,80407448 <proc_run+0x98>
804073e8:	05842783          	lw	a5,88(s0)
804073ec:	00095717          	auipc	a4,0x95
804073f0:	3c872023          	sw	s0,960(a4) # 8049c7ac <current>
804073f4:	80000737          	lui	a4,0x80000
804073f8:	00c7d793          	srli	a5,a5,0xc
804073fc:	00e7e7b3          	or	a5,a5,a4
80407400:	18079073          	csrw	satp,a5
80407404:	12000073          	sfence.vma
80407408:	01c40593          	addi	a1,s0,28
8040740c:	01c48513          	addi	a0,s1,28
80407410:	40d010ef          	jal	ra,8040901c <switch_to>
80407414:	00091e63          	bnez	s2,80407430 <proc_run+0x80>
80407418:	00c12083          	lw	ra,12(sp)
8040741c:	00812403          	lw	s0,8(sp)
80407420:	00412483          	lw	s1,4(sp)
80407424:	00012903          	lw	s2,0(sp)
80407428:	01010113          	addi	sp,sp,16
8040742c:	00008067          	ret
80407430:	00812403          	lw	s0,8(sp)
80407434:	00c12083          	lw	ra,12(sp)
80407438:	00412483          	lw	s1,4(sp)
8040743c:	00012903          	lw	s2,0(sp)
80407440:	01010113          	addi	sp,sp,16
80407444:	86df906f          	j	80400cb0 <intr_enable>
80407448:	871f90ef          	jal	ra,80400cb8 <intr_disable>
8040744c:	00100913          	li	s2,1
80407450:	f99ff06f          	j	804073e8 <proc_run+0x38>

80407454 <find_proc>:
80407454:	000027b7          	lui	a5,0x2
80407458:	fff50713          	addi	a4,a0,-1
8040745c:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
80407460:	04e7ec63          	bltu	a5,a4,804074b8 <find_proc+0x64>
80407464:	ff010113          	addi	sp,sp,-16
80407468:	00a00593          	li	a1,10
8040746c:	00812423          	sw	s0,8(sp)
80407470:	00112623          	sw	ra,12(sp)
80407474:	00050413          	mv	s0,a0
80407478:	0080b0ef          	jal	ra,80412480 <hash32>
8040747c:	00092797          	auipc	a5,0x92
80407480:	2cc78793          	addi	a5,a5,716 # 80499748 <hash_list>
80407484:	00351513          	slli	a0,a0,0x3
80407488:	00f50533          	add	a0,a0,a5
8040748c:	00050793          	mv	a5,a0
80407490:	00c0006f          	j	8040749c <find_proc+0x48>
80407494:	f687a703          	lw	a4,-152(a5)
80407498:	02870463          	beq	a4,s0,804074c0 <find_proc+0x6c>
8040749c:	0047a783          	lw	a5,4(a5)
804074a0:	fef51ae3          	bne	a0,a5,80407494 <find_proc+0x40>
804074a4:	00c12083          	lw	ra,12(sp)
804074a8:	00812403          	lw	s0,8(sp)
804074ac:	00000513          	li	a0,0
804074b0:	01010113          	addi	sp,sp,16
804074b4:	00008067          	ret
804074b8:	00000513          	li	a0,0
804074bc:	00008067          	ret
804074c0:	00c12083          	lw	ra,12(sp)
804074c4:	00812403          	lw	s0,8(sp)
804074c8:	f6478513          	addi	a0,a5,-156
804074cc:	01010113          	addi	sp,sp,16
804074d0:	00008067          	ret

804074d4 <do_fork>:
804074d4:	fc010113          	addi	sp,sp,-64
804074d8:	03612023          	sw	s6,32(sp)
804074dc:	00095b17          	auipc	s6,0x95
804074e0:	2dcb0b13          	addi	s6,s6,732 # 8049c7b8 <nr_process>
804074e4:	000b2783          	lw	a5,0(s6)
804074e8:	03212823          	sw	s2,48(sp)
804074ec:	02112e23          	sw	ra,60(sp)
804074f0:	02812c23          	sw	s0,56(sp)
804074f4:	02912a23          	sw	s1,52(sp)
804074f8:	03312623          	sw	s3,44(sp)
804074fc:	03412423          	sw	s4,40(sp)
80407500:	03512223          	sw	s5,36(sp)
80407504:	01712e23          	sw	s7,28(sp)
80407508:	01812c23          	sw	s8,24(sp)
8040750c:	01912a23          	sw	s9,20(sp)
80407510:	01a12823          	sw	s10,16(sp)
80407514:	01b12623          	sw	s11,12(sp)
80407518:	00001937          	lui	s2,0x1
8040751c:	4927de63          	bge	a5,s2,804079b8 <do_fork+0x4e4>
80407520:	00050993          	mv	s3,a0
80407524:	00058a93          	mv	s5,a1
80407528:	00060493          	mv	s1,a2
8040752c:	aedff0ef          	jal	ra,80407018 <alloc_proc>
80407530:	00050413          	mv	s0,a0
80407534:	3c050263          	beqz	a0,804078f8 <do_fork+0x424>
80407538:	00095a17          	auipc	s4,0x95
8040753c:	274a0a13          	addi	s4,s4,628 # 8049c7ac <current>
80407540:	000a2783          	lw	a5,0(s4)
80407544:	0a87a703          	lw	a4,168(a5)
80407548:	00f52a23          	sw	a5,20(a0)
8040754c:	46071a63          	bnez	a4,804079c0 <do_fork+0x4ec>
80407550:	00200513          	li	a0,2
80407554:	8b9fb0ef          	jal	ra,80402e0c <alloc_pages>
80407558:	38050c63          	beqz	a0,804078f0 <do_fork+0x41c>
8040755c:	00095c17          	auipc	s8,0x95
80407560:	2acc0c13          	addi	s8,s8,684 # 8049c808 <pages>
80407564:	000c2683          	lw	a3,0(s8)
80407568:	0000f797          	auipc	a5,0xf
8040756c:	4bc78793          	addi	a5,a5,1212 # 80416a24 <nbase>
80407570:	0007ab83          	lw	s7,0(a5)
80407574:	40d506b3          	sub	a3,a0,a3
80407578:	4056d693          	srai	a3,a3,0x5
8040757c:	00095c97          	auipc	s9,0x95
80407580:	21cc8c93          	addi	s9,s9,540 # 8049c798 <npage>
80407584:	017686b3          	add	a3,a3,s7
80407588:	000ca703          	lw	a4,0(s9)
8040758c:	00c69793          	slli	a5,a3,0xc
80407590:	00c7d793          	srli	a5,a5,0xc
80407594:	00c69693          	slli	a3,a3,0xc
80407598:	46e7f463          	bgeu	a5,a4,80407a00 <do_fork+0x52c>
8040759c:	00095d17          	auipc	s10,0x95
804075a0:	264d0d13          	addi	s10,s10,612 # 8049c800 <va_pa_offset>
804075a4:	000a2703          	lw	a4,0(s4)
804075a8:	000d2783          	lw	a5,0(s10)
804075ac:	0dc72d83          	lw	s11,220(a4) # 800000dc <end+0xffb63820>
804075b0:	00d786b3          	add	a3,a5,a3
804075b4:	00d42623          	sw	a3,12(s0)
804075b8:	420d8463          	beqz	s11,804079e0 <do_fork+0x50c>
804075bc:	80090913          	addi	s2,s2,-2048 # 800 <_binary_bin_swap_img_size-0x7800>
804075c0:	0129f933          	and	s2,s3,s2
804075c4:	2a090463          	beqz	s2,8040786c <do_fork+0x398>
804075c8:	008da783          	lw	a5,8(s11)
804075cc:	01872903          	lw	s2,24(a4)
804075d0:	00178793          	addi	a5,a5,1
804075d4:	00fda423          	sw	a5,8(s11)
804075d8:	0db42e23          	sw	s11,220(s0)
804075dc:	02090a63          	beqz	s2,80407610 <do_fork+0x13c>
804075e0:	1009f993          	andi	s3,s3,256
804075e4:	2a098663          	beqz	s3,80407890 <do_fork+0x3bc>
804075e8:	01892783          	lw	a5,24(s2)
804075ec:	00c92683          	lw	a3,12(s2)
804075f0:	80400737          	lui	a4,0x80400
804075f4:	00178793          	addi	a5,a5,1
804075f8:	00f92c23          	sw	a5,24(s2)
804075fc:	01242c23          	sw	s2,24(s0)
80407600:	40e6ec63          	bltu	a3,a4,80407a18 <do_fork+0x544>
80407604:	000d2783          	lw	a5,0(s10)
80407608:	40f686b3          	sub	a3,a3,a5
8040760c:	04d42c23          	sw	a3,88(s0)
80407610:	00c42783          	lw	a5,12(s0)
80407614:	00002737          	lui	a4,0x2
80407618:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_bin_swap_img_size-0x6090>
8040761c:	00e787b3          	add	a5,a5,a4
80407620:	04f42a23          	sw	a5,84(s0)
80407624:	00078713          	mv	a4,a5
80407628:	09048813          	addi	a6,s1,144
8040762c:	0004a503          	lw	a0,0(s1)
80407630:	0044a583          	lw	a1,4(s1)
80407634:	0084a603          	lw	a2,8(s1)
80407638:	00c4a683          	lw	a3,12(s1)
8040763c:	00a72023          	sw	a0,0(a4)
80407640:	00b72223          	sw	a1,4(a4)
80407644:	00c72423          	sw	a2,8(a4)
80407648:	00d72623          	sw	a3,12(a4)
8040764c:	01048493          	addi	s1,s1,16
80407650:	01070713          	addi	a4,a4,16
80407654:	fd049ce3          	bne	s1,a6,8040762c <do_fork+0x158>
80407658:	0207a423          	sw	zero,40(a5)
8040765c:	1a0a8663          	beqz	s5,80407808 <do_fork+0x334>
80407660:	0157a423          	sw	s5,8(a5)
80407664:	00000717          	auipc	a4,0x0
80407668:	a9870713          	addi	a4,a4,-1384 # 804070fc <forkret>
8040766c:	00e42e23          	sw	a4,28(s0)
80407670:	02f42023          	sw	a5,32(s0)
80407674:	100027f3          	csrr	a5,sstatus
80407678:	0027f793          	andi	a5,a5,2
8040767c:	00000913          	li	s2,0
80407680:	1a079863          	bnez	a5,80407830 <do_fork+0x35c>
80407684:	00092797          	auipc	a5,0x92
80407688:	9c078793          	addi	a5,a5,-1600 # 80499044 <last_pid>
8040768c:	0007a503          	lw	a0,0(a5)
80407690:	000027b7          	lui	a5,0x2
80407694:	00150513          	addi	a0,a0,1
80407698:	00092717          	auipc	a4,0x92
8040769c:	9aa72623          	sw	a0,-1620(a4) # 80499044 <last_pid>
804076a0:	1af55c63          	bge	a0,a5,80407858 <do_fork+0x384>
804076a4:	00092797          	auipc	a5,0x92
804076a8:	9a478793          	addi	a5,a5,-1628 # 80499048 <next_safe>
804076ac:	0007a783          	lw	a5,0(a5)
804076b0:	00095497          	auipc	s1,0x95
804076b4:	20448493          	addi	s1,s1,516 # 8049c8b4 <proc_list>
804076b8:	06f54c63          	blt	a0,a5,80407730 <do_fork+0x25c>
804076bc:	000027b7          	lui	a5,0x2
804076c0:	00092717          	auipc	a4,0x92
804076c4:	98f72423          	sw	a5,-1656(a4) # 80499048 <next_safe>
804076c8:	00000593          	li	a1,0
804076cc:	00050793          	mv	a5,a0
804076d0:	00095497          	auipc	s1,0x95
804076d4:	1e448493          	addi	s1,s1,484 # 8049c8b4 <proc_list>
804076d8:	000028b7          	lui	a7,0x2
804076dc:	00058813          	mv	a6,a1
804076e0:	00002637          	lui	a2,0x2
804076e4:	00095697          	auipc	a3,0x95
804076e8:	1d068693          	addi	a3,a3,464 # 8049c8b4 <proc_list>
804076ec:	0046a683          	lw	a3,4(a3)
804076f0:	02968263          	beq	a3,s1,80407714 <do_fork+0x240>
804076f4:	f706a703          	lw	a4,-144(a3)
804076f8:	10f70063          	beq	a4,a5,804077f8 <do_fork+0x324>
804076fc:	fee7d8e3          	bge	a5,a4,804076ec <do_fork+0x218>
80407700:	fec756e3          	bge	a4,a2,804076ec <do_fork+0x218>
80407704:	0046a683          	lw	a3,4(a3)
80407708:	00070613          	mv	a2,a4
8040770c:	00100813          	li	a6,1
80407710:	fe9692e3          	bne	a3,s1,804076f4 <do_fork+0x220>
80407714:	00058863          	beqz	a1,80407724 <do_fork+0x250>
80407718:	00092717          	auipc	a4,0x92
8040771c:	92f72623          	sw	a5,-1748(a4) # 80499044 <last_pid>
80407720:	00078513          	mv	a0,a5
80407724:	00080663          	beqz	a6,80407730 <do_fork+0x25c>
80407728:	00092797          	auipc	a5,0x92
8040772c:	92c7a023          	sw	a2,-1760(a5) # 80499048 <next_safe>
80407730:	00a00593          	li	a1,10
80407734:	00a42223          	sw	a0,4(s0)
80407738:	5490a0ef          	jal	ra,80412480 <hash32>
8040773c:	00092797          	auipc	a5,0x92
80407740:	00c78793          	addi	a5,a5,12 # 80499748 <hash_list>
80407744:	00351513          	slli	a0,a0,0x3
80407748:	00f50533          	add	a0,a0,a5
8040774c:	00452583          	lw	a1,4(a0)
80407750:	01442683          	lw	a3,20(s0)
80407754:	09c40793          	addi	a5,s0,156
80407758:	00f5a023          	sw	a5,0(a1)
8040775c:	0044a603          	lw	a2,4(s1)
80407760:	00f52223          	sw	a5,4(a0)
80407764:	0ac6a703          	lw	a4,172(a3)
80407768:	09440793          	addi	a5,s0,148
8040776c:	0ab42023          	sw	a1,160(s0)
80407770:	08a42e23          	sw	a0,156(s0)
80407774:	00f62023          	sw	a5,0(a2) # 2000 <_binary_bin_swap_img_size-0x6000>
80407778:	00095597          	auipc	a1,0x95
8040777c:	14f5a023          	sw	a5,320(a1) # 8049c8b8 <proc_list+0x4>
80407780:	08c42c23          	sw	a2,152(s0)
80407784:	08942a23          	sw	s1,148(s0)
80407788:	0a042823          	sw	zero,176(s0)
8040778c:	0ae42a23          	sw	a4,180(s0)
80407790:	00070463          	beqz	a4,80407798 <do_fork+0x2c4>
80407794:	0a872823          	sw	s0,176(a4)
80407798:	000b2783          	lw	a5,0(s6)
8040779c:	0a86a623          	sw	s0,172(a3)
804077a0:	00178793          	addi	a5,a5,1
804077a4:	00095717          	auipc	a4,0x95
804077a8:	00f72a23          	sw	a5,20(a4) # 8049c7b8 <nr_process>
804077ac:	14091a63          	bnez	s2,80407900 <do_fork+0x42c>
804077b0:	00040513          	mv	a0,s0
804077b4:	3cc050ef          	jal	ra,8040cb80 <wakeup_proc>
804077b8:	00442503          	lw	a0,4(s0)
804077bc:	03c12083          	lw	ra,60(sp)
804077c0:	03812403          	lw	s0,56(sp)
804077c4:	03412483          	lw	s1,52(sp)
804077c8:	03012903          	lw	s2,48(sp)
804077cc:	02c12983          	lw	s3,44(sp)
804077d0:	02812a03          	lw	s4,40(sp)
804077d4:	02412a83          	lw	s5,36(sp)
804077d8:	02012b03          	lw	s6,32(sp)
804077dc:	01c12b83          	lw	s7,28(sp)
804077e0:	01812c03          	lw	s8,24(sp)
804077e4:	01412c83          	lw	s9,20(sp)
804077e8:	01012d03          	lw	s10,16(sp)
804077ec:	00c12d83          	lw	s11,12(sp)
804077f0:	04010113          	addi	sp,sp,64
804077f4:	00008067          	ret
804077f8:	00178793          	addi	a5,a5,1
804077fc:	14c7da63          	bge	a5,a2,80407950 <do_fork+0x47c>
80407800:	00100593          	li	a1,1
80407804:	ee9ff06f          	j	804076ec <do_fork+0x218>
80407808:	00078a93          	mv	s5,a5
8040780c:	0157a423          	sw	s5,8(a5)
80407810:	00000717          	auipc	a4,0x0
80407814:	8ec70713          	addi	a4,a4,-1812 # 804070fc <forkret>
80407818:	00e42e23          	sw	a4,28(s0)
8040781c:	02f42023          	sw	a5,32(s0)
80407820:	100027f3          	csrr	a5,sstatus
80407824:	0027f793          	andi	a5,a5,2
80407828:	00000913          	li	s2,0
8040782c:	e4078ce3          	beqz	a5,80407684 <do_fork+0x1b0>
80407830:	c88f90ef          	jal	ra,80400cb8 <intr_disable>
80407834:	00092797          	auipc	a5,0x92
80407838:	81078793          	addi	a5,a5,-2032 # 80499044 <last_pid>
8040783c:	0007a503          	lw	a0,0(a5)
80407840:	000027b7          	lui	a5,0x2
80407844:	00100913          	li	s2,1
80407848:	00150513          	addi	a0,a0,1
8040784c:	00091717          	auipc	a4,0x91
80407850:	7ea72c23          	sw	a0,2040(a4) # 80499044 <last_pid>
80407854:	e4f548e3          	blt	a0,a5,804076a4 <do_fork+0x1d0>
80407858:	00100793          	li	a5,1
8040785c:	00091717          	auipc	a4,0x91
80407860:	7ef72423          	sw	a5,2024(a4) # 80499044 <last_pid>
80407864:	00100513          	li	a0,1
80407868:	e55ff06f          	j	804076bc <do_fork+0x1e8>
8040786c:	b49fe0ef          	jal	ra,804063b4 <files_create>
80407870:	00050913          	mv	s2,a0
80407874:	04050263          	beqz	a0,804078b8 <do_fork+0x3e4>
80407878:	000d8593          	mv	a1,s11
8040787c:	cedfe0ef          	jal	ra,80406568 <dup_files>
80407880:	0e051063          	bnez	a0,80407960 <do_fork+0x48c>
80407884:	000a2703          	lw	a4,0(s4)
80407888:	00090d93          	mv	s11,s2
8040788c:	d3dff06f          	j	804075c8 <do_fork+0xf4>
80407890:	ed9fc0ef          	jal	ra,80404768 <mm_create>
80407894:	00050993          	mv	s3,a0
80407898:	00050c63          	beqz	a0,804078b0 <do_fork+0x3dc>
8040789c:	00c50513          	addi	a0,a0,12
804078a0:	9bdff0ef          	jal	ra,8040725c <setup_pgdir.isra.4>
804078a4:	06050263          	beqz	a0,80407908 <do_fork+0x434>
804078a8:	00098513          	mv	a0,s3
804078ac:	880fd0ef          	jal	ra,8040492c <mm_destroy>
804078b0:	00040513          	mv	a0,s0
804078b4:	829ff0ef          	jal	ra,804070dc <put_files>
804078b8:	00c42683          	lw	a3,12(s0)
804078bc:	804007b7          	lui	a5,0x80400
804078c0:	18f6e463          	bltu	a3,a5,80407a48 <do_fork+0x574>
804078c4:	000d2703          	lw	a4,0(s10)
804078c8:	000ca783          	lw	a5,0(s9)
804078cc:	40e686b3          	sub	a3,a3,a4
804078d0:	00c6d693          	srli	a3,a3,0xc
804078d4:	14f6fe63          	bgeu	a3,a5,80407a30 <do_fork+0x55c>
804078d8:	000c2503          	lw	a0,0(s8)
804078dc:	417686b3          	sub	a3,a3,s7
804078e0:	00569693          	slli	a3,a3,0x5
804078e4:	00200593          	li	a1,2
804078e8:	00d50533          	add	a0,a0,a3
804078ec:	de8fb0ef          	jal	ra,80402ed4 <free_pages>
804078f0:	00040513          	mv	a0,s0
804078f4:	abcfb0ef          	jal	ra,80402bb0 <kfree>
804078f8:	ffc00513          	li	a0,-4
804078fc:	ec1ff06f          	j	804077bc <do_fork+0x2e8>
80407900:	bb0f90ef          	jal	ra,80400cb0 <intr_enable>
80407904:	eadff06f          	j	804077b0 <do_fork+0x2dc>
80407908:	01c90d93          	addi	s11,s2,28
8040790c:	000d8513          	mv	a0,s11
80407910:	92dfd0ef          	jal	ra,8040523c <down>
80407914:	000a2783          	lw	a5,0(s4)
80407918:	00078663          	beqz	a5,80407924 <do_fork+0x450>
8040791c:	0047a783          	lw	a5,4(a5) # 80400004 <end+0xfff63748>
80407920:	02f92423          	sw	a5,40(s2)
80407924:	00090593          	mv	a1,s2
80407928:	00098513          	mv	a0,s3
8040792c:	96cfd0ef          	jal	ra,80404a98 <dup_mmap>
80407930:	00050a13          	mv	s4,a0
80407934:	000d8513          	mv	a0,s11
80407938:	901fd0ef          	jal	ra,80405238 <up>
8040793c:	02092423          	sw	zero,40(s2)
80407940:	020a1663          	bnez	s4,8040796c <do_fork+0x498>
80407944:	0000100f          	fence.i
80407948:	00098913          	mv	s2,s3
8040794c:	c9dff06f          	j	804075e8 <do_fork+0x114>
80407950:	0117c463          	blt	a5,a7,80407958 <do_fork+0x484>
80407954:	00100793          	li	a5,1
80407958:	00100593          	li	a1,1
8040795c:	d81ff06f          	j	804076dc <do_fork+0x208>
80407960:	00090513          	mv	a0,s2
80407964:	aa5fe0ef          	jal	ra,80406408 <files_destroy>
80407968:	f51ff06f          	j	804078b8 <do_fork+0x3e4>
8040796c:	00098513          	mv	a0,s3
80407970:	a08fd0ef          	jal	ra,80404b78 <exit_mmap>
80407974:	00c9a683          	lw	a3,12(s3)
80407978:	804007b7          	lui	a5,0x80400
8040797c:	0cf6e663          	bltu	a3,a5,80407a48 <do_fork+0x574>
80407980:	000d2703          	lw	a4,0(s10)
80407984:	000ca783          	lw	a5,0(s9)
80407988:	40e686b3          	sub	a3,a3,a4
8040798c:	00c6d693          	srli	a3,a3,0xc
80407990:	0af6f063          	bgeu	a3,a5,80407a30 <do_fork+0x55c>
80407994:	000c2503          	lw	a0,0(s8)
80407998:	417686b3          	sub	a3,a3,s7
8040799c:	00569693          	slli	a3,a3,0x5
804079a0:	00d50533          	add	a0,a0,a3
804079a4:	00100593          	li	a1,1
804079a8:	d2cfb0ef          	jal	ra,80402ed4 <free_pages>
804079ac:	00098513          	mv	a0,s3
804079b0:	f7dfc0ef          	jal	ra,8040492c <mm_destroy>
804079b4:	efdff06f          	j	804078b0 <do_fork+0x3dc>
804079b8:	ffb00513          	li	a0,-5
804079bc:	e01ff06f          	j	804077bc <do_fork+0x2e8>
804079c0:	0000d697          	auipc	a3,0xd
804079c4:	3c068693          	addi	a3,a3,960 # 80414d80 <CSWTCH.69+0x818>
804079c8:	0000b617          	auipc	a2,0xb
804079cc:	76460613          	addi	a2,a2,1892 # 8041312c <commands+0x1f8>
804079d0:	1f000593          	li	a1,496
804079d4:	0000d517          	auipc	a0,0xd
804079d8:	62c50513          	addi	a0,a0,1580 # 80415000 <CSWTCH.69+0xa98>
804079dc:	c49f80ef          	jal	ra,80400624 <__panic>
804079e0:	0000d697          	auipc	a3,0xd
804079e4:	3bc68693          	addi	a3,a3,956 # 80414d9c <CSWTCH.69+0x834>
804079e8:	0000b617          	auipc	a2,0xb
804079ec:	74460613          	addi	a2,a2,1860 # 8041312c <commands+0x1f8>
804079f0:	19600593          	li	a1,406
804079f4:	0000d517          	auipc	a0,0xd
804079f8:	60c50513          	addi	a0,a0,1548 # 80415000 <CSWTCH.69+0xa98>
804079fc:	c29f80ef          	jal	ra,80400624 <__panic>
80407a00:	0000c617          	auipc	a2,0xc
80407a04:	29860613          	addi	a2,a2,664 # 80413c98 <default_pmm_manager+0x30>
80407a08:	06e00593          	li	a1,110
80407a0c:	0000c517          	auipc	a0,0xc
80407a10:	2b050513          	addi	a0,a0,688 # 80413cbc <default_pmm_manager+0x54>
80407a14:	c11f80ef          	jal	ra,80400624 <__panic>
80407a18:	0000c617          	auipc	a2,0xc
80407a1c:	2b460613          	addi	a2,a2,692 # 80413ccc <default_pmm_manager+0x64>
80407a20:	17700593          	li	a1,375
80407a24:	0000d517          	auipc	a0,0xd
80407a28:	5dc50513          	addi	a0,a0,1500 # 80415000 <CSWTCH.69+0xa98>
80407a2c:	bf9f80ef          	jal	ra,80400624 <__panic>
80407a30:	0000c617          	auipc	a2,0xc
80407a34:	2c060613          	addi	a2,a2,704 # 80413cf0 <default_pmm_manager+0x88>
80407a38:	06900593          	li	a1,105
80407a3c:	0000c517          	auipc	a0,0xc
80407a40:	28050513          	addi	a0,a0,640 # 80413cbc <default_pmm_manager+0x54>
80407a44:	be1f80ef          	jal	ra,80400624 <__panic>
80407a48:	0000c617          	auipc	a2,0xc
80407a4c:	28460613          	addi	a2,a2,644 # 80413ccc <default_pmm_manager+0x64>
80407a50:	07000593          	li	a1,112
80407a54:	0000c517          	auipc	a0,0xc
80407a58:	26850513          	addi	a0,a0,616 # 80413cbc <default_pmm_manager+0x54>
80407a5c:	bc9f80ef          	jal	ra,80400624 <__panic>

80407a60 <kernel_thread>:
80407a60:	f6010113          	addi	sp,sp,-160
80407a64:	08812c23          	sw	s0,152(sp)
80407a68:	08912a23          	sw	s1,148(sp)
80407a6c:	09212823          	sw	s2,144(sp)
80407a70:	00058493          	mv	s1,a1
80407a74:	00050913          	mv	s2,a0
80407a78:	00060413          	mv	s0,a2
80407a7c:	00000593          	li	a1,0
80407a80:	09000613          	li	a2,144
80407a84:	00010513          	mv	a0,sp
80407a88:	08112e23          	sw	ra,156(sp)
80407a8c:	2340b0ef          	jal	ra,80412cc0 <memset>
80407a90:	03212023          	sw	s2,32(sp)
80407a94:	02912223          	sw	s1,36(sp)
80407a98:	100027f3          	csrr	a5,sstatus
80407a9c:	edd7f793          	andi	a5,a5,-291
80407aa0:	1207e793          	ori	a5,a5,288
80407aa4:	08f12023          	sw	a5,128(sp)
80407aa8:	00010613          	mv	a2,sp
80407aac:	10046513          	ori	a0,s0,256
80407ab0:	fffff797          	auipc	a5,0xfffff
80407ab4:	55c78793          	addi	a5,a5,1372 # 8040700c <kernel_thread_entry>
80407ab8:	00000593          	li	a1,0
80407abc:	08f12223          	sw	a5,132(sp)
80407ac0:	a15ff0ef          	jal	ra,804074d4 <do_fork>
80407ac4:	09c12083          	lw	ra,156(sp)
80407ac8:	09812403          	lw	s0,152(sp)
80407acc:	09412483          	lw	s1,148(sp)
80407ad0:	09012903          	lw	s2,144(sp)
80407ad4:	0a010113          	addi	sp,sp,160
80407ad8:	00008067          	ret

80407adc <do_exit>:
80407adc:	fe010113          	addi	sp,sp,-32
80407ae0:	00912a23          	sw	s1,20(sp)
80407ae4:	00095717          	auipc	a4,0x95
80407ae8:	ccc70713          	addi	a4,a4,-820 # 8049c7b0 <idleproc>
80407aec:	00095497          	auipc	s1,0x95
80407af0:	cc048493          	addi	s1,s1,-832 # 8049c7ac <current>
80407af4:	0004a783          	lw	a5,0(s1)
80407af8:	00072703          	lw	a4,0(a4)
80407afc:	00112e23          	sw	ra,28(sp)
80407b00:	00812c23          	sw	s0,24(sp)
80407b04:	01212823          	sw	s2,16(sp)
80407b08:	01312623          	sw	s3,12(sp)
80407b0c:	01412423          	sw	s4,8(sp)
80407b10:	12e78263          	beq	a5,a4,80407c34 <do_exit+0x158>
80407b14:	00095417          	auipc	s0,0x95
80407b18:	ca040413          	addi	s0,s0,-864 # 8049c7b4 <initproc>
80407b1c:	00042703          	lw	a4,0(s0)
80407b20:	18e78e63          	beq	a5,a4,80407cbc <do_exit+0x1e0>
80407b24:	0187a903          	lw	s2,24(a5)
80407b28:	00050993          	mv	s3,a0
80407b2c:	02090e63          	beqz	s2,80407b68 <do_exit+0x8c>
80407b30:	00095797          	auipc	a5,0x95
80407b34:	cd478793          	addi	a5,a5,-812 # 8049c804 <boot_cr3>
80407b38:	0007a783          	lw	a5,0(a5)
80407b3c:	80000737          	lui	a4,0x80000
80407b40:	00c7d793          	srli	a5,a5,0xc
80407b44:	00e7e7b3          	or	a5,a5,a4
80407b48:	18079073          	csrw	satp,a5
80407b4c:	12000073          	sfence.vma
80407b50:	01892783          	lw	a5,24(s2)
80407b54:	fff78793          	addi	a5,a5,-1
80407b58:	00f92c23          	sw	a5,24(s2)
80407b5c:	0e078863          	beqz	a5,80407c4c <do_exit+0x170>
80407b60:	0004a783          	lw	a5,0(s1)
80407b64:	0007ac23          	sw	zero,24(a5)
80407b68:	0004a503          	lw	a0,0(s1)
80407b6c:	d70ff0ef          	jal	ra,804070dc <put_files>
80407b70:	0004a783          	lw	a5,0(s1)
80407b74:	00300713          	li	a4,3
80407b78:	00e7a023          	sw	a4,0(a5)
80407b7c:	0b37a223          	sw	s3,164(a5)
80407b80:	100027f3          	csrr	a5,sstatus
80407b84:	0027f793          	andi	a5,a5,2
80407b88:	00000a13          	li	s4,0
80407b8c:	14079463          	bnez	a5,80407cd4 <do_exit+0x1f8>
80407b90:	0004a703          	lw	a4,0(s1)
80407b94:	800007b7          	lui	a5,0x80000
80407b98:	00178793          	addi	a5,a5,1 # 80000001 <end+0xffb63745>
80407b9c:	01472503          	lw	a0,20(a4) # 80000014 <end+0xffb63758>
80407ba0:	0a852703          	lw	a4,168(a0)
80407ba4:	12f70e63          	beq	a4,a5,80407ce0 <do_exit+0x204>
80407ba8:	0004a683          	lw	a3,0(s1)
80407bac:	800009b7          	lui	s3,0x80000
80407bb0:	00300913          	li	s2,3
80407bb4:	00198993          	addi	s3,s3,1 # 80000001 <end+0xffb63745>
80407bb8:	0ac6a783          	lw	a5,172(a3)
80407bbc:	04078463          	beqz	a5,80407c04 <do_exit+0x128>
80407bc0:	0b47a703          	lw	a4,180(a5)
80407bc4:	00042503          	lw	a0,0(s0)
80407bc8:	0ae6a623          	sw	a4,172(a3)
80407bcc:	0ac52703          	lw	a4,172(a0)
80407bd0:	0a07a823          	sw	zero,176(a5)
80407bd4:	0ae7aa23          	sw	a4,180(a5)
80407bd8:	00070463          	beqz	a4,80407be0 <do_exit+0x104>
80407bdc:	0af72823          	sw	a5,176(a4)
80407be0:	0007a703          	lw	a4,0(a5)
80407be4:	00a7aa23          	sw	a0,20(a5)
80407be8:	0af52623          	sw	a5,172(a0)
80407bec:	fd2716e3          	bne	a4,s2,80407bb8 <do_exit+0xdc>
80407bf0:	0a852783          	lw	a5,168(a0)
80407bf4:	fd3792e3          	bne	a5,s3,80407bb8 <do_exit+0xdc>
80407bf8:	789040ef          	jal	ra,8040cb80 <wakeup_proc>
80407bfc:	0004a683          	lw	a3,0(s1)
80407c00:	fb9ff06f          	j	80407bb8 <do_exit+0xdc>
80407c04:	020a1463          	bnez	s4,80407c2c <do_exit+0x150>
80407c08:	0a4050ef          	jal	ra,8040ccac <schedule>
80407c0c:	0004a783          	lw	a5,0(s1)
80407c10:	0000d617          	auipc	a2,0xd
80407c14:	15060613          	addi	a2,a2,336 # 80414d60 <CSWTCH.69+0x7f8>
80407c18:	24c00593          	li	a1,588
80407c1c:	0047a683          	lw	a3,4(a5)
80407c20:	0000d517          	auipc	a0,0xd
80407c24:	3e050513          	addi	a0,a0,992 # 80415000 <CSWTCH.69+0xa98>
80407c28:	9fdf80ef          	jal	ra,80400624 <__panic>
80407c2c:	884f90ef          	jal	ra,80400cb0 <intr_enable>
80407c30:	fd9ff06f          	j	80407c08 <do_exit+0x12c>
80407c34:	0000d617          	auipc	a2,0xd
80407c38:	10c60613          	addi	a2,a2,268 # 80414d40 <CSWTCH.69+0x7d8>
80407c3c:	21c00593          	li	a1,540
80407c40:	0000d517          	auipc	a0,0xd
80407c44:	3c050513          	addi	a0,a0,960 # 80415000 <CSWTCH.69+0xa98>
80407c48:	9ddf80ef          	jal	ra,80400624 <__panic>
80407c4c:	00090513          	mv	a0,s2
80407c50:	f29fc0ef          	jal	ra,80404b78 <exit_mmap>
80407c54:	00c92683          	lw	a3,12(s2)
80407c58:	804007b7          	lui	a5,0x80400
80407c5c:	08f6e663          	bltu	a3,a5,80407ce8 <do_exit+0x20c>
80407c60:	00095797          	auipc	a5,0x95
80407c64:	ba078793          	addi	a5,a5,-1120 # 8049c800 <va_pa_offset>
80407c68:	0007a703          	lw	a4,0(a5)
80407c6c:	00095797          	auipc	a5,0x95
80407c70:	b2c78793          	addi	a5,a5,-1236 # 8049c798 <npage>
80407c74:	0007a783          	lw	a5,0(a5)
80407c78:	40e686b3          	sub	a3,a3,a4
80407c7c:	00c6d693          	srli	a3,a3,0xc
80407c80:	08f6f063          	bgeu	a3,a5,80407d00 <do_exit+0x224>
80407c84:	0000f797          	auipc	a5,0xf
80407c88:	da078793          	addi	a5,a5,-608 # 80416a24 <nbase>
80407c8c:	0007a783          	lw	a5,0(a5)
80407c90:	00095717          	auipc	a4,0x95
80407c94:	b7870713          	addi	a4,a4,-1160 # 8049c808 <pages>
80407c98:	00072503          	lw	a0,0(a4)
80407c9c:	40f686b3          	sub	a3,a3,a5
80407ca0:	00569693          	slli	a3,a3,0x5
80407ca4:	00d50533          	add	a0,a0,a3
80407ca8:	00100593          	li	a1,1
80407cac:	a28fb0ef          	jal	ra,80402ed4 <free_pages>
80407cb0:	00090513          	mv	a0,s2
80407cb4:	c79fc0ef          	jal	ra,8040492c <mm_destroy>
80407cb8:	ea9ff06f          	j	80407b60 <do_exit+0x84>
80407cbc:	0000d617          	auipc	a2,0xd
80407cc0:	09460613          	addi	a2,a2,148 # 80414d50 <CSWTCH.69+0x7e8>
80407cc4:	21f00593          	li	a1,543
80407cc8:	0000d517          	auipc	a0,0xd
80407ccc:	33850513          	addi	a0,a0,824 # 80415000 <CSWTCH.69+0xa98>
80407cd0:	955f80ef          	jal	ra,80400624 <__panic>
80407cd4:	fe5f80ef          	jal	ra,80400cb8 <intr_disable>
80407cd8:	00100a13          	li	s4,1
80407cdc:	eb5ff06f          	j	80407b90 <do_exit+0xb4>
80407ce0:	6a1040ef          	jal	ra,8040cb80 <wakeup_proc>
80407ce4:	ec5ff06f          	j	80407ba8 <do_exit+0xcc>
80407ce8:	0000c617          	auipc	a2,0xc
80407cec:	fe460613          	addi	a2,a2,-28 # 80413ccc <default_pmm_manager+0x64>
80407cf0:	07000593          	li	a1,112
80407cf4:	0000c517          	auipc	a0,0xc
80407cf8:	fc850513          	addi	a0,a0,-56 # 80413cbc <default_pmm_manager+0x54>
80407cfc:	929f80ef          	jal	ra,80400624 <__panic>
80407d00:	0000c617          	auipc	a2,0xc
80407d04:	ff060613          	addi	a2,a2,-16 # 80413cf0 <default_pmm_manager+0x88>
80407d08:	06900593          	li	a1,105
80407d0c:	0000c517          	auipc	a0,0xc
80407d10:	fb050513          	addi	a0,a0,-80 # 80413cbc <default_pmm_manager+0x54>
80407d14:	911f80ef          	jal	ra,80400624 <__panic>

80407d18 <do_wait.part.8>:
80407d18:	fe010113          	addi	sp,sp,-32
80407d1c:	01412423          	sw	s4,8(sp)
80407d20:	80000a37          	lui	s4,0x80000
80407d24:	00912a23          	sw	s1,20(sp)
80407d28:	01212823          	sw	s2,16(sp)
80407d2c:	01312623          	sw	s3,12(sp)
80407d30:	01512223          	sw	s5,4(sp)
80407d34:	01612023          	sw	s6,0(sp)
80407d38:	00112e23          	sw	ra,28(sp)
80407d3c:	00812c23          	sw	s0,24(sp)
80407d40:	00050993          	mv	s3,a0
80407d44:	00058b13          	mv	s6,a1
80407d48:	00095917          	auipc	s2,0x95
80407d4c:	a6490913          	addi	s2,s2,-1436 # 8049c7ac <current>
80407d50:	00300493          	li	s1,3
80407d54:	00100a93          	li	s5,1
80407d58:	001a0a13          	addi	s4,s4,1 # 80000001 <end+0xffb63745>
80407d5c:	04098663          	beqz	s3,80407da8 <do_wait.part.8+0x90>
80407d60:	00098513          	mv	a0,s3
80407d64:	ef0ff0ef          	jal	ra,80407454 <find_proc>
80407d68:	00050413          	mv	s0,a0
80407d6c:	18050a63          	beqz	a0,80407f00 <do_wait.part.8+0x1e8>
80407d70:	00092703          	lw	a4,0(s2)
80407d74:	01452783          	lw	a5,20(a0)
80407d78:	18e79463          	bne	a5,a4,80407f00 <do_wait.part.8+0x1e8>
80407d7c:	00052783          	lw	a5,0(a0)
80407d80:	04978463          	beq	a5,s1,80407dc8 <do_wait.part.8+0xb0>
80407d84:	01572023          	sw	s5,0(a4)
80407d88:	0b472423          	sw	s4,168(a4)
80407d8c:	721040ef          	jal	ra,8040ccac <schedule>
80407d90:	00092783          	lw	a5,0(s2)
80407d94:	05c7a783          	lw	a5,92(a5)
80407d98:	0017f793          	andi	a5,a5,1
80407d9c:	fc0780e3          	beqz	a5,80407d5c <do_wait.part.8+0x44>
80407da0:	ff700513          	li	a0,-9
80407da4:	d39ff0ef          	jal	ra,80407adc <do_exit>
80407da8:	00092703          	lw	a4,0(s2)
80407dac:	0ac72403          	lw	s0,172(a4)
80407db0:	00041863          	bnez	s0,80407dc0 <do_wait.part.8+0xa8>
80407db4:	14c0006f          	j	80407f00 <do_wait.part.8+0x1e8>
80407db8:	0b442403          	lw	s0,180(s0)
80407dbc:	fc0404e3          	beqz	s0,80407d84 <do_wait.part.8+0x6c>
80407dc0:	00042783          	lw	a5,0(s0)
80407dc4:	fe979ae3          	bne	a5,s1,80407db8 <do_wait.part.8+0xa0>
80407dc8:	00095797          	auipc	a5,0x95
80407dcc:	9e878793          	addi	a5,a5,-1560 # 8049c7b0 <idleproc>
80407dd0:	0007a783          	lw	a5,0(a5)
80407dd4:	14878063          	beq	a5,s0,80407f14 <do_wait.part.8+0x1fc>
80407dd8:	00095797          	auipc	a5,0x95
80407ddc:	9dc78793          	addi	a5,a5,-1572 # 8049c7b4 <initproc>
80407de0:	0007a783          	lw	a5,0(a5)
80407de4:	12f40863          	beq	s0,a5,80407f14 <do_wait.part.8+0x1fc>
80407de8:	000b0663          	beqz	s6,80407df4 <do_wait.part.8+0xdc>
80407dec:	0a442783          	lw	a5,164(s0)
80407df0:	00fb2023          	sw	a5,0(s6)
80407df4:	100027f3          	csrr	a5,sstatus
80407df8:	0027f793          	andi	a5,a5,2
80407dfc:	00000593          	li	a1,0
80407e00:	10079463          	bnez	a5,80407f08 <do_wait.part.8+0x1f0>
80407e04:	09c42603          	lw	a2,156(s0)
80407e08:	0a042683          	lw	a3,160(s0)
80407e0c:	0b442703          	lw	a4,180(s0)
80407e10:	0b042783          	lw	a5,176(s0)
80407e14:	00d62223          	sw	a3,4(a2)
80407e18:	00c6a023          	sw	a2,0(a3)
80407e1c:	09442603          	lw	a2,148(s0)
80407e20:	09842683          	lw	a3,152(s0)
80407e24:	00d62223          	sw	a3,4(a2)
80407e28:	00c6a023          	sw	a2,0(a3)
80407e2c:	00070663          	beqz	a4,80407e38 <do_wait.part.8+0x120>
80407e30:	0af72823          	sw	a5,176(a4)
80407e34:	0b042783          	lw	a5,176(s0)
80407e38:	0a078e63          	beqz	a5,80407ef4 <do_wait.part.8+0x1dc>
80407e3c:	0ae7aa23          	sw	a4,180(a5)
80407e40:	00095797          	auipc	a5,0x95
80407e44:	97878793          	addi	a5,a5,-1672 # 8049c7b8 <nr_process>
80407e48:	0007a783          	lw	a5,0(a5)
80407e4c:	fff78793          	addi	a5,a5,-1
80407e50:	00095717          	auipc	a4,0x95
80407e54:	96f72423          	sw	a5,-1688(a4) # 8049c7b8 <nr_process>
80407e58:	08059a63          	bnez	a1,80407eec <do_wait.part.8+0x1d4>
80407e5c:	00c42683          	lw	a3,12(s0)
80407e60:	804007b7          	lui	a5,0x80400
80407e64:	0ef6e063          	bltu	a3,a5,80407f44 <do_wait.part.8+0x22c>
80407e68:	00095797          	auipc	a5,0x95
80407e6c:	99878793          	addi	a5,a5,-1640 # 8049c800 <va_pa_offset>
80407e70:	0007a703          	lw	a4,0(a5)
80407e74:	00095797          	auipc	a5,0x95
80407e78:	92478793          	addi	a5,a5,-1756 # 8049c798 <npage>
80407e7c:	0007a783          	lw	a5,0(a5)
80407e80:	40e686b3          	sub	a3,a3,a4
80407e84:	00c6d693          	srli	a3,a3,0xc
80407e88:	0af6f263          	bgeu	a3,a5,80407f2c <do_wait.part.8+0x214>
80407e8c:	0000f797          	auipc	a5,0xf
80407e90:	b9878793          	addi	a5,a5,-1128 # 80416a24 <nbase>
80407e94:	0007a783          	lw	a5,0(a5)
80407e98:	00095717          	auipc	a4,0x95
80407e9c:	97070713          	addi	a4,a4,-1680 # 8049c808 <pages>
80407ea0:	00072503          	lw	a0,0(a4)
80407ea4:	40f686b3          	sub	a3,a3,a5
80407ea8:	00569693          	slli	a3,a3,0x5
80407eac:	00d50533          	add	a0,a0,a3
80407eb0:	00200593          	li	a1,2
80407eb4:	820fb0ef          	jal	ra,80402ed4 <free_pages>
80407eb8:	00040513          	mv	a0,s0
80407ebc:	cf5fa0ef          	jal	ra,80402bb0 <kfree>
80407ec0:	00000513          	li	a0,0
80407ec4:	01c12083          	lw	ra,28(sp)
80407ec8:	01812403          	lw	s0,24(sp)
80407ecc:	01412483          	lw	s1,20(sp)
80407ed0:	01012903          	lw	s2,16(sp)
80407ed4:	00c12983          	lw	s3,12(sp)
80407ed8:	00812a03          	lw	s4,8(sp)
80407edc:	00412a83          	lw	s5,4(sp)
80407ee0:	00012b03          	lw	s6,0(sp)
80407ee4:	02010113          	addi	sp,sp,32
80407ee8:	00008067          	ret
80407eec:	dc5f80ef          	jal	ra,80400cb0 <intr_enable>
80407ef0:	f6dff06f          	j	80407e5c <do_wait.part.8+0x144>
80407ef4:	01442783          	lw	a5,20(s0)
80407ef8:	0ae7a623          	sw	a4,172(a5)
80407efc:	f45ff06f          	j	80407e40 <do_wait.part.8+0x128>
80407f00:	ffe00513          	li	a0,-2
80407f04:	fc1ff06f          	j	80407ec4 <do_wait.part.8+0x1ac>
80407f08:	db1f80ef          	jal	ra,80400cb8 <intr_disable>
80407f0c:	00100593          	li	a1,1
80407f10:	ef5ff06f          	j	80407e04 <do_wait.part.8+0xec>
80407f14:	0000d617          	auipc	a2,0xd
80407f18:	e9c60613          	addi	a2,a2,-356 # 80414db0 <CSWTCH.69+0x848>
80407f1c:	3cc00593          	li	a1,972
80407f20:	0000d517          	auipc	a0,0xd
80407f24:	0e050513          	addi	a0,a0,224 # 80415000 <CSWTCH.69+0xa98>
80407f28:	efcf80ef          	jal	ra,80400624 <__panic>
80407f2c:	0000c617          	auipc	a2,0xc
80407f30:	dc460613          	addi	a2,a2,-572 # 80413cf0 <default_pmm_manager+0x88>
80407f34:	06900593          	li	a1,105
80407f38:	0000c517          	auipc	a0,0xc
80407f3c:	d8450513          	addi	a0,a0,-636 # 80413cbc <default_pmm_manager+0x54>
80407f40:	ee4f80ef          	jal	ra,80400624 <__panic>
80407f44:	0000c617          	auipc	a2,0xc
80407f48:	d8860613          	addi	a2,a2,-632 # 80413ccc <default_pmm_manager+0x64>
80407f4c:	07000593          	li	a1,112
80407f50:	0000c517          	auipc	a0,0xc
80407f54:	d6c50513          	addi	a0,a0,-660 # 80413cbc <default_pmm_manager+0x54>
80407f58:	eccf80ef          	jal	ra,80400624 <__panic>

80407f5c <init_main>:
80407f5c:	6b7377b7          	lui	a5,0x6b737
80407f60:	fe010113          	addi	sp,sp,-32
80407f64:	96478793          	addi	a5,a5,-1692 # 6b736964 <_binary_bin_sfs_img_size+0x6b6be964>
80407f68:	00f12423          	sw	a5,8(sp)
80407f6c:	000047b7          	lui	a5,0x4
80407f70:	a3078793          	addi	a5,a5,-1488 # 3a30 <_binary_bin_swap_img_size-0x45d0>
80407f74:	00810513          	addi	a0,sp,8
80407f78:	00112e23          	sw	ra,28(sp)
80407f7c:	00f11623          	sh	a5,12(sp)
80407f80:	00010723          	sb	zero,14(sp)
80407f84:	455050ef          	jal	ra,8040dbd8 <vfs_set_bootfs>
80407f88:	0e051a63          	bnez	a0,8040807c <init_main+0x120>
80407f8c:	fb5fa0ef          	jal	ra,80402f40 <nr_free_pages>
80407f90:	af5fa0ef          	jal	ra,80402a84 <kallocated>
80407f94:	00000613          	li	a2,0
80407f98:	00000593          	li	a1,0
80407f9c:	fffff517          	auipc	a0,0xfffff
80407fa0:	20c50513          	addi	a0,a0,524 # 804071a8 <user_main>
80407fa4:	abdff0ef          	jal	ra,80407a60 <kernel_thread>
80407fa8:	00a04663          	bgtz	a0,80407fb4 <init_main+0x58>
80407fac:	0b80006f          	j	80408064 <init_main+0x108>
80407fb0:	4fd040ef          	jal	ra,8040ccac <schedule>
80407fb4:	00000593          	li	a1,0
80407fb8:	00000513          	li	a0,0
80407fbc:	d5dff0ef          	jal	ra,80407d18 <do_wait.part.8>
80407fc0:	fe0508e3          	beqz	a0,80407fb0 <init_main+0x54>
80407fc4:	bdcfe0ef          	jal	ra,804063a0 <fs_cleanup>
80407fc8:	0000d517          	auipc	a0,0xd
80407fcc:	e3c50513          	addi	a0,a0,-452 # 80414e04 <CSWTCH.69+0x89c>
80407fd0:	a2cf80ef          	jal	ra,804001fc <cprintf>
80407fd4:	00094797          	auipc	a5,0x94
80407fd8:	7e078793          	addi	a5,a5,2016 # 8049c7b4 <initproc>
80407fdc:	0007a783          	lw	a5,0(a5)
80407fe0:	0ac7a703          	lw	a4,172(a5)
80407fe4:	06071063          	bnez	a4,80408044 <init_main+0xe8>
80407fe8:	0b07a703          	lw	a4,176(a5)
80407fec:	04071c63          	bnez	a4,80408044 <init_main+0xe8>
80407ff0:	0b47a703          	lw	a4,180(a5)
80407ff4:	04071863          	bnez	a4,80408044 <init_main+0xe8>
80407ff8:	00094717          	auipc	a4,0x94
80407ffc:	7c070713          	addi	a4,a4,1984 # 8049c7b8 <nr_process>
80408000:	00072683          	lw	a3,0(a4)
80408004:	00200713          	li	a4,2
80408008:	0ce69863          	bne	a3,a4,804080d8 <init_main+0x17c>
8040800c:	00095697          	auipc	a3,0x95
80408010:	8a868693          	addi	a3,a3,-1880 # 8049c8b4 <proc_list>
80408014:	0046a703          	lw	a4,4(a3)
80408018:	09478793          	addi	a5,a5,148
8040801c:	08f71e63          	bne	a4,a5,804080b8 <init_main+0x15c>
80408020:	0006a783          	lw	a5,0(a3)
80408024:	06f71a63          	bne	a4,a5,80408098 <init_main+0x13c>
80408028:	0000d517          	auipc	a0,0xd
8040802c:	ebc50513          	addi	a0,a0,-324 # 80414ee4 <CSWTCH.69+0x97c>
80408030:	9ccf80ef          	jal	ra,804001fc <cprintf>
80408034:	01c12083          	lw	ra,28(sp)
80408038:	00000513          	li	a0,0
8040803c:	02010113          	addi	sp,sp,32
80408040:	00008067          	ret
80408044:	0000d697          	auipc	a3,0xd
80408048:	de468693          	addi	a3,a3,-540 # 80414e28 <CSWTCH.69+0x8c0>
8040804c:	0000b617          	auipc	a2,0xb
80408050:	0e060613          	addi	a2,a2,224 # 8041312c <commands+0x1f8>
80408054:	44000593          	li	a1,1088
80408058:	0000d517          	auipc	a0,0xd
8040805c:	fa850513          	addi	a0,a0,-88 # 80415000 <CSWTCH.69+0xa98>
80408060:	dc4f80ef          	jal	ra,80400624 <__panic>
80408064:	0000d617          	auipc	a2,0xd
80408068:	d8460613          	addi	a2,a2,-636 # 80414de8 <CSWTCH.69+0x880>
8040806c:	43400593          	li	a1,1076
80408070:	0000d517          	auipc	a0,0xd
80408074:	f9050513          	addi	a0,a0,-112 # 80415000 <CSWTCH.69+0xa98>
80408078:	dacf80ef          	jal	ra,80400624 <__panic>
8040807c:	00050693          	mv	a3,a0
80408080:	0000d617          	auipc	a2,0xd
80408084:	d4c60613          	addi	a2,a2,-692 # 80414dcc <CSWTCH.69+0x864>
80408088:	42c00593          	li	a1,1068
8040808c:	0000d517          	auipc	a0,0xd
80408090:	f7450513          	addi	a0,a0,-140 # 80415000 <CSWTCH.69+0xa98>
80408094:	d90f80ef          	jal	ra,80400624 <__panic>
80408098:	0000d697          	auipc	a3,0xd
8040809c:	e1c68693          	addi	a3,a3,-484 # 80414eb4 <CSWTCH.69+0x94c>
804080a0:	0000b617          	auipc	a2,0xb
804080a4:	08c60613          	addi	a2,a2,140 # 8041312c <commands+0x1f8>
804080a8:	44300593          	li	a1,1091
804080ac:	0000d517          	auipc	a0,0xd
804080b0:	f5450513          	addi	a0,a0,-172 # 80415000 <CSWTCH.69+0xa98>
804080b4:	d70f80ef          	jal	ra,80400624 <__panic>
804080b8:	0000d697          	auipc	a3,0xd
804080bc:	dcc68693          	addi	a3,a3,-564 # 80414e84 <CSWTCH.69+0x91c>
804080c0:	0000b617          	auipc	a2,0xb
804080c4:	06c60613          	addi	a2,a2,108 # 8041312c <commands+0x1f8>
804080c8:	44200593          	li	a1,1090
804080cc:	0000d517          	auipc	a0,0xd
804080d0:	f3450513          	addi	a0,a0,-204 # 80415000 <CSWTCH.69+0xa98>
804080d4:	d50f80ef          	jal	ra,80400624 <__panic>
804080d8:	0000d697          	auipc	a3,0xd
804080dc:	d9c68693          	addi	a3,a3,-612 # 80414e74 <CSWTCH.69+0x90c>
804080e0:	0000b617          	auipc	a2,0xb
804080e4:	04c60613          	addi	a2,a2,76 # 8041312c <commands+0x1f8>
804080e8:	44100593          	li	a1,1089
804080ec:	0000d517          	auipc	a0,0xd
804080f0:	f1450513          	addi	a0,a0,-236 # 80415000 <CSWTCH.69+0xa98>
804080f4:	d30f80ef          	jal	ra,80400624 <__panic>

804080f8 <do_execve>:
804080f8:	e9010113          	addi	sp,sp,-368
804080fc:	15412c23          	sw	s4,344(sp)
80408100:	00094a17          	auipc	s4,0x94
80408104:	6aca0a13          	addi	s4,s4,1708 # 8049c7ac <current>
80408108:	000a2783          	lw	a5,0(s4)
8040810c:	15312e23          	sw	s3,348(sp)
80408110:	00058993          	mv	s3,a1
80408114:	0047a583          	lw	a1,4(a5)
80408118:	16812423          	sw	s0,360(sp)
8040811c:	15a12023          	sw	s10,320(sp)
80408120:	00050413          	mv	s0,a0
80408124:	00060d13          	mv	s10,a2
80408128:	0000d517          	auipc	a0,0xd
8040812c:	88850513          	addi	a0,a0,-1912 # 804149b0 <CSWTCH.69+0x448>
80408130:	00098613          	mv	a2,s3
80408134:	16112623          	sw	ra,364(sp)
80408138:	16912223          	sw	s1,356(sp)
8040813c:	17212023          	sw	s2,352(sp)
80408140:	15512a23          	sw	s5,340(sp)
80408144:	15612823          	sw	s6,336(sp)
80408148:	15712623          	sw	s7,332(sp)
8040814c:	15812423          	sw	s8,328(sp)
80408150:	15912223          	sw	s9,324(sp)
80408154:	13b12e23          	sw	s11,316(sp)
80408158:	8a4f80ef          	jal	ra,804001fc <cprintf>
8040815c:	01305a63          	blez	s3,80408170 <do_execve+0x78>
80408160:	000d2583          	lw	a1,0(s10)
80408164:	0000d517          	auipc	a0,0xd
80408168:	87450513          	addi	a0,a0,-1932 # 804149d8 <CSWTCH.69+0x470>
8040816c:	890f80ef          	jal	ra,804001fc <cprintf>
80408170:	000a2683          	lw	a3,0(s4)
80408174:	fff98793          	addi	a5,s3,-1
80408178:	01f00713          	li	a4,31
8040817c:	0186ab03          	lw	s6,24(a3)
80408180:	10f766e3          	bltu	a4,a5,80408a8c <do_execve+0x994>
80408184:	03300613          	li	a2,51
80408188:	00000593          	li	a1,0
8040818c:	04810513          	addi	a0,sp,72
80408190:	3310a0ef          	jal	ra,80412cc0 <memset>
80408194:	000b0e63          	beqz	s6,804081b0 <do_execve+0xb8>
80408198:	01cb0513          	addi	a0,s6,28
8040819c:	8a0fd0ef          	jal	ra,8040523c <down>
804081a0:	000a2783          	lw	a5,0(s4)
804081a4:	00078663          	beqz	a5,804081b0 <do_execve+0xb8>
804081a8:	0047a783          	lw	a5,4(a5)
804081ac:	02fb2423          	sw	a5,40(s6)
804081b0:	26040063          	beqz	s0,80408410 <do_execve+0x318>
804081b4:	03300693          	li	a3,51
804081b8:	00040613          	mv	a2,s0
804081bc:	04810593          	addi	a1,sp,72
804081c0:	000b0513          	mv	a0,s6
804081c4:	d89fc0ef          	jal	ra,80404f4c <copy_string>
804081c8:	0a050ce3          	beqz	a0,80408a80 <do_execve+0x988>
804081cc:	00299493          	slli	s1,s3,0x2
804081d0:	00000693          	li	a3,0
804081d4:	00048613          	mv	a2,s1
804081d8:	000d0593          	mv	a1,s10
804081dc:	000b0513          	mv	a0,s6
804081e0:	000d0b93          	mv	s7,s10
804081e4:	bd5fc0ef          	jal	ra,80404db8 <user_mem_check>
804081e8:	08050ce3          	beqz	a0,80408a80 <do_execve+0x988>
804081ec:	0b010913          	addi	s2,sp,176
804081f0:	00090c93          	mv	s9,s2
804081f4:	00000413          	li	s0,0
804081f8:	00001537          	lui	a0,0x1
804081fc:	891fa0ef          	jal	ra,80402a8c <kmalloc>
80408200:	00050a93          	mv	s5,a0
80408204:	18050063          	beqz	a0,80408384 <do_execve+0x28c>
80408208:	000ba603          	lw	a2,0(s7)
8040820c:	00050593          	mv	a1,a0
80408210:	000016b7          	lui	a3,0x1
80408214:	000b0513          	mv	a0,s6
80408218:	d35fc0ef          	jal	ra,80404f4c <copy_string>
8040821c:	1e050263          	beqz	a0,80408400 <do_execve+0x308>
80408220:	015ca023          	sw	s5,0(s9)
80408224:	00140413          	addi	s0,s0,1
80408228:	004c8c93          	addi	s9,s9,4
8040822c:	004b8b93          	addi	s7,s7,4
80408230:	fc8994e3          	bne	s3,s0,804081f8 <do_execve+0x100>
80408234:	000d2a83          	lw	s5,0(s10)
80408238:	100b0663          	beqz	s6,80408344 <do_execve+0x24c>
8040823c:	01cb0513          	addi	a0,s6,28
80408240:	ff9fc0ef          	jal	ra,80405238 <up>
80408244:	000a2783          	lw	a5,0(s4)
80408248:	020b2423          	sw	zero,40(s6)
8040824c:	0dc7a503          	lw	a0,220(a5)
80408250:	a84fe0ef          	jal	ra,804064d4 <files_closeall>
80408254:	0000c517          	auipc	a0,0xc
80408258:	7cc50513          	addi	a0,a0,1996 # 80414a20 <CSWTCH.69+0x4b8>
8040825c:	fa1f70ef          	jal	ra,804001fc <cprintf>
80408260:	00000593          	li	a1,0
80408264:	000a8513          	mv	a0,s5
80408268:	e40fe0ef          	jal	ra,804068a8 <sysfile_open>
8040826c:	00050b93          	mv	s7,a0
80408270:	060548e3          	bltz	a0,80408ae0 <do_execve+0x9e8>
80408274:	00050593          	mv	a1,a0
80408278:	0000c517          	auipc	a0,0xc
8040827c:	7fc50513          	addi	a0,a0,2044 # 80414a74 <CSWTCH.69+0x50c>
80408280:	f7df70ef          	jal	ra,804001fc <cprintf>
80408284:	00094797          	auipc	a5,0x94
80408288:	58078793          	addi	a5,a5,1408 # 8049c804 <boot_cr3>
8040828c:	0007a783          	lw	a5,0(a5)
80408290:	80000737          	lui	a4,0x80000
80408294:	00c7d793          	srli	a5,a5,0xc
80408298:	00e7e7b3          	or	a5,a5,a4
8040829c:	18079073          	csrw	satp,a5
804082a0:	12000073          	sfence.vma
804082a4:	018b2783          	lw	a5,24(s6)
804082a8:	fff78793          	addi	a5,a5,-1
804082ac:	00fb2c23          	sw	a5,24(s6)
804082b0:	48078463          	beqz	a5,80408738 <do_execve+0x640>
804082b4:	000a2783          	lw	a5,0(s4)
804082b8:	0007ac23          	sw	zero,24(a5)
804082bc:	0000d517          	auipc	a0,0xd
804082c0:	a6050513          	addi	a0,a0,-1440 # 80414d1c <CSWTCH.69+0x7b4>
804082c4:	f39f70ef          	jal	ra,804001fc <cprintf>
804082c8:	000a2783          	lw	a5,0(s4)
804082cc:	0187a783          	lw	a5,24(a5)
804082d0:	100794e3          	bnez	a5,80408bd8 <do_execve+0xae0>
804082d4:	c94fc0ef          	jal	ra,80404768 <mm_create>
804082d8:	00050b13          	mv	s6,a0
804082dc:	00050c63          	beqz	a0,804082f4 <do_execve+0x1fc>
804082e0:	00c50513          	addi	a0,a0,12
804082e4:	f79fe0ef          	jal	ra,8040725c <setup_pgdir.isra.4>
804082e8:	14050463          	beqz	a0,80408430 <do_execve+0x338>
804082ec:	000b0513          	mv	a0,s6
804082f0:	e3cfc0ef          	jal	ra,8040492c <mm_destroy>
804082f4:	ffc00a93          	li	s5,-4
804082f8:	000a8593          	mv	a1,s5
804082fc:	0000d517          	auipc	a0,0xd
80408300:	9ac50513          	addi	a0,a0,-1620 # 80414ca8 <CSWTCH.69+0x740>
80408304:	ef9f70ef          	jal	ra,804001fc <cprintf>
80408308:	000a8b93          	mv	s7,s5
8040830c:	000b8593          	mv	a1,s7
80408310:	0000d517          	auipc	a0,0xd
80408314:	9e450513          	addi	a0,a0,-1564 # 80414cf4 <CSWTCH.69+0x78c>
80408318:	ffc48413          	addi	s0,s1,-4
8040831c:	ee1f70ef          	jal	ra,804001fc <cprintf>
80408320:	00890433          	add	s0,s2,s0
80408324:	0080006f          	j	8040832c <do_execve+0x234>
80408328:	00078413          	mv	s0,a5
8040832c:	00042503          	lw	a0,0(s0)
80408330:	881fa0ef          	jal	ra,80402bb0 <kfree>
80408334:	ffc40793          	addi	a5,s0,-4
80408338:	fe8918e3          	bne	s2,s0,80408328 <do_execve+0x230>
8040833c:	000b8513          	mv	a0,s7
80408340:	f9cff0ef          	jal	ra,80407adc <do_exit>
80408344:	000a2783          	lw	a5,0(s4)
80408348:	0dc7a503          	lw	a0,220(a5)
8040834c:	988fe0ef          	jal	ra,804064d4 <files_closeall>
80408350:	0000c517          	auipc	a0,0xc
80408354:	6d050513          	addi	a0,a0,1744 # 80414a20 <CSWTCH.69+0x4b8>
80408358:	ea5f70ef          	jal	ra,804001fc <cprintf>
8040835c:	00000593          	li	a1,0
80408360:	000a8513          	mv	a0,s5
80408364:	d44fe0ef          	jal	ra,804068a8 <sysfile_open>
80408368:	00050b93          	mv	s7,a0
8040836c:	76054a63          	bltz	a0,80408ae0 <do_execve+0x9e8>
80408370:	00050593          	mv	a1,a0
80408374:	0000c517          	auipc	a0,0xc
80408378:	70050513          	addi	a0,a0,1792 # 80414a74 <CSWTCH.69+0x50c>
8040837c:	e81f70ef          	jal	ra,804001fc <cprintf>
80408380:	f3dff06f          	j	804082bc <do_execve+0x1c4>
80408384:	ffc00a93          	li	s5,-4
80408388:	02040463          	beqz	s0,804083b0 <do_execve+0x2b8>
8040838c:	fff40413          	addi	s0,s0,-1
80408390:	00241413          	slli	s0,s0,0x2
80408394:	00890433          	add	s0,s2,s0
80408398:	0080006f          	j	804083a0 <do_execve+0x2a8>
8040839c:	00078413          	mv	s0,a5
804083a0:	00042503          	lw	a0,0(s0)
804083a4:	80dfa0ef          	jal	ra,80402bb0 <kfree>
804083a8:	ffc40793          	addi	a5,s0,-4
804083ac:	fe8918e3          	bne	s2,s0,8040839c <do_execve+0x2a4>
804083b0:	000b0863          	beqz	s6,804083c0 <do_execve+0x2c8>
804083b4:	01cb0513          	addi	a0,s6,28
804083b8:	e81fc0ef          	jal	ra,80405238 <up>
804083bc:	020b2423          	sw	zero,40(s6)
804083c0:	16c12083          	lw	ra,364(sp)
804083c4:	16812403          	lw	s0,360(sp)
804083c8:	000a8513          	mv	a0,s5
804083cc:	16412483          	lw	s1,356(sp)
804083d0:	16012903          	lw	s2,352(sp)
804083d4:	15c12983          	lw	s3,348(sp)
804083d8:	15812a03          	lw	s4,344(sp)
804083dc:	15412a83          	lw	s5,340(sp)
804083e0:	15012b03          	lw	s6,336(sp)
804083e4:	14c12b83          	lw	s7,332(sp)
804083e8:	14812c03          	lw	s8,328(sp)
804083ec:	14412c83          	lw	s9,324(sp)
804083f0:	14012d03          	lw	s10,320(sp)
804083f4:	13c12d83          	lw	s11,316(sp)
804083f8:	17010113          	addi	sp,sp,368
804083fc:	00008067          	ret
80408400:	000a8513          	mv	a0,s5
80408404:	facfa0ef          	jal	ra,80402bb0 <kfree>
80408408:	ffd00a93          	li	s5,-3
8040840c:	f7dff06f          	j	80408388 <do_execve+0x290>
80408410:	000a2783          	lw	a5,0(s4)
80408414:	0000c617          	auipc	a2,0xc
80408418:	60060613          	addi	a2,a2,1536 # 80414a14 <CSWTCH.69+0x4ac>
8040841c:	03300593          	li	a1,51
80408420:	0047a683          	lw	a3,4(a5)
80408424:	04810513          	addi	a0,sp,72
80408428:	77c0a0ef          	jal	ra,80412ba4 <snprintf>
8040842c:	da1ff06f          	j	804081cc <do_execve+0xd4>
80408430:	00000693          	li	a3,0
80408434:	03400613          	li	a2,52
80408438:	07c10593          	addi	a1,sp,124
8040843c:	000b8513          	mv	a0,s7
80408440:	cd1fe0ef          	jal	ra,80407110 <load_icode_read>
80408444:	00050a93          	mv	s5,a0
80408448:	28051463          	bnez	a0,804086d0 <do_execve+0x5d8>
8040844c:	07c12703          	lw	a4,124(sp)
80408450:	464c47b7          	lui	a5,0x464c4
80408454:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644c57f>
80408458:	26f71a63          	bne	a4,a5,804086cc <do_execve+0x5d4>
8040845c:	0a815783          	lhu	a5,168(sp)
80408460:	00012e23          	sw	zero,28(sp)
80408464:	04078c63          	beqz	a5,804084bc <do_execve+0x3c4>
80408468:	001007b7          	lui	a5,0x100
8040846c:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
80408470:	00f12c23          	sw	a5,24(sp)
80408474:	01c12783          	lw	a5,28(sp)
80408478:	09812683          	lw	a3,152(sp)
8040847c:	02000613          	li	a2,32
80408480:	00579793          	slli	a5,a5,0x5
80408484:	00d786b3          	add	a3,a5,a3
80408488:	02810593          	addi	a1,sp,40
8040848c:	000b8513          	mv	a0,s7
80408490:	c81fe0ef          	jal	ra,80407110 <load_icode_read>
80408494:	00050a93          	mv	s5,a0
80408498:	46051263          	bnez	a0,804088fc <do_execve+0x804>
8040849c:	02812703          	lw	a4,40(sp)
804084a0:	00100793          	li	a5,1
804084a4:	30f70263          	beq	a4,a5,804087a8 <do_execve+0x6b0>
804084a8:	01c12703          	lw	a4,28(sp)
804084ac:	0a815783          	lhu	a5,168(sp)
804084b0:	00170713          	addi	a4,a4,1 # 80000001 <end+0xffb63745>
804084b4:	00e12e23          	sw	a4,28(sp)
804084b8:	faf76ee3          	bltu	a4,a5,80408474 <do_execve+0x37c>
804084bc:	000b8513          	mv	a0,s7
804084c0:	c40fe0ef          	jal	ra,80406900 <sysfile_close>
804084c4:	00000713          	li	a4,0
804084c8:	00b00693          	li	a3,11
804084cc:	00100637          	lui	a2,0x100
804084d0:	7ff005b7          	lui	a1,0x7ff00
804084d4:	000b0513          	mv	a0,s6
804084d8:	cc8fc0ef          	jal	ra,804049a0 <mm_map>
804084dc:	00050a93          	mv	s5,a0
804084e0:	40051e63          	bnez	a0,804088fc <do_execve+0x804>
804084e4:	00cb2503          	lw	a0,12(s6)
804084e8:	01f00613          	li	a2,31
804084ec:	7ffff5b7          	lui	a1,0x7ffff
804084f0:	b4cfb0ef          	jal	ra,8040383c <pgdir_alloc_page>
804084f4:	6a050663          	beqz	a0,80408ba0 <do_execve+0xaa8>
804084f8:	00cb2503          	lw	a0,12(s6)
804084fc:	01f00613          	li	a2,31
80408500:	7fffe5b7          	lui	a1,0x7fffe
80408504:	b38fb0ef          	jal	ra,8040383c <pgdir_alloc_page>
80408508:	66050c63          	beqz	a0,80408b80 <do_execve+0xa88>
8040850c:	00cb2503          	lw	a0,12(s6)
80408510:	01f00613          	li	a2,31
80408514:	7fffd5b7          	lui	a1,0x7fffd
80408518:	b24fb0ef          	jal	ra,8040383c <pgdir_alloc_page>
8040851c:	64050263          	beqz	a0,80408b60 <do_execve+0xa68>
80408520:	00cb2503          	lw	a0,12(s6)
80408524:	01f00613          	li	a2,31
80408528:	7fffc5b7          	lui	a1,0x7fffc
8040852c:	b10fb0ef          	jal	ra,8040383c <pgdir_alloc_page>
80408530:	60050863          	beqz	a0,80408b40 <do_execve+0xa48>
80408534:	018b2783          	lw	a5,24(s6)
80408538:	000a2703          	lw	a4,0(s4)
8040853c:	00cb2683          	lw	a3,12(s6)
80408540:	00178793          	addi	a5,a5,1
80408544:	00fb2c23          	sw	a5,24(s6)
80408548:	01672c23          	sw	s6,24(a4)
8040854c:	804007b7          	lui	a5,0x80400
80408550:	5cf6ec63          	bltu	a3,a5,80408b28 <do_execve+0xa30>
80408554:	00094797          	auipc	a5,0x94
80408558:	2ac78793          	addi	a5,a5,684 # 8049c800 <va_pa_offset>
8040855c:	0007a783          	lw	a5,0(a5)
80408560:	40f686b3          	sub	a3,a3,a5
80408564:	00c6d793          	srli	a5,a3,0xc
80408568:	04d72c23          	sw	a3,88(a4)
8040856c:	80000737          	lui	a4,0x80000
80408570:	00e7e7b3          	or	a5,a5,a4
80408574:	18079073          	csrw	satp,a5
80408578:	12000073          	sfence.vma
8040857c:	00000b93          	li	s7,0
80408580:	00090c93          	mv	s9,s2
80408584:	00000c13          	li	s8,0
80408588:	000ca503          	lw	a0,0(s9)
8040858c:	000015b7          	lui	a1,0x1
80408590:	001c0c13          	addi	s8,s8,1
80408594:	6780a0ef          	jal	ra,80412c0c <strnlen>
80408598:	00150513          	addi	a0,a0,1
8040859c:	00ab8bb3          	add	s7,s7,a0
804085a0:	004c8c93          	addi	s9,s9,4
804085a4:	ff3c62e3          	bltu	s8,s3,80408588 <do_execve+0x490>
804085a8:	fffbcb93          	not	s7,s7
804085ac:	800007b7          	lui	a5,0x80000
804085b0:	ffcbfb93          	andi	s7,s7,-4
804085b4:	00fb8bb3          	add	s7,s7,a5
804085b8:	409b87b3          	sub	a5,s7,s1
804085bc:	00f12823          	sw	a5,16(sp)
804085c0:	412787b3          	sub	a5,a5,s2
804085c4:	00090d93          	mv	s11,s2
804085c8:	00000d13          	li	s10,0
804085cc:	00000c13          	li	s8,0
804085d0:	00f12623          	sw	a5,12(sp)
804085d4:	000dac83          	lw	s9,0(s11)
804085d8:	018b8533          	add	a0,s7,s8
804085dc:	001d0d13          	addi	s10,s10,1
804085e0:	000c8593          	mv	a1,s9
804085e4:	6640a0ef          	jal	ra,80412c48 <strcpy>
804085e8:	00c12783          	lw	a5,12(sp)
804085ec:	000015b7          	lui	a1,0x1
804085f0:	01b786b3          	add	a3,a5,s11
804085f4:	00a6a023          	sw	a0,0(a3) # 1000 <_binary_bin_swap_img_size-0x7000>
804085f8:	000c8513          	mv	a0,s9
804085fc:	6100a0ef          	jal	ra,80412c0c <strnlen>
80408600:	01850c33          	add	s8,a0,s8
80408604:	001c0c13          	addi	s8,s8,1
80408608:	004d8d93          	addi	s11,s11,4
8040860c:	fd3d64e3          	bltu	s10,s3,804085d4 <do_execve+0x4dc>
80408610:	000a2783          	lw	a5,0(s4)
80408614:	01012703          	lw	a4,16(sp)
80408618:	09000613          	li	a2,144
8040861c:	00000593          	li	a1,0
80408620:	fe872e23          	sw	s0,-4(a4) # 7ffffffc <end+0xffb63740>
80408624:	0547a403          	lw	s0,84(a5) # 80000054 <end+0xffb63798>
80408628:	ffc70c93          	addi	s9,a4,-4
8040862c:	00040513          	mv	a0,s0
80408630:	08042983          	lw	s3,128(s0)
80408634:	68c0a0ef          	jal	ra,80412cc0 <memset>
80408638:	09412783          	lw	a5,148(sp)
8040863c:	00cb2503          	lw	a0,12(s6)
80408640:	edf9f993          	andi	s3,s3,-289
80408644:	01942423          	sw	s9,8(s0)
80408648:	08f42223          	sw	a5,132(s0)
8040864c:	09342023          	sw	s3,128(s0)
80408650:	00000613          	li	a2,0
80408654:	008005b7          	lui	a1,0x800
80408658:	949fa0ef          	jal	ra,80402fa0 <get_pte>
8040865c:	46050c63          	beqz	a0,80408ad4 <do_execve+0x9dc>
80408660:	00052683          	lw	a3,0(a0)
80408664:	000a2703          	lw	a4,0(s4)
80408668:	0016f793          	andi	a5,a3,1
8040866c:	00472583          	lw	a1,4(a4)
80408670:	44079063          	bnez	a5,80408ab0 <do_execve+0x9b8>
80408674:	0000c517          	auipc	a0,0xc
80408678:	5e050513          	addi	a0,a0,1504 # 80414c54 <CSWTCH.69+0x6ec>
8040867c:	b81f70ef          	jal	ra,804001fc <cprintf>
80408680:	12000073          	sfence.vma
80408684:	0000c517          	auipc	a0,0xc
80408688:	60050513          	addi	a0,a0,1536 # 80414c84 <CSWTCH.69+0x71c>
8040868c:	ffc48493          	addi	s1,s1,-4
80408690:	b6df70ef          	jal	ra,804001fc <cprintf>
80408694:	009904b3          	add	s1,s2,s1
80408698:	0080006f          	j	804086a0 <do_execve+0x5a8>
8040869c:	00078493          	mv	s1,a5
804086a0:	0004a503          	lw	a0,0(s1)
804086a4:	d0cfa0ef          	jal	ra,80402bb0 <kfree>
804086a8:	ffc48793          	addi	a5,s1,-4
804086ac:	fe9918e3          	bne	s2,s1,8040869c <do_execve+0x5a4>
804086b0:	000a2503          	lw	a0,0(s4)
804086b4:	04810593          	addi	a1,sp,72
804086b8:	cb1fe0ef          	jal	ra,80407368 <set_proc_name>
804086bc:	0000c517          	auipc	a0,0xc
804086c0:	61050513          	addi	a0,a0,1552 # 80414ccc <CSWTCH.69+0x764>
804086c4:	b39f70ef          	jal	ra,804001fc <cprintf>
804086c8:	cf9ff06f          	j	804083c0 <do_execve+0x2c8>
804086cc:	ff800a93          	li	s5,-8
804086d0:	00cb2683          	lw	a3,12(s6)
804086d4:	804007b7          	lui	a5,0x80400
804086d8:	50f6ec63          	bltu	a3,a5,80408bf0 <do_execve+0xaf8>
804086dc:	00094797          	auipc	a5,0x94
804086e0:	12478793          	addi	a5,a5,292 # 8049c800 <va_pa_offset>
804086e4:	0007a703          	lw	a4,0(a5)
804086e8:	00094797          	auipc	a5,0x94
804086ec:	0b078793          	addi	a5,a5,176 # 8049c798 <npage>
804086f0:	0007a783          	lw	a5,0(a5)
804086f4:	40e686b3          	sub	a3,a3,a4
804086f8:	00c6d693          	srli	a3,a3,0xc
804086fc:	4cf6f263          	bgeu	a3,a5,80408bc0 <do_execve+0xac8>
80408700:	0000e797          	auipc	a5,0xe
80408704:	32478793          	addi	a5,a5,804 # 80416a24 <nbase>
80408708:	0007a783          	lw	a5,0(a5)
8040870c:	00094717          	auipc	a4,0x94
80408710:	0fc70713          	addi	a4,a4,252 # 8049c808 <pages>
80408714:	00072503          	lw	a0,0(a4)
80408718:	40f686b3          	sub	a3,a3,a5
8040871c:	00569693          	slli	a3,a3,0x5
80408720:	00d50533          	add	a0,a0,a3
80408724:	00100593          	li	a1,1
80408728:	facfa0ef          	jal	ra,80402ed4 <free_pages>
8040872c:	000b0513          	mv	a0,s6
80408730:	9fcfc0ef          	jal	ra,8040492c <mm_destroy>
80408734:	bc5ff06f          	j	804082f8 <do_execve+0x200>
80408738:	000b0513          	mv	a0,s6
8040873c:	c3cfc0ef          	jal	ra,80404b78 <exit_mmap>
80408740:	00cb2683          	lw	a3,12(s6)
80408744:	804007b7          	lui	a5,0x80400
80408748:	4af6e463          	bltu	a3,a5,80408bf0 <do_execve+0xaf8>
8040874c:	00094797          	auipc	a5,0x94
80408750:	0b478793          	addi	a5,a5,180 # 8049c800 <va_pa_offset>
80408754:	0007a703          	lw	a4,0(a5)
80408758:	00094797          	auipc	a5,0x94
8040875c:	04078793          	addi	a5,a5,64 # 8049c798 <npage>
80408760:	0007a783          	lw	a5,0(a5)
80408764:	40e686b3          	sub	a3,a3,a4
80408768:	00c6d693          	srli	a3,a3,0xc
8040876c:	44f6fa63          	bgeu	a3,a5,80408bc0 <do_execve+0xac8>
80408770:	0000e797          	auipc	a5,0xe
80408774:	2b478793          	addi	a5,a5,692 # 80416a24 <nbase>
80408778:	0007a783          	lw	a5,0(a5)
8040877c:	00094717          	auipc	a4,0x94
80408780:	08c70713          	addi	a4,a4,140 # 8049c808 <pages>
80408784:	00072503          	lw	a0,0(a4)
80408788:	40f686b3          	sub	a3,a3,a5
8040878c:	00569693          	slli	a3,a3,0x5
80408790:	00d50533          	add	a0,a0,a3
80408794:	00100593          	li	a1,1
80408798:	f3cfa0ef          	jal	ra,80402ed4 <free_pages>
8040879c:	000b0513          	mv	a0,s6
804087a0:	98cfc0ef          	jal	ra,8040492c <mm_destroy>
804087a4:	b11ff06f          	j	804082b4 <do_execve+0x1bc>
804087a8:	03c12603          	lw	a2,60(sp)
804087ac:	03812783          	lw	a5,56(sp)
804087b0:	2ef66c63          	bltu	a2,a5,80408aa8 <do_execve+0x9b0>
804087b4:	04012783          	lw	a5,64(sp)
804087b8:	0017f693          	andi	a3,a5,1
804087bc:	00068463          	beqz	a3,804087c4 <do_execve+0x6cc>
804087c0:	00400693          	li	a3,4
804087c4:	0027f713          	andi	a4,a5,2
804087c8:	0047f793          	andi	a5,a5,4
804087cc:	12071e63          	bnez	a4,80408908 <do_execve+0x810>
804087d0:	01100713          	li	a4,17
804087d4:	00e12a23          	sw	a4,20(sp)
804087d8:	00078863          	beqz	a5,804087e8 <do_execve+0x6f0>
804087dc:	01300793          	li	a5,19
804087e0:	0016e693          	ori	a3,a3,1
804087e4:	00f12a23          	sw	a5,20(sp)
804087e8:	0026f793          	andi	a5,a3,2
804087ec:	12079263          	bnez	a5,80408910 <do_execve+0x818>
804087f0:	0046f793          	andi	a5,a3,4
804087f4:	00078863          	beqz	a5,80408804 <do_execve+0x70c>
804087f8:	01412783          	lw	a5,20(sp)
804087fc:	0087e793          	ori	a5,a5,8
80408800:	00f12a23          	sw	a5,20(sp)
80408804:	03012583          	lw	a1,48(sp)
80408808:	00000713          	li	a4,0
8040880c:	000b0513          	mv	a0,s6
80408810:	990fc0ef          	jal	ra,804049a0 <mm_map>
80408814:	00050a93          	mv	s5,a0
80408818:	0e051263          	bnez	a0,804088fc <do_execve+0x804>
8040881c:	03012d83          	lw	s11,48(sp)
80408820:	03812783          	lw	a5,56(sp)
80408824:	fffff737          	lui	a4,0xfffff
80408828:	02c12c83          	lw	s9,44(sp)
8040882c:	00fd87b3          	add	a5,s11,a5
80408830:	00f12623          	sw	a5,12(sp)
80408834:	00edfd33          	and	s10,s11,a4
80408838:	0afde463          	bltu	s11,a5,804088e0 <do_execve+0x7e8>
8040883c:	2640006f          	j	80408aa0 <do_execve+0x9a8>
80408840:	000017b7          	lui	a5,0x1
80408844:	41ad85b3          	sub	a1,s11,s10
80408848:	00fd0d33          	add	s10,s10,a5
8040884c:	00c12783          	lw	a5,12(sp)
80408850:	41bd08b3          	sub	a7,s10,s11
80408854:	01a7f463          	bgeu	a5,s10,8040885c <do_execve+0x764>
80408858:	41b788b3          	sub	a7,a5,s11
8040885c:	00094797          	auipc	a5,0x94
80408860:	fac78793          	addi	a5,a5,-84 # 8049c808 <pages>
80408864:	0007a783          	lw	a5,0(a5)
80408868:	0000e717          	auipc	a4,0xe
8040886c:	1bc70713          	addi	a4,a4,444 # 80416a24 <nbase>
80408870:	00072603          	lw	a2,0(a4)
80408874:	00094717          	auipc	a4,0x94
80408878:	f2470713          	addi	a4,a4,-220 # 8049c798 <npage>
8040887c:	00072683          	lw	a3,0(a4)
80408880:	40fc07b3          	sub	a5,s8,a5
80408884:	01812703          	lw	a4,24(sp)
80408888:	4057d793          	srai	a5,a5,0x5
8040888c:	00c787b3          	add	a5,a5,a2
80408890:	00e7f633          	and	a2,a5,a4
80408894:	00c79793          	slli	a5,a5,0xc
80408898:	26d67a63          	bgeu	a2,a3,80408b0c <do_execve+0xa14>
8040889c:	00094717          	auipc	a4,0x94
804088a0:	f6470713          	addi	a4,a4,-156 # 8049c800 <va_pa_offset>
804088a4:	00072503          	lw	a0,0(a4)
804088a8:	000c8693          	mv	a3,s9
804088ac:	00088613          	mv	a2,a7
804088b0:	00a787b3          	add	a5,a5,a0
804088b4:	00b785b3          	add	a1,a5,a1
804088b8:	000b8513          	mv	a0,s7
804088bc:	01112823          	sw	a7,16(sp)
804088c0:	851fe0ef          	jal	ra,80407110 <load_icode_read>
804088c4:	00050a93          	mv	s5,a0
804088c8:	02051a63          	bnez	a0,804088fc <do_execve+0x804>
804088cc:	01012883          	lw	a7,16(sp)
804088d0:	00c12783          	lw	a5,12(sp)
804088d4:	011d8db3          	add	s11,s11,a7
804088d8:	011c8cb3          	add	s9,s9,a7
804088dc:	04fdf063          	bgeu	s11,a5,8040891c <do_execve+0x824>
804088e0:	00cb2503          	lw	a0,12(s6)
804088e4:	01412603          	lw	a2,20(sp)
804088e8:	000d0593          	mv	a1,s10
804088ec:	f51fa0ef          	jal	ra,8040383c <pgdir_alloc_page>
804088f0:	00050c13          	mv	s8,a0
804088f4:	f40516e3          	bnez	a0,80408840 <do_execve+0x748>
804088f8:	ffc00a93          	li	s5,-4
804088fc:	000b0513          	mv	a0,s6
80408900:	a78fc0ef          	jal	ra,80404b78 <exit_mmap>
80408904:	dcdff06f          	j	804086d0 <do_execve+0x5d8>
80408908:	0026e693          	ori	a3,a3,2
8040890c:	ec0798e3          	bnez	a5,804087dc <do_execve+0x6e4>
80408910:	01700793          	li	a5,23
80408914:	00f12a23          	sw	a5,20(sp)
80408918:	ed9ff06f          	j	804087f0 <do_execve+0x6f8>
8040891c:	03012783          	lw	a5,48(sp)
80408920:	03c12a83          	lw	s5,60(sp)
80408924:	01578ab3          	add	s5,a5,s5
80408928:	0badfa63          	bgeu	s11,s10,804089dc <do_execve+0x8e4>
8040892c:	b7ba8ee3          	beq	s5,s11,804084a8 <do_execve+0x3b0>
80408930:	00001537          	lui	a0,0x1
80408934:	00ad8533          	add	a0,s11,a0
80408938:	41a50533          	sub	a0,a0,s10
8040893c:	41ba8cb3          	sub	s9,s5,s11
80408940:	01aae463          	bltu	s5,s10,80408948 <do_execve+0x850>
80408944:	41bd0cb3          	sub	s9,s10,s11
80408948:	00094797          	auipc	a5,0x94
8040894c:	ec078793          	addi	a5,a5,-320 # 8049c808 <pages>
80408950:	0007a783          	lw	a5,0(a5)
80408954:	0000e717          	auipc	a4,0xe
80408958:	0d070713          	addi	a4,a4,208 # 80416a24 <nbase>
8040895c:	00072683          	lw	a3,0(a4)
80408960:	00094717          	auipc	a4,0x94
80408964:	e3870713          	addi	a4,a4,-456 # 8049c798 <npage>
80408968:	00072603          	lw	a2,0(a4)
8040896c:	40fc07b3          	sub	a5,s8,a5
80408970:	01812703          	lw	a4,24(sp)
80408974:	4057d793          	srai	a5,a5,0x5
80408978:	00d787b3          	add	a5,a5,a3
8040897c:	00e7f5b3          	and	a1,a5,a4
80408980:	00c79693          	slli	a3,a5,0xc
80408984:	16c5f863          	bgeu	a1,a2,80408af4 <do_execve+0x9fc>
80408988:	00094797          	auipc	a5,0x94
8040898c:	e7878793          	addi	a5,a5,-392 # 8049c800 <va_pa_offset>
80408990:	0007a783          	lw	a5,0(a5)
80408994:	000c8613          	mv	a2,s9
80408998:	00000593          	li	a1,0
8040899c:	00f687b3          	add	a5,a3,a5
804089a0:	00a78533          	add	a0,a5,a0
804089a4:	31c0a0ef          	jal	ra,80412cc0 <memset>
804089a8:	01bc8833          	add	a6,s9,s11
804089ac:	03aaf463          	bgeu	s5,s10,804089d4 <do_execve+0x8dc>
804089b0:	af0a8ce3          	beq	s5,a6,804084a8 <do_execve+0x3b0>
804089b4:	0000c697          	auipc	a3,0xc
804089b8:	11468693          	addi	a3,a3,276 # 80414ac8 <CSWTCH.69+0x560>
804089bc:	0000a617          	auipc	a2,0xa
804089c0:	77060613          	addi	a2,a2,1904 # 8041312c <commands+0x1f8>
804089c4:	2d100593          	li	a1,721
804089c8:	0000c517          	auipc	a0,0xc
804089cc:	63850513          	addi	a0,a0,1592 # 80415000 <CSWTCH.69+0xa98>
804089d0:	c55f70ef          	jal	ra,80400624 <__panic>
804089d4:	ffa810e3          	bne	a6,s10,804089b4 <do_execve+0x8bc>
804089d8:	000d0d93          	mv	s11,s10
804089dc:	00094c97          	auipc	s9,0x94
804089e0:	e24c8c93          	addi	s9,s9,-476 # 8049c800 <va_pa_offset>
804089e4:	075dee63          	bltu	s11,s5,80408a60 <do_execve+0x968>
804089e8:	ac1ff06f          	j	804084a8 <do_execve+0x3b0>
804089ec:	000017b7          	lui	a5,0x1
804089f0:	41ad8533          	sub	a0,s11,s10
804089f4:	00fd0d33          	add	s10,s10,a5
804089f8:	41bd0633          	sub	a2,s10,s11
804089fc:	01aaf463          	bgeu	s5,s10,80408a04 <do_execve+0x90c>
80408a00:	41ba8633          	sub	a2,s5,s11
80408a04:	00094797          	auipc	a5,0x94
80408a08:	e0478793          	addi	a5,a5,-508 # 8049c808 <pages>
80408a0c:	0007a683          	lw	a3,0(a5)
80408a10:	0000e797          	auipc	a5,0xe
80408a14:	01478793          	addi	a5,a5,20 # 80416a24 <nbase>
80408a18:	0007a583          	lw	a1,0(a5)
80408a1c:	40dc06b3          	sub	a3,s8,a3
80408a20:	00094797          	auipc	a5,0x94
80408a24:	d7878793          	addi	a5,a5,-648 # 8049c798 <npage>
80408a28:	01812703          	lw	a4,24(sp)
80408a2c:	4056d693          	srai	a3,a3,0x5
80408a30:	0007a783          	lw	a5,0(a5)
80408a34:	00b686b3          	add	a3,a3,a1
80408a38:	00e6f5b3          	and	a1,a3,a4
80408a3c:	00c69693          	slli	a3,a3,0xc
80408a40:	0af5fa63          	bgeu	a1,a5,80408af4 <do_execve+0x9fc>
80408a44:	000ca783          	lw	a5,0(s9)
80408a48:	00cd8db3          	add	s11,s11,a2
80408a4c:	00000593          	li	a1,0
80408a50:	00f686b3          	add	a3,a3,a5
80408a54:	00a68533          	add	a0,a3,a0
80408a58:	2680a0ef          	jal	ra,80412cc0 <memset>
80408a5c:	a55df6e3          	bgeu	s11,s5,804084a8 <do_execve+0x3b0>
80408a60:	00cb2503          	lw	a0,12(s6)
80408a64:	01412603          	lw	a2,20(sp)
80408a68:	000d0593          	mv	a1,s10
80408a6c:	dd1fa0ef          	jal	ra,8040383c <pgdir_alloc_page>
80408a70:	00050c13          	mv	s8,a0
80408a74:	f6051ce3          	bnez	a0,804089ec <do_execve+0x8f4>
80408a78:	ffc00a93          	li	s5,-4
80408a7c:	e81ff06f          	j	804088fc <do_execve+0x804>
80408a80:	ffd00a93          	li	s5,-3
80408a84:	920b18e3          	bnez	s6,804083b4 <do_execve+0x2bc>
80408a88:	939ff06f          	j	804083c0 <do_execve+0x2c8>
80408a8c:	0000c517          	auipc	a0,0xc
80408a90:	f6c50513          	addi	a0,a0,-148 # 804149f8 <CSWTCH.69+0x490>
80408a94:	f68f70ef          	jal	ra,804001fc <cprintf>
80408a98:	ffd00a93          	li	s5,-3
80408a9c:	925ff06f          	j	804083c0 <do_execve+0x2c8>
80408aa0:	000d8793          	mv	a5,s11
80408aa4:	e7dff06f          	j	80408920 <do_execve+0x828>
80408aa8:	ff800a93          	li	s5,-8
80408aac:	e51ff06f          	j	804088fc <do_execve+0x804>
80408ab0:	09412783          	lw	a5,148(sp)
80408ab4:	00269613          	slli	a2,a3,0x2
80408ab8:	fffff737          	lui	a4,0xfffff
80408abc:	00e67733          	and	a4,a2,a4
80408ac0:	0000c517          	auipc	a0,0xc
80408ac4:	15450513          	addi	a0,a0,340 # 80414c14 <CSWTCH.69+0x6ac>
80408ac8:	00800637          	lui	a2,0x800
80408acc:	f30f70ef          	jal	ra,804001fc <cprintf>
80408ad0:	bb1ff06f          	j	80408680 <do_execve+0x588>
80408ad4:	000a2783          	lw	a5,0(s4)
80408ad8:	0047a583          	lw	a1,4(a5)
80408adc:	b99ff06f          	j	80408674 <do_execve+0x57c>
80408ae0:	000b8593          	mv	a1,s7
80408ae4:	0000c517          	auipc	a0,0xc
80408ae8:	f6850513          	addi	a0,a0,-152 # 80414a4c <CSWTCH.69+0x4e4>
80408aec:	f10f70ef          	jal	ra,804001fc <cprintf>
80408af0:	81dff06f          	j	8040830c <do_execve+0x214>
80408af4:	0000b617          	auipc	a2,0xb
80408af8:	1a460613          	addi	a2,a2,420 # 80413c98 <default_pmm_manager+0x30>
80408afc:	06e00593          	li	a1,110
80408b00:	0000b517          	auipc	a0,0xb
80408b04:	1bc50513          	addi	a0,a0,444 # 80413cbc <default_pmm_manager+0x54>
80408b08:	b1df70ef          	jal	ra,80400624 <__panic>
80408b0c:	00078693          	mv	a3,a5
80408b10:	0000b617          	auipc	a2,0xb
80408b14:	18860613          	addi	a2,a2,392 # 80413c98 <default_pmm_manager+0x30>
80408b18:	06e00593          	li	a1,110
80408b1c:	0000b517          	auipc	a0,0xb
80408b20:	1a050513          	addi	a0,a0,416 # 80413cbc <default_pmm_manager+0x54>
80408b24:	b01f70ef          	jal	ra,80400624 <__panic>
80408b28:	0000b617          	auipc	a2,0xb
80408b2c:	1a460613          	addi	a2,a2,420 # 80413ccc <default_pmm_manager+0x64>
80408b30:	2ed00593          	li	a1,749
80408b34:	0000c517          	auipc	a0,0xc
80408b38:	4cc50513          	addi	a0,a0,1228 # 80415000 <CSWTCH.69+0xa98>
80408b3c:	ae9f70ef          	jal	ra,80400624 <__panic>
80408b40:	0000c697          	auipc	a3,0xc
80408b44:	09068693          	addi	a3,a3,144 # 80414bd0 <CSWTCH.69+0x668>
80408b48:	0000a617          	auipc	a2,0xa
80408b4c:	5e460613          	addi	a2,a2,1508 # 8041312c <commands+0x1f8>
80408b50:	2e900593          	li	a1,745
80408b54:	0000c517          	auipc	a0,0xc
80408b58:	4ac50513          	addi	a0,a0,1196 # 80415000 <CSWTCH.69+0xa98>
80408b5c:	ac9f70ef          	jal	ra,80400624 <__panic>
80408b60:	0000c697          	auipc	a3,0xc
80408b64:	02c68693          	addi	a3,a3,44 # 80414b8c <CSWTCH.69+0x624>
80408b68:	0000a617          	auipc	a2,0xa
80408b6c:	5c460613          	addi	a2,a2,1476 # 8041312c <commands+0x1f8>
80408b70:	2e800593          	li	a1,744
80408b74:	0000c517          	auipc	a0,0xc
80408b78:	48c50513          	addi	a0,a0,1164 # 80415000 <CSWTCH.69+0xa98>
80408b7c:	aa9f70ef          	jal	ra,80400624 <__panic>
80408b80:	0000c697          	auipc	a3,0xc
80408b84:	fc868693          	addi	a3,a3,-56 # 80414b48 <CSWTCH.69+0x5e0>
80408b88:	0000a617          	auipc	a2,0xa
80408b8c:	5a460613          	addi	a2,a2,1444 # 8041312c <commands+0x1f8>
80408b90:	2e700593          	li	a1,743
80408b94:	0000c517          	auipc	a0,0xc
80408b98:	46c50513          	addi	a0,a0,1132 # 80415000 <CSWTCH.69+0xa98>
80408b9c:	a89f70ef          	jal	ra,80400624 <__panic>
80408ba0:	0000c697          	auipc	a3,0xc
80408ba4:	f6468693          	addi	a3,a3,-156 # 80414b04 <CSWTCH.69+0x59c>
80408ba8:	0000a617          	auipc	a2,0xa
80408bac:	58460613          	addi	a2,a2,1412 # 8041312c <commands+0x1f8>
80408bb0:	2e600593          	li	a1,742
80408bb4:	0000c517          	auipc	a0,0xc
80408bb8:	44c50513          	addi	a0,a0,1100 # 80415000 <CSWTCH.69+0xa98>
80408bbc:	a69f70ef          	jal	ra,80400624 <__panic>
80408bc0:	0000b617          	auipc	a2,0xb
80408bc4:	13060613          	addi	a2,a2,304 # 80413cf0 <default_pmm_manager+0x88>
80408bc8:	06900593          	li	a1,105
80408bcc:	0000b517          	auipc	a0,0xb
80408bd0:	0f050513          	addi	a0,a0,240 # 80413cbc <default_pmm_manager+0x54>
80408bd4:	a51f70ef          	jal	ra,80400624 <__panic>
80408bd8:	0000c617          	auipc	a2,0xc
80408bdc:	ec860613          	addi	a2,a2,-312 # 80414aa0 <CSWTCH.69+0x538>
80408be0:	27a00593          	li	a1,634
80408be4:	0000c517          	auipc	a0,0xc
80408be8:	41c50513          	addi	a0,a0,1052 # 80415000 <CSWTCH.69+0xa98>
80408bec:	a39f70ef          	jal	ra,80400624 <__panic>
80408bf0:	0000b617          	auipc	a2,0xb
80408bf4:	0dc60613          	addi	a2,a2,220 # 80413ccc <default_pmm_manager+0x64>
80408bf8:	07000593          	li	a1,112
80408bfc:	0000b517          	auipc	a0,0xb
80408c00:	0c050513          	addi	a0,a0,192 # 80413cbc <default_pmm_manager+0x54>
80408c04:	a21f70ef          	jal	ra,80400624 <__panic>

80408c08 <do_yield>:
80408c08:	00094797          	auipc	a5,0x94
80408c0c:	ba478793          	addi	a5,a5,-1116 # 8049c7ac <current>
80408c10:	0007a783          	lw	a5,0(a5)
80408c14:	00100713          	li	a4,1
80408c18:	00000513          	li	a0,0
80408c1c:	00e7a823          	sw	a4,16(a5)
80408c20:	00008067          	ret

80408c24 <do_wait>:
80408c24:	ff010113          	addi	sp,sp,-16
80408c28:	00812423          	sw	s0,8(sp)
80408c2c:	00912223          	sw	s1,4(sp)
80408c30:	00112623          	sw	ra,12(sp)
80408c34:	00058413          	mv	s0,a1
80408c38:	00050493          	mv	s1,a0
80408c3c:	02058263          	beqz	a1,80408c60 <do_wait+0x3c>
80408c40:	00094797          	auipc	a5,0x94
80408c44:	b6c78793          	addi	a5,a5,-1172 # 8049c7ac <current>
80408c48:	0007a783          	lw	a5,0(a5)
80408c4c:	00100693          	li	a3,1
80408c50:	00400613          	li	a2,4
80408c54:	0187a503          	lw	a0,24(a5)
80408c58:	960fc0ef          	jal	ra,80404db8 <user_mem_check>
80408c5c:	02050063          	beqz	a0,80408c7c <do_wait+0x58>
80408c60:	00040593          	mv	a1,s0
80408c64:	00812403          	lw	s0,8(sp)
80408c68:	00c12083          	lw	ra,12(sp)
80408c6c:	00048513          	mv	a0,s1
80408c70:	00412483          	lw	s1,4(sp)
80408c74:	01010113          	addi	sp,sp,16
80408c78:	8a0ff06f          	j	80407d18 <do_wait.part.8>
80408c7c:	00c12083          	lw	ra,12(sp)
80408c80:	00812403          	lw	s0,8(sp)
80408c84:	00412483          	lw	s1,4(sp)
80408c88:	ffd00513          	li	a0,-3
80408c8c:	01010113          	addi	sp,sp,16
80408c90:	00008067          	ret

80408c94 <do_kill>:
80408c94:	ff010113          	addi	sp,sp,-16
80408c98:	00112623          	sw	ra,12(sp)
80408c9c:	00812423          	sw	s0,8(sp)
80408ca0:	fb4fe0ef          	jal	ra,80407454 <find_proc>
80408ca4:	04050c63          	beqz	a0,80408cfc <do_kill+0x68>
80408ca8:	05c52703          	lw	a4,92(a0)
80408cac:	00177693          	andi	a3,a4,1
80408cb0:	04069263          	bnez	a3,80408cf4 <do_kill+0x60>
80408cb4:	0a852683          	lw	a3,168(a0)
80408cb8:	00176713          	ori	a4,a4,1
80408cbc:	04e52e23          	sw	a4,92(a0)
80408cc0:	00000413          	li	s0,0
80408cc4:	0006cc63          	bltz	a3,80408cdc <do_kill+0x48>
80408cc8:	00040513          	mv	a0,s0
80408ccc:	00c12083          	lw	ra,12(sp)
80408cd0:	00812403          	lw	s0,8(sp)
80408cd4:	01010113          	addi	sp,sp,16
80408cd8:	00008067          	ret
80408cdc:	6a5030ef          	jal	ra,8040cb80 <wakeup_proc>
80408ce0:	00040513          	mv	a0,s0
80408ce4:	00c12083          	lw	ra,12(sp)
80408ce8:	00812403          	lw	s0,8(sp)
80408cec:	01010113          	addi	sp,sp,16
80408cf0:	00008067          	ret
80408cf4:	ff700413          	li	s0,-9
80408cf8:	fd1ff06f          	j	80408cc8 <do_kill+0x34>
80408cfc:	ffd00413          	li	s0,-3
80408d00:	fc9ff06f          	j	80408cc8 <do_kill+0x34>

80408d04 <proc_init>:
80408d04:	00002737          	lui	a4,0x2
80408d08:	00094797          	auipc	a5,0x94
80408d0c:	bac78793          	addi	a5,a5,-1108 # 8049c8b4 <proc_list>
80408d10:	ff010113          	addi	sp,sp,-16
80408d14:	00090697          	auipc	a3,0x90
80408d18:	32e6a823          	sw	a4,816(a3) # 80499044 <last_pid>
80408d1c:	00090697          	auipc	a3,0x90
80408d20:	32e6a623          	sw	a4,812(a3) # 80499048 <next_safe>
80408d24:	00094717          	auipc	a4,0x94
80408d28:	b8f72a23          	sw	a5,-1132(a4) # 8049c8b8 <proc_list+0x4>
80408d2c:	00094717          	auipc	a4,0x94
80408d30:	b8f72423          	sw	a5,-1144(a4) # 8049c8b4 <proc_list>
80408d34:	00112623          	sw	ra,12(sp)
80408d38:	00812423          	sw	s0,8(sp)
80408d3c:	00912223          	sw	s1,4(sp)
80408d40:	01212023          	sw	s2,0(sp)
80408d44:	00091797          	auipc	a5,0x91
80408d48:	a0478793          	addi	a5,a5,-1532 # 80499748 <hash_list>
80408d4c:	00093717          	auipc	a4,0x93
80408d50:	9fc70713          	addi	a4,a4,-1540 # 8049b748 <__rq>
80408d54:	00f7a223          	sw	a5,4(a5)
80408d58:	00f7a023          	sw	a5,0(a5)
80408d5c:	00878793          	addi	a5,a5,8
80408d60:	fee79ae3          	bne	a5,a4,80408d54 <proc_init+0x50>
80408d64:	ab4fe0ef          	jal	ra,80407018 <alloc_proc>
80408d68:	00094797          	auipc	a5,0x94
80408d6c:	a4a7a423          	sw	a0,-1464(a5) # 8049c7b0 <idleproc>
80408d70:	00050413          	mv	s0,a0
80408d74:	00094497          	auipc	s1,0x94
80408d78:	a3c48493          	addi	s1,s1,-1476 # 8049c7b0 <idleproc>
80408d7c:	0e050263          	beqz	a0,80408e60 <proc_init+0x15c>
80408d80:	00200793          	li	a5,2
80408d84:	00f52023          	sw	a5,0(a0)
80408d88:	00100913          	li	s2,1
80408d8c:	0000e797          	auipc	a5,0xe
80408d90:	27478793          	addi	a5,a5,628 # 80417000 <bootstack>
80408d94:	00052223          	sw	zero,4(a0)
80408d98:	00f52623          	sw	a5,12(a0)
80408d9c:	01252823          	sw	s2,16(a0)
80408da0:	e14fd0ef          	jal	ra,804063b4 <files_create>
80408da4:	0ca42e23          	sw	a0,220(s0)
80408da8:	12050463          	beqz	a0,80408ed0 <proc_init+0x1cc>
80408dac:	0004a503          	lw	a0,0(s1)
80408db0:	0000c597          	auipc	a1,0xc
80408db4:	18c58593          	addi	a1,a1,396 # 80414f3c <CSWTCH.69+0x9d4>
80408db8:	0dc52703          	lw	a4,220(a0)
80408dbc:	00872783          	lw	a5,8(a4)
80408dc0:	00178793          	addi	a5,a5,1
80408dc4:	00f72423          	sw	a5,8(a4)
80408dc8:	da0fe0ef          	jal	ra,80407368 <set_proc_name>
80408dcc:	00094797          	auipc	a5,0x94
80408dd0:	9ec78793          	addi	a5,a5,-1556 # 8049c7b8 <nr_process>
80408dd4:	0007a783          	lw	a5,0(a5)
80408dd8:	0004a703          	lw	a4,0(s1)
80408ddc:	00000613          	li	a2,0
80408de0:	00178793          	addi	a5,a5,1
80408de4:	00000593          	li	a1,0
80408de8:	fffff517          	auipc	a0,0xfffff
80408dec:	17450513          	addi	a0,a0,372 # 80407f5c <init_main>
80408df0:	00094697          	auipc	a3,0x94
80408df4:	9cf6a423          	sw	a5,-1592(a3) # 8049c7b8 <nr_process>
80408df8:	00094797          	auipc	a5,0x94
80408dfc:	9ae7aa23          	sw	a4,-1612(a5) # 8049c7ac <current>
80408e00:	c61fe0ef          	jal	ra,80407a60 <kernel_thread>
80408e04:	0aa05a63          	blez	a0,80408eb8 <proc_init+0x1b4>
80408e08:	e4cfe0ef          	jal	ra,80407454 <find_proc>
80408e0c:	0000c597          	auipc	a1,0xc
80408e10:	15458593          	addi	a1,a1,340 # 80414f60 <CSWTCH.69+0x9f8>
80408e14:	00094797          	auipc	a5,0x94
80408e18:	9aa7a023          	sw	a0,-1632(a5) # 8049c7b4 <initproc>
80408e1c:	d4cfe0ef          	jal	ra,80407368 <set_proc_name>
80408e20:	0004a783          	lw	a5,0(s1)
80408e24:	06078a63          	beqz	a5,80408e98 <proc_init+0x194>
80408e28:	0047a783          	lw	a5,4(a5)
80408e2c:	06079663          	bnez	a5,80408e98 <proc_init+0x194>
80408e30:	00094797          	auipc	a5,0x94
80408e34:	98478793          	addi	a5,a5,-1660 # 8049c7b4 <initproc>
80408e38:	0007a783          	lw	a5,0(a5)
80408e3c:	02078e63          	beqz	a5,80408e78 <proc_init+0x174>
80408e40:	0047a783          	lw	a5,4(a5)
80408e44:	03279a63          	bne	a5,s2,80408e78 <proc_init+0x174>
80408e48:	00c12083          	lw	ra,12(sp)
80408e4c:	00812403          	lw	s0,8(sp)
80408e50:	00412483          	lw	s1,4(sp)
80408e54:	00012903          	lw	s2,0(sp)
80408e58:	01010113          	addi	sp,sp,16
80408e5c:	00008067          	ret
80408e60:	0000c617          	auipc	a2,0xc
80408e64:	0a060613          	addi	a2,a2,160 # 80414f00 <CSWTCH.69+0x998>
80408e68:	45900593          	li	a1,1113
80408e6c:	0000c517          	auipc	a0,0xc
80408e70:	19450513          	addi	a0,a0,404 # 80415000 <CSWTCH.69+0xa98>
80408e74:	fb0f70ef          	jal	ra,80400624 <__panic>
80408e78:	0000c697          	auipc	a3,0xc
80408e7c:	11868693          	addi	a3,a3,280 # 80414f90 <CSWTCH.69+0xa28>
80408e80:	0000a617          	auipc	a2,0xa
80408e84:	2ac60613          	addi	a2,a2,684 # 8041312c <commands+0x1f8>
80408e88:	47400593          	li	a1,1140
80408e8c:	0000c517          	auipc	a0,0xc
80408e90:	17450513          	addi	a0,a0,372 # 80415000 <CSWTCH.69+0xa98>
80408e94:	f90f70ef          	jal	ra,80400624 <__panic>
80408e98:	0000c697          	auipc	a3,0xc
80408e9c:	0d068693          	addi	a3,a3,208 # 80414f68 <CSWTCH.69+0xa00>
80408ea0:	0000a617          	auipc	a2,0xa
80408ea4:	28c60613          	addi	a2,a2,652 # 8041312c <commands+0x1f8>
80408ea8:	47300593          	li	a1,1139
80408eac:	0000c517          	auipc	a0,0xc
80408eb0:	15450513          	addi	a0,a0,340 # 80415000 <CSWTCH.69+0xa98>
80408eb4:	f70f70ef          	jal	ra,80400624 <__panic>
80408eb8:	0000c617          	auipc	a2,0xc
80408ebc:	08c60613          	addi	a2,a2,140 # 80414f44 <CSWTCH.69+0x9dc>
80408ec0:	46d00593          	li	a1,1133
80408ec4:	0000c517          	auipc	a0,0xc
80408ec8:	13c50513          	addi	a0,a0,316 # 80415000 <CSWTCH.69+0xa98>
80408ecc:	f58f70ef          	jal	ra,80400624 <__panic>
80408ed0:	0000c617          	auipc	a2,0xc
80408ed4:	04860613          	addi	a2,a2,72 # 80414f18 <CSWTCH.69+0x9b0>
80408ed8:	46200593          	li	a1,1122
80408edc:	0000c517          	auipc	a0,0xc
80408ee0:	12450513          	addi	a0,a0,292 # 80415000 <CSWTCH.69+0xa98>
80408ee4:	f40f70ef          	jal	ra,80400624 <__panic>

80408ee8 <cpu_idle>:
80408ee8:	ff010113          	addi	sp,sp,-16
80408eec:	00812423          	sw	s0,8(sp)
80408ef0:	00112623          	sw	ra,12(sp)
80408ef4:	00094417          	auipc	s0,0x94
80408ef8:	8b840413          	addi	s0,s0,-1864 # 8049c7ac <current>
80408efc:	00042783          	lw	a5,0(s0)
80408f00:	0107a783          	lw	a5,16(a5)
80408f04:	00079c63          	bnez	a5,80408f1c <cpu_idle+0x34>
80408f08:	935f70ef          	jal	ra,8040083c <serial_intr>
80408f0c:	a39f70ef          	jal	ra,80400944 <cons_getc>
80408f10:	fe0506e3          	beqz	a0,80408efc <cpu_idle+0x14>
80408f14:	560060ef          	jal	ra,8040f474 <dev_stdin_write>
80408f18:	ff5ff06f          	j	80408f0c <cpu_idle+0x24>
80408f1c:	591030ef          	jal	ra,8040ccac <schedule>
80408f20:	fe9ff06f          	j	80408f08 <cpu_idle+0x20>

80408f24 <lab6_set_priority>:
80408f24:	00094797          	auipc	a5,0x94
80408f28:	88878793          	addi	a5,a5,-1912 # 8049c7ac <current>
80408f2c:	0007a783          	lw	a5,0(a5)
80408f30:	00051863          	bnez	a0,80408f40 <lab6_set_priority+0x1c>
80408f34:	00100713          	li	a4,1
80408f38:	0ce7ac23          	sw	a4,216(a5)
80408f3c:	00008067          	ret
80408f40:	0ca7ac23          	sw	a0,216(a5)
80408f44:	00008067          	ret

80408f48 <do_sleep>:
80408f48:	08050063          	beqz	a0,80408fc8 <do_sleep+0x80>
80408f4c:	fe010113          	addi	sp,sp,-32
80408f50:	00812c23          	sw	s0,24(sp)
80408f54:	00112e23          	sw	ra,28(sp)
80408f58:	00050413          	mv	s0,a0
80408f5c:	100027f3          	csrr	a5,sstatus
80408f60:	0027f793          	andi	a5,a5,2
80408f64:	06079663          	bnez	a5,80408fd0 <do_sleep+0x88>
80408f68:	00094797          	auipc	a5,0x94
80408f6c:	84478793          	addi	a5,a5,-1980 # 8049c7ac <current>
80408f70:	0007a783          	lw	a5,0(a5)
80408f74:	00810713          	addi	a4,sp,8
80408f78:	00a12023          	sw	a0,0(sp)
80408f7c:	00e12623          	sw	a4,12(sp)
80408f80:	00e12423          	sw	a4,8(sp)
80408f84:	00f12223          	sw	a5,4(sp)
80408f88:	00100713          	li	a4,1
80408f8c:	00e7a023          	sw	a4,0(a5)
80408f90:	80000737          	lui	a4,0x80000
80408f94:	00010413          	mv	s0,sp
80408f98:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
80408f9c:	0ae7a423          	sw	a4,168(a5)
80408fa0:	00040513          	mv	a0,s0
80408fa4:	639030ef          	jal	ra,8040cddc <add_timer>
80408fa8:	505030ef          	jal	ra,8040ccac <schedule>
80408fac:	00040513          	mv	a0,s0
80408fb0:	739030ef          	jal	ra,8040cee8 <del_timer>
80408fb4:	01c12083          	lw	ra,28(sp)
80408fb8:	01812403          	lw	s0,24(sp)
80408fbc:	00000513          	li	a0,0
80408fc0:	02010113          	addi	sp,sp,32
80408fc4:	00008067          	ret
80408fc8:	00000513          	li	a0,0
80408fcc:	00008067          	ret
80408fd0:	ce9f70ef          	jal	ra,80400cb8 <intr_disable>
80408fd4:	00093797          	auipc	a5,0x93
80408fd8:	7d878793          	addi	a5,a5,2008 # 8049c7ac <current>
80408fdc:	0007a783          	lw	a5,0(a5)
80408fe0:	00810713          	addi	a4,sp,8
80408fe4:	00812023          	sw	s0,0(sp)
80408fe8:	00f12223          	sw	a5,4(sp)
80408fec:	00e12623          	sw	a4,12(sp)
80408ff0:	00e12423          	sw	a4,8(sp)
80408ff4:	00100713          	li	a4,1
80408ff8:	00e7a023          	sw	a4,0(a5)
80408ffc:	80000737          	lui	a4,0x80000
80409000:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb63746>
80409004:	00010413          	mv	s0,sp
80409008:	00040513          	mv	a0,s0
8040900c:	0ae7a423          	sw	a4,168(a5)
80409010:	5cd030ef          	jal	ra,8040cddc <add_timer>
80409014:	c9df70ef          	jal	ra,80400cb0 <intr_enable>
80409018:	f91ff06f          	j	80408fa8 <do_sleep+0x60>

8040901c <switch_to>:
8040901c:	00152023          	sw	ra,0(a0)
80409020:	00252223          	sw	sp,4(a0)
80409024:	00852423          	sw	s0,8(a0)
80409028:	00952623          	sw	s1,12(a0)
8040902c:	01252823          	sw	s2,16(a0)
80409030:	01352a23          	sw	s3,20(a0)
80409034:	01452c23          	sw	s4,24(a0)
80409038:	01552e23          	sw	s5,28(a0)
8040903c:	03652023          	sw	s6,32(a0)
80409040:	03752223          	sw	s7,36(a0)
80409044:	03852423          	sw	s8,40(a0)
80409048:	03952623          	sw	s9,44(a0)
8040904c:	03a52823          	sw	s10,48(a0)
80409050:	03b52a23          	sw	s11,52(a0)
80409054:	0005a083          	lw	ra,0(a1)
80409058:	0045a103          	lw	sp,4(a1)
8040905c:	0085a403          	lw	s0,8(a1)
80409060:	00c5a483          	lw	s1,12(a1)
80409064:	0105a903          	lw	s2,16(a1)
80409068:	0145a983          	lw	s3,20(a1)
8040906c:	0185aa03          	lw	s4,24(a1)
80409070:	01c5aa83          	lw	s5,28(a1)
80409074:	0205ab03          	lw	s6,32(a1)
80409078:	0245ab83          	lw	s7,36(a1)
8040907c:	0285ac03          	lw	s8,40(a1)
80409080:	02c5ac83          	lw	s9,44(a1)
80409084:	0305ad03          	lw	s10,48(a1)
80409088:	0345ad83          	lw	s11,52(a1)
8040908c:	00008067          	ret

80409090 <proc_stride_comp_f>:
80409090:	00c52503          	lw	a0,12(a0)
80409094:	00c5a783          	lw	a5,12(a1)
80409098:	40f50533          	sub	a0,a0,a5
8040909c:	00a04863          	bgtz	a0,804090ac <proc_stride_comp_f+0x1c>
804090a0:	00a03533          	snez	a0,a0
804090a4:	40a00533          	neg	a0,a0
804090a8:	00008067          	ret
804090ac:	00100513          	li	a0,1
804090b0:	00008067          	ret

804090b4 <stride_init>:
804090b4:	00a52223          	sw	a0,4(a0)
804090b8:	00a52023          	sw	a0,0(a0)
804090bc:	00052823          	sw	zero,16(a0)
804090c0:	00052423          	sw	zero,8(a0)
804090c4:	00008067          	ret

804090c8 <stride_pick_next>:
804090c8:	ff010113          	addi	sp,sp,-16
804090cc:	00812423          	sw	s0,8(sp)
804090d0:	01052403          	lw	s0,16(a0)
804090d4:	00112623          	sw	ra,12(sp)
804090d8:	00912223          	sw	s1,4(sp)
804090dc:	01212023          	sw	s2,0(sp)
804090e0:	04040263          	beqz	s0,80409124 <stride_pick_next+0x5c>
804090e4:	01042583          	lw	a1,16(s0)
804090e8:	f3840913          	addi	s2,s0,-200
804090ec:	00c42483          	lw	s1,12(s0)
804090f0:	40000537          	lui	a0,0x40000
804090f4:	02059463          	bnez	a1,8040911c <stride_pick_next+0x54>
804090f8:	00a484b3          	add	s1,s1,a0
804090fc:	00942623          	sw	s1,12(s0)
80409100:	00c12083          	lw	ra,12(sp)
80409104:	00812403          	lw	s0,8(sp)
80409108:	00090513          	mv	a0,s2
8040910c:	00412483          	lw	s1,4(sp)
80409110:	00012903          	lw	s2,0(sp)
80409114:	01010113          	addi	sp,sp,16
80409118:	00008067          	ret
8040911c:	465090ef          	jal	ra,80412d80 <__udivsi3>
80409120:	fd9ff06f          	j	804090f8 <stride_pick_next+0x30>
80409124:	00000913          	li	s2,0
80409128:	fd9ff06f          	j	80409100 <stride_pick_next+0x38>

8040912c <stride_proc_tick>:
8040912c:	0c45a783          	lw	a5,196(a1)
80409130:	00f05663          	blez	a5,8040913c <stride_proc_tick+0x10>
80409134:	fff78793          	addi	a5,a5,-1
80409138:	0cf5a223          	sw	a5,196(a1)
8040913c:	00079663          	bnez	a5,80409148 <stride_proc_tick+0x1c>
80409140:	00100793          	li	a5,1
80409144:	00f5a823          	sw	a5,16(a1)
80409148:	00008067          	ret

8040914c <skew_heap_merge.constprop.3>:
8040914c:	ff010113          	addi	sp,sp,-16
80409150:	00812423          	sw	s0,8(sp)
80409154:	00112623          	sw	ra,12(sp)
80409158:	00912223          	sw	s1,4(sp)
8040915c:	01212023          	sw	s2,0(sp)
80409160:	00058413          	mv	s0,a1
80409164:	02050c63          	beqz	a0,8040919c <skew_heap_merge.constprop.3+0x50>
80409168:	00050493          	mv	s1,a0
8040916c:	06058663          	beqz	a1,804091d8 <skew_heap_merge.constprop.3+0x8c>
80409170:	f21ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409174:	fff00793          	li	a5,-1
80409178:	04f50063          	beq	a0,a5,804091b8 <skew_heap_merge.constprop.3+0x6c>
8040917c:	00842583          	lw	a1,8(s0)
80409180:	00442903          	lw	s2,4(s0)
80409184:	00048513          	mv	a0,s1
80409188:	fc5ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040918c:	00a42223          	sw	a0,4(s0)
80409190:	01242423          	sw	s2,8(s0)
80409194:	00050463          	beqz	a0,8040919c <skew_heap_merge.constprop.3+0x50>
80409198:	00852023          	sw	s0,0(a0) # 40000000 <_binary_bin_sfs_img_size+0x3ff88000>
8040919c:	00040513          	mv	a0,s0
804091a0:	00c12083          	lw	ra,12(sp)
804091a4:	00812403          	lw	s0,8(sp)
804091a8:	00412483          	lw	s1,4(sp)
804091ac:	00012903          	lw	s2,0(sp)
804091b0:	01010113          	addi	sp,sp,16
804091b4:	00008067          	ret
804091b8:	0084a503          	lw	a0,8(s1)
804091bc:	0044a903          	lw	s2,4(s1)
804091c0:	00040593          	mv	a1,s0
804091c4:	f89ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
804091c8:	00a4a223          	sw	a0,4(s1)
804091cc:	0124a423          	sw	s2,8(s1)
804091d0:	00050463          	beqz	a0,804091d8 <skew_heap_merge.constprop.3+0x8c>
804091d4:	00952023          	sw	s1,0(a0)
804091d8:	00c12083          	lw	ra,12(sp)
804091dc:	00812403          	lw	s0,8(sp)
804091e0:	00048513          	mv	a0,s1
804091e4:	00012903          	lw	s2,0(sp)
804091e8:	00412483          	lw	s1,4(sp)
804091ec:	01010113          	addi	sp,sp,16
804091f0:	00008067          	ret

804091f4 <stride_enqueue>:
804091f4:	fb010113          	addi	sp,sp,-80
804091f8:	03312e23          	sw	s3,60(sp)
804091fc:	01052983          	lw	s3,16(a0)
80409200:	04812423          	sw	s0,72(sp)
80409204:	04912223          	sw	s1,68(sp)
80409208:	05212023          	sw	s2,64(sp)
8040920c:	04112623          	sw	ra,76(sp)
80409210:	03412c23          	sw	s4,56(sp)
80409214:	03512a23          	sw	s5,52(sp)
80409218:	03612823          	sw	s6,48(sp)
8040921c:	03712623          	sw	s7,44(sp)
80409220:	03812423          	sw	s8,40(sp)
80409224:	03912223          	sw	s9,36(sp)
80409228:	03a12023          	sw	s10,32(sp)
8040922c:	01b12e23          	sw	s11,28(sp)
80409230:	0c05a423          	sw	zero,200(a1)
80409234:	0c05a823          	sw	zero,208(a1)
80409238:	0c05a623          	sw	zero,204(a1)
8040923c:	00050493          	mv	s1,a0
80409240:	00058413          	mv	s0,a1
80409244:	0c858913          	addi	s2,a1,200
80409248:	02098463          	beqz	s3,80409270 <stride_enqueue+0x7c>
8040924c:	0c090c63          	beqz	s2,80409324 <stride_enqueue+0x130>
80409250:	00090593          	mv	a1,s2
80409254:	00098513          	mv	a0,s3
80409258:	e39ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040925c:	fff00793          	li	a5,-1
80409260:	00050a13          	mv	s4,a0
80409264:	06f50a63          	beq	a0,a5,804092d8 <stride_enqueue+0xe4>
80409268:	0d342623          	sw	s3,204(s0)
8040926c:	0129a023          	sw	s2,0(s3)
80409270:	0c442783          	lw	a5,196(s0)
80409274:	0124a823          	sw	s2,16(s1)
80409278:	00c4a703          	lw	a4,12(s1)
8040927c:	04079a63          	bnez	a5,804092d0 <stride_enqueue+0xdc>
80409280:	0ce42223          	sw	a4,196(s0)
80409284:	0084a783          	lw	a5,8(s1)
80409288:	04c12083          	lw	ra,76(sp)
8040928c:	0a942c23          	sw	s1,184(s0)
80409290:	04812403          	lw	s0,72(sp)
80409294:	00178793          	addi	a5,a5,1
80409298:	00f4a423          	sw	a5,8(s1)
8040929c:	04012903          	lw	s2,64(sp)
804092a0:	04412483          	lw	s1,68(sp)
804092a4:	03c12983          	lw	s3,60(sp)
804092a8:	03812a03          	lw	s4,56(sp)
804092ac:	03412a83          	lw	s5,52(sp)
804092b0:	03012b03          	lw	s6,48(sp)
804092b4:	02c12b83          	lw	s7,44(sp)
804092b8:	02812c03          	lw	s8,40(sp)
804092bc:	02412c83          	lw	s9,36(sp)
804092c0:	02012d03          	lw	s10,32(sp)
804092c4:	01c12d83          	lw	s11,28(sp)
804092c8:	05010113          	addi	sp,sp,80
804092cc:	00008067          	ret
804092d0:	faf75ae3          	bge	a4,a5,80409284 <stride_enqueue+0x90>
804092d4:	fadff06f          	j	80409280 <stride_enqueue+0x8c>
804092d8:	0089aa83          	lw	s5,8(s3)
804092dc:	0049ab03          	lw	s6,4(s3)
804092e0:	020a8063          	beqz	s5,80409300 <stride_enqueue+0x10c>
804092e4:	00090593          	mv	a1,s2
804092e8:	000a8513          	mv	a0,s5
804092ec:	da5ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804092f0:	00050b93          	mv	s7,a0
804092f4:	05450463          	beq	a0,s4,8040933c <stride_enqueue+0x148>
804092f8:	0d542623          	sw	s5,204(s0)
804092fc:	012aa023          	sw	s2,0(s5)
80409300:	0129a223          	sw	s2,4(s3)
80409304:	0169a423          	sw	s6,8(s3)
80409308:	0c442783          	lw	a5,196(s0)
8040930c:	01392023          	sw	s3,0(s2)
80409310:	00098913          	mv	s2,s3
80409314:	0124a823          	sw	s2,16(s1)
80409318:	00c4a703          	lw	a4,12(s1)
8040931c:	f60782e3          	beqz	a5,80409280 <stride_enqueue+0x8c>
80409320:	fb1ff06f          	j	804092d0 <stride_enqueue+0xdc>
80409324:	0c442783          	lw	a5,196(s0)
80409328:	00098913          	mv	s2,s3
8040932c:	0124a823          	sw	s2,16(s1)
80409330:	00c4a703          	lw	a4,12(s1)
80409334:	f40786e3          	beqz	a5,80409280 <stride_enqueue+0x8c>
80409338:	f99ff06f          	j	804092d0 <stride_enqueue+0xdc>
8040933c:	008aaa03          	lw	s4,8(s5)
80409340:	004aac03          	lw	s8,4(s5)
80409344:	020a0063          	beqz	s4,80409364 <stride_enqueue+0x170>
80409348:	00090593          	mv	a1,s2
8040934c:	000a0513          	mv	a0,s4
80409350:	d41ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409354:	00050c93          	mv	s9,a0
80409358:	03750063          	beq	a0,s7,80409378 <stride_enqueue+0x184>
8040935c:	0d442623          	sw	s4,204(s0)
80409360:	012a2023          	sw	s2,0(s4)
80409364:	012aa223          	sw	s2,4(s5)
80409368:	018aa423          	sw	s8,8(s5)
8040936c:	01592023          	sw	s5,0(s2)
80409370:	000a8913          	mv	s2,s5
80409374:	f8dff06f          	j	80409300 <stride_enqueue+0x10c>
80409378:	008a2b83          	lw	s7,8(s4)
8040937c:	004a2d03          	lw	s10,4(s4)
80409380:	000b8e63          	beqz	s7,8040939c <stride_enqueue+0x1a8>
80409384:	00090593          	mv	a1,s2
80409388:	000b8513          	mv	a0,s7
8040938c:	d05ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409390:	03950063          	beq	a0,s9,804093b0 <stride_enqueue+0x1bc>
80409394:	0d742623          	sw	s7,204(s0)
80409398:	012ba023          	sw	s2,0(s7)
8040939c:	012a2223          	sw	s2,4(s4)
804093a0:	01aa2423          	sw	s10,8(s4)
804093a4:	01492023          	sw	s4,0(s2)
804093a8:	000a0913          	mv	s2,s4
804093ac:	fb9ff06f          	j	80409364 <stride_enqueue+0x170>
804093b0:	008bac83          	lw	s9,8(s7)
804093b4:	004bad83          	lw	s11,4(s7)
804093b8:	020c8063          	beqz	s9,804093d8 <stride_enqueue+0x1e4>
804093bc:	00090593          	mv	a1,s2
804093c0:	000c8513          	mv	a0,s9
804093c4:	ccdff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804093c8:	fff00793          	li	a5,-1
804093cc:	02f50063          	beq	a0,a5,804093ec <stride_enqueue+0x1f8>
804093d0:	0d942623          	sw	s9,204(s0)
804093d4:	012ca023          	sw	s2,0(s9)
804093d8:	012ba223          	sw	s2,4(s7)
804093dc:	01bba423          	sw	s11,8(s7)
804093e0:	01792023          	sw	s7,0(s2)
804093e4:	000b8913          	mv	s2,s7
804093e8:	fb5ff06f          	j	8040939c <stride_enqueue+0x1a8>
804093ec:	004ca783          	lw	a5,4(s9)
804093f0:	008ca503          	lw	a0,8(s9)
804093f4:	00090593          	mv	a1,s2
804093f8:	00f12623          	sw	a5,12(sp)
804093fc:	d51ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
80409400:	00c12783          	lw	a5,12(sp)
80409404:	00aca223          	sw	a0,4(s9)
80409408:	00fca423          	sw	a5,8(s9)
8040940c:	00050863          	beqz	a0,8040941c <stride_enqueue+0x228>
80409410:	01952023          	sw	s9,0(a0)
80409414:	000c8913          	mv	s2,s9
80409418:	fc1ff06f          	j	804093d8 <stride_enqueue+0x1e4>
8040941c:	000c8913          	mv	s2,s9
80409420:	fb9ff06f          	j	804093d8 <stride_enqueue+0x1e4>

80409424 <stride_dequeue>:
80409424:	0b85a783          	lw	a5,184(a1)
80409428:	fa010113          	addi	sp,sp,-96
8040942c:	04112e23          	sw	ra,92(sp)
80409430:	04812c23          	sw	s0,88(sp)
80409434:	04912a23          	sw	s1,84(sp)
80409438:	05212823          	sw	s2,80(sp)
8040943c:	05312623          	sw	s3,76(sp)
80409440:	05412423          	sw	s4,72(sp)
80409444:	05512223          	sw	s5,68(sp)
80409448:	05612023          	sw	s6,64(sp)
8040944c:	03712e23          	sw	s7,60(sp)
80409450:	03812c23          	sw	s8,56(sp)
80409454:	03912a23          	sw	s9,52(sp)
80409458:	03a12823          	sw	s10,48(sp)
8040945c:	03b12623          	sw	s11,44(sp)
80409460:	00a78463          	beq	a5,a0,80409468 <stride_dequeue+0x44>
80409464:	2790206f          	j	8040bedc <stride_dequeue+0x2ab8>
80409468:	00852983          	lw	s3,8(a0)
8040946c:	00050c13          	mv	s8,a0
80409470:	00098b13          	mv	s6,s3
80409474:	00099463          	bnez	s3,8040947c <stride_dequeue+0x58>
80409478:	2650206f          	j	8040bedc <stride_dequeue+0x2ab8>
8040947c:	0cc5a903          	lw	s2,204(a1)
80409480:	00058493          	mv	s1,a1
80409484:	01052a83          	lw	s5,16(a0)
80409488:	0c85ad03          	lw	s10,200(a1)
8040948c:	0d05a403          	lw	s0,208(a1)
80409490:	3c090e63          	beqz	s2,8040986c <stride_dequeue+0x448>
80409494:	58040c63          	beqz	s0,80409a2c <stride_dequeue+0x608>
80409498:	00040593          	mv	a1,s0
8040949c:	00090513          	mv	a0,s2
804094a0:	bf1ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804094a4:	fff00c93          	li	s9,-1
804094a8:	00050a13          	mv	s4,a0
804094ac:	21950663          	beq	a0,s9,804096b8 <stride_dequeue+0x294>
804094b0:	00842a03          	lw	s4,8(s0)
804094b4:	00442b83          	lw	s7,4(s0)
804094b8:	180a0a63          	beqz	s4,8040964c <stride_dequeue+0x228>
804094bc:	000a0593          	mv	a1,s4
804094c0:	00090513          	mv	a0,s2
804094c4:	bcdff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804094c8:	3b950e63          	beq	a0,s9,80409884 <stride_dequeue+0x460>
804094cc:	004a2783          	lw	a5,4(s4)
804094d0:	008a2d83          	lw	s11,8(s4)
804094d4:	00f12023          	sw	a5,0(sp)
804094d8:	160d8063          	beqz	s11,80409638 <stride_dequeue+0x214>
804094dc:	000d8593          	mv	a1,s11
804094e0:	00090513          	mv	a0,s2
804094e4:	badff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804094e8:	2b9500e3          	beq	a0,s9,80409f88 <stride_dequeue+0xb64>
804094ec:	004da783          	lw	a5,4(s11)
804094f0:	008dac83          	lw	s9,8(s11)
804094f4:	00f12223          	sw	a5,4(sp)
804094f8:	120c8663          	beqz	s9,80409624 <stride_dequeue+0x200>
804094fc:	000c8593          	mv	a1,s9
80409500:	00090513          	mv	a0,s2
80409504:	b8dff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409508:	fff00893          	li	a7,-1
8040950c:	171504e3          	beq	a0,a7,80409e74 <stride_dequeue+0xa50>
80409510:	004ca783          	lw	a5,4(s9)
80409514:	008ca803          	lw	a6,8(s9)
80409518:	00f12423          	sw	a5,8(sp)
8040951c:	0e080a63          	beqz	a6,80409610 <stride_dequeue+0x1ec>
80409520:	00080593          	mv	a1,a6
80409524:	00090513          	mv	a0,s2
80409528:	01012623          	sw	a6,12(sp)
8040952c:	b65ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409530:	fff00893          	li	a7,-1
80409534:	00c12803          	lw	a6,12(sp)
80409538:	01151463          	bne	a0,a7,80409540 <stride_dequeue+0x11c>
8040953c:	02c0106f          	j	8040a568 <stride_dequeue+0x1144>
80409540:	00482703          	lw	a4,4(a6) # fffff004 <end+0x7fb62748>
80409544:	00882783          	lw	a5,8(a6)
80409548:	00e12623          	sw	a4,12(sp)
8040954c:	0a078863          	beqz	a5,804095fc <stride_dequeue+0x1d8>
80409550:	00078593          	mv	a1,a5
80409554:	00090513          	mv	a0,s2
80409558:	01012a23          	sw	a6,20(sp)
8040955c:	00f12823          	sw	a5,16(sp)
80409560:	b31ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409564:	fff00893          	li	a7,-1
80409568:	01012783          	lw	a5,16(sp)
8040956c:	01412803          	lw	a6,20(sp)
80409570:	01151463          	bne	a0,a7,80409578 <stride_dequeue+0x154>
80409574:	7900106f          	j	8040ad04 <stride_dequeue+0x18e0>
80409578:	0047a703          	lw	a4,4(a5)
8040957c:	0087ab03          	lw	s6,8(a5)
80409580:	00e12823          	sw	a4,16(sp)
80409584:	060b0263          	beqz	s6,804095e8 <stride_dequeue+0x1c4>
80409588:	000b0593          	mv	a1,s6
8040958c:	00090513          	mv	a0,s2
80409590:	00f12c23          	sw	a5,24(sp)
80409594:	01012a23          	sw	a6,20(sp)
80409598:	af9ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040959c:	fff00893          	li	a7,-1
804095a0:	01412803          	lw	a6,20(sp)
804095a4:	01812783          	lw	a5,24(sp)
804095a8:	01151463          	bne	a0,a7,804095b0 <stride_dequeue+0x18c>
804095ac:	0a00206f          	j	8040b64c <stride_dequeue+0x2228>
804095b0:	008b2583          	lw	a1,8(s6)
804095b4:	004b2983          	lw	s3,4(s6)
804095b8:	00090513          	mv	a0,s2
804095bc:	00f12c23          	sw	a5,24(sp)
804095c0:	01012a23          	sw	a6,20(sp)
804095c4:	b89ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
804095c8:	00ab2223          	sw	a0,4(s6)
804095cc:	013b2423          	sw	s3,8(s6)
804095d0:	01412803          	lw	a6,20(sp)
804095d4:	01812783          	lw	a5,24(sp)
804095d8:	00050463          	beqz	a0,804095e0 <stride_dequeue+0x1bc>
804095dc:	01652023          	sw	s6,0(a0)
804095e0:	008c2983          	lw	s3,8(s8)
804095e4:	000b0913          	mv	s2,s6
804095e8:	01012703          	lw	a4,16(sp)
804095ec:	0127a223          	sw	s2,4(a5)
804095f0:	00e7a423          	sw	a4,8(a5)
804095f4:	00f92023          	sw	a5,0(s2)
804095f8:	00078913          	mv	s2,a5
804095fc:	00c12783          	lw	a5,12(sp)
80409600:	01282223          	sw	s2,4(a6)
80409604:	00f82423          	sw	a5,8(a6)
80409608:	01092023          	sw	a6,0(s2)
8040960c:	00080913          	mv	s2,a6
80409610:	00812783          	lw	a5,8(sp)
80409614:	012ca223          	sw	s2,4(s9)
80409618:	00fca423          	sw	a5,8(s9)
8040961c:	01992023          	sw	s9,0(s2)
80409620:	000c8913          	mv	s2,s9
80409624:	00412783          	lw	a5,4(sp)
80409628:	012da223          	sw	s2,4(s11)
8040962c:	00fda423          	sw	a5,8(s11)
80409630:	01b92023          	sw	s11,0(s2)
80409634:	000d8913          	mv	s2,s11
80409638:	00012783          	lw	a5,0(sp)
8040963c:	012a2223          	sw	s2,4(s4)
80409640:	00fa2423          	sw	a5,8(s4)
80409644:	01492023          	sw	s4,0(s2)
80409648:	000a0913          	mv	s2,s4
8040964c:	01242223          	sw	s2,4(s0)
80409650:	01742423          	sw	s7,8(s0)
80409654:	00892023          	sw	s0,0(s2)
80409658:	01a42023          	sw	s10,0(s0)
8040965c:	200d0c63          	beqz	s10,80409874 <stride_dequeue+0x450>
80409660:	004d2683          	lw	a3,4(s10)
80409664:	0c848493          	addi	s1,s1,200
80409668:	20968a63          	beq	a3,s1,8040987c <stride_dequeue+0x458>
8040966c:	008d2423          	sw	s0,8(s10)
80409670:	05c12083          	lw	ra,92(sp)
80409674:	05812403          	lw	s0,88(sp)
80409678:	fff98993          	addi	s3,s3,-1
8040967c:	015c2823          	sw	s5,16(s8)
80409680:	013c2423          	sw	s3,8(s8)
80409684:	05412483          	lw	s1,84(sp)
80409688:	05012903          	lw	s2,80(sp)
8040968c:	04c12983          	lw	s3,76(sp)
80409690:	04812a03          	lw	s4,72(sp)
80409694:	04412a83          	lw	s5,68(sp)
80409698:	04012b03          	lw	s6,64(sp)
8040969c:	03c12b83          	lw	s7,60(sp)
804096a0:	03812c03          	lw	s8,56(sp)
804096a4:	03412c83          	lw	s9,52(sp)
804096a8:	03012d03          	lw	s10,48(sp)
804096ac:	02c12d83          	lw	s11,44(sp)
804096b0:	06010113          	addi	sp,sp,96
804096b4:	00008067          	ret
804096b8:	00892d83          	lw	s11,8(s2)
804096bc:	00492b83          	lw	s7,4(s2)
804096c0:	180d8a63          	beqz	s11,80409854 <stride_dequeue+0x430>
804096c4:	00040593          	mv	a1,s0
804096c8:	000d8513          	mv	a0,s11
804096cc:	9c5ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804096d0:	37450463          	beq	a0,s4,80409a38 <stride_dequeue+0x614>
804096d4:	00442783          	lw	a5,4(s0)
804096d8:	00842c83          	lw	s9,8(s0)
804096dc:	00f12023          	sw	a5,0(sp)
804096e0:	160c8263          	beqz	s9,80409844 <stride_dequeue+0x420>
804096e4:	000c8593          	mv	a1,s9
804096e8:	000d8513          	mv	a0,s11
804096ec:	9a5ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804096f0:	4d450863          	beq	a0,s4,80409bc0 <stride_dequeue+0x79c>
804096f4:	004ca783          	lw	a5,4(s9)
804096f8:	008caa03          	lw	s4,8(s9)
804096fc:	00f12223          	sw	a5,4(sp)
80409700:	120a0863          	beqz	s4,80409830 <stride_dequeue+0x40c>
80409704:	000a0593          	mv	a1,s4
80409708:	000d8513          	mv	a0,s11
8040970c:	985ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409710:	fff00893          	li	a7,-1
80409714:	551502e3          	beq	a0,a7,8040a458 <stride_dequeue+0x1034>
80409718:	004a2783          	lw	a5,4(s4)
8040971c:	008a2803          	lw	a6,8(s4)
80409720:	00f12423          	sw	a5,8(sp)
80409724:	0e080c63          	beqz	a6,8040981c <stride_dequeue+0x3f8>
80409728:	00080593          	mv	a1,a6
8040972c:	000d8513          	mv	a0,s11
80409730:	01012623          	sw	a6,12(sp)
80409734:	95dff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409738:	fff00893          	li	a7,-1
8040973c:	00c12803          	lw	a6,12(sp)
80409740:	01151463          	bne	a0,a7,80409748 <stride_dequeue+0x324>
80409744:	4000106f          	j	8040ab44 <stride_dequeue+0x1720>
80409748:	00482783          	lw	a5,4(a6)
8040974c:	00882303          	lw	t1,8(a6)
80409750:	00f12623          	sw	a5,12(sp)
80409754:	0a030a63          	beqz	t1,80409808 <stride_dequeue+0x3e4>
80409758:	00030593          	mv	a1,t1
8040975c:	000d8513          	mv	a0,s11
80409760:	01012a23          	sw	a6,20(sp)
80409764:	00612823          	sw	t1,16(sp)
80409768:	929ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040976c:	fff00893          	li	a7,-1
80409770:	01012303          	lw	t1,16(sp)
80409774:	01412803          	lw	a6,20(sp)
80409778:	01151463          	bne	a0,a7,80409780 <stride_dequeue+0x35c>
8040977c:	5cd0106f          	j	8040b548 <stride_dequeue+0x2124>
80409780:	00432783          	lw	a5,4(t1)
80409784:	00832983          	lw	s3,8(t1)
80409788:	00f12823          	sw	a5,16(sp)
8040978c:	00099463          	bnez	s3,80409794 <stride_dequeue+0x370>
80409790:	44c0206f          	j	8040bbdc <stride_dequeue+0x27b8>
80409794:	00098593          	mv	a1,s3
80409798:	000d8513          	mv	a0,s11
8040979c:	00612c23          	sw	t1,24(sp)
804097a0:	01012a23          	sw	a6,20(sp)
804097a4:	8edff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804097a8:	fff00893          	li	a7,-1
804097ac:	01412803          	lw	a6,20(sp)
804097b0:	01812303          	lw	t1,24(sp)
804097b4:	01151463          	bne	a0,a7,804097bc <stride_dequeue+0x398>
804097b8:	6ac0206f          	j	8040be64 <stride_dequeue+0x2a40>
804097bc:	0089a583          	lw	a1,8(s3)
804097c0:	0049ab03          	lw	s6,4(s3)
804097c4:	000d8513          	mv	a0,s11
804097c8:	00612c23          	sw	t1,24(sp)
804097cc:	01012a23          	sw	a6,20(sp)
804097d0:	97dff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
804097d4:	00a9a223          	sw	a0,4(s3)
804097d8:	0169a423          	sw	s6,8(s3)
804097dc:	01412803          	lw	a6,20(sp)
804097e0:	01812303          	lw	t1,24(sp)
804097e4:	00050463          	beqz	a0,804097ec <stride_dequeue+0x3c8>
804097e8:	01352023          	sw	s3,0(a0)
804097ec:	008c2b03          	lw	s6,8(s8)
804097f0:	01012783          	lw	a5,16(sp)
804097f4:	01332223          	sw	s3,4(t1)
804097f8:	00030d93          	mv	s11,t1
804097fc:	00f32423          	sw	a5,8(t1)
80409800:	0069a023          	sw	t1,0(s3)
80409804:	000b0993          	mv	s3,s6
80409808:	00c12783          	lw	a5,12(sp)
8040980c:	01b82223          	sw	s11,4(a6)
80409810:	00f82423          	sw	a5,8(a6)
80409814:	010da023          	sw	a6,0(s11)
80409818:	00080d93          	mv	s11,a6
8040981c:	00812783          	lw	a5,8(sp)
80409820:	01ba2223          	sw	s11,4(s4)
80409824:	00fa2423          	sw	a5,8(s4)
80409828:	014da023          	sw	s4,0(s11)
8040982c:	000a0d93          	mv	s11,s4
80409830:	00412783          	lw	a5,4(sp)
80409834:	01bca223          	sw	s11,4(s9)
80409838:	00fca423          	sw	a5,8(s9)
8040983c:	019da023          	sw	s9,0(s11)
80409840:	000c8d93          	mv	s11,s9
80409844:	00012783          	lw	a5,0(sp)
80409848:	01b42223          	sw	s11,4(s0)
8040984c:	00f42423          	sw	a5,8(s0)
80409850:	008da023          	sw	s0,0(s11)
80409854:	00892223          	sw	s0,4(s2)
80409858:	01792423          	sw	s7,8(s2)
8040985c:	01242023          	sw	s2,0(s0)
80409860:	00090413          	mv	s0,s2
80409864:	01a42023          	sw	s10,0(s0)
80409868:	df5ff06f          	j	8040965c <stride_dequeue+0x238>
8040986c:	de0416e3          	bnez	s0,80409658 <stride_dequeue+0x234>
80409870:	de0d18e3          	bnez	s10,80409660 <stride_dequeue+0x23c>
80409874:	00040a93          	mv	s5,s0
80409878:	df9ff06f          	j	80409670 <stride_dequeue+0x24c>
8040987c:	008d2223          	sw	s0,4(s10)
80409880:	df1ff06f          	j	80409670 <stride_dequeue+0x24c>
80409884:	00892d83          	lw	s11,8(s2)
80409888:	00a12023          	sw	a0,0(sp)
8040988c:	00492c83          	lw	s9,4(s2)
80409890:	180d8663          	beqz	s11,80409a1c <stride_dequeue+0x5f8>
80409894:	000a0593          	mv	a1,s4
80409898:	000d8513          	mv	a0,s11
8040989c:	ff4ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804098a0:	00012783          	lw	a5,0(sp)
804098a4:	46f50263          	beq	a0,a5,80409d08 <stride_dequeue+0x8e4>
804098a8:	004a2783          	lw	a5,4(s4)
804098ac:	008a2603          	lw	a2,8(s4)
804098b0:	00f12023          	sw	a5,0(sp)
804098b4:	14060c63          	beqz	a2,80409a0c <stride_dequeue+0x5e8>
804098b8:	00060593          	mv	a1,a2
804098bc:	000d8513          	mv	a0,s11
804098c0:	00c12223          	sw	a2,4(sp)
804098c4:	fccff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804098c8:	fff00893          	li	a7,-1
804098cc:	00412603          	lw	a2,4(sp)
804098d0:	25150ce3          	beq	a0,a7,8040a328 <stride_dequeue+0xf04>
804098d4:	00462783          	lw	a5,4(a2)
804098d8:	00862803          	lw	a6,8(a2)
804098dc:	00f12223          	sw	a5,4(sp)
804098e0:	10080c63          	beqz	a6,804099f8 <stride_dequeue+0x5d4>
804098e4:	00080593          	mv	a1,a6
804098e8:	000d8513          	mv	a0,s11
804098ec:	00c12623          	sw	a2,12(sp)
804098f0:	01012423          	sw	a6,8(sp)
804098f4:	f9cff0ef          	jal	ra,80409090 <proc_stride_comp_f>
804098f8:	fff00893          	li	a7,-1
804098fc:	00812803          	lw	a6,8(sp)
80409900:	00c12603          	lw	a2,12(sp)
80409904:	01151463          	bne	a0,a7,8040990c <stride_dequeue+0x4e8>
80409908:	3100106f          	j	8040ac18 <stride_dequeue+0x17f4>
8040990c:	00482783          	lw	a5,4(a6)
80409910:	00882303          	lw	t1,8(a6)
80409914:	00f12423          	sw	a5,8(sp)
80409918:	0c030663          	beqz	t1,804099e4 <stride_dequeue+0x5c0>
8040991c:	00030593          	mv	a1,t1
80409920:	000d8513          	mv	a0,s11
80409924:	01012a23          	sw	a6,20(sp)
80409928:	00c12823          	sw	a2,16(sp)
8040992c:	00612623          	sw	t1,12(sp)
80409930:	f60ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409934:	fff00893          	li	a7,-1
80409938:	00c12303          	lw	t1,12(sp)
8040993c:	01012603          	lw	a2,16(sp)
80409940:	01412803          	lw	a6,20(sp)
80409944:	01151463          	bne	a0,a7,8040994c <stride_dequeue+0x528>
80409948:	2e90106f          	j	8040b430 <stride_dequeue+0x200c>
8040994c:	00432783          	lw	a5,4(t1)
80409950:	00832983          	lw	s3,8(t1)
80409954:	00f12623          	sw	a5,12(sp)
80409958:	00099463          	bnez	s3,80409960 <stride_dequeue+0x53c>
8040995c:	4240206f          	j	8040bd80 <stride_dequeue+0x295c>
80409960:	00098593          	mv	a1,s3
80409964:	000d8513          	mv	a0,s11
80409968:	00612c23          	sw	t1,24(sp)
8040996c:	01012a23          	sw	a6,20(sp)
80409970:	00c12823          	sw	a2,16(sp)
80409974:	f1cff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409978:	fff00893          	li	a7,-1
8040997c:	01012603          	lw	a2,16(sp)
80409980:	01412803          	lw	a6,20(sp)
80409984:	01812303          	lw	t1,24(sp)
80409988:	01151463          	bne	a0,a7,80409990 <stride_dequeue+0x56c>
8040998c:	3fc0206f          	j	8040bd88 <stride_dequeue+0x2964>
80409990:	0089a583          	lw	a1,8(s3)
80409994:	0049ab03          	lw	s6,4(s3)
80409998:	000d8513          	mv	a0,s11
8040999c:	00612c23          	sw	t1,24(sp)
804099a0:	01012a23          	sw	a6,20(sp)
804099a4:	00c12823          	sw	a2,16(sp)
804099a8:	fa4ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
804099ac:	00a9a223          	sw	a0,4(s3)
804099b0:	0169a423          	sw	s6,8(s3)
804099b4:	01012603          	lw	a2,16(sp)
804099b8:	01412803          	lw	a6,20(sp)
804099bc:	01812303          	lw	t1,24(sp)
804099c0:	00050463          	beqz	a0,804099c8 <stride_dequeue+0x5a4>
804099c4:	01352023          	sw	s3,0(a0)
804099c8:	008c2b03          	lw	s6,8(s8)
804099cc:	00c12783          	lw	a5,12(sp)
804099d0:	01332223          	sw	s3,4(t1)
804099d4:	00030d93          	mv	s11,t1
804099d8:	00f32423          	sw	a5,8(t1)
804099dc:	0069a023          	sw	t1,0(s3)
804099e0:	000b0993          	mv	s3,s6
804099e4:	00812783          	lw	a5,8(sp)
804099e8:	01b82223          	sw	s11,4(a6)
804099ec:	00f82423          	sw	a5,8(a6)
804099f0:	010da023          	sw	a6,0(s11)
804099f4:	00080d93          	mv	s11,a6
804099f8:	00412783          	lw	a5,4(sp)
804099fc:	01b62223          	sw	s11,4(a2)
80409a00:	00f62423          	sw	a5,8(a2)
80409a04:	00cda023          	sw	a2,0(s11)
80409a08:	00060d93          	mv	s11,a2
80409a0c:	00012783          	lw	a5,0(sp)
80409a10:	01ba2223          	sw	s11,4(s4)
80409a14:	00fa2423          	sw	a5,8(s4)
80409a18:	014da023          	sw	s4,0(s11)
80409a1c:	01492223          	sw	s4,4(s2)
80409a20:	01992423          	sw	s9,8(s2)
80409a24:	012a2023          	sw	s2,0(s4)
80409a28:	c25ff06f          	j	8040964c <stride_dequeue+0x228>
80409a2c:	00090413          	mv	s0,s2
80409a30:	01a42023          	sw	s10,0(s0)
80409a34:	c29ff06f          	j	8040965c <stride_dequeue+0x238>
80409a38:	004da783          	lw	a5,4(s11)
80409a3c:	008dac83          	lw	s9,8(s11)
80409a40:	00a12223          	sw	a0,4(sp)
80409a44:	00f12023          	sw	a5,0(sp)
80409a48:	160c8063          	beqz	s9,80409ba8 <stride_dequeue+0x784>
80409a4c:	00040593          	mv	a1,s0
80409a50:	000c8513          	mv	a0,s9
80409a54:	e3cff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409a58:	00412783          	lw	a5,4(sp)
80409a5c:	66f50a63          	beq	a0,a5,8040a0d0 <stride_dequeue+0xcac>
80409a60:	00442783          	lw	a5,4(s0)
80409a64:	00842a03          	lw	s4,8(s0)
80409a68:	00f12223          	sw	a5,4(sp)
80409a6c:	120a0663          	beqz	s4,80409b98 <stride_dequeue+0x774>
80409a70:	000a0593          	mv	a1,s4
80409a74:	000c8513          	mv	a0,s9
80409a78:	e18ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409a7c:	fff00893          	li	a7,-1
80409a80:	4f1506e3          	beq	a0,a7,8040a76c <stride_dequeue+0x1348>
80409a84:	004a2783          	lw	a5,4(s4)
80409a88:	008a2803          	lw	a6,8(s4)
80409a8c:	00f12423          	sw	a5,8(sp)
80409a90:	0e080a63          	beqz	a6,80409b84 <stride_dequeue+0x760>
80409a94:	00080593          	mv	a1,a6
80409a98:	000c8513          	mv	a0,s9
80409a9c:	01012623          	sw	a6,12(sp)
80409aa0:	df0ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409aa4:	fff00893          	li	a7,-1
80409aa8:	00c12803          	lw	a6,12(sp)
80409aac:	01151463          	bne	a0,a7,80409ab4 <stride_dequeue+0x690>
80409ab0:	5640106f          	j	8040b014 <stride_dequeue+0x1bf0>
80409ab4:	00482783          	lw	a5,4(a6)
80409ab8:	00882983          	lw	s3,8(a6)
80409abc:	00f12623          	sw	a5,12(sp)
80409ac0:	00099463          	bnez	s3,80409ac8 <stride_dequeue+0x6a4>
80409ac4:	4380206f          	j	8040befc <stride_dequeue+0x2ad8>
80409ac8:	00098593          	mv	a1,s3
80409acc:	000c8513          	mv	a0,s9
80409ad0:	01012823          	sw	a6,16(sp)
80409ad4:	dbcff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409ad8:	fff00893          	li	a7,-1
80409adc:	01012803          	lw	a6,16(sp)
80409ae0:	01151463          	bne	a0,a7,80409ae8 <stride_dequeue+0x6c4>
80409ae4:	0780206f          	j	8040bb5c <stride_dequeue+0x2738>
80409ae8:	0049a783          	lw	a5,4(s3)
80409aec:	0089ae03          	lw	t3,8(s3)
80409af0:	00f12823          	sw	a5,16(sp)
80409af4:	060e0463          	beqz	t3,80409b5c <stride_dequeue+0x738>
80409af8:	000e0593          	mv	a1,t3
80409afc:	000c8513          	mv	a0,s9
80409b00:	01012c23          	sw	a6,24(sp)
80409b04:	01c12a23          	sw	t3,20(sp)
80409b08:	d88ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409b0c:	fff00893          	li	a7,-1
80409b10:	01412e03          	lw	t3,20(sp)
80409b14:	01812803          	lw	a6,24(sp)
80409b18:	01151463          	bne	a0,a7,80409b20 <stride_dequeue+0x6fc>
80409b1c:	6a40206f          	j	8040c1c0 <stride_dequeue+0x2d9c>
80409b20:	008e2583          	lw	a1,8(t3)
80409b24:	000c8513          	mv	a0,s9
80409b28:	004e2b03          	lw	s6,4(t3)
80409b2c:	01012c23          	sw	a6,24(sp)
80409b30:	01c12a23          	sw	t3,20(sp)
80409b34:	e18ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
80409b38:	01412e03          	lw	t3,20(sp)
80409b3c:	01812803          	lw	a6,24(sp)
80409b40:	00ae2223          	sw	a0,4(t3)
80409b44:	016e2423          	sw	s6,8(t3)
80409b48:	00051463          	bnez	a0,80409b50 <stride_dequeue+0x72c>
80409b4c:	0e90206f          	j	8040c434 <stride_dequeue+0x3010>
80409b50:	008c2b03          	lw	s6,8(s8)
80409b54:	01c52023          	sw	t3,0(a0)
80409b58:	000e0c93          	mv	s9,t3
80409b5c:	01012783          	lw	a5,16(sp)
80409b60:	0199a223          	sw	s9,4(s3)
80409b64:	00f9a423          	sw	a5,8(s3)
80409b68:	013ca023          	sw	s3,0(s9)
80409b6c:	00c12783          	lw	a5,12(sp)
80409b70:	01382223          	sw	s3,4(a6)
80409b74:	00080c93          	mv	s9,a6
80409b78:	00f82423          	sw	a5,8(a6)
80409b7c:	0109a023          	sw	a6,0(s3)
80409b80:	000b0993          	mv	s3,s6
80409b84:	00812783          	lw	a5,8(sp)
80409b88:	019a2223          	sw	s9,4(s4)
80409b8c:	00fa2423          	sw	a5,8(s4)
80409b90:	014ca023          	sw	s4,0(s9)
80409b94:	000a0c93          	mv	s9,s4
80409b98:	00412783          	lw	a5,4(sp)
80409b9c:	01942223          	sw	s9,4(s0)
80409ba0:	00f42423          	sw	a5,8(s0)
80409ba4:	008ca023          	sw	s0,0(s9)
80409ba8:	00012783          	lw	a5,0(sp)
80409bac:	008da223          	sw	s0,4(s11)
80409bb0:	00fda423          	sw	a5,8(s11)
80409bb4:	01b42023          	sw	s11,0(s0)
80409bb8:	000d8413          	mv	s0,s11
80409bbc:	c99ff06f          	j	80409854 <stride_dequeue+0x430>
80409bc0:	004da783          	lw	a5,4(s11)
80409bc4:	008daa03          	lw	s4,8(s11)
80409bc8:	00f12223          	sw	a5,4(sp)
80409bcc:	120a0463          	beqz	s4,80409cf4 <stride_dequeue+0x8d0>
80409bd0:	000c8593          	mv	a1,s9
80409bd4:	000a0513          	mv	a0,s4
80409bd8:	cb8ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409bdc:	fff00893          	li	a7,-1
80409be0:	4b1500e3          	beq	a0,a7,8040a880 <stride_dequeue+0x145c>
80409be4:	004ca783          	lw	a5,4(s9)
80409be8:	008ca803          	lw	a6,8(s9)
80409bec:	00f12423          	sw	a5,8(sp)
80409bf0:	0e080a63          	beqz	a6,80409ce4 <stride_dequeue+0x8c0>
80409bf4:	00080593          	mv	a1,a6
80409bf8:	000a0513          	mv	a0,s4
80409bfc:	01012623          	sw	a6,12(sp)
80409c00:	c90ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409c04:	fff00893          	li	a7,-1
80409c08:	00c12803          	lw	a6,12(sp)
80409c0c:	01151463          	bne	a0,a7,80409c14 <stride_dequeue+0x7f0>
80409c10:	4e00106f          	j	8040b0f0 <stride_dequeue+0x1ccc>
80409c14:	00482783          	lw	a5,4(a6)
80409c18:	00882983          	lw	s3,8(a6)
80409c1c:	00f12623          	sw	a5,12(sp)
80409c20:	00099463          	bnez	s3,80409c28 <stride_dequeue+0x804>
80409c24:	2b00206f          	j	8040bed4 <stride_dequeue+0x2ab0>
80409c28:	00098593          	mv	a1,s3
80409c2c:	000a0513          	mv	a0,s4
80409c30:	01012823          	sw	a6,16(sp)
80409c34:	c5cff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409c38:	fff00893          	li	a7,-1
80409c3c:	01012803          	lw	a6,16(sp)
80409c40:	01151463          	bne	a0,a7,80409c48 <stride_dequeue+0x824>
80409c44:	7a10106f          	j	8040bbe4 <stride_dequeue+0x27c0>
80409c48:	0049a783          	lw	a5,4(s3)
80409c4c:	0089ae03          	lw	t3,8(s3)
80409c50:	00f12823          	sw	a5,16(sp)
80409c54:	060e0463          	beqz	t3,80409cbc <stride_dequeue+0x898>
80409c58:	000e0593          	mv	a1,t3
80409c5c:	000a0513          	mv	a0,s4
80409c60:	01012c23          	sw	a6,24(sp)
80409c64:	01c12a23          	sw	t3,20(sp)
80409c68:	c28ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409c6c:	fff00893          	li	a7,-1
80409c70:	01412e03          	lw	t3,20(sp)
80409c74:	01812803          	lw	a6,24(sp)
80409c78:	01151463          	bne	a0,a7,80409c80 <stride_dequeue+0x85c>
80409c7c:	59c0206f          	j	8040c218 <stride_dequeue+0x2df4>
80409c80:	008e2583          	lw	a1,8(t3)
80409c84:	000a0513          	mv	a0,s4
80409c88:	004e2b03          	lw	s6,4(t3)
80409c8c:	01012c23          	sw	a6,24(sp)
80409c90:	01c12a23          	sw	t3,20(sp)
80409c94:	cb8ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
80409c98:	01412e03          	lw	t3,20(sp)
80409c9c:	01812803          	lw	a6,24(sp)
80409ca0:	00ae2223          	sw	a0,4(t3)
80409ca4:	016e2423          	sw	s6,8(t3)
80409ca8:	00051463          	bnez	a0,80409cb0 <stride_dequeue+0x88c>
80409cac:	7d00206f          	j	8040c47c <stride_dequeue+0x3058>
80409cb0:	008c2b03          	lw	s6,8(s8)
80409cb4:	01c52023          	sw	t3,0(a0)
80409cb8:	000e0a13          	mv	s4,t3
80409cbc:	01012783          	lw	a5,16(sp)
80409cc0:	0149a223          	sw	s4,4(s3)
80409cc4:	00f9a423          	sw	a5,8(s3)
80409cc8:	013a2023          	sw	s3,0(s4)
80409ccc:	00c12783          	lw	a5,12(sp)
80409cd0:	01382223          	sw	s3,4(a6)
80409cd4:	00080a13          	mv	s4,a6
80409cd8:	00f82423          	sw	a5,8(a6)
80409cdc:	0109a023          	sw	a6,0(s3)
80409ce0:	000b0993          	mv	s3,s6
80409ce4:	00812783          	lw	a5,8(sp)
80409ce8:	014ca223          	sw	s4,4(s9)
80409cec:	00fca423          	sw	a5,8(s9)
80409cf0:	019a2023          	sw	s9,0(s4)
80409cf4:	00412783          	lw	a5,4(sp)
80409cf8:	019da223          	sw	s9,4(s11)
80409cfc:	00fda423          	sw	a5,8(s11)
80409d00:	01bca023          	sw	s11,0(s9)
80409d04:	b41ff06f          	j	80409844 <stride_dequeue+0x420>
80409d08:	004da783          	lw	a5,4(s11)
80409d0c:	008da603          	lw	a2,8(s11)
80409d10:	00f12023          	sw	a5,0(sp)
80409d14:	14060463          	beqz	a2,80409e5c <stride_dequeue+0xa38>
80409d18:	00060513          	mv	a0,a2
80409d1c:	000a0593          	mv	a1,s4
80409d20:	00c12223          	sw	a2,4(sp)
80409d24:	b6cff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409d28:	fff00893          	li	a7,-1
80409d2c:	00412603          	lw	a2,4(sp)
80409d30:	111502e3          	beq	a0,a7,8040a634 <stride_dequeue+0x1210>
80409d34:	004a2783          	lw	a5,4(s4)
80409d38:	008a2803          	lw	a6,8(s4)
80409d3c:	00f12223          	sw	a5,4(sp)
80409d40:	10080663          	beqz	a6,80409e4c <stride_dequeue+0xa28>
80409d44:	00080593          	mv	a1,a6
80409d48:	00060513          	mv	a0,a2
80409d4c:	01012623          	sw	a6,12(sp)
80409d50:	00c12423          	sw	a2,8(sp)
80409d54:	b3cff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409d58:	fff00893          	li	a7,-1
80409d5c:	00812603          	lw	a2,8(sp)
80409d60:	00c12803          	lw	a6,12(sp)
80409d64:	01151463          	bne	a0,a7,80409d6c <stride_dequeue+0x948>
80409d68:	5540106f          	j	8040b2bc <stride_dequeue+0x1e98>
80409d6c:	00482783          	lw	a5,4(a6)
80409d70:	00882983          	lw	s3,8(a6)
80409d74:	00f12423          	sw	a5,8(sp)
80409d78:	00099463          	bnez	s3,80409d80 <stride_dequeue+0x95c>
80409d7c:	1980206f          	j	8040bf14 <stride_dequeue+0x2af0>
80409d80:	00060513          	mv	a0,a2
80409d84:	00098593          	mv	a1,s3
80409d88:	01012823          	sw	a6,16(sp)
80409d8c:	00c12623          	sw	a2,12(sp)
80409d90:	b00ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409d94:	fff00893          	li	a7,-1
80409d98:	00c12603          	lw	a2,12(sp)
80409d9c:	01012803          	lw	a6,16(sp)
80409da0:	01151463          	bne	a0,a7,80409da8 <stride_dequeue+0x984>
80409da4:	4290106f          	j	8040b9cc <stride_dequeue+0x25a8>
80409da8:	0049a783          	lw	a5,4(s3)
80409dac:	0089ae03          	lw	t3,8(s3)
80409db0:	00f12623          	sw	a5,12(sp)
80409db4:	060e0863          	beqz	t3,80409e24 <stride_dequeue+0xa00>
80409db8:	000e0593          	mv	a1,t3
80409dbc:	00060513          	mv	a0,a2
80409dc0:	01012c23          	sw	a6,24(sp)
80409dc4:	01c12a23          	sw	t3,20(sp)
80409dc8:	00c12823          	sw	a2,16(sp)
80409dcc:	ac4ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409dd0:	01812803          	lw	a6,24(sp)
80409dd4:	01412e03          	lw	t3,20(sp)
80409dd8:	fff00893          	li	a7,-1
80409ddc:	01012a23          	sw	a6,20(sp)
80409de0:	01012603          	lw	a2,16(sp)
80409de4:	01151463          	bne	a0,a7,80409dec <stride_dequeue+0x9c8>
80409de8:	3a00206f          	j	8040c188 <stride_dequeue+0x2d64>
80409dec:	008e2583          	lw	a1,8(t3)
80409df0:	00060513          	mv	a0,a2
80409df4:	004e2b03          	lw	s6,4(t3)
80409df8:	01c12823          	sw	t3,16(sp)
80409dfc:	b50ff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
80409e00:	01012e03          	lw	t3,16(sp)
80409e04:	01412803          	lw	a6,20(sp)
80409e08:	00ae2223          	sw	a0,4(t3)
80409e0c:	016e2423          	sw	s6,8(t3)
80409e10:	00051463          	bnez	a0,80409e18 <stride_dequeue+0x9f4>
80409e14:	62c0206f          	j	8040c440 <stride_dequeue+0x301c>
80409e18:	008c2b03          	lw	s6,8(s8)
80409e1c:	01c52023          	sw	t3,0(a0)
80409e20:	000e0613          	mv	a2,t3
80409e24:	00c12783          	lw	a5,12(sp)
80409e28:	00c9a223          	sw	a2,4(s3)
80409e2c:	00f9a423          	sw	a5,8(s3)
80409e30:	01362023          	sw	s3,0(a2)
80409e34:	00812783          	lw	a5,8(sp)
80409e38:	01382223          	sw	s3,4(a6)
80409e3c:	00080613          	mv	a2,a6
80409e40:	00f82423          	sw	a5,8(a6)
80409e44:	0109a023          	sw	a6,0(s3)
80409e48:	000b0993          	mv	s3,s6
80409e4c:	00412783          	lw	a5,4(sp)
80409e50:	00ca2223          	sw	a2,4(s4)
80409e54:	00fa2423          	sw	a5,8(s4)
80409e58:	01462023          	sw	s4,0(a2)
80409e5c:	00012783          	lw	a5,0(sp)
80409e60:	014da223          	sw	s4,4(s11)
80409e64:	00fda423          	sw	a5,8(s11)
80409e68:	01ba2023          	sw	s11,0(s4)
80409e6c:	000d8a13          	mv	s4,s11
80409e70:	badff06f          	j	80409a1c <stride_dequeue+0x5f8>
80409e74:	00492783          	lw	a5,4(s2)
80409e78:	00892883          	lw	a7,8(s2)
80409e7c:	00a12623          	sw	a0,12(sp)
80409e80:	00f12423          	sw	a5,8(sp)
80409e84:	0e088863          	beqz	a7,80409f74 <stride_dequeue+0xb50>
80409e88:	00088513          	mv	a0,a7
80409e8c:	000c8593          	mv	a1,s9
80409e90:	01112823          	sw	a7,16(sp)
80409e94:	9fcff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409e98:	00c12803          	lw	a6,12(sp)
80409e9c:	01012883          	lw	a7,16(sp)
80409ea0:	2f050ce3          	beq	a0,a6,8040a998 <stride_dequeue+0x1574>
80409ea4:	004ca783          	lw	a5,4(s9)
80409ea8:	008ca303          	lw	t1,8(s9)
80409eac:	01012823          	sw	a6,16(sp)
80409eb0:	00f12623          	sw	a5,12(sp)
80409eb4:	0a030863          	beqz	t1,80409f64 <stride_dequeue+0xb40>
80409eb8:	00030593          	mv	a1,t1
80409ebc:	00088513          	mv	a0,a7
80409ec0:	00612c23          	sw	t1,24(sp)
80409ec4:	01112a23          	sw	a7,20(sp)
80409ec8:	9c8ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409ecc:	01012803          	lw	a6,16(sp)
80409ed0:	01412883          	lw	a7,20(sp)
80409ed4:	01812303          	lw	t1,24(sp)
80409ed8:	01051463          	bne	a0,a6,80409ee0 <stride_dequeue+0xabc>
80409edc:	6f00106f          	j	8040b5cc <stride_dequeue+0x21a8>
80409ee0:	00432783          	lw	a5,4(t1)
80409ee4:	00832983          	lw	s3,8(t1)
80409ee8:	01012a23          	sw	a6,20(sp)
80409eec:	00f12823          	sw	a5,16(sp)
80409ef0:	00099463          	bnez	s3,80409ef8 <stride_dequeue+0xad4>
80409ef4:	3e50106f          	j	8040bad8 <stride_dequeue+0x26b4>
80409ef8:	00088513          	mv	a0,a7
80409efc:	00098593          	mv	a1,s3
80409f00:	00612e23          	sw	t1,28(sp)
80409f04:	01112c23          	sw	a7,24(sp)
80409f08:	988ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409f0c:	01412803          	lw	a6,20(sp)
80409f10:	01812883          	lw	a7,24(sp)
80409f14:	01c12303          	lw	t1,28(sp)
80409f18:	01051463          	bne	a0,a6,80409f20 <stride_dequeue+0xafc>
80409f1c:	6d90106f          	j	8040bdf4 <stride_dequeue+0x29d0>
80409f20:	0089a583          	lw	a1,8(s3)
80409f24:	0049ab03          	lw	s6,4(s3)
80409f28:	00088513          	mv	a0,a7
80409f2c:	00612a23          	sw	t1,20(sp)
80409f30:	a1cff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
80409f34:	00a9a223          	sw	a0,4(s3)
80409f38:	0169a423          	sw	s6,8(s3)
80409f3c:	01412303          	lw	t1,20(sp)
80409f40:	00050463          	beqz	a0,80409f48 <stride_dequeue+0xb24>
80409f44:	01352023          	sw	s3,0(a0)
80409f48:	008c2b03          	lw	s6,8(s8)
80409f4c:	01012783          	lw	a5,16(sp)
80409f50:	01332223          	sw	s3,4(t1)
80409f54:	00030893          	mv	a7,t1
80409f58:	00f32423          	sw	a5,8(t1)
80409f5c:	0069a023          	sw	t1,0(s3)
80409f60:	000b0993          	mv	s3,s6
80409f64:	00c12783          	lw	a5,12(sp)
80409f68:	011ca223          	sw	a7,4(s9)
80409f6c:	00fca423          	sw	a5,8(s9)
80409f70:	0198a023          	sw	s9,0(a7) # 2000 <_binary_bin_swap_img_size-0x6000>
80409f74:	00812783          	lw	a5,8(sp)
80409f78:	01992223          	sw	s9,4(s2)
80409f7c:	00f92423          	sw	a5,8(s2)
80409f80:	012ca023          	sw	s2,0(s9)
80409f84:	ea0ff06f          	j	80409624 <stride_dequeue+0x200>
80409f88:	00492783          	lw	a5,4(s2)
80409f8c:	00892c83          	lw	s9,8(s2)
80409f90:	00f12223          	sw	a5,4(sp)
80409f94:	120c8463          	beqz	s9,8040a0bc <stride_dequeue+0xc98>
80409f98:	000d8593          	mv	a1,s11
80409f9c:	000c8513          	mv	a0,s9
80409fa0:	8f0ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409fa4:	fff00893          	li	a7,-1
80409fa8:	27150663          	beq	a0,a7,8040a214 <stride_dequeue+0xdf0>
80409fac:	004da783          	lw	a5,4(s11)
80409fb0:	008da803          	lw	a6,8(s11)
80409fb4:	00f12423          	sw	a5,8(sp)
80409fb8:	0e080a63          	beqz	a6,8040a0ac <stride_dequeue+0xc88>
80409fbc:	00080593          	mv	a1,a6
80409fc0:	000c8513          	mv	a0,s9
80409fc4:	01012623          	sw	a6,12(sp)
80409fc8:	8c8ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409fcc:	fff00893          	li	a7,-1
80409fd0:	00c12803          	lw	a6,12(sp)
80409fd4:	29150ee3          	beq	a0,a7,8040aa70 <stride_dequeue+0x164c>
80409fd8:	00482783          	lw	a5,4(a6)
80409fdc:	00882303          	lw	t1,8(a6)
80409fe0:	00f12623          	sw	a5,12(sp)
80409fe4:	0a030a63          	beqz	t1,8040a098 <stride_dequeue+0xc74>
80409fe8:	00030593          	mv	a1,t1
80409fec:	000c8513          	mv	a0,s9
80409ff0:	01012a23          	sw	a6,20(sp)
80409ff4:	00612823          	sw	t1,16(sp)
80409ff8:	898ff0ef          	jal	ra,80409090 <proc_stride_comp_f>
80409ffc:	fff00893          	li	a7,-1
8040a000:	01012303          	lw	t1,16(sp)
8040a004:	01412803          	lw	a6,20(sp)
8040a008:	01151463          	bne	a0,a7,8040a010 <stride_dequeue+0xbec>
8040a00c:	4b80106f          	j	8040b4c4 <stride_dequeue+0x20a0>
8040a010:	00432783          	lw	a5,4(t1)
8040a014:	00832983          	lw	s3,8(t1)
8040a018:	00f12823          	sw	a5,16(sp)
8040a01c:	00099463          	bnez	s3,8040a024 <stride_dequeue+0xc00>
8040a020:	4c10106f          	j	8040bce0 <stride_dequeue+0x28bc>
8040a024:	00098593          	mv	a1,s3
8040a028:	000c8513          	mv	a0,s9
8040a02c:	00612c23          	sw	t1,24(sp)
8040a030:	01012a23          	sw	a6,20(sp)
8040a034:	85cff0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a038:	fff00893          	li	a7,-1
8040a03c:	01412803          	lw	a6,20(sp)
8040a040:	01812303          	lw	t1,24(sp)
8040a044:	01151463          	bne	a0,a7,8040a04c <stride_dequeue+0xc28>
8040a048:	5e90106f          	j	8040be30 <stride_dequeue+0x2a0c>
8040a04c:	0089a583          	lw	a1,8(s3)
8040a050:	0049ab03          	lw	s6,4(s3)
8040a054:	000c8513          	mv	a0,s9
8040a058:	00612c23          	sw	t1,24(sp)
8040a05c:	01012a23          	sw	a6,20(sp)
8040a060:	8ecff0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a064:	00a9a223          	sw	a0,4(s3)
8040a068:	0169a423          	sw	s6,8(s3)
8040a06c:	01412803          	lw	a6,20(sp)
8040a070:	01812303          	lw	t1,24(sp)
8040a074:	00050463          	beqz	a0,8040a07c <stride_dequeue+0xc58>
8040a078:	01352023          	sw	s3,0(a0)
8040a07c:	008c2b03          	lw	s6,8(s8)
8040a080:	01012783          	lw	a5,16(sp)
8040a084:	01332223          	sw	s3,4(t1)
8040a088:	00030c93          	mv	s9,t1
8040a08c:	00f32423          	sw	a5,8(t1)
8040a090:	0069a023          	sw	t1,0(s3)
8040a094:	000b0993          	mv	s3,s6
8040a098:	00c12783          	lw	a5,12(sp)
8040a09c:	01982223          	sw	s9,4(a6)
8040a0a0:	00f82423          	sw	a5,8(a6)
8040a0a4:	010ca023          	sw	a6,0(s9)
8040a0a8:	00080c93          	mv	s9,a6
8040a0ac:	00812783          	lw	a5,8(sp)
8040a0b0:	019da223          	sw	s9,4(s11)
8040a0b4:	00fda423          	sw	a5,8(s11)
8040a0b8:	01bca023          	sw	s11,0(s9)
8040a0bc:	00412783          	lw	a5,4(sp)
8040a0c0:	01b92223          	sw	s11,4(s2)
8040a0c4:	00f92423          	sw	a5,8(s2)
8040a0c8:	012da023          	sw	s2,0(s11)
8040a0cc:	d6cff06f          	j	80409638 <stride_dequeue+0x214>
8040a0d0:	004ca783          	lw	a5,4(s9)
8040a0d4:	008caa03          	lw	s4,8(s9)
8040a0d8:	00f12223          	sw	a5,4(sp)
8040a0dc:	120a0063          	beqz	s4,8040a1fc <stride_dequeue+0xdd8>
8040a0e0:	00040593          	mv	a1,s0
8040a0e4:	000a0513          	mv	a0,s4
8040a0e8:	fa9fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a0ec:	fff00893          	li	a7,-1
8040a0f0:	49150ee3          	beq	a0,a7,8040ad8c <stride_dequeue+0x1968>
8040a0f4:	00442783          	lw	a5,4(s0)
8040a0f8:	00842983          	lw	s3,8(s0)
8040a0fc:	00f12423          	sw	a5,8(sp)
8040a100:	00099463          	bnez	s3,8040a108 <stride_dequeue+0xce4>
8040a104:	4710106f          	j	8040bd74 <stride_dequeue+0x2950>
8040a108:	00098593          	mv	a1,s3
8040a10c:	000a0513          	mv	a0,s4
8040a110:	f81fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a114:	fff00893          	li	a7,-1
8040a118:	01151463          	bne	a0,a7,8040a120 <stride_dequeue+0xcfc>
8040a11c:	5dc0106f          	j	8040b6f8 <stride_dequeue+0x22d4>
8040a120:	0049a783          	lw	a5,4(s3)
8040a124:	0089a303          	lw	t1,8(s3)
8040a128:	00f12623          	sw	a5,12(sp)
8040a12c:	0a030663          	beqz	t1,8040a1d8 <stride_dequeue+0xdb4>
8040a130:	00030593          	mv	a1,t1
8040a134:	000a0513          	mv	a0,s4
8040a138:	00612823          	sw	t1,16(sp)
8040a13c:	f55fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a140:	fff00893          	li	a7,-1
8040a144:	01012303          	lw	t1,16(sp)
8040a148:	01151463          	bne	a0,a7,8040a150 <stride_dequeue+0xd2c>
8040a14c:	1cc0206f          	j	8040c318 <stride_dequeue+0x2ef4>
8040a150:	00432783          	lw	a5,4(t1)
8040a154:	00832e03          	lw	t3,8(t1)
8040a158:	00f12823          	sw	a5,16(sp)
8040a15c:	060e0463          	beqz	t3,8040a1c4 <stride_dequeue+0xda0>
8040a160:	000e0593          	mv	a1,t3
8040a164:	000a0513          	mv	a0,s4
8040a168:	00612c23          	sw	t1,24(sp)
8040a16c:	01c12a23          	sw	t3,20(sp)
8040a170:	f21fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a174:	fff00893          	li	a7,-1
8040a178:	01412e03          	lw	t3,20(sp)
8040a17c:	01812303          	lw	t1,24(sp)
8040a180:	01151463          	bne	a0,a7,8040a188 <stride_dequeue+0xd64>
8040a184:	66c0206f          	j	8040c7f0 <stride_dequeue+0x33cc>
8040a188:	008e2583          	lw	a1,8(t3)
8040a18c:	000a0513          	mv	a0,s4
8040a190:	004e2b03          	lw	s6,4(t3)
8040a194:	00612c23          	sw	t1,24(sp)
8040a198:	01c12a23          	sw	t3,20(sp)
8040a19c:	fb1fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a1a0:	01412e03          	lw	t3,20(sp)
8040a1a4:	01812303          	lw	t1,24(sp)
8040a1a8:	00ae2223          	sw	a0,4(t3)
8040a1ac:	016e2423          	sw	s6,8(t3)
8040a1b0:	00051463          	bnez	a0,8040a1b8 <stride_dequeue+0xd94>
8040a1b4:	1110206f          	j	8040cac4 <stride_dequeue+0x36a0>
8040a1b8:	008c2b03          	lw	s6,8(s8)
8040a1bc:	01c52023          	sw	t3,0(a0)
8040a1c0:	000e0a13          	mv	s4,t3
8040a1c4:	01012783          	lw	a5,16(sp)
8040a1c8:	01432223          	sw	s4,4(t1)
8040a1cc:	00f32423          	sw	a5,8(t1)
8040a1d0:	006a2023          	sw	t1,0(s4)
8040a1d4:	00030a13          	mv	s4,t1
8040a1d8:	00c12783          	lw	a5,12(sp)
8040a1dc:	0149a223          	sw	s4,4(s3)
8040a1e0:	00f9a423          	sw	a5,8(s3)
8040a1e4:	013a2023          	sw	s3,0(s4)
8040a1e8:	00812783          	lw	a5,8(sp)
8040a1ec:	01342223          	sw	s3,4(s0)
8040a1f0:	00f42423          	sw	a5,8(s0)
8040a1f4:	0089a023          	sw	s0,0(s3)
8040a1f8:	000b0993          	mv	s3,s6
8040a1fc:	00412783          	lw	a5,4(sp)
8040a200:	008ca223          	sw	s0,4(s9)
8040a204:	00fca423          	sw	a5,8(s9)
8040a208:	01942023          	sw	s9,0(s0)
8040a20c:	000c8413          	mv	s0,s9
8040a210:	999ff06f          	j	80409ba8 <stride_dequeue+0x784>
8040a214:	004ca783          	lw	a5,4(s9)
8040a218:	008ca883          	lw	a7,8(s9)
8040a21c:	00a12623          	sw	a0,12(sp)
8040a220:	00f12423          	sw	a5,8(sp)
8040a224:	0e088663          	beqz	a7,8040a310 <stride_dequeue+0xeec>
8040a228:	00088513          	mv	a0,a7
8040a22c:	000d8593          	mv	a1,s11
8040a230:	01112823          	sw	a7,16(sp)
8040a234:	e5dfe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a238:	00c12803          	lw	a6,12(sp)
8040a23c:	01012883          	lw	a7,16(sp)
8040a240:	41050ae3          	beq	a0,a6,8040ae54 <stride_dequeue+0x1a30>
8040a244:	004da783          	lw	a5,4(s11)
8040a248:	008da983          	lw	s3,8(s11)
8040a24c:	01012823          	sw	a6,16(sp)
8040a250:	00f12623          	sw	a5,12(sp)
8040a254:	00099463          	bnez	s3,8040a25c <stride_dequeue+0xe38>
8040a258:	4b50106f          	j	8040bf0c <stride_dequeue+0x2ae8>
8040a25c:	00088513          	mv	a0,a7
8040a260:	00098593          	mv	a1,s3
8040a264:	01112a23          	sw	a7,20(sp)
8040a268:	e29fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a26c:	01012803          	lw	a6,16(sp)
8040a270:	01412883          	lw	a7,20(sp)
8040a274:	01051463          	bne	a0,a6,8040a27c <stride_dequeue+0xe58>
8040a278:	64c0106f          	j	8040b8c4 <stride_dequeue+0x24a0>
8040a27c:	0049a783          	lw	a5,4(s3)
8040a280:	0089ae03          	lw	t3,8(s3)
8040a284:	01012a23          	sw	a6,20(sp)
8040a288:	00f12823          	sw	a5,16(sp)
8040a28c:	060e0063          	beqz	t3,8040a2ec <stride_dequeue+0xec8>
8040a290:	000e0593          	mv	a1,t3
8040a294:	00088513          	mv	a0,a7
8040a298:	01c12e23          	sw	t3,28(sp)
8040a29c:	01112c23          	sw	a7,24(sp)
8040a2a0:	df1fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a2a4:	01412803          	lw	a6,20(sp)
8040a2a8:	01812883          	lw	a7,24(sp)
8040a2ac:	01c12e03          	lw	t3,28(sp)
8040a2b0:	01051463          	bne	a0,a6,8040a2b8 <stride_dequeue+0xe94>
8040a2b4:	0bc0206f          	j	8040c370 <stride_dequeue+0x2f4c>
8040a2b8:	008e2583          	lw	a1,8(t3)
8040a2bc:	00088513          	mv	a0,a7
8040a2c0:	004e2b03          	lw	s6,4(t3)
8040a2c4:	01c12a23          	sw	t3,20(sp)
8040a2c8:	e85fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a2cc:	01412e03          	lw	t3,20(sp)
8040a2d0:	00ae2223          	sw	a0,4(t3)
8040a2d4:	016e2423          	sw	s6,8(t3)
8040a2d8:	00051463          	bnez	a0,8040a2e0 <stride_dequeue+0xebc>
8040a2dc:	2380206f          	j	8040c514 <stride_dequeue+0x30f0>
8040a2e0:	008c2b03          	lw	s6,8(s8)
8040a2e4:	01c52023          	sw	t3,0(a0)
8040a2e8:	000e0893          	mv	a7,t3
8040a2ec:	01012783          	lw	a5,16(sp)
8040a2f0:	0119a223          	sw	a7,4(s3)
8040a2f4:	00f9a423          	sw	a5,8(s3)
8040a2f8:	0138a023          	sw	s3,0(a7)
8040a2fc:	00c12783          	lw	a5,12(sp)
8040a300:	013da223          	sw	s3,4(s11)
8040a304:	00fda423          	sw	a5,8(s11)
8040a308:	01b9a023          	sw	s11,0(s3)
8040a30c:	000b0993          	mv	s3,s6
8040a310:	00812783          	lw	a5,8(sp)
8040a314:	01bca223          	sw	s11,4(s9)
8040a318:	00fca423          	sw	a5,8(s9)
8040a31c:	019da023          	sw	s9,0(s11)
8040a320:	000c8d93          	mv	s11,s9
8040a324:	d99ff06f          	j	8040a0bc <stride_dequeue+0xc98>
8040a328:	004da783          	lw	a5,4(s11)
8040a32c:	008da883          	lw	a7,8(s11)
8040a330:	00a12423          	sw	a0,8(sp)
8040a334:	00f12223          	sw	a5,4(sp)
8040a338:	10088663          	beqz	a7,8040a444 <stride_dequeue+0x1020>
8040a33c:	00060593          	mv	a1,a2
8040a340:	00088513          	mv	a0,a7
8040a344:	00c12823          	sw	a2,16(sp)
8040a348:	01112623          	sw	a7,12(sp)
8040a34c:	d45fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a350:	00812803          	lw	a6,8(sp)
8040a354:	00c12883          	lw	a7,12(sp)
8040a358:	01012603          	lw	a2,16(sp)
8040a35c:	670508e3          	beq	a0,a6,8040b1cc <stride_dequeue+0x1da8>
8040a360:	00462783          	lw	a5,4(a2)
8040a364:	00862983          	lw	s3,8(a2)
8040a368:	01012623          	sw	a6,12(sp)
8040a36c:	00f12423          	sw	a5,8(sp)
8040a370:	00099463          	bnez	s3,8040a378 <stride_dequeue+0xf54>
8040a374:	3910106f          	j	8040bf04 <stride_dequeue+0x2ae0>
8040a378:	00088513          	mv	a0,a7
8040a37c:	00098593          	mv	a1,s3
8040a380:	00c12a23          	sw	a2,20(sp)
8040a384:	01112823          	sw	a7,16(sp)
8040a388:	d09fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a38c:	00c12803          	lw	a6,12(sp)
8040a390:	01012883          	lw	a7,16(sp)
8040a394:	01412603          	lw	a2,20(sp)
8040a398:	01051463          	bne	a0,a6,8040a3a0 <stride_dequeue+0xf7c>
8040a39c:	5a40106f          	j	8040b940 <stride_dequeue+0x251c>
8040a3a0:	0049a783          	lw	a5,4(s3)
8040a3a4:	0089ae03          	lw	t3,8(s3)
8040a3a8:	01012823          	sw	a6,16(sp)
8040a3ac:	00f12623          	sw	a5,12(sp)
8040a3b0:	060e0863          	beqz	t3,8040a420 <stride_dequeue+0xffc>
8040a3b4:	000e0593          	mv	a1,t3
8040a3b8:	00088513          	mv	a0,a7
8040a3bc:	00c12e23          	sw	a2,28(sp)
8040a3c0:	01c12c23          	sw	t3,24(sp)
8040a3c4:	01112a23          	sw	a7,20(sp)
8040a3c8:	cc9fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a3cc:	01c12603          	lw	a2,28(sp)
8040a3d0:	01012803          	lw	a6,16(sp)
8040a3d4:	01412883          	lw	a7,20(sp)
8040a3d8:	00c12a23          	sw	a2,20(sp)
8040a3dc:	01812e03          	lw	t3,24(sp)
8040a3e0:	01051463          	bne	a0,a6,8040a3e8 <stride_dequeue+0xfc4>
8040a3e4:	5210106f          	j	8040c104 <stride_dequeue+0x2ce0>
8040a3e8:	008e2583          	lw	a1,8(t3)
8040a3ec:	00088513          	mv	a0,a7
8040a3f0:	004e2b03          	lw	s6,4(t3)
8040a3f4:	01c12823          	sw	t3,16(sp)
8040a3f8:	d55fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a3fc:	01012e03          	lw	t3,16(sp)
8040a400:	01412603          	lw	a2,20(sp)
8040a404:	00ae2223          	sw	a0,4(t3)
8040a408:	016e2423          	sw	s6,8(t3)
8040a40c:	00051463          	bnez	a0,8040a414 <stride_dequeue+0xff0>
8040a410:	1280206f          	j	8040c538 <stride_dequeue+0x3114>
8040a414:	008c2b03          	lw	s6,8(s8)
8040a418:	01c52023          	sw	t3,0(a0)
8040a41c:	000e0893          	mv	a7,t3
8040a420:	00c12783          	lw	a5,12(sp)
8040a424:	0119a223          	sw	a7,4(s3)
8040a428:	00f9a423          	sw	a5,8(s3)
8040a42c:	0138a023          	sw	s3,0(a7)
8040a430:	00812783          	lw	a5,8(sp)
8040a434:	01362223          	sw	s3,4(a2)
8040a438:	00f62423          	sw	a5,8(a2)
8040a43c:	00c9a023          	sw	a2,0(s3)
8040a440:	000b0993          	mv	s3,s6
8040a444:	00412783          	lw	a5,4(sp)
8040a448:	00cda223          	sw	a2,4(s11)
8040a44c:	00fda423          	sw	a5,8(s11)
8040a450:	01b62023          	sw	s11,0(a2)
8040a454:	db8ff06f          	j	80409a0c <stride_dequeue+0x5e8>
8040a458:	004da783          	lw	a5,4(s11)
8040a45c:	008da883          	lw	a7,8(s11)
8040a460:	00a12623          	sw	a0,12(sp)
8040a464:	00f12423          	sw	a5,8(sp)
8040a468:	0e088663          	beqz	a7,8040a554 <stride_dequeue+0x1130>
8040a46c:	00088513          	mv	a0,a7
8040a470:	000a0593          	mv	a1,s4
8040a474:	01112823          	sw	a7,16(sp)
8040a478:	c19fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a47c:	00c12803          	lw	a6,12(sp)
8040a480:	01012883          	lw	a7,16(sp)
8040a484:	2b0508e3          	beq	a0,a6,8040af34 <stride_dequeue+0x1b10>
8040a488:	004a2783          	lw	a5,4(s4)
8040a48c:	008a2983          	lw	s3,8(s4)
8040a490:	01012823          	sw	a6,16(sp)
8040a494:	00f12623          	sw	a5,12(sp)
8040a498:	00099463          	bnez	s3,8040a4a0 <stride_dequeue+0x107c>
8040a49c:	2810106f          	j	8040bf1c <stride_dequeue+0x2af8>
8040a4a0:	00088513          	mv	a0,a7
8040a4a4:	00098593          	mv	a1,s3
8040a4a8:	01112a23          	sw	a7,20(sp)
8040a4ac:	be5fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a4b0:	01012803          	lw	a6,16(sp)
8040a4b4:	01412883          	lw	a7,20(sp)
8040a4b8:	01051463          	bne	a0,a6,8040a4c0 <stride_dequeue+0x109c>
8040a4bc:	38c0106f          	j	8040b848 <stride_dequeue+0x2424>
8040a4c0:	0049a783          	lw	a5,4(s3)
8040a4c4:	0089ae03          	lw	t3,8(s3)
8040a4c8:	01012a23          	sw	a6,20(sp)
8040a4cc:	00f12823          	sw	a5,16(sp)
8040a4d0:	060e0063          	beqz	t3,8040a530 <stride_dequeue+0x110c>
8040a4d4:	000e0593          	mv	a1,t3
8040a4d8:	00088513          	mv	a0,a7
8040a4dc:	01c12e23          	sw	t3,28(sp)
8040a4e0:	01112c23          	sw	a7,24(sp)
8040a4e4:	badfe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a4e8:	01412803          	lw	a6,20(sp)
8040a4ec:	01812883          	lw	a7,24(sp)
8040a4f0:	01c12e03          	lw	t3,28(sp)
8040a4f4:	01051463          	bne	a0,a6,8040a4fc <stride_dequeue+0x10d8>
8040a4f8:	2890106f          	j	8040bf80 <stride_dequeue+0x2b5c>
8040a4fc:	008e2583          	lw	a1,8(t3)
8040a500:	00088513          	mv	a0,a7
8040a504:	004e2b03          	lw	s6,4(t3)
8040a508:	01c12a23          	sw	t3,20(sp)
8040a50c:	c41fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a510:	01412e03          	lw	t3,20(sp)
8040a514:	00ae2223          	sw	a0,4(t3)
8040a518:	016e2423          	sw	s6,8(t3)
8040a51c:	00051463          	bnez	a0,8040a524 <stride_dequeue+0x1100>
8040a520:	7b50106f          	j	8040c4d4 <stride_dequeue+0x30b0>
8040a524:	008c2b03          	lw	s6,8(s8)
8040a528:	01c52023          	sw	t3,0(a0)
8040a52c:	000e0893          	mv	a7,t3
8040a530:	01012783          	lw	a5,16(sp)
8040a534:	0119a223          	sw	a7,4(s3)
8040a538:	00f9a423          	sw	a5,8(s3)
8040a53c:	0138a023          	sw	s3,0(a7)
8040a540:	00c12783          	lw	a5,12(sp)
8040a544:	013a2223          	sw	s3,4(s4)
8040a548:	00fa2423          	sw	a5,8(s4)
8040a54c:	0149a023          	sw	s4,0(s3)
8040a550:	000b0993          	mv	s3,s6
8040a554:	00812783          	lw	a5,8(sp)
8040a558:	014da223          	sw	s4,4(s11)
8040a55c:	00fda423          	sw	a5,8(s11)
8040a560:	01ba2023          	sw	s11,0(s4)
8040a564:	accff06f          	j	80409830 <stride_dequeue+0x40c>
8040a568:	00492783          	lw	a5,4(s2)
8040a56c:	00892883          	lw	a7,8(s2)
8040a570:	00a12823          	sw	a0,16(sp)
8040a574:	00f12623          	sw	a5,12(sp)
8040a578:	0a088463          	beqz	a7,8040a620 <stride_dequeue+0x11fc>
8040a57c:	00080593          	mv	a1,a6
8040a580:	00088513          	mv	a0,a7
8040a584:	01012c23          	sw	a6,24(sp)
8040a588:	01112a23          	sw	a7,20(sp)
8040a58c:	b05fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a590:	01012303          	lw	t1,16(sp)
8040a594:	01412883          	lw	a7,20(sp)
8040a598:	01812803          	lw	a6,24(sp)
8040a59c:	606508e3          	beq	a0,t1,8040b3ac <stride_dequeue+0x1f88>
8040a5a0:	00482783          	lw	a5,4(a6)
8040a5a4:	00882983          	lw	s3,8(a6)
8040a5a8:	00612a23          	sw	t1,20(sp)
8040a5ac:	00f12823          	sw	a5,16(sp)
8040a5b0:	00099463          	bnez	s3,8040a5b8 <stride_dequeue+0x1194>
8040a5b4:	28c0106f          	j	8040b840 <stride_dequeue+0x241c>
8040a5b8:	00088513          	mv	a0,a7
8040a5bc:	00098593          	mv	a1,s3
8040a5c0:	01012e23          	sw	a6,28(sp)
8040a5c4:	01112c23          	sw	a7,24(sp)
8040a5c8:	ac9fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a5cc:	01412303          	lw	t1,20(sp)
8040a5d0:	01812883          	lw	a7,24(sp)
8040a5d4:	01c12803          	lw	a6,28(sp)
8040a5d8:	00651463          	bne	a0,t1,8040a5e0 <stride_dequeue+0x11bc>
8040a5dc:	0bd0106f          	j	8040be98 <stride_dequeue+0x2a74>
8040a5e0:	0089a583          	lw	a1,8(s3)
8040a5e4:	0049ab03          	lw	s6,4(s3)
8040a5e8:	00088513          	mv	a0,a7
8040a5ec:	01012a23          	sw	a6,20(sp)
8040a5f0:	b5dfe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a5f4:	00a9a223          	sw	a0,4(s3)
8040a5f8:	0169a423          	sw	s6,8(s3)
8040a5fc:	01412803          	lw	a6,20(sp)
8040a600:	00050463          	beqz	a0,8040a608 <stride_dequeue+0x11e4>
8040a604:	01352023          	sw	s3,0(a0)
8040a608:	008c2b03          	lw	s6,8(s8)
8040a60c:	01012783          	lw	a5,16(sp)
8040a610:	01382223          	sw	s3,4(a6)
8040a614:	00f82423          	sw	a5,8(a6)
8040a618:	0109a023          	sw	a6,0(s3)
8040a61c:	000b0993          	mv	s3,s6
8040a620:	00c12783          	lw	a5,12(sp)
8040a624:	01092223          	sw	a6,4(s2)
8040a628:	00f92423          	sw	a5,8(s2)
8040a62c:	01282023          	sw	s2,0(a6)
8040a630:	fe1fe06f          	j	80409610 <stride_dequeue+0x1ec>
8040a634:	00462783          	lw	a5,4(a2)
8040a638:	00862983          	lw	s3,8(a2)
8040a63c:	00a12423          	sw	a0,8(sp)
8040a640:	00f12223          	sw	a5,4(sp)
8040a644:	10098663          	beqz	s3,8040a750 <stride_dequeue+0x132c>
8040a648:	000a0593          	mv	a1,s4
8040a64c:	00098513          	mv	a0,s3
8040a650:	00c12623          	sw	a2,12(sp)
8040a654:	a3dfe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a658:	00812303          	lw	t1,8(sp)
8040a65c:	00c12603          	lw	a2,12(sp)
8040a660:	00651463          	bne	a0,t1,8040a668 <stride_dequeue+0x1244>
8040a664:	0180106f          	j	8040b67c <stride_dequeue+0x2258>
8040a668:	004a2783          	lw	a5,4(s4)
8040a66c:	008a2883          	lw	a7,8(s4)
8040a670:	00612623          	sw	t1,12(sp)
8040a674:	00f12423          	sw	a5,8(sp)
8040a678:	0c088463          	beqz	a7,8040a740 <stride_dequeue+0x131c>
8040a67c:	00088593          	mv	a1,a7
8040a680:	00098513          	mv	a0,s3
8040a684:	00c12a23          	sw	a2,20(sp)
8040a688:	01112823          	sw	a7,16(sp)
8040a68c:	a05fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a690:	00c12303          	lw	t1,12(sp)
8040a694:	01012883          	lw	a7,16(sp)
8040a698:	01412603          	lw	a2,20(sp)
8040a69c:	00651463          	bne	a0,t1,8040a6a4 <stride_dequeue+0x1280>
8040a6a0:	4a10106f          	j	8040c340 <stride_dequeue+0x2f1c>
8040a6a4:	0048a783          	lw	a5,4(a7)
8040a6a8:	0088ae03          	lw	t3,8(a7)
8040a6ac:	00612e23          	sw	t1,28(sp)
8040a6b0:	00f12623          	sw	a5,12(sp)
8040a6b4:	060e0c63          	beqz	t3,8040a72c <stride_dequeue+0x1308>
8040a6b8:	000e0593          	mv	a1,t3
8040a6bc:	00098513          	mv	a0,s3
8040a6c0:	01112c23          	sw	a7,24(sp)
8040a6c4:	00c12a23          	sw	a2,20(sp)
8040a6c8:	01c12823          	sw	t3,16(sp)
8040a6cc:	9c5fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a6d0:	01c12303          	lw	t1,28(sp)
8040a6d4:	01012e03          	lw	t3,16(sp)
8040a6d8:	01412603          	lw	a2,20(sp)
8040a6dc:	01812883          	lw	a7,24(sp)
8040a6e0:	00651463          	bne	a0,t1,8040a6e8 <stride_dequeue+0x12c4>
8040a6e4:	7d50106f          	j	8040c6b8 <stride_dequeue+0x3294>
8040a6e8:	008e2583          	lw	a1,8(t3)
8040a6ec:	00098513          	mv	a0,s3
8040a6f0:	004e2b03          	lw	s6,4(t3)
8040a6f4:	01112c23          	sw	a7,24(sp)
8040a6f8:	00c12a23          	sw	a2,20(sp)
8040a6fc:	01c12823          	sw	t3,16(sp)
8040a700:	a4dfe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a704:	01012e03          	lw	t3,16(sp)
8040a708:	01412603          	lw	a2,20(sp)
8040a70c:	01812883          	lw	a7,24(sp)
8040a710:	00ae2223          	sw	a0,4(t3)
8040a714:	016e2423          	sw	s6,8(t3)
8040a718:	00051463          	bnez	a0,8040a720 <stride_dequeue+0x12fc>
8040a71c:	2e80206f          	j	8040ca04 <stride_dequeue+0x35e0>
8040a720:	008c2b03          	lw	s6,8(s8)
8040a724:	01c52023          	sw	t3,0(a0)
8040a728:	000e0993          	mv	s3,t3
8040a72c:	00c12783          	lw	a5,12(sp)
8040a730:	0138a223          	sw	s3,4(a7)
8040a734:	00f8a423          	sw	a5,8(a7)
8040a738:	0119a023          	sw	a7,0(s3)
8040a73c:	00088993          	mv	s3,a7
8040a740:	00812783          	lw	a5,8(sp)
8040a744:	013a2223          	sw	s3,4(s4)
8040a748:	00fa2423          	sw	a5,8(s4)
8040a74c:	0149a023          	sw	s4,0(s3)
8040a750:	00412783          	lw	a5,4(sp)
8040a754:	01462223          	sw	s4,4(a2)
8040a758:	000b0993          	mv	s3,s6
8040a75c:	00f62423          	sw	a5,8(a2)
8040a760:	00ca2023          	sw	a2,0(s4)
8040a764:	00060a13          	mv	s4,a2
8040a768:	ef4ff06f          	j	80409e5c <stride_dequeue+0xa38>
8040a76c:	004ca783          	lw	a5,4(s9)
8040a770:	008ca983          	lw	s3,8(s9)
8040a774:	00a12623          	sw	a0,12(sp)
8040a778:	00f12423          	sw	a5,8(sp)
8040a77c:	0e098663          	beqz	s3,8040a868 <stride_dequeue+0x1444>
8040a780:	000a0593          	mv	a1,s4
8040a784:	00098513          	mv	a0,s3
8040a788:	909fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a78c:	00c12303          	lw	t1,12(sp)
8040a790:	00651463          	bne	a0,t1,8040a798 <stride_dequeue+0x1374>
8040a794:	7d10006f          	j	8040b764 <stride_dequeue+0x2340>
8040a798:	004a2783          	lw	a5,4(s4)
8040a79c:	008a2883          	lw	a7,8(s4)
8040a7a0:	00612823          	sw	t1,16(sp)
8040a7a4:	00f12623          	sw	a5,12(sp)
8040a7a8:	0a088863          	beqz	a7,8040a858 <stride_dequeue+0x1434>
8040a7ac:	00088593          	mv	a1,a7
8040a7b0:	00098513          	mv	a0,s3
8040a7b4:	01112a23          	sw	a7,20(sp)
8040a7b8:	8d9fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a7bc:	01012303          	lw	t1,16(sp)
8040a7c0:	01412883          	lw	a7,20(sp)
8040a7c4:	00651463          	bne	a0,t1,8040a7cc <stride_dequeue+0x13a8>
8040a7c8:	1990106f          	j	8040c160 <stride_dequeue+0x2d3c>
8040a7cc:	0048a783          	lw	a5,4(a7)
8040a7d0:	0088ae03          	lw	t3,8(a7)
8040a7d4:	00612e23          	sw	t1,28(sp)
8040a7d8:	00f12823          	sw	a5,16(sp)
8040a7dc:	060e0463          	beqz	t3,8040a844 <stride_dequeue+0x1420>
8040a7e0:	000e0593          	mv	a1,t3
8040a7e4:	00098513          	mv	a0,s3
8040a7e8:	01112c23          	sw	a7,24(sp)
8040a7ec:	01c12a23          	sw	t3,20(sp)
8040a7f0:	8a1fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a7f4:	01c12303          	lw	t1,28(sp)
8040a7f8:	01412e03          	lw	t3,20(sp)
8040a7fc:	01812883          	lw	a7,24(sp)
8040a800:	00651463          	bne	a0,t1,8040a808 <stride_dequeue+0x13e4>
8040a804:	07c0206f          	j	8040c880 <stride_dequeue+0x345c>
8040a808:	008e2583          	lw	a1,8(t3)
8040a80c:	00098513          	mv	a0,s3
8040a810:	004e2b03          	lw	s6,4(t3)
8040a814:	01112c23          	sw	a7,24(sp)
8040a818:	01c12a23          	sw	t3,20(sp)
8040a81c:	931fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a820:	01412e03          	lw	t3,20(sp)
8040a824:	01812883          	lw	a7,24(sp)
8040a828:	00ae2223          	sw	a0,4(t3)
8040a82c:	016e2423          	sw	s6,8(t3)
8040a830:	00051463          	bnez	a0,8040a838 <stride_dequeue+0x1414>
8040a834:	2780206f          	j	8040caac <stride_dequeue+0x3688>
8040a838:	008c2b03          	lw	s6,8(s8)
8040a83c:	01c52023          	sw	t3,0(a0)
8040a840:	000e0993          	mv	s3,t3
8040a844:	01012783          	lw	a5,16(sp)
8040a848:	0138a223          	sw	s3,4(a7)
8040a84c:	00f8a423          	sw	a5,8(a7)
8040a850:	0119a023          	sw	a7,0(s3)
8040a854:	00088993          	mv	s3,a7
8040a858:	00c12783          	lw	a5,12(sp)
8040a85c:	013a2223          	sw	s3,4(s4)
8040a860:	00fa2423          	sw	a5,8(s4)
8040a864:	0149a023          	sw	s4,0(s3)
8040a868:	00812783          	lw	a5,8(sp)
8040a86c:	014ca223          	sw	s4,4(s9)
8040a870:	000b0993          	mv	s3,s6
8040a874:	00fca423          	sw	a5,8(s9)
8040a878:	019a2023          	sw	s9,0(s4)
8040a87c:	b1cff06f          	j	80409b98 <stride_dequeue+0x774>
8040a880:	004a2783          	lw	a5,4(s4)
8040a884:	008a2983          	lw	s3,8(s4)
8040a888:	00a12623          	sw	a0,12(sp)
8040a88c:	00f12423          	sw	a5,8(sp)
8040a890:	0e098663          	beqz	s3,8040a97c <stride_dequeue+0x1558>
8040a894:	000c8593          	mv	a1,s9
8040a898:	00098513          	mv	a0,s3
8040a89c:	ff4fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a8a0:	00c12303          	lw	t1,12(sp)
8040a8a4:	00651463          	bne	a0,t1,8040a8ac <stride_dequeue+0x1488>
8040a8a8:	7290006f          	j	8040b7d0 <stride_dequeue+0x23ac>
8040a8ac:	004ca783          	lw	a5,4(s9)
8040a8b0:	008ca883          	lw	a7,8(s9)
8040a8b4:	00612823          	sw	t1,16(sp)
8040a8b8:	00f12623          	sw	a5,12(sp)
8040a8bc:	0a088863          	beqz	a7,8040a96c <stride_dequeue+0x1548>
8040a8c0:	00088593          	mv	a1,a7
8040a8c4:	00098513          	mv	a0,s3
8040a8c8:	01112a23          	sw	a7,20(sp)
8040a8cc:	fc4fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a8d0:	01012303          	lw	t1,16(sp)
8040a8d4:	01412883          	lw	a7,20(sp)
8040a8d8:	00651463          	bne	a0,t1,8040a8e0 <stride_dequeue+0x14bc>
8040a8dc:	05d0106f          	j	8040c138 <stride_dequeue+0x2d14>
8040a8e0:	0048a783          	lw	a5,4(a7)
8040a8e4:	0088ae03          	lw	t3,8(a7)
8040a8e8:	00612e23          	sw	t1,28(sp)
8040a8ec:	00f12823          	sw	a5,16(sp)
8040a8f0:	060e0463          	beqz	t3,8040a958 <stride_dequeue+0x1534>
8040a8f4:	000e0593          	mv	a1,t3
8040a8f8:	00098513          	mv	a0,s3
8040a8fc:	01112c23          	sw	a7,24(sp)
8040a900:	01c12a23          	sw	t3,20(sp)
8040a904:	f8cfe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a908:	01c12303          	lw	t1,28(sp)
8040a90c:	01412e03          	lw	t3,20(sp)
8040a910:	01812883          	lw	a7,24(sp)
8040a914:	00651463          	bne	a0,t1,8040a91c <stride_dequeue+0x14f8>
8040a918:	0040206f          	j	8040c91c <stride_dequeue+0x34f8>
8040a91c:	008e2583          	lw	a1,8(t3)
8040a920:	00098513          	mv	a0,s3
8040a924:	004e2b03          	lw	s6,4(t3)
8040a928:	01112c23          	sw	a7,24(sp)
8040a92c:	01c12a23          	sw	t3,20(sp)
8040a930:	81dfe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040a934:	01412e03          	lw	t3,20(sp)
8040a938:	01812883          	lw	a7,24(sp)
8040a93c:	00ae2223          	sw	a0,4(t3)
8040a940:	016e2423          	sw	s6,8(t3)
8040a944:	00051463          	bnez	a0,8040a94c <stride_dequeue+0x1528>
8040a948:	11c0206f          	j	8040ca64 <stride_dequeue+0x3640>
8040a94c:	008c2b03          	lw	s6,8(s8)
8040a950:	01c52023          	sw	t3,0(a0)
8040a954:	000e0993          	mv	s3,t3
8040a958:	01012783          	lw	a5,16(sp)
8040a95c:	0138a223          	sw	s3,4(a7)
8040a960:	00f8a423          	sw	a5,8(a7)
8040a964:	0119a023          	sw	a7,0(s3)
8040a968:	00088993          	mv	s3,a7
8040a96c:	00c12783          	lw	a5,12(sp)
8040a970:	013ca223          	sw	s3,4(s9)
8040a974:	00fca423          	sw	a5,8(s9)
8040a978:	0199a023          	sw	s9,0(s3)
8040a97c:	00812783          	lw	a5,8(sp)
8040a980:	019a2223          	sw	s9,4(s4)
8040a984:	000b0993          	mv	s3,s6
8040a988:	00fa2423          	sw	a5,8(s4)
8040a98c:	014ca023          	sw	s4,0(s9)
8040a990:	000a0c93          	mv	s9,s4
8040a994:	b60ff06f          	j	80409cf4 <stride_dequeue+0x8d0>
8040a998:	0048a783          	lw	a5,4(a7)
8040a99c:	0088a983          	lw	s3,8(a7)
8040a9a0:	00a12823          	sw	a0,16(sp)
8040a9a4:	00f12623          	sw	a5,12(sp)
8040a9a8:	0a098663          	beqz	s3,8040aa54 <stride_dequeue+0x1630>
8040a9ac:	000c8593          	mv	a1,s9
8040a9b0:	00098513          	mv	a0,s3
8040a9b4:	01112a23          	sw	a7,20(sp)
8040a9b8:	ed8fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a9bc:	01012303          	lw	t1,16(sp)
8040a9c0:	01412883          	lw	a7,20(sp)
8040a9c4:	00651463          	bne	a0,t1,8040a9cc <stride_dequeue+0x15a8>
8040a9c8:	2980106f          	j	8040bc60 <stride_dequeue+0x283c>
8040a9cc:	004ca783          	lw	a5,4(s9)
8040a9d0:	008cae03          	lw	t3,8(s9)
8040a9d4:	00612a23          	sw	t1,20(sp)
8040a9d8:	00f12823          	sw	a5,16(sp)
8040a9dc:	060e0463          	beqz	t3,8040aa44 <stride_dequeue+0x1620>
8040a9e0:	000e0593          	mv	a1,t3
8040a9e4:	00098513          	mv	a0,s3
8040a9e8:	01112e23          	sw	a7,28(sp)
8040a9ec:	01c12c23          	sw	t3,24(sp)
8040a9f0:	ea0fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040a9f4:	01412303          	lw	t1,20(sp)
8040a9f8:	01812e03          	lw	t3,24(sp)
8040a9fc:	01c12883          	lw	a7,28(sp)
8040aa00:	00651463          	bne	a0,t1,8040aa08 <stride_dequeue+0x15e4>
8040aa04:	0e50106f          	j	8040c2e8 <stride_dequeue+0x2ec4>
8040aa08:	008e2583          	lw	a1,8(t3)
8040aa0c:	00098513          	mv	a0,s3
8040aa10:	004e2b03          	lw	s6,4(t3)
8040aa14:	01112c23          	sw	a7,24(sp)
8040aa18:	01c12a23          	sw	t3,20(sp)
8040aa1c:	f30fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040aa20:	01412e03          	lw	t3,20(sp)
8040aa24:	01812883          	lw	a7,24(sp)
8040aa28:	00ae2223          	sw	a0,4(t3)
8040aa2c:	016e2423          	sw	s6,8(t3)
8040aa30:	00051463          	bnez	a0,8040aa38 <stride_dequeue+0x1614>
8040aa34:	2ed0106f          	j	8040c520 <stride_dequeue+0x30fc>
8040aa38:	008c2b03          	lw	s6,8(s8)
8040aa3c:	01c52023          	sw	t3,0(a0)
8040aa40:	000e0993          	mv	s3,t3
8040aa44:	01012783          	lw	a5,16(sp)
8040aa48:	013ca223          	sw	s3,4(s9)
8040aa4c:	00fca423          	sw	a5,8(s9)
8040aa50:	0199a023          	sw	s9,0(s3)
8040aa54:	00c12783          	lw	a5,12(sp)
8040aa58:	0198a223          	sw	s9,4(a7)
8040aa5c:	000b0993          	mv	s3,s6
8040aa60:	00f8a423          	sw	a5,8(a7)
8040aa64:	011ca023          	sw	a7,0(s9)
8040aa68:	00088c93          	mv	s9,a7
8040aa6c:	d08ff06f          	j	80409f74 <stride_dequeue+0xb50>
8040aa70:	004ca783          	lw	a5,4(s9)
8040aa74:	008ca983          	lw	s3,8(s9)
8040aa78:	00a12823          	sw	a0,16(sp)
8040aa7c:	00f12623          	sw	a5,12(sp)
8040aa80:	0a098663          	beqz	s3,8040ab2c <stride_dequeue+0x1708>
8040aa84:	00080593          	mv	a1,a6
8040aa88:	00098513          	mv	a0,s3
8040aa8c:	01012a23          	sw	a6,20(sp)
8040aa90:	e00fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040aa94:	01012303          	lw	t1,16(sp)
8040aa98:	01412803          	lw	a6,20(sp)
8040aa9c:	00651463          	bne	a0,t1,8040aaa4 <stride_dequeue+0x1680>
8040aaa0:	7b90006f          	j	8040ba58 <stride_dequeue+0x2634>
8040aaa4:	00482783          	lw	a5,4(a6)
8040aaa8:	00882e03          	lw	t3,8(a6)
8040aaac:	00612a23          	sw	t1,20(sp)
8040aab0:	00f12823          	sw	a5,16(sp)
8040aab4:	060e0463          	beqz	t3,8040ab1c <stride_dequeue+0x16f8>
8040aab8:	000e0593          	mv	a1,t3
8040aabc:	00098513          	mv	a0,s3
8040aac0:	01012e23          	sw	a6,28(sp)
8040aac4:	01c12c23          	sw	t3,24(sp)
8040aac8:	dc8fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040aacc:	01412303          	lw	t1,20(sp)
8040aad0:	01812e03          	lw	t3,24(sp)
8040aad4:	01c12803          	lw	a6,28(sp)
8040aad8:	00651463          	bne	a0,t1,8040aae0 <stride_dequeue+0x16bc>
8040aadc:	7a80106f          	j	8040c284 <stride_dequeue+0x2e60>
8040aae0:	008e2583          	lw	a1,8(t3)
8040aae4:	00098513          	mv	a0,s3
8040aae8:	004e2b03          	lw	s6,4(t3)
8040aaec:	01012c23          	sw	a6,24(sp)
8040aaf0:	01c12a23          	sw	t3,20(sp)
8040aaf4:	e58fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040aaf8:	01412e03          	lw	t3,20(sp)
8040aafc:	01812803          	lw	a6,24(sp)
8040ab00:	00ae2223          	sw	a0,4(t3)
8040ab04:	016e2423          	sw	s6,8(t3)
8040ab08:	00051463          	bnez	a0,8040ab10 <stride_dequeue+0x16ec>
8040ab0c:	1950106f          	j	8040c4a0 <stride_dequeue+0x307c>
8040ab10:	008c2b03          	lw	s6,8(s8)
8040ab14:	01c52023          	sw	t3,0(a0)
8040ab18:	000e0993          	mv	s3,t3
8040ab1c:	01012783          	lw	a5,16(sp)
8040ab20:	01382223          	sw	s3,4(a6)
8040ab24:	00f82423          	sw	a5,8(a6)
8040ab28:	0109a023          	sw	a6,0(s3)
8040ab2c:	00c12783          	lw	a5,12(sp)
8040ab30:	010ca223          	sw	a6,4(s9)
8040ab34:	000b0993          	mv	s3,s6
8040ab38:	00fca423          	sw	a5,8(s9)
8040ab3c:	01982023          	sw	s9,0(a6)
8040ab40:	d6cff06f          	j	8040a0ac <stride_dequeue+0xc88>
8040ab44:	004da783          	lw	a5,4(s11)
8040ab48:	008da983          	lw	s3,8(s11)
8040ab4c:	00a12823          	sw	a0,16(sp)
8040ab50:	00f12623          	sw	a5,12(sp)
8040ab54:	0a098663          	beqz	s3,8040ac00 <stride_dequeue+0x17dc>
8040ab58:	00080593          	mv	a1,a6
8040ab5c:	00098513          	mv	a0,s3
8040ab60:	01012a23          	sw	a6,20(sp)
8040ab64:	d2cfe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040ab68:	01012303          	lw	t1,16(sp)
8040ab6c:	01412803          	lw	a6,20(sp)
8040ab70:	00651463          	bne	a0,t1,8040ab78 <stride_dequeue+0x1754>
8040ab74:	76d0006f          	j	8040bae0 <stride_dequeue+0x26bc>
8040ab78:	00482783          	lw	a5,4(a6)
8040ab7c:	00882e03          	lw	t3,8(a6)
8040ab80:	00612a23          	sw	t1,20(sp)
8040ab84:	00f12823          	sw	a5,16(sp)
8040ab88:	060e0463          	beqz	t3,8040abf0 <stride_dequeue+0x17cc>
8040ab8c:	000e0593          	mv	a1,t3
8040ab90:	00098513          	mv	a0,s3
8040ab94:	01012e23          	sw	a6,28(sp)
8040ab98:	01c12c23          	sw	t3,24(sp)
8040ab9c:	cf4fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040aba0:	01412303          	lw	t1,20(sp)
8040aba4:	01812e03          	lw	t3,24(sp)
8040aba8:	01c12803          	lw	a6,28(sp)
8040abac:	00651463          	bne	a0,t1,8040abb4 <stride_dequeue+0x1790>
8040abb0:	4f40106f          	j	8040c0a4 <stride_dequeue+0x2c80>
8040abb4:	008e2583          	lw	a1,8(t3)
8040abb8:	00098513          	mv	a0,s3
8040abbc:	004e2b03          	lw	s6,4(t3)
8040abc0:	01012c23          	sw	a6,24(sp)
8040abc4:	01c12a23          	sw	t3,20(sp)
8040abc8:	d84fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040abcc:	01412e03          	lw	t3,20(sp)
8040abd0:	01812803          	lw	a6,24(sp)
8040abd4:	00ae2223          	sw	a0,4(t3)
8040abd8:	016e2423          	sw	s6,8(t3)
8040abdc:	00051463          	bnez	a0,8040abe4 <stride_dequeue+0x17c0>
8040abe0:	0a90106f          	j	8040c488 <stride_dequeue+0x3064>
8040abe4:	008c2b03          	lw	s6,8(s8)
8040abe8:	01c52023          	sw	t3,0(a0)
8040abec:	000e0993          	mv	s3,t3
8040abf0:	01012783          	lw	a5,16(sp)
8040abf4:	01382223          	sw	s3,4(a6)
8040abf8:	00f82423          	sw	a5,8(a6)
8040abfc:	0109a023          	sw	a6,0(s3)
8040ac00:	00c12783          	lw	a5,12(sp)
8040ac04:	010da223          	sw	a6,4(s11)
8040ac08:	000b0993          	mv	s3,s6
8040ac0c:	00fda423          	sw	a5,8(s11)
8040ac10:	01b82023          	sw	s11,0(a6)
8040ac14:	c09fe06f          	j	8040981c <stride_dequeue+0x3f8>
8040ac18:	004da783          	lw	a5,4(s11)
8040ac1c:	008da983          	lw	s3,8(s11)
8040ac20:	00a12623          	sw	a0,12(sp)
8040ac24:	00f12423          	sw	a5,8(sp)
8040ac28:	0c098263          	beqz	s3,8040acec <stride_dequeue+0x18c8>
8040ac2c:	00080593          	mv	a1,a6
8040ac30:	00098513          	mv	a0,s3
8040ac34:	00c12a23          	sw	a2,20(sp)
8040ac38:	01012823          	sw	a6,16(sp)
8040ac3c:	c54fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040ac40:	00c12303          	lw	t1,12(sp)
8040ac44:	01012803          	lw	a6,16(sp)
8040ac48:	01412603          	lw	a2,20(sp)
8040ac4c:	00651463          	bne	a0,t1,8040ac54 <stride_dequeue+0x1830>
8040ac50:	0980106f          	j	8040bce8 <stride_dequeue+0x28c4>
8040ac54:	00482783          	lw	a5,4(a6)
8040ac58:	00882e03          	lw	t3,8(a6)
8040ac5c:	00612823          	sw	t1,16(sp)
8040ac60:	00f12623          	sw	a5,12(sp)
8040ac64:	060e0c63          	beqz	t3,8040acdc <stride_dequeue+0x18b8>
8040ac68:	000e0593          	mv	a1,t3
8040ac6c:	00098513          	mv	a0,s3
8040ac70:	01012e23          	sw	a6,28(sp)
8040ac74:	00c12c23          	sw	a2,24(sp)
8040ac78:	01c12a23          	sw	t3,20(sp)
8040ac7c:	c14fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040ac80:	01012303          	lw	t1,16(sp)
8040ac84:	01412e03          	lw	t3,20(sp)
8040ac88:	01812603          	lw	a2,24(sp)
8040ac8c:	01c12803          	lw	a6,28(sp)
8040ac90:	00651463          	bne	a0,t1,8040ac98 <stride_dequeue+0x1874>
8040ac94:	3b00106f          	j	8040c044 <stride_dequeue+0x2c20>
8040ac98:	008e2583          	lw	a1,8(t3)
8040ac9c:	00098513          	mv	a0,s3
8040aca0:	004e2b03          	lw	s6,4(t3)
8040aca4:	01012c23          	sw	a6,24(sp)
8040aca8:	00c12a23          	sw	a2,20(sp)
8040acac:	01c12823          	sw	t3,16(sp)
8040acb0:	c9cfe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040acb4:	01012e03          	lw	t3,16(sp)
8040acb8:	01412603          	lw	a2,20(sp)
8040acbc:	01812803          	lw	a6,24(sp)
8040acc0:	00ae2223          	sw	a0,4(t3)
8040acc4:	016e2423          	sw	s6,8(t3)
8040acc8:	00051463          	bnez	a0,8040acd0 <stride_dequeue+0x18ac>
8040accc:	0610106f          	j	8040c52c <stride_dequeue+0x3108>
8040acd0:	008c2b03          	lw	s6,8(s8)
8040acd4:	01c52023          	sw	t3,0(a0)
8040acd8:	000e0993          	mv	s3,t3
8040acdc:	00c12783          	lw	a5,12(sp)
8040ace0:	01382223          	sw	s3,4(a6)
8040ace4:	00f82423          	sw	a5,8(a6)
8040ace8:	0109a023          	sw	a6,0(s3)
8040acec:	00812783          	lw	a5,8(sp)
8040acf0:	010da223          	sw	a6,4(s11)
8040acf4:	000b0993          	mv	s3,s6
8040acf8:	00fda423          	sw	a5,8(s11)
8040acfc:	01b82023          	sw	s11,0(a6)
8040ad00:	cf9fe06f          	j	804099f8 <stride_dequeue+0x5d4>
8040ad04:	00492703          	lw	a4,4(s2)
8040ad08:	00892983          	lw	s3,8(s2)
8040ad0c:	00a12a23          	sw	a0,20(sp)
8040ad10:	00e12823          	sw	a4,16(sp)
8040ad14:	06098063          	beqz	s3,8040ad74 <stride_dequeue+0x1950>
8040ad18:	00078593          	mv	a1,a5
8040ad1c:	00098513          	mv	a0,s3
8040ad20:	01012e23          	sw	a6,28(sp)
8040ad24:	00f12c23          	sw	a5,24(sp)
8040ad28:	b68fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040ad2c:	01412e03          	lw	t3,20(sp)
8040ad30:	01812783          	lw	a5,24(sp)
8040ad34:	01c12803          	lw	a6,28(sp)
8040ad38:	01c51463          	bne	a0,t3,8040ad40 <stride_dequeue+0x191c>
8040ad3c:	0840106f          	j	8040bdc0 <stride_dequeue+0x299c>
8040ad40:	0087a583          	lw	a1,8(a5)
8040ad44:	00098513          	mv	a0,s3
8040ad48:	0047ab03          	lw	s6,4(a5)
8040ad4c:	01012c23          	sw	a6,24(sp)
8040ad50:	00f12a23          	sw	a5,20(sp)
8040ad54:	bf8fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040ad58:	01412783          	lw	a5,20(sp)
8040ad5c:	01812803          	lw	a6,24(sp)
8040ad60:	00a7a223          	sw	a0,4(a5)
8040ad64:	0167a423          	sw	s6,8(a5)
8040ad68:	00050463          	beqz	a0,8040ad70 <stride_dequeue+0x194c>
8040ad6c:	00f52023          	sw	a5,0(a0)
8040ad70:	008c2b03          	lw	s6,8(s8)
8040ad74:	01012703          	lw	a4,16(sp)
8040ad78:	00f92223          	sw	a5,4(s2)
8040ad7c:	000b0993          	mv	s3,s6
8040ad80:	00e92423          	sw	a4,8(s2)
8040ad84:	0127a023          	sw	s2,0(a5)
8040ad88:	875fe06f          	j	804095fc <stride_dequeue+0x1d8>
8040ad8c:	004a2783          	lw	a5,4(s4)
8040ad90:	008a2983          	lw	s3,8(s4)
8040ad94:	00a12623          	sw	a0,12(sp)
8040ad98:	00f12423          	sw	a5,8(sp)
8040ad9c:	00099463          	bnez	s3,8040ada4 <stride_dequeue+0x1980>
8040ada0:	4180106f          	j	8040c1b8 <stride_dequeue+0x2d94>
8040ada4:	00040593          	mv	a1,s0
8040ada8:	00098513          	mv	a0,s3
8040adac:	ae4fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040adb0:	00c12803          	lw	a6,12(sp)
8040adb4:	01051463          	bne	a0,a6,8040adbc <stride_dequeue+0x1998>
8040adb8:	16c0106f          	j	8040bf24 <stride_dequeue+0x2b00>
8040adbc:	00442783          	lw	a5,4(s0)
8040adc0:	00842883          	lw	a7,8(s0)
8040adc4:	01012a23          	sw	a6,20(sp)
8040adc8:	00f12623          	sw	a5,12(sp)
8040adcc:	04088c63          	beqz	a7,8040ae24 <stride_dequeue+0x1a00>
8040add0:	00088593          	mv	a1,a7
8040add4:	00098513          	mv	a0,s3
8040add8:	01112823          	sw	a7,16(sp)
8040addc:	ab4fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040ade0:	01412803          	lw	a6,20(sp)
8040ade4:	01012883          	lw	a7,16(sp)
8040ade8:	01051463          	bne	a0,a6,8040adf0 <stride_dequeue+0x19cc>
8040adec:	6c00106f          	j	8040c4ac <stride_dequeue+0x3088>
8040adf0:	0088a583          	lw	a1,8(a7)
8040adf4:	00098513          	mv	a0,s3
8040adf8:	0048ab03          	lw	s6,4(a7)
8040adfc:	01112823          	sw	a7,16(sp)
8040ae00:	b4cfe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040ae04:	01012883          	lw	a7,16(sp)
8040ae08:	00a8a223          	sw	a0,4(a7)
8040ae0c:	0168a423          	sw	s6,8(a7)
8040ae10:	00051463          	bnez	a0,8040ae18 <stride_dequeue+0x19f4>
8040ae14:	7900106f          	j	8040c5a4 <stride_dequeue+0x3180>
8040ae18:	008c2b03          	lw	s6,8(s8)
8040ae1c:	01152023          	sw	a7,0(a0)
8040ae20:	00088993          	mv	s3,a7
8040ae24:	00c12783          	lw	a5,12(sp)
8040ae28:	01342223          	sw	s3,4(s0)
8040ae2c:	00f42423          	sw	a5,8(s0)
8040ae30:	0089a023          	sw	s0,0(s3)
8040ae34:	00040993          	mv	s3,s0
8040ae38:	00812783          	lw	a5,8(sp)
8040ae3c:	013a2223          	sw	s3,4(s4)
8040ae40:	000a0413          	mv	s0,s4
8040ae44:	00fa2423          	sw	a5,8(s4)
8040ae48:	0149a023          	sw	s4,0(s3)
8040ae4c:	000b0993          	mv	s3,s6
8040ae50:	bacff06f          	j	8040a1fc <stride_dequeue+0xdd8>
8040ae54:	0048a783          	lw	a5,4(a7)
8040ae58:	0088a983          	lw	s3,8(a7)
8040ae5c:	00a12823          	sw	a0,16(sp)
8040ae60:	00f12623          	sw	a5,12(sp)
8040ae64:	00099463          	bnez	s3,8040ae6c <stride_dequeue+0x1a48>
8040ae68:	5a40106f          	j	8040c40c <stride_dequeue+0x2fe8>
8040ae6c:	000d8593          	mv	a1,s11
8040ae70:	00098513          	mv	a0,s3
8040ae74:	01112a23          	sw	a7,20(sp)
8040ae78:	a18fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040ae7c:	01012303          	lw	t1,16(sp)
8040ae80:	01412883          	lw	a7,20(sp)
8040ae84:	00651463          	bne	a0,t1,8040ae8c <stride_dequeue+0x1a68>
8040ae88:	54c0106f          	j	8040c3d4 <stride_dequeue+0x2fb0>
8040ae8c:	004da783          	lw	a5,4(s11)
8040ae90:	008dae03          	lw	t3,8(s11)
8040ae94:	00612e23          	sw	t1,28(sp)
8040ae98:	00f12823          	sw	a5,16(sp)
8040ae9c:	060e0463          	beqz	t3,8040af04 <stride_dequeue+0x1ae0>
8040aea0:	000e0593          	mv	a1,t3
8040aea4:	00098513          	mv	a0,s3
8040aea8:	01112c23          	sw	a7,24(sp)
8040aeac:	01c12a23          	sw	t3,20(sp)
8040aeb0:	9e0fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040aeb4:	01c12303          	lw	t1,28(sp)
8040aeb8:	01412e03          	lw	t3,20(sp)
8040aebc:	01812883          	lw	a7,24(sp)
8040aec0:	00651463          	bne	a0,t1,8040aec8 <stride_dequeue+0x1aa4>
8040aec4:	2890106f          	j	8040c94c <stride_dequeue+0x3528>
8040aec8:	008e2583          	lw	a1,8(t3)
8040aecc:	00098513          	mv	a0,s3
8040aed0:	004e2b03          	lw	s6,4(t3)
8040aed4:	01112c23          	sw	a7,24(sp)
8040aed8:	01c12a23          	sw	t3,20(sp)
8040aedc:	a70fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040aee0:	01412e03          	lw	t3,20(sp)
8040aee4:	01812883          	lw	a7,24(sp)
8040aee8:	00ae2223          	sw	a0,4(t3)
8040aeec:	016e2423          	sw	s6,8(t3)
8040aef0:	00051463          	bnez	a0,8040aef8 <stride_dequeue+0x1ad4>
8040aef4:	3590106f          	j	8040ca4c <stride_dequeue+0x3628>
8040aef8:	008c2b03          	lw	s6,8(s8)
8040aefc:	01c52023          	sw	t3,0(a0)
8040af00:	000e0993          	mv	s3,t3
8040af04:	01012783          	lw	a5,16(sp)
8040af08:	013da223          	sw	s3,4(s11)
8040af0c:	00fda423          	sw	a5,8(s11)
8040af10:	01b9a023          	sw	s11,0(s3)
8040af14:	000d8993          	mv	s3,s11
8040af18:	00c12783          	lw	a5,12(sp)
8040af1c:	0138a223          	sw	s3,4(a7)
8040af20:	00088d93          	mv	s11,a7
8040af24:	00f8a423          	sw	a5,8(a7)
8040af28:	0119a023          	sw	a7,0(s3)
8040af2c:	000b0993          	mv	s3,s6
8040af30:	be0ff06f          	j	8040a310 <stride_dequeue+0xeec>
8040af34:	0048a783          	lw	a5,4(a7)
8040af38:	0088a983          	lw	s3,8(a7)
8040af3c:	00a12823          	sw	a0,16(sp)
8040af40:	00f12623          	sw	a5,12(sp)
8040af44:	00099463          	bnez	s3,8040af4c <stride_dequeue+0x1b28>
8040af48:	4e40106f          	j	8040c42c <stride_dequeue+0x3008>
8040af4c:	000a0593          	mv	a1,s4
8040af50:	00098513          	mv	a0,s3
8040af54:	01112a23          	sw	a7,20(sp)
8040af58:	938fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040af5c:	01012303          	lw	t1,16(sp)
8040af60:	01412883          	lw	a7,20(sp)
8040af64:	00651463          	bne	a0,t1,8040af6c <stride_dequeue+0x1b48>
8040af68:	0ac0106f          	j	8040c014 <stride_dequeue+0x2bf0>
8040af6c:	004a2783          	lw	a5,4(s4)
8040af70:	008a2e03          	lw	t3,8(s4)
8040af74:	00612e23          	sw	t1,28(sp)
8040af78:	00f12823          	sw	a5,16(sp)
8040af7c:	060e0463          	beqz	t3,8040afe4 <stride_dequeue+0x1bc0>
8040af80:	000e0593          	mv	a1,t3
8040af84:	00098513          	mv	a0,s3
8040af88:	01112c23          	sw	a7,24(sp)
8040af8c:	01c12a23          	sw	t3,20(sp)
8040af90:	900fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040af94:	01c12303          	lw	t1,28(sp)
8040af98:	01412e03          	lw	t3,20(sp)
8040af9c:	01812883          	lw	a7,24(sp)
8040afa0:	00651463          	bne	a0,t1,8040afa8 <stride_dequeue+0x1b84>
8040afa4:	07d0106f          	j	8040c820 <stride_dequeue+0x33fc>
8040afa8:	008e2583          	lw	a1,8(t3)
8040afac:	00098513          	mv	a0,s3
8040afb0:	004e2b03          	lw	s6,4(t3)
8040afb4:	01112c23          	sw	a7,24(sp)
8040afb8:	01c12a23          	sw	t3,20(sp)
8040afbc:	990fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040afc0:	01412e03          	lw	t3,20(sp)
8040afc4:	01812883          	lw	a7,24(sp)
8040afc8:	00ae2223          	sw	a0,4(t3)
8040afcc:	016e2423          	sw	s6,8(t3)
8040afd0:	00051463          	bnez	a0,8040afd8 <stride_dequeue+0x1bb4>
8040afd4:	2190106f          	j	8040c9ec <stride_dequeue+0x35c8>
8040afd8:	008c2b03          	lw	s6,8(s8)
8040afdc:	01c52023          	sw	t3,0(a0)
8040afe0:	000e0993          	mv	s3,t3
8040afe4:	01012783          	lw	a5,16(sp)
8040afe8:	013a2223          	sw	s3,4(s4)
8040afec:	00fa2423          	sw	a5,8(s4)
8040aff0:	0149a023          	sw	s4,0(s3)
8040aff4:	000a0993          	mv	s3,s4
8040aff8:	00c12783          	lw	a5,12(sp)
8040affc:	0138a223          	sw	s3,4(a7)
8040b000:	00088a13          	mv	s4,a7
8040b004:	00f8a423          	sw	a5,8(a7)
8040b008:	0119a023          	sw	a7,0(s3)
8040b00c:	000b0993          	mv	s3,s6
8040b010:	d44ff06f          	j	8040a554 <stride_dequeue+0x1130>
8040b014:	004ca783          	lw	a5,4(s9)
8040b018:	008ca983          	lw	s3,8(s9)
8040b01c:	00a12823          	sw	a0,16(sp)
8040b020:	00f12623          	sw	a5,12(sp)
8040b024:	00099463          	bnez	s3,8040b02c <stride_dequeue+0x1c08>
8040b028:	3dc0106f          	j	8040c404 <stride_dequeue+0x2fe0>
8040b02c:	00080593          	mv	a1,a6
8040b030:	00098513          	mv	a0,s3
8040b034:	01012a23          	sw	a6,20(sp)
8040b038:	858fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b03c:	01012303          	lw	t1,16(sp)
8040b040:	01412803          	lw	a6,20(sp)
8040b044:	00651463          	bne	a0,t1,8040b04c <stride_dequeue+0x1c28>
8040b048:	1a80106f          	j	8040c1f0 <stride_dequeue+0x2dcc>
8040b04c:	00482783          	lw	a5,4(a6)
8040b050:	00882e03          	lw	t3,8(a6)
8040b054:	00612e23          	sw	t1,28(sp)
8040b058:	00f12823          	sw	a5,16(sp)
8040b05c:	060e0463          	beqz	t3,8040b0c4 <stride_dequeue+0x1ca0>
8040b060:	000e0593          	mv	a1,t3
8040b064:	00098513          	mv	a0,s3
8040b068:	01012c23          	sw	a6,24(sp)
8040b06c:	01c12a23          	sw	t3,20(sp)
8040b070:	820fe0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b074:	01c12303          	lw	t1,28(sp)
8040b078:	01412e03          	lw	t3,20(sp)
8040b07c:	01812803          	lw	a6,24(sp)
8040b080:	00651463          	bne	a0,t1,8040b088 <stride_dequeue+0x1c64>
8040b084:	7cc0106f          	j	8040c850 <stride_dequeue+0x342c>
8040b088:	008e2583          	lw	a1,8(t3)
8040b08c:	00098513          	mv	a0,s3
8040b090:	004e2b03          	lw	s6,4(t3)
8040b094:	01012c23          	sw	a6,24(sp)
8040b098:	01c12a23          	sw	t3,20(sp)
8040b09c:	8b0fe0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b0a0:	01412e03          	lw	t3,20(sp)
8040b0a4:	01812803          	lw	a6,24(sp)
8040b0a8:	00ae2223          	sw	a0,4(t3)
8040b0ac:	016e2423          	sw	s6,8(t3)
8040b0b0:	00051463          	bnez	a0,8040b0b8 <stride_dequeue+0x1c94>
8040b0b4:	1450106f          	j	8040c9f8 <stride_dequeue+0x35d4>
8040b0b8:	008c2b03          	lw	s6,8(s8)
8040b0bc:	01c52023          	sw	t3,0(a0)
8040b0c0:	000e0993          	mv	s3,t3
8040b0c4:	01012783          	lw	a5,16(sp)
8040b0c8:	01382223          	sw	s3,4(a6)
8040b0cc:	00f82423          	sw	a5,8(a6)
8040b0d0:	0109a023          	sw	a6,0(s3)
8040b0d4:	00080993          	mv	s3,a6
8040b0d8:	00c12783          	lw	a5,12(sp)
8040b0dc:	013ca223          	sw	s3,4(s9)
8040b0e0:	00fca423          	sw	a5,8(s9)
8040b0e4:	0199a023          	sw	s9,0(s3)
8040b0e8:	000b0993          	mv	s3,s6
8040b0ec:	a99fe06f          	j	80409b84 <stride_dequeue+0x760>
8040b0f0:	004a2783          	lw	a5,4(s4)
8040b0f4:	008a2983          	lw	s3,8(s4)
8040b0f8:	00a12823          	sw	a0,16(sp)
8040b0fc:	00f12623          	sw	a5,12(sp)
8040b100:	00099463          	bnez	s3,8040b108 <stride_dequeue+0x1ce4>
8040b104:	3100106f          	j	8040c414 <stride_dequeue+0x2ff0>
8040b108:	00080593          	mv	a1,a6
8040b10c:	00098513          	mv	a0,s3
8040b110:	01012a23          	sw	a6,20(sp)
8040b114:	f7dfd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b118:	01012303          	lw	t1,16(sp)
8040b11c:	01412803          	lw	a6,20(sp)
8040b120:	00651463          	bne	a0,t1,8040b128 <stride_dequeue+0x1d04>
8040b124:	7590006f          	j	8040c07c <stride_dequeue+0x2c58>
8040b128:	00482783          	lw	a5,4(a6)
8040b12c:	00882e03          	lw	t3,8(a6)
8040b130:	00612e23          	sw	t1,28(sp)
8040b134:	00f12823          	sw	a5,16(sp)
8040b138:	060e0463          	beqz	t3,8040b1a0 <stride_dequeue+0x1d7c>
8040b13c:	000e0593          	mv	a1,t3
8040b140:	00098513          	mv	a0,s3
8040b144:	01012c23          	sw	a6,24(sp)
8040b148:	01c12a23          	sw	t3,20(sp)
8040b14c:	f45fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b150:	01c12303          	lw	t1,28(sp)
8040b154:	01412e03          	lw	t3,20(sp)
8040b158:	01812803          	lw	a6,24(sp)
8040b15c:	00651463          	bne	a0,t1,8040b164 <stride_dequeue+0x1d40>
8040b160:	4500106f          	j	8040c5b0 <stride_dequeue+0x318c>
8040b164:	008e2583          	lw	a1,8(t3)
8040b168:	00098513          	mv	a0,s3
8040b16c:	004e2b03          	lw	s6,4(t3)
8040b170:	01012c23          	sw	a6,24(sp)
8040b174:	01c12a23          	sw	t3,20(sp)
8040b178:	fd5fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b17c:	01412e03          	lw	t3,20(sp)
8040b180:	01812803          	lw	a6,24(sp)
8040b184:	00ae2223          	sw	a0,4(t3)
8040b188:	016e2423          	sw	s6,8(t3)
8040b18c:	00051463          	bnez	a0,8040b194 <stride_dequeue+0x1d70>
8040b190:	0f90106f          	j	8040ca88 <stride_dequeue+0x3664>
8040b194:	008c2b03          	lw	s6,8(s8)
8040b198:	01c52023          	sw	t3,0(a0)
8040b19c:	000e0993          	mv	s3,t3
8040b1a0:	01012783          	lw	a5,16(sp)
8040b1a4:	01382223          	sw	s3,4(a6)
8040b1a8:	00f82423          	sw	a5,8(a6)
8040b1ac:	0109a023          	sw	a6,0(s3)
8040b1b0:	00080993          	mv	s3,a6
8040b1b4:	00c12783          	lw	a5,12(sp)
8040b1b8:	013a2223          	sw	s3,4(s4)
8040b1bc:	00fa2423          	sw	a5,8(s4)
8040b1c0:	0149a023          	sw	s4,0(s3)
8040b1c4:	000b0993          	mv	s3,s6
8040b1c8:	b1dfe06f          	j	80409ce4 <stride_dequeue+0x8c0>
8040b1cc:	0048a783          	lw	a5,4(a7)
8040b1d0:	0088a983          	lw	s3,8(a7)
8040b1d4:	00a12623          	sw	a0,12(sp)
8040b1d8:	00f12423          	sw	a5,8(sp)
8040b1dc:	00099463          	bnez	s3,8040b1e4 <stride_dequeue+0x1dc0>
8040b1e0:	2440106f          	j	8040c424 <stride_dequeue+0x3000>
8040b1e4:	00060593          	mv	a1,a2
8040b1e8:	00098513          	mv	a0,s3
8040b1ec:	01112a23          	sw	a7,20(sp)
8040b1f0:	ea1fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b1f4:	00c12303          	lw	t1,12(sp)
8040b1f8:	01012603          	lw	a2,16(sp)
8040b1fc:	01412883          	lw	a7,20(sp)
8040b200:	5e6502e3          	beq	a0,t1,8040bfe4 <stride_dequeue+0x2bc0>
8040b204:	00462783          	lw	a5,4(a2)
8040b208:	00862e03          	lw	t3,8(a2)
8040b20c:	00612e23          	sw	t1,28(sp)
8040b210:	00f12623          	sw	a5,12(sp)
8040b214:	060e0c63          	beqz	t3,8040b28c <stride_dequeue+0x1e68>
8040b218:	000e0593          	mv	a1,t3
8040b21c:	00098513          	mv	a0,s3
8040b220:	01112c23          	sw	a7,24(sp)
8040b224:	00c12a23          	sw	a2,20(sp)
8040b228:	01c12823          	sw	t3,16(sp)
8040b22c:	e65fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b230:	01c12303          	lw	t1,28(sp)
8040b234:	01012e03          	lw	t3,16(sp)
8040b238:	01412603          	lw	a2,20(sp)
8040b23c:	01812883          	lw	a7,24(sp)
8040b240:	00651463          	bne	a0,t1,8040b248 <stride_dequeue+0x1e24>
8040b244:	3d00106f          	j	8040c614 <stride_dequeue+0x31f0>
8040b248:	008e2583          	lw	a1,8(t3)
8040b24c:	00098513          	mv	a0,s3
8040b250:	004e2b03          	lw	s6,4(t3)
8040b254:	01112c23          	sw	a7,24(sp)
8040b258:	00c12a23          	sw	a2,20(sp)
8040b25c:	01c12823          	sw	t3,16(sp)
8040b260:	eedfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b264:	01012e03          	lw	t3,16(sp)
8040b268:	01412603          	lw	a2,20(sp)
8040b26c:	01812883          	lw	a7,24(sp)
8040b270:	00ae2223          	sw	a0,4(t3)
8040b274:	016e2423          	sw	s6,8(t3)
8040b278:	00051463          	bnez	a0,8040b280 <stride_dequeue+0x1e5c>
8040b27c:	0190106f          	j	8040ca94 <stride_dequeue+0x3670>
8040b280:	008c2b03          	lw	s6,8(s8)
8040b284:	01c52023          	sw	t3,0(a0)
8040b288:	000e0993          	mv	s3,t3
8040b28c:	00c12783          	lw	a5,12(sp)
8040b290:	01362223          	sw	s3,4(a2)
8040b294:	00f62423          	sw	a5,8(a2)
8040b298:	00c9a023          	sw	a2,0(s3)
8040b29c:	00060993          	mv	s3,a2
8040b2a0:	00812783          	lw	a5,8(sp)
8040b2a4:	0138a223          	sw	s3,4(a7)
8040b2a8:	00088613          	mv	a2,a7
8040b2ac:	00f8a423          	sw	a5,8(a7)
8040b2b0:	0119a023          	sw	a7,0(s3)
8040b2b4:	000b0993          	mv	s3,s6
8040b2b8:	98cff06f          	j	8040a444 <stride_dequeue+0x1020>
8040b2bc:	00462783          	lw	a5,4(a2)
8040b2c0:	00862983          	lw	s3,8(a2)
8040b2c4:	00a12623          	sw	a0,12(sp)
8040b2c8:	00f12423          	sw	a5,8(sp)
8040b2cc:	00099463          	bnez	s3,8040b2d4 <stride_dequeue+0x1eb0>
8040b2d0:	14c0106f          	j	8040c41c <stride_dequeue+0x2ff8>
8040b2d4:	00080593          	mv	a1,a6
8040b2d8:	00098513          	mv	a0,s3
8040b2dc:	00c12a23          	sw	a2,20(sp)
8040b2e0:	01012823          	sw	a6,16(sp)
8040b2e4:	dadfd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b2e8:	00c12303          	lw	t1,12(sp)
8040b2ec:	01012803          	lw	a6,16(sp)
8040b2f0:	01412603          	lw	a2,20(sp)
8040b2f4:	5e6500e3          	beq	a0,t1,8040c0d4 <stride_dequeue+0x2cb0>
8040b2f8:	00482783          	lw	a5,4(a6)
8040b2fc:	00882e03          	lw	t3,8(a6)
8040b300:	00612e23          	sw	t1,28(sp)
8040b304:	00f12623          	sw	a5,12(sp)
8040b308:	060e0c63          	beqz	t3,8040b380 <stride_dequeue+0x1f5c>
8040b30c:	000e0593          	mv	a1,t3
8040b310:	00098513          	mv	a0,s3
8040b314:	01012c23          	sw	a6,24(sp)
8040b318:	00c12a23          	sw	a2,20(sp)
8040b31c:	01c12823          	sw	t3,16(sp)
8040b320:	d71fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b324:	01c12303          	lw	t1,28(sp)
8040b328:	01012e03          	lw	t3,16(sp)
8040b32c:	01412603          	lw	a2,20(sp)
8040b330:	01812803          	lw	a6,24(sp)
8040b334:	00651463          	bne	a0,t1,8040b33c <stride_dequeue+0x1f18>
8040b338:	3b80106f          	j	8040c6f0 <stride_dequeue+0x32cc>
8040b33c:	008e2583          	lw	a1,8(t3)
8040b340:	00098513          	mv	a0,s3
8040b344:	004e2b03          	lw	s6,4(t3)
8040b348:	01012c23          	sw	a6,24(sp)
8040b34c:	00c12a23          	sw	a2,20(sp)
8040b350:	01c12823          	sw	t3,16(sp)
8040b354:	df9fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b358:	01012e03          	lw	t3,16(sp)
8040b35c:	01412603          	lw	a2,20(sp)
8040b360:	01812803          	lw	a6,24(sp)
8040b364:	00ae2223          	sw	a0,4(t3)
8040b368:	016e2423          	sw	s6,8(t3)
8040b36c:	00051463          	bnez	a0,8040b374 <stride_dequeue+0x1f50>
8040b370:	6ac0106f          	j	8040ca1c <stride_dequeue+0x35f8>
8040b374:	008c2b03          	lw	s6,8(s8)
8040b378:	01c52023          	sw	t3,0(a0)
8040b37c:	000e0993          	mv	s3,t3
8040b380:	00c12783          	lw	a5,12(sp)
8040b384:	01382223          	sw	s3,4(a6)
8040b388:	00f82423          	sw	a5,8(a6)
8040b38c:	0109a023          	sw	a6,0(s3)
8040b390:	00080993          	mv	s3,a6
8040b394:	00812783          	lw	a5,8(sp)
8040b398:	01362223          	sw	s3,4(a2)
8040b39c:	00f62423          	sw	a5,8(a2)
8040b3a0:	00c9a023          	sw	a2,0(s3)
8040b3a4:	000b0993          	mv	s3,s6
8040b3a8:	aa5fe06f          	j	80409e4c <stride_dequeue+0xa28>
8040b3ac:	0048a783          	lw	a5,4(a7)
8040b3b0:	0088a983          	lw	s3,8(a7)
8040b3b4:	00a12a23          	sw	a0,20(sp)
8040b3b8:	00f12823          	sw	a5,16(sp)
8040b3bc:	04098c63          	beqz	s3,8040b414 <stride_dequeue+0x1ff0>
8040b3c0:	00080593          	mv	a1,a6
8040b3c4:	00098513          	mv	a0,s3
8040b3c8:	01112e23          	sw	a7,28(sp)
8040b3cc:	cc5fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b3d0:	01412e03          	lw	t3,20(sp)
8040b3d4:	01812803          	lw	a6,24(sp)
8040b3d8:	01c12883          	lw	a7,28(sp)
8040b3dc:	3dc50ae3          	beq	a0,t3,8040bfb0 <stride_dequeue+0x2b8c>
8040b3e0:	00882583          	lw	a1,8(a6)
8040b3e4:	00098513          	mv	a0,s3
8040b3e8:	00482b03          	lw	s6,4(a6)
8040b3ec:	01112c23          	sw	a7,24(sp)
8040b3f0:	01012a23          	sw	a6,20(sp)
8040b3f4:	d59fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b3f8:	01412803          	lw	a6,20(sp)
8040b3fc:	01812883          	lw	a7,24(sp)
8040b400:	00a82223          	sw	a0,4(a6)
8040b404:	01682423          	sw	s6,8(a6)
8040b408:	00050463          	beqz	a0,8040b410 <stride_dequeue+0x1fec>
8040b40c:	01052023          	sw	a6,0(a0)
8040b410:	008c2b03          	lw	s6,8(s8)
8040b414:	01012783          	lw	a5,16(sp)
8040b418:	0108a223          	sw	a6,4(a7)
8040b41c:	000b0993          	mv	s3,s6
8040b420:	00f8a423          	sw	a5,8(a7)
8040b424:	01182023          	sw	a7,0(a6)
8040b428:	00088813          	mv	a6,a7
8040b42c:	9f4ff06f          	j	8040a620 <stride_dequeue+0x11fc>
8040b430:	004da783          	lw	a5,4(s11)
8040b434:	008da983          	lw	s3,8(s11)
8040b438:	00a12823          	sw	a0,16(sp)
8040b43c:	00f12623          	sw	a5,12(sp)
8040b440:	06098663          	beqz	s3,8040b4ac <stride_dequeue+0x2088>
8040b444:	00030593          	mv	a1,t1
8040b448:	00098513          	mv	a0,s3
8040b44c:	01012e23          	sw	a6,28(sp)
8040b450:	00c12c23          	sw	a2,24(sp)
8040b454:	00612a23          	sw	t1,20(sp)
8040b458:	c39fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b45c:	01012e03          	lw	t3,16(sp)
8040b460:	01412303          	lw	t1,20(sp)
8040b464:	01812603          	lw	a2,24(sp)
8040b468:	01c12803          	lw	a6,28(sp)
8040b46c:	5dc50ee3          	beq	a0,t3,8040c248 <stride_dequeue+0x2e24>
8040b470:	00832583          	lw	a1,8(t1)
8040b474:	00098513          	mv	a0,s3
8040b478:	00432b03          	lw	s6,4(t1)
8040b47c:	01012c23          	sw	a6,24(sp)
8040b480:	00c12a23          	sw	a2,20(sp)
8040b484:	00612823          	sw	t1,16(sp)
8040b488:	cc5fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b48c:	01012303          	lw	t1,16(sp)
8040b490:	01412603          	lw	a2,20(sp)
8040b494:	01812803          	lw	a6,24(sp)
8040b498:	00a32223          	sw	a0,4(t1)
8040b49c:	01632423          	sw	s6,8(t1)
8040b4a0:	00050463          	beqz	a0,8040b4a8 <stride_dequeue+0x2084>
8040b4a4:	00652023          	sw	t1,0(a0)
8040b4a8:	008c2b03          	lw	s6,8(s8)
8040b4ac:	00c12783          	lw	a5,12(sp)
8040b4b0:	006da223          	sw	t1,4(s11)
8040b4b4:	000b0993          	mv	s3,s6
8040b4b8:	00fda423          	sw	a5,8(s11)
8040b4bc:	01b32023          	sw	s11,0(t1)
8040b4c0:	d24fe06f          	j	804099e4 <stride_dequeue+0x5c0>
8040b4c4:	004ca783          	lw	a5,4(s9)
8040b4c8:	008ca983          	lw	s3,8(s9)
8040b4cc:	00a12a23          	sw	a0,20(sp)
8040b4d0:	00f12823          	sw	a5,16(sp)
8040b4d4:	04098e63          	beqz	s3,8040b530 <stride_dequeue+0x210c>
8040b4d8:	00030593          	mv	a1,t1
8040b4dc:	00098513          	mv	a0,s3
8040b4e0:	01012e23          	sw	a6,28(sp)
8040b4e4:	00612c23          	sw	t1,24(sp)
8040b4e8:	ba9fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b4ec:	01412e03          	lw	t3,20(sp)
8040b4f0:	01812303          	lw	t1,24(sp)
8040b4f4:	01c12803          	lw	a6,28(sp)
8040b4f8:	25c50ae3          	beq	a0,t3,8040bf4c <stride_dequeue+0x2b28>
8040b4fc:	00832583          	lw	a1,8(t1)
8040b500:	00098513          	mv	a0,s3
8040b504:	00432b03          	lw	s6,4(t1)
8040b508:	01012c23          	sw	a6,24(sp)
8040b50c:	00612a23          	sw	t1,20(sp)
8040b510:	c3dfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b514:	01412303          	lw	t1,20(sp)
8040b518:	01812803          	lw	a6,24(sp)
8040b51c:	00a32223          	sw	a0,4(t1)
8040b520:	01632423          	sw	s6,8(t1)
8040b524:	00050463          	beqz	a0,8040b52c <stride_dequeue+0x2108>
8040b528:	00652023          	sw	t1,0(a0)
8040b52c:	008c2b03          	lw	s6,8(s8)
8040b530:	01012783          	lw	a5,16(sp)
8040b534:	006ca223          	sw	t1,4(s9)
8040b538:	000b0993          	mv	s3,s6
8040b53c:	00fca423          	sw	a5,8(s9)
8040b540:	01932023          	sw	s9,0(t1)
8040b544:	b55fe06f          	j	8040a098 <stride_dequeue+0xc74>
8040b548:	004da783          	lw	a5,4(s11)
8040b54c:	008da983          	lw	s3,8(s11)
8040b550:	00a12a23          	sw	a0,20(sp)
8040b554:	00f12823          	sw	a5,16(sp)
8040b558:	04098e63          	beqz	s3,8040b5b4 <stride_dequeue+0x2190>
8040b55c:	00030593          	mv	a1,t1
8040b560:	00098513          	mv	a0,s3
8040b564:	01012e23          	sw	a6,28(sp)
8040b568:	00612c23          	sw	t1,24(sp)
8040b56c:	b25fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b570:	01412e03          	lw	t3,20(sp)
8040b574:	01812303          	lw	t1,24(sp)
8040b578:	01c12803          	lw	a6,28(sp)
8040b57c:	53c50ce3          	beq	a0,t3,8040c2b4 <stride_dequeue+0x2e90>
8040b580:	00832583          	lw	a1,8(t1)
8040b584:	00098513          	mv	a0,s3
8040b588:	00432b03          	lw	s6,4(t1)
8040b58c:	01012c23          	sw	a6,24(sp)
8040b590:	00612a23          	sw	t1,20(sp)
8040b594:	bb9fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b598:	01412303          	lw	t1,20(sp)
8040b59c:	01812803          	lw	a6,24(sp)
8040b5a0:	00a32223          	sw	a0,4(t1)
8040b5a4:	01632423          	sw	s6,8(t1)
8040b5a8:	00050463          	beqz	a0,8040b5b0 <stride_dequeue+0x218c>
8040b5ac:	00652023          	sw	t1,0(a0)
8040b5b0:	008c2b03          	lw	s6,8(s8)
8040b5b4:	01012783          	lw	a5,16(sp)
8040b5b8:	006da223          	sw	t1,4(s11)
8040b5bc:	000b0993          	mv	s3,s6
8040b5c0:	00fda423          	sw	a5,8(s11)
8040b5c4:	01b32023          	sw	s11,0(t1)
8040b5c8:	a40fe06f          	j	80409808 <stride_dequeue+0x3e4>
8040b5cc:	0048a783          	lw	a5,4(a7)
8040b5d0:	0088a983          	lw	s3,8(a7)
8040b5d4:	00a12a23          	sw	a0,20(sp)
8040b5d8:	00f12823          	sw	a5,16(sp)
8040b5dc:	04098c63          	beqz	s3,8040b634 <stride_dequeue+0x2210>
8040b5e0:	00030593          	mv	a1,t1
8040b5e4:	00098513          	mv	a0,s3
8040b5e8:	01112e23          	sw	a7,28(sp)
8040b5ec:	aa5fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b5f0:	01412e03          	lw	t3,20(sp)
8040b5f4:	01812303          	lw	t1,24(sp)
8040b5f8:	01c12883          	lw	a7,28(sp)
8040b5fc:	5bc502e3          	beq	a0,t3,8040c3a0 <stride_dequeue+0x2f7c>
8040b600:	00832583          	lw	a1,8(t1)
8040b604:	00098513          	mv	a0,s3
8040b608:	00432b03          	lw	s6,4(t1)
8040b60c:	01112c23          	sw	a7,24(sp)
8040b610:	00612a23          	sw	t1,20(sp)
8040b614:	b39fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b618:	01412303          	lw	t1,20(sp)
8040b61c:	01812883          	lw	a7,24(sp)
8040b620:	00a32223          	sw	a0,4(t1)
8040b624:	01632423          	sw	s6,8(t1)
8040b628:	00050463          	beqz	a0,8040b630 <stride_dequeue+0x220c>
8040b62c:	00652023          	sw	t1,0(a0)
8040b630:	008c2b03          	lw	s6,8(s8)
8040b634:	01012783          	lw	a5,16(sp)
8040b638:	0068a223          	sw	t1,4(a7)
8040b63c:	000b0993          	mv	s3,s6
8040b640:	00f8a423          	sw	a5,8(a7)
8040b644:	01132023          	sw	a7,0(t1)
8040b648:	91dfe06f          	j	80409f64 <stride_dequeue+0xb40>
8040b64c:	00892503          	lw	a0,8(s2)
8040b650:	00492983          	lw	s3,4(s2)
8040b654:	000b0593          	mv	a1,s6
8040b658:	af5fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b65c:	00a92223          	sw	a0,4(s2)
8040b660:	01392423          	sw	s3,8(s2)
8040b664:	01412803          	lw	a6,20(sp)
8040b668:	01812783          	lw	a5,24(sp)
8040b66c:	00050463          	beqz	a0,8040b674 <stride_dequeue+0x2250>
8040b670:	01252023          	sw	s2,0(a0)
8040b674:	008c2983          	lw	s3,8(s8)
8040b678:	f71fd06f          	j	804095e8 <stride_dequeue+0x1c4>
8040b67c:	0049a703          	lw	a4,4(s3)
8040b680:	0089a783          	lw	a5,8(s3)
8040b684:	00a12a23          	sw	a0,20(sp)
8040b688:	00e12423          	sw	a4,8(sp)
8040b68c:	04078a63          	beqz	a5,8040b6e0 <stride_dequeue+0x22bc>
8040b690:	00078513          	mv	a0,a5
8040b694:	000a0593          	mv	a1,s4
8040b698:	00c12823          	sw	a2,16(sp)
8040b69c:	00f12623          	sw	a5,12(sp)
8040b6a0:	9f1fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b6a4:	01412883          	lw	a7,20(sp)
8040b6a8:	00c12783          	lw	a5,12(sp)
8040b6ac:	01012603          	lw	a2,16(sp)
8040b6b0:	631508e3          	beq	a0,a7,8040c4e0 <stride_dequeue+0x30bc>
8040b6b4:	008a2583          	lw	a1,8(s4)
8040b6b8:	004a2b03          	lw	s6,4(s4)
8040b6bc:	00078513          	mv	a0,a5
8040b6c0:	00c12623          	sw	a2,12(sp)
8040b6c4:	a89fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b6c8:	00aa2223          	sw	a0,4(s4)
8040b6cc:	016a2423          	sw	s6,8(s4)
8040b6d0:	00c12603          	lw	a2,12(sp)
8040b6d4:	00050463          	beqz	a0,8040b6dc <stride_dequeue+0x22b8>
8040b6d8:	01452023          	sw	s4,0(a0)
8040b6dc:	008c2b03          	lw	s6,8(s8)
8040b6e0:	00812783          	lw	a5,8(sp)
8040b6e4:	0149a223          	sw	s4,4(s3)
8040b6e8:	00f9a423          	sw	a5,8(s3)
8040b6ec:	013a2023          	sw	s3,0(s4)
8040b6f0:	00098a13          	mv	s4,s3
8040b6f4:	85cff06f          	j	8040a750 <stride_dequeue+0x132c>
8040b6f8:	004a2703          	lw	a4,4(s4)
8040b6fc:	008a2783          	lw	a5,8(s4)
8040b700:	00a12a23          	sw	a0,20(sp)
8040b704:	00e12623          	sw	a4,12(sp)
8040b708:	04078263          	beqz	a5,8040b74c <stride_dequeue+0x2328>
8040b70c:	00078513          	mv	a0,a5
8040b710:	00098593          	mv	a1,s3
8040b714:	00f12823          	sw	a5,16(sp)
8040b718:	979fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b71c:	01412303          	lw	t1,20(sp)
8040b720:	01012783          	lw	a5,16(sp)
8040b724:	526504e3          	beq	a0,t1,8040c44c <stride_dequeue+0x3028>
8040b728:	0089a583          	lw	a1,8(s3)
8040b72c:	0049ab03          	lw	s6,4(s3)
8040b730:	00078513          	mv	a0,a5
8040b734:	a19fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b738:	00a9a223          	sw	a0,4(s3)
8040b73c:	0169a423          	sw	s6,8(s3)
8040b740:	00050463          	beqz	a0,8040b748 <stride_dequeue+0x2324>
8040b744:	01352023          	sw	s3,0(a0)
8040b748:	008c2b03          	lw	s6,8(s8)
8040b74c:	00c12783          	lw	a5,12(sp)
8040b750:	013a2223          	sw	s3,4(s4)
8040b754:	00fa2423          	sw	a5,8(s4)
8040b758:	0149a023          	sw	s4,0(s3)
8040b75c:	000a0993          	mv	s3,s4
8040b760:	a89fe06f          	j	8040a1e8 <stride_dequeue+0xdc4>
8040b764:	0049a703          	lw	a4,4(s3)
8040b768:	0089a783          	lw	a5,8(s3)
8040b76c:	00a12a23          	sw	a0,20(sp)
8040b770:	00e12623          	sw	a4,12(sp)
8040b774:	04078263          	beqz	a5,8040b7b8 <stride_dequeue+0x2394>
8040b778:	00078513          	mv	a0,a5
8040b77c:	000a0593          	mv	a1,s4
8040b780:	00f12823          	sw	a5,16(sp)
8040b784:	90dfd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b788:	01412883          	lw	a7,20(sp)
8040b78c:	01012783          	lw	a5,16(sp)
8040b790:	5f1502e3          	beq	a0,a7,8040c574 <stride_dequeue+0x3150>
8040b794:	008a2583          	lw	a1,8(s4)
8040b798:	004a2b03          	lw	s6,4(s4)
8040b79c:	00078513          	mv	a0,a5
8040b7a0:	9adfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b7a4:	00aa2223          	sw	a0,4(s4)
8040b7a8:	016a2423          	sw	s6,8(s4)
8040b7ac:	00050463          	beqz	a0,8040b7b4 <stride_dequeue+0x2390>
8040b7b0:	01452023          	sw	s4,0(a0)
8040b7b4:	008c2b03          	lw	s6,8(s8)
8040b7b8:	00c12783          	lw	a5,12(sp)
8040b7bc:	0149a223          	sw	s4,4(s3)
8040b7c0:	00f9a423          	sw	a5,8(s3)
8040b7c4:	013a2023          	sw	s3,0(s4)
8040b7c8:	00098a13          	mv	s4,s3
8040b7cc:	89cff06f          	j	8040a868 <stride_dequeue+0x1444>
8040b7d0:	0049a703          	lw	a4,4(s3)
8040b7d4:	0089a783          	lw	a5,8(s3)
8040b7d8:	00a12a23          	sw	a0,20(sp)
8040b7dc:	00e12623          	sw	a4,12(sp)
8040b7e0:	04078263          	beqz	a5,8040b824 <stride_dequeue+0x2400>
8040b7e4:	00078513          	mv	a0,a5
8040b7e8:	000c8593          	mv	a1,s9
8040b7ec:	00f12823          	sw	a5,16(sp)
8040b7f0:	8a1fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b7f4:	01412883          	lw	a7,20(sp)
8040b7f8:	01012783          	lw	a5,16(sp)
8040b7fc:	551504e3          	beq	a0,a7,8040c544 <stride_dequeue+0x3120>
8040b800:	008ca583          	lw	a1,8(s9)
8040b804:	004cab03          	lw	s6,4(s9)
8040b808:	00078513          	mv	a0,a5
8040b80c:	941fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b810:	00aca223          	sw	a0,4(s9)
8040b814:	016ca423          	sw	s6,8(s9)
8040b818:	00050463          	beqz	a0,8040b820 <stride_dequeue+0x23fc>
8040b81c:	01952023          	sw	s9,0(a0)
8040b820:	008c2b03          	lw	s6,8(s8)
8040b824:	00c12783          	lw	a5,12(sp)
8040b828:	0199a223          	sw	s9,4(s3)
8040b82c:	00f9a423          	sw	a5,8(s3)
8040b830:	013ca023          	sw	s3,0(s9)
8040b834:	00098c93          	mv	s9,s3
8040b838:	944ff06f          	j	8040a97c <stride_dequeue+0x1558>
8040b83c:	008c2b03          	lw	s6,8(s8)
8040b840:	00088993          	mv	s3,a7
8040b844:	dc9fe06f          	j	8040a60c <stride_dequeue+0x11e8>
8040b848:	0048a783          	lw	a5,4(a7)
8040b84c:	0088a803          	lw	a6,8(a7)
8040b850:	00a12e23          	sw	a0,28(sp)
8040b854:	00f12823          	sw	a5,16(sp)
8040b858:	04080a63          	beqz	a6,8040b8ac <stride_dequeue+0x2488>
8040b85c:	00080513          	mv	a0,a6
8040b860:	00098593          	mv	a1,s3
8040b864:	01112c23          	sw	a7,24(sp)
8040b868:	01012a23          	sw	a6,20(sp)
8040b86c:	825fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b870:	01c12e03          	lw	t3,28(sp)
8040b874:	01412803          	lw	a6,20(sp)
8040b878:	01812883          	lw	a7,24(sp)
8040b87c:	57c502e3          	beq	a0,t3,8040c5e0 <stride_dequeue+0x31bc>
8040b880:	0089a583          	lw	a1,8(s3)
8040b884:	0049ab03          	lw	s6,4(s3)
8040b888:	00080513          	mv	a0,a6
8040b88c:	01112a23          	sw	a7,20(sp)
8040b890:	8bdfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b894:	00a9a223          	sw	a0,4(s3)
8040b898:	0169a423          	sw	s6,8(s3)
8040b89c:	01412883          	lw	a7,20(sp)
8040b8a0:	00050463          	beqz	a0,8040b8a8 <stride_dequeue+0x2484>
8040b8a4:	01352023          	sw	s3,0(a0)
8040b8a8:	008c2b03          	lw	s6,8(s8)
8040b8ac:	01012783          	lw	a5,16(sp)
8040b8b0:	0138a223          	sw	s3,4(a7)
8040b8b4:	00f8a423          	sw	a5,8(a7)
8040b8b8:	0119a023          	sw	a7,0(s3)
8040b8bc:	00088993          	mv	s3,a7
8040b8c0:	c81fe06f          	j	8040a540 <stride_dequeue+0x111c>
8040b8c4:	0048a783          	lw	a5,4(a7)
8040b8c8:	0088a803          	lw	a6,8(a7)
8040b8cc:	00a12e23          	sw	a0,28(sp)
8040b8d0:	00f12823          	sw	a5,16(sp)
8040b8d4:	04080a63          	beqz	a6,8040b928 <stride_dequeue+0x2504>
8040b8d8:	00080513          	mv	a0,a6
8040b8dc:	00098593          	mv	a1,s3
8040b8e0:	01112c23          	sw	a7,24(sp)
8040b8e4:	01012a23          	sw	a6,20(sp)
8040b8e8:	fa8fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b8ec:	01c12e03          	lw	t3,28(sp)
8040b8f0:	01412803          	lw	a6,20(sp)
8040b8f4:	01812883          	lw	a7,24(sp)
8040b8f8:	69c508e3          	beq	a0,t3,8040c788 <stride_dequeue+0x3364>
8040b8fc:	0089a583          	lw	a1,8(s3)
8040b900:	0049ab03          	lw	s6,4(s3)
8040b904:	00080513          	mv	a0,a6
8040b908:	01112a23          	sw	a7,20(sp)
8040b90c:	841fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b910:	00a9a223          	sw	a0,4(s3)
8040b914:	0169a423          	sw	s6,8(s3)
8040b918:	01412883          	lw	a7,20(sp)
8040b91c:	00050463          	beqz	a0,8040b924 <stride_dequeue+0x2500>
8040b920:	01352023          	sw	s3,0(a0)
8040b924:	008c2b03          	lw	s6,8(s8)
8040b928:	01012783          	lw	a5,16(sp)
8040b92c:	0138a223          	sw	s3,4(a7)
8040b930:	00f8a423          	sw	a5,8(a7)
8040b934:	0119a023          	sw	a7,0(s3)
8040b938:	00088993          	mv	s3,a7
8040b93c:	9c1fe06f          	j	8040a2fc <stride_dequeue+0xed8>
8040b940:	0048a783          	lw	a5,4(a7)
8040b944:	0088a803          	lw	a6,8(a7)
8040b948:	00a12e23          	sw	a0,28(sp)
8040b94c:	00f12623          	sw	a5,12(sp)
8040b950:	06080263          	beqz	a6,8040b9b4 <stride_dequeue+0x2590>
8040b954:	00080513          	mv	a0,a6
8040b958:	00098593          	mv	a1,s3
8040b95c:	01112c23          	sw	a7,24(sp)
8040b960:	01012823          	sw	a6,16(sp)
8040b964:	f2cfd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b968:	01c12e03          	lw	t3,28(sp)
8040b96c:	01012803          	lw	a6,16(sp)
8040b970:	01412603          	lw	a2,20(sp)
8040b974:	01812883          	lw	a7,24(sp)
8040b978:	01c51463          	bne	a0,t3,8040b980 <stride_dequeue+0x255c>
8040b97c:	7690006f          	j	8040c8e4 <stride_dequeue+0x34c0>
8040b980:	0089a583          	lw	a1,8(s3)
8040b984:	0049ab03          	lw	s6,4(s3)
8040b988:	00080513          	mv	a0,a6
8040b98c:	01112a23          	sw	a7,20(sp)
8040b990:	00c12823          	sw	a2,16(sp)
8040b994:	fb8fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040b998:	00a9a223          	sw	a0,4(s3)
8040b99c:	0169a423          	sw	s6,8(s3)
8040b9a0:	01012603          	lw	a2,16(sp)
8040b9a4:	01412883          	lw	a7,20(sp)
8040b9a8:	00050463          	beqz	a0,8040b9b0 <stride_dequeue+0x258c>
8040b9ac:	01352023          	sw	s3,0(a0)
8040b9b0:	008c2b03          	lw	s6,8(s8)
8040b9b4:	00c12783          	lw	a5,12(sp)
8040b9b8:	0138a223          	sw	s3,4(a7)
8040b9bc:	00f8a423          	sw	a5,8(a7)
8040b9c0:	0119a023          	sw	a7,0(s3)
8040b9c4:	00088993          	mv	s3,a7
8040b9c8:	a69fe06f          	j	8040a430 <stride_dequeue+0x100c>
8040b9cc:	00462783          	lw	a5,4(a2)
8040b9d0:	00862883          	lw	a7,8(a2)
8040b9d4:	00a12e23          	sw	a0,28(sp)
8040b9d8:	00f12623          	sw	a5,12(sp)
8040b9dc:	06088263          	beqz	a7,8040ba40 <stride_dequeue+0x261c>
8040b9e0:	00088513          	mv	a0,a7
8040b9e4:	00098593          	mv	a1,s3
8040b9e8:	01012c23          	sw	a6,24(sp)
8040b9ec:	00c12a23          	sw	a2,20(sp)
8040b9f0:	01112823          	sw	a7,16(sp)
8040b9f4:	e9cfd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040b9f8:	01c12e03          	lw	t3,28(sp)
8040b9fc:	01012883          	lw	a7,16(sp)
8040ba00:	01412603          	lw	a2,20(sp)
8040ba04:	01812803          	lw	a6,24(sp)
8040ba08:	45c502e3          	beq	a0,t3,8040c64c <stride_dequeue+0x3228>
8040ba0c:	0089a583          	lw	a1,8(s3)
8040ba10:	0049ab03          	lw	s6,4(s3)
8040ba14:	00088513          	mv	a0,a7
8040ba18:	01012a23          	sw	a6,20(sp)
8040ba1c:	00c12823          	sw	a2,16(sp)
8040ba20:	f2cfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040ba24:	00a9a223          	sw	a0,4(s3)
8040ba28:	0169a423          	sw	s6,8(s3)
8040ba2c:	01012603          	lw	a2,16(sp)
8040ba30:	01412803          	lw	a6,20(sp)
8040ba34:	00050463          	beqz	a0,8040ba3c <stride_dequeue+0x2618>
8040ba38:	01352023          	sw	s3,0(a0)
8040ba3c:	008c2b03          	lw	s6,8(s8)
8040ba40:	00c12783          	lw	a5,12(sp)
8040ba44:	01362223          	sw	s3,4(a2)
8040ba48:	00f62423          	sw	a5,8(a2)
8040ba4c:	00c9a023          	sw	a2,0(s3)
8040ba50:	00060993          	mv	s3,a2
8040ba54:	be0fe06f          	j	80409e34 <stride_dequeue+0xa10>
8040ba58:	0049a783          	lw	a5,4(s3)
8040ba5c:	0089a303          	lw	t1,8(s3)
8040ba60:	00a12e23          	sw	a0,28(sp)
8040ba64:	00f12823          	sw	a5,16(sp)
8040ba68:	04030a63          	beqz	t1,8040babc <stride_dequeue+0x2698>
8040ba6c:	00080593          	mv	a1,a6
8040ba70:	00030513          	mv	a0,t1
8040ba74:	01012c23          	sw	a6,24(sp)
8040ba78:	00612a23          	sw	t1,20(sp)
8040ba7c:	e14fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040ba80:	01c12e03          	lw	t3,28(sp)
8040ba84:	01412303          	lw	t1,20(sp)
8040ba88:	01812803          	lw	a6,24(sp)
8040ba8c:	4dc506e3          	beq	a0,t3,8040c758 <stride_dequeue+0x3334>
8040ba90:	00882583          	lw	a1,8(a6)
8040ba94:	00030513          	mv	a0,t1
8040ba98:	00482b03          	lw	s6,4(a6)
8040ba9c:	01012a23          	sw	a6,20(sp)
8040baa0:	eacfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040baa4:	01412803          	lw	a6,20(sp)
8040baa8:	00a82223          	sw	a0,4(a6)
8040baac:	01682423          	sw	s6,8(a6)
8040bab0:	00050463          	beqz	a0,8040bab8 <stride_dequeue+0x2694>
8040bab4:	01052023          	sw	a6,0(a0)
8040bab8:	008c2b03          	lw	s6,8(s8)
8040babc:	01012783          	lw	a5,16(sp)
8040bac0:	0109a223          	sw	a6,4(s3)
8040bac4:	00f9a423          	sw	a5,8(s3)
8040bac8:	01382023          	sw	s3,0(a6)
8040bacc:	00098813          	mv	a6,s3
8040bad0:	85cff06f          	j	8040ab2c <stride_dequeue+0x1708>
8040bad4:	008c2b03          	lw	s6,8(s8)
8040bad8:	00088993          	mv	s3,a7
8040badc:	c70fe06f          	j	80409f4c <stride_dequeue+0xb28>
8040bae0:	0049a783          	lw	a5,4(s3)
8040bae4:	0089a303          	lw	t1,8(s3)
8040bae8:	00a12e23          	sw	a0,28(sp)
8040baec:	00f12823          	sw	a5,16(sp)
8040baf0:	04030a63          	beqz	t1,8040bb44 <stride_dequeue+0x2720>
8040baf4:	00080593          	mv	a1,a6
8040baf8:	00030513          	mv	a0,t1
8040bafc:	01012c23          	sw	a6,24(sp)
8040bb00:	00612a23          	sw	t1,20(sp)
8040bb04:	d8cfd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040bb08:	01c12e03          	lw	t3,28(sp)
8040bb0c:	01412303          	lw	t1,20(sp)
8040bb10:	01812803          	lw	a6,24(sp)
8040bb14:	41c50ae3          	beq	a0,t3,8040c728 <stride_dequeue+0x3304>
8040bb18:	00882583          	lw	a1,8(a6)
8040bb1c:	00030513          	mv	a0,t1
8040bb20:	00482b03          	lw	s6,4(a6)
8040bb24:	01012a23          	sw	a6,20(sp)
8040bb28:	e24fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bb2c:	01412803          	lw	a6,20(sp)
8040bb30:	00a82223          	sw	a0,4(a6)
8040bb34:	01682423          	sw	s6,8(a6)
8040bb38:	00050463          	beqz	a0,8040bb40 <stride_dequeue+0x271c>
8040bb3c:	01052023          	sw	a6,0(a0)
8040bb40:	008c2b03          	lw	s6,8(s8)
8040bb44:	01012783          	lw	a5,16(sp)
8040bb48:	0109a223          	sw	a6,4(s3)
8040bb4c:	00f9a423          	sw	a5,8(s3)
8040bb50:	01382023          	sw	s3,0(a6)
8040bb54:	00098813          	mv	a6,s3
8040bb58:	8a8ff06f          	j	8040ac00 <stride_dequeue+0x17dc>
8040bb5c:	004ca783          	lw	a5,4(s9)
8040bb60:	008ca883          	lw	a7,8(s9)
8040bb64:	00a12e23          	sw	a0,28(sp)
8040bb68:	00f12823          	sw	a5,16(sp)
8040bb6c:	04088a63          	beqz	a7,8040bbc0 <stride_dequeue+0x279c>
8040bb70:	00088513          	mv	a0,a7
8040bb74:	00098593          	mv	a1,s3
8040bb78:	01012c23          	sw	a6,24(sp)
8040bb7c:	01112a23          	sw	a7,20(sp)
8040bb80:	d10fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040bb84:	01c12e03          	lw	t3,28(sp)
8040bb88:	01412883          	lw	a7,20(sp)
8040bb8c:	01812803          	lw	a6,24(sp)
8040bb90:	53c500e3          	beq	a0,t3,8040c8b0 <stride_dequeue+0x348c>
8040bb94:	0089a583          	lw	a1,8(s3)
8040bb98:	0049ab03          	lw	s6,4(s3)
8040bb9c:	00088513          	mv	a0,a7
8040bba0:	01012a23          	sw	a6,20(sp)
8040bba4:	da8fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bba8:	00a9a223          	sw	a0,4(s3)
8040bbac:	0169a423          	sw	s6,8(s3)
8040bbb0:	01412803          	lw	a6,20(sp)
8040bbb4:	00050463          	beqz	a0,8040bbbc <stride_dequeue+0x2798>
8040bbb8:	01352023          	sw	s3,0(a0)
8040bbbc:	008c2b03          	lw	s6,8(s8)
8040bbc0:	01012783          	lw	a5,16(sp)
8040bbc4:	013ca223          	sw	s3,4(s9)
8040bbc8:	00fca423          	sw	a5,8(s9)
8040bbcc:	0199a023          	sw	s9,0(s3)
8040bbd0:	000c8993          	mv	s3,s9
8040bbd4:	f99fd06f          	j	80409b6c <stride_dequeue+0x748>
8040bbd8:	008c2b03          	lw	s6,8(s8)
8040bbdc:	000d8993          	mv	s3,s11
8040bbe0:	c11fd06f          	j	804097f0 <stride_dequeue+0x3cc>
8040bbe4:	004a2783          	lw	a5,4(s4)
8040bbe8:	008a2883          	lw	a7,8(s4)
8040bbec:	00a12e23          	sw	a0,28(sp)
8040bbf0:	00f12823          	sw	a5,16(sp)
8040bbf4:	04088a63          	beqz	a7,8040bc48 <stride_dequeue+0x2824>
8040bbf8:	00088513          	mv	a0,a7
8040bbfc:	00098593          	mv	a1,s3
8040bc00:	01012c23          	sw	a6,24(sp)
8040bc04:	01112a23          	sw	a7,20(sp)
8040bc08:	c88fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040bc0c:	01c12e03          	lw	t3,28(sp)
8040bc10:	01412883          	lw	a7,20(sp)
8040bc14:	01812803          	lw	a6,24(sp)
8040bc18:	57c502e3          	beq	a0,t3,8040c97c <stride_dequeue+0x3558>
8040bc1c:	0089a583          	lw	a1,8(s3)
8040bc20:	0049ab03          	lw	s6,4(s3)
8040bc24:	00088513          	mv	a0,a7
8040bc28:	01012a23          	sw	a6,20(sp)
8040bc2c:	d20fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bc30:	00a9a223          	sw	a0,4(s3)
8040bc34:	0169a423          	sw	s6,8(s3)
8040bc38:	01412803          	lw	a6,20(sp)
8040bc3c:	00050463          	beqz	a0,8040bc44 <stride_dequeue+0x2820>
8040bc40:	01352023          	sw	s3,0(a0)
8040bc44:	008c2b03          	lw	s6,8(s8)
8040bc48:	01012783          	lw	a5,16(sp)
8040bc4c:	013a2223          	sw	s3,4(s4)
8040bc50:	00fa2423          	sw	a5,8(s4)
8040bc54:	0149a023          	sw	s4,0(s3)
8040bc58:	000a0993          	mv	s3,s4
8040bc5c:	870fe06f          	j	80409ccc <stride_dequeue+0x8a8>
8040bc60:	0049a783          	lw	a5,4(s3)
8040bc64:	0089a303          	lw	t1,8(s3)
8040bc68:	00a12e23          	sw	a0,28(sp)
8040bc6c:	00f12823          	sw	a5,16(sp)
8040bc70:	04030a63          	beqz	t1,8040bcc4 <stride_dequeue+0x28a0>
8040bc74:	00030513          	mv	a0,t1
8040bc78:	000c8593          	mv	a1,s9
8040bc7c:	01112c23          	sw	a7,24(sp)
8040bc80:	00612a23          	sw	t1,20(sp)
8040bc84:	c0cfd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040bc88:	01c12e03          	lw	t3,28(sp)
8040bc8c:	01412303          	lw	t1,20(sp)
8040bc90:	01812883          	lw	a7,24(sp)
8040bc94:	1fc508e3          	beq	a0,t3,8040c684 <stride_dequeue+0x3260>
8040bc98:	008ca583          	lw	a1,8(s9)
8040bc9c:	004cab03          	lw	s6,4(s9)
8040bca0:	00030513          	mv	a0,t1
8040bca4:	01112a23          	sw	a7,20(sp)
8040bca8:	ca4fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bcac:	00aca223          	sw	a0,4(s9)
8040bcb0:	016ca423          	sw	s6,8(s9)
8040bcb4:	01412883          	lw	a7,20(sp)
8040bcb8:	00050463          	beqz	a0,8040bcc0 <stride_dequeue+0x289c>
8040bcbc:	01952023          	sw	s9,0(a0)
8040bcc0:	008c2b03          	lw	s6,8(s8)
8040bcc4:	01012783          	lw	a5,16(sp)
8040bcc8:	0199a223          	sw	s9,4(s3)
8040bccc:	00f9a423          	sw	a5,8(s3)
8040bcd0:	013ca023          	sw	s3,0(s9)
8040bcd4:	00098c93          	mv	s9,s3
8040bcd8:	d7dfe06f          	j	8040aa54 <stride_dequeue+0x1630>
8040bcdc:	008c2b03          	lw	s6,8(s8)
8040bce0:	000c8993          	mv	s3,s9
8040bce4:	b9cfe06f          	j	8040a080 <stride_dequeue+0xc5c>
8040bce8:	0049a783          	lw	a5,4(s3)
8040bcec:	0089a303          	lw	t1,8(s3)
8040bcf0:	00a12e23          	sw	a0,28(sp)
8040bcf4:	00f12623          	sw	a5,12(sp)
8040bcf8:	06030263          	beqz	t1,8040bd5c <stride_dequeue+0x2938>
8040bcfc:	00080593          	mv	a1,a6
8040bd00:	00030513          	mv	a0,t1
8040bd04:	00c12c23          	sw	a2,24(sp)
8040bd08:	01012a23          	sw	a6,20(sp)
8040bd0c:	00612823          	sw	t1,16(sp)
8040bd10:	b80fd0ef          	jal	ra,80409090 <proc_stride_comp_f>
8040bd14:	01812603          	lw	a2,24(sp)
8040bd18:	01c12e03          	lw	t3,28(sp)
8040bd1c:	01412803          	lw	a6,20(sp)
8040bd20:	00c12a23          	sw	a2,20(sp)
8040bd24:	01012303          	lw	t1,16(sp)
8040bd28:	29c50ae3          	beq	a0,t3,8040c7bc <stride_dequeue+0x3398>
8040bd2c:	00882583          	lw	a1,8(a6)
8040bd30:	00030513          	mv	a0,t1
8040bd34:	00482b03          	lw	s6,4(a6)
8040bd38:	01012823          	sw	a6,16(sp)
8040bd3c:	c10fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bd40:	01012803          	lw	a6,16(sp)
8040bd44:	01412603          	lw	a2,20(sp)
8040bd48:	00a82223          	sw	a0,4(a6)
8040bd4c:	01682423          	sw	s6,8(a6)
8040bd50:	00050463          	beqz	a0,8040bd58 <stride_dequeue+0x2934>
8040bd54:	01052023          	sw	a6,0(a0)
8040bd58:	008c2b03          	lw	s6,8(s8)
8040bd5c:	00c12783          	lw	a5,12(sp)
8040bd60:	0109a223          	sw	a6,4(s3)
8040bd64:	00f9a423          	sw	a5,8(s3)
8040bd68:	01382023          	sw	s3,0(a6)
8040bd6c:	00098813          	mv	a6,s3
8040bd70:	f7dfe06f          	j	8040acec <stride_dequeue+0x18c8>
8040bd74:	000a0993          	mv	s3,s4
8040bd78:	c70fe06f          	j	8040a1e8 <stride_dequeue+0xdc4>
8040bd7c:	008c2b03          	lw	s6,8(s8)
8040bd80:	000d8993          	mv	s3,s11
8040bd84:	c49fd06f          	j	804099cc <stride_dequeue+0x5a8>
8040bd88:	008da503          	lw	a0,8(s11)
8040bd8c:	004dab03          	lw	s6,4(s11)
8040bd90:	00098593          	mv	a1,s3
8040bd94:	bb8fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bd98:	00ada223          	sw	a0,4(s11)
8040bd9c:	016da423          	sw	s6,8(s11)
8040bda0:	01012603          	lw	a2,16(sp)
8040bda4:	01412803          	lw	a6,20(sp)
8040bda8:	01812303          	lw	t1,24(sp)
8040bdac:	fc0508e3          	beqz	a0,8040bd7c <stride_dequeue+0x2958>
8040bdb0:	01b52023          	sw	s11,0(a0)
8040bdb4:	000d8993          	mv	s3,s11
8040bdb8:	008c2b03          	lw	s6,8(s8)
8040bdbc:	c11fd06f          	j	804099cc <stride_dequeue+0x5a8>
8040bdc0:	0089a503          	lw	a0,8(s3)
8040bdc4:	0049ab03          	lw	s6,4(s3)
8040bdc8:	00078593          	mv	a1,a5
8040bdcc:	01012a23          	sw	a6,20(sp)
8040bdd0:	b7cfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bdd4:	00a9a223          	sw	a0,4(s3)
8040bdd8:	0169a423          	sw	s6,8(s3)
8040bddc:	01412803          	lw	a6,20(sp)
8040bde0:	6a050a63          	beqz	a0,8040c494 <stride_dequeue+0x3070>
8040bde4:	01352023          	sw	s3,0(a0)
8040bde8:	00098793          	mv	a5,s3
8040bdec:	008c2b03          	lw	s6,8(s8)
8040bdf0:	f85fe06f          	j	8040ad74 <stride_dequeue+0x1950>
8040bdf4:	0088a503          	lw	a0,8(a7)
8040bdf8:	00098593          	mv	a1,s3
8040bdfc:	0048ab03          	lw	s6,4(a7)
8040be00:	00612c23          	sw	t1,24(sp)
8040be04:	01112a23          	sw	a7,20(sp)
8040be08:	b44fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040be0c:	01412883          	lw	a7,20(sp)
8040be10:	01812303          	lw	t1,24(sp)
8040be14:	00a8a223          	sw	a0,4(a7)
8040be18:	0168a423          	sw	s6,8(a7)
8040be1c:	ca050ce3          	beqz	a0,8040bad4 <stride_dequeue+0x26b0>
8040be20:	01152023          	sw	a7,0(a0)
8040be24:	00088993          	mv	s3,a7
8040be28:	008c2b03          	lw	s6,8(s8)
8040be2c:	920fe06f          	j	80409f4c <stride_dequeue+0xb28>
8040be30:	008ca503          	lw	a0,8(s9)
8040be34:	004cab03          	lw	s6,4(s9)
8040be38:	00098593          	mv	a1,s3
8040be3c:	b10fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040be40:	00aca223          	sw	a0,4(s9)
8040be44:	016ca423          	sw	s6,8(s9)
8040be48:	01412803          	lw	a6,20(sp)
8040be4c:	01812303          	lw	t1,24(sp)
8040be50:	e80506e3          	beqz	a0,8040bcdc <stride_dequeue+0x28b8>
8040be54:	01952023          	sw	s9,0(a0)
8040be58:	000c8993          	mv	s3,s9
8040be5c:	008c2b03          	lw	s6,8(s8)
8040be60:	a20fe06f          	j	8040a080 <stride_dequeue+0xc5c>
8040be64:	008da503          	lw	a0,8(s11)
8040be68:	004dab03          	lw	s6,4(s11)
8040be6c:	00098593          	mv	a1,s3
8040be70:	adcfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040be74:	00ada223          	sw	a0,4(s11)
8040be78:	016da423          	sw	s6,8(s11)
8040be7c:	01412803          	lw	a6,20(sp)
8040be80:	01812303          	lw	t1,24(sp)
8040be84:	d4050ae3          	beqz	a0,8040bbd8 <stride_dequeue+0x27b4>
8040be88:	01b52023          	sw	s11,0(a0)
8040be8c:	000d8993          	mv	s3,s11
8040be90:	008c2b03          	lw	s6,8(s8)
8040be94:	95dfd06f          	j	804097f0 <stride_dequeue+0x3cc>
8040be98:	0088a503          	lw	a0,8(a7)
8040be9c:	00098593          	mv	a1,s3
8040bea0:	0048ab03          	lw	s6,4(a7)
8040bea4:	01012c23          	sw	a6,24(sp)
8040bea8:	01112a23          	sw	a7,20(sp)
8040beac:	aa0fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040beb0:	01412883          	lw	a7,20(sp)
8040beb4:	01812803          	lw	a6,24(sp)
8040beb8:	00a8a223          	sw	a0,4(a7)
8040bebc:	0168a423          	sw	s6,8(a7)
8040bec0:	96050ee3          	beqz	a0,8040b83c <stride_dequeue+0x2418>
8040bec4:	01152023          	sw	a7,0(a0)
8040bec8:	00088993          	mv	s3,a7
8040becc:	008c2b03          	lw	s6,8(s8)
8040bed0:	f3cfe06f          	j	8040a60c <stride_dequeue+0x11e8>
8040bed4:	000a0993          	mv	s3,s4
8040bed8:	df5fd06f          	j	80409ccc <stride_dequeue+0x8a8>
8040bedc:	00009697          	auipc	a3,0x9
8040bee0:	14c68693          	addi	a3,a3,332 # 80415028 <CSWTCH.69+0xac0>
8040bee4:	00007617          	auipc	a2,0x7
8040bee8:	24860613          	addi	a2,a2,584 # 8041312c <commands+0x1f8>
8040beec:	06300593          	li	a1,99
8040bef0:	00009517          	auipc	a0,0x9
8040bef4:	15c50513          	addi	a0,a0,348 # 8041504c <CSWTCH.69+0xae4>
8040bef8:	f2cf40ef          	jal	ra,80400624 <__panic>
8040befc:	000c8993          	mv	s3,s9
8040bf00:	c6dfd06f          	j	80409b6c <stride_dequeue+0x748>
8040bf04:	00088993          	mv	s3,a7
8040bf08:	d28fe06f          	j	8040a430 <stride_dequeue+0x100c>
8040bf0c:	00088993          	mv	s3,a7
8040bf10:	becfe06f          	j	8040a2fc <stride_dequeue+0xed8>
8040bf14:	00060993          	mv	s3,a2
8040bf18:	f1dfd06f          	j	80409e34 <stride_dequeue+0xa10>
8040bf1c:	00088993          	mv	s3,a7
8040bf20:	e20fe06f          	j	8040a540 <stride_dequeue+0x111c>
8040bf24:	0089a503          	lw	a0,8(s3)
8040bf28:	0049ab03          	lw	s6,4(s3)
8040bf2c:	00040593          	mv	a1,s0
8040bf30:	a1cfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bf34:	00a9a223          	sw	a0,4(s3)
8040bf38:	0169a423          	sw	s6,8(s3)
8040bf3c:	00050463          	beqz	a0,8040bf44 <stride_dequeue+0x2b20>
8040bf40:	01352023          	sw	s3,0(a0)
8040bf44:	008c2b03          	lw	s6,8(s8)
8040bf48:	ef1fe06f          	j	8040ae38 <stride_dequeue+0x1a14>
8040bf4c:	0089a503          	lw	a0,8(s3)
8040bf50:	0049ab03          	lw	s6,4(s3)
8040bf54:	00030593          	mv	a1,t1
8040bf58:	01012a23          	sw	a6,20(sp)
8040bf5c:	9f0fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bf60:	00a9a223          	sw	a0,4(s3)
8040bf64:	0169a423          	sw	s6,8(s3)
8040bf68:	01412803          	lw	a6,20(sp)
8040bf6c:	300508e3          	beqz	a0,8040ca7c <stride_dequeue+0x3658>
8040bf70:	01352023          	sw	s3,0(a0)
8040bf74:	00098313          	mv	t1,s3
8040bf78:	008c2b03          	lw	s6,8(s8)
8040bf7c:	db4ff06f          	j	8040b530 <stride_dequeue+0x210c>
8040bf80:	0088a503          	lw	a0,8(a7)
8040bf84:	000e0593          	mv	a1,t3
8040bf88:	0048ab03          	lw	s6,4(a7)
8040bf8c:	01112a23          	sw	a7,20(sp)
8040bf90:	9bcfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bf94:	01412883          	lw	a7,20(sp)
8040bf98:	00a8a223          	sw	a0,4(a7)
8040bf9c:	0168a423          	sw	s6,8(a7)
8040bfa0:	00050463          	beqz	a0,8040bfa8 <stride_dequeue+0x2b84>
8040bfa4:	01152023          	sw	a7,0(a0)
8040bfa8:	008c2b03          	lw	s6,8(s8)
8040bfac:	d84fe06f          	j	8040a530 <stride_dequeue+0x110c>
8040bfb0:	0089a503          	lw	a0,8(s3)
8040bfb4:	0049ab03          	lw	s6,4(s3)
8040bfb8:	00080593          	mv	a1,a6
8040bfbc:	01112a23          	sw	a7,20(sp)
8040bfc0:	98cfd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bfc4:	00a9a223          	sw	a0,4(s3)
8040bfc8:	0169a423          	sw	s6,8(s3)
8040bfcc:	01412883          	lw	a7,20(sp)
8040bfd0:	300506e3          	beqz	a0,8040cadc <stride_dequeue+0x36b8>
8040bfd4:	01352023          	sw	s3,0(a0)
8040bfd8:	00098813          	mv	a6,s3
8040bfdc:	008c2b03          	lw	s6,8(s8)
8040bfe0:	c34ff06f          	j	8040b414 <stride_dequeue+0x1ff0>
8040bfe4:	0089a503          	lw	a0,8(s3)
8040bfe8:	0049ab03          	lw	s6,4(s3)
8040bfec:	00060593          	mv	a1,a2
8040bff0:	01112623          	sw	a7,12(sp)
8040bff4:	958fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040bff8:	00a9a223          	sw	a0,4(s3)
8040bffc:	0169a423          	sw	s6,8(s3)
8040c000:	00c12883          	lw	a7,12(sp)
8040c004:	00050463          	beqz	a0,8040c00c <stride_dequeue+0x2be8>
8040c008:	01352023          	sw	s3,0(a0)
8040c00c:	008c2b03          	lw	s6,8(s8)
8040c010:	a90ff06f          	j	8040b2a0 <stride_dequeue+0x1e7c>
8040c014:	0089a503          	lw	a0,8(s3)
8040c018:	0049ab03          	lw	s6,4(s3)
8040c01c:	000a0593          	mv	a1,s4
8040c020:	01112823          	sw	a7,16(sp)
8040c024:	928fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c028:	00a9a223          	sw	a0,4(s3)
8040c02c:	0169a423          	sw	s6,8(s3)
8040c030:	01012883          	lw	a7,16(sp)
8040c034:	00050463          	beqz	a0,8040c03c <stride_dequeue+0x2c18>
8040c038:	01352023          	sw	s3,0(a0)
8040c03c:	008c2b03          	lw	s6,8(s8)
8040c040:	fb9fe06f          	j	8040aff8 <stride_dequeue+0x1bd4>
8040c044:	0089a503          	lw	a0,8(s3)
8040c048:	0049ab03          	lw	s6,4(s3)
8040c04c:	000e0593          	mv	a1,t3
8040c050:	01012a23          	sw	a6,20(sp)
8040c054:	00c12823          	sw	a2,16(sp)
8040c058:	8f4fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c05c:	00a9a223          	sw	a0,4(s3)
8040c060:	0169a423          	sw	s6,8(s3)
8040c064:	01012603          	lw	a2,16(sp)
8040c068:	01412803          	lw	a6,20(sp)
8040c06c:	00050463          	beqz	a0,8040c074 <stride_dequeue+0x2c50>
8040c070:	01352023          	sw	s3,0(a0)
8040c074:	008c2b03          	lw	s6,8(s8)
8040c078:	c65fe06f          	j	8040acdc <stride_dequeue+0x18b8>
8040c07c:	0089a503          	lw	a0,8(s3)
8040c080:	0049ab03          	lw	s6,4(s3)
8040c084:	00080593          	mv	a1,a6
8040c088:	8c4fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c08c:	00a9a223          	sw	a0,4(s3)
8040c090:	0169a423          	sw	s6,8(s3)
8040c094:	00050463          	beqz	a0,8040c09c <stride_dequeue+0x2c78>
8040c098:	01352023          	sw	s3,0(a0)
8040c09c:	008c2b03          	lw	s6,8(s8)
8040c0a0:	914ff06f          	j	8040b1b4 <stride_dequeue+0x1d90>
8040c0a4:	0089a503          	lw	a0,8(s3)
8040c0a8:	0049ab03          	lw	s6,4(s3)
8040c0ac:	000e0593          	mv	a1,t3
8040c0b0:	01012a23          	sw	a6,20(sp)
8040c0b4:	898fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c0b8:	00a9a223          	sw	a0,4(s3)
8040c0bc:	0169a423          	sw	s6,8(s3)
8040c0c0:	01412803          	lw	a6,20(sp)
8040c0c4:	00050463          	beqz	a0,8040c0cc <stride_dequeue+0x2ca8>
8040c0c8:	01352023          	sw	s3,0(a0)
8040c0cc:	008c2b03          	lw	s6,8(s8)
8040c0d0:	b21fe06f          	j	8040abf0 <stride_dequeue+0x17cc>
8040c0d4:	0089a503          	lw	a0,8(s3)
8040c0d8:	0049ab03          	lw	s6,4(s3)
8040c0dc:	00080593          	mv	a1,a6
8040c0e0:	00c12623          	sw	a2,12(sp)
8040c0e4:	868fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c0e8:	00a9a223          	sw	a0,4(s3)
8040c0ec:	0169a423          	sw	s6,8(s3)
8040c0f0:	00c12603          	lw	a2,12(sp)
8040c0f4:	00050463          	beqz	a0,8040c0fc <stride_dequeue+0x2cd8>
8040c0f8:	01352023          	sw	s3,0(a0)
8040c0fc:	008c2b03          	lw	s6,8(s8)
8040c100:	a94ff06f          	j	8040b394 <stride_dequeue+0x1f70>
8040c104:	0088a503          	lw	a0,8(a7)
8040c108:	000e0593          	mv	a1,t3
8040c10c:	0048ab03          	lw	s6,4(a7)
8040c110:	01112823          	sw	a7,16(sp)
8040c114:	838fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c118:	01012883          	lw	a7,16(sp)
8040c11c:	01412603          	lw	a2,20(sp)
8040c120:	00a8a223          	sw	a0,4(a7)
8040c124:	0168a423          	sw	s6,8(a7)
8040c128:	00050463          	beqz	a0,8040c130 <stride_dequeue+0x2d0c>
8040c12c:	01152023          	sw	a7,0(a0)
8040c130:	008c2b03          	lw	s6,8(s8)
8040c134:	aecfe06f          	j	8040a420 <stride_dequeue+0xffc>
8040c138:	0089a503          	lw	a0,8(s3)
8040c13c:	0049ab03          	lw	s6,4(s3)
8040c140:	00088593          	mv	a1,a7
8040c144:	808fd0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c148:	00a9a223          	sw	a0,4(s3)
8040c14c:	0169a423          	sw	s6,8(s3)
8040c150:	00050463          	beqz	a0,8040c158 <stride_dequeue+0x2d34>
8040c154:	01352023          	sw	s3,0(a0)
8040c158:	008c2b03          	lw	s6,8(s8)
8040c15c:	811fe06f          	j	8040a96c <stride_dequeue+0x1548>
8040c160:	0089a503          	lw	a0,8(s3)
8040c164:	0049ab03          	lw	s6,4(s3)
8040c168:	00088593          	mv	a1,a7
8040c16c:	fe1fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c170:	00a9a223          	sw	a0,4(s3)
8040c174:	0169a423          	sw	s6,8(s3)
8040c178:	00050463          	beqz	a0,8040c180 <stride_dequeue+0x2d5c>
8040c17c:	01352023          	sw	s3,0(a0)
8040c180:	008c2b03          	lw	s6,8(s8)
8040c184:	ed4fe06f          	j	8040a858 <stride_dequeue+0x1434>
8040c188:	00862503          	lw	a0,8(a2)
8040c18c:	000e0593          	mv	a1,t3
8040c190:	00462b03          	lw	s6,4(a2)
8040c194:	fb9fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c198:	01012603          	lw	a2,16(sp)
8040c19c:	01412803          	lw	a6,20(sp)
8040c1a0:	00a62223          	sw	a0,4(a2)
8040c1a4:	01662423          	sw	s6,8(a2)
8040c1a8:	00050463          	beqz	a0,8040c1b0 <stride_dequeue+0x2d8c>
8040c1ac:	00c52023          	sw	a2,0(a0)
8040c1b0:	008c2b03          	lw	s6,8(s8)
8040c1b4:	c71fd06f          	j	80409e24 <stride_dequeue+0xa00>
8040c1b8:	00040993          	mv	s3,s0
8040c1bc:	c7dfe06f          	j	8040ae38 <stride_dequeue+0x1a14>
8040c1c0:	008ca503          	lw	a0,8(s9)
8040c1c4:	004cab03          	lw	s6,4(s9)
8040c1c8:	000e0593          	mv	a1,t3
8040c1cc:	01012a23          	sw	a6,20(sp)
8040c1d0:	f7dfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c1d4:	00aca223          	sw	a0,4(s9)
8040c1d8:	016ca423          	sw	s6,8(s9)
8040c1dc:	01412803          	lw	a6,20(sp)
8040c1e0:	00050463          	beqz	a0,8040c1e8 <stride_dequeue+0x2dc4>
8040c1e4:	01952023          	sw	s9,0(a0)
8040c1e8:	008c2b03          	lw	s6,8(s8)
8040c1ec:	971fd06f          	j	80409b5c <stride_dequeue+0x738>
8040c1f0:	0089a503          	lw	a0,8(s3)
8040c1f4:	0049ab03          	lw	s6,4(s3)
8040c1f8:	00080593          	mv	a1,a6
8040c1fc:	f51fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c200:	00a9a223          	sw	a0,4(s3)
8040c204:	0169a423          	sw	s6,8(s3)
8040c208:	00050463          	beqz	a0,8040c210 <stride_dequeue+0x2dec>
8040c20c:	01352023          	sw	s3,0(a0)
8040c210:	008c2b03          	lw	s6,8(s8)
8040c214:	ec5fe06f          	j	8040b0d8 <stride_dequeue+0x1cb4>
8040c218:	008a2503          	lw	a0,8(s4)
8040c21c:	004a2b03          	lw	s6,4(s4)
8040c220:	000e0593          	mv	a1,t3
8040c224:	01012a23          	sw	a6,20(sp)
8040c228:	f25fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c22c:	00aa2223          	sw	a0,4(s4)
8040c230:	016a2423          	sw	s6,8(s4)
8040c234:	01412803          	lw	a6,20(sp)
8040c238:	00050463          	beqz	a0,8040c240 <stride_dequeue+0x2e1c>
8040c23c:	01452023          	sw	s4,0(a0)
8040c240:	008c2b03          	lw	s6,8(s8)
8040c244:	a79fd06f          	j	80409cbc <stride_dequeue+0x898>
8040c248:	0089a503          	lw	a0,8(s3)
8040c24c:	0049ab03          	lw	s6,4(s3)
8040c250:	00030593          	mv	a1,t1
8040c254:	01012a23          	sw	a6,20(sp)
8040c258:	00c12823          	sw	a2,16(sp)
8040c25c:	ef1fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c260:	00a9a223          	sw	a0,4(s3)
8040c264:	0169a423          	sw	s6,8(s3)
8040c268:	01012603          	lw	a2,16(sp)
8040c26c:	01412803          	lw	a6,20(sp)
8040c270:	06050ce3          	beqz	a0,8040cae8 <stride_dequeue+0x36c4>
8040c274:	01352023          	sw	s3,0(a0)
8040c278:	00098313          	mv	t1,s3
8040c27c:	008c2b03          	lw	s6,8(s8)
8040c280:	a2cff06f          	j	8040b4ac <stride_dequeue+0x2088>
8040c284:	0089a503          	lw	a0,8(s3)
8040c288:	0049ab03          	lw	s6,4(s3)
8040c28c:	000e0593          	mv	a1,t3
8040c290:	01012a23          	sw	a6,20(sp)
8040c294:	eb9fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c298:	00a9a223          	sw	a0,4(s3)
8040c29c:	0169a423          	sw	s6,8(s3)
8040c2a0:	01412803          	lw	a6,20(sp)
8040c2a4:	00050463          	beqz	a0,8040c2ac <stride_dequeue+0x2e88>
8040c2a8:	01352023          	sw	s3,0(a0)
8040c2ac:	008c2b03          	lw	s6,8(s8)
8040c2b0:	86dfe06f          	j	8040ab1c <stride_dequeue+0x16f8>
8040c2b4:	0089a503          	lw	a0,8(s3)
8040c2b8:	0049ab03          	lw	s6,4(s3)
8040c2bc:	00030593          	mv	a1,t1
8040c2c0:	01012a23          	sw	a6,20(sp)
8040c2c4:	e89fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c2c8:	00a9a223          	sw	a0,4(s3)
8040c2cc:	0169a423          	sw	s6,8(s3)
8040c2d0:	01412803          	lw	a6,20(sp)
8040c2d4:	76050663          	beqz	a0,8040ca40 <stride_dequeue+0x361c>
8040c2d8:	01352023          	sw	s3,0(a0)
8040c2dc:	00098313          	mv	t1,s3
8040c2e0:	008c2b03          	lw	s6,8(s8)
8040c2e4:	ad0ff06f          	j	8040b5b4 <stride_dequeue+0x2190>
8040c2e8:	0089a503          	lw	a0,8(s3)
8040c2ec:	0049ab03          	lw	s6,4(s3)
8040c2f0:	000e0593          	mv	a1,t3
8040c2f4:	01112a23          	sw	a7,20(sp)
8040c2f8:	e55fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c2fc:	00a9a223          	sw	a0,4(s3)
8040c300:	0169a423          	sw	s6,8(s3)
8040c304:	01412883          	lw	a7,20(sp)
8040c308:	00050463          	beqz	a0,8040c310 <stride_dequeue+0x2eec>
8040c30c:	01352023          	sw	s3,0(a0)
8040c310:	008c2b03          	lw	s6,8(s8)
8040c314:	f30fe06f          	j	8040aa44 <stride_dequeue+0x1620>
8040c318:	008a2503          	lw	a0,8(s4)
8040c31c:	004a2b03          	lw	s6,4(s4)
8040c320:	00030593          	mv	a1,t1
8040c324:	e29fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c328:	00aa2223          	sw	a0,4(s4)
8040c32c:	016a2423          	sw	s6,8(s4)
8040c330:	00050463          	beqz	a0,8040c338 <stride_dequeue+0x2f14>
8040c334:	01452023          	sw	s4,0(a0)
8040c338:	008c2b03          	lw	s6,8(s8)
8040c33c:	e9dfd06f          	j	8040a1d8 <stride_dequeue+0xdb4>
8040c340:	0089a503          	lw	a0,8(s3)
8040c344:	0049ab03          	lw	s6,4(s3)
8040c348:	00088593          	mv	a1,a7
8040c34c:	00c12623          	sw	a2,12(sp)
8040c350:	dfdfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c354:	00a9a223          	sw	a0,4(s3)
8040c358:	0169a423          	sw	s6,8(s3)
8040c35c:	00c12603          	lw	a2,12(sp)
8040c360:	00050463          	beqz	a0,8040c368 <stride_dequeue+0x2f44>
8040c364:	01352023          	sw	s3,0(a0)
8040c368:	008c2b03          	lw	s6,8(s8)
8040c36c:	bd4fe06f          	j	8040a740 <stride_dequeue+0x131c>
8040c370:	0088a503          	lw	a0,8(a7)
8040c374:	000e0593          	mv	a1,t3
8040c378:	0048ab03          	lw	s6,4(a7)
8040c37c:	01112a23          	sw	a7,20(sp)
8040c380:	dcdfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c384:	01412883          	lw	a7,20(sp)
8040c388:	00a8a223          	sw	a0,4(a7)
8040c38c:	0168a423          	sw	s6,8(a7)
8040c390:	00050463          	beqz	a0,8040c398 <stride_dequeue+0x2f74>
8040c394:	01152023          	sw	a7,0(a0)
8040c398:	008c2b03          	lw	s6,8(s8)
8040c39c:	f51fd06f          	j	8040a2ec <stride_dequeue+0xec8>
8040c3a0:	0089a503          	lw	a0,8(s3)
8040c3a4:	0049ab03          	lw	s6,4(s3)
8040c3a8:	00030593          	mv	a1,t1
8040c3ac:	01112a23          	sw	a7,20(sp)
8040c3b0:	d9dfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c3b4:	00a9a223          	sw	a0,4(s3)
8040c3b8:	0169a423          	sw	s6,8(s3)
8040c3bc:	01412883          	lw	a7,20(sp)
8040c3c0:	5e050863          	beqz	a0,8040c9b0 <stride_dequeue+0x358c>
8040c3c4:	01352023          	sw	s3,0(a0)
8040c3c8:	00098313          	mv	t1,s3
8040c3cc:	008c2b03          	lw	s6,8(s8)
8040c3d0:	a64ff06f          	j	8040b634 <stride_dequeue+0x2210>
8040c3d4:	0089a503          	lw	a0,8(s3)
8040c3d8:	0049ab03          	lw	s6,4(s3)
8040c3dc:	000d8593          	mv	a1,s11
8040c3e0:	01112823          	sw	a7,16(sp)
8040c3e4:	d69fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c3e8:	00a9a223          	sw	a0,4(s3)
8040c3ec:	0169a423          	sw	s6,8(s3)
8040c3f0:	01012883          	lw	a7,16(sp)
8040c3f4:	00050463          	beqz	a0,8040c3fc <stride_dequeue+0x2fd8>
8040c3f8:	01352023          	sw	s3,0(a0)
8040c3fc:	008c2b03          	lw	s6,8(s8)
8040c400:	b19fe06f          	j	8040af18 <stride_dequeue+0x1af4>
8040c404:	00080993          	mv	s3,a6
8040c408:	cd1fe06f          	j	8040b0d8 <stride_dequeue+0x1cb4>
8040c40c:	000d8993          	mv	s3,s11
8040c410:	b09fe06f          	j	8040af18 <stride_dequeue+0x1af4>
8040c414:	00080993          	mv	s3,a6
8040c418:	d9dfe06f          	j	8040b1b4 <stride_dequeue+0x1d90>
8040c41c:	00080993          	mv	s3,a6
8040c420:	f75fe06f          	j	8040b394 <stride_dequeue+0x1f70>
8040c424:	00060993          	mv	s3,a2
8040c428:	e79fe06f          	j	8040b2a0 <stride_dequeue+0x1e7c>
8040c42c:	000a0993          	mv	s3,s4
8040c430:	bc9fe06f          	j	8040aff8 <stride_dequeue+0x1bd4>
8040c434:	008c2b03          	lw	s6,8(s8)
8040c438:	000e0c93          	mv	s9,t3
8040c43c:	f20fd06f          	j	80409b5c <stride_dequeue+0x738>
8040c440:	008c2b03          	lw	s6,8(s8)
8040c444:	000e0613          	mv	a2,t3
8040c448:	9ddfd06f          	j	80409e24 <stride_dequeue+0xa00>
8040c44c:	0087a503          	lw	a0,8(a5)
8040c450:	00098593          	mv	a1,s3
8040c454:	0047ab03          	lw	s6,4(a5)
8040c458:	cf5fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c45c:	01012783          	lw	a5,16(sp)
8040c460:	00a7a223          	sw	a0,4(a5)
8040c464:	0167a423          	sw	s6,8(a5)
8040c468:	68050663          	beqz	a0,8040caf4 <stride_dequeue+0x36d0>
8040c46c:	00f52023          	sw	a5,0(a0)
8040c470:	00078993          	mv	s3,a5
8040c474:	008c2b03          	lw	s6,8(s8)
8040c478:	ad4ff06f          	j	8040b74c <stride_dequeue+0x2328>
8040c47c:	008c2b03          	lw	s6,8(s8)
8040c480:	000e0a13          	mv	s4,t3
8040c484:	839fd06f          	j	80409cbc <stride_dequeue+0x898>
8040c488:	008c2b03          	lw	s6,8(s8)
8040c48c:	000e0993          	mv	s3,t3
8040c490:	f60fe06f          	j	8040abf0 <stride_dequeue+0x17cc>
8040c494:	008c2b03          	lw	s6,8(s8)
8040c498:	00098793          	mv	a5,s3
8040c49c:	8d9fe06f          	j	8040ad74 <stride_dequeue+0x1950>
8040c4a0:	008c2b03          	lw	s6,8(s8)
8040c4a4:	000e0993          	mv	s3,t3
8040c4a8:	e74fe06f          	j	8040ab1c <stride_dequeue+0x16f8>
8040c4ac:	0089a503          	lw	a0,8(s3)
8040c4b0:	0049ab03          	lw	s6,4(s3)
8040c4b4:	00088593          	mv	a1,a7
8040c4b8:	c95fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c4bc:	00a9a223          	sw	a0,4(s3)
8040c4c0:	0169a423          	sw	s6,8(s3)
8040c4c4:	00050463          	beqz	a0,8040c4cc <stride_dequeue+0x30a8>
8040c4c8:	01352023          	sw	s3,0(a0)
8040c4cc:	008c2b03          	lw	s6,8(s8)
8040c4d0:	955fe06f          	j	8040ae24 <stride_dequeue+0x1a00>
8040c4d4:	008c2b03          	lw	s6,8(s8)
8040c4d8:	000e0893          	mv	a7,t3
8040c4dc:	854fe06f          	j	8040a530 <stride_dequeue+0x110c>
8040c4e0:	0087a503          	lw	a0,8(a5)
8040c4e4:	000a0593          	mv	a1,s4
8040c4e8:	0047ab03          	lw	s6,4(a5)
8040c4ec:	c61fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c4f0:	00c12783          	lw	a5,12(sp)
8040c4f4:	01012603          	lw	a2,16(sp)
8040c4f8:	00a7a223          	sw	a0,4(a5)
8040c4fc:	0167a423          	sw	s6,8(a5)
8040c500:	52050a63          	beqz	a0,8040ca34 <stride_dequeue+0x3610>
8040c504:	00f52023          	sw	a5,0(a0)
8040c508:	00078a13          	mv	s4,a5
8040c50c:	008c2b03          	lw	s6,8(s8)
8040c510:	9d0ff06f          	j	8040b6e0 <stride_dequeue+0x22bc>
8040c514:	008c2b03          	lw	s6,8(s8)
8040c518:	000e0893          	mv	a7,t3
8040c51c:	dd1fd06f          	j	8040a2ec <stride_dequeue+0xec8>
8040c520:	008c2b03          	lw	s6,8(s8)
8040c524:	000e0993          	mv	s3,t3
8040c528:	d1cfe06f          	j	8040aa44 <stride_dequeue+0x1620>
8040c52c:	008c2b03          	lw	s6,8(s8)
8040c530:	000e0993          	mv	s3,t3
8040c534:	fa8fe06f          	j	8040acdc <stride_dequeue+0x18b8>
8040c538:	008c2b03          	lw	s6,8(s8)
8040c53c:	000e0893          	mv	a7,t3
8040c540:	ee1fd06f          	j	8040a420 <stride_dequeue+0xffc>
8040c544:	0087a503          	lw	a0,8(a5)
8040c548:	000c8593          	mv	a1,s9
8040c54c:	0047ab03          	lw	s6,4(a5)
8040c550:	bfdfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c554:	01012783          	lw	a5,16(sp)
8040c558:	00a7a223          	sw	a0,4(a5)
8040c55c:	0167a423          	sw	s6,8(a5)
8040c560:	44050e63          	beqz	a0,8040c9bc <stride_dequeue+0x3598>
8040c564:	00f52023          	sw	a5,0(a0)
8040c568:	00078c93          	mv	s9,a5
8040c56c:	008c2b03          	lw	s6,8(s8)
8040c570:	ab4ff06f          	j	8040b824 <stride_dequeue+0x2400>
8040c574:	0087a503          	lw	a0,8(a5)
8040c578:	000a0593          	mv	a1,s4
8040c57c:	0047ab03          	lw	s6,4(a5)
8040c580:	bcdfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c584:	01012783          	lw	a5,16(sp)
8040c588:	00a7a223          	sw	a0,4(a5)
8040c58c:	0167a423          	sw	s6,8(a5)
8040c590:	52050463          	beqz	a0,8040cab8 <stride_dequeue+0x3694>
8040c594:	00f52023          	sw	a5,0(a0)
8040c598:	00078a13          	mv	s4,a5
8040c59c:	008c2b03          	lw	s6,8(s8)
8040c5a0:	a18ff06f          	j	8040b7b8 <stride_dequeue+0x2394>
8040c5a4:	008c2b03          	lw	s6,8(s8)
8040c5a8:	00088993          	mv	s3,a7
8040c5ac:	879fe06f          	j	8040ae24 <stride_dequeue+0x1a00>
8040c5b0:	0089a503          	lw	a0,8(s3)
8040c5b4:	0049ab03          	lw	s6,4(s3)
8040c5b8:	000e0593          	mv	a1,t3
8040c5bc:	01012a23          	sw	a6,20(sp)
8040c5c0:	b8dfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c5c4:	00a9a223          	sw	a0,4(s3)
8040c5c8:	0169a423          	sw	s6,8(s3)
8040c5cc:	01412803          	lw	a6,20(sp)
8040c5d0:	00050463          	beqz	a0,8040c5d8 <stride_dequeue+0x31b4>
8040c5d4:	01352023          	sw	s3,0(a0)
8040c5d8:	008c2b03          	lw	s6,8(s8)
8040c5dc:	bc5fe06f          	j	8040b1a0 <stride_dequeue+0x1d7c>
8040c5e0:	00882503          	lw	a0,8(a6)
8040c5e4:	00098593          	mv	a1,s3
8040c5e8:	00482b03          	lw	s6,4(a6)
8040c5ec:	b61fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c5f0:	01412803          	lw	a6,20(sp)
8040c5f4:	01812883          	lw	a7,24(sp)
8040c5f8:	00a82223          	sw	a0,4(a6)
8040c5fc:	01682423          	sw	s6,8(a6)
8040c600:	4a050063          	beqz	a0,8040caa0 <stride_dequeue+0x367c>
8040c604:	01052023          	sw	a6,0(a0)
8040c608:	00080993          	mv	s3,a6
8040c60c:	008c2b03          	lw	s6,8(s8)
8040c610:	a9cff06f          	j	8040b8ac <stride_dequeue+0x2488>
8040c614:	0089a503          	lw	a0,8(s3)
8040c618:	0049ab03          	lw	s6,4(s3)
8040c61c:	000e0593          	mv	a1,t3
8040c620:	01112a23          	sw	a7,20(sp)
8040c624:	00c12823          	sw	a2,16(sp)
8040c628:	b25fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c62c:	00a9a223          	sw	a0,4(s3)
8040c630:	0169a423          	sw	s6,8(s3)
8040c634:	01012603          	lw	a2,16(sp)
8040c638:	01412883          	lw	a7,20(sp)
8040c63c:	00050463          	beqz	a0,8040c644 <stride_dequeue+0x3220>
8040c640:	01352023          	sw	s3,0(a0)
8040c644:	008c2b03          	lw	s6,8(s8)
8040c648:	c45fe06f          	j	8040b28c <stride_dequeue+0x1e68>
8040c64c:	0088a503          	lw	a0,8(a7)
8040c650:	00098593          	mv	a1,s3
8040c654:	0048ab03          	lw	s6,4(a7)
8040c658:	af5fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c65c:	01012883          	lw	a7,16(sp)
8040c660:	01412603          	lw	a2,20(sp)
8040c664:	01812803          	lw	a6,24(sp)
8040c668:	00a8a223          	sw	a0,4(a7)
8040c66c:	0168a423          	sw	s6,8(a7)
8040c670:	48050863          	beqz	a0,8040cb00 <stride_dequeue+0x36dc>
8040c674:	01152023          	sw	a7,0(a0)
8040c678:	00088993          	mv	s3,a7
8040c67c:	008c2b03          	lw	s6,8(s8)
8040c680:	bc0ff06f          	j	8040ba40 <stride_dequeue+0x261c>
8040c684:	00832503          	lw	a0,8(t1)
8040c688:	000c8593          	mv	a1,s9
8040c68c:	00432b03          	lw	s6,4(t1)
8040c690:	abdfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c694:	01412303          	lw	t1,20(sp)
8040c698:	01812883          	lw	a7,24(sp)
8040c69c:	00a32223          	sw	a0,4(t1)
8040c6a0:	01632423          	sw	s6,8(t1)
8040c6a4:	36050663          	beqz	a0,8040ca10 <stride_dequeue+0x35ec>
8040c6a8:	00652023          	sw	t1,0(a0)
8040c6ac:	00030c93          	mv	s9,t1
8040c6b0:	008c2b03          	lw	s6,8(s8)
8040c6b4:	e10ff06f          	j	8040bcc4 <stride_dequeue+0x28a0>
8040c6b8:	0089a503          	lw	a0,8(s3)
8040c6bc:	0049ab03          	lw	s6,4(s3)
8040c6c0:	000e0593          	mv	a1,t3
8040c6c4:	01112a23          	sw	a7,20(sp)
8040c6c8:	00c12823          	sw	a2,16(sp)
8040c6cc:	a81fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c6d0:	00a9a223          	sw	a0,4(s3)
8040c6d4:	0169a423          	sw	s6,8(s3)
8040c6d8:	01012603          	lw	a2,16(sp)
8040c6dc:	01412883          	lw	a7,20(sp)
8040c6e0:	00050463          	beqz	a0,8040c6e8 <stride_dequeue+0x32c4>
8040c6e4:	01352023          	sw	s3,0(a0)
8040c6e8:	008c2b03          	lw	s6,8(s8)
8040c6ec:	840fe06f          	j	8040a72c <stride_dequeue+0x1308>
8040c6f0:	0089a503          	lw	a0,8(s3)
8040c6f4:	0049ab03          	lw	s6,4(s3)
8040c6f8:	000e0593          	mv	a1,t3
8040c6fc:	01012a23          	sw	a6,20(sp)
8040c700:	00c12823          	sw	a2,16(sp)
8040c704:	a49fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c708:	00a9a223          	sw	a0,4(s3)
8040c70c:	0169a423          	sw	s6,8(s3)
8040c710:	01012603          	lw	a2,16(sp)
8040c714:	01412803          	lw	a6,20(sp)
8040c718:	00050463          	beqz	a0,8040c720 <stride_dequeue+0x32fc>
8040c71c:	01352023          	sw	s3,0(a0)
8040c720:	008c2b03          	lw	s6,8(s8)
8040c724:	c5dfe06f          	j	8040b380 <stride_dequeue+0x1f5c>
8040c728:	00832503          	lw	a0,8(t1)
8040c72c:	00080593          	mv	a1,a6
8040c730:	00432b03          	lw	s6,4(t1)
8040c734:	a19fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c738:	01412303          	lw	t1,20(sp)
8040c73c:	00a32223          	sw	a0,4(t1)
8040c740:	01632423          	sw	s6,8(t1)
8040c744:	2e050263          	beqz	a0,8040ca28 <stride_dequeue+0x3604>
8040c748:	00652023          	sw	t1,0(a0)
8040c74c:	00030813          	mv	a6,t1
8040c750:	008c2b03          	lw	s6,8(s8)
8040c754:	bf0ff06f          	j	8040bb44 <stride_dequeue+0x2720>
8040c758:	00832503          	lw	a0,8(t1)
8040c75c:	00080593          	mv	a1,a6
8040c760:	00432b03          	lw	s6,4(t1)
8040c764:	9e9fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c768:	01412303          	lw	t1,20(sp)
8040c76c:	00a32223          	sw	a0,4(t1)
8040c770:	01632423          	sw	s6,8(t1)
8040c774:	2e050263          	beqz	a0,8040ca58 <stride_dequeue+0x3634>
8040c778:	00652023          	sw	t1,0(a0)
8040c77c:	00030813          	mv	a6,t1
8040c780:	008c2b03          	lw	s6,8(s8)
8040c784:	b38ff06f          	j	8040babc <stride_dequeue+0x2698>
8040c788:	00882503          	lw	a0,8(a6)
8040c78c:	00098593          	mv	a1,s3
8040c790:	00482b03          	lw	s6,4(a6)
8040c794:	9b9fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c798:	01412803          	lw	a6,20(sp)
8040c79c:	01812883          	lw	a7,24(sp)
8040c7a0:	00a82223          	sw	a0,4(a6)
8040c7a4:	01682423          	sw	s6,8(a6)
8040c7a8:	22050663          	beqz	a0,8040c9d4 <stride_dequeue+0x35b0>
8040c7ac:	01052023          	sw	a6,0(a0)
8040c7b0:	00080993          	mv	s3,a6
8040c7b4:	008c2b03          	lw	s6,8(s8)
8040c7b8:	970ff06f          	j	8040b928 <stride_dequeue+0x2504>
8040c7bc:	00832503          	lw	a0,8(t1)
8040c7c0:	00080593          	mv	a1,a6
8040c7c4:	00432b03          	lw	s6,4(t1)
8040c7c8:	985fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c7cc:	01012303          	lw	t1,16(sp)
8040c7d0:	01412603          	lw	a2,20(sp)
8040c7d4:	00a32223          	sw	a0,4(t1)
8040c7d8:	01632423          	sw	s6,8(t1)
8040c7dc:	2e050a63          	beqz	a0,8040cad0 <stride_dequeue+0x36ac>
8040c7e0:	00652023          	sw	t1,0(a0)
8040c7e4:	00030813          	mv	a6,t1
8040c7e8:	008c2b03          	lw	s6,8(s8)
8040c7ec:	d70ff06f          	j	8040bd5c <stride_dequeue+0x2938>
8040c7f0:	008a2503          	lw	a0,8(s4)
8040c7f4:	004a2b03          	lw	s6,4(s4)
8040c7f8:	000e0593          	mv	a1,t3
8040c7fc:	00612a23          	sw	t1,20(sp)
8040c800:	94dfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c804:	00aa2223          	sw	a0,4(s4)
8040c808:	016a2423          	sw	s6,8(s4)
8040c80c:	01412303          	lw	t1,20(sp)
8040c810:	00050463          	beqz	a0,8040c818 <stride_dequeue+0x33f4>
8040c814:	01452023          	sw	s4,0(a0)
8040c818:	008c2b03          	lw	s6,8(s8)
8040c81c:	9a9fd06f          	j	8040a1c4 <stride_dequeue+0xda0>
8040c820:	0089a503          	lw	a0,8(s3)
8040c824:	0049ab03          	lw	s6,4(s3)
8040c828:	000e0593          	mv	a1,t3
8040c82c:	01112a23          	sw	a7,20(sp)
8040c830:	91dfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c834:	00a9a223          	sw	a0,4(s3)
8040c838:	0169a423          	sw	s6,8(s3)
8040c83c:	01412883          	lw	a7,20(sp)
8040c840:	00050463          	beqz	a0,8040c848 <stride_dequeue+0x3424>
8040c844:	01352023          	sw	s3,0(a0)
8040c848:	008c2b03          	lw	s6,8(s8)
8040c84c:	f98fe06f          	j	8040afe4 <stride_dequeue+0x1bc0>
8040c850:	0089a503          	lw	a0,8(s3)
8040c854:	0049ab03          	lw	s6,4(s3)
8040c858:	000e0593          	mv	a1,t3
8040c85c:	01012a23          	sw	a6,20(sp)
8040c860:	8edfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c864:	00a9a223          	sw	a0,4(s3)
8040c868:	0169a423          	sw	s6,8(s3)
8040c86c:	01412803          	lw	a6,20(sp)
8040c870:	00050463          	beqz	a0,8040c878 <stride_dequeue+0x3454>
8040c874:	01352023          	sw	s3,0(a0)
8040c878:	008c2b03          	lw	s6,8(s8)
8040c87c:	849fe06f          	j	8040b0c4 <stride_dequeue+0x1ca0>
8040c880:	0089a503          	lw	a0,8(s3)
8040c884:	0049ab03          	lw	s6,4(s3)
8040c888:	000e0593          	mv	a1,t3
8040c88c:	01112a23          	sw	a7,20(sp)
8040c890:	8bdfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c894:	00a9a223          	sw	a0,4(s3)
8040c898:	0169a423          	sw	s6,8(s3)
8040c89c:	01412883          	lw	a7,20(sp)
8040c8a0:	00050463          	beqz	a0,8040c8a8 <stride_dequeue+0x3484>
8040c8a4:	01352023          	sw	s3,0(a0)
8040c8a8:	008c2b03          	lw	s6,8(s8)
8040c8ac:	f99fd06f          	j	8040a844 <stride_dequeue+0x1420>
8040c8b0:	0088a503          	lw	a0,8(a7)
8040c8b4:	00098593          	mv	a1,s3
8040c8b8:	0048ab03          	lw	s6,4(a7)
8040c8bc:	891fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c8c0:	01412883          	lw	a7,20(sp)
8040c8c4:	01812803          	lw	a6,24(sp)
8040c8c8:	00a8a223          	sw	a0,4(a7)
8040c8cc:	0168a423          	sw	s6,8(a7)
8040c8d0:	0e050c63          	beqz	a0,8040c9c8 <stride_dequeue+0x35a4>
8040c8d4:	01152023          	sw	a7,0(a0)
8040c8d8:	00088993          	mv	s3,a7
8040c8dc:	008c2b03          	lw	s6,8(s8)
8040c8e0:	ae0ff06f          	j	8040bbc0 <stride_dequeue+0x279c>
8040c8e4:	00882503          	lw	a0,8(a6)
8040c8e8:	00098593          	mv	a1,s3
8040c8ec:	00482b03          	lw	s6,4(a6)
8040c8f0:	85dfc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c8f4:	01012803          	lw	a6,16(sp)
8040c8f8:	01412603          	lw	a2,20(sp)
8040c8fc:	01812883          	lw	a7,24(sp)
8040c900:	00a82223          	sw	a0,4(a6)
8040c904:	01682423          	sw	s6,8(a6)
8040c908:	16050463          	beqz	a0,8040ca70 <stride_dequeue+0x364c>
8040c90c:	01052023          	sw	a6,0(a0)
8040c910:	00080993          	mv	s3,a6
8040c914:	008c2b03          	lw	s6,8(s8)
8040c918:	89cff06f          	j	8040b9b4 <stride_dequeue+0x2590>
8040c91c:	0089a503          	lw	a0,8(s3)
8040c920:	0049ab03          	lw	s6,4(s3)
8040c924:	000e0593          	mv	a1,t3
8040c928:	01112a23          	sw	a7,20(sp)
8040c92c:	821fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c930:	00a9a223          	sw	a0,4(s3)
8040c934:	0169a423          	sw	s6,8(s3)
8040c938:	01412883          	lw	a7,20(sp)
8040c93c:	00050463          	beqz	a0,8040c944 <stride_dequeue+0x3520>
8040c940:	01352023          	sw	s3,0(a0)
8040c944:	008c2b03          	lw	s6,8(s8)
8040c948:	810fe06f          	j	8040a958 <stride_dequeue+0x1534>
8040c94c:	0089a503          	lw	a0,8(s3)
8040c950:	0049ab03          	lw	s6,4(s3)
8040c954:	000e0593          	mv	a1,t3
8040c958:	01112a23          	sw	a7,20(sp)
8040c95c:	ff0fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c960:	00a9a223          	sw	a0,4(s3)
8040c964:	0169a423          	sw	s6,8(s3)
8040c968:	01412883          	lw	a7,20(sp)
8040c96c:	00050463          	beqz	a0,8040c974 <stride_dequeue+0x3550>
8040c970:	01352023          	sw	s3,0(a0)
8040c974:	008c2b03          	lw	s6,8(s8)
8040c978:	d8cfe06f          	j	8040af04 <stride_dequeue+0x1ae0>
8040c97c:	0088a503          	lw	a0,8(a7)
8040c980:	00098593          	mv	a1,s3
8040c984:	0048ab03          	lw	s6,4(a7)
8040c988:	fc4fc0ef          	jal	ra,8040914c <skew_heap_merge.constprop.3>
8040c98c:	01412883          	lw	a7,20(sp)
8040c990:	01812803          	lw	a6,24(sp)
8040c994:	00a8a223          	sw	a0,4(a7)
8040c998:	0168a423          	sw	s6,8(a7)
8040c99c:	04050263          	beqz	a0,8040c9e0 <stride_dequeue+0x35bc>
8040c9a0:	01152023          	sw	a7,0(a0)
8040c9a4:	00088993          	mv	s3,a7
8040c9a8:	008c2b03          	lw	s6,8(s8)
8040c9ac:	a9cff06f          	j	8040bc48 <stride_dequeue+0x2824>
8040c9b0:	008c2b03          	lw	s6,8(s8)
8040c9b4:	00098313          	mv	t1,s3
8040c9b8:	c7dfe06f          	j	8040b634 <stride_dequeue+0x2210>
8040c9bc:	008c2b03          	lw	s6,8(s8)
8040c9c0:	00078c93          	mv	s9,a5
8040c9c4:	e61fe06f          	j	8040b824 <stride_dequeue+0x2400>
8040c9c8:	008c2b03          	lw	s6,8(s8)
8040c9cc:	00088993          	mv	s3,a7
8040c9d0:	9f0ff06f          	j	8040bbc0 <stride_dequeue+0x279c>
8040c9d4:	008c2b03          	lw	s6,8(s8)
8040c9d8:	00080993          	mv	s3,a6
8040c9dc:	f4dfe06f          	j	8040b928 <stride_dequeue+0x2504>
8040c9e0:	008c2b03          	lw	s6,8(s8)
8040c9e4:	00088993          	mv	s3,a7
8040c9e8:	a60ff06f          	j	8040bc48 <stride_dequeue+0x2824>
8040c9ec:	008c2b03          	lw	s6,8(s8)
8040c9f0:	000e0993          	mv	s3,t3
8040c9f4:	df0fe06f          	j	8040afe4 <stride_dequeue+0x1bc0>
8040c9f8:	008c2b03          	lw	s6,8(s8)
8040c9fc:	000e0993          	mv	s3,t3
8040ca00:	ec4fe06f          	j	8040b0c4 <stride_dequeue+0x1ca0>
8040ca04:	008c2b03          	lw	s6,8(s8)
8040ca08:	000e0993          	mv	s3,t3
8040ca0c:	d21fd06f          	j	8040a72c <stride_dequeue+0x1308>
8040ca10:	008c2b03          	lw	s6,8(s8)
8040ca14:	00030c93          	mv	s9,t1
8040ca18:	aacff06f          	j	8040bcc4 <stride_dequeue+0x28a0>
8040ca1c:	008c2b03          	lw	s6,8(s8)
8040ca20:	000e0993          	mv	s3,t3
8040ca24:	95dfe06f          	j	8040b380 <stride_dequeue+0x1f5c>
8040ca28:	008c2b03          	lw	s6,8(s8)
8040ca2c:	00030813          	mv	a6,t1
8040ca30:	914ff06f          	j	8040bb44 <stride_dequeue+0x2720>
8040ca34:	008c2b03          	lw	s6,8(s8)
8040ca38:	00078a13          	mv	s4,a5
8040ca3c:	ca5fe06f          	j	8040b6e0 <stride_dequeue+0x22bc>
8040ca40:	008c2b03          	lw	s6,8(s8)
8040ca44:	00098313          	mv	t1,s3
8040ca48:	b6dfe06f          	j	8040b5b4 <stride_dequeue+0x2190>
8040ca4c:	008c2b03          	lw	s6,8(s8)
8040ca50:	000e0993          	mv	s3,t3
8040ca54:	cb0fe06f          	j	8040af04 <stride_dequeue+0x1ae0>
8040ca58:	008c2b03          	lw	s6,8(s8)
8040ca5c:	00030813          	mv	a6,t1
8040ca60:	85cff06f          	j	8040babc <stride_dequeue+0x2698>
8040ca64:	008c2b03          	lw	s6,8(s8)
8040ca68:	000e0993          	mv	s3,t3
8040ca6c:	eedfd06f          	j	8040a958 <stride_dequeue+0x1534>
8040ca70:	008c2b03          	lw	s6,8(s8)
8040ca74:	00080993          	mv	s3,a6
8040ca78:	f3dfe06f          	j	8040b9b4 <stride_dequeue+0x2590>
8040ca7c:	008c2b03          	lw	s6,8(s8)
8040ca80:	00098313          	mv	t1,s3
8040ca84:	aadfe06f          	j	8040b530 <stride_dequeue+0x210c>
8040ca88:	008c2b03          	lw	s6,8(s8)
8040ca8c:	000e0993          	mv	s3,t3
8040ca90:	f10fe06f          	j	8040b1a0 <stride_dequeue+0x1d7c>
8040ca94:	008c2b03          	lw	s6,8(s8)
8040ca98:	000e0993          	mv	s3,t3
8040ca9c:	ff0fe06f          	j	8040b28c <stride_dequeue+0x1e68>
8040caa0:	008c2b03          	lw	s6,8(s8)
8040caa4:	00080993          	mv	s3,a6
8040caa8:	e05fe06f          	j	8040b8ac <stride_dequeue+0x2488>
8040caac:	008c2b03          	lw	s6,8(s8)
8040cab0:	000e0993          	mv	s3,t3
8040cab4:	d91fd06f          	j	8040a844 <stride_dequeue+0x1420>
8040cab8:	008c2b03          	lw	s6,8(s8)
8040cabc:	00078a13          	mv	s4,a5
8040cac0:	cf9fe06f          	j	8040b7b8 <stride_dequeue+0x2394>
8040cac4:	008c2b03          	lw	s6,8(s8)
8040cac8:	000e0a13          	mv	s4,t3
8040cacc:	ef8fd06f          	j	8040a1c4 <stride_dequeue+0xda0>
8040cad0:	008c2b03          	lw	s6,8(s8)
8040cad4:	00030813          	mv	a6,t1
8040cad8:	a84ff06f          	j	8040bd5c <stride_dequeue+0x2938>
8040cadc:	008c2b03          	lw	s6,8(s8)
8040cae0:	00098813          	mv	a6,s3
8040cae4:	931fe06f          	j	8040b414 <stride_dequeue+0x1ff0>
8040cae8:	008c2b03          	lw	s6,8(s8)
8040caec:	00098313          	mv	t1,s3
8040caf0:	9bdfe06f          	j	8040b4ac <stride_dequeue+0x2088>
8040caf4:	008c2b03          	lw	s6,8(s8)
8040caf8:	00078993          	mv	s3,a5
8040cafc:	c51fe06f          	j	8040b74c <stride_dequeue+0x2328>
8040cb00:	008c2b03          	lw	s6,8(s8)
8040cb04:	00088993          	mv	s3,a7
8040cb08:	f39fe06f          	j	8040ba40 <stride_dequeue+0x261c>

8040cb0c <sched_init>:
8040cb0c:	ff010113          	addi	sp,sp,-16
8040cb10:	0008c697          	auipc	a3,0x8c
8040cb14:	51068693          	addi	a3,a3,1296 # 80499020 <default_sched_class>
8040cb18:	00812423          	sw	s0,8(sp)
8040cb1c:	00112623          	sw	ra,12(sp)
8040cb20:	00090797          	auipc	a5,0x90
8040cb24:	ca478793          	addi	a5,a5,-860 # 8049c7c4 <timer_list>
8040cb28:	0046a603          	lw	a2,4(a3)
8040cb2c:	0008f717          	auipc	a4,0x8f
8040cb30:	c1c70713          	addi	a4,a4,-996 # 8049b748 <__rq>
8040cb34:	00f7a223          	sw	a5,4(a5)
8040cb38:	00f7a023          	sw	a5,0(a5)
8040cb3c:	00500793          	li	a5,5
8040cb40:	00090417          	auipc	s0,0x90
8040cb44:	c8040413          	addi	s0,s0,-896 # 8049c7c0 <sched_class>
8040cb48:	00f72623          	sw	a5,12(a4)
8040cb4c:	00070513          	mv	a0,a4
8040cb50:	00d42023          	sw	a3,0(s0)
8040cb54:	00090797          	auipc	a5,0x90
8040cb58:	c6e7a423          	sw	a4,-920(a5) # 8049c7bc <rq>
8040cb5c:	000600e7          	jalr	a2
8040cb60:	00042783          	lw	a5,0(s0)
8040cb64:	00812403          	lw	s0,8(sp)
8040cb68:	00c12083          	lw	ra,12(sp)
8040cb6c:	0007a583          	lw	a1,0(a5)
8040cb70:	00008517          	auipc	a0,0x8
8040cb74:	5ac50513          	addi	a0,a0,1452 # 8041511c <CSWTCH.69+0xbb4>
8040cb78:	01010113          	addi	sp,sp,16
8040cb7c:	e80f306f          	j	804001fc <cprintf>

8040cb80 <wakeup_proc>:
8040cb80:	00052703          	lw	a4,0(a0)
8040cb84:	fe010113          	addi	sp,sp,-32
8040cb88:	00112e23          	sw	ra,28(sp)
8040cb8c:	00812c23          	sw	s0,24(sp)
8040cb90:	00912a23          	sw	s1,20(sp)
8040cb94:	01212823          	sw	s2,16(sp)
8040cb98:	01312623          	sw	s3,12(sp)
8040cb9c:	00300793          	li	a5,3
8040cba0:	0ef70663          	beq	a4,a5,8040cc8c <wakeup_proc+0x10c>
8040cba4:	00050413          	mv	s0,a0
8040cba8:	100027f3          	csrr	a5,sstatus
8040cbac:	0027f793          	andi	a5,a5,2
8040cbb0:	00000493          	li	s1,0
8040cbb4:	0a079e63          	bnez	a5,8040cc70 <wakeup_proc+0xf0>
8040cbb8:	00200793          	li	a5,2
8040cbbc:	08f70c63          	beq	a4,a5,8040cc54 <wakeup_proc+0xd4>
8040cbc0:	00090917          	auipc	s2,0x90
8040cbc4:	bec90913          	addi	s2,s2,-1044 # 8049c7ac <current>
8040cbc8:	00092703          	lw	a4,0(s2)
8040cbcc:	0a042423          	sw	zero,168(s0)
8040cbd0:	00f42023          	sw	a5,0(s0)
8040cbd4:	04870263          	beq	a4,s0,8040cc18 <wakeup_proc+0x98>
8040cbd8:	00090997          	auipc	s3,0x90
8040cbdc:	bd898993          	addi	s3,s3,-1064 # 8049c7b0 <idleproc>
8040cbe0:	0009a783          	lw	a5,0(s3)
8040cbe4:	02f40a63          	beq	s0,a5,8040cc18 <wakeup_proc+0x98>
8040cbe8:	00090797          	auipc	a5,0x90
8040cbec:	bd878793          	addi	a5,a5,-1064 # 8049c7c0 <sched_class>
8040cbf0:	0007a783          	lw	a5,0(a5)
8040cbf4:	00090717          	auipc	a4,0x90
8040cbf8:	bc870713          	addi	a4,a4,-1080 # 8049c7bc <rq>
8040cbfc:	00072503          	lw	a0,0(a4)
8040cc00:	0087a783          	lw	a5,8(a5)
8040cc04:	00040593          	mv	a1,s0
8040cc08:	000780e7          	jalr	a5
8040cc0c:	00092783          	lw	a5,0(s2)
8040cc10:	0009a703          	lw	a4,0(s3)
8040cc14:	06e78663          	beq	a5,a4,8040cc80 <wakeup_proc+0x100>
8040cc18:	02049063          	bnez	s1,8040cc38 <wakeup_proc+0xb8>
8040cc1c:	01c12083          	lw	ra,28(sp)
8040cc20:	01812403          	lw	s0,24(sp)
8040cc24:	01412483          	lw	s1,20(sp)
8040cc28:	01012903          	lw	s2,16(sp)
8040cc2c:	00c12983          	lw	s3,12(sp)
8040cc30:	02010113          	addi	sp,sp,32
8040cc34:	00008067          	ret
8040cc38:	01812403          	lw	s0,24(sp)
8040cc3c:	01c12083          	lw	ra,28(sp)
8040cc40:	01412483          	lw	s1,20(sp)
8040cc44:	01012903          	lw	s2,16(sp)
8040cc48:	00c12983          	lw	s3,12(sp)
8040cc4c:	02010113          	addi	sp,sp,32
8040cc50:	860f406f          	j	80400cb0 <intr_enable>
8040cc54:	00008617          	auipc	a2,0x8
8040cc58:	51060613          	addi	a2,a2,1296 # 80415164 <CSWTCH.69+0xbfc>
8040cc5c:	04d00593          	li	a1,77
8040cc60:	00008517          	auipc	a0,0x8
8040cc64:	4ec50513          	addi	a0,a0,1260 # 8041514c <CSWTCH.69+0xbe4>
8040cc68:	a41f30ef          	jal	ra,804006a8 <__warn>
8040cc6c:	fadff06f          	j	8040cc18 <wakeup_proc+0x98>
8040cc70:	848f40ef          	jal	ra,80400cb8 <intr_disable>
8040cc74:	00042703          	lw	a4,0(s0)
8040cc78:	00100493          	li	s1,1
8040cc7c:	f3dff06f          	j	8040cbb8 <wakeup_proc+0x38>
8040cc80:	00100713          	li	a4,1
8040cc84:	00e7a823          	sw	a4,16(a5)
8040cc88:	f91ff06f          	j	8040cc18 <wakeup_proc+0x98>
8040cc8c:	00008697          	auipc	a3,0x8
8040cc90:	4a468693          	addi	a3,a3,1188 # 80415130 <CSWTCH.69+0xbc8>
8040cc94:	00006617          	auipc	a2,0x6
8040cc98:	49860613          	addi	a2,a2,1176 # 8041312c <commands+0x1f8>
8040cc9c:	03c00593          	li	a1,60
8040cca0:	00008517          	auipc	a0,0x8
8040cca4:	4ac50513          	addi	a0,a0,1196 # 8041514c <CSWTCH.69+0xbe4>
8040cca8:	97df30ef          	jal	ra,80400624 <__panic>

8040ccac <schedule>:
8040ccac:	fe010113          	addi	sp,sp,-32
8040ccb0:	00112e23          	sw	ra,28(sp)
8040ccb4:	00812c23          	sw	s0,24(sp)
8040ccb8:	00912a23          	sw	s1,20(sp)
8040ccbc:	01212823          	sw	s2,16(sp)
8040ccc0:	01312623          	sw	s3,12(sp)
8040ccc4:	01412423          	sw	s4,8(sp)
8040ccc8:	100027f3          	csrr	a5,sstatus
8040cccc:	0027f793          	andi	a5,a5,2
8040ccd0:	00000a13          	li	s4,0
8040ccd4:	0e079e63          	bnez	a5,8040cdd0 <schedule+0x124>
8040ccd8:	00090497          	auipc	s1,0x90
8040ccdc:	ad448493          	addi	s1,s1,-1324 # 8049c7ac <current>
8040cce0:	0004a583          	lw	a1,0(s1)
8040cce4:	00090997          	auipc	s3,0x90
8040cce8:	adc98993          	addi	s3,s3,-1316 # 8049c7c0 <sched_class>
8040ccec:	00090917          	auipc	s2,0x90
8040ccf0:	ad090913          	addi	s2,s2,-1328 # 8049c7bc <rq>
8040ccf4:	0005a683          	lw	a3,0(a1)
8040ccf8:	0005a823          	sw	zero,16(a1)
8040ccfc:	00200713          	li	a4,2
8040cd00:	0009a783          	lw	a5,0(s3)
8040cd04:	00092503          	lw	a0,0(s2)
8040cd08:	06e68463          	beq	a3,a4,8040cd70 <schedule+0xc4>
8040cd0c:	0107a783          	lw	a5,16(a5)
8040cd10:	000780e7          	jalr	a5
8040cd14:	00050413          	mv	s0,a0
8040cd18:	08050463          	beqz	a0,8040cda0 <schedule+0xf4>
8040cd1c:	0009a783          	lw	a5,0(s3)
8040cd20:	00092503          	lw	a0,0(s2)
8040cd24:	00040593          	mv	a1,s0
8040cd28:	00c7a783          	lw	a5,12(a5)
8040cd2c:	000780e7          	jalr	a5
8040cd30:	00842783          	lw	a5,8(s0)
8040cd34:	0004a703          	lw	a4,0(s1)
8040cd38:	00178793          	addi	a5,a5,1
8040cd3c:	00f42423          	sw	a5,8(s0)
8040cd40:	00870663          	beq	a4,s0,8040cd4c <schedule+0xa0>
8040cd44:	00040513          	mv	a0,s0
8040cd48:	e68fa0ef          	jal	ra,804073b0 <proc_run>
8040cd4c:	060a1263          	bnez	s4,8040cdb0 <schedule+0x104>
8040cd50:	01c12083          	lw	ra,28(sp)
8040cd54:	01812403          	lw	s0,24(sp)
8040cd58:	01412483          	lw	s1,20(sp)
8040cd5c:	01012903          	lw	s2,16(sp)
8040cd60:	00c12983          	lw	s3,12(sp)
8040cd64:	00812a03          	lw	s4,8(sp)
8040cd68:	02010113          	addi	sp,sp,32
8040cd6c:	00008067          	ret
8040cd70:	00090717          	auipc	a4,0x90
8040cd74:	a4070713          	addi	a4,a4,-1472 # 8049c7b0 <idleproc>
8040cd78:	00072703          	lw	a4,0(a4)
8040cd7c:	f8e588e3          	beq	a1,a4,8040cd0c <schedule+0x60>
8040cd80:	0087a783          	lw	a5,8(a5)
8040cd84:	000780e7          	jalr	a5
8040cd88:	0009a783          	lw	a5,0(s3)
8040cd8c:	00092503          	lw	a0,0(s2)
8040cd90:	0107a783          	lw	a5,16(a5)
8040cd94:	000780e7          	jalr	a5
8040cd98:	00050413          	mv	s0,a0
8040cd9c:	f80510e3          	bnez	a0,8040cd1c <schedule+0x70>
8040cda0:	00090797          	auipc	a5,0x90
8040cda4:	a1078793          	addi	a5,a5,-1520 # 8049c7b0 <idleproc>
8040cda8:	0007a403          	lw	s0,0(a5)
8040cdac:	f85ff06f          	j	8040cd30 <schedule+0x84>
8040cdb0:	01812403          	lw	s0,24(sp)
8040cdb4:	01c12083          	lw	ra,28(sp)
8040cdb8:	01412483          	lw	s1,20(sp)
8040cdbc:	01012903          	lw	s2,16(sp)
8040cdc0:	00c12983          	lw	s3,12(sp)
8040cdc4:	00812a03          	lw	s4,8(sp)
8040cdc8:	02010113          	addi	sp,sp,32
8040cdcc:	ee5f306f          	j	80400cb0 <intr_enable>
8040cdd0:	ee9f30ef          	jal	ra,80400cb8 <intr_disable>
8040cdd4:	00100a13          	li	s4,1
8040cdd8:	f01ff06f          	j	8040ccd8 <schedule+0x2c>

8040cddc <add_timer>:
8040cddc:	fe010113          	addi	sp,sp,-32
8040cde0:	00112e23          	sw	ra,28(sp)
8040cde4:	100027f3          	csrr	a5,sstatus
8040cde8:	0027f793          	andi	a5,a5,2
8040cdec:	00000813          	li	a6,0
8040cdf0:	0a079263          	bnez	a5,8040ce94 <add_timer+0xb8>
8040cdf4:	00052703          	lw	a4,0(a0)
8040cdf8:	0a070863          	beqz	a4,8040cea8 <add_timer+0xcc>
8040cdfc:	00452783          	lw	a5,4(a0)
8040ce00:	0a078463          	beqz	a5,8040cea8 <add_timer+0xcc>
8040ce04:	00c52783          	lw	a5,12(a0)
8040ce08:	00850593          	addi	a1,a0,8
8040ce0c:	0af59e63          	bne	a1,a5,8040cec8 <add_timer+0xec>
8040ce10:	00090617          	auipc	a2,0x90
8040ce14:	9b460613          	addi	a2,a2,-1612 # 8049c7c4 <timer_list>
8040ce18:	00462783          	lw	a5,4(a2)
8040ce1c:	00c79c63          	bne	a5,a2,8040ce34 <add_timer+0x58>
8040ce20:	0480006f          	j	8040ce68 <add_timer+0x8c>
8040ce24:	0047a783          	lw	a5,4(a5)
8040ce28:	40d70733          	sub	a4,a4,a3
8040ce2c:	00e52023          	sw	a4,0(a0)
8040ce30:	02c78c63          	beq	a5,a2,8040ce68 <add_timer+0x8c>
8040ce34:	ff87a683          	lw	a3,-8(a5)
8040ce38:	fed776e3          	bgeu	a4,a3,8040ce24 <add_timer+0x48>
8040ce3c:	40e68733          	sub	a4,a3,a4
8040ce40:	fee7ac23          	sw	a4,-8(a5)
8040ce44:	0007a703          	lw	a4,0(a5)
8040ce48:	00b7a023          	sw	a1,0(a5)
8040ce4c:	00b72223          	sw	a1,4(a4)
8040ce50:	00f52623          	sw	a5,12(a0)
8040ce54:	00e52423          	sw	a4,8(a0)
8040ce58:	02080863          	beqz	a6,8040ce88 <add_timer+0xac>
8040ce5c:	01c12083          	lw	ra,28(sp)
8040ce60:	02010113          	addi	sp,sp,32
8040ce64:	e4df306f          	j	80400cb0 <intr_enable>
8040ce68:	00090797          	auipc	a5,0x90
8040ce6c:	95c78793          	addi	a5,a5,-1700 # 8049c7c4 <timer_list>
8040ce70:	0007a703          	lw	a4,0(a5)
8040ce74:	00b7a023          	sw	a1,0(a5)
8040ce78:	00b72223          	sw	a1,4(a4)
8040ce7c:	00f52623          	sw	a5,12(a0)
8040ce80:	00e52423          	sw	a4,8(a0)
8040ce84:	fc081ce3          	bnez	a6,8040ce5c <add_timer+0x80>
8040ce88:	01c12083          	lw	ra,28(sp)
8040ce8c:	02010113          	addi	sp,sp,32
8040ce90:	00008067          	ret
8040ce94:	00a12623          	sw	a0,12(sp)
8040ce98:	e21f30ef          	jal	ra,80400cb8 <intr_disable>
8040ce9c:	00100813          	li	a6,1
8040cea0:	00c12503          	lw	a0,12(sp)
8040cea4:	f51ff06f          	j	8040cdf4 <add_timer+0x18>
8040cea8:	00008697          	auipc	a3,0x8
8040ceac:	1cc68693          	addi	a3,a3,460 # 80415074 <CSWTCH.69+0xb0c>
8040ceb0:	00006617          	auipc	a2,0x6
8040ceb4:	27c60613          	addi	a2,a2,636 # 8041312c <commands+0x1f8>
8040ceb8:	07000593          	li	a1,112
8040cebc:	00008517          	auipc	a0,0x8
8040cec0:	29050513          	addi	a0,a0,656 # 8041514c <CSWTCH.69+0xbe4>
8040cec4:	f60f30ef          	jal	ra,80400624 <__panic>
8040cec8:	00008697          	auipc	a3,0x8
8040cecc:	1d868693          	addi	a3,a3,472 # 804150a0 <CSWTCH.69+0xb38>
8040ced0:	00006617          	auipc	a2,0x6
8040ced4:	25c60613          	addi	a2,a2,604 # 8041312c <commands+0x1f8>
8040ced8:	07100593          	li	a1,113
8040cedc:	00008517          	auipc	a0,0x8
8040cee0:	27050513          	addi	a0,a0,624 # 8041514c <CSWTCH.69+0xbe4>
8040cee4:	f40f30ef          	jal	ra,80400624 <__panic>

8040cee8 <del_timer>:
8040cee8:	fe010113          	addi	sp,sp,-32
8040ceec:	00112e23          	sw	ra,28(sp)
8040cef0:	00812c23          	sw	s0,24(sp)
8040cef4:	100027f3          	csrr	a5,sstatus
8040cef8:	0027f793          	andi	a5,a5,2
8040cefc:	00850413          	addi	s0,a0,8
8040cf00:	06079c63          	bnez	a5,8040cf78 <del_timer+0x90>
8040cf04:	00c52783          	lw	a5,12(a0)
8040cf08:	06f40063          	beq	s0,a5,8040cf68 <del_timer+0x80>
8040cf0c:	00052683          	lw	a3,0(a0)
8040cf10:	00852703          	lw	a4,8(a0)
8040cf14:	04068263          	beqz	a3,8040cf58 <del_timer+0x70>
8040cf18:	00090617          	auipc	a2,0x90
8040cf1c:	8ac60613          	addi	a2,a2,-1876 # 8049c7c4 <timer_list>
8040cf20:	00000593          	li	a1,0
8040cf24:	02c78a63          	beq	a5,a2,8040cf58 <del_timer+0x70>
8040cf28:	ff87a603          	lw	a2,-8(a5)
8040cf2c:	00d606b3          	add	a3,a2,a3
8040cf30:	fed7ac23          	sw	a3,-8(a5)
8040cf34:	00f72223          	sw	a5,4(a4)
8040cf38:	00e7a023          	sw	a4,0(a5)
8040cf3c:	00852623          	sw	s0,12(a0)
8040cf40:	00852423          	sw	s0,8(a0)
8040cf44:	02058263          	beqz	a1,8040cf68 <del_timer+0x80>
8040cf48:	01812403          	lw	s0,24(sp)
8040cf4c:	01c12083          	lw	ra,28(sp)
8040cf50:	02010113          	addi	sp,sp,32
8040cf54:	d5df306f          	j	80400cb0 <intr_enable>
8040cf58:	00f72223          	sw	a5,4(a4)
8040cf5c:	00e7a023          	sw	a4,0(a5)
8040cf60:	00852623          	sw	s0,12(a0)
8040cf64:	00852423          	sw	s0,8(a0)
8040cf68:	01c12083          	lw	ra,28(sp)
8040cf6c:	01812403          	lw	s0,24(sp)
8040cf70:	02010113          	addi	sp,sp,32
8040cf74:	00008067          	ret
8040cf78:	00a12623          	sw	a0,12(sp)
8040cf7c:	d3df30ef          	jal	ra,80400cb8 <intr_disable>
8040cf80:	00c12503          	lw	a0,12(sp)
8040cf84:	00c52783          	lw	a5,12(a0)
8040cf88:	fc8780e3          	beq	a5,s0,8040cf48 <del_timer+0x60>
8040cf8c:	00052683          	lw	a3,0(a0)
8040cf90:	00852703          	lw	a4,8(a0)
8040cf94:	00068a63          	beqz	a3,8040cfa8 <del_timer+0xc0>
8040cf98:	00090617          	auipc	a2,0x90
8040cf9c:	82c60613          	addi	a2,a2,-2004 # 8049c7c4 <timer_list>
8040cfa0:	00100593          	li	a1,1
8040cfa4:	f8c792e3          	bne	a5,a2,8040cf28 <del_timer+0x40>
8040cfa8:	00f72223          	sw	a5,4(a4)
8040cfac:	00e7a023          	sw	a4,0(a5)
8040cfb0:	00852623          	sw	s0,12(a0)
8040cfb4:	00852423          	sw	s0,8(a0)
8040cfb8:	f91ff06f          	j	8040cf48 <del_timer+0x60>

8040cfbc <run_timer_list>:
8040cfbc:	fe010113          	addi	sp,sp,-32
8040cfc0:	00112e23          	sw	ra,28(sp)
8040cfc4:	00812c23          	sw	s0,24(sp)
8040cfc8:	00912a23          	sw	s1,20(sp)
8040cfcc:	01212823          	sw	s2,16(sp)
8040cfd0:	01312623          	sw	s3,12(sp)
8040cfd4:	01412423          	sw	s4,8(sp)
8040cfd8:	01512223          	sw	s5,4(sp)
8040cfdc:	01612023          	sw	s6,0(sp)
8040cfe0:	100027f3          	csrr	a5,sstatus
8040cfe4:	0027f793          	andi	a5,a5,2
8040cfe8:	00000b13          	li	s6,0
8040cfec:	12079c63          	bnez	a5,8040d124 <run_timer_list+0x168>
8040cff0:	0008f997          	auipc	s3,0x8f
8040cff4:	7d498993          	addi	s3,s3,2004 # 8049c7c4 <timer_list>
8040cff8:	0049a403          	lw	s0,4(s3)
8040cffc:	09340663          	beq	s0,s3,8040d088 <run_timer_list+0xcc>
8040d000:	ff842783          	lw	a5,-8(s0)
8040d004:	ff840913          	addi	s2,s0,-8
8040d008:	14078463          	beqz	a5,8040d150 <run_timer_list+0x194>
8040d00c:	fff78793          	addi	a5,a5,-1
8040d010:	fef42c23          	sw	a5,-8(s0)
8040d014:	06079a63          	bnez	a5,8040d088 <run_timer_list+0xcc>
8040d018:	00008a97          	auipc	s5,0x8
8040d01c:	0e4a8a93          	addi	s5,s5,228 # 804150fc <CSWTCH.69+0xb94>
8040d020:	00008a17          	auipc	s4,0x8
8040d024:	12ca0a13          	addi	s4,s4,300 # 8041514c <CSWTCH.69+0xbe4>
8040d028:	0280006f          	j	8040d050 <run_timer_list+0x94>
8040d02c:	1007d263          	bgez	a5,8040d130 <run_timer_list+0x174>
8040d030:	00048513          	mv	a0,s1
8040d034:	b4dff0ef          	jal	ra,8040cb80 <wakeup_proc>
8040d038:	00090513          	mv	a0,s2
8040d03c:	eadff0ef          	jal	ra,8040cee8 <del_timer>
8040d040:	05340463          	beq	s0,s3,8040d088 <run_timer_list+0xcc>
8040d044:	ff842783          	lw	a5,-8(s0)
8040d048:	ff840913          	addi	s2,s0,-8
8040d04c:	02079e63          	bnez	a5,8040d088 <run_timer_list+0xcc>
8040d050:	00492483          	lw	s1,4(s2)
8040d054:	00442403          	lw	s0,4(s0)
8040d058:	0a84a783          	lw	a5,168(s1)
8040d05c:	fc0798e3          	bnez	a5,8040d02c <run_timer_list+0x70>
8040d060:	0044a683          	lw	a3,4(s1)
8040d064:	000a8613          	mv	a2,s5
8040d068:	0a700593          	li	a1,167
8040d06c:	000a0513          	mv	a0,s4
8040d070:	e38f30ef          	jal	ra,804006a8 <__warn>
8040d074:	00048513          	mv	a0,s1
8040d078:	b09ff0ef          	jal	ra,8040cb80 <wakeup_proc>
8040d07c:	00090513          	mv	a0,s2
8040d080:	e69ff0ef          	jal	ra,8040cee8 <del_timer>
8040d084:	fd3410e3          	bne	s0,s3,8040d044 <run_timer_list+0x88>
8040d088:	0008f797          	auipc	a5,0x8f
8040d08c:	72478793          	addi	a5,a5,1828 # 8049c7ac <current>
8040d090:	0007a583          	lw	a1,0(a5)
8040d094:	0008f797          	auipc	a5,0x8f
8040d098:	71c78793          	addi	a5,a5,1820 # 8049c7b0 <idleproc>
8040d09c:	0007a783          	lw	a5,0(a5)
8040d0a0:	06f58c63          	beq	a1,a5,8040d118 <run_timer_list+0x15c>
8040d0a4:	0008f797          	auipc	a5,0x8f
8040d0a8:	71c78793          	addi	a5,a5,1820 # 8049c7c0 <sched_class>
8040d0ac:	0007a783          	lw	a5,0(a5)
8040d0b0:	0008f717          	auipc	a4,0x8f
8040d0b4:	70c70713          	addi	a4,a4,1804 # 8049c7bc <rq>
8040d0b8:	00072503          	lw	a0,0(a4)
8040d0bc:	0147a783          	lw	a5,20(a5)
8040d0c0:	000780e7          	jalr	a5
8040d0c4:	020b1663          	bnez	s6,8040d0f0 <run_timer_list+0x134>
8040d0c8:	01c12083          	lw	ra,28(sp)
8040d0cc:	01812403          	lw	s0,24(sp)
8040d0d0:	01412483          	lw	s1,20(sp)
8040d0d4:	01012903          	lw	s2,16(sp)
8040d0d8:	00c12983          	lw	s3,12(sp)
8040d0dc:	00812a03          	lw	s4,8(sp)
8040d0e0:	00412a83          	lw	s5,4(sp)
8040d0e4:	00012b03          	lw	s6,0(sp)
8040d0e8:	02010113          	addi	sp,sp,32
8040d0ec:	00008067          	ret
8040d0f0:	01812403          	lw	s0,24(sp)
8040d0f4:	01c12083          	lw	ra,28(sp)
8040d0f8:	01412483          	lw	s1,20(sp)
8040d0fc:	01012903          	lw	s2,16(sp)
8040d100:	00c12983          	lw	s3,12(sp)
8040d104:	00812a03          	lw	s4,8(sp)
8040d108:	00412a83          	lw	s5,4(sp)
8040d10c:	00012b03          	lw	s6,0(sp)
8040d110:	02010113          	addi	sp,sp,32
8040d114:	b9df306f          	j	80400cb0 <intr_enable>
8040d118:	00100793          	li	a5,1
8040d11c:	00f5a823          	sw	a5,16(a1)
8040d120:	fa5ff06f          	j	8040d0c4 <run_timer_list+0x108>
8040d124:	b95f30ef          	jal	ra,80400cb8 <intr_disable>
8040d128:	00100b13          	li	s6,1
8040d12c:	ec5ff06f          	j	8040cff0 <run_timer_list+0x34>
8040d130:	00008697          	auipc	a3,0x8
8040d134:	fa868693          	addi	a3,a3,-88 # 804150d8 <CSWTCH.69+0xb70>
8040d138:	00006617          	auipc	a2,0x6
8040d13c:	ff460613          	addi	a2,a2,-12 # 8041312c <commands+0x1f8>
8040d140:	0a400593          	li	a1,164
8040d144:	00008517          	auipc	a0,0x8
8040d148:	00850513          	addi	a0,a0,8 # 8041514c <CSWTCH.69+0xbe4>
8040d14c:	cd8f30ef          	jal	ra,80400624 <__panic>
8040d150:	00008697          	auipc	a3,0x8
8040d154:	f7468693          	addi	a3,a3,-140 # 804150c4 <CSWTCH.69+0xb5c>
8040d158:	00006617          	auipc	a2,0x6
8040d15c:	fd460613          	addi	a2,a2,-44 # 8041312c <commands+0x1f8>
8040d160:	09e00593          	li	a1,158
8040d164:	00008517          	auipc	a0,0x8
8040d168:	fe850513          	addi	a0,a0,-24 # 8041514c <CSWTCH.69+0xbe4>
8040d16c:	cb8f30ef          	jal	ra,80400624 <__panic>

8040d170 <sys_getpid>:
8040d170:	0008f797          	auipc	a5,0x8f
8040d174:	63c78793          	addi	a5,a5,1596 # 8049c7ac <current>
8040d178:	0007a783          	lw	a5,0(a5)
8040d17c:	0047a503          	lw	a0,4(a5)
8040d180:	00008067          	ret

8040d184 <sys_gettime>:
8040d184:	0008f797          	auipc	a5,0x8f
8040d188:	66878793          	addi	a5,a5,1640 # 8049c7ec <ticks>
8040d18c:	0007a503          	lw	a0,0(a5)
8040d190:	00008067          	ret

8040d194 <sys_lab6_set_priority>:
8040d194:	00052503          	lw	a0,0(a0)
8040d198:	ff010113          	addi	sp,sp,-16
8040d19c:	00112623          	sw	ra,12(sp)
8040d1a0:	d85fb0ef          	jal	ra,80408f24 <lab6_set_priority>
8040d1a4:	00c12083          	lw	ra,12(sp)
8040d1a8:	00000513          	li	a0,0
8040d1ac:	01010113          	addi	sp,sp,16
8040d1b0:	00008067          	ret

8040d1b4 <sys_dup>:
8040d1b4:	00452583          	lw	a1,4(a0)
8040d1b8:	00052503          	lw	a0,0(a0)
8040d1bc:	e4df906f          	j	80407008 <sysfile_dup>

8040d1c0 <sys_getdirentry>:
8040d1c0:	00452583          	lw	a1,4(a0)
8040d1c4:	00052503          	lw	a0,0(a0)
8040d1c8:	cc5f906f          	j	80406e8c <sysfile_getdirentry>

8040d1cc <sys_getcwd>:
8040d1cc:	00452583          	lw	a1,4(a0)
8040d1d0:	00052503          	lw	a0,0(a0)
8040d1d4:	bb5f906f          	j	80406d88 <sysfile_getcwd>

8040d1d8 <sys_fsync>:
8040d1d8:	00052503          	lw	a0,0(a0)
8040d1dc:	ba9f906f          	j	80406d84 <sysfile_fsync>

8040d1e0 <sys_fstat>:
8040d1e0:	00452583          	lw	a1,4(a0)
8040d1e4:	00052503          	lw	a0,0(a0)
8040d1e8:	aadf906f          	j	80406c94 <sysfile_fstat>

8040d1ec <sys_seek>:
8040d1ec:	00852603          	lw	a2,8(a0)
8040d1f0:	00452583          	lw	a1,4(a0)
8040d1f4:	00052503          	lw	a0,0(a0)
8040d1f8:	a99f906f          	j	80406c90 <sysfile_seek>

8040d1fc <sys_write>:
8040d1fc:	00852603          	lw	a2,8(a0)
8040d200:	00452583          	lw	a1,4(a0)
8040d204:	00052503          	lw	a0,0(a0)
8040d208:	8c5f906f          	j	80406acc <sysfile_write>

8040d20c <sys_read>:
8040d20c:	fe010113          	addi	sp,sp,-32
8040d210:	00812c23          	sw	s0,24(sp)
8040d214:	01212823          	sw	s2,16(sp)
8040d218:	00452403          	lw	s0,4(a0)
8040d21c:	00052903          	lw	s2,0(a0)
8040d220:	00852603          	lw	a2,8(a0)
8040d224:	00040593          	mv	a1,s0
8040d228:	00090513          	mv	a0,s2
8040d22c:	00912a23          	sw	s1,20(sp)
8040d230:	00112e23          	sw	ra,28(sp)
8040d234:	01312623          	sw	s3,12(sp)
8040d238:	01412423          	sw	s4,8(sp)
8040d23c:	ec8f90ef          	jal	ra,80406904 <sysfile_read>
8040d240:	00050493          	mv	s1,a0
8040d244:	00091463          	bnez	s2,8040d24c <sys_read+0x40>
8040d248:	02a04463          	bgtz	a0,8040d270 <sys_read+0x64>
8040d24c:	01c12083          	lw	ra,28(sp)
8040d250:	01812403          	lw	s0,24(sp)
8040d254:	00048513          	mv	a0,s1
8040d258:	01012903          	lw	s2,16(sp)
8040d25c:	01412483          	lw	s1,20(sp)
8040d260:	00c12983          	lw	s3,12(sp)
8040d264:	00812a03          	lw	s4,8(sp)
8040d268:	02010113          	addi	sp,sp,32
8040d26c:	00008067          	ret
8040d270:	00050593          	mv	a1,a0
8040d274:	00008517          	auipc	a0,0x8
8040d278:	00450513          	addi	a0,a0,4 # 80415278 <CSWTCH.69+0xd10>
8040d27c:	f81f20ef          	jal	ra,804001fc <cprintf>
8040d280:	0008f797          	auipc	a5,0x8f
8040d284:	52c78793          	addi	a5,a5,1324 # 8049c7ac <current>
8040d288:	0007a783          	lw	a5,0(a5)
8040d28c:	00000693          	li	a3,0
8040d290:	00048613          	mv	a2,s1
8040d294:	0187a503          	lw	a0,24(a5)
8040d298:	00040593          	mv	a1,s0
8040d29c:	b1df70ef          	jal	ra,80404db8 <user_mem_check>
8040d2a0:	04050263          	beqz	a0,8040d2e4 <sys_read+0xd8>
8040d2a4:	fff40913          	addi	s2,s0,-1
8040d2a8:	00990933          	add	s2,s2,s1
8040d2ac:	01040a13          	addi	s4,s0,16
8040d2b0:	00007997          	auipc	s3,0x7
8040d2b4:	b7498993          	addi	s3,s3,-1164 # 80413e24 <default_pmm_manager+0x1bc>
8040d2b8:	00c0006f          	j	8040d2c4 <sys_read+0xb8>
8040d2bc:	00140413          	addi	s0,s0,1
8040d2c0:	01440a63          	beq	s0,s4,8040d2d4 <sys_read+0xc8>
8040d2c4:	00044583          	lbu	a1,0(s0)
8040d2c8:	00098513          	mv	a0,s3
8040d2cc:	f31f20ef          	jal	ra,804001fc <cprintf>
8040d2d0:	fe8916e3          	bne	s2,s0,8040d2bc <sys_read+0xb0>
8040d2d4:	00006517          	auipc	a0,0x6
8040d2d8:	d1450513          	addi	a0,a0,-748 # 80412fe8 <commands+0xb4>
8040d2dc:	f21f20ef          	jal	ra,804001fc <cprintf>
8040d2e0:	f6dff06f          	j	8040d24c <sys_read+0x40>
8040d2e4:	00008517          	auipc	a0,0x8
8040d2e8:	fc450513          	addi	a0,a0,-60 # 804152a8 <CSWTCH.69+0xd40>
8040d2ec:	f11f20ef          	jal	ra,804001fc <cprintf>
8040d2f0:	fe5ff06f          	j	8040d2d4 <sys_read+0xc8>

8040d2f4 <sys_close>:
8040d2f4:	00052503          	lw	a0,0(a0)
8040d2f8:	e08f906f          	j	80406900 <sysfile_close>

8040d2fc <sys_open>:
8040d2fc:	00452583          	lw	a1,4(a0)
8040d300:	00052503          	lw	a0,0(a0)
8040d304:	da4f906f          	j	804068a8 <sysfile_open>

8040d308 <sys_pgdir>:
8040d308:	ff010113          	addi	sp,sp,-16
8040d30c:	00112623          	sw	ra,12(sp)
8040d310:	e0cf60ef          	jal	ra,8040391c <print_pgdir>
8040d314:	00c12083          	lw	ra,12(sp)
8040d318:	00000513          	li	a0,0
8040d31c:	01010113          	addi	sp,sp,16
8040d320:	00008067          	ret

8040d324 <sys_putc>:
8040d324:	00052503          	lw	a0,0(a0)
8040d328:	ff010113          	addi	sp,sp,-16
8040d32c:	00112623          	sw	ra,12(sp)
8040d330:	f2df20ef          	jal	ra,8040025c <cputchar>
8040d334:	00c12083          	lw	ra,12(sp)
8040d338:	00000513          	li	a0,0
8040d33c:	01010113          	addi	sp,sp,16
8040d340:	00008067          	ret

8040d344 <sys_kill>:
8040d344:	00052503          	lw	a0,0(a0)
8040d348:	94dfb06f          	j	80408c94 <do_kill>

8040d34c <sys_sleep>:
8040d34c:	00052503          	lw	a0,0(a0)
8040d350:	bf9fb06f          	j	80408f48 <do_sleep>

8040d354 <sys_yield>:
8040d354:	8b5fb06f          	j	80408c08 <do_yield>

8040d358 <sys_exec>:
8040d358:	fe010113          	addi	sp,sp,-32
8040d35c:	00912a23          	sw	s1,20(sp)
8040d360:	0008f497          	auipc	s1,0x8f
8040d364:	44c48493          	addi	s1,s1,1100 # 8049c7ac <current>
8040d368:	0004a703          	lw	a4,0(s1)
8040d36c:	00812c23          	sw	s0,24(sp)
8040d370:	01212823          	sw	s2,16(sp)
8040d374:	00052403          	lw	s0,0(a0)
8040d378:	00452903          	lw	s2,4(a0)
8040d37c:	00472583          	lw	a1,4(a4)
8040d380:	00050793          	mv	a5,a0
8040d384:	00040693          	mv	a3,s0
8040d388:	00090613          	mv	a2,s2
8040d38c:	00008517          	auipc	a0,0x8
8040d390:	df450513          	addi	a0,a0,-524 # 80415180 <CSWTCH.69+0xc18>
8040d394:	01412423          	sw	s4,8(sp)
8040d398:	01512223          	sw	s5,4(sp)
8040d39c:	00112e23          	sw	ra,28(sp)
8040d3a0:	01312623          	sw	s3,12(sp)
8040d3a4:	0087aa83          	lw	s5,8(a5)
8040d3a8:	e55f20ef          	jal	ra,804001fc <cprintf>
8040d3ac:	0004a783          	lw	a5,0(s1)
8040d3b0:	00000693          	li	a3,0
8040d3b4:	01000613          	li	a2,16
8040d3b8:	0187a503          	lw	a0,24(a5)
8040d3bc:	00040593          	mv	a1,s0
8040d3c0:	00040a13          	mv	s4,s0
8040d3c4:	9f5f70ef          	jal	ra,80404db8 <user_mem_check>
8040d3c8:	02051a63          	bnez	a0,8040d3fc <sys_exec+0xa4>
8040d3cc:	01812403          	lw	s0,24(sp)
8040d3d0:	01c12083          	lw	ra,28(sp)
8040d3d4:	01412483          	lw	s1,20(sp)
8040d3d8:	00c12983          	lw	s3,12(sp)
8040d3dc:	000a8613          	mv	a2,s5
8040d3e0:	00090593          	mv	a1,s2
8040d3e4:	00412a83          	lw	s5,4(sp)
8040d3e8:	01012903          	lw	s2,16(sp)
8040d3ec:	000a0513          	mv	a0,s4
8040d3f0:	00812a03          	lw	s4,8(sp)
8040d3f4:	02010113          	addi	sp,sp,32
8040d3f8:	d01fa06f          	j	804080f8 <do_execve>
8040d3fc:	00040593          	mv	a1,s0
8040d400:	00008517          	auipc	a0,0x8
8040d404:	db450513          	addi	a0,a0,-588 # 804151b4 <CSWTCH.69+0xc4c>
8040d408:	df5f20ef          	jal	ra,804001fc <cprintf>
8040d40c:	00008517          	auipc	a0,0x8
8040d410:	dc850513          	addi	a0,a0,-568 # 804151d4 <CSWTCH.69+0xc6c>
8040d414:	de9f20ef          	jal	ra,804001fc <cprintf>
8040d418:	01040993          	addi	s3,s0,16
8040d41c:	00007497          	auipc	s1,0x7
8040d420:	a0848493          	addi	s1,s1,-1528 # 80413e24 <default_pmm_manager+0x1bc>
8040d424:	00044783          	lbu	a5,0(s0)
8040d428:	00048513          	mv	a0,s1
8040d42c:	00140413          	addi	s0,s0,1
8040d430:	00078593          	mv	a1,a5
8040d434:	00078663          	beqz	a5,8040d440 <sys_exec+0xe8>
8040d438:	dc5f20ef          	jal	ra,804001fc <cprintf>
8040d43c:	fe8994e3          	bne	s3,s0,8040d424 <sys_exec+0xcc>
8040d440:	00006517          	auipc	a0,0x6
8040d444:	ba850513          	addi	a0,a0,-1112 # 80412fe8 <commands+0xb4>
8040d448:	db5f20ef          	jal	ra,804001fc <cprintf>
8040d44c:	f81ff06f          	j	8040d3cc <sys_exec+0x74>

8040d450 <sys_wait>:
8040d450:	ff010113          	addi	sp,sp,-16
8040d454:	00912223          	sw	s1,4(sp)
8040d458:	0008f497          	auipc	s1,0x8f
8040d45c:	35448493          	addi	s1,s1,852 # 8049c7ac <current>
8040d460:	0004a783          	lw	a5,0(s1)
8040d464:	00812423          	sw	s0,8(sp)
8040d468:	00052403          	lw	s0,0(a0)
8040d46c:	0047a583          	lw	a1,4(a5)
8040d470:	01212023          	sw	s2,0(sp)
8040d474:	00452903          	lw	s2,4(a0)
8040d478:	00040613          	mv	a2,s0
8040d47c:	00008517          	auipc	a0,0x8
8040d480:	e4050513          	addi	a0,a0,-448 # 804152bc <CSWTCH.69+0xd54>
8040d484:	00112623          	sw	ra,12(sp)
8040d488:	d75f20ef          	jal	ra,804001fc <cprintf>
8040d48c:	00090593          	mv	a1,s2
8040d490:	00040513          	mv	a0,s0
8040d494:	f90fb0ef          	jal	ra,80408c24 <do_wait>
8040d498:	0004a783          	lw	a5,0(s1)
8040d49c:	00050413          	mv	s0,a0
8040d4a0:	00050613          	mv	a2,a0
8040d4a4:	0047a583          	lw	a1,4(a5)
8040d4a8:	00008517          	auipc	a0,0x8
8040d4ac:	e4c50513          	addi	a0,a0,-436 # 804152f4 <CSWTCH.69+0xd8c>
8040d4b0:	d4df20ef          	jal	ra,804001fc <cprintf>
8040d4b4:	00040513          	mv	a0,s0
8040d4b8:	00c12083          	lw	ra,12(sp)
8040d4bc:	00812403          	lw	s0,8(sp)
8040d4c0:	00412483          	lw	s1,4(sp)
8040d4c4:	00012903          	lw	s2,0(sp)
8040d4c8:	01010113          	addi	sp,sp,16
8040d4cc:	00008067          	ret

8040d4d0 <sys_fork>:
8040d4d0:	ff010113          	addi	sp,sp,-16
8040d4d4:	00912223          	sw	s1,4(sp)
8040d4d8:	0008f497          	auipc	s1,0x8f
8040d4dc:	2d448493          	addi	s1,s1,724 # 8049c7ac <current>
8040d4e0:	0004a783          	lw	a5,0(s1)
8040d4e4:	00812423          	sw	s0,8(sp)
8040d4e8:	01212023          	sw	s2,0(sp)
8040d4ec:	0547a403          	lw	s0,84(a5)
8040d4f0:	0047a583          	lw	a1,4(a5)
8040d4f4:	00008517          	auipc	a0,0x8
8040d4f8:	d2c50513          	addi	a0,a0,-724 # 80415220 <CSWTCH.69+0xcb8>
8040d4fc:	00842903          	lw	s2,8(s0)
8040d500:	00112623          	sw	ra,12(sp)
8040d504:	cf9f20ef          	jal	ra,804001fc <cprintf>
8040d508:	00040613          	mv	a2,s0
8040d50c:	00090593          	mv	a1,s2
8040d510:	00000513          	li	a0,0
8040d514:	fc1f90ef          	jal	ra,804074d4 <do_fork>
8040d518:	0004a783          	lw	a5,0(s1)
8040d51c:	00050413          	mv	s0,a0
8040d520:	00050613          	mv	a2,a0
8040d524:	0047a583          	lw	a1,4(a5)
8040d528:	00008517          	auipc	a0,0x8
8040d52c:	d1c50513          	addi	a0,a0,-740 # 80415244 <CSWTCH.69+0xcdc>
8040d530:	ccdf20ef          	jal	ra,804001fc <cprintf>
8040d534:	00040513          	mv	a0,s0
8040d538:	00c12083          	lw	ra,12(sp)
8040d53c:	00812403          	lw	s0,8(sp)
8040d540:	00412483          	lw	s1,4(sp)
8040d544:	00012903          	lw	s2,0(sp)
8040d548:	01010113          	addi	sp,sp,16
8040d54c:	00008067          	ret

8040d550 <sys_exit>:
8040d550:	0008f797          	auipc	a5,0x8f
8040d554:	25c78793          	addi	a5,a5,604 # 8049c7ac <current>
8040d558:	0007a783          	lw	a5,0(a5)
8040d55c:	ff010113          	addi	sp,sp,-16
8040d560:	00812423          	sw	s0,8(sp)
8040d564:	00052403          	lw	s0,0(a0)
8040d568:	0047a583          	lw	a1,4(a5)
8040d56c:	00008517          	auipc	a0,0x8
8040d570:	c8850513          	addi	a0,a0,-888 # 804151f4 <CSWTCH.69+0xc8c>
8040d574:	00040613          	mv	a2,s0
8040d578:	00112623          	sw	ra,12(sp)
8040d57c:	c81f20ef          	jal	ra,804001fc <cprintf>
8040d580:	00040513          	mv	a0,s0
8040d584:	00812403          	lw	s0,8(sp)
8040d588:	00c12083          	lw	ra,12(sp)
8040d58c:	01010113          	addi	sp,sp,16
8040d590:	d4cfa06f          	j	80407adc <do_exit>

8040d594 <syscall>:
8040d594:	fd010113          	addi	sp,sp,-48
8040d598:	02912223          	sw	s1,36(sp)
8040d59c:	0008f497          	auipc	s1,0x8f
8040d5a0:	21048493          	addi	s1,s1,528 # 8049c7ac <current>
8040d5a4:	0004a703          	lw	a4,0(s1)
8040d5a8:	02812423          	sw	s0,40(sp)
8040d5ac:	03212023          	sw	s2,32(sp)
8040d5b0:	05472403          	lw	s0,84(a4)
8040d5b4:	02112623          	sw	ra,44(sp)
8040d5b8:	0ff00793          	li	a5,255
8040d5bc:	02842903          	lw	s2,40(s0)
8040d5c0:	0727e463          	bltu	a5,s2,8040d628 <syscall+0x94>
8040d5c4:	00291713          	slli	a4,s2,0x2
8040d5c8:	00008797          	auipc	a5,0x8
8040d5cc:	da078793          	addi	a5,a5,-608 # 80415368 <syscalls>
8040d5d0:	00e787b3          	add	a5,a5,a4
8040d5d4:	0007a783          	lw	a5,0(a5)
8040d5d8:	04078863          	beqz	a5,8040d628 <syscall+0x94>
8040d5dc:	02c42503          	lw	a0,44(s0)
8040d5e0:	03042583          	lw	a1,48(s0)
8040d5e4:	03442603          	lw	a2,52(s0)
8040d5e8:	03842683          	lw	a3,56(s0)
8040d5ec:	03c42703          	lw	a4,60(s0)
8040d5f0:	00a12623          	sw	a0,12(sp)
8040d5f4:	00b12823          	sw	a1,16(sp)
8040d5f8:	00c12a23          	sw	a2,20(sp)
8040d5fc:	00d12c23          	sw	a3,24(sp)
8040d600:	00e12e23          	sw	a4,28(sp)
8040d604:	00c10513          	addi	a0,sp,12
8040d608:	000780e7          	jalr	a5
8040d60c:	02a42423          	sw	a0,40(s0)
8040d610:	02c12083          	lw	ra,44(sp)
8040d614:	02812403          	lw	s0,40(sp)
8040d618:	02412483          	lw	s1,36(sp)
8040d61c:	02012903          	lw	s2,32(sp)
8040d620:	03010113          	addi	sp,sp,48
8040d624:	00008067          	ret
8040d628:	00040513          	mv	a0,s0
8040d62c:	abdf30ef          	jal	ra,804010e8 <print_trapframe>
8040d630:	0004a783          	lw	a5,0(s1)
8040d634:	00090693          	mv	a3,s2
8040d638:	00008617          	auipc	a2,0x8
8040d63c:	cec60613          	addi	a2,a2,-788 # 80415324 <CSWTCH.69+0xdbc>
8040d640:	0047a703          	lw	a4,4(a5)
8040d644:	0ea00593          	li	a1,234
8040d648:	06078793          	addi	a5,a5,96
8040d64c:	00008517          	auipc	a0,0x8
8040d650:	d0450513          	addi	a0,a0,-764 # 80415350 <CSWTCH.69+0xde8>
8040d654:	fd1f20ef          	jal	ra,80400624 <__panic>

8040d658 <swapfs_init>:
8040d658:	ff010113          	addi	sp,sp,-16
8040d65c:	00100513          	li	a0,1
8040d660:	00112623          	sw	ra,12(sp)
8040d664:	cb0f30ef          	jal	ra,80400b14 <ide_device_valid>
8040d668:	02050263          	beqz	a0,8040d68c <swapfs_init+0x34>
8040d66c:	00100513          	li	a0,1
8040d670:	cd8f30ef          	jal	ra,80400b48 <ide_device_size>
8040d674:	00c12083          	lw	ra,12(sp)
8040d678:	00355513          	srli	a0,a0,0x3
8040d67c:	0008f797          	auipc	a5,0x8f
8040d680:	20a7a223          	sw	a0,516(a5) # 8049c880 <max_swap_offset>
8040d684:	01010113          	addi	sp,sp,16
8040d688:	00008067          	ret
8040d68c:	00008617          	auipc	a2,0x8
8040d690:	0dc60613          	addi	a2,a2,220 # 80415768 <syscalls+0x400>
8040d694:	00d00593          	li	a1,13
8040d698:	00008517          	auipc	a0,0x8
8040d69c:	0ec50513          	addi	a0,a0,236 # 80415784 <syscalls+0x41c>
8040d6a0:	f85f20ef          	jal	ra,80400624 <__panic>

8040d6a4 <swapfs_read>:
8040d6a4:	ff010113          	addi	sp,sp,-16
8040d6a8:	00112623          	sw	ra,12(sp)
8040d6ac:	00855793          	srli	a5,a0,0x8
8040d6b0:	06078e63          	beqz	a5,8040d72c <swapfs_read+0x88>
8040d6b4:	0008f717          	auipc	a4,0x8f
8040d6b8:	1cc70713          	addi	a4,a4,460 # 8049c880 <max_swap_offset>
8040d6bc:	00072703          	lw	a4,0(a4)
8040d6c0:	06e7f663          	bgeu	a5,a4,8040d72c <swapfs_read+0x88>
8040d6c4:	0008f717          	auipc	a4,0x8f
8040d6c8:	14470713          	addi	a4,a4,324 # 8049c808 <pages>
8040d6cc:	00072603          	lw	a2,0(a4)
8040d6d0:	00009717          	auipc	a4,0x9
8040d6d4:	35470713          	addi	a4,a4,852 # 80416a24 <nbase>
8040d6d8:	40c58633          	sub	a2,a1,a2
8040d6dc:	00072583          	lw	a1,0(a4)
8040d6e0:	40565613          	srai	a2,a2,0x5
8040d6e4:	0008f717          	auipc	a4,0x8f
8040d6e8:	0b470713          	addi	a4,a4,180 # 8049c798 <npage>
8040d6ec:	00b60633          	add	a2,a2,a1
8040d6f0:	00072683          	lw	a3,0(a4)
8040d6f4:	00c61713          	slli	a4,a2,0xc
8040d6f8:	00c75713          	srli	a4,a4,0xc
8040d6fc:	00379593          	slli	a1,a5,0x3
8040d700:	00c61613          	slli	a2,a2,0xc
8040d704:	04d77263          	bgeu	a4,a3,8040d748 <swapfs_read+0xa4>
8040d708:	0008f797          	auipc	a5,0x8f
8040d70c:	0f878793          	addi	a5,a5,248 # 8049c800 <va_pa_offset>
8040d710:	0007a783          	lw	a5,0(a5)
8040d714:	00c12083          	lw	ra,12(sp)
8040d718:	00800693          	li	a3,8
8040d71c:	00f60633          	add	a2,a2,a5
8040d720:	00100513          	li	a0,1
8040d724:	01010113          	addi	sp,sp,16
8040d728:	c58f306f          	j	80400b80 <ide_read_secs>
8040d72c:	00050693          	mv	a3,a0
8040d730:	00008617          	auipc	a2,0x8
8040d734:	06c60613          	addi	a2,a2,108 # 8041579c <syscalls+0x434>
8040d738:	01400593          	li	a1,20
8040d73c:	00008517          	auipc	a0,0x8
8040d740:	04850513          	addi	a0,a0,72 # 80415784 <syscalls+0x41c>
8040d744:	ee1f20ef          	jal	ra,80400624 <__panic>
8040d748:	00060693          	mv	a3,a2
8040d74c:	06e00593          	li	a1,110
8040d750:	00006617          	auipc	a2,0x6
8040d754:	54860613          	addi	a2,a2,1352 # 80413c98 <default_pmm_manager+0x30>
8040d758:	00006517          	auipc	a0,0x6
8040d75c:	56450513          	addi	a0,a0,1380 # 80413cbc <default_pmm_manager+0x54>
8040d760:	ec5f20ef          	jal	ra,80400624 <__panic>

8040d764 <swapfs_write>:
8040d764:	ff010113          	addi	sp,sp,-16
8040d768:	00112623          	sw	ra,12(sp)
8040d76c:	00855793          	srli	a5,a0,0x8
8040d770:	06078e63          	beqz	a5,8040d7ec <swapfs_write+0x88>
8040d774:	0008f717          	auipc	a4,0x8f
8040d778:	10c70713          	addi	a4,a4,268 # 8049c880 <max_swap_offset>
8040d77c:	00072703          	lw	a4,0(a4)
8040d780:	06e7f663          	bgeu	a5,a4,8040d7ec <swapfs_write+0x88>
8040d784:	0008f717          	auipc	a4,0x8f
8040d788:	08470713          	addi	a4,a4,132 # 8049c808 <pages>
8040d78c:	00072603          	lw	a2,0(a4)
8040d790:	00009717          	auipc	a4,0x9
8040d794:	29470713          	addi	a4,a4,660 # 80416a24 <nbase>
8040d798:	40c58633          	sub	a2,a1,a2
8040d79c:	00072583          	lw	a1,0(a4)
8040d7a0:	40565613          	srai	a2,a2,0x5
8040d7a4:	0008f717          	auipc	a4,0x8f
8040d7a8:	ff470713          	addi	a4,a4,-12 # 8049c798 <npage>
8040d7ac:	00b60633          	add	a2,a2,a1
8040d7b0:	00072683          	lw	a3,0(a4)
8040d7b4:	00c61713          	slli	a4,a2,0xc
8040d7b8:	00c75713          	srli	a4,a4,0xc
8040d7bc:	00379593          	slli	a1,a5,0x3
8040d7c0:	00c61613          	slli	a2,a2,0xc
8040d7c4:	04d77263          	bgeu	a4,a3,8040d808 <swapfs_write+0xa4>
8040d7c8:	0008f797          	auipc	a5,0x8f
8040d7cc:	03878793          	addi	a5,a5,56 # 8049c800 <va_pa_offset>
8040d7d0:	0007a783          	lw	a5,0(a5)
8040d7d4:	00c12083          	lw	ra,12(sp)
8040d7d8:	00800693          	li	a3,8
8040d7dc:	00f60633          	add	a2,a2,a5
8040d7e0:	00100513          	li	a0,1
8040d7e4:	01010113          	addi	sp,sp,16
8040d7e8:	c30f306f          	j	80400c18 <ide_write_secs>
8040d7ec:	00050693          	mv	a3,a0
8040d7f0:	00008617          	auipc	a2,0x8
8040d7f4:	fac60613          	addi	a2,a2,-84 # 8041579c <syscalls+0x434>
8040d7f8:	01900593          	li	a1,25
8040d7fc:	00008517          	auipc	a0,0x8
8040d800:	f8850513          	addi	a0,a0,-120 # 80415784 <syscalls+0x41c>
8040d804:	e21f20ef          	jal	ra,80400624 <__panic>
8040d808:	00060693          	mv	a3,a2
8040d80c:	06e00593          	li	a1,110
8040d810:	00006617          	auipc	a2,0x6
8040d814:	48860613          	addi	a2,a2,1160 # 80413c98 <default_pmm_manager+0x30>
8040d818:	00006517          	auipc	a0,0x6
8040d81c:	4a450513          	addi	a0,a0,1188 # 80413cbc <default_pmm_manager+0x54>
8040d820:	e05f20ef          	jal	ra,80400624 <__panic>

8040d824 <__alloc_inode>:
8040d824:	ff010113          	addi	sp,sp,-16
8040d828:	00812423          	sw	s0,8(sp)
8040d82c:	00050413          	mv	s0,a0
8040d830:	04000513          	li	a0,64
8040d834:	00112623          	sw	ra,12(sp)
8040d838:	a54f50ef          	jal	ra,80402a8c <kmalloc>
8040d83c:	00050463          	beqz	a0,8040d844 <__alloc_inode+0x20>
8040d840:	02852623          	sw	s0,44(a0)
8040d844:	00c12083          	lw	ra,12(sp)
8040d848:	00812403          	lw	s0,8(sp)
8040d84c:	01010113          	addi	sp,sp,16
8040d850:	00008067          	ret

8040d854 <inode_init>:
8040d854:	00100793          	li	a5,1
8040d858:	02052a23          	sw	zero,52(a0)
8040d85c:	02b52e23          	sw	a1,60(a0)
8040d860:	02c52c23          	sw	a2,56(a0)
8040d864:	02f52823          	sw	a5,48(a0)
8040d868:	00008067          	ret

8040d86c <inode_kill>:
8040d86c:	03052703          	lw	a4,48(a0)
8040d870:	ff010113          	addi	sp,sp,-16
8040d874:	00112623          	sw	ra,12(sp)
8040d878:	00071c63          	bnez	a4,8040d890 <inode_kill+0x24>
8040d87c:	03452783          	lw	a5,52(a0)
8040d880:	02079863          	bnez	a5,8040d8b0 <inode_kill+0x44>
8040d884:	00c12083          	lw	ra,12(sp)
8040d888:	01010113          	addi	sp,sp,16
8040d88c:	b24f506f          	j	80402bb0 <kfree>
8040d890:	00008697          	auipc	a3,0x8
8040d894:	fe468693          	addi	a3,a3,-28 # 80415874 <syscalls+0x50c>
8040d898:	00006617          	auipc	a2,0x6
8040d89c:	89460613          	addi	a2,a2,-1900 # 8041312c <commands+0x1f8>
8040d8a0:	02900593          	li	a1,41
8040d8a4:	00008517          	auipc	a0,0x8
8040d8a8:	fec50513          	addi	a0,a0,-20 # 80415890 <syscalls+0x528>
8040d8ac:	d79f20ef          	jal	ra,80400624 <__panic>
8040d8b0:	00008697          	auipc	a3,0x8
8040d8b4:	ff468693          	addi	a3,a3,-12 # 804158a4 <syscalls+0x53c>
8040d8b8:	00006617          	auipc	a2,0x6
8040d8bc:	87460613          	addi	a2,a2,-1932 # 8041312c <commands+0x1f8>
8040d8c0:	02a00593          	li	a1,42
8040d8c4:	00008517          	auipc	a0,0x8
8040d8c8:	fcc50513          	addi	a0,a0,-52 # 80415890 <syscalls+0x528>
8040d8cc:	d59f20ef          	jal	ra,80400624 <__panic>

8040d8d0 <inode_ref_inc>:
8040d8d0:	03052783          	lw	a5,48(a0)
8040d8d4:	00178793          	addi	a5,a5,1
8040d8d8:	02f52823          	sw	a5,48(a0)
8040d8dc:	00078513          	mv	a0,a5
8040d8e0:	00008067          	ret

8040d8e4 <inode_open_inc>:
8040d8e4:	03452783          	lw	a5,52(a0)
8040d8e8:	00178793          	addi	a5,a5,1
8040d8ec:	02f52a23          	sw	a5,52(a0)
8040d8f0:	00078513          	mv	a0,a5
8040d8f4:	00008067          	ret

8040d8f8 <inode_check>:
8040d8f8:	ff010113          	addi	sp,sp,-16
8040d8fc:	00112623          	sw	ra,12(sp)
8040d900:	04050263          	beqz	a0,8040d944 <inode_check+0x4c>
8040d904:	03c52783          	lw	a5,60(a0)
8040d908:	02078e63          	beqz	a5,8040d944 <inode_check+0x4c>
8040d90c:	0007a703          	lw	a4,0(a5)
8040d910:	8c4ba7b7          	lui	a5,0x8c4ba
8040d914:	47678793          	addi	a5,a5,1142 # 8c4ba476 <end+0xc01dbba>
8040d918:	08f71663          	bne	a4,a5,8040d9a4 <inode_check+0xac>
8040d91c:	03052703          	lw	a4,48(a0)
8040d920:	03452783          	lw	a5,52(a0)
8040d924:	06f74063          	blt	a4,a5,8040d984 <inode_check+0x8c>
8040d928:	0407ce63          	bltz	a5,8040d984 <inode_check+0x8c>
8040d92c:	000106b7          	lui	a3,0x10
8040d930:	02d75a63          	bge	a4,a3,8040d964 <inode_check+0x6c>
8040d934:	02d7d863          	bge	a5,a3,8040d964 <inode_check+0x6c>
8040d938:	00c12083          	lw	ra,12(sp)
8040d93c:	01010113          	addi	sp,sp,16
8040d940:	00008067          	ret
8040d944:	00008697          	auipc	a3,0x8
8040d948:	e7868693          	addi	a3,a3,-392 # 804157bc <syscalls+0x454>
8040d94c:	00005617          	auipc	a2,0x5
8040d950:	7e060613          	addi	a2,a2,2016 # 8041312c <commands+0x1f8>
8040d954:	06e00593          	li	a1,110
8040d958:	00008517          	auipc	a0,0x8
8040d95c:	f3850513          	addi	a0,a0,-200 # 80415890 <syscalls+0x528>
8040d960:	cc5f20ef          	jal	ra,80400624 <__panic>
8040d964:	00008697          	auipc	a3,0x8
8040d968:	ed468693          	addi	a3,a3,-300 # 80415838 <syscalls+0x4d0>
8040d96c:	00005617          	auipc	a2,0x5
8040d970:	7c060613          	addi	a2,a2,1984 # 8041312c <commands+0x1f8>
8040d974:	07200593          	li	a1,114
8040d978:	00008517          	auipc	a0,0x8
8040d97c:	f1850513          	addi	a0,a0,-232 # 80415890 <syscalls+0x528>
8040d980:	ca5f20ef          	jal	ra,80400624 <__panic>
8040d984:	00008697          	auipc	a3,0x8
8040d988:	e8868693          	addi	a3,a3,-376 # 8041580c <syscalls+0x4a4>
8040d98c:	00005617          	auipc	a2,0x5
8040d990:	7a060613          	addi	a2,a2,1952 # 8041312c <commands+0x1f8>
8040d994:	07100593          	li	a1,113
8040d998:	00008517          	auipc	a0,0x8
8040d99c:	ef850513          	addi	a0,a0,-264 # 80415890 <syscalls+0x528>
8040d9a0:	c85f20ef          	jal	ra,80400624 <__panic>
8040d9a4:	00008697          	auipc	a3,0x8
8040d9a8:	e4068693          	addi	a3,a3,-448 # 804157e4 <syscalls+0x47c>
8040d9ac:	00005617          	auipc	a2,0x5
8040d9b0:	78060613          	addi	a2,a2,1920 # 8041312c <commands+0x1f8>
8040d9b4:	06f00593          	li	a1,111
8040d9b8:	00008517          	auipc	a0,0x8
8040d9bc:	ed850513          	addi	a0,a0,-296 # 80415890 <syscalls+0x528>
8040d9c0:	c65f20ef          	jal	ra,80400624 <__panic>

8040d9c4 <inode_ref_dec>:
8040d9c4:	ff010113          	addi	sp,sp,-16
8040d9c8:	00812423          	sw	s0,8(sp)
8040d9cc:	03052403          	lw	s0,48(a0)
8040d9d0:	00112623          	sw	ra,12(sp)
8040d9d4:	00912223          	sw	s1,4(sp)
8040d9d8:	01212023          	sw	s2,0(sp)
8040d9dc:	0a805663          	blez	s0,8040da88 <inode_ref_dec+0xc4>
8040d9e0:	fff40413          	addi	s0,s0,-1
8040d9e4:	02852823          	sw	s0,48(a0)
8040d9e8:	00050493          	mv	s1,a0
8040d9ec:	02041a63          	bnez	s0,8040da20 <inode_ref_dec+0x5c>
8040d9f0:	03c52783          	lw	a5,60(a0)
8040d9f4:	06078a63          	beqz	a5,8040da68 <inode_ref_dec+0xa4>
8040d9f8:	0247a903          	lw	s2,36(a5)
8040d9fc:	06090663          	beqz	s2,8040da68 <inode_ref_dec+0xa4>
8040da00:	00008597          	auipc	a1,0x8
8040da04:	fc058593          	addi	a1,a1,-64 # 804159c0 <syscalls+0x658>
8040da08:	ef1ff0ef          	jal	ra,8040d8f8 <inode_check>
8040da0c:	00048513          	mv	a0,s1
8040da10:	000900e7          	jalr	s2
8040da14:	00050663          	beqz	a0,8040da20 <inode_ref_dec+0x5c>
8040da18:	ff100793          	li	a5,-15
8040da1c:	02f51063          	bne	a0,a5,8040da3c <inode_ref_dec+0x78>
8040da20:	00040513          	mv	a0,s0
8040da24:	00c12083          	lw	ra,12(sp)
8040da28:	00812403          	lw	s0,8(sp)
8040da2c:	00412483          	lw	s1,4(sp)
8040da30:	00012903          	lw	s2,0(sp)
8040da34:	01010113          	addi	sp,sp,16
8040da38:	00008067          	ret
8040da3c:	00050593          	mv	a1,a0
8040da40:	00008517          	auipc	a0,0x8
8040da44:	f8850513          	addi	a0,a0,-120 # 804159c8 <syscalls+0x660>
8040da48:	fb4f20ef          	jal	ra,804001fc <cprintf>
8040da4c:	00040513          	mv	a0,s0
8040da50:	00c12083          	lw	ra,12(sp)
8040da54:	00812403          	lw	s0,8(sp)
8040da58:	00412483          	lw	s1,4(sp)
8040da5c:	00012903          	lw	s2,0(sp)
8040da60:	01010113          	addi	sp,sp,16
8040da64:	00008067          	ret
8040da68:	00008697          	auipc	a3,0x8
8040da6c:	f0868693          	addi	a3,a3,-248 # 80415970 <syscalls+0x608>
8040da70:	00005617          	auipc	a2,0x5
8040da74:	6bc60613          	addi	a2,a2,1724 # 8041312c <commands+0x1f8>
8040da78:	04400593          	li	a1,68
8040da7c:	00008517          	auipc	a0,0x8
8040da80:	e1450513          	addi	a0,a0,-492 # 80415890 <syscalls+0x528>
8040da84:	ba1f20ef          	jal	ra,80400624 <__panic>
8040da88:	00008697          	auipc	a3,0x8
8040da8c:	ecc68693          	addi	a3,a3,-308 # 80415954 <syscalls+0x5ec>
8040da90:	00005617          	auipc	a2,0x5
8040da94:	69c60613          	addi	a2,a2,1692 # 8041312c <commands+0x1f8>
8040da98:	03f00593          	li	a1,63
8040da9c:	00008517          	auipc	a0,0x8
8040daa0:	df450513          	addi	a0,a0,-524 # 80415890 <syscalls+0x528>
8040daa4:	b81f20ef          	jal	ra,80400624 <__panic>

8040daa8 <inode_open_dec>:
8040daa8:	ff010113          	addi	sp,sp,-16
8040daac:	00812423          	sw	s0,8(sp)
8040dab0:	03452403          	lw	s0,52(a0)
8040dab4:	00112623          	sw	ra,12(sp)
8040dab8:	00912223          	sw	s1,4(sp)
8040dabc:	01212023          	sw	s2,0(sp)
8040dac0:	0a805263          	blez	s0,8040db64 <inode_open_dec+0xbc>
8040dac4:	fff40413          	addi	s0,s0,-1
8040dac8:	02852a23          	sw	s0,52(a0)
8040dacc:	00050493          	mv	s1,a0
8040dad0:	02041663          	bnez	s0,8040dafc <inode_open_dec+0x54>
8040dad4:	03c52783          	lw	a5,60(a0)
8040dad8:	06078663          	beqz	a5,8040db44 <inode_open_dec+0x9c>
8040dadc:	0087a903          	lw	s2,8(a5)
8040dae0:	06090263          	beqz	s2,8040db44 <inode_open_dec+0x9c>
8040dae4:	00008597          	auipc	a1,0x8
8040dae8:	e4858593          	addi	a1,a1,-440 # 8041592c <syscalls+0x5c4>
8040daec:	e0dff0ef          	jal	ra,8040d8f8 <inode_check>
8040daf0:	00048513          	mv	a0,s1
8040daf4:	000900e7          	jalr	s2
8040daf8:	02051063          	bnez	a0,8040db18 <inode_open_dec+0x70>
8040dafc:	00040513          	mv	a0,s0
8040db00:	00c12083          	lw	ra,12(sp)
8040db04:	00812403          	lw	s0,8(sp)
8040db08:	00412483          	lw	s1,4(sp)
8040db0c:	00012903          	lw	s2,0(sp)
8040db10:	01010113          	addi	sp,sp,16
8040db14:	00008067          	ret
8040db18:	00050593          	mv	a1,a0
8040db1c:	00008517          	auipc	a0,0x8
8040db20:	e1850513          	addi	a0,a0,-488 # 80415934 <syscalls+0x5cc>
8040db24:	ed8f20ef          	jal	ra,804001fc <cprintf>
8040db28:	00040513          	mv	a0,s0
8040db2c:	00c12083          	lw	ra,12(sp)
8040db30:	00812403          	lw	s0,8(sp)
8040db34:	00412483          	lw	s1,4(sp)
8040db38:	00012903          	lw	s2,0(sp)
8040db3c:	01010113          	addi	sp,sp,16
8040db40:	00008067          	ret
8040db44:	00008697          	auipc	a3,0x8
8040db48:	d9868693          	addi	a3,a3,-616 # 804158dc <syscalls+0x574>
8040db4c:	00005617          	auipc	a2,0x5
8040db50:	5e060613          	addi	a2,a2,1504 # 8041312c <commands+0x1f8>
8040db54:	06100593          	li	a1,97
8040db58:	00008517          	auipc	a0,0x8
8040db5c:	d3850513          	addi	a0,a0,-712 # 80415890 <syscalls+0x528>
8040db60:	ac5f20ef          	jal	ra,80400624 <__panic>
8040db64:	00008697          	auipc	a3,0x8
8040db68:	d5c68693          	addi	a3,a3,-676 # 804158c0 <syscalls+0x558>
8040db6c:	00005617          	auipc	a2,0x5
8040db70:	5c060613          	addi	a2,a2,1472 # 8041312c <commands+0x1f8>
8040db74:	05c00593          	li	a1,92
8040db78:	00008517          	auipc	a0,0x8
8040db7c:	d1850513          	addi	a0,a0,-744 # 80415890 <syscalls+0x528>
8040db80:	aa5f20ef          	jal	ra,80400624 <__panic>

8040db84 <__alloc_fs>:
8040db84:	ff010113          	addi	sp,sp,-16
8040db88:	00812423          	sw	s0,8(sp)
8040db8c:	00050413          	mv	s0,a0
8040db90:	08000513          	li	a0,128
8040db94:	00112623          	sw	ra,12(sp)
8040db98:	ef5f40ef          	jal	ra,80402a8c <kmalloc>
8040db9c:	00050463          	beqz	a0,8040dba4 <__alloc_fs+0x20>
8040dba0:	06852623          	sw	s0,108(a0)
8040dba4:	00c12083          	lw	ra,12(sp)
8040dba8:	00812403          	lw	s0,8(sp)
8040dbac:	01010113          	addi	sp,sp,16
8040dbb0:	00008067          	ret

8040dbb4 <vfs_init>:
8040dbb4:	ff010113          	addi	sp,sp,-16
8040dbb8:	00100593          	li	a1,1
8040dbbc:	0008e517          	auipc	a0,0x8e
8040dbc0:	ba050513          	addi	a0,a0,-1120 # 8049b75c <bootfs_sem>
8040dbc4:	00112623          	sw	ra,12(sp)
8040dbc8:	e64f70ef          	jal	ra,8040522c <sem_init>
8040dbcc:	00c12083          	lw	ra,12(sp)
8040dbd0:	01010113          	addi	sp,sp,16
8040dbd4:	3900006f          	j	8040df64 <vfs_devlist_init>

8040dbd8 <vfs_set_bootfs>:
8040dbd8:	fe010113          	addi	sp,sp,-32
8040dbdc:	00812c23          	sw	s0,24(sp)
8040dbe0:	00112e23          	sw	ra,28(sp)
8040dbe4:	00912a23          	sw	s1,20(sp)
8040dbe8:	00012623          	sw	zero,12(sp)
8040dbec:	00050413          	mv	s0,a0
8040dbf0:	04050a63          	beqz	a0,8040dc44 <vfs_set_bootfs+0x6c>
8040dbf4:	03a00593          	li	a1,58
8040dbf8:	09c050ef          	jal	ra,80412c94 <strchr>
8040dbfc:	08050e63          	beqz	a0,8040dc98 <vfs_set_bootfs+0xc0>
8040dc00:	00154783          	lbu	a5,1(a0)
8040dc04:	08079a63          	bnez	a5,8040dc98 <vfs_set_bootfs+0xc0>
8040dc08:	00040513          	mv	a0,s0
8040dc0c:	509000ef          	jal	ra,8040e914 <vfs_chdir>
8040dc10:	00050413          	mv	s0,a0
8040dc14:	00050e63          	beqz	a0,8040dc30 <vfs_set_bootfs+0x58>
8040dc18:	00040513          	mv	a0,s0
8040dc1c:	01c12083          	lw	ra,28(sp)
8040dc20:	01812403          	lw	s0,24(sp)
8040dc24:	01412483          	lw	s1,20(sp)
8040dc28:	02010113          	addi	sp,sp,32
8040dc2c:	00008067          	ret
8040dc30:	00c10513          	addi	a0,sp,12
8040dc34:	375000ef          	jal	ra,8040e7a8 <vfs_get_curdir>
8040dc38:	00050413          	mv	s0,a0
8040dc3c:	fc051ee3          	bnez	a0,8040dc18 <vfs_set_bootfs+0x40>
8040dc40:	00c12403          	lw	s0,12(sp)
8040dc44:	0008e517          	auipc	a0,0x8e
8040dc48:	b1850513          	addi	a0,a0,-1256 # 8049b75c <bootfs_sem>
8040dc4c:	df0f70ef          	jal	ra,8040523c <down>
8040dc50:	0008f797          	auipc	a5,0x8f
8040dc54:	b7c78793          	addi	a5,a5,-1156 # 8049c7cc <bootfs_node>
8040dc58:	0007a483          	lw	s1,0(a5)
8040dc5c:	0008e517          	auipc	a0,0x8e
8040dc60:	b0050513          	addi	a0,a0,-1280 # 8049b75c <bootfs_sem>
8040dc64:	0008f797          	auipc	a5,0x8f
8040dc68:	b687a423          	sw	s0,-1176(a5) # 8049c7cc <bootfs_node>
8040dc6c:	00000413          	li	s0,0
8040dc70:	dc8f70ef          	jal	ra,80405238 <up>
8040dc74:	fa0482e3          	beqz	s1,8040dc18 <vfs_set_bootfs+0x40>
8040dc78:	00048513          	mv	a0,s1
8040dc7c:	d49ff0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040dc80:	00040513          	mv	a0,s0
8040dc84:	01c12083          	lw	ra,28(sp)
8040dc88:	01812403          	lw	s0,24(sp)
8040dc8c:	01412483          	lw	s1,20(sp)
8040dc90:	02010113          	addi	sp,sp,32
8040dc94:	00008067          	ret
8040dc98:	ffd00413          	li	s0,-3
8040dc9c:	f7dff06f          	j	8040dc18 <vfs_set_bootfs+0x40>

8040dca0 <vfs_get_bootfs>:
8040dca0:	ff010113          	addi	sp,sp,-16
8040dca4:	00912223          	sw	s1,4(sp)
8040dca8:	0008f497          	auipc	s1,0x8f
8040dcac:	b2448493          	addi	s1,s1,-1244 # 8049c7cc <bootfs_node>
8040dcb0:	0004a783          	lw	a5,0(s1)
8040dcb4:	00112623          	sw	ra,12(sp)
8040dcb8:	00812423          	sw	s0,8(sp)
8040dcbc:	04078c63          	beqz	a5,8040dd14 <vfs_get_bootfs+0x74>
8040dcc0:	00050413          	mv	s0,a0
8040dcc4:	0008e517          	auipc	a0,0x8e
8040dcc8:	a9850513          	addi	a0,a0,-1384 # 8049b75c <bootfs_sem>
8040dccc:	d70f70ef          	jal	ra,8040523c <down>
8040dcd0:	0004a483          	lw	s1,0(s1)
8040dcd4:	02048a63          	beqz	s1,8040dd08 <vfs_get_bootfs+0x68>
8040dcd8:	00048513          	mv	a0,s1
8040dcdc:	bf5ff0ef          	jal	ra,8040d8d0 <inode_ref_inc>
8040dce0:	0008e517          	auipc	a0,0x8e
8040dce4:	a7c50513          	addi	a0,a0,-1412 # 8049b75c <bootfs_sem>
8040dce8:	d50f70ef          	jal	ra,80405238 <up>
8040dcec:	00000513          	li	a0,0
8040dcf0:	00942023          	sw	s1,0(s0)
8040dcf4:	00c12083          	lw	ra,12(sp)
8040dcf8:	00812403          	lw	s0,8(sp)
8040dcfc:	00412483          	lw	s1,4(sp)
8040dd00:	01010113          	addi	sp,sp,16
8040dd04:	00008067          	ret
8040dd08:	0008e517          	auipc	a0,0x8e
8040dd0c:	a5450513          	addi	a0,a0,-1452 # 8049b75c <bootfs_sem>
8040dd10:	d28f70ef          	jal	ra,80405238 <up>
8040dd14:	ff000513          	li	a0,-16
8040dd18:	fddff06f          	j	8040dcf4 <vfs_get_bootfs+0x54>

8040dd1c <vfs_do_add>:
8040dd1c:	fe010113          	addi	sp,sp,-32
8040dd20:	00112e23          	sw	ra,28(sp)
8040dd24:	00812c23          	sw	s0,24(sp)
8040dd28:	00912a23          	sw	s1,20(sp)
8040dd2c:	01212823          	sw	s2,16(sp)
8040dd30:	01312623          	sw	s3,12(sp)
8040dd34:	01412423          	sw	s4,8(sp)
8040dd38:	01512223          	sw	s5,4(sp)
8040dd3c:	01612023          	sw	s6,0(sp)
8040dd40:	14050863          	beqz	a0,8040de90 <vfs_do_add+0x174>
8040dd44:	00050413          	mv	s0,a0
8040dd48:	00058a13          	mv	s4,a1
8040dd4c:	00060b13          	mv	s6,a2
8040dd50:	00068a93          	mv	s5,a3
8040dd54:	0e058663          	beqz	a1,8040de40 <vfs_do_add+0x124>
8040dd58:	02c5a703          	lw	a4,44(a1)
8040dd5c:	000017b7          	lui	a5,0x1
8040dd60:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040dd64:	0ef71063          	bne	a4,a5,8040de44 <vfs_do_add+0x128>
8040dd68:	00040513          	mv	a0,s0
8040dd6c:	671040ef          	jal	ra,80412bdc <strlen>
8040dd70:	01f00793          	li	a5,31
8040dd74:	10a7e663          	bltu	a5,a0,8040de80 <vfs_do_add+0x164>
8040dd78:	00040513          	mv	a0,s0
8040dd7c:	d00f20ef          	jal	ra,8040027c <strdup>
8040dd80:	00050493          	mv	s1,a0
8040dd84:	10050263          	beqz	a0,8040de88 <vfs_do_add+0x16c>
8040dd88:	01800513          	li	a0,24
8040dd8c:	d01f40ef          	jal	ra,80402a8c <kmalloc>
8040dd90:	00050993          	mv	s3,a0
8040dd94:	08050e63          	beqz	a0,8040de30 <vfs_do_add+0x114>
8040dd98:	0008e517          	auipc	a0,0x8e
8040dd9c:	9d050513          	addi	a0,a0,-1584 # 8049b768 <vdev_list_sem>
8040dda0:	0008f917          	auipc	s2,0x8f
8040dda4:	a3090913          	addi	s2,s2,-1488 # 8049c7d0 <vdev_list>
8040dda8:	c94f70ef          	jal	ra,8040523c <down>
8040ddac:	00090413          	mv	s0,s2
8040ddb0:	0140006f          	j	8040ddc4 <vfs_do_add+0xa8>
8040ddb4:	ff042503          	lw	a0,-16(s0)
8040ddb8:	00048593          	mv	a1,s1
8040ddbc:	6a9040ef          	jal	ra,80412c64 <strcmp>
8040ddc0:	0a050263          	beqz	a0,8040de64 <vfs_do_add+0x148>
8040ddc4:	00442403          	lw	s0,4(s0)
8040ddc8:	ff2416e3          	bne	s0,s2,8040ddb4 <vfs_do_add+0x98>
8040ddcc:	00442703          	lw	a4,4(s0)
8040ddd0:	01098793          	addi	a5,s3,16
8040ddd4:	0099a023          	sw	s1,0(s3)
8040ddd8:	0149a223          	sw	s4,4(s3)
8040dddc:	0159a623          	sw	s5,12(s3)
8040dde0:	0169a423          	sw	s6,8(s3)
8040dde4:	00f72023          	sw	a5,0(a4)
8040dde8:	0089a823          	sw	s0,16(s3)
8040ddec:	00e9aa23          	sw	a4,20(s3)
8040ddf0:	0008e517          	auipc	a0,0x8e
8040ddf4:	97850513          	addi	a0,a0,-1672 # 8049b768 <vdev_list_sem>
8040ddf8:	00f42223          	sw	a5,4(s0)
8040ddfc:	00000413          	li	s0,0
8040de00:	c38f70ef          	jal	ra,80405238 <up>
8040de04:	00040513          	mv	a0,s0
8040de08:	01c12083          	lw	ra,28(sp)
8040de0c:	01812403          	lw	s0,24(sp)
8040de10:	01412483          	lw	s1,20(sp)
8040de14:	01012903          	lw	s2,16(sp)
8040de18:	00c12983          	lw	s3,12(sp)
8040de1c:	00812a03          	lw	s4,8(sp)
8040de20:	00412a83          	lw	s5,4(sp)
8040de24:	00012b03          	lw	s6,0(sp)
8040de28:	02010113          	addi	sp,sp,32
8040de2c:	00008067          	ret
8040de30:	ffc00413          	li	s0,-4
8040de34:	00048513          	mv	a0,s1
8040de38:	d79f40ef          	jal	ra,80402bb0 <kfree>
8040de3c:	fc9ff06f          	j	8040de04 <vfs_do_add+0xe8>
8040de40:	f20684e3          	beqz	a3,8040dd68 <vfs_do_add+0x4c>
8040de44:	00008697          	auipc	a3,0x8
8040de48:	bcc68693          	addi	a3,a3,-1076 # 80415a10 <syscalls+0x6a8>
8040de4c:	00005617          	auipc	a2,0x5
8040de50:	2e060613          	addi	a2,a2,736 # 8041312c <commands+0x1f8>
8040de54:	08f00593          	li	a1,143
8040de58:	00008517          	auipc	a0,0x8
8040de5c:	ba050513          	addi	a0,a0,-1120 # 804159f8 <syscalls+0x690>
8040de60:	fc4f20ef          	jal	ra,80400624 <__panic>
8040de64:	0008e517          	auipc	a0,0x8e
8040de68:	90450513          	addi	a0,a0,-1788 # 8049b768 <vdev_list_sem>
8040de6c:	bccf70ef          	jal	ra,80405238 <up>
8040de70:	00098513          	mv	a0,s3
8040de74:	d3df40ef          	jal	ra,80402bb0 <kfree>
8040de78:	fe900413          	li	s0,-23
8040de7c:	fb9ff06f          	j	8040de34 <vfs_do_add+0x118>
8040de80:	ff400413          	li	s0,-12
8040de84:	f81ff06f          	j	8040de04 <vfs_do_add+0xe8>
8040de88:	ffc00413          	li	s0,-4
8040de8c:	f79ff06f          	j	8040de04 <vfs_do_add+0xe8>
8040de90:	00008697          	auipc	a3,0x8
8040de94:	b5868693          	addi	a3,a3,-1192 # 804159e8 <syscalls+0x680>
8040de98:	00005617          	auipc	a2,0x5
8040de9c:	29460613          	addi	a2,a2,660 # 8041312c <commands+0x1f8>
8040dea0:	08e00593          	li	a1,142
8040dea4:	00008517          	auipc	a0,0x8
8040dea8:	b5450513          	addi	a0,a0,-1196 # 804159f8 <syscalls+0x690>
8040deac:	f78f20ef          	jal	ra,80400624 <__panic>

8040deb0 <find_mount>:
8040deb0:	fe010113          	addi	sp,sp,-32
8040deb4:	00812c23          	sw	s0,24(sp)
8040deb8:	00912a23          	sw	s1,20(sp)
8040debc:	01212823          	sw	s2,16(sp)
8040dec0:	01312623          	sw	s3,12(sp)
8040dec4:	0008f497          	auipc	s1,0x8f
8040dec8:	90c48493          	addi	s1,s1,-1780 # 8049c7d0 <vdev_list>
8040decc:	00112e23          	sw	ra,28(sp)
8040ded0:	00050913          	mv	s2,a0
8040ded4:	00058993          	mv	s3,a1
8040ded8:	00048413          	mv	s0,s1
8040dedc:	06050463          	beqz	a0,8040df44 <find_mount+0x94>
8040dee0:	00442403          	lw	s0,4(s0)
8040dee4:	04940063          	beq	s0,s1,8040df24 <find_mount+0x74>
8040dee8:	ffc42783          	lw	a5,-4(s0)
8040deec:	fe078ae3          	beqz	a5,8040dee0 <find_mount+0x30>
8040def0:	ff042503          	lw	a0,-16(s0)
8040def4:	00090593          	mv	a1,s2
8040def8:	56d040ef          	jal	ra,80412c64 <strcmp>
8040defc:	fe0512e3          	bnez	a0,8040dee0 <find_mount+0x30>
8040df00:	ff040413          	addi	s0,s0,-16
8040df04:	0089a023          	sw	s0,0(s3)
8040df08:	01c12083          	lw	ra,28(sp)
8040df0c:	01812403          	lw	s0,24(sp)
8040df10:	01412483          	lw	s1,20(sp)
8040df14:	01012903          	lw	s2,16(sp)
8040df18:	00c12983          	lw	s3,12(sp)
8040df1c:	02010113          	addi	sp,sp,32
8040df20:	00008067          	ret
8040df24:	01c12083          	lw	ra,28(sp)
8040df28:	01812403          	lw	s0,24(sp)
8040df2c:	01412483          	lw	s1,20(sp)
8040df30:	01012903          	lw	s2,16(sp)
8040df34:	00c12983          	lw	s3,12(sp)
8040df38:	ff300513          	li	a0,-13
8040df3c:	02010113          	addi	sp,sp,32
8040df40:	00008067          	ret
8040df44:	00008697          	auipc	a3,0x8
8040df48:	aa468693          	addi	a3,a3,-1372 # 804159e8 <syscalls+0x680>
8040df4c:	00005617          	auipc	a2,0x5
8040df50:	1e060613          	addi	a2,a2,480 # 8041312c <commands+0x1f8>
8040df54:	0cd00593          	li	a1,205
8040df58:	00008517          	auipc	a0,0x8
8040df5c:	aa050513          	addi	a0,a0,-1376 # 804159f8 <syscalls+0x690>
8040df60:	ec4f20ef          	jal	ra,80400624 <__panic>

8040df64 <vfs_devlist_init>:
8040df64:	0008f797          	auipc	a5,0x8f
8040df68:	86c78793          	addi	a5,a5,-1940 # 8049c7d0 <vdev_list>
8040df6c:	00100593          	li	a1,1
8040df70:	0008d517          	auipc	a0,0x8d
8040df74:	7f850513          	addi	a0,a0,2040 # 8049b768 <vdev_list_sem>
8040df78:	00f7a223          	sw	a5,4(a5)
8040df7c:	00f7a023          	sw	a5,0(a5)
8040df80:	aacf706f          	j	8040522c <sem_init>

8040df84 <vfs_cleanup>:
8040df84:	ff010113          	addi	sp,sp,-16
8040df88:	00912223          	sw	s1,4(sp)
8040df8c:	0008f497          	auipc	s1,0x8f
8040df90:	84448493          	addi	s1,s1,-1980 # 8049c7d0 <vdev_list>
8040df94:	0044a783          	lw	a5,4(s1)
8040df98:	00112623          	sw	ra,12(sp)
8040df9c:	00812423          	sw	s0,8(sp)
8040dfa0:	04978a63          	beq	a5,s1,8040dff4 <vfs_cleanup+0x70>
8040dfa4:	0008d517          	auipc	a0,0x8d
8040dfa8:	7c450513          	addi	a0,a0,1988 # 8049b768 <vdev_list_sem>
8040dfac:	a90f70ef          	jal	ra,8040523c <down>
8040dfb0:	00048413          	mv	s0,s1
8040dfb4:	00442403          	lw	s0,4(s0)
8040dfb8:	02940063          	beq	s0,s1,8040dfd8 <vfs_cleanup+0x54>
8040dfbc:	ff842783          	lw	a5,-8(s0)
8040dfc0:	00078513          	mv	a0,a5
8040dfc4:	fe0788e3          	beqz	a5,8040dfb4 <vfs_cleanup+0x30>
8040dfc8:	07c7a783          	lw	a5,124(a5)
8040dfcc:	000780e7          	jalr	a5
8040dfd0:	00442403          	lw	s0,4(s0)
8040dfd4:	fe9414e3          	bne	s0,s1,8040dfbc <vfs_cleanup+0x38>
8040dfd8:	00812403          	lw	s0,8(sp)
8040dfdc:	00c12083          	lw	ra,12(sp)
8040dfe0:	00412483          	lw	s1,4(sp)
8040dfe4:	0008d517          	auipc	a0,0x8d
8040dfe8:	78450513          	addi	a0,a0,1924 # 8049b768 <vdev_list_sem>
8040dfec:	01010113          	addi	sp,sp,16
8040dff0:	a48f706f          	j	80405238 <up>
8040dff4:	00c12083          	lw	ra,12(sp)
8040dff8:	00812403          	lw	s0,8(sp)
8040dffc:	00412483          	lw	s1,4(sp)
8040e000:	01010113          	addi	sp,sp,16
8040e004:	00008067          	ret

8040e008 <vfs_get_root>:
8040e008:	fe010113          	addi	sp,sp,-32
8040e00c:	00112e23          	sw	ra,28(sp)
8040e010:	00812c23          	sw	s0,24(sp)
8040e014:	00912a23          	sw	s1,20(sp)
8040e018:	01212823          	sw	s2,16(sp)
8040e01c:	01312623          	sw	s3,12(sp)
8040e020:	01412423          	sw	s4,8(sp)
8040e024:	0c050263          	beqz	a0,8040e0e8 <vfs_get_root+0xe0>
8040e028:	0008e917          	auipc	s2,0x8e
8040e02c:	7a890913          	addi	s2,s2,1960 # 8049c7d0 <vdev_list>
8040e030:	00492783          	lw	a5,4(s2)
8040e034:	0b278663          	beq	a5,s2,8040e0e0 <vfs_get_root+0xd8>
8040e038:	00050993          	mv	s3,a0
8040e03c:	0008d517          	auipc	a0,0x8d
8040e040:	72c50513          	addi	a0,a0,1836 # 8049b768 <vdev_list_sem>
8040e044:	00058a13          	mv	s4,a1
8040e048:	00090413          	mv	s0,s2
8040e04c:	9f0f70ef          	jal	ra,8040523c <down>
8040e050:	0180006f          	j	8040e068 <vfs_get_root+0x60>
8040e054:	ff042583          	lw	a1,-16(s0)
8040e058:	00098513          	mv	a0,s3
8040e05c:	409040ef          	jal	ra,80412c64 <strcmp>
8040e060:	00050493          	mv	s1,a0
8040e064:	04050063          	beqz	a0,8040e0a4 <vfs_get_root+0x9c>
8040e068:	00442403          	lw	s0,4(s0)
8040e06c:	ff2414e3          	bne	s0,s2,8040e054 <vfs_get_root+0x4c>
8040e070:	ff300493          	li	s1,-13
8040e074:	0008d517          	auipc	a0,0x8d
8040e078:	6f450513          	addi	a0,a0,1780 # 8049b768 <vdev_list_sem>
8040e07c:	9bcf70ef          	jal	ra,80405238 <up>
8040e080:	01c12083          	lw	ra,28(sp)
8040e084:	01812403          	lw	s0,24(sp)
8040e088:	00048513          	mv	a0,s1
8040e08c:	01012903          	lw	s2,16(sp)
8040e090:	01412483          	lw	s1,20(sp)
8040e094:	00c12983          	lw	s3,12(sp)
8040e098:	00812a03          	lw	s4,8(sp)
8040e09c:	02010113          	addi	sp,sp,32
8040e0a0:	00008067          	ret
8040e0a4:	ff842503          	lw	a0,-8(s0)
8040e0a8:	00050c63          	beqz	a0,8040e0c0 <vfs_get_root+0xb8>
8040e0ac:	07452783          	lw	a5,116(a0)
8040e0b0:	000780e7          	jalr	a5
8040e0b4:	00050a63          	beqz	a0,8040e0c8 <vfs_get_root+0xc0>
8040e0b8:	00aa2023          	sw	a0,0(s4)
8040e0bc:	fb9ff06f          	j	8040e074 <vfs_get_root+0x6c>
8040e0c0:	ffc42783          	lw	a5,-4(s0)
8040e0c4:	00078663          	beqz	a5,8040e0d0 <vfs_get_root+0xc8>
8040e0c8:	ff200493          	li	s1,-14
8040e0cc:	fa9ff06f          	j	8040e074 <vfs_get_root+0x6c>
8040e0d0:	ff442503          	lw	a0,-12(s0)
8040e0d4:	ffcff0ef          	jal	ra,8040d8d0 <inode_ref_inc>
8040e0d8:	ff442503          	lw	a0,-12(s0)
8040e0dc:	fd9ff06f          	j	8040e0b4 <vfs_get_root+0xac>
8040e0e0:	ff300493          	li	s1,-13
8040e0e4:	f9dff06f          	j	8040e080 <vfs_get_root+0x78>
8040e0e8:	00008697          	auipc	a3,0x8
8040e0ec:	90068693          	addi	a3,a3,-1792 # 804159e8 <syscalls+0x680>
8040e0f0:	00005617          	auipc	a2,0x5
8040e0f4:	03c60613          	addi	a2,a2,60 # 8041312c <commands+0x1f8>
8040e0f8:	04500593          	li	a1,69
8040e0fc:	00008517          	auipc	a0,0x8
8040e100:	8fc50513          	addi	a0,a0,-1796 # 804159f8 <syscalls+0x690>
8040e104:	d20f20ef          	jal	ra,80400624 <__panic>

8040e108 <vfs_get_devname>:
8040e108:	0008e697          	auipc	a3,0x8e
8040e10c:	6c868693          	addi	a3,a3,1736 # 8049c7d0 <vdev_list>
8040e110:	00068793          	mv	a5,a3
8040e114:	00051863          	bnez	a0,8040e124 <vfs_get_devname+0x1c>
8040e118:	0240006f          	j	8040e13c <vfs_get_devname+0x34>
8040e11c:	ff87a703          	lw	a4,-8(a5)
8040e120:	00a70a63          	beq	a4,a0,8040e134 <vfs_get_devname+0x2c>
8040e124:	0047a783          	lw	a5,4(a5)
8040e128:	fed79ae3          	bne	a5,a3,8040e11c <vfs_get_devname+0x14>
8040e12c:	00000513          	li	a0,0
8040e130:	00008067          	ret
8040e134:	ff07a503          	lw	a0,-16(a5)
8040e138:	00008067          	ret
8040e13c:	ff010113          	addi	sp,sp,-16
8040e140:	00008697          	auipc	a3,0x8
8040e144:	92c68693          	addi	a3,a3,-1748 # 80415a6c <syscalls+0x704>
8040e148:	00005617          	auipc	a2,0x5
8040e14c:	fe460613          	addi	a2,a2,-28 # 8041312c <commands+0x1f8>
8040e150:	06a00593          	li	a1,106
8040e154:	00008517          	auipc	a0,0x8
8040e158:	8a450513          	addi	a0,a0,-1884 # 804159f8 <syscalls+0x690>
8040e15c:	00112623          	sw	ra,12(sp)
8040e160:	cc4f20ef          	jal	ra,80400624 <__panic>

8040e164 <vfs_add_dev>:
8040e164:	00060693          	mv	a3,a2
8040e168:	00000613          	li	a2,0
8040e16c:	bb1ff06f          	j	8040dd1c <vfs_do_add>

8040e170 <vfs_mount>:
8040e170:	fe010113          	addi	sp,sp,-32
8040e174:	00812c23          	sw	s0,24(sp)
8040e178:	00050413          	mv	s0,a0
8040e17c:	0008d517          	auipc	a0,0x8d
8040e180:	5ec50513          	addi	a0,a0,1516 # 8049b768 <vdev_list_sem>
8040e184:	00112e23          	sw	ra,28(sp)
8040e188:	00912a23          	sw	s1,20(sp)
8040e18c:	00058493          	mv	s1,a1
8040e190:	8acf70ef          	jal	ra,8040523c <down>
8040e194:	00040513          	mv	a0,s0
8040e198:	00c10593          	addi	a1,sp,12
8040e19c:	d15ff0ef          	jal	ra,8040deb0 <find_mount>
8040e1a0:	00050413          	mv	s0,a0
8040e1a4:	06051263          	bnez	a0,8040e208 <vfs_mount+0x98>
8040e1a8:	00c12583          	lw	a1,12(sp)
8040e1ac:	0085a783          	lw	a5,8(a1)
8040e1b0:	06079e63          	bnez	a5,8040e22c <vfs_mount+0xbc>
8040e1b4:	0005a783          	lw	a5,0(a1)
8040e1b8:	08078e63          	beqz	a5,8040e254 <vfs_mount+0xe4>
8040e1bc:	00c5a783          	lw	a5,12(a1)
8040e1c0:	08078a63          	beqz	a5,8040e254 <vfs_mount+0xe4>
8040e1c4:	0045a503          	lw	a0,4(a1)
8040e1c8:	06050663          	beqz	a0,8040e234 <vfs_mount+0xc4>
8040e1cc:	02c52703          	lw	a4,44(a0)
8040e1d0:	000017b7          	lui	a5,0x1
8040e1d4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040e1d8:	04f71e63          	bne	a4,a5,8040e234 <vfs_mount+0xc4>
8040e1dc:	00858593          	addi	a1,a1,8
8040e1e0:	000480e7          	jalr	s1
8040e1e4:	00050413          	mv	s0,a0
8040e1e8:	02051063          	bnez	a0,8040e208 <vfs_mount+0x98>
8040e1ec:	00c12783          	lw	a5,12(sp)
8040e1f0:	0087a703          	lw	a4,8(a5)
8040e1f4:	08070063          	beqz	a4,8040e274 <vfs_mount+0x104>
8040e1f8:	0007a583          	lw	a1,0(a5)
8040e1fc:	00008517          	auipc	a0,0x8
8040e200:	8f050513          	addi	a0,a0,-1808 # 80415aec <syscalls+0x784>
8040e204:	ff9f10ef          	jal	ra,804001fc <cprintf>
8040e208:	0008d517          	auipc	a0,0x8d
8040e20c:	56050513          	addi	a0,a0,1376 # 8049b768 <vdev_list_sem>
8040e210:	828f70ef          	jal	ra,80405238 <up>
8040e214:	00040513          	mv	a0,s0
8040e218:	01c12083          	lw	ra,28(sp)
8040e21c:	01812403          	lw	s0,24(sp)
8040e220:	01412483          	lw	s1,20(sp)
8040e224:	02010113          	addi	sp,sp,32
8040e228:	00008067          	ret
8040e22c:	ff100413          	li	s0,-15
8040e230:	fd9ff06f          	j	8040e208 <vfs_mount+0x98>
8040e234:	00008697          	auipc	a3,0x8
8040e238:	87068693          	addi	a3,a3,-1936 # 80415aa4 <syscalls+0x73c>
8040e23c:	00005617          	auipc	a2,0x5
8040e240:	ef060613          	addi	a2,a2,-272 # 8041312c <commands+0x1f8>
8040e244:	0ed00593          	li	a1,237
8040e248:	00007517          	auipc	a0,0x7
8040e24c:	7b050513          	addi	a0,a0,1968 # 804159f8 <syscalls+0x690>
8040e250:	bd4f20ef          	jal	ra,80400624 <__panic>
8040e254:	00008697          	auipc	a3,0x8
8040e258:	82468693          	addi	a3,a3,-2012 # 80415a78 <syscalls+0x710>
8040e25c:	00005617          	auipc	a2,0x5
8040e260:	ed060613          	addi	a2,a2,-304 # 8041312c <commands+0x1f8>
8040e264:	0eb00593          	li	a1,235
8040e268:	00007517          	auipc	a0,0x7
8040e26c:	79050513          	addi	a0,a0,1936 # 804159f8 <syscalls+0x690>
8040e270:	bb4f20ef          	jal	ra,80400624 <__panic>
8040e274:	00008697          	auipc	a3,0x8
8040e278:	86468693          	addi	a3,a3,-1948 # 80415ad8 <syscalls+0x770>
8040e27c:	00005617          	auipc	a2,0x5
8040e280:	eb060613          	addi	a2,a2,-336 # 8041312c <commands+0x1f8>
8040e284:	0ef00593          	li	a1,239
8040e288:	00007517          	auipc	a0,0x7
8040e28c:	77050513          	addi	a0,a0,1904 # 804159f8 <syscalls+0x690>
8040e290:	b94f20ef          	jal	ra,80400624 <__panic>

8040e294 <vfs_open>:
8040e294:	fd010113          	addi	sp,sp,-48
8040e298:	02112623          	sw	ra,44(sp)
8040e29c:	02812423          	sw	s0,40(sp)
8040e2a0:	02912223          	sw	s1,36(sp)
8040e2a4:	03212023          	sw	s2,32(sp)
8040e2a8:	01312e23          	sw	s3,28(sp)
8040e2ac:	01412c23          	sw	s4,24(sp)
8040e2b0:	01512a23          	sw	s5,20(sp)
8040e2b4:	0035f793          	andi	a5,a1,3
8040e2b8:	16078e63          	beqz	a5,8040e434 <vfs_open+0x1a0>
8040e2bc:	00200713          	li	a4,2
8040e2c0:	0cf76c63          	bltu	a4,a5,8040e398 <vfs_open+0x104>
8040e2c4:	0105fa93          	andi	s5,a1,16
8040e2c8:	00058493          	mv	s1,a1
8040e2cc:	00410593          	addi	a1,sp,4
8040e2d0:	00060993          	mv	s3,a2
8040e2d4:	00050913          	mv	s2,a0
8040e2d8:	39c000ef          	jal	ra,8040e674 <vfs_lookup>
8040e2dc:	00050413          	mv	s0,a0
8040e2e0:	0044fa13          	andi	s4,s1,4
8040e2e4:	0e051063          	bnez	a0,8040e3c4 <vfs_open+0x130>
8040e2e8:	00c4f793          	andi	a5,s1,12
8040e2ec:	00c00713          	li	a4,12
8040e2f0:	16e78663          	beq	a5,a4,8040e45c <vfs_open+0x1c8>
8040e2f4:	00412403          	lw	s0,4(sp)
8040e2f8:	1a040663          	beqz	s0,8040e4a4 <vfs_open+0x210>
8040e2fc:	03c42783          	lw	a5,60(s0)
8040e300:	16078263          	beqz	a5,8040e464 <vfs_open+0x1d0>
8040e304:	0047a783          	lw	a5,4(a5)
8040e308:	14078e63          	beqz	a5,8040e464 <vfs_open+0x1d0>
8040e30c:	00040513          	mv	a0,s0
8040e310:	00008597          	auipc	a1,0x8
8040e314:	8bc58593          	addi	a1,a1,-1860 # 80415bcc <syscalls+0x864>
8040e318:	de0ff0ef          	jal	ra,8040d8f8 <inode_check>
8040e31c:	03c42783          	lw	a5,60(s0)
8040e320:	00412503          	lw	a0,4(sp)
8040e324:	00048593          	mv	a1,s1
8040e328:	0047a783          	lw	a5,4(a5)
8040e32c:	000780e7          	jalr	a5
8040e330:	00050413          	mv	s0,a0
8040e334:	00412503          	lw	a0,4(sp)
8040e338:	10041e63          	bnez	s0,8040e454 <vfs_open+0x1c0>
8040e33c:	015a6a33          	or	s4,s4,s5
8040e340:	da4ff0ef          	jal	ra,8040d8e4 <inode_open_inc>
8040e344:	040a0463          	beqz	s4,8040e38c <vfs_open+0xf8>
8040e348:	00412483          	lw	s1,4(sp)
8040e34c:	12048c63          	beqz	s1,8040e484 <vfs_open+0x1f0>
8040e350:	03c4a783          	lw	a5,60(s1)
8040e354:	12078863          	beqz	a5,8040e484 <vfs_open+0x1f0>
8040e358:	0307a783          	lw	a5,48(a5)
8040e35c:	12078463          	beqz	a5,8040e484 <vfs_open+0x1f0>
8040e360:	00008597          	auipc	a1,0x8
8040e364:	8c858593          	addi	a1,a1,-1848 # 80415c28 <syscalls+0x8c0>
8040e368:	00048513          	mv	a0,s1
8040e36c:	d8cff0ef          	jal	ra,8040d8f8 <inode_check>
8040e370:	03c4a783          	lw	a5,60(s1)
8040e374:	00412503          	lw	a0,4(sp)
8040e378:	00000593          	li	a1,0
8040e37c:	0307a783          	lw	a5,48(a5)
8040e380:	000780e7          	jalr	a5
8040e384:	00050793          	mv	a5,a0
8040e388:	0a051e63          	bnez	a0,8040e444 <vfs_open+0x1b0>
8040e38c:	00412783          	lw	a5,4(sp)
8040e390:	00f9a023          	sw	a5,0(s3)
8040e394:	0080006f          	j	8040e39c <vfs_open+0x108>
8040e398:	ffd00413          	li	s0,-3
8040e39c:	00040513          	mv	a0,s0
8040e3a0:	02c12083          	lw	ra,44(sp)
8040e3a4:	02812403          	lw	s0,40(sp)
8040e3a8:	02412483          	lw	s1,36(sp)
8040e3ac:	02012903          	lw	s2,32(sp)
8040e3b0:	01c12983          	lw	s3,28(sp)
8040e3b4:	01812a03          	lw	s4,24(sp)
8040e3b8:	01412a83          	lw	s5,20(sp)
8040e3bc:	03010113          	addi	sp,sp,48
8040e3c0:	00008067          	ret
8040e3c4:	ff000793          	li	a5,-16
8040e3c8:	fcf51ae3          	bne	a0,a5,8040e39c <vfs_open+0x108>
8040e3cc:	fc0a08e3          	beqz	s4,8040e39c <vfs_open+0x108>
8040e3d0:	00810613          	addi	a2,sp,8
8040e3d4:	00c10593          	addi	a1,sp,12
8040e3d8:	00090513          	mv	a0,s2
8040e3dc:	37c000ef          	jal	ra,8040e758 <vfs_lookup_parent>
8040e3e0:	00050413          	mv	s0,a0
8040e3e4:	fa051ce3          	bnez	a0,8040e39c <vfs_open+0x108>
8040e3e8:	00c12403          	lw	s0,12(sp)
8040e3ec:	0c040c63          	beqz	s0,8040e4c4 <vfs_open+0x230>
8040e3f0:	03c42783          	lw	a5,60(s0)
8040e3f4:	0c078863          	beqz	a5,8040e4c4 <vfs_open+0x230>
8040e3f8:	0347a783          	lw	a5,52(a5)
8040e3fc:	0c078463          	beqz	a5,8040e4c4 <vfs_open+0x230>
8040e400:	00040513          	mv	a0,s0
8040e404:	00007597          	auipc	a1,0x7
8040e408:	76058593          	addi	a1,a1,1888 # 80415b64 <syscalls+0x7fc>
8040e40c:	cecff0ef          	jal	ra,8040d8f8 <inode_check>
8040e410:	03c42783          	lw	a5,60(s0)
8040e414:	00812583          	lw	a1,8(sp)
8040e418:	00c12503          	lw	a0,12(sp)
8040e41c:	0347a783          	lw	a5,52(a5)
8040e420:	0034d613          	srli	a2,s1,0x3
8040e424:	00410693          	addi	a3,sp,4
8040e428:	00167613          	andi	a2,a2,1
8040e42c:	000780e7          	jalr	a5
8040e430:	ec5ff06f          	j	8040e2f4 <vfs_open+0x60>
8040e434:	0105fa93          	andi	s5,a1,16
8040e438:	ffd00413          	li	s0,-3
8040e43c:	f60a90e3          	bnez	s5,8040e39c <vfs_open+0x108>
8040e440:	e89ff06f          	j	8040e2c8 <vfs_open+0x34>
8040e444:	00412503          	lw	a0,4(sp)
8040e448:	00078413          	mv	s0,a5
8040e44c:	e5cff0ef          	jal	ra,8040daa8 <inode_open_dec>
8040e450:	00412503          	lw	a0,4(sp)
8040e454:	d70ff0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040e458:	f45ff06f          	j	8040e39c <vfs_open+0x108>
8040e45c:	fe900413          	li	s0,-23
8040e460:	f3dff06f          	j	8040e39c <vfs_open+0x108>
8040e464:	00007697          	auipc	a3,0x7
8040e468:	71868693          	addi	a3,a3,1816 # 80415b7c <syscalls+0x814>
8040e46c:	00005617          	auipc	a2,0x5
8040e470:	cc060613          	addi	a2,a2,-832 # 8041312c <commands+0x1f8>
8040e474:	03300593          	li	a1,51
8040e478:	00007517          	auipc	a0,0x7
8040e47c:	6d450513          	addi	a0,a0,1748 # 80415b4c <syscalls+0x7e4>
8040e480:	9a4f20ef          	jal	ra,80400624 <__panic>
8040e484:	00007697          	auipc	a3,0x7
8040e488:	75068693          	addi	a3,a3,1872 # 80415bd4 <syscalls+0x86c>
8040e48c:	00005617          	auipc	a2,0x5
8040e490:	ca060613          	addi	a2,a2,-864 # 8041312c <commands+0x1f8>
8040e494:	03a00593          	li	a1,58
8040e498:	00007517          	auipc	a0,0x7
8040e49c:	6b450513          	addi	a0,a0,1716 # 80415b4c <syscalls+0x7e4>
8040e4a0:	984f20ef          	jal	ra,80400624 <__panic>
8040e4a4:	00007697          	auipc	a3,0x7
8040e4a8:	6c868693          	addi	a3,a3,1736 # 80415b6c <syscalls+0x804>
8040e4ac:	00005617          	auipc	a2,0x5
8040e4b0:	c8060613          	addi	a2,a2,-896 # 8041312c <commands+0x1f8>
8040e4b4:	03100593          	li	a1,49
8040e4b8:	00007517          	auipc	a0,0x7
8040e4bc:	69450513          	addi	a0,a0,1684 # 80415b4c <syscalls+0x7e4>
8040e4c0:	964f20ef          	jal	ra,80400624 <__panic>
8040e4c4:	00007697          	auipc	a3,0x7
8040e4c8:	63868693          	addi	a3,a3,1592 # 80415afc <syscalls+0x794>
8040e4cc:	00005617          	auipc	a2,0x5
8040e4d0:	c6060613          	addi	a2,a2,-928 # 8041312c <commands+0x1f8>
8040e4d4:	02c00593          	li	a1,44
8040e4d8:	00007517          	auipc	a0,0x7
8040e4dc:	67450513          	addi	a0,a0,1652 # 80415b4c <syscalls+0x7e4>
8040e4e0:	944f20ef          	jal	ra,80400624 <__panic>

8040e4e4 <vfs_close>:
8040e4e4:	ff010113          	addi	sp,sp,-16
8040e4e8:	00112623          	sw	ra,12(sp)
8040e4ec:	00812423          	sw	s0,8(sp)
8040e4f0:	00050413          	mv	s0,a0
8040e4f4:	db4ff0ef          	jal	ra,8040daa8 <inode_open_dec>
8040e4f8:	00040513          	mv	a0,s0
8040e4fc:	cc8ff0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040e500:	00c12083          	lw	ra,12(sp)
8040e504:	00812403          	lw	s0,8(sp)
8040e508:	00000513          	li	a0,0
8040e50c:	01010113          	addi	sp,sp,16
8040e510:	00008067          	ret

8040e514 <get_device>:
8040e514:	fe010113          	addi	sp,sp,-32
8040e518:	00812c23          	sw	s0,24(sp)
8040e51c:	00912a23          	sw	s1,20(sp)
8040e520:	01212823          	sw	s2,16(sp)
8040e524:	00112e23          	sw	ra,28(sp)
8040e528:	00054783          	lbu	a5,0(a0)
8040e52c:	00050413          	mv	s0,a0
8040e530:	00058913          	mv	s2,a1
8040e534:	00060493          	mv	s1,a2
8040e538:	04078263          	beqz	a5,8040e57c <get_device+0x68>
8040e53c:	03a00713          	li	a4,58
8040e540:	0ae78463          	beq	a5,a4,8040e5e8 <get_device+0xd4>
8040e544:	02f00713          	li	a4,47
8040e548:	0ee78e63          	beq	a5,a4,8040e644 <get_device+0x130>
8040e54c:	00150693          	addi	a3,a0,1
8040e550:	00000793          	li	a5,0
8040e554:	03a00813          	li	a6,58
8040e558:	02f00893          	li	a7,47
8040e55c:	0140006f          	j	8040e570 <get_device+0x5c>
8040e560:	05070063          	beq	a4,a6,8040e5a0 <get_device+0x8c>
8040e564:	00168693          	addi	a3,a3,1
8040e568:	00050793          	mv	a5,a0
8040e56c:	01170863          	beq	a4,a7,8040e57c <get_device+0x68>
8040e570:	0006c703          	lbu	a4,0(a3)
8040e574:	00178513          	addi	a0,a5,1
8040e578:	fe0714e3          	bnez	a4,8040e560 <get_device+0x4c>
8040e57c:	00892023          	sw	s0,0(s2)
8040e580:	00048513          	mv	a0,s1
8040e584:	224000ef          	jal	ra,8040e7a8 <vfs_get_curdir>
8040e588:	01c12083          	lw	ra,28(sp)
8040e58c:	01812403          	lw	s0,24(sp)
8040e590:	01412483          	lw	s1,20(sp)
8040e594:	01012903          	lw	s2,16(sp)
8040e598:	02010113          	addi	sp,sp,32
8040e59c:	00008067          	ret
8040e5a0:	00278793          	addi	a5,a5,2
8040e5a4:	00068023          	sb	zero,0(a3)
8040e5a8:	00f407b3          	add	a5,s0,a5
8040e5ac:	02f00693          	li	a3,47
8040e5b0:	00078513          	mv	a0,a5
8040e5b4:	00178793          	addi	a5,a5,1
8040e5b8:	fff7c703          	lbu	a4,-1(a5)
8040e5bc:	fed70ae3          	beq	a4,a3,8040e5b0 <get_device+0x9c>
8040e5c0:	00a92023          	sw	a0,0(s2)
8040e5c4:	00048593          	mv	a1,s1
8040e5c8:	00040513          	mv	a0,s0
8040e5cc:	a3dff0ef          	jal	ra,8040e008 <vfs_get_root>
8040e5d0:	01c12083          	lw	ra,28(sp)
8040e5d4:	01812403          	lw	s0,24(sp)
8040e5d8:	01412483          	lw	s1,20(sp)
8040e5dc:	01012903          	lw	s2,16(sp)
8040e5e0:	02010113          	addi	sp,sp,32
8040e5e4:	00008067          	ret
8040e5e8:	00c10513          	addi	a0,sp,12
8040e5ec:	1bc000ef          	jal	ra,8040e7a8 <vfs_get_curdir>
8040e5f0:	fe0510e3          	bnez	a0,8040e5d0 <get_device+0xbc>
8040e5f4:	00c12783          	lw	a5,12(sp)
8040e5f8:	0387a503          	lw	a0,56(a5)
8040e5fc:	04050c63          	beqz	a0,8040e654 <get_device+0x140>
8040e600:	07452783          	lw	a5,116(a0)
8040e604:	000780e7          	jalr	a5
8040e608:	00a4a023          	sw	a0,0(s1)
8040e60c:	00c12503          	lw	a0,12(sp)
8040e610:	bb4ff0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040e614:	02f00713          	li	a4,47
8040e618:	00140413          	addi	s0,s0,1
8040e61c:	00044783          	lbu	a5,0(s0)
8040e620:	fee78ce3          	beq	a5,a4,8040e618 <get_device+0x104>
8040e624:	00892023          	sw	s0,0(s2)
8040e628:	01c12083          	lw	ra,28(sp)
8040e62c:	01812403          	lw	s0,24(sp)
8040e630:	01412483          	lw	s1,20(sp)
8040e634:	01012903          	lw	s2,16(sp)
8040e638:	00000513          	li	a0,0
8040e63c:	02010113          	addi	sp,sp,32
8040e640:	00008067          	ret
8040e644:	00060513          	mv	a0,a2
8040e648:	e58ff0ef          	jal	ra,8040dca0 <vfs_get_bootfs>
8040e64c:	fc0504e3          	beqz	a0,8040e614 <get_device+0x100>
8040e650:	f81ff06f          	j	8040e5d0 <get_device+0xbc>
8040e654:	00007697          	auipc	a3,0x7
8040e658:	5e068693          	addi	a3,a3,1504 # 80415c34 <syscalls+0x8cc>
8040e65c:	00005617          	auipc	a2,0x5
8040e660:	ad060613          	addi	a2,a2,-1328 # 8041312c <commands+0x1f8>
8040e664:	03900593          	li	a1,57
8040e668:	00007517          	auipc	a0,0x7
8040e66c:	5e050513          	addi	a0,a0,1504 # 80415c48 <syscalls+0x8e0>
8040e670:	fb5f10ef          	jal	ra,80400624 <__panic>

8040e674 <vfs_lookup>:
8040e674:	fd010113          	addi	sp,sp,-48
8040e678:	03212023          	sw	s2,32(sp)
8040e67c:	01c10613          	addi	a2,sp,28
8040e680:	00058913          	mv	s2,a1
8040e684:	00c10593          	addi	a1,sp,12
8040e688:	02812423          	sw	s0,40(sp)
8040e68c:	02112623          	sw	ra,44(sp)
8040e690:	02912223          	sw	s1,36(sp)
8040e694:	00a12623          	sw	a0,12(sp)
8040e698:	e7dff0ef          	jal	ra,8040e514 <get_device>
8040e69c:	00050413          	mv	s0,a0
8040e6a0:	04051e63          	bnez	a0,8040e6fc <vfs_lookup+0x88>
8040e6a4:	00c12783          	lw	a5,12(sp)
8040e6a8:	01c12483          	lw	s1,28(sp)
8040e6ac:	0007c783          	lbu	a5,0(a5)
8040e6b0:	06078463          	beqz	a5,8040e718 <vfs_lookup+0xa4>
8040e6b4:	08048263          	beqz	s1,8040e738 <vfs_lookup+0xc4>
8040e6b8:	03c4a783          	lw	a5,60(s1)
8040e6bc:	06078e63          	beqz	a5,8040e738 <vfs_lookup+0xc4>
8040e6c0:	0387a783          	lw	a5,56(a5)
8040e6c4:	06078a63          	beqz	a5,8040e738 <vfs_lookup+0xc4>
8040e6c8:	00048513          	mv	a0,s1
8040e6cc:	00007597          	auipc	a1,0x7
8040e6d0:	5e458593          	addi	a1,a1,1508 # 80415cb0 <syscalls+0x948>
8040e6d4:	a24ff0ef          	jal	ra,8040d8f8 <inode_check>
8040e6d8:	03c4a783          	lw	a5,60(s1)
8040e6dc:	00c12583          	lw	a1,12(sp)
8040e6e0:	01c12503          	lw	a0,28(sp)
8040e6e4:	0387a783          	lw	a5,56(a5)
8040e6e8:	00090613          	mv	a2,s2
8040e6ec:	000780e7          	jalr	a5
8040e6f0:	00050413          	mv	s0,a0
8040e6f4:	01c12503          	lw	a0,28(sp)
8040e6f8:	accff0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040e6fc:	00040513          	mv	a0,s0
8040e700:	02c12083          	lw	ra,44(sp)
8040e704:	02812403          	lw	s0,40(sp)
8040e708:	02412483          	lw	s1,36(sp)
8040e70c:	02012903          	lw	s2,32(sp)
8040e710:	03010113          	addi	sp,sp,48
8040e714:	00008067          	ret
8040e718:	00040513          	mv	a0,s0
8040e71c:	02c12083          	lw	ra,44(sp)
8040e720:	02812403          	lw	s0,40(sp)
8040e724:	00992023          	sw	s1,0(s2)
8040e728:	02412483          	lw	s1,36(sp)
8040e72c:	02012903          	lw	s2,32(sp)
8040e730:	03010113          	addi	sp,sp,48
8040e734:	00008067          	ret
8040e738:	00007697          	auipc	a3,0x7
8040e73c:	52868693          	addi	a3,a3,1320 # 80415c60 <syscalls+0x8f8>
8040e740:	00005617          	auipc	a2,0x5
8040e744:	9ec60613          	addi	a2,a2,-1556 # 8041312c <commands+0x1f8>
8040e748:	04f00593          	li	a1,79
8040e74c:	00007517          	auipc	a0,0x7
8040e750:	4fc50513          	addi	a0,a0,1276 # 80415c48 <syscalls+0x8e0>
8040e754:	ed1f10ef          	jal	ra,80400624 <__panic>

8040e758 <vfs_lookup_parent>:
8040e758:	fd010113          	addi	sp,sp,-48
8040e75c:	02812423          	sw	s0,40(sp)
8040e760:	02912223          	sw	s1,36(sp)
8040e764:	00058413          	mv	s0,a1
8040e768:	00060493          	mv	s1,a2
8040e76c:	00c10593          	addi	a1,sp,12
8040e770:	01c10613          	addi	a2,sp,28
8040e774:	02112623          	sw	ra,44(sp)
8040e778:	00a12623          	sw	a0,12(sp)
8040e77c:	d99ff0ef          	jal	ra,8040e514 <get_device>
8040e780:	00051a63          	bnez	a0,8040e794 <vfs_lookup_parent+0x3c>
8040e784:	00c12783          	lw	a5,12(sp)
8040e788:	00f4a023          	sw	a5,0(s1)
8040e78c:	01c12783          	lw	a5,28(sp)
8040e790:	00f42023          	sw	a5,0(s0)
8040e794:	02c12083          	lw	ra,44(sp)
8040e798:	02812403          	lw	s0,40(sp)
8040e79c:	02412483          	lw	s1,36(sp)
8040e7a0:	03010113          	addi	sp,sp,48
8040e7a4:	00008067          	ret

8040e7a8 <vfs_get_curdir>:
8040e7a8:	0008e797          	auipc	a5,0x8e
8040e7ac:	00478793          	addi	a5,a5,4 # 8049c7ac <current>
8040e7b0:	0007a783          	lw	a5,0(a5)
8040e7b4:	ff010113          	addi	sp,sp,-16
8040e7b8:	00812423          	sw	s0,8(sp)
8040e7bc:	0dc7a783          	lw	a5,220(a5)
8040e7c0:	00112623          	sw	ra,12(sp)
8040e7c4:	00912223          	sw	s1,4(sp)
8040e7c8:	0007a403          	lw	s0,0(a5)
8040e7cc:	02040663          	beqz	s0,8040e7f8 <vfs_get_curdir+0x50>
8040e7d0:	00050493          	mv	s1,a0
8040e7d4:	00040513          	mv	a0,s0
8040e7d8:	8f8ff0ef          	jal	ra,8040d8d0 <inode_ref_inc>
8040e7dc:	00000513          	li	a0,0
8040e7e0:	0084a023          	sw	s0,0(s1)
8040e7e4:	00c12083          	lw	ra,12(sp)
8040e7e8:	00812403          	lw	s0,8(sp)
8040e7ec:	00412483          	lw	s1,4(sp)
8040e7f0:	01010113          	addi	sp,sp,16
8040e7f4:	00008067          	ret
8040e7f8:	ff000513          	li	a0,-16
8040e7fc:	fe9ff06f          	j	8040e7e4 <vfs_get_curdir+0x3c>

8040e800 <vfs_set_curdir>:
8040e800:	fd010113          	addi	sp,sp,-48
8040e804:	02912223          	sw	s1,36(sp)
8040e808:	0008e497          	auipc	s1,0x8e
8040e80c:	fa448493          	addi	s1,s1,-92 # 8049c7ac <current>
8040e810:	0004a783          	lw	a5,0(s1)
8040e814:	02812423          	sw	s0,40(sp)
8040e818:	00050413          	mv	s0,a0
8040e81c:	0dc7a503          	lw	a0,220(a5)
8040e820:	01312e23          	sw	s3,28(sp)
8040e824:	02112623          	sw	ra,44(sp)
8040e828:	03212023          	sw	s2,32(sp)
8040e82c:	b79f70ef          	jal	ra,804063a4 <lock_files>
8040e830:	0004a783          	lw	a5,0(s1)
8040e834:	0dc7a503          	lw	a0,220(a5)
8040e838:	00052983          	lw	s3,0(a0)
8040e83c:	0b340863          	beq	s0,s3,8040e8ec <vfs_set_curdir+0xec>
8040e840:	08040a63          	beqz	s0,8040e8d4 <vfs_set_curdir+0xd4>
8040e844:	03c42783          	lw	a5,60(s0)
8040e848:	0a078663          	beqz	a5,8040e8f4 <vfs_set_curdir+0xf4>
8040e84c:	0287a783          	lw	a5,40(a5)
8040e850:	0a078263          	beqz	a5,8040e8f4 <vfs_set_curdir+0xf4>
8040e854:	00007597          	auipc	a1,0x7
8040e858:	52c58593          	addi	a1,a1,1324 # 80415d80 <syscalls+0xa18>
8040e85c:	00040513          	mv	a0,s0
8040e860:	898ff0ef          	jal	ra,8040d8f8 <inode_check>
8040e864:	03c42783          	lw	a5,60(s0)
8040e868:	00c10593          	addi	a1,sp,12
8040e86c:	00040513          	mv	a0,s0
8040e870:	0287a783          	lw	a5,40(a5)
8040e874:	000780e7          	jalr	a5
8040e878:	00050913          	mv	s2,a0
8040e87c:	00051e63          	bnez	a0,8040e898 <vfs_set_curdir+0x98>
8040e880:	00c12683          	lw	a3,12(sp)
8040e884:	000077b7          	lui	a5,0x7
8040e888:	00002737          	lui	a4,0x2
8040e88c:	00d7f7b3          	and	a5,a5,a3
8040e890:	fee00913          	li	s2,-18
8040e894:	02e78863          	beq	a5,a4,8040e8c4 <vfs_set_curdir+0xc4>
8040e898:	0004a783          	lw	a5,0(s1)
8040e89c:	0dc7a503          	lw	a0,220(a5) # 70dc <_binary_bin_swap_img_size-0xf24>
8040e8a0:	b0df70ef          	jal	ra,804063ac <unlock_files>
8040e8a4:	02c12083          	lw	ra,44(sp)
8040e8a8:	02812403          	lw	s0,40(sp)
8040e8ac:	00090513          	mv	a0,s2
8040e8b0:	02412483          	lw	s1,36(sp)
8040e8b4:	02012903          	lw	s2,32(sp)
8040e8b8:	01c12983          	lw	s3,28(sp)
8040e8bc:	03010113          	addi	sp,sp,48
8040e8c0:	00008067          	ret
8040e8c4:	00040513          	mv	a0,s0
8040e8c8:	808ff0ef          	jal	ra,8040d8d0 <inode_ref_inc>
8040e8cc:	0004a783          	lw	a5,0(s1)
8040e8d0:	0dc7a503          	lw	a0,220(a5)
8040e8d4:	00852023          	sw	s0,0(a0)
8040e8d8:	00000913          	li	s2,0
8040e8dc:	fc0982e3          	beqz	s3,8040e8a0 <vfs_set_curdir+0xa0>
8040e8e0:	00098513          	mv	a0,s3
8040e8e4:	8e0ff0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040e8e8:	fb1ff06f          	j	8040e898 <vfs_set_curdir+0x98>
8040e8ec:	00000913          	li	s2,0
8040e8f0:	fb1ff06f          	j	8040e8a0 <vfs_set_curdir+0xa0>
8040e8f4:	00007697          	auipc	a3,0x7
8040e8f8:	42468693          	addi	a3,a3,1060 # 80415d18 <syscalls+0x9b0>
8040e8fc:	00005617          	auipc	a2,0x5
8040e900:	83060613          	addi	a2,a2,-2000 # 8041312c <commands+0x1f8>
8040e904:	04300593          	li	a1,67
8040e908:	00007517          	auipc	a0,0x7
8040e90c:	46050513          	addi	a0,a0,1120 # 80415d68 <syscalls+0xa00>
8040e910:	d15f10ef          	jal	ra,80400624 <__panic>

8040e914 <vfs_chdir>:
8040e914:	fe010113          	addi	sp,sp,-32
8040e918:	00c10593          	addi	a1,sp,12
8040e91c:	00812c23          	sw	s0,24(sp)
8040e920:	00112e23          	sw	ra,28(sp)
8040e924:	d51ff0ef          	jal	ra,8040e674 <vfs_lookup>
8040e928:	00050413          	mv	s0,a0
8040e92c:	00050c63          	beqz	a0,8040e944 <vfs_chdir+0x30>
8040e930:	00040513          	mv	a0,s0
8040e934:	01c12083          	lw	ra,28(sp)
8040e938:	01812403          	lw	s0,24(sp)
8040e93c:	02010113          	addi	sp,sp,32
8040e940:	00008067          	ret
8040e944:	00c12503          	lw	a0,12(sp)
8040e948:	eb9ff0ef          	jal	ra,8040e800 <vfs_set_curdir>
8040e94c:	00050413          	mv	s0,a0
8040e950:	00c12503          	lw	a0,12(sp)
8040e954:	870ff0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040e958:	00040513          	mv	a0,s0
8040e95c:	01c12083          	lw	ra,28(sp)
8040e960:	01812403          	lw	s0,24(sp)
8040e964:	02010113          	addi	sp,sp,32
8040e968:	00008067          	ret

8040e96c <vfs_getcwd>:
8040e96c:	0008e797          	auipc	a5,0x8e
8040e970:	e4078793          	addi	a5,a5,-448 # 8049c7ac <current>
8040e974:	0007a783          	lw	a5,0(a5)
8040e978:	fe010113          	addi	sp,sp,-32
8040e97c:	00812c23          	sw	s0,24(sp)
8040e980:	0dc7a783          	lw	a5,220(a5)
8040e984:	00112e23          	sw	ra,28(sp)
8040e988:	00912a23          	sw	s1,20(sp)
8040e98c:	0007a403          	lw	s0,0(a5)
8040e990:	01212823          	sw	s2,16(sp)
8040e994:	0c040663          	beqz	s0,8040ea60 <vfs_getcwd+0xf4>
8040e998:	00050493          	mv	s1,a0
8040e99c:	00040513          	mv	a0,s0
8040e9a0:	f31fe0ef          	jal	ra,8040d8d0 <inode_ref_inc>
8040e9a4:	03842503          	lw	a0,56(s0)
8040e9a8:	0c050063          	beqz	a0,8040ea68 <vfs_getcwd+0xfc>
8040e9ac:	f5cff0ef          	jal	ra,8040e108 <vfs_get_devname>
8040e9b0:	00050913          	mv	s2,a0
8040e9b4:	228040ef          	jal	ra,80412bdc <strlen>
8040e9b8:	00050613          	mv	a2,a0
8040e9bc:	00090593          	mv	a1,s2
8040e9c0:	00000713          	li	a4,0
8040e9c4:	00100693          	li	a3,1
8040e9c8:	00048513          	mv	a0,s1
8040e9cc:	cd9f70ef          	jal	ra,804066a4 <iobuf_move>
8040e9d0:	00050913          	mv	s2,a0
8040e9d4:	02050463          	beqz	a0,8040e9fc <vfs_getcwd+0x90>
8040e9d8:	00040513          	mv	a0,s0
8040e9dc:	fe9fe0ef          	jal	ra,8040d9c4 <inode_ref_dec>
8040e9e0:	01c12083          	lw	ra,28(sp)
8040e9e4:	01812403          	lw	s0,24(sp)
8040e9e8:	00090513          	mv	a0,s2
8040e9ec:	01412483          	lw	s1,20(sp)
8040e9f0:	01012903          	lw	s2,16(sp)
8040e9f4:	02010113          	addi	sp,sp,32
8040e9f8:	00008067          	ret
8040e9fc:	03a00793          	li	a5,58
8040ea00:	00000713          	li	a4,0
8040ea04:	00100693          	li	a3,1
8040ea08:	00100613          	li	a2,1
8040ea0c:	00f10593          	addi	a1,sp,15
8040ea10:	00048513          	mv	a0,s1
8040ea14:	00f107a3          	sb	a5,15(sp)
8040ea18:	c8df70ef          	jal	ra,804066a4 <iobuf_move>
8040ea1c:	00050913          	mv	s2,a0
8040ea20:	fa051ce3          	bnez	a0,8040e9d8 <vfs_getcwd+0x6c>
8040ea24:	03c42783          	lw	a5,60(s0)
8040ea28:	06078063          	beqz	a5,8040ea88 <vfs_getcwd+0x11c>
8040ea2c:	01c7a783          	lw	a5,28(a5)
8040ea30:	04078c63          	beqz	a5,8040ea88 <vfs_getcwd+0x11c>
8040ea34:	00007597          	auipc	a1,0x7
8040ea38:	2d858593          	addi	a1,a1,728 # 80415d0c <syscalls+0x9a4>
8040ea3c:	00040513          	mv	a0,s0
8040ea40:	eb9fe0ef          	jal	ra,8040d8f8 <inode_check>
8040ea44:	03c42783          	lw	a5,60(s0)
8040ea48:	00048593          	mv	a1,s1
8040ea4c:	00040513          	mv	a0,s0
8040ea50:	01c7a783          	lw	a5,28(a5)
8040ea54:	000780e7          	jalr	a5
8040ea58:	00050913          	mv	s2,a0
8040ea5c:	f7dff06f          	j	8040e9d8 <vfs_getcwd+0x6c>
8040ea60:	ff000913          	li	s2,-16
8040ea64:	f7dff06f          	j	8040e9e0 <vfs_getcwd+0x74>
8040ea68:	00007697          	auipc	a3,0x7
8040ea6c:	1cc68693          	addi	a3,a3,460 # 80415c34 <syscalls+0x8cc>
8040ea70:	00004617          	auipc	a2,0x4
8040ea74:	6bc60613          	addi	a2,a2,1724 # 8041312c <commands+0x1f8>
8040ea78:	06e00593          	li	a1,110
8040ea7c:	00007517          	auipc	a0,0x7
8040ea80:	2ec50513          	addi	a0,a0,748 # 80415d68 <syscalls+0xa00>
8040ea84:	ba1f10ef          	jal	ra,80400624 <__panic>
8040ea88:	00007697          	auipc	a3,0x7
8040ea8c:	23068693          	addi	a3,a3,560 # 80415cb8 <syscalls+0x950>
8040ea90:	00004617          	auipc	a2,0x4
8040ea94:	69c60613          	addi	a2,a2,1692 # 8041312c <commands+0x1f8>
8040ea98:	07800593          	li	a1,120
8040ea9c:	00007517          	auipc	a0,0x7
8040eaa0:	2cc50513          	addi	a0,a0,716 # 80415d68 <syscalls+0xa00>
8040eaa4:	b81f10ef          	jal	ra,80400624 <__panic>

8040eaa8 <dev_lookup>:
8040eaa8:	0005c703          	lbu	a4,0(a1)
8040eaac:	02071e63          	bnez	a4,8040eae8 <dev_lookup+0x40>
8040eab0:	ff010113          	addi	sp,sp,-16
8040eab4:	00812423          	sw	s0,8(sp)
8040eab8:	00912223          	sw	s1,4(sp)
8040eabc:	00112623          	sw	ra,12(sp)
8040eac0:	00050493          	mv	s1,a0
8040eac4:	00060413          	mv	s0,a2
8040eac8:	e09fe0ef          	jal	ra,8040d8d0 <inode_ref_inc>
8040eacc:	00c12083          	lw	ra,12(sp)
8040ead0:	00942023          	sw	s1,0(s0)
8040ead4:	00812403          	lw	s0,8(sp)
8040ead8:	00412483          	lw	s1,4(sp)
8040eadc:	00000513          	li	a0,0
8040eae0:	01010113          	addi	sp,sp,16
8040eae4:	00008067          	ret
8040eae8:	ff000513          	li	a0,-16
8040eaec:	00008067          	ret

8040eaf0 <dev_ioctl>:
8040eaf0:	00050e63          	beqz	a0,8040eb0c <dev_ioctl+0x1c>
8040eaf4:	02c52683          	lw	a3,44(a0)
8040eaf8:	00001737          	lui	a4,0x1
8040eafc:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040eb00:	00e69663          	bne	a3,a4,8040eb0c <dev_ioctl+0x1c>
8040eb04:	01452303          	lw	t1,20(a0)
8040eb08:	00030067          	jr	t1
8040eb0c:	ff010113          	addi	sp,sp,-16
8040eb10:	00007697          	auipc	a3,0x7
8040eb14:	f9468693          	addi	a3,a3,-108 # 80415aa4 <syscalls+0x73c>
8040eb18:	00004617          	auipc	a2,0x4
8040eb1c:	61460613          	addi	a2,a2,1556 # 8041312c <commands+0x1f8>
8040eb20:	03500593          	li	a1,53
8040eb24:	00007517          	auipc	a0,0x7
8040eb28:	26450513          	addi	a0,a0,612 # 80415d88 <syscalls+0xa20>
8040eb2c:	00112623          	sw	ra,12(sp)
8040eb30:	af5f10ef          	jal	ra,80400624 <__panic>

8040eb34 <dev_tryseek>:
8040eb34:	ff010113          	addi	sp,sp,-16
8040eb38:	00112623          	sw	ra,12(sp)
8040eb3c:	00812423          	sw	s0,8(sp)
8040eb40:	00912223          	sw	s1,4(sp)
8040eb44:	01212023          	sw	s2,0(sp)
8040eb48:	06050663          	beqz	a0,8040ebb4 <dev_tryseek+0x80>
8040eb4c:	02c52703          	lw	a4,44(a0)
8040eb50:	000017b7          	lui	a5,0x1
8040eb54:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040eb58:	04f71e63          	bne	a4,a5,8040ebb4 <dev_tryseek+0x80>
8040eb5c:	00052483          	lw	s1,0(a0)
8040eb60:	04048663          	beqz	s1,8040ebac <dev_tryseek+0x78>
8040eb64:	00452903          	lw	s2,4(a0)
8040eb68:	00058413          	mv	s0,a1
8040eb6c:	00058513          	mv	a0,a1
8040eb70:	00090593          	mv	a1,s2
8040eb74:	254040ef          	jal	ra,80412dc8 <__umodsi3>
8040eb78:	02051a63          	bnez	a0,8040ebac <dev_tryseek+0x78>
8040eb7c:	02044863          	bltz	s0,8040ebac <dev_tryseek+0x78>
8040eb80:	00090593          	mv	a1,s2
8040eb84:	00048513          	mv	a0,s1
8040eb88:	1cc040ef          	jal	ra,80412d54 <__mulsi3>
8040eb8c:	02a47063          	bgeu	s0,a0,8040ebac <dev_tryseek+0x78>
8040eb90:	00000513          	li	a0,0
8040eb94:	00c12083          	lw	ra,12(sp)
8040eb98:	00812403          	lw	s0,8(sp)
8040eb9c:	00412483          	lw	s1,4(sp)
8040eba0:	00012903          	lw	s2,0(sp)
8040eba4:	01010113          	addi	sp,sp,16
8040eba8:	00008067          	ret
8040ebac:	ffd00513          	li	a0,-3
8040ebb0:	fe5ff06f          	j	8040eb94 <dev_tryseek+0x60>
8040ebb4:	00007697          	auipc	a3,0x7
8040ebb8:	ef068693          	addi	a3,a3,-272 # 80415aa4 <syscalls+0x73c>
8040ebbc:	00004617          	auipc	a2,0x4
8040ebc0:	57060613          	addi	a2,a2,1392 # 8041312c <commands+0x1f8>
8040ebc4:	05f00593          	li	a1,95
8040ebc8:	00007517          	auipc	a0,0x7
8040ebcc:	1c050513          	addi	a0,a0,448 # 80415d88 <syscalls+0xa20>
8040ebd0:	a55f10ef          	jal	ra,80400624 <__panic>

8040ebd4 <dev_gettype>:
8040ebd4:	02050e63          	beqz	a0,8040ec10 <dev_gettype+0x3c>
8040ebd8:	02c52703          	lw	a4,44(a0)
8040ebdc:	000017b7          	lui	a5,0x1
8040ebe0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ebe4:	02f71663          	bne	a4,a5,8040ec10 <dev_gettype+0x3c>
8040ebe8:	00052703          	lw	a4,0(a0)
8040ebec:	000057b7          	lui	a5,0x5
8040ebf0:	00070863          	beqz	a4,8040ec00 <dev_gettype+0x2c>
8040ebf4:	00f5a023          	sw	a5,0(a1)
8040ebf8:	00000513          	li	a0,0
8040ebfc:	00008067          	ret
8040ec00:	000047b7          	lui	a5,0x4
8040ec04:	00f5a023          	sw	a5,0(a1)
8040ec08:	00000513          	li	a0,0
8040ec0c:	00008067          	ret
8040ec10:	ff010113          	addi	sp,sp,-16
8040ec14:	00007697          	auipc	a3,0x7
8040ec18:	e9068693          	addi	a3,a3,-368 # 80415aa4 <syscalls+0x73c>
8040ec1c:	00004617          	auipc	a2,0x4
8040ec20:	51060613          	addi	a2,a2,1296 # 8041312c <commands+0x1f8>
8040ec24:	05300593          	li	a1,83
8040ec28:	00007517          	auipc	a0,0x7
8040ec2c:	16050513          	addi	a0,a0,352 # 80415d88 <syscalls+0xa20>
8040ec30:	00112623          	sw	ra,12(sp)
8040ec34:	9f1f10ef          	jal	ra,80400624 <__panic>

8040ec38 <dev_write>:
8040ec38:	02050063          	beqz	a0,8040ec58 <dev_write+0x20>
8040ec3c:	02c52683          	lw	a3,44(a0)
8040ec40:	00001737          	lui	a4,0x1
8040ec44:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ec48:	00e69863          	bne	a3,a4,8040ec58 <dev_write+0x20>
8040ec4c:	01052303          	lw	t1,16(a0)
8040ec50:	00100613          	li	a2,1
8040ec54:	00030067          	jr	t1
8040ec58:	ff010113          	addi	sp,sp,-16
8040ec5c:	00007697          	auipc	a3,0x7
8040ec60:	e4868693          	addi	a3,a3,-440 # 80415aa4 <syscalls+0x73c>
8040ec64:	00004617          	auipc	a2,0x4
8040ec68:	4c860613          	addi	a2,a2,1224 # 8041312c <commands+0x1f8>
8040ec6c:	02c00593          	li	a1,44
8040ec70:	00007517          	auipc	a0,0x7
8040ec74:	11850513          	addi	a0,a0,280 # 80415d88 <syscalls+0xa20>
8040ec78:	00112623          	sw	ra,12(sp)
8040ec7c:	9a9f10ef          	jal	ra,80400624 <__panic>

8040ec80 <dev_read>:
8040ec80:	02050063          	beqz	a0,8040eca0 <dev_read+0x20>
8040ec84:	02c52683          	lw	a3,44(a0)
8040ec88:	00001737          	lui	a4,0x1
8040ec8c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ec90:	00e69863          	bne	a3,a4,8040eca0 <dev_read+0x20>
8040ec94:	01052303          	lw	t1,16(a0)
8040ec98:	00000613          	li	a2,0
8040ec9c:	00030067          	jr	t1
8040eca0:	ff010113          	addi	sp,sp,-16
8040eca4:	00007697          	auipc	a3,0x7
8040eca8:	e0068693          	addi	a3,a3,-512 # 80415aa4 <syscalls+0x73c>
8040ecac:	00004617          	auipc	a2,0x4
8040ecb0:	48060613          	addi	a2,a2,1152 # 8041312c <commands+0x1f8>
8040ecb4:	02300593          	li	a1,35
8040ecb8:	00007517          	auipc	a0,0x7
8040ecbc:	0d050513          	addi	a0,a0,208 # 80415d88 <syscalls+0xa20>
8040ecc0:	00112623          	sw	ra,12(sp)
8040ecc4:	961f10ef          	jal	ra,80400624 <__panic>

8040ecc8 <dev_close>:
8040ecc8:	00050e63          	beqz	a0,8040ece4 <dev_close+0x1c>
8040eccc:	02c52683          	lw	a3,44(a0)
8040ecd0:	00001737          	lui	a4,0x1
8040ecd4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ecd8:	00e69663          	bne	a3,a4,8040ece4 <dev_close+0x1c>
8040ecdc:	00c52303          	lw	t1,12(a0)
8040ece0:	00030067          	jr	t1
8040ece4:	ff010113          	addi	sp,sp,-16
8040ece8:	00007697          	auipc	a3,0x7
8040ecec:	dbc68693          	addi	a3,a3,-580 # 80415aa4 <syscalls+0x73c>
8040ecf0:	00004617          	auipc	a2,0x4
8040ecf4:	43c60613          	addi	a2,a2,1084 # 8041312c <commands+0x1f8>
8040ecf8:	01a00593          	li	a1,26
8040ecfc:	00007517          	auipc	a0,0x7
8040ed00:	08c50513          	addi	a0,a0,140 # 80415d88 <syscalls+0xa20>
8040ed04:	00112623          	sw	ra,12(sp)
8040ed08:	91df10ef          	jal	ra,80400624 <__panic>

8040ed0c <dev_open>:
8040ed0c:	03c5f713          	andi	a4,a1,60
8040ed10:	02071063          	bnez	a4,8040ed30 <dev_open+0x24>
8040ed14:	02050263          	beqz	a0,8040ed38 <dev_open+0x2c>
8040ed18:	02c52683          	lw	a3,44(a0)
8040ed1c:	00001737          	lui	a4,0x1
8040ed20:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ed24:	00e69a63          	bne	a3,a4,8040ed38 <dev_open+0x2c>
8040ed28:	00852303          	lw	t1,8(a0)
8040ed2c:	00030067          	jr	t1
8040ed30:	ffd00513          	li	a0,-3
8040ed34:	00008067          	ret
8040ed38:	ff010113          	addi	sp,sp,-16
8040ed3c:	00007697          	auipc	a3,0x7
8040ed40:	d6868693          	addi	a3,a3,-664 # 80415aa4 <syscalls+0x73c>
8040ed44:	00004617          	auipc	a2,0x4
8040ed48:	3e860613          	addi	a2,a2,1000 # 8041312c <commands+0x1f8>
8040ed4c:	01100593          	li	a1,17
8040ed50:	00007517          	auipc	a0,0x7
8040ed54:	03850513          	addi	a0,a0,56 # 80415d88 <syscalls+0xa20>
8040ed58:	00112623          	sw	ra,12(sp)
8040ed5c:	8c9f10ef          	jal	ra,80400624 <__panic>

8040ed60 <dev_fstat>:
8040ed60:	ff010113          	addi	sp,sp,-16
8040ed64:	00912223          	sw	s1,4(sp)
8040ed68:	00058493          	mv	s1,a1
8040ed6c:	00812423          	sw	s0,8(sp)
8040ed70:	01000613          	li	a2,16
8040ed74:	00050413          	mv	s0,a0
8040ed78:	00000593          	li	a1,0
8040ed7c:	00048513          	mv	a0,s1
8040ed80:	00112623          	sw	ra,12(sp)
8040ed84:	01212023          	sw	s2,0(sp)
8040ed88:	739030ef          	jal	ra,80412cc0 <memset>
8040ed8c:	08040463          	beqz	s0,8040ee14 <dev_fstat+0xb4>
8040ed90:	03c42783          	lw	a5,60(s0)
8040ed94:	08078063          	beqz	a5,8040ee14 <dev_fstat+0xb4>
8040ed98:	0287a783          	lw	a5,40(a5) # 4028 <_binary_bin_swap_img_size-0x3fd8>
8040ed9c:	06078c63          	beqz	a5,8040ee14 <dev_fstat+0xb4>
8040eda0:	00007597          	auipc	a1,0x7
8040eda4:	fe058593          	addi	a1,a1,-32 # 80415d80 <syscalls+0xa18>
8040eda8:	00040513          	mv	a0,s0
8040edac:	b4dfe0ef          	jal	ra,8040d8f8 <inode_check>
8040edb0:	03c42783          	lw	a5,60(s0)
8040edb4:	00048593          	mv	a1,s1
8040edb8:	00040513          	mv	a0,s0
8040edbc:	0287a783          	lw	a5,40(a5)
8040edc0:	000780e7          	jalr	a5
8040edc4:	00050913          	mv	s2,a0
8040edc8:	02051863          	bnez	a0,8040edf8 <dev_fstat+0x98>
8040edcc:	02c42703          	lw	a4,44(s0)
8040edd0:	000017b7          	lui	a5,0x1
8040edd4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040edd8:	04f71e63          	bne	a4,a5,8040ee34 <dev_fstat+0xd4>
8040eddc:	00042583          	lw	a1,0(s0)
8040ede0:	00442503          	lw	a0,4(s0)
8040ede4:	00100793          	li	a5,1
8040ede8:	00f4a223          	sw	a5,4(s1)
8040edec:	00b4a423          	sw	a1,8(s1)
8040edf0:	765030ef          	jal	ra,80412d54 <__mulsi3>
8040edf4:	00a4a623          	sw	a0,12(s1)
8040edf8:	00c12083          	lw	ra,12(sp)
8040edfc:	00812403          	lw	s0,8(sp)
8040ee00:	00090513          	mv	a0,s2
8040ee04:	00412483          	lw	s1,4(sp)
8040ee08:	00012903          	lw	s2,0(sp)
8040ee0c:	01010113          	addi	sp,sp,16
8040ee10:	00008067          	ret
8040ee14:	00007697          	auipc	a3,0x7
8040ee18:	f0468693          	addi	a3,a3,-252 # 80415d18 <syscalls+0x9b0>
8040ee1c:	00004617          	auipc	a2,0x4
8040ee20:	31060613          	addi	a2,a2,784 # 8041312c <commands+0x1f8>
8040ee24:	04200593          	li	a1,66
8040ee28:	00007517          	auipc	a0,0x7
8040ee2c:	f6050513          	addi	a0,a0,-160 # 80415d88 <syscalls+0xa20>
8040ee30:	ff4f10ef          	jal	ra,80400624 <__panic>
8040ee34:	00007697          	auipc	a3,0x7
8040ee38:	c7068693          	addi	a3,a3,-912 # 80415aa4 <syscalls+0x73c>
8040ee3c:	00004617          	auipc	a2,0x4
8040ee40:	2f060613          	addi	a2,a2,752 # 8041312c <commands+0x1f8>
8040ee44:	04500593          	li	a1,69
8040ee48:	00007517          	auipc	a0,0x7
8040ee4c:	f4050513          	addi	a0,a0,-192 # 80415d88 <syscalls+0xa20>
8040ee50:	fd4f10ef          	jal	ra,80400624 <__panic>

8040ee54 <dev_init>:
8040ee54:	ff010113          	addi	sp,sp,-16
8040ee58:	00112623          	sw	ra,12(sp)
8040ee5c:	700000ef          	jal	ra,8040f55c <dev_init_stdin>
8040ee60:	081000ef          	jal	ra,8040f6e0 <dev_init_stdout>
8040ee64:	00c12083          	lw	ra,12(sp)
8040ee68:	01010113          	addi	sp,sp,16
8040ee6c:	2bc0006f          	j	8040f128 <dev_init_disk0>

8040ee70 <dev_create_inode>:
8040ee70:	00001537          	lui	a0,0x1
8040ee74:	ff010113          	addi	sp,sp,-16
8040ee78:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ee7c:	00812423          	sw	s0,8(sp)
8040ee80:	00112623          	sw	ra,12(sp)
8040ee84:	9a1fe0ef          	jal	ra,8040d824 <__alloc_inode>
8040ee88:	00050413          	mv	s0,a0
8040ee8c:	00050a63          	beqz	a0,8040eea0 <dev_create_inode+0x30>
8040ee90:	00000613          	li	a2,0
8040ee94:	00007597          	auipc	a1,0x7
8040ee98:	f0858593          	addi	a1,a1,-248 # 80415d9c <dev_node_ops>
8040ee9c:	9b9fe0ef          	jal	ra,8040d854 <inode_init>
8040eea0:	00040513          	mv	a0,s0
8040eea4:	00c12083          	lw	ra,12(sp)
8040eea8:	00812403          	lw	s0,8(sp)
8040eeac:	01010113          	addi	sp,sp,16
8040eeb0:	00008067          	ret

8040eeb4 <disk0_open>:
8040eeb4:	00000513          	li	a0,0
8040eeb8:	00008067          	ret

8040eebc <disk0_close>:
8040eebc:	00000513          	li	a0,0
8040eec0:	00008067          	ret

8040eec4 <disk0_ioctl>:
8040eec4:	fec00513          	li	a0,-20
8040eec8:	00008067          	ret

8040eecc <disk0_io>:
8040eecc:	fc010113          	addi	sp,sp,-64
8040eed0:	0045a703          	lw	a4,4(a1)
8040eed4:	02812c23          	sw	s0,56(sp)
8040eed8:	00c5a403          	lw	s0,12(a1)
8040eedc:	000016b7          	lui	a3,0x1
8040eee0:	03312623          	sw	s3,44(sp)
8040eee4:	03612023          	sw	s6,32(sp)
8040eee8:	41f75993          	srai	s3,a4,0x1f
8040eeec:	fff68b13          	addi	s6,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040eef0:	008767b3          	or	a5,a4,s0
8040eef4:	0169f9b3          	and	s3,s3,s6
8040eef8:	02112e23          	sw	ra,60(sp)
8040eefc:	02912a23          	sw	s1,52(sp)
8040ef00:	03212823          	sw	s2,48(sp)
8040ef04:	03412423          	sw	s4,40(sp)
8040ef08:	03512223          	sw	s5,36(sp)
8040ef0c:	01712e23          	sw	s7,28(sp)
8040ef10:	01812c23          	sw	s8,24(sp)
8040ef14:	01912a23          	sw	s9,20(sp)
8040ef18:	01a12823          	sw	s10,16(sp)
8040ef1c:	0167f7b3          	and	a5,a5,s6
8040ef20:	00e989b3          	add	s3,s3,a4
8040ef24:	16079263          	bnez	a5,8040f088 <disk0_io+0x1bc>
8040ef28:	00052783          	lw	a5,0(a0)
8040ef2c:	40c9d993          	srai	s3,s3,0xc
8040ef30:	00c45713          	srli	a4,s0,0xc
8040ef34:	00e98733          	add	a4,s3,a4
8040ef38:	14e7e863          	bltu	a5,a4,8040f088 <disk0_io+0x1bc>
8040ef3c:	00000513          	li	a0,0
8040ef40:	02d47e63          	bgeu	s0,a3,8040ef7c <disk0_io+0xb0>
8040ef44:	03c12083          	lw	ra,60(sp)
8040ef48:	03812403          	lw	s0,56(sp)
8040ef4c:	03412483          	lw	s1,52(sp)
8040ef50:	03012903          	lw	s2,48(sp)
8040ef54:	02c12983          	lw	s3,44(sp)
8040ef58:	02812a03          	lw	s4,40(sp)
8040ef5c:	02412a83          	lw	s5,36(sp)
8040ef60:	02012b03          	lw	s6,32(sp)
8040ef64:	01c12b83          	lw	s7,28(sp)
8040ef68:	01812c03          	lw	s8,24(sp)
8040ef6c:	01412c83          	lw	s9,20(sp)
8040ef70:	01012d03          	lw	s10,16(sp)
8040ef74:	04010113          	addi	sp,sp,64
8040ef78:	00008067          	ret
8040ef7c:	0008c517          	auipc	a0,0x8c
8040ef80:	7f850513          	addi	a0,a0,2040 # 8049b774 <disk0_sem>
8040ef84:	00060c13          	mv	s8,a2
8040ef88:	00058b93          	mv	s7,a1
8040ef8c:	0008ea17          	auipc	s4,0x8e
8040ef90:	84ca0a13          	addi	s4,s4,-1972 # 8049c7d8 <disk0_buffer>
8040ef94:	aa8f60ef          	jal	ra,8040523c <down>
8040ef98:	00004cb7          	lui	s9,0x4
8040ef9c:	0600006f          	j	8040effc <disk0_io+0x130>
8040efa0:	00c45493          	srli	s1,s0,0xc
8040efa4:	00349d13          	slli	s10,s1,0x3
8040efa8:	00040913          	mv	s2,s0
8040efac:	00399a93          	slli	s5,s3,0x3
8040efb0:	00058613          	mv	a2,a1
8040efb4:	000d0693          	mv	a3,s10
8040efb8:	000a8593          	mv	a1,s5
8040efbc:	00200513          	li	a0,2
8040efc0:	bc1f10ef          	jal	ra,80400b80 <ide_read_secs>
8040efc4:	10051663          	bnez	a0,8040f0d0 <disk0_io+0x204>
8040efc8:	000a2583          	lw	a1,0(s4)
8040efcc:	00c10713          	addi	a4,sp,12
8040efd0:	00100693          	li	a3,1
8040efd4:	00090613          	mv	a2,s2
8040efd8:	000b8513          	mv	a0,s7
8040efdc:	ec8f70ef          	jal	ra,804066a4 <iobuf_move>
8040efe0:	00c12783          	lw	a5,12(sp)
8040efe4:	0b279663          	bne	a5,s2,8040f090 <disk0_io+0x1c4>
8040efe8:	016977b3          	and	a5,s2,s6
8040efec:	0a079263          	bnez	a5,8040f090 <disk0_io+0x1c4>
8040eff0:	41240433          	sub	s0,s0,s2
8040eff4:	009989b3          	add	s3,s3,s1
8040eff8:	06040e63          	beqz	s0,8040f074 <disk0_io+0x1a8>
8040effc:	000a2583          	lw	a1,0(s4)
8040f000:	000c1c63          	bnez	s8,8040f018 <disk0_io+0x14c>
8040f004:	f9946ee3          	bltu	s0,s9,8040efa0 <disk0_io+0xd4>
8040f008:	02000d13          	li	s10,32
8040f00c:	00400493          	li	s1,4
8040f010:	00004937          	lui	s2,0x4
8040f014:	f99ff06f          	j	8040efac <disk0_io+0xe0>
8040f018:	00c10713          	addi	a4,sp,12
8040f01c:	00000693          	li	a3,0
8040f020:	00004637          	lui	a2,0x4
8040f024:	000b8513          	mv	a0,s7
8040f028:	e7cf70ef          	jal	ra,804066a4 <iobuf_move>
8040f02c:	00c12483          	lw	s1,12(sp)
8040f030:	08048063          	beqz	s1,8040f0b0 <disk0_io+0x1e4>
8040f034:	06946e63          	bltu	s0,s1,8040f0b0 <disk0_io+0x1e4>
8040f038:	0164f7b3          	and	a5,s1,s6
8040f03c:	06079a63          	bnez	a5,8040f0b0 <disk0_io+0x1e4>
8040f040:	00c4d493          	srli	s1,s1,0xc
8040f044:	000a2603          	lw	a2,0(s4)
8040f048:	00399913          	slli	s2,s3,0x3
8040f04c:	00349a93          	slli	s5,s1,0x3
8040f050:	000a8693          	mv	a3,s5
8040f054:	00090593          	mv	a1,s2
8040f058:	00200513          	li	a0,2
8040f05c:	bbdf10ef          	jal	ra,80400c18 <ide_write_secs>
8040f060:	08051e63          	bnez	a0,8040f0fc <disk0_io+0x230>
8040f064:	00c12903          	lw	s2,12(sp)
8040f068:	009989b3          	add	s3,s3,s1
8040f06c:	41240433          	sub	s0,s0,s2
8040f070:	f80416e3          	bnez	s0,8040effc <disk0_io+0x130>
8040f074:	0008c517          	auipc	a0,0x8c
8040f078:	70050513          	addi	a0,a0,1792 # 8049b774 <disk0_sem>
8040f07c:	9bcf60ef          	jal	ra,80405238 <up>
8040f080:	00000513          	li	a0,0
8040f084:	ec1ff06f          	j	8040ef44 <disk0_io+0x78>
8040f088:	ffd00513          	li	a0,-3
8040f08c:	eb9ff06f          	j	8040ef44 <disk0_io+0x78>
8040f090:	00007697          	auipc	a3,0x7
8040f094:	eb868693          	addi	a3,a3,-328 # 80415f48 <dev_node_ops+0x1ac>
8040f098:	00004617          	auipc	a2,0x4
8040f09c:	09460613          	addi	a2,a2,148 # 8041312c <commands+0x1f8>
8040f0a0:	06200593          	li	a1,98
8040f0a4:	00007517          	auipc	a0,0x7
8040f0a8:	df450513          	addi	a0,a0,-524 # 80415e98 <dev_node_ops+0xfc>
8040f0ac:	d78f10ef          	jal	ra,80400624 <__panic>
8040f0b0:	00007697          	auipc	a3,0x7
8040f0b4:	da868693          	addi	a3,a3,-600 # 80415e58 <dev_node_ops+0xbc>
8040f0b8:	00004617          	auipc	a2,0x4
8040f0bc:	07460613          	addi	a2,a2,116 # 8041312c <commands+0x1f8>
8040f0c0:	05700593          	li	a1,87
8040f0c4:	00007517          	auipc	a0,0x7
8040f0c8:	dd450513          	addi	a0,a0,-556 # 80415e98 <dev_node_ops+0xfc>
8040f0cc:	d58f10ef          	jal	ra,80400624 <__panic>
8040f0d0:	00050893          	mv	a7,a0
8040f0d4:	000d0813          	mv	a6,s10
8040f0d8:	00048793          	mv	a5,s1
8040f0dc:	000a8713          	mv	a4,s5
8040f0e0:	00098693          	mv	a3,s3
8040f0e4:	00007617          	auipc	a2,0x7
8040f0e8:	e1c60613          	addi	a2,a2,-484 # 80415f00 <dev_node_ops+0x164>
8040f0ec:	02e00593          	li	a1,46
8040f0f0:	00007517          	auipc	a0,0x7
8040f0f4:	da850513          	addi	a0,a0,-600 # 80415e98 <dev_node_ops+0xfc>
8040f0f8:	d2cf10ef          	jal	ra,80400624 <__panic>
8040f0fc:	00050893          	mv	a7,a0
8040f100:	000a8813          	mv	a6,s5
8040f104:	00048793          	mv	a5,s1
8040f108:	00090713          	mv	a4,s2
8040f10c:	00098693          	mv	a3,s3
8040f110:	00007617          	auipc	a2,0x7
8040f114:	da460613          	addi	a2,a2,-604 # 80415eb4 <dev_node_ops+0x118>
8040f118:	03800593          	li	a1,56
8040f11c:	00007517          	auipc	a0,0x7
8040f120:	d7c50513          	addi	a0,a0,-644 # 80415e98 <dev_node_ops+0xfc>
8040f124:	d00f10ef          	jal	ra,80400624 <__panic>

8040f128 <dev_init_disk0>:
8040f128:	ff010113          	addi	sp,sp,-16
8040f12c:	00112623          	sw	ra,12(sp)
8040f130:	00812423          	sw	s0,8(sp)
8040f134:	00912223          	sw	s1,4(sp)
8040f138:	d39ff0ef          	jal	ra,8040ee70 <dev_create_inode>
8040f13c:	0a050c63          	beqz	a0,8040f1f4 <dev_init_disk0+0xcc>
8040f140:	02c52703          	lw	a4,44(a0)
8040f144:	000014b7          	lui	s1,0x1
8040f148:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f14c:	00050413          	mv	s0,a0
8040f150:	10f71463          	bne	a4,a5,8040f258 <dev_init_disk0+0x130>
8040f154:	00200513          	li	a0,2
8040f158:	9bdf10ef          	jal	ra,80400b14 <ide_device_valid>
8040f15c:	0e050263          	beqz	a0,8040f240 <dev_init_disk0+0x118>
8040f160:	00200513          	li	a0,2
8040f164:	9e5f10ef          	jal	ra,80400b48 <ide_device_size>
8040f168:	00355793          	srli	a5,a0,0x3
8040f16c:	00f42023          	sw	a5,0(s0)
8040f170:	00000797          	auipc	a5,0x0
8040f174:	d4478793          	addi	a5,a5,-700 # 8040eeb4 <disk0_open>
8040f178:	00f42423          	sw	a5,8(s0)
8040f17c:	00000797          	auipc	a5,0x0
8040f180:	d4078793          	addi	a5,a5,-704 # 8040eebc <disk0_close>
8040f184:	00f42623          	sw	a5,12(s0)
8040f188:	00000797          	auipc	a5,0x0
8040f18c:	d4478793          	addi	a5,a5,-700 # 8040eecc <disk0_io>
8040f190:	00f42823          	sw	a5,16(s0)
8040f194:	00000797          	auipc	a5,0x0
8040f198:	d3078793          	addi	a5,a5,-720 # 8040eec4 <disk0_ioctl>
8040f19c:	00f42a23          	sw	a5,20(s0)
8040f1a0:	00100593          	li	a1,1
8040f1a4:	0008c517          	auipc	a0,0x8c
8040f1a8:	5d050513          	addi	a0,a0,1488 # 8049b774 <disk0_sem>
8040f1ac:	00942223          	sw	s1,4(s0)
8040f1b0:	87cf60ef          	jal	ra,8040522c <sem_init>
8040f1b4:	00004537          	lui	a0,0x4
8040f1b8:	8d5f30ef          	jal	ra,80402a8c <kmalloc>
8040f1bc:	0008d797          	auipc	a5,0x8d
8040f1c0:	60a7ae23          	sw	a0,1564(a5) # 8049c7d8 <disk0_buffer>
8040f1c4:	06050263          	beqz	a0,8040f228 <dev_init_disk0+0x100>
8040f1c8:	00100613          	li	a2,1
8040f1cc:	00040593          	mv	a1,s0
8040f1d0:	00007517          	auipc	a0,0x7
8040f1d4:	c6450513          	addi	a0,a0,-924 # 80415e34 <dev_node_ops+0x98>
8040f1d8:	f8dfe0ef          	jal	ra,8040e164 <vfs_add_dev>
8040f1dc:	02051863          	bnez	a0,8040f20c <dev_init_disk0+0xe4>
8040f1e0:	00c12083          	lw	ra,12(sp)
8040f1e4:	00812403          	lw	s0,8(sp)
8040f1e8:	00412483          	lw	s1,4(sp)
8040f1ec:	01010113          	addi	sp,sp,16
8040f1f0:	00008067          	ret
8040f1f4:	00007617          	auipc	a2,0x7
8040f1f8:	be860613          	addi	a2,a2,-1048 # 80415ddc <dev_node_ops+0x40>
8040f1fc:	08700593          	li	a1,135
8040f200:	00007517          	auipc	a0,0x7
8040f204:	c9850513          	addi	a0,a0,-872 # 80415e98 <dev_node_ops+0xfc>
8040f208:	c1cf10ef          	jal	ra,80400624 <__panic>
8040f20c:	00050693          	mv	a3,a0
8040f210:	00007617          	auipc	a2,0x7
8040f214:	c2c60613          	addi	a2,a2,-980 # 80415e3c <dev_node_ops+0xa0>
8040f218:	08d00593          	li	a1,141
8040f21c:	00007517          	auipc	a0,0x7
8040f220:	c7c50513          	addi	a0,a0,-900 # 80415e98 <dev_node_ops+0xfc>
8040f224:	c00f10ef          	jal	ra,80400624 <__panic>
8040f228:	00007617          	auipc	a2,0x7
8040f22c:	bf060613          	addi	a2,a2,-1040 # 80415e18 <dev_node_ops+0x7c>
8040f230:	07f00593          	li	a1,127
8040f234:	00007517          	auipc	a0,0x7
8040f238:	c6450513          	addi	a0,a0,-924 # 80415e98 <dev_node_ops+0xfc>
8040f23c:	be8f10ef          	jal	ra,80400624 <__panic>
8040f240:	00007617          	auipc	a2,0x7
8040f244:	bb860613          	addi	a2,a2,-1096 # 80415df8 <dev_node_ops+0x5c>
8040f248:	07300593          	li	a1,115
8040f24c:	00007517          	auipc	a0,0x7
8040f250:	c4c50513          	addi	a0,a0,-948 # 80415e98 <dev_node_ops+0xfc>
8040f254:	bd0f10ef          	jal	ra,80400624 <__panic>
8040f258:	00007697          	auipc	a3,0x7
8040f25c:	84c68693          	addi	a3,a3,-1972 # 80415aa4 <syscalls+0x73c>
8040f260:	00004617          	auipc	a2,0x4
8040f264:	ecc60613          	addi	a2,a2,-308 # 8041312c <commands+0x1f8>
8040f268:	08900593          	li	a1,137
8040f26c:	00007517          	auipc	a0,0x7
8040f270:	c2c50513          	addi	a0,a0,-980 # 80415e98 <dev_node_ops+0xfc>
8040f274:	bb0f10ef          	jal	ra,80400624 <__panic>

8040f278 <stdin_open>:
8040f278:	00000513          	li	a0,0
8040f27c:	00059463          	bnez	a1,8040f284 <stdin_open+0xc>
8040f280:	00008067          	ret
8040f284:	ffd00513          	li	a0,-3
8040f288:	00008067          	ret

8040f28c <stdin_close>:
8040f28c:	00000513          	li	a0,0
8040f290:	00008067          	ret

8040f294 <stdin_ioctl>:
8040f294:	ffd00513          	li	a0,-3
8040f298:	00008067          	ret

8040f29c <stdin_io>:
8040f29c:	fb010113          	addi	sp,sp,-80
8040f2a0:	04112623          	sw	ra,76(sp)
8040f2a4:	04812423          	sw	s0,72(sp)
8040f2a8:	04912223          	sw	s1,68(sp)
8040f2ac:	05212023          	sw	s2,64(sp)
8040f2b0:	03312e23          	sw	s3,60(sp)
8040f2b4:	03412c23          	sw	s4,56(sp)
8040f2b8:	03512a23          	sw	s5,52(sp)
8040f2bc:	03612823          	sw	s6,48(sp)
8040f2c0:	03712623          	sw	s7,44(sp)
8040f2c4:	03812423          	sw	s8,40(sp)
8040f2c8:	03912223          	sw	s9,36(sp)
8040f2cc:	1a061063          	bnez	a2,8040f46c <stdin_io+0x1d0>
8040f2d0:	00058493          	mv	s1,a1
8040f2d4:	0005ac83          	lw	s9,0(a1)
8040f2d8:	00c5ac03          	lw	s8,12(a1)
8040f2dc:	100027f3          	csrr	a5,sstatus
8040f2e0:	0027f793          	andi	a5,a5,2
8040f2e4:	16079863          	bnez	a5,8040f454 <stdin_io+0x1b8>
8040f2e8:	00000913          	li	s2,0
8040f2ec:	160c0063          	beqz	s8,8040f44c <stdin_io+0x1b0>
8040f2f0:	0008db97          	auipc	s7,0x8d
8040f2f4:	4f4b8b93          	addi	s7,s7,1268 # 8049c7e4 <p_rpos>
8040f2f8:	000ba783          	lw	a5,0(s7)
8040f2fc:	800009b7          	lui	s3,0x80000
8040f300:	00001a37          	lui	s4,0x1
8040f304:	00000413          	li	s0,0
8040f308:	0008db17          	auipc	s6,0x8d
8040f30c:	4e0b0b13          	addi	s6,s6,1248 # 8049c7e8 <p_wpos>
8040f310:	00498993          	addi	s3,s3,4 # 80000004 <end+0xffb63748>
8040f314:	0008da97          	auipc	s5,0x8d
8040f318:	4c8a8a93          	addi	s5,s5,1224 # 8049c7dc <__wait_queue>
8040f31c:	fffa0a13          	addi	s4,s4,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040f320:	000b2703          	lw	a4,0(s6)
8040f324:	02e7de63          	bge	a5,a4,8040f360 <stdin_io+0xc4>
8040f328:	0d80006f          	j	8040f400 <stdin_io+0x164>
8040f32c:	981fd0ef          	jal	ra,8040ccac <schedule>
8040f330:	100027f3          	csrr	a5,sstatus
8040f334:	0027f793          	andi	a5,a5,2
8040f338:	00000913          	li	s2,0
8040f33c:	04079863          	bnez	a5,8040f38c <stdin_io+0xf0>
8040f340:	00c10513          	addi	a0,sp,12
8040f344:	ff1f50ef          	jal	ra,80405334 <wait_in_queue>
8040f348:	04051c63          	bnez	a0,8040f3a0 <stdin_io+0x104>
8040f34c:	01012783          	lw	a5,16(sp)
8040f350:	07379263          	bne	a5,s3,8040f3b4 <stdin_io+0x118>
8040f354:	000ba783          	lw	a5,0(s7)
8040f358:	000b2703          	lw	a4,0(s6)
8040f35c:	0ae7c263          	blt	a5,a4,8040f400 <stdin_io+0x164>
8040f360:	00098613          	mv	a2,s3
8040f364:	00c10593          	addi	a1,sp,12
8040f368:	000a8513          	mv	a0,s5
8040f36c:	8c0f60ef          	jal	ra,8040542c <wait_current_set>
8040f370:	fa090ee3          	beqz	s2,8040f32c <stdin_io+0x90>
8040f374:	93df10ef          	jal	ra,80400cb0 <intr_enable>
8040f378:	935fd0ef          	jal	ra,8040ccac <schedule>
8040f37c:	100027f3          	csrr	a5,sstatus
8040f380:	0027f793          	andi	a5,a5,2
8040f384:	00000913          	li	s2,0
8040f388:	fa078ce3          	beqz	a5,8040f340 <stdin_io+0xa4>
8040f38c:	92df10ef          	jal	ra,80400cb8 <intr_disable>
8040f390:	00c10513          	addi	a0,sp,12
8040f394:	00100913          	li	s2,1
8040f398:	f9df50ef          	jal	ra,80405334 <wait_in_queue>
8040f39c:	fa0508e3          	beqz	a0,8040f34c <stdin_io+0xb0>
8040f3a0:	00c10593          	addi	a1,sp,12
8040f3a4:	000a8513          	mv	a0,s5
8040f3a8:	f2df50ef          	jal	ra,804052d4 <wait_queue_del>
8040f3ac:	01012783          	lw	a5,16(sp)
8040f3b0:	fb3782e3          	beq	a5,s3,8040f354 <stdin_io+0xb8>
8040f3b4:	08091863          	bnez	s2,8040f444 <stdin_io+0x1a8>
8040f3b8:	08040a63          	beqz	s0,8040f44c <stdin_io+0x1b0>
8040f3bc:	00c4a783          	lw	a5,12(s1)
8040f3c0:	408787b3          	sub	a5,a5,s0
8040f3c4:	00f4a623          	sw	a5,12(s1)
8040f3c8:	00040513          	mv	a0,s0
8040f3cc:	04c12083          	lw	ra,76(sp)
8040f3d0:	04812403          	lw	s0,72(sp)
8040f3d4:	04412483          	lw	s1,68(sp)
8040f3d8:	04012903          	lw	s2,64(sp)
8040f3dc:	03c12983          	lw	s3,60(sp)
8040f3e0:	03812a03          	lw	s4,56(sp)
8040f3e4:	03412a83          	lw	s5,52(sp)
8040f3e8:	03012b03          	lw	s6,48(sp)
8040f3ec:	02c12b83          	lw	s7,44(sp)
8040f3f0:	02812c03          	lw	s8,40(sp)
8040f3f4:	02412c83          	lw	s9,36(sp)
8040f3f8:	05010113          	addi	sp,sp,80
8040f3fc:	00008067          	ret
8040f400:	41f7d713          	srai	a4,a5,0x1f
8040f404:	01475693          	srli	a3,a4,0x14
8040f408:	00d78733          	add	a4,a5,a3
8040f40c:	01477733          	and	a4,a4,s4
8040f410:	40d70733          	sub	a4,a4,a3
8040f414:	0008c697          	auipc	a3,0x8c
8040f418:	36c68693          	addi	a3,a3,876 # 8049b780 <stdin_buffer>
8040f41c:	00e68733          	add	a4,a3,a4
8040f420:	00074683          	lbu	a3,0(a4)
8040f424:	00178793          	addi	a5,a5,1
8040f428:	008c8733          	add	a4,s9,s0
8040f42c:	00d70023          	sb	a3,0(a4)
8040f430:	00140413          	addi	s0,s0,1
8040f434:	0008d717          	auipc	a4,0x8d
8040f438:	3af72823          	sw	a5,944(a4) # 8049c7e4 <p_rpos>
8040f43c:	ef8462e3          	bltu	s0,s8,8040f320 <stdin_io+0x84>
8040f440:	f6090ee3          	beqz	s2,8040f3bc <stdin_io+0x120>
8040f444:	86df10ef          	jal	ra,80400cb0 <intr_enable>
8040f448:	f6041ae3          	bnez	s0,8040f3bc <stdin_io+0x120>
8040f44c:	00000413          	li	s0,0
8040f450:	f79ff06f          	j	8040f3c8 <stdin_io+0x12c>
8040f454:	865f10ef          	jal	ra,80400cb8 <intr_disable>
8040f458:	00100913          	li	s2,1
8040f45c:	e80c1ae3          	bnez	s8,8040f2f0 <stdin_io+0x54>
8040f460:	851f10ef          	jal	ra,80400cb0 <intr_enable>
8040f464:	00000413          	li	s0,0
8040f468:	f61ff06f          	j	8040f3c8 <stdin_io+0x12c>
8040f46c:	ffd00413          	li	s0,-3
8040f470:	f59ff06f          	j	8040f3c8 <stdin_io+0x12c>

8040f474 <dev_stdin_write>:
8040f474:	00051463          	bnez	a0,8040f47c <dev_stdin_write+0x8>
8040f478:	00008067          	ret
8040f47c:	ff010113          	addi	sp,sp,-16
8040f480:	00912223          	sw	s1,4(sp)
8040f484:	00112623          	sw	ra,12(sp)
8040f488:	00812423          	sw	s0,8(sp)
8040f48c:	00050493          	mv	s1,a0
8040f490:	100027f3          	csrr	a5,sstatus
8040f494:	0027f793          	andi	a5,a5,2
8040f498:	00000413          	li	s0,0
8040f49c:	0a079a63          	bnez	a5,8040f550 <dev_stdin_write+0xdc>
8040f4a0:	0008d797          	auipc	a5,0x8d
8040f4a4:	34878793          	addi	a5,a5,840 # 8049c7e8 <p_wpos>
8040f4a8:	0007a703          	lw	a4,0(a5)
8040f4ac:	000015b7          	lui	a1,0x1
8040f4b0:	fff58613          	addi	a2,a1,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040f4b4:	41f75693          	srai	a3,a4,0x1f
8040f4b8:	0146d693          	srli	a3,a3,0x14
8040f4bc:	00d707b3          	add	a5,a4,a3
8040f4c0:	00c7f7b3          	and	a5,a5,a2
8040f4c4:	0008d617          	auipc	a2,0x8d
8040f4c8:	32060613          	addi	a2,a2,800 # 8049c7e4 <p_rpos>
8040f4cc:	00062603          	lw	a2,0(a2)
8040f4d0:	40d787b3          	sub	a5,a5,a3
8040f4d4:	0008c697          	auipc	a3,0x8c
8040f4d8:	2ac68693          	addi	a3,a3,684 # 8049b780 <stdin_buffer>
8040f4dc:	00f687b3          	add	a5,a3,a5
8040f4e0:	00978023          	sb	s1,0(a5)
8040f4e4:	40c707b3          	sub	a5,a4,a2
8040f4e8:	00b7d863          	bge	a5,a1,8040f4f8 <dev_stdin_write+0x84>
8040f4ec:	00170713          	addi	a4,a4,1
8040f4f0:	0008d797          	auipc	a5,0x8d
8040f4f4:	2ee7ac23          	sw	a4,760(a5) # 8049c7e8 <p_wpos>
8040f4f8:	0008d517          	auipc	a0,0x8d
8040f4fc:	2e450513          	addi	a0,a0,740 # 8049c7dc <__wait_queue>
8040f500:	e25f50ef          	jal	ra,80405324 <wait_queue_empty>
8040f504:	00050e63          	beqz	a0,8040f520 <dev_stdin_write+0xac>
8040f508:	02041a63          	bnez	s0,8040f53c <dev_stdin_write+0xc8>
8040f50c:	00c12083          	lw	ra,12(sp)
8040f510:	00812403          	lw	s0,8(sp)
8040f514:	00412483          	lw	s1,4(sp)
8040f518:	01010113          	addi	sp,sp,16
8040f51c:	00008067          	ret
8040f520:	800005b7          	lui	a1,0x80000
8040f524:	00100613          	li	a2,1
8040f528:	00458593          	addi	a1,a1,4 # 80000004 <end+0xffb63748>
8040f52c:	0008d517          	auipc	a0,0x8d
8040f530:	2b050513          	addi	a0,a0,688 # 8049c7dc <__wait_queue>
8040f534:	e59f50ef          	jal	ra,8040538c <wakeup_queue>
8040f538:	fc040ae3          	beqz	s0,8040f50c <dev_stdin_write+0x98>
8040f53c:	00812403          	lw	s0,8(sp)
8040f540:	00c12083          	lw	ra,12(sp)
8040f544:	00412483          	lw	s1,4(sp)
8040f548:	01010113          	addi	sp,sp,16
8040f54c:	f64f106f          	j	80400cb0 <intr_enable>
8040f550:	f68f10ef          	jal	ra,80400cb8 <intr_disable>
8040f554:	00100413          	li	s0,1
8040f558:	f49ff06f          	j	8040f4a0 <dev_stdin_write+0x2c>

8040f55c <dev_init_stdin>:
8040f55c:	ff010113          	addi	sp,sp,-16
8040f560:	00112623          	sw	ra,12(sp)
8040f564:	00812423          	sw	s0,8(sp)
8040f568:	909ff0ef          	jal	ra,8040ee70 <dev_create_inode>
8040f56c:	08050c63          	beqz	a0,8040f604 <dev_init_stdin+0xa8>
8040f570:	02c52703          	lw	a4,44(a0)
8040f574:	000017b7          	lui	a5,0x1
8040f578:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f57c:	00050413          	mv	s0,a0
8040f580:	0af71c63          	bne	a4,a5,8040f638 <dev_init_stdin+0xdc>
8040f584:	00100793          	li	a5,1
8040f588:	00f42223          	sw	a5,4(s0)
8040f58c:	00000797          	auipc	a5,0x0
8040f590:	cec78793          	addi	a5,a5,-788 # 8040f278 <stdin_open>
8040f594:	00f42423          	sw	a5,8(s0)
8040f598:	00000797          	auipc	a5,0x0
8040f59c:	cf478793          	addi	a5,a5,-780 # 8040f28c <stdin_close>
8040f5a0:	00f42623          	sw	a5,12(s0)
8040f5a4:	00000797          	auipc	a5,0x0
8040f5a8:	cf878793          	addi	a5,a5,-776 # 8040f29c <stdin_io>
8040f5ac:	00f42823          	sw	a5,16(s0)
8040f5b0:	00000797          	auipc	a5,0x0
8040f5b4:	ce478793          	addi	a5,a5,-796 # 8040f294 <stdin_ioctl>
8040f5b8:	00f42a23          	sw	a5,20(s0)
8040f5bc:	0008d517          	auipc	a0,0x8d
8040f5c0:	22050513          	addi	a0,a0,544 # 8049c7dc <__wait_queue>
8040f5c4:	00042023          	sw	zero,0(s0)
8040f5c8:	0008d797          	auipc	a5,0x8d
8040f5cc:	2207a023          	sw	zero,544(a5) # 8049c7e8 <p_wpos>
8040f5d0:	0008d797          	auipc	a5,0x8d
8040f5d4:	2007aa23          	sw	zero,532(a5) # 8049c7e4 <p_rpos>
8040f5d8:	cf1f50ef          	jal	ra,804052c8 <wait_queue_init>
8040f5dc:	00000613          	li	a2,0
8040f5e0:	00040593          	mv	a1,s0
8040f5e4:	00007517          	auipc	a0,0x7
8040f5e8:	9cc50513          	addi	a0,a0,-1588 # 80415fb0 <dev_node_ops+0x214>
8040f5ec:	b79fe0ef          	jal	ra,8040e164 <vfs_add_dev>
8040f5f0:	02051663          	bnez	a0,8040f61c <dev_init_stdin+0xc0>
8040f5f4:	00c12083          	lw	ra,12(sp)
8040f5f8:	00812403          	lw	s0,8(sp)
8040f5fc:	01010113          	addi	sp,sp,16
8040f600:	00008067          	ret
8040f604:	00007617          	auipc	a2,0x7
8040f608:	97460613          	addi	a2,a2,-1676 # 80415f78 <dev_node_ops+0x1dc>
8040f60c:	07500593          	li	a1,117
8040f610:	00007517          	auipc	a0,0x7
8040f614:	98450513          	addi	a0,a0,-1660 # 80415f94 <dev_node_ops+0x1f8>
8040f618:	80cf10ef          	jal	ra,80400624 <__panic>
8040f61c:	00050693          	mv	a3,a0
8040f620:	00007617          	auipc	a2,0x7
8040f624:	99860613          	addi	a2,a2,-1640 # 80415fb8 <dev_node_ops+0x21c>
8040f628:	07b00593          	li	a1,123
8040f62c:	00007517          	auipc	a0,0x7
8040f630:	96850513          	addi	a0,a0,-1688 # 80415f94 <dev_node_ops+0x1f8>
8040f634:	ff1f00ef          	jal	ra,80400624 <__panic>
8040f638:	00006697          	auipc	a3,0x6
8040f63c:	46c68693          	addi	a3,a3,1132 # 80415aa4 <syscalls+0x73c>
8040f640:	00004617          	auipc	a2,0x4
8040f644:	aec60613          	addi	a2,a2,-1300 # 8041312c <commands+0x1f8>
8040f648:	07700593          	li	a1,119
8040f64c:	00007517          	auipc	a0,0x7
8040f650:	94850513          	addi	a0,a0,-1720 # 80415f94 <dev_node_ops+0x1f8>
8040f654:	fd1f00ef          	jal	ra,80400624 <__panic>

8040f658 <stdout_open>:
8040f658:	00100793          	li	a5,1
8040f65c:	00000513          	li	a0,0
8040f660:	00f59463          	bne	a1,a5,8040f668 <stdout_open+0x10>
8040f664:	00008067          	ret
8040f668:	ffd00513          	li	a0,-3
8040f66c:	00008067          	ret

8040f670 <stdout_close>:
8040f670:	00000513          	li	a0,0
8040f674:	00008067          	ret

8040f678 <stdout_ioctl>:
8040f678:	ffd00513          	li	a0,-3
8040f67c:	00008067          	ret

8040f680 <stdout_io>:
8040f680:	04060c63          	beqz	a2,8040f6d8 <stdout_io+0x58>
8040f684:	00c5a783          	lw	a5,12(a1)
8040f688:	ff010113          	addi	sp,sp,-16
8040f68c:	00812423          	sw	s0,8(sp)
8040f690:	00912223          	sw	s1,4(sp)
8040f694:	00112623          	sw	ra,12(sp)
8040f698:	00058493          	mv	s1,a1
8040f69c:	0005a403          	lw	s0,0(a1)
8040f6a0:	02078063          	beqz	a5,8040f6c0 <stdout_io+0x40>
8040f6a4:	00140413          	addi	s0,s0,1
8040f6a8:	fff44503          	lbu	a0,-1(s0)
8040f6ac:	bb1f00ef          	jal	ra,8040025c <cputchar>
8040f6b0:	00c4a783          	lw	a5,12(s1)
8040f6b4:	fff78793          	addi	a5,a5,-1
8040f6b8:	00f4a623          	sw	a5,12(s1)
8040f6bc:	fe0794e3          	bnez	a5,8040f6a4 <stdout_io+0x24>
8040f6c0:	00c12083          	lw	ra,12(sp)
8040f6c4:	00812403          	lw	s0,8(sp)
8040f6c8:	00412483          	lw	s1,4(sp)
8040f6cc:	00000513          	li	a0,0
8040f6d0:	01010113          	addi	sp,sp,16
8040f6d4:	00008067          	ret
8040f6d8:	ffd00513          	li	a0,-3
8040f6dc:	00008067          	ret

8040f6e0 <dev_init_stdout>:
8040f6e0:	ff010113          	addi	sp,sp,-16
8040f6e4:	00112623          	sw	ra,12(sp)
8040f6e8:	f88ff0ef          	jal	ra,8040ee70 <dev_create_inode>
8040f6ec:	06050a63          	beqz	a0,8040f760 <dev_init_stdout+0x80>
8040f6f0:	02c52703          	lw	a4,44(a0)
8040f6f4:	000017b7          	lui	a5,0x1
8040f6f8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040f6fc:	08f71c63          	bne	a4,a5,8040f794 <dev_init_stdout+0xb4>
8040f700:	00100793          	li	a5,1
8040f704:	00f52223          	sw	a5,4(a0)
8040f708:	00000797          	auipc	a5,0x0
8040f70c:	f5078793          	addi	a5,a5,-176 # 8040f658 <stdout_open>
8040f710:	00f52423          	sw	a5,8(a0)
8040f714:	00000797          	auipc	a5,0x0
8040f718:	f5c78793          	addi	a5,a5,-164 # 8040f670 <stdout_close>
8040f71c:	00f52623          	sw	a5,12(a0)
8040f720:	00000797          	auipc	a5,0x0
8040f724:	f6078793          	addi	a5,a5,-160 # 8040f680 <stdout_io>
8040f728:	00f52823          	sw	a5,16(a0)
8040f72c:	00000797          	auipc	a5,0x0
8040f730:	f4c78793          	addi	a5,a5,-180 # 8040f678 <stdout_ioctl>
8040f734:	00052023          	sw	zero,0(a0)
8040f738:	00f52a23          	sw	a5,20(a0)
8040f73c:	00050593          	mv	a1,a0
8040f740:	00000613          	li	a2,0
8040f744:	00007517          	auipc	a0,0x7
8040f748:	8c850513          	addi	a0,a0,-1848 # 8041600c <dev_node_ops+0x270>
8040f74c:	a19fe0ef          	jal	ra,8040e164 <vfs_add_dev>
8040f750:	02051463          	bnez	a0,8040f778 <dev_init_stdout+0x98>
8040f754:	00c12083          	lw	ra,12(sp)
8040f758:	01010113          	addi	sp,sp,16
8040f75c:	00008067          	ret
8040f760:	00007617          	auipc	a2,0x7
8040f764:	87460613          	addi	a2,a2,-1932 # 80415fd4 <dev_node_ops+0x238>
8040f768:	03700593          	li	a1,55
8040f76c:	00007517          	auipc	a0,0x7
8040f770:	88450513          	addi	a0,a0,-1916 # 80415ff0 <dev_node_ops+0x254>
8040f774:	eb1f00ef          	jal	ra,80400624 <__panic>
8040f778:	00050693          	mv	a3,a0
8040f77c:	00007617          	auipc	a2,0x7
8040f780:	89860613          	addi	a2,a2,-1896 # 80416014 <dev_node_ops+0x278>
8040f784:	03d00593          	li	a1,61
8040f788:	00007517          	auipc	a0,0x7
8040f78c:	86850513          	addi	a0,a0,-1944 # 80415ff0 <dev_node_ops+0x254>
8040f790:	e95f00ef          	jal	ra,80400624 <__panic>
8040f794:	00006697          	auipc	a3,0x6
8040f798:	31068693          	addi	a3,a3,784 # 80415aa4 <syscalls+0x73c>
8040f79c:	00004617          	auipc	a2,0x4
8040f7a0:	99060613          	addi	a2,a2,-1648 # 8041312c <commands+0x1f8>
8040f7a4:	03900593          	li	a1,57
8040f7a8:	00007517          	auipc	a0,0x7
8040f7ac:	84850513          	addi	a0,a0,-1976 # 80415ff0 <dev_node_ops+0x254>
8040f7b0:	e75f00ef          	jal	ra,80400624 <__panic>

8040f7b4 <bitmap_translate.isra.0.part.1>:
8040f7b4:	ff010113          	addi	sp,sp,-16
8040f7b8:	00007697          	auipc	a3,0x7
8040f7bc:	8f068693          	addi	a3,a3,-1808 # 804160a8 <dev_node_ops+0x30c>
8040f7c0:	00004617          	auipc	a2,0x4
8040f7c4:	96c60613          	addi	a2,a2,-1684 # 8041312c <commands+0x1f8>
8040f7c8:	04c00593          	li	a1,76
8040f7cc:	00007517          	auipc	a0,0x7
8040f7d0:	8f450513          	addi	a0,a0,-1804 # 804160c0 <dev_node_ops+0x324>
8040f7d4:	00112623          	sw	ra,12(sp)
8040f7d8:	e4df00ef          	jal	ra,80400624 <__panic>

8040f7dc <bitmap_create>:
8040f7dc:	fe010113          	addi	sp,sp,-32
8040f7e0:	00112e23          	sw	ra,28(sp)
8040f7e4:	00812c23          	sw	s0,24(sp)
8040f7e8:	00912a23          	sw	s1,20(sp)
8040f7ec:	01212823          	sw	s2,16(sp)
8040f7f0:	01312623          	sw	s3,12(sp)
8040f7f4:	01412423          	sw	s4,8(sp)
8040f7f8:	fff50713          	addi	a4,a0,-1
8040f7fc:	fde00793          	li	a5,-34
8040f800:	0ce7e663          	bltu	a5,a4,8040f8cc <bitmap_create+0xf0>
8040f804:	00050413          	mv	s0,a0
8040f808:	00c00513          	li	a0,12
8040f80c:	a80f30ef          	jal	ra,80402a8c <kmalloc>
8040f810:	00050493          	mv	s1,a0
8040f814:	08050263          	beqz	a0,8040f898 <bitmap_create+0xbc>
8040f818:	01f40993          	addi	s3,s0,31
8040f81c:	0059d913          	srli	s2,s3,0x5
8040f820:	00291a13          	slli	s4,s2,0x2
8040f824:	000a0513          	mv	a0,s4
8040f828:	a64f30ef          	jal	ra,80402a8c <kmalloc>
8040f82c:	08050863          	beqz	a0,8040f8bc <bitmap_create+0xe0>
8040f830:	0084a023          	sw	s0,0(s1)
8040f834:	0124a223          	sw	s2,4(s1)
8040f838:	000a0613          	mv	a2,s4
8040f83c:	0ff00593          	li	a1,255
8040f840:	480030ef          	jal	ra,80412cc0 <memset>
8040f844:	00a4a423          	sw	a0,8(s1)
8040f848:	fe09f993          	andi	s3,s3,-32
8040f84c:	04898663          	beq	s3,s0,8040f898 <bitmap_create+0xbc>
8040f850:	fff90913          	addi	s2,s2,-1 # 3fff <_binary_bin_swap_img_size-0x4001>
8040f854:	00591793          	slli	a5,s2,0x5
8040f858:	00545713          	srli	a4,s0,0x5
8040f85c:	40f407b3          	sub	a5,s0,a5
8040f860:	0b271663          	bne	a4,s2,8040f90c <bitmap_create+0x130>
8040f864:	fff78693          	addi	a3,a5,-1
8040f868:	01e00613          	li	a2,30
8040f86c:	08d66063          	bltu	a2,a3,8040f8ec <bitmap_create+0x110>
8040f870:	00271713          	slli	a4,a4,0x2
8040f874:	00e50533          	add	a0,a0,a4
8040f878:	00052703          	lw	a4,0(a0)
8040f87c:	00100593          	li	a1,1
8040f880:	02000613          	li	a2,32
8040f884:	00f596b3          	sll	a3,a1,a5
8040f888:	00178793          	addi	a5,a5,1
8040f88c:	00d74733          	xor	a4,a4,a3
8040f890:	fec79ae3          	bne	a5,a2,8040f884 <bitmap_create+0xa8>
8040f894:	00e52023          	sw	a4,0(a0)
8040f898:	01c12083          	lw	ra,28(sp)
8040f89c:	01812403          	lw	s0,24(sp)
8040f8a0:	00048513          	mv	a0,s1
8040f8a4:	01012903          	lw	s2,16(sp)
8040f8a8:	01412483          	lw	s1,20(sp)
8040f8ac:	00c12983          	lw	s3,12(sp)
8040f8b0:	00812a03          	lw	s4,8(sp)
8040f8b4:	02010113          	addi	sp,sp,32
8040f8b8:	00008067          	ret
8040f8bc:	00048513          	mv	a0,s1
8040f8c0:	af0f30ef          	jal	ra,80402bb0 <kfree>
8040f8c4:	00000493          	li	s1,0
8040f8c8:	fd1ff06f          	j	8040f898 <bitmap_create+0xbc>
8040f8cc:	00006697          	auipc	a3,0x6
8040f8d0:	76468693          	addi	a3,a3,1892 # 80416030 <dev_node_ops+0x294>
8040f8d4:	00004617          	auipc	a2,0x4
8040f8d8:	85860613          	addi	a2,a2,-1960 # 8041312c <commands+0x1f8>
8040f8dc:	01500593          	li	a1,21
8040f8e0:	00006517          	auipc	a0,0x6
8040f8e4:	7e050513          	addi	a0,a0,2016 # 804160c0 <dev_node_ops+0x324>
8040f8e8:	d3df00ef          	jal	ra,80400624 <__panic>
8040f8ec:	00006697          	auipc	a3,0x6
8040f8f0:	78468693          	addi	a3,a3,1924 # 80416070 <dev_node_ops+0x2d4>
8040f8f4:	00004617          	auipc	a2,0x4
8040f8f8:	83860613          	addi	a2,a2,-1992 # 8041312c <commands+0x1f8>
8040f8fc:	02b00593          	li	a1,43
8040f900:	00006517          	auipc	a0,0x6
8040f904:	7c050513          	addi	a0,a0,1984 # 804160c0 <dev_node_ops+0x324>
8040f908:	d1df00ef          	jal	ra,80400624 <__panic>
8040f90c:	00006697          	auipc	a3,0x6
8040f910:	74c68693          	addi	a3,a3,1868 # 80416058 <dev_node_ops+0x2bc>
8040f914:	00004617          	auipc	a2,0x4
8040f918:	81860613          	addi	a2,a2,-2024 # 8041312c <commands+0x1f8>
8040f91c:	02a00593          	li	a1,42
8040f920:	00006517          	auipc	a0,0x6
8040f924:	7a050513          	addi	a0,a0,1952 # 804160c0 <dev_node_ops+0x324>
8040f928:	cfdf00ef          	jal	ra,80400624 <__panic>

8040f92c <bitmap_alloc>:
8040f92c:	00452603          	lw	a2,4(a0)
8040f930:	00852803          	lw	a6,8(a0)
8040f934:	02060663          	beqz	a2,8040f960 <bitmap_alloc+0x34>
8040f938:	00082703          	lw	a4,0(a6)
8040f93c:	00480793          	addi	a5,a6,4
8040f940:	00070c63          	beqz	a4,8040f958 <bitmap_alloc+0x2c>
8040f944:	0240006f          	j	8040f968 <bitmap_alloc+0x3c>
8040f948:	00078813          	mv	a6,a5
8040f94c:	00478793          	addi	a5,a5,4
8040f950:	ffc7a683          	lw	a3,-4(a5)
8040f954:	00069e63          	bnez	a3,8040f970 <bitmap_alloc+0x44>
8040f958:	00170713          	addi	a4,a4,1
8040f95c:	fee616e3          	bne	a2,a4,8040f948 <bitmap_alloc+0x1c>
8040f960:	ffc00513          	li	a0,-4
8040f964:	00008067          	ret
8040f968:	00070693          	mv	a3,a4
8040f96c:	00000713          	li	a4,0
8040f970:	00000793          	li	a5,0
8040f974:	00100893          	li	a7,1
8040f978:	02000313          	li	t1,32
8040f97c:	00c0006f          	j	8040f988 <bitmap_alloc+0x5c>
8040f980:	00178793          	addi	a5,a5,1
8040f984:	02678663          	beq	a5,t1,8040f9b0 <bitmap_alloc+0x84>
8040f988:	00f89633          	sll	a2,a7,a5
8040f98c:	00c6f533          	and	a0,a3,a2
8040f990:	fe0508e3          	beqz	a0,8040f980 <bitmap_alloc+0x54>
8040f994:	00c6c6b3          	xor	a3,a3,a2
8040f998:	00571713          	slli	a4,a4,0x5
8040f99c:	00d82023          	sw	a3,0(a6)
8040f9a0:	00f70733          	add	a4,a4,a5
8040f9a4:	00e5a023          	sw	a4,0(a1)
8040f9a8:	00000513          	li	a0,0
8040f9ac:	00008067          	ret
8040f9b0:	ff010113          	addi	sp,sp,-16
8040f9b4:	00005697          	auipc	a3,0x5
8040f9b8:	af068693          	addi	a3,a3,-1296 # 804144a4 <default_pmm_manager+0x83c>
8040f9bc:	00003617          	auipc	a2,0x3
8040f9c0:	77060613          	addi	a2,a2,1904 # 8041312c <commands+0x1f8>
8040f9c4:	04300593          	li	a1,67
8040f9c8:	00006517          	auipc	a0,0x6
8040f9cc:	6f850513          	addi	a0,a0,1784 # 804160c0 <dev_node_ops+0x324>
8040f9d0:	00112623          	sw	ra,12(sp)
8040f9d4:	c51f00ef          	jal	ra,80400624 <__panic>

8040f9d8 <bitmap_test>:
8040f9d8:	00052783          	lw	a5,0(a0)
8040f9dc:	02f5f463          	bgeu	a1,a5,8040fa04 <bitmap_test+0x2c>
8040f9e0:	00852783          	lw	a5,8(a0)
8040f9e4:	0055d713          	srli	a4,a1,0x5
8040f9e8:	00271713          	slli	a4,a4,0x2
8040f9ec:	00e787b3          	add	a5,a5,a4
8040f9f0:	0007a503          	lw	a0,0(a5)
8040f9f4:	00100793          	li	a5,1
8040f9f8:	00b795b3          	sll	a1,a5,a1
8040f9fc:	00a5f533          	and	a0,a1,a0
8040fa00:	00008067          	ret
8040fa04:	ff010113          	addi	sp,sp,-16
8040fa08:	00112623          	sw	ra,12(sp)
8040fa0c:	da9ff0ef          	jal	ra,8040f7b4 <bitmap_translate.isra.0.part.1>

8040fa10 <bitmap_free>:
8040fa10:	00052783          	lw	a5,0(a0)
8040fa14:	ff010113          	addi	sp,sp,-16
8040fa18:	00112623          	sw	ra,12(sp)
8040fa1c:	02f5fe63          	bgeu	a1,a5,8040fa58 <bitmap_free+0x48>
8040fa20:	00852783          	lw	a5,8(a0)
8040fa24:	0055d713          	srli	a4,a1,0x5
8040fa28:	00271713          	slli	a4,a4,0x2
8040fa2c:	00e787b3          	add	a5,a5,a4
8040fa30:	0007a703          	lw	a4,0(a5)
8040fa34:	00100693          	li	a3,1
8040fa38:	00b695b3          	sll	a1,a3,a1
8040fa3c:	00b776b3          	and	a3,a4,a1
8040fa40:	00069e63          	bnez	a3,8040fa5c <bitmap_free+0x4c>
8040fa44:	00c12083          	lw	ra,12(sp)
8040fa48:	00b76733          	or	a4,a4,a1
8040fa4c:	00e7a023          	sw	a4,0(a5)
8040fa50:	01010113          	addi	sp,sp,16
8040fa54:	00008067          	ret
8040fa58:	d5dff0ef          	jal	ra,8040f7b4 <bitmap_translate.isra.0.part.1>
8040fa5c:	00006697          	auipc	a3,0x6
8040fa60:	63c68693          	addi	a3,a3,1596 # 80416098 <dev_node_ops+0x2fc>
8040fa64:	00003617          	auipc	a2,0x3
8040fa68:	6c860613          	addi	a2,a2,1736 # 8041312c <commands+0x1f8>
8040fa6c:	05f00593          	li	a1,95
8040fa70:	00006517          	auipc	a0,0x6
8040fa74:	65050513          	addi	a0,a0,1616 # 804160c0 <dev_node_ops+0x324>
8040fa78:	badf00ef          	jal	ra,80400624 <__panic>

8040fa7c <bitmap_destroy>:
8040fa7c:	ff010113          	addi	sp,sp,-16
8040fa80:	00812423          	sw	s0,8(sp)
8040fa84:	00050413          	mv	s0,a0
8040fa88:	00852503          	lw	a0,8(a0)
8040fa8c:	00112623          	sw	ra,12(sp)
8040fa90:	920f30ef          	jal	ra,80402bb0 <kfree>
8040fa94:	00040513          	mv	a0,s0
8040fa98:	00812403          	lw	s0,8(sp)
8040fa9c:	00c12083          	lw	ra,12(sp)
8040faa0:	01010113          	addi	sp,sp,16
8040faa4:	90cf306f          	j	80402bb0 <kfree>

8040faa8 <bitmap_getdata>:
8040faa8:	00058863          	beqz	a1,8040fab8 <bitmap_getdata+0x10>
8040faac:	00452783          	lw	a5,4(a0)
8040fab0:	00279793          	slli	a5,a5,0x2
8040fab4:	00f5a023          	sw	a5,0(a1)
8040fab8:	00852503          	lw	a0,8(a0)
8040fabc:	00008067          	ret

8040fac0 <sfs_init>:
8040fac0:	ff010113          	addi	sp,sp,-16
8040fac4:	00006517          	auipc	a0,0x6
8040fac8:	37050513          	addi	a0,a0,880 # 80415e34 <dev_node_ops+0x98>
8040facc:	00112623          	sw	ra,12(sp)
8040fad0:	784000ef          	jal	ra,80410254 <sfs_mount>
8040fad4:	00051863          	bnez	a0,8040fae4 <sfs_init+0x24>
8040fad8:	00c12083          	lw	ra,12(sp)
8040fadc:	01010113          	addi	sp,sp,16
8040fae0:	00008067          	ret
8040fae4:	00050693          	mv	a3,a0
8040fae8:	00006617          	auipc	a2,0x6
8040faec:	5f060613          	addi	a2,a2,1520 # 804160d8 <dev_node_ops+0x33c>
8040faf0:	01000593          	li	a1,16
8040faf4:	00006517          	auipc	a0,0x6
8040faf8:	60450513          	addi	a0,a0,1540 # 804160f8 <dev_node_ops+0x35c>
8040fafc:	b29f00ef          	jal	ra,80400624 <__panic>

8040fb00 <sfs_sync>:
8040fb00:	fe010113          	addi	sp,sp,-32
8040fb04:	00112e23          	sw	ra,28(sp)
8040fb08:	00812c23          	sw	s0,24(sp)
8040fb0c:	00912a23          	sw	s1,20(sp)
8040fb10:	01212823          	sw	s2,16(sp)
8040fb14:	01312623          	sw	s3,12(sp)
8040fb18:	01412423          	sw	s4,8(sp)
8040fb1c:	12050a63          	beqz	a0,8040fc50 <sfs_sync+0x150>
8040fb20:	06c52783          	lw	a5,108(a0)
8040fb24:	00050a13          	mv	s4,a0
8040fb28:	12079463          	bnez	a5,8040fc50 <sfs_sync+0x150>
8040fb2c:	135020ef          	jal	ra,80412460 <lock_sfs_fs>
8040fb30:	064a2403          	lw	s0,100(s4)
8040fb34:	060a0913          	addi	s2,s4,96
8040fb38:	06890263          	beq	s2,s0,8040fb9c <sfs_sync+0x9c>
8040fb3c:	fe440493          	addi	s1,s0,-28
8040fb40:	0e048863          	beqz	s1,8040fc30 <sfs_sync+0x130>
8040fb44:	02042783          	lw	a5,32(s0)
8040fb48:	0e078463          	beqz	a5,8040fc30 <sfs_sync+0x130>
8040fb4c:	0187a783          	lw	a5,24(a5)
8040fb50:	0e078063          	beqz	a5,8040fc30 <sfs_sync+0x130>
8040fb54:	00005997          	auipc	s3,0x5
8040fb58:	b9098993          	addi	s3,s3,-1136 # 804146e4 <CSWTCH.69+0x17c>
8040fb5c:	01c0006f          	j	8040fb78 <sfs_sync+0x78>
8040fb60:	fe440493          	addi	s1,s0,-28
8040fb64:	0c048663          	beqz	s1,8040fc30 <sfs_sync+0x130>
8040fb68:	02042783          	lw	a5,32(s0)
8040fb6c:	0c078263          	beqz	a5,8040fc30 <sfs_sync+0x130>
8040fb70:	0187a783          	lw	a5,24(a5)
8040fb74:	0a078e63          	beqz	a5,8040fc30 <sfs_sync+0x130>
8040fb78:	00098593          	mv	a1,s3
8040fb7c:	00048513          	mv	a0,s1
8040fb80:	d79fd0ef          	jal	ra,8040d8f8 <inode_check>
8040fb84:	02042783          	lw	a5,32(s0)
8040fb88:	00048513          	mv	a0,s1
8040fb8c:	0187a783          	lw	a5,24(a5)
8040fb90:	000780e7          	jalr	a5
8040fb94:	00442403          	lw	s0,4(s0)
8040fb98:	fc8914e3          	bne	s2,s0,8040fb60 <sfs_sync+0x60>
8040fb9c:	000a0513          	mv	a0,s4
8040fba0:	0d1020ef          	jal	ra,80412470 <unlock_sfs_fs>
8040fba4:	034a2503          	lw	a0,52(s4)
8040fba8:	02051263          	bnez	a0,8040fbcc <sfs_sync+0xcc>
8040fbac:	01c12083          	lw	ra,28(sp)
8040fbb0:	01812403          	lw	s0,24(sp)
8040fbb4:	01412483          	lw	s1,20(sp)
8040fbb8:	01012903          	lw	s2,16(sp)
8040fbbc:	00c12983          	lw	s3,12(sp)
8040fbc0:	00812a03          	lw	s4,8(sp)
8040fbc4:	02010113          	addi	sp,sp,32
8040fbc8:	00008067          	ret
8040fbcc:	020a2a23          	sw	zero,52(s4)
8040fbd0:	000a0513          	mv	a0,s4
8040fbd4:	700020ef          	jal	ra,804122d4 <sfs_sync_super>
8040fbd8:	02050663          	beqz	a0,8040fc04 <sfs_sync+0x104>
8040fbdc:	01c12083          	lw	ra,28(sp)
8040fbe0:	01812403          	lw	s0,24(sp)
8040fbe4:	00100793          	li	a5,1
8040fbe8:	02fa2a23          	sw	a5,52(s4)
8040fbec:	01412483          	lw	s1,20(sp)
8040fbf0:	01012903          	lw	s2,16(sp)
8040fbf4:	00c12983          	lw	s3,12(sp)
8040fbf8:	00812a03          	lw	s4,8(sp)
8040fbfc:	02010113          	addi	sp,sp,32
8040fc00:	00008067          	ret
8040fc04:	000a0513          	mv	a0,s4
8040fc08:	744020ef          	jal	ra,8041234c <sfs_sync_freemap>
8040fc0c:	fc0518e3          	bnez	a0,8040fbdc <sfs_sync+0xdc>
8040fc10:	01c12083          	lw	ra,28(sp)
8040fc14:	01812403          	lw	s0,24(sp)
8040fc18:	01412483          	lw	s1,20(sp)
8040fc1c:	01012903          	lw	s2,16(sp)
8040fc20:	00c12983          	lw	s3,12(sp)
8040fc24:	00812a03          	lw	s4,8(sp)
8040fc28:	02010113          	addi	sp,sp,32
8040fc2c:	00008067          	ret
8040fc30:	00005697          	auipc	a3,0x5
8040fc34:	a6468693          	addi	a3,a3,-1436 # 80414694 <CSWTCH.69+0x12c>
8040fc38:	00003617          	auipc	a2,0x3
8040fc3c:	4f460613          	addi	a2,a2,1268 # 8041312c <commands+0x1f8>
8040fc40:	01b00593          	li	a1,27
8040fc44:	00006517          	auipc	a0,0x6
8040fc48:	62c50513          	addi	a0,a0,1580 # 80416270 <dev_node_ops+0x4d4>
8040fc4c:	9d9f00ef          	jal	ra,80400624 <__panic>
8040fc50:	00006697          	auipc	a3,0x6
8040fc54:	5f468693          	addi	a3,a3,1524 # 80416244 <dev_node_ops+0x4a8>
8040fc58:	00003617          	auipc	a2,0x3
8040fc5c:	4d460613          	addi	a2,a2,1236 # 8041312c <commands+0x1f8>
8040fc60:	01500593          	li	a1,21
8040fc64:	00006517          	auipc	a0,0x6
8040fc68:	60c50513          	addi	a0,a0,1548 # 80416270 <dev_node_ops+0x4d4>
8040fc6c:	9b9f00ef          	jal	ra,80400624 <__panic>

8040fc70 <sfs_init_read>:
8040fc70:	fe010113          	addi	sp,sp,-32
8040fc74:	00060793          	mv	a5,a2
8040fc78:	00812c23          	sw	s0,24(sp)
8040fc7c:	00c59693          	slli	a3,a1,0xc
8040fc80:	00050413          	mv	s0,a0
8040fc84:	00078593          	mv	a1,a5
8040fc88:	00001637          	lui	a2,0x1
8040fc8c:	00010513          	mv	a0,sp
8040fc90:	00112e23          	sw	ra,28(sp)
8040fc94:	9fdf60ef          	jal	ra,80406690 <iobuf_init>
8040fc98:	01042783          	lw	a5,16(s0)
8040fc9c:	00050593          	mv	a1,a0
8040fca0:	00000613          	li	a2,0
8040fca4:	00040513          	mv	a0,s0
8040fca8:	000780e7          	jalr	a5
8040fcac:	01c12083          	lw	ra,28(sp)
8040fcb0:	01812403          	lw	s0,24(sp)
8040fcb4:	02010113          	addi	sp,sp,32
8040fcb8:	00008067          	ret

8040fcbc <sfs_unmount>:
8040fcbc:	ff010113          	addi	sp,sp,-16
8040fcc0:	00112623          	sw	ra,12(sp)
8040fcc4:	00812423          	sw	s0,8(sp)
8040fcc8:	00912223          	sw	s1,4(sp)
8040fccc:	06050263          	beqz	a0,8040fd30 <sfs_unmount+0x74>
8040fcd0:	06c52783          	lw	a5,108(a0)
8040fcd4:	00050413          	mv	s0,a0
8040fcd8:	04079c63          	bnez	a5,8040fd30 <sfs_unmount+0x74>
8040fcdc:	06452703          	lw	a4,100(a0)
8040fce0:	06050793          	addi	a5,a0,96
8040fce4:	04f71263          	bne	a4,a5,8040fd28 <sfs_unmount+0x6c>
8040fce8:	03452483          	lw	s1,52(a0)
8040fcec:	06049263          	bnez	s1,8040fd50 <sfs_unmount+0x94>
8040fcf0:	03052503          	lw	a0,48(a0)
8040fcf4:	d89ff0ef          	jal	ra,8040fa7c <bitmap_destroy>
8040fcf8:	03842503          	lw	a0,56(s0)
8040fcfc:	eb5f20ef          	jal	ra,80402bb0 <kfree>
8040fd00:	06842503          	lw	a0,104(s0)
8040fd04:	eadf20ef          	jal	ra,80402bb0 <kfree>
8040fd08:	00040513          	mv	a0,s0
8040fd0c:	ea5f20ef          	jal	ra,80402bb0 <kfree>
8040fd10:	00c12083          	lw	ra,12(sp)
8040fd14:	00812403          	lw	s0,8(sp)
8040fd18:	00048513          	mv	a0,s1
8040fd1c:	00412483          	lw	s1,4(sp)
8040fd20:	01010113          	addi	sp,sp,16
8040fd24:	00008067          	ret
8040fd28:	ff100493          	li	s1,-15
8040fd2c:	fe5ff06f          	j	8040fd10 <sfs_unmount+0x54>
8040fd30:	00006697          	auipc	a3,0x6
8040fd34:	51468693          	addi	a3,a3,1300 # 80416244 <dev_node_ops+0x4a8>
8040fd38:	00003617          	auipc	a2,0x3
8040fd3c:	3f460613          	addi	a2,a2,1012 # 8041312c <commands+0x1f8>
8040fd40:	04100593          	li	a1,65
8040fd44:	00006517          	auipc	a0,0x6
8040fd48:	52c50513          	addi	a0,a0,1324 # 80416270 <dev_node_ops+0x4d4>
8040fd4c:	8d9f00ef          	jal	ra,80400624 <__panic>
8040fd50:	00006697          	auipc	a3,0x6
8040fd54:	53868693          	addi	a3,a3,1336 # 80416288 <dev_node_ops+0x4ec>
8040fd58:	00003617          	auipc	a2,0x3
8040fd5c:	3d460613          	addi	a2,a2,980 # 8041312c <commands+0x1f8>
8040fd60:	04500593          	li	a1,69
8040fd64:	00006517          	auipc	a0,0x6
8040fd68:	50c50513          	addi	a0,a0,1292 # 80416270 <dev_node_ops+0x4d4>
8040fd6c:	8b9f00ef          	jal	ra,80400624 <__panic>

8040fd70 <sfs_cleanup>:
8040fd70:	ff010113          	addi	sp,sp,-16
8040fd74:	00112623          	sw	ra,12(sp)
8040fd78:	00812423          	sw	s0,8(sp)
8040fd7c:	00912223          	sw	s1,4(sp)
8040fd80:	01212023          	sw	s2,0(sp)
8040fd84:	08050e63          	beqz	a0,8040fe20 <sfs_cleanup+0xb0>
8040fd88:	06c52783          	lw	a5,108(a0)
8040fd8c:	00050493          	mv	s1,a0
8040fd90:	08079863          	bnez	a5,8040fe20 <sfs_cleanup+0xb0>
8040fd94:	00452703          	lw	a4,4(a0)
8040fd98:	00852683          	lw	a3,8(a0)
8040fd9c:	00c50913          	addi	s2,a0,12
8040fda0:	00090593          	mv	a1,s2
8040fda4:	40d70633          	sub	a2,a4,a3
8040fda8:	00006517          	auipc	a0,0x6
8040fdac:	36450513          	addi	a0,a0,868 # 8041610c <dev_node_ops+0x370>
8040fdb0:	c4cf00ef          	jal	ra,804001fc <cprintf>
8040fdb4:	02000413          	li	s0,32
8040fdb8:	00c0006f          	j	8040fdc4 <sfs_cleanup+0x54>
8040fdbc:	fff40413          	addi	s0,s0,-1
8040fdc0:	02040663          	beqz	s0,8040fdec <sfs_cleanup+0x7c>
8040fdc4:	0704a783          	lw	a5,112(s1)
8040fdc8:	00048513          	mv	a0,s1
8040fdcc:	000780e7          	jalr	a5
8040fdd0:	fe0516e3          	bnez	a0,8040fdbc <sfs_cleanup+0x4c>
8040fdd4:	00c12083          	lw	ra,12(sp)
8040fdd8:	00812403          	lw	s0,8(sp)
8040fddc:	00412483          	lw	s1,4(sp)
8040fde0:	00012903          	lw	s2,0(sp)
8040fde4:	01010113          	addi	sp,sp,16
8040fde8:	00008067          	ret
8040fdec:	00812403          	lw	s0,8(sp)
8040fdf0:	00c12083          	lw	ra,12(sp)
8040fdf4:	00412483          	lw	s1,4(sp)
8040fdf8:	00090693          	mv	a3,s2
8040fdfc:	00012903          	lw	s2,0(sp)
8040fe00:	00050713          	mv	a4,a0
8040fe04:	00006617          	auipc	a2,0x6
8040fe08:	32860613          	addi	a2,a2,808 # 8041612c <dev_node_ops+0x390>
8040fe0c:	05f00593          	li	a1,95
8040fe10:	00006517          	auipc	a0,0x6
8040fe14:	46050513          	addi	a0,a0,1120 # 80416270 <dev_node_ops+0x4d4>
8040fe18:	01010113          	addi	sp,sp,16
8040fe1c:	88df006f          	j	804006a8 <__warn>
8040fe20:	00006697          	auipc	a3,0x6
8040fe24:	42468693          	addi	a3,a3,1060 # 80416244 <dev_node_ops+0x4a8>
8040fe28:	00003617          	auipc	a2,0x3
8040fe2c:	30460613          	addi	a2,a2,772 # 8041312c <commands+0x1f8>
8040fe30:	05400593          	li	a1,84
8040fe34:	00006517          	auipc	a0,0x6
8040fe38:	43c50513          	addi	a0,a0,1084 # 80416270 <dev_node_ops+0x4d4>
8040fe3c:	fe8f00ef          	jal	ra,80400624 <__panic>

8040fe40 <sfs_get_root>:
8040fe40:	fe010113          	addi	sp,sp,-32
8040fe44:	00112e23          	sw	ra,28(sp)
8040fe48:	02050663          	beqz	a0,8040fe74 <sfs_get_root+0x34>
8040fe4c:	06c52783          	lw	a5,108(a0)
8040fe50:	02079263          	bnez	a5,8040fe74 <sfs_get_root+0x34>
8040fe54:	00100613          	li	a2,1
8040fe58:	00c10593          	addi	a1,sp,12
8040fe5c:	0e5010ef          	jal	ra,80411740 <sfs_load_inode>
8040fe60:	02051a63          	bnez	a0,8040fe94 <sfs_get_root+0x54>
8040fe64:	01c12083          	lw	ra,28(sp)
8040fe68:	00c12503          	lw	a0,12(sp)
8040fe6c:	02010113          	addi	sp,sp,32
8040fe70:	00008067          	ret
8040fe74:	00006697          	auipc	a3,0x6
8040fe78:	3d068693          	addi	a3,a3,976 # 80416244 <dev_node_ops+0x4a8>
8040fe7c:	00003617          	auipc	a2,0x3
8040fe80:	2b060613          	addi	a2,a2,688 # 8041312c <commands+0x1f8>
8040fe84:	03600593          	li	a1,54
8040fe88:	00006517          	auipc	a0,0x6
8040fe8c:	3e850513          	addi	a0,a0,1000 # 80416270 <dev_node_ops+0x4d4>
8040fe90:	f94f00ef          	jal	ra,80400624 <__panic>
8040fe94:	00050693          	mv	a3,a0
8040fe98:	00006617          	auipc	a2,0x6
8040fe9c:	39060613          	addi	a2,a2,912 # 80416228 <dev_node_ops+0x48c>
8040fea0:	03700593          	li	a1,55
8040fea4:	00006517          	auipc	a0,0x6
8040fea8:	3cc50513          	addi	a0,a0,972 # 80416270 <dev_node_ops+0x4d4>
8040feac:	f78f00ef          	jal	ra,80400624 <__panic>

8040feb0 <sfs_do_mount>:
8040feb0:	00452703          	lw	a4,4(a0)
8040feb4:	fa010113          	addi	sp,sp,-96
8040feb8:	04112e23          	sw	ra,92(sp)
8040febc:	04812c23          	sw	s0,88(sp)
8040fec0:	04912a23          	sw	s1,84(sp)
8040fec4:	05212823          	sw	s2,80(sp)
8040fec8:	05312623          	sw	s3,76(sp)
8040fecc:	05412423          	sw	s4,72(sp)
8040fed0:	05512223          	sw	s5,68(sp)
8040fed4:	05612023          	sw	s6,64(sp)
8040fed8:	03712e23          	sw	s7,60(sp)
8040fedc:	03812c23          	sw	s8,56(sp)
8040fee0:	03912a23          	sw	s9,52(sp)
8040fee4:	03a12823          	sw	s10,48(sp)
8040fee8:	03b12623          	sw	s11,44(sp)
8040feec:	000017b7          	lui	a5,0x1
8040fef0:	2ef71263          	bne	a4,a5,804101d4 <sfs_do_mount+0x324>
8040fef4:	00050913          	mv	s2,a0
8040fef8:	00000513          	li	a0,0
8040fefc:	00058a93          	mv	s5,a1
8040ff00:	c85fd0ef          	jal	ra,8040db84 <__alloc_fs>
8040ff04:	00050413          	mv	s0,a0
8040ff08:	2e050263          	beqz	a0,804101ec <sfs_do_mount+0x33c>
8040ff0c:	06c52a03          	lw	s4,108(a0)
8040ff10:	300a1263          	bnez	s4,80410214 <sfs_do_mount+0x364>
8040ff14:	03252623          	sw	s2,44(a0)
8040ff18:	00001537          	lui	a0,0x1
8040ff1c:	b71f20ef          	jal	ra,80402a8c <kmalloc>
8040ff20:	02a42c23          	sw	a0,56(s0)
8040ff24:	00050493          	mv	s1,a0
8040ff28:	1a050c63          	beqz	a0,804100e0 <sfs_do_mount+0x230>
8040ff2c:	00050613          	mv	a2,a0
8040ff30:	00000593          	li	a1,0
8040ff34:	00090513          	mv	a0,s2
8040ff38:	d39ff0ef          	jal	ra,8040fc70 <sfs_init_read>
8040ff3c:	00050b13          	mv	s6,a0
8040ff40:	14051863          	bnez	a0,80410090 <sfs_do_mount+0x1e0>
8040ff44:	0004a583          	lw	a1,0(s1)
8040ff48:	2f8dc637          	lui	a2,0x2f8dc
8040ff4c:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f863e2a>
8040ff50:	1ac59863          	bne	a1,a2,80410100 <sfs_do_mount+0x250>
8040ff54:	0044a783          	lw	a5,4(s1)
8040ff58:	00092603          	lw	a2,0(s2)
8040ff5c:	18f66663          	bltu	a2,a5,804100e8 <sfs_do_mount+0x238>
8040ff60:	020485a3          	sb	zero,43(s1)
8040ff64:	0084af03          	lw	t5,8(s1)
8040ff68:	00c4ae83          	lw	t4,12(s1)
8040ff6c:	0104ae03          	lw	t3,16(s1)
8040ff70:	0144a303          	lw	t1,20(s1)
8040ff74:	0184a883          	lw	a7,24(s1)
8040ff78:	01c4a803          	lw	a6,28(s1)
8040ff7c:	0204a603          	lw	a2,32(s1)
8040ff80:	0244a683          	lw	a3,36(s1)
8040ff84:	0284a703          	lw	a4,40(s1)
8040ff88:	00002537          	lui	a0,0x2
8040ff8c:	00f42223          	sw	a5,4(s0)
8040ff90:	00b42023          	sw	a1,0(s0)
8040ff94:	01e42423          	sw	t5,8(s0)
8040ff98:	01d42623          	sw	t4,12(s0)
8040ff9c:	01c42823          	sw	t3,16(s0)
8040ffa0:	00642a23          	sw	t1,20(s0)
8040ffa4:	01142c23          	sw	a7,24(s0)
8040ffa8:	01042e23          	sw	a6,28(s0)
8040ffac:	02c42023          	sw	a2,32(s0)
8040ffb0:	02d42223          	sw	a3,36(s0)
8040ffb4:	02e42423          	sw	a4,40(s0)
8040ffb8:	ad5f20ef          	jal	ra,80402a8c <kmalloc>
8040ffbc:	00a12423          	sw	a0,8(sp)
8040ffc0:	06a42423          	sw	a0,104(s0)
8040ffc4:	00050793          	mv	a5,a0
8040ffc8:	20050a63          	beqz	a0,804101dc <sfs_do_mount+0x32c>
8040ffcc:	00002737          	lui	a4,0x2
8040ffd0:	00e50733          	add	a4,a0,a4
8040ffd4:	00f7a223          	sw	a5,4(a5) # 1004 <_binary_bin_swap_img_size-0x6ffc>
8040ffd8:	00f7a023          	sw	a5,0(a5)
8040ffdc:	00878793          	addi	a5,a5,8
8040ffe0:	fee79ae3          	bne	a5,a4,8040ffd4 <sfs_do_mount+0x124>
8040ffe4:	0044ab83          	lw	s7,4(s1)
8040ffe8:	00008737          	lui	a4,0x8
8040ffec:	fff70993          	addi	s3,a4,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8040fff0:	ffff87b7          	lui	a5,0xffff8
8040fff4:	013b8bb3          	add	s7,s7,s3
8040fff8:	00fbfbb3          	and	s7,s7,a5
8040fffc:	000b8513          	mv	a0,s7
80410000:	fdcff0ef          	jal	ra,8040f7dc <bitmap_create>
80410004:	02a42823          	sw	a0,48(s0)
80410008:	00050c93          	mv	s9,a0
8041000c:	1c050063          	beqz	a0,804101cc <sfs_do_mount+0x31c>
80410010:	0044a703          	lw	a4,4(s1)
80410014:	01c10593          	addi	a1,sp,28
80410018:	01370733          	add	a4,a4,s3
8041001c:	00f75713          	srli	a4,a4,0xf
80410020:	00e12623          	sw	a4,12(sp)
80410024:	a85ff0ef          	jal	ra,8040faa8 <bitmap_getdata>
80410028:	00050c13          	mv	s8,a0
8041002c:	1c050463          	beqz	a0,804101f4 <sfs_do_mount+0x344>
80410030:	00c12703          	lw	a4,12(sp)
80410034:	01c12683          	lw	a3,28(sp)
80410038:	00c71613          	slli	a2,a4,0xc
8041003c:	1ad61c63          	bne	a2,a3,804101f4 <sfs_do_mount+0x344>
80410040:	00200993          	li	s3,2
80410044:	00001db7          	lui	s11,0x1
80410048:	00270d13          	addi	s10,a4,2
8041004c:	00071a63          	bnez	a4,80410060 <sfs_do_mount+0x1b0>
80410050:	0c40006f          	j	80410114 <sfs_do_mount+0x264>
80410054:	00198993          	addi	s3,s3,1
80410058:	01bc0c33          	add	s8,s8,s11
8041005c:	0ba98c63          	beq	s3,s10,80410114 <sfs_do_mount+0x264>
80410060:	000c0613          	mv	a2,s8
80410064:	00098593          	mv	a1,s3
80410068:	00090513          	mv	a0,s2
8041006c:	c05ff0ef          	jal	ra,8040fc70 <sfs_init_read>
80410070:	fe0502e3          	beqz	a0,80410054 <sfs_do_mount+0x1a4>
80410074:	00a12623          	sw	a0,12(sp)
80410078:	000c8513          	mv	a0,s9
8041007c:	a01ff0ef          	jal	ra,8040fa7c <bitmap_destroy>
80410080:	00c12703          	lw	a4,12(sp)
80410084:	00070b13          	mv	s6,a4
80410088:	00812503          	lw	a0,8(sp)
8041008c:	b25f20ef          	jal	ra,80402bb0 <kfree>
80410090:	00048513          	mv	a0,s1
80410094:	b1df20ef          	jal	ra,80402bb0 <kfree>
80410098:	00040513          	mv	a0,s0
8041009c:	b15f20ef          	jal	ra,80402bb0 <kfree>
804100a0:	05c12083          	lw	ra,92(sp)
804100a4:	05812403          	lw	s0,88(sp)
804100a8:	000b0513          	mv	a0,s6
804100ac:	05412483          	lw	s1,84(sp)
804100b0:	05012903          	lw	s2,80(sp)
804100b4:	04c12983          	lw	s3,76(sp)
804100b8:	04812a03          	lw	s4,72(sp)
804100bc:	04412a83          	lw	s5,68(sp)
804100c0:	04012b03          	lw	s6,64(sp)
804100c4:	03c12b83          	lw	s7,60(sp)
804100c8:	03812c03          	lw	s8,56(sp)
804100cc:	03412c83          	lw	s9,52(sp)
804100d0:	03012d03          	lw	s10,48(sp)
804100d4:	02c12d83          	lw	s11,44(sp)
804100d8:	06010113          	addi	sp,sp,96
804100dc:	00008067          	ret
804100e0:	ffc00b13          	li	s6,-4
804100e4:	fb5ff06f          	j	80410098 <sfs_do_mount+0x1e8>
804100e8:	00078593          	mv	a1,a5
804100ec:	00006517          	auipc	a0,0x6
804100f0:	09450513          	addi	a0,a0,148 # 80416180 <dev_node_ops+0x3e4>
804100f4:	908f00ef          	jal	ra,804001fc <cprintf>
804100f8:	ffd00b13          	li	s6,-3
804100fc:	f95ff06f          	j	80410090 <sfs_do_mount+0x1e0>
80410100:	00006517          	auipc	a0,0x6
80410104:	04850513          	addi	a0,a0,72 # 80416148 <dev_node_ops+0x3ac>
80410108:	8f4f00ef          	jal	ra,804001fc <cprintf>
8041010c:	ffd00b13          	li	s6,-3
80410110:	f81ff06f          	j	80410090 <sfs_do_mount+0x1e0>
80410114:	00442903          	lw	s2,4(s0)
80410118:	00000493          	li	s1,0
8041011c:	0c0b8463          	beqz	s7,804101e4 <sfs_do_mount+0x334>
80410120:	00048593          	mv	a1,s1
80410124:	000c8513          	mv	a0,s9
80410128:	8b1ff0ef          	jal	ra,8040f9d8 <bitmap_test>
8041012c:	00a03533          	snez	a0,a0
80410130:	00148493          	addi	s1,s1,1
80410134:	00aa0a33          	add	s4,s4,a0
80410138:	fe9b94e3          	bne	s7,s1,80410120 <sfs_do_mount+0x270>
8041013c:	00842783          	lw	a5,8(s0)
80410140:	0f479a63          	bne	a5,s4,80410234 <sfs_do_mount+0x384>
80410144:	00100593          	li	a1,1
80410148:	03c40513          	addi	a0,s0,60
8041014c:	02042a23          	sw	zero,52(s0)
80410150:	8dcf50ef          	jal	ra,8040522c <sem_init>
80410154:	00100593          	li	a1,1
80410158:	04840513          	addi	a0,s0,72
8041015c:	8d0f50ef          	jal	ra,8040522c <sem_init>
80410160:	00100593          	li	a1,1
80410164:	05440513          	addi	a0,s0,84
80410168:	8c4f50ef          	jal	ra,8040522c <sem_init>
8041016c:	06040793          	addi	a5,s0,96
80410170:	06f42223          	sw	a5,100(s0)
80410174:	06f42023          	sw	a5,96(s0)
80410178:	00090713          	mv	a4,s2
8041017c:	000a0693          	mv	a3,s4
80410180:	41490633          	sub	a2,s2,s4
80410184:	00c40593          	addi	a1,s0,12
80410188:	00006517          	auipc	a0,0x6
8041018c:	08050513          	addi	a0,a0,128 # 80416208 <dev_node_ops+0x46c>
80410190:	86cf00ef          	jal	ra,804001fc <cprintf>
80410194:	00000797          	auipc	a5,0x0
80410198:	96c78793          	addi	a5,a5,-1684 # 8040fb00 <sfs_sync>
8041019c:	06f42823          	sw	a5,112(s0)
804101a0:	00000797          	auipc	a5,0x0
804101a4:	ca078793          	addi	a5,a5,-864 # 8040fe40 <sfs_get_root>
804101a8:	06f42a23          	sw	a5,116(s0)
804101ac:	00000797          	auipc	a5,0x0
804101b0:	b1078793          	addi	a5,a5,-1264 # 8040fcbc <sfs_unmount>
804101b4:	06f42c23          	sw	a5,120(s0)
804101b8:	00000797          	auipc	a5,0x0
804101bc:	bb878793          	addi	a5,a5,-1096 # 8040fd70 <sfs_cleanup>
804101c0:	06f42e23          	sw	a5,124(s0)
804101c4:	008aa023          	sw	s0,0(s5)
804101c8:	ed9ff06f          	j	804100a0 <sfs_do_mount+0x1f0>
804101cc:	ffc00b13          	li	s6,-4
804101d0:	eb9ff06f          	j	80410088 <sfs_do_mount+0x1d8>
804101d4:	ff200b13          	li	s6,-14
804101d8:	ec9ff06f          	j	804100a0 <sfs_do_mount+0x1f0>
804101dc:	ffc00b13          	li	s6,-4
804101e0:	eb1ff06f          	j	80410090 <sfs_do_mount+0x1e0>
804101e4:	00000a13          	li	s4,0
804101e8:	f55ff06f          	j	8041013c <sfs_do_mount+0x28c>
804101ec:	ffc00b13          	li	s6,-4
804101f0:	eb1ff06f          	j	804100a0 <sfs_do_mount+0x1f0>
804101f4:	00006697          	auipc	a3,0x6
804101f8:	fbc68693          	addi	a3,a3,-68 # 804161b0 <dev_node_ops+0x414>
804101fc:	00003617          	auipc	a2,0x3
80410200:	f3060613          	addi	a2,a2,-208 # 8041312c <commands+0x1f8>
80410204:	08300593          	li	a1,131
80410208:	00006517          	auipc	a0,0x6
8041020c:	06850513          	addi	a0,a0,104 # 80416270 <dev_node_ops+0x4d4>
80410210:	c14f00ef          	jal	ra,80400624 <__panic>
80410214:	00006697          	auipc	a3,0x6
80410218:	03068693          	addi	a3,a3,48 # 80416244 <dev_node_ops+0x4a8>
8041021c:	00003617          	auipc	a2,0x3
80410220:	f1060613          	addi	a2,a2,-240 # 8041312c <commands+0x1f8>
80410224:	0a300593          	li	a1,163
80410228:	00006517          	auipc	a0,0x6
8041022c:	04850513          	addi	a0,a0,72 # 80416270 <dev_node_ops+0x4d4>
80410230:	bf4f00ef          	jal	ra,80400624 <__panic>
80410234:	00006697          	auipc	a3,0x6
80410238:	fa868693          	addi	a3,a3,-88 # 804161dc <dev_node_ops+0x440>
8041023c:	00003617          	auipc	a2,0x3
80410240:	ef060613          	addi	a2,a2,-272 # 8041312c <commands+0x1f8>
80410244:	0e000593          	li	a1,224
80410248:	00006517          	auipc	a0,0x6
8041024c:	02850513          	addi	a0,a0,40 # 80416270 <dev_node_ops+0x4d4>
80410250:	bd4f00ef          	jal	ra,80400624 <__panic>

80410254 <sfs_mount>:
80410254:	00000597          	auipc	a1,0x0
80410258:	c5c58593          	addi	a1,a1,-932 # 8040feb0 <sfs_do_mount>
8041025c:	f15fd06f          	j	8040e170 <vfs_mount>

80410260 <sfs_opendir>:
80410260:	0235f593          	andi	a1,a1,35
80410264:	00000513          	li	a0,0
80410268:	00059463          	bnez	a1,80410270 <sfs_opendir+0x10>
8041026c:	00008067          	ret
80410270:	fef00513          	li	a0,-17
80410274:	00008067          	ret

80410278 <sfs_openfile>:
80410278:	00000513          	li	a0,0
8041027c:	00008067          	ret

80410280 <sfs_fsync>:
80410280:	fe010113          	addi	sp,sp,-32
80410284:	01212823          	sw	s2,16(sp)
80410288:	03852903          	lw	s2,56(a0)
8041028c:	00112e23          	sw	ra,28(sp)
80410290:	00812c23          	sw	s0,24(sp)
80410294:	00912a23          	sw	s1,20(sp)
80410298:	01312623          	sw	s3,12(sp)
8041029c:	0a090a63          	beqz	s2,80410350 <sfs_fsync+0xd0>
804102a0:	06c92783          	lw	a5,108(s2)
804102a4:	0a079663          	bnez	a5,80410350 <sfs_fsync+0xd0>
804102a8:	02c52703          	lw	a4,44(a0)
804102ac:	000017b7          	lui	a5,0x1
804102b0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804102b4:	00050413          	mv	s0,a0
804102b8:	0af71c63          	bne	a4,a5,80410370 <sfs_fsync+0xf0>
804102bc:	00852483          	lw	s1,8(a0)
804102c0:	02049263          	bnez	s1,804102e4 <sfs_fsync+0x64>
804102c4:	01c12083          	lw	ra,28(sp)
804102c8:	01812403          	lw	s0,24(sp)
804102cc:	00048513          	mv	a0,s1
804102d0:	01012903          	lw	s2,16(sp)
804102d4:	01412483          	lw	s1,20(sp)
804102d8:	00c12983          	lw	s3,12(sp)
804102dc:	02010113          	addi	sp,sp,32
804102e0:	00008067          	ret
804102e4:	01050993          	addi	s3,a0,16
804102e8:	00098513          	mv	a0,s3
804102ec:	f51f40ef          	jal	ra,8040523c <down>
804102f0:	00842483          	lw	s1,8(s0)
804102f4:	02049663          	bnez	s1,80410320 <sfs_fsync+0xa0>
804102f8:	00098513          	mv	a0,s3
804102fc:	f3df40ef          	jal	ra,80405238 <up>
80410300:	01c12083          	lw	ra,28(sp)
80410304:	01812403          	lw	s0,24(sp)
80410308:	00048513          	mv	a0,s1
8041030c:	01012903          	lw	s2,16(sp)
80410310:	01412483          	lw	s1,20(sp)
80410314:	00c12983          	lw	s3,12(sp)
80410318:	02010113          	addi	sp,sp,32
8041031c:	00008067          	ret
80410320:	00442683          	lw	a3,4(s0)
80410324:	00042583          	lw	a1,0(s0)
80410328:	00042423          	sw	zero,8(s0)
8041032c:	00000713          	li	a4,0
80410330:	04000613          	li	a2,64
80410334:	00090513          	mv	a0,s2
80410338:	691010ef          	jal	ra,804121c8 <sfs_wbuf>
8041033c:	00050493          	mv	s1,a0
80410340:	fa050ce3          	beqz	a0,804102f8 <sfs_fsync+0x78>
80410344:	00100793          	li	a5,1
80410348:	00f42423          	sw	a5,8(s0)
8041034c:	fadff06f          	j	804102f8 <sfs_fsync+0x78>
80410350:	00006697          	auipc	a3,0x6
80410354:	ef468693          	addi	a3,a3,-268 # 80416244 <dev_node_ops+0x4a8>
80410358:	00003617          	auipc	a2,0x3
8041035c:	dd460613          	addi	a2,a2,-556 # 8041312c <commands+0x1f8>
80410360:	2c700593          	li	a1,711
80410364:	00006517          	auipc	a0,0x6
80410368:	07c50513          	addi	a0,a0,124 # 804163e0 <dev_node_ops+0x644>
8041036c:	ab8f00ef          	jal	ra,80400624 <__panic>
80410370:	00006697          	auipc	a3,0x6
80410374:	08868693          	addi	a3,a3,136 # 804163f8 <dev_node_ops+0x65c>
80410378:	00003617          	auipc	a2,0x3
8041037c:	db460613          	addi	a2,a2,-588 # 8041312c <commands+0x1f8>
80410380:	2c800593          	li	a1,712
80410384:	00006517          	auipc	a0,0x6
80410388:	05c50513          	addi	a0,a0,92 # 804163e0 <dev_node_ops+0x644>
8041038c:	a98f00ef          	jal	ra,80400624 <__panic>

80410390 <sfs_gettype>:
80410390:	ff010113          	addi	sp,sp,-16
80410394:	00112623          	sw	ra,12(sp)
80410398:	06050e63          	beqz	a0,80410414 <sfs_gettype+0x84>
8041039c:	02c52683          	lw	a3,44(a0)
804103a0:	000017b7          	lui	a5,0x1
804103a4:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804103a8:	06e69663          	bne	a3,a4,80410414 <sfs_gettype+0x84>
804103ac:	00052683          	lw	a3,0(a0)
804103b0:	00200713          	li	a4,2
804103b4:	0046d683          	lhu	a3,4(a3)
804103b8:	04e68263          	beq	a3,a4,804103fc <sfs_gettype+0x6c>
804103bc:	00300713          	li	a4,3
804103c0:	02e68263          	beq	a3,a4,804103e4 <sfs_gettype+0x54>
804103c4:	00100713          	li	a4,1
804103c8:	02e68063          	beq	a3,a4,804103e8 <sfs_gettype+0x58>
804103cc:	00006617          	auipc	a2,0x6
804103d0:	06460613          	addi	a2,a2,100 # 80416430 <dev_node_ops+0x694>
804103d4:	38f00593          	li	a1,911
804103d8:	00006517          	auipc	a0,0x6
804103dc:	00850513          	addi	a0,a0,8 # 804163e0 <dev_node_ops+0x644>
804103e0:	a44f00ef          	jal	ra,80400624 <__panic>
804103e4:	000037b7          	lui	a5,0x3
804103e8:	00c12083          	lw	ra,12(sp)
804103ec:	00f5a023          	sw	a5,0(a1)
804103f0:	00000513          	li	a0,0
804103f4:	01010113          	addi	sp,sp,16
804103f8:	00008067          	ret
804103fc:	00c12083          	lw	ra,12(sp)
80410400:	000027b7          	lui	a5,0x2
80410404:	00f5a023          	sw	a5,0(a1)
80410408:	00000513          	li	a0,0
8041040c:	01010113          	addi	sp,sp,16
80410410:	00008067          	ret
80410414:	00006697          	auipc	a3,0x6
80410418:	fe468693          	addi	a3,a3,-28 # 804163f8 <dev_node_ops+0x65c>
8041041c:	00003617          	auipc	a2,0x3
80410420:	d1060613          	addi	a2,a2,-752 # 8041312c <commands+0x1f8>
80410424:	38300593          	li	a1,899
80410428:	00006517          	auipc	a0,0x6
8041042c:	fb850513          	addi	a0,a0,-72 # 804163e0 <dev_node_ops+0x644>
80410430:	9f4f00ef          	jal	ra,80400624 <__panic>

80410434 <sfs_block_inuse.isra.3>:
80410434:	ff010113          	addi	sp,sp,-16
80410438:	00112623          	sw	ra,12(sp)
8041043c:	02060263          	beqz	a2,80410460 <sfs_block_inuse.isra.3+0x2c>
80410440:	02a67063          	bgeu	a2,a0,80410460 <sfs_block_inuse.isra.3+0x2c>
80410444:	0005a503          	lw	a0,0(a1)
80410448:	00060593          	mv	a1,a2
8041044c:	d8cff0ef          	jal	ra,8040f9d8 <bitmap_test>
80410450:	00c12083          	lw	ra,12(sp)
80410454:	00153513          	seqz	a0,a0
80410458:	01010113          	addi	sp,sp,16
8041045c:	00008067          	ret
80410460:	00060713          	mv	a4,a2
80410464:	00050693          	mv	a3,a0
80410468:	00006617          	auipc	a2,0x6
8041046c:	e7860613          	addi	a2,a2,-392 # 804162e0 <dev_node_ops+0x544>
80410470:	05300593          	li	a1,83
80410474:	00006517          	auipc	a0,0x6
80410478:	f6c50513          	addi	a0,a0,-148 # 804163e0 <dev_node_ops+0x644>
8041047c:	9a8f00ef          	jal	ra,80400624 <__panic>

80410480 <sfs_block_alloc>:
80410480:	ff010113          	addi	sp,sp,-16
80410484:	00812423          	sw	s0,8(sp)
80410488:	00050413          	mv	s0,a0
8041048c:	03052503          	lw	a0,48(a0)
80410490:	00912223          	sw	s1,4(sp)
80410494:	00112623          	sw	ra,12(sp)
80410498:	00058493          	mv	s1,a1
8041049c:	c90ff0ef          	jal	ra,8040f92c <bitmap_alloc>
804104a0:	04051863          	bnez	a0,804104f0 <sfs_block_alloc+0x70>
804104a4:	00842783          	lw	a5,8(s0)
804104a8:	06078e63          	beqz	a5,80410524 <sfs_block_alloc+0xa4>
804104ac:	fff78793          	addi	a5,a5,-1 # 1fff <_binary_bin_swap_img_size-0x6001>
804104b0:	00f42423          	sw	a5,8(s0)
804104b4:	00100793          	li	a5,1
804104b8:	02f42a23          	sw	a5,52(s0)
804104bc:	0004a603          	lw	a2,0(s1)
804104c0:	00442503          	lw	a0,4(s0)
804104c4:	03040593          	addi	a1,s0,48
804104c8:	f6dff0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
804104cc:	02050c63          	beqz	a0,80410504 <sfs_block_alloc+0x84>
804104d0:	00040513          	mv	a0,s0
804104d4:	00812403          	lw	s0,8(sp)
804104d8:	0004a583          	lw	a1,0(s1)
804104dc:	00c12083          	lw	ra,12(sp)
804104e0:	00412483          	lw	s1,4(sp)
804104e4:	00100613          	li	a2,1
804104e8:	01010113          	addi	sp,sp,16
804104ec:	6bd0106f          	j	804123a8 <sfs_clear_block>
804104f0:	00c12083          	lw	ra,12(sp)
804104f4:	00812403          	lw	s0,8(sp)
804104f8:	00412483          	lw	s1,4(sp)
804104fc:	01010113          	addi	sp,sp,16
80410500:	00008067          	ret
80410504:	00006697          	auipc	a3,0x6
80410508:	db868693          	addi	a3,a3,-584 # 804162bc <dev_node_ops+0x520>
8041050c:	00003617          	auipc	a2,0x3
80410510:	c2060613          	addi	a2,a2,-992 # 8041312c <commands+0x1f8>
80410514:	06100593          	li	a1,97
80410518:	00006517          	auipc	a0,0x6
8041051c:	ec850513          	addi	a0,a0,-312 # 804163e0 <dev_node_ops+0x644>
80410520:	904f00ef          	jal	ra,80400624 <__panic>
80410524:	00006697          	auipc	a3,0x6
80410528:	d7868693          	addi	a3,a3,-648 # 8041629c <dev_node_ops+0x500>
8041052c:	00003617          	auipc	a2,0x3
80410530:	c0060613          	addi	a2,a2,-1024 # 8041312c <commands+0x1f8>
80410534:	05f00593          	li	a1,95
80410538:	00006517          	auipc	a0,0x6
8041053c:	ea850513          	addi	a0,a0,-344 # 804163e0 <dev_node_ops+0x644>
80410540:	8e4f00ef          	jal	ra,80400624 <__panic>

80410544 <sfs_block_free>:
80410544:	ff010113          	addi	sp,sp,-16
80410548:	00812423          	sw	s0,8(sp)
8041054c:	00050413          	mv	s0,a0
80410550:	00452503          	lw	a0,4(a0)
80410554:	00912223          	sw	s1,4(sp)
80410558:	00058613          	mv	a2,a1
8041055c:	00058493          	mv	s1,a1
80410560:	03040593          	addi	a1,s0,48
80410564:	00112623          	sw	ra,12(sp)
80410568:	ecdff0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
8041056c:	02050c63          	beqz	a0,804105a4 <sfs_block_free+0x60>
80410570:	03042503          	lw	a0,48(s0)
80410574:	00048593          	mv	a1,s1
80410578:	c98ff0ef          	jal	ra,8040fa10 <bitmap_free>
8041057c:	00842783          	lw	a5,8(s0)
80410580:	00100713          	li	a4,1
80410584:	02e42a23          	sw	a4,52(s0)
80410588:	00178793          	addi	a5,a5,1
8041058c:	00f42423          	sw	a5,8(s0)
80410590:	00c12083          	lw	ra,12(sp)
80410594:	00812403          	lw	s0,8(sp)
80410598:	00412483          	lw	s1,4(sp)
8041059c:	01010113          	addi	sp,sp,16
804105a0:	00008067          	ret
804105a4:	00006697          	auipc	a3,0x6
804105a8:	dd468693          	addi	a3,a3,-556 # 80416378 <dev_node_ops+0x5dc>
804105ac:	00003617          	auipc	a2,0x3
804105b0:	b8060613          	addi	a2,a2,-1152 # 8041312c <commands+0x1f8>
804105b4:	06a00593          	li	a1,106
804105b8:	00006517          	auipc	a0,0x6
804105bc:	e2850513          	addi	a0,a0,-472 # 804163e0 <dev_node_ops+0x644>
804105c0:	864f00ef          	jal	ra,80400624 <__panic>

804105c4 <sfs_reclaim>:
804105c4:	ff010113          	addi	sp,sp,-16
804105c8:	00912223          	sw	s1,4(sp)
804105cc:	03852483          	lw	s1,56(a0)
804105d0:	00112623          	sw	ra,12(sp)
804105d4:	00812423          	sw	s0,8(sp)
804105d8:	01212023          	sw	s2,0(sp)
804105dc:	16048c63          	beqz	s1,80410754 <sfs_reclaim+0x190>
804105e0:	06c4a783          	lw	a5,108(s1)
804105e4:	16079863          	bnez	a5,80410754 <sfs_reclaim+0x190>
804105e8:	02c52703          	lw	a4,44(a0)
804105ec:	000017b7          	lui	a5,0x1
804105f0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804105f4:	00050413          	mv	s0,a0
804105f8:	18f71e63          	bne	a4,a5,80410794 <sfs_reclaim+0x1d0>
804105fc:	00048513          	mv	a0,s1
80410600:	661010ef          	jal	ra,80412460 <lock_sfs_fs>
80410604:	00c42783          	lw	a5,12(s0)
80410608:	16f05663          	blez	a5,80410774 <sfs_reclaim+0x1b0>
8041060c:	fff78793          	addi	a5,a5,-1
80410610:	00f42623          	sw	a5,12(s0)
80410614:	0e079463          	bnez	a5,804106fc <sfs_reclaim+0x138>
80410618:	03042903          	lw	s2,48(s0)
8041061c:	0e091063          	bnez	s2,804106fc <sfs_reclaim+0x138>
80410620:	00042783          	lw	a5,0(s0)
80410624:	0067d783          	lhu	a5,6(a5)
80410628:	02079e63          	bnez	a5,80410664 <sfs_reclaim+0xa0>
8041062c:	03c42783          	lw	a5,60(s0)
80410630:	18078263          	beqz	a5,804107b4 <sfs_reclaim+0x1f0>
80410634:	0307a783          	lw	a5,48(a5)
80410638:	16078e63          	beqz	a5,804107b4 <sfs_reclaim+0x1f0>
8041063c:	00005597          	auipc	a1,0x5
80410640:	5ec58593          	addi	a1,a1,1516 # 80415c28 <syscalls+0x8c0>
80410644:	00040513          	mv	a0,s0
80410648:	ab0fd0ef          	jal	ra,8040d8f8 <inode_check>
8041064c:	03c42783          	lw	a5,60(s0)
80410650:	00000593          	li	a1,0
80410654:	00040513          	mv	a0,s0
80410658:	0307a783          	lw	a5,48(a5)
8041065c:	000780e7          	jalr	a5
80410660:	0e051663          	bnez	a0,8041074c <sfs_reclaim+0x188>
80410664:	00842783          	lw	a5,8(s0)
80410668:	02078c63          	beqz	a5,804106a0 <sfs_reclaim+0xdc>
8041066c:	03c42783          	lw	a5,60(s0)
80410670:	16078263          	beqz	a5,804107d4 <sfs_reclaim+0x210>
80410674:	0187a783          	lw	a5,24(a5)
80410678:	14078e63          	beqz	a5,804107d4 <sfs_reclaim+0x210>
8041067c:	00040513          	mv	a0,s0
80410680:	00004597          	auipc	a1,0x4
80410684:	06458593          	addi	a1,a1,100 # 804146e4 <CSWTCH.69+0x17c>
80410688:	a70fd0ef          	jal	ra,8040d8f8 <inode_check>
8041068c:	03c42783          	lw	a5,60(s0)
80410690:	00040513          	mv	a0,s0
80410694:	0187a783          	lw	a5,24(a5)
80410698:	000780e7          	jalr	a5
8041069c:	0a051863          	bnez	a0,8041074c <sfs_reclaim+0x188>
804106a0:	01c42703          	lw	a4,28(s0)
804106a4:	02042783          	lw	a5,32(s0)
804106a8:	00048513          	mv	a0,s1
804106ac:	00f72223          	sw	a5,4(a4)
804106b0:	00e7a023          	sw	a4,0(a5)
804106b4:	02442703          	lw	a4,36(s0)
804106b8:	02842783          	lw	a5,40(s0)
804106bc:	00f72223          	sw	a5,4(a4)
804106c0:	00e7a023          	sw	a4,0(a5)
804106c4:	5ad010ef          	jal	ra,80412470 <unlock_sfs_fs>
804106c8:	00042503          	lw	a0,0(s0)
804106cc:	00655783          	lhu	a5,6(a0)
804106d0:	04078a63          	beqz	a5,80410724 <sfs_reclaim+0x160>
804106d4:	cdcf20ef          	jal	ra,80402bb0 <kfree>
804106d8:	00040513          	mv	a0,s0
804106dc:	990fd0ef          	jal	ra,8040d86c <inode_kill>
804106e0:	00c12083          	lw	ra,12(sp)
804106e4:	00812403          	lw	s0,8(sp)
804106e8:	00090513          	mv	a0,s2
804106ec:	00412483          	lw	s1,4(sp)
804106f0:	00012903          	lw	s2,0(sp)
804106f4:	01010113          	addi	sp,sp,16
804106f8:	00008067          	ret
804106fc:	ff100913          	li	s2,-15
80410700:	00048513          	mv	a0,s1
80410704:	56d010ef          	jal	ra,80412470 <unlock_sfs_fs>
80410708:	00c12083          	lw	ra,12(sp)
8041070c:	00812403          	lw	s0,8(sp)
80410710:	00090513          	mv	a0,s2
80410714:	00412483          	lw	s1,4(sp)
80410718:	00012903          	lw	s2,0(sp)
8041071c:	01010113          	addi	sp,sp,16
80410720:	00008067          	ret
80410724:	00442583          	lw	a1,4(s0)
80410728:	00048513          	mv	a0,s1
8041072c:	e19ff0ef          	jal	ra,80410544 <sfs_block_free>
80410730:	00042503          	lw	a0,0(s0)
80410734:	03c52583          	lw	a1,60(a0)
80410738:	f8058ee3          	beqz	a1,804106d4 <sfs_reclaim+0x110>
8041073c:	00048513          	mv	a0,s1
80410740:	e05ff0ef          	jal	ra,80410544 <sfs_block_free>
80410744:	00042503          	lw	a0,0(s0)
80410748:	f8dff06f          	j	804106d4 <sfs_reclaim+0x110>
8041074c:	00050913          	mv	s2,a0
80410750:	fb1ff06f          	j	80410700 <sfs_reclaim+0x13c>
80410754:	00006697          	auipc	a3,0x6
80410758:	af068693          	addi	a3,a3,-1296 # 80416244 <dev_node_ops+0x4a8>
8041075c:	00003617          	auipc	a2,0x3
80410760:	9d060613          	addi	a2,a2,-1584 # 8041312c <commands+0x1f8>
80410764:	35800593          	li	a1,856
80410768:	00006517          	auipc	a0,0x6
8041076c:	c7850513          	addi	a0,a0,-904 # 804163e0 <dev_node_ops+0x644>
80410770:	eb5ef0ef          	jal	ra,80400624 <__panic>
80410774:	00006697          	auipc	a3,0x6
80410778:	e0068693          	addi	a3,a3,-512 # 80416574 <sfs_node_fileops+0x40>
8041077c:	00003617          	auipc	a2,0x3
80410780:	9b060613          	addi	a2,a2,-1616 # 8041312c <commands+0x1f8>
80410784:	35e00593          	li	a1,862
80410788:	00006517          	auipc	a0,0x6
8041078c:	c5850513          	addi	a0,a0,-936 # 804163e0 <dev_node_ops+0x644>
80410790:	e95ef0ef          	jal	ra,80400624 <__panic>
80410794:	00006697          	auipc	a3,0x6
80410798:	c6468693          	addi	a3,a3,-924 # 804163f8 <dev_node_ops+0x65c>
8041079c:	00003617          	auipc	a2,0x3
804107a0:	99060613          	addi	a2,a2,-1648 # 8041312c <commands+0x1f8>
804107a4:	35900593          	li	a1,857
804107a8:	00006517          	auipc	a0,0x6
804107ac:	c3850513          	addi	a0,a0,-968 # 804163e0 <dev_node_ops+0x644>
804107b0:	e75ef0ef          	jal	ra,80400624 <__panic>
804107b4:	00005697          	auipc	a3,0x5
804107b8:	42068693          	addi	a3,a3,1056 # 80415bd4 <syscalls+0x86c>
804107bc:	00003617          	auipc	a2,0x3
804107c0:	97060613          	addi	a2,a2,-1680 # 8041312c <commands+0x1f8>
804107c4:	36300593          	li	a1,867
804107c8:	00006517          	auipc	a0,0x6
804107cc:	c1850513          	addi	a0,a0,-1000 # 804163e0 <dev_node_ops+0x644>
804107d0:	e55ef0ef          	jal	ra,80400624 <__panic>
804107d4:	00004697          	auipc	a3,0x4
804107d8:	ec068693          	addi	a3,a3,-320 # 80414694 <CSWTCH.69+0x12c>
804107dc:	00003617          	auipc	a2,0x3
804107e0:	95060613          	addi	a2,a2,-1712 # 8041312c <commands+0x1f8>
804107e4:	36800593          	li	a1,872
804107e8:	00006517          	auipc	a0,0x6
804107ec:	bf850513          	addi	a0,a0,-1032 # 804163e0 <dev_node_ops+0x644>
804107f0:	e35ef0ef          	jal	ra,80400624 <__panic>

804107f4 <sfs_bmap_load_nolock>:
804107f4:	fc010113          	addi	sp,sp,-64
804107f8:	03212823          	sw	s2,48(sp)
804107fc:	0005a903          	lw	s2,0(a1)
80410800:	03312623          	sw	s3,44(sp)
80410804:	02112e23          	sw	ra,60(sp)
80410808:	00892983          	lw	s3,8(s2)
8041080c:	02812c23          	sw	s0,56(sp)
80410810:	02912a23          	sw	s1,52(sp)
80410814:	03412423          	sw	s4,40(sp)
80410818:	03512223          	sw	s5,36(sp)
8041081c:	03612023          	sw	s6,32(sp)
80410820:	01712e23          	sw	s7,28(sp)
80410824:	01812c23          	sw	s8,24(sp)
80410828:	01912a23          	sw	s9,20(sp)
8041082c:	01a12823          	sw	s10,16(sp)
80410830:	22c9e863          	bltu	s3,a2,80410a60 <sfs_bmap_load_nolock+0x26c>
80410834:	00b00793          	li	a5,11
80410838:	00058b13          	mv	s6,a1
8041083c:	00060413          	mv	s0,a2
80410840:	00050a13          	mv	s4,a0
80410844:	00068c13          	mv	s8,a3
80410848:	08c7fe63          	bgeu	a5,a2,804108e4 <sfs_bmap_load_nolock+0xf0>
8041084c:	ff460713          	addi	a4,a2,-12
80410850:	3ff00793          	li	a5,1023
80410854:	22e7e663          	bltu	a5,a4,80410a80 <sfs_bmap_load_nolock+0x28c>
80410858:	03c92c83          	lw	s9,60(s2)
8041085c:	00012623          	sw	zero,12(sp)
80410860:	00271b93          	slli	s7,a4,0x2
80410864:	01912423          	sw	s9,8(sp)
80410868:	180c9a63          	bnez	s9,804109fc <sfs_bmap_load_nolock+0x208>
8041086c:	0cc98263          	beq	s3,a2,80410930 <sfs_bmap_load_nolock+0x13c>
80410870:	03050a93          	addi	s5,a0,48
80410874:	00000493          	li	s1,0
80410878:	004a2503          	lw	a0,4(s4)
8041087c:	00048613          	mv	a2,s1
80410880:	000a8593          	mv	a1,s5
80410884:	bb1ff0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
80410888:	08050463          	beqz	a0,80410910 <sfs_bmap_load_nolock+0x11c>
8041088c:	00899863          	bne	s3,s0,8041089c <sfs_bmap_load_nolock+0xa8>
80410890:	00892783          	lw	a5,8(s2)
80410894:	00178793          	addi	a5,a5,1
80410898:	00f92423          	sw	a5,8(s2)
8041089c:	00000a93          	li	s5,0
804108a0:	000c0463          	beqz	s8,804108a8 <sfs_bmap_load_nolock+0xb4>
804108a4:	009c2023          	sw	s1,0(s8)
804108a8:	03c12083          	lw	ra,60(sp)
804108ac:	03812403          	lw	s0,56(sp)
804108b0:	000a8513          	mv	a0,s5
804108b4:	03412483          	lw	s1,52(sp)
804108b8:	03012903          	lw	s2,48(sp)
804108bc:	02c12983          	lw	s3,44(sp)
804108c0:	02812a03          	lw	s4,40(sp)
804108c4:	02412a83          	lw	s5,36(sp)
804108c8:	02012b03          	lw	s6,32(sp)
804108cc:	01c12b83          	lw	s7,28(sp)
804108d0:	01812c03          	lw	s8,24(sp)
804108d4:	01412c83          	lw	s9,20(sp)
804108d8:	01012d03          	lw	s10,16(sp)
804108dc:	04010113          	addi	sp,sp,64
804108e0:	00008067          	ret
804108e4:	00261b93          	slli	s7,a2,0x2
804108e8:	01790bb3          	add	s7,s2,s7
804108ec:	00cba483          	lw	s1,12(s7)
804108f0:	00912223          	sw	s1,4(sp)
804108f4:	10049063          	bnez	s1,804109f4 <sfs_bmap_load_nolock+0x200>
804108f8:	0cc98463          	beq	s3,a2,804109c0 <sfs_bmap_load_nolock+0x1cc>
804108fc:	00452503          	lw	a0,4(a0)
80410900:	00000613          	li	a2,0
80410904:	030a0593          	addi	a1,s4,48
80410908:	b2dff0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
8041090c:	f80518e3          	bnez	a0,8041089c <sfs_bmap_load_nolock+0xa8>
80410910:	00006697          	auipc	a3,0x6
80410914:	a6868693          	addi	a3,a3,-1432 # 80416378 <dev_node_ops+0x5dc>
80410918:	00003617          	auipc	a2,0x3
8041091c:	81460613          	addi	a2,a2,-2028 # 8041312c <commands+0x1f8>
80410920:	16b00593          	li	a1,363
80410924:	00006517          	auipc	a0,0x6
80410928:	abc50513          	addi	a0,a0,-1348 # 804163e0 <dev_node_ops+0x644>
8041092c:	cf9ef0ef          	jal	ra,80400624 <__panic>
80410930:	00810593          	addi	a1,sp,8
80410934:	b4dff0ef          	jal	ra,80410480 <sfs_block_alloc>
80410938:	00050a93          	mv	s5,a0
8041093c:	00c10d13          	addi	s10,sp,12
80410940:	f60514e3          	bnez	a0,804108a8 <sfs_bmap_load_nolock+0xb4>
80410944:	000d0593          	mv	a1,s10
80410948:	000a0513          	mv	a0,s4
8041094c:	b35ff0ef          	jal	ra,80410480 <sfs_block_alloc>
80410950:	00050a93          	mv	s5,a0
80410954:	0e051c63          	bnez	a0,80410a4c <sfs_bmap_load_nolock+0x258>
80410958:	00812683          	lw	a3,8(sp)
8041095c:	000b8713          	mv	a4,s7
80410960:	00400613          	li	a2,4
80410964:	000d0593          	mv	a1,s10
80410968:	000a0513          	mv	a0,s4
8041096c:	05d010ef          	jal	ra,804121c8 <sfs_wbuf>
80410970:	00050a93          	mv	s5,a0
80410974:	0c051663          	bnez	a0,80410a40 <sfs_bmap_load_nolock+0x24c>
80410978:	00c12483          	lw	s1,12(sp)
8041097c:	03c92703          	lw	a4,60(s2)
80410980:	00812783          	lw	a5,8(sp)
80410984:	00912223          	sw	s1,4(sp)
80410988:	00f70a63          	beq	a4,a5,8041099c <sfs_bmap_load_nolock+0x1a8>
8041098c:	12071663          	bnez	a4,80410ab8 <sfs_bmap_load_nolock+0x2c4>
80410990:	02f92e23          	sw	a5,60(s2)
80410994:	00100793          	li	a5,1
80410998:	00fb2423          	sw	a5,8(s6)
8041099c:	030a0a93          	addi	s5,s4,48
804109a0:	ec048ce3          	beqz	s1,80410878 <sfs_bmap_load_nolock+0x84>
804109a4:	004a2503          	lw	a0,4(s4)
804109a8:	00048613          	mv	a2,s1
804109ac:	000a8593          	mv	a1,s5
804109b0:	a85ff0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
804109b4:	0e050263          	beqz	a0,80410a98 <sfs_bmap_load_nolock+0x2a4>
804109b8:	00412483          	lw	s1,4(sp)
804109bc:	ebdff06f          	j	80410878 <sfs_bmap_load_nolock+0x84>
804109c0:	00410593          	addi	a1,sp,4
804109c4:	abdff0ef          	jal	ra,80410480 <sfs_block_alloc>
804109c8:	00050a93          	mv	s5,a0
804109cc:	ec051ee3          	bnez	a0,804108a8 <sfs_bmap_load_nolock+0xb4>
804109d0:	00412483          	lw	s1,4(sp)
804109d4:	00100793          	li	a5,1
804109d8:	009ba623          	sw	s1,12(s7)
804109dc:	00fb2423          	sw	a5,8(s6)
804109e0:	fbdff06f          	j	8041099c <sfs_bmap_load_nolock+0x1a8>
804109e4:	03c92703          	lw	a4,60(s2)
804109e8:	00812783          	lw	a5,8(sp)
804109ec:	00912223          	sw	s1,4(sp)
804109f0:	f8e79ee3          	bne	a5,a4,8041098c <sfs_bmap_load_nolock+0x198>
804109f4:	030a0a93          	addi	s5,s4,48
804109f8:	fadff06f          	j	804109a4 <sfs_bmap_load_nolock+0x1b0>
804109fc:	00c10d13          	addi	s10,sp,12
80410a00:	000b8713          	mv	a4,s7
80410a04:	000c8693          	mv	a3,s9
80410a08:	00400613          	li	a2,4
80410a0c:	000d0593          	mv	a1,s10
80410a10:	6ec010ef          	jal	ra,804120fc <sfs_rbuf>
80410a14:	00050a93          	mv	s5,a0
80410a18:	e80518e3          	bnez	a0,804108a8 <sfs_bmap_load_nolock+0xb4>
80410a1c:	00c12483          	lw	s1,12(sp)
80410a20:	fc0492e3          	bnez	s1,804109e4 <sfs_bmap_load_nolock+0x1f0>
80410a24:	f28980e3          	beq	s3,s0,80410944 <sfs_bmap_load_nolock+0x150>
80410a28:	03c92703          	lw	a4,60(s2)
80410a2c:	00812783          	lw	a5,8(sp)
80410a30:	00012223          	sw	zero,4(sp)
80410a34:	f4e79ce3          	bne	a5,a4,8041098c <sfs_bmap_load_nolock+0x198>
80410a38:	030a0a93          	addi	s5,s4,48
80410a3c:	e3dff06f          	j	80410878 <sfs_bmap_load_nolock+0x84>
80410a40:	00c12583          	lw	a1,12(sp)
80410a44:	000a0513          	mv	a0,s4
80410a48:	afdff0ef          	jal	ra,80410544 <sfs_block_free>
80410a4c:	00812583          	lw	a1,8(sp)
80410a50:	e4bc8ce3          	beq	s9,a1,804108a8 <sfs_bmap_load_nolock+0xb4>
80410a54:	000a0513          	mv	a0,s4
80410a58:	aedff0ef          	jal	ra,80410544 <sfs_block_free>
80410a5c:	e4dff06f          	j	804108a8 <sfs_bmap_load_nolock+0xb4>
80410a60:	00006697          	auipc	a3,0x6
80410a64:	8b468693          	addi	a3,a3,-1868 # 80416314 <dev_node_ops+0x578>
80410a68:	00002617          	auipc	a2,0x2
80410a6c:	6c460613          	addi	a2,a2,1732 # 8041312c <commands+0x1f8>
80410a70:	16400593          	li	a1,356
80410a74:	00006517          	auipc	a0,0x6
80410a78:	96c50513          	addi	a0,a0,-1684 # 804163e0 <dev_node_ops+0x644>
80410a7c:	ba9ef0ef          	jal	ra,80400624 <__panic>
80410a80:	00006617          	auipc	a2,0x6
80410a84:	8c060613          	addi	a2,a2,-1856 # 80416340 <dev_node_ops+0x5a4>
80410a88:	11e00593          	li	a1,286
80410a8c:	00006517          	auipc	a0,0x6
80410a90:	95450513          	addi	a0,a0,-1708 # 804163e0 <dev_node_ops+0x644>
80410a94:	b91ef0ef          	jal	ra,80400624 <__panic>
80410a98:	00006697          	auipc	a3,0x6
80410a9c:	8d468693          	addi	a3,a3,-1836 # 8041636c <dev_node_ops+0x5d0>
80410aa0:	00002617          	auipc	a2,0x2
80410aa4:	68c60613          	addi	a2,a2,1676 # 8041312c <commands+0x1f8>
80410aa8:	12100593          	li	a1,289
80410aac:	00006517          	auipc	a0,0x6
80410ab0:	93450513          	addi	a0,a0,-1740 # 804163e0 <dev_node_ops+0x644>
80410ab4:	b71ef0ef          	jal	ra,80400624 <__panic>
80410ab8:	00006697          	auipc	a3,0x6
80410abc:	87468693          	addi	a3,a3,-1932 # 8041632c <dev_node_ops+0x590>
80410ac0:	00002617          	auipc	a2,0x2
80410ac4:	66c60613          	addi	a2,a2,1644 # 8041312c <commands+0x1f8>
80410ac8:	11800593          	li	a1,280
80410acc:	00006517          	auipc	a0,0x6
80410ad0:	91450513          	addi	a0,a0,-1772 # 804163e0 <dev_node_ops+0x644>
80410ad4:	b51ef0ef          	jal	ra,80400624 <__panic>

80410ad8 <sfs_io_nolock>:
80410ad8:	fa010113          	addi	sp,sp,-96
80410adc:	03812c23          	sw	s8,56(sp)
80410ae0:	00058c13          	mv	s8,a1
80410ae4:	0005a583          	lw	a1,0(a1)
80410ae8:	03912a23          	sw	s9,52(sp)
80410aec:	00050c93          	mv	s9,a0
80410af0:	0045d503          	lhu	a0,4(a1)
80410af4:	04112e23          	sw	ra,92(sp)
80410af8:	04812c23          	sw	s0,88(sp)
80410afc:	04912a23          	sw	s1,84(sp)
80410b00:	05212823          	sw	s2,80(sp)
80410b04:	05312623          	sw	s3,76(sp)
80410b08:	05412423          	sw	s4,72(sp)
80410b0c:	05512223          	sw	s5,68(sp)
80410b10:	05612023          	sw	s6,64(sp)
80410b14:	03712e23          	sw	s7,60(sp)
80410b18:	03a12823          	sw	s10,48(sp)
80410b1c:	03b12623          	sw	s11,44(sp)
80410b20:	00200813          	li	a6,2
80410b24:	27050863          	beq	a0,a6,80410d94 <sfs_io_nolock+0x2bc>
80410b28:	00072403          	lw	s0,0(a4)
80410b2c:	00070b93          	mv	s7,a4
80410b30:	000ba023          	sw	zero,0(s7)
80410b34:	08000737          	lui	a4,0x8000
80410b38:	00068493          	mv	s1,a3
80410b3c:	00068d93          	mv	s11,a3
80410b40:	00868433          	add	s0,a3,s0
80410b44:	24e6f463          	bgeu	a3,a4,80410d8c <sfs_io_nolock+0x2b4>
80410b48:	24d44263          	blt	s0,a3,80410d8c <sfs_io_nolock+0x2b4>
80410b4c:	00000513          	li	a0,0
80410b50:	0e868e63          	beq	a3,s0,80410c4c <sfs_io_nolock+0x174>
80410b54:	00060993          	mv	s3,a2
80410b58:	00877463          	bgeu	a4,s0,80410b60 <sfs_io_nolock+0x88>
80410b5c:	08000437          	lui	s0,0x8000
80410b60:	12078463          	beqz	a5,80410c88 <sfs_io_nolock+0x1b0>
80410b64:	00001797          	auipc	a5,0x1
80410b68:	59078793          	addi	a5,a5,1424 # 804120f4 <sfs_wblock>
80410b6c:	00f12623          	sw	a5,12(sp)
80410b70:	00001797          	auipc	a5,0x1
80410b74:	65878793          	addi	a5,a5,1624 # 804121c8 <sfs_wbuf>
80410b78:	00f12423          	sw	a5,8(sp)
80410b7c:	41f4d913          	srai	s2,s1,0x1f
80410b80:	00001637          	lui	a2,0x1
80410b84:	fff60713          	addi	a4,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
80410b88:	01495693          	srli	a3,s2,0x14
80410b8c:	41f45a13          	srai	s4,s0,0x1f
80410b90:	00e97933          	and	s2,s2,a4
80410b94:	00ea7ab3          	and	s5,s4,a4
80410b98:	00d48d33          	add	s10,s1,a3
80410b9c:	00990933          	add	s2,s2,s1
80410ba0:	008a8ab3          	add	s5,s5,s0
80410ba4:	00ed7d33          	and	s10,s10,a4
80410ba8:	40c95913          	srai	s2,s2,0xc
80410bac:	40cada93          	srai	s5,s5,0xc
80410bb0:	40dd0d33          	sub	s10,s10,a3
80410bb4:	412a8ab3          	sub	s5,s5,s2
80410bb8:	100d0063          	beqz	s10,80410cb8 <sfs_io_nolock+0x1e0>
80410bbc:	40940b33          	sub	s6,s0,s1
80410bc0:	140a9463          	bnez	s5,80410d08 <sfs_io_nolock+0x230>
80410bc4:	01c10693          	addi	a3,sp,28
80410bc8:	00090613          	mv	a2,s2
80410bcc:	000c0593          	mv	a1,s8
80410bd0:	000c8513          	mv	a0,s9
80410bd4:	c21ff0ef          	jal	ra,804107f4 <sfs_bmap_load_nolock>
80410bd8:	14051663          	bnez	a0,80410d24 <sfs_io_nolock+0x24c>
80410bdc:	01c12683          	lw	a3,28(sp)
80410be0:	00812783          	lw	a5,8(sp)
80410be4:	000d0713          	mv	a4,s10
80410be8:	000b0613          	mv	a2,s6
80410bec:	00098593          	mv	a1,s3
80410bf0:	000c8513          	mv	a0,s9
80410bf4:	000780e7          	jalr	a5
80410bf8:	12051663          	bnez	a0,80410d24 <sfs_io_nolock+0x24c>
80410bfc:	180a8463          	beqz	s5,80410d84 <sfs_io_nolock+0x2ac>
80410c00:	fffa8a93          	addi	s5,s5,-1
80410c04:	016989b3          	add	s3,s3,s6
80410c08:	00190913          	addi	s2,s2,1
80410c0c:	0a0a9a63          	bnez	s5,80410cc0 <sfs_io_nolock+0x1e8>
80410c10:	014a5793          	srli	a5,s4,0x14
80410c14:	00f40433          	add	s0,s0,a5
80410c18:	01441413          	slli	s0,s0,0x14
80410c1c:	01445413          	srli	s0,s0,0x14
80410c20:	40f40433          	sub	s0,s0,a5
80410c24:	12041263          	bnez	s0,80410d48 <sfs_io_nolock+0x270>
80410c28:	01648db3          	add	s11,s1,s6
80410c2c:	00000513          	li	a0,0
80410c30:	000c2783          	lw	a5,0(s8)
80410c34:	016ba023          	sw	s6,0(s7)
80410c38:	0007a703          	lw	a4,0(a5)
80410c3c:	01b77863          	bgeu	a4,s11,80410c4c <sfs_io_nolock+0x174>
80410c40:	01b7a023          	sw	s11,0(a5)
80410c44:	00100793          	li	a5,1
80410c48:	00fc2423          	sw	a5,8(s8)
80410c4c:	05c12083          	lw	ra,92(sp)
80410c50:	05812403          	lw	s0,88(sp)
80410c54:	05412483          	lw	s1,84(sp)
80410c58:	05012903          	lw	s2,80(sp)
80410c5c:	04c12983          	lw	s3,76(sp)
80410c60:	04812a03          	lw	s4,72(sp)
80410c64:	04412a83          	lw	s5,68(sp)
80410c68:	04012b03          	lw	s6,64(sp)
80410c6c:	03c12b83          	lw	s7,60(sp)
80410c70:	03812c03          	lw	s8,56(sp)
80410c74:	03412c83          	lw	s9,52(sp)
80410c78:	03012d03          	lw	s10,48(sp)
80410c7c:	02c12d83          	lw	s11,44(sp)
80410c80:	06010113          	addi	sp,sp,96
80410c84:	00008067          	ret
80410c88:	0005a783          	lw	a5,0(a1)
80410c8c:	00000513          	li	a0,0
80410c90:	faf4fee3          	bgeu	s1,a5,80410c4c <sfs_io_nolock+0x174>
80410c94:	0887fc63          	bgeu	a5,s0,80410d2c <sfs_io_nolock+0x254>
80410c98:	00078413          	mv	s0,a5
80410c9c:	00001797          	auipc	a5,0x1
80410ca0:	45078793          	addi	a5,a5,1104 # 804120ec <sfs_rblock>
80410ca4:	00f12623          	sw	a5,12(sp)
80410ca8:	00001797          	auipc	a5,0x1
80410cac:	45478793          	addi	a5,a5,1108 # 804120fc <sfs_rbuf>
80410cb0:	00f12423          	sw	a5,8(sp)
80410cb4:	ec9ff06f          	j	80410b7c <sfs_io_nolock+0xa4>
80410cb8:	00000b13          	li	s6,0
80410cbc:	f40a8ae3          	beqz	s5,80410c10 <sfs_io_nolock+0x138>
80410cc0:	01c10693          	addi	a3,sp,28
80410cc4:	00090613          	mv	a2,s2
80410cc8:	000c0593          	mv	a1,s8
80410ccc:	000c8513          	mv	a0,s9
80410cd0:	b25ff0ef          	jal	ra,804107f4 <sfs_bmap_load_nolock>
80410cd4:	0a051863          	bnez	a0,80410d84 <sfs_io_nolock+0x2ac>
80410cd8:	01c12603          	lw	a2,28(sp)
80410cdc:	00c12783          	lw	a5,12(sp)
80410ce0:	000a8693          	mv	a3,s5
80410ce4:	00098593          	mv	a1,s3
80410ce8:	000c8513          	mv	a0,s9
80410cec:	000780e7          	jalr	a5
80410cf0:	08051a63          	bnez	a0,80410d84 <sfs_io_nolock+0x2ac>
80410cf4:	00ca9713          	slli	a4,s5,0xc
80410cf8:	00eb0b33          	add	s6,s6,a4
80410cfc:	00e989b3          	add	s3,s3,a4
80410d00:	01590933          	add	s2,s2,s5
80410d04:	f0dff06f          	j	80410c10 <sfs_io_nolock+0x138>
80410d08:	41a60b33          	sub	s6,a2,s10
80410d0c:	01c10693          	addi	a3,sp,28
80410d10:	00090613          	mv	a2,s2
80410d14:	000c0593          	mv	a1,s8
80410d18:	000c8513          	mv	a0,s9
80410d1c:	ad9ff0ef          	jal	ra,804107f4 <sfs_bmap_load_nolock>
80410d20:	ea050ee3          	beqz	a0,80410bdc <sfs_io_nolock+0x104>
80410d24:	00000b13          	li	s6,0
80410d28:	f09ff06f          	j	80410c30 <sfs_io_nolock+0x158>
80410d2c:	00001797          	auipc	a5,0x1
80410d30:	3c078793          	addi	a5,a5,960 # 804120ec <sfs_rblock>
80410d34:	00f12623          	sw	a5,12(sp)
80410d38:	00001797          	auipc	a5,0x1
80410d3c:	3c478793          	addi	a5,a5,964 # 804120fc <sfs_rbuf>
80410d40:	00f12423          	sw	a5,8(sp)
80410d44:	e39ff06f          	j	80410b7c <sfs_io_nolock+0xa4>
80410d48:	01c10693          	addi	a3,sp,28
80410d4c:	00090613          	mv	a2,s2
80410d50:	000c0593          	mv	a1,s8
80410d54:	000c8513          	mv	a0,s9
80410d58:	a9dff0ef          	jal	ra,804107f4 <sfs_bmap_load_nolock>
80410d5c:	02051463          	bnez	a0,80410d84 <sfs_io_nolock+0x2ac>
80410d60:	01c12683          	lw	a3,28(sp)
80410d64:	00812783          	lw	a5,8(sp)
80410d68:	00000713          	li	a4,0
80410d6c:	00040613          	mv	a2,s0
80410d70:	00098593          	mv	a1,s3
80410d74:	000c8513          	mv	a0,s9
80410d78:	000780e7          	jalr	a5
80410d7c:	00051463          	bnez	a0,80410d84 <sfs_io_nolock+0x2ac>
80410d80:	008b0b33          	add	s6,s6,s0
80410d84:	01648db3          	add	s11,s1,s6
80410d88:	ea9ff06f          	j	80410c30 <sfs_io_nolock+0x158>
80410d8c:	ffd00513          	li	a0,-3
80410d90:	ebdff06f          	j	80410c4c <sfs_io_nolock+0x174>
80410d94:	00005697          	auipc	a3,0x5
80410d98:	6b468693          	addi	a3,a3,1716 # 80416448 <dev_node_ops+0x6ac>
80410d9c:	00002617          	auipc	a2,0x2
80410da0:	39060613          	addi	a2,a2,912 # 8041312c <commands+0x1f8>
80410da4:	22b00593          	li	a1,555
80410da8:	00005517          	auipc	a0,0x5
80410dac:	63850513          	addi	a0,a0,1592 # 804163e0 <dev_node_ops+0x644>
80410db0:	875ef0ef          	jal	ra,80400624 <__panic>

80410db4 <sfs_dirent_read_nolock>:
80410db4:	0005a783          	lw	a5,0(a1)
80410db8:	fe010113          	addi	sp,sp,-32
80410dbc:	00112e23          	sw	ra,28(sp)
80410dc0:	0047d803          	lhu	a6,4(a5)
80410dc4:	00812c23          	sw	s0,24(sp)
80410dc8:	00912a23          	sw	s1,20(sp)
80410dcc:	00200713          	li	a4,2
80410dd0:	06e81e63          	bne	a6,a4,80410e4c <sfs_dirent_read_nolock+0x98>
80410dd4:	0087a783          	lw	a5,8(a5)
80410dd8:	06f67a63          	bgeu	a2,a5,80410e4c <sfs_dirent_read_nolock+0x98>
80410ddc:	00068493          	mv	s1,a3
80410de0:	00c10693          	addi	a3,sp,12
80410de4:	00050413          	mv	s0,a0
80410de8:	a0dff0ef          	jal	ra,804107f4 <sfs_bmap_load_nolock>
80410dec:	00050c63          	beqz	a0,80410e04 <sfs_dirent_read_nolock+0x50>
80410df0:	01c12083          	lw	ra,28(sp)
80410df4:	01812403          	lw	s0,24(sp)
80410df8:	01412483          	lw	s1,20(sp)
80410dfc:	02010113          	addi	sp,sp,32
80410e00:	00008067          	ret
80410e04:	00c12603          	lw	a2,12(sp)
80410e08:	00442503          	lw	a0,4(s0) # 8000004 <_binary_bin_sfs_img_size+0x7f88004>
80410e0c:	03040593          	addi	a1,s0,48
80410e10:	e24ff0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
80410e14:	04050c63          	beqz	a0,80410e6c <sfs_dirent_read_nolock+0xb8>
80410e18:	00c12683          	lw	a3,12(sp)
80410e1c:	00000713          	li	a4,0
80410e20:	10400613          	li	a2,260
80410e24:	00048593          	mv	a1,s1
80410e28:	00040513          	mv	a0,s0
80410e2c:	2d0010ef          	jal	ra,804120fc <sfs_rbuf>
80410e30:	fc0510e3          	bnez	a0,80410df0 <sfs_dirent_read_nolock+0x3c>
80410e34:	100481a3          	sb	zero,259(s1)
80410e38:	01c12083          	lw	ra,28(sp)
80410e3c:	01812403          	lw	s0,24(sp)
80410e40:	01412483          	lw	s1,20(sp)
80410e44:	02010113          	addi	sp,sp,32
80410e48:	00008067          	ret
80410e4c:	00005697          	auipc	a3,0x5
80410e50:	54868693          	addi	a3,a3,1352 # 80416394 <dev_node_ops+0x5f8>
80410e54:	00002617          	auipc	a2,0x2
80410e58:	2d860613          	addi	a2,a2,728 # 8041312c <commands+0x1f8>
80410e5c:	18e00593          	li	a1,398
80410e60:	00005517          	auipc	a0,0x5
80410e64:	58050513          	addi	a0,a0,1408 # 804163e0 <dev_node_ops+0x644>
80410e68:	fbcef0ef          	jal	ra,80400624 <__panic>
80410e6c:	00005697          	auipc	a3,0x5
80410e70:	50c68693          	addi	a3,a3,1292 # 80416378 <dev_node_ops+0x5dc>
80410e74:	00002617          	auipc	a2,0x2
80410e78:	2b860613          	addi	a2,a2,696 # 8041312c <commands+0x1f8>
80410e7c:	19500593          	li	a1,405
80410e80:	00005517          	auipc	a0,0x5
80410e84:	56050513          	addi	a0,a0,1376 # 804163e0 <dev_node_ops+0x644>
80410e88:	f9cef0ef          	jal	ra,80400624 <__panic>

80410e8c <sfs_getdirentry>:
80410e8c:	fd010113          	addi	sp,sp,-48
80410e90:	02912223          	sw	s1,36(sp)
80410e94:	00050493          	mv	s1,a0
80410e98:	10400513          	li	a0,260
80410e9c:	01812423          	sw	s8,8(sp)
80410ea0:	02112623          	sw	ra,44(sp)
80410ea4:	02812423          	sw	s0,40(sp)
80410ea8:	03212023          	sw	s2,32(sp)
80410eac:	01312e23          	sw	s3,28(sp)
80410eb0:	01412c23          	sw	s4,24(sp)
80410eb4:	01512a23          	sw	s5,20(sp)
80410eb8:	01612823          	sw	s6,16(sp)
80410ebc:	01712623          	sw	s7,12(sp)
80410ec0:	00058c13          	mv	s8,a1
80410ec4:	bc9f10ef          	jal	ra,80402a8c <kmalloc>
80410ec8:	12050a63          	beqz	a0,80410ffc <sfs_getdirentry+0x170>
80410ecc:	0384aa83          	lw	s5,56(s1)
80410ed0:	120a8a63          	beqz	s5,80411004 <sfs_getdirentry+0x178>
80410ed4:	06caa783          	lw	a5,108(s5)
80410ed8:	12079663          	bnez	a5,80411004 <sfs_getdirentry+0x178>
80410edc:	02c4a703          	lw	a4,44(s1)
80410ee0:	000017b7          	lui	a5,0x1
80410ee4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80410ee8:	12f71e63          	bne	a4,a5,80411024 <sfs_getdirentry+0x198>
80410eec:	004c2403          	lw	s0,4(s8)
80410ef0:	00050913          	mv	s2,a0
80410ef4:	0e044663          	bltz	s0,80410fe0 <sfs_getdirentry+0x154>
80410ef8:	0ff47793          	andi	a5,s0,255
80410efc:	0e079263          	bnez	a5,80410fe0 <sfs_getdirentry+0x154>
80410f00:	0004a783          	lw	a5,0(s1)
80410f04:	00845413          	srli	s0,s0,0x8
80410f08:	0087a783          	lw	a5,8(a5)
80410f0c:	0e87e263          	bltu	a5,s0,80410ff0 <sfs_getdirentry+0x164>
80410f10:	01048b93          	addi	s7,s1,16
80410f14:	000b8513          	mv	a0,s7
80410f18:	b24f40ef          	jal	ra,8040523c <down>
80410f1c:	0004a783          	lw	a5,0(s1)
80410f20:	0087ab03          	lw	s6,8(a5)
80410f24:	0b605663          	blez	s6,80410fd0 <sfs_getdirentry+0x144>
80410f28:	00000993          	li	s3,0
80410f2c:	01c0006f          	j	80410f48 <sfs_getdirentry+0xbc>
80410f30:	00092783          	lw	a5,0(s2)
80410f34:	00078663          	beqz	a5,80410f40 <sfs_getdirentry+0xb4>
80410f38:	02040c63          	beqz	s0,80410f70 <sfs_getdirentry+0xe4>
80410f3c:	fff40413          	addi	s0,s0,-1
80410f40:	00198993          	addi	s3,s3,1
80410f44:	093b0663          	beq	s6,s3,80410fd0 <sfs_getdirentry+0x144>
80410f48:	00090693          	mv	a3,s2
80410f4c:	00098613          	mv	a2,s3
80410f50:	00048593          	mv	a1,s1
80410f54:	000a8513          	mv	a0,s5
80410f58:	e5dff0ef          	jal	ra,80410db4 <sfs_dirent_read_nolock>
80410f5c:	00050a13          	mv	s4,a0
80410f60:	fc0508e3          	beqz	a0,80410f30 <sfs_getdirentry+0xa4>
80410f64:	000b8513          	mv	a0,s7
80410f68:	ad0f40ef          	jal	ra,80405238 <up>
80410f6c:	0280006f          	j	80410f94 <sfs_getdirentry+0x108>
80410f70:	000b8513          	mv	a0,s7
80410f74:	ac4f40ef          	jal	ra,80405238 <up>
80410f78:	00000713          	li	a4,0
80410f7c:	00100693          	li	a3,1
80410f80:	10000613          	li	a2,256
80410f84:	00490593          	addi	a1,s2,4
80410f88:	000c0513          	mv	a0,s8
80410f8c:	f18f50ef          	jal	ra,804066a4 <iobuf_move>
80410f90:	00050a13          	mv	s4,a0
80410f94:	00090513          	mv	a0,s2
80410f98:	c19f10ef          	jal	ra,80402bb0 <kfree>
80410f9c:	02c12083          	lw	ra,44(sp)
80410fa0:	02812403          	lw	s0,40(sp)
80410fa4:	000a0513          	mv	a0,s4
80410fa8:	02412483          	lw	s1,36(sp)
80410fac:	02012903          	lw	s2,32(sp)
80410fb0:	01c12983          	lw	s3,28(sp)
80410fb4:	01812a03          	lw	s4,24(sp)
80410fb8:	01412a83          	lw	s5,20(sp)
80410fbc:	01012b03          	lw	s6,16(sp)
80410fc0:	00c12b83          	lw	s7,12(sp)
80410fc4:	00812c03          	lw	s8,8(sp)
80410fc8:	03010113          	addi	sp,sp,48
80410fcc:	00008067          	ret
80410fd0:	000b8513          	mv	a0,s7
80410fd4:	ff000a13          	li	s4,-16
80410fd8:	a60f40ef          	jal	ra,80405238 <up>
80410fdc:	fb9ff06f          	j	80410f94 <sfs_getdirentry+0x108>
80410fe0:	00090513          	mv	a0,s2
80410fe4:	bcdf10ef          	jal	ra,80402bb0 <kfree>
80410fe8:	ffd00a13          	li	s4,-3
80410fec:	fb1ff06f          	j	80410f9c <sfs_getdirentry+0x110>
80410ff0:	bc1f10ef          	jal	ra,80402bb0 <kfree>
80410ff4:	ff000a13          	li	s4,-16
80410ff8:	fa5ff06f          	j	80410f9c <sfs_getdirentry+0x110>
80410ffc:	ffc00a13          	li	s4,-4
80411000:	f9dff06f          	j	80410f9c <sfs_getdirentry+0x110>
80411004:	00005697          	auipc	a3,0x5
80411008:	24068693          	addi	a3,a3,576 # 80416244 <dev_node_ops+0x4a8>
8041100c:	00002617          	auipc	a2,0x2
80411010:	12060613          	addi	a2,a2,288 # 8041312c <commands+0x1f8>
80411014:	33a00593          	li	a1,826
80411018:	00005517          	auipc	a0,0x5
8041101c:	3c850513          	addi	a0,a0,968 # 804163e0 <dev_node_ops+0x644>
80411020:	e04ef0ef          	jal	ra,80400624 <__panic>
80411024:	00005697          	auipc	a3,0x5
80411028:	3d468693          	addi	a3,a3,980 # 804163f8 <dev_node_ops+0x65c>
8041102c:	00002617          	auipc	a2,0x2
80411030:	10060613          	addi	a2,a2,256 # 8041312c <commands+0x1f8>
80411034:	33b00593          	li	a1,827
80411038:	00005517          	auipc	a0,0x5
8041103c:	3a850513          	addi	a0,a0,936 # 804163e0 <dev_node_ops+0x644>
80411040:	de4ef0ef          	jal	ra,80400624 <__panic>

80411044 <sfs_truncfile>:
80411044:	fa010113          	addi	sp,sp,-96
80411048:	04112e23          	sw	ra,92(sp)
8041104c:	04812c23          	sw	s0,88(sp)
80411050:	04912a23          	sw	s1,84(sp)
80411054:	05212823          	sw	s2,80(sp)
80411058:	05312623          	sw	s3,76(sp)
8041105c:	05412423          	sw	s4,72(sp)
80411060:	05512223          	sw	s5,68(sp)
80411064:	05612023          	sw	s6,64(sp)
80411068:	03712e23          	sw	s7,60(sp)
8041106c:	03812c23          	sw	s8,56(sp)
80411070:	03912a23          	sw	s9,52(sp)
80411074:	03a12823          	sw	s10,48(sp)
80411078:	03b12623          	sw	s11,44(sp)
8041107c:	080007b7          	lui	a5,0x8000
80411080:	1eb7ec63          	bltu	a5,a1,80411278 <sfs_truncfile+0x234>
80411084:	03852d03          	lw	s10,56(a0)
80411088:	00050913          	mv	s2,a0
8041108c:	00058a13          	mv	s4,a1
80411090:	1e0d0863          	beqz	s10,80411280 <sfs_truncfile+0x23c>
80411094:	06cd2783          	lw	a5,108(s10)
80411098:	1e079463          	bnez	a5,80411280 <sfs_truncfile+0x23c>
8041109c:	02c52703          	lw	a4,44(a0)
804110a0:	000014b7          	lui	s1,0x1
804110a4:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804110a8:	20f71c63          	bne	a4,a5,804112c0 <sfs_truncfile+0x27c>
804110ac:	00052a83          	lw	s5,0(a0)
804110b0:	fff48493          	addi	s1,s1,-1
804110b4:	009584b3          	add	s1,a1,s1
804110b8:	000aa783          	lw	a5,0(s5)
804110bc:	00c4d493          	srli	s1,s1,0xc
804110c0:	04f59863          	bne	a1,a5,80411110 <sfs_truncfile+0xcc>
804110c4:	008aa783          	lw	a5,8(s5)
804110c8:	00000c93          	li	s9,0
804110cc:	20f49a63          	bne	s1,a5,804112e0 <sfs_truncfile+0x29c>
804110d0:	05c12083          	lw	ra,92(sp)
804110d4:	05812403          	lw	s0,88(sp)
804110d8:	000c8513          	mv	a0,s9
804110dc:	05412483          	lw	s1,84(sp)
804110e0:	05012903          	lw	s2,80(sp)
804110e4:	04c12983          	lw	s3,76(sp)
804110e8:	04812a03          	lw	s4,72(sp)
804110ec:	04412a83          	lw	s5,68(sp)
804110f0:	04012b03          	lw	s6,64(sp)
804110f4:	03c12b83          	lw	s7,60(sp)
804110f8:	03812c03          	lw	s8,56(sp)
804110fc:	03412c83          	lw	s9,52(sp)
80411100:	03012d03          	lw	s10,48(sp)
80411104:	02c12d83          	lw	s11,44(sp)
80411108:	06010113          	addi	sp,sp,96
8041110c:	00008067          	ret
80411110:	01050b13          	addi	s6,a0,16
80411114:	000b0513          	mv	a0,s6
80411118:	924f40ef          	jal	ra,8040523c <down>
8041111c:	008aa403          	lw	s0,8(s5)
80411120:	0e946063          	bltu	s0,s1,80411200 <sfs_truncfile+0x1bc>
80411124:	1084f263          	bgeu	s1,s0,80411228 <sfs_truncfile+0x1e4>
80411128:	00092d83          	lw	s11,0(s2)
8041112c:	008da783          	lw	a5,8(s11) # 1008 <_binary_bin_swap_img_size-0x6ff8>
80411130:	16078863          	beqz	a5,804112a0 <sfs_truncfile+0x25c>
80411134:	030d0713          	addi	a4,s10,48
80411138:	00b00b93          	li	s7,11
8041113c:	00e12623          	sw	a4,12(sp)
80411140:	00100c13          	li	s8,1
80411144:	0900006f          	j	804111d4 <sfs_truncfile+0x190>
80411148:	ff378993          	addi	s3,a5,-13 # 7fffff3 <_binary_bin_sfs_img_size+0x7f87ff3>
8041114c:	3ff00793          	li	a5,1023
80411150:	0737e063          	bltu	a5,s3,804111b0 <sfs_truncfile+0x16c>
80411154:	03cda783          	lw	a5,60(s11)
80411158:	04078c63          	beqz	a5,804111b0 <sfs_truncfile+0x16c>
8041115c:	004d2503          	lw	a0,4(s10)
80411160:	00c12583          	lw	a1,12(sp)
80411164:	00078613          	mv	a2,a5
80411168:	00f12423          	sw	a5,8(sp)
8041116c:	ac8ff0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
80411170:	00812783          	lw	a5,8(sp)
80411174:	18050663          	beqz	a0,80411300 <sfs_truncfile+0x2bc>
80411178:	00299993          	slli	s3,s3,0x2
8041117c:	00098713          	mv	a4,s3
80411180:	00078693          	mv	a3,a5
80411184:	00400613          	li	a2,4
80411188:	01810593          	addi	a1,sp,24
8041118c:	000d0513          	mv	a0,s10
80411190:	00f12423          	sw	a5,8(sp)
80411194:	00012e23          	sw	zero,28(sp)
80411198:	765000ef          	jal	ra,804120fc <sfs_rbuf>
8041119c:	00050c93          	mv	s9,a0
804111a0:	08051e63          	bnez	a0,8041123c <sfs_truncfile+0x1f8>
804111a4:	01812703          	lw	a4,24(sp)
804111a8:	00812783          	lw	a5,8(sp)
804111ac:	08071e63          	bnez	a4,80411248 <sfs_truncfile+0x204>
804111b0:	008da783          	lw	a5,8(s11)
804111b4:	fff40413          	addi	s0,s0,-1
804111b8:	fff78793          	addi	a5,a5,-1
804111bc:	00fda423          	sw	a5,8(s11)
804111c0:	01892423          	sw	s8,8(s2)
804111c4:	06848063          	beq	s1,s0,80411224 <sfs_truncfile+0x1e0>
804111c8:	00092d83          	lw	s11,0(s2)
804111cc:	008da783          	lw	a5,8(s11)
804111d0:	0c078863          	beqz	a5,804112a0 <sfs_truncfile+0x25c>
804111d4:	fff78713          	addi	a4,a5,-1
804111d8:	f6ebe8e3          	bltu	s7,a4,80411148 <sfs_truncfile+0x104>
804111dc:	00279793          	slli	a5,a5,0x2
804111e0:	00fd89b3          	add	s3,s11,a5
804111e4:	0089a583          	lw	a1,8(s3)
804111e8:	fc0584e3          	beqz	a1,804111b0 <sfs_truncfile+0x16c>
804111ec:	000d0513          	mv	a0,s10
804111f0:	b54ff0ef          	jal	ra,80410544 <sfs_block_free>
804111f4:	0009a423          	sw	zero,8(s3)
804111f8:	01892423          	sw	s8,8(s2)
804111fc:	fb5ff06f          	j	804111b0 <sfs_truncfile+0x16c>
80411200:	00000693          	li	a3,0
80411204:	00040613          	mv	a2,s0
80411208:	00090593          	mv	a1,s2
8041120c:	000d0513          	mv	a0,s10
80411210:	de4ff0ef          	jal	ra,804107f4 <sfs_bmap_load_nolock>
80411214:	00050c93          	mv	s9,a0
80411218:	02051263          	bnez	a0,8041123c <sfs_truncfile+0x1f8>
8041121c:	00140413          	addi	s0,s0,1
80411220:	fe8490e3          	bne	s1,s0,80411200 <sfs_truncfile+0x1bc>
80411224:	008aa403          	lw	s0,8(s5)
80411228:	0e849c63          	bne	s1,s0,80411320 <sfs_truncfile+0x2dc>
8041122c:	014aa023          	sw	s4,0(s5)
80411230:	00100793          	li	a5,1
80411234:	00f92423          	sw	a5,8(s2)
80411238:	00000c93          	li	s9,0
8041123c:	000b0513          	mv	a0,s6
80411240:	ff9f30ef          	jal	ra,80405238 <up>
80411244:	e8dff06f          	j	804110d0 <sfs_truncfile+0x8c>
80411248:	00098713          	mv	a4,s3
8041124c:	00078693          	mv	a3,a5
80411250:	00400613          	li	a2,4
80411254:	01c10593          	addi	a1,sp,28
80411258:	000d0513          	mv	a0,s10
8041125c:	76d000ef          	jal	ra,804121c8 <sfs_wbuf>
80411260:	00050c93          	mv	s9,a0
80411264:	fc051ce3          	bnez	a0,8041123c <sfs_truncfile+0x1f8>
80411268:	01812583          	lw	a1,24(sp)
8041126c:	000d0513          	mv	a0,s10
80411270:	ad4ff0ef          	jal	ra,80410544 <sfs_block_free>
80411274:	f3dff06f          	j	804111b0 <sfs_truncfile+0x16c>
80411278:	ffd00c93          	li	s9,-3
8041127c:	e55ff06f          	j	804110d0 <sfs_truncfile+0x8c>
80411280:	00005697          	auipc	a3,0x5
80411284:	fc468693          	addi	a3,a3,-60 # 80416244 <dev_node_ops+0x4a8>
80411288:	00002617          	auipc	a2,0x2
8041128c:	ea460613          	addi	a2,a2,-348 # 8041312c <commands+0x1f8>
80411290:	3a900593          	li	a1,937
80411294:	00005517          	auipc	a0,0x5
80411298:	14c50513          	addi	a0,a0,332 # 804163e0 <dev_node_ops+0x644>
8041129c:	b88ef0ef          	jal	ra,80400624 <__panic>
804112a0:	00005697          	auipc	a3,0x5
804112a4:	30468693          	addi	a3,a3,772 # 804165a4 <sfs_node_fileops+0x70>
804112a8:	00002617          	auipc	a2,0x2
804112ac:	e8460613          	addi	a2,a2,-380 # 8041312c <commands+0x1f8>
804112b0:	17b00593          	li	a1,379
804112b4:	00005517          	auipc	a0,0x5
804112b8:	12c50513          	addi	a0,a0,300 # 804163e0 <dev_node_ops+0x644>
804112bc:	b68ef0ef          	jal	ra,80400624 <__panic>
804112c0:	00005697          	auipc	a3,0x5
804112c4:	13868693          	addi	a3,a3,312 # 804163f8 <dev_node_ops+0x65c>
804112c8:	00002617          	auipc	a2,0x2
804112cc:	e6460613          	addi	a2,a2,-412 # 8041312c <commands+0x1f8>
804112d0:	3aa00593          	li	a1,938
804112d4:	00005517          	auipc	a0,0x5
804112d8:	10c50513          	addi	a0,a0,268 # 804163e0 <dev_node_ops+0x644>
804112dc:	b48ef0ef          	jal	ra,80400624 <__panic>
804112e0:	00005697          	auipc	a3,0x5
804112e4:	2ac68693          	addi	a3,a3,684 # 8041658c <sfs_node_fileops+0x58>
804112e8:	00002617          	auipc	a2,0x2
804112ec:	e4460613          	addi	a2,a2,-444 # 8041312c <commands+0x1f8>
804112f0:	3b100593          	li	a1,945
804112f4:	00005517          	auipc	a0,0x5
804112f8:	0ec50513          	addi	a0,a0,236 # 804163e0 <dev_node_ops+0x644>
804112fc:	b28ef0ef          	jal	ra,80400624 <__panic>
80411300:	00005697          	auipc	a3,0x5
80411304:	2b868693          	addi	a3,a3,696 # 804165b8 <sfs_node_fileops+0x84>
80411308:	00002617          	auipc	a2,0x2
8041130c:	e2460613          	addi	a2,a2,-476 # 8041312c <commands+0x1f8>
80411310:	12b00593          	li	a1,299
80411314:	00005517          	auipc	a0,0x5
80411318:	0cc50513          	addi	a0,a0,204 # 804163e0 <dev_node_ops+0x644>
8041131c:	b08ef0ef          	jal	ra,80400624 <__panic>
80411320:	00005697          	auipc	a3,0x5
80411324:	2cc68693          	addi	a3,a3,716 # 804165ec <sfs_node_fileops+0xb8>
80411328:	00002617          	auipc	a2,0x2
8041132c:	e0460613          	addi	a2,a2,-508 # 8041312c <commands+0x1f8>
80411330:	3ca00593          	li	a1,970
80411334:	00005517          	auipc	a0,0x5
80411338:	0ac50513          	addi	a0,a0,172 # 804163e0 <dev_node_ops+0x644>
8041133c:	ae8ef0ef          	jal	ra,80400624 <__panic>

80411340 <sfs_tryseek>:
80411340:	080007b7          	lui	a5,0x8000
80411344:	08f5fa63          	bgeu	a1,a5,804113d8 <sfs_tryseek+0x98>
80411348:	ff010113          	addi	sp,sp,-16
8041134c:	00812423          	sw	s0,8(sp)
80411350:	00912223          	sw	s1,4(sp)
80411354:	00112623          	sw	ra,12(sp)
80411358:	00050413          	mv	s0,a0
8041135c:	00058493          	mv	s1,a1
80411360:	08050063          	beqz	a0,804113e0 <sfs_tryseek+0xa0>
80411364:	02c52703          	lw	a4,44(a0)
80411368:	000017b7          	lui	a5,0x1
8041136c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411370:	06f71863          	bne	a4,a5,804113e0 <sfs_tryseek+0xa0>
80411374:	00052783          	lw	a5,0(a0)
80411378:	0007a783          	lw	a5,0(a5)
8041137c:	04b7f263          	bgeu	a5,a1,804113c0 <sfs_tryseek+0x80>
80411380:	03c52783          	lw	a5,60(a0)
80411384:	06078e63          	beqz	a5,80411400 <sfs_tryseek+0xc0>
80411388:	0307a783          	lw	a5,48(a5)
8041138c:	06078a63          	beqz	a5,80411400 <sfs_tryseek+0xc0>
80411390:	00005597          	auipc	a1,0x5
80411394:	89858593          	addi	a1,a1,-1896 # 80415c28 <syscalls+0x8c0>
80411398:	d60fc0ef          	jal	ra,8040d8f8 <inode_check>
8041139c:	03c42783          	lw	a5,60(s0)
804113a0:	00040513          	mv	a0,s0
804113a4:	00812403          	lw	s0,8(sp)
804113a8:	00c12083          	lw	ra,12(sp)
804113ac:	00048593          	mv	a1,s1
804113b0:	0307a303          	lw	t1,48(a5)
804113b4:	00412483          	lw	s1,4(sp)
804113b8:	01010113          	addi	sp,sp,16
804113bc:	00030067          	jr	t1
804113c0:	00c12083          	lw	ra,12(sp)
804113c4:	00812403          	lw	s0,8(sp)
804113c8:	00412483          	lw	s1,4(sp)
804113cc:	00000513          	li	a0,0
804113d0:	01010113          	addi	sp,sp,16
804113d4:	00008067          	ret
804113d8:	ffd00513          	li	a0,-3
804113dc:	00008067          	ret
804113e0:	00005697          	auipc	a3,0x5
804113e4:	01868693          	addi	a3,a3,24 # 804163f8 <dev_node_ops+0x65c>
804113e8:	00002617          	auipc	a2,0x2
804113ec:	d4460613          	addi	a2,a2,-700 # 8041312c <commands+0x1f8>
804113f0:	39a00593          	li	a1,922
804113f4:	00005517          	auipc	a0,0x5
804113f8:	fec50513          	addi	a0,a0,-20 # 804163e0 <dev_node_ops+0x644>
804113fc:	a28ef0ef          	jal	ra,80400624 <__panic>
80411400:	00004697          	auipc	a3,0x4
80411404:	7d468693          	addi	a3,a3,2004 # 80415bd4 <syscalls+0x86c>
80411408:	00002617          	auipc	a2,0x2
8041140c:	d2460613          	addi	a2,a2,-732 # 8041312c <commands+0x1f8>
80411410:	39c00593          	li	a1,924
80411414:	00005517          	auipc	a0,0x5
80411418:	fcc50513          	addi	a0,a0,-52 # 804163e0 <dev_node_ops+0x644>
8041141c:	a08ef0ef          	jal	ra,80400624 <__panic>

80411420 <sfs_close>:
80411420:	ff010113          	addi	sp,sp,-16
80411424:	00112623          	sw	ra,12(sp)
80411428:	00812423          	sw	s0,8(sp)
8041142c:	04050063          	beqz	a0,8041146c <sfs_close+0x4c>
80411430:	03c52783          	lw	a5,60(a0)
80411434:	00050413          	mv	s0,a0
80411438:	02078a63          	beqz	a5,8041146c <sfs_close+0x4c>
8041143c:	0187a783          	lw	a5,24(a5)
80411440:	02078663          	beqz	a5,8041146c <sfs_close+0x4c>
80411444:	00003597          	auipc	a1,0x3
80411448:	2a058593          	addi	a1,a1,672 # 804146e4 <CSWTCH.69+0x17c>
8041144c:	cacfc0ef          	jal	ra,8040d8f8 <inode_check>
80411450:	03c42783          	lw	a5,60(s0)
80411454:	00040513          	mv	a0,s0
80411458:	00812403          	lw	s0,8(sp)
8041145c:	00c12083          	lw	ra,12(sp)
80411460:	0187a303          	lw	t1,24(a5)
80411464:	01010113          	addi	sp,sp,16
80411468:	00030067          	jr	t1
8041146c:	00003697          	auipc	a3,0x3
80411470:	22868693          	addi	a3,a3,552 # 80414694 <CSWTCH.69+0x12c>
80411474:	00002617          	auipc	a2,0x2
80411478:	cb860613          	addi	a2,a2,-840 # 8041312c <commands+0x1f8>
8041147c:	21c00593          	li	a1,540
80411480:	00005517          	auipc	a0,0x5
80411484:	f6050513          	addi	a0,a0,-160 # 804163e0 <dev_node_ops+0x644>
80411488:	99cef0ef          	jal	ra,80400624 <__panic>

8041148c <sfs_fstat>:
8041148c:	ff010113          	addi	sp,sp,-16
80411490:	00912223          	sw	s1,4(sp)
80411494:	00058493          	mv	s1,a1
80411498:	00812423          	sw	s0,8(sp)
8041149c:	01000613          	li	a2,16
804114a0:	00050413          	mv	s0,a0
804114a4:	00000593          	li	a1,0
804114a8:	00048513          	mv	a0,s1
804114ac:	00112623          	sw	ra,12(sp)
804114b0:	011010ef          	jal	ra,80412cc0 <memset>
804114b4:	06040e63          	beqz	s0,80411530 <sfs_fstat+0xa4>
804114b8:	03c42783          	lw	a5,60(s0)
804114bc:	06078a63          	beqz	a5,80411530 <sfs_fstat+0xa4>
804114c0:	0287a783          	lw	a5,40(a5)
804114c4:	06078663          	beqz	a5,80411530 <sfs_fstat+0xa4>
804114c8:	00005597          	auipc	a1,0x5
804114cc:	8b858593          	addi	a1,a1,-1864 # 80415d80 <syscalls+0xa18>
804114d0:	00040513          	mv	a0,s0
804114d4:	c24fc0ef          	jal	ra,8040d8f8 <inode_check>
804114d8:	03c42783          	lw	a5,60(s0)
804114dc:	00048593          	mv	a1,s1
804114e0:	00040513          	mv	a0,s0
804114e4:	0287a783          	lw	a5,40(a5)
804114e8:	000780e7          	jalr	a5
804114ec:	02051863          	bnez	a0,8041151c <sfs_fstat+0x90>
804114f0:	02c42703          	lw	a4,44(s0)
804114f4:	000017b7          	lui	a5,0x1
804114f8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804114fc:	04f71a63          	bne	a4,a5,80411550 <sfs_fstat+0xc4>
80411500:	00042783          	lw	a5,0(s0)
80411504:	0067d683          	lhu	a3,6(a5)
80411508:	0087a703          	lw	a4,8(a5)
8041150c:	0007a783          	lw	a5,0(a5)
80411510:	00d4a223          	sw	a3,4(s1)
80411514:	00e4a423          	sw	a4,8(s1)
80411518:	00f4a623          	sw	a5,12(s1)
8041151c:	00c12083          	lw	ra,12(sp)
80411520:	00812403          	lw	s0,8(sp)
80411524:	00412483          	lw	s1,4(sp)
80411528:	01010113          	addi	sp,sp,16
8041152c:	00008067          	ret
80411530:	00004697          	auipc	a3,0x4
80411534:	7e868693          	addi	a3,a3,2024 # 80415d18 <syscalls+0x9b0>
80411538:	00002617          	auipc	a2,0x2
8041153c:	bf460613          	addi	a2,a2,-1036 # 8041312c <commands+0x1f8>
80411540:	2b800593          	li	a1,696
80411544:	00005517          	auipc	a0,0x5
80411548:	e9c50513          	addi	a0,a0,-356 # 804163e0 <dev_node_ops+0x644>
8041154c:	8d8ef0ef          	jal	ra,80400624 <__panic>
80411550:	00005697          	auipc	a3,0x5
80411554:	ea868693          	addi	a3,a3,-344 # 804163f8 <dev_node_ops+0x65c>
80411558:	00002617          	auipc	a2,0x2
8041155c:	bd460613          	addi	a2,a2,-1068 # 8041312c <commands+0x1f8>
80411560:	2bb00593          	li	a1,699
80411564:	00005517          	auipc	a0,0x5
80411568:	e7c50513          	addi	a0,a0,-388 # 804163e0 <dev_node_ops+0x644>
8041156c:	8b8ef0ef          	jal	ra,80400624 <__panic>

80411570 <sfs_io.part.12>:
80411570:	ff010113          	addi	sp,sp,-16
80411574:	00005697          	auipc	a3,0x5
80411578:	e8468693          	addi	a3,a3,-380 # 804163f8 <dev_node_ops+0x65c>
8041157c:	00002617          	auipc	a2,0x2
80411580:	bb060613          	addi	a2,a2,-1104 # 8041312c <commands+0x1f8>
80411584:	29700593          	li	a1,663
80411588:	00005517          	auipc	a0,0x5
8041158c:	e5850513          	addi	a0,a0,-424 # 804163e0 <dev_node_ops+0x644>
80411590:	00112623          	sw	ra,12(sp)
80411594:	890ef0ef          	jal	ra,80400624 <__panic>

80411598 <sfs_read>:
80411598:	fd010113          	addi	sp,sp,-48
8041159c:	03212023          	sw	s2,32(sp)
804115a0:	03852903          	lw	s2,56(a0)
804115a4:	02112623          	sw	ra,44(sp)
804115a8:	02812423          	sw	s0,40(sp)
804115ac:	02912223          	sw	s1,36(sp)
804115b0:	01312e23          	sw	s3,28(sp)
804115b4:	08090a63          	beqz	s2,80411648 <sfs_read+0xb0>
804115b8:	06c92783          	lw	a5,108(s2)
804115bc:	08079663          	bnez	a5,80411648 <sfs_read+0xb0>
804115c0:	02c52703          	lw	a4,44(a0)
804115c4:	000017b7          	lui	a5,0x1
804115c8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804115cc:	00050413          	mv	s0,a0
804115d0:	08f71c63          	bne	a4,a5,80411668 <sfs_read+0xd0>
804115d4:	01050993          	addi	s3,a0,16
804115d8:	00098513          	mv	a0,s3
804115dc:	00058493          	mv	s1,a1
804115e0:	c5df30ef          	jal	ra,8040523c <down>
804115e4:	00c4a803          	lw	a6,12(s1)
804115e8:	0044a683          	lw	a3,4(s1)
804115ec:	0004a603          	lw	a2,0(s1)
804115f0:	00040593          	mv	a1,s0
804115f4:	00000793          	li	a5,0
804115f8:	00c10713          	addi	a4,sp,12
804115fc:	00090513          	mv	a0,s2
80411600:	01012623          	sw	a6,12(sp)
80411604:	cd4ff0ef          	jal	ra,80410ad8 <sfs_io_nolock>
80411608:	00c12583          	lw	a1,12(sp)
8041160c:	00050413          	mv	s0,a0
80411610:	02059663          	bnez	a1,8041163c <sfs_read+0xa4>
80411614:	00098513          	mv	a0,s3
80411618:	c21f30ef          	jal	ra,80405238 <up>
8041161c:	00040513          	mv	a0,s0
80411620:	02c12083          	lw	ra,44(sp)
80411624:	02812403          	lw	s0,40(sp)
80411628:	02412483          	lw	s1,36(sp)
8041162c:	02012903          	lw	s2,32(sp)
80411630:	01c12983          	lw	s3,28(sp)
80411634:	03010113          	addi	sp,sp,48
80411638:	00008067          	ret
8041163c:	00048513          	mv	a0,s1
80411640:	920f50ef          	jal	ra,80406760 <iobuf_skip>
80411644:	fd1ff06f          	j	80411614 <sfs_read+0x7c>
80411648:	00005697          	auipc	a3,0x5
8041164c:	bfc68693          	addi	a3,a3,-1028 # 80416244 <dev_node_ops+0x4a8>
80411650:	00002617          	auipc	a2,0x2
80411654:	adc60613          	addi	a2,a2,-1316 # 8041312c <commands+0x1f8>
80411658:	29600593          	li	a1,662
8041165c:	00005517          	auipc	a0,0x5
80411660:	d8450513          	addi	a0,a0,-636 # 804163e0 <dev_node_ops+0x644>
80411664:	fc1ee0ef          	jal	ra,80400624 <__panic>
80411668:	f09ff0ef          	jal	ra,80411570 <sfs_io.part.12>

8041166c <sfs_write>:
8041166c:	fd010113          	addi	sp,sp,-48
80411670:	03212023          	sw	s2,32(sp)
80411674:	03852903          	lw	s2,56(a0)
80411678:	02112623          	sw	ra,44(sp)
8041167c:	02812423          	sw	s0,40(sp)
80411680:	02912223          	sw	s1,36(sp)
80411684:	01312e23          	sw	s3,28(sp)
80411688:	08090a63          	beqz	s2,8041171c <sfs_write+0xb0>
8041168c:	06c92783          	lw	a5,108(s2)
80411690:	08079663          	bnez	a5,8041171c <sfs_write+0xb0>
80411694:	02c52703          	lw	a4,44(a0)
80411698:	000017b7          	lui	a5,0x1
8041169c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804116a0:	00050413          	mv	s0,a0
804116a4:	08f71c63          	bne	a4,a5,8041173c <sfs_write+0xd0>
804116a8:	01050993          	addi	s3,a0,16
804116ac:	00098513          	mv	a0,s3
804116b0:	00058493          	mv	s1,a1
804116b4:	b89f30ef          	jal	ra,8040523c <down>
804116b8:	00c4a803          	lw	a6,12(s1)
804116bc:	0044a683          	lw	a3,4(s1)
804116c0:	0004a603          	lw	a2,0(s1)
804116c4:	00040593          	mv	a1,s0
804116c8:	00100793          	li	a5,1
804116cc:	00c10713          	addi	a4,sp,12
804116d0:	00090513          	mv	a0,s2
804116d4:	01012623          	sw	a6,12(sp)
804116d8:	c00ff0ef          	jal	ra,80410ad8 <sfs_io_nolock>
804116dc:	00c12583          	lw	a1,12(sp)
804116e0:	00050413          	mv	s0,a0
804116e4:	02059663          	bnez	a1,80411710 <sfs_write+0xa4>
804116e8:	00098513          	mv	a0,s3
804116ec:	b4df30ef          	jal	ra,80405238 <up>
804116f0:	00040513          	mv	a0,s0
804116f4:	02c12083          	lw	ra,44(sp)
804116f8:	02812403          	lw	s0,40(sp)
804116fc:	02412483          	lw	s1,36(sp)
80411700:	02012903          	lw	s2,32(sp)
80411704:	01c12983          	lw	s3,28(sp)
80411708:	03010113          	addi	sp,sp,48
8041170c:	00008067          	ret
80411710:	00048513          	mv	a0,s1
80411714:	84cf50ef          	jal	ra,80406760 <iobuf_skip>
80411718:	fd1ff06f          	j	804116e8 <sfs_write+0x7c>
8041171c:	00005697          	auipc	a3,0x5
80411720:	b2868693          	addi	a3,a3,-1240 # 80416244 <dev_node_ops+0x4a8>
80411724:	00002617          	auipc	a2,0x2
80411728:	a0860613          	addi	a2,a2,-1528 # 8041312c <commands+0x1f8>
8041172c:	29600593          	li	a1,662
80411730:	00005517          	auipc	a0,0x5
80411734:	cb050513          	addi	a0,a0,-848 # 804163e0 <dev_node_ops+0x644>
80411738:	eedee0ef          	jal	ra,80400624 <__panic>
8041173c:	e35ff0ef          	jal	ra,80411570 <sfs_io.part.12>

80411740 <sfs_load_inode>:
80411740:	fe010113          	addi	sp,sp,-32
80411744:	00112e23          	sw	ra,28(sp)
80411748:	00812c23          	sw	s0,24(sp)
8041174c:	01212823          	sw	s2,16(sp)
80411750:	01312623          	sw	s3,12(sp)
80411754:	00050913          	mv	s2,a0
80411758:	00060993          	mv	s3,a2
8041175c:	01412423          	sw	s4,8(sp)
80411760:	00912a23          	sw	s1,20(sp)
80411764:	00058a13          	mv	s4,a1
80411768:	01512223          	sw	s5,4(sp)
8041176c:	4f5000ef          	jal	ra,80412460 <lock_sfs_fs>
80411770:	00a00593          	li	a1,10
80411774:	06892403          	lw	s0,104(s2)
80411778:	00098513          	mv	a0,s3
8041177c:	505000ef          	jal	ra,80412480 <hash32>
80411780:	00351513          	slli	a0,a0,0x3
80411784:	00a40533          	add	a0,s0,a0
80411788:	00050413          	mv	s0,a0
8041178c:	00c0006f          	j	80411798 <sfs_load_inode+0x58>
80411790:	fe042783          	lw	a5,-32(s0)
80411794:	10f98a63          	beq	s3,a5,804118a8 <sfs_load_inode+0x168>
80411798:	00442403          	lw	s0,4(s0)
8041179c:	fe851ae3          	bne	a0,s0,80411790 <sfs_load_inode+0x50>
804117a0:	04000513          	li	a0,64
804117a4:	ae8f10ef          	jal	ra,80402a8c <kmalloc>
804117a8:	00050a93          	mv	s5,a0
804117ac:	14050e63          	beqz	a0,80411908 <sfs_load_inode+0x1c8>
804117b0:	00492503          	lw	a0,4(s2)
804117b4:	00098613          	mv	a2,s3
804117b8:	03090593          	addi	a1,s2,48
804117bc:	c79fe0ef          	jal	ra,80410434 <sfs_block_inuse.isra.3>
804117c0:	1e050863          	beqz	a0,804119b0 <sfs_load_inode+0x270>
804117c4:	00000713          	li	a4,0
804117c8:	00098693          	mv	a3,s3
804117cc:	04000613          	li	a2,64
804117d0:	000a8593          	mv	a1,s5
804117d4:	00090513          	mv	a0,s2
804117d8:	125000ef          	jal	ra,804120fc <sfs_rbuf>
804117dc:	00050413          	mv	s0,a0
804117e0:	12051e63          	bnez	a0,8041191c <sfs_load_inode+0x1dc>
804117e4:	006ad783          	lhu	a5,6(s5)
804117e8:	1a078463          	beqz	a5,80411990 <sfs_load_inode+0x250>
804117ec:	00001537          	lui	a0,0x1
804117f0:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
804117f4:	830fc0ef          	jal	ra,8040d824 <__alloc_inode>
804117f8:	00050493          	mv	s1,a0
804117fc:	10050e63          	beqz	a0,80411918 <sfs_load_inode+0x1d8>
80411800:	004ad683          	lhu	a3,4(s5)
80411804:	00100793          	li	a5,1
80411808:	12f69063          	bne	a3,a5,80411928 <sfs_load_inode+0x1e8>
8041180c:	00005597          	auipc	a1,0x5
80411810:	d2858593          	addi	a1,a1,-728 # 80416534 <sfs_node_fileops>
80411814:	00090613          	mv	a2,s2
80411818:	00048513          	mv	a0,s1
8041181c:	838fc0ef          	jal	ra,8040d854 <inode_init>
80411820:	02c4a403          	lw	s0,44(s1)
80411824:	000017b7          	lui	a5,0x1
80411828:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8041182c:	14f41263          	bne	s0,a5,80411970 <sfs_load_inode+0x230>
80411830:	00100793          	li	a5,1
80411834:	00f4a623          	sw	a5,12(s1)
80411838:	0154a023          	sw	s5,0(s1)
8041183c:	0134a223          	sw	s3,4(s1)
80411840:	0004a423          	sw	zero,8(s1)
80411844:	00100593          	li	a1,1
80411848:	01048513          	addi	a0,s1,16
8041184c:	9e1f30ef          	jal	ra,8040522c <sem_init>
80411850:	02c4a783          	lw	a5,44(s1)
80411854:	0e879e63          	bne	a5,s0,80411950 <sfs_load_inode+0x210>
80411858:	06492683          	lw	a3,100(s2)
8041185c:	01c48793          	addi	a5,s1,28
80411860:	06090713          	addi	a4,s2,96
80411864:	00f6a023          	sw	a5,0(a3)
80411868:	06f92223          	sw	a5,100(s2)
8041186c:	0044a503          	lw	a0,4(s1)
80411870:	00e4ae23          	sw	a4,28(s1)
80411874:	02d4a023          	sw	a3,32(s1)
80411878:	06892403          	lw	s0,104(s2)
8041187c:	00a00593          	li	a1,10
80411880:	401000ef          	jal	ra,80412480 <hash32>
80411884:	00351513          	slli	a0,a0,0x3
80411888:	00a40533          	add	a0,s0,a0
8041188c:	00452783          	lw	a5,4(a0)
80411890:	02448713          	addi	a4,s1,36
80411894:	00e7a023          	sw	a4,0(a5)
80411898:	00e52223          	sw	a4,4(a0)
8041189c:	02f4a423          	sw	a5,40(s1)
804118a0:	02a4a223          	sw	a0,36(s1)
804118a4:	01c0006f          	j	804118c0 <sfs_load_inode+0x180>
804118a8:	fdc40493          	addi	s1,s0,-36
804118ac:	00048513          	mv	a0,s1
804118b0:	820fc0ef          	jal	ra,8040d8d0 <inode_ref_inc>
804118b4:	00100793          	li	a5,1
804118b8:	04f50063          	beq	a0,a5,804118f8 <sfs_load_inode+0x1b8>
804118bc:	ee0482e3          	beqz	s1,804117a0 <sfs_load_inode+0x60>
804118c0:	00090513          	mv	a0,s2
804118c4:	3ad000ef          	jal	ra,80412470 <unlock_sfs_fs>
804118c8:	00000413          	li	s0,0
804118cc:	009a2023          	sw	s1,0(s4)
804118d0:	00040513          	mv	a0,s0
804118d4:	01c12083          	lw	ra,28(sp)
804118d8:	01812403          	lw	s0,24(sp)
804118dc:	01412483          	lw	s1,20(sp)
804118e0:	01012903          	lw	s2,16(sp)
804118e4:	00c12983          	lw	s3,12(sp)
804118e8:	00812a03          	lw	s4,8(sp)
804118ec:	00412a83          	lw	s5,4(sp)
804118f0:	02010113          	addi	sp,sp,32
804118f4:	00008067          	ret
804118f8:	fe842783          	lw	a5,-24(s0)
804118fc:	00178793          	addi	a5,a5,1
80411900:	fef42423          	sw	a5,-24(s0)
80411904:	fb9ff06f          	j	804118bc <sfs_load_inode+0x17c>
80411908:	ffc00413          	li	s0,-4
8041190c:	00090513          	mv	a0,s2
80411910:	361000ef          	jal	ra,80412470 <unlock_sfs_fs>
80411914:	fbdff06f          	j	804118d0 <sfs_load_inode+0x190>
80411918:	ffc00413          	li	s0,-4
8041191c:	000a8513          	mv	a0,s5
80411920:	a90f10ef          	jal	ra,80402bb0 <kfree>
80411924:	fe9ff06f          	j	8041190c <sfs_load_inode+0x1cc>
80411928:	00200793          	li	a5,2
8041192c:	00005597          	auipc	a1,0x5
80411930:	bc858593          	addi	a1,a1,-1080 # 804164f4 <sfs_node_dirops>
80411934:	eef680e3          	beq	a3,a5,80411814 <sfs_load_inode+0xd4>
80411938:	00005617          	auipc	a2,0x5
8041193c:	af860613          	addi	a2,a2,-1288 # 80416430 <dev_node_ops+0x694>
80411940:	02e00593          	li	a1,46
80411944:	00005517          	auipc	a0,0x5
80411948:	a9c50513          	addi	a0,a0,-1380 # 804163e0 <dev_node_ops+0x644>
8041194c:	cd9ee0ef          	jal	ra,80400624 <__panic>
80411950:	00005697          	auipc	a3,0x5
80411954:	aa868693          	addi	a3,a3,-1368 # 804163f8 <dev_node_ops+0x65c>
80411958:	00001617          	auipc	a2,0x1
8041195c:	7d460613          	addi	a2,a2,2004 # 8041312c <commands+0x1f8>
80411960:	0b100593          	li	a1,177
80411964:	00005517          	auipc	a0,0x5
80411968:	a7c50513          	addi	a0,a0,-1412 # 804163e0 <dev_node_ops+0x644>
8041196c:	cb9ee0ef          	jal	ra,80400624 <__panic>
80411970:	00005697          	auipc	a3,0x5
80411974:	a8868693          	addi	a3,a3,-1400 # 804163f8 <dev_node_ops+0x65c>
80411978:	00001617          	auipc	a2,0x1
8041197c:	7b460613          	addi	a2,a2,1972 # 8041312c <commands+0x1f8>
80411980:	07700593          	li	a1,119
80411984:	00005517          	auipc	a0,0x5
80411988:	a5c50513          	addi	a0,a0,-1444 # 804163e0 <dev_node_ops+0x644>
8041198c:	c99ee0ef          	jal	ra,80400624 <__panic>
80411990:	00005697          	auipc	a3,0x5
80411994:	ad468693          	addi	a3,a3,-1324 # 80416464 <dev_node_ops+0x6c8>
80411998:	00001617          	auipc	a2,0x1
8041199c:	79460613          	addi	a2,a2,1940 # 8041312c <commands+0x1f8>
804119a0:	0ad00593          	li	a1,173
804119a4:	00005517          	auipc	a0,0x5
804119a8:	a3c50513          	addi	a0,a0,-1476 # 804163e0 <dev_node_ops+0x644>
804119ac:	c79ee0ef          	jal	ra,80400624 <__panic>
804119b0:	00005697          	auipc	a3,0x5
804119b4:	9c868693          	addi	a3,a3,-1592 # 80416378 <dev_node_ops+0x5dc>
804119b8:	00001617          	auipc	a2,0x1
804119bc:	77460613          	addi	a2,a2,1908 # 8041312c <commands+0x1f8>
804119c0:	0a800593          	li	a1,168
804119c4:	00005517          	auipc	a0,0x5
804119c8:	a1c50513          	addi	a0,a0,-1508 # 804163e0 <dev_node_ops+0x644>
804119cc:	c59ee0ef          	jal	ra,80400624 <__panic>

804119d0 <sfs_lookup_once.constprop.13>:
804119d0:	fd010113          	addi	sp,sp,-48
804119d4:	01312e23          	sw	s3,28(sp)
804119d8:	01058993          	addi	s3,a1,16
804119dc:	01712623          	sw	s7,12(sp)
804119e0:	00050b93          	mv	s7,a0
804119e4:	00098513          	mv	a0,s3
804119e8:	02112623          	sw	ra,44(sp)
804119ec:	03212023          	sw	s2,32(sp)
804119f0:	01512a23          	sw	s5,20(sp)
804119f4:	01812423          	sw	s8,8(sp)
804119f8:	00060a93          	mv	s5,a2
804119fc:	00058913          	mv	s2,a1
80411a00:	00068c13          	mv	s8,a3
80411a04:	02812423          	sw	s0,40(sp)
80411a08:	02912223          	sw	s1,36(sp)
80411a0c:	01412c23          	sw	s4,24(sp)
80411a10:	01612823          	sw	s6,16(sp)
80411a14:	01912223          	sw	s9,4(sp)
80411a18:	825f30ef          	jal	ra,8040523c <down>
80411a1c:	000a8513          	mv	a0,s5
80411a20:	1bc010ef          	jal	ra,80412bdc <strlen>
80411a24:	0ff00793          	li	a5,255
80411a28:	10a7ee63          	bltu	a5,a0,80411b44 <sfs_lookup_once.constprop.13+0x174>
80411a2c:	10400513          	li	a0,260
80411a30:	85cf10ef          	jal	ra,80402a8c <kmalloc>
80411a34:	00050413          	mv	s0,a0
80411a38:	0e050e63          	beqz	a0,80411b34 <sfs_lookup_once.constprop.13+0x164>
80411a3c:	00092783          	lw	a5,0(s2)
80411a40:	0087ab03          	lw	s6,8(a5)
80411a44:	09605a63          	blez	s6,80411ad8 <sfs_lookup_once.constprop.13+0x108>
80411a48:	00000493          	li	s1,0
80411a4c:	00450c93          	addi	s9,a0,4
80411a50:	0240006f          	j	80411a74 <sfs_lookup_once.constprop.13+0xa4>
80411a54:	00042783          	lw	a5,0(s0)
80411a58:	00078a63          	beqz	a5,80411a6c <sfs_lookup_once.constprop.13+0x9c>
80411a5c:	000c8593          	mv	a1,s9
80411a60:	000a8513          	mv	a0,s5
80411a64:	200010ef          	jal	ra,80412c64 <strcmp>
80411a68:	06050c63          	beqz	a0,80411ae0 <sfs_lookup_once.constprop.13+0x110>
80411a6c:	00148493          	addi	s1,s1,1
80411a70:	069b0463          	beq	s6,s1,80411ad8 <sfs_lookup_once.constprop.13+0x108>
80411a74:	00040693          	mv	a3,s0
80411a78:	00048613          	mv	a2,s1
80411a7c:	00090593          	mv	a1,s2
80411a80:	000b8513          	mv	a0,s7
80411a84:	b30ff0ef          	jal	ra,80410db4 <sfs_dirent_read_nolock>
80411a88:	00050a13          	mv	s4,a0
80411a8c:	fc0504e3          	beqz	a0,80411a54 <sfs_lookup_once.constprop.13+0x84>
80411a90:	00040513          	mv	a0,s0
80411a94:	91cf10ef          	jal	ra,80402bb0 <kfree>
80411a98:	00098513          	mv	a0,s3
80411a9c:	f9cf30ef          	jal	ra,80405238 <up>
80411aa0:	02c12083          	lw	ra,44(sp)
80411aa4:	02812403          	lw	s0,40(sp)
80411aa8:	000a0513          	mv	a0,s4
80411aac:	02412483          	lw	s1,36(sp)
80411ab0:	02012903          	lw	s2,32(sp)
80411ab4:	01c12983          	lw	s3,28(sp)
80411ab8:	01812a03          	lw	s4,24(sp)
80411abc:	01412a83          	lw	s5,20(sp)
80411ac0:	01012b03          	lw	s6,16(sp)
80411ac4:	00c12b83          	lw	s7,12(sp)
80411ac8:	00812c03          	lw	s8,8(sp)
80411acc:	00412c83          	lw	s9,4(sp)
80411ad0:	03010113          	addi	sp,sp,48
80411ad4:	00008067          	ret
80411ad8:	ff000a13          	li	s4,-16
80411adc:	fb5ff06f          	j	80411a90 <sfs_lookup_once.constprop.13+0xc0>
80411ae0:	00040513          	mv	a0,s0
80411ae4:	00042483          	lw	s1,0(s0)
80411ae8:	8c8f10ef          	jal	ra,80402bb0 <kfree>
80411aec:	00098513          	mv	a0,s3
80411af0:	f48f30ef          	jal	ra,80405238 <up>
80411af4:	02812403          	lw	s0,40(sp)
80411af8:	02c12083          	lw	ra,44(sp)
80411afc:	02012903          	lw	s2,32(sp)
80411b00:	01c12983          	lw	s3,28(sp)
80411b04:	01812a03          	lw	s4,24(sp)
80411b08:	01412a83          	lw	s5,20(sp)
80411b0c:	01012b03          	lw	s6,16(sp)
80411b10:	00412c83          	lw	s9,4(sp)
80411b14:	00048613          	mv	a2,s1
80411b18:	000c0593          	mv	a1,s8
80411b1c:	02412483          	lw	s1,36(sp)
80411b20:	00812c03          	lw	s8,8(sp)
80411b24:	000b8513          	mv	a0,s7
80411b28:	00c12b83          	lw	s7,12(sp)
80411b2c:	03010113          	addi	sp,sp,48
80411b30:	c11ff06f          	j	80411740 <sfs_load_inode>
80411b34:	00098513          	mv	a0,s3
80411b38:	f00f30ef          	jal	ra,80405238 <up>
80411b3c:	ffc00a13          	li	s4,-4
80411b40:	f61ff06f          	j	80411aa0 <sfs_lookup_once.constprop.13+0xd0>
80411b44:	00005697          	auipc	a3,0x5
80411b48:	95468693          	addi	a3,a3,-1708 # 80416498 <dev_node_ops+0x6fc>
80411b4c:	00001617          	auipc	a2,0x1
80411b50:	5e060613          	addi	a2,a2,1504 # 8041312c <commands+0x1f8>
80411b54:	1ba00593          	li	a1,442
80411b58:	00005517          	auipc	a0,0x5
80411b5c:	88850513          	addi	a0,a0,-1912 # 804163e0 <dev_node_ops+0x644>
80411b60:	ac5ee0ef          	jal	ra,80400624 <__panic>

80411b64 <sfs_namefile>:
80411b64:	00c5a703          	lw	a4,12(a1)
80411b68:	fa010113          	addi	sp,sp,-96
80411b6c:	04112e23          	sw	ra,92(sp)
80411b70:	04812c23          	sw	s0,88(sp)
80411b74:	04912a23          	sw	s1,84(sp)
80411b78:	05212823          	sw	s2,80(sp)
80411b7c:	05312623          	sw	s3,76(sp)
80411b80:	05412423          	sw	s4,72(sp)
80411b84:	05512223          	sw	s5,68(sp)
80411b88:	05612023          	sw	s6,64(sp)
80411b8c:	03712e23          	sw	s7,60(sp)
80411b90:	03812c23          	sw	s8,56(sp)
80411b94:	03912a23          	sw	s9,52(sp)
80411b98:	03a12823          	sw	s10,48(sp)
80411b9c:	03b12623          	sw	s11,44(sp)
80411ba0:	00b12623          	sw	a1,12(sp)
80411ba4:	00200793          	li	a5,2
80411ba8:	24e7f063          	bgeu	a5,a4,80411de8 <sfs_namefile+0x284>
80411bac:	00050493          	mv	s1,a0
80411bb0:	10400513          	li	a0,260
80411bb4:	ed9f00ef          	jal	ra,80402a8c <kmalloc>
80411bb8:	00050a93          	mv	s5,a0
80411bbc:	22050663          	beqz	a0,80411de8 <sfs_namefile+0x284>
80411bc0:	0384ab03          	lw	s6,56(s1)
80411bc4:	260b0663          	beqz	s6,80411e30 <sfs_namefile+0x2cc>
80411bc8:	06cb2783          	lw	a5,108(s6)
80411bcc:	26079263          	bnez	a5,80411e30 <sfs_namefile+0x2cc>
80411bd0:	02c4ac03          	lw	s8,44(s1)
80411bd4:	000017b7          	lui	a5,0x1
80411bd8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411bdc:	26fc1a63          	bne	s8,a5,80411e50 <sfs_namefile+0x2ec>
80411be0:	00c12703          	lw	a4,12(sp)
80411be4:	00048513          	mv	a0,s1
80411be8:	00048413          	mv	s0,s1
80411bec:	00c72783          	lw	a5,12(a4) # 800000c <_binary_bin_sfs_img_size+0x7f8800c>
80411bf0:	00072903          	lw	s2,0(a4)
80411bf4:	00005c97          	auipc	s9,0x5
80411bf8:	8c8c8c93          	addi	s9,s9,-1848 # 804164bc <dev_node_ops+0x720>
80411bfc:	ffe78a13          	addi	s4,a5,-2
80411c00:	00f90933          	add	s2,s2,a5
80411c04:	ccdfb0ef          	jal	ra,8040d8d0 <inode_ref_inc>
80411c08:	01c10693          	addi	a3,sp,28
80411c0c:	000c8613          	mv	a2,s9
80411c10:	00040593          	mv	a1,s0
80411c14:	000b0513          	mv	a0,s6
80411c18:	01812423          	sw	s8,8(sp)
80411c1c:	db5ff0ef          	jal	ra,804119d0 <sfs_lookup_once.constprop.13>
80411c20:	004a8b93          	addi	s7,s5,4
80411c24:	00050d93          	mv	s11,a0
80411c28:	0e051863          	bnez	a0,80411d18 <sfs_namefile+0x1b4>
80411c2c:	00048513          	mv	a0,s1
80411c30:	00442983          	lw	s3,4(s0)
80411c34:	d91fb0ef          	jal	ra,8040d9c4 <inode_ref_dec>
80411c38:	01c12d03          	lw	s10,28(sp)
80411c3c:	149d0663          	beq	s10,s1,80411d88 <sfs_namefile+0x224>
80411c40:	1c0d0863          	beqz	s10,80411e10 <sfs_namefile+0x2ac>
80411c44:	02cd2683          	lw	a3,44(s10)
80411c48:	00812783          	lw	a5,8(sp)
80411c4c:	1cf69263          	bne	a3,a5,80411e10 <sfs_namefile+0x2ac>
80411c50:	004d2683          	lw	a3,4(s10)
80411c54:	000d0413          	mv	s0,s10
80411c58:	19368c63          	beq	a3,s3,80411df0 <sfs_namefile+0x28c>
80411c5c:	000d2683          	lw	a3,0(s10)
80411c60:	00200793          	li	a5,2
80411c64:	0046d683          	lhu	a3,4(a3)
80411c68:	18f69463          	bne	a3,a5,80411df0 <sfs_namefile+0x28c>
80411c6c:	010d0493          	addi	s1,s10,16
80411c70:	00048513          	mv	a0,s1
80411c74:	dc8f30ef          	jal	ra,8040523c <down>
80411c78:	000d2683          	lw	a3,0(s10)
80411c7c:	0086ac03          	lw	s8,8(a3)
80411c80:	01804c63          	bgtz	s8,80411c98 <sfs_namefile+0x134>
80411c84:	0e40006f          	j	80411d68 <sfs_namefile+0x204>
80411c88:	000aa683          	lw	a3,0(s5)
80411c8c:	02d98663          	beq	s3,a3,80411cb8 <sfs_namefile+0x154>
80411c90:	001d8d93          	addi	s11,s11,1
80411c94:	0dbc0a63          	beq	s8,s11,80411d68 <sfs_namefile+0x204>
80411c98:	000a8693          	mv	a3,s5
80411c9c:	000d8613          	mv	a2,s11
80411ca0:	000d0593          	mv	a1,s10
80411ca4:	000b0513          	mv	a0,s6
80411ca8:	90cff0ef          	jal	ra,80410db4 <sfs_dirent_read_nolock>
80411cac:	00050693          	mv	a3,a0
80411cb0:	fc050ce3          	beqz	a0,80411c88 <sfs_namefile+0x124>
80411cb4:	0b80006f          	j	80411d6c <sfs_namefile+0x208>
80411cb8:	00048513          	mv	a0,s1
80411cbc:	d7cf30ef          	jal	ra,80405238 <up>
80411cc0:	000b8513          	mv	a0,s7
80411cc4:	719000ef          	jal	ra,80412bdc <strlen>
80411cc8:	00150713          	addi	a4,a0,1
80411ccc:	10ea6863          	bltu	s4,a4,80411ddc <sfs_namefile+0x278>
80411cd0:	fff54993          	not	s3,a0
80411cd4:	013909b3          	add	s3,s2,s3
80411cd8:	00050613          	mv	a2,a0
80411cdc:	000b8593          	mv	a1,s7
80411ce0:	00098513          	mv	a0,s3
80411ce4:	40ea0a33          	sub	s4,s4,a4
80411ce8:	048010ef          	jal	ra,80412d30 <memcpy>
80411cec:	02f00793          	li	a5,47
80411cf0:	fef90fa3          	sb	a5,-1(s2)
80411cf4:	01c10693          	addi	a3,sp,28
80411cf8:	000c8613          	mv	a2,s9
80411cfc:	00040593          	mv	a1,s0
80411d00:	000b0513          	mv	a0,s6
80411d04:	ccdff0ef          	jal	ra,804119d0 <sfs_lookup_once.constprop.13>
80411d08:	000d0493          	mv	s1,s10
80411d0c:	00098913          	mv	s2,s3
80411d10:	00050d93          	mv	s11,a0
80411d14:	f0050ce3          	beqz	a0,80411c2c <sfs_namefile+0xc8>
80411d18:	00048513          	mv	a0,s1
80411d1c:	ca9fb0ef          	jal	ra,8040d9c4 <inode_ref_dec>
80411d20:	000a8513          	mv	a0,s5
80411d24:	e8df00ef          	jal	ra,80402bb0 <kfree>
80411d28:	05c12083          	lw	ra,92(sp)
80411d2c:	05812403          	lw	s0,88(sp)
80411d30:	000d8513          	mv	a0,s11
80411d34:	05412483          	lw	s1,84(sp)
80411d38:	05012903          	lw	s2,80(sp)
80411d3c:	04c12983          	lw	s3,76(sp)
80411d40:	04812a03          	lw	s4,72(sp)
80411d44:	04412a83          	lw	s5,68(sp)
80411d48:	04012b03          	lw	s6,64(sp)
80411d4c:	03c12b83          	lw	s7,60(sp)
80411d50:	03812c03          	lw	s8,56(sp)
80411d54:	03412c83          	lw	s9,52(sp)
80411d58:	03012d03          	lw	s10,48(sp)
80411d5c:	02c12d83          	lw	s11,44(sp)
80411d60:	06010113          	addi	sp,sp,96
80411d64:	00008067          	ret
80411d68:	ff000693          	li	a3,-16
80411d6c:	00048513          	mv	a0,s1
80411d70:	00d12423          	sw	a3,8(sp)
80411d74:	cc4f30ef          	jal	ra,80405238 <up>
80411d78:	00812683          	lw	a3,8(sp)
80411d7c:	000d0493          	mv	s1,s10
80411d80:	00068d93          	mv	s11,a3
80411d84:	f95ff06f          	j	80411d18 <sfs_namefile+0x1b4>
80411d88:	00048513          	mv	a0,s1
80411d8c:	c39fb0ef          	jal	ra,8040d9c4 <inode_ref_dec>
80411d90:	00c12403          	lw	s0,12(sp)
80411d94:	00090593          	mv	a1,s2
80411d98:	00c42783          	lw	a5,12(s0)
80411d9c:	00042503          	lw	a0,0(s0)
80411da0:	ffe78793          	addi	a5,a5,-2
80411da4:	41478a33          	sub	s4,a5,s4
80411da8:	000a0613          	mv	a2,s4
80411dac:	00150513          	addi	a0,a0,1
80411db0:	72d000ef          	jal	ra,80412cdc <memmove>
80411db4:	02f00793          	li	a5,47
80411db8:	fef50fa3          	sb	a5,-1(a0)
80411dbc:	01450533          	add	a0,a0,s4
80411dc0:	00050023          	sb	zero,0(a0)
80411dc4:	000a0593          	mv	a1,s4
80411dc8:	00040513          	mv	a0,s0
80411dcc:	995f40ef          	jal	ra,80406760 <iobuf_skip>
80411dd0:	000a8513          	mv	a0,s5
80411dd4:	dddf00ef          	jal	ra,80402bb0 <kfree>
80411dd8:	f51ff06f          	j	80411d28 <sfs_namefile+0x1c4>
80411ddc:	000d0493          	mv	s1,s10
80411de0:	ffc00d93          	li	s11,-4
80411de4:	f35ff06f          	j	80411d18 <sfs_namefile+0x1b4>
80411de8:	ffc00d93          	li	s11,-4
80411dec:	f3dff06f          	j	80411d28 <sfs_namefile+0x1c4>
80411df0:	00004697          	auipc	a3,0x4
80411df4:	6d068693          	addi	a3,a3,1744 # 804164c0 <dev_node_ops+0x724>
80411df8:	00001617          	auipc	a2,0x1
80411dfc:	33460613          	addi	a2,a2,820 # 8041312c <commands+0x1f8>
80411e00:	2f900593          	li	a1,761
80411e04:	00004517          	auipc	a0,0x4
80411e08:	5dc50513          	addi	a0,a0,1500 # 804163e0 <dev_node_ops+0x644>
80411e0c:	819ee0ef          	jal	ra,80400624 <__panic>
80411e10:	00004697          	auipc	a3,0x4
80411e14:	5e868693          	addi	a3,a3,1512 # 804163f8 <dev_node_ops+0x65c>
80411e18:	00001617          	auipc	a2,0x1
80411e1c:	31460613          	addi	a2,a2,788 # 8041312c <commands+0x1f8>
80411e20:	2f800593          	li	a1,760
80411e24:	00004517          	auipc	a0,0x4
80411e28:	5bc50513          	addi	a0,a0,1468 # 804163e0 <dev_node_ops+0x644>
80411e2c:	ff8ee0ef          	jal	ra,80400624 <__panic>
80411e30:	00004697          	auipc	a3,0x4
80411e34:	41468693          	addi	a3,a3,1044 # 80416244 <dev_node_ops+0x4a8>
80411e38:	00001617          	auipc	a2,0x1
80411e3c:	2f460613          	addi	a2,a2,756 # 8041312c <commands+0x1f8>
80411e40:	2e400593          	li	a1,740
80411e44:	00004517          	auipc	a0,0x4
80411e48:	59c50513          	addi	a0,a0,1436 # 804163e0 <dev_node_ops+0x644>
80411e4c:	fd8ee0ef          	jal	ra,80400624 <__panic>
80411e50:	00004697          	auipc	a3,0x4
80411e54:	5a868693          	addi	a3,a3,1448 # 804163f8 <dev_node_ops+0x65c>
80411e58:	00001617          	auipc	a2,0x1
80411e5c:	2d460613          	addi	a2,a2,724 # 8041312c <commands+0x1f8>
80411e60:	2e500593          	li	a1,741
80411e64:	00004517          	auipc	a0,0x4
80411e68:	57c50513          	addi	a0,a0,1404 # 804163e0 <dev_node_ops+0x644>
80411e6c:	fb8ee0ef          	jal	ra,80400624 <__panic>

80411e70 <sfs_lookup>:
80411e70:	fd010113          	addi	sp,sp,-48
80411e74:	02912223          	sw	s1,36(sp)
80411e78:	03852483          	lw	s1,56(a0)
80411e7c:	02112623          	sw	ra,44(sp)
80411e80:	02812423          	sw	s0,40(sp)
80411e84:	03212023          	sw	s2,32(sp)
80411e88:	01312e23          	sw	s3,28(sp)
80411e8c:	0c048463          	beqz	s1,80411f54 <sfs_lookup+0xe4>
80411e90:	06c4a783          	lw	a5,108(s1)
80411e94:	0c079063          	bnez	a5,80411f54 <sfs_lookup+0xe4>
80411e98:	0005c783          	lbu	a5,0(a1)
80411e9c:	00058913          	mv	s2,a1
80411ea0:	08078a63          	beqz	a5,80411f34 <sfs_lookup+0xc4>
80411ea4:	02f00713          	li	a4,47
80411ea8:	08e78663          	beq	a5,a4,80411f34 <sfs_lookup+0xc4>
80411eac:	00050413          	mv	s0,a0
80411eb0:	00060993          	mv	s3,a2
80411eb4:	a1dfb0ef          	jal	ra,8040d8d0 <inode_ref_inc>
80411eb8:	02c42703          	lw	a4,44(s0)
80411ebc:	000017b7          	lui	a5,0x1
80411ec0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
80411ec4:	0af71863          	bne	a4,a5,80411f74 <sfs_lookup+0x104>
80411ec8:	00042703          	lw	a4,0(s0)
80411ecc:	00200793          	li	a5,2
80411ed0:	00475703          	lhu	a4,4(a4)
80411ed4:	04f71863          	bne	a4,a5,80411f24 <sfs_lookup+0xb4>
80411ed8:	00048513          	mv	a0,s1
80411edc:	00c10693          	addi	a3,sp,12
80411ee0:	00090613          	mv	a2,s2
80411ee4:	00040593          	mv	a1,s0
80411ee8:	ae9ff0ef          	jal	ra,804119d0 <sfs_lookup_once.constprop.13>
80411eec:	00050493          	mv	s1,a0
80411ef0:	00040513          	mv	a0,s0
80411ef4:	ad1fb0ef          	jal	ra,8040d9c4 <inode_ref_dec>
80411ef8:	00049663          	bnez	s1,80411f04 <sfs_lookup+0x94>
80411efc:	00c12783          	lw	a5,12(sp)
80411f00:	00f9a023          	sw	a5,0(s3)
80411f04:	02c12083          	lw	ra,44(sp)
80411f08:	02812403          	lw	s0,40(sp)
80411f0c:	00048513          	mv	a0,s1
80411f10:	02012903          	lw	s2,32(sp)
80411f14:	02412483          	lw	s1,36(sp)
80411f18:	01c12983          	lw	s3,28(sp)
80411f1c:	03010113          	addi	sp,sp,48
80411f20:	00008067          	ret
80411f24:	00040513          	mv	a0,s0
80411f28:	a9dfb0ef          	jal	ra,8040d9c4 <inode_ref_dec>
80411f2c:	fee00493          	li	s1,-18
80411f30:	fd5ff06f          	j	80411f04 <sfs_lookup+0x94>
80411f34:	00004697          	auipc	a3,0x4
80411f38:	54468693          	addi	a3,a3,1348 # 80416478 <dev_node_ops+0x6dc>
80411f3c:	00001617          	auipc	a2,0x1
80411f40:	1f060613          	addi	a2,a2,496 # 8041312c <commands+0x1f8>
80411f44:	3db00593          	li	a1,987
80411f48:	00004517          	auipc	a0,0x4
80411f4c:	49850513          	addi	a0,a0,1176 # 804163e0 <dev_node_ops+0x644>
80411f50:	ed4ee0ef          	jal	ra,80400624 <__panic>
80411f54:	00004697          	auipc	a3,0x4
80411f58:	2f068693          	addi	a3,a3,752 # 80416244 <dev_node_ops+0x4a8>
80411f5c:	00001617          	auipc	a2,0x1
80411f60:	1d060613          	addi	a2,a2,464 # 8041312c <commands+0x1f8>
80411f64:	3da00593          	li	a1,986
80411f68:	00004517          	auipc	a0,0x4
80411f6c:	47850513          	addi	a0,a0,1144 # 804163e0 <dev_node_ops+0x644>
80411f70:	eb4ee0ef          	jal	ra,80400624 <__panic>
80411f74:	00004697          	auipc	a3,0x4
80411f78:	48468693          	addi	a3,a3,1156 # 804163f8 <dev_node_ops+0x65c>
80411f7c:	00001617          	auipc	a2,0x1
80411f80:	1b060613          	addi	a2,a2,432 # 8041312c <commands+0x1f8>
80411f84:	3dd00593          	li	a1,989
80411f88:	00004517          	auipc	a0,0x4
80411f8c:	45850513          	addi	a0,a0,1112 # 804163e0 <dev_node_ops+0x644>
80411f90:	e94ee0ef          	jal	ra,80400624 <__panic>

80411f94 <sfs_rwblock_nolock.isra.0>:
80411f94:	fe010113          	addi	sp,sp,-32
80411f98:	00812c23          	sw	s0,24(sp)
80411f9c:	00912a23          	sw	s1,20(sp)
80411fa0:	00112e23          	sw	ra,28(sp)
80411fa4:	00058493          	mv	s1,a1
80411fa8:	00070413          	mv	s0,a4
80411fac:	00060593          	mv	a1,a2
80411fb0:	00069463          	bnez	a3,80411fb8 <sfs_rwblock_nolock.isra.0+0x24>
80411fb4:	04079463          	bnez	a5,80411ffc <sfs_rwblock_nolock.isra.0+0x68>
80411fb8:	00052783          	lw	a5,0(a0)
80411fbc:	04f6f063          	bgeu	a3,a5,80411ffc <sfs_rwblock_nolock.isra.0+0x68>
80411fc0:	00001637          	lui	a2,0x1
80411fc4:	00c69693          	slli	a3,a3,0xc
80411fc8:	00010513          	mv	a0,sp
80411fcc:	ec4f40ef          	jal	ra,80406690 <iobuf_init>
80411fd0:	0004a783          	lw	a5,0(s1)
80411fd4:	00050593          	mv	a1,a0
80411fd8:	00040613          	mv	a2,s0
80411fdc:	0107a703          	lw	a4,16(a5)
80411fe0:	00078513          	mv	a0,a5
80411fe4:	000700e7          	jalr	a4
80411fe8:	01c12083          	lw	ra,28(sp)
80411fec:	01812403          	lw	s0,24(sp)
80411ff0:	01412483          	lw	s1,20(sp)
80411ff4:	02010113          	addi	sp,sp,32
80411ff8:	00008067          	ret
80411ffc:	00004697          	auipc	a3,0x4
80412000:	64c68693          	addi	a3,a3,1612 # 80416648 <sfs_node_fileops+0x114>
80412004:	00001617          	auipc	a2,0x1
80412008:	12860613          	addi	a2,a2,296 # 8041312c <commands+0x1f8>
8041200c:	01500593          	li	a1,21
80412010:	00004517          	auipc	a0,0x4
80412014:	66c50513          	addi	a0,a0,1644 # 8041667c <sfs_node_fileops+0x148>
80412018:	e0cee0ef          	jal	ra,80400624 <__panic>

8041201c <sfs_rwblock>:
8041201c:	fd010113          	addi	sp,sp,-48
80412020:	02812423          	sw	s0,40(sp)
80412024:	03212023          	sw	s2,32(sp)
80412028:	01812423          	sw	s8,8(sp)
8041202c:	00060413          	mv	s0,a2
80412030:	00050c13          	mv	s8,a0
80412034:	00068913          	mv	s2,a3
80412038:	02912223          	sw	s1,36(sp)
8041203c:	01312e23          	sw	s3,28(sp)
80412040:	01412c23          	sw	s4,24(sp)
80412044:	01512a23          	sw	s5,20(sp)
80412048:	01612823          	sw	s6,16(sp)
8041204c:	01712623          	sw	s7,12(sp)
80412050:	02112623          	sw	ra,44(sp)
80412054:	00058493          	mv	s1,a1
80412058:	00070a93          	mv	s5,a4
8041205c:	00450a13          	addi	s4,a0,4
80412060:	01240bb3          	add	s7,s0,s2
80412064:	404000ef          	jal	ra,80412468 <lock_sfs_io>
80412068:	02cc0993          	addi	s3,s8,44
8041206c:	00001b37          	lui	s6,0x1
80412070:	00091863          	bnez	s2,80412080 <sfs_rwblock+0x64>
80412074:	0700006f          	j	804120e4 <sfs_rwblock+0xc8>
80412078:	016484b3          	add	s1,s1,s6
8041207c:	068b8463          	beq	s7,s0,804120e4 <sfs_rwblock+0xc8>
80412080:	00040693          	mv	a3,s0
80412084:	00048613          	mv	a2,s1
80412088:	00100793          	li	a5,1
8041208c:	000a8713          	mv	a4,s5
80412090:	00098593          	mv	a1,s3
80412094:	000a0513          	mv	a0,s4
80412098:	efdff0ef          	jal	ra,80411f94 <sfs_rwblock_nolock.isra.0>
8041209c:	00050913          	mv	s2,a0
804120a0:	00140413          	addi	s0,s0,1
804120a4:	fc050ae3          	beqz	a0,80412078 <sfs_rwblock+0x5c>
804120a8:	000c0513          	mv	a0,s8
804120ac:	3cc000ef          	jal	ra,80412478 <unlock_sfs_io>
804120b0:	02c12083          	lw	ra,44(sp)
804120b4:	02812403          	lw	s0,40(sp)
804120b8:	00090513          	mv	a0,s2
804120bc:	02412483          	lw	s1,36(sp)
804120c0:	02012903          	lw	s2,32(sp)
804120c4:	01c12983          	lw	s3,28(sp)
804120c8:	01812a03          	lw	s4,24(sp)
804120cc:	01412a83          	lw	s5,20(sp)
804120d0:	01012b03          	lw	s6,16(sp)
804120d4:	00c12b83          	lw	s7,12(sp)
804120d8:	00812c03          	lw	s8,8(sp)
804120dc:	03010113          	addi	sp,sp,48
804120e0:	00008067          	ret
804120e4:	00000913          	li	s2,0
804120e8:	fc1ff06f          	j	804120a8 <sfs_rwblock+0x8c>

804120ec <sfs_rblock>:
804120ec:	00000713          	li	a4,0
804120f0:	f2dff06f          	j	8041201c <sfs_rwblock>

804120f4 <sfs_wblock>:
804120f4:	00100713          	li	a4,1
804120f8:	f25ff06f          	j	8041201c <sfs_rwblock>

804120fc <sfs_rbuf>:
804120fc:	fe010113          	addi	sp,sp,-32
80412100:	00112e23          	sw	ra,28(sp)
80412104:	00812c23          	sw	s0,24(sp)
80412108:	00912a23          	sw	s1,20(sp)
8041210c:	01212823          	sw	s2,16(sp)
80412110:	01312623          	sw	s3,12(sp)
80412114:	01412423          	sw	s4,8(sp)
80412118:	000017b7          	lui	a5,0x1
8041211c:	08f77663          	bgeu	a4,a5,804121a8 <sfs_rbuf+0xac>
80412120:	00070493          	mv	s1,a4
80412124:	00c70733          	add	a4,a4,a2
80412128:	00060993          	mv	s3,a2
8041212c:	06e7ee63          	bltu	a5,a4,804121a8 <sfs_rbuf+0xac>
80412130:	00050413          	mv	s0,a0
80412134:	00068913          	mv	s2,a3
80412138:	00058a13          	mv	s4,a1
8041213c:	32c000ef          	jal	ra,80412468 <lock_sfs_io>
80412140:	03842603          	lw	a2,56(s0)
80412144:	00090693          	mv	a3,s2
80412148:	00100793          	li	a5,1
8041214c:	00000713          	li	a4,0
80412150:	02c40593          	addi	a1,s0,44
80412154:	00440513          	addi	a0,s0,4
80412158:	e3dff0ef          	jal	ra,80411f94 <sfs_rwblock_nolock.isra.0>
8041215c:	00050913          	mv	s2,a0
80412160:	02050863          	beqz	a0,80412190 <sfs_rbuf+0x94>
80412164:	00040513          	mv	a0,s0
80412168:	310000ef          	jal	ra,80412478 <unlock_sfs_io>
8041216c:	01c12083          	lw	ra,28(sp)
80412170:	01812403          	lw	s0,24(sp)
80412174:	00090513          	mv	a0,s2
80412178:	01412483          	lw	s1,20(sp)
8041217c:	01012903          	lw	s2,16(sp)
80412180:	00c12983          	lw	s3,12(sp)
80412184:	00812a03          	lw	s4,8(sp)
80412188:	02010113          	addi	sp,sp,32
8041218c:	00008067          	ret
80412190:	03842583          	lw	a1,56(s0)
80412194:	00098613          	mv	a2,s3
80412198:	000a0513          	mv	a0,s4
8041219c:	009585b3          	add	a1,a1,s1
804121a0:	391000ef          	jal	ra,80412d30 <memcpy>
804121a4:	fc1ff06f          	j	80412164 <sfs_rbuf+0x68>
804121a8:	00004697          	auipc	a3,0x4
804121ac:	45c68693          	addi	a3,a3,1116 # 80416604 <sfs_node_fileops+0xd0>
804121b0:	00001617          	auipc	a2,0x1
804121b4:	f7c60613          	addi	a2,a2,-132 # 8041312c <commands+0x1f8>
804121b8:	05500593          	li	a1,85
804121bc:	00004517          	auipc	a0,0x4
804121c0:	4c050513          	addi	a0,a0,1216 # 8041667c <sfs_node_fileops+0x148>
804121c4:	c60ee0ef          	jal	ra,80400624 <__panic>

804121c8 <sfs_wbuf>:
804121c8:	fd010113          	addi	sp,sp,-48
804121cc:	02112623          	sw	ra,44(sp)
804121d0:	02812423          	sw	s0,40(sp)
804121d4:	02912223          	sw	s1,36(sp)
804121d8:	03212023          	sw	s2,32(sp)
804121dc:	01312e23          	sw	s3,28(sp)
804121e0:	01412c23          	sw	s4,24(sp)
804121e4:	01512a23          	sw	s5,20(sp)
804121e8:	01612823          	sw	s6,16(sp)
804121ec:	01712623          	sw	s7,12(sp)
804121f0:	000017b7          	lui	a5,0x1
804121f4:	0cf77063          	bgeu	a4,a5,804122b4 <sfs_wbuf+0xec>
804121f8:	00070493          	mv	s1,a4
804121fc:	00c70733          	add	a4,a4,a2
80412200:	00060a13          	mv	s4,a2
80412204:	0ae7e863          	bltu	a5,a4,804122b4 <sfs_wbuf+0xec>
80412208:	00050413          	mv	s0,a0
8041220c:	00058b93          	mv	s7,a1
80412210:	00068993          	mv	s3,a3
80412214:	254000ef          	jal	ra,80412468 <lock_sfs_io>
80412218:	03842603          	lw	a2,56(s0)
8041221c:	00440a93          	addi	s5,s0,4
80412220:	02c40b13          	addi	s6,s0,44
80412224:	00100793          	li	a5,1
80412228:	00000713          	li	a4,0
8041222c:	00098693          	mv	a3,s3
80412230:	000b0593          	mv	a1,s6
80412234:	000a8513          	mv	a0,s5
80412238:	d5dff0ef          	jal	ra,80411f94 <sfs_rwblock_nolock.isra.0>
8041223c:	00050913          	mv	s2,a0
80412240:	02050e63          	beqz	a0,8041227c <sfs_wbuf+0xb4>
80412244:	00040513          	mv	a0,s0
80412248:	230000ef          	jal	ra,80412478 <unlock_sfs_io>
8041224c:	02c12083          	lw	ra,44(sp)
80412250:	02812403          	lw	s0,40(sp)
80412254:	00090513          	mv	a0,s2
80412258:	02412483          	lw	s1,36(sp)
8041225c:	02012903          	lw	s2,32(sp)
80412260:	01c12983          	lw	s3,28(sp)
80412264:	01812a03          	lw	s4,24(sp)
80412268:	01412a83          	lw	s5,20(sp)
8041226c:	01012b03          	lw	s6,16(sp)
80412270:	00c12b83          	lw	s7,12(sp)
80412274:	03010113          	addi	sp,sp,48
80412278:	00008067          	ret
8041227c:	03842503          	lw	a0,56(s0)
80412280:	000a0613          	mv	a2,s4
80412284:	000b8593          	mv	a1,s7
80412288:	00950533          	add	a0,a0,s1
8041228c:	2a5000ef          	jal	ra,80412d30 <memcpy>
80412290:	03842603          	lw	a2,56(s0)
80412294:	00100793          	li	a5,1
80412298:	00100713          	li	a4,1
8041229c:	00098693          	mv	a3,s3
804122a0:	000b0593          	mv	a1,s6
804122a4:	000a8513          	mv	a0,s5
804122a8:	cedff0ef          	jal	ra,80411f94 <sfs_rwblock_nolock.isra.0>
804122ac:	00050913          	mv	s2,a0
804122b0:	f95ff06f          	j	80412244 <sfs_wbuf+0x7c>
804122b4:	00004697          	auipc	a3,0x4
804122b8:	35068693          	addi	a3,a3,848 # 80416604 <sfs_node_fileops+0xd0>
804122bc:	00001617          	auipc	a2,0x1
804122c0:	e7060613          	addi	a2,a2,-400 # 8041312c <commands+0x1f8>
804122c4:	06b00593          	li	a1,107
804122c8:	00004517          	auipc	a0,0x4
804122cc:	3b450513          	addi	a0,a0,948 # 8041667c <sfs_node_fileops+0x148>
804122d0:	b54ee0ef          	jal	ra,80400624 <__panic>

804122d4 <sfs_sync_super>:
804122d4:	ff010113          	addi	sp,sp,-16
804122d8:	00112623          	sw	ra,12(sp)
804122dc:	00812423          	sw	s0,8(sp)
804122e0:	00912223          	sw	s1,4(sp)
804122e4:	00050413          	mv	s0,a0
804122e8:	180000ef          	jal	ra,80412468 <lock_sfs_io>
804122ec:	03842503          	lw	a0,56(s0)
804122f0:	00001637          	lui	a2,0x1
804122f4:	00000593          	li	a1,0
804122f8:	1c9000ef          	jal	ra,80412cc0 <memset>
804122fc:	03842503          	lw	a0,56(s0)
80412300:	00040593          	mv	a1,s0
80412304:	02c00613          	li	a2,44
80412308:	229000ef          	jal	ra,80412d30 <memcpy>
8041230c:	03842603          	lw	a2,56(s0)
80412310:	02c40593          	addi	a1,s0,44
80412314:	00000793          	li	a5,0
80412318:	00100713          	li	a4,1
8041231c:	00000693          	li	a3,0
80412320:	00440513          	addi	a0,s0,4
80412324:	c71ff0ef          	jal	ra,80411f94 <sfs_rwblock_nolock.isra.0>
80412328:	00050493          	mv	s1,a0
8041232c:	00040513          	mv	a0,s0
80412330:	148000ef          	jal	ra,80412478 <unlock_sfs_io>
80412334:	00c12083          	lw	ra,12(sp)
80412338:	00812403          	lw	s0,8(sp)
8041233c:	00048513          	mv	a0,s1
80412340:	00412483          	lw	s1,4(sp)
80412344:	01010113          	addi	sp,sp,16
80412348:	00008067          	ret

8041234c <sfs_sync_freemap>:
8041234c:	ff010113          	addi	sp,sp,-16
80412350:	00812423          	sw	s0,8(sp)
80412354:	00452403          	lw	s0,4(a0)
80412358:	00912223          	sw	s1,4(sp)
8041235c:	000086b7          	lui	a3,0x8
80412360:	00050493          	mv	s1,a0
80412364:	03052503          	lw	a0,48(a0)
80412368:	fff68693          	addi	a3,a3,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8041236c:	00d40433          	add	s0,s0,a3
80412370:	00000593          	li	a1,0
80412374:	00112623          	sw	ra,12(sp)
80412378:	00f45413          	srli	s0,s0,0xf
8041237c:	f2cfd0ef          	jal	ra,8040faa8 <bitmap_getdata>
80412380:	00040693          	mv	a3,s0
80412384:	00812403          	lw	s0,8(sp)
80412388:	00c12083          	lw	ra,12(sp)
8041238c:	00050593          	mv	a1,a0
80412390:	00048513          	mv	a0,s1
80412394:	00412483          	lw	s1,4(sp)
80412398:	00100713          	li	a4,1
8041239c:	00200613          	li	a2,2
804123a0:	01010113          	addi	sp,sp,16
804123a4:	c79ff06f          	j	8041201c <sfs_rwblock>

804123a8 <sfs_clear_block>:
804123a8:	fe010113          	addi	sp,sp,-32
804123ac:	00112e23          	sw	ra,28(sp)
804123b0:	00812c23          	sw	s0,24(sp)
804123b4:	00912a23          	sw	s1,20(sp)
804123b8:	00058413          	mv	s0,a1
804123bc:	00060493          	mv	s1,a2
804123c0:	01212823          	sw	s2,16(sp)
804123c4:	01312623          	sw	s3,12(sp)
804123c8:	00050913          	mv	s2,a0
804123cc:	01412423          	sw	s4,8(sp)
804123d0:	01512223          	sw	s5,4(sp)
804123d4:	094000ef          	jal	ra,80412468 <lock_sfs_io>
804123d8:	03892503          	lw	a0,56(s2)
804123dc:	00001637          	lui	a2,0x1
804123e0:	00000593          	li	a1,0
804123e4:	0dd000ef          	jal	ra,80412cc0 <memset>
804123e8:	00940ab3          	add	s5,s0,s1
804123ec:	00490a13          	addi	s4,s2,4
804123f0:	02c90993          	addi	s3,s2,44
804123f4:	00049663          	bnez	s1,80412400 <sfs_clear_block+0x58>
804123f8:	0600006f          	j	80412458 <sfs_clear_block+0xb0>
804123fc:	05540e63          	beq	s0,s5,80412458 <sfs_clear_block+0xb0>
80412400:	03892603          	lw	a2,56(s2)
80412404:	00040693          	mv	a3,s0
80412408:	00100793          	li	a5,1
8041240c:	00100713          	li	a4,1
80412410:	00098593          	mv	a1,s3
80412414:	000a0513          	mv	a0,s4
80412418:	b7dff0ef          	jal	ra,80411f94 <sfs_rwblock_nolock.isra.0>
8041241c:	00050493          	mv	s1,a0
80412420:	00140413          	addi	s0,s0,1
80412424:	fc050ce3          	beqz	a0,804123fc <sfs_clear_block+0x54>
80412428:	00090513          	mv	a0,s2
8041242c:	04c000ef          	jal	ra,80412478 <unlock_sfs_io>
80412430:	01c12083          	lw	ra,28(sp)
80412434:	01812403          	lw	s0,24(sp)
80412438:	00048513          	mv	a0,s1
8041243c:	01012903          	lw	s2,16(sp)
80412440:	01412483          	lw	s1,20(sp)
80412444:	00c12983          	lw	s3,12(sp)
80412448:	00812a03          	lw	s4,8(sp)
8041244c:	00412a83          	lw	s5,4(sp)
80412450:	02010113          	addi	sp,sp,32
80412454:	00008067          	ret
80412458:	00000493          	li	s1,0
8041245c:	fcdff06f          	j	80412428 <sfs_clear_block+0x80>

80412460 <lock_sfs_fs>:
80412460:	03c50513          	addi	a0,a0,60
80412464:	dd9f206f          	j	8040523c <down>

80412468 <lock_sfs_io>:
80412468:	04850513          	addi	a0,a0,72
8041246c:	dd1f206f          	j	8040523c <down>

80412470 <unlock_sfs_fs>:
80412470:	03c50513          	addi	a0,a0,60
80412474:	dc5f206f          	j	80405238 <up>

80412478 <unlock_sfs_io>:
80412478:	04850513          	addi	a0,a0,72
8041247c:	dbdf206f          	j	80405238 <up>

80412480 <hash32>:
80412480:	00351793          	slli	a5,a0,0x3
80412484:	40a787b3          	sub	a5,a5,a0
80412488:	00679793          	slli	a5,a5,0x6
8041248c:	40a78733          	sub	a4,a5,a0
80412490:	00371793          	slli	a5,a4,0x3
80412494:	40e787b3          	sub	a5,a5,a4
80412498:	00379793          	slli	a5,a5,0x3
8041249c:	00a787b3          	add	a5,a5,a0
804124a0:	01079793          	slli	a5,a5,0x10
804124a4:	40f50533          	sub	a0,a0,a5
804124a8:	02000793          	li	a5,32
804124ac:	40b785b3          	sub	a1,a5,a1
804124b0:	00b55533          	srl	a0,a0,a1
804124b4:	00008067          	ret

804124b8 <printnum>:
804124b8:	fd010113          	addi	sp,sp,-48
804124bc:	02912223          	sw	s1,36(sp)
804124c0:	01312e23          	sw	s3,28(sp)
804124c4:	00050493          	mv	s1,a0
804124c8:	00058993          	mv	s3,a1
804124cc:	00068513          	mv	a0,a3
804124d0:	00078593          	mv	a1,a5
804124d4:	02812423          	sw	s0,40(sp)
804124d8:	03212023          	sw	s2,32(sp)
804124dc:	01412c23          	sw	s4,24(sp)
804124e0:	01512a23          	sw	s5,20(sp)
804124e4:	01612823          	sw	s6,16(sp)
804124e8:	01712623          	sw	s7,12(sp)
804124ec:	01812423          	sw	s8,8(sp)
804124f0:	02112623          	sw	ra,44(sp)
804124f4:	00068b13          	mv	s6,a3
804124f8:	00078a93          	mv	s5,a5
804124fc:	00070c13          	mv	s8,a4
80412500:	00060913          	mv	s2,a2
80412504:	00088a13          	mv	s4,a7
80412508:	fff80413          	addi	s0,a6,-1
8041250c:	0bd000ef          	jal	ra,80412dc8 <__umodsi3>
80412510:	00050b93          	mv	s7,a0
80412514:	060c1863          	bnez	s8,80412584 <printnum+0xcc>
80412518:	075b7663          	bgeu	s6,s5,80412584 <printnum+0xcc>
8041251c:	00805e63          	blez	s0,80412538 <printnum+0x80>
80412520:	fff40413          	addi	s0,s0,-1
80412524:	00098613          	mv	a2,s3
80412528:	00090593          	mv	a1,s2
8041252c:	000a0513          	mv	a0,s4
80412530:	000480e7          	jalr	s1
80412534:	fe0416e3          	bnez	s0,80412520 <printnum+0x68>
80412538:	00004517          	auipc	a0,0x4
8041253c:	31850513          	addi	a0,a0,792 # 80416850 <error_string+0x64>
80412540:	01750533          	add	a0,a0,s7
80412544:	02812403          	lw	s0,40(sp)
80412548:	02c12083          	lw	ra,44(sp)
8041254c:	01812a03          	lw	s4,24(sp)
80412550:	01412a83          	lw	s5,20(sp)
80412554:	01012b03          	lw	s6,16(sp)
80412558:	00c12b83          	lw	s7,12(sp)
8041255c:	00812c03          	lw	s8,8(sp)
80412560:	00054503          	lbu	a0,0(a0)
80412564:	00098613          	mv	a2,s3
80412568:	00090593          	mv	a1,s2
8041256c:	01c12983          	lw	s3,28(sp)
80412570:	02012903          	lw	s2,32(sp)
80412574:	00048313          	mv	t1,s1
80412578:	02412483          	lw	s1,36(sp)
8041257c:	03010113          	addi	sp,sp,48
80412580:	00030067          	jr	t1
80412584:	000a8593          	mv	a1,s5
80412588:	000b0513          	mv	a0,s6
8041258c:	7f4000ef          	jal	ra,80412d80 <__udivsi3>
80412590:	00050693          	mv	a3,a0
80412594:	000a0893          	mv	a7,s4
80412598:	00040813          	mv	a6,s0
8041259c:	000a8793          	mv	a5,s5
804125a0:	00000713          	li	a4,0
804125a4:	00090613          	mv	a2,s2
804125a8:	00098593          	mv	a1,s3
804125ac:	00048513          	mv	a0,s1
804125b0:	f09ff0ef          	jal	ra,804124b8 <printnum>
804125b4:	f85ff06f          	j	80412538 <printnum+0x80>

804125b8 <sprintputch>:
804125b8:	0085a783          	lw	a5,8(a1)
804125bc:	0005a703          	lw	a4,0(a1)
804125c0:	0045a683          	lw	a3,4(a1)
804125c4:	00178793          	addi	a5,a5,1 # 1001 <_binary_bin_swap_img_size-0x6fff>
804125c8:	00f5a423          	sw	a5,8(a1)
804125cc:	00d77863          	bgeu	a4,a3,804125dc <sprintputch+0x24>
804125d0:	00170793          	addi	a5,a4,1
804125d4:	00f5a023          	sw	a5,0(a1)
804125d8:	00a70023          	sb	a0,0(a4)
804125dc:	00008067          	ret

804125e0 <vprintfmt>:
804125e0:	fb010113          	addi	sp,sp,-80
804125e4:	04912223          	sw	s1,68(sp)
804125e8:	05212023          	sw	s2,64(sp)
804125ec:	03312e23          	sw	s3,60(sp)
804125f0:	03512a23          	sw	s5,52(sp)
804125f4:	03612823          	sw	s6,48(sp)
804125f8:	03712623          	sw	s7,44(sp)
804125fc:	03812423          	sw	s8,40(sp)
80412600:	01b12e23          	sw	s11,28(sp)
80412604:	04112623          	sw	ra,76(sp)
80412608:	04812423          	sw	s0,72(sp)
8041260c:	03412c23          	sw	s4,56(sp)
80412610:	03912223          	sw	s9,36(sp)
80412614:	03a12023          	sw	s10,32(sp)
80412618:	00050993          	mv	s3,a0
8041261c:	00058913          	mv	s2,a1
80412620:	00060493          	mv	s1,a2
80412624:	00068d93          	mv	s11,a3
80412628:	00070b13          	mv	s6,a4
8041262c:	00004a97          	auipc	s5,0x4
80412630:	068a8a93          	addi	s5,s5,104 # 80416694 <sfs_node_fileops+0x160>
80412634:	fff00b93          	li	s7,-1
80412638:	05e00c13          	li	s8,94
8041263c:	000dc503          	lbu	a0,0(s11)
80412640:	02500793          	li	a5,37
80412644:	001d8413          	addi	s0,s11,1
80412648:	02f50663          	beq	a0,a5,80412674 <vprintfmt+0x94>
8041264c:	06050663          	beqz	a0,804126b8 <vprintfmt+0xd8>
80412650:	02500a13          	li	s4,37
80412654:	0080006f          	j	8041265c <vprintfmt+0x7c>
80412658:	06050063          	beqz	a0,804126b8 <vprintfmt+0xd8>
8041265c:	00090613          	mv	a2,s2
80412660:	00048593          	mv	a1,s1
80412664:	00140413          	addi	s0,s0,1
80412668:	000980e7          	jalr	s3
8041266c:	fff44503          	lbu	a0,-1(s0)
80412670:	ff4514e3          	bne	a0,s4,80412658 <vprintfmt+0x78>
80412674:	00044503          	lbu	a0,0(s0)
80412678:	02000893          	li	a7,32
8041267c:	00000a13          	li	s4,0
80412680:	00000593          	li	a1,0
80412684:	fff00c93          	li	s9,-1
80412688:	fff00d13          	li	s10,-1
8041268c:	05500693          	li	a3,85
80412690:	00900613          	li	a2,9
80412694:	fdd50793          	addi	a5,a0,-35
80412698:	0ff7f793          	andi	a5,a5,255
8041269c:	00140d93          	addi	s11,s0,1
804126a0:	2ef6e663          	bltu	a3,a5,8041298c <vprintfmt+0x3ac>
804126a4:	00279793          	slli	a5,a5,0x2
804126a8:	015787b3          	add	a5,a5,s5
804126ac:	0007a783          	lw	a5,0(a5)
804126b0:	015787b3          	add	a5,a5,s5
804126b4:	00078067          	jr	a5
804126b8:	04c12083          	lw	ra,76(sp)
804126bc:	04812403          	lw	s0,72(sp)
804126c0:	04412483          	lw	s1,68(sp)
804126c4:	04012903          	lw	s2,64(sp)
804126c8:	03c12983          	lw	s3,60(sp)
804126cc:	03812a03          	lw	s4,56(sp)
804126d0:	03412a83          	lw	s5,52(sp)
804126d4:	03012b03          	lw	s6,48(sp)
804126d8:	02c12b83          	lw	s7,44(sp)
804126dc:	02812c03          	lw	s8,40(sp)
804126e0:	02412c83          	lw	s9,36(sp)
804126e4:	02012d03          	lw	s10,32(sp)
804126e8:	01c12d83          	lw	s11,28(sp)
804126ec:	05010113          	addi	sp,sp,80
804126f0:	00008067          	ret
804126f4:	00050893          	mv	a7,a0
804126f8:	00144503          	lbu	a0,1(s0)
804126fc:	000d8413          	mv	s0,s11
80412700:	f95ff06f          	j	80412694 <vprintfmt+0xb4>
80412704:	000b2c83          	lw	s9,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
80412708:	00144503          	lbu	a0,1(s0)
8041270c:	004b0b13          	addi	s6,s6,4
80412710:	000d8413          	mv	s0,s11
80412714:	f80d50e3          	bgez	s10,80412694 <vprintfmt+0xb4>
80412718:	000c8d13          	mv	s10,s9
8041271c:	fff00c93          	li	s9,-1
80412720:	f75ff06f          	j	80412694 <vprintfmt+0xb4>
80412724:	fffd4793          	not	a5,s10
80412728:	41f7d793          	srai	a5,a5,0x1f
8041272c:	00144503          	lbu	a0,1(s0)
80412730:	00fd7d33          	and	s10,s10,a5
80412734:	000d8413          	mv	s0,s11
80412738:	f5dff06f          	j	80412694 <vprintfmt+0xb4>
8041273c:	00100793          	li	a5,1
80412740:	32b7c463          	blt	a5,a1,80412a68 <vprintfmt+0x488>
80412744:	000b2683          	lw	a3,0(s6)
80412748:	00000713          	li	a4,0
8041274c:	004b0b13          	addi	s6,s6,4
80412750:	01000793          	li	a5,16
80412754:	000d0813          	mv	a6,s10
80412758:	00048613          	mv	a2,s1
8041275c:	00090593          	mv	a1,s2
80412760:	00098513          	mv	a0,s3
80412764:	d55ff0ef          	jal	ra,804124b8 <printnum>
80412768:	ed5ff06f          	j	8041263c <vprintfmt+0x5c>
8041276c:	00144303          	lbu	t1,1(s0)
80412770:	fd050c93          	addi	s9,a0,-48
80412774:	000d8413          	mv	s0,s11
80412778:	fd030793          	addi	a5,t1,-48
8041277c:	00030513          	mv	a0,t1
80412780:	f8f66ae3          	bltu	a2,a5,80412714 <vprintfmt+0x134>
80412784:	002c9793          	slli	a5,s9,0x2
80412788:	01978733          	add	a4,a5,s9
8041278c:	00140413          	addi	s0,s0,1
80412790:	00171713          	slli	a4,a4,0x1
80412794:	00670733          	add	a4,a4,t1
80412798:	00044303          	lbu	t1,0(s0)
8041279c:	fd070c93          	addi	s9,a4,-48
804127a0:	fd030793          	addi	a5,t1,-48
804127a4:	00030513          	mv	a0,t1
804127a8:	fcf67ee3          	bgeu	a2,a5,80412784 <vprintfmt+0x1a4>
804127ac:	f69ff06f          	j	80412714 <vprintfmt+0x134>
804127b0:	000b2503          	lw	a0,0(s6)
804127b4:	00090613          	mv	a2,s2
804127b8:	00048593          	mv	a1,s1
804127bc:	004b0b13          	addi	s6,s6,4
804127c0:	000980e7          	jalr	s3
804127c4:	e79ff06f          	j	8041263c <vprintfmt+0x5c>
804127c8:	00100793          	li	a5,1
804127cc:	28b7c263          	blt	a5,a1,80412a50 <vprintfmt+0x470>
804127d0:	000b2a03          	lw	s4,0(s6)
804127d4:	004b0793          	addi	a5,s6,4
804127d8:	00078b13          	mv	s6,a5
804127dc:	41fa5413          	srai	s0,s4,0x1f
804127e0:	2c044063          	bltz	s0,80412aa0 <vprintfmt+0x4c0>
804127e4:	000a0693          	mv	a3,s4
804127e8:	00040713          	mv	a4,s0
804127ec:	00a00793          	li	a5,10
804127f0:	f65ff06f          	j	80412754 <vprintfmt+0x174>
804127f4:	000b2703          	lw	a4,0(s6)
804127f8:	01800693          	li	a3,24
804127fc:	004b0b13          	addi	s6,s6,4
80412800:	41f75793          	srai	a5,a4,0x1f
80412804:	00e7c733          	xor	a4,a5,a4
80412808:	40f70733          	sub	a4,a4,a5
8041280c:	1ae6ca63          	blt	a3,a4,804129c0 <vprintfmt+0x3e0>
80412810:	00271793          	slli	a5,a4,0x2
80412814:	00004697          	auipc	a3,0x4
80412818:	fd868693          	addi	a3,a3,-40 # 804167ec <error_string>
8041281c:	00f687b3          	add	a5,a3,a5
80412820:	0007a783          	lw	a5,0(a5)
80412824:	18078e63          	beqz	a5,804129c0 <vprintfmt+0x3e0>
80412828:	00078713          	mv	a4,a5
8041282c:	00000697          	auipc	a3,0x0
80412830:	62468693          	addi	a3,a3,1572 # 80412e50 <etext+0x24>
80412834:	00048613          	mv	a2,s1
80412838:	00090593          	mv	a1,s2
8041283c:	00098513          	mv	a0,s3
80412840:	2cc000ef          	jal	ra,80412b0c <printfmt>
80412844:	df9ff06f          	j	8041263c <vprintfmt+0x5c>
80412848:	000b2783          	lw	a5,0(s6)
8041284c:	004b0b13          	addi	s6,s6,4
80412850:	28078e63          	beqz	a5,80412aec <vprintfmt+0x50c>
80412854:	00178413          	addi	s0,a5,1
80412858:	1fa05063          	blez	s10,80412a38 <vprintfmt+0x458>
8041285c:	02d00693          	li	a3,45
80412860:	18d89663          	bne	a7,a3,804129ec <vprintfmt+0x40c>
80412864:	0007c783          	lbu	a5,0(a5)
80412868:	00078513          	mv	a0,a5
8041286c:	04078263          	beqz	a5,804128b0 <vprintfmt+0x2d0>
80412870:	000cc663          	bltz	s9,8041287c <vprintfmt+0x29c>
80412874:	fffc8c93          	addi	s9,s9,-1
80412878:	037c8a63          	beq	s9,s7,804128ac <vprintfmt+0x2cc>
8041287c:	00090613          	mv	a2,s2
80412880:	00048593          	mv	a1,s1
80412884:	1c0a0263          	beqz	s4,80412a48 <vprintfmt+0x468>
80412888:	fe078793          	addi	a5,a5,-32
8041288c:	1afc7e63          	bgeu	s8,a5,80412a48 <vprintfmt+0x468>
80412890:	03f00513          	li	a0,63
80412894:	000980e7          	jalr	s3
80412898:	00140413          	addi	s0,s0,1
8041289c:	fff44783          	lbu	a5,-1(s0)
804128a0:	fffd0d13          	addi	s10,s10,-1
804128a4:	00078513          	mv	a0,a5
804128a8:	fc0794e3          	bnez	a5,80412870 <vprintfmt+0x290>
804128ac:	d9a058e3          	blez	s10,8041263c <vprintfmt+0x5c>
804128b0:	fffd0d13          	addi	s10,s10,-1
804128b4:	00090613          	mv	a2,s2
804128b8:	00048593          	mv	a1,s1
804128bc:	02000513          	li	a0,32
804128c0:	000980e7          	jalr	s3
804128c4:	d60d0ce3          	beqz	s10,8041263c <vprintfmt+0x5c>
804128c8:	fffd0d13          	addi	s10,s10,-1
804128cc:	00090613          	mv	a2,s2
804128d0:	00048593          	mv	a1,s1
804128d4:	02000513          	li	a0,32
804128d8:	000980e7          	jalr	s3
804128dc:	fc0d1ae3          	bnez	s10,804128b0 <vprintfmt+0x2d0>
804128e0:	d5dff06f          	j	8041263c <vprintfmt+0x5c>
804128e4:	00100793          	li	a5,1
804128e8:	18b7ce63          	blt	a5,a1,80412a84 <vprintfmt+0x4a4>
804128ec:	000b2683          	lw	a3,0(s6)
804128f0:	00000713          	li	a4,0
804128f4:	004b0b13          	addi	s6,s6,4
804128f8:	00800793          	li	a5,8
804128fc:	e59ff06f          	j	80412754 <vprintfmt+0x174>
80412900:	03000513          	li	a0,48
80412904:	00090613          	mv	a2,s2
80412908:	00048593          	mv	a1,s1
8041290c:	01112423          	sw	a7,8(sp)
80412910:	000980e7          	jalr	s3
80412914:	00090613          	mv	a2,s2
80412918:	00048593          	mv	a1,s1
8041291c:	07800513          	li	a0,120
80412920:	000980e7          	jalr	s3
80412924:	004b0b13          	addi	s6,s6,4
80412928:	ffcb2683          	lw	a3,-4(s6)
8041292c:	00000713          	li	a4,0
80412930:	01000793          	li	a5,16
80412934:	00812883          	lw	a7,8(sp)
80412938:	e1dff06f          	j	80412754 <vprintfmt+0x174>
8041293c:	00144503          	lbu	a0,1(s0)
80412940:	00158593          	addi	a1,a1,1
80412944:	000d8413          	mv	s0,s11
80412948:	d4dff06f          	j	80412694 <vprintfmt+0xb4>
8041294c:	00144503          	lbu	a0,1(s0)
80412950:	00100a13          	li	s4,1
80412954:	000d8413          	mv	s0,s11
80412958:	d3dff06f          	j	80412694 <vprintfmt+0xb4>
8041295c:	00090613          	mv	a2,s2
80412960:	00048593          	mv	a1,s1
80412964:	02500513          	li	a0,37
80412968:	000980e7          	jalr	s3
8041296c:	cd1ff06f          	j	8041263c <vprintfmt+0x5c>
80412970:	00100793          	li	a5,1
80412974:	14b7ce63          	blt	a5,a1,80412ad0 <vprintfmt+0x4f0>
80412978:	000b2683          	lw	a3,0(s6)
8041297c:	00000713          	li	a4,0
80412980:	004b0b13          	addi	s6,s6,4
80412984:	00a00793          	li	a5,10
80412988:	dcdff06f          	j	80412754 <vprintfmt+0x174>
8041298c:	00090613          	mv	a2,s2
80412990:	00048593          	mv	a1,s1
80412994:	02500513          	li	a0,37
80412998:	000980e7          	jalr	s3
8041299c:	fff44703          	lbu	a4,-1(s0)
804129a0:	02500793          	li	a5,37
804129a4:	00040d93          	mv	s11,s0
804129a8:	c8f70ae3          	beq	a4,a5,8041263c <vprintfmt+0x5c>
804129ac:	02500713          	li	a4,37
804129b0:	fffd8d93          	addi	s11,s11,-1
804129b4:	fffdc783          	lbu	a5,-1(s11)
804129b8:	fee79ce3          	bne	a5,a4,804129b0 <vprintfmt+0x3d0>
804129bc:	c81ff06f          	j	8041263c <vprintfmt+0x5c>
804129c0:	00004697          	auipc	a3,0x4
804129c4:	05868693          	addi	a3,a3,88 # 80416a18 <error_string+0x22c>
804129c8:	00048613          	mv	a2,s1
804129cc:	00090593          	mv	a1,s2
804129d0:	00098513          	mv	a0,s3
804129d4:	138000ef          	jal	ra,80412b0c <printfmt>
804129d8:	c65ff06f          	j	8041263c <vprintfmt+0x5c>
804129dc:	00004797          	auipc	a5,0x4
804129e0:	03478793          	addi	a5,a5,52 # 80416a10 <error_string+0x224>
804129e4:	00004417          	auipc	s0,0x4
804129e8:	02d40413          	addi	s0,s0,45 # 80416a11 <error_string+0x225>
804129ec:	00078513          	mv	a0,a5
804129f0:	000c8593          	mv	a1,s9
804129f4:	01112623          	sw	a7,12(sp)
804129f8:	00f12423          	sw	a5,8(sp)
804129fc:	210000ef          	jal	ra,80412c0c <strnlen>
80412a00:	40ad0d33          	sub	s10,s10,a0
80412a04:	00812783          	lw	a5,8(sp)
80412a08:	00c12883          	lw	a7,12(sp)
80412a0c:	03a05663          	blez	s10,80412a38 <vprintfmt+0x458>
80412a10:	00088513          	mv	a0,a7
80412a14:	00090613          	mv	a2,s2
80412a18:	00048593          	mv	a1,s1
80412a1c:	00f12623          	sw	a5,12(sp)
80412a20:	01112423          	sw	a7,8(sp)
80412a24:	fffd0d13          	addi	s10,s10,-1
80412a28:	000980e7          	jalr	s3
80412a2c:	00812883          	lw	a7,8(sp)
80412a30:	00c12783          	lw	a5,12(sp)
80412a34:	fc0d1ee3          	bnez	s10,80412a10 <vprintfmt+0x430>
80412a38:	0007c783          	lbu	a5,0(a5)
80412a3c:	00078513          	mv	a0,a5
80412a40:	e20798e3          	bnez	a5,80412870 <vprintfmt+0x290>
80412a44:	bf9ff06f          	j	8041263c <vprintfmt+0x5c>
80412a48:	000980e7          	jalr	s3
80412a4c:	e4dff06f          	j	80412898 <vprintfmt+0x2b8>
80412a50:	007b0793          	addi	a5,s6,7
80412a54:	ff87f793          	andi	a5,a5,-8
80412a58:	00878b13          	addi	s6,a5,8
80412a5c:	0007aa03          	lw	s4,0(a5)
80412a60:	0047a403          	lw	s0,4(a5)
80412a64:	d7dff06f          	j	804127e0 <vprintfmt+0x200>
80412a68:	007b0793          	addi	a5,s6,7
80412a6c:	ff87f793          	andi	a5,a5,-8
80412a70:	00878b13          	addi	s6,a5,8
80412a74:	0007a683          	lw	a3,0(a5)
80412a78:	0047a703          	lw	a4,4(a5)
80412a7c:	01000793          	li	a5,16
80412a80:	cd5ff06f          	j	80412754 <vprintfmt+0x174>
80412a84:	007b0793          	addi	a5,s6,7
80412a88:	ff87f793          	andi	a5,a5,-8
80412a8c:	00878b13          	addi	s6,a5,8
80412a90:	0007a683          	lw	a3,0(a5)
80412a94:	0047a703          	lw	a4,4(a5)
80412a98:	00800793          	li	a5,8
80412a9c:	cb9ff06f          	j	80412754 <vprintfmt+0x174>
80412aa0:	00090613          	mv	a2,s2
80412aa4:	00048593          	mv	a1,s1
80412aa8:	02d00513          	li	a0,45
80412aac:	01112423          	sw	a7,8(sp)
80412ab0:	000980e7          	jalr	s3
80412ab4:	414006b3          	neg	a3,s4
80412ab8:	00d037b3          	snez	a5,a3
80412abc:	40800733          	neg	a4,s0
80412ac0:	40f70733          	sub	a4,a4,a5
80412ac4:	00812883          	lw	a7,8(sp)
80412ac8:	00a00793          	li	a5,10
80412acc:	c89ff06f          	j	80412754 <vprintfmt+0x174>
80412ad0:	007b0793          	addi	a5,s6,7
80412ad4:	ff87f793          	andi	a5,a5,-8
80412ad8:	00878b13          	addi	s6,a5,8
80412adc:	0007a683          	lw	a3,0(a5)
80412ae0:	0047a703          	lw	a4,4(a5)
80412ae4:	00a00793          	li	a5,10
80412ae8:	c6dff06f          	j	80412754 <vprintfmt+0x174>
80412aec:	01a05663          	blez	s10,80412af8 <vprintfmt+0x518>
80412af0:	02d00793          	li	a5,45
80412af4:	eef894e3          	bne	a7,a5,804129dc <vprintfmt+0x3fc>
80412af8:	00004417          	auipc	s0,0x4
80412afc:	f1940413          	addi	s0,s0,-231 # 80416a11 <error_string+0x225>
80412b00:	02800513          	li	a0,40
80412b04:	02800793          	li	a5,40
80412b08:	d69ff06f          	j	80412870 <vprintfmt+0x290>

80412b0c <printfmt>:
80412b0c:	fd010113          	addi	sp,sp,-48
80412b10:	02010313          	addi	t1,sp,32
80412b14:	02e12023          	sw	a4,32(sp)
80412b18:	00030713          	mv	a4,t1
80412b1c:	00112e23          	sw	ra,28(sp)
80412b20:	02f12223          	sw	a5,36(sp)
80412b24:	03012423          	sw	a6,40(sp)
80412b28:	03112623          	sw	a7,44(sp)
80412b2c:	00612623          	sw	t1,12(sp)
80412b30:	ab1ff0ef          	jal	ra,804125e0 <vprintfmt>
80412b34:	01c12083          	lw	ra,28(sp)
80412b38:	03010113          	addi	sp,sp,48
80412b3c:	00008067          	ret

80412b40 <vsnprintf>:
80412b40:	fff58593          	addi	a1,a1,-1
80412b44:	fe010113          	addi	sp,sp,-32
80412b48:	00b505b3          	add	a1,a0,a1
80412b4c:	00112e23          	sw	ra,28(sp)
80412b50:	00a12223          	sw	a0,4(sp)
80412b54:	00b12423          	sw	a1,8(sp)
80412b58:	00012623          	sw	zero,12(sp)
80412b5c:	04050063          	beqz	a0,80412b9c <vsnprintf+0x5c>
80412b60:	02a5ee63          	bltu	a1,a0,80412b9c <vsnprintf+0x5c>
80412b64:	ffff75b7          	lui	a1,0xffff7
80412b68:	00068713          	mv	a4,a3
80412b6c:	00000517          	auipc	a0,0x0
80412b70:	a4c50513          	addi	a0,a0,-1460 # 804125b8 <sprintputch>
80412b74:	00060693          	mv	a3,a2
80412b78:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5a21d>
80412b7c:	00410613          	addi	a2,sp,4
80412b80:	a61ff0ef          	jal	ra,804125e0 <vprintfmt>
80412b84:	00412783          	lw	a5,4(sp)
80412b88:	00078023          	sb	zero,0(a5)
80412b8c:	00c12503          	lw	a0,12(sp)
80412b90:	01c12083          	lw	ra,28(sp)
80412b94:	02010113          	addi	sp,sp,32
80412b98:	00008067          	ret
80412b9c:	ffd00513          	li	a0,-3
80412ba0:	ff1ff06f          	j	80412b90 <vsnprintf+0x50>

80412ba4 <snprintf>:
80412ba4:	fc010113          	addi	sp,sp,-64
80412ba8:	02c10313          	addi	t1,sp,44
80412bac:	02d12623          	sw	a3,44(sp)
80412bb0:	00030693          	mv	a3,t1
80412bb4:	00112e23          	sw	ra,28(sp)
80412bb8:	02e12823          	sw	a4,48(sp)
80412bbc:	02f12a23          	sw	a5,52(sp)
80412bc0:	03012c23          	sw	a6,56(sp)
80412bc4:	03112e23          	sw	a7,60(sp)
80412bc8:	00612623          	sw	t1,12(sp)
80412bcc:	f75ff0ef          	jal	ra,80412b40 <vsnprintf>
80412bd0:	01c12083          	lw	ra,28(sp)
80412bd4:	04010113          	addi	sp,sp,64
80412bd8:	00008067          	ret

80412bdc <strlen>:
80412bdc:	00054783          	lbu	a5,0(a0)
80412be0:	02078063          	beqz	a5,80412c00 <strlen+0x24>
80412be4:	00000793          	li	a5,0
80412be8:	00178793          	addi	a5,a5,1
80412bec:	00f50733          	add	a4,a0,a5
80412bf0:	00074703          	lbu	a4,0(a4)
80412bf4:	fe071ae3          	bnez	a4,80412be8 <strlen+0xc>
80412bf8:	00078513          	mv	a0,a5
80412bfc:	00008067          	ret
80412c00:	00000793          	li	a5,0
80412c04:	00078513          	mv	a0,a5
80412c08:	00008067          	ret

80412c0c <strnlen>:
80412c0c:	02058863          	beqz	a1,80412c3c <strnlen+0x30>
80412c10:	00054783          	lbu	a5,0(a0)
80412c14:	02078463          	beqz	a5,80412c3c <strnlen+0x30>
80412c18:	00000793          	li	a5,0
80412c1c:	00c0006f          	j	80412c28 <strnlen+0x1c>
80412c20:	00074703          	lbu	a4,0(a4)
80412c24:	00070863          	beqz	a4,80412c34 <strnlen+0x28>
80412c28:	00178793          	addi	a5,a5,1
80412c2c:	00f50733          	add	a4,a0,a5
80412c30:	fef598e3          	bne	a1,a5,80412c20 <strnlen+0x14>
80412c34:	00078513          	mv	a0,a5
80412c38:	00008067          	ret
80412c3c:	00000793          	li	a5,0
80412c40:	00078513          	mv	a0,a5
80412c44:	00008067          	ret

80412c48 <strcpy>:
80412c48:	00050793          	mv	a5,a0
80412c4c:	00158593          	addi	a1,a1,1
80412c50:	fff5c703          	lbu	a4,-1(a1)
80412c54:	00178793          	addi	a5,a5,1
80412c58:	fee78fa3          	sb	a4,-1(a5)
80412c5c:	fe0718e3          	bnez	a4,80412c4c <strcpy+0x4>
80412c60:	00008067          	ret

80412c64 <strcmp>:
80412c64:	00054783          	lbu	a5,0(a0)
80412c68:	0005c703          	lbu	a4,0(a1)
80412c6c:	00078e63          	beqz	a5,80412c88 <strcmp+0x24>
80412c70:	00e79e63          	bne	a5,a4,80412c8c <strcmp+0x28>
80412c74:	00150513          	addi	a0,a0,1
80412c78:	00054783          	lbu	a5,0(a0)
80412c7c:	00158593          	addi	a1,a1,1
80412c80:	0005c703          	lbu	a4,0(a1)
80412c84:	fe0796e3          	bnez	a5,80412c70 <strcmp+0xc>
80412c88:	00000793          	li	a5,0
80412c8c:	40e78533          	sub	a0,a5,a4
80412c90:	00008067          	ret

80412c94 <strchr>:
80412c94:	00054783          	lbu	a5,0(a0)
80412c98:	00078e63          	beqz	a5,80412cb4 <strchr+0x20>
80412c9c:	00b79663          	bne	a5,a1,80412ca8 <strchr+0x14>
80412ca0:	01c0006f          	j	80412cbc <strchr+0x28>
80412ca4:	00b78a63          	beq	a5,a1,80412cb8 <strchr+0x24>
80412ca8:	00150513          	addi	a0,a0,1
80412cac:	00054783          	lbu	a5,0(a0)
80412cb0:	fe079ae3          	bnez	a5,80412ca4 <strchr+0x10>
80412cb4:	00000513          	li	a0,0
80412cb8:	00008067          	ret
80412cbc:	00008067          	ret

80412cc0 <memset>:
80412cc0:	00060c63          	beqz	a2,80412cd8 <memset+0x18>
80412cc4:	00c50633          	add	a2,a0,a2
80412cc8:	00050793          	mv	a5,a0
80412ccc:	00178793          	addi	a5,a5,1
80412cd0:	feb78fa3          	sb	a1,-1(a5)
80412cd4:	fec79ce3          	bne	a5,a2,80412ccc <memset+0xc>
80412cd8:	00008067          	ret

80412cdc <memmove>:
80412cdc:	02a5f663          	bgeu	a1,a0,80412d08 <memmove+0x2c>
80412ce0:	00c587b3          	add	a5,a1,a2
80412ce4:	02f57263          	bgeu	a0,a5,80412d08 <memmove+0x2c>
80412ce8:	00c50733          	add	a4,a0,a2
80412cec:	02060e63          	beqz	a2,80412d28 <memmove+0x4c>
80412cf0:	fff78793          	addi	a5,a5,-1
80412cf4:	0007c683          	lbu	a3,0(a5)
80412cf8:	fff70713          	addi	a4,a4,-1
80412cfc:	00d70023          	sb	a3,0(a4)
80412d00:	fef598e3          	bne	a1,a5,80412cf0 <memmove+0x14>
80412d04:	00008067          	ret
80412d08:	00c586b3          	add	a3,a1,a2
80412d0c:	00050793          	mv	a5,a0
80412d10:	00060e63          	beqz	a2,80412d2c <memmove+0x50>
80412d14:	00158593          	addi	a1,a1,1
80412d18:	fff5c703          	lbu	a4,-1(a1)
80412d1c:	00178793          	addi	a5,a5,1
80412d20:	fee78fa3          	sb	a4,-1(a5)
80412d24:	fed598e3          	bne	a1,a3,80412d14 <memmove+0x38>
80412d28:	00008067          	ret
80412d2c:	00008067          	ret

80412d30 <memcpy>:
80412d30:	02060063          	beqz	a2,80412d50 <memcpy+0x20>
80412d34:	00c58633          	add	a2,a1,a2
80412d38:	00050793          	mv	a5,a0
80412d3c:	00158593          	addi	a1,a1,1
80412d40:	fff5c703          	lbu	a4,-1(a1)
80412d44:	00178793          	addi	a5,a5,1
80412d48:	fee78fa3          	sb	a4,-1(a5)
80412d4c:	fec598e3          	bne	a1,a2,80412d3c <memcpy+0xc>
80412d50:	00008067          	ret

80412d54 <__mulsi3>:
80412d54:	00050613          	mv	a2,a0
80412d58:	00000513          	li	a0,0
80412d5c:	0015f693          	andi	a3,a1,1
80412d60:	00068463          	beqz	a3,80412d68 <__mulsi3+0x14>
80412d64:	00c50533          	add	a0,a0,a2
80412d68:	0015d593          	srli	a1,a1,0x1
80412d6c:	00161613          	slli	a2,a2,0x1
80412d70:	fe0596e3          	bnez	a1,80412d5c <__mulsi3+0x8>
80412d74:	00008067          	ret

80412d78 <__divsi3>:
80412d78:	06054063          	bltz	a0,80412dd8 <__umodsi3+0x10>
80412d7c:	0605c663          	bltz	a1,80412de8 <__umodsi3+0x20>

80412d80 <__udivsi3>:
80412d80:	00058613          	mv	a2,a1
80412d84:	00050593          	mv	a1,a0
80412d88:	fff00513          	li	a0,-1
80412d8c:	02060c63          	beqz	a2,80412dc4 <__udivsi3+0x44>
80412d90:	00100693          	li	a3,1
80412d94:	00b67a63          	bgeu	a2,a1,80412da8 <__udivsi3+0x28>
80412d98:	00c05863          	blez	a2,80412da8 <__udivsi3+0x28>
80412d9c:	00161613          	slli	a2,a2,0x1
80412da0:	00169693          	slli	a3,a3,0x1
80412da4:	feb66ae3          	bltu	a2,a1,80412d98 <__udivsi3+0x18>
80412da8:	00000513          	li	a0,0
80412dac:	00c5e663          	bltu	a1,a2,80412db8 <__udivsi3+0x38>
80412db0:	40c585b3          	sub	a1,a1,a2
80412db4:	00d56533          	or	a0,a0,a3
80412db8:	0016d693          	srli	a3,a3,0x1
80412dbc:	00165613          	srli	a2,a2,0x1
80412dc0:	fe0696e3          	bnez	a3,80412dac <__udivsi3+0x2c>
80412dc4:	00008067          	ret

80412dc8 <__umodsi3>:
80412dc8:	00008293          	mv	t0,ra
80412dcc:	fb5ff0ef          	jal	ra,80412d80 <__udivsi3>
80412dd0:	00058513          	mv	a0,a1
80412dd4:	00028067          	jr	t0
80412dd8:	40a00533          	neg	a0,a0
80412ddc:	0005d863          	bgez	a1,80412dec <__umodsi3+0x24>
80412de0:	40b005b3          	neg	a1,a1
80412de4:	f9dff06f          	j	80412d80 <__udivsi3>
80412de8:	40b005b3          	neg	a1,a1
80412dec:	00008293          	mv	t0,ra
80412df0:	f91ff0ef          	jal	ra,80412d80 <__udivsi3>
80412df4:	40a00533          	neg	a0,a0
80412df8:	00028067          	jr	t0

80412dfc <__modsi3>:
80412dfc:	00008293          	mv	t0,ra
80412e00:	0005ca63          	bltz	a1,80412e14 <__modsi3+0x18>
80412e04:	00054c63          	bltz	a0,80412e1c <__modsi3+0x20>
80412e08:	f79ff0ef          	jal	ra,80412d80 <__udivsi3>
80412e0c:	00058513          	mv	a0,a1
80412e10:	00028067          	jr	t0
80412e14:	40b005b3          	neg	a1,a1
80412e18:	fe0558e3          	bgez	a0,80412e08 <__modsi3+0xc>
80412e1c:	40a00533          	neg	a0,a0
80412e20:	f61ff0ef          	jal	ra,80412d80 <__udivsi3>
80412e24:	40b00533          	neg	a0,a1
80412e28:	00028067          	jr	t0
