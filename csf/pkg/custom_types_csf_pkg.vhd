library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.custom_types_pkg.all;

package custom_types_csf_pkg is

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

  constant   CSF_HIT_AXI_LEN      :  integer := 14;

  type csf_hit_rt is record
     valid                :  std_logic;
     x                    :  unsigned(CSF_HIT_AXI_LEN-1 downto 0);
     z                    :  signed(CSF_HIT_AXI_LEN-1 downto 0);
  end record csf_hit_rt;
  constant CSF_HIT_LEN : integer := 29;
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

  function vectorify(x: csf_hit_rt) return csf_hit_rvt is
    variable y : csf_hit_rvt;
  begin
    y(28)                      := x.valid;
    y(27 downto 14)            := vectorify(x.x);
    y(13 downto 0)             := vectorify(x.z);
    return y;
  end function vectorify;
  function structify(x: csf_hit_rvt) return csf_hit_rt is
    variable y : csf_hit_rt;
  begin
    y.valid                    := x(28);
    y.x                        := structify(x(27 downto 14));
    y.z                        := structify(x(13 downto 0));
    return y;
  end function structify;
  function nullify (x: csf_hit_rt) return csf_hit_rt is
    variable y : csf_hit_rt;
  begin
    y.valid                    := nullify(x.valid);
    y.x                        := nullify(x.x);
    y.z                        := nullify(x.z);
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
    variable y : std_logic_vector(x'length*29-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-29) := vectorify(x(i));
      msb := msb - 29 -1;
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
      y(i) := structify(x(msb downto msb-29));
      msb := msb - 29 -1;
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
