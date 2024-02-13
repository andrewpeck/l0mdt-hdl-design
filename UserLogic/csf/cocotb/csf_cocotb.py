
import os
import random
import sys
from pathlib import Path
import ROOT
import argparse
from math import *
import matplotlib.pyplot as plt

import pytest
import statistics as stat

script_dir = os.path.dirname(__file__)
ROOT.gSystem.Load(script_dir + "/../../../build/libTVNtuple.so")
mymodule_dir = os.path.join(script_dir, '../../../dataformats', 'DataFormats')
sys.path.append(mymodule_dir)
os.makedirs("plots_CSF", exist_ok=True)



from Writer import *
from Utils import *

from l0mdt_buses_constants import *

import cocotb
from cocotb.runner import get_runner
from cocotb.triggers import Timer

class Heg2sfhitRt:
    def __init__(self, data_valid, mlayer, localx, localy, radius):
        self.data_valid = data_valid
        self.mlayer = mlayer
        self.localx = localx
        self.localy = localy
        self.radius = radius

class slc_muid_rt:
    def __init__(self, slcid, slid, bcid):
        self.slcid = slcid
        self.slid = slid
        self.bcid = bcid   

class vec_mdtid_rt:
    def __init__(self, chamber_id, chamber_ieta):
        self.chamber_id = chamber_id
        self.chamber_ieta = chamber_ieta

class heg2sfslc_rt:
    def __init__(self, data_valid, muid:slc_muid_rt, mdtseg_dest, mdtid:vec_mdtid_rt, vec_pos, vec_ang, hewindow_pos):
        self.data_valid = data_valid
        self.muid = muid
        self.mdtseg_dest = mdtseg_dest
        self.mdtid = mdtid
        self.vec_pos = vec_pos
        self.vec_ang = vec_ang
        self.hewindow_pos = hewindow_pos

class sf2ptcalc_RT:
    def _init(self, data_valid, muid:slc_muid_rt, mdtid:vec_mdtid_rt, seg_pos, seg_ang, seg_quality):
        self.data_valid = data_valid
        self.muid = muid
        self.mdtid = mdtid
        self.seg_pos = seg_pos
        self.seg_ang = seg_ang
        self.seg_quality = seg_quality        

