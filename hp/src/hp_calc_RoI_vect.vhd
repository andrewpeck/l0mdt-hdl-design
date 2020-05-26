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
use shared_lib.config_pkg.all;
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
    i_SLc_z_0           : in unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    -- i_SLc_y_0           : in signed();
    -- mdt
    i_mdt_y             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_mdt_z             : in unsigned(MDT_GLOBAL_AXI_LEN -1 downto 0);
    i_data_valid        : in std_logic;
    -- to Segment finder
    o_local_y           : out unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    o_local_z           : out signed(MDT_LOCAL_AXI_LEN-1 downto 0)
    -- o_data_valid        : out std_logic
  );
end entity hp_calc_RoI_vect;

architecture beh of hp_calc_RoI_vect is
  
begin

  pw_2_r_LUT : process(clk,Reset_b)

  begin
    if rising_edge(clk) then
      if Reset_b = '1' then

      else

      end if;
      
    end if ;
  end process;

end architecture beh;