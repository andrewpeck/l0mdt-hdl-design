library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity test_top is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD : integer := 4;
    NUMBER_OF_GTY_CHANNELS : integer := 4);
  port (
    SYSCLK_300_P : in std_logic;
    SYSCLK_300_N : in std_logic;
    
    CLK_125_P : in std_logic;
    CLK_125_N : in std_logic;    
    
    SFP_REC_CLOCK_P : out std_logic;
    SFP_REC_CLOCK_N : out std_logic;
    
    GPIO_LED_0 : out std_logic;
    GPIO_LED_1 : out std_logic;
    GPIO_LED_2 : out std_logic;
    GPIO_LED_3 : out std_logic;
    GPIO_LED_4 : out std_logic;
    GPIO_LED_5 : out std_logic;
    GPIO_LED_6 : out std_logic;
    GPIO_LED_7 : out std_logic;

    GPIO_SW_S : in std_logic;
    GPIO_SW_N : in std_logic;
    
    mgtrefclk0_x0y2_p : in std_logic;
    mgtrefclk0_x0y2_n : in std_logic;
    
    ch0_gtyrxn_in : in std_logic;
    ch0_gtyrxp_in : in std_logic;
    ch0_gtytxn_out : out std_logic;
    ch0_gtytxp_out : out std_logic;
    
    ch1_gtyrxn_in : in std_logic;
    ch1_gtyrxp_in : in std_logic;
    ch1_gtytxn_out : out std_logic;
    ch1_gtytxp_out : out std_logic;
    
    ch2_gtyrxn_in : in std_logic;
    ch2_gtyrxp_in : in std_logic;
    ch2_gtytxn_out : out std_logic;
    ch2_gtytxp_out : out std_logic;

    ch3_gtyrxn_in : in std_logic;
    ch3_gtyrxp_in : in std_logic;
    ch3_gtytxn_out : out std_logic;
    ch3_gtytxp_out : out std_logic);
end test_top;

architecture RTL of test_top is
  
  signal sysclk_160_i : std_logic;
  signal sysclk_160_buf_i : std_logic;
  signal sysclk_125_i : std_logic;
  signal output_led_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS*2-1 downto 0);
  signal transceiver_reset_i : std_logic;
  signal packet_former_reset_i : std_logic;
  
  type packet_userata_array is array (NUMBER_OF_GTY_CHANNELS-1 downto 0) of std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*8*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  type packet_ctrldata_array is array (NUMBER_OF_GTY_CHANNELS-1 downto 0) of std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  
  signal packet_userdata_rx_i : packet_userata_array;
  signal packet_rxctrl0_i : packet_ctrldata_array;
  signal packet_rxctrl1_i : packet_ctrldata_array;
  signal packet_rxctrl2_i : packet_ctrldata_array;
  signal packet_rxctrl3_i : packet_ctrldata_array;
  signal packet_locked_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal packet_valid_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0); -- asserted every 6-clock
  signal packet_error_detected_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  
  type data32_array is array (NUMBER_OF_GTY_CHANNELS-1 downto 0) of std_logic_vector(31 downto 0);
  type data16_array is array (NUMBER_OF_GTY_CHANNELS-1 downto 0) of std_logic_vector(15 downto 0);
  type data8_array is array (NUMBER_OF_GTY_CHANNELS-1 downto 0) of std_logic_vector(7 downto 0);
  type data4_array is array (NUMBER_OF_GTY_CHANNELS-1 downto 0) of std_logic_vector(3 downto 0);
  
  signal tx_usrclk2_i : std_logic;
  signal userdata_tx_i : data32_array := (others => (others => '0'));
  signal txctrl0_i : data16_array := (others => (others => '0')); 
  signal txctrl1_i : data16_array := (others => (others => '0')); 
  signal txctrl2_i : data8_array := (others => (others => '0'));
  
  signal gtpowergood_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal rxbyteisaligned_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal rxbyterealign_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal rxpmaresetdone_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal txpmaresetdone_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal txprgdivresetdone_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  
  signal rx_usrclk2_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal rxslide_i : std_logic_vector(NUMBER_OF_GTY_CHANNELS-1 downto 0);
  signal userdata_rx_i : data32_array;
  signal rxctrl0_i : data16_array;
  signal rxctrl1_i : data16_array;
  signal rxctrl2_i : data8_array;
  signal rxctrl3_i : data8_array;

  signal tied_to_ground_i : std_logic;
  signal tied_to_vcc_i : std_logic;
  
