onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tar_tb/clk
add wave -noupdate /top_tar_tb/rst
add wave -noupdate /top_tar_tb/glob_en
add wave -noupdate /top_tar_tb/ctrl_r
add wave -noupdate /top_tar_tb/mon_r
add wave -noupdate /top_tar_tb/ctrl_v
add wave -noupdate /top_tar_tb/mon_v
add wave -noupdate /top_tar_tb/i_tdc_hits_av
add wave -noupdate /top_tar_tb/o_tdc_hits_av
add wave -noupdate /top_tar_tb/o_tar_hits_av
add wave -noupdate -expand -group tar /top_tar_tb/TAR/c_HPS_MAX_HP
add wave -noupdate -expand -group tar /top_tar_tb/TAR/clk
add wave -noupdate -expand -group tar /top_tar_tb/TAR/ctrl_v
add wave -noupdate -expand -group tar /top_tar_tb/TAR/glob_en
add wave -noupdate -expand -group tar /top_tar_tb/TAR/i_tdc_hits_av
add wave -noupdate -expand -group tar /top_tar_tb/TAR/rst
add wave -noupdate -expand -group tar /top_tar_tb/TAR/mon_v
add wave -noupdate -expand -group tar /top_tar_tb/TAR/o_tar_hits_av
add wave -noupdate -expand -group tar /top_tar_tb/TAR/o_tdc_hits_av
add wave -noupdate -expand -group tar /top_tar_tb/TAR/ctrl_pl_v
add wave -noupdate -expand -group tar /top_tar_tb/TAR/ctrl_r
add wave -noupdate -expand -group tar /top_tar_tb/TAR/i_tdc_hits_ar
add wave -noupdate -expand -group tar /top_tar_tb/TAR/int_freeze
add wave -noupdate -expand -group tar /top_tar_tb/TAR/local_en
add wave -noupdate -expand -group tar /top_tar_tb/TAR/local_rst
add wave -noupdate -expand -group tar /top_tar_tb/TAR/mon_pl_v
add wave -noupdate -expand -group tar /top_tar_tb/TAR/mon_r
add wave -noupdate -expand -group tar /top_tar_tb/TAR/PL_ST_CTRL_LEN
add wave -noupdate -expand -group tar /top_tar_tb/TAR/PL_ST_MON_LEN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {149999999450 fs} 0}
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
WaveRestoreZoom {149999999050 fs} {149999999786 fs}
