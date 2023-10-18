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
  generic(index     : integer    := 0
          ; gt_type : gt_types_t := GTY);
  port (clk_freerun_i               : in  std_logic
        ; sys_rst_i                   : in  std_logic

        ; refclk0_i                   : in  std_logic

        ; rx_srcclk_o                 : out std_logic
        ; rx_usrclk_o                 : out std_logic
        ; rx_usrclk2_o                : out std_logic

        ; tx_srcclk_o                 : out std_logic
        ; tx_usrclk_o                 : out std_logic
        ; tx_usrclk2_o                : out std_logic

        ; reset_tx_done_vo            : out std_logic_vector(3 downto 0)
        ; reset_rx_done_vo            : out std_logic_vector(3 downto 0)

        ; reset_rx_datapath_i         : in  std_logic
        ; reset_rx_pll_and_datapath_i : in  std_logic

        ; reset_tx_datapath_i         : in  std_logic
        ; reset_tx_pll_and_datapath_i : in  std_logic

        ; mgt_word_vi                 : in  std_logic_vector_array(3 downto 0)(31 downto 0)
        ; mgt_word_vo                 : out std_logic_vector_array(3 downto 0)(19 downto 0)

        ; qpll1outclk_o               : out std_logic
        ; qpll1outrefclk_o            : out std_logic

        ; rxoutclk_vo                 : out std_logic_vector(3 downto 0)
        
        ; gty_rx_vni                  : in  std_logic_vector(3 downto 0)
        ; gty_rx_vpi                  : in  std_logic_vector(3 downto 0)
        ; gty_tx_vno                  : out std_logic_vector(3 downto 0)
        ; gty_tx_vpo                  : out std_logic_vector(3 downto 0));

end entity flx_link_wrapper;

architecture behavioral of flx_link_wrapper is

