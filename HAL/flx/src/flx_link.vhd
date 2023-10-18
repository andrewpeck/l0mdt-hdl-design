library ieee;
use ieee.std_logic_1164.all;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library work;
use work.fullmode_pkg.all;

entity FullModeTransceivers is
  generic (NLINKS : natural := 4);
  port (sysclk_i               : in  std_logic;
        rst_i                  : in  std_logic;
        gt_rxrst_vi            : in  std_logic_vector(NLINKS-1 downto 0);
        rx_slide_vi            : in  std_logic_vector(NLINKS-1 downto 0);
        gtwiz_reset_rx_done_vo : out std_logic_vector(NLINKS-1 downto 0);
        gtrefclk01_vni         : in  std_logic_vector(NLINKS/4-1 downto 0);
        gtrefclk01_vpi         : in  std_logic_vector(NLINKS/4-1 downto 0);
        gtyrx_pvi              : in  std_logic_vector(NLINKS-1 downto 0);
        gtyrx_nvi              : in  std_logic_vector(NLINKS-1 downto 0);
        gtytx_nvo              : out std_logic_vector(NLINKS-1 downto 0);
        gtytx_pvo              : out std_logic_vector(NLINKS-1 downto 0);
                               
        txusrclk_vo            : out std_logic_vector(NLINKS/4-1 downto 0);
        rxusrclk_vo            : out std_logic_vector(NLINKS/4-1 downto 0);
         
        rxdata_avo             : out std_logic_vector_array(0 to NLINKS-1)(19 downto 0);
        txdata_avi             : in  std_logic_vector_array(0 to NLINKS-1)(31 downto 0));



end FullModeTransceivers;
    
architecture RTL of FullModeTransceivers is

  COMPONENT felixtransceivers
    port (gtwiz_userclk_tx_reset_in          : in  std_logic_vector(  0 downto 0);
          gtwiz_userclk_tx_srcclk_out        : out std_logic_vector(  0 downto 0);
          gtwiz_userclk_tx_usrclk_out        : out std_logic_vector(  0 downto 0);
          gtwiz_userclk_tx_usrclk2_out       : out std_logic_vector(  0 downto 0);
          gtwiz_userclk_tx_active_out        : out std_logic_vector(  0 downto 0);
          gtwiz_userclk_rx_reset_in          : in  std_logic_vector(  0 downto 0);
          gtwiz_userclk_rx_srcclk_out        : out std_logic_vector(  0 downto 0);
          gtwiz_userclk_rx_usrclk_out        : out std_logic_vector(  0 downto 0);
          gtwiz_userclk_rx_usrclk2_out       : out std_logic_vector(  0 downto 0);
          gtwiz_userclk_rx_active_out        : out std_logic_vector(  0 downto 0);
          gtwiz_reset_clk_freerun_in         : in  std_logic_vector(  0 downto 0);
          gtwiz_reset_all_in                 : in  std_logic_vector(  0 downto 0);
          gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(  0 downto 0);
          gtwiz_reset_tx_datapath_in         : in  std_logic_vector(  0 downto 0);
          gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(  0 downto 0);
          gtwiz_reset_rx_datapath_in         : in  std_logic_vector(  0 downto 0);
          gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(  0 downto 0);
          gtwiz_reset_tx_done_out            : out std_logic_vector(  0 downto 0);
          gtwiz_reset_rx_done_out            : out std_logic_vector(  0 downto 0);
          gtwiz_userdata_tx_in               : in  std_logic_vector(639 downto 0);
          gtwiz_userdata_rx_out              : out std_logic_vector(399 downto 0);
          gtrefclk01_in                      : in  std_logic_vector(  4 downto 0);
          qpll1outclk_out                    : out std_logic_vector(  4 downto 0);
          qpll1outrefclk_out                 : out std_logic_vector(  4 downto 0);
          drpclk_in                          : in  std_logic_vector( 19 downto 0);
          gtrefclk0_in                       : in  std_logic_vector( 19 downto 0);
          gtyrxn_in                          : in  std_logic_vector( 19 downto 0);
          gtyrxp_in                          : in  std_logic_vector( 19 downto 0);
          tx8b10ben_in                       : in  std_logic_vector( 19 downto 0);
          txctrl0_in                         : in  std_logic_vector(319 downto 0);
          txctrl1_in                         : in  std_logic_vector(319 downto 0);
          txctrl2_in                         : in  std_logic_vector(159 downto 0);
          gtpowergood_out                    : out std_logic_vector( 19 downto 0);
          gtytxn_out                         : out std_logic_vector( 19 downto 0);
          gtytxp_out                         : out std_logic_vector( 19 downto 0);
          rxpmaresetdone_out                 : out std_logic_vector( 19 downto 0);
          txpmaresetdone_out                 : out std_logic_vector( 19 downto 0));
  END COMPONENT;

  signal gtrefclk01_v  : std_logic_vector(NLINKS/4-1 downto 0);
  signal rxoutclk_v    : std_logic_vector(NLINKS/4-1 downto 0);
  signal rxusrclk_v    : std_logic_vector(NLINKS/4-1 downto 0);

  signal gtrefclk0_v   : std_logic_vector(NLINKS-1 downto 0);

  signal txpmaresetdone         : std_logic;
  signal rxpmaresetdone         : std_logic;
  signal gtwiz_userclk_rx_reset : std_logic;
  signal gtwiz_userclk_tx_reset : std_logic;

  signal gtwiz_userdata_rx : std_logic_vector(399 downto 0);
  signal gtwiz_userdata_tx : std_logic_vector(639 downto 0);

  signal gtwiz_reset_tx_done_o : std_logic_vector(  0 downto 0);
  signal gtwiz_reset_rx_done_o : std_logic_vector(  0 downto 0);

  signal rxpmaresetdone_v : std_logic_vector( 19 downto 0);
  signal txpmaresetdone_v : std_logic_vector( 19 downto 0);

  
