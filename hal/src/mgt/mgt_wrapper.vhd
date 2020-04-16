library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.system_types_pkg.all;
use work.constants_pkg.all;
use work.lpgbt_pkg.all;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;
use work.sector_logic_pkg.all;

-- FIXME: need to use a freerunning clock for statemachine startup ???

entity mgt_wrapper is
  port(

    -- Clock
    clocks : in system_clocks_rt;

    reset : in std_logic;

    -- Refclk Inputs
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- LPGBT
    --------------------------------------------------------------------------------

    -- Rxslide from LPGBT rx core
    lpgbt_rxslide_i : in std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- 32 bits / clock to mgt
    lpgbt_downlink_mgt_word_array_i : in std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- 32 bits / clock from mgt
    lpgbt_uplink_mgt_word_array_o : out std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- LPGBT Emulator
    --------------------------------------------------------------------------------

    -- Rxslide from LPGBT rx core
    lpgbt_emul_rxslide_i : in std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    -- 32 bits / clock to mgt
    lpgbt_emul_downlink_mgt_word_array_o : out std32_array_t (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    -- 32 bits / clock from mgt
    lpgbt_emul_uplink_mgt_word_array_i : in std32_array_t (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Sector Logic
    --------------------------------------------------------------------------------

    -- 32 bits / bx to mgt
    sl_tx_mgt_word_array_i : in std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- 32 bits / bx from mgt
    sl_rx_mgt_word_array_o : out std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    sl_txclks : out std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    sl_rxclks : out std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    sl_tx_ctrl_i  : in  sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    sl_rx_ctrl_o  : out sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    sl_rx_slide_i : in  std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0)

    );
end mgt_wrapper;

architecture Behavioral of mgt_wrapper is

  signal lpgbt_mgt_rx_p : std_logic_vector (c_num_lpgbt_uplinks-1 downto 0);
  signal lpgbt_mgt_rx_n : std_logic_vector (c_num_lpgbt_uplinks-1 downto 0);

  signal lpgbt_mgt_tx_p : std_logic_vector (c_num_lpgbt_downlinks-1 downto 0);
  signal lpgbt_mgt_tx_n : std_logic_vector (c_num_lpgbt_downlinks-1 downto 0);

  signal emul_mgt_rx_p : std_logic_vector (c_num_lpgbt_emul_uplinks-1 downto 0);
  signal emul_mgt_rx_n : std_logic_vector (c_num_lpgbt_emul_uplinks-1 downto 0);

  signal emul_mgt_tx_p : std_logic_vector (c_num_lpgbt_emul_uplinks-1 downto 0);
  signal emul_mgt_tx_n : std_logic_vector (c_num_lpgbt_emul_uplinks-1 downto 0);

  signal sl_mgt_rx_p : std_logic_vector (c_num_sector_logic_inputs-1 downto 0);
  signal sl_mgt_rx_n : std_logic_vector (c_num_sector_logic_inputs-1 downto 0);

  signal sl_mgt_tx_p : std_logic_vector (c_num_sector_logic_inputs-1 downto 0);
  signal sl_mgt_tx_n : std_logic_vector (c_num_sector_logic_inputs-1 downto 0);

  signal reset_tree : std_logic_vector (c_NUM_MGTS-1 downto 0) := (others => '1');

  attribute DONT_TOUCH               : string;
  attribute DONT_TOUCH of reset_tree : signal is "true";

  signal refclk : std_logic_vector (c_NUM_REFCLKS-1 downto 0);

  signal tx_resets : mgt_reset_rt_array (c_NUM_MGTS-1 downto 0);
  signal rx_resets : mgt_reset_rt_array (c_NUM_MGTS-1 downto 0);

  signal mgt_drp_i : mgt_drp_in_rt_array (c_NUM_MGTS-1 downto 0);
  signal mgt_drp_o : mgt_drp_out_rt_array (c_NUM_MGTS-1 downto 0);

begin

  --------------------------------------------------------------------------------
  -- Reset Tree
  --------------------------------------------------------------------------------

  reset_fanout : process (clocks.clock40) is
  begin  -- process reset_fanout
    if rising_edge(clocks.clock40) then  -- rising clock edge
      reset_tree <= (others => reset);
    end if;
  end process reset_fanout;

  --------------------------------------------------------------------------------
  -- Refclk
  --------------------------------------------------------------------------------

  assert false report "GENERATING " & integer'image(c_NUM_MGTS) & "MGT LINKS:" severity note;

  refclk_gen : for I in 0 to c_NUM_REFCLKS-1 generate

    assert false report "GENERATING REFCLK IBUF=" & integer'image(I) severity note;

    --------------------------------------------------------------------------------
    -- GTH Common
    --------------------------------------------------------------------------------

    refclk_ibufds : ibufds_gte4
      generic map(
        REFCLK_EN_TX_PATH  => '0',
        REFCLK_HROW_CK_SEL => (others => '0'),
        REFCLK_ICNTL_RX    => (others => '0')
        )
      port map (
        O     => refclk(I),
        ODIV2 => open,
        CEB   => '0',
        I     => refclk_i_p(I),
        IB    => refclk_i_n(I)
        );

    --------------------------------------------------------------------------------
    -- GTH Common
    --------------------------------------------------------------------------------

    -- https://www.xilinx.com/support/documentation/user_guides/ug576-ultrascale-gth-transceivers.pdf
    -- In the case of a single reference clock, connect the reference clock to
    -- the GTREFCLK00 and GTREFCLK01 ports, and tie the QPLL0REFCLKSEL and
    -- QPLL1REFCLKSEL ports to 3'b001. The Xilinx software tools will handle the
    -- complexity of the multiplexers and associated routing.

    -- mgt_common_wrapper_inst : entity hal.mgt_common_wrapper
    --   port map (
    --     gtrefclk00 => refclk(I),
    --     gtrefclk01 => refclk(I),
    --     qpll0reset => or_reduce ( -- these should come from the gtys / gths, -- TODO: need to drive the reset
    --     qpll1reset => '0',

    --     qpll0lock          => qpll0lock,
    --     qpll0outclk_out    => qpll0outclk_out,
    --     qpll0outrefclk_out => qpll0outrefclk_out,
    --     qpll1lock          => qpll1lock,
    --     qpll1outclk_out    => qpll1outclk_out,
    --     qpll1outrefclk_out => qpll1outrefclk_out
    --     );

  end generate;

  --------------------------------------------------------------------------------
  -- MGTS
  --------------------------------------------------------------------------------

  lpgbt_idx_array_print : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "LPGBT_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(lpgbt_idx_array(I)) severity note;
  end generate;

  sl_idx_array_print : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "SL_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(sl_idx_array(I)) severity note;
  end generate;

  mgt_gen : for I in 0 to c_NUM_MGTS-1 generate

  begin

    assert false report "GENERATING MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) severity note;
    -- assert (c_MGT_MAP(I).refclk /= -1) and (c_MGT_MAP(I).refclk < c_NUM_REFCLKS) report "invalid refclk selected" severity error;

    --------------------------------------------------------------------------------
    -- LPGBT Type
    --------------------------------------------------------------------------------

    lpgbt_gen : if (lpgbt_idx_array(I) /= -1) generate

      attribute X_LOC            : integer;
      attribute Y_LOC            : integer;
      attribute X_LOC of MGT_GEN : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_GEN : label is "true";

      constant downlink_idx : integer := lpgbt_downlink_idx_array(I);
      constant uplink_idx   : integer := lpgbt_uplink_idx_array(I);

      signal downlink_data : std_logic_vector (31 downto 0);

      signal tx_p, tx_n : std_logic;

    begin


      downlink_data <= lpgbt_downlink_mgt_word_array_i(downlink_idx) when (downlink_idx /= -1) else x"00000000";

      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk) = REFCLK_SYNC320) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

      assert false report "GENERATING LPGBT TYPE LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " LPGBT_LINK_CNT=" & integer'image(lpgbt_idx_array(I)) severity note;
      assert false report "downlink_idx=" & integer'image(downlink_idx) severity note;
      assert false report "uplink_idx=" & integer'image(uplink_idx) severity note;

      MGT_GEN : entity work.mgt_10g24_wrapper
        generic map (index => I, gt_type => c_MGT_MAP(I).gt_type)
        port map (
          free_clock            => clocks.freeclock,
          reset                 => reset_tree(I),
          mgt_refclk_i          => refclk(c_MGT_MAP(I).refclk),
          mgt_rxusrclk_i        => clocks.clock320,
          mgt_rxusrclk_active_i => not reset_tree(I),
          mgt_txusrclk_i        => clocks.clock320,
          mgt_txusrclk_active_i => not reset_tree(I),
          tx_resets_i           => tx_resets(I),
          rx_resets_i           => rx_resets(I),
          mgt_rxslide_i         => lpgbt_rxslide_i(uplink_idx),
          status_o              => open,
          mgt_word_i            => downlink_data,
          mgt_word_o            => lpgbt_uplink_mgt_word_array_o(uplink_idx),
          rxp_i                 => lpgbt_mgt_rx_p(uplink_idx),
          rxn_i                 => lpgbt_mgt_rx_n(uplink_idx),
          txp_o                 => tx_p,
          txn_o                 => tx_n,
          mgt_drp_i             => mgt_drp_i(I),
          mgt_drp_o             => mgt_drp_o(I)
          );

      tx_assign_if : if (downlink_idx /= -1) generate
        lpgbt_mgt_tx_p(downlink_idx) <= tx_p;
        lpgbt_mgt_tx_n(downlink_idx) <= tx_n;
      end generate;

    end generate lpgbt_gen;

    --------------------------------------------------------------------------------
    -- LPGBT Emulator Type
    --------------------------------------------------------------------------------

    emul_gen : if (emul_idx_array(I) /= -1) generate

      attribute X_LOC            : integer;
      attribute Y_LOC            : integer;
      attribute X_LOC of MGT_GEN : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_GEN : label is "true";

      constant idx : integer := emul_idx_array(I);

    begin

      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk) = REFCLK_SYNC320) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

      assert false report "GENERATING LPGBT EMULATOR LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " LPGBT_LINK_CNT=" & integer'image(idx) severity note;
      assert false report "link_idx=" & integer'image(idx) severity note;

      assert (idx /= -1) report "instantiating an invalid LPGBT emulator link" severity error;

      MGT_GEN : entity work.mgt_10g24_wrapper
        generic map (index => I, gt_type => c_MGT_MAP(I).gt_type)
        port map (
          free_clock            => clocks.freeclock,
          reset                 => reset_tree(I),
          mgt_refclk_i          => refclk(c_MGT_MAP(I).refclk),
          mgt_rxusrclk_i        => clocks.clock320,
          mgt_rxusrclk_active_i => not reset_tree(I),
          mgt_txusrclk_i        => clocks.clock320,
          mgt_txusrclk_active_i => not reset_tree(I),
          tx_resets_i           => tx_resets(I),
          rx_resets_i           => rx_resets(I),
          mgt_rxslide_i         => lpgbt_emul_rxslide_i(idx),
          status_o              => open,
          mgt_word_i            => lpgbt_emul_uplink_mgt_word_array_i(idx),
          mgt_word_o            => lpgbt_emul_downlink_mgt_word_array_o(idx),
          rxp_i                 => emul_mgt_rx_p(idx),
          rxn_i                 => emul_mgt_rx_n(idx),
          txp_o                 => emul_mgt_tx_p(idx),
          txn_o                 => emul_mgt_tx_n(idx),
          mgt_drp_i             => mgt_drp_i(I),
          mgt_drp_o             => mgt_drp_o(I)
          );

    end generate emul_gen;

    --------------------------------------------------------------------------------
    -- Sector Logic Type
    --------------------------------------------------------------------------------

    sl_gen : if (sl_idx_array(I) /= -1) generate

      attribute X_LOC            : integer;
      attribute Y_LOC            : integer;
      attribute X_LOC of MGT_GEN : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_GEN : label is "true";

      constant idx : integer := sl_idx_array(I);

    begin

      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk) = REFCLK_SYNC240) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

      assert false report "GENERATING SECTOR LOGIC TYPE LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " SL_LINK_CNT=" & integer'image(idx) severity note;
      assert (c_NUM_SECTOR_LOGIC_INPUTS = c_NUM_SECTOR_LOGIC_OUTPUTS) report "We only support symmetric # of SL inputs / outputs" severity error;
      assert (idx <= c_NUM_SECTOR_LOGIC_OUTPUTS) report "conflict between # of sl links in board file and c_NUM_SECTOR_LOGIC_DOWNLINKS" severity error;

      MGT_GEN : entity work.mgt_sl_wrapper
        generic map (index => I, gt_type => c_MGT_MAP(I).gt_type)
        port map (
          clock                    => clocks.freeclock,  -- FIXME: check this clock frequency against IP core
          reset_i                  => reset_tree(I),
          mgt_refclk_i             => refclk(c_MGT_MAP(I).refclk),
          mgt_rxusrclk_i           => clocks.clock240,
          mgt_rxusrclk_active_i    => not reset_tree(I),
          mgt_txusrclk_i           => clocks.clock240,
          mgt_txusrclk_active_i    => not reset_tree(I),
          tx_resets_i              => tx_resets(I),
          rx_resets_i              => rx_resets(I),
          status_o                 => open,
          txctrl0_in               => x"000" & sl_tx_ctrl_i(idx).ctrl0,
          txctrl1_in               => x"000" & sl_tx_ctrl_i(idx).ctrl1,
          txctrl2_in               => x"0" & sl_tx_ctrl_i(idx).ctrl2,
          rxctrl0_out(3 downto 0)  => sl_rx_ctrl_o(idx).ctrl0,
          rxctrl0_out(15 downto 4) => open,
          rxctrl1_out(3 downto 0)  => sl_rx_ctrl_o(idx).ctrl1,
          rxctrl1_out(15 downto 4) => open,
          rxctrl2_out(3 downto 0)  => sl_rx_ctrl_o(idx).ctrl2,
          rxctrl2_out(7 downto 4)  => open,
          rxctrl3_out(3 downto 0)  => sl_rx_ctrl_o(idx).ctrl3,
          rxctrl3_out(7 downto 4)  => open,
          rx_slide_i               => sl_rx_slide_i(idx),
          mgt_word_i               => sl_tx_mgt_word_array_i(idx),
          mgt_word_o               => sl_rx_mgt_word_array_o(idx),
          rxp_i                    => sl_mgt_rx_p(idx),
          rxn_i                    => sl_mgt_rx_n(idx),
          txp_o                    => sl_mgt_tx_p(idx),
          txn_o                    => sl_mgt_tx_n(idx),
          mgt_drp_i                => mgt_drp_i(I),
          mgt_drp_o                => mgt_drp_o(I)
          );

    end generate sl_gen;

  end generate mgt_gen;

end Behavioral;
