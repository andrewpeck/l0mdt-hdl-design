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
library heg_lib;
use heg_lib.heg_pkg.all;

package gldl_ult_tp_sim_pkg is

  type input_mdt_rt is record
    ToA : unsigned(64-1 downto 0);
    station : unsigned(8-1 downto 0);
    chamber : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    tar : tar2hps_rt;
    tdc : tdcpolmux2tar_rt;
  end record input_mdt_rt;
  constant INPUT_MDT_LEN : integer := 154;
  subtype input_mdt_rvt is std_logic_vector(INPUT_MDT_LEN-1 downto 0);
  function vectorify(x: input_mdt_rt) return input_mdt_rvt;
  function structify(x: input_mdt_rvt) return input_mdt_rt;
  function nullify(x: input_mdt_rt) return input_mdt_rt;

  constant TB_TAR_FIFO_WIDTH : integer := 32;

  type tar2hps_tb_at is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tar2hps_rt;
  type tar2hps_tb_avt is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tar2hps_rvt;
  function vectorify(x: tar2hps_tb_at) return tar2hps_tb_avt;
  function vectorify(x: tar2hps_tb_at) return std_logic_vector;
  function structify(x: tar2hps_tb_avt) return tar2hps_tb_at;
  function structify(x: std_logic_vector) return tar2hps_tb_at;
  function nullify(x: tar2hps_tb_at) return tar2hps_tb_at;
  function nullify(x: tar2hps_tb_avt) return tar2hps_tb_avt;

  type pol2tar_tb_at is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tdcpolmux2tar_rt;
  type pol2tar_tb_avt is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tdcpolmux2tar_rvt;
  function vectorify(x: pol2tar_tb_at) return pol2tar_tb_avt;
  function vectorify(x: pol2tar_tb_at) return std_logic_vector;
  function structify(x: pol2tar_tb_avt) return pol2tar_tb_at;
  function structify(x: std_logic_vector) return pol2tar_tb_at;
  function nullify(x: pol2tar_tb_at) return pol2tar_tb_at;
  function nullify(x: pol2tar_tb_avt) return pol2tar_tb_avt;

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

  type out_heg_bm_hit_sim_rt is record
    ToA : unsigned(64-1 downto 0);
    station : unsigned(4-1 downto 0);
    thread : unsigned(4-1 downto 0);
    data : heg2sfhit_rt;
  end record out_heg_bm_hit_sim_rt;
  constant OUT_HEG_BM_HIT_SIM_LEN : integer := 113;
  subtype out_heg_bm_hit_sim_rvt is std_logic_vector(OUT_HEG_BM_HIT_SIM_LEN-1 downto 0);
  function vectorify(x: out_heg_bm_hit_sim_rt) return out_heg_bm_hit_sim_rvt;
  function structify(x: out_heg_bm_hit_sim_rvt) return out_heg_bm_hit_sim_rt;
  function nullify(x: out_heg_bm_hit_sim_rt) return out_heg_bm_hit_sim_rt;

  type out_heg_bm_slc_sim_rt is record
    ToA : unsigned(64-1 downto 0);
    station : unsigned(4-1 downto 0);
    thread : unsigned(4-1 downto 0);
    data : heg2sfslc_rt;
  end record out_heg_bm_slc_sim_rt;
  constant OUT_HEG_BM_SLC_SIM_LEN : integer := 144;
  subtype out_heg_bm_slc_sim_rvt is std_logic_vector(OUT_HEG_BM_SLC_SIM_LEN-1 downto 0);
  function vectorify(x: out_heg_bm_slc_sim_rt) return out_heg_bm_slc_sim_rvt;
  function structify(x: out_heg_bm_slc_sim_rvt) return out_heg_bm_slc_sim_rt;
  function nullify(x: out_heg_bm_slc_sim_rt) return out_heg_bm_slc_sim_rt;

  type out_heg_bm_ctrl_sim_rt is record
    ToA : unsigned(64-1 downto 0);
    station : unsigned(4-1 downto 0);
    thread : unsigned(4-1 downto 0);
    heg_ctrl : heg_ctrl2sf_rt;
    data : heg2sfslc_rt;
  end record out_heg_bm_ctrl_sim_rt;
  constant OUT_HEG_BM_CTRL_SIM_LEN : integer := 147;
  subtype out_heg_bm_ctrl_sim_rvt is std_logic_vector(OUT_HEG_BM_CTRL_SIM_LEN-1 downto 0);
  function vectorify(x: out_heg_bm_ctrl_sim_rt) return out_heg_bm_ctrl_sim_rvt;
  function structify(x: out_heg_bm_ctrl_sim_rvt) return out_heg_bm_ctrl_sim_rt;
  function nullify(x: out_heg_bm_ctrl_sim_rt) return out_heg_bm_ctrl_sim_rt;

  type in_pt_pt2sf_sim_rt is record
    ToA : unsigned(64-1 downto 0);
    station : unsigned(4-1 downto 0);
    thread : unsigned(4-1 downto 0);
    data : sf2ptcalc_rt;
  end record in_pt_pt2sf_sim_rt;
  constant IN_PT_PT2SF_SIM_LEN : integer := 136;
  subtype in_pt_pt2sf_sim_rvt is std_logic_vector(IN_PT_PT2SF_SIM_LEN-1 downto 0);
  function vectorify(x: in_pt_pt2sf_sim_rt) return in_pt_pt2sf_sim_rvt;
  function structify(x: in_pt_pt2sf_sim_rvt) return in_pt_pt2sf_sim_rt;
  function nullify(x: in_pt_pt2sf_sim_rt) return in_pt_pt2sf_sim_rt;

  type in_pt_mpl_sim_rt is record
    ToA : unsigned(64-1 downto 0);
    thread : unsigned(4-1 downto 0);
    data : pl2ptcalc_rt;
  end record in_pt_mpl_sim_rt;
  constant IN_PT_MPL_SIM_LEN : integer := 126;
  subtype in_pt_mpl_sim_rvt is std_logic_vector(IN_PT_MPL_SIM_LEN-1 downto 0);
  function vectorify(x: in_pt_mpl_sim_rt) return in_pt_mpl_sim_rvt;
  function structify(x: in_pt_mpl_sim_rvt) return in_pt_mpl_sim_rt;
  function nullify(x: in_pt_mpl_sim_rt) return in_pt_mpl_sim_rt;

  type in_mtc_pt_sim_rt is record
    ToA : unsigned(64-1 downto 0);
    thread : unsigned(4-1 downto 0);
    data : ptcalc2mtc_rt;
  end record in_mtc_pt_sim_rt;
  constant IN_MTC_PT_SIM_LEN : integer := 122;
  subtype in_mtc_pt_sim_rvt is std_logic_vector(IN_MTC_PT_SIM_LEN-1 downto 0);
  function vectorify(x: in_mtc_pt_sim_rt) return in_mtc_pt_sim_rvt;
  function structify(x: in_mtc_pt_sim_rvt) return in_mtc_pt_sim_rt;
  function nullify(x: in_mtc_pt_sim_rt) return in_mtc_pt_sim_rt;

  type in_mtc_mpl_sim_rt is record
    ToA : unsigned(64-1 downto 0);
    thread : unsigned(4-1 downto 0);
    data : pl2mtc_rt;
  end record in_mtc_mpl_sim_rt;
  constant IN_MTC_MPL_SIM_LEN : integer := 181;
  subtype in_mtc_mpl_sim_rvt is std_logic_vector(IN_MTC_MPL_SIM_LEN-1 downto 0);
  function vectorify(x: in_mtc_mpl_sim_rt) return in_mtc_mpl_sim_rvt;
  function structify(x: in_mtc_mpl_sim_rvt) return in_mtc_mpl_sim_rt;
  function nullify(x: in_mtc_mpl_sim_rt) return in_mtc_mpl_sim_rt;

