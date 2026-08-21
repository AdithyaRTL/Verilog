`timescale 1ns / 1ps

module tristate_low (
    input  wire in,
    input  wire enable_n, // Active-Low: 0 = Drive, 1 = High-Z
    output wire out
);
    assign out = (enable_n == 1'b0) ? in : 1'bz;
endmodule
