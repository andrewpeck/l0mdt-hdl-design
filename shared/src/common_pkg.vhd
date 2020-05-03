--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--    05/02/2020  0.1  File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- library l0mdt_lib;
-- use l0mdt_lib.mdttp_constants_pkg.all;
-- use l0mdt_lib.mdttp_types_pkg.all;
-- use df_lib.mdttp_functions_pkg.all;

library shared_lib;
use shared_lib.cfg_pkg.all;

package common_pkg is

-- =============================================================================
-- SYSTEM CONSTANTS
-- =============================================================================
  -- -- delay constants
  -- constant LATENCY_HPS_CH : integer := 10;

  -- -- mdt interface
  -- constant numTDCs_lpGBT  : integer := 9; 
  -- constant numlpGBTs_mux  : integer := 2; 
  -- constant numInputs_mux  : integer := numlpGBTs_mux * numTDCs_lpGBT; 

  -- mdt constants
  constant mdt_layer_max  : integer := 10;
  constant MDT_LAYER_LEN  : integer := integer(log2(real(mdt_layer_max)));
  constant mdt_tube_max   : integer := 435;
  constant MDT_TUBE_LEN  : integer := integer(log2(real(mdt_tube_max)));

  constant MDT_LE_TIME   : integer := 17;
  -- MDT hit coordinates constants
  -- constant x_LEN                : integer := 14;
  -- constant x_mult                 : real    := 16.0;
  constant MDT_Z_LEN              : integer := 14;
  -- constant z_mult                 : real    := 16.0;
  -- constant r_LEN                : integer := 9;
  -- constant r_mult                 : real    := 32.0;
  -- constant r_over_z_multi_LEN   : integer := integer(log2(r_mult/z_mult));

  --SLc constants
  -- Header
  -- constant BCID_LEN               : integer := 12;
  
  -- data
  -- constant SLC_TCID_LEN           : integer := 2;
  -- constant mbar_multi             : real    := 1024.0;
  -- constant mbar_multi_LEN       : integer := integer(log2(mbar_multi));
  constant SLC_PHI_LEN            : integer := 9;
  -- constant phi_range              : real    := 0.6; 
  -- constant phi_mult               : real    := real(2**phi_LEN)/phi_range;
  constant SLC_ETA_LEN            : integer := 12;
  -- constant eta_range              : real    := 0.6;
  -- constant eta_mult               : real    := 2.0**eta_LEN/eta_range;
  constant SLC_PT_THRES_LEN       : integer := 4;
  -- barrel
  -- constant SLC_B_COIN_LEN         : integer := 4;
  -- constant SLC_B_RESERVED           : integer := 8;
  -- constant SLC_B_ZRPC_LEN           : integer := 10;
  -- constant z_roi_LEN            : integer := 19;
  -- constant r_roi_LEN            : integer := 19;
  -- constant chamber_id_LEN       : integer := 3;
  --endcap

  -- segment finders
  constant MDT_R_WIIDTH             : integer := 9;
  -- CSF
  constant SLC_MBAR_LEN           : integer := 12;
  constant CSF_X_LEN              : integer := 14;
  constant CSF_Z_LEN              : integer := 14;

  -- LE
  constant le_x_LEN    : integer := 14;
  constant le_y_LEN    : integer := 14;
  -- constant le_r_LEN    : integer := 9;


  ------------------------------------------------------------
  --------------------------------------------------------------------------------
  --  sub types
  --------------------------------------------------------------------------------
  -- Sector Logic candidates
  subtype SLc_BCID_st is unsigned(11 downto 0);
  constant null_SLc_BCID_st : SLc_BCID_st := (others => '0');

  subtype SLc_zpos_st is signed(9 downto 0); 
  subtype SLc_phi_st is std_logic_vector(8 downto 0);

  -- MDT hits
  subtype mdt_time_le_st is unsigned(MDT_LE_TIME -1 downto 0);   -- 0.78 ns resolution
  subtype mdt_time_pw_st is unsigned(7 downto 0);      -- 0.78 ns resolution
  -- subtype mdt_time_full is unsigned(21 downto 0);     -- 0.78 ns resolution

  -- =============================================================================
  --  STANDARD TYPES
  -- =============================================================================
  -- function recordify(s: std_logic_vector) return unsigned;
  -- function vectorify(u: unsigned) return std_logic_vector;
  -- function recordify(s: std_logic_vector) return signed;
  -- function vectorify(s: signed) return std_logic_vector;

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

  -- =============================================================================
  --  LOGIC PORTS TYPES
  -- =============================================================================
  --------------------------------------------------------------------------------
  --  Sector Logic
  --------------------------------------------------------------------------------

  -- constant SLC_SLCID_LEN              : integer    := 2;                                   -- a comment
  -- constant SLC_SLID_LEN               : integer    := 6;
  -- constant BCID_LEN                   : integer    := 12;

  -- type slc_muid_rt is record
  --   slcid                           : std_logic_vector(SLC_SLCID_LEN-1 downto 0);          -- another comment
  --   slid                            : std_logic_vector(SLC_SLID_LEN-1 downto 0);
  --   bcid                            : std_logic_vector(BCID_LEN-1 downto 0);
  -- end record slc_muid_rt;

  -- constant SLC_MUID_LEN : integer := 20;
  -- subtype slc_muid_vt is std_logic_vector(SLC_MUID_LEN-1 downto 0);

  -- function vectorify(d: slc_muid_rt) return slc_muid_vt;
  -- function recordify(v: slc_muid_vt) return slc_muid_rt;
  -- function nullify return slc_muid_rt;

  -- constant SLC_CHAMBER_LEN            : integer    := 6;

  -- type slc_chid_rt is record
  --   mdt_inn                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
  --   mdt_mid                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
  --   mdt_out                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
  --   mdt_ext                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
  -- end record slc_chid_rt;


  -- constant SLC_CHID_LEN : integer := 24;
  -- subtype slc_chid_vt is std_logic_vector(SLC_CHID_LEN-1 downto 0);

  -- function vectorify(d: slc_chid_rt) return slc_chid_vt;
  -- function recordify(v: slc_chid_vt) return slc_chid_rt;
  -- function nullify return slc_chid_rt;

  -- constant SLC_TCID_LEN               : integer    := 2;
  -- constant SLC_TCSENT_LEN             : integer    := 1;
  -- constant SLC_POS_ETA_LEN            : integer    := 15;
  -- constant SLC_POS_ETA_MULT           : real       := 0.014;
  -- constant SLC_POS_PHI_LEN            : integer    := 9;
  -- constant SLC_POS_PHI_MULT           : real       := 0.012;
  -- constant SLC_PT_TH_LEN              : integer    := 4;
  -- constant SLC_CHARGE_LEN             : integer    := 1;

  -- type slc_common_rt is record
  --   tcid                            : std_logic_vector(SLC_TCID_LEN-1 downto 0);
  --   tcsent                          : std_logic_vector(SLC_TCSENT_LEN-1 downto 0);
  --   pos_eta                         : signed(SLC_POS_ETA_LEN-1 downto 0);
  --   pos_phi                         : unsigned(SLC_POS_PHI_LEN-1 downto 0);
  --   pt_th                           : std_logic_vector(SLC_PT_TH_LEN-1 downto 0);
  --   charge                          : std_logic_vector(SLC_CHARGE_LEN-1 downto 0);
  -- end record slc_common_rt;


  -- constant SLC_COMMON_LEN : integer := 32;
  -- subtype slc_common_vt is std_logic_vector(SLC_COMMON_LEN-1 downto 0);

  -- function vectorify(d: slc_common_rt) return slc_common_vt;
  -- function recordify(v: slc_common_vt) return slc_common_rt;
  -- function nullify return slc_common_rt;

  -- constant SLC_B_SPARE_LEN            : integer    := 8;
  -- constant SLC_COIN_TYPE_LEN          : integer    := 3;
  -- constant SLC_Z_RPC_LEN              : integer    := 10;
  -- constant SLC_Z_RPC_MULT             : real       := 0.0234;

  -- type slc_barrel_rt is record
  --   spare_bits                      : std_logic_vector(SLC_B_SPARE_LEN-1 downto 0);
  --   coin_type                       : std_logic_vector(SLC_COIN_TYPE_LEN-1 downto 0);
  --   z_rpc0                          : signed(SLC_Z_RPC_LEN-1 downto 0);
  --   z_rpc1                          : signed(SLC_Z_RPC_LEN-1 downto 0);
  --   z_rpc2                          : signed(SLC_Z_RPC_LEN-1 downto 0);
  --   z_rpc3                          : signed(SLC_Z_RPC_LEN-1 downto 0);
  -- end record slc_barrel_rt;

  -- constant SLC_BARREL_LEN : integer := 51;
  -- subtype slc_barrel_vt is std_logic_vector(SLC_BARREL_LEN-1 downto 0);

  -- function vectorify(d: slc_barrel_rt) return slc_barrel_vt;
  -- function recordify(v: slc_barrel_vt) return slc_barrel_rt;
  -- function nullify return slc_barrel_rt;

  -- constant SLC_E_SPARE_LEN            : integer    := 8;
  -- constant SLC_R_LEN                  : integer    := 10;
  -- constant SLC_ANGLE_WRT_PHI_LEN      : integer    := 7;
  -- constant SLC_ANGLE_WRT_ETA_LEN      : integer    := 4;
  -- constant SLC_NSW_ETA_LEN            : integer    := 14;
  -- constant SLC_NSW_PHI_LEN            : integer    := 8;
  -- constant SLC_NSW_ANGLE_WRT_ETA_LEN  : integer    := 5;

  -- type slc_endcap_rt is record
  --   spare_bits                      : std_logic_vector(SLC_E_SPARE_LEN-1 downto 0);
  --   r                               : unsigned(SLC_R_LEN-1 downto 0);
  --   angle_wrt_phi                   : signed(SLC_ANGLE_WRT_PHI_LEN-1 downto 0);
  --   angle_wrt_eta                   : signed(SLC_ANGLE_WRT_ETA_LEN-1 downto 0);
  --   nsw_eta                         : unsigned(SLC_NSW_ETA_LEN-1 downto 0);
  --   nsw_phi                         : unsigned(SLC_NSW_PHI_LEN-1 downto 0);
  --   nsw_angle_wrt_eta               : signed(SLC_NSW_ANGLE_WRT_ETA_LEN-1 downto 0);
  --   nsw_monitor                     : std_logic;
  -- end record slc_endcap_rt;

  -- constant SLC_ENDCAP_LEN : integer := 57;
  -- subtype slc_endcap_vt is std_logic_vector(SLC_ENDCAP_LEN-1 downto 0);

  -- function vectorify(d: slc_endcap_rt) return slc_endcap_vt;
  -- function recordify(v: slc_endcap_vt) return slc_endcap_rt;
  -- function nullify return slc_endcap_rt;

  -- constant SLC_SPECIFIC_LEN           : integer    := 51;

  -- type slc_rx_data_rt is record
  --   muid                            : slc_muid_rt;
  --   chambers                        : slc_chid_rt;
  --   common                          : slc_common_rt;
  --   specific                        : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);       -- can be either slc_barrel_vt or slc_endcap_vt
  --   data_valid                      : std_logic;
  -- end record slc_rx_data_rt;

  -- constant SLC_RX_DATA_LEN : integer := 128;
  -- subtype slc_rx_data_vt is std_logic_vector(SLC_RX_DATA_LEN-1 downto 0);

  -- function vectorify(d: slc_rx_data_rt) return slc_rx_data_vt;
  -- function recordify(v: slc_rx_data_vt) return slc_rx_data_rt;
  -- function nullify return slc_rx_data_rt;

  constant SLC_SLCID_LEN       : integer := 2;
  constant SLC_SLID_LEN        : integer := 6;
  constant BCID_LEN            : integer := 12;

  type slc_muid_rt is record
    slcid                      : std_logic_vector(SLC_SLCID_LEN-1 downto 0);
    slid                       : std_logic_vector(SLC_SLID_LEN-1 downto 0);
    bcid                       : std_logic_vector(BCID_LEN-1 downto 0);
  end record slc_muid_rt;
  constant SLC_MUID_LEN : integer := 20;
  subtype slc_muid_vt is std_logic_vector(SLC_MUID_LEN-1 downto 0);
  function vectorify(x: slc_muid_rt) return slc_muid_vt;
  function structify(x: slc_muid_vt) return slc_muid_rt;
  function nullify (x: slc_muid_rt) return slc_muid_rt;

  constant SLC_CHAMBER_LEN     : integer := 6;

  type slc_chid_rt is record
    mdt_inn                    : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    mdt_mid                    : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    mdt_out                    : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    mdt_ext                    : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
  end record slc_chid_rt;
  constant SLC_CHID_LEN : integer := 24;
  subtype slc_chid_vt is std_logic_vector(SLC_CHID_LEN-1 downto 0);
  function vectorify(x: slc_chid_rt) return slc_chid_vt;
  function structify(x: slc_chid_vt) return slc_chid_rt;
  function nullify (x: slc_chid_rt) return slc_chid_rt;

  constant SLC_TCID_LEN        : integer := 2;
  constant SLC_TCSENT_LEN      : integer := 1;
  constant SLC_POS_ETA_LEN     : integer := 15;
  constant SLC_POS_ETA_MULT    : real := 0.014;
  constant SLC_POS_PHI_LEN     : integer := 9;
  constant SLC_POS_PHI_MULT    : real := 0.012;
  constant SLC_PT_TH_LEN       : integer := 4;
  constant SLC_CHARGE_LEN      : integer := 1;

  type slc_common_rt is record
    tcid                       : std_logic_vector(SLC_TCID_LEN-1 downto 0);
    tcsent                     : std_logic;
    pos_eta                    : signed(SLC_POS_ETA_LEN-1 downto 0);
    pos_phi                    : unsigned(SLC_POS_PHI_LEN-1 downto 0);
    pt_th                      : std_logic_vector(SLC_PT_TH_LEN-1 downto 0);
    charge                     : std_logic;
  end record slc_common_rt;
  constant SLC_COMMON_LEN : integer := 32;
  subtype slc_common_vt is std_logic_vector(SLC_COMMON_LEN-1 downto 0);
  function vectorify(x: slc_common_rt) return slc_common_vt;
  function structify(x: slc_common_vt) return slc_common_rt;
  function nullify (x: slc_common_rt) return slc_common_rt;

  constant SLC_B_SPARE_LEN     : integer := 8;
  constant SLC_COIN_TYPE_LEN   : integer := 3;
  constant SLC_Z_RPC_LEN       : integer := 10;
  constant SLC_Z_RPC_MULT      : real := 0.0234;

  type slc_barrel_rt is record
    spare_bits                 : std_logic_vector(SLC_B_SPARE_LEN-1 downto 0);
    coin_type                  : std_logic_vector(SLC_COIN_TYPE_LEN-1 downto 0);
    z_rpc0                     : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc1                     : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc2                     : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc3                     : signed(SLC_Z_RPC_LEN-1 downto 0);
  end record slc_barrel_rt;
  constant SLC_BARREL_LEN : integer := 51;
  subtype slc_barrel_vt is std_logic_vector(SLC_BARREL_LEN-1 downto 0);
  function vectorify(x: slc_barrel_rt) return slc_barrel_vt;
  function structify(x: slc_barrel_vt) return slc_barrel_rt;
  function nullify (x: slc_barrel_rt) return slc_barrel_rt;

  constant SLC_E_SPARE_LEN     : integer := 8;
  constant SLC_R_LEN           : integer := 10;
  constant SLC_ANGLE_WRT_PHI_LEN : integer := 7;
  constant SLC_ANGLE_WRT_ETA_LEN : integer := 4;
  constant SLC_NSW_ETA_LEN     : integer := 14;
  constant SLC_NSW_PHI_LEN     : integer := 8;
  constant SLC_NSW_ANGLE_WRT_ETA_LEN : integer := 5;

  type slc_endcap_rt is record
    spare_bits                 : std_logic_vector(SLC_E_SPARE_LEN-1 downto 0);
    r                          : unsigned(SLC_R_LEN-1 downto 0);
    angle_wrt_phi              : signed(SLC_ANGLE_WRT_PHI_LEN-1 downto 0);
    angle_wrt_eta              : signed(SLC_ANGLE_WRT_ETA_LEN-1 downto 0);
    nsw_eta                    : unsigned(SLC_NSW_ETA_LEN-1 downto 0);
    nsw_phi                    : unsigned(SLC_NSW_PHI_LEN-1 downto 0);
    nsw_angle_wrt_eta          : signed(SLC_NSW_ANGLE_WRT_ETA_LEN-1 downto 0);
    nsw_monitor                : std_logic;
  end record slc_endcap_rt;
  constant SLC_ENDCAP_LEN : integer := 57;
  subtype slc_endcap_vt is std_logic_vector(SLC_ENDCAP_LEN-1 downto 0);
  function vectorify(x: slc_endcap_rt) return slc_endcap_vt;
  function structify(x: slc_endcap_vt) return slc_endcap_rt;
  function nullify (x: slc_endcap_rt) return slc_endcap_rt;

  constant SLC_SPECIFIC_LEN    : integer := 51;

  type slc_rx_data_rt is record
    muid                       : slc_muid_rt;
    chambers                   : slc_chid_rt;
    common                     : slc_common_rt;
    specific                   : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record slc_rx_data_rt;
  constant SLC_RX_DATA_LEN : integer := 128;
  subtype slc_rx_data_vt is std_logic_vector(SLC_RX_DATA_LEN-1 downto 0);
  function vectorify(x: slc_rx_data_rt) return slc_rx_data_vt;
  function structify(x: slc_rx_data_vt) return slc_rx_data_rt;
  function nullify (x: slc_rx_data_rt) return slc_rx_data_rt;

  -- type slc_rx_data_a_st is array(integer range <>) of slc_rx_data_rt;
  -- subtype SLC_RX_DATA_A_vt is std_logic_vector;
  -- function vectorify(x: slc_rx_data_a_st) return slc_rx_data_a_vt;
  -- function structify (x: slc_rx_data_a_vt) return slc_rx_data_a_st;
  -- function nullify (x: slc_rx_data_a_st) return slc_rx_data_a_st;

  type slc_rx_data_art is array (integer range <>) of slc_rx_data_rt;
  type slc_rx_data_avt is array (integer range <>) of slc_rx_data_vt;

  --------------------------------------------------------------------------------
  --  mdt interface
  --------------------------------------------------------------------------------

  -- =============================================================================
  --   LOGIC INTERBLOCK TYPES
  -- =============================================================================
  --------------------------------------------------------------------------------
  -- pipeline
  --------------------------------------------------------------------------------
  
  -- type pipeline_rt is record
  --   muid                            : slc_muid_rt;
  --   chambers                        : slc_chid_rt;
  --   common                          : slc_common_rt;
  --   specific                        : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
  --   process_ch                      : std_logic_vector(4-1 downto 0);
  --   processed                       : std_logic;
  --   data_valid                      : std_logic;
  -- end record pipeline_rt;
  
  -- constant PIPELINE_LEN : integer := 133;
  -- subtype pipeline_vt is std_logic_vector(PIPELINE_LEN-1 downto 0);
  -- function vectorify(d: pipeline_rt) return pipeline_vt;
  -- function recordify(v: pipeline_vt) return pipeline_rt;
  -- function nullify return pipeline_rt;

  type pipeline_rt is record
    muid                       : slc_muid_rt;
    chambers                   : slc_chid_rt;
    common                     : slc_common_rt;
    specific                   : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    process_ch                 : std_logic_vector(4-1 downto 0);
    processed                  : std_logic;
    data_valid                 : std_logic;
  end record pipeline_rt;
  constant PIPELINE_LEN : integer := 133;
  subtype pipeline_vt is std_logic_vector(PIPELINE_LEN-1 downto 0);
  function vectorify(x: pipeline_rt) return pipeline_vt;
  function structify(x: pipeline_vt) return pipeline_rt;
  function nullify (x: pipeline_rt) return pipeline_rt;

  type pipeline_art is array (integer range <>) of pipeline_rt;
  type pipeline_avt is array (integer range <>) of pipeline_vt;
  --------------------------------------------------------------------------------
  -- candidate information  ucm 2 hps
  --------------------------------------------------------------------------------

  constant UCM_MBAR_LEN        : integer := 10;
  constant UCM_Z_ROI_LEN       : integer := 7;
  constant UCM_R_ROI_LEN       : integer := 4;
  constant UCM_PHI_LEN         : integer := 14;
  constant UCM_ETA_LEN         : integer := 8;

  -- type ucm_csf_barrel_rt is record
  --   mbar                       : unsigned(UCM_MBAR_LEN-1 downto 0);
  --   z                          : unsigned(UCM_Z_ROI_LEN-1 downto 0);
  --   r                          : unsigned(UCM_R_ROI_LEN-1 downto 0);
  --   phi                        : unsigned(UCM_PHI_LEN-1 downto 0);
  --   eta                        : unsigned(UCM_ETA_LEN-1 downto 0);
  -- end record ucm_csf_barrel_rt;
  -- constant UCM_CSF_BARREL_LEN : integer := 43;
  -- subtype ucm_csf_barrel_vt is std_logic_vector(UCM_CSF_BARREL_LEN-1 downto 0);
  -- function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_vt;
  -- function structify(x: ucm_csf_barrel_vt) return ucm_csf_barrel_rt;
  -- function nullify (x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt;

  -- type ucm2hps_id_rt is record
  -- bcid                            : std_logic_vector(BCID_LEN-1 downto 0);
  -- chamber_id                      : unsigned(SLC_CHAMBER_LEN-1 downto 0);
  -- end record ucm2hps_id_rt;
  -- constant UCM2HPS_ID_LEN : integer := 18;
  -- subtype ucm2hps_id_vt is std_logic_vector(UCM2HPS_ID_LEN-1 downto 0);
  -- function vectorify(d: ucm2hps_id_rt) return ucm2hps_id_vt;
  -- function recordify(v: ucm2hps_id_vt) return ucm2hps_id_rt;
  -- function nullify return ucm2hps_id_rt;

  -- constant UCM2HPS_SPECIFIC_LEN       : integer    := 43;

  -- type ucm2hps_rt is record
  --   id                              : ucm2hps_id_rt;
  --   specific                        : std_logic_vector(UCM2HPS_SPECIFIC_LEN-1 downto 0);
  --   data_valid                      : std_logic;
  -- end record ucm2hps_rt;
  -- constant UCM2HPS_LEN : integer := 62;
  -- subtype ucm2hps_vt is std_logic_vector(UCM2HPS_LEN-1 downto 0);
  -- function vectorify(d: ucm2hps_rt) return ucm2hps_vt;
  -- function recordify(v: ucm2hps_vt) return ucm2hps_rt;
  -- function nullify return ucm2hps_rt;
  type ucm_csf_barrel_rt is record
    mbar                       : unsigned(UCM_MBAR_LEN-1 downto 0);
    z                          : unsigned(UCM_Z_ROI_LEN-1 downto 0);
    r                          : unsigned(UCM_R_ROI_LEN-1 downto 0);
    phi                        : unsigned(UCM_PHI_LEN-1 downto 0);
    eta                        : unsigned(UCM_ETA_LEN-1 downto 0);
  end record ucm_csf_barrel_rt;
  constant UCM_CSF_BARREL_LEN : integer := 43;
  subtype ucm_csf_barrel_vt is std_logic_vector(UCM_CSF_BARREL_LEN-1 downto 0);
  function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_vt;
  function structify(x: ucm_csf_barrel_vt) return ucm_csf_barrel_rt;
  function nullify (x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt;

  type ucm2hps_id_rt is record
    bcid                       : std_logic_vector(BCID_LEN-1 downto 0);
    chamber_id                 : unsigned(SLC_CHAMBER_LEN-1 downto 0);
  end record ucm2hps_id_rt;
  constant UCM2HPS_ID_LEN : integer := 18;
  subtype ucm2hps_id_vt is std_logic_vector(UCM2HPS_ID_LEN-1 downto 0);
  function vectorify(x: ucm2hps_id_rt) return ucm2hps_id_vt;
  function structify(x: ucm2hps_id_vt) return ucm2hps_id_rt;
  function nullify (x: ucm2hps_id_rt) return ucm2hps_id_rt;

  constant UCM2HPS_SPECIFIC_LEN : integer := 43;

  type ucm2hps_rt is record
    id                         : ucm2hps_id_rt;
    specific                   : std_logic_vector(UCM2HPS_SPECIFIC_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record ucm2hps_rt;
  constant UCM2HPS_LEN : integer := 62;
  subtype ucm2hps_vt is std_logic_vector(UCM2HPS_LEN-1 downto 0);
  function vectorify(x: ucm2hps_rt) return ucm2hps_vt;
  function structify(x: ucm2hps_vt) return ucm2hps_rt;
  function nullify (x: ucm2hps_rt) return ucm2hps_rt;

  -- type ucm2hps_a_st is array(integer range <>) of ucm2hps_rt;
  -- subtype UCM2HPS_A_vt is std_logic_vector;
  -- function vectorify(x: ucm2hps_a_st) return ucm2hps_a_vt;
  -- function structify (x: ucm2hps_a_vt) return ucm2hps_a_st;
  -- function nullify (x: ucm2hps_a_st) return ucm2hps_a_st;

  type ucm2hps_art is array (integer range <>) of ucm2hps_rt;
  type ucm2hps_avt is array (integer range <>) of ucm2hps_vt;
  type ucm2hps_aavt is array (integer range <>) of ucm2hps_avt(MAX_NUM_HEG -1 downto 0);

  --------------------------------------------------------------------------------
  -- data from TAR to hit extraction input fifo
    -- type tar2hec_data_rt is record
    --     multilayer  : integer;
    --     layer       : integer;
    --     tube        : integer;
    --     lead_edge   : std_logic_vector(16 downto 0);
    --     pulse_LEN : std_logic_vector(7 downto 0); 
    -- end record;

  -- data types and records for hit processing block
    
  -- muon candidate procesor to tube range LUT
  -- type tube_range_config_rt is record
  --   data_valid  : std_logic;
  -- end record;

  -- type muon_candidate_info_rt is record
  --   mc_time : integer;
  --   mc_origin : std_logic_vector(13 downto 0);
  -- end record;

  --------------------------------------------------------------------------------
  --  LOGIC INTERBLOCK TYPES
  --------------------------------------------------------------------------------
  -- ucm pam 2 hps
  
  -- type ucm2heg_pam_rt is record
  --   addr    : std_logic_vector(3 downto 0);
  --   sel     : std_logic;
  -- end record;
  -- type ucm2heg_pam_art is array(integer range <>) of ucm2heg_pam_rt;
  


  -- type ucm2heg_barrel_rt is record --from TAR & PC
  --   z           : signed(SLC_B_ZRPC_LEN - 1 downto 0);          -- 10 bits
  --   z_0         : signed(SLC_B_ZRPC_LEN - 1 downto 0);          -- 10 bits
  --   phi         : signed(SLC_PHI_LEN - 1 downto 0); 
  --   mbar        : signed(SLC_MBAR_LEN - 1 downto 0);
  -- end record;
  -- constant null_ucm_slc_barrel_rt : ucm2heg_barrel_rt := ((others => '0'),(others => '0'),(others => '0'),(others => '0'));
  -- constant UCM2HE_BARREL_vt_LEN : integer := 2*SLC_B_ZRPC_LEN + SLC_PHI_LEN + SLC_MBAR_LEN;
  -- subtype ucm2heg_barrel_vt is std_logic_vector(UCM2HE_BARREL_vt_LEN-1 downto 0);
  -- function ucm2heg_barrel_f_r2std(inputrecord : in ucm2heg_barrel_rt	) return ucm2heg_barrel_vt;
  -- function ucm2heg_barrel_f_std2rt(inputvector : in ucm2heg_barrel_vt  ) return ucm2heg_barrel_rt;
  -- --
  -- type ucm2heg_slc_rt is record
  --   BCID        : unsigned(BCID_LEN -1 downto 0);          -- 12 bits
  --   barrel      : ucm2heg_barrel_rt; --barrel_ucm_t(ST_nBARREL_ENDCAP downto 0);
  --   -- endcap      : hp_SLc_endcap_rt; --endcap_ucm_t(ST_nBARREL_ENDCAP downto 1);
  --   data_valid  : std_logic;
  -- end record;
  -- constant null_ucm2heg_slc_rt : ucm2heg_slc_rt := (null_SLc_BCID_st,null_ucm_slc_barrel_rt,'0');
  -- type ucm2heg_slc_art is array (integer range <>) of ucm2heg_slc_rt;

  -- constant UCM2HEG_SLC_vt_LEN : integer := UCM2HE_BARREL_vt_LEN + BCID_LEN + 1;
  -- subtype ucm2heg_slc_vt is std_logic_vector(UCM2HEG_SLC_vt_LEN downto 0);
  -- type ucm2heg_slc_avt is array(integer range <>) of ucm2heg_slc_vt;
  -- function ucm2heg_slc_f_r2std(	inputrecord : in ucm2heg_slc_rt	) return ucm2heg_slc_vt;
  -- function ucm2heg_slc_f_std2rt(inputvector : in ucm2heg_slc_vt  ) return ucm2heg_slc_rt;
  --------------------------------------------------------------------------------
  -- SLC data to hps
  -- subtype ucm2heg_data_vt is std_logic_vector(100 downto 0);
  -- type ucm2heg_slc_avt is array (integer range <>) of ucm2heg_data_vt;
  -- type ucm2hps_slc_avt is array (integer range <>) of ucm2heg_slc_avt(MAX_NUM_HEG -1 downto 0);

  --------------------------------------------------------------------------------
  -- mdt from tar
  type tar2heg_mdt_rt is record
    layer           : unsigned(MDT_LAYER_LEN -1 downto 0);
    tube            : unsigned(MDT_TUBE_LEN - 1 downto 0);
    time_le         : unsigned(MDT_LE_TIME -1 downto 0);
  end record;
  type tar2heg_mdt_art is array(integer range <>) of tar2heg_mdt_rt;
  subtype tar2heg_mdt_vt is std_logic_vector((MDT_LAYER_LEN + MDT_TUBE_LEN + MDT_LE_TIME -1) downto 0 );
  type tar2heg_mdt_avt is array(integer range <>) of tar2heg_mdt_vt;
  -- function tar2heg_mdt_f_r2std(	inputrecord : in tar2heg_mdt_rt	) return tar2heg_mdt_vt;
  -- function tar2heg_mdt_f_std2rt(inputvector : in tar2heg_mdt_vt  ) return tar2heg_mdt_rt;
  
  --------------------------------------------------------------------------------
  -- sf 2 pt
  type hps2pt_sf_rt is record

    data_valid : std_logic;
  end record;
  type hps2pt_sf_art is array(integer range <>) of hps2pt_sf_rt;
  subtype hps2pt_sf_vt is std_logic_vector(1 downto 0 );
  type hps2pt_sf_avt is array(integer range <>) of hps2pt_sf_vt;

end package common_pkg;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package body common_pkg is
  -- =============================================================================
  --  STANDARD TYPES
  -- =============================================================================
  -- function recordify(s: std_logic_vector) return unsigned is
  -- begin
  --   return unsigned(s);
  -- end function recordify;

  -- function vectorify(u: unsigned) return std_logic_vector is
  -- begin
  --   return std_logic_vector(u);
  -- end function vectorify;

  -- function recordify(s: std_logic_vector) return signed is
  -- begin
  --   return signed(s);
  -- end function recordify;

  -- function vectorify(s: signed) return std_logic_vector is
  -- begin
  --   return std_logic_vector(s);
  -- end function vectorify;
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

  -- =============================================================================
  --  LOGIC PORTS TYPES
  -- =============================================================================
  --------------------------------------------------------------------------------
  --  Sector Logic
  --------------------------------------------------------------------------------

  -- muid
  -- function nullify return slc_muid_rt is
  -- begin
  --   return ((others => '0')
  --           , (others => '0')
  --           , (others => '0'));
  -- end function nullify;

  -- function vectorify(d: slc_muid_rt) return slc_muid_vt is
  --   variable v : slc_muid_vt;
  -- begin
  --   v := d.slcid
  --        & d.slid
  --        & d.bcid;
  --   return v;
  -- end function vectorify;

  -- function recordify(v: slc_muid_vt) return slc_muid_rt is
  --   variable b : slc_muid_rt;
  -- begin
  --   b.slcid                := v(19 downto 18);
  --   b.slid                 := v(17 downto 12);
  --   b.bcid                 := v(11 downto 0);
  --   return b;
  -- end function recordify;
  function vectorify(x: slc_muid_rt) return slc_muid_vt is
    variable y : slc_muid_vt;
  begin
    y(19 downto 18)            := x.slcid;
    y(17 downto 12)            := x.slid;
    y(11 downto 0)             := x.bcid;
    return y;
  end function vectorify;
  function structify(x: slc_muid_vt) return slc_muid_rt is
    variable y : slc_muid_rt;
  begin
    y.slcid                    := x(19 downto 18);
    y.slid                     := x(17 downto 12);
    y.bcid                     := x(11 downto 0);
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
  --------------------------------------------------------------------------------
  -- slc_chid_rt
  -- function nullify return slc_chid_rt is
  -- begin
  --   return ((others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0'));
  -- end function nullify;

  -- function vectorify(d: slc_chid_rt) return slc_chid_vt is
  --   variable v : slc_chid_vt;
  -- begin
  --   v := d.mdt_inn
  --        & d.mdt_mid
  --        & d.mdt_out
  --        & d.mdt_ext;
  --   return v;
  -- end function vectorify;

  -- function recordify(v: slc_chid_vt) return slc_chid_rt is
  --   variable b : slc_chid_rt;
  -- begin
  --   b.mdt_inn              := v(23 downto 18);
  --   b.mdt_mid              := v(17 downto 12);
  --   b.mdt_out              := v(11 downto 6);
  --   b.mdt_ext              := v(5 downto 0);
  --   return b;
  -- end function recordify;
  function vectorify(x: slc_chid_rt) return slc_chid_vt is
    variable y : slc_chid_vt;
  begin
    y(23 downto 18)            := x.mdt_inn;
    y(17 downto 12)            := x.mdt_mid;
    y(11 downto 6)             := x.mdt_out;
    y(5 downto 0)              := x.mdt_ext;
    return y;
  end function vectorify;
  function structify(x: slc_chid_vt) return slc_chid_rt is
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
  --------------------------------------------------------------------------------
  -- slc_common
  -- function nullify return slc_common_rt is
  -- begin
  --   return ((others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0'));
  -- end function nullify;

  -- function vectorify(d: slc_common_rt) return slc_common_vt is
  --   variable v : slc_common_vt;
  -- begin
  --   v := d.tcid
  --        & d.tcsent
  --        & vectorify(d.pos_eta)
  --        & vectorify(d.pos_phi)
  --        & d.pt_th
  --        & d.charge;
  --   return v;
  -- end function vectorify;

  -- function recordify(v: slc_common_vt) return slc_common_rt is
  --   variable b : slc_common_rt;
  -- begin
  --   b.tcid                 := v(31 downto 30);
  --   b.tcsent               := v(29 downto 29);
  --   b.pos_eta              := recordify(v(28 downto 14));
  --   b.pos_phi              := recordify(v(13 downto 5));
  --   b.pt_th                := v(4 downto 1);
  --   b.charge               := v(0 downto 0);
  --   return b;
  -- end function recordify;
  function vectorify(x: slc_common_rt) return slc_common_vt is
    variable y : slc_common_vt;
  begin
    y(31 downto 30)            := x.tcid;
    y(29)                      := x.tcsent;
    y(28 downto 14)            := vectorify(x.pos_eta);
    y(13 downto 5)             := vectorify(x.pos_phi);
    y(4 downto 1)              := x.pt_th;
    y(0)                       := x.charge;
    return y;
  end function vectorify;
  function structify(x: slc_common_vt) return slc_common_rt is
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
  --------------------------------------------------------------------------------
  -- specific
  -- barrel
  -- function nullify return slc_barrel_rt is
  -- begin
  --   return ((others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0'));
  -- end function nullify;

  -- function vectorify(d: slc_barrel_rt) return slc_barrel_vt is
  --   variable v : slc_barrel_vt;
  -- begin
  --   v := d.spare_bits
  --        & d.coin_type
  --        & vectorify(d.z_rpc0)
  --        & vectorify(d.z_rpc1)
  --        & vectorify(d.z_rpc2)
  --        & vectorify(d.z_rpc3);
  --   return v;
  -- end function vectorify;

  -- function recordify(v: slc_barrel_vt) return slc_barrel_rt is
  --   variable b : slc_barrel_rt;
  -- begin
  --   b.spare_bits           := v(50 downto 43);
  --   b.coin_type            := v(42 downto 40);
  --   b.z_rpc0               := recordify(v(39 downto 30));
  --   b.z_rpc1               := recordify(v(29 downto 20));
  --   b.z_rpc2               := recordify(v(19 downto 10));
  --   b.z_rpc3               := recordify(v(9 downto 0));
  --   return b;
  -- end function recordify;

  -- function nullify return slc_endcap_rt is
  -- begin
  --   return ((others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , (others => '0')
  --           , '0');
  -- end function nullify;
  function vectorify(x: slc_barrel_rt) return slc_barrel_vt is
    variable y : slc_barrel_vt;
  begin
    y(50 downto 43)            := x.spare_bits;
    y(42 downto 40)            := x.coin_type;
    y(39 downto 30)            := vectorify(x.z_rpc0);
    y(29 downto 20)            := vectorify(x.z_rpc1);
    y(19 downto 10)            := vectorify(x.z_rpc2);
    y(9 downto 0)              := vectorify(x.z_rpc3);
    return y;
  end function vectorify;
  function structify(x: slc_barrel_vt) return slc_barrel_rt is
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
  -- endcap
  -- function vectorify(d: slc_endcap_rt) return slc_endcap_vt is
  --   variable v : slc_endcap_vt;
  -- begin
  --   v := d.spare_bits
  --        & vectorify(d.r)
  --        & vectorify(d.angle_wrt_phi)
  --        & vectorify(d.angle_wrt_eta)
  --        & vectorify(d.nsw_eta)
  --        & vectorify(d.nsw_phi)
  --        & vectorify(d.nsw_angle_wrt_eta)
  --        & d.nsw_monitor;
  --   return v;
  -- end function vectorify;

  -- function recordify(v: slc_endcap_vt) return slc_endcap_rt is
  --   variable b : slc_endcap_rt;
  -- begin
  --   b.spare_bits           := v(56 downto 49);
  --   b.r                    := recordify(v(48 downto 39));
  --   b.angle_wrt_phi        := recordify(v(38 downto 32));
  --   b.angle_wrt_eta        := recordify(v(31 downto 28));
  --   b.nsw_eta              := recordify(v(27 downto 14));
  --   b.nsw_phi              := recordify(v(13 downto 6));
  --   b.nsw_angle_wrt_eta    := recordify(v(5 downto 1));
  --   b.nsw_monitor          := v(0);
  --   return b;
  -- end function recordify;
  function vectorify(x: slc_endcap_rt) return slc_endcap_vt is
    variable y : slc_endcap_vt;
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
  function structify(x: slc_endcap_vt) return slc_endcap_rt is
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
  --------------------------------------------------------------------------------
  -- slc_rx_data_rt
  -- function nullify return slc_rx_data_rt is
  -- begin
  --   return (nullify
  --           , nullify
  --           , nullify
  --           , (others => '0')
  --           , '0');
  -- end function nullify;

  -- function vectorify(d: slc_rx_data_rt) return slc_rx_data_vt is
  --   variable v : slc_rx_data_vt;
  -- begin
  --   v := vectorify(d.muid)
  --        & vectorify(d.chambers)
  --        & vectorify(d.common)
  --        & d.specific
  --        & d.data_valid;
  --   return v;
  -- end function vectorify;

  -- function recordify(v: slc_rx_data_vt) return slc_rx_data_rt is
  --   variable b : slc_rx_data_rt;
  -- begin
  --   b.muid                 := recordify(v(127 downto 108));
  --   b.chambers             := recordify(v(107 downto 84));
  --   b.common               := recordify(v(83 downto 52));
  --   b.specific             := v(51 downto 1);
  --   b.data_valid           := v(0);
  --   return b;
  -- end function recordify;
  function vectorify(x: slc_rx_data_rt) return slc_rx_data_vt is
    variable y : slc_rx_data_vt;
  begin
    y(127 downto 108)          := vectorify(x.muid);
    y(107 downto 84)           := vectorify(x.chambers);
    y(83 downto 52)            := vectorify(x.common);
    y(51 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: slc_rx_data_vt) return slc_rx_data_rt is
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
  --------------------------------------------------------------------------------
  -- --------------------------------------------------------------------------------
  -- -- muid
  -- function vectorify(d: slc_muid_rt) return slc_muid_vt is
  --   variable v: slc_muid_vt;
  -- begin
  --   v :=  d.slcid &  d.slid &  d.bcid;
  --   return v;
  -- end function;
  -- function recordify(v: slc_muid_vt) return slc_muid_rt is
  --   variable d: slc_muid_rt;
  -- begin
  --   d.slcid := v(SLC_SLCID_LEN + SLC_SLID_LEN + BCID_LEN - 1 downto SLC_SLID_LEN + BCID_LEN);
  --   d.slid := v(SLC_SLID_LEN + BCID_LEN-1 downto BCID_LEN);
  --   d.bcid := v(BCID_LEN-1 downto 0);
  --   return d;
  -- end function;
  -- --------------------------------------------------------------------------------
  -- -- slc_common
  -- function vectorify(d: slc_common_rt) return slc_common_vt is
  --   variable v: slc_common_vt;
  -- begin
  --   v :=  d.tcid & d.tcsent &  std_logic_vector(d.pos_eta) & std_logic_vector(d.pos_phi) &  d.pt_th &  d.charge;
  --   return v;
  -- end function;
  -- function recordify(v: slc_common_vt) return slc_common_rt is
  --   variable d: slc_common_rt;
  -- begin
  --   d.tcid    := v( SLC_TCID_LEN + SLC_TCSENT_LEN + SLC_POS_ETA_LEN + SLC_POS_PHI_LEN + SLC_PT_TH_LEN + SLC_CHARGE_LEN -1 downto SLC_TCSENT_LEN + SLC_POS_ETA_LEN + SLC_POS_PHI_LEN + SLC_PT_TH_LEN + SLC_CHARGE_LEN);
  --   d.tcsent  := v( SLC_TCSENT_LEN + SLC_POS_ETA_LEN + SLC_POS_PHI_LEN + SLC_PT_TH_LEN + SLC_CHARGE_LEN -1 downto SLC_POS_ETA_LEN + SLC_POS_PHI_LEN + SLC_PT_TH_LEN + SLC_CHARGE_LEN);
  --   d.pos_eta := signed(v( SLC_POS_ETA_LEN + SLC_POS_PHI_LEN + SLC_PT_TH_LEN + SLC_CHARGE_LEN -1 downto SLC_POS_PHI_LEN + SLC_PT_TH_LEN + SLC_CHARGE_LEN));
  --   d.pos_phi := unsigned(v( SLC_POS_PHI_LEN + SLC_PT_TH_LEN + SLC_CHARGE_LEN -1 downto SLC_PT_TH_LEN + SLC_CHARGE_LEN));
  --   d.pt_th   := v( SLC_PT_TH_LEN + SLC_CHARGE_LEN -1 downto SLC_CHARGE_LEN);
  --   d.charge  := v(SLC_CHARGE_LEN -1 downto 0);
  --   return d;
  -- end function;
  -- -- --------------------------------------------------------------------------------
  -- -- -- pl_common
  -- -- function vectorify(d: pl_common_rt) return pl_common_vt is
  -- --   variable v: pl_common_vt;
  -- -- begin
  -- --   v :=  d.destsl &  std_logic_vector(d.phi_mod) & d.mdtid_inn  & d.mdtid_mid &  d.mdtid_out &  d.mdtid_ext;
  -- --   return v;
  -- -- end function;
  -- -- --
  -- -- function recordify(v: pl_common_vt) return pl_common_rt is
  -- --   variable d: pl_common_rt;
  -- -- begin
  -- --   d.destsl    := v(PL_DESTSL_LEN + PL_PHIMOD_LEN + 4*PL_MDTID_LEN -1 downto PL_PHIMOD_LEN + 4*PL_MDTID_LEN);
  -- --   d.phi_mod   := signed( v( PL_PHIMOD_LEN + 4*PL_MDTID_LEN -1 downto 4*PL_MDTID_LEN));
  -- --   d.mdtid_inn := v(4*PL_MDTID_LEN -1 downto 3*PL_MDTID_LEN);
  -- --   d.mdtid_mid := v(3*PL_MDTID_LEN -1 downto 2*PL_MDTID_LEN);
  -- --   d.mdtid_out := v(2*PL_MDTID_LEN -1 downto PL_MDTID_LEN);
  -- --   d.mdtid_ext := v(PL_MDTID_LEN -1 downto 0);
  -- --   return d;
  -- -- end function;
  -- --------------------------------------------------------------------------------
  -- -- pl_common
  -- function vectorify(d: slc_chid_rt) return slc_chid_vt is
  --   variable v: slc_chid_vt;
  -- begin
  --   v :=  d.mdt_inn  & d.mdt_mid &  d.mdt_out &  d.mdt_ext;
  --   return v;
  -- end function;
  -- --
  -- function recordify(v: slc_chid_vt) return slc_chid_rt is
  --   variable d: slc_chid_rt;
  -- begin
  --   d.mdt_inn := v(4*SLC_CHAMBER_LEN -1 downto 3*SLC_CHAMBER_LEN);
  --   d.mdt_mid := v(3*SLC_CHAMBER_LEN -1 downto 2*SLC_CHAMBER_LEN);
  --   d.mdt_out := v(2*SLC_CHAMBER_LEN -1 downto SLC_CHAMBER_LEN);
  --   d.mdt_ext := v(SLC_CHAMBER_LEN -1 downto 0);
  --   return d;
  -- end function;
  -- --
  -- -- function recordify(v: slc_prepro_vt) return slc_prepro_rt is
  -- --   variable d: slc_prepro_rt;
  -- -- begin
  -- --   d.muid := recordify(slc_muid_vt(v(SLC_SPECIFIC_LEN + SLC_COMMON_LEN + SLC_CHID_LEN + SLC_MUID_LEN downto SLC_SPECIFIC_LEN + SLC_COMMON_LEN + SLC_CHID_LEN + 1)));
  -- --   d.common := recordify(v(SLC_SPECIFIC_LEN + SLC_COMMON_LEN + SLC_CHID_LEN downto SLC_CHID_LEN + SLC_SPECIFIC_LEN + 1));
  -- --   d.chambers := recordify(v(SLC_SPECIFIC_LEN + SLC_CHID_LEN downto SLC_SPECIFIC_LEN + 1));
  -- --   d.specific := v(SLC_SPECIFIC_LEN downto 1);
  -- --   d.data_Valid := v(0);
  -- --   return d;
  -- -- end function;
  -- ------------------------------------------------------------------------------
  -- =============================================================================
  --   LOGIC INTERBLOCK TYPES
  -- =============================================================================
  --------------------------------------------------------------------------------
  -- pipeline
  --------------------------------------------------------------------------------

  function vectorify(x: pipeline_rt) return pipeline_vt is
    variable y : pipeline_vt;
  begin
    y(132 downto 113)          := vectorify(x.muid);
    y(112 downto 89)           := vectorify(x.chambers);
    y(88 downto 57)            := vectorify(x.common);
    y(56 downto 6)             := x.specific;
    y(5 downto 2)              := x.process_ch;
    y(1)                       := x.processed;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: pipeline_vt) return pipeline_rt is
    variable y : pipeline_rt;
  begin
    y.muid                     := structify(x(132 downto 113));
    y.chambers                 := structify(x(112 downto 89));
    y.common                   := structify(x(88 downto 57));
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

  --------------------------------------------------------------------------------
  -- candidate information  ucm 2 hps
  --------------------------------------------------------------------------------

  -- function nullify return ucm2hps_id_rt is
  -- begin
  --   return ((others => '0')
  --           , (others => '0'));
  -- end function nullify;

  -- function vectorify(d: ucm2hps_id_rt) return ucm2hps_id_vt is
  --   variable v : ucm2hps_id_vt;
  -- begin
  --   v := d.bcid
  --        & vectorify(d.chamber_id);
  --   return v;
  -- end function vectorify;

  -- function recordify(v: ucm2hps_id_vt) return ucm2hps_id_rt is
  --   variable b : ucm2hps_id_rt;
  -- begin
  --   b.bcid                 := v(17 downto 6);
  --   b.chamber_id           := recordify(v(5 downto 0));
  --   return b;
  -- end function recordify;

  -- function nullify return ucm2hps_rt is
  -- begin
  --   return (nullify
  --           , (others => '0')
  --           , '0');
  -- end function nullify;

  -- function vectorify(d: ucm2hps_rt) return ucm2hps_vt is
  --   variable v : ucm2hps_vt;
  -- begin
  --   v := vectorify(d.id)
  --        & d.specific
  --        & d.data_valid;
  --   return v;
  -- end function vectorify;

  -- function recordify(v: ucm2hps_vt) return ucm2hps_rt is
  --   variable b : ucm2hps_rt;
  -- begin
  --   b.id                   := recordify(v(61 downto 44));
  --   b.specific             := v(43 downto 1);
  --   b.data_valid           := v(0);
  --   return b;
  -- end function recordify;
  function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_vt is
    variable y : ucm_csf_barrel_vt;
  begin
    y(42 downto 33)            := vectorify(x.mbar);
    y(32 downto 26)            := vectorify(x.z);
    y(25 downto 22)            := vectorify(x.r);
    y(21 downto 8)             := vectorify(x.phi);
    y(7 downto 0)              := vectorify(x.eta);
    return y;
  end function vectorify;
  function structify(x: ucm_csf_barrel_vt) return ucm_csf_barrel_rt is
    variable y : ucm_csf_barrel_rt;
  begin
    y.mbar                     := structify(x(42 downto 33));
    y.z                        := structify(x(32 downto 26));
    y.r                        := structify(x(25 downto 22));
    y.phi                      := structify(x(21 downto 8));
    y.eta                      := structify(x(7 downto 0));
    return y;
  end function structify;
  function nullify (x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt is
    variable y : ucm_csf_barrel_rt;
  begin
    y.mbar                     := nullify(x.mbar);
    y.z                        := nullify(x.z);
    y.r                        := nullify(x.r);
    y.phi                      := nullify(x.phi);
    y.eta                      := nullify(x.eta);
    return y;
  end function nullify;

  function vectorify(x: ucm2hps_id_rt) return ucm2hps_id_vt is
    variable y : ucm2hps_id_vt;
  begin
    y(17 downto 6)             := x.bcid;
    y(5 downto 0)              := vectorify(x.chamber_id);
    return y;
  end function vectorify;
  function structify(x: ucm2hps_id_vt) return ucm2hps_id_rt is
    variable y : ucm2hps_id_rt;
  begin
    y.bcid                     := x(17 downto 6);
    y.chamber_id               := structify(x(5 downto 0));
    return y;
  end function structify;
  function nullify (x: ucm2hps_id_rt) return ucm2hps_id_rt is
    variable y : ucm2hps_id_rt;
  begin
    y.bcid                     := nullify(x.bcid);
    y.chamber_id               := nullify(x.chamber_id);
    return y;
  end function nullify;


  function vectorify(x: ucm2hps_rt) return ucm2hps_vt is
    variable y : ucm2hps_vt;
  begin
    y(61 downto 44)            := vectorify(x.id);
    y(43 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm2hps_vt) return ucm2hps_rt is
    variable y : ucm2hps_rt;
  begin
    y.id                       := structify(x(61 downto 44));
    y.specific                 := x(43 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: ucm2hps_rt) return ucm2hps_rt is
    variable y : ucm2hps_rt;
  begin
    y.id                       := nullify(x.id);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

-- ------------------------------------------------------------------------------
  -- slc from ucm
  -- function ucm2heg_barrel_f_r2std(	i_rec : in ucm2heg_barrel_rt	) return ucm2heg_barrel_vt is
  --   variable o_vec : ucm2heg_barrel_vt;
  -- begin
  --   o_vec := std_logic_vector(i_rec.z) & std_logic_vector(i_rec.z_0) & 
  --   std_logic_vector(i_rec.phi) & std_logic_vector(i_rec.mbar); 
  --   return o_vec;
  -- end function;

  -- function ucm2heg_barrel_f_std2rt(i_vec : in ucm2heg_barrel_vt  ) return ucm2heg_barrel_rt is
  --   variable o_rec : ucm2heg_barrel_rt;
  -- begin
  --   o_rec.z     := signed(i_vec(2*SLC_B_ZRPC_LEN + SLC_PHI_LEN -1 downto SLC_B_ZRPC_LEN + SLC_PHI_LEN + SLC_MBAR_LEN));
  --   o_rec.z_0   := signed(i_vec(SLC_B_ZRPC_LEN + SLC_PHI_LEN - 1 downto SLC_PHI_LEN + SLC_MBAR_LEN));
  --   o_rec.phi   := signed(i_vec(SLC_PHI_LEN - 1 downto SLC_MBAR_LEN));
  --   o_rec.mbar  := signed(i_vec(SLC_MBAR_LEN - 1 downto 0));
  --   return o_rec;
  -- end function;
  -- --
  -- function ucm2heg_slc_f_r2std(	i_rec : in ucm2heg_slc_rt	) return ucm2heg_slc_vt is
  --   variable o_vec : ucm2heg_slc_vt;
  -- begin
  --   o_vec := std_logic_vector(i_rec.BCID) & ucm2heg_barrel_f_r2std(i_rec.barrel) & i_rec.data_valid;
  --   return o_vec;
  -- end function;
  -- function ucm2heg_slc_f_std2rt(i_vec : in ucm2heg_slc_vt  ) return ucm2heg_slc_rt is
  --   variable o_rec : ucm2heg_slc_rt;
  -- begin
  --   o_rec.BCID := UNSIGNED(i_vec(UCM2HEG_SLC_vt_LEN -1 downto UCM2HE_BARREL_vt_LEN + 1 ));
  --   o_rec.barrel := ucm2heg_barrel_f_std2rt(i_vec(UCM2HE_BARREL_vt_LEN downto 1));
  --   o_rec.data_valid := i_vec(0);
  --   return o_rec;
  -- end function;
  -- -- mdt from tar
  -- function tar2heg_mdt_f_r2std(	i_rec : in tar2heg_mdt_rt	) return tar2heg_mdt_vt is
  --   variable o_vec : tar2heg_mdt_vt;
  -- begin
  --   o_vec := std_logic_vector(i_rec.layer) & std_logic_vector(i_rec.tube) & std_logic_vector(i_rec.time_le);
  --   return o_vec;
  -- end function;
  -- function tar2heg_mdt_f_std2rt(i_vec : in tar2heg_mdt_vt  ) return tar2heg_mdt_rt is
  --   variable o_rec : tar2heg_mdt_rt;
  -- begin
  --   o_rec.layer   := unsigned(i_vec(MDT_LAYER_LEN + MDT_TUBE_LEN + MDT_LE_TIME -1 downto MDT_TUBE_LEN + MDT_LE_TIME )); 
  --   o_rec.tube    := unsigned(i_vec(MDT_TUBE_LEN + MDT_LE_TIME -1 downto MDT_LE_TIME));
  --   o_rec.time_le := unsigned(i_vec(MDT_LE_TIME -1 downto 0));
  --   return o_rec;
  -- end function;


end package body common_pkg;