@cocotb.test()
async def empty_basic_test(dut):
    
    
    #INPUT VARIABLES_____________________________________________
    nevents=int(os.getenv("n",-1))
    sector=int(os.getenv("s",3))
    block=os.getenv("b","ULL")
    hem=os.getenv("hem","A")
    bec=int(os.getenv("bec",0))
    o=int(os.getenv("o",-1))
    
    #FILE________________________________________________________
    chain = ROOT.TChain("i1","")
    chain.Add(script_dir + "/../data/TVNtuple.root/TVNt")
    


    nsegment = 0
    of_pos_list=[]
    pos_list=[]
    fw_pos_list=[]
    of_ang_list=[]
    ang_list=[]
    fw_ang_list=[]
    chamber_list=[]

    for test in chain:
        
        t=test.TV
        slcid1 = 0

        for mdtcand in t.v_mdtTP:
            
            slc = mdtcand.slc
            
            # Remove muon slc have too-low pT
            if nevents > -1 and nsegment >= nevents:
                break            
            if slc.ptThresh < 20:
                continue
   
            if slc.region == bec and slc.sector == sector and slc.side == 0:
                station_no = int(dut.mdt_station.value)
                count=0
                if nevents > -1 and nsegment >= nevents:
                    break
                vec=vec_mdtid_rt(chamber_id=mdtcand.a_slcStation[station_no].chamberID, chamber_ieta=mdtcand.a_slcStation[station_no].iEta)
                
                chamber_list.append(int(mdtcand.a_slcStation[station_no].chamberID))

                bc=mdtcand.a_slcStation[station_no].minBcid
                

                slc1=slc_muid_rt(slcid=slcid1, slid=0, bcid=bc)

                offsetX = abs(digitize(mdtcand.a_slcStation[station_no].offsetX,HEG2SFSLC_VEC_POS_MULT))
                x1=tan(mdtcand.a_slcStation[station_no].offsetTheta / 1000.)
                if(x1!=0):
                    mbar = abs(1. / x1)
                    digimbar = digitizeR(mbar, 1024)
                

                            
                heWindowX = abs(digitize(mdtcand.a_slcStation[station_no].heWindowX,HEG2SFSLC_HEWINDOW_POS_MULT))
                BCD_Dat = 1 
                BCD_Dest = 0

                BCD=heg2sfslc_rt(data_valid=BCD_Dat, muid=slc1, mdtseg_dest=BCD_Dest, mdtid=vec, vec_pos=offsetX, vec_ang=digimbar, hewindow_pos=heWindowX)

                
                tothits=0
                for hit in mdtcand.av_calHits[station_no]:
                    tothits+=1


                k=random.sample(range(1000),tothits)
                k=range(tothits)
                # k.sort()
                
                clkctr=0
                if nevents > -1 and nsegment >= nevents:
                    break      
                dut.clk.value=0
                if(o==-1 or o==nsegment+1):
                    for curr_time in range(1001):
                        dut.rst.value=0   
                        dut.glob_en.value=0
                        if(clkctr in k):
                            index=k.index(clkctr)                    
                            hit=mdtcand.av_calHits[station_no][index]
                        
                            count+=1
                            ad=abs(digitizeR(hit.dataValid,
                                                HEG2SFHIT_DATA_VALID_MULT))
                            alx =abs(digitizeR(hit.C_localX,
                                                HEG2SFHIT_LOCALX_MULT))
                            aly =abs( digitizeR(hit.C_localY,
                                                HEG2SFHIT_LOCALY_MULT))
                            ar = abs(
                                digitizeR(hit.offlDriftRadius,
                                        HEG2SFHIT_RADIUS_MULT))
                            am = t.v_rawHits[hit.idxRawHit].ML - 1

                            A = Heg2sfhitRt(data_valid=ad, mlayer=am, localx=alx, localy=aly, radius=ar)

                            dut.i_mdt_hit.data_valid.value = A.data_valid
                            dut.i_mdt_hit.mlayer.value = A.mlayer
                            dut.i_mdt_hit.localx.value = A.localx
                            dut.i_mdt_hit.localy.value = A.localy
                            dut.i_mdt_hit.radius.value = A.radius
                            
                            
                        else:
                            A = Heg2sfhitRt(data_valid=0, mlayer=0, localx=0, localy=0, radius=0)

                            dut.i_mdt_hit.data_valid.value = A.data_valid
                            dut.i_mdt_hit.mlayer.value = A.mlayer
                            dut.i_mdt_hit.localx.value = A.localx
                            dut.i_mdt_hit.localy.value = A.localy
                            dut.i_mdt_hit.radius.value = A.radius

                        if(clkctr==0):
                            dut.i_seed.data_valid.value=BCD.data_valid
                            dut.i_seed.muid.slcid.value=BCD.muid.slcid
                            dut.i_seed.muid.slid.value=BCD.muid.slid
                            dut.i_seed.muid.bcid.value=BCD.muid.bcid
                            dut.i_seed.mdtseg_dest.value=BCD.mdtseg_dest
                            dut.i_seed.mdtid.chamber_id.value=BCD.mdtid.chamber_id
                            dut.i_seed.mdtid.chamber_ieta.value=BCD.mdtid.chamber_ieta
                            dut.i_seed.vec_pos.value=BCD.vec_pos
                            dut.i_seed.vec_ang.value=BCD.vec_ang
                            dut.i_seed.hewindow_pos.value=BCD.hewindow_pos
                        else:
                            dut.i_seed.data_valid.value=0
                            dut.i_seed.muid.slcid.value=0
                            dut.i_seed.muid.slid.value=0
                            dut.i_seed.muid.bcid.value=0
                            dut.i_seed.mdtseg_dest.value=0
                            dut.i_seed.mdtid.chamber_id.value=0
                            dut.i_seed.mdtid.chamber_ieta.value=0
                            dut.i_seed.vec_pos.value=0
                            dut.i_seed.vec_ang.value=0
                            dut.i_seed.hewindow_pos.value=0

                        #clock----------------------------------------------------------------------------------
                        if(clkctr==0):
                            dut.i_eof.value=0
                        await Timer(1, units="ns")
                        dut.clk.value = 1
                        if(clkctr==999):
                            dut.i_eof.value = 1  
                        await Timer(1, units="ns")
                        if(clkctr==999):
                            dut.i_eof.value = 0
                        dut.clk.value = 0
                        clkctr+=1
                        #ENDCLK-----------------------------------------------------------------------------------
                    xoxo=0


                    while(True):
                        #clock--------------------------------------------------
                        await Timer(1, units="ns")
                        dut.clk.value = 1
                        await Timer(1, units="ns")
                        dut.clk.value = 0
                        # print(xoxo)
                        #clk_end-------------------------------------------------

                        if(dut.o_seg.data_valid==1 and dut.o_seg.segangle.value != "X"):                            
                            
                            seg=mdtcand.a_cdSeg[station_no]
                            ad=1
                            
                            alx =abs(digitizeR(seg.pos,
                                                SF2PTCALC_SEGPOS_MULT))
                            ang =abs( digitizeR(seg.angle,
                                                SF2PTCALC_SEGANGLE_MULT))
                            
                            pos_off =abs(digitizeR(seg.off_pos,
                                                SF2PTCALC_SEGPOS_MULT))
                            ang_off =abs( digitizeR(seg.off_angle,
                                                SF2PTCALC_SEGANGLE_MULT))
                            qual = abs(
                                digitizeR(seg.quality,
                                        SF2PTCALC_SEGQUALITY_MULT))
                            

                            print("\n event:", nsegment, "################################")
                            print("MBAR %f %d " % (mbar, digimbar))
                            print("pos:", int(pos_off), int(alx), int(dut.o_seg.segpos.value))
                            print("angle:", int(ang_off), int(ang), int(dut.o_seg.segangle.value))
                            print("quality:", int(qual), int(dut.o_seg.segquality.value))


                            of_ang_list.append(float(ang_off)/SF2PTCALC_SEGANGLE_MULT)
                            ang_list.append(float(ang)/SF2PTCALC_SEGANGLE_MULT)
                            fw_ang_list.append(float(dut.o_seg.segangle.value)/SF2PTCALC_SEGANGLE_MULT)

                            of_pos_list.append(float(pos_off)/SF2PTCALC_SEGPOS_MULT)
                            pos_list.append(float(alx)/SF2PTCALC_SEGPOS_MULT)
                            fw_pos_list.append(float(dut.o_seg.segpos.value)/SF2PTCALC_SEGPOS_MULT)

                            # assert dut.o_seg.segpos.value == alx
                            # assert dut.o_seg.segangle.value == ang
                            # assert dut.o_seg.segquality.value == qual

                            break
                        xoxo+=1

                if(o>-1 and nsegment==o):
                    return   
                              
                nsegment += 1
                slcid1 += 1


    of_ang_err=[]
    sw_ang_err=[]
    of_ang_err_ab=[]
    sw_ang_err_ab=[]
    sw_of_ang_err_ab=[]

    of_pos_err=[]
    sw_pos_err=[]
    of_pos_err_ab=[]
    sw_pos_err_ab=[]
    sw_of_pos_err_ab=[]

    for item in range(len(pos_list)):
        if(fw_ang_list[item]>0):
            of_ang_err.append(abs((fw_ang_list[item]-of_ang_list[item])/fw_ang_list[item])*100)
            sw_ang_err.append(abs((fw_ang_list[item]-ang_list[item])/fw_ang_list[item])*100)

            of_ang_err_ab.append(abs((fw_ang_list[item]-of_ang_list[item])))
            sw_ang_err_ab.append(abs((ang_list[item]-fw_ang_list[item])))
            sw_of_ang_err_ab.append(abs((of_ang_list[item]-ang_list[item])))
        else:
            of_ang_err.append(0)
            sw_ang_err.append(0)

            of_ang_err_ab.append(abs((fw_ang_list[item]-of_ang_list[item])))
            sw_ang_err_ab.append(abs((ang_list[item]-fw_ang_list[item])))
            sw_of_ang_err_ab.append(abs((of_ang_list[item]-ang_list[item])))


        if(fw_pos_list[item]>0):
            of_pos_err.append(abs((fw_pos_list[item]-of_pos_list[item])/fw_pos_list[item])*100)
            sw_pos_err.append(abs((pos_list[item]-fw_pos_list[item])/fw_pos_list[item])*100) 

            of_pos_err_ab.append(abs((fw_pos_list[item]-of_pos_list[item])))
            sw_pos_err_ab.append(abs((pos_list[item]-fw_pos_list[item])))
            sw_of_pos_err_ab.append(abs((pos_list[item]-of_pos_list[item])))
        else:
            of_pos_err.append(0)
            sw_pos_err.append(0)  

            of_pos_err_ab.append(abs((fw_pos_list[item]-of_pos_list[item])))
            sw_pos_err_ab.append(abs((pos_list[item]-of_pos_list[item])))


    # plt.title("%_error in off_pos VS FW_pos")
    
    # plt.scatter(fw_pos_list,of_pos_err)
    # plt.ylim([0,100])
    # plt.xlim([0,40000])
    # plt.xlabel("FW_POS")
    # plt.ylabel("%_error in OFF_POS")
    # plt.savefig("../plots_CSF/%_error in off_pos_VS_FW_pos.png")
    # plt.clf() 
              
    # plt.title("%_error in sw_pos VS fW_pos")
    
    # plt.scatter(fw_pos_list,sw_pos_err)
    # plt.ylim([0,100])
    # plt.xlim([0,40000])
    # plt.xlabel("FW_POS")
    # plt.ylabel("%_error in SW_POS")
    # plt.savefig("../plots_CSF/%_error in sw_pos_VS_FW_pos.png")
    # plt.clf() 
                          
    # plt.title("%_error in off_ang VS fw_ang")
    # plt.scatter(fw_ang_list,of_ang_err)
    # plt.ylim([0,100])
    # plt.xlabel("fw_ang")
    # plt.ylabel("%_error in OFF_ang")
    # plt.savefig("../plots_CSF/%_error in off_ang_VS_FW_ang.png")
    # plt.clf() 
                          
    # plt.title("%_error in sw_ang VS fw_ang")
    # plt.scatter(fw_ang_list,sw_ang_err)
    # plt.ylim([0,100])
    # plt.xlabel("fw_ang")
    # plt.ylabel("%_error in sw_ang")
    # plt.savefig("../plots_CSF/%_error in sw_ang_VS_fW_ang.png")
    # plt.clf()     

    plt.title("error in off_pos histogram")
    ax=plt.subplot()
    a=plt.hist(of_pos_err_ab, bins=50,range=[0, 200])
    m=stat.mean(of_pos_err_ab)
    stddev=stat.stdev(of_pos_err_ab)
    square=[ent**2 for ent in of_pos_err_ab]
    rms=sqrt(sum(square)/len(square))
    plt.text(0.7,0.8,'mean=%f\nstandard dev=%f\nrms=%f'%(m,stddev,rms),transform=ax.transAxes)
    plt.xlabel("OFF_POS_ERROR")
    plt.ylabel("error in OFF_POS")
    plt.savefig("../plots_CSF/error in off_pos histo.png")
    plt.clf() 
              
    plt.title("error in sw_pos histogram")
    a=plt.hist(sw_pos_err_ab,bins=50,range=[0, 200])
    m=stat.mean(sw_pos_err_ab)
    stddev=stat.stdev(sw_pos_err_ab)
    square=[ent**2 for ent in sw_pos_err_ab]
    rms=sqrt(sum(square)/len(square))
    plt.text(0.7,0.8,'mean=%f\nstandard dev=%f\nrms=%f'%(m,stddev,rms),transform=ax.transAxes)
    plt.xlabel("sW_POS_ERROR")
    plt.ylabel("error in SW_POS")
    plt.savefig("../plots_CSF/error in sw_pos histo.png")
    plt.clf() 

    plt.title("error in off_pos vs sw_pos histogram")
    ax=plt.subplot()
    a=plt.hist(sw_of_pos_err_ab, bins=50,range=[0, 200])
    m=stat.mean(sw_of_pos_err_ab)
    stddev=stat.stdev(sw_of_pos_err_ab)
    square=[ent**2 for ent in sw_of_pos_err_ab]
    rms=sqrt(sum(square)/len(square))
    plt.text(0.7,0.8,'mean=%f\nstandard dev=%f\nrms=%f'%(m,stddev,rms),transform=ax.transAxes)
    plt.xlabel("SW_OFF_POS_ERROR")
    plt.ylabel("error in SW_OFF_POS")
    plt.savefig("../plots_CSF/error in sw_off_pos histo.png")
    plt.clf() 
              

    plt.title("error in off_ang histogram")
    a=plt.hist(of_ang_err_ab,bins=50,range=[0, 1.2])
    m=stat.mean(of_ang_err_ab)
    stddev=stat.stdev(of_ang_err_ab)
    square=[ent**2 for ent in of_ang_err_ab]
    rms=sqrt(sum(square)/len(square))
    plt.text(0.7,0.8,'mean=%f\nstandard dev=%f\nrms=%f'%(m,stddev,rms),transform=ax.transAxes)   
    plt.xlabel("OFF_ANG_ERROR")
    plt.ylabel("error in OFF_ang")
    plt.savefig("../plots_CSF/error in off_ang histo.png")
    plt.clf() 
                          
    plt.title("error in sw_ang histogram")
    a=plt.hist(sw_ang_err_ab,bins=50,range=[0, 1.2])
    m=stat.mean(sw_ang_err_ab)
    stddev=stat.stdev(sw_ang_err_ab)
    square=[ent**2 for ent in sw_ang_err_ab]
    rms=sqrt(sum(square)/len(square))
    plt.text(0.7,0.8,'mean=%f\nstandard dev=%f\nrms=%f'%(m,stddev,rms),transform=ax.transAxes)   
    plt.xlabel("sW_ANG_ERROR")
    plt.ylabel("error in SW_ang")
    plt.savefig("../plots_CSF/error in sw_ang histo.png")
    plt.clf()

    plt.title("error in sw_ang vs of_ang histogram")
    a=plt.hist(sw_of_ang_err_ab,bins=50,range=[0, 1.2])
    m=stat.mean(sw_of_ang_err_ab)
    stddev=stat.stdev(sw_of_ang_err_ab)
    square=[ent**2 for ent in sw_of_ang_err_ab]
    rms=sqrt(sum(square)/len(square))
    plt.text(0.7,0.8,'mean=%f\nstandard dev=%f\nrms=%f'%(m,stddev,rms),transform=ax.transAxes)   
    plt.xlabel("SW_OF_ANG_ERROR")
    plt.ylabel("error in SW_OF_ang")
    plt.savefig("../plots_CSF/error in sw_of_ang histo.png")
    plt.clf()

    eff=0
    for ele in range(len(of_ang_err_ab)):
        if(of_ang_err_ab[ele]< 0.006 and of_pos_err_ab[ele] < 5):
            eff+=1

    tot_eff=eff/len(of_ang_err_ab)

    print("Efficiency =>", tot_eff)



