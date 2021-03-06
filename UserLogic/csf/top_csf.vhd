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
    FLAVOUR             : integer := 0;
    SPYBUFFER_EN        : integer := 1;
    SPYHIT_MEM_WIDTH    : integer := 10;
    SPYHIT_EL_MEM_WIDTH : integer := 10;
    SPYSLC_MEM_WIDTH    : integer := 10;
    SPYSLC_EL_MEM_WIDTH : integer := 10;
    SPYSEG_MEM_WIDTH    : integer := 10;
    SPYSEG_EL_MEM_WIDTH : integer := 10
  );
  port (
    clk       : in    std_logic;
    i_seed    : in    heg2sfslc_rvt;
    i_mdt_hit : in    heg2sfhit_rvt;
    i_eof     : in    std_logic;
    i_rst     : in    std_logic;
    o_seg     : out   sf2ptcalc_rvt;

    --SpyBuffer
  --  spy_clock           : in    std_logic;
    -- Hit Spybuffer
    i_spyhit_fc_we      : in    std_logic;
    i_spyhit_fc_re      : in    std_logic;
    i_spyhit_freeze     : in    std_logic;
    i_spyhit_playback   : in    std_logic_vector(1 downto 0);
    i_spyhit_pb_we      : in    std_logic;
    i_spyhit_pb_wdata   : in    heg2sfhit_rvt;
    i_spyhit_re         : in    std_logic;
    i_spyhit_meta_we    : in    std_logic;
    i_spyhit_addr       : in    std_logic_vector(SPYHIT_MEM_WIDTH - 1 downto 0);
    i_spyhit_meta_addr  : in    std_logic_vector(SPYHIT_EL_MEM_WIDTH - 1 downto 0);
    o_spyhit_data       : out   heg2sfhit_rvt;
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
    i_spyslc_pb_wdata   : in    heg2sfslc_rvt;
    i_spyslc_re         : in    std_logic;
    i_spyslc_addr       : in    std_logic_vector(SPYSLC_MEM_WIDTH - 1 downto 0);
    i_spyslc_meta_we    : in    std_logic;
    i_spyslc_meta_addr  : in    std_logic_vector(SPYSLC_EL_MEM_WIDTH - 1 downto 0);
    o_spyslc_data       : out   heg2sfslc_rvt;
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
    i_spyseg_pb_wdata   : in    sf2ptcalc_rvt;
    i_spyseg_re         : in    std_logic;
    i_spyseg_addr       : in    std_logic_vector(SPYSEG_MEM_WIDTH - 1 downto 0);
    i_spyseg_meta_addr  : in    std_logic_vector(SPYSEG_EL_MEM_WIDTH - 1 downto 0);
    i_spyseg_meta_we    : in    std_logic;
    o_spyseg_data       : out   sf2ptcalc_rvt;
    o_spyseg_meta_rdata : out   std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
    i_spyseg_meta_wdata : in    std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
    o_spyseg_af         : out   std_logic;
    o_spyseg_empty      : out   std_logic
  );
end entity top_csf;

architecture behavioral of top_csf is

  component csf is
    generic (
      IS_ENDCAP    : integer := 0;
      SPYBUFFER_EN : integer := 0
    );
    port (
      clk       : in    std_logic;
      i_seed    : in    heg2sfslc_rvt;
      i_mdt_hit : in    heg2sfhit_rvt;
      i_eof     : in    std_logic;
      i_rst     : in    std_logic;
      o_seg     : out   sf2ptcalc_rvt;
      spy_clock : in    std_logic;
      -- Hit Spybuffer
      i_spyhit_fc_we      : in    std_logic;
      i_spyhit_fc_re      : in    std_logic;
      i_spyhit_freeze     : in    std_logic;
      i_spyhit_playback   : in    std_logic_vector(1 downto 0);
      i_spyhit_pb_we      : in    std_logic;
      i_spyhit_pb_wdata   : in    heg2sfhit_rvt;
      i_spyhit_re         : in    std_logic;
      i_spyhit_addr       : in    std_logic_vector(SPYHIT_MEM_WIDTH - 1 downto 0);
      i_spyhit_meta_addr  : in    std_logic_vector(SPYHIT_EL_MEM_WIDTH - 1 downto 0);
      i_spyhit_meta_we    : in    std_logic;
      o_spyhit_data       : out   heg2sfhit_rvt;
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
      i_spyslc_pb_wdata   : in    heg2sfslc_rvt;
      i_spyslc_re         : in    std_logic;
      i_spyslc_addr       : in    std_logic_vector(SPYSLC_MEM_WIDTH - 1 downto 0);
      i_spyslc_meta_addr  : in    std_logic_vector(SPYSLC_EL_MEM_WIDTH - 1 downto 0);
      i_spyslc_meta_we    : in    std_logic;
      o_spyslc_data       : out   heg2sfslc_rvt;
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
      i_spyseg_pb_wdata   : in    sf2ptcalc_rvt;
      i_spyseg_re         : in    std_logic;
      i_spyseg_addr       : in    std_logic_vector(SPYSEG_MEM_WIDTH - 1 downto 0);
      i_spyseg_meta_addr  : in    std_logic_vector(SPYSEG_EL_MEM_WIDTH - 1 downto 0);
      i_spyseg_meta_we    : in    std_logic;
      o_spyseg_data       : out   sf2ptcalc_rvt;
      o_spyseg_meta_rdata : out   std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
      i_spyseg_meta_wdata : in    std_logic_vector(SPYSEG_MEM_WIDTH downto 0);
      o_spyseg_af         : out   std_logic;
      o_spyseg_empty      : out   std_logic
    );
  end component csf;

