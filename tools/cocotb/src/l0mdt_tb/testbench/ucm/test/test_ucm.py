
##################################################
# autogenerated file
# created by tb create on: 13-Aug-2021 (15:53:54)
# created by tb create for test: ucm
##################################################


##################################################
# autogenerated file
# created by tb create on: 24-Nov-2020 (20:45:39)
# created by tb create for test: ptcalc
##################################################
#!/usr/bin/env python3

import sys
import os
import json

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, Combine, Timer, with_timeout
from cocotb.result import TestFailure, TestSuccess

import l0mdt_tb.testbench.ucm.ucm_wrapper as wrapper
from l0mdt_tb.testbench.ucm.ucm_ports import UcmPorts

# CREATORSOFTWAREBLOCKimport l0mdt_tb.testbench.ucm.ucm_block as ucm_block

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
    for i in range(UcmPorts.n_input_interfaces):
        cocotb_inputs = UcmPorts.get_input_interface_ports(i) + cocotb_inputs

    for i in range(UcmPorts.n_output_interfaces):
        cocotb_outputs = UcmPorts.get_output_interface_ports(i) + cocotb_outputs


    input_fifos = [x.spybuffer for x in dut.input_spybuffers]

    cocotb_input_interfaces = UcmPorts.n_input_interfaces;

    n_inputs_ok             = len(input_fifos) == cocotb_inputs

    output_fifos = [x.spybuffer for x in dut.output_spybuffers]
    n_outputs_ok = len(output_fifos) == cocotb_outputs
    n_io_ports_ok = n_inputs_ok and n_outputs_ok
    if not n_io_ports_ok:
        raise Exception(
            f"ERROR # of Ucm io ports differ between CocoTB and RTL simulation:\n -> CocoTB expects (IN,OUT)=({cocotb_inputs},{cocotb_outputs})\n -> RTL expects (IN,OUT)=({len(input_fifos)},{len(output_fifos)})"
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
def ucm_test(dut):

    ##
    ## first grab the testbench configuration
    ##
    config = test_config.get_config()

    ##
    ## process input arguments for this test
    ##
    input_args                       = config["input_args"]
    test_vectors                     = config["testvectors"]
    num_events_to_process            = int(input_args["n_events"])
    event_level_detail_in_sumary     = bool(input_args["event_detail"])
    tv_sector                        = int(input_args["tv_sector"])
    tv_side                          = int(input_args["tv_side"])
    run_config                       = config["run_config"]
    output_dir_name                  = run_config["output_directory_name"]
    output_dir                       = f"{os.getcwd()}/../../../../../test_output/{output_dir_name}"
    master_tv_file                   = test_config.get_testvector_file_from_config(config)
    testvector_config                = config["testvectors"]
    testvector_config_inputs         = testvector_config["inputs"]
    testvector_config_outputs        = testvector_config["outputs"]
    inputs_station_id= [["" for x in range(UcmPorts.get_input_interface_ports(y))]for y in range(UcmPorts.n_input_interfaces)]
    outputs_station_id= [["" for x in range(UcmPorts.get_output_interface_ports(y))]for y in range(UcmPorts.n_output_interfaces)]
    tolerance= [["" for x in range(UcmPorts.get_output_interface_ports(y))]for y in range(UcmPorts.n_output_interfaces)]
    for i in range(UcmPorts.n_input_interfaces):
        if "station_ID" in testvector_config_inputs[i] :
            inputs_station_id[i] = testvector_config_inputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
    for i in range(UcmPorts.n_output_interfaces):
        if "station_ID" in testvector_config_outputs[i] :
            outputs_station_id[i] = testvector_config_outputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
        if "tolerance" in testvector_config_outputs[i] :
            tolerance[i] = testvector_config_outputs[i]["tolerance"]
        else:
            tolerance[i] = {"": ["",""]}

    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCK## start the software block instance
    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCKucm_block_instance = ucm_block.ucmBlock(dut.clock, "ucmBlock")
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(UcmPorts.Inputs):
    # CREATORSOFTWAREBLOCK    ucm_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.input_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{ucm_block_instance.name}_Input_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="in",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(UcmPorts.Outputs):
    # CREATORSOFTWAREBLOCK    ucm_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.output_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{ucm_block_instance.name}_Output_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="out",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKucm_block_instance.start()



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
    ## initialize the Ucm block wrapper
    ##
    ucm_wrapper = wrapper.UcmWrapper(
        clock=dut.clock,
        name=f"UcmWrapper",
    )

    ##
    ## get testvector format
    ##
    (
        input_tvformats,
        output_tvformats,
    ) = test_config.get_tvformats_from_config(config)


    (
        input_tvtype
    ) = test_config.get_tvtype_from_config(config)

    sb_iport_index = 0
    for n_ip_intf in range(UcmPorts.n_input_interfaces): # Add concept of interface
        for io in range(UcmPorts.get_input_interface_ports(n_ip_intf)):
            driver = FifoDriver(
                dut.input_spybuffers[sb_iport_index].spybuffer,
                dut.clock,
                "Ucm",
                input_tvformats[n_ip_intf],
                str(io),
                write_out=True,
                out_dir=output_dir
            )
            sb_iport_index = sb_iport_index + 1
            ucm_wrapper.add_input_driver(driver, n_ip_intf, io) #Add interface

    sb_oport_index = 0
    for n_op_intf in range(UcmPorts.n_output_interfaces):
        for io in range(UcmPorts.get_output_interface_ports(n_op_intf)): #Outputs):
            active = True
            monitor = FifoMonitor(
                dut.output_spybuffers[sb_oport_index].spybuffer,
                dut.clock,
                "Ucm",
                output_tvformats[n_op_intf],
                str(io),
                callbacks=[],
                write_out=True,
                out_dir=output_dir
            )
            sb_oport_index = sb_oport_index + 1
            ucm_wrapper.add_output_monitor(monitor, n_op_intf, io, active=active)
    ucm_wrapper.sort_ports()

    #Read TV file
    tv_bcid_list = events.read_tv(
        filename=master_tv_file,
        n_to_load=num_events_to_process,
        region=0,
        side=tv_side ,#barrel
        sector=tv_sector #sector 3
        )

    ###Get Input Test Vector List for Ports across all input interfaces##
    input_tv_list         =  []
    single_interface_list = []
    for n_ip_intf in range(UcmPorts.n_input_interfaces): # Add concept of interface
        single_interface_list = (events.parse_file_for_testvectors(
            filename=master_tv_file,
            tvformat=input_tvformats[n_ip_intf],
            n_ports = UcmPorts.get_input_interface_ports(n_ip_intf),
            n_to_load=num_events_to_process
            ))
        for io in range(UcmPorts.get_input_interface_ports(n_ip_intf)): #Outputs):
            input_tv_list.append(single_interface_list[io])

   ###Get Output Test Vector List for Ports across all output interfaces##
    output_tv_list        =  []
    single_interface_list = []
    for n_op_intf in range(UcmPorts.n_output_interfaces): # Add concept of interface
        single_interface_list = (events.parse_file_for_testvectors(
            filename=master_tv_file,
            tvformat=output_tvformats[n_op_intf],
            n_ports = UcmPorts.get_output_interface_ports(n_op_intf),
            n_to_load=num_events_to_process
            ))
        output_tv_list.append(single_interface_list)



    ##
    ## send input events
    ##
    dut._log.info("Sending input events")
    send_finished_signal = ucm_wrapper.send_input_events(
        input_tv_list,
        n_to_send=num_events_to_process
    )

    if not send_finished_signal:
        raise cocotb.result.TestFailure(
            f"ERROR Event sending timed out! Number of expected inputs with events = {len(send_finished_signal)}"
        )
    try:
        yield with_timeout(Combine(*send_finished_signal), 500, "us")
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
    recvd_events_intf = []
    for n_op_intf in range(UcmPorts.n_output_interfaces):
        recvd_events     = [["" for x in range(num_events_to_process)]for y in range(UcmPorts.get_output_interface_ports(n_op_intf))]
        for n_oport, oport in enumerate(ucm_wrapper.output_ports(n_op_intf)):

            ##
            ## extract the observed data for this output
            ##
            monitor, io, is_active = oport
            words = monitor.observed_words

            recvd_events[n_oport] = words
            cocotb.log.info(
                f"Output for interface {n_op_intf} : port num {n_oport} received {len(recvd_events[n_oport])} events"
            )
        recvd_events_intf.append(recvd_events)

    ##
    ## extract the expected data for this output
    ##
    if config["run_config"]["expected_is_observed"]:
    # map the "expected" to be the same as the "observed"
        dut._log.warning(
            "WARNING Taking expected events to be the same as the observed events!"
        )
        output_testvector_file = "expected_is_observed"
        expected_output_events = recvd_events_intf
    else:
        output_testvector_file = master_tv_file
        expected_output_events = output_tv_list




    for n_op_intf in range (UcmPorts.n_output_interfaces):
        events_are_equal, pass_count , fail_count = events.compare_BitFields(tv_bcid_list, output_tvformats[n_op_intf],UcmPorts.get_output_interface_ports(n_op_intf) , num_events_to_process , recvd_events_intf[n_op_intf],tolerance[n_op_intf]);
    all_tests_passed = (all_tests_passed and events_are_equal)

    print ("\n\t\t\t TEST RESULTS: Total Tests=", num_events_to_process," Pass=",pass_count, "Fail=",fail_count,"\n")

    cocotb_result = {True: cocotb.result.TestSuccess, False: cocotb.result.TestFailure}[
        all_tests_passed
    ]
    raise cocotb_result
