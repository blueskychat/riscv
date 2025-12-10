# Phase 4 C Test Startup
# Minimal startup for C test

.section .text.start
.globl _start
_start:
    # Initialize stack pointer
    li   sp, 0x80800000
    
    # Clear BSS (simplified)
    # Jump to main
    jal  main
    
    # Infinite loop after main returns
1:  j    1b

.section .text
