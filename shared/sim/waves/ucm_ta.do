onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ucm_tb/DUMMY
add wave -noupdate /ucm_tb/IN_SLC_FILE
add wave -noupdate /ucm_tb/PRJ_INFO
add wave -noupdate /ucm_tb/axi_rst
add wave -noupdate /ucm_tb/bx
add wave -noupdate /ucm_tb/clk
add wave -noupdate /ucm_tb/clk_axi
add wave -noupdate /ucm_tb/clk_axi_cnt
add wave -noupdate /ucm_tb/clk_period
add wave -noupdate /ucm_tb/clk_tdc_time
add wave -noupdate /ucm_tb/clk_tdc_time_period
add wave -noupdate /ucm_tb/clk_time
add wave -noupdate /ucm_tb/clk_time_period
add wave -noupdate /ucm_tb/ctrl_r
add wave -noupdate /ucm_tb/ctrl_v
add wave -noupdate /ucm_tb/enable_slc
add wave -noupdate /ucm_tb/glob_en
add wave -noupdate /ucm_tb/i_slc_data_mainA_av
add wave -noupdate /ucm_tb/i_slc_data_mainB_av
add wave -noupdate /ucm_tb/i_slc_data_neighborA_v
add wave -noupdate /ucm_tb/i_slc_data_neighborB_v
add wave -noupdate /ucm_tb/mon_r
add wave -noupdate /ucm_tb/mon_v
add wave -noupdate /ucm_tb/o_uCM2hps_ext_av
add wave -noupdate /ucm_tb/o_uCM2hps_inn_av
add wave -noupdate /ucm_tb/o_uCM2hps_mid_av
add wave -noupdate /ucm_tb/o_uCM2hps_out_av
add wave -noupdate /ucm_tb/o_uCM2pl_av
add wave -noupdate /ucm_tb/reset_init_cycles
add wave -noupdate /ucm_tb/rst
add wave -noupdate /ucm_tb/slc_event_ai
add wave -noupdate /ucm_tb/slc_file_ok
add wave -noupdate /ucm_tb/slc_file_ts
add wave -noupdate /ucm_tb/tb_curr_tdc_time
add wave -noupdate /ucm_tb/tb_curr_time
add wave -noupdate /ucm_tb/ttc_commands
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1561732 fs} 0}
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
WaveRestoreZoom {149999999342 fs} {150000000035 fs}
