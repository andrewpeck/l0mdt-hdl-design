--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor Top
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      26/11/2019  0.1     File created
--      05/02/2020  0.11    Change name and structure to Hit processor as the diagram
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.cfg_pkg.all;
use hp_lib.hp_pkg.all;


entity hit_processor is
    generic(
        radius      : integer; 
        tube_min    : integer;
        tube_max    : integer
    );
    port (
        clk                 : in std_logic;
        -- Control
        Reset_b             : in std_logic;
        enable              : in std_logic;
        -- SLc
        i_muonCand_data     : in hp_SLc_barrel_rt;
        -- MDT hit
        i_tdc_data          : in hp_hit_data_rt;
        i_tdc_valid         : in std_logic;
        -- to Segment finder
        o_segFinder_data    : out hp_2_sf_rt;
        o_data_valid        : out std_logic
    );
end entity hit_processor;

architecture beh of hit_processor is

    signal tdc_time_comp        : mdt_time_le_st;
    signal tdc_time_comp_valid  : std_logic;
    signal tdc_hitmatch_valid   : std_logic;
    signal tdc_paramcalc_valid  : std_logic;

begin
    
    T0_comp : entity hp_lib.hp_t0_comp
    generic map(
        radius      => radius,
        tube_min    => tube_min,
        tube_max    => tube_max
    )
    port map(
        clk                 => clk,
        -- Control
        Reset_b             => Reset_b,
        enable              => enable,
        -- MDT hit
        i_tdc_data          => i_tdc_data,
        i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_time_comp         => tdc_time_comp,
        o_data_valid        => tdc_time_comp_valid

    );

    HP_HM : entity hp_lib.hp_matching
    generic map(
        radius      => radius,
        tube_min    => tube_min,
        tube_max    => tube_max
    )
    port map(
        clk                 => clk,
        -- Control
        Reset_b             => Reset_b,
        enable              => enable,
        -- SLc
        i_SLc_z_pos         => i_muonCand_data.b_zpos,
        i_SLc_BCID          => i_muonCand_data.BCID,
        -- MDT hit
        i_tdc_layer         => i_tdc_data.layer,
        i_tdc_tube          => i_tdc_data.tube,
        i_tdc_time          => tdc_time_comp,
        i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_hit_valid         => o_segFinder_data.hit_valid,
        o_data_valid        => tdc_hitmatch_valid

    );

    HP_PC : entity hp_lib.hp_paramCalc
    generic map(
        radius      => radius,
        tube_min    => tube_min,
        tube_max    => tube_max
    )
    port map(
        clk                 => clk,
        -- Control
        Reset_b             => Reset_b,
        enable              => enable,
        -- SLc
        i_SLc_z_pos         => i_muonCand_data.b_zpos,
        i_SLc_phi           => i_muonCand_data.b_zpos,
        i_SLc_BCID          => i_muonCand_data.BCID,
        -- MDT hit
        i_tdc_layer         => i_tdc_data.layer,
        i_tdc_tube          => i_tdc_data.tube,
        i_tdc_pw            => i_tdc_data.time_pw,
        i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_segFinder_data    => o_segFinder_data.csf,
        o_data_valid        => tdc_paramcalc_valid

    );

    o_data_valid <= tdc_hitmatch_valid and tdc_paramcalc_valid;
    
    
end beh;

