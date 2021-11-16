--------------------------------------------------------------------------------
--  Department of Physics and Astronomy, UCI
--  Priya Sundararajan
--  priya.sundararajan@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lsf_lib;


library shared_lib;
--use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;

library fm_lib;
use fm_lib.fm_sb_pkg.all;

entity top_lsf IS
  generic (
    LSF_SB_MEM_WIDTH    : positive := 8;
    LSF_SB_EL_MEM_WIDTH : positive := 4
    );
  PORT(
    clock,reset   : in std_logic;
    slc_roi       : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);
    mdt_hit       : in std_logic_vector(HEG2SFHIT_LEN-1 downto 0); -- 14
    lsf           : out std_logic_vector(SF2PTCALC_LEN-1 downto 0);
    i_eof         : in std_logic;
    hba_max_clocks: in std_logic_vector(9 downto 0);
  --SpyBuffer Interface
    sb_lsf_mdt_hits_freeze : in std_logic;
    sb_lsf_mdt_hits_re     : in std_logic;
    sb_lsf_mdt_hits_raddr  : in std_logic_vector (LSF_SB_MEM_WIDTH-1 downto 0);
    sb_lsf_mdt_hits_rdata  : out std_logic_vector(HEG2SFHIT_LEN-1 downto 0);
  --Fast Monitoring Data
    lsf_fm_data            : out fm_rt_array( 0 to sf_sb_station_n - 1)

    );
  end entity top_lsf;



architecture top_lsf_arch of top_lsf IS
component lsf_spybuffer_wrapper
   generic (
    LSF_SB_MEM_WIDTH    : positive;
    LSF_SB_EL_MEM_WIDTH : positive
    );
  PORT(
    clock         : in std_logic;
    reset         : in std_logic;
    mdt_hit       : in std_logic_vector(HEG2SFHIT_LEN-1 downto 0);
    mdt_hit_we    : in std_logic;
    roi           : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);
    roi_we        : in std_logic;
    lsf_output    : out std_logic_vector(SF2PTCALC_LEN-1 downto 0);
    i_eof         : in std_logic;
    histogram_accumulation_count : in std_logic_vector(9 downto 0);
    lsf_fm_data                  : out fm_rt_array( 0 to sf_sb_station_n - 1);
    --SpyBuffer Interface
    sb_lsf_mdt_hits_freeze         : in std_logic;
    --  sb_lsf_mdt_hits_playback       : in std_logic;
    --  sb_lsf_mdt_hits_playback_we    : in std_logic;
    --  sb_lsf_mdt_hits_playback_wdata : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);
    sb_lsf_mdt_hits_re             : in std_logic;
    --  sb_lsf_mdt_hits_meta_re        : in std_logic;
    sb_lsf_mdt_hits_raddr          : in std_logic_vector (LSF_SB_MEM_WIDTH-1 downto 0);
    --  sb_lsf_mdt_hits_meta_raddr     : in std_logic_vector (LSF_SB_EL_MEM_WIDTH-1 downto 0);
    --  sb_lsf_mdt_hits_waddr          : in std_logic_vector (LSF_SB_MEM_WIDTH-1 downto 0);
    --  sb_lsf_mdt_hits_meta_waddr     : in std_logic_vector (LSF_SB_EL_MEM_WIDTH-1 downto 0);
    sb_lsf_mdt_hits_rdata          : out std_logic_vector(HEG2SFHIT_LEN-1 downto 0)
   --  sb_lsf_mdt_hits_meta_rdata     : out std_logic_vector(LSF_SB_MEM_WIDTH-1 downto 0)
   --  mdt_hit_af    : out std_logic
    );
  end component;
begin
   lsf_spybuffer_wrapper_inst: component lsf_spybuffer_wrapper
     generic map (
       LSF_SB_MEM_WIDTH    => LSF_SB_MEM_WIDTH,
       LSF_SB_EL_MEM_WIDTH => LSF_SB_EL_MEM_WIDTH
     )
   port map (
     clock         => clock,
     reset         => reset,
     mdt_hit       => mdt_hit,
     mdt_hit_we    => mdt_hit(HEG2SFHIT_LEN-1),
     roi           => slc_roi,
     roi_we        => slc_roi(HEG2SFSLC_LEN-1),
     lsf_output    => lsf,
     i_eof         => i_eof,
     histogram_accumulation_count  => hba_max_clocks,
     lsf_fm_data                   => lsf_fm_data,
     --SpyBuffer
     sb_lsf_mdt_hits_freeze        => sb_lsf_mdt_hits_freeze,
     sb_lsf_mdt_hits_re            => sb_lsf_mdt_hits_re,
     sb_lsf_mdt_hits_raddr         => sb_lsf_mdt_hits_raddr,
     sb_lsf_mdt_hits_rdata         => sb_lsf_mdt_hits_rdata
     );
  end architecture top_lsf_arch;
