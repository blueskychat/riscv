#include "uart.h"

#define TEST_BASE 0x80002000  // 使用SRAM区域进行测试
#define CACHE_LINE_SIZE 16    // 16 bytes

// 测试结果统计
int tests_passed = 0;
int tests_failed = 0;

void print_hex(unsigned int val) {
    const char hex[] = "0123456789ABCDEF";
    uart_putc(hex[(val >> 28) & 0xF]);
    uart_putc(hex[(val >> 24) & 0xF]);
    uart_putc(hex[(val >> 20) & 0xF]);
    uart_putc(hex[(val >> 16) & 0xF]);
    uart_putc(hex[(val >> 12) & 0xF]);
    uart_putc(hex[(val >> 8) & 0xF]);
    uart_putc(hex[(val >> 4) & 0xF]);
    uart_putc(hex[val & 0xF]);
}

void test_result(const char* name, int passed) {
    uart_puts("[TEST] ");
    uart_puts(name);
    uart_puts(": ");
    if (passed) {
        uart_puts("PASS\n");
        tests_passed++;
    } else {
        uart_puts("FAIL\n");
        tests_failed++;
    }
}

// 测试1: 基本字(word)读写
void test_word_rw() {
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    
    // 写入测试数据
    ptr[0] = 0xDEADBEEF;
    ptr[1] = 0xCAFEBABE;
    ptr[2] = 0x12345678;
    ptr[3] = 0xABCDEF00;
    
    // 读取验证
    int pass = (ptr[0] == 0xDEADBEEF) &&
               (ptr[1] == 0xCAFEBABE) &&
               (ptr[2] == 0x12345678) &&
               (ptr[3] == 0xABCDEF00);
    
    test_result("Word Read/Write", pass);
}

// 测试2: 半字(halfword)读写
void test_halfword_rw() {
    volatile unsigned short* ptr = (volatile unsigned short*)TEST_BASE;
    
    ptr[0] = 0x1234;
    ptr[1] = 0x5678;
    ptr[2] = 0xABCD;
    ptr[3] = 0xEF00;
    
    int pass = (ptr[0] == 0x1234) &&
               (ptr[1] == 0x5678) &&
               (ptr[2] == 0xABCD) &&
               (ptr[3] == 0xEF00);
    
    test_result("Halfword Read/Write", pass);
}

// 测试3: 字节(byte)读写
void test_byte_rw() {
    volatile unsigned char* ptr = (volatile unsigned char*)TEST_BASE;
    
    for (int i = 0; i < 16; i++) {
        ptr[i] = i + 0xA0;
    }
    
    int pass = 1;
    for (int i = 0; i < 16; i++) {
        if (ptr[i] != (unsigned char)(i + 0xA0)) {
            pass = 0;
            break;
        }
    }
    
    test_result("Byte Read/Write", pass);
}

// 测试4: 跨Cache Line访问
void test_cross_cacheline() {
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    
    // 写入跨越多个cache line的数据
    for (int i = 0; i < 16; i++) {
        ptr[i] = 0x10000000 + i;
    }
    
    // 读取验证
    int pass = 1;
    for (int i = 0; i < 16; i++) {
        if (ptr[i] != (unsigned int)(0x10000000 + i)) {
            pass = 0;
            uart_puts("  Failed at index ");
            print_hex(i);
            uart_puts(" expected ");
            print_hex(0x10000000 + i);
            uart_puts(" got ");
            print_hex(ptr[i]);
            uart_putc('\n');
            break;
        }
    }
    
    test_result("Cross Cache Line Access", pass);
}

// 测试5: Write-back测试（写入后再从另一地址读回）
void test_writeback() {
    volatile unsigned int* ptr1 = (volatile unsigned int*)(TEST_BASE);
    volatile unsigned int* ptr2 = (volatile unsigned int*)(TEST_BASE + 0x1000);
    
    // 填充足够多数据以触发eviction
    for (int i = 0; i < 32; i++) {
        ptr1[i] = 0x20000000 + i;
    }
    
    // 访问另一地址空间，触发eviction
    for (int i = 0; i < 32; i++) {
        ptr2[i] = 0x30000000 + i;
    }
    
    // 再次读取第一个区域，应该从内存正确读回
    int pass = 1;
    for (int i = 0; i < 32; i++) {
        if (ptr1[i] != (unsigned int)(0x20000000 + i)) {
            pass = 0;
            break;
        }
    }
    
    test_result("Write-back Mechanism", pass);
}

