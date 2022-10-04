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

package heg_sim_pkg is

   -- Custom types and functions --

   type eve_pc2heg_rt is record
      ToS : unsigned(64-1 downto 0);
      ToA : unsigned(64-1 downto 0);
      event_id : unsigned(32-1 downto 0);
      muonFixedId : unsigned(32-1 downto 0);
      station : unsigned(8-1 downto 0);
      hp : unsigned(4-1 downto 0);
      pc2heg : hp_hpsPc2hp_rt;
   end record eve_pc2heg_rt;
   attribute w of eve_pc2heg_rt : type is 274;
   function width(x: eve_pc2heg_rt) return natural;
   function convert(x: eve_pc2heg_rt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: eve_pc2heg_rt) return eve_pc2heg_rt;
   function zero(tpl: eve_pc2heg_rt) return eve_pc2heg_rt;

   constant TB_PC2HEG_FIFO_WIDTH : integer := 32;
   attribute w of TB_PC2HEG_FIFO_WIDTH : constant is 32;

   type eve_pc2heg_art is array(TB_PC2HEG_FIFO_WIDTH-1 downto 0) of eve_pc2heg_rt;
   attribute w of eve_pc2heg_art : type is 8768;
   function width(x: eve_pc2heg_art) return integer;
   function convert(x: eve_pc2heg_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: eve_pc2heg_art) return eve_pc2heg_art;
   function zero(tpl: eve_pc2heg_art) return eve_pc2heg_art;
   function convert(x: eve_pc2heg_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: eve_pc2heg_art) return eve_pc2heg_art;

   type eve_ucm2heg_rt is record
      ToS : unsigned(64-1 downto 0);
      ToA : unsigned(64-1 downto 0);
      event_id : unsigned(32-1 downto 0);
      station : unsigned(8-1 downto 0);
      ucm2heg : ucm2hps_rt;
   end record eve_ucm2heg_rt;
   attribute w of eve_ucm2heg_rt : type is 226;
   function width(x: eve_ucm2heg_rt) return natural;
   function convert(x: eve_ucm2heg_rt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: eve_ucm2heg_rt) return eve_ucm2heg_rt;
   function zero(tpl: eve_ucm2heg_rt) return eve_ucm2heg_rt;

   constant TB_UCM2HEG_FIFO_WIDTH : integer := 32;
   attribute w of TB_UCM2HEG_FIFO_WIDTH : constant is 32;

   type eve_ucm2hps_art is array(TB_UCM2HEG_FIFO_WIDTH-1 downto 0) of eve_ucm2heg_rt;
   attribute w of eve_ucm2hps_art : type is 7232;
   function width(x: eve_ucm2hps_art) return integer;
   function convert(x: eve_ucm2hps_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: eve_ucm2hps_art) return eve_ucm2hps_art;
   function zero(tpl: eve_ucm2hps_art) return eve_ucm2hps_art;
   function convert(x: eve_ucm2hps_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: eve_ucm2hps_art) return eve_ucm2hps_art;

end package heg_sim_pkg;

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

