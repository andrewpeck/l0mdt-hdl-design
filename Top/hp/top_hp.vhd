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

library l0mdt_lib;
use l0mdt_lib.cfg_pkg.all;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;


entity top_hp is
    Generic(
        datawidth : integer := 64
    );
    Port(
        -- system signals
        clk                     : in std_logic;
        -- Control
        Reset_b                 : in std_logic;
        enable                  : in std_logic;
        -- SLc
        i_muonCand_data         : in hp_SLc_barrel_rt;
        -- MDT hit
        i_tdc_data              : in hp_hit_data_rt;
        i_tdc_valid             : in std_logic;
        -- to Segment finder
        o_data_2_sf             : out hp_2_sf_rt;
        o_data_valid            : out std_logic
    );
end top_hp;

architecture beh of top_hp is



begin

    Ht_Processor : entity hp_lib.hit_processor
    port map(
        clk                 => clk,
        -- Control
        Reset_b             => Reset_b,
        enable              => enable,
        -- SLc
        i_muonCand_data     => i_muonCand_data,
        -- MDT hit
        i_tdc_data          => i_tdc_data,
        i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_segFinder_data    => o_data_2_sf,
        o_data_valid        => o_data_valid
    );

end beh;





