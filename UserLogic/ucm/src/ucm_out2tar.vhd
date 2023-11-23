--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_out2tar.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_out2tar.vhd
-- -----
-- File Created: Tuesday, 14th November 2023 10:02:37 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 14th November 2023 10:05:56 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
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

entity ucm_out2tar is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --  
    -- ctrl_v              : in std_logic_vector;
    -- mon_v               : out std_logic_vector;
    --
    i_proc_info_av      : in ucm_pam2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    -- 
    o_uCM2tar_inn_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_mid_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_out_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_ext_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0)
  );
end entity;

architecture beh of ucm_out2tar is

begin

  

end architecture;