-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl
-- 2022-03-23 15:04:44

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package MEM_INT_12A148D_CTRL is

   -- Custom types and functions --

   type MEM_INT_12A148D_SIGNALS_MON_t is record
      rd_rdy : std_logic;
      freeze_ena : std_logic;
   end record MEM_INT_12A148D_SIGNALS_MON_t;
   attribute w of MEM_INT_12A148D_SIGNALS_MON_t : type is 2;
   function width(x: MEM_INT_12A148D_SIGNALS_MON_t) return natural;
   function convert(x: MEM_INT_12A148D_SIGNALS_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_SIGNALS_MON_t) return MEM_INT_12A148D_SIGNALS_MON_t;
   function zero(tpl: MEM_INT_12A148D_SIGNALS_MON_t) return MEM_INT_12A148D_SIGNALS_MON_t;

   type MEM_INT_12A148D_SIGNALS_CTRL_t is record
      wr_req : std_logic;
      wr_ack : std_logic;
      rd_req : std_logic;
      rd_ack : std_logic;
      flush_req : std_logic;
      freeze_req : std_logic;
      mem_sel : std_logic_vector(3 - 1 downto 0);
   end record MEM_INT_12A148D_SIGNALS_CTRL_t;
   attribute w of MEM_INT_12A148D_SIGNALS_CTRL_t : type is 9;
   function width(x: MEM_INT_12A148D_SIGNALS_CTRL_t) return natural;
   function convert(x: MEM_INT_12A148D_SIGNALS_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_SIGNALS_CTRL_t) return MEM_INT_12A148D_SIGNALS_CTRL_t;
   function zero(tpl: MEM_INT_12A148D_SIGNALS_CTRL_t) return MEM_INT_12A148D_SIGNALS_CTRL_t;

   type MEM_INT_12A148D_wr_data_CTRL_t is record
      wr_data_0 : std_logic_vector(32 - 1 downto 0);
      wr_data_1 : std_logic_vector(32 - 1 downto 0);
      wr_data_2 : std_logic_vector(32 - 1 downto 0);
      wr_data_3 : std_logic_vector(32 - 1 downto 0);
      wr_data_4 : std_logic_vector(20 - 1 downto 0);
   end record MEM_INT_12A148D_wr_data_CTRL_t;
   attribute w of MEM_INT_12A148D_wr_data_CTRL_t : type is 148;
   function width(x: MEM_INT_12A148D_wr_data_CTRL_t) return natural;
   function convert(x: MEM_INT_12A148D_wr_data_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t;
   function zero(tpl: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t;

   type MEM_INT_12A148D_rd_data_MON_t is record
      rd_data_0 : std_logic_vector(32 - 1 downto 0);
      rd_data_1 : std_logic_vector(32 - 1 downto 0);
      rd_data_2 : std_logic_vector(32 - 1 downto 0);
      rd_data_3 : std_logic_vector(32 - 1 downto 0);
      rd_data_4 : std_logic_vector(20 - 1 downto 0);
   end record MEM_INT_12A148D_rd_data_MON_t;
   attribute w of MEM_INT_12A148D_rd_data_MON_t : type is 148;
   function width(x: MEM_INT_12A148D_rd_data_MON_t) return natural;
   function convert(x: MEM_INT_12A148D_rd_data_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t;
   function zero(tpl: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t;

   type MEM_INT_12A148D_MON_t is record
      SIGNALS : MEM_INT_12A148D_SIGNALS_MON_t;
      rd_data : MEM_INT_12A148D_rd_data_MON_t;
   end record MEM_INT_12A148D_MON_t;
   attribute w of MEM_INT_12A148D_MON_t : type is 150;
   function width(x: MEM_INT_12A148D_MON_t) return natural;
   function convert(x: MEM_INT_12A148D_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t;
   function zero(tpl: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t;

   type MEM_INT_12A148D_CTRL_t is record
      SIGNALS : MEM_INT_12A148D_SIGNALS_CTRL_t;
      wr_addr : std_logic_vector(12 - 1 downto 0);
      rd_addr : std_logic_vector(12 - 1 downto 0);
      wr_data : MEM_INT_12A148D_wr_data_CTRL_t;
   end record MEM_INT_12A148D_CTRL_t;
   attribute w of MEM_INT_12A148D_CTRL_t : type is 181;
   function width(x: MEM_INT_12A148D_CTRL_t) return natural;
   function convert(x: MEM_INT_12A148D_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t;
   function zero(tpl: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t;

end package MEM_INT_12A148D_CTRL;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package body MEM_INT_12A148D_CTRL is

   -- Custom types and functions --

   function width(x: MEM_INT_12A148D_SIGNALS_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_rdy);
      w := w + width(x.freeze_ena);
      return w;
   end function width;
   function convert(x: MEM_INT_12A148D_SIGNALS_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_rdy);
         y(u to u+w-1) := convert(x.rd_rdy, y(u to u+w-1));
         u := u + w;
         w := width(x.freeze_ena);
         y(u to u+w-1) := convert(x.freeze_ena, y(u to u+w-1));
      else
         w := width(x.rd_rdy);
         y(u downto u-w+1) := convert(x.rd_rdy, y(u downto u-w+1));
         u := u - w;
         w := width(x.freeze_ena);
         y(u downto u-w+1) := convert(x.freeze_ena, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_SIGNALS_MON_t) return MEM_INT_12A148D_SIGNALS_MON_t is
      variable y : MEM_INT_12A148D_SIGNALS_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_rdy);
         y.rd_rdy := convert(x(u to u+w-1), tpl.rd_rdy);
         u := u + w;
         w := width(tpl.freeze_ena);
         y.freeze_ena := convert(x(u to u+w-1), tpl.freeze_ena);
      else
         w := width(tpl.rd_rdy);
         y.rd_rdy := convert(x(u downto u-w+1), tpl.rd_rdy);
         u := u - w;
         w := width(tpl.freeze_ena);
         y.freeze_ena := convert(x(u downto u-w+1), tpl.freeze_ena);
      end if;
      return y;
   end function convert;
   function zero(tpl: MEM_INT_12A148D_SIGNALS_MON_t) return MEM_INT_12A148D_SIGNALS_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: MEM_INT_12A148D_SIGNALS_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.wr_req);
      w := w + width(x.wr_ack);
      w := w + width(x.rd_req);
      w := w + width(x.rd_ack);
      w := w + width(x.flush_req);
      w := w + width(x.freeze_req);
      w := w + width(x.mem_sel);
      return w;
   end function width;
   function convert(x: MEM_INT_12A148D_SIGNALS_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.wr_req);
         y(u to u+w-1) := convert(x.wr_req, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_ack);
         y(u to u+w-1) := convert(x.wr_ack, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_req);
         y(u to u+w-1) := convert(x.rd_req, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_ack);
         y(u to u+w-1) := convert(x.rd_ack, y(u to u+w-1));
         u := u + w;
         w := width(x.flush_req);
         y(u to u+w-1) := convert(x.flush_req, y(u to u+w-1));
         u := u + w;
         w := width(x.freeze_req);
         y(u to u+w-1) := convert(x.freeze_req, y(u to u+w-1));
         u := u + w;
         w := width(x.mem_sel);
         y(u to u+w-1) := convert(x.mem_sel, y(u to u+w-1));
      else
         w := width(x.wr_req);
         y(u downto u-w+1) := convert(x.wr_req, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_ack);
         y(u downto u-w+1) := convert(x.wr_ack, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_req);
         y(u downto u-w+1) := convert(x.rd_req, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_ack);
         y(u downto u-w+1) := convert(x.rd_ack, y(u downto u-w+1));
         u := u - w;
         w := width(x.flush_req);
         y(u downto u-w+1) := convert(x.flush_req, y(u downto u-w+1));
         u := u - w;
         w := width(x.freeze_req);
         y(u downto u-w+1) := convert(x.freeze_req, y(u downto u-w+1));
         u := u - w;
         w := width(x.mem_sel);
         y(u downto u-w+1) := convert(x.mem_sel, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_SIGNALS_CTRL_t) return MEM_INT_12A148D_SIGNALS_CTRL_t is
      variable y : MEM_INT_12A148D_SIGNALS_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.wr_req);
         y.wr_req := convert(x(u to u+w-1), tpl.wr_req);
         u := u + w;
         w := width(tpl.wr_ack);
         y.wr_ack := convert(x(u to u+w-1), tpl.wr_ack);
         u := u + w;
         w := width(tpl.rd_req);
         y.rd_req := convert(x(u to u+w-1), tpl.rd_req);
         u := u + w;
         w := width(tpl.rd_ack);
         y.rd_ack := convert(x(u to u+w-1), tpl.rd_ack);
         u := u + w;
         w := width(tpl.flush_req);
         y.flush_req := convert(x(u to u+w-1), tpl.flush_req);
         u := u + w;
         w := width(tpl.freeze_req);
         y.freeze_req := convert(x(u to u+w-1), tpl.freeze_req);
         u := u + w;
         w := width(tpl.mem_sel);
         y.mem_sel := convert(x(u to u+w-1), tpl.mem_sel);
      else
         w := width(tpl.wr_req);
         y.wr_req := convert(x(u downto u-w+1), tpl.wr_req);
         u := u - w;
         w := width(tpl.wr_ack);
         y.wr_ack := convert(x(u downto u-w+1), tpl.wr_ack);
         u := u - w;
         w := width(tpl.rd_req);
         y.rd_req := convert(x(u downto u-w+1), tpl.rd_req);
         u := u - w;
         w := width(tpl.rd_ack);
         y.rd_ack := convert(x(u downto u-w+1), tpl.rd_ack);
         u := u - w;
         w := width(tpl.flush_req);
         y.flush_req := convert(x(u downto u-w+1), tpl.flush_req);
         u := u - w;
         w := width(tpl.freeze_req);
         y.freeze_req := convert(x(u downto u-w+1), tpl.freeze_req);
         u := u - w;
         w := width(tpl.mem_sel);
         y.mem_sel := convert(x(u downto u-w+1), tpl.mem_sel);
      end if;
      return y;
   end function convert;
   function zero(tpl: MEM_INT_12A148D_SIGNALS_CTRL_t) return MEM_INT_12A148D_SIGNALS_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: MEM_INT_12A148D_wr_data_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.wr_data_0);
      w := w + width(x.wr_data_1);
      w := w + width(x.wr_data_2);
      w := w + width(x.wr_data_3);
      w := w + width(x.wr_data_4);
      return w;
   end function width;
   function convert(x: MEM_INT_12A148D_wr_data_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.wr_data_0);
         y(u to u+w-1) := convert(x.wr_data_0, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data_1);
         y(u to u+w-1) := convert(x.wr_data_1, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data_2);
         y(u to u+w-1) := convert(x.wr_data_2, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data_3);
         y(u to u+w-1) := convert(x.wr_data_3, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data_4);
         y(u to u+w-1) := convert(x.wr_data_4, y(u to u+w-1));
      else
         w := width(x.wr_data_0);
         y(u downto u-w+1) := convert(x.wr_data_0, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data_1);
         y(u downto u-w+1) := convert(x.wr_data_1, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data_2);
         y(u downto u-w+1) := convert(x.wr_data_2, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data_3);
         y(u downto u-w+1) := convert(x.wr_data_3, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data_4);
         y(u downto u-w+1) := convert(x.wr_data_4, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t is
      variable y : MEM_INT_12A148D_wr_data_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.wr_data_0);
         y.wr_data_0 := convert(x(u to u+w-1), tpl.wr_data_0);
         u := u + w;
         w := width(tpl.wr_data_1);
         y.wr_data_1 := convert(x(u to u+w-1), tpl.wr_data_1);
         u := u + w;
         w := width(tpl.wr_data_2);
         y.wr_data_2 := convert(x(u to u+w-1), tpl.wr_data_2);
         u := u + w;
         w := width(tpl.wr_data_3);
         y.wr_data_3 := convert(x(u to u+w-1), tpl.wr_data_3);
         u := u + w;
         w := width(tpl.wr_data_4);
         y.wr_data_4 := convert(x(u to u+w-1), tpl.wr_data_4);
      else
         w := width(tpl.wr_data_0);
         y.wr_data_0 := convert(x(u downto u-w+1), tpl.wr_data_0);
         u := u - w;
         w := width(tpl.wr_data_1);
         y.wr_data_1 := convert(x(u downto u-w+1), tpl.wr_data_1);
         u := u - w;
         w := width(tpl.wr_data_2);
         y.wr_data_2 := convert(x(u downto u-w+1), tpl.wr_data_2);
         u := u - w;
         w := width(tpl.wr_data_3);
         y.wr_data_3 := convert(x(u downto u-w+1), tpl.wr_data_3);
         u := u - w;
         w := width(tpl.wr_data_4);
         y.wr_data_4 := convert(x(u downto u-w+1), tpl.wr_data_4);
      end if;
      return y;
   end function convert;
   function zero(tpl: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: MEM_INT_12A148D_rd_data_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data_0);
      w := w + width(x.rd_data_1);
      w := w + width(x.rd_data_2);
      w := w + width(x.rd_data_3);
      w := w + width(x.rd_data_4);
      return w;
   end function width;
   function convert(x: MEM_INT_12A148D_rd_data_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data_0);
         y(u to u+w-1) := convert(x.rd_data_0, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_1);
         y(u to u+w-1) := convert(x.rd_data_1, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_2);
         y(u to u+w-1) := convert(x.rd_data_2, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_3);
         y(u to u+w-1) := convert(x.rd_data_3, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_4);
         y(u to u+w-1) := convert(x.rd_data_4, y(u to u+w-1));
      else
         w := width(x.rd_data_0);
         y(u downto u-w+1) := convert(x.rd_data_0, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_1);
         y(u downto u-w+1) := convert(x.rd_data_1, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_2);
         y(u downto u-w+1) := convert(x.rd_data_2, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_3);
         y(u downto u-w+1) := convert(x.rd_data_3, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_4);
         y(u downto u-w+1) := convert(x.rd_data_4, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t is
      variable y : MEM_INT_12A148D_rd_data_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data_0);
         y.rd_data_0 := convert(x(u to u+w-1), tpl.rd_data_0);
         u := u + w;
         w := width(tpl.rd_data_1);
         y.rd_data_1 := convert(x(u to u+w-1), tpl.rd_data_1);
         u := u + w;
         w := width(tpl.rd_data_2);
         y.rd_data_2 := convert(x(u to u+w-1), tpl.rd_data_2);
         u := u + w;
         w := width(tpl.rd_data_3);
         y.rd_data_3 := convert(x(u to u+w-1), tpl.rd_data_3);
         u := u + w;
         w := width(tpl.rd_data_4);
         y.rd_data_4 := convert(x(u to u+w-1), tpl.rd_data_4);
      else
         w := width(tpl.rd_data_0);
         y.rd_data_0 := convert(x(u downto u-w+1), tpl.rd_data_0);
         u := u - w;
         w := width(tpl.rd_data_1);
         y.rd_data_1 := convert(x(u downto u-w+1), tpl.rd_data_1);
         u := u - w;
         w := width(tpl.rd_data_2);
         y.rd_data_2 := convert(x(u downto u-w+1), tpl.rd_data_2);
         u := u - w;
         w := width(tpl.rd_data_3);
         y.rd_data_3 := convert(x(u downto u-w+1), tpl.rd_data_3);
         u := u - w;
         w := width(tpl.rd_data_4);
         y.rd_data_4 := convert(x(u downto u-w+1), tpl.rd_data_4);
      end if;
      return y;
   end function convert;
   function zero(tpl: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: MEM_INT_12A148D_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SIGNALS);
      w := w + width(x.rd_data);
      return w;
   end function width;
   function convert(x: MEM_INT_12A148D_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SIGNALS);
         y(u to u+w-1) := convert(x.SIGNALS, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
      else
         w := width(x.SIGNALS);
         y(u downto u-w+1) := convert(x.SIGNALS, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t is
      variable y : MEM_INT_12A148D_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SIGNALS);
         y.SIGNALS := convert(x(u to u+w-1), tpl.SIGNALS);
         u := u + w;
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
      else
         w := width(tpl.SIGNALS);
         y.SIGNALS := convert(x(u downto u-w+1), tpl.SIGNALS);
         u := u - w;
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: MEM_INT_12A148D_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SIGNALS);
      w := w + width(x.wr_addr);
      w := w + width(x.rd_addr);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: MEM_INT_12A148D_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SIGNALS);
         y(u to u+w-1) := convert(x.SIGNALS, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_addr);
         y(u to u+w-1) := convert(x.wr_addr, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_addr);
         y(u to u+w-1) := convert(x.rd_addr, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.SIGNALS);
         y(u downto u-w+1) := convert(x.SIGNALS, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_addr);
         y(u downto u-w+1) := convert(x.wr_addr, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_addr);
         y(u downto u-w+1) := convert(x.rd_addr, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t is
      variable y : MEM_INT_12A148D_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SIGNALS);
         y.SIGNALS := convert(x(u to u+w-1), tpl.SIGNALS);
         u := u + w;
         w := width(tpl.wr_addr);
         y.wr_addr := convert(x(u to u+w-1), tpl.wr_addr);
         u := u + w;
         w := width(tpl.rd_addr);
         y.rd_addr := convert(x(u to u+w-1), tpl.rd_addr);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.SIGNALS);
         y.SIGNALS := convert(x(u downto u-w+1), tpl.SIGNALS);
         u := u - w;
         w := width(tpl.wr_addr);
         y.wr_addr := convert(x(u downto u-w+1), tpl.wr_addr);
         u := u - w;
         w := width(tpl.rd_addr);
         y.rd_addr := convert(x(u downto u-w+1), tpl.rd_addr);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

end package body MEM_INT_12A148D_CTRL;
