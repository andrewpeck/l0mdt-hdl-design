--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

package heg_pkg is
  --------------------------------------------------------------------------------
  --  slc port
  --------------------------------------------------------------------------------
  -- type ucm_slc_barrel_rt is record --from TAR & PC
  --   z           : SLc_zpos_st;          -- 10 bits
  --   z_0         : SLc_zpos_st;          -- 10 bits
  --   phi         : signed(SLC_PHI_LEN-1 downto 0); 
  --   mbar        : signed(SLC_MBAR_LEN -1 downto 0);
  -- end record;
  -- constant null_ucm_slc_barrel_rt : ucm_slc_barrel_rt := ((others => '0'),(others => '0'),(others => '0'),(others => '0'));
  -- type ucm2heg_slc_rt is record
  --   BCID        : SLc_BCID_st;          -- 12 bits
  --   barrel      : ucm_slc_barrel_rt; --barrel_ucm_t(ST_nBARREL_ENDCAP downto 0);
  --   -- endcap      : hp_SLc_endcap_rt; --endcap_ucm_t(ST_nBARREL_ENDCAP downto 1);
  --   data_valid  : std_logic;
  -- end record;
  -- constant null_ucm2heg_slc_rt : ucm2heg_slc_rt := (null_SLc_BCID_st,null_ucm_slc_barrel_rt,'0');
  --------------------------------------------------------------------------------
  --  mdt port
  --------------------------------------------------------------------------------
  type heg_pc2heg_rt is record
    tube                       : std_logic_vector(MDT_TUBE_LEN-1 downto 0);
    layer                      : std_logic_vector(MDT_LAYER_LEN-1 downto 0);
    time_t0                    : unsigned(MDT_TIME_LEN-1 downto 0);
    global_z                   : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    global_y                   : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record heg_pc2heg_rt;
  constant HEG_PC2HEG_LEN : integer := 63;
  subtype heg_pc2heg_vt is std_logic_vector(HEG_PC2HEG_LEN-1 downto 0);
  function vectorify(x: heg_pc2heg_rt) return heg_pc2heg_vt;
  function structify(x: heg_pc2heg_vt) return heg_pc2heg_rt;
  function nullify (x: heg_pc2heg_rt) return heg_pc2heg_rt;

  type heg_pc2heg_avt is array ( integer range <>) of heg_pc2heg_vt;

  --------------------------------------------------------------------------------
  -- HEG control to hp
  --------------------------------------------------------------------------------

  type heg_int_control_rt is record
    hp_resets_b : std_logic_vector(MAX_NUM_HP -1 downto 0);
    hp_enables  : std_logic_vector(MAX_NUM_HP -1 downto 0);
  end record;
  constant null_heg_control_rt : heg_int_control_rt := ((others => '1'), (others => '0'));
  type heg_int_control_art is array (integer range <>) of heg_int_control_rt;

  --------------------------------------------------------------------------------
  -- HEG window to hp
  --------------------------------------------------------------------------------
  
  type heg_heg2hp_win_layer_st is array(2-1 downto 0) of std_logic_vector(MDT_TUBE_LEN-1 downto 0);
  constant HEG_HEG2HP_WIN_LAYER_LEN : integer := 10;
  subtype HEG_HEG2HP_WIN_LAYER_vt is std_logic_vector(HEG_HEG2HP_WIN_LAYER_LEN-1 downto 0);
  function vectorify(x: heg_heg2hp_win_layer_st) return heg_heg2hp_win_layer_vt;
  function structify (x: heg_heg2hp_win_layer_vt) return heg_heg2hp_win_layer_st;
  function nullify (x: heg_heg2hp_win_layer_st) return heg_heg2hp_win_layer_st;

  type heg_heg2hp_window_st is array(8-1 downto 0) of hp_heg2hp_win_layer_st;
  constant HEG_HEG2HP_WINDOW_LEN : integer := 80;
  subtype HEG_HEG2HP_WINDOW_vt is std_logic_vector(HEG_HEG2HP_WINDOW_LEN-1 downto 0);
  function vectorify(x: heg_heg2hp_window_st) return heg_heg2hp_window_vt;
  function structify (x: heg_heg2hp_window_vt) return heg_heg2hp_window_st;
  function nullify (x: heg_heg2hp_window_st) return heg_heg2hp_window_st;


  --------------------------------------------------------------------------------
  -- HEG slc to hp
  --------------------------------------------------------------------------------
  type heg_heg2hp_slc_b_rt is record
    z_0                        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    y_0                        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  end record heg_heg2hp_slc_b_rt;
  constant HEG_HEG2HP_SLC_B_LEN : integer := 38;
  subtype heg_heg2hp_slc_b_vt is std_logic_vector(HEG_HEG2HP_SLC_B_LEN-1 downto 0);
  function vectorify(x: heg_heg2hp_slc_b_rt) return heg_heg2hp_slc_b_vt;
  function structify(x: heg_heg2hp_slc_b_vt) return heg_heg2hp_slc_b_rt;
  function nullify (x: heg_heg2hp_slc_b_rt) return heg_heg2hp_slc_b_rt;

  constant HEG_HEG2HP_SPECIFIC_LEN : integer := 38;

  type heg_heg2hp_slc_rt is record
    bcid                       : std_logic_vector(BCID_LEN-1 downto 0);
    specific                   : std_logic_vector(HEG_HEG2HP_SPECIFIC_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record heg_heg2hp_slc_rt;
  constant HEG_HEG2HP_SLC_LEN : integer := 51;
  subtype heg_heg2hp_slc_vt is std_logic_vector(HEG_HEG2HP_SLC_LEN-1 downto 0);
  function vectorify(x: heg_heg2hp_slc_rt) return heg_heg2hp_slc_vt;
  function structify(x: heg_heg2hp_slc_vt) return heg_heg2hp_slc_rt;
  function nullify (x: heg_heg2hp_slc_rt) return heg_heg2hp_slc_rt;
  -- heg to sf (slc_info)
  -- type heg_2_sf_slc_rt is record

  --   data_valid  : std_logic;
  -- end record;

  --------------------------------------------------------------------------------
  -- heg to sf hit data
  --------------------------------------------------------------------------------
  type heg_hp2sf_data_rt is record
    local_z                    : signed(MDT_LOCAL_AXI_LEN-1 downto 0);
    local_x                    : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    radius                     : unsigned(MDT_RADIUS_LEN-1 downto 0);
    layer                      : std_logic_vector(MDT_LAYER_LEN-1 downto 0);
  end record heg_hp2sf_data_rt;
  constant HEG_HP2SF_DATA_LEN : integer := 48;
  subtype heg_hp2sf_data_vt is std_logic_vector(HEG_HP2SF_DATA_LEN-1 downto 0);
  function vectorify(x: heg_hp2sf_data_rt) return heg_hp2sf_data_vt;
  function structify(x: heg_hp2sf_data_vt) return heg_hp2sf_data_rt;
  function nullify (x: heg_hp2sf_data_rt) return heg_hp2sf_data_rt;

  type heg_hp2bm_rt is record
    data                       : heg_hp2sf_data_rt;
    mdt_valid                  : std_logic;
    data_valid                 : std_logic;
  end record heg_hp2bm_rt;
  constant HEG_HP2BM_LEN : integer := 50;
  subtype heg_hp2bm_vt is std_logic_vector(HEG_HP2BM_LEN-1 downto 0);
  function vectorify(x: heg_hp2bm_rt) return heg_hp2bm_vt;
  function structify(x: heg_hp2bm_vt) return heg_hp2bm_rt;
  function nullify (x: heg_hp2bm_rt) return heg_hp2bm_rt;

  type heg_bm2sf_rt is record
    data                       : heg_hp2sf_data_rt;
    mdt_valid                  : std_logic;
    data_valid                 : std_logic;
  end record heg_bm2sf_rt;
  constant HEG_BM2SF_LEN : integer := 50;
  subtype heg_bm2sf_vt is std_logic_vector(HEG_BM2SF_LEN-1 downto 0);
  function vectorify(x: heg_bm2sf_rt) return heg_bm2sf_vt;
  function structify(x: heg_bm2sf_vt) return heg_bm2sf_rt;
  function nullify (x: heg_bm2sf_rt) return heg_bm2sf_rt;
  -- type heg2sf_mdt_rt is record
  --   sf_data     : hp2bm_sf_rt; --hp2bm_csf_t(SF_type downto 0);
  --   data_valid  : std_logic;
  -- end record;
  -- constant null_heg2sf_mdt_rt : heg2sf_mdt_rt := (null_hp2bm_sf_rt,'0');
  -- type heg2sf_mdt_art is array (integer range <>) of heg2sf_mdt_rt;
  -- -- type hp2bm_avt is array (MAX_NUM_HP -1 downto 0) of hp2bm_vt;
  -- subtype heg2sf_mdt_vt is std_logic_vector((HP2BM_SF_LEN + 1) -1 downto 0);
  -- type heg2sf_mdt_avt is array (integer range <>) of heg2sf_mdt_vt;

end package heg_pkg;

package body heg_pkg is
  --------------------------------------------------------------------------------
  --  mdt port
  --------------------------------------------------------------------------------
function vectorify(x: heg_pc2heg_rt) return heg_pc2heg_vt is
  variable y : heg_pc2heg_vt;
begin
  y(62 downto 58)            := x.tube;
  y(57 downto 49)            := x.layer;
  y(48 downto 31)            := vectorify(x.time_t0);
  y(30 downto 16)            := vectorify(x.global_z);
  y(15 downto 1)             := vectorify(x.global_y);
  y(0)                       := x.data_valid;
  return y;
end function vectorify;
function structify(x: heg_pc2heg_vt) return heg_pc2heg_rt is
  variable y : heg_pc2heg_rt;
begin
  y.tube                     := x(62 downto 58);
  y.layer                    := x(57 downto 49);
  y.time_t0                  := structify(x(48 downto 31));
  y.global_z                 := structify(x(30 downto 16));
  y.global_y                 := structify(x(15 downto 1));
  y.data_valid               := x(0);
  return y;
end function structify;
function nullify (x: heg_pc2heg_rt) return heg_pc2heg_rt is
  variable y : heg_pc2heg_rt;
begin
  y.tube                     := nullify(x.tube);
  y.layer                    := nullify(x.layer);
  y.time_t0                  := nullify(x.time_t0);
  y.global_z                 := nullify(x.global_z);
  y.global_y                 := nullify(x.global_y);
  y.data_valid               := nullify(x.data_valid);
  return y;
end function nullify;

  --------------------------------------------------------------------------------
  -- HEG control to hp
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- HEG window to hp
  --------------------------------------------------------------------------------
  function vectorify(x: heg_heg2hp_win_layer_st) return heg_heg2hp_win_layer_vt is
    variable y : std_logic_vector(x'range);
    variable msb, lsb : integer;
  begin
    l: for i in x'range loop
      msb := i * vectorify(x(i))'length + vectorify(x(i))'left;
      lsb := i * vectorify(x(i))'length;
      y(msb downto lsb) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function structify (x: heg_heg2hp_win_layer_vt) return heg_heg2hp_win_layer_st is
    variable y : heg_heg2hp_win_layer_st;
    variable msb, lsb : integer;
  begin
    l: for i in y'range loop
      msb := i * vectorify(y(i))'length + vectorify(y(i))'left;
      lsb := i * vectorify(y(i))'length;
      y(i) := structify(x(msb downto lsb));
    end loop l;
    return y;
  end function structify;
  function nullify (x: heg_heg2hp_win_layer_st) return heg_heg2hp_win_layer_st is
    variable y : heg_heg2hp_win_layer_st;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: heg_heg2hp_window_st) return heg_heg2hp_window_vt is
    variable y : std_logic_vector(x'range);
    variable msb, lsb : integer;
  begin
    l: for i in x'range loop
      msb := i * vectorify(x(i))'length + vectorify(x(i))'left;
      lsb := i * vectorify(x(i))'length;
      y(msb downto lsb) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function structify (x: heg_heg2hp_window_vt) return heg_heg2hp_window_st is
    variable y : heg_heg2hp_window_st;
    variable msb, lsb : integer;
  begin
    l: for i in y'range loop
      msb := i * vectorify(y(i))'length + vectorify(y(i))'left;
      lsb := i * vectorify(y(i))'length;
      y(i) := structify(x(msb downto lsb));
    end loop l;
    return y;
  end function structify;
  function nullify (x: heg_heg2hp_window_st) return heg_heg2hp_window_st is
    variable y : heg_heg2hp_window_st;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  --------------------------------------------------------------------------------
  -- HEG slc to hp
  --------------------------------------------------------------------------------
  function vectorify(x: heg_heg2hp_slc_b_rt) return heg_heg2hp_slc_b_vt is
    variable y : heg_heg2hp_slc_b_vt;
  begin
    y(37 downto 19)            := vectorify(x.z_0);
    y(18 downto 0)             := vectorify(x.y_0);
    return y;
  end function vectorify;
  function structify(x: heg_heg2hp_slc_b_vt) return heg_heg2hp_slc_b_rt is
    variable y : heg_heg2hp_slc_b_rt;
  begin
    y.z_0                      := structify(x(37 downto 19));
    y.y_0                      := structify(x(18 downto 0));
    return y;
  end function structify;
  function nullify (x: heg_heg2hp_slc_b_rt) return heg_heg2hp_slc_b_rt is
    variable y : heg_heg2hp_slc_b_rt;
  begin
    y.z_0                      := nullify(x.z_0);
    y.y_0                      := nullify(x.y_0);
    return y;
  end function nullify;


  function vectorify(x: heg_heg2hp_slc_rt) return heg_heg2hp_slc_vt is
    variable y : heg_heg2hp_slc_vt;
  begin
    y(50 downto 39)            := x.bcid;
    y(38 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: heg_heg2hp_slc_vt) return heg_heg2hp_slc_rt is
    variable y : heg_heg2hp_slc_rt;
  begin
    y.bcid                     := x(50 downto 39);
    y.specific                 := x(38 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: heg_heg2hp_slc_rt) return heg_heg2hp_slc_rt is
    variable y : heg_heg2hp_slc_rt;
  begin
    y.bcid                     := nullify(x.bcid);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;


  function vectorify(x: heg_hp2sf_data_rt) return heg_hp2sf_data_vt is
    variable y : heg_hp2sf_data_vt;
  begin
    y(47 downto 33)            := vectorify(x.local_z);
    y(32 downto 18)            := vectorify(x.local_x);
    y(17 downto 9)             := vectorify(x.radius);
    y(8 downto 0)              := x.layer;
    return y;
  end function vectorify;
  function structify(x: heg_hp2sf_data_vt) return heg_hp2sf_data_rt is
    variable y : heg_hp2sf_data_rt;
  begin
    y.local_z                  := structify(x(47 downto 33));
    y.local_x                  := structify(x(32 downto 18));
    y.radius                   := structify(x(17 downto 9));
    y.layer                    := x(8 downto 0);
    return y;
  end function structify;
  function nullify (x: heg_hp2sf_data_rt) return heg_hp2sf_data_rt is
    variable y : heg_hp2sf_data_rt;
  begin
    y.local_z                  := nullify(x.local_z);
    y.local_x                  := nullify(x.local_x);
    y.radius                   := nullify(x.radius);
    y.layer                    := nullify(x.layer);
    return y;
  end function nullify;

  function vectorify(x: heg_hp2bm_rt) return heg_hp2bm_vt is
    variable y : heg_hp2bm_vt;
  begin
    y(49 downto 2)             := vectorify(x.data);
    y(1)                       := x.mdt_valid;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: heg_hp2bm_vt) return heg_hp2bm_rt is
    variable y : heg_hp2bm_rt;
  begin
    y.data                     := structify(x(49 downto 2));
    y.mdt_valid                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: heg_hp2bm_rt) return heg_hp2bm_rt is
    variable y : heg_hp2bm_rt;
  begin
    y.data                     := nullify(x.data);
    y.mdt_valid                := nullify(x.mdt_valid);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: heg_bm2sf_rt) return heg_bm2sf_vt is
    variable y : heg_bm2sf_vt;
  begin
    y(49 downto 2)             := vectorify(x.data);
    y(1)                       := x.mdt_valid;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: heg_bm2sf_vt) return heg_bm2sf_rt is
    variable y : heg_bm2sf_rt;
  begin
    y.data                     := structify(x(49 downto 2));
    y.mdt_valid                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: heg_bm2sf_rt) return heg_bm2sf_rt is
    variable y : heg_bm2sf_rt;
  begin
    y.data                     := nullify(x.data);
    y.mdt_valid                := nullify(x.mdt_valid);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;


end package body heg_pkg;