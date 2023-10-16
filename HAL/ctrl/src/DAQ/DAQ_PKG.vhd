-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl
-- 2023-10-16 09:45:49

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package DAQ_CTRL is

   -- Custom types and functions --

   type DAQ_action_CTRL_t is record
      RESET : std_logic;
      WR_EN : std_logic;
   end record DAQ_action_CTRL_t;
   attribute w of DAQ_action_CTRL_t : type is 2;
   function width(x: DAQ_action_CTRL_t) return natural;
   function convert(x: DAQ_action_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_action_CTRL_t) return DAQ_action_CTRL_t;
   function zero(tpl: DAQ_action_CTRL_t) return DAQ_action_CTRL_t;

   type DAQ_wr0_CTRL_t is record
      opening_offset : std_logic_vector(12 - 1 downto 0);
      request_offset : std_logic_vector(12 - 1 downto 0);
   end record DAQ_wr0_CTRL_t;
   attribute w of DAQ_wr0_CTRL_t : type is 24;
   function width(x: DAQ_wr0_CTRL_t) return natural;
   function convert(x: DAQ_wr0_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_wr0_CTRL_t) return DAQ_wr0_CTRL_t;
   function zero(tpl: DAQ_wr0_CTRL_t) return DAQ_wr0_CTRL_t;

   type DAQ_wr1_CTRL_t is record
      closing_offset : std_logic_vector(12 - 1 downto 0);
      window_timeout : std_logic_vector(12 - 1 downto 0);
      busy_threshold : std_logic_vector(8 - 1 downto 0);
   end record DAQ_wr1_CTRL_t;
   attribute w of DAQ_wr1_CTRL_t : type is 32;
   function width(x: DAQ_wr1_CTRL_t) return natural;
   function convert(x: DAQ_wr1_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_wr1_CTRL_t) return DAQ_wr1_CTRL_t;
   function zero(tpl: DAQ_wr1_CTRL_t) return DAQ_wr1_CTRL_t;

   type DAQ_rd0_MON_t is record
      opening_offset : std_logic_vector(12 - 1 downto 0);
      request_offset : std_logic_vector(12 - 1 downto 0);
   end record DAQ_rd0_MON_t;
   attribute w of DAQ_rd0_MON_t : type is 24;
   function width(x: DAQ_rd0_MON_t) return natural;
   function convert(x: DAQ_rd0_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_rd0_MON_t) return DAQ_rd0_MON_t;
   function zero(tpl: DAQ_rd0_MON_t) return DAQ_rd0_MON_t;

   type DAQ_rd1_MON_t is record
      closing_offset : std_logic_vector(12 - 1 downto 0);
      window_timeout : std_logic_vector(12 - 1 downto 0);
      busy_threshold : std_logic_vector(8 - 1 downto 0);
   end record DAQ_rd1_MON_t;
   attribute w of DAQ_rd1_MON_t : type is 32;
   function width(x: DAQ_rd1_MON_t) return natural;
   function convert(x: DAQ_rd1_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_rd1_MON_t) return DAQ_rd1_MON_t;
   function zero(tpl: DAQ_rd1_MON_t) return DAQ_rd1_MON_t;

   type DAQ_status_MON_t is record
      busy : std_logic;
   end record DAQ_status_MON_t;
   attribute w of DAQ_status_MON_t : type is 1;
   function width(x: DAQ_status_MON_t) return natural;
   function convert(x: DAQ_status_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_status_MON_t) return DAQ_status_MON_t;
   function zero(tpl: DAQ_status_MON_t) return DAQ_status_MON_t;

   type DAQ_MON_t is record
      rd0 : DAQ_rd0_MON_t;
      rd1 : DAQ_rd1_MON_t;
      status : DAQ_status_MON_t;
   end record DAQ_MON_t;
   attribute w of DAQ_MON_t : type is 57;
   function width(x: DAQ_MON_t) return natural;
   function convert(x: DAQ_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_MON_t) return DAQ_MON_t;
   function zero(tpl: DAQ_MON_t) return DAQ_MON_t;

   type DAQ_CTRL_t is record
      action : DAQ_action_CTRL_t;
      wr0 : DAQ_wr0_CTRL_t;
      wr1 : DAQ_wr1_CTRL_t;
   end record DAQ_CTRL_t;
   attribute w of DAQ_CTRL_t : type is 58;
   function width(x: DAQ_CTRL_t) return natural;
   function convert(x: DAQ_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: DAQ_CTRL_t) return DAQ_CTRL_t;
   function zero(tpl: DAQ_CTRL_t) return DAQ_CTRL_t;

