library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity sector_logic_rx_packet_former is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD : integer := 4);
  port (
    reset : in std_logic;
    rx_usrclk2 : in std_logic;
    userdata_rx : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
    rxctrl0 : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- isK
    rxctrl1 : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- is error
    rxctrl2 : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- is comma
    rxctrl3 : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0); -- invalid 8b10b
    packet_userdata : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*8*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_rxctrl0 : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_rxctrl1 : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_rxctrl2 : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_rxctrl3 : out std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    packet_locked : out std_logic;
    packet_valid : out std_logic; -- asserted every 6-clock
    packet_error_detected : out std_logic);
end sector_logic_rx_packet_former;

architecture RTL of sector_logic_rx_packet_former is
  signal word_counter_i : integer range NUMBER_OF_WORDS_IN_A_PACKET-1 downto 0 := 0;
  signal packet_counter_i : std_logic_vector(9 downto 0) := (others => '0');
  signal packet_error_detected_i : std_logic;
  signal packet_valid_i : std_logic;
  
begin
  packet_locked <= packet_counter_i(packet_counter_i'length-1);
  packet_error_detected <= packet_error_detected_i;
  packet_valid <= packet_valid_i;
  
  -- handle output data
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      packet_userdata((word_counter_i+1)*userdata_rx'length-1 downto word_counter_i*userdata_rx'length) <=  userdata_rx;
      packet_rxctrl0((word_counter_i+1)*rxctrl0'length-1 downto word_counter_i*rxctrl0'length) <= rxctrl0;
      packet_rxctrl1((word_counter_i+1)*rxctrl1'length-1 downto word_counter_i*rxctrl1'length) <= rxctrl1;
      packet_rxctrl2((word_counter_i+1)*rxctrl2'length-1 downto word_counter_i*rxctrl2'length) <= rxctrl2;
      packet_rxctrl3((word_counter_i+1)*rxctrl3'length-1 downto word_counter_i*rxctrl3'length) <= rxctrl3;
    end if;
  end process;

  -- handle word_counter_i
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      if rxctrl2(0)='1' then
        word_counter_i <= 0;
      elsif word_counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 then
        word_counter_i <= 0;
      else
        word_counter_i <= word_counter_i+1;
      end if;
    end if;
  end process;      
  
  -- handle packet_valid_i
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      if rxctrl2(0)='1' then
        packet_valid_i <= '1';
      else
        packet_valid_i <= '0';
      end if;
    end if;
  end process;  
  
  -- handle packet_counter_i
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      if reset='1' then
        packet_counter_i <= (others => '0');
      elsif rxctrl2(0)='1' then
        if word_counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 then
          if packet_counter_i(packet_counter_i'length-1)='0' then
            packet_counter_i <= packet_counter_i+1;
          end if;
        else
          packet_counter_i <= (others => '0');
        end if;
      end if;
    end if;
  end process;
  
  -- handle packet_error_detected_i
  process (rx_usrclk2)
  begin
    if rising_edge(rx_usrclk2) then
      if reset='1' then
        packet_error_detected_i <= '0';
      elsif rxctrl2(0)='1' then
        if word_counter_i/=NUMBER_OF_WORDS_IN_A_PACKET-1 then
          if packet_counter_i(packet_counter_i'length-1)='1' then
            packet_error_detected_i <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;  
  
end RTL;
