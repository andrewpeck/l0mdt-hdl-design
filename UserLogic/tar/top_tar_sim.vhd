--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
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

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.tar_CTRL.all;


entity top_tar_tb is
  generic (
    PRJ_INFO            : string  := "BA3";
    IN_SLC_FILE         : string  := "slc_A3_Barrel.csv";
    IN_HIT_FILE         : string  := "csm_A3_Barrel.csv";
    -- OUT_HEG_BM_SLC_FILE : string  := "hps_heg_bm_slc_A3_Barrel_yt_v04.csv";
    -- OUT_HEG_BM_HIT_FILE : string  := "hps_heg_bm_hit_A3_Barrel_yt_v04.csv";
    -- OUT_PTIN_SF_FILE    : string  := "pt_in_sf_A3_Barrel_yt_v04.csv";
    -- OUT_PTIN_MPL_FILE   : string  := "pt_in_mpl_A3_Barrel_yt_v04.csv";
    -- OUT_MTCIN_PT_FILE   : string  := "mtc_in_pt_A3_Barrel_yt_v04.csv";
    -- OUT_MTCIN_MPL_FILE  : string  := "mtc_in_mpl_A3_Barrel_yt_v04.csv";
    DUMMY               : boolean := false
    );
end entity top_tar_tb;

architecture beh of top_tar_tb is

  -- signal o_tar2hps_inn_av      : tar2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- signal o_tar2hps_mid_av      : tar2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- signal o_tar2hps_out_av      : tar2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- signal o_tar2hps_ext_av      : tar2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- -- pipeline
  -- signal o_tar2pl_av           : tar2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);

begin

  TAR : entity tar_lib.tar
  port map (
    -- clock, control, and monitoring
    clk             => clock_and_control.clk,
    rst             => clock_and_control.rst,
    glob_en         => glob_en,
    --
    ctrl_v            => ctrl_v,
    mon_v             => mon_v,
    -- TDC Hits from Polmux
    i_inn_tdc_hits_av  => i_inn_tdc_hits_av,
    i_mid_tdc_hits_av  => i_mid_tdc_hits_av,
    i_out_tdc_hits_av  => i_out_tdc_hits_av,
    i_ext_tdc_hits_av  => i_ext_tdc_hits_av,
    -- candidates in from hal
    -- i_inn_tar_hits_av  => i_inn_tar_hits,
    -- i_mid_tar_hits_av  => i_mid_tar_hits,
    -- i_out_tar_hits_av  => i_out_tar_hits,
    -- i_ext_tar_hits_av  => i_ext_tar_hits,
    -- to daq
    o_inn_tdc_hits_av  => o_inn_tdc_hits_av,
    o_mid_tdc_hits_av  => o_mid_tdc_hits_av,
    o_out_tdc_hits_av  => o_out_tdc_hits_av,
    o_ext_tdc_hits_av  => o_ext_tdc_hits_av,
    -- outputs to h2s
    o_inn_tar_hits_av  => o_inn_tar_hits_av,
    o_mid_tar_hits_av  => o_mid_tar_hits_av,
    o_out_tar_hits_av  => o_out_tar_hits_av,
    o_ext_tar_hits_av  => o_ext_tar_hits_av

  );

end beh;