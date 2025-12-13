`include "defines.sv"
`include "pipeline_regs.sv"

// riscv_cpu_top.sv - CPU顶层模块
module riscv_cpu_top (
    input wire clk_50M,     // 50MHz 时钟输入
    input wire clk_11M0592, // 11.0592MHz 时钟输入（备用，可不用）

    input wire push_btn,  // BTN5 按钮开关，带消抖电路，按下时为 1
    input wire reset_btn, // BTN6 复位按钮，带消抖电路，按下时为 1

    input  wire [ 3:0] touch_btn,  // BTN1~BTN4，按钮开关，按下时为 1
    input  wire [31:0] dip_sw,     // 32 位拨码开关，拨到“ON”时为 1
    output wire [15:0] leds,       // 16 位 LED，输出时 1 点亮
    output wire [ 7:0] dpy0,       // 数码管低位信号，包括小数点，输出 1 点亮
    output wire [ 7:0] dpy1,       // 数码管高位信号，包括小数点，输出 1 点亮

    // CPLD 串口控制器信号
    output wire uart_rdn,        // 读串口信号，低有效
    output wire uart_wrn,        // 写串口信号，低有效
    input  wire uart_dataready,  // 串口数据准备好
    input  wire uart_tbre,       // 发送数据标志
    input  wire uart_tsre,       // 数据发送完毕标志

    // BaseRAM 信号
    inout wire [31:0] base_ram_data,  // BaseRAM 数据，低 8 位与 CPLD 串口控制器共享
    output wire [19:0] base_ram_addr,  // BaseRAM 地址
    output wire [3:0] base_ram_be_n,  // BaseRAM 字节使能，低有效。如果不使用字节使能，请保持为 0
    output wire base_ram_ce_n,  // BaseRAM 片选，低有效
    output wire base_ram_oe_n,  // BaseRAM 读使能，低有效
    output wire base_ram_we_n,  // BaseRAM 写使能，低有效

    // ExtRAM 信号
    inout wire [31:0] ext_ram_data,  // ExtRAM 数据
    output wire [19:0] ext_ram_addr,  // ExtRAM 地址
    output wire [3:0] ext_ram_be_n,  // ExtRAM 字节使能，低有效。如果不使用字节使能，请保持为 0
    output wire ext_ram_ce_n,  // ExtRAM 片选，低有效
    output wire ext_ram_oe_n,  // ExtRAM 读使能，低有效
    output wire ext_ram_we_n,  // ExtRAM 写使能，低有效

    // 直连串口信号
    output wire txd,  // 直连串口发送端
    input  wire rxd,  // 直连串口接收端

    // Flash 存储器信号，参考 JS28F640 芯片手册
    output wire [22:0] flash_a,  // Flash 地址，a0 仅在 8bit 模式有效，16bit 模式无意义
    inout wire [15:0] flash_d,  // Flash 数据
    output wire flash_rp_n,  // Flash 复位信号，低有效
    output wire flash_vpen,  // Flash 写保护信号，低电平时不能擦除、烧写
    output wire flash_ce_n,  // Flash 片选信号，低有效
    output wire flash_oe_n,  // Flash 读使能信号，低有效
    output wire flash_we_n,  // Flash 写使能信号，低有效
    output wire flash_byte_n, // Flash 8bit 模式选择，低有效。在使用 flash 的 16 位模式时请设为 1

    // USB 控制器信号，参考 SL811 芯片手册
    output wire sl811_a0,
    // inout  wire [7:0] sl811_d,     // USB 数据线与网络控制器的 dm9k_sd[7:0] 共享
    output wire sl811_wr_n,
    output wire sl811_rd_n,
    output wire sl811_cs_n,
    output wire sl811_rst_n,
    output wire sl811_dack_n,
    input  wire sl811_intrq,
    input  wire sl811_drq_n,

    // 网络控制器信号，参考 DM9000A 芯片手册
    output wire dm9k_cmd,
    inout wire [15:0] dm9k_sd,
    output wire dm9k_iow_n,
    output wire dm9k_ior_n,
    output wire dm9k_cs_n,
    output wire dm9k_pwrst_n,
    input wire dm9k_int,

    // 图像输出信号
    output wire [2:0] video_red,    // 红色像素，3 位
    output wire [2:0] video_green,  // 绿色像素，3 位
    output wire [1:0] video_blue,   // 蓝色像素，2 位
    output wire       video_hsync,  // 行同步（水平同步）信号
    output wire       video_vsync,  // 场同步（垂直同步）信号
    output wire       video_clk,    // 像素时钟输出
    output wire       video_de      // 行数据有效信号，用于区分消隐区
);

