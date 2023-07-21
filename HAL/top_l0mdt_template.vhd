library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use ieee.math_real.all;

library work;
use work.all;

library hal;
use hal.board_pkg.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;

library ctrl_lib;

use ctrl_lib.CORE_CTRL.all;
use ctrl_lib.HAL_CTRL.all;
use ctrl_lib.FW_INFO_CTRL.all;
use ctrl_lib.axiRegPkg.all;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;
use ctrl_lib.FM_CTRL.all;
use ctrl_lib.HOG_CTRL.all;


library shared_lib;
use shared_lib.spybuffer_pkg.all;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ult_lib;
library xil_defaultlib;
use xil_defaultlib.all;

entity top_l0mdt is
  generic (
    -- these generics get set by hog at synthesis
    GLOBAL_DATE            : std_logic_vector (31 downto 0) := x"00000000";
    GLOBAL_TIME            : std_logic_vector (31 downto 0) := x"00000000";
    GLOBAL_VER             : std_logic_vector (31 downto 0) := x"00000000";
    OFFICIAL               : std_logic_vector (31 downto 0) := x"00000000";
    GLOBAL_SHA             : std_logic_vector (31 downto 0) := x"00000000";
    TOP_SHA                : std_logic_vector (31 downto 0) := x"00000000";
    XML_SHA                : std_logic_vector (31 downto 0) := x"00000000";
    XML_VER                : std_logic_vector (31 downto 0) := x"00000000";
    TOP_VER                : std_logic_vector (31 downto 0) := x"00000000";
    HOG_SHA                : std_logic_vector (31 downto 0) := x"00000000";
    FRAMEWORK_VER          : std_logic_vector (31 downto 0) := x"00000000";
    FRAMEWORK_SHA          : std_logic_vector (31 downto 0) := x"00000000";
    HOG_VER                : std_logic_vector (31 downto 0) := x"00000000";
    CON_VER                : std_logic_vector (31 downto 0) := x"00000000";
    CON_SHA                : std_logic_vector (31 downto 0) := x"00000000";
    -- Library versions and SHAs
    PROJECT_LIB_VER        : std_logic_vector (31 downto 0) := x"00000000";
    PROJECT_LIB_SHA        : std_logic_vector (31 downto 0) := x"00000000";
    CTRL_LIB_VER           : std_logic_vector (31 downto 0) := x"00000000";
    CTRL_LIB_SHA           : std_logic_vector (31 downto 0) := x"00000000";
    SHARED_LIB_VER         : std_logic_vector (31 downto 0) := x"00000000";
    SHARED_LIB_SHA         : std_logic_vector (31 downto 0) := x"00000000";
    SHARED_CFG_DEF_LIB_VER : std_logic_vector (31 downto 0) := x"00000000";
    SHARED_CFG_DEF_LIB_SHA : std_logic_vector (31 downto 0) := x"00000000";
    HEG_ROI_LIB_VER        : std_logic_vector (31 downto 0) := x"00000000";
    HEG_ROI_LIB_SHA        : std_logic_vector (31 downto 0) := x"00000000";
    APBUS_LIB_VER          : std_logic_vector (31 downto 0) := x"00000000";
    APBUS_LIB_SHA          : std_logic_vector (31 downto 0) := x"00000000";
    VAMC_LIB_VER           : std_logic_vector (31 downto 0) := x"00000000";
    VAMC_LIB_SHA           : std_logic_vector (31 downto 0) := x"00000000";
    L0MDT_VER              : std_logic_vector (31 downto 0) := x"00000000";
    L0MDT_SHA              : std_logic_vector (31 downto 0) := x"00000000";
    TDC_VER                : std_logic_vector (31 downto 0) := x"00000000";
    TDC_SHA                : std_logic_vector (31 downto 0) := x"00000000";
    HAL_VER                : std_logic_vector (31 downto 0) := x"00000000";
    HAL_SHA                : std_logic_vector (31 downto 0) := x"00000000";
    GBT_SC_VER             : std_logic_vector (31 downto 0) := x"00000000";
    GBT_SC_SHA             : std_logic_vector (31 downto 0) := x"00000000";
    LPGBT_EMUL_VER         : std_logic_vector (31 downto 0) := x"00000000";
    LPGBT_EMUL_SHA         : std_logic_vector (31 downto 0) := x"00000000";
    LPGBT_FPGA_VER         : std_logic_vector (31 downto 0) := x"00000000";
    LPGBT_FPGA_SHA         : std_logic_vector (31 downto 0) := x"00000000";
    SL_VER                 : std_logic_vector (31 downto 0) := x"00000000";
    SL_SHA                 : std_logic_vector (31 downto 0) := x"00000000";
    HP_LIB_VER             : std_logic_vector (31 downto 0) := x"00000000";
    HP_LIB_SHA             : std_logic_vector (31 downto 0) := x"00000000";
    MPL_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    MPL_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    ULT_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    ULT_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    UCM_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    UCM_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    HEG_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    HEG_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    HPS_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    HPS_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    TAR_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    TAR_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    MTC_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    MTC_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    FM_LIB_VER             : std_logic_vector (31 downto 0) := x"00000000";
    FM_LIB_SHA             : std_logic_vector (31 downto 0) := x"00000000";
    DAQ_CORE_VER           : std_logic_vector (31 downto 0) := x"00000000";
    DAQ_CORE_SHA           : std_logic_vector (31 downto 0) := x"00000000";
    DAQ_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    DAQ_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    CSF_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    CSF_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    LSF_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    LSF_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    PTC_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    PTC_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    UPT_LIB_VER            : std_logic_vector (31 downto 0) := x"00000000";
    UPT_LIB_SHA            : std_logic_vector (31 downto 0) := x"00000000";
    KU15P_VER              : std_logic_vector (31 downto 0) := x"00000000";
    KU15P_SHA              : std_logic_vector (31 downto 0) := x"00000000";
    OTHERS_VER             : std_logic_vector (31 downto 0) := x"00000000";
    OTHERS_SHA             : std_logic_vector (31 downto 0) := x"00000000";
    DP_REPO_LIB_VER        : std_logic_vector (31 downto 0) := x"00000000";
    DP_REPO_LIB_SHA        : std_logic_vector (31 downto 0) := x"00000000"
    );
  port (

    --------------------------------------------------------------------------------
    -- MGT
    --------------------------------------------------------------------------------

    -- MGT links are set through LOC constraints and not routed to the top level

    --------------------------------------------------------------------------------
    -- ref clocks
    --------------------------------------------------------------------------------

    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

     --------------------------------------------------------------------------------
    -- LHC clock
    --------------------------------------------------------------------------------

    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    tc_clk_o_p : out std_logic;
    tc_clk_o_n : out std_logic;

    --------------------------------------------------------------------------------
    -- AXI C2C
    --------------------------------------------------------------------------------

    -- Async system clock (100 MHz demo, 200MHz prototype)
    clock_async_i_p : in std_logic;
    clock_async_i_n : in std_logic;

    c2c_rxn : in  std_logic;
    c2c_rxp : in  std_logic;
    c2c_txn : out std_logic;
    c2c_txp : out std_logic;

    c2cb_rxn : in  std_logic;
    c2cb_rxp : in  std_logic;
    c2cb_txn : out std_logic;
    c2cb_txp : out std_logic;

    -- etc
    sump : out std_logic

    );
