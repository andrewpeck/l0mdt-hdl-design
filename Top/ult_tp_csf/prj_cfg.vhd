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

package prj_cfg is

  -- constant CFG : cfg_rt := CFG_DEFAULTS;
  function set_project_cfg return cfg_rt;

end package prj_cfg;

package body prj_cfg is

  function set_project_cfg return cfg_rt is
    variable proj_cfg : cfg_rt := CFG_DEFAULTS;
  begin
    -- ------------------------------------------------------------------------------
    -- Sector information
    -- ------------------------------------------------------------------------------
    proj_cfg.SECTOR_ID                := 3;
    proj_cfg.SECTOR_SIDE              := '0';
    proj_cfg.ST_nBARREL_ENDCAP        := '0'; -- 0: barrel    1: Endcap
    -- proj_cfg.ENDCAP_nSMALL_LARGE     := '0'; -- 0: small     1: large
    proj_cfg.ENABLE_NEIGHBORS         := '1'; -- 0: disabled  1: enabled

    -- Blocks
    proj_cfg.INSEL_MDT_nTAR           := '0';
    proj_cfg.ENABLE_UCM               := '1';
    proj_cfg.ENABLE_SF                := '1';
    proj_cfg.SF_TYPE                  := '0';  -- 0: CSF 1:LSF
    proj_cfg.ENABLE_PT                := '0';
    proj_cfg.ENABLE_DAQ               := '0';
    proj_cfg.ENABLE_MTC               := '0';

    proj_cfg.EN_MDT_CH_INN           := "000010";
    proj_cfg.EN_MDT_CH_EXT           := "000000";
    proj_cfg.EN_MDT_CH_MID           := "000010";
    proj_cfg.EN_MDT_CH_OUT           := "000010";

    proj_cfg.NUM_THREADS := 1;
 
    return proj_cfg;
  end function set_project_cfg;

end package body prj_cfg;
