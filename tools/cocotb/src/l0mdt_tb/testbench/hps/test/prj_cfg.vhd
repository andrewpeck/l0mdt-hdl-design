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

--library shared_lib;
--use shared_lib.cfg_global_default_pkg.all;
library shared_cfg_def_lib;
use shared_cfg_def_lib.cfg_global_default_pkg.all;

package prj_cfg is

  constant c_MAX_NUM_SL   : integer := 3;
  constant c_NUM_THREADS  : integer := 1;
  constant c_MAX_POSSIBLE_HPS : integer := 3;
  constant c_SECTOR_ID            : integer := 3;
  function set_project_cfg return cfg_rt;

end package prj_cfg;

package body prj_cfg is

  function set_project_cfg return cfg_rt is
    variable proj_cfg : cfg_rt := CFG_DEFAULTS;
  begin
  --   --------------------------------------------------------------------------------
  --   -- Sector information
  --   --------------------------------------------------------------------------------
    proj_cfg.SECTOR_ID               := c_SECTOR_ID ;

    proj_cfg.ST_nBARREL_ENDCAP       := '0';     -- 0: barrel    1: Endcap
  --   proj_cfg.ENDCAP_nSMALL_LARGE     := '0', -- 0: small     1: large
    proj_cfg.ENABLE_NEIGHBORS       := '0'; -- 0: disabled  1: enabled
  --   --------------------------------------------------------------------------------
  --   -- IN COMPILATION CONFIGURATIONS
  --   --------------------------------------------------------------------------------
    proj_cfg.NUM_THREADS             := c_NUM_THREADS; --3;
    proj_cfg.NUM_MTC                 := 3;

  --   proj_cfg.MAX_NUM_HPS             := 3,
    -- proj_cfg.MAX_NUM_SL              := 5,--3 + to_integer(unsigned'("" & CFG_DEFAULTS.ST_nBARREL_ENDCAP))*to_integer(unsigned'("" & CFG_DEFAULTS.ENDCAP_nSMALL_LARGE))*3 + to_integer(unsigned'("" & CFG_DEFAULTS.ENABLE_NEIGHBORS))*2,
  --   --------------------------------------------------------------------------------
  --   -- mdt hardware interface config
  --   --------------------------------------------------------------------------------
  --   -- numTDCs_lpGBT           := 9,
  --   -- numlpGBTs_mux           := 2,
  --   -- numInputs_mux           := numlpGBTs_mux * numTDCs_lpGBT,
  --   --------------------------------------------------------------------------------
  --   -- Segment Finder
  --   --------------------------------------------------------------------------------
    proj_cfg.SF_TYPE                 := '1';  -- 0: CSF 1:LSF

    return proj_cfg;
  end function set_project_cfg;

end package body prj_cfg;
