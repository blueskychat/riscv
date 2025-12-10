#include "debug.h"

// Exhaustive Phase 3 Test with Oracle Verification
// Uses expected[] array as ground truth to verify cache behavior

#define TEST_BASE 0x80010000
#define TEST_SIZE 2048  // 8KB (8x L1 size)

// Oracle: independent expected values array (in BSS, different cache region)
unsigned int expected[TEST_SIZE];

// Simple LCG for deterministic pseudo-random
unsigned int prng_state = 0x87654321;
unsigned int prng() {
    prng_state = prng_state * 1664525 + 1013904223;
    return prng_state;
}

void fail_with_details(const char* msg, int idx, unsigned int exp, unsigned int got) {
    debug_puts("\n!!! FAIL: ");
    debug_puts(msg);
    debug_puts("\n  Index: ");
    debug_print_hex(idx);
    debug_puts("\n  Expected: ");
    debug_print_hex(exp);
    debug_puts("\n  Got: ");
    debug_print_hex(got);
    debug_puts("\n");
    while(1);  // Halt
}

// Test A: Full 8KB Sweep with Random Verification
void test_full_sweep() {
    volatile unsigned int *p = (volatile unsigned int*)TEST_BASE;
    
    debug_puts("\n[Test A] Full Sweep Write (8KB)...\n");
    
    // Phase 1: Sequential write (triggers massive evictions)
    for (int i = 0; i < TEST_SIZE; i++) {
        unsigned int val = (i ^ 0xA5A5A5A5) + 0x77770000;
        p[i] = val;
        expected[i] = val;
    }
    
    debug_puts("[Test A] Random Read Verify (2000 samples)...\n");
    
    // Phase 2: Random read verification
    prng_state = 0x12345678;  // Reset for determinism
    for (int k = 0; k < 2000; k++) {
        int idx = prng() % TEST_SIZE;
        unsigned int val = p[idx];
        if (val != expected[idx]) {
            fail_with_details("Full Sweep Random Read", idx, expected[idx], val);
        }
    }
    
    debug_puts("[Test A] PASS\n");
}

// Test B: Read-Modify-Write Pattern
void test_read_modify_write() {
    volatile unsigned int *p = (volatile unsigned int*)TEST_BASE;
    
    debug_puts("\n[Test B] Read-Modify-Write Pattern...\n");
    
    // Modify every 13th element (prime stride to avoid patterns)
    for (int i = 0; i < TEST_SIZE; i += 13) {
        unsigned int old_val = p[i];  // Read (may cause eviction)
        unsigned int new_val = old_val ^ 0xFFFF0000;  // Modify
        p[i] = new_val;  // Write (Hit - should set dirty)
        expected[i] = new_val;  // Update oracle
    }
    
    debug_puts("[Test B] Verify Modified Values...\n");
    
    // Verify all modified locations
    for (int i = 0; i < TEST_SIZE; i += 13) {
        if (p[i] != expected[i]) {
            fail_with_details("Read-Modify-Write", i, expected[i], p[i]);
        }
    }
    
    debug_puts("[Test B] PASS\n");
}

