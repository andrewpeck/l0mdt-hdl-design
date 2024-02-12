----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut für Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 09/02/2022
-- Design Name: Compact Segment Finder
-- Module Name: csf - Behavioral
-- Project Name: ncsf
-- Target Devices: VU13P - xcvu13p-flga2577-2-e
-- Tool Versions: 2020.2
-- Description: Compact Segment Finder top module
--
-- Dependencies: csf_pkg
--
-- Revision:
-- Revision 09.02.2022
-- Additional Comments: New version of CSF using a clustering algorithm instead
-- of the previous 1D histogram
--
----------------------------------------------------------------------------------

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

library csf_lib;
  use csf_lib.csf_pkg.all;
  use csf_lib.csf_custom_pkg.all;

library ctrl_lib;
  use ctrl_lib.HPS_CTRL.all;
 
entity csf_cocotb is
  generic (
    is_endcap   : integer := 0;
    mdt_station : integer := 0 -- Station 0: Inner, 1: Middle, 2: Outer
  );
  port (
    clk     : in    std_logic;
    rst     : in    std_logic;
    glob_en : in    std_logic;
    -- control
    i_ctrl_v : in    std_logic_vector(3 downto 0); --  HPS_CSF_CSF_CTRL_t;
    o_mon_v  : out   std_logic_vector(2 downto 0);
    -- Data
    i_seed    : in    heg2sfslc_rt;
    i_mdt_hit : in    heg2sfhit_rt;
    i_eof     : in    std_logic;
    o_seg     : out   sf2ptcalc_rt
  );
end entity csf_cocotb;

architecture behavioral of csf_cocotb is

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

    signal i_seed_v : heg2sfslc_vt;
    signal i_mdt_hit_v : heg2sfhit_vt;
    signal o_seg_v : sf2ptcalc_vt;

begin

    i_seed_v <= convert(i_seed, i_seed_v);
    i_mdt_hit_v <= convert(i_mdt_hit, i_mdt_hit_v);
    o_seg <= convert(o_seg_v, o_seg);
  
    csf_inst : component csf
    port map (
        clk       => clk,
        rst       => rst,
        glob_en   => glob_en,
        i_ctrl_v  => i_ctrl_v,
        o_mon_v   => o_mon_v,
        i_seed    => i_seed_v,
        i_mdt_hit => i_mdt_hit_v,
        i_eof     => i_eof,
        o_seg     => o_seg_v
    );

end architecture behavioral;
