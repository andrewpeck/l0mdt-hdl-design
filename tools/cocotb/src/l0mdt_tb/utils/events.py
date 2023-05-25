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
    # print("IACOPO - _event_belongs_to_sectorID ",
    #       "sectorID" , sectorID,
    #       "icand",icand,
    #       "station_ID = ", station_ID, 
    #       "station_num =", station_num)
    if(station_num == -99):
        sl_trailer = DF[icand].getBitFieldWord("SL_TRAILER", "")
    elif station_ID != "EXT": #EXT station not supported by TV generator
        sl_trailer = DF[station_num].getBitFieldWord("SL_TRAILER", "")
    else:        
        print ("TV does not exist for station ID = ", station_ID)
        return 2; #DF not supported yet (example for EXT station), TODO - check behavior - will probably infer zeroes

    fiber_id = sl_trailer[0].get_field_bits("fiberid")
    evt_sector_id = fiber_id + 1
    #print("IACOPO@AAA events.py: sectorID = ",sectorID," fiber_id = ",fiber_id," evt_sector_id =",evt_sector_id)
    if sectorID == evt_sector_id:
        
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
        df_type="SL",
        port=0,
        keep_bitfieldword=False,
):
    BF_list  = []
    returnVal = [] 
    
    # print("IACOPO - this is get_bitfield, \n",
    #       "tv_type :",tv_type,
    #       "station_id :", station_id,
    #       "df_type :", df_type,
    #       "bitfieldname :", bitfieldname)
    
    ### Extract BitFieldWord using methods of DataFormat() and save it as list (BF_list)
    if df_type == "SL":
        BF_list = (event.DF_SL[candidate].getBitFieldWord(bitfieldname, station_id))
    elif df_type == "MDT":
        if tv_type=="list_nested_tdc":
            ### Case of nested list containing per-mezz information 
            ### e.g. [ [ [ [] for _ in range(self.maxn_mezz) ] for _ in range(self.maxn_csm) ] for _ in range (self.maxn_layer) ]
            ### used by TDCPOLMUX2TAR, TAR2HPS        
            csm_id = port % 6 ### Done up to 6 as the 7th should not be filled as the RTL has 6*4 channels
            BF_list = event.DF_MDT[0].getBitFieldWord(bitfieldname, station_id, csm_id)
        else:
            ###
            ### NB: This is temporary!!! 
            raise NotImplementedError("Not sure if it's used for current tests")    
            BF_list = event.DF_MDT[0].getBitFieldWord(bitfieldname,station_id)


    ### Extract the content of BF_list to a list of bitwordvalues (or copy them if keep_bitfieldword=True)
    if tv_type == "list" or tv_type=="list_nested_tdc":
        ### Case of list of bitfieldwords
        for BF in BF_list:
            if not keep_bitfieldword:
                returnVal.append(BF.get_bitwordvalue())
            else:
                returnVal.append(BF)
        if len(returnVal)==0:
            returnVal=[0]        
    else:        
        ### Case of tvtype is scalar-type
        if len(BF_list)==0:
            returnVal = 0
        else:
            if not keep_bitfieldword:
                returnVal = BF_list[0].get_bitwordvalue()
            else:
                returnVal = BF_list[0]


    return returnVal


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
    
            
def compare_BitFields_new(tv_bcid_list, tvformat, n_ports, n_events, rtl_tv, tolerances,output_path="./",stationNum=[-99], tv_thread_mapping=[0,1,2], tv_type="value",tv_df_type="SL",pad_size=0):

    """
    Extracts BitFieldWord objects from simulated TV (using get_bitfield) and compares them with output TV from RTL.
    
    Event per event, candidate per candidate, it does the following:
     - retrieves the DataFormat object from Simulated TV
     - builds a DataFormat object that is filled each time with RTL information
     - compares the bitfield from the two above
    
    Arguments
        tv_bcid_list      : sim tv in this bcid
        tvformat          : test vector format (from json file)
        n_ports           : usually the number of output ports in current output interface
        n_events          : num of events to process
        rtl_tv            : tv as output from rtl
        tolerances        : dictionary for tolerances - used for comparison
        output_path       : output dir where to store comparison data csv files
        stationNum        : map from port to [0,1,2,3] (i.e. [inn, mid, out, ext])
        tv_thread_mapping : only used by multi-threading rtl, otherwise [ 0 for _ in range(len(n_candidates)) ]
        tv_type           : type of testvector, can be value, list, list_nested_tdc, etc
        tv_df_type        : type of DataFormat that should be considered, either SL" or "MDT"
        pad_size          : length of an event (used to get the right item from rtl_tv)
    """

    ### Useful map port number -> staion ID
    stationID = [ station_id_to_name(stationNum[iPort]) if (stationNum[0]!= -99) else -99 for iPort in range(n_ports) ]

    ### Counters
    events_are_equal = True
    pass_count           = 0
    fail_count           = 0
    station_failure_cnt  = {} ## initialized during loop
    station_failure_list = {} ## initialized during loop


    ### Loop over events, ports
    for iEvent in range(n_events):
        for iPort in range(n_ports):                
            
            ### Retrieve expected bitfieldword
            l_EXP_BF = get_bitfield(tv_bcid_list[iEvent], 
                                  tvformat, 
                                  tv_thread_mapping[iPort], 
                                  stationID[iPort], 
                                  tv_type=tv_type, 
                                  df_type=tv_df_type, 
                                  port=iPort,
                                  keep_bitfieldword=True)
            
            
            ### Add one layer, to behave identically in case of lists or scalars
            if not (tv_type == "list" or tv_type=="list_nested_tdc"):
                l_EXP_BF = [EXP_BF]                

            
            ### Skip case in which both are placeholders (nothing to compare)
            if (l_EXP_BF==[0] and rtl_tv[iPort][iEvent]==0):
                continue

            ### Event identifier
            print(tv_bcid_list[iEvent].header.dump()) 

            ### Loop over entry matching this event/port
            ### if tvtype is not a list (or list_nested_tdc) the following will be done once
            for ii in range(len(l_EXP_BF)):                

                if len(l_EXP_BF) > 1:
                    print(f" Word {1+ii} of {len(l_EXP_BF)} for this event:") 

                ### This EXP BitFieldWord
                EXP_BF = l_EXP_BF[ii]
                
                ### Create RTL BitFieldWord and fill it with output value
                RTL_BF = EXP_BF.copy()
                ii_rtl = ii + (iEvent * pad_size) # index along rtl_tv taking pad_size into account
                RTL_BF.set_bitwordvalue(rtl_tv[iPort][ii_rtl])
                
                ### Comparison and table printouts
                results = EXP_BF.compare_bitwordvalue( RTL_BF, tolerances )
                print(tabulate(results[1], results[2], tablefmt="psql"))
                ### Print table results
                if results[0]:
                    cprint("\tPass: RTL Matches expected  value", "green")
                    pass_count = pass_count + 1
                else:
                    cprint("\tFail: Mismatch in RTL and expected value", "red")
                    fail_count = fail_count + 1
                    events_are_equal = False
                print("\n\n")

                ### Done comparison, storing error count and useful info
                ### Initialize dictiornaries storing failures per station
                if stationID[iPort] not in station_failure_cnt.keys():
                    station_failure_cnt[stationID[iPort]] = { field.name : 0 for field in EXP_BF.fields }                    
                if stationID[iPort] not in station_failure_list.keys():
                    station_failure_list[stationID[iPort]] = []

                ### Storing failure for this station
                fail_index  = results[2].index("FAIL")
                for row in results[1]:     
                    station_failure_cnt[stationID[iPort]][row[0]] += row[fail_index]
                    
                ### Data going in csv files
                station_failure_list[stationID[iPort]].append( tvtools.make_list(
                    results[1],
                    results[2],
                    tv_bcid_list[iEvent].header.get_header(),
                    EXP_BF.fields,
                    iPort,
                    True)
                )

    ### Save csv with per-station comparison data
    Path(output_path).mkdir(parents=True, exist_ok=True)    
    ##header = tvtools.get_pd_headers(EXP_BF, tv_df_type=="SL")
    header = tvtools.get_pd_headers(EXP_BF, True)
    for station in station_failure_list.keys():
        df_file_name =  os.path.join( output_path, "DF_" + tvformat + ( "_"+station if station!="NONE" else "") + ".csv" )
        df_data = pd.DataFrame(station_failure_list[station], columns = header)        
        df_data.to_csv(df_file_name)
        print(f"Saving comparison data to {df_file_name}")
                                

    return events_are_equal, pass_count, fail_count, station_failure_cnt
            

