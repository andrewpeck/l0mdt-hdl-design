library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity frame_decoder is
  port(
    reset              : in  std_logic;
    clock              : in  std_logic;
    tdc_word_state_err : out std_logic;
    k_char             : in  std_logic;
    word_8b            : in  std_logic_vector (7 downto 0);
    word_8b_valid      : in  std_logic;
    tdc_word_o         : out std_logic_vector (31 downto 0);
    tdc_err_o          : out std_logic;
    valid_o            : out std_logic;
    read_done_i        : in  std_logic
    );
end frame_decoder;

architecture behavioral of frame_decoder is
  -- packet decoder signals
  type tdc_word_state_t is (ERR, HEADER, DATA0, DATA1, DATA2, DATA3);
  signal tdc_word_state : tdc_word_state_t;
  signal tdc_aligned    : std_logic;
  signal data_buf       : std_logic_vector (23 downto 0);
begin


  tdc_word_state_err <= '1' when (tdc_word_state = ERR) else '0';

  process (clock)
    constant TDC_START                      : std_logic_vector      := x"3C";
    constant TDC_ERR                        : std_logic_vector      := x"9C";
    -- require a few idle frames to "lock on" to the sequence...
    -- exact number not important but should be greater than 10 I guess
    variable sequential_header_count        : integer range 0 to 15 := 0;
    constant sequential_header_count_thresh : integer               := 15;
  begin

    if (rising_edge(clock)) then

      if (read_done_i = '1') then
        valid_o <= '0';
      end if;

      if (word_8b_valid = '1') then
        if (reset = '1') then

          tdc_word_state <= HEADER;

        else

          case tdc_word_state is

            when ERR =>

              sequential_header_count := 0;
              tdc_aligned             <= '0';

              valid_o <= '0';

              if (word_8b = TDC_START and k_char = '1') then
                tdc_word_state <= HEADER;
              end if;

            when HEADER =>

              if (word_8b = TDC_START and k_char = '1') then
                if (sequential_header_count < sequential_header_count_thresh) then
                  sequential_header_count := sequential_header_count + 1;
                else
                  tdc_aligned <= '1';
                end if;
              elsif (tdc_aligned = '1' and k_char = '0') then
                tdc_word_state <= DATA0;
              else
                tdc_word_state <= ERR;
              end if;

            when DATA0 =>

              if (k_char = '1') then
                tdc_word_state <= ERR;
              else
                tdc_word_state <= DATA1;
              end if;

              data_buf(7 downto 0) <= word_8b;

            when DATA1 =>

              if (k_char = '1') then
                tdc_word_state <= ERR;
              else
                tdc_word_state <= DATA2;
              end if;

              data_buf(15 downto 8) <= word_8b;

            when DATA2 =>

              if (k_char = '1') then
                tdc_word_state <= ERR;
              else
                tdc_word_state <= DATA3;
              end if;

              data_buf(23 downto 16) <= word_8b;

            when DATA3 =>

              if (k_char = '1' and word_8b = TDC_ERR) then  -- 28.4 = tdc_err
                tdc_err_o      <= '1';
                tdc_word_state <= HEADER;
              elsif (word_8b = TDC_START and k_char = '1') then
                tdc_word_state <= HEADER;
              else
                tdc_word_state <= DATA0;
              end if;

              tdc_word_o (31 downto 24) <= word_8b;
              tdc_word_o (23 downto 0)  <= data_buf(23 downto 0);

              valid_o <= '1';

              --when others =>
          end case;

        end if;
      end if;

    end if;
  end process;


end behavioral;
