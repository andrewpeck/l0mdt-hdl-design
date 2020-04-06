library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library unisim;
use unisim.vcomponents.all;

library tdc;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;
use l0mdt_lib.mdttp_constants_pkg.all;

library framework;
use framework.all;
use framework.sector_logic_pkg.all;
use framework.system_types_pkg.all;
use framework.lpgbt_pkg.all;
use framework.constants_pkg.all;
use framework.mgt_pkg.all;
use framework.board_pkg.all;
use framework.board_pkg_common.all;


entity top_framework is

  port (

    -- 40MHz clock to MMCM
    clock_in_p : in std_logic;
    clock_in_n : in std_logic;

    -- LPGBT Links
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    -- LPGBT Links
    mgt_rx_p : in std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_rx_n : in std_logic_vector (c_NUM_MGTS-1 downto 0);

    mgt_tx_p : out std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_tx_n : out std_logic_vector (c_NUM_MGTS-1 downto 0);

    -- pipeline clock
    pipeline_clock : out std_logic;

    -- ttc
    ttc_commands : out TTC_CMD_rt;

    -- TDC hits from CSM
    tdc_hits : out TDCPOLMUX_rt_array (c_NUM_POLMUX-1 downto 0);

    -- Endcap + Neighbor Sector Logic Candidates
    endcap_slc_candidates : out SLC_ENDCAP_rt_array (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);

    -- Barrel + Neighbor Sector Logic Candidates
    barrel_slc_candidates : out SLC_BARREL_rt_array (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);

    --
    endcap_slc_pipeline : in SLCPROC_PIPE_ENDCAP_rt_array (c_NUM_SLCPROC_ENDCAP_OUTPUTS-1 downto 0);
    barrel_slc_pipeline : in SLCPROC_PIPE_BARREL_rt_array (c_NUM_SLCPROC_BARREL_OUTPUTS-1 downto 0);

    -- felix
    tts_commands : in TTS_CMD_rt;
    daq_links    : in DAQ_LINK_rt_array (c_NUM_DAQ_LINKS-1 downto 0);


    -- asserted while mmcm locking
    reset : out std_logic;

    sump : out std_logic

    );

