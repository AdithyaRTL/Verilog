`timescale 1ns / 1ps

module Mux_2to1_tb;

    reg  i0, i1, sel;
    wire y;

    // Instantiate Unit Under Test (UUT)
    Mux_2to1 uut (
        .i0(i0),
        .i1(i1),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("Mux_2to1_tb.vcd");
        $dumpvars(0, Mux_2to1_tb);

        $monitor("Time = %0t | sel = %b, i0 = %b, i1 = %b -> y = %b", $time, sel, i0, i1, y);

        // Test Cases
        i0 = 0; i1 = 1; sel = 0; #10; // Output should be i0 (0)
        i0 = 0; i1 = 1; sel = 1; #10; // Output should be i1 (1)
        i0 = 1; i1 = 0; sel = 0; #10; // Output should be i0 (1)
        i0 = 1; i1 = 0; sel = 1; #10; // Output should be i1 (0)

        $finish;
    end

endmodule
