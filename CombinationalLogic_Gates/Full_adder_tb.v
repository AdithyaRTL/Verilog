`timescale 1ns / 1ps

module Full_adder_tb;

    reg  a, b, cin;
    wire sum, cout;

    // Instantiate Unit Under Test (UUT)
    Full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("Full_adder_tb.vcd");
        $dumpvars(0, Full_adder_tb);

        $monitor("Time = %0t | a = %b, b = %b, cin = %b -> sum = %b, cout = %b", $time, a, b, cin, sum, cout);

        // Test Truth Table (All 8 Combinations)
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
    end

endmodule
