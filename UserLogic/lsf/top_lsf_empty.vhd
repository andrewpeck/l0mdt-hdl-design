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

entity top_lsf IS
  generic (
    LSF_SB_MEM_WIDTH    : positive := 8;
    LSF_SB_EL_MEM_WIDTH : positive := 4
    );
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

begin

end architecture top_lsf_arch;
