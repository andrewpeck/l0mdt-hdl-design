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
     clk                  :  std_logic;
     rst                  :  std_logic;
     bx                   :  std_logic;
  end record l0mdt_control_rt;
  constant L0MDT_CONTROL_LEN : integer := 3;
  subtype l0mdt_control_rvt is std_logic_vector(L0MDT_CONTROL_LEN-1 downto 0);
  function vectorify(x: l0mdt_control_rt) return l0mdt_control_rvt;
  function structify(x: l0mdt_control_rvt) return l0mdt_control_rt;
  function nullify (x: l0mdt_control_rt) return l0mdt_control_rt;

  type l0mdt_ttc_rt is record
     bcr                  :  std_logic;
     ocr                  :  std_logic;
     ecr                  :  std_logic;
     l0a                  :  std_logic;
     l1a                  :  std_logic;
  end record l0mdt_ttc_rt;
  constant L0MDT_TTC_LEN : integer := 5;
  subtype l0mdt_ttc_rvt is std_logic_vector(L0MDT_TTC_LEN-1 downto 0);
  function vectorify(x: l0mdt_ttc_rt) return l0mdt_ttc_rvt;
  function structify(x: l0mdt_ttc_rvt) return l0mdt_ttc_rt;
  function nullify (x: l0mdt_ttc_rt) return l0mdt_ttc_rt;

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

  type ucm2hps_at is array(integer range <>) of ucm2hps_rt;
  type ucm2hps_avt is array(integer range <>) of ucm2hps_rvt;
  function vectorify(x: ucm2hps_at) return ucm2hps_avt;
  function vectorify(x: ucm2hps_at) return std_logic_vector;
  function structify(x: ucm2hps_avt) return ucm2hps_at;
  function structify(x: std_logic_vector) return ucm2hps_at;
  function nullify(x: ucm2hps_at) return ucm2hps_at;
  function nullify(x: ucm2hps_avt) return ucm2hps_avt;

  type hp_hit_data_rt is record
     local_y              :  unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
     local_x              :  unsigned(MDT_LOCAL_X_LEN-1 downto 0);
     radius               :  unsigned(MDT_RADIUS_LEN-1 downto 0);
     multilayer           :  std_logic;
     data_valid           :  std_logic;
  end record hp_hit_data_rt;
  constant HP_HIT_DATA_LEN : integer := 38;
  subtype hp_hit_data_rvt is std_logic_vector(HP_HIT_DATA_LEN-1 downto 0);
  function vectorify(x: hp_hit_data_rt) return hp_hit_data_rvt;
  function structify(x: hp_hit_data_rvt) return hp_hit_data_rt;
  function nullify (x: hp_hit_data_rt) return hp_hit_data_rt;

  type hp_hit_data_a_at is array(integer range <>) of hp_hit_data_rt;
  type hp_hit_data_a_avt is array(integer range <>) of hp_hit_data_rvt;
  function vectorify(x: hp_hit_data_a_at) return hp_hit_data_a_avt;
  function vectorify(x: hp_hit_data_a_at) return std_logic_vector;
  function structify(x: hp_hit_data_a_avt) return hp_hit_data_a_at;
  function structify(x: std_logic_vector) return hp_hit_data_a_at;
  function nullify(x: hp_hit_data_a_at) return hp_hit_data_a_at;
  function nullify(x: hp_hit_data_a_avt) return hp_hit_data_a_avt;

  type sf_seg_data_barrel_rt is record
     data_valid           :  std_logic;
     muid                 :  slc_muid_rt;
     chamber_id           :  std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
     pos                  :  signed(SF_SEG_POS_LEN-1 downto 0);
     angle                :  signed(SF_SEG_ANG_LEN-1 downto 0);
     quality              :  std_logic;
  end record sf_seg_data_barrel_rt;
  constant SF_SEG_DATA_BARREL_LEN : integer := 59;
  subtype sf_seg_data_barrel_rvt is std_logic_vector(SF_SEG_DATA_BARREL_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt;
  function nullify (x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt;

  type sf_seg_data_endcap_rt is record
     data_valid           :  std_logic;
     muid                 :  slc_muid_rt;
     chamber_id           :  std_logic_vector(SLC_CHAMBER_LEN-1 downto 0);
     pos                  :  unsigned(SF_SEG_POS_LEN-1 downto 0);
     angle                :  signed(SF_SEG_ANG_LEN-1 downto 0);
     quality              :  std_logic;
  end record sf_seg_data_endcap_rt;
  constant SF_SEG_DATA_ENDCAP_LEN : integer := 59;
  subtype sf_seg_data_endcap_rvt is std_logic_vector(SF_SEG_DATA_ENDCAP_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rvt;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt;
  function nullify (x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt;

  type sf2pt_rt is record
     dummy                :  std_logic_vector(8-1 downto 0);
     data_valid           :  std_logic;
  end record sf2pt_rt;
  constant SF2PT_LEN : integer := 9;
  subtype sf2pt_rvt is std_logic_vector(SF2PT_LEN-1 downto 0);
  function vectorify(x: sf2pt_rt) return sf2pt_rvt;
  function structify(x: sf2pt_rvt) return sf2pt_rt;
  function nullify (x: sf2pt_rt) return sf2pt_rt;

  type sf2pt_at is array(integer range <>) of sf2pt_rt;
  type sf2pt_avt is array(integer range <>) of sf2pt_rvt;
  function vectorify(x: sf2pt_at) return sf2pt_avt;
  function vectorify(x: sf2pt_at) return std_logic_vector;
  function structify(x: sf2pt_avt) return sf2pt_at;
  function structify(x: std_logic_vector) return sf2pt_at;
  function nullify(x: sf2pt_at) return sf2pt_at;
  function nullify(x: sf2pt_avt) return sf2pt_avt;

  type pipeline_rt is record
     muid                 :  slc_muid_rt;
     chambers             :  slc_chid_rt;
     common               :  slc_common_rt;
     specific             :  std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
     process_ch           :  std_logic_vector(4-1 downto 0);
     processed            :  std_logic;
     data_valid           :  std_logic;
  end record pipeline_rt;
  constant PIPELINE_LEN : integer := 129;
  subtype pipeline_rvt is std_logic_vector(PIPELINE_LEN-1 downto 0);
  function vectorify(x: pipeline_rt) return pipeline_rvt;
  function structify(x: pipeline_rvt) return pipeline_rt;
  function nullify (x: pipeline_rt) return pipeline_rt;

  type pipelines_at is array(integer range <>) of pipeline_rt;
  type pipelines_avt is array(integer range <>) of pipeline_rvt;
  function vectorify(x: pipelines_at) return pipelines_avt;
  function vectorify(x: pipelines_at) return std_logic_vector;
  function structify(x: pipelines_avt) return pipelines_at;
  function structify(x: std_logic_vector) return pipelines_at;
  function nullify(x: pipelines_at) return pipelines_at;
  function nullify(x: pipelines_avt) return pipelines_avt;

  type slc_pt_rt is record
     data_valid           :  std_logic;
     muid                 :  slc_muid_rt;
     phimod               :  signed(SLC_PT_PHIMOD_LEN-1 downto 0);
     charge               :  std_logic;
  end record slc_pt_rt;
  constant SLC_PT_LEN : integer := 30;
  subtype slc_pt_rvt is std_logic_vector(SLC_PT_LEN-1 downto 0);
  function vectorify(x: slc_pt_rt) return slc_pt_rvt;
  function structify(x: slc_pt_rvt) return slc_pt_rt;
  function nullify (x: slc_pt_rt) return slc_pt_rt;

  type mtc_tf_rt is record
     data_valid           :  std_logic;
     muid                 :  slc_muid_rt;
     eta                  :  signed(MTC_ETA_LEN-1 downto 0);
     pt                   :  unsigned(MTC_PT_LEN-1 downto 0);
     pt_thr               :  std_logic_vector(MTC_PTTHR_LEN-1 downto 0);
     charge               :  std_logic;
     nseg                 :  unsigned(MTC_NSEG_LEN-1 downto 0);
     quality              :  std_logic_vector(MTC_QUALITY_LEN-1 downto 0);
  end record mtc_tf_rt;
  constant MTC_TF_LEN : integer := 55;
  subtype mtc_tf_rvt is std_logic_vector(MTC_TF_LEN-1 downto 0);
  function vectorify(x: mtc_tf_rt) return mtc_tf_rvt;
  function structify(x: mtc_tf_rvt) return mtc_tf_rt;
  function nullify (x: mtc_tf_rt) return mtc_tf_rt;

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
  function nullify (x: l0mdt_control_rt) return l0mdt_control_rt is
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
  function nullify (x: l0mdt_ttc_rt) return l0mdt_ttc_rt is
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
  function nullify (x: hp_hit_data_rt) return hp_hit_data_rt is
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

  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt is
    variable y : sf_seg_data_barrel_rvt;
  begin
    y(58)                      := x.data_valid;
    y(57 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := x.chamber_id;
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := x(58);
    y.muid                     := structify(x(57 downto 38));
    y.chamber_id               := x(37 downto 35);
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify (x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.chamber_id               := nullify(x.chamber_id);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rvt is
    variable y : sf_seg_data_endcap_rvt;
  begin
    y(58)                      := x.data_valid;
    y(57 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := x.chamber_id;
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := x(58);
    y.muid                     := structify(x(57 downto 38));
    y.chamber_id               := x(37 downto 35);
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify (x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.chamber_id               := nullify(x.chamber_id);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: sf2pt_rt) return sf2pt_rvt is
    variable y : sf2pt_rvt;
  begin
    y(8 downto 1)              := x.dummy;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: sf2pt_rvt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.dummy                    := x(8 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: sf2pt_rt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.dummy                    := nullify(x.dummy);
    y.data_valid               := nullify(x.data_valid);
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
    variable y : std_logic_vector(x'length*9-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-9) := vectorify(x(i));
      msb := msb - 9 -1;
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
      y(i) := structify(x(msb downto msb-9));
      msb := msb - 9 -1;
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

  function vectorify(x: pipeline_rt) return pipeline_rvt is
    variable y : pipeline_rvt;
  begin
    y(128 downto 109)          := vectorify(x.muid);
    y(108 downto 97)           := vectorify(x.chambers);
    y(96 downto 57)            := vectorify(x.common);
    y(56 downto 6)             := x.specific;
    y(5 downto 2)              := x.process_ch;
    y(1)                       := x.processed;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: pipeline_rvt) return pipeline_rt is
    variable y : pipeline_rt;
  begin
    y.muid                     := structify(x(128 downto 109));
    y.chambers                 := structify(x(108 downto 97));
    y.common                   := structify(x(96 downto 57));
    y.specific                 := x(56 downto 6);
    y.process_ch               := x(5 downto 2);
    y.processed                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: pipeline_rt) return pipeline_rt is
    variable y : pipeline_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.chambers                 := nullify(x.chambers);
    y.common                   := nullify(x.common);
    y.specific                 := nullify(x.specific);
    y.process_ch               := nullify(x.process_ch);
    y.processed                := nullify(x.processed);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: pipelines_at) return pipelines_avt is
    variable y :  pipelines_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pipelines_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*129-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-129) := vectorify(x(i));
      msb := msb - 129 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pipelines_avt) return pipelines_at is
    variable y :  pipelines_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pipelines_at is
    variable y :  pipelines_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-129));
      msb := msb - 129 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pipelines_at) return pipelines_at is
    variable y :  pipelines_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pipelines_avt) return pipelines_avt is
    variable y :  pipelines_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: slc_pt_rt) return slc_pt_rvt is
    variable y : slc_pt_rvt;
  begin
    y(29)                      := x.data_valid;
    y(28 downto 9)             := vectorify(x.muid);
    y(8 downto 1)              := vectorify(x.phimod);
    y(0)                       := x.charge;
    return y;
  end function vectorify;
  function structify(x: slc_pt_rvt) return slc_pt_rt is
    variable y : slc_pt_rt;
  begin
    y.data_valid               := x(29);
    y.muid                     := structify(x(28 downto 9));
    y.phimod                   := structify(x(8 downto 1));
    y.charge                   := x(0);
    return y;
  end function structify;
  function nullify (x: slc_pt_rt) return slc_pt_rt is
    variable y : slc_pt_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.phimod                   := nullify(x.phimod);
    y.charge                   := nullify(x.charge);
    return y;
  end function nullify;

  function vectorify(x: mtc_tf_rt) return mtc_tf_rvt is
    variable y : mtc_tf_rvt;
  begin
    y(54)                      := x.data_valid;
    y(53 downto 34)            := vectorify(x.muid);
    y(33 downto 19)            := vectorify(x.eta);
    y(18 downto 10)            := vectorify(x.pt);
    y(9 downto 6)              := x.pt_thr;
    y(5)                       := x.charge;
    y(4 downto 3)              := vectorify(x.nseg);
    y(2 downto 0)              := x.quality;
    return y;
  end function vectorify;
  function structify(x: mtc_tf_rvt) return mtc_tf_rt is
    variable y : mtc_tf_rt;
  begin
    y.data_valid               := x(54);
    y.muid                     := structify(x(53 downto 34));
    y.eta                      := structify(x(33 downto 19));
    y.pt                       := structify(x(18 downto 10));
    y.pt_thr                   := x(9 downto 6);
    y.charge                   := x(5);
    y.nseg                     := structify(x(4 downto 3));
    y.quality                  := x(2 downto 0);
    return y;
  end function structify;
  function nullify (x: mtc_tf_rt) return mtc_tf_rt is
    variable y : mtc_tf_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.eta                      := nullify(x.eta);
    y.pt                       := nullify(x.pt);
    y.pt_thr                   := nullify(x.pt_thr);
    y.charge                   := nullify(x.charge);
    y.nseg                     := nullify(x.nseg);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

end package body common_types_pkg;
