module mux2to1_wrapper (
  mux_if.slave_ports slave_if
);

  mux2to1 mux (.slave_if(slave_if));

endmodule
