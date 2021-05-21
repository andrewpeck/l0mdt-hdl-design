library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library work;
use work.all;

library hal;
use hal.board_pkg.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;

library ctrl_lib;
use ctrl_lib.spies_pkg.all;
use ctrl_lib.HAL_CORE_CTRL.all;
use ctrl_lib.HAL_CTRL.all;
use ctrl_lib.FW_INFO_CTRL.all;
use ctrl_lib.axiRegPkg.all;
use ctrl_lib.H2S_CTRL.all;
use ctrl_lib.H2S_Ctrl_DEF.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ult_lib;

entity top_l0mdt is
  generic (
    -- these generics get set by hog at synthesis
    GLOBAL_FWDATE       : std_logic_vector (31 downto 0) := x"00000000";
    GLOBAL_FWTIME       : std_logic_vector (31 downto 0) := x"00000000";
    OFFICIAL            : std_logic_vector (31 downto 0) := x"00000000";
    GLOBAL_FWHASH       : std_logic_vector (31 downto 0) := x"00000000";
    TOP_FWHASH          : std_logic_vector (31 downto 0) := x"00000000";
    XML_HASH            : std_logic_vector (31 downto 0) := x"00000000";
    GLOBAL_FWVERSION    : std_logic_vector (31 downto 0) := x"00000000";
    TOP_FWVERSION       : std_logic_vector (31 downto 0) := x"00000000";
    XML_VERSION         : std_logic_vector (31 downto 0) := x"00000000";
    HOG_FWHASH          : std_logic_vector (31 downto 0) := x"00000000";
    FRAMEWORK_FWVERSION : std_logic_vector (31 downto 0) := x"00000000";
    FRAMEWORK_FWHASH    : std_logic_vector (31 downto 0) := x"00000000"
    );
  port (

    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    clock_100m_i_p : in std_logic;
    clock_100m_i_n : in std_logic;

    lhc_refclk_o_p : out std_logic;
    lhc_refclk_o_n : out std_logic;

    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    c2c_rxn : in  std_logic;
    c2c_rxp : in  std_logic;
    c2c_txn : out std_logic;
    c2c_txp : out std_logic;

    --sys_mgmt_scl : inout std_logic;
    --sys_mgmt_sda : inout std_logic;

    -- cornell only
    --cornell_cm_led_o : out std_logic_vector (c_NUM_CORNELL_LEDS-1 downto 0);

    -- mpi only
    --ddr_blahblah_in  : in std_logic_vector(c_NUM_DDR_INPUTS-1 downto 0);
    --ddr_blahblah_out : out std_logic_vector(c_NUM_DDR_OUTPUTS-1 downto 0);

    -- etc

    sump : out std_logic

    );
end top_l0mdt;

architecture structural of top_l0mdt is

  --
  signal clock_and_control : l0mdt_control_rt;
  signal ttc_commands      : l0mdt_ttc_rt;
  -- signal tts_commands          : TTS_CMD_rt;

  -- hal <--> ult

  -- FIXME: WHY ARE THESE PORTS ALWAYS size=0 or size=6 ??? this is so stupid
  signal inner_tdc_hits  : mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal middle_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal outer_tdc_hits  : mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal extra_tdc_hits  : mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);

  -- FIXME: WHY ARE THESE PORTS ALWAYS size=0 or size=6 ??? this is so stupid
  signal i_inner_tar_hits  : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0) := (others => (others => '0'));
  signal i_middle_tar_hits : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0) := (others => (others => '0'));
  signal i_outer_tar_hits  : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0) := (others => (others => '0'));
  signal i_extra_tar_hits  : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0) := (others => (others => '0'));

  signal main_primary_slc   : slc_rx_bus_avt(2 downto 0);  -- is the main SL used
  signal main_secondary_slc : slc_rx_bus_avt(2 downto 0);  -- only used in the big endcap
  signal plus_neighbor_slc  : slc_rx_rvt;
  signal minus_neighbor_slc : slc_rx_rvt;

  signal plus_neighbor_segments_i  : sf2pt_bus_avt (c_NUM_SF_INPUTS - 1 downto 0);
  signal minus_neighbor_segments_i : sf2pt_bus_avt (c_NUM_SF_INPUTS - 1 downto 0);
  signal plus_neighbor_segments_o  : sf2pt_bus_avt (c_NUM_SF_OUTPUTS - 1 downto 0);
  signal minus_neighbor_segments_o : sf2pt_bus_avt (c_NUM_SF_OUTPUTS - 1 downto 0);

  signal daq_streams : FELIX_STREAM_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);

  -- NSP + MUCTPI

  signal mtc : mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
  signal nsp : mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

  -- AXI

  signal axi_clk : std_logic;
  signal clk320  : std_logic;
  signal clk40   : std_logic;

  -- Control and Monitoring Records

  signal h2s_mon  : H2S_MON_t;
  signal h2s_ctrl : H2S_CTRL_t;

  signal tar_ctrl : TAR_CTRL_t;
  signal tar_mon  : TAR_MON_t;

  signal mtc_ctrl : MTC_CTRL_t;
  signal mtc_mon  : MTC_MON_t;

  signal ucm_ctrl : UCM_CTRL_t;
  signal ucm_mon  : UCM_MON_t;

  signal daq_ctrl : DAQ_CTRL_t;
  signal daq_mon  : DAQ_MON_t;

  signal tf_ctrl : TF_CTRL_t;
  signal tf_mon  : TF_MON_t;

  signal mpl_mon  : MPL_MON_t;
  signal mpl_ctrl : MPL_CTRL_t;

  signal hal_mon  : HAL_MON_t;
  signal hal_ctrl : HAL_CTRL_t;

  signal hal_core_mon  : HAL_CORE_MON_t;
  signal hal_core_ctrl : HAL_CORE_CTRL_t;

  signal fw_info_mon  : FW_INFO_MON_t;

  -- sumps

  signal hal_sump  : std_logic;
  signal user_sump : std_logic;

  -- spybuffers

  signal user_spy_mon  : spy_mon_t;
  signal user_spy_ctrl : spy_ctrl_t;

