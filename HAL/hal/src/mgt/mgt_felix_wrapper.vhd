library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library work;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;
use work.system_types_pkg.all;

entity mgt_felix_wrapper is

  generic(
    index   : integer    := 0;
    gt_type : gt_types_t := GTY
    );
  port(
    --=============--
    -- clocks      --
    --=============--

    free_clock : in std_logic;

    reset : in std_logic;

    mgt_refclk_i : in std_logic;

    mgt_rxusrclk_i        : in std_logic_vector (3 downto 0);
    mgt_rxusrclk_active_i : in std_logic;
    mgt_txusrclk_i        : in std_logic_vector (3 downto 0);
    mgt_txusrclk_active_i : in std_logic;

    mgt_txoutclk_o : out std_logic_vector (3 downto 0);
    mgt_rxoutclk_o : out std_logic_vector (3 downto 0);

    --=============--
    -- resets      --
    --=============--

    tx_resets_i : in mgt_reset_rt;
    rx_resets_i : in mgt_reset_rt;

    --=============--
    -- control     --
    --=============--

    mgt_rxslide_i : in std_logic_vector (3 downto 0);

    --=============--
    -- status      --
    --=============--

    status_o : out mgt_status_rt_array (3 downto 0);

    --==============--
    -- data         --
    --==============--

    tx_header_i   : in std_logic_vector(23 downto 0);
    tx_sequence_i : in std_logic_vector(27 downto 0);

    mgt_words_i : in  std64_array_t (3 downto 0);
    mgt_words_o : out std32_array_t (3 downto 0);

    --===============--
    -- serial intf.  --
    --===============--
    --
    rxn_i : in std_logic_vector (3 downto 0);
    rxp_i : in std_logic_vector (3 downto 0);

    txn_o : out std_logic_vector (3 downto 0);
    txp_o : out std_logic_vector (3 downto 0);


    mgt_drp_i : in  mgt_drp_in_rt_array(3 downto 0);
    mgt_drp_o : out mgt_drp_out_rt_array (3 downto 0)
    );
end mgt_felix_wrapper;

architecture Behavioral of mgt_felix_wrapper is

  signal xilinx_one  : std_logic_vector (3 downto 0) := (others => '1');
  signal xilinx_zero : std_logic_vector (3 downto 0) := (others => '0');

  -- https://forums.xilinx.com/t5/Vivado-TCL-Community/Creating-custom-properties-in-HDL-and-their-persistence/m-p/666151/highlight/true#M4170

