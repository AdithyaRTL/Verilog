module Half_subtractor (
    input  wire a, b,
    output wire diff, borrow
);

    // Difference is XOR of inputs, Borrow is (~a AND b)
    assign diff   = a ^ b;
    assign borrow = ~a & b;

endmodule
