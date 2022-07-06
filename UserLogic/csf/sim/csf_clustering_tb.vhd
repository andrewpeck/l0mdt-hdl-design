----------------------------------------------------------------------------------
-- Company: Max-Planck-Institute for Physics, Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: CSF
-- Module Name: csf_histogram_tb - Behavioral
-- Project Name: MDTTP
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
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

ENTITY csf_clustering_tb IS
  --  Port ( );
END csf_clustering_tb;

ARCHITECTURE Behavioral OF csf_clustering_tb IS
  CONSTANT MAX_CLUSTERS : integer := 6;
  SIGNAL clk            : STD_LOGIC    := '0';
  SIGNAL mdt_hit        : heg2sfhit_vt := (OTHERS => '0');
  SIGNAL seed           : heg2sfslc_vt := (OTHERS => '0');
  SIGNAL eof            : STD_LOGIC    := '0';
  SIGNAL cluster_hits_v : csf_hit_avt(MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL cluster_hits   : csf_hit_art(MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL mdt_hit_t      : heg2sfhit_rt;
  SIGNAL seed_t         : heg2sfslc_rt;

  CONSTANT CLK_period : TIME := 4.0 ns;

BEGIN

  csf_clustering : ENTITY csf_lib.csf_clustering
    PORT MAP(
      clk            => clk,
      i_mdthit       => mdt_hit,
      i_seed         => seed,
      i_eof          => eof,
      o_cluster_hits => cluster_hits_v
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
    seed_t <= nullify(seed_t);
    WAIT FOR clk_period * 5;
    seed_t.data_valid <= '1';
    seed_t.vec_ang    <= to_unsigned(144, UCM_VEC_ANG_LEN);
    WAIT FOR clk_period;
    seed_t <= nullify(seed_t);
    WAIT FOR clk_period * 5;
    mdt_hit_t <= ('1', '0', to_unsigned(481, HEG2SFHIT_LOCALX_LEN), to_unsigned(6247, HEG2SFHIT_LOCALY_LEN), to_unsigned(317, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(1313, HEG2SFHIT_LOCALX_LEN), to_unsigned(5762, HEG2SFHIT_LOCALY_LEN), to_unsigned(279, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(2145, HEG2SFHIT_LOCALX_LEN), to_unsigned(6247, HEG2SFHIT_LOCALY_LEN), to_unsigned(97, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= ('1', '0', to_unsigned(2978, HEG2SFHIT_LOCALX_LEN), to_unsigned(6728, HEG2SFHIT_LOCALY_LEN), to_unsigned(446, HEG2SFHIT_RADIUS_LEN));
    WAIT FOR clk_period;
    mdt_hit_t <= nullify(mdt_hit_t);
    WAIT FOR clk_period * 5;
    eof <= '1';
    WAIT FOR clk_period;
    eof <= '0';
    WAIT;

  END PROCESS;
END Behavioral;