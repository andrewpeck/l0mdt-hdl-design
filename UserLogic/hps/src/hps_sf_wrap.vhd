--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
use ieee.std_logic_misc.all;

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

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

library lsf_lib;
use lsf_lib.all;

library fm_lib;
use fm_lib.fm_sb_pkg.all;


entity hps_sf_wrap is
  generic(
    g_STATION_RADIUS : integer := 0     --station
    );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;

    -- control
    csf_ctrl_v : in std_logic_vector;--  H2S_HPS_CSF_CSF_CTRL_t;
    csf_mon_v  : out std_logic_vector;--H2S_HPS_CSF_CSF_MON_t;

    lsf_ctrl_v : in  std_logic_vector;--H2S_HPS_LSF_LSF_CTRL_t;
    lsf_mon_v  : out std_logic_vector;--H2S_HPS_LSF_LSF_MON_t;

    sf_fm_data : out fm_rt_array( 0 to sf_sb_station_n - 1);
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

  signal csf_ctrl_r : H2S_HPS_CSF_CSF_CTRL_t;
  signal csf_mon_r  : H2S_HPS_CSF_CSF_MON_t;
  signal lsf_ctrl_r : H2S_HPS_LSF_LSF_CTRL_t;
  signal lsf_mon_r  : H2S_HPS_LSF_LSF_MON_t;

  signal sf_data_v : std_logic_vector(o_sf_data_v'length -1 downto 0);

begin

  i_control_r <= structify(i_control_v);

  csf_ctrl_r <= convert(csf_ctrl_v,csf_ctrl_r);
  csf_mon_v  <= convert(csf_mon_r ,csf_mon_v );
  lsf_ctrl_r <= convert(lsf_ctrl_v,lsf_ctrl_r);
  lsf_mon_v  <= convert(lsf_mon_r ,lsf_mon_v );

  EN_SF : if c_SF_ENABLED = '1' generate

    SF_BP: if c_SF_BYPASS = '0' generate
      SF_TYPE : if c_SF_TYPE = '0' generate

        CSF : entity csf_lib.csf
          generic map(
            IS_ENDCAP => to_integer(unsigned'("0" & c_ST_nBARREL_ENDCAP)),
            MDT_STATION => g_STATION_RADIUS
            )
          port map(
            clk       => clk,
            i_seed    => i_slc_data_v,
            i_mdt_hit => i_mdt_data_v,
            i_eof     => i_control_r.eof,
            i_rst     => rst,
            spy_clock => clk,
            o_seg     => o_sf_data_v,
--            csf_fm_data => sf_fm_data,
            i_spyhit_fc_we      => '0',
            i_spyhit_fc_re      => '0',
            i_spyhit_freeze     => '0',
            i_spyhit_playback   => (others => '0'),
            i_spyhit_pb_we      => '0',
            i_spyhit_pb_wdata   => (others => '0'),
            i_spyhit_en         => '0',
            i_spyhit_addr       => (others => '0'),
            i_spyhit_meta_addr  => (others => '0'),
            i_spyhit_meta_we    => '0',
            --o_spyhit_data       => '0',
            --o_spyhit_meta_rdata => '0',
            i_spyhit_meta_wdata => (others => '0'),
            --o_spyhit_af         => '0',
            --o_spyhit_empty      => '0',
            -- SLC Spybuffer
            i_spyslc_fc_we      => '0',
            i_spyslc_fc_re      => '0',
            i_spyslc_freeze     => '0',
            i_spyslc_playback   => (others => '0'),
            i_spyslc_pb_we      => '0',
            i_spyslc_pb_wdata   => (others => '0'),
            i_spyslc_en         => '0',
            i_spyslc_addr       => (others => '0'),
            i_spyslc_meta_addr  => (others => '0'),
            i_spyslc_meta_we    => '0',
            --o_spyslc_data       => '0',
            --o_spyslc_meta_rdata => '0',
            i_spyslc_meta_wdata => (others => '0'),
            --o_spyslc_af         => '0',
            --o_spyslc_empty      => '0',
            -- Segment Spybuffer
            i_spyseg_fc_we      => '0',
            i_spyseg_fc_re      => '0',
            i_spyseg_freeze     => '0',
            i_spyseg_playback   => (others => '0'),
            i_spyseg_pb_we      => '0',
            i_spyseg_pb_wdata   => (others => '0'),
            i_spyseg_en         => '0',
            i_spyseg_addr       => (others => '0'),
            i_spyseg_meta_addr  => (others => '0'),
            i_spyseg_meta_we    => '0',
            --o_spyseg_data       => '0';
            --o_spyseg_meta_rdata => '0';
            i_spyseg_meta_wdata => (others => '0')
            --o_spyseg_af         => '0';
            --o_spyseg_empty      => '0';
        );

        lsf_mon_r <= nullify(lsf_mon_r);
        csf_mon_r <= nullify(csf_mon_r);

      else generate

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
            i_eof                               => i_control_r.eof,
            hba_max_clocks                      => lsf_ctrl_r.hba_max_clocks,
            lsf_fm_data                         => sf_fm_data,
            --SpyBuffer
            sb_lsf_mdt_hits_freeze              => lsf_ctrl_r.sb_lsf_mdt_hits_freeze,
            sb_lsf_mdt_hits_re                  => lsf_ctrl_r.sb_lsf_mdt_hits_re,
            sb_lsf_mdt_hits_raddr               => lsf_ctrl_r.sb_lsf_mdt_hits_raddr,
            sb_lsf_mdt_hits_rdata(31 downto 0)  => lsf_mon_r.sb_lsf_mdt_hits_rdata_31_0,
            sb_lsf_mdt_hits_rdata(40 downto 32) => lsf_mon_r.sb_lsf_mdt_hits_rdata_40_32
        );

        csf_mon_r <= nullify(csf_mon_r);


      end generate;
    else generate


      csf_ctrl : entity shared_lib.vhdl_utils_deserializer generic map (csf_mon_v'length) port map(clk,rst,xor_reduce(csf_ctrl_v),csf_mon_v);
      lsf_ctrl : entity shared_lib.vhdl_utils_deserializer generic map (lsf_mon_v'length) port map(clk,rst,xor_reduce(lsf_ctrl_v),lsf_mon_v);


      des0 : entity shared_lib.vhdl_utils_deserializer
        generic map (g_DATA_WIDTH => sf_data_v'length)
        port map(
          clk => clk,
          rst  => rst,
          i_data => glob_en OR (xor_reduce(i_control_v) xor xor_reduce(i_slc_data_v) xor xor_reduce(i_mdt_data_v)),
          o_data => sf_data_v);
          o_sf_data_v <= sf_data_v;
    end generate SF_BP;

  else generate

    lsf_mon_r <= nullify(lsf_mon_r);
    csf_mon_r <= nullify(csf_mon_r);

    o_sf_data_v <= (others => '0');

  end generate;

end beh;

  -- DIS_SF : if c_SF_ENABLED = '0' generate
  --   --
  --   o_sf_data_v <= (others => '0');
  --   --CSF
  --   csf_mon.STATUS <= '0';
  --   csf_mon.READY <= '0';
  --   --LSF
  --   lsf_mon_r.STATUS <= '0';
  --   lsf_mon_r.sb_lsf_mdt_hits_rdata_31_0 <= (others =>'0');
  --   lsf_mon_r.sb_lsf_mdt_hits_rdata_40_32 <= (others => '0');
  -- else generate
  -- end generate;
