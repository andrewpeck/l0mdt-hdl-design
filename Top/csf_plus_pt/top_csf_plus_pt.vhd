--------------------------------------------------------------------------------
-- Title       : top_csf_plus_pt.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : top_csf_plus_Pt.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Fri Apr  3 09:25:55 2020
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  Template for a top vhdl file, with the generic variables parsed
--               by HOG
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file top_csf_plus_pt.vhd
--! @brief top_csf_plus_pt
--! @details 
--! Top file for a project with 9 CSF and 3 pT calculator modules
--! @author Davide Cieri


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
library csf_lib, pt_lib;
use csf_lib.csf_pkg.all;
use pt_lib.pt_pkg.all;

entity top_csf_plus_pt is
  Port ( 
    clk             : in std_logic;
    rst             : in std_logic;
    eof             : in std_logic;
    i_seed_BI       : in a_seeds(n_finders_per_station-1 downto 0);
    i_mdt_hit_BI    : in a_mdt_hits(n_finders_per_station-1 downto 0);
    i_seed_BM       : in a_seeds(n_finders_per_station-1 downto 0);
    i_mdt_hit_BM    : in a_mdt_hits(n_finders_per_station-1 downto 0);
    i_seed_BO       : in a_seeds(n_finders_per_station-1 downto 0);
    i_mdt_hit_BO    : in a_mdt_hits(n_finders_per_station-1 downto 0);
    o_pt_online     : out a_pt(n_finders_per_station-1 downto 0);
    o_pt_valid      : out std_logic_vector(n_finders_per_station-1 downto 0)
  );
end top_csf_plus_pt;

architecture Behavioral of top_csf_plus_pt is

    signal segs_BI, segs_BM, segs_BO : a_globalseg(n_finders_per_station-1 downto 0);

begin

    CSF_PLUS_PT: for k in n_finders_per_station-1 downto 0 generate
    begin

        -- Compact Segment Finders for Inner Layer 
        CSF_BI : entity csf_lib.top_csf
        port map(
            clk => clk,
            i_seed => i_seed_BI(k),
            i_mdt_hit => i_mdt_hit_BI(k),
            o_seg => segs_BI(k),
            i_eof => eof,
            i_rst => rst
        );

        -- Compact Segment Finders for Middle Layer 
        CSF_BM : entity csf_lib.top_csf
        port map(
            clk => clk,
            i_seed => i_seed_BM(k),
            i_mdt_hit => i_mdt_hit_BM(k),
            o_seg => segs_BM(k),
            i_eof => eof,
            i_rst => rst
        );

        -- Compact Segment Finders for Outer Layer 
        CSF_BO : entity csf_lib.top_csf
        port map(
            clk => clk,
            i_seed => i_seed_BO(k),
            i_mdt_hit => i_mdt_hit_BO(k),
            o_seg => segs_BO(k),
            i_eof => eof,
            i_rst => rst
        );
        
        -- Track Fitter
        PT : entity pt_lib.top_pt
        port map(
            clk             => clk,
            i_segment_BI    => segs_BI(k),
            i_segment_BM    => segs_BM(k),
            i_segment_BO    => segs_BO(k),
            i_rst           => rst,
            o_pt_online     => o_pt_online(k),
            o_pt_valid      => o_pt_valid(k)
        );
        
    end generate;

end Behavioral;
