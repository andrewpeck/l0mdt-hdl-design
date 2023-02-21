onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group DUT /ult_tb/ULT/clock_and_control
add wave -noupdate -group DUT /ult_tb/ULT/ttc_commands
add wave -noupdate -group DUT /ult_tb/ULT/h2s_ctrl
add wave -noupdate -group DUT /ult_tb/ULT/h2s_mon
add wave -noupdate -group DUT /ult_tb/ULT/tar_ctrl
add wave -noupdate -group DUT /ult_tb/ULT/tar_mon
add wave -noupdate -group DUT /ult_tb/ULT/mtc_ctrl
add wave -noupdate -group DUT /ult_tb/ULT/mtc_mon
add wave -noupdate -group DUT /ult_tb/ULT/ucm_ctrl
add wave -noupdate -group DUT /ult_tb/ULT/ucm_mon
add wave -noupdate -group DUT /ult_tb/ULT/daq_ctrl
add wave -noupdate -group DUT /ult_tb/ULT/daq_mon
add wave -noupdate -group DUT /ult_tb/ULT/tf_ctrl
add wave -noupdate -group DUT /ult_tb/ULT/tf_mon
add wave -noupdate -group DUT /ult_tb/ULT/mpl_ctrl
add wave -noupdate -group DUT /ult_tb/ULT/mpl_mon
add wave -noupdate -group DUT /ult_tb/ULT/i_inner_tdc_hits
add wave -noupdate -group DUT /ult_tb/ULT/i_middle_tdc_hits
add wave -noupdate -group DUT /ult_tb/ULT/i_outer_tdc_hits
add wave -noupdate -group DUT /ult_tb/ULT/i_extra_tdc_hits
add wave -noupdate -group DUT /ult_tb/ULT/i_main_primary_slc
add wave -noupdate -group DUT /ult_tb/ULT/i_main_secondary_slc
add wave -noupdate -group DUT /ult_tb/ULT/i_plus_neighbor_slc
add wave -noupdate -group DUT /ult_tb/ULT/i_minus_neighbor_slc
add wave -noupdate -group DUT /ult_tb/ULT/i_plus_neighbor_segments
add wave -noupdate -group DUT /ult_tb/ULT/i_minus_neighbor_segments
add wave -noupdate -group DUT /ult_tb/ULT/o_daq_streams
add wave -noupdate -group DUT /ult_tb/ULT/o_plus_neighbor_segments
add wave -noupdate -group DUT /ult_tb/ULT/o_minus_neighbor_segments
add wave -noupdate -group DUT /ult_tb/ULT/o_MTC
add wave -noupdate -group DUT /ult_tb/ULT/o_NSP
add wave -noupdate -group DUT /ult_tb/ULT/sump
add wave -noupdate -group DUT /ult_tb/ULT/ucm2pl_av
add wave -noupdate -group DUT /ult_tb/ULT/inn_segments_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/mid_segments_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/out_segments_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/ext_segments_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/inner_slc_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/middle_slc_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/outer_slc_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/extra_slc_to_pt
add wave -noupdate -group DUT /ult_tb/ULT/pl2pt_av
add wave -noupdate -group DUT /ult_tb/ULT/pl2mtc_av
add wave -noupdate -group DUT /ult_tb/ULT/pt2mtc_av
add wave -noupdate -divider UCM
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/clk
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/rst
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/glob_en
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/ttc_commands
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/ctrl
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/mon
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/local_en
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/local_rst
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/prepro2ctrl_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/ucm_prepro_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_main_in_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_ar
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/slc_endcap_ar
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cde_in_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cpam_in_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cpam_out_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/uCM2pl_av
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/csw_control
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/pam_CSW_control
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/proc_info
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cvp_in_en
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cvp_loc_rst
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cde_phimod
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/uCM2hps_data
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cde_chamber_z_org_bus
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/cvp_chamber_z_org_bus
add wave -noupdate -group UCM_top /ult_tb/ULT/logic_gen/UCM/UCM/UCM/phicenter
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/glob_en
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_chamber_z_org_bus
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_phimod
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/barrel_r
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_a
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/new_chamb_ieta_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_z_pos_dv
add wave -noupdate -expand -group SLC_VP_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group SLOPE_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/clk
add wave -noupdate -expand -group SLOPE_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rst
add wave -noupdate -expand -group SLOPE_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/glob_en
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_cointype
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_v
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/i_data_valid
add wave -noupdate -expand -group SLOPE_2 -color Orange -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_offset
add wave -noupdate -expand -group SLOPE_2 -color Orange -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_slope
add wave -noupdate -expand -group SLOPE_2 -color Orange -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/o_data_valid
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/barrel_r
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/coin
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rpc_a
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/rad_a
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_z
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/e_y_2
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_offset
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_y
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_z
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zy
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sum_zz
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/sqr_sum_z
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_nom
add wave -noupdate -expand -group SLOPE_2 -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(0) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(3) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(4) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(0) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(1) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(2) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(3) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den(4) {-radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/b_den
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/int_slope_2
add wave -noupdate -expand -group SLOPE_2 -radix unsigned /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/s_e_z
add wave -noupdate -expand -group SLOPE_2 -radix unsigned -childformat {{/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(16) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(15) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(14) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(13) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(12) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(11) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(10) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(9) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(8) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(7) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(6) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(5) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(4) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(3) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(2) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(1) -radix unsigned} {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(0) -radix unsigned}} -expand -subitemconfig {/ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(16) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(15) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(14) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(13) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(12) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(11) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(10) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(9) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(8) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(7) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(6) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(5) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(4) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(3) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(2) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(1) {-radix unsigned} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain(0) {-radix unsigned}} /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/dv_chain
add wave -noupdate -expand -group SLOPE_2 /ult_tb/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/BARREL/SLOPE_CALC/num_h
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {46228904078 fs} 0} {{Cursor 2} {1898437500 fs} 0}
quietly wave cursor active 2
configure wave -namecolwidth 209
configure wave -valuecolwidth 279
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
WaveRestoreZoom {1870661967 fs} {1970461881 fs}
