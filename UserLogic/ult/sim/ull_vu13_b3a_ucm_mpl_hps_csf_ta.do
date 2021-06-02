onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group ULT /ult_tp/ULT/DUMMY
add wave -noupdate -expand -group ULT /ult_tp/ULT/clock_and_control
add wave -noupdate -expand -group ULT /ult_tp/ULT/ttc_commands
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/h2s_ctrl
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/h2s_mon
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/tar_ctrl
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/tar_mon
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/mtc_ctrl
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/mtc_mon
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/ucm_ctrl
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/ucm_mon
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/daq_ctrl
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/daq_mon
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/tf_ctrl
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/tf_mon
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/mpl_ctrl
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/mpl_mon
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/h2s_ctrl_v
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/h2s_mon_v
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/tar_ctrl_v
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/tar_mon_v
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/ucm_ctrl_v
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/ucm_mon_v
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/mpl_ctrl_v
add wave -noupdate -expand -group ULT -group ctrl/mon /ult_tp/ULT/mpl_mon_v
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_inn_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_mid_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_out_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_ext_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_plus_neighbor_segments
add wave -noupdate -expand -group ULT /ult_tp/ULT/i_minus_neighbor_segments
add wave -noupdate -expand -group ULT /ult_tp/ULT/inn_slc_to_h2s_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/mid_slc_to_h2s_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/out_slc_to_h2s_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ext_slc_to_h2s_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ucm2pl_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_inn_tar_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_mid_tar_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_out_tar_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_ext_tar_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_inn_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_mid_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_out_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ult_ext_tdc_hits_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/inn_segments_to_pt_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/mid_segments_to_pt_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/out_segments_to_pt_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/ext_segments_to_pt_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -expand -group ULT /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -expand -group ULT /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -expand -group ULT /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -expand -group ULT /ult_tp/ULT/pl2pt_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/pl2mtc_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/pt2mtc_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/o_daq_streams
add wave -noupdate -expand -group ULT /ult_tp/ULT/o_plus_neighbor_segments_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/o_minus_neighbor_segments_av
add wave -noupdate -expand -group ULT /ult_tp/ULT/o_MTC
add wave -noupdate -expand -group ULT /ult_tp/ULT/o_NSP
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/ucm_sump
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/pt_sump
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/h2s_sump
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/tar_sump
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/mtc_sump
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/daq_sump
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/mpl_sump
add wave -noupdate -expand -group ULT -group sump /ult_tp/ULT/sump
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Reset {3729687500 fs} 1 Red default} {{Cursor 2} {1901562500 fs} 1} {{Cursor 3} {4055602716 fs} 0}
quietly wave cursor active 3
configure wave -namecolwidth 181
configure wave -valuecolwidth 208
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
