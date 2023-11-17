onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ucm_tb /ucm_tb/PRJ_INFO
add wave -noupdate -group ucm_tb /ucm_tb/IN_SLC_FILE
add wave -noupdate -group ucm_tb /ucm_tb/IN_CTRL_FILE
add wave -noupdate -group ucm_tb /ucm_tb/g_MAINDIVTYPE
add wave -noupdate -group ucm_tb /ucm_tb/DUMMY
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_time_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_tdc_time_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_sim_time_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_time
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_axi
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_axi_cnt
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_tdc_time
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/axi_rst
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_tdc_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/enable_slc
add wave -noupdate -group ucm_tb /ucm_tb/rst
add wave -noupdate -group ucm_tb /ucm_tb/glob_en
add wave -noupdate -group ucm_tb /ucm_tb/bx
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/IN_SLC_FILE
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/g_verbose
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/clk
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/rst
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/enable
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/tb_curr_tdc_time
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_file_ok
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_file_ts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_slc_event_ai
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_main_primary_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_main_secondary_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_plus_neighbor_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_minus_neighbor_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/temp_slc_rx_vt
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_element_temp
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_element
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/event_element_temp
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/event_element
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_event_r
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_new_event
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/event_main_prim_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_event_ai
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_prim_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_seco_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_plus_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_minu_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_prim_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_seco_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_plus_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_minu_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/csv_file
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/file_open
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/file_ts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/SLC_RX_LEN
add wave -noupdate -group ucm_tb /ucm_tb/ttc_commands
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_r
add wave -noupdate -group ucm_tb /ucm_tb/mon_r
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_v
add wave -noupdate -group ucm_tb /ucm_tb/mon_v
add wave -noupdate -group ucm_tb -expand /ucm_tb/i_slc_data_mainA_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_mainB_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborA_v
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborB_v
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_inn_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_mid_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_out_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_ext_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2pl_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_PRJ_INFO
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_IN_FILES
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_verbose
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/clk
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/rst
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/enable
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_sim_time
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_tdc_time
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ok
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ts
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/in_files_str
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_ai
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/inn_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/mid_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/out_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ext_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_1
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_2
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2m_au
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2h_au
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/inn_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/mid_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/out_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ext_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_1
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_2
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ok
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ts
add wave -noupdate -group ucm_tb /ucm_tb/slc_event_ai
add wave -noupdate -group ucm_tb /ucm_tb/files_str
add wave -noupdate -group ucm_tb /ucm_tb/reset_init_cycles
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/clk
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/rst
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/glob_en
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/ttc_commands
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/ctrl_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/mon_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_mainA_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_mainB_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_neighborA_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_neighborB_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_inn_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_mid_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_out_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_ext_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_inn_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_mid_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_out_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_ext_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2pl_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/ctrl_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/mon_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/super_ctrl_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/super_mon_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/super_ctrl_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/super_mon_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/r_phi_comp_ctrl_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/r_phi_comp_ctrl_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/r_phi_comp_mon_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/r_phi_comp_mon_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/r_phi_comp_mon_null
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/rpc_R_mon_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/rpc_R_mon_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/rpc_mon_a
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/rpc_mon_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/rpc_mon_null
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/mdt_R_mon_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/mdt_R_mon_v
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/mdt_mon_a
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/mdt_mon_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/mdt_mon_null
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/local_en
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/local_rst
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/prepro2ctrl_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/csw_main_in_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/csw_ctrl_dv
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/csw_main_out_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/csw_main_out_dv
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/slc_endcap_ar
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/cpam_in_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/cpam_out_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/csw_control_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/pam_CSW_control
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/proc_info_av
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/cvp_in_en
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/cvp_loc_rst
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/uCM2hps_data
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/cde_chamber_z_org_bus
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/cvp_chamber_z_org_bus
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/phicenter
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/aux_uCM2hps_inn_r
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_inn_ar
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_mid_ar
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_out_ar
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_ext_ar
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2pl_ar
add wave -noupdate -expand -group UCM_DUT /ucm_tb/UCM_DUT/int_uCM2pl_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2072986577 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
configure wave -valuecolwidth 170
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 3125
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 fs} {10500 ns}
