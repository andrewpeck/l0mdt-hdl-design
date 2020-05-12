library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.custom_types_pkg.all;

package custom_types_davide_pkg is

  function structify(x: std_logic_vector) return signed;
  function structify(x: std_logic_vector) return unsigned;
  function structify(x: std_logic_vector) return std_logic_vector;

  function vectorify(x: signed) return std_logic_vector;
  function vectorify(x: unsigned) return std_logic_vector;
  function vectorify(x: std_logic_vector) return std_logic_vector;

  function nullify(x: std_logic) return std_logic;
  function nullify(x: std_logic_vector) return std_logic_vector;
  function nullify(x: unsigned) return unsigned;
  function nullify(x: signed) return signed;

  constant   MAX_NUM_HP           :  integer := LEN1;

  constant   MAX_NUM_HEG          :  integer := 3;

  constant   MAX_NUM_HPS          :  integer := 3;

  constant   MAX_NUM_SL           :  integer := 5;

  constant   SLC_SLCID_LEN        :  integer := 2;

  constant   SLC_SLID_LEN         :  integer := LEN1;

  constant   BCID_LEN             :  integer := 12;

  type slc_muidrt is record
     slcid                :  std_logic_vector(SLC_SLCID_LEN-1 downto 0);
     slid                 :  std_logic_vector(SLC_SLID_LEN-1 downto 0);
     bcid                 :  std_logic_vector(BCID_LEN-1 downto 0);
  end record slc_muidrt;
  constant SLC_MUIDLEN : integer := 20;
  subtype slc_muidrvt is std_logic_vector(SLC_MUIDLEN-1 downto 0);
  function vectorify(x: slc_muidrt) return slc_muidrvt;
  function structify(x: slc_muidrvt) return slc_muidrt;
  function nullify (x: slc_muidrt) return slc_muidrt;

  constant   SLC_CHAMBER_LEN      :  integer := 6;

  type slc_chid_rt is record
     mdt_inn              :  std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
     mdt_mid              :  std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
     mdt_out              :  std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
     mdt_ext              :  std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
  end record slc_chid_rt;
  constant SLC_CHID_LEN : integer := 24;
  subtype slc_chid_rvt is std_logic_vector(SLC_CHID_LEN-1 downto 0);
  function vectorify(x: slc_chid_rt) return slc_chid_rvt;
  function structify(x: slc_chid_rvt) return slc_chid_rt;
  function nullify (x: slc_chid_rt) return slc_chid_rt;

  constant   SLC_TCID_LEN         :  integer := 2;

  constant   SLC_TCSENT_LEN       :  integer := 1;

  constant   SLC_POS_ETA_LEN      :  integer := 15;

  constant   SLC_POS_ETA_MULT     :  real := 0.014;

  constant   SLC_POS_PHI_LEN      :  integer := 9;

  constant   SLC_POS_PHI_MULT     :  real := 0.012;

  constant   SLC_PT_TH_LEN        :  integer := 4;

  constant   SLC_CHARGE_LEN       :  integer := 1;

  type slc_common_rt is record
     tcid                 :  std_logic_vector(SLC_TCID_LEN-1 downto 0);
     tcsent               :  std_logic;
     pos_eta              :  signed(SLC_POS_ETA_LEN-1 downto 0);
     pos_phi              :  unsigned(SLC_POS_PHI_LEN-1 downto 0);
     pt_th                :  std_logic_vector(SLC_PT_TH_LEN-1 downto 0);
     charge               :  std_logic;
  end record slc_common_rt;
  constant SLC_COMMON_LEN : integer := 32;
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
     muid                 :  slc_muidrt;
     chambers             :  slc_chid_rt;
     common               :  slc_common_rt;
     specific             :  std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record slc_rx_data_rt;
  constant SLC_RX_DATA_LEN : integer := 128;
  subtype slc_rx_data_rvt is std_logic_vector(SLC_RX_DATA_LEN-1 downto 0);
  function vectorify(x: slc_rx_data_rt) return slc_rx_data_rvt;
  function structify(x: slc_rx_data_rvt) return slc_rx_data_rt;
  function nullify (x: slc_rx_data_rt) return slc_rx_data_rt;

  type ucm_prepro_rt is record
     muid                 :  slc_muidrt;
     chambers             :  slc_chid_rt;
     common               :  slc_common_rt;
     specific             :  std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record ucm_prepro_rt;
  constant UCM_PREPRO_LEN : integer := 128;
  subtype ucm_prepro_rvt is std_logic_vector(UCM_PREPRO_LEN-1 downto 0);
  function vectorify(x: ucm_prepro_rt) return ucm_prepro_rvt;
  function structify(x: ucm_prepro_rvt) return ucm_prepro_rt;
  function nullify (x: ucm_prepro_rt) return ucm_prepro_rt;

  constant   N_UCM_PREPROS        :  integer := 2;

  type ucm_prepros_at is array(N_UCM_PREPROS-1 downto 0) of ucm_prepro_rt;
  type ucm_prepros_avt is array(N_UCM_PREPROS-1 downto 0) of ucm_prepro_rvt;
  function vectorify(x: ucm_prepros_at) return ucm_prepros_avt;
  function vectorify(x: ucm_prepros_at) return std_logic_vector;
  function structify(x: ucm_prepros_avt) return ucm_prepros_at;
  function structify(x: std_logic_vector) return ucm_prepros_at;
  function nullify(x: ucm_prepros_at) return ucm_prepros_at;
  function nullify(x: ucm_prepros_avt) return ucm_prepros_avt;

  constant   N_UCM_CSW_DEST       :  integer := 2;

  type ucm_csw_dest_at is array(N_UCM_CSW_DEST-1 downto 0) of std_logic_vector(4-1 downto 0);
  type ucm_csw_dest_avt is array(N_UCM_CSW_DEST-1 downto 0) of std_logic_vector(4-1 downto 0);
  function vectorify(x: ucm_csw_dest_at) return ucm_csw_dest_avt;
  function vectorify(x: ucm_csw_dest_at) return std_logic_vector;
  function structify(x: ucm_csw_dest_avt) return ucm_csw_dest_at;
  function structify(x: std_logic_vector) return ucm_csw_dest_at;
  function nullify(x: ucm_csw_dest_at) return ucm_csw_dest_at;
  function nullify(x: ucm_csw_dest_avt) return ucm_csw_dest_avt;

  type ucm_csw_control_rt is record
     data_present         :  std_logic_vector(MAX_NUM_SL-1 downto 0);
     addr_orig            :  ucm_csw_dest_at;
  end record ucm_csw_control_rt;
  constant UCM_CSW_CONTROL_LEN : integer := 13;
  subtype ucm_csw_control_rvt is std_logic_vector(UCM_CSW_CONTROL_LEN-1 downto 0);
  function vectorify(x: ucm_csw_control_rt) return ucm_csw_control_rvt;
  function structify(x: ucm_csw_control_rvt) return ucm_csw_control_rt;
  function nullify (x: ucm_csw_control_rt) return ucm_csw_control_rt;

  type ucm_ctrl_rt is record
     sel                  :  std_logic;
     addr                 :  std_logic_vector(4-1 downto 0);
  end record ucm_ctrl_rt;
  constant UCM_CTRL_LEN : integer := 5;
  subtype ucm_ctrl_rvt is std_logic_vector(UCM_CTRL_LEN-1 downto 0);
  function vectorify(x: ucm_ctrl_rt) return ucm_ctrl_rvt;
  function structify(x: ucm_ctrl_rvt) return ucm_ctrl_rt;
  function nullify (x: ucm_ctrl_rt) return ucm_ctrl_rt;

  type ucm_ctrl_a_at is array(integer range <>) of ucm_ctrl_rt;
  type ucm_ctrl_a_avt is array(integer range <>) of ucm_ctrl_rvt;
  function vectorify(x: ucm_ctrl_a_at) return ucm_ctrl_a_avt;
  function vectorify(x: ucm_ctrl_a_at) return std_logic_vector;
  function structify(x: ucm_ctrl_a_avt) return ucm_ctrl_a_at;
  function structify(x: std_logic_vector) return ucm_ctrl_a_at;
  function nullify(x: ucm_ctrl_a_at) return ucm_ctrl_a_at;
  function nullify(x: ucm_ctrl_a_avt) return ucm_ctrl_a_avt;

  constant   UCM_MBAR_LEN         :  integer := 12;

  constant   UCM_Z_ROI_LEN        :  integer := 10;

  constant   UCM_R_ROI_LEN        :  integer := 4;

  constant   UCM_PHI_LEN          :  integer := 14;

  constant   UCM_ETA_LEN          :  integer := 8;

  constant   UCM_CHAMBER_ID_LEN   :  integer := 8;

  type ucm_csf_seed_rt is record
     muid                 :  slc_muidrt;
     mbar                 :  signed(UCM_MBAR_LEN-1 downto 0);
     pos                  :  unsigned(UCM_Z_ROI_LEN-1 downto 0);
     chamber_id           :  std_logic_vector(UCM_CHAMBER_ID_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record ucm_csf_seed_rt;
  constant UCM_CSF_SEED_LEN : integer := 51;
  subtype ucm_csf_seed_rvt is std_logic_vector(UCM_CSF_SEED_LEN-1 downto 0);
  function vectorify(x: ucm_csf_seed_rt) return ucm_csf_seed_rvt;
  function structify(x: ucm_csf_seed_rvt) return ucm_csf_seed_rt;
  function nullify (x: ucm_csf_seed_rt) return ucm_csf_seed_rt;

  type ucm_csf_seed_a_at is array(integer range <>) of ucm_csf_seed_rt;
  type ucm_csf_seed_a_avt is array(integer range <>) of ucm_csf_seed_rvt;
  function vectorify(x: ucm_csf_seed_a_at) return ucm_csf_seed_a_avt;
  function vectorify(x: ucm_csf_seed_a_at) return std_logic_vector;
  function structify(x: ucm_csf_seed_a_avt) return ucm_csf_seed_a_at;
  function structify(x: std_logic_vector) return ucm_csf_seed_a_at;
  function nullify(x: ucm_csf_seed_a_at) return ucm_csf_seed_a_at;
  function nullify(x: ucm_csf_seed_a_avt) return ucm_csf_seed_a_avt;

  type pipeline_data_rt is record
     muid                 :  slc_muidrt;
     pl_common            :  slc_common_rt;
     specific             :  std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
     process_ch           :  std_logic_vector(4-1 downto 0);
     processed            :  std_logic;
     data_valid           :  std_logic;
  end record pipeline_data_rt;
  constant PIPELINE_DATA_LEN : integer := 109;
  subtype pipeline_data_rvt is std_logic_vector(PIPELINE_DATA_LEN-1 downto 0);
  function vectorify(x: pipeline_data_rt) return pipeline_data_rvt;
  function structify(x: pipeline_data_rvt) return pipeline_data_rt;
  function nullify (x: pipeline_data_rt) return pipeline_data_rt;

  type pipeline_data_a_at is array(integer range <>) of pipeline_data_rt;
  type pipeline_data_a_avt is array(integer range <>) of pipeline_data_rvt;
  function vectorify(x: pipeline_data_a_at) return pipeline_data_a_avt;
  function vectorify(x: pipeline_data_a_at) return std_logic_vector;
  function structify(x: pipeline_data_a_avt) return pipeline_data_a_at;
  function structify(x: std_logic_vector) return pipeline_data_a_at;
  function nullify(x: pipeline_data_a_at) return pipeline_data_a_at;
  function nullify(x: pipeline_data_a_avt) return pipeline_data_a_avt;

  constant   MDT_TDC_CH_LEN       :  integer := 5;

  constant   MDT_TDC_MODE_LEN     :  integer := 2;

  constant   MDT_TDC_COARSE_LEN   :  integer := 12;

  constant   MDT_TDC_FINE_LEN     :  integer := 5;

  constant   MDT_TDC_PW_LEN       :  integer := 8;

  type mdt_tdc_rt is record
     ch                   :  std_logic_vector(MDT_TDC_CH_LEN-1 downto 0);
     mode                 :  std_logic_vector(MDT_TDC_MODE_LEN-1 downto 0);
     coarse               :  unsigned(MDT_TDC_COARSE_LEN-1 downto 0);
     fine                 :  unsigned(MDT_TDC_FINE_LEN-1 downto 0);
     pw                   :  unsigned(MDT_TDC_PW_LEN-1 downto 0);
  end record mdt_tdc_rt;
  constant MDT_TDC_LEN : integer := 32;
  subtype mdt_tdc_rvt is std_logic_vector(MDT_TDC_LEN-1 downto 0);
  function vectorify(x: mdt_tdc_rt) return mdt_tdc_rvt;
  function structify(x: mdt_tdc_rvt) return mdt_tdc_rt;
  function nullify (x: mdt_tdc_rt) return mdt_tdc_rt;

  constant   MDT_FIBER_LEN        :  integer := 5;

  constant   MDT_MUXCH_LEN        :  integer := 4;

  type mdt_pullmux_data_rt is record
     fiberID              :  std_logic_vector(MDT_FIBER_LEN-1 downto 0);
     muxID                :  std_logic_vector(MDT_MUXCH_LEN-1 downto 0);
     tdc                  :  mdt_tdc_rt;
     data_valid           :  std_logic;
  end record mdt_pullmux_data_rt;
  constant MDT_PULLMUX_DATA_LEN : integer := 42;
  subtype mdt_pullmux_data_rvt is std_logic_vector(MDT_PULLMUX_DATA_LEN-1 downto 0);
  function vectorify(x: mdt_pullmux_data_rt) return mdt_pullmux_data_rvt;
  function structify(x: mdt_pullmux_data_rvt) return mdt_pullmux_data_rt;
  function nullify (x: mdt_pullmux_data_rt) return mdt_pullmux_data_rt;

  constant   MDT_TUBE_LEN         :  integer := 5;

  constant   MDT_LAYER_LEN        :  integer := 9;

  constant   MDT_TIME_LEN         :  integer := 18;

  type mdt_tar_data_rt is record
     tube                 :  std_logic_vector(MDT_TUBE_LEN-1 downto 0);
     layer                :  std_logic_vector(MDT_LAYER_LEN-1 downto 0);
     time                 :  unsigned(MDT_TIME_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record mdt_tar_data_rt;
  constant MDT_TAR_DATA_LEN : integer := 33;
  subtype mdt_tar_data_rvt is std_logic_vector(MDT_TAR_DATA_LEN-1 downto 0);
  function vectorify(x: mdt_tar_data_rt) return mdt_tar_data_rvt;
  function structify(x: mdt_tar_data_rvt) return mdt_tar_data_rt;
  function nullify (x: mdt_tar_data_rt) return mdt_tar_data_rt;

  type mdt_tar_data_a_at is array(integer range <>) of mdt_tar_data_rt;
  type mdt_tar_data_a_avt is array(integer range <>) of mdt_tar_data_rvt;
  function vectorify(x: mdt_tar_data_a_at) return mdt_tar_data_a_avt;
  function vectorify(x: mdt_tar_data_a_at) return std_logic_vector;
  function structify(x: mdt_tar_data_a_avt) return mdt_tar_data_a_at;
  function structify(x: std_logic_vector) return mdt_tar_data_a_at;
  function nullify(x: mdt_tar_data_a_at) return mdt_tar_data_a_at;
  function nullify(x: mdt_tar_data_a_avt) return mdt_tar_data_a_avt;

  constant   MDT_RADIUS_LEN       :  integer := 9;

  constant   MDT_LOCAL_AXI_LEN    :  integer := 14;

  type hp_hit_data_rt is record
     local_z              :  signed(MDT_LOCAL_AXI_LEN-1 downto 0);
     local_x              :  unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
     radius               :  unsigned(MDT_RADIUS_LEN-1 downto 0);
     multilayer           :  std_logic;
     data_valid           :  std_logic;
  end record hp_hit_data_rt;
  constant HP_HIT_DATA_LEN : integer := 39;
  subtype hp_hit_data_rvt is std_logic_vector(HP_HIT_DATA_LEN-1 downto 0);
  function vectorify(x: hp_hit_data_rt) return hp_hit_data_rvt;
  function structify(x: hp_hit_data_rvt) return hp_hit_data_rt;
  function nullify (x: hp_hit_data_rt) return hp_hit_data_rt;

  type hp_hit_data_a_at is array(integer range <>) of hp_hit_data_rt;
  type hp_hit_data_a_avt is array(integer range <>) of hp_hit_data_rvt;
  function vectorify(x: hp_hit_data_a_at) return hp_hit_data_a_avt;
  function vectorify(x: hp_hit_data_a_at) return std_logic_vector;
  function structify(x: hp_hit_data_a_avt) return hp_hit_data_a_at;
  function structify(x: std_logic_vector) return hp_hit_data_a_at;
  function nullify(x: hp_hit_data_a_at) return hp_hit_data_a_at;
  function nullify(x: hp_hit_data_a_avt) return hp_hit_data_a_avt;

  constant   SF_SEG_POS_WIDTH     :  integer := 19;

  constant   SF_SEG_ANG_WIDTH     :  integer := 15;

  constant   SF_SEG_ANG_MULTI     :  real := 4096.0;

  constant   SF_SEG_ANG_MULTI_WIDTH :  integer := 12;

  type sf_seg_data_barrel_rt is record
     data_valid           :  std_logic;
     muid                 :  slc_muidrt;
     chamber_id           :  std_logic_vector(UCM_CHAMBER_ID_LEN-1 downto 0);
     pos                  :  signed(SF_SEG_POS_WIDTH-1 downto 0);
     angle                :  signed(SF_SEG_ANG_WIDTH-1 downto 0);
     quality              :  std_logic;
  end record sf_seg_data_barrel_rt;
  constant SF_SEG_DATA_BARREL_LEN : integer := 64;
  subtype sf_seg_data_barrel_rvt is std_logic_vector(SF_SEG_DATA_BARREL_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt;
  function nullify (x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt;

  type sf_seg_data_endcap_rt is record
     data_valid           :  std_logic;
     muid                 :  slc_muidrt;
     chamber_id           :  std_logic_vector(UCM_CHAMBER_ID_LEN-1 downto 0);
     pos                  :  unsigned(SF_SEG_POS_WIDTH-1 downto 0);
     angle                :  signed(SF_SEG_ANG_WIDTH-1 downto 0);
     quality              :  std_logic;
  end record sf_seg_data_endcap_rt;
  constant SF_SEG_DATA_ENDCAP_LEN : integer := 64;
  subtype sf_seg_data_endcap_rvt is std_logic_vector(SF_SEG_DATA_ENDCAP_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rvt;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt;
  function nullify (x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt;

end package custom_types_davide_pkg;

------------------------------------------------------------

package body custom_types_davide_pkg is

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

  function vectorify(x: slc_muidrt) return slc_muidrvt is
    variable y : slc_muidrvt;
  begin
    y(19 downto 18)            := x.slcid;
    y(17 downto 12)            := x.slid;
    y(11 downto 0)             := x.bcid;
    return y;
  end function vectorify;
  function structify(x: slc_muidrvt) return slc_muidrt is
    variable y : slc_muidrt;
  begin
    y.slcid                    := x(19 downto 18);
    y.slid                     := x(17 downto 12);
    y.bcid                     := x(11 downto 0);
    return y;
  end function structify;
  function nullify (x: slc_muidrt) return slc_muidrt is
    variable y : slc_muidrt;
  begin
    y.slcid                    := nullify(x.slcid);
    y.slid                     := nullify(x.slid);
    y.bcid                     := nullify(x.bcid);
    return y;
  end function nullify;

  function vectorify(x: slc_chid_rt) return slc_chid_rvt is
    variable y : slc_chid_rvt;
  begin
    y(23 downto 18)            := x.mdt_inn;
    y(17 downto 12)            := x.mdt_mid;
    y(11 downto 6)             := x.mdt_out;
    y(5 downto 0)              := x.mdt_ext;
    return y;
  end function vectorify;
  function structify(x: slc_chid_rvt) return slc_chid_rt is
    variable y : slc_chid_rt;
  begin
    y.mdt_inn                  := x(23 downto 18);
    y.mdt_mid                  := x(17 downto 12);
    y.mdt_out                  := x(11 downto 6);
    y.mdt_ext                  := x(5 downto 0);
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
    y(31 downto 30)            := x.tcid;
    y(29)                      := x.tcsent;
    y(28 downto 14)            := vectorify(x.pos_eta);
    y(13 downto 5)             := vectorify(x.pos_phi);
    y(4 downto 1)              := x.pt_th;
    y(0)                       := x.charge;
    return y;
  end function vectorify;
  function structify(x: slc_common_rvt) return slc_common_rt is
    variable y : slc_common_rt;
  begin
    y.tcid                     := x(31 downto 30);
    y.tcsent                   := x(29);
    y.pos_eta                  := structify(x(28 downto 14));
    y.pos_phi                  := structify(x(13 downto 5));
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
    y(127 downto 108)          := vectorify(x.muid);
    y(107 downto 84)           := vectorify(x.chambers);
    y(83 downto 52)            := vectorify(x.common);
    y(51 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: slc_rx_data_rvt) return slc_rx_data_rt is
    variable y : slc_rx_data_rt;
  begin
    y.muid                     := structify(x(127 downto 108));
    y.chambers                 := structify(x(107 downto 84));
    y.common                   := structify(x(83 downto 52));
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

  function vectorify(x: ucm_prepro_rt) return ucm_prepro_rvt is
    variable y : ucm_prepro_rvt;
  begin
    y(127 downto 108)          := vectorify(x.muid);
    y(107 downto 84)           := vectorify(x.chambers);
    y(83 downto 52)            := vectorify(x.common);
    y(51 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm_prepro_rvt) return ucm_prepro_rt is
    variable y : ucm_prepro_rt;
  begin
    y.muid                     := structify(x(127 downto 108));
    y.chambers                 := structify(x(107 downto 84));
    y.common                   := structify(x(83 downto 52));
    y.specific                 := x(51 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: ucm_prepro_rt) return ucm_prepro_rt is
    variable y : ucm_prepro_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.chambers                 := nullify(x.chambers);
    y.common                   := nullify(x.common);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm_prepros_at) return ucm_prepros_avt is
    variable y :  ucm_prepros_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_prepros_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*128-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-128) := vectorify(x(i));
      msb := msb - 128 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_prepros_avt) return ucm_prepros_at is
    variable y :  ucm_prepros_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_prepros_at is
    variable y :  ucm_prepros_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-128));
      msb := msb - 128 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_prepros_at) return ucm_prepros_at is
    variable y :  ucm_prepros_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_prepros_avt) return ucm_prepros_avt is
    variable y :  ucm_prepros_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_csw_dest_at) return ucm_csw_dest_avt is
    variable y :  ucm_csw_dest_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_csw_dest_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*4-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-4) := vectorify(x(i));
      msb := msb - 4 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_csw_dest_avt) return ucm_csw_dest_at is
    variable y :  ucm_csw_dest_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_csw_dest_at is
    variable y :  ucm_csw_dest_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-4));
      msb := msb - 4 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_csw_dest_at) return ucm_csw_dest_at is
    variable y :  ucm_csw_dest_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_csw_dest_avt) return ucm_csw_dest_avt is
    variable y :  ucm_csw_dest_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_csw_control_rt) return ucm_csw_control_rvt is
    variable y : ucm_csw_control_rvt;
  begin
    y(12 downto 8)             := x.data_present;
    y(7 downto 0)              := vectorify(x.addr_orig);
    return y;
  end function vectorify;
  function structify(x: ucm_csw_control_rvt) return ucm_csw_control_rt is
    variable y : ucm_csw_control_rt;
  begin
    y.data_present             := x(12 downto 8);
    y.addr_orig                := structify(x(7 downto 0));
    return y;
  end function structify;
  function nullify (x: ucm_csw_control_rt) return ucm_csw_control_rt is
    variable y : ucm_csw_control_rt;
  begin
    y.data_present             := nullify(x.data_present);
    y.addr_orig                := nullify(x.addr_orig);
    return y;
  end function nullify;

  function vectorify(x: ucm_ctrl_rt) return ucm_ctrl_rvt is
    variable y : ucm_ctrl_rvt;
  begin
    y(4)                       := x.sel;
    y(3 downto 0)              := x.addr;
    return y;
  end function vectorify;
  function structify(x: ucm_ctrl_rvt) return ucm_ctrl_rt is
    variable y : ucm_ctrl_rt;
  begin
    y.sel                      := x(4);
    y.addr                     := x(3 downto 0);
    return y;
  end function structify;
  function nullify (x: ucm_ctrl_rt) return ucm_ctrl_rt is
    variable y : ucm_ctrl_rt;
  begin
    y.sel                      := nullify(x.sel);
    y.addr                     := nullify(x.addr);
    return y;
  end function nullify;

  function vectorify(x: ucm_ctrl_a_at) return ucm_ctrl_a_avt is
    variable y :  ucm_ctrl_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_ctrl_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*5-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-5) := vectorify(x(i));
      msb := msb - 5 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_ctrl_a_avt) return ucm_ctrl_a_at is
    variable y :  ucm_ctrl_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_ctrl_a_at is
    variable y :  ucm_ctrl_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-5));
      msb := msb - 5 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_ctrl_a_at) return ucm_ctrl_a_at is
    variable y :  ucm_ctrl_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_ctrl_a_avt) return ucm_ctrl_a_avt is
    variable y :  ucm_ctrl_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_csf_seed_rt) return ucm_csf_seed_rvt is
    variable y : ucm_csf_seed_rvt;
  begin
    y(50 downto 31)            := vectorify(x.muid);
    y(30 downto 19)            := vectorify(x.mbar);
    y(18 downto 9)             := vectorify(x.pos);
    y(8 downto 1)              := x.chamber_id;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm_csf_seed_rvt) return ucm_csf_seed_rt is
    variable y : ucm_csf_seed_rt;
  begin
    y.muid                     := structify(x(50 downto 31));
    y.mbar                     := structify(x(30 downto 19));
    y.pos                      := structify(x(18 downto 9));
    y.chamber_id               := x(8 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: ucm_csf_seed_rt) return ucm_csf_seed_rt is
    variable y : ucm_csf_seed_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.mbar                     := nullify(x.mbar);
    y.pos                      := nullify(x.pos);
    y.chamber_id               := nullify(x.chamber_id);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm_csf_seed_a_at) return ucm_csf_seed_a_avt is
    variable y :  ucm_csf_seed_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_csf_seed_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*51-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-51) := vectorify(x(i));
      msb := msb - 51 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_csf_seed_a_avt) return ucm_csf_seed_a_at is
    variable y :  ucm_csf_seed_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_csf_seed_a_at is
    variable y :  ucm_csf_seed_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-51));
      msb := msb - 51 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_csf_seed_a_at) return ucm_csf_seed_a_at is
    variable y :  ucm_csf_seed_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_csf_seed_a_avt) return ucm_csf_seed_a_avt is
    variable y :  ucm_csf_seed_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pipeline_data_rt) return pipeline_data_rvt is
    variable y : pipeline_data_rvt;
  begin
    y(108 downto 89)           := vectorify(x.muid);
    y(88 downto 57)            := vectorify(x.pl_common);
    y(56 downto 6)             := x.specific;
    y(5 downto 2)              := x.process_ch;
    y(1)                       := x.processed;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: pipeline_data_rvt) return pipeline_data_rt is
    variable y : pipeline_data_rt;
  begin
    y.muid                     := structify(x(108 downto 89));
    y.pl_common                := structify(x(88 downto 57));
    y.specific                 := x(56 downto 6);
    y.process_ch               := x(5 downto 2);
    y.processed                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: pipeline_data_rt) return pipeline_data_rt is
    variable y : pipeline_data_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.pl_common                := nullify(x.pl_common);
    y.specific                 := nullify(x.specific);
    y.process_ch               := nullify(x.process_ch);
    y.processed                := nullify(x.processed);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: pipeline_data_a_at) return pipeline_data_a_avt is
    variable y :  pipeline_data_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pipeline_data_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*109-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-109) := vectorify(x(i));
      msb := msb - 109 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pipeline_data_a_avt) return pipeline_data_a_at is
    variable y :  pipeline_data_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pipeline_data_a_at is
    variable y :  pipeline_data_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-109));
      msb := msb - 109 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pipeline_data_a_at) return pipeline_data_a_at is
    variable y :  pipeline_data_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pipeline_data_a_avt) return pipeline_data_a_avt is
    variable y :  pipeline_data_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
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
  function nullify (x: mdt_tdc_rt) return mdt_tdc_rt is
    variable y : mdt_tdc_rt;
  begin
    y.ch                       := nullify(x.ch);
    y.mode                     := nullify(x.mode);
    y.coarse                   := nullify(x.coarse);
    y.fine                     := nullify(x.fine);
    y.pw                       := nullify(x.pw);
    return y;
  end function nullify;

  function vectorify(x: mdt_pullmux_data_rt) return mdt_pullmux_data_rvt is
    variable y : mdt_pullmux_data_rvt;
  begin
    y(41 downto 37)            := x.fiberID;
    y(36 downto 33)            := x.muxID;
    y(32 downto 1)             := vectorify(x.tdc);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: mdt_pullmux_data_rvt) return mdt_pullmux_data_rt is
    variable y : mdt_pullmux_data_rt;
  begin
    y.fiberID                  := x(41 downto 37);
    y.muxID                    := x(36 downto 33);
    y.tdc                      := structify(x(32 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: mdt_pullmux_data_rt) return mdt_pullmux_data_rt is
    variable y : mdt_pullmux_data_rt;
  begin
    y.fiberID                  := nullify(x.fiberID);
    y.muxID                    := nullify(x.muxID);
    y.tdc                      := nullify(x.tdc);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: mdt_tar_data_rt) return mdt_tar_data_rvt is
    variable y : mdt_tar_data_rvt;
  begin
    y(32 downto 28)            := x.tube;
    y(27 downto 19)            := x.layer;
    y(18 downto 1)             := vectorify(x.time);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: mdt_tar_data_rvt) return mdt_tar_data_rt is
    variable y : mdt_tar_data_rt;
  begin
    y.tube                     := x(32 downto 28);
    y.layer                    := x(27 downto 19);
    y.time                     := structify(x(18 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: mdt_tar_data_rt) return mdt_tar_data_rt is
    variable y : mdt_tar_data_rt;
  begin
    y.tube                     := nullify(x.tube);
    y.layer                    := nullify(x.layer);
    y.time                     := nullify(x.time);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: mdt_tar_data_a_at) return mdt_tar_data_a_avt is
    variable y :  mdt_tar_data_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mdt_tar_data_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*33-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-33) := vectorify(x(i));
      msb := msb - 33 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mdt_tar_data_a_avt) return mdt_tar_data_a_at is
    variable y :  mdt_tar_data_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mdt_tar_data_a_at is
    variable y :  mdt_tar_data_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-33));
      msb := msb - 33 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mdt_tar_data_a_at) return mdt_tar_data_a_at is
    variable y :  mdt_tar_data_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mdt_tar_data_a_avt) return mdt_tar_data_a_avt is
    variable y :  mdt_tar_data_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: hp_hit_data_rt) return hp_hit_data_rvt is
    variable y : hp_hit_data_rvt;
  begin
    y(38 downto 25)            := vectorify(x.local_z);
    y(24 downto 11)            := vectorify(x.local_x);
    y(10 downto 2)             := vectorify(x.radius);
    y(1)                       := x.multilayer;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hit_data_rvt) return hp_hit_data_rt is
    variable y : hp_hit_data_rt;
  begin
    y.local_z                  := structify(x(38 downto 25));
    y.local_x                  := structify(x(24 downto 11));
    y.radius                   := structify(x(10 downto 2));
    y.multilayer               := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hp_hit_data_rt) return hp_hit_data_rt is
    variable y : hp_hit_data_rt;
  begin
    y.local_z                  := nullify(x.local_z);
    y.local_x                  := nullify(x.local_x);
    y.radius                   := nullify(x.radius);
    y.multilayer               := nullify(x.multilayer);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: hp_hit_data_a_at) return hp_hit_data_a_avt is
    variable y :  hp_hit_data_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: hp_hit_data_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*39-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-39) := vectorify(x(i));
      msb := msb - 39 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: hp_hit_data_a_avt) return hp_hit_data_a_at is
    variable y :  hp_hit_data_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return hp_hit_data_a_at is
    variable y :  hp_hit_data_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-39));
      msb := msb - 39 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: hp_hit_data_a_at) return hp_hit_data_a_at is
    variable y :  hp_hit_data_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: hp_hit_data_a_avt) return hp_hit_data_a_avt is
    variable y :  hp_hit_data_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt is
    variable y : sf_seg_data_barrel_rvt;
  begin
    y(63)                      := x.data_valid;
    y(62 downto 43)            := vectorify(x.muid);
    y(42 downto 35)            := x.chamber_id;
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := x(63);
    y.muid                     := structify(x(62 downto 43));
    y.chamber_id               := x(42 downto 35);
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify (x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt is
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
    y(63)                      := x.data_valid;
    y(62 downto 43)            := vectorify(x.muid);
    y(42 downto 35)            := x.chamber_id;
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := x(63);
    y.muid                     := structify(x(62 downto 43));
    y.chamber_id               := x(42 downto 35);
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify (x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt is
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

end package body custom_types_davide_pkg;
