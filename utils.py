import re
import cocotb


def get_sv_filename_from_makefile(makefile="Makefile"):
    with open(makefile, "r") as f:
        for line in f:
            if line.startswith("TOPLEVEL") and not line.startswith("TOPLEVEL_LANG"):
                return line.split("=")[1].strip() + ".sv"
    return None


def get_input_signals(sv_file):
    input_signals = []
    with open(sv_file, "r") as f:
        for line in f:
            # Match lines that start with 'input' and contain a word starting with 'i_'
            match = re.search(r"\binput\b.*?\b(i_\w+)\b", line)
            if match:
                input_signals.append(match.group(1))
    return input_signals


async def end_test(dut):
    input_signals = get_input_signals(get_sv_filename_from_makefile())

    for signal in input_signals:
        setattr(dut, signal, 0)  # Dynamically set the value of each input signal to 0

    await cocotb.triggers.Timer(1, units="ps")
