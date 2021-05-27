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
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/clock_and_control
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/ctrl
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/mon
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/ttc_commands
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_inn_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_mid_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_out_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/i_ext_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_inn_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_mid_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_out_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_ext_tdc_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_inn_tar_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_mid_tar_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_out_tar_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_ext_tar_hits_av
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/o_sump
add wave -noupdate -group ULT_TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/glob_en
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/clk
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/rst
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/glob_en
add wave -noupdate -group TAR -expand /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_inn_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_mid_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_out_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_ext_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_inn_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_mid_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_out_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_ext_tdc_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_inn_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_mid_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_out_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/o_ext_tar_hits_av
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_inn_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_mid_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_out_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/i_ext_tdc_hits_ar
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/int_inn_tdc_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/int_mid_tdc_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/int_out_tdc_hits
add wave -noupdate -group TAR /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/int_ext_tdc_hits
add wave -noupdate -divider {New Divider}
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_FREEZE_ENABLED
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_PARALLEL_MEM
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_CONTROLLER_MODE
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_MEMORY_MODE
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_MEMORY_TYPE
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_ADDR_WIDTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_DATA_WIDTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_DATA_DEPTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_PIPELINE_TYPE
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_MEMORY_STRUCTURE
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_DELAY_CYCLES
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_DELAY_EQUAL_WIDTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_PIPELINE_WIDTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_APBUS_ENABLED
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_XML_NODE_NAME
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_APBUS_CTRL_WIDTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/g_APBUS_MON_WIDTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/clk
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/rst
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/ena
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/ctrl
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/mon
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/i_freeze
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/i_data
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/i_dv
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/o_data
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/o_dv
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/FREEZE_EN
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/ADDR_WIDTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/DATA_DEPTH
add wave -noupdate -group VAMC_CTRL /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/DATA_WIDTH
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_SIMULATION
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_LOGIC_TYPE
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_READ_MODE
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_MEMORY_TYPE
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_DV_TYPE
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_MEMORY_STRUCTURE
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_SECOND_PORT
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_PL_DELAY_CYCLES
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_IN_PIPELINE
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_OUT_PIPELINE
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_ADD_WIDTH
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_MEM_WIDTH
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/g_MEM_DEPTH
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/clk
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/rst
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_freeze
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_ext_ctrl
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_addr_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_din_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_dv_in_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dout_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dv_out_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_addr_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_din_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/i_dv_in_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dout_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/o_dv_out_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_pipes_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ena_pipes_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/data_pipes_A
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/data_pipes_B
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_addr_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_addr_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_in_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_in_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_out_a
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/mem_out_b
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/used_data
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/ADDR_WIDTH
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/DATA_DEPTH
add wave -noupdate -group mpcvmem /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/DATA_WIDTH
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/g_SIMULATION
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/g_DV_TYPE
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/g_PL_DELAY_CYCLES
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/g_ADD_WIDTH
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/g_MEM_WIDTH
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/g_MEM_DEPTH
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/clk
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/rst
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/ena
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/i_freeze
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/i_ext_ctrl
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/i_addr_a
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/o_addr_a
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/i_addr_b
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/o_addr_b
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/wr_index_aux
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/rd_index_aux
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/wr_index
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/rd_index
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/mem_addr_a
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/mem_addr_b
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/mem_in_a
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/mem_in_b
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/mem_out_a
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/mem_out_b
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/used_data
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/ADD_WIDTH
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/MEM_DEPTH
add wave -noupdate -expand -group pl_ctrl /ult_tp/ULT/logic_gen/TAR_GEN/ULT_TAR/TAR/INN_EN/INN_DELAY(2)/INN_EN/VAMC_CTRL/APB_INT_DIS/MODE_MEM/MPCVMEM_GEN/mpcvmem/PIPE_GEN/PL_CTRL/MEM_WIDTH
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {982581967 fs} 0}
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
