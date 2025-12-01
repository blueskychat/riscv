`include "defines.sv"
`include "pipeline_regs.sv"

// mem_stage.sv - 访存级
module mem_stage (
    input  wire logic        clk,
    input  wire logic        rst,
    input  wire logic        stall,
    input  wire logic        flush,
    
    input  ex_mem_reg_t ex_mem_reg,
    output mem_wb_reg_t mem_wb_next,
    
    // Wishbone master interface (DCache to external)
    output logic [31:0] wb_adr_o,
    output logic [31:0] wb_dat_o,
    input  wire  [31:0] wb_dat_i,
    output logic        wb_we_o,
    output logic [3:0]  wb_sel_o,
    output logic        wb_stb_o,
    input  wire         wb_ack_i,
    output logic        wb_cyc_o,
    input  wire         wb_rty_i,
    input  wire         wb_err_i,
    
    output logic        stall_req // Output for hazard unit
);

    // Internal signals for DCache connection
    logic [31:0] cpu_mem_adr;
    logic [31:0] cpu_mem_dat_o;
    logic [31:0] cpu_mem_dat_i;
    logic        cpu_mem_we;
    logic [3:0]  cpu_mem_sel;
    logic        cpu_mem_stb;
    logic        cpu_mem_ack;
    logic        cpu_mem_cyc;
    
    // 内存访问状态机
    typedef enum logic [1:0] {
        MEM_IDLE,
        MEM_WAIT_ACK,
        MEM_DONE     // Wait for pipeline stall to release
    } mem_state_t;
    
    mem_state_t state, next_state;
    logic [31:0] mem_data_raw;
    logic [31:0] mem_data_aligned;
    logic [31:0] read_data_reg; // Latch for read data
    
    // 状态机
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= MEM_IDLE;
        else
            state <= next_state;
    end
    
    // Latch data on ACK
    always_ff @(posedge clk) begin
        if (state == MEM_WAIT_ACK && cpu_mem_ack) begin
            read_data_reg <= cpu_mem_dat_i;
        end
    end

    logic mem_op_pending;
    // 当有有效的内存读写请求时，mem_op_pending 为高
    assign mem_op_pending = (ex_mem_reg.mem_read || ex_mem_reg.mem_write) && ex_mem_reg.valid;
    // Only assert cyc/stb in IDLE (starting) or WAIT_ACK. NOT in DONE.    
    assign cpu_mem_stb = (state == MEM_WAIT_ACK) || (state == MEM_IDLE && mem_op_pending);
    assign cpu_mem_cyc = (state == MEM_WAIT_ACK) || (state == MEM_IDLE && mem_op_pending); 
    assign stall_req = cpu_mem_cyc && cpu_mem_stb && !cpu_mem_ack;
 
    always_comb begin
        next_state = state;
        
        case (state)
            MEM_IDLE: begin
                if (mem_op_pending)
                    next_state = MEM_WAIT_ACK;
            end
            
            MEM_WAIT_ACK: begin
                if (cpu_mem_ack) begin
                    if (stall) 
                        next_state = MEM_DONE; // If stalled, wait in DONE
                    else 
                        next_state = MEM_IDLE; // If not stalled, finish
                end
            end

            MEM_DONE: begin
                if (!stall)
                    next_state = MEM_IDLE; // Wait for stall to release
            end
        endcase
    end
    
    always_comb begin
        cpu_mem_adr = ex_mem_reg.alu_result;
        cpu_mem_dat_o = ex_mem_reg.rs2_data;
        cpu_mem_we = ex_mem_reg.mem_write;
        
        // 字节选择信号
        case (ex_mem_reg.mem_width)
            MEM_BYTE: begin
                case (ex_mem_reg.alu_result[1:0])
                    2'b00: cpu_mem_sel = 4'b0001;
                    2'b01: cpu_mem_sel = 4'b0010;
                    2'b10: cpu_mem_sel = 4'b0100;
                    2'b11: cpu_mem_sel = 4'b1000;
                endcase
            end
            MEM_HALF: begin
                cpu_mem_sel = ex_mem_reg.alu_result[1] ? 4'b1100 : 4'b0011;
            end
            MEM_WORD: begin
                cpu_mem_sel = 4'b1111;
            end
            default: cpu_mem_sel = 4'b1111;
        endcase
        
   end
    
    // DCache Instantiation
    dcache u_dcache (
        .clk            (clk),
        .rst            (rst),
        
        // CPU Interface
        .mem_req_addr_i (cpu_mem_adr),
        .mem_req_wdata_i(cpu_mem_dat_o),
        .mem_req_we_i   (cpu_mem_we),
        .mem_req_be_i   (cpu_mem_sel),
        .mem_req_valid_i(cpu_mem_stb), 
        
        .mem_resp_data_o(cpu_mem_dat_i),
        .mem_req_ready_o(cpu_mem_ack), 

        // Wishbone Master Interface
        .wb_adr_o       (wb_adr_o),
        .wb_dat_o       (wb_dat_o),
        .wb_dat_i       (wb_dat_i),
        .wb_we_o        (wb_we_o),
        .wb_sel_o       (wb_sel_o),
        .wb_stb_o       (wb_stb_o),
        .wb_ack_i       (wb_ack_i),
        .wb_cyc_o       (wb_cyc_o),
        .wb_rty_i       (wb_rty_i),
        .wb_err_i       (wb_err_i)
    );

    // Data alignment and sign extension
    assign mem_data_raw = (state == MEM_DONE) ? read_data_reg : cpu_mem_dat_i;
    
    always_comb begin
        case (ex_mem_reg.mem_width)
            MEM_BYTE: begin
                case (ex_mem_reg.alu_result[1:0])
                    2'b00: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[7:0]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[7]}}, mem_data_raw[7:0]};
                    end
                    2'b01: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[15:8]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[15]}}, mem_data_raw[15:8]};
                    end
                    2'b10: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[23:16]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[23]}}, mem_data_raw[23:16]};
                    end
                    2'b11: begin
                        if (ex_mem_reg.mem_unsigned)
                            mem_data_aligned = {24'b0, mem_data_raw[31:24]};
                        else
                            mem_data_aligned = {{24{mem_data_raw[31]}}, mem_data_raw[31:24]};
                    end
                endcase
            end
            MEM_HALF: begin
                if (ex_mem_reg.alu_result[1]) begin
                    if (ex_mem_reg.mem_unsigned)
                        mem_data_aligned = {16'b0, mem_data_raw[31:16]};
                    else
                        mem_data_aligned = {{16{mem_data_raw[31]}}, mem_data_raw[31:16]};
                end else begin
                    if (ex_mem_reg.mem_unsigned)
                        mem_data_aligned = {16'b0, mem_data_raw[15:0]};
                    else
                        mem_data_aligned = {{16{mem_data_raw[15]}}, mem_data_raw[15:0]};
                end
            end
            MEM_WORD: begin
                mem_data_aligned = mem_data_raw;
            end
            default: mem_data_aligned = mem_data_raw;
        endcase
    end
    
    // 准备下一级流水线寄存器
    always_comb begin
        mem_wb_next = '0;
        
        // Output valid if:
        // 1. Not flushing
        // 2. Input is valid
        // 3. AND (We are in DONE state OR we just finished (ack received))
        // Actually, if we are in WAIT_ACK and ack is high, we provide data.
        // If we are in DONE, we provide data.
        // If we are in IDLE and no op pending (e.g. ALU op), we provide data immediately.
        
        if (!flush && ex_mem_reg.valid) begin
            mem_wb_next.alu_result = ex_mem_reg.alu_result;
            mem_wb_next.mem_data = mem_data_aligned;
            mem_wb_next.rd = ex_mem_reg.rd;
            mem_wb_next.reg_write = ex_mem_reg.reg_write;
            mem_wb_next.mem_to_reg = ex_mem_reg.mem_to_reg;
            
            if (ex_mem_reg.mem_read || ex_mem_reg.mem_write) begin
                // Memory op: valid only when done                
                mem_wb_next.valid = (state == MEM_DONE) || (state == MEM_WAIT_ACK && cpu_mem_ack);
            end else begin
                // ALU op: always valid
                mem_wb_next.valid = 1'b1;
            end
        end
    end

endmodule
