
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

import l0mdt_tb.testbench.mtc.mtc_wrapper as wrapper
from l0mdt_tb.testbench.mtc.mtc_ports import MtcPorts

# CREATORSOFTWAREBLOCKimport l0mdt_tb.testbench.mtc.mtc_block as mtc_block

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
    for i in range(MtcPorts.n_input_interfaces):
        cocotb_inputs = MtcPorts.get_input_interface_ports(i) + cocotb_inputs

    for i in range(MtcPorts.n_output_interfaces):
        cocotb_outputs = MtcPorts.get_output_interface_ports(i) + cocotb_outputs


    input_fifos = [x.spybuffer for x in dut.input_spybuffers]

    cocotb_input_interfaces = MtcPorts.n_input_interfaces;

    n_inputs_ok             = len(input_fifos) == cocotb_inputs

    output_fifos = [x.spybuffer for x in dut.output_spybuffers]
    n_outputs_ok = len(output_fifos) == cocotb_outputs
    n_io_ports_ok = n_inputs_ok and n_outputs_ok
    if not n_io_ports_ok:
        raise Exception(
            f"ERROR # of Mtc io ports differ between CocoTB and RTL simulation:\n -> CocoTB expects (IN,OUT)=({cocotb_inputs},{cocotb_outputs})\n -> RTL expects (IN,OUT)=({len(input_fifos)},{len(output_fifos)})"
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
def mtc_test(dut):

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
    run_config                       = config["run_config"]
    output_dir_name                  = run_config["output_directory_name"]
    output_dir                       = f"{os.getcwd()}/../../../../../test_output/{output_dir_name}"
    master_tv_file                   = test_config.get_testvector_file_from_config(config)

    testvector_config                = config["testvectors"]

    testvector_config_inputs         = testvector_config["inputs"]
    testvector_config_outputs        = testvector_config["outputs"]
    inputs_station_id= [["" for x in range(MtcPorts.get_input_interface_ports(y))]for y in range(MtcPorts.n_input_interfaces)]
    outputs_station_id= [["" for x in range(MtcPorts.get_output_interface_ports(y))]for y in range(MtcPorts.n_output_interfaces)]

    for i in range(MtcPorts.n_input_interfaces):
        if "station_ID" in testvector_config_inputs[i] :
            inputs_station_id[i] = testvector_config_inputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
    for i in range(MtcPorts.n_output_interfaces):
        if "station_ID" in testvector_config_outputs[i] :
            outputs_station_id[i] = testvector_config_outputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
            

    mtc2sl_lsf_tol = {
        "mdt_pt": ["abs", 100],
    }

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
    ## initialize the Mtc block wrapper
    ##
    mtc_wrapper = wrapper.MtcWrapper(
        clock=dut.clock,
        name=f"MtcWrapper",
    )

    ##
    ## get testvector format
    ##
    (
        input_tvformats,
        output_tvformats,
    ) = test_config.get_tvformats_from_config(config)

    #Attach input RTL SPyBuffer to CocoTB FifoDriver
    sb_iport_index = 0
    for n_ip_intf in range(MtcPorts.n_input_interfaces): # Add concept of interface
        for io in range(MtcPorts.get_input_interface_ports(n_ip_intf)):
            driver = FifoDriver(
                dut.input_spybuffers[sb_iport_index].spybuffer,
                dut.clock,
                "Mtc",
                input_tvformats[n_ip_intf],
                str(io),
                write_out=True,
                out_dir=output_dir
            )
            sb_iport_index = sb_iport_index + 1
            mtc_wrapper.add_input_driver(driver, n_ip_intf, io) #Add interface

    #Attach output RTL SPyBuffer to CocoTB FifoMonitor
    sb_oport_index = 0
    for n_op_intf in range(MtcPorts.n_output_interfaces):
        for io in range(MtcPorts.get_output_interface_ports(n_op_intf)): #Outputs):
            active = True

            monitor = FifoMonitor(
                dut.output_spybuffers[sb_oport_index].spybuffer,
                dut.clock,
                "Mtc",
                output_tvformats[n_op_intf],
                str(io),
                callbacks=[],
                write_out=True ,
                out_dir=output_dir
            )
            sb_oport_index = sb_oport_index + 1
            mtc_wrapper.add_output_monitor(monitor, n_op_intf, io, active=active)
    mtc_wrapper.sort_ports()


    #Read TV file
    tv_bcid_list = events.read_tv(
        filename=master_tv_file,
        n_to_load=num_events_to_process,
        region=0,
        side=3,
        sector=3
        )

    ###Get Input Test Vector List for Ports across all input interfaces##
    input_tv_list         =  [["" for x in range(num_events_to_process)] for y in range (MtcPorts.n_input_ports(MtcPorts))]
    input_tv_list_i       =  [["" for x in range(num_events_to_process)] for y in range (MtcPorts.n_input_ports(MtcPorts))]
    sb_port_index = 0
    for n_ip_intf in range(MtcPorts.n_input_interfaces): # Add concept of interface
        single_interface_list = [["" for x in range(num_events_to_process)] for y in range(MtcPorts.get_input_interface_ports(n_ip_intf))]
        single_interface_list = (events.parse_tvlist(
            tv_bcid_list,
            tvformat=input_tvformats[n_ip_intf],
            n_ports = MtcPorts.get_input_interface_ports(n_ip_intf),
            n_to_load=num_events_to_process
            ))

        #print("################\n n_to_load = ",num_events_to_process, "single_interface_list = ",single_interface_list)
        ################HACK-> TILL TV updates process_ch
        #if(n_ip_intf == 0): #PL2MTC
        #    for i in range(3): # Update PL2MTC dataformat with process_ch values
        #        for j in range(num_events_to_process):
        #            single_interface_list[i][j] = (single_interface_list[i][j] | (i << 107))

        for io in range(MtcPorts.get_input_interface_ports(n_ip_intf)): #Outputs):
            input_tv_list_i[sb_port_index] = (single_interface_list[io])
            input_tv_list_i[sb_port_index].append(0)
            sb_port_index                = sb_port_index + 1

        input_tv_list = events.modify_tv_padzeroes(input_tv_list_i)


   ###Get Output Test Vector List for Ports across all output interfaces##
    output_tv_list        =  []
    single_interface_list = []
    for n_op_intf in range(MtcPorts.n_output_interfaces): # Add concept of interface
        single_interface_list = (events.parse_tvlist(
            tv_bcid_list,
            tvformat=output_tvformats[n_op_intf],
            n_ports = MtcPorts.get_output_interface_ports(n_op_intf),
            n_to_load=num_events_to_process
            ))
        output_tv_list.append(single_interface_list)



    #print("################\n input_tv_list = ",input_tv_list)
    #print("################\n output_tv_list = ",output_tv_list)
    ##
    ## send input events
    ##
    dut._log.info("Sending input events")
    send_finished_signal = mtc_wrapper.send_input_events(
        input_tv_list,
        n_to_send=num_events_to_process
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

    timer = Timer(1, "us")
    dut._log.info("Going to wait 20 microseconds")
    yield timer

    ##
    ## perform testvector comparison test
    ##
    all_tests_passed = True
    recvd_events_intf = []
    #Load observed data from CocoTB FifoMonitor for each RTL SpyBuffer Output
    for n_op_intf in range(MtcPorts.n_output_interfaces):
        recvd_events     = [["" for x in range(num_events_to_process)]for y in range(MtcPorts.get_output_interface_ports(n_op_intf))]
        recvd_lineup     = [["" for x in range(num_events_to_process)]for y in range(MtcPorts.get_output_interface_ports(n_op_intf))]
        recvd_time       = [["" for x in range(num_events_to_process)]for y in range(MtcPorts.get_output_interface_ports(n_op_intf))]
        
        for n_oport, oport in enumerate(mtc_wrapper.output_ports(n_op_intf)):

            ##
            ## extract the observed data for this output
            ##
            monitor, io, is_active = oport
            words = monitor.observed_words
            time  = monitor.observed_time
            recvd_events[n_oport] = words
            recvd_time[n_oport]   = time
            cocotb.log.info(
                f"Output for interface {n_op_intf} : port num {n_oport} received {len(recvd_events[n_oport])} events"
            )
        #Multiple ports in this interface, need to lineup events across ports based on time
        #recvd_lineup = events.timebased_lineup(recvd_events, recvd_time,num_events_to_process,MtcPorts.get_output_interface_ports(n_op_intf))
        #recvd_events_intf.append(recvd_lineup)
        o_recvd_events = events.time_ordering(recvd_events, recvd_time, num_events_to_process)
        recvd_events_intf.append(o_recvd_events)
      


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



    field_fail_cnt_header = []
    field_fail_cnt        = []
    field_fail_cnt_header.clear()
    field_fail_cnt.clear()

    #DEBUG i PRINTING ALL EVENTS
    #events.print_tv_list(input_tvformats, input_tv_list, MtcPorts.n_input_interfaces, MtcPorts.n_ports, num_events_to_process)
    #DEBUG i PRINTING EVENT 2
    events.print_tv_list(input_tvformats, input_tv_list, MtcPorts.n_input_interfaces, MtcPorts.n_ports, num_events_to_process, event_number=2)
    

    for n_op_intf in range (MtcPorts.n_output_interfaces):
        events_are_equal,pass_count , fail_count, field_fail_count_i = events.compare_BitFields(
            tv_bcid_list, 
            output_tvformats[n_op_intf],
            MtcPorts.get_output_interface_ports(n_op_intf) , 
            num_events_to_process , 
            recvd_events_intf[n_op_intf], 
            tolerances=mtc2sl_lsf_tol,
            output_path=output_dir,
            stationNum=events.station_list_name_to_id(outputs_station_id[n_op_intf])
        );
        all_tests_passed = (all_tests_passed and events_are_equal)
        field_fail_cnt_header.append([output_tvformats[n_op_intf] +" "+ "FIELDS", "FAIL COUNT"])
        field_fail_cnt.append(field_fail_count_i)

    events.results_summary(
        num_events_to_process,
        pass_count,
        fail_count,
        MtcPorts.n_output_interfaces,
        field_fail_cnt_header,
        field_fail_cnt,
        total_ports=MtcPorts.n_output_ports(MtcPorts)
    )


    cocotb_result = {True: cocotb.result.TestSuccess, False: cocotb.result.TestFailure}[
        all_tests_passed
    ]


    raise cocotb_result
