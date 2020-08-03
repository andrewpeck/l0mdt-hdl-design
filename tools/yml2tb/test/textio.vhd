
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library shared_lib;
-- use l0mdt_lib.mdttp_constants_pkg.all;
-- use l0mdt_lib.mdttp_types_pkg.all;

package mdttp_textio is
-- ARRAY type hp_hit_data_a_at
  procedure READ( L:inout LINE; VALUE: out hp_hit_data_a_at);
  procedure WRITE( L:inout LINE; VALUE: in hp_hit_data_a_at);
-- RECORD type sf2pt_rt
  procedure READ( L:inout LINE; VALUE: out sf2pt_rt);
  procedure WRITE( L:inout LINE; VALUE: in sf2pt_rt);
-- RECORD type heg_bm2sf_rt
  procedure READ( L:inout LINE; VALUE: out heg_bm2sf_rt);
  procedure WRITE( L:inout LINE; VALUE: in heg_bm2sf_rt);
-- RECORD type input_tar_rt
  procedure READ( L:inout LINE; VALUE: out input_tar_rt);
  procedure WRITE( L:inout LINE; VALUE: in input_tar_rt);
-- ARRAY type mtc_outs_at
  procedure READ( L:inout LINE; VALUE: out mtc_outs_at);
  procedure WRITE( L:inout LINE; VALUE: in mtc_outs_at);
-- ARRAY type slc_rx_datas_at
  procedure READ( L:inout LINE; VALUE: out slc_rx_datas_at);
  procedure WRITE( L:inout LINE; VALUE: in slc_rx_datas_at);
-- RECORD type sf_seg_data_barrel_rt
  procedure READ( L:inout LINE; VALUE: out sf_seg_data_barrel_rt);
  procedure WRITE( L:inout LINE; VALUE: in sf_seg_data_barrel_rt);
-- RECORD type hp_hp2bm_rt
  procedure READ( L:inout LINE; VALUE: out hp_hp2bm_rt);
  procedure WRITE( L:inout LINE; VALUE: in hp_hp2bm_rt);
-- RECORD type mtc_out_rt
  procedure READ( L:inout LINE; VALUE: out mtc_out_rt);
  procedure WRITE( L:inout LINE; VALUE: in mtc_out_rt);
-- RECORD type heg_ctrl2hp_rt
  procedure READ( L:inout LINE; VALUE: out heg_ctrl2hp_rt);
  procedure WRITE( L:inout LINE; VALUE: in heg_ctrl2hp_rt);
-- RECORD type ucm_csf_seed_rt
  procedure READ( L:inout LINE; VALUE: out ucm_csf_seed_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm_csf_seed_rt);
-- ARRAY type ucm_proc_info_at
  procedure READ( L:inout LINE; VALUE: out ucm_proc_info_at);
  procedure WRITE( L:inout LINE; VALUE: in ucm_proc_info_at);
-- RECORD type ucm_csf_endcap_rt
  procedure READ( L:inout LINE; VALUE: out ucm_csf_endcap_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm_csf_endcap_rt);
-- ARRAY type tar2hpss_at
  procedure READ( L:inout LINE; VALUE: out tar2hpss_at);
  procedure WRITE( L:inout LINE; VALUE: in tar2hpss_at);
-- ARRAY type hp_heg2hp_window_at
  procedure READ( L:inout LINE; VALUE: out hp_heg2hp_window_at);
  procedure WRITE( L:inout LINE; VALUE: in hp_heg2hp_window_at);
-- RECORD type mtc2nsp_rt
  procedure READ( L:inout LINE; VALUE: out mtc2nsp_rt);
  procedure WRITE( L:inout LINE; VALUE: in mtc2nsp_rt);
-- RECORD type ucm2pl_rt
  procedure READ( L:inout LINE; VALUE: out ucm2pl_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm2pl_rt);
