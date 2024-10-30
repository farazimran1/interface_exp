module tb_interface_exp #(
  parameter int MUX_1_DATA_WITH = 8
) (
  input logic [7:0] i_a,
  input logic [7:0] i_b,
  input logic       i_sel,

  output logic [7:0] o_y
);

  mux2to1 #(
    .DATA_WIDTH(MUX_1_DATA_WITH)
  ) mux0 (
    .i_a  (i_a),
    .i_b  (i_b),
    .i_sel(i_sel),
    .o_y  (o_y)
  );

  mux2to1 #(
    .DATA_WIDTH(MUX_1_DATA_WITH)
  ) mux1 (
    .i_a  (~i_a),
    .i_b  (~i_b),
    .i_sel(~i_sel),
    .o_y  (o_y)
  );

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end

endmodule
