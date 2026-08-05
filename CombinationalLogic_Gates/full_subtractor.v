module Full_subtractor (
    input  wire a, b, bin,
    output wire diff, bout
);

    // Difference is 3-input XOR, Borrow-out handles borrow propagation
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (~a & bin) | (b & bin);

endmodule
