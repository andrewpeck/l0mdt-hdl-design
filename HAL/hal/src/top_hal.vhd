library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library unisim;
use unisim.vcomponents.all;

library tdc;

library hal;
use hal.sector_logic_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;
use hal.constants_pkg.all;
use hal.mgt_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.link_map.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ctrl_lib;
use ctrl_lib.HAL_CTRL.all;
use ctrl_lib.HAL_CORE_CTRL.all;
use ctrl_lib.axiRegPkg.all;

library xpm;
use xpm.vcomponents.all;

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
    ttc_commands_o : out l0mdt_ttc_rt;

    --------------------------------------------------------------------------------
    -- Data outputs
    --------------------------------------------------------------------------------

    -- TDC hits from CSM
    tdc_hits_inner  : out mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_INN-1 downto 0);
    tdc_hits_middle : out mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_MID-1 downto 0);
    tdc_hits_outer  : out mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
    tdc_hits_extra  : out mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_EXT-1 downto 0);

    --------------------------------------------------------------------------------
    -- SLC
    --------------------------------------------------------------------------------

    main_primary_slc   : out slc_rx_bus_avt(2 downto 0);  -- is the main SL used
    main_secondary_slc : out slc_rx_bus_avt(2 downto 0);  -- only used in the big endcap
    plus_neighbor_slc  : out slc_rx_rvt;
    minus_neighbor_slc : out slc_rx_rvt;

    -- pt from neighbor
    plus_neighbor_segments_o  : out sf2pt_bus_avt (c_NUM_SF_INPUTS -1 downto 0);
    minus_neighbor_segments_o : out sf2pt_bus_avt (c_NUM_SF_INPUTS -1 downto 0);

    -- pt to neighbor
    plus_neighbor_segments_i  : in sf2pt_bus_avt (c_NUM_SF_OUTPUTS -1 downto 0);
    minus_neighbor_segments_i : in sf2pt_bus_avt (c_NUM_SF_OUTPUTS -1 downto 0);

    --------------------------------------------------------------------------------
    -- NSP + MUCTPI
    --------------------------------------------------------------------------------

    MTC_i : in mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
    NSP_i : in mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

    --------------------------------------------------------------------------------
    -- felix
    --------------------------------------------------------------------------------

    -- FIXME: note that right now (10/19/2021) the daq stream is a 65 bit field,
    -- which needs to change somehow to pack into the 32 bit / bx that we can
    -- send to FELIX
    daq_streams : in FELIX_STREAM_bus_avt (c_HPS_MAX_HP_INN
                                           + c_HPS_MAX_HP_MID
                                           + c_HPS_MAX_HP_OUT - 1 downto 0);

    --------------------------------------------------------------------------------
    -- AXI
    --------------------------------------------------------------------------------

    Mon  : out HAL_MON_t;
    Ctrl : in  HAL_CTRL_t;

    Core_Mon  : out HAL_CORE_MON_t;
    Core_Ctrl : in  HAL_CORE_CTRL_t;

    axi_clk_o : out std_logic;

    clk320_o : out std_logic;
    clk40_o  : out std_logic;

    --sump--------------------------------------------------------------------------
    sump : out std_logic

    );

