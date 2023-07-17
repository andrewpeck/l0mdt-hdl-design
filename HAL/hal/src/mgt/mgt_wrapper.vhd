library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library xpm;
use xpm.vcomponents.all;

use work.system_types_pkg.all;
use work.constants_pkg.all;
use work.lpgbt_pkg.all;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;
use work.sector_logic_pkg.all;
use work.display_board_cfg_pkg.all;

library ctrl_lib;
use ctrl_lib.CORE_CTRL.all;

entity mgt_wrapper is
  port(

    -- Clock
    clocks : in system_clocks_rt;

    -- Reset
    reset : in std_logic;

    -- AXI Control
    ctrl : in  CORE_MGT_CTRL_t;
    mon  : out CORE_MGT_MON_t;

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
    -- this is just an array of LPGBT uplink data *in mgt order*
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
    -- TTC
    --------------------------------------------------------------------------------

    -- Rxslide from LPGBT rx core
    ttc_bitslip_i  : in  std_logic;
    ttc_mgt_word_i : in  std_logic_vector (31 downto 0);
    ttc_mgt_word_o : out std_logic_vector (31 downto 0);
    ttc_recclk_o   : out std_logic;

    --------------------------------------------------------------------------------
    -- Felix
    --------------------------------------------------------------------------------

    -- 32 bits / clock to mgt
    felix_uplink_mgt_word_array_i : in  std32_array_t (c_NUM_FELIX_UPLINKS-1 downto 0);
    felix_mgt_txusrclk_o          : out std_logic_vector (c_NUM_FELIX_UPLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Sector Logic
    --------------------------------------------------------------------------------

    -- 32 bits / bx
    sl_tx_mgt_word_array_i : in  std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);  -- TO mgt
    sl_rx_mgt_word_array_o : out std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);   -- FROM mgt

    -- clocks
    sl_tx_clk : out std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    sl_rx_clk : out std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    -- control
    sl_tx_ctrl_i  : in  sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    sl_rx_ctrl_o  : out sl_rx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    sl_rx_slide_i : in  std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- reset
    sl_re_channel : in std_logic_vector(c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    
    -- done
    sl_rx_init_done : out std_logic

    );
end mgt_wrapper;

architecture Behavioral of mgt_wrapper is

  -- fanout input reset for better timing
  signal reset_tree : std_logic_vector (c_NUM_MGTS-1 downto 0) := (others => '1');
  signal sl_rx_init_done_s : std_logic_vector(c_NUM_MGTS-1 downto 0);

  attribute DONT_TOUCH               : string;
  attribute DONT_TOUCH of reset_tree : signal is "true";

  signal refclk         : std_logic_vector (c_NUM_REFCLKS-1 downto 0);
  signal refclk_mirrors : std_logic_vector (c_NUM_REFCLKS-1 downto 0);
  signal refclk_bufg    : std_logic_vector (c_NUM_REFCLKS-1 downto 0);
  signal recclk         : std_logic;

  -- TODO: initialize these so that uninstantiated MGTs will show DEADBEEF or something
  -- Dynamic Reconfiguration port signals
  signal drp_i     : mgt_drp_in_rt_array (c_NUM_MGTS-1 downto 0);
  signal drp_o     : mgt_drp_out_rt_array (c_NUM_MGTS-1 downto 0);
  -- Status signals
  signal status    : mgt_status_rt_array (c_NUM_MGTS-1 downto 0);
  signal status_d  : mgt_status_rt_array (c_NUM_MGTS-1 downto 0);
  signal status_2d : mgt_status_rt_array (c_NUM_MGTS-1 downto 0);

