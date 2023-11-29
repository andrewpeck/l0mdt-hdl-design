library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library UNISIM;

use UNISIM.VCOMPONENTS.ALL;


library work;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;
use work.system_types_pkg.all;

entity mgt_10g24_wrapper is

  generic(
    index   : integer    := 0;
    gt_type : gt_types_t := GTY
    );
  port(

    --=============--
    -- clocks      --
    --=============--

    free_clock : in std_logic;

    reset                       : in std_logic;
    reset_pll_and_datapath_i    : in std_logic;
    reset_datapath_i            : in std_logic;
    reset_rx_pll_and_datapath_i : in std_logic;
    reset_rx_datapath_i         : in std_logic;
    buffbypass_tx_reset_i       : in std_logic;
    buffbypass_tx_start_user_i  : in std_logic;

    refclk0_i : in std_logic;
    refclk1_i : in std_logic;

    mgt_rxusrclk_i        : in std_logic;
    mgt_rxusrclk_active_i : in std_logic;
    mgt_txusrclk_i        : in std_logic;
    mgt_txusrclk_active_i : in std_logic;

    qpll0outclk_out            : out std_logic;
    qpll0outrefclk_out         : out std_logic;
    qpll1outclk_out            : out std_logic;
    qpll1outrefclk_out         : out std_logic;

    --
    txoutclk : out std_logic_vector(3 downto 0);
    rxoutclk : out std_logic_vector(3 downto 0);

    -- control     --
    rx_slide_i : in std_logic_vector(3 downto 0);

    -- status      --
    status_o : out mgt_status_rt_array (3 downto 0);

    -- data
    mgt_word_i : in  std32_array_t (3 downto 0);
    mgt_word_o : out std32_array_t (3 downto 0);

    -- serial intf
    rxn_i : in  std_logic_vector(3 downto 0);
    rxp_i : in  std_logic_vector(3 downto 0);
    txn_o : out std_logic_vector(3 downto 0);
    txp_o : out std_logic_vector(3 downto 0);

    mgt_drp_i : in  mgt_drp_in_rt_array(3 downto 0);
    mgt_drp_o : out mgt_drp_out_rt_array (3 downto 0)
    );
end mgt_10g24_wrapper;

architecture Behavioral of mgt_10g24_wrapper is
    signal rx_wordclk_sig                   : std_logic;
    signal rxBuffBypassRst                  : std_logic;
    signal gtwiz_buffbypass_rx_reset_in_s   : std_logic;    
    signal rxpmaresetdone                   : std_logic;  
    signal gtwiz_userclk_rx_active_int      : std_logic;   
    signal gtwiz_userclk_rx_reset_int       : std_logic;   
    signal rxfsm_reset_done                 : std_logic;    


