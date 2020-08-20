library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;

package l0mdt_dataformats_pkg is

  type slc_muid_rt is record
    slcid : unsigned(SLC_SLCID_LEN-1 downto 0);
    slid : unsigned(SLC_SLID_LEN-1 downto 0);
    bcid : unsigned(BCID_LEN-1 downto 0);
  end record slc_muid_rt;
  constant SLC_MUID_LEN : integer := 20;
  subtype slc_muid_rvt is std_logic_vector(SLC_MUID_LEN-1 downto 0);
  function vectorify(x: slc_muid_rt) return slc_muid_rvt;
  function structify(x: slc_muid_rvt) return slc_muid_rt;
  function nullify(x: slc_muid_rt) return slc_muid_rt;

  type slc_chid_rt is record
    mdt_inn : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    mdt_mid : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    mdt_out : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    mdt_ext : unsigned(SLC_CHAMBER_LEN-1 downto 0);
  end record slc_chid_rt;
  constant SLC_CHID_LEN : integer := 12;
  subtype slc_chid_rvt is std_logic_vector(SLC_CHID_LEN-1 downto 0);
  function vectorify(x: slc_chid_rt) return slc_chid_rvt;
  function structify(x: slc_chid_rvt) return slc_chid_rt;
  function nullify(x: slc_chid_rt) return slc_chid_rt;

  type slc_common_rt is record
    tcid : std_logic_vector(SLC_TCID_LEN-1 downto 0);
    tcsent : std_logic;
    pos_eta : signed(SLC_POS_ETA_LEN-1 downto 0);
    pos_phi : unsigned(SLC_POS_PHI_LEN-1 downto 0);
    rpc_pt : std_logic_vector(SLC_RPC_PT_LEN-1 downto 0);
    pt_th : std_logic_vector(SLC_PT_TH_LEN-1 downto 0);
    charge : std_logic;
  end record slc_common_rt;
  constant SLC_COMMON_LEN : integer := 40;
  subtype slc_common_rvt is std_logic_vector(SLC_COMMON_LEN-1 downto 0);
  function vectorify(x: slc_common_rt) return slc_common_rvt;
  function structify(x: slc_common_rvt) return slc_common_rt;
  function nullify(x: slc_common_rt) return slc_common_rt;

  type slc_barrel_rt is record
    spare_bits : std_logic_vector(SLC_B_SPARE_LEN-1 downto 0);
    coin_type : std_logic_vector(SLC_COIN_TYPE_LEN-1 downto 0);
    z_rpc0 : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc1 : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc2 : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc3 : signed(SLC_Z_RPC_LEN-1 downto 0);
  end record slc_barrel_rt;
  constant SLC_BARREL_LEN : integer := 51;
  subtype slc_barrel_rvt is std_logic_vector(SLC_BARREL_LEN-1 downto 0);
  function vectorify(x: slc_barrel_rt) return slc_barrel_rvt;
  function structify(x: slc_barrel_rvt) return slc_barrel_rt;
  function nullify(x: slc_barrel_rt) return slc_barrel_rt;

  type slc_endcap_rt is record
    spare_bits : std_logic_vector(SLC_E_SPARE_LEN-1 downto 0);
    r : unsigned(SLC_R_LEN-1 downto 0);
    angle_wrt_phi : signed(SLC_ANGLE_WRT_PHI_LEN-1 downto 0);
    angle_wrt_eta : signed(SLC_ANGLE_WRT_ETA_LEN-1 downto 0);
    nsw_eta : unsigned(SLC_NSW_ETA_LEN-1 downto 0);
    nsw_phi : unsigned(SLC_NSW_PHI_LEN-1 downto 0);
    nsw_angle_wrt_eta : signed(SLC_NSW_ANGLE_WRT_ETA_LEN-1 downto 0);
    nsw_monitor : std_logic;
  end record slc_endcap_rt;
  constant SLC_ENDCAP_LEN : integer := 57;
  subtype slc_endcap_rvt is std_logic_vector(SLC_ENDCAP_LEN-1 downto 0);
  function vectorify(x: slc_endcap_rt) return slc_endcap_rvt;
  function structify(x: slc_endcap_rvt) return slc_endcap_rt;
  function nullify(x: slc_endcap_rt) return slc_endcap_rt;

  type slc_rx_data_rt is record
    muid : slc_muid_rt;
    chambers : slc_chid_rt;
    common : slc_common_rt;
    -- specific: can be either slc_barrel_vt or slc_endcap_vt
    specific : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    data_valid : std_logic;
  end record slc_rx_data_rt;
  constant SLC_RX_DATA_LEN : integer := 124;
  subtype slc_rx_data_rvt is std_logic_vector(SLC_RX_DATA_LEN-1 downto 0);
  function vectorify(x: slc_rx_data_rt) return slc_rx_data_rvt;
  function structify(x: slc_rx_data_rvt) return slc_rx_data_rt;
  function nullify(x: slc_rx_data_rt) return slc_rx_data_rt;

  type mdt_tdc_rt is record
    ch : std_logic_vector(MDT_TDC_CH_LEN-1 downto 0);
    mode : std_logic_vector(MDT_TDC_MODE_LEN-1 downto 0);
    coarse : unsigned(MDT_TDC_COARSE_LEN-1 downto 0);
    fine : unsigned(MDT_TDC_FINE_LEN-1 downto 0);
    pw : unsigned(MDT_TDC_PW_LEN-1 downto 0);
  end record mdt_tdc_rt;
  constant MDT_TDC_LEN : integer := 32;
  subtype mdt_tdc_rvt is std_logic_vector(MDT_TDC_LEN-1 downto 0);
  function vectorify(x: mdt_tdc_rt) return mdt_tdc_rvt;
  function structify(x: mdt_tdc_rvt) return mdt_tdc_rt;
  function nullify(x: mdt_tdc_rt) return mdt_tdc_rt;

  type mdt_polmux_rt is record
    fiberID : std_logic_vector(MDT_FIBER_LEN-1 downto 0);
    muxID : std_logic_vector(MDT_MUXCH_LEN-1 downto 0);
    tdc : mdt_tdc_rt;
    data_valid : std_logic;
  end record mdt_polmux_rt;
  constant MDT_POLMUX_LEN : integer := 42;
  subtype mdt_polmux_rvt is std_logic_vector(MDT_POLMUX_LEN-1 downto 0);
  function vectorify(x: mdt_polmux_rt) return mdt_polmux_rvt;
  function structify(x: mdt_polmux_rvt) return mdt_polmux_rt;
  function nullify(x: mdt_polmux_rt) return mdt_polmux_rt;

  type tar2hps_rt is record
    tube : unsigned(MDT_TUBE_LEN-1 downto 0);
    layer : unsigned(MDT_LAYER_LEN-1 downto 0);
    chamber_id : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    time : unsigned(MDT_TIME_LEN-1 downto 0);
    data_valid : std_logic;
  end record tar2hps_rt;
  constant TAR2HPS_LEN : integer := 36;
  subtype tar2hps_rvt is std_logic_vector(TAR2HPS_LEN-1 downto 0);
  function vectorify(x: tar2hps_rt) return tar2hps_rvt;
  function structify(x: tar2hps_rvt) return tar2hps_rt;
  function nullify(x: tar2hps_rt) return tar2hps_rt;

  type ucm_csf_seed_rt is record
    muid : slc_muid_rt;
    mbar : unsigned(UCM_MBAR_LEN-1 downto 0);
    pos : unsigned(UCM_Z_ROI_LEN-1 downto 0);
    ang : unsigned(UCM_Z_ROI_LEN-1 downto 0);
    chamber_id : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    data_valid : std_logic;
  end record ucm_csf_seed_rt;
  constant UCM_CSF_SEED_LEN : integer := 55;
  subtype ucm_csf_seed_rvt is std_logic_vector(UCM_CSF_SEED_LEN-1 downto 0);
  function vectorify(x: ucm_csf_seed_rt) return ucm_csf_seed_rvt;
  function structify(x: ucm_csf_seed_rvt) return ucm_csf_seed_rt;
  function nullify(x: ucm_csf_seed_rt) return ucm_csf_seed_rt;

  type sf2pt_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    chamber_id : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    pos : signed(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf2pt_rt;
  constant SF2PT_LEN : integer := 59;
  subtype sf2pt_rvt is std_logic_vector(SF2PT_LEN-1 downto 0);
  function vectorify(x: sf2pt_rt) return sf2pt_rvt;
  function structify(x: sf2pt_rvt) return sf2pt_rt;
  function nullify(x: sf2pt_rt) return sf2pt_rt;

  type sf_seg_data_barrel_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    chamber_id : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    pos : signed(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf_seg_data_barrel_rt;
  constant SF_SEG_DATA_BARREL_LEN : integer := 59;
  subtype sf_seg_data_barrel_rvt is std_logic_vector(SF_SEG_DATA_BARREL_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt;
  function nullify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt;

  type sf_seg_data_endcap_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    chamber_id : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    pos : unsigned(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf_seg_data_endcap_rt;
  constant SF_SEG_DATA_ENDCAP_LEN : integer := 59;
  subtype sf_seg_data_endcap_rvt is std_logic_vector(SF_SEG_DATA_ENDCAP_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rvt;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt;
  function nullify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt;

  type sf2pt_aat is array(integer range <>) of sf2pt_rt;
  type sf2pt_aavt is array(integer range <>) of sf2pt_rvt;
  function vectorify(x: sf2pt_aat) return sf2pt_aavt;
  function vectorify(x: sf2pt_aat) return std_logic_vector;
  function structify(x: sf2pt_aavt) return sf2pt_aat;
  function structify(x: std_logic_vector) return sf2pt_aat;
  function nullify(x: sf2pt_aat) return sf2pt_aat;
  function nullify(x: sf2pt_aavt) return sf2pt_aavt;

  type ucm2pl_rt is record
    muid : slc_muid_rt;
    chambers : slc_chid_rt;
    common : slc_common_rt;
    specific : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    process_ch : std_logic_vector(4-1 downto 0);
    processed : std_logic;
    data_valid : std_logic;
  end record ucm2pl_rt;
  constant UCM2PL_LEN : integer := 129;
  subtype ucm2pl_rvt is std_logic_vector(UCM2PL_LEN-1 downto 0);
  function vectorify(x: ucm2pl_rt) return ucm2pl_rvt;
  function structify(x: ucm2pl_rvt) return ucm2pl_rt;
  function nullify(x: ucm2pl_rt) return ucm2pl_rt;

  type pl2pt_rt is record
    data_valid : std_logic;
    process_ch : std_logic_vector(4-1 downto 0);
    processed : std_logic;
    muid : slc_muid_rt;
    phimod : signed(UCM_PT_PHIMOD_LEN-1 downto 0);
    charge : std_logic;
  end record pl2pt_rt;
  constant PL2PT_LEN : integer := 35;
  subtype pl2pt_rvt is std_logic_vector(PL2PT_LEN-1 downto 0);
  function vectorify(x: pl2pt_rt) return pl2pt_rvt;
  function structify(x: pl2pt_rvt) return pl2pt_rt;
  function nullify(x: pl2pt_rt) return pl2pt_rt;

  type pl2pt_aat is array(integer range <>) of pl2pt_rt;
  type pl2pt_aavt is array(integer range <>) of pl2pt_rvt;
  function vectorify(x: pl2pt_aat) return pl2pt_aavt;
  function vectorify(x: pl2pt_aat) return std_logic_vector;
  function structify(x: pl2pt_aavt) return pl2pt_aat;
  function structify(x: std_logic_vector) return pl2pt_aat;
  function nullify(x: pl2pt_aat) return pl2pt_aat;
  function nullify(x: pl2pt_aavt) return pl2pt_aavt;

  type pl2mtc_rt is record
    common : slc_common_rt;
    process_ch : std_logic_vector(4-1 downto 0);
    processed : std_logic;
    data_valid : std_logic;
  end record pl2mtc_rt;
  constant PL2MTC_LEN : integer := 46;
  subtype pl2mtc_rvt is std_logic_vector(PL2MTC_LEN-1 downto 0);
  function vectorify(x: pl2mtc_rt) return pl2mtc_rvt;
  function structify(x: pl2mtc_rvt) return pl2mtc_rt;
  function nullify(x: pl2mtc_rt) return pl2mtc_rt;

  type tf2mtc_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    eta : signed(MTC_ETA_LEN-1 downto 0);
    pt : unsigned(MTC_PT_LEN-1 downto 0);
    pt_thr : std_logic_vector(MTC_PTTHR_LEN-1 downto 0);
    charge : std_logic;
    nseg : unsigned(MTC_NSEG_LEN-1 downto 0);
    quality : std_logic_vector(MTC_QUALITY_LEN-1 downto 0);
  end record tf2mtc_rt;
  constant TF2MTC_LEN : integer := 55;
  subtype tf2mtc_rvt is std_logic_vector(TF2MTC_LEN-1 downto 0);
  function vectorify(x: tf2mtc_rt) return tf2mtc_rvt;
  function structify(x: tf2mtc_rvt) return tf2mtc_rt;
  function nullify(x: tf2mtc_rt) return tf2mtc_rt;

  type tf2mtc_aat is array(integer range <>) of tf2mtc_rt;
  type tf2mtc_aavt is array(integer range <>) of tf2mtc_rvt;
  function vectorify(x: tf2mtc_aat) return tf2mtc_aavt;
  function vectorify(x: tf2mtc_aat) return std_logic_vector;
  function structify(x: tf2mtc_aavt) return tf2mtc_aat;
  function structify(x: std_logic_vector) return tf2mtc_aat;
  function nullify(x: tf2mtc_aat) return tf2mtc_aat;
  function nullify(x: tf2mtc_aavt) return tf2mtc_aavt;

  type mtc_out_rt is record
    common : slc_common_rt;
    data_valid : std_logic;
  end record mtc_out_rt;
  constant MTC_OUT_LEN : integer := 41;
  subtype mtc_out_rvt is std_logic_vector(MTC_OUT_LEN-1 downto 0);
  function vectorify(x: mtc_out_rt) return mtc_out_rvt;
  function structify(x: mtc_out_rvt) return mtc_out_rt;
  function nullify(x: mtc_out_rt) return mtc_out_rt;

  type mtc2nsp_rt is record
    common : slc_common_rt;
    data_valid : std_logic;
  end record mtc2nsp_rt;
  constant MTC2NSP_LEN : integer := 41;
  subtype mtc2nsp_rvt is std_logic_vector(MTC2NSP_LEN-1 downto 0);
  function vectorify(x: mtc2nsp_rt) return mtc2nsp_rvt;
  function structify(x: mtc2nsp_rvt) return mtc2nsp_rt;
  function nullify(x: mtc2nsp_rt) return mtc2nsp_rt;

end package l0mdt_dataformats_pkg;

------------------------------------------------------------

package body l0mdt_dataformats_pkg is

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
  function nullify(x: slc_muid_rt) return slc_muid_rt is
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
  function nullify(x: slc_chid_rt) return slc_chid_rt is
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
  function nullify(x: slc_common_rt) return slc_common_rt is
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
  function nullify(x: slc_barrel_rt) return slc_barrel_rt is
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
  function nullify(x: slc_endcap_rt) return slc_endcap_rt is
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
  function nullify(x: slc_rx_data_rt) return slc_rx_data_rt is
    variable y : slc_rx_data_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.chambers                 := nullify(x.chambers);
    y.common                   := nullify(x.common);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: mdt_tdc_rt) return mdt_tdc_rvt is
    variable y : mdt_tdc_rvt;
  begin
    y(31 downto 27)            := x.ch;
    y(26 downto 25)            := x.mode;
    y(24 downto 13)            := vectorify(x.coarse);
    y(12 downto 8)             := vectorify(x.fine);
    y(7 downto 0)              := vectorify(x.pw);
    return y;
  end function vectorify;
  function structify(x: mdt_tdc_rvt) return mdt_tdc_rt is
    variable y : mdt_tdc_rt;
  begin
    y.ch                       := x(31 downto 27);
    y.mode                     := x(26 downto 25);
    y.coarse                   := structify(x(24 downto 13));
    y.fine                     := structify(x(12 downto 8));
    y.pw                       := structify(x(7 downto 0));
    return y;
  end function structify;
  function nullify(x: mdt_tdc_rt) return mdt_tdc_rt is
    variable y : mdt_tdc_rt;
  begin
    y.ch                       := nullify(x.ch);
    y.mode                     := nullify(x.mode);
    y.coarse                   := nullify(x.coarse);
    y.fine                     := nullify(x.fine);
    y.pw                       := nullify(x.pw);
    return y;
  end function nullify;

  function vectorify(x: mdt_polmux_rt) return mdt_polmux_rvt is
    variable y : mdt_polmux_rvt;
  begin
    y(41 downto 37)            := x.fiberID;
    y(36 downto 33)            := x.muxID;
    y(32 downto 1)             := vectorify(x.tdc);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: mdt_polmux_rvt) return mdt_polmux_rt is
    variable y : mdt_polmux_rt;
  begin
    y.fiberID                  := x(41 downto 37);
    y.muxID                    := x(36 downto 33);
    y.tdc                      := structify(x(32 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: mdt_polmux_rt) return mdt_polmux_rt is
    variable y : mdt_polmux_rt;
  begin
    y.fiberID                  := nullify(x.fiberID);
    y.muxID                    := nullify(x.muxID);
    y.tdc                      := nullify(x.tdc);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: tar2hps_rt) return tar2hps_rvt is
    variable y : tar2hps_rvt;
  begin
    y(35 downto 27)            := vectorify(x.tube);
    y(26 downto 22)            := vectorify(x.layer);
    y(21 downto 19)            := vectorify(x.chamber_id);
    y(18 downto 1)             := vectorify(x.time);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: tar2hps_rvt) return tar2hps_rt is
    variable y : tar2hps_rt;
  begin
    y.tube                     := structify(x(35 downto 27));
    y.layer                    := structify(x(26 downto 22));
    y.chamber_id               := structify(x(21 downto 19));
    y.time                     := structify(x(18 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: tar2hps_rt) return tar2hps_rt is
    variable y : tar2hps_rt;
  begin
    y.tube                     := nullify(x.tube);
    y.layer                    := nullify(x.layer);
    y.chamber_id               := nullify(x.chamber_id);
    y.time                     := nullify(x.time);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm_csf_seed_rt) return ucm_csf_seed_rvt is
    variable y : ucm_csf_seed_rvt;
  begin
    y(54 downto 35)            := vectorify(x.muid);
    y(34 downto 24)            := vectorify(x.mbar);
    y(23 downto 14)            := vectorify(x.pos);
    y(13 downto 4)             := vectorify(x.ang);
    y(3 downto 1)              := x.chamber_id;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm_csf_seed_rvt) return ucm_csf_seed_rt is
    variable y : ucm_csf_seed_rt;
  begin
    y.muid                     := structify(x(54 downto 35));
    y.mbar                     := structify(x(34 downto 24));
    y.pos                      := structify(x(23 downto 14));
    y.ang                      := structify(x(13 downto 4));
    y.chamber_id               := x(3 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: ucm_csf_seed_rt) return ucm_csf_seed_rt is
    variable y : ucm_csf_seed_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.mbar                     := nullify(x.mbar);
    y.pos                      := nullify(x.pos);
    y.ang                      := nullify(x.ang);
    y.chamber_id               := nullify(x.chamber_id);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: sf2pt_rt) return sf2pt_rvt is
    variable y : sf2pt_rvt;
  begin
    y(58)                      := x.data_valid;
    y(57 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := x.chamber_id;
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf2pt_rvt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.data_valid               := x(58);
    y.muid                     := structify(x(57 downto 38));
    y.chamber_id               := x(37 downto 35);
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify(x: sf2pt_rt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.chamber_id               := nullify(x.chamber_id);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt is
    variable y : sf_seg_data_barrel_rvt;
  begin
    y(58)                      := x.data_valid;
    y(57 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := x.chamber_id;
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := x(58);
    y.muid                     := structify(x(57 downto 38));
    y.chamber_id               := x(37 downto 35);
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.chamber_id               := nullify(x.chamber_id);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rvt is
    variable y : sf_seg_data_endcap_rvt;
  begin
    y(58)                      := x.data_valid;
    y(57 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := x.chamber_id;
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := x(58);
    y.muid                     := structify(x(57 downto 38));
    y.chamber_id               := x(37 downto 35);
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.chamber_id               := nullify(x.chamber_id);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: sf2pt_aat) return sf2pt_aavt is
    variable y :  sf2pt_aavt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: sf2pt_aat) return std_logic_vector is
    variable y : std_logic_vector(x'length*59-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-59) := vectorify(x(i));
      msb := msb - 59 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: sf2pt_aavt) return sf2pt_aat is
    variable y :  sf2pt_aat(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return sf2pt_aat is
    variable y :  sf2pt_aat(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-59));
      msb := msb - 59 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: sf2pt_aat) return sf2pt_aat is
    variable y :  sf2pt_aat(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: sf2pt_aavt) return sf2pt_aavt is
    variable y :  sf2pt_aavt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm2pl_rt) return ucm2pl_rvt is
    variable y : ucm2pl_rvt;
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
  function structify(x: ucm2pl_rvt) return ucm2pl_rt is
    variable y : ucm2pl_rt;
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
  function nullify(x: ucm2pl_rt) return ucm2pl_rt is
    variable y : ucm2pl_rt;
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

  function vectorify(x: pl2pt_rt) return pl2pt_rvt is
    variable y : pl2pt_rvt;
  begin
    y(34)                      := x.data_valid;
    y(33 downto 30)            := x.process_ch;
    y(29)                      := x.processed;
    y(28 downto 9)             := vectorify(x.muid);
    y(8 downto 1)              := vectorify(x.phimod);
    y(0)                       := x.charge;
    return y;
  end function vectorify;
  function structify(x: pl2pt_rvt) return pl2pt_rt is
    variable y : pl2pt_rt;
  begin
    y.data_valid               := x(34);
    y.process_ch               := x(33 downto 30);
    y.processed                := x(29);
    y.muid                     := structify(x(28 downto 9));
    y.phimod                   := structify(x(8 downto 1));
    y.charge                   := x(0);
    return y;
  end function structify;
  function nullify(x: pl2pt_rt) return pl2pt_rt is
    variable y : pl2pt_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.process_ch               := nullify(x.process_ch);
    y.processed                := nullify(x.processed);
    y.muid                     := nullify(x.muid);
    y.phimod                   := nullify(x.phimod);
    y.charge                   := nullify(x.charge);
    return y;
  end function nullify;

  function vectorify(x: pl2pt_aat) return pl2pt_aavt is
    variable y :  pl2pt_aavt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pl2pt_aat) return std_logic_vector is
    variable y : std_logic_vector(x'length*35-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-35) := vectorify(x(i));
      msb := msb - 35 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pl2pt_aavt) return pl2pt_aat is
    variable y :  pl2pt_aat(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pl2pt_aat is
    variable y :  pl2pt_aat(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-35));
      msb := msb - 35 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pl2pt_aat) return pl2pt_aat is
    variable y :  pl2pt_aat(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pl2pt_aavt) return pl2pt_aavt is
    variable y :  pl2pt_aavt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pl2mtc_rt) return pl2mtc_rvt is
    variable y : pl2mtc_rvt;
  begin
    y(45 downto 6)             := vectorify(x.common);
    y(5 downto 2)              := x.process_ch;
    y(1)                       := x.processed;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: pl2mtc_rvt) return pl2mtc_rt is
    variable y : pl2mtc_rt;
  begin
    y.common                   := structify(x(45 downto 6));
    y.process_ch               := x(5 downto 2);
    y.processed                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: pl2mtc_rt) return pl2mtc_rt is
    variable y : pl2mtc_rt;
  begin
    y.common                   := nullify(x.common);
    y.process_ch               := nullify(x.process_ch);
    y.processed                := nullify(x.processed);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: tf2mtc_rt) return tf2mtc_rvt is
    variable y : tf2mtc_rvt;
  begin
    y(54)                      := x.data_valid;
    y(53 downto 34)            := vectorify(x.muid);
    y(33 downto 19)            := vectorify(x.eta);
    y(18 downto 10)            := vectorify(x.pt);
    y(9 downto 6)              := x.pt_thr;
    y(5)                       := x.charge;
    y(4 downto 3)              := vectorify(x.nseg);
    y(2 downto 0)              := x.quality;
    return y;
  end function vectorify;
  function structify(x: tf2mtc_rvt) return tf2mtc_rt is
    variable y : tf2mtc_rt;
  begin
    y.data_valid               := x(54);
    y.muid                     := structify(x(53 downto 34));
    y.eta                      := structify(x(33 downto 19));
    y.pt                       := structify(x(18 downto 10));
    y.pt_thr                   := x(9 downto 6);
    y.charge                   := x(5);
    y.nseg                     := structify(x(4 downto 3));
    y.quality                  := x(2 downto 0);
    return y;
  end function structify;
  function nullify(x: tf2mtc_rt) return tf2mtc_rt is
    variable y : tf2mtc_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.eta                      := nullify(x.eta);
    y.pt                       := nullify(x.pt);
    y.pt_thr                   := nullify(x.pt_thr);
    y.charge                   := nullify(x.charge);
    y.nseg                     := nullify(x.nseg);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: tf2mtc_aat) return tf2mtc_aavt is
    variable y :  tf2mtc_aavt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: tf2mtc_aat) return std_logic_vector is
    variable y : std_logic_vector(x'length*55-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-55) := vectorify(x(i));
      msb := msb - 55 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: tf2mtc_aavt) return tf2mtc_aat is
    variable y :  tf2mtc_aat(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return tf2mtc_aat is
    variable y :  tf2mtc_aat(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-55));
      msb := msb - 55 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: tf2mtc_aat) return tf2mtc_aat is
    variable y :  tf2mtc_aat(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: tf2mtc_aavt) return tf2mtc_aavt is
    variable y :  tf2mtc_aavt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mtc_out_rt) return mtc_out_rvt is
    variable y : mtc_out_rvt;
  begin
    y(40 downto 1)             := vectorify(x.common);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: mtc_out_rvt) return mtc_out_rt is
    variable y : mtc_out_rt;
  begin
    y.common                   := structify(x(40 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: mtc_out_rt) return mtc_out_rt is
    variable y : mtc_out_rt;
  begin
    y.common                   := nullify(x.common);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: mtc2nsp_rt) return mtc2nsp_rvt is
    variable y : mtc2nsp_rvt;
  begin
    y(40 downto 1)             := vectorify(x.common);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: mtc2nsp_rvt) return mtc2nsp_rt is
    variable y : mtc2nsp_rt;
  begin
    y.common                   := structify(x(40 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: mtc2nsp_rt) return mtc2nsp_rt is
    variable y : mtc2nsp_rt;
  begin
    y.common                   := nullify(x.common);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

end package body l0mdt_dataformats_pkg;
