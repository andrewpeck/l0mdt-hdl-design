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
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_en
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/local_rst
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ttc_commands
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ctrl_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/mon_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/phicenter
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/i_slc_data_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM -group int_ucm2pl /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_ar(4).data_valid
add wave -noupdate -group UCM -group int_ucm2pl /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_av
add wave -noupdate -group UCM -group int_ucm2pl /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group UCM -expand -group pl_o_ucm2pl /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_ar(4).data_valid
add wave -noupdate -group UCM -expand -group pl_o_ucm2pl /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group UCM -expand -group pl_o_ucm2pl /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_phimod
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/o_uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/prepro2ctrl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/ucm_prepro_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_in_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_main_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/slc_endcap_ar
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cde_in_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_in_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cpam_out_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/csw_control
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/proc_info
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_in_en
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/clk
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rst
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_phicenter
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_v
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_r
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/g_OPERATION
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/g_IN_PIPE_STAGES
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/g_OPERAND_A_WIDTH
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/g_OPERAND_B_WIDTH
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/g_OUT_PIPE_STAGES
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/g_RESULT_WIDTH
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/g_INFER_DSP
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/TOTAL_MUL_LATENCY
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/clk
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/rst
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/i_in_A
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/i_in_B
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/mul_in_pipe_A
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/mul_in_pipe_B
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/int_Result
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/mul_output_pipe
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/valid_signal_pipe
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/i_dv
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/o_result
add wave -noupdate -group UCM_CDE_2 -group CDE_2_phimod_scale /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/PHIMOD_SCALE/o_dv
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod_pl
add wave -noupdate -group UCM_CDE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod
add wave -noupdate -group UCM_CDE_2 -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod_abs
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_phimod_dv
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_slc_data_v
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/int_slc_data_r
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/barrel_r
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/dv_bus
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rpc_z_a
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_r
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_v
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_pl_phimod
add wave -noupdate -group UCM_CDE_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_pl_phimod_dv
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ena
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ctrl_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mon_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -group SLC_VP_2 -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.phimod -radix decimal}} -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.muid {-height 17 -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.muid.slcid -radix unsigned} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.muid.slid -radix unsigned} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.muid.bcid -radix unsigned}} -expand} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.muid.slcid {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.muid.slid {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.muid.bcid {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r.phimod {-height 17 -radix decimal}} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ctrl_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mon_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_mon_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_R_mon_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_mon_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_R_mon_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_radius_av
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/rpc_radius_dv
add wave -noupdate -group SLC_VP_2 -radix unsigned -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av(2) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av(1) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av(0) -radix unsigned}} -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av(2) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av(1) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av(0) {-height 17 -radix unsigned}} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_av
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/mdt_radius_dv
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -group SLC_VP_2 /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/g_MODE
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/g_OUTPUT_WIDTH
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/clk
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/rst
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/ena
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/ctrl_v
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/mon_v
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/i_phimod
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/i_dv
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/o_radius
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/o_dv
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/ctrl_r
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/mon_r
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/dv
add wave -noupdate -group RPC_R /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/RPC_R/mon_av
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/g_NUM_RPC_LAYERS
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/clk
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/ena
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rst
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_cointype
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_v
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_valid
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_rpc_rad_a
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/coin
add wave -noupdate -group cvp_2_slope -radix decimal -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) -radix decimal}} -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) {-height 17 -radix decimal}} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a
add wave -noupdate -group cvp_2_slope -radix decimal -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(0) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(1) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(2) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(3) -radix decimal}} -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(0) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(1) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(2) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(3) {-height 17 -radix decimal}} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/num_h_i
add wave -noupdate -group cvp_2_slope -radix decimal -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(0) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(1) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(2) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(3) -radix decimal}} -subitemconfig {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(0) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(1) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(2) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(3) {-height 17 -radix decimal}} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy
add wave -noupdate -group cvp_2_slope -radix binary /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy_dv
add wave -noupdate -group cvp_2_slope -radix decimal -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(0) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(1) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(2) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(3) -radix decimal}} -subitemconfig {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(0) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(1) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(2) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz(3) {-height 17 -radix decimal}} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz
add wave -noupdate -group cvp_2_slope -radix binary -childformat {{/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(3) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(2) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(1) -radix decimal} {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(0) -radix decimal}} -subitemconfig {/ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(3) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(2) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(1) {-height 17 -radix decimal} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(0) {-height 17 -radix decimal}} /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_pl
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_pl_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y_sc
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_zz
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_zz_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_1
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_1_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_2
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_2_dv
add wave -noupdate -group cvp_2_slope -radix unsigned /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_sc
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bden
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bden_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dv
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z_dv
add wave -noupdate -group cvp_2_slope /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_data_valid
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_offset
add wave -noupdate -group cvp_2_slope -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_slope
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/g_STATION_RADIUS
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/g_STATION_LAYER
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/g_OUTPUT_WIDTH
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/clk
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/rst
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/ena
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/ctrl_v
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/mon_v
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/i_phimod
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/i_dv
add wave -noupdate -group MDT_R_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/o_radius
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/o_dv
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/ctrl_r
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/mon_r
add wave -noupdate -group MDT_R_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/MDT_R/OUT0/rad_mem
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/g_INPUT_RESOLUTION
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/g_OUTPUT_WIDTH
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/ena
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_mdt_R
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_mdt_R_dv
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_chamb_ieta
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/slope
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/mult
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/mdt_R
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/mdt_R_sc
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/bnom
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/bnom_dv
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/vec_pos_dv
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/vec_pos_mult
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/vec_pos_mult_dv
add wave -noupdate -expand -group Z_CALC_OUT -radix decimal /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group Z_CALC_OUT /ult_tp/ULT/logic_gen/UCM_GEN/ULT_UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14310950005 fs} 0}
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
WaveRestoreZoom {14305311024 fs} {14391532855 fs}
