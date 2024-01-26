--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: tar_remap.vhd
-- Module: <<moduleName>>
-- File PATH: /tar_remap.vhd
-- -----
-- File Created: Thursday, 30th November 2020 3:06:53 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 15th May 2023 9:38:38 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2023-05-15	GLdL	added new detector parameters data repo
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

-- use shared_lib.detector_param_pkg.all;
use shared_lib.fct_tdc_mezz_mapping_pkg.all;

-- library dp_repo_lib;
-- use dp_repo_lib.fct_tdc_mezz_mapping_pkg.all;

library tar_lib;
use tar_lib.tar_pkg.all;

entity tar_remap is
  generic (
    -- g_EN_TAR_HITS : integer := 1;
    -- g_EN_MDT_HITS : integer := 0;
    g_STATION : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- TDC Hits from Polmux
    i_tdc_hits    : in  tdcpolmux2tar_vt;

    o_tar_hits    : out tar2hps_vt

  );
end entity tar_remap;

architecture beh of tar_remap is

  function get_layer_offset( station : integer) return integer is
    variable y : integer;
  begin
    if station = 0 then
      y := 4;
    else
      y := 3;
    end if;
    return y;
  end function;

  signal i_tdc_hits_r : tdcpolmux2tar_rt;
  -- signal i_tar_hits_r : tar2hps_rt;
  -- signal o_tdc_hits_r : tdcpolmux2tar_rt;
  signal o_tar_hits_r : tar2hps_rt;

  signal layer_offset : integer := get_layer_offset(g_STATION);

  signal ml1_tubes : hh_mdt_mezz_map_t := get_tdc_tube_map(g_STATION,0,1); -- station , ml, t_nl
  signal ml1_layer : hh_mdt_mezz_map_t := get_tdc_tube_map(g_STATION,0,0);
  signal ml2_tubes : hh_mdt_mezz_map_t := get_tdc_tube_map(g_STATION,1,1);
  signal ml2_layer : hh_mdt_mezz_map_t := get_tdc_tube_map(g_STATION,1,0);

  signal csm_offset_mem : mezz_b_chamber_dist_chamber_t := get_csm_accumulated_tubes(g_STATION);
  signal tdc_offset_mem : tdc_accumulated_tubes_t := get_tdc_accumulated_tubes(g_STATION);

  signal csm_offset : integer;
  signal tdc_offset : integer;
  signal tdc_layer  : unsigned(TAR2HPS_LAYER_LEN-1 downto 0);
  signal tdc_tube   : unsigned(TAR2HPS_TUBE_LEN-1 downto 0);
  signal full_time  : unsigned(TAR2HPS_TIME_LEN-1 downto 0);

  signal dv_pl : std_logic_vector(1 downto 0);
  signal csm_pl : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
  
