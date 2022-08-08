onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group tar_tb /tar_tb/g_HPS_MAX_HP
add wave -noupdate -group tar_tb /tar_tb/g_STATION
add wave -noupdate -group tar_tb /tar_tb/PRJ_INFO
add wave -noupdate -group tar_tb /tar_tb/IN_SLC_FILE
add wave -noupdate -group tar_tb /tar_tb/IN_HIT_FILE
add wave -noupdate -group tar_tb /tar_tb/IN_CTRL_FILE
add wave -noupdate -group tar_tb /tar_tb/DUMMY
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
add wave -noupdate -group tar_tb /tar_tb/tar_inn_ctrl
add wave -noupdate -group tar_tb /tar_tb/tar_inn_mon
add wave -noupdate -group tar_tb /tar_tb/tar_mid_ctrl
add wave -noupdate -group tar_tb /tar_tb/tar_mid_mon
add wave -noupdate -group tar_tb /tar_tb/tar_out_ctrl
add wave -noupdate -group tar_tb /tar_tb/tar_out_mon
add wave -noupdate -group tar_tb /tar_tb/tar_ext_ctrl
add wave -noupdate -group tar_tb /tar_tb/tar_ext_mon
add wave -noupdate -group tar_tb /tar_tb/tar_inn_ctrl_v
add wave -noupdate -group tar_tb /tar_tb/tar_inn_mon_v
add wave -noupdate -group tar_tb /tar_tb/tar_mid_ctrl_v
add wave -noupdate -group tar_tb /tar_tb/tar_mid_mon_v
add wave -noupdate -group tar_tb /tar_tb/tar_out_ctrl_v
add wave -noupdate -group tar_tb /tar_tb/tar_out_mon_v
add wave -noupdate -group tar_tb /tar_tb/tar_ext_ctrl_v
add wave -noupdate -group tar_tb /tar_tb/tar_ext_mon_v
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_inn_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_mid_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_out_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_ext_av
add wave -noupdate -group tar_tb /tar_tb/i_mdt_tdc_av
add wave -noupdate -group tar_tb /tar_tb/ctrl_r
add wave -noupdate -group tar_tb /tar_tb/mon_r
add wave -noupdate -group tar_tb /tar_tb/ctrl_v
add wave -noupdate -group tar_tb /tar_tb/mon_v
add wave -noupdate -group tar_tb /tar_tb/o_tdc_hits_av
add wave -noupdate -group tar_tb /tar_tb/o_tar_hits_av
add wave -noupdate -group tar_tb /tar_tb/mdt_file_ok
add wave -noupdate -group tar_tb /tar_tb/mdt_file_ts
add wave -noupdate -group tar_tb /tar_tb/mdt_event_ai
add wave -noupdate -group tar_tb /tar_tb/clk_time_period
add wave -noupdate -group tar_tb /tar_tb/clk_tdc_time_period
add wave -noupdate -group tar_tb /tar_tb/clk_period
add wave -noupdate -group tar_tb /tar_tb/reset_init_cycles
add wave -noupdate -group MDT_IN /tar_tb/MDT/clk
add wave -noupdate -group MDT_IN /tar_tb/MDT/enable
add wave -noupdate -group MDT_IN /tar_tb/MDT/g_verbose
add wave -noupdate -group MDT_IN /tar_tb/MDT/IN_HIT_FILE
add wave -noupdate -group MDT_IN /tar_tb/MDT/rst
add wave -noupdate -group MDT_IN /tar_tb/MDT/tb_curr_tdc_time
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_ext_av
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_inn_av
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_mid_av
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_out_av
add wave -noupdate -group MDT_IN /tar_tb/MDT/o_file_ok
add wave -noupdate -group MDT_IN /tar_tb/MDT/o_file_ts
add wave -noupdate -group MDT_IN /tar_tb/MDT/csv_file
add wave -noupdate -group MDT_IN /tar_tb/MDT/file_open
add wave -noupdate -group MDT_IN /tar_tb/MDT/file_ts
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_ext_ar
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_inn_ar
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_mid_ar
add wave -noupdate -group MDT_IN /tar_tb/MDT/i_mdt_tdc_out_ar
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_event_ai
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_ext_counts
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_ext_fifo
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_inn_counts
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_inn_fifo
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_mid_counts
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_mid_fifo
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_new_event
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_out_counts
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_out_fifo
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_tdc_event_r
add wave -noupdate -group MDT_IN /tar_tb/MDT/mdt_tdc_station
add wave -noupdate -group TAR /tar_tb/TAR/g_HPS_MAX_HP
add wave -noupdate -group TAR /tar_tb/TAR/g_STATION
add wave -noupdate -group TAR /tar_tb/TAR/clk
add wave -noupdate -group TAR /tar_tb/TAR/rst
add wave -noupdate -group TAR /tar_tb/TAR/glob_en
add wave -noupdate -group TAR /tar_tb/TAR/ctrl_v
add wave -noupdate -group TAR /tar_tb/TAR/i_tdc_hits_av
add wave -noupdate -group TAR /tar_tb/TAR/ctrl_r
add wave -noupdate -group TAR /tar_tb/TAR/mon_r
add wave -noupdate -group TAR /tar_tb/TAR/ctrl_pl_v
add wave -noupdate -group TAR /tar_tb/TAR/mon_pl_v
add wave -noupdate -group TAR /tar_tb/TAR/i_tdc_hits_ar
add wave -noupdate -group TAR /tar_tb/TAR/local_en
add wave -noupdate -group TAR /tar_tb/TAR/local_rst
add wave -noupdate -group TAR /tar_tb/TAR/int_freeze
add wave -noupdate -group TAR /tar_tb/TAR/PL_ST_CTRL_LEN
add wave -noupdate -group TAR /tar_tb/TAR/PL_ST_MON_LEN
add wave -noupdate -group TAR /tar_tb/TAR/mon_v
add wave -noupdate -group TAR /tar_tb/TAR/o_tdc_hits_av
add wave -noupdate -group TAR /tar_tb/TAR/o_tar_hits_av
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/clk
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/enable
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/g_HPS_MAX_HP
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/g_IN_HIT_FILE
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/g_IN_L0_FILE
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/g_IN_SLC_FILE
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/g_PRJ_INFO
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/in_mdt_file_ok
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/in_mdt_file_ts
add wave -noupdate -group TAR2HPS_CSV -expand /tar_tb/TAR2HPS/o_tar_hits_av
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/o_tdc_hits_av
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/rst
add wave -noupdate -group TAR2HPS_CSV -radix decimal /tar_tb/TAR2HPS/tb_curr_tdc_time
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/csv_file_1
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/csv_file_2
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/g_OUT_FILE_1
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/g_OUT_FILE_2
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/mdt_event_u2h_au
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/mdt_event_u2m_au
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/tar_hits_ar
add wave -noupdate -group TAR2HPS_CSV /tar_tb/TAR2HPS/tdc_hits_ar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {933423913 fs} 0}
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
