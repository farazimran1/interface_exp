module tb_interface_exp #(
  parameter int MUX_0_DATA_WITH = 12,
  parameter int MUX_1_DATA_WITH = 4
) (
  input logic [MUX_0_DATA_WITH-1:0] i_a,
  input logic [MUX_0_DATA_WITH-1:0] i_b,
  input logic                       i_sel,

  output logic [MUX_0_DATA_WITH-1:0] o_y_0,
  output logic [MUX_1_DATA_WITH-1:0] o_y_1
);

  mux_if #(.DATA_WITH(MUX_0_DATA_WITH)) mux0_if ();
  mux_if #(.DATA_WITH(MUX_1_DATA_WITH)) mux1_if ();

  mux2to1 mux0 (.slave_if(mux0_if));
  mux2to1 mux1 (.slave_if(mux1_if));

  if_master #(
    .DATA_WITH(MUX_0_DATA_WITH)
  ) master0 (
    .i_a      (i_a),
    .i_b      (i_b),
    .i_sel    (i_sel),
    .o_y      (o_y_0),
    .master_if(mux0_if)
  );

  if_master #(
    .DATA_WITH(MUX_1_DATA_WITH)
  ) master1 (
    .i_a      (i_a[7:4]),
    .i_b      (i_b[7:4]),
    .i_sel    (i_sel),
    .o_y      (o_y_1),
    .master_if(mux1_if)
  );

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end

endmodule
