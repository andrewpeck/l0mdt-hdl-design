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

  constant UCM_INPUT_PL_LATENCY : integer := 2;

  constant UCM_OUTPUT_PL_LATENCY : integer := 2;

  constant SLC_SPECIFIC_LEN : integer := 85;

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
    mdtid : vec_mdtid_rt;
    chamb_ieta : chamb_ieta_rpc_bus_at;
    cointype : std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    specific : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    data_valid : std_logic;
  end record ucm_cde_rt;
  constant UCM_CDE_LEN : integer := 135;
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
    y(134 downto 114)          := vectorify(x.muid);
    y(113 downto 105)          := vectorify(x.mdtid);
    y(104 downto 89)           := vectorify(x.chamb_ieta);
    y(88 downto 86)            := vectorify(x.cointype);
    y(85 downto 1)             := vectorify(x.specific);
    y(0 downto 0)              := vectorify(x.data_valid);
    return y;
  end function vectorify;
  function structify(x: ucm_cde_rvt) return ucm_cde_rt is
    variable y : ucm_cde_rt;
  begin
    y.muid                     := structify(x(134 downto 114));
    y.mdtid                    := structify(x(113 downto 105));
    y.chamb_ieta               := structify(x(104 downto 89));
    y.cointype                 := structify(x(88 downto 86));
    y.specific                 := structify(x(85 downto 1));
    y.data_valid               := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_cde_rt) return ucm_cde_rt is
    variable y : ucm_cde_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.mdtid                    := nullify(x.mdtid);
    y.chamb_ieta               := nullify(x.chamb_ieta);
    y.cointype                 := nullify(x.cointype);
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
    variable msb : integer := x'length*135-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-135+1) := vectorify(x(i));
      msb := msb - 135;
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
      y(i) := structify(x(msb downto msb-135+1));
      msb := msb - 135;
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
