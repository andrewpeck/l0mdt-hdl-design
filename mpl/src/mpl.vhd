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

  signal i_uCM2pl_ar  : ucm2pl_bus_at(c_MAX_NUM_SL -1 downto 0);

  -- signal pl1out_av : ucm2pl_bus_at(c_MAX_NUM_SL -1 downto 0);
  signal main_pl_out_av : ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);
  signal pl2pt_av       : mpl2csw_ptcalc_bus_avt(c_NUM_THREADS -1 downto 0);
  signal pl2mtc_av      : pl2mtc_bus_avt(c_MAX_NUM_SL -1 downto 0);

  signal main_pl_out_ar : ucm2pl_bus_at(c_MAX_NUM_SL -1 downto 0);
  signal pl2pt_ar : mpl2csw_ptcalc_bus_at(c_NUM_THREADS -1 downto 0);
  signal pl2mtc_ar : pl2mtc_bus_at(c_MAX_NUM_SL -1 downto 0);

begin

  MPL_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate

    i_uCM2pl_ar(sl_i) <= structify(i_uCM2pl_av(sl_i));

    PL : entity shared_lib.std_pipeline
    generic map(
      g_MEMORY_TYPE     => "ultra",
      g_PIPELINE_TYPE   => "mpcvmem",
      g_DELAY_CYCLES    => c_MPL_PL_A_LATENCY,
      g_PIPELINE_WIDTH  => i_uCM2pl_av(sl_i)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => glob_en,
      --
      i_data      => i_uCM2pl_av(sl_i),
      i_dv        => i_uCM2pl_ar(sl_i).data_valid,
      o_data      => main_pl_out_av(sl_i)
    );
    
  end generate;

  PL_CSW : entity mpl_lib.mpl_csw
  port map(
    clk                 => clk,
    rst                 => rst,
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
      g_DELAY_CYCLES      => MPL_PL_B_LATENCY,
      g_PIPELINE_WIDTH    => pl2mtc_av(sl_i)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => glob_en,
      --
      i_data      => pl2mtc_av(sl_i),
      o_data      => o_pl2mtc_av(sl_i)
    );
  end generate;

  PL_2_TF : for c_i in c_NUM_THREADS -1 downto 0 generate
    -- muid
    pl2pt_ar(c_i).muid.slcid        <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.slcid;
    pl2pt_ar(c_i).muid.slid         <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.trailer.slid;
    pl2pt_ar(c_i).muid.bcid         <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.header.bcid;
    -- proc control
    pl2pt_ar(c_i).process_ch        <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).process_ch;
    pl2pt_ar(c_i).busy              <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).busy;
    pl2pt_ar(c_i).data_valid        <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).data_valid;
    -- data
    pl2pt_ar(c_i).phimod            <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).phimod;
    pl2pt_ar(c_i).sl_charge         <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).common.sl_charge;
    pl2pt_ar(c_i).nswseg_poseta     <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).nswseg_poseta;
    pl2pt_ar(c_i).nswseg_posphi     <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).nswseg_posphi;
    pl2pt_ar(c_i).nswseg_angdtheta  <= main_pl_out_ar(c_MAX_NUM_SL - ((c_NUM_THREADS - 1) - c_i) - 1).nswseg_angdtheta;
  end generate;

  PL_2_MTC : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    pl2mtc_ar(sl_i).common <= main_pl_out_ar(sl_i).common;
    pl2mtc_ar(sl_i).process_ch <= main_pl_out_ar(sl_i).process_ch;
    pl2mtc_ar(sl_i).busy <= main_pl_out_ar(sl_i).busy;
    pl2mtc_ar(sl_i).data_valid <= main_pl_out_ar(sl_i).data_valid;
  end generate;

  pl2pt_av <= vectorify(pl2pt_ar);
  pl2mtc_av <= vectorify(pl2mtc_ar);
  main_pl_out_ar <= structify(main_pl_out_av);

end architecture beh;
