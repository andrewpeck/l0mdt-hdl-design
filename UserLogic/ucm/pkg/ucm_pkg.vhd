-- This file was auto-generated by YML2HDL toll.
-- https://gitlab.com/tcpaiva/yml2hdl

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

package ucm_pkg is

  constant SLC_SPECIFIC_LEN : integer := 48;

  constant UCM_PHIMOD_LEN : integer := 5;

  type ucm_prepro2ctrl_rt is record
    data_valid : std_logic;
  end record ucm_prepro2ctrl_rt;
  constant UCM_PREPRO2CTRL_LEN : integer := 1;
  subtype ucm_prepro2ctrl_rvt is std_logic_vector(UCM_PREPRO2CTRL_LEN-1 downto 0);
  function vectorify(x: ucm_prepro2ctrl_rt) return ucm_prepro2ctrl_rvt;
  function structify(x: ucm_prepro2ctrl_rvt) return ucm_prepro2ctrl_rt;
  function nullify(x: ucm_prepro2ctrl_rt) return ucm_prepro2ctrl_rt;

  type ucm_prepro2ctrl_bus_at is array(integer range <>) of ucm_prepro2ctrl_rt;
  type ucm_prepro2ctrl_bus_avt is array(integer range <>) of ucm_prepro2ctrl_rvt;
  function vectorify(x: ucm_prepro2ctrl_bus_at) return ucm_prepro2ctrl_bus_avt;
  function vectorify(x: ucm_prepro2ctrl_bus_at) return std_logic_vector;
  function structify(x: ucm_prepro2ctrl_bus_avt) return ucm_prepro2ctrl_bus_at;
  function structify(x: std_logic_vector) return ucm_prepro2ctrl_bus_at;
  function nullify(x: ucm_prepro2ctrl_bus_at) return ucm_prepro2ctrl_bus_at;
  function nullify(x: ucm_prepro2ctrl_bus_avt) return ucm_prepro2ctrl_bus_avt;

  subtype chamb_ieta_rpc_t is unsigned(4-1 downto 0);

  type chamb_ieta_rpc_bus_at is array(4-1 downto 0) of chamb_ieta_rpc_t;
  type chamb_ieta_rpc_bus_avt is array(4-1 downto 0) of std_logic_vector(4-1 downto 0);
  function vectorify(x: chamb_ieta_rpc_bus_at) return chamb_ieta_rpc_bus_avt;
  function vectorify(x: chamb_ieta_rpc_bus_at) return std_logic_vector;
  function structify(x: chamb_ieta_rpc_bus_avt) return chamb_ieta_rpc_bus_at;
  function structify(x: std_logic_vector) return chamb_ieta_rpc_bus_at;
  function nullify(x: chamb_ieta_rpc_bus_at) return chamb_ieta_rpc_bus_at;
  function nullify(x: chamb_ieta_rpc_bus_avt) return chamb_ieta_rpc_bus_avt;

  type ucm_cde_rt is record
    muid : slc_muid_rt;
    chamb_ieta : chamb_ieta_rpc_bus_at;
    cointype : std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    posphi : unsigned(SLC_COMMON_POSPHI_LEN-1 downto 0);
    phimod : signed(UCM2PL_PHIMOD_LEN-1 downto 0);
    specific : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    data_valid : std_logic;
  end record ucm_cde_rt;
  constant UCM_CDE_LEN : integer := 106;
  subtype ucm_cde_rvt is std_logic_vector(UCM_CDE_LEN-1 downto 0);
  function vectorify(x: ucm_cde_rt) return ucm_cde_rvt;
  function structify(x: ucm_cde_rvt) return ucm_cde_rt;
  function nullify(x: ucm_cde_rt) return ucm_cde_rt;

  type ucm_cde_bus_at is array(integer range <>) of ucm_cde_rt;
  type ucm_cde_bus_avt is array(integer range <>) of ucm_cde_rvt;
  function vectorify(x: ucm_cde_bus_at) return ucm_cde_bus_avt;
  function vectorify(x: ucm_cde_bus_at) return std_logic_vector;
  function structify(x: ucm_cde_bus_avt) return ucm_cde_bus_at;
  function structify(x: std_logic_vector) return ucm_cde_bus_at;
  function nullify(x: ucm_cde_bus_at) return ucm_cde_bus_at;
  function nullify(x: ucm_cde_bus_avt) return ucm_cde_bus_avt;

  subtype ucm_cvp_rad_t is std_logic_vector(SLC_Z_RPC_LEN-1 downto 0);

  type ucm_cvp_rads_at is array(integer range <>) of ucm_cvp_rad_t;
  type ucm_cvp_rads_avt is array(integer range <>) of std_logic_vector(SLC_Z_RPC_LEN-1 downto 0);
  function vectorify(x: ucm_cvp_rads_at) return ucm_cvp_rads_avt;
  function vectorify(x: ucm_cvp_rads_at) return std_logic_vector;
  function structify(x: ucm_cvp_rads_avt) return ucm_cvp_rads_at;
  function structify(x: std_logic_vector) return ucm_cvp_rads_at;
  function nullify(x: ucm_cvp_rads_at) return ucm_cvp_rads_at;
  function nullify(x: ucm_cvp_rads_avt) return ucm_cvp_rads_avt;

  type ucm_csw_ch_control_rt is record
    data_present : std_logic;
    addr_orig : std_logic_vector(4-1 downto 0);
  end record ucm_csw_ch_control_rt;
  constant UCM_CSW_CH_CONTROL_LEN : integer := 5;
  subtype ucm_csw_ch_control_rvt is std_logic_vector(UCM_CSW_CH_CONTROL_LEN-1 downto 0);
  function vectorify(x: ucm_csw_ch_control_rt) return ucm_csw_ch_control_rvt;
  function structify(x: ucm_csw_ch_control_rvt) return ucm_csw_ch_control_rt;
  function nullify(x: ucm_csw_ch_control_rt) return ucm_csw_ch_control_rt;

  type ucm_csw_control_at is array(integer range <>) of ucm_csw_ch_control_rt;
  type ucm_csw_control_avt is array(integer range <>) of ucm_csw_ch_control_rvt;
  function vectorify(x: ucm_csw_control_at) return ucm_csw_control_avt;
  function vectorify(x: ucm_csw_control_at) return std_logic_vector;
  function structify(x: ucm_csw_control_avt) return ucm_csw_control_at;
  function structify(x: std_logic_vector) return ucm_csw_control_at;
  function nullify(x: ucm_csw_control_at) return ucm_csw_control_at;
  function nullify(x: ucm_csw_control_avt) return ucm_csw_control_avt;

  type ucm_pam_ch_control_rt is record
    data_present : std_logic;
    addr_orig : std_logic_vector(4-1 downto 0);
  end record ucm_pam_ch_control_rt;
  constant UCM_PAM_CH_CONTROL_LEN : integer := 5;
  subtype ucm_pam_ch_control_rvt is std_logic_vector(UCM_PAM_CH_CONTROL_LEN-1 downto 0);
  function vectorify(x: ucm_pam_ch_control_rt) return ucm_pam_ch_control_rvt;
  function structify(x: ucm_pam_ch_control_rvt) return ucm_pam_ch_control_rt;
  function nullify(x: ucm_pam_ch_control_rt) return ucm_pam_ch_control_rt;

  type ucm_pam_control_at is array(integer range <>) of ucm_pam_ch_control_rt;
  type ucm_pam_control_avt is array(integer range <>) of ucm_pam_ch_control_rvt;
  function vectorify(x: ucm_pam_control_at) return ucm_pam_control_avt;
  function vectorify(x: ucm_pam_control_at) return std_logic_vector;
  function structify(x: ucm_pam_control_avt) return ucm_pam_control_at;
  function structify(x: std_logic_vector) return ucm_pam_control_at;
  function nullify(x: ucm_pam_control_at) return ucm_pam_control_at;
  function nullify(x: ucm_pam_control_avt) return ucm_pam_control_avt;

  type ucm_proc_info_ch_rt is record
    ch : std_logic_vector(4-1 downto 0);
    processed : std_logic;
  end record ucm_proc_info_ch_rt;
  constant UCM_PROC_INFO_CH_LEN : integer := 5;
  subtype ucm_proc_info_ch_rvt is std_logic_vector(UCM_PROC_INFO_CH_LEN-1 downto 0);
  function vectorify(x: ucm_proc_info_ch_rt) return ucm_proc_info_ch_rvt;
  function structify(x: ucm_proc_info_ch_rvt) return ucm_proc_info_ch_rt;
  function nullify(x: ucm_proc_info_ch_rt) return ucm_proc_info_ch_rt;

  type ucm_proc_info_at is array(integer range <>) of ucm_proc_info_ch_rt;
  type ucm_proc_info_avt is array(integer range <>) of ucm_proc_info_ch_rvt;
  function vectorify(x: ucm_proc_info_at) return ucm_proc_info_avt;
  function vectorify(x: ucm_proc_info_at) return std_logic_vector;
  function structify(x: ucm_proc_info_avt) return ucm_proc_info_at;
  function structify(x: std_logic_vector) return ucm_proc_info_at;
  function nullify(x: ucm_proc_info_at) return ucm_proc_info_at;
  function nullify(x: ucm_proc_info_avt) return ucm_proc_info_avt;

