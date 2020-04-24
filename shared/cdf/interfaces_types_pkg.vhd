library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package interfaces_types_pkg is

  function recordify(s: std_logic_vector) return unsigned;

  function vectorify(u: unsigned) return std_logic_vector;

  function recordify(s: std_logic_vector) return signed;

  function vectorify(s: signed) return std_logic_vector;

  ------------------------------------------------------------

  constant MAX_NUM_HP                 : integer    := 6;
  constant MAX_NUM_HEG                : integer    := 3;
  constant MAX_NUM_HPS                : integer    := 3;
  constant MAX_NUM_SL                 : integer    := 5;
  constant SLC_SLCID_LEN              : integer    := 2;                                   -- a comment
  constant SLC_SLID_LEN               : integer    := 6;
  constant BCID_LEN                   : integer    := 12;

  type slc_muid_rt is record
    slcid                           : std_logic_vector(SLC_SLCID_LEN-1 downto 0);          -- another comment
    slid                            : std_logic_vector(SLC_SLID_LEN-1 downto 0);
    bcid                            : std_logic_vector(BCID_LEN-1 downto 0);
  end record slc_muid_rt;


  constant SLC_MUID_LEN : integer := 20;
  subtype slc_muid_vt is std_logic_vector(SLC_MUID_LEN-1 downto 0);

  function vectorify(d: slc_muid_rt) return slc_muid_vt;
  function recordify(v: slc_muid_vt) return slc_muid_rt;
  function nullify return slc_muid_rt;

  constant SLC_CHAMBER_LEN            : integer    := 6;

  type slc_chid_rt is record
    mdt_inn                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    mdt_mid                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    mdt_out                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    mdt_ext                         : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
  end record slc_chid_rt;


  constant SLC_CHID_LEN : integer := 24;
  subtype slc_chid_vt is std_logic_vector(SLC_CHID_LEN-1 downto 0);

  function vectorify(d: slc_chid_rt) return slc_chid_vt;
  function recordify(v: slc_chid_vt) return slc_chid_rt;
  function nullify return slc_chid_rt;

  constant SLC_TCID_LEN               : integer    := 2;
  constant SLC_TCSENT_LEN             : integer    := 1;
  constant SLC_POS_ETA_LEN            : integer    := 15;
  constant SLC_POS_ETA_MULT           : real       := 0.014;
  constant SLC_POS_PHI_LEN            : integer    := 9;
  constant SLC_POS_PHI_MULT           : real       := 0.012;
  constant SLC_PT_TH_LEN              : integer    := 4;
  constant SLC_CHARGE_LEN             : integer    := 1;

  type slc_common_rt is record
    tcid                            : std_logic_vector(SLC_TCID_LEN-1 downto 0);
    tcsent                          : std_logic_vector(SLC_TCSENT_LEN-1 downto 0);
    pos_eta                         : signed(SLC_POS_ETA_LEN-1 downto 0);
    pos_phi                         : unsigned(SLC_POS_PHI_LEN-1 downto 0);
    pt_th                           : std_logic_vector(SLC_PT_TH_LEN-1 downto 0);
    charge                          : std_logic_vector(SLC_CHARGE_LEN-1 downto 0);
  end record slc_common_rt;


  constant SLC_COMMON_LEN : integer := 32;
  subtype slc_common_vt is std_logic_vector(SLC_COMMON_LEN-1 downto 0);

  function vectorify(d: slc_common_rt) return slc_common_vt;
  function recordify(v: slc_common_vt) return slc_common_rt;
  function nullify return slc_common_rt;

  constant SLC_B_SPARE_LEN            : integer    := 8;
  constant SLC_COIN_TYPE_LEN          : integer    := 3;
  constant SLC_Z_RPC_LEN              : integer    := 10;
  constant SLC_Z_RPC_MULT             : real       := 0.0234;

  type slc_barrel_rt is record
    spare_bits                      : std_logic_vector(SLC_B_SPARE_LEN-1 downto 0);
    coin_type                       : std_logic_vector(SLC_COIN_TYPE_LEN-1 downto 0);
    z_rpc0                          : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc1                          : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc2                          : signed(SLC_Z_RPC_LEN-1 downto 0);
    z_rpc3                          : signed(SLC_Z_RPC_LEN-1 downto 0);
  end record slc_barrel_rt;


  constant SLC_BARREL_LEN : integer := 51;
  subtype slc_barrel_vt is std_logic_vector(SLC_BARREL_LEN-1 downto 0);

  function vectorify(d: slc_barrel_rt) return slc_barrel_vt;
  function recordify(v: slc_barrel_vt) return slc_barrel_rt;
  function nullify return slc_barrel_rt;

  constant SLC_E_SPARE_LEN            : integer    := 8;
  constant SLC_R_LEN                  : integer    := 10;
  constant SLC_ANGLE_WRT_PHI_LEN      : integer    := 7;
  constant SLC_ANGLE_WRT_ETA_LEN      : integer    := 4;
  constant SLC_NSW_ETA_LEN            : integer    := 14;
  constant SLC_NSW_PHI_LEN            : integer    := 8;
  constant SLC_NSW_ANGLE_WRT_ETA_LEN  : integer    := 5;

  type slc_endcap_rt is record
    spare_bits                      : std_logic_vector(SLC_E_SPARE_LEN-1 downto 0);
    r                               : unsigned(SLC_R_LEN-1 downto 0);
    angle_wrt_phi                   : signed(SLC_ANGLE_WRT_PHI_LEN-1 downto 0);
    angle_wrt_eta                   : signed(SLC_ANGLE_WRT_ETA_LEN-1 downto 0);
    nsw_eta                         : unsigned(SLC_NSW_ETA_LEN-1 downto 0);
    nsw_phi                         : unsigned(SLC_NSW_PHI_LEN-1 downto 0);
    nsw_angle_wrt_eta               : signed(SLC_NSW_ANGLE_WRT_ETA_LEN-1 downto 0);
    nsw_monitor                     : std_logic;
  end record slc_endcap_rt;


  constant SLC_ENDCAP_LEN : integer := 57;
  subtype slc_endcap_vt is std_logic_vector(SLC_ENDCAP_LEN-1 downto 0);

  function vectorify(d: slc_endcap_rt) return slc_endcap_vt;
  function recordify(v: slc_endcap_vt) return slc_endcap_rt;
  function nullify return slc_endcap_rt;

  constant SLC_SPECIFIC_LEN           : integer    := 51;

  type slc_rx_data_rt is record
    muid                            : slc_muid_rt;
    chambers                        : slc_chid_rt;
    common                          : slc_common_rt;
    specific                        : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);       -- can be either slc_barrel_vt or slc_endcap_vt
    data_valid                      : std_logic;
  end record slc_rx_data_rt;


  constant SLC_RX_DATA_LEN : integer := 128;
  subtype slc_rx_data_vt is std_logic_vector(SLC_RX_DATA_LEN-1 downto 0);

  function vectorify(d: slc_rx_data_rt) return slc_rx_data_vt;
  function recordify(v: slc_rx_data_vt) return slc_rx_data_rt;
  function nullify return slc_rx_data_rt;

  type slc_rx_data_art is array (integer range <>) of slc_rx_data_rt;


  type slc_rx_data_avt is array (integer range <>) of slc_rx_data_vt;


  type ucm_csw_dest is array (MAX_NUM_SL downto 0) of std_logic_vector(4-1 downto 0);



  type ucm_csw_control_rt is record
    data_present                    : std_logic_vector(MAX_NUM_SL-1 downto 0);
    addr_orig                       : ucm_csw_dest;
  end record ucm_csw_control_rt;


  constant UCM_CSW_CONTROL_LEN : integer := 9;
  subtype ucm_csw_control_vt is std_logic_vector(UCM_CSW_CONTROL_LEN-1 downto 0);

  function vectorify(d: ucm_csw_control_rt) return ucm_csw_control_vt;
  function recordify(v: ucm_csw_control_vt) return ucm_csw_control_rt;
  function nullify return ucm_csw_control_rt;

  type ucm_cvp_dest is array (MAX_NUM_HEG downto 0) of std_logic_vector(4-1 downto 0);



  type ucm_pamcsw_control_rt is record
    data_present                    : std_logic_vector(MAX_NUM_SL-1 downto 0);
    addr_orig                       : ucm_cvp_dest;
  end record ucm_pamcsw_control_rt;


  constant UCM_PAMCSW_CONTROL_LEN : integer := 9;
  subtype ucm_pamcsw_control_vt is std_logic_vector(UCM_PAMCSW_CONTROL_LEN-1 downto 0);

  function vectorify(d: ucm_pamcsw_control_rt) return ucm_pamcsw_control_vt;
  function recordify(v: ucm_pamcsw_control_vt) return ucm_pamcsw_control_rt;
  function nullify return ucm_pamcsw_control_rt;


  type ucm_proc_info_rt is record
    ch                              : std_logic_vector(4-1 downto 0);
    proccesed                       : std_logic;
  end record ucm_proc_info_rt;


  constant UCM_PROC_INFO_LEN : integer := 5;
  subtype ucm_proc_info_vt is std_logic_vector(UCM_PROC_INFO_LEN-1 downto 0);

  function vectorify(d: ucm_proc_info_rt) return ucm_proc_info_vt;
  function recordify(v: ucm_proc_info_vt) return ucm_proc_info_rt;
  function nullify return ucm_proc_info_rt;

  type ucm_proc_info_a is array (integer range <>) of ucm_proc_info_rt;



  type ucm_ctrl_rt is record
    sel                             : std_logic;
    addr                            : std_logic_vector(4-1 downto 0);
  end record ucm_ctrl_rt;


  constant UCM_CTRL_LEN : integer := 5;
  subtype ucm_ctrl_vt is std_logic_vector(UCM_CTRL_LEN-1 downto 0);

  function vectorify(d: ucm_ctrl_rt) return ucm_ctrl_vt;
  function recordify(v: ucm_ctrl_vt) return ucm_ctrl_rt;
  function nullify return ucm_ctrl_rt;

  type ucm_ctrl_at is array (integer range <>) of ucm_ctrl_rt;


  constant UCM_MBAR_LEN               : integer    := 10;
  constant UCM_Z_ROI_LEN              : integer    := 7;
  constant UCM_R_ROI_LEN              : integer    := 4;
  constant UCM_PHI_LEN                : integer    := 14;
  constant UCM_ETA_LEN                : integer    := 8;
  constant UCM_CHAMBER_ID_LEN         : integer    := 5;

  type ucm_csf_barrel_rt is record
    mbar                            : unsigned(UCM_MBAR_LEN-1 downto 0);
    z                               : unsigned(UCM_Z_ROI_LEN-1 downto 0);
    r                               : unsigned(UCM_R_ROI_LEN-1 downto 0);
    phi                             : unsigned(UCM_PHI_LEN-1 downto 0);
    eta                             : unsigned(UCM_ETA_LEN-1 downto 0);
    chamber_id                      : unsigned(UCM_CHAMBER_ID_LEN-1 downto 0);
  end record ucm_csf_barrel_rt;


  constant UCM_CSF_BARREL_LEN : integer := 48;
  subtype ucm_csf_barrel_vt is std_logic_vector(UCM_CSF_BARREL_LEN-1 downto 0);

  function vectorify(d: ucm_csf_barrel_rt) return ucm_csf_barrel_vt;
  function recordify(v: ucm_csf_barrel_vt) return ucm_csf_barrel_rt;
  function nullify return ucm_csf_barrel_rt;

  type ucm_csf_barrel_at is array (integer range <>) of ucm_csf_barrel_rt;



  type pipeline_data_rt is record
    muid                            : slc_muid_rt;
    pl_common                       : slc_common_rt;
    specific                        : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    process_ch                      : std_logic_vector(4-1 downto 0);
    processed                       : std_logic;
    data_valid                      : std_logic;
  end record pipeline_data_rt;


  constant PIPELINE_DATA_LEN : integer := 109;
  subtype pipeline_data_vt is std_logic_vector(PIPELINE_DATA_LEN-1 downto 0);

  function vectorify(d: pipeline_data_rt) return pipeline_data_vt;
  function recordify(v: pipeline_data_vt) return pipeline_data_rt;
  function nullify return pipeline_data_rt;

  type pipeline_data_a is array (integer range <>) of pipeline_data_rt;


  constant MDT_TDC_CH_LEN             : integer    := 5;
  constant MDT_TDC_MODE_LEN           : integer    := 2;
  constant MDT_TDC_COARSE_LEN         : integer    := 12;
  constant MDT_TDC_FINE_LEN           : integer    := 5;
  constant MDT_TDC_PW_LEN             : integer    := 8;

  type mdt_tdc_rt is record
    ch                              : std_logic_vector(MDT_TDC_CH_LEN-1 downto 0);
    mode                            : std_logic_vector(MDT_TDC_MODE_LEN-1 downto 0);
    coarse                          : unsigned(MDT_TDC_COARSE_LEN-1 downto 0);
    fine                            : unsigned(MDT_TDC_FINE_LEN-1 downto 0);
    pw                              : unsigned(MDT_TDC_PW_LEN-1 downto 0);
  end record mdt_tdc_rt;


  constant MDT_TDC_LEN : integer := 32;
  subtype mdt_tdc_vt is std_logic_vector(MDT_TDC_LEN-1 downto 0);

  function vectorify(d: mdt_tdc_rt) return mdt_tdc_vt;
  function recordify(v: mdt_tdc_vt) return mdt_tdc_rt;
  function nullify return mdt_tdc_rt;

  constant MDT_FIBER_LEN              : integer    := 5;
  constant MDT_MUXCH_LEN              : integer    := 4;

  type mdt_pullmux_data_rt is record
    fiberID                         : std_logic_vector(MDT_FIBER_LEN-1 downto 0);
    muxID                           : std_logic_vector(MDT_MUXCH_LEN-1 downto 0);
    tdc                             : mdt_tdc_rt;
    data_valid                      : std_logic;
  end record mdt_pullmux_data_rt;


  constant MDT_PULLMUX_DATA_LEN : integer := 42;
  subtype mdt_pullmux_data_vt is std_logic_vector(MDT_PULLMUX_DATA_LEN-1 downto 0);

  function vectorify(d: mdt_pullmux_data_rt) return mdt_pullmux_data_vt;
  function recordify(v: mdt_pullmux_data_vt) return mdt_pullmux_data_rt;
  function nullify return mdt_pullmux_data_rt;

  constant MDT_TUBE_LEN               : integer    := 5;
  constant MDT_LAYER_LEN              : integer    := 9;
  constant MDT_TIME_LEN               : integer    := 18;

  type mdt_tar_data_rt is record
    tube                            : std_logic_vector(MDT_TUBE_LEN-1 downto 0);
    layer                           : std_logic_vector(MDT_LAYER_LEN-1 downto 0);
    time                            : unsigned(MDT_TIME_LEN-1 downto 0);
    data_valid                      : std_logic;
  end record mdt_tar_data_rt;


  constant MDT_TAR_DATA_LEN : integer := 33;
  subtype mdt_tar_data_vt is std_logic_vector(MDT_TAR_DATA_LEN-1 downto 0);

  function vectorify(d: mdt_tar_data_rt) return mdt_tar_data_vt;
  function recordify(v: mdt_tar_data_vt) return mdt_tar_data_rt;
  function nullify return mdt_tar_data_rt;

  type mdt_tar_data_a is array (integer range <>) of mdt_tar_data_rt;


  constant MDT_RADIUS_LEN             : integer    := 9;
  constant MDT_LOCAL_AXI_LEN          : integer    := 15;

  type hp_data_rt is record
    local_z                         : signed(MDT_LOCAL_AXI_LEN-1 downto 0);
    local_x                         : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    radius                          : unsigned(MDT_RADIUS_LEN-1 downto 0);
    multilayer                      : std_logic;
    data_valid                      : std_logic;
  end record hp_data_rt;


  constant HP_DATA_LEN : integer := 41;
  subtype hp_data_vt is std_logic_vector(HP_DATA_LEN-1 downto 0);

  function vectorify(d: hp_data_rt) return hp_data_vt;
  function recordify(v: hp_data_vt) return hp_data_rt;
  function nullify return hp_data_rt;

