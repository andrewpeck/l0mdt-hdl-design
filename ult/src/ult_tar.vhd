--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: MDT tdc data addres remap
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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

entity mdt_tar is
  port (
    -- pipeline clock
    clock_and_control : in l0mdt_control_rt;
    -- ttc
    ttc_commands : in l0mdt_ttc_rt;
    -- Sector Logic Candidates
    -- TDC Hits from Polmux
    -- i_inner_tdc_hits              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- i_middle_tdc_hits             : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- i_outer_tdc_hits              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- i_extra_tdc_hits              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    i_inner_tar_hits              : in tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tar_hits             : in tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tar_hits              : in tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tar_hits              : in tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inner_tdc_hits              : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_middle_tdc_hits             : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_outer_tdc_hits              : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_extra_tdc_hits              : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inner_tar_hits              : out tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_middle_tar_hits             : out tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_outer_tar_hits              : out tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_extra_tar_hits              : out tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0)

    );
end entity mdt_tar;

architecture beh of mdt_tar is
  
begin

    TAR: process(clock_and_control.clk)
    begin
      if rising_edge(clock_and_control.clk) then
        if clock_and_control.rst = '1' then
          o_inner_tar_hits  <= nullify(o_inner_tar_hits );
          o_middle_tar_hits <= nullify(o_middle_tar_hits);
          o_outer_tar_hits  <= nullify(o_outer_tar_hits );
          o_extra_tar_hits  <= nullify(o_extra_tar_hits );
        else
          o_inner_tar_hits  <= i_inner_tar_hits;
          o_middle_tar_hits <= i_middle_tar_hits;
          o_outer_tar_hits  <= i_outer_tar_hits;
          o_extra_tar_hits  <= i_extra_tar_hits;
        end if;
      end if;
    end process TAR;

  
  
  
end architecture beh;