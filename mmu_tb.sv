`timescale 1ns / 1ps
`include "defines.sv"

// mmu_tb.sv - MMU and TLB Standalone Testbench
module mmu_tb;

    // Clock and Reset
    logic clk;
    logic rst;
    
    // SATP and Control
    logic [31:0] satp;
    logic        paging_enabled;
    logic [1:0]  priv_mode;
    
    // Translation Request
    logic [31:0] vaddr;
    logic        translate_req;
    logic        is_write;
    logic        is_execute;
    
    // Translation Response
    logic [31:0] paddr;
    logic        translate_done;
    logic        page_fault;
    logic [3:0]  fault_type;
    
    // PTW Memory Interface (simulated)
    logic [31:0] ptw_addr;
    logic        ptw_req;
    logic [31:0] ptw_data;
    logic        ptw_ack;
    
    // SFENCE.VMA
    logic        flush_all;
    logic        flush_vpn;
    logic [19:0] flush_vpn_addr;
    
    // ==================== MMU Instantiation ====================
    mmu dut (
        .clk(clk),
        .rst(rst),
        .satp(satp),
        .paging_enabled(paging_enabled),
        .priv_mode(priv_mode),
        .vaddr(vaddr),
        .translate_req(translate_req),
        .is_write(is_write),
        .is_execute(is_execute),
        .paddr(paddr),
        .translate_done(translate_done),
        .page_fault(page_fault),
        .fault_type(fault_type),
        .ptw_addr(ptw_addr),
        .ptw_req(ptw_req),
        .ptw_data(ptw_data),
        .ptw_ack(ptw_ack),
        .flush_all(flush_all),
        .flush_vpn(flush_vpn),
        .flush_vpn_addr(flush_vpn_addr)
    );
    
    // ==================== Clock Generation ====================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end
    
    // ==================== Page Table Memory Simulation ====================
    // Simulated page table in memory (fixed size for Icarus Verilog)
    // Using simple array indexed by word address offset from 0x80000000
    logic [31:0] page_table_mem [0:1023]; // 4KB of page table space
    
    // PTW Response Logic
    always_ff @(posedge clk) begin
        if (rst) begin
            ptw_ack <= 1'b0;
            ptw_data <= 32'h0;
        end else if (ptw_req) begin
            // Simulate 1-cycle memory access
            ptw_ack <= 1'b1;
            // Map physical address to array index
            // Full page table is 1024 words = 4096 bytes (0x80000000 to 0x80001000)
            if (ptw_addr >= 32'h80000000 && ptw_addr < 32'h80001000) begin
                ptw_data <= page_table_mem[(ptw_addr - 32'h80000000) >> 2];
            end else begin
                ptw_data <= 32'h0; // Invalid PTE
            end
        end else begin
            ptw_ack <= 1'b0;
        end
    end
    
    // ==================== Test Tasks ====================
    
    // Task: Initialize page table
    task setup_page_table();
        integer i;
        // Clear page table
        for (i = 0; i < 1024; i = i + 1) begin
            page_table_mem[i] = 32'h0;
        end
        
        // Setup page table for virtual address 0x00001xxx
        // SATP.PPN = 0x80000 (page table root at physical 0x80000000)
        //
        // Virtual 0x00001ABC breakdown:
        //   VPN[1] = 0 (bits 31:22)
        //   VPN[0] = 1 (bits 21:12)
        //   Offset = 0xABC (bits 11:0)
        
        // Level 1 PTE at index 0 (for VPN[1]=0)
        // Points back to 0x80000000 (same array) for simplicity
        // PPN = 0x80000, V=1, pointer (not leaf)
        page_table_mem[0] = 32'h20000001; // PPN=0x80000, V=1
        
        // Level 2 PTE at index 1 (for VPN[0]=1)
        // When MMU looks up VPN[0]=1, address = 0x80000000 + 1*4 = 0x80000004 -> index 1
        // Maps to physical page 0x80100000
        // PPN = 0x80100, V=1, R=1, W=1, X=1, U=1, A=1, D=1
        page_table_mem[1] = 32'h200400FF;
        
        // Setup superpage: Virtual 0x20001234 -> Physical 0x80001234 (4MB)
        // VA 0x20001234: VPN[1] = bits[31:22] = 0x80 = 128
        // Level 1 PTE at index 128
        // Superpage PTE: PPN = 0x80000, leaf (R|X set), all permissions
        page_table_mem[128] = 32'h200000FF;
        
        $display("[SETUP] Page table initialized");
    endtask
    
    // Task: Request translation and wait for result
    task automatic test_translation(
        input [31:0] va,
        input        write,
        input        execute,
        input [31:0] expected_pa,
        input        expect_fault,
        input string test_name
    );
        integer wait_cycles;
        begin
            vaddr = va;
            is_write = write;
            is_execute = execute;
            translate_req = 1'b1;
            
            @(posedge clk);
            translate_req = 1'b0;
            
            // Wait for translation done (max 20 cycles for PTW)
            wait_cycles = 0;
            while (wait_cycles < 20 && !translate_done) begin
                @(posedge clk);
                wait_cycles = wait_cycles + 1;
            end
            
            if (!translate_done) begin
                $display("[FAIL] %s: Translation timeout", test_name);
            end else if (expect_fault) begin
                if (page_fault) begin
                    $display("[PASS] %s: Page fault detected (type=%0d)", test_name, fault_type);
                end else begin
                    $display("[FAIL] %s: Expected page fault but got paddr=0x%08x", test_name, paddr);
                end
            end else begin
                if (page_fault) begin
                    $display("[FAIL] %s: Unexpected page fault (type=%0d)", test_name, fault_type);
                end else if (paddr === expected_pa) begin
                    $display("[PASS] %s: VA=0x%08x -> PA=0x%08x", test_name, va, paddr);
                end else begin
                    $display("[FAIL] %s: Expected PA=0x%08x, got PA=0x%08x", test_name, expected_pa, paddr);
                end
            end
            
            // Wait a cycle before next test
            @(posedge clk);
        end
    endtask
    
    // ==================== Test Sequence ====================
    initial begin
        // Initialize signals
        rst = 1;
        paging_enabled = 0;
        priv_mode = PRIV_M;
        vaddr = 32'h0;
        translate_req = 0;
        is_write = 0;
        is_execute = 0;
        flush_all = 0;
        flush_vpn = 0;
        flush_vpn_addr = 20'h0;
        
        // SATP: MODE=Sv32 (bit 31=1), PPN=0x80000 (page table at 0x80000000)
        satp = {1'b1, 9'b0, 22'h80000};
        
        // Reset
        #20;
        rst = 0;
        #20;
        
        $display("\n========================================");
        $display("MMU/TLB Testbench Started");
        $display("========================================\n");
        
        setup_page_table();
        
        // ========== TEST 1: Paging Disabled ==========
        $display("\n--- Test 1: Paging Disabled ---");
        paging_enabled = 0;
        test_translation(32'h12345678, 0, 0, 32'h12345678, 0, "Paging Disabled");
        
        // ========== TEST 2: 4KB Page Translation (TLB Miss) ==========
        $display("\n--- Test 2: 4KB Page Translation (Cold TLB) ---");
        paging_enabled = 1;
        priv_mode = PRIV_U;
        // Virtual 0x00001ABC -> Physical 0x80100ABC
        test_translation(32'h00001ABC, 0, 0, 32'h80100ABC, 0, "4KB Page Cold");
        
        // ========== TEST 3: TLB Hit ==========
        $display("\n--- Test 3: TLB Hit (Same Page) ---");
        // Virtual 0x00001DEF -> Physical 0x80100DEF (same page, should hit TLB)
        test_translation(32'h00001DEF, 0, 0, 32'h80100DEF, 0, "4KB Page TLB Hit");
        
        // ========== TEST 4: 4MB Superpage Translation ==========
        $display("\n--- Test 4: 4MB Superpage Translation ---");
        // Flush TLB first to clear stale entries from previous tests
        flush_all = 1;
        @(posedge clk);
        flush_all = 0;
        // Virtual 0x20001234 -> Physical 0x80001234 (superpage, VPN[1]=512)
        test_translation(32'h20001234, 0, 0, 32'h80001234, 0, "4MB Superpage");
        
        // ========== TEST 5: Permission Check - Write to Read-Only ==========
        $display("\n--- Test 5: Permission Checks ---");
        // Setup read-only page VPN[1]=0, VPN[0]=2 -> index 2 in L1, index 258 in L2
        page_table_mem[2] = 32'h20000201; // Level 1 pointer to 0x80000800 (index 512)
        page_table_mem[514] = 32'h200800EB; // V=1, R=1, X=1, U=1, A=1, D=1 (no W)
        
        flush_all = 1;
        @(posedge clk);
        flush_all = 0;
        
        // Virtual 0x00002000, write attempt -> should fault
        test_translation(32'h00002100, 1, 0, 32'h0, 1, "Write to R-X Page");
        
        // ========== TEST 6: A/D Bit Check ==========
        $display("\n--- Test 6: A/D Bit Validation ---");
        // Setup page with A=0, VPN[1]=0, VPN[0]=3 -> index 3 in L1, index 515 in L2
        page_table_mem[3] = 32'h20000301; // Level 1 pointer to 0x80000C00 (index 768)
        page_table_mem[771] = 32'h200C005F; // V=1, R=1, W=1, X=1, U=1, A=0, D=1
        
        flush_all = 1;
        @(posedge clk);
        flush_all = 0;
        
        test_translation(32'h00003000, 0, 0, 32'h0, 1, "Access bit not set");
        
        // ========== TEST 7: SFENCE.VMA ==========
        $display("\n--- Test 7: SFENCE.VMA Flush ---");
        // Access a page to fill TLB
        test_translation(32'h00001500, 0, 0, 32'h80100500, 0, "Before flush");
        
        // Change the page table entry (index 1 for VPN[0]=1)
        page_table_mem[1] = 32'h200800FF; // Change PPN to 0x80200
        
        // Without flush, should still get old translation from TLB
        test_translation(32'h00001600, 0, 0, 32'h80100600, 0, "Stale TLB entry");
        
        // Flush specific VPN
        flush_vpn = 1;
        flush_vpn_addr = 20'h00001; // VPN of 0x00001xxx
        @(posedge clk);
        flush_vpn = 0;
        
        // Now should get new translation
        test_translation(32'h00001700, 0, 0, 32'h80200700, 0, "After TLB flush");
        
        // ========== TEST 8: User Mode Access Control ==========
        $display("\n--- Test 8: User Mode Access Control ---");
        // Setup page with U=0, VPN[1]=0, VPN[0]=4 -> L1 at index 0, L2 at index 4
        // L1 already points to 0x80000000, so L2 PTE goes at index 4
        page_table_mem[4] = 32'h201000EF; // V=1, R=1, W=1, X=1, U=0, A=1, D=1
        
        flush_all = 1;
        @(posedge clk);
        flush_all = 0;
        
        priv_mode = PRIV_U;
        test_translation(32'h00004000, 0, 0, 32'h0, 1, "User access to supervisor page");
        
        // Machine mode should succeed
        priv_mode = PRIV_M;
        test_translation(32'h00004100, 0, 0, 32'h80400100, 0, "Machine access to supervisor page");
        
        // ========== Summary ==========
        #100;
        $display("\n========================================");
        $display("MMU/TLB Testbench Completed");
        $display("========================================\n");
        
        $finish;
    end
    
    // Timeout watchdog
    initial begin
        #100000;
        $display("\n[ERROR] Testbench timeout!");
        $finish;
    end

endmodule
