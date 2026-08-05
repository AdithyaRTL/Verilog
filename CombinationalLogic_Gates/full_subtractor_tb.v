`timescale 1ns / 1ps

module Full_subtractor_tb;

    reg  a, b, bin;
    wire diff, bout;

    // Instantiate Unit Under Test (UUT)
    Full_subtractor uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .bout(bout)
    );

    initial begin
        $dumpfile("Full_subtractor_tb.vcd");
        $dumpvars(0, Full_subtractor_tb);

        $monitor("Time = %0t | a = %b, b = %b, bin = %b -> diff = %b, bout = %b", $time, a, b, bin, diff, bout);

        // Test Truth Table (All 8 Combinations)
        a = 0; b = 0; bin = 0; #10;
        a = 0; b = 0; bin = 1; #10;
        a = 0; b = 1; bin = 0; #10;
        a = 0; b = 1; bin = 1; #10;
        a = 1; b = 0; bin = 0; #10;
        a = 1; b = 0; bin = 1; #10;
        a = 1; b = 1; bin = 0; #10;
        a = 1; b = 1; bin = 1; #10;

        $finish;
    end

endmodule
