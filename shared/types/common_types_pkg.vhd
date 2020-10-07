library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;

package common_types_pkg is

  subtype bcid_t is unsigned(12-1 downto 0);

  type integer_bus_at is array(integer range <>) of integer;
  type integer_bus_avt is array(integer range <>) of std_logic_vector(31 downto 0);
  function vectorify(x: integer_bus_at) return integer_bus_avt;
  function vectorify(x: integer_bus_at) return std_logic_vector;
  function structify(x: integer_bus_avt) return integer_bus_at;
  function structify(x: std_logic_vector) return integer_bus_at;
  function nullify(x: integer_bus_at) return integer_bus_at;
  function nullify(x: integer_bus_avt) return integer_bus_avt;

  type l0mdt_control_rt is record
    clk : std_logic;
    rst : std_logic;
    bx : std_logic;
  end record l0mdt_control_rt;
  constant L0MDT_CONTROL_LEN : integer := 3;
  subtype l0mdt_control_rvt is std_logic_vector(L0MDT_CONTROL_LEN-1 downto 0);
  function vectorify(x: l0mdt_control_rt) return l0mdt_control_rvt;
  function structify(x: l0mdt_control_rvt) return l0mdt_control_rt;
  function nullify(x: l0mdt_control_rt) return l0mdt_control_rt;

  type l0mdt_ttc_rt is record
    bcr : std_logic;
    ocr : std_logic;
    ecr : std_logic;
    l0a : std_logic;
    l1a : std_logic;
  end record l0mdt_ttc_rt;
  constant L0MDT_TTC_LEN : integer := 5;
  subtype l0mdt_ttc_rvt is std_logic_vector(L0MDT_TTC_LEN-1 downto 0);
  function vectorify(x: l0mdt_ttc_rt) return l0mdt_ttc_rvt;
  function structify(x: l0mdt_ttc_rvt) return l0mdt_ttc_rt;
  function nullify(x: l0mdt_ttc_rt) return l0mdt_ttc_rt;

  type slc_rx_bus_at is array(integer range <>) of slc_rx_rt;
  type slc_rx_bus_avt is array(integer range <>) of slc_rx_rvt;
  function vectorify(x: slc_rx_bus_at) return slc_rx_bus_avt;
  function vectorify(x: slc_rx_bus_at) return std_logic_vector;
  function structify(x: slc_rx_bus_avt) return slc_rx_bus_at;
  function structify(x: std_logic_vector) return slc_rx_bus_at;
  function nullify(x: slc_rx_bus_at) return slc_rx_bus_at;
  function nullify(x: slc_rx_bus_avt) return slc_rx_bus_avt;

  type slc_endcap_bus_at is array(integer range <>) of slc_endcap_rt;
  type slc_endcap_bus_avt is array(integer range <>) of slc_endcap_rvt;
  function vectorify(x: slc_endcap_bus_at) return slc_endcap_bus_avt;
  function vectorify(x: slc_endcap_bus_at) return std_logic_vector;
  function structify(x: slc_endcap_bus_avt) return slc_endcap_bus_at;
  function structify(x: std_logic_vector) return slc_endcap_bus_at;
  function nullify(x: slc_endcap_bus_at) return slc_endcap_bus_at;
  function nullify(x: slc_endcap_bus_avt) return slc_endcap_bus_avt;

  type mdt_polmux_bus_at is array(integer range <>) of tdcpolmux2tar_rt;
  type mdt_polmux_bus_avt is array(integer range <>) of tdcpolmux2tar_rvt;
  function vectorify(x: mdt_polmux_bus_at) return mdt_polmux_bus_avt;
  function vectorify(x: mdt_polmux_bus_at) return std_logic_vector;
  function structify(x: mdt_polmux_bus_avt) return mdt_polmux_bus_at;
  function structify(x: std_logic_vector) return mdt_polmux_bus_at;
  function nullify(x: mdt_polmux_bus_at) return mdt_polmux_bus_at;
  function nullify(x: mdt_polmux_bus_avt) return mdt_polmux_bus_avt;

  type tar2hps_bus_at is array(integer range <>) of tar2hps_rt;
  type tar2hps_bus_avt is array(integer range <>) of tar2hps_rvt;
  function vectorify(x: tar2hps_bus_at) return tar2hps_bus_avt;
  function vectorify(x: tar2hps_bus_at) return std_logic_vector;
  function structify(x: tar2hps_bus_avt) return tar2hps_bus_at;
  function structify(x: std_logic_vector) return tar2hps_bus_at;
  function nullify(x: tar2hps_bus_at) return tar2hps_bus_at;
  function nullify(x: tar2hps_bus_avt) return tar2hps_bus_avt;

  type ucm2hps_bus_at is array(integer range <>) of ucm2hps_rt;
  type ucm2hps_bus_avt is array(integer range <>) of ucm2hps_rvt;
  function vectorify(x: ucm2hps_bus_at) return ucm2hps_bus_avt;
  function vectorify(x: ucm2hps_bus_at) return std_logic_vector;
  function structify(x: ucm2hps_bus_avt) return ucm2hps_bus_at;
  function structify(x: std_logic_vector) return ucm2hps_bus_at;
  function nullify(x: ucm2hps_bus_at) return ucm2hps_bus_at;
  function nullify(x: ucm2hps_bus_avt) return ucm2hps_bus_avt;

  type heg2sfslc_bus_at is array(integer range <>) of heg2sfslc_rt;
  type heg2sfslc_bus_avt is array(integer range <>) of heg2sfslc_rvt;
  function vectorify(x: heg2sfslc_bus_at) return heg2sfslc_bus_avt;
  function vectorify(x: heg2sfslc_bus_at) return std_logic_vector;
  function structify(x: heg2sfslc_bus_avt) return heg2sfslc_bus_at;
  function structify(x: std_logic_vector) return heg2sfslc_bus_at;
  function nullify(x: heg2sfslc_bus_at) return heg2sfslc_bus_at;
  function nullify(x: heg2sfslc_bus_avt) return heg2sfslc_bus_avt;

  type heg2sfhit_bus_at is array(integer range <>) of heg2sfhit_rt;
  type heg2sfhit_bus_avt is array(integer range <>) of heg2sfhit_rvt;
  function vectorify(x: heg2sfhit_bus_at) return heg2sfhit_bus_avt;
  function vectorify(x: heg2sfhit_bus_at) return std_logic_vector;
  function structify(x: heg2sfhit_bus_avt) return heg2sfhit_bus_at;
  function structify(x: std_logic_vector) return heg2sfhit_bus_at;
  function nullify(x: heg2sfhit_bus_at) return heg2sfhit_bus_at;
  function nullify(x: heg2sfhit_bus_avt) return heg2sfhit_bus_avt;

  type sf2pt_bus_at is array(integer range <>) of sf2ptcalc_rt;
  type sf2pt_bus_avt is array(integer range <>) of sf2ptcalc_rvt;
  function vectorify(x: sf2pt_bus_at) return sf2pt_bus_avt;
  function vectorify(x: sf2pt_bus_at) return std_logic_vector;
  function structify(x: sf2pt_bus_avt) return sf2pt_bus_at;
  function structify(x: std_logic_vector) return sf2pt_bus_at;
  function nullify(x: sf2pt_bus_at) return sf2pt_bus_at;
  function nullify(x: sf2pt_bus_avt) return sf2pt_bus_avt;

  type ucm2pl_bus_at is array(integer range <>) of ucm2pl_rt;
  type ucm2pl_bus_avt is array(integer range <>) of ucm2pl_rvt;
  function vectorify(x: ucm2pl_bus_at) return ucm2pl_bus_avt;
  function vectorify(x: ucm2pl_bus_at) return std_logic_vector;
  function structify(x: ucm2pl_bus_avt) return ucm2pl_bus_at;
  function structify(x: std_logic_vector) return ucm2pl_bus_at;
  function nullify(x: ucm2pl_bus_at) return ucm2pl_bus_at;
  function nullify(x: ucm2pl_bus_avt) return ucm2pl_bus_avt;

  type pl2pt_bus_at is array(integer range <>) of pl2ptcalc_rt;
  type pl2pt_bus_avt is array(integer range <>) of pl2ptcalc_rvt;
  function vectorify(x: pl2pt_bus_at) return pl2pt_bus_avt;
  function vectorify(x: pl2pt_bus_at) return std_logic_vector;
  function structify(x: pl2pt_bus_avt) return pl2pt_bus_at;
  function structify(x: std_logic_vector) return pl2pt_bus_at;
  function nullify(x: pl2pt_bus_at) return pl2pt_bus_at;
  function nullify(x: pl2pt_bus_avt) return pl2pt_bus_avt;

  type pl2mtc_bus_at is array(integer range <>) of pl2mtc_rt;
  type pl2mtc_bus_avt is array(integer range <>) of pl2mtc_rvt;
  function vectorify(x: pl2mtc_bus_at) return pl2mtc_bus_avt;
  function vectorify(x: pl2mtc_bus_at) return std_logic_vector;
  function structify(x: pl2mtc_bus_avt) return pl2mtc_bus_at;
  function structify(x: std_logic_vector) return pl2mtc_bus_at;
  function nullify(x: pl2mtc_bus_at) return pl2mtc_bus_at;
  function nullify(x: pl2mtc_bus_avt) return pl2mtc_bus_avt;

  type tf2mtc_bus_at is array(integer range <>) of ptcalc2mtc_rt;
  type tf2mtc_bus_avt is array(integer range <>) of ptcalc2mtc_rvt;
  function vectorify(x: tf2mtc_bus_at) return tf2mtc_bus_avt;
  function vectorify(x: tf2mtc_bus_at) return std_logic_vector;
  function structify(x: tf2mtc_bus_avt) return tf2mtc_bus_at;
  function structify(x: std_logic_vector) return tf2mtc_bus_at;
  function nullify(x: tf2mtc_bus_at) return tf2mtc_bus_at;
  function nullify(x: tf2mtc_bus_avt) return tf2mtc_bus_avt;

  type mtc_out_bus_at is array(integer range <>) of mtc2sl_rt;
  type mtc_out_bus_avt is array(integer range <>) of mtc2sl_rvt;
  function vectorify(x: mtc_out_bus_at) return mtc_out_bus_avt;
  function vectorify(x: mtc_out_bus_at) return std_logic_vector;
  function structify(x: mtc_out_bus_avt) return mtc_out_bus_at;
  function structify(x: std_logic_vector) return mtc_out_bus_at;
  function nullify(x: mtc_out_bus_at) return mtc_out_bus_at;
  function nullify(x: mtc_out_bus_avt) return mtc_out_bus_avt;

  type mtc2nsp_bus_at is array(integer range <>) of mtc2sl_rt;
  type mtc2nsp_bus_avt is array(integer range <>) of mtc2sl_rvt;
  function vectorify(x: mtc2nsp_bus_at) return mtc2nsp_bus_avt;
  function vectorify(x: mtc2nsp_bus_at) return std_logic_vector;
  function structify(x: mtc2nsp_bus_avt) return mtc2nsp_bus_at;
  function structify(x: std_logic_vector) return mtc2nsp_bus_at;
  function nullify(x: mtc2nsp_bus_at) return mtc2nsp_bus_at;
  function nullify(x: mtc2nsp_bus_avt) return mtc2nsp_bus_avt;

  type felix_stream_rt is record
    slc_muid : slc_muid_rt;
    common : slc_common_rt;
    data_valid : std_logic;
  end record felix_stream_rt;
  constant FELIX_STREAM_LEN : integer := 129;
  subtype felix_stream_rvt is std_logic_vector(FELIX_STREAM_LEN-1 downto 0);
  function vectorify(x: felix_stream_rt) return felix_stream_rvt;
  function structify(x: felix_stream_rvt) return felix_stream_rt;
  function nullify(x: felix_stream_rt) return felix_stream_rt;

  type felix_stream_bus_at is array(integer range <>) of felix_stream_rt;
  type felix_stream_bus_avt is array(integer range <>) of felix_stream_rvt;
  function vectorify(x: felix_stream_bus_at) return felix_stream_bus_avt;
  function vectorify(x: felix_stream_bus_at) return std_logic_vector;
  function structify(x: felix_stream_bus_avt) return felix_stream_bus_at;
  function structify(x: std_logic_vector) return felix_stream_bus_at;
  function nullify(x: felix_stream_bus_at) return felix_stream_bus_at;
  function nullify(x: felix_stream_bus_avt) return felix_stream_bus_avt;

