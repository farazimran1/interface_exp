# Makefile

SIM ?= questa
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES = mux2to1.sv mux_if.sv if_master.sv mux2to1_wrapper.sv tb_interface_exp.sv

# enable waveform dumping
WAVES = 1

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = tb_interface_exp

# MODULE is the basename of the Python test file
MODULE = test_interface_exp

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

clean::
	$(RM) -rf modelsim.ini
	$(RM) -rf __pycache__
	$(RM) -rf results.xml
	$(RM) -rf transcript
	$(RM) -rf vsim.wlf
	$(RM) -rf *.vcd
