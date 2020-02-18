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

package cfg_pkg is

--------------------------------------------------------------------------------
-- Station information
--------------------------------------------------------------------------------
constant St_nbarrel_endcap : std_logic := '0'; 
-- 0: barrel  1: Endcap
constant St_position : integer range 0 to 3 := 0;
-- for barrel -> 0:inner, 1:Middle, 2:Outer, 3:Extension
-- for Endcap ->
constant St_type : integer  range 0 to 3 := 0;
-- for barrel -> 0:Long, 1:Rib, 2:short, 3:Feet
-- constant St_

--------------------------------------------------------------------------------
-- Segment Finder
--------------------------------------------------------------------------------
constant SF_type : std_logic :='0';
-- 0: CSF 1:LSF

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