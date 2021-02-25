library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

entity rx_test_pattern_generator is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD : integer := 4);
  port (
    rx_usrclk2 : in std_logic;
    userdata_rx : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
    rxctrl0 : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- isK
    rxctrl1 : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- is error
    rxctrl2 : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- is comma
    rxctrl3 : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0)); -- invalid 8b10b
end rx_test_pattern_generator;

architecture RTL of rx_test_pattern_generator is
  
  -- range of BCID
  -- 0 to 3563 (0xDEB)
  constant MAX_BCID : std_logic_vector(11 downto 0) := x"DEB";
  
  signal word_counter_i : integer range NUMBER_OF_WORDS_IN_A_PACKET-1 downto 0 := 0;
  signal bcid_i : std_logic_vector(11 downto 0) := (others => '0');
  signal userdata_rx_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0) := (others => '0');
  signal rxctrl0_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
  signal rxctrl1_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
  signal rxctrl2_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
  signal rxctrl3_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
  
begin
  
  userdata_rx <= userdata_rx_i;
  rxctrl0 <= rxctrl0_i;
  rxctrl1 <= rxctrl1_i;
  rxctrl2 <= rxctrl2_i;
  rxctrl3 <= rxctrl3_i;
  
  rxctrl1_i <= x"0"; -- is error
  rxctrl3_i <= x"0"; -- is invalid 8b10b
  
  -- output words
  -- https://cds.cern.ch/record/2703707/files/ATL-COM-DAQ-2019-207.pdf
  -- crc is not implemented
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      if word_counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 then
        userdata_rx_i <= x"000000bc";
        rxctrl0_i <= x"1";
        rxctrl2_i <= x"1";
      elsif word_counter_i=0 then
        userdata_rx_i <= x"00000"&bcid_i;
        rxctrl0_i <= x"0";
        rxctrl2_i <= x"0";
      else
        userdata_rx_i <= x"00000000";
        rxctrl0_i <= x"0";
        rxctrl2_i <= x"0";
      end if;
    end if;
  end process;
  
  -- word counter handler
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      if word_counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 then
        word_counter_i <= 0;
      else
        word_counter_i <= word_counter_i+1;
      end if;
    end if;
  end process;
  
  -- bcid handler
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      if bcid_i=MAX_BCID then
        bcid_i <= (others => '0');
      elsif word_counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 then
        bcid_i <= bcid_i+1;
      end if;
    end if;
  end process;
  
end RTL;
