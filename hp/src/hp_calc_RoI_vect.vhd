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

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
use hp_lib.hp_trLUT_s3_pkg.all;

entity hp_paramCalc is
    generic(
        radius      : integer
        -- tube_min    : integer;
        -- tube_max    : integer
    );
    port (
        clk                 : in std_logic;
        
        Reset_b             : in std_logic;
        glob_en             : in std_logic;
        -- SLc
        i_SLc_z_pos         : in SLc_zpos_st;
        i_SLc_phi           : in SLc_zpos_st;
        i_SLc_BCID          : in SLc_BCID_st;
        -- MDT hit
        i_mdt_layer         : in unsigned(MDT_LAYER_WIDTH -1 downto 0);
        i_mdt_tube          : in unsigned(MDT_TUBE_WIDTH - 1 downto 0);
        i_mdt_time_real     : in mdt_time_le_st;
        -- i_tdc_valid         : in std_logic;
        -- to Segment finder
        o_segFinder_data    : out hp2sf_csf_rt
        -- o_data_valid        : out std_logic
    );
end entity hp_paramCalc;

architecture beh of hp_paramCalc is

    component hp_pc_dtr_LUT is
        generic(
            radius      : integer
            -- tube_min    : integer;
            -- tube_max    : integer
        );
        port (
            clk                 : in std_logic;
            
            Reset_b             : in std_logic;
            glob_en             : in std_logic;
            -- SLc
            i_SLc_BCID          : in SLc_BCID_st;
            -- MDT hit
            i_mdt_time_real     : in mdt_time_le_st;
            -- i_tdc_valid         : in std_logic;
            -- to matching
            o_tube_radius       : out unsigned(csf_r_width-1 downto 0)
            -- o_data_valid        : out std_logic
        );
    end component hp_pc_dtr_LUT;

begin

    HP_DT2R : hp_pc_dtr_LUT
    generic map(
        radius      => radius
        -- tube_min    => tube_min,
        -- tube_max    => tube_max
    )
    port map(
        clk                 => clk,
        
        Reset_b             => Reset_b,
        glob_en             => glob_en,
        -- SLc
        i_SLc_BCID          => i_SLc_BCID,
        -- MDT hit
        i_mdt_time_real     => i_mdt_time_real,     
        -- i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_tube_radius       => o_segFinder_data.r
        -- o_data_valid        => o_data_valid
    );

end beh;


--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor 
--          drift time - radius
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      14/02/2019  0.1     File created
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_calc_RoI_vect is
  generic(
    radius      : integer
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- SLc
    i_SLc_z_0           : in signed();
    i_SLc_y_0           : in signed();

    i_mdt_y             : in signed(MDT_Z_WIDTH -1 downto 0);
    i_mdt_z             : in signed(MDT_Z_WIDTH -1 downto 0);
    -- i_tdc_valid         : in std_logic;
    -- to Segment finder
    o_local_y           : out signed();
    o_local_z           : out signed()  
    -- o_data_valid        : out std_logic
  );
end entity hp_calc_RoI_vect;

architecture beh of hp_calc_RoI_vect is
  
begin

  pw_2_r_LUT : process(clk,Reset_b)

  begin
    if Reset_b = '0' then

    elsif rising_edge(clk) then
      
    end if ;
  end process;

end architecture beh;