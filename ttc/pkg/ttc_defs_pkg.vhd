library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

package ttc_defs_pkg is

  type ttc_sys_rt is record
    clk40 : std_logic;
    clk320 : std_logic;
    rst : std_logic;
  end record ttc_sys_rt;
  constant TTC_SYS_LEN : integer := 3;
  subtype ttc_sys_rvt is std_logic_vector(TTC_SYS_LEN-1 downto 0);
  function vectorify(x: ttc_sys_rt) return ttc_sys_rvt;
  function structify(x: ttc_sys_rvt) return ttc_sys_rt;
  function nullify(x: ttc_sys_rt) return ttc_sys_rt;

  type ttc_fmt_rt is record
    bcr : std_logic;
    ecr : std_logic;
    lxa : std_logic;
    reserved0 : std_logic;
    reserved1 : std_logic;
    reserved2 : std_logic;
    reserved3 : std_logic;
    reserved4 : std_logic;
  end record ttc_fmt_rt;
  constant TTC_FMT_LEN : integer := 8;
  subtype ttc_fmt_rvt is std_logic_vector(TTC_FMT_LEN-1 downto 0);
  function vectorify(x: ttc_fmt_rt) return ttc_fmt_rvt;
  function structify(x: ttc_fmt_rvt) return ttc_fmt_rt;
  function nullify(x: ttc_fmt_rt) return ttc_fmt_rt;

  -- 320MHz domain
  type ttc_cmds_rt is record
    bcr : std_logic;
    ocr : std_logic;
    ecr : std_logic;
    lxa : std_logic;
    bx : std_logic;
  end record ttc_cmds_rt;
  constant TTC_CMDS_LEN : integer := 5;
  subtype ttc_cmds_rvt is std_logic_vector(TTC_CMDS_LEN-1 downto 0);
  function vectorify(x: ttc_cmds_rt) return ttc_cmds_rvt;
  function structify(x: ttc_cmds_rvt) return ttc_cmds_rt;
  function nullify(x: ttc_cmds_rt) return ttc_cmds_rt;

  type ttc_counters_rt is record
    bcid : bcid_t;
    eventid : unsigned(32-1 downto 0);
    orbitid : unsigned(32-1 downto 0);
  end record ttc_counters_rt;
  constant TTC_COUNTERS_LEN : integer := 76;
  subtype ttc_counters_rvt is std_logic_vector(TTC_COUNTERS_LEN-1 downto 0);
  function vectorify(x: ttc_counters_rt) return ttc_counters_rvt;
  function structify(x: ttc_counters_rvt) return ttc_counters_rt;
  function nullify(x: ttc_counters_rt) return ttc_counters_rt;

  type ttc_irt is record
    sys : ttc_sys_rt;
    data : std_logic_vector(8-1 downto 0);
  end record ttc_irt;
  constant TTC_ILEN : integer := 11;
  subtype ttc_irvt is std_logic_vector(TTC_ILEN-1 downto 0);
  function vectorify(x: ttc_irt) return ttc_irvt;
  function structify(x: ttc_irvt) return ttc_irt;
  function nullify(x: ttc_irt) return ttc_irt;

  type ttc_ort is record
    cmds : ttc_cmds_rt;
    cnt : ttc_counters_rt;
  end record ttc_ort;
  constant TTC_OLEN : integer := 81;
  subtype ttc_orvt is std_logic_vector(TTC_OLEN-1 downto 0);
  function vectorify(x: ttc_ort) return ttc_orvt;
  function structify(x: ttc_orvt) return ttc_ort;
  function nullify(x: ttc_ort) return ttc_ort;

  type ttc_rt is record
    i : ttc_irt;
    o : ttc_ort;
  end record ttc_rt;
  constant TTC_LEN : integer := 92;
  subtype ttc_rvt is std_logic_vector(TTC_LEN-1 downto 0);
  function vectorify(x: ttc_rt) return ttc_rvt;
  function structify(x: ttc_rvt) return ttc_rt;
  function nullify(x: ttc_rt) return ttc_rt;

end package ttc_defs_pkg;

------------------------------------------------------------

