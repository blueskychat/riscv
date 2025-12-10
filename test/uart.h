#ifndef UART_H
#define UART_H

// UART寄存器地址定义 - 匹配kernel的serial.h
#define COM1 0x10000000
#define COM_MULTIPLY 1

// 各个寄存器地址相对于基地址的偏移
#define COM_RBR_OFFSET (0 * COM_MULTIPLY) /* In:  Receive Buffer Register */
#define COM_THR_OFFSET (0 * COM_MULTIPLY) /* Out: Transmitter Holding Register */
#define COM_LSR_OFFSET (5 * COM_MULTIPLY) /* In:  Line Status Register */

// LSR 寄存器的定义
#define COM_LSR_THRE 0x20 /* Transmit-hold-register empty */
#define COM_LSR_DR   0x01 /* Receiver data ready */

// UART基地址
#define UART_BASE COM1
#define UART_DATA (*(volatile unsigned char*)(UART_BASE + COM_THR_OFFSET))
#define UART_STATUS (*(volatile unsigned char*)(UART_BASE + COM_LSR_OFFSET))

// 初始化UART
static inline void uart_init(void) {
    // 对于简单的UART模型，可能不需要特殊初始化
}

// 发送单个字符
static inline void uart_putc(char c) {
    // 等待发送缓冲区空闲
    while (!(UART_STATUS & COM_LSR_THRE));
    UART_DATA = c;
}

// 发送字符串
static inline void uart_puts(const char* s) {
    while (*s) {
        uart_putc(*s++);
    }
}

// 接收单个字符
static inline char uart_getc(void) {
    // 等待接收数据就绪
    while (!(UART_STATUS & COM_LSR_DR));
    return (char)(*(volatile unsigned char*)(UART_BASE + COM_RBR_OFFSET));
}

#endif // UART_H
