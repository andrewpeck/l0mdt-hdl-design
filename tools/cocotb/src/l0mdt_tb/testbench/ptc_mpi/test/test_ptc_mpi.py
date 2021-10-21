
##################################################
# autogenerated file
# created by tb create on: 14-Sep-2021 (14:04:06)
# created by tb create for test: ptc_mpi
# Author:Priya Sundararajan
# Email:priya.sundararajan@cern.ch
##################################################


#!/usr/bin/env python3

import sys
import os
import json

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, Combine, Timer, with_timeout
from cocotb.result import TestFailure, TestSuccess

import l0mdt_tb.testbench.ptc_mpi.ptc_mpi_wrapper as wrapper
from l0mdt_tb.testbench.ptc_mpi.ptc_mpi_ports import PtcMpiPorts

# CREATORSOFTWAREBLOCKimport l0mdt_tb.testbench.ptc_mpi.ptc_mpi_block as ptc_mpi_block

from l0mdt_tb.utils import test_config
from l0mdt_tb.utils import events
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
    for i in range(PtcMpiPorts.n_input_interfaces):
        cocotb_inputs = PtcMpiPorts.get_input_interface_ports(i) + cocotb_inputs

    for i in range(PtcMpiPorts.n_output_interfaces):
        cocotb_outputs = PtcMpiPorts.get_output_interface_ports(i) + cocotb_outputs


    input_fifos = [x.spybuffer for x in dut.input_spybuffers]

    cocotb_input_interfaces = PtcMpiPorts.n_input_interfaces;

    n_inputs_ok             = len(input_fifos) == cocotb_inputs

    output_fifos = [x.spybuffer for x in dut.output_spybuffers]
    n_outputs_ok = len(output_fifos) == cocotb_outputs
    n_io_ports_ok = n_inputs_ok and n_outputs_ok
    if not n_io_ports_ok:
        raise Exception(
            f"ERROR # of PtcMpi io ports differ between CocoTB and RTL simulation:\n -> CocoTB expects (IN,OUT)=({cocotb_inputs},{cocotb_outputs})\n -> RTL expects (IN,OUT)=({len(input_fifos)},{len(output_fifos)})"
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
def ptc_mpi_test(dut):

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
    mpi_ptcalc_ii                    = int(input_args["mpi_ptcalc_ii"])
    run_config                       = config["run_config"]
    output_dir_name                  = run_config["output_directory_name"]
    output_dir                       = f"{os.getcwd()}/../../../../../test_output/{output_dir_name}"
    master_tv_file                   = test_config.get_testvector_file_from_config(config)
    testvector_config                = config["testvectors"]
    testvector_config_inputs         = testvector_config["inputs"]
    testvector_config_outputs        = testvector_config["outputs"]

    inputs_station_id= [["" for x in range(PtcMpiPorts.get_input_interface_ports(y))]for y in range(PtcMpiPorts.n_input_interfaces)]
    outputs_station_id= [["" for x in range(PtcMpiPorts.get_output_interface_ports(y))]for y in range(PtcMpiPorts.n_output_interfaces)]
    tolerance= [["" for x in range(PtcMpiPorts.get_output_interface_ports(y))]for y in range(PtcMpiPorts.n_output_interfaces)]
    for i in range(PtcMpiPorts.n_input_interfaces):
        if "station_ID" in testvector_config_inputs[i] :
            inputs_station_id[i] = testvector_config_inputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
    for i in range(PtcMpiPorts.n_output_interfaces):
        if "station_ID" in testvector_config_outputs[i] :
            outputs_station_id[i] = testvector_config_outputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
        else :
            outputs_station_id[i] = ['NONE']

        if "tolerance" in testvector_config_outputs[i] :
            tolerance[i] = testvector_config_outputs[i]["tolerance"]
        else:
            tolerance[i] = {"": ["",""]}

    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCK## start the software block instance
    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCKptc_mpi_block_instance = ptc_mpi_block.ptc_mpiBlock(dut.clock, "ptc_mpiBlock")
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(PtcMpiPorts.Inputs):
    # CREATORSOFTWAREBLOCK    ptc_mpi_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.input_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{ptc_mpi_block_instance.name}_Input_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="in",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(PtcMpiPorts.Outputs):
    # CREATORSOFTWAREBLOCK    ptc_mpi_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.output_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{ptc_mpi_block_instance.name}_Output_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="out",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKptc_mpi_block_instance.start()



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
    ## initialize the PtcMpi block wrapper
    ##
    ptc_mpi_wrapper = wrapper.PtcMpiWrapper(
        clock=dut.clock,
        name=f"PtcMpiWrapper",
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
    for n_ip_intf in range(PtcMpiPorts.n_input_interfaces): # Add concept of interface
        for io in range(PtcMpiPorts.get_input_interface_ports(n_ip_intf)):
            driver = FifoDriver(
                dut.input_spybuffers[sb_iport_index].spybuffer,
                dut.clock,
                "PtcMpi",
                input_tvformats[n_ip_intf],
                str(io),
                write_out=True,
                out_dir=output_dir
            )
            sb_iport_index = sb_iport_index + 1
            ptc_mpi_wrapper.add_input_driver(driver, n_ip_intf, io) #Add interface

    sb_oport_index = 0
    for n_op_intf in range(PtcMpiPorts.n_output_interfaces):
        for io in range(PtcMpiPorts.get_output_interface_ports(n_op_intf)): #Outputs):
            active = True
            monitor = FifoMonitor(
                dut.output_spybuffers[sb_oport_index].spybuffer,
                dut.clock,
                "PtcMpi",
                output_tvformats[n_op_intf],
                str(io),
                callbacks=[],
                write_out=True,
                out_dir=output_dir
            )
            sb_oport_index = sb_oport_index + 1
            ptc_mpi_wrapper.add_output_monitor(monitor, n_op_intf, io, active=active)
    ptc_mpi_wrapper.sort_ports()

    #Read TV file
    tv_bcid_list = events.read_tv(
        filename=master_tv_file,
        n_to_load=num_events_to_process
        )

    ###Get Input Test Vector List for Ports across all input interfaces##
    input_tv_list         =  []
    single_interface_list = []
    single_interface_list_ii_delay =  []
    for n_ip_intf in range(PtcMpiPorts.n_input_interfaces): # Add concept of interface
        single_interface_list = (events.parse_tvlist(
            tv_bcid_list,
            tvformat=input_tvformats[n_ip_intf],
            n_ports = PtcMpiPorts.get_input_interface_ports(n_ip_intf),
            n_to_load=num_events_to_process,
            station_ID=inputs_station_id[n_ip_intf],
            tv_type="value"
            ))
        single_interface_list_ii_delay = events.modify_tv(single_interface_list, mpi_ptcalc_ii)
        for io in range(PtcMpiPorts.get_input_interface_ports(n_ip_intf)): #Outputs):
            input_tv_list.append(single_interface_list_ii_delay[io])

    print("input_tv_list =",input_tv_list)

   ###Get Output Test Vector List for Ports across all output interfaces##
    output_tv_list        =  []
    single_interface_list = []
    for n_op_intf in range(PtcMpiPorts.n_output_interfaces): # Add concept of interface
        single_interface_list = (events.parse_tvlist(
            tv_bcid_list,
            tvformat=output_tvformats[n_op_intf],
            n_ports = PtcMpiPorts.get_output_interface_ports(n_op_intf),
            n_to_load=num_events_to_process,
            station_ID=outputs_station_id[n_op_intf],
            tv_type="value"
            ))
        output_tv_list.append(single_interface_list)



    ##
    ## send input events
    ##
    dut._log.info("Sending input events")
    send_finished_signal = ptc_mpi_wrapper.send_input_events(
        input_tv_list,
        n_to_send=num_events_to_process
    )

    if not send_finished_signal:
        raise cocotb.result.TestFailure(
            f"ERROR Event sending timed out! Number of expected inputs with events = {len(send_finished_signal)}"
        )
    try:
        yield with_timeout(Combine(*send_finished_signal),  num_events_to_process*2, "us")
    except Exception as ex:
        raise cocotb.result.TestFailure(
            f"ERROR Timed out waiting for events to send: {ex}"
        )
    dut._log.info("Sending finished!")

    #Block Latency
    yield ClockCycles(dut.clock, 100)
    ##
    ## perform testvector comparison test
    ##
    all_tests_passed = True
    all_test_results = []
    recvd_events_intf = []
    for n_op_intf in range(PtcMpiPorts.n_output_interfaces):
        recvd_events     = [["" for x in range(num_events_to_process)]for y in range(PtcMpiPorts.get_output_interface_ports(n_op_intf))]
        for n_oport, oport in enumerate(ptc_mpi_wrapper.output_ports(n_op_intf)):

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


    pass_count = 0
    fail_count = 0
    field_fail_cnt_header = []
    field_fail_cnt        = []
    field_fail_cnt_header.clear()
    field_fail_cnt.clear()


    for n_op_intf in range (PtcMpiPorts.n_output_interfaces):
        events_are_equal, pass_count_i , fail_count_i, field_fail_count_i  = events.compare_BitFields(tv_bcid_list, output_tvformats[n_op_intf],PtcMpiPorts.get_output_interface_ports(n_op_intf) , num_events_to_process , recvd_events_intf[n_op_intf],tolerance[n_op_intf],output_dir,stationNum=events.station_name_to_id(outputs_station_id[n_op_intf][0]));
    all_tests_passed = (all_tests_passed and events_are_equal)
    pass_count       = pass_count + pass_count_i
    fail_count       = fail_count + fail_count_i
    if outputs_station_id[n_op_intf] != '':
        field_fail_cnt_header.append([output_tvformats[n_op_intf] +" "+ "FIELDS: "+ outputs_station_id[n_op_intf][0], "FAIL COUNT"])
    else:
        field_fail_cnt_header.append([output_tvformats[n_op_intf] +" "+ "FIELDS ", "FAIL COUNT"])
    field_fail_cnt.append(field_fail_count_i)

    events.results_summary(
        num_events_to_process,
        pass_count,
        fail_count,
        PtcMpiPorts.n_output_interfaces,
        field_fail_cnt_header,
        field_fail_cnt,
        total_ports=PtcMpiPorts.n_output_ports(PtcMpiPorts)
    )

    cocotb_result = {True: cocotb.result.TestSuccess, False: cocotb.result.TestFailure}[
        all_tests_passed
    ]
    raise cocotb_result