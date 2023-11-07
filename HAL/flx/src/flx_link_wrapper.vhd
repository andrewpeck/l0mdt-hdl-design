library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

library hal;
use hal.mgt_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.system_types_pkg.all;

entity flx_link_wrapper is
  generic(g_INDEX     : integer    := 0
          ; g_GT_TYPE : gt_types_t := GTY
          ; g_DEBUG   : boolean    := false);
  port (clk_freerun_i                 : in  std_logic
        ; sys_rst_i                   : in  std_logic

        ; refclk0_i                   : in  std_logic

        ; rx_usrclk_i                 : in  std_logic
        ; rx_usrclk_active_i          : in  std_logic
        ; tx_usrclk_i                 : in  std_logic
        ; tx_usrclk_active_i          : in  std_logic

        ; rx_srcclk_o                 : out std_logic
        ; rx_usrclk_o                 : out std_logic
        ; rx_usrclk2_o                : out std_logic

        ; tx_srcclk_o                 : out std_logic
        ; tx_usrclk_o                 : out std_logic
        ; tx_usrclk2_o                : out std_logic

        ; pma_reset_tx_done_vo        : out std_logic_vector(3 downto 0)
        ; pma_reset_rx_done_vo        : out std_logic_vector(3 downto 0)

        ; reset_rx_datapath_i         : in  std_logic
        ; reset_rx_pll_and_datapath_i : in  std_logic

        ; reset_tx_datapath_i         : in  std_logic
        ; reset_tx_pll_and_datapath_i : in  std_logic

        ; mgt_cisk_vi                 : in  std_logic_vector_array(3 downto 0)( 7 downto 0)
        ; mgt_word_vi                 : in  std_logic_vector_array(3 downto 0)(31 downto 0)
        ; mgt_word_vo                 : out std_logic_vector_array(3 downto 0)(19 downto 0)

        ; qpll1outclk_o               : out std_logic
        ; qpll1outrefclk_o            : out std_logic

        ; rxoutclk_vo                 : out std_logic_vector(3 downto 0)
        ; txoutclk_vo                 : out std_logic_vector(3 downto 0)
        
        ; gty_rx_vni                  : in  std_logic_vector(3 downto 0)
        ; gty_rx_vpi                  : in  std_logic_vector(3 downto 0)
        ; gty_tx_vno                  : out std_logic_vector(3 downto 0)
        ; gty_tx_vpo                  : out std_logic_vector(3 downto 0));

end entity flx_link_wrapper;

architecture behavioral of flx_link_wrapper is

