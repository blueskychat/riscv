
module wishbone_master #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input wire clk_i,
    input wire rst_i,


    // Interface from Instruction Fetch Stage (slave)
    input  wire [ADDR_WIDTH-1:0] wb_inst_adr_i,
    input  wire [DATA_WIDTH-1:0] wb_inst_dat_i,
    output reg  [DATA_WIDTH-1:0] wb_inst_dat_o,
    input  wire                  wb_inst_we_i,
    input  wire [DATA_WIDTH/8-1:0] wb_inst_sel_i,
    input  wire                  wb_inst_stb_i,
    output reg                   wb_inst_ack_o,
    input  wire                  wb_inst_cyc_i,
    output reg                   wb_inst_rty_o,
    output reg                   wb_inst_err_o,

    // Interface from Memory Stage (slave)
    input  wire [ADDR_WIDTH-1:0] wb_data_adr_i,
    input  wire [DATA_WIDTH-1:0] wb_data_dat_i,
    output reg  [DATA_WIDTH-1:0] wb_data_dat_o,
    input  wire                  wb_data_we_i,
    input  wire [DATA_WIDTH/8-1:0] wb_data_sel_i,
    input  wire                  wb_data_stb_i,
    output reg                   wb_data_ack_o,
    input  wire                  wb_data_cyc_i,
    output reg                   wb_data_rty_o,
    output reg                   wb_data_err_o,

    // Interface to External Bus (master)
    output reg  [ADDR_WIDTH-1:0] wb_out_adr_o,
    output reg  [DATA_WIDTH-1:0] wb_out_dat_o,
    input  wire [DATA_WIDTH-1:0] wb_out_dat_i,
    output reg                   wb_out_we_o,
    output reg  [DATA_WIDTH/8-1:0] wb_out_sel_o,
    output reg                   wb_out_stb_o,
    input  wire                  wb_out_ack_i,
    output reg                   wb_out_cyc_o,
    input  wire                  wb_out_rty_i,
    input  wire                  wb_out_err_i
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
                if (wb_data_cyc_i) begin
                    next_state = GRANT_DATA;
                end else if (wb_inst_cyc_i) begin
                    next_state = GRANT_INST;
                end
            end
            GRANT_DATA: begin
                if (!wb_data_cyc_i || wb_out_ack_i || wb_out_err_i) begin
                    next_state = IDLE;
                end
            end
            GRANT_INST: begin
                if (!wb_inst_cyc_i || wb_out_ack_i || wb_out_err_i) begin
                    next_state = IDLE;
                end
            end
            default: next_state = IDLE;
        endcase
    end

    // Output Muxing
    always_comb begin
        // Default: Drive 0 or safe values
        wb_out_adr_o   = '0;
        wb_out_dat_o = '0;
        wb_out_we_o    = '0;
        wb_out_sel_o   = '0;
        wb_out_stb_o   = '0;
        wb_out_cyc_o   = '0;

        wb_inst_dat_o = '0;
        wb_inst_ack_o   = '0;
        wb_inst_err_o   = '0;
        wb_inst_rty_o   = '0;

        wb_data_dat_o = '0;
        wb_data_ack_o   = '0;
        wb_data_err_o   = '0;
        wb_data_rty_o   = '0;

        case (state)
            IDLE: begin
                // Combinational grant for low latency
                if (wb_data_cyc_i) begin
                    // Pass through DATA
                    wb_out_adr_o   = wb_data_adr_i;
                    wb_out_dat_o = wb_data_dat_i;
                    wb_out_we_o    = wb_data_we_i;
                    wb_out_sel_o   = wb_data_sel_i;
                    wb_out_stb_o   = wb_data_stb_i;
                    wb_out_cyc_o   = wb_data_cyc_i;
                    
                    // Return path
                    wb_data_dat_o = wb_out_dat_i;
                    wb_data_ack_o   = wb_out_ack_i;
                    wb_data_err_o   = wb_out_err_i;
                    wb_data_rty_o   = wb_out_rty_i;
                end else if (wb_inst_cyc_i) begin
                    // Pass through INST
                    wb_out_adr_o   = wb_inst_adr_i;
                    wb_out_dat_o = wb_inst_dat_i;
                    wb_out_we_o    = wb_inst_we_i;
                    wb_out_sel_o   = wb_inst_sel_i;
                    wb_out_stb_o   = wb_inst_stb_i;
                    wb_out_cyc_o   = wb_inst_cyc_i;

                    // Return path
                    wb_inst_dat_o = wb_out_dat_i;
                    wb_inst_ack_o   = wb_out_ack_i;
                    wb_inst_err_o   = wb_out_err_i;
                    wb_inst_rty_o   = wb_out_rty_i;
                end
            end
            GRANT_DATA: begin
                wb_out_adr_o   = wb_data_adr_i;
                wb_out_dat_o = wb_data_dat_i;
                wb_out_we_o    = wb_data_we_i;
                wb_out_sel_o   = wb_data_sel_i;
                wb_out_stb_o   = wb_data_stb_i;
                wb_out_cyc_o   = wb_data_cyc_i;

                wb_data_dat_o = wb_out_dat_i;
                wb_data_ack_o   = wb_out_ack_i;
                wb_data_err_o   = wb_out_err_i;
                wb_data_rty_o   = wb_out_rty_i;
            end
            GRANT_INST: begin
                wb_out_adr_o   = wb_inst_adr_i;
                wb_out_dat_o = wb_inst_dat_i;
                wb_out_we_o    = wb_inst_we_i;
                wb_out_sel_o   = wb_inst_sel_i;
                wb_out_stb_o   = wb_inst_stb_i;
                wb_out_cyc_o   = wb_inst_cyc_i;

                wb_inst_dat_o = wb_out_dat_i;
                wb_inst_ack_o   = wb_out_ack_i;
                wb_inst_err_o   = wb_out_err_i;
                wb_inst_rty_o   = wb_out_rty_i;
            end
        endcase
    end
endmodule