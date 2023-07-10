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

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real.all;

library shared_lib;
  use shared_lib.common_ieee_pkg.all;
  use shared_lib.l0mdt_constants_pkg.all;
  use shared_lib.l0mdt_dataformats_pkg.all;
  use shared_lib.common_constants_pkg.all;
  use shared_lib.common_types_pkg.all;

library csf_lib;
  use csf_lib.csf_pkg.all;
  use csf_lib.csf_custom_pkg.all;

library ctrl_lib;
  use ctrl_lib.HPS_CTRL.all;

entity csf is
  generic (
    is_endcap   : integer := 0;
    mdt_station : integer := 0 -- Station 0: Inner, 1: Middle, 2: Outer
  );
  port (
    clk     : in    std_logic;
    rst     : in    std_logic;
    glob_en : in    std_logic;
    -- control
    i_ctrl_v : in    std_logic_vector; --  HPS_CSF_CSF_CTRL_t;
    o_mon_v  : out   std_logic_vector;
    -- Data
    i_seed    : in    heg2sfslc_vt;
    i_mdt_hit : in    heg2sfhit_vt;
    i_eof     : in    std_logic;
    o_seg     : out   sf2ptcalc_vt
  );
end entity csf;

architecture behavioral of csf is

  -- Control and Monitoring
  signal ctrl_r : HPS_CSF_CSF_CTRL_t;
  signal mon_r  : HPS_CSF_CSF_MON_t;
  signal local_en : std_logic;
  signal local_rst : std_logic;
  signal int_freeze : std_logic;

  -- Input RoI
  signal seed_i   : heg2sfslc_rt;
  signal seed     : heg2sfslc_vt;
  signal csf_seed : heg2sfslc_vt;

  -- Input signals
  signal csf_mdt_hit : heg2sfhit_vt;
  signal mdt_hit     : heg2sfhit_rt;
  signal mdt_hits    : heg2sfhit_avt (1 downto 0);
  signal eof         : std_logic;

  -- Clustering signals

  type t_cluster_hits_ml is ARRAY (integer RANGE <>) OF csf_hit_avt(CSF_MAX_CLUSTERS - 1 downto 0);

  signal cluster_hits_ml : t_cluster_hits_ml(1 downto 0);

  type t_fitter_en_ml is ARRAY (integer RANGE <>) OF std_logic_vector(CSF_MAX_CLUSTERS - 1 downto 0);

  signal fitter_en_ml : t_fitter_en_ml(1 downto 0);

  -- Fitters Signals

  type t_csf_sums_ml is ARRAY (integer RANGE <>) OF csf_sums_avt(CSF_MAX_CLUSTERS - 1 downto 0);

  signal sums_ml : t_csf_sums_ml(1 downto 0);

  signal locseg : csf_locseg_vt;

  ---- Coordinate transformation
  signal coord_seed : heg2sfslc_vt;

  -- Output signal
  signal output_segment : csf_locseg_vt;
  signal out_seg        : csf_locseg_rt;
  signal globseg        : sf2ptcalc_vt;

-- Components

begin
  ctrl_r <= convert(i_ctrl_v,ctrl_r);
  o_mon_v <= convert(mon_r,o_mon_v);

  -- Supervisor
  supervisor : entity csf_lib.csf_supervisor
    port map (
      clk     => clk,
      rst     => rst,
      glob_en => glob_en,
      -- AXI to SoC
      i_actions => ctrl_r.actions,
      o_status  => mon_r.status,
      --
      o_freeze => int_freeze,
      --
      o_local_en  => local_en,
      o_local_rst => local_rst
    );

  mdt_hit <= convert(i_mdt_hit, mdt_hit);
  seed_i  <= convert(i_seed, seed_i);
  -- Clustering

  clustering_gen : for i IN 0 to 1 generate

    cluster : entity csf_lib.csf_clustering
      generic map (
        max_hits_per_cluster => real(CSF_MAXHITS_SEG / 2),
        max_clusters         => CSF_MAX_CLUSTERS
      )
      port map (
        clk            => clk,
        i_en           => local_en,
        i_rst          => local_rst,
        i_mdthit       => mdt_hits(i),
        i_seed         => i_seed,
        i_eof          => i_eof,
        o_cluster_hits => cluster_hits_ml(i),
        o_fitter_en    => fitter_en_ml(i)
      );

    summing : for k IN 0 to CSF_MAX_CLUSTERS - 1 generate
    begin

      csf_sum : entity csf_lib.ncsf_sums
        port map (
          clk      => clk,
          i_rst    => local_rst,
          i_hit    => cluster_hits_ml(i)(k),
          i_fit_en => fitter_en_ml(i)(k),
          o_sums   => sums_ml(i)(k)
        );

    end generate summing;

  end generate clustering_gen;

  fitter : entity csf_lib.ncsf_fit
    port map (
      clk        => clk,
      i_rst      => local_rst,
      i_sums_ml0 => sums_ml(0),
      i_sums_ml1 => sums_ml(1),
      o_seg      => locseg
    );

  ---- Coordinate transformation
  coordtransform : entity csf_lib.seg_coord_transform
    generic map (
      is_endcap   => is_endcap,
      mdt_station => mdt_station
    )
    port map (
      clk       => clk,
      i_locseg  => locseg,
      i_seed    => coord_seed,
      o_globseg => o_seg
    );

  csf_proc : process (clk) is
  begin

    if rising_edge(clk) then
      mdt_hits                                   <= (OTHERS => (OTHERS => '0'));
      mdt_hits(stdlogic_integer(mdt_hit.mlayer)) <= i_mdt_hit;

      if (seed_i.data_valid = '1') then
        seed <= i_seed;
      end if;

      if (i_eof = '1') then
        coord_seed <= seed;
      end if;

      -- Reset the Chi2 and Output
      if (local_rst = '1') then
        seed <= (OTHERS => '0');
      end if;
    end if;

  end process csf_proc;

end architecture behavioral;