begin

    -- cloning signals
    status_o(1).buffbypass_tx_done_out <= status_o(0).buffbypass_tx_done_out;
    status_o(2).buffbypass_tx_done_out <= status_o(0).buffbypass_tx_done_out;
    status_o(3).buffbypass_tx_done_out <= status_o(0).buffbypass_tx_done_out;

    status_o(1).buffbypass_tx_error_out <= status_o(0).buffbypass_tx_error_out;
    status_o(2).buffbypass_tx_error_out <= status_o(0).buffbypass_tx_error_out;
    status_o(3).buffbypass_tx_error_out <= status_o(0).buffbypass_tx_error_out;

    status_o(1).rxcdr_stable <= status_o(0).rxcdr_stable;
    status_o(2).rxcdr_stable <= status_o(0).rxcdr_stable;
    status_o(3).rxcdr_stable <= status_o(0).rxcdr_stable;

    status_o(1).tx_reset_done <= status_o(0).tx_reset_done;
    status_o(2).tx_reset_done <= status_o(0).tx_reset_done;
    status_o(3).tx_reset_done <= status_o(0).tx_reset_done;

    status_o(1).rx_reset_done <= status_o(0).rx_reset_done;
    status_o(2).rx_reset_done <= status_o(0).rx_reset_done;
    status_o(3).rx_reset_done <= status_o(0).rx_reset_done;


  gty_gen : if (gt_type = GTY) generate

    -- https://forums.xilinx.com/t5/Vivado-TCL-Community/Creating-custom-properties-in-HDL-and-their-persistence/m-p/666151/highlight/true#M4170
    attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

    component mgt_10g24_gty
      port (
        gtwiz_userclk_tx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_userclk_rx_active_in         : in  std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_reset_in       : in  std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_start_user_in  : in  std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_done_out       : out std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_error_out      : out std_logic_vector(0 downto 0);
        gtwiz_buffbypass_rx_reset_in       : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        gtwiz_buffbypass_rx_start_user_in  : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        gtwiz_buffbypass_rx_done_out       : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        gtwiz_buffbypass_rx_error_out      : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            
        gtwiz_reset_clk_freerun_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_all_in                 : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_tx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_reset_rx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_userdata_tx_in               : in  std_logic_vector(127 downto 0);
        gtwiz_userdata_rx_out              : out std_logic_vector(127 downto 0);
        gtrefclk00_in                      : in  std_logic_vector(0 downto 0);
--        gtrefclk01_in                      : in  std_logic_vector(0 downto 0);
        qpll0outclk_out                    : out std_logic_vector(0 downto 0);
        qpll0outrefclk_out                 : out std_logic_vector(0 downto 0);
--        qpll1outclk_out                    : out std_logic_vector(0 downto 0);
--        qpll1outrefclk_out                 : out std_logic_vector(0 downto 0);
        drpaddr_in                         : in  std_logic_vector(39 downto 0);
        drpclk_in                          : in  std_logic_vector(3 downto 0);
        drpdi_in                           : in  std_logic_vector(63 downto 0);
        drpen_in                           : in  std_logic_vector(3 downto 0);
        drpwe_in                           : in  std_logic_vector(3 downto 0);
        gtyrxn_in                          : in  std_logic_vector(3 downto 0);
        gtyrxp_in                          : in  std_logic_vector(3 downto 0);
        rxcommadeten_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        rxmcommaalignen_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        rxpcommaalignen_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);    
        rxslide_in                         : in  std_logic_vector(3 downto 0);
        rxusrclk_in                        : in  std_logic_vector(3 downto 0);
        rxusrclk2_in                       : in  std_logic_vector(3 downto 0);
        txusrclk_in                        : in  std_logic_vector(3 downto 0);
        txusrclk2_in                       : in  std_logic_vector(3 downto 0);
        drpdo_out                          : out std_logic_vector(63 downto 0);
        drprdy_out                         : out std_logic_vector(3 downto 0);
        gtpowergood_out                    : out std_logic_vector(3 downto 0);
        gtytxn_out                         : out std_logic_vector(3 downto 0);
        gtytxp_out                         : out std_logic_vector(3 downto 0);
        rxoutclk_out                       : out std_logic_vector(3 downto 0);
        rxpmaresetdone_out                 : out std_logic_vector(3 downto 0);
        txbufstatus_out                    : out std_logic_vector(7 downto 0);
        txoutclk_out                       : out std_logic_vector(3 downto 0);
        txpmaresetdone_out                 : out std_logic_vector(3 downto 0)
