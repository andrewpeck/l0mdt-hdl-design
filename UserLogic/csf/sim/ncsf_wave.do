onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /csf_tb/CSF/clk
add wave -noupdate /csf_tb/CSF/i_eof
add wave -noupdate /csf_tb/CSF/i_seed
add wave -noupdate /csf_tb/CSF/i_mdt_hit
add wave -noupdate -divider Cluster0
add wave -noupdate /csf_tb/CSF/CLUSTERING_GEN(0)/Cluster/mdt_hit
add wave -noupdate -divider Cluster1
add wave -noupdate /csf_tb/CSF/CLUSTERING_GEN(1)/Cluster/mdt_hit
add wave -noupdate -divider Fitter
add wave -noupdate /csf_tb/CSF/Fitter/dsp_start
add wave -noupdate /csf_tb/CSF/Fitter/sums
add wave -noupdate -childformat {{/csf_tb/CSF/Fitter/output_seg.b -radix unsigned} {/csf_tb/CSF/Fitter/output_seg.m -radix unsigned}} -expand -subitemconfig {/csf_tb/CSF/Fitter/output_seg.b {-radix unsigned} /csf_tb/CSF/Fitter/output_seg.m {-radix unsigned}} /csf_tb/CSF/Fitter/output_seg
add wave -noupdate -divider CoordTransf
add wave -noupdate -childformat {{/csf_tb/CSF/coordtransform/seed_i.vec_pos -radix unsigned} {/csf_tb/CSF/coordtransform/seed_i.hewindow_pos -radix unsigned}} -expand -subitemconfig {/csf_tb/CSF/coordtransform/seed_i.vec_pos {-radix unsigned} /csf_tb/CSF/coordtransform/seed_i.hewindow_pos {-radix unsigned}} /csf_tb/CSF/coordtransform/seed_i
add wave -noupdate /csf_tb/CSF/coordtransform/locseg_i
add wave -noupdate /csf_tb/CSF/coordtransform/dv0
add wave -noupdate /csf_tb/CSF/coordtransform/seed
add wave -noupdate -childformat {{/csf_tb/CSF/coordtransform/locseg.b -radix decimal} {/csf_tb/CSF/coordtransform/locseg.m -radix decimal}} -subitemconfig {/csf_tb/CSF/coordtransform/locseg.b {-height 16 -radix decimal} /csf_tb/CSF/coordtransform/locseg.m {-height 16 -radix decimal}} /csf_tb/CSF/coordtransform/locseg
add wave -noupdate /csf_tb/CSF/coordtransform/dv1
add wave -noupdate /csf_tb/CSF/coordtransform/delta_r_mbar
add wave -noupdate /csf_tb/CSF/coordtransform/dv2
add wave -noupdate -radix unsigned /csf_tb/CSF/coordtransform/abs_loc_pos
add wave -noupdate /csf_tb/CSF/coordtransform/loc_pos_sign
add wave -noupdate -childformat {{/csf_tb/CSF/coordtransform/globseg.segpos -radix unsigned} {/csf_tb/CSF/coordtransform/globseg.segangle -radix unsigned}} -subitemconfig {/csf_tb/CSF/coordtransform/globseg.segpos {-height 16 -radix unsigned} /csf_tb/CSF/coordtransform/globseg.segangle {-height 16 -radix unsigned}} /csf_tb/CSF/coordtransform/globseg
add wave -noupdate /csf_tb/CSF/coordtransform/vec_pos
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1555930570 fs} 0} {{Cursor 2} {49970412500 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 154
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
WaveRestoreZoom {1528121677 fs} {1569137303 fs}
