--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Muon Candidate Manager
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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library fm_lib;
use fm_lib.fm_ult_pkg.all;

entity hits_to_segments is
  port (
    -- clock and control

    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    --
    inn_ctrl_v        : in  std_logic_vector; --H2S_CTRL_t;
    inn_mon_v         : out std_logic_vector; --H2S_MON_t;
    mid_ctrl_v        : in  std_logic_vector; --H2S_CTRL_t;
    mid_mon_v         : out std_logic_vector; --H2S_MON_t;
    out_ctrl_v        : in  std_logic_vector; --H2S_CTRL_t;
    out_mon_v         : out std_logic_vector; --H2S_MON_t;
    ext_ctrl_v        : in  std_logic_vector; --H2S_CTRL_t;
    ext_mon_v         : out std_logic_vector; --H2S_MON_t;
    --
    h2s_fm_data       : out fm_rt_array(0 to h2s_sb_all_station_n - 1);
    -- TDC Hits from Polmux
    i_inn_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);
    -- Sector Logic Candidates from uCM
    i_inn_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_mid_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_out_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_ext_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    -- Segments Out
    o_inn_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_mid_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_out_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_ext_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    -- Segments Out to Neighbor
    o_plus_neighbor_segments_av  : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments_av : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0)

    -- o_sump : out std_logic
  );



end entity hits_to_segments;

architecture beh of hits_to_segments is
  -- ctrl&mon signals
  -- signal ctrl_r : H2S_CTRL_t;
  -- signal mon_r  : H2S_MON_t;
  --
  signal glob_en : std_logic;
