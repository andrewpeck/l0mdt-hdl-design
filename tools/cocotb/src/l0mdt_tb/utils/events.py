import os
import struct
from pathlib import Path

from l0mdt_tb.utils import utils
import cocotb
import cocotb.binary as Binary
import TVReader.tv_reader_tools as tvtools
from DataFormats.data_format import DataFormat
from TVDataFormat.bit_stream import BitFieldWord
from TVDataFormat.BX_data import BXData
import pandas as pd
from tabulate import tabulate
from termcolor import colored, cprint

import logging
import logging.config



def timing_file_from_data_filename(data_file):

    path = Path(data_file)
    filedir = path.parents[0]
    timing_filename = data_file.split("/")[-1].replace(
        ".evt", "_timing.txt"
    )  # NOTE this is an expected naming convention
    timing_file = Path(filedir) / timing_filename

    ok = timing_file.exists() and timing_file.is_file()
    if not ok:
        raise Exception(f"ERROR Timing information file (={timing_file}) not found")
    return str(timing_file)


def timing_info_gen(filename):

    timing_filename = timing_file_from_data_filename(filename)
    with open(timing_filename, "r") as ifile:
        for iline, line in enumerate(ifile):
            line = line.strip()
            if "info" in line.lower():
                if "data_file" in line.lower():
                    corresponding_data_file = line.strip().split(":")[-1]
                    data_match = corresponding_data_file.replace(".evt", "")
                    time_match = timing_filename.split("/")[-1].replace("_timing.txt", "")
                    if data_match != time_match:
                        raise Exception(
                            f"ERROR Timing file (={timing_filename}) does not match with expected corresponding data file (={corresponding_data_file})"
                        )
                if "time_unit" in line.lower():
                    time_unit = line.strip().split(":")[-1]
                    yield time_unit
                continue
            yield line


def _event_belongs_to_sectorID(DF, sectorID=3, icand=0, station_ID=""):

    station_num = station_name_to_id(station_ID)
    if(station_num == -99):
        sl_trailer = DF[icand].getBitFieldWord("SL_TRAILER", "")
    else:
        sl_trailer = DF[station_num].getBitFieldWord("SL_TRAILER", "")
    fiber_id = sl_trailer[0].get_field_bits("fiberid")
    evt_sector_id = fiber_id + 1

    if sectorID == evt_sector_id:
        #print("events.py: sectorID = ",sectorID," fiber_id = ",fiber_id," evt_sector_id =",evt_sector_id)
        return 1
    else:
        return 0



# #/*************
# #rtl_tv is two dimensional array for each interface. It it data received from Monitors for all ports across single output interface
# #Array size is defined by -> rtl_tv[number of ports in interfaces][number_of_events]
# #For Example for ptcalc it would be expected_tv[1][events_run],as output event has only one port

# **************/


def get_bitfield_element(DF_list, bitfieldname, candidate=0, station_id=""):
    bf_list = []
    sl_trailer = []
    bf_hit_list = []
    hit_list = []

    for DF in DF_list:
        bf_list.append(DF.getBitFieldWord(bitfieldname, station_id))


        # bf_list.append(tv_reader_pkl.getBitFieldWord(DF, bitfieldname))
        #    print("KEY=",bitfieldname)
    print("BIT FIELDWORD LIST LEN = ",len(bf_list)," candidate =",candidate, "bitfieldname=",bitfieldname)
    if candidate < len(bf_list):
        for bf in bf_list[candidate]:
            return bf.get_bitwordvalue()
    else:
        # print("ERROR.. candidate not present in RAW TV file")
        return -1


