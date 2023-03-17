----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut für Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 09/02/2022
-- Design Name: Compact Segment Finder
-- Module Name: csf - Behavioral
-- Project Name: ncsf
-- Target Devices: VU13P - xcvu13p-flga2577-2-e
-- Tool Versions: 2020.2
-- Description: Compact Segment Finder top module
--
-- Dependencies: csf_pkg
--
-- Revision:
-- Revision 09.02.2022
-- Additional Comments: New version of CSF using a clustering algorithm instead
-- of the previous 1D histogram 
--
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;
ENTITY csf IS
  GENERIC (
    IS_ENDCAP           : INTEGER := 0;
    MDT_STATION         : INTEGER := 0 -- Station 0: Inner, 1: Middle, 2: Outer
  );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;
    -- control
    i_csf_ctrl_v : in std_logic_vector; --  HPS_CSF_CSF_CTRL_t;
    o_csf_mon_v  : out std_logic_vector;
    -- Data
    i_seed    : in heg2sfslc_vt;
    i_mdt_hit : in heg2sfhit_vt;
    i_eof     : in std_logic;
    o_seg     : out sf2ptcalc_vt
  );
END ENTITY csf;

ARCHITECTURE behavioral OF csf IS

  -- Input RoI
  SIGNAL seed_i   : heg2sfslc_rt;
  SIGNAL seed     : heg2sfslc_vt;
  SIGNAL csf_seed : heg2sfslc_vt;

  -- Input signals
  SIGNAL csf_mdt_hit : heg2sfhit_vt;
  SIGNAL mdt_hit     : heg2sfhit_rt;
  SIGNAL mdt_hits    : heg2sfhit_avt (1 DOWNTO 0);
  SIGNAL eof         : STD_LOGIC;

  -- Clustering signals
  TYPE t_cluster_hits_ml IS ARRAY (INTEGER RANGE <>) OF csf_hit_avt(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL cluster_hits_ml : t_cluster_hits_ml(1 DOWNTO 0);
  TYPE t_fitter_en_ml IS ARRAY (INTEGER RANGE <>) OF STD_LOGIC_VECTOR(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL fitter_en_ml : t_fitter_en_ml(1 DOWNTO 0);

  -- Fitters Signals
  TYPE t_csf_sums_ml IS ARRAY (INTEGER RANGE <>) OF csf_sums_avt(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL sums_ml : t_csf_sums_ml(1 DOWNTO 0);

  SIGNAL locseg : csf_locseg_vt;

  ---- Coordinate transformation
  SIGNAL coord_seed : heg2sfslc_vt;

  -- Output signal
  SIGNAL output_segment : csf_locseg_vt;
  SIGNAL out_seg        : csf_locseg_rt;
  SIGNAL globseg        : sf2ptcalc_vt;

  -- Components
  
BEGIN

  mdt_hit <= convert(i_mdt_hit, mdt_hit);
  seed_i  <= convert(i_seed, seed_i);

  -- Clustering

  CLUSTERING_GEN : FOR i IN 0 TO 1 GENERATE
    Cluster : ENTITY csf_lib.csf_clustering
      GENERIC MAP(
        MAX_HITS_PER_CLUSTER => real(CSF_MAXHITS_SEG/2),
        MAX_CLUSTERS         => CSF_MAX_CLUSTERS
      )
      PORT MAP(
        clk            => clk,
        i_mdthit       => mdt_hits(i),
        i_seed         => i_seed,
        i_eof          => i_eof,
        o_cluster_hits => cluster_hits_ml(i),
        o_fitter_en    => fitter_en_ml(i)
      );

    SUMMING : FOR k IN 0 TO CSF_MAX_CLUSTERS - 1 GENERATE
    BEGIN
      CSF_SUM : ENTITY csf_lib.ncsf_sums
        PORT MAP(
          clk      => clk,
          i_hit    => cluster_hits_ml(i)(k),
          i_fit_en => fitter_en_ml(i)(k),
          o_sums   => sums_ml(i)(k)
        );
    END GENERATE SUMMING;
  END GENERATE CLUSTERING_GEN;

  Fitter : ENTITY csf_lib.ncsf_fit
    PORT MAP(
      clk        => clk,
      i_rst      => rst,
      i_sums_ml0 => sums_ml(0),
      i_sums_ml1 => sums_ml(1),
      o_seg      => locseg
    );

  ---- Coordinate transformation
  coordtransform : ENTITY csf_lib.seg_coord_transform
    GENERIC MAP(
      IS_ENDCAP   => IS_ENDCAP,
      MDT_STATION => MDT_STATION
    )
    PORT MAP(
      clk       => clk,
      i_locseg  => locseg,
      i_seed    => coord_seed,
      o_globseg => o_seg
    );
  csf_proc : PROCESS (clk) IS
  BEGIN

    IF rising_edge(clk) THEN
      mdt_hits                                   <= (OTHERS => (OTHERS => '0'));
      mdt_hits(stdlogic_integer(mdt_hit.mlayer)) <= i_mdt_hit;

      IF (seed_i.data_valid = '1') THEN
        seed <= i_seed;
      END IF;

      IF i_eof = '1' THEN
        coord_seed <= seed;
      END IF;

      -- Reset the Chi2 and Output
      IF (rst = '1') THEN
        seed <= (OTHERS => '0');
      END IF;
    END IF;

  END PROCESS csf_proc;

END ARCHITECTURE behavioral;