begin

  -- ctrl_r <= structify(ctrl_v,ctrl_r);
  -- mon_v <= vectorify(mon_r,mon_v);

  glob_en <= '1';

  o_plus_neighbor_segments_av  <= (others => (others => '0'));
  o_minus_neighbor_segments_av <= (others => (others => '0'));

  -- H2S_GEN : if c_H2S_ENABLED = '1' generate

    -- o_sump <= '0';

    HPS_INN : if c_HPS_ENABLE_ST_INN = '1' generate
      -- signal ctrl_hps_r : HPS_CTRL_t;
      -- signal ctrl_hps_v : std_logic_vector(len(ctrl_hps_r) -1 downto 0);
      -- signal mon_hps_r : HPS_MON_t;
      -- signal mon_hps_v : std_logic_vector(len(mon_hps_r) -1 downto 0);
    begin

      -- ctrl_hps_r <=  ctrl_r.hps(0);
      -- ctrl_hps_v <= vectorify(ctrl_hps_r,ctrl_hps_v);

      -- mon_r.hps(0) <= mon_hps_r;
      -- mon_hps_r <= structify(mon_hps_v,mon_hps_r);

      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 0,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_INN
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl_v              => inn_ctrl_v,
        mon_v               => inn_mon_v ,
        h2s_fm_data         => h2s_fm_data(0 to h2s_sb_single_station_n-1),
        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_inn_slc_av,
        -- MDT hit
        i_mdt_tar_av        => i_inn_tar_hits_av,
        -- to pt calc
        o_sf2pt_av          => o_inn_segments_av
      );
    end generate;

    HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
      -- signal ctrl_hps_r : HPS_CTRL_t;
      -- signal ctrl_hps_v : std_logic_vector(len(ctrl_hps_r) -1 downto 0);
      -- signal mon_hps_r : HPS_MON_t;
      -- signal mon_hps_v : std_logic_vector(len(mon_hps_r) -1 downto 0);
    begin

      -- ctrl_hps_r <=  ctrl_r.hps(1);
      -- ctrl_hps_v <= vectorify(ctrl_hps_r,ctrl_hps_v);

      -- mon_r.hps(1) <= mon_hps_r;
      -- mon_hps_r <= structify(mon_hps_v,mon_hps_r);

      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 1,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_MID
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl_v              => mid_ctrl_v,
        mon_v               => mid_mon_v ,
        h2s_fm_data         => h2s_fm_data(h2s_sb_single_station_n to h2s_sb_single_station_n*2-1),
        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_mid_slc_av,
        -- MDT hit
        i_mdt_tar_av        => i_mid_tar_hits_av,
        -- to pt calc
        o_sf2pt_av          => o_mid_segments_av
      );
    end generate;

    HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
      -- signal ctrl_hps_r : HPS_CTRL_t;
      -- signal ctrl_hps_v : std_logic_vector(len(ctrl_hps_r) -1 downto 0);
      -- signal mon_hps_r : HPS_MON_t;
      -- signal mon_hps_v : std_logic_vector(len(mon_hps_r) -1 downto 0);
    begin

      -- ctrl_hps_r <=  ctrl_r.hps(2);
      -- ctrl_hps_v <= vectorify(ctrl_hps_r,ctrl_hps_v);

      -- mon_r.hps(2) <= mon_hps_r;
      -- mon_hps_r <= structify(mon_hps_v,mon_hps_r);

      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 2,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_OUT
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl_v              => out_ctrl_v,
        mon_v               => out_mon_v ,
        h2s_fm_data         => h2s_fm_data(h2s_sb_single_station_n*2 to h2s_sb_single_station_n*3-1),
        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_out_slc_av,
        -- MDT hit
        i_mdt_tar_av        => i_out_tar_hits_av,
        -- to pt calc
        o_sf2pt_av          => o_out_segments_av
      );
    end generate;

    HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
      -- signal ctrl_hps_r : HPS_CTRL_t;
      -- signal ctrl_hps_v : std_logic_vector(len(ctrl_hps_r) -1 downto 0);
      -- signal mon_hps_r : HPS_MON_t;
      -- signal mon_hps_v : std_logic_vector(len(mon_hps_r) -1 downto 0) := (others => '0');
    begin

      -- ctrl_hps_r <=  ctrl_r.hps(3);
      -- ctrl_hps_v <= vectorify(ctrl_hps_r,ctrl_hps_v);

      -- mon_r.hps(3) <= mon_hps_r;
      -- mon_hps_r <= structify(mon_hps_v,mon_hps_r);

      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 3,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_EXT
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl_v              => ext_ctrl_v,
        mon_v               => ext_mon_v ,
        h2s_fm_data         => h2s_fm_data(h2s_sb_single_station_n*4 to h2s_sb_single_station_n*5-1),
        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_ext_slc_av,
        -- MDT hit
        i_mdt_tar_av        => i_ext_tar_hits_av,
        -- to pt calc
        o_sf2pt_av          => o_ext_segments_av
      );
    else  generate
      -- signal mon_hps_r : HPS_MON_t;
      -- signal mon_hps_v : std_logic_vector(len(mon_hps_r) -1 downto 0) := (others => '0');
    begin
      ext_mon_v <= (ext_mon_v'length - 1 downto 0 => '0');
      -- mon_r.hps(3) <= mon_hps_r;
      -- mon_hps_r <= structify(mon_hps_v,mon_hps_r);
      o_ext_segments_av <= (others => ( others => '0'));
    end generate;

  -- end generate;

  -- H2S_NO_GEN : if c_H2S_ENABLED = '0' generate
  --   signal inn_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_INN-1 downto 0);
  --   signal mid_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_MID-1 downto 0);
  --   signal out_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_OUT-1 downto 0);
  --   signal ext_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_EXT-1 downto 0);
  --   signal inn_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  --   signal mid_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  --   signal out_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  --   signal ext_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  -- begin
  --   o_inn_segments <= (others => (others => '0'));
  --   o_mid_segments <= (others => (others => '0'));
  --   o_out_segments <= (others => (others => '0'));
  --   o_ext_segments <= (others => (others => '0'));
  --   o_plus_neighbor_segments <= (others => (others => '0'));
  --   o_minus_neighbor_segments <= (others => (others => '0'));

  --   sump_proc : process (clock_and_control.clk) is
  --   begin  -- process tdc_hit_sump_proc
  --     if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

  --       inn_loop : for I in 0 to c_HPS_MAX_HP_INN-1 loop
  --         inn_tar_hits_sump(I) <= xor_reduce(i_inn_tar_hits(I));
  --       end loop;
  --       mid_loop : for I in 0 to c_HPS_MAX_HP_MID-1 loop
  --         mid_tar_hits_sump(I) <= xor_reduce(i_mid_tar_hits(I));
  --       end loop;
  --       out_loop : for I in 0 to c_HPS_MAX_HP_OUT-1 loop
  --         out_tar_hits_sump(I) <= xor_reduce(i_out_tar_hits(I));
  --       end loop;
  --       ext_loop : for I in 0 to c_HPS_MAX_HP_EXT-1 loop
  --         ext_tar_hits_sump(I) <= xor_reduce(i_ext_tar_hits(I));
  --       end loop;

  --       slc_inn_loop : for I in 0 to c_NUM_THREADS-1 loop
  --         inn_slc_sump(I) <= xor_reduce(i_inn_slc(I));
  --       end loop;
  --       slc_mid_loop : for I in 0 to c_NUM_THREADS-1 loop
  --         mid_slc_sump(I) <= xor_reduce(i_mid_slc(I));
  --       end loop;
  --       slc_out_loop : for I in 0 to c_NUM_THREADS-1 loop
  --         out_slc_sump(I) <= xor_reduce(i_out_slc(I));
  --       end loop;
  --       slc_ext_loop : for I in 0 to c_NUM_THREADS-1 loop
  --         ext_slc_sump(I) <= xor_reduce(i_ext_slc(I));
  --       end loop;


  --       o_sump <=   xor_reduce(inn_tar_hits_sump)
  --               xor xor_reduce(mid_tar_hits_sump)
  --               xor xor_reduce(out_tar_hits_sump)
  --               xor xor_reduce(ext_tar_hits_sump)
  --               xor xor_reduce(inn_slc_sump     )
  --               xor xor_reduce(mid_slc_sump     )
  --               xor xor_reduce(out_slc_sump     )
  --               xor xor_reduce(ext_slc_sump     );
  --     end if;
  --   end process;
  -- end generate;

end architecture beh;
