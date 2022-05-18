onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group ucm_tb /ucm_tb/PRJ_INFO
add wave -noupdate -expand -group ucm_tb /ucm_tb/IN_SLC_FILE
add wave -noupdate -expand -group ucm_tb /ucm_tb/DUMMY
add wave -noupdate -expand -group ucm_tb /ucm_tb/enable_slc
add wave -noupdate -expand -group ucm_tb /ucm_tb/axi_rst
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk_axi
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk_axi_cnt
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk_time
add wave -noupdate -expand -group ucm_tb /ucm_tb/tb_curr_time
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk_tdc_time
add wave -noupdate -expand -group ucm_tb /ucm_tb/tb_curr_tdc_time
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk
add wave -noupdate -expand -group ucm_tb /ucm_tb/rst
add wave -noupdate -expand -group ucm_tb /ucm_tb/glob_en
add wave -noupdate -expand -group ucm_tb /ucm_tb/bx
add wave -noupdate -expand -group ucm_tb /ucm_tb/ttc_commands
add wave -noupdate -expand -group ucm_tb /ucm_tb/ctrl_r
add wave -noupdate -expand -group ucm_tb /ucm_tb/mon_r
add wave -noupdate -expand -group ucm_tb /ucm_tb/ctrl_v
add wave -noupdate -expand -group ucm_tb /ucm_tb/mon_v
add wave -noupdate -expand -group ucm_tb /ucm_tb/i_slc_data_mainA_av
add wave -noupdate -expand -group ucm_tb /ucm_tb/i_slc_data_mainB_av
add wave -noupdate -expand -group ucm_tb /ucm_tb/i_slc_data_neighborA_v
add wave -noupdate -expand -group ucm_tb /ucm_tb/i_slc_data_neighborB_v
add wave -noupdate -expand -group ucm_tb /ucm_tb/o_uCM2hps_inn_av
add wave -noupdate -expand -group ucm_tb /ucm_tb/o_uCM2hps_mid_av
add wave -noupdate -expand -group ucm_tb /ucm_tb/o_uCM2hps_out_av
add wave -noupdate -expand -group ucm_tb /ucm_tb/o_uCM2hps_ext_av
add wave -noupdate -expand -group ucm_tb /ucm_tb/o_uCM2pl_av
add wave -noupdate -expand -group ucm_tb /ucm_tb/slc_file_ok
add wave -noupdate -expand -group ucm_tb /ucm_tb/slc_file_ts
add wave -noupdate -expand -group ucm_tb /ucm_tb/slc_event_ai
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk_time_period
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk_tdc_time_period
add wave -noupdate -expand -group ucm_tb /ucm_tb/clk_period
add wave -noupdate -expand -group ucm_tb /ucm_tb/reset_init_cycles
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/clk
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/rst
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/glob_en
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/ttc_commands
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/ctrl_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/i_slc_data_mainA_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/i_slc_data_mainB_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/i_slc_data_neighborA_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/i_slc_data_neighborB_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/ctrl_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/mon_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/super_ctrl_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/super_mon_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/super_ctrl_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/super_mon_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/r_phi_comp_ctrl_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/r_phi_comp_ctrl_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/r_phi_comp_mon_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/r_phi_comp_mon_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/r_phi_comp_mon_null
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/rpc_R_mon_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/rpc_R_mon_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/rpc_mon_a
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/rpc_mon_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/rpc_mon_null
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/mdt_R_mon_r
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/mdt_R_mon_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/mdt_mon_a
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/mdt_mon_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/mdt_mon_null
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/local_en
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/local_rst
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/i_slc_data_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/prepro2ctrl_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/csw_main_in_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/csw_main_out_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/slc_endcap_ar
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/cpam_in_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/cpam_out_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/uCM2pl_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/csw_control_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/pam_CSW_control
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/proc_info_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/cvp_in_en
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/cvp_loc_rst
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/uCM2hps_data
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/cde_chamber_z_org_bus
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/cvp_chamber_z_org_bus
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/phicenter
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/mon_v
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/o_uCM2hps_inn_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/o_uCM2hps_mid_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/o_uCM2hps_out_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/o_uCM2hps_ext_av
add wave -noupdate -expand -group ucm_dut /ucm_tb/UCM_DUT/o_uCM2pl_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {149999997511 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 fs} {157500 ns}
