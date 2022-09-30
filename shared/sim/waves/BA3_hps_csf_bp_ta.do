onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group hps_tb -group generics /hps_tb/g_HPS_MAX_HP
add wave -noupdate -group hps_tb -group generics /hps_tb/g_ST_ENABLE
add wave -noupdate -group hps_tb -group generics /hps_tb/IN_CTRL_FILE
add wave -noupdate -group hps_tb -group generics /hps_tb/IN_TAR_FILE
add wave -noupdate -group hps_tb -group generics /hps_tb/IN_UCM_FILE
add wave -noupdate -group hps_tb -group generics /hps_tb/PRJ_INFO
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/rst
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk_axi
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/axi_rst
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/glob_en
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/reset_init_cycles
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk_axi_cnt
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk_period
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk_tdc_time
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk_tdc_time_period
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk_time
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/clk_time_period
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/tb_curr_tdc_time
add wave -noupdate -group hps_tb -group clks_gen /hps_tb/tb_curr_time
add wave -noupdate -group hps_tb /hps_tb/bx
add wave -noupdate -group hps_tb /hps_tb/ctrl_v
add wave -noupdate -group hps_tb /hps_tb/mon_v
add wave -noupdate -group hps_tb -expand -group ids -radix unsigned /hps_tb/tar2hps_mdt_event_au
add wave -noupdate -group hps_tb -expand -group ids -radix unsigned /hps_tb/tar2hps_slc_event_au
add wave -noupdate -group hps_tb -expand -group ids -radix unsigned /hps_tb/ucm2hps_slc_event_au
add wave -noupdate -group hps_tb -expand -group ids -radix unsigned /hps_tb/pl_ucm2hps_slc_event_a
add wave -noupdate -group hps_tb -expand -group ids -radix unsigned /hps_tb/pl_ucm2hps_slc_event_au
add wave -noupdate -group hps_tb /hps_tb/tar2hps_aav
add wave -noupdate -group hps_tb /hps_tb/tar2hps_file_ok
add wave -noupdate -group hps_tb /hps_tb/tar2hps_file_ts
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_aav
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_file_ok
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_file_ts
add wave -noupdate -group hps_tb /hps_tb/hps2pt_aav
add wave -noupdate -group hps_inn_pc /hps_tb/STATION_GEN(0)/HPS/HPS/PC/clk
add wave -noupdate -group hps_inn_pc /hps_tb/STATION_GEN(0)/HPS/HPS/PC/ena
add wave -noupdate -group hps_inn_pc /hps_tb/STATION_GEN(0)/HPS/HPS/PC/rst
add wave -noupdate -group hps_inn_pc /hps_tb/STATION_GEN(0)/HPS/HPS/PC/g_HPS_NUM_MDT_CH
add wave -noupdate -group hps_inn_pc /hps_tb/STATION_GEN(0)/HPS/HPS/PC/g_SIM_nBUILD
add wave -noupdate -group hps_inn_pc /hps_tb/STATION_GEN(0)/HPS/HPS/PC/g_STATION_RADIUS
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/i_ctrl_t0_v
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/i_ctrl_tc_v
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/ctrl_t0_av
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/ctrl_tc_av
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/i_ctrl_t0_r
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/i_ctrl_tc_r
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/mon_t0_av
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/mon_tc_av
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/o_mon_t0_r
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/o_mon_tc_r
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/o_mon_t0_v
add wave -noupdate -group hps_inn_pc -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/PC/o_mon_tc_v
add wave -noupdate -group hps_inn_pc /hps_tb/STATION_GEN(0)/HPS/HPS/PC/i_mdt_tar_v
add wave -noupdate -group hps_inn_pc -expand /hps_tb/STATION_GEN(0)/HPS/HPS/PC/o_mdt_full_data_v
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/g_STATION_RADIUS
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/g_HPS_NUM_MDT_CH
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/SUPER_CTRL_LEN
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/SUPER_MON_LEN
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/CSF_CTRL_LEN
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/CSF_MON_LEN
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/LSF_CTRL_LEN
add wave -noupdate -group hps_inn -group generics /hps_tb/STATION_GEN(0)/HPS/HPS/LSF_MON_LEN
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/clk
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/rst
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/glob_en
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/i_uCM2hps_av
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/i_mdt_tar_av
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/ctrl_v
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/ctrl_r
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/mon_r
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/heg_ctrl_av
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/heg_mon_av
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/ctrl_super_v
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/mon_super_v
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/csf_ctrl_av
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/csf_mon_av
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/lsf_ctrl_av
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/lsf_mon_av
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/pc_t0_ctrl_v
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/pc_tc_ctrl_v
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/pc_t0_mon_v
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/pc_tc_mon_v
add wave -noupdate -group hps_inn -group c&m /hps_tb/STATION_GEN(0)/HPS/HPS/mon_v
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/int_rst
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/int_ena
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/local_freeze
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/mdt_full_data_av
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/heg2sf_ctrl_av
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/heg2sfslc_av
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/heg2sfhit_av
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/sf_fm_data_th
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/h2s_fm_data
add wave -noupdate -group hps_inn /hps_tb/STATION_GEN(0)/HPS/HPS/o_sf2pt_av
add wave -noupdate -group ucm2hps -expand -group gen /hps_tb/UCM2HPS/g_PRJ_INFO
add wave -noupdate -group ucm2hps -expand -group gen /hps_tb/UCM2HPS/g_ST_ENABLE
add wave -noupdate -group ucm2hps -expand -group gen /hps_tb/UCM2HPS/g_IN_UCM2HPS_FILE
add wave -noupdate -group ucm2hps -expand -group gen /hps_tb/UCM2HPS/g_verbose
add wave -noupdate -group ucm2hps -expand -group gen /hps_tb/UCM2HPS/csv_file
add wave -noupdate -group ucm2hps -expand -group gen /hps_tb/UCM2HPS/file_open
add wave -noupdate -group ucm2hps -expand -group gen /hps_tb/UCM2HPS/file_ts
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/clk
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/rst
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/ena
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/tb_curr_tdc_time
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/ucm_event_r
add wave -noupdate -group ucm2hps -radix unsigned /hps_tb/UCM2HPS/ucm2hps_fifo
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/ucm2hps_fifo_counters
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/ucm_event_r0
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/o_file_ok
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/o_file_ts
add wave -noupdate -group ucm2hps -radix unsigned /hps_tb/UCM2HPS/slc_event_ai
add wave -noupdate -group ucm2hps -radix unsigned -childformat {{/hps_tb/UCM2HPS/o_slc_event_ai(2) -radix unsigned} {/hps_tb/UCM2HPS/o_slc_event_ai(1) -radix unsigned} {/hps_tb/UCM2HPS/o_slc_event_ai(0) -radix unsigned}} -subitemconfig {/hps_tb/UCM2HPS/o_slc_event_ai(2) {-height 17 -radix unsigned} /hps_tb/UCM2HPS/o_slc_event_ai(1) {-height 17 -radix unsigned} /hps_tb/UCM2HPS/o_slc_event_ai(0) {-height 17 -radix unsigned}} /hps_tb/UCM2HPS/o_slc_event_ai
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/o_ucm2hps_inn_av
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/o_ucm2hps_mid_av
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/o_ucm2hps_out_av
add wave -noupdate -group ucm2hps /hps_tb/UCM2HPS/o_ucm2hps_ext_av
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/g_PRJ_INFO
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/g_ST_ENABLE
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/csv_file_1
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/i_tar2hps_file_ok
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/i_tar2hps_file_ts
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/i_ucm2hps_file_ok
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/i_ucm2hps_file_ts
add wave -noupdate -expand -group hps_int_out -expand -group cnst /hps_tb/HPSOUT/OUT_FILE_1
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/clk
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/enable
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/rst
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/tb_curr_sim_time
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/tb_curr_tdc_time
add wave -noupdate -expand -group hps_int_out -radix unsigned -childformat {{/hps_tb/HPSOUT/i_tar2hps_mdt_event_au(0) -radix unsigned} {/hps_tb/HPSOUT/i_tar2hps_mdt_event_au(1) -radix unsigned} {/hps_tb/HPSOUT/i_tar2hps_mdt_event_au(2) -radix unsigned} {/hps_tb/HPSOUT/i_tar2hps_mdt_event_au(3) -radix unsigned}} -expand -subitemconfig {/hps_tb/HPSOUT/i_tar2hps_mdt_event_au(0) {-radix unsigned} /hps_tb/HPSOUT/i_tar2hps_mdt_event_au(1) {-radix unsigned} /hps_tb/HPSOUT/i_tar2hps_mdt_event_au(2) {-radix unsigned} /hps_tb/HPSOUT/i_tar2hps_mdt_event_au(3) {-radix unsigned}} /hps_tb/HPSOUT/i_tar2hps_mdt_event_au
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/i_tar2hps_slc_event_au
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/i_ucm2hps_slc_event_au
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/tar2hps_mdt_event_a
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/tar2hps_mdt_event_au
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/tar2hps_slc_event_a
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/tar2hps_slc_event_au
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/hps_heg_hp2bm_aaar
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/hps_heg_hp2bm_aaav
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/hps_pc_mdt_full_data_aar
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/in_files_ok
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/in_files_ts
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/OUT_FILE_1
add wave -noupdate -expand -group hps_int_out -group inn /hps_tb/HPSOUT/SNIFFER_ST_GEN(0)/ST_EN/temp_mdt_full_data_av
add wave -noupdate -expand -group hps_int_out -group inn -group th2 -expand /hps_tb/HPSOUT/SNIFFER_ST_GEN(0)/ST_EN/TH_GEN(2)/temp_hp2bm_av
add wave -noupdate -expand -group hps_int_out -radix unsigned /hps_tb/HPSOUT/hps_pc_mdt_full_data_aav
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2505867585 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
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
WaveRestoreZoom {2494790930 fs} {2540612754 fs}
