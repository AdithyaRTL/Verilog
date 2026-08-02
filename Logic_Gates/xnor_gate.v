module Xnor_gate (
    input  wire a, b,
    output wire c
);

    // Bitwise XNOR operator (~^)
    assign c = ~(a ^ b);

endmodule
