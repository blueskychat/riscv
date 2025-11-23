
module wishbone_master #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input wire clk_i,
    input wire rst_i,


    // Interface from Instruction Fetch Stage
    wishbone_if.slave wb_inst,

    // Interface from Memory Stage
    wishbone_if.slave wb_data,

    // Interface to External Bus (Master)
    wishbone_if.master wb_out
);

    typedef enum logic [1:0] {
        IDLE,
        GRANT_INST,
        GRANT_DATA
    } state_t;

    state_t state, next_state;

    // State Register
    always_ff @(posedge clk_i or posedge rst_i) begin
        if (rst_i)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next State Logic
    always_comb begin
        next_state = state;
        case (state)
            IDLE: begin
                // Priority: Data (MEM) > Instruction (IF)
                if (wb_data.cyc) begin
                    next_state = GRANT_DATA;
                end else if (wb_inst.cyc) begin
                    next_state = GRANT_INST;
                end
            end
            GRANT_DATA: begin
                if (!wb_data.cyc || wb_out.ack || wb_out.err) begin
                    next_state = IDLE;
                end
            end
            GRANT_INST: begin
                if (!wb_inst.cyc || wb_out.ack || wb_out.err) begin
                    next_state = IDLE;
                end
            end
            default: next_state = IDLE;
        endcase
    end

    // Output Muxing
    always_comb begin
        // Default: Drive 0 or safe values
        wb_out.adr   = '0;
        wb_out.dat_o = '0;
        wb_out.we    = '0;
        wb_out.sel   = '0;
        wb_out.stb   = '0;
        wb_out.cyc   = '0;

        wb_inst.dat_i = '0;
        wb_inst.ack   = '0;
        wb_inst.err   = '0;
        wb_inst.rty   = '0;

        wb_data.dat_i = '0;
        wb_data.ack   = '0;
        wb_data.err   = '0;
        wb_data.rty   = '0;

        case (state)
            IDLE: begin
                // Combinational grant for low latency
                if (wb_data.cyc) begin
                    // Pass through DATA
                    wb_out.adr   = wb_data.adr;
                    wb_out.dat_o = wb_data.dat_o;
                    wb_out.we    = wb_data.we;
                    wb_out.sel   = wb_data.sel;
                    wb_out.stb   = wb_data.stb;
                    wb_out.cyc   = wb_data.cyc;
                    
                    // Return path
                    wb_data.dat_i = wb_out.dat_i;
                    wb_data.ack   = wb_out.ack;
                    wb_data.err   = wb_out.err;
                    wb_data.rty   = wb_out.rty;
                end else if (wb_inst.cyc) begin
                    // Pass through INST
                    wb_out.adr   = wb_inst.adr;
                    wb_out.dat_o = wb_inst.dat_o;
                    wb_out.we    = wb_inst.we;
                    wb_out.sel   = wb_inst.sel;
                    wb_out.stb   = wb_inst.stb;
                    wb_out.cyc   = wb_inst.cyc;

                    // Return path
                    wb_inst.dat_i = wb_out.dat_i;
                    wb_inst.ack   = wb_out.ack;
                    wb_inst.err   = wb_out.err;
                    wb_inst.rty   = wb_out.rty;
                end
            end
            GRANT_DATA: begin
                wb_out.adr   = wb_data.adr;
                wb_out.dat_o = wb_data.dat_o;
                wb_out.we    = wb_data.we;
                wb_out.sel   = wb_data.sel;
                wb_out.stb   = wb_data.stb;
                wb_out.cyc   = wb_data.cyc;

                wb_data.dat_i = wb_out.dat_i;
                wb_data.ack   = wb_out.ack;
                wb_data.err   = wb_out.err;
                wb_data.rty   = wb_out.rty;
            end
            GRANT_INST: begin
                wb_out.adr   = wb_inst.adr;
                wb_out.dat_o = wb_inst.dat_o;
                wb_out.we    = wb_inst.we;
                wb_out.sel   = wb_inst.sel;
                wb_out.stb   = wb_inst.stb;
                wb_out.cyc   = wb_inst.cyc;

                wb_inst.dat_i = wb_out.dat_i;
                wb_inst.ack   = wb_out.ack;
                wb_inst.err   = wb_out.err;
                wb_inst.rty   = wb_out.rty;
            end
        endcase
    end
endmodule