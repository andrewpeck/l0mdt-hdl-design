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
--   26/11/2019     0.1     File created
--    05/02/2020    0.11    HP matching parameters added
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

package hp_pkg is

  constant HP_DRIFT_TIME_LEN : integer := MDT_TIME_LEN;

  --------------------------------------------------------------------------------
  --  slc window
  --------------------------------------------------------------------------------
  type hp_win_tubs_rt is record
    hi                         : unsigned(MDT_TUBE_LEN-1 downto 0);
    lo                         : unsigned(MDT_TUBE_LEN-1 downto 0);
  end record hp_win_tubs_rt;
  constant HP_WIN_TUBS_LEN : integer := 18;
  subtype hp_win_tubs_vt is std_logic_vector(HP_WIN_TUBS_LEN-1 downto 0);
  function vectorify(x: hp_win_tubs_rt) return hp_win_tubs_vt;
  function structify(x: hp_win_tubs_vt) return hp_win_tubs_rt;
  function nullify (x: hp_win_tubs_rt) return hp_win_tubs_rt;

  type hp_heg2hp_window_st is array(8-1 downto 0) of hp_win_tubs_rt;
  constant HP_HEG2HP_WINDOW_LEN : integer := 144;
  subtype HP_HEG2HP_WINDOW_vt is std_logic_vector(HP_HEG2HP_WINDOW_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_window_st) return hp_heg2hp_window_vt;
  function structify (x: hp_heg2hp_window_vt) return hp_heg2hp_window_st;
  function nullify (x: hp_heg2hp_window_st) return hp_heg2hp_window_st;
  --------------------------------------------------------------------------------
  --  slc port
  --------------------------------------------------------------------------------
  type hp_heg2hp_slc_b_rt is record
    z_0                        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    y_0                        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  end record hp_heg2hp_slc_b_rt;
  constant HP_HEG2HP_SLC_B_LEN : integer := 38;
  subtype hp_heg2hp_slc_b_vt is std_logic_vector(HP_HEG2HP_SLC_B_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_vt;
  function structify(x: hp_heg2hp_slc_b_vt) return hp_heg2hp_slc_b_rt;
  function nullify (x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_rt;

  constant HP_HEG2HP_SPECIFIC_LEN : integer := 38;

  type hp_heg2hp_slc_rt is record
    bcid                       : unsigned(BCID_LEN-1 downto 0);
    specific                   : std_logic_vector(HP_HEG2HP_SPECIFIC_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record hp_heg2hp_slc_rt;
  constant HP_HEG2HP_SLC_LEN : integer := 51;
  subtype hp_heg2hp_slc_vt is std_logic_vector(HP_HEG2HP_SLC_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_vt;
  function structify(x: hp_heg2hp_slc_vt) return hp_heg2hp_slc_rt;
  function nullify (x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_rt;

  --------------------------------------------------------------------------------
  --  mdt input port
  --------------------------------------------------------------------------------
  type hp_hpsPc2hp_rt is record
    tube                       : unsigned(MDT_TUBE_LEN-1 downto 0);
    layer                      : unsigned(MDT_LAYER_LEN-1 downto 0);
    time_t0                    : unsigned(MDT_TIME_LEN-1 downto 0);
    global_z                   : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    global_y                   : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record hp_hpsPc2hp_rt;
  constant HP_HPSPC2HP_LEN : integer := 71;
  subtype hp_hpsPc2hp_vt is std_logic_vector(HP_HPSPC2HP_LEN-1 downto 0);
  function vectorify(x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_vt;
  function structify(x: hp_hpsPc2hp_vt) return hp_hpsPc2hp_rt;
  function nullify (x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_rt;

  --------------------------------------------------------------------------------
  --  mdtoutput port
  --------------------------------------------------------------------------------
  type hp_hp2sf_data_rt is record
    local_z                    : signed(MDT_LOCAL_AXI_LEN-1 downto 0);
    local_y                    : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    radius                     : unsigned(MDT_RADIUS_LEN-1 downto 0);
    layer                      : unsigned(MDT_LAYER_LEN-1 downto 0);
  end record hp_hp2sf_data_rt;
  constant HP_HP2SF_DATA_LEN : integer := 44;
  subtype hp_hp2sf_data_vt is std_logic_vector(HP_HP2SF_DATA_LEN-1 downto 0);
  function vectorify(x: hp_hp2sf_data_rt) return hp_hp2sf_data_vt;
  function structify(x: hp_hp2sf_data_vt) return hp_hp2sf_data_rt;
  function nullify (x: hp_hp2sf_data_rt) return hp_hp2sf_data_rt;

  type hp_hp2bm_rt is record
    data                       : hp_hp2sf_data_rt;
    mdt_valid                  : std_logic;
    data_valid                 : std_logic;
  end record hp_hp2bm_rt;
  constant HP_HP2BM_LEN : integer := 46;
  subtype hp_hp2bm_vt is std_logic_vector(HP_HP2BM_LEN-1 downto 0);
  function vectorify(x: hp_hp2bm_rt) return hp_hp2bm_vt;
  function structify(x: hp_hp2bm_vt) return hp_hp2bm_rt;
  function nullify (x: hp_hp2bm_rt) return hp_hp2bm_rt;

end package hp_pkg;

package body hp_pkg is
  --------------------------------------------------------------------------------
  -- RoI window functions
  --------------------------------------------------------------------------------
  function vectorify(x: hp_win_tubs_rt) return hp_win_tubs_vt is
    variable y : hp_win_tubs_vt;
  begin
    y(17 downto 9)             := vectorify(x.hi);
    y(8 downto 0)              := vectorify(x.lo);
    return y;
  end function vectorify;
  function structify(x: hp_win_tubs_vt) return hp_win_tubs_rt is
    variable y : hp_win_tubs_rt;
  begin
    y.hi                       := structify(x(17 downto 9));
    y.lo                       := structify(x(8 downto 0));
    return y;
  end function structify;
  function nullify (x: hp_win_tubs_rt) return hp_win_tubs_rt is
    variable y : hp_win_tubs_rt;
  begin
    y.hi                       := nullify(x.hi);
    y.lo                       := nullify(x.lo);
    return y;
  end function nullify;

  function vectorify(x: hp_heg2hp_window_st) return hp_heg2hp_window_vt is
    variable y : hp_heg2hp_window_vt;--std_logic_vector(x'range);
    variable msb, lsb : integer;
  begin
    l: for i in x'range loop
      msb := i * vectorify(x(i))'length + vectorify(x(i))'left;
      lsb := i * vectorify(x(i))'length;
      y(msb downto lsb) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function structify (x: hp_heg2hp_window_vt) return hp_heg2hp_window_st is
    variable y : hp_heg2hp_window_st;
    variable msb, lsb : integer;
  begin
    l: for i in y'range loop
      msb := i * vectorify(y(i))'length + vectorify(y(i))'left;
      lsb := i * vectorify(y(i))'length;
      y(i) := structify(x(msb downto lsb));
    end loop l;
    return y;
  end function structify;
  function nullify (x: hp_heg2hp_window_st) return hp_heg2hp_window_st is
    variable y : hp_heg2hp_window_st;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  --------------------------------------------------------------------------------
  -- SLC data functions
  --------------------------------------------------------------------------------
  
  function vectorify(x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_vt is
    variable y : hp_heg2hp_slc_b_vt;
  begin
    y(37 downto 19)            := vectorify(x.z_0);
    y(18 downto 0)             := vectorify(x.y_0);
    return y;
  end function vectorify;
  function structify(x: hp_heg2hp_slc_b_vt) return hp_heg2hp_slc_b_rt is
    variable y : hp_heg2hp_slc_b_rt;
  begin
    y.z_0                      := structify(x(37 downto 19));
    y.y_0                      := structify(x(18 downto 0));
    return y;
  end function structify;
  function nullify (x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_rt is
    variable y : hp_heg2hp_slc_b_rt;
  begin
    y.z_0                      := nullify(x.z_0);
    y.y_0                      := nullify(x.y_0);
    return y;
  end function nullify;

  --------------------------------------------------------------------------------
  -- MDT hits functions
  --------------------------------------------------------------------------------
  
  function vectorify(x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_vt is
    variable y : hp_heg2hp_slc_vt;
  begin
    y(50 downto 39)            := vectorify(x.bcid);
    y(38 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_heg2hp_slc_vt) return hp_heg2hp_slc_rt is
    variable y : hp_heg2hp_slc_rt;
  begin
    y.bcid                     := structify(x(50 downto 39));
    y.specific                 := x(38 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_rt is
    variable y : hp_heg2hp_slc_rt;
  begin
    y.bcid                     := nullify(x.bcid);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_vt is
    variable y : hp_hpsPc2hp_vt;
  begin
    y(70 downto 62)            := vectorify(x.tube);
    y(61 downto 57)            := vectorify(x.layer);
    y(56 downto 39)            := vectorify(x.time_t0);
    y(38 downto 20)            := vectorify(x.global_z);
    y(19 downto 1)             := vectorify(x.global_y);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hpsPc2hp_vt) return hp_hpsPc2hp_rt is
    variable y : hp_hpsPc2hp_rt;
  begin
    y.tube                     := structify(x(70 downto 62));
    y.layer                    := structify(x(61 downto 57));
    y.time_t0                  := structify(x(56 downto 39));
    y.global_z                 := structify(x(38 downto 20));
    y.global_y                 := structify(x(19 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_rt is
    variable y : hp_hpsPc2hp_rt;
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
  -- MDT output functions
  --------------------------------------------------------------------------------
  function vectorify(x: hp_hp2sf_data_rt) return hp_hp2sf_data_vt is
    variable y : hp_hp2sf_data_vt;
  begin
    y(43 downto 29)            := vectorify(x.local_z);
    y(28 downto 14)            := vectorify(x.local_y);
    y(13 downto 5)             := vectorify(x.radius);
    y(4 downto 0)              := vectorify(x.layer);
    return y;
  end function vectorify;
  function structify(x: hp_hp2sf_data_vt) return hp_hp2sf_data_rt is
    variable y : hp_hp2sf_data_rt;
  begin
    y.local_z                  := structify(x(43 downto 29));
    y.local_y                  := structify(x(28 downto 14));
    y.radius                   := structify(x(13 downto 5));
    y.layer                    := structify(x(4 downto 0));
    return y;
  end function structify;
  function nullify (x: hp_hp2sf_data_rt) return hp_hp2sf_data_rt is
    variable y : hp_hp2sf_data_rt;
  begin
    y.local_z                  := nullify(x.local_z);
    y.local_y                  := nullify(x.local_y);
    y.radius                   := nullify(x.radius);
    y.layer                    := nullify(x.layer);
    return y;
  end function nullify;

  function vectorify(x: hp_hp2bm_rt) return hp_hp2bm_vt is
    variable y : hp_hp2bm_vt;
  begin
    y(45 downto 2)             := vectorify(x.data);
    y(1)                       := x.mdt_valid;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hp2bm_vt) return hp_hp2bm_rt is
    variable y : hp_hp2bm_rt;
  begin
    y.data                     := structify(x(45 downto 2));
    y.mdt_valid                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hp_hp2bm_rt) return hp_hp2bm_rt is
    variable y : hp_hp2bm_rt;
  begin
    y.data                     := nullify(x.data);
    y.mdt_valid                := nullify(x.mdt_valid);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;


  
end package body hp_pkg;
