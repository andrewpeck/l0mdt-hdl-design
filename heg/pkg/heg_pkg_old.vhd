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
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

package heg_pkg is

  constant HEG_BUSY_CLOCKS : integer := 10;
  --------------------------------------------------------------------------------
  --  slc port
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  --  mdt port
  --------------------------------------------------------------------------------

  type heg_pc2heg_avt is array ( integer range <>) of hp_hpsPc2hp_rvt;

  --------------------------------------------------------------------------------
  -- HEG control to hp
  --------------------------------------------------------------------------------
  type heg_ctrl2hp_rt is record
    reset_b                    : std_logic_vector(MAX_NUM_HP-1 downto 0);
    enable                     : std_logic_vector(MAX_NUM_HP-1 downto 0);
  end record heg_ctrl2hp_rt;
  constant HEG_CTRL2HP_LEN : integer := 12;
  subtype heg_ctrl2hp_vt is std_logic_vector(HEG_CTRL2HP_LEN-1 downto 0);
  function vectorify(x: heg_ctrl2hp_rt) return heg_ctrl2hp_vt;
  function structify(x: heg_ctrl2hp_vt) return heg_ctrl2hp_rt;
  function nullify (x: heg_ctrl2hp_rt) return heg_ctrl2hp_rt;
  --------------------------------------------------------------------------------
  -- HEG window to hp
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- HEG slc to hp
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- heg to sf hit data
  --------------------------------------------------------------------------------

  type heg_hp2bm_avt is array(integer range <>) of hp_hp2bm_rvt;

  type heg_bm2sf_rt is record
    data                       : hp_hp2sf_data_rt;
    data_valid                 : std_logic;
  end record heg_bm2sf_rt;
  constant HEG_BM2SF_LEN : integer := 49;
  subtype heg_bm2sf_vt is std_logic_vector(HEG_BM2SF_LEN-1 downto 0);
  function vectorify(x: heg_bm2sf_rt) return heg_bm2sf_vt;
  function structify(x: heg_bm2sf_vt) return heg_bm2sf_rt;
  function nullify (x: heg_bm2sf_rt) return heg_bm2sf_rt;

end package heg_pkg;

package body heg_pkg is
  --------------------------------------------------------------------------------
  --  mdt port
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- HEG control to hp
  --------------------------------------------------------------------------------
  function vectorify(x: heg_ctrl2hp_rt) return heg_ctrl2hp_vt is
    variable y : heg_ctrl2hp_vt;
  begin
    y(MAX_NUM_HP + MAX_NUM_HP -1 downto MAX_NUM_HP)             := x.reset_b;
    y(MAX_NUM_HP -1  downto 0)              := x.enable;
    return y;
  end function vectorify;
  function structify(x: heg_ctrl2hp_vt) return heg_ctrl2hp_rt is
    variable y : heg_ctrl2hp_rt;
  begin
    y.reset_b                  := x(MAX_NUM_HP + MAX_NUM_HP -1 downto MAX_NUM_HP);
    y.enable                   := x(MAX_NUM_HP -1  downto 0);
    return y;
  end function structify;
  function nullify (x: heg_ctrl2hp_rt) return heg_ctrl2hp_rt is
    variable y : heg_ctrl2hp_rt;
  begin
    y.reset_b                  := nullify(x.reset_b);
    y.enable                   := nullify(x.enable);
    return y;
  end function nullify;
  --------------------------------------------------------------------------------
  -- HEG window to hp
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- HEG slc to hp
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- heg to sf hit data
  --------------------------------------------------------------------------------
  function vectorify(x: heg_bm2sf_rt) return heg_bm2sf_vt is
    variable y : heg_bm2sf_vt;
  begin
    y(44 downto 1)             := vectorify(x.data);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: heg_bm2sf_vt) return heg_bm2sf_rt is
    variable y : heg_bm2sf_rt;
  begin
    y.data                     := structify(x(44 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: heg_bm2sf_rt) return heg_bm2sf_rt is
    variable y : heg_bm2sf_rt;
  begin
    y.data                     := nullify(x.data);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

end package body heg_pkg;