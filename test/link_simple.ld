OUTPUT_ARCH("riscv")
ENTRY(_start)

SECTIONS
{
    . = 0x80000000;
    .text : { 
        *(.text*) 
        *(.rodata*) 
        *(.data*) 
        . = ALIGN(4);
        __bss_start = .;
        *(.bss*) 
        *(COMMON)
        . = ALIGN(4);
        __bss_end = .;
    }
}
