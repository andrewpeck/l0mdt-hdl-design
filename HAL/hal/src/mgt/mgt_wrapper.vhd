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

library shared_lib;
use shared_lib.common_ieee_pkg.all;

library flx;

entity mgt_wrapper is
  port(

    -- Clock
    axiclock   : in std_logic;
    clock240_i : in std_logic;
    clock320   : in std_logic;
    lhc_locked : in std_logic;
    refclk_mirrors_out    : out std_logic_vector (c_NUM_REFCLKS-1 downto 0);
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
    flx_mgt_cisk_vi   : in  std_logic_vector_array (c_NUM_FELIX_UPLINKS-1 downto 0)( 7 downto 0);
    flx_mgt_word_vi   : in  std_logic_vector_array (c_NUM_FELIX_UPLINKS-1 downto 0)(31 downto 0);
    flx_mgt_usrclk_vo : out std_logic_vector (c_NUM_FELIX_UPLINKS-1 downto 0);
    flx_mgt_word_vo   : out std_logic_vector_array (c_NUM_FELIX_UPLINKS-1 downto 0)(19 downto 0);

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
    sl_rx_init_done : out std_logic_vector(c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0)

    );
end mgt_wrapper;

architecture Behavioral of mgt_wrapper is

  -- Fanout input reset for better timing
  signal reset_tree                  : std_logic_vector (c_NUM_MGTS-1 downto 0) := (others => '1');
  attribute DONT_TOUCH               : string;
  attribute DONT_TOUCH of reset_tree : signal is "true";

  -- Recovered clock
  signal recclk_sync_clr: std_logic;
  signal recclk_sync_ce : std_logic;
  signal recclk         : std_logic;
  signal recclk_freq    : std_logic_vector(31 downto 0);
 
  -- Reference clock
  signal refclk         : std_logic_vector (c_NUM_REFCLKS-1 downto 0);
  signal refclk_mirrors : std_logic_vector (c_NUM_REFCLKS-1 downto 0);
  signal refclk_bufg    : std_logic_vector (c_NUM_REFCLKS-1 downto 0);

  -- Dynamic Reconfiguration port signals
  signal drp_i     : mgt_drp_in_rt_array (c_NUM_MGTS-1 downto 0);
  signal drp_o     : mgt_drp_out_rt_array (c_NUM_MGTS-1 downto 0);

  -- Status signals
  signal status    : mgt_status_rt_array (c_NUM_MGTS-1 downto 0);
  signal status_d  : mgt_status_rt_array (c_NUM_MGTS-1 downto 0);
  signal status_2d : mgt_status_rt_array (c_NUM_MGTS-1 downto 0);

  -- Sector Logic
  signal  sl_tx_clk_int : std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal  sl_rx_clk_int : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

