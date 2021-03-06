-- This file was auto-generated by YML2HDL toll.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.sl2mdt_constants_pkg.all;

package sl2mdt_dataformats_pkg is

  type SL2MDT_header_rt is record
    h_reserved : std_logic_vector(SL2MDT_HEADER_H_RESERVED_LEN-1 downto 0);
    tcoverflow : std_logic;
    nmtc_sl : unsigned(SL2MDT_HEADER_NMTC_SL_LEN-1 downto 0);
    nmtc_mdt : unsigned(SL2MDT_HEADER_NMTC_MDT_LEN-1 downto 0);
    nslc : unsigned(SL2MDT_HEADER_NSLC_SLC_LEN-1 downto 0);
    bcid : unsigned(SL2MDT_HEADER_BCID_LEN-1 downto 0);
  end record SL2MDT_header_rt;
  constant SL2MDT_HEADER_LEN : integer := 32;
  subtype SL2MDT_header_rvt is std_logic_vector(SL2MDT_HEADER_LEN-1 downto 0);
  function vectorify(x: SL2MDT_header_rt) return SL2MDT_header_rvt;
  function structify(x: SL2MDT_header_rvt) return SL2MDT_header_rt;
  function nullify(x: SL2MDT_header_rt) return SL2MDT_header_rt;

  type SL2MDT_trailer_rt is record
    t_reserved : std_logic_vector(SL2MDT_TRAILER_T_RESERVED_LEN-1 downto 0);
    crc : std_logic_vector(SL2MDT_TRAILER_CRC_LEN-1 downto 0);
    fiberid : unsigned(SL2MDT_TRAILER_FIBERID_LEN-1 downto 0);
    slid : unsigned(SL2MDT_TRAILER_SLID_LEN-1 downto 0);
    comma : std_logic_vector(SL2MDT_TRAILER_COMMA_LEN-1 downto 0);
  end record SL2MDT_trailer_rt;
  constant SL2MDT_TRAILER_LEN : integer := 32;
  subtype SL2MDT_trailer_rvt is std_logic_vector(SL2MDT_TRAILER_LEN-1 downto 0);
  function vectorify(x: SL2MDT_trailer_rt) return SL2MDT_trailer_rvt;
  function structify(x: SL2MDT_trailer_rvt) return SL2MDT_trailer_rt;
  function nullify(x: SL2MDT_trailer_rt) return SL2MDT_trailer_rt;

  type SL2MDT_slc_common_rt is record
    header : SL2MDT_header_rt;
    slcid : unsigned(SL2MDT_SLC_COMMON_SLCID_LEN-1 downto 0);
    tcsent : std_logic;
    poseta : signed(SL2MDT_SLC_COMMON_POSETA_LEN-1 downto 0);
    posphi : unsigned(SL2MDT_SLC_COMMON_POSPHI_LEN-1 downto 0);
    SL2MDT_pt : unsigned(SL2MDT_SLC_COMMON_SL_PT_LEN-1 downto 0);
    SL2MDT_ptthresh : unsigned(SL2MDT_SLC_COMMON_SL_PTTHRESH_LEN-1 downto 0);
    SL2MDT_charge : std_logic;
    cointype : std_logic_vector(SL2MDT_SLC_COMMON_COINTYPE_LEN-1 downto 0);
    trailer : SL2MDT_trailer_rt;
  end record SL2MDT_slc_common_rt;
  constant SL2MDT_SLC_COMMON_LEN : integer := 107;
  subtype SL2MDT_slc_common_rvt is std_logic_vector(SL2MDT_SLC_COMMON_LEN-1 downto 0);
  function vectorify(x: SL2MDT_slc_common_rt) return SL2MDT_slc_common_rvt;
  function structify(x: SL2MDT_slc_common_rvt) return SL2MDT_slc_common_rt;
  function nullify(x: SL2MDT_slc_common_rt) return SL2MDT_slc_common_rt;

  type SL2MDT_slc_endcap_rt is record
    e_reserved : std_logic_vector(SL2MDT_SLC_ENDCAP_E_RESERVED_LEN-1 downto 0);
    nswseg_mon : std_logic;
    nswseg_angdtheta : signed(SL2MDT_SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN-1 downto 0);
    nswseg_posphi : unsigned(SL2MDT_SLC_ENDCAP_NSWSEG_POSPHI_LEN-1 downto 0);
    nswseg_poseta : unsigned(SL2MDT_SLC_ENDCAP_NSWSEG_POSETA_LEN-1 downto 0);
    seg_angdphi : signed(SL2MDT_SLC_ENDCAP_SEG_ANGDPHI_LEN-1 downto 0);
    seg_angdtheta : signed(SL2MDT_SLC_ENDCAP_SEG_ANGDTHETA_LEN-1 downto 0);
  end record SL2MDT_slc_endcap_rt;
  constant SL2MDT_SLC_ENDCAP_LEN : integer := 85;
  subtype SL2MDT_slc_endcap_rvt is std_logic_vector(SL2MDT_SLC_ENDCAP_LEN-1 downto 0);
  function vectorify(x: SL2MDT_slc_endcap_rt) return SL2MDT_slc_endcap_rvt;
  function structify(x: SL2MDT_slc_endcap_rvt) return SL2MDT_slc_endcap_rt;
  function nullify(x: SL2MDT_slc_endcap_rt) return SL2MDT_slc_endcap_rt;

  type SL2MDT_slc_barrel_rt is record
    b_reserved : std_logic_vector(SL2MDT_SLC_BARREL_B_RESERVED_LEN-1 downto 0);
    rpc3_posz : signed(SL2MDT_SLC_BARREL_RPC3_POSZ_LEN-1 downto 0);
    rpc2_posz : signed(SL2MDT_SLC_BARREL_RPC2_POSZ_LEN-1 downto 0);
    rpc1_posz : signed(SL2MDT_SLC_BARREL_RPC1_POSZ_LEN-1 downto 0);
    rpc0_posz : signed(SL2MDT_SLC_BARREL_RPC0_POSZ_LEN-1 downto 0);
  end record SL2MDT_slc_barrel_rt;
  constant SL2MDT_SLC_BARREL_LEN : integer := 85;
  subtype SL2MDT_slc_barrel_rvt is std_logic_vector(SL2MDT_SLC_BARREL_LEN-1 downto 0);
  function vectorify(x: SL2MDT_slc_barrel_rt) return SL2MDT_slc_barrel_rvt;
  function structify(x: SL2MDT_slc_barrel_rvt) return SL2MDT_slc_barrel_rt;
  function nullify(x: SL2MDT_slc_barrel_rt) return SL2MDT_slc_barrel_rt;

  type SL2MDT_slc_rx_rt is record
    data_valid : std_logic;
    common : SL2MDT_slc_common_rt;
    specific : std_logic_vector(SL2MDT_SLC_RX_SPECIFIC_LEN-1 downto 0);
  end record SL2MDT_slc_rx_rt;
  constant SL2MDT_SLC_RX_LEN : integer := 193;
  subtype SL2MDT_slc_rx_rvt is std_logic_vector(SL2MDT_SLC_RX_LEN-1 downto 0);
  function vectorify(x: SL2MDT_slc_rx_rt) return SL2MDT_slc_rx_rvt;
  function structify(x: SL2MDT_slc_rx_rvt) return SL2MDT_slc_rx_rt;
  function nullify(x: SL2MDT_slc_rx_rt) return SL2MDT_slc_rx_rt;

  type SL2MDT_slc_rx_bus_at is array(integer range <>) of SL2MDT_slc_rx_rt;
  type SL2MDT_slc_rx_bus_avt is array(integer range <>) of SL2MDT_slc_rx_rvt;
  function vectorify(x: SL2MDT_slc_rx_bus_at) return SL2MDT_slc_rx_bus_avt;
  function vectorify(x: SL2MDT_slc_rx_bus_at) return std_logic_vector;
  function structify(x: SL2MDT_slc_rx_bus_avt) return SL2MDT_slc_rx_bus_at;
  function structify(x: std_logic_vector) return SL2MDT_slc_rx_bus_at;
  function nullify(x: SL2MDT_slc_rx_bus_at) return SL2MDT_slc_rx_bus_at;
  function nullify(x: SL2MDT_slc_rx_bus_avt) return SL2MDT_slc_rx_bus_avt;

  type SL2MDT_slc_endcap_bus_at is array(integer range <>) of SL2MDT_slc_endcap_rt;
  type SL2MDT_slc_endcap_bus_avt is array(integer range <>) of SL2MDT_slc_endcap_rvt;
  function vectorify(x: SL2MDT_slc_endcap_bus_at) return SL2MDT_slc_endcap_bus_avt;
  function vectorify(x: SL2MDT_slc_endcap_bus_at) return std_logic_vector;
  function structify(x: SL2MDT_slc_endcap_bus_avt) return SL2MDT_slc_endcap_bus_at;
  function structify(x: std_logic_vector) return SL2MDT_slc_endcap_bus_at;
  function nullify(x: SL2MDT_slc_endcap_bus_at) return SL2MDT_slc_endcap_bus_at;
  function nullify(x: SL2MDT_slc_endcap_bus_avt) return SL2MDT_slc_endcap_bus_avt;

  type SL2MDT_slc_muid_rt is record
    slcid : unsigned(SL2MDT_SLC_COMMON_SLCID_LEN-1 downto 0);
    slid : unsigned(SL2MDT_TRAILER_SLID_LEN-1 downto 0);
    bcid : unsigned(SL2MDT_HEADER_BCID_LEN-1 downto 0);
  end record SL2MDT_slc_muid_rt;
  constant SL2MDT_SLC_MUID_LEN : integer := 21;
  subtype SL2MDT_slc_muid_rvt is std_logic_vector(SL2MDT_SLC_MUID_LEN-1 downto 0);
  function vectorify(x: SL2MDT_slc_muid_rt) return SL2MDT_slc_muid_rvt;
  function structify(x: SL2MDT_slc_muid_rvt) return SL2MDT_slc_muid_rt;
  function nullify(x: SL2MDT_slc_muid_rt) return SL2MDT_slc_muid_rt;

  type vec_mdtid_rt is record
    chamber_id : unsigned(VEC_MDTID_CHAMBER_ID_LEN-1 downto 0);
    chamber_ieta : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
  end record vec_mdtid_rt;
  constant VEC_MDTID_LEN : integer := 9;
  subtype vec_mdtid_rvt is std_logic_vector(VEC_MDTID_LEN-1 downto 0);
  function vectorify(x: vec_mdtid_rt) return vec_mdtid_rvt;
  function structify(x: vec_mdtid_rvt) return vec_mdtid_rt;
  function nullify(x: vec_mdtid_rt) return vec_mdtid_rt;

