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
  use shared_lib.config_pkg.all;
  -- use shared_lib.detector_param_pkg.all;

library csf_lib;
  use csf_lib.csf_pkg.all;
  use csf_lib.csf_custom_pkg.all;

library ctrl_lib;
  use ctrl_lib.hps_ctrl.all;

entity top_csf is
  generic (
    -- Project flavour (0: Barrel, 1: Endcap)
    flavour : integer := 0
  );
  port (
    clk          : in    std_logic;
    rst          : in    std_logic;
    glob_en      : in    std_logic;
    i_csf_ctrl_v : in    std_logic_vector(HPS_CSF_CSF_CTRL_t'w - 1 downto 0); --  HPS_CSF_CSF_CTRL_t;
    o_csf_mon_v  : out   std_logic_vector(HPS_CSF_CSF_MON_t'w - 1 downto 0);
    -- Data
    i_seed    : in    heg2sfslc_vt;
    i_mdt_hit : in    heg2sfhit_vt;
    i_eof     : in    std_logic;
    o_seg     : out   sf2ptcalc_vt
  );
end entity top_csf;

architecture behavioral of top_csf is

  component csf is
    generic (
      is_endcap : integer := 0
    );
    port (
      clk       : in    std_logic;
      rst       : in    std_logic;
      glob_en   : in    std_logic;
      i_ctrl_v  : in    std_logic_vector;
      o_mon_v   : out   std_logic_vector;
      i_seed    : in    heg2sfslc_vt;
      i_mdt_hit : in    heg2sfhit_vt;
      i_eof     : in    std_logic;
      o_seg     : out   sf2ptcalc_vt
    );
  end component csf;

begin

  csf_inst : component csf
    generic map (
      is_endcap => flavour
    )
    port map (
      clk       => clk,
      rst       => rst,
      glob_en   => glob_en,
      i_ctrl_v  => i_csf_ctrl_v,
      o_mon_v   => o_csf_mon_v,
      i_seed    => i_seed,
      i_mdt_hit => i_mdt_hit,
      i_eof     => i_eof,
      o_seg     => o_seg
    );

end architecture behavioral;
