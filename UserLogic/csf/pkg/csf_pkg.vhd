LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;

PACKAGE csf_pkg IS

  CONSTANT UCM_MBAR_MULT : real := 1024.0;

  CONSTANT CSF_SEG_M_LEN : INTEGER := 15;

  CONSTANT CSF_SEG_M_MULT : real := 4096.0;

  CONSTANT CSF_SEG_B_LEN : INTEGER := 13;

  CONSTANT CSF_SEG_B_MULT : real := 16.0;

  CONSTANT CSF_SEG_CHI2_LEN : INTEGER := 15;

  CONSTANT CSF_SEG_CHI2_MULT : real := 4.0;

  CONSTANT CSF_MAXHITS_SEG : INTEGER := 16;

  CONSTANT CSF_MAXHITS_SEG_LEN : INTEGER := 4;

  CONSTANT CSF_MAXHITS_ML_LEN : INTEGER := 3;

  TYPE csf_seed_rt IS RECORD
    muid : slc_muid_rt;
    mbar : unsigned(UCM_VEC_ANG_LEN - 1 DOWNTO 0);
    pos : unsigned(UCM_Z_ROI_LEN - 1 DOWNTO 0);
    ang : unsigned(UCM_Z_ROI_LEN - 1 DOWNTO 0);
    mdtid : vec_mdtid_rt;
    data_valid : STD_LOGIC;
  END RECORD csf_seed_rt;
  CONSTANT CSF_SEED_LEN : INTEGER := 70;
  SUBTYPE csf_seed_rvt IS STD_LOGIC_VECTOR(CSF_SEED_LEN - 1 DOWNTO 0);
  FUNCTION vectorify(x : csf_seed_rt) RETURN csf_seed_rvt;
  FUNCTION structify(x : csf_seed_rvt) RETURN csf_seed_rt;
  FUNCTION nullify(x : csf_seed_rt) RETURN csf_seed_rt;

  TYPE csf_hit_rt IS RECORD
    valid : STD_LOGIC;
    x : unsigned(MDT_LOCAL_X_LEN - 1 DOWNTO 0);
    y : unsigned(MDT_LOCAL_Y_LEN - 1 DOWNTO 0);
  END RECORD csf_hit_rt;
  CONSTANT CSF_HIT_LEN : INTEGER := 31;
  SUBTYPE csf_hit_rvt IS STD_LOGIC_VECTOR(CSF_HIT_LEN - 1 DOWNTO 0);
  FUNCTION vectorify(x : csf_hit_rt) RETURN csf_hit_rvt;
  FUNCTION structify(x : csf_hit_rvt) RETURN csf_hit_rt;
  FUNCTION nullify(x : csf_hit_rt) RETURN csf_hit_rt;

  TYPE csf_hit_a_at IS ARRAY(INTEGER RANGE <>) OF csf_hit_rt;
  TYPE csf_hit_a_avt IS ARRAY(INTEGER RANGE <>) OF csf_hit_rvt;
  FUNCTION vectorify(x : csf_hit_a_at) RETURN csf_hit_a_avt;
  FUNCTION vectorify(x : csf_hit_a_at) RETURN STD_LOGIC_VECTOR;
  FUNCTION structify(x : csf_hit_a_avt) RETURN csf_hit_a_at;
  FUNCTION structify(x : STD_LOGIC_VECTOR) RETURN csf_hit_a_at;
  FUNCTION nullify(x : csf_hit_a_at) RETURN csf_hit_a_at;
  FUNCTION nullify(x : csf_hit_a_avt) RETURN csf_hit_a_avt;

  TYPE csf_locseg_rt IS RECORD
    valid : STD_LOGIC;
    b : signed(CSF_SEG_B_LEN - 1 DOWNTO 0);
    m : signed(CSF_SEG_M_LEN - 1 DOWNTO 0);
    chi2 : unsigned(CSF_SEG_CHI2_LEN - 1 DOWNTO 0);
    ndof : unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0);
  END RECORD csf_locseg_rt;
  CONSTANT CSF_LOCSEG_LEN : INTEGER := 48;
  SUBTYPE csf_locseg_rvt IS STD_LOGIC_VECTOR(CSF_LOCSEG_LEN - 1 DOWNTO 0);
  FUNCTION vectorify(x : csf_locseg_rt) RETURN csf_locseg_rvt;
  FUNCTION structify(x : csf_locseg_rvt) RETURN csf_locseg_rt;
  FUNCTION nullify(x : csf_locseg_rt) RETURN csf_locseg_rt;

  TYPE csf_locseg_a_at IS ARRAY(INTEGER RANGE <>) OF csf_locseg_rt;
  TYPE csf_locseg_a_avt IS ARRAY(INTEGER RANGE <>) OF csf_locseg_rvt;
  FUNCTION vectorify(x : csf_locseg_a_at) RETURN csf_locseg_a_avt;
  FUNCTION vectorify(x : csf_locseg_a_at) RETURN STD_LOGIC_VECTOR;
  FUNCTION structify(x : csf_locseg_a_avt) RETURN csf_locseg_a_at;
  FUNCTION structify(x : STD_LOGIC_VECTOR) RETURN csf_locseg_a_at;
  FUNCTION nullify(x : csf_locseg_a_at) RETURN csf_locseg_a_at;
  FUNCTION nullify(x : csf_locseg_a_avt) RETURN csf_locseg_a_avt;

  TYPE sf_seg_data_barrel_rt IS RECORD
    data_valid : STD_LOGIC;
    muid : slc_muid_rt;
    mdtid : vec_mdtid_rt;
    pos : signed(SF_SEG_POS_LEN - 1 DOWNTO 0);
    angle : signed(SF_SEG_ANG_LEN - 1 DOWNTO 0);
    quality : STD_LOGIC;
  END RECORD sf_seg_data_barrel_rt;
  CONSTANT SF_SEG_DATA_BARREL_LEN : INTEGER := 64;
  SUBTYPE sf_seg_data_barrel_rvt IS STD_LOGIC_VECTOR(SF_SEG_DATA_BARREL_LEN - 1 DOWNTO 0);
  FUNCTION vectorify(x : sf_seg_data_barrel_rt) RETURN sf_seg_data_barrel_rvt;
  FUNCTION structify(x : sf_seg_data_barrel_rvt) RETURN sf_seg_data_barrel_rt;
  FUNCTION nullify(x : sf_seg_data_barrel_rt) RETURN sf_seg_data_barrel_rt;

  TYPE sf_seg_data_endcap_rt IS RECORD
    data_valid : STD_LOGIC;
    muid : slc_muid_rt;
    mdtid : vec_mdtid_rt;
    pos : unsigned(SF_SEG_POS_LEN - 1 DOWNTO 0);
    angle : signed(SF_SEG_ANG_LEN - 1 DOWNTO 0);
    quality : STD_LOGIC;
  END RECORD sf_seg_data_endcap_rt;
  CONSTANT SF_SEG_DATA_ENDCAP_LEN : INTEGER := 64;
  SUBTYPE sf_seg_data_endcap_rvt IS STD_LOGIC_VECTOR(SF_SEG_DATA_ENDCAP_LEN - 1 DOWNTO 0);
  FUNCTION vectorify(x : sf_seg_data_endcap_rt) RETURN sf_seg_data_endcap_rvt;
  FUNCTION structify(x : sf_seg_data_endcap_rvt) RETURN sf_seg_data_endcap_rt;
  FUNCTION nullify(x : sf_seg_data_endcap_rt) RETURN sf_seg_data_endcap_rt;

