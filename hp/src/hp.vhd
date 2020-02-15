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
use l0mdt_lib.cfg_pkg.all;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hit_processor is
    generic(
        t0                  : integer
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

    component hp_t0_comp is
        generic(
            t0 : integer -- 0.78 ns
        );
        port (
            clk                 : in std_logic;
            -- Control
            Reset_b             : in std_logic;
            enable              : in std_logic;
            -- MDT hit
            i_tdc_time          : in mdt_time_full; --0.78ns
            i_tdc_valid         : in std_logic;
            -- to matching
            o_time_comp         : out mdt_time_full; 
            o_data_valid        : out std_logic
        );
    end component hp_t0_comp;

    signal tdc_time_comp : mdt_time_full;

begin
    
    T0_comp : hp_t0_comp
    generic map(
        t0 => t0
    )
    port map(
        clk                 => clk,
        -- Control
        Reset_b             => Reset_b,
        enable              => enable,
        -- MDT hit
        i_tdc_time          => i_tdc_data.time_full,
        i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_time_comp         => tdc_time_comp,
        o_data_valid        => o_data_valid

    );

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

--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor T0 substraction
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      14/02/2019  0.1     File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.cfg_pkg.all;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_t0_comp is
    generic(
        t0 : integer -- 0.78 ns
    );
    port (
        clk                 : in std_logic;
        -- Control
        Reset_b             : in std_logic;
        enable              : in std_logic;
        -- MDT hit
        i_tdc_time          : in mdt_time_full; --0.78ns
        i_tdc_valid         : in std_logic;
        -- to matching
        o_time_comp         : out mdt_time_full; 
        o_data_valid        : out std_logic
    );
end entity hp_t0_comp;

architecture beh of hp_t0_comp is

begin

    t0_proc: process(clk)
    begin
        if not Reset_b then
            o_time_comp <= (others => '0');
        elsif rising_edge(clk) then

            o_time_comp <= to_unsigned(to_integer(i_tdc_time)-t0,22);
            
        end if;

    end process t0_proc;

end beh;