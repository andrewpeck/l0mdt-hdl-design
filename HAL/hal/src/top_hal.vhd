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

library flx;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ctrl_lib;
use ctrl_lib.HAL_CTRL.all;
use ctrl_lib.CORE_CTRL.all;
use ctrl_lib.axiRegPkg.all;

library xpm;
use xpm.vcomponents.all;

entity top_hal is

  port (

    --------------------------------------------------------------------------------
    -- Hardware clocking
    --------------------------------------------------------------------------------

    -- ASYNC ASYNC clock
    clock_async_i_p : in std_logic;
    clock_async_i_n : in std_logic;

    -- 40MHz ASYNC clock to MMCM (LHC Clock)
    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    -- 320MHz clock out (recovered clock)
    -- TODO: This should eventually become a 40 MHz clock, aligned with the data stream 
    -- See example in TCLink core
    lhc_refclk_o_p : out std_logic;
    lhc_refclk_o_n : out std_logic;

    -- LPGBT Links
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- ULL clock and control
    --------------------------------------------------------------------------------

    -- ULL clock
    clock_and_control_o : out l0mdt_control_rt;

    -- ttc
    ttc_commands_o : out l0mdt_ttc_rt;

    --------------------------------------------------------------------------------
    -- Data outputs
    --------------------------------------------------------------------------------

    -- TDC hits from CSM
    tdc_hits_inner  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN-1 downto 0);
    tdc_hits_middle : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID-1 downto 0);
    tdc_hits_outer  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
    tdc_hits_extra  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT-1 downto 0);

    --------------------------------------------------------------------------------
    -- SLC
    --------------------------------------------------------------------------------

    main_primary_slc   : out slc_rx_avt(2 downto 0);  -- is the main SL used
    main_secondary_slc : out slc_rx_avt(2 downto 0);  -- only used in the big endcap
    plus_neighbor_slc  : out slc_rx_vt;
    minus_neighbor_slc : out slc_rx_vt;

    -- pt from neighbor
    plus_neighbor_segments_o  : out sf2ptcalc_avt (c_NUM_SF_INPUTS -1 downto 0);
    minus_neighbor_segments_o : out sf2ptcalc_avt (c_NUM_SF_INPUTS -1 downto 0);

    -- pt to neighbor
    plus_neighbor_segments_i  : in sf2ptcalc_avt (c_NUM_SF_OUTPUTS -1 downto 0);
    minus_neighbor_segments_i : in sf2ptcalc_avt (c_NUM_SF_OUTPUTS -1 downto 0);

    --------------------------------------------------------------------------------
    -- NSP + MUCTPI
    --------------------------------------------------------------------------------

    MTC_i : in mtc_out_avt(c_NUM_MTC-1 downto 0);
    NSP_i : in mtc2nsp_avt(c_NUM_NSP-1 downto 0);

    --------------------------------------------------------------------------------
    -- felix
    --------------------------------------------------------------------------------

    -- FIXME: note that right now (10/19/2021) the daq stream is a 65 bit field,
    -- which needs to change somehow to pack into the 32 bit / bx that we can
    -- send to FELIX
    --
    -- FIXME: this doesn't add the EXT station because it wasn't included in the
    -- user logic
    --
    -- FIXME: this is a pipeline of 18 things, which may be partially stuffed
    --
    -- daq_streams : in felix_stream_avt (c_HPS_MAX_HP_INN
    --                                        + c_HPS_MAX_HP_MID
    --                                        + c_HPS_MAX_HP_OUT - 1 downto 0);

    daq_stream_data_vi : in std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
    daq_stream_ctrl_vi : in std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
    daq_stream_wren_vi : in std_logic_vector(c_DAQ_LINKS-1 downto 0);
    
    --------------------------------------------------------------------------------
    -- AXI
    --------------------------------------------------------------------------------
    
    -- HAL control runs with the LHC clock, and monitors/controls anything sync to it, e.g. CSM, FELIX, SL
    Mon_v  : out std_logic_vector; --out HAL_MON_t;
    Ctrl_v : in std_logic_vector; -- in  HAL_CTRL_t;
    
    -- CORE takes care of basic infrastructure, running with the axi clk, e.g. transceivers
    Core_Mon  : out CORE_MON_t;
    Core_Ctrl : in  CORE_CTRL_t;

    clk50_o      : out std_logic; -- AXI user clock
    clk40_o      : out std_logic; -- 40 MHz LHC clock to AXI slaves
    lhc_locked_o : out std_logic; -- LHC MMCM Locked?
    b2b_locked_o : out std_logic; -- AXI MMCM Locked?

    --sump--------------------------------------------------------------------------
    sump : out std_logic

    );

