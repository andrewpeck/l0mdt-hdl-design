--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: sumps
-- File: h2s_sump.vhd
-- Module: <<moduleName>>
-- File PATH: /h2s_sump.vhd
-- -----
-- File Created: Thursday, 16th March 2023 3:06:53 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 19th February 2024 11:20:08 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
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
use fm_lib.fm_types.all;

library ult_lib;
  use ult_lib.ult_pkg.all;

entity h2s_sump is
  generic(
    g_STATION_RADIUS : integer := 0;    --station
    g_HPS_NUM_MDT_CH : integer := 6
    );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;
    glob_freeze            : in std_logic;

    -- control
    ctrl_v            : in std_logic_vector;-- HPS_CTRL_t;
    mon_v             : out std_logic_vector;--HPS_MON_t;
    fm_hps_mon_v       : out std_logic_vector; -- fm_hps_sf_mon ; --fm_rt_array(0 to h2s_sb_single_station_n - 1);
    -- SLc
    i_uCM2hps_av      : in  ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    i_mdt_tar_av      : in  tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- to pt calc
    o_sf2pt_av        : out sf2ptcalc_avt(c_NUM_THREADS -1 downto 0);
    
    o_sump_b : out std_logic
  );
  


end entity h2s_sump;

architecture beh of h2s_sump is

  signal tar_hits_sump            : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  signal slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  signal sump                   : std_logic_vector(31 downto 0);
begin

  MDT_INN_SUMP: for I in 0 to c_NUM_THREADS-1 generate
    slc_sump(I) <= xor_reduce(i_uCM2hps_av(I));
  end generate;
  MDT_MID_SUMP: for I in 0 to c_HPS_NUM_MDT_CH_MID-1 generate
    tar_hits_sump(I) <= xor_reduce(i_mdt_tar_av(I));
  end generate;
    
  o_sump_b <= sump(0);
      
  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        -- o_uCM2hps_inn_av <= (others => (others => '0'));
        -- o_uCM2hps_mid_av <= (others => (others => '0'));
        -- o_uCM2hps_out_av <= (others => (others => '0'));
        -- o_uCM2hps_ext_av <= (others => (others => '0'));
        -- o_uCM2pl_av <= (others => (others => '0'));
      else
        if glob_en then
          sump(30 downto 0) <= sump(31 downto 1);
          sump(31) <= glob_freeze xor xor_reduce(ctrl_v) 
                  xor xor_reduce(tar_hits_sump)
                  xor xor_reduce(slc_sump);
        end if;
      end if;
    end if;
  end process;

  hps2pt: for i_th in c_NUM_THREADS -1 downto 0 generate
    DES_OUT : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => o_sf2pt_av(i_th)'length)
      port map(clk => clk,rst  => rst,i_data => sump(i_th),o_data => o_sf2pt_av(i_th));
  end generate;
  mon_out : entity shared_lib.vhdl_utils_deserializer 
    generic map (g_DATA_WIDTH => mon_v'length)
    port map(clk => clk,rst  => rst,i_data => sump(0),o_data => mon_v);
  
end architecture beh;

