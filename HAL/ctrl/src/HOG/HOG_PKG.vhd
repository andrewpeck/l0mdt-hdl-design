-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package HOG_CTRL is

   -- Custom types and functions --

   type HOG_MON_t is record
      GLOBAL_DATE : std_logic_vector(32 - 1 downto 0);
      GLOBAL_TIME : std_logic_vector(32 - 1 downto 0);
      GLOBAL_VER : std_logic_vector(32 - 1 downto 0);
      GLOBAL_SHA : std_logic_vector(32 - 1 downto 0);
      TOP_SHA : std_logic_vector(32 - 1 downto 0);
      TOP_VER : std_logic_vector(32 - 1 downto 0);
      HOG_SHA : std_logic_vector(32 - 1 downto 0);
      HOG_VER : std_logic_vector(32 - 1 downto 0);
      CON_SHA : std_logic_vector(32 - 1 downto 0);
      CON_VER : std_logic_vector(32 - 1 downto 0);
      PROJECT_LIB_SHA : std_logic_vector(32 - 1 downto 0);
      PROJECT_LIB_VER : std_logic_vector(32 - 1 downto 0);
   end record HOG_MON_t;
   attribute w of HOG_MON_t : type is 384;
   function width(x: HOG_MON_t) return natural;
   function convert(x: HOG_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: HOG_MON_t) return HOG_MON_t;
   function zero(tpl: HOG_MON_t) return HOG_MON_t;

