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

library tf_lib;
use tf_lib.pt_pkg.all;


entity top_tf1 is
    generic (
        N_FINDERS_PER_STATION : integer := 3
    );
    Port ( 
        clk            : in  std_logic;
        rst            : in  std_logic;
        i_SLCs         : in  pl2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_segments_I   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_segments_M   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_segments_O   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_nsp_segs_I   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_nsp_segs_M   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_nsp_segs_O   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_nsm_segs_I   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_nsm_segs_M   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        i_nsm_segs_O   : in  sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0);
        o_mtcs         : out tf2mtc_bus_avt(N_FINDERS_PER_STATION-1 downto 0)
    );
end top_tf1;

architecture Behavioral of top_tf1 is
    signal pt_seg_I, pt_seg_M, pt_seg_O
            : sf2pt_bus_avt(N_FINDERS_PER_STATION-1 downto 0 )
            := (others => (others => '0'));

begin
    SEL_AND_PT : for k in N_FINDERS_PER_STATION-1 downto 0 generate
        begin
            -- Segment Selector
            SegSel : entity tf_lib.segment_selector
            port map (
                clk              =>  clk,
                i_seg_I          =>  i_segments_I(k),
                i_seg_M          =>  i_segments_M(k),
                i_seg_O          =>  i_segments_O(k),
                i_nsp_seg_I      =>  i_nsp_segs_I(k),
                i_nsp_seg_M      =>  i_nsp_segs_M(k),
                i_nsp_seg_O      =>  i_nsp_segs_O(k),
                i_nsm_seg_I      =>  i_nsm_segs_I(k),
                i_nsm_seg_M      =>  i_nsm_segs_M(k),
                i_nsm_seg_O      =>  i_nsm_segs_O(k),
                o_seg_I          =>  pt_seg_I(k),
                o_seg_M          =>  pt_seg_M(k),
                o_seg_O          =>  pt_seg_O(k)
            );
            ---- pT calculation blocks
            PT : entity tf_lib.pt
            port map(
                clk               =>  clk,
                i_segment_I       =>  pt_seg_I(k),
                i_segment_M       =>  pt_seg_M(k),
                i_segment_O       =>  pt_seg_O(k),
                i_SLC             =>  i_SLCs(k),
                i_rst             =>  rst, 
                o_mtc             =>  o_mtcs(k)
            );
    end generate;


end Behavioral;
