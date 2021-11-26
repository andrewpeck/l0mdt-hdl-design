onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group tar_top /top_tar_tb/clk
add wave -noupdate -group tar_top /top_tar_tb/rst
add wave -noupdate -group tar_top /top_tar_tb/glob_en
add wave -noupdate -group tar_top /top_tar_tb/ctrl_r
add wave -noupdate -group tar_top -subitemconfig {/top_tar_tb/mon_r.PL_ST -expand /top_tar_tb/mon_r.PL_ST.PL_ST -expand /top_tar_tb/mon_r.PL_ST.PL_ST(3) -expand /top_tar_tb/mon_r.PL_ST.PL_ST(3).PL_CHAMBER -expand /top_tar_tb/mon_r.PL_ST.PL_ST(3).PL_CHAMBER.PL_MEM -expand /top_tar_tb/mon_r.PL_ST.PL_ST(3).PL_CHAMBER.PL_MEM(5) -expand /top_tar_tb/mon_r.PL_ST.PL_ST(3).PL_CHAMBER.PL_MEM(5).SIGNALS -expand /top_tar_tb/mon_r.PL_ST.PL_ST(3).PL_CHAMBER.PL_MEM(5).rd_data -expand} /top_tar_tb/mon_r
add wave -noupdate -group tar_top /top_tar_tb/ctrl_v
add wave -noupdate -group tar_top /top_tar_tb/mon_v
add wave -noupdate -group tar_top /top_tar_tb/i_inn_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/i_mid_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/i_out_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/i_ext_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_inn_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_mid_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_out_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_ext_tdc_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_inn_tar_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_mid_tar_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_out_tar_hits_av
add wave -noupdate -group tar_top /top_tar_tb/o_ext_tar_hits_av
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/clk
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_v
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ena
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/g_ADDR_WIDTH
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/g_DATA_WIDTH
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/g_INTERNAL_CLK
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/g_MEM_LATENCY
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/g_MEMORY_TYPE
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/g_XML_NODE_NAME
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/i_freeze
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/i_rd_data
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/i_rd_dv
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/rst
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_v
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/o_freeze
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/o_mem_sel
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/o_rd_addr
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/o_rd_dv
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/o_wr_addr
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/o_wr_data
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/o_wr_dv
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_clk_cnt
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_clk_lat
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_ctrl_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_ctrl_v
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_mon_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_mon_v
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_rd_addr
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_rd_data
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_wr_addr
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/apb_wr_data
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/axi_cnt_reset
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/axi_cnt_wait
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/axi_rep_clk
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_4A17D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_8A16D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_9A19D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_10A9D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_10A38D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_12A42D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/ctrl_12A148D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/int_rd_status
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/int_wr_status
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_4A17D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_8A16D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_9A19D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_10A9D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_10A38D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_12A42D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/mon_12A148D_r
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/new_apb_rd_req
add wave -noupdate -expand -group OUT_PL0_IMEM /top_tar_tb/TAR/OUT_EN/TAR_OUT/PL_ARRAY(0)/POLMUX_EN/VAMC_PL/EXT_INT/apb_mem_interface/new_apb_wr_req
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
quietly wave cursor active 0
configure wave -namecolwidth 372
configure wave -valuecolwidth 725
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
WaveRestoreZoom {0 fs} {90 fs}
