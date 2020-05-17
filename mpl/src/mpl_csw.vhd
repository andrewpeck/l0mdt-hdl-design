--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Main pipe line cross switch to track fitter
--  Description: 
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library mpl_lib;


entity mpl_csw is

  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_pl2plcsw_av          : in pipelines_avt(NUM_THREADS -1 downto 0);
    o_plcsw2tf_av          : out pipelines_avt(NUM_THREADS -1 downto 0)
  );
end entity mpl_csw;

architecture beh of mpl_csw is
  
begin
  
  
  
end architecture beh;

