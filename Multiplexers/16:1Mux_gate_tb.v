`timescale 1ns / 1ps

module mux16to1_manual_tb;

    // Testbench signals
    reg  i0,  i1,  i2,  i3,  i4,  i5,  i6,  i7;
    reg  i8,  i9,  i10, i11, i12, i13, i14, i15;
    reg  [3:0] sel;
    wire y;

    // Instantiate Unit Under Test (UUT)
    mux16to1_gate uut (
        .i0(i0),   .i1(i1),   .i2(i2),   .i3(i3),
        .i4(i4),   .i5(i5),   .i6(i6),   .i7(i7),
        .i8(i8),   .i9(i9),   .i10(i10), .i11(i11),
        .i12(i12), .i13(i13), .i14(i14), .i15(i15),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Waveform dump for GTKWave
        $dumpfile("mux16to1_manual_tb.vcd");
        $dumpvars(0, mux16to1_manual_tb);

        // Terminal monitor to log signal values
        $monitor("Time = %0t | sel = %b (%2d) | inputs [i15..i0] = %b%b%b%b_%b%b%b%b_%b%b%b%b_%b%b%b%b -> y = %b",
                 $time, sel, sel,
                 i15, i14, i13, i12, i11, i10, i9, i8,
                 i7,  i6,  i5,  i4,  i3,  i2,  i1,  i0, y);

        // 1. Set a fixed test pattern across all 16 inputs
        // Pattern: 16'b1010_1100_0101_0011 (hex A C 5 3)
        i0  = 1; i1  = 1; i2  = 0; i3  = 0;
        i4  = 1; i5  = 0; i6  = 1; i7  = 0;
        i8  = 0; i9  = 0; i10 = 1; i11 = 1;
        i12 = 0; i13 = 1; i14 = 0; i15 = 1;

        // 2. Line-by-line selection sweep through all 16 channels
        sel = 4'b0000; #10; // routes i0  (1)
        sel = 4'b0001; #10; // routes i1  (1)
        sel = 4'b0010; #10; // routes i2  (0)
        sel = 4'b0011; #10; // routes i3  (0)
        sel = 4'b0100; #10; // routes i4  (1)
        sel = 4'b0101; #10; // routes i5  (0)
        sel = 4'b0110; #10; // routes i6  (1)
        sel = 4'b0111; #10; // routes i7  (0)
        sel = 4'b1000; #10; // routes i8  (0)
        sel = 4'b1001; #10; // routes i9  (0)
        sel = 4'b1010; #10; // routes i10 (1)
        sel = 4'b1011; #10; // routes i11 (1)
        sel = 4'b1100; #10; // routes i12 (0)
        sel = 4'b1101; #10; // routes i13 (1)
        sel = 4'b1110; #10; // routes i14 (0)
        sel = 4'b1111; #10; // routes i15 (1)

        // 3. Dynamic sensitivity check on selected channel
        #5;
        i5  = 1; // Change i5 from 0 to 1
        sel = 4'b0101; #10; // y should route new i5 value (1)

        i13 = 0; // Change i13 from 1 to 0
        sel = 4'b1101; #10; // y should route new i13 value (0)

        #10;
        $finish;
    end

endmodule
