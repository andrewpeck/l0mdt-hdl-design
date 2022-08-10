onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/g_HPS_MAX_HP
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/g_ST_ENABLE
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/PRJ_INFO
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/IN_SLC_FILE
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/IN_HIT_FILE
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/IN_CTRL_FILE
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/DUMMY
add wave -noupdate -group tar_tb -expand -group generics /tar_tb/ST_ENABLE
add wave -noupdate -group tar_tb /tar_tb/enable_mdt
add wave -noupdate -group tar_tb /tar_tb/axi_rst
add wave -noupdate -group tar_tb /tar_tb/clk_axi
add wave -noupdate -group tar_tb /tar_tb/clk_axi_cnt
add wave -noupdate -group tar_tb /tar_tb/clk_time
add wave -noupdate -group tar_tb /tar_tb/tb_curr_time
add wave -noupdate -group tar_tb /tar_tb/clk_tdc_time
add wave -noupdate -group tar_tb /tar_tb/tb_curr_tdc_time
add wave -noupdate -group tar_tb /tar_tb/clk
add wave -noupdate -group tar_tb /tar_tb/rst
add wave -noupdate -group tar_tb /tar_tb/glob_en
add wave -noupdate -group tar_tb /tar_tb/bx
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_inn_ctrl_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_mid_ctrl_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_out_ctrl_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_ext_ctrl_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_inn_mon_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_mid_mon_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_out_mon_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_ext_mon_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_inn_ctrl_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_mid_ctrl_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_out_ctrl_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_ext_ctrl_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_inn_mon_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_mid_mon_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_out_mon_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/tar_ext_mon_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/ctrl_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/mon_r
add wave -noupdate -group tar_tb -group c&m /tar_tb/ctrl_v
add wave -noupdate -group tar_tb -group c&m /tar_tb/mon_v
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_inn_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_mid_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_out_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_ext_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_av
add wave -noupdate -group tar_tb /tar_tb/o_tdc_hits_inn_av
add wave -noupdate -group tar_tb /tar_tb/o_tdc_hits_mid_av
add wave -noupdate -group tar_tb /tar_tb/o_tdc_hits_out_av
add wave -noupdate -group tar_tb /tar_tb/o_tdc_hits_ext_av
add wave -noupdate -group tar_tb /tar_tb/o_tar_hits_inn_av
add wave -noupdate -group tar_tb /tar_tb/o_tar_hits_mid_av
add wave -noupdate -group tar_tb /tar_tb/o_tar_hits_out_av
add wave -noupdate -group tar_tb /tar_tb/o_tar_hits_ext_av
add wave -noupdate -group tar_tb /tar_tb/mdt_file_ok
add wave -noupdate -group tar_tb /tar_tb/mdt_file_ts
add wave -noupdate -group tar_tb /tar_tb/mdt_event_ai
add wave -noupdate -group tar_tb /tar_tb/clk_time_period
add wave -noupdate -group tar_tb /tar_tb/clk_tdc_time_period
add wave -noupdate -group tar_tb /tar_tb/clk_period
add wave -noupdate -group tar_tb /tar_tb/reset_init_cycles
add wave -noupdate -expand -group mdt /tar_tb/MDT/clk
add wave -noupdate -expand -group mdt /tar_tb/MDT/enable
add wave -noupdate -expand -group mdt /tar_tb/MDT/g_verbose
add wave -noupdate -expand -group mdt /tar_tb/MDT/IN_HIT_FILE
add wave -noupdate -expand -group mdt /tar_tb/MDT/rst
add wave -noupdate -expand -group mdt /tar_tb/MDT/tb_curr_tdc_time
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_file_ok
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_file_ts
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_mdt_event_ai
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_slc_event_ai
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_mdt_tdc_ext_av
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_mdt_tdc_inn_av
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_mdt_tdc_mid_av
add wave -noupdate -expand -group mdt /tar_tb/MDT/o_mdt_tdc_out_av
add wave -noupdate -expand -group mdt /tar_tb/MDT/csv_file
add wave -noupdate -expand -group mdt /tar_tb/MDT/file_open
add wave -noupdate -expand -group mdt /tar_tb/MDT/file_ts
add wave -noupdate -expand -group mdt /tar_tb/MDT/i_mdt_tdc_ext_ar
add wave -noupdate -expand -group mdt /tar_tb/MDT/i_mdt_tdc_inn_ar
add wave -noupdate -expand -group mdt /tar_tb/MDT/i_mdt_tdc_mid_ar
add wave -noupdate -expand -group mdt /tar_tb/MDT/i_mdt_tdc_out_ar
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_ext_counts
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_ext_fifo
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_inn_counts
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_inn_fifo
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_mid_counts
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_mid_fifo
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_new_event
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_out_counts
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_out_fifo
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_tdc_event_r
add wave -noupdate -expand -group mdt /tar_tb/MDT/mdt_tdc_station
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/clk
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/enable
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_HPS_MAX_HP
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_IN_HIT_FILE
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_IN_L0_FILE
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_IN_SLC_FILE
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_PRJ_INFO
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_STATION
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tar_hits_ext_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tar_hits_inn_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tar_hits_mid_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tar_hits_out_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tdc_hits_ext_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tdc_hits_inn_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tdc_hits_mid_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_tdc_hits_out_av
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/in_mdt_file_ok
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/in_mdt_file_ts
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_mdt_event_ai
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/i_slc_event_ai
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/rst
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tb_curr_tdc_time
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/csv_file_1
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/csv_file_2
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_OUT_FILE_1
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/g_OUT_FILE_2
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/mdt_event_u2h_au
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/mdt_event_u2m_au
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tar_hits_ext_ar
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tar_hits_inn_ar
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tar_hits_mid_ar
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tar_hits_out_ar
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tdc_hits_ext_ar
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tdc_hits_inn_ar
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tdc_hits_mid_ar
add wave -noupdate -group tar2hps /tar_tb/TAR2HPS/tdc_hits_out_ar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {810810811 fs} 0}
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
