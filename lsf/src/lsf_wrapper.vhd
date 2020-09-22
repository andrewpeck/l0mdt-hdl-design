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
    lsf_empty     : out std_logic
    );
  end entity lsf_vhd_wrapper;


  
architecture lsf_vhd_wrapper_arch of lsf_vhd_wrapper IS
component lsf_spybuffer_wrapper
  PORT(
    clock         : in std_logic;
    reset         : in std_logic;
    mdt_hit       : in std_logic_vector(HEG2SFHIT_LEN-1 downto 0);
    mdt_hit_we    : in std_logic;
    roi           : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);
    roi_we        : in std_logic;
    lsf_output    : out std_logic_vector(SF2PTCALC_LEN-1 downto 0);
--    lsf_output_re : in std_logic;
    histogram_accumulation_count : in std_logic_vector(9 downto 0)
  --  roi_af        : out std_logic;
 --   mdt_hit_af    : out std_logic;
--    lsf_output_empty: out std_logic
    );
  end component;
begin
  lsf_spybuffer_wrapper_inst: lsf_spybuffer_wrapper port map (
    clock         => clock,
    reset         => reset,
    mdt_hit       => mdt_hit,
    mdt_hit_we    => mdt_hit_valid,
--    mdt_hit_af    => mdt_hit_af,
    roi           => slc_roi,
    roi_we        => slc_roi_valid,
--    roi_af        => slc_roi_af,
    lsf_output    => lsf,
--    lsf_output_re => lsf_re,
 --   lsf_output_empty => lsf_empty,
    histogram_accumulation_count=>hba_max_clocks 
    );
  end architecture lsf_vhd_wrapper_arch;