end entity top_framework;
architecture behavioral of top_framework is

  signal clock_ibufds : std_logic;
  signal clocks       : system_clocks_rt;
  signal global_reset : std_logic;

  --------------------------------------------------------------------------------
  -- LPGBT Glue
  --------------------------------------------------------------------------------

  signal lpgbt_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_word_array   : std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_uplink_bitslip : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_downlink_data : lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_data   : lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

  -- FIXME drive the valid strobe from somewhere real
  signal lpgbt_valid_strobe   : std_logic;
  signal lpgbt_uplink_sump    : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_sump    : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);
  signal tdc_sump             : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);
  signal sector_logic_rx_sump : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

  -- emulator cores
  signal lpgbt_emul_uplink_clk            : std_logic;
  signal lpgbt_emul_uplink_mgt_word_array : std32_array_t (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);
  signal lpgbt_emul_uplink_data           : lpgbt_uplink_data_rt_array (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);
  signal lpgbt_emul_uplink_ready          : std_logic_vector (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);
  signal lpgbt_emul_rst_uplink            : std_logic_vector (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);

  signal lpgbt_emul_downlink_clk            : std_logic;
  signal lpgbt_emul_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_downlink_data           : lpgbt_downlink_data_rt_array (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_downlink_ready          : std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_downlink_bitslip        : std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_rst_downlink            : std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Sector Logic Glue
  --------------------------------------------------------------------------------

  signal sl_rx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_data           : sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_data           : sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_tx_ctrl           : sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_ctrl           : sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_slide          : std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Save this here so we can extract it from the hierarchy later
  --------------------------------------------------------------------------------

  attribute NUM_MGTS                     : integer;
  attribute NUM_MGTS of mgt_wrapper_inst : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

begin  -- architecture behavioral

  --------------------------------------------------------------------------------
  --
  --------------------------------------------------------------------------------

  assert (c_NUM_LPGBT_UPLINKS mod 2 = 0)
    report "You NEED to instantiate an even number of uplinks because a CSM is always 2+1 (c_NUM_LPGBT_UPLINKS="
    & integer'image(c_NUM_LPGBT_UPLINKS) & " c_NUM_LPGBT_DOWNLINKS=)" & integer'image(c_NUM_LPGBT_DOWNLINKS)
    severity error;

  assert (c_NUM_LPGBT_UPLINKS/2 = c_NUM_LPGBT_DOWNLINKS)
    report "Number of LPGBT Uplinks should be twice the number of downlinks"
    & integer'image(c_NUM_LPGBT_UPLINKS) & "\nc_NUM_LPGBT_DOWNLINKS=" & integer'image(c_NUM_LPGBT_DOWNLINKS)
    severity error;

  --------------------------------------------------------------------------------
  --
  --------------------------------------------------------------------------------

  reset          <= global_reset;
  global_reset   <= not (clocks.locked);
  pipeline_clock <= clocks.clock_pipeline;


  --------------------------------------------------------------------------------
  -- Common Clocking
  --------------------------------------------------------------------------------

  IBUFDS_inst : IBUFDS
    generic map(DIFF_TERM    => true,   --DifferentialTermination
                IBUF_LOW_PWR => false,  --Lowpower(TRUE)vs.performance(FALSE)
                IOSTANDARD   => "LVDS")
    port map(
      O  => clock_ibufds,
      I  => clock_in_p,
      IB => clock_in_n
      );

  -- create a freerunnning clock, not stopped by the mmcm lock, used for state
  -- machine initialization of the mgts
  BUFG_freeclk_inst : BUFG
    port map (
      I => clock_ibufds,
      O => clocks.freeclock
      );

  -- mmcm for system clocks
  framework_mmcm_inst : entity xil_defaultlib.framework_mmcm
    port map (
      clk_out40        => clocks.clock40,
      clk_out240       => clocks.clock240,
      clk_out320       => clocks.clock320,
      clk_out_pipeline => clocks.clock_pipeline,
      locked           => clocks.locked,
      clk_in40         => clock_ibufds
      );

  --------------------------------------------------------------------------------
  -- Common Multi-gigabit transceivers
  --------------------------------------------------------------------------------

  mgt_wrapper_inst : entity framework.mgt_wrapper
    port map (
      clocks                               => clocks,
      reset                                => global_reset,
      -- reference clocks
      refclk_i_p                           => refclk_i_p,
      refclk_i_n                           => refclk_i_n,
      -- transceivers
      mgt_tx_p                             => mgt_tx_p,
      mgt_tx_n                             => mgt_tx_n,
      mgt_rx_p                             => mgt_rx_p,
      mgt_rx_n                             => mgt_rx_n,
      -- sector logic
      sl_rx_mgt_word_array_o               => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_i               => sl_tx_mgt_word_array,
      sl_tx_ctrl_i                         => sl_tx_ctrl,
      sl_rx_slide_i                        => sl_rx_slide,
      -- lpgbt
      lpgbt_rxslide_i                      => lpgbt_uplink_bitslip,
      lpgbt_downlink_mgt_word_array_i      => lpgbt_downlink_mgt_word_array,
      lpgbt_uplink_mgt_word_array_o        => lpgbt_uplink_mgt_word_array,
      -- lpgbt emulator
      lpgbt_emul_rxslide_i                 => lpgbt_emul_downlink_bitslip,
      lpgbt_emul_downlink_mgt_word_array_o => lpgbt_emul_downlink_mgt_word_array,
      lpgbt_emul_uplink_mgt_word_array_i   => lpgbt_emul_uplink_mgt_word_array
      );

  --------------------------------------------------------------------------------
  -- LPGBT-FPGA Cores
  --------------------------------------------------------------------------------

  -- FIXME: should sync this to the downlink controller logic which is still tbd
  -- 320 MHz enable, goes high 1 of 8 clocks
  process (clocks.clock320)
    variable counter : integer range 0 to 8;
  begin
    if (rising_edge(clocks.clock320)) then

      if global_reset = '1' then
        counter := 0;
        lpgbt_valid_strobe <= '0';
      elsif (counter=8) then
        counter := 0;
        lpgbt_valid_strobe <= '1';
      else
        counter := counter + 1;
        lpgbt_valid_strobe <= '0';
      end if;
    end if;
  end process;

  -- FIXME: remove the loopback later once we have a downlink controller
  lpgbt_downlink_valid_gen : for I in 0 to c_NUM_LPGBT_DOWNLINKS-1 generate
    -- data_loop : process (clocks.clock320) is
    -- begin  -- process data_loop
    --   if clocks.clock320'event and clocks.clock320 = '1' then  -- rising clock edge
    --     lpgbt_downlink_data(I).data <= lpgbt_uplink_data(I).data(223 downto 192) xor lpgbt_uplink_data(I).data(191 downto 160) xor lpgbt_uplink_data(I).data(159 downto 128) xor lpgbt_uplink_data(I).data(127 downto 96) xor lpgbt_uplink_data(I).data(95 downto 64) xor lpgbt_uplink_data(I).data(63 downto 32) xor lpgbt_uplink_data(I).data(31 downto 0);
    --   end if;
    -- end process data_loop;
    lpgbt_downlink_data(I).valid <= lpgbt_valid_strobe;
  end generate lpgbt_downlink_valid_gen;

  lpgbt_link_wrapper_inst : entity framework.lpgbt_link_wrapper
    port map (
      reset => global_reset,

      lpgbt_downlink_clk_i            => clocks.clock320,
      lpgbt_downlink_reset_i          => (others => global_reset),
      lpgbt_downlink_mgt_word_array_o => lpgbt_downlink_mgt_word_array,
      lpgbt_downlink_ready_o          => open,
      lpgbt_downlink_data             => lpgbt_downlink_data,

      lpgbt_uplink_clk_i            => clocks.clock320,
      lpgbt_uplink_reset_i          => (others => global_reset),
      lpgbt_uplink_data             => lpgbt_uplink_data,
      lpgbt_uplink_mgt_word_array_i => lpgbt_uplink_mgt_word_array,
      lpgbt_uplink_bitslip_o        => lpgbt_uplink_bitslip,
      lpgbt_uplink_ready_o          => open
      );

  --------------------------------------------------------------------------------
  -- LPGBT Emulator
  --------------------------------------------------------------------------------

  lpgbtemul_wrapper_inst : entity work.lpgbtemul_wrapper
    port map (
      reset                           => global_reset,
      lpgbt_uplink_clk_i              => lpgbt_emul_uplink_clk,
      lpgbt_uplink_mgt_word_array_o   => lpgbt_emul_uplink_mgt_word_array,
      lpgbt_uplink_data_i             => lpgbt_emul_uplink_data,
      lpgbt_uplink_ready_o            => lpgbt_emul_uplink_ready,
      lpgbt_rst_uplink_i              => lpgbt_emul_rst_uplink,
      lpgbt_downlink_clk_i            => lpgbt_emul_downlink_clk,
      lpgbt_downlink_mgt_word_array_i => lpgbt_emul_downlink_mgt_word_array,
      lpgbt_downlink_data_o           => lpgbt_emul_downlink_data,
      lpgbt_downlink_ready_o          => lpgbt_emul_downlink_ready,
      lpgbt_downlink_bitslip_o        => lpgbt_emul_downlink_bitslip,
      lpgbt_rst_downlink_i            => lpgbt_emul_rst_downlink
      );

  --------------------------------------------------------------------------------
  -- LPGBT Controller
  --------------------------------------------------------------------------------

  gbt_controller_wrapper_inst : entity work.gbt_controller_wrapper
    port map (
      reset_i               => global_reset,
      clocks                => clocks,
      lpgbt_downlink_data_o => lpgbt_downlink_data,
      lpgbt_uplink_data_i   => lpgbt_uplink_data,
      rx_clk_i              => clocks.clock320,
      tx_clk_i              => clocks.clock320,
      tx_clk_en_i           => lpgbt_valid_strobe
      );

  --------------------------------------------------------------------------------
  -- Sector Logic Packet Former Cores
  --------------------------------------------------------------------------------

  sector_logic_link_wrapper_inst : entity framework.sector_logic_link_wrapper
    port map (
      clock                  => clocks.clock240,  -- 240 MHz sector logic userclk
      pipeline_clock         => clocks.clock_pipeline,
      reset                  => global_reset,
      sl_rx_mgt_word_array_i => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_o => sl_tx_mgt_word_array,

      sl_rx_data_o => sl_rx_data,
      sl_tx_data_i => sl_tx_data,

      sl_rx_ctrl_i => sl_rx_ctrl,
      sl_tx_ctrl_o => sl_tx_ctrl,

      sl_rx_slide_o => sl_rx_slide
      );

  --------------------------------------------------------------------------------
  -- TDC Decoder Cores
  --------------------------------------------------------------------------------

  tdc_decoder_wrapper_inst : entity tdc.tdc_decoder_wrapper
    port map (
      clock          => clocks.clock320,
      pipeline_clock => clocks.clock_pipeline,

      reset => global_reset,

      lpgbt_uplink_data => lpgbt_uplink_data,  -- on lpgbt clock
      tdc_hits          => tdc_hits            -- on pipeline clock already
      );

  top_tdc_control_inst: entity tdc.top_tdc_control
    port map (
      clock40             => clocks.clock40,
      reset               => global_reset,
      trg_i               => std_logic_0,
      bcr_i               => std_logic_0,
      ecr_i               => std_logic_0,
      gsr_i               => std_logic_0,
      lpgbt_downlink_data => lpgbt_downlink_data
      );
  --------------------------------------------------------------------------------
  -- Sumps to prevent trimming
  --------------------------------------------------------------------------------

  -- sl_rx_sump: for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
  --   data_loop: process (clocks.clock240) is
  --   begin  -- process data_loop
  --     if clocks.clock240'event and clocks.clock240 = '1' then  -- rising clock edge
  --       sector_logic_rx_sump(I) <= or_reduce (sl_rx_data(I).data);
  --     end if;
  --   end process data_loop;
  -- end generate;

  -- let this sump as tdc data in the user_top
  -- lpgbt_sump_loop : for I in 0 to c_NUM_LPGBT_UPLINKS-1 generate
  --   data_loop : process (clocks.clock320) is
  --   begin  -- process data_loop
  --     if (rising_edge(clocks.clock320)) then  -- rising clock edge
  --       lpgbt_uplink_sump(I) <= xor_reduce (lpgbt_uplink_data(I).data);
  --       lpgbt_uplink_mgt_sump(I) <= xor_reduce (lpgbt_uplink_mgt_word_array(I));
  --     end if;
  --   end process data_loop;
  -- end generate;

  sl_sump_loop : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
    data_loop : process (clocks.clock240) is
    begin  -- process data_loop
      if (rising_edge(clocks.clock240)) then  -- rising clock edge
        sl_tx_data(I).data  <= sl_rx_data(I).data;
        sl_tx_data(I).valid <= sl_rx_data(I).valid;
      end if;
    end process data_loop;
  end generate;

  data_loop : process (clocks.clock320) is
  begin  -- process data_loop
    if (rising_edge(clocks.clock320)) then  -- rising clock edge
      sump <= '1'; -- xor_reduce (lpgbt_uplink_sump) xor xor_reduce(lpgbt_uplink_mgt_sump);
    end if;
  end process data_loop;

end architecture behavioral;
