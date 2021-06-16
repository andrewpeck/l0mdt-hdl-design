onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT /ult_tp/ULT/DUMMY
add wave -noupdate -group ULT /ult_tp/ULT/clock_and_control
add wave -noupdate -group ULT /ult_tp/ULT/ttc_commands
add wave -noupdate -group ULT /ult_tp/ULT/h2s_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/tar_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/mtc_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/ucm_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/daq_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/tf_ctrl_v
add wave -noupdate -group ULT /ult_tp/ULT/mpl_ctrl_v
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
add wave -noupdate -group ULT -expand /ult_tp/ULT/pl2mtc_av
add wave -noupdate -group ULT -expand /ult_tp/ULT/pt2mtc_av
add wave -noupdate -group ULT /ult_tp/ULT/ucm_sump
add wave -noupdate -group ULT /ult_tp/ULT/pt_sump
add wave -noupdate -group ULT /ult_tp/ULT/h2s_sump
add wave -noupdate -group ULT /ult_tp/ULT/tar_sump
add wave -noupdate -group ULT /ult_tp/ULT/mtc_sump
add wave -noupdate -group ULT /ult_tp/ULT/daq_sump
add wave -noupdate -group ULT /ult_tp/ULT/mpl_sump
add wave -noupdate -group ULT /ult_tp/ULT/h2s_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/tar_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/mtc_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/ucm_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/daq_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/tf_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/mpl_mon_v
add wave -noupdate -group ULT /ult_tp/ULT/o_daq_streams
add wave -noupdate -group ULT /ult_tp/ULT/o_plus_neighbor_segments_av
add wave -noupdate -group ULT /ult_tp/ULT/o_minus_neighbor_segments_av
add wave -noupdate -group ULT /ult_tp/ULT/o_MTC
add wave -noupdate -group ULT /ult_tp/ULT/o_NSP
add wave -noupdate -group ULT /ult_tp/ULT/sump
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/clk
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rst
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/glob_en
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ttc_commands
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_v
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_ctrl_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_mon_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_ctrl_v
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_mon_v
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_ctrl_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_ctrl_v
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_mon_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_mon_av
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_mon_null
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_R_mon_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_R_mon_v
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_R_mon_r
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_R_mon_v
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_mon_a
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_mon_av
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_mon_null
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_mon_a
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_mon_av
add wave -noupdate -expand -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_mon_null
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_en
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_rst
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/prepro2ctrl_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ucm_prepro_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_in_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_ar
add wave -noupdate -expand -group UCM -expand /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/slc_endcap_ar
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_in_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_ar
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_ar
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_in_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_out_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2pl_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_control
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pam_CSW_control
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/proc_info
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_in_en
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_loc_rst
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_phimod
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2hps_data
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/phicenter
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_v
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -expand -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1892014575 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 261
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
WaveRestoreZoom {1888228804 fs} {1902608186 fs}
