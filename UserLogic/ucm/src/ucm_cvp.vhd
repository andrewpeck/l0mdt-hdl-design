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
use ieee.std_logic_misc.all;


library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;
use shared_lib.barrel_chamb_z2origin_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;
use ucm_lib.ucm_function_pkg.all;

library  vamc_lib;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_cvp is
  -- generic(
  --   g_DELAY_CYCLES          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --  
    ctrl_v              : in std_logic_vector;
    mon_v               : out std_logic_vector;
    -- i_phicenter             : in unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    i_chamber_z_org_bus     : in b_chamber_z_origin_station_avt;
    --
    i_local_rst         : in std_logic;
    i_in_en             : in std_logic;
    --
    i_data_v            : in ucm_cde_rvt;
    --
    -- o_phimod            : out signed(UCM2PL_PHIMOD_LEN -1 downto 0);
    o_ucm2hps_av        : out ucm2hps_bus_avt(c_MAX_POSSIBLE_HPS -1 downto 0)
      
  );
end entity ucm_cvp;

architecture beh of ucm_cvp is

  signal i_data_r            : ucm_cde_rt;

  -- rpc R
  signal ctrl_r : UCM_R_PHI_COMP_CTRL_t;
  signal mon_r  : UCM_R_PHI_COMP_MON_t;

  signal rpc_R_ctrl_r : UCM_R_PHI_COMP_RPC_CTRL_t;
  signal rpc_R_mon_r  : UCM_R_PHI_COMP_RPC_MON_t; 
  signal rpc_R_ctrl_v : std_logic_vector(len(rpc_R_ctrl_r) - 1 downto 0);
  signal rpc_R_mon_v  : std_logic_vector(len(rpc_R_mon_r) - 1 downto 0);

  signal mdt_R_ctrl_r : UCM_R_PHI_COMP_MDT_CTRL_t;
  signal mdt_R_mon_r  : UCM_R_PHI_COMP_MDT_MON_t; 
  signal mdt_R_ctrl_v : std_logic_vector(len(mdt_R_ctrl_r) - 1 downto 0);
  signal mdt_R_mon_v  : std_logic_vector(len(mdt_R_mon_r) - 1 downto 0);

  --

  signal rpc_radius_av  : ucm_rpc_r_bus_at(4 - 1 downto 0);
  signal rpc_radius_dv  : std_logic;

  signal mdt_radius_av  : ucm_mdt_r_bus_at(3 - 1 downto 0);
  signal mdt_radius_dv  : std_logic;

  -- 

  signal local_rst : std_logic;

  signal int_data_r     : ucm_cde_rt;
  signal int_data_v     : ucm_cde_rvt;
  signal barrel_r       : slc_barrel_rt;
  
  signal data_v       : ucm_cde_rvt;
  signal data_r       : ucm_cde_rt;

  signal data_v_2     : ucm_cde_rvt;
  signal data_r_2       : ucm_cde_rt;
  
  signal ucm2hps_ar   : ucm2hps_bus_at(c_MAX_NUM_HPS -1 downto 0);


  -- signal chamber_ieta_v : std_logic_vector(15 downto 0);
  signal chamber_ieta_r : chamb_ieta_rpc_bus_at;

  type new_chamb_ieta_at is array(c_MAX_NUM_HPS -1 downto 0) of unsigned(4-1 downto 0);
  signal new_chamb_ieta_a : new_chamb_ieta_at;
  signal new_chamb_ieta_dv : std_logic_vector(c_MAX_NUM_HPS -1 downto 0);

  signal offset       : signed(31 downto 0);--signed(126 -1 downto 0);
  signal slope        : signed(31 downto 0);-- 
  -- signal slope_org : signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
  signal slope_dv     : std_logic;

  constant ATAN_SLOPE_LEN : integer := 20;
  signal atan_slope   : unsigned(ATAN_SLOPE_LEN - 1 downto 0);
  -- signal atan_mbar    : unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
  signal atan_dv      : std_logic;

  type vec_pos_array_t  is array (0 to c_MAX_POSSIBLE_HPS -1) of unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
  signal vec_pos_array  : vec_pos_array_t;
  signal vec_z_pos_dv : std_logic_vector(c_MAX_NUM_HPS -1 downto 0);

  signal vec_ang_pl : unsigned(UCM2HPS_VEC_ANG_LEN-1 downto 0);
  
