library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;


entity srl16_inf is
  generic (
    g_LENGTH : integer := 16
    );
  port(
    D   : in  std_logic;
    CE  : in  std_logic;
    CLK : in  std_logic;
    A   : in  std_logic_vector (3 downto 0);
    Q   : out std_logic
    );
end srl16_inf;

architecture Behavioral of srl16_inf is
  signal Q_INT : std_logic_vector(g_LENGTH-1 downto 0);
begin
  process(CLK)
  begin
    if rising_edge(CLK) then
      if (CE = '1') then
        Q_INT <= Q_INT(g_LENGTH-2 downto 0) & D;
      end if;
    end if;
  end process;
  Q <= Q_INT(to_integer(unsigned(A)));
end Behavioral;
