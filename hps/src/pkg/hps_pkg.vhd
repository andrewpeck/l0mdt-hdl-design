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
library heg_lib;
use heg_lib.heg_pkg.all;

package hps_pkg is

  type hps_pc2heg_rt is record
    tube                       : std_logic_vector(MDT_TUBE_LEN-1 downto 0);
    layer                      : std_logic_vector(MDT_LAYER_LEN-1 downto 0);
    time_t0                    : unsigned(MDT_TIME_LEN-1 downto 0);
    global_z                   : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    global_y                   : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record hps_pc2heg_rt;
  constant HPS_PC2HEG_LEN : integer := 63;
  subtype hps_pc2heg_vt is std_logic_vector(HPS_PC2HEG_LEN-1 downto 0);
  function vectorify(x: hps_pc2heg_rt) return hps_pc2heg_vt;
  function structify(x: hps_pc2heg_vt) return hps_pc2heg_rt;
  function nullify (x: hps_pc2heg_rt) return hps_pc2heg_rt;

  type hps_pc2heg_avt is array ( integer range <>) of hps_pc2heg_vt;

  type hps_hp2sf_data_rt is record
    local_z                    : signed(MDT_LOCAL_AXI_LEN-1 downto 0);
    local_y                    : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    radius                     : unsigned(MDT_RADIUS_LEN-1 downto 0);
    layer                      : std_logic_vector(MDT_LAYER_LEN-1 downto 0);
  end record hps_hp2sf_data_rt;
  constant HPS_HP2SF_DATA_LEN : integer := 48;
  subtype hps_hp2sf_data_vt is std_logic_vector(HPS_HP2SF_DATA_LEN-1 downto 0);
  function vectorify(x: hps_hp2sf_data_rt) return hps_hp2sf_data_vt;
  function structify(x: hps_hp2sf_data_vt) return hps_hp2sf_data_rt;
  function nullify (x: hps_hp2sf_data_rt) return hps_hp2sf_data_rt;

  type hps_bm2sf_rt is record
    data                       : hps_hp2sf_data_rt;
    mdt_valid                  : std_logic;
    data_valid                 : std_logic;
  end record hps_bm2sf_rt;
  constant HPS_BM2SF_LEN : integer := 50;
  subtype hps_bm2sf_vt is std_logic_vector(HPS_BM2SF_LEN-1 downto 0);
  function vectorify(x: hps_bm2sf_rt) return hps_bm2sf_vt;
  function structify(x: hps_bm2sf_vt) return hps_bm2sf_rt;
  function nullify (x: hps_bm2sf_rt) return hps_bm2sf_rt;


end package hps_pkg;

package body hps_pkg is

  function vectorify(x: hps_pc2heg_rt) return hps_pc2heg_vt is
    variable y : hps_pc2heg_vt;
  begin
    y(62 downto 58)            := x.tube;
    y(57 downto 49)            := x.layer;
    y(48 downto 31)            := vectorify(x.time_t0);
    y(30 downto 16)            := vectorify(x.global_z);
    y(15 downto 1)             := vectorify(x.global_y);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hps_pc2heg_vt) return hps_pc2heg_rt is
    variable y : hps_pc2heg_rt;
  begin
    y.tube                     := x(62 downto 58);
    y.layer                    := x(57 downto 49);
    y.time_t0                  := structify(x(48 downto 31));
    y.global_z                 := structify(x(30 downto 16));
    y.global_y                 := structify(x(15 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hps_pc2heg_rt) return hps_pc2heg_rt is
    variable y : hps_pc2heg_rt;
  begin
    y.tube                     := nullify(x.tube);
    y.layer                    := nullify(x.layer);
    y.time_t0                  := nullify(x.time_t0);
    y.global_z                 := nullify(x.global_z);
    y.global_y                 := nullify(x.global_y);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;


  function vectorify(x: hps_hp2sf_data_rt) return hps_hp2sf_data_vt is
    variable y : hps_hp2sf_data_vt;
  begin
    y(47 downto 33)            := vectorify(x.local_z);
    y(32 downto 18)            := vectorify(x.local_y);
    y(17 downto 9)             := vectorify(x.radius);
    y(8 downto 0)              := x.layer;
    return y;
  end function vectorify;
  function structify(x: hps_hp2sf_data_vt) return hps_hp2sf_data_rt is
    variable y : hps_hp2sf_data_rt;
  begin
    y.local_z                  := structify(x(47 downto 33));
    y.local_y                  := structify(x(32 downto 18));
    y.radius                   := structify(x(17 downto 9));
    y.layer                    := x(8 downto 0);
    return y;
  end function structify;
  function nullify (x: hps_hp2sf_data_rt) return hps_hp2sf_data_rt is
    variable y : hps_hp2sf_data_rt;
  begin
    y.local_z                  := nullify(x.local_z);
    y.local_y                  := nullify(x.local_y);
    y.radius                   := nullify(x.radius);
    y.layer                    := nullify(x.layer);
    return y;
  end function nullify;

  function vectorify(x: hps_bm2sf_rt) return hps_bm2sf_vt is
    variable y : hps_bm2sf_vt;
  begin
    y(49 downto 2)             := vectorify(x.data);
    y(1)                       := x.mdt_valid;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hps_bm2sf_vt) return hps_bm2sf_rt is
    variable y : hps_bm2sf_rt;
  begin
    y.data                     := structify(x(49 downto 2));
    y.mdt_valid                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hps_bm2sf_rt) return hps_bm2sf_rt is
    variable y : hps_bm2sf_rt;
  begin
    y.data                     := nullify(x.data);
    y.mdt_valid                := nullify(x.mdt_valid);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;
 
end package body hps_pkg;