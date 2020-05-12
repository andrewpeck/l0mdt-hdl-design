library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared;
use shared.common_pkg.all;
use shared.config_pkg.all;

package ucm_pkg is

  type ucm_prepro_rt is record
     muid                 :  slc_muid_rt;
     chambers             :  slc_chid_rt;
     common               :  slc_common_rt;
     specific             :  std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
     data_valid           :  std_logic;
  end record ucm_prepro_rt;
  constant UCM_PREPRO_LEN : integer := 128;
  subtype ucm_prepro_rvt is std_logic_vector(UCM_PREPRO_LEN-1 downto 0);
  function vectorify(x: ucm_prepro_rt) return ucm_prepro_rvt;
  function structify(x: ucm_prepro_rvt) return ucm_prepro_rt;
  function nullify (x: ucm_prepro_rt) return ucm_prepro_rt;

  type ucm_csw_dest_at is array(MAX_NUM_SL-1 downto 0) of std_logic_vector(4-1 downto 0);
  type ucm_csw_dest_avt is array(MAX_NUM_SL-1 downto 0) of std_logic_vector(4-1 downto 0);
  function vectorify(x: ucm_csw_dest_at) return ucm_csw_dest_avt;
  function vectorify(x: ucm_csw_dest_at) return std_logic_vector;
  function structify(x: ucm_csw_dest_avt) return ucm_csw_dest_at;
  function structify(x: std_logic_vector) return ucm_csw_dest_at;
  function nullify(x: ucm_csw_dest_at) return ucm_csw_dest_at;
  function nullify(x: ucm_csw_dest_avt) return ucm_csw_dest_avt;

  type ucm_csw_control_rt is record
     data_present         :  std_logic_vector(MAX_NUM_SL-1 downto 0);
     addr_orig            :  ucm_csw_dest_at;
  end record ucm_csw_control_rt;
  constant UCM_CSW_CONTROL_LEN : integer := 25;
  subtype ucm_csw_control_rvt is std_logic_vector(UCM_CSW_CONTROL_LEN-1 downto 0);
  function vectorify(x: ucm_csw_control_rt) return ucm_csw_control_rvt;
  function structify(x: ucm_csw_control_rvt) return ucm_csw_control_rt;
  function nullify (x: ucm_csw_control_rt) return ucm_csw_control_rt;

  type ucm_cvp_dest_at is array(MAX_NUM_HEG-1 downto 0) of std_logic_vector(4-1 downto 0);
  type ucm_cvp_dest_avt is array(MAX_NUM_HEG-1 downto 0) of std_logic_vector(4-1 downto 0);
  function vectorify(x: ucm_cvp_dest_at) return ucm_cvp_dest_avt;
  function vectorify(x: ucm_cvp_dest_at) return std_logic_vector;
  function structify(x: ucm_cvp_dest_avt) return ucm_cvp_dest_at;
  function structify(x: std_logic_vector) return ucm_cvp_dest_at;
  function nullify(x: ucm_cvp_dest_at) return ucm_cvp_dest_at;
  function nullify(x: ucm_cvp_dest_avt) return ucm_cvp_dest_avt;

  type ucm_pamcsw_control_rt is record
     data_present         :  std_logic_vector(MAX_NUM_SL-1 downto 0);
     addr_orig            :  ucm_cvp_dest_at;
  end record ucm_pamcsw_control_rt;
  constant UCM_PAMCSW_CONTROL_LEN : integer := 17;
  subtype ucm_pamcsw_control_rvt is std_logic_vector(UCM_PAMCSW_CONTROL_LEN-1 downto 0);
  function vectorify(x: ucm_pamcsw_control_rt) return ucm_pamcsw_control_rvt;
  function structify(x: ucm_pamcsw_control_rvt) return ucm_pamcsw_control_rt;
  function nullify (x: ucm_pamcsw_control_rt) return ucm_pamcsw_control_rt;

  type ucm_proc_info_rt is record
     ch                   :  std_logic_vector(4-1 downto 0);
     proccesed            :  std_logic;
  end record ucm_proc_info_rt;
  constant UCM_PROC_INFO_LEN : integer := 5;
  subtype ucm_proc_info_rvt is std_logic_vector(UCM_PROC_INFO_LEN-1 downto 0);
  function vectorify(x: ucm_proc_info_rt) return ucm_proc_info_rvt;
  function structify(x: ucm_proc_info_rvt) return ucm_proc_info_rt;
  function nullify (x: ucm_proc_info_rt) return ucm_proc_info_rt;

  type ucm_proc_info_a_at is array(integer range <>) of ucm_proc_info_rt;
  type ucm_proc_info_a_avt is array(integer range <>) of ucm_proc_info_rvt;
  function vectorify(x: ucm_proc_info_a_at) return ucm_proc_info_a_avt;
  function vectorify(x: ucm_proc_info_a_at) return std_logic_vector;
  function structify(x: ucm_proc_info_a_avt) return ucm_proc_info_a_at;
  function structify(x: std_logic_vector) return ucm_proc_info_a_at;
  function nullify(x: ucm_proc_info_a_at) return ucm_proc_info_a_at;
  function nullify(x: ucm_proc_info_a_avt) return ucm_proc_info_a_avt;

end package ucm_pkg;