begin

  i_data_r <= structify(i_data_v);
  

  ctrl_r  <= structify(ctrl_v,ctrl_r);
  mon_v   <= vectorify(mon_r,mon_v);

  rpc_R_ctrl_v <= vectorify(ctrl_r.RPC,rpc_R_ctrl_v);
  rpc_R_mon_r <= structify(rpc_R_mon_v,rpc_R_mon_r);
  mon_r.RPC <= rpc_R_mon_r;

  mdt_R_ctrl_v <= vectorify(ctrl_r.MDT,mdt_R_ctrl_v);
  mdt_R_mon_r <= structify(mdt_R_mon_v,mdt_R_mon_r);
  mon_r.MDT <= mdt_R_mon_r;

  local_rst <= rst or i_local_rst;
  -- data_r <= structify(i_data_v);
  barrel_r <= structify(int_data_r.specific);

  IN_REG: process(clk)
  begin
    if rising_edge(clk) then
      if local_rst = '1' then
        int_data_v <= (others => '0');
      else
        if i_in_en = '1' then
          if i_data_r.data_valid = '1' then
            int_data_v <= i_data_v;
          end if;
        end if;
      end if;
    end if;
  end process IN_REG;
  int_data_r <= structify(int_data_v);

  -- PL_in : entity vamc_lib.vamc_sr
  -- generic map(
  --   g_DELAY_CYCLES  => 10,
  --   g_PIPELINE_WIDTH    => int_data_v'length
  -- )
  -- port map(
  --   clk         => clk,
  --   rst         => local_rst,
  --   ena         => ena,
  --   --
  --   i_data      => int_data_v,
  --   o_data      => data_v
  -- );

  -- chamber_ieta_r <= structify(data_v).chamb_ieta;

  BARREL : if c_ST_nBARREL_ENDCAP = '0' generate

    RPC_R : entity ucm_lib.ucm_rpc_R_comp_top
      generic map(
        g_MODE =>  "RPC",
        g_OUTPUT_WIDTH => SLC_Z_RPC_LEN
      )
      port map(
        clk         => clk,
        rst         => local_rst,
        ena         => ena,
        --
        ctrl_v      => rpc_R_ctrl_v,
        mon_v       => rpc_R_mon_v,
        --
        i_phimod    => i_data_r.phimod,
        i_dv        => i_data_r.data_valid,
        --
        o_radius    => rpc_radius_av,
        o_dv        => rpc_radius_dv
    );

    MDT_R : entity ucm_lib.ucm_mdt_R_comp_top
    generic map(
      g_MODE =>  "MDT",
      g_STATION_LAYERS => 3,
      g_OUTPUT_WIDTH => UCM_Z_ROI_LEN
    )
    port map(
      clk         => clk,
      rst         => local_rst,
      ena         => ena,
      --
      ctrl_v      => mdt_R_ctrl_v,
      mon_v       => mdt_R_mon_v,
      --
      i_phimod    => i_data_r.phimod,
      i_dv        => i_data_r.data_valid,
      --
      o_radius    => mdt_radius_av,
      o_dv        => mdt_radius_dv
  );

    SLOPE_CALC : entity ucm_lib.ucm_cvp_b_slope
    port map(
      clk           => clk,
      rst           => local_rst,
      ena           => ena,
      --
      i_rpc_rad_a   => rpc_radius_av,
      i_cointype    => int_data_r.cointype,
      i_data_v      => int_data_r.specific,
      i_data_Valid  => rpc_radius_dv,--int_data_r.data_valid,
      o_offset      => offset,
      o_slope       => slope,
      o_data_valid  => slope_dv
    );

    ----------------------------------------------------------

    Z_CALC_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
      Z_CALC_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate
        Z_CALC : entity ucm_lib.ucm_cvp_z_calc
        generic map(
          g_STATION_RADIUS    => st_i,
          g_INPUT_RESOLUTION  => SLC_Z_RPC_MULT,
          g_OUTPUT_RESOLUTION => 1.0,
          g_OUTPUT_WIDTH      => vec_pos_array(st_i)'length
        )
        port map(
          clk           => clk,
          rst           => local_rst,
          ena           => ena,
          --
          i_mdt_R       => mdt_radius_av(st_i),
          i_mdt_R_dv    => mdt_radius_dv,
          -- i_chamb_ieta  => chamber_ieta_r(st_i),
          i_offset      => offset,
          i_slope       => slope,
          i_data_valid  => slope_dv,
          --
          o_vec_z_pos     => vec_pos_array(st_i),
          o_vec_z_pos_dv  => vec_z_pos_dv(st_i)
        );
      end generate;
    end generate;

    ----------------------------------------------------------
