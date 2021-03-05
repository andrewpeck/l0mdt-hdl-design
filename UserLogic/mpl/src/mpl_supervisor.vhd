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
use ieee.math_real.all;

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
    i_freeze            : in std_logic := '0';
    o_freeze            : out std_logic;
    --
    local_en            : out std_logic;
    local_rst           : out std_logic
  );
end entity mpl_supervisor;

architecture beh of mpl_supervisor is

  signal clk_axi      : std_logic;
  signal clk_axi_cnt  : integer;
  constant c_CLK_AXI_MULT : integer := 5; 

  signal int_en   : std_logic;
  signal int_rst  : std_logic;
  -- signal mem_rst  : std_logic;
  --
  signal mem_flush_on_Reset : std_logic := '1';
  signal rst_counter        : integer;
  signal rst_trig           : std_logic;
  constant RST_Latency      : integer := integer(ceil(log2(real(c_MPL_PL_A_LATENCY))));
  signal rst_done           : std_logic;
  signal rst_states         : std_logic_vector(3 downto 0);
begin
  --------------------------------------------
  --    AXI CLK
  --------------------------------------------
  axi_clk_proc : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        clk_axi <= '0';
        clk_axi_cnt <= 0;
      else
        if clk_axi_cnt < c_CLK_AXI_MULT then
          clk_axi_cnt <= clk_axi_cnt + 1;
        else
          clk_axi_cnt <= 0;
          clk_axi <= not clk_axi;
        end if;
      end if;
    end if;
  end process axi_clk_proc;
  --------------------------------------------
  --    CTRL
  --------------------------------------------
  local_en <= glob_en and int_en;

  signaling: process(clk_axi)
    begin
    if rising_edge(clk_axi) then
      if rst = '1' then
        int_en <= glob_en;
        rst_trig <= rst;
      else
        if ctrl.actions.reset = '1' then
          rst_trig <= '1';
        else
          rst_trig <= '0';
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
  --    RESET
  --------------------------------------------
--  local_rst <= rst or int_rst or mem_rst;
  
--  rst_cnt: process(clk)
--  begin
--    if rising_edge(clk) then
--      if rst = '1' then
--        rst_States <= x"0"
--      else
--        case rst_states is
--          when x"0" =>
            
        
--          when others =>
            
        
--        end case;
--      end if;

--      if mem_flush_on_Reset = '0' then
--        int_rst <= rst_trig;
--      else
--        if rst_trig = '1' then
--          rst_counter <= 0;
--        else
--          if rst_counter < RST_Latency then
--            mem_rst <= '1';
--            rst_counter <= rst_counter + 1;
--          else
--            mem_rst <= '0';
--          end if;
--        end if;
--      end if;
--    end if;
--  end process rst_cnt;

  --------------------------------------------
  --    status
  --------------------------------------------
  status: process(clk_axi)
  begin
    if rising_edge(clk_axi) then
      if rst = '1' then

      else
        -- mon.STATUS.G_ENABLED <= local_en;
        -- mon.STATUS.G_READY <= not local_rst;
        -- mon.STATUS.G_ERROR <= '0';
      end if;
    end if;
  end process status;


  
  
  
end architecture beh;