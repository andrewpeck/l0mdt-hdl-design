library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

entity tx_test_pattern_generator is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD : integer := 4);
  port (
    tx_usrclk2 : in std_logic;
    packet_valid : out std_logic;
    packet_userdata : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
    packet_txctrl0 : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_txctrl1 : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_txctrl2 : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0)); -- isK
end tx_test_pattern_generator;

architecture RTL of tx_test_pattern_generator is
  -- range of BCID
  -- 0 to 3563 (0xDEB)
  constant MAX_BCID : std_logic_vector(11 downto 0) := x"DEB";
  
  signal counter_i : integer range NUMBER_OF_WORDS_IN_A_PACKET-1 downto 0 := 0;
  signal bcid_i : std_logic_vector(11 downto 0) := (others => '0');

  signal packet_valid_i : std_logic;
  signal packet_userdata_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0) := (others => '0');
  signal packet_txctrl0_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
  signal packet_txctrl1_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
  signal packet_txctrl2_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0'); -- isK
  
begin
  
  packet_valid <= packet_valid_i;
  packet_userdata <= packet_userdata_i;
  packet_txctrl0 <= packet_txctrl0_i;
  packet_txctrl1 <= packet_txctrl1_i;
  packet_txctrl2 <= packet_txctrl2_i;
  
  packet_userdata_i(packet_userdata_i'length-1 downto packet_userdata_i'length-NUMBER_OF_BYTES_IN_A_WORD*8) <= x"000000bc";
  packet_userdata_i(bcid_i'length-1 downto 0) <= bcid_i;
  packet_txctrl2_i(packet_txctrl2_i'length-1 downto packet_txctrl2_i'length-NUMBER_OF_BYTES_IN_A_WORD) <= x"1";

  -- packet_valid
  process (tx_usrclk2)
  begin
    if rising_edge(tx_usrclk2) then
      if counter_i=0 then
        packet_valid_i <= '1';
      else
        packet_valid_i <= '0';
      end if;
    end if;
  end process;  
  
  -- handling counter_i
  process (tx_usrclk2)
  begin
    if rising_edge(tx_usrclk2) then
      if counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 then
        counter_i<=0;
      else
        counter_i<=counter_i+1;
      end if;
    end if;
  end process;
  
  -- handling bcid_i
  process (tx_usrclk2)
  begin
    if rising_edge(tx_usrclk2) then
      if bcid_i=MAX_BCID then
        bcid_i <= (others => '0');        
      elsif counter_i=0 then
        bcid_i <= bcid_i + 1;
      end if;
    end if;
  end process;
  
end RTL;
