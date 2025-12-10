// ---------------------------------------------------------------------------
// uart_test.S - Consolidated reproduction of kernel behavior (MONOLITHIC RESTORE)
// ---------------------------------------------------------------------------

// ===========================================================================
// CONSTANTS (From common.h, serial.h, exception.h, kernel32.ld)
// ===========================================================================

#define RV32
#define ENABLE_UART16550 1

// common.h
#define STORE sw
#define LOAD lw
#define XLEN 4
#define MSTATUS_MPP_MASK 0x1800
#define MIE_MTIE (1 << 7)
#define SATP_SV32 0x80000000
#define USER_STACK_INIT 0x807F0000  // Assuming ENABLE_PAGING is 'n'

#define SIG_FATAL       0x80
#define SYS_putc 30

// serial.h
#define COM1 0x10000000
#define COM_MULTIPLY 1
#define COM_RBR_OFFSET (0 * COM_MULTIPLY)
#define COM_THR_OFFSET (0 * COM_MULTIPLY)
#define COM_DLL_OFFSET (0 * COM_MULTIPLY)
#define COM_IER_OFFSET (1 * COM_MULTIPLY)
#define COM_DLM_OFFSET (1 * COM_MULTIPLY)
#define COM_FCR_OFFSET (2 * COM_MULTIPLY)
#define COM_LCR_OFFSET (3 * COM_MULTIPLY)
#define COM_MCR_OFFSET (4 * COM_MULTIPLY)
#define COM_LSR_OFFSET (5 * COM_MULTIPLY)

#define COM_LSR_THRE 0x20
#define COM_LSR_DR 0x01
#define COM_FCR_CONFIG 0x7
#define COM_LCR_DLAB 0x80
#define COM_LCR_WLEN8 0x03
#define COM_LCR_CONFIG (COM_LCR_WLEN8 & ~(COM_LCR_DLAB))
#define COM_DLL_VAL (115200 / 9600)
#define COM_IER_RDI 0x01

// exception.h
#define TF_SIZE     32*XLEN
#define EX_INT_FLAG 0x80000000
#define EX_INT_MODE_MACHINE 0x3
#define EX_INT_TYPE_TIMER 0x4
#define EX_ECALL_U 8
#define EX_BREAK 3

#define TF_ra       0*XLEN
#define TF_sp       1*XLEN
#define TF_gp       2*XLEN
#define TF_tp       3*XLEN
#define TF_t0       4*XLEN
#define TF_t1       5*XLEN
#define TF_t2       6*XLEN
#define TF_s0       7*XLEN
#define TF_s1       8*XLEN
#define TF_a0       9*XLEN
#define TF_a1       10*XLEN
#define TF_a2       11*XLEN
#define TF_a3       12*XLEN
#define TF_a4       13*XLEN
#define TF_a5       14*XLEN
#define TF_a6       15*XLEN
#define TF_a7       16*XLEN
#define TF_s2       17*XLEN
#define TF_s3       18*XLEN
#define TF_s4       19*XLEN
#define TF_s5       20*XLEN
#define TF_s6       21*XLEN
#define TF_s7       22*XLEN
#define TF_s8       23*XLEN
#define TF_s9       24*XLEN
#define TF_s10      25*XLEN
#define TF_s11      26*XLEN
#define TF_t3       27*XLEN
#define TF_t4       28*XLEN
#define TF_t5       29*XLEN
#define TF_t6       30*XLEN
#define TF_epc      31*XLEN
#define TF_ksp      32*XLEN

// kernel32.ld
#define KERNEL_STACK_INIT 0x80800000


// ===========================================================================
// KERNEL INIT (From init.S)
// ===========================================================================
    .section .bss
    .p2align 2
    .global TCBT
TCBT:
    .dword 0
    .dword 0
    .global current
current:
    .dword 0
    
    // Stub symbols expected by linker script logic
    .global uregs_sp
    .global uregs_fp
    .global _sbss
    .global _ebss
uregs_sp: .word 0
uregs_fp: .word 0
_sbss: .word 0
_ebss: .word 0

    .section .rodata
    .global monitor_version
