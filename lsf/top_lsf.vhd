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
library lsf;
  

library shared_lib;
--use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;

entity top_lsf IS
  PORT(
    clock,reset   : in std_logic;
    slc_roi       : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);     
    mdt_hit       : in std_logic_vector(HEG2SFHIT_LEN-1 downto 0); -- 14
    lsf           : out std_logic_vector(SF2PTCALC_LEN-1 downto 0);           
    hba_max_clocks: in std_logic_vector(9 downto 0)

    
    );
  end entity top_lsf;


  
architecture top_lsf_arch of top_lsf IS
component lsf_spybuffer_wrapper
  PORT(
    clock         : in std_logic;
    reset         : in std_logic;
    mdt_hit       : in std_logic_vector(HEG2SFHIT_LEN-1 downto 0);    
    mdt_hit_we    : in std_logic;
    roi           : in std_logic_vector(HEG2SFSLC_LEN-1 downto 0);
    roi_we        : in std_logic;
    lsf_output    : out std_logic_vector(SF2PTCALC_LEN-1 downto 0);
    histogram_accumulation_count : in std_logic_vector(9 downto 0)
  --  mdt_hit_af    : out std_logic
    );
  end component;
begin
  lsf_spybuffer_wrapper_inst: lsf_spybuffer_wrapper port map (
    clock         => clock,
    reset         => reset,
    mdt_hit       => mdt_hit,
    mdt_hit_we    => mdt_hit(HEG2SFHIT_LEN-1),
    roi           => slc_roi,
    roi_we        => slc_roi(HEG2SFSLC_LEN-1),
    lsf_output    => lsf,    
    histogram_accumulation_count => hba_max_clocks 
    );
  end architecture top_lsf_arch;
