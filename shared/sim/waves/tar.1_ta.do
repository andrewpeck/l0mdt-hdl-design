onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group tar_tb /tar_tb/g_HPS_MAX_HP
add wave -noupdate -expand -group tar_tb /tar_tb/g_STATION
add wave -noupdate -expand -group tar_tb /tar_tb/g_ST_ENABLE
add wave -noupdate -expand -group tar_tb /tar_tb/PRJ_INFO
add wave -noupdate -expand -group tar_tb /tar_tb/IN_SLC_FILE
add wave -noupdate -expand -group tar_tb /tar_tb/IN_HIT_FILE
add wave -noupdate -expand -group tar_tb /tar_tb/IN_CTRL_FILE
add wave -noupdate -expand -group tar_tb /tar_tb/DUMMY
add wave -noupdate -expand -group tar_tb /tar_tb/enable_mdt
add wave -noupdate -expand -group tar_tb /tar_tb/axi_rst
add wave -noupdate -expand -group tar_tb /tar_tb/clk_axi
add wave -noupdate -expand -group tar_tb /tar_tb/clk_axi_cnt
add wave -noupdate -expand -group tar_tb /tar_tb/clk_time
add wave -noupdate -expand -group tar_tb /tar_tb/tb_curr_time
add wave -noupdate -expand -group tar_tb /tar_tb/clk_tdc_time
add wave -noupdate -expand -group tar_tb /tar_tb/tb_curr_tdc_time
add wave -noupdate -expand -group tar_tb /tar_tb/clk
add wave -noupdate -expand -group tar_tb /tar_tb/rst
add wave -noupdate -expand -group tar_tb /tar_tb/glob_en
add wave -noupdate -expand -group tar_tb /tar_tb/bx
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_inn_ctrl_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_mid_ctrl_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_out_ctrl_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_ext_ctrl_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_inn_mon_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_mid_mon_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_out_mon_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_ext_mon_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_inn_ctrl_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_mid_ctrl_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_out_ctrl_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_ext_ctrl_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_inn_mon_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_mid_mon_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_out_mon_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/tar_ext_mon_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/ctrl_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/mon_r
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/ctrl_v
add wave -noupdate -expand -group tar_tb -expand -group c&m /tar_tb/mon_v
add wave -noupdate -expand -group tar_tb /tar_tb/i_mdt_tdc_inn_av
add wave -noupdate -expand -group tar_tb /tar_tb/i_mdt_tdc_mid_av
add wave -noupdate -expand -group tar_tb /tar_tb/i_mdt_tdc_out_av
add wave -noupdate -expand -group tar_tb /tar_tb/i_mdt_tdc_ext_av
add wave -noupdate -expand -group tar_tb /tar_tb/i_mdt_tdc_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tdc_hits_inn_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tdc_hits_mid_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tdc_hits_out_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tdc_hits_ext_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tar_hits_inn_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tar_hits_mid_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tar_hits_out_av
add wave -noupdate -expand -group tar_tb /tar_tb/o_tar_hits_ext_av
add wave -noupdate -expand -group tar_tb /tar_tb/mdt_file_ok
add wave -noupdate -expand -group tar_tb /tar_tb/mdt_file_ts
add wave -noupdate -expand -group tar_tb /tar_tb/mdt_event_ai
add wave -noupdate -expand -group tar_tb /tar_tb/clk_time_period
add wave -noupdate -expand -group tar_tb /tar_tb/clk_tdc_time_period
add wave -noupdate -expand -group tar_tb /tar_tb/clk_period
add wave -noupdate -expand -group tar_tb /tar_tb/reset_init_cycles
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1410326087 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
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
WaveRestoreZoom {0 fs} {5107336957 fs}
