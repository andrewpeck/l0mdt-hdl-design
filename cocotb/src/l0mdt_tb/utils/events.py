import os
import struct
from pathlib import Path

from l0mdt_tb.utils import utils
import cocotb
from TVReader import tv_reader_pkl
from DataFormats.data_format import DataFormat
from TVDataFormat.bit_stream import BitFieldWord
from TVDataFormat.BX_data import BXData
import pandas as pd
from tabulate import tabulate
from termcolor import colored, cprint









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
                    time_match = timing_filename.split("/")[-1].replace(
                        "_timing.txt", ""
                    )
                    if data_match != time_match:
                        raise Exception(
                            f"ERROR Timing file (={timing_filename}) does not match with expected corresponding data file (={corresponding_data_file})"
                        )
                if "time_unit" in line.lower():
                    time_unit = line.strip().split(":")[-1]
                    yield time_unit
                continue
            yield line





def _event_belongs_to_sectorID(DF, sectorID=3, icand=0):

    sl_trailer    = DF[icand].getBitFieldWord("SL_TRAILER","")
    fiber_id      = sl_trailer[0].get_field_bits("fiberid")
    evt_sector_id = fiber_id + 1

    if(sectorID == evt_sector_id):
        #print("events.py: sectorID = ",sectorID," fiber_id = ",fiber_id," evt_sector_id =",evt_sector_id)
        return 1
    else:
        return 0




def get_bitfield_element(DF_list, bitfieldname, candidate=0, station_id=""):
    bf_list    = []
    sl_trailer = []
    for DF in DF_list:
        bf_list.append(DF.getBitFieldWord(bitfieldname,station_id))
        #bf_list.append(tv_reader_pkl.getBitFieldWord(DF, bitfieldname))
        #    print("KEY=",bitfieldname)

    if candidate < len(bf_list):
        for bf in bf_list[candidate]:
            return bf.get_bit_value();
    else:
        #print("ERROR.. candidate not present in RAW TV file")
        return -1


    #    for i in range(len(bf_list)):
    #    for bf in bf_list[i]:
    #        #hex_wordvalue = "{:#40X}".format(bf.get_bit_value())
    #        #hex_wordvalue = bf.get_bit_value()
    #        #print("%s: %s" %(bf.wordname, hex_wordvalue))
    #        if i == candidate:
    #            return bf.get_bit_value() #hex_wordvalue
    #print("ERROR.. candidate not present in RAW TV file")
    #return -1

#/*************
#rtl_tv is two dimensional array for each interface. It it data received from Monitors for all ports across single output interface
#Array size is defined by -> rtl_tv[number of ports in interfaces][number_of_events]
#For Example for ptcalc it would be expected_tv[events run][1],as output event has only one port

