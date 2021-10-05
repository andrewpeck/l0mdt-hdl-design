onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group tb_slc /ult_tp/SLC/clk
add wave -noupdate -group tb_slc /ult_tp/SLC/enable
add wave -noupdate -group tb_slc /ult_tp/SLC/IN_SLC_FILE
add wave -noupdate -group tb_slc /ult_tp/SLC/rst
add wave -noupdate -group tb_slc /ult_tp/SLC/tb_curr_tdc_time
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_element
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_event_r
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_main_prim_counts
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_main_prim_fifo
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_main_seco_counts
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_main_seco_fifo
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_neig_minu_counts
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_neig_minu_fifo
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_neig_plus_counts
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_neig_plus_fifo
add wave -noupdate -group tb_slc /ult_tp/SLC/slc_new_event
add wave -noupdate -group tb_slc /ult_tp/SLC/o_main_primary_slc
add wave -noupdate -group tb_slc /ult_tp/SLC/o_main_secondary_slc
add wave -noupdate -group tb_slc /ult_tp/SLC/o_minus_neighbor_slc
add wave -noupdate -group tb_slc /ult_tp/SLC/o_plus_neighbor_slc
add wave -noupdate -group tb_mdt /ult_tp/MDT/IN_HIT_FILE
add wave -noupdate -group tb_mdt /ult_tp/MDT/clk
add wave -noupdate -group tb_mdt /ult_tp/MDT/rst
add wave -noupdate -group tb_mdt /ult_tp/MDT/enable
add wave -noupdate -group tb_mdt -radix unsigned /ult_tp/MDT/tb_curr_tdc_time
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_tdc_station
add wave -noupdate -group tb_mdt -childformat {{/ult_tp/MDT/mdt_tdc_event_r.ToA -radix unsigned}} -expand -subitemconfig {/ult_tp/MDT/mdt_tdc_event_r.ToA {-height 17 -radix unsigned}} /ult_tp/MDT/mdt_tdc_event_r
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_new_event
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_inn_ar
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_mid_ar
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_out_ar
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_ext_ar
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_inn_fifo
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_mid_fifo
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_out_fifo
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_ext_fifo
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_inn_counts
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_mid_counts
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_out_counts
add wave -noupdate -group tb_mdt /ult_tp/MDT/mdt_ext_counts
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_inn_av
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_mid_av
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_out_av
add wave -noupdate -group tb_mdt /ult_tp/MDT/i_mdt_tdc_ext_av
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/ucm2pl_av
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/clk
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/rst
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/enable
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/g_IN_HIT_FILE
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/g_IN_L0_FILE
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/g_IN_SLC_FILE
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/g_PRJ_INFO
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/tb_curr_tdc_time
add wave -noupdate -expand -group tb_ucm2hps -radix unsigned /ult_tp/UCM/slc_event_ai
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/clk
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/ena
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/rst
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_FIFO_TYPE
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_LOGIC_TYPE
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_MEMORY_TYPE
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_RAM_DEPTH
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_RAM_WIDTH
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/g_SIMULATION
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/i_delay
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/i_rd
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/i_wr
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB -radix unsigned /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/i_wr_data
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/case_options
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/en_pipeline
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB -radix unsigned /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/int_wr_data
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/rd_index
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB -radix unsigned /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/mem
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/wr_index
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB -radix unsigned /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/output_pipeline
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/mem_dv
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/output_dv_pipeline
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/used_data
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/o_empty
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/o_empty_next
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/o_full
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/o_full_next
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB -radix unsigned /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/o_rd_data
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/o_rd_dv
add wave -noupdate -expand -group tb_ucm2hps -group PL_RB /ult_tp/UCM/event_ucm2hps_pl(4)/E_U2H_PL/RING_GEN/SIM_GEN/ring_mem/o_used
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/slc_event_u2h_au
add wave -noupdate -expand -group tb_ucm2hps -radix unsigned /ult_tp/UCM/slc_event_u2m_au
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/inn_slc_to_h2s_av
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/inn_ucm2hps_bus_ar
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/mid_slc_to_h2s_av
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/mid_ucm2hps_bus_ar
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/out_slc_to_h2s_av
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/out_ucm2hps_bus_ar
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/ext_slc_to_h2s_av
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/ext_ucm2hps_bus_ar
add wave -noupdate -expand -group tb_ucm2hps /ult_tp/UCM/ucm2pl_ar
add wave -noupdate -group tb_tar /ult_tp/TAR/clk
add wave -noupdate -group tb_tar /ult_tp/TAR/enable
add wave -noupdate -group tb_tar /ult_tp/TAR/g_IN_HIT_FILE
add wave -noupdate -group tb_tar /ult_tp/TAR/g_IN_L0_FILE
add wave -noupdate -group tb_tar /ult_tp/TAR/g_IN_SLC_FILE
add wave -noupdate -group tb_tar /ult_tp/TAR/g_PRJ_INFO
add wave -noupdate -group tb_tar /ult_tp/TAR/rst
add wave -noupdate -group tb_tar /ult_tp/TAR/tb_curr_tdc_time
add wave -noupdate -group tb_tar /ult_tp/TAR/csv_file_1
add wave -noupdate -group tb_tar /ult_tp/TAR/g_OUT_FILE_1
add wave -noupdate -group tb_tar /ult_tp/TAR/hit_file_ok
add wave -noupdate -group tb_tar /ult_tp/TAR/hit_file_ts
add wave -noupdate -group tb_tar /ult_tp/TAR/ult_inn_tar_hits_av
add wave -noupdate -group tb_tar /ult_tp/TAR/ult_mid_tar_hits_av
add wave -noupdate -group tb_tar /ult_tp/TAR/ult_out_tar_hits_av
add wave -noupdate -group tb_tar /ult_tp/TAR/ult_ext_tar_hits_av
add wave -noupdate -group tb_tar -expand /ult_tp/TAR/ult_inn_tar_hits_ar
add wave -noupdate -group tb_tar -expand /ult_tp/TAR/ult_mid_tar_hits_ar
add wave -noupdate -group tb_tar /ult_tp/TAR/ult_out_tar_hits_ar
add wave -noupdate -group tb_tar /ult_tp/TAR/ult_ext_tar_hits_ar
add wave -noupdate -group tb_tar /ult_tp/TAR/mdt_event_ai
add wave -noupdate -group tb_tar /ult_tp/TAR/slc_file_ok
add wave -noupdate -group tb_tar /ult_tp/TAR/slc_file_ts
add wave -noupdate -group tb_tar /ult_tp/TAR/tdc_event_u2h_au
add wave -noupdate -group tb_hps /ult_tp/HPS/clk
add wave -noupdate -group tb_hps /ult_tp/HPS/enable
add wave -noupdate -group tb_hps /ult_tp/HPS/g_IN_HIT_FILE
add wave -noupdate -group tb_hps /ult_tp/HPS/g_IN_L0_FILE
add wave -noupdate -group tb_hps /ult_tp/HPS/g_IN_SLC_FILE
add wave -noupdate -group tb_hps /ult_tp/HPS/g_PRJ_INFO
add wave -noupdate -group tb_hps /ult_tp/HPS/rst
add wave -noupdate -group tb_hps /ult_tp/HPS/tb_curr_tdc_time
add wave -noupdate -group tb_hps /ult_tp/HPS/csv_file_1
add wave -noupdate -group tb_hps /ult_tp/HPS/ext_mdt_full_data_ar
add wave -noupdate -group tb_hps /ult_tp/HPS/g_OUT_FILE_1
add wave -noupdate -group tb_hps /ult_tp/HPS/hit_file_ok
add wave -noupdate -group tb_hps /ult_tp/HPS/hit_file_ts
add wave -noupdate -group tb_hps /ult_tp/HPS/inn_mdt_full_data_ar
add wave -noupdate -group tb_hps /ult_tp/HPS/inn_mdt_full_data_av
add wave -noupdate -group tb_hps /ult_tp/HPS/mdt_event_ai
add wave -noupdate -group tb_hps /ult_tp/HPS/mid_mdt_full_data_ar
add wave -noupdate -group tb_hps /ult_tp/HPS/mid_mdt_full_data_av
add wave -noupdate -group tb_hps /ult_tp/HPS/out_mdt_full_data_ar
add wave -noupdate -group tb_hps /ult_tp/HPS/out_mdt_full_data_av
add wave -noupdate -group tb_hps /ult_tp/HPS/slc_file_ok
add wave -noupdate -group tb_hps /ult_tp/HPS/slc_file_ts
add wave -noupdate -group tb_hps /ult_tp/HPS/tdc_event_u2h_au
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2042187500 fs} 1 Red default} {{Cursor 2} {2296042587 fs} 0} {{Cursor 3} {141773417786 fs} 0}
quietly wave cursor active 2
configure wave -namecolwidth 244
configure wave -valuecolwidth 261
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
WaveRestoreZoom {2267994870 fs} {2324565019 fs}
