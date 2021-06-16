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
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.math_real.all;

library shared_lib;

entity vamc_sr is
  generic(
    g_RESET_to_0S       : std_logic := '1';
    g_DELAY_CYCLES      : integer; 
    g_DELAY_EQUAL_WIDTH : integer := 0;
    g_PIPELINE_WIDTH    : integer
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena             : in std_logic;
    --
    i_freeze            : in std_logic := '0';
    --
    i_data              : in std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
    i_dv                : in std_logic := '0';
    o_data              : out std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
    o_dv                : out std_logic
  );
end entity vamc_sr;

architecture beh of vamc_sr is

  type data_pl_at is array (g_DELAY_CYCLES -1 downto 0) of std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
  signal data_pl : data_pl_at;
  signal dv_pl : std_logic_vector(g_DELAY_CYCLES -1 downto 0);

begin

  o_data <= data_pl(0);
  o_dv <= dv_pl(0);

  valid_pipe : process(rst,clk) begin
    if rising_edge(clk)then
      if rst= '1' then
        if g_RESET_to_0S = '1' then
          data_pl <= (others => (others => '0'));
        end if;
        dv_pl <= (others => '0');
      else
        if ena = '1' then
          for delay_i in g_DELAY_CYCLES - 1 downto 1 loop
            data_pl(delay_i - 1) <= data_pl(delay_i);
            dv_pl(delay_i - 1) <= dv_pl(delay_i);
          end loop;
          data_pl(g_DELAY_CYCLES - 1) <= i_data;
          dv_pl(g_DELAY_CYCLES - 1) <= i_dv;
        end if;
      end if;
    end if;
  end process;



end beh;