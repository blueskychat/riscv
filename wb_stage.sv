`include "defines.sv"
`include "pipeline_regs.sv"

// wb_stage.sv - 写回级
module wb_stage (
    input  wire logic        clk,
    input  wire logic        rst,
    input  wire logic        flush, // 来自流水线控制单元的冲刷信号, 在这里没有什么作用。它在riscv_cpu_top中使用。
    
    input  mem_wb_reg_t mem_wb_reg  // 来自MEM/WB流水线寄存器的输入, 同样在这里没有什么作用。这些信号在riscv_cpu_top中使用。
);

    // 写回级主要功能在寄存器堆中实现
    // 这里可以添加调试或性能计数器
    
    // 性能计数器示例
    logic [31:0] instruction_count;
    logic [31:0] cycle_count;
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            instruction_count <= 32'h0;
            cycle_count <= 32'h0;
        end else begin
            cycle_count <= cycle_count + 1;
            if (mem_wb_reg.valid)
                instruction_count <= instruction_count + 1;
        end
    end

endmodule