--        txprgdivresetdone_out              : out std_logic_vector(3 downto 0)
        );
    end component;
    
  

  begin

    rxBuffBypassRst        <= not(gtwiz_userclk_rx_active_int) or (not(status_o(0).tx_reset_done));-- and not(MGT_TX_ALIGNED_s));
              
    resetDoneSynch_rx: entity work.xlx_ku_mgt_ip_reset_synchronizer
        PORT MAP(
           clk_in                                   => rx_wordClk_sig,
           rst_in                                   => rxBuffBypassRst,
           rst_out                                  => gtwiz_buffbypass_rx_reset_in_s
        );

      rxWordClkBuf_inst: bufg_gt
          port map (
             O                                        => rx_wordclk_sig, 
             I                                        => rxoutclk(0),
             CE                                       => not(gtwiz_userclk_rx_reset_int),
             DIV                                      => "000",
             CLR                                      => '0',
             CLRMASK                                  => '0',
             CEMASK                                   => '0'
          ); 

      activerxUsrClk_proc: process(gtwiz_userclk_rx_reset_int, rx_wordclk_sig)
      begin
        if gtwiz_userclk_rx_reset_int = '1' then
            gtwiz_userclk_rx_active_int <= '0';
        elsif rising_edge(rx_wordclk_sig) then
            gtwiz_userclk_rx_active_int <= '1';
        end if;
      
      end process;
      
     gtwiz_userclk_rx_reset_int <= not(status_o(0).rx_pma_reset_done);   

    MGT_GEN : mgt_10g24_gty
      port map (
        -- userclock
        gtwiz_userclk_tx_active_in(0) => mgt_txusrclk_active_i,
        gtwiz_userclk_rx_active_in(0) => mgt_rxusrclk_active_i,

       
        -- buff bypass
--        gtwiz_buffbypass_tx_reset_in(0)       => buffbypass_tx_reset_i,
--        gtwiz_buffbypass_tx_start_user_in(0)  => buffbypass_tx_start_user_i,
--        gtwiz_buffbypass_tx_done_out(0)       => status_o(0).buffbypass_tx_done_out,
--        gtwiz_buffbypass_tx_error_out(0)      => status_o(0).buffbypass_tx_error_out,
        gtwiz_buffbypass_rx_reset_in(0)       => gtwiz_buffbypass_rx_reset_in_s,
        gtwiz_buffbypass_rx_start_user_in(0)  => '0',
        gtwiz_buffbypass_rx_done_out(0)       => rxfsm_reset_done,
        gtwiz_buffbypass_rx_error_out         => open,
        -- resets
        gtwiz_reset_clk_freerun_in(0)         => free_clock,
        gtwiz_reset_all_in(0)                 => reset,
        gtwiz_reset_tx_pll_and_datapath_in(0) => reset_pll_and_datapath_i,
        gtwiz_reset_tx_datapath_in(0)         => reset_datapath_i,
        gtwiz_reset_rx_pll_and_datapath_in(0) => reset_rx_pll_and_datapath_i,
        gtwiz_reset_rx_datapath_in(0)         => reset_rx_datapath_i,

        -- outputs
        gtwiz_reset_rx_cdr_stable_out(0)      => status_o(0).rxcdr_stable,
        gtwiz_reset_tx_done_out(0)            => status_o(0).tx_reset_done,
        gtwiz_reset_rx_done_out(0)            => status_o(0).rx_reset_done,

        gtwiz_userdata_tx_in => mgt_word_i(3) & mgt_word_i(2) & mgt_word_i(1) & mgt_word_i(0),

        gtwiz_userdata_rx_out(31 downto 0)   => mgt_word_o(0),
        gtwiz_userdata_rx_out(63 downto 32)  => mgt_word_o(1),
        gtwiz_userdata_rx_out(95 downto 64)  => mgt_word_o(2),
        gtwiz_userdata_rx_out(127 downto 96) => mgt_word_o(3),

        gtrefclk00_in(0) => refclk0_i,
--        gtrefclk01_in(0) => refclk1_i,

        qpll0outclk_out(0)    => qpll0outclk_out,
        qpll0outrefclk_out(0) => qpll0outrefclk_out,
--        qpll1outclk_out(0)    => qpll1outclk_out,
--        qpll1outrefclk_out(0) => qpll1outrefclk_out,

        drpaddr_in => mgt_drp_i(3).drpaddr_in & mgt_drp_i(2).drpaddr_in & mgt_drp_i(1).drpaddr_in & mgt_drp_i(0).drpaddr_in,
        drpclk_in  => mgt_drp_i(3).drpclk_in  & mgt_drp_i(2).drpclk_in  & mgt_drp_i(1).drpclk_in  & mgt_drp_i(0).drpclk_in,
        drpdi_in   => mgt_drp_i(3).drpdi_in   & mgt_drp_i(2).drpdi_in   & mgt_drp_i(1).drpdi_in   & mgt_drp_i(0).drpdi_in,
        drpen_in   => mgt_drp_i(3).drpen_in   & mgt_drp_i(2).drpen_in   & mgt_drp_i(1).drpen_in   & mgt_drp_i(0).drpen_in,
        drpwe_in   => mgt_drp_i(3).drpwe_in   & mgt_drp_i(2).drpwe_in   & mgt_drp_i(1).drpwe_in   & mgt_drp_i(0).drpwe_in,

        drpdo_out(15 downto 0)  => mgt_drp_o(0).drpdo_out,
        drpdo_out(31 downto 16) => mgt_drp_o(1).drpdo_out,
        drpdo_out(47 downto 32) => mgt_drp_o(2).drpdo_out,
        drpdo_out(63 downto 48) => mgt_drp_o(3).drpdo_out,

        drprdy_out(0) => mgt_drp_o(0).drprdy_out,
        drprdy_out(1) => mgt_drp_o(1).drprdy_out,
        drprdy_out(2) => mgt_drp_o(2).drprdy_out,
        drprdy_out(3) => mgt_drp_o(3).drprdy_out,

        gtyrxn_in  => rxn_i,
        gtyrxp_in  => rxp_i,
        gtytxn_out => txn_o,
        gtytxp_out => txp_o,

        rxslide_in => rx_slide_i,

        rxusrclk_in  => mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i,
        rxusrclk2_in => mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i,
        txusrclk_in  => mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i,
        txusrclk2_in => mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i,

        rxoutclk_out => rxoutclk,
        txoutclk_out => txoutclk,

        txbufstatus_out => open,

        gtpowergood_out(0) => status_o(0).powergood,
        gtpowergood_out(1) => status_o(1).powergood,
        gtpowergood_out(2) => status_o(2).powergood,
        gtpowergood_out(3) => status_o(3).powergood,

        rxpmaresetdone_out(0) => status_o(0).rx_pma_reset_done,
        rxpmaresetdone_out(1) => status_o(1).rx_pma_reset_done,
        rxpmaresetdone_out(2) => status_o(2).rx_pma_reset_done,
        rxpmaresetdone_out(3) => status_o(3).rx_pma_reset_done,

        txpmaresetdone_out(0) => status_o(0).tx_pma_reset_done,
        txpmaresetdone_out(1) => status_o(1).tx_pma_reset_done,
        txpmaresetdone_out(2) => status_o(2).tx_pma_reset_done,
        txpmaresetdone_out(3) => status_o(3).tx_pma_reset_done,

--        txprgdivresetdone_out(0) => status_o(0).tx_prg_div_reset_done,
--        txprgdivresetdone_out(1) => status_o(1).tx_prg_div_reset_done,
--        txprgdivresetdone_out(2) => status_o(2).tx_prg_div_reset_done,
--        txprgdivresetdone_out(3) => status_o(3).tx_prg_div_reset_done

         rxcommadeten_in                        => "1111",
         rxmcommaalignen_in                     => "0000",
         rxpcommaalignen_in                     => "0000"    
        );
  end generate;

  gth_gen : if (gt_type = GTH) generate

    attribute X_LOC            : integer;
    attribute Y_LOC            : integer;
    attribute X_LOC of MGT_GEN : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

    component mgt_10g24_gth
      port (
        gtwiz_userclk_tx_active_in         : in  std_logic_vector(0 downto 0);
        gtwiz_userclk_rx_active_in         : in  std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_reset_in       : in  std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_start_user_in  : in  std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_done_out       : out std_logic_vector(0 downto 0);
--        gtwiz_buffbypass_tx_error_out      : out std_logic_vector(0 downto 0);
        gtwiz_buffbypass_rx_reset_in       : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        gtwiz_buffbypass_rx_start_user_in  : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        gtwiz_buffbypass_rx_done_out       : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        gtwiz_buffbypass_rx_error_out      : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);        
        gtwiz_reset_clk_freerun_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_all_in                 : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_tx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_datapath_in         : in  std_logic_vector(0 downto 0);
        gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(0 downto 0);
        gtwiz_reset_tx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_reset_rx_done_out            : out std_logic_vector(0 downto 0);
        gtwiz_userdata_tx_in               : in  std_logic_vector(127 downto 0);
        gtwiz_userdata_rx_out              : out std_logic_vector(127 downto 0);
        gtrefclk00_in                      : in  std_logic_vector(0 downto 0);
