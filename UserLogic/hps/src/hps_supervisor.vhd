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
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

library apbus_lib;

entity hps_supervisor is
  generic(
    g_STATION_RADIUS : integer := 0
  );
  port (
    clk         : in std_logic;
    rst         : in std_logic;
    glob_en     : in std_logic;
    --
    i_actions   : in H2S_HPS_ACTIONS_CTRL_t;
    i_configs   : in H2S_HPS_CONFIGS_CTRL_t;
    o_status    : out H2S_HPS_STATUS_MON_t;
    --
    o_local_rst : out std_logic;
    o_local_en    : out std_logic
  );
end entity hps_supervisor;

architecture beh of hps_supervisor is
  signal axi_rst      : std_logic;
  signal clk_axi      : std_logic;
  --
  signal local_rst : std_logic;
  signal local_en  : std_logic;
  --
  signal int_en   : std_logic;
  signal int_rst  : std_logic := '1';
begin
  
  --------------------------------------------
  --    AXI CLK
  --------------------------------------------
  APB_MS : entity apbus_lib.apbus_main_sig
  port map(
    clk           => clk,
    rst           => rst,
    ena           => glob_en,
    --
    o_axi_clk     => clk_axi,
    o_axi_rst     => axi_rst
  );

  --------------------------------------------
  --    SIGNALING
  --------------------------------------------
  o_local_en <= local_en;
  o_local_rst <= local_rst;

  local_en <= glob_en and int_en;
  local_rst <= rst or int_rst;

  signaling: process(clk_axi)
  begin
    if rising_edge(clk_axi) then
      if axi_rst = '1' then
        int_en <= '1';
        int_rst <= rst;
      else
        if i_actions.reset = '1' then
          int_rst <= '1';
        else
          int_rst <= '0';
        end if;
        if i_actions.enable = '1' then
          int_en <= '1';
        elsif i_actions.disable = '1' then
          int_en <= '0';
        end if;
      end if;
    end if;
  end process signaling;
  --------------------------------------------
  --    status
  --------------------------------------------
  status: process(clk_axi)
  begin
    if rising_edge(clk_axi) then
      if axi_rst = '1' then

      else
        o_status.ENABLED  <= local_en;
        o_status.READY    <= local_rst;
        -- o_status.ERROR    <= x"00";
      end if;
    end if;
  end process status;
  
end architecture beh;