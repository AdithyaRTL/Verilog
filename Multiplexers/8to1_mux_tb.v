`timescale 1ns / 1ps

module MUX_8to1_tb;

    // Testbench signals
    reg  i0, i1, i2, i3, i4, i5, i6, i7;
    reg  [2:0] sel;
    wire y;

    // Instantiate Unit Under Test (UUT)
    MUX_8to1 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Waveform dump for GTKWave
        $dumpfile("MUX_8to1_tb.vcd");
        $dumpvars(0, MUX_8to1_tb);

        // Terminal monitor to log signal values
        $monitor("Time = %0t | sel = %b (%0d) | inputs [i7..i0] = %b%b%b%b%b%b%b%b -> y = %b", 
                 $time, sel, sel, i7, i6, i5, i4, i3, i2, i1, i0, y);

        // Set a unique test pattern across inputs (8'b10101100)
        // i7=1, i6=0, i5=1, i4=0, i3=1, i2=1, i1=0, i0=0
        i0 = 0;
        i1 = 0;
        i2 = 1;
        i3 = 1;
        i4 = 0;
        i5 = 1;
        i6 = 0;
        i7 = 1;

        // Sweep through all 8 selection combinations
        sel = 3'b000; #10; // y should route i0 (0)
        sel = 3'b001; #10; // y should route i1 (0)
        sel = 3'b010; #10; // y should route i2 (1)
        sel = 3'b011; #10; // y should route i3 (1)
        sel = 3'b100; #10; // y should route i4 (0)
        sel = 3'b101; #10; // y should route i5 (1)
        sel = 3'b110; #10; // y should route i6 (0)
        sel = 3'b111; #10; // y should route i7 (1)

        // Change inputs dynamically to verify sensitivity
        #5;
        i3 = 0;
        i7 = 0;
        sel = 3'b011; #10; // y should change to updated i3 (0)
        sel = 3'b111; #10; // y should change to updated i7 (0)

        #10;
        $finish;
    end

endmodule