#**************/
def compare_BitFields(filename,tvformat,n_candidates, e_idx, rtl_tv):
    path = Path(filename)
    ok = path.exists() and path.is_file()
    if not ok:
        raise Exception(f"Cannot find provided file {filename}")

    #print("compare_BitFields: PARSING FOR TVFORMAT  = ",tvformat, " ", path)
    #tv_reader_pkl.setup_debug_devel(10)
    events_list = tv_reader_pkl.read_TV(path)


    RTL_DF_list = []
    RTL_BF_LIST = []
    for evt in range(e_idx):
        RTL_DF = BXData(NSLMAX=n_candidates)
        #print( "compare_BitFields: Create RTL_DF_list entry for event ",evt, "n_candidates = ",n_candidates)
        for i in range(n_candidates):
            attr_value_bitword = getattr(RTL_DF.DF_SL[i], tvformat)  # BitFieldWord
            attr_value_bitword.set_bit_value(rtl_tv[i][evt]) #(0xbabecafebabecafe) #rtl_tv)
            RTL_BF_LIST = RTL_DF.DF_SL[i].getBitFieldWord(tvformat)
            #print("RTL_BF_LIST***********= rtl_tv[i][evt] = 0x%x"%(rtl_tv[i][evt]))
            #print("RTL_BF_LIST[] = ",RTL_BF_LIST)
            #print("{n_candidates,e_idx} = {",n_candidates,",",e_idx,"}, {i,evt} = {",i,",",evt, "} len(rtl_tv[",i,"] = ",len(rtl_tv[i])," len(RTL_DF) = ",len(RTL_DF.DF_SL))
        RTL_DF_list.append(RTL_DF)
        #print("RTL_DF_list[",evt,"] = ",RTL_DF_list)


    #print(RTL_BF_LIST[0]) #print does not work for bit width = 193

    #print("Comparing %s LENGTH of SL1 = %d RTL_DF_LIST len = %d" % (tvformat, len(SL1), len(RTL_DF_list)))
    #    print(SL1[0])



    evt     = 0
    ret_val = 1
    #for SL1, RTL1 in zip(events_list[e_idx].DF_SL,RTL_DF_list[e_idx].DF_SL) :
    for ievent in range(len(events_list)): #range(total_transactions):
        if(evt == e_idx):
            break
        else:
            for this_candidate in range(n_candidates):
                #print ("events.py A: {evt,this_candidate,e_idx,ievent} = {", evt,this_candidate, e_idx, ievent,"}")
                if _event_belongs_to_sectorID(events_list[ievent].DF_SL,icand=this_candidate):
                    SL1   = events_list[ievent].DF_SL[this_candidate]
                    RTL1  = RTL_DF_list[evt].DF_SL[this_candidate]
                    local_sl1 = SL1.getBitFieldWord(tvformat)
                    local_sl2 = RTL1.getBitFieldWord(tvformat)
                    #print ("events.py: {evt,this_candidate,e_idx,ievent} = {", evt,this_candidate, e_idx, ievent,"} local_sl1 = ",local_sl1, "Length = ",len(local_sl1), " Length sl2 = ",len(local_sl2))
                    #hex_wordvalue = "{:#40X}".format(local_sl1[i].get_bit_value())
                    #print("\nEvents.py: %s: %s" % (local_sl2[i].wordname, hex_wordvalue))

                    print("Sector 3 Event:",evt," Candidate=",this_candidate, "TVFORMAT=",tvformat)
                    results = local_sl1[0].compare_bitwordvalue(local_sl2[0])  #compare_bitfieldwordvalue returns list
                    if results[0]:
                        cprint("The 2 BitFieldWords are identical ", "green")
                    else:
                        cprint("The 2 BitFieldWords differ", "red")
                        #print(results[1])
                        print(tabulate(results[1], results[2], tablefmt="psql"))
                        ret_val = 0
                    if this_candidate == n_candidates - 1:
                        evt = evt + 1

    return ret_val


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

    # AT temp to select the relevant event from Barrel Sector 3
    #B3_event_list = [107, 153, 10, 3] #220, 189

    #l0ids_loaded = set()
    #    print("PARSING FOR TVFORMAT = ",tvformat)
    # tv_reader_pkl.setup_debug_devel(10)
    events_list = tv_reader_pkl.read_TV(path)

    # print("VALUE for dataformat ", tvformat, " = ", getattr(events_list[0][0],"HPS_LSF_INN"))
    total_transactions =  n_to_load #len(events_list)
    tv = [["" for x in range(total_transactions)] for y in range(n_ports)]
    b3_events_i = 0;

    #    tv_reader_pkl.dump_event(events_list[0])
    for ievent in range(len(events_list)): #range(total_transactions):
        if b3_events_i < total_transactions:
            event_found_for_port_interface = 0
            for my_port in range(n_ports):
                if _event_belongs_to_sectorID(events_list[ievent].DF_SL,icand=my_port):
                    #print ("parse_file_for_testvectors: ievent = ", ievent)
                    event_found_for_port_interface = 1
                    if(station_ID == [""]):
                        this_station_ID = ""
                    else:
                        this_station_ID = station_ID[my_port]

                        #print("Transaction %d, Candidate %d total_transactions %d tvformat=%s" %(ievent,my_port,total_transactions,tvformat))
                    if(this_station_ID == ""):
                        tv[my_port][b3_events_i] = get_bitfield_element(events_list[ievent].DF_SL,tvformat,my_port,this_station_ID)
                    else:
                        tv[my_port][b3_events_i] = get_bitfield_element(events_list[ievent].DF_SL,tvformat,0,this_station_ID)
                    #print("PARSING FOR TVFORMAT = ",tvformat," tv[",my_port,"][",b3_events_i,"]=",tv[my_port][b3_events_i])
            if event_found_for_port_interface :
                b3_events_i = b3_events_i + 1
        else:
            break

    return tv


def modify_tv (tv, ii):
    tv_out   = []

    for io in range (len(tv)):
        tv_port  = []
        tv_index = 0
        #print("modify_tv (tv,ii) =", tv , ii)
        for i in range(len(tv[io])):
            #print("modify_tv (io,i) = (",io,i,")")
            tv_port.append(tv[io][i])
            for j in range (ii - 1):
                tv_index             = tv_index + 1
                tv_port.append(0)
        tv_out.append(tv_port)
    return tv_out
