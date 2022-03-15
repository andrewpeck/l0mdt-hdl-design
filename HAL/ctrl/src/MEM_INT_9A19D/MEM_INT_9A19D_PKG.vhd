-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl
-- 2022-03-15 21:00:40

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package MEM_INT_9A19D_CTRL is

   -- Custom types and functions --

   type MEM_INT_9A19D_wr_data_CTRL_t is record
      wr_data_0 : std_logic_vector(19 downto 0);
   end record MEM_INT_9A19D_wr_data_CTRL_t;
   function width(x: MEM_INT_9A19D_wr_data_CTRL_t) return natural;
   function convert(x: MEM_INT_9A19D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_wr_data_CTRL_t) return MEM_INT_9A19D_wr_data_CTRL_t;

   type MEM_INT_9A19D_rd_data_MON_t is record
      rd_data_0 : std_logic_vector(19 downto 0);
   end record MEM_INT_9A19D_rd_data_MON_t;
   function width(x: MEM_INT_9A19D_rd_data_MON_t) return natural;
   function convert(x: MEM_INT_9A19D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_rd_data_MON_t) return MEM_INT_9A19D_rd_data_MON_t;

   type MEM_INT_9A19D_MON_t is record
      rd_rdy : std_logic;
      rd_data : MEM_INT_9A19D_rd_data_MON_t;
   end record MEM_INT_9A19D_MON_t;
   function width(x: MEM_INT_9A19D_MON_t) return natural;
   function convert(x: MEM_INT_9A19D_MON_t; t: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_MON_t) return MEM_INT_9A19D_MON_t;

   type MEM_INT_9A19D_CTRL_t is record
      wr_req : std_logic;
      wr_ack : std_logic;
      rd_req : std_logic;
      rd_ack : std_logic;
      flush_req : std_logic;
      wr_addr : std_logic_vector(9 downto 0);
      rd_addr : std_logic_vector(9 downto 0);
      wr_data : MEM_INT_9A19D_wr_data_CTRL_t;
   end record MEM_INT_9A19D_CTRL_t;
   function width(x: MEM_INT_9A19D_CTRL_t) return natural;
   function convert(x: MEM_INT_9A19D_CTRL_t; t: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_CTRL_t) return MEM_INT_9A19D_CTRL_t;

end package MEM_INT_9A19D_CTRL;

------------------------------------------------------------