def compare_BitFields(tv_bcid_list, tvformat, n_candidates, e_idx, rtl_tv, tolerances,output_path="./",stationNum=[-99], tv_thread_mapping=[0,1,2]):
    evt                = 0
    ret_val            = 1
    pass_count         = 0
    fail_count         = 0
    RTL_DFSL           = DataFormat()
    EXP_DF             = []
    tv_format_val      = []
    tv_format_bf       = []
    comparison_data    = []
    pp_comparison_list = {}
    tv_format_failure_cnt = {}
    station_failure_cnt   = {}
    
    RTL_DFSL.build_data_format()


    stationNum_internal = []
    stationID           = []
    if stationNum[0] == -99:    #Some dataformats don't belong to any station (E.g. UCM2PL)
        for this_candidate in range(n_candidates):
            stationNum_internal.append(-99)
    else:
        stationNum_internal = stationNum

    for this_candidate in range(n_candidates):
        stationID.append(station_id_to_name(stationNum_internal[this_candidate]))
        tv_format_bf.append(RTL_DFSL.getBitFieldWord(tvformat,  stationID[this_candidate]))
        pp_comparison_list[stationID[this_candidate]] = []
        for object in tv_format_bf[this_candidate]:
            for field in object.fields:
                tv_format_failure_cnt[field.name] = 0
        station_failure_cnt[stationID[this_candidate]] = tv_format_failure_cnt

    print ("tv_format_failure_cnt = ",tv_format_failure_cnt)
    print ("station_failure_cnt = ",station_failure_cnt)
    print ("stationID = ", stationID)

    for ievent in range(len(tv_bcid_list)):
        if evt == e_idx:
            break
        else:
            print("\nEvent: ", ievent)
            for this_candidate in range(n_candidates):
                #print ("this_candidate = ", this_candidate, " thread id = ", tv_thread_mapping[this_candidate], " tv_format = ",tvformat)
                if _event_belongs_to_sectorID(tv_bcid_list[ievent].DF_SL, icand=tv_thread_mapping[this_candidate] == 1, station_ID = stationID[this_candidate]): #TODO - Need to handle EXT station 
                    EXP_DF.clear()
                    RTL_DFSL.clear()
                    tv_format_val.clear()
                    comparison_data.clear()

                    EXP_DF = tv_bcid_list[ievent].DF_SL.copy()               #For comparing hits, will have to look at DF_MDT
                    EXP_BF = EXP_DF[tv_thread_mapping[this_candidate]].getBitFieldWord(tvformat, stationID[this_candidate])


                    if evt + 1 <= len(rtl_tv[this_candidate]):
                        if('x' in str(rtl_tv[this_candidate][evt])):
                            print("Certain or all Bitfields in dataformat ",tvformat," are unknown: ", rtl_tv[this_candidate][evt])
                            rtl_tv_i =  0
                        else:
                            rtl_tv_i = rtl_tv[this_candidate][evt]
                    else:
                        rtl_tv_i = 0

                    tv_format_bf[this_candidate][0].set_bitwordvalue(rtl_tv_i)
                    tv_format_val.append(tv_format_bf[this_candidate][0].get_bitwordvalue())
                    if (stationID[this_candidate] != "NONE"):
                        print("IACOPO - 1 - stationID[this_candidate]",stationID[this_candidate])
                        RTL_DFSL.fillBitFieldWord(tvformat, stationID[this_candidate], tv_format_val)
                        RTL_BF = RTL_DFSL.getBitFieldWord(tvformat, stationID[this_candidate])
                    else:
                        print("IACOPO - 2 -stationID[this_candidate]",stationID[this_candidate])
                        RTL_DFSL.fillBitFieldWord(tvformat, data=tv_format_val,stationID="INN") ## using INN as dummy, will not do anything
                        RTL_BF = RTL_DFSL.getBitFieldWord(tvformat)

                    print("IACOPO -  stationID",stationID)
                    RTL_BF[0].set_bitwordvalue(tv_format_val[0])
                    # print("events.py: EXP_BF=",EXP_BF[0])
                    #print("events.py: RTL_BF=",RTL_BF[0].print_bitFieldWord())
                    #print("events.py ==== Calling DF Print:")
                    #RTL_DFSL.print_summary()



                    results = EXP_BF[0].compare_bitwordvalue(
                        RTL_BF[0], tolerances
                    )  # compare_bitfieldwordvalue returns list
                    if stationNum[this_candidate] != -99:
                        print("\n\tSL candidate at port ", this_candidate, ":\t",tvformat,", Station:",stationID[this_candidate], "HexVal: 0x",f'{int(str(rtl_tv_i),2):X}')
                    else:
                        print("\n\tSL candidate at port", this_candidate, ":\t",tvformat, "HexVal: 0x",f'{int(str(rtl_tv_i),2):X}')

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


                    fail_index                     = results[2].index("FAIL")
                    tv_format_failure_cnt          = station_failure_cnt[stationID[this_candidate]]
                    for row in results[1]:                        
                        tv_format_failure_cnt[row[0]] += row[fail_index]
                    station_failure_cnt[stationID[this_candidate]] = tv_format_failure_cnt  

                    #tmp_DF    = tv_bcid_list[ievent].DF_SL[0].getBitFieldWord(tvformat, stationID)
                    tv_header_bf      = EXP_DF[0].getBitFieldWord(tvformat, stationID[this_candidate])
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
                        pp_comparison_list[stationID[this_candidate]].append(comparison_data[i])

                    if this_candidate == n_candidates - 1:
                        evt = evt + 1
                    EXP_BF.clear()
                    RTL_BF.clear()


    Path(output_path).mkdir(parents=True, exist_ok=True)    
    for key in pp_comparison_list.keys():
        df_data = pd.DataFrame(pp_comparison_list[key], columns = pd_columns_header)
        if key != "NONE":
            df_file_name = output_path + "/DF_"+tvformat+"_"+key+".csv"
        else:
            df_file_name = output_path + "/DF_"+tvformat+".csv"
        df_data.to_csv(df_file_name)
        print("Saving Comparison data to %s " % df_file_name)

    return ret_val, pass_count, fail_count, station_failure_cnt

            

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
        cnd_thrd_id =[0xabcd],
        zero_padding_size = 0,
        prepend_zeros = 0,
        keep_bitfieldword = False,
):
    """
    Read tv list, parse input for SpyBuffers

    Arguments          :
     tv_bcid_list      : what was read by read_tv()
     tvformat          : testvector format
     n_ports           : n of ports for this interface
     endian            : endianness (little is default)
     load_timing_info  : not implemented
     station_ID        : list mapping port to station id
     tv_type           : testvector type (e.g. value)
     tv_df_type        : "SL" or "MDT", relates to TVformat
     cnd_thrd_id       : used for multithreading, [0xabcd] is a default dummy
                         which is replaced with [0 for _ in range(n_ports)] if not used
     zero_padding_size : Append zeros at the end of each event to reach this number of words
                         This is relevant when multiple words should be processed in an event.
     prepend_zeros     : Number of zeros to prepend before the actual words of the event are sent
                         useful if a delay between two TV interfaces is needed (e.g. HPS)
    """
        
    events_list = tv_bcid_list

    
    print("parse_tvlist - ", "station_ID", station_ID)
    print("parse_tvlist - ", "cnd_thrd_id", cnd_thrd_id)
    print("parse_tvlist - ", "tv_type", tv_type)
    print("parse_tvlist - ", "tv_df_type", tv_df_type)

    print("n_to_load", n_to_load)
    print("n_ports",n_ports)
    print("events.py VALUE for dataformat (tvformat) ", tvformat)

    

    tv = [["" for x in range(n_to_load)] for y in range(n_ports)]
    my_cnd_thrd_id = [0 for x in range(n_ports)] 
    valid_events = 0

    ## Support multi-threaded RTL
    ## Otherwise fill as [ 0 for _ in range(n_ports) ]
    if cnd_thrd_id[0] == 0xabcd :
        for my_port in range(n_ports):                
            my_cnd_thrd_id[my_port] = my_port
    else:
        my_cnd_thrd_id = cnd_thrd_id
    
    print(f"IACOPO - before reading events, total events: {len(events_list)}, to load {n_to_load}")
    
    for ievent in range(len(events_list)):  # range(n_to_load):

        if valid_events < n_to_load:
            print(f"\n\n\n{40*'-'}\nIACOPO - event {ievent} started\n{40*'-'}")
            print("IACOPO - ievent",events_list[ievent])
            print("IACOPO - ievent.DF_SL",events_list[ievent].DF_SL)
            print("IACOPO - ievent.DF_MDT",events_list[ievent].DF_MDT)

            if tvformat=="TDCPOLMUX2TAR":
                print(f"manually printing TDCPOLMUX2TAR  for this event",events_list[ievent].DF_MDT[0].av_TDCPOLMUX2TAR)

            event_found_for_port_interface = 0            
            for my_port in range(n_ports):                
                if station_ID == [""]:
                        this_station_ID = ""
                else:
                    this_station_ID = station_ID[my_port]

                #print("Events.py: tvformat = ",tvformat, " my_port = ", my_port, "station_ID=", this_station_ID)

                ### Check if events has SLc in this sector, 
                ### This check is useless and can probably be removed with new TV output files (saved per sector).
                if _event_belongs_to_sectorID(events_list[ievent].DF_SL, icand=my_cnd_thrd_id[my_port], station_ID=this_station_ID):
                    if this_station_ID=="EXT":
                        # EXT does not exist in TV, set everything to 0 for the moment
                        tv[my_port][valid_events]=0
                    else:
                        tv[my_port][valid_events] = get_bitfield(events_list[ievent], tvformat, my_cnd_thrd_id[my_port], this_station_ID, tv_type = tv_type , df_type=tv_df_type, port=my_port, keep_bitfieldword=keep_bitfieldword)
                        event_found_for_port_interface = 1
                    
                        # Increase dimensionality if scalar type and need to do padding
                        if tv_type == 'value' and (zero_padding_size > 0 or prepend_zeros > 0):
                            tv[my_port][valid_events] = [tv[my_port][valid_events]]

                    #print("SECTOR OK - TVFORMAT = ",tvformat, "thread", my_cnd_thrd_id[my_port]," tv[",my_port,"][",valid_events,"]=",tv[my_port][valid_events])
                            
            ### Prepend zeros
            if prepend_zeros > 0:
                for my_port in range(n_ports):
                    tv[my_port][valid_events] =  (prepend_zeros * [0]) + tv[my_port][valid_events]
                    #print("PREPEND ZEROS = ",tvformat," tv[",my_port,"][",valid_events,"]=",tv[my_port][valid_events])


            ### Append zeros
            if zero_padding_size > 0:
                for my_port in range(n_ports):
                    if station_ID[my_port] != "EXT":
                        n_to_append = zero_padding_size - len(tv[my_port][valid_events])
                        if n_to_append < 0:
                            raise ValueError(f"Zero-padding size ({zero_padding_size}) smaller than actual event: {len(tv[my_port][valid_events])}")
                        tv[my_port][valid_events] +=  n_to_append * [0]
                    else:
                        tv[my_port][valid_events] = zero_padding_size * [0]

                    print("SECTOR OK - TVFORMAT = ",tvformat," tv[",my_port,"][",valid_events,"]=",tv[my_port][valid_events])

            if event_found_for_port_interface > 0:
                valid_events = valid_events + 1
        else:
            print("\n\n\n\n\n\n IACOPO - called break, loaded requested events")
            break

    if valid_events < n_to_load :        
        print (" ****************************************")
        print (" ****************************************")
        print ("ERROR:CANNOT run ", n_to_load, " events. Total events available in TV file is = ",valid_events)
        print (" ****************************************")
        print (" ****************************************")
        raise Exception("Exiting due to Errors")

    if tv_type == "list_nested_tdc" or (zero_padding_size > 0) or (prepend_zeros > 0) :
        for my_port in range(n_ports):
            tv[my_port] = flatten_list( tv[my_port] )[0]

    print("IACOPO _ print tv _ BEGIN")
    print("\n".join([str(x) for x in tv]))
    print("IACOPO _ print tv _ END")
    return tv