end entity top_hal;

architecture behavioral of top_hal is

  --------------------------------------------------------------------------------
  -- Clocks and Resets
  --------------------------------------------------------------------------------

  signal axiclock        : std_logic; -- 50MHz AXI user clock
  signal clk40           : std_logic; -- 40 MHz LHC clock 
  signal clk240          : std_logic; -- 240 MHz LHC clock
  signal clk320          : std_logic; -- 320 MHz multiplied LHC clock
  signal clock_userlogic : std_logic; -- User logic clock (nominally 320 MHz)
  signal refclk_mirrors : std_logic_vector (c_NUM_REFCLKS-1 downto 0); --reclock mirrors from BUFG
  
  -- Synchronized resets
  signal lhc_locked    : std_logic;
  signal b2b_locked    : std_logic;
  signal reset_userclk : std_logic;
  signal reset_clk320  : std_logic;
  signal reset_clk40   : std_logic;
  signal reset_axi     : std_logic;
  
  signal strobe_userclk : std_logic;
  signal strobe_320     : std_logic;

  signal flx_valid : std_logic;

  signal ttc_commands : l0mdt_ttc_rt;

  --------------------------------------------------------------------------------
  -- LPGBT Glue CSM <-> MGT
  --------------------------------------------------------------------------------

  signal lpgbt_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_word_array   : std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_uplink_bitslip : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

  --------------------------------------------------------------------------------
  -- lpGBT emulator cores
  --
  -- NOTE: this is not fully implemented but could be used to create a link that is
  -- 10.24 Gbps tx, 2.56 Gbps rx which could connect in loopback to a standard
  -- lpgbt link for emulation, board validation, etc
  --------------------------------------------------------------------------------

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

  -- TDC hits from CSM -> Polmux
  signal tdc_hits_to_polmux    : tdcpolmux2tar_avt (c_NUM_TDC_INPUTS-1 downto 0);

  -- Read done signal from Polmux -> CSM
  -- this is an acknowledge that drains the word from its buffer in the CSM module
  signal read_done_from_polmux : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- FELIX Glue MGT <-> Felix Core
  --------------------------------------------------------------------------------

  signal ttc_mgt_word : std_logic_vector (31 downto 0);  -- felix mgt userclock words
  signal ttc_bitslip  : std_logic;                       -- bitslip from felix rx core to felix transceiver
  signal lhc_recclk   : std_logic;                       -- recovered clock from felix

  signal flx_mgt_tx_word_v   : std_logic_vector_array(c_NUM_FELIX_UPLINKS-1 downto 0)(31 downto 0);
  signal flx_mgt_tx_usrclk_v : std_logic_vector(c_NUM_FELIX_UPLINKS-1 downto 0);
  signal flx_mgt_rx_word_v   : std_logic_vector_array(c_NUM_FELIX_UPLINKS-1 downto 0)(19 downto 0);

  --------------------------------------------------------------------------------
  -- Sector Logic Glue MGT <-> SL Core
  --------------------------------------------------------------------------------

  signal sl_rx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_tx_ctrl           : sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_ctrl           : sl_rx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_rx_slide          : std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_data           : slc_rx_avt (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_clks           : std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_clks           : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_rx_data_sump      : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_re_channel        : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_rx_init_done      : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Signal sumps for development
  --------------------------------------------------------------------------------

  signal lpgbt_uplink_sump     : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);
  signal lpgbt_uplink_mgt_sump : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);
  signal tdc_sump              : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);
  --signal sector_logic_rx_sump  : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);



  signal Mon_r    : HAL_MON_t;
  signal Ctrl_r   : HAL_CTRL_t;

  signal csm_ctrl_r : HAL_CSM_CSM_CTRL_t_ARRAY;
  signal csm_mon_r  : HAL_CSM_CSM_MON_t_ARRAY;
  

  signal csm_ctrl_v : std_logic_vector(width(csm_ctrl_r) - 1 downto 0);
  signal csm_mon_v  : std_logic_vector(width(csm_mon_r ) - 1 downto 0);

 
  --------------------------------------------------------------------------------
  -- Attributes for synthesis
  --------------------------------------------------------------------------------

  attribute MAX_FANOUT : string;
  attribute DONT_TOUCH : string;

  attribute MAX_FANOUT of strobe_userclk : signal is "20";
  attribute DONT_TOUCH of strobe_userclk : signal is "true";

  attribute MAX_FANOUT of strobe_320 : signal is "20";

  attribute MAX_FANOUT of reset_userclk : signal is "32";
  attribute MAX_FANOUT of reset_clk320  : signal is "32";
  attribute MAX_FANOUT of reset_clk40   : signal is "32";
  attribute MAX_FANOUT of reset_axi     : signal is "32";

  -- Save this here so we can extract it from the hierarchy later
  -- this is used in log_mgts.tcl so please do not remove it
  attribute NUM_MGTS                       : integer;
  attribute NUM_MGTS of mgt_wrapper_inst   : label is c_NUM_MGTS;
  attribute DONT_TOUCH of mgt_wrapper_inst : label is "true";

  
