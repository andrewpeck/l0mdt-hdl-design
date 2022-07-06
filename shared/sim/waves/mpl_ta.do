onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mpl_tb/DUMMY
add wave -noupdate /mpl_tb/IN_HIT_FILE
add wave -noupdate /mpl_tb/IN_SLC_FILE
add wave -noupdate /mpl_tb/PRJ_INFO
add wave -noupdate /mpl_tb/clk
add wave -noupdate /mpl_tb/clk_period
add wave -noupdate /mpl_tb/ctrl_r
add wave -noupdate /mpl_tb/ctrl_v
add wave -noupdate /mpl_tb/glob_en
add wave -noupdate /mpl_tb/i_uCM2pl_av
add wave -noupdate /mpl_tb/mon_r
add wave -noupdate /mpl_tb/mon_v
add wave -noupdate /mpl_tb/o_pl2mtc_av
add wave -noupdate /mpl_tb/o_pl2ptcalc_av
add wave -noupdate /mpl_tb/reset_init_cycles
add wave -noupdate /mpl_tb/rst
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