`ifdef SIMU
    logic reset_of_clk10M;
    initial begin
    #10ns;
    reset_of_clk10M = 1'b1;
    #100ns;
    reset_of_clk10M = 1'b0;
    end
    logic clk_10M;
    assign clk_10M=clk_11M0592;
`else

    // PLL 分频示例
    logic locked, clk_10M, clk_20M;
    pll_example clock_gen (
        // Clock in ports
        .clk_in1(clk_50M),  // 外部时钟输入
        // Clock out ports
        .clk_out1(clk_10M),  // 时钟输出 1，频率在 IP 配置界面中设置
        .clk_out2(clk_20M),  // 时钟输出 2，频率在 IP 配置界面中设置
        // Status and control signals
        .reset(reset_btn),  // PLL 复位输入
        .locked(locked)  // PLL 锁定指示输出，"1"表示时钟稳定，
                        // 后级电路复位信号应当由它生成（见下）
    );

    logic reset_of_clk10M;
    // 异步复位，同步释放，将 locked 信号转为后级电路的复位 reset_of_clk10M
    always_ff @(posedge clk_10M or negedge locked) begin
    if (~locked) reset_of_clk10M <= 1'b1;
    else reset_of_clk10M <= 1'b0;
    end

`endif

    logic sys_clk;
    logic sys_rst;

    assign sys_clk = clk_50M;
    assign sys_rst = reset_of_clk10M;
  
    // 本实验不使用 CPLD 串口，禁用防止总线冲突
    assign uart_rdn = 1'b1;
    assign uart_wrn = 1'b1;

    // Wishbone signals - IF stage to wishbone_master
    logic [31:0] wb_inst_adr, wb_inst_dat_o, wb_inst_dat_i;
    logic        wb_inst_we;
    logic [3:0]  wb_inst_sel;
    logic        wb_inst_stb, wb_inst_ack, wb_inst_cyc, wb_inst_rty, wb_inst_err;
    
    // Wishbone signals - MEM stage to wishbone_master
    logic [31:0] wb_data_adr, wb_data_dat_o, wb_data_dat_i;
    logic        wb_data_we;
    logic [3:0]  wb_data_sel;
    logic        wb_data_stb, wb_data_ack, wb_data_cyc, wb_data_rty, wb_data_err;
    
    // Wishbone signals - wishbone_master to wb_mux
    logic [31:0] wb_master_adr, wb_master_dat_o, wb_master_dat_i;
    logic        wb_master_we;
    logic [3:0]  wb_master_sel;
    logic        wb_master_stb, wb_master_ack, wb_master_cyc, wb_master_rty, wb_master_err;
    
    // Wishbone signals - wb_mux to sram_controller_base
    logic [31:0] wb_slave0_adr, wb_slave0_dat_o, wb_slave0_dat_i;
    logic        wb_slave0_we;
    logic [3:0]  wb_slave0_sel;
    logic        wb_slave0_stb, wb_slave0_ack, wb_slave0_cyc, wb_slave0_rty, wb_slave0_err;
    
    // Wishbone signals - wb_mux to sram_controller_ext
    logic [31:0] wb_slave1_adr, wb_slave1_dat_o, wb_slave1_dat_i;
    logic        wb_slave1_we;
    logic [3:0]  wb_slave1_sel;
    logic        wb_slave1_stb, wb_slave1_ack, wb_slave1_cyc, wb_slave1_rty, wb_slave1_err;
    
    // Wishbone signals - wb_mux to uart_controller
    logic [31:0] wb_slave2_adr, wb_slave2_dat_o, wb_slave2_dat_i;
    logic        wb_slave2_we;
    logic [3:0]  wb_slave2_sel;
    logic        wb_slave2_stb, wb_slave2_ack, wb_slave2_cyc, wb_slave2_rty, wb_slave2_err;

    // Wishbone signals - wb_mux to CLINT
    logic [31:0] wb_slave3_adr, wb_slave3_dat_o, wb_slave3_dat_i;
    logic        wb_slave3_we;
    logic [3:0]  wb_slave3_sel;
    logic        wb_slave3_stb, wb_slave3_ack, wb_slave3_cyc, wb_slave3_rty, wb_slave3_err;

    // wb_inst and wb_data are connected to wishbone_master
    // wb_master_intf is connected to wb_mux
    // wb_mux is connected to wb_slave0, wb_slave1, wb_slave2, wb_slave3
    // wb_slave0 is connected to sram_controller_base
    // wb_slave1 is connected to sram_controller_ext
    // wb_slave2 is connected to uart_controller
    // wb_slave3 is connected to CLINT
    // wishbone_master的作用是将wb_inst和wb_data的信号进行仲裁，然后将
    // 选中的信号输出到wb_out，wb_out连接到wb_mux的slave接口
    // wb_mux的作用是将wb_out的信号分发到wb_slave0, wb_slave1, wb_slave2, wb_slave3
    // wb_slave0, wb_slave1, wb_slave2, wb_slave3分别连接到sram_controller_base, sram_controller_ext, uart_controller, CLINT
    // sram_controller_base连接到基地址为0x8000_0000的SRAM
    // sram_controller_ext连接到基地址为0x8040_0000的SRAM
    // uart_controller连接到基地址为0x1000_0000的UART
    // CLINT连接到基地址为0x0200_0000
    
    /* ===========  Wishbone Master begin =========== */
    // Wishbone Master => Wishbone MUX (Slave)

    wishbone_master #(
        .ADDR_WIDTH(32),
        .DATA_WIDTH(32)
    ) u_wishbone_master (
        .clk_i(sys_clk),
        .rst_i(sys_rst),

        // wb_inst (from IF stage)
        .wb_inst_adr_i(wb_inst_adr),
        .wb_inst_dat_i(wb_inst_dat_o),
        .wb_inst_dat_o(wb_inst_dat_i),
        .wb_inst_we_i(wb_inst_we),
        .wb_inst_sel_i(wb_inst_sel),
        .wb_inst_stb_i(wb_inst_stb),
        .wb_inst_ack_o(wb_inst_ack),
        .wb_inst_cyc_i(wb_inst_cyc),
        .wb_inst_rty_o(wb_inst_rty),
        .wb_inst_err_o(wb_inst_err),

        // wb_data (from MEM stage)
        .wb_data_adr_i(wb_data_adr),
        .wb_data_dat_i(wb_data_dat_o),
        .wb_data_dat_o(wb_data_dat_i),
        .wb_data_we_i(wb_data_we),
        .wb_data_sel_i(wb_data_sel),
        .wb_data_stb_i(wb_data_stb),
        .wb_data_ack_o(wb_data_ack),
        .wb_data_cyc_i(wb_data_cyc),
        .wb_data_rty_o(wb_data_rty),
        .wb_data_err_o(wb_data_err),

        // wb_out (to MUX)
        .wb_out_adr_o(wb_master_adr),
        .wb_out_dat_o(wb_master_dat_o),
        .wb_out_dat_i(wb_master_dat_i),
        .wb_out_we_o(wb_master_we),
        .wb_out_sel_o(wb_master_sel),
        .wb_out_stb_o(wb_master_stb),
        .wb_out_ack_i(wb_master_ack),
        .wb_out_cyc_o(wb_master_cyc),
        .wb_out_rty_i(wb_master_rty),
        .wb_out_err_i(wb_master_err)
    );

    /* =========== Wishbone Master end =========== */

    /* =========== Wishbone MUX begin =========== */
    // Wishbone MUX (Masters) => bus slaves

    wb_mux_4 wb_mux (
        .clk(sys_clk),
        .rst(sys_rst),

        // Master interface (from wishbone_master)
        .wb_master_adr_i(wb_master_adr),
        .wb_master_dat_i(wb_master_dat_o),
        .wb_master_dat_o(wb_master_dat_i),
        .wb_master_we_i(wb_master_we),
        .wb_master_sel_i(wb_master_sel),
        .wb_master_stb_i(wb_master_stb),
        .wb_master_ack_o(wb_master_ack),
        .wb_master_cyc_i(wb_master_cyc),
        .wb_master_rty_o(wb_master_rty),
        .wb_master_err_o(wb_master_err),

        // Slave 0 interface (to BaseRAM controller)
        .wb_slave0_adr_o(wb_slave0_adr),
        .wb_slave0_dat_o(wb_slave0_dat_o),
        .wb_slave0_dat_i(wb_slave0_dat_i),
        .wb_slave0_we_o(wb_slave0_we),
        .wb_slave0_sel_o(wb_slave0_sel),
        .wb_slave0_stb_o(wb_slave0_stb),
        .wb_slave0_ack_i(wb_slave0_ack),
        .wb_slave0_cyc_o(wb_slave0_cyc),
        .wb_slave0_rty_i(wb_slave0_rty),
        .wb_slave0_err_i(wb_slave0_err),
        // Address range: 0x8000_0000 ~ 0x803F_FFFF
        .wbs0_addr    (32'h8000_0000),
        .wbs0_addr_msk(32'hFFC0_0000),

        // Slave 1 interface (to ExtRAM controller)
        .wb_slave1_adr_o(wb_slave1_adr),
        .wb_slave1_dat_o(wb_slave1_dat_o),
        .wb_slave1_dat_i(wb_slave1_dat_i),
        .wb_slave1_we_o(wb_slave1_we),
        .wb_slave1_sel_o(wb_slave1_sel),
        .wb_slave1_stb_o(wb_slave1_stb),
        .wb_slave1_ack_i(wb_slave1_ack),
        .wb_slave1_cyc_o(wb_slave1_cyc),
        .wb_slave1_rty_i(wb_slave1_rty),
        .wb_slave1_err_i(wb_slave1_err),
        // Address range: 0x8040_0000 ~ 0x807F_FFFF
        .wbs1_addr    (32'h8040_0000),
        .wbs1_addr_msk(32'hFFC0_0000),

        // Slave 2 interface (to UART controller)
        .wb_slave2_adr_o(wb_slave2_adr),
        .wb_slave2_dat_o(wb_slave2_dat_o),
        .wb_slave2_dat_i(wb_slave2_dat_i),
        .wb_slave2_we_o(wb_slave2_we),
        .wb_slave2_sel_o(wb_slave2_sel),
        .wb_slave2_stb_o(wb_slave2_stb),
        .wb_slave2_ack_i(wb_slave2_ack),
        .wb_slave2_cyc_o(wb_slave2_cyc),
        .wb_slave2_rty_i(wb_slave2_rty),
        .wb_slave2_err_i(wb_slave2_err),
        // Address range: 0x1000_0000 ~ 0x1000_FFFF
        .wbs2_addr    (32'h1000_0000),
        .wbs2_addr_msk(32'hFFFF_0000),

        // Slave 3 interface (to CLINT)
        .wb_slave3_adr_o(wb_slave3_adr),
        .wb_slave3_dat_o(wb_slave3_dat_o),
        .wb_slave3_dat_i(wb_slave3_dat_i),
        .wb_slave3_we_o(wb_slave3_we),
        .wb_slave3_sel_o(wb_slave3_sel),
        .wb_slave3_stb_o(wb_slave3_stb),
        .wb_slave3_ack_i(wb_slave3_ack),
        .wb_slave3_cyc_o(wb_slave3_cyc),
        .wb_slave3_rty_i(wb_slave3_rty),
        .wb_slave3_err_i(wb_slave3_err),
        // Address range: 0x0200_0000 ~ 0x020F_FFFF
        .wbs3_addr    (32'h0200_0000),
        .wbs3_addr_msk(32'hFFF0_0000)
    );

    /* =========== Wishbone MUX end =========== */

    /* =========== Wishbone Slaves begin =========== */
    sram_controller #(
        .SRAM_ADDR_WIDTH(20),
        .SRAM_DATA_WIDTH(32)
    ) sram_controller_base (
        .clk_i(sys_clk),
        .rst_i(sys_rst),

        // Wishbone slave (from MUX)
        .wb_adr_i(wb_slave0_adr),
        .wb_dat_i(wb_slave0_dat_o),
        .wb_dat_o(wb_slave0_dat_i),
        .wb_we_i(wb_slave0_we),
        .wb_sel_i(wb_slave0_sel),
        .wb_stb_i(wb_slave0_stb),
        .wb_ack_o(wb_slave0_ack),
        .wb_cyc_i(wb_slave0_cyc),

        // To SRAM chip
        .sram_addr(base_ram_addr),
        .sram_data(base_ram_data),
        .sram_ce_n(base_ram_ce_n),
        .sram_oe_n(base_ram_oe_n),
        .sram_we_n(base_ram_we_n),
        .sram_be_n(base_ram_be_n)
    );

    sram_controller #(
        .SRAM_ADDR_WIDTH(20),
        .SRAM_DATA_WIDTH(32)
    ) sram_controller_ext (
        .clk_i(sys_clk),
        .rst_i(sys_rst),

        // Wishbone slave (from MUX)
        .wb_adr_i(wb_slave1_adr),
        .wb_dat_i(wb_slave1_dat_o),
        .wb_dat_o(wb_slave1_dat_i),
        .wb_we_i(wb_slave1_we),
        .wb_sel_i(wb_slave1_sel),
        .wb_stb_i(wb_slave1_stb),
        .wb_ack_o(wb_slave1_ack),
        .wb_cyc_i(wb_slave1_cyc),

        // To SRAM chip
        .sram_addr(ext_ram_addr),
        .sram_data(ext_ram_data),
        .sram_ce_n(ext_ram_ce_n),
        .sram_oe_n(ext_ram_oe_n),
        .sram_we_n(ext_ram_we_n),
        .sram_be_n(ext_ram_be_n)
    );

    // 串口控制器模块
    // NOTE: 如果修改系统时钟频率，也需要修改此处的时钟频率参数
    uart_controller #(
        .CLK_FREQ(50_000_000),
        .BAUD    (115200)
    ) uart_controller (
        .clk_i(sys_clk),
        .rst_i(sys_rst),

        // Wishbone slave (from MUX)
        .wb_adr_i(wb_slave2_adr),
        .wb_dat_i(wb_slave2_dat_o),
        .wb_dat_o(wb_slave2_dat_i),
        .wb_we_i(wb_slave2_we),
        .wb_sel_i(wb_slave2_sel),
        .wb_stb_i(wb_slave2_stb),
        .wb_ack_o(wb_slave2_ack),
        .wb_cyc_i(wb_slave2_cyc),

        // to UART pins
        .uart_txd_o(txd),
        .uart_rxd_i(rxd)
    );

    // CLINT (Core Local Interruptor) 模块
    logic timer_interrupt;  // Timer 中断信号
    
    clint clint_inst (
        .clk_i(sys_clk),
        .rst_i(sys_rst),
        
        // Wishbone slave (from MUX)
        .wb_adr_i(wb_slave3_adr),
        .wb_dat_i(wb_slave3_dat_o),
        .wb_dat_o(wb_slave3_dat_i),
        .wb_we_i(wb_slave3_we),
        .wb_sel_i(wb_slave3_sel),
        .wb_stb_i(wb_slave3_stb),
        .wb_ack_o(wb_slave3_ack),
        .wb_cyc_i(wb_slave3_cyc),
        
        // Timer interrupt output
        .timer_interrupt(timer_interrupt)
    );
    
    // CLINT 不支持 retry 和 error 信号
    assign wb_slave3_rty = 1'b0;
    assign wb_slave3_err = 1'b0;

    /* =========== Wishbone Slaves end =========== */

    // ==================== 内部信号定义 ====================
    
    // PC和分支预测
    logic [31:0] pc, next_pc;
    logic [31:0] predicted_pc;
    logic        prediction_valid;
    logic        branch_mispredict;
    logic [31:0] correct_pc;

    // 流水线控制信号
    logic        hazard_stall; 
    logic        mem_stall;    
    logic [4:0]  flush_mask;  // 每级流水线的flush信号

    // ID stage branch signals
    logic        branch_redirect_id;
    logic [31:0] branch_target_id;

    // Memory wait signals
    logic inst_mem_wait;
    logic data_mem_wait;
    logic if_stall_req; // Stall request from IF stage (ICACHE)
    logic mem_stall_req; // Stall request from MEM stage (DCACHE)

    assign inst_mem_wait = if_stall_req;
    assign data_mem_wait = mem_stall_req || fence_i_active;
    
    // ==================== FENCE.I Controller ====================
    // When FENCE.I instruction reaches EX stage:
    // 1. Flush DCache (writeback all dirty lines to memory)
    // 2. Invalidate ICache (clear all valid bits)
    // 3. Stall pipeline until complete
    
    typedef enum logic [1:0] {
        FENCE_I_IDLE,
        FENCE_I_FLUSH_DCACHE,
        FENCE_I_INVALIDATE_ICACHE
    } fence_i_state_t;
    
    fence_i_state_t fence_i_state, fence_i_next_state;
    
    logic dcache_flush_req;
    logic dcache_flush_done;
    logic icache_invalidate;
    logic fence_i_active;
    
    // FENCE.I is active when in EX stage (id_ex_reg.is_fence_i && id_ex_reg.valid)
    wire fence_i_in_ex = id_ex_reg.is_fence_i && id_ex_reg.valid;
    
    // FENCE.I state machine
    always_ff @(posedge sys_clk or posedge sys_rst) begin
        if (sys_rst) begin
            fence_i_state <= FENCE_I_IDLE;
        end else begin
            fence_i_state <= fence_i_next_state;
        end
    end
    
    always_comb begin
        fence_i_next_state = fence_i_state;
        dcache_flush_req = 1'b0;
        icache_invalidate = 1'b0;
        fence_i_active = 1'b0;
        
        case (fence_i_state)
            FENCE_I_IDLE: begin
                if (fence_i_in_ex) begin
                    // Start stalling immediately to prevent FENCE.I from advancing
                    fence_i_active = 1'b1;
                    // Also start flush request immediately
                    dcache_flush_req = 1'b1;
                    fence_i_next_state = FENCE_I_FLUSH_DCACHE;
                end
            end
            
            FENCE_I_FLUSH_DCACHE: begin
                dcache_flush_req = 1'b1;
                fence_i_active = 1'b1;
                if (dcache_flush_done) begin
                    fence_i_next_state = FENCE_I_INVALIDATE_ICACHE;
                end
            end
            
            FENCE_I_INVALIDATE_ICACHE: begin
                icache_invalidate = 1'b1;
                // Don't stall anymore - let pipeline proceed after this cycle
                fence_i_active = 1'b0;
                fence_i_next_state = FENCE_I_IDLE;
            end
            
            default: fence_i_next_state = FENCE_I_IDLE;
        endcase
    end
    
    // ==================== 流水线寄存器 ====================
    
    if_id_reg_t if_id_reg, if_id_next;
    id_ex_reg_t id_ex_reg, id_ex_next;
    ex_mem_reg_t ex_mem_reg, ex_mem_next;
    mem_wb_reg_t mem_wb_reg, mem_wb_next;
    
    // ==================== CSR 信号 ====================
    
    // EX 阶段到 CSR 模块的接口
    logic [11:0] csr_addr;
    csr_op_t     csr_op;
    logic [31:0] csr_wdata;
    logic [31:0] csr_rdata;
    
    // 特权指令信号
    logic ex_ecall, ex_ebreak, ex_mret, ex_illegal;
    
    // CSR 模块输出
    logic [31:0] mtvec_out;
    logic [31:0] mepc_out;
    logic        mie_mtie;
    logic        mstatus_mie;
    logic [1:0]  priv_mode;
    
    // PMP 配置输出
    logic [31:0] pmpcfg0_out;
    logic [31:0] pmpaddr0_out;
    
    // satp 输出 (用于分页, Phase 2+ 使用)
    logic [31:0] satp_out;
    logic        paging_enabled;
    
    // 异常/中断处理信号 (Phase 2/4 使用)
    logic        trap_enter;
    logic [31:0] trap_cause;
    logic [31:0] trap_pc;
    logic [31:0] trap_val;
    
    // ==================== 模块实例化 ====================
    
    // 取指令级
    if_stage u_if_stage (
        .clk            (sys_clk),
        .rst           (sys_rst),
        .stall          (hazard_stall || mem_stall), // Stall signal for IF stage (mostly for debug/trace)
        .flush          (flush_mask[0]),
        .if_id_next     (if_id_next),
        .pc             (pc),                   //in
        .ex_pc          (id_ex_reg.pc),         //in
        .next_pc        (next_pc),               //out
        .predicted_pc   (predicted_pc),        //out
        .prediction_valid(prediction_valid),    //out
        .branch_mispredict(branch_mispredict), //in
        .correct_pc     (correct_pc),           //in
        .ex_is_branch   (id_ex_reg.is_branch),  //in
        .branch_redirect_id(branch_redirect_id),      //in
        .branch_target_id(branch_target_id),    //in
        .icache_invalidate(icache_invalidate),  // FENCE.I invalidate
        .stall_req      (if_stall_req),         //out
        
        // Wishbone master interface
        .wb_adr_o       (wb_inst_adr),
        .wb_dat_o       (wb_inst_dat_o),
        .wb_dat_i       (wb_inst_dat_i),
        .wb_we_o        (wb_inst_we),
        .wb_sel_o       (wb_inst_sel),
        .wb_stb_o       (wb_inst_stb),
        .wb_ack_i       (wb_inst_ack),
        .wb_cyc_o       (wb_inst_cyc),
        .wb_rty_i       (wb_inst_rty),
        .wb_err_i       (wb_inst_err)
    );
    
    // 译码级
    id_stage u_id_stage (
        .clk            (sys_clk),
        .rst           (sys_rst),
        .stall          (hazard_stall || mem_stall),
        .flush          (flush_mask[1]),
        .if_id_reg      (if_id_reg),
        .id_ex_next     (id_ex_next),
        // 寄存器堆接口
        .wb_rd          (mem_wb_reg.rd),    //写回的目的寄存器号
        .reg_write_data (mem_wb_reg.mem_to_reg ? mem_wb_reg.mem_data : mem_wb_reg.alu_result),  //写回的数据
        .wb_enable      (mem_wb_reg.reg_write && mem_wb_reg.valid), //写回使能
        // Forwarding inputs for early branch
        .ex_mem_fwd_in  (ex_mem_reg),
        .mem_wb_fwd_in  (mem_wb_reg),
        // Early branch resolution
        .branch_redirect_id  (branch_redirect_id),
        .branch_target_id (branch_target_id)
    );

    // 执行级
    ex_stage u_ex_stage (
        .clk            (sys_clk),
        .rst           (sys_rst),
        .flush          (flush_mask[2]),
        .id_ex_reg      (id_ex_reg),
        .ex_mem_next    (ex_mem_next),
        // 转发接口
        .fwd_ex_data    (ex_mem_reg.alu_result),
        .fwd_mem_data   (mem_wb_reg.mem_to_reg ? mem_wb_reg.mem_data : mem_wb_reg.alu_result),
        .fwd_ex_valid   (ex_mem_reg.reg_write && ex_mem_reg.valid),
        .fwd_mem_valid  (mem_wb_reg.reg_write && mem_wb_reg.valid),
        .fwd_ex_rd      (ex_mem_reg.rd),
        .fwd_mem_rd     (mem_wb_reg.rd),
        // 分支结果
        .branch_mispredict  (branch_mispredict),//out
        .correct_pc         (correct_pc),       //out
        // CSR 接口
        .csr_addr_o     (csr_addr),
        .csr_op_o       (csr_op),
        .csr_wdata_o    (csr_wdata),
        .csr_rdata_i    (csr_rdata),
        // 特权指令信号
        .ex_ecall       (ex_ecall),
        .ex_ebreak      (ex_ebreak),
        .ex_mret        (ex_mret),
        .ex_illegal     (ex_illegal)
    );
    
    // ==================== 异常/中断处理逻辑 ====================
    
    // ========== 异常信号 (来自 EX stage) ==========
    // 同步异常: ecall, ebreak, illegal instruction
    logic exception_trigger;
    assign exception_trigger = ex_ecall || ex_ebreak || ex_illegal;
    
    // ========== Timer 中断检测 ==========
    // Timer 中断待处理条件:
    // 1. mip.MTIP (timer_interrupt from CLINT)
    // 2. mie.MTIE (timer interrupt enable)
    // 3. 中断使能检查 (取决于当前特权级):
    //    - 在 M-mode: 需要 mstatus.MIE = 1
    //    - 在 U/S-mode: M-mode 中断总是使能 (不检查 mstatus.MIE)
    logic mie_enabled;
    assign mie_enabled = (priv_mode != PRIV_M) || mstatus_mie;
    
    logic timer_int_pending;
    assign timer_int_pending = timer_interrupt && mie_mtie && mie_enabled;
    
    // 中断触发条件:
    // 1. 有中断待处理
    // 2. 有有效指令可以被中断 (在指令边界)
    // 3. 没有正在处理的异常 (异常优先于中断)
    // 4. 没有流水线暂停
    logic interrupt_trigger;
    assign interrupt_trigger = timer_int_pending && 
                              id_ex_reg.valid && 
                              !exception_trigger && 
                              !mem_stall;
    
    // ========== Trap 进入信号 ==========
    // 异常或中断触发时进入 trap
    assign trap_enter = (exception_trigger || interrupt_trigger) && !mem_stall;
    
    // ========== Trap 原因 ==========
    // 中断: mcause[31] = 1, 低位为中断原因
    // 异常: mcause[31] = 0, 低位为异常原因
    always_comb begin
        if (interrupt_trigger) begin
            // Timer 中断
            trap_cause = INT_M_TIMER;  // 32'h80000007
        end else if (ex_illegal) begin
            // 非法指令异常
            trap_cause = EX_ILLEGAL_INST;  // 32'd2
        end else if (ex_ecall) begin
            // ecall 根据当前特权模式决定异常代码
            case (priv_mode)
                PRIV_U:  trap_cause = EX_ECALL_U;   // User mode ecall
                PRIV_S:  trap_cause = EX_ECALL_S;   // Supervisor mode ecall
                PRIV_M:  trap_cause = EX_ECALL_M;   // Machine mode ecall
                default: trap_cause = EX_ECALL_M;
            endcase
        end else if (ex_ebreak) begin
            trap_cause = EX_BREAKPOINT;  // Breakpoint exception
        end else begin
            trap_cause = 32'h0;
        end
    end
    
    // 异常/中断发生时的 PC (当前 EX 阶段的指令地址)
    assign trap_pc = id_ex_reg.pc;
    
    // 异常值 (mtval) - 对于 ecall/ebreak/中断 为 0
    assign trap_val = 32'h0;
    
    // ========== 向量化中断支持 ==========
    // mtvec[1:0] = MODE: 00=Direct, 01=Vectored
    // Direct: 所有 trap 跳转到 mtvec.BASE
    // Vectored: 中断跳转到 mtvec.BASE + 4*cause, 异常跳转到 mtvec.BASE
    logic [31:0] trap_vector_addr;
    logic [1:0] mtvec_mode;
    assign mtvec_mode = mtvec_out[1:0];
    
    always_comb begin
        if (interrupt_trigger && mtvec_mode == 2'b01) begin
            // Vectored mode for interrupts: BASE + 4 * cause (低7位)
            trap_vector_addr = {mtvec_out[31:2], 2'b00} + {25'b0, trap_cause[6:0], 2'b00};
        end else begin
            // Direct mode or exception: 跳转到 BASE
            trap_vector_addr = {mtvec_out[31:2], 2'b00};
        end
    end
    
    // ========== 异常/mret PC 重定向 ==========
    logic exception_redirect;
    logic [31:0] exception_target;
    
    always_comb begin
        if (trap_enter) begin
            // 异常/中断进入: 跳转到 trap vector
            exception_redirect = 1'b1;
            exception_target = trap_vector_addr;
        end else if (ex_mret && !mem_stall) begin
            // mret: 跳转回 mepc
            exception_redirect = 1'b1;
            exception_target = mepc_out;
        end else begin
            exception_redirect = 1'b0;
            exception_target = 32'h0;
        end
    end
    
    csr_regfile u_csr (
        .clk            (sys_clk),
        .rst            (sys_rst),
        // CSR 读写接口
        .csr_addr       (csr_addr),
        .csr_op         (csr_op),
        .csr_wdata      (csr_wdata),
        .csr_rdata      (csr_rdata),
        // 异常/中断接口
        .trap_enter     (trap_enter),
        .trap_cause     (trap_cause),
        .trap_pc        (trap_pc),
        .trap_val       (trap_val),
        .mtvec_out      (mtvec_out),
        .mepc_out       (mepc_out),
        // mret 接口
        .mret_exec      (ex_mret && !mem_stall),
        // 中断输入
        .timer_interrupt(timer_interrupt),
        // 中断输出
        .mie_mtie       (mie_mtie),
        .mstatus_mie    (mstatus_mie),
        .priv_mode      (priv_mode),
        // PMP 输出
        .pmpcfg0_out    (pmpcfg0_out),
        .pmpaddr0_out   (pmpaddr0_out),
        // satp 输出 (用于分页)
        .satp_out       (satp_out),
        .paging_enabled (paging_enabled)
    );
    
    // 访存级
    mem_stage u_mem_stage (
        .clk            (sys_clk),
        .rst           (sys_rst),
        .stall          (mem_stall), // Connect stall signal
        .flush          (flush_mask[3]),
        .ex_mem_reg     (ex_mem_reg),
        .mem_wb_next    (mem_wb_next),
        // FENCE.I DCache flush interface
        .dcache_flush_req (dcache_flush_req),
        .dcache_flush_done(dcache_flush_done),
        // Wishbone master interface
        .wb_adr_o       (wb_data_adr),
        .wb_dat_o       (wb_data_dat_o),
        .wb_dat_i       (wb_data_dat_i),
        .wb_we_o        (wb_data_we),
        .wb_sel_o       (wb_data_sel),
        .wb_stb_o       (wb_data_stb),
        .wb_ack_i       (wb_data_ack),
        .wb_cyc_o       (wb_data_cyc),
        .wb_rty_i       (wb_data_rty),
        .wb_err_i       (wb_data_err),
        .stall_req      (mem_stall_req)
    );
    
    // 写回级
    wb_stage u_wb_stage (
        .clk            (sys_clk),
        .rst           (sys_rst),
        .flush          (flush_mask[4]),
        .mem_wb_reg     (mem_wb_reg)
    );

    // 危险检测单元
    hazard_unit u_hazard_unit (
        .id_ex_mem_read (id_ex_reg.mem_read),
        .id_ex_reg_write(id_ex_reg.reg_write),
        .id_ex_rd       (id_ex_reg.rd),
        .ex_is_branch   (id_ex_reg.is_branch),
        .ex_mem_mem_read(ex_mem_reg.mem_read), 
        .ex_mem_rd      (ex_mem_reg.rd),       
        .if_id_inst     (if_id_reg.inst),
        .if_id_rs1      (if_id_reg.inst[19:15]),
        .if_id_rs2      (if_id_reg.inst[24:20]),
        .branch_mispredict(branch_mispredict),
        .branch_redirect_id(branch_redirect_id),
        .inst_mem_wait  (inst_mem_wait),
        .data_mem_wait  (data_mem_wait),
        .hazard_stall   (hazard_stall),     //out
        .mem_stall      (mem_stall),        //out
        .flush_mask     (flush_mask)        //out
    );
    
    
    // ==================== 流水线寄存器更新 ====================
    


    always_ff @(posedge sys_clk or posedge sys_rst) begin
        if (sys_rst) begin
            if_id_reg <= '0;
            id_ex_reg <= '0;
            ex_mem_reg <= '0;
            mem_wb_reg <= '0;
            pc <= BASERAM_BASE;  // 从0x80000000开始执行
        end else begin
            // Control for PC and IF/ID register
            if (mem_stall) begin
                // Memory Stall: Freeze everything
                if_id_reg <= if_id_reg;
                pc <= pc;
            end else if (exception_redirect) begin
                // 异常/mret 重定向: 最高优先级 (仅次于 mem_stall)
                // 冲刷 IF/ID，PC 跳转到 mtvec 或 mepc
                if_id_reg <= '0;
                pc <= exception_target;
            end else if (flush_mask[0]) begin  // 冲刷IF的优先级高过hazard_stall。
                // Branch redirect or mispredict: Flush IF/ID, update PC to target
                if_id_reg <= '0;
                pc <= next_pc; 
            end else if (hazard_stall) begin
                // Hazard Stall: Hold IF/ID and PC
                if_id_reg <= if_id_reg;
                pc <= pc;
            end else begin
                // Normal operation
                if (if_id_next.valid) begin
                    if_id_reg <= if_id_next;
                    pc <= next_pc;
                end else begin
                    // if_id_next.valid为低的原因是flush或者读sram等待，此时应插入气泡等待。
                    if_id_reg <= '0;
                    pc <= pc;
                end
            end

            // Control for ID/EX register
            if (mem_stall) begin
                // Memory Stall: Freeze
                id_ex_reg <= id_ex_reg;
            end else if (exception_redirect) begin
                // 异常/mret: 冲刷 ID/EX (ecall/ebreak/mret 在 EX 阶段检测到)
                id_ex_reg <= '0;
            end else if (hazard_stall) begin
                // Hazard Stall: Inject Bubble
                id_ex_reg <= '0; 
            end else begin
                // Normal or Flush
                id_ex_reg <= flush_mask[1] ? '0 : id_ex_next;
            end

            // Control for EX/MEM register
            if (mem_stall) begin
                // Memory Stall: Freeze
                ex_mem_reg <= ex_mem_reg;
            end else begin
                // Normal or Flush
                ex_mem_reg <= flush_mask[2] ? '0 : ex_mem_next;
            end

            // Control for MEM/WB register
            if (mem_stall) begin
                // Memory Stall: Freeze
                mem_wb_reg <= mem_wb_reg;
            end else begin
                // Normal or Flush
                mem_wb_reg <= flush_mask[3] ? '0 : mem_wb_next;
            end
        end
    end

endmodule
