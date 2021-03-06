library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library work;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;

entity mgt_10g24_wrapper is

  generic(
    index   : integer    := 0;
    gt_type : gt_types_t := GTH
    );
  port(
    --=============--
    -- clocks      --
    --=============--

    free_clock : in std_logic;

    reset : in std_logic;

    mgt_refclk_i : in std_logic;

    mgt_rxusrclk_i        : in std_logic;
    mgt_rxusrclk_active_i : in std_logic;
    mgt_txusrclk_i        : in std_logic;
    mgt_txusrclk_active_i : in std_logic;

    --=============--
    -- refclk      --
    --=============--

    -- qpll0clk_in                : in  std_logic;
    -- qpll0refclk_in             : in  std_logic;
    -- qpll1clk_in                : in  std_logic;
    -- qpll1refclk_in             : in  std_logic;
    -- gtwiz_reset_qpll0lock_in   : in  std_logic;
    -- gtwiz_reset_qpll0reset_out : out std_logic;

    --=============--
    -- resets      --
    --=============--

    tx_resets_i : in mgt_reset_rt;
    rx_resets_i : in mgt_reset_rt;

    --=============--
    -- control     --
    --=============--
    --
    mgt_rxslide_i : in std_logic;

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
end mgt_10g24_wrapper;

architecture Behavioral of mgt_10g24_wrapper is

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
    component mgt_10g24_gth
      port (
        gtwiz_userclk_tx_reset_in          : in  std_logic_vector(0 downto 0);
        gtwiz_userclk_tx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_userclk_rx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_reset_in       : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_start_user_in  : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_done_out       : out std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_error_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_clk_freerun_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_all_in                 : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_tx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_reset_rx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_userdata_tx_in               : in  std_logic_vector(31 downto 0);
        gtwiz_userdata_rx_out              : out std_logic_vector(31 downto 0);
        drpaddr_in                         : in  std_logic_vector(9 downto 0);
        drpclk_in                          : in  std_logic_vector(0 downto 0);
        drpdi_in                           : in  std_logic_vector(15 downto 0);
        drpen_in                           : in  std_logic_vector(0 downto 0);
        drpwe_in                           : in  std_logic_vector(0 downto 0);
        gthrxn_in                          : in  std_logic_vector(0 downto 0);
        gthrxp_in                          : in  std_logic_vector(0 downto 0);
        gtrefclk0_in                       : in  std_logic_vector(0 downto 0);
        rxcommadeten_in                    : in  std_logic_vector(0 downto 0);
        rxmcommaalignen_in                 : in  std_logic_vector(0 downto 0);
        rxpcommaalignen_in                 : in  std_logic_vector(0 downto 0);
        rxslide_in                         : in  std_logic_vector(0 downto 0);
        rxusrclk_in                        : in  std_logic_vector(0 downto 0);
        rxusrclk2_in                       : in  std_logic_vector(0 downto 0);
        txusrclk_in                        : in  std_logic_vector(0 downto 0);
        txusrclk2_in                       : in  std_logic_vector(0 downto 0);
        drpdo_out                          : out std_logic_vector(15 downto 0);
        drprdy_out                         : out std_logic_vector(0 downto 0);
        gthtxn_out                         : out std_logic_vector(0 downto 0);
        gthtxp_out                         : out std_logic_vector(0 downto 0);
        gtpowergood_out                    : out std_logic_vector(0 downto 0);
        rxbyteisaligned_out                : out std_logic_vector(0 downto 0);
        rxbyterealign_out                  : out std_logic_vector(0 downto 0);
        rxcommadet_out                     : out std_logic_vector(0 downto 0);
        rxoutclk_out                       : out std_logic_vector(0 downto 0);
        rxpmaresetdone_out                 : out std_logic_vector(0 downto 0);
        txoutclk_out                       : out std_logic_vector(0 downto 0);
        txpmaresetdone_out                 : out std_logic_vector(0 downto 0);
        txprgdivresetdone_out              : out std_logic_vector(0 downto 0)
        );
    end component;

  begin

    MGT_GEN : mgt_10g24_gth
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

        rxslide_in(0) => mgt_rxslide_i,

        -- clocks
        rxusrclk2_in(0) => mgt_rxusrclk_i,
        rxusrclk_in(0)  => mgt_rxusrclk_i,

        txusrclk2_in(0) => mgt_txusrclk_i,
        txusrclk_in(0)  => mgt_txusrclk_i,

        gtwiz_userclk_rx_active_in(0) => mgt_rxusrclk_active_i,
        gtwiz_userclk_tx_active_in(0) => mgt_txusrclk_active_i,

        gtwiz_reset_clk_freerun_in(0) => free_clock,

        gtwiz_reset_rx_pll_and_datapath_in(0) => rx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_tx_pll_and_datapath_in(0) => tx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_rx_datapath_in(0)         => rx_resets_i.reset_datapath,
        gtwiz_reset_tx_datapath_in(0)         => tx_resets_i.reset_datapath,

        rxpmaresetdone_out(0)      => status_o.rx_pma_reset_done,
        txpmaresetdone_out(0)      => status_o.tx_pma_reset_done,
        gtwiz_reset_rx_done_out(0) => status_o.rx_reset_done,
        gtwiz_reset_tx_done_out(0) => status_o.tx_reset_done,

        -- refclk


        --cpll-----------------------------------------------------------------

        gtrefclk0_in(0) => mgt_refclk_i,

        --qpll-----------------------------------------------------------------

        -- qpll0clk_in(0)    => qpll0clk_in,
        -- qpll0refclk_in(0) => qpll0refclk_in,
        -- qpll1clk_in(0)    => qpll1clk_in,
        -- qpll1refclk_in(0) => qpll1refclk_in,

        -- gtwiz_reset_qpll0lock_in   => gtwiz_reset_qpll0lock_in,
        -- gtwiz_reset_qpll0reset_out => gtwiz_reset_qpll0reset_out,

        -- go low once high once userclk is active
        gtwiz_buffbypass_tx_reset_in(0)      => tx_resets_i.reset_bufbypass,
        -- tied to 0 in example design ??
        gtwiz_buffbypass_tx_start_user_in(0) => '0',

        -- done phase shifting
        gtwiz_buffbypass_tx_done_out(0) => status_o.buffbypass_tx_done_out,

        -- error
        gtwiz_buffbypass_tx_error_out(0) => status_o.buffbypass_tx_error_out,

        gtpowergood_out(0)               => status_o.powergood,
        gtwiz_reset_rx_cdr_stable_out(0) => status_o.rxcdr_stable,

        gtwiz_reset_all_in(0) => reset,

        rxbyteisaligned_out => open,
        rxbyterealign_out   => open,
        rxcommadet_out      => open,
        rxcommadeten_in     => xilinx_one,
        rxmcommaalignen_in  => xilinx_zero,
        rxpcommaalignen_in  => xilinx_zero,
        rxoutclk_out        => open,
        txoutclk_out        => open
        );

  end generate;

  gty_gen : if (gt_type = GTY) generate

    attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

    component mgt_10g24_gty
      port (
        gtwiz_userclk_tx_reset_in          : in  std_logic_vector(0 downto 0);
        gtwiz_userclk_tx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_userclk_rx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_reset_in       : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_start_user_in  : in  std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_done_out       : out std_logic_vector(0 downto 0);
        gtwiz_buffbypass_tx_error_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_clk_freerun_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_all_in                 : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_tx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_reset_rx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_userdata_tx_in               : in  std_logic_vector(31 downto 0);
        gtwiz_userdata_rx_out              : out std_logic_vector(31 downto 0);
        drpaddr_in                         : in  std_logic_vector(9 downto 0);
        drpclk_in                          : in  std_logic_vector(0 downto 0);
        drpdi_in                           : in  std_logic_vector(15 downto 0);
        drpen_in                           : in  std_logic_vector(0 downto 0);
        drpwe_in                           : in  std_logic_vector(0 downto 0);
        gtrefclk0_in                       : in  std_logic_vector(0 downto 0);
        gtyrxn_in                          : in  std_logic_vector(0 downto 0);
        gtyrxp_in                          : in  std_logic_vector(0 downto 0);
        rxcommadeten_in                    : in  std_logic_vector(0 downto 0);
        rxmcommaalignen_in                 : in  std_logic_vector(0 downto 0);
        rxpcommaalignen_in                 : in  std_logic_vector(0 downto 0);
        rxslide_in                         : in  std_logic_vector(0 downto 0);
        rxusrclk_in                        : in  std_logic_vector(0 downto 0);
        rxusrclk2_in                       : in  std_logic_vector(0 downto 0);
        txusrclk_in                        : in  std_logic_vector(0 downto 0);
        txusrclk2_in                       : in  std_logic_vector(0 downto 0);
        drpdo_out                          : out std_logic_vector(15 downto 0);
        drprdy_out                         : out std_logic_vector(0 downto 0);
        gtpowergood_out                    : out std_logic_vector(0 downto 0);
        gtytxn_out                         : out std_logic_vector(0 downto 0);
        gtytxp_out                         : out std_logic_vector(0 downto 0);
        rxbyteisaligned_out                : out std_logic_vector(0 downto 0);
        rxbyterealign_out                  : out std_logic_vector(0 downto 0);
        rxcommadet_out                     : out std_logic_vector(0 downto 0);
        rxoutclk_out                       : out std_logic_vector(0 downto 0);
        rxpmaresetdone_out                 : out std_logic_vector(0 downto 0);
        txbufstatus_out                    : out std_logic_vector(1 downto 0);
        txoutclk_out                       : out std_logic_vector(0 downto 0);
        txpmaresetdone_out                 : out std_logic_vector(0 downto 0)
        );
    end component;

  begin

    MGT_GEN : mgt_10g24_gty
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

        rxslide_in(0) => mgt_rxslide_i,

        -- clocks
        rxusrclk2_in(0) => mgt_rxusrclk_i,
        rxusrclk_in(0)  => mgt_rxusrclk_i,

        txusrclk2_in(0) => mgt_txusrclk_i,
        txusrclk_in(0)  => mgt_txusrclk_i,

        gtwiz_userclk_rx_active_in(0) => mgt_rxusrclk_active_i,
        gtwiz_userclk_tx_active_in(0) => mgt_txusrclk_active_i,

        gtwiz_reset_clk_freerun_in(0) => free_clock,

        gtwiz_reset_rx_pll_and_datapath_in(0) => rx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_tx_pll_and_datapath_in(0) => tx_resets_i.reset_pll_and_datapath,
        gtwiz_reset_rx_datapath_in(0)         => rx_resets_i.reset_datapath,
        gtwiz_reset_tx_datapath_in(0)         => tx_resets_i.reset_datapath,

        rxpmaresetdone_out(0)      => status_o.rx_pma_reset_done,
        txpmaresetdone_out(0)      => status_o.tx_pma_reset_done,
        gtwiz_reset_rx_done_out(0) => status_o.rx_reset_done,
        gtwiz_reset_tx_done_out(0) => status_o.tx_reset_done,

        -- refclk


        --cpll-----------------------------------------------------------------

        gtrefclk0_in(0) => mgt_refclk_i,

        --qpll-----------------------------------------------------------------

        -- qpll0clk_in(0)    => qpll0clk_in,
        -- qpll0refclk_in(0) => qpll0refclk_in,
        -- qpll1clk_in(0)    => qpll1clk_in,
        -- qpll1refclk_in(0) => qpll1refclk_in,

        -- gtwiz_reset_qpll0lock_in   => gtwiz_reset_qpll0lock_in,
        -- gtwiz_reset_qpll0reset_out => gtwiz_reset_qpll0reset_out,

        -- go low once high once userclk is active
        gtwiz_buffbypass_tx_reset_in(0)      => tx_resets_i.reset_bufbypass,
        -- tied to 0 in example design ??
        gtwiz_buffbypass_tx_start_user_in(0) => '0',

        -- done phase shifting
        gtwiz_buffbypass_tx_done_out(0) => status_o.buffbypass_tx_done_out,

        -- error
        gtwiz_buffbypass_tx_error_out(0) => status_o.buffbypass_tx_error_out,

        gtpowergood_out(0)               => status_o.powergood,
        gtwiz_reset_rx_cdr_stable_out(0) => status_o.rxcdr_stable,

        gtwiz_reset_all_in(0) => reset,

        rxbyteisaligned_out => open,
        rxbyterealign_out   => open,
        rxcommadet_out      => open,
        rxcommadeten_in     => xilinx_one,
        rxmcommaalignen_in  => xilinx_zero,
        rxpcommaalignen_in  => xilinx_zero,
        rxoutclk_out        => open,
        txoutclk_out        => open
        );

  end generate;

  nil_gen : if (gt_type = GT_NIL) generate
    assert false report "GENERATING NIL link NEVER supported" severity error;
  end generate nil_gen;

end Behavioral;
