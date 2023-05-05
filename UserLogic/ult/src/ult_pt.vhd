--------------------------------------------------------------------------------
-- UMass , Physics Department
-- File: ult_pt.vhd
-- Project: src
-- -----
-- File Created: Monday, 12th July 2021 12:20:43 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 16th November 2021 3:59:26 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
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
  use ctrl_lib.tf_ctrl.all;

library ptc_lib;

library upt_lib;

entity ptcalc is
  port (
    -- clock and control
    clock_and_control         : in    l0mdt_control_rt;
    ttc_commands              : in    l0mdt_ttc_rt;
    ctrl_v                    : in    std_logic_vector; --  : in  TF_CTRL_t;
    mon_v                     : out   std_logic_vector; -- : out TF_MON_t;
    i_inn_segments            : in    sf2ptcalc_avt(c_NUM_THREADS - 1 downto 0);
    i_mid_segments            : in    sf2ptcalc_avt(c_NUM_THREADS - 1 downto 0);
    i_out_segments            : in    sf2ptcalc_avt(c_NUM_THREADS - 1 downto 0);
    i_ext_segments            : in    sf2ptcalc_avt(c_NUM_THREADS - 1 downto 0);
    i_minus_neighbor_segments : in    sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_plus_neighbor_segments  : in    sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_pl2pt_av                : in    pl2ptcalc_avt(c_NUM_THREADS - 1 downto 0);

    o_pt2mtc : out   ptcalc2mtc_avt(c_NUM_THREADS - 1 downto 0);

    o_sump : out   std_logic
  );
end entity ptcalc;

architecture behavioral of ptcalc is

  -- signal inner_segments_sump          : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- signal middle_segments_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- signal outer_segments_sump          : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- signal extra_segments_sump          : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- signal i_pl2pt_av_sump              : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- signal minus_neighbor_segments_sump : std_logic_vector (c_NUM_SF_INPUTS -1 downto 0);
  -- signal plus_neighbor_segments_sump  : std_logic_vector (c_NUM_SF_INPUTS -1 downto 0);
  signal glob_en : std_logic;

begin

  glob_en <= '1';
  -- mon_v <=

  pt_en : if c_PT_ENABLED = '1' generate

    pt_type : if (c_PT_TYPE = '0') generate

      mpt : entity ptc_lib.top_ptc_mpi
        generic map (
          num_threads      => c_NUM_THREADS,
          mdttp_neighbours => c_NUM_SF_INPUTS
        )
        port map (
          clk          => clock_and_control.clk,
          rst          => clock_and_control.rst,
          glob_en      => glob_en,
          i_ctrl_v     => ctrl_v,
          o_mon_v      => mon_v,
          i_slcs       => i_pl2pt_av,
          i_segments_i => i_inn_segments,
          i_segments_m => i_mid_segments,
          i_segments_o => i_out_segments,
          i_nsp_segs   => i_plus_neighbor_segments,
          i_nsm_segs   => i_minus_neighbor_segments,
          o_mtcs       => o_pt2mtc
        );

    else generate

      upt_loop : for I in 0 to c_NUM_THREADS - 1 generate

        upt : entity upt_lib.top_upt
          --  generic map (
          --    FLAVOUR => 0,
          --    SECTOR  => I)
          port map (
            clk         => clock_and_control.clk,
            i_rst       => clock_and_control.rst,
            i_segment_i => i_inn_segments(I),
            i_segment_m => i_mid_segments(I),
            i_segment_o => i_out_segments(I),
            i_slc       => i_pl2pt_av(I),
            o_mtc       => o_pt2mtc(I)
          );

      end generate upt_loop;

    end generate pt_type;

  else generate
    signal inn_segments_sump            : std_logic_vector(c_NUM_THREADS - 1 downto 0);
    signal mid_segments_sump            : std_logic_vector(c_NUM_THREADS - 1 downto 0);
    signal out_segments_sump            : std_logic_vector(c_NUM_THREADS - 1 downto 0);
    signal ext_segments_sump            : std_logic_vector(c_NUM_THREADS - 1 downto 0);
    signal minus_neighbor_segments_sump : std_logic_vector(c_NUM_SF_INPUTS - 1 downto 0);
    signal plus_neighbor_segments_sump  : std_logic_vector(c_NUM_SF_INPUTS - 1 downto 0);
    signal pl2pt_sump                   : std_logic_vector(c_NUM_THREADS - 1 downto 0);
    signal l0mdt_ttc_v                  : l0mdt_ttc_vt;
    signal l0mdt_control_v              : l0mdt_control_vt;
  begin
    l0mdt_ttc_v     <= convert(ttc_commands, l0mdt_ttc_v);
    l0mdt_control_v <= convert(clock_and_control, l0mdt_control_v);
    o_pt2mtc        <= (others => (others => '0'));

    sump_proc : process (clock_and_control.clk) is
    begin                                                                                  -- process tdc_hit_sump_proc

      if (rising_edge(clock_and_control.clk)) then                                     -- rising clock edge

        inn_loop : for I in 0 to c_NUM_THREADS - 1 loop

          inn_segments_sump(I) <= xor_reduce(i_inn_segments(I));

        end loop;

        mid_loop : for I in 0 to c_NUM_THREADS - 1 loop

          mid_segments_sump(I) <= xor_reduce(i_mid_segments(I));

        end loop;

        out_loop : for I in 0 to c_NUM_THREADS - 1 loop

          out_segments_sump(I) <= xor_reduce(i_out_segments(I));

        end loop;

        ext_loop : for I in 0 to c_NUM_THREADS - 1 loop

          ext_segments_sump(I) <= xor_reduce(i_ext_segments(I));

        end loop;

        minus_loop : for I in 0 to c_NUM_SF_INPUTS - 1 loop

          minus_neighbor_segments_sump(I) <= xor_reduce(i_minus_neighbor_segments(I));

        end loop;

        plus_loop : for I in 0 to c_NUM_SF_INPUTS - 1 loop

          plus_neighbor_segments_sump(I) <= xor_reduce(i_plus_neighbor_segments(I));

        end loop;

        pl_loop : for I in 0 to c_NUM_THREADS - 1 loop

          pl2pt_sump(I) <= xor_reduce(i_pl2pt_av(I));

        end loop;

        o_sump <= xor_reduce(inn_segments_sump)
                  xor xor_reduce(mid_segments_sump)
                  xor xor_reduce(out_segments_sump)
                  xor xor_reduce(ext_segments_sump)
                  xor xor_reduce(minus_neighbor_segments_sump)
                  xor xor_reduce(plus_neighbor_segments_sump)
                  xor xor_reduce(pl2pt_sump)
                  xor xor_reduce(l0mdt_ttc_v) xor xor_reduce(l0mdt_control_v);
      end if;

    end process sump_proc;

  end generate pt_en;

end architecture behavioral;
