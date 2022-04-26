##################################################
# autogenerated file
# created by tb create on: 01-Dec-2020 (06:28:54)
# created by tb create for test: lsf
##################################################


#!/usr/bin/env python3

import sys
import os
import json

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, Combine, Timer, with_timeout
from cocotb.result import TestFailure, TestSuccess

import l0mdt_tb.testbench.lsf.lsf_wrapper as wrapper
from l0mdt_tb.testbench.lsf.lsf_ports import LsfPorts

# CREATORSOFTWAREBLOCKimport l0mdt_tb.testbench.lsf.lsf_block as lsf_block

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


def initialize_dut(dut, config):

    ##
    ## initialize the FIFOs
    ##
    cocotb_inputs = 0
    cocotb_outputs = 0
    dut.tb_i_eof   = 0
    for i in range(LsfPorts.n_input_interfaces):
        cocotb_inputs = LsfPorts.get_input_interface_ports(
            i) + cocotb_inputs

    for i in range(LsfPorts.n_output_interfaces):
        cocotb_outputs = LsfPorts.get_output_interface_ports(
            i) + cocotb_outputs

    input_fifos = [x.spybuffer for x in dut.input_spybuffers]

    cocotb_input_interfaces = LsfPorts.n_input_interfaces

    n_inputs_ok = len(input_fifos) == cocotb_inputs

    output_fifos = [x.spybuffer for x in dut.output_spybuffers]
    n_outputs_ok = len(output_fifos) == cocotb_outputs
    n_io_ports_ok = n_inputs_ok and n_outputs_ok
    if not n_io_ports_ok:
        raise Exception(
            f"ERROR # of Lsf io ports differ between CocoTB and RTL simulation:\n -> CocoTB expects (IN,OUT)=({cocotb_inputs},{cocotb_outputs})\n -> RTL expects (IN,OUT)=({len(input_fifos)},{len(output_fifos)})"
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
def lsf_test(dut):

    ##
    ## first grab the testbench configuration
    ##
    config = test_config.get_config()

    ##
    ## process input arguments for this test
    ##
    input_args = config["input_args"]
    test_vectors = config["testvectors"]
    num_events_to_process = int(input_args["n_events"])
    lsf_histogram_reset   = int(input_args["lsf_histogram_rst"])
    lsf_compute_results   = int(input_args["lsf_compute_results"])
    # TODO : FIll this correctly
    heg2sfslc_ii_tmp = test_vectors["inputs"][0]
    heg2sfhit_ii_tmp = test_vectors["inputs"][1]
    lsf_ctrl         = test_vectors["inputs"][2]
    heg2sfslc_ii = heg2sfslc_ii_tmp["heg2sfslc_ii"]
    heg2sfhit_ii = heg2sfhit_ii_tmp["heg2sfhit_ii"]
    loadlut_setup = heg2sfhit_ii_tmp["loadlut_setup"]
    hb_acc = heg2sfhit_ii_tmp["hb_acc"]
    max_hits = lsf_ctrl["max_hits"]
    num_hits_to_process = int(input_args["n_events"])
    num_rois_to_process = int(input_args["n_events"])
    event_level_detail_in_sumary = bool(input_args["event_detail"])
    run_config = config["run_config"]
    output_dir_name = run_config["output_directory_name"]
    output_dir = f"{os.getcwd()}/../../../../../test_output/{output_dir_name}"
    master_tv_file = test_config.get_testvector_file_from_config(config)
    testvector_config = config["testvectors"]
    testvector_config_inputs  = testvector_config["inputs"]
    testvector_config_outputs  = testvector_config["outputs"]
    inputs_station_id= [["" for x in range(LsfPorts.get_input_interface_ports(y))]for y in range(LsfPorts.n_input_interfaces)]
    outputs_station_id= [["" for x in range(LsfPorts.get_output_interface_ports(y))]for y in range(LsfPorts.n_output_interfaces)]
    sf2ptcalc_tol= [["" for x in range(LsfPorts.get_output_interface_ports(y))]for y in range(LsfPorts.n_output_interfaces)]
    for i in range(LsfPorts.n_input_interfaces):
        if "station_ID" in testvector_config_inputs[i] :
            inputs_station_id[i] = testvector_config_inputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
    for i in range(LsfPorts.n_output_interfaces):
        outputs_station_id[i] = testvector_config_outputs[i]["station_ID"]    # CREATORSOFTWAREBLOCK##
        sf2ptcalc_tol[i] = testvector_config_outputs[i]["tolerance"]

    ##
    ## setup the clock and start it
    ##
    sim_clock = Clock(dut.clock, int(input_args["clock_period"]),
                      input_args["clock_time_unit"])
    cocotb.fork(sim_clock.start())

    ##
    ## initialize the DUT to known state
    ##
    initialize_dut(dut, config)

    ##
    ## reset
    ##
    dut._log.info("Resetting DUT")
    yield reset(dut)

    ##
    ## initialize the Lsf block wrapper
    ##
    ## TODO : Needed?
    lsf_wrapper = wrapper.LsfWrapper(
        clock=dut.clock,
        name=f"LsfWrapper",
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
    for n_ip_intf in range(LsfPorts.n_input_interfaces):  # Add concept of interface
        for io in range(LsfPorts.get_input_interface_ports(n_ip_intf)):
            driver = FifoDriver(
                dut.input_spybuffers[sb_iport_index].spybuffer,
                dut.clock,
                                "Lsf",
                                input_tvformats[n_ip_intf],
                                str(io),
                                write_out=True,
                                out_dir=output_dir)
            sb_iport_index = sb_iport_index + 1
            lsf_wrapper.add_input_driver(driver, n_ip_intf,
                                              io)  #Add interface

    sb_oport_index = 0
    for n_op_intf in range(LsfPorts.n_output_interfaces):
        for io in range(LsfPorts.get_output_interface_ports(
                n_op_intf)):  #Outputs):
            active = True
            monitor = FifoMonitor(
                dut.output_spybuffers[sb_oport_index].spybuffer,
                                  dut.clock,
                                  "Lsf",
                                  output_tvformats[n_op_intf],
                                  str(io),
                                  callbacks=[],
                                  write_out=True,
                                  out_dir=output_dir)
            sb_oport_index = sb_oport_index + 1
            lsf_wrapper.add_output_monitor(monitor,
                                                n_op_intf,
                                                io,
                                                active=active)
    lsf_wrapper.sort_ports()

    #Read TV file
    tv_bcid_list = events.read_tv(
        filename=master_tv_file,
        n_to_load=num_events_to_process,
        region=0,
        side=3,#barrel
        sector=3#sector 3
        )


    ###Get Input Test Vector List for Ports across all input interfaces##
    input_tv_list = []
    single_interface_list = []
    single_interface_list_ii_delay_tmp =  []
    single_interface_list_ii_delay =  []
    i_eof = []

    for n_ip_intf in range(LsfPorts.n_input_interfaces):  # Add concept of interface
        if input_tvtype[n_ip_intf] != "control" :
            single_interface_list = (events.parse_tvlist(
                tv_bcid_list,
                tvformat=input_tvformats[n_ip_intf],
                n_ports=LsfPorts.get_input_interface_ports(n_ip_intf),
                n_to_load=num_events_to_process,
                station_ID=inputs_station_id[n_ip_intf],
                tv_type=input_tvtype[n_ip_intf]
            ))
        else:
            single_interface_list = []
            #i_eof.append(0)
            for i in range (num_events_to_process):
                i_eof.append(1)
                #print("i_eof=",i_eof)
            single_interface_list.append(i_eof)

        if(n_ip_intf == 0):
            single_interface_list_ii_delay = events.modify_tv(single_interface_list, heg2sfslc_ii)
            for io in range(LsfPorts.get_input_interface_ports(n_ip_intf)):  #Outputs):
                input_tv_list.append(single_interface_list_ii_delay[io])
        elif(n_ip_intf == 1):          
            hits_in_event = []  
            hits_zero_padding = []
            for io in range (len(single_interface_list)):
                for e_i in range(len(single_interface_list[io])):
                    hits_in_event.append(len(single_interface_list[io][e_i]))
                    hits_zero_padding.append(heg2sfslc_ii - heg2sfhit_ii*hits_in_event[e_i] - loadlut_setup)
                #print("io = ",io," hits_in_event = ",hits_in_event)
                #print("*********************************")
                
                single_interface_list_ii_delay_tmp = events.modify_tv(single_interface_list[io], heg2sfhit_ii)
                #add zeros
                single_interface_list_ii_delay_tmp2 = events.modify_tv_padzeroes(single_interface_list_ii_delay_tmp,'begin',loadlut_setup)
                single_interface_list_ii_delay      = events.modify_tv_padzeroes(single_interface_list_ii_delay_tmp2,'end',hits_zero_padding)
                single_interface_list_ii_delay_flat = events.flatten_list(single_interface_list_ii_delay)
            for io in range(LsfPorts.get_input_interface_ports(n_ip_intf)):  #Outputs):
                input_tv_list.append(single_interface_list_ii_delay_flat[io])
        elif(n_ip_intf == 2) : #Control signals, i_eof
            i_eof_zero_padding = loadlut_setup + max_hits * 2
            i_eof_ii           = heg2sfslc_ii
            #print("Control single_interface_list ",single_interface_list)
            #single_interface_list_ii_delay = events.modify_tv_padzeroes(single_interface_list,'begin',hb_acc_stop)
            single_interface_list_ii_delay_tmp = events.modify_tv(single_interface_list, i_eof_ii) # heg2sfslc_ii)# + lsf_histogram_reset) #hb_acc_stop + lsf_histogram_reset)
            single_interface_list_ii_delay     = events.modify_tv_padzeroes(single_interface_list_ii_delay_tmp,'begin',i_eof_zero_padding) #hb_acc_stop)
            input_tv_list.append(single_interface_list_ii_delay[0])
            #print("Control",single_interface_list_ii_delay[0])


###Get Output Test Vector List for Ports across all output interfaces##
    output_tv_list = []
    single_interface_list = []
    for n_op_intf in range(LsfPorts.n_output_interfaces):  # Add concept of interface
        single_interface_list = (events.parse_tvlist(
            tv_bcid_list,
            tvformat=output_tvformats[n_op_intf],
            n_ports=LsfPorts.get_output_interface_ports(n_op_intf),
            n_to_load=num_events_to_process,
            station_ID=inputs_station_id[n_ip_intf],
            tv_type="value"
        ))
        #print("single_interface_list",single_interface_list)
        output_tv_list.append(single_interface_list)
    #print("output_tv_list",output_tv_list[0])

    ##
    ## send input events
    ##
    dut._log.info("Sending input events")
    send_finished_signal = lsf_wrapper.send_input_events(
        input_tv_list, n_to_send=num_events_to_process*heg2sfslc_ii)

    #print("lsf_test, Perform test vectors comparison 1",send_finished_signal)

    if not send_finished_signal:
        raise cocotb.result.TestFailure(
            f"ERROR Event sending timed out! Number of expected inputs with events = {len(send_finished_signal)}"
        )
    try:
        yield with_timeout(Combine(*send_finished_signal), num_events_to_process*2, "us")
    except Exception as ex:
        raise cocotb.result.TestFailure(
            f"ERROR Timed out waiting for events to send: {ex}")
    dut._log.info("Sending finished!")






    all_tests_passed = True
    recvd_events_intf = []
    ##
    ## perform testvector comparison test
    ##

    print("lsf_test, Perform test vectors comparison 4")
    #Load observed data from CocoTB FifoMonitor for each RTL SpyBuffer Output
    for n_op_intf in range(LsfPorts.n_output_interfaces):
        recvd_events = [[
            "" for x in range(num_events_to_process)
        ] for y in range(LsfPorts.get_output_interface_ports(n_op_intf))]
        for n_oport, oport in enumerate(
                lsf_wrapper.output_ports(n_op_intf)):

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

#     #Ordering based on events (Required by TV package)
#     event_ordering = [[
#         "" for x in range(LsfPorts.get_output_interface_ports(0))
#     ] for y in range(num_events_to_process)]

#     # hexlist = [hex(int(str(x),2)) for x in recvd_events_intf]
#     # print("recvd_events_intf",recvd_events_intf)

#     for n_op_intf in range(LsfPorts.n_output_interfaces):
#         for e_idx in range(num_events_to_process):
#             for o_port in range(
#                     LsfPorts.get_output_interface_ports(n_op_intf)):
#                 event_ordering[e_idx][o_port] = recvd_events_intf[n_op_intf][
#                     o_port][e_idx]

#             # print(output_tvformats[n_op_intf],"event_ordering[e_idx]",event_ordering[e_idx]);
#             events_are_equal = events.compare_BitFields(
#                 master_tv_file, output_tvformats[n_op_intf],
#                 LsfPorts.get_output_interface_ports(n_op_intf), e_idx,
#                 event_ordering[e_idx],
#                 outputs_station_id[n_op_intf][0]
#                 )

#             all_tests_passed = (all_tests_passed and events_are_equal)
#             # define requirements for the bitfield package for comparisons
#             # use sf2ptcalc_tolerances to find falures
#             # bitfield function (SF2PTCALC_LSF) that compares all the fields and returns percentage of disagreement for each field
#             #need to be able to pass rtl_tv to the bitfieldword class and make the comparison there
    pass_count = 0
    fail_count = 0
    field_fail_cnt_header = []
    field_fail_cnt        = []
    field_fail_cnt_header.clear()
    field_fail_cnt.clear()
    for n_op_intf in range (LsfPorts.n_output_interfaces):
        events_are_equal, pass_count_i , fail_count_i, field_fail_count_i = events.compare_BitFields(tv_bcid_list, output_tvformats[n_op_intf],LsfPorts.get_output_interface_ports(n_op_intf) , num_events_to_process , recvd_events_intf[n_op_intf], sf2ptcalc_tol[n_op_intf],output_path=output_dir,stationNum=events.station_name_to_id(outputs_station_id[n_op_intf][0]));
        all_tests_passed = (all_tests_passed and events_are_equal)
        pass_count       = pass_count + pass_count_i
        fail_count       = fail_count + fail_count_i
        field_fail_cnt_header.append([output_tvformats[n_op_intf] +" "+ "FIELDS", "FAIL COUNT"])
        field_fail_cnt.append(field_fail_count_i)



    events.results_summary(
        num_events_to_process,
        pass_count,
        fail_count,
        LsfPorts.n_output_interfaces,
        field_fail_cnt_header,
        field_fail_cnt
    )

    cocotb_result = {
        True: cocotb.result.TestSuccess,
        False: cocotb.result.TestFailure
    }[all_tests_passed]
    raise cocotb_result
