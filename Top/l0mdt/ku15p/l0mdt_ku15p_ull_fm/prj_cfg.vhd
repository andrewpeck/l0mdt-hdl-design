library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_cfg_def_lib;
use shared_cfg_def_lib.cfg_global_default_pkg.all;

library hal;
use hal.constants_pkg.all;

package prj_cfg is

  -- constant CFG : cfg_rt := CFG_DEFAULTS;
  function set_project_cfg return cfg_rt;

end package prj_cfg;

package body prj_cfg is

  function set_project_cfg return cfg_rt is
    variable proj_cfg : cfg_rt := CFG_DEFAULTS;
  begin

    -- THESE VARIABLES ARE AUTO-SET FROM THE MDT FLAVORS SCRIPT

    -- sector configuration
    proj_cfg.SECTOR_ID           := 3;
    proj_cfg.SECTOR_SIDE         := 0;
    proj_cfg.ST_nBARREL_ENDCAP   := '0';  -- 0: barrel    1: Endcap
    proj_cfg.ENABLE_NEIGHBORS    := '0';  -- 0: disabled  1: enabled
    proj_cfg.ENDCAP_nSMALL_LARGE := '0';  -- 0: small     1: large

    -- sf types
    proj_cfg.SF_TYPE             := '1';  -- 0: CSF       1: LSF
    proj_cfg.PT_TYPE             := '0';  -- 0: MPT       1: UPT

    -- enables
    proj_cfg.ENABLE_DAQ          := '0';
    proj_cfg.ENABLE_SF           := '1';
    proj_cfg.ENABLE_FM           := '1';
    proj_cfg.ENABLE_PT           := '0';
    proj_cfg.ENABLE_UCM          := '1';
    proj_cfg.ENABLE_H2S          := '1';
    proj_cfg.ENABLE_MPL          := '0';
    proj_cfg.ENABLE_MTC          := '0';
    proj_cfg.ENABLE_TAR          := '0';

    -- END of auto-set variables
    proj_cfg.NUM_MTC             := 3;    -- default 3, connecting to primary SL


    -- take these values from HAL, derived from the link mapping
     proj_cfg.NUM_MDT_CH_INN  := c_NUM_POLMUX_INNER;
     proj_cfg.NUM_MDT_CH_MID  := c_NUM_POLMUX_MIDDLE;
     proj_cfg.NUM_MDT_CH_OUT  := c_NUM_POLMUX_OUTER;
     proj_cfg.NUM_MDT_CH_EXT  := c_NUM_POLMUX_EXTRA;

    if (c_NUM_POLMUX_INNER > 0) then
      proj_cfg.ENABLE_ST_INN := '1';
      proj_cfg.EN_MDT_CH_INN := (others => '1');
    else
      proj_cfg.ENABLE_ST_INN := '0';
      proj_cfg.EN_MDT_CH_INN := (others => '0');
    end if;

    if (c_NUM_POLMUX_MIDDLE > 0) then
      proj_cfg.EN_MDT_CH_MID := (others => '1');
      proj_cfg.ENABLE_ST_MID := '1';
    else
      proj_cfg.EN_MDT_CH_MID := (others => '0');
      proj_cfg.ENABLE_ST_MID := '0';
    end if;

    if (c_NUM_POLMUX_OUTER > 0) then
      proj_cfg.EN_MDT_CH_OUT := (others => '1');
      proj_cfg.ENABLE_ST_OUT := '1';
    else
      proj_cfg.EN_MDT_CH_OUT := (others => '0');
      proj_cfg.ENABLE_ST_OUT := '0';
    end if;

    if (c_NUM_POLMUX_EXTRA > 0) then
      proj_cfg.EN_MDT_CH_EXT := (others => '1');
      proj_cfg.ENABLE_ST_EXT := '1';
    else
      proj_cfg.EN_MDT_CH_EXT := (others => '0');
      proj_cfg.ENABLE_ST_EXT := '0';
    end if;
    proj_cfg.ENABLE_ST_INN  := '1';
    proj_cfg.EN_MDT_CH_INN := (others => '1');
    proj_cfg.ENABLE_ST_MID  := '1';
    proj_cfg.EN_MDT_CH_MID := (others => '1');
    proj_cfg.ENABLE_ST_OUT := '1';
    proj_cfg.EN_MDT_CH_OUT := (others => '1');
    
    return proj_cfg;

  end function set_project_cfg;

end package body prj_cfg;
