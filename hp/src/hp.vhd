--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor Top
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      26/11/2019  0.1  File created
--      05/02/2020  0.11    Change name and structure to Hit processor as the diagram
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library he_lib;
use he_lib.he_pkg.all;

entity he is
    Generic(
        datawidth       : integer := 64
    );
    port (
        clk_360         : in std_logic;
        Reset_b         : in std_logic;
        tdc_enable_a    : in std_logic_vector(numInputs_mux -1 downto 0);

        in_tdc_data_a       : in tdc_data_ta;
        in_tdc_valid_a      : in std_logic_vector(numInputs_mux -1 downto 0);
        in_tdc_valid_acq_a  : out std_logic_vector(numInputs_mux -1 downto 0);

        in_muonCand_data_r  : in muCand_data_rt;
        in_muonCand_valid   : in std_logic;

        -- to Segment finder
        out_segFinder_data  : out segment_finder_legendre_rt

    );
end entity he;

architecture beh of he is

begin
    
    
end beh;