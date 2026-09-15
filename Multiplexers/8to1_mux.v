module MUX_8to1 (
    input wire i0,
    input wire i1,
    input wire i2,
    input wire i3,
    input wire i4,
    input wire i5,
    input wire i6,
    input wire i7,
    input wire [2:0] sel,
    output wire y
);
   assign y = (sel == 3'b000) ? i0 :
              (sel == 3'b001) ? i1 :
              (sel == 3'b010) ? i2 :
              (sel == 3'b011) ? i3:
              (sel == 3'b100) ? i4 :
              (sel == 3'b101) ? i5 :
              (sel == 3'b110) ? i6 : i7;
endmodule
