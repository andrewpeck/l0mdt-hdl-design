--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor slope calculator
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_cvp_slope is
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    glob_en       : in std_logic;
    --
    i_data_v      : in std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    i_data_valid  : in std_logic;
    o_slope       : out signed(UCM_MBAR_LEN-1 downto 0);
    o_data_valid  : out std_logic
    
  );
end entity ucm_cvp_slope;

architecture beh of ucm_cvp_slope is
  
  signal barrel_r   : slc_barrel_rt;

  signal sum_xt : signed(UCM_Z_ROI_LEN*2 +4 -1 downto 0);
  
begin

  BARREL: if ST_nBARREL_ENDCAP = '0' generate

    barrel_r <= structify(i_data_v);

    slope: process(clk)
    begin
      if rising_edge(clk) then
        if rst= '1' then
          
        else
          if i_data_valid = '1' then
            -- sum_xt <= (barrel_r.z_rpc_0 * PHY_BARREL_R0) + 
            --           (barrel_r.z_rpc_1 * PHY_BARREL_R1) + 
            --           (barrel_r.z_rpc_2 * PHY_BARREL_R2) + 
            --           (barrel_r.z_rpc_3 * PHY_BARREL_R3);

          end if;



          
        end if;
      end if;
    end process slope;
    
  end generate BARREL;


  
  
  
end architecture beh;