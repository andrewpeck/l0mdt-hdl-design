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

    main_primary_slc   : out slc_rx_data_bus_avt(2 downto 0);  -- is the main SL used
    main_secondary_slc : out slc_rx_data_bus_avt(2 downto 0);  -- only used in the big endcap
    plus_neighbor_slc  : out slc_rx_data_rvt;
    minus_neighbor_slc : out slc_rx_data_rvt;

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

    daq_streams : in FELIX_STREAM_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);

    --------------------------------------------------------------------------------
    -- AXI
    --------------------------------------------------------------------------------

    Mon  : out HAL_MON_t;
    Ctrl : in  HAL_CTRL_t;

    Core_Mon  : out HAL_CORE_MON_t;
    Core_Ctrl : in  HAL_CORE_CTRL_t;

    axi_clk_o : out std_logic;

    clk320_o : out std_logic;

    --sump--------------------------------------------------------------------------
    sump : out std_logic

    );

end entity top_hal;
architecture behavioral of top_hal is

  signal clock_ibufds : std_logic;
  signal clocks       : system_clocks_rt;
  signal global_reset : std_logic;

  signal strobe_pipeline : std_logic;
  signal strobe_320      : std_logic;

  signal reset : std_logic;

  signal felix_valid : std_logic;

  signal ttc_commands : l0mdt_ttc_rt;

  --------------------------------------------------------------------------------
  -- LPGBT Glue
  --------------------------------------------------------------------------------

  signal lpgbt_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_word_array   : std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal felix_ttc_mgt_word_array : std_logic_vector (31 downto 0);

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

  signal lpgbt_uplink_sump     : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);
  signal lpgbt_uplink_mgt_sump : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);
  signal tdc_sump              : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);
  --signal sector_logic_rx_sump  : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Attributes for synthesis
  --------------------------------------------------------------------------------

  attribute DONT_TOUCH                    : string;
  attribute MAX_FANOUT                    : string;
  attribute MAX_FANOUT of strobe_pipeline : signal is "20";
  attribute DONT_TOUCH of strobe_pipeline : signal is "true";

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
  clk320_o     <= clocks.clock320;

  --------------------------------------------------------------------------------
  -- AXI Interface
  --------------------------------------------------------------------------------

  core_mon.clocking.mmcm_locked <= clocks.locked;

  --------------------------------------------------------------------------------
  -- Common Clocking
  --------------------------------------------------------------------------------

  top_clocking_inst : entity hal.top_clocking
    port map (
      --
      reset_i          => core_ctrl.clocking.reset_mmcm,
      select_felix_clk => core_ctrl.clocking.select_felix_clk,

      -- synchronization
      felix_valid_i  => felix_valid,
      felix_recclk_i => felix_mgt_rxusrclk(c_FELIX_RECCLK_SRC),
      sync_i         => '0',
      out_of_sync_o  => open,

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

  rst_bit_synchronizer : xpm_cdc_sync_rst
    generic map (DEST_SYNC_FF => 2, INIT => 1, INIT_SYNC_FF => 1)
    port map (
      dest_rst => reset,
      dest_clk => clocks.clock320,
      src_rst  => global_reset);

  pipeline_rst_bit_synchronizer : xpm_cdc_sync_rst
    generic map (DEST_SYNC_FF => 2, INIT => 1, INIT_SYNC_FF => 1)
    port map (
      dest_rst => clock_and_control_o.rst,
      dest_clk => clocks.clock_pipeline,
      src_rst  => global_reset);

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

      ctrl => core_ctrl.mgt,
      mon  => core_mon.mgt,

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
  begin
    csm_ifgen : if (I < c_NUM_CSMS_ACTIVE and tdc_cnt > 0) generate
    begin

      assert false report
        "Generating CSM #" & integer'image(I)
        & " bithi=" & integer'image(hi)
        & " bitlo=" & integer'image(lo)
        severity note;

      csm_inst : entity work.csm
        generic map (
          g_CSM_ID  => I,
          g_TDC_CNT => tdc_cnt
          )
        port map (
          reset_i                      => global_reset,
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

  -- 0 to 3, inner middle outer extra
  station_gen : for I in 0 to 3 generate
    constant num_polmuxes : int_array_t (0 to 3) := (c_NUM_POLMUX_INNER,
                                                     c_NUM_POLMUX_MIDDLE,
                                                     c_NUM_POLMUX_OUTER,
                                                     c_NUM_POLMUX_EXTRA);
  begin

    polmux_gen : for J in 0 to num_polmuxes(I)-1 generate
      constant id       : integer := get_polmux_global_id (c_MDT_CONFIG, J, stations(I));
      constant hi       : integer := polmux_hi_lo (id).hi;
      constant lo       : integer := polmux_hi_lo (id).lo;
      constant width    : integer := hi-lo+1;
      signal tdc_hits_o : mdt_polmux_rvt;
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
  --------------------------------------------------------------------------------

  sector_logic_link_wrapper_inst : entity hal.sector_logic_link_wrapper
    port map (

      clock          => clocks.clock240,  -- 240 MHz sector logic userclk
      pipeline_clock => clocks.clock_pipeline,
      reset          => global_reset,

      sl_rx_mgt_word_array_i => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_o => sl_tx_mgt_word_array,

      sl_rx_data_o => sl_rx_data,
      sl_tx_data_i => sl_tx_data,

      sl_rx_ctrl_i => sl_rx_ctrl,
      sl_tx_ctrl_o => sl_tx_ctrl,

      sl_rx_slide_o => sl_rx_slide
      );


  --------------------------------------------------------------------------------
  -- Felix Receiver
  --------------------------------------------------------------------------------

  felix_decoder_inst : entity work.felix_decoder
    port map (
      clock          => clocks.clock320,
      reset          => global_reset,
      ttc_mgt_data_i => felix_ttc_mgt_word_array,

      strobe_pipeline => strobe_pipeline,
      strobe_320      => strobe_320,

      l0mdt_ttc_40m      => ttc_commands,    -- copies of outputs stable for 25ns
      l0mdt_ttc_320m     => open,            -- copies of outputs stable for 3.125ns
      l0mdt_ttc_pipeline => ttc_commands_o,  -- copies of outputs stable for 1 pipeline clock
      valid_o            => felix_valid
      );

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

  sl_loop_loop : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
    data_loop : process (clocks.clock_pipeline) is
    begin  -- process data_loop
      if (rising_edge(clocks.clock_pipeline)) then  -- rising clock edge
        sl_tx_data(I).data  <= sl_rx_data(I).data;
        sl_tx_data(I).valid <= sl_rx_data(I).valid;
      end if;
    end process data_loop;
  end generate;

  sump_loop : process (clocks.clock_pipeline) is
    variable daq_sump                     : std_logic_vector (c_NUM_DAQ_STREAMS-1 downto 0);
    variable mtc_sump                     : std_logic_vector (c_NUM_MTC-1 downto 0);
    variable nsp_sump                     : std_logic_vector (c_NUM_NSP-1 downto 0);
    variable plus_neighbor_segments_sump  : std_logic_vector (c_NUM_SF_OUTPUTS -1 downto 0);
    variable minus_neighbor_segments_sump : std_logic_vector (c_NUM_SF_OUTPUTS -1 downto 0);
  begin  -- process data_loop
    if (rising_edge(clocks.clock_pipeline)) then  -- rising clock edge

      daqsump_loop : for I in 0 to c_NUM_DAQ_STREAMS-1 loop
        daq_sump(I) := xor_reduce(daq_streams(I));
      end loop;
      mtc_sump_loop : for I in 0 to c_NUM_MTC-1 loop
        mtc_sump(I) := xor_reduce(mtc_i(I));
      end loop;
      nsp_sump_loop : for I in 0 to c_NUM_NSP-1 loop
        nsp_sump(I) := xor_reduce(nsp_i(I));
      end loop;

      sump <= xor_reduce(daq_sump) xor xor_reduce(nsp_sump) xor xor_reduce(mtc_sump);


      -- 124 bits each FIXME: these mappings are totally made up for testing purposes...
      -- should map them using a real map when I can figure out what it is
      -- Ask Yasu!!

      main_primary_slc(0)(0)              <= sl_rx_data(0).valid;
      main_primary_slc(0)(123 downto 1)   <= sl_rx_data(0).data(122 downto 0);
      main_primary_slc(1)(1)              <= sl_rx_data(1).valid;
      main_primary_slc(1)(123 downto 1)   <= sl_rx_data(1).data(122 downto 0);
      main_primary_slc(2)(2)              <= sl_rx_data(2).valid;
      main_primary_slc(2)(123 downto 1)   <= sl_rx_data(2).data(122 downto 0);
      main_secondary_slc(0)(0)            <= sl_rx_data(3).valid;
      main_secondary_slc(0)(123 downto 1) <= sl_rx_data(3).data(122 downto 0);
      main_secondary_slc(1)(1)            <= sl_rx_data(4).valid;
      main_secondary_slc(1)(123 downto 1) <= sl_rx_data(4).data(122 downto 0);
      main_secondary_slc(2)(2)            <= sl_rx_data(5).valid;
      main_secondary_slc(2)(123 downto 1) <= sl_rx_data(5).data(122 downto 0);
      plus_neighbor_slc(0)                <= sl_rx_data(6).valid;
      plus_neighbor_slc(123 downto 1)     <= sl_rx_data(6).data(122 downto 0);
      minus_neighbor_slc(0)               <= sl_rx_data(6).valid;
      minus_neighbor_slc(123 downto 1)    <= sl_rx_data(6).data(122 downto 0);

      plus_neighbor_segments_o  <= plus_neighbor_segments_i;
      minus_neighbor_segments_o <= minus_neighbor_segments_i;

    end if;
  end process sump_loop;
end architecture behavioral;