-- ARRAY type mdt_polmuxs_at
  procedure READ( L:inout LINE; VALUE: out mdt_polmuxs_at);
  procedure WRITE( L:inout LINE; VALUE: in mdt_polmuxs_at);
-- RECORD type hp_win_tubes_rt
  procedure READ( L:inout LINE; VALUE: out hp_win_tubes_rt);
  procedure WRITE( L:inout LINE; VALUE: in hp_win_tubes_rt);
-- RECORD type slc_endcap_rt
  procedure READ( L:inout LINE; VALUE: out slc_endcap_rt);
  procedure WRITE( L:inout LINE; VALUE: in slc_endcap_rt);
-- RECORD type slc_barrel_rt
  procedure READ( L:inout LINE; VALUE: out slc_barrel_rt);
  procedure WRITE( L:inout LINE; VALUE: in slc_barrel_rt);
-- RECORD type mdt_polmux_rt
  procedure READ( L:inout LINE; VALUE: out mdt_polmux_rt);
  procedure WRITE( L:inout LINE; VALUE: in mdt_polmux_rt);
-- ARRAY type pl2pts_at
  procedure READ( L:inout LINE; VALUE: out pl2pts_at);
  procedure WRITE( L:inout LINE; VALUE: in pl2pts_at);
-- ARRAY type csf_hit_a_at
  procedure READ( L:inout LINE; VALUE: out csf_hit_a_at);
  procedure WRITE( L:inout LINE; VALUE: in csf_hit_a_at);
-- ARRAY type sf2pts_at
  procedure READ( L:inout LINE; VALUE: out sf2pts_at);
  procedure WRITE( L:inout LINE; VALUE: in sf2pts_at);
-- RECORD type slc_muid_rt
  procedure READ( L:inout LINE; VALUE: out slc_muid_rt);
  procedure WRITE( L:inout LINE; VALUE: in slc_muid_rt);
-- ARRAY type heg_ctrl2hps_at
  procedure READ( L:inout LINE; VALUE: out heg_ctrl2hps_at);
  procedure WRITE( L:inout LINE; VALUE: in heg_ctrl2hps_at);
-- RECORD type sf_seg_data_endcap_rt
  procedure READ( L:inout LINE; VALUE: out sf_seg_data_endcap_rt);
  procedure WRITE( L:inout LINE; VALUE: in sf_seg_data_endcap_rt);
-- ARRAY type heg_hp2bm_at
  procedure READ( L:inout LINE; VALUE: out heg_hp2bm_at);
  procedure WRITE( L:inout LINE; VALUE: in heg_hp2bm_at);
-- RECORD type ucm_prepro_rt
  procedure READ( L:inout LINE; VALUE: out ucm_prepro_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm_prepro_rt);
-- RECORD type felix_stream_rt
  procedure READ( L:inout LINE; VALUE: out felix_stream_rt);
  procedure WRITE( L:inout LINE; VALUE: in felix_stream_rt);
-- RECORD type pl2mtc_rt
  procedure READ( L:inout LINE; VALUE: out pl2mtc_rt);
  procedure WRITE( L:inout LINE; VALUE: in pl2mtc_rt);
-- ARRAY type tar2hps_tb_at
  procedure READ( L:inout LINE; VALUE: out tar2hps_tb_at);
  procedure WRITE( L:inout LINE; VALUE: in tar2hps_tb_at);
-- RECORD type hp_hpsPc2hp_rt
  procedure READ( L:inout LINE; VALUE: out hp_hpsPc2hp_rt);
  procedure WRITE( L:inout LINE; VALUE: in hp_hpsPc2hp_rt);
-- RECORD type slc_rx_data_rt
  procedure READ( L:inout LINE; VALUE: out slc_rx_data_rt);
  procedure WRITE( L:inout LINE; VALUE: in slc_rx_data_rt);
