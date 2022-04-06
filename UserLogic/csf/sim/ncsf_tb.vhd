
--
-- File: ncsf_tb.vhd
-- Project: Compact Segment Finder 
-- File Created: Thursday, 1st January 1970 1:00:00 am
-- Author: Davide Cieri (davide.cieri@cern.ch)
-- -----
-- Last Modified: Tuesday, 5th April 2022 9:35:17 am
-- Modified By: Davide Cieri (davide.cieri@cern.ch>)
-- -----
-- Copyright 2022, Max-Planck-Institut für Physik, Munich

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;

ENTITY ncsf_tb IS
END ncsf_tb;

ARCHITECTURE Behavioral OF ncsf_tb IS
  CONSTANT MAX_CLUSTERS : INTEGER      := 6;
  SIGNAL clk            : STD_LOGIC    := '0';
  SIGNAL mdt_hit        : HEG2SFHIT_VT := (OTHERS => '0');
  SIGNAL seed           : HEG2SFSLC_VT := (OTHERS => '0');
  SIGNAL eof            : STD_LOGIC    := '0';
  SIGNAL cluster_hits_v : CSF_HIT_AVT(MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL cluster_hits   : CSF_HIT_ART(MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL mdt_hit_t      : HEG2SFHIT_RT;
  SIGNAL seed_t         : HEG2SFSLC_RT;
  SIGNAL rst            : STD_LOGIC := '0';
  SIGNAL v_seg          : SF2PTCALC_VT;
  SIGNAL seg            : SF2PTCALC_RT;
  CONSTANT CLK_period   : TIME := 4.0 ns;

BEGIN

  CSF : ENTITY csf_lib.csf
    PORT MAP(
      clk       => clk,
      i_seed    => seed,
      i_mdt_hit => mdt_hit,
      i_eof     => eof,
      i_rst     => rst,
      o_seg     => v_seg,

      --SpuBuffer
      spy_clock => clk,
      -- Hit Spybuffer
      i_spyhit_fc_we   => '0',
      i_spyhit_fc_re   => '0',
      i_spyhit_freeze  => '0',
      i_spyhit_playback => (OTHERS => '0'),
      i_spyhit_pb_we   => '0',
      i_spyhit_pb_wdata => (OTHERS => '0'),
      i_spyhit_re      => '0',
      i_spyhit_meta_we => '0',
      i_spyhit_addr => (OTHERS => '0'),
      i_spyhit_meta_addr => (OTHERS => '0'),
      i_spyhit_meta_wdata => (OTHERS => '0'),

      -- SLC Spybuffer
      i_spyslc_fc_we   => '0',
      i_spyslc_fc_re   => '0',
      i_spyslc_freeze  => '0',
      i_spyslc_playback => (OTHERS => '0'),
      i_spyslc_pb_we   => '0',
      i_spyslc_pb_wdata => (OTHERS => '0'),
      i_spyslc_re      => '0',
      i_spyslc_addr => (OTHERS => '0'),
      i_spyslc_meta_we => '0',
      i_spyslc_meta_addr => (OTHERS => '0'),
      i_spyslc_meta_wdata => (OTHERS => '0'),

      -- Segment Spybuffer
      i_spyseg_fc_we   => '0',
      i_spyseg_fc_re   => '0',
      i_spyseg_freeze  => '0',
      i_spyseg_playback => (OTHERS => '0'),
      i_spyseg_pb_we   => '0',
      i_spyseg_pb_wdata => (OTHERS => '0'),
      i_spyseg_re      => '0',
      i_spyseg_addr => (OTHERS => '0'),
      i_spyseg_meta_addr => (OTHERS => '0'),
      i_spyseg_meta_we => '0',
      i_spyseg_meta_wdata => (OTHERS => '0')
    );

  CLK_process : PROCESS
  BEGIN
    CLK <= '0';
    WAIT FOR CLK_period/2;
    CLK <= '1';
    WAIT FOR CLK_period/2;
  END PROCESS;

  seed    <= vectorify(seed_t, seed);
  mdt_hit <= vectorify(mdt_hit_t, mdt_hit);
  Pulse : PROCESS
  BEGIN
    mdt_hit_t <= nullify(mdt_hit_t);
    seed_t    <= nullify(seed_t);
    WAIT FOR clk_period * 5;
    seed_t.data_valid <= '1';
    seed_t.vec_ang    <= to_unsigned(144, UCM_VEC_ANG_LEN);
    WAIT FOR clk_period;
    seed_t <= nullify(seed_t);
    WAIT FOR clk_period * 5;
    mdt_hit_t <= ('1', '0', to_unsigned(481, HEG2SFHIT_LOCALX_LEN), to_unsigned(6247, HEG2SFHIT_LOCALY_LEN), to_unsigned(317, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(1313, HEG2SFHIT_LOCALX_LEN), to_unsigned(5767, HEG2SFHIT_LOCALY_LEN), to_unsigned(279, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(2145, HEG2SFHIT_LOCALX_LEN), to_unsigned(6247, HEG2SFHIT_LOCALY_LEN), to_unsigned(97, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(2978, HEG2SFHIT_LOCALX_LEN), to_unsigned(6728, HEG2SFHIT_LOCALY_LEN), to_unsigned(446, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(9379, HEG2SFHIT_LOCALX_LEN), to_unsigned(6728, HEG2SFHIT_LOCALY_LEN), to_unsigned(446, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(10211, HEG2SFHIT_LOCALX_LEN), to_unsigned(7208, HEG2SFHIT_LOCALY_LEN), to_unsigned(446, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(11044, HEG2SFHIT_LOCALX_LEN), to_unsigned(7689, HEG2SFHIT_LOCALY_LEN), to_unsigned(446, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(11876, HEG2SFHIT_LOCALX_LEN), to_unsigned(7208, HEG2SFHIT_LOCALY_LEN), to_unsigned(446, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= nullify(mdt_hit_t);
    WAIT FOR clk_period * 5;
    eof <= '1';
    WAIT FOR clk_period;
    eof <= '0';
    WAIT;

  END PROCESS;
END Behavioral;