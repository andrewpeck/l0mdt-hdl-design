onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ucm_tb /ucm_tb/DUMMY
add wave -noupdate -group ucm_tb /ucm_tb/IN_CTRL_FILE
add wave -noupdate -group ucm_tb /ucm_tb/IN_SLC_FILE
add wave -noupdate -group ucm_tb /ucm_tb/PRJ_INFO
add wave -noupdate -group ucm_tb /ucm_tb/axi_rst
add wave -noupdate -group ucm_tb /ucm_tb/bx
add wave -noupdate -group ucm_tb /ucm_tb/clk
add wave -noupdate -group ucm_tb /ucm_tb/clk_axi
add wave -noupdate -group ucm_tb /ucm_tb/clk_axi_cnt
add wave -noupdate -group ucm_tb /ucm_tb/clk_period
add wave -noupdate -group ucm_tb /ucm_tb/clk_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/clk_sim_time_period
add wave -noupdate -group ucm_tb /ucm_tb/clk_tdc_time
add wave -noupdate -group ucm_tb /ucm_tb/clk_tdc_time_period
add wave -noupdate -group ucm_tb /ucm_tb/clk_time
add wave -noupdate -group ucm_tb /ucm_tb/clk_time_period
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_r
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_v
add wave -noupdate -group ucm_tb /ucm_tb/enable_slc
add wave -noupdate -group ucm_tb /ucm_tb/files_str
add wave -noupdate -group ucm_tb /ucm_tb/glob_en
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_mainA_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_mainB_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborA_v
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborB_v
add wave -noupdate -group ucm_tb /ucm_tb/mon_r
add wave -noupdate -group ucm_tb /ucm_tb/mon_v
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_ext_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_inn_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_mid_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_out_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2pl_av
add wave -noupdate -group ucm_tb /ucm_tb/reset_init_cycles
add wave -noupdate -group ucm_tb /ucm_tb/rst
add wave -noupdate -group ucm_tb /ucm_tb/slc_event_ai
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ok
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ts
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_tdc_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_time
add wave -noupdate -group ucm_tb /ucm_tb/ttc_commands
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/clk
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/enable
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/ext_slc_to_h2s_av
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/g_IN_FILES
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/g_PRJ_INFO
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/in_files_str
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ok
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ts
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/inn_slc_to_h2s_av
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/mid_slc_to_h2s_av
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/out_slc_to_h2s_av
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/rst
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_ai
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_sim_time
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_tdc_time
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_av
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_1
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_2
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/ext_ucm2hps_bus_ar
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_1
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_2
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/inn_ucm2hps_bus_ar
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/mid_ucm2hps_bus_ar
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/out_ucm2hps_bus_ar
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2h_au
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2m_au
add wave -noupdate -expand -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_ar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1053984132 fs} 0}
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
WaveRestoreZoom {0 fs} {5250 ns}