def get_bitfield_list(event, bitfieldname, candidate=0, station_id=""):
    bf_list        = []
    sl_trailer     = []
    bf_hit_list    = []
    candidate_id   = 0
    station_num    = station_name_to_id(station_id)
    if bitfieldname == 'HEG2SFHIT':
        DF_list = event.DF_SL
    elif bitfieldname == 'TAR2HPS': #In this case candidate is actually chamber number
        DF_list = event.DF_MDT

    hit_list = []
    print("Candidate=",candidate," station_num=",station_num," DF Length = ",len(DF_list), "Total Chambers = ", DF_list[0].get_nMDT(station_num), " LENGTH = ", len(DF_list[station_num].av_TAR2HPS))

    if bitfieldname == 'HEG2SFHIT': #In this case candidate is thread
        for DF_hit in DF_list[candidate].av_HEG2SFHIT[station_num]:
            hit_list.append(DF_hit.bitwordvalue)

    elif bitfieldname == 'TAR2HPS': #In this case candidate is actually chamber number
        if candidate < len(DF_list[station_num].av_TAR2HPS):  #Check with Anyes, how to determine number of chambers????
            for DF_hit in DF_list[station_num].av_TAR2HPS[candidate]:
                hit_list.append(DF_hit.bitwordvalue)
        if len(hit_list) == 0:
            hit_list = [0]

    print("Candidate=",candidate," HIT LIST = ",hit_list)
    #bf_hit_list.append(hit_list)
    return hit_list


    #elif bitfieldname == 'TAR2HPS': #In this case candidate is actually chamber number
    #    for DF_hit in DF.av_TAR2HPS[station_name_to_id(station_id)]:
    #        print ("AV_TAR2HPS = ", DF_hit)
    #        hit_list.append(DF_hit.bitwordvalue)

 #   for DF in DF_list:
 #       candidate_id += 1
 #       bf_list.append(DF.getBitFieldWord(bitfieldname, station_id))
 #       hit_list = []
 #       if bitfieldname == 'HEG2SFHIT':
 #           for DF_hit in DF.av_HEG2SFHIT[station_name_to_id(station_id)]:
 #               hit_list.append(DF_hit.bitwordvalue)
 #       elif bitfieldname == 'TAR2HPS': #In this case candidate is actually chamber number
 #           for DF_hit in DF.av_TAR2HPS[station_name_to_id(station_id)]:
 #               print ("AV_TAR2HPS = ", DF_hit)
 #               hit_list.append(DF_hit.bitwordvalue)



        # print("PRINT LIST OF HITS FOR CANDIDATE",candidate_id,"station_id",station_id)


   # if candidate < len(bf_list):
   #     return bf_hit_list[candidate]
   # else:
   #     # print("ERROR.. candidate not present in RAW TV file")
   #     return -1


def compare_BitFields(tv_bcid_list, tvformat, n_candidates, e_idx, rtl_tv, tolerances,output_path="./",stationNum=-99):
    """
    path = Path(filename)
    ok = path.exists() and path.is_file()
    if not ok:
        raise Exception(f"Cannot find provided file {filename}")
    """
    events_list        = tv_bcid_list
    evt                = 0
    ret_val            = 1
    pass_count         = 0
    fail_count         = 0
    RTL_DFSL           = DataFormat()
    SL1                = DataFormat()
    data               = []
    tv_format_val      = []
    comparison_data    = []
    pp_comparison_list = []
    df_fields          = []
    tv_format_failure_cnt = {}



    RTL_DFSL.build_data_format()
    SL1.build_data_format()
    if stationNum == -99:    #Dataformats that are common for all stations (E.g. UCM2PL)
        stationNum_internal = 0
    else:
        stationNum_internal = stationNum


    tv_format_df = SL1.getBitFieldWord(tvformat, station_id_to_name(stationNum_internal))
    for object in tv_format_df:
        for field in object.fields:
            tv_format_failure_cnt[field.name] = 0


    # for SL1, RTL1 in zip(events_list[e_idx].DF_SL,RTL_DF_list[e_idx].DF_SL) :
    for ievent in range(len(events_list)):  # range(total_transactions):
        if evt == e_idx:
            break
        else:
            print("\nEvent: ", ievent)
            for this_candidate in range(n_candidates):
                #print ("events.py A: {evt,this_candidate,e_idx,ievent} = {", evt,this_candidate, e_idx, ievent,"}")
                if _event_belongs_to_sectorID(events_list[ievent].DF_SL, icand=this_candidate):
                    SL1.clear()
                    tv_format_val.clear()
                    data.clear()
                    RTL_DFSL.clear()
                    comparison_data.clear()

                    SL1 = events_list[ievent].DF_SL[this_candidate].copy()
                    local_sl1 = SL1.getBitFieldWord(tvformat, RTL_DFSL.suffix[stationNum_internal])


                    tv_format_val = RTL_DFSL.getBitFieldWord(tvformat, RTL_DFSL.suffix[stationNum_internal])
                    if evt + 1 <= len(rtl_tv[this_candidate]):
                        if('x' in str(rtl_tv[this_candidate][evt])):
                            print("Certain or all Bitfields in dataformat ",tvformat," are unknown: ", rtl_tv[this_candidate][evt])
                            rtl_tv_i =  0
                        else:
                            rtl_tv_i = rtl_tv[this_candidate][evt]
                    else:
                        rtl_tv_i = 0

                    tv_format_val[0].set_bitwordvalue(rtl_tv_i)
                    data.append(tv_format_val[0].get_bitwordvalue())  # need to give station

                    stationID = RTL_DFSL.suffix[stationNum_internal]
                    RTL_DFSL.fillBitFieldWord(tvformat, stationID, data)

                    local_sl2 = RTL_DFSL.getBitFieldWord(tvformat, stationID)
                    local_sl2[0].set_bitwordvalue(data[0])
                    #print("events.py: local_sl1=",local_sl1[0])
                    #print("events.py: local_sl2=",local_sl2[0].print_bitFieldWord())


                    #print("events.py ==== Calling DF Print:")
                    #RTL_DFSL.print_summary()



                    results = local_sl1[0].compare_bitwordvalue(
                        local_sl2[0], tolerances
                    )  # compare_bitfieldwordvalue returns list
                    if stationNum != -99:
                        print("\n\tSL candidate ", this_candidate, ":\t",tvformat,", Station:",stationID)
                    else:
                        print("\n\tSL candidate ", this_candidate, ":\t",tvformat)

                    if results[0]:
                        cprint("\tThe 2 BitFieldWords are identical ", "green")
                        print(events_list[ievent].header.dump())
                        print(tabulate(results[1], results[2], tablefmt="psql"))
                        pass_count = pass_count + 1
                    else:
                        cprint("\tThe 2 BitFieldWords differ", "red")
                        print(events_list[ievent].header.dump())
                        print(tabulate(results[1], results[2], tablefmt="psql"))
                        fail_count = fail_count + 1
                        ret_val = 0


                    fail_index = results[2].index("FAIL")
                    for row in results[1]:
                        tv_format_failure_cnt[row[0]] += row[fail_index]


                    tmp_DF    = events_list[ievent].DF_SL[0].getBitFieldWord(tvformat, stationID)
                    pd_columns_header = tvtools.get_pd_headers(tmp_DF[0], True)
                    this_data = tvtools.make_list(results[1], results[2], events_list[ievent].header.get_header(), local_sl1[0].fields, this_candidate, True)
                    comparison_data.append(this_data)

                    for i in range(0, len(comparison_data)):
                        pp_comparison_list.append(comparison_data[i])

                    if this_candidate == n_candidates - 1:
                        evt = evt + 1
                    local_sl1.clear()
                    local_sl2.clear()


    df_data = pd.DataFrame(pp_comparison_list, columns = pd_columns_header)
    Path(output_path).mkdir(parents=True, exist_ok=True)
    if stationNum != -99:
        df_file_name = output_path + "/DF_"+tvformat+"_"+stationID+".csv"
    else:
        df_file_name = output_path + "/DF_"+tvformat+".csv"
    df_data.to_csv(df_file_name)
    print("Saving Comparison data to %s " % df_file_name)



    return ret_val, pass_count, fail_count, tv_format_failure_cnt




