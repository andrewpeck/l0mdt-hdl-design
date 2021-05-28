-- This file was auto-generated by YML2HDL toll.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;

use shared_lib.common_ieee.all;

package TAR_CTRL is

  type TAR_ACTIONS_CTRL_t is record
    RESET : std_logic;
    ENABLE : std_logic;
    DISABLE : std_logic;
    FREEZE : std_logic;
  end record TAR_ACTIONS_CTRL_t;
  function len(x: TAR_ACTIONS_CTRL_t) return natural;
  function vectorify(x: TAR_ACTIONS_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: TAR_ACTIONS_CTRL_t) return TAR_ACTIONS_CTRL_t;
  function nullify(t: TAR_ACTIONS_CTRL_t) return TAR_ACTIONS_CTRL_t;

  type TAR_CONFIGS_CTRL_t is record
    THREADS : std_logic_vector(4-1 downto 0);
    INPUT_EN : std_logic;
    OUTPUT_EN : std_logic;
    FLUSH_MEM_RESET : std_logic;
  end record TAR_CONFIGS_CTRL_t;
  function len(x: TAR_CONFIGS_CTRL_t) return natural;
  function vectorify(x: TAR_CONFIGS_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: TAR_CONFIGS_CTRL_t) return TAR_CONFIGS_CTRL_t;
  function nullify(t: TAR_CONFIGS_CTRL_t) return TAR_CONFIGS_CTRL_t;

  type TAR_STATUS_MON_t is record
    ENABLED : std_logic;
    READY : std_logic;
    ERROR : std_logic;
  end record TAR_STATUS_MON_t;
  function len(x: TAR_STATUS_MON_t) return natural;
  function vectorify(x: TAR_STATUS_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: TAR_STATUS_MON_t) return TAR_STATUS_MON_t;
  function nullify(t: TAR_STATUS_MON_t) return TAR_STATUS_MON_t;

  type TAR_MON_t is record
    STATUS : TAR_STATUS_MON_t;
  end record TAR_MON_t;
  function len(x: TAR_MON_t) return natural;
  function vectorify(x: TAR_MON_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: TAR_MON_t) return TAR_MON_t;
  function nullify(t: TAR_MON_t) return TAR_MON_t;

  type TAR_CTRL_t is record
    ACTIONS : TAR_ACTIONS_CTRL_t;
    CONFIGS : TAR_CONFIGS_CTRL_t;
  end record TAR_CTRL_t;
  function len(x: TAR_CTRL_t) return natural;
  function vectorify(x: TAR_CTRL_t; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: TAR_CTRL_t) return TAR_CTRL_t;
  function nullify(t: TAR_CTRL_t) return TAR_CTRL_t;

end package TAR_CTRL;

------------------------------------------------------------

