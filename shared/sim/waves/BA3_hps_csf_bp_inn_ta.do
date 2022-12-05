onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group hps_tb /hps_tb/g_HPS_MAX_HP
add wave -noupdate -group hps_tb /hps_tb/g_ST_ACT
add wave -noupdate -group hps_tb /hps_tb/g_ST_ENABLE
add wave -noupdate -group hps_tb /hps_tb/IN_CTRL_FILE
add wave -noupdate -group hps_tb /hps_tb/IN_TAR_FILE
add wave -noupdate -group hps_tb /hps_tb/IN_UCM_FILE
add wave -noupdate -group hps_tb /hps_tb/PRJ_INFO
add wave -noupdate -group hps_tb /hps_tb/axi_rst
add wave -noupdate -group hps_tb /hps_tb/bx
add wave -noupdate -group hps_tb /hps_tb/clk
add wave -noupdate -group hps_tb /hps_tb/clk_axi
add wave -noupdate -group hps_tb /hps_tb/clk_axi_cnt
add wave -noupdate -group hps_tb /hps_tb/clk_period
add wave -noupdate -group hps_tb /hps_tb/clk_tdc_time
add wave -noupdate -group hps_tb /hps_tb/clk_tdc_time_period
add wave -noupdate -group hps_tb /hps_tb/clk_time
add wave -noupdate -group hps_tb /hps_tb/clk_time_period
add wave -noupdate -group hps_tb /hps_tb/ctrl_inn_r
add wave -noupdate -group hps_tb /hps_tb/ctrl_inn_v
add wave -noupdate -group hps_tb /hps_tb/glob_en
add wave -noupdate -group hps_tb /hps_tb/hps2pt_inn_av
add wave -noupdate -group hps_tb /hps_tb/mon_inn_r
add wave -noupdate -group hps_tb /hps_tb/mon_inn_v
add wave -noupdate -group hps_tb /hps_tb/reset_init_cycles
add wave -noupdate -group hps_tb /hps_tb/rst
add wave -noupdate -group hps_tb /hps_tb/tar2hps_ext_av
add wave -noupdate -group hps_tb /hps_tb/tar2hps_file_ok
add wave -noupdate -group hps_tb /hps_tb/tar2hps_file_ts
add wave -noupdate -group hps_tb /hps_tb/tar2hps_inn_av
add wave -noupdate -group hps_tb /hps_tb/tar2hps_mdt_event_ai
add wave -noupdate -group hps_tb /hps_tb/tar2hps_mid_av
add wave -noupdate -group hps_tb /hps_tb/tar2hps_out_av
add wave -noupdate -group hps_tb -radix unsigned /hps_tb/tb_curr_tdc_time
add wave -noupdate -group hps_tb -radix unsigned /hps_tb/tb_curr_time
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_ext_av
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_file_ok
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_file_ts
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_inn_av
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_mid_av
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_out_av
add wave -noupdate -group hps_tb /hps_tb/ucm2hps_slc_event_ai
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/g_PRJ_INFO
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/g_ST_ENABLE
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/g_HPS_MAX_HP
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/g_IN_TAR2HPS_FILE
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/g_verbose
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/clk
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/rst
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/ena
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/tb_curr_tdc_time
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/mdt_event_ai
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/csv_file
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/file_open
add wave -noupdate -expand -group TAR2HPS /hps_tb/TAR2HPS/file_ts
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/tar_event_r
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/tar2hps_fifo
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/tar2hps_fifo_counters
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/o_file_ok
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/o_file_ts
add wave -noupdate -expand -group TAR2HPS -radix unsigned -childformat {{/hps_tb/TAR2HPS/o_slc_event_ai(0) -radix unsigned -childformat {{/hps_tb/TAR2HPS/o_slc_event_ai(0)(0) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(1) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(2) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(3) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(4) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(5) -radix unsigned}}} {/hps_tb/TAR2HPS/o_slc_event_ai(1) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(2) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(3) -radix unsigned}} -expand -subitemconfig {/hps_tb/TAR2HPS/o_slc_event_ai(0) {-radix unsigned -childformat {{/hps_tb/TAR2HPS/o_slc_event_ai(0)(0) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(1) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(2) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(3) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(4) -radix unsigned} {/hps_tb/TAR2HPS/o_slc_event_ai(0)(5) -radix unsigned}} -expand} /hps_tb/TAR2HPS/o_slc_event_ai(0)(0) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(0)(1) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(0)(2) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(0)(3) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(0)(4) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(0)(5) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(1) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(2) {-radix unsigned} /hps_tb/TAR2HPS/o_slc_event_ai(3) {-radix unsigned}} /hps_tb/TAR2HPS/o_slc_event_ai
add wave -noupdate -expand -group TAR2HPS -radix unsigned -childformat {{/hps_tb/TAR2HPS/o_mdt_event_ai(0) -radix unsigned -childformat {{/hps_tb/TAR2HPS/o_mdt_event_ai(0)(0) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(1) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(2) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(3) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(4) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(5) -radix unsigned}}} {/hps_tb/TAR2HPS/o_mdt_event_ai(1) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(2) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(3) -radix unsigned}} -expand -subitemconfig {/hps_tb/TAR2HPS/o_mdt_event_ai(0) {-radix unsigned -childformat {{/hps_tb/TAR2HPS/o_mdt_event_ai(0)(0) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(1) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(2) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(3) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(4) -radix unsigned} {/hps_tb/TAR2HPS/o_mdt_event_ai(0)(5) -radix unsigned}} -expand} /hps_tb/TAR2HPS/o_mdt_event_ai(0)(0) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(0)(1) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(0)(2) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(0)(3) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(0)(4) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(0)(5) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(1) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(2) {-radix unsigned} /hps_tb/TAR2HPS/o_mdt_event_ai(3) {-radix unsigned}} /hps_tb/TAR2HPS/o_mdt_event_ai
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/o_tar_hits_inn_av
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/o_tar_hits_mid_av
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/o_tar_hits_out_av
add wave -noupdate -expand -group TAR2HPS -radix unsigned /hps_tb/TAR2HPS/o_tar_hits_ext_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2484281399 fs} 0}
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
WaveRestoreZoom {2470097741 fs} {2539937427 fs}