begin

  csf_inst : component csf
    generic map (
      IS_ENDCAP    => FLAVOUR,
      SPYBUFFER_EN => SPYBUFFER_EN
    )
    port map (
      clk       => clk,
      i_seed    => i_seed,
      i_mdt_hit => i_mdt_hit,
      i_eof     => i_eof,
      i_rst     => i_rst,
      o_seg     => o_seg,
      spy_clock => clk, --Need to change to AXI interface clock
      -- Hit SpyBuffer
      i_spyhit_fc_we      => i_spyhit_fc_we,
      i_spyhit_fc_re      => i_spyhit_fc_re,
      i_spyhit_freeze     => i_spyhit_freeze,
      i_spyhit_playback   => i_spyhit_playback,
      i_spyhit_pb_we      => i_spyhit_pb_we,
      i_spyhit_pb_wdata   => i_spyhit_pb_wdata,
      i_spyhit_re         => i_spyhit_re,
      i_spyhit_addr       => i_spyhit_addr,
      i_spyhit_meta_addr  => i_spyhit_meta_addr,
      i_spyhit_meta_we    => i_spyhit_meta_we,
      o_spyhit_data       => o_spyhit_data,
      o_spyhit_meta_rdata => o_spyhit_meta_rdata,
      i_spyhit_meta_wdata => i_spyhit_meta_wdata,
      o_spyhit_af         => o_spyhit_af,
      o_spyhit_empty      => o_spyhit_empty,
      -- SLC Spybuffer
      i_spyslc_fc_we      => i_spyslc_fc_we,
      i_spyslc_fc_re      => i_spyslc_fc_re,
      i_spyslc_freeze     => i_spyslc_freeze,
      i_spyslc_playback   => i_spyslc_playback,
      i_spyslc_pb_we      => i_spyslc_pb_we,
      i_spyslc_pb_wdata   => i_spyslc_pb_wdata,
      i_spyslc_re         => i_spyslc_re,
      i_spyslc_addr       => i_spyslc_addr,
      i_spyslc_meta_addr  => i_spyslc_meta_addr,
      i_spyslc_meta_we    => i_spyslc_meta_we,
      o_spyslc_data       => o_spyslc_data,
      o_spyslc_meta_rdata => o_spyslc_meta_rdata,
      i_spyslc_meta_wdata => i_spyslc_meta_wdata,
      o_spyslc_af         => o_spyslc_af,
      o_spyslc_empty      => o_spyslc_empty,
      -- Segment Spybuffer
      i_spyseg_fc_we      => i_spyseg_fc_we,
      i_spyseg_fc_re      => i_spyseg_fc_re,
      i_spyseg_freeze     => i_spyseg_freeze,
      i_spyseg_playback   => i_spyseg_playback,
      i_spyseg_pb_we      => i_spyseg_pb_we,
      i_spyseg_pb_wdata   => i_spyseg_pb_wdata,
      i_spyseg_re         => i_spyseg_re,
      i_spyseg_addr       => i_spyseg_addr,
      i_spyseg_meta_addr  => i_spyseg_meta_addr,
      i_spyseg_meta_we    => i_spyseg_meta_we,
      o_spyseg_data       => o_spyseg_data,
      o_spyseg_meta_rdata => o_spyseg_meta_rdata,
      i_spyseg_meta_wdata => i_spyseg_meta_wdata,
      o_spyseg_af         => o_spyseg_af,
      o_spyseg_empty      => o_spyseg_empty
    );

end architecture behavioral;