end package gldl_ult_tp_sim_pkg;

------------------------------------------------------------

package body gldl_ult_tp_sim_pkg is

  function vectorify(x: input_mdt_rt) return input_mdt_rvt is
    variable y : input_mdt_rvt;
  begin
    y(153 downto 90)           := vectorify(x.ToA);
    y(89 downto 82)            := vectorify(x.station);
    y(81 downto 78)            := vectorify(x.chamber);
    y(77 downto 42)            := vectorify(x.tar);
    y(41 downto 0)             := vectorify(x.tdc);
    return y;
  end function vectorify;
  function structify(x: input_mdt_rvt) return input_mdt_rt is
    variable y : input_mdt_rt;
  begin
    y.ToA                      := structify(x(153 downto 90));
    y.station                  := structify(x(89 downto 82));
    y.chamber                  := structify(x(81 downto 78));
    y.tar                      := structify(x(77 downto 42));
    y.tdc                      := structify(x(41 downto 0));
    return y;
  end function structify;
  function nullify(x: input_mdt_rt) return input_mdt_rt is
    variable y : input_mdt_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.station                  := nullify(x.station);
    y.chamber                  := nullify(x.chamber);
    y.tar                      := nullify(x.tar);
    y.tdc                      := nullify(x.tdc);
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

  function vectorify(x: pol2tar_tb_at) return pol2tar_tb_avt is
    variable y :  pol2tar_tb_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: pol2tar_tb_at) return std_logic_vector is
    variable msb : integer := x'length*42-1;
    variable y : std_logic_vector(msb downto 0);
  begin
    l: for i in x'range loop
      y(msb downto msb-42+1) := vectorify(x(i));
      msb := msb - 42;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: pol2tar_tb_avt) return pol2tar_tb_at is
    variable y :  pol2tar_tb_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return pol2tar_tb_at is
    variable y :  pol2tar_tb_at;
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-42+1));
      msb := msb - 42;
    end loop l;
    return y;
  end function structify;
  function nullify(x: pol2tar_tb_at) return pol2tar_tb_at is
    variable y :  pol2tar_tb_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: pol2tar_tb_avt) return pol2tar_tb_avt is
    variable y :  pol2tar_tb_avt;
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

  function vectorify(x: out_heg_bm_hit_sim_rt) return out_heg_bm_hit_sim_rvt is
    variable y : out_heg_bm_hit_sim_rvt;
  begin
    y(112 downto 49)           := vectorify(x.ToA);
    y(48 downto 45)            := vectorify(x.station);
    y(44 downto 41)            := vectorify(x.thread);
    y(40 downto 0)             := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: out_heg_bm_hit_sim_rvt) return out_heg_bm_hit_sim_rt is
    variable y : out_heg_bm_hit_sim_rt;
  begin
    y.ToA                      := structify(x(112 downto 49));
    y.station                  := structify(x(48 downto 45));
    y.thread                   := structify(x(44 downto 41));
    y.data                     := structify(x(40 downto 0));
    return y;
  end function structify;
  function nullify(x: out_heg_bm_hit_sim_rt) return out_heg_bm_hit_sim_rt is
    variable y : out_heg_bm_hit_sim_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.station                  := nullify(x.station);
    y.thread                   := nullify(x.thread);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: out_heg_bm_slc_sim_rt) return out_heg_bm_slc_sim_rvt is
    variable y : out_heg_bm_slc_sim_rvt;
  begin
    y(143 downto 80)           := vectorify(x.ToA);
    y(79 downto 76)            := vectorify(x.station);
    y(75 downto 72)            := vectorify(x.thread);
    y(71 downto 0)             := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: out_heg_bm_slc_sim_rvt) return out_heg_bm_slc_sim_rt is
    variable y : out_heg_bm_slc_sim_rt;
  begin
    y.ToA                      := structify(x(143 downto 80));
    y.station                  := structify(x(79 downto 76));
    y.thread                   := structify(x(75 downto 72));
    y.data                     := structify(x(71 downto 0));
    return y;
  end function structify;
  function nullify(x: out_heg_bm_slc_sim_rt) return out_heg_bm_slc_sim_rt is
    variable y : out_heg_bm_slc_sim_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.station                  := nullify(x.station);
    y.thread                   := nullify(x.thread);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: out_heg_bm_ctrl_sim_rt) return out_heg_bm_ctrl_sim_rvt is
    variable y : out_heg_bm_ctrl_sim_rvt;
  begin
    y(146 downto 83)           := vectorify(x.ToA);
    y(82 downto 79)            := vectorify(x.station);
    y(78 downto 75)            := vectorify(x.thread);
    y(74 downto 72)            := vectorify(x.heg_ctrl);
    y(71 downto 0)             := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: out_heg_bm_ctrl_sim_rvt) return out_heg_bm_ctrl_sim_rt is
    variable y : out_heg_bm_ctrl_sim_rt;
  begin
    y.ToA                      := structify(x(146 downto 83));
    y.station                  := structify(x(82 downto 79));
    y.thread                   := structify(x(78 downto 75));
    y.heg_ctrl                 := structify(x(74 downto 72));
    y.data                     := structify(x(71 downto 0));
    return y;
  end function structify;
  function nullify(x: out_heg_bm_ctrl_sim_rt) return out_heg_bm_ctrl_sim_rt is
    variable y : out_heg_bm_ctrl_sim_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.station                  := nullify(x.station);
    y.thread                   := nullify(x.thread);
    y.heg_ctrl                 := nullify(x.heg_ctrl);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: in_pt_pt2sf_sim_rt) return in_pt_pt2sf_sim_rvt is
    variable y : in_pt_pt2sf_sim_rvt;
  begin
    y(135 downto 72)           := vectorify(x.ToA);
    y(71 downto 68)            := vectorify(x.station);
    y(67 downto 64)            := vectorify(x.thread);
    y(63 downto 0)             := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: in_pt_pt2sf_sim_rvt) return in_pt_pt2sf_sim_rt is
    variable y : in_pt_pt2sf_sim_rt;
  begin
    y.ToA                      := structify(x(135 downto 72));
    y.station                  := structify(x(71 downto 68));
    y.thread                   := structify(x(67 downto 64));
    y.data                     := structify(x(63 downto 0));
    return y;
  end function structify;
  function nullify(x: in_pt_pt2sf_sim_rt) return in_pt_pt2sf_sim_rt is
    variable y : in_pt_pt2sf_sim_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.station                  := nullify(x.station);
    y.thread                   := nullify(x.thread);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: in_pt_mpl_sim_rt) return in_pt_mpl_sim_rvt is
    variable y : in_pt_mpl_sim_rvt;
  begin
    y(125 downto 62)           := vectorify(x.ToA);
    y(61 downto 58)            := vectorify(x.thread);
    y(57 downto 0)             := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: in_pt_mpl_sim_rvt) return in_pt_mpl_sim_rt is
    variable y : in_pt_mpl_sim_rt;
  begin
    y.ToA                      := structify(x(125 downto 62));
    y.thread                   := structify(x(61 downto 58));
    y.data                     := structify(x(57 downto 0));
    return y;
  end function structify;
  function nullify(x: in_pt_mpl_sim_rt) return in_pt_mpl_sim_rt is
    variable y : in_pt_mpl_sim_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.thread                   := nullify(x.thread);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: in_mtc_pt_sim_rt) return in_mtc_pt_sim_rvt is
    variable y : in_mtc_pt_sim_rvt;
  begin
    y(121 downto 58)           := vectorify(x.ToA);
    y(57 downto 54)            := vectorify(x.thread);
    y(53 downto 0)             := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: in_mtc_pt_sim_rvt) return in_mtc_pt_sim_rt is
    variable y : in_mtc_pt_sim_rt;
  begin
    y.ToA                      := structify(x(121 downto 58));
    y.thread                   := structify(x(57 downto 54));
    y.data                     := structify(x(53 downto 0));
    return y;
  end function structify;
  function nullify(x: in_mtc_pt_sim_rt) return in_mtc_pt_sim_rt is
    variable y : in_mtc_pt_sim_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.thread                   := nullify(x.thread);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

  function vectorify(x: in_mtc_mpl_sim_rt) return in_mtc_mpl_sim_rvt is
    variable y : in_mtc_mpl_sim_rvt;
  begin
    y(180 downto 117)          := vectorify(x.ToA);
    y(116 downto 113)          := vectorify(x.thread);
    y(112 downto 0)            := vectorify(x.data);
    return y;
  end function vectorify;
  function structify(x: in_mtc_mpl_sim_rvt) return in_mtc_mpl_sim_rt is
    variable y : in_mtc_mpl_sim_rt;
  begin
    y.ToA                      := structify(x(180 downto 117));
    y.thread                   := structify(x(116 downto 113));
    y.data                     := structify(x(112 downto 0));
    return y;
  end function structify;
  function nullify(x: in_mtc_mpl_sim_rt) return in_mtc_mpl_sim_rt is
    variable y : in_mtc_mpl_sim_rt;
  begin
    y.ToA                      := nullify(x.ToA);
    y.thread                   := nullify(x.thread);
    y.data                     := nullify(x.data);
    return y;
  end function nullify;

end package body gldl_ult_tp_sim_pkg;
