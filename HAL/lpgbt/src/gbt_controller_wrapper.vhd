library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library gbt_sc;
use gbt_sc.sca_pkg.all;

library ctrl_lib;
use ctrl_lib.HAL_CTRL.all;

entity gbt_controller_wrapper is
  generic(
    g_CLK_FREQ       : integer := 40;
    g_SCAS_PER_LPGBT : integer := 3
    );
  port(
    -- reset
    reset_i : in std_logic;

    mon  : out HAL_CSM_CSM_SC_MON_t;
    ctrl : in  HAL_CSM_CSM_SC_CTRL_t;

    clk40   : in std_logic;

    -- master
    ic_data_i : in  std_logic_vector (1 downto 0);
    ic_data_o : out std_logic_vector (1 downto 0);

    -- slave
    ec_data_i : in  std_logic_vector (1 downto 0);
    ec_data_o : out std_logic_vector (1 downto 0);

    sca0_data_i : in  std_logic_vector (1 downto 0);
    sca0_data_o : out std_logic_vector (1 downto 0);

    sca1_data_i : in  std_logic_vector (1 downto 0);
    sca1_data_o : out std_logic_vector (1 downto 0);

    sca2_data_i : in  std_logic_vector (1 downto 0);
    sca2_data_o : out std_logic_vector (1 downto 0)

    );
end gbt_controller_wrapper;

architecture structural of gbt_controller_wrapper is

  -- master
  signal master_rx_frame, slave_rx_frame
    : std_logic_vector (7 downto 0) := (others => '0');

  signal master_rx_empty, slave_rx_empty
    : std_logic := '0';

  -- inputs, internal 40MHz copy
  signal ic_data_i_int, ec_data_i_int,
    sca0_data_i_int, sca1_data_i_int, sca2_data_i_int
    : std_logic_vector (1 downto 0);

  -- outputs, internal copy
  signal ic_data_o_int, ec_data_o_int,
    sca0_data_o_int, sca1_data_o_int, sca2_data_o_int
    : std_logic_vector (1 downto 0);

  signal lpgbt_version : std_logic_vector (1 downto 0);

