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
use hal.sector_logic_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;
use hal.constants_pkg.all;
use hal.mgt_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;

library ctrl;
use ctrl.hal_ctrl.all;
use ctrl.axiRegPkg.all;

entity top_hal is

  port (

    --------------------------------------------------------------------------------
    -- Hardware clocking
    --------------------------------------------------------------------------------

    -- 100MHz ASYNC clock
    clock_100m_i_p : in std_logic;
    clock_100m_i_n : in std_logic;

    -- 320MHz ASYNC clock to MMCM
    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    -- 320MHz clock out
    lhc_refclk_o_p : out std_logic;
    lhc_refclk_o_n : out std_logic;

    -- LPGBT Links
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Pipeline clock and control
    --------------------------------------------------------------------------------

    -- pipeline clock
    clock_and_control_o : out l0mdt_control_rt;

    -- ttc
    ttc_commands : out l0mdt_ttc_rt;

    --------------------------------------------------------------------------------
    -- Data outputs
    --------------------------------------------------------------------------------

    -- TDC hits from CSM
    tdc_hits_inner  : out TDCPOLMUX_avt (c_NUM_POLMUX_INNER-1 downto 0);
    tdc_hits_middle : out TDCPOLMUX_avt (c_NUM_POLMUX_MIDDLE-1 downto 0);
    tdc_hits_outer  : out TDCPOLMUX_avt (c_NUM_POLMUX_OUTER-1 downto 0);
    tdc_hits_extra  : out TDCPOLMUX_avt (c_NUM_POLMUX_EXTRA-1 downto 0);

    -- Endcap + Neighbor Sector Logic Candidates
    slc_o : out SLC_avt (c_NUM_SLC-1 downto 0);

    -- Segments from neighbor
    plus_neighbor_segments_o  : in SF_avt (c_NUM_SF_INPUTS-1 downto 0);
    minus_neighbor_segments_o : in SF_avt (c_NUM_SF_INPUTS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Data inputs
    --------------------------------------------------------------------------------

    -- NSP + MUCTPI
    MTC_i : in MTC_avt (c_NUM_MTC-1 downto 0);
    NSP_i : in NSP_avt (c_NUM_NSP-1 downto 0);

    -- Segments from neighbor
    plus_neighbor_segments_i  : out SF_avt (c_NUM_SF_OUTPUTS-1 downto 0);
    minus_neighbor_segments_i : out SF_avt (c_NUM_SF_OUTPUTS-1 downto 0);

    --------------------------------------------------------------------------------
    -- felix
    --------------------------------------------------------------------------------

    daq_streams : in FELIX_STREAM_avt (c_NUM_DAQ_LINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- AXI
    --------------------------------------------------------------------------------

    axi_clk_o : out std_logic;

    hal_readmosi  : in  axireadmosi;
    hal_readmiso  : out axireadmiso;
    hal_writemosi : in  axiwritemosi;
    hal_writemiso : out axiwritemiso;

    --sump--------------------------------------------------------------------------
    sump : out std_logic

    );

end entity top_hal;
architecture behavioral of top_hal is

  signal HAL_MON : HAL_MON_t;

  signal clock_ibufds            : std_logic;
  signal clocks                  : system_clocks_rt;
  signal global_reset            : std_logic;
  signal felix_phase_out_of_sync : std_logic;  -- FIXME: connect to AXI

  signal strobe_pipeline : std_logic;
  signal strobe_320      : std_logic;
  signal felix_valid     : std_logic;

  --------------------------------------------------------------------------------
  -- LPGBT Glue
  --------------------------------------------------------------------------------

  signal lpgbt_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_word_array   : std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_uplink_bitslip : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

  constant lpgbt_downlink_data_rt_zero : lpgbt_downlink_data_rt := (
    ec    => (others => '0'),
    ic    => (others => '0'),
    data  => (others => '0'),
    valid => '0');

  signal lpgbt_downlink_data : lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0)
    := (others => lpgbt_downlink_data_rt_zero);
  signal lpgbt_uplink_data : lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

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
  -- FELIX
  --------------------------------------------------------------------------------

  signal felix_mgt_rxusrclk          : std_logic_vector (c_NUM_FELIX_DOWNLINKS-1 downto 0);
  signal felix_uplink_mgt_word_array : std64_array_t (c_NUM_FELIX_UPLINKS-1 downto 0);
  signal felix_mgt_txusrclk          : std_logic_vector (c_NUM_FELIX_UPLINKS-1 downto 0);

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
  attribute MAX_FANOUT of strobe_pipeline      : signal is "20";
  attribute DONT_TOUCH of strobe_pipeline      : signal is "true";
  attribute MAX_FANOUT of lpgbt_downlink_valid : signal is "20";
  attribute DONT_TOUCH of lpgbt_downlink_valid : signal is "true";

  -- Save this here so we can extract it from the hierarchy later
  attribute NUM_MGTS                       : integer;
  attribute NUM_MGTS of mgt_wrapper_inst   : label is c_NUM_MGTS;  -- make a copy of this handy for tcl
  attribute DONT_TOUCH of mgt_wrapper_inst : label is "true";

begin  -- architecture behavioral

  --------------------------------------------------------------------------------
  -- Signal Aliasing
  --------------------------------------------------------------------------------

  global_reset <= not (clocks.locked);
  axi_clk_o    <= clocks.axiclock;

  --------------------------------------------------------------------------------
  -- AXI Interface
  --------------------------------------------------------------------------------

  hal_interface_inst : entity ctrl.hal_interface
    port map (
      clk_axi         => clocks.axiclock,
      reset_axi_n     => '1',
      slave_readmosi  => hal_readmosi,
      slave_readmiso  => hal_readmiso,
      slave_writemosi => hal_writemosi,
      slave_writemiso => hal_writemiso,

      -- monitor signals in
      mon => hal_mon

     -- control signals out
      );

  hal_mon.clocking.mmcm_locked <= clocks.locked;

  --------------------------------------------------------------------------------
  -- Common Clocking
  --------------------------------------------------------------------------------

  top_clocking_inst : entity hal.top_clocking
    port map (
      --
      reset_i          => std_logic0,   -- TODO: should be sourced from AXI
      select_felix_clk => std_logic0,   -- TODO: should be sourced from AXI

      -- synchronization
      sync_i         => not clocks.locked,  -- TODO should be sourced from AXI ? or auto?
      felix_valid_i  => felix_valid,
      felix_recclk_i => felix_mgt_rxusrclk(c_FELIX_RECCLK_SRC),
      out_of_sync_o  => felix_phase_out_of_sync,

      -- clock inputs
      -- this is the 100MHz UNSTOPPABLE clock that should be used to run any core logic (AXI and so on)
      clock_100m_i_p => clock_100m_i_p,
      clock_100m_i_n => clock_100m_i_n,
      clock_i_p      => clock_i_p,
      clock_i_n      => clock_i_n,

      -- clock output to pins
      lhc_refclk_o_p => lhc_refclk_o_p,
      lhc_refclk_o_n => lhc_refclk_o_n,

      -- system clocks
      clocks_o => clocks,

      -- bx strobes
      strobe_320_o      => strobe_320,
      strobe_pipeline_o => strobe_pipeline,

      -- mmcm status
      locked_o => clocks.locked
      );

  clock_and_control_o.rst_n <= not global_reset;  -- FIXME, synchronize to clock
  clock_and_control_o.clk   <= clocks.clock_pipeline;
  clock_and_control_o.bx    <= strobe_pipeline;

  --------------------------------------------------------------------------------
  -- Common Multi-gigabit transceivers
  --------------------------------------------------------------------------------

  mgt_wrapper_inst : entity hal.mgt_wrapper
    port map (

      -- clocks
      clocks => clocks,

      -- reset
      reset => global_reset,

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
      lpgbt_emul_uplink_mgt_word_array_i   => lpgbt_emul_uplink_mgt_word_array,

      -- Felix
      -- n.b. felix Downlinks are carried on the LPGBT links
      felix_uplink_mgt_word_array_i => felix_uplink_mgt_word_array,
      felix_mgt_rxusrclk_o          => felix_mgt_rxusrclk,
      felix_mgt_txusrclk_o          => felix_mgt_txusrclk
      );

  --------------------------------------------------------------------------------
  -- LPGBT-FPGA Cores
  --------------------------------------------------------------------------------

  lpgbt_downlink_valid_gen : for I in 0 to c_NUM_LPGBT_DOWNLINKS-1 generate
    lpgbt_downlink_data(I).valid <= strobe_320;
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
      trg_i               => std_logic0,
      bcr_i               => ttc_commands.bcr,
      ecr_i               => ttc_commands.ecr,
      gsr_i               => std_logic0,
      lpgbt_downlink_data => lpgbt_downlink_data
      );

  --------------------------------------------------------------------------------
  -- Felix Receiver
  --------------------------------------------------------------------------------

  -- TODO: create copies of ttc signals on different clocks?
  felix_decoder_inst : entity work.felix_decoder
    port map (
      clock             => clocks.clock40,
      reset             => global_reset,
      lpgbt_uplink_data => lpgbt_uplink_data(c_NUM_LPGBT_UPLINKS-1),
      l0mdt_ttc         => ttc_commands,
      valid_o           => felix_valid
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
    if (rising_edge(clocks.clock320)) then  -- rising clock edge
      sump <= '0';                          --xor_reduce (sector_logic_rx_sump);  -- xor_reduce (lpgbt_uplink_sump) xor xor_reduce(lpgbt_uplink_mgt_sump);
    end if;
  end process data_loop;

end architecture behavioral;