end package sl2mdt_dataformats_pkg;

------------------------------------------------------------

package body sl2mdt_dataformats_pkg is

  function vectorify(x: SL2MDT_header_rt) return SL2MDT_header_rvt is
    variable y : SL2MDT_header_rvt;
  begin
    y(31 downto 22)            := vectorify(x.h_reserved);
    y(21 downto 21)            := vectorify(x.tcoverflow);
    y(20 downto 18)            := vectorify(x.nmtc_sl);
    y(17 downto 15)            := vectorify(x.nmtc_mdt);
    y(14 downto 12)            := vectorify(x.nslc);
    y(11 downto 0)             := vectorify(x.bcid);
    return y;
  end function vectorify;
  function structify(x: SL2MDT_header_rvt) return SL2MDT_header_rt is
    variable y : SL2MDT_header_rt;
  begin
    y.h_reserved               := structify(x(31 downto 22));
    y.tcoverflow               := structify(x(21 downto 21));
    y.nmtc_sl                  := structify(x(20 downto 18));
    y.nmtc_mdt                 := structify(x(17 downto 15));
    y.nslc                     := structify(x(14 downto 12));
    y.bcid                     := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: SL2MDT_header_rt) return SL2MDT_header_rt is
    variable y : SL2MDT_header_rt;
  begin
    y.h_reserved               := nullify(x.h_reserved);
    y.tcoverflow               := nullify(x.tcoverflow);
    y.nmtc_sl                  := nullify(x.nmtc_sl);
    y.nmtc_mdt                 := nullify(x.nmtc_mdt);
    y.nslc                     := nullify(x.nslc);
    y.bcid                     := nullify(x.bcid);
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_trailer_rt) return SL2MDT_trailer_rvt is
    variable y : SL2MDT_trailer_rvt;
  begin
    y(31 downto 26)            := vectorify(x.t_reserved);
    y(25 downto 18)            := vectorify(x.crc);
    y(17 downto 14)            := vectorify(x.fiberid);
    y(13 downto 8)             := vectorify(x.slid);
    y(7 downto 0)              := vectorify(x.comma);
    return y;
  end function vectorify;
  function structify(x: SL2MDT_trailer_rvt) return SL2MDT_trailer_rt is
    variable y : SL2MDT_trailer_rt;
  begin
    y.t_reserved               := structify(x(31 downto 26));
    y.crc                      := structify(x(25 downto 18));
    y.fiberid                  := structify(x(17 downto 14));
    y.slid                     := structify(x(13 downto 8));
    y.comma                    := structify(x(7 downto 0));
    return y;
  end function structify;
  function nullify(x: SL2MDT_trailer_rt) return SL2MDT_trailer_rt is
    variable y : SL2MDT_trailer_rt;
  begin
    y.t_reserved               := nullify(x.t_reserved);
    y.crc                      := nullify(x.crc);
    y.fiberid                  := nullify(x.fiberid);
    y.slid                     := nullify(x.slid);
    y.comma                    := nullify(x.comma);
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_slc_common_rt) return SL2MDT_slc_common_rvt is
    variable y : SL2MDT_slc_common_rvt;
  begin
    y(106 downto 75)           := vectorify(x.header);
    y(74 downto 72)            := vectorify(x.slcid);
    y(71 downto 71)            := vectorify(x.tcsent);
    y(70 downto 57)            := vectorify(x.poseta);
    y(56 downto 48)            := vectorify(x.posphi);
    y(47 downto 40)            := vectorify(x.SL2MDT_pt);
    y(39 downto 36)            := vectorify(x.SL2MDT_ptthresh);
    y(35 downto 35)            := vectorify(x.SL2MDT_charge);
    y(34 downto 32)            := vectorify(x.cointype);
    y(31 downto 0)             := vectorify(x.trailer);
    return y;
  end function vectorify;
  function structify(x: SL2MDT_slc_common_rvt) return SL2MDT_slc_common_rt is
    variable y : SL2MDT_slc_common_rt;
  begin
    y.header                   := structify(x(106 downto 75));
    y.slcid                    := structify(x(74 downto 72));
    y.tcsent                   := structify(x(71 downto 71));
    y.poseta                   := structify(x(70 downto 57));
    y.posphi                   := structify(x(56 downto 48));
    y.SL2MDT_pt                := structify(x(47 downto 40));
    y.SL2MDT_ptthresh          := structify(x(39 downto 36));
    y.SL2MDT_charge            := structify(x(35 downto 35));
    y.cointype                 := structify(x(34 downto 32));
    y.trailer                  := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: SL2MDT_slc_common_rt) return SL2MDT_slc_common_rt is
    variable y : SL2MDT_slc_common_rt;
  begin
    y.header                   := nullify(x.header);
    y.slcid                    := nullify(x.slcid);
    y.tcsent                   := nullify(x.tcsent);
    y.poseta                   := nullify(x.poseta);
    y.posphi                   := nullify(x.posphi);
    y.SL2MDT_pt                := nullify(x.SL2MDT_pt);
    y.SL2MDT_ptthresh          := nullify(x.SL2MDT_ptthresh);
    y.SL2MDT_charge            := nullify(x.SL2MDT_charge);
    y.cointype                 := nullify(x.cointype);
    y.trailer                  := nullify(x.trailer);
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_slc_endcap_rt) return SL2MDT_slc_endcap_rvt is
    variable y : SL2MDT_slc_endcap_rvt;
  begin
    y(84 downto 39)            := vectorify(x.e_reserved);
    y(38 downto 38)            := vectorify(x.nswseg_mon);
    y(37 downto 33)            := vectorify(x.nswseg_angdtheta);
    y(32 downto 25)            := vectorify(x.nswseg_posphi);
    y(24 downto 11)            := vectorify(x.nswseg_poseta);
    y(10 downto 7)             := vectorify(x.seg_angdphi);
    y(6 downto 0)              := vectorify(x.seg_angdtheta);
    return y;
  end function vectorify;
  function structify(x: SL2MDT_slc_endcap_rvt) return SL2MDT_slc_endcap_rt is
    variable y : SL2MDT_slc_endcap_rt;
  begin
    y.e_reserved               := structify(x(84 downto 39));
    y.nswseg_mon               := structify(x(38 downto 38));
    y.nswseg_angdtheta         := structify(x(37 downto 33));
    y.nswseg_posphi            := structify(x(32 downto 25));
    y.nswseg_poseta            := structify(x(24 downto 11));
    y.seg_angdphi              := structify(x(10 downto 7));
    y.seg_angdtheta            := structify(x(6 downto 0));
    return y;
  end function structify;
  function nullify(x: SL2MDT_slc_endcap_rt) return SL2MDT_slc_endcap_rt is
    variable y : SL2MDT_slc_endcap_rt;
  begin
    y.e_reserved               := nullify(x.e_reserved);
    y.nswseg_mon               := nullify(x.nswseg_mon);
    y.nswseg_angdtheta         := nullify(x.nswseg_angdtheta);
    y.nswseg_posphi            := nullify(x.nswseg_posphi);
    y.nswseg_poseta            := nullify(x.nswseg_poseta);
    y.seg_angdphi              := nullify(x.seg_angdphi);
    y.seg_angdtheta            := nullify(x.seg_angdtheta);
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_slc_barrel_rt) return SL2MDT_slc_barrel_rvt is
    variable y : SL2MDT_slc_barrel_rvt;
  begin
    y(84 downto 48)            := vectorify(x.b_reserved);
    y(47 downto 36)            := vectorify(x.rpc3_posz);
    y(35 downto 24)            := vectorify(x.rpc2_posz);
    y(23 downto 12)            := vectorify(x.rpc1_posz);
    y(11 downto 0)             := vectorify(x.rpc0_posz);
    return y;
  end function vectorify;
  function structify(x: SL2MDT_slc_barrel_rvt) return SL2MDT_slc_barrel_rt is
    variable y : SL2MDT_slc_barrel_rt;
  begin
    y.b_reserved               := structify(x(84 downto 48));
    y.rpc3_posz                := structify(x(47 downto 36));
    y.rpc2_posz                := structify(x(35 downto 24));
    y.rpc1_posz                := structify(x(23 downto 12));
    y.rpc0_posz                := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: SL2MDT_slc_barrel_rt) return SL2MDT_slc_barrel_rt is
    variable y : SL2MDT_slc_barrel_rt;
  begin
    y.b_reserved               := nullify(x.b_reserved);
    y.rpc3_posz                := nullify(x.rpc3_posz);
    y.rpc2_posz                := nullify(x.rpc2_posz);
    y.rpc1_posz                := nullify(x.rpc1_posz);
    y.rpc0_posz                := nullify(x.rpc0_posz);
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_slc_rx_rt) return SL2MDT_slc_rx_rvt is
    variable y : SL2MDT_slc_rx_rvt;
  begin
    y(192 downto 192)          := vectorify(x.data_valid);
    y(191 downto 85)           := vectorify(x.common);
    y(84 downto 0)             := vectorify(x.specific);
    return y;
  end function vectorify;
  function structify(x: SL2MDT_slc_rx_rvt) return SL2MDT_slc_rx_rt is
    variable y : SL2MDT_slc_rx_rt;
  begin
    y.data_valid               := structify(x(192 downto 192));
    y.common                   := structify(x(191 downto 85));
    y.specific                 := structify(x(84 downto 0));
    return y;
  end function structify;
  function nullify(x: SL2MDT_slc_rx_rt) return SL2MDT_slc_rx_rt is
    variable y : SL2MDT_slc_rx_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.common                   := nullify(x.common);
    y.specific                 := nullify(x.specific);
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_slc_rx_bus_at) return SL2MDT_slc_rx_bus_avt is
    variable y :  SL2MDT_slc_rx_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: SL2MDT_slc_rx_bus_at) return std_logic_vector is
    variable msb : integer := x'length*193-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-193+1) := vectorify(x(i));
      msb := msb - 193;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: SL2MDT_slc_rx_bus_avt) return SL2MDT_slc_rx_bus_at is
    variable y :  SL2MDT_slc_rx_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return SL2MDT_slc_rx_bus_at is
    variable y :  SL2MDT_slc_rx_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193+1));
      msb := msb - 193;
    end loop l;
    return y;
  end function structify;
  function nullify(x: SL2MDT_slc_rx_bus_at) return SL2MDT_slc_rx_bus_at is
    variable y :  SL2MDT_slc_rx_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: SL2MDT_slc_rx_bus_avt) return SL2MDT_slc_rx_bus_avt is
    variable y :  SL2MDT_slc_rx_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_slc_endcap_bus_at) return SL2MDT_slc_endcap_bus_avt is
    variable y :  SL2MDT_slc_endcap_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: SL2MDT_slc_endcap_bus_at) return std_logic_vector is
    variable msb : integer := x'length*85-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-85+1) := vectorify(x(i));
      msb := msb - 85;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: SL2MDT_slc_endcap_bus_avt) return SL2MDT_slc_endcap_bus_at is
    variable y :  SL2MDT_slc_endcap_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return SL2MDT_slc_endcap_bus_at is
    variable y :  SL2MDT_slc_endcap_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-85+1));
      msb := msb - 85;
    end loop l;
    return y;
  end function structify;
  function nullify(x: SL2MDT_slc_endcap_bus_at) return SL2MDT_slc_endcap_bus_at is
    variable y :  SL2MDT_slc_endcap_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: SL2MDT_slc_endcap_bus_avt) return SL2MDT_slc_endcap_bus_avt is
    variable y :  SL2MDT_slc_endcap_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: SL2MDT_slc_muid_rt) return SL2MDT_slc_muid_rvt is
    variable y : SL2MDT_slc_muid_rvt;
  begin
    y(20 downto 18)            := vectorify(x.slcid);
    y(17 downto 12)            := vectorify(x.slid);
    y(11 downto 0)             := vectorify(x.bcid);
    return y;
  end function vectorify;
  function structify(x: SL2MDT_slc_muid_rvt) return SL2MDT_slc_muid_rt is
    variable y : SL2MDT_slc_muid_rt;
  begin
    y.slcid                    := structify(x(20 downto 18));
    y.slid                     := structify(x(17 downto 12));
    y.bcid                     := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: SL2MDT_slc_muid_rt) return SL2MDT_slc_muid_rt is
    variable y : SL2MDT_slc_muid_rt;
  begin
    y.slcid                    := nullify(x.slcid);
    y.slid                     := nullify(x.slid);
    y.bcid                     := nullify(x.bcid);
    return y;
  end function nullify;

  function vectorify(x: vec_mdtid_rt) return vec_mdtid_rvt is
    variable y : vec_mdtid_rvt;
  begin
    y(8 downto 4)              := vectorify(x.chamber_id);
    y(3 downto 0)              := vectorify(x.chamber_ieta);
    return y;
  end function vectorify;
  function structify(x: vec_mdtid_rvt) return vec_mdtid_rt is
    variable y : vec_mdtid_rt;
  begin
    y.chamber_id               := structify(x(8 downto 4));
    y.chamber_ieta             := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify(x: vec_mdtid_rt) return vec_mdtid_rt is
    variable y : vec_mdtid_rt;
  begin
    y.chamber_id               := nullify(x.chamber_id);
    y.chamber_ieta             := nullify(x.chamber_ieta);
    return y;
  end function nullify;

end package body sl2mdt_dataformats_pkg;
