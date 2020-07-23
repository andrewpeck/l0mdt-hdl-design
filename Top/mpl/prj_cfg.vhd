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

package config_pkg is

  -- constant CFG : cfg_rt := CFG_DEFAULTS;
  function set_project_cfg return cfg_rt;

end package config_pkg;

package body config_pkg is

  function set_project_cfg return cfg_rt is
    variable proj_cfg : cfg_rt := CFG_DEFAULTS;
  begin
  --   --------------------------------------------------------------------------------
  --   -- Sector information
  --   --------------------------------------------------------------------------------
  --   proj_cfg.SECTOR_ID               := 3,
  --   proj_cfg.ST_nBARREL_ENDCAP       := '0', -- 0: barrel    1: Endcap
  --   proj_cfg.ENDCAP_nSMALL_LARGE     := '0', -- 0: small     1: large
  --   proj_cfg.ENABLE_NEIGHBORS        := '1', -- 0: disabled  1: enabled
  --   --------------------------------------------------------------------------------
  --   -- IN COMPILATION CONFIGURATIONS 
  --   --------------------------------------------------------------------------------
  --   proj_cfg.NUM_THREADS             := 3,
  --   proj_cfg.MAX_NUM_HPS             := 3,
  --   proj_cfg.MAX_NUM_SL              := 5,--3 + to_integer(unsigned'("" & CFG_DEFAULTS.ST_nBARREL_ENDCAP))*to_integer(unsigned'("" & CFG_DEFAULTS.ENDCAP_nSMALL_LARGE))*3 + to_integer(unsigned'("" & CFG_DEFAULTS.ENABLE_NEIGHBORS))*2,
  --   --------------------------------------------------------------------------------
  --   -- mdt hardware interface config
  --   --------------------------------------------------------------------------------
  --   -- numTDCs_lpGBT           := 9, 
  --   -- numlpGBTs_mux           := 2, 
  --   -- numInputs_mux           := numlpGBTs_mux * numTDCs_lpGBT, 
  --   --------------------------------------------------------------------------------
  --   -- Segment Finder
  --   --------------------------------------------------------------------------------
  --   proj_cfg.SF_TYPE                 := '0',  -- 0: CSF 1:LSF
 
    return proj_cfg;
  end function set_project_cfg;

end package body config_pkg;
