library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;

package common_types_pkg is

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

  type ucm_csf_barrel_rt is record
    mbar : unsigned(UCM2SF_VEC_ANG_LEN-1 downto 0);
    z : unsigned(UCM2SF_VEC_POS_LEN-1 downto 0);
  end record ucm_csf_barrel_rt;
  constant UCM_CSF_BARREL_LEN : integer := 21;
  subtype ucm_csf_barrel_rvt is std_logic_vector(UCM_CSF_BARREL_LEN-1 downto 0);
  function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rvt;
  function structify(x: ucm_csf_barrel_rvt) return ucm_csf_barrel_rt;
  function nullify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt;

  type ucm2hps_bus_at is array(integer range <>) of ucm2hps_rt;
  type ucm2hps_bus_avt is array(integer range <>) of ucm2hps_rvt;
  function vectorify(x: ucm2hps_bus_at) return ucm2hps_bus_avt;
  function vectorify(x: ucm2hps_bus_at) return std_logic_vector;
  function structify(x: ucm2hps_bus_avt) return ucm2hps_bus_at;
  function structify(x: std_logic_vector) return ucm2hps_bus_at;
  function nullify(x: ucm2hps_bus_at) return ucm2hps_bus_at;
  function nullify(x: ucm2hps_bus_avt) return ucm2hps_bus_avt;

  type heg2sf_bus_at is array(integer range <>) of heg2sf_rt;
  type heg2sf_bus_avt is array(integer range <>) of heg2sf_rvt;
  function vectorify(x: heg2sf_bus_at) return heg2sf_bus_avt;
  function vectorify(x: heg2sf_bus_at) return std_logic_vector;
  function structify(x: heg2sf_bus_avt) return heg2sf_bus_at;
  function structify(x: std_logic_vector) return heg2sf_bus_at;
  function nullify(x: heg2sf_bus_at) return heg2sf_bus_at;
  function nullify(x: heg2sf_bus_avt) return heg2sf_bus_avt;

  type heg2sf_mdt_rt is record
    local_y : unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
    local_x : unsigned(MDT_LOCAL_X_LEN-1 downto 0);
    radius : unsigned(MDT_RADIUS_LEN-1 downto 0);
    multilayer : std_logic;
    data_valid : std_logic;
  end record heg2sf_mdt_rt;
  constant HEG2SF_MDT_LEN : integer := 38;
  subtype heg2sf_mdt_rvt is std_logic_vector(HEG2SF_MDT_LEN-1 downto 0);
  function vectorify(x: heg2sf_mdt_rt) return heg2sf_mdt_rvt;
  function structify(x: heg2sf_mdt_rvt) return heg2sf_mdt_rt;
  function nullify(x: heg2sf_mdt_rt) return heg2sf_mdt_rt;

  type heg2sf_mdt_bus_at is array(integer range <>) of heg2sf_mdt_rt;
  type heg2sf_mdt_bus_avt is array(integer range <>) of heg2sf_mdt_rvt;
  function vectorify(x: heg2sf_mdt_bus_at) return heg2sf_mdt_bus_avt;
  function vectorify(x: heg2sf_mdt_bus_at) return std_logic_vector;
  function structify(x: heg2sf_mdt_bus_avt) return heg2sf_mdt_bus_at;
  function structify(x: std_logic_vector) return heg2sf_mdt_bus_at;
  function nullify(x: heg2sf_mdt_bus_at) return heg2sf_mdt_bus_at;
  function nullify(x: heg2sf_mdt_bus_avt) return heg2sf_mdt_bus_avt;

  subtype sf2pt_t is std_logic_vector(SF_SEG_DATA_LEN-1 downto 0);

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

  function vectorify(x: l0mdt_control_rt) return l0mdt_control_rvt is
    variable y : l0mdt_control_rvt;
  begin
    y(2)                       := x.clk;
    y(1)                       := x.rst;
    y(0)                       := x.bx;
    return y;
  end function vectorify;
  function structify(x: l0mdt_control_rvt) return l0mdt_control_rt is
    variable y : l0mdt_control_rt;
  begin
    y.clk                      := x(2);
    y.rst                      := x(1);
    y.bx                       := x(0);
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
    y(4)                       := x.bcr;
    y(3)                       := x.ocr;
    y(2)                       := x.ecr;
    y(1)                       := x.l0a;
    y(0)                       := x.l1a;
    return y;
  end function vectorify;
  function structify(x: l0mdt_ttc_rvt) return l0mdt_ttc_rt is
    variable y : l0mdt_ttc_rt;
  begin
    y.bcr                      := x(4);
    y.ocr                      := x(3);
    y.ecr                      := x(2);
    y.l0a                      := x(1);
    y.l1a                      := x(0);
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
    variable y : std_logic_vector(x'length*193-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-193) := vectorify(x(i));
      msb := msb - 193 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193));
      msb := msb - 193 -1;
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
    variable y : std_logic_vector(x'length*85-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-85) := vectorify(x(i));
      msb := msb - 85 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-85));
      msb := msb - 85 -1;
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
    variable y : std_logic_vector(x'length*42-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-42) := vectorify(x(i));
      msb := msb - 42 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-42));
      msb := msb - 42 -1;
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
    variable y : std_logic_vector(x'length*74-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-74) := vectorify(x(i));
      msb := msb - 74 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-74));
      msb := msb - 74 -1;
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

  function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rvt is
    variable y : ucm_csf_barrel_rvt;
  begin
    y(20 downto 10)            := vectorify(x.mbar);
    y(9 downto 0)              := vectorify(x.z);
    return y;
  end function vectorify;
  function structify(x: ucm_csf_barrel_rvt) return ucm_csf_barrel_rt is
    variable y : ucm_csf_barrel_rt;
  begin
    y.mbar                     := structify(x(20 downto 10));
    y.z                        := structify(x(9 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt is
    variable y : ucm_csf_barrel_rt;
  begin
    y.mbar                     := nullify(x.mbar);
    y.z                        := nullify(x.z);
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
    variable y : std_logic_vector(x'length*63-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-63) := vectorify(x(i));
      msb := msb - 63 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-63));
      msb := msb - 63 -1;
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

  function vectorify(x: heg2sf_bus_at) return heg2sf_bus_avt is
    variable y :  heg2sf_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: heg2sf_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*63-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-63) := vectorify(x(i));
      msb := msb - 63 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: heg2sf_bus_avt) return heg2sf_bus_at is
    variable y :  heg2sf_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return heg2sf_bus_at is
    variable y :  heg2sf_bus_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-63));
      msb := msb - 63 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: heg2sf_bus_at) return heg2sf_bus_at is
    variable y :  heg2sf_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: heg2sf_bus_avt) return heg2sf_bus_avt is
    variable y :  heg2sf_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: heg2sf_mdt_rt) return heg2sf_mdt_rvt is
    variable y : heg2sf_mdt_rvt;
  begin
    y(37 downto 24)            := vectorify(x.local_y);
    y(23 downto 11)            := vectorify(x.local_x);
    y(10 downto 2)             := vectorify(x.radius);
    y(1)                       := x.multilayer;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: heg2sf_mdt_rvt) return heg2sf_mdt_rt is
    variable y : heg2sf_mdt_rt;
  begin
    y.local_y                  := structify(x(37 downto 24));
    y.local_x                  := structify(x(23 downto 11));
    y.radius                   := structify(x(10 downto 2));
    y.multilayer               := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: heg2sf_mdt_rt) return heg2sf_mdt_rt is
    variable y : heg2sf_mdt_rt;
  begin
    y.local_y                  := nullify(x.local_y);
    y.local_x                  := nullify(x.local_x);
    y.radius                   := nullify(x.radius);
    y.multilayer               := nullify(x.multilayer);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: heg2sf_mdt_bus_at) return heg2sf_mdt_bus_avt is
    variable y :  heg2sf_mdt_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: heg2sf_mdt_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*38-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-38) := vectorify(x(i));
      msb := msb - 38 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: heg2sf_mdt_bus_avt) return heg2sf_mdt_bus_at is
    variable y :  heg2sf_mdt_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return heg2sf_mdt_bus_at is
    variable y :  heg2sf_mdt_bus_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-38));
      msb := msb - 38 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: heg2sf_mdt_bus_at) return heg2sf_mdt_bus_at is
    variable y :  heg2sf_mdt_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: heg2sf_mdt_bus_avt) return heg2sf_mdt_bus_avt is
    variable y :  heg2sf_mdt_bus_avt(x'range);
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
    variable y : std_logic_vector(x'length*62-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-62) := vectorify(x(i));
      msb := msb - 62 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-62));
      msb := msb - 62 -1;
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
    variable y : std_logic_vector(x'length*148-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-148) := vectorify(x(i));
      msb := msb - 148 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-148));
      msb := msb - 148 -1;
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
    variable y : std_logic_vector(x'length*63-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-63) := vectorify(x(i));
      msb := msb - 63 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-63));
      msb := msb - 63 -1;
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
    variable y : std_logic_vector(x'length*113-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-113) := vectorify(x(i));
      msb := msb - 113 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-113));
      msb := msb - 113 -1;
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
    variable y : std_logic_vector(x'length*54-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-54) := vectorify(x(i));
      msb := msb - 54 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-54));
      msb := msb - 54 -1;
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
    variable y : std_logic_vector(x'length*193-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-193) := vectorify(x(i));
      msb := msb - 193 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193));
      msb := msb - 193 -1;
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
    variable y : std_logic_vector(x'length*193-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-193) := vectorify(x(i));
      msb := msb - 193 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-193));
      msb := msb - 193 -1;
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
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: felix_stream_rvt) return felix_stream_rt is
    variable y : felix_stream_rt;
  begin
    y.slc_muid                 := structify(x(128 downto 108));
    y.common                   := structify(x(107 downto 1));
    y.data_valid               := x(0);
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
    variable y : std_logic_vector(x'length*129-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-129) := vectorify(x(i));
      msb := msb - 129 -1;
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
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-129));
      msb := msb - 129 -1;
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
