----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 02/08/2019 11:31:09 AM
-- Design Name: Compact Segment Finder Empty
-- Module Name: csf_empty - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions: 2018.3
-- Description: Compact Segment Finder empty top module for LSF implementations
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
  use ieee.math_real.ALL;

library shared_lib;
  use shared_lib.common_ieee_pkg.ALL;
  use shared_lib.l0mdt_constants_pkg.ALL;
  use shared_lib.l0mdt_dataformats_pkg.ALL;
  use shared_lib.common_constants_pkg.ALL;
  use shared_lib.common_types_pkg.ALL;


entity csf is
  generic (
    IS_ENDCAP           : integer := 0;
    MDT_STATION         : integer := 0;
    SPYBUFFER_EN        : integer := 0;
    SPYHIT_MEM_WIDTH    : integer := 10;
    SPYHIT_EL_MEM_WIDTH : integer := 10;
    SPYSLC_MEM_WIDTH    : integer := 10;
    SPYSLC_EL_MEM_WIDTH : integer := 10;
    SPYSEG_MEM_WIDTH    : integer := 10;
    SPYSEG_EL_MEM_WIDTH : integer := 10
  );
  port (
    clk       : in    std_logic;
    i_seed    : in    heg2sfslc_vt;
    i_mdt_hit : in    heg2sfhit_vt;
    i_eof     : in    std_logic;
    i_rst     : in    std_logic;
    o_seg     : out   sf2ptcalc_vt;

    --SpuBuffer
    spy_clock           : in    std_logic;
    -- Hit Spybuffer
    i_spyhit_fc_we      : in    std_logic;
    i_spyhit_fc_re      : in    std_logic;
    i_spyhit_freeze     : in    std_logic;
    i_spyhit_playback   : in    std_logic_vector(1 downto 0);
    i_spyhit_pb_we      : in    std_logic;
    i_spyhit_pb_wdata   : in    heg2sfhit_vt;
    i_spyhit_re         : in    std_logic;
    i_spyhit_meta_we    : in    std_logic;
    i_spyhit_addr       : in    std_logic_vector(SPYHIT_MEM_WIDTH - 1 downto 0);
    i_spyhit_meta_addr  : in   std_logic_vector(SPYHIT_EL_MEM_WIDTH - 1 downto 0);
    o_spyhit_data       : out   heg2sfhit_vt;
    o_spyhit_meta_rdata : out   std_logic_vector(SPYHIT_MEM_WIDTH downto 0);
    i_spyhit_meta_wdata : in    std_logic_vector(SPYHIT_MEM_WIDTH downto 0);
    o_spyhit_af         : out   std_logic;
    o_spyhit_empty      : out   std_logic;

    -- SLC Spybuffer
    i_spyslc_fc_we      : in    std_logic;
    i_spyslc_fc_re      : in    std_logic;
    i_spyslc_freeze     : in    std_logic;
    i_spyslc_playback   : in    std_logic_vector(1 downto 0);
    i_spyslc_pb_we      : in    std_logic;
    i_spyslc_pb_wdata   : in    heg2sfslc_vt;
    i_spyslc_re         : in    std_logic;
    i_spyslc_addr       : in    std_logic_vector(SPYSLC_MEM_WIDTH - 1 downto 0);
    i_spyslc_meta_we    : in    std_logic;
    i_spyslc_meta_addr  : in    std_logic_vector(SPYSLC_EL_MEM_WIDTH - 1 downto 0);
    o_spyslc_data       : out   heg2sfslc_vt;
    o_spyslc_meta_rdata : out   std_logic_vector(SPYSLC_MEM_WIDTH downto 0);
    i_spyslc_meta_wdata : in    std_logic_vector(SPYSLC_MEM_WIDTH downto 0);
    o_spyslc_af         : out   std_logic;
    o_spyslc_empty      : out   std_logic;

    -- Segment Spybuffer
    i_spyseg_fc_we      : in    std_logic;
    i_spyseg_fc_re      : in    std_logic;
    i_spyseg_freeze     : in    std_logic;
    i_spyseg_playback   : in    std_logic_vector(1 downto 0);
    i_spyseg_pb_we      : in    std_logic;
    i_spyseg_pb_wdata   : in    sf2ptcalc_vt;
    i_spyseg_re         : in    std_logic;
    i_spyseg_addr       : in    std_logic_vector(SPYSEG_MEM_WIDTH - 1 downto 0);
    i_spyseg_meta_addr  : in    std_logic_vector(SPYSEG_EL_MEM_WIDTH - 1 downto 0);
    i_spyseg_meta_we    : in    std_logic;
    o_spyseg_data       : out   sf2ptcalc_vt;
    o_spyseg_meta_rdata : out   std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
    i_spyseg_meta_wdata : in    std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
    o_spyseg_af         : out   std_logic;
    o_spyseg_empty      : out   std_logic
  );
end entity csf;

architecture behavioral of csf is


begin

end architecture behavioral;
