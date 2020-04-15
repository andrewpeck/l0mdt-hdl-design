library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity elink_framer is
  port(
    clock        : in  std_logic;
    data_i       : in  std_logic_vector (15 downto 0);  -- receive 16 bits / bx
    data_i_valid : in  std_logic;                       -- input data valid flag
    data_o       : out std_logic_vector (9 downto 0);
    data_o_valid : out std_logic
    );
end elink_framer;

  --------------------------------------------------------------------------------------------------
  -- Frame aligner logic, extract 10 bit words from 16 bits/clock
  --------------------------------------------------------------------------------------------------
  -- Least common multiple of 16 and 10 is 80
  -- so, because of the weird 10 bit alignment and 16 bits / bx received, there are 80/16 = 5 different mapping of 16
  -- ==> 10 bits, and some of the bits have to be buffered from one clock cycle to the next
  --
  -- bits[79:0]     01234567890123456789012345678901234567890123456789012345678901234567890123456789
  --
  -- 40MHz frames   < frame0 15:0  >< frame1 31:16 >< frame2 47:32 >< frame3 63:48 >< frame4 79:64 >
  --                0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
  --
  -- 10 bit words   < word0  >< word1  >< word2  >< word3  >< word4  >< word5  >< word6  >< word7  >
  --                01234567890123456789012345678901234567890123456789012345678901234567890123456789
  -- tdc_word       < header >< data0  >< data1  >< data2  >< data3  ><idle/err>< idle   >< idle   >
  --
  -- because of this arrangement we also can extract varying numbers of data words per clock:
  --   > frame0 gives us 1 word
  --   > frame1 gives us 2 words
  --   > frame2 gives us 1 word
  --   > frame3 gives us 2 words
  --   > frame4 gives us 2 words
  --   -------------------------
  --   > total = 8 ten-bit words over 5 40MHz clocks


-- Usage: LUT=41, FF=25
architecture behavioral of elink_framer is

  -- frame parser signals
  type frame_state_t is (FRAME0, FRAME1, FRAME2, FRAME3, FRAME4);
  signal frame_state : frame_state_t;
  signal buf         : std_logic_vector (9 downto 0);

begin

  process (clock) is
    variable valid : std_logic;
    variable cycle : integer range 0 to 7;

    -- track which cycle (0-7) we are in of the 40MHz clock, relative to the
    -- datavalid flag in clock 0 allows us to do multiple (up to 8) operations
    -- per data valid
    --                 _______                                         _______
    -- data_i_valid  __|     |_________________________________________|     |____
    --                 ____  ____  ____  ____  ____  ____  ____  ____  ____  ____
    -- cycle         __|0 |__|1 |__|2 |__|3 |__|4 |__|5 |__|6 |__|7 |__|0 |__|  |

  begin
    if (rising_edge(clock)) then

      if (data_i_valid = '1') then
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

          if (data_i_valid = '1') then
            frame_state <= FRAME1;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          buf (5 downto 0) <= data_i(15 downto 10);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid  := '1';
            data_o <= data_i(9 downto 0);
          end if;


        when FRAME1 =>

          if (data_i_valid = '1') then
            frame_state <= FRAME2;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          buf(1 downto 0) <= data_i(15 downto 14);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid              := '1';
            data_o(9 downto 6) <= data_i (3 downto 0);
            data_o(5 downto 0) <= buf(5 downto 0);
          end if;
          if (cycle = 3) then
            valid  := '1';
            data_o <= data_i(13 downto 4);
          end if;

        when FRAME2 =>

          if (data_i_valid = '1') then
            frame_state <= FRAME3;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          buf(7 downto 0) <= data_i (15 downto 8);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid              := '1';
            data_o(9 downto 2) <= data_i (7 downto 0);
            data_o(1 downto 0) <= buf (1 downto 0);
          end if;

        when FRAME3 =>

          if (data_i_valid = '1') then
            frame_state <= FRAME4;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------
          buf (3 downto 0) <= data_i (15 downto 12);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid              := '1';
            data_o(9 downto 8) <= data_i (1 downto 0);
            data_o(7 downto 0) <= buf(7 downto 0);
          end if;
          if (cycle = 4) then
            valid  := '1';
            data_o <= data_i (11 downto 2);
          end if;

        when FRAME4 =>

          if (data_i_valid = '1') then
            frame_state <= FRAME0;
          end if;

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid              := '1';
            data_o(9 downto 4) <= data_i (5 downto 0);
            data_o(3 downto 0) <= buf (3 downto 0);
          end if;
          if (cycle = 4) then
            valid  := '1';
            data_o <= data_i (15 downto 6);
          end if;

      end case;

    end if;

    data_o_valid <= valid;

  end process;

end behavioral;
