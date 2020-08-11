--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
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

library project_lib;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity hps_tb is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH    : integer := 6 
  );
end entity hps_tb;

architecture beh of hps_tb is

  -- clk
  constant clk_period : time := 2.7778 ns;
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;
  
  signal glob_en : std_logic := '1';

  
begin
  
  HPS : entity hps_lib.hps
  generic map(
    -- mdt type
    -- mdt_type_av          => mdt_polmux_data_avt(g_HPS_NUM_MDT_CH -1 downto 0),
    -- g_SIM_nBUILD         => '1',
    -- parameters
    g_STATION_RADIUS    => g_STATION_RADIUS,
    g_HPS_NUM_MDT_CH     => g_HPS_NUM_MDT_CH
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => glob_en,
    -- configuration & control
    -- i_uCM_pam           => i_uCM_pam,
    -- SLc
    i_uCM2hps_av        => i_uCM2hps_av,
    -- MDT hit
    i_mdt_tar_av        => i_mdt_tar_av,
    -- to pt calc
    o_sf2pt_av          => o_sf2pt_av
  );
  
  
end architecture beh;