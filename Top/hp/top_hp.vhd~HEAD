--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--   26/11/2019  0.1  File created
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library he_lib;
use he_lib.he_pkg.all;


entity top_he is
    Generic(
        datawidth : integer := 64
    );
    Port(
        -- system signals
        clk_360     : in std_logic;
        Reset_b      : in std_logic;
        -- Control signals

        -- input data signals
        in_tdc_data_a      : in tdc_data_ta;
        in_tdc_valid_a     : in std_logic_vector(numInputs_mux -1 downto 0);
        in_tdc_valid_acq_a : out std_logic_vector(numInputs_mux -1 downto 0);

        in_muonCand_data_r  : in muCand_data_rt;
        in_muonCand_valid   : in std_logic
    );
end top_he;

architecture beh of top_he is



begin

    -- HE: entity he_lib.he 
    -- generic map (
    --     datawidth => datawidth 
    -- )
    -- port map (
    --     -- system signals
    --     clk_360                 => clk_360,
    --     Reset_b                 => Reset_b,
    --     -- Contorl signals

    --     -- Input related signals
    --     in_tdc_data_a           => in_tdc_data_a,
    --     in_tdc_valid_a          => in_tdc_valid_a,
    --     in_tdc_valid_acq_a      => in_tdc_valid_acq_a,
    --     -- Output related signals
    --     in_muonCand_data_r      => in_muonCand_data_r,
    --     in_muonCand_valid       => in_muonCand_valid
    -- );

end beh;





