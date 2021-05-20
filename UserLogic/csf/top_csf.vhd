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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;
USE shared_lib.config_pkg.ALL;
-- use shared_lib.vhdl2008_functions_pkg.all;
USE shared_lib.detector_param_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;

ENTITY top_csf IS
  GENERIC (
    -- Project flavour (0: Barrel, 1: Endcap)
    FLAVOUR : INTEGER := 0
  );
  PORT (
    clk : IN STD_LOGIC;
    i_seed : IN heg2sfslc_rvt;
    i_mdt_hit : IN heg2sfhit_rvt;
    i_eof : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;
    o_seg : OUT sf2ptcalc_rvt
  );
END top_csf;

ARCHITECTURE Behavioral OF top_csf IS
BEGIN

  CSF : ENTITY csf_lib.csf
    GENERIC MAP(
      IS_ENDCAP => FLAVOUR
    )
    PORT MAP(
      clk => clk,
      i_seed => i_seed,
      i_mdt_hit => i_mdt_hit,
      i_eof => i_eof,
      i_rst => i_rst,
      o_seg => o_seg
    );

END Behavioral;