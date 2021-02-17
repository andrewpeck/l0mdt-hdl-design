--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: phimod calculator
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;

 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_ctrl_mon is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;
    ttc_commands            : in l0mdt_ttc_rt;
    -- configuration, control & Monitoring
    ctrl                    : in  UCM_CTRL_t;
    mon                     : out UCM_MON_t;
    --

  );
end entity ucm_ctrl_mon;

architecture beh of ucm_ctrl_mon is
  
begin

--   CZ0 : process(clk)
-- begin
--   if rising_edge(clk) then
--     if rst = '1' then
--       CHAMBER_Z0_CALC_RD.RST_REQ <= '0';
--     else
--       if CHAMBER_Z0_CALC_WR.ADDR = x"00" then
--       else
--         CHAMBER_Z0_CALC_RD.VALUE <= std_logic_vector(chamber_z_org_a(to_integer(unsigned(CHAMBER_Z0_CALC_WR.ADDR))));
--         if CHAMBER_Z0_CALC_WR.WR_EN = '1' then
--           CHAMBER_Z0_CALC_RD.RST_REQ <= '1';
--           chamber_z_org_a(to_integer(unsigned(CHAMBER_Z0_CALC_WR.ADDR))) <= unsigned(CHAMBER_Z0_CALC_WR.VALUE);
--         end if;
--       end if;
      
--     end if;
--   end if;
-- end process;
  

end architecture beh;