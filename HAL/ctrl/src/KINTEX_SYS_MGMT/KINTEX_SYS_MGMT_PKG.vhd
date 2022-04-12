-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package KINTEX_SYS_MGMT_CTRL is

   -- Custom types and functions --

   type KINTEX_SYS_MGMT_MON_t is record
      TEMP : std_logic_vector(10 - 1 downto 0);
      VCCINT : std_logic_vector(10 - 1 downto 0);
      VCCAUX : std_logic_vector(10 - 1 downto 0);
      VCCBRAM : std_logic_vector(10 - 1 downto 0);
      TEMP_MAX : std_logic_vector(10 - 1 downto 0);
      VCCINT_MAX : std_logic_vector(10 - 1 downto 0);
      VCCAUX_MAX : std_logic_vector(10 - 1 downto 0);
      VCCBRAM_MAX : std_logic_vector(10 - 1 downto 0);
      TEMP_MIN : std_logic_vector(10 - 1 downto 0);
      VCCINT_MIN : std_logic_vector(10 - 1 downto 0);
      VCCAUX_MIN : std_logic_vector(10 - 1 downto 0);
      VCCBRAM_MIN : std_logic_vector(10 - 1 downto 0);
   end record KINTEX_SYS_MGMT_MON_t;
   attribute w of KINTEX_SYS_MGMT_MON_t : type is 120;
   function width(x: KINTEX_SYS_MGMT_MON_t) return natural;
   function convert(x: KINTEX_SYS_MGMT_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: KINTEX_SYS_MGMT_MON_t) return KINTEX_SYS_MGMT_MON_t;
   function zero(tpl: KINTEX_SYS_MGMT_MON_t) return KINTEX_SYS_MGMT_MON_t;

