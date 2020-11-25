import sys
import os
import json

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, Combine, Timer, with_timeout
from cocotb.result import TestFailure, TestSuccess

import l0mdt_tb.testbench.CREATORTESTNAME.CREATORTESTNAME_wrapper as wrapper
from l0mdt_tb.testbench.CREATORTESTNAME.CREATORTESTNAME_ports import CREATORCLASSNAMEPorts

# CREATORSOFTWAREBLOCKimport l0mdt_tb.testbench.CREATORTESTNAME.CREATORTESTNAME_block as CREATORTESTNAME_block

from l0mdt_tb.utils import test_config
from l0mdt_tb.utils import events, tb_diff, result_handler
from l0mdt_tb.utils.fifo_wrapper import FifoDriver, FifoMonitor


def initialize_spybuffers(fifos=[]):

    for ififo, fifo in enumerate(fifos):
        fifo.read_enable <= 0
        fifo.write_enable <= 0
        fifo.empty <= 1
        fifo.almost_full <= 0
        fifo.read_data <= 0
        fifo.write_data <= 0


def initialize_dut(dut,config):

    ##
    ## initialize the FIFOs
    ##
    cocotb_inputs  = 0
    cocotb_outputs = 0
    for i in range(CREATORCLASSNAMEPorts.n_input_interfaces(CREATORCLASSNAMEPorts)):
        cocotb_inputs = CREATORCLASSNAMEPorts.get_input_interface_ports(i) + cocotb_inputs

    for i in range(CREATORCLASSNAMEPorts.n_output_interfaces(CREATORCLASSNAMEPorts)):
        cocotb_outputs = CREATORCLASSNAMEPorts.get_output_interface_ports(i) + cocotb_outputs


    input_fifos = [x.spybuffer for x in dut.input_spybuffers]

    cocotb_input_interfaces = CREATORCLASSNAMEPorts.n_input_interfaces;

    n_inputs_ok             = len(input_fifos) == cocotb_inputs

    output_fifos = [x.spybuffer for x in dut.output_spybuffers]
    n_outputs_ok = len(output_fifos) == cocotb_outputs
    n_io_ports_ok = n_inputs_ok and n_outputs_ok
    if not n_io_ports_ok:
        raise Exception(
            f"ERROR # of CREATORCLASSNAME io ports differ between CocoTB and RTL simulation:\n -> CocoTB expects (IN,OUT)=({cocotb_inputs},{cocotb_outputs})\n -> RTL expects (IN,OUT)=({len(input_fifos)},{len(output_fifos)})"
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
def CREATORTESTNAME_test(dut):

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
    run_config                       = config["run_config"]
    output_dir_name                  = run_config["output_directory_name"]
    output_dir                       = f"{os.getcwd()}/../../../../../test_output/{output_dir_name}"
    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCK## start the software block instance
    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCKCREATORTESTNAME_block_instance = CREATORTESTNAME_block.CREATORTESTNAMEBlock(dut.clock, "CREATORTESTNAMEBlock")
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(CREATORCLASSNAMEPorts.Inputs):
    # CREATORSOFTWAREBLOCK    CREATORTESTNAME_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.input_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{CREATORTESTNAME_block_instance.name}_Input_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="in",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(CREATORCLASSNAMEPorts.Outputs):
    # CREATORSOFTWAREBLOCK    CREATORTESTNAME_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.output_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{CREATORTESTNAME_block_instance.name}_Output_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="out",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKCREATORTESTNAME_block_instance.start()



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
    initialize_dut(dut,config)

    ##
    ## reset
    ##
    dut._log.info("Resetting DUT")
    yield reset(dut)

    ##
    ## get testvectors
    ##
    (
        input_tvformats,
        output_tvformats,
    ) = test_config.get_tvformats_from_config(config)


    ##
    ## initialize the CREATORCLASSNAME block wrapper
    ##
    CREATORTESTNAME_wrapper = wrapper.CREATORCLASSNAMEWrapper(
        clock=dut.clock,
        name=f"CREATORCLASSNAMEWrapper",
    )
    for n_ip_intf in range(CREATORCLASSNAMEPorts.n_input_interfaces(CREATORCLASSNAMEPorts)): # Add concept of interface
        for io in range(CREATORCLASSNAMEPorts.get_input_interface_ports(n_ip_intf)):
            driver = FifoDriver(
                dut.input_spybuffers[CREATORCLASSNAMEPorts.get_input_interface_ports(n_ip_intf)* n_ip_intf + io].spybuffer,
                dut.clock,
                "CREATORCLASSNAME",
                input_tvformats[n_ip_intf],
                str(io),
                write_out=True,
                out_dir=output_dir
            )
            CREATORTESTNAME_wrapper.add_input_driver(driver, n_ip_intf, io) #Add interface

    for n_op_intf in range(CREATORCLASSNAMEPorts.n_output_interfaces(CREATORCLASSNAMEPorts)):
        for io in range(CREATORCLASSNAMEPorts.get_output_interface_ports(n_op_intf)): #Outputs):
            active = True
            monitor = FifoMonitor(
                dut.output_spybuffers[CREATORCLASSNAMEPorts.get_output_interface_ports(n_op_intf)*n_op_intf + io].spybuffer,
                dut.clock,
                "CREATORCLASSNAME",
                io,
                callbacks=[],
                write_out=True,
            )
            CREATORTESTNAME_wrapper.add_output_monitor(monitor, n_op_intf, io, active=active)
    CREATORTESTNAME_wrapper.sort_ports()

    ##
    ## send input events
    ##
    dut._log.info("Sending input events")
    send_finished_signal = [0]
    for n_ip_intf in range(CREATORCLASSNAMEPorts.n_input_interfaces(CREATORCLASSNAMEPorts)): # Add concept of interface
        send_finished_signal[n_ip_intf] = CREATORTESTNAME_wrapper.send_input_events(
            input_tvformats, n_ip_intf, n_to_send=num_events_to_process
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
    for oport in CREATORTESTNAME_wrapper.output_ports:

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
            output_testvector_file = output_tvformats[io.value]
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
            f"{str('CREATORCLASSNAME').upper()}_Output_{io.value:02}",
            str(output_testvector_file),
            test_name=f"TEST_{str('CREATORCLASSNAME').upper()}",
            test_results=test_results,
        )
        all_test_results.append(result_summary)
        all_tests_passed = (
            all_tests_passed and result_summary["test_results"]["test_success"]
        )

        output_json_name = f"test_results_summary_CREATORCLASSNAME_{io}.json"
        with open(output_json_name, "w", encoding="utf-8") as f:
            json.dump(result_summary, f, ensure_ascii=False, indent=4)

    result_handler.dump_test_results(
        all_test_results, event_detail=event_level_detail_in_sumary
    )
    cocotb_result = {True: cocotb.result.TestSuccess, False: cocotb.result.TestFailure}[
        all_tests_passed
    ]
    raise cocotb_result
