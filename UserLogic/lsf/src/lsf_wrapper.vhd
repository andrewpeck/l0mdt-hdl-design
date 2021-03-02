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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--use work.mdttp_constants_pkg.all;
library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;

entity lsf_vhd_wrapper IS
   generic (
    LSF_SB_MEM_WIDTH    : positive := 6;
    LSF_SB_EL_MEM_WIDTH : positive := 4
    );
  PORT(
    clock,reset   : in std_logic;
    slc_roi_valid : in std_logic;         
    slc_roi       : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);

    mdt_hit_valid : in std_logic; 
    mdt_hit       : in std_logic_vector(HEG2SFHIT_LEN-1 downto 0); -- 14

    lsf           : out std_logic_vector(SF2PTCALC_LEN-1 downto 0);
    lsf_re        : in std_logic;

    hba_max_clocks: in std_logic_vector(9 downto 0);
    mdt_hit_af    : out std_logic;
    slc_roi_af    : out std_logic;
    lsf_empty     : out std_logic;

    --SpyBuffer Interface
    sb_lsf_mdt_hits_freeze : in std_logic;
    sb_lsf_mdt_hits_re     : in std_logic;
    sb_lsf_mdt_hits_raddr  : in std_logic_vector (LSF_SB_MEM_WIDTH-1 downto 0);
    sb_lsf_mdt_hits_rdata  : out std_logic_vector(HEG2SFHIT_LEN-1 downto 0)    
    );
  end entity lsf_vhd_wrapper;


  
architecture lsf_vhd_wrapper_arch of lsf_vhd_wrapper IS
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
--    lsf_output_re : in std_logic;
    histogram_accumulation_count : in std_logic_vector(9 downto 0);
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
  --  roi_af        : out std_logic;
 --   mdt_hit_af    : out std_logic;
--    lsf_output_empty: out std_logic
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
    mdt_hit_we    => mdt_hit_valid,

    roi           => slc_roi,
    roi_we        => slc_roi_valid,

    lsf_output    => lsf,

    histogram_accumulation_count  =>  hba_max_clocks,
    sb_lsf_mdt_hits_freeze        => sb_lsf_mdt_hits_freeze,
    sb_lsf_mdt_hits_re            => sb_lsf_mdt_hits_re,
    sb_lsf_mdt_hits_raddr         => sb_lsf_mdt_hits_raddr,
    sb_lsf_mdt_hits_rdata         => sb_lsf_mdt_hits_rdata 
    --    mdt_hit_af    => mdt_hit_af,
    --    roi_af        => slc_roi_af,
    --    lsf_output_re => lsf_re,
    --   lsf_output_empty => lsf_empty,
    );
  end architecture lsf_vhd_wrapper_arch;
