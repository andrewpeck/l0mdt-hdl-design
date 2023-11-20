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
add wave -noupdate -group TB /ucm_tb/i_slc_data_mainA_av
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
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/prepro2ctrl_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/csw_ctrl_dv
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/csw_main_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/csw_main_out_dv
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/slc_endcap_ar
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cpam_in_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cpam_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/csw_control_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/pam_CSW_control
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/proc_info_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cvp_in_en
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cvp_loc_rst
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/uCM2hps_data
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cde_chamber_z_org_bus
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/cvp_chamber_z_org_bus
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/phicenter
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/aux_uCM2hps_inn_r
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_inn_ar
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_mid_ar
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_out_ar
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_ext_ar
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2pl_ar
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/int_uCM2pl_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_inn_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_mid_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2tar_ext_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_inn_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_mid_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_out_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2hps_ext_av
add wave -noupdate -group UCM /ucm_tb/UCM_DUT/o_uCM2pl_av
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
add wave -noupdate -group SLC_CTRL -color Orange /ucm_tb/UCM_DUT/SLC_CTRL/i_slc_data_av
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
add wave -noupdate -group SLC_CTRL -color Orange /ucm_tb/UCM_DUT/SLC_CTRL/o_data_av
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
add wave -noupdate -group PAM_CTRL -radix decimal /ucm_tb/UCM_DUT/PAM_CTRL/i_data_av
add wave -noupdate -group PAM_CTRL -radix decimal -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2) -radix decimal -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).muid -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).cointype -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).poseta -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).phimod -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).specific -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).data_valid -radix decimal}}} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(1) -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(0) -radix decimal}} -expand -subitemconfig {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2) {-height 17 -radix decimal -childformat {{/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).muid -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).cointype -radix unsigned} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).poseta -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).phimod -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).specific -radix decimal} {/ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).data_valid -radix decimal}} -expand} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).muid {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).cointype {-height 17 -radix unsigned} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).poseta {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).phimod {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).specific {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(2).data_valid {-height 17 -radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(1) {-radix decimal} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar(0) {-radix decimal}} /ucm_tb/UCM_DUT/PAM_CTRL/i_data_ar
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/data2pamctrl_av
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/data2pamctrl_ar
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/pam_CSW_control
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/pam_CSW_control_dv
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/o_data_av
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/o_proc_info_av
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/o_cvp_rst
add wave -noupdate -group PAM_CTRL /ucm_tb/UCM_DUT/PAM_CTRL/o_cvp_ctrl
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/g_PAM_CTRL_PL
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/g_PAM_INFO_PL
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/g_CVP_PL
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/clk
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/rst
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/ena
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/i_num_cand
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/i_pam_update
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/o_pam_ctrl
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/o_pam_ctrl_dv
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/o_proc_info_av
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/o_cvp_rst
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/o_cvp_ctrl
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/int_pam_ctrl_ar
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/int_proc_info_ar
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/int_pam_ctrl_av
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/o_pam_ctrl_av
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/int_proc_info_av
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/int_cvp_rst_v
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/int_cvp_ctrl_v
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/ch_busy
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/proc_info_ar
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/o_proc_info_ar
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/ch_count_av
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/processing
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/processed_s
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/buff_pam_ctrl_ar
add wave -noupdate -expand -group PAM_CTRL_MAIN /ucm_tb/UCM_DUT/PAM_CTRL/PAM_CTRL/proc_info_init
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1413818503 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
configure wave -valuecolwidth 170
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
WaveRestoreZoom {0 fs} {5250 ns}
