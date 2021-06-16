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
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/clk
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rst
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/glob_en
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ttc_commands
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_ctrl_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_mon_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_ctrl_v
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/super_mon_v
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_ctrl_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_ctrl_v
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_mon_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_mon_av
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/r_phi_comp_mon_null
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_R_mon_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_R_mon_v
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_R_mon_r
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_R_mon_v
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_mon_a
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_mon_av
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/rpc_mon_null
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_mon_a
add wave -noupdate -group UCM -group c&m -expand /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_mon_av
add wave -noupdate -group UCM -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mdt_mon_null
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
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_in_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_control
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/proc_info
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_in_en
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_phimod
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/phicenter
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_av
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/clk
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rst
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/ena
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_phicenter
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_v
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_r
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_slc_data_v
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_slc_data_r
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_r
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/barrel_r
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/dv_bus
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rpc_z_a
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/slc_posphi
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod_abs
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod_pl
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod_dv
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_v
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_pl_phimod
add wave -noupdate -group CDE2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_pl_phimod_dv
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ena
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ctrl_v
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r
add wave -noupdate -group CVP2 -expand -group c&m -expand /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ctrl_r
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mon_r
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_r
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_mon_r
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_v
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_mon_v
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_r
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_mon_r
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_v
add wave -noupdate -group CVP2 -expand -group c&m /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_mon_v
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_radius_av
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_radius_dv
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_dv
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mon_v
add wave -noupdate -group CVP2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/g_STATION_RADIUS
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/g_STATION_LAYER
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/g_OUTPUT_WIDTH
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/clk
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/rst
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/ena
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/ctrl_v
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/i_phimod
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/i_dv
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/ctrl_r
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/mon_r
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/rad_mem
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/mon_v
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/o_radius
add wave -noupdate -group RPC_R_INN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/INN0/o_dv
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/g_MODE
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/g_OUTPUT_WIDTH
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/clk
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/rst
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/ena
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/ctrl_v
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/i_phimod
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/i_dv
add wave -noupdate -group RPC_R -expand /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/ctrl_r
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/mon_r
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/dv
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/mon_av
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/mon_null
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/mon_v
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/o_radius
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/o_dv
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/clk
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/rst
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/glob_en
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/ctrl_v
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/ctrl
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/mon
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/axi_rst
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/clk_axi
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/int_en
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/int_rst
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/phicenter
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/PHI_CTRL
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/PHI_MON
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/cde_ch_z0_org
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/CDE_Z0_CTRL
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/CDE_Z0_MON
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/CDE_states
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/cvp_ch_z0_org
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/CVP_Z0_CTRL
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/CVP_Z0_MON
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/mon_v
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/o_phicenter
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/o_cde_chamber_z_org_bus
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/o_cvp_chamber_z_org_bus
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/local_en
add wave -noupdate -group SUPER /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/UCM_SUPERVISOR/local_rst
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/clk
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/rst
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/ena
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/i_data
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/alg_status
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/i_data_ar
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/data_ar
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/input_valids
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/o_csw_ctrl
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/o_num_cand
add wave -noupdate -group CTRL_MAIN /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/MAIN_CTRL/o_pam_update
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/g_PAM_CTRL_PL
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/g_PAM_INFO_PL
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/g_CVP_PL
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/clk
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/rst
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/ena
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/i_num_cand
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/i_pam_update
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/int_pam_ctrl_r
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/int_proc_info_r
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/int_pam_ctrl_v
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/o_pam_ctrl_v
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/int_proc_info_v
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info_v
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/int_cvp_rst
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/int_cvp_ctrl
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/ch_busy
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/proc_info
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/ch_count
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/processing
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/processed_s
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/buff_pam_ctrl
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/o_pam_ctrl
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/o_cvp_rst
add wave -noupdate -expand -group CTRL_PAM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CTRL/PAM_CTRL/o_cvp_ctrl
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {249146062 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 244
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
WaveRestoreZoom {0 fs} {787996847 fs}
