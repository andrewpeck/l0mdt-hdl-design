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
from l0mdt_tb.utils.tv import tvRTL
import pandas as pd
from tabulate import tabulate
from termcolor import colored, cprint
from l0mdt_tb.utils.tv import tvRTL
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




def get_bitfield(
        event,
        bitfieldname,
        candidate=0,
        station_id="",
        tv_type="value",
        df_type="SL"
):
    BF_list  = []
    val_list = []

    if tv_type == "value":
        DF_list = event.DF_SL
    else:
        DF_list = event.DF_MDT

    if df_type == "SL":
        BF_list = (event.DF_SL[candidate].getBitFieldWord(bitfieldname, station_id))
    elif df_type == "MDT":
        station_num = station_name_to_id(station_id)
        BF_list = event.DF_MDT[station_num].getBitFieldWord(bitfieldname, station_id)

    for BF in BF_list:
        val_list.append(BF.get_bitwordvalue())

    if len(val_list) == 0:
        val_list = [0]

    if tv_type == "list":
        return val_list
    else:
        return val_list[0]


def print_BitFieldsInDataFormat(tvformat, tvformat_val, stationNum=-99):
    DFSL              = DataFormat()
    bitfieldWord = []
    bitfieldWordList = []
    
    DFSL.build_data_format()
    

    if stationNum == -99:    #Some dataformats don't belong to any station (E.g. UCM2PL)
        stationNum_internal = 0
    else:
        stationNum_internal = stationNum

    stationID    =  station_id_to_name(stationNum_internal)

  
    bitfieldWord = DFSL.getBitFieldWord(tvformat,stationID)
    bitfieldWord[0].set_bitwordvalue(tvformat_val)
    bitfieldWordList.append(bitfieldWord[0].get_bitwordvalue())
    
    DFSL.fillBitFieldWord(tvformat, stationID, bitfieldWordList)  
    BitFieldWord = DFSL.getBitFieldWord(tvformat,stationID)
    print(bitfieldWord[0].print_bitFieldWord())
   

def fill_tv_rtl(tvformats, tv_list, n_interfaces, n_ports, n_events_to_process,station_id=""):
    port_idx  = 0
    tvRTL_list = []
    
    for n_intf in range(n_interfaces): # Add concept of interface
        for io in range(n_ports[n_intf]):
            tvRTL_i    = tvRTL()
            for n_events in range(n_events_to_process):     
                if(station_id == ""):
                    tvRTL_i.set_tv(tv_list[port_idx][n_events], tvformats[n_intf])
                else:                    
                    tvRTL_i.set_tv(tv_list[port_idx][n_events], tvformats[n_intf],station=station_id[n_intf][io])
            tvRTL_list.append(tvRTL_i)
            #tvRTL_i.clear()
            port_idx = port_idx + 1

    print ("events.py: TV RTL")
    #for port_i in range(len(tvRTL_list)):
    #   tvRTL_p = tvRTL_list[port_i]
    #    tvRTL_p.print_tv()

    return tvRTL_list

def   print_tv_bitfields(tvRTL_list, print_this_event=-1): 
    port_idx  = 0
    print ("events.py: print_tv_bitfields")
    

    for port_i in range(len(tvRTL_list)):
        tvRTL_p = tvRTL_list[port_i]
        if print_this_event == -1 :
            print ("events.py: print_tv_bitfields: Printing ", len(tvRTL_p.tv_val), "events")
            for n_events in range(len(tvRTL_p.tv_val)):
                print_BitFieldsInDataFormat(tvRTL_p.df, tvRTL_p.tv_val[n_events], stationNum=station_name_to_id(tvRTL_p.station))
        else :
            print ("events.py: print_tv_bitfields: Printing event ", print_this_event)
            print_BitFieldsInDataFormat(tvRTL_p.df, tvRTL_p.tv_val[print_this_event], stationNum=station_name_to_id(tvRTL_p.station))
    
    

