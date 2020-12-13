
##################################################
# autogenerated file
# created by tb create on: 01-Dec-2020 (14:29:10)
# created by tb create for test: ptcalc
##################################################


##################################################
# autogenerated file
# created by tb create on: 24-Nov-2020 (20:45:39)
# created by tb create for test: ptcalc
##################################################

import sys
import os
import json
from termcolor import colored, cprint

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, Combine, Timer, with_timeout
from cocotb.result import TestFailure, TestSuccess

import l0mdt_tb.testbench.ptcalc.ptcalc_wrapper as wrapper
from l0mdt_tb.testbench.ptcalc.ptcalc_ports import PtcalcPorts

# CREATORSOFTWAREBLOCKimport l0mdt_tb.testbench.ptcalc.ptcalc_block as ptcalc_block

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
    for i in range(PtcalcPorts.n_input_interfaces):
        cocotb_inputs = PtcalcPorts.get_input_interface_ports(i) + cocotb_inputs

    for i in range(PtcalcPorts.n_output_interfaces):
        cocotb_outputs = PtcalcPorts.get_output_interface_ports(i) + cocotb_outputs


    input_fifos = [x.spybuffer for x in dut.input_spybuffers]

    cocotb_input_interfaces = PtcalcPorts.n_input_interfaces;

    n_inputs_ok             = len(input_fifos) == cocotb_inputs

    output_fifos = [x.spybuffer for x in dut.output_spybuffers]
    n_outputs_ok = len(output_fifos) == cocotb_outputs
    n_io_ports_ok = n_inputs_ok and n_outputs_ok
    if not n_io_ports_ok:
        raise Exception(
            f"ERROR # of Ptcalc io ports differ between CocoTB and RTL simulation:\n -> CocoTB expects (IN,OUT)=({cocotb_inputs},{cocotb_outputs})\n -> RTL expects (IN,OUT)=({len(input_fifos)},{len(output_fifos)})"
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
    yield ClockCycles(dut.clock, 20)


##
## TEST
##
@cocotb.test()
def ptcalc_test(dut):


    cprint('**************Test START************ ', 'green')
    ##
    ## first grab the testbench configuration
    ##
    config = test_config.get_config()

    ##
    ## process input arguments for this test
    ##
    input_args                       = config["input_args"]
    num_events_to_process            = int(input_args["n_events"])
    event_level_detail_in_sumary     = bool(input_args["event_detail"])
    ptcalc_ii                        = int(input_args["ptcalc_ii"])
    run_config                       = config["run_config"]
    output_dir_name                  = run_config["output_directory_name"]
    output_dir                       = f"{os.getcwd()}/../../../../../test_output/{output_dir_name}"
    master_tv_file                   = test_config.get_testvector_file_from_config(config)
    testvector_config                = config["testvectors"]
    testvector_config_inputs         = testvector_config["inputs"]
    inputs_station_id= [["" for x in range(PtcalcPorts.get_input_interface_ports(y))]for y in range(PtcalcPorts.n_input_interfaces)]
    for i in range(PtcalcPorts.n_input_interfaces):
        inputs_station_id[i] = testvector_config_inputs[i]["station_ID"]

    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCK## start the software block instance
    # CREATORSOFTWAREBLOCK##
    # CREATORSOFTWAREBLOCKptcalc_block_instance = ptcalc_block.ptcalcBlock(dut.clock, "ptcalcBlock")
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(PtcalcPorts.Inputs):
    # CREATORSOFTWAREBLOCK    ptcalc_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.input_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{ptcalc_block_instance.name}_Input_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="in",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKfor i, io in enumerate(PtcalcPorts.Outputs):
    # CREATORSOFTWAREBLOCK    ptcalc_block_instance.add_fifo(
    # CREATORSOFTWAREBLOCK        dut.output_spybuffers[i].spybuffer,
    # CREATORSOFTWAREBLOCK        dut.clock,
    # CREATORSOFTWAREBLOCK        f"{ptcalc_block_instance.name}_Output_{i}",
    # CREATORSOFTWAREBLOCK        io,
    # CREATORSOFTWAREBLOCK        direction="out",
    # CREATORSOFTWAREBLOCK    )
    # CREATORSOFTWAREBLOCKptcalc_block_instance.start()



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
    ## initialize the Ptcalc block wrapper
    ##
    ptcalc_wrapper = wrapper.PtcalcWrapper(
        clock=dut.clock,
        name=f"PtcalcWrapper",
    )

    ##
    ## get testvector format
    ##
    (
        input_tvformats,
        output_tvformats,
    ) = test_config.get_tvformats_from_config(config)

    sb_iport_index = 0
    for n_ip_intf in range(PtcalcPorts.n_input_interfaces): # Add concept of interface
        for io in range(PtcalcPorts.get_input_interface_ports(n_ip_intf)):
            driver = FifoDriver(
                dut.input_spybuffers[sb_iport_index].spybuffer,
                dut.clock,
                "Ptcalc",
                input_tvformats[n_ip_intf],
                str(io),
                write_out=True,
                out_dir=output_dir
            )
            sb_iport_index = sb_iport_index + 1
            ptcalc_wrapper.add_input_driver(driver, n_ip_intf, io) #Add interface


    sb_oport_index = 0
    for n_op_intf in range(PtcalcPorts.n_output_interfaces):
        for io in range(PtcalcPorts.get_output_interface_ports(n_op_intf)): #Outputs):
            active = True
            monitor = FifoMonitor(
                dut.output_spybuffers[sb_oport_index].spybuffer,
                dut.clock,
                "Ptcalc",
                output_tvformats[n_op_intf],
                str(io),
                callbacks=[],
                write_out=True,
                out_dir=output_dir
            )
            sb_oport_index = sb_oport_index + 1
            ptcalc_wrapper.add_output_monitor(monitor, n_op_intf, io, active=active)
    ptcalc_wrapper.sort_ports()


    ###Get Input Test Vector List for Ports across all input interfaces##
    input_tv_list                  =  []
    single_interface_list          =  []
    single_interface_list_ii_delay =  []

    for n_ip_intf in range(PtcalcPorts.n_input_interfaces): # Add concept of interface
        single_interface_list = (events.parse_file_for_testvectors(
            filename=master_tv_file,
            tvformat=input_tvformats[n_ip_intf],
            n_ports = PtcalcPorts.get_input_interface_ports(n_ip_intf),
            n_to_load=num_events_to_process,
            station_ID=inputs_station_id[n_ip_intf]
            ))

        single_interface_list_ii_delay = events.modify_tv(single_interface_list, ptcalc_ii)
        #print("SINGLE INTERFACE LIST_II_DELAY:",n_ip_intf,":",input_tvformats[n_ip_intf]," = ",single_interface_list_ii_delay)
        for io in range(PtcalcPorts.get_input_interface_ports(n_ip_intf)): #Outputs):
            input_tv_list.append(single_interface_list_ii_delay[io])

    #HLS TB INPUT
    #input_tv_list[0][0] = 4613885293049446932
    #input_tv_list[1][0] = 4613885408652818996
    #input_tv_list[2][0] = 4613885537627640404
    #input_tv_list[3][0] = 4611754738440994816
    #print("INPUT_TV_LIST:",input_tv_list,"########")
   ###Get Output Test Vector List for Ports across all output interfaces##
    output_tv_list        =  []
    single_interface_list = []
    for n_op_intf in range(PtcalcPorts.n_output_interfaces): # Add concept of interface
        single_interface_list = (events.parse_file_for_testvectors(
            filename=master_tv_file,
            tvformat=output_tvformats[n_op_intf],
            n_ports = PtcalcPorts.get_output_interface_ports(n_op_intf),
            n_to_load=num_events_to_process
            ))
        output_tv_list.append(single_interface_list)
    #HLS TB OUTPUT
    #output_tv_list[0] = 9011494602712095
    #print("OUTPUT_TV_LIST:",output_tv_list,"########")


    ##
    ## send input events
    ##
    dut._log.info("Sending input events")
    send_finished_signal = ptcalc_wrapper.send_input_events(
        input_tv_list,
        n_to_send=( (num_events_to_process-1)*(ptcalc_ii) + 1)
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
    recvd_events_intf = []
    for n_op_intf in range(PtcalcPorts.n_output_interfaces):
        recvd_events     = [[0 for x in range(num_events_to_process)]for y in range(PtcalcPorts.get_output_interface_ports(n_op_intf))]
        for n_oport, oport in enumerate(ptcalc_wrapper.output_ports(n_op_intf)):

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
    #print("RTL_OUTPUT_TV_LIST:",recvd_events_intf,"########")
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



    #Ordering based on events (Required by TV package)


    for n_op_intf in range (PtcalcPorts.n_output_interfaces):
        event_ordering  = [[0 for x in  range(num_events_to_process)]for y in range(PtcalcPorts.get_output_interface_ports(0))]
        for o_port in range (PtcalcPorts.get_output_interface_ports(n_op_intf)):
            for e_idx in range(num_events_to_process):
                #print("(e_idx,o_port,n_op_intf)=(",e_idx,o_port,n_op_intf,")")
                event_ordering[o_port][e_idx] = recvd_events_intf[n_op_intf][o_port][e_idx]
        #print("recvd_events_intf = ",recvd_events_intf[n_op_intf])
        events_are_equal = events.compare_BitFields(master_tv_file, output_tvformats[n_op_intf],PtcalcPorts.get_output_interface_ports(n_op_intf) , num_events_to_process , recvd_events_intf[n_op_intf]);
    all_tests_passed = (all_tests_passed and events_are_equal)

    #print("event_ordering    = ", event_ordering)


    cocotb_result = {True: cocotb.result.TestSuccess, False: cocotb.result.TestFailure}[
        all_tests_passed
    ]
    raise cocotb_result