begin

  --------------------------------------------------------------------------------
  -- register inputs/outputs for timing
  --------------------------------------------------------------------------------

  process (clk40) is
  begin
    if (rising_edge(clk40)) then

      ic_data_o   <= ic_data_o_int;
      ec_data_o   <= ec_data_o_int;
      sca0_data_o <= sca0_data_o_int;
      sca1_data_o <= sca1_data_o_int;
      sca2_data_o <= sca2_data_o_int;

      ic_data_i_int   <= ic_data_i;
      ec_data_i_int   <= ec_data_i;
      sca0_data_i_int <= sca0_data_i;
      sca1_data_i_int <= sca1_data_i;
      sca2_data_i_int <= sca2_data_i;

    end if;
  end process;

  --------------------------------------------------------------------------------
  -- Slave LPGBT (no SCAs)
  --------------------------------------------------------------------------------

  slave_gbtsc_top_inst : entity gbt_sc.gbtsc_top

    generic map (
      g_IC_FIFO_DEPTH => 8,
      g_ToLpGBT       => 1,             -- 1 = LPGBT, 0=GBTX
      g_SCA_COUNT     => 0
      )
    port map (

      -- lpGBT Version
      lpgbt_vers_i => ctrl.frame_format,

      -- tx to lpgbt etc
      tx_clk_i  => clk40,
      tx_clk_en => '1',

      -- rx from lpgbt etc
      rx_clk_i  => clk40,
      rx_clk_en => '1',

      -- IC/EC data from controller
      ic_data_i => ec_data_i_int,       -- to/from slave lpgbt
      ic_data_o => ec_data_o_int,       -- to/from slave lpgbt

      -- multiplexed IC/EC data from all lpgbts

      ec_data_i => (others => (others => '1')),
      ec_data_o => open,

      -- reset
      rx_reset_i => reset_i or ctrl.slave.rx_reset,
      tx_reset_i => reset_i or ctrl.slave.tx_reset,

      -- connect all of the following to AXI slave

      tx_start_write_i => ctrl.slave.ic.tx_start_write,
      tx_start_read_i  => ctrl.slave.ic.tx_start_read,

      tx_gbtx_address_i  => ctrl.slave.ic.tx_gbtx_addr,
      tx_register_addr_i => ctrl.slave.ic.tx_register_addr,
      tx_nb_to_be_read_i => ctrl.slave.ic.tx_num_bytes_to_read,

      -- ic tx
      wr_clk_i          => clk40,
      tx_wr_i           => ctrl.slave.ic.tx_wr,
      tx_data_to_gbtx_i => ctrl.slave.ic.tx_data_to_gbtx,
      tx_ready_o        => mon.slave.ic.tx_ready,  --! IC core ready for a transaction

      -- ic rx
      rd_clk_i            => clk40,
      rx_rd_i             => '1',
      rx_data_from_gbtx_o => slave_rx_frame,
      rx_empty_o          => slave_rx_empty,

      -- SCA Control
      sca_enable_i        => (others => '0'),
      start_reset_cmd_i   => '0',
      start_connect_cmd_i => '0',
      start_command_i     => '0',
      inject_crc_error    => '0',
      tx_address_i        => (others => '0'),
      tx_transID_i        => (others => '0'),
      tx_channel_i        => (others => '0'),
      tx_command_i        => (others => '0'),
      tx_data_i           => (others => '0'),

      -- SCA Command
      rx_address_o  => open,
      rx_channel_o  => open,
      rx_control_o  => open,
      rx_data_o     => open,
      rx_error_o    => open,
      rx_len_o      => open,
      rx_received_o => open,
      rx_transID_o  => open
      );

  --------------------------------------------------------------------------------
  -- Master LPGBT (w/SCAs)
  --------------------------------------------------------------------------------

  master_gbtsc_top_inst : entity gbt_sc.gbtsc_top
    generic map (
      g_IC_FIFO_DEPTH => 8,
      g_ToLpGBT       => 1,             -- 1 = LPGBT, 0=GBTX
      g_SCA_COUNT     => g_SCAS_PER_LPGBT
      )
    port map (

      -- lpGBT Version
      lpgbt_vers_i => ctrl.frame_format,

      -- tx to lpgbt etc
      tx_clk_i  => clk40,
      tx_clk_en => '1',

      -- rx from lpgbt etc
      rx_clk_i  => clk40,
      rx_clk_en => '1',

      -- IC/EC data from controller
      ic_data_i => ic_data_i_int,
      ic_data_o => ic_data_o_int,

      -- multiplexed IC/EC data from all lpgbts

      ec_data_o(0) => sca0_data_o_int,
      ec_data_o(1) => sca1_data_o_int,
      ec_data_o(2) => sca2_data_o_int,

      ec_data_i(0) => sca0_data_i_int,
      ec_data_i(1) => sca1_data_i_int,
      ec_data_i(2) => sca2_data_i_int,

      -- reset
      rx_reset_i => reset_i or ctrl.master.rx_reset,
      tx_reset_i => reset_i or ctrl.master.tx_reset,

      -- connect all of the following to AXI slave

      tx_start_write_i => ctrl.master.ic.tx_start_write,
      tx_start_read_i  => ctrl.master.ic.tx_start_read,

      tx_gbtx_address_i  => ctrl.master.ic.tx_gbtx_addr,
      tx_register_addr_i => ctrl.master.ic.tx_register_addr,
      tx_nb_to_be_read_i => ctrl.master.ic.tx_num_bytes_to_read,

      -- ic tx
      wr_clk_i          => clk40,
      tx_wr_i           => ctrl.master.ic.tx_wr,
      tx_data_to_gbtx_i => ctrl.master.ic.tx_data_to_gbtx,
      tx_ready_o        => mon.master.ic.tx_ready,  --! IC core ready for a transaction

      -- ic rx
      rd_clk_i            => clk40,
      rx_rd_i             => '1',
      rx_data_from_gbtx_o => master_rx_frame,
      rx_empty_o          => master_rx_empty,

      sca_enable_i        => ctrl.master.sca_enable,
      start_reset_cmd_i   => ctrl.master.start_reset,
      start_connect_cmd_i => ctrl.master.start_connect,
      start_command_i     => ctrl.master.start_command,
      inject_crc_error    => ctrl.master.inj_crc_err,
      tx_address_i        => ctrl.master.tx_address,
      tx_transID_i        => ctrl.master.tx_transID,
      tx_channel_i        => ctrl.master.tx_channel,
      tx_command_i        => ctrl.master.tx_cmd,
      tx_data_i           => ctrl.master.tx_data,

      -- SCA Command
      rx_address_o(0)  => mon.master.sca_rx.rx(0).rx_address,
      rx_address_o(1)  => mon.master.sca_rx.rx(1).rx_address,
      rx_address_o(2)  => mon.master.sca_rx.rx(2).rx_address,
      rx_channel_o(0)  => mon.master.sca_rx.rx(0).rx_channel,
      rx_channel_o(1)  => mon.master.sca_rx.rx(1).rx_channel,
      rx_channel_o(2)  => mon.master.sca_rx.rx(2).rx_channel,
      rx_control_o(0)  => mon.master.sca_rx.rx(0).rx_control,
      rx_control_o(1)  => mon.master.sca_rx.rx(1).rx_control,
      rx_control_o(2)  => mon.master.sca_rx.rx(2).rx_control,
      rx_data_o(0)     => mon.master.sca_rx.rx(0).rx_data,
      rx_data_o(1)     => mon.master.sca_rx.rx(1).rx_data,
      rx_data_o(2)     => mon.master.sca_rx.rx(2).rx_data,
      rx_error_o(0)    => mon.master.sca_rx.rx(0).rx_err,
      rx_error_o(1)    => mon.master.sca_rx.rx(1).rx_err,
      rx_error_o(2)    => mon.master.sca_rx.rx(2).rx_err,
      rx_len_o(0)      => mon.master.sca_rx.rx(0).rx_len,
      rx_len_o(1)      => mon.master.sca_rx.rx(1).rx_len,
      rx_len_o(2)      => mon.master.sca_rx.rx(2).rx_len,
      rx_received_o(0) => mon.master.sca_rx.rx(0).rx_received,
      rx_received_o(1) => mon.master.sca_rx.rx(1).rx_received,
      rx_received_o(2) => mon.master.sca_rx.rx(2).rx_received,
      rx_transID_o(0)  => mon.master.sca_rx.rx(0).rx_transID,
      rx_transID_o(1)  => mon.master.sca_rx.rx(1).rx_transID,
      rx_transID_o(2)  => mon.master.sca_rx.rx(2).rx_transID
      );

  lpgbt_version <= "01" when (ctrl.frame_format='0') else "10";

  gbt_ic_rx_m : entity work.gbt_ic_rx
    port map (
      clock_i              => clk40,
      reset_i              => reset_i,
      gbt_frame_format_i   => lpgbt_version,
      frame_i              => master_rx_frame,
      valid_i              => not master_rx_empty,
      data_o               => mon.master.ic.rx_data,
      chip_adr_o           => mon.master.ic.rx_chip_adr,
      length_o             => mon.master.ic.rx_length,
      reg_adr_o            => mon.master.ic.rx_reg_adr,
      uplink_parity_ok_o   => mon.master.ic.rx_up_parity_ok,
      downlink_parity_ok_o => mon.master.ic.rx_down_parity_ok,
      err_o                => mon.master.ic.rx_err,
      valid_o              => mon.master.ic.rx_valid
      );

  gbt_ic_rx_s : entity work.gbt_ic_rx
    port map (
      clock_i              => clk40,
      reset_i              => reset_i,
      gbt_frame_format_i   => lpgbt_version,
      frame_i              => slave_rx_frame,
      valid_i              => not slave_rx_empty,
      data_o               => mon.slave.ic.rx_data,
      chip_adr_o           => mon.slave.ic.rx_chip_adr,
      length_o             => mon.slave.ic.rx_length,
      reg_adr_o            => mon.slave.ic.rx_reg_adr,
      uplink_parity_ok_o   => mon.slave.ic.rx_up_parity_ok,
      downlink_parity_ok_o => mon.slave.ic.rx_down_parity_ok,
      err_o                => mon.slave.ic.rx_err,
      valid_o              => mon.slave.ic.rx_valid
      );

end structural;
