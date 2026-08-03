module Full_adder (
    input  wire a, b, cin,
    output wire sum, cout
);

    // Sum is 3-input XOR, Cout is majority logic
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