begin

  i_tdc_hits_r <= convert(i_tdc_hits,i_tdc_hits_r);
  o_tar_hits <= convert(o_tar_hits_r,o_tar_hits);
  
  -- TDC_INPUTS_GEN : if c_TAR_INSEL = '1' generate
    -- o_tdc_hits <= i_tdc_hits;
    -- o_mid_tdc_hits <= i_mid_tdc_hits;
    -- o_out_tdc_hits <= i_out_tdc_hits;
    -- o_ext_tdc_hits <= i_ext_tdc_hits;


  GET : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        o_tar_hits_r <= zero(o_tar_hits_r);
        
      else
        if c_ST_nBARREL_ENDCAP = '0' then -- BARREL
          dv_pl(0) <= dv_pl(1);
          dv_pl(1) <=  i_tdc_hits_r.data_valid;

          if i_tdc_hits_r.data_valid = '1' then
            csm_pl <= i_tdc_hits_r.csmid;
            csm_offset <= csm_offset_mem(to_integer(unsigned(i_tdc_hits_r.csmid)));
            tdc_offset <= tdc_offset_mem(to_integer(unsigned(i_tdc_hits_r.tdcid)));
            -- tdc_offset <= tdc_offset_mem(to_integer(shift_right(to_unsigned(i_tdc_hits_r.tdc_id),1)));
            if c_SECTOR_SIDE = 0 then -- SIDE A
              if i_tdc_hits_r.tdcid(0) = '0' then -- even
                tdc_tube <= to_unsigned(ml1_tubes(to_integer(i_tdc_hits_r.tdc.chanid)),TAR2HPS_TUBE_LEN);
                tdc_layer <= to_unsigned(ml1_layer(to_integer(i_tdc_hits_r.tdc.chanid)),TAR2HPS_LAYER_LEN);
              else -- odd
                tdc_tube <= to_unsigned(ml2_tubes(to_integer(i_tdc_hits_r.tdc.chanid)),TAR2HPS_TUBE_LEN);
                tdc_layer <= to_unsigned(ml2_layer(to_integer(i_tdc_hits_r.tdc.chanid)) + layer_offset,TAR2HPS_LAYER_LEN);
              end if;
            else -- SIDE C

            end if;

            full_time <= i_tdc_hits_r.tdc.coarsetime & i_tdc_hits_r.tdc.finetime;

          else
            csm_pl <= (others => '0');
            tdc_tube <= (others => '0');
            tdc_layer <= (others => '0');
            csm_offset <= 0;
            tdc_offset <= 0;
            full_time <= (others => '0');
          end if;



          if dv_pl(1) = '1' then
            o_tar_hits_r.data_valid   <= '1';
            o_tar_hits_r.chamber_ieta <= csm_pl;
            o_tar_hits_r.layer        <= tdc_layer;
            -- chamber tube  position
            -- o_tar_hits_r.tube         <= tdc_offset + tdc_tube;
            -- global tube position
            o_tar_hits_r.tube         <= csm_offset + tdc_offset + tdc_tube;
            o_tar_hits_r.time         <= full_time;
          else
            o_tar_hits_r <= zero(o_tar_hits_r);
            -- o_tar_hits_r.data_valid   <= '0';
            -- o_tar_hits_r.chamber_ieta <= 
            -- o_tar_hits_r.layer        <= 
            -- o_tar_hits_r.tube         <= csm_offset + tdc_offset + tdc_tube;
            -- o_tar_hits_r.time         <= full_time;
          end if;

        else-- ENDCAP

        end if;

      end if;
    end if;
  end process GET;





  -- end generate;

  -- TAR_INPUTS_GEN : if c_TAR_INSEL = '0' generate
  --   o_tar_hits <= i_tar_hits;
  --   -- o_mid_tar_hits <= i_mid_tar_hits;
  --   -- o_out_tar_hits <= i_out_tar_hits;
  --   -- o_ext_tar_hits <= i_ext_tar_hits;
  -- end generate;

  
end architecture beh;

-- type tdc_rt is record
--   chanid : unsigned(TDC_CHANID_LEN-1 downto 0);
--   edgemode : std_logic_vector(TDC_EDGEMODE_LEN-1 downto 0);
--   coarsetime : unsigned(TDC_COARSETIME_LEN-1 downto 0);
--   finetime : unsigned(TDC_FINETIME_LEN-1 downto 0);
--   pulsewidth : unsigned(TDC_PULSEWIDTH_LEN-1 downto 0);
-- end record tdc_rt;

-- type tdcpolmux2tar_rt is record
--   data_valid : std_logic;
--   tdc : tdc_rt;
--   csmid : unsigned(TDCPOLMUX2TAR_CSMID_LEN-1 downto 0);
--   tdcid : unsigned(TDCPOLMUX2TAR_TDCID_LEN-1 downto 0);
-- end record tdcpolmux2tar_rt;

-- type tar2hps_rt is record
--   data_valid : std_logic;
--   chamber_ieta : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
--   layer : unsigned(TAR2HPS_LAYER_LEN-1 downto 0);
--   tube : unsigned(TAR2HPS_TUBE_LEN-1 downto 0);
--   time : unsigned(TAR2HPS_TIME_LEN-1 downto 0);
-- end record tar2hps_rt;