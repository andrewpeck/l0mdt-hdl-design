library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library work;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;

entity mgt_sl_wrapper is

  generic(
    index   : integer    := 0;
    gt_type : gt_types_t := GTY
    );
  port(
    --=============--
    -- clocks      --
    --=============--

    clock : in std_logic;

    reset_i : in std_logic;


    mgt_refclk_i : in std_logic;

    mgt_rxusrclk_i        : in std_logic;
    mgt_rxusrclk_active_i : in std_logic;
    mgt_txusrclk_i        : in std_logic;
    mgt_txusrclk_active_i : in std_logic;

    txctrl0_in : in std_logic_vector(15 downto 0);
    txctrl1_in : in std_logic_vector(15 downto 0);
    txctrl2_in : in std_logic_vector(7 downto 0);

    rxctrl0_out : out std_logic_vector(15 downto 0);
    rxctrl1_out : out std_logic_vector(15 downto 0);
    rxctrl2_out : out std_logic_vector(7 downto 0);
    rxctrl3_out : out std_logic_vector(7 downto 0);

    rx_slide_i : in std_logic;

    --=============--
    -- resets      --
    --=============--

    tx_resets_i : in mgt_reset_rt;
    rx_resets_i : in mgt_reset_rt;

    --=============--
    -- status      --
    --=============--

    status_o : out mgt_status_rt;

    --==============--
    -- data         --
    --==============--

    mgt_word_i : in  std_logic_vector(31 downto 0);
    mgt_word_o : out std_logic_vector(31 downto 0);

    --===============--
    -- serial intf.  --
    --===============--
    --
    rxn_i : in std_logic;
    rxp_i : in std_logic;

    txn_o : out std_logic;
    txp_o : out std_logic;


    mgt_drp_i : in  mgt_drp_in_rt;
    mgt_drp_o : out mgt_drp_out_rt
    );
end mgt_sl_wrapper;

architecture Behavioral of mgt_sl_wrapper is

  signal xilinx_one  : std_logic_vector (0 downto 0) := (others => '1');
  signal xilinx_zero : std_logic_vector (0 downto 0) := (others => '0');

  -- https://forums.xilinx.com/t5/Vivado-TCL-Community/Creating-custom-properties-in-HDL-and-their-persistence/m-p/666151/highlight/true#M4170

