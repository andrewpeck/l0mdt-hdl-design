-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;

package mpl_pkg is

  type mpl2csw_ptcalc_rt is record
    data_valid : std_logic;
    busy : std_logic;
    process_ch : std_logic_vector(UCM2PL_PROCESS_CH_LEN-1 downto 0);
    muid : slc_muid_rt;
    phimod : signed(UCM2PL_PHIMOD_LEN-1 downto 0);
    sl_charge : std_logic;
    nswseg_poseta : unsigned(SLC_ENDCAP_NSWSEG_POSETA_LEN-1 downto 0);
    nswseg_posphi : unsigned(SLC_ENDCAP_NSWSEG_POSPHI_LEN-1 downto 0);
    nswseg_angdtheta : signed(SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN-1 downto 0);
  end record mpl2csw_ptcalc_rt;
  function len(x: mpl2csw_ptcalc_rt) return natural;
  function width(x: mpl2csw_ptcalc_rt) return natural;
  function vectorify(x: mpl2csw_ptcalc_rt; t: std_logic_vector) return std_logic_vector;
  function convert(x: mpl2csw_ptcalc_rt; t: std_logic_vector) return std_logic_vector;
  function structify(x: in std_logic_vector; t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt;
  function convert(x: in std_logic_vector; t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt;
  function nullify(t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt;
  function zeroed(t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt;

  subtype mpl2csw_ptcalc_vt is std_logic_vector(63-1 downto 0);

  type mpl2csw_ptcalc_art is array(integer range <>) of mpl2csw_ptcalc_rt;
  function len(x: mpl2csw_ptcalc_art) return natural;
  function width(x: mpl2csw_ptcalc_art) return natural;
  function vectorify(x: mpl2csw_ptcalc_art; t: std_logic_vector) return std_logic_vector;
  function convert(x: mpl2csw_ptcalc_art; t: std_logic_vector) return std_logic_vector;
  function structify(x: std_logic_vector; t: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art;
  function convert(x: std_logic_vector; t: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art;
  function nullify(x: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art;
  function zeroed(x: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art;

  type mpl2csw_ptcalc_avt is array(integer range <>) of mpl2csw_ptcalc_vt;
  function len(x: mpl2csw_ptcalc_avt) return natural;
  function width(x: mpl2csw_ptcalc_avt) return natural;
  function vectorify(x: mpl2csw_ptcalc_avt; t: std_logic_vector) return std_logic_vector;
  function convert(x: mpl2csw_ptcalc_avt; t: std_logic_vector) return std_logic_vector;
  function structify(x: std_logic_vector; t: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt;
  function convert(x: std_logic_vector; t: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt;
  function nullify(x: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt;
  function zeroed(x: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt;

  constant MPL_PL_A_LATENCY : integer := 10;

  constant MPL_PL_B_LATENCY : integer := 5;

end package mpl_pkg;

------------------------------------------------------------

package body mpl_pkg is

  function len(x: mpl2csw_ptcalc_rt) return natural is
    variable l : natural := 0;
  begin
    l := l + len(x.data_valid);
    l := l + len(x.busy);
    l := l + len(x.process_ch);
    l := l + len(x.muid);
    l := l + len(x.phimod);
    l := l + len(x.sl_charge);
    l := l + len(x.nswseg_poseta);
    l := l + len(x.nswseg_posphi);
    l := l + len(x.nswseg_angdtheta);
    return l;
  end function len;
  function width(x: mpl2csw_ptcalc_rt) return natural is
    variable l : natural := 0;
  begin
    l := l + width(x.data_valid);
    l := l + width(x.busy);
    l := l + width(x.process_ch);
    l := l + width(x.muid);
    l := l + width(x.phimod);
    l := l + width(x.sl_charge);
    l := l + width(x.nswseg_poseta);
    l := l + width(x.nswseg_posphi);
    l := l + width(x.nswseg_angdtheta);
    return l;
  end function width;
  function vectorify(x: mpl2csw_ptcalc_rt; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.data_valid)-1), vectorify(x.data_valid, y(left to left+len(x.data_valid)-1)));
      left := left + len(x.data_valid);
      assign(y(left to left+len(x.busy)-1), vectorify(x.busy, y(left to left+len(x.busy)-1)));
      left := left + len(x.busy);
      assign(y(left to left+len(x.process_ch)-1), vectorify(x.process_ch, y(left to left+len(x.process_ch)-1)));
      left := left + len(x.process_ch);
      assign(y(left to left+len(x.muid)-1), vectorify(x.muid, y(left to left+len(x.muid)-1)));
      left := left + len(x.muid);
      assign(y(left to left+len(x.phimod)-1), vectorify(x.phimod, y(left to left+len(x.phimod)-1)));
      left := left + len(x.phimod);
      assign(y(left to left+len(x.sl_charge)-1), vectorify(x.sl_charge, y(left to left+len(x.sl_charge)-1)));
      left := left + len(x.sl_charge);
      assign(y(left to left+len(x.nswseg_poseta)-1), vectorify(x.nswseg_poseta, y(left to left+len(x.nswseg_poseta)-1)));
      left := left + len(x.nswseg_poseta);
      assign(y(left to left+len(x.nswseg_posphi)-1), vectorify(x.nswseg_posphi, y(left to left+len(x.nswseg_posphi)-1)));
      left := left + len(x.nswseg_posphi);
      assign(y(left to left+len(x.nswseg_angdtheta)-1), vectorify(x.nswseg_angdtheta, y(left to left+len(x.nswseg_angdtheta)-1)));
    else
      assign(y(left downto left-len(x.data_valid)+1), vectorify(x.data_valid, y(left downto left-len(x.data_valid)+1)));
      left := left - len(x.data_valid);
      assign(y(left downto left-len(x.busy)+1), vectorify(x.busy, y(left downto left-len(x.busy)+1)));
      left := left - len(x.busy);
      assign(y(left downto left-len(x.process_ch)+1), vectorify(x.process_ch, y(left downto left-len(x.process_ch)+1)));
      left := left - len(x.process_ch);
      assign(y(left downto left-len(x.muid)+1), vectorify(x.muid, y(left downto left-len(x.muid)+1)));
      left := left - len(x.muid);
      assign(y(left downto left-len(x.phimod)+1), vectorify(x.phimod, y(left downto left-len(x.phimod)+1)));
      left := left - len(x.phimod);
      assign(y(left downto left-len(x.sl_charge)+1), vectorify(x.sl_charge, y(left downto left-len(x.sl_charge)+1)));
      left := left - len(x.sl_charge);
      assign(y(left downto left-len(x.nswseg_poseta)+1), vectorify(x.nswseg_poseta, y(left downto left-len(x.nswseg_poseta)+1)));
      left := left - len(x.nswseg_poseta);
      assign(y(left downto left-len(x.nswseg_posphi)+1), vectorify(x.nswseg_posphi, y(left downto left-len(x.nswseg_posphi)+1)));
      left := left - len(x.nswseg_posphi);
      assign(y(left downto left-len(x.nswseg_angdtheta)+1), vectorify(x.nswseg_angdtheta, y(left downto left-len(x.nswseg_angdtheta)+1)));
    end if;
    return y;
  end function vectorify;
  function convert(x: mpl2csw_ptcalc_rt; t: std_logic_vector) return std_logic_vector is
    variable left : natural := t'left;
    variable y : std_logic_vector(t'range);
  begin
    if t'ascending then
      assign(y(left to left+len(x.data_valid)-1), convert(x.data_valid, y(left to left+len(x.data_valid)-1)));
      left := left + len(x.data_valid);
      assign(y(left to left+len(x.busy)-1), convert(x.busy, y(left to left+len(x.busy)-1)));
      left := left + len(x.busy);
      assign(y(left to left+len(x.process_ch)-1), convert(x.process_ch, y(left to left+len(x.process_ch)-1)));
      left := left + len(x.process_ch);
      assign(y(left to left+len(x.muid)-1), convert(x.muid, y(left to left+len(x.muid)-1)));
      left := left + len(x.muid);
      assign(y(left to left+len(x.phimod)-1), convert(x.phimod, y(left to left+len(x.phimod)-1)));
      left := left + len(x.phimod);
      assign(y(left to left+len(x.sl_charge)-1), convert(x.sl_charge, y(left to left+len(x.sl_charge)-1)));
      left := left + len(x.sl_charge);
      assign(y(left to left+len(x.nswseg_poseta)-1), convert(x.nswseg_poseta, y(left to left+len(x.nswseg_poseta)-1)));
      left := left + len(x.nswseg_poseta);
      assign(y(left to left+len(x.nswseg_posphi)-1), convert(x.nswseg_posphi, y(left to left+len(x.nswseg_posphi)-1)));
      left := left + len(x.nswseg_posphi);
      assign(y(left to left+len(x.nswseg_angdtheta)-1), convert(x.nswseg_angdtheta, y(left to left+len(x.nswseg_angdtheta)-1)));
    else
      assign(y(left downto left-len(x.data_valid)+1), convert(x.data_valid, y(left downto left-len(x.data_valid)+1)));
      left := left - len(x.data_valid);
      assign(y(left downto left-len(x.busy)+1), convert(x.busy, y(left downto left-len(x.busy)+1)));
      left := left - len(x.busy);
      assign(y(left downto left-len(x.process_ch)+1), convert(x.process_ch, y(left downto left-len(x.process_ch)+1)));
      left := left - len(x.process_ch);
      assign(y(left downto left-len(x.muid)+1), convert(x.muid, y(left downto left-len(x.muid)+1)));
      left := left - len(x.muid);
      assign(y(left downto left-len(x.phimod)+1), convert(x.phimod, y(left downto left-len(x.phimod)+1)));
      left := left - len(x.phimod);
      assign(y(left downto left-len(x.sl_charge)+1), convert(x.sl_charge, y(left downto left-len(x.sl_charge)+1)));
      left := left - len(x.sl_charge);
      assign(y(left downto left-len(x.nswseg_poseta)+1), convert(x.nswseg_poseta, y(left downto left-len(x.nswseg_poseta)+1)));
      left := left - len(x.nswseg_poseta);
      assign(y(left downto left-len(x.nswseg_posphi)+1), convert(x.nswseg_posphi, y(left downto left-len(x.nswseg_posphi)+1)));
      left := left - len(x.nswseg_posphi);
      assign(y(left downto left-len(x.nswseg_angdtheta)+1), convert(x.nswseg_angdtheta, y(left downto left-len(x.nswseg_angdtheta)+1)));
    end if;
    return y;
  end function convert;
  function structify(x: in std_logic_vector; t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt is
    variable y: mpl2csw_ptcalc_rt;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.data_valid := structify(x(left to left+len(y.data_valid)-1), y.data_valid);
      left := left + len(y.data_valid);
      y.busy := structify(x(left to left+len(y.busy)-1), y.busy);
      left := left + len(y.busy);
      y.process_ch := structify(x(left to left+len(y.process_ch)-1), y.process_ch);
      left := left + len(y.process_ch);
      y.muid := structify(x(left to left+len(y.muid)-1), y.muid);
      left := left + len(y.muid);
      y.phimod := structify(x(left to left+len(y.phimod)-1), y.phimod);
      left := left + len(y.phimod);
      y.sl_charge := structify(x(left to left+len(y.sl_charge)-1), y.sl_charge);
      left := left + len(y.sl_charge);
      y.nswseg_poseta := structify(x(left to left+len(y.nswseg_poseta)-1), y.nswseg_poseta);
      left := left + len(y.nswseg_poseta);
      y.nswseg_posphi := structify(x(left to left+len(y.nswseg_posphi)-1), y.nswseg_posphi);
      left := left + len(y.nswseg_posphi);
      y.nswseg_angdtheta := structify(x(left to left+len(y.nswseg_angdtheta)-1), y.nswseg_angdtheta);
    else
      y.data_valid := structify(x(left downto left-len(y.data_valid)+1), y.data_valid);
      left := left - len(y.data_valid);
      y.busy := structify(x(left downto left-len(y.busy)+1), y.busy);
      left := left - len(y.busy);
      y.process_ch := structify(x(left downto left-len(y.process_ch)+1), y.process_ch);
      left := left - len(y.process_ch);
      y.muid := structify(x(left downto left-len(y.muid)+1), y.muid);
      left := left - len(y.muid);
      y.phimod := structify(x(left downto left-len(y.phimod)+1), y.phimod);
      left := left - len(y.phimod);
      y.sl_charge := structify(x(left downto left-len(y.sl_charge)+1), y.sl_charge);
      left := left - len(y.sl_charge);
      y.nswseg_poseta := structify(x(left downto left-len(y.nswseg_poseta)+1), y.nswseg_poseta);
      left := left - len(y.nswseg_poseta);
      y.nswseg_posphi := structify(x(left downto left-len(y.nswseg_posphi)+1), y.nswseg_posphi);
      left := left - len(y.nswseg_posphi);
      y.nswseg_angdtheta := structify(x(left downto left-len(y.nswseg_angdtheta)+1), y.nswseg_angdtheta);
    end if;
    return y;
  end function structify;
  function convert(x: in std_logic_vector; t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt is
    variable y: mpl2csw_ptcalc_rt;
    variable left : natural := x'left;
  begin
    if x'ascending then
      y.data_valid := convert(x(left to left+len(y.data_valid)-1), y.data_valid);
      left := left + len(y.data_valid);
      y.busy := convert(x(left to left+len(y.busy)-1), y.busy);
      left := left + len(y.busy);
      y.process_ch := convert(x(left to left+len(y.process_ch)-1), y.process_ch);
      left := left + len(y.process_ch);
      y.muid := convert(x(left to left+len(y.muid)-1), y.muid);
      left := left + len(y.muid);
      y.phimod := convert(x(left to left+len(y.phimod)-1), y.phimod);
      left := left + len(y.phimod);
      y.sl_charge := convert(x(left to left+len(y.sl_charge)-1), y.sl_charge);
      left := left + len(y.sl_charge);
      y.nswseg_poseta := convert(x(left to left+len(y.nswseg_poseta)-1), y.nswseg_poseta);
      left := left + len(y.nswseg_poseta);
      y.nswseg_posphi := convert(x(left to left+len(y.nswseg_posphi)-1), y.nswseg_posphi);
      left := left + len(y.nswseg_posphi);
      y.nswseg_angdtheta := convert(x(left to left+len(y.nswseg_angdtheta)-1), y.nswseg_angdtheta);
    else
      y.data_valid := convert(x(left downto left-len(y.data_valid)+1), y.data_valid);
      left := left - len(y.data_valid);
      y.busy := convert(x(left downto left-len(y.busy)+1), y.busy);
      left := left - len(y.busy);
      y.process_ch := convert(x(left downto left-len(y.process_ch)+1), y.process_ch);
      left := left - len(y.process_ch);
      y.muid := convert(x(left downto left-len(y.muid)+1), y.muid);
      left := left - len(y.muid);
      y.phimod := convert(x(left downto left-len(y.phimod)+1), y.phimod);
      left := left - len(y.phimod);
      y.sl_charge := convert(x(left downto left-len(y.sl_charge)+1), y.sl_charge);
      left := left - len(y.sl_charge);
      y.nswseg_poseta := convert(x(left downto left-len(y.nswseg_poseta)+1), y.nswseg_poseta);
      left := left - len(y.nswseg_poseta);
      y.nswseg_posphi := convert(x(left downto left-len(y.nswseg_posphi)+1), y.nswseg_posphi);
      left := left - len(y.nswseg_posphi);
      y.nswseg_angdtheta := convert(x(left downto left-len(y.nswseg_angdtheta)+1), y.nswseg_angdtheta);
    end if;
    return y;
  end function convert;
  function nullify(t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt is
  variable y: mpl2csw_ptcalc_rt;
  begin
    y.data_valid := nullify(t.data_valid);
    y.busy := nullify(t.busy);
    y.process_ch := nullify(t.process_ch);
    y.muid := nullify(t.muid);
    y.phimod := nullify(t.phimod);
    y.sl_charge := nullify(t.sl_charge);
    y.nswseg_poseta := nullify(t.nswseg_poseta);
    y.nswseg_posphi := nullify(t.nswseg_posphi);
    y.nswseg_angdtheta := nullify(t.nswseg_angdtheta);
    return y;
  end function nullify;
  function zeroed(t: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt is
  variable y: mpl2csw_ptcalc_rt;
  begin
    y.data_valid := zeroed(t.data_valid);
    y.busy := zeroed(t.busy);
    y.process_ch := zeroed(t.process_ch);
    y.muid := zeroed(t.muid);
    y.phimod := zeroed(t.phimod);
    y.sl_charge := zeroed(t.sl_charge);
    y.nswseg_poseta := zeroed(t.nswseg_poseta);
    y.nswseg_posphi := zeroed(t.nswseg_posphi);
    y.nswseg_angdtheta := zeroed(t.nswseg_angdtheta);
    return y;
  end function zeroed;

  function len(x: mpl2csw_ptcalc_art) return natural is
    variable l : natural := 0;
  begin
    l := x'length * len(x(x'left));
    return l;
  end function len;
  function width(x: mpl2csw_ptcalc_art) return natural is
    variable l : natural := 0;
  begin
    l := x'length * width(x(x'left));
    return l;
  end function width;
  function vectorify(x: mpl2csw_ptcalc_art; t: std_logic_vector) return std_logic_vector is
    variable y : std_logic_vector(t'range);
    constant l :  integer := len(x(x'right));
    variable a :  integer;
    variable b :  integer;
  begin
    if t'ascending then
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(b to a), vectorify(x(i), y(b to a)));
      end loop;
    else
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(a downto b), vectorify(x(i), y(a downto b)));
      end loop;
    end if;
    return y;
  end function vectorify;
  function convert(x: mpl2csw_ptcalc_art; t: std_logic_vector) return std_logic_vector is
    variable y : std_logic_vector(t'range);
    constant l :  integer := len(x(x'right));
    variable a :  integer;
    variable b :  integer;
  begin
    if t'ascending then
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(b to a), convert(x(i), y(b to a)));
      end loop;
    else
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(a downto b), convert(x(i), y(a downto b)));
      end loop;
    end if;
    return y;
  end function convert;
  function structify(x: std_logic_vector; t: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art is
    variable y : mpl2csw_ptcalc_art(t'range);
    constant l :  integer := len(y(y'left));
    variable a :  integer;
    variable b :  integer;
  begin
    if x'ascending then
      for i in y'range loop
        a := l*i + x'low + l - 1;
        b := l*i + x'low;
        y(i) := structify(x(b to a), y(i));
      end loop;
    else
      for i in y'range loop
        a := l*i + x'low + l-1;
        b := l*i + x'low;
        y(i) := structify(x(a downto b), y(i));
      end loop;
    end if;
    return y;
  end function structify;
  function convert(x: std_logic_vector; t: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art is
    variable y : mpl2csw_ptcalc_art(t'range);
    constant l :  integer := len(y(y'left));
    variable a :  integer;
    variable b :  integer;
  begin
    if x'ascending then
      for i in y'range loop
        a := l*i + x'low + l - 1;
        b := l*i + x'low;
        y(i) := convert(x(b to a), y(i));
      end loop;
    else
      for i in y'range loop
        a := l*i + x'low + l-1;
        b := l*i + x'low;
        y(i) := convert(x(a downto b), y(i));
      end loop;
    end if;
    return y;
  end function convert;
  function nullify(x: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art is
    variable y : mpl2csw_ptcalc_art(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(y(i));
    end loop l;
    return y;
  end function nullify;
  function zeroed(x: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art is
    variable y : mpl2csw_ptcalc_art(x'range);
  begin
    l: for i in y'range loop
      y(i) := zeroed(y(i));
    end loop l;
    return y;
  end function zeroed;

  function len(x: mpl2csw_ptcalc_avt) return natural is
    variable l : natural := 0;
  begin
    l := x'length * len(x(x'left));
    return l;
  end function len;
  function width(x: mpl2csw_ptcalc_avt) return natural is
    variable l : natural := 0;
  begin
    l := x'length * width(x(x'left));
    return l;
  end function width;
  function vectorify(x: mpl2csw_ptcalc_avt; t: std_logic_vector) return std_logic_vector is
    variable y : std_logic_vector(t'range);
    constant l :  integer := len(x(x'right));
    variable a :  integer;
    variable b :  integer;
  begin
    if t'ascending then
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(b to a), vectorify(x(i), y(b to a)));
      end loop;
    else
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(a downto b), vectorify(x(i), y(a downto b)));
      end loop;
    end if;
    return y;
  end function vectorify;
  function convert(x: mpl2csw_ptcalc_avt; t: std_logic_vector) return std_logic_vector is
    variable y : std_logic_vector(t'range);
    constant l :  integer := len(x(x'right));
    variable a :  integer;
    variable b :  integer;
  begin
    if t'ascending then
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(b to a), convert(x(i), y(b to a)));
      end loop;
    else
      for i in x'range loop
        a := l*i + y'low + l - 1;
        b := l*i + y'low;
        assign(y(a downto b), convert(x(i), y(a downto b)));
      end loop;
    end if;
    return y;
  end function convert;
  function structify(x: std_logic_vector; t: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt is
    variable y : mpl2csw_ptcalc_avt(t'range);
    constant l :  integer := len(y(y'left));
    variable a :  integer;
    variable b :  integer;
  begin
    if x'ascending then
      for i in y'range loop
        a := l*i + x'low + l - 1;
        b := l*i + x'low;
        y(i) := structify(x(b to a), y(i));
      end loop;
    else
      for i in y'range loop
        a := l*i + x'low + l-1;
        b := l*i + x'low;
        y(i) := structify(x(a downto b), y(i));
      end loop;
    end if;
    return y;
  end function structify;
  function convert(x: std_logic_vector; t: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt is
    variable y : mpl2csw_ptcalc_avt(t'range);
    constant l :  integer := len(y(y'left));
    variable a :  integer;
    variable b :  integer;
  begin
    if x'ascending then
      for i in y'range loop
        a := l*i + x'low + l - 1;
        b := l*i + x'low;
        y(i) := convert(x(b to a), y(i));
      end loop;
    else
      for i in y'range loop
        a := l*i + x'low + l-1;
        b := l*i + x'low;
        y(i) := convert(x(a downto b), y(i));
      end loop;
    end if;
    return y;
  end function convert;
  function nullify(x: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt is
    variable y : mpl2csw_ptcalc_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(y(i));
    end loop l;
    return y;
  end function nullify;
  function zeroed(x: mpl2csw_ptcalc_avt) return mpl2csw_ptcalc_avt is
    variable y : mpl2csw_ptcalc_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := zeroed(y(i));
    end loop l;
    return y;
  end function zeroed;

end package body mpl_pkg;
