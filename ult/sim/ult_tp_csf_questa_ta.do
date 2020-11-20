onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/clock_and_control
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/ttc_commands
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/h2s_ctrl
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/h2s_mon
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/tar_ctrl
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/tar_mon
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/mtc_ctrl
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/mtc_mon
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/ucm_ctrl
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/ucm_mon
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/daq_ctrl
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/daq_mon
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/tf_ctrl
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/tf_mon
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/mpl_ctrl
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/mpl_mon
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_inner_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_middle_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_outer_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_extra_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_inner_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_middle_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_outer_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_extra_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/plus_neighbor_segments_i
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/minus_neighbor_segments_i
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/daq_streams_o
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/plus_neighbor_segments_o
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/minus_neighbor_segments_o
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/MTC_o
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/NSP_o
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/sump
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/inner_slc_to_hts
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/middle_slc_to_hts
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/outer_slc_to_hts
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/extra_slc_to_hts
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/ucm2pl_av
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/inner_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/middle_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/outer_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/extra_tar_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/inner_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/middle_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/outer_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/extra_tdc_hits
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/inn_segments_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/mid_segments_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/out_segments_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/ext_segments_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/pl2pt_av
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/pl2mtc_av
add wave -noupdate -group ult_DUT_TB /ult_tp/ULT/pt2mtc_av
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/clk
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/rst
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/glob_en
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/i_inn_tar_hits
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/i_mid_tar_hits
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/i_out_tar_hits
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/i_ext_tar_hits
add wave -noupdate -expand -group TAR -group PL_INN_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/clk
add wave -noupdate -expand -group TAR -group PL_INN_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/rst
add wave -noupdate -expand -group TAR -group PL_INN_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_INN_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_INN_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_INN_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(5)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_INN_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/clk
add wave -noupdate -expand -group TAR -group PL_INN_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/rst
add wave -noupdate -expand -group TAR -group PL_INN_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_INN_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_INN_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_INN_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(4)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_INN_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/clk
add wave -noupdate -expand -group TAR -group PL_INN_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/rst
add wave -noupdate -expand -group TAR -group PL_INN_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_INN_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_INN_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_INN_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(3)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_INN_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/clk
add wave -noupdate -expand -group TAR -group PL_INN_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/rst
add wave -noupdate -expand -group TAR -group PL_INN_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_INN_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_INN_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_INN_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(2)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_INN_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/clk
add wave -noupdate -expand -group TAR -group PL_INN_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/rst
add wave -noupdate -expand -group TAR -group PL_INN_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_INN_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_INN_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_INN_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(1)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_INN_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/clk
add wave -noupdate -expand -group TAR -group PL_INN_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/rst
add wave -noupdate -expand -group TAR -group PL_INN_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_INN_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_INN_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_INN_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/INN_EN/INN_DELAY(0)/PL/RING/ring_mem/wr_index

add wave -noupdate -expand -group TAR -group PL_MID_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/clk
add wave -noupdate -expand -group TAR -group PL_MID_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/rst
add wave -noupdate -expand -group TAR -group PL_MID_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_MID_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_MID_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_MID_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(5)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_MID_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/clk
add wave -noupdate -expand -group TAR -group PL_MID_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/rst
add wave -noupdate -expand -group TAR -group PL_MID_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_MID_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_MID_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_MID_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(4)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_MID_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/clk
add wave -noupdate -expand -group TAR -group PL_MID_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/rst
add wave -noupdate -expand -group TAR -group PL_MID_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_MID_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_MID_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_MID_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(3)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_MID_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/clk
add wave -noupdate -expand -group TAR -group PL_MID_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/rst
add wave -noupdate -expand -group TAR -group PL_MID_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_MID_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_MID_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_MID_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(2)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_MID_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/clk
add wave -noupdate -expand -group TAR -group PL_MID_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/rst
add wave -noupdate -expand -group TAR -group PL_MID_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_MID_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_MID_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_MID_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(1)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_MID_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/clk
add wave -noupdate -expand -group TAR -group PL_MID_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/rst
add wave -noupdate -expand -group TAR -group PL_MID_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_MID_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_MID_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_MID_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/MID_EN/MID_DELAY(0)/PL/RING/ring_mem/wr_index

add wave -noupdate -expand -group TAR -group PL_OUT_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/clk
add wave -noupdate -expand -group TAR -group PL_OUT_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/rst
add wave -noupdate -expand -group TAR -group PL_OUT_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_OUT_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_OUT_5 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_OUT_5 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(5)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_OUT_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/clk
add wave -noupdate -expand -group TAR -group PL_OUT_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/rst
add wave -noupdate -expand -group TAR -group PL_OUT_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_OUT_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_OUT_4 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_OUT_4 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(4)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_OUT_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/clk
add wave -noupdate -expand -group TAR -group PL_OUT_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/rst
add wave -noupdate -expand -group TAR -group PL_OUT_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_OUT_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_OUT_3 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_OUT_3 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(3)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_OUT_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/clk
add wave -noupdate -expand -group TAR -group PL_OUT_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/rst
add wave -noupdate -expand -group TAR -group PL_OUT_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_OUT_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_OUT_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_OUT_2 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(2)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_OUT_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/clk
add wave -noupdate -expand -group TAR -group PL_OUT_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/rst
add wave -noupdate -expand -group TAR -group PL_OUT_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_OUT_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_OUT_1 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_OUT_1 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(1)/PL/RING/ring_mem/wr_index
add wave -noupdate -expand -group TAR -group PL_OUT_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/clk
add wave -noupdate -expand -group TAR -group PL_OUT_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/rst
add wave -noupdate -expand -group TAR -group PL_OUT_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/glob_en
add wave -noupdate -expand -group TAR -group PL_OUT_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/i_data
add wave -noupdate -expand -group TAR -group PL_OUT_0 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/o_data
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/case_options
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/clk
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/i_delay
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/i_rd
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/i_wr
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/i_wr_data
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/mem
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/mem_dv
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/o_empty
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/o_empty_next
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/o_full
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/o_full_next
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/o_rd_data
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/o_used
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/rd_index
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/rst
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/used_data
add wave -noupdate -expand -group TAR -group PL_OUT_0 -group RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/OUT_EN/OUT_DELAY(0)/PL/RING/ring_mem/wr_index

add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/o_inn_tar_hits
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/o_mid_tar_hits
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/o_out_tar_hits
add wave -noupdate -expand -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR_INPUTS_GEN/TAR/o_ext_tar_hits
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
WaveRestoreZoom {4999999050 fs} {4999999782 fs}
