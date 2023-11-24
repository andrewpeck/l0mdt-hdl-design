--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_out2cpl.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_out2cpl.vhd
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
library  vamc_lib;

entity ucm_out2cpl is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --  
    -- ctrl_v              : in std_logic_vector;
    -- mon_v               : out std_logic_vector;
    --
    i_proc_info_av      : in ucm_proc_info_avt(c_NUM_ACCEPTS -1 downto 0);
    i_data_av           : in ucm_cde2pl_avt(c_MAX_NUM_SL -1 downto 0);

    -- 
    o_uCM2pl_av         : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0)

  );
end entity;

architecture beh of ucm_out2cpl is

  signal pl_i_proc_info_av      : ucm_proc_info_avt(c_NUM_ACCEPTS -1 downto 0);
  

  signal i_proc_info_ar      : ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0);
  signal i_data_ar           :ucm_cde2pl_art(c_MAX_NUM_SL -1 downto 0);

    -- 
  signal o_uCM2pl_ar         : ucm2pl_art(c_MAX_NUM_SL -1 downto 0);

begin

  -- i_proc_info_ar <= convert(i_proc_info_av,i_proc_info_ar);
  -- i_data_ar <= convert(i_data_av,i_data_ar);
  -- o_uCM2pl_av <= convert(o_uCM2pl_ar,o_uCM2pl_av);


  PL_INFO_FOR : for sl_i in c_NUM_ACCEPTS -1 downto 0 generate
    INFO_PL : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 6,
      g_PL_DV => '0',
      g_PIPELINE_WIDTH    => i_proc_info_av(sl_i)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      i_data      => i_proc_info_av(sl_i),
      -- i_dv        => atan_slope_dv,
      o_data      => pl_i_proc_info_av(sl_i)
      -- o_dv        => pl_atan_slope_dv
    );
    i_proc_info_ar(sl_i) <= convert(pl_i_proc_info_av(sl_i),i_proc_info_ar(sl_i));
  end generate;
    

  MPL_ASSIGN : for sl_i in c_MAX_NUM_SL -1 downto 0 generate


    PAM2CPL : if sl_i >= c_MAX_NUM_SL - c_NUM_ACCEPTS generate
      -- i_proc_info_ar(sl_i - (c_MAX_NUM_SL - c_NUM_ACCEPTS)) <= convert(pl_i_proc_info_av(sl_i - (c_MAX_NUM_SL - c_NUM_ACCEPTS)),i_proc_info_ar(sl_i - (c_MAX_NUM_SL - c_NUM_ACCEPTS)));
      o_uCM2pl_ar(sl_i).busy <= i_proc_info_ar(sl_i - (c_MAX_NUM_SL - c_NUM_ACCEPTS)).processed;
      o_uCM2pl_ar(sl_i).process_ch <= i_proc_info_ar(sl_i - (c_MAX_NUM_SL - c_NUM_ACCEPTS)).th;
    else generate
      
      o_uCM2pl_ar(sl_i).busy <= '0';
      o_uCM2pl_ar(sl_i).process_ch <= (others => '0') ;
    end generate;
    

    i_data_ar(sl_i) <= convert(i_data_av(sl_i),i_data_ar(sl_i));
    o_uCM2pl_av(sl_i) <= convert(o_uCM2pl_ar(sl_i),o_uCM2pl_av(sl_i));

    
    o_uCM2pl_ar(sl_i).data_valid <= i_data_ar(sl_i).data_valid;
    o_uCM2pl_ar(sl_i).common <= i_data_ar(sl_i).common;
    o_uCM2pl_ar(sl_i).phimod <= i_data_ar(sl_i).phimod;
    o_uCM2pl_ar(sl_i).nswseg_angdtheta <= i_data_ar(sl_i).nswseg_angdtheta;
    o_uCM2pl_ar(sl_i).nswseg_posphi <= i_data_ar(sl_i).nswseg_posphi;
    o_uCM2pl_ar(sl_i).nswseg_poseta <= i_data_ar(sl_i).nswseg_poseta;
  end generate;

  

  

end architecture;