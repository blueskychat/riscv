`timescale 1ns / 1ps
// testbench.sv - 简单测试平台
module testbench; 
    wire clk_50M, clk_11M0592;
    reg push_btn; 
    reg reset_btn;

   
    // SRAM接口
    logic [19:0] base_ram_addr;
    logic        base_ram_ce_n;
    logic        base_ram_oe_n;
    logic        base_ram_we_n;
    logic [3:0]  base_ram_be_n;
    wire  [31:0] base_ram_data;
    
    logic [19:0] ext_ram_addr;
    logic        ext_ram_ce_n;
    logic        ext_ram_oe_n;
    logic        ext_ram_we_n;
    logic [3:0]  ext_ram_be_n;
    wire  [31:0] ext_ram_data;
    
    // UART接口
    wire rxd;
    logic txd;
    // Windows 需要注意路径分隔符的转义，例如 "D:\\foo\\bar.bin"
    parameter BASE_RAM_INIT_FILE = "rbl.img"; //"kernel.bin"; // BaseRAM 初始化文件，请修改为实际的绝对路径
    parameter EXT_RAM_INIT_FILE = "ucore.img";//"extram.bin";  // ExtRAM 初始化文件，请修改为实际的绝对路径

    // CPU实例
    riscv_cpu_top dut (
        .clk_50M(clk_50M),
        .clk_11M0592(clk_11M0592),
        .push_btn(push_btn),
        .reset_btn(reset_btn),
        .base_ram_addr(base_ram_addr),
        .base_ram_ce_n(base_ram_ce_n),
        .base_ram_oe_n(base_ram_oe_n),
        .base_ram_we_n(base_ram_we_n),
        .base_ram_be_n(base_ram_be_n),
        .base_ram_data(base_ram_data),
        .ext_ram_addr(ext_ram_addr),
        .ext_ram_ce_n(ext_ram_ce_n),
        .ext_ram_oe_n(ext_ram_oe_n),
        .ext_ram_we_n(ext_ram_we_n),
        .ext_ram_be_n(ext_ram_be_n),
        .ext_ram_data(ext_ram_data),
        .rxd(rxd),
        .txd(txd)
    );
    
    // 时钟源
    clock osc (
        .clk_11M0592(clk_11M0592),
        .clk_50M    (clk_50M)
    );                       
    
    // 直连串口仿真模型
    uart_model uart (
        .rxd (txd), // CPU TXD -> Model RXD
        .txd (rxd)  // Model TXD -> CPU RXD
    );
    // BaseRAM 仿真模型
    sram_model base1 (
        .DataIO(base_ram_data[15:0]),
        .Address(base_ram_addr[19:0]),
        .OE_n(base_ram_oe_n),
        .CE_n(base_ram_ce_n),
        .WE_n(base_ram_we_n),
        .LB_n(base_ram_be_n[0]),
        .UB_n(base_ram_be_n[1])
    );
    sram_model base2 (
        .DataIO(base_ram_data[31:16]),
        .Address(base_ram_addr[19:0]),
        .OE_n(base_ram_oe_n),
        .CE_n(base_ram_ce_n),
        .WE_n(base_ram_we_n),
        .LB_n(base_ram_be_n[2]),
        .UB_n(base_ram_be_n[3])
    );
    // ExtRAM 仿真模型
    sram_model ext1 (
        .DataIO(ext_ram_data[15:0]),
        .Address(ext_ram_addr[19:0]),
        .OE_n(ext_ram_oe_n),
        .CE_n(ext_ram_ce_n),
        .WE_n(ext_ram_we_n),
        .LB_n(ext_ram_be_n[0]),
        .UB_n(ext_ram_be_n[1])
    );
    sram_model ext2 (
        .DataIO(ext_ram_data[31:16]),
        .Address(ext_ram_addr[19:0]),
        .OE_n(ext_ram_oe_n),
        .CE_n(ext_ram_ce_n),
        .WE_n(ext_ram_we_n),
        .LB_n(ext_ram_be_n[2]),
        .UB_n(ext_ram_be_n[3])
    );

    // 从文件加载 BaseRAM
    initial begin
        reg [31:0] tmp_array[0:1048575];
        integer n_File_ID, n_Init_Size;
        n_File_ID = $fopen(BASE_RAM_INIT_FILE, "rb");
        if (!n_File_ID) begin
        n_Init_Size = 0;
        $display("Failed to open BaseRAM init file");
        end else begin
        n_Init_Size = $fread(tmp_array, n_File_ID);
        n_Init_Size /= 4;
        $fclose(n_File_ID);
        end
        $display("BaseRAM Init Size(words): %d", n_Init_Size);
        for (integer i = 0; i < n_Init_Size; i++) begin
        base1.mem_array0[i] = tmp_array[i][24+:8];
        base1.mem_array1[i] = tmp_array[i][16+:8];
        base2.mem_array0[i] = tmp_array[i][8+:8];
        base2.mem_array1[i] = tmp_array[i][0+:8];
        end
    end

    // 从文件加载 ExtRAM
    initial begin
        reg [31:0] tmp_array[0:1048575];
        integer n_File_ID, n_Init_Size;
        n_File_ID = $fopen(EXT_RAM_INIT_FILE, "rb");
        if (!n_File_ID) begin
        n_Init_Size = 0;
        $display("Failed to open ExtRAM init file");
        end else begin
        n_Init_Size = $fread(tmp_array, n_File_ID);
        n_Init_Size /= 4;
        $fclose(n_File_ID);
        end
        $display("ExtRAM Init Size(words): %d", n_Init_Size);
        for (integer i = 0; i < n_Init_Size; i++) begin
        ext1.mem_array0[i] = tmp_array[i][24+:8];
        ext1.mem_array1[i] = tmp_array[i][16+:8];
        ext2.mem_array0[i] = tmp_array[i][8+:8];
        ext2.mem_array1[i] = tmp_array[i][0+:8];
        end
    end

    // ============================================================================
    // Task: 将32位数据按小端序写入SRAM
    // ============================================================================
    task write_sram_word(
        input int addr_idx,        // 地址索引
        input [31:0] data          // 32位数据
    );
        
        base1.mem_array0[addr_idx] = data[0+:8];
        base1.mem_array1[addr_idx] = data[8+:8];
        base2.mem_array0[addr_idx] = data[16+:8];
        base2.mem_array1[addr_idx] = data[24+:8];
    endtask
    // ============================================================================
    // Task: 从SRAM读取某个地址的字节值
    // ============================================================================
    task read_sram_byte(
        input int addr_idx,        // 字地址索引
        input int byte_offset,     // 字节偏移 (0-3)
        output logic [7:0] data    // 读取的字节数据
    );
        // 根据字节偏移选择对应的存储位置
        // byte_offset 0: 最低字节
        // byte_offset 1: 次低字节
        // byte_offset 2: 次高字节
        // byte_offset 3: 最高字节
        case(byte_offset)
            0: data = base1.mem_array0[addr_idx];
            1: data = base1.mem_array1[addr_idx];
            2: data = base2.mem_array0[addr_idx];
            3: data = base2.mem_array1[addr_idx];
            default: data = 8'h00;
        endcase
    endtask
    // ============================================================================
    // Task: 从SRAM读取某个地址的字 (32-bit Word)
    // ============================================================================
    task read_sram_word(
        input int addr_idx,        // 字地址索引
        output logic [31:0] data   // 读取的字数据
    );
        // 将4个字节拼接成32位数据
        // 顺序: {Byte3, Byte2, Byte1, Byte0}
        data = {
            base2.mem_array1[addr_idx], // [31:24] 最高字节
            base2.mem_array0[addr_idx], // [23:16] 次高字节
            base1.mem_array1[addr_idx], // [15:8]  次低字节
            base1.mem_array0[addr_idx]  // [7:0]   最低字节
        };
    endtask
    // ============================================================================
    // 初始化程序代码
    // ============================================================================
    initial begin
        // ========================================================================
        // -- UART Echo Test Program
        // ========================================================================
        // Base Address: 0x80000000
        // UART Base:    0x10000000

/*
        write_sram_word(0, 32'h100002b7);  // lui t0, 0x10000
        write_sram_word(1, 32'h00028293);  // addi t0, t0, 0
        // wait_rx:
        write_sram_word(2, 32'h00528303);  // lb t1, 5(t0)
        write_sram_word(3, 32'h02037313);  // andi t1, t1, 0x20
        write_sram_word(4, 32'hfe030ce3);  // beq t1, zero, -8 (wait_rx)

        write_sram_word(5, 32'h06400513);  // add a0,zero,'d'
        write_sram_word(6, 32'h00a28023);  // sb a0, 0(t0)
        write_sram_word(7, 32'h00000013);  // nop, add x0, x0, 0
        write_sram_word(8, 32'h00000013);  // nop, add x0, x0, 0

        write_sram_word(9, 32'h00c0006f); // jal zero, +12 (jump to 0x80000030)

        write_sram_word(10, 32'h00000013);  // nop, add x0, x0, 0
        write_sram_word(11, 32'h06400513);  // add a0,zero,'d'

        // ========================================================================
        // -- B-type Instruction Test Program (SRAM Test)
        // -- 验证在ID阶段进行分支判断的修改是否生效
        // -- 预期结果: 内存地址 0x80300000 的值应为 4
        // ========================================================================
        
        // PC: 0x80000030 (idx 12): addi x1, x0, 10
        write_sram_word(12, 32'h00A00093);
        
        // PC: 0x80000034 (idx 13): addi x2, x0, 10
        write_sram_word(13, 32'h00A00113);
        
        // PC: 0x80000038 (idx 14): addi x3, x0, 20
        write_sram_word(14, 32'h01400193);
        
        // PC: 0x8000003C (idx 15): beq x1, x2, +8 (jump to idx 17). Should be taken.
        write_sram_word(15, 32'h00208463);
        
        // PC: 0x80000040 (idx 16): addi x4, x0, 1. Should be flushed.
        write_sram_word(16, 32'h00100213);
        
        // PC: 0x80000044 (idx 17): taken_beq: addi x4, x0, 2. x4 should be 2.
        write_sram_word(17, 32'h00200213);
        
        // PC: 0x80000048 (idx 18): bne x1, x3, +12 (jump to idx 21). Should be taken.
        write_sram_word(18, 32'h00309663);
        
        // PC: 0x8000004C (idx 19): addi x5, x0, 1. Should be flushed.
        write_sram_word(19, 32'h00100293);
        
        // PC: 0x80000050 (idx 20): fail: jal x0, 8 (loop here if branch failed)
        write_sram_word(20, 32'h0080006F);
        
        // PC: 0x80000054 (idx 21): taken_bne: addi x5, x0, 2. x5 should be 2.
        write_sram_word(21, 32'h00200293);
        
        // PC: 0x80000058 (idx 22): add x6, x4, x5. x6 should be 2+2=4.
        write_sram_word(22, 32'h00520333);
        
        // PC: 0x8000005C (idx 23): lui x7, 0x80300
        write_sram_word(23, 32'h803003B7);
        
        // PC: 0x80000060 (idx 24): sw x6, 0(x7). Store result to 0x80300000
        write_sram_word(24, 32'h0063A023);
        
        // PC: 0x80000064 (idx 25): jal x0, 0 (loop forever)
        write_sram_word(25, 32'h0000006F);
*/
  /*
          // PC: 0x80000030 (idx 12): addi x1, x0, 10
        write_sram_word(1, 32'h00000013);
        write_sram_word(2, 32'h00A00093);
        
        // PC: 0x80000034 (idx 13): addi x2, x0, 10
        write_sram_word(3, 32'h00A00113);
        
        // PC: 0x80000038 (idx 14): addi x3, x0, 20
        write_sram_word(4, 32'h01400193);
        
        // PC: 0x8000003C (idx 15): beq x1, x2, +8 (jump to idx 17). Should be taken.
        write_sram_word(5, 32'h00208463);
        
        // PC: 0x80000040 (idx 16): addi x4, x0, 1. Should be flushed.
        write_sram_word(6, 32'h00100213);
        
        // PC: 0x80000044 (idx 17): taken_beq: addi x4, x0, 2. x4 should be 2.
        write_sram_word(7, 32'h00200213);
        
        // PC: 0x80000048 (idx 18): bne x1, x3, +12 (jump to idx 21). Should be taken.
        write_sram_word(8, 32'h00309663);
        
        // PC: 0x8000004C (idx 19): addi x5, x0, 1. Should be flushed.
        write_sram_word(9, 32'h00100293);
        
        // PC: 0x80000050 (idx 20): fail: jal x0, 8 (loop here if branch failed)
        write_sram_word(10, 32'h0080006F);
        
        // PC: 0x80000054 (idx 21): taken_bne: addi x5, x0, 2. x5 should be 2.
        write_sram_word(11, 32'h00200293);
        
        // PC: 0x80000058 (idx 22): add x6, x4, x5. x6 should be 2+2=4.
        write_sram_word(12, 32'h00520333);
        
        // PC: 0x8000005C (idx 23): lui x7, 0x80300
        write_sram_word(13, 32'h803003B7);
        
        // PC: 0x80000060 (idx 24): sw x6, 0(x7). Store result to 0x80300000
        write_sram_word(14, 32'h0063A023);
        write_sram_word(15, 32'h00520333);
        write_sram_word(16, 32'h00520333);
        write_sram_word(17, 32'h00520333);
        write_sram_word(18, 32'h00520333);
        write_sram_word(19, 32'h00520333);
        // PC: 0x80000064 (idx 25): jal x0, 0 (loop forever)
        write_sram_word(20, 32'h0000006F);
*/
        $display("SRAM initialization completed.");
        
    end
        // 测试序列
    initial begin
        int byte_cnt;
        logic [31:0] word_addr;
        logic [7:0] byte_data;
        logic [31:0] word_data;
        integer i,j;
        /*
        #10000;
        byte_cnt=0;
        for (logic [31:0] word_addr = 32'h0 >> 2; word_addr < (32'h0 >> 2) + 10; word_addr++) begin
            read_sram_word(word_addr, word_data);
            $display("Word %2d  ->  address 0x%08x  data 0x%08h",
                     byte_cnt++, (word_addr << 2), word_data);
        end
        #10000
        */
        // 初始化
        #100;
        reset_btn = 1;
        #100;
        reset_btn = 0;        
        /*
        for (i = 0; i < 10; i = i + 1) begin
            #1000;
            uart.pc_send_byte(8'h30 + i);
        end

        // 运行足够长的时间以完成测试和UART输出
        #40000;
        */
        #2000;
        //uart.pc_send_byte(8'h72);
        #1000000;
       /* 
        // 检查结果
        $display("\n--- Test Result ---");
        //读取地址0x300000的字节
        word_addr = 32'h300000>>2;
        read_sram_byte(word_addr, 0, byte_data);
        if (byte_data == 4) begin
            $display("MEMORY TEST: PASSED (Result = %d)", byte_data);
        end else begin
            $display("MEMORY TEST: FAILED (Expected 4, but Result = %d)", byte_data);
        end
        */
        #10000;
        /*
        byte_cnt=0;
        for (logic [31:0] word_addr = 32'h100 >> 2; word_addr < (32'h100 >> 2) + 1; word_addr++) begin
            read_sram_word(word_addr, word_data);
            $display("Word %2d  ->  address 0x%08x  data 0x%08h",
                     byte_cnt++, (word_addr << 2), word_data);
        end
        */
        #500000000   // Reduced timeout for faster testing

        $finish;
    end
    
    // ============================================================================
    // Magic Address Monitoring for Test Results
    // ============================================================================
    // Monitor writes to magic addresses:
    // - 0x80300000: Test output marker
    // - 0x80100000: Halt signal (write 1 to halt simulation)
    
    // Watch for writes to output address (0x80300000 = BaseRAM offset 0x300000)
    // BaseRAM address 0x300000 >> 2 = 0xC0000 (word index)
    always @(posedge clk_50M) begin
        // Monitor writes to BaseRAM for magic addresses
        if (!base_ram_we_n && !base_ram_ce_n) begin
            // 0x80300000 maps to BaseRAM address 0x300000, word index = 0xC0000
            if (base_ram_addr == 20'hC0000) begin
                $display("[%0t] MAGIC OUTPUT @ 0x80300000: 0x%08h", $time, base_ram_data);
                
                // Check for special markers
                if (base_ram_data == 32'hAAAAAAAA) begin
                    $display("[%0t] *** TEST PASSED ***", $time);
                    #100;
                    $finish;
                end
                if (base_ram_data == 32'hDEAD0000) begin
                    $display("[%0t] *** TEST FAILED ***", $time);
                    #100;
                    $finish;
                end
            end
            
            // 0x80100000 maps to BaseRAM address 0x100000, word index = 0x40000
            if (base_ram_addr == 20'h40000) begin
                $display("[%0t] HALT SIGNAL @ 0x80100000: 0x%08h", $time, base_ram_data);
                if (base_ram_data == 32'h00000001) begin
                    $display("[%0t] Simulation halted by CPU", $time);
                    #100;
                    $finish;
                end
            end
        end
    end
    
    // 波形输出
    

    // ============================================================================
    // Debug Monitoring: Trap Handler Entry and PC Loop Detection
    // ============================================================================
    // Monitor:
    // 1. Every trap entry (trap_enter signal)
    // 2. scause/trap_cause value
    // 3. PC entering __alltraps (0x80401694)
    // 4. Detect stuck loop between schedule (0x8040e074) and __alltraps
    
    // Access internal CPU signals via hierarchical path
    // dut is the riscv_cpu_top instance
    
    // Counter for detecting stuck loops
    integer trap_count = 0;
    logic [31:0] last_trap_cause = 32'h0;
    integer same_trap_count = 0;
    
    // Monitor trap_enter signal
    always @(posedge clk_50M) begin
        if (dut.trap_enter) begin
            trap_count = trap_count + 1;
            
            // Only print non-ecall traps to reduce noise (ecalls are normal SBI output)
            // cause 0x8 = ecall from U-mode, 0x9 = ecall from S-mode
            if (dut.trap_cause != 32'h00000008 && dut.trap_cause != 32'h00000009) begin
                $display("[%0t] TRAP ENTER #%0d: cause=0x%08h pc=0x%08h val=0x%08h priv=%0d to_s=%0d sscratch=0x%08h",
                         $time, trap_count, 
                         dut.trap_cause, 
                         dut.trap_pc, 
                         dut.trap_val,
                         dut.priv_mode,
                         dut.trap_to_s,
                         dut.u_csr.sscratch);  // Show sscratch value!
            end
            
            // Track if same trap is repeating (indicates stuck loop)
            // IGNORE ecalls (0x8, 0x9) since they are normal SBI console output
            if (dut.trap_cause != 32'h00000008 && dut.trap_cause != 32'h00000009) begin
                if (dut.trap_cause == last_trap_cause) begin
                    same_trap_count = same_trap_count + 1;
                    if (same_trap_count >= 5) begin
                        $display("[%0t] WARNING: Same trap cause 0x%08h repeated %0d times!",
                                 $time, dut.trap_cause, same_trap_count);
                    end
                    // Stop on repeated timer interrupts or other traps (not ecalls)
                    if (same_trap_count >= 20) begin
                        $display("[%0t] ERROR: Trap loop detected! Stopping simulation.", $time);
                        $display("       Trap cause: 0x%08h", dut.trap_cause);
                        $display("       Trap PC:    0x%08h", dut.trap_pc);
                        $display("       Priv mode:  %0d", dut.priv_mode);
                        $finish;
                    end
                end else begin
                    same_trap_count = 0;
                    last_trap_cause = dut.trap_cause;
                end
            end
        end
    end
    
    // Monitor PC entering __alltraps (0x80401694)
    always @(posedge clk_50M) begin
        if (dut.pc == 32'h80401694) begin
            $display("[%0t] PC at __alltraps entry, scause pending...", $time);
        end
    end
    
    // Monitor timer interrupt signals
    logic timer_int_last = 0;
    always @(posedge clk_50M) begin
        if (dut.timer_interrupt && !timer_int_last) begin
            $display("[%0t] TIMER INTERRUPT asserted: mie_mtie=%0d mstatus_mie=%0d priv=%0d",
                     $time, dut.mie_mtie, dut.mstatus_mie, dut.priv_mode);
        end
        timer_int_last <= dut.timer_interrupt;
    end
    
    // Monitor mret/sret execution - only show non-SBI-handler returns
    integer sret_count = 0;
    always @(posedge clk_50M) begin
        // MRET: only show if NOT returning to SBI ecall handler (0x804008b8)
        if (dut.u_csr.mret_exec && dut.mepc_out != 32'h804008b8) begin
            $display("[%0t] MRET executed: returning to PC=0x%08h, new_priv=%0d",
                     $time, dut.mepc_out, dut.u_csr.mstatus[12:11]);
        end
        if (dut.u_csr.sret_exec) begin
            sret_count = sret_count + 1;
            // Show more detail: sepc, SPP before SRET
            $display("[%0t] SRET #%0d: sepc=0x%08h SPP=%0d -> going to priv=%0d",
                     $time, sret_count, dut.sepc_out, dut.u_csr.sstatus[8], 
                     dut.u_csr.sstatus[8] ? 1 : 0);
        end
    end
    
    // ============================================================================
    // Critical: Monitor privilege mode transitions
    // ============================================================================
    logic [1:0] last_priv = 2'b11;
    integer u_mode_entry_count = 0;
    integer u_mode_ecall_count = 0;
    
    always @(posedge clk_50M) begin
        if (dut.priv_mode != last_priv) begin
            $display("[%0t] PRIVILEGE CHANGE: %0d -> %0d (0=U, 1=S, 3=M) at PC=0x%08h sscratch=0x%08h",
                     $time, last_priv, dut.priv_mode, dut.pc, dut.u_csr.sscratch);
            if (dut.priv_mode == 2'b00) begin
                u_mode_entry_count = u_mode_entry_count + 1;
                $display("[%0t] *** ENTERED USER MODE *** (entry #%0d) sscratch=0x%08h (should be kernel stack!)",
                         $time, u_mode_entry_count, dut.u_csr.sscratch);
            end
            last_priv <= dut.priv_mode;
        end
        
        // Count U-mode ecalls (cause = 0x8)
        if (dut.trap_enter && dut.trap_cause == 32'h00000008) begin
            u_mode_ecall_count = u_mode_ecall_count + 1;
            $display("[%0t] U-MODE ECALL #%0d from PC=0x%08h", $time, u_mode_ecall_count, dut.trap_pc);
        end
    end
    
    // Periodic status report
    integer report_interval = 0;
    always @(posedge clk_50M) begin
        report_interval = report_interval + 1;
        if (report_interval >= 100_000_000) begin  // Every 100M cycles
            report_interval = 0;
            $display("[%0t] STATUS: u_mode_entries=%0d, u_mode_ecalls=%0d, sret_count=%0d, priv=%0d",
                     $time, u_mode_entry_count, u_mode_ecall_count, sret_count, dut.priv_mode);
        end
    end
    
    /*
    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, testbench);
		#50000
		$finish;
    end
    */

endmodule
