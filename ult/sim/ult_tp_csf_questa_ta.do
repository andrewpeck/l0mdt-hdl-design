onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/clock_and_control
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/ttc_commands
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/h2s_ctrl
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/h2s_mon
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/tar_ctrl
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/tar_mon
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/mtc_ctrl
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/mtc_mon
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/ucm_ctrl
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/ucm_mon
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/daq_ctrl
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/daq_mon
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/tf_ctrl
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/tf_mon
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/mpl_ctrl
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/mpl_mon
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_inner_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_middle_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_outer_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_extra_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_inner_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_middle_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_outer_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_extra_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/plus_neighbor_segments_i
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/minus_neighbor_segments_i
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/daq_streams_o
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/plus_neighbor_segments_o
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/minus_neighbor_segments_o
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/MTC_o
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/NSP_o
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/sump
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/inner_slc_to_hts
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/middle_slc_to_hts
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/outer_slc_to_hts
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/extra_slc_to_hts
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/ucm2pl_av
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/inner_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/middle_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/outer_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/extra_tar_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/inner_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/middle_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/outer_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/extra_tdc_hits
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/inn_segments_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/mid_segments_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/out_segments_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/ext_segments_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/pl2pt_av
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/pl2mtc_av
add wave -noupdate -expand -group ult_DUT_TB /ult_tp/ULT/pt2mtc_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4999999253 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 255
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
WaveRestoreZoom {4999999050 fs} {4999999987 fs}