--        gtrefclk01_in                      : in  std_logic_vector(0 downto 0);
        qpll0outclk_out                    : out std_logic_vector(0 downto 0);
        qpll0outrefclk_out                 : out std_logic_vector(0 downto 0);
--        qpll1outclk_out                    : out std_logic_vector(0 downto 0);
--        qpll1outrefclk_out                 : out std_logic_vector(0 downto 0);
        drpaddr_in                         : in  std_logic_vector(39 downto 0);
        drpclk_in                          : in  std_logic_vector(3 downto 0);
        drpdi_in                           : in  std_logic_vector(63 downto 0);
        drpen_in                           : in  std_logic_vector(3 downto 0);
        drpwe_in                           : in  std_logic_vector(3 downto 0);
        eyescanreset_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        gthrxn_in                          : in  std_logic_vector(3 downto 0);
        gthrxp_in                          : in  std_logic_vector(3 downto 0);
        rxcommadeten_in                    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        rxmcommaalignen_in                 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        rxpcommaalignen_in                 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);        
            rxslide_in                         : in  std_logic_vector(3 downto 0);
        rxusrclk_in                        : in  std_logic_vector(3 downto 0);
        rxusrclk2_in                       : in  std_logic_vector(3 downto 0);
        txusrclk_in                        : in  std_logic_vector(3 downto 0);
        txusrclk2_in                       : in  std_logic_vector(3 downto 0);
        drpdo_out                          : out std_logic_vector(63 downto 0);
        drprdy_out                         : out std_logic_vector(3 downto 0);
        gtpowergood_out                    : out std_logic_vector(3 downto 0);
        gthtxn_out                         : out std_logic_vector(3 downto 0);
        gthtxp_out                         : out std_logic_vector(3 downto 0);
        rxoutclk_out                       : out std_logic_vector(3 downto 0);
        rxpmaresetdone_out                 : out std_logic_vector(3 downto 0);
        txbufstatus_out                    : out std_logic_vector(7 downto 0);
        txoutclk_out                       : out std_logic_vector(3 downto 0);
        txpmaresetdone_out                 : out std_logic_vector(3 downto 0)
