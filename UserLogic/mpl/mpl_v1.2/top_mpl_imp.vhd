--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Main pipe line Top with ser/des to force synth
--  Description: pipelines between UCM - TF - MTC
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;


entity top_mpl is

  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- AXI to SoC
    ctrl_b                : in  std_logic;
    mon_b                 : out std_logic;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_uCM2pl_ab         : in std_logic_vector(c_MAX_NUM_SL -1 downto 0);
    o_pl2tf_ab          : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_pl2mtc_ab         : out std_logic_vector(c_MAX_NUM_SL -1 downto 0)
  );
end entity top_mpl;

architecture beh of top_mpl is

  signal ctrl_r              : MPL_CTRL_t;
  signal mon_r               : MPL_MON_t;
  signal ctrl_v            : std_logic_vector(MPL_CTRL_t'w -1 downto 0);
  signal mon_v             : std_logic_vector(MPL_MON_t'w -1 downto 0);

  signal i_uCM2pl_av         : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
  signal o_pl2tf_av          : pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
  signal o_pl2mtc_av         : pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);

  begin

  ctrl : entity shared_lib.vhdl_utils_deserializer 
  generic map (g_DATA_WIDTH => MPL_CTRL_t'w) 
  port map(clk => clk,rst => rst,i_data => ctrl_b,o_data => ctrl_v);
  mon_b <= xor_reduce(mon_v);
  --------------------------------------------------------------
  slc_mp: for i_h in c_MAX_NUM_SL - 1 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => i_uCM2pl_av(i_h)'length)port map(clk => clk,rst  => rst,i_data => i_uCM2pl_ab(i_h),o_data => i_uCM2pl_av(i_h));
    -- i_slc_data_mainA(i_h) <= i_slc_data_mainA_av(i_h);
  end generate;
  --------------------------------------------------------------
  pl2pt: for i_th in c_NUM_THREADS - 1 downto 0 generate
    o_pl2tf_ab(i_th) <= xor_reduce(o_pl2tf_av(i_th));
  end generate;
  pl2mtc: for i_th in c_MAX_NUM_SL - 1 downto 0 generate
    o_pl2mtc_ab(i_th) <= xor_reduce(o_pl2mtc_av(i_th));
  end generate;


  MPL : entity mpl_lib.mpl
  port map(
    clk             => clk,
    rst             => rst,
    glob_en         => glob_en,
    --
    ctrl_v              => ctrl_v,
    mon_v               => mon_v,
    --
    i_uCM2pl_av     => i_uCM2pl_av,
    o_pl2ptcalc_av  => o_pl2tf_av,
    o_pl2mtc_av     => o_pl2mtc_av
  );
  
  
  
end architecture beh;