def csf_cocotb():
    
    
    hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "vhdl")
    sim = os.getenv("SIM", "questa")

    parser = argparse.ArgumentParser(
        description=
        'pass the generics. '
    )
    parser.add_argument(
        "-s",
        "--mdt_station",
        help="mdt_station",
        default=0)
    args = parser.parse_args()

    proj_path = Path(__file__).resolve().parent
    top_path = Path(__file__).resolve().parent / "../../../"

    vhdl_sources = []
    verilog_sources = []
    build_args = []

    if hdl_toplevel_lang == "vhdl":
        vhdl_sources1 = [
            
            top_path / "shared/types/common_ieee_pkg.vhd",
            top_path / "dataformats/l0mdt_constants_pkg.vhd",
            top_path / "dataformats/l0mdt_dataformats_pkg.vhd",
            top_path / "shared/types/common_constants_pkg.vhd",
            top_path / "shared/types/common_types_pkg.vhd",
            top_path / "shared/functions/vhdl2008/vhdl2008_functions_pkg.vhd",
            # top_path / "shared/detector_parameters/dp_repo//detector_param_pkg.vhd",
            top_path / "shared/detector_parameters/fw_parameters//detector_time_param_pkg.vhd",
            top_path / "shared/detector_parameters/functions/fct_barrel_R_rpc_pkg.vhd",
            top_path / "shared/vhdl_utilities/pkg/vhdl_tb_utils_pkg.vhd",
            top_path / "shared/config/config_pkg.vhd"
        ]
        vhdl_sources2=[
            top_path / "HAL/ctrl/src/HPS/HPS_PKG.vhd",
        ]

        vhdl_sources3=[
            top_path / "shared/detector_parameters/dp_repo/chambers/mechanics/barrel_R_rpc_pkg.vhd",
        ]
        vhdl_sources4=[
            top_path / "shared/config/config_defaults_pkg.vhd",
        ]
        vhdl_sources5=[
            top_path / "UserLogic/csf/pkg//csf_pkg.vhd",
            top_path / "UserLogic/csf/pkg//csf_custom_pkg.vhd",
            top_path / "UserLogic/csf/src/csf_clustering.vhd",
            top_path / "UserLogic/csf/src/csf_supervisor.vhd",
            top_path / "UserLogic/csf/src/ncsf_sums.vhd",
            top_path / "UserLogic/csf/src/ncsf_fit.vhd",
            top_path / "UserLogic/csf/src/seg_coord_transform.vhd",
            top_path / "UserLogic/csf/src/ncsf.vhd",
            top_path / "UserLogic/csf/cocotb/csf_cocotb.vhd",
        ]
        # hdl_lib = ["shared_lib", "dp_repo_lib"]
        vhdl_sources6=[
            top_path / "Top/MainBlocks/ncsf/prj_cfg.vhd",
        ]
        verilog_sources=[
            top_path / "shared/memories/src/rom.v"
        ]
        if sim in ["questa", "modelsim", "riviera", "activehdl"]:
            build_args = ["-2008",]
    else:
        raise ValueError(
            f"A valid value (verilog or vhdl) was not provided for TOPLEVEL_LANG={hdl_toplevel_lang}"
        )

    

    extra_args = []
    if sim == "xcelium":
        extra_args = ["-v93"]
    elif sim == "questa":
        extra_args = ["-t", "1ps", "-noautoldlibpath"]
    parameters = []    

    runner = get_runner(sim)


    runner.build(
        hdl_library="dp_repo_lib",
        # hdl_toplevel="csf_cocotb",
        vhdl_sources=vhdl_sources3,
        build_args=build_args,
        # parameters=parameters,
        always=True,
    )

    runner.build(
        hdl_library="shared_cfg_def_lib",
        # hdl_toplevel="csf_cocotb",
        vhdl_sources=vhdl_sources4,
        # parameters=parameters,
        always=True,
    
    )
    # runner.build(
    #     hdl_library="csf_lib",
    #     verilog_sources=verilog_sources,
    # )
    runner.build(
        hdl_library="shared_lib",
        verilog_sources=verilog_sources,
        vhdl_sources=[ top_path / "shared/arithmetics/src/divider.vhd"],
        always=True
    )
    runner.build(
        hdl_library="project_lib",
        # hdl_toplevel="csf_cocotb",
        vhdl_sources=vhdl_sources6,
        build_args=build_args,
        # parameters=parameters,
        always=True,
    )
    
    runner.build(
        hdl_library="shared_lib",
        
        # hdl_toplevel="csf_cocotb",
        vhdl_sources=vhdl_sources1,
        build_args=build_args,
        # parameters=parameters,
        always=True,
    )
    # runner.build(
     
    #     hdl_toplevel="shared_lib",
    #     # build_args=build_args,
    #     # parameters=parameters,
    #     always=True,
    # )
    runner.build(
        
        hdl_library="ctrl_lib",
        vhdl_sources=vhdl_sources2,
        build_args=build_args,
        # parameters=parameters,
        always=True,
    )   
    
    parameters={"is_endcap":0,
                "mdt_station":args.mdt_station }

    runner.build(
        hdl_library="csf_lib",
        vhdl_sources=vhdl_sources5,
        build_args=build_args,
        parameters=parameters,
        always=True,
    )
    
    
    
    runner.test(
        hdl_toplevel="csf_cocotb",
        hdl_toplevel_library="csf_lib",

        #hdl_toplevel="csf_cocotb",
        hdl_toplevel_lang=hdl_toplevel_lang,
        test_module="csf_cocotb",
        test_args=extra_args,
        waves=True,
        # gui=True
    )


if __name__ == "__main__":
    csf_cocotb()