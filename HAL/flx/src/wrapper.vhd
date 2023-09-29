library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.fullmode_pkg.all;

entity gty_qpll_wrapper_proca is
  generic (NLINKS : natural := 20);
  port (clk40_i        : std_logic;
        clk240_i       : std_logic;
        clk320_i       : std_logic;
        rst_i          : std_logic;
                       
        busy_i         : std_logic;

        gtrefclk01_vni : in std_logic_vector(NLINKS/4-1 downto 0); 
        gtrefclk01_vpi : in std_logic_vector(NLINKS/4-1 downto 0); 
        drp_clk_i      : in std_logic;
        
        rxusrclk_vo    : out std_logic_vector(NLINKS/4-1 downto 0);
        rxoutclk_vo    : out std_logic_vector(NLINKS/4-1 downto 0);
        txusrclk_vo    : out std_logic_vector(NLINKS/4-1 downto 0);
        txoutclk_vo    : out std_logic_vector(NLINKS/4-1 downto 0);
        
        reset_tx_done_vo : out std_logic_vector(NLINKS-1 downto 0);
        reset_rx_done_vo : out std_logic_vector(NLINKS-1 downto 0);
        
        rx_reset_vi       : in  std_logic_vector(NLINKS-1 downto 0);
        tx_reset_vi       : in  std_logic_vector(NLINKS-1 downto 0);
        cdr_stable_vo    : out std_logic_vector(NLINKS-1 downto 0);

        rx_slide_vi : in std_logic_vector(NLINKS-1 downto 0);
        
        reset_all_i                 : in   std_logic; 
        reset_tx_pll_and_datapath_i : in   std_logic;
        reset_rx_pll_and_datapath_i : in   std_logic;
        reset_tx_datapath_i         : in   std_logic;
        reset_rx_datapath_i         : in   std_logic;
        
        userdata_tx_data_vi : in  std_logic_vector_array(NLINKS-1 downto 0)(31 downto 0);
        userdata_tx_ctrl_vi : in  std_logic_vector_array(NLINKS-1 downto 0)(1 downto 0);
        userdata_tx_wren_vi : in  std_logic_vector(31 downto 0);

        userdata_rx_avo : out std_logic_vector_array(NLINKS-1 downto 0)(19 downto 0);
        
        gtyrx_nvi : in   std_logic_vector(NLINKS-1 downto 0);
        gtyrx_pvi : in   std_logic_vector(NLINKS-1 downto 0);
        gtytx_nvo : out  std_logic_vector(NLINKS-1 downto 0);
        gtytx_pvo : out  std_logic_vector(NLINKS-1 downto 0));
  
end gty_qpll_wrapper_proca;

architecture behavioral of gty_qpll_wrapper_proca is

  signal fifo_rd_clk_v   : std_logic_vector(0 to NLINKS-1);
  signal fifo_rd_en_v    : std_logic_vector(0 to NLINKS-1);
  signal fifo_rd_dbody_v : std_logic_vector_array(0 to NLINKS-1)(31 downto 0);
  signal fifo_rd_dtype_v : std_logic_vector_array(0 to NLINKS-1)( 1 downto 0);
  signal fifo_rd_empty_v : std_logic_vector(0 to NLINKS-1);


  signal fifo34b_we_v   : std_logic_vector(0 to NLINKS-1);
  signal fifo34_dtype_v : std_logic_vector_array(0 to NLINKS-1)(1 downto 0);
  signal fifo34_din_v   : std_logic_vector_array(0 to NLINKS-1)(31 downto 0);
  signal fifo34_dout_v  : std_logic_vector_array(0 to NLINKS-1)(31 downto 0);
  signal fifo34_empty_v : std_logic_vector(0 to NLINKS-1);
  signal fifo34_full_v  : std_logic_vector(0 to NLINKS-1);

  signal txdata_v : std_logic_vector_array(0 to NLINKS-1)(31 downto 0);
  