-- RECORD type l0mdt_ttc_rt
  procedure READ( L:inout LINE; VALUE: out l0mdt_ttc_rt);
  procedure WRITE( L:inout LINE; VALUE: in l0mdt_ttc_rt);
-- RECORD type ucm_csf_barrel_rt
  procedure READ( L:inout LINE; VALUE: out ucm_csf_barrel_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm_csf_barrel_rt);
-- RECORD type l0mdt_control_rt
  procedure READ( L:inout LINE; VALUE: out l0mdt_control_rt);
  procedure WRITE( L:inout LINE; VALUE: in l0mdt_control_rt);
-- RECORD type hp_heg2hp_slc_rt
  procedure READ( L:inout LINE; VALUE: out hp_heg2hp_slc_rt);
  procedure WRITE( L:inout LINE; VALUE: in hp_heg2hp_slc_rt);
-- ARRAY type mtc2nsps_at
  procedure READ( L:inout LINE; VALUE: out mtc2nsps_at);
  procedure WRITE( L:inout LINE; VALUE: in mtc2nsps_at);
-- RECORD type tf2mtc_rt
  procedure READ( L:inout LINE; VALUE: out tf2mtc_rt);
  procedure WRITE( L:inout LINE; VALUE: in tf2mtc_rt);
-- RECORD type ucm_pam_ch_control_rt
  procedure READ( L:inout LINE; VALUE: out ucm_pam_ch_control_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm_pam_ch_control_rt);
-- RECORD type ucm_proc_info_ch_rt
  procedure READ( L:inout LINE; VALUE: out ucm_proc_info_ch_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm_proc_info_ch_rt);
-- ARRAY type pl2mtcs_at
  procedure READ( L:inout LINE; VALUE: out pl2mtcs_at);
  procedure WRITE( L:inout LINE; VALUE: in pl2mtcs_at);
-- RECORD type mdt_tdc_rt
  procedure READ( L:inout LINE; VALUE: out mdt_tdc_rt);
  procedure WRITE( L:inout LINE; VALUE: in mdt_tdc_rt);
-- RECORD type tar2hps_rt
  procedure READ( L:inout LINE; VALUE: out tar2hps_rt);
  procedure WRITE( L:inout LINE; VALUE: in tar2hps_rt);
-- ARRAY type ucm2hpss_at
  procedure READ( L:inout LINE; VALUE: out ucm2hpss_at);
  procedure WRITE( L:inout LINE; VALUE: in ucm2hpss_at);
-- ARRAY type csf_locseg_a_at
  procedure READ( L:inout LINE; VALUE: out csf_locseg_a_at);
  procedure WRITE( L:inout LINE; VALUE: in csf_locseg_a_at);
-- ARRAY type ucm_prepros_at
  procedure READ( L:inout LINE; VALUE: out ucm_prepros_at);
  procedure WRITE( L:inout LINE; VALUE: in ucm_prepros_at);
-- ARRAY type hps_ctrl2sf_at
  procedure READ( L:inout LINE; VALUE: out hps_ctrl2sf_at);
  procedure WRITE( L:inout LINE; VALUE: in hps_ctrl2sf_at);
-- RECORD type hp_hp2sf_data_rt
  procedure READ( L:inout LINE; VALUE: out hp_hp2sf_data_rt);
  procedure WRITE( L:inout LINE; VALUE: in hp_hp2sf_data_rt);
-- RECORD type ucm_csw_ch_control_rt
  procedure READ( L:inout LINE; VALUE: out ucm_csw_ch_control_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm_csw_ch_control_rt);
-- ARRAY type ucm_csw_control_at
  procedure READ( L:inout LINE; VALUE: out ucm_csw_control_at);
  procedure WRITE( L:inout LINE; VALUE: in ucm_csw_control_at);
-- RECORD type csf_locseg_rt
  procedure READ( L:inout LINE; VALUE: out csf_locseg_rt);
  procedure WRITE( L:inout LINE; VALUE: in csf_locseg_rt);
