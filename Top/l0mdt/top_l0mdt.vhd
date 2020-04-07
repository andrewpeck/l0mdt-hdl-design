library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;

library framework;
use framework.board_pkg.all;
use framework.constants_pkg.all;
use framework.system_types_pkg.all;

-- library c2c;
-- use c2c.axiRegPkg.all;


entity top_mdtl0 is
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

    clock_in_p : in std_logic;
    clock_in_n : in std_logic;

    -- FIXME: null ports are OK but partially populated ones are trouble...
    -- should only instantiate the # that are needed and do a remapping somewhere else?
    -- or some kind of dummy MGT
    mgt_tx_p : out std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_tx_n : out std_logic_vector (c_NUM_MGTS-1 downto 0);

    mgt_rx_p : in std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_rx_n : in std_logic_vector (c_NUM_MGTS-1 downto 0);

    -- LPGBT Links
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
end top_mdtl0;

architecture structural of top_mdtl0 is

  signal pipeline_clock        : std_logic;
  signal ttc_commands          : TTC_CMD_rt;
  signal tdc_hits              : TDCPOLMUX_rt_array (c_NUM_POLMUX-1 downto 0);
  signal endcap_slc_candidates : SLC_ENDCAP_rt_array (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);
  signal barrel_slc_candidates : SLC_BARREL_rt_array (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);
  signal endcap_slc_pipeline   : SLCPROC_PIPE_ENDCAP_rt_array (c_NUM_SLCPROC_ENDCAP_OUTPUTS-1 downto 0);
  signal barrel_slc_pipeline   : SLCPROC_PIPE_BARREL_rt_array (c_NUM_SLCPROC_BARREL_OUTPUTS-1 downto 0);
  signal tts_commands          : TTS_CMD_rt;
  signal daq_links             : DAQ_LINK_rt_array (c_NUM_DAQ_LINKS-1 downto 0);
  signal reset                 : std_logic;
  signal framework_sump        : std_logic;
  signal user_sump             : std_logic;

begin

  top_framework : entity framework.top_framework
    port map (
      clock_in_p            => clock_in_p,
      clock_in_n            => clock_in_n,
      refclk_i_p            => refclk_i_p,
      refclk_i_n            => refclk_i_n,
      mgt_rx_p              => mgt_rx_p,
      mgt_rx_n              => mgt_rx_n,
      mgt_tx_p              => mgt_tx_p,
      mgt_tx_n              => mgt_tx_n,
      pipeline_clock        => pipeline_clock,
      ttc_commands          => ttc_commands,
      tdc_hits              => tdc_hits,
      endcap_slc_candidates => endcap_slc_candidates,
      barrel_slc_candidates => barrel_slc_candidates,
      endcap_slc_pipeline   => endcap_slc_pipeline,
      barrel_slc_pipeline   => barrel_slc_pipeline,
      tts_commands          => tts_commands,
      daq_links             => daq_links,
      reset                 => reset,
      sump                  => framework_sump);

  top_user : entity framework.top_user
    port map (
      pipeline_clock        => pipeline_clock,
      ttc_commands          => ttc_commands,
      tdc_hits              => tdc_hits,
      endcap_slc_candidates => endcap_slc_candidates,
      barrel_slc_candidates => barrel_slc_candidates,
      endcap_slc_pipeline   => endcap_slc_pipeline,
      barrel_slc_pipeline   => barrel_slc_pipeline,
      tts_commands          => tts_commands,
      daq_links             => daq_links,
      reset                 => reset,
      sump                  => user_sump);

  sump <= framework_sump xor user_sump;

end structural;