------------------------------------------------------------

package body ucm_pkg is

  function vectorify(x: ucm_prepro_rt) return ucm_prepro_rvt is
    variable y : ucm_prepro_rvt;
  begin
    y(127 downto 108)          := vectorify(x.muid);
    y(107 downto 84)           := vectorify(x.chambers);
    y(83 downto 52)            := vectorify(x.common);
    y(51 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm_prepro_rvt) return ucm_prepro_rt is
    variable y : ucm_prepro_rt;
  begin
    y.muid                     := structify(x(127 downto 108));
    y.chambers                 := structify(x(107 downto 84));
    y.common                   := structify(x(83 downto 52));
    y.specific                 := x(51 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: ucm_prepro_rt) return ucm_prepro_rt is
    variable y : ucm_prepro_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.chambers                 := nullify(x.chambers);
    y.common                   := nullify(x.common);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm_csw_dest_at) return ucm_csw_dest_avt is
    variable y :  ucm_csw_dest_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_csw_dest_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*4-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-4) := vectorify(x(i));
      msb := msb - 4 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_csw_dest_avt) return ucm_csw_dest_at is
    variable y :  ucm_csw_dest_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_csw_dest_at is
    variable y :  ucm_csw_dest_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-4));
      msb := msb - 4 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_csw_dest_at) return ucm_csw_dest_at is
    variable y :  ucm_csw_dest_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_csw_dest_avt) return ucm_csw_dest_avt is
    variable y :  ucm_csw_dest_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_csw_control_rt) return ucm_csw_control_rvt is
    variable y : ucm_csw_control_rvt;
  begin
    y(24 downto 20)            := x.data_present;
    y(19 downto 0)             := vectorify(x.addr_orig);
    return y;
  end function vectorify;
  function structify(x: ucm_csw_control_rvt) return ucm_csw_control_rt is
    variable y : ucm_csw_control_rt;
  begin
    y.data_present             := x(24 downto 20);
    y.addr_orig                := structify(x(19 downto 0));
    return y;
  end function structify;
  function nullify (x: ucm_csw_control_rt) return ucm_csw_control_rt is
    variable y : ucm_csw_control_rt;
  begin
    y.data_present             := nullify(x.data_present);
    y.addr_orig                := nullify(x.addr_orig);
    return y;
  end function nullify;

  function vectorify(x: ucm_cvp_dest_at) return ucm_cvp_dest_avt is
    variable y :  ucm_cvp_dest_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_cvp_dest_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*4-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-4) := vectorify(x(i));
      msb := msb - 4 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_cvp_dest_avt) return ucm_cvp_dest_at is
    variable y :  ucm_cvp_dest_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_cvp_dest_at is
    variable y :  ucm_cvp_dest_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-4));
      msb := msb - 4 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_cvp_dest_at) return ucm_cvp_dest_at is
    variable y :  ucm_cvp_dest_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_cvp_dest_avt) return ucm_cvp_dest_avt is
    variable y :  ucm_cvp_dest_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm_pamcsw_control_rt) return ucm_pamcsw_control_rvt is
    variable y : ucm_pamcsw_control_rvt;
  begin
    y(16 downto 12)            := x.data_present;
    y(11 downto 0)             := vectorify(x.addr_orig);
    return y;
  end function vectorify;
  function structify(x: ucm_pamcsw_control_rvt) return ucm_pamcsw_control_rt is
    variable y : ucm_pamcsw_control_rt;
  begin
    y.data_present             := x(16 downto 12);
    y.addr_orig                := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify (x: ucm_pamcsw_control_rt) return ucm_pamcsw_control_rt is
    variable y : ucm_pamcsw_control_rt;
  begin
    y.data_present             := nullify(x.data_present);
    y.addr_orig                := nullify(x.addr_orig);
    return y;
  end function nullify;

  function vectorify(x: ucm_proc_info_rt) return ucm_proc_info_rvt is
    variable y : ucm_proc_info_rvt;
  begin
    y(4 downto 1)              := x.ch;
    y(0)                       := x.proccesed;
    return y;
  end function vectorify;
  function structify(x: ucm_proc_info_rvt) return ucm_proc_info_rt is
    variable y : ucm_proc_info_rt;
  begin
    y.ch                       := x(4 downto 1);
    y.proccesed                := x(0);
    return y;
  end function structify;
  function nullify (x: ucm_proc_info_rt) return ucm_proc_info_rt is
    variable y : ucm_proc_info_rt;
  begin
    y.ch                       := nullify(x.ch);
    y.proccesed                := nullify(x.proccesed);
    return y;
  end function nullify;

  function vectorify(x: ucm_proc_info_a_at) return ucm_proc_info_a_avt is
    variable y :  ucm_proc_info_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm_proc_info_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*5-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-5) := vectorify(x(i));
      msb := msb - 5 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm_proc_info_a_avt) return ucm_proc_info_a_at is
    variable y :  ucm_proc_info_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm_proc_info_a_at is
    variable y :  ucm_proc_info_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-5));
      msb := msb - 5 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm_proc_info_a_at) return ucm_proc_info_a_at is
    variable y :  ucm_proc_info_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm_proc_info_a_avt) return ucm_proc_info_a_avt is
    variable y :  ucm_proc_info_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body ucm_pkg;
