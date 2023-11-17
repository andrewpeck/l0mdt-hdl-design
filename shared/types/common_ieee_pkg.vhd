-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package common_ieee_pkg is

   -- yml2hdl types --

   type std_logic_vector_array is array(integer range <>) of std_logic_vector;

   -- yml2hdl attributes --

   attribute w : natural;

   -- Basic converting functions --

   procedure assign(
      variable y : out std_logic_vector;
      constant x : in std_logic_vector);

   function convert(x: std_logic_vector; t: std_logic_vector) return std_logic_vector;

   function convert(x: std_logic_vector_array; t: std_logic_vector_array) return std_logic_vector_array;

   function convert(x: std_logic_vector_array; t: std_logic_vector) return std_logic_vector;

   function convert(x: std_logic_vector; t: std_logic_vector_array) return std_logic_vector_array;

   function width(x: std_logic_vector_array) return natural;

   function width(x: std_logic) return natural;
   function width(x: std_logic_vector) return natural;
   function width(x: unsigned) return natural;
   function width(x: signed) return natural;
   function width(x: integer) return natural;

   function convert(x: std_logic_vector; t: signed) return signed;
   function convert(x: std_logic_vector; t: unsigned) return unsigned;
   function convert(x: std_logic_vector; t: integer) return integer;
   function convert(x: std_logic_vector; t: std_logic) return std_logic;

   function convert(x: signed; t: std_logic_vector) return std_logic_vector;
   function convert(x: unsigned; t: std_logic_vector) return std_logic_vector;
   function convert(x: integer; t: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic; t: std_logic_vector) return std_logic_vector;

   function zero(y: std_logic) return std_logic;
   function zero(y: std_logic_vector) return std_logic_vector;
   function zero(y: unsigned) return unsigned;
   function zero(y: signed) return signed;
   function zero(y: integer) return integer;

end package common_ieee_pkg;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package body common_ieee_pkg is

   -- Basic converting functions --

   procedure assign(
      variable y : out std_logic_vector;
      constant x : in std_logic_vector) is
      variable tmp : std_logic_vector(y'range);
   begin
      for j in 0 to y'length-1 loop
         y(y'low + j) := x(x'low + j);
      end loop;
   end procedure assign;

   function convert(x: std_logic_vector; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
   begin
      assign(y, x);
      return y;
   end function convert;

   function convert(x: std_logic_vector_array; t: std_logic_vector_array) return std_logic_vector_array is
   begin
      return x;
   end function convert;

   function convert(x: std_logic_vector_array; t: std_logic_vector) return std_logic_vector is
      variable y  : std_logic_vector(t'range);
      constant ll : natural := x(x'low)'length;
   begin
      for ii in x'range loop
         if y'ascending = true then
            assign(y(ii*ll to ll*(ii+1)-1), x(ii));
         else
            assign(y(ll*(ii+1)-1 downto ii*ll), x(ii));
         end if;
      end loop;
      return y;
   end function convert;


   function convert(x: std_logic_vector; t: std_logic_vector_array) return std_logic_vector_array is
      variable y  : std_logic_vector_array(t'range)(t(t'low)'range);
      constant ll : natural := t(t'low)'length;
   begin
      for ii in t'range loop
         if x'ascending then
            assign(y(ii), x(ii*ll to ll*(ii+1)-1));
         else
            assign(y(ii), x(ll*(ii+1)-1 downto ll*ii));
         end if;
      end loop;
      return y;
   end function convert;


   function width(x: std_logic_vector_array) return natural is
   begin
      if x'low > x'high then
         return 0;
      else
         return x(x'low)'length*x'length;
      end if;
   end function width;
   function width(x: std_logic) return natural is
   begin
      return 1;
   end function width;
   function width(x: std_logic_vector) return natural is
   begin
      return x'length;
   end function width;
   function width(x: unsigned) return natural is
   begin
      return x'length;
   end function width;
   function width(x: signed) return natural is
   begin
      return x'length;
   end function width;
   function width(x: integer) return natural is
   begin
      return 32;
   end function width;

   function convert(x: std_logic_vector; t: signed) return signed is
      variable y: signed(t'range);
   begin
      y := signed(x);
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: unsigned) return unsigned is
      variable y: unsigned(t'range);
   begin
      y := unsigned(x);
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: integer) return integer is
      variable y: integer;
   begin
      y := to_integer(signed(x));
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: std_logic) return std_logic is
      variable y: std_logic;
   begin
      y := x(x'low);
      return y;
   end function convert;

   function convert(x: signed; t: std_logic_vector) return std_logic_vector is
   begin
      return std_logic_vector(x);
   end function convert;
   function convert(x: unsigned; t: std_logic_vector) return std_logic_vector is
   begin
      return std_logic_vector(x);
   end function convert;
   function convert(x: integer; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
   begin
      assign(y, std_logic_vector(to_signed(x, 32)));
      return y;
   end function convert;
   function convert(x: std_logic; t: std_logic_vector) return std_logic_vector is
      variable y: std_logic_vector(t'range);
   begin
      y(y'low) := x;
      return y;
   end function convert;

   function zero(y: std_logic) return std_logic is
   begin
      return '0';
   end function zero;
   function zero(y: std_logic_vector) return std_logic_vector is
   begin
      return (y'range => '0');
   end function zero;
   function zero(y: unsigned) return unsigned is
   begin
      return to_unsigned(0, y'length);
   end function zero;
   function zero(y: signed) return signed is
   begin
      return to_signed(0, y'length);
   end function zero;
   function zero(y: integer) return integer is
   begin
      return 0;
   end function zero;

end package body common_ieee_pkg;
