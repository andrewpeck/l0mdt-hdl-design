--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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
library hps_lib;
use hps_lib.hps_pkg.all;

entity hps is
  generic(
    g_STATION_RADIUS      : integer := 0;  --station
    g_HPS_NUM_MDT_CH      : integer := 6 
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    glob_en               : in std_logic;
    -- control

    -- SLc
    i_uCM2hps_av          : in ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    i_mdt_tar_av          : in tar2hps_bus_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- to pt calc
    o_sf2pt_av            : out sf2pt_bus_avt(c_NUM_THREADS -1 downto 0)
  );
end entity hps;

architecture beh of hps is

  signal mdt_full_data_av : heg_pc2heg_avt(g_HPS_NUM_MDT_CH-1 downto 0);

  -- signal int_uCM_data : ucm2heg_slc_avt(c_NUM_THREADS -1 downto 0);
  -- signal control_enable(c_NUM_THREADS -1 downto 0);

  signal heg2sf_control : hps_ctrl2sf_avt(c_NUM_THREADS -1 downto 0);
  signal heg2sfslc_av   : heg2sfslc_bus_avt(c_NUM_THREADS -1 downto 0);
  signal heg2sfhit_av   : heg2sfhit_bus_avt(c_NUM_THREADS -1 downto 0);

begin

  pc_gen : for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 generate
    PC : entity hps_lib.hps_pc 
    generic map(
      -- mdt type
      -- mdt_type            => mdt_polmux_data_rvt,
      -- g_SIM_nBUILD        => g_SIM_nBUILD,
      -- parameters
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_mdt_tar_v         => i_mdt_tar_av(hp_i),
      o_mdt_full_data_v   => mdt_full_data_av(hp_i)
    );
  end generate;

  heg_gen : for heg_i in c_NUM_THREADS -1 downto 0 generate
    HEG : entity heg_lib.heg
    generic map(
      g_STATION_RADIUS      => g_STATION_RADIUS,
      g_HPS_NUM_MDT_CH       => g_HPS_NUM_MDT_CH
    )
    port map(
      clk                   => clk,
      rst                   => rst,
      glob_en               => glob_en,
      --
      i_uCM_data_v          => i_uCM2hps_av(heg_i),
      -- MDT hit
      i_mdt_full_data_av    => mdt_full_data_av,
      -- to Segment finder
      o_sf_control_v        => heg2sf_control(heg_i),
      o_sf_slc_data_v       => heg2sfslc_av(heg_i),
      o_sf_mdt_data_v       => heg2sfhit_av(heg_i)
    );

    SF : entity hps_lib.hps_sf_wrap
    generic map(
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      -- to Segment finder
      i_control        => heg2sf_control(heg_i),
      i_slc_data       => heg2sfslc_av(heg_i),
      i_mdt_data       => heg2sfhit_av(heg_i),
      --
      o_sf_data_v         => o_sf2pt_av(heg_i)
    );

  end generate;


end beh;
