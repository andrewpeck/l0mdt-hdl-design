--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor Segment finder parameter calculation
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      18/02/2020  0.1     File Creation
--------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.cfg_pkg.all;
use hp_lib.hp_pkg.all;
use hp_lib.hp_trLUT_s3_pkg.all;

entity hp_paramCalc is
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
        i_SLc_z_pos         : in SLc_zpos_st;
        i_SLc_phi           : in SLc_zpos_st;
        i_SLc_BCID          : in SLc_BCID_st;
        -- MDT hit
        i_tdc_layer         : in unsigned(mdt_layer_bits -1 downto 0);
        i_tdc_tube          : in unsigned(mdt_tube_bits - 1 downto 0);
        i_tdc_let0          : in mdt_time_le_st;
        -- i_tdc_valid         : in std_logic;
        -- to Segment finder
        o_segFinder_data    : out hp_2_sf_csf_rt
        -- o_data_valid        : out std_logic
    );
end entity hp_paramCalc;

architecture beh of hp_paramCalc is

    component hp_pc_dtr_LUT is
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
            i_SLc_BCID          : in SLc_BCID_st;
            -- MDT hit
            i_tdc_let0          : in mdt_time_le_st;
            -- i_tdc_valid         : in std_logic;
            -- to matching
            o_tube_radius       : out unsigned(csf_r_width-1 downto 0)
            -- o_data_valid        : out std_logic
        );
    end component hp_pc_dtr_LUT;

begin

    HP_DT2R : hp_pc_dtr_LUT
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
        i_SLc_BCID          => i_SLc_BCID,
        -- MDT hit
        i_tdc_let0          => i_tdc_let0,
        -- i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_tube_radius       => o_segFinder_data.r
        -- o_data_valid        => o_data_valid
    );

end beh;



--------------------------------------------------------------------------------
--  Project     : ATLAS L0MDT Trigger 
--  Module      : Hit Processor Parameter Calculator
--  SubModule   : DT-R LUT
--  Description :
--
--------------------------------------------------------------------------------
--  Revisions:
--      07/02/2020  0.1     creation
--------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library l0mdt_lib;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.cfg_pkg.all;
use hp_lib.hp_pkg.all;
use hp_lib.hp_dtr_lut_rom.all;

entity hp_pc_dtr_LUT is
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

        -- i_TimeWindow        : in std
        -- SLc
        i_SLc_BCID          : in SLc_BCID_st;
        -- MDT hit
        i_tdc_let0          : in mdt_time_le_st;
        -- i_tdc_valid         : in std_logic;
        -- to matching
        o_tube_radius       : out unsigned(csf_r_width-1 downto 0)
        -- o_data_valid        : out std_logic
    );
end entity hp_pc_dtr_LUT;

architecture beh of hp_pc_dtr_LUT is

        signal drift_time : mdt_time_le_st;

begin

    drift_time <= i_tdc_let0 - i_SLc_BCID;

    pw_2_r_LUT : process(clk,Reset_b)

    begin
        if not Reset_b then
            o_tube_radius <= (others => '0');
            -- o_data_valid <= '1';
        elsif rising_edge(clk) then
            o_tube_radius <= to_unsigned(dtr_rom_mem(radius)(to_integer(drift_time)),csf_r_width);
            -- o_data_valid <= i_tdc_valid;
        end if ;
    end process;
    
    
end beh;