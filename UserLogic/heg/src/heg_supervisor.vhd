--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

entity heg_supervisor is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH     : integer := 6 
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    -- control
    ctrl_v                : in  std_logic_vector; -- H2S_HPS_HEG_HEG_CTRL_t;
    mon_v                 : out std_logic_vector; -- H2S_HPS_HEG_HEG_MON_t;
    -- configuration
    -- SLc
    i_uCM_data_v        : in ucm2hps_rvt;
    -- MDT hit
    i_mdt_full_data_av  : in heg_pc2heg_avt(g_HPS_NUM_MDT_CH-1 downto 0);
    -- to Segment finder
    o_sf_control_v      : out heg_ctrl2sf_rvt;
    o_sf_slc_data_v     : out heg2sfslc_rvt;
    o_sf_mdt_data_v     : out heg2sfhit_rvt
  );
end entity heg_supervisor;

architecture beh of heg_supervisor is
 
begin


end beh;
