library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity sector_logic_tx_packet_former is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD : integer := 4);
  port (
    tx_usrclk2 : in std_logic;
    userdata_tx : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
    txctrl0 : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); 
    txctrl1 : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); 
    txctrl2 : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- isK
    packet_userdata : in std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*8*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_txctrl0 : in std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_txctrl1 : in std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_txctrl2 : in std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_valid : in std_logic); -- asserted every 6-clock
end sector_logic_tx_packet_former;

architecture RTL of sector_logic_tx_packet_former is
  signal word_counter_i : integer range NUMBER_OF_WORDS_IN_A_PACKET downto 0 := 0;

  signal packet_userdata_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*8*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  signal packet_txctrl0_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  signal packet_txctrl1_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  signal packet_txctrl2_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);  
begin
  
  -- handle output data
  process (tx_usrclk2)
  begin
    if rising_edge(tx_usrclk2) then
      packet_userdata_i <= packet_userdata;
      packet_txctrl0_i <= packet_txctrl0;
      packet_txctrl1_i <= packet_txctrl1;
      packet_txctrl2_i <= packet_txctrl2;
      
      userdata_tx <= packet_userdata_i((word_counter_i+1)*userdata_tx'length-1 downto word_counter_i*userdata_tx'length);
      txctrl0 <= packet_txctrl0_i((word_counter_i+1)*txctrl0'length-1 downto word_counter_i*txctrl0'length);
      txctrl1 <= packet_txctrl1_i((word_counter_i+1)*txctrl1'length-1 downto word_counter_i*txctrl1'length);
      txctrl2 <= packet_txctrl2_i((word_counter_i+1)*txctrl2'length-1 downto word_counter_i*txctrl2'length);
    end if;
  end process;
  
  -- word_counter_i
  process (tx_usrclk2)
  begin
    if rising_edge(tx_usrclk2) then
      if (packet_valid='1') then
        word_counter_i <= 0;
      elsif word_counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 then
        word_counter_i <= 0;
      else
        word_counter_i <= word_counter_i+1;
      end if;
    end if;
  end process;
  
end RTL;
