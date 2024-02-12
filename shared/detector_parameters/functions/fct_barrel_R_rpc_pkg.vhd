--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: functions
-- File: fct_barrel_R_rpc_pkg.vhd
-- Module: fct_barrel_R_rpc_pkg
-- File PATH: /fct_barrel_R_rpc_pkg.vhd
-- -----
-- File Created: Tuesday, 4th April 2023 6:21:03 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 4th April 2023 6:23:13 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.common_constants_pkg.all;
-- use shared_lib.detector_param_pkg.all;

library dp_repo_lib;
use dp_repo_lib.barrel_R_rpc_pkg.all;

package fct_barrel_R_rpc_pkg is



  type barrel_R_rpc_avt is array (0 to 31) of std_logic_vector(SLC_Z_RPC_LEN - 1 downto 0);

  -- type barrel_R_rpc_aft is array (0 to 31 ) of real;
  -- type barrel_R_rpc_layer_aft is array (0 to 1) of barrel_R_rpc_aft;
  -- type barrel_R_rpc_side_aft is array ( 0 to 15) of barrel_R_rpc_layer_aft;
  -- type barrel_R_rpc_detector_aft is array ( 0 to 1) of barrel_R_rpc_side_aft;


  function get_barrel_R_rpc( sector_id, side_id , station , layer : integer; mult : real; out_width , num : integer) return barrel_R_rpc_avt ;

end package fct_barrel_R_rpc_pkg;

package body fct_barrel_R_rpc_pkg is
  
  function get_barrel_R_rpc( sector_id, side_id , station , layer : integer; mult : real; out_width , num : integer) return barrel_R_rpc_avt is
    variable y : barrel_R_rpc_avt;
  begin
    case station is
      when 0 =>
        for phi_i in  0 to num -1 loop
          y(phi_i) := std_logic_vector(to_unsigned(integer(barrel_INN_R_rpc_detector(side_id)(sector_id - 1)(layer)(phi_i) * mult) , out_width));
        end loop;
      when 1 =>
          for phi_i in  0 to num -1 loop
            y(phi_i) := std_logic_vector(to_unsigned(integer(barrel_MID_R_rpc_detector(side_id)(sector_id - 1)(layer)(phi_i) * mult) , out_width));
          end loop;
      when 2 =>
        for phi_i in  0 to num -1 loop
          y(phi_i) := std_logic_vector(to_unsigned(integer(barrel_OUT_R_rpc_detector(side_id)(sector_id - 1)(layer)(phi_i) * mult) , out_width));
        end loop;
      -- when 3 =>
      --     for phi_i in  0 to num -1 loop
      --       -- y(phi_i) := std_logic_vector(to_unsigned(integer(barrel_INN_R_rpc_detector(side_id)(sector_id - 1)(layer)(phi_i) * mult) , out_width));
      --     end loop;
    
      when others =>
          y := (others => (others => '1'));
        
    
    end case;

    return y;
  end function;

  
end package body fct_barrel_R_rpc_pkg;