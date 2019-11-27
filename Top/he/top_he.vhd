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
        clk_360     : in std_logic;
        nReset      : in std_logic;
        tdc_enable  : in std_logic_vector(numInputs_mux -1 downto 0);
        -- tdc inputs
        indata      : in sta_tdc_data;
        invalid     : in std_logic_vector(numInputs_mux -1 downto 0);
        invalid_acq : out std_logic_vector(numInputs_mux -1 downto 0)
    );
end top_he;

architecture beh of top_he is



begin

    HE: entity he_lib.he generic map (
        datawidth => datawidth 
    )
    port map (
        clk_360       => clk_360,
        nReset        => nReset,
        tdc_enable    => tdc_enable,
        --
        indata        => indata,
        invalid       => invalid,
        invalid_acq   => invalid_acq
    );

end beh;





