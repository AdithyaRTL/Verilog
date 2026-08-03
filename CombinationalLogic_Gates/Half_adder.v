module Half_adder (
    input  wire a, b,
    output wire sum, carry
);

    // Sum is XOR of inputs, Carry is AND of inputs
    assign sum   = a ^ b;
    assign carry = a & b;

endmodule
