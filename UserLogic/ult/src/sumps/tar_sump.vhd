--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager Sump
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
-- use shared_lib.detector_param_pkg.all;

library vamc_lib;

library tar_lib;
use tar_lib.tar_pkg.all;

entity tar_sump is
  port (
    -- clock and control
    -- clock_and_control : in  l0mdt_control_rt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  H2S_CTRL_t;
    -- mon               : out H2S_MON_t;

    i_inn_tdc_hits_av    : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mid_tdc_hits_av    : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_out_tdc_hits_av    : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_ext_tdc_hits_av    : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    -- i_inn_tar_hits_av    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- i_mid_tar_hits_av    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- i_out_tar_hits_av    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- i_ext_tar_hits_av    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inn_tdc_hits_av    : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tdc_hits_av    : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tdc_hits_av    : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tdc_hits_av    : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inn_tar_hits_av    : out tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tar_hits_av    : out tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tar_hits_av    : out tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tar_hits_av    : out tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    o_sump : out std_logic
  );
  
end entity tar_sump;

architecture beh of tar_sump is

  signal inn_tdc_hits_av    : std_logic_vector (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal mid_tdc_hits_av    : std_logic_vector (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal out_tdc_hits_av    : std_logic_vector (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal ext_tdc_hits_av    : std_logic_vector (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

begin

    o_inn_tdc_hits_av <= i_inn_tdc_hits_av;
    o_mid_tdc_hits_av <= i_mid_tdc_hits_av;
    o_out_tdc_hits_av <= i_out_tdc_hits_av;
    o_ext_tdc_hits_av <= i_ext_tdc_hits_av;
    o_inn_tar_hits_av <= (others => (others => '0'));
    o_mid_tar_hits_av <= (others => (others => '0'));
    o_out_tar_hits_av <= (others => (others => '0'));
    o_ext_tar_hits_av <= (others => (others => '0'));

    MDT_INN_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_INN-1 generate
      inn_tdc_hits_av(I) <= xor_reduce(i_inn_tdc_hits_av(I));
    end generate;
    MDT_MID_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_MID-1 generate
      mid_tdc_hits_av(I) <= xor_reduce(i_mid_tdc_hits_av(I));
    end generate;
    MDT_OUT_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_OUT-1 generate
      out_tdc_hits_av(I) <= xor_reduce(i_out_tdc_hits_av(I));
    end generate;
    MDT_EXT_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_EXT-1 generate
      ext_tdc_hits_av(I) <= xor_reduce(i_ext_tdc_hits_av(I));
    end generate;

    o_sump <=   xor_reduce(inn_tdc_hits_av)
              xor xor_reduce(mid_tdc_hits_av)
              xor xor_reduce(out_tdc_hits_av)
              xor xor_reduce(ext_tdc_hits_av);
  
end architecture beh;

