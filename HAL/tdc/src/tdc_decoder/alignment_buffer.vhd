library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity alignment_buffer is
  port(

    clock     : in  std_logic;
    bitslip_i : in  std_logic;
    valid_i   : in  std_logic;

    data_i : in  std_logic_vector (7 downto 0);
    data_o : out std_logic_vector (7 downto 0);

    valid_o   : out  std_logic

    );
end alignment_buffer;

architecture parallel of alignment_buffer is

  -- bitslip signals
  signal fifo        : std_logic_vector (7 downto 0);  -- pick of just the head of the fifo
  signal data_buffer : std_logic_vector (8*2-1 downto 0);
  signal fifo_ptr    : integer range 0 to 8 := 0;      -- pointer to start address of fifo header

begin

  process(clock) is
  begin
    if (rising_edge(clock)) then

      valid_o <= valid_i;

      if (valid_i = '1') then

        -- bring the data into a 32 bit deep buffer that allows us to realign the data to 10 bit boundaries
        data_buffer <= data_buffer (7 downto 0) & data_i (7 downto 0);

        -- pick out the pointed-to 8 bits so that 8 bits comes out according to some well-defined alignment
        data_o <= data_buffer (fifo_ptr+7 downto fifo_ptr);
      end if;

      -- increment counter when bitslip is selected
      if (bitslip_i = '1') then
        if (fifo_ptr < 7) then
          fifo_ptr <= fifo_ptr + 1;
        else
          fifo_ptr <= 0;
        end if;
      end if;

    end if; -- clock
  end process;

end parallel;
