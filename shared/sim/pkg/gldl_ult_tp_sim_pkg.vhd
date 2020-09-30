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
    ToA : unsigned(32-1 downto 0);
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

  type input_slc_b_rt is record
    ToA : unsigned(64-1 downto 0);
    slc : slc_rx_rt;
  end record input_slc_b_rt;
  constant INPUT_SLC_B_LEN : integer := 257;
  subtype input_slc_b_rvt is std_logic_vector(INPUT_SLC_B_LEN-1 downto 0);
  function vectorify(x: input_slc_b_rt) return input_slc_b_rvt;
  function structify(x: input_slc_b_rvt) return input_slc_b_rt;
  function nullify(x: input_slc_b_rt) return input_slc_b_rt;

  constant TB_SLC_FIFO_WIDTH : integer := 32;

  type slc_tb_at is array(TB_SLC_FIFO_WIDTH-1 downto 0) of slc_rx_rt;
  type slc_tb_avt is array(TB_SLC_FIFO_WIDTH-1 downto 0) of slc_rx_rvt;
  function vectorify(x: slc_tb_at) return slc_tb_avt;
  function vectorify(x: slc_tb_at) return std_logic_vector;
  function structify(x: slc_tb_avt) return slc_tb_at;
  function structify(x: std_logic_vector) return slc_tb_at;
  function nullify(x: slc_tb_at) return slc_tb_at;
  function nullify(x: slc_tb_avt) return slc_tb_avt;

end package gldl_ult_tp_sim_pkg;

------------------------------------------------------------

package body gldl_ult_tp_sim_pkg is

  function vectorify(x: input_tar_rt) return input_tar_rvt is
    variable y : input_tar_rvt;
  begin
    y(111 downto 48)           := vectorify(x.ToA);
    y(47 downto 40)            := vectorify(x.station);
    y(39 downto 36)            := vectorify(x.chamber);
    y(35 downto 0)             := vectorify(x.tar);
    return y;
  end function vectorify;
  function structify(x: input_tar_rvt) return input_tar_rt is
    variable y : input_tar_rt;
  begin
    y.ToA                      := structify(x(111 downto 48));
    y.station                  := structify(x(47 downto 40));
    y.chamber                  := structify(x(39 downto 36));
    y.tar                      := structify(x(35 downto 0));
    return y;
  end function structify;
  function nullify(x: input_tar_rt) return input_tar_rt is
    variable y : input_tar_rt;
  begin
    y.ToA                      := nullify(x.ToA);
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
    variable msb : integer := x'length*36-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-36+1) := vectorify(x(i));
      msb := msb - 36;
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
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-36+1));
      msb := msb - 36;
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

  function vectorify(x: input_slc_b_rt) return input_slc_b_rvt is
    variable y : input_slc_b_rvt;
  begin
    y(256 downto 193)          := vectorify(x.ToA);
    y(192 downto 0)            := vectorify(x.slc);
    return y;
  end function vectorify;
  function structify(x: input_slc_b_rvt) return input_slc_b_rt is
    variable y : input_slc_b_rt;
  begin
    y.ToA                      := structify(x(256 downto 193));
    y.slc                      := structify(x(192 downto 0));
    return y;
  end function structify;
  function nullify(x: input_slc_b_rt) return input_slc_b_rt is
    variable y : input_slc_b_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.slc                      := nullify(x.slc);
    return y;
  end function nullify;

  function vectorify(x: slc_tb_at) return slc_tb_avt is
    variable y :  slc_tb_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: slc_tb_at) return std_logic_vector is
    variable msb : integer := x'length*193-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-193+1) := vectorify(x(i));
      msb := msb - 193;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: slc_tb_avt) return slc_tb_at is
    variable y :  slc_tb_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return slc_tb_at is
    variable y :  slc_tb_at;
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193+1));
      msb := msb - 193;
    end loop l;
    return y;
  end function structify;
  function nullify(x: slc_tb_at) return slc_tb_at is
    variable y :  slc_tb_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: slc_tb_avt) return slc_tb_avt is
    variable y :  slc_tb_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body gldl_ult_tp_sim_pkg;
