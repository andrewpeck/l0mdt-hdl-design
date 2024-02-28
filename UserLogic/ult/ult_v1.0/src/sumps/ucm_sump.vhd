--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: sumps
-- File: ucm_sump.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_sump.vhd
-- -----
-- File Created: Thursday, 16th March 2023 3:06:53 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 19th February 2024 12:11:20 pm
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
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_sump is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;
    glob_freeze            : in std_logic;
    ttc_commands            : in l0mdt_ttc_rt;
    -- configuration, control & Monitoring
    ctrl_v              : in  std_logic_vector;--UCM_CTRL_t;
    mon_v               : out std_logic_vector;--UCM_MON_t;
    -- Sector Logic Candidates
    i_slc_data_mainA_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_neighborA_v : in slc_rx_vt;
    i_slc_data_neighborB_v : in slc_rx_vt;

    -- Sector Logic Candidates Out of X-point Switch
    o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

    o_sump_b : out std_logic
  );
  
end entity ucm_sump;

architecture beh of ucm_sump is

  signal slc_data_mainA_av      : std_logic_vector(2 downto 0);
  signal slc_data_mainB_av      : std_logic_vector(2 downto 0);
  signal slc_data_neighborA_b   : std_logic;
  signal slc_data_neighborB_b   : std_logic;
  signal ctrl_b                 : std_logic;
  signal mon_b                  : std_logic;
  signal sump                   : std_logic_vector(31 downto 0);

begin

    MDT_INN_SUMP: for I in 0 to 2 generate
      slc_data_mainA_av(I) <= xor_reduce(i_slc_data_mainA_av(I));
      slc_data_mainB_av(I) <= xor_reduce(i_slc_data_mainB_av(I));
    end generate;
    slc_data_neighborA_b <= xor_reduce(i_slc_data_neighborA_v);
    slc_data_neighborB_b <= xor_reduce(i_slc_data_neighborB_v);
   
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
                    xor xor_reduce(slc_data_mainA_av)
                    xor xor_reduce(slc_data_mainB_av)
                    xor slc_data_neighborA_b 
                    xor slc_data_neighborB_b;
          end if;
        end if;
      end if;
    end process;
    ucm2hps: for i_th in c_NUM_THREADS -1 downto 0 generate
      INN_GEN : if c_ENABLED_ST(0) = '1' generate
        DES_OUT : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => o_uCM2hps_inn_av(i_th)'length)
          port map(clk => clk,rst  => rst,i_data => sump(i_th),o_data => o_uCM2hps_inn_av(i_th));
      end generate;
      MID_GEN : if c_ENABLED_ST(1) = '1' generate    
        DES_OUT : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => o_uCM2hps_mid_av(i_th)'length)
          port map(clk => clk,rst  => rst,i_data => sump(i_th),o_data => o_uCM2hps_mid_av(i_th));
      end generate;
      OUT_GEN : if c_ENABLED_ST(2) = '1' generate
        DES_OUT : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => o_uCM2hps_out_av(i_th)'length)
          port map(clk => clk,rst  => rst,i_data => sump(i_th),o_data => o_uCM2hps_out_av(i_th));
      end generate;
      EXT_GEN : if c_ENABLED_ST(3) = '1' generate
        DES_OUT : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => o_uCM2hps_ext_av(i_th)'length)
          port map(clk => clk,rst  => rst,i_data => sump(i_th),o_data => o_uCM2hps_ext_av(i_th));
      end generate;
    end generate;
    ucm2mpl: for i_sl in c_MAX_NUM_SL -1 downto 0 generate  
      DES_OUT : entity shared_lib.vhdl_utils_deserializer 
        generic map (g_DATA_WIDTH => o_uCM2pl_av(i_sl)'length)
        port map(clk => clk,rst  => rst,i_data => sump(i_sl),o_data => o_uCM2pl_av(i_sl));
    end generate;
      mon_out : entity shared_lib.vhdl_utils_deserializer 
        generic map (g_DATA_WIDTH => mon_v'length)
        port map(clk => clk,rst  => rst,i_data => sump(0),o_data => mon_v);
  
end architecture beh;

