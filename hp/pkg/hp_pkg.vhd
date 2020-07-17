library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

package hp_pkg is

  type hp_win_tubes_rt is record
     hi                   :  unsigned(MDT_TUBE_LEN-1 downto 0);                           -- 
     lo                   :  unsigned(MDT_TUBE_LEN-1 downto 0);                           -- 
  end record hp_win_tubes_rt;
  constant HP_WIN_TUBES_LEN : integer := 18;
  subtype hp_win_tubes_rvt is std_logic_vector(HP_WIN_TUBES_LEN-1 downto 0);
  function vectorify(x: hp_win_tubes_rt) return hp_win_tubes_rvt;
  function structify(x: hp_win_tubes_rvt) return hp_win_tubes_rt;
  function nullify (x: hp_win_tubes_rt) return hp_win_tubes_rt;

  type hp_heg2hp_window_at is array(8-1 downto 0) of hp_win_tubes_rt;
  type hp_heg2hp_window_avt is array(8-1 downto 0) of hp_win_tubes_rvt;
  function vectorify(x: hp_heg2hp_window_at) return hp_heg2hp_window_avt;
  function vectorify(x: hp_heg2hp_window_at) return std_logic_vector;
  function structify(x: hp_heg2hp_window_avt) return hp_heg2hp_window_at;
  function structify(x: std_logic_vector) return hp_heg2hp_window_at;
  function nullify(x: hp_heg2hp_window_at) return hp_heg2hp_window_at;
  function nullify(x: hp_heg2hp_window_avt) return hp_heg2hp_window_avt;

  type hp_heg2hp_slc_b_rt is record
     z_0                  :  unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);                     -- 
     y_0                  :  unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);                     -- 
  end record hp_heg2hp_slc_b_rt;
  constant HP_HEG2HP_SLC_B_LEN : integer := 38;
  subtype hp_heg2hp_slc_b_rvt is std_logic_vector(HP_HEG2HP_SLC_B_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_rvt;
  function structify(x: hp_heg2hp_slc_b_rvt) return hp_heg2hp_slc_b_rt;
  function nullify (x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_rt;

  constant   HP_HEG2HP_SPECIFIC_LEN :  integer := 38;                                     -- 

  type hp_heg2hp_slc_rt is record
     bcid                 :  unsigned(BCID_LEN-1 downto 0);                               -- 
     specific             :  std_logic_vector(HP_HEG2HP_SPECIFIC_LEN-1 downto 0);         -- 
     data_valid           :  std_logic;                                                   -- 
  end record hp_heg2hp_slc_rt;
  constant HP_HEG2HP_SLC_LEN : integer := 51;
  subtype hp_heg2hp_slc_rvt is std_logic_vector(HP_HEG2HP_SLC_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_rvt;
  function structify(x: hp_heg2hp_slc_rvt) return hp_heg2hp_slc_rt;
  function nullify (x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_rt;

  type hp_hpsPc2hp_rt is record
     tube                 :  unsigned(MDT_TUBE_LEN-1 downto 0);                           -- 
     layer                :  unsigned(MDT_LAYER_LEN-1 downto 0);                          -- 
     time_t0              :  unsigned(MDT_TIME_LEN-1 downto 0);                           -- 
     global_z             :  unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);                     -- 
     global_x             :  unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);                     -- 
     data_valid           :  std_logic;                                                   -- 
  end record hp_hpsPc2hp_rt;
  constant HP_HPSPC2HP_LEN : integer := 71;
  subtype hp_hpsPc2hp_rvt is std_logic_vector(HP_HPSPC2HP_LEN-1 downto 0);
  function vectorify(x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_rvt;
  function structify(x: hp_hpsPc2hp_rvt) return hp_hpsPc2hp_rt;
  function nullify (x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_rt;

  type hp_hp2sf_data_rt is record
     local_y              :  unsigned(MDT_LOCAL_Y_LEN-1 downto 0);                        -- 
     local_x              :  unsigned(MDT_LOCAL_X_LEN-1 downto 0);                        -- 
     radius               :  unsigned(MDT_RADIUS_LEN-1 downto 0);                         -- 
     layer                :  unsigned(MDT_LAYER_LEN-1 downto 0);                          -- 
  end record hp_hp2sf_data_rt;
  constant HP_HP2SF_DATA_LEN : integer := 41;
  subtype hp_hp2sf_data_rvt is std_logic_vector(HP_HP2SF_DATA_LEN-1 downto 0);
  function vectorify(x: hp_hp2sf_data_rt) return hp_hp2sf_data_rvt;
  function structify(x: hp_hp2sf_data_rvt) return hp_hp2sf_data_rt;
  function nullify (x: hp_hp2sf_data_rt) return hp_hp2sf_data_rt;

  type hp_hp2bm_rt is record
     data                 :  hp_hp2sf_data_rt;                                            -- 
     mdt_valid            :  std_logic;                                                   -- 
     data_valid           :  std_logic;                                                   -- 
  end record hp_hp2bm_rt;
  constant HP_HP2BM_LEN : integer := 43;
  subtype hp_hp2bm_rvt is std_logic_vector(HP_HP2BM_LEN-1 downto 0);
  function vectorify(x: hp_hp2bm_rt) return hp_hp2bm_rvt;
  function structify(x: hp_hp2bm_rvt) return hp_hp2bm_rt;
  function nullify (x: hp_hp2bm_rt) return hp_hp2bm_rt;

end package hp_pkg;

------------------------------------------------------------

package body hp_pkg is

  function vectorify(x: hp_win_tubes_rt) return hp_win_tubes_rvt is
    variable y : hp_win_tubes_rvt;
  begin
    y(17 downto 9)             := vectorify(x.hi);
    y(8 downto 0)              := vectorify(x.lo);
    return y;
  end function vectorify;
  function structify(x: hp_win_tubes_rvt) return hp_win_tubes_rt is
    variable y : hp_win_tubes_rt;
  begin
    y.hi                       := structify(x(17 downto 9));
    y.lo                       := structify(x(8 downto 0));
    return y;
  end function structify;
  function nullify (x: hp_win_tubes_rt) return hp_win_tubes_rt is
    variable y : hp_win_tubes_rt;
  begin
    y.hi                       := nullify(x.hi);
    y.lo                       := nullify(x.lo);
    return y;
  end function nullify;

  function vectorify(x: hp_heg2hp_window_at) return hp_heg2hp_window_avt is
    variable y :  hp_heg2hp_window_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: hp_heg2hp_window_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*18-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-18) := vectorify(x(i));
      msb := msb - 18 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: hp_heg2hp_window_avt) return hp_heg2hp_window_at is
    variable y :  hp_heg2hp_window_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return hp_heg2hp_window_at is
    variable y :  hp_heg2hp_window_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-18));
      msb := msb - 18 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: hp_heg2hp_window_at) return hp_heg2hp_window_at is
    variable y :  hp_heg2hp_window_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: hp_heg2hp_window_avt) return hp_heg2hp_window_avt is
    variable y :  hp_heg2hp_window_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_rvt is
    variable y : hp_heg2hp_slc_b_rvt;
  begin
    y(37 downto 19)            := vectorify(x.z_0);
    y(18 downto 0)             := vectorify(x.y_0);
    return y;
  end function vectorify;
  function structify(x: hp_heg2hp_slc_b_rvt) return hp_heg2hp_slc_b_rt is
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

  function vectorify(x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_rvt is
    variable y : hp_heg2hp_slc_rvt;
  begin
    y(50 downto 39)            := vectorify(x.bcid);
    y(38 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_heg2hp_slc_rvt) return hp_heg2hp_slc_rt is
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

  function vectorify(x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_rvt is
    variable y : hp_hpsPc2hp_rvt;
  begin
    y(70 downto 62)            := vectorify(x.tube);
    y(61 downto 57)            := vectorify(x.layer);
    y(56 downto 39)            := vectorify(x.time_t0);
    y(38 downto 20)            := vectorify(x.global_z);
    y(19 downto 1)             := vectorify(x.global_x);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hpsPc2hp_rvt) return hp_hpsPc2hp_rt is
    variable y : hp_hpsPc2hp_rt;
  begin
    y.tube                     := structify(x(70 downto 62));
    y.layer                    := structify(x(61 downto 57));
    y.time_t0                  := structify(x(56 downto 39));
    y.global_z                 := structify(x(38 downto 20));
    y.global_x                 := structify(x(19 downto 1));
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
    y.global_x                 := nullify(x.global_x);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: hp_hp2sf_data_rt) return hp_hp2sf_data_rvt is
    variable y : hp_hp2sf_data_rvt;
  begin
    y(40 downto 27)            := vectorify(x.local_y);
    y(26 downto 14)            := vectorify(x.local_x);
    y(13 downto 5)             := vectorify(x.radius);
    y(4 downto 0)              := vectorify(x.layer);
    return y;
  end function vectorify;
  function structify(x: hp_hp2sf_data_rvt) return hp_hp2sf_data_rt is
    variable y : hp_hp2sf_data_rt;
  begin
    y.local_y                  := structify(x(40 downto 27));
    y.local_x                  := structify(x(26 downto 14));
    y.radius                   := structify(x(13 downto 5));
    y.layer                    := structify(x(4 downto 0));
    return y;
  end function structify;
  function nullify (x: hp_hp2sf_data_rt) return hp_hp2sf_data_rt is
    variable y : hp_hp2sf_data_rt;
  begin
    y.local_y                  := nullify(x.local_y);
    y.local_x                  := nullify(x.local_x);
    y.radius                   := nullify(x.radius);
    y.layer                    := nullify(x.layer);
    return y;
  end function nullify;

  function vectorify(x: hp_hp2bm_rt) return hp_hp2bm_rvt is
    variable y : hp_hp2bm_rvt;
  begin
    y(42 downto 2)             := vectorify(x.data);
    y(1)                       := x.mdt_valid;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hp2bm_rvt) return hp_hp2bm_rt is
    variable y : hp_hp2bm_rt;
  begin
    y.data                     := structify(x(42 downto 2));
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
