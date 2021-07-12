-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library basic_lib;

use basic_lib.basic_defs.all;

library ttc_def;

use ttc_def.ttc_defs.all;

library daq_def;

use daq_def.daq_config_defs.all;
use daq_def.daq_defs.all;

package daq_trigger_path_defs is

  type daq_trigger_irt is record
    sys : ttc_sys_rt;
    ttc : ttc_fmt_vt;
    ctrl : ctrl_to_daq_rt;
    stream_0 : daq_stream_rt;
    stream_1 : daq_stream_rt;
    stream_2 : daq_stream_rt;
    stream_3 : daq_stream_rt;
    stream_4 : daq_stream_rt;
    stream_5 : daq_stream_rt;
    stream_6 : daq_stream_rt;
    stream_7 : daq_stream_rt;
    stream_8 : daq_stream_rt;
    f2e0 : felix_to_daq_rt;
    f2e1 : felix_to_daq_rt;
  end record daq_trigger_irt;
  function len(x: daq_trigger_irt) return natural;
  function vectorify(x: daq_trigger_irt; t: std_logic_vector) return std_logic_vector;
  function convert(x: daq_trigger_irt; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: daq_trigger_irt) return daq_trigger_irt;
  function convert(x: in std_logic_vector; t: daq_trigger_irt) return daq_trigger_irt;
  function nullify(t: daq_trigger_irt) return daq_trigger_irt;

  type daq_trigger_ort is record
    status0 : daq_to_status_rt;
    status1 : daq_to_status_rt;
    f2e0 : daq_to_felix_rt;
    f2e1 : daq_to_felix_rt;
  end record daq_trigger_ort;
  function len(x: daq_trigger_ort) return natural;
  function vectorify(x: daq_trigger_ort; t: std_logic_vector) return std_logic_vector;
  function convert(x: daq_trigger_ort; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: daq_trigger_ort) return daq_trigger_ort;
  function convert(x: in std_logic_vector; t: daq_trigger_ort) return daq_trigger_ort;
  function nullify(t: daq_trigger_ort) return daq_trigger_ort;

  type daq_trigger_ert is record
    i : daq_trigger_irt;
    o : daq_trigger_ort;
  end record daq_trigger_ert;
  function len(x: daq_trigger_ert) return natural;
  function vectorify(x: daq_trigger_ert; t: std_logic_vector) return std_logic_vector;
  function convert(x: daq_trigger_ert; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: daq_trigger_ert) return daq_trigger_ert;
  function convert(x: in std_logic_vector; t: daq_trigger_ert) return daq_trigger_ert;
  function nullify(t: daq_trigger_ert) return daq_trigger_ert;

end package daq_trigger_path_defs;

------------------------------------------------------------

