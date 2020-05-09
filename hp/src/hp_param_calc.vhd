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
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_paramCalc is
  generic(
    radius      : integer
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- SLc
    i_SLc_specific      : in std_logic_vector(HP_HEG2HP_SPECIFIC_LEN-1 downto 0);
    i_SLc_BCID          : in unsigned(BCID_LEN-1 downto 0);
    -- MDT hit
    i_mdt_time_real     : in unsigned(MDT_TIME_LEN-1 downto 0);
    i_mdt_z             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_mdt_y             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_data_valid         : in std_logic;
    -- to Segment finder
    o_tube_radius       : out unsigned(MDT_RADIUS_LEN -1 downto 0);
    o_local_y           : out unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    o_local_z           : out signed(MDT_LOCAL_AXI_LEN-1 downto 0)
    -- o_data_valid        : out std_logic
  );
end entity hp_paramCalc;

architecture beh of hp_paramCalc is

    signal barrel_data_r : hp_heg2hp_slc_b_rt;

    signal radius_dv : std_logic;

begin
  SLC_B_GEN: if ST_nBARREL_ENDCAP = '0' generate
    barrel_data_r <= structify(i_SLc_specific);
  end generate;

  HP_CALC_R : entity hp_lib.hp_calc_radius
  generic map(
    radius      => radius
  )
  port map(
    clk             => clk,
    Reset_b         => Reset_b,
    glob_en         => glob_en,

    i_SLc_BCID      => i_SLc_BCID,
    i_mdt_time_t0   => i_mdt_time_real,
    i_data_valid     => i_data_valid,
        
    o_tube_radius   => o_tube_radius,
    o_data_valid    => radius_dv
  );

  HP_CALC_V : entity hp_lib.hp_calc_RoI_vect
  generic map(
    radius      => radius
  )
  port map(
    clk             => clk,
    Reset_b         => Reset_b,
    glob_en         => glob_en,
    -- SLc
    i_SLc_z_0       => barrel_data_r.z_0,
    -- i_SLc_y_0       =>    
    -- mdt
    i_mdt_y          => i_mdt_y,  
    i_mdt_z          => i_mdt_z,
    i_data_valid     => i_data_valid,
    -- to Segment finder
    o_local_y        => o_local_y,  
    o_local_z        => o_local_z  

  );

end beh;

