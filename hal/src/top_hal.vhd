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

library hal;
use hal.all;
use hal.sector_logic_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;
use hal.constants_pkg.all;
use hal.mgt_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;


entity top_hal is

  port (

    -- 40MHz clock to MMCM
    clock_in_p : in std_logic;
    clock_in_n : in std_logic;

    -- LPGBT Links
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    -- pipeline clock
    clock_and_control : out l0mdt_control_rt;

    -- ttc
    ttc_commands : out l0mdt_ttc_rt;
    tts_commands : in  TTS_CMD_rt;

    -- TDC hits from CSM
    tdc_hits_inner  : out TDCPOLMUX_rt_array (c_NUM_POLMUX_INNER-1 downto 0);
    tdc_hits_middle : out TDCPOLMUX_rt_array (c_NUM_POLMUX_MIDDLE-1 downto 0);
    tdc_hits_outer  : out TDCPOLMUX_rt_array (c_NUM_POLMUX_OUTER-1 downto 0);

    -- Endcap + Neighbor Sector Logic Candidates
    endcap_slc_candidates : out SLC_ENDCAP_rt_array (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);

    -- Barrel + Neighbor Sector Logic Candidates
    barrel_slc_candidates : out SLC_BARREL_rt_array (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);

    --
    endcap_slc_pipeline : in SLCPROC_PIPE_ENDCAP_rt_array (c_NUM_SLCPROC_ENDCAP_OUTPUTS-1 downto 0);
    barrel_slc_pipeline : in SLCPROC_PIPE_BARREL_rt_array (c_NUM_SLCPROC_BARREL_OUTPUTS-1 downto 0);

    -- SF sharing to next chip
    segments_o : in  SF_RT_array (c_NUM_SF_OUTPUTS-1 downto 0);
    segments_i : out SF_RT_array (c_NUM_SF_INPUTS-1 downto 0);

    -- felix
    daq_links : in DAQ_LINK_rt_array (c_NUM_DAQ_LINKS-1 downto 0);

    sump : out std_logic

    );

