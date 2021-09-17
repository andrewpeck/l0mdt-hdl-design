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

use shared_lib.detector_param_pkg.all;

library apbus_lib;
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
    actions             : in  TAR_ACTIONS_CTRL_t;
    configs             : in  TAR_CONFIGS_CTRL_t;
    status              : out TAR_STATUS_MON_t;
    --

    --
    i_freeze            : in std_logic := '0';
    o_freeze            : out std_logic;
    --
    local_en            : out std_logic;
    local_rst           : out std_logic
  );
end entity tar_supervisor;

architecture beh of tar_supervisor is
  signal axi_rst      : std_logic;
  signal clk_axi      : std_logic;
  -- signal clk_axi_cnt  : integer;

  signal int_en   : std_logic := '0';
  signal int_rst  : std_logic := '1';
  -- signal mem_rst  : std_logic;
  --
  signal mem_flush_on_Reset : std_logic := '1';
  signal rst_counter        : integer;
  signal rst_trig           : std_logic;
  -- constant RST_Latency      : integer := integer(ceil(log2(real(c_TAR_PL_A_LATENCY))));
  signal rst_done           : std_logic;
  signal rst_states         : std_logic_vector(3 downto 0);

  signal apb_freeze : std_logic;
begin
  --------------------------------------------
  --    AXI CLK
  --------------------------------------------

    PL : entity apbus_lib.apbus_main_sig
    port map(
      clk           => clk,
      rst           => rst,
      ena           => glob_en,
      --
      o_axi_clk     => clk_axi,
      o_axi_rst     => axi_rst
    );

  --------------------------------------------
  --    CTRL
  --------------------------------------------
  local_en <= glob_en and int_en;
  local_rst <= rst or int_rst;

  SIG_PROC: process(clk_axi)
    begin
    if rising_edge(clk_axi) then
      if axi_rst = '1' then
        int_en <= glob_en;
        int_rst <= '1';
        apb_freeze <= '0';
      else
        if actions.reset = '1' then
          int_rst <= '1';
        else
          int_rst <= '0';
        end if;
        if actions.enable = '1' then
          int_en <= '1';
        elsif actions.disable = '1' then
          int_en <= '0';
        end if;
        if actions.freeze = '1' then
          apb_freeze <= '1';
        else
          apb_freeze <= '0';
        end if;
      end if;
    end if;
  end process;
  --------------------------------------------
  --    INTERNAL CTRL
  --------------------------------------------
  o_freeze <= i_freeze or apb_freeze;
  --------------------------------------------
  --    status
  --------------------------------------------
  ST_PROC: process(clk_axi)
  begin
    if rising_edge(clk_axi) then
      if rst = '1' then

      else
        STATUS.ENABLED <= local_en;
        STATUS.READY <= not local_rst;
        STATUS.ERROR <= '0';
      end if;
    end if;
  end process;


  
  
  
end architecture beh;