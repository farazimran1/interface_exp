import cocotb
import utils


@cocotb.test()
async def interface_exp_test(dut):
    dut.i_a.value = 0xA7F
    dut.i_b.value = 0xB8F
    dut.i_sel.value = 1
    await cocotb.triggers.Timer(5, units="ns")

    dut.i_a.value = 0xC3D
    dut.i_b.value = 0xD4D
    dut.i_sel.value = 0
    await cocotb.triggers.Timer(5, units="ns")

    dut.i_a.value = 0xCAD
    dut.i_b.value = 0xFED
    dut.i_sel.value = 1
    await cocotb.triggers.Timer(5, units="ns")

    await utils.end_test(dut)
