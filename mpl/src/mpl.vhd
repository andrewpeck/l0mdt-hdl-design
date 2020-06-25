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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library mpl_lib;
use mpl_lib.mpl_pkg.all;


entity mpl is

  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_uCM2pl_av         : in pipelines_avt(c_MAX_NUM_SL -1 downto 0);
    o_pl2tf_av          : out pipelines_avt(c_NUM_THREADS -1 downto 0);
    o_pl2mtc_av         : out pipelines_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity mpl;

architecture beh of mpl is

  signal pl2pl_av : pipelines_avt(c_MAX_NUM_SL -1 downto 0);
  -- signal pl2plcsw_av : pipelines_avt(c_NUM_THREADS -1 downto 0);
  signal pl2plcsw_av : pipelines_avt(c_NUM_THREADS -1 downto 0);
  
begin

  MPL_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => MPL_PL_A_LATENCY,
      num_bits    => i_uCM2pl_av(sl_i)'length
    )
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => i_uCM2pl_av(sl_i),
      o_data      => pl2pl_av(sl_i)
    );
  end generate;

  PL_CSW : entity mpl_lib.mpl_csw
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_pl2plcsw_av       => pl2plcsw_av,
    o_plcsw2tf_av       => o_pl2tf_av
  );

  MPL_B : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => MPL_PL_B_LATENCY,
      num_bits    => pl2pl_av(sl_i)'length
    )
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => pl2pl_av(sl_i),
      o_data      => o_pl2mtc_av(sl_i)
    );
  end generate;

  PL2CSW : for sl_i in c_NUM_THREADS -1 downto 0 generate
    pl2plcsw_av(sl_i) <= pl2pl_av((c_MAX_NUM_SL - 1) - ((c_NUM_THREADS - 1) - sl_i));
  end generate;
  
  
  
end architecture beh;













