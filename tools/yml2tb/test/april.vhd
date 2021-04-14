--
-- experimenting with textio
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.april_types.all;

entity april is

  port (
    clk        : in  std_logic;
    rst        : in  std_logic;
    my_bus_in  : in  bus_in;
    my_bus_out : out bus_out;
    my_mem_out : out mem_array
    );

end entity april;

architecture arch of april is

  signal memory : mem_array := ( others => (others => (others =>'0')));

begin  -- architecture arch

  process (clk, rst) is
    variable adx : integer;
  begin  -- process

    if rst = '1' then                   -- asynchronous reset (active low)

    elsif rising_edge(clk) then         -- rising clock edge

      if my_bus_in.rd = '1' then
        my_bus_out.data <= memory(to_integer(my_bus_in.addr)).data;
        my_bus_out.valid <= '1';
      else
        my_bus_out.valid <= '0';
      end if;

      if my_bus_in.wr = '1' then
        memory(to_integer(my_bus_in.addr)).data <= std_logic_vector(my_bus_in.data);
      end if;

      my_mem_out <= memory;

    end if;
  end process;

end architecture arch;
