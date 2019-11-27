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

entity he_core is
    Generic(
        datawidth   : integer := 64
    );
    port (
        clk_360         : in std_logic;
        nReset          : in std_logic;
        --
        input_hits      : in tr_tar2fifo_data;
        input_candidate : in tr_muoncandidate
    );
end entity he_core;

architecture beh of he_core is
    
    signal data_mux2tar : tr_mux2tar_data;
    signal data_tar2fifo : tr_tar2fifo_data;

begin
    
    HE_PullMux: entity he_lib.he_pullingMux 
    port map (
        clk_360     => clk_360,
        nReset      => nReset,
        tdc_enable  => tdc_enable,
        --
        indata      => indata,
        invalid     => invalid,
        invalid_acq => invalid_acq,
        --
        outdata     => data_mux2tar
    );

    HE_TAR: entity he_lib.he_tar 
    port map (
        clk_360     => clk_360,
        nReset      => nReset,
        --
        indata      => data_mux2tar,
        --
        outdata     => data_tar2fifo
    );

    
end beh;