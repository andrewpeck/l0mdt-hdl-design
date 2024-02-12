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

  signal i_proc_info_ar : ucm_pam2tar_art(c_NUM_ACCEPTS -1 downto 0);
  type ucm2tar_aar is array (natural range<>) of ucm2tar_art(c_NUM_ACCEPTS -1 downto 0);
  signal o_uCM2tar_aar : ucm2tar_aar(0 to c_MAX_POSSIBLE_HPS - 1);
  -- signal o_uCM2tar_inn_ar : ucm2tar_art(c_NUM_ACCEPTS -1 downto 0);
  -- signal o_uCM2tar_mid_ar : ucm2tar_art(c_NUM_ACCEPTS -1 downto 0);
  -- signal o_uCM2tar_out_ar : ucm2tar_art(c_NUM_ACCEPTS -1 downto 0);
  -- signal o_uCM2tar_ext_ar : ucm2tar_art(c_NUM_ACCEPTS -1 downto 0);
begin

  ACCEPTS : for sl_i in c_NUM_ACCEPTS -1 downto 0 generate
    i_proc_info_ar(sl_i) <= convert(i_proc_info_av(sl_i),i_proc_info_ar(sl_i));
    o_uCM2tar_inn_av(sl_i) <= convert(o_uCM2tar_aar(0)(sl_i),o_uCM2tar_inn_av(sl_i));
    o_uCM2tar_mid_av(sl_i) <= convert(o_uCM2tar_aar(1)(sl_i),o_uCM2tar_mid_av(sl_i));
    o_uCM2tar_out_av(sl_i) <= convert(o_uCM2tar_aar(2)(sl_i),o_uCM2tar_out_av(sl_i));
    o_uCM2tar_ext_av(sl_i) <= convert(o_uCM2tar_aar(3)(sl_i),o_uCM2tar_ext_av(sl_i));


    ST_FOR_GEN : for st_i in c_MAX_NUM_HPS - 1 downto 0 generate
      ST_IF_GEN : if c_ENABLED_ST(st_i) = '1' generate
        o_uCM2tar_aar(st_i)(sl_i).data_valid <= i_proc_info_ar(sl_i).dv;
        o_uCM2tar_aar(st_i)(sl_i).action <= i_proc_info_ar(sl_i).action;
        o_uCM2tar_aar(st_i)(sl_i).chambers <= i_proc_info_ar(sl_i).ch_map(st_i);
        o_uCM2tar_aar(st_i)(sl_i).process_ch <= std_logic_vector(i_proc_info_ar(sl_i).th);
      else generate
        o_uCM2tar_aar(st_i)(sl_i).data_valid <='0';
        o_uCM2tar_aar(st_i)(sl_i).action <= (others => '0') ;
        o_uCM2tar_aar(st_i)(sl_i).chambers <= (others => '0') ;
        o_uCM2tar_aar(st_i)(sl_i).process_ch <= (others => '0') ;
      end generate;
    end generate;
  end generate;

  

end architecture;