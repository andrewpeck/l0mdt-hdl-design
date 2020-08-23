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
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_uCM2pl_av         : in ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);
    o_pl2tf_av          : out pl2pt_bus_avt(c_NUM_THREADS -1 downto 0);
    o_pl2mtc_av         : out pl2mtc_bus_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity mpl;

architecture beh of mpl is
  
  -- signal pl1out_av : ucm2pl_bus_at(c_MAX_NUM_SL -1 downto 0);
  signal main_pl_out_av : ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);
  signal pl2pt_av       : pl2pt_bus_avt(c_NUM_THREADS -1 downto 0);
  signal pl2mtc_av      : pl2mtc_bus_avt(c_MAX_NUM_SL -1 downto 0);

  signal main_pl_out_ar : ucm2pl_bus_at(c_MAX_NUM_SL -1 downto 0);
  signal pl2pt_ar : pl2pt_bus_at(c_NUM_THREADS -1 downto 0);
  signal pl2mtc_ar : pl2mtc_bus_at(c_MAX_NUM_SL -1 downto 0);
  
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
      o_data      => main_pl_out_av(sl_i)
    );
  end generate;

  PL_CSW : entity mpl_lib.mpl_csw
  port map(
    clk                 => clk,
    rst             => rst,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_ucm_av       => pl2pt_av,
    o_tf_av       => o_pl2tf_av
    -- o_mtc_av      => pl2mtc_av 
  );

  MPL_B : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => MPL_PL_B_LATENCY,
      num_bits    => pl2mtc_av(sl_i)'length
    )
    port map(
      clk         => clk,
      rst     => rst,
      glob_en     => glob_en,
      --
      i_data      => pl2mtc_av(sl_i),
      o_data      => o_pl2mtc_av(sl_i)
    );
  end generate;

  PL_2_TF : for c_i in c_NUM_THREADS -1 downto 0 generate
    pl2pt_ar(c_i).muid <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).muid;
    pl2pt_ar(c_i).process_ch <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).process_ch;
    pl2pt_ar(c_i).processed <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).processed;
    pl2pt_ar(c_i).data_valid <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).data_valid;
  end generate;

  PL_2_MTC : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    pl2mtc_ar(sl_i).common <= main_pl_out_ar(sl_i).common;
    pl2mtc_ar(sl_i).process_ch <= main_pl_out_ar(sl_i).process_ch;
    pl2mtc_ar(sl_i).processed <= main_pl_out_ar(sl_i).processed;
    pl2mtc_ar(sl_i).data_valid <= main_pl_out_ar(sl_i).data_valid;
  end generate;
  
  pl2pt_av <= vectorify(pl2pt_ar);
  pl2mtc_av <= vectorify(pl2mtc_ar);
  main_pl_out_ar <= structify(main_pl_out_av);
  
end architecture beh;













