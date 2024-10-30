module if_master #(
  parameter int DATA_WITH = 8
) (
  input logic [DATA_WITH-1:0] i_a,
  input logic [DATA_WITH-1:0] i_b,
  input logic                 i_sel,

  output logic [DATA_WITH-1:0] o_y,

  mux_if.master_ports master_if
);

  // modport master_ports(output i_a, output i_b, output i_sel, input o_y);
  assign master_if.i_a   = i_a;
  assign master_if.i_b   = i_b;
  assign master_if.i_sel = i_sel;
  assign o_y             = master_if.o_y;

endmodule
