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
USE shared_lib.detector_param_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

ENTITY top_csf IS
  GENERIC (
    -- Project flavour (0: Barrel, 1: Endcap)
    FLAVOUR : INTEGER := 0
  );
  PORT (
    clk          : IN STD_LOGIC;
    rst          : IN STD_LOGIC;
    glob_en      : IN STD_LOGIC;
    i_csf_ctrl_v : IN STD_LOGIC_VECTOR(HPS_CSF_CSF_CTRL_t'w - 1 downto 0); --  HPS_CSF_CSF_CTRL_t;
    o_csf_mon_v  : OUT STD_LOGIC_VECTOR(HPS_CSF_CSF_MON_t'w - 1 downto 0);
    -- Data
    i_seed    : IN heg2sfslc_vt;
    i_mdt_hit : IN heg2sfhit_vt;
    i_eof     : IN STD_LOGIC;
    o_seg     : OUT sf2ptcalc_vt
  );
END ENTITY top_csf;

ARCHITECTURE behavioral OF top_csf IS

  COMPONENT csf IS
    GENERIC (
      IS_ENDCAP : INTEGER := 0
    );
    PORT (
      clk          : IN STD_LOGIC;
      rst          : IN STD_LOGIC;
      glob_en      : IN STD_LOGIC;
      i_csf_ctrl_v : IN STD_LOGIC_VECTOR;
      o_csf_mon_v  : OUT STD_LOGIC_VECTOR;
      i_seed       : IN heg2sfslc_vt;
      i_mdt_hit    : IN heg2sfhit_vt;
      i_eof        : IN STD_LOGIC;
      o_seg        : OUT sf2ptcalc_vt
    );
  END COMPONENT csf;

BEGIN

  csf_inst : COMPONENT csf
    GENERIC MAP(
      IS_ENDCAP => FLAVOUR
    )
    PORT MAP(
      clk          => clk,
      rst          => rst,
      glob_en      => glob_en,
      i_csf_ctrl_v => i_csf_ctrl_v,
      o_csf_mon_v  => o_csf_mon_v,
      i_seed       => i_seed,
      i_mdt_hit    => i_mdt_hit,
      i_eof        => i_eof,
      o_seg        => o_seg
    );

  END ARCHITECTURE behavioral;