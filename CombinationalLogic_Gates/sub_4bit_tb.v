`timescale 1ns / 1ps

module sub_4bit_tb;

    // 1. Testbench Signals
    reg  [3:0] a;
    reg  [3:0] b;
    reg        bin;

    wire [3:0] diff;
    wire       bout;

    // 2. Instantiate Unit Under Test (UUT)
    sub_4bit uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .bout(bout)
    );

    // 3. Test Script
    initial begin
        // Waveform generation for GTKWave
        $dumpfile("sub_4bit.vcd");
        $dumpvars(0, sub_4bit_tb);

        // Terminal output monitoring
        $monitor("Time=%0t | A=%d (%b) | B=%d (%b) | Bin=%b || Diff=%d (%b) | Bout=%b", 
                 $time, a, a, b, b, bin, diff, diff, bout);

        // --- Test 1: Standard Subtraction (10 - 5, Bin = 0) ---
        a = 4'd10; b = 4'd5; bin = 1'b0; #10;

        // --- Test 2: Subtraction with Borrow In (10 - 5 - 1 = 4) ---
        a = 4'd10; b = 4'd5; bin = 1'b1; #10;

        // --- Test 3: Subtraction with Borrow Out (5 - 10, Bin = 0) ---
        // Expected: Diff = 11 (2's complement of -5 in 4-bit), Bout = 1
        a = 4'd5; b = 4'd10; bin = 1'b0; #10;

        // --- Test 4: Equal Numbers (12 - 12, Bin = 0) ---
        a = 4'd12; b = 4'd12; bin = 1'b0; #10;

        // --- Test 5: Maximum Range (15 - 0, Bin = 0) ---
        a = 4'd15; b = 4'd0; bin = 1'b0; #10;

        // --- Test 6: Zero Minus Max with Borrow In (0 - 15 - 1) ---
        a = 4'd0; b = 4'd15; bin = 1'b1; #10;

        $finish; // End simulation
    end

endmodule