begin



  --------------------------------------------------------------------------------
  -- Configuration Asserts
  --------------------------------------------------------------------------------

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

  reset_fanout : process (axiclock) is
  begin  -- process reset_fanout
    if rising_edge(axiclock) then  -- rising clock edge
      reset_tree <= (others => reset);
    end if;
  end process reset_fanout;

  --------------------------------------------------------------------------------
  -- recclk
  --------------------------------------------------------------------------------

  -- https://support.xilinx.com/s/question/0D52E00006hpdNNSAY/rxoutclk-routing-error?language=en_US

      recclk_BUFG_GT_SYNC_inst : BUFG_GT_SYNC
      port map (
        CESYNC  => recclk_sync_ce,          -- 1-bit output: Synchronized CE
        CLRSYNC => recclk_sync_clr,         -- 1-bit output: Synchronized CLR
        CE      => '1',                     -- 1-bit input: Asynchronous enable
        CLK     => recclk,                  -- 1-bit input: Clock
        CLR     => '0'                      -- 1-bit input: Asynchronous clear
        );
    
      recclk_BUFG_GT_inst : BUFG_GT
      port map (
        O       => ttc_recclk_o,            -- 1-bit output: Buffer
        CE      => recclk_sync_ce,          -- 1-bit input: Buffer enable
        CEMASK  => '0',                     -- 1-bit input: CE Mask
        CLR     => recclk_sync_clr,         -- 1-bit input: Asynchronous clear
        CLRMASK => '0',                     -- 1-bit input: CLR Mask
        DIV     => "000",                   -- 3-bit input: Dynamic divide Value
        I       => recclk                   -- 1-bit input: Buffer
      );

      rec_clk_frequency : entity work.clk_frequency
        generic map (
          clk_a_freq => 50_000_000
          )
        port map (
          reset => reset ,
          clk_a => axiclock,
          clk_b => ttc_recclk_o,
          rate  => recclk_freq
          );
          
      mon.recclk_out.freq        <= recclk_freq(mon.recclk_out.freq'range);
      mon.recclk_out.refclk_type <=
        std_logic_vector(to_unsigned(refclk_freqs_t'POS(REF_NIL), 3));
  --------------------------------------------------------------------------------
  -- REFCLK
  --------------------------------------------------------------------------------
  --
  -- For each reference clock input, buffer it in a ibufds which generates both:
  --  - O output which connects to the transceiver quad itself
  --  - ODIV2 output, which can be connected to the frequency monitors
  --    (despite the naming it is not divided by 2, it just has the option for that)
  --
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

  process (axiclock) is
  begin
    if (rising_edge(axiclock)) then
      status_d  <= status;
      status_2d <= status_d;
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

    drp_i(I).drpclk_in(0) <= axiclock;  -- 50MHz from MMCM

    -- some of these are crossing clock domains so add one ff to help metastability
    process (axiclock) is
    begin
      if (rising_edge(axiclock)) then

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
    -- LPGBT+Emulator Type Transceiver Generation
    --------------------------------------------------------------------------------
    -- Get lpgbt signals in group of four and excldue the not-active 
    lpgbt_gen : if ((I mod 4 = 0) and c2c_idx_array(I) = -1 and sl_idx_array(I) = -1 and
                    felix_idx_array(I) = -1 and c_MGT_MAP(I).mgt_type /= MGT_NIL and
                    (ttc_idx_array(I) /= -1 or ttc_idx_array(I+1) /= -1 or
                     ttc_idx_array(I+2) /= -1 or ttc_idx_array(I+3) /= -1 or
                     lpgbt_idx_array(I) /= -1 or emul_idx_array(I) /= -1))
    generate

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;

      attribute DONT_TOUCH of MGT_INST : label is "true";

      signal rx_p, rx_n, tx_p, tx_n : std_logic_vector(3 downto 0) := (others => '0');

      signal rxslide  : std_logic_vector (3 downto 0) := (others => '0');
      signal rxclkout_v : std_logic_vector (3 downto 0) := (others => '0');

      -- data
      signal tx_data : std32_array_t (3 downto 0);
      signal rx_data : std32_array_t (3 downto 0);

    begin

      -- just set a flag to 1 to indicate that this transceiver was enabled, which we can read from software
      mon.mgt(I).config.is_active <= '1';

      --------------------------------------------------------------------------------
      -- MGT
      --------------------------------------------------------------------------------
      --
      -- TODO: it would be a lot cleaner to just pass the ctrl + monitoring
      -- records into here instead of having separate mgt status / ctrl data
      -- types and ports and having to map between them
      --
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

          reset => reset_tree(I) or
                   ctrl.mgt(I).reset_all or
                   ctrl.mgt(I+1).reset_all or
                   ctrl.mgt(I+2).reset_all or
                   ctrl.mgt(I+3).reset_all,

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

          reset_rx_datapath_i => ctrl.mgt(I).rx_resets.reset_datapath or
                                 ctrl.mgt(I+1).rx_resets.reset_datapath or
                                 ctrl.mgt(I+2).rx_resets.reset_datapath or
                                 ctrl.mgt(I+3).rx_resets.reset_datapath,

          buffbypass_tx_reset_i => ctrl.mgt(I).tx_resets.reset_bufbypass or
                                   ctrl.mgt(I+1).tx_resets.reset_bufbypass or
                                   ctrl.mgt(I+2).tx_resets.reset_bufbypass or
                                   ctrl.mgt(I+3).tx_resets.reset_bufbypass,

          buffbypass_tx_start_user_i => '0',

          --------------------------------------------------------------------------------
          -- clocks
          --------------------------------------------------------------------------------

          -- drp clock
          free_clock => axiclock,

          -- refclks
          refclk0_i => refclk(c_MGT_MAP(I).refclk),
          refclk1_i => refclk(c_MGT_MAP(I).refclk),

          -- user clocks
          mgt_rxusrclk_i        => clock320,
          mgt_txusrclk_i        => clock320,
          mgt_rxusrclk_active_i => lhc_locked,  -- FIXME: this should come from something else for the felix link
          mgt_txusrclk_active_i => lhc_locked,

          -- outputs
          qpll0outclk_out    => open,
          qpll0outrefclk_out => open,
          qpll1outclk_out    => open,
          qpll1outrefclk_out => open,

          rxoutclk => rxclkout_v(3 downto 0),

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

      end generate channel_loop;
    end generate;


    --------------------------------------------------------------------------------
    -- flx_gen : if ((I mod 4 = 0) and felix_idx_array(I) /= -1)
    flx_gen : if ((I mod 4 = 0) and c_MGT_MAP(I).mgt_type = MGT_FELIX) generate

      attribute X_LOC             : integer;
      attribute Y_LOC             : integer;
      attribute X_LOC of MGT_INST : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_INST : label is c_MGT_MAP(I).y_loc;
      
      attribute DONT_TOUCH of MGT_INST : label is "true";

      signal rx_p, rx_n, tx_p, tx_n : std_logic_vector(3 downto 0) := (others => '0');

      signal rxslide                   : std_logic_vector (3 downto 0) := (others => '0');
      signal rxoutclk_v                : std_logic_vector (3 downto 0) := (others => '0');
                                       
      signal tx_data                   : std_logic_vector_array(3 downto 0)(31 downto 0);
      signal rx_data                   : std_logic_vector_array(3 downto 0)(19 downto 0);

      signal sys_rst                   : std_logic;
      signal reset_rx_datapath         : std_logic;
      signal reset_rx_pll_and_datapath : std_logic;
      signal reset_tx_datapath         : std_logic;
      signal reset_tx_pll_and_datapath : std_logic;

      constant c_FLX_IDX : integer := felix_idx_array(I);
      
      signal rx_srcclk  : std_logic;
      signal rx_usrclk  : std_logic;
      signal rx_usrclk2 : std_logic;
      
      signal tx_srcclk  : std_logic;
      signal tx_usrclk  : std_logic;
      signal tx_usrclk2 : std_logic;
  
    begin

      assert false report
        "GENERATING FELIX TYPE LINK ON MGT=" & integer'image(I)
        & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk)
        & " FLX_LINK_CNT=" & integer'image(c_FLX_IDX) severity note;

      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC240_FLX)
        report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;
      
      -- just set a flag to 1 to indicate that this transceiver was enabled, which we can read from software
      mon.mgt(I).config.is_active <= '1';

      sys_rst <= '1' when (reset_tree(I) = '1'
                           or ctrl.mgt(I).reset_all = '1'
                           or ctrl.mgt(I+1).reset_all = '1'
                           or ctrl.mgt(I+2).reset_all = '1'
                           or ctrl.mgt(I+3).reset_all = '1')
                 else '0';

      
      reset_rx_datapath <= '1' when (ctrl.mgt(I).rx_resets.reset_datapath = '1'
                                     or ctrl.mgt(I+1).rx_resets.reset_datapath = '1'
                                     or ctrl.mgt(I+2).rx_resets.reset_datapath = '1'
                                     or ctrl.mgt(I+3).rx_resets.reset_datapath = '1')
                           else '0';
      
      reset_rx_pll_and_datapath <= '1' when (ctrl.mgt(I).rx_resets.reset_pll_and_datapath = '1'
                                             or ctrl.mgt(I+1).rx_resets.reset_pll_and_datapath = '1'
                                             or ctrl.mgt(I+2).rx_resets.reset_pll_and_datapath = '1'
                                             or ctrl.mgt(I+3).rx_resets.reset_pll_and_datapath = '1')
                                   else '0';

      reset_tx_datapath <= '1' when (ctrl.mgt(I).tx_resets.reset_datapath = '1'
                                     or ctrl.mgt(I+1).tx_resets.reset_datapath = '1'
                                     or ctrl.mgt(I+2).tx_resets.reset_datapath = '1'
                                     or ctrl.mgt(I+3).tx_resets.reset_datapath = '1') 
                           else '0';
      
      reset_tx_pll_and_datapath <= '1' when (ctrl.mgt(I).tx_resets.reset_pll_and_datapath = '1'
                                             or ctrl.mgt(I+1).tx_resets.reset_pll_and_datapath = '1'
                                             or ctrl.mgt(I+2).tx_resets.reset_pll_and_datapath = '1'
                                             or ctrl.mgt(I+3).tx_resets.reset_pll_and_datapath = '1')
                                   else '0';
      
      MGT_INST : entity flx.flx_link_wrapper
        generic map (g_INDEX => I, g_GT_TYPE => c_MGT_MAP(I).gt_type, g_DEBUG => true)
        port map (clk_freerun_i                 => axiclock                                      -- : in  std_logic  
                  , sys_rst_i                   => sys_rst                                       -- : in  std_logic
                                                                                                 
                  , refclk0_i                   => refclk(c_MGT_MAP(I).refclk)                   -- : in  std_logic
                                                                                                 
                  , rx_usrclk_i                 => clock240_i                                    -- : in  std_logic
                  , rx_usrclk_active_i          => lhc_locked                                    -- : in  std_logic
                  , tx_usrclk_i                 => clock240_i                                    -- : in  std_logic
                  , tx_usrclk_active_i          => lhc_locked                                    -- : in  std_logic

                  , rx_srcclk_o                 => rx_srcclk                                     -- : out std_logic
                  , rx_usrclk_o                 => rx_usrclk                                     -- : out std_logic
                  , rx_usrclk2_o                => rx_usrclk2                                    -- : out std_logic
                                                                                                   
                  , tx_srcclk_o                 => tx_srcclk                                     -- : out std_logic
                  , tx_usrclk_o                 => tx_usrclk                                     -- : out std_logic
                  , tx_usrclk2_o                => tx_usrclk2                                    -- : out std_logic
                                                                                                 
                  , rxoutclk_vo                 => rxoutclk_v                                    -- : out std_logic_vector(3 downto 0)
                                                                                                 
                  , pma_reset_tx_done_vo        => open                                          -- : out std_logic_vector(3 downto 0)
                  , pma_reset_rx_done_vo        => open                                          -- : out std_logic_vector(3 downto 0)
                                                                                                 
                  , reset_rx_datapath_i         => reset_rx_datapath                             -- : in   std_logic
                  , reset_rx_pll_and_datapath_i => reset_rx_pll_and_datapath                     -- : in   std_logic
                                                                                                 
                  , reset_tx_datapath_i         => reset_tx_datapath                             -- : in   std_logic
                  , reset_tx_pll_and_datapath_i => reset_tx_pll_and_datapath                     -- : in   std_logic
                                                    
                  , mgt_cisk_vi                 => flx_mgt_cisk_vi(c_FLX_IDX+3 downto c_FLX_IDX) -- : in  std_logic_vector_array(3 downto 0)( 7 downto 0)
                  , mgt_word_vi                 => flx_mgt_word_vi(c_FLX_IDX+3 downto c_FLX_IDX) -- : in  std_logic_vector_array(3 downto 0)(31 downto 0)
                  , mgt_word_vo                 => flx_mgt_word_vo(c_FLX_IDX+3 downto c_FLX_IDX) -- : out std_logic_vector_array(3 downto 0)(19 downto 0)
                                                            
                  , qpll1outclk_o               => open                                          -- : out std_logic
                  , qpll1outrefclk_o            => open                                          -- : out std_logic
                                                                                                 
                  , gty_rx_vni                  => rx_p                                          -- : in   std_logic_vector(3 downto 0)
                  , gty_rx_vpi                  => rx_n                                          -- : in   std_logic_vector(3 downto 0)
                  , gty_tx_vno                  => tx_p                                          -- : out  std_logic_vector(3 downto 0)
                  , gty_tx_vpo                  => tx_n);                                        -- : out  std_logic_vector(3 downto 0));
  

      channel_loop : for jj in 0 to 3 generate
        constant idx : integer := felix_idx_array(I+jj);
      begin
        recclk_gen : if c_OVERRIDE_REC_CLK = false and idx = c_FELIX_RECCLK_SRC-1 generate
          assert false report "Using ref clock from MGT#" & integer'image(I+jj) severity note;
          recclk <= rxoutclk_v(jj); -- FELIX Recovered Clock
        end generate recclk_gen;
      end generate channel_loop;

    end generate flx_gen;
      
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
    signal ce_tx, clr_tx, ce_rx, clr_rx   : std_logic;
    begin

      -- just set a flag to 1 to indicate that this transceiver was enabled, which we can read from software
      mon.mgt(I).config.is_active <= '1';

      -- for the new generation of the GTY, the clock include already a BUFG
      sl_tx_clk(idx + 3 downto idx) <= sl_tx_clk_int(idx + 3 downto idx);
      sl_rx_clk(idx + 3 downto idx) <= sl_rx_clk_int(idx + 3 downto idx);
       
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
          clock          => axiclock,  -- FIXME: check this clock frequency against IP core
          reset_i        => reset_tree(I) or
                   ctrl.mgt(I).reset_all or
                   ctrl.mgt(I+1).reset_all or
                   ctrl.mgt(I+2).reset_all or
                   ctrl.mgt(I+3).reset_all,
          mgt_refclk_i_p => refclk_i_p(c_MGT_MAP(I).refclk),
          mgt_refclk_i_n => refclk_i_n(c_MGT_MAP(I).refclk),
          refclk_mirror  => refclk_mirrors(c_MGT_MAP(I).refclk),
          rxoutclk       => sl_rx_clk_int(idx + 3 downto idx),
          txoutclk       => sl_tx_clk_int(idx + 3 downto idx),
          status_o       => status(I+3 downto I),
          txctrl_in      => sl_tx_ctrl_i(idx+3 downto idx),
          rxctrl_out     => sl_rx_ctrl_o(idx+3 downto idx),
          rx_slide_i     => sl_rx_slide_i(idx+3 downto idx),
          re_channel_i   => sl_re_channel(idx+3 downto idx),
          rx_init_done_o => sl_rx_init_done(idx+3 downto idx),
          mgt_word_i     => sl_tx_mgt_word_array_i(idx+3 downto idx),
          mgt_word_o     => sl_rx_mgt_word_array_o(idx+3 downto idx),
          rxp_i          => rx_p,
          rxn_i          => rx_n,
          txp_o          => tx_p,
          txn_o          => tx_n,
          mgt_drp_i      => drp_i(I+3 downto I),
          mgt_drp_o      => drp_o(I+3 downto I)
          );

    ---------------------------------------------------
    -- OVERRIDE recovered clock
    ---------------------------------------------------
    recclk_out_override_gen: if (c_OVERRIDE_REC_CLK = true) and (I = c_FELIX_RECCLK_SRC) generate
        signal d, nd : std_logic;
        begin 
            assert false report "overriding recovered clock to fixed MGT quad122, link " & integer'image(I)  severity warning;
            recclk <= d;
            nd <= not d;
            ttc_recclk_inst : FDCE
           generic map (
              INIT => '0',            -- Initial value of register, '0', '1'
              -- Programmable Inversion Attributes: Specifies the use of the built-in programmable inversion
              IS_CLR_INVERTED => '0', -- Optional inversion for CLR
              IS_C_INVERTED => '0',   -- Optional inversion for C
              IS_D_INVERTED => '0'    -- Optional inversion for D
           )
           port map (
              Q => d,     -- 1-bit output: Data
              C => sl_rx_clk(idx),     -- 1-bit input: Clock
              CE => '1',   -- 1-bit input: Clock enable
              CLR => reset, -- 1-bit input: Asynchronous clear
              D => nd      -- 1-bit input: Data
           );
        end generate;
    
    end generate sl_gen;

  end generate mgt_gen;

  --------------------------------------------------------------------------------
  -- Refclk Monitors
  --------------------------------------------------------------------------------

  refclk_mirror : for I in 0 to c_NUM_REFCLKS-1 generate
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

    no_axi : if (c_REFCLK_MAP(I).freq /= REF_AXI_C2C  -- and
                 --  c_REFCLK_MAP(I).FREQ /= REF_SYNC240  -- SL has its own buffer
                   ) generate

      mon.refclk(I).freq        <= clk_freq(mon.refclk(I).freq'range);
      mon.refclk(I).refclk_type <=
        std_logic_vector(to_unsigned(refclk_freqs_t'POS(c_REFCLK_MAP(I).freq), 3));

      -- Despite the documentation stating that "The BUFG_GT_SYNC primitive is
      -- automatically inserted by the Vivado tools, if not present in the
      -- design.", this does not appear to be true, and required manual
      -- instantiation. Previously it would generate an error at DRC complaining
      -- that the CE/CLR pins are not driven by a BUFG_GT_SYNC.

      refclk_mirrors_out <= refclk_bufg;

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
          reset => reset_tree(I) ,
          clk_a => axiclock,
          clk_b => refclk_bufg(I),
          rate  => clk_freq
          );
    end generate no_axi;

  end generate refclk_mirror;


end Behavioral;
