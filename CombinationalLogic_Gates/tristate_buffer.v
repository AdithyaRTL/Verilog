`timescale 1ns / 1ps
// active high tristate buffer
module tristate_high (
    input  wire in,
    input  wire enable,
    output wire out
);
    assign out = (enable == 1'b1) ? in : 1'bz;
endmodule
