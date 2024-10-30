module mux2to1 #(
  parameter int DATA_WIDTH = 8
) (
  input logic [DATA_WIDTH-1:0] i_a,
  input logic [DATA_WIDTH-1:0] i_b,
  input logic                  i_sel,

  output logic [DATA_WIDTH-1:0] o_y
);

  assign o_y = i_sel ? i_b : i_a;

endmodule
