module tb_interface_exp #(
  parameter int MUX_0_DATA_WITH = 8,
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

  assign mux0_if.i_a   = i_a;
  assign mux0_if.i_b   = i_b;
  assign mux0_if.i_sel = i_sel;
  assign o_y_0         = mux0_if.o_y;

  assign mux1_if.i_a   = ~i_a[MUX_1_DATA_WITH-1:0];
  assign mux1_if.i_b   = ~i_b[MUX_1_DATA_WITH-1:0];
  assign mux1_if.i_sel = ~i_sel;
  assign o_y_1         = mux1_if.o_y;

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end

endmodule
