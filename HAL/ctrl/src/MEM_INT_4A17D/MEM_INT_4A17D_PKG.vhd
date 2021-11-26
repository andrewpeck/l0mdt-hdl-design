-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;

use shared_lib.common_ieee.all;

package MEM_INT_4A17D_CTRL is

  type MEM_INT_4A17D_SIGNALS_MON_t is record
    rd_rdy : std_logic;
    freeze_ena : std_logic;
  end record MEM_INT_4A17D_SIGNALS_MON_t;
  function len(x: MEM_INT_4A17D_SIGNALS_MON_t) return natural;
  function width(x: MEM_INT_4A17D_SIGNALS_MON_t) return natural;
  function vectorify(x: MEM_INT_4A17D_SIGNALS_MON_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MEM_INT_4A17D_SIGNALS_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t;
  function nullify(t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t;
  function zeroed(t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t;

  type MEM_INT_4A17D_SIGNALS_CTRL_t is record
    wr_req : std_logic;
    wr_ack : std_logic;
    rd_req : std_logic;
    rd_ack : std_logic;
    flush_req : std_logic;
    freeze_req : std_logic;
    mem_sel : std_logic_vector(3-1 downto 0);
  end record MEM_INT_4A17D_SIGNALS_CTRL_t;
  function len(x: MEM_INT_4A17D_SIGNALS_CTRL_t) return natural;
  function width(x: MEM_INT_4A17D_SIGNALS_CTRL_t) return natural;
  function vectorify(x: MEM_INT_4A17D_SIGNALS_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MEM_INT_4A17D_SIGNALS_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t;
  function nullify(t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t;
  function zeroed(t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t;

  type MEM_INT_4A17D_wr_data_CTRL_t is record
    wr_data_0 : std_logic_vector(17-1 downto 0);
  end record MEM_INT_4A17D_wr_data_CTRL_t;
  function len(x: MEM_INT_4A17D_wr_data_CTRL_t) return natural;
  function width(x: MEM_INT_4A17D_wr_data_CTRL_t) return natural;
  function vectorify(x: MEM_INT_4A17D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MEM_INT_4A17D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t;
  function nullify(t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t;
  function zeroed(t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t;

  type MEM_INT_4A17D_rd_data_MON_t is record
    rd_data_0 : std_logic_vector(17-1 downto 0);
  end record MEM_INT_4A17D_rd_data_MON_t;
  function len(x: MEM_INT_4A17D_rd_data_MON_t) return natural;
  function width(x: MEM_INT_4A17D_rd_data_MON_t) return natural;
  function vectorify(x: MEM_INT_4A17D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MEM_INT_4A17D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t;
  function nullify(t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t;
  function zeroed(t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t;

  type MEM_INT_4A17D_MON_t is record
    SIGNALS : MEM_INT_4A17D_SIGNALS_MON_t;
    rd_data : MEM_INT_4A17D_rd_data_MON_t;
  end record MEM_INT_4A17D_MON_t;
  function len(x: MEM_INT_4A17D_MON_t) return natural;
  function width(x: MEM_INT_4A17D_MON_t) return natural;
  function vectorify(x: MEM_INT_4A17D_MON_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MEM_INT_4A17D_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t;
  function nullify(t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t;
  function zeroed(t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t;

  type MEM_INT_4A17D_CTRL_t is record
    SIGNALS : MEM_INT_4A17D_SIGNALS_CTRL_t;
    wr_addr : std_logic_vector(4-1 downto 0);
    rd_addr : std_logic_vector(4-1 downto 0);
    wr_data : MEM_INT_4A17D_wr_data_CTRL_t;
  end record MEM_INT_4A17D_CTRL_t;
  function len(x: MEM_INT_4A17D_CTRL_t) return natural;
  function width(x: MEM_INT_4A17D_CTRL_t) return natural;
  function vectorify(x: MEM_INT_4A17D_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MEM_INT_4A17D_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t;
  function nullify(t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t;
  function zeroed(t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t;

end package MEM_INT_4A17D_CTRL;

------------------------------------------------------------

package body MEM_INT_4A17D_CTRL is

  function len(x: MEM_INT_4A17D_SIGNALS_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.rd_rdy);
    l := l + len(x.freeze_ena);
    return l;
  end function len;
  function width(x: MEM_INT_4A17D_SIGNALS_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.rd_rdy);
    l := l + width(x.freeze_ena);
    return l;
  end function width;
  function vectorify(x: MEM_INT_4A17D_SIGNALS_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.rd_rdy)-1), vectorify(x.rd_rdy, y(left to left+len(x.rd_rdy)-1)));
      left := left + len(x.rd_rdy);
      assign(y(left to left+len(x.freeze_ena)-1), vectorify(x.freeze_ena, y(left to left+len(x.freeze_ena)-1)));
    else
      assign(y(left downto left-len(x.rd_rdy)+1), vectorify(x.rd_rdy, y(left downto left-len(x.rd_rdy)+1)));
      left := left - len(x.rd_rdy);
      assign(y(left downto left-len(x.freeze_ena)+1), vectorify(x.freeze_ena, y(left downto left-len(x.freeze_ena)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MEM_INT_4A17D_SIGNALS_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.rd_rdy)-1), convert(x.rd_rdy, y(left to left+len(x.rd_rdy)-1)));
      left := left + len(x.rd_rdy);
      assign(y(left to left+len(x.freeze_ena)-1), convert(x.freeze_ena, y(left to left+len(x.freeze_ena)-1)));
    else
      assign(y(left downto left-len(x.rd_rdy)+1), convert(x.rd_rdy, y(left downto left-len(x.rd_rdy)+1)));
      left := left - len(x.rd_rdy);
      assign(y(left downto left-len(x.freeze_ena)+1), convert(x.freeze_ena, y(left downto left-len(x.freeze_ena)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t is
    variable y: MEM_INT_4A17D_SIGNALS_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.rd_rdy := structify(x(left to left+len(y.rd_rdy)-1), y.rd_rdy);
      left := left + len(y.rd_rdy);
      y.freeze_ena := structify(x(left to left+len(y.freeze_ena)-1), y.freeze_ena);
    else
      y.rd_rdy := structify(x(left downto left-len(y.rd_rdy)+1), y.rd_rdy);
      left := left - len(y.rd_rdy);
      y.freeze_ena := structify(x(left downto left-len(y.freeze_ena)+1), y.freeze_ena);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t is
    variable y: MEM_INT_4A17D_SIGNALS_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.rd_rdy := convert(x(left to left+len(y.rd_rdy)-1), y.rd_rdy);
      left := left + len(y.rd_rdy);
      y.freeze_ena := convert(x(left to left+len(y.freeze_ena)-1), y.freeze_ena);
    else
      y.rd_rdy := convert(x(left downto left-len(y.rd_rdy)+1), y.rd_rdy);
      left := left - len(y.rd_rdy);
      y.freeze_ena := convert(x(left downto left-len(y.freeze_ena)+1), y.freeze_ena);
    end if;
    return y;
  end function convert;
  function nullify(t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t is
  variable y: MEM_INT_4A17D_SIGNALS_MON_t;
  begin
    y.rd_rdy := nullify(t.rd_rdy);
    y.freeze_ena := nullify(t.freeze_ena);
    return y;
  end function nullify;
  function zeroed(t: MEM_INT_4A17D_SIGNALS_MON_t) return MEM_INT_4A17D_SIGNALS_MON_t is
  variable y: MEM_INT_4A17D_SIGNALS_MON_t;
  begin
    y.rd_rdy := zeroed(t.rd_rdy);
    y.freeze_ena := zeroed(t.freeze_ena);
    return y;
  end function zeroed;

  function len(x: MEM_INT_4A17D_SIGNALS_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.wr_req);
    l := l + len(x.wr_ack);
    l := l + len(x.rd_req);
    l := l + len(x.rd_ack);
    l := l + len(x.flush_req);
    l := l + len(x.freeze_req);
    l := l + len(x.mem_sel);
    return l;
  end function len;
  function width(x: MEM_INT_4A17D_SIGNALS_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.wr_req);
    l := l + width(x.wr_ack);
    l := l + width(x.rd_req);
    l := l + width(x.rd_ack);
    l := l + width(x.flush_req);
    l := l + width(x.freeze_req);
    l := l + width(x.mem_sel);
    return l;
  end function width;
  function vectorify(x: MEM_INT_4A17D_SIGNALS_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.wr_req)-1), vectorify(x.wr_req, y(left to left+len(x.wr_req)-1)));
      left := left + len(x.wr_req);
      assign(y(left to left+len(x.wr_ack)-1), vectorify(x.wr_ack, y(left to left+len(x.wr_ack)-1)));
      left := left + len(x.wr_ack);
      assign(y(left to left+len(x.rd_req)-1), vectorify(x.rd_req, y(left to left+len(x.rd_req)-1)));
      left := left + len(x.rd_req);
      assign(y(left to left+len(x.rd_ack)-1), vectorify(x.rd_ack, y(left to left+len(x.rd_ack)-1)));
      left := left + len(x.rd_ack);
      assign(y(left to left+len(x.flush_req)-1), vectorify(x.flush_req, y(left to left+len(x.flush_req)-1)));
      left := left + len(x.flush_req);
      assign(y(left to left+len(x.freeze_req)-1), vectorify(x.freeze_req, y(left to left+len(x.freeze_req)-1)));
      left := left + len(x.freeze_req);
      assign(y(left to left+len(x.mem_sel)-1), vectorify(x.mem_sel, y(left to left+len(x.mem_sel)-1)));
    else
      assign(y(left downto left-len(x.wr_req)+1), vectorify(x.wr_req, y(left downto left-len(x.wr_req)+1)));
      left := left - len(x.wr_req);
      assign(y(left downto left-len(x.wr_ack)+1), vectorify(x.wr_ack, y(left downto left-len(x.wr_ack)+1)));
      left := left - len(x.wr_ack);
      assign(y(left downto left-len(x.rd_req)+1), vectorify(x.rd_req, y(left downto left-len(x.rd_req)+1)));
      left := left - len(x.rd_req);
      assign(y(left downto left-len(x.rd_ack)+1), vectorify(x.rd_ack, y(left downto left-len(x.rd_ack)+1)));
      left := left - len(x.rd_ack);
      assign(y(left downto left-len(x.flush_req)+1), vectorify(x.flush_req, y(left downto left-len(x.flush_req)+1)));
      left := left - len(x.flush_req);
      assign(y(left downto left-len(x.freeze_req)+1), vectorify(x.freeze_req, y(left downto left-len(x.freeze_req)+1)));
      left := left - len(x.freeze_req);
      assign(y(left downto left-len(x.mem_sel)+1), vectorify(x.mem_sel, y(left downto left-len(x.mem_sel)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MEM_INT_4A17D_SIGNALS_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.wr_req)-1), convert(x.wr_req, y(left to left+len(x.wr_req)-1)));
      left := left + len(x.wr_req);
      assign(y(left to left+len(x.wr_ack)-1), convert(x.wr_ack, y(left to left+len(x.wr_ack)-1)));
      left := left + len(x.wr_ack);
      assign(y(left to left+len(x.rd_req)-1), convert(x.rd_req, y(left to left+len(x.rd_req)-1)));
      left := left + len(x.rd_req);
      assign(y(left to left+len(x.rd_ack)-1), convert(x.rd_ack, y(left to left+len(x.rd_ack)-1)));
      left := left + len(x.rd_ack);
      assign(y(left to left+len(x.flush_req)-1), convert(x.flush_req, y(left to left+len(x.flush_req)-1)));
      left := left + len(x.flush_req);
      assign(y(left to left+len(x.freeze_req)-1), convert(x.freeze_req, y(left to left+len(x.freeze_req)-1)));
      left := left + len(x.freeze_req);
      assign(y(left to left+len(x.mem_sel)-1), convert(x.mem_sel, y(left to left+len(x.mem_sel)-1)));
    else
      assign(y(left downto left-len(x.wr_req)+1), convert(x.wr_req, y(left downto left-len(x.wr_req)+1)));
      left := left - len(x.wr_req);
      assign(y(left downto left-len(x.wr_ack)+1), convert(x.wr_ack, y(left downto left-len(x.wr_ack)+1)));
      left := left - len(x.wr_ack);
      assign(y(left downto left-len(x.rd_req)+1), convert(x.rd_req, y(left downto left-len(x.rd_req)+1)));
      left := left - len(x.rd_req);
      assign(y(left downto left-len(x.rd_ack)+1), convert(x.rd_ack, y(left downto left-len(x.rd_ack)+1)));
      left := left - len(x.rd_ack);
      assign(y(left downto left-len(x.flush_req)+1), convert(x.flush_req, y(left downto left-len(x.flush_req)+1)));
      left := left - len(x.flush_req);
      assign(y(left downto left-len(x.freeze_req)+1), convert(x.freeze_req, y(left downto left-len(x.freeze_req)+1)));
      left := left - len(x.freeze_req);
      assign(y(left downto left-len(x.mem_sel)+1), convert(x.mem_sel, y(left downto left-len(x.mem_sel)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t is
    variable y: MEM_INT_4A17D_SIGNALS_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.wr_req := structify(x(left to left+len(y.wr_req)-1), y.wr_req);
      left := left + len(y.wr_req);
      y.wr_ack := structify(x(left to left+len(y.wr_ack)-1), y.wr_ack);
      left := left + len(y.wr_ack);
      y.rd_req := structify(x(left to left+len(y.rd_req)-1), y.rd_req);
      left := left + len(y.rd_req);
      y.rd_ack := structify(x(left to left+len(y.rd_ack)-1), y.rd_ack);
      left := left + len(y.rd_ack);
      y.flush_req := structify(x(left to left+len(y.flush_req)-1), y.flush_req);
      left := left + len(y.flush_req);
      y.freeze_req := structify(x(left to left+len(y.freeze_req)-1), y.freeze_req);
      left := left + len(y.freeze_req);
      y.mem_sel := structify(x(left to left+len(y.mem_sel)-1), y.mem_sel);
    else
      y.wr_req := structify(x(left downto left-len(y.wr_req)+1), y.wr_req);
      left := left - len(y.wr_req);
      y.wr_ack := structify(x(left downto left-len(y.wr_ack)+1), y.wr_ack);
      left := left - len(y.wr_ack);
      y.rd_req := structify(x(left downto left-len(y.rd_req)+1), y.rd_req);
      left := left - len(y.rd_req);
      y.rd_ack := structify(x(left downto left-len(y.rd_ack)+1), y.rd_ack);
      left := left - len(y.rd_ack);
      y.flush_req := structify(x(left downto left-len(y.flush_req)+1), y.flush_req);
      left := left - len(y.flush_req);
      y.freeze_req := structify(x(left downto left-len(y.freeze_req)+1), y.freeze_req);
      left := left - len(y.freeze_req);
      y.mem_sel := structify(x(left downto left-len(y.mem_sel)+1), y.mem_sel);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t is
    variable y: MEM_INT_4A17D_SIGNALS_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.wr_req := convert(x(left to left+len(y.wr_req)-1), y.wr_req);
      left := left + len(y.wr_req);
      y.wr_ack := convert(x(left to left+len(y.wr_ack)-1), y.wr_ack);
      left := left + len(y.wr_ack);
      y.rd_req := convert(x(left to left+len(y.rd_req)-1), y.rd_req);
      left := left + len(y.rd_req);
      y.rd_ack := convert(x(left to left+len(y.rd_ack)-1), y.rd_ack);
      left := left + len(y.rd_ack);
      y.flush_req := convert(x(left to left+len(y.flush_req)-1), y.flush_req);
      left := left + len(y.flush_req);
      y.freeze_req := convert(x(left to left+len(y.freeze_req)-1), y.freeze_req);
      left := left + len(y.freeze_req);
      y.mem_sel := convert(x(left to left+len(y.mem_sel)-1), y.mem_sel);
    else
      y.wr_req := convert(x(left downto left-len(y.wr_req)+1), y.wr_req);
      left := left - len(y.wr_req);
      y.wr_ack := convert(x(left downto left-len(y.wr_ack)+1), y.wr_ack);
      left := left - len(y.wr_ack);
      y.rd_req := convert(x(left downto left-len(y.rd_req)+1), y.rd_req);
      left := left - len(y.rd_req);
      y.rd_ack := convert(x(left downto left-len(y.rd_ack)+1), y.rd_ack);
      left := left - len(y.rd_ack);
      y.flush_req := convert(x(left downto left-len(y.flush_req)+1), y.flush_req);
      left := left - len(y.flush_req);
      y.freeze_req := convert(x(left downto left-len(y.freeze_req)+1), y.freeze_req);
      left := left - len(y.freeze_req);
      y.mem_sel := convert(x(left downto left-len(y.mem_sel)+1), y.mem_sel);
    end if;
    return y;
  end function convert;
  function nullify(t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t is
  variable y: MEM_INT_4A17D_SIGNALS_CTRL_t;
  begin
    y.wr_req := nullify(t.wr_req);
    y.wr_ack := nullify(t.wr_ack);
    y.rd_req := nullify(t.rd_req);
    y.rd_ack := nullify(t.rd_ack);
    y.flush_req := nullify(t.flush_req);
    y.freeze_req := nullify(t.freeze_req);
    y.mem_sel := nullify(t.mem_sel);
    return y;
  end function nullify;
  function zeroed(t: MEM_INT_4A17D_SIGNALS_CTRL_t) return MEM_INT_4A17D_SIGNALS_CTRL_t is
  variable y: MEM_INT_4A17D_SIGNALS_CTRL_t;
  begin
    y.wr_req := zeroed(t.wr_req);
    y.wr_ack := zeroed(t.wr_ack);
    y.rd_req := zeroed(t.rd_req);
    y.rd_ack := zeroed(t.rd_ack);
    y.flush_req := zeroed(t.flush_req);
    y.freeze_req := zeroed(t.freeze_req);
    y.mem_sel := zeroed(t.mem_sel);
    return y;
  end function zeroed;

  function len(x: MEM_INT_4A17D_wr_data_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.wr_data_0);
    return l;
  end function len;
  function width(x: MEM_INT_4A17D_wr_data_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.wr_data_0);
    return l;
  end function width;
  function vectorify(x: MEM_INT_4A17D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.wr_data_0)-1), vectorify(x.wr_data_0, y(left to left+len(x.wr_data_0)-1)));
    else
      assign(y(left downto left-len(x.wr_data_0)+1), vectorify(x.wr_data_0, y(left downto left-len(x.wr_data_0)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MEM_INT_4A17D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.wr_data_0)-1), convert(x.wr_data_0, y(left to left+len(x.wr_data_0)-1)));
    else
      assign(y(left downto left-len(x.wr_data_0)+1), convert(x.wr_data_0, y(left downto left-len(x.wr_data_0)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t is
    variable y: MEM_INT_4A17D_wr_data_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.wr_data_0 := structify(x(left to left+len(y.wr_data_0)-1), y.wr_data_0);
    else
      y.wr_data_0 := structify(x(left downto left-len(y.wr_data_0)+1), y.wr_data_0);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t is
    variable y: MEM_INT_4A17D_wr_data_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.wr_data_0 := convert(x(left to left+len(y.wr_data_0)-1), y.wr_data_0);
    else
      y.wr_data_0 := convert(x(left downto left-len(y.wr_data_0)+1), y.wr_data_0);
    end if;
    return y;
  end function convert;
  function nullify(t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t is
  variable y: MEM_INT_4A17D_wr_data_CTRL_t;
  begin
    y.wr_data_0 := nullify(t.wr_data_0);
    return y;
  end function nullify;
  function zeroed(t: MEM_INT_4A17D_wr_data_CTRL_t) return MEM_INT_4A17D_wr_data_CTRL_t is
  variable y: MEM_INT_4A17D_wr_data_CTRL_t;
  begin
    y.wr_data_0 := zeroed(t.wr_data_0);
    return y;
  end function zeroed;

  function len(x: MEM_INT_4A17D_rd_data_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.rd_data_0);
    return l;
  end function len;
  function width(x: MEM_INT_4A17D_rd_data_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.rd_data_0);
    return l;
  end function width;
  function vectorify(x: MEM_INT_4A17D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.rd_data_0)-1), vectorify(x.rd_data_0, y(left to left+len(x.rd_data_0)-1)));
    else
      assign(y(left downto left-len(x.rd_data_0)+1), vectorify(x.rd_data_0, y(left downto left-len(x.rd_data_0)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MEM_INT_4A17D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.rd_data_0)-1), convert(x.rd_data_0, y(left to left+len(x.rd_data_0)-1)));
    else
      assign(y(left downto left-len(x.rd_data_0)+1), convert(x.rd_data_0, y(left downto left-len(x.rd_data_0)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t is
    variable y: MEM_INT_4A17D_rd_data_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.rd_data_0 := structify(x(left to left+len(y.rd_data_0)-1), y.rd_data_0);
    else
      y.rd_data_0 := structify(x(left downto left-len(y.rd_data_0)+1), y.rd_data_0);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t is
    variable y: MEM_INT_4A17D_rd_data_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.rd_data_0 := convert(x(left to left+len(y.rd_data_0)-1), y.rd_data_0);
    else
      y.rd_data_0 := convert(x(left downto left-len(y.rd_data_0)+1), y.rd_data_0);
    end if;
    return y;
  end function convert;
  function nullify(t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t is
  variable y: MEM_INT_4A17D_rd_data_MON_t;
  begin
    y.rd_data_0 := nullify(t.rd_data_0);
    return y;
  end function nullify;
  function zeroed(t: MEM_INT_4A17D_rd_data_MON_t) return MEM_INT_4A17D_rd_data_MON_t is
  variable y: MEM_INT_4A17D_rd_data_MON_t;
  begin
    y.rd_data_0 := zeroed(t.rd_data_0);
    return y;
  end function zeroed;

  function len(x: MEM_INT_4A17D_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.SIGNALS);
    l := l + len(x.rd_data);
    return l;
  end function len;
  function width(x: MEM_INT_4A17D_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.SIGNALS);
    l := l + width(x.rd_data);
    return l;
  end function width;
  function vectorify(x: MEM_INT_4A17D_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.SIGNALS)-1), vectorify(x.SIGNALS, y(left to left+len(x.SIGNALS)-1)));
      left := left + len(x.SIGNALS);
      assign(y(left to left+len(x.rd_data)-1), vectorify(x.rd_data, y(left to left+len(x.rd_data)-1)));
    else
      assign(y(left downto left-len(x.SIGNALS)+1), vectorify(x.SIGNALS, y(left downto left-len(x.SIGNALS)+1)));
      left := left - len(x.SIGNALS);
      assign(y(left downto left-len(x.rd_data)+1), vectorify(x.rd_data, y(left downto left-len(x.rd_data)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MEM_INT_4A17D_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.SIGNALS)-1), convert(x.SIGNALS, y(left to left+len(x.SIGNALS)-1)));
      left := left + len(x.SIGNALS);
      assign(y(left to left+len(x.rd_data)-1), convert(x.rd_data, y(left to left+len(x.rd_data)-1)));
    else
      assign(y(left downto left-len(x.SIGNALS)+1), convert(x.SIGNALS, y(left downto left-len(x.SIGNALS)+1)));
      left := left - len(x.SIGNALS);
      assign(y(left downto left-len(x.rd_data)+1), convert(x.rd_data, y(left downto left-len(x.rd_data)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t is
    variable y: MEM_INT_4A17D_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.SIGNALS := structify(x(left to left+len(y.SIGNALS)-1), y.SIGNALS);
      left := left + len(y.SIGNALS);
      y.rd_data := structify(x(left to left+len(y.rd_data)-1), y.rd_data);
    else
      y.SIGNALS := structify(x(left downto left-len(y.SIGNALS)+1), y.SIGNALS);
      left := left - len(y.SIGNALS);
      y.rd_data := structify(x(left downto left-len(y.rd_data)+1), y.rd_data);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t is
    variable y: MEM_INT_4A17D_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.SIGNALS := convert(x(left to left+len(y.SIGNALS)-1), y.SIGNALS);
      left := left + len(y.SIGNALS);
      y.rd_data := convert(x(left to left+len(y.rd_data)-1), y.rd_data);
    else
      y.SIGNALS := convert(x(left downto left-len(y.SIGNALS)+1), y.SIGNALS);
      left := left - len(y.SIGNALS);
      y.rd_data := convert(x(left downto left-len(y.rd_data)+1), y.rd_data);
    end if;
    return y;
  end function convert;
  function nullify(t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t is
  variable y: MEM_INT_4A17D_MON_t;
  begin
    y.SIGNALS := nullify(t.SIGNALS);
    y.rd_data := nullify(t.rd_data);
    return y;
  end function nullify;
  function zeroed(t: MEM_INT_4A17D_MON_t) return MEM_INT_4A17D_MON_t is
  variable y: MEM_INT_4A17D_MON_t;
  begin
    y.SIGNALS := zeroed(t.SIGNALS);
    y.rd_data := zeroed(t.rd_data);
    return y;
  end function zeroed;

  function len(x: MEM_INT_4A17D_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.SIGNALS);
    l := l + len(x.wr_addr);
    l := l + len(x.rd_addr);
    l := l + len(x.wr_data);
    return l;
  end function len;
  function width(x: MEM_INT_4A17D_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.SIGNALS);
    l := l + width(x.wr_addr);
    l := l + width(x.rd_addr);
    l := l + width(x.wr_data);
    return l;
  end function width;
  function vectorify(x: MEM_INT_4A17D_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.SIGNALS)-1), vectorify(x.SIGNALS, y(left to left+len(x.SIGNALS)-1)));
      left := left + len(x.SIGNALS);
      assign(y(left to left+len(x.wr_addr)-1), vectorify(x.wr_addr, y(left to left+len(x.wr_addr)-1)));
      left := left + len(x.wr_addr);
      assign(y(left to left+len(x.rd_addr)-1), vectorify(x.rd_addr, y(left to left+len(x.rd_addr)-1)));
      left := left + len(x.rd_addr);
      assign(y(left to left+len(x.wr_data)-1), vectorify(x.wr_data, y(left to left+len(x.wr_data)-1)));
    else
      assign(y(left downto left-len(x.SIGNALS)+1), vectorify(x.SIGNALS, y(left downto left-len(x.SIGNALS)+1)));
      left := left - len(x.SIGNALS);
      assign(y(left downto left-len(x.wr_addr)+1), vectorify(x.wr_addr, y(left downto left-len(x.wr_addr)+1)));
      left := left - len(x.wr_addr);
      assign(y(left downto left-len(x.rd_addr)+1), vectorify(x.rd_addr, y(left downto left-len(x.rd_addr)+1)));
      left := left - len(x.rd_addr);
      assign(y(left downto left-len(x.wr_data)+1), vectorify(x.wr_data, y(left downto left-len(x.wr_data)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MEM_INT_4A17D_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.SIGNALS)-1), convert(x.SIGNALS, y(left to left+len(x.SIGNALS)-1)));
      left := left + len(x.SIGNALS);
      assign(y(left to left+len(x.wr_addr)-1), convert(x.wr_addr, y(left to left+len(x.wr_addr)-1)));
      left := left + len(x.wr_addr);
      assign(y(left to left+len(x.rd_addr)-1), convert(x.rd_addr, y(left to left+len(x.rd_addr)-1)));
      left := left + len(x.rd_addr);
      assign(y(left to left+len(x.wr_data)-1), convert(x.wr_data, y(left to left+len(x.wr_data)-1)));
    else
      assign(y(left downto left-len(x.SIGNALS)+1), convert(x.SIGNALS, y(left downto left-len(x.SIGNALS)+1)));
      left := left - len(x.SIGNALS);
      assign(y(left downto left-len(x.wr_addr)+1), convert(x.wr_addr, y(left downto left-len(x.wr_addr)+1)));
      left := left - len(x.wr_addr);
      assign(y(left downto left-len(x.rd_addr)+1), convert(x.rd_addr, y(left downto left-len(x.rd_addr)+1)));
      left := left - len(x.rd_addr);
      assign(y(left downto left-len(x.wr_data)+1), convert(x.wr_data, y(left downto left-len(x.wr_data)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t is
    variable y: MEM_INT_4A17D_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.SIGNALS := structify(x(left to left+len(y.SIGNALS)-1), y.SIGNALS);
      left := left + len(y.SIGNALS);
      y.wr_addr := structify(x(left to left+len(y.wr_addr)-1), y.wr_addr);
      left := left + len(y.wr_addr);
      y.rd_addr := structify(x(left to left+len(y.rd_addr)-1), y.rd_addr);
      left := left + len(y.rd_addr);
      y.wr_data := structify(x(left to left+len(y.wr_data)-1), y.wr_data);
    else
      y.SIGNALS := structify(x(left downto left-len(y.SIGNALS)+1), y.SIGNALS);
      left := left - len(y.SIGNALS);
      y.wr_addr := structify(x(left downto left-len(y.wr_addr)+1), y.wr_addr);
      left := left - len(y.wr_addr);
      y.rd_addr := structify(x(left downto left-len(y.rd_addr)+1), y.rd_addr);
      left := left - len(y.rd_addr);
      y.wr_data := structify(x(left downto left-len(y.wr_data)+1), y.wr_data);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t is
    variable y: MEM_INT_4A17D_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.SIGNALS := convert(x(left to left+len(y.SIGNALS)-1), y.SIGNALS);
      left := left + len(y.SIGNALS);
      y.wr_addr := convert(x(left to left+len(y.wr_addr)-1), y.wr_addr);
      left := left + len(y.wr_addr);
      y.rd_addr := convert(x(left to left+len(y.rd_addr)-1), y.rd_addr);
      left := left + len(y.rd_addr);
      y.wr_data := convert(x(left to left+len(y.wr_data)-1), y.wr_data);
    else
      y.SIGNALS := convert(x(left downto left-len(y.SIGNALS)+1), y.SIGNALS);
      left := left - len(y.SIGNALS);
      y.wr_addr := convert(x(left downto left-len(y.wr_addr)+1), y.wr_addr);
      left := left - len(y.wr_addr);
      y.rd_addr := convert(x(left downto left-len(y.rd_addr)+1), y.rd_addr);
      left := left - len(y.rd_addr);
      y.wr_data := convert(x(left downto left-len(y.wr_data)+1), y.wr_data);
    end if;
    return y;
  end function convert;
  function nullify(t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t is
  variable y: MEM_INT_4A17D_CTRL_t;
  begin
    y.SIGNALS := nullify(t.SIGNALS);
    y.wr_addr := nullify(t.wr_addr);
    y.rd_addr := nullify(t.rd_addr);
    y.wr_data := nullify(t.wr_data);
    return y;
  end function nullify;
  function zeroed(t: MEM_INT_4A17D_CTRL_t) return MEM_INT_4A17D_CTRL_t is
  variable y: MEM_INT_4A17D_CTRL_t;
  begin
    y.SIGNALS := zeroed(t.SIGNALS);
    y.wr_addr := zeroed(t.wr_addr);
    y.rd_addr := zeroed(t.rd_addr);
    y.wr_data := zeroed(t.wr_data);
    return y;
  end function zeroed;

end package body MEM_INT_4A17D_CTRL;