package body ttc_defs_pkg is

  function vectorify(x: ttc_sys_rt) return ttc_sys_rvt is
    variable y : ttc_sys_rvt;
  begin
    y(2)                       := x.clk40;
    y(1)                       := x.clk320;
    y(0)                       := x.rst;
    return y;
  end function vectorify;
  function structify(x: ttc_sys_rvt) return ttc_sys_rt is
    variable y : ttc_sys_rt;
  begin
    y.clk40                    := x(2);
    y.clk320                   := x(1);
    y.rst                      := x(0);
    return y;
  end function structify;
  function nullify(x: ttc_sys_rt) return ttc_sys_rt is
    variable y : ttc_sys_rt;
  begin
    y.clk40                    := nullify(x.clk40);
    y.clk320                   := nullify(x.clk320);
    y.rst                      := nullify(x.rst);
    return y;
  end function nullify;

  function vectorify(x: ttc_fmt_rt) return ttc_fmt_rvt is
    variable y : ttc_fmt_rvt;
  begin
    y(7)                       := x.bcr;
    y(6)                       := x.ecr;
    y(5)                       := x.lxa;
    y(4)                       := x.reserved0;
    y(3)                       := x.reserved1;
    y(2)                       := x.reserved2;
    y(1)                       := x.reserved3;
    y(0)                       := x.reserved4;
    return y;
  end function vectorify;
  function structify(x: ttc_fmt_rvt) return ttc_fmt_rt is
    variable y : ttc_fmt_rt;
  begin
    y.bcr                      := x(7);
    y.ecr                      := x(6);
    y.lxa                      := x(5);
    y.reserved0                := x(4);
    y.reserved1                := x(3);
    y.reserved2                := x(2);
    y.reserved3                := x(1);
    y.reserved4                := x(0);
    return y;
  end function structify;
  function nullify(x: ttc_fmt_rt) return ttc_fmt_rt is
    variable y : ttc_fmt_rt;
  begin
    y.bcr                      := nullify(x.bcr);
    y.ecr                      := nullify(x.ecr);
    y.lxa                      := nullify(x.lxa);
    y.reserved0                := nullify(x.reserved0);
    y.reserved1                := nullify(x.reserved1);
    y.reserved2                := nullify(x.reserved2);
    y.reserved3                := nullify(x.reserved3);
    y.reserved4                := nullify(x.reserved4);
    return y;
  end function nullify;

  function vectorify(x: ttc_cmds_rt) return ttc_cmds_rvt is
    variable y : ttc_cmds_rvt;
  begin
    y(4)                       := x.bcr;
    y(3)                       := x.ocr;
    y(2)                       := x.ecr;
    y(1)                       := x.lxa;
    y(0)                       := x.bx;
    return y;
  end function vectorify;
  function structify(x: ttc_cmds_rvt) return ttc_cmds_rt is
    variable y : ttc_cmds_rt;
  begin
    y.bcr                      := x(4);
    y.ocr                      := x(3);
    y.ecr                      := x(2);
    y.lxa                      := x(1);
    y.bx                       := x(0);
    return y;
  end function structify;
  function nullify(x: ttc_cmds_rt) return ttc_cmds_rt is
    variable y : ttc_cmds_rt;
  begin
    y.bcr                      := nullify(x.bcr);
    y.ocr                      := nullify(x.ocr);
    y.ecr                      := nullify(x.ecr);
    y.lxa                      := nullify(x.lxa);
    y.bx                       := nullify(x.bx);
    return y;
  end function nullify;

  function vectorify(x: ttc_counters_rt) return ttc_counters_rvt is
    variable y : ttc_counters_rvt;
  begin
    y(75 downto 64)            := vectorify(x.bcid);
    y(63 downto 32)            := vectorify(x.eventid);
    y(31 downto 0)             := vectorify(x.orbitid);
    return y;
  end function vectorify;
  function structify(x: ttc_counters_rvt) return ttc_counters_rt is
    variable y : ttc_counters_rt;
  begin
    y.bcid                     := structify(x(75 downto 64));
    y.eventid                  := structify(x(63 downto 32));
    y.orbitid                  := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: ttc_counters_rt) return ttc_counters_rt is
    variable y : ttc_counters_rt;
  begin
    y.bcid                     := nullify(x.bcid);
    y.eventid                  := nullify(x.eventid);
    y.orbitid                  := nullify(x.orbitid);
    return y;
  end function nullify;

  function vectorify(x: ttc_irt) return ttc_irvt is
    variable y : ttc_irvt;
  begin
    y(10 downto 8)             := vectorify(x.sys);
    y(7 downto 0)              := x.data;
    return y;
  end function vectorify;
  function structify(x: ttc_irvt) return ttc_irt is
    variable y : ttc_irt;
  begin
    y.sys                      := structify(x(10 downto 8));
    y.data                     := x(7 downto 0);
    return y;
  end function structify;
  function nullify(x: ttc_irt) return ttc_irt is
    variable y : ttc_irt;
  begin
    y.sys                      := nullify(x.sys);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: ttc_ort) return ttc_orvt is
    variable y : ttc_orvt;
  begin
    y(80 downto 76)            := vectorify(x.cmds);
    y(75 downto 0)             := vectorify(x.cnt);
    return y;
  end function vectorify;
  function structify(x: ttc_orvt) return ttc_ort is
    variable y : ttc_ort;
  begin
    y.cmds                     := structify(x(80 downto 76));
    y.cnt                      := structify(x(75 downto 0));
    return y;
  end function structify;
  function nullify(x: ttc_ort) return ttc_ort is
    variable y : ttc_ort;
  begin
    y.cmds                     := nullify(x.cmds);
    y.cnt                      := nullify(x.cnt);
    return y;
  end function nullify;

  function vectorify(x: ttc_rt) return ttc_rvt is
    variable y : ttc_rvt;
  begin
    y(91 downto 81)            := vectorify(x.i);
    y(80 downto 0)             := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: ttc_rvt) return ttc_rt is
    variable y : ttc_rt;
  begin
    y.i                        := structify(x(91 downto 81));
    y.o                        := structify(x(80 downto 0));
    return y;
  end function structify;
  function nullify(x: ttc_rt) return ttc_rt is
    variable y : ttc_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

end package body ttc_defs_pkg;
