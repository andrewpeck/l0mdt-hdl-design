--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: TAR general supervisor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

-- use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

-- library apbus_lib;
-- use TAR_lib.TAR_pkg.all;
 
library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.TAR_CTRL_DEF.all;

entity tar_supervisor is
  generic(
    g_RESET_DELAY       : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    -- AXI to SoC
    i_actions             : in  TAR_ACTIONS_CTRL_t;
    i_configs             : in  TAR_CONFIGS_CTRL_t;
    o_status              : out TAR_STATUS_MON_t;
    --

    --
    i_freeze            : in std_logic := '0';
    o_freeze            : out std_logic;
    --
    o_local_en            : out std_logic;
    o_local_rst           : out std_logic
  );
end entity tar_supervisor;

architecture beh of tar_supervisor is
  signal local_rst : std_logic;
  signal local_en  : std_logic;
  --
  signal int_en   : std_logic;
  signal int_rst  : std_logic := '1';

  signal int_freeze : std_logic;

  constant apb_clk_lat : integer := c_CLK_AXI_MULT;
  signal  apb_clk_cnt : integer;
  signal axi_cnt_reset    : std_logic;
  signal axi_rep_clk      : std_logic;
begin
  o_local_en <= local_en;
  o_local_rst <= local_rst;

  local_en <= glob_en and int_en;
  local_rst <= rst or int_rst;

  o_freeze <= i_freeze or int_freeze;

  signaling: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        int_en <= '1';
        int_rst <= rst;
        apb_clk_cnt <= 0;
      else
        --------------------------------------------
        --    AXI CLK CTRL
        --------------------------------------------
        if apb_clk_cnt < apb_clk_lat and axi_cnt_reset = '0' then
          apb_clk_cnt <= apb_clk_cnt + 1;
        else
          apb_clk_cnt <= 0;
          axi_rep_clk <= not axi_rep_clk;
        end if;
        --------------------------------------------
        --    from apb
        --------------------------------------------
        -- if apb_clk_cnt = 0 then
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
          
          if i_actions.freeze = '1' then
            int_freeze <= '1';
          else
            int_freeze <= '0';
          end if;
        -- else
        -- end if;
        --------------------------------------------
        --    to apb
        --------------------------------------------
        o_status.ENABLED <= local_en;
        o_status.READY <= not local_rst;
        o_status.ERROR <= (others => '0');
        o_status.FREEZED <= o_freeze;
      end if;
    end if;
  end process;
end architecture beh;