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

library ctrl_lib;
  use ctrl_lib.tf_ctrl.all;

entity top_ptc_mpi is
  generic (
    num_threads      : integer := 3;
    mdttp_neighbours : integer := 0
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
    i_nsp_segs   : in    sf2ptcalc_avt(mdttp_neighbours - 1 downto 0);
    i_nsm_segs   : in    sf2ptcalc_avt(mdttp_neighbours - 1 downto 0);
    o_mtcs       : out   ptcalc2mtc_avt(num_threads - 1 downto 0)
  );
end entity top_ptc_mpi;

architecture behavioral of top_ptc_mpi is

begin

end architecture behavioral;
