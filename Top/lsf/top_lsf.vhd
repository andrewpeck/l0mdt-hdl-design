library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lsf;
  
use lsf.mdttp_constants_pkg.all;


entity top_lsf IS
  PORT(
    clock,reset   : in std_logic;
    slc_roi_valid : in std_logic;         
    slc_roi       : in std_logic_vector(SLCPROC_HPS_SF_LEN-1 downto 0);

    mdt_hit_valid : in std_logic; 
    mdt_hit       : in std_logic_vector(HPS_LSF_LEN-1 downto 0); -- 14

    lsf           : out std_logic_vector(SF_LEN-1 downto 0);
    lsf_re        : in std_logic;

    hba_max_clocks: in std_logic_vector(9 downto 0);
    mdt_hit_af    : out std_logic;
    slc_roi_af    : out std_logic;
    lsf_empty     : out std_logic
    );
  end entity top_lsf;


  
architecture top_lsf_arch of top_lsf IS
component lsf_spybuffer_wrapper
  PORT(
    clock         : in std_logic;
    reset         : in std_logic;
    mdt_hit       : in std_logic_vector(HPS_LSF_LEN-1 downto 0);
    mdt_hit_we    : in std_logic;
    roi           : in std_logic_vector(SLCPROC_HPS_SF_LEN-1 downto 0);
    roi_we        : in std_logic;
    lsf_output    : out std_logic_vector(SF_LEN-1 downto 0);
    lsf_output_re : in std_logic;
    histogram_accumulation_count : in std_logic_vector(9 downto 0);
    roi_af        : out std_logic;
    mdt_hit_af    : out std_logic;
    lsf_output_empty: out std_logic
    );
  end component;
begin
  lsf_spybuffer_wrapper_inst: lsf_spybuffer_wrapper port map (
    clock         => clock,
    reset         => reset,
    mdt_hit       => mdt_hit,
    mdt_hit_we    => mdt_hit_valid,
    mdt_hit_af    => mdt_hit_af,
    roi           => slc_roi,
    roi_we        => slc_roi_valid,
    roi_af        => slc_roi_af,
    lsf_output    => lsf,
    lsf_output_re => lsf_re,
    lsf_output_empty => lsf_empty,
    histogram_accumulation_count=>hba_max_clocks 
    );
  end architecture top_lsf_arch;
