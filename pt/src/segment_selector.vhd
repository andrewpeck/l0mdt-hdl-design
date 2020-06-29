--------------------------------------------------------------------------------
-- Title       : segment_selector.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : segment_selector.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Wed Apr 15 09:59:28 2020
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  Module that selects the MDT segments to be transmitted to 
--               the pT calculation block 
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file segment_selector.vhd
--! @brief segment_selector
--! @details 
--! Module that selects the MDT segments to be transmitted to 
--  the pT calculation block
--! pipeline
--! @author Davide cieri
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- library shared_lib;
-- use shared_lib.config_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.common_constants_pkg.all;
library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library pt_lib;
use pt_lib.pt_pkg.all;
use pt_lib.pt_params_pkg.all;

-- library IEEE, pt_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use pt_lib.pt_pkg.all;

entity segment_selector is
    port (
        clk               : in std_logic;
        i_seg_BI          : in  t_globalseg;
        i_seg_BM          : in  t_globalseg;
        i_seg_BO          : in  t_globalseg;
        i_nsp_seg_BI      : in  t_globalseg;
        i_nsp_seg_BM      : in  t_globalseg;
        i_nsp_seg_BO      : in  t_globalseg;
        i_nsm_seg_BI      : in  t_globalseg;
        i_nsm_seg_BM      : in  t_globalseg;
        i_nsm_seg_BO      : in  t_globalseg;
        o_seg_BI          : out t_globalseg;
        o_seg_BM          : out t_globalseg;
        o_seg_BO          : out t_globalseg
    );
end segment_selector; -- segment_selector

architecture Behavioral of segment_selector is

    function select_segment ( 
        seg0 : t_globalseg; 
        seg1 : t_globalseg; 
        seg2 : t_globalseg
    ) return t_globalseg is
        variable outseg : t_globalseg := null_globalseg;
    begin
        if seg0.valid = '1' then
            outseg := seg0;
        elsif seg1.valid = '1' then
            outseg := seg1;
        elsif seg2.valid = '1' then
            outseg := seg2;
        end if;
        return outseg;
    end function select_segment;

begin
    
    SelProc : process( clk )
        begin
        if rising_edge(clk) then
            -- Clock 0
            o_seg_BI <= select_segment(i_seg_BI, i_nsp_seg_BI, i_nsm_seg_BI);
            o_seg_BM <= select_segment(i_seg_BM, i_nsp_seg_BM, i_nsm_seg_BM);
            o_seg_BO <= select_segment(i_seg_BO, i_nsp_seg_BO, i_nsm_seg_BO);
        end if ;
    end process ; -- SagittaProc



end Behavioral;