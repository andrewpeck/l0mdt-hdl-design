library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity encoder_framer is
  port(
    clock         : in  std_logic;
    data_i        : in  std_logic_vector (9 downto 0);          -- receive 16 bits / bx
    data_i_valid  : in  std_logic                      := '0';  -- input data valid flag
    frame_o       : out std_logic_vector (15 downto 0) := (others => '0');
    frame_o_valid : out std_logic                      := '0'
    );
end encoder_framer;

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
architecture behavioral of encoder_framer is

  function reverse_vector (a : in std_logic_vector)
    return std_logic_vector is
    variable result : std_logic_vector(a'range);
    alias aa        : std_logic_vector(a'reverse_range) is a;
  begin
    for i in aa'range loop
      result(i) := aa(i);
    end loop;
    return result;
  end;  -- function reverse_vector

  signal data : std_logic_vector (9 downto 0);

  -- frame parser signals
  type state_t is (WORD0, WORD1, WORD2, WORD3, WORD4, WORD5, WORD6, WORD7);
  signal state       : state_t := WORD1;
  signal buf         : std_logic_vector (15 downto 0);
  signal valid_i_dly : std_logic := '0';

begin

  data <= reverse_vector (data_i);

  process (clock) is
    variable valid : std_logic := '0';
  begin
    if (rising_edge(clock)) then

      valid_i_dly <= data_i_valid;

      case state is

        when WORD0 =>

          if (data_i_valid = '1') then
            state <= WORD1;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            buf (9 downto 0) <= data(9 downto 0);
          end if;

        when WORD1 =>

          if (data_i_valid = '1') then
            state <= WORD2;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            buf(13 downto 10) <= data(3 downto 0);
            valid           := '1';
            frame_o         <= buf(9 downto 0) & data (9 downto 4);  -- frame 0
          end if;

        when WORD2 =>

          if (data_i_valid = '1') then
            state <= WORD3;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            buf(9 downto 0) <= data (9 downto 0);
          end if;

        when WORD3 =>

          if (data_i_valid = '1') then
            state <= WORD4;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            valid            := '1';
            buf (7 downto 0) <= data (7 downto 0);
            frame_o          <= buf(13 downto 0) & data(9 downto 8);  -- frame 1
          end if;

        when WORD4 =>

          if (data_i_valid = '1') then
            state <= WORD5;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            valid              := '1';
            buf (11 downto 10) <= data (1 downto 0);
            frame_o            <= buf (7 downto 0) & data(9 downto 2);  -- frame 2
          end if;

        when WORD5 =>

          if (data_i_valid = '1') then
            state <= WORD6;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            buf (9 downto 0) <= data (9 downto 0);
          end if;

        when WORD6 =>

          if (data_i_valid = '1') then
            state <= WORD7;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            valid                 := '1';
            buf (5 downto 0)      <= data (5 downto 0);
            frame_o               <= buf(11 downto 2) & buf (1 downto 0) & data (9 downto 6);  -- frame 3
          end if;

        when WORD7 =>

          if (data_i_valid = '1') then
            state <= WORD0;
          end if;

          valid := '0';
          if (valid_i_dly = '1') then
            valid   := '1';
            frame_o <= buf (5 downto 0) & data (9 downto 0);  -- frame 4
          end if;

      end case;

    end if;

    frame_o_valid <= valid;

  end process;

end behavioral;
