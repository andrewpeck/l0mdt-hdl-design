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
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/clk
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/enable
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/g_OUT_HEG2SF_HIT
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/g_PRJ_INFO
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/g_ST_ENABLE
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_file_ok
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_file_ts
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_mdt_event_au
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_pc2heg_slc_event_au
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_sf_control_aav
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_sf_mdt_data_aav
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_sf_slc_data_aav
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_ucm2heg_file_ok
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_ucm2heg_file_ts
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/i_ucm2heg_slc_event_au
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/rst
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/tb_curr_sim_time
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/tb_curr_tdc_time
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/in_files_ok
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/in_files_ts
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/sf_control_aar
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/sf_mdt_data_aar
add wave -noupdate -expand -group HEG2SF_OUT /heg_tb/HEG2SF_OUT/sf_slc_data_aar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4856294926 fs} 0}
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
WaveRestoreZoom {4765082319 fs} {5012364089 fs}
