onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group heg_tb -group cnt /heg_tb/DUMMY
add wave -noupdate -group heg_tb -group cnt /heg_tb/g_ST_ENABLE
add wave -noupdate -group heg_tb -group cnt /heg_tb/g_THREAD
add wave -noupdate -group heg_tb -group cnt /heg_tb/IN_CTRL_FILE
add wave -noupdate -group heg_tb -group cnt /heg_tb/IN_HPS_PC_FILE
add wave -noupdate -group heg_tb -group cnt /heg_tb/IN_UCM_FILE
add wave -noupdate -group heg_tb -group cnt /heg_tb/PRJ_INFO
add wave -noupdate -group heg_tb -group ctrl /heg_tb/axi_rst
add wave -noupdate -group heg_tb -group ctrl /heg_tb/bx
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_axi
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_axi_cnt
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_period
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_sim_time
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_sim_time_period
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_tdc_time
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_tdc_time_period
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_time
add wave -noupdate -group heg_tb -group ctrl /heg_tb/clk_time_period
add wave -noupdate -group heg_tb -group ctrl /heg_tb/ena
add wave -noupdate -group heg_tb -group ctrl /heg_tb/glob_en
add wave -noupdate -group heg_tb -group ctrl /heg_tb/i_freeze
add wave -noupdate -group heg_tb -group ctrl /heg_tb/reset_init_cycles
add wave -noupdate -group heg_tb -group ctrl /heg_tb/rst
add wave -noupdate -group heg_tb -group ctrl /heg_tb/tb_curr_sim_time
add wave -noupdate -group heg_tb -group ctrl /heg_tb/tb_curr_tdc_time
add wave -noupdate -group heg_tb -group ctrl /heg_tb/tb_curr_time
add wave -noupdate -group heg_tb /heg_tb/ctrl_aar
add wave -noupdate -group heg_tb /heg_tb/ctrl_aav
add wave -noupdate -group heg_tb /heg_tb/heg2sf_control_aarv
add wave -noupdate -group heg_tb /heg_tb/heg2sf_mdt_data_aav
add wave -noupdate -group heg_tb /heg_tb/heg2sf_slc_data_aav
add wave -noupdate -group heg_tb /heg_tb/i_uCM_data_v
add wave -noupdate -group heg_tb /heg_tb/mon_aar
add wave -noupdate -group heg_tb /heg_tb/mon_aav
add wave -noupdate -group heg_tb /heg_tb/o_sf_control_v
add wave -noupdate -group heg_tb /heg_tb/o_sf_mdt_data_v
add wave -noupdate -group heg_tb /heg_tb/o_sf_slc_data_v
add wave -noupdate -group heg_tb /heg_tb/pc2heg_aav
add wave -noupdate -group heg_tb /heg_tb/pc2heg_file_ok
add wave -noupdate -group heg_tb /heg_tb/pc2heg_file_ts
add wave -noupdate -group heg_tb /heg_tb/pc2heg_mdt_event_au
add wave -noupdate -group heg_tb /heg_tb/pc2heg_slc_event_au
add wave -noupdate -group heg_tb /heg_tb/pl_ucm2hps_aav
add wave -noupdate -group heg_tb /heg_tb/pl_ucm2hps_slc_event_a
add wave -noupdate -group heg_tb -expand /heg_tb/ucm2heg_aav
add wave -noupdate -group heg_tb -expand -subitemconfig {/heg_tb/ucm2hps_aav(2) -expand /heg_tb/ucm2hps_aav(1) -expand /heg_tb/ucm2hps_aav(0) -expand} /heg_tb/ucm2hps_aav
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/g_STATION_RADIUS
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/g_HPS_NUM_MDT_CH
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/clk
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/rst
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/glob_en
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/i_uCM_data_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_r
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_r
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_roi_tc_r
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_roi_tc_r
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_roi_tc_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_roi_tc_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/SLC_Window_av
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/SLC_Window_ar
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/win_row_0
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/uCM_data_r
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/Roi_win_valid
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_sf_control_r
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/roi_global_x
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/roi_global_z
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/roi_dv
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_uCM2sf_data_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_uCM2hp_data_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_SLC_Window_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_SLC_Win_dv
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_sig_uCM2hp_data_dv
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_sig_uCM2sf_data_dv
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_sf_control_v
add wave -noupdate -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_hp_control_r
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/g_STATION_RADIUS
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/g_HPS_NUM_MDT_CH
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/clk
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/rst
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/glob_en
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/i_uCM_data_r
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/i_Roi_win_origin
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/i_Roi_win_valid
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/i_roi_global_x
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/i_roi_global_z
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/i_roi_global_dv
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/heg_ctrl_motor
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/heg_count_en
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/busy_count
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/enables_a
add wave -noupdate -group heg_ctrl_sig -expand /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_uCM2sf_data_r
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_uCM2hp_data_r
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/b_data
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/csf_slope
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/csf_slope_dv
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_hp_control_r
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_sf_control_r
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_uCM2hp_data_v
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_uCM2hp_data_dv
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_uCM2sf_data_v
add wave -noupdate -group heg_ctrl_sig /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/HEG_SIGNALS/o_uCM2sf_data_dv
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/g_PRJ_INFO
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/g_ST_ENABLE
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/g_IN_UCM2HPS_FILE
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/g_verbose
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/clk
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/rst
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/ena
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/tb_curr_tdc_time
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/csv_file
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/file_open
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/file_ts
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/slc_event_ai
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/ucm_event_r
add wave -noupdate -group ucm2hps -expand -subitemconfig {/heg_tb/UCM2HPS/ucm2hps_fifo(0) -expand} /heg_tb/UCM2HPS/ucm2hps_fifo
add wave -noupdate -group ucm2hps -expand /heg_tb/UCM2HPS/ucm2hps_fifo_counters
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/ucm_event_r0
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/o_file_ok
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/o_file_ts
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/o_slc_event_ai
add wave -noupdate -group ucm2hps -expand /heg_tb/UCM2HPS/o_ucm2hps_inn_av
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/o_ucm2hps_mid_av
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/o_ucm2hps_out_av
add wave -noupdate -group ucm2hps /heg_tb/UCM2HPS/o_ucm2hps_ext_av
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/clk
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/enable
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/g_OUT_CSV_HEG_HIT
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/g_OUT_CSV_HEG_SLC
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/g_PRJ_INFO
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/g_ST_ENABLE
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/i_pc2heg_file_ok
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/i_pc2heg_file_ts
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/i_pc2heg_mdt_event_au
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/i_pc2heg_slc_event_au
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/i_ucm2heg_file_ok
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/i_ucm2heg_file_ts
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/i_ucm2heg_slc_event_au
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/rst
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/tb_curr_sim_time
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/tb_curr_tdc_time
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/in_files_ok
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/in_files_ts
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/OUT_CSV_SLC_EN/csv_file_2
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/OUT_CSV_SLC_EN/temp_heg2sf_aar
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/OUT_CSV_SLC_EN/ucm2heg_slc_event_a
add wave -noupdate -group HEG_INT_OUT /heg_tb/HEGINTOUT/OUT_CSV_SLC_EN/ucm2heg_slc_event_au
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/clk
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/enable
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/g_OUT_HEG2SF_HIT
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/g_PRJ_INFO
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/g_ST_ENABLE
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_file_ok
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_file_ts
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_mdt_event_au
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_slc_event_au
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_sf_control_aav
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_sf_mdt_data_aav
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_sf_slc_data_aav
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_ucm2heg_file_ok
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_ucm2heg_file_ts
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_ucm2heg_slc_event_au
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/rst
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/tb_curr_sim_time
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/tb_curr_tdc_time
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/in_files_ok
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/in_files_ts
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/sf_control_aar
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/sf_mdt_data_aar
add wave -noupdate -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/sf_slc_data_aar
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/clk
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/rst
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/glob_en
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/ctrl_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/mon_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/i_freeze
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/i_uCM_data_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/i_mdt_full_data_av
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/o_sf_control_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/o_sf_slc_data_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/o_sf_mdt_data_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/ctrl_r
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/mon_r
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/ctrl_super_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/mon_super_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/heg_ctrl_ctrl_r
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/heg_ctrl_mon_r
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/heg_ctrl_ctrl_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/heg_ctrl_mon_v
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/ctrl_hp_ar
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/mon_hp_ar
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/ctrl_hp_av
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/mon_hp_av
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/i_uCM_data_r
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/i_mdt_full_data_ar
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/roi_b_Window
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/hegC2hp_uCM_data
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/hegC_control
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/hp2bm_ar
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/hp2bm_av
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/int_freeze
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/int_rst
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/int_ena
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/count_slcs_in_trig
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/count_hits_in_trig
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/count_hits_ok_trig
add wave -noupdate -group heg_0_2 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/count_errors_trig
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/g_HPS_NUM_MDT_CH
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/gc_HPS_NUM_MDT_CH
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/BM_FIFO_DEPTH
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/clk
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/rst
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/glob_en
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/i_control
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/i_mdt_hits_av
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/i_mdt_hits_ar
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/i_mdt_hits_data_av
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/in_dv
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_wr
add wave -noupdate -expand -group heg_0_2_bm -expand /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_rd
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/ff_o_mdt_hit_av
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/ff_o_mdt_hit_dv
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/buff_mdt_hit_v
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/buff_mdt_hit_r
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/buff_mdt_dv
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_used
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_empty
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_empty_next
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_full
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_not_empty
add wave -noupdate -expand -group heg_0_2_bm -expand /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_not_empty_next
add wave -noupdate -expand -group heg_0_2_bm -expand /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/safeguard
add wave -noupdate -expand -group heg_0_2_bm -expand /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/next_ff2r
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/fifo_full_next
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/in_valid_dv
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/output_used
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/direct_out_dv
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/o_mdt_hits_r
add wave -noupdate -expand -group heg_0_2_bm /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/o_mdt_hits_v
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_SIMULATION
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_LOGIC_TYPE
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_FIFO_TYPE
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_MEMORY_TYPE
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_RB_TYPE
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_RAM_WIDTH
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/g_RAM_DEPTH
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/clk
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/rst
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/ena
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/i_wr
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/i_wr_data
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/i_rd
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/o_rd_data
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/o_rd_dv
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/o_empty
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/o_empty_next
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/o_full
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/o_full_next
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/o_used
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/i_delay
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/mem
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/mem_dv
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/int_delay
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/mem2pl
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/mem2pl_dv
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/case_options
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/mem_wr_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/int_mem_wr_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/mem_rd_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/int_mem_rd_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/dv_wr_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/int_dv_wr_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/dv_rd_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/int_dv_rd_index
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/int_wr_data
add wave -noupdate -expand -group heg_0_2_bm_rb_4 /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(2)/TH_IF/HEG/Heg_buffer_mux/FIFOS(4)/rb/used_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2567951820 fs} 0}
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
WaveRestoreZoom {2524621887 fs} {2650333311 fs}
