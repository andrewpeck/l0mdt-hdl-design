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

-- library ctrl_lib;
-- use ctrl_lib.DAQ_CTRL.all;

entity daq is

  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  DAQ_CTRL_t;
    -- mon               : out DAQ_MON_t;

    i_inner_tdc_hits  : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tdc_hits : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tdc_hits  : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tdc_hits  : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    daq_streams_o     : out felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0)
    );

end entity daq;

architecture behavioral of daq is
  signal ptcalc_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal pl2mtc_sump         : std_logic_vector (c_MAX_NUM_SL -1 downto 0);
  signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
  signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
begin

  sump_proc : process (clock_and_control.clk) is
  begin  -- process tdc_hit_sump_proc
    if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

      inner_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_INN-1 loop
        tdc_hit_inner_sump(I) <= xor_reduce(i_inner_tdc_hits(I));
      end loop;
      middle_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_MID-1 loop
        tdc_hit_middle_sump(I) <= xor_reduce(i_middle_tdc_hits(I));
      end loop;
      outer_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_OUT-1 loop
        tdc_hit_outer_sump(I) <= xor_reduce(i_outer_tdc_hits(I));
      end loop;
      extra_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_EXT-1 loop
        tdc_hit_extra_sump(I) <= xor_reduce(i_extra_tdc_hits(I));
      end loop;


      daq_streams_o_loop : for I in 0 to c_NUM_DAQ_STREAMS-1 loop
        daq_streams_o(I) <= (others => (xor_reduce(tdc_hit_inner_sump) xor
                                        xor_reduce(tdc_hit_middle_sump) xor
                                        xor_reduce(tdc_hit_outer_sump) xor
                                        xor_reduce(tdc_hit_extra_sump)));
      end loop;
    end if;
  end process;

end behavioral;
