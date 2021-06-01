onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT /ult_tp/ULT/DUMMY
add wave -noupdate -group ULT /ult_tp/ULT/clock_and_control
add wave -noupdate -group ULT /ult_tp/ULT/ttc_commands
add wave -noupdate -group ULT /ult_tp/ULT/h2s_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/h2s_mon
add wave -noupdate -group ULT /ult_tp/ULT/tar_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/tar_mon
add wave -noupdate -group ULT /ult_tp/ULT/mtc_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/mtc_mon
add wave -noupdate -group ULT /ult_tp/ULT/ucm_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/ucm_mon
add wave -noupdate -group ULT /ult_tp/ULT/daq_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/daq_mon
add wave -noupdate -group ULT /ult_tp/ULT/tf_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/tf_mon
add wave -noupdate -group ULT /ult_tp/ULT/mpl_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/mpl_mon
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
add wave -noupdate -group ULT /ult_tp/ULT/o_daq_streams
add wave -noupdate -group ULT /ult_tp/ULT/o_plus_neighbor_segments_av
add wave -noupdate -group ULT /ult_tp/ULT/o_minus_neighbor_segments_av
add wave -noupdate -group ULT /ult_tp/ULT/o_MTC
add wave -noupdate -group ULT /ult_tp/ULT/o_NSP
add wave -noupdate -group ULT /ult_tp/ULT/sump
add wave -noupdate -group ULT /ult_tp/ULT/h2s_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/h2s_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/ucm_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/ucm_mon_v
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
add wave -noupdate -group ULT /ult_tp/ULT/ucm_sump
add wave -noupdate -group ULT /ult_tp/ULT/pt_sump
add wave -noupdate -group ULT /ult_tp/ULT/h2s_sump
add wave -noupdate -group ULT /ult_tp/ULT/tar_sump
add wave -noupdate -group ULT /ult_tp/ULT/mtc_sump
add wave -noupdate -group ULT /ult_tp/ULT/daq_sump
add wave -noupdate -group ULT /ult_tp/ULT/mpl_sump
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/clk
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rst
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/glob_en
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ttc_commands
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_en
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_rst
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/prepro2ctrl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ucm_prepro_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_in_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/slc_endcap_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_in_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_in_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_control
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/proc_info
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_in_en
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_phimod
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/phicenter
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/clk
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rst
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/glob_en
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ttc_commands
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_v
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_v
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_en
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_rst
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/prepro2ctrl_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ucm_prepro_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_in_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_ar
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/slc_endcap_ar
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_in_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_in_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_out_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2pl_av
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_control
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pam_CSW_control
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/proc_info
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_in_en
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_loc_rst
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_phimod
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2hps_data
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group SLC_VP_A2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/phicenter
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/glob_en
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -expand -group SLC_VP_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group SLC_VP_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/o_phimod
add wave -noupdate -expand -group SLC_VP_2 -expand /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/clk
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rst
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_cointype
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_v
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_valid
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_offset
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_slope
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_data_valid
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/coin
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_2
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_offset
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_sum_z
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_nom
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope_2
add wave -noupdate -expand -group SLOPE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/num_h
add wave -noupdate -expand -group SLOPE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/c_B_DEN_NOM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1939963694 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {1869284658 fs} {2008145771 fs}
