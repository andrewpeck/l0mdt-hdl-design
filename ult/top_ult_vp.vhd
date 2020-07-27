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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library ult_lib;
-- use hal.system_types_pkg.all;
-- use hal.constants_pkg.all;

entity top_ult_vp is
  generic (
    DUMMY : boolean := false
    );

  port (
    -- pipeline clock
    clock_and_control             : in l0mdt_control_rt;
    -- ttc
    ttc_commands                  : in l0mdt_ttc_rt;
    -- -- TDC Hits from Polmux
    -- -- inner_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- -- middle_tdc_hits_i             : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- -- outer_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- -- extra_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    
    -- -- TDC Hits from Tar
    -- i_inner_tar_hits              : in tar2hps_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- i_middle_tar_hits             : in tar2hps_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- i_outer_tar_hits              : in tar2hps_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- i_extra_tar_hits              : in tar2hps_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- -- Sector Logic Candidates
    -- i_main_primary_slc            : in slc_rx_data_bus_avt(2 downto 0); -- is the main SL used
    -- i_main_secondary_slc          : in slc_rx_data_bus_avt(2 downto 0); -- only used in the big endcap
    -- i_plus_neighbor_slc           : in slc_rx_data_rvt;
    -- i_minus_neighbor_slc          : in slc_rx_data_rvt;
    -- -- Segments in from neighbor
    -- plus_neighbor_segments_i      : in sf2pt_avt(c_NUM_SF_INPUTS - 1 downto 0);
    -- minus_neighbor_segments_i     : in sf2pt_avt(c_NUM_SF_INPUTS - 1 downto 0);
    -- -- felix
    -- --tts_commands : out TTS_CMD_rt;
    -- -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    -- daq_streams_o                 : out felix_stream_avt (c_NUM_DAQ_STREAMS-1 downto 0);
    -- -- Segments Out to Neighbor
    -- plus_neighbor_segments_o      : out sf2pt_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    -- minus_neighbor_segments_o     : out sf2pt_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    -- -- -- MUCTPI
    -- MTC_o                         : out mtc_out_avt(c_NUM_MTC-1 downto 0);
    -- NSP_o                         : out mtc2nsp_avt(c_NUM_NSP-1 downto 0);
    -- -- AXI Control

    sump : out std_logic

    );

end entity top_ult_vp;

