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
use shared_lib.interfaces_types_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

package heg_pkg is

  

  --------------------------------------------------------------------------------
  --  slc port
  --------------------------------------------------------------------------------
  -- type ucm_slc_barrel_rt is record --from TAR & PC
  --   z           : SLc_zpos_st;          -- 10 bits
  --   z_0         : SLc_zpos_st;          -- 10 bits
  --   phi         : signed(SLC_PHI_WIDTH-1 downto 0); 
  --   mbar        : signed(SLC_MBAR_WIDTH -1 downto 0);
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
  -- type hp_hit_data_astdt is array ( integer range <>) of hp_hit_data_stdst;

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
  -- type hp2bm_astdst is array (MAX_NUM_HP -1 downto 0) of hp2bm_stdst;
  subtype heg2sf_mdt_stdst is std_logic_vector((HP2BM_SF_WIDTH + 1) -1 downto 0);
  type heg2sf_mdt_astdst is array (integer range <>) of heg2sf_mdt_stdst;
end package heg_pkg;

package body heg_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATION
--------------------------------------------------------------------------------
 
end package body heg_pkg;