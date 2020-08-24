--------------------------------------------------------------------------------
-- Title       : top_pt.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : top_pt.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Fri May 29 15:12:46 2020
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  pT calculator top module
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file top_pt.vhd
--! @brief top_pt
--! @details
--! pT calculator top module
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
use shared_lib.config_pkg.all;

library tf_lib;
use tf_lib.pt_pkg.all;
use tf_lib.pt_params_pkg.all;

entity top_pt is
    generic(
        FLAVOUR : integer := 0; -- Barrel
        SECTOR  : integer := 3
    );
    Port (
        clk : in std_logic;
        i_segment_I  : in sf_seg_data_barrel_rvt;
        i_segment_M  : in sf_seg_data_barrel_rvt;
        i_segment_O  : in sf_seg_data_barrel_rvt;
        i_SLC        : in pl2pt_rvt;
        i_rst        : in std_logic;
        o_mtc        : out tf2mtc_rvt
    );
end top_pt;

architecture Behavioral of top_pt is

begin

  PT : entity tf_lib.pt
    generic map (
        FLAVOUR       => FLAVOUR,
        SECTOR        => SECTOR
    )
    Port map(
        clk           => clk,
        i_segment_I   => i_segment_I,
        i_segment_M   => i_segment_M,
        i_segment_O   => i_segment_O,
        i_SLC         => i_SLC,
        i_rst         => i_rst,
        o_mtc         => o_mtc
    );


end Behavioral;

