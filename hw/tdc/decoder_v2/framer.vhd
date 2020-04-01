library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity framer is
  port(
    clock          : in  std_logic;
    fifo_valid     : in  std_logic;
    word_mux       : out std_logic_vector (9 downto 0);
    frame_zero     : out  std_logic;
    word_mux_valid : out std_logic;
    fifo           : in  std_logic_vector (15 downto 0)
    );
end framer;

architecture behavioral of framer is
  -- frame parser signals
  type frame_state_t is (FRAME0, FRAME1, FRAME2, FRAME3, FRAME4);
  signal frame_state : frame_state_t;

  signal word_buf : std_logic_vector (9 downto 0);
begin

  frame_zero <= '1' when frame_state = FRAME0 else '0';

  process (clock) is
    variable valid : std_logic;
    variable cycle : integer range 0 to 7;

    -- track which cycle (0-7) we are in of the 40MHz clock, relative to the
    -- datavalid flag in clock 0 allows us to do multiple (up to 8) operations
    -- per data valid
    --               _______                                         _______
    -- fifo_valid  __|     |_________________________________________|     |____
    --               ____  ____  ____  ____  ____  ____  ____  ____  ____  ____
    -- cycle       __|0 |__|1 |__|2 |__|3 |__|4 |__|5 |__|6 |__|7 |__|0 |__|  |

  begin
    if (rising_edge(clock)) then

      if (fifo_valid = '1') then
        cycle := 1;
      elsif (cycle = 7) then
        cycle := 0;
      else
        cycle := cycle + 1;
      end if;

      case frame_state is

        when FRAME0 =>

          ----------------------------------------
          -- frame_state
          ----------------------------------------

          if (fifo_valid = '1') then
            frame_state <= FRAME1;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          word_buf (5 downto 0) <= fifo(15 downto 10);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid    := '1';
            word_mux <= fifo(9 downto 0);
          end if;


        when FRAME1 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME2;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          word_buf(1 downto 0) <= fifo(15 downto 14);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid                := '1';
            word_mux(9 downto 6) <= fifo (3 downto 0);
            word_mux(5 downto 0) <= word_buf(5 downto 0);
          end if;
          if (cycle = 3) then
            valid    := '1';
            word_mux <= fifo(13 downto 4);
          end if;

        when FRAME2 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME3;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          word_buf(7 downto 0) <= fifo (15 downto 8);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid                := '1';
            word_mux(9 downto 2) <= fifo (7 downto 0);
            word_mux(1 downto 0) <= word_buf (1 downto 0);
          end if;

        when FRAME3 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME4;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------
          word_buf (3 downto 0) <= fifo (15 downto 12);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid                := '1';
            word_mux(9 downto 8) <= fifo (1 downto 0);
            word_mux(7 downto 0) <= word_buf(7 downto 0);
          end if;
          if (cycle = 3) then
            valid    := '1';
            word_mux <= fifo (11 downto 2);
          end if;

        when FRAME4 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME0;
          end if;

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid                := '1';
            word_mux(9 downto 4) <= fifo (5 downto 0);
            word_mux(3 downto 0) <= word_buf(3 downto 0);
          end if;
          if (cycle = 3) then
            valid    := '1';
            word_mux <= fifo (15 downto 6);
          end if;

      end case;

    end if;

    word_mux_valid <= valid;

  end process;

end behavioral;
