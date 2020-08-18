
##################################################
# autogenerated file
# created by tb create on: 19-Jun-2020 (09:22:46)
# created by tb create for test: t1
##################################################

import sys
import os
import json

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, Combine, Timer, with_timeout
from cocotb.result import TestFailure, TestSuccess

import tp_tb.testbench.t1.t1_wrapper as wrapper
from tp_tb.testbench.t1.t1_ports import T1Ports

# CREATORSOFTWAREBLOCKimport tp_tb.testbench.t1.t1_block as t1_block

from tp_tb.utils import test_config
from tp_tb.utils import events, tb_diff, result_handler
from tp_tb.utils.fifo_wrapper import FifoDriver, FifoMonitor


def initialize_spybuffers(fifos=[]):

    for ififo, fifo in enumerate(fifos):
        fifo.read_enable <= 0
        fifo.write_enable <= 0
        fifo.empty <= 1
        fifo.almost_full <= 0
        fifo.read_data <= 0
        fifo.write_data <= 0


def initialize_dut(dut):

    ##
    ## initialize the FIFOs
    ##

    input_fifos = [x.spybuffer for x in dut.input_spybuffers]
    n_inputs_ok = len(input_fifos) == len(T1Ports.Inputs)

    output_fifos = [x.spybuffer for x in dut.output_spybuffers]
    n_outputs_ok = len(output_fifos) == len(T1Ports.Outputs)
    n_io_ports_ok = n_inputs_ok and n_outputs_ok
    if not n_io_ports_ok:
        raise Exception(
            f"ERROR # of T1 io ports differ between CocoTB and RTL simulation:\n -> CocoTB expects (IN,OUT)=({len(T1Ports.Inputs)},{len(T1Ports.Outputs)})\n -> RTL expects (IN,OUT)=({len(input_fifos)},{len(output_fifos)})"
        )

    initialize_spybuffers(fifos=input_fifos)
    initialize_spybuffers(fifos=output_fifos)


@cocotb.coroutine
def reset(dut):

    """
    Resets the testbench, having reset active LOW.
    """

    dut.reset_n <= 1
    yield ClockCycles(dut.clock, 10)
    dut.reset_n <= 0
    yield ClockCycles(dut.clock, 10)
    dut.reset_n <= 1


