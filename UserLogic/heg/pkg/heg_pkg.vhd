-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl
-- 2022-03-26 03:44:21

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

   -- Custom types and functions --

   subtype heg_pc2heg_vt is std_logic_vector(hp_hpsPc2hp_rt'w-1 downto 0);
   attribute w of heg_pc2heg_vt : subtype is 70;

   type heg_pc2heg_art is array(integer range <>) of hp_hpsPc2hp_rt;
   function width(x: heg_pc2heg_art) return integer;
   function convert(x: heg_pc2heg_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_pc2heg_art) return heg_pc2heg_art;
   function zero(tpl: heg_pc2heg_art) return heg_pc2heg_art;
   function convert(x: heg_pc2heg_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_pc2heg_art) return heg_pc2heg_art;

   type heg_pc2heg_avt is array(integer range <>) of heg_pc2heg_vt;
   function width(x: heg_pc2heg_avt) return integer;
   function convert(x: heg_pc2heg_avt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_pc2heg_avt) return heg_pc2heg_avt;
   function zero(tpl: heg_pc2heg_avt) return heg_pc2heg_avt;
   function convert(x: heg_pc2heg_avt; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_pc2heg_avt) return heg_pc2heg_avt;

   subtype heg_roi_center_ut is unsigned(MDT_TUBE_LEN - 1 downto 0);
   attribute w of heg_roi_center_ut : subtype is 9;

   type heg_roi_center_aut is array(integer range <>) of heg_roi_center_ut;
   function width(x: heg_roi_center_aut) return integer;
   function convert(x: heg_roi_center_aut; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_roi_center_aut) return heg_roi_center_aut;
   function zero(tpl: heg_roi_center_aut) return heg_roi_center_aut;
   function convert(x: heg_roi_center_aut; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_roi_center_aut) return heg_roi_center_aut;

   type heg_ctrl2hp_rt is record
      rst : std_logic;
      enable : std_logic;
   end record heg_ctrl2hp_rt;
   attribute w of heg_ctrl2hp_rt : type is 2;
   function width(x: heg_ctrl2hp_rt) return natural;
   function convert(x: heg_ctrl2hp_rt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_rt) return heg_ctrl2hp_rt;
   function zero(tpl: heg_ctrl2hp_rt) return heg_ctrl2hp_rt;

   subtype heg_ctrl2hp_vt is std_logic_vector(heg_ctrl2hp_rt'w-1 downto 0);
   attribute w of heg_ctrl2hp_vt : subtype is 2;

   type heg_ctrl2hp_art is array(integer range <>) of heg_ctrl2hp_rt;
   function width(x: heg_ctrl2hp_art) return integer;
   function convert(x: heg_ctrl2hp_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_art) return heg_ctrl2hp_art;
   function zero(tpl: heg_ctrl2hp_art) return heg_ctrl2hp_art;
   function convert(x: heg_ctrl2hp_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_ctrl2hp_art) return heg_ctrl2hp_art;

   type heg_ctrl2hp_avt is array(integer range <>) of heg_ctrl2hp_vt;
   function width(x: heg_ctrl2hp_avt) return integer;
   function convert(x: heg_ctrl2hp_avt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_avt) return heg_ctrl2hp_avt;
   function zero(tpl: heg_ctrl2hp_avt) return heg_ctrl2hp_avt;
   function convert(x: heg_ctrl2hp_avt; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_ctrl2hp_avt) return heg_ctrl2hp_avt;

   type heg_ctrl2hp_all is record
      window_valid : std_logic;
   end record heg_ctrl2hp_all;
   attribute w of heg_ctrl2hp_all : type is 1;
   function width(x: heg_ctrl2hp_all) return natural;
   function convert(x: heg_ctrl2hp_all; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_all) return heg_ctrl2hp_all;
   function zero(tpl: heg_ctrl2hp_all) return heg_ctrl2hp_all;

   constant CSF_SLOPE_LEN : integer := 11;
   attribute w of CSF_SLOPE_LEN : constant is 32;

   type heg_ctrl2sf_rt is record
      rst : std_logic;
      eof : std_logic;
      enable : std_logic;
   end record heg_ctrl2sf_rt;
   attribute w of heg_ctrl2sf_rt : type is 3;
   function width(x: heg_ctrl2sf_rt) return natural;
   function convert(x: heg_ctrl2sf_rt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_ctrl2sf_rt) return heg_ctrl2sf_rt;
   function zero(tpl: heg_ctrl2sf_rt) return heg_ctrl2sf_rt;

   subtype heg_ctrl2sf_vt is std_logic_vector(heg_ctrl2sf_rt'w-1 downto 0);
   attribute w of heg_ctrl2sf_vt : subtype is 3;

   subtype heg_hp2bm_vt is std_logic_vector(hp_hp2bm_rt'w-1 downto 0);
   attribute w of heg_hp2bm_vt : subtype is 42;

   type heg_hp2bm_art is array(integer range <>) of hp_hp2bm_rt;
   function width(x: heg_hp2bm_art) return integer;
   function convert(x: heg_hp2bm_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_art) return heg_hp2bm_art;
   function zero(tpl: heg_hp2bm_art) return heg_hp2bm_art;
   function convert(x: heg_hp2bm_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_art) return heg_hp2bm_art;

   type heg_hp2bm_avt is array(integer range <>) of heg_hp2bm_vt;
   function width(x: heg_hp2bm_avt) return integer;
   function convert(x: heg_hp2bm_avt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_avt) return heg_hp2bm_avt;
   function zero(tpl: heg_hp2bm_avt) return heg_hp2bm_avt;
   function convert(x: heg_hp2bm_avt; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_avt) return heg_hp2bm_avt;

   type heg_bm2sf_rt is record
      data : hp_hp2sf_data_rt;
      data_valid : std_logic;
   end record heg_bm2sf_rt;
   attribute w of heg_bm2sf_rt : type is 41;
   function width(x: heg_bm2sf_rt) return natural;
   function convert(x: heg_bm2sf_rt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_bm2sf_rt) return heg_bm2sf_rt;
   function zero(tpl: heg_bm2sf_rt) return heg_bm2sf_rt;

   subtype heg_hp2bm_data_vt is std_logic_vector(hp_hp2sf_data_rt'w-1 downto 0);
   attribute w of heg_hp2bm_data_vt : subtype is 40;

   type heg_hp2bm_data_art is array(integer range <>) of hp_hp2sf_data_rt;
   function width(x: heg_hp2bm_data_art) return integer;
   function convert(x: heg_hp2bm_data_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_data_art) return heg_hp2bm_data_art;
   function zero(tpl: heg_hp2bm_data_art) return heg_hp2bm_data_art;
   function convert(x: heg_hp2bm_data_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_data_art) return heg_hp2bm_data_art;

   type heg_hp2bm_data_avt is array(integer range <>) of heg_hp2bm_data_vt;
   function width(x: heg_hp2bm_data_avt) return integer;
   function convert(x: heg_hp2bm_data_avt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_data_avt) return heg_hp2bm_data_avt;
   function zero(tpl: heg_hp2bm_data_avt) return heg_hp2bm_data_avt;
   function convert(x: heg_hp2bm_data_avt; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_data_avt) return heg_hp2bm_data_avt;

end package heg_pkg;

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

package body heg_pkg is

   -- Custom types and functions --

   function width(x: heg_pc2heg_art) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_pc2heg_art; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_pc2heg_art) return heg_pc2heg_art is
      variable y : heg_pc2heg_art(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_pc2heg_art) return heg_pc2heg_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_pc2heg_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_pc2heg_art) return heg_pc2heg_art is
      variable y : heg_pc2heg_art(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_pc2heg_avt) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_pc2heg_avt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_pc2heg_avt) return heg_pc2heg_avt is
      variable y : heg_pc2heg_avt(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_pc2heg_avt) return heg_pc2heg_avt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_pc2heg_avt; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_pc2heg_avt) return heg_pc2heg_avt is
      variable y : heg_pc2heg_avt(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_roi_center_aut) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_roi_center_aut; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_roi_center_aut) return heg_roi_center_aut is
      variable y : heg_roi_center_aut(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_roi_center_aut) return heg_roi_center_aut is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_roi_center_aut; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_roi_center_aut) return heg_roi_center_aut is
      variable y : heg_roi_center_aut(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_ctrl2hp_rt) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rst);
      w := w + width(x.enable);
      return w;
   end function width;
   function convert(x: heg_ctrl2hp_rt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rst);
         y(u to u+w-1) := convert(x.rst, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
      else
         w := width(x.rst);
         y(u downto u-w+1) := convert(x.rst, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_rt) return heg_ctrl2hp_rt is
      variable y : heg_ctrl2hp_rt;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rst);
         y.rst := convert(x(u to u+w-1), tpl.rst);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
      else
         w := width(tpl.rst);
         y.rst := convert(x(u downto u-w+1), tpl.rst);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_ctrl2hp_rt) return heg_ctrl2hp_rt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: heg_ctrl2hp_art) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_ctrl2hp_art; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_art) return heg_ctrl2hp_art is
      variable y : heg_ctrl2hp_art(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_ctrl2hp_art) return heg_ctrl2hp_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_ctrl2hp_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_ctrl2hp_art) return heg_ctrl2hp_art is
      variable y : heg_ctrl2hp_art(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_ctrl2hp_avt) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_ctrl2hp_avt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_avt) return heg_ctrl2hp_avt is
      variable y : heg_ctrl2hp_avt(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_ctrl2hp_avt) return heg_ctrl2hp_avt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_ctrl2hp_avt; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_ctrl2hp_avt) return heg_ctrl2hp_avt is
      variable y : heg_ctrl2hp_avt(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_ctrl2hp_all) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.window_valid);
      return w;
   end function width;
   function convert(x: heg_ctrl2hp_all; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.window_valid);
         y(u to u+w-1) := convert(x.window_valid, y(u to u+w-1));
      else
         w := width(x.window_valid);
         y(u downto u-w+1) := convert(x.window_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_ctrl2hp_all) return heg_ctrl2hp_all is
      variable y : heg_ctrl2hp_all;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.window_valid);
         y.window_valid := convert(x(u to u+w-1), tpl.window_valid);
      else
         w := width(tpl.window_valid);
         y.window_valid := convert(x(u downto u-w+1), tpl.window_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_ctrl2hp_all) return heg_ctrl2hp_all is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: heg_ctrl2sf_rt) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rst);
      w := w + width(x.eof);
      w := w + width(x.enable);
      return w;
   end function width;
   function convert(x: heg_ctrl2sf_rt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rst);
         y(u to u+w-1) := convert(x.rst, y(u to u+w-1));
         u := u + w;
         w := width(x.eof);
         y(u to u+w-1) := convert(x.eof, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
      else
         w := width(x.rst);
         y(u downto u-w+1) := convert(x.rst, y(u downto u-w+1));
         u := u - w;
         w := width(x.eof);
         y(u downto u-w+1) := convert(x.eof, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_ctrl2sf_rt) return heg_ctrl2sf_rt is
      variable y : heg_ctrl2sf_rt;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rst);
         y.rst := convert(x(u to u+w-1), tpl.rst);
         u := u + w;
         w := width(tpl.eof);
         y.eof := convert(x(u to u+w-1), tpl.eof);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
      else
         w := width(tpl.rst);
         y.rst := convert(x(u downto u-w+1), tpl.rst);
         u := u - w;
         w := width(tpl.eof);
         y.eof := convert(x(u downto u-w+1), tpl.eof);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_ctrl2sf_rt) return heg_ctrl2sf_rt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: heg_hp2bm_art) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_hp2bm_art; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_art) return heg_hp2bm_art is
      variable y : heg_hp2bm_art(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_hp2bm_art) return heg_hp2bm_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_hp2bm_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_art) return heg_hp2bm_art is
      variable y : heg_hp2bm_art(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_hp2bm_avt) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_hp2bm_avt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_avt) return heg_hp2bm_avt is
      variable y : heg_hp2bm_avt(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_hp2bm_avt) return heg_hp2bm_avt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_hp2bm_avt; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_avt) return heg_hp2bm_avt is
      variable y : heg_hp2bm_avt(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_bm2sf_rt) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.data);
      w := w + width(x.data_valid);
      return w;
   end function width;
   function convert(x: heg_bm2sf_rt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.data);
         y(u to u+w-1) := convert(x.data, y(u to u+w-1));
         u := u + w;
         w := width(x.data_valid);
         y(u to u+w-1) := convert(x.data_valid, y(u to u+w-1));
      else
         w := width(x.data);
         y(u downto u-w+1) := convert(x.data, y(u downto u-w+1));
         u := u - w;
         w := width(x.data_valid);
         y(u downto u-w+1) := convert(x.data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_bm2sf_rt) return heg_bm2sf_rt is
      variable y : heg_bm2sf_rt;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.data);
         y.data := convert(x(u to u+w-1), tpl.data);
         u := u + w;
         w := width(tpl.data_valid);
         y.data_valid := convert(x(u to u+w-1), tpl.data_valid);
      else
         w := width(tpl.data);
         y.data := convert(x(u downto u-w+1), tpl.data);
         u := u - w;
         w := width(tpl.data_valid);
         y.data_valid := convert(x(u downto u-w+1), tpl.data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_bm2sf_rt) return heg_bm2sf_rt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: heg_hp2bm_data_art) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_hp2bm_data_art; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_data_art) return heg_hp2bm_data_art is
      variable y : heg_hp2bm_data_art(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_hp2bm_data_art) return heg_hp2bm_data_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_hp2bm_data_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_data_art) return heg_hp2bm_data_art is
      variable y : heg_hp2bm_data_art(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: heg_hp2bm_data_avt) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: heg_hp2bm_data_avt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: heg_hp2bm_data_avt) return heg_hp2bm_data_avt is
      variable y : heg_hp2bm_data_avt(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: heg_hp2bm_data_avt) return heg_hp2bm_data_avt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: heg_hp2bm_data_avt; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: heg_hp2bm_data_avt) return heg_hp2bm_data_avt is
      variable y : heg_hp2bm_data_avt(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

end package body heg_pkg;
