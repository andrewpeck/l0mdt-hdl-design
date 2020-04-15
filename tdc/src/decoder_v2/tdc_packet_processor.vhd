library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity tdc_packet_processor is
  port(
    clock : in std_logic;

    readout_mode   : in std_logic_vector (1 downto 0);
    debug_mode     : in std_logic;
    triggered_mode : in std_logic;

    tdc_word_state_err : out std_logic;

    k_char        : in  std_logic;
    word_8b       : in  std_logic_vector (7 downto 0);
    word_8b_valid : in  std_logic;
    tdc_word_o    : out std_logic_vector (31 downto 0);
    tdc_err_o     : out std_logic;
    valid_o       : out std_logic;
    read_done_i   : in  std_logic
    );
end tdc_packet_processor;

architecture behavioral of tdc_packet_processor is
  -- packet decoder signals
  type tdc_word_state_t is (ERR, SYNCING, READY, DATA0, DATA1, DATA2, DATA3);
  signal tdc_word_state : tdc_word_state_t := SYNCING;
  signal tdc_aligned    : std_logic;
  signal data_buf       : std_logic_vector (23 downto 0);
begin

  tdc_word_state_err <= '1' when (tdc_word_state = ERR) else '0';

  -- ro_mode = 00

  process (clock)
    constant TDC_START                      : std_logic_vector      := x"3C";
    constant TDC_ERR                        : std_logic_vector      := x"9C";
    -- require a few idle frames to "lock on" to the sequence... exact number
    -- not important but should at least a full cycle of 80 bits / 10 = 8 words
    variable sequential_header_count        : unsigned (3 downto 0) := (others => '0');
    constant sequential_header_count_thresh : unsigned (3 downto 0) := (others => '1');
  begin

    if (rising_edge(clock)) then

      if (read_done_i = '1') then
        valid_o <= '0';
      end if;

      if (word_8b_valid = '1') then

        case tdc_word_state is

          -- err state, wait for header k-char to be received
          when ERR =>

            sequential_header_count := (others => '0');
            tdc_aligned             <= '0';

            valid_o <= '0';

            if (word_8b = TDC_START and k_char = '1') then
              tdc_word_state <= SYNCING;
            end if;

          -- require some minimum number of idle characters before we start processing data
          when SYNCING =>

            if (word_8b = TDC_START and k_char = '1') then
              if (sequential_header_count < sequential_header_count_thresh) then
                sequential_header_count := sequential_header_count + 1;
              else
                tdc_aligned <= '1';
              end if;
            end if;

            if (tdc_aligned = '1') then
              tdc_word_state <= READY;
            end if;

          when READY =>

            -- start reading on 1st non-kchar
            if (k_char = '0') then
              tdc_word_state <= DATA0;
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
              tdc_word_state <= READY;
            elsif (word_8b = TDC_START and k_char = '1') then
              tdc_word_state <= READY;
            else
              tdc_word_state <= DATA0;
            end if;

            tdc_word_o (31 downto 24) <= word_8b;
            tdc_word_o (23 downto 0)  <= data_buf(23 downto 0);

            valid_o <= '1';

          when others =>
            tdc_word_state <= ERR;
        end case;

      end if;

    end if;
  end process;


end behavioral;
