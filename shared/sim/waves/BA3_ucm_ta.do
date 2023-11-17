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
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/clk
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/rst
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/glob_en
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/ttc_commands
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/ctrl_v
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/mon_v
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/ctrl_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/mon_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/super_ctrl_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/super_mon_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/super_ctrl_v
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/super_mon_v
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/r_phi_comp_ctrl_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/r_phi_comp_ctrl_v
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/r_phi_comp_mon_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/r_phi_comp_mon_av
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/r_phi_comp_mon_null
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/rpc_R_mon_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/rpc_R_mon_v
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/rpc_mon_a
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/rpc_mon_av
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/rpc_mon_null
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/mdt_R_mon_r
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/mdt_R_mon_v
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/mdt_mon_a
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/mdt_mon_av
add wave -noupdate -group UCM_DUT -group c&m /ucm_tb/UCM_DUT/mdt_mon_null
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_mainA_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_mainB_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_neighborA_v
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_neighborB_v
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/local_en
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/local_rst
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/i_slc_data_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/prepro2ctrl_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/csw_main_in_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/csw_ctrl_dv
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/csw_main_out_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/csw_main_out_dv
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/slc_endcap_ar
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/cpam_in_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/cpam_out_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/csw_control_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/pam_CSW_control
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/proc_info_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/cvp_in_en
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/cvp_loc_rst
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/uCM2hps_data
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/cde_chamber_z_org_bus
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/cvp_chamber_z_org_bus
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/phicenter
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/aux_uCM2hps_inn_r
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_inn_ar
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_mid_ar
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_out_ar
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_ext_ar
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2pl_ar
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/int_uCM2pl_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_inn_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_mid_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_out_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2tar_ext_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_inn_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_mid_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_out_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2hps_ext_av
add wave -noupdate -group UCM_DUT /ucm_tb/UCM_DUT/o_uCM2pl_av
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/g_DELAY_CYCLES
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/clk
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/rst
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/ena
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/i_slc_data_v
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/o_prepro2ctrl_v
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/o_prepro_data_v
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/o_prepro_data_dv
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/i_slc_data_r
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/prepro_data_r
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/i_barrel
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/o_barrel
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/prepro_data_v
add wave -noupdate -group PP_4 /ucm_tb/UCM_DUT/SLC_PP_A(4)/SLC_PP/o_prepro2ctrl_r
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/clk
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/rst
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/ena
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/i_prepro2ctrl_av
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/num_cand
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/clk
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/rst
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/ena
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/i_data
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_csw_ctrl
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_csw_ctrl_dv
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_num_cand
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_pam_update
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/alg_status
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/i_data_ar
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/data_ar
add wave -noupdate -group ctrl -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/input_valids
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/pam_update
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/clk
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/rst
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/ena
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/i_num_cand
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/i_pam_update
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/o_pam_ctrl
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/o_pam_ctrl_dv
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/o_proc_info_av
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/o_cvp_rst
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/o_cvp_ctrl
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/int_pam_ctrl_ar
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/int_proc_info_ar
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/int_pam_ctrl_av
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/o_pam_ctrl_av
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/int_proc_info_av
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/int_cvp_rst_v
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/int_cvp_ctrl_v
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/ch_busy
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/proc_info_ar
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/o_proc_info_ar
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/ch_count_av
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/processing
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/processed_s
add wave -noupdate -group ctrl -group PAM /ucm_tb/UCM_DUT/SLC_CTRL/PAM_CTRL/buff_pam_ctrl_ar
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_csw_ctrl_ar
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_csw_ctrl_av
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_csw_ctrl_dv
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_pam_ctrl
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_pam_ctrl_dv
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_proc_info_av
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_cvp_rst
add wave -noupdate -group ctrl /ucm_tb/UCM_DUT/SLC_CTRL/o_cvp_ctrl
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/clk
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/rst
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/glob_en
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/i_control_av
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/i_data_av
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/i_dv
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/o_data_av
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/o_dv
add wave -noupdate -group Main_CSW /ucm_tb/UCM_DUT/SLC_CSW/control_ar
add wave -noupdate -group PAM_CSW /ucm_tb/UCM_DUT/SLC_PAM_CSW/clk
add wave -noupdate -group PAM_CSW /ucm_tb/UCM_DUT/SLC_PAM_CSW/rst
add wave -noupdate -group PAM_CSW /ucm_tb/UCM_DUT/SLC_PAM_CSW/glob_en
add wave -noupdate -group PAM_CSW /ucm_tb/UCM_DUT/SLC_PAM_CSW/i_control
add wave -noupdate -group PAM_CSW /ucm_tb/UCM_DUT/SLC_PAM_CSW/i_data
add wave -noupdate -group PAM_CSW /ucm_tb/UCM_DUT/SLC_PAM_CSW/o_data
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/g_MAX_POSSIBLE_HPS
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/g_NUM_MDT_LAYERS
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/g_NUM_RPC_LAYERS
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/clk
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rst
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/ena
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/ctrl_v
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mon_v
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/ctrl_r
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mon_r
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rpc_R_ctrl_r
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rpc_R_mon_r
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rpc_R_ctrl_v
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rpc_R_mon_v
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mdt_R_ctrl_r
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mdt_R_mon_r
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mdt_R_ctrl_v
add wave -noupdate -group VP_1 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mdt_R_mon_v
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/i_local_rst
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/i_in_en
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/i_data_v
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/local_rst
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rpc_radius_av
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rpc_radius_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mdt_radius_av
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/mdt_radius_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_data_v
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_data_v_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_data_r
add wave -noupdate -group VP_1 -expand /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/i_data_r
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/barrel_r
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/rpc_Z_a
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/offset
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/slope
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_slope
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/offset_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/slope_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_slope_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/atan_slope
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/atan_slope_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_atan_slope
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_atan_slope_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/vec_pos_a
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/vec_pos_a_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_vec_pos_a
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/pl_vec_pos_a_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/ucm2hps_buff_ar
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/ucm2hps_ar
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -group VP_1 /ucm_tb/UCM_DUT/SLC_VP_A(1)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/bypass
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/phimod_ena
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/clk
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/rst
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/ena
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_phicenter
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_proc_info_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_slc_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_slc_data_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/barrel_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/rpc_z_a
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_proc_info_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_slc_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_slc_data_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int2_slc_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int2_slc_data_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_chamb_ieta
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/slc_posphi
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_phimod_abs_pl
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_phimod_pl
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_phimod_pl_dv
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_abs_dv
add wave -noupdate -expand -group CDE4 -expand /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_cde_data_r
add wave -noupdate -expand -group CDE4 -expand /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_uCM2pl_r
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_cde_data_v
add wave -noupdate -expand -group CDE4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_ucm2pl_v
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1423404391 fs} 0}
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
WaveRestoreZoom {1401686384 fs} {1495646024 fs}
