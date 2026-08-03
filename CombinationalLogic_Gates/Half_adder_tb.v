`timescale 1ns / 1ps

module Half_adder_tb;

    reg  a, b;
    wire sum, carry;

    // Instantiate Unit Under Test (UUT)
    Half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("Half_adder_tb.vcd");
        $dumpvars(0, Half_adder_tb);

        $monitor("Time = %0t | a = %b, b = %b -> sum = %b, carry = %b", $time, a, b, sum, carry);

        // Test Truth Table (4 Combinations)
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
