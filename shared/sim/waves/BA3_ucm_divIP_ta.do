onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ucm_tb /ucm_tb/DUMMY
add wave -noupdate -group ucm_tb /ucm_tb/IN_CTRL_FILE
add wave -noupdate -group ucm_tb /ucm_tb/IN_SLC_FILE
add wave -noupdate -group ucm_tb /ucm_tb/PRJ_INFO
add wave -noupdate -group ucm_tb /ucm_tb/axi_rst
add wave -noupdate -group ucm_tb /ucm_tb/bx
add wave -noupdate -group ucm_tb /ucm_tb/clk
add wave -noupdate -group ucm_tb /ucm_tb/clk_axi
add wave -noupdate -group ucm_tb /ucm_tb/clk_axi_cnt
add wave -noupdate -group ucm_tb /ucm_tb/clk_period
add wave -noupdate -group ucm_tb /ucm_tb/clk_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/clk_sim_time_period
add wave -noupdate -group ucm_tb /ucm_tb/clk_tdc_time
add wave -noupdate -group ucm_tb /ucm_tb/clk_tdc_time_period
add wave -noupdate -group ucm_tb /ucm_tb/clk_time
add wave -noupdate -group ucm_tb /ucm_tb/clk_time_period
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_r
add wave -noupdate -group ucm_tb /ucm_tb/ctrl_v
add wave -noupdate -group ucm_tb /ucm_tb/enable_slc
add wave -noupdate -group ucm_tb /ucm_tb/files_str
add wave -noupdate -group ucm_tb /ucm_tb/glob_en
add wave -noupdate -group ucm_tb -expand /ucm_tb/i_slc_data_mainA_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_mainB_av
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborA_v
add wave -noupdate -group ucm_tb /ucm_tb/i_slc_data_neighborB_v
add wave -noupdate -group ucm_tb /ucm_tb/mon_r
add wave -noupdate -group ucm_tb /ucm_tb/mon_v
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_ext_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_inn_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_mid_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2hps_out_av
add wave -noupdate -group ucm_tb /ucm_tb/o_uCM2pl_av
add wave -noupdate -group ucm_tb /ucm_tb/reset_init_cycles
add wave -noupdate -group ucm_tb /ucm_tb/rst
add wave -noupdate -group ucm_tb /ucm_tb/slc_event_ai
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ok
add wave -noupdate -group ucm_tb /ucm_tb/slc_file_ts
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_sim_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_tdc_time
add wave -noupdate -group ucm_tb /ucm_tb/tb_curr_time
add wave -noupdate -group ucm_tb /ucm_tb/ttc_commands
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/clk
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/enable
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/ext_slc_to_h2s_av
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/g_IN_FILES
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/g_PRJ_INFO
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/in_files_str
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ok
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/in_slc_file_ts
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/inn_slc_to_h2s_av
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/mid_slc_to_h2s_av
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/out_slc_to_h2s_av
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/rst
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_ai
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_sim_time
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/tb_curr_tdc_time
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_av
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_1
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/csv_file_2
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/ext_ucm2hps_bus_ar
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_1
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/g_OUT_FILE_2
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/inn_ucm2hps_bus_ar
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/mid_ucm2hps_bus_ar
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/out_ucm2hps_bus_ar
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2h_au
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/slc_event_u2m_au
add wave -noupdate -group csv_out /ucm_tb/CSV_UCM_OUT/ucm2pl_ar
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/bypass
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/phimod_ena
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/clk
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/rst
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/ena
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_phicenter
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_proc_info_v
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_v
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_proc_info_r
add wave -noupdate -group slc_CDE_4 -radix unsigned -childformat {{/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.data_valid -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common -radix unsigned -childformat {{/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.header -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.slcid -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.tcsent -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.poseta -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.posphi -radix decimal} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_pt -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_ptthresh -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_charge -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.cointype -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.trailer -radix unsigned}}} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.specific -radix unsigned}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.data_valid {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common {-height 17 -radix unsigned -childformat {{/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.header -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.slcid -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.tcsent -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.poseta -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.posphi -radix decimal} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_pt -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_ptthresh -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_charge -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.cointype -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.trailer -radix unsigned}} -expand} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.header {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.slcid {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.tcsent {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.poseta {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.posphi {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_pt {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_ptthresh {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.sl_charge {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.cointype {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.common.trailer {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r.specific {-height 17 -radix unsigned}} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/i_slc_data_r
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_slc_data_v
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int2_slc_data_v
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_slc_data_r
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int2_slc_data_r
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_cde_data_r
add wave -noupdate -group slc_CDE_4 -radix unsigned -childformat {{/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc3_posz -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc2_posz -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc1_posz -radix unsigned} {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc0_posz -radix unsigned}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc3_posz {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc2_posz {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc1_posz {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r.rpc0_posz {-height 17 -radix unsigned}} /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/barrel_r
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/dv_bus
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/rpc_z_a
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_chamb_ieta
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/slc_posphi
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_phimod_abs_pl
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_abs_dv
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_uCM2pl_r
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/clk
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/rst
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/ena
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_phicenter
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_posphi
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/i_dv
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phicenter
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_posphi
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_s
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_pl
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_posphi_pl_dv
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix decimal /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/int_phimod_dv
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_phimod_abs
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_abs_dv
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_phimod
add wave -noupdate -group slc_CDE_4 -group slc_CDE_4_phimod -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/PHIMOID_EN/B_GEN/phimod/o_dv
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/int_phimod_pl
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_cde_data_v
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_pl_phimod
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_pl_phimod_dv
add wave -noupdate -group slc_CDE_4 -radix unsigned /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE_TH/SLC_CDE/o_ucm2pl_v
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/g_NUM_RPC_LAYERS
add wave -noupdate -expand -group slc_vp_2_slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/g_DEBUG_TYPE
add wave -noupdate -expand -group slc_vp_2_slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/g_MAIN_DIV_IPR2_ENABLE
add wave -noupdate -expand -group slc_vp_2_slope /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/g_MAIN_DIV_SEL
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rst
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/ena
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_rpc_rad_a
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_cointype
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_v
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_valid
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc3_posz -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc2_posz -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc1_posz -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc0_posz -radix decimal}} -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc3_posz {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc2_posz {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc1_posz {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r.rpc0_posz {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/coin
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/num_h_i
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) -radix decimal}} -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/set_data_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(0) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(3) -radix decimal}} -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(0) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy(3) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zy_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(3) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(0) -radix decimal}} -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(3) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/mult_zz_dv
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_INFER_DSP
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_OPERATION
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_IN_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_OUT_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_IN_DEFAULT_VAL
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_A_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_B_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_C_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_in_D_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_OUT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_MAIN_MATH_MODE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/OPERAND_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/OPERAND_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/OPERAND_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/OPERAND_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/OPERAND_O_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/g_RESULT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/TOTAL_MUL_LATENCY
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/clk
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/rst
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/i_in_A
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/i_in_B
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/i_in_C
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/i_in_D
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/i_dv
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/mul_in_pipe_A
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/mul_in_pipe_B
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/mul_in_pipe_C
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/mul_in_pipe_D
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/pl_transfer_A
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/pl_transfer_B
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/pl_transfer_C
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/pl_transfer_D
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/mul_output_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/valid_signal_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/dv_pl_transfer
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/int_Result_sc
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/MATH_MODE/int_Result_s
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/o_result
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sum_z /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SUM_Z_ENT/o_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Coral -itemcolor Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z
add wave -noupdate -expand -group slc_vp_2_slope -color Coral -itemcolor Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Coral -itemcolor Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y
add wave -noupdate -expand -group slc_vp_2_slope -color Coral -itemcolor Orange -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y_sc
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Goldenrod -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_1
add wave -noupdate -expand -group slc_vp_2_slope -color Goldenrod -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_1_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Goldenrod -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_2
add wave -noupdate -expand -group slc_vp_2_slope -color Goldenrod -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_2_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_sc
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bnom_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/clk
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz_dv
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_INFER_DSP
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_OPERATION
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_IN_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_OUT_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_IN_DEFAULT_VAL
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_A_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_B_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_C_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_in_D_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_OUT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_MAIN_MATH_MODE
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/OPERAND_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/OPERAND_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/OPERAND_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/OPERAND_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/OPERAND_O_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/g_RESULT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -group gens /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/TOTAL_MUL_LATENCY
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/clk
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/rst
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/i_in_A
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/i_in_B
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/i_in_C
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/i_in_D
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/i_dv
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/mul_in_pipe_A
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/mul_in_pipe_B
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/mul_in_pipe_C
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/mul_in_pipe_D
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/pl_transfer_A
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/pl_transfer_B
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/pl_transfer_C
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/pl_transfer_D
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/mul_output_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/valid_signal_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/dv_pl_transfer
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/int_Result_sc
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/MATH_MODE/int_Result_s
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -color Coral /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/o_result
add wave -noupdate -expand -group slc_vp_2_slope -group VU_math_sqr_zz -color Coral /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/SQR_ZZ_ENT/o_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_zz
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_zz_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bden
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bden_dv
add wave -noupdate -expand -group slc_vp_2_slope -group main_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tvalid
add wave -noupdate -expand -group slc_vp_2_slope -group main_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tdata
add wave -noupdate -expand -group slc_vp_2_slope -group main_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tdata_q
add wave -noupdate -expand -group slc_vp_2_slope -group main_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/div_dout_tdata_r
add wave -noupdate -expand -group slc_vp_2_slope -group main_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_sim
add wave -noupdate -expand -group slc_vp_2_slope -group main_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_sim_dv
add wave -noupdate -expand -group slc_vp_2_slope -group main_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_ipr2
add wave -noupdate -expand -group slc_vp_2_slope -group main_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_ipr2_dv
add wave -noupdate -expand -group slc_vp_2_slope -group main_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_vu
add wave -noupdate -expand -group slc_vp_2_slope -group main_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_vu_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/bdiv_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_pl
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z_pl_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_INFER_DSP
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_OPERATION
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_IN_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_OUT_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_IN_DEFAULT_VAL
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_A_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_B_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_C_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_in_D_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_OUT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/OPERAND_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/OPERAND_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/OPERAND_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/OPERAND_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/OPERAND_O_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_RESULT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/TOTAL_MUL_LATENCY
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -group gen /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/g_MAIN_MATH_MODE
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/clk
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/rst
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/i_in_A
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/i_in_B
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/i_in_C
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/i_in_D
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/i_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/mul_in_pipe_A
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/mul_in_pipe_B
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/mul_in_pipe_C
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/mul_in_pipe_D
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/valid_signal_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/int_Result_sc
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/div_nom
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/div_nom_sc
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/div_den
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/div_out
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/zeros
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/aux_sums
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/aux_sum
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/MATH_MODE/int_Result_u
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/mul_output_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/o_result
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -expand -group ez_vu_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EZN_DIV_SIM/DIV_e_z_ent/o_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_aux
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_aux_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tvalid
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tdata
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tdata_q
add wave -noupdate -expand -group slc_vp_2_slope -group Ez_div -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dout_tdata_r
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_pl
add wave -noupdate -expand -group slc_vp_2_slope -color Cyan -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z_pl_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_INFER_DSP
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_OPERATION
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_IN_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_OUT_PIPE_STAGES
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_IN_DEFAULT_VAL
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_A_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_B_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_C_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_in_D_TYPE
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_MAIN_MATH_MODE
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_OUT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/OPERAND_A_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/OPERAND_B_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/OPERAND_C_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/OPERAND_D_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/OPERAND_O_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/g_RESULT_WIDTH
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -group gen -radix unsigned /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/TOTAL_MUL_LATENCY
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/clk
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/rst
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/i_in_A
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/i_in_B
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/i_in_C
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/i_in_D
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/i_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/o_result
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/o_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/mul_in_pipe_A
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/mul_in_pipe_B
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/mul_in_pipe_C
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/mul_in_pipe_D
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/mul_output_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/valid_signal_pipe
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix binary /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/div_nom
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/zeros
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/div_nom_sc
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/div_den
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix binary -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(12) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(11) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(10) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(9) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(8) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(7) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(6) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(5) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(4) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(3) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(2) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(1) -radix binary} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(0) -radix binary}} -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(12) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(11) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(10) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(9) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(8) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(7) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(6) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(5) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(4) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(3) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(2) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(1) {-height 17 -radix binary} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums(0) {-height 17 -radix binary}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sums
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix hexadecimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/aux_sum
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/int_Result_sc
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -group ey_vu_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/EYN_DIV_SIM/DIV_e_y_ent/MATH_MODE/div_out
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_aux
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_aux_dv
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tvalid
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tdata
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tdata_q
add wave -noupdate -expand -group slc_vp_2_slope -group Ey_div -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dout_tdata_r
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_dv
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_pl
add wave -noupdate -expand -group slc_vp_2_slope -color Magenta -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_pl_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_off
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_off_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope_dv
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_offset
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_slope
add wave -noupdate -expand -group slc_vp_2_slope -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_data_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2390146991 fs} 0}
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
WaveRestoreZoom {2315759215 fs} {2563040985 fs}
