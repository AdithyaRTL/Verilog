`timescale 1ns / 1ps

module Xnor_gate_tb;

    reg  a, b;
    wire c;

    // Instantiate Unit Under Test (UUT)
    Xnor_gate uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        $dumpfile("Xnor_gate_tb.vcd");
        $dumpvars(0, Xnor_gate_tb);

        $monitor("Time = %0t | a = %b, b = %b -> c = %b", $time, a, b, c);

        // Test Truth Table
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