--        txprgdivresetdone_out              : out std_logic_vector(3 downto 0)
        );
    end component;

--    component in_system_ibert_gth
--        port (
--            drpclk_o       : out std_logic_vector(3 downto 0);
--            gt0_drpen_o    : out std_logic;
--            gt0_drpwe_o    : out std_logic;
--            gt0_drpaddr_o  : out std_logic_vector(9 downto 0);
--            gt0_drpdi_o    : out std_logic_vector(15 downto 0);
--            gt0_drprdy_i   : in  std_logic;
--            gt0_drpdo_i    : in  std_logic_vector(15 downto 0);
--            gt1_drpen_o    : out std_logic;
--            gt1_drpwe_o    : out std_logic;
--            gt1_drpaddr_o  : out std_logic_vector(9 downto 0);
--            gt1_drpdi_o    : out std_logic_vector(15 downto 0);
--            gt1_drprdy_i   : in  std_logic;
--            gt1_drpdo_i    : in  std_logic_vector(15 downto 0);
--            gt2_drpen_o    : out std_logic;
--            gt2_drpwe_o    : out std_logic;
--            gt2_drpaddr_o  : out std_logic_vector(9 downto 0);
--            gt2_drpdi_o    : out std_logic_vector(15 downto 0);
--            gt2_drprdy_i   : in  std_logic;
--            gt2_drpdo_i    : in  std_logic_vector(15 downto 0);
--            gt3_drpen_o    : out std_logic;
--            gt3_drpwe_o    : out std_logic;
--            gt3_drpaddr_o  : out std_logic_vector(9 downto 0);
--            gt3_drpdi_o    : out std_logic_vector(15 downto 0);
--            gt3_drprdy_i   : in  std_logic;
--            gt3_drpdo_i    : in  std_logic_vector(15 downto 0);
--            eyescanreset_o : out std_logic_vector(3 downto 0);
--            rxrate_o       : out std_logic_vector(11 downto 0);
--            txdiffctrl_o   : out std_logic_vector(19 downto 0);
--            txprecursor_o  : out std_logic_vector(19 downto 0);
--            txpostcursor_o : out std_logic_vector(19 downto 0);
--            rxlpmen_o      : out std_logic_vector(3 downto 0);
--            rxoutclk_i     : in  std_logic_vector(3 downto 0);
--            clk            : in  std_logic
--            );
--    end component;

    signal drpclk_o       : std_logic_vector(3 downto 0);
    signal gt0_drpen_o    : std_logic;
    signal gt0_drpwe_o    : std_logic;
    signal gt0_drpaddr_o  : std_logic_vector(9 downto 0);
    signal gt0_drpdi_o    : std_logic_vector(15 downto 0);
    signal gt0_drprdy_i   : std_logic;
    signal gt0_drpdo_i    : std_logic_vector(15 downto 0);
    signal gt1_drpen_o    : std_logic;
    signal gt1_drpwe_o    : std_logic;
    signal gt1_drpaddr_o  : std_logic_vector(9 downto 0);
    signal gt1_drpdi_o    : std_logic_vector(15 downto 0);
    signal gt1_drprdy_i   : std_logic;
    signal gt1_drpdo_i    : std_logic_vector(15 downto 0);
    signal gt2_drpen_o    : std_logic;
    signal gt2_drpwe_o    : std_logic;
    signal gt2_drpaddr_o  : std_logic_vector(9 downto 0);
    signal gt2_drpdi_o    : std_logic_vector(15 downto 0);
    signal gt2_drprdy_i   : std_logic;
    signal gt2_drpdo_i    : std_logic_vector(15 downto 0);
    signal gt3_drpen_o    : std_logic;
    signal gt3_drpwe_o    : std_logic;
    signal gt3_drpaddr_o  : std_logic_vector(9 downto 0);
    signal gt3_drpdi_o    : std_logic_vector(15 downto 0);
    signal gt3_drprdy_i   : std_logic;
    signal gt3_drpdo_i    : std_logic_vector(15 downto 0);
    signal eyescanreset_o : std_logic_vector(3 downto 0);
    signal rxrate_o       : std_logic_vector(11 downto 0); -- nc?
    signal txdiffctrl_o   : std_logic_vector(19 downto 0); -- nc?
    signal txprecursor_o  : std_logic_vector(19 downto 0); -- nc?
    signal txpostcursor_o : std_logic_vector(19 downto 0); -- nc?
    signal rxlpmen_o      : std_logic_vector(3 downto 0); -- nc?
    signal clk            : std_logic;
    
    signal rxpmaresetdone                   : std_logic;  
    signal rx_wordclk_sig                   : std_logic;
    signal gtwiz_userclk_rx_active_int      : std_logic;   
    signal gtwiz_userclk_rx_reset_int       : std_logic;   
    signal gtwiz_buffbypass_rx_reset_in_s   : std_logic;    
    signal rxBuffBypassRst                  : std_logic;
    signal rxfsm_reset_done                 : std_logic;    
    

  begin

      clk        <= free_clock;

