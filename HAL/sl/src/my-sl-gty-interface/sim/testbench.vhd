library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
library std;                  -- for Printing
use std.textio.all;

entity testbench is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD : integer := 4;
    NUMBER_OF_GTY_CHANNELS : integer := 4);
end testbench;

architecture RTL of testbench is

  constant SYSCLK_300_PERIOD : time := 3.3333 ns;
  constant SYSCLK_125_PERIOD : time := 8 ns;
  
  signal refclkp_i : std_logic;
  signal refclkn_i : std_logic;
  signal sysclk_300_p_i : std_logic;
  signal sysclk_300_n_i : std_logic;
  signal sysclk_125_p_i : std_logic;
  signal sysclk_125_n_i : std_logic;

  signal ch0n_i : std_logic;
  signal ch0p_i : std_logic;
  signal ch1n_i : std_logic;
  signal ch1p_i : std_logic;
  signal ch2n_i : std_logic;
  signal ch2p_i : std_logic;
  signal ch3n_i : std_logic;
  signal ch3p_i : std_logic;

  signal packet_former_reset_i : std_logic;
  signal transceiver_reset_i : std_logic;
  
begin

  top_inst : entity work.test_top
    generic map (
      NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
      NUMBER_OF_BYTES_IN_A_WORD => NUMBER_OF_BYTES_IN_A_WORD)
    port map (
      SYSCLK_300_P => sysclk_300_p_i,
      SYSCLK_300_N => sysclk_300_n_i,
    
      CLK_125_P => sysclk_125_p_i,
      CLK_125_N => sysclk_125_n_i,
    
      SFP_REC_CLOCK_P => refclkp_i,
      SFP_REC_CLOCK_N => refclkn_i,
    
      GPIO_LED_0 => open,
      GPIO_LED_1 => open,
      GPIO_LED_2 => open,
      GPIO_LED_3 => open,
      GPIO_LED_4 => open,
      GPIO_LED_5 => open,
      GPIO_LED_6 => open,
      GPIO_LED_7 => open,
      
      GPIO_SW_S => packet_former_reset_i,
      GPIO_SW_N => transceiver_reset_i,
    
      mgtrefclk0_x0y2_p => refclkp_i,
      mgtrefclk0_x0y2_n => refclkn_i,
      
      -- ch0
      ch0_gtyrxn_in => ch0n_i,
      ch0_gtyrxp_in => ch0p_i,
      ch0_gtytxn_out => ch0n_i,
      ch0_gtytxp_out => ch0p_i,
      
      -- ch1
      ch1_gtyrxn_in => ch1n_i,
      ch1_gtyrxp_in => ch1p_i,
      ch1_gtytxn_out => ch1n_i,
      ch1_gtytxp_out => ch1p_i,
      
      -- ch2
      ch2_gtyrxn_in => ch2n_i,
      ch2_gtyrxp_in => ch2p_i,
      ch2_gtytxn_out => ch2n_i,
      ch2_gtytxp_out => ch2p_i,
      
      -- ch3
      ch3_gtyrxn_in => ch3n_i,
      ch3_gtyrxp_in => ch3p_i,
      ch3_gtytxn_out => ch3n_i,
      ch3_gtytxp_out => ch3p_i);
  
  -- sysclk 300
  sysclk_300_n_i <= (not sysclk_300_p_i);
  process
  begin  
    sysclk_300_p_i <= '0';
    wait for SYSCLK_300_PERIOD/2;
    sysclk_300_p_i <= '1';
    wait for SYSCLK_300_PERIOD/2;
  end process;

  -- sysclk 125
  sysclk_125_n_i <= (not sysclk_125_p_i);
  process
  begin  
    sysclk_125_p_i <= '0';
    wait for SYSCLK_125_PERIOD/2;
    sysclk_125_p_i <= '1';
    wait for SYSCLK_125_PERIOD/2;
  end process;

  -- reset time-line
  process
  begin
    transceiver_reset_i <= '0';
    packet_former_reset_i <= '0';
    wait for 1 us;
    transceiver_reset_i <= '1';
    packet_former_reset_i <= '1';
    wait for 5 us;
    transceiver_reset_i <= '0';
    
    wait for 10 us; -- wait until and_reduce(rxpmaresetdone_i)='1';
    packet_former_reset_i <= '0';
    
    wait;
  end process;    
  
end RTL;
