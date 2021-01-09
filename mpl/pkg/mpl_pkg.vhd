library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

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
  constant MPL2CSW_PTCALC_LEN : integer := 63;
  subtype mpl2csw_ptcalc_rvt is std_logic_vector(MPL2CSW_PTCALC_LEN-1 downto 0);
  function vectorify(x: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rvt;
  function structify(x: mpl2csw_ptcalc_rvt) return mpl2csw_ptcalc_rt;
  function nullify(x: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt;

  type mpl2csw_ptcalc_bus_at is array(integer range <>) of mpl2csw_ptcalc_rt;
  type mpl2csw_ptcalc_bus_avt is array(integer range <>) of mpl2csw_ptcalc_rvt;
  function vectorify(x: mpl2csw_ptcalc_bus_at) return mpl2csw_ptcalc_bus_avt;
  function vectorify(x: mpl2csw_ptcalc_bus_at) return std_logic_vector;
  function structify(x: mpl2csw_ptcalc_bus_avt) return mpl2csw_ptcalc_bus_at;
  function structify(x: std_logic_vector) return mpl2csw_ptcalc_bus_at;
  function nullify(x: mpl2csw_ptcalc_bus_at) return mpl2csw_ptcalc_bus_at;
  function nullify(x: mpl2csw_ptcalc_bus_avt) return mpl2csw_ptcalc_bus_avt;

  constant MPL_PL_A_LATENCY : integer := 10;

  constant MPL_PL_B_LATENCY : integer := 5;

end package mpl_pkg;

------------------------------------------------------------

package body mpl_pkg is

  function vectorify(x: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rvt is
    variable y : mpl2csw_ptcalc_rvt;
  begin
    y(62 downto 62)            := vectorify(x.data_valid);
    y(61 downto 61)            := vectorify(x.busy);
    y(60 downto 57)            := vectorify(x.process_ch);
    y(56 downto 36)            := vectorify(x.muid);
    y(35 downto 28)            := vectorify(x.phimod);
    y(27 downto 27)            := vectorify(x.sl_charge);
    y(26 downto 13)            := vectorify(x.nswseg_poseta);
    y(12 downto 5)             := vectorify(x.nswseg_posphi);
    y(4 downto 0)              := vectorify(x.nswseg_angdtheta);
    return y;
  end function vectorify;
  function structify(x: mpl2csw_ptcalc_rvt) return mpl2csw_ptcalc_rt is
    variable y : mpl2csw_ptcalc_rt;
  begin
    y.data_valid               := structify(x(62 downto 62));
    y.busy                     := structify(x(61 downto 61));
    y.process_ch               := structify(x(60 downto 57));
    y.muid                     := structify(x(56 downto 36));
    y.phimod                   := structify(x(35 downto 28));
    y.sl_charge                := structify(x(27 downto 27));
    y.nswseg_poseta            := structify(x(26 downto 13));
    y.nswseg_posphi            := structify(x(12 downto 5));
    y.nswseg_angdtheta         := structify(x(4 downto 0));
    return y;
  end function structify;
  function nullify(x: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt is
    variable y : mpl2csw_ptcalc_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.busy                     := nullify(x.busy);
    y.process_ch               := nullify(x.process_ch);
    y.muid                     := nullify(x.muid);
    y.phimod                   := nullify(x.phimod);
    y.sl_charge                := nullify(x.sl_charge);
    y.nswseg_poseta            := nullify(x.nswseg_poseta);
    y.nswseg_posphi            := nullify(x.nswseg_posphi);
    y.nswseg_angdtheta         := nullify(x.nswseg_angdtheta);
    return y;
  end function nullify;

  function vectorify(x: mpl2csw_ptcalc_bus_at) return mpl2csw_ptcalc_bus_avt is
    variable y :  mpl2csw_ptcalc_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mpl2csw_ptcalc_bus_at) return std_logic_vector is
    variable msb : integer := x'length*63-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-63+1) := vectorify(x(i));
      msb := msb - 63;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mpl2csw_ptcalc_bus_avt) return mpl2csw_ptcalc_bus_at is
    variable y :  mpl2csw_ptcalc_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mpl2csw_ptcalc_bus_at is
    variable y :  mpl2csw_ptcalc_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-63+1));
      msb := msb - 63;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mpl2csw_ptcalc_bus_at) return mpl2csw_ptcalc_bus_at is
    variable y :  mpl2csw_ptcalc_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mpl2csw_ptcalc_bus_avt) return mpl2csw_ptcalc_bus_avt is
    variable y :  mpl2csw_ptcalc_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body mpl_pkg;
