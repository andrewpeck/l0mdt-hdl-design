--------------------------------------------------------------------------------
-- Title       : top_tf.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : top_tf.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Thu Apr 16 08:54:33 2020
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  Top file of the track fitter macro block containing
--               the segment selector, three pT calculators and
--               the muon track candidate pipeline
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file top_tf.vhd
--! @brief top_tf
--! @details
--! Top file of the track fitter macro block containing
--! the segment selector, three pT calculators and the muon track candidate
--! pipeline
--! @author Davide Cieri

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real.all;

library shared_lib;
  use shared_lib.common_ieee_pkg.all;
  use shared_lib.l0mdt_constants_pkg.all;
  use shared_lib.l0mdt_dataformats_pkg.all;
  use shared_lib.common_constants_pkg.all;
  use shared_lib.common_types_pkg.all;

library ptc_lib;
  use ptc_lib.pt_pkg.all;

library ctrl_lib;
  use ctrl_lib.tf_ctrl.all;

entity top_ptc_mpi is
  generic (
    num_threads      : integer := 3
  );
  port (
    clk          : in    std_logic;
    rst          : in    std_logic;
    glob_en      : in    std_logic;
    i_ctrl_v     : in    std_logic_vector(TF_CTRL_T'w - 1 downto 0);
    o_mon_v      : out   std_logic_vector(TF_MON_T'w - 1 downto 0);
    i_slcs       : in    pl2ptcalc_avt(num_threads - 1 downto 0);
    i_segments_i : in    sf2ptcalc_avt(num_threads - 1 downto 0);
    i_segments_m : in    sf2ptcalc_avt(num_threads - 1 downto 0);
    i_segments_o : in    sf2ptcalc_avt(num_threads - 1 downto 0);
    i_nsp_segs   : in    sf2ptcalc_vt;
    i_nsm_segs   : in    sf2ptcalc_vt;
    o_mtcs       : out   ptcalc2mtc_avt(num_threads - 1 downto 0)
  );
end entity top_ptc_mpi;

architecture behavioral of top_ptc_mpi is

  signal pt_seg_i : sf2ptcalc_avt(num_threads - 1 downto 0);
  signal pt_seg_m : sf2ptcalc_avt(num_threads - 1 downto 0);
  signal pt_seg_o : sf2ptcalc_avt(num_threads - 1 downto 0);

  signal ctrl_t : TF_CTRL_T;
  signal mon_t  : TF_MON_T;

  signal local_en  : std_logic;
  signal local_rst : std_logic;

begin

  ctrl_t  <= convert(i_ctrl_v, ctrl_t);
  o_mon_v <= convert(mon_t, o_mon_v);

  sel_and_pt : for k in num_threads - 1 downto 0 generate
  begin
    -- Supervisor
    supervisor : entity ptc_lib.pt_supervisor
      port map (
        clk         => clk,
        rst         => rst,
        glob_en     => glob_en,
        i_actions   => ctrl_t,
        o_status    => mon_t,
        o_local_en  => local_en,
        o_local_rst => local_rst
      );

    -- Segment Selector
    segsel : entity ptc_lib.segment_selector
      port map (
        clk       => clk,
        i_seg_i   => i_segments_i(k),
        i_seg_m   => i_segments_m(k),
        i_seg_o   => i_segments_o(k),
        i_nsp_seg => i_nsp_segs,
        i_nsm_seg => i_nsm_segs,
        o_seg_i   => pt_seg_i(k),
        o_seg_m   => pt_seg_m(k),
        o_seg_o   => pt_seg_o(k)
      );

    ---- pT calculation blocks
    pt : entity ptc_lib.pt
      port map (
        clk         => clk,
        i_segment_i => pt_seg_i(k),
        i_segment_m => pt_seg_m(k),
        i_segment_o => pt_seg_o(k),
        i_slc       => i_slcs(k),
        i_rst       => local_rst,
        o_mtc       => o_mtcs(k)
      );

  end generate sel_and_pt;

end architecture behavioral;