begin

  GEN_REFCLK : for ii in 0 to NLINKS/4-1 generate
    rxusrclk_bufg : BUFG
      port map(i => rxoutclk_v(ii),
               o => rxusrclk_v(ii));
    
    rxusrclk_vo(ii) <= rxusrclk_v(ii);
    txusrclk_vo(ii) <= rxusrclk_v(ii);
  end generate GEN_REFCLK;

  gtwiz_userclk_tx_reset          <= not txpmaresetdone;
  gtwiz_userclk_rx_reset          <= not rxpmaresetdone;

  GEN_CHANNEL_REFCLK : for ii in 0 to NLINKS-1 generate
    gtrefclk0_v(ii) <= gtrefclk01_v(ii/4);
  end generate GEN_CHANNEL_REFCLK;
  
  GEN_USERDATA_VECTORS : for ii in 0 to NLINKS-1 generate
    gtwiz_userdata_rx(rxdata_avo(ii+1)'length*ii-1 downto rxdata_avo(ii+1)'length*ii) <= rxdata_avo(ii);
    gtwiz_userdata_tx(txdata_avi(ii+1)'length*ii-1 downto txdata_avi(ii+1)'length*ii) <= txdata_avi(ii);
  end generate GEN_USERDATA_VECTORS;

  u_felixtransceivers : felixtransceivers
    port map (gtwiz_userclk_tx_reset_in(0)          => gtwiz_userclk_tx_reset         ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_userclk_tx_srcclk_out           => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userclk_tx_usrclk_out           => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userclk_tx_usrclk2_out          => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userclk_tx_active_out           => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userclk_rx_reset_in(0)          => gtwiz_userclk_rx_reset         ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_userclk_rx_srcclk_out           => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userclk_rx_usrclk_out           => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userclk_rx_usrclk2_out          => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userclk_rx_active_out           => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_reset_clk_freerun_in(0)         => sysclk_i                       ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_reset_all_in(0)                 => rst_i                          ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_reset_tx_pll_and_datapath_in(0) => '0'                            ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_reset_tx_datapath_in(0)         => '0'                            ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_reset_rx_pll_and_datapath_in(0) => '0'                            ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_reset_rx_datapath_in(0)         => '0'                            ,  -- : in  std_logic_vector(  0 downto 0);
              gtwiz_reset_rx_cdr_stable_out         => open                           ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_reset_tx_done_out               => gtwiz_reset_tx_done_o          ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_reset_rx_done_out               => gtwiz_reset_rx_done_o          ,  -- : out std_logic_vector(  0 downto 0);
              gtwiz_userdata_tx_in                  => gtwiz_userdata_tx              ,  -- : in  std_logic_vector(639 downto 0);
              gtwiz_userdata_rx_out                 => gtwiz_userdata_rx              ,  -- : out std_logic_vector(399 downto 0);
              gtrefclk01_in                         => gtrefclk01_v                   ,  -- : in  std_logic_vector(  4 downto 0);
              qpll1outclk_out                       => open                           ,  -- : out std_logic_vector(  4 downto 0);
              qpll1outrefclk_out                    => open                           ,  -- : out std_logic_vector(  4 downto 0);
              drpclk_in                             => (others => sysclk_i)           ,  -- : in  std_logic_vector( 19 downto 0);
              gtrefclk0_in                          => gtrefclk0_v                    ,  -- : in  std_logic_vector( 19 downto 0);
              gtyrxn_in                             => gtyrx_nvi                      ,  -- : in  std_logic_vector( 19 downto 0);
              gtyrxp_in                             => gtyrx_pvi                      ,  -- : in  std_logic_vector( 19 downto 0);
              tx8b10ben_in                          => (others => '1')                ,  -- : in  std_logic_vector( 19 downto 0);
              txctrl0_in                            => (others => '0')                ,  -- : in  std_logic_vector(319 downto 0);
              txctrl1_in                            => (others => '0')                ,  -- : in  std_logic_vector(319 downto 0);
              txctrl2_in                            => (others => '0')                ,  -- : in  std_logic_vector(159 downto 0);
              gtpowergood_out                       => open                           ,  -- : out std_logic_vector( 19 downto 0);
              gtytxn_out                            => gtytx_nvo                      ,  -- : out std_logic_vector( 19 downto 0);
              gtytxp_out                            => gtytx_pvo                      ,  -- : out std_logic_vector( 19 downto 0);
              rxpmaresetdone_out                    => rxpmaresetdone_v               ,  -- : out std_logic_vector( 19 downto 0);
              txpmaresetdone_out                    => txpmaresetdone_v               ); -- : out std_logic_vector( 19 downto 0));
    
end architecture RTL;
