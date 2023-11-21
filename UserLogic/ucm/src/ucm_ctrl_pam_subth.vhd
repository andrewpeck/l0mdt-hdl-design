--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_ctrl_pam_subth.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_ctrl_pam_subth.vhd
-- -----
-- File Created: Monday, 20th November 2023 3:57:29 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 20th November 2023 3:57:33 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------


library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.sl2mdt_constants_pkg.all;


-- use shared_lib.detector_param_pkg.all;
-- use shared_lib.detector_time_param_pkg.all;

library dp_repo_lib;
use dp_repo_lib.barrel_eta2chamber_pkg.all;


library ucm_lib;
use ucm_lib.ucm_pkg.all;

library  vamc_lib;


entity ucm_ctrl_pam_subth is
  generic(
    g_NUM_CHAMBERS : integer := 6;
    g_LOWER_LIM : ucm_eta_lim_ait(0 to g_NUM_CHAMBERS);
    g_UPPER_LIM : ucm_eta_lim_ait(0 to g_NUM_CHAMBERS)
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;

    i_poseta            : in signed(SL2MDT_SLC_COMMON_POSETA_LEN-1 downto 0); -- 14
    i_dv                : in std_logic;

    o_num_ch            : out unsigned(3 downto 0);
    o_min_ch            : out unsigned(3 downto 0);
    o_max_ch            : out unsigned(3 downto 0);
    o_dv                : out std_logic
  );
end entity;

architecture beh of ucm_ctrl_pam_subth is

  signal i_poseta_i : integer;
  signal chamber : std_logic_vector (6 - 1 downto 0);
  signal ch_dv : std_logic;

begin

  i_poseta_i <= to_integer(i_poseta);

  process (clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        chamber <= (others => '0');
      else
        ch_dv <= i_dv;
        if i_dv = '1' then
          if i_poseta_i < g_UPPER_LIM(1) then
            chamber(0) <= '1';
          else 
            chamber(0) <= '0';
          end if;
          if i_poseta_i > g_LOWER_LIM(1) and i_poseta_i < g_UPPER_LIM(2) then
            chamber(1) <= '1';
          else 
            chamber(1) <= '0';
          end if;
          if i_poseta_i > g_LOWER_LIM(2) and i_poseta_i < g_UPPER_LIM(3) then
            chamber(2) <= '1';
          else 
            chamber(2) <= '0';
          end if;
          if i_poseta_i > g_LOWER_LIM(3) and i_poseta_i < g_UPPER_LIM(4) then
            chamber(3) <= '1';
          else 
            chamber(3) <= '0';
          end if;
          if i_poseta_i > g_LOWER_LIM(4) and i_poseta_i < g_UPPER_LIM(5) then
            chamber(4) <= '1';
          else 
            chamber(4) <= '0';
          end if;
          if i_poseta_i >  g_LOWER_LIM(5) then
            chamber(5) <= '1';
          else 
            chamber(5) <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;

  process (clk)
    variable cnt_ch : unsigned(3 downto 0) := "0000";
    variable min_ch : unsigned(3 downto 0) := "1111";
    variable max_ch : unsigned(3 downto 0) := "1111";
  begin
    if rising_edge(clk) then
      if rst = '1' then
        o_min_ch <= (others => '0');
        o_max_ch <= (others => '0');
        o_num_ch <= (others => '0');
        o_dv <= '0';  
      else
        o_dv <= ch_dv;
        if ch_dv = '1' then
          cnt_ch := x"0";
          min_ch := x"F";
          max_ch := x"F";
          for ch_i in 0 to chamber'length - 1 loop
            if min_ch = x"F" then
              if chamber(ch_i) = '1' then 
                min_ch := to_unsigned(ch_i,4);
              end if;
            else
              if max_ch = x"F" then
                if chamber(ch_i) = '0' then 
                  max_ch := to_unsigned(ch_i - 1,4);
                end if;
              end if;
            end if;
            cnt_ch := cnt_ch + ("000" & chamber(ch_i));
          end loop;  
          o_num_ch <= cnt_ch;
          o_min_ch <= min_ch;
          o_max_ch <= max_ch;
        end if;
      end if;
    end if;
  end process;
  

end architecture;