architecture behavioral of top_ult_vp is
  COMPONENT vio_ult
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(60 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(60 DOWNTO 0);
    probe_in2 : IN STD_LOGIC_VECTOR(58 DOWNTO 0);
    probe_in3 : IN STD_LOGIC_VECTOR(58 DOWNTO 0);
    probe_in4 : IN STD_LOGIC_VECTOR(40 DOWNTO 0);
    probe_in5 : IN STD_LOGIC_VECTOR(40 DOWNTO 0);
    probe_in6 : IN STD_LOGIC_VECTOR(40 DOWNTO 0);
    probe_in7 : IN STD_LOGIC_VECTOR(40 DOWNTO 0);
    probe_in8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out5 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out6 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out7 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out8 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out9 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out10 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out11 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out12 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out13 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out14 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out15 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out16 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out17 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out18 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out19 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out20 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out21 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out22 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out23 : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    probe_out24 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out25 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out26 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out27 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out28 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out29 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out30 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out31 : OUT STD_LOGIC_VECTOR(123 DOWNTO 0);
    probe_out32 : OUT STD_LOGIC_VECTOR(60 DOWNTO 0);
    probe_out33 : OUT STD_LOGIC_VECTOR(58 DOWNTO 0);
    probe_out34 : OUT STD_LOGIC_VECTOR(58 DOWNTO 0);
    probe_out35 : OUT STD_LOGIC_VECTOR(58 DOWNTO 0);
    probe_out36 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out37 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
  END COMPONENT;

  -- pipeline clock
  -- signal clock_and_control             : in l0mdt_control_rt;
  -- ttc
  -- signal ttc_commands                  : in l0mdt_ttc_rt;
  -- TDC Hits from Polmux
  -- inner_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  -- middle_tdc_hits_i             : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  -- outer_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  -- extra_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
  
  -- TDC Hits from Tar
  signal inner_tar_hits              : tar2hps_bus_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal middle_tar_hits             : tar2hps_bus_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal outer_tar_hits              : tar2hps_bus_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal extra_tar_hits              : tar2hps_bus_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
  -- Sector Logic Candidates
  signal main_primary_slc            : slc_rx_data_bus_avt(2 downto 0); -- is the main SL used
  signal main_secondary_slc          : slc_rx_data_bus_avt(2 downto 0); -- only used in the big endcap
  signal plus_neighbor_slc           : slc_rx_data_rvt;
  signal minus_neighbor_slc          : slc_rx_data_rvt;
  -- Segments in from neighbor
  signal plus_neighbor_segments_in      : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
  signal minus_neighbor_segments_in     : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
  -- felix
  --tts_commands : out TTS_CMD_rt;
  -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
  signal daq_streams                 : felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);
  -- Segments Out to Neighbor
  signal plus_neighbor_segments_out      : sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
  signal minus_neighbor_segments_out     : sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
  -- -- MUCTPI
  signal MTC                         : mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
  signal NSP                         : mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

 signal probe_in0   : STD_LOGIC_VECTOR(60 DOWNTO 0);
 signal probe_in1   : STD_LOGIC_VECTOR(60 DOWNTO 0);
 signal probe_in2   : STD_LOGIC_VECTOR(58 DOWNTO 0);
 signal probe_in3   : STD_LOGIC_VECTOR(58 DOWNTO 0);
 signal probe_in4   : STD_LOGIC_VECTOR(40 DOWNTO 0);
 signal probe_in5   : STD_LOGIC_VECTOR(40 DOWNTO 0);
 signal probe_in6   : STD_LOGIC_VECTOR(40 DOWNTO 0);
 signal probe_in7   : STD_LOGIC_VECTOR(40 DOWNTO 0);
 signal probe_in8   : STD_LOGIC_VECTOR(0 DOWNTO 0);
 signal probe_out0  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out1  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out2  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out3  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out4  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out5  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out6  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out7  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out8  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out9  : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out10 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out11 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out12 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out13 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out14 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out15 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out16 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out17 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out18 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out19 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out20 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out21 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out22 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out23 : STD_LOGIC_VECTOR(35 DOWNTO 0);
 signal probe_out24 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out25 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out26 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out27 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out28 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out29 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out30 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out31 : STD_LOGIC_VECTOR(123 DOWNTO 0);
 signal probe_out32 : STD_LOGIC_VECTOR(60 DOWNTO 0);
 signal probe_out33 : STD_LOGIC_VECTOR(58 DOWNTO 0);
 signal probe_out34 : STD_LOGIC_VECTOR(58 DOWNTO 0);
 signal probe_out35 : STD_LOGIC_VECTOR(58 DOWNTO 0);
 signal probe_out36 : STD_LOGIC_VECTOR(0 DOWNTO 0);
 signal probe_out37 : STD_LOGIC_VECTOR(0 DOWNTO 0);

