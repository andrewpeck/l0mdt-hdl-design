--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_ctrl_pam_m_th.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_ctrl_pam_m_th.vhd
-- -----
-- File Created: Thursday, 23rd November 2023 1:21:11 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 23rd November 2023 1:21:22 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

-- use shared_lib.detector_param_pkg.all;
-- use shared_lib.detector_time_param_pkg.all;
-- use shared_lib.barrel_eta2chamber_pkg.all;

-- library dp_repo_lib;
-- use dp_repo_lib.barrel_eta2chamber_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;
use ucm_lib.ucm_vhdl_pkg.all;

-- library  vamc_lib;

entity ucm_ctrl_pam_m_th is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --
    i_main_count_i      : in integer;
    i_load              : in std_logic;
    i_slc               : in integer;
    --    
    
    o_busy              : out std_logic
    
  );
end entity;

architecture beh of ucm_ctrl_pam_m_th is
  signal time_org : integer;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if rst='1' then
        o_busy <= '0';
        time_org <= 0;
      else
        if o_busy = '1' then
          if i_main_count_i = time_org then
            o_busy <= '0';
          end if;
        else
          if i_load = '1' then 
            o_busy <= '1';
            time_org <= i_main_count_i;
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture;