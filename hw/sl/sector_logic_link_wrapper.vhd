library ieee;
use ieee.std_logic_1164.all;

library sl;

library work;
use work.system_types_pkg.all;
use work.sector_logic_pkg.all;
use work.constants_pkg.all;
use work.board_pkg.all;

entity sector_logic_link_wrapper is
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- 32 bits / bx from mgt
    sl_rx_mgt_word_array_i : in std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    sl_rx_data_o : out sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    -- 32 bits / bx to mgt
    sl_tx_mgt_word_array_o : out std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    sl_tx_data_i : in sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    --driven from pattern generator in ex
    sl_tx_ctrl_o : out sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0)

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
        port map (
          tx_usrclk2      => clock,
          userdata_tx     => sl_tx_mgt_word_array_o(idx),
          txctrl0         => sl_tx_ctrl_o(idx).ctrl0,
          txctrl1         => sl_tx_ctrl_o(idx).ctrl1,
          txctrl2         => sl_tx_ctrl_o(idx).ctrl2,
          packet_userdata => sl_tx_data_post_cdc(idx).data,
          packet_valid    => sl_tx_data_post_cdc(idx).valid,
          packet_txctrl0  => std_logic_vector'(x"000000"),
          packet_txctrl1  => std_logic_vector'(x"000000"),
          packet_txctrl2  => std_logic_vector'(x"100000")  -- FIXME check this
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
      constant idx : integer := sl_idx_array(I);
    begin

      sector_logic_rx_packet_former_inst : entity sl.sector_logic_rx_packet_former

        port map (
          rx_usrclk2            => clock,
          reset                 => rx_reset_tree (idx),
          rxctrl0               => (others => std_logic_0),
          rxctrl1               => (others => std_logic_0),
          rxctrl2               => (others => std_logic_0),
          rxctrl3               => (others => std_logic_0),
          userdata_rx           => sl_rx_mgt_word_array_i(idx),
          packet_rxctrl0        => open,  -- not connected to anythin
          packet_rxctrl1        => open,  -- not connected to anythin
          packet_rxctrl2        => open,  -- not connected to anythin
          packet_rxctrl3        => open,  -- not connected to anythin
          packet_userdata       => sl_rx_data_pre_cdc(idx).data,
          packet_locked         => sl_rx_data_pre_cdc(idx).locked,
          packet_valid          => sl_rx_data_pre_cdc(idx).valid,
          packet_error_detected => sl_rx_data_pre_cdc(idx).err

          );

      sync_sl_tx_data : entity work.sync_cdc
        generic map (
          WIDTH    => 1 + 1 + sl_rx_data_pre_cdc(idx).data'length,
          N_STAGES => 1)
        port map (
          clk_i                                                    => clock,
          valid_i                                                  => sl_rx_data_pre_cdc(idx).valid,
          data_i(0)                                                => sl_rx_data_pre_cdc(idx).err,
          data_i(1)                                                => sl_rx_data_pre_cdc(idx).locked,
          data_i(2+sl_rx_data_pre_cdc(idx).data'length-1 downto 2) => sl_rx_data_pre_cdc(idx).data,
          valid_o                                                  => sl_rx_data_o(idx).valid,
          data_o(0)                                                => sl_rx_data_o(idx).err,
          data_o(1)                                                => sl_rx_data_o(idx).locked,
          data_o(2+sl_rx_data_pre_cdc(idx).data'length-1 downto 2) => sl_rx_data_o(idx).data
          );

    end generate;
  end generate;

end Behavioral;
