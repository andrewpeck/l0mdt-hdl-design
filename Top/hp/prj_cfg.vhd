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

    proj_cfg.SF_type := '1';
 
    return proj_cfg;
  end function set_project_cfg;

end package body config_pkg;