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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity hps_sf_wrap is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    i_sf_control        : in heg_int_control_rt;
    i_sf_slc_data       : in ucm2heg_slc_rt;
    i_sf_mdt_data       : in heg2sf_mdt_rt;
    --
    o_sf_data           : out hps2pt_sf_vt
  );
end entity hps_sf_wrap;

architecture beh of hps_sf_wrap is

begin


end beh;