def read_tv(filename, n_to_load, region=0, side=3, sector=3):
    path = Path(filename)
    ok = path.exists() and path.is_file()
    if not ok:
        raise Exception(f"Cannot find provided file {filename}")
    events_list = tvtools.read_TV(path)
    return events_list


def parse_tvlist(
    tv_bcid_list, tvformat, n_ports, n_to_load, endian="little", load_timing_info=False, station_ID=[""], tv_type=""
):
    """
    path = Path(filename)
    ok = path.exists() and path.is_file()
    if not ok:
        raise Exception(f"Cannot find provided file {filename}")
    """
    timing_gen = None
    time_units = None
    if load_timing_info:
        timing_gen = timing_info_gen(filename)
        time_units = next(timing_gen)  # first one returned is the time unit (str)

    events_list = tv_bcid_list

    # print("VALUE for dataformat ", tvformat, " = ", getattr(events_list[0][0],"HPS_LSF_INN"))
    total_transactions = n_to_load  # len(events_list)
    tv = [["" for x in range(total_transactions)] for y in range(n_ports)]
    b3_events_i = 0

    #    tv_reader_pkl.dump_event(events_list[0])
    for ievent in range(len(events_list)):  # range(total_transactions):
        if b3_events_i < total_transactions:
            event_found_for_port_interface = 0
            for my_port in range(n_ports):
                print("tvformat = ",tvformat, " my_port = ", my_port)
                if station_ID == [""]:
                        this_station_ID = ""
                else:
                    this_station_ID = station_ID[my_port]

                if _event_belongs_to_sectorID(events_list[ievent].DF_SL, icand=my_port, station_ID=this_station_ID):
                    #print ("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ parse_tvlist: ievent = ", ievent," BXData.header.event = ",events_list[ievent].header.event," BXData.header.run = ",events_list[ievent].header.run, " BXData.header.ientry = ",events_list[ievent].header.ientry)
                    #tvtools.dump_event(events_list,ievent)
                    #print(events_list[ievent].DF_SL[my_port].print_blocks())
                    event_found_for_port_interface = 1

                    #print("Transaction %d, Candidate %d total_transactions %d tvformat=%s tv_type=%s" %(ievent,my_port,total_transactions,tvformat,tv_type))

                    if tv_type == "list":
                        tv[my_port][b3_events_i] = get_bitfield_list(
                            events_list[ievent], tvformat, my_port, this_station_ID
                        )
                    else:
                        tv[my_port][b3_events_i] = get_bitfield_element(
                        events_list[ievent].DF_SL, tvformat, my_port, this_station_ID
                        )
                    # print("PARSING FOR TVFORMAT = ",tvformat," tv[",my_port,"][",b3_events_i,"]=",tv[my_port][b3_events_i])
            if event_found_for_port_interface:
                b3_events_i = b3_events_i + 1
        else:
            break

    return tv


