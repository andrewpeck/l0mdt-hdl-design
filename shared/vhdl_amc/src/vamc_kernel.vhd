--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Configurable delay pipeline
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      simple with no apb controller : done , seems to work ok
--      simple with apb controller : not done
--      parallel mems with apb controller : doing
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee.all;

library vamc_lib;

entity vamc_kernel is
  generic(
    g_PARALLEL_MEM      : integer := 1
  );
  port (

    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --
    i_freeze            : in std_logic;
    o_freeze            : out std_logic_vector(g_PARALLEL_MEM downto 0);
    o_sel_run           : out integer range 0 to g_PARALLEL_MEM;
    o_sel_apb           : out integer range 0 to g_PARALLEL_MEM
  );
end entity vamc_kernel;

architecture beh of vamc_kernel is
  
begin
  
  sel_ctrl: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        o_sel_run <= 0;
        o_sel_apb <= 0;
        o_freeze <= (others => '0');
      else
        if i_freeze then
          o_freeze(o_sel_apb) <= '1';
        else
          o_freeze(o_sel_apb) <= '0';
        end if;
      end if;
    end if;
  end process sel_ctrl;
  
end architecture beh;