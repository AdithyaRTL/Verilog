`timescale 1ns / 1ps

module Not_gate_tb;

    reg  a;
    wire y;

    // Instantiate Unit Under Test (UUT)
    Not_gate uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Setup GTKWave dump files
        $dumpfile("Not_gate_tb.vcd");
        $dumpvars(0, Not_gate_tb);

        // Automatically prints to console whenever 'a' or 'y' changes
        $monitor("Time = %0t | a = %b -> y = %b", $time, a, y);

        // Test Stimulus
        a = 0;
        #10;
        
        a = 1;
        #10;

        $finish;
    end

endmodule
