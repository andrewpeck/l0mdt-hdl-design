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
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/clk
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/rst
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/glob_en
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/ttc_commands
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/ctrl_v
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/mon_v
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/ctrl_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/mon_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/super_ctrl_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/super_mon_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/super_ctrl_v
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/super_mon_v
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/r_phi_comp_ctrl_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/r_phi_comp_ctrl_v
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/r_phi_comp_mon_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/r_phi_comp_mon_av
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/r_phi_comp_mon_null
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/rpc_R_mon_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/rpc_R_mon_v
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/rpc_mon_a
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/rpc_mon_av
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/rpc_mon_null
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/mdt_R_mon_r
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/mdt_R_mon_v
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/mdt_mon_a
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/mdt_mon_av
add wave -noupdate -group UCM_top -group c&m /ucm_tb/UCM_DUT/UCM_VER/UCM/mdt_mon_null
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/local_en
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/local_rst
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/i_slc_data_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/prepro2ctrl_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/csw_main_in_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/csw_ctrl_dv
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/csw_main_out_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/csw_main_out_dv
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/slc_endcap_ar
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/cpam_in_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/cpam_out_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/csw_control_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/pam_CSW_control
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/proc_info_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/cvp_in_en
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/cvp_loc_rst
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/uCM2hps_data
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/phicenter
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/aux_uCM2hps_inn_r
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_inn_ar
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_mid_ar
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_out_ar
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_ext_ar
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2tar_inn_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2tar_mid_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2tar_out_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2tar_ext_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM_top /ucm_tb/UCM_DUT/UCM_VER/UCM/o_uCM2pl_av
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_NUM_RPC_LAYERS
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_NUM_MDT_LAYERS
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_INPUT_RESOLUTION
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_OUTPUT_WIDTH
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DIV_IP_R2_EN
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DIV_VU_EN
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DIV_SEL
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DATA_SET_VERSION
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_SLOPE_DIV_IPR2_ENABLE
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_off_DIV_IPR2_ENABLE
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/clk
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rst
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/ena
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_cointype
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_data_valid
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_offset
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_offset_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_slope
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_slope_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/num_h_i
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/set_data_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x_pl1
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x_pl1_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y_pl1
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y_pl1_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xy
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xy_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xx
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xx_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSx
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSx_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxx
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxx_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c_red
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/pl_param_c_red
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/pl_param_c_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxxSy
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxxSy_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSxy
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSxy_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b_red
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/plz_param_b
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/plz_param_b_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxy
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxy_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSy
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSy_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_red
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_red_pl1
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_pl_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_sc
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_den_sc
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_sc
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tvalid
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata_q
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata_r
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b_sc
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_den_sc
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_sc
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tvalid
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata_q
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata_r
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dv
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/pl_mdt_R_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/vec_z_pos_dv_a
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sig_SLC_Z_RPC_LEN
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/scale_slope_nom
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/scale_off_nom
add wave -noupdate /ucm_tb/UCM_DUT/UCM_VER/UCM/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/scale_Z_nom
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9935182152 fs} 0}
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
WaveRestoreZoom {9927615866 fs} {10003809692 fs}
