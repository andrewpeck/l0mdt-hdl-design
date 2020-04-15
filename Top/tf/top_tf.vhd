--------------------------------------------------------------------------------
-- Title       : top_tf.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : top_tf.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Wed Apr 15 09:37:33 2020
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

library IEEE, csf_lib, pt_lib, dataformats;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use csf_lib.csf_pkg.all;
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
        i_SLCs          : in  a_slc(n_finders_per_station-1 downto 0);
        i_SLC_pip       : in  a_slc(n_slc_pipeline);
        i_segments_BI   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_segments_BM   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_segments_BO   : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsp_BI        : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsp_BM        : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsp_BO        : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsm_BI        : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsm_BM        : in  a_globalseg(n_finders_per_station-1 downto 0);
        i_nsm_BO        : in  a_globalseg(n_finders_per_station-1 downto 0);
        o_mtc           : out a_mtc(n_finders_per_station-1 downto 0);
        o_SLC_pip       : out a_slc(n_slc_pipeline);
    );
end top_tf;

architecture Behavioral of top_tf is

begin

    --CSF_PLUS_PT: for k in n_finders_per_station-1 downto 0 generate
    --begin

    --    -- Compact Segment Finders for Inner Layer 
    --    CSF_BI : entity csf_lib.top_csf
    --    port map(
    --        clk => clk,
    --        i_seed => i_seed_BI(k),
    --        i_mdt_hit => i_mdt_hit_BI(k),
    --        o_seg => segs_BI(k),
    --        i_eof => eof,
    --        i_rst => rst
    --    );

    --    -- Compact Segment Finders for Middle Layer 
    --    CSF_BM : entity csf_lib.top_csf
    --    port map(
    --        clk => clk,
    --        i_seed => i_seed_BM(k),
    --        i_mdt_hit => i_mdt_hit_BM(k),
    --        o_seg => segs_BM(k),
    --        i_eof => eof,
    --        i_rst => rst
    --    );

    --    -- Compact Segment Finders for Outer Layer 
    --    CSF_BO : entity csf_lib.top_csf
    --    port map(
    --        clk => clk,
    --        i_seed => i_seed_BO(k),
    --        i_mdt_hit => i_mdt_hit_BO(k),
    --        o_seg => segs_BO(k),
    --        i_eof => eof,
    --        i_rst => rst
    --    );
        
    --    -- Track Fitter
    --    PT : entity pt_lib.top_pt
    --    port map(
    --        clk             => clk,
    --        i_segment_BI    => segs_BI(k),
    --        i_segment_BM    => segs_BM(k),
    --        i_segment_BO    => segs_BO(k),
    --        i_rst           => rst,
    --        o_pt_online     => o_pt_online(k),
    --        o_pt_valid      => o_pt_valid(k)
    --    );
        
    --end generate;

end Behavioral;
