library ieee;
use ieee.std_logic_1164.all;

library sl;

library work;
use work.system_types_pkg.all;
use work.sector_logic_pkg.all;
use work.constants_pkg.all;
use work.board_pkg.all;

entity sector_logic_link_wrapper is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD   : integer := 4
    );
  port(

    clock : in std_logic;

    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- 32 bits / bx from mgt
    sl_rx_mgt_word_array_i : in std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    sl_rx_data_o : out sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    -- 32 bits / bx to mgt
    sl_tx_mgt_word_array_o : out std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    sl_tx_data_i : in sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- from mgt
    sl_rx_ctrl_i : in sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- to mgt
    sl_tx_ctrl_o : out sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    sl_rx_slide_o : out std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0)

    );
end sector_logic_link_wrapper;


architecture Behavioral of sector_logic_link_wrapper is

  signal sl_rx_data_pre_cdc  : sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_data_post_cdc : sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

  attribute DONT_TOUCH                  : string;
  signal rx_reset_tree                  : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0) := (others => '1');
  attribute DONT_TOUCH of rx_reset_tree : signal is "true";
  --signal tx_reset_tree : std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0) := (others => '1');
  --attribute DONT_TOUCH of tx_reset_tree : signal is "true";

begin

  rx_reset_fanout : process (clock) is
  begin  -- process reset_fanout
    if rising_edge(clock) then          -- rising clock edge
      rx_reset_tree <= (others => reset);
    end if;
  end process;

  sl_gen : for I in 0 to c_NUM_MGTS-1 generate

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    tx_gen : if (sl_idx_array(I) /= -1) generate
      constant idx : integer := sl_idx_array(I);
    begin

      sector_logic_tx_packet_former_inst : entity sl.sector_logic_tx_packet_former
        generic map (
          NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
          NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
        port map (
          tx_usrclk2      => clock,
          userdata_tx     => sl_tx_mgt_word_array_o(idx),
          txctrl0         => sl_tx_ctrl_o(idx).ctrl0,      -- 4 bit to mgt
          txctrl1         => sl_tx_ctrl_o(idx).ctrl1,      -- 4 bit to mgt
          txctrl2         => sl_tx_ctrl_o(idx).ctrl2,      -- 4 bit to mgt
          packet_userdata => sl_tx_data_post_cdc(idx).data,
          packet_valid    => sl_tx_data_post_cdc(idx).valid,
          packet_txctrl0  => std_logic_vector'(x"000000"),
          packet_txctrl1  => std_logic_vector'(x"000000"),
          packet_txctrl2  => std_logic_vector'(x"100000")  -- FIXME this is made up, need to check the txctrl logic
          );

      sync_sl_tx : entity work.sync_cdc
        generic map (
          WIDTH    => sl_tx_data_post_cdc(idx).data'length,
          N_STAGES => 1)
        port map (
          clk_i   => clock,
          valid_i => sl_tx_data_i(idx).valid,
          data_i  => sl_tx_data_i(idx).data,
          valid_o => sl_tx_data_post_cdc(idx).valid,
          data_o  => sl_tx_data_post_cdc(idx).data
          );

    end generate;

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    rx_gen : if (sl_idx_array(I) /= -1) generate
      constant idx           : integer := sl_idx_array(I);
      signal dec_rxctrl0     : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      signal dec_rxctrl2     : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      signal dec_userdata    : std_logic_vector(31 downto 0);
      signal sl_pre_cdc_vec  : std_logic_vector (sl_rx_data_pre_cdc(idx).data'length + 1 downto 0);
      signal sl_post_cdc_vec : std_logic_vector (sl_rx_data_pre_cdc(idx).data'length + 1 downto 0);
    begin

      -- decode 8b10b words
      rx_comma_detector_inst : entity sl.rx_comma_detection
        generic map (
          NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
          NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
        port map (
          reset               => rx_reset_tree(idx),
          clk_in              => clock,
          rx_data_in          => sl_rx_mgt_word_array_i(idx),  -- 32 bit from mgt
          rx_ctrl0_in         => sl_rx_ctrl_i(idx).ctrl0,      -- 4 bit from mgt
          rx_ctrl1_in         => sl_rx_ctrl_i(idx).ctrl1,      -- 4 bit from mgt
          decoded_data_out    => dec_userdata,                 -- 32 bit to packet former
          decoded_charisk_out => dec_rxctrl0,                  -- 4 bit to packet former
          decoded_iscomma_out => dec_rxctrl2,                  -- 4 bit to packet former
          comma_pulse_out     => open,                         --
          lock_out            => open,                         --
          rxslide_out         => sl_rx_slide_o(idx)            -- 1 bit to mgt
          );

      -- form 192 bit packets
      sector_logic_rx_packet_former_inst : entity sl.sector_logic_rx_packet_former

        generic map (
          NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
          NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
        port map (
          reset => rx_reset_tree (idx),

          rx_usrclk2 => clock,

          userdata_rx => dec_userdata,

          -- 3 downto 0, from rx_comma_detection
          rxctrl0 => dec_rxctrl0,       -- charisk
          rxctrl1 => (others => '0'),
          rxctrl2 => dec_rxctrl2,       -- rxctrl2(0) == is_comma
          rxctrl3 => (others => '0'),

          -- 23 downto 0
          packet_rxctrl0 => open,       -- just connects to led sump
          packet_rxctrl1 => open,
          packet_rxctrl2 => open,
          packet_rxctrl3 => open,

          packet_userdata       => sl_rx_data_pre_cdc(idx).data,
          packet_locked         => sl_rx_data_pre_cdc(idx).locked,
          packet_valid          => sl_rx_data_pre_cdc(idx).valid,
          packet_error_detected => sl_rx_data_pre_cdc(idx).err

          );

      --sync to pipeline clock-------------------------------------------------
      sl_pre_cdc_vec               <= sl_rx_data_pre_cdc(idx).data & sl_rx_data_o(idx).err & sl_rx_data_o(idx).locked;
      sl_rx_data_pre_cdc(idx).data <= sl_post_cdc_vec(sl_rx_data_pre_cdc(idx).data'length+2-1 downto 2);
      sl_rx_data_o(idx).err        <= sl_post_cdc_vec(1);
      sl_rx_data_o(idx).locked     <= sl_post_cdc_vec(0);

      sync_sl_tx_data : entity work.sync_cdc
        generic map (
          WIDTH    => 1 + 1 + sl_rx_data_pre_cdc(idx).data'length,
          N_STAGES => 1)
        port map (
          clk_i   => clock,
          valid_i => sl_rx_data_pre_cdc(idx).valid,
          valid_o => sl_rx_data_o(idx).valid,
          data_i  => sl_pre_cdc_vec,
          data_o  => sl_post_cdc_vec
          );

    end generate;
  end generate;

end Behavioral;
