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
        clk_360             : in std_logic;
        Reset_b             : in std_logic;
        --
        in_tdchits_r        : in tar2hec_data_rt;
        in_tdchits_valid    : in std_logic;
        in_candidate_r      : in muCand_data_rt;
        in_candidate_valid  : in std_logic;
        --
        valid_hit            : out std_logic;
        sf_data             : out segment_finder_legendre_rt;
        sf_data_valid       : out std_logic
    );
end entity he_core;

architecture beh of he_core is
    
    -- data signals
    signal mcp2trlut_tube_ranges_config     : tube_range_config_rt;
    signal mcp2hc_muon_candidate_info       : muon_candidate_info_rt;
    signal trlut2hm_tube_range              : tube_range_cand_rt;
    signal hc2hm_cal_time                   : integer;
    -- valid signals
    signal mcp2trlut_trc_valid           : std_logic;
    signal mcp_mci_out_data_valid           : std_logic;
    signal trlut2hm_tube_range_valid        : std_logic;
    signal hc2hm_cal_time_valid             : std_logic;

begin

    HE_HP_TubeRangeLUT : entity he_lib.he_hp_crlut
    port map (
        clk_360             => clk_360,
        Reset_b             => Reset_b,
        --
        hit_layer                   => in_tdchits_r.layer,
        hit_layer_valid             => in_tdchits_valid,
        tube_ranges_config          => mcp2trlut_tube_ranges_config,
        tube_ranges_config_valid    => mcp2trlut_trc_valid,
        --
        tube_range                  => trlut2hm_tube_range,
        out_data_valid              => trlut2hm_tube_range_valid
    );

    HE_HP_MCP: entity he_lib.he_hp_mcp
    port map (
        clk_360             => clk_360,
        Reset_b             => Reset_b,
        --
        in_muonCanidate     => in_candidate_r,
        in_candidate_valid  => in_candidate_valid,
        --
        tube_ranges_config          => mcp2trlut_tube_ranges_config,
        tube_ranges_config_valid    => mcp2trlut_trc_valid,
        muon_candidate_info         => mcp2hc_muon_candidate_info,
        muon_candidate_info_valid   => mcp_mci_out_data_valid

    );

    HE_HP_HC : entity he_lib.he_hp_hc
    port map (
        clk_360             => clk_360,
        Reset_b             => Reset_b,
        --
        tdchits_r                   => in_tdchits_r,
        tdchits_valid               => in_tdchits_valid,
        muon_candidate_info_r       => mcp2hc_muon_candidate_info,
        muon_candidate_info_valid   => mcp_mci_out_data_valid,
        --
        cal_time                    => hc2hm_cal_time,
        cal_time_valid              => hc2hm_cal_time_valid,
        sf_data                     => sf_data,
        sf_data_valid               => sf_data_valid





    );

    HE_HP_HM : entity he_lib.he_hp_hm
    port map (
        clk_360             => clk_360,
        Reset_b             => Reset_b,
        --
        tdchits_r         => in_tdchits_r,
        tdchits_valid     => in_tdchits_valid,
        tube_range_r        => trlut2hm_tube_range,
        tube_range_valid    => trlut2hm_tube_range_valid,
        cal_time            => hc2hm_cal_time,
        cal_time_valid      => hc2hm_cal_time_valid,
        --
        valid_hit           => valid_hit
        --ouput_data_valid    =>
    );

end beh;