begin

    ULT : entity ult_lib.ult
    generic map(
      DUMMY => DUMMY
    )
    port map(
      -- pipeline clock               
      clock_and_control             => clock_and_control,
      -- ttc
      ttc_commands                  => ttc_commands,
      -- TDC Hits from Polmux
      i_inner_tar_hits              => inner_tar_hits ,
      i_middle_tar_hits             => middle_tar_hits,
      i_outer_tar_hits              => outer_tar_hits ,
      i_extra_tar_hits              => extra_tar_hits ,
      -- Sector Logic Candidates
      i_main_primary_slc            => main_primary_slc  ,
      i_main_secondary_slc          => main_secondary_slc,
      i_plus_neighbor_slc           => plus_neighbor_slc ,
      i_minus_neighbor_slc          => minus_neighbor_slc,
      -- Segments in from neighbor
      plus_neighbor_segments_i      => plus_neighbor_segments_in,
      minus_neighbor_segments_i     => minus_neighbor_segments_in,
      -- felix
      --tts_commands                => tts_commands,
      -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
      daq_streams_o                 => daq_streams,
      -- Segments Out to Neighbor
      plus_neighbor_segments_o      => plus_neighbor_segments_out,
      minus_neighbor_segments_o     => minus_neighbor_segments_out,
      -- MUCTPI
      MTC_o                         => MTC,
      NSP_o                         => NSP,

      sump                          => sump
    );

    probe_in0   <= daq_streams(0); 
    -- probe_in1   <= daq_streams_o(1); 
    probe_in2   <= plus_neighbor_segments_out(0); 
    probe_in3   <= minus_neighbor_segments_out(0); 
    probe_in4   <= MTC(0);
    probe_in5   <= NSP(0); 
    probe_in6   <= NSP(1); 
    -- probe_in7   <= ; 
    -- probe_in8   <= ; 
    inner_tar_hits(0)           <= probe_out0 ; 
    inner_tar_hits(1)           <= probe_out1 ; 
    inner_tar_hits(2)           <= probe_out2 ; 
    inner_tar_hits(3)           <= probe_out3 ; 
    inner_tar_hits(4)           <= probe_out4 ; 
    inner_tar_hits(5)           <= probe_out5 ; 
    middle_tar_hits(0)          <= probe_out6 ; 
    middle_tar_hits(1)          <= probe_out7 ; 
    middle_tar_hits(2)          <= probe_out8 ; 
    middle_tar_hits(3)          <= probe_out9 ; 
    middle_tar_hits(4)          <= probe_out10; 
    middle_tar_hits(5)          <= probe_out11; 
    outer_tar_hits(0)           <= probe_out12; 
    outer_tar_hits(1)           <= probe_out13; 
    outer_tar_hits(2)           <= probe_out14; 
    outer_tar_hits(3)           <= probe_out15; 
    outer_tar_hits(4)           <= probe_out16; 
    outer_tar_hits(5)           <= probe_out17; 
    extra_tar_hits(0)           <= probe_out18; 
    extra_tar_hits(1)           <= probe_out19; 
    extra_tar_hits(2)           <= probe_out20; 
    extra_tar_hits(3)           <= probe_out21; 
    extra_tar_hits(4)           <= probe_out22; 
    extra_tar_hits(5)           <= probe_out23; 
    main_primary_slc(0)         <= probe_out24; 
    main_primary_slc(1)         <= probe_out25; 
    main_primary_slc(2)         <= probe_out26; 
    main_secondary_slc(0)       <= probe_out27; 
    main_secondary_slc(1)       <= probe_out28; 
    main_secondary_slc(2)       <= probe_out29; 
    plus_neighbor_slc           <= probe_out30; 
    minus_neighbor_slc          <= probe_out31; 
    plus_neighbor_segments_in(0)   <= probe_out32; 
    minus_neighbor_segments_in(0)  <= probe_out33; 
    -- probe_out34 <= 
    -- probe_out35 <= 
    -- probe_out36 <= 
    -- probe_out37 <= 

  VP : vio_ult
  PORT MAP (
    clk => clock_and_control.clk,
    probe_in0   => probe_in0,
    probe_in1   => probe_in1,
    probe_in2   => probe_in2,
    probe_in3   => probe_in3,
    probe_in4   => probe_in4,
    probe_in5   => probe_in5,
    probe_in6   => probe_in6,
    probe_in7   => probe_in7,
    probe_in8   => probe_in8,
    probe_out0  => probe_out0,
    probe_out1  => probe_out1,
    probe_out2  => probe_out2,
    probe_out3  => probe_out3,
    probe_out4  => probe_out4,
    probe_out5  => probe_out5,
    probe_out6  => probe_out6,
    probe_out7  => probe_out7,
    probe_out8  => probe_out8,
    probe_out9  => probe_out9,
    probe_out10 => probe_out10,
    probe_out11 => probe_out11,
    probe_out12 => probe_out12,
    probe_out13 => probe_out13,
    probe_out14 => probe_out14,
    probe_out15 => probe_out15,
    probe_out16 => probe_out16,
    probe_out17 => probe_out17,
    probe_out18 => probe_out18,
    probe_out19 => probe_out19,
    probe_out20 => probe_out20,
    probe_out21 => probe_out21,
    probe_out22 => probe_out22,
    probe_out23 => probe_out23,
    probe_out24 => probe_out24,
    probe_out25 => probe_out25,
    probe_out26 => probe_out26,
    probe_out27 => probe_out27,
    probe_out28 => probe_out28,
    probe_out29 => probe_out29,
    probe_out30 => probe_out30,
    probe_out31 => probe_out31,
    probe_out32 => probe_out32,
    probe_out33 => probe_out33,
    probe_out34 => probe_out34,
    probe_out35 => probe_out35,
    probe_out36 => probe_out36,
    probe_out37 => probe_out37
  );


end behavioral;
