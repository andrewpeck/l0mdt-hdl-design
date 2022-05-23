library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_cfg_def_lib;
use shared_cfg_def_lib.cfg_global_default_pkg.all;

--library hal;
--use hal.constants_pkg.all;

package prj_cfg is

  -- constant CFG : cfg_rt := CFG_DEFAULTS;
  function set_project_cfg return cfg_rt;

end package prj_cfg;

package body prj_cfg is

  function set_project_cfg return cfg_rt is
    variable proj_cfg : cfg_rt := CFG_DEFAULTS;
  begin
    return proj_cfg;

  end function set_project_cfg;

end package body prj_cfg;
