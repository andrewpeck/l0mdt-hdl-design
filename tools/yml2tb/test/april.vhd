--
-- experimenting with textio
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity april is

  port (
    clk           : in  std_logic;
    rst           : in  std_logic;
    mask_in       : in  std_logic_vector(5 downto 0);
    april_in      : in  unsigned(5 downto 0);
    april_in_dav  : in  std_logic;
    april_out     : out unsigned(5 downto 0);
    april_out_dav : out std_logic);

end entity april;

architecture arch of april is

begin  -- architecture arch

  process (clk, rst) is
  begin  -- process

    if rst = '1' then                   -- asynchronous reset (active low)
      april_out     <= (others => '0');
      april_out_dav <= '0';

    elsif rising_edge(clk) then         -- rising clock edge

      april_out_dav <= '0';

      if april_in_dav = '1' then
        april_out     <= april_in + 1;
        april_out_dav <= '1';
      end if;
    end if;
  end process;

end architecture arch;
