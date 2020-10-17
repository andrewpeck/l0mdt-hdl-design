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
use shared_lib.detector_param_pkg.all;
 
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
    i_local_rst         : in std_logic;
    i_in_en             : in std_logic;
    --
    i_data_v            : in ucm_cde_rvt;
    o_ucm2hps_av        : out ucm2hps_bus_avt(c_MAX_POSSIBLE_HPS -1 downto 0)
      
  );
end entity ucm_cvp;

architecture beh of ucm_cvp is

  signal local_rst : std_logic;

  signal int_data_r     : ucm_cde_rt;
  signal int_data_v     : ucm_cde_rvt;
  
  signal data_v       : ucm_cde_rvt;
  signal data_v_2     : ucm_cde_rvt;
  signal data_r       : ucm_cde_rt;
  
  signal ucm2hps_ar   : ucm2hps_bus_at(c_MAX_NUM_HPS -1 downto 0);

  -- signal chamber_ieta_v : std_logic_vector(15 downto 0);
  signal chamber_ieta_r : chamb_ieta_rpc_bus_at;

  signal offset       : signed(126 -1 downto 0);
  signal slope        : signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
  signal slope_dv     : std_logic;

  constant ATAN_SLOPE_LEN : integer := 20;
  signal atan_slope   : unsigned(ATAN_SLOPE_LEN - 1 downto 0);
  -- signal atan_mbar    : unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
  signal atan_dv      : std_logic;

  type vec_pos_array_t  is array (0 to c_MAX_POSSIBLE_HPS -1) of unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
  signal vec_pos_array  : vec_pos_array_t;

  signal vec_ang_pl : unsigned(UCM2HPS_VEC_ANG_LEN-1 downto 0);
  
