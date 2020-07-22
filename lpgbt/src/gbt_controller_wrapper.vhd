library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library hal;
use hal.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;
use hal.constants_pkg.all;
use hal.board_pkg.all;

library tdc;
use tdc.csm_pkg.all;

library gbt_sc;
use gbt_sc.sca_pkg.all;

library ctrl_lib;
use ctrl_lib.hal_ctrl.all;
use ctrl_lib.axiRegPkg.all;

entity gbt_controller_wrapper is
  generic(
    g_SCAS_PER_LPGBT : integer := 2
    );
  port(
    -- reset
    reset_i : in std_logic;

    lpgbt_clk : in std_logic;
    valid_i   : in std_logic;
    axi_clk   : in std_logic;

    ctrl : in  HAL_GBT_CTRL_t;
    mon  : out HAL_GBT_MON_t;

    -- take in all uplink / downlink data; need a mapping module to map this into SCA links etc..
    lpgbt_downlink_data_o : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
    lpgbt_uplink_data_i   : in  lpgbt_uplink_data_rt_array (c_FELIX_LPGBT_INDEX downto 0)
    );
end gbt_controller_wrapper;

architecture common_controller of gbt_controller_wrapper is

  signal valid : std_logic;

  attribute DONT_TOUCH          : string;
  attribute DONT_TOUCH of valid : signal is "true";

  -- EC line
  signal ec_data_down : reg2_arr((g_SCAS_PER_LPGBT-1) downto 0);  --! (TX) Array of bits to be mapped to the TX GBT-Frame
  signal ec_data_up   : reg2_arr((g_SCAS_PER_LPGBT-1) downto 0);  --! (RX) Array of bits to be mapped to the RX GBT-Frame

  -- IC lines
  signal ic_data_down : std_logic_vector(1 downto 0);  --! (TX) Array of bits to be mapped to the TX GBT-Frame (bits 83/84)
  signal ic_data_up   : std_logic_vector(1 downto 0);  --! (RX) Array of bits to be mapped to the RX GBT-Frame (bits 83/84)

  signal lpgbt_link_sel       : integer   := 0;
  signal lpgbt_link_sel_slave : std_logic := '0';
  signal lpgbt_broadcast      : std_logic := '0';

  signal sca_link_sel  : integer   := 0;
  signal sca_broadcast : std_logic := '0';

  signal tx_reset, rx_reset : std_logic := '0';