package body TAR_CTRL is

  function len(x: TAR_ACTIONS_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.RESET);
    l := l + len(x.ENABLE);
    l := l + len(x.DISABLE);
    l := l + len(x.FREEZE);
    return l;
  end function len;
  function vectorify(x: TAR_ACTIONS_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      y(left to left+len(x.RESET)-1) := vectorify(x.RESET, y(left to left+len(x.RESET)-1));
      left := left + len(x.RESET);
      y(left to left+len(x.ENABLE)-1) := vectorify(x.ENABLE, y(left to left+len(x.ENABLE)-1));
      left := left + len(x.ENABLE);
      y(left to left+len(x.DISABLE)-1) := vectorify(x.DISABLE, y(left to left+len(x.DISABLE)-1));
      left := left + len(x.DISABLE);
      y(left to left+len(x.FREEZE)-1) := vectorify(x.FREEZE, y(left to left+len(x.FREEZE)-1));
    else
      y(left downto left-len(x.RESET)+1) := vectorify(x.RESET, y(left downto left-len(x.RESET)+1));
      left := left - len(x.RESET);
      y(left downto left-len(x.ENABLE)+1) := vectorify(x.ENABLE, y(left downto left-len(x.ENABLE)+1));
      left := left - len(x.ENABLE);
      y(left downto left-len(x.DISABLE)+1) := vectorify(x.DISABLE, y(left downto left-len(x.DISABLE)+1));
      left := left - len(x.DISABLE);
      y(left downto left-len(x.FREEZE)+1) := vectorify(x.FREEZE, y(left downto left-len(x.FREEZE)+1));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: TAR_ACTIONS_CTRL_t) return TAR_ACTIONS_CTRL_t is
    variable y: TAR_ACTIONS_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.RESET := structify(x(left to left+len(y.RESET)-1), y.RESET);
      left := left + len(y.RESET);
      y.ENABLE := structify(x(left to left+len(y.ENABLE)-1), y.ENABLE);
      left := left + len(y.ENABLE);
      y.DISABLE := structify(x(left to left+len(y.DISABLE)-1), y.DISABLE);
      left := left + len(y.DISABLE);
      y.FREEZE := structify(x(left to left+len(y.FREEZE)-1), y.FREEZE);
    else
      y.RESET := structify(x(left downto left-len(y.RESET)+1), y.RESET);
      left := left - len(y.RESET);
      y.ENABLE := structify(x(left downto left-len(y.ENABLE)+1), y.ENABLE);
      left := left - len(y.ENABLE);
      y.DISABLE := structify(x(left downto left-len(y.DISABLE)+1), y.DISABLE);
      left := left - len(y.DISABLE);
      y.FREEZE := structify(x(left downto left-len(y.FREEZE)+1), y.FREEZE);
    end if;
    return y;
  end function structify;
  function nullify(t: TAR_ACTIONS_CTRL_t) return TAR_ACTIONS_CTRL_t is
  variable y: TAR_ACTIONS_CTRL_t;
  begin
    y.RESET := nullify(t.RESET);
    y.ENABLE := nullify(t.ENABLE);
    y.DISABLE := nullify(t.DISABLE);
    y.FREEZE := nullify(t.FREEZE);
    return y;
  end function nullify;

  function len(x: TAR_CONFIGS_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.THREADS);
    l := l + len(x.INPUT_EN);
    l := l + len(x.OUTPUT_EN);
    l := l + len(x.FLUSH_MEM_RESET);
    return l;
  end function len;
  function vectorify(x: TAR_CONFIGS_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      y(left to left+len(x.THREADS)-1) := vectorify(x.THREADS, y(left to left+len(x.THREADS)-1));
      left := left + len(x.THREADS);
      y(left to left+len(x.INPUT_EN)-1) := vectorify(x.INPUT_EN, y(left to left+len(x.INPUT_EN)-1));
      left := left + len(x.INPUT_EN);
      y(left to left+len(x.OUTPUT_EN)-1) := vectorify(x.OUTPUT_EN, y(left to left+len(x.OUTPUT_EN)-1));
      left := left + len(x.OUTPUT_EN);
      y(left to left+len(x.FLUSH_MEM_RESET)-1) := vectorify(x.FLUSH_MEM_RESET, y(left to left+len(x.FLUSH_MEM_RESET)-1));
    else
      y(left downto left-len(x.THREADS)+1) := vectorify(x.THREADS, y(left downto left-len(x.THREADS)+1));
      left := left - len(x.THREADS);
      y(left downto left-len(x.INPUT_EN)+1) := vectorify(x.INPUT_EN, y(left downto left-len(x.INPUT_EN)+1));
      left := left - len(x.INPUT_EN);
      y(left downto left-len(x.OUTPUT_EN)+1) := vectorify(x.OUTPUT_EN, y(left downto left-len(x.OUTPUT_EN)+1));
      left := left - len(x.OUTPUT_EN);
      y(left downto left-len(x.FLUSH_MEM_RESET)+1) := vectorify(x.FLUSH_MEM_RESET, y(left downto left-len(x.FLUSH_MEM_RESET)+1));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: TAR_CONFIGS_CTRL_t) return TAR_CONFIGS_CTRL_t is
    variable y: TAR_CONFIGS_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.THREADS := structify(x(left to left+len(y.THREADS)-1), y.THREADS);
      left := left + len(y.THREADS);
      y.INPUT_EN := structify(x(left to left+len(y.INPUT_EN)-1), y.INPUT_EN);
      left := left + len(y.INPUT_EN);
      y.OUTPUT_EN := structify(x(left to left+len(y.OUTPUT_EN)-1), y.OUTPUT_EN);
      left := left + len(y.OUTPUT_EN);
      y.FLUSH_MEM_RESET := structify(x(left to left+len(y.FLUSH_MEM_RESET)-1), y.FLUSH_MEM_RESET);
    else
      y.THREADS := structify(x(left downto left-len(y.THREADS)+1), y.THREADS);
      left := left - len(y.THREADS);
      y.INPUT_EN := structify(x(left downto left-len(y.INPUT_EN)+1), y.INPUT_EN);
      left := left - len(y.INPUT_EN);
      y.OUTPUT_EN := structify(x(left downto left-len(y.OUTPUT_EN)+1), y.OUTPUT_EN);
      left := left - len(y.OUTPUT_EN);
      y.FLUSH_MEM_RESET := structify(x(left downto left-len(y.FLUSH_MEM_RESET)+1), y.FLUSH_MEM_RESET);
    end if;
    return y;
  end function structify;
  function nullify(t: TAR_CONFIGS_CTRL_t) return TAR_CONFIGS_CTRL_t is
  variable y: TAR_CONFIGS_CTRL_t;
  begin
    y.THREADS := nullify(t.THREADS);
    y.INPUT_EN := nullify(t.INPUT_EN);
    y.OUTPUT_EN := nullify(t.OUTPUT_EN);
    y.FLUSH_MEM_RESET := nullify(t.FLUSH_MEM_RESET);
    return y;
  end function nullify;

  function len(x: TAR_STATUS_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.ENABLED);
    l := l + len(x.READY);
    l := l + len(x.ERROR);
    return l;
  end function len;
  function vectorify(x: TAR_STATUS_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      y(left to left+len(x.ENABLED)-1) := vectorify(x.ENABLED, y(left to left+len(x.ENABLED)-1));
      left := left + len(x.ENABLED);
      y(left to left+len(x.READY)-1) := vectorify(x.READY, y(left to left+len(x.READY)-1));
      left := left + len(x.READY);
      y(left to left+len(x.ERROR)-1) := vectorify(x.ERROR, y(left to left+len(x.ERROR)-1));
    else
      y(left downto left-len(x.ENABLED)+1) := vectorify(x.ENABLED, y(left downto left-len(x.ENABLED)+1));
      left := left - len(x.ENABLED);
      y(left downto left-len(x.READY)+1) := vectorify(x.READY, y(left downto left-len(x.READY)+1));
      left := left - len(x.READY);
      y(left downto left-len(x.ERROR)+1) := vectorify(x.ERROR, y(left downto left-len(x.ERROR)+1));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: TAR_STATUS_MON_t) return TAR_STATUS_MON_t is
    variable y: TAR_STATUS_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.ENABLED := structify(x(left to left+len(y.ENABLED)-1), y.ENABLED);
      left := left + len(y.ENABLED);
      y.READY := structify(x(left to left+len(y.READY)-1), y.READY);
      left := left + len(y.READY);
      y.ERROR := structify(x(left to left+len(y.ERROR)-1), y.ERROR);
    else
      y.ENABLED := structify(x(left downto left-len(y.ENABLED)+1), y.ENABLED);
      left := left - len(y.ENABLED);
      y.READY := structify(x(left downto left-len(y.READY)+1), y.READY);
      left := left - len(y.READY);
      y.ERROR := structify(x(left downto left-len(y.ERROR)+1), y.ERROR);
    end if;
    return y;
  end function structify;
  function nullify(t: TAR_STATUS_MON_t) return TAR_STATUS_MON_t is
  variable y: TAR_STATUS_MON_t;
  begin
    y.ENABLED := nullify(t.ENABLED);
    y.READY := nullify(t.READY);
    y.ERROR := nullify(t.ERROR);
    return y;
  end function nullify;

  function len(x: TAR_MON_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.STATUS);
    return l;
  end function len;
  function vectorify(x: TAR_MON_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      y(left to left+len(x.STATUS)-1) := vectorify(x.STATUS, y(left to left+len(x.STATUS)-1));
    else
      y(left downto left-len(x.STATUS)+1) := vectorify(x.STATUS, y(left downto left-len(x.STATUS)+1));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: TAR_MON_t) return TAR_MON_t is
    variable y: TAR_MON_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.STATUS := structify(x(left to left+len(y.STATUS)-1), y.STATUS);
    else
      y.STATUS := structify(x(left downto left-len(y.STATUS)+1), y.STATUS);
    end if;
    return y;
  end function structify;
  function nullify(t: TAR_MON_t) return TAR_MON_t is
  variable y: TAR_MON_t;
  begin
    y.STATUS := nullify(t.STATUS);
    return y;
  end function nullify;

  function len(x: TAR_CTRL_t) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.ACTIONS);
    l := l + len(x.CONFIGS);
    return l;
  end function len;
  function vectorify(x: TAR_CTRL_t; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      y(left to left+len(x.ACTIONS)-1) := vectorify(x.ACTIONS, y(left to left+len(x.ACTIONS)-1));
      left := left + len(x.ACTIONS);
      y(left to left+len(x.CONFIGS)-1) := vectorify(x.CONFIGS, y(left to left+len(x.CONFIGS)-1));
    else
      y(left downto left-len(x.ACTIONS)+1) := vectorify(x.ACTIONS, y(left downto left-len(x.ACTIONS)+1));
      left := left - len(x.ACTIONS);
      y(left downto left-len(x.CONFIGS)+1) := vectorify(x.CONFIGS, y(left downto left-len(x.CONFIGS)+1));
    end if;
    return y;
  end function vectorify;
  function structify(x: in std_logic_vector; t: TAR_CTRL_t) return TAR_CTRL_t is
    variable y: TAR_CTRL_t;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.ACTIONS := structify(x(left to left+len(y.ACTIONS)-1), y.ACTIONS);
      left := left + len(y.ACTIONS);
      y.CONFIGS := structify(x(left to left+len(y.CONFIGS)-1), y.CONFIGS);
    else
      y.ACTIONS := structify(x(left downto left-len(y.ACTIONS)+1), y.ACTIONS);
      left := left - len(y.ACTIONS);
      y.CONFIGS := structify(x(left downto left-len(y.CONFIGS)+1), y.CONFIGS);
    end if;
    return y;
  end function structify;
  function nullify(t: TAR_CTRL_t) return TAR_CTRL_t is
  variable y: TAR_CTRL_t;
  begin
    y.ACTIONS := nullify(t.ACTIONS);
    y.CONFIGS := nullify(t.CONFIGS);
    return y;
  end function nullify;

end package body TAR_CTRL;
