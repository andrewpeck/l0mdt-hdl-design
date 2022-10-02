onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/DUMMY
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/g_STATION_RADIUS
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/g_THREAD
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/IN_CTRL_FILE
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/IN_HPS_PC_FILE
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/IN_UCM_FILE
add wave -noupdate -expand -group heg_tb -group cnt /heg_tb/PRJ_INFO
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/axi_rst
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/bx
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_axi
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_axi_cnt
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_period
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_sim_time
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_sim_time_period
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_tdc_time
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_tdc_time_period
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_time
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/clk_time_period
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/reset_init_cycles
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/tb_curr_sim_time
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/tb_curr_tdc_time
add wave -noupdate -expand -group heg_tb -group clks /heg_tb/tb_curr_time
add wave -noupdate -expand -group heg_tb /heg_tb/clk
add wave -noupdate -expand -group heg_tb /heg_tb/ena
add wave -noupdate -expand -group heg_tb /heg_tb/glob_en
add wave -noupdate -expand -group heg_tb /heg_tb/rst
add wave -noupdate -expand -group heg_tb -expand -group c&m /heg_tb/ctrl_r
add wave -noupdate -expand -group heg_tb -expand -group c&m /heg_tb/ctrl_v
add wave -noupdate -expand -group heg_tb -expand -group c&m /heg_tb/mon_r
add wave -noupdate -expand -group heg_tb -expand -group c&m /heg_tb/mon_v
add wave -noupdate -expand -group heg_tb /heg_tb/i_freeze
add wave -noupdate -expand -group heg_tb /heg_tb/i_mdt_full_data_av
add wave -noupdate -expand -group heg_tb /heg_tb/i_uCM_data_v
add wave -noupdate -expand -group heg_tb /heg_tb/o_sf_control_v
add wave -noupdate -expand -group heg_tb /heg_tb/o_sf_mdt_data_v
add wave -noupdate -expand -group heg_tb /heg_tb/o_sf_slc_data_v
add wave -noupdate -expand -group heg_tb /heg_tb/tar2hps_file_ok
add wave -noupdate -expand -group heg_tb /heg_tb/tar2hps_file_ts
add wave -noupdate -expand -group heg_tb /heg_tb/ucm2hps_file_ok
add wave -noupdate -expand -group heg_tb /heg_tb/ucm2hps_file_ts
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2018808777 fs} 0}
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
