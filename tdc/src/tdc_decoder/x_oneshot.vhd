library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity x_oneshot is
  port (
    d     : in  std_logic;
    clock : in  std_logic;
    q     : out std_logic := '0'
    );
end x_oneshot;

architecture rtl of x_oneshot is
  type sm_t is (idle, pulse, hold);
  signal sm : sm_t := idle;
begin

-- One-shot state machine

  process (clock) is
  begin
    if (rising_edge(clock)) then
      case sm is
        when idle =>
          if (d = '1') then sm <= pulse; end if;
        when pulse =>
          sm <= hold;
        when hold =>
          if(d = '0') then sm <= idle; end if;
      end case;
    end if;
  end process;

  -- Output FF

  process (clock) is
  begin
    if (rising_edge(clock)) then
      if (sm = pulse) then
        q <= '1';
      else
        q <= '0';
      end if;

    end if;
  end process;

end rtl;