end package interfaces_types_pkg;


------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package body interfaces_types_pkg is

  function recordify(s: std_logic_vector) return unsigned is
  begin
    return unsigned(s);
  end function recordify;

  function vectorify(u: unsigned) return std_logic_vector is
  begin
    return std_logic_vector(u);
  end function vectorify;

  function recordify(s: std_logic_vector) return signed is
  begin
    return signed(s);
  end function recordify;

  function vectorify(s: signed) return std_logic_vector is
  begin
    return std_logic_vector(s);
  end function vectorify;

  ------------------------------------------------------------

  function nullify return slc_muid_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0'));
  end function nullify;

  function vectorify(d: slc_muid_rt) return slc_muid_vt is
    variable v : slc_muid_vt;
  begin
    v := d.slcid
         & d.slid
         & d.bcid;
    return v;
  end function vectorify;

  function recordify(v: slc_muid_vt) return slc_muid_rt is
    variable b : slc_muid_rt;
  begin
    b.slcid                := v(19 downto 18);
    b.slid                 := v(17 downto 12);
    b.bcid                 := v(11 downto 0);
    return b;
  end function recordify;

  function nullify return slc_chid_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0'));
  end function nullify;

  function vectorify(d: slc_chid_rt) return slc_chid_vt is
    variable v : slc_chid_vt;
  begin
    v := d.mdt_inn
         & d.mdt_mid
         & d.mdt_out
         & d.mdt_ext;
    return v;
  end function vectorify;

  function recordify(v: slc_chid_vt) return slc_chid_rt is
    variable b : slc_chid_rt;
  begin
    b.mdt_inn              := v(23 downto 18);
    b.mdt_mid              := v(17 downto 12);
    b.mdt_out              := v(11 downto 6);
    b.mdt_ext              := v(5 downto 0);
    return b;
  end function recordify;

  function nullify return slc_common_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0'));
  end function nullify;

  function vectorify(d: slc_common_rt) return slc_common_vt is
    variable v : slc_common_vt;
  begin
    v := d.tcid
         & d.tcsent
         & vectorify(d.pos_eta)
         & vectorify(d.pos_phi)
         & d.pt_th
         & d.charge;
    return v;
  end function vectorify;

  function recordify(v: slc_common_vt) return slc_common_rt is
    variable b : slc_common_rt;
  begin
    b.tcid                 := v(31 downto 30);
    b.tcsent               := v(29 downto 29);
    b.pos_eta              := recordify(v(28 downto 14));
    b.pos_phi              := recordify(v(13 downto 5));
    b.pt_th                := v(4 downto 1);
    b.charge               := v(0 downto 0);
    return b;
  end function recordify;

  function nullify return slc_barrel_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0'));
  end function nullify;

  function vectorify(d: slc_barrel_rt) return slc_barrel_vt is
    variable v : slc_barrel_vt;
  begin
    v := d.spare_bits
         & d.coin_type
         & vectorify(d.z_rpc0)
         & vectorify(d.z_rpc1)
         & vectorify(d.z_rpc2)
         & vectorify(d.z_rpc3);
    return v;
  end function vectorify;

  function recordify(v: slc_barrel_vt) return slc_barrel_rt is
    variable b : slc_barrel_rt;
  begin
    b.spare_bits           := v(50 downto 43);
    b.coin_type            := v(42 downto 40);
    b.z_rpc0               := recordify(v(39 downto 30));
    b.z_rpc1               := recordify(v(29 downto 20));
    b.z_rpc2               := recordify(v(19 downto 10));
    b.z_rpc3               := recordify(v(9 downto 0));
    return b;
  end function recordify;

  function nullify return slc_endcap_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , '0');
  end function nullify;

  function vectorify(d: slc_endcap_rt) return slc_endcap_vt is
    variable v : slc_endcap_vt;
  begin
    v := d.spare_bits
         & vectorify(d.r)
         & vectorify(d.angle_wrt_phi)
         & vectorify(d.angle_wrt_eta)
         & vectorify(d.nsw_eta)
         & vectorify(d.nsw_phi)
         & vectorify(d.nsw_angle_wrt_eta)
         & d.nsw_monitor;
    return v;
  end function vectorify;

  function recordify(v: slc_endcap_vt) return slc_endcap_rt is
    variable b : slc_endcap_rt;
  begin
    b.spare_bits           := v(56 downto 49);
    b.r                    := recordify(v(48 downto 39));
    b.angle_wrt_phi        := recordify(v(38 downto 32));
    b.angle_wrt_eta        := recordify(v(31 downto 28));
    b.nsw_eta              := recordify(v(27 downto 14));
    b.nsw_phi              := recordify(v(13 downto 6));
    b.nsw_angle_wrt_eta    := recordify(v(5 downto 1));
    b.nsw_monitor          := v(0);
    return b;
  end function recordify;

  function nullify return slc_rx_data_rt is
  begin
    return (nullify
            , nullify
            , nullify
            , (others => '0')
            , '0');
  end function nullify;

  function vectorify(d: slc_rx_data_rt) return slc_rx_data_vt is
    variable v : slc_rx_data_vt;
  begin
    v := vectorify(d.muid)
         & vectorify(d.chambers)
         & vectorify(d.common)
         & d.specific
         & d.data_valid;
    return v;
  end function vectorify;

  function recordify(v: slc_rx_data_vt) return slc_rx_data_rt is
    variable b : slc_rx_data_rt;
  begin
    b.muid                 := recordify(v(127 downto 108));
    b.chambers             := recordify(v(107 downto 84));
    b.common               := recordify(v(83 downto 52));
    b.specific             := v(51 downto 1);
    b.data_valid           := v(0);
    return b;
  end function recordify;

  function nullify return ucm_csw_control_rt is
  begin
    return ((others => '0')
            , nullify);
  end function nullify;

  function vectorify(d: ucm_csw_control_rt) return ucm_csw_control_vt is
    variable v : ucm_csw_control_vt;
  begin
    v := d.data_present
         & vectorify(d.addr_orig);
    return v;
  end function vectorify;

  function recordify(v: ucm_csw_control_vt) return ucm_csw_control_rt is
    variable b : ucm_csw_control_rt;
  begin
    b.data_present         := v(8 downto 4);
    b.addr_orig            := recordify(v(3 downto 0));
    return b;
  end function recordify;

  function nullify return ucm_pamcsw_control_rt is
  begin
    return ((others => '0')
            , nullify);
  end function nullify;

  function vectorify(d: ucm_pamcsw_control_rt) return ucm_pamcsw_control_vt is
    variable v : ucm_pamcsw_control_vt;
  begin
    v := d.data_present
         & vectorify(d.addr_orig);
    return v;
  end function vectorify;

  function recordify(v: ucm_pamcsw_control_vt) return ucm_pamcsw_control_rt is
    variable b : ucm_pamcsw_control_rt;
  begin
    b.data_present         := v(8 downto 4);
    b.addr_orig            := recordify(v(3 downto 0));
    return b;
  end function recordify;

  function nullify return ucm_proc_info_rt is
  begin
    return ((others => '0')
            , '0');
  end function nullify;

  function vectorify(d: ucm_proc_info_rt) return ucm_proc_info_vt is
    variable v : ucm_proc_info_vt;
  begin
    v := d.ch
         & d.proccesed;
    return v;
  end function vectorify;

  function recordify(v: ucm_proc_info_vt) return ucm_proc_info_rt is
    variable b : ucm_proc_info_rt;
  begin
    b.ch                   := v(4 downto 1);
    b.proccesed            := v(0);
    return b;
  end function recordify;

  function nullify return ucm_ctrl_rt is
  begin
    return ('0'
            , (others => '0'));
  end function nullify;

  function vectorify(d: ucm_ctrl_rt) return ucm_ctrl_vt is
    variable v : ucm_ctrl_vt;
  begin
    v := d.sel
         & d.addr;
    return v;
  end function vectorify;

  function recordify(v: ucm_ctrl_vt) return ucm_ctrl_rt is
    variable b : ucm_ctrl_rt;
  begin
    b.sel                  := v(4);
    b.addr                 := v(3 downto 0);
    return b;
  end function recordify;

  function nullify return ucm_csf_barrel_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0'));
  end function nullify;

  function vectorify(d: ucm_csf_barrel_rt) return ucm_csf_barrel_vt is
    variable v : ucm_csf_barrel_vt;
  begin
    v := vectorify(d.mbar)
         & vectorify(d.z)
         & vectorify(d.r)
         & vectorify(d.phi)
         & vectorify(d.eta)
         & vectorify(d.chamber_id);
    return v;
  end function vectorify;

  function recordify(v: ucm_csf_barrel_vt) return ucm_csf_barrel_rt is
    variable b : ucm_csf_barrel_rt;
  begin
    b.mbar                 := recordify(v(47 downto 38));
    b.z                    := recordify(v(37 downto 31));
    b.r                    := recordify(v(30 downto 27));
    b.phi                  := recordify(v(26 downto 13));
    b.eta                  := recordify(v(12 downto 5));
    b.chamber_id           := recordify(v(4 downto 0));
    return b;
  end function recordify;

  function nullify return pipeline_data_rt is
  begin
    return (nullify
            , nullify
            , (others => '0')
            , (others => '0')
            , '0'
            , '0');
  end function nullify;

  function vectorify(d: pipeline_data_rt) return pipeline_data_vt is
    variable v : pipeline_data_vt;
  begin
    v := vectorify(d.muid)
         & vectorify(d.pl_common)
         & d.specific
         & d.process_ch
         & d.processed
         & d.data_valid;
    return v;
  end function vectorify;

  function recordify(v: pipeline_data_vt) return pipeline_data_rt is
    variable b : pipeline_data_rt;
  begin
    b.muid                 := recordify(v(108 downto 89));
    b.pl_common            := recordify(v(88 downto 57));
    b.specific             := v(56 downto 6);
    b.process_ch           := v(5 downto 2);
    b.processed            := v(1);
    b.data_valid           := v(0);
    return b;
  end function recordify;

  function nullify return mdt_tdc_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0')
            , (others => '0'));
  end function nullify;

  function vectorify(d: mdt_tdc_rt) return mdt_tdc_vt is
    variable v : mdt_tdc_vt;
  begin
    v := d.ch
         & d.mode
         & vectorify(d.coarse)
         & vectorify(d.fine)
         & vectorify(d.pw);
    return v;
  end function vectorify;

  function recordify(v: mdt_tdc_vt) return mdt_tdc_rt is
    variable b : mdt_tdc_rt;
  begin
    b.ch                   := v(31 downto 27);
    b.mode                 := v(26 downto 25);
    b.coarse               := recordify(v(24 downto 13));
    b.fine                 := recordify(v(12 downto 8));
    b.pw                   := recordify(v(7 downto 0));
    return b;
  end function recordify;

  function nullify return mdt_pullmux_data_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , nullify
            , '0');
  end function nullify;

  function vectorify(d: mdt_pullmux_data_rt) return mdt_pullmux_data_vt is
    variable v : mdt_pullmux_data_vt;
  begin
    v := d.fiberID
         & d.muxID
         & vectorify(d.tdc)
         & d.data_valid;
    return v;
  end function vectorify;

  function recordify(v: mdt_pullmux_data_vt) return mdt_pullmux_data_rt is
    variable b : mdt_pullmux_data_rt;
  begin
    b.fiberID              := v(41 downto 37);
    b.muxID                := v(36 downto 33);
    b.tdc                  := recordify(v(32 downto 1));
    b.data_valid           := v(0);
    return b;
  end function recordify;

  function nullify return mdt_tar_data_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , '0');
  end function nullify;

  function vectorify(d: mdt_tar_data_rt) return mdt_tar_data_vt is
    variable v : mdt_tar_data_vt;
  begin
    v := d.tube
         & d.layer
         & vectorify(d.time)
         & d.data_valid;
    return v;
  end function vectorify;

  function recordify(v: mdt_tar_data_vt) return mdt_tar_data_rt is
    variable b : mdt_tar_data_rt;
  begin
    b.tube                 := v(32 downto 28);
    b.layer                := v(27 downto 19);
    b.time                 := recordify(v(18 downto 1));
    b.data_valid           := v(0);
    return b;
  end function recordify;

  function nullify return hp_data_rt is
  begin
    return ((others => '0')
            , (others => '0')
            , (others => '0')
            , '0'
            , '0');
  end function nullify;

  function vectorify(d: hp_data_rt) return hp_data_vt is
    variable v : hp_data_vt;
  begin
    v := vectorify(d.local_z)
         & vectorify(d.local_x)
         & vectorify(d.radius)
         & d.multilayer
         & d.data_valid;
    return v;
  end function vectorify;

  function recordify(v: hp_data_vt) return hp_data_rt is
    variable b : hp_data_rt;
  begin
    b.local_z              := recordify(v(40 downto 26));
    b.local_x              := recordify(v(25 downto 11));
    b.radius               := recordify(v(10 downto 2));
    b.multilayer           := v(1);
    b.data_valid           := v(0);
    return b;
  end function recordify;

end package body interfaces_types_pkg;