begin

  top_hal : entity hal.top_hal
    port map (

      -- clock io
      clock_i_p      => clock_i_p,
      clock_i_n      => clock_i_n,
      clock_100m_i_p => clock_100m_i_p,
      clock_100m_i_n => clock_100m_i_n,
      lhc_refclk_o_p => lhc_refclk_o_p,
      lhc_refclk_o_n => lhc_refclk_o_n,
      refclk_i_p     => refclk_i_p,
      refclk_i_n     => refclk_i_n,

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

      clk320_o => clk320,
      clk40_o  => clk40,

      axi_clk_o => axi_clk,

      core_ctrl => hal_core_ctrl,
      core_mon  => hal_core_mon,

      ctrl => hal_ctrl,
      mon  => hal_mon,

      mtc_i => mtc,
      nsp_i => nsp,

      daq_streams => daq_streams,

      sump => hal_sump
      );

  ult_inst : entity ult_lib.ult
    generic map (
      DUMMY => false
      )
    port map (
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,

      i_inn_tdc_hits => inner_tdc_hits,
      i_mid_tdc_hits => middle_tdc_hits,
      i_out_tdc_hits => outer_tdc_hits,
      i_ext_tdc_hits => extra_tdc_hits,

      -- i_inner_tar_hits  => i_inner_tar_hits,
      -- i_middle_tar_hits => i_middle_tar_hits,
      -- i_outer_tar_hits  => i_outer_tar_hits,
      -- i_extra_tar_hits  => i_extra_tar_hits,

      i_plus_neighbor_segments  => plus_neighbor_segments_i,
      i_minus_neighbor_segments => minus_neighbor_segments_i,
      o_plus_neighbor_segments  => plus_neighbor_segments_o,
      o_minus_neighbor_segments => minus_neighbor_segments_o,

      -- SLC
      i_main_primary_slc   => main_primary_slc,
      i_main_secondary_slc => main_secondary_slc,
      i_plus_neighbor_slc  => plus_neighbor_slc,
      i_minus_neighbor_slc => minus_neighbor_slc,

      o_mtc => mtc,
      o_nsp => nsp,

      o_daq_streams => daq_streams,

      -- Control and Monitoring

      h2s_ctrl => h2s_ctrl,
      h2s_mon  => h2s_mon,
      tar_ctrl => tar_ctrl,
      tar_mon  => tar_mon,
      mtc_ctrl => mtc_ctrl,
      mtc_mon  => mtc_mon,
      ucm_ctrl => ucm_ctrl,
      ucm_mon  => ucm_mon,
      daq_ctrl => daq_ctrl,
      daq_mon  => daq_mon,
      tf_ctrl  => tf_ctrl,
      tf_mon   => tf_mon,
      mpl_ctrl => mpl_ctrl,
      mpl_mon  => mpl_mon,
      --

      sump => user_sump
      );

  user_spy_mon.mpl_spy.dout <= (others => '0');
  user_spy_mon.tar_spy.dout <= (others => '0');

  top_control_inst : entity work.top_control
    port map (

      -- c2c physical
      c2c_rxn     => c2c_rxn,
      c2c_rxp     => c2c_rxp,
      c2c_txn     => c2c_txn,
      c2c_txp     => c2c_txp,
      c2c_refclkp => refclk_i_p(C2C_REFCLK_SRC),
      c2c_refclkn => refclk_i_n(C2C_REFCLK_SRC),

      -- HAL Control

      hal_core_ctrl => hal_core_ctrl,
      hal_core_mon  => hal_core_mon,

      hal_ctrl => hal_ctrl,
      hal_mon  => hal_mon,

      -- ULT Control

      h2s_ctrl    => h2s_ctrl,
      h2s_mon     => h2s_mon,
      tar_ctrl    => tar_ctrl,
      tar_mon     => tar_mon,
      mtc_ctrl    => mtc_ctrl,
      mtc_mon     => mtc_mon,
      ucm_ctrl    => ucm_ctrl,
      ucm_mon     => ucm_mon,
      daq_ctrl    => daq_ctrl,
      daq_mon     => daq_mon,
      tf_ctrl     => tf_ctrl,
      tf_mon      => tf_mon,
      mpl_ctrl    => mpl_ctrl,
      mpl_mon     => mpl_mon,
      fw_info_mon => fw_info_mon,

      -- spybuffers

      user_spy_ctrl => user_spy_ctrl,
      user_spy_mon  => user_spy_mon,

      -- axi common
      clk320                  => clk320,
      clk40                   => clk40,
      clkpipe                 => clock_and_control.clk,
      axi_clk                 => axi_clk,
      clk50mhz                => axi_clk,
      reset_n                 => '1',
      sys_mgmt_alarm          => open,
      sys_mgmt_overtemp_alarm => open,
      --sys_mgmt_scl            => sys_mgmt_scl,
      --sys_mgmt_sda            => sys_mgmt_sda,
      sys_mgmt_vccaux_alarm   => open,
      sys_mgmt_vccint_alarm   => open
      );

  fw_info_mon.FW_INFO.GIT_VALID                    <= '0';              -- FW_HASH_VALID;
  fw_info_mon.FW_INFO.GIT_HASH_1                   <= (others => '0');  -- FW_HASH_1;
  fw_info_mon.FW_INFO.GIT_HASH_2                   <= (others => '0');  -- FW_HASH_2;
  fw_info_mon.FW_INFO.GIT_HASH_3                   <= (others => '0');  -- FW_HASH_3;
  fw_info_mon.FW_INFO.GIT_HASH_4                   <= (others => '0');  -- FW_HASH_4;
  fw_info_mon.FW_INFO.GIT_HASH_5                   <= (others => '0');  -- FW_HASH_5;
  fw_info_mon.FW_INFO.BUILD_DATE.DAY               <= (others => '0');  -- TS_DAY;
  fw_info_mon.FW_INFO.BUILD_DATE.MONTH             <= (others => '0');  -- TS_MONTH;
  fw_info_mon.FW_INFO.BUILD_DATE.YEAR(7 downto 0)  <= (others => '0');  -- TS_YEAR;
  fw_info_mon.FW_INFO.BUILD_DATE.YEAR(15 downto 8) <= (others => '0');  -- TS_CENT;
  fw_info_mon.FW_INFO.BUILD_TIME.sec               <= (others => '0');  -- TS_SEC;
  fw_info_mon.FW_INFO.BUILD_TIME.min               <= (others => '0');  -- TS_MIN;
  fw_info_mon.FW_INFO.BUILD_TIME.HOUR              <= (others => '0');  -- TS_HOUR
  fw_info_mon.HOG_INFO.GLOBAL_FWDATE               <= GLOBAL_FWDATE;
  fw_info_mon.HOG_INFO.GLOBAL_FWTIME               <= GLOBAL_FWTIME;
  fw_info_mon.HOG_INFO.OFFICIAL                    <= OFFICIAL;
  fw_info_mon.HOG_INFO.GLOBAL_FWHASH               <= GLOBAL_FWHASH;
  fw_info_mon.HOG_INFO.TOP_FWHASH                  <= TOP_FWHASH;
  fw_info_mon.HOG_INFO.XML_HASH                    <= XML_HASH;
  fw_info_mon.HOG_INFO.GLOBAL_FWVERSION            <= GLOBAL_FWVERSION;
  fw_info_mon.HOG_INFO.TOP_FWVERSION               <= TOP_FWVERSION;
  fw_info_mon.HOG_INFO.XML_VERSION                 <= XML_VERSION;
  fw_info_mon.HOG_INFO.HOG_FWHASH                  <= HOG_FWHASH;
  fw_info_mon.HOG_INFO.FRAMEWORK_FWVERSION         <= FRAMEWORK_FWVERSION;
  fw_info_mon.HOG_INFO.FRAMEWORK_FWHASH            <= FRAMEWORK_FWHASH;
  fw_info_mon.CONFIG.MAIN_CFG_COMPILE_HW           <= MAIN_CFG_COMPILE_HW;
  fw_info_mon.CONFIG.MAIN_CFG_COMPILE_UL           <= MAIN_CFG_COMPILE_UL;
  --fw_info_mon.CONFIG.SECTOR_SIDE         <= c_SECTOR_SIDE;
  fw_info_mon.CONFIG.ST_nBARREL_ENDCAP             <= c_ST_nBARREL_ENDCAP;
  fw_info_mon.CONFIG.ENABLE_NEIGHBORS              <= c_ENABLE_NEIGHBORS;
  fw_info_mon.CONFIG.SECTOR_ID                     <= std_logic_vector(to_unsigned(c_SECTOR_ID, 32));
  fw_info_mon.CONFIG.ENDCAP_nSMALL_LARGE           <= c_ENDCAP_nSMALL_LARGE;
  fw_info_mon.CONFIG.PHY_BARREL_R0                 <= std_logic_vector(resize(PHY_BARREL_R0, 32));
  fw_info_mon.CONFIG.PHY_BARREL_R1                 <= std_logic_vector(resize(PHY_BARREL_R1, 32));
  fw_info_mon.CONFIG.PHY_BARREL_R2                 <= std_logic_vector(resize(PHY_BARREL_R2, 32));
  fw_info_mon.CONFIG.PHY_BARREL_R3                 <= std_logic_vector(resize(PHY_BARREL_R3, 32));
  fw_info_mon.CONFIG.HPS_ENABLE_ST_INN             <= c_HPS_ENABLE_ST_INN;
  fw_info_mon.CONFIG.HPS_ENABLE_ST_EXT             <= c_HPS_ENABLE_ST_EXT;
  fw_info_mon.CONFIG.HPS_ENABLE_ST_MID             <= c_HPS_ENABLE_ST_MID;
  fw_info_mon.CONFIG.HPS_ENABLE_ST_OUT             <= c_HPS_ENABLE_ST_OUT;
  fw_info_mon.CONFIG.HPS_NUM_MDT_CH_INN            <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_INN, 8));
  fw_info_mon.CONFIG.HPS_NUM_MDT_CH_EXT            <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_EXT, 8));
  fw_info_mon.CONFIG.HPS_NUM_MDT_CH_MID            <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_MID, 8));
  fw_info_mon.CONFIG.HPS_NUM_MDT_CH_OUT            <= std_logic_vector(to_unsigned(c_HPS_NUM_MDT_CH_OUT, 8));
  fw_info_mon.CONFIG.NUM_MTC                       <= std_logic_vector(to_unsigned(c_NUM_MTC, 8));
  fw_info_mon.CONFIG.NUM_NSP                       <= std_logic_vector(to_unsigned(c_NUM_NSP, 8));
  fw_info_mon.CONFIG.UCM_ENABLED                   <= c_UCM_ENABLED;
  fw_info_mon.CONFIG.MPL_ENABLED                   <= c_MPL_ENABLED;
  fw_info_mon.CONFIG.SF_ENABLED                    <= c_SF_ENABLED;
  fw_info_mon.CONFIG.SF_TYPE                       <= c_SF_TYPE;
  fw_info_mon.CONFIG.NUM_DAQ_STREAMS               <= std_logic_vector(to_unsigned(c_NUM_DAQ_STREAMS, 8));
  --fw_info_mon.CONFIG.MAX_NUM_HP          <= std_logic_vector(to_unsigned(MAX_NUM_HP, 8));
  --fw_info_mon.CONFIG.MAX_NUM_HPS         <= std_logic_vector(to_unsigned(c_MAX_NUM_HPS, 8));
  fw_info_mon.CONFIG.NUM_SF_INPUTS                 <= std_logic_vector(to_unsigned(c_NUM_SF_INPUTS, 8));
  fw_info_mon.CONFIG.NUM_SF_OUTPUTS                <= std_logic_vector(to_unsigned(c_NUM_SF_OUTPUTS, 8));
  fw_info_mon.CONFIG.MAX_NUM_SL                    <= std_logic_vector(to_unsigned(c_MAX_NUM_SL, 8));
  fw_info_mon.CONFIG.NUM_THREADS                   <= std_logic_vector(to_unsigned(c_NUM_THREADS, 8));

  sump <= hal_sump xor user_sump;

end structural;
