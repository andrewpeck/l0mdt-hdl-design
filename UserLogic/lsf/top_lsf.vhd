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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;



entity top_lsf IS 
  PORT(
    clock,reset   : in std_logic;
    slc_roi       : in std_logic_vector;--(HEG2SFSLC_LEN-1 downto 0);
    mdt_hit       : in std_logic_vector;--(HEG2SFHIT_LEN-1 downto 0); -- 14
    lsf           : out std_logic_vector;--(SF2PTCALC_LEN-1 downto 0);
    i_eof         : in std_logic;
    hba_max_clocks: in std_logic_vector(9 downto 0) 
    );
  end entity top_lsf;



architecture top_lsf_arch of top_lsf IS

signal temp_HEG2SFHIT_LEN : heg2sfhit_vt;
constant HEG2SFHIT_LEN : integer := temp_HEG2SFHIT_LEN'length;
signal temp_HEG2SFSLC_LEN : heg2sfslc_vt;
constant HEG2SFSLC_LEN : integer := temp_HEG2SFSLC_LEN'length;
signal temp_SF2PTCALC_LEN : sf2ptcalc_vt;
constant SF2PTCALC_LEN : integer := temp_SF2PTCALC_LEN'length;

component lsf_spybuffer_wrapper
  PORT(
    clock         : in std_logic;
    reset         : in std_logic;
    mdt_hit       : in std_logic_vector(HEG2SFHIT_LEN-1 downto 0);
    mdt_hit_we    : in std_logic;
    roi           : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);
    roi_we        : in std_logic;
    lsf_output    : out std_logic_vector(SF2PTCALC_LEN-1 downto 0);
    i_eof         : in std_logic;
    histogram_accumulation_count : in std_logic_vector(9 downto 0)   

    );
  end component;
begin
   lsf_spybuffer_wrapper_inst: component lsf_spybuffer_wrapper
     port map (
       clock         => clock,
       reset         => reset,
       mdt_hit       => mdt_hit,
       mdt_hit_we    => mdt_hit(HEG2SFHIT_LEN-1),
       roi           => slc_roi,
       roi_we        => slc_roi(HEG2SFSLC_LEN-1),
       lsf_output    => lsf,
       i_eof         => i_eof,
       histogram_accumulation_count  => hba_max_clocks
     );
  end architecture top_lsf_arch;
