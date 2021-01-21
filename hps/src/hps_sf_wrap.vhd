--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS candidate distributor
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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

library lsf_lib;

entity hps_sf_wrap is
  generic(
    g_STATION_RADIUS : integer := 0     --station
    );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;

    -- control
    csf_ctrl : in  H2S_HPS_CSF_CSF_CTRL_t;
    csf_mon  : out H2S_HPS_CSF_CSF_MON_t;

    lsf_ctrl : in  H2S_HPS_LSF_LSF_CTRL_t;
    lsf_mon  : out H2S_HPS_LSF_LSF_MON_t;

    -- configuration
    i_control_v  : in  heg_ctrl2sf_rvt;
    i_slc_data_v : in  heg2sfslc_rvt;
    i_mdt_data_v : in  heg2sfhit_rvt;
    --
    o_sf_data_v  : out sf2ptcalc_rvt
    );
end entity hps_sf_wrap;

architecture beh of hps_sf_wrap is
  signal i_control_r : heg_ctrl2sf_rt;
begin

  i_control_r <= structify(i_control_v);

  DIS_SF : if c_SF_ENABLED = '0' generate
    --
    o_sf_data_v <= (others => '0');
    --CSF
    csf_mon.STATUS <= '0';
    csf_mon.READY <= '0';
    --LSF
    lsf_mon.STATUS <= '0';
    lsf_mon.sb_lsf_mdt_hits_rdata_31_0 <= (others =>'0');
    lsf_mon.sb_lsf_mdt_hits_rdata_40_32 <= (others => '0');
  end generate;

  EN_SF : if c_SF_ENABLED = '1' generate

    -- CSF
    EN_CSF : if c_SF_TYPE = '0' generate
      CSF : entity csf_lib.csf
        generic map(
          FLAVOUR => to_integer(unsigned'("0" & c_ST_nBARREL_ENDCAP))
        )
        port map(
          clk       => clk,
          i_seed    => i_slc_data_v,
          i_mdt_hit => i_mdt_data_v,
          i_eof     => i_control_r.eof,
          i_rst     => rst,
          o_seg     => o_sf_data_v
        );

      lsf_mon.STATUS <= '0';
      lsf_mon.sb_lsf_mdt_hits_rdata_31_0 <= (others =>'0');
      lsf_mon.sb_lsf_mdt_hits_rdata_40_32 <= (others => '0');

    end generate;

    ------------------------------------------------------------------
    -- LSF
    ------------------------------------------------------------------
   
    EN_LSF : if c_SF_TYPE = '1' generate
      LSF : entity lsf_lib.top_lsf
        -- generic map(
        --FLAVOUR => to_integer(unsigned'("0" & c_ST_nBARREL_ENDCAP))
        --   )
        port map(
          clock                               => clk,
          reset                               => rst,
          slc_roi                             => i_slc_data_v,
          mdt_hit                             => i_mdt_data_v,
          lsf                                 => o_sf_data_v,
          hba_max_clocks                      => lsf_ctrl.hba_max_clocks,
          --SpyBuffer 
          sb_lsf_mdt_hits_freeze              => lsf_ctrl.sb_lsf_mdt_hits_freeze,
          sb_lsf_mdt_hits_re                  => lsf_ctrl.sb_lsf_mdt_hits_re,
          sb_lsf_mdt_hits_raddr               => lsf_ctrl.sb_lsf_mdt_hits_raddr,
          sb_lsf_mdt_hits_rdata(31 downto 0)  => lsf_mon.sb_lsf_mdt_hits_rdata_31_0,
          sb_lsf_mdt_hits_rdata(40 downto 32) => lsf_mon.sb_lsf_mdt_hits_rdata_40_32
        );

        csf_mon.STATUS <= '0';
        csf_mon.READY <= '0';
    end generate;
  end generate;

  -- DIS_SF : if c_SF_ENABLED = '0' generate

  -- end generate;

end beh;
