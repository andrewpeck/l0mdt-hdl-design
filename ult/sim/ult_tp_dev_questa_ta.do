onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group ULT_TOP /ult_tp/ULT/DUMMY
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
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inner_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/middle_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/outer_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/extra_slc_to_hts
add wave -noupdate -group ULT_TOP /ult_tp/ULT/ucm2pl_av
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inner_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/middle_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/outer_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/extra_tar_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/inner_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/middle_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/outer_tdc_hits
add wave -noupdate -group ULT_TOP /ult_tp/ULT/extra_tdc_hits
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
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/clk
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/rst
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ttc_commands
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ctrl
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/mon
add wave -noupdate -expand -group UCM_TOP -expand -group port -color {Medium Violet Red} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainA_av
add wave -noupdate -expand -group UCM_TOP -expand -group port -color {Medium Violet Red} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_mainB_av
add wave -noupdate -expand -group UCM_TOP -expand -group port -color {Medium Violet Red} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborA_v
add wave -noupdate -expand -group UCM_TOP -expand -group port -color {Medium Violet Red} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_neighborB_v
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_inn_av
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_mid_av
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_out_av
add wave -noupdate -expand -group UCM_TOP -expand -group port /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2hps_ext_av
add wave -noupdate -expand -group UCM_TOP -expand -group port -color Coral /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/i_slc_data_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/prepro2ctrl_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/ucm_prepro_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_in_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_ar
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_main_out_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/slc_endcap_ar
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cde_in_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_av
add wave -noupdate -expand -group UCM_TOP -color Goldenrod -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4) {-color Goldenrod -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).data_valid {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).busy {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).process_ch {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common {-color Goldenrod -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.header {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.slcid {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.tcsent {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.poseta {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.posphi {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.sl_pt {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.sl_ptthresh {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.sl_charge {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.cointype {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).common.trailer {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).phimod {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).nswseg_angdtheta {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).nswseg_posphi {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(4).nswseg_poseta {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(3) {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(2) {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(1) {-color Goldenrod} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar(0) {-color Goldenrod}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/int_uCM2pl_ar
add wave -noupdate -expand -group UCM_TOP -color Cyan -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4) {-color Cyan -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).data_valid {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).busy {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).process_ch {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common {-color Cyan -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.header {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.slcid {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.tcsent {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.poseta {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.posphi {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.sl_pt {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.sl_ptthresh {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.sl_charge {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.cointype {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).common.trailer {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).phimod {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).nswseg_angdtheta {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).nswseg_posphi {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(4).nswseg_poseta {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(3) {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(2) {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(1) {-color Cyan} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar(0) {-color Cyan}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/o_uCM2pl_ar
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_ar
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pl_o_uCM2pl_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_in_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cpam_out_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2pl_av
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/csw_control
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/pam_CSW_control
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/proc_info
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_in_en
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_loc_rst
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/cvp_phimod
add wave -noupdate -expand -group UCM_TOP /ult_tp/ULT/logic_gen/UCM/UCM/UCM/uCM2hps_data
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/clk
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rst
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/glob_en
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_v
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_v
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/i_slc_data_r
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_r.chamb_ieta -expand} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/o_cde_data_r
add wave -noupdate -expand -group UCM_TOP -group CDE2 -expand /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/barrel_r
add wave -noupdate -expand -group UCM_TOP -group CDE2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_CDE_A(2)/SLC_CDE/rpc_z_a
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -color Cyan /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -color Cyan -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r.muid {-color Cyan -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r.mdtid {-color Cyan -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r.chamb_ieta {-color Cyan -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r.cointype {-color Cyan -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r.posphi {-color Cyan -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r.specific {-color Cyan -height 17} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r.data_valid {-color Cyan -height 17}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -color Cyan /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/g_PIPELINE
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/i_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/i_posphi
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/o_phimod
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phimod_buff
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/sphi_buff
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phicenter
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/phicenter_Default
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand -group phimod /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/PHIMOD/reschanger
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/clk
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/glob_en
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/i_cointype
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/i_data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/i_data_valid
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC -radix unsigned /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/o_offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC -radix unsigned /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/o_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/o_data_valid
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/barrel_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/coin
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC -radix unsigned -childformat {{/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(0) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(1) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(2) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(3) -radix unsigned}} -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(0) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(1) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(2) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a(3) {-height 17 -radix unsigned}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rpc_a
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC -radix unsigned -childformat {{/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(0) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(1) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(2) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(3) -radix unsigned}} -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(0) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(1) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(2) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a(3) {-height 17 -radix unsigned}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/rad_a
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/e_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/e_y
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/e_y_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/int_offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/sum_y
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/sum_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/sum_zy
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/sum_zz
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/sqr_sum_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/b_nom
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/b_den
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/int_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/int_slope_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/s_e_z
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/dv_chain
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -group SLOPE_CALC /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/B_SLOPE/SLOPE_CALC/num_h
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -radix decimal /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/offset
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -color Coral -radix decimal /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -color Coral /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_phimod
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -expand /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -radix decimal /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 -radix decimal -childformat {{/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(0) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(1) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(2) -radix unsigned} {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(3) -radix decimal}} -expand -subitemconfig {/ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(0) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(1) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(2) {-height 17 -radix unsigned} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array(3) {-height 17 -radix decimal}} /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_TOP -expand -group CVP2 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(2)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/clk
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/rst
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/o_phimod
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/offset
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/slope
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/vec_ang_pl
add wave -noupdate -expand -group UCM_TOP -group CVP1 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(1)/SLC_VP/ATAN_SLOPE_LEN
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/clk
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/rst
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/glob_en
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/SECTOR_PHI
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/i_local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/i_in_en
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/i_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/o_phimod
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/o_ucm2hps_av
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/local_rst
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/int_data_r
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/int_data_v
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_v
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_r
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_v_2
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/data_r_2
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/ucm2hps_ar
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/chamber_ieta_r
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/offset
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/slope
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/slope_dv
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/atan_slope
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/atan_dv
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_pos_array
add wave -noupdate -expand -group UCM_TOP -group CVP0 /ult_tp/ULT/logic_gen/UCM/UCM/UCM/SLC_VP_A(0)/SLC_VP/vec_ang_pl
add wave -noupdate -group tar /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/clk
add wave -noupdate -group tar /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/rst
add wave -noupdate -group tar /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/glob_en
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_SIMULATION
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_LOGIC_TYPE
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_FIFO_TYPE
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_MEMORY_TYPE
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_PIPELINE_IN_REGS
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_PIPELINE_OUT_REGS
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_RAM_WIDTH
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/g_RAM_DEPTH
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_wr
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_wr_data
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_rd
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_rd_data
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_rd_dv
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_empty
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_empty_next
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_full
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_full_next
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/o_used
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/i_delay
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/mem
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/mem_dv
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/case_options
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/wr_index
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/rd_index
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/int_wr_data
add wave -noupdate -group tar -expand -group PL_RB /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/PL/RING/ring_mem/used_data
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/i_tdc_hits
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/i_tar_hits
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/o_tdc_hits
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/o_tar_hits
add wave -noupdate -group tar -expand -group TAR_REMAP -expand /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/i_tdc_hits_r
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/o_tar_hits_r
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml1_tubes
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml1_layer
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml2_tubes
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/ml2_layer
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/csm_offset_mem
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_offset_mem
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/csm_offset
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_offset
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_layer
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/tdc_tube
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/full_time
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/dv_pl
add wave -noupdate -group tar -expand -group TAR_REMAP /ult_tp/ULT/logic_gen/TAR/TAR_GEN/TAR/TDC_INPUTS_GEN/OUT_EN/OUT_DELAY(2)/OUT_EN/REMAP_OUT/csm_pl
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2004687500 fs} 1} {{Cursor 2} {1887032933 fs} 0}
quietly wave cursor active 2
configure wave -namecolwidth 134
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
WaveRestoreZoom {1875017031 fs} {1921857970 fs}