begin

  gty_gen : if (gt_type = GTY) generate

    attribute X_LOC               : integer;
    attribute Y_LOC               : integer;
    attribute X_LOC of MGT_GEN    : label is c_MGT_MAP(index).x_loc;
    attribute Y_LOC of MGT_GEN    : label is c_MGT_MAP(index).y_loc;

    attribute NUM_MGTS            : integer;              -- need it somewhere more handy actually...
    attribute NUM_MGTS of MGT_GEN : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

    component flx_link is
      port (gtwiz_userclk_tx_reset_in            : in  std_logic_vector(0 downto 0)
            ; gtwiz_userclk_tx_srcclk_out        : out std_logic_vector(0 downto 0)
            ; gtwiz_userclk_tx_usrclk_out        : out std_logic_vector(0 downto 0)
            ; gtwiz_userclk_tx_usrclk2_out       : out std_logic_vector(0 downto 0)
            ; gtwiz_userclk_tx_active_out        : out std_logic_vector(0 downto 0)
            ; gtwiz_userclk_rx_reset_in          : in  std_logic_vector(0 downto 0)
            ; gtwiz_userclk_rx_srcclk_out        : out std_logic_vector(0 downto 0)
            ; gtwiz_userclk_rx_usrclk_out        : out std_logic_vector(0 downto 0)
            ; gtwiz_userclk_rx_usrclk2_out       : out std_logic_vector(0 downto 0)
            ; gtwiz_userclk_rx_active_out        : out std_logic_vector(0 downto 0)
            ; gtwiz_reset_clk_freerun_in         : in  std_logic_vector(0 downto 0)
            ; gtwiz_reset_all_in                 : in  std_logic_vector(0 downto 0)
            ; gtwiz_reset_tx_pll_and_datapath_in : in  std_logic_vector(0 downto 0)
            ; gtwiz_reset_tx_datapath_in         : in  std_logic_vector(0 downto 0)
            ; gtwiz_reset_rx_pll_and_datapath_in : in  std_logic_vector(0 downto 0)
            ; gtwiz_reset_rx_datapath_in         : in  std_logic_vector(0 downto 0)
            ; gtwiz_reset_rx_cdr_stable_out      : out std_logic_vector(0 downto 0)
            ; gtwiz_reset_tx_done_out            : out std_logic_vector(0 downto 0)
            ; gtwiz_reset_rx_done_out            : out std_logic_vector(0 downto 0)
            ; gtwiz_userdata_tx_in               : in  std_logic_vector(127 downto 0)
            ; gtwiz_userdata_rx_out              : out std_logic_vector(79 downto 0)
            ; gtrefclk01_in                      : in  std_logic_vector(0 downto 0)
            ; qpll1outclk_out                    : out std_logic_vector(0 downto 0)
            ; qpll1outrefclk_out                 : out std_logic_vector(0 downto 0)
            ; gtyrxn_in                          : in  std_logic_vector(3 downto 0)
            ; gtyrxp_in                          : in  std_logic_vector(3 downto 0)
            ; tx8b10ben_in                       : in  std_logic_vector(3 downto 0)
            ; txctrl0_in                         : in  std_logic_vector(63 downto 0)
            ; txctrl1_in                         : in  std_logic_vector(63 downto 0)
            ; txctrl2_in                         : in  std_logic_vector(31 downto 0)
            ; gtpowergood_out                    : out std_logic_vector(3 downto 0)
            ; gtytxn_out                         : out std_logic_vector(3 downto 0)
            ; gtytxp_out                         : out std_logic_vector(3 downto 0)
            ; rxoutclk_out                       : out std_logic_vector(3 downto 0)
            ; rxpmaresetdone_out                 : out std_logic_vector(3 downto 0)
            ; txpmaresetdone_out                 : out std_logic_vector(3 downto 0));
      end component flx_link;

  begin

    MGT_GEN : component flx_link
      port map (gtwiz_userclk_tx_reset_in(0)            => '0'                         -- : in  std_logic_vector(0 downto 0)
                , gtwiz_userclk_tx_srcclk_out(0)        => tx_srcclk_o                 -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_tx_usrclk_out(0)        => tx_usrclk_o                 -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_tx_usrclk2_out(0)       => tx_usrclk2_o                -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_tx_active_out           => open                        -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_rx_reset_in(0)          => '0'                         -- : in  std_logic_vector(0 downto 0)
                , gtwiz_userclk_rx_srcclk_out(0)        => rx_srcclk_o                 -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_rx_usrclk_out(0)        => rx_usrclk_o                 -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_rx_usrclk2_out(0)       => rx_usrclk2_o                -- : out std_logic_vector(0 downto 0)
                , gtwiz_userclk_rx_active_out           => open                        -- : out std_logic_vector(0 downto 0)
                , gtwiz_reset_clk_freerun_in(0)         => clk_freerun_i               -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_all_in(0)                 => sys_rst_i                   -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_tx_pll_and_datapath_in(0) => reset_tx_pll_and_datapath_i -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_tx_datapath_in(0)         => reset_tx_datapath_i         -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_pll_and_datapath_in(0) => reset_rx_pll_and_datapath_i -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_datapath_in(0)         => reset_rx_datapath_i         -- : in  std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_cdr_stable_out         => open                        -- : out std_logic_vector(0 downto 0)
                , gtwiz_reset_tx_done_out               => open                        -- : out std_logic_vector(0 downto 0)
                , gtwiz_reset_rx_done_out               => open                        -- : out std_logic_vector(0 downto 0)
                , gtwiz_userdata_tx_in(31 downto 0)     => mgt_word_vi(0)              -- : in  std_logic_vector(127 downto 0)
                , gtwiz_userdata_tx_in(63 downto 32)    => mgt_word_vi(1)              -- : in  std_logic_vector(127 downto 0)
                , gtwiz_userdata_tx_in(95 downto 64)    => mgt_word_vi(2)              -- : in  std_logic_vector(127 downto 0)
                , gtwiz_userdata_tx_in(127 downto 96)   => mgt_word_vi(3)              -- : in  std_logic_vector(127 downto 0)
                , gtwiz_userdata_rx_out(19 downto 0)    => mgt_word_vo(0)              -- : out std_logic_vector(79 downto 0)
                , gtwiz_userdata_rx_out(39 downto 20)   => mgt_word_vo(1)              -- : out std_logic_vector(79 downto 0)
                , gtwiz_userdata_rx_out(59 downto 40)   => mgt_word_vo(2)              -- : out std_logic_vector(79 downto 0)
                , gtwiz_userdata_rx_out(79 downto 60)   => mgt_word_vo(3)              -- : out std_logic_vector(79 downto 0)
                , gtrefclk01_in(0)                      => refclk0_i                   -- : in  std_logic_vector(0 downto 0)
                , qpll1outclk_out(0)                    => qpll1outclk_o               -- : out std_logic_vector(0 downto 0)
                , qpll1outrefclk_out(0)                 => qpll1outrefclk_o            -- : out std_logic_vector(0 downto 0)
                , gtyrxn_in                             => gty_rx_vni                  -- : in  std_logic_vector(3 downto 0)
                , gtyrxp_in                             => gty_rx_vpi                  -- : in  std_logic_vector(3 downto 0)
                , tx8b10ben_in                          => (others => '1')             -- : in  std_logic_vector(3 downto 0)
                , txctrl0_in                            => (others => '0')             -- : in  std_logic_vector(63 downto 0)
                , txctrl1_in                            => (others => '0')             -- : in  std_logic_vector(63 downto 0)
                , txctrl2_in                            => (others => '0')             -- : in  std_logic_vector(31 downto 0)
                , gtpowergood_out                       => open                        -- : out std_logic_vector(3 downto 0)
                , gtytxn_out                            => gty_tx_vno                  -- : out std_logic_vector(3 downto 0)
                , gtytxp_out                            => gty_tx_vpo                  -- : out std_logic_vector(3 downto 0)
                , rxoutclk_out                          => rxoutclk_vo                 -- : out std_logic_vector(3 downto 0)
                , rxpmaresetdone_out                    => reset_rx_done_vo            -- : out std_logic_vector(3 downto 0)
                , txpmaresetdone_out                    => reset_tx_done_vo);          -- : out std_logic_vector(3 downto 0))

  end generate gty_gen;

end architecture behavioral;
