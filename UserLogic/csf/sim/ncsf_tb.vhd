
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

  -- mbar 144 squ_m_digi 1034 squ_m_r 327778 mx 69264 dsp_z 6.39693e+06 digi_bplus 6.65544e+06 digi_bminus 5.99989e+06 bin_bplus 50 bin_bminus 45
  -- mbar 144 squ_m_digi 1034 squ_m_r 288486 mx 189072 dsp_z 5.90541e+06 digi_bplus 6.00482e+06 digi_bminus 5.42785e+06 bin_bplus 45 bin_bminus 41
  -- mbar 144 squ_m_digi 1034 squ_m_r 100298 mx 308880 dsp_z 6.39693e+06 digi_bplus 6.18835e+06 digi_bminus 5.98775e+06 bin_bplus 47 bin_bminus 45
  -- mbar 144 squ_m_digi 1034 squ_m_r 461164 mx 428832 dsp_z 6.88947e+06 digi_bplus 6.9218e+06 digi_bminus 5.99948e+06 bin_bplus 52 bin_bminus 45
  -- mbar 144 squ_m_digi 1034 squ_m_r 458062 mx 1.35058e+06 dsp_z 6.88947e+06 digi_bplus 5.99696e+06 digi_bminus 5.08083e+06 bin_bplus 45 bin_bminus 38
  -- mbar 144 squ_m_digi 1034 squ_m_r 87890 mx 1.47038e+06 dsp_z 7.38099e+06 digi_bplus 5.9985e+06 digi_bminus 5.82272e+06 bin_bplus 45 bin_bminus 44
  -- mbar 144 squ_m_digi 1034 squ_m_r 289520 mx 1.59034e+06 dsp_z 7.87354e+06 digi_bplus 6.57272e+06 digi_bminus 5.99368e+06 bin_bplus 50 bin_bminus 45
  -- mbar 144 squ_m_digi 1034 squ_m_r 325710 mx 1.71014e+06 dsp_z 7.38099e+06 digi_bplus 5.99656e+06 digi_bminus 5.34514e+06 bin_bplus 45 bin_bminus 40
  -- *** CSF Clustering Hits BIL1A03***
  -- No. of hits entering the filter 8
  -- RoI X: 193.069 Z: 200.477 Z0 173.338 m 0.140565
  -- Layer_id: 0 driftRadius: 317 isOnSegment: 1 x: 481 y: 6247 b+: 203.094 b-: 183.094 digi b+ 6499 b- 5859 bin b+: 50 b-: 45
  -- tube_y 6247 tube_x 481
  -- inv_squ 253 delta_y 313 delta_x 44
  -- Layer_id: 1 driftRadius: 279 isOnSegment: 1 x: 1313 y: 5767 b+: 183.25 b-: 165.625 digi b+ 5864 b- 5300 bin b+: 45 b-: 41
  -- tube_y 5767 tube_x 1313
  -- inv_squ 253 delta_y 275 delta_x 38
  -- Plus compatible with cluster 1 at 5859
  -- Layer_id: 2 driftRadius: 97 isOnSegment: 1 x: 2145 y: 6247 b+: 188.844 b-: 182.719 digi b+ 6043 b- 5847 bin b+: 47 b-: 45
  -- tube_y 6247 tube_x 2145
  -- inv_squ 253 delta_y 95 delta_x 13
  -- Minus compatible with cluster 1 at 5859
  -- Layer_id: 3 driftRadius: 446 isOnSegment: 1 x: 2978 y: 6728 b+: 211.219 b-: 183.062 digi b+ 6759 b- 5858 bin b+: 52 b-: 45
  -- tube_y 6728 tube_x 2978
  -- inv_squ 253 delta_y 440 delta_x 61
  -- Minus compatible with cluster 1 at 5859
  -- Layer_id: 4 driftRadius: 443 isOnSegment: 1 x: 9379 y: 6728 b+: 183 b-: 155.031 digi b+ 5856 b- 4961 bin b+: 45 b-: 38
  -- tube_y 6728 tube_x 9379
  -- inv_squ 253 delta_y 437 delta_x 61
  -- Layer_id: 5 driftRadius: 85 isOnSegment: 1 x: 10211 y: 7208 b+: 183.031 b-: 177.688 digi b+ 5857 b- 5686 bin b+: 45 b-: 44
  -- tube_y 7208 tube_x 10211
  -- inv_squ 253 delta_y 84 delta_x 11
  -- Plus compatible with cluster 0 at 5856
  -- Layer_id: 6 driftRadius: 280 isOnSegment: 1 x: 11044 y: 7689 b+: 200.562 b-: 182.906 digi b+ 6418 b- 5853 bin b+: 50 b-: 45
  -- tube_y 7689 tube_x 11044
  -- inv_squ 253 delta_y 276 delta_x 38
  -- Minus compatible with cluster 0 at 5856
  -- Layer_id: 7 driftRadius: 315 isOnSegment: 1 x: 11876 y: 7208 b+: 183 b-: 163.094 digi b+ 5856 b- 5219 bin b+: 45 b-: 40
  -- tube_y 7208 tube_x 11876
  -- inv_squ 253 delta_y 311 delta_x 43
  -- Plus compatible with cluster 0 at 5856
  -- *** DEBUG: CSF_Fitter ***
  -- *** List of hits ***
  -- y: 5934 x: 525
  -- y: 6042 x: 1275
  -- y: 6152 x: 2158
  -- y: 6288 x: 3039
  -- y: 7165 x: 9318
  -- y: 7292 x: 10200
  -- y: 7413 x: 11082
  -- y: 7519 x: 11833
  -- CSF_Fitter: Sums parameters
  -- Sum_yx 3.55469e+08 Sum_y 53805 Sum_x 49430 Sum_x2 4.69489e+08
  -- full num_m 1.84173e+08 num_b 7.69004e+12 den 1.31259e+09
  -- shift num_m 5620.5 num_b 229181 den 5007.14
  --  digi rec 837
  -- digitised m 0.140137 int 574
  -- digitised b 182.875 int 2926
  -- double y 185.438 b 182.875 m 0.140137 x 16.4062 sigma 0.125 res 2.10706
  -- double y 188.812 b 182.875 m 0.140137 x 39.8438 sigma 0.125 res 2.83142
  -- double y 192.25 b 182.875 m 0.140137 x 67.4375 sigma 0.125 res -0.60376
  -- double y 196.5 b 182.875 m 0.140137 x 94.9688 sigma 0.125 res 2.53113
  -- double y 223.906 b 182.875 m 0.140137 x 291.188 sigma 0.125 res 1.80151
  -- double y 227.875 b 182.875 m 0.140137 x 318.75 sigma 0.125 res 2.65137
  -- double y 231.656 b 182.875 m 0.140137 x 346.312 sigma 0.125 res 2.00122
  -- double y 234.969 b 182.875 m 0.140137 x 369.781 sigma 0.125 res 2.19055
  -- double chi2 38.3064
  -- hit x 525 y 5934
  -- dsp_b 5852 dsp_mx 73 dsp_b_y 82
  -- dsp_res 4 dsp_res2 16 chi2 16
  -- hit x 1275 y 6042
  -- dsp_b 5852 dsp_mx 178 dsp_b_y 190
  -- dsp_res 6 dsp_res2 36 chi2 52
  -- hit x 2158 y 6152
  -- dsp_b 5852 dsp_mx 302 dsp_b_y 300
  -- dsp_res -1 dsp_res2 1 chi2 53
  -- hit x 3039 y 6288
  -- dsp_b 5852 dsp_mx 425 dsp_b_y 436
  -- dsp_res 5 dsp_res2 25 chi2 78
  -- hit x 9318 y 7165
  -- dsp_b 5852 dsp_mx 1305 dsp_b_y 1313
  -- dsp_res 4 dsp_res2 16 chi2 94
  -- hit x 10200 y 7292
  -- dsp_b 5852 dsp_mx 1429 dsp_b_y 1440
  -- dsp_res 5 dsp_res2 25 chi2 119
  -- hit x 11082 y 7413
  -- dsp_b 5852 dsp_mx 1552 dsp_b_y 1561
  -- dsp_res 4 dsp_res2 16 chi2 135
  -- hit x 11833 y 7519
  -- dsp_b 5852 dsp_mx 1658 dsp_b_y 1667
  -- dsp_res 4 dsp_res2 16 chi2 151
  -- CSF_Fitter::Segment m 0.140137 b 182.875 chi2 37.75 alpha 1.43157
  -- ******* CSF_Clustering DIGI SEGMENT FITTING RESULTS BIL1A03 phiMod 0.116522*********
  -- Chamber Corner Z: 495.175 R: 4755.91
  -- HpsWindow Z: 695.652 R: 4948.98 RefPos: 4948.98
  -- RoI Z: 695.652 R: 4948.98 Theta: 1.43115
  -- Offline Z: 705.368 R: 4948.98 local z0183.119 Theta: 1.43147
  -- Offline Z: 705.368 R: 4948.98 Theta: -0.0123507
  -- Online (corner) Z: 678.05 R: 4755.91 Theta: 1.43157
  -- Online Z: 705.106 R: 4948.98 Theta: 1.43157
  seed    <= convert(seed_t, seed);
  mdt_hit <= convert(mdt_hit_t, mdt_hit);
  Pulse : PROCESS
  BEGIN
    mdt_hit_t <= zero(mdt_hit_t);
    seed_t    <= zero(seed_t);
    WAIT FOR clk_period * 5;
    seed_t.data_valid <= '1';
    seed_t.vec_ang    <= to_unsigned(144, UCM_VEC_ANG_LEN);
    WAIT FOR clk_period;
    seed_t <= zero(seed_t);
    WAIT FOR clk_period * 5;
    mdt_hit_t <= ('1', '0', to_unsigned(481, HEG2SFHIT_LOCALX_LEN), to_unsigned(6247, HEG2SFHIT_LOCALY_LEN), to_unsigned(317, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(1313, HEG2SFHIT_LOCALX_LEN), to_unsigned(5767, HEG2SFHIT_LOCALY_LEN), to_unsigned(279, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(2145, HEG2SFHIT_LOCALX_LEN), to_unsigned(6247, HEG2SFHIT_LOCALY_LEN), to_unsigned(97, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(2978, HEG2SFHIT_LOCALX_LEN), to_unsigned(6728, HEG2SFHIT_LOCALY_LEN), to_unsigned(446, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(9379, HEG2SFHIT_LOCALX_LEN), to_unsigned(6728, HEG2SFHIT_LOCALY_LEN), to_unsigned(443, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(10211, HEG2SFHIT_LOCALX_LEN), to_unsigned(7208, HEG2SFHIT_LOCALY_LEN), to_unsigned(85, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(11044, HEG2SFHIT_LOCALX_LEN), to_unsigned(7689, HEG2SFHIT_LOCALY_LEN), to_unsigned(280, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '1', to_unsigned(11876, HEG2SFHIT_LOCALX_LEN), to_unsigned(7208, HEG2SFHIT_LOCALY_LEN), to_unsigned(315, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= zero(mdt_hit_t);
    WAIT FOR clk_period * 5;
    eof <= '1';
    WAIT FOR clk_period;
    eof <= '0';
    WAIT;

  END PROCESS;
END Behavioral;