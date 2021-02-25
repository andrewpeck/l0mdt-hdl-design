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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_calc_RoI_vect is
  generic(
    g_STATION_RADIUS     : integer
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- SLc
    -- i_SLC_RoI_org       : in unsigned(MDT_TUBE_LEN-1 downto 0);
    i_SLc_z_0           : in unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    -- i_SLc_y_0           : in signed();
    -- mdt
    -- i_mdt_x             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_mdt_layer         : in unsigned(MDT_LAYER_LEN -1 downto 0);
    i_mdt_z             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_data_valid        : in std_logic;
    -- to Segment finder
    o_local_y           : out unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
    o_local_x           : out unsigned(MDT_LOCAL_X_LEN-1 downto 0);
    o_data_valid        : out std_logic
  );
end entity hp_calc_RoI_vect;

architecture beh of hp_calc_RoI_vect is
  signal orig_x : unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
begin

  pw_2_r_LUT : process(clk,rst)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        o_local_x <= (others => '0');
        o_local_y <= (others => '0');
      else

        o_data_valid <= i_data_valid;

        if i_data_valid = '1' then
          o_local_y <= get_b_layer_height(g_STATION_RADIUS,to_integer(i_mdt_layer));
          o_local_x <= resize(i_mdt_z - i_SLc_z_0,MDT_LOCAL_Y_LEN);
        else
          o_local_x <= (others => '0');
          o_local_y <= (others => '0');
        end if;
        
      end if;

    end if ;
  end process;

end architecture beh;