end package common_types_pkg;

------------------------------------------------------------

package body common_types_pkg is

  function vectorify(x: integer_bus_at) return integer_bus_avt is
    variable y :  integer_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: integer_bus_at) return std_logic_vector is
    variable msb : integer := x'length*32-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-32+1) := vectorify(x(i));
      msb := msb - 32;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: integer_bus_avt) return integer_bus_at is
    variable y :  integer_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return integer_bus_at is
    variable y :  integer_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-32+1));
      msb := msb - 32;
    end loop l;
    return y;
  end function structify;
  function nullify(x: integer_bus_at) return integer_bus_at is
    variable y :  integer_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: integer_bus_avt) return integer_bus_avt is
    variable y :  integer_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: l0mdt_control_rt) return l0mdt_control_rvt is
    variable y : l0mdt_control_rvt;
  begin
    y(2 downto 2)              := vectorify(x.clk);
    y(1 downto 1)              := vectorify(x.rst);
    y(0 downto 0)              := vectorify(x.bx);
    return y;
  end function vectorify;
  function structify(x: l0mdt_control_rvt) return l0mdt_control_rt is
    variable y : l0mdt_control_rt;
  begin
    y.clk                      := structify(x(2 downto 2));
    y.rst                      := structify(x(1 downto 1));
    y.bx                       := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: l0mdt_control_rt) return l0mdt_control_rt is
    variable y : l0mdt_control_rt;
  begin
    y.clk                      := nullify(x.clk);
    y.rst                      := nullify(x.rst);
    y.bx                       := nullify(x.bx);
    return y;
  end function nullify;

  function vectorify(x: l0mdt_ttc_rt) return l0mdt_ttc_rvt is
    variable y : l0mdt_ttc_rvt;
  begin
    y(4 downto 4)              := vectorify(x.bcr);
    y(3 downto 3)              := vectorify(x.ocr);
    y(2 downto 2)              := vectorify(x.ecr);
    y(1 downto 1)              := vectorify(x.l0a);
    y(0 downto 0)              := vectorify(x.l1a);
    return y;
  end function vectorify;
  function structify(x: l0mdt_ttc_rvt) return l0mdt_ttc_rt is
    variable y : l0mdt_ttc_rt;
  begin
    y.bcr                      := structify(x(4 downto 4));
    y.ocr                      := structify(x(3 downto 3));
    y.ecr                      := structify(x(2 downto 2));
    y.l0a                      := structify(x(1 downto 1));
    y.l1a                      := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: l0mdt_ttc_rt) return l0mdt_ttc_rt is
    variable y : l0mdt_ttc_rt;
  begin
    y.bcr                      := nullify(x.bcr);
    y.ocr                      := nullify(x.ocr);
    y.ecr                      := nullify(x.ecr);
    y.l0a                      := nullify(x.l0a);
    y.l1a                      := nullify(x.l1a);
    return y;
  end function nullify;

  function vectorify(x: slc_rx_bus_at) return slc_rx_bus_avt is
    variable y :  slc_rx_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: slc_rx_bus_at) return std_logic_vector is
    variable msb : integer := x'length*193-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-193+1) := vectorify(x(i));
      msb := msb - 193;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: slc_rx_bus_avt) return slc_rx_bus_at is
    variable y :  slc_rx_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return slc_rx_bus_at is
    variable y :  slc_rx_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193+1));
      msb := msb - 193;
    end loop l;
    return y;
  end function structify;
  function nullify(x: slc_rx_bus_at) return slc_rx_bus_at is
    variable y :  slc_rx_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: slc_rx_bus_avt) return slc_rx_bus_avt is
    variable y :  slc_rx_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: slc_endcap_bus_at) return slc_endcap_bus_avt is
    variable y :  slc_endcap_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: slc_endcap_bus_at) return std_logic_vector is
    variable msb : integer := x'length*85-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-85+1) := vectorify(x(i));
      msb := msb - 85;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: slc_endcap_bus_avt) return slc_endcap_bus_at is
    variable y :  slc_endcap_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return slc_endcap_bus_at is
    variable y :  slc_endcap_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-85+1));
      msb := msb - 85;
    end loop l;
    return y;
  end function structify;
  function nullify(x: slc_endcap_bus_at) return slc_endcap_bus_at is
    variable y :  slc_endcap_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: slc_endcap_bus_avt) return slc_endcap_bus_avt is
    variable y :  slc_endcap_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mdt_polmux_bus_at) return mdt_polmux_bus_avt is
    variable y :  mdt_polmux_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mdt_polmux_bus_at) return std_logic_vector is
    variable msb : integer := x'length*42-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-42+1) := vectorify(x(i));
      msb := msb - 42;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mdt_polmux_bus_avt) return mdt_polmux_bus_at is
    variable y :  mdt_polmux_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mdt_polmux_bus_at is
    variable y :  mdt_polmux_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-42+1));
      msb := msb - 42;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mdt_polmux_bus_at) return mdt_polmux_bus_at is
    variable y :  mdt_polmux_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mdt_polmux_bus_avt) return mdt_polmux_bus_avt is
    variable y :  mdt_polmux_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: tar2hps_bus_at) return tar2hps_bus_avt is
    variable y :  tar2hps_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: tar2hps_bus_at) return std_logic_vector is
    variable msb : integer := x'length*36-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-36+1) := vectorify(x(i));
      msb := msb - 36;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: tar2hps_bus_avt) return tar2hps_bus_at is
    variable y :  tar2hps_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return tar2hps_bus_at is
    variable y :  tar2hps_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-36+1));
      msb := msb - 36;
    end loop l;
    return y;
  end function structify;
  function nullify(x: tar2hps_bus_at) return tar2hps_bus_at is
    variable y :  tar2hps_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: tar2hps_bus_avt) return tar2hps_bus_avt is
    variable y :  tar2hps_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm2hps_bus_at) return ucm2hps_bus_avt is
    variable y :  ucm2hps_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm2hps_bus_at) return std_logic_vector is
    variable msb : integer := x'length*61-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-61+1) := vectorify(x(i));
      msb := msb - 61;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm2hps_bus_avt) return ucm2hps_bus_at is
    variable y :  ucm2hps_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm2hps_bus_at is
    variable y :  ucm2hps_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-61+1));
      msb := msb - 61;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm2hps_bus_at) return ucm2hps_bus_at is
    variable y :  ucm2hps_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm2hps_bus_avt) return ucm2hps_bus_avt is
    variable y :  ucm2hps_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: heg2sfslc_bus_at) return heg2sfslc_bus_avt is
    variable y :  heg2sfslc_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: heg2sfslc_bus_at) return std_logic_vector is
    variable msb : integer := x'length*75-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-75+1) := vectorify(x(i));
      msb := msb - 75;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: heg2sfslc_bus_avt) return heg2sfslc_bus_at is
    variable y :  heg2sfslc_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return heg2sfslc_bus_at is
    variable y :  heg2sfslc_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-75+1));
      msb := msb - 75;
    end loop l;
    return y;
  end function structify;
  function nullify(x: heg2sfslc_bus_at) return heg2sfslc_bus_at is
    variable y :  heg2sfslc_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: heg2sfslc_bus_avt) return heg2sfslc_bus_avt is
    variable y :  heg2sfslc_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: heg2sfhit_bus_at) return heg2sfhit_bus_avt is
    variable y :  heg2sfhit_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: heg2sfhit_bus_at) return std_logic_vector is
    variable msb : integer := x'length*41-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-41+1) := vectorify(x(i));
      msb := msb - 41;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: heg2sfhit_bus_avt) return heg2sfhit_bus_at is
    variable y :  heg2sfhit_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return heg2sfhit_bus_at is
    variable y :  heg2sfhit_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-41+1));
      msb := msb - 41;
    end loop l;
    return y;
  end function structify;
  function nullify(x: heg2sfhit_bus_at) return heg2sfhit_bus_at is
    variable y :  heg2sfhit_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: heg2sfhit_bus_avt) return heg2sfhit_bus_avt is
    variable y :  heg2sfhit_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: sf2pt_bus_at) return sf2pt_bus_avt is
    variable y :  sf2pt_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: sf2pt_bus_at) return std_logic_vector is
    variable msb : integer := x'length*63-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-63+1) := vectorify(x(i));
      msb := msb - 63;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: sf2pt_bus_avt) return sf2pt_bus_at is
    variable y :  sf2pt_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return sf2pt_bus_at is
    variable y :  sf2pt_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-63+1));
      msb := msb - 63;
    end loop l;
    return y;
  end function structify;
  function nullify(x: sf2pt_bus_at) return sf2pt_bus_at is
    variable y :  sf2pt_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: sf2pt_bus_avt) return sf2pt_bus_avt is
    variable y :  sf2pt_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm2pl_bus_at) return ucm2pl_bus_avt is
    variable y :  ucm2pl_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm2pl_bus_at) return std_logic_vector is
    variable msb : integer := x'length*148-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-148+1) := vectorify(x(i));
      msb := msb - 148;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm2pl_bus_avt) return ucm2pl_bus_at is
    variable y :  ucm2pl_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm2pl_bus_at is
    variable y :  ucm2pl_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-148+1));
      msb := msb - 148;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm2pl_bus_at) return ucm2pl_bus_at is
    variable y :  ucm2pl_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm2pl_bus_avt) return ucm2pl_bus_avt is
    variable y :  ucm2pl_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pl2pt_bus_at) return pl2pt_bus_avt is
    variable y :  pl2pt_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pl2pt_bus_at) return std_logic_vector is
    variable msb : integer := x'length*63-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-63+1) := vectorify(x(i));
      msb := msb - 63;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pl2pt_bus_avt) return pl2pt_bus_at is
    variable y :  pl2pt_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pl2pt_bus_at is
    variable y :  pl2pt_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-63+1));
      msb := msb - 63;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pl2pt_bus_at) return pl2pt_bus_at is
    variable y :  pl2pt_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pl2pt_bus_avt) return pl2pt_bus_avt is
    variable y :  pl2pt_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pl2mtc_bus_at) return pl2mtc_bus_avt is
    variable y :  pl2mtc_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pl2mtc_bus_at) return std_logic_vector is
    variable msb : integer := x'length*113-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-113+1) := vectorify(x(i));
      msb := msb - 113;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pl2mtc_bus_avt) return pl2mtc_bus_at is
    variable y :  pl2mtc_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pl2mtc_bus_at is
    variable y :  pl2mtc_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-113+1));
      msb := msb - 113;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pl2mtc_bus_at) return pl2mtc_bus_at is
    variable y :  pl2mtc_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pl2mtc_bus_avt) return pl2mtc_bus_avt is
    variable y :  pl2mtc_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: tf2mtc_bus_at) return tf2mtc_bus_avt is
    variable y :  tf2mtc_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: tf2mtc_bus_at) return std_logic_vector is
    variable msb : integer := x'length*54-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-54+1) := vectorify(x(i));
      msb := msb - 54;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: tf2mtc_bus_avt) return tf2mtc_bus_at is
    variable y :  tf2mtc_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return tf2mtc_bus_at is
    variable y :  tf2mtc_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-54+1));
      msb := msb - 54;
    end loop l;
    return y;
  end function structify;
  function nullify(x: tf2mtc_bus_at) return tf2mtc_bus_at is
    variable y :  tf2mtc_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: tf2mtc_bus_avt) return tf2mtc_bus_avt is
    variable y :  tf2mtc_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mtc_out_bus_at) return mtc_out_bus_avt is
    variable y :  mtc_out_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mtc_out_bus_at) return std_logic_vector is
    variable msb : integer := x'length*193-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-193+1) := vectorify(x(i));
      msb := msb - 193;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mtc_out_bus_avt) return mtc_out_bus_at is
    variable y :  mtc_out_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mtc_out_bus_at is
    variable y :  mtc_out_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193+1));
      msb := msb - 193;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mtc_out_bus_at) return mtc_out_bus_at is
    variable y :  mtc_out_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mtc_out_bus_avt) return mtc_out_bus_avt is
    variable y :  mtc_out_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mtc2nsp_bus_at) return mtc2nsp_bus_avt is
    variable y :  mtc2nsp_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mtc2nsp_bus_at) return std_logic_vector is
    variable msb : integer := x'length*193-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-193+1) := vectorify(x(i));
      msb := msb - 193;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mtc2nsp_bus_avt) return mtc2nsp_bus_at is
    variable y :  mtc2nsp_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mtc2nsp_bus_at is
    variable y :  mtc2nsp_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193+1));
      msb := msb - 193;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mtc2nsp_bus_at) return mtc2nsp_bus_at is
    variable y :  mtc2nsp_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mtc2nsp_bus_avt) return mtc2nsp_bus_avt is
    variable y :  mtc2nsp_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: felix_stream_rt) return felix_stream_rvt is
    variable y : felix_stream_rvt;
  begin
    y(128 downto 108)          := vectorify(x.slc_muid);
    y(107 downto 1)            := vectorify(x.common);
    y(0 downto 0)              := vectorify(x.data_valid);
    return y;
  end function vectorify;
  function structify(x: felix_stream_rvt) return felix_stream_rt is
    variable y : felix_stream_rt;
  begin
    y.slc_muid                 := structify(x(128 downto 108));
    y.common                   := structify(x(107 downto 1));
    y.data_valid               := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: felix_stream_rt) return felix_stream_rt is
    variable y : felix_stream_rt;
  begin
    y.slc_muid                 := nullify(x.slc_muid);
    y.common                   := nullify(x.common);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: felix_stream_bus_at) return felix_stream_bus_avt is
    variable y :  felix_stream_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: felix_stream_bus_at) return std_logic_vector is
    variable msb : integer := x'length*129-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-129+1) := vectorify(x(i));
      msb := msb - 129;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: felix_stream_bus_avt) return felix_stream_bus_at is
    variable y :  felix_stream_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return felix_stream_bus_at is
    variable y :  felix_stream_bus_at(x'range);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-129+1));
      msb := msb - 129;
    end loop l;
    return y;
  end function structify;
  function nullify(x: felix_stream_bus_at) return felix_stream_bus_at is
    variable y :  felix_stream_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: felix_stream_bus_avt) return felix_stream_bus_avt is
    variable y :  felix_stream_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body common_types_pkg;
