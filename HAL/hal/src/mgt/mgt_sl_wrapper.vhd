library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library work;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;

library hal;
use hal.sector_logic_pkg.all;
use hal.system_types_pkg.all;

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

    txoutclk : out std_logic_vector(3 downto 0);
    rxoutclk : out std_logic_vector(3 downto 0);

    mgt_refclk_i_p : in std_logic;
    mgt_refclk_i_n : in std_logic;

    rxctrl_out : out sl_rx_ctrl_rt_array(3 downto 0);
    txctrl_in  : in  sl_tx_ctrl_rt_array(3 downto 0);

    rx_slide_i : in std_logic_vector(3 downto 0);
    
    -- Reset
    re_channel_i : in std_logic_vector(3 downto 0);

    -- Done 
    rx_init_done_o : out std_logic;

    --=============--
    -- status      --
    --=============--

    status_o : out mgt_status_rt_array (3 downto 0);

    --==============--
    -- data         --
    --==============--

    mgt_word_i : in  std32_array_t (3 downto 0);
    mgt_word_o : out std32_array_t (3 downto 0);

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
end mgt_sl_wrapper;

architecture Behavioral of mgt_sl_wrapper is

  component gty_fixed_latency_example_top
    port(
      mgtrefclk0_x0y2_p                 : in  std_logic;
      mgtrefclk0_x0y2_n                 : in  std_logic;
      ch0_gtyrxn_in                     : in  std_logic;
      ch0_gtyrxp_in                     : in  std_logic;
      ch1_gtyrxn_in                     : in  std_logic;
      ch1_gtyrxp_in                     : in  std_logic;
      ch2_gtyrxn_in                     : in  std_logic;
      ch2_gtyrxp_in                     : in  std_logic;
      ch3_gtyrxn_in                     : in  std_logic;
      ch3_gtyrxp_in                     : in  std_logic;
      ch0_rxslide_in                    : in  std_logic;
      ch1_rxslide_in                    : in  std_logic;
      ch2_rxslide_in                    : in  std_logic;
      ch3_rxslide_in                    : in  std_logic;
      hb0_gtwiz_userdata_tx_in          : in  std_logic_vector(31 downto 0);
      hb1_gtwiz_userdata_tx_in          : in  std_logic_vector(31 downto 0);
      hb2_gtwiz_userdata_tx_in          : in  std_logic_vector(31 downto 0);
      hb3_gtwiz_userdata_tx_in          : in  std_logic_vector(31 downto 0);
      ch0_txctrl0_in                    : in  std_logic_vector(15 downto 0);
      ch1_txctrl0_in                    : in  std_logic_vector(15 downto 0);
      ch2_txctrl0_in                    : in  std_logic_vector(15 downto 0);
      ch3_txctrl0_in                    : in  std_logic_vector(15 downto 0);
      ch0_txctrl1_in                    : in  std_logic_vector(15 downto 0);
      ch1_txctrl1_in                    : in  std_logic_vector(15 downto 0);
      ch2_txctrl1_in                    : in  std_logic_vector(15 downto 0);
      ch3_txctrl1_in                    : in  std_logic_vector(15 downto 0);
      ch0_txctrl2_in                    : in  std_logic_vector(7 downto 0);
      ch1_txctrl2_in                    : in  std_logic_vector(7 downto 0);
      ch2_txctrl2_in                    : in  std_logic_vector(7 downto 0);
      ch3_txctrl2_in                    : in  std_logic_vector(7 downto 0);
      hb_gtwiz_reset_clk_freerun_in     : in  std_logic;
      hb_gtwiz_reset_all_in             : in  std_logic;
      hb_gtwiz_reset_channel_in         : in  std_logic_vector(3 downto 0);
      rx_init_done_out                  : out std_logic;
      ch0_gtytxn_out                    : out std_logic;
      ch0_gtytxp_out                    : out std_logic;
      ch1_gtytxn_out                    : out std_logic;
      ch1_gtytxp_out                    : out std_logic;
      ch2_gtytxn_out                    : out std_logic;
      ch2_gtytxp_out                    : out std_logic;
      ch3_gtytxn_out                    : out std_logic;
      ch3_gtytxp_out                    : out std_logic;
      tx_usrclk2_out                    : out std_logic;
      hb0_gtwiz_userclk_rx_usrclk2_out  : out std_logic;
      hb1_gtwiz_userclk_rx_usrclk2_out  : out std_logic;
      hb2_gtwiz_userclk_rx_usrclk2_out  : out std_logic;
      hb3_gtwiz_userclk_rx_usrclk2_out  : out std_logic;
      hb0_gtwiz_buffbypass_rx_done_out  : out std_logic;
      hb1_gtwiz_buffbypass_rx_done_out  : out std_logic;
      hb2_gtwiz_buffbypass_rx_done_out  : out std_logic;
      hb3_gtwiz_buffbypass_rx_done_out  : out std_logic;
      hb0_gtwiz_buffbypass_rx_error_out : out std_logic;
      hb1_gtwiz_buffbypass_rx_error_out : out std_logic;
      hb2_gtwiz_buffbypass_rx_error_out : out std_logic;
      hb3_gtwiz_buffbypass_rx_error_out : out std_logic;
      hb0_gtwiz_userdata_rx_out         : out std_logic_vector(31 downto 0);
      hb1_gtwiz_userdata_rx_out         : out std_logic_vector(31 downto 0);
      hb2_gtwiz_userdata_rx_out         : out std_logic_vector(31 downto 0);
      hb3_gtwiz_userdata_rx_out         : out std_logic_vector(31 downto 0);
      ch0_gtpowergood_out               : out std_logic;
      ch1_gtpowergood_out               : out std_logic;
      ch2_gtpowergood_out               : out std_logic;
      ch3_gtpowergood_out               : out std_logic;
      ch0_rxbyteisaligned_out           : out std_logic;
      ch1_rxbyteisaligned_out           : out std_logic;
      ch2_rxbyteisaligned_out           : out std_logic;
      ch3_rxbyteisaligned_out           : out std_logic;
      ch0_rxbyterealign_out             : out std_logic;
      ch1_rxbyterealign_out             : out std_logic;
      ch2_rxbyterealign_out             : out std_logic;
      ch3_rxbyterealign_out             : out std_logic;
      ch0_rxcommadet_out                : out std_logic;
      ch1_rxcommadet_out                : out std_logic;
      ch2_rxcommadet_out                : out std_logic;
      ch3_rxcommadet_out                : out std_logic;
      ch0_rxctrl0_out                   : out std_logic_vector(15 downto 0);
      ch1_rxctrl0_out                   : out std_logic_vector(15 downto 0);
      ch2_rxctrl0_out                   : out std_logic_vector(15 downto 0);
      ch3_rxctrl0_out                   : out std_logic_vector(15 downto 0);
      ch0_rxctrl1_out                   : out std_logic_vector(15 downto 0);
      ch1_rxctrl1_out                   : out std_logic_vector(15 downto 0);
      ch2_rxctrl1_out                   : out std_logic_vector(15 downto 0);
      ch3_rxctrl1_out                   : out std_logic_vector(15 downto 0);
      ch0_rxctrl2_out                   : out std_logic_vector(7 downto 0);
      ch1_rxctrl2_out                   : out std_logic_vector(7 downto 0);
      ch2_rxctrl2_out                   : out std_logic_vector(7 downto 0);
      ch3_rxctrl2_out                   : out std_logic_vector(7 downto 0);
      ch0_rxctrl3_out                   : out std_logic_vector(7 downto 0);
      ch1_rxctrl3_out                   : out std_logic_vector(7 downto 0);
      ch2_rxctrl3_out                   : out std_logic_vector(7 downto 0);
      ch3_rxctrl3_out                   : out std_logic_vector(7 downto 0);
      ch0_rxpmaresetdone_out            : out std_logic;
      ch1_rxpmaresetdone_out            : out std_logic;
      ch2_rxpmaresetdone_out            : out std_logic;
      ch3_rxpmaresetdone_out            : out std_logic;
      ch0_txpmaresetdone_out            : out std_logic;
      ch1_txpmaresetdone_out            : out std_logic;
      ch2_txpmaresetdone_out            : out std_logic;
      ch3_txpmaresetdone_out            : out std_logic;
      ch0_txprgdivresetdone_out         : out std_logic;
      ch1_txprgdivresetdone_out         : out std_logic;
      ch2_txprgdivresetdone_out         : out std_logic;
      ch3_txprgdivresetdone_out         : out std_logic
      );
  end component;

  component gty_bank122_example_top is
  port (
    -- Differential reference clock inputs
    mgtrefclk0_x0y2_p: in std_logic;
    mgtrefclk0_x0y2_n: in std_logic;
    
    -- Serial data ports for transceiver channel 0
    ch0_gtyrxn_in: in std_logic;
    ch0_gtyrxp_in: in std_logic;
    ch0_gtytxn_out: out std_logic;
    ch0_gtytxp_out: out std_logic;
    
    -- Serial data ports for transceiver channel 1
    ch1_gtyrxn_in: in std_logic;
    ch1_gtyrxp_in: in std_logic;
    ch1_gtytxn_out: out std_logic;
    ch1_gtytxp_out: out std_logic;
    
    -- Serial data ports for transceiver channel 2
    ch2_gtyrxn_in: in std_logic;
    ch2_gtyrxp_in: in std_logic;
    ch2_gtytxn_out: out std_logic;
    ch2_gtytxp_out: out std_logic;
    
    -- Serial data ports for transceiver channel 3
    ch3_gtyrxn_in: in std_logic;
    ch3_gtyrxp_in: in std_logic;
    ch3_gtytxn_out: out std_logic;
    ch3_gtytxp_out: out std_logic;
    
    -- userclk
    hb0_gtwiz_userclk_tx_usrclk2_out: out std_logic;
    hb1_gtwiz_userclk_tx_usrclk2_out: out std_logic;
    hb2_gtwiz_userclk_tx_usrclk2_out: out std_logic;
    hb3_gtwiz_userclk_tx_usrclk2_out: out std_logic;
    hb0_gtwiz_userclk_rx_usrclk2_out: out std_logic;
    hb1_gtwiz_userclk_rx_usrclk2_out: out std_logic;
    hb2_gtwiz_userclk_rx_usrclk2_out: out std_logic;
    hb3_gtwiz_userclk_rx_usrclk2_out: out std_logic;
    
    -- rxslide
    ch0_rxslide_in: in std_logic;
    ch1_rxslide_in: in std_logic;
    ch2_rxslide_in: in std_logic;
    ch3_rxslide_in: in std_logic;
    
    -- userdata_tx
    hb0_gtwiz_userdata_tx_in: in std_logic_vector(31 downto 0);
    hb1_gtwiz_userdata_tx_in: in std_logic_vector(31 downto 0);
    hb2_gtwiz_userdata_tx_in: in std_logic_vector(31 downto 0);
    hb3_gtwiz_userdata_tx_in: in std_logic_vector(31 downto 0);
    
    -- userdata_rx
    hb0_gtwiz_userdata_rx_out: out std_logic_vector(31 downto 0);
    hb1_gtwiz_userdata_rx_out: out std_logic_vector(31 downto 0);
    hb2_gtwiz_userdata_rx_out: out std_logic_vector(31 downto 0);
    hb3_gtwiz_userdata_rx_out: out std_logic_vector(31 downto 0);
    
    -- txctrl0
    ch0_txctrl0_in: in std_logic_vector(15 downto 0);
    ch1_txctrl0_in: in std_logic_vector(15 downto 0);
    ch2_txctrl0_in: in std_logic_vector(15 downto 0);
    ch3_txctrl0_in: in std_logic_vector(15 downto 0);
    
    -- txctrl1
    ch0_txctrl1_in: in std_logic_vector(15 downto 0);
    ch1_txctrl1_in: in std_logic_vector(15 downto 0);
    ch2_txctrl1_in: in std_logic_vector(15 downto 0);
    ch3_txctrl1_in: in std_logic_vector(15 downto 0);
    
    -- txctrl2
    ch0_txctrl2_in: in std_logic_vector(7 downto 0);
    ch1_txctrl2_in: in std_logic_vector(7 downto 0);
    ch2_txctrl2_in: in std_logic_vector(7 downto 0);
    ch3_txctrl2_in: in std_logic_vector(7 downto 0);
    
    -- rxctrl0
    ch0_rxctrl0_out  : out std_logic_vector(15 downto 0);
    ch1_rxctrl0_out  : out std_logic_vector(15 downto 0);
    ch2_rxctrl0_out  : out std_logic_vector(15 downto 0);
    ch3_rxctrl0_out  : out std_logic_vector(15 downto 0);
    
    -- rxctrl1
    ch0_rxctrl1_out  : out std_logic_vector(15 downto 0);
    ch1_rxctrl1_out  : out std_logic_vector(15 downto 0);
    ch2_rxctrl1_out  : out std_logic_vector(15 downto 0);
    ch3_rxctrl1_out  : out std_logic_vector(15 downto 0);
    
    -- rxctrl2
    ch0_rxctrl2_out  : out std_logic_vector(7 downto 0);
    ch1_rxctrl2_out  : out std_logic_vector(7 downto 0);
    ch2_rxctrl2_out  : out std_logic_vector(7 downto 0);
    ch3_rxctrl2_out  : out std_logic_vector(7 downto 0);
    
    -- rxctrl3
    ch0_rxctrl3_out  : out std_logic_vector(7 downto 0);
    ch1_rxctrl3_out  : out std_logic_vector(7 downto 0);
    ch2_rxctrl3_out  : out std_logic_vector(7 downto 0);
    ch3_rxctrl3_out  : out std_logic_vector(7 downto 0);
    
    -- User-provided ports for reset helper block(s)
    hb_gtwiz_reset_clk_freerun_in : in std_logic;
    hb_gtwiz_reset_all_in         : in std_logic;
    hb_gtwiz_reset_channel_in     : in std_logic_vector(3 downto 0);
    
    ch0_tx_init_done_out    : out std_logic;
    ch1_tx_init_done_out    : out std_logic;
    ch2_tx_init_done_out    : out std_logic;
    ch3_tx_init_done_out    : out std_logic;
    
    ch0_rx_init_done_out    : out std_logic;
    ch1_rx_init_done_out    : out std_logic;
    ch2_rx_init_done_out    : out std_logic;
    ch3_rx_init_done_out    : out std_logic;
    
    txuserrdy_out           : out std_logic;
    rxpolarity_in           : in std_logic_vector(3 downto 0);
    txpolarity_in           : in std_logic_vector(3 downto 0)
  );
