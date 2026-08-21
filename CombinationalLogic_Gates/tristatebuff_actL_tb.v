`timescale 1ns / 1ps

module tristate_low_tb;
    reg  in;
    reg  enable_n;
    wire out;

    tristate_low uut (
        .in(in),
        .enable_n(enable_n),
        .out(out)
    );

    initial begin
        $dumpfile("tristate_low.vcd");
        $dumpvars(0, tristate_low_tb);
        $monitor("Time=%0t | in=%b | enable_n=%b | out=%b (z=High-Z)", $time, in, enable_n, out);

        // Enabled state (Enable_n = 0)
        enable_n = 1'b0; in = 1'b0; #10;
        enable_n = 1'b0; in = 1'b1; #10;

        // Disabled state (Enable_n = 1)
        enable_n = 1'b1; in = 1'b0; #10;
        enable_n = 1'b1; in = 1'b1; #10;

        $finish;
    end
endmodule
