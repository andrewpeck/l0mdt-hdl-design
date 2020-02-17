--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor Hit Matching
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      07/02/2020  0.1     creation
--------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.cfg_pkg.all;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_matching is
    port (
        clk                 : in std_logic;
        -- Control
        Reset_b             : in std_logic;
        enable              : in std_logic;
        -- SLc
        i_SLc_z_pos         : in SLc_zpos_st;
        i_SLc_BCID          : in SLc_BCID_st;
        -- MDT hit
        i_tdc_layer         : in unsigned(mdt_layer_bits -1 downto 0);
        i_tdc_tube          : in unsigned(mdt_tube_bits - 1 downto 0);
        i_tdc_time          : in mdt_time_coarse;
        i_tdc_valid         : in std_logic;
        -- to Segment finder
        o_hit_valid         : out std_logic;
        o_data_valid        : out std_logic
    );
end entity hp_matching;

architecture beh of hp_matching is

begin
    
    
end beh;


