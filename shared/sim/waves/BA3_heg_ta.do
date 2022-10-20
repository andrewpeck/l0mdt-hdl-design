onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/DUMMY
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/g_ST_ENABLE
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/g_THREAD
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/IN_CTRL_FILE
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/IN_HPS_PC_FILE
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/IN_UCM_FILE
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/PRJ_INFO
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/axi_rst
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/bx
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_axi
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_axi_cnt
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_period
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_sim_time
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_sim_time_period
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_tdc_time
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_tdc_time_period
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_time
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/clk_time_period
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/ena
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/glob_en
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/i_freeze
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/reset_init_cycles
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/rst
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/tb_curr_sim_time
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/tb_curr_tdc_time
add wave -noupdate -expand -group heg_tb -group ctrl /heg_tb/tb_curr_time
add wave -noupdate -expand -group heg_tb /heg_tb/ctrl_aar
add wave -noupdate -expand -group heg_tb /heg_tb/ctrl_aav
add wave -noupdate -expand -group heg_tb /heg_tb/heg2sf_control_aarv
add wave -noupdate -expand -group heg_tb /heg_tb/heg2sf_mdt_data_aav
add wave -noupdate -expand -group heg_tb /heg_tb/heg2sf_slc_data_aav
add wave -noupdate -expand -group heg_tb /heg_tb/i_uCM_data_v
add wave -noupdate -expand -group heg_tb /heg_tb/mon_aar
add wave -noupdate -expand -group heg_tb /heg_tb/mon_aav
add wave -noupdate -expand -group heg_tb /heg_tb/o_sf_control_v
add wave -noupdate -expand -group heg_tb /heg_tb/o_sf_mdt_data_v
add wave -noupdate -expand -group heg_tb /heg_tb/o_sf_slc_data_v
add wave -noupdate -expand -group heg_tb /heg_tb/pc2heg_aav
add wave -noupdate -expand -group heg_tb /heg_tb/pc2heg_file_ok
add wave -noupdate -expand -group heg_tb /heg_tb/pc2heg_file_ts
add wave -noupdate -expand -group heg_tb /heg_tb/pc2heg_mdt_event_au
add wave -noupdate -expand -group heg_tb /heg_tb/pc2heg_slc_event_au
add wave -noupdate -expand -group heg_tb /heg_tb/pl_ucm2hps_aav
add wave -noupdate -expand -group heg_tb /heg_tb/pl_ucm2hps_slc_event_a
add wave -noupdate -expand -group heg_tb -expand /heg_tb/ucm2heg_aav
add wave -noupdate -expand -group heg_tb -expand /heg_tb/ucm2hps_aav
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/g_STATION_RADIUS
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/g_HPS_NUM_MDT_CH
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/clk
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/rst
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/glob_en
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/i_uCM_data_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_r
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_r
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_roi_tc_r
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_roi_tc_r
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_roi_tc_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_roi_tc_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/SLC_Window_av
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/SLC_Window_ar
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/win_row_0
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/uCM_data_r
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/Roi_win_valid
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_sf_control_r
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/roi_global_x
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/roi_global_z
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/roi_dv
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/mon_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_uCM2sf_data_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_uCM2hp_data_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_SLC_Window_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_SLC_Win_dv
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_sig_uCM2hp_data_dv
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/ctrl_sig_uCM2sf_data_dv
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_sf_control_v
add wave -noupdate -expand -group heg_ctrl /heg_tb/ST_FOR(0)/ST_IG/TH_FOR(0)/TH_IF/HEG/Heg_Control/o_hp_control_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7162037037 fs} 0}
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
WaveRestoreZoom {0 fs} {10500 ns}
