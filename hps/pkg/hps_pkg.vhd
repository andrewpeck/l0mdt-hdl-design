library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

package hps_pkg is

  type hps_ctrl2sf_at is array(integer range <>) of heg_ctrl2hp_rt;
  type hps_ctrl2sf_avt is array(integer range <>) of heg_ctrl2hp_rvt;
  function vectorify(x: hps_ctrl2sf_at) return hps_ctrl2sf_avt;
  function vectorify(x: hps_ctrl2sf_at) return std_logic_vector;
  function structify(x: hps_ctrl2sf_avt) return hps_ctrl2sf_at;
  function structify(x: std_logic_vector) return hps_ctrl2sf_at;
  function nullify(x: hps_ctrl2sf_at) return hps_ctrl2sf_at;
  function nullify(x: hps_ctrl2sf_avt) return hps_ctrl2sf_avt;

  type hps_bm2sf_at is array(integer range <>) of hps2csf_tNone;
  type hps_bm2sf_avt is array(integer range <>) of hps2csf_tNone;
  function vectorify(x: hps_bm2sf_at) return hps_bm2sf_avt;
  function vectorify(x: hps_bm2sf_at) return std_logic_vector;
  function structify(x: hps_bm2sf_avt) return hps_bm2sf_at;
  function structify(x: std_logic_vector) return hps_bm2sf_at;
  function nullify(x: hps_bm2sf_at) return hps_bm2sf_at;
  function nullify(x: hps_bm2sf_avt) return hps_bm2sf_avt;

end package hps_pkg;

------------------------------------------------------------

package body hps_pkg is

  function vectorify(x: hps_ctrl2sf_at) return hps_ctrl2sf_avt is
    variable y :  hps_ctrl2sf_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: hps_ctrl2sf_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*2-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-2) := vectorify(x(i));
      msb := msb - 2 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: hps_ctrl2sf_avt) return hps_ctrl2sf_at is
    variable y :  hps_ctrl2sf_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return hps_ctrl2sf_at is
    variable y :  hps_ctrl2sf_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-2));
      msb := msb - 2 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: hps_ctrl2sf_at) return hps_ctrl2sf_at is
    variable y :  hps_ctrl2sf_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: hps_ctrl2sf_avt) return hps_ctrl2sf_avt is
    variable y :  hps_ctrl2sf_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: hps_bm2sf_at) return hps_bm2sf_avt is
    variable y :  hps_bm2sf_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: hps_bm2sf_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*None-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-None) := vectorify(x(i));
      msb := msb - None -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: hps_bm2sf_avt) return hps_bm2sf_at is
    variable y :  hps_bm2sf_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return hps_bm2sf_at is
    variable y :  hps_bm2sf_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-None));
      msb := msb - None -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: hps_bm2sf_at) return hps_bm2sf_at is
    variable y :  hps_bm2sf_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: hps_bm2sf_avt) return hps_bm2sf_avt is
    variable y :  hps_bm2sf_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body hps_pkg;
