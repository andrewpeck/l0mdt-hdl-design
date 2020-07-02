library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library work;
use work.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library hal;
use hal.board_pkg.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;

library ctrl;
use ctrl.HAL_CTRL.all;
use ctrl.HOG_INFO_CTRL.all;
use ctrl.FW_INFO_CTRL.all;
use ctrl.axiRegPkg.all;

library ult;

-- library c2c;
-- use c2c.axiRegPkg.all;

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

    c2c_rxn     : in  std_logic;
    c2c_rxp     : in  std_logic;
    c2c_txn     : out std_logic;
    c2c_txp     : out std_logic;
    c2c_refclkp : in  std_logic;
    c2c_refclkn : in  std_logic;

    sys_mgmt_scl : inout std_logic;
    sys_mgmt_sda : inout std_logic;

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
  signal inner_tdc_hits            : TDCPOLMUX_avt (c_NUM_POLMUX_INNER -1 downto 0);
  signal middle_tdc_hits           : TDCPOLMUX_avt (c_NUM_POLMUX_MIDDLE-1 downto 0);
  signal outer_tdc_hits            : TDCPOLMUX_avt (c_NUM_POLMUX_OUTER -1 downto 0);
  signal extra_tdc_hits            : TDCPOLMUX_avt (c_NUM_POLMUX_EXTRA -1 downto 0);
  signal slc                       : SLC_avt (c_NUM_SLC-1 downto 0);
  signal plus_neighbor_segments_o  : SF_avt (c_NUM_SF_OUTPUTS-1 downto 0);
  signal minus_neighbor_segments_o : SF_avt (c_NUM_SF_OUTPUTS-1 downto 0);
  signal plus_neighbor_segments_i  : SF_avt (c_NUM_SF_INPUTS-1 downto 0);
  signal minus_neighbor_segments_i : SF_avt (c_NUM_SF_INPUTS-1 downto 0);
  signal daq_streams               : FELIX_STREAM_avt (c_NUM_DAQ_STREAMS-1 downto 0);

  -- NSP + MUCTPI
  signal mtc : MTC_avt (c_NUM_MTC-1 downto 0);
  signal nsp : NSP_avt (c_NUM_NSP-1 downto 0);

  -- AXI

  signal axi_clk : std_logic;

  signal hal_readmosi  : axireadmosi;
  signal hal_readmiso  : axireadmiso;
  signal hal_writemosi : axiwritemosi;
  signal hal_writemiso : axiwritemiso;

  signal hog_info_readmosi  : axireadmosi;
  signal hog_info_readmiso  : axireadmiso;
  signal hog_info_writemosi : axiwritemosi;
  signal hog_info_writemiso : axiwritemiso;

  signal fw_info_readmosi  : axireadmosi;
  signal fw_info_readmiso  : axireadmiso;
  signal fw_info_writemosi : axiwritemosi;
  signal fw_info_writemiso : axiwritemiso;

  signal hal_sump  : std_logic;
  signal user_sump : std_logic;

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
      ttc_commands        => ttc_commands,

      --  tdc data
      tdc_hits_inner  => inner_tdc_hits,
      tdc_hits_middle => middle_tdc_hits,
      tdc_hits_outer  => outer_tdc_hits,
      tdc_hits_extra  => extra_tdc_hits,

      --
      slc_o => slc,

      -- segment out to neighbor
      plus_neighbor_segments_i  => plus_neighbor_segments_o,
      minus_neighbor_segments_i => minus_neighbor_segments_o,

      -- segment in from neighbor
      plus_neighbor_segments_o  => plus_neighbor_segments_i,
      minus_neighbor_segments_o => minus_neighbor_segments_i,

      -- AXI

      axi_clk_o     => axi_clk,

      hal_readmosi  => hal_readmosi,
      hal_readmiso  => hal_readmiso,
      hal_writemosi => hal_writemosi,
      hal_writemiso => hal_writemiso,


      mtc_i => mtc,
      nsp_i => nsp,

      daq_streams => daq_streams,

      sump => hal_sump
      );

  top_ult_inst : entity ult.top_ult
    generic map (
      DUMMY => true)
    port map (
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,

      inner_tdc_hits_i  => inner_tdc_hits,
      middle_tdc_hits_i => middle_tdc_hits,
      outer_tdc_hits_i  => outer_tdc_hits,
      extra_tdc_hits_i  => extra_tdc_hits,

      slc_i => slc,

      plus_neighbor_segments_i  => plus_neighbor_segments_i,
      minus_neighbor_segments_i => minus_neighbor_segments_i,
      plus_neighbor_segments_o  => plus_neighbor_segments_o,
      minus_neighbor_segments_o => minus_neighbor_segments_o,

      mtc_o => mtc,
      nsp_o => nsp,

      daq_streams_o => daq_streams,
      sump          => user_sump
      );

  --top_control : entity ult.top_control
  --  port map (
  --    );
  top_control_inst : entity ctrl.top_control
    port map (

      -- c2c physical
      c2c_rxn     => c2c_rxn,
      c2c_rxp     => c2c_rxp,
      c2c_txn     => c2c_txn,
      c2c_txp     => c2c_txp,
      c2c_refclkn => c2c_refclkn,
      c2c_refclkp => c2c_refclkp,

      -- axi slaves
      hal_readmosi  => hal_readmosi,
      hal_readmiso  => hal_readmiso,
      hal_writemosi => hal_writemosi,
      hal_writemiso => hal_writemiso,

      fw_info_readmosi  => fw_info_readmosi,
      fw_info_readmiso  => fw_info_readmiso,
      fw_info_writemosi => fw_info_writemosi,
      fw_info_writemiso => fw_info_writemiso,

      hog_info_readmosi  => hog_info_readmosi,
      hog_info_readmiso  => hog_info_readmiso,
      hog_info_writemosi => hog_info_writemosi,
      hog_info_writemiso => hog_info_writemiso,

      -- axi common
      axi_clk                 => axi_clk,
      clk50mhz                => axi_clk,
      reset_n                 => '1',
      sys_mgmt_alarm          => open,
      sys_mgmt_overtemp_alarm => open,
      sys_mgmt_scl            => sys_mgmt_scl,
      sys_mgmt_sda            => sys_mgmt_sda,
      sys_mgmt_vccaux_alarm   => open,
      sys_mgmt_vccint_alarm   => open
      );

  hog_info_interface_inst : entity ctrl.hog_info_interface
    port map (
      clk_axi                 => axi_clk,
      reset_axi_n             => '1',
      slave_readmosi          => hog_info_readmosi,
      slave_readmiso          => hog_info_readmiso,
      slave_writemosi         => hog_info_writemosi,
      slave_writemiso         => hog_info_writemiso,
      mon.GLOBAL_FWDATE       => GLOBAL_FWDATE,
      mon.GLOBAL_FWTIME       => GLOBAL_FWTIME,
      mon.OFFICIAL            => OFFICIAL,
      mon.GLOBAL_FWHASH       => GLOBAL_FWHASH,
      mon.TOP_FWHASH          => TOP_FWHASH,
      mon.XML_HASH            => XML_HASH,
      mon.GLOBAL_FWVERSION    => GLOBAL_FWVERSION,
      mon.TOP_FWVERSION       => TOP_FWVERSION,
      mon.XML_VERSION         => XML_VERSION,
      mon.HOG_FWHASH          => HOG_FWHASH,
      mon.FRAMEWORK_FWVERSION => FRAMEWORK_FWVERSION,
      mon.FRAMEWORK_FWHASH    => FRAMEWORK_FWHASH
      );

  fw_info_interface_inst : entity ctrl.fw_info_interface
    port map (
      clk_axi                          => axi_clk,
      reset_axi_n                      => '1',
      slave_readmosi                   => fw_info_readmosi,
      slave_readmiso                   => fw_info_readmiso,
      slave_writemosi                  => fw_info_writemosi,
      slave_writemiso                  => fw_info_writemiso,
      mon.GIT_VALID                    => '0',              -- FW_HASH_VALID,
      mon.GIT_HASH_1                   => (others => '0'),  -- FW_HASH_1,
      mon.GIT_HASH_2                   => (others => '0'),  -- FW_HASH_2,
      mon.GIT_HASH_3                   => (others => '0'),  -- FW_HASH_3,
      mon.GIT_HASH_4                   => (others => '0'),  -- FW_HASH_4,
      mon.GIT_HASH_5                   => (others => '0'),  -- FW_HASH_5,
      mon.BUILD_DATE.DAY               => (others => '0'),  -- TS_DAY,
      mon.BUILD_DATE.MONTH             => (others => '0'),  -- TS_MONTH,
      mon.BUILD_DATE.YEAR(7 downto 0)  => (others => '0'),  -- TS_YEAR,
      mon.BUILD_DATE.YEAR(15 downto 8) => (others => '0'),  -- TS_CENT,
      mon.BUILD_TIME.sec               => (others => '0'),  -- TS_SEC,
      mon.BUILD_TIME.min               => (others => '0'),  -- TS_MIN,
      mon.BUILD_TIME.HOUR              => (others => '0')   -- TS_HOUR
      );

  sump <= hal_sump xor user_sump;

end structural;