begin  -- architecture behavioral

  --------------------------------------------------------------------------------
  -- Resets
  --------------------------------------------------------------------------------
  --
  -- For the main resets from the MMCM, use asynchronous assertion, synchronous
  -- deassertion This means that when the MMCM is not locked, the resets will
  -- remain asserted even if the output clock is not running
  --
  -- Resets on the userlogic and 320MHz clock domains are passed through
  -- synchronous reset cdc blocks which helps with timing closure by providing
  -- several pipeline steps which can be replicated by the tools
  --
  --------------------------------------------------------------------------------

  process (clk40, lhc_locked) is
  begin
    if (lhc_locked = '0') then
      reset_clk40 <= '1';
    elsif (rising_edge(clk40)) then
      reset_clk40 <= '0';
    end if;
  end process;

  process (axiclock, b2b_locked) is
  begin
    if (lhc_locked = '0') then
      reset_axi <= '1';
    elsif (rising_edge(axiclock)) then
      reset_axi <= '0';
    end if;
  end process;

  rst_bit_synchronizer : xpm_cdc_sync_rst
    generic map (DEST_SYNC_FF => 4, INIT => 1, INIT_SYNC_FF => 1)
    port map (
      dest_rst => reset_clk320,
      dest_clk => clk320,
      src_rst  => reset_clk40);

  userclk_rst_bit_synchronizer : xpm_cdc_sync_rst
    generic map (DEST_SYNC_FF => 5, INIT => 1, INIT_SYNC_FF => 1)
    port map (
      dest_rst => reset_userclk,
      dest_clk => clock_userlogic,
      src_rst  => reset_clk40);

  --------------------------------------------------------------------------------
  -- Signal Aliasing
  --------------------------------------------------------------------------------


  
  mon_v         <= convert(mon_r,mon_v);
  ctrl_r        <= convert(ctrl_v,ctrl_r);
 
  csm_mon_v     <= convert(csm_mon_r, csm_mon_v);
 
  
  
  

  clk50_o      <= axiclock;             -- AXI user clock
  clk40_o      <= clk40;                -- LHC 40 MHz clock
  b2b_locked_o <= b2b_locked;           -- AXI user clock locked? B2B = C2C = SM-CM
  lhc_locked_o <= lhc_locked;           -- LHC clock locked?

  core_mon.clocking.mmcm_locked <= lhc_locked;


  --------------------------------------------------------------------------------
  -- Common Clocking
  --------------------------------------------------------------------------------

  top_clocking_inst : entity hal.top_clocking
    generic map (CLK_FREQ => c_CLK_FREQ)
    port map (

      --
      reset_lhc_mmcm_i => core_ctrl.clocking.reset_mmcm,

      -- clock inputs

      -- this is the ASYNC UNSTOPPABLE clock that should be used to run any core
      -- logic (AXI and so on)
      clock_async_i_p => clock_async_i_p,
      clock_async_i_n => clock_async_i_n,

      -- 40 MHz LHC Clock from FELIX etc
      clock_i_p => clock_i_p,
      clock_i_n => clock_i_n,

      clk50_freq  => core_mon.clocking.clk50_freq,
      clk40_freq  => core_mon.clocking.clk40_freq,
      clk240_freq => core_mon.clocking.clk240_freq,
      clk320_freq => core_mon.clocking.clk320_freq,

      -- system clocks
      lhc_locked_o      => lhc_locked,
      b2b_locked_o      => b2b_locked,
      axiclock_o        => axiclock,
      clock40_o         => clk40,
      clock240_o        => clk240,
      clock320_o        => clk320,
      clock_userlogic_o => clock_userlogic

      );

  --------------------------------------------------------------------------------
  -- Clock Strobes
  --------------------------------------------------------------------------------
  --
  -- Create a 1 of n high signal synced to the slow clock, e.g.
  --
  --            ???????????????????????????       ???????????????????????????       ???????????????????????????       ????????????
  -- clk40     ??????       ???????????????????????????       ???????????????????????????       ???????????????????????????
  --            ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ?????????
  -- clk200    ?????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ??????
  --            ???????????????           ???????????????           ???????????????           ???????????????
  -- strobe    ??????   ???????????????????????????????????????   ???????????????????????????????????????   ???????????????????????????????????????   ?????????
  --
  -- These are necessary for e.g. the lpgbt cores, which use a strobe signal to
  -- indicate alignment relative to the 40MHz clock.
  --
  -- For the lpgbt this module takes in the 40MHz clock and the 320MHz clock and
  -- generates automatically a strobe signal which is high every 8th clock cycle
  -- and is aligned to the 40MHz clock
  --
  -- **The ratio of the two clock frequencies must be supplied as a generic.**
  --

  clock_strobe_320m : entity work.clock_strobe
    generic map (RATIO => 8)
    port map (
      fast_clk_i => clk320,
      slow_clk_i => clk40,
      strobe_o   => strobe_320);

  -- TODO: Think about having clock frequency in a single place and derive
  -- ratios accordingly
  clock_strobe_userlogic : entity work.clock_strobe
    generic map (RATIO => 8)
    port map (
      fast_clk_i => clock_userlogic,
      slow_clk_i => clk40,
      strobe_o   => strobe_userclk);

  clock_and_control_o.rst <= reset_userclk;
  clock_and_control_o.clk <= clock_userlogic;
  clock_and_control_o.bx  <= strobe_userclk;

  --------------------------------------------------------------------------------
  -- Common Multi-gigabit transceivers
  --------------------------------------------------------------------------------

  mgt_wrapper_inst : entity hal.mgt_wrapper
    port map (

      -- clocks
      axiclock   => axiclock,
      clock240_i => clk240,
      clock320   => clk320,
      lhc_locked => lhc_locked,
      refclk_mirrors_out => refclk_mirrors,
      -- reset
      reset => reset_axi,

      -- ctrl & monitoring
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
      sl_rx_slide_i          => sl_rx_slide, -- Align with the LHC clock from Yasu's code
      sl_tx_clk              => sl_tx_clks,
      sl_rx_clk              => sl_rx_clks,
      sl_re_channel          => sl_re_channel,
      sl_rx_init_done        => sl_rx_init_done,

      -- lpgbt
      lpgbt_rxslide_i                 => lpgbt_uplink_bitslip,
      lpgbt_downlink_mgt_word_array_i => lpgbt_downlink_mgt_word_array,
      lpgbt_uplink_mgt_word_array_o   => lpgbt_uplink_mgt_word_array,

      -- TODO: lpgbt emulator for loopback testing
      lpgbt_emul_rxslide_i                 => lpgbt_emul_downlink_bitslip,
      lpgbt_emul_downlink_mgt_word_array_o => lpgbt_emul_downlink_mgt_word_array,
      lpgbt_emul_uplink_mgt_word_array_i   => lpgbt_emul_uplink_mgt_word_array,

      -- Felix TTC
      ttc_bitslip_i  => ttc_bitslip,
      ttc_mgt_word_o => ttc_mgt_word,
      ttc_mgt_word_i => (others => '1'),
      ttc_recclk_o   => lhc_recclk,

      -- Felix DAQ
      flx_mgt_word_vi   => flx_mgt_tx_word_v,
      flx_mgt_usrclk_vo => flx_mgt_tx_usrclk_v,
      flx_mgt_word_vo   => flx_mgt_rx_word_v
      );

  -- FIXME: this should come from an ODDR (output double data rate buffer).
  -- Check Vivado documentation
  lhc_refclk_OBUFDS_inst : OBUFDS
    port map (
      O  => lhc_refclk_o_p,             -- 1-bit output: Diff_p output (connect directly to top-level port)
      OB => lhc_refclk_o_n,             -- 1-bit output: Diff_n output (connect directly to top-level port)
      I  => lhc_recclk);                -- 1-bit input: Buffer input

  --------------------------------------------------------------------------------
  -- LPGBT Emulator
  --------------------------------------------------------------------------------

  -- FIXME: just use 1 instance of the emulator and mux the downlink data to each
  -- 
  lpgbtemul_wrapper_inst : entity hal.lpgbtemul_wrapper
    port map (
      reset                           => reset_clk40,
      lpgbt_uplink_clk_i              => clk320,
      lpgbt_uplink_mgt_word_array_o   => lpgbt_emul_uplink_mgt_word_array,
      lpgbt_uplink_data_i             => lpgbt_emul_uplink_data,
      lpgbt_uplink_ready_o            => lpgbt_emul_uplink_ready,
      lpgbt_rst_uplink_i              => lpgbt_emul_rst_uplink,
      lpgbt_downlink_clk_i            => clk320,
      lpgbt_downlink_mgt_word_array_i => lpgbt_emul_downlink_mgt_word_array,
      lpgbt_downlink_data_o           => lpgbt_emul_downlink_data,
      lpgbt_downlink_ready_o          => lpgbt_emul_downlink_ready,
      lpgbt_downlink_bitslip_o        => lpgbt_emul_downlink_bitslip,
      lpgbt_rst_downlink_i            => lpgbt_emul_rst_downlink
      );

  -- TODO: replace with with some kind of smarter driver? prbs31?
  emul_loop : for I in 0 to c_NUM_LPGBT_EMUL_UPLINKS-1 generate
    emul_loop_clock : process (clk320) is
    begin  -- process data_loop
      if clk320'event and clk320 = '1' then  -- rising clock edge
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
  csm_gen : for CSM in c_MDT_CONFIG'range generate
  -- csm_gen : for CSM in 0 downto 0 generate
    constant hi       : integer := csm_hi_lo (CSM).hi;
    constant lo       : integer := csm_hi_lo (CSM).lo;
    constant tdc_cnt  : integer := count_ones(c_MDT_CONFIG(CSM).en);
    constant mgt_idx  : integer := c_MDT_CONFIG(CSM).mgt_id_m;
    constant mgt_id_m : integer := c_MDT_CONFIG(CSM).mgt_id_m;
    constant mgt_id_s : integer := c_MDT_CONFIG(CSM).mgt_id_s;
     
  begin

    csm_ifgen : if (CSM < c_NUM_CSMS_ACTIVE and tdc_cnt > 0) generate
      
    begin
      assert c_MGT_MAP(mgt_id_m).mgt_type=MGT_LPGBT
        report "CSM Master assigned to non-lpgbt link!" severity error;
      assert c_MGT_MAP(mgt_id_s).mgt_type=MGT_LPGBT
        report "CSM Servant assigned to non-lpgbt link!" severity error;
      assert mgt_id_m = mgt_id_s-1
        report "CSM Master and Servant are not adjacent, this is not supported right now... :(" severity error;

      csm_ctrl_r(CSM)    <= ctrl_r.csm.csm(CSM);
      mon_r.csm.csm(CSM) <= csm_mon_r(CSM);
      
      mgt_tag : for MGT_NUM in mgt_idx to mgt_idx generate
      begin

        assert false report
          "Generating CSM #" & integer'image(CSM)
          & " bithi=" & integer'image(hi)
          & " bitlo=" & integer'image(lo)
          severity note;

        csm_inst : entity work.csm
          generic map (
            g_CSM_ID      => c_MDT_CONFIG(CSM).csm_id,
            g_TDC_CNT     => tdc_cnt,
            g_ENABLE_MASK => c_MDT_CONFIG(CSM).en,
            g_LEGACY_FLAG => c_MDT_CONFIG(CSM).legacy
            )
          port map (
            -- clock and reset
            clk40      => clk40,
            strobe_320 => strobe_320,
            reset_i    => reset_clk40,

            -- TTC signals
            -- TODO: axi generation of TTC signals
            trg_i => ttc_commands.l0a,
            bcr_i => ttc_commands.bcr,
            ecr_i => ttc_commands.ecr,
            gsr_i => reset_clk40,

            -- downlink
            downlink_clk                 => clk320,
            downlink_mgt_word_array_o(0) => lpgbt_downlink_mgt_word_array (lpgbt_downlink_idx_array(c_MDT_CONFIG(CSM).mgt_id_m)),

            -- uplink clk &
            -- master(0) + slave(1) uplink data/bitslips
            uplink_clk                 => clk320,
            uplink_mgt_word_array_i(0) => lpgbt_uplink_mgt_word_array(lpgbt_uplink_idx_array(c_MDT_CONFIG(CSM).mgt_id_m)),
            uplink_mgt_word_array_i(1) => lpgbt_uplink_mgt_word_array(lpgbt_uplink_idx_array(c_MDT_CONFIG(CSM).mgt_id_s)),
            uplink_bitslip_o(0)        => lpgbt_uplink_bitslip(lpgbt_uplink_idx_array(c_MDT_CONFIG(CSM).mgt_id_m)),
            uplink_bitslip_o(1)        => lpgbt_uplink_bitslip(lpgbt_uplink_idx_array(c_MDT_CONFIG(CSM).mgt_id_s)),

            -- outputs to polmux
            tdc_hits_to_polmux_o    => tdc_hits_to_polmux (hi downto lo), -- Big vector of all TDC data, hi-lo give the range of the vector corresponding to a particular CSM
            read_done_from_polmux_i => read_done_from_polmux (hi downto lo),

            --
            ctrl                    => csm_ctrl_r(CSM),
            mon                     => csm_mon_r(CSM)
            );

      end generate;
    end generate;
  end generate;

  -- 0 to 3, inner middle outer extra
  station_gen : for STATION in 0 to 3 generate
    constant num_polmuxes :
      int_array_t (0 to 3) := (c_NUM_POLMUX_INNER, c_NUM_POLMUX_MIDDLE,
                               c_NUM_POLMUX_OUTER, c_NUM_POLMUX_EXTRA);
  begin

    polmux_gen : for POLMUX in 0 to num_polmuxes(STATION)-1 generate
      constant id       : integer := get_polmux_global_id (c_MDT_CONFIG, POLMUX, stations(STATION));
      constant hi       : integer := polmux_hi_lo (id).hi;
      constant lo       : integer := polmux_hi_lo (id).lo;
      constant width    : integer := hi-lo+1;
      signal tdc_hits_o : tdcpolmux2tar_vt;
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
          g_STATION     => stations(STATION),
          g_STATION_STR => stations_str(STATION)
          )
        port map (
          clock          => clk320,
          pipeline_clock => clock_userlogic,
          reset          => reset_clk320,
          tdc_hits_i     => tdc_hits_to_polmux (hi downto lo),
          read_done_o    => read_done_from_polmux (hi downto lo),
          tdc_hits_o     => tdc_hits_o
          );

      inner : if (STATION = 0) generate
        tdc_hits_inner(POLMUX) <= tdc_hits_o;
      end generate;
      middle : if (STATION = 1) generate
        tdc_hits_middle (POLMUX) <= tdc_hits_o;
      end generate;
      outer : if (STATION = 2) generate
        tdc_hits_outer (POLMUX) <= tdc_hits_o;
      end generate;
      extra : if (STATION = 3) generate
        tdc_hits_extra(POLMUX) <= tdc_hits_o;
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
      pipeline_clock => clock_userlogic,
      clk40          => clk40,
      reset          => reset_clk40,
      refclk_mirrors_in => refclk_mirrors,
        
      sl_rx_mgt_word_array_i => sl_rx_mgt_word_array, -- SLC 
      sl_tx_mgt_word_array_o => sl_tx_mgt_word_array, -- MTC

      sl_data_o => sl_rx_data,
      mtc_i     => mtc_i,

      sl_rx_ctrl_i => sl_rx_ctrl,
      sl_rx_init_done_i => sl_rx_init_done,
      sl_tx_ctrl_o => sl_tx_ctrl,

      sl_rx_slide_o => sl_rx_slide,
      sl_re_channel_o => sl_re_channel,
      ctrl                    => Ctrl_r.sl,
      mon                     => Mon_r.sl
      );

  -- FIXME: these mappings are totally made up for testing purposes...
  -- probably want an arbitrary mapping here?? from some config file?
  main_primary_slc   <= sl_rx_data(2 downto 0);
  main_secondary_slc <= sl_rx_data(5 downto 3);
  plus_neighbor_slc  <= sl_rx_data(6);
  minus_neighbor_slc <= sl_rx_data(7);

  --------------------------------------------------------------------------------
  -- Felix
  --------------------------------------------------------------------------------

  -- -- Felix Receiver
  -- 
  -- felix_decoder_inst : entity work.felix_decoder
  --   port map (
  --     clock320 => clk320, -- felix downlink clock
  --     clock40  => clk40, -- 40mhz system clock
  -- 
  --     reset => reset_clk320,
  -- 
  --     ttc_mgt_data_i    => ttc_mgt_word,
  --     ttc_mgt_bitslip_o => ttc_bitslip,
  -- 
  --     strobe_pipeline => strobe_userclk,
  --     strobe_320      => strobe_320,
  -- 
  --     l0mdt_ttc_40m => ttc_commands, -- copies of outputs stable for 25ns
  --     valid_o       => felix_valid
  --     );

  ttc_commands_o <= ttc_commands;

  -- Felix Transmitter

  assert c_NUM_DAQ_STREAMS <= c_NUM_FELIX_UPLINKS
                              report "Cannot have more DAQ streams than we have FELIX uplinks allocated."
                              & " c_NUM_DAQ_STREAMS=" & integer'image(c_NUM_DAQ_STREAMS)
                              & " c_NUM_FELIX_UPLINKS=" & integer'image(c_NUM_FELIX_UPLINKS)
                              severity error;



  u_flx_tx : entity flx.flx_tx
  generic map (NLINKS => c_DAQ_LINKS) -- : natural);
  port map (clk240_i              => clk240 -- : in  std_logic
            , clk320_i            => clk320 -- : in  std_logic
            , rst_i               => reset_clk40 -- : in  std_logic

            , busy_i              => '0' -- : in std_logic

            , usr_data_vi => daq_stream_data_vi -- : in  std_logic_vector_array(NLINKS-1 downto 0)(31 downto 0)
            , usr_ctrl_vi => daq_stream_ctrl_vi -- : in  std_logic_vector_array(NLINKS-1 downto 0)(1 downto 0)
            , usr_wren_vi => daq_stream_wren_vi -- : in  std_logic_vector(NLINKS-1 downto 0)
            , mgt_data_vo => flx_mgt_tx_word_v(c_DAQ_LINKS-1 downto 0)); -- : out std_logic_vector_array(NLINKS-1 downto 0)(31 downto 0));

  --felix_tx_inst : entity work.felix_tx
  --  generic map (
  --    g_NUM_UPLINKS => c_DAQ_LINKS -- c_NUM_DAQ_STREAMS
  --    )
  --  port map (
  --    clk320           => clk320,
  --    clk40            => clk40,
  --    reset_i          => reset_clk40,
  --
  --    -- FIXME:
  --    --
  --    -- daq streams is always length 18, and these are picked out incorrectly
  --    --
  --    -- this is due to a deliberate bug in the user logic where the constant
  --    -- c_NUM_DAQ_STREAMS was commented out in favor of
  --    -- c_HPS_MAX_HP_INN + c_HPS_MAX_HP_MID + c_HPS_MAX_HP_OUT
  --    --
  --    -- so now the calculation of which daq link is which is completely wrong
  --    -- this needs some kind of translation layer to map user logic daq links
  --    -- onto felix links
  --
  --    daq_streams      => daq_streams, -- (c_NUM_DAQ_STREAMS-1 downto 0),
  --    mgt_word_array_o => felix_uplink_mgt_word_array(c_DAQ_LINKS-1 downto 0),
  --    -- mgt_word_array_o => felix_uplink_mgt_word_array(c_NUM_DAQ_STREAMS-1 downto 0),
  --    ready_o          => open,
  --    was_not_ready_o  => open,
  --    strobe_320       => strobe_320
  --    );

  --------------------------------------------------------------------------------
  -- Sumps to prevent trimming... TODO remove later once actual logic is connected
  --------------------------------------------------------------------------------

  --sl_rx_sump : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
  --  data_loop : process (clock240) is
  --  begin  -- process data_loop
  --    if clock240'event and clock240 = '1' then  -- rising clock edge
  --      sector_logic_rx_sump(I) <= xor_reduce (sl_rx_data(I).data);
  --    end if;
  --  end process data_loop;
  --end generate;

  -- let this sump as tdc data in the user_top
  -- lpgbt_sump_loop : for I in 0 to c_FELIX_LPGBT_INDEX generate
  --   data_loop : process (clk320) is
  --   begin  -- process data_loop
  --     if (rising_edge(clk320)) then  -- rising clock edge
  --       lpgbt_uplink_sump(I) <= xor_reduce (lpgbt_uplink_data(I).data);
  --       lpgbt_uplink_mgt_sump(I) <= xor_reduce (lpgbt_uplink_mgt_word_array(I));
  --     end if;
  --   end process data_loop;
  -- end generate;

  -- This was there to don't make Vivado optimise away the ULL. Now that it is actually connected
  -- we can disable it. Keep it there, just in case
  sump_gen : if (false) generate
    signal daq_sump                     : std_logic_vector (daq_stream_data_vi'length-1 downto 0);
    signal mtc_sump                     : std_logic_vector (c_NUM_MTC-1 downto 0);
    signal nsp_sump                     : std_logic_vector (c_NUM_NSP-1 downto 0);
    signal plus_neighbor_segments_sump  : std_logic_vector (c_NUM_SF_OUTPUTS -1 downto 0);
    signal minus_neighbor_segments_sump : std_logic_vector (c_NUM_SF_OUTPUTS -1 downto 0);
  begin

    process (clock_userlogic) is
    begin

      if (rising_edge(clock_userlogic)) then

        daqsump_loop :
        for I in 0 to daq_stream_data_vi'length-1 loop
          daq_sump(I) <= xor_reduce(daq_stream_data_vi(I));
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
