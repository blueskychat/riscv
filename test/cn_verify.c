#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// Simulate the exact assembly logic for verifying expected values
// Use asm-matching semantics: AND with mask, not modulo

void simulate_cryptonight(uint32_t mem_size, uint32_t iterations) {
    uint32_t mask = mem_size - 4;  // e.g., 0x4000 -> 0x3FFC
    uint32_t words = mem_size / 4;
    
    uint32_t* memory = (uint32_t*)calloc(words, sizeof(uint32_t));
    
    uint32_t s0 = 1;  // rand seed
    
    // Phase 1: Initialize memory
    for (uint32_t i = 0; i < words; i++) {
        memory[i] = s0;
        
        // xorshift LFSR
        s0 ^= s0 << 13;
        s0 ^= s0 >> 17;
        s0 ^= s0 << 5;
    }
    
    printf("After init: s0 = 0x%08x\n", s0);
    
    // Phase 2: Main loop
    s0 = 1;  // reset seed (matches assembly)
    uint32_t t1 = 0;  // prev value
    
    for (uint32_t iter = 0; iter < iterations; iter++) {
        // Read address: addr = base + (s0 & mask)
        uint32_t read_offset = s0 & mask;
        uint32_t read_idx = read_offset / 4;
        
        // Read value
        uint32_t t3 = memory[read_idx];
        
        // XOR with prev
        t3 ^= t1;
        
        // XOR rand with current
        s0 ^= t3;
        
        // xorshift LFSR
        s0 ^= s0 << 13;
        s0 ^= s0 >> 17;
        s0 ^= s0 << 5;
        
        // Write address: addr = base + (s0 & mask)
        uint32_t write_offset = s0 & mask;
        uint32_t write_idx = write_offset / 4;
        
        // Write value
        memory[write_idx] = t3;
        
        // Save prev
        t1 = t3;
        
        // xorshift LFSR again
        s0 ^= s0 << 13;
        s0 ^= s0 >> 17;
        s0 ^= s0 << 5;
        
        if (iter < 5 || iter == iterations - 1) {
            printf("Iter %d: read[0x%04x]=0x%08x, write[0x%04x], t1=0x%08x, s0=0x%08x\n",
                   iter, read_offset, t3, write_offset, t1, s0);
        }
    }
    
    printf("\n=== FINAL VALUES ===\n");
    printf("s0 (LFSR) = 0x%08x\n", s0);
    printf("t1 (last) = 0x%08x\n", t1);
    
    free(memory);
}

int main(int argc, char** argv) {
    printf("=== 16 iterations, 16KB memory ===\n");
    simulate_cryptonight(0x4000, 16);
    
    printf("\n=== 64 iterations, 16KB memory ===\n");
    simulate_cryptonight(0x4000, 64);
    
    printf("\n=== 256 iterations, 32KB memory ===\n");
    simulate_cryptonight(0x8000, 256);
    
    return 0;
}
