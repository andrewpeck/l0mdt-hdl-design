--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS candidate distributor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity hps_sf_wrap is
  generic(
    g_STATION_RADIUS     : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    i_sf_control        : in heg_ctrl2hp_rvt;
    i_sf_slc_data       : in ucm2hps_rvt;
    i_sf_mdt_data       : in heg_bm2sf_rvt;
    --
    o_sf_data_v           : out sf2pt_rvt
  );
end entity hps_sf_wrap;

architecture beh of hps_sf_wrap is

begin


end beh;