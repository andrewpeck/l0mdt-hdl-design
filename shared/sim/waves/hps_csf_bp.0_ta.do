onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hps_tb/HPS/g_HPS_NUM_MDT_CH
add wave -noupdate /hps_tb/HPS/g_STATION_RADIUS
add wave -noupdate /hps_tb/HPS/clk
add wave -noupdate /hps_tb/HPS/glob_en
add wave -noupdate /hps_tb/HPS/ctrl_v
add wave -noupdate /hps_tb/HPS/mon_v
add wave -noupdate /hps_tb/HPS/i_mdt_tar_av
add wave -noupdate /hps_tb/HPS/i_uCM2hps_av
add wave -noupdate /hps_tb/HPS/rst
add wave -noupdate /hps_tb/HPS/h2s_fm_data
add wave -noupdate /hps_tb/HPS/o_sf2pt_av
add wave -noupdate /hps_tb/HPS/SUPER_CTRL_LEN
add wave -noupdate /hps_tb/HPS/SUPER_MON_LEN
add wave -noupdate /hps_tb/HPS/CSF_CTRL_LEN
add wave -noupdate /hps_tb/HPS/CSF_MON_LEN
add wave -noupdate /hps_tb/HPS/LSF_CTRL_LEN
add wave -noupdate /hps_tb/HPS/LSF_MON_LEN
add wave -noupdate /hps_tb/HPS/int_ena
add wave -noupdate /hps_tb/HPS/int_rst
add wave -noupdate /hps_tb/HPS/ctrl_r
add wave -noupdate /hps_tb/HPS/csf_ctrl_av
add wave -noupdate /hps_tb/HPS/csf_mon_av
add wave -noupdate /hps_tb/HPS/ctrl_super_v
add wave -noupdate /hps_tb/HPS/heg2sf_ctrl_av
add wave -noupdate /hps_tb/HPS/heg2sfhit_av
add wave -noupdate /hps_tb/HPS/heg2sfslc_av
add wave -noupdate /hps_tb/HPS/heg_ctrl_av
add wave -noupdate /hps_tb/HPS/heg_mon_av
add wave -noupdate /hps_tb/HPS/local_freeze
add wave -noupdate /hps_tb/HPS/lsf_ctrl_av
add wave -noupdate /hps_tb/HPS/lsf_mon_av
add wave -noupdate /hps_tb/HPS/mdt_full_data_av
add wave -noupdate /hps_tb/HPS/mon_r
add wave -noupdate /hps_tb/HPS/mon_super_v
add wave -noupdate /hps_tb/HPS/pc_t0_ctrl_v
add wave -noupdate /hps_tb/HPS/pc_t0_mon_v
add wave -noupdate /hps_tb/HPS/pc_tc_ctrl_v
add wave -noupdate /hps_tb/HPS/pc_tc_mon_v
add wave -noupdate /hps_tb/HPS/sf_fm_data_th
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1675571178 fs} 0}
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