begin

  valid <= valid_i;

  process (lpgbt_clk)
  begin
    if (rising_edge(lpgbt_clk)) then
      if (valid) then
        lpgbt_link_sel       <= to_integer(unsigned(ctrl.link_sel));
        lpgbt_link_sel_slave <= ctrl.sel_slave;
        lpgbt_broadcast      <= ctrl.broadcast;

        if (ctrl.sca_sel = '1') then
          sca_link_sel <= 1;
        else
          sca_link_sel <= 0;
        end if;
        sca_broadcast <= ctrl.sca_broadcast;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- instantiate a single gbtsc core, connect it to a single axi slave
  -- use a multiplexer to fan the single gbt_sc core out to all of the different lpgbts
  --------------------------------------------------------------------------------

  gbtsc_top_inst : entity gbt_sc.gbtsc_top
    generic map (
      g_IC_FIFO_DEPTH => 32,
      g_ToLpGBT       => 1,
      g_SCA_COUNT     => g_SCAS_PER_LPGBT
      )
    port map (

      -- tx to lpgbt etc
      tx_clk_i  => lpgbt_clk,
      tx_clk_en => valid,

      -- rx from lpgbt etc
      rx_clk_i  => lpgbt_clk,
      rx_clk_en => valid,

      -- IC/EC data from controller
      ec_data_o => ec_data_down,
      ic_data_o => ic_data_down,

      -- multiplexed IC/EC data from all lpgbts
      ec_data_i => ec_data_up,
      ic_data_i => ic_data_up,

      -- reset
      rx_reset_i => rx_reset,
      tx_reset_i => tx_reset,

      -- connect all of the following to AXI slave

      tx_start_write_i => ctrl.sc.tx_start_write,
      tx_start_read_i  => ctrl.sc.tx_start_read,

      tx_gbtx_address_i  => ctrl.sc.tx_gbtx_addr,
      tx_register_addr_i => ctrl.sc.tx_register_addr,
      tx_nb_to_be_read_i => ctrl.sc.tx_num_bytes_to_read,

      wr_clk_i          => axi_clk,
      tx_wr_i           => ctrl.sc.tx_wr,
      tx_data_to_gbtx_i => ctrl.sc.tx_data_to_gbtx,

      rd_clk_i            => axi_clk,
      rx_rd_i             => ctrl.sc.rx_rd,
      rx_data_from_gbtx_o => mon.sc.rx_data_from_gbtx,

      tx_ready_o          => mon.sc.tx_ready,  --! IC core ready for a transaction
      rx_empty_o          => mon.sc.rx_empty,
      sca_enable_i        => ctrl.sc.sca_enable,
      start_reset_cmd_i   => ctrl.sc.start_reset,
      start_connect_cmd_i => ctrl.sc.start_connect,
      start_command_i     => ctrl.sc.start_command,
      inject_crc_error    => ctrl.sc.inj_crc_err,
      tx_address_i        => ctrl.sc.tx_address,
      tx_transID_i        => ctrl.sc.tx_transID,
      tx_channel_i        => ctrl.sc.tx_channel,
      tx_command_i        => ctrl.sc.tx_cmd,
      tx_data_i           => ctrl.sc.tx_data,

      -- SCA Command

      rx_address_o(0)  => mon.sc.rx_address_0,
      rx_address_o(1)  => mon.sc.rx_address_1,
      rx_channel_o(0)  => mon.sc.rx_channel_0,
      rx_channel_o(1)  => mon.sc.rx_channel_1,
      rx_control_o(0)  => mon.sc.rx_control_0,
      rx_control_o(1)  => mon.sc.rx_control_1,
      rx_data_o(0)     => mon.sc.rx_data_0,
      rx_data_o(1)     => mon.sc.rx_data_1,
      rx_error_o(0)    => mon.sc.rx_err_0,
      rx_error_o(1)    => mon.sc.rx_err_1,
      rx_len_o(0)      => mon.sc.rx_len_0,
      rx_len_o(1)      => mon.sc.rx_len_1,
      rx_received_o(0) => mon.sc.rx_received_0,
      rx_received_o(1) => mon.sc.rx_received_1,
      rx_transID_o(0)  => mon.sc.rx_transID_0,
      rx_transID_o(1)  => mon.sc.rx_transID_1

      );

  --------------------------------------------------------------------------------
  -- Input mux from LPGBT to sc controller
  --------------------------------------------------------------------------------

  process (lpgbt_clk)
    constant up0 : integer := CSM_SCA_UPLINK_ELINK0;
    constant up1 : integer := CSM_SCA_UPLINK_ELINK1;
  begin

    if (rising_edge(lpgbt_clk)) then
      if (valid) then
        -- mux and copy onto 40MHz lpgbt_clk
        ic_data_up    <= lpgbt_uplink_data_i (lpgbt_link_sel).ic;
        ec_data_up(0) <= lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up0+4) & lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up0 + 2);
        ec_data_up(1) <= lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up1+4) & lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up1 + 2);
      end if;
    end if;
  end process;


  --------------------------------------------------------------------------------
  -- Output Mux to LPGBTS
  --------------------------------------------------------------------------------

  process (lpgbt_clk, ec_data_down)
    variable ec_data_down_replicated0 : std_logic_vector (3 downto 0);
    variable ec_data_down_replicated1 : std_logic_vector (3 downto 0);

    constant d0 : integer := CSM_SCA_DOWNLINK_ELINK0;
    constant d1 : integer := CSM_SCA_DOWNLINK_ELINK1;

    -- function to replicate a std_logic bit some number of times
    -- equivalent to verilog's built in {n{x}} operator
    function repeat(B : std_logic; N : integer)
      return std_logic_vector
    is
      variable result : std_logic_vector(1 to N);
    begin
      for i in 1 to N loop
        result(i) := B;
      end loop;
      return result;
    end;

  begin
    output_mux_gen : for I in 0 to c_NUM_LPGBT_DOWNLINKS-1 loop

      -- TODO: mux the bits only during idle sequences to ensure smooth transitions

      -- replicate sca outputs bits two times each because of 80 --> 160 mbps conversion
      ec_data_down_replicated0 := repeat(ec_data_down(0)(1), 2) & repeat(ec_data_down(0)(0), 2);
      ec_data_down_replicated1 := repeat(ec_data_down(1)(1), 2) & repeat(ec_data_down(1)(0), 2);

      if (rising_edge(lpgbt_clk)) then
        if (valid) then

          -- if broadcast ? send to all of the lpgbts
          if (lpgbt_broadcast = '1') then
            lpgbt_downlink_data_o (I).ic <= ic_data_down;
            lpgbt_downlink_data_o (I).ec <= ic_data_down;

          -- if master
          elsif (lpgbt_link_sel = I and lpgbt_link_sel_slave = '0') then
            lpgbt_downlink_data_o (I).ic <= ic_data_down;

          -- if slave
          elsif (lpgbt_link_sel = I and lpgbt_link_sel_slave = '1') then
            lpgbt_downlink_data_o (I).ec <= ic_data_down;

          -- if idle (nothing selected, should block writes)
          else
            lpgbt_downlink_data_o (I).ic <= (others => '1');
            lpgbt_downlink_data_o (I).ec <= (others => '1');
          end if;

          -- if broadcast ? send to all of the scas
          if (sca_broadcast = '1') then
            lpgbt_downlink_data_o (I).data((1+d0)*4-1 downto d0*4) <= ec_data_down_replicated0;
            lpgbt_downlink_data_o (I).data((1+d1)*4-1 downto d1*4) <= ec_data_down_replicated1;

          -- select a CSM... choose which SCA on SC controller port
          elsif (sca_link_sel = I) then
            lpgbt_downlink_data_o (I).data((1+d0)*4-1 downto d0*4) <= ec_data_down_replicated0;
            lpgbt_downlink_data_o (I).data((1+d1)*4-1 downto d1*4) <= ec_data_down_replicated1;

          -- idle
          else
            lpgbt_downlink_data_o (I).data((1+d0)*4-1 downto d0*4) <= (others => '1');
            lpgbt_downlink_data_o (I).data((1+d1)*4-1 downto d1*4) <= (others => '1');
          end if;

        end if;
      end if;
    end loop;
  end process;

end common_controller;
