
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity gbt_unstuffer_tb is
end gbt_unstuffer_tb;

architecture Behavioral of gbt_unstuffer_tb is

signal reset    : std_logic := '1';
signal clock_en : std_logic := '1';
signal clock    : std_logic := '1';
signal clock40  : std_logic := '1';
signal clock160 : std_logic := '1';
signal clock80  : std_logic := '1';
signal ic       : std_logic_vector (1 downto 0);

signal frame_o : std_logic_vector (7 downto 0);
signal valid_o :std_logic;
signal header_o : std_logic;


begin

--------------------------------------------------------------------------------
-- clocks
--------------------------------------------------------------------------------
clock <= not clock after 1.5625 ns;

process (clock) begin
if (rising_edge(clock)) then
    clock160 <= not clock160;
end if;
end process;

process (clock160) begin
if (rising_edge(clock160)) then
    clock80 <= not clock80;
end if;
end process;

process (clock80) begin
if (rising_edge(clock80)) then
    clock40 <= not clock40;
end if;
end process;

ic_process : process
begin
    ic <= "00";
    wait for 25 ns;
    ic <= "00";
    wait for 25 ns;
    ic <= "00";
    wait for 25 ns;
    ic <= "00";
    wait for 25 ns;
    ic <= "00";
    wait for 25 ns;
    ic <= "00";
    wait for 25 ns;
    ic <= "11";
    wait for 25 ns;
    ic <= "11";
    wait for 25 ns;
    ic <= "11";
    wait for 25 ns;
    ic <= "00";
    wait for 25 ns;

end process;

    --------------------------------------------------------------------------------
    -- reset
    --------------------------------------------------------------------------------

    process (clock40)
        variable counter : integer range 0 to 31;
    begin
        if (rising_edge(clock40)) then
            counter := counter + 1;
        end if;

        if (reset='1'  and counter=31) then
            reset <= '0';
        end if;

    end process;

--------------------------------------------------------------------------------
-- clock_en
--------------------------------------------------------------------------------
process (clock)
variable counter : integer range 0 to 8;
begin
    if (rising_edge(clock)) then

        if reset = '1' then
            counter := 0;
            clock_en <= '0';

        else
            counter := counter + 1;

            if counter = 8 then
                counter := 0;
            end if;

            clock_en   <= '0';
            if counter = 0 then
                clock_en   <= '1';
            end if;
        end if;


    end if;
end process;

gbt_unstuffer_inst : entity work.gbt_unstuffer
port map (
    clock_i => clock,
    clock_en_i => clock_en,
    reset_i => '0',
    ic => ic,
    frame_o => frame_o,
    header_o => header_o,
    valid_o => valid_o
);

end Behavioral;