monitor_version:
    .asciz "MONITOR for RISC-V - initialized.\n"
    .p2align 2
    .word 0

    .text
    .p2align 2
    .global START
    .global _start
_start:
START:
    // 1. Clear BSS
    la s10, _sbss
    la s11, _ebss
bss_init:
    beq s10, s11, bss_init_done
    sw  zero, 0(s10)
    addi s10, s10, 4
    j   bss_init
bss_init_done:

    // 2. Setup Stacks
    la sp, KERNEL_STACK_INIT
    
    li t0, USER_STACK_INIT
    la t1, uregs_sp
    STORE t0, 0(t1)
    la t1, uregs_fp
    STORE t0, 0(t1)

    // 3. UART Initialization (ENABLE_UART16550 is set)
#ifdef ENABLE_UART16550
    li t0, COM1
    li t1, COM_FCR_CONFIG 
    sb t1, %lo(COM_FCR_OFFSET)(t0)
    li t1, COM_LCR_DLAB
    sb t1, %lo(COM_LCR_OFFSET)(t0)
    li t1, COM_DLL_VAL
    sb t1, %lo(COM_DLL_OFFSET)(t0)
    sb x0, %lo(COM_DLM_OFFSET)(t0)
    li t1, COM_LCR_CONFIG
    sb t1, %lo(COM_LCR_OFFSET)(t0)
    sb x0, %lo(COM_MCR_OFFSET)(t0)
    li t1, COM_IER_RDI
    sb t1, %lo(COM_IER_OFFSET)(t0)
#endif

    // 4. Trap Frame (Stack) Clear Loop (The critical delay?)
    li t0, TF_SIZE
.LC0:
    addi t0, t0, -XLEN
    addi sp, sp, -XLEN
    STORE zero, 0(sp)
    bne t0, zero, .LC0

    la t0, TCBT
    STORE sp, 0(t0)
    mv t6, sp

    // 5. Stack Init Loop 2
    li t0, TF_SIZE
.LC1:
    addi t0, t0, -XLEN
    addi sp, sp, -XLEN
    STORE zero, 0(sp)
    bne t0, zero, .LC1

    la t0, TCBT
    STORE sp, XLEN(t0)
    STORE sp, TF_sp(t6)

    la t2, TCBT + XLEN
    LOAD t2, 0(t2)
    la t1, current
    sw t2, 0(t1)

    // 6. Enter Main Logic (WELCOME)
    j WELCOME

WELCOME:
    // Output to Magic Address (Fast Simulation Print)
    lui t0, 0x90000         // 0x90000000
    la a1, monitor_version
1:  lb a0, 0(a1)
    sb a0, 0(t0)            // Write char to Magic Address
    addi a1, a1, 1
    bne a0, zero, 1b

    la a0, monitor_version
    jal WRITE_SERIAL_STRING


    // Trigger Continuous Write Test (Magic Address)
    lui t0, 0x90000
    li a0, 0x31 // '1'
    sb a0, 0(t0)
    li a0, 0x32 // '2'
    sb a0, 0(t0)
    li a0, 0x33 // '3'
    sb a0, 0(t0)
    li a0, 0x34 // '4'
    sb a0, 0(t0)
    
    // Loop forever instead of checking shell
    j TEST_DONE


TEST_DONE:
    j TEST_DONE

// ===========================================================================
// UTILS (From utils.S)
// ===========================================================================

WRITE_SERIAL:
    li t0, COM1
.TESTW:
    lb t1, %lo(COM_LSR_OFFSET)(t0)
    andi t1, t1, COM_LSR_THRE
    bne t1, zero, .WSERIAL
    j .TESTW
.WSERIAL:
    sb a0, %lo(COM_THR_OFFSET)(t0)
    jr ra

WRITE_SERIAL_STRING:
    mv a1, a0
    mv a2, ra
    lb a0, 0(a1)
0:  jal WRITE_SERIAL
    addi a1, a1, 0x1
    lb a0, 0(a1)
    bne a0, zero, 0b
    jr a2

// ===========================================================================
// TRAP HANDLER (Stub from trap.S or minimal)
// ===========================================================================
.global EXCEPTION_HANDLER
EXCEPTION_HANDLER:
    j EXCEPTION_HANDLER
