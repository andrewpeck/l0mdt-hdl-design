--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

package heg_pkg is

  type heg_pc2heg_rt is record
    tube                       : std_logic_vector(MDT_TUBE_LEN-1 downto 0);
    layer                      : std_logic_vector(MDT_LAYER_LEN-1 downto 0);
    time_t0                    : unsigned(MDT_TIME_LEN-1 downto 0);
    global_z                   : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    global_y                   : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record heg_pc2heg_rt;
  constant HEG_PC2HEG_LEN : integer := 63;
  subtype heg_pc2heg_vt is std_logic_vector(HEG_PC2HEG_LEN-1 downto 0);
  function vectorify(x: heg_pc2heg_rt) return heg_pc2heg_vt;
  function structify(x: heg_pc2heg_vt) return heg_pc2heg_rt;
  function nullify (x: heg_pc2heg_rt) return heg_pc2heg_rt;

  type heg_pc2heg_avt is array ( integer range <>) of heg_pc2heg_vt;

  --------------------------------------------------------------------------------
  --  slc port
  --------------------------------------------------------------------------------
  -- type ucm_slc_barrel_rt is record --from TAR & PC
  --   z           : SLc_zpos_st;          -- 10 bits
  --   z_0         : SLc_zpos_st;          -- 10 bits
  --   phi         : signed(SLC_PHI_LEN-1 downto 0); 
  --   mbar        : signed(SLC_MBAR_LEN -1 downto 0);
  -- end record;
  -- constant null_ucm_slc_barrel_rt : ucm_slc_barrel_rt := ((others => '0'),(others => '0'),(others => '0'),(others => '0'));
  -- type ucm2heg_slc_rt is record
  --   BCID        : SLc_BCID_st;          -- 12 bits
  --   barrel      : ucm_slc_barrel_rt; --barrel_ucm_t(ST_nBARREL_ENDCAP downto 0);
  --   -- endcap      : hp_SLc_endcap_rt; --endcap_ucm_t(ST_nBARREL_ENDCAP downto 1);
  --   data_valid  : std_logic;
  -- end record;
  -- constant null_ucm2heg_slc_rt : ucm2heg_slc_rt := (null_SLc_BCID_st,null_ucm_slc_barrel_rt,'0');

  -- HEG control to hp
  type heg_int_control_rt is record
    hp_resets_b : std_logic_vector(MAX_NUM_HP -1 downto 0);
    hp_enables  : std_logic_vector(MAX_NUM_HP -1 downto 0);
  end record;
  constant null_heg_control_rt : heg_int_control_rt := ((others => '1'), (others => '0'));
  type heg_int_control_art is array (integer range <>) of heg_int_control_rt;
  -- hpsPc to hp


  -- type hp_hit_data_art is array ( integer range <>) of hp_hit_data_rt;
  -- type hp_hit_data_avt is array ( integer range <>) of hp_hit_data_vt;

  -- heg to sf (slc_info)
  type heg_2_sf_slc_rt is record

    data_valid  : std_logic;
  end record;

  -- heg to sf hit data
  type heg2sf_mdt_rt is record
    sf_data     : hp2bm_sf_rt; --hp2bm_csf_t(SF_type downto 0);
    data_valid  : std_logic;
  end record;
  constant null_heg2sf_mdt_rt : heg2sf_mdt_rt := (null_hp2bm_sf_rt,'0');
  type heg2sf_mdt_art is array (integer range <>) of heg2sf_mdt_rt;
  -- type hp2bm_avt is array (MAX_NUM_HP -1 downto 0) of hp2bm_vt;
  subtype heg2sf_mdt_vt is std_logic_vector((HP2BM_SF_LEN + 1) -1 downto 0);
  type heg2sf_mdt_avt is array (integer range <>) of heg2sf_mdt_vt;
end package heg_pkg;

package body heg_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATION
--------------------------------------------------------------------------------
function vectorify(x: heg_pc2heg_rt) return heg_pc2heg_vt is
  variable y : heg_pc2heg_vt;
begin
  y(62 downto 58)            := x.tube;
  y(57 downto 49)            := x.layer;
  y(48 downto 31)            := vectorify(x.time_t0);
  y(30 downto 16)            := vectorify(x.global_z);
  y(15 downto 1)             := vectorify(x.global_y);
  y(0)                       := x.data_valid;
  return y;
end function vectorify;
function structify(x: heg_pc2heg_vt) return heg_pc2heg_rt is
  variable y : heg_pc2heg_rt;
begin
  y.tube                     := x(62 downto 58);
  y.layer                    := x(57 downto 49);
  y.time_t0                  := structify(x(48 downto 31));
  y.global_z                 := structify(x(30 downto 16));
  y.global_y                 := structify(x(15 downto 1));
  y.data_valid               := x(0);
  return y;
end function structify;
function nullify (x: heg_pc2heg_rt) return heg_pc2heg_rt is
  variable y : heg_pc2heg_rt;
begin
  y.tube                     := nullify(x.tube);
  y.layer                    := nullify(x.layer);
  y.time_t0                  := nullify(x.time_t0);
  y.global_z                 := nullify(x.global_z);
  y.global_y                 := nullify(x.global_y);
  y.data_valid               := nullify(x.data_valid);
  return y;
end function nullify;
end package body heg_pkg;