end package KINTEX_SYS_MGMT_CTRL;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package body KINTEX_SYS_MGMT_CTRL is

   -- Custom types and functions --

   function width(x: KINTEX_SYS_MGMT_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.TEMP);
      w := w + width(x.VCCINT);
      w := w + width(x.VCCAUX);
      w := w + width(x.VCCBRAM);
      w := w + width(x.TEMP_MAX);
      w := w + width(x.VCCINT_MAX);
      w := w + width(x.VCCAUX_MAX);
      w := w + width(x.VCCBRAM_MAX);
      w := w + width(x.TEMP_MIN);
      w := w + width(x.VCCINT_MIN);
      w := w + width(x.VCCAUX_MIN);
      w := w + width(x.VCCBRAM_MIN);
      return w;
   end function width;
   function convert(x: KINTEX_SYS_MGMT_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.TEMP);
         y(u to u+w-1) := convert(x.TEMP, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCINT);
         y(u to u+w-1) := convert(x.VCCINT, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCAUX);
         y(u to u+w-1) := convert(x.VCCAUX, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCBRAM);
         y(u to u+w-1) := convert(x.VCCBRAM, y(u to u+w-1));
         u := u + w;
         w := width(x.TEMP_MAX);
         y(u to u+w-1) := convert(x.TEMP_MAX, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCINT_MAX);
         y(u to u+w-1) := convert(x.VCCINT_MAX, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCAUX_MAX);
         y(u to u+w-1) := convert(x.VCCAUX_MAX, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCBRAM_MAX);
         y(u to u+w-1) := convert(x.VCCBRAM_MAX, y(u to u+w-1));
         u := u + w;
         w := width(x.TEMP_MIN);
         y(u to u+w-1) := convert(x.TEMP_MIN, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCINT_MIN);
         y(u to u+w-1) := convert(x.VCCINT_MIN, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCAUX_MIN);
         y(u to u+w-1) := convert(x.VCCAUX_MIN, y(u to u+w-1));
         u := u + w;
         w := width(x.VCCBRAM_MIN);
         y(u to u+w-1) := convert(x.VCCBRAM_MIN, y(u to u+w-1));
      else
         w := width(x.TEMP);
         y(u downto u-w+1) := convert(x.TEMP, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCINT);
         y(u downto u-w+1) := convert(x.VCCINT, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCAUX);
         y(u downto u-w+1) := convert(x.VCCAUX, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCBRAM);
         y(u downto u-w+1) := convert(x.VCCBRAM, y(u downto u-w+1));
         u := u - w;
         w := width(x.TEMP_MAX);
         y(u downto u-w+1) := convert(x.TEMP_MAX, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCINT_MAX);
         y(u downto u-w+1) := convert(x.VCCINT_MAX, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCAUX_MAX);
         y(u downto u-w+1) := convert(x.VCCAUX_MAX, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCBRAM_MAX);
         y(u downto u-w+1) := convert(x.VCCBRAM_MAX, y(u downto u-w+1));
         u := u - w;
         w := width(x.TEMP_MIN);
         y(u downto u-w+1) := convert(x.TEMP_MIN, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCINT_MIN);
         y(u downto u-w+1) := convert(x.VCCINT_MIN, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCAUX_MIN);
         y(u downto u-w+1) := convert(x.VCCAUX_MIN, y(u downto u-w+1));
         u := u - w;
         w := width(x.VCCBRAM_MIN);
         y(u downto u-w+1) := convert(x.VCCBRAM_MIN, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: KINTEX_SYS_MGMT_MON_t) return KINTEX_SYS_MGMT_MON_t is
      variable y : KINTEX_SYS_MGMT_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.TEMP);
         y.TEMP := convert(x(u to u+w-1), tpl.TEMP);
         u := u + w;
         w := width(tpl.VCCINT);
         y.VCCINT := convert(x(u to u+w-1), tpl.VCCINT);
         u := u + w;
         w := width(tpl.VCCAUX);
         y.VCCAUX := convert(x(u to u+w-1), tpl.VCCAUX);
         u := u + w;
         w := width(tpl.VCCBRAM);
         y.VCCBRAM := convert(x(u to u+w-1), tpl.VCCBRAM);
         u := u + w;
         w := width(tpl.TEMP_MAX);
         y.TEMP_MAX := convert(x(u to u+w-1), tpl.TEMP_MAX);
         u := u + w;
         w := width(tpl.VCCINT_MAX);
         y.VCCINT_MAX := convert(x(u to u+w-1), tpl.VCCINT_MAX);
         u := u + w;
         w := width(tpl.VCCAUX_MAX);
         y.VCCAUX_MAX := convert(x(u to u+w-1), tpl.VCCAUX_MAX);
         u := u + w;
         w := width(tpl.VCCBRAM_MAX);
         y.VCCBRAM_MAX := convert(x(u to u+w-1), tpl.VCCBRAM_MAX);
         u := u + w;
         w := width(tpl.TEMP_MIN);
         y.TEMP_MIN := convert(x(u to u+w-1), tpl.TEMP_MIN);
         u := u + w;
         w := width(tpl.VCCINT_MIN);
         y.VCCINT_MIN := convert(x(u to u+w-1), tpl.VCCINT_MIN);
         u := u + w;
         w := width(tpl.VCCAUX_MIN);
         y.VCCAUX_MIN := convert(x(u to u+w-1), tpl.VCCAUX_MIN);
         u := u + w;
         w := width(tpl.VCCBRAM_MIN);
         y.VCCBRAM_MIN := convert(x(u to u+w-1), tpl.VCCBRAM_MIN);
      else
         w := width(tpl.TEMP);
         y.TEMP := convert(x(u downto u-w+1), tpl.TEMP);
         u := u - w;
         w := width(tpl.VCCINT);
         y.VCCINT := convert(x(u downto u-w+1), tpl.VCCINT);
         u := u - w;
         w := width(tpl.VCCAUX);
         y.VCCAUX := convert(x(u downto u-w+1), tpl.VCCAUX);
         u := u - w;
         w := width(tpl.VCCBRAM);
         y.VCCBRAM := convert(x(u downto u-w+1), tpl.VCCBRAM);
         u := u - w;
         w := width(tpl.TEMP_MAX);
         y.TEMP_MAX := convert(x(u downto u-w+1), tpl.TEMP_MAX);
         u := u - w;
         w := width(tpl.VCCINT_MAX);
         y.VCCINT_MAX := convert(x(u downto u-w+1), tpl.VCCINT_MAX);
         u := u - w;
         w := width(tpl.VCCAUX_MAX);
         y.VCCAUX_MAX := convert(x(u downto u-w+1), tpl.VCCAUX_MAX);
         u := u - w;
         w := width(tpl.VCCBRAM_MAX);
         y.VCCBRAM_MAX := convert(x(u downto u-w+1), tpl.VCCBRAM_MAX);
         u := u - w;
         w := width(tpl.TEMP_MIN);
         y.TEMP_MIN := convert(x(u downto u-w+1), tpl.TEMP_MIN);
         u := u - w;
         w := width(tpl.VCCINT_MIN);
         y.VCCINT_MIN := convert(x(u downto u-w+1), tpl.VCCINT_MIN);
         u := u - w;
         w := width(tpl.VCCAUX_MIN);
         y.VCCAUX_MIN := convert(x(u downto u-w+1), tpl.VCCAUX_MIN);
         u := u - w;
         w := width(tpl.VCCBRAM_MIN);
         y.VCCBRAM_MIN := convert(x(u downto u-w+1), tpl.VCCBRAM_MIN);
      end if;
      return y;
   end function convert;
   function zero(tpl: KINTEX_SYS_MGMT_MON_t) return KINTEX_SYS_MGMT_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

end package body KINTEX_SYS_MGMT_CTRL;
