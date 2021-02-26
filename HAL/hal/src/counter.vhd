-------------------------------------------------------------------------------
-- Generic counter
-- original written by Dan Gastler
-- (with some changes made by ap)
-- Process count pulses and provide a buffered value of count
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity counter is
  generic (
    roll_over   : boolean          := false;
    async_reset : boolean          := false;
    width       : integer          := 32
    );
  port (
    clk    : in  std_logic;
    reset  : in  std_logic;
    enable : in  std_logic;
    event  : in  std_logic;
    count  : out std_logic_vector(WIDTH-1 downto 0);
    at_max : out std_logic
    );

end entity counter;

architecture behavioral of counter is

  signal reset_async : std_logic;
  signal reset_sync  : std_logic;

  constant max_count : unsigned(WIDTH-1 downto 0) := (others => '1');
  constant min_count : unsigned(WIDTH-1 downto 0) := (others => '0');
  signal local_count : unsigned(WIDTH-1 downto 0) := min_count;

begin

  reset_async_gen : if (async_reset) generate
    reset_async <= reset;
    reset_sync  <= '0';
  end generate;

  reset_sync_gen : if (not async_reset) generate
    reset_sync  <= reset;
    reset_async <= '0';
  end generate;

  event_counter : process (clk, reset_async)
  begin
    if reset_async = '1' then           -- asynchronous reset (active high)
      local_count <= min_count;
      count       <= std_logic_vector(min_count);
    elsif rising_edge(clk) then
      if reset_sync = '1' then          -- synchronous reset
        local_count <= min_count;
        count       <= std_logic_vector(min_count);
      else
        --output current counter;
        count <= std_logic_vector(local_count);

        -- count
        if enable = '1' and event = '1' then
          if local_count = max_count then
            --roll over if requested
            if roll_over then
              local_count <= min_count;
            end if;
          else
            local_count <= local_count + 1;
          end if;
        end if;
      end if;
    end if;
  end process event_counter;

  check_at_max : process (clk, reset_async) is
  begin  -- process check_at_max
    if reset_async = '1' then           -- asynchronous reset (active high)
      at_max <= '0';
    elsif rising_edge(clk) then
      if reset_sync = '1' then
        -- synchronous reset
        at_max <= '0';
      else
        -- reset at_max
        at_max <= '0';
        if local_count = max_count then
          at_max <= '1';
        end if;

      end if;
    end if;
  end process check_at_max;

end architecture behavioral;
