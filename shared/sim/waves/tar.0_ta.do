onerror {resume}
quietly WaveActivateNextPane {} 0
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
add wave -noupdate -expand -group TAR /tar_tb/TAR/g_HPS_MAX_HP
add wave -noupdate -expand -group TAR /tar_tb/TAR/g_STATION
add wave -noupdate -expand -group TAR /tar_tb/TAR/clk
add wave -noupdate -expand -group TAR /tar_tb/TAR/rst
add wave -noupdate -expand -group TAR /tar_tb/TAR/glob_en
add wave -noupdate -expand -group TAR /tar_tb/TAR/ctrl_v
add wave -noupdate -expand -group TAR /tar_tb/TAR/i_tdc_hits_av
add wave -noupdate -expand -group TAR /tar_tb/TAR/ctrl_r
add wave -noupdate -expand -group TAR /tar_tb/TAR/mon_r
add wave -noupdate -expand -group TAR /tar_tb/TAR/ctrl_pl_v
add wave -noupdate -expand -group TAR /tar_tb/TAR/mon_pl_v
add wave -noupdate -expand -group TAR /tar_tb/TAR/i_tdc_hits_ar
add wave -noupdate -expand -group TAR /tar_tb/TAR/local_en
add wave -noupdate -expand -group TAR /tar_tb/TAR/local_rst
add wave -noupdate -expand -group TAR /tar_tb/TAR/int_freeze
add wave -noupdate -expand -group TAR /tar_tb/TAR/PL_ST_CTRL_LEN
add wave -noupdate -expand -group TAR /tar_tb/TAR/PL_ST_MON_LEN
add wave -noupdate -expand -group TAR /tar_tb/TAR/mon_v
add wave -noupdate -expand -group TAR /tar_tb/TAR/o_tdc_hits_av
add wave -noupdate -expand -group TAR /tar_tb/TAR/o_tar_hits_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1088315217 fs} 0}
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