def parse_file_for_testvectors(
    filename, tvformat, n_ports, n_to_load, endian="little", load_timing_info=False, station_ID=[""]
):

    path = Path(filename)
    ok = path.exists() and path.is_file()
    if not ok:
        raise Exception(f"Cannot find provided file {filename}")

    timing_gen = None
    time_units = None
    if load_timing_info:
        timing_gen = timing_info_gen(filename)
        time_units = next(timing_gen)  # first one returned is the time unit (str)

    events_list = tvtools.read_TV(path)

    # print("VALUE for dataformat ", tvformat, " = ", getattr(events_list[0][0],"HPS_LSF_INN"))
    total_transactions = n_to_load  # len(events_list)
    tv = [["" for x in range(total_transactions)] for y in range(n_ports)]
    b3_events_i = 0

    #    tv_reader_pkl.dump_event(events_list[0])
    for ievent in range(len(events_list)):  # range(total_transactions):
        if b3_events_i < total_transactions:
            event_found_for_port_interface = 0
            for my_port in range(n_ports):
                if _event_belongs_to_sectorID(events_list[ievent].DF_SL, icand=my_port):
                    print ("parse_file_for_testvectors: ievent = ", ievent," BXData.header.event = ",events_list[ievent].header.event )
                    event_found_for_port_interface = 1
                    if station_ID == [""]:
                        this_station_ID = ""
                    else:
                        this_station_ID = station_ID[my_port]

                        # print("Transaction %d, Candidate %d total_transactions %d tvformat=%s" %(ievent,my_port,total_transactions,tvformat))
                    if this_station_ID == "":
                        tv[my_port][b3_events_i] = get_bitfield_element(
                            events_list[ievent].DF_SL, tvformat, my_port, this_station_ID
                        )
                    else:
                        tv[my_port][b3_events_i] = get_bitfield_element(
                            events_list[ievent].DF_SL, tvformat, 0, this_station_ID
                        )
                    # print("PARSING FOR TVFORMAT = ",tvformat," tv[",my_port,"][",b3_events_i,"]=",tv[my_port][b3_events_i])
            if event_found_for_port_interface:
                b3_events_i = b3_events_i + 1
        else:
            break

    return tv


# needed for intefaces with lists of objects (i.e. hits)
def parse_file_for_testvectors_list(
    filename, tvformat, n_ports, n_to_load, endian="little", load_timing_info=False, station_ID=[""]
):

    path = Path(filename)
    ok = path.exists() and path.is_file()
    if not ok:
        raise Exception(f"Cannot find provided file {filename}")

    timing_gen = None
    time_units = None
    if load_timing_info:
        timing_gen = timing_info_gen(filename)
        time_units = next(timing_gen)  # first one returned is the time unit (str)

    events_list = tvtools.read_TV(path)

    # print("VALUE for dataformat ", tvformat, " = ", getattr(events_list[0][0],"HPS_LSF_INN"))
    total_transactions = n_to_load  # len(events_list)
    tv = [["" for x in range(total_transactions)] for y in range(n_ports)]
    b3_events_i = 0


    for ievent in range(len(events_list)):  # range(total_transactions):
        if b3_events_i < total_transactions:
            event_found_for_port_interface = 0
            for my_port in range(n_ports):
                if _event_belongs_to_sectorID(events_list[ievent].DF_SL, icand=my_port):
                    #print ("parse_file_for_testvectors: ievent = ", ievent," BXData.header.event = ",events_list[ievent].header.event )
                    event_found_for_port_interface = 1
                    if station_ID == [""]:
                        this_station_ID = ""
                    else:
                        this_station_ID = station_ID[my_port]

                        # print("Transaction %d, Candidate %d total_transactions %d tvformat=%s" %(ievent,my_port,total_transactions,tvformat))
                    if this_station_ID == "":
                        tv[my_port][b3_events_i] = get_bitfield_list(
                            events_list[ievent].DF_SL, tvformat, my_port, this_station_ID
                        )
                    else:
                        tv[my_port][b3_events_i] = get_bitfield_list(
                            events_list[ievent].DF_SL, tvformat, 0, this_station_ID
                        )
                    # print("PARSING parse_file_for_testvectors_list"," tv[",my_port,"][",b3_events_i,"]=",tv[my_port][b3_events_i])
            if event_found_for_port_interface:
                b3_events_i = b3_events_i + 1
        else:
            break

    return tv