END PACKAGE csf_pkg;

------------------------------------------------------------

PACKAGE BODY csf_pkg IS

  FUNCTION vectorify(x : csf_seed_rt) RETURN csf_seed_rvt IS
    VARIABLE y : csf_seed_rvt;
  BEGIN
    y(69 DOWNTO 49) := vectorify(x.muid);
    y(48 DOWNTO 38) := vectorify(x.mbar);
    y(37 DOWNTO 24) := vectorify(x.pos);
    y(23 DOWNTO 10) := vectorify(x.ang);
    y(9 DOWNTO 1) := vectorify(x.mdtid);
    y(0 DOWNTO 0) := vectorify(x.data_valid);
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION structify(x : csf_seed_rvt) RETURN csf_seed_rt IS
    VARIABLE y : csf_seed_rt;
  BEGIN
    y.muid := structify(x(69 DOWNTO 49));
    y.mbar := structify(x(48 DOWNTO 38));
    y.pos := structify(x(37 DOWNTO 24));
    y.ang := structify(x(23 DOWNTO 10));
    y.mdtid := structify(x(9 DOWNTO 1));
    y.data_valid := structify(x(0 DOWNTO 0));
    RETURN y;
  END FUNCTION structify;
  FUNCTION nullify(x : csf_seed_rt) RETURN csf_seed_rt IS
    VARIABLE y : csf_seed_rt;
  BEGIN
    y.muid := nullify(x.muid);
    y.mbar := nullify(x.mbar);
    y.pos := nullify(x.pos);
    y.ang := nullify(x.ang);
    y.mdtid := nullify(x.mdtid);
    y.data_valid := nullify(x.data_valid);
    RETURN y;
  END FUNCTION nullify;

  FUNCTION vectorify(x : csf_hit_rt) RETURN csf_hit_rvt IS
    VARIABLE y : csf_hit_rvt;
  BEGIN
    y(30 DOWNTO 30) := vectorify(x.valid);
    y(29 DOWNTO 15) := vectorify(x.x);
    y(14 DOWNTO 0) := vectorify(x.y);
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION structify(x : csf_hit_rvt) RETURN csf_hit_rt IS
    VARIABLE y : csf_hit_rt;
  BEGIN
    y.valid := structify(x(30 DOWNTO 30));
    y.x := structify(x(29 DOWNTO 15));
    y.y := structify(x(14 DOWNTO 0));
    RETURN y;
  END FUNCTION structify;
  FUNCTION nullify(x : csf_hit_rt) RETURN csf_hit_rt IS
    VARIABLE y : csf_hit_rt;
  BEGIN
    y.valid := nullify(x.valid);
    y.x := nullify(x.x);
    y.y := nullify(x.y);
    RETURN y;
  END FUNCTION nullify;

  FUNCTION vectorify(x : csf_hit_a_at) RETURN csf_hit_a_avt IS
    VARIABLE y : csf_hit_a_avt(x'RANGE);
  BEGIN
    l : FOR i IN x'RANGE LOOP
      y(i) := vectorify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION vectorify(x : csf_hit_a_at) RETURN STD_LOGIC_VECTOR IS
    VARIABLE msb : INTEGER := x'length * 31 - 1;
    VARIABLE y : STD_LOGIC_VECTOR(msb DOWNTO 0);
  BEGIN
    l : FOR i IN x'RANGE LOOP
      y(msb DOWNTO msb - 31 + 1) := vectorify(x(i));
      msb := msb - 31;
    END LOOP l;
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION structify(x : csf_hit_a_avt) RETURN csf_hit_a_at IS
    VARIABLE y : csf_hit_a_at(x'RANGE);
  BEGIN
    l : FOR i IN x'RANGE LOOP
      y(i) := structify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION structify;
  FUNCTION structify(x : STD_LOGIC_VECTOR) RETURN csf_hit_a_at IS
    VARIABLE y : csf_hit_a_at(x'RANGE);
    VARIABLE msb : INTEGER := x'left;
  BEGIN
    l : FOR i IN y'RANGE LOOP
      y(i) := structify(x(msb DOWNTO msb - 31 + 1));
      msb := msb - 31;
    END LOOP l;
    RETURN y;
  END FUNCTION structify;
  FUNCTION nullify(x : csf_hit_a_at) RETURN csf_hit_a_at IS
    VARIABLE y : csf_hit_a_at(x'RANGE);
  BEGIN
    l : FOR i IN y'RANGE LOOP
      y(i) := nullify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION nullify;
  FUNCTION nullify(x : csf_hit_a_avt) RETURN csf_hit_a_avt IS
    VARIABLE y : csf_hit_a_avt(x'RANGE);
  BEGIN
    l : FOR i IN y'RANGE LOOP
      y(i) := nullify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION nullify;

  FUNCTION vectorify(x : csf_locseg_rt) RETURN csf_locseg_rvt IS
    VARIABLE y : csf_locseg_rvt;
  BEGIN
    y(47 DOWNTO 47) := vectorify(x.valid);
    y(46 DOWNTO 34) := vectorify(x.b);
    y(33 DOWNTO 19) := vectorify(x.m);
    y(18 DOWNTO 4) := vectorify(x.chi2);
    y(3 DOWNTO 0) := vectorify(x.ndof);
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION structify(x : csf_locseg_rvt) RETURN csf_locseg_rt IS
    VARIABLE y : csf_locseg_rt;
  BEGIN
    y.valid := structify(x(47 DOWNTO 47));
    y.b := structify(x(46 DOWNTO 34));
    y.m := structify(x(33 DOWNTO 19));
    y.chi2 := structify(x(18 DOWNTO 4));
    y.ndof := structify(x(3 DOWNTO 0));
    RETURN y;
  END FUNCTION structify;
  FUNCTION nullify(x : csf_locseg_rt) RETURN csf_locseg_rt IS
    VARIABLE y : csf_locseg_rt;
  BEGIN
    y.valid := nullify(x.valid);
    y.b := nullify(x.b);
    y.m := nullify(x.m);
    y.chi2 := nullify(x.chi2);
    y.ndof := nullify(x.ndof);
    RETURN y;
  END FUNCTION nullify;

  FUNCTION vectorify(x : csf_locseg_a_at) RETURN csf_locseg_a_avt IS
    VARIABLE y : csf_locseg_a_avt(x'RANGE);
  BEGIN
    l : FOR i IN x'RANGE LOOP
      y(i) := vectorify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION vectorify(x : csf_locseg_a_at) RETURN STD_LOGIC_VECTOR IS
    VARIABLE msb : INTEGER := x'length * 48 - 1;
    VARIABLE y : STD_LOGIC_VECTOR(msb DOWNTO 0);
  BEGIN
    l : FOR i IN x'RANGE LOOP
      y(msb DOWNTO msb - 48 + 1) := vectorify(x(i));
      msb := msb - 48;
    END LOOP l;
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION structify(x : csf_locseg_a_avt) RETURN csf_locseg_a_at IS
    VARIABLE y : csf_locseg_a_at(x'RANGE);
  BEGIN
    l : FOR i IN x'RANGE LOOP
      y(i) := structify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION structify;
  FUNCTION structify(x : STD_LOGIC_VECTOR) RETURN csf_locseg_a_at IS
    VARIABLE y : csf_locseg_a_at(x'RANGE);
    VARIABLE msb : INTEGER := x'left;
  BEGIN
    l : FOR i IN y'RANGE LOOP
      y(i) := structify(x(msb DOWNTO msb - 48 + 1));
      msb := msb - 48;
    END LOOP l;
    RETURN y;
  END FUNCTION structify;
  FUNCTION nullify(x : csf_locseg_a_at) RETURN csf_locseg_a_at IS
    VARIABLE y : csf_locseg_a_at(x'RANGE);
  BEGIN
    l : FOR i IN y'RANGE LOOP
      y(i) := nullify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION nullify;
  FUNCTION nullify(x : csf_locseg_a_avt) RETURN csf_locseg_a_avt IS
    VARIABLE y : csf_locseg_a_avt(x'RANGE);
  BEGIN
    l : FOR i IN y'RANGE LOOP
      y(i) := nullify(x(i));
    END LOOP l;
    RETURN y;
  END FUNCTION nullify;

  FUNCTION vectorify(x : sf_seg_data_barrel_rt) RETURN sf_seg_data_barrel_rvt IS
    VARIABLE y : sf_seg_data_barrel_rvt;
  BEGIN
    y(63 DOWNTO 63) := vectorify(x.data_valid);
    y(62 DOWNTO 42) := vectorify(x.muid);
    y(41 DOWNTO 33) := vectorify(x.mdtid);
    y(32 DOWNTO 15) := vectorify(x.pos);
    y(14 DOWNTO 1) := vectorify(x.angle);
    y(0 DOWNTO 0) := vectorify(x.quality);
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION structify(x : sf_seg_data_barrel_rvt) RETURN sf_seg_data_barrel_rt IS
    VARIABLE y : sf_seg_data_barrel_rt;
  BEGIN
    y.data_valid := structify(x(63 DOWNTO 63));
    y.muid := structify(x(62 DOWNTO 42));
    y.mdtid := structify(x(41 DOWNTO 33));
    y.pos := structify(x(32 DOWNTO 15));
    y.angle := structify(x(14 DOWNTO 1));
    y.quality := structify(x(0 DOWNTO 0));
    RETURN y;
  END FUNCTION structify;
  FUNCTION nullify(x : sf_seg_data_barrel_rt) RETURN sf_seg_data_barrel_rt IS
    VARIABLE y : sf_seg_data_barrel_rt;
  BEGIN
    y.data_valid := nullify(x.data_valid);
    y.muid := nullify(x.muid);
    y.mdtid := nullify(x.mdtid);
    y.pos := nullify(x.pos);
    y.angle := nullify(x.angle);
    y.quality := nullify(x.quality);
    RETURN y;
  END FUNCTION nullify;

  FUNCTION vectorify(x : sf_seg_data_endcap_rt) RETURN sf_seg_data_endcap_rvt IS
    VARIABLE y : sf_seg_data_endcap_rvt;
  BEGIN
    y(63 DOWNTO 63) := vectorify(x.data_valid);
    y(62 DOWNTO 42) := vectorify(x.muid);
    y(41 DOWNTO 33) := vectorify(x.mdtid);
    y(32 DOWNTO 15) := vectorify(x.pos);
    y(14 DOWNTO 1) := vectorify(x.angle);
    y(0 DOWNTO 0) := vectorify(x.quality);
    RETURN y;
  END FUNCTION vectorify;
  FUNCTION structify(x : sf_seg_data_endcap_rvt) RETURN sf_seg_data_endcap_rt IS
    VARIABLE y : sf_seg_data_endcap_rt;
  BEGIN
    y.data_valid := structify(x(63 DOWNTO 63));
    y.muid := structify(x(62 DOWNTO 42));
    y.mdtid := structify(x(41 DOWNTO 33));
    y.pos := structify(x(32 DOWNTO 15));
    y.angle := structify(x(14 DOWNTO 1));
    y.quality := structify(x(0 DOWNTO 0));
    RETURN y;
  END FUNCTION structify;
  FUNCTION nullify(x : sf_seg_data_endcap_rt) RETURN sf_seg_data_endcap_rt IS
    VARIABLE y : sf_seg_data_endcap_rt;
  BEGIN
    y.data_valid := nullify(x.data_valid);
    y.muid := nullify(x.muid);
    y.mdtid := nullify(x.mdtid);
    y.pos := nullify(x.pos);
    y.angle := nullify(x.angle);
    y.quality := nullify(x.quality);
    RETURN y;
  END FUNCTION nullify;

END PACKAGE BODY csf_pkg;