-- /**
    IETA_INN : entity ucm_lib.ucm_ieta_calc
    generic map(
      g_STATION => 0,
      g_RESOLUTION_SCALE => UCM2HPS_VEC_POS_MULT,
      g_INPUT_WIDTH => vec_pos_array(0)'length

    )
    port map(
      clk           => clk,
      rst           => rst,
      --
      i_chamber_z_org_bus => i_chamber_z_org_bus(0),
      --
      i_z           => vec_pos_array(0),
      i_z_dv        => vec_z_pos_dv(0),
      --
      o_ieta        => new_chamb_ieta_a(0),
      o_ieta_dv     => new_chamb_ieta_dv(0)
    );

    IETA_MID : entity ucm_lib.ucm_ieta_calc
    generic map(
      g_STATION => 1,
      g_RESOLUTION_SCALE => UCM2HPS_VEC_POS_MULT,
      g_INPUT_WIDTH => vec_pos_array(1)'length
    )
    port map(
      clk           => clk,
      rst           => rst,
      --
      i_chamber_z_org_bus => i_chamber_z_org_bus(1),
      --
      i_z           => vec_pos_array(1),
      i_z_dv        => vec_z_pos_dv(1),
      --
      o_ieta        => new_chamb_ieta_a(1),
      o_ieta_dv     => new_chamb_ieta_dv(1)
    );

    IETA_OUT : entity ucm_lib.ucm_ieta_calc
    generic map(
      g_STATION => 2,
      g_RESOLUTION_SCALE => UCM2HPS_VEC_POS_MULT,
      g_INPUT_WIDTH => vec_pos_array(2)'length
    )
    port map(
      clk           => clk,
      rst           => rst,
      --
      i_chamber_z_org_bus => i_chamber_z_org_bus(2),
      --
      i_z           => vec_pos_array(2),
      i_z_dv        => vec_z_pos_dv(2),
      --
      o_ieta        => new_chamb_ieta_a(2),
      o_ieta_dv     => new_chamb_ieta_dv(2)
    );
-- */
  end generate;
-- /*
  atan_slope <= resize(unsigned(slope),ATAN_SLOPE_LEN) when to_integer(unsigned(slope)) < 732387 else to_unsigned(732387,ATAN_SLOPE_LEN);

  ATAN : entity shared_lib.roi_atan
  generic map(
    g_INPUT_LEN   => ATAN_SLOPE_LEN,
    g_OUTPUT_LEN  => UCM2HPS_VEC_ANG_LEN
  )
  port map(
    clk           => clk,
    rst           => local_rst,
    ena       => ena,
    --
    i_slope       => atan_slope,
    i_dv          => slope_dv,
    o_mbar        => vec_ang_pl,
    o_dv          => atan_dv
  );


  -- PL_in : entity vamc_lib.vamc_sr
  -- generic map(
  --   g_DELAY_CYCLES  => 10,
  --   g_PIPELINE_WIDTH    => int_data_v'length
  -- )
  -- port map(
  --   clk         => clk,
  --   rst         => local_rst,
  --   ena         => ena,
  --   --
  --   i_data      => int_data_v,
  --   o_data      => data_v
  -- );
  

  -- PL_2 : entity vamc_lib.vamc_sr
  -- generic map(
  --   g_DELAY_CYCLES  => 10,
  --   g_PIPELINE_WIDTH    => int_data_v'length
  -- )
  -- port map(
  --   clk         => clk,
  --   rst         => local_rst,
  --   ena     => ena,
  --   --
  --   i_data      => data_v,
  --   o_data      => data_v_2
  -- );

  -- data_r_2 <= structify(data_v_2);
  -- 

  -- Z_CALC_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
  --   Z_CALC_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate
  --     Z_CALC : entity ucm_lib.ucm_cvp_z_calc
  --     generic map(
  --       g_STATION_RADIUS    => st_i
  --     )
  --     port map(
  --       clk           => clk,
  --       rst           => local_rst,
  --       ena       => ena,
  --       --
  --       i_chamb_ieta  => chamber_ieta_r(st_i),
  --       i_offset      => offset,
  --       i_slope       => slope,
  --       i_data_valid  => slope_dv,
  --       --
  --       o_vec_z_pos   => vec_pos_array(st_i)
  --     );
  --   end generate;
  -- end generate;

  -- A_GEN : for o_i in 0 to c_MAX_NUM_HPS - 1 generate
  --   B_GEN : for i_i in o_i to c_MAX_POSSIBLE_HPS - 1 generate
  --     C_GEN : if c_STATIONS_IN_SECTOR(i_i) = '1' generate
  --       ucm2hps_ar(o_i).vec_pos <= vec_pos_array(i_i);
  --     end generate;
  --   end generate;
  -- end generate;
  
 

  

  UCM_HPS_GEN: for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 generate
    GEN : if c_STATIONS_IN_SECTOR(hps_i) = '1' generate
      o_ucm2hps_av(hps_i) <= vectorify(ucm2hps_ar(hps_i));
    end generate;
    DIS : if c_STATIONS_IN_SECTOR(hps_i) = '0' generate
      o_ucm2hps_av(hps_i) <= nullify(o_ucm2hps_av(hps_i));
    end generate;
  end generate;

  UCM_CVP_OUT : process(local_rst,clk) begin
    if rising_edge(clk) then

      if local_rst= '1' then
        for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
          ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
          ucm2hps_ar(hps_i).data_valid    <= '0';
        end loop;
      else 

        if i_data_r.data_valid = '1' then
          for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 loop
            if c_STATIONS_IN_SECTOR(hps_i) = '1'  then
              ucm2hps_ar(hps_i).muid <= i_data_r.muid;
            end if;
          end loop;
        end if;

        if or_reduce(vec_z_pos_dv) = '1' then
          for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 loop
            if c_STATIONS_IN_SECTOR(hps_i) = '1'  then
              ucm2hps_ar(hps_i).vec_pos             <= vec_pos_array(hps_i);
            end if;
          end loop;
        end if;

        if atan_dv = '1' then
          for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 loop
            if c_STATIONS_IN_SECTOR(hps_i) = '1'  then
              ucm2hps_ar(hps_i).vec_ang             <= vec_ang_pl;
            end if;
          end loop;
        end if;

        if c_ST_nBARREL_ENDCAP = '0' then  -- Barrel
          -- if c_SF_TYPE = '0' then --CSF
            -- if int_data_r.data_valid = '1' then
              for hps_i in c_MAX_POSSIBLE_HPS -1 downto 0 loop
                if c_STATIONS_IN_SECTOR(hps_i) = '1'  then

                  if or_reduce(new_chamb_ieta_dv) = '1' then

                    -- ucm2hps_ar(hps_i).muid                <= data_r_2.muid;
                    ucm2hps_ar(hps_i).mdtseg_dest         <= (others => '1'); -- COMO SE CALCULA ESTO?
                    ucm2hps_ar(hps_i).mdtid.chamber_ieta  <= new_chamb_ieta_a(hps_i); 
                    ucm2hps_ar(hps_i).mdtid.chamber_id    <=  to_unsigned(get_b_chamber_type(c_SECTOR_ID,hps_i,to_integer(new_chamb_ieta_a(hps_i))),VEC_MDTID_CHAMBER_ID_LEN);
                    -- ucm2hps_ar(hps_i).vec_pos             <= vec_pos_array(hps_i);
                    -- ucm2hps_ar(hps_i).vec_ang             <= vec_ang_pl;
                    ucm2hps_ar(hps_i).data_valid          <= '1';
                  
                  else
                    ucm2hps_ar(hps_i).data_valid    <= '0';
                    -- for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
                    --   ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
                    -- end loop;

                  end if;

                end if;
              end loop;

        else -- Endcap
        end if;

      end if;
    end if;
  end process;

-- */

