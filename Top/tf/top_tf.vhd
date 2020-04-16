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

library IEEE, pt_lib, dataformats;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use pt_lib.pt_pkg.all;
use dataformats.mdttp_types_pkg.all;

entity top_tf is
    generic (
        n_finders_per_station : integer := 3;
        n_slc_pipeline        : integer := 5;
        n_clk_pipeline        : integer := 20
    );
    Port ( 
        clk             : in  std_logic;
        rst             : in  std_logic;
        i_dv_SLCs       : in  std_logic_vector(n_finders_per_station-1 downto 0);
        i_SLCs          : in  a_slc(n_finders_per_station-1 downto 0);
        i_SLC_pip       : in  a_slc(n_slc_pipeline-1 downto 0);
        i_dv_SLC_pip    : in  std_logic_vector(n_finders_per_station-1 downto 0);
        i_segments_BI   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_segments_BM   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_segments_BO   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsp_segs_BI   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsp_segs_BM   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsp_segs_BO   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsm_segs_BI   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsm_segs_BM   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsm_segs_BO   : in  a_globalseg(n_finders_per_station-1 downto 0);
        --o_mtc           : out a_mtc(n_finders_per_station-1 downto 0);
        o_pt_online     : out a_pt(n_finders_per_station-1 downto 0);
        o_pt_valid      : out std_logic_vector(n_finders_per_station-1 downto 0);
        o_SLC_pip       : out a_slc(n_slc_pipeline-1 downto 0)
    );
end top_tf;

architecture Behavioral of top_tf is
    signal pt_seg_BI, pt_seg_BM, pt_seg_BO 
            : a_globalseg(n_finders_per_station-1 downto 0 )
            := (others => null_globalseg);

    signal start_count : std_logic := '0';
    signal counter : integer := 0;

    type a2_slc is array(natural range <> ) of a_slc(n_slc_pipeline-1 downto 0);
    signal slc_pip_2 : a2_slc(n_clk_pipeline-1 downto 0);

begin
    SEL_AND_PT : for k in n_finders_per_station-1 downto 0 generate
        begin
            -- Segment Selector
            SegSel : entity pt_lib.segment_selector
            port map (
                clk               =>  clk,
                i_seg_BI          =>  i_segments_BI(k),
                i_seg_BM          =>  i_segments_BM(k),
                i_seg_BO          =>  i_segments_BO(k),
                i_nsp_seg_BI      =>  i_nsp_segs_BI(k),
                i_nsp_seg_BM      =>  i_nsp_segs_BM(k),
                i_nsp_seg_BO      =>  i_nsp_segs_BO(k),
                i_nsm_seg_BI      =>  i_nsm_segs_BI(k),
                i_nsm_seg_BM      =>  i_nsm_segs_BM(k),
                i_nsm_seg_BO      =>  i_nsm_segs_BO(k),
                o_seg_BI          =>  pt_seg_BI(k),
                o_seg_BM          =>  pt_seg_BM(k),
                o_seg_BO          =>  pt_seg_BO(k)
            );
            -- pT calculation blocks
            PT : entity pt_lib.top_pt
            port map(
                clk               =>  clk,
                i_segment_BI      =>  pt_seg_BI(k),
                i_segment_BM      =>  pt_seg_BM(k),
                i_segment_BO      =>  pt_seg_BO(k),
                i_dv_SLC          =>  i_dv_SLCs(k),
                i_SLC             =>  i_SLCs(k),
                i_rst             =>  rst,
                o_pt_online       =>  o_pt_online(k),
                o_pt_valid        =>  o_pt_valid(k)
            );
    end generate;

    PIP_CANDS : for i in 0 to n_slc_pipeline-1 generate
        slc_pip_2(0)(i) <= i_SLC_pip(i);
        PIP_CLKS : for k in 0 to n_clk_pipeline-2 generate
            slc_pip_2(k+1)(i) <= slc_pip_2(k)(i);
        end generate;
        o_SLC_pip(i) <= slc_pip_2(n_clk_pipeline-1)(i);
    end generate;

end Behavioral;
