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
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/bypass
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/phimod_ena
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/clk
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/rst
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/ena
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_phicenter
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_proc_info_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_proc_info_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_slc_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int2_slc_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_slc_data_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int2_slc_data_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_cde_data_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/dv_bus
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/rpc_z_a
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_chamb_ieta
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/slc_posphi
add wave -noupdate -expand -group CDE4 -expand -group phimod /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/clk
add wave -noupdate -expand -group CDE4 -expand -group phimod /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/rst
add wave -noupdate -expand -group CDE4 -expand -group phimod /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/ena
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_phicenter
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_posphi
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_dv
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phicenter
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_posphi
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_posphi_pl_dv
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_s
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_abs
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_dv
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_pl
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_abs_pl
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/clk
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/rst
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_A
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_B
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_C
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_in_D
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/i_dv
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/o_result
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/o_dv
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_A
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_B
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_C
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_in_pipe_D
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/mul_output_pipe
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/valid_signal_pipe
add wave -noupdate -expand -group CDE4 -expand -group phimod -group phiscale /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/PHIMOD_SCALE/int_Result
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_phimod_abs
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_phimod
add wave -noupdate -expand -group CDE4 -expand -group phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_dv
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_phimod_abs_pl
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_phimod_pl
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_uCM2pl_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_cde_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_pl_phimod
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_pl_phimod_dv
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_ucm2pl_v
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2500868093 fs} 0}
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
WaveRestoreZoom {2471364109 fs} {2643807757 fs}
