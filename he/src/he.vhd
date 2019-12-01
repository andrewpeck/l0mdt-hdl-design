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
        in_muonCand_valid   : in std_logic
    );
end entity he;

architecture beh of he is
    
    signal data_mux2tar_r       : mux2tar_data_rt;
    signal data_mux2tar_valid   : std_logic;
    signal data_tar2core_r      : tar2hec_data_rt;
    signal data_tar2core_valid  : std_logic;

begin
    
    HE_PullMux: entity he_lib.he_pullingMux 
    port map (
        clk_360             => clk_360,
        Reset_b             => Reset_b,
        tdc_enable_a        => tdc_enable_a,
        --
        in_tdc_data_a       => in_tdc_data_a,
        in_tdc_valid_a      => in_tdc_valid_a,
        in_tdc_valid_acq_a  => in_tdc_valid_acq_a,
        --
        out_data_r          => data_mux2tar_r,
        out_data_valid      => data_mux2tar_valid
    );

    HE_TAR: entity he_lib.he_tar 
    port map (
        clk_360         => clk_360,
        Reset_b         => Reset_b,
        --
        in_data_r       => data_mux2tar_r,
        in_valid        => data_mux2tar_valid,
        --
        out_data_r      => data_tar2core_r,
        out_valid       => data_tar2core_valid
    );

    HE_CORE : entity he_lib.he_core 
    port map (
        clk_360             => clk_360,
        Reset_b             => Reset_b,
        --
        in_tdchits_r        => data_tar2core_r,
        in_tdchits_valid    => data_tar2core_valid,
        in_candidate_r      => in_muonCand_data_r,
        in_candidate_valid  => in_muonCand_valid
    );

    
end beh;