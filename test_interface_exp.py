import cocotb
import utils


@cocotb.test()
async def interface_exp_test(dut):
    dut.i_a.value = 0xA7
    dut.i_b.value = 0xB8
    dut.i_sel.value = 1
    await cocotb.triggers.Timer(5, units="ns")

    dut.i_a.value = 0xC3
    dut.i_b.value = 0xD4
    dut.i_sel.value = 0
    await cocotb.triggers.Timer(5, units="ns")

    dut.i_a.value = 0xCA
    dut.i_b.value = 0xFE
    dut.i_sel.value = 1
    await cocotb.triggers.Timer(5, units="ns")

    await utils.end_test(dut)
