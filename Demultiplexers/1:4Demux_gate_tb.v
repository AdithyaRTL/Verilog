`timescale 1ns / 1ps

module demux1to4_gate_tb;

    // Testbench stimuli (Inputs are reg, outputs are wire)
    reg        i1;
    reg  [1:0] sel;
    wire [3:0] y;

    // Instantiate Unit Under Test (UUT)
    demux1to4_gate uut (
        .i1(i1),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Waveform dump for GTKWave
        $dumpfile("demux1to4_gate_tb.vcd");
        $dumpvars(0, demux1to4_gate_tb);

        // Terminal monitor to log output values
        $monitor("Time = %0t | sel = %b (%0d) | i1 = %b -> y = %b [y3=%b, y2=%b, y1=%b, y0=%b]",
                 $time, sel, sel, i1, y, y[3], y[2], y[1], y[0]);

        // Initialize inputs
        i1  = 1'b0;
        sel = 2'b00;
        #10;

        // -------------------------------------------------------------
        // Test 1: Exhaustive Channel Routing (i1 = 1)
        // Verifies each select code routes exclusively to its port
        // -------------------------------------------------------------
        i1 = 1'b1;
        sel = 2'b00; #10; // y should be 4'b0001 (y[0] = 1)
        sel = 2'b01; #10; // y should be 4'b0010 (y[1] = 1)
        sel = 2'b10; #10; // y should be 4'b0100 (y[2] = 1)
        sel = 2'b11; #10; // y should be 4'b1000 (y[3] = 1)

        // -------------------------------------------------------------
        // Test 2: Inactive Data Test (i1 = 0)
        // All output lines must remain 0 across all select codes
        // -------------------------------------------------------------
        i1 = 1'b0;
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // -------------------------------------------------------------
        // Test 3: Dynamic Data Tracking & Channel Isolation
        // Hold sel = 2'b10 (channel y[2]) and toggle input data
        // Only y[2] should toggle; y[0], y[1], and y[3] must stay flat 0
        // -------------------------------------------------------------
        sel = 2'b10;
        i1 = 1'b0; #10;
        i1 = 1'b1; #10;
        i1 = 1'b0; #10;
        i1 = 1'b1; #10;

        // -------------------------------------------------------------
        // Test 4: Dynamic Toggle on Channel y[1] (sel = 2'b01)
        // -------------------------------------------------------------
        sel = 2'b01;
        i1 = 1'b0; #10;
        i1 = 1'b1; #10;
        i1 = 1'b0; #10;

        #10;
        $finish;
    end

endmodule
