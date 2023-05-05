onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT_TOP /ult_tb/ULT/DUMMY
add wave -noupdate -group ULT_TOP /ult_tb/ULT/clock_and_control
add wave -noupdate -group ULT_TOP /ult_tb/ULT/ttc_commands
add wave -noupdate -group ULT_TOP /ult_tb/ULT/h2s_ctrl
add wave -noupdate -group ULT_TOP /ult_tb/ULT/h2s_mon
add wave -noupdate -group ULT_TOP /ult_tb/ULT/tar_ctrl
add wave -noupdate -group ULT_TOP /ult_tb/ULT/tar_mon
add wave -noupdate -group ULT_TOP /ult_tb/ULT/mtc_ctrl
add wave -noupdate -group ULT_TOP /ult_tb/ULT/mtc_mon
add wave -noupdate -group ULT_TOP /ult_tb/ULT/ucm_ctrl
add wave -noupdate -group ULT_TOP /ult_tb/ULT/ucm_mon
add wave -noupdate -group ULT_TOP /ult_tb/ULT/daq_ctrl
add wave -noupdate -group ULT_TOP /ult_tb/ULT/daq_mon
add wave -noupdate -group ULT_TOP /ult_tb/ULT/tf_ctrl
add wave -noupdate -group ULT_TOP /ult_tb/ULT/tf_mon
add wave -noupdate -group ULT_TOP /ult_tb/ULT/mpl_ctrl
add wave -noupdate -group ULT_TOP /ult_tb/ULT/mpl_mon
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_inner_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_middle_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_outer_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_extra_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_inner_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_middle_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_outer_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_extra_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_main_primary_slc
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_main_secondary_slc
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_plus_neighbor_slc
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_minus_neighbor_slc
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_plus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tb/ULT/i_minus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tb/ULT/o_daq_streams
add wave -noupdate -group ULT_TOP /ult_tb/ULT/o_plus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tb/ULT/o_minus_neighbor_segments
add wave -noupdate -group ULT_TOP /ult_tb/ULT/o_MTC
add wave -noupdate -group ULT_TOP /ult_tb/ULT/o_NSP
add wave -noupdate -group ULT_TOP /ult_tb/ULT/sump
add wave -noupdate -group ULT_TOP /ult_tb/ULT/inner_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tb/ULT/middle_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tb/ULT/outer_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tb/ULT/extra_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tb/ULT/ucm2pl_av
add wave -noupdate -group ULT_TOP /ult_tb/ULT/inner_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/middle_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/outer_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/extra_tar_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/inner_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/middle_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/outer_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/extra_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tb/ULT/inn_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/mid_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/out_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/ext_segments_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/inner_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/middle_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/outer_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/extra_slc_to_pt
add wave -noupdate -group ULT_TOP /ult_tb/ULT/pl2pt_av
add wave -noupdate -group ULT_TOP /ult_tb/ULT/pl2mtc_av
add wave -noupdate -group ULT_TOP /ult_tb/ULT/pt2mtc_av
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/clk
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/rst
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/glob_en
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/ttc_commands
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/ctrl
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/mon
add wave -noupdate -expand -group UCM_TOP -group port -color {Medium Violet Red} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -expand -group UCM_TOP -group port -color {Medium Violet Red} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -expand -group UCM_TOP -group port -color {Medium Violet Red} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -expand -group UCM_TOP -group port -color {Medium Violet Red} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -expand -group UCM_TOP -group port /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -expand -group UCM_TOP -group port -color Coral /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/prepro2ctrl_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/ucm_prepro_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_main_in_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_ar
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/slc_endcap_ar
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cde_in_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_av
add wave -noupdate -expand -group UCM_TOP -color Goldenrod /ult_tb/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar
add wave -noupdate -expand -group UCM_TOP -color Cyan /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cpam_in_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cpam_out_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/uCM2pl_av
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_control
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/pam_CSW_control
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/proc_info
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cvp_in_en
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cvp_loc_rst
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cvp_phimod
add wave -noupdate -expand -group UCM_TOP /ult_tb/ULT/logic_gen/UCM/UCM/UCM/uCM2hps_data
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/g_STATION
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/g_RESOLUTION_SCALE
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/g_INPUT_WIDTH
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/clk
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/rst
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/CHAMBER_Z0_CALC_WR
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/CHAMBER_Z0_CALC_RD
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/i_z
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/i_z_dv
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/o_ieta
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/o_ieta_dv
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn -radix decimal -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(0) -radix decimal} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(1) -radix decimal} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(2) -radix decimal} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(3) -radix decimal} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(4) -radix decimal} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(5) -radix decimal} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(6) -radix decimal} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(7) -radix decimal}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(0) {-height 17 -radix decimal} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(1) {-height 17 -radix decimal} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(2) {-height 17 -radix decimal} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(3) {-height 17 -radix decimal} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(4) {-height 17 -radix decimal} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(5) {-height 17 -radix decimal} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(6) {-height 17 -radix decimal} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a(7) {-height 17 -radix decimal}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -group ieta_inn /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/wr_addr
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/clk
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rst
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/glob_en
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_v
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_v
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_r
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_r
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_null
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/dv_bus
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/barrel_r
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rpc_z_a
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/clk
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/rst
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/glob_en
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/CHAMBER_Z0_CTRL_ARRAY
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/CHAMBER_Z0_MON_ARRAY
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/i_slc_data_v
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/o_cde_data_v
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/i_slc_data_r
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/o_cde_data_r
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/o_cde_data_null
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/barrel_r
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/dv_bus
add wave -noupdate -expand -group UCM_TOP -group CDE_1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(1)/SLC_CDE/rpc_z_a
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/clk
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/rst
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/CHAMBER_Z0_CALC_WR
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/CHAMBER_Z0_CALC_RD
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/i_z
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/i_z_dv
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/o_ieta
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/o_ieta_dv
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/chamber_z_org_a
add wave -noupdate -expand -group UCM_TOP -group ieta_00 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/B_GEN/IETA_00/wr_addr
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/CHAMBER_Z0_CTRL_ARRAY
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/CHAMBER_Z0_MON_ARRAY
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Cyan /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Cyan /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Cyan /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/g_PIPELINE
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/i_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/i_posphi
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/o_phimod
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff(0) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff(0) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/sphi_buff
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phicenter
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phicenter_Default
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group phimod -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/reschanger
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_cointype
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/coin
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(3) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(3) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_2
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_offset
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_sum_z
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_nom
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope_2
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/num_h
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_offset
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_slope
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_data_valid
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Coral -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Coral -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Coral /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_chamb_ieta
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0) -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(13) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(12) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(11) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(10) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(9) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(8) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(7) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(6) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(5) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(4) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(3) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(0) -radix unsigned}}} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3) -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(13) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(12) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(11) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(10) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(9) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(8) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(7) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(6) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(5) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(4) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(3) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(0) -radix unsigned}}} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(4) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(5) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(6) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(7) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0) {-height 17 -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(13) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(12) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(11) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(10) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(9) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(8) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(7) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(6) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(5) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(4) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(3) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(0) -radix unsigned}}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(13) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(12) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(11) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(10) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(9) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(8) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(7) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(6) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(5) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(4) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(3) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(0)(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3) {-height 17 -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(13) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(12) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(11) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(10) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(9) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(8) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(7) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(6) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(5) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(4) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(3) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(0) -radix unsigned}}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(13) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(12) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(11) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(10) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(9) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(8) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(7) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(6) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(5) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(4) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(3) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(3)(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(4) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(5) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(6) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y(7) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamb_h
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/scaler
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/resolution_change
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_INN -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_chamb_ieta
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/chamber_center_Y
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/chamb_h
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/scaler
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/resolution_change
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_chamb_ieta
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/chamber_center_Y
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/chamb_h
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/scaler
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/resolution_change
add wave -noupdate -expand -group UCM_TOP -group CVP2 -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(3) -radix decimal}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(3) {-height 17 -radix decimal}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/CHAMBER_Z0_CALC_WR
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/CHAMBER_Z0_CALC_RD
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/i_z
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/i_z_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/o_ieta
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/o_ieta_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/chamber_z_org_a
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_INN/wr_addr
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/CHAMBER_Z0_CALC_WR
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/CHAMBER_Z0_CALC_RD
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/i_z
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/i_z_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/o_ieta
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/o_ieta_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/chamber_z_org_a
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_MID/wr_addr
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/clk
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/CHAMBER_Z0_CALC_WR
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/CHAMBER_Z0_CALC_RD
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/i_z
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/i_z_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/o_ieta
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/o_ieta_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(3) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(4) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(5) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(6) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(7) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(3) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(4) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(5) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(6) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a(7) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/chamber_z_org_a
add wave -noupdate -expand -group UCM_TOP -group CVP2 -group IETA_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/IETA_OUT/wr_addr
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Cyan /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group UCM_TOP -group CVP2 -color Cyan /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_phimod
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group UCM_TOP -group CVP2 -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_TOP -group CVP2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/clk
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/rst
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/o_phimod
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/offset
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/slope
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/o_phimod
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/barrel_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/i_cointype
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/i_data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/barrel_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/coin
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(3) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a(3) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rpc_a
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(1) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(2) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a(3) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/rad_a
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/int_offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/dv_chain
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/num_h
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_y(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_y(1) -radix unsigned}} -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_y(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_y(1) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_y
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_z(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_z(1) -radix unsigned}} -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_z(0) {-height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_z(1) {-height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_zy
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sum_zz
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/sqr_sum_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -color Cyan -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/b_nom
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -color Cyan -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/b_den
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/e_y
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -color Brown -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/int_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -color Brown -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/e_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -color Brown -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/s_e_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/e_y_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/o_data_valid
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/o_offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/int_slope_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group slope -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/SLOPE_CALC/o_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_INPUT_RESOLUTION
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_OUTPUT_RESOLUTION
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/g_OUTPUT_WIDTH
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_chamb_ieta
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamber_center_Y
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/chamb_h
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/scaler
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/int_size
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand -group Z_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(0)/Z_CALC_IF/Z_CALC/resolution_change
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_chamb_ieta
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/chamber_center_Y
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID -radix decimal /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_MID /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(1)/Z_CALC_IF/Z_CALC/resolution_change
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/g_STATION_RADIUS
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_chamb_ieta
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/o_vec_z_pos
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/o_vec_z_pos_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/chamber_center_Y
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/vec_pos
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group Z_OUT /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/Z_CALC_LOOP(2)/Z_CALC_IF/Z_CALC/resolution_change
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -color Orange -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(3) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(0) {-color Orange -height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(1) {-color Orange -height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(2) {-color Orange -height 17 -radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array(3) {-color Orange -height 17 -radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/g_STATION
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/g_RESOLUTION_SCALE
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/g_INPUT_WIDTH
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/CHAMBER_Z0_CALC_WR
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/CHAMBER_Z0_CALC_RD
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/i_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/i_z_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/o_ieta
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/o_ieta_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/chamber_z_org_a
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -group IETA_INN /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/BARREL/IETA_INN/wr_addr
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 -expand /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group UCM_TOP -expand -group CVP0 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/ucm2hps_ar
add wave -noupdate -group tar /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/clk
add wave -noupdate -group tar /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/rst
add wave -noupdate -group tar /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/glob_en
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_SIMULATION
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_wr
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_wr_data
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_rd
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_rd_data
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_empty
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_empty_next
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_full
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_full_next
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_used
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_delay
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/mem
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/mem_dv
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/case_options
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/wr_index
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/rd_index
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/int_wr_data
add wave -noupdate -group tar -expand -group PL_RB /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/used_data
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/i_tdc_hits
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/i_tar_hits
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/o_tdc_hits
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/o_tar_hits
add wave -noupdate -group tar -expand -group TAR_REMAP -expand /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/i_tdc_hits_r
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/o_tar_hits_r
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml1_tubes
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml1_layer
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml2_tubes
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml2_layer
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/csm_offset_mem
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_offset_mem
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/csm_offset
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_offset
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_layer
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_tube
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/full_time
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/dv_pl
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tb/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/csm_pl
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {CVP2_init {1895312500 fs} 1} {{Cursor 2} {5695312500 fs} 1} {{Cursor 3} {8174570808 fs} 0}
quietly wave cursor active 3
configure wave -namecolwidth 238
configure wave -valuecolwidth 218
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
WaveRestoreZoom {8159149360 fs} {8200505297 fs}