begin

  sl_rx_init_done <= AND(sl_rx_init_done_s);

  assert false report
    "GENERATING " & integer'image(c_NUM_MGTS) & "MGT LINKS:" severity note;

  assert (c_NUM_CSM_UPLINKS mod 2 = 0)
    report "# of CSM uplinks must be even, because a CSM is always 2+1" &
    "(c_NUM_CSM_UPLINKS=" & integer'image(c_NUM_CSM_UPLINKS) &
    " c_NUM_CSM_DOWNLINKS=)" & integer'image(c_NUM_CSM_DOWNLINKS)
    severity error;

  assert (c_NUM_CSM_UPLINKS/2 = c_NUM_CSM_DOWNLINKS)
    report "# of CSM Uplinks must be 2x the # of downlinks"
    & "\n  c_NUM_CSM_UPLINKS=" & integer'image(c_NUM_CSM_UPLINKS)
    & "\n  c_NUM_CSM_DOWNLINKS=" & integer'image(c_NUM_CSM_DOWNLINKS)
    severity error;

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
  -- recclk
  --------------------------------------------------------------------------------

   recclk_BUFG_inst : BUFG
   port map (
     O => ttc_recclk_o,                 -- 1-bit output: Clock output
     I => recclk                        -- 1-bit input: Clock input
   );

  --------------------------------------------------------------------------------
  -- Refclk
  --------------------------------------------------------------------------------

  refclk_gen : for I in 0 to c_NUM_REFCLKS-2 generate

    nil_mask : if (c_REFCLK_MAP(I).FREQ /= REF_NIL and
                   c_REFCLK_MAP(I).FREQ /= REF_SYNC240  -- SL has its own buffer
                   ) generate

      assert true
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
          ODIV2 => refclk_mirrors(I),
          CEB   => '0',
          I     => refclk_i_p(I),
          IB    => refclk_i_n(I)
          );
    end generate;

  end generate;

  --------------------------------------------------------------------------------
  -- Buffering
  --------------------------------------------------------------------------------

  process (clocks.axiclock) is
  begin
    if (rising_edge(clocks.axiclock)) then
      status_d                                  <= status;
      status_2d                                 <= status_d;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- AXI Register Decoding
  --------------------------------------------------------------------------------

  axi_map_gen : for I in 0 to c_NUM_MGTS-1 generate
  begin

    mon.mgt(I).config.mgt_type <= std_logic_vector(to_unsigned(mgt_types_t'POS(c_MGT_MAP(I).mgt_type), 3));
    mon.mgt(I).config.refclk   <= std_logic_vector(to_unsigned(c_MGT_MAP(I).refclk, 5));
    mon.mgt(I).config.gt_type  <= std_logic_vector(to_unsigned(gt_types_t'POS(c_MGT_MAP(I).gt_type), 2));
    mon.mgt(I).config.x_loc    <= std_logic_vector(to_unsigned(c_MGT_MAP(I).x_loc, 2));
    mon.mgt(I).config.y_loc    <= std_logic_vector(to_unsigned(c_MGT_MAP(I).y_loc, 6));

    drp_i(I).drpclk_in(0) <= clocks.axiclock;  -- 50MHz from MMCM

    -- some of these are crossing clock domains so add one ff to help metastability
    process (clocks.axiclock) is
    begin
      if (rising_edge(clocks.axiclock)) then

        mon.mgt(I).status.rxcdr_stable            <= status_2d(I).rxcdr_stable;
        mon.mgt(I).status.powergood               <= status_2d(I).powergood;
     -- mon.mgt(I).status.txready                 <= status_2d(I).txready;
     -- mon.mgt(I).status.rxready                 <= status_2d(I).rxready;
        mon.mgt(I).status.rx_pma_reset_done       <= status_2d(I).rx_pma_reset_done;
        mon.mgt(I).status.tx_pma_reset_done       <= status_2d(I).tx_pma_reset_done;
        mon.mgt(I).status.tx_reset_done           <= status_2d(I).tx_reset_done;
        mon.mgt(I).status.rx_reset_done           <= status_2d(I).rx_reset_done;
        mon.mgt(I).status.buffbypass_tx_done_out  <= status_2d(I).buffbypass_tx_done_out;
        mon.mgt(I).status.buffbypass_tx_error_out <= status_2d(I).buffbypass_tx_error_out;
     -- mon.mgt(I).status.buffbypass_rx_done_out  <= status_2d(I).buffbypass_rx_done_out;
     -- mon.mgt(I).status.buffbypass_rx_error_out <= status_2d(I).buffbypass_rx_error_out;

        mon.mgt(I).drp.rd_data <= drp_o(I).drpdo_out;
        mon.mgt(I).drp.rd_rdy  <= drp_o(I).drprdy_out;

        drp_i(I).drpaddr_in  <= ctrl.mgt(I).drp.wr_addr;
        drp_i(I).drpdi_in    <= ctrl.mgt(I).drp.wr_data;
        drp_i(I).drpen_in(0) <= ctrl.mgt(I).drp.en;
        drp_i(I).drpwe_in(0) <= ctrl.mgt(I).drp.wr_en;

      end if;
    end process;

  end generate;

  --------------------------------------------------------------------------------
  -- MGTS
  --------------------------------------------------------------------------------

  mgt_gen : for I in 0 to c_NUM_MGTS-1 generate
  begin

    cfggen : if (I=0) generate
      display_board_cfg(true);
    end generate;

    assert true report
      "GENERATING MGT=" & integer'image(I) &
      " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) severity note;

    --------------------------------------------------------------------------------
    -- LPGBT+Emulator+Felix Type Transceiver Generation
    --------------------------------------------------------------------------------
    -- Get lpgbt signals in group of four and excldue the not-active 
    lpgbt_gen : if ((I mod 4 = 0) and c2c_idx_array(I) = -1 and sl_idx_array(I) = -1 and
                    c_MGT_MAP(I).mgt_type /= MGT_NIL and
                    (ttc_idx_array(I) /= -1 or ttc_idx_array(I+1) /= -1 or
                     ttc_idx_array(I+2) /= -1 or ttc_idx_array(I+3) /= -1 or
                     lpgbt_idx_array(I) /= -1 or emul_idx_array(I) /= -1 or
                     felix_idx_array(I) /= -1 ))
    generate

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_INST : label is "true";

      signal rx_p, rx_n, tx_p, tx_n : std_logic_vector(3 downto 0) := (others => '0');

      signal rxslide  : std_logic_vector (3 downto 0) := (others => '0');
      signal rxoutclk : std_logic_vector (3 downto 0) := (others => '0');

      -- data
      signal tx_data : std32_array_t (3 downto 0);
      signal rx_data : std32_array_t (3 downto 0);

    begin

      mon.mgt(I).config.is_active <= '1';

      --------------------------------------------------------------------------------
      -- MGT
      --------------------------------------------------------------------------------

      MGT_INST : entity work.mgt_10g24_wrapper
        generic map (index => I, gt_type => c_MGT_MAP(I).gt_type)
        port map (

          --------------------------------------------------------------------------------
          -- MGT data
          --------------------------------------------------------------------------------

          -- parallel data
          mgt_word_i => tx_data (3 downto 0),
          mgt_word_o => rx_data (3 downto 0),

          -- dummy signals for mgts
          rxp_i => rx_p (3 downto 0),
          rxn_i => rx_n (3 downto 0),
          txp_o => tx_p (3 downto 0),
          txn_o => tx_n (3 downto 0),

          rx_slide_i => rxslide,

          --------------------------------------------------------------------------------
          -- resets
          --------------------------------------------------------------------------------

          reset => reset_tree(I),

          reset_pll_and_datapath_i => ctrl.mgt(I).tx_resets.reset_pll_and_datapath or
                                      ctrl.mgt(I+1).tx_resets.reset_pll_and_datapath or
                                      ctrl.mgt(I+2).tx_resets.reset_pll_and_datapath or
                                      ctrl.mgt(I+3).tx_resets.reset_pll_and_datapath,

          reset_datapath_i => ctrl.mgt(I).tx_resets.reset_datapath or
                              ctrl.mgt(I+1).tx_resets.reset_datapath or
                              ctrl.mgt(I+2).tx_resets.reset_datapath or
                              ctrl.mgt(I+3).tx_resets.reset_datapath,

          reset_rx_pll_and_datapath_i => ctrl.mgt(I).rx_resets.reset_pll_and_datapath or
                                         ctrl.mgt(I+1).rx_resets.reset_pll_and_datapath or
                                         ctrl.mgt(I+2).rx_resets.reset_pll_and_datapath or
                                         ctrl.mgt(I+3).rx_resets.reset_pll_and_datapath,

          reset_rx_datapath_i        => '0',
          buffbypass_tx_reset_i      => '0',
          buffbypass_tx_start_user_i => '0',

          --------------------------------------------------------------------------------
          -- clocks
          --------------------------------------------------------------------------------

          -- drp clock
          free_clock => clocks.freeclock,

          -- refclks
          refclk0_i => refclk(c_MGT_MAP(I).refclk),
          refclk1_i => refclk(c_MGT_MAP(I).refclk),

          -- user clocks
          mgt_rxusrclk_i        => clocks.clock320,
          mgt_txusrclk_i        => clocks.clock320,
          mgt_rxusrclk_active_i => clocks.lhc_locked,  -- FIXME: this should come from something else for the felix link
          mgt_txusrclk_active_i => clocks.lhc_locked,

          -- outputs
          qpll0outclk_out    => open,
          qpll0outrefclk_out => open,
          qpll1outclk_out    => open,
          qpll1outrefclk_out => open,

          rxoutclk => rxoutclk(3 downto 0),

          --------------------------------------------------------------------------------
          -- DRP & Status
          --------------------------------------------------------------------------------

          mgt_drp_i => drp_i(I+3 downto I),
          mgt_drp_o => drp_o(I+3 downto I),
          status_o  => status(I+3 downto I)
          );

      --------------------------------------------------------------------------------
      -- with transceivers generated... loop over the 4 individual channels in a
      -- quad and assign them to the relevant types
      --------------------------------------------------------------------------------

      channel_loop : for LINK_0_TO_3 in 0 to 3 generate
      begin

        --------------------------------------------------------------------------------
        -- LPGBT CSM
        --------------------------------------------------------------------------------

        csm_gen : if (lpgbt_idx_array(I+LINK_0_TO_3) /= -1) generate
          constant downlink_idx : integer := lpgbt_downlink_idx_array(I+LINK_0_TO_3);
          constant uplink_idx   : integer := lpgbt_uplink_idx_array(I+LINK_0_TO_3);
        begin

          -- only have downlinks on every other TX channel
          -- TODO: mirror them for symmetry??
          dlgen : if (downlink_idx /= -1) generate
            tx_data(LINK_0_TO_3) <= lpgbt_downlink_mgt_word_array_i(downlink_idx);
          end generate;
          nodlgen : if (downlink_idx = -1) generate
            tx_data(LINK_0_TO_3) <= (others => '0');
          end generate;

          -- assign uplinks data and rxslide
          lpgbt_uplink_mgt_word_array_o(uplink_idx) <= rx_data(LINK_0_TO_3);
          rxslide(LINK_0_TO_3) <= lpgbt_rxslide_i(uplink_idx);

          assert false report "Assigning LPGBT type link on MGT=" & integer'image(I)
            & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk)
            & " LPGBT_LINK_CNT=" & integer'image(lpgbt_idx_array(I)) severity note;
          assert false report "downlink_idx=" & integer'image(downlink_idx) severity note;
          assert false report "uplink_idx=" & integer'image(uplink_idx) severity note;

          assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC320)
            report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

        end generate;

        --------------------------------------------------------------------------------
        -- Emulator LPGBT
        --------------------------------------------------------------------------------

        emul_gen : if (emul_idx_array(I+LINK_0_TO_3) /= -1) generate
          constant downlink_idx : integer := emul_idx_array(I+LINK_0_TO_3);
          constant uplink_idx   : integer := emul_idx_array(I+LINK_0_TO_3);
        begin

          tx_data(LINK_0_TO_3) <= lpgbt_emul_uplink_mgt_word_array_i(downlink_idx+LINK_0_TO_3);
          rxslide(LINK_0_TO_3) <= lpgbt_emul_rxslide_i(uplink_idx+LINK_0_TO_3);

          lpgbt_emul_downlink_mgt_word_array_o(uplink_idx+LINK_0_TO_3) <= rx_data(LINK_0_TO_3);

        end generate;

        --------------------------------------------------------------------------------
        -- FELIX LPGBT (to be moved to full-mode connection)
        --------------------------------------------------------------------------------

        felix_gen : if (ttc_idx_array(I) /= -1) generate
          constant downlink_idx : integer := ttc_idx_array(I);
        begin

          -- FELIX Recovered Clock
          tx_data(LINK_0_TO_3)  <= ttc_mgt_word_i;
          recclk_out_gen : if (downlink_idx + LINK_0_TO_3 = c_FELIX_RECCLK_SRC) generate
            rxslide (LINK_0_TO_3) <= ttc_bitslip_i;
            recclk                <= rxoutclk(LINK_0_TO_3);
            ttc_mgt_word_o        <= rx_data(LINK_0_TO_3);
          end generate;

        end generate;


      end generate;
    end generate;

    --------------------------------------------------------------------------------
    -- Sector Logic Type
    --------------------------------------------------------------------------------

    sl_gen : if (sl_idx_array(I) /= -1 and (I mod 4 = 0)) generate  -- only generate for the quad

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_INST : label is "true";

      constant idx : integer := sl_idx_array(I);

      signal rx_p, rx_n, tx_p, tx_n : std_logic_vector(3 downto 0) := (others => '0');

    begin

      mon.mgt(I).config.is_active <= '1';

      assert true report
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
          clock          => clocks.freeclock,  -- FIXME: check this clock frequency against IP core
          reset_i        => reset_tree(I),
          mgt_refclk_i_p => refclk_i_p(c_MGT_MAP(I).refclk),
          mgt_refclk_i_n => refclk_i_n(c_MGT_MAP(I).refclk),
          rxoutclk       => sl_rx_clk(idx + 3 downto idx),
          txoutclk       => sl_tx_clk(idx + 3 downto idx),
          status_o       => status(I+3 downto I),
          txctrl_in      => sl_tx_ctrl_i(idx+3 downto idx),
          rxctrl_out     => sl_rx_ctrl_o(idx+3 downto idx),
          rx_slide_i     => sl_rx_slide_i(idx+3 downto idx),
          re_channel_i   => sl_re_channel(idx+3 downto idx),
          rx_init_done_o => sl_rx_init_done_s(I),
          mgt_word_i     => sl_tx_mgt_word_array_i(idx+3 downto idx),
          mgt_word_o     => sl_rx_mgt_word_array_o(idx+3 downto idx),
          rxp_i          => rx_p,
          rxn_i          => rx_n,
          txp_o          => tx_p,
          txn_o          => tx_n,
          mgt_drp_i      => drp_i(I+3 downto I),
          mgt_drp_o      => drp_o(I+3 downto I)
          );

    end generate sl_gen;

  end generate mgt_gen;

  --------------------------------------------------------------------------------
  -- Refclk Monitors
  --------------------------------------------------------------------------------

  refclk_mirror : for I in 0 to c_NUM_REFCLKS-2 generate
    signal clk_freq : std_logic_vector (31 downto 0) := (others => '0');
    signal ce, clr  : std_logic;

    -- TODO: this needs to be kept up to date with whatever the axi clock
    -- frequency is, it should probably be stored somewhere in the board_pkg I
    -- think this number also gets duplicated in top_clocking.. it should really
    -- be centralized
    -- Move to a package
    constant axi_refclk_freq : integer := 50_000_000;

  begin

    -- NOTE: the AXI C2C conflicts with this and generates an error, so only
    -- measure the freq of other clocks. It doesn't make sense anyway as we use the
    -- AXI clock to monitor itself?
    axi : if (c_REFCLK_MAP(I).freq = REF_AXI_C2C) generate
      mon.refclk(I).freq <= std_logic_vector(to_unsigned(axi_refclk_freq, mon.refclk(I).freq'length));
    end generate;

    no_axi : if (c_REFCLK_MAP(I).freq /= REF_AXI_C2C) generate

      mon.refclk(I).freq        <= clk_freq(mon.refclk(I).freq'range);
      mon.refclk(I).refclk_type <=
        std_logic_vector(to_unsigned(refclk_freqs_t'POS(c_REFCLK_MAP(I).freq), 3));

      -- Despite the documentation stating that "The BUFG_GT_SYNC primitive is
      -- automatically inserted by the Vivado tools, if not present in the
      -- design.", this does not appear to be true, and required manual
      -- instantiation. Previously it would generate an error at DRC complaining
      -- that the CE/CLR pins are not driven by a BUFG_GT_SYNC.

      BUFG_GT_SYNC_inst : BUFG_GT_SYNC
        port map (
          CESYNC  => ce,                -- 1-bit output: Synchronized CE
          CLRSYNC => clr,               -- 1-bit output: Synchronized CLR
          CE      => '1',               -- 1-bit input: Asynchronous enable
          CLK     => refclk_mirrors(I), -- 1-bit input: Clock
          CLR     => '0'                -- 1-bit input: Asynchronous clear
          );

      mgtclk_img_bufg : BUFG_GT
        port map(
          I       => refclk_mirrors(I),
          O       => refclk_bufg(I),
          CE      => ce,
          DIV     => (others => '0'),
          CLR     => clr,
          CLRMASK => '0',
          CEMASK  => '0'
          );

      i_clk_frequency : entity work.clk_frequency
        generic map (
          clk_a_freq => 50_000_000
          )
        port map (
          reset => reset,
          clk_a => clocks.axiclock,
          clk_b => refclk_bufg(I),
          rate  => clk_freq
          );
    end generate;

  end generate;

end Behavioral;
