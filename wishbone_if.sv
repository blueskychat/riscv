// wishbone_if.sv - Wishbone总线接口
interface wishbone_if #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter SELE_WIDTH = (DATA_WIDTH / 8)
);
    logic [ADDR_WIDTH-1:0] adr;    // 地址
    logic [DATA_WIDTH-1:0] dat_i;  // 数据输入（到主机）
    logic [DATA_WIDTH-1:0] dat_o;  // 数据输出（从主机）
    logic                  we;      // 写使能
    logic [SELE_WIDTH-1:0] sel;     // 字节选择
    logic                  stb;     // 选通信号
    logic                  ack;     // 应答信号
    logic                  cyc;     // 总线周期
    logic                  rty;     // 重试信号
    logic                  err;     // 错误信号
    
    // 主机端口
    modport master (
        output adr, dat_o, we, sel, stb, cyc,
        input  dat_i, ack, rty, err
    );
    
    // 从机端口
    modport slave (
        input  adr, dat_o, we, sel, stb, cyc,
        output dat_i, ack, rty, err
    );
endinterface