package body daq_trigger_path_defs is

  function len(x: daq_trigger_irt) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.sys);
    l := l + len(x.ttc);
    l := l + len(x.ctrl);
    l := l + len(x.stream_0);
    l := l + len(x.stream_1);
    l := l + len(x.stream_2);
    l := l + len(x.stream_3);
    l := l + len(x.stream_4);
    l := l + len(x.stream_5);
    l := l + len(x.stream_6);
    l := l + len(x.stream_7);
    l := l + len(x.stream_8);
    l := l + len(x.f2e0);
    l := l + len(x.f2e1);
    return l;
  end function len;
  function vectorify(x: daq_trigger_irt; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.sys)-1), vectorify(x.sys, y(left to left+len(x.sys)-1)));
      left := left + len(x.sys);
      assign(y(left to left+len(x.ttc)-1), vectorify(x.ttc, y(left to left+len(x.ttc)-1)));
      left := left + len(x.ttc);
      assign(y(left to left+len(x.ctrl)-1), vectorify(x.ctrl, y(left to left+len(x.ctrl)-1)));
      left := left + len(x.ctrl);
      assign(y(left to left+len(x.stream_0)-1), vectorify(x.stream_0, y(left to left+len(x.stream_0)-1)));
      left := left + len(x.stream_0);
      assign(y(left to left+len(x.stream_1)-1), vectorify(x.stream_1, y(left to left+len(x.stream_1)-1)));
      left := left + len(x.stream_1);
      assign(y(left to left+len(x.stream_2)-1), vectorify(x.stream_2, y(left to left+len(x.stream_2)-1)));
      left := left + len(x.stream_2);
      assign(y(left to left+len(x.stream_3)-1), vectorify(x.stream_3, y(left to left+len(x.stream_3)-1)));
      left := left + len(x.stream_3);
      assign(y(left to left+len(x.stream_4)-1), vectorify(x.stream_4, y(left to left+len(x.stream_4)-1)));
      left := left + len(x.stream_4);
      assign(y(left to left+len(x.stream_5)-1), vectorify(x.stream_5, y(left to left+len(x.stream_5)-1)));
      left := left + len(x.stream_5);
      assign(y(left to left+len(x.stream_6)-1), vectorify(x.stream_6, y(left to left+len(x.stream_6)-1)));
      left := left + len(x.stream_6);
      assign(y(left to left+len(x.stream_7)-1), vectorify(x.stream_7, y(left to left+len(x.stream_7)-1)));
      left := left + len(x.stream_7);
      assign(y(left to left+len(x.stream_8)-1), vectorify(x.stream_8, y(left to left+len(x.stream_8)-1)));
      left := left + len(x.stream_8);
      assign(y(left to left+len(x.f2e0)-1), vectorify(x.f2e0, y(left to left+len(x.f2e0)-1)));
      left := left + len(x.f2e0);
      assign(y(left to left+len(x.f2e1)-1), vectorify(x.f2e1, y(left to left+len(x.f2e1)-1)));
    else
      assign(y(left downto left-len(x.sys)+1), vectorify(x.sys, y(left downto left-len(x.sys)+1)));
      left := left - len(x.sys);
      assign(y(left downto left-len(x.ttc)+1), vectorify(x.ttc, y(left downto left-len(x.ttc)+1)));
      left := left - len(x.ttc);
      assign(y(left downto left-len(x.ctrl)+1), vectorify(x.ctrl, y(left downto left-len(x.ctrl)+1)));
      left := left - len(x.ctrl);
      assign(y(left downto left-len(x.stream_0)+1), vectorify(x.stream_0, y(left downto left-len(x.stream_0)+1)));
      left := left - len(x.stream_0);
      assign(y(left downto left-len(x.stream_1)+1), vectorify(x.stream_1, y(left downto left-len(x.stream_1)+1)));
      left := left - len(x.stream_1);
      assign(y(left downto left-len(x.stream_2)+1), vectorify(x.stream_2, y(left downto left-len(x.stream_2)+1)));
      left := left - len(x.stream_2);
      assign(y(left downto left-len(x.stream_3)+1), vectorify(x.stream_3, y(left downto left-len(x.stream_3)+1)));
      left := left - len(x.stream_3);
      assign(y(left downto left-len(x.stream_4)+1), vectorify(x.stream_4, y(left downto left-len(x.stream_4)+1)));
      left := left - len(x.stream_4);
      assign(y(left downto left-len(x.stream_5)+1), vectorify(x.stream_5, y(left downto left-len(x.stream_5)+1)));
      left := left - len(x.stream_5);
      assign(y(left downto left-len(x.stream_6)+1), vectorify(x.stream_6, y(left downto left-len(x.stream_6)+1)));
      left := left - len(x.stream_6);
      assign(y(left downto left-len(x.stream_7)+1), vectorify(x.stream_7, y(left downto left-len(x.stream_7)+1)));
      left := left - len(x.stream_7);
      assign(y(left downto left-len(x.stream_8)+1), vectorify(x.stream_8, y(left downto left-len(x.stream_8)+1)));
      left := left - len(x.stream_8);
      assign(y(left downto left-len(x.f2e0)+1), vectorify(x.f2e0, y(left downto left-len(x.f2e0)+1)));
      left := left - len(x.f2e0);
      assign(y(left downto left-len(x.f2e1)+1), vectorify(x.f2e1, y(left downto left-len(x.f2e1)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: daq_trigger_irt; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.sys)-1), convert(x.sys, y(left to left+len(x.sys)-1)));
      left := left + len(x.sys);
      assign(y(left to left+len(x.ttc)-1), convert(x.ttc, y(left to left+len(x.ttc)-1)));
      left := left + len(x.ttc);
      assign(y(left to left+len(x.ctrl)-1), convert(x.ctrl, y(left to left+len(x.ctrl)-1)));
      left := left + len(x.ctrl);
      assign(y(left to left+len(x.stream_0)-1), convert(x.stream_0, y(left to left+len(x.stream_0)-1)));
      left := left + len(x.stream_0);
      assign(y(left to left+len(x.stream_1)-1), convert(x.stream_1, y(left to left+len(x.stream_1)-1)));
      left := left + len(x.stream_1);
      assign(y(left to left+len(x.stream_2)-1), convert(x.stream_2, y(left to left+len(x.stream_2)-1)));
      left := left + len(x.stream_2);
      assign(y(left to left+len(x.stream_3)-1), convert(x.stream_3, y(left to left+len(x.stream_3)-1)));
      left := left + len(x.stream_3);
      assign(y(left to left+len(x.stream_4)-1), convert(x.stream_4, y(left to left+len(x.stream_4)-1)));
      left := left + len(x.stream_4);
      assign(y(left to left+len(x.stream_5)-1), convert(x.stream_5, y(left to left+len(x.stream_5)-1)));
      left := left + len(x.stream_5);
      assign(y(left to left+len(x.stream_6)-1), convert(x.stream_6, y(left to left+len(x.stream_6)-1)));
      left := left + len(x.stream_6);
      assign(y(left to left+len(x.stream_7)-1), convert(x.stream_7, y(left to left+len(x.stream_7)-1)));
      left := left + len(x.stream_7);
      assign(y(left to left+len(x.stream_8)-1), convert(x.stream_8, y(left to left+len(x.stream_8)-1)));
      left := left + len(x.stream_8);
      assign(y(left to left+len(x.f2e0)-1), convert(x.f2e0, y(left to left+len(x.f2e0)-1)));
      left := left + len(x.f2e0);
      assign(y(left to left+len(x.f2e1)-1), convert(x.f2e1, y(left to left+len(x.f2e1)-1)));
    else
      assign(y(left downto left-len(x.sys)+1), convert(x.sys, y(left downto left-len(x.sys)+1)));
      left := left - len(x.sys);
      assign(y(left downto left-len(x.ttc)+1), convert(x.ttc, y(left downto left-len(x.ttc)+1)));
      left := left - len(x.ttc);
      assign(y(left downto left-len(x.ctrl)+1), convert(x.ctrl, y(left downto left-len(x.ctrl)+1)));
      left := left - len(x.ctrl);
      assign(y(left downto left-len(x.stream_0)+1), convert(x.stream_0, y(left downto left-len(x.stream_0)+1)));
      left := left - len(x.stream_0);
      assign(y(left downto left-len(x.stream_1)+1), convert(x.stream_1, y(left downto left-len(x.stream_1)+1)));
      left := left - len(x.stream_1);
      assign(y(left downto left-len(x.stream_2)+1), convert(x.stream_2, y(left downto left-len(x.stream_2)+1)));
      left := left - len(x.stream_2);
      assign(y(left downto left-len(x.stream_3)+1), convert(x.stream_3, y(left downto left-len(x.stream_3)+1)));
      left := left - len(x.stream_3);
      assign(y(left downto left-len(x.stream_4)+1), convert(x.stream_4, y(left downto left-len(x.stream_4)+1)));
      left := left - len(x.stream_4);
      assign(y(left downto left-len(x.stream_5)+1), convert(x.stream_5, y(left downto left-len(x.stream_5)+1)));
      left := left - len(x.stream_5);
      assign(y(left downto left-len(x.stream_6)+1), convert(x.stream_6, y(left downto left-len(x.stream_6)+1)));
      left := left - len(x.stream_6);
      assign(y(left downto left-len(x.stream_7)+1), convert(x.stream_7, y(left downto left-len(x.stream_7)+1)));
      left := left - len(x.stream_7);
      assign(y(left downto left-len(x.stream_8)+1), convert(x.stream_8, y(left downto left-len(x.stream_8)+1)));
      left := left - len(x.stream_8);
      assign(y(left downto left-len(x.f2e0)+1), convert(x.f2e0, y(left downto left-len(x.f2e0)+1)));
      left := left - len(x.f2e0);
      assign(y(left downto left-len(x.f2e1)+1), convert(x.f2e1, y(left downto left-len(x.f2e1)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: daq_trigger_irt) return daq_trigger_irt is
    variable y: daq_trigger_irt;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.sys := structify(x(left to left+len(y.sys)-1), y.sys);
      left := left + len(y.sys);
      y.ttc := structify(x(left to left+len(y.ttc)-1), y.ttc);
      left := left + len(y.ttc);
      y.ctrl := structify(x(left to left+len(y.ctrl)-1), y.ctrl);
      left := left + len(y.ctrl);
      y.stream_0 := structify(x(left to left+len(y.stream_0)-1), y.stream_0);
      left := left + len(y.stream_0);
      y.stream_1 := structify(x(left to left+len(y.stream_1)-1), y.stream_1);
      left := left + len(y.stream_1);
      y.stream_2 := structify(x(left to left+len(y.stream_2)-1), y.stream_2);
      left := left + len(y.stream_2);
      y.stream_3 := structify(x(left to left+len(y.stream_3)-1), y.stream_3);
      left := left + len(y.stream_3);
      y.stream_4 := structify(x(left to left+len(y.stream_4)-1), y.stream_4);
      left := left + len(y.stream_4);
      y.stream_5 := structify(x(left to left+len(y.stream_5)-1), y.stream_5);
      left := left + len(y.stream_5);
      y.stream_6 := structify(x(left to left+len(y.stream_6)-1), y.stream_6);
      left := left + len(y.stream_6);
      y.stream_7 := structify(x(left to left+len(y.stream_7)-1), y.stream_7);
      left := left + len(y.stream_7);
      y.stream_8 := structify(x(left to left+len(y.stream_8)-1), y.stream_8);
      left := left + len(y.stream_8);
      y.f2e0 := structify(x(left to left+len(y.f2e0)-1), y.f2e0);
      left := left + len(y.f2e0);
      y.f2e1 := structify(x(left to left+len(y.f2e1)-1), y.f2e1);
    else
      y.sys := structify(x(left downto left-len(y.sys)+1), y.sys);
      left := left - len(y.sys);
      y.ttc := structify(x(left downto left-len(y.ttc)+1), y.ttc);
      left := left - len(y.ttc);
      y.ctrl := structify(x(left downto left-len(y.ctrl)+1), y.ctrl);
      left := left - len(y.ctrl);
      y.stream_0 := structify(x(left downto left-len(y.stream_0)+1), y.stream_0);
      left := left - len(y.stream_0);
      y.stream_1 := structify(x(left downto left-len(y.stream_1)+1), y.stream_1);
      left := left - len(y.stream_1);
      y.stream_2 := structify(x(left downto left-len(y.stream_2)+1), y.stream_2);
      left := left - len(y.stream_2);
      y.stream_3 := structify(x(left downto left-len(y.stream_3)+1), y.stream_3);
      left := left - len(y.stream_3);
      y.stream_4 := structify(x(left downto left-len(y.stream_4)+1), y.stream_4);
      left := left - len(y.stream_4);
      y.stream_5 := structify(x(left downto left-len(y.stream_5)+1), y.stream_5);
      left := left - len(y.stream_5);
      y.stream_6 := structify(x(left downto left-len(y.stream_6)+1), y.stream_6);
      left := left - len(y.stream_6);
      y.stream_7 := structify(x(left downto left-len(y.stream_7)+1), y.stream_7);
      left := left - len(y.stream_7);
      y.stream_8 := structify(x(left downto left-len(y.stream_8)+1), y.stream_8);
      left := left - len(y.stream_8);
      y.f2e0 := structify(x(left downto left-len(y.f2e0)+1), y.f2e0);
      left := left - len(y.f2e0);
      y.f2e1 := structify(x(left downto left-len(y.f2e1)+1), y.f2e1);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: daq_trigger_irt) return daq_trigger_irt is
    variable y: daq_trigger_irt;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.sys := convert(x(left to left+len(y.sys)-1), y.sys);
      left := left + len(y.sys);
      y.ttc := convert(x(left to left+len(y.ttc)-1), y.ttc);
      left := left + len(y.ttc);
      y.ctrl := convert(x(left to left+len(y.ctrl)-1), y.ctrl);
      left := left + len(y.ctrl);
      y.stream_0 := convert(x(left to left+len(y.stream_0)-1), y.stream_0);
      left := left + len(y.stream_0);
      y.stream_1 := convert(x(left to left+len(y.stream_1)-1), y.stream_1);
      left := left + len(y.stream_1);
      y.stream_2 := convert(x(left to left+len(y.stream_2)-1), y.stream_2);
      left := left + len(y.stream_2);
      y.stream_3 := convert(x(left to left+len(y.stream_3)-1), y.stream_3);
      left := left + len(y.stream_3);
      y.stream_4 := convert(x(left to left+len(y.stream_4)-1), y.stream_4);
      left := left + len(y.stream_4);
      y.stream_5 := convert(x(left to left+len(y.stream_5)-1), y.stream_5);
      left := left + len(y.stream_5);
      y.stream_6 := convert(x(left to left+len(y.stream_6)-1), y.stream_6);
      left := left + len(y.stream_6);
      y.stream_7 := convert(x(left to left+len(y.stream_7)-1), y.stream_7);
      left := left + len(y.stream_7);
      y.stream_8 := convert(x(left to left+len(y.stream_8)-1), y.stream_8);
      left := left + len(y.stream_8);
      y.f2e0 := convert(x(left to left+len(y.f2e0)-1), y.f2e0);
      left := left + len(y.f2e0);
      y.f2e1 := convert(x(left to left+len(y.f2e1)-1), y.f2e1);
    else
      y.sys := convert(x(left downto left-len(y.sys)+1), y.sys);
      left := left - len(y.sys);
      y.ttc := convert(x(left downto left-len(y.ttc)+1), y.ttc);
      left := left - len(y.ttc);
      y.ctrl := convert(x(left downto left-len(y.ctrl)+1), y.ctrl);
      left := left - len(y.ctrl);
      y.stream_0 := convert(x(left downto left-len(y.stream_0)+1), y.stream_0);
      left := left - len(y.stream_0);
      y.stream_1 := convert(x(left downto left-len(y.stream_1)+1), y.stream_1);
      left := left - len(y.stream_1);
      y.stream_2 := convert(x(left downto left-len(y.stream_2)+1), y.stream_2);
      left := left - len(y.stream_2);
      y.stream_3 := convert(x(left downto left-len(y.stream_3)+1), y.stream_3);
      left := left - len(y.stream_3);
      y.stream_4 := convert(x(left downto left-len(y.stream_4)+1), y.stream_4);
      left := left - len(y.stream_4);
      y.stream_5 := convert(x(left downto left-len(y.stream_5)+1), y.stream_5);
      left := left - len(y.stream_5);
      y.stream_6 := convert(x(left downto left-len(y.stream_6)+1), y.stream_6);
      left := left - len(y.stream_6);
      y.stream_7 := convert(x(left downto left-len(y.stream_7)+1), y.stream_7);
      left := left - len(y.stream_7);
      y.stream_8 := convert(x(left downto left-len(y.stream_8)+1), y.stream_8);
      left := left - len(y.stream_8);
      y.f2e0 := convert(x(left downto left-len(y.f2e0)+1), y.f2e0);
      left := left - len(y.f2e0);
      y.f2e1 := convert(x(left downto left-len(y.f2e1)+1), y.f2e1);
    end if;
    return y;
  end function convert;
  function nullify(t: daq_trigger_irt) return daq_trigger_irt is
  variable y: daq_trigger_irt;
  begin
    y.sys := nullify(t.sys);
    y.ttc := nullify(t.ttc);
    y.ctrl := nullify(t.ctrl);
    y.stream_0 := nullify(t.stream_0);
    y.stream_1 := nullify(t.stream_1);
    y.stream_2 := nullify(t.stream_2);
    y.stream_3 := nullify(t.stream_3);
    y.stream_4 := nullify(t.stream_4);
    y.stream_5 := nullify(t.stream_5);
    y.stream_6 := nullify(t.stream_6);
    y.stream_7 := nullify(t.stream_7);
    y.stream_8 := nullify(t.stream_8);
    y.f2e0 := nullify(t.f2e0);
    y.f2e1 := nullify(t.f2e1);
    return y;
  end function nullify;

  function len(x: daq_trigger_ort) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.status0);
    l := l + len(x.status1);
    l := l + len(x.f2e0);
    l := l + len(x.f2e1);
    return l;
  end function len;
  function vectorify(x: daq_trigger_ort; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.status0)-1), vectorify(x.status0, y(left to left+len(x.status0)-1)));
      left := left + len(x.status0);
      assign(y(left to left+len(x.status1)-1), vectorify(x.status1, y(left to left+len(x.status1)-1)));
      left := left + len(x.status1);
      assign(y(left to left+len(x.f2e0)-1), vectorify(x.f2e0, y(left to left+len(x.f2e0)-1)));
      left := left + len(x.f2e0);
      assign(y(left to left+len(x.f2e1)-1), vectorify(x.f2e1, y(left to left+len(x.f2e1)-1)));
    else
      assign(y(left downto left-len(x.status0)+1), vectorify(x.status0, y(left downto left-len(x.status0)+1)));
      left := left - len(x.status0);
      assign(y(left downto left-len(x.status1)+1), vectorify(x.status1, y(left downto left-len(x.status1)+1)));
      left := left - len(x.status1);
      assign(y(left downto left-len(x.f2e0)+1), vectorify(x.f2e0, y(left downto left-len(x.f2e0)+1)));
      left := left - len(x.f2e0);
      assign(y(left downto left-len(x.f2e1)+1), vectorify(x.f2e1, y(left downto left-len(x.f2e1)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: daq_trigger_ort; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.status0)-1), convert(x.status0, y(left to left+len(x.status0)-1)));
      left := left + len(x.status0);
      assign(y(left to left+len(x.status1)-1), convert(x.status1, y(left to left+len(x.status1)-1)));
      left := left + len(x.status1);
      assign(y(left to left+len(x.f2e0)-1), convert(x.f2e0, y(left to left+len(x.f2e0)-1)));
      left := left + len(x.f2e0);
      assign(y(left to left+len(x.f2e1)-1), convert(x.f2e1, y(left to left+len(x.f2e1)-1)));
    else
      assign(y(left downto left-len(x.status0)+1), convert(x.status0, y(left downto left-len(x.status0)+1)));
      left := left - len(x.status0);
      assign(y(left downto left-len(x.status1)+1), convert(x.status1, y(left downto left-len(x.status1)+1)));
      left := left - len(x.status1);
      assign(y(left downto left-len(x.f2e0)+1), convert(x.f2e0, y(left downto left-len(x.f2e0)+1)));
      left := left - len(x.f2e0);
      assign(y(left downto left-len(x.f2e1)+1), convert(x.f2e1, y(left downto left-len(x.f2e1)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: daq_trigger_ort) return daq_trigger_ort is
    variable y: daq_trigger_ort;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.status0 := structify(x(left to left+len(y.status0)-1), y.status0);
      left := left + len(y.status0);
      y.status1 := structify(x(left to left+len(y.status1)-1), y.status1);
      left := left + len(y.status1);
      y.f2e0 := structify(x(left to left+len(y.f2e0)-1), y.f2e0);
      left := left + len(y.f2e0);
      y.f2e1 := structify(x(left to left+len(y.f2e1)-1), y.f2e1);
    else
      y.status0 := structify(x(left downto left-len(y.status0)+1), y.status0);
      left := left - len(y.status0);
      y.status1 := structify(x(left downto left-len(y.status1)+1), y.status1);
      left := left - len(y.status1);
      y.f2e0 := structify(x(left downto left-len(y.f2e0)+1), y.f2e0);
      left := left - len(y.f2e0);
      y.f2e1 := structify(x(left downto left-len(y.f2e1)+1), y.f2e1);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: daq_trigger_ort) return daq_trigger_ort is
    variable y: daq_trigger_ort;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.status0 := convert(x(left to left+len(y.status0)-1), y.status0);
      left := left + len(y.status0);
      y.status1 := convert(x(left to left+len(y.status1)-1), y.status1);
      left := left + len(y.status1);
      y.f2e0 := convert(x(left to left+len(y.f2e0)-1), y.f2e0);
      left := left + len(y.f2e0);
      y.f2e1 := convert(x(left to left+len(y.f2e1)-1), y.f2e1);
    else
      y.status0 := convert(x(left downto left-len(y.status0)+1), y.status0);
      left := left - len(y.status0);
      y.status1 := convert(x(left downto left-len(y.status1)+1), y.status1);
      left := left - len(y.status1);
      y.f2e0 := convert(x(left downto left-len(y.f2e0)+1), y.f2e0);
      left := left - len(y.f2e0);
      y.f2e1 := convert(x(left downto left-len(y.f2e1)+1), y.f2e1);
    end if;
    return y;
  end function convert;
  function nullify(t: daq_trigger_ort) return daq_trigger_ort is
  variable y: daq_trigger_ort;
  begin
    y.status0 := nullify(t.status0);
    y.status1 := nullify(t.status1);
    y.f2e0 := nullify(t.f2e0);
    y.f2e1 := nullify(t.f2e1);
    return y;
  end function nullify;

  function len(x: daq_trigger_ert) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.i);
    l := l + len(x.o);
    return l;
  end function len;
  function vectorify(x: daq_trigger_ert; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.i)-1), vectorify(x.i, y(left to left+len(x.i)-1)));
      left := left + len(x.i);
      assign(y(left to left+len(x.o)-1), vectorify(x.o, y(left to left+len(x.o)-1)));
    else
      assign(y(left downto left-len(x.i)+1), vectorify(x.i, y(left downto left-len(x.i)+1)));
      left := left - len(x.i);
      assign(y(left downto left-len(x.o)+1), vectorify(x.o, y(left downto left-len(x.o)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: daq_trigger_ert; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.i)-1), convert(x.i, y(left to left+len(x.i)-1)));
      left := left + len(x.i);
      assign(y(left to left+len(x.o)-1), convert(x.o, y(left to left+len(x.o)-1)));
    else
      assign(y(left downto left-len(x.i)+1), convert(x.i, y(left downto left-len(x.i)+1)));
      left := left - len(x.i);
      assign(y(left downto left-len(x.o)+1), convert(x.o, y(left downto left-len(x.o)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: daq_trigger_ert) return daq_trigger_ert is
    variable y: daq_trigger_ert;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.i := structify(x(left to left+len(y.i)-1), y.i);
      left := left + len(y.i);
      y.o := structify(x(left to left+len(y.o)-1), y.o);
    else
      y.i := structify(x(left downto left-len(y.i)+1), y.i);
      left := left - len(y.i);
      y.o := structify(x(left downto left-len(y.o)+1), y.o);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: daq_trigger_ert) return daq_trigger_ert is
    variable y: daq_trigger_ert;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.i := convert(x(left to left+len(y.i)-1), y.i);
      left := left + len(y.i);
      y.o := convert(x(left to left+len(y.o)-1), y.o);
    else
      y.i := convert(x(left downto left-len(y.i)+1), y.i);
      left := left - len(y.i);
      y.o := convert(x(left downto left-len(y.o)+1), y.o);
    end if;
    return y;
  end function convert;
  function nullify(t: daq_trigger_ert) return daq_trigger_ert is
  variable y: daq_trigger_ert;
  begin
    y.i := nullify(t.i);
    y.o := nullify(t.o);
    return y;
  end function nullify;

end package body daq_trigger_path_defs;
