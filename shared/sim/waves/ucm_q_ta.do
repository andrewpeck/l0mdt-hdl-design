onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/clk
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/rst
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/glob_en
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/ctrl_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/ctrl_v
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/mon_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/super_ctrl_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/super_mon_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/super_ctrl_v
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/super_mon_v
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/r_phi_comp_ctrl_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/r_phi_comp_ctrl_v
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/r_phi_comp_mon_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/r_phi_comp_mon_av
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/r_phi_comp_mon_null
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/rpc_R_mon_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/rpc_R_mon_v
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/rpc_mon_a
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/rpc_mon_av
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/rpc_mon_null
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/mdt_R_mon_r
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/mdt_R_mon_v
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/mdt_mon_a
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/mdt_mon_av
add wave -noupdate -group ucm_top -group cm /ucm_tb/UCM_DUT/mdt_mon_null
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/ttc_commands
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/i_slc_data_mainA_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/i_slc_data_mainB_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/i_slc_data_neighborA_v
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/i_slc_data_neighborB_v
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/local_en
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/local_rst
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/i_slc_data_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/prepro2ctrl_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/csw_main_in_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/csw_main_out_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/slc_endcap_ar
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/cpam_in_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/cpam_out_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/uCM2pl_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/csw_control_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/pam_CSW_control
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/proc_info_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/cvp_in_en
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/cvp_loc_rst
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/uCM2hps_data
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/cde_chamber_z_org_bus
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/cvp_chamber_z_org_bus
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/phicenter
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/mon_v
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/o_uCM2hps_inn_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/o_uCM2hps_mid_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/o_uCM2hps_out_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/o_uCM2hps_ext_av
add wave -noupdate -group ucm_top /ucm_tb/UCM_DUT/o_uCM2pl_av
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/bypass
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/phimod_ena
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/clk
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/rst
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/ena
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_phicenter
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_proc_info_v
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_v
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_proc_info_r
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_slc_data_v
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int2_slc_data_v
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_slc_data_r
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int2_slc_data_r
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_cde_data_r
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/dv_bus
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/rpc_z_a
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_chamb_ieta
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/slc_posphi
add wave -noupdate -group CDE4 -expand -group phimod /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/clk
add wave -noupdate -group CDE4 -expand -group phimod /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/rst
add wave -noupdate -group CDE4 -expand -group phimod /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/ena
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_phicenter
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_posphi
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_dv
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phicenter
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_posphi
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_posphi_pl_dv
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_s
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_dv
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_pl
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/clk
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/rst
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_A
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_B
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_C
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_D
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_dv
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/o_result
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/o_dv
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_A
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_B
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_C
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_D
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_output_pipe
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/valid_signal_pipe
add wave -noupdate -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/int_Result
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_phimod_abs
add wave -noupdate -group CDE4 -expand -group phimod /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_abs_dv
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_phimod
add wave -noupdate -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_dv
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_phimod_abs_pl
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_abs_dv
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_phimod_pl
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_uCM2pl_r
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_cde_data_v
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_pl_phimod
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_pl_phimod_dv
add wave -noupdate -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_ucm2pl_v
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ena
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ctrl_v
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ctrl_r
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mon_r
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_r
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_mon_r
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_v
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_mon_v
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_r
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_mon_r
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_v
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_mon_v
add wave -noupdate -expand -group CVP2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mon_v
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_data_r
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_dv
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_dv
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ucm2hps_buff_ar
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group CVP2 -group slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/g_NUM_RPC_LAYERS
add wave -noupdate -expand -group CVP2 -group slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/clk
add wave -noupdate -expand -group CVP2 -group slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rst
add wave -noupdate -expand -group CVP2 -group slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/ena
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_rpc_rad_a
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_cointype
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_v
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_valid
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/coin
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/num_h_i
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/set_data_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_pl
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_pl_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y_sc
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_zz
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_zz_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_1
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_1_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_2
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_2_dv
add wave -noupdate -expand -group CVP2 -group slope -color Firebrick -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom
add wave -noupdate -expand -group CVP2 -group slope -color Firebrick -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_sc
add wave -noupdate -expand -group CVP2 -group slope -color Firebrick -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_dv
add wave -noupdate -expand -group CVP2 -group slope -color Firebrick -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bden
add wave -noupdate -expand -group CVP2 -group slope -color Firebrick -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bden_dv
add wave -noupdate -expand -group CVP2 -group slope -group bdiv /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_aux
add wave -noupdate -expand -group CVP2 -group slope -group bdiv /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_aux_dv
add wave -noupdate -expand -group CVP2 -group slope -group bdiv /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tvalid
add wave -noupdate -expand -group CVP2 -group slope -group bdiv /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tuser
add wave -noupdate -expand -group CVP2 -group slope -group bdiv /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tdata
add wave -noupdate -expand -group CVP2 -group slope -group bdiv -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tdata_q
add wave -noupdate -expand -group CVP2 -group slope -group bdiv -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tdata_r
add wave -noupdate -expand -group CVP2 -group slope -color Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv
add wave -noupdate -expand -group CVP2 -group slope -color Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_dv
add wave -noupdate -expand -group CVP2 -group slope -group e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_aux
add wave -noupdate -expand -group CVP2 -group slope -group e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_aux_dv
add wave -noupdate -expand -group CVP2 -group slope -group e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tvalid
add wave -noupdate -expand -group CVP2 -group slope -group e_z -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tuser
add wave -noupdate -expand -group CVP2 -group slope -group e_z -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tdata
add wave -noupdate -expand -group CVP2 -group slope -group e_z -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tdata_q
add wave -noupdate -expand -group CVP2 -group slope -group e_z -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tdata_r
add wave -noupdate -expand -group CVP2 -group slope -group e_z -color Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z
add wave -noupdate -expand -group CVP2 -group slope -group e_z -color Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dv
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/clk
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/ena
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_DELAY_CYCLES
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_DELAY_EQUAL_WIDTH
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_MEMORY_TYPE
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_PIPELINE_TYPE
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_PIPELINE_WIDTH
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_PL_DV
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_PL_ENABLE_ENA
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_PL_ENABLE_RST
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_SHREG_EXTRACT
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/g_SIMULATION
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/i_data
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/i_dv
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/rst
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_SIMULATION
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/clk
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/rst
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/ena
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/i_wr
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/i_wr_data
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/i_rd
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/i_delay
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/mem
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/mem_dv
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/int_delay
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/mem2pl
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/mem2pl_dv
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/case_options
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/wr_index
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/rd_index
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/int_wr_data
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/used_data
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/o_rd_data
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/o_rd_dv
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/o_empty
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/o_empty_next
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/o_full
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/o_full_next
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z -expand -group ring_mem /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/RING_GEN/SIM_GEN/ring_mem/o_used
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/o_data
add wave -noupdate -expand -group CVP2 -group slope -group PL_e_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/PL_e_z/o_dv
add wave -noupdate -expand -group CVP2 -group slope -color Orange /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_pl
add wave -noupdate -expand -group CVP2 -group slope -color Orange /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_pl_dv
add wave -noupdate -expand -group CVP2 -group slope -group e_y /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_aux
add wave -noupdate -expand -group CVP2 -group slope -group e_y /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_aux_dv
add wave -noupdate -expand -group CVP2 -group slope -group e_y /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tvalid
add wave -noupdate -expand -group CVP2 -group slope -group e_y /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tuser
add wave -noupdate -expand -group CVP2 -group slope -group e_y /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tdata
add wave -noupdate -expand -group CVP2 -group slope -group e_y -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tdata_q
add wave -noupdate -expand -group CVP2 -group slope -group e_y -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tdata_r
add wave -noupdate -expand -group CVP2 -group slope -group e_y -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y
add wave -noupdate -expand -group CVP2 -group slope -group e_y -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dv
add wave -noupdate -expand -group CVP2 -group slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_pl
add wave -noupdate -expand -group CVP2 -group slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_pl_dv
add wave -noupdate -expand -group CVP2 -group slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z
add wave -noupdate -expand -group CVP2 -group slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_off
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_off_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope_dv
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_offset
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_slope
add wave -noupdate -expand -group CVP2 -group slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_data_valid
add wave -noupdate -expand -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group CVP2 -group zcalc0 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group CVP2 -group zcalc0 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_INPUT_RESOLUTION
add wave -noupdate -expand -group CVP2 -group zcalc0 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate -expand -group CVP2 -group zcalc0 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_OUTPUT_WIDTH
add wave -noupdate -expand -group CVP2 -group zcalc0 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group CVP2 -group zcalc0 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group CVP2 -group zcalc0 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/ena
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_mdt_R
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_mdt_R_dv
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/mdt_R
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/mdt_R_sc
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/slope
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/bnom
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/bnom_dv
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/old_vec_pos
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/old_vec_pos_dv
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/vec_pos_dv
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/vec_pos_mult
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/vec_pos_mult_dv
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/div_dout_tvalid
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/div_dout_tdata
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/div_q
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/div_r
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/mult
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group CVP2 -group zcalc0 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -expand -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2497124276 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
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
WaveRestoreZoom {2317654437 fs} {2814287126 fs}