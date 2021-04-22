onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group DUT /ult_tp/ULT/clock_and_control
add wave -noupdate -group DUT /ult_tp/ULT/ttc_commands
add wave -noupdate -group DUT /ult_tp/ULT/h2s_ctrl
add wave -noupdate -group DUT /ult_tp/ULT/h2s_mon
add wave -noupdate -group DUT /ult_tp/ULT/tar_ctrl
add wave -noupdate -group DUT /ult_tp/ULT/tar_mon
add wave -noupdate -group DUT /ult_tp/ULT/mtc_ctrl
add wave -noupdate -group DUT /ult_tp/ULT/mtc_mon
add wave -noupdate -group DUT /ult_tp/ULT/ucm_ctrl
add wave -noupdate -group DUT /ult_tp/ULT/ucm_mon
add wave -noupdate -group DUT /ult_tp/ULT/daq_ctrl
add wave -noupdate -group DUT /ult_tp/ULT/daq_mon
add wave -noupdate -group DUT /ult_tp/ULT/tf_ctrl
add wave -noupdate -group DUT /ult_tp/ULT/tf_mon
add wave -noupdate -group DUT /ult_tp/ULT/mpl_ctrl
add wave -noupdate -group DUT /ult_tp/ULT/mpl_mon
add wave -noupdate -group DUT /ult_tp/ULT/i_inner_tdc_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_middle_tdc_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_outer_tdc_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_extra_tdc_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_inner_tar_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_middle_tar_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_outer_tar_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_extra_tar_hits
add wave -noupdate -group DUT /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -group DUT /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -group DUT /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -group DUT /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -group DUT /ult_tp/ULT/i_plus_neighbor_segments
add wave -noupdate -group DUT /ult_tp/ULT/i_minus_neighbor_segments
add wave -noupdate -group DUT /ult_tp/ULT/o_daq_streams
add wave -noupdate -group DUT /ult_tp/ULT/o_plus_neighbor_segments
add wave -noupdate -group DUT /ult_tp/ULT/o_minus_neighbor_segments
add wave -noupdate -group DUT /ult_tp/ULT/o_MTC
add wave -noupdate -group DUT /ult_tp/ULT/o_NSP
add wave -noupdate -group DUT /ult_tp/ULT/sump
add wave -noupdate -group DUT /ult_tp/ULT/ucm2pl_av
add wave -noupdate -group DUT /ult_tp/ULT/inn_segments_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/mid_segments_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/out_segments_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/ext_segments_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -group DUT /ult_tp/ULT/pl2pt_av
add wave -noupdate -group DUT /ult_tp/ULT/pl2mtc_av
add wave -noupdate -group DUT /ult_tp/ULT/pt2mtc_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/clk
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/rst
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/glob_en
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ttc_commands
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ctrl
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/mon
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_en
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_rst
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/prepro2ctrl_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ucm_prepro_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_in_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_ar
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/slc_endcap_ar
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_in_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_in_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_out_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_control
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/proc_info
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_in_en
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_phimod
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM_top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/phicenter
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/clk
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/rst
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/glob_en
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/ctrl
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/mon
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/i_uCM2pl_av
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/o_pl2ptcalc_av
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/o_pl2mtc_av
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/local_en
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/local_rst
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/int_freeze
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/i_uCM2pl_ar
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/clk
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/rst
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/enable
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/ctrl
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/mon
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/i_freeze
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/i_uCM2pl_v
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/o_pl2ptcalc_v
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/o_pl2mtc_v
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/i_uCM2pl_r
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_FREEZE_ENABLED
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_PARALLEL_MEM
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_CONTROLLER_MODE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_MEMORY_MODE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_MEMORY_TYPE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_ADDR_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_DATA_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_DATA_DEPTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_PIPELINE_TYPE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_DELAY_CYCLES
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_DELAY_EQUAL_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_PIPELINE_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_APBUS_ENABLED
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_XML_NODE_NAME
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_APBUS_CTRL_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/g_APBUS_MON_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/clk
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/rst
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/ena
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/ctrl
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/mon
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/i_freeze
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/i_data
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/i_dv
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -radix unsigned /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/FREEZE_EN
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -radix unsigned /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/ADDR_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -radix unsigned /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/DATA_DEPTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -radix unsigned /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/DATA_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_run_sel
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_apb_sel
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/apb_addr_o
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/apb_data_o
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/apb_dv_o
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/apb_data_i
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/apb_dv_i
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/int_freeze
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_addr_i_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_data_i_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_data_o_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_addr_i_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_data_i_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_data_o_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_dv_i_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_dv_o_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_dv_i_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_dv_o_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_empty
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_empty_next
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_full
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_full_next
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -radix unsigned /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/mem_used
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_SIMULATION
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_READ_MODE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_DV_TYPE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_SECOND_PORT
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_PL_DELAY_CYCLES
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_IN_PIPELINE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_OUT_PIPELINE
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_MEM_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/g_MEM_DEPTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/clk
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/rst
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/ena
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/i_freeze
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/i_addr_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/i_din_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/i_dv_in_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_dout_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_dv_out_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/i_addr_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/i_din_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/i_dv_in_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_dout_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_dv_out_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_empty
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_empty_next
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_full
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_full_next
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/o_used
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/ena_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/ena_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/ena_pipes_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/ena_pipes_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/data_pipes_A
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/data_pipes_B
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/wr_index_aux
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/rd_index_aux
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/wr_index
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/rd_index
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/mem_addr_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/mem_addr_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/mem_in_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/mem_in_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/mem_out_a
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/mem_out_b
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/used_data
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/ADD_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/MEM_DEPTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN -expand -group mpcvmem /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/APB_INT_EN/MODE_MEM/MPCVMEM_GEN/MEMS_GEN(0)/mpcv_mem/MEM_WIDTH
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/o_data
add wave -noupdate -expand -group MPL_top -expand -group PL_4 -expand -group PL_A_APB_EN /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/o_dv
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2pl_v
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2pl_dv
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2pl_r
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2mtc_r
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2mtc_v
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/apb_ctrl_mem_v
add wave -noupdate -expand -group MPL_top -expand -group PL_4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/apb_mon_mem_v
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/main_pl_out_av
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2csw_av
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2ptcalc_av
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2mtc_av
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/main_pl_out_ar
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2ptcalc_ar
add wave -noupdate -expand -group MPL_top /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2mtc_ar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 387
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 fs} {8271646333 fs}