--      in_system_ibert_gth_1 : in_system_ibert_gth
--          port map (
--              drpclk_o       => drpclk_o,
--              gt0_drpen_o    => gt0_drpen_o,
--              gt0_drpwe_o    => gt0_drpwe_o,
--              gt0_drpaddr_o  => gt0_drpaddr_o,
--              gt0_drpdi_o    => gt0_drpdi_o,
--              gt0_drprdy_i   => gt0_drprdy_i,
--              gt0_drpdo_i    => gt0_drpdo_i,
--              gt1_drpen_o    => gt1_drpen_o,
--              gt1_drpwe_o    => gt1_drpwe_o,
--              gt1_drpaddr_o  => gt1_drpaddr_o,
--              gt1_drpdi_o    => gt1_drpdi_o,
--              gt1_drprdy_i   => gt1_drprdy_i,
--              gt1_drpdo_i    => gt1_drpdo_i,
--              gt2_drpen_o    => gt2_drpen_o,
--              gt2_drpwe_o    => gt2_drpwe_o,
--              gt2_drpaddr_o  => gt2_drpaddr_o,
--              gt2_drpdi_o    => gt2_drpdi_o,
--              gt2_drprdy_i   => gt2_drprdy_i,
--              gt2_drpdo_i    => gt2_drpdo_i,
--              gt3_drpen_o    => gt3_drpen_o,
--              gt3_drpwe_o    => gt3_drpwe_o,
--              gt3_drpaddr_o  => gt3_drpaddr_o,
--              gt3_drpdi_o    => gt3_drpdi_o,
--              gt3_drprdy_i   => gt3_drprdy_i,
--              gt3_drpdo_i    => gt3_drpdo_i,
--              eyescanreset_o => eyescanreset_o,
--              rxrate_o       => rxrate_o,
--              txdiffctrl_o   => txdiffctrl_o,
--              txprecursor_o  => txprecursor_o,
--              txpostcursor_o => txpostcursor_o,
--              rxlpmen_o      => rxlpmen_o,
--              rxoutclk_i     => mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i,
--              clk            => clk);
  
      rxBuffBypassRst        <= not(gtwiz_userclk_rx_active_int) or (not(status_o(0).tx_reset_done));-- and not(MGT_TX_ALIGNED_s));
              
    resetDoneSynch_rx: entity work.xlx_ku_mgt_ip_reset_synchronizer
        PORT MAP(
           clk_in                                   => rx_wordClk_sig,
           rst_in                                   => rxBuffBypassRst,
           rst_out                                  => gtwiz_buffbypass_rx_reset_in_s
        );

      rxWordClkBuf_inst: bufg_gt
          port map (
             O                                        => rx_wordclk_sig, 
             I                                        => rxoutclk(0),
             CE                                       => not(gtwiz_userclk_rx_reset_int),
             DIV                                      => "000",
             CLR                                      => '0',
             CLRMASK                                  => '0',
             CEMASK                                   => '0'
          ); 

      activerxUsrClk_proc: process(gtwiz_userclk_rx_reset_int, rx_wordclk_sig)
      begin
        if gtwiz_userclk_rx_reset_int = '1' then
            gtwiz_userclk_rx_active_int <= '0';
        elsif rising_edge(rx_wordclk_sig) then
            gtwiz_userclk_rx_active_int <= '1';
        end if;
      
      end process;
      
     gtwiz_userclk_rx_reset_int <= not(status_o(0).rx_pma_reset_done);      
      
      
