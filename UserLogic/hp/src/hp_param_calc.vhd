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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_paramCalc is
  generic(
    g_STATION_RADIUS    : integer
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- SLc
    -- i_SLC_RoI_org       : in unsigned(MDT_TUBE_LEN-1 downto 0);
    i_SLc_data_v        : in std_logic_vector(HP_HEG2HP_SLC_LEN-1 downto 0);
    -- i_SLc_BCID          : in unsigned(BCID_LEN-1 downto 0);
    -- MDT hit
    i_mdt_time_real     : in unsigned(MDT_TIME_LEN-1 downto 0);
    i_global_z             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_global_x             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    -- i_mdt_x             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_mdt_layer         : in unsigned(MDT_LAYER_LEN -1 downto 0);
    i_data_valid        : in std_logic;
    -- to Segment finder
    -- o_params_r      : out hp_hp2sf_data_rt;
    o_tube_radius       : out unsigned(MDT_RADIUS_LEN -1 downto 0);
    o_local_y           : out unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
    o_local_x           : out unsigned(MDT_LOCAL_X_LEN-1 downto 0);
    o_ml                : out std_logic;
    o_data_valid        : out std_logic
  );
end entity hp_paramCalc;

architecture beh of hp_paramCalc is

  signal barrel_data_r : hp_heg2hp_slc_b_rt;

  signal SLc_data_r : hp_heg2hp_slc_rt;

  signal pl_local_y : unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
  signal pl_local_x : unsigned(MDT_LOCAL_X_LEN-1 downto 0);
  signal pl_ml : std_logic;
  signal pl_local_dv : std_logic;

  signal radius_dv  : std_logic;
  signal local_dv   : std_logic;

begin

  SLc_data_r <= structify(i_SLc_data_v);

  SLC_B_GEN: if c_ST_nBARREL_ENDCAP = '0' generate
    barrel_data_r <= structify(SLc_data_r.specific);
  end generate;

  HP_CALC_R : entity hp_lib.hp_calc_radius
  generic map(
    g_STATION_RADIUS     => g_STATION_RADIUS
  )
  port map(
    clk             => clk,
    rst             => rst,
    glob_en         => glob_en,

    i_SLc_BCID      => SLc_data_r.bcid,
    i_mdt_time_t0   => i_mdt_time_real,
    i_data_valid    => i_data_valid,

    o_tube_radius   => o_tube_radius,
    o_data_valid    => radius_dv
  );

  HP_CALC_V : entity hp_lib.hp_calc_RoI_vect
  generic map(
    g_STATION_RADIUS     => g_STATION_RADIUS
  )
  port map(
    clk             => clk,
    rst             => rst,
    glob_en         => glob_en,
    -- SLc
    -- i_SLC_RoI_org   => i_SLC_RoI_org,
    -- i_SLc_z_0       => barrel_data_r.z_0,
    -- i_SLc_y_0       =>
    -- mdt
    -- i_mdt_x          => i_mdt_x,  
    -- i_mdt_layer     => i_mdt_layer,
    i_cw_org_x      => barrel_data_r.roi_x,
    i_cw_org_z      => barrel_data_r.roi_z,
    i_cw_dv         => SLc_data_r.data_valid,
    i_global_z      => i_global_z,
    i_global_x      => i_global_x,
    i_data_valid    => i_data_valid,
    -- to Segment finder
    o_local_y       => pl_local_y,  
    o_local_x       => pl_local_x,  
    o_data_valid    => pl_local_dv

  );

  o_data_valid <= local_dv and radius_dv;
  
  ML_CALC: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        
      else

        o_local_y <= pl_local_y;
        o_local_x <= pl_local_x;
        local_dv <= pl_local_dv;
        
        o_ml <= pl_ml;

        if i_data_valid = '1' then
          if g_STATION_RADIUS = 0 then
            if i_mdt_layer < 4 then
              pl_ml <= '0';
            else
              pl_ml <= '1';
            end if;
          else
            if i_mdt_layer < 3 then
              pl_ml <= '0';
            else
              pl_ml <= '1';
            end if;
          end if;
        else
          pl_ml <= '0';
        end if;
        
      end if;
    end if;
  end process ML_CALC;

end beh;

