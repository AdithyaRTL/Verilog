// Testbench for 2-Input OR Gate
module Or_gate_tb;
    // Input signals (use reg in testbench)
    reg a;
    reg b;
    
    // Output signal (use wire in testbench)
    wire c;

    // Connect OR gate circuit (Unit Under Test)
    Or_gate uut (
        .a(a),
        .b(b),
        .c(c)
    );

    // Apply test electrical signals
    initial begin
        a = 0; b = 0; #10; // Input 00, wait 10 time units
        a = 0; b = 1; #10; // Input 01, wait 10 time units
        a = 1; b = 0; #10; // Input 10, wait 10 time units
        a = 1; b = 1; #10; // Input 11, wait 10 time units
        $finish;          // End simulation
    end
endmodule
