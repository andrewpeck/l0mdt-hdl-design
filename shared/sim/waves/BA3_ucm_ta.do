onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ucm_tb /ucm_tb/PRJ_INFO
add wave -noupdate -group ucm_tb /ucm_tb/IN_SLC_FILE
add wave -noupdate -group ucm_tb /ucm_tb/IN_CTRL_FILE
add wave -noupdate -group ucm_tb /ucm_tb/g_MAINDIVTYPE
add wave -noupdate -group ucm_tb /ucm_tb/DUMMY
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_time_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_tdc_time_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_sim_time_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_period
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_time
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_axi
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_axi_cnt
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_tdc_time
add wave -noupdate -group ucm_tb -group clks /ucm_tb/clk_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/axi_rst
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_tdc_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/enable_slc
add wave -noupdate -group ucm_tb /ucm_tb/rst
add wave -noupdate -group ucm_tb /ucm_tb/glob_en
add wave -noupdate -group ucm_tb /ucm_tb/bx
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/IN_SLC_FILE
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/g_verbose
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/clk
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/rst
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/enable
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/tb_curr_tdc_time
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_file_ok
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_file_ts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_slc_event_ai
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_main_primary_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_main_secondary_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_plus_neighbor_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/o_minus_neighbor_slc
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/temp_slc_rx_vt
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_element_temp
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_element
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/event_element_temp
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/event_element
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_event_r
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_new_event
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/event_main_prim_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_event_ai
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_prim_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_seco_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_plus_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_minu_fifo
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_prim_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_main_seco_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_plus_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/slc_neig_minu_counts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/csv_file
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/file_open
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/file_ts
add wave -noupdate -group ucm_tb -group csv_in /ucm_tb/CSV_SLC_IN/SLC_RX_LEN
add wave -noupdate -group ucm_tb /ucm_tb/ttc_commands
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_r
add wave -noupdate -group ucm_tb /ucm_tb/mon_r
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_v
add wave -noupdate -group ucm_tb /ucm_tb/mon_v
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_mainA_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_mainB_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborA_v
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborB_v
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_inn_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_mid_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_out_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_ext_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2pl_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_PRJ_INFO
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_IN_FILES
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_verbose
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/clk
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/rst
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/enable
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_sim_time
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_tdc_time
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ok
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ts
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/in_files_str
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_ai
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/inn_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/mid_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/out_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ext_slc_to_h2s_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_av
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_1
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_2
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2m_au
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2h_au
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/inn_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/mid_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/out_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/ext_ucm2hps_bus_ar
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_1
add wave -noupdate -group ucm_tb -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_2
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ok
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ts
add wave -noupdate -group ucm_tb /ucm_tb/slc_event_ai
add wave -noupdate -group ucm_tb /ucm_tb/files_str
add wave -noupdate -group ucm_tb /ucm_tb/reset_init_cycles
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/g_MAX_POSSIBLE_HPS
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/g_NUM_MDT_LAYERS
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/g_NUM_RPC_LAYERS
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ena
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ctrl_v
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mon_v
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ctrl_r
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mon_r
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_r
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_mon_r
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_ctrl_v
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_R_mon_v
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_r
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_mon_r
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_ctrl_v
add wave -noupdate -expand -group slc_vp_2 -group c&m /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_R_mon_v
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_data_r
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/clk
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rst
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/ena
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_cointype
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(3) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(0) -radix decimal}} -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(3) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_data_valid
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/g_NUM_RPC_LAYERS
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/g_INPUT_RESOLUTION
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/g_OUTPUT_RESOLUTION
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/g_OUTPUT_WIDTH
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/g_DIV_IP_R2_EN
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/g_DIV_VU_EN
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/g_DIV_SEL
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/clk
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/rst
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/ena
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/i_cointype
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/i_rpc_Z_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/i_cand_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/i_rpc_R_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/i_rpc_R_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/coin
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/num_h_i
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/rpc_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/rad_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/set_data_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/o_num_h_i
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/o_rpc_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/o_rad_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -group data_set /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/data_set/DATA_SET_ENT/o_set_data_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -color Coral -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/num_h_i
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -color Coral -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -color Coral -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -color Coral -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/set_data_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(3) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(0) -radix decimal}} -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(3) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xy
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xy_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xx
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xx_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSx
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSx_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxx
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxx_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxxSy
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxxSy_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSxy
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSxy_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxy
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxy_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSy
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_sz_sy_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix symbolic /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_bnom_sc
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_bden_sc
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_bdiv_sc
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tvalid
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata_q
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata_r
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_bdiv_ipr2
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_bdiv_ipr2_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_bdiv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_bdiv_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_nom_sc
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_den_sc
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_sc
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tvalid
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata_q
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata_r
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_ipr2
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_ipr2_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/vec_z_pos_dv_a
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_offset
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_slope
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vector_dv
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos
add wave -noupdate -expand -group slc_vp_2 -expand -group b_param_calc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_Z_a
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_pos_a
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_pos_a_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ucm2hps_buff_ar
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -expand -group slc_vp_2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1410216930 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 251
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
WaveRestoreZoom {1396500556 fs} {1487708584 fs}