begin

  gty_gen : if (gt_type = GTY) generate

    attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

    component mgt_felix
      port (
        gtwiz_userclk_tx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_userclk_rx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_rx_reset_in       : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_rx_start_user_in  : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_rx_done_out       : out std_logic_vector(0 downto 0);
        gtwiz_buffbypass_rx_error_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_clk_freerun_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_all_in                 : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_tx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_reset_rx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_userdata_tx_in               : in  std_logic_vector(255 downto 0);
        gtwiz_userdata_rx_out              : out std_logic_vector(127 downto 0);
        gtrefclk00_in                      : in  std_logic_vector(0 downto 0);
        gtrefclk01_in                      : in  std_logic_vector(0 downto 0);
        qpll0outclk_out                    : out std_logic_vector(0 downto 0);
        qpll0outrefclk_out                 : out std_logic_vector(0 downto 0);
        qpll1outclk_out                    : out std_logic_vector(0 downto 0);
        qpll1outrefclk_out                 : out std_logic_vector(0 downto 0);
        drpaddr_in                         : in  std_logic_vector(39 downto 0);
        drpclk_in                          : in  std_logic_vector(3 downto 0);
        drpdi_in                           : in  std_logic_vector(63 downto 0);
        drpen_in                           : in  std_logic_vector(3 downto 0);
        drpwe_in                           : in  std_logic_vector(3 downto 0);
        gtyrxn_in                          : in  std_logic_vector(3 downto 0);
        gtyrxp_in                          : in  std_logic_vector(3 downto 0);
        rxslide_in                         : in  std_logic_vector(3 downto 0);
        rxusrclk_in                        : in  std_logic_vector(3 downto 0);
        rxusrclk2_in                       : in  std_logic_vector(3 downto 0);
        txheader_in                        : in  std_logic_vector(23 downto 0);
        txsequence_in                      : in  std_logic_vector(27 downto 0);
        txusrclk_in                        : in  std_logic_vector(3 downto 0);
        txusrclk2_in                       : in  std_logic_vector(3 downto 0);
        drpdo_out                          : out std_logic_vector(63 downto 0);
        drprdy_out                         : out std_logic_vector(3 downto 0);
        gtpowergood_out                    : out std_logic_vector(3 downto 0);
        gtytxn_out                         : out std_logic_vector(3 downto 0);
        gtytxp_out                         : out std_logic_vector(3 downto 0);
        rxoutclk_out                       : out std_logic_vector(3 downto 0);
        rxpmaresetdone_out                 : out std_logic_vector(3 downto 0);
        txoutclk_out                       : out std_logic_vector(3 downto 0);
        txpmaresetdone_out                 : out std_logic_vector(3 downto 0)
        );
    end component;

  begin

    MGT_GEN : mgt_felix
      port map (

        -- drp

        drpaddr_in => (mgt_drp_i(3).drpaddr_in & mgt_drp_i(2).drpaddr_in & mgt_drp_i(1).drpaddr_in & mgt_drp_i(0).drpaddr_in),
        drpclk_in  => (mgt_drp_i(3).drpclk_in & mgt_drp_i(2).drpclk_in & mgt_drp_i(1).drpclk_in & mgt_drp_i(0).drpclk_in),
        drpdi_in   => (mgt_drp_i(3).drpdi_in & mgt_drp_i(2).drpdi_in & mgt_drp_i(1).drpdi_in & mgt_drp_i(0).drpdi_in),
        drpen_in   => (mgt_drp_i(3).drpen_in & mgt_drp_i(2).drpen_in & mgt_drp_i(1).drpen_in & mgt_drp_i(0).drpen_in),
        drpwe_in   => (mgt_drp_i(3).drpwe_in & mgt_drp_i(2).drpwe_in & mgt_drp_i(1).drpwe_in & mgt_drp_i(0).drpwe_in),

        drpdo_out(15 downto 0)  => mgt_drp_o(0).drpdo_out,
        drpdo_out(31 downto 16) => mgt_drp_o(1).drpdo_out,
        drpdo_out(47 downto 32) => mgt_drp_o(2).drpdo_out,
        drpdo_out(63 downto 48) => mgt_drp_o(3).drpdo_out,

        drprdy_out(0 downto 0) => mgt_drp_o(0).drprdy_out,
        drprdy_out(1 downto 1) => mgt_drp_o(1).drprdy_out,
        drprdy_out(2 downto 2) => mgt_drp_o(2).drprdy_out,
        drprdy_out(3 downto 3) => mgt_drp_o(3).drprdy_out,

        -- multi-gigabit
        gtyrxn_in  => rxn_i,
        gtyrxp_in  => rxp_i,
        gtytxn_out => txn_o,
        gtytxp_out => txp_o,

        gtwiz_userdata_tx_in => mgt_words_i(3) &mgt_words_i(2) &mgt_words_i(1) & mgt_words_i(0),

        gtwiz_userdata_rx_out (31 downto 0)   => mgt_words_o(0),
        gtwiz_userdata_rx_out (63 downto 32)  => mgt_words_o(1),
        gtwiz_userdata_rx_out (95 downto 64)  => mgt_words_o(2),
        gtwiz_userdata_rx_out (127 downto 96) => mgt_words_o(3),

        txheader_in   => tx_header_i,
        txsequence_in => tx_sequence_i,

        -- clocks
        -- consult table 3-3 in
        -- https://www.xilinx.com/support/documentation/user_guides/ug578-ultrascale-gty-transceivers.pdf
        -- for usrclk and usrclk2 widths
        rxusrclk2_in(3 downto 0) => mgt_rxusrclk_i,
        rxusrclk_in(3 downto 0)  => mgt_rxusrclk_i,

        txusrclk2_in(3 downto 0) => mgt_txusrclk_i,
        txusrclk_in(3 downto 0)  => mgt_txusrclk_i,

        gtwiz_userclk_rx_active_in(0) => mgt_rxusrclk_active_i,
        gtwiz_userclk_tx_active_in(0) => mgt_txusrclk_active_i,

        gtwiz_reset_clk_freerun_in(0) => free_clock,

        gtwiz_reset_rx_pll_and_datapath_in(0) => rx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_tx_pll_and_datapath_in(0) => tx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_rx_datapath_in(0)         => rx_resets_i.reset_datapath,
        gtwiz_reset_tx_datapath_in(0)         => tx_resets_i.reset_datapath,

        -- Active-High indication that the receiver reset sequence of transceiver primitives as initiated by the reset
        -- controller helper block has completed.
        gtwiz_reset_rx_done_out(0) => status_o(0).rx_reset_done,

        -- Active-High indication that the transmitter reset sequence of transceiver primitives as initiated by the
        -- reset controller helper block has completed.
        gtwiz_reset_tx_done_out(0) => status_o(0).tx_reset_done,

        rxpmaresetdone_out(0) => status_o(0).rx_pma_reset_done,
        rxpmaresetdone_out(1) => status_o(1).rx_pma_reset_done,
        rxpmaresetdone_out(2) => status_o(2).rx_pma_reset_done,
        rxpmaresetdone_out(3) => status_o(3).rx_pma_reset_done,

        txpmaresetdone_out(0) => status_o(0).tx_pma_reset_done,
        txpmaresetdone_out(1) => status_o(1).tx_pma_reset_done,
        txpmaresetdone_out(2) => status_o(2).tx_pma_reset_done,
        txpmaresetdone_out(3) => status_o(3).tx_pma_reset_done,

        --pll------------------------------------------------------------------

        gtrefclk00_in(0) => mgt_refclk_i,
        gtrefclk01_in(0) => mgt_refclk_i,

        --qpll-----------------------------------------------------------------

        qpll0outclk_out(0)    => open,
        qpll0outrefclk_out(0) => open,

        qpll1outclk_out(0)    => open,
        qpll1outrefclk_out(0) => open,

        --buff-bypass-----------------------------------------------------------

        -- go low once high once userclk is active
        gtwiz_buffbypass_rx_reset_in(0) => rx_resets_i.reset_bufbypass,

        -- Active-High user signal that is synchronously pulsed to force the receiver buffer bypass procedure to restart. Hold Low when not used
        gtwiz_buffbypass_rx_start_user_in(0) => '0',  -- tied to 0 in example design

        -- Active-High indicates that the receiver buffer bypass procedure has completed.
        gtwiz_buffbypass_rx_done_out(0) => status_o(0).buffbypass_rx_done_out,

        -- Active-High indicates that the receiver buffer bypass helper block encountered an error condition
        gtwiz_buffbypass_rx_error_out(0) => status_o(0).buffbypass_rx_error_out,

        -- Connects to GTPOWERGOOD on transceiver channel primitives
        gtpowergood_out(0) => status_o(0).powergood,
        gtpowergood_out(1) => status_o(1).powergood,
        gtpowergood_out(2) => status_o(2).powergood,
        gtpowergood_out(3) => status_o(3).powergood,

        -- Active-High indication that the clock and data recovery (CDR) circuits of the transceiver primitives are stable. Reserved; do not use.
        gtwiz_reset_rx_cdr_stable_out(0) => open,

        -- User signal to reset the phase-locked loops (PLLs) and active data directions of transceiver primitives. The
        -- falling edge of an active-High, asynchronous pulse of at least one gtwiz_reset_clk_freerun_in period in
        -- duration initializes the proce
        gtwiz_reset_all_in(0) => reset,

        rxslide_in(3 downto 0) => mgt_rxslide_i,

        rxoutclk_out => mgt_rxoutclk_o,
        txoutclk_out => mgt_txoutclk_o
        );


    status_o(1).rx_reset_done <= status_o(0).rx_reset_done;
    status_o(2).rx_reset_done <= status_o(0).rx_reset_done;
    status_o(2).rx_reset_done <= status_o(0).rx_reset_done;

    status_o(1).tx_reset_done <= status_o(0).tx_reset_done;
    status_o(2).tx_reset_done <= status_o(0).tx_reset_done;
    status_o(2).tx_reset_done <= status_o(0).tx_reset_done;

    status_o(1).buffbypass_rx_error_out <= status_o(0).buffbypass_rx_error_out;
    status_o(2).buffbypass_rx_error_out <= status_o(0).buffbypass_rx_error_out;
    status_o(3).buffbypass_rx_error_out <= status_o(0).buffbypass_rx_error_out;

    status_o(1).buffbypass_rx_done_out <= status_o(0).buffbypass_rx_done_out;
    status_o(2).buffbypass_rx_done_out <= status_o(0).buffbypass_rx_done_out;
    status_o(3).buffbypass_rx_done_out <= status_o(0).buffbypass_rx_done_out;

  end generate;

  nil_gen : if (gt_type = GT_NIL) generate
    assert false report "GENERATING NIL link NEVER supported" severity error;
  end generate nil_gen;

  gth_gen : if (gt_type = GTH) generate
    assert false report "GENERATING GTH link NEVER supported for FELIX" severity error;
  end generate;

end Behavioral;