end beh;

  -- PHIMOD : entity ucm_lib.ucm_cvp_phimod
  -- generic map(
  --   g_PIPELINE => 2
  -- )
  -- port map(
  --   clk         =>clk,
  --   rst         =>local_rst,
  --   --
  --   i_phicenter   => get_sector_phi_center(c_SECTOR_ID),
  --   --
  --   i_posphi    => data_r.posphi,
  --   i_dv        => data_r.data_valid,
  --   --
  --   o_phimod    => o_phimod
  -- );

  /*
  UCM_CVP_OUT : process(local_rst,clk) begin
    if rising_edge(clk) then

      -- if slope < 2047 then
      --   vec_ang_pl <= resize(unsigned(slope),UCM2HPS_VEC_ANG_LEN);
      -- else
      --   vec_ang_pl <= (others => '1');
      -- end if;
      
      if local_rst= '1' then


        for hps_i in c_MAX_NUM_HPS -1 downto 0 loop
          -- ucm2hps_ar(hps_i) <= nullify(ucm2hps_ar(hps_i));
          ucm2hps_ar(hps_i).data_valid    <= '0';
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

                  if data_r_2.data_valid = '1' then

                    ucm2hps_ar(hps_i).muid                <= data_r_2.muid;
                    ucm2hps_ar(hps_i).mdtseg_dest         <= (others => '1'); -- COMO SE CALCULA ESTO?
                    ucm2hps_ar(hps_i).mdtid.chamber_ieta  <= new_chamb_ieta_a(hps_i); 
                    ucm2hps_ar(hps_i).mdtid.chamber_id    <=  to_unsigned(get_b_chamber_type(c_SECTOR_ID,hps_i,to_integer(new_chamb_ieta_a(hps_i))),VEC_MDTID_CHAMBER_ID_LEN);
                    ucm2hps_ar(hps_i).vec_pos       <= vec_pos_array(hps_i);
                    ucm2hps_ar(hps_i).vec_ang       <= vec_ang_pl;
                    ucm2hps_ar(hps_i).data_valid    <= '1';
                  
                  else
                    ucm2hps_ar(hps_i).data_valid    <= '0';
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
  */