begin

  local_rst <= rst or i_local_rst;

  B_SLOPE : if c_ST_nBARREL_ENDCAP = '0' generate

    SLOPE_CALC : entity ucm_lib.ucm_cvp_b_slope
    port map(
      clk           => clk,
      rst           => local_rst,
      glob_en       => glob_en,
      --
      i_cointype    => int_data_r.cointype,
      i_data_v      => int_data_r.specific,
      i_data_Valid  => int_data_r.data_valid,
      o_offset      => offset,
      o_slope       => slope,
      o_data_valid  => slope_dv
    );

  end generate;

  atan_slope <= resize(unsigned(slope),ATAN_SLOPE_LEN) when to_integer(unsigned(slope)) < 732387 else to_unsigned(732387,ATAN_SLOPE_LEN);

  ATAN : entity shared_lib.roi_atan
  generic map(
    g_INPUT_LEN   => ATAN_SLOPE_LEN,
    g_OUTPUT_LEN  => UCM2HPS_VEC_ANG_LEN
  )
  port map(
    clk           => clk,
    rst           => local_rst,
    glob_en       => glob_en,
    --
    i_slope       => atan_slope,
    i_dv          => slope_dv,
    o_mbar        => vec_ang_pl,
    o_dv          => atan_dv
  );

  PL_in : entity shared_lib.std_pipeline
  generic map(
    num_delays  => 5,
    num_bits    => int_data_v'length
  )
  port map(
    clk         => clk,
    rst         => local_rst,
    glob_en     => glob_en,
    --
    i_data      => int_data_v,
    o_data      => data_v
  );

  chamber_ieta_r <= structify(data_v).chamb_ieta;

  PL : entity shared_lib.std_pipeline
  generic map(
    num_delays  => 2,
    num_bits    => data_v'length
  )
  port map(
    clk         => clk,
    rst         => local_rst,
    glob_en     => glob_en,
    --
    i_data      => data_v,
    o_data      => data_v_2
  );

  data_r <= structify(data_v_2);
  -- 

  Z_CALC_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    Z_CALC_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate
      Z_CALC : entity ucm_lib.ucm_cvp_z_calc
      generic map(
        g_STATION_RADIUS    => st_i
      )
      port map(
        clk           => clk,
        rst           => local_rst,
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
  
  int_data_v <= i_data_v;

  int_data_r <= structify(int_data_v);

  UCM_HPS_GEN: for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 generate
    GEN : if c_STATIONS_IN_SECTOR(hps_i) = '1' generate
      o_ucm2hps_av(hps_i) <= vectorify(ucm2hps_ar(hps_i));
    end generate;
    DIS : if c_STATIONS_IN_SECTOR(hps_i) = '0' generate
      o_ucm2hps_av(hps_i) <= nullify(o_ucm2hps_av(hps_i));
    end generate;
  end generate;

  UCM_CVP : process(local_rst,clk) begin
    if rising_edge(clk) then

      -- if slope < 2047 then
      --   vec_ang_pl <= resize(unsigned(slope),UCM2HPS_VEC_ANG_LEN);
      -- else
      --   vec_ang_pl <= (others => '1');
      -- end if;
      
      if local_rst= '1' then


        for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
          ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
        end loop;

      else 

        -- if i_in_en = '1' then
        --   -- como usar i_in_en? si ocupado deberia mantenerse desactivado
        --   -- ojo se tiene qu eser previsor para poder empezar a calcular candidato si el proceso esta apunto de acabarse
        --   -- update i_in_en only controls input data and allows the rest to continue processing
          
        --   int_data_v <= i_data_v;
        -- end if;





        if c_ST_nBARREL_ENDCAP = '0' then  -- Barrel
          -- if c_SF_TYPE = '0' then --CSF
            -- if int_data_r.data_valid = '1' then
              for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 loop
                if c_STATIONS_IN_SECTOR(hps_i) = '1'  then

                  if data_r.data_valid = '1' then

                    ucm2hps_ar(hps_i).muid                <= data_r.muid;
                    ucm2hps_ar(hps_i).mdtseg_dest         <= (others => '1'); -- COMO SE CALCULA ESTO?
                    ucm2hps_ar(hps_i).mdtid.chamber_ieta  <= get_chamber_ieta(c_SECTOR_ID,hps_i,to_integer(vec_pos_array(hps_i)),UCM2HPS_VEC_POS_MULT);
                    ucm2hps_ar(hps_i).mdtid.chamber_id    <=  to_unsigned(
                                                                get_b_chamber_type(c_SECTOR_ID,hps_i,
                                                                  to_integer(
                                                                    get_chamber_ieta(c_SECTOR_ID,hps_i,to_integer(vec_pos_array(hps_i)),UCM2HPS_VEC_POS_MULT)
                                                                  )
                                                                ),VEC_MDTID_CHAMBER_ID_LEN
                                                              );
                    ucm2hps_ar(hps_i).vec_pos       <= vec_pos_array(hps_i);
                    ucm2hps_ar(hps_i).vec_ang       <= vec_ang_pl;
                    ucm2hps_ar(hps_i).data_valid    <= '1';
                  
                  else

                    -- for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
                    --   ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
                    -- end loop;

                  end if;

                end if;
              end loop;
              -- slope / mbar calc
              -- local origin calc : to be done in HEG local origin of window
            -- else
              -- for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
              --   ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
              -- end loop;
            -- end if;
          -- else --LSF
          -- end if;
        else -- Endcap
        end if;
        
        -- else
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
-- library ieee, shared_lib;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

-- library shared_lib;
-- use shared_lib.common_ieee_pkg.all;
-- use shared_lib.l0mdt_constants_pkg.all;
-- use shared_lib.l0mdt_dataformats_pkg.all;
-- use shared_lib.common_constants_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.config_pkg.all;

-- use shared_lib.detector_param_pkg.all;
 
-- library ucm_lib;
-- use ucm_lib.ucm_pkg.all;

-- entity ucm_cvp_chamber_id is
--   port (
--     clk                 : in std_logic;
--     rst                 : in std_logic;
--     glob_en             : in std_logic;
--     --
--     i_station           : in unsigned(3 downto 0);
--     i_chamber_ieta      : in unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
--     --
--     o_mdtid             : out vec_mdtid_rt
--   );
-- end entity ucm_cvp_chamber_id;

-- architecture beh of ucm_cvp_chamber_id is

--   signal mem : b_chamber_type_sector_at := get_b_chamber_type_sector(c_SECTOR_ID);
  
-- begin

--   ID_CALC: process(clk)
--   begin
--     if rising_edge(clk) then
--       if rst = '1' then
        
--       else

--         o_mdtid.chamber_ieta <= i_chamber_ieta;
--         o_mdtid.chamber_id <= to_unsigned(mem(to_integer(i_station))(to_integer(i_chamber_ieta)),VEC_MDTID_CHAMBER_ID_LEN);
        
--       end if;
--     end if;
--   end process ID_CALC;
  
  
  
-- end architecture beh;