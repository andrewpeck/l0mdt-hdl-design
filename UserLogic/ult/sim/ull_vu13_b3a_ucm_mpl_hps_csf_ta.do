onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT_TOP /ult_tp/ULT/clock_and_control
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ttc_commands
add wave -noupdate -group ULT_TOP /ult_tp/ULT/h2s_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/h2s_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tar_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tar_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mtc_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mtc_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ucm_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ucm_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/daq_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/daq_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tf_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tf_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mpl_ctrl
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mpl_mon
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_inner_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_middle_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_outer_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_extra_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_inner_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_middle_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_outer_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_extra_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_main_primary_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_main_secondary_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_plus_neighbor_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_minus_neighbor_slc
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_plus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/i_minus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_daq_streams
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_plus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_minus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_MTC
add wave -noupdate -group ULT_TOP /ult_tp/ULT/o_NSP
add wave -noupdate -group ULT_TOP /ult_tp/ULT/sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inn_slc_to_h2s
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mid_slc_to_h2s
add wave -noupdate -group ULT_TOP /ult_tp/ULT/out_slc_to_h2s
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ext_slc_to_h2s
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ucm2pl_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inn_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mid_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/out_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ext_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inn_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mid_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/out_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ext_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inn_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mid_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/out_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ext_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inner_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/middle_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/outer_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/extra_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pl2pt_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pl2mtc_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pt2mtc_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/pt_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/h2s_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/tar_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/mtc_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/daq_sump
add wave -noupdate -group ULT_TOP /ult_tp/ULT/DUMMY
add wave -noupdate -divider TAR
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/clk
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/rst
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/glob_en
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_inn_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_mid_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_out_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_ext_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_inn_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_mid_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_out_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_ext_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_inn_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_mid_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_out_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/i_ext_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_inn_tdc_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_mid_tdc_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_out_tdc_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_ext_tdc_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_inn_tar_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_mid_tar_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_out_tar_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/int_ext_tar_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_inn_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_mid_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_out_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_ext_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_inn_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_mid_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_out_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/o_ext_tar_hits_av
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_FREEZE_ENABLED
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_PARALLEL_MEM
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_CONTROLLER_MODE
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_MEMORY_MODE
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_MEMORY_TYPE
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_ADDR_WIDTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_DATA_WIDTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_DATA_DEPTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_PIPELINE_TYPE
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_DELAY_CYCLES
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_DELAY_EQUAL_WIDTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_PIPELINE_WIDTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_APBUS_ENABLED
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_XML_NODE_NAME
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_APBUS_CTRL_WIDTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/g_APBUS_MON_WIDTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/clk
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/rst
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/ena
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/ctrl
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/mon
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/i_freeze
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/i_data
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/i_dv
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/o_data
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/o_dv
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/FREEZE_EN
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/ADDR_WIDTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/DATA_DEPTH
add wave -noupdate -group PL_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/DATA_WIDTH
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_SIMULATION
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_LOGIC_TYPE
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_READ_MODE
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_MEMORY_TYPE
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_DV_TYPE
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_SECOND_PORT
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_PL_DELAY_CYCLES
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_IN_PIPELINE
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_OUT_PIPELINE
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_MEM_WIDTH
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_MEM_DEPTH
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/clk
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/rst
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_freeze
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_ext_ctrl
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_addr_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_din_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_dv_in_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dout_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dv_out_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_addr_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_din_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_dv_in_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dout_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dv_out_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_empty
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_empty_next
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_full
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_full_next
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_used
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_pipes_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_pipes_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/data_pipes_A
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/data_pipes_B
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/wr_index_aux
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/rd_index_aux
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/wr_index
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/rd_index
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_addr_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_addr_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_in_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_in_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_out_a
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_out_b
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/used_data
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ADD_WIDTH
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/MEM_DEPTH
add wave -noupdate -group PL_2_SDP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/MEM_WIDTH
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/g_MEMORY_TYPE
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/g_MEMORY_STRUCTURE
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/g_ENABLE_SECOND_PORT
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/g_RAM_WIDTH
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/g_ADD_WIDTH
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/g_RAM_DEPTH
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/clk
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/rst
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/ena_a
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/i_addr_a
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/i_din_a
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/i_wr_nrd_a
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/o_dout_a
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/ena_b
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/i_addr_b
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/i_din_b
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/i_wr_nrd_b
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/o_dout_b
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/mem
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/addr_a
add wave -noupdate -group SDP_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/PL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_ULTRA/RAM_MEM/addr_b
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/g_STATION
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/clk
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/rst
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/glob_en
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/i_tdc_hits
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/i_tar_hits
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/o_tdc_hits
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/o_tar_hits
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/i_tdc_hits_r
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/o_tar_hits_r
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/ml1_tubes
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/ml1_layer
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/ml2_tubes
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/ml2_layer
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/csm_offset_mem
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/tdc_offset_mem
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/csm_offset
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/tdc_offset
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/tdc_layer
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/tdc_tube
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/full_time
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/dv_pl
add wave -noupdate -expand -group remap_2 /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/INN_EN/INN_DELAY(2)/INN_EN/REMAP_INN/csm_pl
add wave -noupdate -divider UCM
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/clk
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/rst
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/glob_en
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ttc_commands
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ctrl
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/mon
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/clk
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/axi_rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/glob_en
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/ctrl
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/mon
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/o_phicenter
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/o_cde_chamber_z_org_bus
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/o_cvp_chamber_z_org_bus
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/local_en
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/local_rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/clk
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/ena
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/o_axi_clk
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/o_axi_rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/axi_rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/int_rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/clk_axi
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR -expand -group APB_MS /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/APB_MS/clk_axi_cnt
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/clk_axi
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_en
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/local_rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/int_en
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/int_rst
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/phicenter
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/PHI_CTRL
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/PHI_MON
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cde_ch_z0_org
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CDE_Z0_CTRL
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CDE_Z0_MON
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CDE_states
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/cvp_ch_z0_org
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CVP_Z0_CTRL
add wave -noupdate -group UCM_Top -group UCM_SUPERVISOR /ult_tp/ULT/logic_gen/UCM/UCM/UCM/UCM_SUPERVISOR/CVP_Z0_MON
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/phicenter
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/clk
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/rst
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/glob_en
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/i_prepro2ctrl_av
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/num_cand
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/pam_update
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/clk
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/rst
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/glob_en
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/i_num_cand
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/i_pam_update
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/ch_busy
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/proc_info
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL -expand /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/ch_count
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/processed_s
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/processing
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/buff_pam_ctrl
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL -color Coral -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_pam_ctrl(2) {-color Coral -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_pam_ctrl(1) {-color Coral -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_pam_ctrl(0) {-color Coral -height 17}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_pam_ctrl
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL -color Coral -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info(2) {-color Orange -height 17 -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info(2).ch {-color Orange -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info(2).processed {-color Orange -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info(1) {-color Coral -height 17 -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info(1).ch {-color Coral -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info(1).processed {-color Coral -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info(0) {-color Coral -height 17}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_proc_info
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_cvp_rst
add wave -noupdate -group UCM_Top -group SLC_CTRL -expand -group PAM_CTRL -expand /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/PAM_CTRL/o_cvp_ctrl
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/o_csw_ctrl
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/o_pam_ctrl
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/o_proc_info
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/o_cvp_rst
add wave -noupdate -group UCM_Top -group SLC_CTRL /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CTRL/o_cvp_ctrl
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/clk
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rst
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/glob_en
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_phicenter
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_v
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_r
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_r
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/barrel_r
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/dv_bus
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rpc_z_a
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_v
add wave -noupdate -group UCM_Top -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_phimod
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/prepro2ctrl_av
add wave -noupdate -group UCM_Top -color Cyan /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ucm_prepro_av
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/g_MEMORY_TYPE
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/g_PIPELINE_TYPE
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/g_DELAY_CYCLES
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/g_DELAY_EQUAL_WIDTH
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/g_PIPELINE_WIDTH
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/clk
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/rst
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/ena
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/i_freeze
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/i_data
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/i_dv
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/o_data
add wave -noupdate -group UCM_Top -group SLC_IN_PL_A4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_IN_PL_A(4)/SLC_IN_PL/o_dv
add wave -noupdate -group UCM_Top -color Cyan /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_in_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/slc_endcap_ar
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_in_av
add wave -noupdate -group UCM_Top -color Coral /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_ar
add wave -noupdate -group UCM_Top -color Coral /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_av
add wave -noupdate -group UCM_Top -color Violet /ult_tp/ULT/logic_gen/UCM/UCM/UCM/proc_info
add wave -noupdate -group UCM_Top -color Coral /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group UCM_Top -color Coral /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_in_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_out_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_control
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_in_en
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/glob_en
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -group UCM_Top -group CVP2 -radix decimal /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_phimod
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -group UCM_Top -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM_Top -divider 2MPL
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/g_MEMORY_TYPE
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/g_PIPELINE_TYPE
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/g_DELAY_CYCLES
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/g_PIPELINE_WIDTH
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/clk
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/rst
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/glob_en
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/i_data
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/i_dv
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/o_data
add wave -noupdate -group UCM_Top -group OUTPL2PL4 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_OUT_PL_A(4)/SLC_OUT_PL/o_dv
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_phimod
add wave -noupdate -group UCM_Top -color Violet /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group UCM_Top -color Violet /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group UCM_Top /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_av
add wave -noupdate -divider MPL
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/clk
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/rst
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/glob_en
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/ctrl
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/mon
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/local_en
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/local_rst
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/int_freeze
add wave -noupdate -group MPL -expand /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/i_uCM2pl_av
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/clk
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/rst
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/enable
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/ctrl
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/mon
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/i_freeze
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/i_uCM2pl_v
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/o_pl2ptcalc_v
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/o_pl2mtc_v
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/clk
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/rst
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/ena
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/i_freeze
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/i_data
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/i_dv
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/o_data
add wave -noupdate -group MPL -group PL4 -group PL_A /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/PL_A/o_dv
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/i_uCM2pl_r
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2pl_v
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2pl_r
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2mtc_r
add wave -noupdate -group MPL -group PL4 /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/MPL_PL(4)/PL/pl2mtc_v
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/i_uCM2pl_ar
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/main_pl_out_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2csw_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2ptcalc_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2mtc_av
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/main_pl_out_ar
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2ptcalc_ar
add wave -noupdate -group MPL /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/pl2mtc_ar
add wave -noupdate -group MPL -group PL_CSW /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/PL_CSW/clk
add wave -noupdate -group MPL -group PL_CSW /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/PL_CSW/rst
add wave -noupdate -group MPL -group PL_CSW /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/PL_CSW/i_ucm_av
add wave -noupdate -group MPL -group PL_CSW -expand /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/PL_CSW/o_tf_av
add wave -noupdate -group MPL -group PL_CSW /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/PL_CSW/slc_pl
add wave -noupdate -group MPL -group PL_CSW -expand -subitemconfig {/ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/PL_CSW/csw2tf_ar(2) -expand} /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/PL_CSW/csw2tf_ar
add wave -noupdate -group MPL -expand /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/o_pl2ptcalc_av
add wave -noupdate -group MPL -expand /ult_tp/ULT/logic_gen/MPL/MPL_EN/MPL/o_pl2mtc_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Reset {3729687500 fs} 1 Red default} {{Cursor 2} {1901562500 fs} 1} {{Cursor 3} {802207131 fs} 0}
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
WaveRestoreZoom {447531167 fs} {6844480513 fs}