end entity top_hal;
architecture behavioral of top_hal is

  signal clock_ibufds : std_logic;
  signal clocks       : system_clocks_rt;
  signal global_reset : std_logic;

  signal pipeline_bx_strobe : std_logic;

  --------------------------------------------------------------------------------
  -- LPGBT Glue
  --------------------------------------------------------------------------------

  signal lpgbt_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_word_array   : std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_uplink_bitslip : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

  constant lpgbt_downlink_data_rt_zero : lpgbt_downlink_data_rt :=  (
    ec    => (others =>'0'),
    ic    => (others =>'0'),
    data  => (others =>'0'),
    valid => '0');

  signal lpgbt_downlink_data : lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0)
    := (others => lpgbt_downlink_data_rt_zero);
  signal lpgbt_uplink_data   : lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_downlink_valid : std_logic;

  -- emulator cores
  signal lpgbt_emul_uplink_clk            : std_logic;
  signal lpgbt_emul_uplink_mgt_word_array : std32_array_t (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);
  signal lpgbt_emul_uplink_data           : lpgbt_uplink_data_rt_array (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);
  signal lpgbt_emul_uplink_ready          : std_logic_vector (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);
  signal lpgbt_emul_rst_uplink            : std_logic_vector (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0) := (others => '0');

  signal lpgbt_emul_downlink_clk            : std_logic;
  signal lpgbt_emul_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_downlink_data           : lpgbt_downlink_data_rt_array (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_downlink_ready          : std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_downlink_bitslip        : std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);
  signal lpgbt_emul_rst_downlink            : std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0) := (others => '0');

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
  -- Signal sumps for development
  --------------------------------------------------------------------------------

  signal lpgbt_uplink_sump     : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_sump : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);
  signal tdc_sump              : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);
  --signal sector_logic_rx_sump  : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Attributes for synthesis
  --------------------------------------------------------------------------------

  attribute DONT_TOUCH                         : string;
  attribute MAX_FANOUT                         : string;
  attribute MAX_FANOUT of pipeline_bx_strobe   : signal is "20";
  attribute DONT_TOUCH of pipeline_bx_strobe   : signal is "true";
  attribute MAX_FANOUT of lpgbt_downlink_valid : signal is "20";
  attribute DONT_TOUCH of lpgbt_downlink_valid : signal is "true";

  -- Save this here so we can extract it from the hierarchy later
  attribute NUM_MGTS                       : integer;
  attribute NUM_MGTS of mgt_wrapper_inst   : label is c_NUM_MGTS;  -- make a copy of this handy for tcl
  attribute DONT_TOUCH of mgt_wrapper_inst : label is "true";

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

  global_reset <= not (clocks.locked);

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
  -- Clock and reset to User Logic
  --------------------------------------------------------------------------------

  -- Create a 1 of N high signal synced to the 40MHZ clock
  --            ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ _
  -- clk      __|0|_|1|_|2|_|3|_|4|_|5|_|6|_|7|_|8|_|9|_|
  --            ___________________                 ________
  -- clk40    __|                  |________________|
  --            _____________________________________
  -- r80      __|                                   |______
  --                _____________________________________
  -- r80_dly  ______|                                   |__
  --            _____                               _____
  -- valid    __|   |_______________________________|   |__

  process (clocks.clock_pipeline, clocks.clock40)
    variable r80     : std_logic := '0';
    variable r80_dly : std_logic;
  begin
    if (rising_edge(clocks.clock40)) then
      r80 := not r80;
    end if;

    if (rising_edge(clocks.clock_pipeline)) then
      r80_dly := r80;
    end if;
    pipeline_bx_strobe <= r80_dly xor r80;
  end process;

  clock_and_control.clk   <= clocks.clock_pipeline;
  clock_and_control.rst_n <= not global_reset;
  clock_and_control.bx    <= pipeline_bx_strobe;

  ttc_commands.bcr <= '0';
  ttc_commands.ocr <= '0';
  ttc_commands.ecr <= '0';
  ttc_commands.l0a <= '0';
  ttc_commands.l1a <= '0';

  --------------------------------------------------------------------------------
  -- Common Multi-gigabit transceivers
  --------------------------------------------------------------------------------

  mgt_wrapper_inst : entity hal.mgt_wrapper
    port map (
      clocks => clocks,
      reset  => global_reset,

      -- reference clocks
      refclk_i_p => refclk_i_p,
      refclk_i_n => refclk_i_n,

      -- sector logic
      sl_rx_mgt_word_array_o => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_i => sl_tx_mgt_word_array,
      sl_tx_ctrl_i           => sl_tx_ctrl,
      sl_rx_slide_i          => sl_rx_slide,

      -- lpgbt
      lpgbt_rxslide_i                 => lpgbt_uplink_bitslip,
      lpgbt_downlink_mgt_word_array_i => lpgbt_downlink_mgt_word_array,
      lpgbt_uplink_mgt_word_array_o   => lpgbt_uplink_mgt_word_array,

      -- lpgbt emulator
      lpgbt_emul_rxslide_i                 => lpgbt_emul_downlink_bitslip,
      lpgbt_emul_downlink_mgt_word_array_o => lpgbt_emul_downlink_mgt_word_array,
      lpgbt_emul_uplink_mgt_word_array_i   => lpgbt_emul_uplink_mgt_word_array
      );

  --------------------------------------------------------------------------------
  -- LPGBT-FPGA Cores
  --------------------------------------------------------------------------------

  -- Create a 1 of 8 high signal synced to the 40MHZ clock
  --            ___ ___ ___ ___ ___ ___ ___ ___ ___
  -- clk320   __|0|_|1|_|2|_|3|_|4|_|5|_|6|_|7|_|8|_
  --            _________________               ________
  -- clk40    __|               |_______________|
  --            _________________________________
  -- r80      __|                               |______
  --                _________________________________
  -- r80_dly  ______|                               |__
  --            _____                           _____
  -- valid    __|   |___________________________|   |__

  process (clocks.clock320, clocks.clock40)
    variable r80     : std_logic := '0';
    variable r80_dly : std_logic;
  begin
    if (rising_edge(clocks.clock40)) then
      r80 := not r80;
    end if;

    if (rising_edge(clocks.clock320)) then
      r80_dly := r80;
    end if;
    lpgbt_downlink_valid <= r80_dly xor r80;
  end process;


  lpgbt_downlink_valid_gen : for I in 0 to c_NUM_LPGBT_DOWNLINKS-1 generate
    lpgbt_downlink_data(I).valid <= lpgbt_downlink_valid;
  end generate lpgbt_downlink_valid_gen;

  lpgbt_link_wrapper_inst : entity hal.lpgbt_link_wrapper
    port map (
      reset => global_reset,

      -- downlink
      lpgbt_downlink_clk_i            => clocks.clock320,
      lpgbt_downlink_reset_i          => (others => global_reset),
      lpgbt_downlink_mgt_word_array_o => lpgbt_downlink_mgt_word_array,
      lpgbt_downlink_ready_o          => open,
      lpgbt_downlink_data             => lpgbt_downlink_data,
      -- uplink
      lpgbt_uplink_clk_i              => clocks.clock320,
      lpgbt_uplink_reset_i            => (others => global_reset),
      lpgbt_uplink_data               => lpgbt_uplink_data,
      lpgbt_uplink_mgt_word_array_i   => lpgbt_uplink_mgt_word_array,
      lpgbt_uplink_bitslip_o          => lpgbt_uplink_bitslip,
      lpgbt_uplink_ready_o            => open
      );

  --------------------------------------------------------------------------------
  -- LPGBT Emulator
  --------------------------------------------------------------------------------

  lpgbtemul_wrapper_inst : entity hal.lpgbtemul_wrapper
    port map (
      reset                           => global_reset,
      lpgbt_uplink_clk_i              => clocks.clock320,
      lpgbt_uplink_mgt_word_array_o   => lpgbt_emul_uplink_mgt_word_array,
      lpgbt_uplink_data_i             => lpgbt_emul_uplink_data,
      lpgbt_uplink_ready_o            => lpgbt_emul_uplink_ready,
      lpgbt_rst_uplink_i              => lpgbt_emul_rst_uplink,
      lpgbt_downlink_clk_i            => clocks.clock320,
      lpgbt_downlink_mgt_word_array_i => lpgbt_emul_downlink_mgt_word_array,
      lpgbt_downlink_data_o           => lpgbt_emul_downlink_data,
      lpgbt_downlink_ready_o          => lpgbt_emul_downlink_ready,
      lpgbt_downlink_bitslip_o        => lpgbt_emul_downlink_bitslip,
      lpgbt_rst_downlink_i            => lpgbt_emul_rst_downlink
      );

  -- TODO: replace with with some kind of smarter driver?
  emul_loop : for I in 0 to c_NUM_LPGBT_EMUL_UPLINKS-1 generate
    emul_loop_clock : process (clocks.clock320) is
    begin  -- process data_loop
      if clocks.clock320'event and clocks.clock320 = '1' then  -- rising clock edge
        lpgbt_emul_uplink_data(I).data <= lpgbt_emul_downlink_data(I).data
                                          & lpgbt_emul_downlink_data(I).data
                                          & lpgbt_emul_downlink_data(I).data
                                          & lpgbt_emul_downlink_data(I).data
                                          & lpgbt_emul_downlink_data(I).data
                                          & lpgbt_emul_downlink_data(I).data
                                          & lpgbt_emul_downlink_data(I).data;
        lpgbt_emul_uplink_data(I).valid <= lpgbt_emul_downlink_data(I).valid;
      end if;
    end process;
  end generate;

  --------------------------------------------------------------------------------
  -- LPGBT Controller
  --------------------------------------------------------------------------------

  gbt_controller_wrapper_inst : entity hal.gbt_controller_wrapper
    port map (
      reset_i               => global_reset,
      clock                 => clocks.clock40,
      lpgbt_downlink_data_o => lpgbt_downlink_data,
      lpgbt_uplink_data_i   => lpgbt_uplink_data
      );

  --------------------------------------------------------------------------------
  -- Sector Logic Packet Former Cores
  --------------------------------------------------------------------------------

  sector_logic_link_wrapper_inst : entity hal.sector_logic_link_wrapper
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

  top_tdc_decoder_inst : entity tdc.top_tdc_decoder
    port map (
      clock          => clocks.clock320,
      pipeline_clock => clocks.clock_pipeline,

      reset => global_reset,

      lpgbt_uplink_data => lpgbt_uplink_data,  -- on lpgbt clock
      tdc_hits_inner    => tdc_hits_inner,
      tdc_hits_middle   => tdc_hits_middle,
      tdc_hits_outer    => tdc_hits_outer
      );

  top_tdc_control_inst : entity tdc.top_tdc_control
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

  --sl_rx_sump : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
  --  data_loop : process (clocks.clock240) is
  --  begin  -- process data_loop
  --    if clocks.clock240'event and clocks.clock240 = '1' then  -- rising clock edge
  --      sector_logic_rx_sump(I) <= xor_reduce (sl_rx_data(I).data);
  --    end if;
  --  end process data_loop;
  --end generate;

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

  sl_loop_loop : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
    data_loop : process (clocks.clock_pipeline) is
    begin  -- process data_loop
      if (rising_edge(clocks.clock_pipeline)) then  -- rising clock edge
        sl_tx_data(I).data  <= sl_rx_data(I).data;
        sl_tx_data(I).valid <= sl_rx_data(I).valid;
      end if;
    end process data_loop;
  end generate;

  data_loop : process (clocks.clock320) is
  begin  -- process data_loop
    if (rising_edge(clocks.clock320)) then        -- rising clock edge
      sump <= '0'; --xor_reduce (sector_logic_rx_sump);  -- xor_reduce (lpgbt_uplink_sump) xor xor_reduce(lpgbt_uplink_mgt_sump);
    end if;
  end process data_loop;

end architecture behavioral;