end top_l0mdt;

architecture structural of top_l0mdt is
  
  --------------------------------------------------------------------------------
  -- Clock + TTC
  --------------------------------------------------------------------------------

  signal clock_and_control : l0mdt_control_rt;
  signal ttc_commands      : l0mdt_ttc_rt;
  -- TO-DO: Trigger Throttling System (to signal FELIX about full DAQ buffers) 
  -- signal tts_commands          : TTS_CMD_rt;

  --------------------------------------------------------------------------------
  -- HAL <--> ULT
  --------------------------------------------------------------------------------

  signal inner_tdc_hits  : tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal middle_tdc_hits : tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal outer_tdc_hits  : tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal extra_tdc_hits  : tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0);

  -- signal i_inner_tar_hits  : tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0) := (others => (others => '0'));
  -- signal i_middle_tar_hits : tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0) := (others => (others => '0'));
  -- signal i_outer_tar_hits  : tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0) := (others => (others => '0'));
  -- signal i_extra_tar_hits  : tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0) := (others => (others => '0'));

  signal main_primary_slc   : slc_rx_avt(2 downto 0);  -- is the main SL used
  signal main_secondary_slc : slc_rx_avt(2 downto 0);  -- only used in the big endcap
  signal plus_neighbor_slc  : slc_rx_vt;
  signal minus_neighbor_slc : slc_rx_vt;

  signal plus_neighbor_segments_i  : sf2ptcalc_avt (c_NUM_SF_INPUTS - 1 downto 0);
  signal minus_neighbor_segments_i : sf2ptcalc_avt (c_NUM_SF_INPUTS - 1 downto 0);
  signal plus_neighbor_segments_o  : sf2ptcalc_avt (c_NUM_SF_OUTPUTS - 1 downto 0);
  signal minus_neighbor_segments_o : sf2ptcalc_avt (c_NUM_SF_OUTPUTS - 1 downto 0);

  -- signal daq_streams : felix_stream_avt (c_HPS_MAX_HP_INN
  --                                            + c_HPS_MAX_HP_MID
  --                                            + c_HPS_MAX_HP_OUT - 1 downto 0);

  signal daq_streams : felix_stream_avt(c_DAQ_LINKS-1 downto 0);

  -- NSP + MUCTPI

  signal mtc : mtc_out_avt(c_NUM_MTC-1 downto 0);
  signal nsp : mtc2nsp_avt(c_NUM_NSP-1 downto 0);

  --------------------------------------------------------------------------------
  -- AXI Clocks + Reset
  --------------------------------------------------------------------------------

  signal clk40       : std_logic;       -- 40 MHZ LHC clock for AXI slaves
  signal clk_50      : std_logic;       -- 50 MHz AXI clock for AXI slaves
  signal lhc_locked  : std_logic;       -- LHC clock is locked; used to reset the AXI logic
  signal b2b_locked  : std_logic;       -- Active low reset to C2C link, provided by the MMCM that receives the 100 or 200 MHz axi clock
  signal axi_reset_n : std_logic;       -- Asynchronous, active low reset output from the c2c link

  --------------------------------------------------------------------------------
  -- Control and Monitoring Records
  --------------------------------------------------------------------------------

  signal hps_inn_mon_r  : HPS_MON_t;
  signal hps_inn_ctrl_r : HPS_CTRL_t;
  signal hps_mid_mon_r  : HPS_MON_t;
  signal hps_mid_ctrl_r : HPS_CTRL_t;
  signal hps_out_mon_r  : HPS_MON_t;
  signal hps_out_ctrl_r : HPS_CTRL_t;
  signal hps_ext_mon_r  : HPS_MON_t;
  signal hps_ext_ctrl_r : HPS_CTRL_t;

  signal tar_inn_mon_r  : TAR_MON_t;
  signal tar_inn_ctrl_r : TAR_CTRL_t;
  signal tar_mid_mon_r  : TAR_MON_t;
  signal tar_mid_ctrl_r : TAR_CTRL_t;
  signal tar_out_mon_r  : TAR_MON_t;
  signal tar_out_ctrl_r : TAR_CTRL_t;
  signal tar_ext_mon_r  : TAR_MON_t;
  signal tar_ext_ctrl_r : TAR_CTRL_t;

  signal mtc_ctrl_r    : MTC_CTRL_t;
  signal mtc_mon_r     : MTC_MON_t;
  signal ucm_ctrl_r    : UCM_CTRL_t;
  signal ucm_mon_r     : UCM_MON_t;
  signal daq_ctrl_r    : DAQ_CTRL_t;
  signal daq_mon_r     : DAQ_MON_t;
  signal tf_ctrl_r     : TF_CTRL_t;
  signal tf_mon_r      : TF_MON_t;
  signal mpl_mon_r     : MPL_MON_t;
  signal mpl_ctrl_r    : MPL_CTRL_t;
  signal hog_mon_r     : HOG_MON_t;
  signal fw_info_mon_r : FW_INFO_MON_t;

  signal fm_mon_r  : FM_MON_t;
  signal fm_ctrl_r : FM_CTRL_t;

  signal hps_inn_ctrl_v : std_logic_vector(width(hps_inn_ctrl_r) -1 downto 0);
  signal hps_inn_mon_v  : std_logic_vector(width(hps_inn_mon_r) -1 downto 0);
  signal hps_mid_ctrl_v : std_logic_vector(width(hps_mid_ctrl_r) -1 downto 0);
  signal hps_mid_mon_v  : std_logic_vector(width(hps_mid_mon_r) -1 downto 0);
  signal hps_out_ctrl_v : std_logic_vector(width(hps_out_ctrl_r) -1 downto 0);
  signal hps_out_mon_v  : std_logic_vector(width(hps_out_mon_r) -1 downto 0);
  signal hps_ext_ctrl_v : std_logic_vector(width(hps_ext_ctrl_r) -1 downto 0);
  signal hps_ext_mon_v  : std_logic_vector(width(hps_ext_mon_r) -1 downto 0);

  signal tar_inn_ctrl_v : std_logic_vector(width(tar_inn_ctrl_r) -1 downto 0);
  signal tar_inn_mon_v  : std_logic_vector(width(tar_inn_mon_r) -1 downto 0);
  signal tar_mid_ctrl_v : std_logic_vector(width(tar_mid_ctrl_r) -1 downto 0);
  signal tar_mid_mon_v  : std_logic_vector(width(tar_mid_mon_r) -1 downto 0);
  signal tar_out_ctrl_v : std_logic_vector(width(tar_out_ctrl_r) -1 downto 0);
  signal tar_out_mon_v  : std_logic_vector(width(tar_out_mon_r) -1 downto 0);
  signal tar_ext_ctrl_v : std_logic_vector(width(tar_ext_ctrl_r) -1 downto 0);
  signal tar_ext_mon_v  : std_logic_vector(width(tar_ext_mon_r) -1 downto 0);

  signal mtc_ctrl_v : std_logic_vector(width(mtc_ctrl_r) -1 downto 0);
  signal mtc_mon_v  : std_logic_vector(width(mtc_mon_r) -1 downto 0);
  signal ucm_ctrl_v : std_logic_vector(width(ucm_ctrl_r) -1 downto 0);
  signal ucm_mon_v  : std_logic_vector(width(ucm_mon_r) -1 downto 0);
  signal daq_ctrl_v : std_logic_vector(width(daq_ctrl_r) -1 downto 0);
  signal daq_mon_v  : std_logic_vector(width(daq_mon_r) -1 downto 0);
  signal tf_ctrl_v  : std_logic_vector(width(tf_ctrl_r) -1 downto 0);
  signal tf_mon_v   : std_logic_vector(width(tf_mon_r) -1 downto 0);
  signal mpl_ctrl_v : std_logic_vector(width(mpl_ctrl_r) -1 downto 0);
  signal mpl_mon_v  : std_logic_vector(width(mpl_mon_r) -1 downto 0);

  signal fm_mon_v  : std_logic_vector(width(fm_mon_r) -1 downto 0);
  signal fm_ctrl_v : std_logic_vector(width(fm_ctrl_r) -1 downto 0);

  signal hal_mon_r  : HAL_MON_t;
  signal hal_ctrl_r : HAL_CTRL_t;

  signal CORE_mon_r  : CORE_MON_t;
  signal CORE_ctrl_r : CORE_CTRL_t;

  --------------------------------------------------------------------------------
  -- Sumps
  --------------------------------------------------------------------------------

  signal hal_sump  : std_logic;
  signal user_sump : std_logic;

