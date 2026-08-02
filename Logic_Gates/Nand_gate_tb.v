module Nand_gate_tb;
  reg a,b;
  wire c;
// Instantiate Unit Under Test (UUT)
  Nand_gate uut(
    .a(a),
    .b(b),
    .c(c)
  );
  initial begin 
        $dumpfile("Nand_gate_tb.vcd");
        $dumpvars(0, Nand_gate_tb);
// Test Truth Table
    $monitor("Time = %0t, a = %b, b = %b, c = %b", $time,a,b,c);
             #10; a=0; b=0;
             #10; a=0; b=1;
             #10; a=1; b=0;
             #10; a=1; b=1;
     $finish;
             end
             endmodule

             
             

  
