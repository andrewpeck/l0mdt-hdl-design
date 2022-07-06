--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: MPL general supervisor
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

use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

library apbus_lib;
-- use mpl_lib.mpl_pkg.all;
 
library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;
use ctrl_lib.MPL_CTRL_DEF.all;

entity mpl_supervisor is
  generic(
    g_RESET_DELAY       : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    -- AXI to SoC
    ctrl_v              : in  std_logic_vector;
    mon_v               : out std_logic_vector;
    -- i_actions             : in  MPL_ACTIONS_CTRL_t;
    -- i_configs             : in  MPL_CONFIGS_CTRL_t;
    -- o_status              : out MPL_STATUS_MON_t;
    --

    --
    i_freeze            : in std_logic := '0';
    o_freeze            : out std_logic;
    --
    o_local_en            : out std_logic;
    o_local_rst           : out std_logic
  );
end entity mpl_supervisor;

architecture beh of mpl_supervisor is
  signal ctrl_r        : MPL_SUPER_CTRL_t;
  signal mon_r         : MPL_SUPER_MON_t;
  --
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
  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);

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
          if ctrl_r.actions.reset = '1' then
            int_rst <= '1';
          else
            int_rst <= '0';
          end if;

          if ctrl_r.actions.enable = '1' then
            int_en <= '1';
          elsif ctrl_r.actions.disable = '1' then
            int_en <= '0';
          end if;
          
          if ctrl_r.actions.freeze = '1' then
            int_freeze <= '1';
          else
            int_freeze <= '0';
          end if;
        -- else
        -- end if;
        --------------------------------------------
        --    to apb
        --------------------------------------------
        mon_r.status.ENABLED <= local_en;
        mon_r.status.FREEZED <= o_freeze;
        mon_r.status.READY <= not local_rst;
        mon_r.status.ERROR <= (others => '0');
      end if;
    end if;
  end process;
end architecture beh;