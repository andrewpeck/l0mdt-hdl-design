library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

package custom_types_csf_pkg is

  type csf_hit_rt is record
     valid                :  std_logic;
     x                    :  unsigned(MDT_LOCAL_X_LEN-1 downto 0);
     y                    :  unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
  end record csf_hit_rt;
  constant CSF_HIT_LEN : integer := 28;
  subtype csf_hit_rvt is std_logic_vector(CSF_HIT_LEN-1 downto 0);
  function vectorify(x: csf_hit_rt) return csf_hit_rvt;
  function structify(x: csf_hit_rvt) return csf_hit_rt;
  function nullify (x: csf_hit_rt) return csf_hit_rt;

  type csf_hit_a_at is array(integer range <>) of csf_hit_rt;
  type csf_hit_a_avt is array(integer range <>) of csf_hit_rvt;
  function vectorify(x: csf_hit_a_at) return csf_hit_a_avt;
  function vectorify(x: csf_hit_a_at) return std_logic_vector;
  function structify(x: csf_hit_a_avt) return csf_hit_a_at;
  function structify(x: std_logic_vector) return csf_hit_a_at;
  function nullify(x: csf_hit_a_at) return csf_hit_a_at;
  function nullify(x: csf_hit_a_avt) return csf_hit_a_avt;

  constant   CSF_SEG_M_LEN        :  integer := 15;

  constant   CSF_SEG_M_MULT       :  real := 4096.0;

  constant   CSF_SEG_B_LEN        :  integer := 13;

  constant   CSF_SEG_B_MULT       :  real := 16.0;

  constant   CSF_SEG_CHI2_LEN     :  integer := 15;

  constant   CSF_SEG_CHI2_MULT    :  real := 4.0;

  constant   CSF_MAXHITS_SEG      :  integer := 16;

  constant   CSF_MAXHITS_SEG_LEN  :  integer := 4;

  constant   CSF_MAXHITS_ML_LEN   :  integer := 3;

  type csf_locseg_rt is record
     valid                :  std_logic;
     b                    :  signed(CSF_SEG_B_LEN-1 downto 0);
     m                    :  signed(CSF_SEG_M_LEN-1 downto 0);
     chi2                 :  unsigned(CSF_SEG_CHI2_LEN-1 downto 0);
     ndof                 :  unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0);
  end record csf_locseg_rt;
  constant CSF_LOCSEG_LEN : integer := 48;
  subtype csf_locseg_rvt is std_logic_vector(CSF_LOCSEG_LEN-1 downto 0);
  function vectorify(x: csf_locseg_rt) return csf_locseg_rvt;
  function structify(x: csf_locseg_rvt) return csf_locseg_rt;
  function nullify (x: csf_locseg_rt) return csf_locseg_rt;

  type csf_locseg_a_at is array(integer range <>) of csf_locseg_rt;
  type csf_locseg_a_avt is array(integer range <>) of csf_locseg_rvt;
  function vectorify(x: csf_locseg_a_at) return csf_locseg_a_avt;
  function vectorify(x: csf_locseg_a_at) return std_logic_vector;
  function structify(x: csf_locseg_a_avt) return csf_locseg_a_at;
  function structify(x: std_logic_vector) return csf_locseg_a_at;
  function nullify(x: csf_locseg_a_at) return csf_locseg_a_at;
  function nullify(x: csf_locseg_a_avt) return csf_locseg_a_avt;

end package custom_types_csf_pkg;

------------------------------------------------------------

package body custom_types_csf_pkg is

  function vectorify(x: csf_hit_rt) return csf_hit_rvt is
    variable y : csf_hit_rvt;
  begin
    y(27)                      := x.valid;
    y(26 downto 14)            := vectorify(x.x);
    y(13 downto 0)             := vectorify(x.y);
    return y;
  end function vectorify;
  function structify(x: csf_hit_rvt) return csf_hit_rt is
    variable y : csf_hit_rt;
  begin
    y.valid                    := x(27);
    y.x                        := structify(x(26 downto 14));
    y.y                        := structify(x(13 downto 0));
    return y;
  end function structify;
  function nullify (x: csf_hit_rt) return csf_hit_rt is
    variable y : csf_hit_rt;
  begin
    y.valid                    := nullify(x.valid);
    y.x                        := nullify(x.x);
    y.y                        := nullify(x.y);
    return y;
  end function nullify;

  function vectorify(x: csf_hit_a_at) return csf_hit_a_avt is
    variable y :  csf_hit_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: csf_hit_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*28-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-28) := vectorify(x(i));
      msb := msb - 28 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: csf_hit_a_avt) return csf_hit_a_at is
    variable y :  csf_hit_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return csf_hit_a_at is
    variable y :  csf_hit_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-28));
      msb := msb - 28 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: csf_hit_a_at) return csf_hit_a_at is
    variable y :  csf_hit_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: csf_hit_a_avt) return csf_hit_a_avt is
    variable y :  csf_hit_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: csf_locseg_rt) return csf_locseg_rvt is
    variable y : csf_locseg_rvt;
  begin
    y(47)                      := x.valid;
    y(46 downto 34)            := vectorify(x.b);
    y(33 downto 19)            := vectorify(x.m);
    y(18 downto 4)             := vectorify(x.chi2);
    y(3 downto 0)              := vectorify(x.ndof);
    return y;
  end function vectorify;
  function structify(x: csf_locseg_rvt) return csf_locseg_rt is
    variable y : csf_locseg_rt;
  begin
    y.valid                    := x(47);
    y.b                        := structify(x(46 downto 34));
    y.m                        := structify(x(33 downto 19));
    y.chi2                     := structify(x(18 downto 4));
    y.ndof                     := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify (x: csf_locseg_rt) return csf_locseg_rt is
    variable y : csf_locseg_rt;
  begin
    y.valid                    := nullify(x.valid);
    y.b                        := nullify(x.b);
    y.m                        := nullify(x.m);
    y.chi2                     := nullify(x.chi2);
    y.ndof                     := nullify(x.ndof);
    return y;
  end function nullify;

  function vectorify(x: csf_locseg_a_at) return csf_locseg_a_avt is
    variable y :  csf_locseg_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: csf_locseg_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*48-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-48) := vectorify(x(i));
      msb := msb - 48 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: csf_locseg_a_avt) return csf_locseg_a_at is
    variable y :  csf_locseg_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return csf_locseg_a_at is
    variable y :  csf_locseg_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-48));
      msb := msb - 48 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: csf_locseg_a_at) return csf_locseg_a_at is
    variable y :  csf_locseg_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: csf_locseg_a_avt) return csf_locseg_a_avt is
    variable y :  csf_locseg_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body custom_types_csf_pkg;
