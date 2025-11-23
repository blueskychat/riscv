`include "defines.sv"

// hazard_unit.sv - 危险检测和流水线控制
module hazard_unit (
    input  logic        id_ex_mem_read,     // Does instr in EX read from memory?
    input  logic        id_ex_reg_write,    // Does instr in EX write to a register?
    input  logic [4:0]  id_ex_rd,
    input  logic        ex_is_branch,       // Is the instruction in EX a branch?
    input  logic        ex_mem_mem_read,    // Does instr in MEM read from memory?
    input  logic [4:0]  ex_mem_rd,          // Destination register in MEM stage
    input  logic [31:0] if_id_inst,         // Full instruction from IF/ID
    input  logic [4:0]  if_id_rs1,
    input  logic [4:0]  if_id_rs2,
    input  logic        branch_mispredict,
    input  logic        branch_redirect_id,
    input  logic        inst_mem_wait,
    input  logic        data_mem_wait,
    
    output logic        hazard_stall,
    output logic        mem_stall,
    output logic [4:0]  flush_mask
);

    // --- Data Hazard Detection ---

    logic load_use_hazard;    // Hazard between Load in EX and Use in ID
    logic alu_branch_hazard; // Hazard between ALU in EX and Branch in ID
    logic load_branch_hazard; // Hazard between Load in MEM and Branch in ID
    logic if_id_is_branch;

    always_comb begin
        // 1. Load-Use Hazard: An instruction in the ID stage depends on the result of a
        //    load instruction currently in the EX stage.
        load_use_hazard = id_ex_mem_read &&      // Is the instruction in EX a load?
                         (id_ex_rd != 5'h0) &&   // Does it write to a register (x0 is ignored)?
                         ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2)); // Does the instruction in ID use the result?

        // 2. ALU-Branch Hazard: A branch instruction in the ID stage depends on the result of an
        //    ALU instruction currently in the EX stage.
        if_id_is_branch = (if_id_inst[6:0] == OP_BRANCH);
        alu_branch_hazard = if_id_is_branch &&   // Is the instruction in ID a branch?
                            id_ex_reg_write &&   // Does the instruction in EX write to a register?
                           (id_ex_rd != 5'h0) && // Is the destination not x0?
                           ((id_ex_rd == if_id_rs1) || (id_ex_rd == if_id_rs2)); // Does the branch depend on the result?

        // 3. Load-Branch Hazard: A branch instruction in the ID stage depends on the result of a
        //    load instruction currently in the MEM stage. The data is not yet available for forwarding.
        load_branch_hazard = if_id_is_branch &&    // Is the instruction in ID a branch?
                             ex_mem_mem_read &&    // Is the instruction in MEM a load?
                             (ex_mem_rd != 5'h0) && // Is the destination not x0?
                             ((ex_mem_rd == if_id_rs1) || (ex_mem_rd == if_id_rs2)); // Does the branch depend on the result?
    end
    
    always_comb begin
        logic mispredict_is_jalr;
        
        // Hazard Stall: Needs bubble in ID/EX, hold IF/ID and PC
        hazard_stall = load_use_hazard || alu_branch_hazard || load_branch_hazard;
        
        // Memory Stall: Needs freeze of all stages
        mem_stall = inst_mem_wait || data_mem_wait;
        
        // A mispredict signal from EX stage requires a full flush ONLY if it was for a JAL/JALR.
        // B-type branches are resolved in ID and don't cause a mispredict signal from EX.
        mispredict_is_jalr = branch_mispredict && !ex_is_branch;
        
        // The flush priority is: JAL/JALR Mispredict > ID stage branch
        // Note: Stalls do not generate flush masks anymore. They are handled by register control logic.
        if (mispredict_is_jalr) begin
            flush_mask = 5'b00011;
        end else if (branch_redirect_id && !hazard_stall) begin // 在有hazard_stall时，branch_redirect_id有可能是误判，不应采用。
            flush_mask = 5'b00001; 
        end else begin
            // No hazard, no flush.
            flush_mask = 5'b00000;
        end
    end

endmodule
