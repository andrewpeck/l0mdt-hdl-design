library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library xpm;
use xpm.vcomponents.all;

library work;
use work.system_types_pkg.all;
use work.constants_pkg.all;
use work.lpgbt_pkg.all;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;
use work.sector_logic_pkg.all;

library ctrl_lib;
use ctrl_lib.HAL_CORE_CTRL.all;

entity mgt_wrapper is
  port(

    -- Clock
    clocks : in system_clocks_rt;

    -- Reset
    reset : in std_logic;

    -- AXI Control
    ctrl : in  HAL_CORE_MGT_CTRL_t;
    mon  : out HAL_CORE_MGT_MON_t;

    -- Refclk Inputs
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- LPGBT (CSM Downlink)
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
    -- FELIX
    --------------------------------------------------------------------------------

    -- -- Rxslide from LPGBT rx core
    -- felix_rxslide_i : in std_logic_vector (c_NUM_FELIX_DOWNLINKS-1 downto 0);
    --

    -- -- 32 bits / clock from mgt
    -- felix_downlink_mgt_word_array_o : out std32_array_t (c_NUM_FELIX_DOWNLINKS-1 downto 0);
    felix_mgt_rxusrclk_o : out std_logic_vector (c_NUM_FELIX_DOWNLINKS-1 downto 0);

    -- 64 bits / clock to mgt
    felix_uplink_mgt_word_array_i : in  std64_array_t (c_NUM_FELIX_UPLINKS-1 downto 0);
    felix_mgt_txusrclk_o          : out std_logic_vector (c_NUM_FELIX_UPLINKS-1 downto 0);

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

  -- n.b. these are just dummy signals.. the actual connections are inferred by Xilinx based on LOC
  -- constraints placed on the GTH/Y primitives. They don't actually connect to anything and can be
  -- removed

  signal reset_tree : std_logic_vector (c_NUM_MGTS-1 downto 0) := (others => '1');

  attribute DONT_TOUCH               : string;
  attribute DONT_TOUCH of reset_tree : signal is "true";

  signal refclk : std_logic_vector (c_NUM_REFCLKS-1 downto 0);

  -- FIXME: initialize these so that uninstantiated MGTs will show DEADBEEF or something
  signal tx_resets : mgt_reset_rt_array (c_NUM_MGTS-1 downto 0);
  signal rx_resets : mgt_reset_rt_array (c_NUM_MGTS-1 downto 0);
  signal drp_i     : mgt_drp_in_rt_array (c_NUM_MGTS-1 downto 0);
  signal drp_o     : mgt_drp_out_rt_array (c_NUM_MGTS-1 downto 0);
  signal status    : mgt_status_rt_array (c_NUM_MGTS-1 downto 0);

begin

  assert false report
    "GENERATING " & integer'image(c_NUM_MGTS) & "MGT LINKS:" severity note;

  --------------------------------------------------------------------------------
  -- Reset Tree
  --------------------------------------------------------------------------------

  reset_fanout : process (clocks.freeclock) is
  begin  -- process reset_fanout
    if rising_edge(clocks.freeclock) then  -- rising clock edge
      reset_tree <= (others => reset);
    end if;
  end process reset_fanout;

  --------------------------------------------------------------------------------
  -- Refclk
  --------------------------------------------------------------------------------

  refclk_gen : for I in 0 to c_NUM_REFCLKS-1 generate

    nil_mask : if (c_REFCLK_MAP(I).FREQ /= REF_NIL) generate

      assert false
        report "GENERATING REFCLK IBUF=" & integer'image(I) severity note;

      -- 2'b00: ODIV2 = O
      -- 2'b01: ODIV2 = Divide-by-2 version of O
      -- 2'b10: ODIV2 = 1'b0
      -- 2'b11: Reserved
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
    end generate;

  end generate;

  --------------------------------------------------------------------------------
  -- AXI
  --------------------------------------------------------------------------------

  axi_map_gen : for I in 0 to c_NUM_MGTS-1 generate
  begin

    drp_i(I).drpclk_in(0) <= clocks.axiclock;  -- 50MHz from MMCM

    -- some of these are crossing clock domains so add one ff to help metastability
    process (clocks.axiclock) is
    begin
      if (rising_edge(clocks.axiclock)) then
        mon.mgt(I).status.rxcdr_stable            <= status(I).rxcdr_stable;
        mon.mgt(I).status.powergood               <= status(I).powergood;
        mon.mgt(I).status.txready                 <= status(I).txready;
        mon.mgt(I).status.rxready                 <= status(I).rxready;
        mon.mgt(I).status.rx_pma_reset_done       <= status(I).rx_pma_reset_done;
        mon.mgt(I).status.tx_pma_reset_done       <= status(I).tx_pma_reset_done;
        mon.mgt(I).status.tx_reset_done           <= status(I).tx_reset_done;
        mon.mgt(I).status.rx_reset_done           <= status(I).rx_reset_done;
        mon.mgt(I).status.buffbypass_tx_done_out  <= status(I).buffbypass_tx_done_out;
        mon.mgt(I).status.buffbypass_tx_error_out <= status(I).buffbypass_tx_error_out;
        mon.mgt(I).status.buffbypass_rx_done_out  <= status(I).buffbypass_rx_done_out;
        mon.mgt(I).status.buffbypass_rx_error_out <= status(I).buffbypass_rx_error_out;

        mon.mgt(I).drp.rd_data <= drp_o(I).drpdo_out;
        mon.mgt(I).drp.rd_rdy  <= drp_o(I).drprdy_out(0);

        drp_i(I).drpaddr_in   <= ctrl.mgt(I).drp.wr_addr;
        drp_i(I).drpdi_in     <= ctrl.mgt(I).drp.wr_data;
        drp_i(I).drpen_in(0)  <= ctrl.mgt(I).drp.en;
        drp_i(I).drpwe_in(0)  <= ctrl.mgt(I).drp.wr_en;

        tx_resets(I).reset                  <= ctrl.mgt(I).tx_resets.reset;
        tx_resets(I).reset_pll_and_datapath <= ctrl.mgt(I).tx_resets.reset_pll_and_datapath;
        tx_resets(I).reset_datapath         <= ctrl.mgt(I).tx_resets.reset_datapath;
        tx_resets(I).reset_bufbypass        <= ctrl.mgt(I).tx_resets.reset_bufbypass;

        rx_resets(I).reset                  <= ctrl.mgt(I).rx_resets.reset;
        rx_resets(I).reset_pll_and_datapath <= ctrl.mgt(I).rx_resets.reset_pll_and_datapath;
        rx_resets(I).reset_datapath         <= ctrl.mgt(I).rx_resets.reset_datapath;

      end if;
    end process;

    notfelix_gen : if (felix_idx_array(I) = -1) generate
      process (clocks.axiclock) is
      begin
        if (rising_edge(clocks.axiclock)) then
          rx_resets(I).reset_bufbypass <= ctrl.mgt(I).rx_resets.reset_bufbypass;
        end if;
      end process;
    end generate;

  end generate;

  --------------------------------------------------------------------------------
  -- MGTS
  --------------------------------------------------------------------------------

  mgt_gen : for I in 0 to c_NUM_MGTS-1 generate
  begin

    assert false report
      "GENERATING MGT=" & integer'image(I) &
      " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) severity note;
    -- assert (c_MGT_MAP(I).refclk /= -1) and (c_MGT_MAP(I).refclk < c_NUM_REFCLKS)
    -- report "invalid refclk selected" severity error;

    --------------------------------------------------------------------------------
    -- LPGBT Type
    --------------------------------------------------------------------------------

    lpgbt_gen : if (lpgbt_idx_array(I) /= -1) generate

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_INST : label is "true";

      constant downlink_idx : integer := lpgbt_downlink_idx_array(I);
      constant uplink_idx   : integer := lpgbt_uplink_idx_array(I);

      signal downlink_data : std_logic_vector (31 downto 0);

      signal rx_p, rx_n, tx_p, tx_n : std_logic;

    begin

      downlink_data <= lpgbt_downlink_mgt_word_array_i(downlink_idx)
                       when (downlink_idx /= -1) else x"00000000";

      --------------------------------------------------------------------------------
      --
      --------------------------------------------------------------------------------

      assert (c_NUM_CSM_UPLINKS mod 2 = 0)
        report "# of CSM uplinks must be even, because a CSM is always 2+1" &
        "(c_NUM_CSM_UPLINKS=" & integer'image(c_NUM_CSM_UPLINKS) &
        " c_NUM_CSM_DOWNLINKS=)" & integer'image(c_NUM_CSM_DOWNLINKS)
        severity error;

      assert (c_NUM_CSM_UPLINKS/2 = c_NUM_CSM_DOWNLINKS)
        report "# of CSM Uplinks must be 2x the # of downlinks" & integer'image(c_NUM_CSM_UPLINKS) &
        "\nc_NUM_CSM_DOWNLINKS=" & integer'image(c_NUM_CSM_DOWNLINKS)
        severity error;

      assert false report "GENERATING LPGBT TYPE LINK ON MGT=" & integer'image(I)
        & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk)
        & " LPGBT_LINK_CNT=" & integer'image(lpgbt_idx_array(I)) severity note;

      assert false report "downlink_idx=" & integer'image(downlink_idx) severity note;

      assert false report "uplink_idx=" & integer'image(uplink_idx) severity note;

      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC320)
        report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

      MGT_INST : entity work.mgt_10g24_wrapper
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
          status_o              => status(I),
          mgt_word_i            => downlink_data,
          mgt_word_o            => lpgbt_uplink_mgt_word_array_o(uplink_idx),
          rxp_i                 => rx_p,
          rxn_i                 => rx_n,
          txp_o                 => tx_p,
          txn_o                 => tx_n,
          mgt_drp_i             => drp_i(I),
          mgt_drp_o             => drp_o(I)
          );

    end generate lpgbt_gen;

    --------------------------------------------------------------------------------
    -- LPGBT Emulator Type
    --------------------------------------------------------------------------------

    emul_gen : if (emul_idx_array(I) /= -1) generate

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_INST : label is "true";

      constant idx : integer := emul_idx_array(I);

      signal rx_p, rx_n, tx_p, tx_n : std_logic;

    begin

      assert false report
        "GENERATING LPGBT EMULATOR LINK ON MGT=" & integer'image(I)
        & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk)
        & " LPGBT_LINK_CNT=" & integer'image(idx) severity note;

      assert false report "link_idx=" & integer'image(idx) severity note;

      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC320)
        report "Incompatible REFCLK selected on MGT#"
        & integer'image(I) severity error;

      MGT_INST : entity work.mgt_10g24_wrapper
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
          status_o              => status(I),
          mgt_word_i            => lpgbt_emul_uplink_mgt_word_array_i(idx),
          mgt_word_o            => lpgbt_emul_downlink_mgt_word_array_o(idx),
          rxp_i                 => rx_p,
          rxn_i                 => rx_n,
          txp_o                 => tx_p,
          txn_o                 => tx_n,
          mgt_drp_i             => drp_i(I),
          mgt_drp_o             => drp_o(I)
          );

    end generate emul_gen;

    --------------------------------------------------------------------------------
    -- Sector Logic Type
    --------------------------------------------------------------------------------

    sl_gen : if (sl_idx_array(I) /= -1) generate

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_INST : label is "true";

      constant idx : integer := sl_idx_array(I);

      signal rx_p, rx_n, tx_p, tx_n : std_logic;

    begin

      assert false report
        "GENERATING SECTOR LOGIC TYPE LINK ON MGT=" & integer'image(I)
        & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk)
        & " SL_LINK_CNT=" & integer'image(idx) severity note;

      assert (c_NUM_SECTOR_LOGIC_INPUTS = c_NUM_SECTOR_LOGIC_OUTPUTS)
        report "We only support symmetric # of SL inputs / outputs" severity error;
      assert (idx <= c_NUM_SECTOR_LOGIC_OUTPUTS)
        report "conflict between # of sl links in board file and c_NUM_SECTOR_LOGIC_DOWNLINKS" severity error;
      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC240)
        report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

      MGT_INST : entity work.mgt_sl_wrapper
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
          status_o                 => status(I),
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
          rxp_i                    => rx_p,
          rxn_i                    => rx_n,
          txp_o                    => tx_p,
          txn_o                    => tx_n,
          mgt_drp_i                => drp_i(I),
          mgt_drp_o                => drp_o(I)
          );

    end generate sl_gen;

    --------------------------------------------------------------------------------
    -- Felix Link Type
    --------------------------------------------------------------------------------

    -- only generate per-QUAD for these
    felix_gen : if (felix_idx_array(I) /= -1 and (I mod 4 = 0)) generate

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_INST : label is "true";

      constant idx : integer := felix_idx_array(I);

      signal rxoutclk                     : std_logic_vector (3 downto 0);
      signal txoutclk                     : std_logic_vector (3 downto 0);
      signal rxusrclk                     : std_logic_vector (3 downto 0);
      signal txusrclk                     : std_logic_vector (3 downto 0);
      signal txoutclk_bufg, rxoutclk_bufg : std_logic;
      signal rx_cesync, rx_clrsync        : std_logic;
      signal tx_cesync, tx_clrsync        : std_logic;
      signal tx_usrclk_active             : std_logic;
      signal rx_usrclk_active             : std_logic;
      signal felix_rx_usrclk_reset        : std_logic := '0';  -- FIXME connect to AXI?
      signal felix_tx_usrclk_reset        : std_logic := '0';  -- FIXME connect to AXI?

      signal rxslide : std_logic_vector (3 downto 0);
      signal words_o : std32_array_t (3 downto 0);

      signal rx_p, rx_n : std_logic_vector (3 downto 0);
      signal tx_p, tx_n : std_logic_vector (3 downto 0);

    begin

      assert false report
        "GENERATING FELIX LINK ON MGT=" & integer'image(I) &
        " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) &
        " FELIX_LINK_CNT=" & integer'image(idx) severity note;

      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_FELIX)
        report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

      MGT_INST : entity work.mgt_felix_wrapper
        generic map (index => I, gt_type => c_MGT_MAP(I).gt_type)
        port map (
          free_clock            => clocks.freeclock,
          reset                 => '0',              -- FIXME: how to reset? due to recovered clock...
          mgt_refclk_i          => refclk(c_MGT_MAP(I).refclk),
          tx_resets_i           => tx_resets(I),
          rx_resets_i           => rx_resets(I),
          mgt_rxslide_i         => (others => '0'),  --(others => lpgbt_rxslide_i (c_FELIX_LPGBT_INDEX)),  -- FIXME: should zero the others that aren't used
          status_o              => status(I+3 downto I),
          mgt_words_i           => felix_uplink_mgt_word_array_i(idx+3 downto idx),
          mgt_words_o           => words_o,
          tx_header_i           => (others => '0'),  -- something to do with 64/67
          tx_sequence_i         => (others => '0'),  -- ditto
          mgt_txoutclk_o        => txoutclk (3 downto 0),
          mgt_rxoutclk_o        => rxoutclk (3 downto 0),
          mgt_txusrclk_i        => txusrclk (3 downto 0),
          mgt_rxusrclk_i        => rxusrclk (3 downto 0),
          mgt_rxusrclk_active_i => rx_usrclk_active,
          mgt_txusrclk_active_i => tx_usrclk_active,
          rxp_i                 => rx_p,
          rxn_i                 => rx_n,
          txp_o                 => tx_p,
          txn_o                 => tx_n,
          mgt_drp_i             => drp_i(I+3 downto I),
          mgt_drp_o             => drp_o(I+3 downto I)
          );

      -- for the felix link selected as the RECCLK_SRC, connect its output to a bufg_gt
      -- and connect it to the lpgbt decoder

      mgtout_assign_loop : for J in 0 to 3 generate
        matchgen : if (idx+J = c_FELIX_RECCLK_SRC) generate

          --lpgbt_uplink_mgt_word_array_o(c_FELIX_LPGBT_INDEX) <= words_o (J);

          BUFG_GT_SYNC_rx_inst : BUFG_GT_SYNC
            port map (
              CESYNC  => rx_cesync,     -- 1-bit output: Synchronized CE
              CLRSYNC => rx_clrsync,    -- 1-bit output: Synchronized CLR
              CE      => '1',           -- 1-bit input: Asynchronous enable
              CLK     => rxoutclk(J),   -- 1-bit input: Clock
              CLR     => reset_tree(I)  -- tie to gtwiz_usrclk_rx_reset_in
              );

          RXBUFG_inst : BUFG_GT
            port map (
              CLR     => rx_clrsync,
              CE      => rx_cesync,
              CEMASK  => '0',
              CLRMASK => '0',
              DIV     => "000",
              I       => rxoutclk(J),
              O       => rxoutclk_bufg
              );

          felix_mgt_rxusrclk_o(0) <= rxoutclk_bufg;

        end generate;
      end generate;

      -- Assign RX userclocks
      rxusrclk <= (others => rxoutclk_bufg);

      -- rx active process
      p_userclk_rx_active : process (rxoutclk_bufg, felix_rx_usrclk_reset) is
        variable r, rr : std_logic := '0';
      begin
        if (felix_rx_usrclk_reset = '1') then
          r  := '0';
          rr := '0';
        elsif rising_edge(rxoutclk_bufg) then
          r  := '1';
          rr := r;
        end if;
        rx_usrclk_active <= not rr;
      end process p_userclk_rx_active;

      -- The RX buffer bypass controller helper block should be held in reset until the RX user
      -- clocking network helper block which drives it is active
      bufbypass_rst_bit_synchronizer : xpm_cdc_sync_rst
        generic map (DEST_SYNC_FF => 2, INIT => 1, INIT_SYNC_FF => 1)
        port map (
          dest_clk => rxoutclk_bufg,
          dest_rst => rx_resets(I).reset_bufbypass,
          src_rst  => not rx_usrclk_active);

      -- UltraScale+ devices also have 24 BUFG_GTs but they have 14 BUFG_GT_SYNCs per GT Quad
      --
      -- The output clocks of the BUFG_GTs connected to the same input clock are synchronized (phase
      -- aligned) to each other when coming out of reset (CLR) or on CE assertion.
      --
      -- If the USRCLK/2 are both at the same frequency you can drive an MMCM with the ODIV2 output
      -- of the IBUFDS_GTE to create the USRCLKS as long as the link is synchronous.
      --
      -- Some applications still require the use of an MMCM to generate complex non-integer clock
      -- division of the GT output clocks or the IBUFDS_GTE3/ODIV2 reference clock. In these cases,
      -- a BUFG_GT must directly drive the MMCM.
      --
      -- GTs have no other direct, dedicated connections to other clock resources. However, they can
      -- connect to the CMT via the BUFG_GT and the clock routing resources.

      txusrclk(3 downto 0)                    <= (others => txoutclk_bufg);
      felix_mgt_txusrclk_o (idx+3 downto idx) <= txusrclk;

      BUFG_GT_SYNC_tx_inst : BUFG_GT_SYNC
        port map (
          CESYNC  => tx_cesync,         -- 1-bit output: Synchronized CE
          CLRSYNC => tx_clrsync,        -- 1-bit output: Synchronized CLR
          CE      => '1',               -- 1-bit input: Asynchronous enable
          CLK     => txoutclk(0),       -- 1-bit input: Clock
          CLR     => reset_tree(I)      -- tie to gtwiz_usrclk_tx_reset_in
          );

      TXBUFG_inst : BUFG_GT
        port map (
          CLR     => tx_clrsync,
          CE      => tx_cesync,
          CEMASK  => '0',
          CLRMASK => '0',
          DIV     => "000",
          I       => txoutclk(0),
          O       => txoutclk_bufg
          );

      -- TODO: move into wrappers
      -- tx active process
      p_userclk_tx_active : process (txoutclk_bufg, felix_tx_usrclk_reset) is
        variable r, rr : std_logic := '0';
      begin
        if (felix_tx_usrclk_reset = '1') then
          r  := '0';
          rr := '0';
        elsif rising_edge(txoutclk_bufg) then
          r  := '1';
          rr := r;
        end if;
        tx_usrclk_active <= not rr;
      end process p_userclk_tx_active;

    end generate felix_gen;

  end generate mgt_gen;

end Behavioral;
