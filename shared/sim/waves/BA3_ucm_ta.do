onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TB /ucm_tb/enable_slc
add wave -noupdate -group TB /ucm_tb/axi_rst
add wave -noupdate -group TB /ucm_tb/clk_axi
add wave -noupdate -group TB /ucm_tb/clk_axi_cnt
add wave -noupdate -group TB /ucm_tb/clk_time
add wave -noupdate -group TB /ucm_tb/tb_curr_time
add wave -noupdate -group TB /ucm_tb/clk_tdc_time
add wave -noupdate -group TB /ucm_tb/tb_curr_tdc_time
add wave -noupdate -group TB /ucm_tb/clk_sim_time
add wave -noupdate -group TB /ucm_tb/tb_curr_sim_time
add wave -noupdate -group TB /ucm_tb/clk
add wave -noupdate -group TB /ucm_tb/rst
add wave -noupdate -group TB /ucm_tb/glob_en
add wave -noupdate -group TB /ucm_tb/bx
add wave -noupdate -group TB /ucm_tb/ttc_commands
add wave -noupdate -group TB /ucm_tb/ctrl_r
add wave -noupdate -group TB /ucm_tb/mon_r
add wave -noupdate -group TB /ucm_tb/ctrl_v
add wave -noupdate -group TB /ucm_tb/mon_v
add wave -noupdate -group TB -expand /ucm_tb/i_slc_data_mainA_av
add wave -noupdate -group TB /ucm_tb/i_slc_data_mainB_av
add wave -noupdate -group TB /ucm_tb/i_slc_data_neighborA_v
add wave -noupdate -group TB /ucm_tb/i_slc_data_neighborB_v
add wave -noupdate -group TB /ucm_tb/o_uCM2tar_inn_av
add wave -noupdate -group TB /ucm_tb/o_uCM2tar_mid_av
add wave -noupdate -group TB /ucm_tb/o_uCM2tar_out_av
add wave -noupdate -group TB /ucm_tb/o_uCM2tar_ext_av
add wave -noupdate -group TB /ucm_tb/o_uCM2hps_inn_av
add wave -noupdate -group TB /ucm_tb/o_uCM2hps_mid_av
add wave -noupdate -group TB /ucm_tb/o_uCM2hps_out_av
add wave -noupdate -group TB /ucm_tb/o_uCM2hps_ext_av
add wave -noupdate -group TB /ucm_tb/o_uCM2pl_av
add wave -noupdate -group TB /ucm_tb/slc_file_ok
add wave -noupdate -group TB /ucm_tb/slc_file_ts
add wave -noupdate -group TB /ucm_tb/slc_event_ai
add wave -noupdate -group TB /ucm_tb/files_str
add wave -noupdate -group TB /ucm_tb/alias_offset_cvp
add wave -noupdate -group TB /ucm_tb/alias_slope_cvp
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/IN_SLC_FILE
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/g_verbose
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/clk
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/rst
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/enable
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/tb_curr_tdc_time
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/temp_slc_rx_vt
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_element_temp
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_element
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/event_element_temp
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/event_element
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_event_r
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_new_event
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/event_main_prim_fifo
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_event_ai
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_main_prim_fifo
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_main_seco_fifo
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_neig_plus_fifo
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_neig_minu_fifo
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_main_prim_counts
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_main_seco_counts
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_neig_plus_counts
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/slc_neig_minu_counts
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/csv_file
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/file_open
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/file_ts
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/SLC_RX_LEN
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/o_file_ok
add wave -noupdate -group TB_SLC_IN -expand /ucm_tb/CSV_SLC_IN/o_file_ts
add wave -noupdate -group TB_SLC_IN -expand /ucm_tb/CSV_SLC_IN/o_slc_event_ai
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/o_main_primary_slc
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/o_main_secondary_slc
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/o_plus_neighbor_slc
add wave -noupdate -group TB_SLC_IN /ucm_tb/CSV_SLC_IN/o_minus_neighbor_slc
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/clk
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/rst
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/glob_en
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/ttc_commands
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/ctrl_v
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/mon_v
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/i_slc_data_mainA_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/i_slc_data_mainB_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/i_slc_data_neighborA_v
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/i_slc_data_neighborB_v
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/local_en
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/local_rst
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/num_cand
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/pam_update
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/i_slc_data_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/csw_main_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/csw_main_out_dv
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/slc_endcap_ar
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cpam_in_av
add wave -noupdate -group UCM -color {Medium Violet Red} /ucm_tb/UCM_DUT/cvp_chamber_z_org_bus
add wave -noupdate -group UCM -color {Medium Violet Red} /ucm_tb/UCM_DUT/cvp_in_en
add wave -noupdate -group UCM -color {Medium Violet Red} /ucm_tb/UCM_DUT/cvp_loc_rst
add wave -noupdate -group UCM -color {Medium Violet Red} /ucm_tb/UCM_DUT/cpam_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/uCM2hps_data
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cde_chamber_z_org_bus
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/phicenter
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/int_uCM2pl_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_inn_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_mid_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_ext_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_inn_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_mid_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_ext_av
add wave -noupdate -group UCM -expand /ucm_tb/UCM_DUT/o_uCM2pl_av
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/clk
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/rst
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/glob_en
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/ctrl_v
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/mon_v
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/o_phicenter
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/o_cde_chamber_z_org_av
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/o_cvp_chamber_z_org_av
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/i_freeze
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/o_freeze
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/o_local_en
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/o_local_rst
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/ctrl_r
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/mon_r
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/local_rst
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/local_en
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/int_en
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/int_rst
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/int_freeze
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/apb_clk_cnt
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/axi_cnt_reset
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/axi_rep_clk
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/phicenter
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/PHI_CTRL
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/PHI_MON
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/cde_ch_z0_org
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/cde_z0_ctrl_r
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/cde_z0_mon_r
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/cvp_ch_z0_org
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/cvp_z0_ctrl_r
add wave -noupdate -group SUPER /ucm_tb/UCM_DUT/UCM_SUPERVISOR/cvp_z0_mon_r
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/clk
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/rst
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/ena
add wave -noupdate -group SLC_CTRL -color Orange -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_av(4) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_av(3) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_av(2) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_av(1) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_av(0) {-color Orange -height 17}} /ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_av
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/clk
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/rst
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/ena
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/i_data
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/alg_status
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/i_data_ar
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/data_ar
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/input_valids
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_csw_ctrl_ar
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_csw_ctrl_av
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_csw_ctrl_dv
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_num_cand
add wave -noupdate -group SLC_CTRL -group main /ucm_tb/UCM_DUT/SLC_CTRL/MAIN_CTRL/o_pam_update
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_ar
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/prepro2ctrl_av
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/csw_ctrl_av
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/csw_ctrl_dv
add wave -noupdate -group SLC_CTRL -color Orange /ucm_tb/UCM_DUT/SLC_CTRL/csw_main_in_av
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/csw_main_in_adv
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/csw_main_in_dv
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/clk
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/rst
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/glob_en
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/i_control_av
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/i_data_av
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/i_dv
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/control_ar
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/o_data_av
add wave -noupdate -group SLC_CTRL -group CTRL_CSW /ucm_tb/UCM_DUT/SLC_CTRL/SLC_CSW/o_dv
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/o_num_cand
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/o_pam_update
add wave -noupdate -group SLC_CTRL -color Orange -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_CTRL/o_data_av(4) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/o_data_av(3) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/o_data_av(2) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/o_data_av(1) {-color Orange -height 17} /ucm_tb/UCM_DUT/SLC_CTRL/o_data_av(0) {-color Orange -height 17}} /ucm_tb/UCM_DUT/SLC_CTRL/o_data_av
add wave -noupdate -group SLC_CTRL /ucm_tb/UCM_DUT/SLC_CTRL/o_dv
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/bypass
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/phimod_ena
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/clk
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/rst
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/ena
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_phicenter
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_chamber_z_org_bus
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_slc_data_v
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/i_slc_data_r
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_slc_data_v
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int2_slc_data_v
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_slc_data_r
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int2_slc_data_r
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_cde_data_r
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/barrel_r
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/rpc_z_a
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/slc_posphi
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_phimod_abs_pl
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_phimod_pl
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_phimod_pl_dv
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/int_abs_dv
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_uCM2pl_r
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_cde_data_v
add wave -noupdate -group CDE_4 /ucm_tb/UCM_DUT/SLC_CDE_LOOP(4)/SLC_CDE/o_ucm2pl_v
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/clk
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/rst
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/ena
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/i_num_cand
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/i_pam_update
add wave -noupdate -group PAM_CTRL -radix decimal -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/i_data_av(2) -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_av(1) -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_av(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_av(2) {-color Orange -height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_av(1) {-color Orange -height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_av(0) {-color Orange -height 17 -radix decimal}} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_av
add wave -noupdate -group PAM_CTRL -radix decimal -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2) -radix decimal -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).muid -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).cointype -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).poseta -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).phimod -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).specific -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).data_valid -radix decimal}}} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(1) -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(0) -radix decimal}} -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2) {-height 17 -radix decimal -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).muid -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).cointype -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).poseta -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).phimod -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).specific -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).data_valid -radix decimal}} -expand} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).muid {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).cointype {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).poseta {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).phimod {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).specific {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).data_valid {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/data2pamctrl_av
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/data2pamctrl_ar
add wave -noupdate -group PAM_CTRL -expand -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/o_data_av(2) {-color Orange -height 17} /ucm_tb/UCM_DUT/PAM_CTRL/o_data_av(1) {-color Orange -height 17} /ucm_tb/UCM_DUT/PAM_CTRL/o_data_av(0) {-color Orange -height 17}} /ucm_tb/UCM_DUT/PAM_CTRL/o_data_av
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/o_cvp_rst
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/o_cvp_ctrl
add wave -noupdate -group PAM_CTRL_MAIN -expand -group cte /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/g_PAM_CTRL_PL
add wave -noupdate -group PAM_CTRL_MAIN -expand -group cte /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/g_PAM_INFO_PL
add wave -noupdate -group PAM_CTRL_MAIN -expand -group cte /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/g_CVP_PL
add wave -noupdate -group PAM_CTRL_MAIN -expand -group cte -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/eta_lower_lim
add wave -noupdate -group PAM_CTRL_MAIN -expand -group cte -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/eta_upper_lim
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/clk
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/rst
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ena
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_num_cand
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_update
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_av
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2) -radix unsigned -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2).data_valid -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2).poseta -radix unsigned}}} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(1) -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(0) -radix unsigned}} -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2) {-height 17 -radix unsigned -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2).data_valid -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2).poseta -radix unsigned}}} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2).data_valid {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(2).poseta {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(1) {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar(0) {-height 17 -radix unsigned}} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/i_pam_ctrl_ar
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/g_NUM_CHAMBERS
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/g_LOWER_LIM
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/g_UPPER_LIM
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/clk
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/rst
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/ena
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/i_poseta
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/i_dv
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/i_poseta_i
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN -radix binary /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/chamber
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/ch_dv
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/o_min_ch
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/o_max_ch
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/o_num_ch
add wave -noupdate -group PAM_CTRL_MAIN -group ACCEPT2_INN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ACCEPT_FOR_GEN(2)/ETA2CH_FOR_GEN(0)/ST_IF_GEN/ETA2CH_ENT/o_dv
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/max_num(2) -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/max_num(1) -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/max_num(0) -radix unsigned}} -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/max_num(2) {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/max_num(1) {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/max_num(0) {-height 17 -radix unsigned}} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/max_num
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_l_lim_aau
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_u_lim_aau
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_num_aau
add wave -noupdate -group PAM_CTRL_MAIN -radix binary -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2) -radix binary -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(2) -radix binary} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(1) -radix binary} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(0) -radix binary}}} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(1) -radix binary} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(0) -radix binary}} -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2) {-height 17 -radix binary -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(2) -radix binary} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(1) -radix binary} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(0) -radix binary}}} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(2) {-height 17 -radix binary} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(1) {-height 17 -radix binary} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(2)(0) {-height 17 -radix binary} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(1) {-height 17 -radix binary} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av(0) {-height 17 -radix binary}} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_map_av
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/ch_lim_adv
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/main_count
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/num_cand
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/nc_dv
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(3) -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(2) -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(1) -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(0) -radix unsigned}} -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(3) {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(2) {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(1) {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy(0) {-height 17 -radix unsigned}} /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_busy
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_load
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_free
add wave -noupdate -group PAM_CTRL_MAIN -radix unsigned /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/th_next
add wave -noupdate -group PAM_CTRL_MAIN -group PAM_CTRL_MAIN_TH /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/TH_CTRL_FOR_GEN(2)/TH_CTRL/clk
add wave -noupdate -group PAM_CTRL_MAIN -group PAM_CTRL_MAIN_TH /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/TH_CTRL_FOR_GEN(2)/TH_CTRL/rst
add wave -noupdate -group PAM_CTRL_MAIN -group PAM_CTRL_MAIN_TH /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/TH_CTRL_FOR_GEN(2)/TH_CTRL/ena
add wave -noupdate -group PAM_CTRL_MAIN -group PAM_CTRL_MAIN_TH /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/TH_CTRL_FOR_GEN(2)/TH_CTRL/i_main_count_i
add wave -noupdate -group PAM_CTRL_MAIN -group PAM_CTRL_MAIN_TH /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/TH_CTRL_FOR_GEN(2)/TH_CTRL/i_load
add wave -noupdate -group PAM_CTRL_MAIN -group PAM_CTRL_MAIN_TH /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/TH_CTRL_FOR_GEN(2)/TH_CTRL/o_busy
add wave -noupdate -group PAM_CTRL_MAIN -group PAM_CTRL_MAIN_TH /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/TH_CTRL_FOR_GEN(2)/TH_CTRL/time_org
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/pl0_sl_th_au
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/pl0_sl_th_av
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/pl0_odv
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/pam2tar_ar
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/pam2tar_av
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/o_pam2tar_av
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/o_pam2cpl_av
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/o_cvp_rst
add wave -noupdate -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL_CORE/o_cvp_ctrl
add wave -noupdate -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/g_MAX_POSSIBLE_HPS
add wave -noupdate -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/g_NUM_MDT_LAYERS
add wave -noupdate -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/g_NUM_RPC_LAYERS
add wave -noupdate -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -group CVP2 /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ena
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/int_i_data_v
add wave -noupdate -group CVP2 -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(3) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(3) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_av
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_radius_dv
add wave -noupdate -group CVP2 -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_av
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/mdt_radius_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/pl_data_v
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/pl_data_v_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/pl_data_r
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/i_data_r
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/rpc_Z_a
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/offset_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/atan_slope_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/pl_atan_slope
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/pl_atan_slope_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_pos_a
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/vec_pos_a_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/pl_vec_pos_a
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/pl_vec_pos_a_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -group CVP2 -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_NUM_RPC_LAYERS
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_NUM_MDT_LAYERS
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_INPUT_RESOLUTION
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_OUTPUT_WIDTH
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DIV_IP_R2_EN
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DIV_VU_EN
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DIV_SEL
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_DATA_SET_VERSION
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_SLOPE_DIV_IPR2_ENABLE
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/g_off_DIV_IPR2_ENABLE
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/clk
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rst
add wave -noupdate -group cvp2_pc /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/ena
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_cointype
add wave -noupdate -group cvp2_pc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(3) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(3) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_Z_a
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_data_valid
add wave -noupdate -group cvp2_pc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(3) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(3) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_a
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_rpc_R_dv
add wave -noupdate -group cvp2_pc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_a
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/i_mdt_R_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/num_h_i
add wave -noupdate -group cvp2_pc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(0) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(3) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(0) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a(3) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_Z_a
add wave -noupdate -group cvp2_pc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(0) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(3) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(0) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a(3) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/rpc_R_a
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/set_data_dv
add wave -noupdate -group cvp2_pc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(0) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(3) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(0) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy(3) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xy_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/mult_xx_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x_pl1
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_x_pl1_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y_pl1
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_y_pl1_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xy
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xy_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xx
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sum_xx_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSx
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSx_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxx
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxx_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c_red
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_c_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/pl_param_c_red
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/pl_param_c_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxxSy
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxxSy_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSxy
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSxy_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b_red
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/plz_param_b
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/plz_param_b_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxy
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/nSxy_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSy
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/SxSy_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_red
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_red_pl1
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_pl_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_a_sc
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_den_sc
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_sc
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tvalid
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata_q
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dout_tdata_r
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/slope_div_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/param_b_sc
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_den_sc
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_sc
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tvalid
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata_q
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dout_tdata_r
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/off_div_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/pl_mdt_R_a
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/vec_z_pos_dv_a
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/sig_SLC_Z_RPC_LEN
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/scale_slope_nom
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/scale_off_nom
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/scale_Z_nom
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_offset
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_offset_dv
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_slope
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_slope_dv
add wave -noupdate -group cvp2_pc -radix decimal -childformat {{/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos(2) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos(1) -radix decimal} {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos(2) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos(1) {-height 17 -radix decimal} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos(0) {-height 17 -radix decimal}} /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos
add wave -noupdate -group cvp2_pc -radix decimal /ucm_tb/UCM_DUT/SLC_VP_A(2)/SLC_VP/BARREL/PARAM_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group out2cpl /ucm_tb/UCM_DUT/OUT2CPL/clk
add wave -noupdate -expand -group out2cpl /ucm_tb/UCM_DUT/OUT2CPL/rst
add wave -noupdate -expand -group out2cpl /ucm_tb/UCM_DUT/OUT2CPL/ena
add wave -noupdate -expand -group out2cpl /ucm_tb/UCM_DUT/OUT2CPL/i_proc_info_av
add wave -noupdate -expand -group out2cpl /ucm_tb/UCM_DUT/OUT2CPL/i_data_av
add wave -noupdate -expand -group out2cpl -expand /ucm_tb/UCM_DUT/OUT2CPL/i_proc_info_ar
add wave -noupdate -expand -group out2cpl -expand /ucm_tb/UCM_DUT/OUT2CPL/i_data_ar
add wave -noupdate -expand -group out2cpl /ucm_tb/UCM_DUT/OUT2CPL/o_uCM2pl_ar
add wave -noupdate -expand -group out2cpl /ucm_tb/UCM_DUT/OUT2CPL/o_uCM2pl_av
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1432524553 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
configure wave -valuecolwidth 68
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 3125
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1401940751 fs} {1508387453 fs}
