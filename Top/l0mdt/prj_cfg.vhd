library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_global_pkg.all;

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

    proj_cfg.INSEL_MDT_nTAR := '1';

    -- take these values from HAL, derived from the link mapping
    proj_cfg.NUM_MDT_CH_INN  := c_NUM_POLMUX_INNER;
    proj_cfg.NUM_MDT_CH_MID  := c_NUM_POLMUX_MIDDLE;
    proj_cfg.NUM_MDT_CH_OUT  := c_NUM_POLMUX_OUTER;
    proj_cfg.NUM_MDT_CH_EXT  := c_NUM_POLMUX_EXTRA;

    if (c_NUM_POLMUX_INNER > 0) then
      proj_cfg.ENABLE_ST_INN := '1';
    else
      proj_cfg.ENABLE_ST_INN := '0';
    end if;

    if (c_NUM_POLMUX_MIDDLE > 0) then
      proj_cfg.ENABLE_ST_MID := '1';
    else
      proj_cfg.ENABLE_ST_MID := '0';
    end if;

    if (c_NUM_POLMUX_OUTER > 0) then
      proj_cfg.ENABLE_ST_OUT := '1';
    else
      proj_cfg.ENABLE_ST_OUT := '0';
    end if;

    if (c_NUM_POLMUX_EXTRA > 0) then
      proj_cfg.ENABLE_ST_EXT := '1';
    else
      proj_cfg.ENABLE_ST_EXT := '0';
    end if;

    return proj_cfg;

  end function set_project_cfg;

end package body prj_cfg;
