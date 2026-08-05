module Mux_2to1 (
    input  wire i0, i1,
    input  wire sel,
    output wire y
);

    // Ternary operator: if sel = 1 select i1, else select i0
    assign y = sel ? i1 : i0;

endmodule
