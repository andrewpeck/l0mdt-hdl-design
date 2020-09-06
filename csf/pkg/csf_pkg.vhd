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

package csf_pkg is

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
    mdtid : vec_mdtid_rt;
    data_valid : std_logic;
  end record csf_seed_rt;
  constant CSF_SEED_LEN : integer := 62;
  subtype csf_seed_rvt is std_logic_vector(CSF_SEED_LEN-1 downto 0);
  function vectorify(x: csf_seed_rt) return csf_seed_rvt;
  function structify(x: csf_seed_rvt) return csf_seed_rt;
  function nullify(x: csf_seed_rt) return csf_seed_rt;

  type csf_hit_rt is record
    valid : std_logic;
    x : unsigned(MDT_LOCAL_X_LEN-1 downto 0);
    y : unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
  end record csf_hit_rt;
  constant CSF_HIT_LEN : integer := 31;
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

  type sf_seg_data_barrel_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    mdtid : vec_mdtid_rt;
    pos : signed(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf_seg_data_barrel_rt;
  constant SF_SEG_DATA_BARREL_LEN : integer := 63;
  subtype sf_seg_data_barrel_rvt is std_logic_vector(SF_SEG_DATA_BARREL_LEN-1 downto 0);
  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt;
  function nullify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt;

  type sf_seg_data_endcap_rt is record
    data_valid : std_logic;
    muid : slc_muid_rt;
    mdtid : vec_mdtid_rt;
    pos : unsigned(SF_SEG_POS_LEN-1 downto 0);
    angle : signed(SF_SEG_ANG_LEN-1 downto 0);
    quality : std_logic;
  end record sf_seg_data_endcap_rt;
  constant SF_SEG_DATA_ENDCAP_LEN : integer := 63;
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
    y(61 downto 41)            := vectorify(x.muid);
    y(40 downto 30)            := vectorify(x.mbar);
    y(29 downto 20)            := vectorify(x.pos);
    y(19 downto 10)            := vectorify(x.ang);
    y(9 downto 1)              := vectorify(x.mdtid);
    y(0 downto 0)              := vectorify(x.data_valid);
    return y;
  end function vectorify;
  function structify(x: csf_seed_rvt) return csf_seed_rt is
    variable y : csf_seed_rt;
  begin
    y.muid                     := structify(x(61 downto 41));
    y.mbar                     := structify(x(40 downto 30));
    y.pos                      := structify(x(29 downto 20));
    y.ang                      := structify(x(19 downto 10));
    y.mdtid                    := structify(x(9 downto 1));
    y.data_valid               := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: csf_seed_rt) return csf_seed_rt is
    variable y : csf_seed_rt;
  begin
    y.muid                     := nullify(x.muid);
    y.mbar                     := nullify(x.mbar);
    y.pos                      := nullify(x.pos);
    y.ang                      := nullify(x.ang);
    y.mdtid                    := nullify(x.mdtid);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: csf_hit_rt) return csf_hit_rvt is
    variable y : csf_hit_rvt;
  begin
    y(30 downto 30)            := vectorify(x.valid);
    y(29 downto 15)            := vectorify(x.x);
    y(14 downto 0)             := vectorify(x.y);
    return y;
  end function vectorify;
  function structify(x: csf_hit_rvt) return csf_hit_rt is
    variable y : csf_hit_rt;
  begin
    y.valid                    := structify(x(30 downto 30));
    y.x                        := structify(x(29 downto 15));
    y.y                        := structify(x(14 downto 0));
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
    variable y : std_logic_vector(x'length*31-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-31) := vectorify(x(i));
      msb := msb - 31 -1;
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
      y(i) := structify(x(msb downto msb-31));
      msb := msb - 31 -1;
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
    y(47 downto 47)            := vectorify(x.valid);
    y(46 downto 34)            := vectorify(x.b);
    y(33 downto 19)            := vectorify(x.m);
    y(18 downto 4)             := vectorify(x.chi2);
    y(3 downto 0)              := vectorify(x.ndof);
    return y;
  end function vectorify;
  function structify(x: csf_locseg_rvt) return csf_locseg_rt is
    variable y : csf_locseg_rt;
  begin
    y.valid                    := structify(x(47 downto 47));
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

  function vectorify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rvt is
    variable y : sf_seg_data_barrel_rvt;
  begin
    y(62 downto 62)            := vectorify(x.data_valid);
    y(61 downto 41)            := vectorify(x.muid);
    y(40 downto 32)            := vectorify(x.mdtid);
    y(31 downto 14)            := vectorify(x.pos);
    y(13 downto 1)             := vectorify(x.angle);
    y(0 downto 0)              := vectorify(x.quality);
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_barrel_rvt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := structify(x(62 downto 62));
    y.muid                     := structify(x(61 downto 41));
    y.mdtid                    := structify(x(40 downto 32));
    y.pos                      := structify(x(31 downto 14));
    y.angle                    := structify(x(13 downto 1));
    y.quality                  := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: sf_seg_data_barrel_rt) return sf_seg_data_barrel_rt is
    variable y : sf_seg_data_barrel_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.mdtid                    := nullify(x.mdtid);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

  function vectorify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rvt is
    variable y : sf_seg_data_endcap_rvt;
  begin
    y(62 downto 62)            := vectorify(x.data_valid);
    y(61 downto 41)            := vectorify(x.muid);
    y(40 downto 32)            := vectorify(x.mdtid);
    y(31 downto 14)            := vectorify(x.pos);
    y(13 downto 1)             := vectorify(x.angle);
    y(0 downto 0)              := vectorify(x.quality);
    return y;
  end function vectorify;
  function structify(x: sf_seg_data_endcap_rvt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := structify(x(62 downto 62));
    y.muid                     := structify(x(61 downto 41));
    y.mdtid                    := structify(x(40 downto 32));
    y.pos                      := structify(x(31 downto 14));
    y.angle                    := structify(x(13 downto 1));
    y.quality                  := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: sf_seg_data_endcap_rt) return sf_seg_data_endcap_rt is
    variable y : sf_seg_data_endcap_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    y.muid                     := nullify(x.muid);
    y.mdtid                    := nullify(x.mdtid);
    y.pos                      := nullify(x.pos);
    y.angle                    := nullify(x.angle);
    y.quality                  := nullify(x.quality);
    return y;
  end function nullify;

end package body csf_pkg;
