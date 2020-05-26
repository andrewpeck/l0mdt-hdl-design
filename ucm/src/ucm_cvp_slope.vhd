--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor
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
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_cvp_slope is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    i_data_v            : in ucm_prepro_rvt;
    o_ucm2hps_av        : out unsigned(UCM_MBAR_LEN-1 downto 0)
    
  );
end entity ucm_cvp_slope;

architecture beh of ucm_cvp_slope is
  
begin

  slope: process(clk)
  begin
    if rising_edge(clk) then
      if Reset_b = '1' then
        
      else
        
      end if;
    end if;
  end process slope;
  
  
  
end architecture beh;