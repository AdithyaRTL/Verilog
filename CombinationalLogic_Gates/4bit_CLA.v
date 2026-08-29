`timescale 1ns / 1ps

module CLA_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       cout
);

    wire [3:0] g; // Generate signals: Gi = Ai & Bi
    wire [3:0] p; // Propagate signals: Pi = Ai ^ Bi
    wire [4:0] c; // Intermediate carries: c[0] = cin, c[4] = cout

    // Stage 1: Generate and Propagate terms
    assign g = a & b;
    assign p = a ^ b;

    // Stage 2: Lookahead Carry Generator (Parallel carry logic)
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

    // Stage 3: Sum computation (Si = Pi ^ Ci) and final Carry Out
    assign sum  = p ^ c[3:0];
    assign cout = c[4];

endmodule
