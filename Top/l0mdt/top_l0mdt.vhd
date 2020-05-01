library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library ult;

library hal;
use hal.board_pkg.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;

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

  signal ttc_commands          : l0mdt_ttc_rt;
  signal tts_commands          : TTS_CMD_rt;
  signal clock_and_control     : l0mdt_control_rt;
  signal tdc_hits_inner        : TDCPOLMUX_rt_array (c_NUM_POLMUX_INNER-1 downto 0);
  signal tdc_hits_middle       : TDCPOLMUX_rt_array (c_NUM_POLMUX_MIDDLE-1 downto 0);
  signal tdc_hits_outer        : TDCPOLMUX_rt_array (c_NUM_POLMUX_OUTER-1 downto 0);
  signal endcap_slc_candidates : SLC_ENDCAP_rt_array (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);
  signal barrel_slc_candidates : SLC_BARREL_rt_array (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);
  signal endcap_slc_pipeline   : SLCPROC_PIPE_ENDCAP_rt_array (c_NUM_SLCPROC_ENDCAP_OUTPUTS-1 downto 0);
  signal barrel_slc_pipeline   : SLCPROC_PIPE_BARREL_rt_array (c_NUM_SLCPROC_BARREL_OUTPUTS-1 downto 0);
  signal daq_links             : DAQ_LINK_rt_array (c_NUM_DAQ_LINKS-1 downto 0);
  signal segments_o            : SF_RT_array (c_NUM_SF_OUTPUTS-1 downto 0);
  signal segments_i            : SF_RT_array (c_NUM_SF_INPUTS-1 downto 0);
  signal hal_sump              : std_logic;
  signal user_sump             : std_logic;
begin

  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_TDC_INPUTS=" & integer'image(c_NUM_TDC_INPUTS) severity note;
  assert false report "c_NUM_POLMUX_INNER=" & integer'image(c_NUM_POLMUX_INNER) severity note;
  assert false report "c_NUM_POLMUX_MIDDLE=" & integer'image(c_NUM_POLMUX_MIDDLE) severity note;
  assert false report "c_NUM_POLMUX_OUTER=" & integer'image(c_NUM_POLMUX_OUTER) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_LPGBT_UPLINKS=" & integer'image(c_NUM_LPGBT_UPLINKS) severity note;
  assert false report "c_NUM_LPGBT_DOWNLINKS=" & integer'image(c_NUM_LPGBT_DOWNLINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_LPGBT_EMUL_UPLINKS=" & integer'image(c_NUM_LPGBT_EMUL_UPLINKS) severity note;
  assert false report "c_NUM_LPGBT_EMUL_DOWNLINKS=" & integer'image(c_NUM_LPGBT_EMUL_DOWNLINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_FELIX_UPLINKS=" & integer'image(c_NUM_FELIX_UPLINKS) severity note;
  assert false report "c_NUM_FELIX_DOWNLINKS=" & integer'image(c_NUM_FELIX_DOWNLINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;

  top_hal : entity hal.top_hal
    port map (

      -- clock io
      clock_i_p        => clock_i_p,
      clock_i_n        => clock_i_n,
      clock_100m_i_p   => clock_100m_i_p,
      clock_100m_i_n   => clock_100m_i_n,
      lhc_refclk_o_p => lhc_refclk_o_p,
      lhc_refclk_o_n => lhc_refclk_o_n,
      refclk_i_p       => refclk_i_p,
      refclk_i_n       => refclk_i_n,

      -- clocks to user logic
      clock_and_control_o => clock_and_control,

      --  tdc data
      tdc_hits_inner  => tdc_hits_inner,
      tdc_hits_middle => tdc_hits_middle,
      tdc_hits_outer  => tdc_hits_outer,

      --
      endcap_slc_candidates => endcap_slc_candidates,
      barrel_slc_candidates => barrel_slc_candidates,

      endcap_slc_pipeline => endcap_slc_pipeline,
      barrel_slc_pipeline => barrel_slc_pipeline,

      segments_o => segments_o,
      segments_i => segments_i,

      tts_commands => tts_commands,
      daq_links    => daq_links,
      sump         => hal_sump);

  top_ult : entity ult.top_ult
    port map (
      clock_and_control     => clock_and_control,
      ttc_commands          => ttc_commands,
      tdc_hits_inner        => tdc_hits_inner,
      tdc_hits_middle       => tdc_hits_middle,
      tdc_hits_outer        => tdc_hits_outer,
      endcap_slc_candidates => endcap_slc_candidates,
      barrel_slc_candidates => barrel_slc_candidates,
      endcap_slc_pipeline   => endcap_slc_pipeline,
      barrel_slc_pipeline   => barrel_slc_pipeline,
      tts_commands          => tts_commands,
      segments_o            => segments_o,
      segments_i            => segments_i,
      daq_links             => daq_links,
      sump                  => user_sump);

  sump <= hal_sump xor user_sump;

end structural;
