onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group hp_top /hp_tb/clk
add wave -noupdate -expand -group hp_top /hp_tb/rst
add wave -noupdate -expand -group hp_top /hp_tb/glob_en
add wave -noupdate -expand -group hp_top /hp_tb/ctrl_r
add wave -noupdate -expand -group hp_top /hp_tb/mon_r
add wave -noupdate -expand -group hp_top /hp_tb/ctrl_v
add wave -noupdate -expand -group hp_top /hp_tb/mon_v
add wave -noupdate -expand -group hp_top /hp_tb/local_rst
add wave -noupdate -expand -group hp_top /hp_tb/local_en
add wave -noupdate -expand -group hp_top /hp_tb/i_SLC_Window_av
add wave -noupdate -expand -group hp_top /hp_tb/i_slc_data_v
add wave -noupdate -expand -group hp_top /hp_tb/i_mdt_data_v
add wave -noupdate -expand -group hp_top /hp_tb/o_hit_data_v
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/clk
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/ctrl_v
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/ena
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/g_ADDR_WIDTH
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/g_DATA_WIDTH
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/g_MEM_LATENCY
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/g_MEMORY_TYPE
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/g_PARALLEL_MEM
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/g_XML_NODE_NAME
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/i_freeze
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/i_rd_data
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/i_rd_dv
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/rst
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/mon_v
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/o_freeze
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/o_mem_sel
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/o_rd_addr
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/o_rd_dv
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/o_wr_addr
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/o_wr_data
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/o_wr_dv
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_clk_cnt
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_clk_lat
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_ctrl_r
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_ctrl_v
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_mon_r
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_mon_v
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_rd_addr
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_rd_data
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_wr_addr
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/apb_wr_data
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/axi_cnt_reset
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/axi_cnt_wait
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/axi_rep_clk
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/ctrl_10A9D_r
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/int_rd_status
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/int_wr_status
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/mon_10A9D_r
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/new_apb_rd_req
add wave -noupdate -expand -group apb /hp_tb/Hit_Processor/HP_PC/HP_CALC_R/apb_mem_interface/new_apb_wr_req
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4999999624 fs} 0}
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
