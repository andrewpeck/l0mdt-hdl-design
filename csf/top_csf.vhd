----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 02/08/2019 11:31:09 AM
-- Design Name: Compact Segment Finder
-- Module Name: csf_top - Top module for stand alone project
-- Project Name:
-- Target Devices:
-- Tool Versions: 2019.2
-- Description: Compact Segment Finder top module
--
-- Dependencies: csf_pkg
--
-- Revision:
-- Revision 19.10.18
-- Additional Comments:
--
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;
use csf_lib.csf_custom_pkg.all;

entity top_csf is
  generic(
    -- Project flavour (0: Barrel, 1: Endcap)
    FLAVOUR  : integer := 0
  );
  Port (
    clk       : in std_logic;
    i_seed    : in heg2sfslc_rvt;
    i_mdt_hit : in heg2sfhit_rvt;
    i_eof     : in std_logic;
    i_rst     : in std_logic;
    o_seg     : out sf2ptcalc_rvt
  );
end top_csf;

architecture Behavioral of top_csf is
   

begin

  CSF : entity csf_lib.csf
  generic map(
    FLAVOUR => FLAVOUR
  )
  port map(
    clk        => clk,
    i_seed     => i_seed,
    i_mdt_hit  => i_mdt_hit,
    i_eof      => i_eof,
    i_rst      => i_rst,
    o_seg      => o_seg
  );

end Behavioral;
