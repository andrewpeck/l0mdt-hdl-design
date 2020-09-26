--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
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
use ucm_lib.ucm_function_pkg.all;

entity ucm_cvp is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_in_en             : in std_logic;
    --
    i_data_v            : in ucm_cde_rvt;
    o_ucm2hps_av        : out ucm2hps_bus_avt(c_MAX_POSSIBLE_HPS -1 downto 0)
      
  );
end entity ucm_cvp;

architecture beh of ucm_cvp is

  signal i_data_r     : ucm_cde_rt;
  signal ucm2hps_ar   : ucm2hps_bus_at(c_MAX_NUM_HPS -1 downto 0);

  signal chamber_ieta_v : std_logic_vector(15 downto 0);
  signal chamber_ieta_r : chamb_ieta_rpc_bus_at;

  signal offset       : signed(126 -1 downto 0);
  signal slope        : signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
  signal slope_dv     : std_logic;

  type vec_pos_array_t  is array (0 to c_MAX_POSSIBLE_HPS -1) of unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
  signal vec_pos_array  : vec_pos_array_t;
  
begin

  B_SLOPE : if c_ST_nBARREL_ENDCAP = '0' generate

    SLOPE_CALC : entity ucm_lib.ucm_cvp_b_slope
    port map(
      clk           => clk,
      rst           => rst,
      glob_en       => glob_en,
      --
      i_cointype    => i_data_r.cointype,
      i_data_v      => i_data_r.specific,
      i_data_Valid  => i_data_r.data_valid,
      o_offset      => offset,
      o_slope       => slope,
      o_data_valid  => slope_dv
    );

  end generate;

  PL : entity shared_lib.std_pipeline
  generic map(
    num_delays  => 5,
    num_bits    => chamber_ieta_v'length
  )
  port map(
    clk         => clk,
    rst         => rst,
    glob_en     => glob_en,
    --
    i_data      => vectorify(i_data_r.chamb_ieta),
    o_data      => chamber_ieta_v
  );

  chamber_ieta_r <= structify(chamber_ieta_v);

  Z_CALC_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    Z_CALC_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate
      Z_CALC : entity ucm_lib.ucm_cvp_z_calc
      generic map(
        g_STATION_RADIUS    => st_i
      )
      port map(
        clk           => clk,
        rst           => rst,
        glob_en       => glob_en,
        --
        i_chamb_ieta  => chamber_ieta_r(st_i),
        i_offset      => offset,
        i_slope       => slope,
        i_data_valid  => slope_dv,
        --
        o_vec_z_pos   => vec_pos_array(st_i)
      );
    end generate;
  end generate;

  -- A_GEN : for o_i in 0 to c_MAX_NUM_HPS - 1 generate
  --   B_GEN : for i_i in o_i to c_MAX_POSSIBLE_HPS - 1 generate
  --     C_GEN : if c_STATIONS_IN_SECTOR(i_i) = '1' generate
  --       ucm2hps_ar(o_i).vec_pos <= vec_pos_array(i_i);
  --     end generate;
  --   end generate;
  -- end generate;

  i_data_r <= structify(i_data_v);

  UCM_HPS_GEN: for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 generate
    GEN : if c_STATIONS_IN_SECTOR(hps_i) = '1' generate
      o_ucm2hps_av(hps_i) <= vectorify(ucm2hps_ar(hps_i));
    end generate;
  end generate;

  UCM_CVP : process(rst,clk) begin
    if rising_edge(clk) then
      
      if rst= '1' then
        for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
          -- ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
        end loop;
      elsif i_in_en = '1' then
        -- como usar i_in_en?
      
        if c_ST_nBARREL_ENDCAP = '0' then  -- Barrel
          if c_SF_TYPE = '0' then --CSF
            -- if i_data_r.data_valid = '1' then
              for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 loop
                if c_STATIONS_IN_SECTOR(hps_i) = '1'  then
                  ucm2hps_ar(hps_i).muid          <= i_data_r.muid;
                  -- ucm2hps_ar(hps_i).mdtseg_dest   <= i_data_r.
                  ucm2hps_ar(hps_i).mdtid.chamber_ieta <= get_chamber_ieta(c_SECTOR_ID,hps_i,to_integer(vec_pos_array(hps_i)));
                  -- ucm2hps_ar(hps_i).vec_pos       <=
                  -- ucm2hps_ar(hps_i).vec_ang       <=
                  -- ucm2hps_ar(hps_i).hewindow_pos  <=

                end if;
              end loop;
              -- slope / mbar calc
              -- local origin calc : to be done in HEG local origin of window
            -- else
              -- for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
              --   ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
              -- end loop;
            -- end if;
          else --LSF
          end if;
        else -- Endcap
        end if;
        
      else
        -- for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
        --   ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
        -- end loop;
        -- block dissabled
      end if;
    end if;
  end process;



end beh;



--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor, chamber type extractor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

use shared_lib.detector_param_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_cvp_chamber_id is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_station           : in unsigned(3 downto 0);
    i_chamber_ieta      : in unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    --
    o_mdtid             : out vec_mdtid_rt
  );
end entity ucm_cvp_chamber_id;

architecture beh of ucm_cvp_chamber_id is

  signal mem : b_chamber_type_sector_at := get_b_chamber_type_sector(c_SECTOR_ID);
  
begin

  ID_CALC: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        
      else

        o_mdtid.chamber_ieta <= i_chamber_ieta;
        o_mdtid.chamber_id <= to_unsigned(mem(to_integer(i_station))(to_integer(i_chamber_ieta)),VEC_MDTID_CHAMBER_ID_LEN);
        
      end if;
    end if;
  end process ID_CALC;
  
  
  
end architecture beh;