package body heg_sim_pkg is

   -- Custom types and functions --

   function width(x: eve_pc2heg_rt) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.ToS);
      w := w + width(x.ToA);
      w := w + width(x.event_id);
      w := w + width(x.muonFixedId);
      w := w + width(x.station);
      w := w + width(x.hp);
      w := w + width(x.pc2heg);
      return w;
   end function width;
   function convert(x: eve_pc2heg_rt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.ToS);
         y(u to u+w-1) := convert(x.ToS, y(u to u+w-1));
         u := u + w;
         w := width(x.ToA);
         y(u to u+w-1) := convert(x.ToA, y(u to u+w-1));
         u := u + w;
         w := width(x.event_id);
         y(u to u+w-1) := convert(x.event_id, y(u to u+w-1));
         u := u + w;
         w := width(x.muonFixedId);
         y(u to u+w-1) := convert(x.muonFixedId, y(u to u+w-1));
         u := u + w;
         w := width(x.station);
         y(u to u+w-1) := convert(x.station, y(u to u+w-1));
         u := u + w;
         w := width(x.hp);
         y(u to u+w-1) := convert(x.hp, y(u to u+w-1));
         u := u + w;
         w := width(x.pc2heg);
         y(u to u+w-1) := convert(x.pc2heg, y(u to u+w-1));
      else
         w := width(x.ToS);
         y(u downto u-w+1) := convert(x.ToS, y(u downto u-w+1));
         u := u - w;
         w := width(x.ToA);
         y(u downto u-w+1) := convert(x.ToA, y(u downto u-w+1));
         u := u - w;
         w := width(x.event_id);
         y(u downto u-w+1) := convert(x.event_id, y(u downto u-w+1));
         u := u - w;
         w := width(x.muonFixedId);
         y(u downto u-w+1) := convert(x.muonFixedId, y(u downto u-w+1));
         u := u - w;
         w := width(x.station);
         y(u downto u-w+1) := convert(x.station, y(u downto u-w+1));
         u := u - w;
         w := width(x.hp);
         y(u downto u-w+1) := convert(x.hp, y(u downto u-w+1));
         u := u - w;
         w := width(x.pc2heg);
         y(u downto u-w+1) := convert(x.pc2heg, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: eve_pc2heg_rt) return eve_pc2heg_rt is
      variable y : eve_pc2heg_rt;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.ToS);
         y.ToS := convert(x(u to u+w-1), tpl.ToS);
         u := u + w;
         w := width(tpl.ToA);
         y.ToA := convert(x(u to u+w-1), tpl.ToA);
         u := u + w;
         w := width(tpl.event_id);
         y.event_id := convert(x(u to u+w-1), tpl.event_id);
         u := u + w;
         w := width(tpl.muonFixedId);
         y.muonFixedId := convert(x(u to u+w-1), tpl.muonFixedId);
         u := u + w;
         w := width(tpl.station);
         y.station := convert(x(u to u+w-1), tpl.station);
         u := u + w;
         w := width(tpl.hp);
         y.hp := convert(x(u to u+w-1), tpl.hp);
         u := u + w;
         w := width(tpl.pc2heg);
         y.pc2heg := convert(x(u to u+w-1), tpl.pc2heg);
      else
         w := width(tpl.ToS);
         y.ToS := convert(x(u downto u-w+1), tpl.ToS);
         u := u - w;
         w := width(tpl.ToA);
         y.ToA := convert(x(u downto u-w+1), tpl.ToA);
         u := u - w;
         w := width(tpl.event_id);
         y.event_id := convert(x(u downto u-w+1), tpl.event_id);
         u := u - w;
         w := width(tpl.muonFixedId);
         y.muonFixedId := convert(x(u downto u-w+1), tpl.muonFixedId);
         u := u - w;
         w := width(tpl.station);
         y.station := convert(x(u downto u-w+1), tpl.station);
         u := u - w;
         w := width(tpl.hp);
         y.hp := convert(x(u downto u-w+1), tpl.hp);
         u := u - w;
         w := width(tpl.pc2heg);
         y.pc2heg := convert(x(u downto u-w+1), tpl.pc2heg);
      end if;
      return y;
   end function convert;
   function zero(tpl: eve_pc2heg_rt) return eve_pc2heg_rt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: eve_pc2heg_art) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: eve_pc2heg_art; tpl: std_logic_vector) return std_logic_vector is
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
   function convert(x: std_logic_vector; tpl: eve_pc2heg_art) return eve_pc2heg_art is
      variable y : eve_pc2heg_art;
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
   function zero(tpl: eve_pc2heg_art) return eve_pc2heg_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: eve_pc2heg_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: eve_pc2heg_art) return eve_pc2heg_art is
      variable y : eve_pc2heg_art;
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

   function width(x: eve_ucm2heg_rt) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.ToS);
      w := w + width(x.ToA);
      w := w + width(x.event_id);
      w := w + width(x.station);
      w := w + width(x.ucm2heg);
      return w;
   end function width;
   function convert(x: eve_ucm2heg_rt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.ToS);
         y(u to u+w-1) := convert(x.ToS, y(u to u+w-1));
         u := u + w;
         w := width(x.ToA);
         y(u to u+w-1) := convert(x.ToA, y(u to u+w-1));
         u := u + w;
         w := width(x.event_id);
         y(u to u+w-1) := convert(x.event_id, y(u to u+w-1));
         u := u + w;
         w := width(x.station);
         y(u to u+w-1) := convert(x.station, y(u to u+w-1));
         u := u + w;
         w := width(x.ucm2heg);
         y(u to u+w-1) := convert(x.ucm2heg, y(u to u+w-1));
      else
         w := width(x.ToS);
         y(u downto u-w+1) := convert(x.ToS, y(u downto u-w+1));
         u := u - w;
         w := width(x.ToA);
         y(u downto u-w+1) := convert(x.ToA, y(u downto u-w+1));
         u := u - w;
         w := width(x.event_id);
         y(u downto u-w+1) := convert(x.event_id, y(u downto u-w+1));
         u := u - w;
         w := width(x.station);
         y(u downto u-w+1) := convert(x.station, y(u downto u-w+1));
         u := u - w;
         w := width(x.ucm2heg);
         y(u downto u-w+1) := convert(x.ucm2heg, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: eve_ucm2heg_rt) return eve_ucm2heg_rt is
      variable y : eve_ucm2heg_rt;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.ToS);
         y.ToS := convert(x(u to u+w-1), tpl.ToS);
         u := u + w;
         w := width(tpl.ToA);
         y.ToA := convert(x(u to u+w-1), tpl.ToA);
         u := u + w;
         w := width(tpl.event_id);
         y.event_id := convert(x(u to u+w-1), tpl.event_id);
         u := u + w;
         w := width(tpl.station);
         y.station := convert(x(u to u+w-1), tpl.station);
         u := u + w;
         w := width(tpl.ucm2heg);
         y.ucm2heg := convert(x(u to u+w-1), tpl.ucm2heg);
      else
         w := width(tpl.ToS);
         y.ToS := convert(x(u downto u-w+1), tpl.ToS);
         u := u - w;
         w := width(tpl.ToA);
         y.ToA := convert(x(u downto u-w+1), tpl.ToA);
         u := u - w;
         w := width(tpl.event_id);
         y.event_id := convert(x(u downto u-w+1), tpl.event_id);
         u := u - w;
         w := width(tpl.station);
         y.station := convert(x(u downto u-w+1), tpl.station);
         u := u - w;
         w := width(tpl.ucm2heg);
         y.ucm2heg := convert(x(u downto u-w+1), tpl.ucm2heg);
      end if;
      return y;
   end function convert;
   function zero(tpl: eve_ucm2heg_rt) return eve_ucm2heg_rt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: eve_ucm2hps_art) return integer is
      variable w : integer := x'length * width(x(x'low));
   begin
      return w;
   end function width;
   function convert(x: eve_ucm2hps_art; tpl: std_logic_vector) return std_logic_vector is
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
   function convert(x: std_logic_vector; tpl: eve_ucm2hps_art) return eve_ucm2hps_art is
      variable y : eve_ucm2hps_art;
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
   function zero(tpl: eve_ucm2hps_art) return eve_ucm2hps_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: eve_ucm2hps_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: eve_ucm2hps_art) return eve_ucm2hps_art is
      variable y : eve_ucm2hps_art;
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

end package body heg_sim_pkg;
