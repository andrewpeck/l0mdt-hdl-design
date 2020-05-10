--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: configuration file
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--    05/02/2020    0.1     File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_global_pkg.all;

library project_lib;
use project_lib.config_pkg.all;

package config_pkg is

  constant CFG : cfg_rt := set_project_cfg;

-- =============================================================================
-- SETTING CONSTANTS FROM CONFIGURATION FILE 
-- =============================================================================
  --------------------------------------------------------------------------------
  -- Sector information
  --------------------------------------------------------------------------------
  constant SECTOR_ID            : integer  := CFG.SECTOR_ID;
  constant ST_nBARREL_ENDCAP    : std_logic := CFG.ST_nBARREL_ENDCAP; -- 0: barrel    1: Endcap
  constant ENDCAP_nSMALL_LARGE  : std_logic := CFG.ENDCAP_nSMALL_LARGE; -- 0: small     1: large
  constant ENABLE_NEIGHTBORS    : std_logic := CFG.ENABLE_NEIGHTBORS; -- 0: disabled  1: enabled

  --------------------------------------------------------------------------------
  -- BLOCKS configuration
  --------------------------------------------------------------------------------
  constant SF_type  : std_logic := '0';  -- 0: CSF 1:LSF

  --------------------------------------------------------------------------------
  -- IN COMPILATION CONFIGURATIONS 
  --------------------------------------------------------------------------------
  constant MAX_NUM_HP   : integer := CFG.MAX_NUM_HP;
  constant MAX_NUM_HEG  : integer := CFG.MAX_NUM_HEG;
  constant MAX_NUM_HPS  : integer := CFG.MAX_NUM_HPS;
  constant MAX_NUM_SL   : integer := 3 + 
  to_integer(unsigned'("" & ST_nBARREL_ENDCAP))*to_integer(unsigned'("" & ENDCAP_nSMALL_LARGE))*3 + 
  to_integer(unsigned'("" & ENABLE_NEIGHTBORS))*2;

  --------------------------------------------------------------------------------
  -- mdt hardware interface config
  --------------------------------------------------------------------------------
  constant numTDCs_lpGBT  : integer := 9; 
  constant numlpGBTs_mux  : integer := 2; 
  constant numInputs_mux  : integer := numlpGBTs_mux * numTDCs_lpGBT; 

  --------------------------------------------------------------------------------
  -- Segment Finder
  --------------------------------------------------------------------------------





end package config_pkg;

