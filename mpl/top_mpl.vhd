--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Main pipe line
--  Description: pipelines between UCM - TF - MTC
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
use mpl_lib.mpl_pkg.all;


entity top_mpl is

  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_uCM2pl_av         : in pipelines_avt(MAX_NUM_SL -1 downto 0);
    o_pl2tf_av          : out pipelines_avt(NUM_THREADS -1 downto 0);
    o_pl2mtc_av         : out pipelines_avt(MAX_NUM_SL -1 downto 0)
  );
end entity top_mpl;

architecture beh of top_mpl is
  
begin

  MPL : entity mpl_lib.mpl
  port map(
    clk             => clk,
    Reset_b         => Reset_b,
    glob_en         => glob_en,

    i_uCM2pl_av     => i_uCM2pl_av,
    o_pl2tf_av      => o_pl2tf_av,
    o_pl2mtc_av     => o_pl2mtc_av
  );
  
  
  
end architecture beh;