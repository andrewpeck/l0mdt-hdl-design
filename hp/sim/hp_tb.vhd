--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: TestBench file for hit extractor simulation
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--   28/11/2019  0.1  File created
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library he_lib;
use he_lib.he_pkg.all;


entity he_tb is

end he_tb;

architecture beh of he_tb is

-- simualtion only signals
signal clk_tdc          : std_logic := '0';
constant clk_tdc_per    : time := 0.78 ns;

--system signals
signal clk_360          : std_logic := '0';
constant clk_360_per    : time := 1 sec / 360E6;

signal rst: std_logic := '0';


begin

--------------------------------------------------------------------------------
-- DUT instantiation -> hit extraction module
--------------------------------------------------------------------------------
he_top : entity work.he 
generic map (
    datawidth => datawidth 
)
port map (
    -- system signals
    clk_360              => clk_360,
    rst             => rst,
    -- Contorl signals
    tdc_enable_a         => tdc_enable,
    -- Input signals
    in_tdc_data_a        => indata,
    in_tdc_valid_a       => invalid,
    in_tdc_valid_acq_a   => in_tdc_valid_acq_a
    -- Output signals
);


--------------------------------------------------------------------------------
--      SYSTEM SIGNALS
--------------------------------------------------------------------------------
clk_tdc_gen : process
begin
    clk_tdc <= '0';
    wait for clk_tdc_per/2;
    clk_tdc <= '1';
    wait for clk_tdc_per/2;
end process;

clk_360_gen : process
begin
    clk_360 <= '0';
    wait for clk_360_per/2;
    clk_360 <= '1';
    wait for clk_360_per/2;
end process;

reset_gen : process
begin
    rst<= '0';
    wait for clk_360_per * 5;
    rst<= '1';
end process;











end beh;





