module tb_interface_exp (
  input logic [7:0] i_a,
  input logic [7:0] i_b,
  input logic       i_sel,

  output logic [7:0] o_y
);

  interface_exp dut (
    .i_a  (i_a),
    .i_b  (i_b),
    .i_sel(i_sel),
    .o_y  (o_y)
  );

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end

endmodule