def modify_tv(tv, ii):
    tv_out = []
    for io in range(len(tv)):
        tv_port = []
        tv_index = 0
        # print("modify_tv (tv,ii) =", tv , ii)
        for i in range(len(tv[io])):
            # print("modify_tv (io,i) = (",io,i,")")
            tv_port.append(tv[io][i])
            for j in range(ii - 1):
                tv_index = tv_index + 1
                tv_port.append(0)
        tv_out.append(tv_port)
    return tv_out


def flatten_list(tv):
    # tv_out = []
    print ("flatten_list tv =" , tv)
    tv_flat = [y for x in tv for y in x]
    tv_out = []
    print ("flatten_list tv_FLAT =" , tv_flat)
    tv_out.append(tv_flat)
    return tv_out


def prepend_zeroes(tv, num=1):
    tv_out = []

    for i in range(num):
        tv_out.append(0)
    for i in range(len(tv)):
        tv_out.append(tv[i])

    # print("modify_tv prepend (tv) =", tv )
    # print("modify_tv prepend (tv_out) =", tv_out )
    return tv_out


def modify_tv_padzeroes(tv, location="end", num=1):
    tv_out = []

    for io in range(len(tv)):
        tv_port = []
        tv_index = 0
        if location == "begin":
            for i in range(num):
                tv_port.append(0)
        for i in range(len(tv[io])):
            # print("modify_tv (io,i) = (",io,i,")")
            tv_port.append(tv[io][i])
        if location == "end":
            for i in range(num):
                tv_port.append(0)
        tv_out.append(tv_port)
    # print("modify_tv_padzeroes (tv) =", tv )
    # print("modify_tv_padzeroes (tv_out) =", tv_out )
    return tv_out


def timebased_lineup(observed_events, observed_time, num_events_to_process, n_ports):

    # print ("events.py: num_events_to_process = ",num_events_to_process," n_ports = ",n_ports)
    max_len = 0
    observed_events_o = [[0 for x in range(0, num_events_to_process)] for y in range(0, n_ports)]
    time_list = []

    for itime, time in enumerate(observed_time):
        time_list.extend(observed_time[itime])

    # Sort and remove duplicates in time_list
    sorted_time_list = sorted(set(time_list), key=lambda ele: time_list.count(ele))

    for port_o in range(len(observed_events)):
        for evt in range(num_events_to_process):
            if evt >= len(observed_time[port_o]) or len(observed_time[port_o]) == 0:
                observed_events_o[port_o][evt] = 0
            else:
                if observed_time[port_o][evt] == sorted_time_list[evt]:
                    observed_events_o[port_o][evt] = observed_events[port_o][evt]
                else:
                    observed_events_o[port_o][evt] = 0

    return observed_events_o


def station_name_to_id(station_id=""):
    switcher = {"INN": 0, "MID": 1, "OUT": 2, "EXT": 3, "NONE" : -99, "":-99}
    return switcher.get(station_id, "Invalid station")


def station_id_to_name(station_id=0):
    switcher = {0: "INN", 1: "MID", 2: "OUT", 3: "EXT"}
    return switcher.get(station_id, -99)


def results_summary( total_events, total_pass, total_fail, total_dataformats, field_fail_header, field_fail_cnt, total_ports=1):
    print ("\n=========================================================\n")
    print ("\t\t\t TEST RESULTS SUMMARY\n")
    print("Total Pass/Fail of Fields in DataFormats being tested -")
    for df_i in range (total_dataformats):
        print(tabulate(field_fail_cnt[df_i].items(), field_fail_header[df_i], tablefmt="psql"))

    print ("\t\t\t TEST RESULTS SUMMARY: Total Events=", total_events, "Total Ports = ",total_ports," Pass=",total_pass, "Fail=",total_fail,"\n")
    print ("\n=========================================================\n")
