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
--      26/11/2019  0.1     File created
--      05/02/2020  0.11    Change name and structure to Hit processor as the diagram
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hit_processor is
    port (
        clk             : in std_logic;
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

begin

    HP_HM : entity hp_lib.hp_matching
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
        i_tdc_time          => i_tdc_data.time_full,
        i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_hit_valid         => o_segFinder_data.hit_valid,
        o_data_valid        => o_data_valid

    );
    
    
end beh;