end entity top_hal;
architecture behavioral of top_hal is

  attribute MAX_FANOUT : string;
  attribute DONT_TOUCH : string;

  signal clock_ibufds : std_logic;
  signal clocks       : system_clocks_rt;

  signal global_reset       : std_logic;
  signal userlogic_reset    : std_logic;
  signal reset              : std_logic;

  signal strobe_pipeline : std_logic;
  signal strobe_320      : std_logic;

  signal felix_valid : std_logic;

  signal ttc_commands : l0mdt_ttc_rt;

  --------------------------------------------------------------------------------
  -- LPGBT Glue
  --------------------------------------------------------------------------------

  signal lpgbt_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_word_array   : std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal felix_ttc_mgt_word : std_logic_vector (31 downto 0);
  signal felix_ttc_bitslip  : std_logic;

  signal lpgbt_uplink_bitslip : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

  -- lpgbt emulator cores
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
  -- TDC Glue
  --------------------------------------------------------------------------------

  signal tdc_hits_to_polmux    : mdt_polmux_bus_avt (c_NUM_TDC_INPUTS-1 downto 0);
  signal read_done_from_polmux : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- FELIX Glue
  --------------------------------------------------------------------------------

  signal felix_mgt_rxusrclk          : std_logic_vector (c_NUM_FELIX_DOWNLINKS-1 downto 0);
  signal felix_uplink_mgt_word_array : std32_array_t (c_NUM_FELIX_UPLINKS-1 downto 0);
  signal felix_mgt_txusrclk          : std_logic_vector (c_NUM_FELIX_UPLINKS-1 downto 0);
  signal lhc_recclk                  : std_logic;

  --------------------------------------------------------------------------------
  -- Sector Logic Glue
  --------------------------------------------------------------------------------

  signal sl_rx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_tx_ctrl           : sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_ctrl           : sl_rx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_rx_slide          : std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_data           : slc_rx_bus_avt (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_clks           : std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_clks           : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_rx_data_sump      : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Signal sumps for development
  --------------------------------------------------------------------------------

  signal lpgbt_uplink_sump     : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);
  signal lpgbt_uplink_mgt_sump : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);
  signal tdc_sump              : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);
  --signal sector_logic_rx_sump  : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Attributes for synthesis
  --------------------------------------------------------------------------------

  attribute MAX_FANOUT of strobe_pipeline : signal is "20";
  attribute DONT_TOUCH of strobe_pipeline : signal is "true";

  attribute MAX_FANOUT of strobe_320 : signal is "20";

  -- Save this here so we can extract it from the hierarchy later
  -- this is used in log_mgts.tcl so please do not remove it
  attribute NUM_MGTS                       : integer;
  attribute NUM_MGTS of mgt_wrapper_inst   : label is c_NUM_MGTS;
  attribute DONT_TOUCH of mgt_wrapper_inst : label is "true";

