--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS mdt parameters calculation
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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

entity hps_pc_top is
  generic(
    -- g_CHAMBER             : integer := 0;
    -- mdt type
    -- type mdt_type;
    g_SIM_nBUILD          : std_logic := '0';
    -- parameters
    g_STATION_RADIUS      : integer := 0  --station
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic;
    -- configuration & control
    i_ctrl_tc             : in H2S_HPS_MDT_TC_MDT_TC_CTRL_t_ARRAY;  
    o_mon_tc              : out H2S_HPS_MDT_TC_MDT_TC_MON_t_ARRAY;
    i_ctrl_t0             : in H2S_HPS_MDT_T0_MDT_T0_CTRL_t_ARRAY;  
    o_mon_t0              : out H2S_HPS_MDT_T0_MDT_T0_MON_t_ARRAY;   
    -- MDT hit
    i_mdt_tar_v           : in tar2hps_rvt;
    o_mdt_full_data_v     : out hp_hpsPc2hp_rvt
  );
end entity hps_pc_top;

architecture beh of hps_pc_top is

  
  
  
begin

   pc_gen : for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 generate
    pc_en : if c_HP_SECTOR_STATION(g_STATION_RADIUS)(hp_i) = '1' generate
    PC : entity hps_lib.hps_pc
    generic map(
      -- mdt type
      -- mdt_type            => mdt_polmux_data_rvt,
      -- g_SIM_nBUILD        => g_SIM_nBUILD,
      -- parameters
      g_CHAMBER         => hp_i,
      g_STATION_RADIUS  => g_STATION_RADIUS
    )
    port map(
      clk         => clk,
      rst         => int_rst,
      ena         => int_ena,
      --
      i_ctrl_tc   => i_ctrl_tc(hp_i),
      o_mon_tc    => o_mon_tc(hp_i),
      i_ctrl_t0   => i_ctrl_t0(hp_i),
      o_mon_t0    => o_mon_t0(hp_i),
      --
      i_mdt_tar_v       => i_mdt_tar_av(hp_i),
      o_mdt_full_data_v => mdt_full_data_av(hp_i)
    );
  end generate;
end generate;

end beh;