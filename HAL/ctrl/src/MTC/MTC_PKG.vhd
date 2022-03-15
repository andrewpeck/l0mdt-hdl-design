-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl
-- 2022-03-15 21:00:44

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package MTC_CTRL is

   -- Custom types and functions --

   type MTC_MON_t is record
      STATUS : std_logic;
      READY : std_logic;
   end record MTC_MON_t;
   function width(x: MTC_MON_t) return natural;
   function convert(x: MTC_MON_t; t: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; t: MTC_MON_t) return MTC_MON_t;

   type MTC_CTRL_t is record
      RESET : std_logic;
   end record MTC_CTRL_t;
   function width(x: MTC_CTRL_t) return natural;
   function convert(x: MTC_CTRL_t; t: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; t: MTC_CTRL_t) return MTC_CTRL_t;

end package MTC_CTRL;

------------------------------------------------------------

package body MTC_CTRL is

   -- Custom types and functions --

   function width(x: MTC_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.STATUS);
      w := w + width(x.READY);
      return w;
   end function width;
   function convert(x: MTC_MON_t; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
      variable w : integer;
      variable u : integer := t'left;
   begin
      if t'ascending then
         w := width(x.STATUS);
         y(u to u+w-1) := convert(x.STATUS, y(u to u+w-1));
         u := u + w;
         w := width(x.READY);
         y(u to u+w-1) := convert(x.READY, y(u to u+w-1));
      else
         w := width(x.STATUS);
         y(u downto u-w+1) := convert(x.STATUS, y(u downto u-w+1));
         u := u - w;
         w := width(x.READY);
         y(u downto u-w+1) := convert(x.READY, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: MTC_MON_t) return MTC_MON_t is
      variable y : MTC_MON_t := t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(t.STATUS);
         y.STATUS := convert(x(u to u+w-1), t.STATUS);
         u := u + w;
         w := width(t.READY);
         y.READY := convert(x(u to u+w-1), t.READY);
      else
         w := width(t.STATUS);
         y.STATUS := convert(x(u downto u-w+1), t.STATUS);
         u := u - w;
         w := width(t.READY);
         y.READY := convert(x(u downto u-w+1), t.READY);
      end if;
      return y;
   end function convert;

   function width(x: MTC_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.RESET);
      return w;
   end function width;
   function convert(x: MTC_CTRL_t; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
      variable w : integer;
      variable u : integer := t'left;
   begin
      if t'ascending then
         w := width(x.RESET);
         y(u to u+w-1) := convert(x.RESET, y(u to u+w-1));
      else
         w := width(x.RESET);
         y(u downto u-w+1) := convert(x.RESET, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: MTC_CTRL_t) return MTC_CTRL_t is
      variable y : MTC_CTRL_t := t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(t.RESET);
         y.RESET := convert(x(u to u+w-1), t.RESET);
      else
         w := width(t.RESET);
         y.RESET := convert(x(u downto u-w+1), t.RESET);
      end if;
      return y;
   end function convert;

end package body MTC_CTRL;