##
## TEST
##
@cocotb.test()
def t1_test(dut):

    ##
    ## first grab the testbench configuration
    ##
    config = test_config.get_config()

    ##
    ## process input arguments for this test
    ##
    input_args = config["input_args"]
    num_events_to_process = int(input_args["n_events"])
    event_level_detail_in_sumary = bool(input_args["event_detail"])

    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCK## start the software block instance
    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCKt1_block_instance = t1_block.T1Block(dut.clock, "T1Block")
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(T1Ports.Inputs):
    # CREATORSOFTWAREBLOCK    t1_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.input_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{t1_block_instance.name}_Input_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="in",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(T1Ports.Outputs):
    # CREATORSOFTWAREBLOCK    t1_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.output_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{t1_block_instance.name}_Output_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="out",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKt1_block_instance.start()

    ##
    ## mark the current board
    ##
    for i in range(20):
        dut._log.warning(
            "AUTOGEN WARNING User should explicitly check the DUT board identifier"
        )
    board_id = 0  # autogen
    dut._log.info(f"Instantiated T1 block with BOARD_ID = {board_id}")
    for io in T1Ports.Outputs:
        if int(io.value) == board_id:
            this_tp = io
            break
    if not this_tp:
        raise ValueError(
            f"Unable to find assocated IO for T1 BOARD_ID={board_id}"
        )
    dut._log.info(f"Setting test IO with base port_name = {this_tp.name}")

    ##
    ## setup the clock and start it
    ##
    sim_clock = Clock(
        dut.clock, int(input_args["clock_period"]), input_args["clock_time_unit"]
    )
    cocotb.fork(sim_clock.start())

    ##
    ## initialize the DUT to known state
    ##
    initialize_dut(dut)

    ##
    ## reset
    ##
    dut._log.info("Resetting DUT")
    yield reset(dut)

    ##
    ## get testvectors
    ##
    (
        input_testvector_files,
        output_testvector_files,
    ) = test_config.get_testvector_files_from_config(config)

    ###
    ### alternative method for getting testvectors:
    ###
    # testvector_dir = config["testvectors"]["testvector_dir"]
    # (
    #   input_testvector_files,
    #   output_testvector_files,
    # ) = t1_utils.get_testvector_files(testvector_dir)

    ##
    ## initialize the T1 block wrapper
    ##
    t1_wrapper = wrapper.T1Wrapper(
        clock=dut.clock,
        name=f"T1Wrapper_{T1Ports.simplename(this_tp)}",
    )
    for i, io in enumerate(T1Ports.Inputs):
        driver = FifoDriver(
            dut.input_spybuffers[io.value].spybuffer,
            dut.clock,
            "T1",
            io,
            write_out=True,
        )
        t1_wrapper.add_input_driver(driver, io)
    for i, io in enumerate(T1Ports.Outputs):
        active = True
        monitor = FifoMonitor(
            dut.output_spybuffers[i].spybuffer,
            dut.clock,
            "T1",
            io,
            callbacks=[],
            write_out=True,
        )
        t1_wrapper.add_output_monitor(monitor, io, active=active)
    t1_wrapper.sort_ports()

    ##
    ## send input events
    ##
    dut._log.info("Sending input events")
    send_finished_signal = t1_wrapper.send_input_events(
        input_testvector_files, n_to_send=num_events_to_process
    )
    if not send_finished_signal:
        raise cocotb.result.TestFailure(
            f"ERROR Event sending timed out! Number of expected inputs with events = {len(send_finished_signal)}"
        )
    try:
        yield with_timeout(Combine(*send_finished_signal), 20, "us")
    except Exception as ex:
        raise cocotb.result.TestFailure(
            f"ERROR Timed out waiting for events to send: {ex}"
        )
    dut._log.info("Sending finished!")

    timer = Timer(20, "us")
    dut._log.info("Going to wait 20 microseconds")
    yield timer

    ##
    ## perform testvector comparison test
    ##
    all_tests_passed = True
    all_test_results = []
    for oport in t1_wrapper.output_ports:

        ##
        ## extract the observed data for this output
        ##
        monitor, io, is_active = oport
        words = monitor.observed_words
        recvd_events = events.load_events(words, "little")
        cocotb.log.info(
            f"Output for {io.name} (output port num {io.value}) received {len(recvd_events)} events"
        )

        ##
        ## extract the expected data for this output
        ##
        if config["run_config"]["expected_is_observed"]:
            # map the "expected" to be the same as the "observed"
            dut._log.warning(
                "WARNING Taking expected events to be the same as the observed events!"
            )
            output_testvector_file = "expected_is_observed"
            expected_output_events = recvd_events
        else:
            output_testvector_file = output_testvector_files[io.value]
            expected_output_events = events.load_events_from_file(
                output_testvector_file, n_to_load=num_events_to_process
            )

        ##
        ## perform test by comparison with expected testvectors
        ##
        events_are_equal, test_results = tb_diff.events_are_equal(
            recvd_events, expected_output_events, verbose=False
        )
        result_summary = result_handler.result_summary_dict(
            f"{str('T1').upper()}_Output_{io.value:02}",
            str(output_testvector_file),
            test_name=f"TEST_{str('T1').upper()}_SRC{this_tp.value:02}_DEST{io.value:02}",
            test_results=test_results,
        )
        all_test_results.append(result_summary)
        all_tests_passed = (
            all_tests_passed and result_summary["test_results"]["test_success"]
        )

        this_tp_name = (
            f"{this_tp.name.split('_')[0]}{int(this_tp.name.split('_')[1]):02}"
        )
        out_io_name = f"{io.name.split('_')[0]}{int(io.name.split('_')[1]):02}"
        output_json_name = f"test_results_summary_T1_src{this_tp_name}_dest{out_io_name}.json"
        with open(output_json_name, "w", encoding="utf-8") as f:
            json.dump(result_summary, f, ensure_ascii=False, indent=4)

    result_handler.dump_test_results(
        all_test_results, event_detail=event_level_detail_in_sumary
    )
    cocotb_result = {True: cocotb.result.TestSuccess, False: cocotb.result.TestFailure}[
        all_tests_passed
    ]
    raise cocotb_result
