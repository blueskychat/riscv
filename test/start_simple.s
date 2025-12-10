.section .text.start
.global _start

_start:
    # Setup stack pointer
    lui sp, 0x80800        # sp = 0x80800000
    
    # Jump directly to main without BSS clearing
    call main
    
    # Loop forever after main returns
_exit:
    j _exit
