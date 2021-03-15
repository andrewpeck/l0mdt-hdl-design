--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;


use shared_lib.detector_param_pkg.all;
 
library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;

entity mpl_supervisor is
  generic(
    g_RESET_DELAY       : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- AXI to SoC
    ctrl                : in  MPL_CTRL_t;
    mon                 : out MPL_MON_t;
    --

    --
    local_en            : out std_logic;
    local_rst           : out std_logic
  );
end entity mpl_supervisor;

architecture beh of mpl_supervisor is
  signal int_en   : std_logic;
  signal int_rst  : std_logic;
  signal mem_rst  : std_logic;
  --
  signal mem_flush_on_Reset : std_logic := '1';
  signal rst_counter : integer;
begin
  
  --------------------------------------------
  --    SIGNALING
  --------------------------------------------
  local_en <= glob_en and int_en;
  local_rst <= rst or int_rst or mem_rst;

  signaling: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        int_en <= glob_en;
        int_rst <= rst;
      else
        if ctrl.actions.reset = '1' then
          int_rst <= '1';
        else
          int_rst <= '0';
        end if;
        if ctrl.actions.enable = '1' then
          int_en <= '1';
        elsif ctrl.actions.disable = '1' then
          int_en <= '0';
        end if;
      end if;
    end if;
  end process signaling;
  --------------------------------------------
  --    status
  --------------------------------------------
  status: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then

      else
        mon.STATUS.G_ENABLED <= local_en;
        mon.STATUS.G_READY <= not local_rst;
        mon.STATUS.G_ERROR <= '0';
      end if;
    end if;
  end process status;

  --------------------------------------------
  --    RESET
  --------------------------------------------
  -- FLUSH_DISABLED: if mem_flush_on_Reset = '0' generate
  --   local_rst <= rst or int_rst;
  -- end generate;

  -- FLUSH_ENABLED: if mem_flush_on_Reset = '1' generate
  MEM_RESET: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        mem_rst <= '1';
        rst_counter <= 0;
      else

        
      end if;
    end if;
  end process MEM_RESET;
  -- end generate;
  
  
  
end architecture beh;