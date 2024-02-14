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
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library fm_lib;
use fm_lib.fm_types.all;

entity hits_to_segments is
  port (
    -- Clock and control
    clock_and_control : in l0mdt_control_rt;
    ttc_commands      : in l0mdt_ttc_rt;

    -- Slow Control
    inn_ctrl_v : in  std_logic_vector;  --H2S_CTRL_t;
    inn_mon_v  : out std_logic_vector;  --H2S_MON_t;
    mid_ctrl_v : in  std_logic_vector;  --H2S_CTRL_t;
    mid_mon_v  : out std_logic_vector;  --H2S_MON_t;
    out_ctrl_v : in  std_logic_vector;  --H2S_CTRL_t;
    out_mon_v  : out std_logic_vector;  --H2S_MON_t;
    ext_ctrl_v : in  std_logic_vector;  --H2S_CTRL_t;
    ext_mon_v  : out std_logic_vector;  --H2S_MON_t;

    -- Fast Monitoring
    fm_hps_mon_v : out std_logic_vector; --h2s_mon_data;

    -- TDC Hits from Polmux
    i_inn_tar_hits_av : in tar2hps_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mid_tar_hits_av : in tar2hps_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_out_tar_hits_av : in tar2hps_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_ext_tar_hits_av : in tar2hps_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    -- Sector Logic Candidates from uCM
    i_inn_slc_av : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);
    i_mid_slc_av : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);
    i_out_slc_av : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);
    i_ext_slc_av : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);

    -- Segments Out
    o_inn_segments_av : out sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);
    o_mid_segments_av : out sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);
    o_out_segments_av : out sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);
    o_ext_segments_av : out sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);

    -- Segments Out to Neighbor
    o_plus_neighbor_segments_av  : out sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments_av : out sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0)

   -- o_sump : out std_logic
    );

end entity hits_to_segments;