end package ucm_pkg;

------------------------------------------------------------

package body ucm_pkg is

  function vectorify(x: ucm_prepro2ctrl_rt) return ucm_prepro2ctrl_rvt is
    variable y : ucm_prepro2ctrl_rvt;
  begin
    y(0 downto 0)              := vectorify(x.data_valid);
    return y;
  end function vectorify;
  function structify(x: ucm_prepro2ctrl_rvt) return ucm_prepro2ctrl_rt is
    variable y : ucm_prepro2ctrl_rt;
  begin
    y.data_valid               := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_prepro2ctrl_rt) return ucm_prepro2ctrl_rt is
    variable y : ucm_prepro2ctrl_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm_prepro2ctrl_bus_at) return ucm_prepro2ctrl_bus_avt is
    variable y :  ucm_prepro2ctrl_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_prepro2ctrl_bus_at) return std_logic_vector is
    variable msb : integer := x'length*1-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-1+1) := vectorify(x(i));
      msb := msb - 1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_prepro2ctrl_bus_avt) return ucm_prepro2ctrl_bus_at is
    variable y :  ucm_prepro2ctrl_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_prepro2ctrl_bus_at is
    variable y :  ucm_prepro2ctrl_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-1+1));
      msb := msb - 1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_prepro2ctrl_bus_at) return ucm_prepro2ctrl_bus_at is
    variable y :  ucm_prepro2ctrl_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_prepro2ctrl_bus_avt) return ucm_prepro2ctrl_bus_avt is
    variable y :  ucm_prepro2ctrl_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: chamb_ieta_rpc_bus_at) return chamb_ieta_rpc_bus_avt is
    variable y :  chamb_ieta_rpc_bus_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: chamb_ieta_rpc_bus_at) return std_logic_vector is
    variable msb : integer := x'length*4-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-4+1) := vectorify(x(i));
      msb := msb - 4;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: chamb_ieta_rpc_bus_avt) return chamb_ieta_rpc_bus_at is
    variable y :  chamb_ieta_rpc_bus_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return chamb_ieta_rpc_bus_at is
    variable y :  chamb_ieta_rpc_bus_at;
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-4+1));
      msb := msb - 4;
    end loop l;
    return y;
  end function structify;
  function nullify(x: chamb_ieta_rpc_bus_at) return chamb_ieta_rpc_bus_at is
    variable y :  chamb_ieta_rpc_bus_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: chamb_ieta_rpc_bus_avt) return chamb_ieta_rpc_bus_avt is
    variable y :  chamb_ieta_rpc_bus_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_cde_rt) return ucm_cde_rvt is
    variable y : ucm_cde_rvt;
  begin
    y(105 downto 85)           := vectorify(x.muid);
    y(84 downto 69)            := vectorify(x.chamb_ieta);
    y(68 downto 66)            := vectorify(x.cointype);
    y(65 downto 57)            := vectorify(x.posphi);
    y(56 downto 49)            := vectorify(x.phimod);
    y(48 downto 1)             := vectorify(x.specific);
    y(0 downto 0)              := vectorify(x.data_valid);
    return y;
  end function vectorify;
  function structify(x: ucm_cde_rvt) return ucm_cde_rt is
    variable y : ucm_cde_rt;
  begin
    y.muid                     := structify(x(105 downto 85));
    y.chamb_ieta               := structify(x(84 downto 69));
    y.cointype                 := structify(x(68 downto 66));
    y.posphi                   := structify(x(65 downto 57));
    y.phimod                   := structify(x(56 downto 49));
    y.specific                 := structify(x(48 downto 1));
    y.data_valid               := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_cde_rt) return ucm_cde_rt is
    variable y : ucm_cde_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.chamb_ieta               := nullify(x.chamb_ieta);
    y.cointype                 := nullify(x.cointype);
    y.posphi                   := nullify(x.posphi);
    y.phimod                   := nullify(x.phimod);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm_cde_bus_at) return ucm_cde_bus_avt is
    variable y :  ucm_cde_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_cde_bus_at) return std_logic_vector is
    variable msb : integer := x'length*106-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-106+1) := vectorify(x(i));
      msb := msb - 106;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_cde_bus_avt) return ucm_cde_bus_at is
    variable y :  ucm_cde_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_cde_bus_at is
    variable y :  ucm_cde_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-106+1));
      msb := msb - 106;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_cde_bus_at) return ucm_cde_bus_at is
    variable y :  ucm_cde_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_cde_bus_avt) return ucm_cde_bus_avt is
    variable y :  ucm_cde_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_cvp_rads_at) return ucm_cvp_rads_avt is
    variable y :  ucm_cvp_rads_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_cvp_rads_at) return std_logic_vector is
    variable msb : integer := x'length*SLC_Z_RPC_LEN-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-SLC_Z_RPC_LEN+1) := vectorify(x(i));
      msb := msb - SLC_Z_RPC_LEN;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_cvp_rads_avt) return ucm_cvp_rads_at is
    variable y :  ucm_cvp_rads_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_cvp_rads_at is
    variable y :  ucm_cvp_rads_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-SLC_Z_RPC_LEN+1));
      msb := msb - SLC_Z_RPC_LEN;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_cvp_rads_at) return ucm_cvp_rads_at is
    variable y :  ucm_cvp_rads_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_cvp_rads_avt) return ucm_cvp_rads_avt is
    variable y :  ucm_cvp_rads_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_csw_ch_control_rt) return ucm_csw_ch_control_rvt is
    variable y : ucm_csw_ch_control_rvt;
  begin
    y(4 downto 4)              := vectorify(x.data_present);
    y(3 downto 0)              := vectorify(x.addr_orig);
    return y;
  end function vectorify;
  function structify(x: ucm_csw_ch_control_rvt) return ucm_csw_ch_control_rt is
    variable y : ucm_csw_ch_control_rt;
  begin
    y.data_present             := structify(x(4 downto 4));
    y.addr_orig                := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_csw_ch_control_rt) return ucm_csw_ch_control_rt is
    variable y : ucm_csw_ch_control_rt;
  begin
    y.data_present             := nullify(x.data_present);
    y.addr_orig                := nullify(x.addr_orig);
    return y;
  end function nullify;

  function vectorify(x: ucm_csw_control_at) return ucm_csw_control_avt is
    variable y :  ucm_csw_control_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_csw_control_at) return std_logic_vector is
    variable msb : integer := x'length*5-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-5+1) := vectorify(x(i));
      msb := msb - 5;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_csw_control_avt) return ucm_csw_control_at is
    variable y :  ucm_csw_control_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_csw_control_at is
    variable y :  ucm_csw_control_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-5+1));
      msb := msb - 5;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_csw_control_at) return ucm_csw_control_at is
    variable y :  ucm_csw_control_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_csw_control_avt) return ucm_csw_control_avt is
    variable y :  ucm_csw_control_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_pam_ch_control_rt) return ucm_pam_ch_control_rvt is
    variable y : ucm_pam_ch_control_rvt;
  begin
    y(4 downto 4)              := vectorify(x.data_present);
    y(3 downto 0)              := vectorify(x.addr_orig);
    return y;
  end function vectorify;
  function structify(x: ucm_pam_ch_control_rvt) return ucm_pam_ch_control_rt is
    variable y : ucm_pam_ch_control_rt;
  begin
    y.data_present             := structify(x(4 downto 4));
    y.addr_orig                := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_pam_ch_control_rt) return ucm_pam_ch_control_rt is
    variable y : ucm_pam_ch_control_rt;
  begin
    y.data_present             := nullify(x.data_present);
    y.addr_orig                := nullify(x.addr_orig);
    return y;
  end function nullify;

  function vectorify(x: ucm_pam_control_at) return ucm_pam_control_avt is
    variable y :  ucm_pam_control_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_pam_control_at) return std_logic_vector is
    variable msb : integer := x'length*5-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-5+1) := vectorify(x(i));
      msb := msb - 5;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_pam_control_avt) return ucm_pam_control_at is
    variable y :  ucm_pam_control_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_pam_control_at is
    variable y :  ucm_pam_control_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-5+1));
      msb := msb - 5;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_pam_control_at) return ucm_pam_control_at is
    variable y :  ucm_pam_control_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_pam_control_avt) return ucm_pam_control_avt is
    variable y :  ucm_pam_control_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_proc_info_ch_rt) return ucm_proc_info_ch_rvt is
    variable y : ucm_proc_info_ch_rvt;
  begin
    y(4 downto 1)              := vectorify(x.ch);
    y(0 downto 0)              := vectorify(x.processed);
    return y;
  end function vectorify;
  function structify(x: ucm_proc_info_ch_rvt) return ucm_proc_info_ch_rt is
    variable y : ucm_proc_info_ch_rt;
  begin
    y.ch                       := structify(x(4 downto 1));
    y.processed                := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_proc_info_ch_rt) return ucm_proc_info_ch_rt is
    variable y : ucm_proc_info_ch_rt;
  begin
    y.ch                       := nullify(x.ch);
    y.processed                := nullify(x.processed);
    return y;
  end function nullify;

  function vectorify(x: ucm_proc_info_at) return ucm_proc_info_avt is
    variable y :  ucm_proc_info_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_proc_info_at) return std_logic_vector is
    variable msb : integer := x'length*5-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-5+1) := vectorify(x(i));
      msb := msb - 5;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_proc_info_avt) return ucm_proc_info_at is
    variable y :  ucm_proc_info_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_proc_info_at is
    variable y :  ucm_proc_info_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-5+1));
      msb := msb - 5;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_proc_info_at) return ucm_proc_info_at is
    variable y :  ucm_proc_info_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_proc_info_avt) return ucm_proc_info_avt is
    variable y :  ucm_proc_info_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body ucm_pkg;
