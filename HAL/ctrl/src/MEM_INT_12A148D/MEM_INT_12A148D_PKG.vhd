-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;

use shared_lib.common_ieee.all;

package MEM_INT_12A148D_CTRL is

  type MEM_INT_12A148D_wr_data_CTRL_t is record
    wr_data_0 : std_logic_vector(32-1 downto 0);
    wr_data_1 : std_logic_vector(32-1 downto 0);
    wr_data_2 : std_logic_vector(32-1 downto 0);
    wr_data_3 : std_logic_vector(32-1 downto 0);
    wr_data_4 : std_logic_vector(20-1 downto 0);
  end record MEM_INT_12A148D_wr_data_CTRL_t;
  function len(x: MEM_INT_12A148D_wr_data_CTRL_t) return natural;
  function vectorify(x: MEM_INT_12A148D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t;
  function nullify(t: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t;

  type MEM_INT_12A148D_rd_data_MON_t is record
    rd_data_0 : std_logic_vector(32-1 downto 0);
    rd_data_1 : std_logic_vector(32-1 downto 0);
    rd_data_2 : std_logic_vector(32-1 downto 0);
    rd_data_3 : std_logic_vector(32-1 downto 0);
    rd_data_4 : std_logic_vector(20-1 downto 0);
  end record MEM_INT_12A148D_rd_data_MON_t;
  function len(x: MEM_INT_12A148D_rd_data_MON_t) return natural;
  function vectorify(x: MEM_INT_12A148D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t;
  function nullify(t: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t;

  type MEM_INT_12A148D_MON_t is record
    rd_rdy : std_logic;
    rd_data : MEM_INT_12A148D_rd_data_MON_t;
  end record MEM_INT_12A148D_MON_t;
  function len(x: MEM_INT_12A148D_MON_t) return natural;
  function vectorify(x: MEM_INT_12A148D_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t;
  function nullify(t: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t;

  type MEM_INT_12A148D_CTRL_t is record
    wr_req : std_logic;
    wr_ack : std_logic;
    rd_req : std_logic;
    rd_ack : std_logic;
    flush_req : std_logic;
    wr_addr : std_logic_vector(12-1 downto 0);
    rd_addr : std_logic_vector(12-1 downto 0);
    wr_data : MEM_INT_12A148D_wr_data_CTRL_t;
  end record MEM_INT_12A148D_CTRL_t;
  function len(x: MEM_INT_12A148D_CTRL_t) return natural;
  function vectorify(x: MEM_INT_12A148D_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t;
  function nullify(t: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t;

end package MEM_INT_12A148D_CTRL;

------------------------------------------------------------

package body MEM_INT_12A148D_CTRL is

  function len(x: MEM_INT_12A148D_wr_data_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.wr_data_0);
    l := l + len(x.wr_data_1);
    l := l + len(x.wr_data_2);
    l := l + len(x.wr_data_3);
    l := l + len(x.wr_data_4);
    return l;
  end function len;
  function vectorify(x: MEM_INT_12A148D_wr_data_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.wr_data_0)-1), vectorify(x.wr_data_0, y(left to left+len(x.wr_data_0)-1)));
      left := left + len(x.wr_data_0);
      assign(y(left to left+len(x.wr_data_1)-1), vectorify(x.wr_data_1, y(left to left+len(x.wr_data_1)-1)));
      left := left + len(x.wr_data_1);
      assign(y(left to left+len(x.wr_data_2)-1), vectorify(x.wr_data_2, y(left to left+len(x.wr_data_2)-1)));
      left := left + len(x.wr_data_2);
      assign(y(left to left+len(x.wr_data_3)-1), vectorify(x.wr_data_3, y(left to left+len(x.wr_data_3)-1)));
      left := left + len(x.wr_data_3);
      assign(y(left to left+len(x.wr_data_4)-1), vectorify(x.wr_data_4, y(left to left+len(x.wr_data_4)-1)));
    else
      assign(y(left downto left-len(x.wr_data_0)+1), vectorify(x.wr_data_0, y(left downto left-len(x.wr_data_0)+1)));
      left := left - len(x.wr_data_0);
      assign(y(left downto left-len(x.wr_data_1)+1), vectorify(x.wr_data_1, y(left downto left-len(x.wr_data_1)+1)));
      left := left - len(x.wr_data_1);
      assign(y(left downto left-len(x.wr_data_2)+1), vectorify(x.wr_data_2, y(left downto left-len(x.wr_data_2)+1)));
      left := left - len(x.wr_data_2);
      assign(y(left downto left-len(x.wr_data_3)+1), vectorify(x.wr_data_3, y(left downto left-len(x.wr_data_3)+1)));
      left := left - len(x.wr_data_3);
      assign(y(left downto left-len(x.wr_data_4)+1), vectorify(x.wr_data_4, y(left downto left-len(x.wr_data_4)+1)));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t is
    variable y: MEM_INT_12A148D_wr_data_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.wr_data_0 := structify(x(left to left+len(y.wr_data_0)-1), y.wr_data_0);
      left := left + len(y.wr_data_0);
      y.wr_data_1 := structify(x(left to left+len(y.wr_data_1)-1), y.wr_data_1);
      left := left + len(y.wr_data_1);
      y.wr_data_2 := structify(x(left to left+len(y.wr_data_2)-1), y.wr_data_2);
      left := left + len(y.wr_data_2);
      y.wr_data_3 := structify(x(left to left+len(y.wr_data_3)-1), y.wr_data_3);
      left := left + len(y.wr_data_3);
      y.wr_data_4 := structify(x(left to left+len(y.wr_data_4)-1), y.wr_data_4);
    else
      y.wr_data_0 := structify(x(left downto left-len(y.wr_data_0)+1), y.wr_data_0);
      left := left - len(y.wr_data_0);
      y.wr_data_1 := structify(x(left downto left-len(y.wr_data_1)+1), y.wr_data_1);
      left := left - len(y.wr_data_1);
      y.wr_data_2 := structify(x(left downto left-len(y.wr_data_2)+1), y.wr_data_2);
      left := left - len(y.wr_data_2);
      y.wr_data_3 := structify(x(left downto left-len(y.wr_data_3)+1), y.wr_data_3);
      left := left - len(y.wr_data_3);
      y.wr_data_4 := structify(x(left downto left-len(y.wr_data_4)+1), y.wr_data_4);
    end if;
    return y;
  end function structify;
  function nullify(t: MEM_INT_12A148D_wr_data_CTRL_t) return MEM_INT_12A148D_wr_data_CTRL_t is
  variable y: MEM_INT_12A148D_wr_data_CTRL_t;
  begin
    y.wr_data_0 := nullify(t.wr_data_0);
    y.wr_data_1 := nullify(t.wr_data_1);
    y.wr_data_2 := nullify(t.wr_data_2);
    y.wr_data_3 := nullify(t.wr_data_3);
    y.wr_data_4 := nullify(t.wr_data_4);
    return y;
  end function nullify;

  function len(x: MEM_INT_12A148D_rd_data_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.rd_data_0);
    l := l + len(x.rd_data_1);
    l := l + len(x.rd_data_2);
    l := l + len(x.rd_data_3);
    l := l + len(x.rd_data_4);
    return l;
  end function len;
  function vectorify(x: MEM_INT_12A148D_rd_data_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.rd_data_0)-1), vectorify(x.rd_data_0, y(left to left+len(x.rd_data_0)-1)));
      left := left + len(x.rd_data_0);
      assign(y(left to left+len(x.rd_data_1)-1), vectorify(x.rd_data_1, y(left to left+len(x.rd_data_1)-1)));
      left := left + len(x.rd_data_1);
      assign(y(left to left+len(x.rd_data_2)-1), vectorify(x.rd_data_2, y(left to left+len(x.rd_data_2)-1)));
      left := left + len(x.rd_data_2);
      assign(y(left to left+len(x.rd_data_3)-1), vectorify(x.rd_data_3, y(left to left+len(x.rd_data_3)-1)));
      left := left + len(x.rd_data_3);
      assign(y(left to left+len(x.rd_data_4)-1), vectorify(x.rd_data_4, y(left to left+len(x.rd_data_4)-1)));
    else
      assign(y(left downto left-len(x.rd_data_0)+1), vectorify(x.rd_data_0, y(left downto left-len(x.rd_data_0)+1)));
      left := left - len(x.rd_data_0);
      assign(y(left downto left-len(x.rd_data_1)+1), vectorify(x.rd_data_1, y(left downto left-len(x.rd_data_1)+1)));
      left := left - len(x.rd_data_1);
      assign(y(left downto left-len(x.rd_data_2)+1), vectorify(x.rd_data_2, y(left downto left-len(x.rd_data_2)+1)));
      left := left - len(x.rd_data_2);
      assign(y(left downto left-len(x.rd_data_3)+1), vectorify(x.rd_data_3, y(left downto left-len(x.rd_data_3)+1)));
      left := left - len(x.rd_data_3);
      assign(y(left downto left-len(x.rd_data_4)+1), vectorify(x.rd_data_4, y(left downto left-len(x.rd_data_4)+1)));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t is
    variable y: MEM_INT_12A148D_rd_data_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.rd_data_0 := structify(x(left to left+len(y.rd_data_0)-1), y.rd_data_0);
      left := left + len(y.rd_data_0);
      y.rd_data_1 := structify(x(left to left+len(y.rd_data_1)-1), y.rd_data_1);
      left := left + len(y.rd_data_1);
      y.rd_data_2 := structify(x(left to left+len(y.rd_data_2)-1), y.rd_data_2);
      left := left + len(y.rd_data_2);
      y.rd_data_3 := structify(x(left to left+len(y.rd_data_3)-1), y.rd_data_3);
      left := left + len(y.rd_data_3);
      y.rd_data_4 := structify(x(left to left+len(y.rd_data_4)-1), y.rd_data_4);
    else
      y.rd_data_0 := structify(x(left downto left-len(y.rd_data_0)+1), y.rd_data_0);
      left := left - len(y.rd_data_0);
      y.rd_data_1 := structify(x(left downto left-len(y.rd_data_1)+1), y.rd_data_1);
      left := left - len(y.rd_data_1);
      y.rd_data_2 := structify(x(left downto left-len(y.rd_data_2)+1), y.rd_data_2);
      left := left - len(y.rd_data_2);
      y.rd_data_3 := structify(x(left downto left-len(y.rd_data_3)+1), y.rd_data_3);
      left := left - len(y.rd_data_3);
      y.rd_data_4 := structify(x(left downto left-len(y.rd_data_4)+1), y.rd_data_4);
    end if;
    return y;
  end function structify;
  function nullify(t: MEM_INT_12A148D_rd_data_MON_t) return MEM_INT_12A148D_rd_data_MON_t is
  variable y: MEM_INT_12A148D_rd_data_MON_t;
  begin
    y.rd_data_0 := nullify(t.rd_data_0);
    y.rd_data_1 := nullify(t.rd_data_1);
    y.rd_data_2 := nullify(t.rd_data_2);
    y.rd_data_3 := nullify(t.rd_data_3);
    y.rd_data_4 := nullify(t.rd_data_4);
    return y;
  end function nullify;

  function len(x: MEM_INT_12A148D_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.rd_rdy);
    l := l + len(x.rd_data);
    return l;
  end function len;
  function vectorify(x: MEM_INT_12A148D_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.rd_rdy)-1), vectorify(x.rd_rdy, y(left to left+len(x.rd_rdy)-1)));
      left := left + len(x.rd_rdy);
      assign(y(left to left+len(x.rd_data)-1), vectorify(x.rd_data, y(left to left+len(x.rd_data)-1)));
    else
      assign(y(left downto left-len(x.rd_rdy)+1), vectorify(x.rd_rdy, y(left downto left-len(x.rd_rdy)+1)));
      left := left - len(x.rd_rdy);
      assign(y(left downto left-len(x.rd_data)+1), vectorify(x.rd_data, y(left downto left-len(x.rd_data)+1)));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t is
    variable y: MEM_INT_12A148D_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.rd_rdy := structify(x(left to left+len(y.rd_rdy)-1), y.rd_rdy);
      left := left + len(y.rd_rdy);
      y.rd_data := structify(x(left to left+len(y.rd_data)-1), y.rd_data);
    else
      y.rd_rdy := structify(x(left downto left-len(y.rd_rdy)+1), y.rd_rdy);
      left := left - len(y.rd_rdy);
      y.rd_data := structify(x(left downto left-len(y.rd_data)+1), y.rd_data);
    end if;
    return y;
  end function structify;
  function nullify(t: MEM_INT_12A148D_MON_t) return MEM_INT_12A148D_MON_t is
  variable y: MEM_INT_12A148D_MON_t;
  begin
    y.rd_rdy := nullify(t.rd_rdy);
    y.rd_data := nullify(t.rd_data);
    return y;
  end function nullify;

  function len(x: MEM_INT_12A148D_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.wr_req);
    l := l + len(x.wr_ack);
    l := l + len(x.rd_req);
    l := l + len(x.rd_ack);
    l := l + len(x.flush_req);
    l := l + len(x.wr_addr);
    l := l + len(x.rd_addr);
    l := l + len(x.wr_data);
    return l;
  end function len;
  function vectorify(x: MEM_INT_12A148D_CTRL_t; t: std_logic_vector) return std_logic_vector is
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
      assign(y(left to left+len(x.wr_addr)-1), vectorify(x.wr_addr, y(left to left+len(x.wr_addr)-1)));
      left := left + len(x.wr_addr);
      assign(y(left to left+len(x.rd_addr)-1), vectorify(x.rd_addr, y(left to left+len(x.rd_addr)-1)));
      left := left + len(x.rd_addr);
      assign(y(left to left+len(x.wr_data)-1), vectorify(x.wr_data, y(left to left+len(x.wr_data)-1)));
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
      assign(y(left downto left-len(x.wr_addr)+1), vectorify(x.wr_addr, y(left downto left-len(x.wr_addr)+1)));
      left := left - len(x.wr_addr);
      assign(y(left downto left-len(x.rd_addr)+1), vectorify(x.rd_addr, y(left downto left-len(x.rd_addr)+1)));
      left := left - len(x.rd_addr);
      assign(y(left downto left-len(x.wr_data)+1), vectorify(x.wr_data, y(left downto left-len(x.wr_data)+1)));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t is
    variable y: MEM_INT_12A148D_CTRL_t;
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
      y.wr_addr := structify(x(left to left+len(y.wr_addr)-1), y.wr_addr);
      left := left + len(y.wr_addr);
      y.rd_addr := structify(x(left to left+len(y.rd_addr)-1), y.rd_addr);
      left := left + len(y.rd_addr);
      y.wr_data := structify(x(left to left+len(y.wr_data)-1), y.wr_data);
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
      y.wr_addr := structify(x(left downto left-len(y.wr_addr)+1), y.wr_addr);
      left := left - len(y.wr_addr);
      y.rd_addr := structify(x(left downto left-len(y.rd_addr)+1), y.rd_addr);
      left := left - len(y.rd_addr);
      y.wr_data := structify(x(left downto left-len(y.wr_data)+1), y.wr_data);
    end if;
    return y;
  end function structify;
  function nullify(t: MEM_INT_12A148D_CTRL_t) return MEM_INT_12A148D_CTRL_t is
  variable y: MEM_INT_12A148D_CTRL_t;
  begin
    y.wr_req := nullify(t.wr_req);
    y.wr_ack := nullify(t.wr_ack);
    y.rd_req := nullify(t.rd_req);
    y.rd_ack := nullify(t.rd_ack);
    y.flush_req := nullify(t.flush_req);
    y.wr_addr := nullify(t.wr_addr);
    y.rd_addr := nullify(t.rd_addr);
    y.wr_data := nullify(t.wr_data);
    return y;
  end function nullify;

end package body MEM_INT_12A148D_CTRL;
