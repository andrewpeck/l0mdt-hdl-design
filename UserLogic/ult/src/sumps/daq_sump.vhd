--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager Sump
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
 
library ctrl_lib;
use ctrl_lib.DAQ_CTRL.all;

entity daq_sump is
  port (
    -- clock and control
    -- clock_and_control : in  l0mdt_control_rt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  H2S_CTRL_t;
    -- mon               : out H2S_MON_t;

    i_inn_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mid_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_out_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_ext_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- o_daq_streams     : out felix_data_avt (4-1 downto 0);
    -- o_daq_streams     : out felix_stream_avt (c_HPS_NUM_MDT_CH_INN     
    --                                               + c_HPS_NUM_MDT_CH_MID   
    --                                               + c_HPS_NUM_MDT_CH_OUT - 1 downto 0);
    -- o_daq_streams     : out felix_stream_avt(c_NUM_DAQ_STREAMS-1 downto 0);
    -- o_daq_streams     : out felix_stream_avt(c_DAQ_LINKS-1 downto 0);
    
    o_daq_stream_data_v : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
    o_daq_stream_ctrl_v : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
    o_daq_stream_wren_v : out std_logic_vector(c_DAQ_LINKS-1 downto 0);

    o_sump : out std_logic
  );
  
end entity daq_sump;

architecture beh of daq_sump is

  signal inn_tdc_hits_av : std_logic_vector(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal mid_tdc_hits_av : std_logic_vector(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal out_tdc_hits_av : std_logic_vector(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal ext_tdc_hits_av : std_logic_vector(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

begin

  -- o_daq_streams <= (others => (others => '0'));
  -- o_minus_neighbor_segments <= (others => (others => '0'));

  MDT_INN_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_INN -1 generate
    inn_tdc_hits_av(I) <= xor_reduce(i_inn_tdc_hits_av(I));
  end generate;
  MDT_MID_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_MID -1 generate
    mid_tdc_hits_av(I) <= xor_reduce(i_mid_tdc_hits_av(I));
  end generate;
  MDT_OUT_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_OUT -1 generate
    out_tdc_hits_av(I) <= xor_reduce(i_out_tdc_hits_av(I));
  end generate;
  MDT_EXT_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_EXT -1 generate
    ext_tdc_hits_av(I) <= xor_reduce(i_ext_tdc_hits_av(I));
  end generate;
  
  o_sump <=   xor_reduce(inn_tdc_hits_av)
          xor xor_reduce(mid_tdc_hits_av)
          xor xor_reduce(out_tdc_hits_av)
          xor xor_reduce(ext_tdc_hits_av);
  
end architecture beh;

  --   -- signal ptcalc_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  --   -- signal pl2mtc_sump         : std_logic_vector (c_MAX_NUM_SL -1 downto 0);
  --   signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  --   signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
  --   signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  --   signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_EXT-1 downto 0);
  --   signal sump_v : std_logic_vector(c_NUM_DAQ_STREAMS - 1 downto 0);
  --   signal l0mdt_ttc_v  : l0mdt_ttc_vt;
  --   signal l0mdt_control_v  : l0mdt_control_vt;
  -- begin
  --   l0mdt_ttc_v <= convert(ttc_commands);
  --   l0mdt_control_v <= convert(clock_and_control);
  --   sump_proc : process (clock_and_control.clk) is

  --   begin  -- process tdc_hit_sump_proc
  --     if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

  --       inner_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_INN-1 loop
  --         tdc_hit_inner_sump(I) <= xor_reduce(i_inn_tdc_hits(I));
  --       end loop;
  --       middle_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_MID-1 loop
  --         tdc_hit_middle_sump(I) <= xor_reduce(i_mid_tdc_hits(I));
  --       end loop;
  --       outer_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_OUT-1 loop
  --         tdc_hit_outer_sump(I) <= xor_reduce(i_out_tdc_hits(I));
  --       end loop;
  --       extra_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_EXT-1 loop
  --         tdc_hit_extra_sump(I) <= xor_reduce(i_ext_tdc_hits(I));
  --       end loop;


  --       daq_streams_o_loop : for I in 0 to c_NUM_DAQ_STREAMS-1 loop
  --         daq_streams_o(I) <= (others => (xor_reduce(tdc_hit_inner_sump) xor
  --                                         xor_reduce(tdc_hit_middle_sump) xor
  --                                         xor_reduce(tdc_hit_outer_sump) xor
  --                                         xor_reduce(tdc_hit_extra_sump)));

  --         -- sump_loop : for J in 0 to FELIX_STREAM_LEN-1 loop
  --           sump_v(I) <= xor_reduce(daq_streams_o(I)) ;
  --         -- end loop;

  --       end loop;

  --       o_sump <= xor_reduce(sump_v) xor xor_reduce(l0mdt_ttc_v) xor xor_reduce(l0mdt_control_v);
        

  --     end if;
  --   end process;