end package HOG_CTRL;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package body HOG_CTRL is

   -- Custom types and functions --

   function width(x: HOG_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.GLOBAL_DATE);
      w := w + width(x.GLOBAL_TIME);
      w := w + width(x.GLOBAL_VER);
      w := w + width(x.GLOBAL_SHA);
      w := w + width(x.TOP_SHA);
      w := w + width(x.TOP_VER);
      w := w + width(x.HOG_SHA);
      w := w + width(x.HOG_VER);
      w := w + width(x.CON_SHA);
      w := w + width(x.CON_VER);
      w := w + width(x.PROJECT_LIB_SHA);
      w := w + width(x.PROJECT_LIB_VER);
      return w;
   end function width;
   function convert(x: HOG_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.GLOBAL_DATE);
         y(u to u+w-1) := convert(x.GLOBAL_DATE, y(u to u+w-1));
         u := u + w;
         w := width(x.GLOBAL_TIME);
         y(u to u+w-1) := convert(x.GLOBAL_TIME, y(u to u+w-1));
         u := u + w;
         w := width(x.GLOBAL_VER);
         y(u to u+w-1) := convert(x.GLOBAL_VER, y(u to u+w-1));
         u := u + w;
         w := width(x.GLOBAL_SHA);
         y(u to u+w-1) := convert(x.GLOBAL_SHA, y(u to u+w-1));
         u := u + w;
         w := width(x.TOP_SHA);
         y(u to u+w-1) := convert(x.TOP_SHA, y(u to u+w-1));
         u := u + w;
         w := width(x.TOP_VER);
         y(u to u+w-1) := convert(x.TOP_VER, y(u to u+w-1));
         u := u + w;
         w := width(x.HOG_SHA);
         y(u to u+w-1) := convert(x.HOG_SHA, y(u to u+w-1));
         u := u + w;
         w := width(x.HOG_VER);
         y(u to u+w-1) := convert(x.HOG_VER, y(u to u+w-1));
         u := u + w;
         w := width(x.CON_SHA);
         y(u to u+w-1) := convert(x.CON_SHA, y(u to u+w-1));
         u := u + w;
         w := width(x.CON_VER);
         y(u to u+w-1) := convert(x.CON_VER, y(u to u+w-1));
         u := u + w;
         w := width(x.PROJECT_LIB_SHA);
         y(u to u+w-1) := convert(x.PROJECT_LIB_SHA, y(u to u+w-1));
         u := u + w;
         w := width(x.PROJECT_LIB_VER);
         y(u to u+w-1) := convert(x.PROJECT_LIB_VER, y(u to u+w-1));
      else
         w := width(x.GLOBAL_DATE);
         y(u downto u-w+1) := convert(x.GLOBAL_DATE, y(u downto u-w+1));
         u := u - w;
         w := width(x.GLOBAL_TIME);
         y(u downto u-w+1) := convert(x.GLOBAL_TIME, y(u downto u-w+1));
         u := u - w;
         w := width(x.GLOBAL_VER);
         y(u downto u-w+1) := convert(x.GLOBAL_VER, y(u downto u-w+1));
         u := u - w;
         w := width(x.GLOBAL_SHA);
         y(u downto u-w+1) := convert(x.GLOBAL_SHA, y(u downto u-w+1));
         u := u - w;
         w := width(x.TOP_SHA);
         y(u downto u-w+1) := convert(x.TOP_SHA, y(u downto u-w+1));
         u := u - w;
         w := width(x.TOP_VER);
         y(u downto u-w+1) := convert(x.TOP_VER, y(u downto u-w+1));
         u := u - w;
         w := width(x.HOG_SHA);
         y(u downto u-w+1) := convert(x.HOG_SHA, y(u downto u-w+1));
         u := u - w;
         w := width(x.HOG_VER);
         y(u downto u-w+1) := convert(x.HOG_VER, y(u downto u-w+1));
         u := u - w;
         w := width(x.CON_SHA);
         y(u downto u-w+1) := convert(x.CON_SHA, y(u downto u-w+1));
         u := u - w;
         w := width(x.CON_VER);
         y(u downto u-w+1) := convert(x.CON_VER, y(u downto u-w+1));
         u := u - w;
         w := width(x.PROJECT_LIB_SHA);
         y(u downto u-w+1) := convert(x.PROJECT_LIB_SHA, y(u downto u-w+1));
         u := u - w;
         w := width(x.PROJECT_LIB_VER);
         y(u downto u-w+1) := convert(x.PROJECT_LIB_VER, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: HOG_MON_t) return HOG_MON_t is
      variable y : HOG_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.GLOBAL_DATE);
         y.GLOBAL_DATE := convert(x(u to u+w-1), tpl.GLOBAL_DATE);
         u := u + w;
         w := width(tpl.GLOBAL_TIME);
         y.GLOBAL_TIME := convert(x(u to u+w-1), tpl.GLOBAL_TIME);
         u := u + w;
         w := width(tpl.GLOBAL_VER);
         y.GLOBAL_VER := convert(x(u to u+w-1), tpl.GLOBAL_VER);
         u := u + w;
         w := width(tpl.GLOBAL_SHA);
         y.GLOBAL_SHA := convert(x(u to u+w-1), tpl.GLOBAL_SHA);
         u := u + w;
         w := width(tpl.TOP_SHA);
         y.TOP_SHA := convert(x(u to u+w-1), tpl.TOP_SHA);
         u := u + w;
         w := width(tpl.TOP_VER);
         y.TOP_VER := convert(x(u to u+w-1), tpl.TOP_VER);
         u := u + w;
         w := width(tpl.HOG_SHA);
         y.HOG_SHA := convert(x(u to u+w-1), tpl.HOG_SHA);
         u := u + w;
         w := width(tpl.HOG_VER);
         y.HOG_VER := convert(x(u to u+w-1), tpl.HOG_VER);
         u := u + w;
         w := width(tpl.CON_SHA);
         y.CON_SHA := convert(x(u to u+w-1), tpl.CON_SHA);
         u := u + w;
         w := width(tpl.CON_VER);
         y.CON_VER := convert(x(u to u+w-1), tpl.CON_VER);
         u := u + w;
         w := width(tpl.PROJECT_LIB_SHA);
         y.PROJECT_LIB_SHA := convert(x(u to u+w-1), tpl.PROJECT_LIB_SHA);
         u := u + w;
         w := width(tpl.PROJECT_LIB_VER);
         y.PROJECT_LIB_VER := convert(x(u to u+w-1), tpl.PROJECT_LIB_VER);
      else
         w := width(tpl.GLOBAL_DATE);
         y.GLOBAL_DATE := convert(x(u downto u-w+1), tpl.GLOBAL_DATE);
         u := u - w;
         w := width(tpl.GLOBAL_TIME);
         y.GLOBAL_TIME := convert(x(u downto u-w+1), tpl.GLOBAL_TIME);
         u := u - w;
         w := width(tpl.GLOBAL_VER);
         y.GLOBAL_VER := convert(x(u downto u-w+1), tpl.GLOBAL_VER);
         u := u - w;
         w := width(tpl.GLOBAL_SHA);
         y.GLOBAL_SHA := convert(x(u downto u-w+1), tpl.GLOBAL_SHA);
         u := u - w;
         w := width(tpl.TOP_SHA);
         y.TOP_SHA := convert(x(u downto u-w+1), tpl.TOP_SHA);
         u := u - w;
         w := width(tpl.TOP_VER);
         y.TOP_VER := convert(x(u downto u-w+1), tpl.TOP_VER);
         u := u - w;
         w := width(tpl.HOG_SHA);
         y.HOG_SHA := convert(x(u downto u-w+1), tpl.HOG_SHA);
         u := u - w;
         w := width(tpl.HOG_VER);
         y.HOG_VER := convert(x(u downto u-w+1), tpl.HOG_VER);
         u := u - w;
         w := width(tpl.CON_SHA);
         y.CON_SHA := convert(x(u downto u-w+1), tpl.CON_SHA);
         u := u - w;
         w := width(tpl.CON_VER);
         y.CON_VER := convert(x(u downto u-w+1), tpl.CON_VER);
         u := u - w;
         w := width(tpl.PROJECT_LIB_SHA);
         y.PROJECT_LIB_SHA := convert(x(u downto u-w+1), tpl.PROJECT_LIB_SHA);
         u := u - w;
         w := width(tpl.PROJECT_LIB_VER);
         y.PROJECT_LIB_VER := convert(x(u downto u-w+1), tpl.PROJECT_LIB_VER);
      end if;
      return y;
   end function convert;
   function zero(tpl: HOG_MON_t) return HOG_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

end package body HOG_CTRL;
