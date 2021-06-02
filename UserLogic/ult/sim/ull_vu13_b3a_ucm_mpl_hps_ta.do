onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT /ult_tp/ULT/DUMMY
add wave -noupdate -group ULT /ult_tp/ULT/clock_and_control
add wave -noupdate -group ULT /ult_tp/ULT/ttc_commands
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/h2s_ctrl
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/h2s_mon
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/tar_ctrl
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/tar_mon
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/mtc_ctrl
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/mtc_mon
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/ucm_ctrl
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/ucm_mon
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/daq_ctrl
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/daq_mon
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/tf_ctrl
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/tf_mon
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/mpl_ctrl
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/mpl_mon
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/h2s_ctrl_v
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/h2s_mon_v
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/tar_ctrl_v
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/tar_mon_v
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/ucm_ctrl_v
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/ucm_mon_v
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/mpl_ctrl_v
add wave -noupdate -group ULT -group ctrl/mon /ult_tp/ULT/mpl_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/i_inn_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/i_mid_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/i_out_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/i_ext_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_plus_neighbor_segments
add wave -noupdate -group ULT /ult_tp/ULT/i_minus_neighbor_segments
add wave -noupdate -group ULT /ult_tp/ULT/inn_slc_to_h2s_av
add wave -noupdate -group ULT /ult_tp/ULT/mid_slc_to_h2s_av
add wave -noupdate -group ULT /ult_tp/ULT/out_slc_to_h2s_av
add wave -noupdate -group ULT /ult_tp/ULT/ext_slc_to_h2s_av
add wave -noupdate -group ULT /ult_tp/ULT/ucm2pl_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_inn_tar_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_mid_tar_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_out_tar_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_ext_tar_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_inn_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_mid_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_out_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/ult_ext_tdc_hits_av
add wave -noupdate -group ULT /ult_tp/ULT/inn_segments_to_pt_av
add wave -noupdate -group ULT /ult_tp/ULT/mid_segments_to_pt_av
add wave -noupdate -group ULT /ult_tp/ULT/out_segments_to_pt_av
add wave -noupdate -group ULT /ult_tp/ULT/ext_segments_to_pt_av
add wave -noupdate -group ULT /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/pl2pt_av
add wave -noupdate -group ULT /ult_tp/ULT/pl2mtc_av
add wave -noupdate -group ULT /ult_tp/ULT/pt2mtc_av
add wave -noupdate -group ULT /ult_tp/ULT/o_daq_streams
add wave -noupdate -group ULT /ult_tp/ULT/o_plus_neighbor_segments_av
add wave -noupdate -group ULT /ult_tp/ULT/o_minus_neighbor_segments_av
add wave -noupdate -group ULT /ult_tp/ULT/o_MTC
add wave -noupdate -group ULT /ult_tp/ULT/o_NSP
add wave -noupdate -group ULT -group sump /ult_tp/ULT/ucm_sump
add wave -noupdate -group ULT -group sump /ult_tp/ULT/pt_sump
add wave -noupdate -group ULT -group sump /ult_tp/ULT/h2s_sump
add wave -noupdate -group ULT -group sump /ult_tp/ULT/tar_sump
add wave -noupdate -group ULT -group sump /ult_tp/ULT/mtc_sump
add wave -noupdate -group ULT -group sump /ult_tp/ULT/daq_sump
add wave -noupdate -group ULT -group sump /ult_tp/ULT/mpl_sump
add wave -noupdate -group ULT -group sump /ult_tp/ULT/sump
add wave -noupdate -divider UCM
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/clk
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rst
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/glob_en
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ttc_commands
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_v
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_v
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_en
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_rst
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/prepro2ctrl_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ucm_prepro_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_in_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_ar
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/slc_endcap_ar
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_in_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_in_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_out_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_control
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/proc_info
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_in_en
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_phimod
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM_TOP /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/phicenter
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group UCM_CVP_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group UCM_CVP_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group UCM_CVP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -divider H2S
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/g_STATION_RADIUS
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/g_HPS_NUM_MDT_CH
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/clk
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/rst
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/glob_en
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/int_rst
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/int_ena
add wave -noupdate -group HPS_INN -group ctrl/mon /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/ctrl_v
add wave -noupdate -group HPS_INN -group ctrl/mon /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/mon_v
add wave -noupdate -group HPS_INN -group ctrl/mon /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/ctrl_r
add wave -noupdate -group HPS_INN -group ctrl/mon /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/mon_r
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/i_uCM2hps_av
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/i_mdt_tar_av
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/g_SIM_nBUILD
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/g_HPS_NUM_MDT_CH
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/g_STATION_RADIUS
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/clk
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/rst
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/ena
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/i_ctrl_tc
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/o_mon_tc
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/i_ctrl_t0
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/o_mon_t0
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/i_mdt_tar_v
add wave -noupdate -group HPS_INN -group PC_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/PC/o_mdt_full_data_v
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/mdt_full_data_av
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg2sf_ctrl_av
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg2sfslc_av
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg2sfhit_av
add wave -noupdate -group HPS_INN /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/o_sf2pt_av
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/g_STATION_RADIUS
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/g_HPS_NUM_MDT_CH
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/clk
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/rst
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/glob_en
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/ctrl
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/mon
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/i_uCM_data_v
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/i_mdt_full_data_av
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/g_STATION_RADIUS
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/g_HPS_NUM_MDT_CH
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/clk
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/rst
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/glob_en
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/i_uCM_data_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/g_STATION_RADIUS
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/g_HPS_NUM_MDT_CH
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/clk
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/rst
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/glob_en
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/i_uCM_data_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/uCM_data_r
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/g_STATION_RADIUS
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/clk
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/rst
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/glob_en
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/i_z
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/i_dv
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/o_roi_center
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/o_dv
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER -expand /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/rom_mem
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/addr_mem
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/int_data_valid
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi -expand -group ROI_CENTER /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/BARREL/ROI_Z/centers
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/roi_center
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/roi_edges
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/dv_z
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/dv_mbar
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/SLC_Window_r
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/o_SLC_Window_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl -expand -group heg_ctrl_roi /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/HEG_CTRL_ROI/o_Roi_win_valid
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/o_uCM2sf_data_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/o_uCM2hp_data_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/o_SLC_Window_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/o_SLC_Win_dv
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/o_sf_control_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/o_hp_control_r
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/SLC_Window_v
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/win_row_0
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/uCM_data_r
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/Roi_win_valid
add wave -noupdate -group HEG_INN_2 -expand -group heg_ctrl /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/Heg_Control/o_sf_control_r
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/roi_b_Window
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/hegC2hp_uCM_data
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/hegC_control
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/hp2bm_av
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/time_offset
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/o_sf_control_v
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/o_sf_slc_data_v
add wave -noupdate -group HEG_INN_2 /ult_tp/ULT/logic_gen/H2S_GEN/ULT_H2S/HPS_INN/HPS/heg_gen(2)/HEG/o_sf_mdt_data_v
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Reset {3729687500 fs} 1 Red default} {{Cursor 2} {1901562500 fs} 1} {{Cursor 3} {1929687500 fs} 0}
quietly wave cursor active 3
configure wave -namecolwidth 181
configure wave -valuecolwidth 208
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
WaveRestoreZoom {1911121499 fs} {1967691648 fs}