-- RECORD type hp_heg2hp_slc_b_rt
  procedure READ( L:inout LINE; VALUE: out hp_heg2hp_slc_b_rt);
  procedure WRITE( L:inout LINE; VALUE: in hp_heg2hp_slc_b_rt);
-- RECORD type ucm2hps_rt
  procedure READ( L:inout LINE; VALUE: out ucm2hps_rt);
  procedure WRITE( L:inout LINE; VALUE: in ucm2hps_rt);
-- ARRAY type felix_streams_at
  procedure READ( L:inout LINE; VALUE: out felix_streams_at);
  procedure WRITE( L:inout LINE; VALUE: in felix_streams_at);
-- ARRAY type ucm_pam_control_at
  procedure READ( L:inout LINE; VALUE: out ucm_pam_control_at);
  procedure WRITE( L:inout LINE; VALUE: in ucm_pam_control_at);
-- ARRAY type hps_bm2sf_at
  procedure READ( L:inout LINE; VALUE: out hps_bm2sf_at);
  procedure WRITE( L:inout LINE; VALUE: in hps_bm2sf_at);
-- ARRAY type tf2mtcs_at
  procedure READ( L:inout LINE; VALUE: out tf2mtcs_at);
  procedure WRITE( L:inout LINE; VALUE: in tf2mtcs_at);
-- RECORD type slc_common_rt
  procedure READ( L:inout LINE; VALUE: out slc_common_rt);
  procedure WRITE( L:inout LINE; VALUE: in slc_common_rt);
-- RECORD type hp_hit_data_rt
  procedure READ( L:inout LINE; VALUE: out hp_hit_data_rt);
  procedure WRITE( L:inout LINE; VALUE: in hp_hit_data_rt);
-- ARRAY type sf2pt
  procedure READ( L:inout LINE; VALUE: out sf2pt);
  procedure WRITE( L:inout LINE; VALUE: in sf2pt);
-- ARRAY type ucm2pls_at
  procedure READ( L:inout LINE; VALUE: out ucm2pls_at);
  procedure WRITE( L:inout LINE; VALUE: in ucm2pls_at);
-- RECORD type pl2pt_rt
  procedure READ( L:inout LINE; VALUE: out pl2pt_rt);
  procedure WRITE( L:inout LINE; VALUE: in pl2pt_rt);
-- RECORD type slc_chid_rt
  procedure READ( L:inout LINE; VALUE: out slc_chid_rt);
  procedure WRITE( L:inout LINE; VALUE: in slc_chid_rt);
-- ARRAY type heg_pc2heg_at
  procedure READ( L:inout LINE; VALUE: out heg_pc2heg_at);
  procedure WRITE( L:inout LINE; VALUE: in heg_pc2heg_at);
-- RECORD type csf_hit_rt
  procedure READ( L:inout LINE; VALUE: out csf_hit_rt);
  procedure WRITE( L:inout LINE; VALUE: in csf_hit_rt);

end mdttp_textio;