def print_tv_list(tvformats, tv_list, n_interfaces, n_ports, n_events_to_process,station_id="", event_number = -1):
    tvRTL_list = fill_tv_rtl(tvformats, tv_list, n_interfaces, n_ports, n_events_to_process,station_id)
    print_tv_bitfields(tvRTL_list) #, print_this_event = event_number)
    


   




def compare_BitFields(tv_bcid_list, tvformat, n_candidates, e_idx, rtl_tv, tolerances,output_path="./",stationNum=-99, tv_thread_mapping=[0,1,2]):
    evt                = 0
    ret_val            = 1
    pass_count         = 0
    fail_count         = 0
    RTL_DFSL           = DataFormat()
    EXP_DF             = []
    tv_format_val      = []
    tv_format_bf       = []
    comparison_data    = []
    pp_comparison_list = []
    tv_format_failure_cnt = {}

    RTL_DFSL.build_data_format()
    # EXP_DF.build_data_format()


    # if stationNum == -99:    #Some dataformats don't belong to any station (E.g. UCM2PL)
    #     stationNum_internal = 0
    # else:
    #     stationNum_internal = stationNum

    if stationNum == -99:    #Some dataformats don't belong to any station (E.g. UCM2PL)
        stationNum_internal = 0
    else:
        stationNum_internal = stationNum

    stationID    =  station_id_to_name(stationNum_internal)
    tv_format_bf = RTL_DFSL.getBitFieldWord(tvformat,  stationID)

    for object in tv_format_bf:
        for field in object.fields:
            tv_format_failure_cnt[field.name] = 0


    for ievent in range(len(tv_bcid_list)):
        if evt == e_idx:
            break
        else:
            print("\nEvent: ", ievent)
            for this_candidate in range(n_candidates):
                if _event_belongs_to_sectorID(tv_bcid_list[ievent].DF_SL, icand=tv_thread_mapping[this_candidate]):
                    EXP_DF.clear()
                    RTL_DFSL.clear()
                    tv_format_val.clear()
                    comparison_data.clear()

                    EXP_DF = tv_bcid_list[ievent].DF_SL.copy()               #For comparing hits, will have to look at DF_MDT
                    EXP_BF = EXP_DF[tv_thread_mapping[this_candidate]].getBitFieldWord(tvformat, stationID)


                    if evt + 1 <= len(rtl_tv[this_candidate]):
                        if('x' in str(rtl_tv[this_candidate][evt])):
                            print("Certain or all Bitfields in dataformat ",tvformat," are unknown: ", rtl_tv[this_candidate][evt])
                            rtl_tv_i =  0
                        else:
                            rtl_tv_i = rtl_tv[this_candidate][evt]
                    else:
                        rtl_tv_i = 0

                    tv_format_bf[0].set_bitwordvalue(rtl_tv_i)
                    tv_format_val.append(tv_format_bf[0].get_bitwordvalue())
                    RTL_DFSL.fillBitFieldWord(tvformat, stationID, tv_format_val)

                    RTL_BF = RTL_DFSL.getBitFieldWord(tvformat, stationID)
                    RTL_BF[0].set_bitwordvalue(tv_format_val[0])
                    # print("events.py: EXP_BF=",EXP_BF[0])
                    #print("events.py: RTL_BF=",RTL_BF[0].print_bitFieldWord())
                    #print("events.py ==== Calling DF Print:")
                    #RTL_DFSL.print_summary()



                    results = EXP_BF[0].compare_bitwordvalue(
                        RTL_BF[0], tolerances
                    )  # compare_bitfieldwordvalue returns list
                    if stationNum != -99:
                        print("\n\tSL candidate ", this_candidate, ":\t",tvformat,", Station:",stationID, "HexVal: 0x",f'{int(str(rtl_tv_i),2):X}')
                    else:
                        print("\n\tSL candidate ", this_candidate, ":\t",tvformat, "HexVal: 0x",f'{int(str(rtl_tv_i),2):X}')

                    if results[0]:
                        cprint("\tPass: RTL Matches expected  value", "green")
                        print(tv_bcid_list[ievent].header.dump())
                        print(tabulate(results[1], results[2], tablefmt="psql"))
                        pass_count = pass_count + 1
                    else:
                        cprint("\tFail: Mismatch in RTL and expected value", "red")
                        print(tv_bcid_list[ievent].header.dump())
                        print(tabulate(results[1], results[2], tablefmt="psql"))
                        fail_count = fail_count + 1
                        ret_val = 0


                    fail_index = results[2].index("FAIL")
                    for row in results[1]:
                        tv_format_failure_cnt[row[0]] += row[fail_index]


                    #tmp_DF    = tv_bcid_list[ievent].DF_SL[0].getBitFieldWord(tvformat, stationID)
                    tv_header_bf      = EXP_DF[0].getBitFieldWord(tvformat, stationID)
                    pd_columns_header = tvtools.get_pd_headers(tv_header_bf[0], True)
                    this_data         = tvtools.make_list(
                        results[1],
                        results[2],
                        tv_bcid_list[ievent].header.get_header(),
                        EXP_BF[0].fields,
                        this_candidate,
                        True)
                    comparison_data.append(this_data)

                    for i in range(0, len(comparison_data)):
                        pp_comparison_list.append(comparison_data[i])

                    if this_candidate == n_candidates - 1:
                        evt = evt + 1
                    EXP_BF.clear()
                    RTL_BF.clear()


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
        tv_bcid_list,
        tvformat,
        n_ports,
        n_to_load,
        endian="little",
        load_timing_info=False,
        station_ID=[""],
        tv_type="",
        tv_df_type="SL",
        cnd_thrd_id =[0xabcd]
):
    events_list = tv_bcid_list

    #print("events.py VALUE for dataformat ", tvformat, " = ", getattr(events_list[0][0],"HPS_LSF_INN"))


    tv = [["" for x in range(n_to_load)] for y in range(n_ports)]
    my_cnd_thrd_id = [0 for x in range(n_ports)] 
    valid_events = 0

    if cnd_thrd_id[0] == 0xabcd :
        for my_port in range(n_ports):                
            my_cnd_thrd_id[my_port] = my_port
    else:
        my_cnd_thrd_id = cnd_thrd_id
    
    #print("Events.py : my_cnd_thread_id = ",my_cnd_thrd_id)

    #    tv_reader_pkl.dump_event(events_list[0])
    for ievent in range(len(events_list)):  # range(n_to_load):
        if valid_events < n_to_load:
            event_found_for_port_interface = 0
            for my_port in range(n_ports):                
                if station_ID == [""]:
                        this_station_ID = ""
                else:
                    this_station_ID = station_ID[my_port]

                #print("Events.py: tvformat = ",tvformat, " my_port = ", my_port, "station_ID=", this_station_ID)

                if _event_belongs_to_sectorID(events_list[ievent].DF_SL, icand=my_cnd_thrd_id[my_port], station_ID=this_station_ID):
                    #print ("parse_tvlist: ievent = ", ievent," BXData.header.event = ",events_list[ievent].header.event," BXData.header.run = ",events_list[ievent].header.run, " BXData.header.ientry = ",events_list[ievent].header.ientry)
                    #tvtools.dump_event(events_list,ievent)
                    #print(events_list[ievent].DF_SL[my_port].print_blocks())
                    #print("Transaction %d, Candidate %d n_to_load %d tvformat=%s tv_type=%s" %(ievent,my_port,n_to_load,tvformat,tv_type))

                    event_found_for_port_interface = 1
                    tv[my_port][valid_events] = get_bitfield(
                        events_list[ievent], tvformat, my_cnd_thrd_id[my_port], this_station_ID, tv_type = tv_type , df_type=tv_df_type
                    )

                    # print("PARSING FOR TVFORMAT = ",tvformat," tv[",my_port,"][",valid_events,"]=",tv[my_port][valid_events])
            if event_found_for_port_interface:
                valid_events = valid_events + 1
        else:
            break

    if valid_events < n_to_load :        
        print (" ****************************************")
        print (" ****************************************")
        print ("ERROR:CANNOT run ", n_to_load, " events. Total events available in TV file is = ",valid_events)
        print (" ****************************************")
        print (" ****************************************")
        sys.exit("Exiting due to Errors")
    return tv


