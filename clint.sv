// clint.sv - Core Local Interruptor (CLINT)
// 实现 mtime 和 mtimecmp 寄存器以及 Timer 中断
module clint (
    input  wire logic        clk_i,
    input  wire logic        rst_i,
    
    // Wishbone slave interface
    input  wire logic [31:0] wb_adr_i,
    input  wire logic [31:0] wb_dat_i,
    output logic [31:0]      wb_dat_o,
    input  wire logic        wb_we_i,
    input  wire logic [3:0]  wb_sel_i,
    input  wire logic        wb_stb_i,
    output logic             wb_ack_o,
    input  wire logic        wb_cyc_i,
    
    // Timer interrupt output
    output logic             timer_interrupt
);

    // ==================== CLINT 寄存器 ====================
    
    // 64-bit mtime: 当前时间计数器
    logic [63:0] mtime;
    
    // 64-bit mtimecmp: 比较值
    logic [63:0] mtimecmp;
    
    // ==================== 地址映射 ====================
    // CLINT 基地址: 0x02000000
    // mtimecmp: 0x02004000 (offset 0x4000)
    // mtime:    0x0200BFF8 (offset 0xBFF8)
    
    localparam OFFSET_MTIMECMP_LO = 16'h4000;  // mtimecmp 低32位
    localparam OFFSET_MTIMECMP_HI = 16'h4004;  // mtimecmp 高32位
    localparam OFFSET_MTIME_LO    = 16'hBFF8;  // mtime 低32位
    localparam OFFSET_MTIME_HI    = 16'hBFFC;  // mtime 高32位
    
    // 提取地址偏移量（去掉基地址）
    wire [15:0] offset = wb_adr_i[15:0];
    
    // ==================== mtime 计数器 ====================
    // mtime 每个时钟周期递增
    
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            mtime <= 64'h0;
        end else begin
            mtime <= mtime + 64'h1;
        end
    end
    
    // ==================== Wishbone 读写逻辑 ====================
    
    logic wb_valid;
    assign wb_valid = wb_cyc_i && wb_stb_i;
    
    // 读取逻辑
    always_comb begin
        wb_dat_o = 32'h0;
        
        if (wb_valid && !wb_we_i) begin
            case (offset)
                OFFSET_MTIMECMP_LO: wb_dat_o = mtimecmp[31:0];
                OFFSET_MTIMECMP_HI: wb_dat_o = mtimecmp[63:32];
                OFFSET_MTIME_LO:    wb_dat_o = mtime[31:0];
                OFFSET_MTIME_HI:    wb_dat_o = mtime[63:32];
                default:            wb_dat_o = 32'h0;
            endcase
        end
    end
    
    // 写入逻辑
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            mtimecmp <= 64'hFFFFFFFFFFFFFFFF;  // 初始值很大，不会立即触发中断
        end else if (wb_valid && wb_we_i) begin
            case (offset)
                OFFSET_MTIMECMP_LO: begin
                    // 写入 mtimecmp 低32位
                    if (wb_sel_i[0]) mtimecmp[7:0]   <= wb_dat_i[7:0];
                    if (wb_sel_i[1]) mtimecmp[15:8]  <= wb_dat_i[15:8];
                    if (wb_sel_i[2]) mtimecmp[23:16] <= wb_dat_i[23:16];
                    if (wb_sel_i[3]) mtimecmp[31:24] <= wb_dat_i[31:24];
                end
                OFFSET_MTIMECMP_HI: begin
                    // 写入 mtimecmp 高32位
                    if (wb_sel_i[0]) mtimecmp[39:32] <= wb_dat_i[7:0];
                    if (wb_sel_i[1]) mtimecmp[47:40] <= wb_dat_i[15:8];
                    if (wb_sel_i[2]) mtimecmp[55:48] <= wb_dat_i[23:16];
                    if (wb_sel_i[3]) mtimecmp[63:56] <= wb_dat_i[31:24];
                end
                // mtime 是只读的，不处理写入
                default: ;
            endcase
        end
    end
    
    // Wishbone ACK - 单周期应答
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            wb_ack_o <= 1'b0;
        end else begin
            wb_ack_o <= wb_valid && !wb_ack_o;
        end
    end
    
    // ==================== Timer 中断生成 ====================
    // 当 mtime >= mtimecmp 时产生中断
    
    assign timer_interrupt = (mtime >= mtimecmp);

endmodule
