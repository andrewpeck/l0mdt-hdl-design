onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pt_tb/clk
add wave -noupdate -childformat {{/pt_tb/seg_I.segpos -radix unsigned} {/pt_tb/seg_I.segangle -radix unsigned}} -expand -subitemconfig {/pt_tb/seg_I.segpos {-radix unsigned} /pt_tb/seg_I.segangle {-radix unsigned}} /pt_tb/seg_I
add wave -noupdate /pt_tb/seg_M
add wave -noupdate /pt_tb/seg_O
add wave -noupdate /pt_tb/i_segment_I
add wave -noupdate /pt_tb/i_segment_M
add wave -noupdate /pt_tb/i_segment_O
add wave -noupdate /pt_tb/i_SLC
add wave -noupdate /pt_tb/slc
add wave -noupdate /pt_tb/o_mtc
add wave -noupdate /pt_tb/rst
add wave -noupdate /pt_tb/enable
add wave -noupdate /pt_tb/done
add wave -noupdate /glbl/GSR
add wave -noupdate -divider PT
add wave -noupdate /pt_tb/pt/i_segment_I
add wave -noupdate /pt_tb/pt/i_segment_M
add wave -noupdate /pt_tb/pt/i_segment_O
add wave -noupdate /pt_tb/pt/segment_I
add wave -noupdate /pt_tb/pt/segment_M
add wave -noupdate /pt_tb/pt/segment_O
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11071558 fs} 0}
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
WaveRestoreZoom {0 fs} {93777040 fs}
