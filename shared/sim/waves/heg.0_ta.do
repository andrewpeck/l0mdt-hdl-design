onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /heg_tb/DUMMY
add wave -noupdate /heg_tb/FLAVOUR
add wave -noupdate /heg_tb/g_STATION_RADIUS
add wave -noupdate /heg_tb/PRJ_INFO
add wave -noupdate /heg_tb/c_CTRL_LEN
add wave -noupdate /heg_tb/c_MON_LEN
add wave -noupdate /heg_tb/clk
add wave -noupdate /heg_tb/clk_period
add wave -noupdate /heg_tb/ctrl_r
add wave -noupdate /heg_tb/ctrl_v
add wave -noupdate /heg_tb/ena
add wave -noupdate /heg_tb/i_freeze
add wave -noupdate /heg_tb/i_mdt_full_data_av
add wave -noupdate /heg_tb/i_uCM_data_v
add wave -noupdate /heg_tb/mon_r
add wave -noupdate /heg_tb/mon_v
add wave -noupdate /heg_tb/o_sf_control_v
add wave -noupdate /heg_tb/o_sf_mdt_data_v
add wave -noupdate /heg_tb/o_sf_slc_data_v
add wave -noupdate /heg_tb/reset_init_cycles
add wave -noupdate /heg_tb/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1561732 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {4999999342 fs} {5000000035 fs}
