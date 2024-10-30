interface mux_if #(
  parameter int DATA_WITH = 8
);
  logic [DATA_WITH-1:0] i_a;
  logic [DATA_WITH-1:0] i_b;
  logic                 i_sel;
  logic [DATA_WITH-1:0] o_y;

  modport master_ports(output i_a, output i_b, output i_sel, input o_y);
  modport slave_ports(input i_a, input i_b, input i_sel, output o_y);

endinterface
