`timescale 1ns / 1ps

module buffer_tb;
    reg  in;
    wire out;

        buffer uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("buffer.vcd");
        $dumpvars(0, buffer_tb);
        $monitor("Time=%0t | in=%b | out=%b", $time, in, out);

        in = 1'b0; #10;
        in = 1'b1; #10;
        in = 1'b0; #10;

        $finish;
    end
endmodule
