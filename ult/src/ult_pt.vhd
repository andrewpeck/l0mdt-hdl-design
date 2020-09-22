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

library ptc_lib;

entity ptcalc is

  port (
    -- clock and control
    clock_and_control         : in  l0mdt_control_rt;
    ttc_commands              : in  l0mdt_ttc_rt;
    ctrl                      : in  TF_CTRL_t;
    mon                       : out TF_MON_t;
    inner_segments_i          : in  sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    middle_segments_i         : in  sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    outer_segments_i          : in  sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    extra_segments_i          : in  sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
    minus_neighbor_segments_i : in  sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
    plus_neighbor_segments_i  : in  sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_pl2pt_av                : in  pl2pt_bus_avt(c_NUM_THREADS-1 downto 0);

    o_pt2mtc : out tf2mtc_bus_avt(c_NUM_THREADS -1 downto 0));

end entity ptcalc;

architecture behavioral of ptcalc is
  signal inner_segments_sump          : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal middle_segments_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal outer_segments_sump          : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal extra_segments_sump          : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal i_pl2pt_av_sump              : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal minus_neighbor_segments_sump : std_logic_vector (c_NUM_SF_INPUTS -1 downto 0);
  signal plus_neighbor_segments_sump  : std_logic_vector (c_NUM_SF_INPUTS -1 downto 0);
begin

  tf_gen_loop : for I in 0 to c_NUM_THREADS-1 generate

    mpt : if (c_PT_TYPE = '0') generate
      pt_1 : entity ptc_lib.pt
        generic map (
          FLAVOUR => 0,
          SECTOR  => I)
        port map (
          clk         => clock_and_control.clk,
          i_segment_I => inner_segments_i(I),
          i_segment_M => middle_segments_i(I),
          i_segment_O => outer_segments_i(I),
          i_SLC       => i_pl2pt_av(I),
          i_rst       => clock_and_control.rst,
          o_mtc       => o_pt2mtc(I)
          );
    end generate;

    upt : if (c_PT_TYPE = '1') generate
      pt_1 : entity upt_lib.top_upt
        generic map (
          FLAVOUR => 0,
          SECTOR  => I)
        port map (
          clk         => clock_and_control.clk,
          i_rst       => clock_and_control.rst,
          i_segment_i => inner_segments_i(i),
          i_segment_m => middle_segments_i(i),
          i_segment_o => outer_segments_i(i),
          i_slc       => i_pl2pt_av(i),
          o_mtc       => o_pt2mtc(i)
          );
    end generate;

  end generate;


end behavioral;
