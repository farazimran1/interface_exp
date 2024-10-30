# Makefile

SIM ?= questa
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES = mux2to1.sv tb_mux2to1.sv

# enable waveform dumping
WAVES = 1

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = tb_mux2to1

# MODULE is the basename of the Python test file
MODULE = test_mux2to1

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

clean::
	$(RM) -rf modelsim.ini
	$(RM) -rf __pycache__
	$(RM) -rf results.xml
	$(RM) -rf transcript
	$(RM) -rf vsim.wlf
	$(RM) -rf *.vcd
