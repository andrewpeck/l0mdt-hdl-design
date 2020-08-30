library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

package csf_pkg is

  constant UCM_MBAR_LEN : integer := UCM_VEC_ANG_LEN;

  constant UCM_MBAR_MULT : real := 1024.0;

  constant CSF_SEG_M_LEN : integer := 15;

  constant CSF_SEG_M_MULT : real := 4096.0;

  constant CSF_SEG_B_LEN : integer := 13;

  constant CSF_SEG_B_MULT : real := 16.0;

  constant CSF_SEG_CHI2_LEN : integer := 15;

  constant CSF_SEG_CHI2_MULT : real := 4.0;

  constant CSF_MAXHITS_SEG : integer := 16;

  constant CSF_MAXHITS_SEG_LEN : integer := 4;

  constant CSF_MAXHITS_ML_LEN : integer := 3;

  type csf_seed_rt is record
    muid : slc_muid_rt;
    mbar : unsigned(UCM_VEC_ANG_LEN-1 downto 0);
    pos : unsigned(UCM_Z_ROI_LEN-1 downto 0);
    ang : unsigned(UCM_Z_ROI_LEN-1 downto 0);
    chamber_id : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    data_valid : std_logic;
  end record csf_seed_rt;
  constant CSF_SEED_LEN : integer := 56;
  subtype csf_seed_rvt is std_logic_vector(CSF_SEED_LEN-1 downto 0);
  function vectorify(x: csf_seed_rt) return csf_seed_rvt;
  function structify(x: csf_seed_rvt) return csf_seed_rt;
  function nullify(x: csf_seed_rt) return csf_seed_rt;

  type csf_hit_rt is record
    valid : std_logic;
    x : unsigned(MDT_LOCAL_X_LEN-1 downto 0);
    y : unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
  end record csf_hit_rt;
  constant CSF_HIT_LEN : integer := 28;
  subtype csf_hit_rvt is std_logic_vector(CSF_HIT_LEN-1 downto 0);
  function vectorify(x: csf_hit_rt) return csf_hit_rvt;
  function structify(x: csf_hit_rvt) return csf_hit_rt;
  function nullify(x: csf_hit_rt) return csf_hit_rt;

  type csf_hit_a_at is array(integer range <>) of csf_hit_rt;
  type csf_hit_a_avt is array(integer range <>) of csf_hit_rvt;
  function vectorify(x: csf_hit_a_at) return csf_hit_a_avt;
  function vectorify(x: csf_hit_a_at) return std_logic_vector;
  function structify(x: csf_hit_a_avt) return csf_hit_a_at;
  function structify(x: std_logic_vector) return csf_hit_a_at;
  function nullify(x: csf_hit_a_at) return csf_hit_a_at;
  function nullify(x: csf_hit_a_avt) return csf_hit_a_avt;

  type csf_locseg_rt is record
    valid : std_logic;
    b : signed(CSF_SEG_B_LEN-1 downto 0);
    m : signed(CSF_SEG_M_LEN-1 downto 0);
    chi2 : unsigned(CSF_SEG_CHI2_LEN-1 downto 0);
    ndof : unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0);
  end record csf_locseg_rt;
  constant CSF_LOCSEG_LEN : integer := 48;
  subtype csf_locseg_rvt is std_logic_vector(CSF_LOCSEG_LEN-1 downto 0);
  function vectorify(x: csf_locseg_rt) return csf_locseg_rvt;
  function structify(x: csf_locseg_rvt) return csf_locseg_rt;
  function nullify(x: csf_locseg_rt) return csf_locseg_rt;

  type csf_locseg_a_at is array(integer range <>) of csf_locseg_rt;
  type csf_locseg_a_avt is array(integer range <>) of csf_locseg_rvt;
  function vectorify(x: csf_locseg_a_at) return csf_locseg_a_avt;
  function vectorify(x: csf_locseg_a_at) return std_logic_vector;
  function structify(x: csf_locseg_a_avt) return csf_locseg_a_at;
  function structify(x: std_logic_vector) return csf_locseg_a_at;
  function nullify(x: csf_locseg_a_at) return csf_locseg_a_at;
  function nullify(x: csf_locseg_a_avt) return csf_locseg_a_avt;

  constant SF_SEG_POS_LEN : integer := 19;

  constant SF_SEG_POS_MULTI : real := 16.0;

  constant SF_SEG_ANG_LEN : integer := 15;

  constant SF_SEG_ANG_MULTI : real := 4096.0;

  constant SF_SEG_ANG_MULTI_LEN : integer := 12;

  type sf2pt_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    chamber_id : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    pos : signed(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf2pt_rt;
  constant SF2PT_LEN : integer := 60;
  subtype sf2pt_rvt is std_logic_vector(SF2PT_LEN-1 downto 0);
  function vectorify(x: sf2pt_rt) return sf2pt_rvt;
  function structify(x: sf2pt_rvt) return sf2pt_rt;
  function nullify(x: sf2pt_rt) return sf2pt_rt;

  type sf_seg_data_barrel_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    chamber_id : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    pos : signed(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf_seg_data_barrel_rt;
  constant SF_SEG_DATA_BARREL_LEN : integer := 60;
  subtype sf_seg_data_barrel_rvt is std_logic_vector(SF_SEG_DATA_BARREL_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt;
  function nullify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt;

  type sf_seg_data_endcap_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    chamber_id : unsigned(SLC_CHAMBER_LEN-1 downto 0);
    pos : unsigned(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf_seg_data_endcap_rt;
  constant SF_SEG_DATA_ENDCAP_LEN : integer := 60;
  subtype sf_seg_data_endcap_rvt is std_logic_vector(SF_SEG_DATA_ENDCAP_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rvt;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt;
  function nullify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt;

end package csf_pkg;

------------------------------------------------------------

package body csf_pkg is

  function vectorify(x: csf_seed_rt) return csf_seed_rvt is
    variable y : csf_seed_rvt;
  begin
    y(55 downto 35)            := vectorify(x.muid);
    y(34 downto 24)            := vectorify(x.mbar);
    y(23 downto 14)            := vectorify(x.pos);
    y(13 downto 4)             := vectorify(x.ang);
    y(3 downto 1)              := vectorify(x.chamber_id);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: csf_seed_rvt) return csf_seed_rt is
    variable y : csf_seed_rt;
  begin
    y.muid                     := structify(x(55 downto 35));
    y.mbar                     := structify(x(34 downto 24));
    y.pos                      := structify(x(23 downto 14));
    y.ang                      := structify(x(13 downto 4));
    y.chamber_id               := structify(x(3 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify(x: csf_seed_rt) return csf_seed_rt is
    variable y : csf_seed_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.mbar                     := nullify(x.mbar);
    y.pos                      := nullify(x.pos);
    y.ang                      := nullify(x.ang);
    y.chamber_id               := nullify(x.chamber_id);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: csf_hit_rt) return csf_hit_rvt is
    variable y : csf_hit_rvt;
  begin
    y(27)                      := x.valid;
    y(26 downto 14)            := vectorify(x.x);
    y(13 downto 0)             := vectorify(x.y);
    return y;
  end function vectorify;
  function structify(x: csf_hit_rvt) return csf_hit_rt is
    variable y : csf_hit_rt;
  begin
    y.valid                    := x(27);
    y.x                        := structify(x(26 downto 14));
    y.y                        := structify(x(13 downto 0));
    return y;
  end function structify;
  function nullify(x: csf_hit_rt) return csf_hit_rt is
    variable y : csf_hit_rt;
  begin
    y.valid                    := nullify(x.valid);
    y.x                        := nullify(x.x);
    y.y                        := nullify(x.y);
    return y;
  end function nullify;

  function vectorify(x: csf_hit_a_at) return csf_hit_a_avt is
    variable y :  csf_hit_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: csf_hit_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*28-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-28) := vectorify(x(i));
      msb := msb - 28 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: csf_hit_a_avt) return csf_hit_a_at is
    variable y :  csf_hit_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return csf_hit_a_at is
    variable y :  csf_hit_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-28));
      msb := msb - 28 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: csf_hit_a_at) return csf_hit_a_at is
    variable y :  csf_hit_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: csf_hit_a_avt) return csf_hit_a_avt is
    variable y :  csf_hit_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: csf_locseg_rt) return csf_locseg_rvt is
    variable y : csf_locseg_rvt;
  begin
    y(47)                      := x.valid;
    y(46 downto 34)            := vectorify(x.b);
    y(33 downto 19)            := vectorify(x.m);
    y(18 downto 4)             := vectorify(x.chi2);
    y(3 downto 0)              := vectorify(x.ndof);
    return y;
  end function vectorify;
  function structify(x: csf_locseg_rvt) return csf_locseg_rt is
    variable y : csf_locseg_rt;
  begin
    y.valid                    := x(47);
    y.b                        := structify(x(46 downto 34));
    y.m                        := structify(x(33 downto 19));
    y.chi2                     := structify(x(18 downto 4));
    y.ndof                     := structify(x(3 downto 0));
    return y;
  end function structify;
  function nullify(x: csf_locseg_rt) return csf_locseg_rt is
    variable y : csf_locseg_rt;
  begin
    y.valid                    := nullify(x.valid);
    y.b                        := nullify(x.b);
    y.m                        := nullify(x.m);
    y.chi2                     := nullify(x.chi2);
    y.ndof                     := nullify(x.ndof);
    return y;
  end function nullify;

  function vectorify(x: csf_locseg_a_at) return csf_locseg_a_avt is
    variable y :  csf_locseg_a_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: csf_locseg_a_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*48-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-48) := vectorify(x(i));
      msb := msb - 48 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: csf_locseg_a_avt) return csf_locseg_a_at is
    variable y :  csf_locseg_a_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return csf_locseg_a_at is
    variable y :  csf_locseg_a_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-48));
      msb := msb - 48 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: csf_locseg_a_at) return csf_locseg_a_at is
    variable y :  csf_locseg_a_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: csf_locseg_a_avt) return csf_locseg_a_avt is
    variable y :  csf_locseg_a_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: sf2pt_rt) return sf2pt_rvt is
    variable y : sf2pt_rvt;
  begin
    y(59)                      := x.data_valid;
    y(58 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := vectorify(x.chamber_id);
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf2pt_rvt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.data_valid               := x(59);
    y.muid                     := structify(x(58 downto 38));
    y.chamber_id               := structify(x(37 downto 35));
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify(x: sf2pt_rt) return sf2pt_rt is
    variable y : sf2pt_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.chamber_id               := nullify(x.chamber_id);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt is
    variable y : sf_seg_data_barrel_rvt;
  begin
    y(59)                      := x.data_valid;
    y(58 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := vectorify(x.chamber_id);
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := x(59);
    y.muid                     := structify(x(58 downto 38));
    y.chamber_id               := structify(x(37 downto 35));
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt is
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
    y(59)                      := x.data_valid;
    y(58 downto 38)            := vectorify(x.muid);
    y(37 downto 35)            := vectorify(x.chamber_id);
    y(34 downto 16)            := vectorify(x.pos);
    y(15 downto 1)             := vectorify(x.angle);
    y(0)                       := x.quality;
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := x(59);
    y.muid                     := structify(x(58 downto 38));
    y.chamber_id               := structify(x(37 downto 35));
    y.pos                      := structify(x(34 downto 16));
    y.angle                    := structify(x(15 downto 1));
    y.quality                  := x(0);
    return y;
  end function structify;
  function nullify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt is
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

end package body csf_pkg;
