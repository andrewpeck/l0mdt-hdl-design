--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: hp_custom_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /UserLogic/hp/pkg/hp_custom_pkg.vhd
-- -----
-- File Created: Tuesday, 15th March 2022 3:17:00 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 15th March 2022 3:17:48 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library vamc_lib;

library hp_lib;
use hp_lib.hp_pkg.all;

package hp_custom_pkg   is
  
  -- signal hp_win_tubes_rt_temp : hp_win_tubes_rt;
  -- subtype hp_win_tubes_vt is std_logic_vector(width(hp_win_tubes_rt_temp)-1 downto 0);
  -- type hp_win_tubes_avt is array(integer range <>) of hp_win_tubes_vt;

  -- signal hp_win_tubes_limits_rt_temp : hp_win_tubes_limits_rt;
  -- subtype hp_win_tubes_limits_vt is std_logic_vector(width(hp_win_tubes_limits_rt_temp)-1 downto 0);
  -- type hp_win_tubes_limits_avt is array(integer range <>) of hp_win_tubes_limits_vt;

  -- signal hp_heg2hp_slc_rt_temp : hp_heg2hp_slc_rt;
  -- subtype hp_heg2hp_slc_vt is std_logic_vector(width(hp_heg2hp_slc_rt_temp)-1 downto 0);
  -- type hp_heg2hp_slc_avt is array(integer range <>) of hp_heg2hp_slc_vt;

  -- signal hp_hpsPc2hp_rt_temp : hp_hpsPc2hp_rt;
  -- subtype hp_hpsPc2hp_vt is std_logic_vector(width(hp_hpsPc2hp_rt_temp)-1 downto 0);
  -- type hp_hpsPc2hp_avt is array(integer range <>) of hp_hpsPc2hp_vt;

  -- signal hp_hp2sf_data_rt_temp : hp_hp2sf_data_rt;
  -- subtype hp_hp2sf_data_vt is std_logic_vector(width(hp_hp2sf_data_rt_temp)-1 downto 0);
  -- type hp_hp2sf_data_avt is array(integer range <>) of hp_hp2sf_data_vt;

  -- signal hp_hp2bm_rt_temp : hp_hp2bm_rt;
  -- subtype hp_hp2bm_vt is std_logic_vector(width(hp_hp2bm_rt_temp)-1 downto 0);

end package hp_custom_pkg;  

-- package body hp_custom_pkg is
  
  
  
-- end package body hp_custom_pkg;