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
  use ieee.std_logic_1164.ALL;
  use ieee.numeric_std.ALL;

library shared_lib;
  use shared_lib.common_ieee_pkg.ALL;
  use shared_lib.l0mdt_constants_pkg.ALL;
  use shared_lib.l0mdt_dataformats_pkg.ALL;
  use shared_lib.common_constants_pkg.ALL;
  use shared_lib.common_types_pkg.ALL;
  use shared_lib.config_pkg.ALL;
  use shared_lib.detector_param_pkg.ALL;

library csf_lib;
  use csf_lib.csf_pkg.ALL;
  use csf_lib.csf_custom_pkg.ALL;

entity top_csf is
  generic (
    -- Project flavour (0: Barrel, 1: Endcap)
    FLAVOUR             : integer := 0
  );
  port (
    clk       : in    std_logic;
    i_seed    : in    heg2sfslc_vt;
    i_mdt_hit : in    heg2sfhit_vt;
    i_eof     : in    std_logic;
    i_rst     : in    std_logic;
    o_seg     : out   sf2ptcalc_vt
  );
end entity top_csf;

architecture behavioral of top_csf is

  component csf is
    generic (
      IS_ENDCAP    : integer := 0;
    );
    port (
      clk       : in    std_logic;
      i_seed    : in    heg2sfslc_vt;
      i_mdt_hit : in    heg2sfhit_vt;
      i_eof     : in    std_logic;
      i_rst     : in    std_logic;
      o_seg     : out   sf2ptcalc_vt
    );
  end component csf;

begin

  csf_inst : component csf
    generic map (
      IS_ENDCAP    => FLAVOUR
    )
    port map (
      clk       => clk,
      i_seed    => i_seed,
      i_mdt_hit => i_mdt_hit,
      i_eof     => i_eof,
      i_rst     => i_rst,
      o_seg     => o_seg
    );

end architecture behavioral;