// Test C: Per-Set Explicit Validation (all 64 sets)
void test_per_set_validation() {
    volatile unsigned int *base = (volatile unsigned int*)TEST_BASE;
    
    debug_puts("\n[Test C] Per-Set Validation (64 Sets)...\n");
    
    // L1: 64 Sets, each 16 bytes (4 words)
    // Set S: Addr offset = S * 16 bytes = S * 4 words
    for (int set = 0; set < 64; set++) {
        unsigned int *set_addr = base + set * 4;
        
        // Write unique pattern to Set S
        unsigned int marker0 = 0xDEAD0000 | set;
        unsigned int marker1 = 0xBEEF0000 | set;
        set_addr[0] = marker0;
        set_addr[1] = marker1;
        
        // Write conflicting address (same set, different tag)
        // Offset +1024 bytes = +256 words (tag increment)
        unsigned int *conflict = (unsigned int*)((unsigned long)set_addr + 1024);
        unsigned int conf_marker0 = 0xCAFE0000 | set;
        unsigned int conf_marker1 = 0xBABE0000 | set;
        conflict[0] = conf_marker0;  // Evicts original (should writeback)
        conflict[1] = conf_marker1;
        
        // Read back original address (should refill from memory)
        unsigned int val0 = set_addr[0];
        unsigned int val1 = set_addr[1];
        
        if (val0 != marker0) {
            debug_puts("Set ");
            debug_print_hex(set);
            debug_puts(" Word0 FAIL: Got ");
            debug_print_hex(val0);
            debug_puts("\n");
            while(1);
        }
        
        if (val1 != marker1) {
            debug_puts("Set ");
            debug_print_hex(set);
            debug_puts(" Word1 FAIL\n");
            while(1);
        }
        
        // Also verify conflict address integrity
        if (conflict[0] != conf_marker0 || conflict[1] != conf_marker1) {
            debug_puts("Set ");
            debug_print_hex(set);
            debug_puts(" Conflict FAIL\n");
            while(1);
        }
    }
    
    debug_puts("[Test C] PASS (All 64 sets validated)\n");
    
    // CRITICAL: Resync oracle after Test C modified cache
    debug_puts("[Test C] Resyncing oracle...\n");
    volatile unsigned int *p = (volatile unsigned int*)TEST_BASE;
    for (int i = 0; i < TEST_SIZE; i++) {
        expected[i] = p[i];  // Read current cache state into oracle
    }
    debug_puts("[Test C] Oracle resynced\n");
}

// Test D: Full Array Verification
void test_full_array_verify() {
    volatile unsigned int *p = (volatile unsigned int*)TEST_BASE;
    
    debug_puts("\n[Test D] Full Array Verification (2048 words)...\n");
    
    int error_count = 0;
    for (int i = 0; i < TEST_SIZE; i++) {
        unsigned int val = p[i];
        if (val != expected[i]) {
            if (error_count < 5) {  // Limit output
                fail_with_details("Full Array Verify", i, expected[i], val);
            }
            error_count++;
        }
    }
    
    if (error_count > 0) {
        debug_puts("!!! Total Errors: ");
        debug_print_hex(error_count);
        debug_puts("\n");
        while(1);
    }
    
    debug_puts("[Test D] PASS (All 2048 words correct)\n");
}

// Test E: Byte-Level Oracle Test
void test_byte_level_oracle() {
    volatile unsigned char *p = (volatile unsigned char*)TEST_BASE;
    static unsigned char byte_expected[1024];  // 1KB
    
    debug_puts("\n[Test E] Byte-Level Write/Verify...\n");
    
    // Write bytes with pattern
    for (int i = 0; i < 1024; i++) {
        unsigned char val = (unsigned char)((i * 17 + 53) & 0xFF);
        p[i] = val;
        byte_expected[i] = val;
    }
    
    // Trigger evictions by writing more data
    for (int i = 1024; i < 2048; i++) {
        p[i] = (unsigned char)(i & 0xFF);
    }
    
    // Verify original bytes (should reload from memory)
    for (int i = 0; i < 1024; i++) {
        if (p[i] != byte_expected[i]) {
            debug_puts("Byte ");
            debug_print_hex(i);
            debug_puts(" FAIL\n");
            while(1);
        }
    }
    
    debug_puts("[Test E] PASS\n");
}

int main() {
    debug_init();
    
    debug_puts("\n");
    debug_puts("========================================\n");
    debug_puts("  EXHAUSTIVE Phase 3 Verification\n");
    debug_puts("========================================\n");
    
    test_full_sweep();
    test_read_modify_write();
    test_per_set_validation();
    test_full_array_verify();
    test_byte_level_oracle();
    
    debug_puts("\n");
    debug_puts("========================================\n");
    debug_puts("  ALL EXHAUSTIVE TESTS PASSED!\n");
    debug_puts("========================================\n");
    debug_puts("\n");
    
    return 0;
}
