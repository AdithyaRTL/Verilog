`timescale 1ns / 1ps

module Xor_gate_tb;

    reg  a, b;
    wire c;

    // Instantiate Unit Under Test (UUT)
    Xor_gate uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        $dumpfile("Xor_gate_tb.vcd");
        $dumpvars(0, Xor_gate_tb);

        $monitor("Time = %0t | a = %b, b = %b -> c = %b", $time, a, b, c);

        // Test Truth Table
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