begin

  gth_gen : if (gt_type = GTH) generate

    attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

  begin

    MGT_GEN : entity xil_defaultlib.mgt_9g6_gth
      port map (

        -- drp
        drpaddr_in => mgt_drp_i.drpaddr_in,
        drpclk_in  => mgt_drp_i.drpclk_in,
        drpdi_in   => mgt_drp_i.drpdi_in,
        drpen_in   => mgt_drp_i.drpen_in,
        drpwe_in   => mgt_drp_i.drpwe_in,
        drpdo_out  => mgt_drp_o.drpdo_out,
        drprdy_out => mgt_drp_o.drprdy_out,

        -- multi-gigabit
        gthrxn_in(0)  => rxn_i,
        gthrxp_in(0)  => rxp_i,
        gthtxn_out(0) => txn_o,
        gthtxp_out(0) => txp_o,

        gtwiz_userclk_tx_reset_in(0) => tx_resets_i.reset,

        gtwiz_userdata_tx_in  => mgt_word_i,
        gtwiz_userdata_rx_out => mgt_word_o,

        -- clocks
        rxusrclk2_in(0) => mgt_rxusrclk_i,
        rxusrclk_in(0)  => mgt_rxusrclk_i,

        txusrclk2_in(0) => mgt_txusrclk_i,
        txusrclk_in(0)  => mgt_txusrclk_i,

        gtwiz_userclk_rx_active_in(0) => mgt_rxusrclk_active_i,
        gtwiz_userclk_tx_active_in(0) => mgt_txusrclk_active_i,

        gtwiz_reset_clk_freerun_in(0) => clock,

        gtwiz_reset_rx_pll_and_datapath_in(0) => rx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_tx_pll_and_datapath_in(0) => tx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_rx_datapath_in(0)         => rx_resets_i.reset_datapath,
        gtwiz_reset_tx_datapath_in(0)         => tx_resets_i.reset_datapath,

        -- buffer bypass
        gtwiz_buffbypass_tx_reset_in(0)      => tx_resets_i.reset_bufbypass,
        gtwiz_buffbypass_tx_start_user_in(0) => '0',
        gtwiz_buffbypass_tx_done_out(0)      => status_o.buffbypass_tx_done_out,
        gtwiz_buffbypass_tx_error_out(0)     => status_o.buffbypass_tx_error_out,

        gtwiz_buffbypass_rx_reset_in(0)      => rx_resets_i.reset_bufbypass,
        gtwiz_buffbypass_rx_start_user_in(0) => '0',
        gtwiz_buffbypass_rx_done_out(0)      => status_o.buffbypass_rx_done_out,
        gtwiz_buffbypass_rx_error_out(0)     => status_o.buffbypass_rx_error_out,

        --
        rxpmaresetdone_out(0)      => status_o.rx_pma_reset_done,
        txpmaresetdone_out(0)      => status_o.tx_pma_reset_done,
        gtwiz_reset_rx_done_out(0) => status_o.rx_reset_done,
        gtwiz_reset_tx_done_out(0) => status_o.tx_reset_done,

        gtrefclk0_in(0) => mgt_refclk_i,

        gtpowergood_out(0)               => status_o.powergood,
        gtwiz_reset_rx_cdr_stable_out(0) => status_o.rxcdr_stable,

        gtwiz_reset_all_in(0) => reset_i,

        txctrl0_in => txctrl0_in,
        txctrl1_in => txctrl1_in,
        txctrl2_in => txctrl2_in,

        rxctrl0_out => rxctrl0_out,
        rxctrl1_out => rxctrl1_out,
        rxctrl2_out => rxctrl2_out,
        rxctrl3_out => rxctrl3_out,

        tx8b10ben_in => xilinx_one,
        rx8b10ben_in => xilinx_one,

        rxslide_in(0) => rx_slide_i,

        rxoutclk_out => open,
        txoutclk_out => open
        );

  end generate;

  -- TODO: these different generators are EXACTLY the same except the string "gth" and "gty" in 4 ports...
  -- is there any clever way to automate this?
  gty_gen : if (gt_type = GTY) generate

    attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

  begin

    MGT_GEN : entity xil_defaultlib.mgt_9g6_gty
      port map (

        -- drp
        drpaddr_in => mgt_drp_i.drpaddr_in,
        drpclk_in  => mgt_drp_i.drpclk_in,
        drpdi_in   => mgt_drp_i.drpdi_in,
        drpen_in   => mgt_drp_i.drpen_in,
        drpwe_in   => mgt_drp_i.drpwe_in,
        drpdo_out  => mgt_drp_o.drpdo_out,
        drprdy_out => mgt_drp_o.drprdy_out,

        -- multi-gigabit
        gtyrxn_in(0)  => rxn_i,
        gtyrxp_in(0)  => rxp_i,
        gtytxn_out(0) => txn_o,
        gtytxp_out(0) => txp_o,

        gtwiz_userclk_tx_reset_in(0) => tx_resets_i.reset,

        gtwiz_userdata_tx_in  => mgt_word_i,
        gtwiz_userdata_rx_out => mgt_word_o,

        -- clocks
        rxusrclk2_in(0) => mgt_rxusrclk_i,
        rxusrclk_in(0)  => mgt_rxusrclk_i,

        txusrclk2_in(0) => mgt_txusrclk_i,
        txusrclk_in(0)  => mgt_txusrclk_i,

        gtwiz_userclk_rx_active_in(0) => mgt_rxusrclk_active_i,
        gtwiz_userclk_tx_active_in(0) => mgt_txusrclk_active_i,

        gtwiz_reset_clk_freerun_in(0) => clock,

        gtwiz_reset_rx_pll_and_datapath_in(0) => rx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_tx_pll_and_datapath_in(0) => tx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_rx_datapath_in(0)         => rx_resets_i.reset_datapath,
        gtwiz_reset_tx_datapath_in(0)         => tx_resets_i.reset_datapath,

        -- buffer bypass
        gtwiz_buffbypass_tx_reset_in(0)      => tx_resets_i.reset_bufbypass,
        gtwiz_buffbypass_tx_start_user_in(0) => '0',
        gtwiz_buffbypass_tx_done_out(0)      => status_o.buffbypass_tx_done_out,
        gtwiz_buffbypass_tx_error_out(0)     => status_o.buffbypass_tx_error_out,

        gtwiz_buffbypass_rx_reset_in(0)      => rx_resets_i.reset_bufbypass,
        gtwiz_buffbypass_rx_start_user_in(0) => '0',
        gtwiz_buffbypass_rx_done_out(0)      => status_o.buffbypass_rx_done_out,
        gtwiz_buffbypass_rx_error_out(0)     => status_o.buffbypass_rx_error_out,

        --
        rxpmaresetdone_out(0)      => status_o.rx_pma_reset_done,
        txpmaresetdone_out(0)      => status_o.tx_pma_reset_done,
        gtwiz_reset_rx_done_out(0) => status_o.rx_reset_done,
        gtwiz_reset_tx_done_out(0) => status_o.tx_reset_done,

        gtrefclk0_in(0) => mgt_refclk_i,

        gtpowergood_out(0)               => status_o.powergood,
        gtwiz_reset_rx_cdr_stable_out(0) => status_o.rxcdr_stable,

        gtwiz_reset_all_in(0) => reset_i,

        txctrl0_in => txctrl0_in,
        txctrl1_in => txctrl1_in,
        txctrl2_in => txctrl2_in,

        rxctrl0_out => rxctrl0_out,
        rxctrl1_out => rxctrl1_out,
        rxctrl2_out => rxctrl2_out,
        rxctrl3_out => rxctrl3_out,

        tx8b10ben_in => xilinx_one,
        rx8b10ben_in => xilinx_one,

        rxslide_in(0) => rx_slide_i,

        rxoutclk_out => open,
        txoutclk_out => open
        );

  end generate gty_gen;

  nil_gen : if (gt_type = GT_NIL) generate
    assert false report "GENERATING NIL link not supported" severity error;
  end generate nil_gen;

end Behavioral;
