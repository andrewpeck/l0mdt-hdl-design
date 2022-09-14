onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hps_tb/g_HPS_MAX_HP
add wave -noupdate /hps_tb/g_ST_ACT
add wave -noupdate /hps_tb/g_ST_ENABLE
add wave -noupdate /hps_tb/IN_CTRL_FILE
add wave -noupdate /hps_tb/IN_TAR_FILE
add wave -noupdate /hps_tb/IN_UCM_FILE
add wave -noupdate /hps_tb/PRJ_INFO
add wave -noupdate /hps_tb/axi_rst
add wave -noupdate /hps_tb/bx
add wave -noupdate /hps_tb/clk
add wave -noupdate /hps_tb/clk_axi
add wave -noupdate /hps_tb/clk_axi_cnt
add wave -noupdate /hps_tb/clk_period
add wave -noupdate /hps_tb/clk_tdc_time
add wave -noupdate /hps_tb/clk_tdc_time_period
add wave -noupdate /hps_tb/clk_time
add wave -noupdate /hps_tb/clk_time_period
add wave -noupdate /hps_tb/ctrl_inn_r
add wave -noupdate /hps_tb/ctrl_inn_v
add wave -noupdate /hps_tb/glob_en
add wave -noupdate /hps_tb/hps2pt_inn_av
add wave -noupdate /hps_tb/mon_inn_r
add wave -noupdate /hps_tb/mon_inn_v
add wave -noupdate /hps_tb/reset_init_cycles
add wave -noupdate /hps_tb/rst
add wave -noupdate /hps_tb/tar2hps_ext_av
add wave -noupdate /hps_tb/tar2hps_file_ok
add wave -noupdate /hps_tb/tar2hps_file_ts
add wave -noupdate /hps_tb/tar2hps_inn_av
add wave -noupdate /hps_tb/tar2hps_mdt_event_ai
add wave -noupdate /hps_tb/tar2hps_mid_av
add wave -noupdate /hps_tb/tar2hps_out_av
add wave -noupdate /hps_tb/tb_curr_tdc_time
add wave -noupdate /hps_tb/tb_curr_time
add wave -noupdate /hps_tb/ucm2hps_ext_av
add wave -noupdate /hps_tb/ucm2hps_file_ok
add wave -noupdate /hps_tb/ucm2hps_file_ts
add wave -noupdate /hps_tb/ucm2hps_inn_av
add wave -noupdate /hps_tb/ucm2hps_mid_av
add wave -noupdate /hps_tb/ucm2hps_out_av
add wave -noupdate /hps_tb/ucm2hps_slc_event_ai
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15124512 fs} 0}
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
WaveRestoreZoom {0 fs} {82031250 fs}
