library ieee;
use ieee.std_logic_1164.all;

entity clock_strobe is
  port(
    fast_clk_i : in  std_logic;
    slow_clk_i : in  std_logic;
    strobe_o   : out std_logic
    );
end clock_strobe;

architecture behavioral of clock_strobe is

  signal reg     : std_logic := '0';
  signal reg_dly : std_logic := '0';

begin
  --------------------------------------------------------------------------------
  -- Valid
  --------------------------------------------------------------------------------

  -- Create a 1 of n high signal synced to the slow clock, e.g.
  --
  --            ┌───────┐       ┌───────┐       ┌───────┐       ┌───
  -- clk40     ─┘       └───────┘       └───────┘       └───────┘
  --            ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐
  -- clk200    ─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─
  --            ┌───────────────┐               ┌───────────────┐
  -- reg       ─┘               └───────────────┘               └───
  --                ┌───────────────┐               ┌───────────────┐
  -- reg_dly   ─────┘               └───────────────┘               └───
  --            ┌───┐           ┌───┐           ┌───┐           ┌───┐
  -- valid     ─┘   └───────────┘   └───────────┘   └───────────┘   └──

  process (slow_clk_i)
  begin
    if (rising_edge(slow_clk_i)) then
      reg <= not reg after 0.1 ns;      -- need delay in simulation to prevent race condition
    end if;
  end process;

  process (fast_clk_i)
  begin
    if (rising_edge(fast_clk_i)) then
      reg_dly <= reg after 0.1 ns;
    end if;
  end process;

  strobe_o <= reg_dly xor reg;

end behavioral;
