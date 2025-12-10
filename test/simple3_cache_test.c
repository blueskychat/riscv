#include "uart.h"

#define TEST_BASE 0x80002000
#define L1_CACHE_SIZE 2048

void print_test(const char* name) {
    uart_puts("[TEST] ");
    uart_puts(name);
    uart_puts("\n");
}

void print_result(int pass) {
    if (pass) {
        uart_puts("  PASS\n");
    } else {
        uart_puts("  FAIL\n");
    }
}

// 测试1: 基本读写
void test_basic_rw() {
    print_test("Basic Read/Write");
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    
    ptr[0] = 0xDEADBEEF;
    int pass = (ptr[0] == 0xDEADBEEF);
    
    print_result(pass);
}

// 测试2: Write-Allocate
void test_write_allocate() {
    print_test("Write-Allocate");
    volatile unsigned int* ptr = (volatile unsigned int*)(TEST_BASE + 0x1000);
    
    ptr[0] = 0x11111111;
    ptr[1] = 0x22222222;
    
    int pass = (ptr[0] == 0x11111111) && (ptr[1] == 0x22222222);
    
    print_result(pass);
}

// 测试3: Cache Eviction
void test_eviction() {
    print_test("Cache Eviction");
    
    volatile unsigned int* base = (volatile unsigned int*)TEST_BASE;
    base[0] = 0xAAAAAAAA;
    
    volatile unsigned int* evict_addr = (volatile unsigned int*)(TEST_BASE + L1_CACHE_SIZE);
    evict_addr[0] = 0xBBBBBBBB;
    
    unsigned int val = base[0];
    int pass = (val == 0xAAAAAAAA);
    
    print_result(pass);
}

int main() {
    uart_init();
    
    uart_puts("\n=== Simple 3-Test Cache Suite ===\n\n");
    
    test_basic_rw();
    test_write_allocate();
    test_eviction();
    
    uart_puts("\n=== Tests Complete! ===\n");
    uart_puts("Program ending normally.\n");
    
    // 死循环
    while(1);
    
    return 0;
}
