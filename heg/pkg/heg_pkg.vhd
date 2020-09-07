library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
library hp_lib;
use hp_lib.hp_pkg.all;

package heg_pkg is

  constant HEG_BUSY_CLOCKS : integer := 10;

  type heg_pc2heg_at is array(integer range <>) of hp_hpsPc2hp_rt;
  type heg_pc2heg_avt is array(integer range <>) of hp_hpsPc2hp_rvt;
  function vectorify(x: heg_pc2heg_at) return heg_pc2heg_avt;
  function vectorify(x: heg_pc2heg_at) return std_logic_vector;
  function structify(x: heg_pc2heg_avt) return heg_pc2heg_at;
  function structify(x: std_logic_vector) return heg_pc2heg_at;
  function nullify(x: heg_pc2heg_at) return heg_pc2heg_at;
  function nullify(x: heg_pc2heg_avt) return heg_pc2heg_avt;

  type heg_ctrl2hp_rt is record
    rst : std_logic;
    enable : std_logic;
  end record heg_ctrl2hp_rt;
  constant HEG_CTRL2HP_LEN : integer := 2;
  subtype heg_ctrl2hp_rvt is std_logic_vector(HEG_CTRL2HP_LEN-1 downto 0);
  function vectorify(x: heg_ctrl2hp_rt) return heg_ctrl2hp_rvt;
  function structify(x: heg_ctrl2hp_rvt) return heg_ctrl2hp_rt;
  function nullify(x: heg_ctrl2hp_rt) return heg_ctrl2hp_rt;

  type heg_ctrl2hp_bus_at is array(integer range <>) of heg_ctrl2hp_rt;
  type heg_ctrl2hp_bus_avt is array(integer range <>) of heg_ctrl2hp_rvt;
  function vectorify(x: heg_ctrl2hp_bus_at) return heg_ctrl2hp_bus_avt;
  function vectorify(x: heg_ctrl2hp_bus_at) return std_logic_vector;
  function structify(x: heg_ctrl2hp_bus_avt) return heg_ctrl2hp_bus_at;
  function structify(x: std_logic_vector) return heg_ctrl2hp_bus_at;
  function nullify(x: heg_ctrl2hp_bus_at) return heg_ctrl2hp_bus_at;
  function nullify(x: heg_ctrl2hp_bus_avt) return heg_ctrl2hp_bus_avt;

  type heg_hp2bm_at is array(integer range <>) of hp_hp2bm_rt;
  type heg_hp2bm_avt is array(integer range <>) of hp_hp2bm_rvt;
  function vectorify(x: heg_hp2bm_at) return heg_hp2bm_avt;
  function vectorify(x: heg_hp2bm_at) return std_logic_vector;
  function structify(x: heg_hp2bm_avt) return heg_hp2bm_at;
  function structify(x: std_logic_vector) return heg_hp2bm_at;
  function nullify(x: heg_hp2bm_at) return heg_hp2bm_at;
  function nullify(x: heg_hp2bm_avt) return heg_hp2bm_avt;

  type heg_bm2sf_rt is record
    data : hp_hp2sf_data_rt;
    data_valid : std_logic;
  end record heg_bm2sf_rt;
  constant HEG_BM2SF_LEN : integer := 45;
  subtype heg_bm2sf_rvt is std_logic_vector(HEG_BM2SF_LEN-1 downto 0);
  function vectorify(x: heg_bm2sf_rt) return heg_bm2sf_rvt;
  function structify(x: heg_bm2sf_rvt) return heg_bm2sf_rt;
  function nullify(x: heg_bm2sf_rt) return heg_bm2sf_rt;

end package heg_pkg;

------------------------------------------------------------

package body heg_pkg is

  function vectorify(x: heg_pc2heg_at) return heg_pc2heg_avt is
    variable y :  heg_pc2heg_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: heg_pc2heg_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*71-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-71) := vectorify(x(i));
      msb := msb - 71 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: heg_pc2heg_avt) return heg_pc2heg_at is
    variable y :  heg_pc2heg_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return heg_pc2heg_at is
    variable y :  heg_pc2heg_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-71));
      msb := msb - 71 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: heg_pc2heg_at) return heg_pc2heg_at is
    variable y :  heg_pc2heg_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: heg_pc2heg_avt) return heg_pc2heg_avt is
    variable y :  heg_pc2heg_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: heg_ctrl2hp_rt) return heg_ctrl2hp_rvt is
    variable y : heg_ctrl2hp_rvt;
  begin
    y(1 downto 1)              := vectorify(x.rst);
    y(0 downto 0)              := vectorify(x.enable);
    return y;
  end function vectorify;
  function structify(x: heg_ctrl2hp_rvt) return heg_ctrl2hp_rt is
    variable y : heg_ctrl2hp_rt;
  begin
    y.rst                      := structify(x(1 downto 1));
    y.enable                   := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: heg_ctrl2hp_rt) return heg_ctrl2hp_rt is
    variable y : heg_ctrl2hp_rt;
  begin
    y.rst                      := nullify(x.rst);
    y.enable                   := nullify(x.enable);
    return y;
  end function nullify;

  function vectorify(x: heg_ctrl2hp_bus_at) return heg_ctrl2hp_bus_avt is
    variable y :  heg_ctrl2hp_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: heg_ctrl2hp_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*2-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-2) := vectorify(x(i));
      msb := msb - 2 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: heg_ctrl2hp_bus_avt) return heg_ctrl2hp_bus_at is
    variable y :  heg_ctrl2hp_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return heg_ctrl2hp_bus_at is
    variable y :  heg_ctrl2hp_bus_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-2));
      msb := msb - 2 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: heg_ctrl2hp_bus_at) return heg_ctrl2hp_bus_at is
    variable y :  heg_ctrl2hp_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: heg_ctrl2hp_bus_avt) return heg_ctrl2hp_bus_avt is
    variable y :  heg_ctrl2hp_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: heg_hp2bm_at) return heg_hp2bm_avt is
    variable y :  heg_hp2bm_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: heg_hp2bm_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*46-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-46) := vectorify(x(i));
      msb := msb - 46 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: heg_hp2bm_avt) return heg_hp2bm_at is
    variable y :  heg_hp2bm_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return heg_hp2bm_at is
    variable y :  heg_hp2bm_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-46));
      msb := msb - 46 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: heg_hp2bm_at) return heg_hp2bm_at is
    variable y :  heg_hp2bm_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: heg_hp2bm_avt) return heg_hp2bm_avt is
    variable y :  heg_hp2bm_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: heg_bm2sf_rt) return heg_bm2sf_rvt is
    variable y : heg_bm2sf_rvt;
  begin
    y(44 downto 1)             := vectorify(x.data);
    y(0 downto 0)              := vectorify(x.data_valid);
    return y;
  end function vectorify;
  function structify(x: heg_bm2sf_rvt) return heg_bm2sf_rt is
    variable y : heg_bm2sf_rt;
  begin
    y.data                     := structify(x(44 downto 1));
    y.data_valid               := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: heg_bm2sf_rt) return heg_bm2sf_rt is
    variable y : heg_bm2sf_rt;
  begin
    y.data                     := nullify(x.data);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

end package body heg_pkg;
