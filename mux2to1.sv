module mux2to1 (
  mux_if.slave_ports slave_if
);

  assign slave_if.o_y = slave_if.i_sel ? slave_if.i_b : slave_if.i_a;

endmodule
