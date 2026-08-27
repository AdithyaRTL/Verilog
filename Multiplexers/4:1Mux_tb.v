`timescale 1ns / 1ps

module mux_4to1_tb;

    reg        i0;
    reg        i1;
    reg        i2;
    reg        i3;
    reg  [1:0] sel;
    wire       y;

    // Instantiate Unit Under Test (UUT)
    mux_4to1 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux_4to1.vcd");
        $dumpvars(0, mux_4to1_tb);

        $monitor("Time=%0t | i0=%b i1=%b i2=%b i3=%b | sel=%b (sel=%d) | y=%b",
                 $time, i0, i1, i2, i3, sel, sel, y);

        // Pattern 1: i0=1, i1=0, i2=1, i3=0
        i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0;

        sel = 2'b00; #10; // Selects i0 -> y = 1
        sel = 2'b01; #10; // Selects i1 -> y = 0
        sel = 2'b10; #10; // Selects i2 -> y = 1
        sel = 2'b11; #10; // Selects i3 -> y = 0

        // Pattern 2: Invert inputs (i0=0, i1=1, i2=0, i3=1)
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b1;

        sel = 2'b00; #10; // Selects i0 -> y = 0
        sel = 2'b01; #10; // Selects i1 -> y = 1
        sel = 2'b10; #10; // Selects i2 -> y = 0
        sel = 2'b11; #10; // Selects i3 -> y = 1

        $finish;
    end

endmodule