architecture beh of hits_to_segments is

  signal glob_en : std_logic;

  signal inn_reset : std_logic := '0';
  signal mid_reset : std_logic := '0';
  signal out_reset : std_logic := '0';
  signal ext_reset : std_logic := '0';

  signal fm_hps_mon_r : fm_hps_mon;
  signal fm_hps_sf_mon_inn_v : std_logic_vector(fm_hps_sf_mon'w-1 downto 0);
  signal fm_hps_sf_mon_mid_v : std_logic_vector(fm_hps_sf_mon'w-1 downto 0);
  signal fm_hps_sf_mon_out_v : std_logic_vector(fm_hps_sf_mon'w-1 downto 0);     
  signal fm_hps_sf_mon_ext_v : std_logic_vector(fm_hps_sf_mon'w-1 downto 0);
  
  attribute MAX_FANOUT              : string;
  attribute MAX_FANOUT of inn_reset : signal is "256";
  attribute MAX_FANOUT of mid_reset : signal is "256";
  attribute MAX_FANOUT of out_reset : signal is "256";
  attribute MAX_FANOUT of ext_reset : signal is "256";

begin

  FM_CTRL_GEN : if c_FM_ENABLED generate
    fm_hps_mon_r.fm_hps_mon_inn   <= convert(fm_hps_sf_mon_inn_v, fm_hps_mon_r.fm_hps_mon_inn );
    fm_hps_mon_r.fm_hps_mon_mid  <= convert(fm_hps_sf_mon_mid_v, fm_hps_mon_r.fm_hps_mon_mid);
    fm_hps_mon_r.fm_hps_mon_out  <= convert( fm_hps_sf_mon_out_v,   fm_hps_mon_r.fm_hps_mon_out );
    
    fm_hps_mon_v <= convert(fm_hps_mon_r, fm_hps_mon_v);
  else generate
    
  end generate;


  

  process (clock_and_control.clk) is
  begin
    if (rising_edge(clock_and_control.clk)) then
      inn_reset <= clock_and_control.rst;
      mid_reset <= clock_and_control.rst;
      out_reset <= clock_and_control.rst;
      ext_reset <= clock_and_control.rst;
    end if;
  end process;

  glob_en <= '1';

  o_plus_neighbor_segments_av  <= (others => (others => '1'));
  o_minus_neighbor_segments_av <= (others => (others => '1'));

  HPS_INN : if c_HPS_ENABLE_ST_INN = '1' generate
  begin

    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS => 0,
        g_HPS_NUM_MDT_CH => c_HPS_NUM_MDT_CH_INN
        )
      port map(
        clk     => clock_and_control.clk,
        rst     => inn_reset,
        glob_en => glob_en,

        ctrl_v      => inn_ctrl_v,
        mon_v       => inn_mon_v,
        fm_hps_mon_v => fm_hps_sf_mon_inn_v,

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,

        -- SLc
        i_uCM2hps_av => i_inn_slc_av,

        -- MDT hit
        i_mdt_tar_av => i_inn_tar_hits_av,

        -- to pt calc
        o_sf2pt_av => o_inn_segments_av
        );
  else generate
  begin
    inn_mon_v         <= (inn_mon_v'length - 1 downto 0 => '0');
    o_inn_segments_av <= (others                        => (others => '1'));
  end generate;

  HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
  begin
    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 1,
        g_HPS_NUM_MDT_CH     => c_HPS_NUM_MDT_CH_MID
      )
      port map(
        clk     => clock_and_control.clk,
        rst     => mid_reset,
        glob_en => glob_en,

        ctrl_v      => mid_ctrl_v,
        mon_v       => mid_mon_v,
        fm_hps_mon_v => fm_hps_sf_mon_mid_v,

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,

        -- SLc
        i_uCM2hps_av => i_mid_slc_av,

        -- MDT hit
        i_mdt_tar_av => i_mid_tar_hits_av,

        -- to pt calc
        o_sf2pt_av => o_mid_segments_av
        );
  else generate
  begin
    mid_mon_v         <= (mid_mon_v'length - 1 downto 0 => '0');
    o_mid_segments_av <= (others                        => (others => '1'));
  end generate;

  HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
  begin

    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 2,
        g_HPS_NUM_MDT_CH     => c_HPS_NUM_MDT_CH_OUT
      )
      port map(
        clk     => clock_and_control.clk,
        rst     => out_reset,
        glob_en => glob_en,

        ctrl_v      => out_ctrl_v,
        mon_v       => out_mon_v,
        fm_hps_mon_v => fm_hps_sf_mon_out_v,

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,

        -- SLc
        i_uCM2hps_av => i_out_slc_av,

        -- MDT hit
        i_mdt_tar_av => i_out_tar_hits_av,

        -- to pt calc
        o_sf2pt_av => o_out_segments_av
        );
  else generate
  begin
    out_mon_v         <= (out_mon_v'length - 1 downto 0 => '0');
    o_out_segments_av <= (others                        => (others => '1'));
  end generate;

  HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
  begin

    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 3,
        g_HPS_NUM_MDT_CH     => c_HPS_NUM_MDT_CH_EXT
      )
      port map(
        clk     => clock_and_control.clk,
        rst     => ext_reset,
        glob_en => glob_en,

        ctrl_v      => ext_ctrl_v,
        mon_v       => ext_mon_v,
        fm_hps_mon_v => fm_hps_sf_mon_ext_v, -- placeholder - Need to insert SB for EXT 

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,

        -- SLc
        i_uCM2hps_av => i_ext_slc_av,

        -- MDT hit
        i_mdt_tar_av => i_ext_tar_hits_av,

        -- to pt calc
        o_sf2pt_av => o_ext_segments_av
        );
  else generate
  begin
    ext_mon_v <= (ext_mon_v'length - 1 downto 0 => '0');

    o_ext_segments_av <= (others => (others => '1'));
  end generate;

end architecture beh;
