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

library ptc_lib;
use ptc_lib.pt_pkg.all;
use ptc_lib.pt_params_pkg.all;

-- library IEEE, pt_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use pt_lib.pt_pkg.all;

entity segment_selector is
    port (
        clk               : in std_logic;
        i_seg_I          : in  sf2ptcalc_rvt;
        i_seg_M          : in  sf2ptcalc_rvt;
        i_seg_O          : in  sf2ptcalc_rvt;
        i_nsp_seg_I      : in  sf2ptcalc_rvt;
        i_nsp_seg_M      : in  sf2ptcalc_rvt;
        i_nsp_seg_O      : in  sf2ptcalc_rvt;
        i_nsm_seg_I      : in  sf2ptcalc_rvt;
        i_nsm_seg_M      : in  sf2ptcalc_rvt;
        i_nsm_seg_O      : in  sf2ptcalc_rvt;
        o_seg_I          : out sf2ptcalc_rvt;
        o_seg_M          : out sf2ptcalc_rvt;
        o_seg_O          : out sf2ptcalc_rvt
    );
end segment_selector; -- segment_selector

architecture Behavioral of segment_selector is

    function select_segment ( 
        seg0 : sf2ptcalc_rt; 
        seg1 : sf2ptcalc_rt; 
        seg2 : sf2ptcalc_rt
    ) return sf2ptcalc_rt is
        variable outseg : sf2ptcalc_rt;
    begin
        if seg0.data_valid = '1' then
            outseg := seg0;
        elsif seg1.data_valid = '1' then
            outseg := seg1;
        elsif seg2.data_valid = '1' then
            outseg := seg2;
        end if;
        return nullify(outseg);
    end function select_segment;

    signal seg_I, seg_M, seg_O, 
           nsp_seg_I, nsp_seg_M, nsp_seg_O, 
           nsm_seg_I, nsm_seg_M, nsm_seg_O : sf2ptcalc_rt;
    signal outseg_I, outseg_M, outseg_O : sf2ptcalc_rt;

begin
    seg_I <= structify(i_seg_I);
    seg_M <= structify(i_seg_M);
    seg_O <= structify(i_seg_O);
    nsm_seg_I <= structify(i_nsm_seg_I);
    nsm_seg_M <= structify(i_nsm_seg_M);
    nsm_seg_O <= structify(i_nsm_seg_O);
    nsp_seg_I <= structify(i_nsp_seg_I);
    nsp_seg_M <= structify(i_nsp_seg_M);
    nsp_seg_O <= structify(i_nsp_seg_O);

    o_seg_I <= vectorify(outseg_I);
    o_seg_M <= vectorify(outseg_M);
    o_seg_O <= vectorify(outseg_O);

    SelProc : process( clk )
        begin
        if rising_edge(clk) then
            -- Clock 0
            outseg_I <= select_segment(seg_I, nsp_seg_I, nsm_seg_I);
            outseg_M <= select_segment(seg_M, nsp_seg_M, nsm_seg_M);
            outseg_O <= select_segment(seg_O, nsp_seg_O, nsm_seg_O);
        end if ;
    end process ; -- SagittaProc



end Behavioral;