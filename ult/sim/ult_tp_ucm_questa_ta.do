onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT_TOP /ult_tp/ULT/DUMMY
add wave -noupdate -group ULT_TOP /ult_tp/ULT/clock_and_control
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ttc_commands
add wave -noupdate -group ULT_TOP /ult_tp/ULT/h2s_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/h2s_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tar_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tar_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mtc_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mtc_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ucm_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ucm_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/daq_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/daq_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tf_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tf_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mpl_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mpl_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_inner_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_middle_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_outer_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_extra_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_inner_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_middle_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_outer_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_extra_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_plus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_minus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_daq_streams
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_plus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_minus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_MTC
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_NSP
add wave -noupdate -group ULT_TOP /ult_tp/ULT/sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inner_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/middle_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/outer_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/extra_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ucm2pl_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inn_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mid_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/out_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ext_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inn_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mid_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/out_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ext_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inn_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mid_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/out_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ext_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pl2pt_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pl2mtc_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pt2mtc_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pt_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/h2s_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tar_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mtc_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/daq_sump
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/clk
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/rst
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/glob_en
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ttc_commands
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ctrl
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/mon
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/clk
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/rst
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/glob_en
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/ctrl
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/mon
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/o_phicenter
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/o_cde_chamber_z_org_bus
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/o_cvp_chamber_z_org_bus
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/local_en
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/local_rst
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/int_en
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/int_rst
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/PHI_WR
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/PHI_RD
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cde_ch_z0_org
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CDE_CH_Z0_WR
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CDE_CH_Z0_RD
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cvp_ch_z0_org
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CVP_CH_Z0_WR
add wave -noupdate -expand -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CVP_CH_Z0_RD
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_en
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_rst
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/phicenter
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/clk
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rst
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/glob_en
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_phicenter
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_v
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_r
add wave -noupdate -expand -group UCM_Top -group CDE2 -expand /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_r
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_null
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/barrel_r
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/dv_bus
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rpc_z_a
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_v
add wave -noupdate -expand -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_phimod
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_av
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_Top -group CVP2 -radix decimal /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_phimod
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/prepro2ctrl_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ucm_prepro_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_in_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_ar
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/slc_endcap_ar
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_in_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_phimod
add wave -noupdate -expand -group UCM_Top -color Cyan -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4) {-color Cyan -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).data_valid {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).busy {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).process_ch {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).phimod {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).nswseg_angdtheta {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).nswseg_posphi {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).nswseg_poseta {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(3) {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(2) {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(1) {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(0) {-color Cyan}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar
add wave -noupdate -expand -group UCM_Top -color Cyan /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_in_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_out_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2pl_av
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_control
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pam_CSW_control
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/proc_info
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_in_en
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_loc_rst
add wave -noupdate -expand -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2hps_data
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/clk
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/rst
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/glob_en
add wave -noupdate -group MPL -expand /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/i_uCM2pl_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/o_pl2tf_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/o_pl2mtc_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/main_pl_out_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/pl2pt_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/pl2mtc_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/main_pl_out_ar
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/pl2pt_ar
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/pipeline_inst/MPL_EN/MPL/pl2mtc_ar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1894777248 fs} 0}
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
WaveRestoreZoom {1877284420 fs} {1914400100 fs}
