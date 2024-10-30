module mux2to1 (
  input logic [7:0] i_a,
  input logic [7:0] i_b,
  input logic       i_sel,

  output logic [7:0] o_y
);

  assign o_y = i_sel ? i_b : i_a;

endmodule
