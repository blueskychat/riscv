`timescale 1ns / 1ps
`include "defines.sv"

// tlb_tb.sv - TLB Standalone Testbench focusing on SFENCE.VMA functionality
module tlb_tb;

    // Clock and Reset
    logic clk;
    logic rst;
    
    // Lookup interface
    logic [31:0] vaddr;
    logic        lookup_req;
    logic        hit;
    logic [31:0] paddr;
    logic [6:0]  perm;
    logic        is_superpage;
    
    // Fill interface
    logic        fill_req;
    logic [19:0] fill_vpn;
    logic [21:0] fill_ppn;
    logic [6:0]  fill_perm;
    logic        fill_superpage;
    
    // SFENCE.VMA interface
    logic        flush_all;
    logic        flush_vpn;
    logic [19:0] flush_vpn_addr;
    
    // Test counters
    integer tests_passed;
    integer tests_failed;
    
    // ==================== TLB Instantiation ====================
    tlb #(
        .ENTRIES(32)
    ) dut (
        .clk(clk),
        .rst(rst),
        .vaddr_i(vaddr),
        .lookup_req_i(lookup_req),
        .hit_o(hit),
        .paddr_o(paddr),
        .perm_o(perm),
        .is_superpage_o(is_superpage),
        .fill_req_i(fill_req),
        .fill_vpn_i(fill_vpn),
        .fill_ppn_i(fill_ppn),
        .fill_perm_i(fill_perm),
        .fill_superpage_i(fill_superpage),
        .flush_all_i(flush_all),
        .flush_vpn_i(flush_vpn),
        .flush_vpn_addr_i(flush_vpn_addr)
    );
    
    // ==================== Clock Generation ====================
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end
    
    // ==================== Helper Tasks ====================
    
    // Fill a TLB entry
    task fill_entry(
        input [19:0] vpn,
        input [21:0] ppn,
        input [6:0]  permissions,
        input        superpage
    );
        @(posedge clk);
        fill_req = 1'b1;
        fill_vpn = vpn;
        fill_ppn = ppn;
        fill_perm = permissions;
        fill_superpage = superpage;
        @(posedge clk);
        fill_req = 1'b0;
    endtask
    
    // Lookup and check result
    task check_lookup(
        input [31:0] va,
        input        expect_hit,
        input [31:0] expect_pa,
        input string test_name
    );
        @(posedge clk);
        vaddr = va;
        lookup_req = 1'b1;
        @(posedge clk);
        lookup_req = 1'b0;
        
        // Check result (combinational output)
        @(negedge clk); // Check at stable point
        if (hit == expect_hit) begin
            if (expect_hit && paddr == expect_pa) begin
                $display("[PASS] %s: VA=0x%08x -> PA=0x%08x (hit)", test_name, va, paddr);
                tests_passed++;
            end else if (!expect_hit) begin
                $display("[PASS] %s: VA=0x%08x (miss expected)", test_name, va);
                tests_passed++;
            end else begin
                $display("[FAIL] %s: VA=0x%08x expected PA=0x%08x, got PA=0x%08x", 
                         test_name, va, expect_pa, paddr);
                tests_failed++;
            end
        end else begin
            $display("[FAIL] %s: VA=0x%08x expected %s, got %s", 
                     test_name, va, expect_hit ? "hit" : "miss", hit ? "hit" : "miss");
            tests_failed++;
        end
    endtask
    
    // ==================== Test Sequence ====================
    initial begin
        // Initialize
        tests_passed = 0;
        tests_failed = 0;
        rst = 1;
        vaddr = 32'h0;
        lookup_req = 0;
        fill_req = 0;
        fill_vpn = 20'h0;
        fill_ppn = 22'h0;
        fill_perm = 7'h0;
        fill_superpage = 0;
        flush_all = 0;
        flush_vpn = 0;
        flush_vpn_addr = 20'h0;
        
        // Reset
        #20;
        rst = 0;
        #20;
        
        $display("\n========================================");
        $display("TLB SFENCE.VMA Testbench Started");
        $display("========================================\n");
        
        // ========== TEST 1: Basic TLB Fill and Lookup ==========
        $display("\n--- Test 1: Basic TLB Fill and Lookup ---");
        
        // Fill entry: VPN 0x12345, PPN 0x80100, permissions 0x7F (all set)
        fill_entry(20'h12345, 22'h80100, 7'h7F, 1'b0);
        
        // Lookup should hit
        check_lookup(32'h12345ABC, 1'b1, 32'h80100ABC, "Basic lookup");
        
        // ========== TEST 2: Multiple Entries ==========
        $display("\n--- Test 2: Multiple TLB Entries ---");
        
        // Fill more entries
        fill_entry(20'h00001, 22'h80200, 7'h7F, 1'b0);  // VPN 0x00001
        fill_entry(20'h00002, 22'h80300, 7'h7F, 1'b0);  // VPN 0x00002
        fill_entry(20'h00003, 22'h80400, 7'h7F, 1'b0);  // VPN 0x00003
        
        // Lookup each
        check_lookup(32'h00001000, 1'b1, 32'h80200000, "Entry 1");
        check_lookup(32'h00002DEF, 1'b1, 32'h80300DEF, "Entry 2");
        check_lookup(32'h00003456, 1'b1, 32'h80400456, "Entry 3");
        
        // ========== TEST 3: SFENCE.VMA Flush All ==========
        $display("\n--- Test 3: SFENCE.VMA Flush All ---");
        
        // Flush all entries
        @(posedge clk);
        flush_all = 1'b1;
        @(posedge clk);
        flush_all = 1'b0;
        @(posedge clk);
        
        // All lookups should now miss
        check_lookup(32'h12345ABC, 1'b0, 32'h0, "After flush_all - entry 0");
        check_lookup(32'h00001000, 1'b0, 32'h0, "After flush_all - entry 1");
        check_lookup(32'h00002DEF, 1'b0, 32'h0, "After flush_all - entry 2");
        check_lookup(32'h00003456, 1'b0, 32'h0, "After flush_all - entry 3");
        
        // ========== TEST 4: Refill After Flush ==========
        $display("\n--- Test 4: Refill After Flush ---");
        
        // Refill entries
        fill_entry(20'hAAAAA, 22'h90000, 7'h7F, 1'b0);
        fill_entry(20'hBBBBB, 22'h90100, 7'h7F, 1'b0);
        
        // Should hit again
        check_lookup(32'hAAAAA123, 1'b1, 32'h90000123, "Refilled entry A");
        check_lookup(32'hBBBBB456, 1'b1, 32'h90100456, "Refilled entry B");
        
        // ========== TEST 5: SFENCE.VMA Selective Flush (flush_vpn) ==========
        $display("\n--- Test 5: SFENCE.VMA Selective Flush ---");
        
        // Flush only entry with VPN 0xAAAAA
        @(posedge clk);
        flush_vpn = 1'b1;
        flush_vpn_addr = 20'hAAAAA;
        @(posedge clk);
        flush_vpn = 1'b0;
        @(posedge clk);
        
        // Entry A should miss, entry B should still hit
        check_lookup(32'hAAAAA123, 1'b0, 32'h0, "Flushed entry A");
        check_lookup(32'hBBBBB456, 1'b1, 32'h90100456, "Untouched entry B");
        
        // ========== TEST 6: Superpage TLB Entry ==========
        $display("\n--- Test 6: Superpage Entry ---");
        
        // Clear all first
        @(posedge clk);
        flush_all = 1'b1;
        @(posedge clk);
        flush_all = 1'b0;
        @(posedge clk);
        
        // Fill superpage entry for VA 0x80000000 (4MB region)
        // VA 0x80000000: VPN[1]=0x200 (bits 31:22), VPN[0] varies
        // For superpage: PA = {PPN[21:10], VPN[0], offset}
        // We want PA base = 0x90000000, so PPN[21:10] = 0x240 (0x90000 >> 10)
        // fill_vpn[19:10] = VPN[1] = 0x200
        fill_entry(20'h80000, 22'h90000, 7'h7F, 1'b1);  // VPN[1]=0x200, PPN=0x90000
        
        // Multiple addresses in same 4MB superpage should hit
        // PA = {PPN[21:10], VPN[0], offset} = {0x240, vaddr[21:12], vaddr[11:0]}
        // For VA 0x80000000: VPN[0]=0x000, offset=0x000 -> PA = 0x90000000
        // For VA 0x80001000: VPN[0]=0x001, offset=0x000 -> PA = 0x90001000  
        check_lookup(32'h80000000, 1'b1, 32'h90000000, "Superpage base");
        check_lookup(32'h80001000, 1'b1, 32'h90001000, "Superpage +0x1000");
        check_lookup(32'h801FF456, 1'b1, 32'h901FF456, "Superpage middle");
        
        // Different VPN[1] should miss
        check_lookup(32'h84000000, 1'b0, 32'h0, "Different VPN[1]");
        
        // ========== TEST 7: Superpage Flush ==========
        $display("\n--- Test 7: Superpage Selective Flush ---");
        
        // Add a regular page entry
        fill_entry(20'h00010, 22'h80500, 7'h7F, 1'b0);
        
        // Flush superpage (VPN[1]=0x200, so flush_vpn_addr[19:10]=0x200)
        @(posedge clk);
        flush_vpn = 1'b1;
        flush_vpn_addr = 20'h80000;  // VPN of superpage
        @(posedge clk);
        flush_vpn = 1'b0;
        @(posedge clk);
        
        // Superpage should be flushed
        check_lookup(32'h80000000, 1'b0, 32'h0, "Flushed superpage");
        // Regular page should remain
        check_lookup(32'h00010789, 1'b1, 32'h80500789, "Untouched regular page");
        
        // ========== TEST 8: Edge Case - Flush Non-existent VPN ==========
        $display("\n--- Test 8: Flush Non-existent VPN ---");
        
        // Flush a VPN that doesn't exist - should be no-op
        @(posedge clk);
        flush_vpn = 1'b1;
        flush_vpn_addr = 20'hFFFFF;  // Non-existent VPN
        @(posedge clk);
        flush_vpn = 1'b0;
        @(posedge clk);
        
        // Existing entry should still hit
        check_lookup(32'h00010789, 1'b1, 32'h80500789, "Existing entry after no-op flush");
        
        // ========== Summary ==========
        #100;
        $display("\n========================================");
        $display("TLB SFENCE.VMA Testbench Completed");
        $display("Passed: %0d, Failed: %0d", tests_passed, tests_failed);
        $display("========================================\n");
        
        if (tests_failed == 0) begin
            $display("ALL TESTS PASSED!");
        end else begin
            $display("SOME TESTS FAILED!");
        end
        
        $finish;
    end
    
    // Timeout watchdog
    initial begin
        #50000;
        $display("\n[ERROR] Testbench timeout!");
        $finish;
    end

endmodule
