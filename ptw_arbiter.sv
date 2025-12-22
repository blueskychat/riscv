`include "defines.sv"

// ptw_arbiter.sv - Arbiter for IMMU and DMMU PTW requests
// Multiplexes two PTW masters into one PTW slave port for DCache
//
// 设计特点：
// 1. 优先级：DMMU > IMMU（数据访问优先）
// 2. 锁定机制：请求开始后锁定到该 MMU 直至完成
// 3. 假设 DCache 不支持 0 周期响应（ack 至少在下一周期返回）

module ptw_arbiter (
    input  logic        clk,
    input  logic        rst,

    // Master Port 1 (IMMU)
    input  logic [31:0] immu_ptw_addr_i,
    input  logic        immu_ptw_req_i,
    output logic [31:0] immu_ptw_data_o,
    output logic        immu_ptw_ack_o,

    // Master Port 2 (DMMU)
    input  logic [31:0] dmmu_ptw_addr_i,
    input  logic        dmmu_ptw_req_i,
    output logic [31:0] dmmu_ptw_data_o,
    output logic        dmmu_ptw_ack_o,

    // Slave Port (to DCache)
    output logic [31:0] dcache_ptw_addr_o,
    output logic        dcache_ptw_req_o,
    input  logic [31:0] dcache_ptw_data_i,
    input  logic        dcache_ptw_ack_i
);

    // ========================================================================
    // 状态机设计
    // ========================================================================
    typedef enum logic [1:0] {
        IDLE,
        LOCKED_IMMU,
        LOCKED_DMMU
    } state_t;
    
    state_t state, state_next;
    
    // 状态寄存器
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= state_next;
        end
    end
    
    // ========================================================================
    // 仲裁和状态转移逻辑（组合）
    // ========================================================================
    // serving_*: 当前正在服务谁（用于响应路由）
    // grant_*:   当前请求转发给谁（用于请求转发）
    
    logic serving_immu;
    logic serving_dmmu;
    logic grant_immu;
    logic grant_dmmu;
    
    always_comb begin
        state_next = state;
        serving_immu = 1'b0;
        serving_dmmu = 1'b0;
        grant_immu = 1'b0;
        grant_dmmu = 1'b0;
        
        case (state)
            IDLE: begin
                // 空闲状态：按优先级仲裁，立即授权
                // NOTE: serving_* remains 0 in IDLE - ack routing only happens in LOCKED states
                // This breaks the timing loop: req -> serving -> ack -> req
                if (dmmu_ptw_req_i) begin
                    grant_dmmu = 1'b1;
                    state_next = LOCKED_DMMU;
                end else if (immu_ptw_req_i) begin
                    grant_immu = 1'b1;
                    state_next = LOCKED_IMMU;
                end
            end
            
            LOCKED_IMMU: begin
                // 锁定到 IMMU
                serving_immu = 1'b1;  // 响应路由给 IMMU
                
                if (immu_ptw_req_i) begin
                    grant_immu = 1'b1;  // 继续当前请求
                end else if (dmmu_ptw_req_i) begin
                    // IMMU 释放，DMMU 有请求，切换
                    grant_dmmu = 1'b1;
                    state_next = LOCKED_DMMU;
                end else begin
                    state_next = IDLE;
                end
            end
            
            LOCKED_DMMU: begin
                // 锁定到 DMMU
                serving_dmmu = 1'b1;  // 响应路由给 DMMU
                
                if (dmmu_ptw_req_i) begin
                    grant_dmmu = 1'b1;  // 继续当前请求
                end else if (immu_ptw_req_i) begin
                    // DMMU 释放，IMMU 有请求，切换
                    grant_immu = 1'b1;
                    state_next = LOCKED_IMMU;
                end else begin
                    state_next = IDLE;
                end
            end
            
            default: state_next = IDLE;
        endcase
    end
    
    // ========================================================================
    // 请求转发 - 基于 grant_*（请求方向）
    // ========================================================================
    assign dcache_ptw_req_o  = grant_immu | grant_dmmu;
    assign dcache_ptw_addr_o = grant_dmmu ? dmmu_ptw_addr_i : immu_ptw_addr_i;
    
    // ========================================================================
    // 响应路由 - 基于 serving_*（响应方向）
    // ========================================================================
    assign immu_ptw_data_o = dcache_ptw_data_i;
    assign dmmu_ptw_data_o = dcache_ptw_data_i;
    
    assign immu_ptw_ack_o = serving_immu & dcache_ptw_ack_i;
    assign dmmu_ptw_ack_o = serving_dmmu & dcache_ptw_ack_i;

endmodule
