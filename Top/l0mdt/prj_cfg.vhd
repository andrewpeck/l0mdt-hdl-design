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

    -- take these values from HAL, derived from the link mapping
    proj_cfg.NUM_MDT_CH_INN  := c_NUM_POLMUX_INNER;
    proj_cfg.NUM_MDT_CH_MID  := c_NUM_POLMUX_MIDDLE;
    proj_cfg.NUM_MDT_CH_OUT  := c_NUM_POLMUX_OUTER;
    proj_cfg.NUM_MDT_CH_EXT  := c_NUM_POLMUX_EXTRA;
 
    return proj_cfg;
  end function set_project_cfg;

end package body prj_cfg;
