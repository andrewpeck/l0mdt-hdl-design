-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

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

library heg_lib;
use heg_lib.heg_pkg.all;

package hps_pkg is

   -- Custom types and functions --

   type hps_ctrl2sf_art is array(integer range <>) of heg_ctrl2sf_rt;
   function width(x: hps_ctrl2sf_art) return integer;
   function convert(x: hps_ctrl2sf_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: hps_ctrl2sf_art) return hps_ctrl2sf_art;
   function zero(tpl: hps_ctrl2sf_art) return hps_ctrl2sf_art;
   function convert(x: hps_ctrl2sf_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: hps_ctrl2sf_art) return hps_ctrl2sf_art;

   type hps_ctrl2sf_avt is array(integer range <>) of heg_ctrl2sf_vt;
   function width(x: hps_ctrl2sf_avt) return integer;
   function convert(x: hps_ctrl2sf_avt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: hps_ctrl2sf_avt) return hps_ctrl2sf_avt;
   function zero(tpl: hps_ctrl2sf_avt) return hps_ctrl2sf_avt;
   function convert(x: hps_ctrl2sf_avt; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: hps_ctrl2sf_avt) return hps_ctrl2sf_avt;

end package hps_pkg;

------------------------------------------------------------

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

library heg_lib;
use heg_lib.heg_pkg.all;

package body hps_pkg is

   -- Custom types and functions --

   function width(x: hps_ctrl2sf_art) return integer is
      variable aux : x'element;
      constant w : integer := width(aux);
   begin
      return x'length * w;
   end function width;
   function convert(x: hps_ctrl2sf_art; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable aux : x'element;
      constant W : natural := width(aux);
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in x'range loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in x'range loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: hps_ctrl2sf_art) return hps_ctrl2sf_art is
      variable y : hps_ctrl2sf_art(tpl'range);
      variable aux : y'element;
      constant W : natural := width(aux);
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in y'range loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in y'range loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: hps_ctrl2sf_art) return hps_ctrl2sf_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: hps_ctrl2sf_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl'element'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: hps_ctrl2sf_art) return hps_ctrl2sf_art is
      variable y : hps_ctrl2sf_art(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: hps_ctrl2sf_avt) return integer is
      variable aux : x'element;
      constant w : integer := width(aux);
   begin
      return x'length * w;
   end function width;
   function convert(x: hps_ctrl2sf_avt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable aux : x'element;
      constant W : natural := width(aux);
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in x'range loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in x'range loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: hps_ctrl2sf_avt) return hps_ctrl2sf_avt is
      variable y : hps_ctrl2sf_avt(tpl'range);
      variable aux : y'element;
      constant W : natural := width(aux);
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in y'range loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in y'range loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: hps_ctrl2sf_avt) return hps_ctrl2sf_avt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: hps_ctrl2sf_avt; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl'element'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: hps_ctrl2sf_avt) return hps_ctrl2sf_avt is
      variable y : hps_ctrl2sf_avt(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

end package body hps_pkg;
