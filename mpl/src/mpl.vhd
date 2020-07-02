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
    rst             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_uCM2pl_av         : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
    o_pl2tf_av          : out pl2pt_avt(c_NUM_THREADS -1 downto 0);
    o_pl2mtc_av         : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity mpl;

architecture beh of mpl is

  signal pl2csw_av : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
  -- signal pl2plcsw_av : pipelines_avt(c_NUM_THREADS -1 downto 0);
  signal csw2pt_av : pl2pt_avt(c_NUM_THREADS -1 downto 0);
  signal csw2mtc_av : pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);
  
begin

  MPL_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => MPL_PL_A_LATENCY,
      num_bits    => i_uCM2pl_av(sl_i)'length
    )
    port map(
      clk         => clk,
      rst     => rst,
      glob_en     => glob_en,
      --
      i_data      => i_uCM2pl_av(sl_i),
      o_data      => pl2csw_av(sl_i)
    );
  end generate;

  PL_CSW : entity mpl_lib.mpl_csw
  port map(
    clk                 => clk,
    rst             => rst,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_ucm_av       => pl2csw_av,
    o_tf_av       => o_pl2tf_av,
    o_mtc_av      => csw2mtc_av 
  );

  MPL_B : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => MPL_PL_B_LATENCY,
      num_bits    => csw2mtc_av(sl_i)'length
    )
    port map(
      clk         => clk,
      rst     => rst,
      glob_en     => glob_en,
      --
      i_data      => csw2mtc_av(sl_i),
      o_data      => o_pl2mtc_av(sl_i)
    );
  end generate;

  -- PL2CSW : for sl_i in c_NUM_THREADS -1 downto 0 generate
  --   pl2plcsw_av(sl_i) <= pl2csw_av((c_MAX_NUM_SL - 1) - ((c_NUM_THREADS - 1) - sl_i));
  -- end generate;
  
  
  
end architecture beh;