end package DAQ_CTRL;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package body DAQ_CTRL is

   -- Custom types and functions --

   function width(x: DAQ_action_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.RESET);
      w := w + width(x.WR_EN);
      return w;
   end function width;
   function convert(x: DAQ_action_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.RESET);
         y(u to u+w-1) := convert(x.RESET, y(u to u+w-1));
         u := u + w;
         w := width(x.WR_EN);
         y(u to u+w-1) := convert(x.WR_EN, y(u to u+w-1));
      else
         w := width(x.RESET);
         y(u downto u-w+1) := convert(x.RESET, y(u downto u-w+1));
         u := u - w;
         w := width(x.WR_EN);
         y(u downto u-w+1) := convert(x.WR_EN, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_action_CTRL_t) return DAQ_action_CTRL_t is
      variable y : DAQ_action_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.RESET);
         y.RESET := convert(x(u to u+w-1), tpl.RESET);
         u := u + w;
         w := width(tpl.WR_EN);
         y.WR_EN := convert(x(u to u+w-1), tpl.WR_EN);
      else
         w := width(tpl.RESET);
         y.RESET := convert(x(u downto u-w+1), tpl.RESET);
         u := u - w;
         w := width(tpl.WR_EN);
         y.WR_EN := convert(x(u downto u-w+1), tpl.WR_EN);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_action_CTRL_t) return DAQ_action_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: DAQ_wr0_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.opening_offset);
      w := w + width(x.request_offset);
      return w;
   end function width;
   function convert(x: DAQ_wr0_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.opening_offset);
         y(u to u+w-1) := convert(x.opening_offset, y(u to u+w-1));
         u := u + w;
         w := width(x.request_offset);
         y(u to u+w-1) := convert(x.request_offset, y(u to u+w-1));
      else
         w := width(x.opening_offset);
         y(u downto u-w+1) := convert(x.opening_offset, y(u downto u-w+1));
         u := u - w;
         w := width(x.request_offset);
         y(u downto u-w+1) := convert(x.request_offset, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_wr0_CTRL_t) return DAQ_wr0_CTRL_t is
      variable y : DAQ_wr0_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.opening_offset);
         y.opening_offset := convert(x(u to u+w-1), tpl.opening_offset);
         u := u + w;
         w := width(tpl.request_offset);
         y.request_offset := convert(x(u to u+w-1), tpl.request_offset);
      else
         w := width(tpl.opening_offset);
         y.opening_offset := convert(x(u downto u-w+1), tpl.opening_offset);
         u := u - w;
         w := width(tpl.request_offset);
         y.request_offset := convert(x(u downto u-w+1), tpl.request_offset);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_wr0_CTRL_t) return DAQ_wr0_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: DAQ_wr1_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.closing_offset);
      w := w + width(x.window_timeout);
      w := w + width(x.busy_threshold);
      return w;
   end function width;
   function convert(x: DAQ_wr1_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.closing_offset);
         y(u to u+w-1) := convert(x.closing_offset, y(u to u+w-1));
         u := u + w;
         w := width(x.window_timeout);
         y(u to u+w-1) := convert(x.window_timeout, y(u to u+w-1));
         u := u + w;
         w := width(x.busy_threshold);
         y(u to u+w-1) := convert(x.busy_threshold, y(u to u+w-1));
      else
         w := width(x.closing_offset);
         y(u downto u-w+1) := convert(x.closing_offset, y(u downto u-w+1));
         u := u - w;
         w := width(x.window_timeout);
         y(u downto u-w+1) := convert(x.window_timeout, y(u downto u-w+1));
         u := u - w;
         w := width(x.busy_threshold);
         y(u downto u-w+1) := convert(x.busy_threshold, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_wr1_CTRL_t) return DAQ_wr1_CTRL_t is
      variable y : DAQ_wr1_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.closing_offset);
         y.closing_offset := convert(x(u to u+w-1), tpl.closing_offset);
         u := u + w;
         w := width(tpl.window_timeout);
         y.window_timeout := convert(x(u to u+w-1), tpl.window_timeout);
         u := u + w;
         w := width(tpl.busy_threshold);
         y.busy_threshold := convert(x(u to u+w-1), tpl.busy_threshold);
      else
         w := width(tpl.closing_offset);
         y.closing_offset := convert(x(u downto u-w+1), tpl.closing_offset);
         u := u - w;
         w := width(tpl.window_timeout);
         y.window_timeout := convert(x(u downto u-w+1), tpl.window_timeout);
         u := u - w;
         w := width(tpl.busy_threshold);
         y.busy_threshold := convert(x(u downto u-w+1), tpl.busy_threshold);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_wr1_CTRL_t) return DAQ_wr1_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: DAQ_rd0_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.opening_offset);
      w := w + width(x.request_offset);
      return w;
   end function width;
   function convert(x: DAQ_rd0_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.opening_offset);
         y(u to u+w-1) := convert(x.opening_offset, y(u to u+w-1));
         u := u + w;
         w := width(x.request_offset);
         y(u to u+w-1) := convert(x.request_offset, y(u to u+w-1));
      else
         w := width(x.opening_offset);
         y(u downto u-w+1) := convert(x.opening_offset, y(u downto u-w+1));
         u := u - w;
         w := width(x.request_offset);
         y(u downto u-w+1) := convert(x.request_offset, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_rd0_MON_t) return DAQ_rd0_MON_t is
      variable y : DAQ_rd0_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.opening_offset);
         y.opening_offset := convert(x(u to u+w-1), tpl.opening_offset);
         u := u + w;
         w := width(tpl.request_offset);
         y.request_offset := convert(x(u to u+w-1), tpl.request_offset);
      else
         w := width(tpl.opening_offset);
         y.opening_offset := convert(x(u downto u-w+1), tpl.opening_offset);
         u := u - w;
         w := width(tpl.request_offset);
         y.request_offset := convert(x(u downto u-w+1), tpl.request_offset);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_rd0_MON_t) return DAQ_rd0_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: DAQ_rd1_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.closing_offset);
      w := w + width(x.window_timeout);
      w := w + width(x.busy_threshold);
      return w;
   end function width;
   function convert(x: DAQ_rd1_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.closing_offset);
         y(u to u+w-1) := convert(x.closing_offset, y(u to u+w-1));
         u := u + w;
         w := width(x.window_timeout);
         y(u to u+w-1) := convert(x.window_timeout, y(u to u+w-1));
         u := u + w;
         w := width(x.busy_threshold);
         y(u to u+w-1) := convert(x.busy_threshold, y(u to u+w-1));
      else
         w := width(x.closing_offset);
         y(u downto u-w+1) := convert(x.closing_offset, y(u downto u-w+1));
         u := u - w;
         w := width(x.window_timeout);
         y(u downto u-w+1) := convert(x.window_timeout, y(u downto u-w+1));
         u := u - w;
         w := width(x.busy_threshold);
         y(u downto u-w+1) := convert(x.busy_threshold, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_rd1_MON_t) return DAQ_rd1_MON_t is
      variable y : DAQ_rd1_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.closing_offset);
         y.closing_offset := convert(x(u to u+w-1), tpl.closing_offset);
         u := u + w;
         w := width(tpl.window_timeout);
         y.window_timeout := convert(x(u to u+w-1), tpl.window_timeout);
         u := u + w;
         w := width(tpl.busy_threshold);
         y.busy_threshold := convert(x(u to u+w-1), tpl.busy_threshold);
      else
         w := width(tpl.closing_offset);
         y.closing_offset := convert(x(u downto u-w+1), tpl.closing_offset);
         u := u - w;
         w := width(tpl.window_timeout);
         y.window_timeout := convert(x(u downto u-w+1), tpl.window_timeout);
         u := u - w;
         w := width(tpl.busy_threshold);
         y.busy_threshold := convert(x(u downto u-w+1), tpl.busy_threshold);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_rd1_MON_t) return DAQ_rd1_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: DAQ_status_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.busy);
      return w;
   end function width;
   function convert(x: DAQ_status_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.busy);
         y(u to u+w-1) := convert(x.busy, y(u to u+w-1));
      else
         w := width(x.busy);
         y(u downto u-w+1) := convert(x.busy, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_status_MON_t) return DAQ_status_MON_t is
      variable y : DAQ_status_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.busy);
         y.busy := convert(x(u to u+w-1), tpl.busy);
      else
         w := width(tpl.busy);
         y.busy := convert(x(u downto u-w+1), tpl.busy);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_status_MON_t) return DAQ_status_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: DAQ_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd0);
      w := w + width(x.rd1);
      w := w + width(x.status);
      return w;
   end function width;
   function convert(x: DAQ_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd0);
         y(u to u+w-1) := convert(x.rd0, y(u to u+w-1));
         u := u + w;
         w := width(x.rd1);
         y(u to u+w-1) := convert(x.rd1, y(u to u+w-1));
         u := u + w;
         w := width(x.status);
         y(u to u+w-1) := convert(x.status, y(u to u+w-1));
      else
         w := width(x.rd0);
         y(u downto u-w+1) := convert(x.rd0, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd1);
         y(u downto u-w+1) := convert(x.rd1, y(u downto u-w+1));
         u := u - w;
         w := width(x.status);
         y(u downto u-w+1) := convert(x.status, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_MON_t) return DAQ_MON_t is
      variable y : DAQ_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd0);
         y.rd0 := convert(x(u to u+w-1), tpl.rd0);
         u := u + w;
         w := width(tpl.rd1);
         y.rd1 := convert(x(u to u+w-1), tpl.rd1);
         u := u + w;
         w := width(tpl.status);
         y.status := convert(x(u to u+w-1), tpl.status);
      else
         w := width(tpl.rd0);
         y.rd0 := convert(x(u downto u-w+1), tpl.rd0);
         u := u - w;
         w := width(tpl.rd1);
         y.rd1 := convert(x(u downto u-w+1), tpl.rd1);
         u := u - w;
         w := width(tpl.status);
         y.status := convert(x(u downto u-w+1), tpl.status);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_MON_t) return DAQ_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: DAQ_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.action);
      w := w + width(x.wr0);
      w := w + width(x.wr1);
      return w;
   end function width;
   function convert(x: DAQ_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.action);
         y(u to u+w-1) := convert(x.action, y(u to u+w-1));
         u := u + w;
         w := width(x.wr0);
         y(u to u+w-1) := convert(x.wr0, y(u to u+w-1));
         u := u + w;
         w := width(x.wr1);
         y(u to u+w-1) := convert(x.wr1, y(u to u+w-1));
      else
         w := width(x.action);
         y(u downto u-w+1) := convert(x.action, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr0);
         y(u downto u-w+1) := convert(x.wr0, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr1);
         y(u downto u-w+1) := convert(x.wr1, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: DAQ_CTRL_t) return DAQ_CTRL_t is
      variable y : DAQ_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.action);
         y.action := convert(x(u to u+w-1), tpl.action);
         u := u + w;
         w := width(tpl.wr0);
         y.wr0 := convert(x(u to u+w-1), tpl.wr0);
         u := u + w;
         w := width(tpl.wr1);
         y.wr1 := convert(x(u to u+w-1), tpl.wr1);
      else
         w := width(tpl.action);
         y.action := convert(x(u downto u-w+1), tpl.action);
         u := u - w;
         w := width(tpl.wr0);
         y.wr0 := convert(x(u downto u-w+1), tpl.wr0);
         u := u - w;
         w := width(tpl.wr1);
         y.wr1 := convert(x(u downto u-w+1), tpl.wr1);
      end if;
      return y;
   end function convert;
   function zero(tpl: DAQ_CTRL_t) return DAQ_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

end package body DAQ_CTRL;