begin

  gty_gen : if (g_GT_TYPE = GTY) generate

    attribute X_LOC               : integer;
    attribute Y_LOC               : integer;
    attribute X_LOC of MGT_GEN    : label is c_MGT_MAP(g_INDEX).x_loc;
    attribute Y_LOC of MGT_GEN    : label is c_MGT_MAP(g_INDEX).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

    component flx_link is
      port (gtwiz_userclk_tx_active_in         : in  std_logic_vector(  0 downto 0)
            ; gtwiz_userclk_rx_active_in         : in  std_logic_vector(  0 downto 0)
            ; gtwiz_reset_clk_freerun_in         : in  std_logic_vector(  0 downto 0)
            ; gtwiz_reset_all_in                 : in  std_logic_vector(  0 downto 0)
            ; gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(  0 downto 0)
            ; gtwiz_reset_tx_datapath_in         : in  std_logic_vector(  0 downto 0)
            ; gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(  0 downto 0)
            ; gtwiz_reset_rx_datapath_in         : in  std_logic_vector(  0 downto 0)
            ; gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(  0 downto 0)
            ; gtwiz_reset_tx_done_out            : out std_logic_vector(  0 downto 0)
            ; gtwiz_reset_rx_done_out            : out std_logic_vector(  0 downto 0)
            ; gtwiz_userdata_tx_in               : in  std_logic_vector(127 downto 0)
            ; gtwiz_userdata_rx_out              : out std_logic_vector( 79 downto 0)
            ; gtrefclk01_in                      : in  std_logic_vector(  0 downto 0)
            ; qpll1outclk_out                    : out std_logic_vector(  0 downto 0)
            ; qpll1outrefclk_out                 : out std_logic_vector(  0 downto 0)
            ; gtyrxn_in                          : in  std_logic_vector(  3 downto 0)
            ; gtyrxp_in                          : in  std_logic_vector(  3 downto 0)
            ; rxusrclk_in                        : in  std_logic_vector(  3 downto 0)
            ; rxusrclk2_in                       : in  std_logic_vector(  3 downto 0)
            ; tx8b10ben_in                       : in  std_logic_vector(  3 downto 0)
            ; txctrl0_in                         : in  std_logic_vector( 63 downto 0)
            ; txctrl1_in                         : in  std_logic_vector( 63 downto 0)
            ; txctrl2_in                         : in  std_logic_vector( 31 downto 0)
            ; txusrclk_in                        : in  std_logic_vector(  3 downto 0)
            ; txusrclk2_in                       : in  std_logic_vector(  3 downto 0)
            ; gtpowergood_out                    : out std_logic_vector(  3 downto 0)
            ; gtytxn_out                         : out std_logic_vector(  3 downto 0)
            ; gtytxp_out                         : out std_logic_vector(  3 downto 0)
            ; rxoutclk_out                       : out std_logic_vector(  3 downto 0)
            ; rxpmaresetdone_out                 : out std_logic_vector(  3 downto 0)
            ; txoutclk_out                       : out std_logic_vector(  3 downto 0)
            ; txpmaresetdone_out                 : out std_logic_vector(  3 downto 0));
      end component flx_link;

    signal reset_rx_cdr_stable : std_logic;
    signal reset_tx_done       : std_logic;
    signal reset_rx_done       : std_logic;
    signal qpll1outclk         : std_logic;
    signal qpll1outrefclk      : std_logic;
    signal txctrl0             : std_logic_vector(63 downto 0);
    signal txctrl1             : std_logic_vector(63 downto 0);
    signal gtpowergood_v       : std_logic_vector( 3 downto 0);
    signal rxpmaresetdone_v    : std_logic_vector( 3 downto 0);
    signal txpmaresetdone_v    : std_logic_vector( 3 downto 0);
      
    signal rxoutclk_v : std_logic_vector(3 downto 0);
    signal txoutclk_v : std_logic_vector(3 downto 0);

    signal rxoutclk_freq_v     : std_logic_vector_array(rxoutclk_v'range)(31 downto 0);
    signal txoutclk_freq_v     : std_logic_vector_array(txoutclk_v'range)(31 downto 0);
    signal qpll1outclk_freq    : std_logic_vector(31 downto 0);
    signal qpll1outrefclk_freq : std_logic_vector(31 downto 0);

    component flx_link_vio_0
      port (clk        : in  std_logic
            ; probe_in0  : in  std_logic_vector( 0 downto 0)
            ; probe_in1  : in  std_logic_vector( 0 downto 0)
            ; probe_in2  : in  std_logic_vector( 0 downto 0)
            ; probe_in3  : in  std_logic_vector( 0 downto 0)
            ; probe_in4  : in  std_logic_vector( 0 downto 0)
            ; probe_in5  : in  std_logic_vector( 3 downto 0)
            ; probe_in6  : in  std_logic_vector( 3 downto 0)
            ; probe_in7  : in  std_logic_vector( 3 downto 0)
            ; probe_out0 : out std_logic_vector(63 downto 0)
            ; probe_out1 : out std_logic_vector(63 downto 0)
            ; probe_out2 : out std_logic_vector(31 downto 0));
    end component flx_link_vio_0;

    component flx_link_vio_1
      port (clk         : in std_logic
            ; probe_in0 : in std_logic_vector(31 downto 0)
            ; probe_in1 : in std_logic_vector(31 downto 0)
            ; probe_in2 : in std_logic_vector(31 downto 0)
            ; probe_in3 : in std_logic_vector(31 downto 0)
            ; probe_in4 : in std_logic_vector(31 downto 0)
            ; probe_in5 : in std_logic_vector(31 downto 0)
            ; probe_in6 : in std_logic_vector(31 downto 0)
            ; probe_in7 : in std_logic_vector(31 downto 0)
            ; probe_in8 : in std_logic_vector(31 downto 0)
            ; probe_in9 : in std_logic_vector(31 downto 0));
    end component flx_link_vio_1;

  begin

    qpll1outclk_o     <= qpll1outclk;  
    qpll1outrefclk_o  <= qpll1outrefclk;

    rxoutclk_vo <= rxoutclk_v;
    txoutclk_vo <= txoutclk_v;

    pma_reset_rx_done_vo <= txpmaresetdone_v;
    pma_reset_tx_done_vo <= txpmaresetdone_v;

    MGT_GEN : component flx_link
      port map (gtwiz_userclk_tx_active_in(0)           => tx_usrclk_active_i          -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_rx_active_in(0)         => rx_usrclk_active_i          -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_clk_freerun_in(0)         => clk_freerun_i               -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_all_in(0)                 => sys_rst_i                   -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_tx_pll_and_datapath_in(0) => reset_tx_pll_and_datapath_i -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_tx_datapath_in(0)         => reset_tx_datapath_i         -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_pll_and_datapath_in(0) => reset_rx_pll_and_datapath_i -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_datapath_in(0)         => reset_rx_datapath_i         -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_cdr_stable_out(0)      => reset_rx_cdr_stable         -- : out std_logic_vector(0 downto 0)
                , gtwiz_reset_tx_done_out(0)            => reset_tx_done               -- : out std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_done_out(0)            => reset_rx_done               -- : out std_logic_vector(0 downto 0)
                , gtwiz_userdata_tx_in(31 downto 0)     => mgt_word_vi(0)              -- : in  std_logic_vector(127 downto 0)
                , gtwiz_userdata_tx_in(63 downto 32)    => mgt_word_vi(1)              -- : 
                , gtwiz_userdata_tx_in(95 downto 64)    => mgt_word_vi(2)              -- : 
                , gtwiz_userdata_tx_in(127 downto 96)   => mgt_word_vi(3)              -- : 
                , gtwiz_userdata_rx_out(19 downto 0)    => mgt_word_vo(0)              -- : out std_logic_vector(79 downto 0)
                , gtwiz_userdata_rx_out(39 downto 20)   => mgt_word_vo(1)              -- : 
                , gtwiz_userdata_rx_out(59 downto 40)   => mgt_word_vo(2)              -- : 
                , gtwiz_userdata_rx_out(79 downto 60)   => mgt_word_vo(3)              -- : 
                , gtrefclk01_in(0)                      => refclk0_i                   -- : in  std_logic_vector(0 downto 0)
                , qpll1outclk_out(0)                    => qpll1outclk                 -- : out std_logic_vector(0 downto 0)
                , qpll1outrefclk_out(0)                 => qpll1outrefclk              -- : out std_logic_vector(0 downto 0)
                , gtyrxn_in                             => gty_rx_vni                  -- : in  std_logic_vector(3 downto 0)
                , gtyrxp_in                             => gty_rx_vpi                  -- : in  std_logic_vector(3 downto 0)
                , rxusrclk_in                           => (others => rx_usrclk_i)     -- : in  std_logic_vector(  3 downto 0)
                , rxusrclk2_in                          => (others => rx_usrclk_i)     -- : in  std_logic_vector(  3 downto 0)
                , tx8b10ben_in                          => (others => '1')             -- : in  std_logic_vector(3 downto 0)
                , txctrl0_in                            => txctrl0                     -- : in  std_logic_vector(63 downto 0)
                , txctrl1_in                            => txctrl1                     -- : in  std_logic_vector(63 downto 0)
                , txctrl2_in( 7 downto  0)              => mgt_cisk_vi(0)              -- : in  std_logic_vector(31 downto 0)
                , txctrl2_in(15 downto  8)              => mgt_cisk_vi(1)              -- : 
                , txctrl2_in(23 downto 16)              => mgt_cisk_vi(2)              -- : 
                , txctrl2_in(31 downto 24)              => mgt_cisk_vi(3)              -- : 
                , txusrclk_in                           => (others => tx_usrclk_i)     -- : in  std_logic_vector(  3 downto 0)
                , txusrclk2_in                          => (others => tx_usrclk_i)     -- : in  std_logic_vector(  3 downto 0)
                , gtpowergood_out                       => gtpowergood_v               -- : out std_logic_vector(3 downto 0)
                , gtytxn_out                            => gty_tx_vno                  -- : out std_logic_vector(3 downto 0)
                , gtytxp_out                            => gty_tx_vpo                  -- : out std_logic_vector(3 downto 0)
                , rxoutclk_out                          => rxoutclk_v                  -- : out std_logic_vector(3 downto 0)
                , rxpmaresetdone_out                    => rxpmaresetdone_v            -- : out std_logic_vector(3 downto 0)
                , txoutclk_out                          => txoutclk_v                  -- : out std_logic_vector(3 downto 0)
                , txpmaresetdone_out                    => txpmaresetdone_v);          -- : out std_logic_vector(3 downto 0))

    GEN_DEBUG : if G_DEBUG = TRUE generate
      
      u_flx_link_vio_0 : component flx_link_vio_0
        port map (clk            => clk_freerun_i       -- : in  std_logic;
                  , probe_in0(0) => reset_rx_cdr_stable -- : in  std_logic_vector( 0 downto 0)
                  , probe_in1(0) => reset_tx_done       -- : in  std_logic_vector( 0 downto 0)
                  , probe_in2(0) => reset_rx_done       -- : in  std_logic_vector( 0 downto 0)
                  , probe_in3(0) => '0'                 -- : in  std_logic_vector( 0 downto 0)
                  , probe_in4(0) => '0'                 -- : in  std_logic_vector( 0 downto 0)
                  , probe_in5    => gtpowergood_v       -- : in  std_logic_vector( 3 downto 0)
                  , probe_in6    => rxpmaresetdone_v    -- : in  std_logic_vector( 3 downto 0)
                  , probe_in7    => txpmaresetdone_v    -- : in  std_logic_vector( 3 downto 0)
                  , probe_out0   => txctrl0             -- : out std_logic_vector(63 downto 0)
                  , probe_out1   => txctrl1             -- : out std_logic_vector(63 downto 0)
                  , probe_out2   => open);              -- : out std_logic_vector(31 downto 0));

      -- u_clk_freq_qpll1outclk : entity work.clk_frequency
      --   generic map (clk_a_freq => 50_000_000)  -- : natural := 31250000
      --   port map (reset   => '0'                -- : in  std_logic;
      --             , clk_a => clk_freerun_i      -- : in  std_logic;
      --             , clk_b => qpll1outclk        -- : in  std_logic;
      --             , rate  => qpll1outclk_freq); -- : out std_logic_vector(31 downto 0) := (others => '0')
      -- 
      -- u_clk_freq_qpll1outrefclk : entity work.clk_frequency
      --   generic map (clk_a_freq => 50_000_000)     -- : natural := 31250000
      --   port map (reset   => '0'                   -- : in  std_logic;
      --             , clk_a => clk_freerun_i         -- : in  std_logic;
      --             , clk_b => qpll1outrefclk        -- : in  std_logic;
      --             , rate  => qpll1outrefclk_freq); -- : out std_logic_vector(31 downto 0) := (others => '0')
      
      -- GEN_RXOUTCLK_FREQ : for ii in rxoutclk_v'range generate
      --   u_clk_freq_rxoutclk : entity work.clk_frequency
      --     generic map (clk_a_freq => 50_000_000)     -- : natural := 31250000
      --     port map (reset   => '0'                   -- : in  std_logic;
      --               , clk_a => clk_freerun_i         -- : in  std_logic;
      --               , clk_b => rxoutclk_v(ii)        -- : in  std_logic;
      --               , rate  => rxoutclk_freq_v(ii)); -- : out std_logic_vector(31 downto 0) := (others => '0')
      -- end generate GEN_RXOUTCLK_FREQ;
      -- 
      -- GEN_TXOUTCLK_FREQ : for ii in txoutclk_v'range generate
      --   u_clk_freq_txoutclk : entity work.clk_frequency
      --     generic map (clk_a_freq => 50_000_000)     -- : natural := 31250000
      --     port map (reset   => '0'                   -- : in  std_logic;
      --               , clk_a => clk_freerun_i         -- : in  std_logic;
      --               , clk_b => txoutclk_v(ii)        -- : in  std_logic;
      --               , rate  => txoutclk_freq_v(ii)); -- : out std_logic_vector(31 downto 0) := (others => '0')
      -- end generate GEN_TXOUTCLK_FREQ;
      -- 
      -- u_flx_link_vio_1 : component flx_link_vio_1
      --   port map (clk         => clk_freerun_i        -- : in std_logic
      --             , probe_in0 => (others => '0')      -- : in std_logic_vector(31 downto 0)
      --             , probe_in1 => (others => '0')      -- : in std_logic_vector(31 downto 0)
      --             , probe_in2 => rxoutclk_freq_v(0)   -- : in std_logic_vector(31 downto 0)
      --             , probe_in3 => rxoutclk_freq_v(1)   -- : in std_logic_vector(31 downto 0)
      --             , probe_in4 => rxoutclk_freq_v(2)   -- : in std_logic_vector(31 downto 0)
      --             , probe_in5 => rxoutclk_freq_v(3)   -- : in std_logic_vector(31 downto 0)
      --             , probe_in6 => txoutclk_freq_v(0)   -- : in std_logic_vector(31 downto 0)
      --             , probe_in7 => txoutclk_freq_v(1)   -- : in std_logic_vector(31 downto 0)
      --             , probe_in8 => txoutclk_freq_v(2)   -- : in std_logic_vector(31 downto 0)
      --             , probe_in9 => txoutclk_freq_v(3)); -- : in std_logic_vector(31 downto 0));

    end generate GEN_DEBUG;
    
  end generate gty_gen;


  
end architecture behavioral;
