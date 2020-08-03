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
use ctrl_lib.TF_CTRL.all;

entity track_fitting is

  port (
    -- clock and control
    clock_and_control         : in  l0mdt_control_rt;
    ttc_commands              : in  l0mdt_ttc_rt;
    ctrl                      : in  TF_CTRL_t;
    mon                       : out TF_MON_t;
    inner_segments_i          : in sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    middle_segments_i         : in sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    outer_segments_i          : in sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    extra_segments_i          : in sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    minus_neighbor_segments_i : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
    plus_neighbor_segments_i  : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_pl2pt_av                : in pl2pt_bus_avt(c_NUM_THREADS-1 downto 0);

    o_pt2mtc : out tf2mtc_bus_avt(c_NUM_THREADS -1 downto 0));

end entity track_fitting;

architecture behavioral of track_fitting is
  signal inner_segments_sump       : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal middle_segments_sump      : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal outer_segments_sump       : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal extra_segments_sump       : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal i_pl2pt_av_sump           : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal minus_neighbor_segments_sump : std_logic_vector (c_NUM_SF_INPUTS -1 downto 0);
  signal plus_neighbor_segments_sump  : std_logic_vector (c_NUM_SF_INPUTS -1 downto 0);
begin

  sump_proc : process (clock_and_control.clk) is
  begin  -- process tdc_hit_sump_proc
    if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

      segsump_loop : for I in 0 to c_NUM_THREADS-1 loop
        inner_segments_sump(I)  <= xor_reduce(inner_segments_i(I));
        middle_segments_sump(I) <= xor_reduce(middle_segments_i(I));
        outer_segments_sump(I)  <= xor_reduce(outer_segments_i(I));
        extra_segments_sump(I)  <= xor_reduce(extra_segments_i(I));
        i_pl2pt_av_sump(I)      <= xor_reduce(i_pl2pt_av(I));
      end loop;

      neighbor_loop : for I in 0 to c_NUM_SF_INPUTS-1 loop
        minus_neighbor_segments_sump(I) <= xor_reduce(minus_neighbor_segments_i(I));
        plus_neighbor_segments_sump(I)  <= xor_reduce(plus_neighbor_segments_i(I));
      end loop;

      o_mtc_loop : for I in 0 to c_NUM_THREADS-1 loop
        o_pt2mtc(I) <= (others =>
                        inner_segments_sump(I)   xor
                        middle_segments_sump(I)  xor
                        outer_segments_sump(I)   xor
                        extra_segments_sump(I)   xor
                        i_pl2pt_av_sump(I)       xor
                        xor_reduce(minus_neighbor_segments_sump) xor
                        xor_reduce(plus_neighbor_segments_sump )
                        );
      end loop;
    end if;
  end process;

end behavioral;