def modify_tv(tv, ii):
    tv_out = []
    for io in range(len(tv)):
        tv_port = []
        tv_index = 0
        print("events.py :modify_tv (tv,ii) =", tv , ii)
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
    tv_flat = [y for x in tv for y in x]
    tv_out = []
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


def append_zeroes(tv, num=1):
    tv_out = []

   
    for i in range(len(tv)):
        tv_out.append(tv[i])
    for i in range(num):
        tv_out.append(0)

    print("modify_tv input (tv) =", tv )
    print("modify_tv output (tv_out) =", tv_out )
    return tv_out


def modify_tv_padzeroes(tv, location="end", num=[]):
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
            if(len(num) > 0):
                for i in range(num[io]):
                    tv_port.append(0)
        tv_out.append(tv_port)
    print("modify_tv_padzeroes (tv) =", tv )
    print("modify_tv_padzeroes (tv_out) =", tv_out )
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


def get_hex_list(int_list):
    #print (int_list)
    
    hex_list = [hex(int(item)) for item in int_list]
    return hex_list


def get_n_dim_hex_list(int_list):
    hex_list    = []
    hex_list_2  = []
    
    for dim_i in range(len(int_list)):
        if type(int_list[dim_i][0]) == list :
            hex_list_2.append(hex_n_dim_list(int_list[dim_i]))
            hex_list.append(hex_list_2)
        else:
            hex_list.append(get_hex_list(int_list[dim_i]))
    return hex_list
        

