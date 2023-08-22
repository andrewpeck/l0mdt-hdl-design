--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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

library shared_cfg_def_lib;
use shared_cfg_def_lib.cfg_global_default_pkg.all;

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

    -- ------------------------------------------------------------------------------
    -- Sector information
    -- ------------------------------------------------------------------------------
    proj_cfg.SECTOR_ID                := 3;
    proj_cfg.SECTOR_SIDE              := 0;
    proj_cfg.ST_nBARREL_ENDCAP        := '0'; -- 0: barrel    1: Endcap
    proj_cfg.ENDCAP_nSMALL_LARGE      := '0'; -- 0: small     1: large
    proj_cfg.ENABLE_NEIGHBORS         := '1'; -- 0: disabled  1: enabled

    -- ------------------------------------------------------------------------------
    -- Blocks
    -- ------------------------------------------------------------------------------
    proj_cfg.ENABLE_TAR               := '1';
    proj_cfg.ENABLE_H2S               := '1';
    proj_cfg.ENABLE_UCM               := '1';
    proj_cfg.ENABLE_MPL               := '1';
    proj_cfg.ENABLE_SF                := '0';
    proj_cfg.SF_TYPE                  := '0';  -- 0: CSF 1:LSF
    proj_cfg.SF_BYPASS                := '0'; -- 0: disabled
    proj_cfg.ENABLE_PT                := '0';
    proj_cfg.PT_TYPE                  := '0'; -- default 0
    proj_cfg.ENABLE_DAQ               := '0';
    proj_cfg.ENABLE_MTC               := '0';
    proj_cfg.ENABLE_DAQ               := '1'; -- 0: disabled  1: enabled -- default enabled
    proj_cfg.ENABLE_MTC               := '1';
    proj_cfg.ENABLE_FM                := '1';

    -- 
    proj_cfg.UL_PRESENT               := '1'; -- 0: disabled  1: enabled -- default enabled
    proj_cfg.HW_PRESENT               := '0'; -- 0: disabled  1: enabled -- default disabled
    -- Processing channels
    proj_cfg.ENABLE_ST_INN            := '1'; -- 0: disabled  1: enabled -- default enabled
    proj_cfg.ENABLE_ST_EXT            := '0'; -- 0: disabled  1: enabled -- default disabled
    proj_cfg.ENABLE_ST_MID            := '1'; -- 0: disabled  1: enabled -- default enabled
    proj_cfg.ENABLE_ST_OUT            := '1'; -- 0: disabled  1: enabled -- default enabled
    
    proj_cfg.EN_MDT_CH_INN            := (others => '1');
    proj_cfg.EN_MDT_CH_EXT            := (others => '0');
    proj_cfg.EN_MDT_CH_MID            := (others => '1');
    proj_cfg.EN_MDT_CH_OUT            := (others => '1');
    -- stations enabled in hte:
    proj_cfg.FPGA_EN_ST_INN           := '1';
    proj_cfg.FPGA_EN_ST_EXT           := '0';
    proj_cfg.FPGA_EN_ST_MID           := '1';
    proj_cfg.FPGA_EN_ST_OUT           := '1';
  
    --------------------------------------------------------------------------------
    --  Thread configuration
    --------------------------------------------------------------------------------
    proj_cfg.NUM_THREADS              := 3; -- default 3
    
    -- MTC configuration based on links to primary, neighboring sectors
    -- (barrel, endcap)
    -- connecting to primary SL                 
    proj_cfg.NUM_MTC                  := 3; -- default 3, 
 
    return proj_cfg;
  end function set_project_cfg;

end package body prj_cfg;
