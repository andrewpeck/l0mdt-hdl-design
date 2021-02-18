onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/DUMMY
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/clock_and_control
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/ttc_commands
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/h2s_ctrl
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/h2s_mon
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/tar_ctrl
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/tar_mon
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mtc_ctrl
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mtc_mon
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/ucm_ctrl
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/ucm_mon
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/daq_ctrl
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/daq_mon
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/tf_ctrl
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/tf_mon
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mpl_ctrl
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mpl_mon
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_inner_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_middle_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_outer_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_extra_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_inner_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_middle_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_outer_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_extra_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_plus_neighbor_segments
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/i_minus_neighbor_segments
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/o_daq_streams
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/o_plus_neighbor_segments
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/o_minus_neighbor_segments
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/o_MTC
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/o_NSP
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/sump
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/inner_slc_to_hts
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/middle_slc_to_hts
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/outer_slc_to_hts
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/extra_slc_to_hts
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/ucm2pl_av
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/inn_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mid_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/out_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/ext_tar_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/inn_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mid_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/out_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/ext_tdc_hits
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/inn_segments_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mid_segments_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/out_segments_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/ext_segments_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/pl2pt_av
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/pl2mtc_av
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/pt2mtc_av
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/pt_sump
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/h2s_sump
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/tar_sump
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/mtc_sump
add wave -noupdate -expand -group ULT_TOP /ult_tp/ULT/daq_sump
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/clk
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/rst
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/glob_en
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ttc_commands
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ctrl
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/mon
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_en
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_rst
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/prepro2ctrl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ucm_prepro_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_in_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_ar
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/slc_endcap_ar
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_in_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_in_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_out_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_control
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/proc_info
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_in_en
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_phimod
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/clk
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/rst
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/glob_en
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/ctrl
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/mon
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cde_chamber_z_org_bus
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cvp_chamber_z_org_bus
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/local_en
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/local_rst
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/int_en
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/int_rst
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cvp_ch_z0_org
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CVP_CH_Z0_WR
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CVP_CH_Z0_RD
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cde_ch_z0_org
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CDE_CH_Z0_WR
add wave -noupdate -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CDE_CH_Z0_RD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4999999518 fs} 0}
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
WaveRestoreZoom {0 fs} {5250 ns}