// 测试6: 对齐和非对齐访问
void test_alignment() {
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    
    // 对齐访问
    ptr[0] = 0x11111111;
    ptr[1] = 0x22222222;
    ptr[2] = 0x33333333;
    
    int pass = (ptr[0] == 0x11111111) &&
               (ptr[1] == 0x22222222) &&
               (ptr[2] == 0x33333333);
    
    test_result("Aligned Access", pass);
}

// 测试7: 连续读取（测试cache hit）
void test_sequential_read() {
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    
    // 先写入数据
    for (int i = 0; i < 64; i++) {
        ptr[i] = 0x40000000 + i;
    }
    
    // 连续读取多次，应该大部分是cache hit
    int pass = 1;
    for (int round = 0; round < 3; round++) {
        for (int i = 0; i < 64; i++) {
            if (ptr[i] != (unsigned int)(0x40000000 + i)) {
                pass = 0;
                break;
            }
        }
    }
    
    test_result("Sequential Read (Cache Hit)", pass);
}

// 测试8: 随机访问模式
void test_random_access() {
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    
    // 写入
    ptr[0] = 0xAAAAAAAA;
    ptr[7] = 0xBBBBBBBB;
    ptr[15] = 0xCCCCCCCC;
    ptr[31] = 0xDDDDDDDD;
    
    // 随机顺序读取
    int pass = (ptr[15] == 0xCCCCCCCC) &&
               (ptr[0] == 0xAAAAAAAA) &&
               (ptr[31] == 0xDDDDDDDD) &&
               (ptr[7] == 0xBBBBBBBB);
    
    test_result("Random Access Pattern", pass);
}

// 测试9: 边界测试
void test_boundaries() {
    volatile unsigned int* ptr = (volatile unsigned int*)(TEST_BASE);
    
    // Cache line边界
    ptr[3] = 0x55555555;  // Cache line末尾
    ptr[4] = 0x66666666;  // 下一个cache line开始
    
    int pass = (ptr[3] == 0x55555555) && (ptr[4] == 0x66666666);
    
    test_result("Cache Line Boundary", pass);
}

// 测试10: 大块数据传输
void test_bulk_transfer() {
    volatile unsigned int* ptr = (volatile unsigned int*)TEST_BASE;
    const int SIZE = 256;
    
    // 写入大块数据
    for (int i = 0; i < SIZE; i++) {
        ptr[i] = i * 0x1000 + 0x50000000;
    }
    
    // 验证
    int pass = 1;
    for (int i = 0; i < SIZE; i++) {
        if (ptr[i] != (unsigned int)(i * 0x1000 + 0x50000000)) {
            pass = 0;
            uart_puts("  Failed at index ");
            print_hex(i);
            uart_putc('\n');
            break;
        }
    }
    
    test_result("Bulk Data Transfer", pass);
}

int main() {
    uart_init();
    
    uart_puts("\n=== CACHE MEMORY TEST SUITE ===\n\n");
    
    test_word_rw();
    test_halfword_rw();
    test_byte_rw();
    test_cross_cacheline();
    test_writeback();
    test_alignment();
    test_sequential_read();
    test_random_access();
    test_boundaries();
    test_bulk_transfer();
    
    uart_puts("\n=== TEST SUMMARY ===\n");
    uart_puts("Passed: ");
    print_hex(tests_passed);
    uart_putc('\n');
    uart_puts("Failed: ");
    print_hex(tests_failed);
    uart_putc('\n');
    
    if (tests_failed == 0) {
        uart_puts("\nALL TESTS PASSED!\n");
    } else {
        uart_puts("\nSOME TESTS FAILED!\n");
    }
    
    return 0;
}