begin


  GEN_FM_PATHS : for ii in 0 to NLINKS-1 generate
  
    u_FIFO34to34b : entity work.FIFO34to34b
      port map (clk240       => clk240_i               ,  -- : in     std_logic;
                rst          => rst_i                  ,  -- : in     std_logic);
                FIFO34b_WE   => userdata_tx_wren_vi(ii),  -- : in     std_logic;
                fifo34_dtype => userdata_tx_ctrl_vi(ii),  -- : in     std_logic_vector(1 downto 0);
                fifo34_din   => userdata_tx_data_vi(ii),  -- : in     std_logic_vector(31 downto 0);
                fifo34_full  => open                   ,  -- : out    std_logic;
                fifo34_rclk  => fifo_rd_clk_v(ii)      ,  -- : in     std_logic;
                fifo34_re    => fifo_rd_en_v(ii)       ,  -- : in     std_logic;
                fifo34_empty => fifo_rd_empty_v(ii)    ,  -- : out    std_logic;
                fifo34_dout  => fifo_rd_dbody_v(ii)    ,  -- : out    std_logic_vector(31 downto 0);
                fifo_dtype   => fifo_rd_dtype_v(ii)    ); -- : out    std_logic_vector(1 downto 0);

    u_FMchannelTXctrl : entity work.FMchannelTXctrl
      port map (clk240     => clk240_i           ,  -- : in     std_logic;
                rst        => rst_i              ,  -- : in     std_logic;
                busy       => busy_i             ,  -- : in     std_logic;
                fifo_rclk  => fifo_rd_clk_v(ii)  ,  -- : out    std_logic;
                fifo_re    => fifo_rd_en_v(ii)   ,  -- : out    std_logic;
                fifo_dout  => fifo_rd_dbody_v(ii),  -- : in     std_logic_vector(31 downto 0);
                fifo_dtype => fifo_rd_dtype_v(ii),  -- : in     std_logic_vector(1 downto 0);
                fifo_empty => fifo_rd_empty_v(ii),  -- : in     std_logic;
                dout       => txdata_v(ii)       ,  -- : out    std_logic_vector(31 downto 0);
                kout       => open               ); -- : out    std_logic_vector(3 downto 0));
    
  end generate GEN_FM_PATHS;

  u_FullModeTransceivers  : entity work.FullModeTransceivers
    generic map (NLINKS => NLINKS) -- : natural := 4);
    port map(sysclk_i               => clk40_i, -- : in  std_logic;
             rst_i                  => rst_i  , -- : in  std_logic;
             gt_rxrst_vi            => rx_reset_vi           ,  -- : in  std_logic_vector(NLINKS-1 downto 0);
             rx_slide_vi            => rx_slide_vi           ,  -- : in  std_logic_vector(NLINKS-1 downto 0);
             gtwiz_reset_rx_done_vo => reset_rx_done_vo      ,  -- : out std_logic_vector(NLINKS-1 downto 0);
             gtrefclk01_vni         => gtrefclk01_vni        ,  -- : in  std_logic_vector(NLINKS/4-1 downto 0);
             gtrefclk01_vpi         => gtrefclk01_vpi        ,  -- : in  std_logic_vector(NLINKS/4-1 downto 0);
             gtyrx_pvi              => gtyrx_pvi             ,  -- : in  std_logic_vector(NLINKS-1 downto 0);
             gtyrx_nvi              => gtyrx_nvi             ,  -- : in  std_logic_vector(NLINKS-1 downto 0);
             gtytx_nvo              => gtytx_nvo             ,  -- : out std_logic_vector(NLINKS-1 downto 0);
             gtytx_pvo              => gtytx_pvo             ,  -- : out std_logic_vector(NLINKS-1 downto 0);
                                                                
             txusrclk_vo            => txusrclk_vo           ,  -- : out std_logic_vector(NLINKS/4-1 downto 0);
             rxusrclk_vo            => rxusrclk_vo           ,  -- : out std_logic_vector(NLINKS/4-1 downto 0);
                                                                
             rxdata_avo             => userdata_rx_avo       ,  -- : out std_logic_vector_array(0 to NLINKS-1)(19 downto 0);
             txdata_avi             => txdata_v              ); -- : in  std_logic_vector_array(0 to NLINKS-1)(31 downto 0));

end architecture behavioral;
