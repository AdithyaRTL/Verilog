`timescale 1ns / 1ps

module CLA_4bit_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;

    wire [3:0] sum;
    wire       cout;

    // Instantiate Unit Under Test (UUT)
    CLA_4bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("CLA_4bit.vcd");
        $dumpvars(0, CLA_4bit_tb);

        $monitor("Time=%0t | a=%b (%0d) b=%b (%0d) cin=%b | cout=%b sum=%b (%0d)",
                 $time, a, a, b, b, cin, cout, sum, sum);

        // Test 1: 5 + 3 with cin = 0 -> sum = 8, cout = 0
        a = 4'd5; b = 4'd3; cin = 1'b0; #10;

        // Test 2: 5 + 3 with cin = 1 -> sum = 9, cout = 0
        a = 4'd5; b = 4'd3; cin = 1'b1; #10;

        // Test 3: 7 + 9 with cin = 0 -> sum = 0, cout = 1 (16)
        a = 4'd7; b = 4'd9; cin = 1'b0; #10;

        // Test 4: 0 + 0 with cin = 0 -> sum = 0, cout = 0
        a = 4'd0; b = 4'd0; cin = 1'b0; #10;

        $finish;
    end

endmodule
