--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: sumps
-- File: tar_sump.vhd
-- Module: <<moduleName>>
-- File PATH: /tar_sump.vhd
-- -----
-- File Created: Monday, 12th February 2024 7:35:33 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 19th February 2024 7:27:49 pm
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
 
library vamc_lib;

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;

entity tar_sump is
  generic(
    g_HPS_MAX_HP : integer := 6;
    g_STATION :   integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    glob_freeze            : in std_logic;
    --
    ctrl_v            : in std_logic_vector; --  : in  TAR_CTRL_t;
    mon_v             : out std_logic_vector;--  : out TAR_MON_t;
    -- TDC Hits from Polmux
    i_tdc_hits_av    : in  tdcpolmux2tar_avt (g_HPS_MAX_HP -1 downto 0);
    -- TDC polmux from Tar
    -- o_tdc_hits_av    : out tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
    -- TDC Hits from Tar
    o_tar_hits_av    : out tar2hps_avt(g_HPS_MAX_HP -1 downto 0);

    o_sump_b : out std_logic
  );
  
end entity tar_sump;

architecture beh of tar_sump is

  signal i_tdc_hits_ab    : std_logic_vector (g_HPS_MAX_HP -1 downto 0);
  signal sump                   : std_logic_vector(31 downto 0);

begin

  MDT_INN_SUMP: for I in 0 to g_HPS_MAX_HP-1 generate
    i_tdc_hits_ab(I) <= xor_reduce(i_tdc_hits_av(I));
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
                  xor xor_reduce(i_tdc_hits_ab);
        end if;
      end if;
    end if;
  end process;
  ucm2mpl: for i_hp in g_HPS_MAX_HP -1 downto 0 generate  
    DES_OUT : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => o_tar_hits_av(i_hp)'length)
      port map(clk => clk,rst  => rst,i_data => sump(i_hp),o_data => o_tar_hits_av(i_hp));
  end generate;
    mon_out : entity shared_lib.vhdl_utils_deserializer 
    generic map (g_DATA_WIDTH => mon_v'length)
    port map(clk => clk,rst  => rst,i_data => sump(0),o_data => mon_v);

  
end architecture beh;