--      rxWordPipeline_proc: process(status_o(0).rx_reset_done, rx_wordclk_sig)
--      begin
--          if status_o(0).rx_reset_done = '0' then
--              MGT_USRWORD_o <= (others => '0');
--          elsif rising_edge(rx_wordclk_sig) then
--              MGT_USRWORD_o <= mgt_word_o(0);
--          end if;      
--      end process;                 
              

    MGT_GEN : mgt_10g24_gth
      port map (
        -- userclock
        gtwiz_userclk_tx_active_in(0) => mgt_txusrclk_active_i,
        gtwiz_userclk_rx_active_in(0) => mgt_rxusrclk_active_i,

        -- buff bypass
--        gtwiz_buffbypass_tx_reset_in(0)       => buffbypass_tx_reset_i,
--        gtwiz_buffbypass_tx_start_user_in(0)  => buffbypass_tx_start_user_i,
--        gtwiz_buffbypass_tx_done_out(0)       => status_o(0).buffbypass_tx_done_out,
--        gtwiz_buffbypass_tx_error_out(0)      => status_o(0).buffbypass_tx_error_out,
        gtwiz_buffbypass_rx_reset_in(0)       => gtwiz_buffbypass_rx_reset_in_s,
        gtwiz_buffbypass_rx_start_user_in(0)  => '0',
        gtwiz_buffbypass_rx_done_out(0)       => rxfsm_reset_done,
        gtwiz_buffbypass_rx_error_out         => open,

        -- resets
        gtwiz_reset_clk_freerun_in(0)         => free_clock,
        gtwiz_reset_all_in(0)                 => reset,
        gtwiz_reset_tx_pll_and_datapath_in(0) => reset_pll_and_datapath_i,
        gtwiz_reset_tx_datapath_in(0)         => reset_datapath_i,
        gtwiz_reset_rx_pll_and_datapath_in(0) => reset_rx_pll_and_datapath_i,
        gtwiz_reset_rx_datapath_in(0)         => reset_rx_datapath_i,

        -- outputs
        gtwiz_reset_rx_cdr_stable_out(0) => status_o(0).rxcdr_stable,
        gtwiz_reset_tx_done_out(0)       => status_o(0).tx_reset_done,
        gtwiz_reset_rx_done_out(0)       => status_o(0).rx_reset_done,

        gtwiz_userdata_tx_in => mgt_word_i(3) & mgt_word_i(2) & mgt_word_i(1) & mgt_word_i(0),

        gtwiz_userdata_rx_out(31 downto 0)   => mgt_word_o(0),
        gtwiz_userdata_rx_out(63 downto 32)  => mgt_word_o(1),
        gtwiz_userdata_rx_out(95 downto 64)  => mgt_word_o(2),
        gtwiz_userdata_rx_out(127 downto 96) => mgt_word_o(3),

        gtrefclk00_in(0) => refclk0_i,
--        gtrefclk01_in(0) => refclk1_i,

        qpll0outclk_out(0)    => qpll0outclk_out,
        qpll0outrefclk_out(0) => qpll0outrefclk_out,
--        qpll1outclk_out(0)    => qpll1outclk_out,
--        qpll1outrefclk_out(0) => qpll1outrefclk_out,

        drpaddr_in => gt3_drpaddr_o & gt2_drpaddr_o & gt1_drpaddr_o & gt0_drpaddr_o,
        drpclk_in  => drpclk_o,
        drpdi_in   => gt3_drpdi_o & gt2_drpdi_o & gt1_drpdi_o & gt0_drpdi_o,
        drpen_in   => gt3_drpen_o & gt2_drpen_o & gt1_drpen_o & gt0_drpen_o,
        drpwe_in   => gt3_drpwe_o & gt2_drpwe_o & gt1_drpwe_o & gt0_drpwe_o,

        eyescanreset_in => eyescanreset_o,

        drpdo_out(15 downto 0)  => gt0_drpdo_i,
        drpdo_out(31 downto 16) => gt1_drpdo_i,
        drpdo_out(47 downto 32) => gt2_drpdo_i,
        drpdo_out(63 downto 48) => gt3_drpdo_i,

        drprdy_out(0) => gt0_drprdy_i,
        drprdy_out(1) => gt1_drprdy_i,
        drprdy_out(2) => gt2_drprdy_i,
        drprdy_out(3) => gt3_drprdy_i,

        gthrxn_in  => rxn_i,
        gthrxp_in  => rxp_i,
        gthtxn_out => txn_o,
        gthtxp_out => txp_o,

        rxslide_in => rx_slide_i,

        rxusrclk_in  => mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i,
        rxusrclk2_in => mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i & mgt_rxusrclk_i,
        txusrclk_in  => mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i,
        txusrclk2_in => mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i & mgt_txusrclk_i,

        rxoutclk_out => rxoutclk,
        txoutclk_out => txoutclk,

        txbufstatus_out => open,

        gtpowergood_out(0) => status_o(0).powergood,
        gtpowergood_out(1) => status_o(1).powergood,
        gtpowergood_out(2) => status_o(2).powergood,
        gtpowergood_out(3) => status_o(3).powergood,

        rxpmaresetdone_out(0) => status_o(0).rx_pma_reset_done,
        rxpmaresetdone_out(1) => status_o(1).rx_pma_reset_done,
        rxpmaresetdone_out(2) => status_o(2).rx_pma_reset_done,
        rxpmaresetdone_out(3) => status_o(3).rx_pma_reset_done,

        txpmaresetdone_out(0) => status_o(0).tx_pma_reset_done,
        txpmaresetdone_out(1) => status_o(1).tx_pma_reset_done,
        txpmaresetdone_out(2) => status_o(2).tx_pma_reset_done,
        txpmaresetdone_out(3) => status_o(3).tx_pma_reset_done,

--        txprgdivresetdone_out(0) => status_o(0).tx_prg_div_reset_done,
--        txprgdivresetdone_out(1) => status_o(1).tx_prg_div_reset_done,
--        txprgdivresetdone_out(2) => status_o(2).tx_prg_div_reset_done,
--        txprgdivresetdone_out(3) => status_o(3).tx_prg_div_reset_done,
        
             
             
         rxcommadeten_in                        => "1111",
         rxmcommaalignen_in                     => "0000",
         rxpcommaalignen_in                     => "0000"        

        );
  end generate;

  nil_gen : if (gt_type = GT_NIL) generate
    assert false report "GENERATING NIL link NEVER supported" severity error;
  end generate;


end Behavioral;
