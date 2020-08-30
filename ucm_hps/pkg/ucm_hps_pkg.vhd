library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

package ucm_hps_pkg is

  type input_tar_rt is record
    global_time : unsigned(64-1 downto 0);
    station : unsigned(8-1 downto 0);
    chamber : unsigned(8-1 downto 0);
    tar : tar2hps_rt;
  end record input_tar_rt;
  constant INPUT_TAR_LEN : integer := 154;
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

end package ucm_hps_pkg;

------------------------------------------------------------

package body ucm_hps_pkg is

  function vectorify(x: input_tar_rt) return input_tar_rvt is
    variable y : input_tar_rvt;
  begin
    y(153 downto 90)           := vectorify(x.global_time);
    y(89 downto 82)            := vectorify(x.station);
    y(81 downto 74)            := vectorify(x.chamber);
    y(73 downto 0)             := vectorify(x.tar);
    return y;
  end function vectorify;
  function structify(x: input_tar_rvt) return input_tar_rt is
    variable y : input_tar_rt;
  begin
    y.global_time              := structify(x(153 downto 90));
    y.station                  := structify(x(89 downto 82));
    y.chamber                  := structify(x(81 downto 74));
    y.tar                      := structify(x(73 downto 0));
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
    variable y : std_logic_vector(x'length*74-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-74) := vectorify(x(i));
      msb := msb - 74 -1;
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
      y(i) := structify(x(msb downto msb-74));
      msb := msb - 74 -1;
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

end package body ucm_hps_pkg;