end component gty_bank122_example_top;

  
  signal xilinx_one  : std_logic_vector (0 downto 0) := (others => '1');
  signal xilinx_zero : std_logic_vector (0 downto 0) := (others => '0');

begin

  nil_gen : if (gt_type = GT_NIL) generate
    assert false report "GENERATING NIL link not supported" severity error;
  end generate nil_gen;

  gth_gen : if (gt_type = GTH) generate
    assert false report "GENERATING GTH link not supported for Sector Logic" severity error;
  end generate gth_gen;

  gty_gen_all : if (gt_type = GTY 
        and index /= 8) generate

    signal txoutclk_int : std_logic;

    attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl
  begin

    txoutclk <= (others => txoutclk_int);


    MGT_GEN : gty_fixed_latency_example_top
      port map (

        mgtrefclk0_x0y2_p => mgt_refclk_i_p,
        mgtrefclk0_x0y2_n => mgt_refclk_i_n,

        -- ch0
        ch0_gtyrxn_in  => rxn_i(0),
        ch0_gtyrxp_in  => rxp_i(0),
        ch0_gtytxn_out => txn_o(0),
        ch0_gtytxp_out => txp_o(0),

        -- ch1
        ch1_gtyrxn_in  => rxn_i(1),
        ch1_gtyrxp_in  => rxp_i(1),
        ch1_gtytxn_out => txn_o(1),
        ch1_gtytxp_out => txp_o(1),

        -- ch2
        ch2_gtyrxn_in  => rxn_i(2),
        ch2_gtyrxp_in  => rxp_i(2),
        ch2_gtytxn_out => txn_o(2),
        ch2_gtytxp_out => txp_o(2),

        -- ch3
        ch3_gtyrxn_in  => rxn_i(3),
        ch3_gtyrxp_in  => rxp_i(3),
        ch3_gtytxn_out => txn_o(3),
        ch3_gtytxp_out => txp_o(3),

        -- userclk
        tx_usrclk2_out => txoutclk_int,

        hb0_gtwiz_userclk_rx_usrclk2_out => rxoutclk(0),
        hb1_gtwiz_userclk_rx_usrclk2_out => rxoutclk(1),
        hb2_gtwiz_userclk_rx_usrclk2_out => rxoutclk(2),
        hb3_gtwiz_userclk_rx_usrclk2_out => rxoutclk(3),

        hb0_gtwiz_buffbypass_rx_error_out => open, -- TODO: connect
        hb1_gtwiz_buffbypass_rx_error_out => open,
        hb2_gtwiz_buffbypass_rx_error_out => open,
        hb3_gtwiz_buffbypass_rx_error_out => open,

        ch0_rxcommadet_out => open,
        ch1_rxcommadet_out => open,
        ch2_rxcommadet_out => open,
        ch3_rxcommadet_out => open,

        -- rxslide
        ch0_rxslide_in => rx_slide_i(0),
        ch1_rxslide_in => rx_slide_i(1),
        ch2_rxslide_in => rx_slide_i(2),
        ch3_rxslide_in => rx_slide_i(3),

        -- userdata_tx
        hb0_gtwiz_userdata_tx_in => mgt_word_i(0),
        hb1_gtwiz_userdata_tx_in => mgt_word_i(1),
        hb2_gtwiz_userdata_tx_in => mgt_word_i(2),
        hb3_gtwiz_userdata_tx_in => mgt_word_i(3),

        -- userdata_rx
        hb0_gtwiz_userdata_rx_out => mgt_word_o(0),
        hb1_gtwiz_userdata_rx_out => mgt_word_o(1),
        hb2_gtwiz_userdata_rx_out => mgt_word_o(2),
        hb3_gtwiz_userdata_rx_out => mgt_word_o(3),

        -- txctrl0
        ch0_txctrl0_in => txctrl_in(0).ctrl0,
        ch1_txctrl0_in => txctrl_in(1).ctrl0,
        ch2_txctrl0_in => txctrl_in(2).ctrl0,
        ch3_txctrl0_in => txctrl_in(3).ctrl0,

        -- txctrl1
        ch0_txctrl1_in => txctrl_in(0).ctrl1,
        ch1_txctrl1_in => txctrl_in(1).ctrl1,
        ch2_txctrl1_in => txctrl_in(2).ctrl1,
        ch3_txctrl1_in => txctrl_in(3).ctrl1,

        -- txctrl2
        ch0_txctrl2_in => txctrl_in(0).ctrl2,
        ch1_txctrl2_in => txctrl_in(1).ctrl2,
        ch2_txctrl2_in => txctrl_in(2).ctrl2,
        ch3_txctrl2_in => txctrl_in(3).ctrl2,

        -- gtpowergood
        ch0_gtpowergood_out => status_o(0).powergood,
        ch1_gtpowergood_out => status_o(1).powergood,
        ch2_gtpowergood_out => status_o(2).powergood,
        ch3_gtpowergood_out => status_o(3).powergood,

        -- rxbyteisaligned
        ch0_rxbyteisaligned_out => open,
        ch1_rxbyteisaligned_out => open,
        ch2_rxbyteisaligned_out => open,
        ch3_rxbyteisaligned_out => open,

        -- rxbyterealign
        ch0_rxbyterealign_out => open,
        ch1_rxbyterealign_out => open,
        ch2_rxbyterealign_out => open,
        ch3_rxbyterealign_out => open,

        -- rxctrl0
        ch0_rxctrl0_out => rxctrl_out(0).ctrl0,
        ch1_rxctrl0_out => rxctrl_out(1).ctrl0,
        ch2_rxctrl0_out => rxctrl_out(2).ctrl0,
        ch3_rxctrl0_out => rxctrl_out(3).ctrl0,

        -- rxctrl1
        ch0_rxctrl1_out => rxctrl_out(0).ctrl1,
        ch1_rxctrl1_out => rxctrl_out(1).ctrl1,
        ch2_rxctrl1_out => rxctrl_out(2).ctrl1,
        ch3_rxctrl1_out => rxctrl_out(3).ctrl1,

        -- rxctrl2
        ch0_rxctrl2_out => rxctrl_out(0).ctrl2,
        ch1_rxctrl2_out => rxctrl_out(1).ctrl2,
        ch2_rxctrl2_out => rxctrl_out(2).ctrl2,
        ch3_rxctrl2_out => rxctrl_out(3).ctrl2,

        -- rxctrl3
        ch0_rxctrl3_out => rxctrl_out(0).ctrl3,
        ch1_rxctrl3_out => rxctrl_out(1).ctrl3,
        ch2_rxctrl3_out => rxctrl_out(2).ctrl3,
        ch3_rxctrl3_out => rxctrl_out(3).ctrl3,

        -- rxpmaresetdone
        ch0_rxpmaresetdone_out => status_o(0).rx_pma_reset_done,
        ch1_rxpmaresetdone_out => status_o(1).rx_pma_reset_done,
        ch2_rxpmaresetdone_out => status_o(2).rx_pma_reset_done,
        ch3_rxpmaresetdone_out => status_o(3).rx_pma_reset_done,

        -- txpmaresetdone
        ch0_txpmaresetdone_out => status_o(0).tx_pma_reset_done,
        ch1_txpmaresetdone_out => status_o(1).tx_pma_reset_done,
        ch2_txpmaresetdone_out => status_o(2).tx_pma_reset_done,
        ch3_txpmaresetdone_out => status_o(3).tx_pma_reset_done,

        -- txprgdivresetdone
        ch0_txprgdivresetdone_out => open,
        ch1_txprgdivresetdone_out => open,
        ch2_txprgdivresetdone_out => open,
        ch3_txprgdivresetdone_out => open,

        -- User-provided ports for reset helper block(s)
        hb_gtwiz_reset_clk_freerun_in => clock,
        hb_gtwiz_reset_all_in         => reset_i,
        hb_gtwiz_reset_channel_in     => re_channel_i,
      
        rx_init_done_out => rx_init_done_o
        );
        
  end generate gty_gen_all;
  
  gty_gen_gty122 : if (gt_type = GTY 
        and index = 8) generate
            attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl
 begin
        
    MGT_GEN : gty_bank122_example_top
      port map (

        mgtrefclk0_x0y2_p => mgt_refclk_i_p,
        mgtrefclk0_x0y2_n => mgt_refclk_i_n,

        -- ch0
        ch0_gtyrxn_in  => rxn_i(0),
        ch0_gtyrxp_in  => rxp_i(0),
        ch0_gtytxn_out => txn_o(0),
        ch0_gtytxp_out => txp_o(0),

        -- ch1
        ch1_gtyrxn_in  => rxn_i(1),
        ch1_gtyrxp_in  => rxp_i(1),
        ch1_gtytxn_out => txn_o(1),
        ch1_gtytxp_out => txp_o(1),

        -- ch2
        ch2_gtyrxn_in  => rxn_i(2),
        ch2_gtyrxp_in  => rxp_i(2),
        ch2_gtytxn_out => txn_o(2),
        ch2_gtytxp_out => txp_o(2),

        -- ch3
        ch3_gtyrxn_in  => rxn_i(3),
        ch3_gtyrxp_in  => rxp_i(3),
        ch3_gtytxn_out => txn_o(3),
        ch3_gtytxp_out => txp_o(3),

        -- userclk

        hb0_gtwiz_userclk_tx_usrclk2_out => txoutclk(0),
        hb1_gtwiz_userclk_tx_usrclk2_out => txoutclk(1),
        hb2_gtwiz_userclk_tx_usrclk2_out => txoutclk(2),
        hb3_gtwiz_userclk_tx_usrclk2_out => txoutclk(3),
        hb0_gtwiz_userclk_rx_usrclk2_out => rxoutclk(0),
        hb1_gtwiz_userclk_rx_usrclk2_out => rxoutclk(1),
        hb2_gtwiz_userclk_rx_usrclk2_out => rxoutclk(2),
        hb3_gtwiz_userclk_rx_usrclk2_out => rxoutclk(3),

--        hb0_gtwiz_buffbypass_rx_error_out => open, -- TODO: connect
--        hb1_gtwiz_buffbypass_rx_error_out => open,
--        hb2_gtwiz_buffbypass_rx_error_out => open,
--        hb3_gtwiz_buffbypass_rx_error_out => open,

--        ch0_rxcommadet_out => open,
--        ch1_rxcommadet_out => open,
--        ch2_rxcommadet_out => open,
--        ch3_rxcommadet_out => open,

        -- rxslide
        ch0_rxslide_in => rx_slide_i(0),
        ch1_rxslide_in => rx_slide_i(1),
        ch2_rxslide_in => rx_slide_i(2),
        ch3_rxslide_in => rx_slide_i(3),

        -- userdata_tx
        hb0_gtwiz_userdata_tx_in => mgt_word_i(0),
        hb1_gtwiz_userdata_tx_in => mgt_word_i(1),
        hb2_gtwiz_userdata_tx_in => mgt_word_i(2),
        hb3_gtwiz_userdata_tx_in => mgt_word_i(3),

        -- userdata_rx
        hb0_gtwiz_userdata_rx_out => mgt_word_o(0),
        hb1_gtwiz_userdata_rx_out => mgt_word_o(1),
        hb2_gtwiz_userdata_rx_out => mgt_word_o(2),
        hb3_gtwiz_userdata_rx_out => mgt_word_o(3),

        -- txctrl0
        ch0_txctrl0_in => txctrl_in(0).ctrl0,
        ch1_txctrl0_in => txctrl_in(1).ctrl0,
        ch2_txctrl0_in => txctrl_in(2).ctrl0,
        ch3_txctrl0_in => txctrl_in(3).ctrl0,

        -- txctrl1
        ch0_txctrl1_in => txctrl_in(0).ctrl1,
        ch1_txctrl1_in => txctrl_in(1).ctrl1,
        ch2_txctrl1_in => txctrl_in(2).ctrl1,
        ch3_txctrl1_in => txctrl_in(3).ctrl1,

        -- txctrl2
        ch0_txctrl2_in => txctrl_in(0).ctrl2,
        ch1_txctrl2_in => txctrl_in(1).ctrl2,
        ch2_txctrl2_in => txctrl_in(2).ctrl2,
        ch3_txctrl2_in => txctrl_in(3).ctrl2,

        -- gtpowergood
--        ch0_gtpowergood_out => status_o(0).powergood,
--        ch1_gtpowergood_out => status_o(1).powergood,
--        ch2_gtpowergood_out => status_o(2).powergood,
--        ch3_gtpowergood_out => status_o(3).powergood,

        -- rxbyteisaligned
--        ch0_rxbyteisaligned_out => open,
--        ch1_rxbyteisaligned_out => open,
--        ch2_rxbyteisaligned_out => open,
--        ch3_rxbyteisaligned_out => open,

        -- rxbyterealign
--        ch0_rxbyterealign_out => open,
--        ch1_rxbyterealign_out => open,
--        ch2_rxbyterealign_out => open,
--        ch3_rxbyterealign_out => open,

        -- rxctrl0
        ch0_rxctrl0_out => rxctrl_out(0).ctrl0,
        ch1_rxctrl0_out => rxctrl_out(1).ctrl0,
        ch2_rxctrl0_out => rxctrl_out(2).ctrl0,
        ch3_rxctrl0_out => rxctrl_out(3).ctrl0,

        -- rxctrl1
        ch0_rxctrl1_out => rxctrl_out(0).ctrl1,
        ch1_rxctrl1_out => rxctrl_out(1).ctrl1,
        ch2_rxctrl1_out => rxctrl_out(2).ctrl1,
        ch3_rxctrl1_out => rxctrl_out(3).ctrl1,

        -- rxctrl2
        ch0_rxctrl2_out => rxctrl_out(0).ctrl2,
        ch1_rxctrl2_out => rxctrl_out(1).ctrl2,
        ch2_rxctrl2_out => rxctrl_out(2).ctrl2,
        ch3_rxctrl2_out => rxctrl_out(3).ctrl2,

        -- rxctrl3
        ch0_rxctrl3_out => rxctrl_out(0).ctrl3,
        ch1_rxctrl3_out => rxctrl_out(1).ctrl3,
        ch2_rxctrl3_out => rxctrl_out(2).ctrl3,
        ch3_rxctrl3_out => rxctrl_out(3).ctrl3,

        -- rxpmaresetdone
        ch0_rx_init_done_out => status_o(0).rx_pma_reset_done,
        ch1_rx_init_done_out => status_o(1).rx_pma_reset_done,
        ch2_rx_init_done_out => status_o(2).rx_pma_reset_done,
        ch3_rx_init_done_out => status_o(3).rx_pma_reset_done,

        -- txpmaresetdone
        ch0_tx_init_done_out => status_o(0).tx_pma_reset_done,
        ch1_tx_init_done_out => status_o(1).tx_pma_reset_done,
        ch2_tx_init_done_out => status_o(2).tx_pma_reset_done,
        ch3_tx_init_done_out => status_o(3).tx_pma_reset_done,

        -- txprgdivresetdone
--        ch0_txprgdivresetdone_out => open,
--        ch1_txprgdivresetdone_out => open,
--        ch2_txprgdivresetdone_out => open,
--        ch3_txprgdivresetdone_out => open,

        -- User-provided ports for reset helper block(s)
        hb_gtwiz_reset_clk_freerun_in => clock,
        hb_gtwiz_reset_all_in         => reset_i,
        hb_gtwiz_reset_channel_in     => re_channel_i,
      
      -- more outputs
        txuserrdy_out => open,
        -- more inputs
        rxpolarity_in  => std_logic_vector(to_unsigned(0,4)),
        txpolarity_in  => std_logic_vector(to_unsigned(0,4))
      
--        rx_init_done_out => rx_init_done_o
        );
  end generate gty_gen_gty122;
  


end Behavioral;
