library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;

package common_pkg is

  function structify(x: std_logic_vector) return signed;
  function structify(x: std_logic_vector) return unsigned;
  function structify(x: std_logic_vector) return std_logic_vector;
  function structify(x: std_logic_vector) return integer;

  function vectorify(x: signed) return std_logic_vector;
  function vectorify(x: unsigned) return std_logic_vector;
  function vectorify(x: std_logic_vector) return std_logic_vector;
  function vectorify(x: integer) return std_logic_vector;

  function nullify(x: std_logic) return std_logic;
  function nullify(x: std_logic_vector) return std_logic_vector;
  function nullify(x: unsigned) return unsigned;
  function nullify(x: signed) return signed;

  constant   MDT_GLOBAL_AXI_LEN   :  integer := 19;

  constant   MDT_LOCAL_AXI_LEN    :  integer := 15;

  constant   MDT_RADIUS_LEN       :  integer := 9;

  constant   SLC_SLCID_LEN        :  integer := 2;

  constant   SLC_SLID_LEN         :  integer := 6;

  constant   BCID_LEN             :  integer := 12;

  type slc_muid_rt is record
     slcid                :  unsigned(SLC_SLCID_LEN-1 downto 0);
     slid                 :  unsigned(SLC_SLID_LEN-1 downto 0);
     bcid                 :  unsigned(BCID_LEN-1 downto 0);
  end record slc_muid_rt;
  constant SLC_MUID_LEN : integer := 20;
  subtype slc_muid_rvt is std_logic_vector(SLC_MUID_LEN-1 downto 0);
  function vectorify(x: slc_muid_rt) return slc_muid_rvt;
  function structify(x: slc_muid_rvt) return slc_muid_rt;
  function nullify (x: slc_muid_rt) return slc_muid_rt;

  constant   SLC_CHAMBER_LEN      :  integer := 3;

  type slc_chid_rt is record
     mdt_inn              :  unsigned(SLC_CHAMBER_LEN-1 downto 0);
     mdt_mid              :  unsigned(SLC_CHAMBER_LEN-1 downto 0);
     mdt_out              :  unsigned(SLC_CHAMBER_LEN-1 downto 0);
     mdt_ext              :  unsigned(SLC_CHAMBER_LEN-1 downto 0);
  end record slc_chid_rt;
  constant SLC_CHID_LEN : integer := 12;
  subtype slc_chid_rvt is std_logic_vector(SLC_CHID_LEN-1 downto 0);
  function vectorify(x: slc_chid_rt) return slc_chid_rvt;
  function structify(x: slc_chid_rvt) return slc_chid_rt;
  function nullify (x: slc_chid_rt) return slc_chid_rt;

  constant   SLC_TCID_LEN         :  integer := 3;

  constant   SLC_TCSENT_LEN       :  integer := 1;

  constant   SLC_POS_ETA_LEN      :  integer := 14;

  constant   SLC_POS_ETA_MULT     :  real := 0.014;

  constant   SLC_POS_PHI_LEN      :  integer := 9;

  constant   SLC_POS_PHI_MULT     :  real := 0.012;

  constant   SLC_RPC_PT_LEN       :  integer := 8;

  constant   SLC_PT_TH_LEN        :  integer := 4;

  constant   SLC_CHARGE_LEN       :  integer := 1;

  type slc_common_rt is record
     tcid                 :  std_logic_vector(SLC_TCID_LEN-1 downto 0);
     tcsent               :  std_logic;
     pos_eta              :  signed(SLC_POS_ETA_LEN-1 downto 0);
     pos_phi              :  unsigned(SLC_POS_PHI_LEN-1 downto 0);
     rpc_pt               :  std_logic_vector(SLC_RPC_PT_LEN-1 downto 0);
     pt_th                :  std_logic_vector(SLC_PT_TH_LEN-1 downto 0);
     charge               :  std_logic;
  end record slc_common_rt;
  constant SLC_COMMON_LEN : integer := 40;
  subtype slc_common_rvt is std_logic_vector(SLC_COMMON_LEN-1 downto 0);
  function vectorify(x: slc_common_rt) return slc_common_rvt;
  function structify(x: slc_common_rvt) return slc_common_rt;
  function nullify (x: slc_common_rt) return slc_common_rt;

  constant   SLC_B_SPARE_LEN      :  integer := 8;

  constant   SLC_COIN_TYPE_LEN    :  integer := 3;

  constant   SLC_Z_RPC_LEN        :  integer := 10;

  constant   SLC_Z_RPC_MULT       :  real := 0.0234;

  type slc_barrel_rt is record
     spare_bits           :  std_logic_vector(SLC_B_SPARE_LEN-1 downto 0);
     coin_type            :  std_logic_vector(SLC_COIN_TYPE_LEN-1 downto 0);
     z_rpc0               :  signed(SLC_Z_RPC_LEN-1 downto 0);
     z_rpc1               :  signed(SLC_Z_RPC_LEN-1 downto 0);
     z_rpc2               :  signed(SLC_Z_RPC_LEN-1 downto 0);
     z_rpc3               :  signed(SLC_Z_RPC_LEN-1 downto 0);
  end record slc_barrel_rt;
  constant SLC_BARREL_LEN : integer := 51;
  subtype slc_barrel_rvt is std_logic_vector(SLC_BARREL_LEN-1 downto 0);
  function vectorify(x: slc_barrel_rt) return slc_barrel_rvt;
  function structify(x: slc_barrel_rvt) return slc_barrel_rt;
  function nullify (x: slc_barrel_rt) return slc_barrel_rt;

  constant   SLC_E_SPARE_LEN      :  integer := 8;

  constant   SLC_R_LEN            :  integer := 10;

  constant   SLC_ANGLE_WRT_PHI_LEN :  integer := 7;

  constant   SLC_ANGLE_WRT_ETA_LEN :  integer := 4;

  constant   SLC_NSW_ETA_LEN      :  integer := 14;

  constant   SLC_NSW_PHI_LEN      :  integer := 8;

  constant   SLC_NSW_ANGLE_WRT_ETA_LEN :  integer := 5;

  type slc_endcap_rt is record
     spare_bits           :  std_logic_vector(SLC_E_SPARE_LEN-1 downto 0);
     r                    :  unsigned(SLC_R_LEN-1 downto 0);
     angle_wrt_phi        :  signed(SLC_ANGLE_WRT_PHI_LEN-1 downto 0);
     angle_wrt_eta        :  signed(SLC_ANGLE_WRT_ETA_LEN-1 downto 0);
     nsw_eta              :  unsigned(SLC_NSW_ETA_LEN-1 downto 0);
     nsw_phi              :  unsigned(SLC_NSW_PHI_LEN-1 downto 0);
     nsw_angle_wrt_eta    :  signed(SLC_NSW_ANGLE_WRT_ETA_LEN-1 downto 0);
     nsw_monitor          :  std_logic;
  end record slc_endcap_rt;
  constant SLC_ENDCAP_LEN : integer := 57;
  subtype slc_endcap_rvt is std_logic_vector(SLC_ENDCAP_LEN-1 downto 0);
  function vectorify(x: slc_endcap_rt) return slc_endcap_rvt;
  function structify(x: slc_endcap_rvt) return slc_endcap_rt;
  function nullify (x: slc_endcap_rt) return slc_endcap_rt;

  constant   SLC_SPECIFIC_LEN     :  integer := 51;

  type slc_rx_data_rt is record
     muid                 :  slc_muid_rt;
     chambers             :  slc_chid_rt;
     common               :  slc_common_rt;
     specific             :  std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record slc_rx_data_rt;
  constant SLC_RX_DATA_LEN : integer := 124;
  subtype slc_rx_data_rvt is std_logic_vector(SLC_RX_DATA_LEN-1 downto 0);
  function vectorify(x: slc_rx_data_rt) return slc_rx_data_rvt;
  function structify(x: slc_rx_data_rvt) return slc_rx_data_rt;
  function nullify (x: slc_rx_data_rt) return slc_rx_data_rt;

  type slc_rx_data_at is array(integer range <>) of slc_rx_data_rt;
  type slc_rx_data_avt is array(integer range <>) of slc_rx_data_rvt;
  function vectorify(x: slc_rx_data_at) return slc_rx_data_avt;
  function vectorify(x: slc_rx_data_at) return std_logic_vector;
  function structify(x: slc_rx_data_avt) return slc_rx_data_at;
  function structify(x: std_logic_vector) return slc_rx_data_at;
  function nullify(x: slc_rx_data_at) return slc_rx_data_at;
  function nullify(x: slc_rx_data_avt) return slc_rx_data_avt;

  constant   MDT_TUBE_LEN         :  integer := 9;

  constant   MDT_LAYER_LEN        :  integer := 5;

  constant   MDT_TIME_LEN         :  integer := 18;

  type tar2hps_rt is record
     tube                 :  unsigned(MDT_TUBE_LEN-1 downto 0);
     layer                :  unsigned(MDT_LAYER_LEN-1 downto 0);
     time                 :  unsigned(MDT_TIME_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record tar2hps_rt;
  constant TAR2HPS_LEN : integer := 33;
  subtype tar2hps_rvt is std_logic_vector(TAR2HPS_LEN-1 downto 0);
  function vectorify(x: tar2hps_rt) return tar2hps_rvt;
  function structify(x: tar2hps_rvt) return tar2hps_rt;
  function nullify (x: tar2hps_rt) return tar2hps_rt;

  type tar2hps_at is array(integer range <>) of tar2hps_rt;
  type tar2hps_avt is array(integer range <>) of tar2hps_rvt;
  function vectorify(x: tar2hps_at) return tar2hps_avt;
  function vectorify(x: tar2hps_at) return std_logic_vector;
  function structify(x: tar2hps_avt) return tar2hps_at;
  function structify(x: std_logic_vector) return tar2hps_at;
  function nullify(x: tar2hps_at) return tar2hps_at;
  function nullify(x: tar2hps_avt) return tar2hps_avt;

  constant   UCM_MBAR_LEN         :  integer := 12;

  constant   UCM_Z_ROI_LEN        :  integer := 10;

  constant   UCM_R_ROI_LEN        :  integer := 4;

  constant   UCM_PHI_LEN          :  integer := 14;

  constant   UCM_ETA_LEN          :  integer := 8;

  type ucm_csf_barrel_rt is record
     mbar                 :  signed(UCM_MBAR_LEN-1 downto 0);
     z                    :  unsigned(UCM_Z_ROI_LEN-1 downto 0);
  end record ucm_csf_barrel_rt;
  constant UCM_CSF_BARREL_LEN : integer := 22;
  subtype ucm_csf_barrel_rvt is std_logic_vector(UCM_CSF_BARREL_LEN-1 downto 0);
  function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rvt;
  function structify(x: ucm_csf_barrel_rvt) return ucm_csf_barrel_rt;
  function nullify (x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt;

  constant   UCM2HPS_SPECIFIC_LEN :  integer := 22;

  type ucm2hps_rt is record
     muid                 :  slc_muid_rt;
     specific             :  std_logic_vector(UCM2HPS_SPECIFIC_LEN-1 downto 0);
     chamber_id           :  std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record ucm2hps_rt;
  constant UCM2HPS_LEN : integer := 46;
  subtype ucm2hps_rvt is std_logic_vector(UCM2HPS_LEN-1 downto 0);
  function vectorify(x: ucm2hps_rt) return ucm2hps_rvt;
  function structify(x: ucm2hps_rvt) return ucm2hps_rt;
  function nullify (x: ucm2hps_rt) return ucm2hps_rt;

  type ucm2hps_at is array(integer range <>) of ucm2hps_rt;
  type ucm2hps_avt is array(integer range <>) of ucm2hps_rvt;
  function vectorify(x: ucm2hps_at) return ucm2hps_avt;
  function vectorify(x: ucm2hps_at) return std_logic_vector;
  function structify(x: ucm2hps_avt) return ucm2hps_at;
  function structify(x: std_logic_vector) return ucm2hps_at;
  function nullify(x: ucm2hps_at) return ucm2hps_at;
  function nullify(x: ucm2hps_avt) return ucm2hps_avt;

  type pipeline_rt is record
     muid                 :  slc_muid_rt;
     chambers             :  slc_chid_rt;
     common               :  slc_common_rt;
     specific             :  std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
     process_ch           :  std_logic_vector(4-1 downto 0);
     processed            :  std_logic;
     data_valid           :  std_logic;
  end record pipeline_rt;
  constant PIPELINE_LEN : integer := 129;
  subtype pipeline_rvt is std_logic_vector(PIPELINE_LEN-1 downto 0);
  function vectorify(x: pipeline_rt) return pipeline_rvt;
  function structify(x: pipeline_rvt) return pipeline_rt;
  function nullify (x: pipeline_rt) return pipeline_rt;

  type pipelines_at is array(integer range <>) of pipeline_rt;
  type pipelines_avt is array(integer range <>) of pipeline_rvt;
  function vectorify(x: pipelines_at) return pipelines_avt;
  function vectorify(x: pipelines_at) return std_logic_vector;
  function structify(x: pipelines_avt) return pipelines_at;
  function structify(x: std_logic_vector) return pipelines_at;
  function nullify(x: pipelines_at) return pipelines_at;
  function nullify(x: pipelines_avt) return pipelines_avt;

  type sf2pt_rt is record
     dummy                :  std_logic_vector(8-1 downto 0);
     data_valid           :  std_logic;
  end record sf2pt_rt;
  constant SF2PT_LEN : integer := 9;
  subtype sf2pt_rvt is std_logic_vector(SF2PT_LEN-1 downto 0);
  function vectorify(x: sf2pt_rt) return sf2pt_rvt;
  function structify(x: sf2pt_rvt) return sf2pt_rt;
  function nullify (x: sf2pt_rt) return sf2pt_rt;

  type sf2pt_at is array(integer range <>) of sf2pt_rt;
  type sf2pt_avt is array(integer range <>) of sf2pt_rvt;
  function vectorify(x: sf2pt_at) return sf2pt_avt;
  function vectorify(x: sf2pt_at) return std_logic_vector;
  function structify(x: sf2pt_avt) return sf2pt_at;
  function structify(x: std_logic_vector) return sf2pt_at;
  function nullify(x: sf2pt_at) return sf2pt_at;
  function nullify(x: sf2pt_avt) return sf2pt_avt;

end package common_pkg;

------------------------------------------------------------

package body common_pkg is

  function structify(x: std_logic_vector) return signed is
  begin
    return signed(x);
  end function structify;
  function structify(x: std_logic_vector) return unsigned is
  begin
    return unsigned(x);
  end function structify;
  function structify(x: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(x);
  end function structify;
  function structify(x: std_logic_vector) return integer is
  begin
    return to_integer(unsigned(x));
  end function structify;

  function vectorify(x: signed) return std_logic_vector is
  begin
    return std_logic_vector(x);
  end function vectorify;
  function vectorify(x: unsigned) return std_logic_vector is
  begin
    return std_logic_vector(x);
  end function vectorify;
  function vectorify(x: std_logic_vector) return std_logic_vector is
  begin
    return x;
  end function vectorify;
  function vectorify(x: integer) return std_logic_vector is
  begin
    return std_logic_vector(to_unsigned(x, 32));
  end function vectorify;

  function nullify(x: std_logic) return std_logic is
  begin
    return '0';
  end function nullify;
  function nullify(x: std_logic_vector) return std_logic_vector is
  begin
    return (x'range => '0');
  end function nullify;
  function nullify(x: unsigned) return unsigned is
  begin
    return to_unsigned(0, x'length);
  end function nullify;
  function nullify(x: signed) return signed is
  begin
    return to_signed(0, x'length);
  end function nullify;

  function vectorify(x: slc_muid_rt) return slc_muid_rvt is
    variable y : slc_muid_rvt;
  begin
    y(19 downto 18)            := vectorify(x.slcid);
    y(17 downto 12)            := vectorify(x.slid);
    y(11 downto 0)             := vectorify(x.bcid);
    return y;
  end function vectorify;
  function structify(x: slc_muid_rvt) return slc_muid_rt is
    variable y : slc_muid_rt;
  begin
    y.slcid                    := structify(x(19 downto 18));
    y.slid                     := structify(x(17 downto 12));
    y.bcid                     := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify (x: slc_muid_rt) return slc_muid_rt is
    variable y : slc_muid_rt;
  begin
    y.slcid                    := nullify(x.slcid);
    y.slid                     := nullify(x.slid);
    y.bcid                     := nullify(x.bcid);
    return y;
  end function nullify;

  function vectorify(x: slc_chid_rt) return slc_chid_rvt is
    variable y : slc_chid_rvt;
  begin
    y(11 downto 9)             := vectorify(x.mdt_inn);
    y(8 downto 6)              := vectorify(x.mdt_mid);
    y(5 downto 3)              := vectorify(x.mdt_out);
    y(2 downto 0)              := vectorify(x.mdt_ext);
    return y;
  end function vectorify;
  function structify(x: slc_chid_rvt) return slc_chid_rt is
    variable y : slc_chid_rt;
  begin
    y.mdt_inn                  := structify(x(11 downto 9));
    y.mdt_mid                  := structify(x(8 downto 6));
    y.mdt_out                  := structify(x(5 downto 3));
    y.mdt_ext                  := structify(x(2 downto 0));
    return y;
  end function structify;
  function nullify (x: slc_chid_rt) return slc_chid_rt is
    variable y : slc_chid_rt;
  begin
    y.mdt_inn                  := nullify(x.mdt_inn);
    y.mdt_mid                  := nullify(x.mdt_mid);
    y.mdt_out                  := nullify(x.mdt_out);
    y.mdt_ext                  := nullify(x.mdt_ext);
    return y;
  end function nullify;

  function vectorify(x: slc_common_rt) return slc_common_rvt is
    variable y : slc_common_rvt;
  begin
    y(39 downto 37)            := x.tcid;
    y(36)                      := x.tcsent;
    y(35 downto 22)            := vectorify(x.pos_eta);
    y(21 downto 13)            := vectorify(x.pos_phi);
    y(12 downto 5)             := x.rpc_pt;
    y(4 downto 1)              := x.pt_th;
    y(0)                       := x.charge;
    return y;
  end function vectorify;
  function structify(x: slc_common_rvt) return slc_common_rt is
    variable y : slc_common_rt;
  begin
    y.tcid                     := x(39 downto 37);
    y.tcsent                   := x(36);
    y.pos_eta                  := structify(x(35 downto 22));
    y.pos_phi                  := structify(x(21 downto 13));
    y.rpc_pt                   := x(12 downto 5);
    y.pt_th                    := x(4 downto 1);
    y.charge                   := x(0);
    return y;
  end function structify;
  function nullify (x: slc_common_rt) return slc_common_rt is
    variable y : slc_common_rt;
  begin
    y.tcid                     := nullify(x.tcid);
    y.tcsent                   := nullify(x.tcsent);
    y.pos_eta                  := nullify(x.pos_eta);
    y.pos_phi                  := nullify(x.pos_phi);
    y.rpc_pt                   := nullify(x.rpc_pt);
    y.pt_th                    := nullify(x.pt_th);
    y.charge                   := nullify(x.charge);
    return y;
  end function nullify;

  function vectorify(x: slc_barrel_rt) return slc_barrel_rvt is
    variable y : slc_barrel_rvt;
  begin
    y(50 downto 43)            := x.spare_bits;
    y(42 downto 40)            := x.coin_type;
    y(39 downto 30)            := vectorify(x.z_rpc0);
    y(29 downto 20)            := vectorify(x.z_rpc1);
    y(19 downto 10)            := vectorify(x.z_rpc2);
    y(9 downto 0)              := vectorify(x.z_rpc3);
    return y;
  end function vectorify;
  function structify(x: slc_barrel_rvt) return slc_barrel_rt is
    variable y : slc_barrel_rt;
  begin
    y.spare_bits               := x(50 downto 43);
    y.coin_type                := x(42 downto 40);
    y.z_rpc0                   := structify(x(39 downto 30));
    y.z_rpc1                   := structify(x(29 downto 20));
    y.z_rpc2                   := structify(x(19 downto 10));
    y.z_rpc3                   := structify(x(9 downto 0));
    return y;
  end function structify;
  function nullify (x: slc_barrel_rt) return slc_barrel_rt is
    variable y : slc_barrel_rt;
  begin
    y.spare_bits               := nullify(x.spare_bits);
    y.coin_type                := nullify(x.coin_type);
    y.z_rpc0                   := nullify(x.z_rpc0);
    y.z_rpc1                   := nullify(x.z_rpc1);
    y.z_rpc2                   := nullify(x.z_rpc2);
    y.z_rpc3                   := nullify(x.z_rpc3);
    return y;
  end function nullify;

  function vectorify(x: slc_endcap_rt) return slc_endcap_rvt is
    variable y : slc_endcap_rvt;
  begin
    y(56 downto 49)            := x.spare_bits;
    y(48 downto 39)            := vectorify(x.r);
    y(38 downto 32)            := vectorify(x.angle_wrt_phi);
    y(31 downto 28)            := vectorify(x.angle_wrt_eta);
    y(27 downto 14)            := vectorify(x.nsw_eta);
    y(13 downto 6)             := vectorify(x.nsw_phi);
    y(5 downto 1)              := vectorify(x.nsw_angle_wrt_eta);
    y(0)                       := x.nsw_monitor;
    return y;
  end function vectorify;
  function structify(x: slc_endcap_rvt) return slc_endcap_rt is
    variable y : slc_endcap_rt;
  begin
    y.spare_bits               := x(56 downto 49);
    y.r                        := structify(x(48 downto 39));
    y.angle_wrt_phi            := structify(x(38 downto 32));
    y.angle_wrt_eta            := structify(x(31 downto 28));
    y.nsw_eta                  := structify(x(27 downto 14));
    y.nsw_phi                  := structify(x(13 downto 6));
    y.nsw_angle_wrt_eta        := structify(x(5 downto 1));
    y.nsw_monitor              := x(0);
    return y;
  end function structify;
  function nullify (x: slc_endcap_rt) return slc_endcap_rt is
    variable y : slc_endcap_rt;
  begin
    y.spare_bits               := nullify(x.spare_bits);
    y.r                        := nullify(x.r);
    y.angle_wrt_phi            := nullify(x.angle_wrt_phi);
    y.angle_wrt_eta            := nullify(x.angle_wrt_eta);
    y.nsw_eta                  := nullify(x.nsw_eta);
    y.nsw_phi                  := nullify(x.nsw_phi);
    y.nsw_angle_wrt_eta        := nullify(x.nsw_angle_wrt_eta);
    y.nsw_monitor              := nullify(x.nsw_monitor);
    return y;
  end function nullify;

  function vectorify(x: slc_rx_data_rt) return slc_rx_data_rvt is
    variable y : slc_rx_data_rvt;
  begin
    y(123 downto 104)          := vectorify(x.muid);
    y(103 downto 92)           := vectorify(x.chambers);
    y(91 downto 52)            := vectorify(x.common);
    y(51 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: slc_rx_data_rvt) return slc_rx_data_rt is
    variable y : slc_rx_data_rt;
  begin
    y.muid                     := structify(x(123 downto 104));
    y.chambers                 := structify(x(103 downto 92));
    y.common                   := structify(x(91 downto 52));
    y.specific                 := x(51 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: slc_rx_data_rt) return slc_rx_data_rt is
    variable y : slc_rx_data_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.chambers                 := nullify(x.chambers);
    y.common                   := nullify(x.common);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: slc_rx_data_at) return slc_rx_data_avt is
    variable y :  slc_rx_data_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: slc_rx_data_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*124-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-124) := vectorify(x(i));
      msb := msb - 124 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: slc_rx_data_avt) return slc_rx_data_at is
    variable y :  slc_rx_data_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return slc_rx_data_at is
    variable y :  slc_rx_data_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-124));
      msb := msb - 124 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: slc_rx_data_at) return slc_rx_data_at is
    variable y :  slc_rx_data_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: slc_rx_data_avt) return slc_rx_data_avt is
    variable y :  slc_rx_data_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: tar2hps_rt) return tar2hps_rvt is
    variable y : tar2hps_rvt;
  begin
    y(32 downto 24)            := vectorify(x.tube);
    y(23 downto 19)            := vectorify(x.layer);
    y(18 downto 1)             := vectorify(x.time);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: tar2hps_rvt) return tar2hps_rt is
    variable y : tar2hps_rt;
  begin
    y.tube                     := structify(x(32 downto 24));
    y.layer                    := structify(x(23 downto 19));
    y.time                     := structify(x(18 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: tar2hps_rt) return tar2hps_rt is
    variable y : tar2hps_rt;
  begin
    y.tube                     := nullify(x.tube);
    y.layer                    := nullify(x.layer);
    y.time                     := nullify(x.time);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: tar2hps_at) return tar2hps_avt is
    variable y :  tar2hps_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: tar2hps_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*33-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-33) := vectorify(x(i));
      msb := msb - 33 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: tar2hps_avt) return tar2hps_at is
    variable y :  tar2hps_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return tar2hps_at is
    variable y :  tar2hps_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-33));
      msb := msb - 33 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: tar2hps_at) return tar2hps_at is
    variable y :  tar2hps_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: tar2hps_avt) return tar2hps_avt is
    variable y :  tar2hps_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rvt is
    variable y : ucm_csf_barrel_rvt;
  begin
    y(21 downto 10)            := vectorify(x.mbar);
    y(9 downto 0)              := vectorify(x.z);
    return y;
  end function vectorify;
  function structify(x: ucm_csf_barrel_rvt) return ucm_csf_barrel_rt is
    variable y : ucm_csf_barrel_rt;
  begin
    y.mbar                     := structify(x(21 downto 10));
    y.z                        := structify(x(9 downto 0));
    return y;
  end function structify;
  function nullify (x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt is
    variable y : ucm_csf_barrel_rt;
  begin
    y.mbar                     := nullify(x.mbar);
    y.z                        := nullify(x.z);
    return y;
  end function nullify;

  function vectorify(x: ucm2hps_rt) return ucm2hps_rvt is
    variable y : ucm2hps_rvt;
  begin
    y(45 downto 26)            := vectorify(x.muid);
    y(25 downto 4)             := x.specific;
    y(3 downto 1)              := x.chamber_id;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm2hps_rvt) return ucm2hps_rt is
    variable y : ucm2hps_rt;
  begin
    y.muid                     := structify(x(45 downto 26));
    y.specific                 := x(25 downto 4);
    y.chamber_id               := x(3 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: ucm2hps_rt) return ucm2hps_rt is
    variable y : ucm2hps_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.specific                 := nullify(x.specific);
    y.chamber_id               := nullify(x.chamber_id);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm2hps_at) return ucm2hps_avt is
    variable y :  ucm2hps_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm2hps_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*46-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-46) := vectorify(x(i));
      msb := msb - 46 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm2hps_avt) return ucm2hps_at is
    variable y :  ucm2hps_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm2hps_at is
    variable y :  ucm2hps_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-46));
      msb := msb - 46 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm2hps_at) return ucm2hps_at is
    variable y :  ucm2hps_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm2hps_avt) return ucm2hps_avt is
    variable y :  ucm2hps_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pipeline_rt) return pipeline_rvt is
    variable y : pipeline_rvt;
  begin
    y(128 downto 109)          := vectorify(x.muid);
    y(108 downto 97)           := vectorify(x.chambers);
    y(96 downto 57)            := vectorify(x.common);
    y(56 downto 6)             := x.specific;
    y(5 downto 2)              := x.process_ch;
    y(1)                       := x.processed;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: pipeline_rvt) return pipeline_rt is
    variable y : pipeline_rt;
  begin
    y.muid                     := structify(x(128 downto 109));
    y.chambers                 := structify(x(108 downto 97));
    y.common                   := structify(x(96 downto 57));
    y.specific                 := x(56 downto 6);
    y.process_ch               := x(5 downto 2);
    y.processed                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: pipeline_rt) return pipeline_rt is
    variable y : pipeline_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.chambers                 := nullify(x.chambers);
    y.common                   := nullify(x.common);
    y.specific                 := nullify(x.specific);
    y.process_ch               := nullify(x.process_ch);
    y.processed                := nullify(x.processed);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: pipelines_at) return pipelines_avt is
    variable y :  pipelines_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pipelines_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*129-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-129) := vectorify(x(i));
      msb := msb - 129 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pipelines_avt) return pipelines_at is
    variable y :  pipelines_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pipelines_at is
    variable y :  pipelines_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-129));
      msb := msb - 129 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pipelines_at) return pipelines_at is
    variable y :  pipelines_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pipelines_avt) return pipelines_avt is
    variable y :  pipelines_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: sf2pt_rt) return sf2pt_rvt is
    variable y : sf2pt_rvt;
  begin
    y(8 downto 1)              := x.dummy;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: sf2pt_rvt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.dummy                    := x(8 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: sf2pt_rt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.dummy                    := nullify(x.dummy);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: sf2pt_at) return sf2pt_avt is
    variable y :  sf2pt_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: sf2pt_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*9-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-9) := vectorify(x(i));
      msb := msb - 9 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: sf2pt_avt) return sf2pt_at is
    variable y :  sf2pt_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return sf2pt_at is
    variable y :  sf2pt_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-9));
      msb := msb - 9 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: sf2pt_at) return sf2pt_at is
    variable y :  sf2pt_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: sf2pt_avt) return sf2pt_avt is
    variable y :  sf2pt_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body common_pkg;