begin
  tied_to_ground_i <= '0';
  tied_to_vcc_i <= '1';
  
  GPIO_LED_0 <= output_led_i(0);
  GPIO_LED_1 <= output_led_i(1);
  GPIO_LED_2 <= output_led_i(2);
  GPIO_LED_3 <= output_led_i(3);
  GPIO_LED_4 <= output_led_i(4);
  GPIO_LED_5 <= output_led_i(5);
  GPIO_LED_6 <= output_led_i(6);
  GPIO_LED_7 <= output_led_i(7);

  transceiver_reset_i <= GPIO_SW_N;
  packet_former_reset_i <= GPIO_SW_S;
  
  clk_wiz_0_inst : entity work.clk_wiz_0 
    port map(clk_out1 => sysclk_160_i,
             reset => tied_to_ground_i,
             locked => open,
             clk_in1_p => SYSCLK_300_P,
             clk_in1_n => SYSCLK_300_N);
  
  oddr_inst : ODDRE1
    port map(Q  => sysclk_160_buf_i,
             C  => sysclk_160_i,
             D1 => tied_to_vcc_i,
             D2 => tied_to_ground_i,
             SR => tied_to_ground_i);

  obuf_inst : OBUFDS
    generic map(IOSTANDARD => "LVDS_25",
                SLEW => "SLOW")
    port map(O => SFP_REC_CLOCK_P,
             OB => SFP_REC_CLOCK_N,
             I => sysclk_160_buf_i);
  
  ibufds_inst : IBUFDS
    port map(O => sysclk_125_i,
             I => CLK_125_P,
             IB => CLK_125_N);  
  
  tx_patgen : for ii in 0 to NUMBER_OF_GTY_CHANNELS-1 generate
    signal tx_packet_valid_i : std_logic;
    signal packet_userdata_tx_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
    signal packet_txctrl0_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    signal packet_txctrl1_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    signal packet_txctrl2_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    
    signal txctrl0_4b_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    signal txctrl1_4b_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    signal txctrl2_4b_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);

  begin
    patgen_inst : entity work.tx_test_pattern_generator
      generic map (
        NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
        NUMBER_OF_BYTES_IN_A_WORD => NUMBER_OF_BYTES_IN_A_WORD)
      port map (
        tx_usrclk2 => tx_usrclk2_i,
        packet_valid => tx_packet_valid_i,
        packet_userdata => packet_userdata_tx_i,
        packet_txctrl0 => packet_txctrl0_i,
        packet_txctrl1 => packet_txctrl1_i,
        packet_txctrl2 => packet_txctrl2_i);
    
    packet_former_inst : entity work.sector_logic_tx_packet_former
      generic map (
        NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
        NUMBER_OF_BYTES_IN_A_WORD => NUMBER_OF_BYTES_IN_A_WORD)
      port map (
        tx_usrclk2 => tx_usrclk2_i,
        userdata_tx => userdata_tx_i(ii),
        txctrl0 => txctrl0_4b_i,
        txctrl1 => txctrl1_4b_i,
        txctrl2 => txctrl2_4b_i,
        packet_userdata => packet_userdata_tx_i,
        packet_txctrl0 => packet_txctrl0_i,
        packet_txctrl1 => packet_txctrl1_i,
        packet_txctrl2 => packet_txctrl2_i,
        packet_valid => tx_packet_valid_i);
    
    txctrl0_i(ii)(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) <= txctrl0_4b_i;
    txctrl1_i(ii)(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) <= txctrl1_4b_i;
    txctrl2_i(ii)(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) <= txctrl2_4b_i;
  end generate;     

  rx_gen : for ii in 0 to NUMBER_OF_GTY_CHANNELS-1 generate
    -- decoded signals
    signal dec_userdata_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);   
    signal dec_rxctrl0_4b_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
    signal dec_rxctrl1_4b_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
    signal dec_rxctrl2_4b_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
    signal dec_rxctrl3_4b_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) := (others => '0');
    signal comma_pulse_i : std_logic;
    signal commadet_locked_i : std_logic;
  begin
    -- constant value
    dec_rxctrl1_4b_i <= (others => '0');
    dec_rxctrl3_4b_i <= (others => '0');
    
    --
    comma_detector_i : entity work.rx_comma_detection
      generic map (
        NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
        NUMBER_OF_BYTES_IN_A_WORD => NUMBER_OF_BYTES_IN_A_WORD)
      port map (
        RESET => packet_former_reset_i,
        CLK_IN => rx_usrclk2_i(ii),
        RX_DATA_IN => userdata_rx_i(ii),
        RX_CTRL0_IN => rxctrl0_i(ii)(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0),
        RX_CTRL1_IN => rxctrl1_i(ii)(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0),
        DECODED_DATA_OUT => dec_userdata_i,
        DECODED_CHARISK_OUT => dec_rxctrl0_4b_i,
        DECODED_ISCOMMA_OUT => dec_rxctrl2_4b_i,
        COMMA_PULSE_OUT => comma_pulse_i,
        LOCK_OUT => commadet_locked_i,
        RXSLIDE_OUT => rxslide_i(ii)
        );    
    
    -- packet former
    packet_former_inst : entity work.sector_logic_rx_packet_former
      generic map(
        NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
        NUMBER_OF_BYTES_IN_A_WORD => NUMBER_OF_BYTES_IN_A_WORD)
      port map(
        reset => packet_former_reset_i,
        rx_usrclk2 => rx_usrclk2_i(ii),
        userdata_rx => dec_userdata_i,
        rxctrl0 => dec_rxctrl0_4b_i,
        rxctrl1 => dec_rxctrl1_4b_i,
        rxctrl2 => dec_rxctrl2_4b_i,
        rxctrl3 => dec_rxctrl3_4b_i,
        packet_userdata => packet_userdata_rx_i(ii),
        packet_rxctrl0 => packet_rxctrl0_i(ii),
        packet_rxctrl1 => packet_rxctrl1_i(ii),
        packet_rxctrl2 => packet_rxctrl2_i(ii),
        packet_rxctrl3 => packet_rxctrl3_i(ii),
        packet_locked => packet_locked_i(ii),
        packet_valid => packet_valid_i(ii),
        packet_error_detected => packet_error_detected_i(ii));
    
    output_led_i(2*ii) <= and_reduce(packet_userdata_rx_i(ii));
    output_led_i(2*ii+1) <= and_reduce(packet_rxctrl0_i(ii)&packet_rxctrl1_i(ii)&packet_rxctrl2_i(ii)&packet_rxctrl3_i(ii));
    
  end generate;

  gty_inst : entity work.gty_fixed_latency_example_top 
    port map (
      mgtrefclk0_x0y2_p => mgtrefclk0_x0y2_p,
      mgtrefclk0_x0y2_n => mgtrefclk0_x0y2_n,

      -- ch0
      ch0_gtyrxn_in => ch0_gtyrxn_in,
      ch0_gtyrxp_in => ch0_gtyrxp_in,
      ch0_gtytxn_out => ch0_gtytxn_out,
      ch0_gtytxp_out => ch0_gtytxp_out,
      
      -- ch1
      ch1_gtyrxn_in => ch1_gtyrxn_in,
      ch1_gtyrxp_in => ch1_gtyrxp_in,
      ch1_gtytxn_out => ch1_gtytxn_out,
      ch1_gtytxp_out => ch1_gtytxp_out,
      
      -- ch2
      ch2_gtyrxn_in => ch2_gtyrxn_in,
      ch2_gtyrxp_in => ch2_gtyrxp_in,
      ch2_gtytxn_out => ch2_gtytxn_out,
      ch2_gtytxp_out => ch2_gtytxp_out,
      
      -- ch3
      ch3_gtyrxn_in => ch3_gtyrxn_in,
      ch3_gtyrxp_in => ch3_gtyrxp_in,
      ch3_gtytxn_out => ch3_gtytxn_out,
      ch3_gtytxp_out => ch3_gtytxp_out,
      
      -- userclk
      tx_usrclk2_out => tx_usrclk2_i,

      hb0_gtwiz_userclk_rx_usrclk2_out => rx_usrclk2_i(0),
      hb1_gtwiz_userclk_rx_usrclk2_out => rx_usrclk2_i(1),
      hb2_gtwiz_userclk_rx_usrclk2_out => rx_usrclk2_i(2),
      hb3_gtwiz_userclk_rx_usrclk2_out => rx_usrclk2_i(3),

      -- rxslide
      ch0_rxslide_in => rxslide_i(0),
      ch1_rxslide_in => rxslide_i(1),
      ch2_rxslide_in => rxslide_i(2),
      ch3_rxslide_in => rxslide_i(3),
      
      -- userdata_tx
      hb0_gtwiz_userdata_tx_in => userdata_tx_i(0),
      hb1_gtwiz_userdata_tx_in => userdata_tx_i(1),
      hb2_gtwiz_userdata_tx_in => userdata_tx_i(2),
      hb3_gtwiz_userdata_tx_in => userdata_tx_i(3),
      
      -- userdata_rx
      hb0_gtwiz_userdata_rx_out => userdata_rx_i(0),
      hb1_gtwiz_userdata_rx_out => userdata_rx_i(1),
      hb2_gtwiz_userdata_rx_out => userdata_rx_i(2),
      hb3_gtwiz_userdata_rx_out => userdata_rx_i(3),
      
      -- txctrl0
      ch0_txctrl0_in => txctrl0_i(0),
      ch1_txctrl0_in => txctrl0_i(1),
      ch2_txctrl0_in => txctrl0_i(2),
      ch3_txctrl0_in => txctrl0_i(3),
      
      -- txctrl1
      ch0_txctrl1_in => txctrl1_i(0),
      ch1_txctrl1_in => txctrl1_i(1),
      ch2_txctrl1_in => txctrl1_i(2),
      ch3_txctrl1_in => txctrl1_i(3),

      -- txctrl2
      ch0_txctrl2_in => txctrl2_i(0),
      ch1_txctrl2_in => txctrl2_i(1),
      ch2_txctrl2_in => txctrl2_i(2),
      ch3_txctrl2_in => txctrl2_i(3),
      
      -- gtpowergood
      ch0_gtpowergood_out => gtpowergood_i(0),
      ch1_gtpowergood_out => gtpowergood_i(1),
      ch2_gtpowergood_out => gtpowergood_i(2),
      ch3_gtpowergood_out => gtpowergood_i(3),
      
      -- rxbyteisaligned
      ch0_rxbyteisaligned_out => rxbyteisaligned_i(0),
      ch1_rxbyteisaligned_out => rxbyteisaligned_i(1),
      ch2_rxbyteisaligned_out => rxbyteisaligned_i(2),
      ch3_rxbyteisaligned_out => rxbyteisaligned_i(3),

      -- rxbyterealign
      ch0_rxbyterealign_out => rxbyterealign_i(0),
      ch1_rxbyterealign_out => rxbyterealign_i(1),
      ch2_rxbyterealign_out => rxbyterealign_i(2),
      ch3_rxbyterealign_out => rxbyterealign_i(3),

      -- rxctrl0
      ch0_rxctrl0_out => rxctrl0_i(0),
      ch1_rxctrl0_out => rxctrl0_i(1),
      ch2_rxctrl0_out => rxctrl0_i(2),
      ch3_rxctrl0_out => rxctrl0_i(3),
      
      -- rxctrl1
      ch0_rxctrl1_out => rxctrl1_i(0),
      ch1_rxctrl1_out => rxctrl1_i(1),
      ch2_rxctrl1_out => rxctrl1_i(2),
      ch3_rxctrl1_out => rxctrl1_i(3),

      -- rxctrl2
      ch0_rxctrl2_out => rxctrl2_i(0),
      ch1_rxctrl2_out => rxctrl2_i(1),
      ch2_rxctrl2_out => rxctrl2_i(2),
      ch3_rxctrl2_out => rxctrl2_i(3),
      
      -- rxctrl3
      ch0_rxctrl3_out => rxctrl3_i(0),
      ch1_rxctrl3_out => rxctrl3_i(1),
      ch2_rxctrl3_out => rxctrl3_i(2),
      ch3_rxctrl3_out => rxctrl3_i(3),

      -- rxpmaresetdone
      ch0_rxpmaresetdone_out => rxpmaresetdone_i(0),
      ch1_rxpmaresetdone_out => rxpmaresetdone_i(1),
      ch2_rxpmaresetdone_out => rxpmaresetdone_i(2),
      ch3_rxpmaresetdone_out => rxpmaresetdone_i(3),
      
      -- txpmaresetdone
      ch0_txpmaresetdone_out => txpmaresetdone_i(0),
      ch1_txpmaresetdone_out => txpmaresetdone_i(1),
      ch2_txpmaresetdone_out => txpmaresetdone_i(2),
      ch3_txpmaresetdone_out => txpmaresetdone_i(3),
      
      -- txprgdivresetdone
      ch0_txprgdivresetdone_out => txprgdivresetdone_i(0),
      ch1_txprgdivresetdone_out => txprgdivresetdone_i(1),
      ch2_txprgdivresetdone_out => txprgdivresetdone_i(2),
      ch3_txprgdivresetdone_out => txprgdivresetdone_i(3),
      
      -- User-provided ports for reset helper block(s)
      hb_gtwiz_reset_clk_freerun_in => sysclk_125_i,
      hb_gtwiz_reset_all_in => transceiver_reset_i);
  
  
end RTL;
