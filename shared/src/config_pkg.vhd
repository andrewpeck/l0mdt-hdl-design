--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: configuration file
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--    05/02/2020    0.1     File created
--------------------------------------------------------------------------------

library ieee, common_pkg;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- library shared_lib;
-- use shared_lib.cfg_pkg.all;

package cfg_pkg is

--------------------------------------------------------------------------------
-- Station information
--------------------------------------------------------------------------------
constant ST_nBARREL_ENDCAP    : std_logic := '0'; -- 0: barrel    1: Endcap
constant ENDCAP_nSMALL_LARGE  : std_logic := '0'; -- 0: small     1: large
constant ENABLE_NEIGHTBORS    : std_logic := '1'; -- 0: disabled  1: enabled

--------------------------------------------------------------------------------
-- IN COMPILATION CONFIGURATIONS 
--------------------------------------------------------------------------------
constant MAX_NUM_HP   : integer := 6;
constant MAX_NUM_HEG  : integer := 3;
constant MAX_NUM_HPS  : integer := 3;
constant MAX_NUM_SL   : integer := 3 + 
to_integer(unsigned'("" & ST_nBARREL_ENDCAP))*to_integer(unsigned'("" & ENDCAP_nSMALL_LARGE))*3 + 
to_integer(unsigned'("" & ENABLE_NEIGHTBORS))*2;

--------------------------------------------------------------------------------
-- Segment Finder
--------------------------------------------------------------------------------
constant SF_type  : integer := 0;  -- 0: CSF 1:LSF

--------------------------------------------------------------------------------
-- PIPELINE DELAY CLOCKS 
--------------------------------------------------------------------------------
  constant LATENCY_HPS_CH : integer := 10;

--------------------------------------------------------------------------------
-- MDT mapping
--------------------------------------------------------------------------------
constant MDT_rx_interfaces_active : std_logic_vector(7 downto 0) := "00000001";

constant MDT_pullmux_input_active_0 : std_logic_vector(17 downto 0) := "000100000" & "000000000" ;
constant MDT_pullmux_input_active_1 : std_logic_vector(17 downto 0) := "000100001" & "000000000" ;
constant MDT_pullmux_input_active_2 : std_logic_vector(17 downto 0) := "000100001" & "000000000" ;
constant MDT_pullmux_input_active_3 : std_logic_vector(17 downto 0) := "000100001" & "000000000" ;
constant MDT_pullmux_input_active_4 : std_logic_vector(17 downto 0) := "000100001" & "000000000" ;
constant MDT_pullmux_input_active_5 : std_logic_vector(17 downto 0) := "000100001" & "000000000" ;
constant MDT_pullmux_input_active_6 : std_logic_vector(17 downto 0) := "000100001" & "000000000" ;
constant MDT_pullmux_input_active_7 : std_logic_vector(17 downto 0) := "000100001" & "000000000" ;

end package cfg_pkg;