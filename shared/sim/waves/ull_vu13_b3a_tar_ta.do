onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT /ult_tp/ULT/DUMMY
add wave -noupdate -group ULT /ult_tp/ULT/clock_and_control
add wave -noupdate -group ULT /ult_tp/ULT/ttc_commands
add wave -noupdate -group ULT /ult_tp/ULT/h2s_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/h2s_mon
add wave -noupdate -group ULT /ult_tp/ULT/tar_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/tar_mon
add wave -noupdate -group ULT /ult_tp/ULT/mtc_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/mtc_mon
add wave -noupdate -group ULT /ult_tp/ULT/ucm_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/ucm_mon
add wave -noupdate -group ULT /ult_tp/ULT/daq_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/daq_mon
add wave -noupdate -group ULT /ult_tp/ULT/tf_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/tf_mon
add wave -noupdate -group ULT /ult_tp/ULT/mpl_ctrl
add wave -noupdate -group ULT /ult_tp/ULT/mpl_mon
add wave -noupdate -group ULT /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -group ULT /ult_tp/ULT/i_plus_neighbor_segments
add wave -noupdate -group ULT /ult_tp/ULT/i_minus_neighbor_segments
add wave -noupdate -group ULT /ult_tp/ULT/o_daq_streams
add wave -noupdate -group ULT /ult_tp/ULT/o_MTC
add wave -noupdate -group ULT /ult_tp/ULT/o_NSP
add wave -noupdate -group ULT /ult_tp/ULT/sump
add wave -noupdate -group ULT /ult_tp/ULT/ucm2pl_av
add wave -noupdate -group ULT /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -group ULT /ult_tp/ULT/pl2pt_av
add wave -noupdate -group ULT /ult_tp/ULT/pl2mtc_av
add wave -noupdate -group ULT /ult_tp/ULT/pt2mtc_av
add wave -noupdate -group ULT /ult_tp/ULT/pt_sump
add wave -noupdate -group ULT /ult_tp/ULT/h2s_sump
add wave -noupdate -group ULT /ult_tp/ULT/tar_sump
add wave -noupdate -group ULT /ult_tp/ULT/mtc_sump
add wave -noupdate -group ULT /ult_tp/ULT/daq_sump
add wave -noupdate -divider TAR
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/clock_and_control
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/ctrl
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/mon
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/ttc_commands
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_inn_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_mid_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_out_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_ext_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_inn_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_mid_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_out_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_ext_tdc_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_inn_tar_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_mid_tar_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_out_tar_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_ext_tar_hits_av
add wave -noupdate -expand -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/glob_en
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/clk
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/rst
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/ctrl
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/mon
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/glob_en
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/local_en
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/local_rst
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/int_freeze
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_inn_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_mid_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_out_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_ext_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_inn_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_mid_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_out_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_ext_tdc_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_inn_tar_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_mid_tar_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_out_tar_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_ext_tar_hits_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_inn_tdc_hits_ar
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_mid_tdc_hits_ar
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_out_tdc_hits_ar
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_ext_tdc_hits_ar
add wave -noupdate -divider {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {515625000 fs} 0}
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
