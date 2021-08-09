-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;

use shared_lib.common_ieee.all;

package MTC_CTRL is

  type MTC_MON_t is record
    STATUS : std_logic;
    READY : std_logic;
  end record MTC_MON_t;
  function len(x: MTC_MON_t) return natural;
  function width(x: MTC_MON_t) return natural;
  function vectorify(x: MTC_MON_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MTC_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MTC_MON_t) return MTC_MON_t;
  function convert(x: in std_logic_vector; t: MTC_MON_t) return MTC_MON_t;
  function nullify(t: MTC_MON_t) return MTC_MON_t;
  function zeroed(t: MTC_MON_t) return MTC_MON_t;

  type MTC_CTRL_t is record
    RESET : std_logic;
  end record MTC_CTRL_t;
  function len(x: MTC_CTRL_t) return natural;
  function width(x: MTC_CTRL_t) return natural;
  function vectorify(x: MTC_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function convert(x: MTC_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: MTC_CTRL_t) return MTC_CTRL_t;
  function convert(x: in std_logic_vector; t: MTC_CTRL_t) return MTC_CTRL_t;
  function nullify(t: MTC_CTRL_t) return MTC_CTRL_t;
  function zeroed(t: MTC_CTRL_t) return MTC_CTRL_t;

end package MTC_CTRL;

------------------------------------------------------------

package body MTC_CTRL is

  function len(x: MTC_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.STATUS);
    l := l + len(x.READY);
    return l;
  end function len;
  function width(x: MTC_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.STATUS);
    l := l + width(x.READY);
    return l;
  end function width;
  function vectorify(x: MTC_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.STATUS)-1), vectorify(x.STATUS, y(left to left+len(x.STATUS)-1)));
      left := left + len(x.STATUS);
      assign(y(left to left+len(x.READY)-1), vectorify(x.READY, y(left to left+len(x.READY)-1)));
    else
      assign(y(left downto left-len(x.STATUS)+1), vectorify(x.STATUS, y(left downto left-len(x.STATUS)+1)));
      left := left - len(x.STATUS);
      assign(y(left downto left-len(x.READY)+1), vectorify(x.READY, y(left downto left-len(x.READY)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MTC_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.STATUS)-1), convert(x.STATUS, y(left to left+len(x.STATUS)-1)));
      left := left + len(x.STATUS);
      assign(y(left to left+len(x.READY)-1), convert(x.READY, y(left to left+len(x.READY)-1)));
    else
      assign(y(left downto left-len(x.STATUS)+1), convert(x.STATUS, y(left downto left-len(x.STATUS)+1)));
      left := left - len(x.STATUS);
      assign(y(left downto left-len(x.READY)+1), convert(x.READY, y(left downto left-len(x.READY)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MTC_MON_t) return MTC_MON_t is
    variable y: MTC_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.STATUS := structify(x(left to left+len(y.STATUS)-1), y.STATUS);
      left := left + len(y.STATUS);
      y.READY := structify(x(left to left+len(y.READY)-1), y.READY);
    else
      y.STATUS := structify(x(left downto left-len(y.STATUS)+1), y.STATUS);
      left := left - len(y.STATUS);
      y.READY := structify(x(left downto left-len(y.READY)+1), y.READY);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MTC_MON_t) return MTC_MON_t is
    variable y: MTC_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.STATUS := convert(x(left to left+len(y.STATUS)-1), y.STATUS);
      left := left + len(y.STATUS);
      y.READY := convert(x(left to left+len(y.READY)-1), y.READY);
    else
      y.STATUS := convert(x(left downto left-len(y.STATUS)+1), y.STATUS);
      left := left - len(y.STATUS);
      y.READY := convert(x(left downto left-len(y.READY)+1), y.READY);
    end if;
    return y;
  end function convert;
  function nullify(t: MTC_MON_t) return MTC_MON_t is
  variable y: MTC_MON_t;
  begin
    y.STATUS := nullify(t.STATUS);
    y.READY := nullify(t.READY);
    return y;
  end function nullify;
  function zeroed(t: MTC_MON_t) return MTC_MON_t is
  variable y: MTC_MON_t;
  begin
    y.STATUS := zeroed(t.STATUS);
    y.READY := zeroed(t.READY);
    return y;
  end function zeroed;

  function len(x: MTC_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.RESET);
    return l;
  end function len;
  function width(x: MTC_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.RESET);
    return l;
  end function width;
  function vectorify(x: MTC_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.RESET)-1), vectorify(x.RESET, y(left to left+len(x.RESET)-1)));
    else
      assign(y(left downto left-len(x.RESET)+1), vectorify(x.RESET, y(left downto left-len(x.RESET)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: MTC_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.RESET)-1), convert(x.RESET, y(left to left+len(x.RESET)-1)));
    else
      assign(y(left downto left-len(x.RESET)+1), convert(x.RESET, y(left downto left-len(x.RESET)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: MTC_CTRL_t) return MTC_CTRL_t is
    variable y: MTC_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.RESET := structify(x(left to left+len(y.RESET)-1), y.RESET);
    else
      y.RESET := structify(x(left downto left-len(y.RESET)+1), y.RESET);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: MTC_CTRL_t) return MTC_CTRL_t is
    variable y: MTC_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.RESET := convert(x(left to left+len(y.RESET)-1), y.RESET);
    else
      y.RESET := convert(x(left downto left-len(y.RESET)+1), y.RESET);
    end if;
    return y;
  end function convert;
  function nullify(t: MTC_CTRL_t) return MTC_CTRL_t is
  variable y: MTC_CTRL_t;
  begin
    y.RESET := nullify(t.RESET);
    return y;
  end function nullify;
  function zeroed(t: MTC_CTRL_t) return MTC_CTRL_t is
  variable y: MTC_CTRL_t;
  begin
    y.RESET := zeroed(t.RESET);
    return y;
  end function zeroed;

end package body MTC_CTRL;