def time_ordering(events, time, num_events):
    n_ports  = len(events)
    port_idx = [0 for x in range(n_ports)]
    o_events = [[0 for x in range(num_events)] for y in range(n_ports)]

    #find earliest time index across all ports
    
    for n_event in range(num_events):     
        #print("time = ", time)
        #print("events = ",events)

        #Find time which has first arrival of event
        cur_time = -1        
        for p_i in range(n_ports):           
            if(len(time[p_i]) >= 1):
                this_time = time[p_i][0]
            else:
                this_time = cur_time; 
                
            if(cur_time == -1):
                cur_time = this_time
            else :
                if(this_time < cur_time):
                    cur_time = this_time
                        
    
        #Update output list with events arriving at cur_time
        for p_i in range(n_ports):
            
            if(len(time[p_i]) >=  1):
                this_time = time[p_i][0]                                
            else:
                this_time = cur_time; 

            if(len(events[p_i]) >= 1):
               this_event = events[p_i][0]               
            else:
               this_event = 0
            

            if(this_time == cur_time):
                o_events[p_i][n_event] = this_event
                if(len(time[p_i]) >= 1):
                   time[p_i].pop(0)
                   events[p_i].pop(0)
            else:
                o_events[p_i][n_event] = 0
            

       
    #print("o_events = ", o_events)
    return o_events
                                                                    
        
def update_tv_bitfield(tv_list, tv_width,bitfield_val, msb, lsb):
    updated_tv_list = []
    field_width     = msb-lsb+1

    upper_ones      = (2 ** (tv_width - msb -1)) -1 

    if lsb != 0:
        lower_ones  = (2**(lsb-1))-1
    else:
        lower_ones  = 0


    bitfield_clr_mask   = (upper_ones << (msb+1)) + lower_ones 
    bitfield_or_mask    = bitfield_val << lsb


    #print ("update_tv_bitfield: bitfield_clr_mask = 0x", f'{int(bitfield_clr_mask):X}', "bitfield_or_mask = 0x", f'{int(bitfield_or_mask):X}')
    for i in range(len(tv_list)):
        #print ("INCOMING TV  = 0x", f'{int(tv_list[i]):X}')
        if tv_list[i] != 0:
            updated_tv_list.append( (tv_list[i] & bitfield_clr_mask) | bitfield_or_mask)
        else:
            updated_tv_list.append(0)

        #print ("Updated TV LIST = 0x", f'{int(updated_tv_list[i]):X}')
    return updated_tv_list
        
