--------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: User Logic Top 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library hal;
use hal.system_types_pkg.all;
use hal.constants_pkg.all;

entity top_ult is
  generic (
    DUMMY : boolean := false
    );

  port (

    -- pipeline clock
    clock_and_control             : in l0mdt_control_rt;
    -- ttc
    ttc_commands                  : in l0mdt_ttc_rt;
    -- TDC Hits from Polmux
    inner_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    middle_tdc_hits_i             : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    outer_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    extra_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- Sector Logic Candidates
    main_primary_slc_i            : in slc_rx_data_avt(c_NUM_SLC-1 downto 0); -- is the main SL used
    main_secondary_slc_i          : in slc_rx_data_avt(c_NUM_SLC-1 downto 0); -- only used in the big endcap
    plus_neighbor_slc_i           : in slc_rx_data_rvt;
    minus_neighbor_slc_i          : in slc_rx_data_rvt;
    -- Segments in from neighbor
    plus_neighbor_segments_i      : in SF_avt (c_NUM_SF_INPUTS-1 downto 0);
    minus_neighbor_segments_i     : in SF_avt (c_NUM_SF_INPUTS-1 downto 0);
    -- felix
    --tts_commands : out TTS_CMD_rt;
    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    daq_streams_o                 : out FELIX_STREAM_avt (c_NUM_DAQ_STREAMS-1 downto 0);
    -- Segments Out to Neighbor
    plus_neighbor_segments_o      : out SF_avt (c_NUM_SF_OUTPUTS-1 downto 0);
    minus_neighbor_segments_o     : out SF_avt (c_NUM_SF_OUTPUTS-1 downto 0);
    -- MUCTPI
    MTC_o                         : out MTC_avt (c_NUM_MTC-1 downto 0);
    NSP_o                         : out NSP_avt (c_NUM_NSP-1 downto 0);

    -- AXI Control

    sump : out std_logic

    );

end entity top_ult;
architecture behavioral of top_ult is

begin

    ULT : entity ult_lib.ult_lib
    generic map(
      DUMMY => DUMMY
    )
    port map(
      -- pipeline clock               
      clock_and_control             => clock_and_control,
      -- ttc
      ttc_commands                  => ttc_commands,
      -- TDC Hits from Polmux
      inner_tdc_hits_i              => inner_tdc_hits_i,
      middle_tdc_hits_i             => middle_tdc_hits_i,
      outer_tdc_hits_i              => outer_tdc_hits_i,
      extra_tdc_hits_i              => extra_tdc_hits_i,
      -- Sector Logic Candidates
      main_A_slc_i                  => main_A_slc_i,
      main_B_slc_i                  => main_B_slc_i,
      plus_neighbor_slc_i           => plus_neighbor_slc_i,
      minus_neighbor_slc_i          => minus_neighbor_slc_i,
      -- Segments in from neighbor
      plus_neighbor_segments_i      => plus_neighbor_segments_i,
      minus_neighbor_segments_i     => minus_neighbor_segments_i,
      -- felix
      --tts_commands                => tts_commands,
      -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
      daq_streams_o                 => daq_streams_o,
      -- Segments Out to Neighbor
      plus_neighbor_segments_o      => plus_neighbor_segments_o,
      minus_neighbor_segments_o     => minus_neighbor_segments_o,
      -- MUCTPI
      MTC_o                         => MTC_o,
      NSP_o                         => NSP_o,

      sump                          => sump
    )


end behavioral;
