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


entity top_ptc_mpi is
    generic (
        N_FINDERS_PER_STATION : integer := 3
    );
    Port ( 
        clk            : in  std_logic;
        rst            : in  std_logic;
        i_SLCs         : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_segments_I   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_segments_M   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_segments_O   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_nsp_segs_I   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_nsp_segs_M   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_nsp_segs_O   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_nsm_segs_I   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_nsm_segs_M   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        i_nsm_segs_O   : in  std_logic_vector(N_FINDERS_PER_STATION-1 downto 0);
        o_mtcs         : out ptcalc2mtc_avt(N_FINDERS_PER_STATION-1 downto 0)
    );
end top_ptc_mpi;

architecture Behavioral of top_ptc_mpi is
    signal pt_seg_I, pt_seg_M, pt_seg_O
            : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0 )
            := (others => (others => '0'));

    signal SLCs_avt         : pl2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal segments_I_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal segments_M_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal segments_O_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal nsp_segs_I_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal nsp_segs_M_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal nsp_segs_O_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal nsm_segs_I_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal nsm_segs_M_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);
    signal nsm_segs_O_avt   : sf2ptcalc_avt(N_FINDERS_PER_STATION-1 downto 0);

    signal SLCs_art         : pl2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal segments_I_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal segments_M_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal segments_O_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal nsp_segs_I_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal nsp_segs_M_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal nsp_segs_O_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal nsm_segs_I_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal nsm_segs_M_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);
    signal nsm_segs_O_art   : sf2ptcalc_art(N_FINDERS_PER_STATION-1 downto 0);

begin
    SEL_AND_PT : for k in N_FINDERS_PER_STATION-1 downto 0 generate
        begin
            SLCs_des : entity shared_lib.vhdl_utils_deserializer generic map (width(SLCs_art(k))) port map(clk,rst,i_SLCs(k),SLCs_avt(k)); 
            segments_I_des : entity shared_lib.vhdl_utils_deserializer generic map (width(segments_I_art(k))) port map(clk,rst,i_segments_I(k),segments_I_avt(k)); 
            segments_M_des : entity shared_lib.vhdl_utils_deserializer generic map (width(segments_M_art(k))) port map(clk,rst,i_segments_M(k),segments_M_avt(k)); 
            segments_O_des : entity shared_lib.vhdl_utils_deserializer generic map (width(segments_O_art(k))) port map(clk,rst,i_segments_O(k),segments_O_avt(k)); 
            nsp_segs_I_des : entity shared_lib.vhdl_utils_deserializer generic map (width(nsp_segs_I_art(k))) port map(clk,rst,i_nsp_segs_I(k),nsp_segs_I_avt(k)); 
            nsp_segs_M_des : entity shared_lib.vhdl_utils_deserializer generic map (width(nsp_segs_M_art(k))) port map(clk,rst,i_nsp_segs_M(k),nsp_segs_M_avt(k)); 
            nsp_segs_O_des : entity shared_lib.vhdl_utils_deserializer generic map (width(nsp_segs_O_art(k))) port map(clk,rst,i_nsp_segs_O(k),nsp_segs_O_avt(k)); 
            nsm_segs_I_des : entity shared_lib.vhdl_utils_deserializer generic map (width(nsm_segs_I_art(k))) port map(clk,rst,i_nsm_segs_I(k),nsm_segs_I_avt(k)); 
            nsm_segs_M_des : entity shared_lib.vhdl_utils_deserializer generic map (width(nsm_segs_M_art(k))) port map(clk,rst,i_nsm_segs_M(k),nsm_segs_M_avt(k)); 
            nsm_segs_O_des : entity shared_lib.vhdl_utils_deserializer generic map (width(nsm_segs_O_art(k))) port map(clk,rst,i_nsm_segs_O(k),nsm_segs_O_avt(k)); 


            -- Segment Selector
            SegSel : entity ptc_lib.segment_selector
            port map (
                clk              =>  clk,
                i_seg_I          =>  segments_I_avt(k),
                i_seg_M          =>  segments_M_avt(k),
                i_seg_O          =>  segments_O_avt(k),
                i_nsp_seg_I      =>  nsp_segs_I_avt(k),
                i_nsp_seg_M      =>  nsp_segs_M_avt(k),
                i_nsp_seg_O      =>  nsp_segs_O_avt(k),
                i_nsm_seg_I      =>  nsm_segs_I_avt(k),
                i_nsm_seg_M      =>  nsm_segs_M_avt(k),
                i_nsm_seg_O      =>  nsm_segs_O_avt(k),
                o_seg_I          =>  pt_seg_I(k),
                o_seg_M          =>  pt_seg_M(k),
                o_seg_O          =>  pt_seg_O(k)
            );
            ---- pT calculation blocks
            PT : entity ptc_lib.pt
            port map(
                clk               =>  clk,
                i_segment_I       =>  pt_seg_I(k),
                i_segment_M       =>  pt_seg_M(k),
                i_segment_O       =>  pt_seg_O(k),
                i_SLC             =>  SLCs_avt(k),
                i_rst             =>  rst, 
                o_mtc             =>  o_mtcs(k)
            );
    end generate;


end Behavioral;
