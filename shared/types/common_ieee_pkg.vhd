library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package common_ieee_pkg is

  function structify(x: std_logic_vector) return signed;
  function structify(x: std_logic_vector) return unsigned;
  function structify(x: std_logic_vector) return std_logic_vector;
  function structify(x: std_logic_vector) return integer;
  function structify(x: std_logic_vector) return std_logic;

  function vectorify(x: signed) return std_logic_vector;
  function vectorify(x: unsigned) return std_logic_vector;
  function vectorify(x: std_logic_vector) return std_logic_vector;
  function vectorify(x: integer) return std_logic_vector;
  function vectorify(x: std_logic) return std_logic_vector;

  function nullify(x: std_logic) return std_logic;
  function nullify(x: std_logic_vector) return std_logic_vector;
  function nullify(x: unsigned) return unsigned;
  function nullify(x: signed) return signed;
  function nullify(x: integer) return integer;

end package common_ieee_pkg;

------------------------------------------------------------

package body common_ieee_pkg is

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
  function structify(x: std_logic_vector) return integer is
  begin
    return to_integer(unsigned(x));
  end function structify;
  function structify(x: std_logic_vector) return std_logic is
  begin
    return x(x'left);
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
  function vectorify(x: integer) return std_logic_vector is
  begin
    return std_logic_vector(to_unsigned(x, 32));
  end function vectorify;
  function vectorify(x: std_logic) return std_logic_vector is
    variable y: std_logic_vector(0 downto 0);
  begin
    y(0) := x;
    return y;
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
  function nullify(x: integer) return integer is
  begin
    return 0;
  end function nullify;

end package body common_ieee_pkg;
