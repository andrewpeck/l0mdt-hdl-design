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

  type slc_rx_data_at is array(integer range <>) of slc_rx_data_rt;
  type slc_rx_data_avt is array(integer range <>) of slc_rx_data_rvt;
  function vectorify(x: slc_rx_data_at) return slc_rx_data_avt;
  function vectorify(x: slc_rx_data_at) return std_logic_vector;
  function structify(x: slc_rx_data_avt) return slc_rx_data_at;
  function structify(x: std_logic_vector) return slc_rx_data_at;
  function nullify(x: slc_rx_data_at) return slc_rx_data_at;
  function nullify(x: slc_rx_data_avt) return slc_rx_data_avt;

  type mdt_polmux_at is array(integer range <>) of mdt_polmux_rt;
  type mdt_polmux_avt is array(integer range <>) of mdt_polmux_rvt;
  function vectorify(x: mdt_polmux_at) return mdt_polmux_avt;
  function vectorify(x: mdt_polmux_at) return std_logic_vector;
  function structify(x: mdt_polmux_avt) return mdt_polmux_at;
  function structify(x: std_logic_vector) return mdt_polmux_at;
  function nullify(x: mdt_polmux_at) return mdt_polmux_at;
  function nullify(x: mdt_polmux_avt) return mdt_polmux_avt;

  type tar2hps_at is array(integer range <>) of tar2hps_rt;
  type tar2hps_avt is array(integer range <>) of tar2hps_rvt;
  function vectorify(x: tar2hps_at) return tar2hps_avt;
  function vectorify(x: tar2hps_at) return std_logic_vector;
  function structify(x: tar2hps_avt) return tar2hps_at;
  function structify(x: std_logic_vector) return tar2hps_at;
  function nullify(x: tar2hps_at) return tar2hps_at;
  function nullify(x: tar2hps_avt) return tar2hps_avt;

  type ucm_csf_barrel_rt is record
    mbar : unsigned(UCM_MBAR_LEN-1 downto 0);
    z : unsigned(UCM_Z_ROI_LEN-1 downto 0);
  end record ucm_csf_barrel_rt;
  constant UCM_CSF_BARREL_LEN : integer := 21;
  subtype ucm_csf_barrel_rvt is std_logic_vector(UCM_CSF_BARREL_LEN-1 downto 0);
  function vectorify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rvt;
  function structify(x: ucm_csf_barrel_rvt) return ucm_csf_barrel_rt;
  function nullify(x: ucm_csf_barrel_rt) return ucm_csf_barrel_rt;

  type ucm_csf_endcap_rt is record
    mbar : unsigned(UCM_MBAR_LEN-1 downto 0);
    R : unsigned(UCM_R_ROI_LEN-1 downto 0);
  end record ucm_csf_endcap_rt;
  constant UCM_CSF_ENDCAP_LEN : integer := 15;
  subtype ucm_csf_endcap_rvt is std_logic_vector(UCM_CSF_ENDCAP_LEN-1 downto 0);
  function vectorify(x: ucm_csf_endcap_rt) return ucm_csf_endcap_rvt;
  function structify(x: ucm_csf_endcap_rvt) return ucm_csf_endcap_rt;
  function nullify(x: ucm_csf_endcap_rt) return ucm_csf_endcap_rt;

  type ucm2hps_rt is record
    muid : slc_muid_rt;
    specific : std_logic_vector(UCM2HPS_SPECIFIC_LEN-1 downto 0);
    chamber_id : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
    data_valid : std_logic;
  end record ucm2hps_rt;
  constant UCM2HPS_LEN : integer := 45;
  subtype ucm2hps_rvt is std_logic_vector(UCM2HPS_LEN-1 downto 0);
  function vectorify(x: ucm2hps_rt) return ucm2hps_rvt;
  function structify(x: ucm2hps_rvt) return ucm2hps_rt;
  function nullify(x: ucm2hps_rt) return ucm2hps_rt;

  type ucm2hps_at is array(integer range <>) of ucm2hps_rt;
  type ucm2hps_avt is array(integer range <>) of ucm2hps_rvt;
  function vectorify(x: ucm2hps_at) return ucm2hps_avt;
  function vectorify(x: ucm2hps_at) return std_logic_vector;
  function structify(x: ucm2hps_avt) return ucm2hps_at;
  function structify(x: std_logic_vector) return ucm2hps_at;
  function nullify(x: ucm2hps_at) return ucm2hps_at;
  function nullify(x: ucm2hps_avt) return ucm2hps_avt;

  type hp_hit_data_rt is record
    local_y : unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
    local_x : unsigned(MDT_LOCAL_X_LEN-1 downto 0);
    radius : unsigned(MDT_RADIUS_LEN-1 downto 0);
    multilayer : std_logic;
    data_valid : std_logic;
  end record hp_hit_data_rt;
  constant HP_HIT_DATA_LEN : integer := 38;
  subtype hp_hit_data_rvt is std_logic_vector(HP_HIT_DATA_LEN-1 downto 0);
  function vectorify(x: hp_hit_data_rt) return hp_hit_data_rvt;
  function structify(x: hp_hit_data_rvt) return hp_hit_data_rt;
  function nullify(x: hp_hit_data_rt) return hp_hit_data_rt;

  type hp_hit_data_a_at is array(integer range <>) of hp_hit_data_rt;
  type hp_hit_data_a_avt is array(integer range <>) of hp_hit_data_rvt;
  function vectorify(x: hp_hit_data_a_at) return hp_hit_data_a_avt;
  function vectorify(x: hp_hit_data_a_at) return std_logic_vector;
  function structify(x: hp_hit_data_a_avt) return hp_hit_data_a_at;
  function structify(x: std_logic_vector) return hp_hit_data_a_at;
  function nullify(x: hp_hit_data_a_at) return hp_hit_data_a_at;
  function nullify(x: hp_hit_data_a_avt) return hp_hit_data_a_avt;

  subtype sf2pt_t is std_logic_vector(SF_SEG_DATA_LEN-1 downto 0);

  type sf2pt_at is array(integer range <>) of sf2pt_t;
  type sf2pt_avt is array(integer range <>) of sf2pt_t;
  function vectorify(x: sf2pt_at) return sf2pt_avt;
  function vectorify(x: sf2pt_at) return std_logic_vector;
  function structify(x: sf2pt_avt) return sf2pt_at;
  function structify(x: std_logic_vector) return sf2pt_at;
  function nullify(x: sf2pt_at) return sf2pt_at;
  function nullify(x: sf2pt_avt) return sf2pt_avt;

  type ucm2pl_at is array(integer range <>) of ucm2pl_rt;
  type ucm2pl_avt is array(integer range <>) of ucm2pl_rvt;
  function vectorify(x: ucm2pl_at) return ucm2pl_avt;
  function vectorify(x: ucm2pl_at) return std_logic_vector;
  function structify(x: ucm2pl_avt) return ucm2pl_at;
  function structify(x: std_logic_vector) return ucm2pl_at;
  function nullify(x: ucm2pl_at) return ucm2pl_at;
  function nullify(x: ucm2pl_avt) return ucm2pl_avt;

  type pl2pt_at is array(integer range <>) of pl2pt_rt;
  type pl2pt_avt is array(integer range <>) of pl2pt_rvt;
  function vectorify(x: pl2pt_at) return pl2pt_avt;
  function vectorify(x: pl2pt_at) return std_logic_vector;
  function structify(x: pl2pt_avt) return pl2pt_at;
  function structify(x: std_logic_vector) return pl2pt_at;
  function nullify(x: pl2pt_at) return pl2pt_at;
  function nullify(x: pl2pt_avt) return pl2pt_avt;

  type pl2mtc_at is array(integer range <>) of pl2mtc_rt;
  type pl2mtc_avt is array(integer range <>) of pl2mtc_rvt;
  function vectorify(x: pl2mtc_at) return pl2mtc_avt;
  function vectorify(x: pl2mtc_at) return std_logic_vector;
  function structify(x: pl2mtc_avt) return pl2mtc_at;
  function structify(x: std_logic_vector) return pl2mtc_at;
  function nullify(x: pl2mtc_at) return pl2mtc_at;
  function nullify(x: pl2mtc_avt) return pl2mtc_avt;

  type tf2mtc_at is array(integer range <>) of tf2mtc_rt;
  type tf2mtc_avt is array(integer range <>) of tf2mtc_rvt;
  function vectorify(x: tf2mtc_at) return tf2mtc_avt;
  function vectorify(x: tf2mtc_at) return std_logic_vector;
  function structify(x: tf2mtc_avt) return tf2mtc_at;
  function structify(x: std_logic_vector) return tf2mtc_at;
  function nullify(x: tf2mtc_at) return tf2mtc_at;
  function nullify(x: tf2mtc_avt) return tf2mtc_avt;

  type mtc_out_at is array(integer range <>) of mtc_out_rt;
  type mtc_out_avt is array(integer range <>) of mtc_out_rvt;
  function vectorify(x: mtc_out_at) return mtc_out_avt;
  function vectorify(x: mtc_out_at) return std_logic_vector;
  function structify(x: mtc_out_avt) return mtc_out_at;
  function structify(x: std_logic_vector) return mtc_out_at;
  function nullify(x: mtc_out_at) return mtc_out_at;
  function nullify(x: mtc_out_avt) return mtc_out_avt;

  type mtc2nsp_at is array(integer range <>) of mtc2nsp_rt;
  type mtc2nsp_avt is array(integer range <>) of mtc2nsp_rvt;
  function vectorify(x: mtc2nsp_at) return mtc2nsp_avt;
  function vectorify(x: mtc2nsp_at) return std_logic_vector;
  function structify(x: mtc2nsp_avt) return mtc2nsp_at;
  function structify(x: std_logic_vector) return mtc2nsp_at;
  function nullify(x: mtc2nsp_at) return mtc2nsp_at;
  function nullify(x: mtc2nsp_avt) return mtc2nsp_avt;

  type felix_stream_rt is record
    muid : slc_muid_rt;
    common : slc_common_rt;
    data_valid : std_logic;
  end record felix_stream_rt;
  constant FELIX_STREAM_LEN : integer := 61;
  subtype felix_stream_rvt is std_logic_vector(FELIX_STREAM_LEN-1 downto 0);
  function vectorify(x: felix_stream_rt) return felix_stream_rvt;
  function structify(x: felix_stream_rvt) return felix_stream_rt;
  function nullify(x: felix_stream_rt) return felix_stream_rt;

  type felix_stream_at is array(integer range <>) of felix_stream_rt;
  type felix_stream_avt is array(integer range <>) of felix_stream_rvt;
  function vectorify(x: felix_stream_at) return felix_stream_avt;
  function vectorify(x: felix_stream_at) return std_logic_vector;
  function structify(x: felix_stream_avt) return felix_stream_at;
  function structify(x: std_logic_vector) return felix_stream_at;
  function nullify(x: felix_stream_at) return felix_stream_at;
  function nullify(x: felix_stream_avt) return felix_stream_avt;

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

  function vectorify(x: slc_rx_data_at) return slc_rx_data_avt is
    variable y :  slc_rx_data_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: slc_rx_data_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*124-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-124) := vectorify(x(i));
      msb := msb - 124 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: slc_rx_data_avt) return slc_rx_data_at is
    variable y :  slc_rx_data_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return slc_rx_data_at is
    variable y :  slc_rx_data_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-124));
      msb := msb - 124 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: slc_rx_data_at) return slc_rx_data_at is
    variable y :  slc_rx_data_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: slc_rx_data_avt) return slc_rx_data_avt is
    variable y :  slc_rx_data_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mdt_polmux_at) return mdt_polmux_avt is
    variable y :  mdt_polmux_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mdt_polmux_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*42-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-42) := vectorify(x(i));
      msb := msb - 42 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mdt_polmux_avt) return mdt_polmux_at is
    variable y :  mdt_polmux_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mdt_polmux_at is
    variable y :  mdt_polmux_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-42));
      msb := msb - 42 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mdt_polmux_at) return mdt_polmux_at is
    variable y :  mdt_polmux_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mdt_polmux_avt) return mdt_polmux_avt is
    variable y :  mdt_polmux_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: tar2hps_at) return tar2hps_avt is
    variable y :  tar2hps_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: tar2hps_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*36-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-36) := vectorify(x(i));
      msb := msb - 36 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: tar2hps_avt) return tar2hps_at is
    variable y :  tar2hps_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return tar2hps_at is
    variable y :  tar2hps_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-36));
      msb := msb - 36 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: tar2hps_at) return tar2hps_at is
    variable y :  tar2hps_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: tar2hps_avt) return tar2hps_avt is
    variable y :  tar2hps_avt(x'range);
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

  function vectorify(x: ucm_csf_endcap_rt) return ucm_csf_endcap_rvt is
    variable y : ucm_csf_endcap_rvt;
  begin
    y(14 downto 4)             := vectorify(x.mbar);
    y(3 downto 0)              := vectorify(x.R);
    return y;
  end function vectorify;
  function structify(x: ucm_csf_endcap_rvt) return ucm_csf_endcap_rt is
    variable y : ucm_csf_endcap_rt;
  begin
    y.mbar                     := structify(x(14 downto 4));
    y.R                        := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify(x: ucm_csf_endcap_rt) return ucm_csf_endcap_rt is
    variable y : ucm_csf_endcap_rt;
  begin
    y.mbar                     := nullify(x.mbar);
    y.R                        := nullify(x.R);
    return y;
  end function nullify;

  function vectorify(x: ucm2hps_rt) return ucm2hps_rvt is
    variable y : ucm2hps_rvt;
  begin
    y(44 downto 25)            := vectorify(x.muid);
    y(24 downto 4)             := x.specific;
    y(3 downto 1)              := x.chamber_id;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm2hps_rvt) return ucm2hps_rt is
    variable y : ucm2hps_rt;
  begin
    y.muid                     := structify(x(44 downto 25));
    y.specific                 := x(24 downto 4);
    y.chamber_id               := x(3 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: ucm2hps_rt) return ucm2hps_rt is
    variable y : ucm2hps_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.specific                 := nullify(x.specific);
    y.chamber_id               := nullify(x.chamber_id);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: ucm2hps_at) return ucm2hps_avt is
    variable y :  ucm2hps_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm2hps_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*45-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-45) := vectorify(x(i));
      msb := msb - 45 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm2hps_avt) return ucm2hps_at is
    variable y :  ucm2hps_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm2hps_at is
    variable y :  ucm2hps_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-45));
      msb := msb - 45 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm2hps_at) return ucm2hps_at is
    variable y :  ucm2hps_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm2hps_avt) return ucm2hps_avt is
    variable y :  ucm2hps_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: hp_hit_data_rt) return hp_hit_data_rvt is
    variable y : hp_hit_data_rvt;
  begin
    y(37 downto 24)            := vectorify(x.local_y);
    y(23 downto 11)            := vectorify(x.local_x);
    y(10 downto 2)             := vectorify(x.radius);
    y(1)                       := x.multilayer;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hit_data_rvt) return hp_hit_data_rt is
    variable y : hp_hit_data_rt;
  begin
    y.local_y                  := structify(x(37 downto 24));
    y.local_x                  := structify(x(23 downto 11));
    y.radius                   := structify(x(10 downto 2));
    y.multilayer               := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: hp_hit_data_rt) return hp_hit_data_rt is
    variable y : hp_hit_data_rt;
  begin
    y.local_y                  := nullify(x.local_y);
    y.local_x                  := nullify(x.local_x);
    y.radius                   := nullify(x.radius);
    y.multilayer               := nullify(x.multilayer);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: hp_hit_data_a_at) return hp_hit_data_a_avt is
    variable y :  hp_hit_data_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: hp_hit_data_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*38-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-38) := vectorify(x(i));
      msb := msb - 38 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: hp_hit_data_a_avt) return hp_hit_data_a_at is
    variable y :  hp_hit_data_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return hp_hit_data_a_at is
    variable y :  hp_hit_data_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-38));
      msb := msb - 38 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: hp_hit_data_a_at) return hp_hit_data_a_at is
    variable y :  hp_hit_data_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: hp_hit_data_a_avt) return hp_hit_data_a_avt is
    variable y :  hp_hit_data_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: sf2pt_at) return sf2pt_avt is
    variable y :  sf2pt_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: sf2pt_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*SF_SEG_DATA_LEN-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-SF_SEG_DATA_LEN) := vectorify(x(i));
      msb := msb - SF_SEG_DATA_LEN -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: sf2pt_avt) return sf2pt_at is
    variable y :  sf2pt_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return sf2pt_at is
    variable y :  sf2pt_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-SF_SEG_DATA_LEN));
      msb := msb - SF_SEG_DATA_LEN -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: sf2pt_at) return sf2pt_at is
    variable y :  sf2pt_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: sf2pt_avt) return sf2pt_avt is
    variable y :  sf2pt_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: ucm2pl_at) return ucm2pl_avt is
    variable y :  ucm2pl_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: ucm2pl_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*129-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-129) := vectorify(x(i));
      msb := msb - 129 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: ucm2pl_avt) return ucm2pl_at is
    variable y :  ucm2pl_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return ucm2pl_at is
    variable y :  ucm2pl_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-129));
      msb := msb - 129 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: ucm2pl_at) return ucm2pl_at is
    variable y :  ucm2pl_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: ucm2pl_avt) return ucm2pl_avt is
    variable y :  ucm2pl_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pl2pt_at) return pl2pt_avt is
    variable y :  pl2pt_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pl2pt_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*30-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-30) := vectorify(x(i));
      msb := msb - 30 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pl2pt_avt) return pl2pt_at is
    variable y :  pl2pt_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pl2pt_at is
    variable y :  pl2pt_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-30));
      msb := msb - 30 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pl2pt_at) return pl2pt_at is
    variable y :  pl2pt_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pl2pt_avt) return pl2pt_avt is
    variable y :  pl2pt_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: pl2mtc_at) return pl2mtc_avt is
    variable y :  pl2mtc_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pl2mtc_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*86-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-86) := vectorify(x(i));
      msb := msb - 86 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pl2mtc_avt) return pl2mtc_at is
    variable y :  pl2mtc_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pl2mtc_at is
    variable y :  pl2mtc_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-86));
      msb := msb - 86 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pl2mtc_at) return pl2mtc_at is
    variable y :  pl2mtc_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pl2mtc_avt) return pl2mtc_avt is
    variable y :  pl2mtc_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: tf2mtc_at) return tf2mtc_avt is
    variable y :  tf2mtc_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: tf2mtc_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*55-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-55) := vectorify(x(i));
      msb := msb - 55 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: tf2mtc_avt) return tf2mtc_at is
    variable y :  tf2mtc_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return tf2mtc_at is
    variable y :  tf2mtc_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-55));
      msb := msb - 55 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: tf2mtc_at) return tf2mtc_at is
    variable y :  tf2mtc_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: tf2mtc_avt) return tf2mtc_avt is
    variable y :  tf2mtc_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mtc_out_at) return mtc_out_avt is
    variable y :  mtc_out_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mtc_out_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*41-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-41) := vectorify(x(i));
      msb := msb - 41 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mtc_out_avt) return mtc_out_at is
    variable y :  mtc_out_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mtc_out_at is
    variable y :  mtc_out_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-41));
      msb := msb - 41 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mtc_out_at) return mtc_out_at is
    variable y :  mtc_out_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mtc_out_avt) return mtc_out_avt is
    variable y :  mtc_out_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mtc2nsp_at) return mtc2nsp_avt is
    variable y :  mtc2nsp_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mtc2nsp_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*41-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-41) := vectorify(x(i));
      msb := msb - 41 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mtc2nsp_avt) return mtc2nsp_at is
    variable y :  mtc2nsp_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mtc2nsp_at is
    variable y :  mtc2nsp_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-41));
      msb := msb - 41 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mtc2nsp_at) return mtc2nsp_at is
    variable y :  mtc2nsp_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mtc2nsp_avt) return mtc2nsp_avt is
    variable y :  mtc2nsp_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: felix_stream_rt) return felix_stream_rvt is
    variable y : felix_stream_rvt;
  begin
    y(60 downto 41)            := vectorify(x.muid);
    y(40 downto 1)             := vectorify(x.common);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: felix_stream_rvt) return felix_stream_rt is
    variable y : felix_stream_rt;
  begin
    y.muid                     := structify(x(60 downto 41));
    y.common                   := structify(x(40 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: felix_stream_rt) return felix_stream_rt is
    variable y : felix_stream_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.common                   := nullify(x.common);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: felix_stream_at) return felix_stream_avt is
    variable y :  felix_stream_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: felix_stream_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*61-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-61) := vectorify(x(i));
      msb := msb - 61 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: felix_stream_avt) return felix_stream_at is
    variable y :  felix_stream_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return felix_stream_at is
    variable y :  felix_stream_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-61));
      msb := msb - 61 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: felix_stream_at) return felix_stream_at is
    variable y :  felix_stream_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: felix_stream_avt) return felix_stream_avt is
    variable y :  felix_stream_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

end package body common_types_pkg;