package body MEM_INT_9A19D_CTRL is

   -- Custom types and functions --

   function width(x: MEM_INT_9A19D_wr_data_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.wr_data_0);
      return w;
   end function width;
   function convert(x: MEM_INT_9A19D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
      variable w : integer;
      variable u : integer := t'left;
   begin
      if t'ascending then
         w := width(x.wr_data_0);
         y(u to u+w-1) := convert(x.wr_data_0, y(u to u+w-1));
      else
         w := width(x.wr_data_0);
         y(u downto u-w+1) := convert(x.wr_data_0, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_wr_data_CTRL_t) return MEM_INT_9A19D_wr_data_CTRL_t is
      variable y : MEM_INT_9A19D_wr_data_CTRL_t := t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(t.wr_data_0);
         y.wr_data_0 := convert(x(u to u+w-1), t.wr_data_0);
      else
         w := width(t.wr_data_0);
         y.wr_data_0 := convert(x(u downto u-w+1), t.wr_data_0);
      end if;
      return y;
   end function convert;

   function width(x: MEM_INT_9A19D_rd_data_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data_0);
      return w;
   end function width;
   function convert(x: MEM_INT_9A19D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
      variable w : integer;
      variable u : integer := t'left;
   begin
      if t'ascending then
         w := width(x.rd_data_0);
         y(u to u+w-1) := convert(x.rd_data_0, y(u to u+w-1));
      else
         w := width(x.rd_data_0);
         y(u downto u-w+1) := convert(x.rd_data_0, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_rd_data_MON_t) return MEM_INT_9A19D_rd_data_MON_t is
      variable y : MEM_INT_9A19D_rd_data_MON_t := t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(t.rd_data_0);
         y.rd_data_0 := convert(x(u to u+w-1), t.rd_data_0);
      else
         w := width(t.rd_data_0);
         y.rd_data_0 := convert(x(u downto u-w+1), t.rd_data_0);
      end if;
      return y;
   end function convert;

   function width(x: MEM_INT_9A19D_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_rdy);
      w := w + width(x.rd_data);
      return w;
   end function width;
   function convert(x: MEM_INT_9A19D_MON_t; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
      variable w : integer;
      variable u : integer := t'left;
   begin
      if t'ascending then
         w := width(x.rd_rdy);
         y(u to u+w-1) := convert(x.rd_rdy, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
      else
         w := width(x.rd_rdy);
         y(u downto u-w+1) := convert(x.rd_rdy, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_MON_t) return MEM_INT_9A19D_MON_t is
      variable y : MEM_INT_9A19D_MON_t := t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(t.rd_rdy);
         y.rd_rdy := convert(x(u to u+w-1), t.rd_rdy);
         u := u + w;
         w := width(t.rd_data);
         y.rd_data := convert(x(u to u+w-1), t.rd_data);
      else
         w := width(t.rd_rdy);
         y.rd_rdy := convert(x(u downto u-w+1), t.rd_rdy);
         u := u - w;
         w := width(t.rd_data);
         y.rd_data := convert(x(u downto u-w+1), t.rd_data);
      end if;
      return y;
   end function convert;

   function width(x: MEM_INT_9A19D_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.wr_req);
      w := w + width(x.wr_ack);
      w := w + width(x.rd_req);
      w := w + width(x.rd_ack);
      w := w + width(x.flush_req);
      w := w + width(x.wr_addr);
      w := w + width(x.rd_addr);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: MEM_INT_9A19D_CTRL_t; t: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(t'range);
      variable w : integer;
      variable u : integer := t'left;
   begin
      if t'ascending then
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
         w := width(x.wr_addr);
         y(u to u+w-1) := convert(x.wr_addr, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_addr);
         y(u to u+w-1) := convert(x.rd_addr, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
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
   function convert(x: std_logic_vector; t: MEM_INT_9A19D_CTRL_t) return MEM_INT_9A19D_CTRL_t is
      variable y : MEM_INT_9A19D_CTRL_t := t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(t.wr_req);
         y.wr_req := convert(x(u to u+w-1), t.wr_req);
         u := u + w;
         w := width(t.wr_ack);
         y.wr_ack := convert(x(u to u+w-1), t.wr_ack);
         u := u + w;
         w := width(t.rd_req);
         y.rd_req := convert(x(u to u+w-1), t.rd_req);
         u := u + w;
         w := width(t.rd_ack);
         y.rd_ack := convert(x(u to u+w-1), t.rd_ack);
         u := u + w;
         w := width(t.flush_req);
         y.flush_req := convert(x(u to u+w-1), t.flush_req);
         u := u + w;
         w := width(t.wr_addr);
         y.wr_addr := convert(x(u to u+w-1), t.wr_addr);
         u := u + w;
         w := width(t.rd_addr);
         y.rd_addr := convert(x(u to u+w-1), t.rd_addr);
         u := u + w;
         w := width(t.wr_data);
         y.wr_data := convert(x(u to u+w-1), t.wr_data);
      else
         w := width(t.wr_req);
         y.wr_req := convert(x(u downto u-w+1), t.wr_req);
         u := u - w;
         w := width(t.wr_ack);
         y.wr_ack := convert(x(u downto u-w+1), t.wr_ack);
         u := u - w;
         w := width(t.rd_req);
         y.rd_req := convert(x(u downto u-w+1), t.rd_req);
         u := u - w;
         w := width(t.rd_ack);
         y.rd_ack := convert(x(u downto u-w+1), t.rd_ack);
         u := u - w;
         w := width(t.flush_req);
         y.flush_req := convert(x(u downto u-w+1), t.flush_req);
         u := u - w;
         w := width(t.wr_addr);
         y.wr_addr := convert(x(u downto u-w+1), t.wr_addr);
         u := u - w;
         w := width(t.rd_addr);
         y.rd_addr := convert(x(u downto u-w+1), t.rd_addr);
         u := u - w;
         w := width(t.wr_data);
         y.wr_data := convert(x(u downto u-w+1), t.wr_data);
      end if;
      return y;
   end function convert;

end package body MEM_INT_9A19D_CTRL;
