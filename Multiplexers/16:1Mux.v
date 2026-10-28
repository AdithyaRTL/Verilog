module mux16to1_gate (
  input wire i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,
  input wire [3:0] sel,
  output wire y
);
  assign y = (sel == 4'b0000) ? i0 :
    (sel == 4'b0001) ? i1 :
    (sel == 4'b0010) ? i2 :
    (sel == 4'b0011) ? i3 :
    (sel == 4'b0100) ? i4 :
    (sel == 4'b0101) ? i5 :
    (sel == 4'b0110) ? i6 :
    (sel == 4'b0111) ? i7 :
    (sel == 4'b1000) ? i8 :
    (sel == 4'b1001) ? i9 :
    (sel == 4'b1010) ? i10 :
    (sel == 4'b1011) ? i11 :
    (sel == 4'b1100) ? i12 :
    (sel == 4'b1101) ? i13 :
    (sel == 4'b1110) ? i14 : i15;
endmodule
