onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ult_tb /ult_tb/PRJ_INFO
add wave -noupdate -group ult_tb /ult_tb/IN_SLC_FILE
add wave -noupdate -group ult_tb /ult_tb/IN_HIT_FILE
add wave -noupdate -group ult_tb /ult_tb/IN_CTRL_FILE
add wave -noupdate -group ult_tb /ult_tb/g_ST_ENABLE
add wave -noupdate -group ult_tb /ult_tb/DUMMY
add wave -noupdate -group ult_tb /ult_tb/axi_rst
add wave -noupdate -group ult_tb /ult_tb/clk_axi
add wave -noupdate -group ult_tb /ult_tb/clk_axi_cnt
add wave -noupdate -group ult_tb /ult_tb/clk_time
add wave -noupdate -group ult_tb /ult_tb/tb_curr_time
add wave -noupdate -group ult_tb /ult_tb/clk_tdc_time
add wave -noupdate -group ult_tb /ult_tb/tb_curr_tdc_time
add wave -noupdate -group ult_tb /ult_tb/clk_sim_time
add wave -noupdate -group ult_tb /ult_tb/tb_curr_sim_time
add wave -noupdate -group ult_tb /ult_tb/clk
add wave -noupdate -group ult_tb /ult_tb/rst
add wave -noupdate -group ult_tb /ult_tb/glob_en
add wave -noupdate -group ult_tb /ult_tb/bx
add wave -noupdate -group ult_tb /ult_tb/ttc_commands
add wave -noupdate -group ult_tb /ult_tb/clock_and_control
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_inn_av
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_mid_av
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_out_av
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_ext_av
add wave -noupdate -group ult_tb /ult_tb/i_main_primary_slc
add wave -noupdate -group ult_tb /ult_tb/i_main_secondary_slc
add wave -noupdate -group ult_tb /ult_tb/i_plus_neighbor_slc
add wave -noupdate -group ult_tb /ult_tb/i_minus_neighbor_slc
add wave -noupdate -group ult_tb /ult_tb/i_plus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/i_minus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/hps_inn_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_inn_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_mid_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_mid_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_out_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_out_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_ext_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_ext_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_inn_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_inn_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_mid_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_mid_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_out_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_out_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_ext_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_ext_mon_r
add wave -noupdate -group ult_tb /ult_tb/mtc_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/mtc_mon_r
add wave -noupdate -group ult_tb /ult_tb/ucm_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/ucm_mon_r
add wave -noupdate -group ult_tb /ult_tb/daq_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/daq_mon_r
add wave -noupdate -group ult_tb /ult_tb/tf_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tf_mon_r
add wave -noupdate -group ult_tb /ult_tb/mpl_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/mpl_mon_r
add wave -noupdate -group ult_tb /ult_tb/fm_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/fm_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_inn_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_inn_mon_v
add wave -noupdate -group ult_tb /ult_tb/hps_mid_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_mid_mon_v
add wave -noupdate -group ult_tb /ult_tb/hps_out_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_out_mon_v
add wave -noupdate -group ult_tb /ult_tb/hps_ext_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_ext_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_inn_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_inn_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_mid_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_mid_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_out_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_out_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_ext_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_ext_mon_v
add wave -noupdate -group ult_tb /ult_tb/mtc_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/mtc_mon_v
add wave -noupdate -group ult_tb /ult_tb/ucm_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/ucm_mon_v
add wave -noupdate -group ult_tb /ult_tb/daq_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/daq_mon_v
add wave -noupdate -group ult_tb /ult_tb/tf_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tf_mon_v
add wave -noupdate -group ult_tb /ult_tb/mpl_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/mpl_mon_v
add wave -noupdate -group ult_tb /ult_tb/fm_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/fm_mon_v
add wave -noupdate -group ult_tb /ult_tb/fm_csm_mon_r
add wave -noupdate -group ult_tb /ult_tb/csm_fm_mon_v
add wave -noupdate -group ult_tb /ult_tb/daq_stream_data_v
add wave -noupdate -group ult_tb /ult_tb/daq_stream_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/daq_stream_wren_v
add wave -noupdate -group ult_tb /ult_tb/o_plus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/o_minus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/o_MTC
add wave -noupdate -group ult_tb /ult_tb/o_NSP
add wave -noupdate -group ult_tb /ult_tb/slc_file_ok
add wave -noupdate -group ult_tb /ult_tb/slc_file_ts
add wave -noupdate -group ult_tb /ult_tb/mdt_file_ok
add wave -noupdate -group ult_tb /ult_tb/mdt_file_ts
add wave -noupdate -group ult_tb /ult_tb/slc_event_ai
add wave -noupdate -group ult_tb /ult_tb/hit_mdt_event_ai
add wave -noupdate -group ult_tb /ult_tb/hit_slc_event_ai
add wave -noupdate -group ult_tb /ult_tb/sump
add wave -noupdate -group ult_tb /ult_tb/axi_reset_n
add wave -noupdate -group ult_tb /ult_tb/c_CLK_AXI_MULT
add wave -noupdate -group ult_tb /ult_tb/clk_time_period
add wave -noupdate -group ult_tb /ult_tb/clk_tdc_time_period
add wave -noupdate -group ult_tb /ult_tb/clk_sim_time_period
add wave -noupdate -group ult_tb /ult_tb/clk_period
add wave -noupdate -group ult_tb /ult_tb/reset_init_cycles
add wave -noupdate -group ult_tb /ult_tb/PRJ_INFO
add wave -noupdate -group ult_tb /ult_tb/IN_SLC_FILE
add wave -noupdate -group ult_tb /ult_tb/IN_HIT_FILE
add wave -noupdate -group ult_tb /ult_tb/IN_CTRL_FILE
add wave -noupdate -group ult_tb /ult_tb/g_ST_ENABLE
add wave -noupdate -group ult_tb /ult_tb/DUMMY
add wave -noupdate -group ult_tb /ult_tb/axi_rst
add wave -noupdate -group ult_tb /ult_tb/clk_axi
add wave -noupdate -group ult_tb /ult_tb/clk_axi_cnt
add wave -noupdate -group ult_tb /ult_tb/clk_time
add wave -noupdate -group ult_tb /ult_tb/tb_curr_time
add wave -noupdate -group ult_tb /ult_tb/clk_tdc_time
add wave -noupdate -group ult_tb /ult_tb/tb_curr_tdc_time
add wave -noupdate -group ult_tb /ult_tb/clk_sim_time
add wave -noupdate -group ult_tb /ult_tb/tb_curr_sim_time
add wave -noupdate -group ult_tb /ult_tb/clk
add wave -noupdate -group ult_tb /ult_tb/rst
add wave -noupdate -group ult_tb /ult_tb/glob_en
add wave -noupdate -group ult_tb /ult_tb/bx
add wave -noupdate -group ult_tb /ult_tb/ttc_commands
add wave -noupdate -group ult_tb /ult_tb/clock_and_control
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_inn_av
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_mid_av
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_out_av
add wave -noupdate -group ult_tb /ult_tb/i_mdt_tdc_ext_av
add wave -noupdate -group ult_tb /ult_tb/i_main_primary_slc
add wave -noupdate -group ult_tb /ult_tb/i_main_secondary_slc
add wave -noupdate -group ult_tb /ult_tb/i_plus_neighbor_slc
add wave -noupdate -group ult_tb /ult_tb/i_minus_neighbor_slc
add wave -noupdate -group ult_tb /ult_tb/i_plus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/i_minus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/hps_inn_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_inn_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_mid_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_mid_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_out_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_out_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_ext_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/hps_ext_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_inn_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_inn_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_mid_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_mid_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_out_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_out_mon_r
add wave -noupdate -group ult_tb /ult_tb/tar_ext_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tar_ext_mon_r
add wave -noupdate -group ult_tb /ult_tb/mtc_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/mtc_mon_r
add wave -noupdate -group ult_tb /ult_tb/ucm_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/ucm_mon_r
add wave -noupdate -group ult_tb /ult_tb/daq_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/daq_mon_r
add wave -noupdate -group ult_tb /ult_tb/tf_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/tf_mon_r
add wave -noupdate -group ult_tb /ult_tb/mpl_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/mpl_mon_r
add wave -noupdate -group ult_tb /ult_tb/fm_ctrl_r
add wave -noupdate -group ult_tb /ult_tb/fm_mon_r
add wave -noupdate -group ult_tb /ult_tb/hps_inn_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_inn_mon_v
add wave -noupdate -group ult_tb /ult_tb/hps_mid_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_mid_mon_v
add wave -noupdate -group ult_tb /ult_tb/hps_out_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_out_mon_v
add wave -noupdate -group ult_tb /ult_tb/hps_ext_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/hps_ext_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_inn_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_inn_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_mid_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_mid_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_out_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_out_mon_v
add wave -noupdate -group ult_tb /ult_tb/tar_ext_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tar_ext_mon_v
add wave -noupdate -group ult_tb /ult_tb/mtc_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/mtc_mon_v
add wave -noupdate -group ult_tb /ult_tb/ucm_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/ucm_mon_v
add wave -noupdate -group ult_tb /ult_tb/daq_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/daq_mon_v
add wave -noupdate -group ult_tb /ult_tb/tf_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/tf_mon_v
add wave -noupdate -group ult_tb /ult_tb/mpl_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/mpl_mon_v
add wave -noupdate -group ult_tb /ult_tb/fm_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/fm_mon_v
add wave -noupdate -group ult_tb /ult_tb/fm_csm_mon_r
add wave -noupdate -group ult_tb /ult_tb/csm_fm_mon_v
add wave -noupdate -group ult_tb /ult_tb/daq_stream_data_v
add wave -noupdate -group ult_tb /ult_tb/daq_stream_ctrl_v
add wave -noupdate -group ult_tb /ult_tb/daq_stream_wren_v
add wave -noupdate -group ult_tb /ult_tb/o_plus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/o_minus_neighbor_segments
add wave -noupdate -group ult_tb /ult_tb/o_MTC
add wave -noupdate -group ult_tb /ult_tb/o_NSP
add wave -noupdate -group ult_tb /ult_tb/slc_file_ok
add wave -noupdate -group ult_tb /ult_tb/slc_file_ts
add wave -noupdate -group ult_tb /ult_tb/mdt_file_ok
add wave -noupdate -group ult_tb /ult_tb/mdt_file_ts
add wave -noupdate -group ult_tb /ult_tb/slc_event_ai
add wave -noupdate -group ult_tb /ult_tb/hit_mdt_event_ai
add wave -noupdate -group ult_tb /ult_tb/hit_slc_event_ai
add wave -noupdate -group ult_tb /ult_tb/sump
add wave -noupdate -group ult_tb /ult_tb/axi_reset_n
add wave -noupdate -group ult_tb /ult_tb/c_CLK_AXI_MULT
add wave -noupdate -group ult_tb /ult_tb/clk_time_period
add wave -noupdate -group ult_tb /ult_tb/clk_tdc_time_period
add wave -noupdate -group ult_tb /ult_tb/clk_sim_time_period
add wave -noupdate -group ult_tb /ult_tb/clk_period
add wave -noupdate -group ult_tb /ult_tb/reset_init_cycles
add wave -noupdate -expand -group ult_mpl /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/clock_and_control
add wave -noupdate -expand -group ult_mpl /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/ctrl_v
add wave -noupdate -expand -group ult_mpl /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/mon_v
add wave -noupdate -expand -group ult_mpl /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/i_ucm2pl_av
add wave -noupdate -expand -group ult_mpl /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/o_pl2pt_av
add wave -noupdate -expand -group ult_mpl /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/o_pl2mtc_av
add wave -noupdate -expand -group ult_mpl /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/glob_en
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/clk
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/rst
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/enable
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/ctrl_v
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/mon_v
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/i_freeze
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/i_uCM2pl_v
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/o_pl2ptcalc_v
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/o_pl2mtc_v
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/i_uCM2pl_r
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/pl2pl_v
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/pl2pl_dv
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/pl2pl_r
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/pl2mtc_r
add wave -noupdate -expand -group mpl_pl0 /ult_tb/ULT/logic_gen/mpl_gen/ult_mpl/MPL_EN/MPL/MPL_PL(0)/PL/pl2mtc_v
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {186 fs} 0}
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
WaveRestoreZoom {0 fs} {693 fs}
