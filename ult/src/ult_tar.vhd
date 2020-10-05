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
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;

library tar_lib;
use tar_lib.tar_pkg.all;

entity mdt_tar is
  port (
    -- pipeline clock
    clock_and_control : in  l0mdt_control_rt;
    ctrl              : in  TAR_CTRL_t;
    mon               : out TAR_MON_t;
    -- ttc
    ttc_commands      : in  l0mdt_ttc_rt;
    -- Sector Logic Candidates
    -- TDC Hits from Polmux
    i_inner_tdc_hits  : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tdc_hits : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tdc_hits  : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tdc_hits  : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    i_inner_tar_hits  : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tar_hits : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tar_hits  : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tar_hits  : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inner_tdc_hits  : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_middle_tdc_hits : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_outer_tdc_hits  : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_extra_tdc_hits  : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inner_tar_hits  : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_middle_tar_hits : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_outer_tar_hits  : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_extra_tar_hits  : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0)

    );
end entity mdt_tar;

architecture beh of mdt_tar is
  -- signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  -- signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
  -- signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  -- signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_EXT-1 downto 0);
  signal glob_en : std_logic := '1';
begin

  --   TAR : process(clock_and_control.clk)
  --   begin
  --     if rising_edge(clock_and_control.clk) then
  --       if clock_and_control.rst = '1' then
  --         o_inner_tar_hits  <= nullify(o_inner_tar_hits);
  --         o_middle_tar_hits <= nullify(o_middle_tar_hits);º
  --         o_outer_tar_hits  <= nullify(o_outer_tar_hits);
  --         o_extra_tar_hits  <= nullify(o_extra_tar_hits);
  --       elsif (c_EN_MDT_HITS = 1) then
  --         o_inner_tar_hits  <= (others => (others => xor_reduce(tdc_hit_inner_sump)));
  --         o_middle_tar_hits <= (others => (others => xor_reduce(tdc_hit_inner_sump)));
  --         o_outer_tar_hits  <= (others => (others => xor_reduce(tdc_hit_inner_sump)));
  --         o_extra_tar_hits  <= (others => (others => xor_reduce(tdc_hit_inner_sump)));
  --       elsif (c_EN_TAR_HITS = 1) then
  --         o_inner_tar_hits  <= i_inner_tar_hits;
  --         o_middle_tar_hits <= i_middle_tar_hits;
  --         o_outer_tar_hits  <= i_outer_tar_hits;
  --         o_extra_tar_hits  <= i_extra_tar_hits;
  --       end if;
  --     end if;
  --   end process TAR;

  --   NO_MAPPING_GEN : if c_EN_TAR_HITS = 0 generate

  --   sump_proc : process (clock_and_control.clk) is
  --   begin  -- process tdc_hit_sump_proc
  --     if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

  --       inner_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_INN-1 loop
  --         tdc_hit_inner_sump(I) <= xor_reduce(vectorify(i_inner_tdc_hits(I)));
  --       end loop;
  --       middle_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_MID-1 loop
  --         tdc_hit_middle_sump(I) <= xor_reduce(vectorify(i_middle_tdc_hits(I)));
  --       end loop;
  --       outer_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_OUT-1 loop
  --         tdc_hit_outer_sump(I) <= xor_reduce(vectorify(i_outer_tdc_hits(I)));
  --       end loop;
  --       extra_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_EXT-1 loop
  --         tdc_hit_extra_sump(I) <= xor_reduce(vectorify(i_extra_tdc_hits(I)));
  --       end loop;

  --     end if;
  --   end process;

  -- end generate;

  TAR_GEN : if c_TAR_ENABLED generate

    TDC_INPUTS_GEN : if c_TAR_INSEL = '1' generate

      TAR : entity tar_lib.tar
      port map (
        -- clock, control, and monitoring
        clk             => clock_and_control.clk,
        rst             => clock_and_control.rst,
        glob_en         => glob_en,
        -- TDC Hits from Polmux
        i_inn_tdc_hits  => i_inner_tdc_hits,
        i_mid_tdc_hits  => i_middle_tdc_hits,
        i_out_tdc_hits  => i_outer_tdc_hits,
        i_ext_tdc_hits  => i_extra_tdc_hits,
        -- candidates in from hal
        -- i_inn_tar_hits  => i_inner_tar_hits,
        -- i_mid_tar_hits  => i_middle_tar_hits,
        -- i_out_tar_hits  => i_outer_tar_hits,
        -- i_ext_tar_hits  => i_extra_tar_hits,
        -- 
        o_inn_tdc_hits  => o_inner_tdc_hits,
        o_mid_tdc_hits  => o_middle_tdc_hits,
        o_out_tdc_hits  => o_outer_tdc_hits,
        o_ext_tdc_hits  => o_extra_tdc_hits,
        -- outputs to ucm
        o_inn_tar_hits  => o_inner_tar_hits,
        o_mid_tar_hits  => o_middle_tar_hits,
        o_out_tar_hits  => o_outer_tar_hits,
        o_ext_tar_hits  => o_extra_tar_hits
  
      );

    end generate;

    TAR_INPUTS_GEN : if c_TAR_INSEL = '0' generate

      TAR : entity tar_lib.tar_tp
      port map (
        -- clock, control, and monitoring
        clk             => clock_and_control.clk,
        rst             => clock_and_control.rst,
        glob_en         => glob_en,
        -- TDC Hits from Polmux
        -- i_inn_tdc_hits  => i_inner_tdc_hits,
        -- i_mid_tdc_hits  => i_middle_tdc_hits,
        -- i_out_tdc_hits  => i_outer_tdc_hits,
        -- i_ext_tdc_hits  => i_extra_tdc_hits,
        -- candidates in from hal
        i_inn_tar_hits  => i_inner_tar_hits,
        i_mid_tar_hits  => i_middle_tar_hits,
        i_out_tar_hits  => i_outer_tar_hits,
        i_ext_tar_hits  => i_extra_tar_hits,
        -- 
        -- o_inn_tdc_hits  => o_inner_tdc_hits,
        -- o_mid_tdc_hits  => o_middle_tdc_hits,
        -- o_out_tdc_hits  => o_outer_tdc_hits,
        -- o_ext_tdc_hits  => o_extra_tdc_hits,
        -- outputs to ucm
        o_inn_tar_hits  => o_inner_tar_hits,
        o_mid_tar_hits  => o_middle_tar_hits,
        o_out_tar_hits  => o_outer_tar_hits,
        o_ext_tar_hits  => o_extra_tar_hits

      );

    end generate;

  end generate;



end architecture beh;