def modify_tv(tv, ii):
    ### Assuming tv is list of list
    ### Append zeros to each sub-list
    ### to get the size equal to ii
    tv_out = []
    print("in modify_tv - BEFORE:",tv)
    for io in range(len(tv)):
        tv_port = []
        tv_index = 0
        #print("events.py :modify_tv (tv,ii) =", tv , ii)
        for i in range(len(tv[io])):
            #print("modify_tv (io,i) = (",io,i,")")
            tv_port.append(tv[io][i])
            for j in range(ii - 1):
                tv_index = tv_index + 1
                tv_port.append(0)
        tv_out.append(tv_port)
    print("in modify_tv - AFTER:",tv_out)

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

def station_list_name_to_id(station_id=[""]):
    station_list = []
    for i in range(len(station_id)):
        station_list.append(station_name_to_id(station_id[i]))
    return station_list

def station_id_to_name(station_id=0):
    switcher = {0: "INN", 1: "MID", 2: "OUT", 3: "EXT", -99:"NONE"}
    return switcher.get(station_id, -99)


def results_summary( total_events, total_pass, total_fail, total_dataformats, field_fail_header, field_fail_cnt, total_ports=1):
    print ("\n=========================================================\n")
    print ("\t\t\t TEST RESULTS SUMMARY\n")
    print("Total Pass/Fail of Fields in DataFormats being tested -")
    header_idx = 0
    for df_i in range (total_dataformats):
        for key in field_fail_cnt[df_i].keys():
            df_bitfield_errors = field_fail_cnt[df_i][key]
            print(tabulate(df_bitfield_errors.items(), field_fail_header[header_idx], tablefmt="psql"))
            header_idx = header_idx + 1

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
        
