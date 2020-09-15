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

package gldl_ult_tp_sim_pkg is

  type input_tar_rt is record
    global_time : unsigned(64-1 downto 0);
    station : unsigned(8-1 downto 0);
    chamber : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    tar : tar2hps_rt;
  end record input_tar_rt;
  constant INPUT_TAR_LEN : integer := 112;
  subtype input_tar_rvt is std_logic_vector(INPUT_TAR_LEN-1 downto 0);
  function vectorify(x: input_tar_rt) return input_tar_rvt;
  function structify(x: input_tar_rvt) return input_tar_rt;
  function nullify(x: input_tar_rt) return input_tar_rt;

  constant TB_TAR_FIFO_WIDTH : integer := 32;

  type tar2hps_tb_at is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tar2hps_rt;
  type tar2hps_tb_avt is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tar2hps_rvt;
  function vectorify(x: tar2hps_tb_at) return tar2hps_tb_avt;
  function vectorify(x: tar2hps_tb_at) return std_logic_vector;
  function structify(x: tar2hps_tb_avt) return tar2hps_tb_at;
  function structify(x: std_logic_vector) return tar2hps_tb_at;
  function nullify(x: tar2hps_tb_at) return tar2hps_tb_at;
  function nullify(x: tar2hps_tb_avt) return tar2hps_tb_avt;

  type input_slc_rt is record
    BCID : unsigned(SL_HEADER_BCID_LEN-1 downto 0);
    ToA : unsigned(64-1 downto 0);
    nTC : unsigned(SL_HEADER_NSLC_LEN-1 downto 0);
    TC_sent : unsigned(SL_HEADER_NMTC_SL_LEN-1 downto 0);
    TC_id : unsigned(SL_HEADER_NSLC_LEN-1 downto 0);
    Eta : signed(SLC_COMMON_POSETA_LEN-1 downto 0);
    Phi : unsigned(SLC_COMMON_POSPHI_LEN-1 downto 0);
    pT_thr : unsigned(SLC_COMMON_SL_PTTHRESH_LEN-1 downto 0);
    Charge : std_logic;
    Coincidence : std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    z_RPC0 : signed(SLC_BARREL_RPC0_POSZ_LEN-1 downto 0);
    z_RPC1 : signed(SLC_BARREL_RPC1_POSZ_LEN-1 downto 0);
    z_RPC2 : signed(SLC_BARREL_RPC2_POSZ_LEN-1 downto 0);
    z_RPC3 : signed(SLC_BARREL_RPC3_POSZ_LEN-1 downto 0);
  end record input_slc_rt;
  constant INPUT_SLC_LEN : integer := 164;
  subtype input_slc_rvt is std_logic_vector(INPUT_SLC_LEN-1 downto 0);
  function vectorify(x: input_slc_rt) return input_slc_rvt;
  function structify(x: input_slc_rvt) return input_slc_rt;
  function nullify(x: input_slc_rt) return input_slc_rt;

end package gldl_ult_tp_sim_pkg;

------------------------------------------------------------

package body gldl_ult_tp_sim_pkg is

  function vectorify(x: input_tar_rt) return input_tar_rvt is
    variable y : input_tar_rvt;
  begin
    y(111 downto 48)           := vectorify(x.global_time);
    y(47 downto 40)            := vectorify(x.station);
    y(39 downto 36)            := vectorify(x.chamber);
    y(35 downto 0)             := vectorify(x.tar);
    return y;
  end function vectorify;
  function structify(x: input_tar_rvt) return input_tar_rt is
    variable y : input_tar_rt;
  begin
    y.global_time              := structify(x(111 downto 48));
    y.station                  := structify(x(47 downto 40));
    y.chamber                  := structify(x(39 downto 36));
    y.tar                      := structify(x(35 downto 0));
    return y;
  end function structify;
  function nullify(x: input_tar_rt) return input_tar_rt is
    variable y : input_tar_rt;
  begin
    y.global_time              := nullify(x.global_time);
    y.station                  := nullify(x.station);
    y.chamber                  := nullify(x.chamber);
    y.tar                      := nullify(x.tar);
    return y;
  end function nullify;

  function vectorify(x: tar2hps_tb_at) return tar2hps_tb_avt is
    variable y :  tar2hps_tb_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: tar2hps_tb_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*36-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-36) := vectorify(x(i));
      msb := msb - 36 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: tar2hps_tb_avt) return tar2hps_tb_at is
    variable y :  tar2hps_tb_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return tar2hps_tb_at is
    variable y :  tar2hps_tb_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-36));
      msb := msb - 36 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: tar2hps_tb_at) return tar2hps_tb_at is
    variable y :  tar2hps_tb_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: tar2hps_tb_avt) return tar2hps_tb_avt is
    variable y :  tar2hps_tb_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: input_slc_rt) return input_slc_rvt is
    variable y : input_slc_rvt;
  begin
    y(163 downto 152)          := vectorify(x.BCID);
    y(151 downto 88)           := vectorify(x.ToA);
    y(87 downto 85)            := vectorify(x.nTC);
    y(84 downto 82)            := vectorify(x.TC_sent);
    y(81 downto 79)            := vectorify(x.TC_id);
    y(78 downto 65)            := vectorify(x.Eta);
    y(64 downto 56)            := vectorify(x.Phi);
    y(55 downto 52)            := vectorify(x.pT_thr);
    y(51 downto 51)            := vectorify(x.Charge);
    y(50 downto 48)            := vectorify(x.Coincidence);
    y(47 downto 36)            := vectorify(x.z_RPC0);
    y(35 downto 24)            := vectorify(x.z_RPC1);
    y(23 downto 12)            := vectorify(x.z_RPC2);
    y(11 downto 0)             := vectorify(x.z_RPC3);
    return y;
  end function vectorify;
  function structify(x: input_slc_rvt) return input_slc_rt is
    variable y : input_slc_rt;
  begin
    y.BCID                     := structify(x(163 downto 152));
    y.ToA                      := structify(x(151 downto 88));
    y.nTC                      := structify(x(87 downto 85));
    y.TC_sent                  := structify(x(84 downto 82));
    y.TC_id                    := structify(x(81 downto 79));
    y.Eta                      := structify(x(78 downto 65));
    y.Phi                      := structify(x(64 downto 56));
    y.pT_thr                   := structify(x(55 downto 52));
    y.Charge                   := structify(x(51 downto 51));
    y.Coincidence              := structify(x(50 downto 48));
    y.z_RPC0                   := structify(x(47 downto 36));
    y.z_RPC1                   := structify(x(35 downto 24));
    y.z_RPC2                   := structify(x(23 downto 12));
    y.z_RPC3                   := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: input_slc_rt) return input_slc_rt is
    variable y : input_slc_rt;
  begin
    y.BCID                     := nullify(x.BCID);
    y.ToA                      := nullify(x.ToA);
    y.nTC                      := nullify(x.nTC);
    y.TC_sent                  := nullify(x.TC_sent);
    y.TC_id                    := nullify(x.TC_id);
    y.Eta                      := nullify(x.Eta);
    y.Phi                      := nullify(x.Phi);
    y.pT_thr                   := nullify(x.pT_thr);
    y.Charge                   := nullify(x.Charge);
    y.Coincidence              := nullify(x.Coincidence);
    y.z_RPC0                   := nullify(x.z_RPC0);
    y.z_RPC1                   := nullify(x.z_RPC1);
    y.z_RPC2                   := nullify(x.z_RPC2);
    y.z_RPC3                   := nullify(x.z_RPC3);
    return y;
  end function nullify;

end package body gldl_ult_tp_sim_pkg;
