`timescale 1ns / 1ps

module tristate_high_tb;
    reg  in;
    reg  enable;
    wire out;

    tristate_high uut (
        .in(in),
        .enable(enable),
        .out(out)
    );

    initial begin
        $dumpfile("tristate_high.vcd");
        $dumpvars(0, tristate_high_tb);
        $monitor("Time=%0t | in=%b | enable=%b | out=%b (z=High-Z)", $time, in, enable, out);

        // Disabled state (Enable = 0)
        enable = 1'b0; in = 1'b0; #10;
        enable = 1'b0; in = 1'b1; #10;

        // Enabled state (Enable = 1)
        enable = 1'b1; in = 1'b0; #10;
        enable = 1'b1; in = 1'b1; #10;

        $finish;
    end
endmodule