begin

  -- in sector 3 we only have 0 chambers in the EXTRA station and 6
  -- chambers(polmux) in the rest of stations when we optimize the polmux this
  -- numbers will change and I can bet that they will represent the number of
  -- polmux ( not 100% sure)

  assert (c_HPS_MAX_HP_INN = 0 or c_HPS_MAX_HP_INN = 6) and
    (c_HPS_MAX_HP_MID = 0 or c_HPS_MAX_HP_MID = 6) and
    (c_HPS_MAX_HP_OUT = 0 or c_HPS_MAX_HP_OUT = 6) and
    (c_HPS_MAX_HP_EXT = 0 or c_HPS_MAX_HP_EXT = 6)
    report "The ULT only accepts values of 0 or 6 for c_HPS_MAX_HP_{INN,MID,OUT,EXT}. Please correct your constants." severity error;

  top_hal : entity hal.top_hal
    port map (

      -- clock io
      clock_i_p       => clock_i_p,
      clock_i_n       => clock_i_n,

      clock_async_i_p => clock_async_i_p,
      clock_async_i_n => clock_async_i_n,

      lhc_refclk_o_p  => tc_clk_o_p,
      lhc_refclk_o_n  => tc_clk_o_n,

      refclk_i_p      => refclk_i_p,
      refclk_i_n      => refclk_i_n,

      lhc_locked_o    => lhc_locked,
      b2b_locked_o    => b2b_locked,

      -- clocks to user logic
      clock_and_control_o => clock_and_control,
      ttc_commands_o      => ttc_commands,

      --  tdc data
      tdc_hits_inner  => inner_tdc_hits,
      tdc_hits_middle => middle_tdc_hits,
      tdc_hits_outer  => outer_tdc_hits,
      tdc_hits_extra  => extra_tdc_hits,

      -- SLC
      main_primary_slc   => main_primary_slc,
      main_secondary_slc => main_secondary_slc,
      plus_neighbor_slc  => plus_neighbor_slc,
      minus_neighbor_slc => minus_neighbor_slc,

      -- segment out to neighbor
      plus_neighbor_segments_i  => plus_neighbor_segments_o,
      minus_neighbor_segments_i => minus_neighbor_segments_o,

      -- segment in from neighbor
      plus_neighbor_segments_o  => plus_neighbor_segments_i,
      minus_neighbor_segments_o => minus_neighbor_segments_i,

      -- AXI

      clk40_o  => clk40,

      clk50_o => clk_50, 

      core_ctrl => CORE_ctrl_r,
      core_mon  => CORE_mon_r,

      ctrl => hal_ctrl_r,
      mon  => hal_mon_r,

      mtc_i => mtc,
      nsp_i => nsp,

      daq_streams => daq_streams,

      sump => hal_sump
      );

  ult_inst : entity ult_lib.ult
    generic map (DUMMY => false)
    port map (
      clock_and_control => clock_and_control,
      axi_reset_n       => axi_reset_n,
      ttc_commands      => ttc_commands,

      i_inn_tdc_hits_av => inner_tdc_hits,
      i_mid_tdc_hits_av => middle_tdc_hits,
      i_out_tdc_hits_av => outer_tdc_hits,
      i_ext_tdc_hits_av => extra_tdc_hits,

      i_plus_neighbor_segments     => plus_neighbor_segments_i,
      i_minus_neighbor_segments    => minus_neighbor_segments_i,
      o_plus_neighbor_segments_av  => plus_neighbor_segments_o,
      o_minus_neighbor_segments_av => minus_neighbor_segments_o,

      -- SLC
      i_main_primary_slc   => main_primary_slc,
      i_main_secondary_slc => main_secondary_slc,
      i_plus_neighbor_slc  => plus_neighbor_slc,
      i_minus_neighbor_slc => minus_neighbor_slc,

      o_mtc => mtc,
      o_nsp => nsp,

      o_daq_streams => daq_streams,

      -- Control and Monitoring

      hps_inn_ctrl_v => hps_inn_ctrl_v,
      hps_inn_mon_v  => hps_inn_mon_v,
      hps_mid_ctrl_v => hps_mid_ctrl_v,
      hps_mid_mon_v  => hps_mid_mon_v,
      hps_out_ctrl_v => hps_out_ctrl_v,
      hps_out_mon_v  => hps_out_mon_v,
      hps_ext_ctrl_v => hps_ext_ctrl_v,
      hps_ext_mon_v  => hps_ext_mon_v,

      tar_inn_ctrl_v => tar_inn_ctrl_v,
      tar_inn_mon_v  => tar_inn_mon_v,
      tar_mid_ctrl_v => tar_mid_ctrl_v,
      tar_mid_mon_v  => tar_mid_mon_v,
      tar_out_ctrl_v => tar_out_ctrl_v,
      tar_out_mon_v  => tar_out_mon_v,
      tar_ext_ctrl_v => tar_ext_ctrl_v,
      tar_ext_mon_v  => tar_ext_mon_v,

      mtc_ctrl_v => mtc_ctrl_v,
      mtc_mon_v  => mtc_mon_v,
      ucm_ctrl_v => ucm_ctrl_v,
      ucm_mon_v  => ucm_mon_v,
      daq_ctrl_v => daq_ctrl_v,
      daq_mon_v  => daq_mon_v,
      tf_ctrl_v  => tf_ctrl_v,
      tf_mon_v   => tf_mon_v,
      mpl_ctrl_v => mpl_ctrl_v,
      mpl_mon_v  => mpl_mon_v,
      fm_ctrl_v  => fm_ctrl_v,
      fm_mon_v   => fm_mon_v,     
      --

      sump => user_sump
      );

  -- ctrl/mon
  ucm_ctrl_v     <= convert(ucm_ctrl_r, ucm_ctrl_v);
  ucm_mon_r      <= convert(ucm_mon_v, ucm_mon_r);

  tar_inn_ctrl_v <= convert(tar_inn_ctrl_r, tar_inn_ctrl_v);
  tar_inn_mon_r  <= convert(tar_inn_mon_v, tar_inn_mon_r);
  tar_mid_ctrl_v <= convert(tar_mid_ctrl_r, tar_mid_ctrl_v);
  tar_mid_mon_r  <= convert(tar_mid_mon_v, tar_mid_mon_r);
  tar_out_ctrl_v <= convert(tar_out_ctrl_r, tar_out_ctrl_v);
  tar_out_mon_r  <= convert(tar_out_mon_v, tar_out_mon_r);
  tar_ext_ctrl_v <= convert(tar_ext_ctrl_r, tar_ext_ctrl_v);
  tar_ext_mon_r  <= convert(tar_ext_mon_v, tar_ext_mon_r);

  hps_inn_ctrl_v <= convert(hps_inn_ctrl_r, hps_inn_ctrl_v);
  hps_inn_mon_r  <= convert(hps_inn_mon_v, hps_inn_mon_r);
  hps_mid_ctrl_v <= convert(hps_mid_ctrl_r, hps_mid_ctrl_v);
  hps_mid_mon_r  <= convert(hps_mid_mon_v, hps_mid_mon_r);
  hps_out_ctrl_v <= convert(hps_out_ctrl_r, hps_out_ctrl_v);
  hps_out_mon_r  <= convert(hps_out_mon_v, hps_out_mon_r);
  hps_ext_ctrl_v <= convert(hps_ext_ctrl_r, hps_ext_ctrl_v);
  hps_ext_mon_r  <= convert(hps_ext_mon_v, hps_ext_mon_r);

  mpl_ctrl_v     <= convert(mpl_ctrl_r, mpl_ctrl_v);
  mpl_mon_r      <= convert(mpl_mon_v, mpl_mon_r);

  tf_ctrl_v      <= convert(tf_ctrl_r, tf_ctrl_v);
  tf_mon_r       <= convert(tf_mon_v, tf_mon_r);
  mtc_ctrl_v     <= convert(mtc_ctrl_r, mtc_ctrl_v);
  mtc_mon_r      <= convert(mtc_mon_v, mtc_mon_r);
  daq_ctrl_v     <= convert(daq_ctrl_r, daq_ctrl_v);
  daq_mon_r      <= convert(daq_mon_v, daq_mon_r);
  fm_ctrl_v      <= convert(fm_ctrl_r, fm_ctrl_v);
  fm_mon_r       <= convert(fm_mon_v, fm_mon_r);

  top_control_inst : entity work.top_control
    port map (

      -- c2c physical
      c2c_rxn     => c2c_rxn,
      c2c_rxp     => c2c_rxp,
      c2c_txn     => c2c_txn,
      c2c_txp     => c2c_txp,

      c2cb_rxn    => c2cb_rxn,
      c2cb_rxp    => c2cb_rxp,
      c2cb_txn    => c2cb_txn,
      c2cb_txp    => c2cb_txp,
      c2c_refclkp => refclk_i_p(C2C_REFCLK_SRC),  -- c2c_refclkp,
      c2c_refclkn => refclk_i_n(C2C_REFCLK_SRC),  --c2c_refclkn,
      axi_reset_n => axi_reset_n,
      
      -- START: ULT_IO :: DO NOT EDIT
      -- END: ULT_IO :: DO NOT EDIT
       
      -- axi common
      clk40                   => clk40,
      clk_user                => clock_and_control.clk,
      axi_clk                 => clk_50, 
      clk40_rstn              => lhc_locked and b2b_locked,
      reset_n                 => b2b_locked,
      sys_mgmt_alarm          => open,
      sys_mgmt_overtemp_alarm => open,
      --sys_mgmt_scl            => sys_mgmt_scl,
      --sys_mgmt_sda            => sys_mgmt_sda,
      sys_mgmt_vccaux_alarm   => open,
      sys_mgmt_vccint_alarm   => open
      );

    hog_mon_r.HOG_INFO.GLOBAL_DATE     <= GLOBAL_DATE;
    hog_mon_r.HOG_INFO.GLOBAL_TIME     <= GLOBAL_TIME;
    hog_mon_r.HOG_INFO.GLOBAL_VER      <= GLOBAL_VER;
    hog_mon_r.HOG_INFO.GLOBAL_SHA      <= GLOBAL_SHA;
    hog_mon_r.HOG_INFO.TOP_SHA         <= TOP_SHA;
    hog_mon_r.HOG_INFO.TOP_VER         <= TOP_VER;
    hog_mon_r.HOG_INFO.HOG_SHA         <= HOG_SHA;
    hog_mon_r.HOG_INFO.HOG_VER         <= HOG_VER;
    hog_mon_r.HOG_INFO.CON_SHA         <= CON_SHA;
    hog_mon_r.HOG_INFO.CON_VER         <= CON_VER;
    hog_mon_r.HOG_INFO.PROJECT_LIB_SHA <= PROJECT_LIB_SHA;
    hog_mon_r.HOG_INFO.PROJECT_LIB_VER <= PROJECT_LIB_VER;

    fw_info_mon_r.CONFIG.MAIN_CFG_COMPILE_HW <= MAIN_CFG_COMPILE_HW;
    fw_info_mon_r.CONFIG.MAIN_CFG_COMPILE_UL <= MAIN_CFG_COMPILE_UL;
    fw_info_mon_r.CONFIG.ST_nBARREL_ENDCAP   <= c_ST_nBARREL_ENDCAP;
    fw_info_mon_r.CONFIG.ENABLE_NEIGHBORS    <= c_ENABLE_NEIGHBORS;
    fw_info_mon_r.CONFIG.SECTOR_ID           <= std_logic_vector(to_unsigned(c_SECTOR_ID, 32));
    fw_info_mon_r.CONFIG.ENDCAP_nSMALL_LARGE <= c_ENDCAP_nSMALL_LARGE;
    fw_info_mon_r.CONFIG.PHY_BARREL_R0       <= std_logic_vector(resize(PHY_BARREL_R0, 32));
    fw_info_mon_r.CONFIG.PHY_BARREL_R1       <= std_logic_vector(resize(PHY_BARREL_R1, 32));
    fw_info_mon_r.CONFIG.PHY_BARREL_R2       <= std_logic_vector(resize(PHY_BARREL_R2, 32));
    fw_info_mon_r.CONFIG.PHY_BARREL_R3       <= std_logic_vector(resize(PHY_BARREL_R3, 32));
    fw_info_mon_r.CONFIG.HPS_ENABLE_ST_INN   <= c_HPS_ENABLE_ST_INN;
    fw_info_mon_r.CONFIG.HPS_ENABLE_ST_EXT   <= c_HPS_ENABLE_ST_EXT;
    fw_info_mon_r.CONFIG.HPS_ENABLE_ST_MID   <= c_HPS_ENABLE_ST_MID;
    fw_info_mon_r.CONFIG.HPS_ENABLE_ST_OUT   <= c_HPS_ENABLE_ST_OUT;
    fw_info_mon_r.CONFIG.HPS_NUM_MDT_CH_INN  <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_INN, 8));
    fw_info_mon_r.CONFIG.HPS_NUM_MDT_CH_EXT  <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_EXT, 8));
    fw_info_mon_r.CONFIG.HPS_NUM_MDT_CH_MID  <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_MID, 8));
    fw_info_mon_r.CONFIG.HPS_NUM_MDT_CH_OUT  <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_OUT, 8));
    fw_info_mon_r.CONFIG.NUM_MTC             <= std_logic_vector(to_unsigned(c_NUM_MTC, 8));
    fw_info_mon_r.CONFIG.NUM_NSP             <= std_logic_vector(to_unsigned(c_NUM_NSP, 8));
    fw_info_mon_r.CONFIG.UCM_ENABLED         <= c_UCM_ENABLED;
    fw_info_mon_r.CONFIG.MPL_ENABLED         <= c_MPL_ENABLED;
    fw_info_mon_r.CONFIG.SF_ENABLED          <= c_SF_ENABLED;
    fw_info_mon_r.CONFIG.SF_TYPE             <= c_SF_TYPE;
    fw_info_mon_r.CONFIG.NUM_DAQ_STREAMS     <= std_logic_vector(to_unsigned(c_NUM_DAQ_STREAMS, 8));
    fw_info_mon_r.CONFIG.NUM_SF_INPUTS       <= std_logic_vector(to_unsigned(c_NUM_SF_INPUTS, 8));
    fw_info_mon_r.CONFIG.NUM_SF_OUTPUTS      <= std_logic_vector(to_unsigned(c_NUM_SF_OUTPUTS, 8));
    fw_info_mon_r.CONFIG.MAX_NUM_SL          <= std_logic_vector(to_unsigned(c_MAX_NUM_SL, 8));
    fw_info_mon_r.CONFIG.NUM_THREADS         <= std_logic_vector(to_unsigned(c_NUM_THREADS, 8));

  process (clock_and_control.clk) is
  begin
    if (rising_edge(clock_and_control.clk)) then
      sump <= hal_sump xor user_sump;
    end if;
  end process;

end structural;
