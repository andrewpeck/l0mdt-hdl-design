library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library hal;
use hal.board_pkg.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;

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

  --
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

      mtc_i => mtc,
      nsp_i => nsp,

      daq_streams => daq_streams,

      sump => hal_sump
      );

  top_ult_inst : entity ult.top_ult
    generic map (
      DUMMY => false)
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

  sump <= hal_sump xor user_sump;

end structural;
