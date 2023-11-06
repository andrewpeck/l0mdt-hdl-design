library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_cfg_def_lib;
use shared_cfg_def_lib.cfg_global_default_pkg.all;

--library hal;
--use hal.constants_pkg.all;
--use hal.link_map.all;

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
    proj_cfg.SECTOR_SIDE              := 0;
    proj_cfg.ST_nBARREL_ENDCAP        := '0'; -- 0: barrel    1: Endcap
    proj_cfg.ENDCAP_nSMALL_LARGE      := '0'; -- 0: small     1: large
    proj_cfg.ENABLE_NEIGHBORS         := '0'; -- 0: disabled  1: enabled

    -- Blocks
    proj_cfg.ENABLE_MPL               := '1';
    proj_cfg.ENABLE_UCM               := '1';
    proj_cfg.ENABLE_SF                := '1';
    proj_cfg.ENABLE_PT                := '1';
    proj_cfg.ENABLE_MTC               := '1';

    proj_cfg.ENABLE_DAQ               := '0';
    proj_cfg.ENABLE_MTC               := '1';


    proj_cfg.SF_TYPE   := '1'; -- AUTO: 0: CSF 1:LSF
    proj_cfg.PT_TYPE   := '1'; -- AUTO: 0: MPT 1:UPT

   -- proj_cfg.ENABLE_ST_INN := '1';
   -- proj_cfg.EN_MDT_CH_INN := (others => '1');

    --proj_cfg.EN_MDT_CH_MID := (others => '0');
    --proj_cfg.ENABLE_ST_MID := '0';

    --proj_cfg.EN_MDT_CH_OUT := (others => '0');
    --proj_cfg.ENABLE_ST_OUT := '0';

     proj_cfg.EN_MDT_CH_EXT := (others => '0');
     proj_cfg.ENABLE_ST_EXT := '0';


    proj_cfg.NUM_THREADS   := 3;
    proj_cfg.ENABLE_ST_INN := '1';
    proj_cfg.EN_MDT_CH_INN := (others => '1');
    proj_cfg.EN_MDT_CH_MID := (others => '1');
    proj_cfg.ENABLE_ST_MID := '1';
    proj_cfg.EN_MDT_CH_OUT := (others => '1');
    proj_cfg.ENABLE_ST_OUT := '1';



    --if (c_NUM_POLMUX_EXTRA > 0) then
    --  proj_cfg.EN_MDT_CH_EXT := (others => '1');
    --  proj_cfg.ENABLE_ST_EXT := '1';
    --else
    --  proj_cfg.EN_MDT_CH_EXT := (others => '0');
    --  proj_cfg.ENABLE_ST_EXT := '0';
    --end if;

    return proj_cfg;

  end function set_project_cfg;

end package body prj_cfg;