begin  -- architecture behavioral

  --------------------------------------------------------------------------------
  -- Signal Aliasing
  --------------------------------------------------------------------------------

  global_reset <= not (clocks.locked);
  axi_clk_o    <= clocks.axiclock;
  clk320_o     <= clocks.clock320;
  clk40_o      <= clocks.clock40;

  --------------------------------------------------------------------------------
  -- AXI Interface
  --------------------------------------------------------------------------------

  core_mon.clocking.mmcm_locked <= clocks.locked;

  --------------------------------------------------------------------------------
  -- Common Clocking
  --------------------------------------------------------------------------------

  lhc_refclk_OBUFDS_inst : OBUFDS
    port map (
      O  => lhc_refclk_o_p,             -- 1-bit output: Diff_p output (connect directly to top-level port)
      OB => lhc_refclk_o_n,             -- 1-bit output: Diff_n output (connect directly to top-level port)
      I  => lhc_recclk                  -- 1-bit input: Buffer input
      );

  top_clocking_inst : entity hal.top_clocking
    port map (
      --
      reset_i => core_ctrl.clocking.reset_mmcm,

      -- clock inputs
      -- this is the 100MHz UNSTOPPABLE clock that should be used to run any core logic (AXI and so on)
      clock_100m_i_p => clock_100m_i_p,
      clock_100m_i_n => clock_100m_i_n,

      -- 40MHz clock from Si synth, this is either free-running or locked onto
      -- the 40MHz clock that comes from FELIX (recovered through this FPGA)
      clock_i_p => clock_i_p,
      clock_i_n => clock_i_n,

      -- system clocks
      clocks_o => clocks,

      -- mmcm status
      locked_o => clocks.locked
      );

  clock_strobe_1 : entity work.clock_strobe
    generic map (RATIO => 8)
    port map (
      fast_clk_i => clocks.clock320,
      slow_clk_i => clocks.clock40,
      strobe_o   => strobe_320
      );

  clock_strobe_2 : entity work.clock_strobe
    generic map (RATIO => 8)
    port map (
      fast_clk_i => clocks.clock_pipeline,
      slow_clk_i => clocks.clock40,
      strobe_o   => strobe_pipeline
      );

  rst_bit_synchronizer : xpm_cdc_sync_rst
    generic map (DEST_SYNC_FF => 4, INIT => 1, INIT_SYNC_FF => 1)
    port map (
      dest_rst => reset,
      dest_clk => clocks.clock320,
      src_rst  => global_reset);

  pipeline_rst_bit_synchronizer : xpm_cdc_sync_rst
    generic map (DEST_SYNC_FF => 5, INIT => 1, INIT_SYNC_FF => 1)
    port map (
      dest_rst => userlogic_reset,
      dest_clk => clocks.clock_pipeline,
      src_rst  => global_reset);

  -- insert a bufg into the reset for fanout
  userlogic_bufg : BUFG
    port map (
      I => userlogic_reset,
      O => clock_and_control_o.rst
      );

  clock_and_control_o.clk <= clocks.clock_pipeline;
  clock_and_control_o.bx  <= strobe_pipeline;

  --------------------------------------------------------------------------------
  -- Common Multi-gigabit transceivers
  --------------------------------------------------------------------------------

  mgt_wrapper_inst : entity hal.mgt_wrapper
    port map (

      -- clocks
      clocks => clocks,

      -- reset
      reset => '0',                     -- need a separate reset from the mmcm due to recovered links

      recclk_o => lhc_recclk,

      ctrl => core_ctrl.mgt,
      mon  => core_mon.mgt,

      -- reference clocks
      refclk_i_p => refclk_i_p,
      refclk_i_n => refclk_i_n,

      -- sector logic
      sl_rx_mgt_word_array_o => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_i => sl_tx_mgt_word_array,
      sl_tx_ctrl_i           => sl_tx_ctrl,
      sl_rx_ctrl_o           => sl_rx_ctrl,
      sl_rx_slide_i          => sl_rx_slide,
      sl_tx_clk              => sl_tx_clks,
      sl_rx_clk              => sl_rx_clks,

      -- lpgbt
      lpgbt_rxslide_i                 => lpgbt_uplink_bitslip,
      lpgbt_downlink_mgt_word_array_i => lpgbt_downlink_mgt_word_array,
      lpgbt_uplink_mgt_word_array_o   => lpgbt_uplink_mgt_word_array,

      -- lpgbt emulator
      lpgbt_emul_rxslide_i                 => lpgbt_emul_downlink_bitslip,
      lpgbt_emul_downlink_mgt_word_array_o => lpgbt_emul_downlink_mgt_word_array,
      lpgbt_emul_uplink_mgt_word_array_i   => lpgbt_emul_uplink_mgt_word_array,

      -- Felix
      -- felix Downlinks are carried on the LPGBT links
      felix_ttc_bitslip_i  => felix_ttc_bitslip,
      felix_ttc_mgt_word_o => felix_ttc_mgt_word,

      felix_uplink_mgt_word_array_i => felix_uplink_mgt_word_array,
      felix_mgt_rxusrclk_o          => felix_mgt_rxusrclk,
      felix_mgt_txusrclk_o          => felix_mgt_txusrclk
      );

  --------------------------------------------------------------------------------
  -- LPGBT Emulator
  --------------------------------------------------------------------------------

  -- FIXME: just use 1 instance of the emulator and mux the downlink data to each
  -- 
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

  -- TODO: replace with with some kind of smarter driver? prbs31?
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
  -- CSM + PolMux
  --------------------------------------------------------------------------------

  -- 0 to e.g. 17 CSM Boards
  csm_gen : for I in c_MDT_CONFIG'range generate
    constant hi      : integer := csm_hi_lo (I).hi;
    constant lo      : integer := csm_hi_lo (I).lo;
    constant tdc_cnt : integer := count_ones(c_MDT_CONFIG(I).en);
    constant mgt_idx : integer := get_csm_mgt_num(I, c_MGT_MAP);
  begin
    csm_ifgen : if (I < c_NUM_CSMS_ACTIVE and tdc_cnt > 0) generate
    begin

      mgt_tag : for MGT_NUM in mgt_idx to mgt_idx generate
      begin

        assert false report
          "Generating CSM #" & integer'image(I)
          & " bithi=" & integer'image(hi)
          & " bitlo=" & integer'image(lo)
          severity note;

        csm_inst : entity work.csm
          generic map (
            g_CSM_ID  => c_MDT_CONFIG(I).csm_id,
            g_TDC_CNT => tdc_cnt
            )
          port map (
            reset_i                      => global_reset,
            trg_i                        => ttc_commands.l0a,
            bcr_i                        => ttc_commands.bcr,
            ecr_i                        => ttc_commands.ecr,
            gsr_i                        => global_reset,     -- TODO: axi control
            clk40                        => clocks.clock40,
            strobe_320                   => strobe_320,
            downlink_clk                 => clocks.clock320,  -- ZDM?
            downlink_mgt_word_array_o(0) => lpgbt_downlink_mgt_word_array(I),
            uplink_mgt_word_array_i      => lpgbt_uplink_mgt_word_array(I*2+1 downto I*2),
            uplink_clk                   => clocks.clock320,  -- ZDM?
            uplink_bitslip_o             => lpgbt_uplink_bitslip(I*2+1 downto I*2),
            tdc_hits_to_polmux_o         => tdc_hits_to_polmux (hi downto lo),
            read_done_from_polmux_i      => read_done_from_polmux (hi downto lo),
            ctrl                         => ctrl.csm.csm(I),
            mon                          => mon.csm.csm(I)
            );

      end generate;
    end generate;
  end generate;

  -- 0 to 3, inner middle outer extra
  station_gen : for I in 0 to 3 generate
    constant num_polmuxes :
      int_array_t (0 to 3) := (c_NUM_POLMUX_INNER,
                               c_NUM_POLMUX_MIDDLE,
                               c_NUM_POLMUX_OUTER,
                               c_NUM_POLMUX_EXTRA);
  begin

    polmux_gen : for J in 0 to num_polmuxes(I)-1 generate
      constant id       : integer := get_polmux_global_id (c_MDT_CONFIG, J, stations(I));
      constant hi       : integer := polmux_hi_lo (id).hi;
      constant lo       : integer := polmux_hi_lo (id).lo;
      constant width    : integer := hi-lo+1;
      signal tdc_hits_o : tdcpolmux2tar_rvt;
    begin

      assert false report "Generating PolMux #" & integer'image(id)
        & " width=" & integer'image(width)
        & " bithi=" & integer'image(hi)
        & " bitlo=" & integer'image(lo)
        severity note;

      polmux_wrapper_inst : entity work.polmux_wrapper
        generic map (
          g_WIDTH       => width,             -- number of tdcs
          g_ID          => id,
          g_STATION     => stations(I),
          g_STATION_STR => stations_str(I)
          )
        port map (
          clock          => clocks.clock320,  -- ZDM?
          pipeline_clock => clocks.clock_pipeline,
          reset          => reset,
          tdc_hits_i     => tdc_hits_to_polmux (hi downto lo),
          read_done_o    => read_done_from_polmux (hi downto lo),
          tdc_hits_o     => tdc_hits_o
          );

      inner : if (I = 0) generate
        tdc_hits_inner(J) <= tdc_hits_o;
      end generate;
      middle : if (I = 1) generate
        tdc_hits_middle (J) <= tdc_hits_o;
      end generate;
      outer : if (I = 2) generate
        tdc_hits_outer (J) <= tdc_hits_o;
      end generate;
      extra : if (I = 3) generate
        tdc_hits_extra(J) <= tdc_hits_o;
      end generate;

    end generate;

  end generate;

  --------------------------------------------------------------------------------
  -- Sector Logic Packet Former Cores
  -- https://cds.cern.ch/record/2703707/files/ATL-COM-DAQ-2019-207.pdf?
  --------------------------------------------------------------------------------

  sector_logic_link_wrapper_inst : entity hal.sector_logic_link_wrapper
    port map (

      tx_clk         => sl_tx_clks,
      rx_clk         => sl_rx_clks,
      pipeline_clock => clocks.clock_pipeline,
      clk40          => clocks.clock40,
      reset          => global_reset,

      sl_rx_mgt_word_array_i => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_o => sl_tx_mgt_word_array,

      sl_data_o => sl_rx_data,
      mtc_i     => mtc_i,

      sl_rx_ctrl_i => sl_rx_ctrl,
      sl_tx_ctrl_o => sl_tx_ctrl,

      sl_rx_slide_o => sl_rx_slide
      );

  -- FIXME: these mappings are totally made up for testing purposes...
  main_primary_slc   <= sl_rx_data(2 downto 0);
  main_secondary_slc <= sl_rx_data(5 downto 3);
  plus_neighbor_slc  <= sl_rx_data(6);
  minus_neighbor_slc <= sl_rx_data(7);

  --------------------------------------------------------------------------------
  -- Felix Receiver
  --------------------------------------------------------------------------------

  felix_decoder_inst : entity work.felix_decoder
    port map (
      clock320 => clocks.clock320, -- felix downlink clock
      clock40  => clocks.clock40, -- 40mhz system clock

      reset => global_reset,

      ttc_mgt_data_i    => felix_ttc_mgt_word,
      ttc_mgt_bitslip_o => felix_ttc_bitslip,

      strobe_pipeline => strobe_pipeline,
      strobe_320      => strobe_320,

      l0mdt_ttc_40m => ttc_commands, -- copies of outputs stable for 25ns
      valid_o       => felix_valid
      );

  ttc_commands_o <= ttc_commands;

  --------------------------------------------------------------------------------
  -- Felix Transmitter
  --------------------------------------------------------------------------------

  --------------------------------------------------------------------------------
  -- Sumps to prevent trimming... TODO remove later once actual logic is connected
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
  -- lpgbt_sump_loop : for I in 0 to c_FELIX_LPGBT_INDEX generate
  --   data_loop : process (clocks.clock320) is
  --   begin  -- process data_loop
  --     if (rising_edge(clocks.clock320)) then  -- rising clock edge
  --       lpgbt_uplink_sump(I) <= xor_reduce (lpgbt_uplink_data(I).data);
  --       lpgbt_uplink_mgt_sump(I) <= xor_reduce (lpgbt_uplink_mgt_word_array(I));
  --     end if;
  --   end process data_loop;
  -- end generate;

  sump_gen : if (true) generate
    signal daq_sump                     : std_logic_vector (c_NUM_DAQ_STREAMS-1 downto 0);
    signal mtc_sump                     : std_logic_vector (c_NUM_MTC-1 downto 0);
    signal nsp_sump                     : std_logic_vector (c_NUM_NSP-1 downto 0);
    signal plus_neighbor_segments_sump  : std_logic_vector (c_NUM_SF_OUTPUTS -1 downto 0);
    signal minus_neighbor_segments_sump : std_logic_vector (c_NUM_SF_OUTPUTS -1 downto 0);
  begin

    process (clocks.clock_pipeline) is
    begin

      if (rising_edge(clocks.clock_pipeline)) then

        daqsump_loop :
        for I in 0 to c_HPS_MAX_HP_INN + c_HPS_MAX_HP_MID + c_HPS_MAX_HP_OUT -1 loop
          daq_sump(I) <= xor_reduce(daq_streams(I));
        end loop;
        mtc_sump_loop : for I in 0 to c_NUM_MTC-1 loop
          mtc_sump(I) <= xor_reduce(mtc_i(I));
        end loop;
        nsp_sump_loop : for I in 0 to c_NUM_NSP-1 loop
          nsp_sump(I) <= xor_reduce(nsp_i(I));
        end loop;

        neighbor_segments_loop : for I in 0 to c_NUM_SF_OUTPUTS-1 loop
          plus_neighbor_segments_sump(I)  <= xor_reduce(plus_neighbor_segments_i(I));
          minus_neighbor_segments_sump(I) <= xor_reduce(minus_neighbor_segments_i(I));
        end loop;

        sump <= xor_reduce(daq_sump)
                xor xor_reduce(nsp_sump)
                xor xor_reduce(mtc_sump)
                xor xor_reduce(plus_neighbor_segments_sump)
                xor xor_reduce(minus_neighbor_segments_sump);

        plus_neighbor_segments_o  <= plus_neighbor_segments_i;
        minus_neighbor_segments_o <= minus_neighbor_segments_i;

      end if;
    end process;
  end generate;

end architecture behavioral;