package body mdttp_textio is

  procedure READ( L:inout LINE; VALUE: out hp_hit_data_a_at) is
    variable v_data : hp_hit_data_a_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out sf2pt_rt) is
    variable v_data : sf2pt_rt;
  begin
    READ(L, v_data.data_valid);
    READ(L, v_data.muid);
    READ(L, v_data.chamber_id);
    READ(L, v_data.pos);
    READ(L, v_data.angle);
    READ(L, v_data.quality);
  end READ;

  procedure READ( L:inout LINE; VALUE: out heg_bm2sf_rt) is
    variable v_data : heg_bm2sf_rt;
  begin
    READ(L, v_data.data);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out input_tar_rt) is
    variable v_data : input_tar_rt;
  begin
    READ(L, v_data.global_time);
    READ(L, v_data.station);
    READ(L, v_data.chamber);
    READ(L, v_data.tar);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mtc_outs_at) is
    variable v_data : mtc_outs_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out slc_rx_datas_at) is
    variable v_data : slc_rx_datas_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out sf_seg_data_barrel_rt) is
    variable v_data : sf_seg_data_barrel_rt;
  begin
    READ(L, v_data.data_valid);
    READ(L, v_data.muid);
    READ(L, v_data.chamber_id);
    READ(L, v_data.pos);
    READ(L, v_data.angle);
    READ(L, v_data.quality);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_hp2bm_rt) is
    variable v_data : hp_hp2bm_rt;
  begin
    READ(L, v_data.data);
    READ(L, v_data.mdt_valid);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mtc_out_rt) is
    variable v_data : mtc_out_rt;
  begin
    READ(L, v_data.common);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out heg_ctrl2hp_rt) is
    variable v_data : heg_ctrl2hp_rt;
  begin
    READ(L, v_data.rst);
    READ(L, v_data.enable);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_csf_seed_rt) is
    variable v_data : ucm_csf_seed_rt;
  begin
    READ(L, v_data.muid);
    READ(L, v_data.mbar);
    READ(L, v_data.pos);
    READ(L, v_data.ang);
    READ(L, v_data.chamber_id);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_proc_info_at) is
    variable v_data : ucm_proc_info_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_csf_endcap_rt) is
    variable v_data : ucm_csf_endcap_rt;
  begin
    READ(L, v_data.mbar);
    READ(L, v_data.R);
  end READ;

  procedure READ( L:inout LINE; VALUE: out tar2hpss_at) is
    variable v_data : tar2hpss_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_heg2hp_window_at) is
    variable v_data : hp_heg2hp_window_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mtc2nsp_rt) is
    variable v_data : mtc2nsp_rt;
  begin
    READ(L, v_data.common);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm2pl_rt) is
    variable v_data : ucm2pl_rt;
  begin
    READ(L, v_data.muid);
    READ(L, v_data.chambers);
    READ(L, v_data.common);
    READ(L, v_data.specific);
    READ(L, v_data.process_ch);
    READ(L, v_data.processed);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mdt_polmuxs_at) is
    variable v_data : mdt_polmuxs_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_win_tubes_rt) is
    variable v_data : hp_win_tubes_rt;
  begin
    READ(L, v_data.hi);
    READ(L, v_data.lo);
  end READ;

  procedure READ( L:inout LINE; VALUE: out slc_endcap_rt) is
    variable v_data : slc_endcap_rt;
  begin
    READ(L, v_data.spare_bits);
    READ(L, v_data.r);
    READ(L, v_data.angle_wrt_phi);
    READ(L, v_data.angle_wrt_eta);
    READ(L, v_data.nsw_eta);
    READ(L, v_data.nsw_phi);
    READ(L, v_data.nsw_angle_wrt_eta);
    READ(L, v_data.nsw_monitor);
  end READ;

  procedure READ( L:inout LINE; VALUE: out slc_barrel_rt) is
    variable v_data : slc_barrel_rt;
  begin
    READ(L, v_data.spare_bits);
    READ(L, v_data.coin_type);
    READ(L, v_data.z_rpc0);
    READ(L, v_data.z_rpc1);
    READ(L, v_data.z_rpc2);
    READ(L, v_data.z_rpc3);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mdt_polmux_rt) is
    variable v_data : mdt_polmux_rt;
  begin
    READ(L, v_data.fiberID);
    READ(L, v_data.muxID);
    READ(L, v_data.tdc);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out pl2pts_at) is
    variable v_data : pl2pts_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out csf_hit_a_at) is
    variable v_data : csf_hit_a_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out sf2pts_at) is
    variable v_data : sf2pts_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out slc_muid_rt) is
    variable v_data : slc_muid_rt;
  begin
    READ(L, v_data.slcid);
    READ(L, v_data.slid);
    READ(L, v_data.bcid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out heg_ctrl2hps_at) is
    variable v_data : heg_ctrl2hps_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out sf_seg_data_endcap_rt) is
    variable v_data : sf_seg_data_endcap_rt;
  begin
    READ(L, v_data.data_valid);
    READ(L, v_data.muid);
    READ(L, v_data.chamber_id);
    READ(L, v_data.pos);
    READ(L, v_data.angle);
    READ(L, v_data.quality);
  end READ;

  procedure READ( L:inout LINE; VALUE: out heg_hp2bm_at) is
    variable v_data : heg_hp2bm_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_prepro_rt) is
    variable v_data : ucm_prepro_rt;
  begin
    READ(L, v_data.muid);
    READ(L, v_data.chambers);
    READ(L, v_data.common);
    READ(L, v_data.specific);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out felix_stream_rt) is
    variable v_data : felix_stream_rt;
  begin
    READ(L, v_data.muid);
    READ(L, v_data.common);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out pl2mtc_rt) is
    variable v_data : pl2mtc_rt;
  begin
    READ(L, v_data.muid);
    READ(L, v_data.chambers);
    READ(L, v_data.common);
    READ(L, v_data.specific);
    READ(L, v_data.process_ch);
    READ(L, v_data.processed);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out tar2hps_tb_at) is
    variable v_data : tar2hps_tb_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_hpsPc2hp_rt) is
    variable v_data : hp_hpsPc2hp_rt;
  begin
    READ(L, v_data.tube);
    READ(L, v_data.layer);
    READ(L, v_data.time_t0);
    READ(L, v_data.global_z);
    READ(L, v_data.global_x);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out slc_rx_data_rt) is
    variable v_data : slc_rx_data_rt;
  begin
    READ(L, v_data.muid);
    READ(L, v_data.chambers);
    READ(L, v_data.common);
    READ(L, v_data.specific);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out l0mdt_ttc_rt) is
    variable v_data : l0mdt_ttc_rt;
  begin
    READ(L, v_data.bcr);
    READ(L, v_data.ocr);
    READ(L, v_data.ecr);
    READ(L, v_data.l0a);
    READ(L, v_data.l1a);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_csf_barrel_rt) is
    variable v_data : ucm_csf_barrel_rt;
  begin
    READ(L, v_data.mbar);
    READ(L, v_data.z);
  end READ;

  procedure READ( L:inout LINE; VALUE: out l0mdt_control_rt) is
    variable v_data : l0mdt_control_rt;
  begin
    READ(L, v_data.clk);
    READ(L, v_data.rst);
    READ(L, v_data.bx);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_heg2hp_slc_rt) is
    variable v_data : hp_heg2hp_slc_rt;
  begin
    READ(L, v_data.bcid);
    READ(L, v_data.specific);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mtc2nsps_at) is
    variable v_data : mtc2nsps_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out tf2mtc_rt) is
    variable v_data : tf2mtc_rt;
  begin
    READ(L, v_data.data_valid);
    READ(L, v_data.muid);
    READ(L, v_data.eta);
    READ(L, v_data.pt);
    READ(L, v_data.pt_thr);
    READ(L, v_data.charge);
    READ(L, v_data.nseg);
    READ(L, v_data.quality);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_pam_ch_control_rt) is
    variable v_data : ucm_pam_ch_control_rt;
  begin
    READ(L, v_data.data_present);
    READ(L, v_data.addr_orig);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_proc_info_ch_rt) is
    variable v_data : ucm_proc_info_ch_rt;
  begin
    READ(L, v_data.ch);
    READ(L, v_data.processed);
  end READ;

  procedure READ( L:inout LINE; VALUE: out pl2mtcs_at) is
    variable v_data : pl2mtcs_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mdt_tdc_rt) is
    variable v_data : mdt_tdc_rt;
  begin
    READ(L, v_data.ch);
    READ(L, v_data.mode);
    READ(L, v_data.coarse);
    READ(L, v_data.fine);
    READ(L, v_data.pw);
  end READ;

  procedure READ( L:inout LINE; VALUE: out tar2hps_rt) is
    variable v_data : tar2hps_rt;
  begin
    READ(L, v_data.tube);
    READ(L, v_data.layer);
    READ(L, v_data.chamber_id);
    READ(L, v_data.time);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm2hpss_at) is
    variable v_data : ucm2hpss_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out csf_locseg_a_at) is
    variable v_data : csf_locseg_a_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_prepros_at) is
    variable v_data : ucm_prepros_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hps_ctrl2sf_at) is
    variable v_data : hps_ctrl2sf_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_hp2sf_data_rt) is
    variable v_data : hp_hp2sf_data_rt;
  begin
    READ(L, v_data.local_y);
    READ(L, v_data.local_x);
    READ(L, v_data.radius);
    READ(L, v_data.layer);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_csw_ch_control_rt) is
    variable v_data : ucm_csw_ch_control_rt;
  begin
    READ(L, v_data.data_present);
    READ(L, v_data.addr_orig);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_csw_control_at) is
    variable v_data : ucm_csw_control_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out csf_locseg_rt) is
    variable v_data : csf_locseg_rt;
  begin
    READ(L, v_data.valid);
    READ(L, v_data.b);
    READ(L, v_data.m);
    READ(L, v_data.chi2);
    READ(L, v_data.ndof);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_heg2hp_slc_b_rt) is
    variable v_data : hp_heg2hp_slc_b_rt;
  begin
    READ(L, v_data.z_0);
    READ(L, v_data.y_0);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm2hps_rt) is
    variable v_data : ucm2hps_rt;
  begin
    READ(L, v_data.muid);
    READ(L, v_data.specific);
    READ(L, v_data.chamber_id);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out felix_streams_at) is
    variable v_data : felix_streams_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm_pam_control_at) is
    variable v_data : ucm_pam_control_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hps_bm2sf_at) is
    variable v_data : hps_bm2sf_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out tf2mtcs_at) is
    variable v_data : tf2mtcs_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out slc_common_rt) is
    variable v_data : slc_common_rt;
  begin
    READ(L, v_data.tcid);
    READ(L, v_data.tcsent);
    READ(L, v_data.pos_eta);
    READ(L, v_data.pos_phi);
    READ(L, v_data.rpc_pt);
    READ(L, v_data.pt_th);
    READ(L, v_data.charge);
  end READ;

  procedure READ( L:inout LINE; VALUE: out hp_hit_data_rt) is
    variable v_data : hp_hit_data_rt;
  begin
    READ(L, v_data.local_y);
    READ(L, v_data.local_x);
    READ(L, v_data.radius);
    READ(L, v_data.multilayer);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out sf2pt) is
    variable v_data : sf2pt;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out ucm2pls_at) is
    variable v_data : ucm2pls_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out pl2pt_rt) is
    variable v_data : pl2pt_rt;
  begin
    READ(L, v_data.data_valid);
    READ(L, v_data.muid);
    READ(L, v_data.phimod);
    READ(L, v_data.charge);
  end READ;

  procedure READ( L:inout LINE; VALUE: out slc_chid_rt) is
    variable v_data : slc_chid_rt;
  begin
    READ(L, v_data.mdt_inn);
    READ(L, v_data.mdt_mid);
    READ(L, v_data.mdt_out);
    READ(L, v_data.mdt_ext);
  end READ;

  procedure READ( L:inout LINE; VALUE: out heg_pc2heg_at) is
    variable v_data : heg_pc2heg_at;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out csf_hit_rt) is
    variable v_data : csf_hit_rt;
  begin
    READ(L, v_data.valid);
    READ(L, v_data.x);
    READ(L, v_data.y);
  end READ;

end mdttp_textio;
