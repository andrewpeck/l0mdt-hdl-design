--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
--          Preprocesing
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
use shared_lib.detector_param_pkg.all;
use shared_lib.fct_barrel_chamb_z2origin_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;
-- use ucm_lib.ucm_function_pkg.all;

-- library ctrl_lib;
-- use ctrl_lib.UCM_CTRL.all;

library  vamc_lib;

entity ucm_cde is
  generic(
    bypass                : std_logic  := '1';
    phimod_ena            : std_logic  := '1'
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic;
    -- configuration, control & Monitoring
    i_phicenter           : in unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    i_chamber_z_org_bus   : in b_chamber_z_origin_station_avt;
    -- PAM
    i_proc_info_v         : in ucm_proc_info_vt := (others => '0');
    -- SLc in
    i_slc_data_v          : in slc_rx_vt;
    -- pam out
    o_cde_data_v          : out ucm_cde_vt;
    -- to pipeline
    -- o_pl_phimod           : out std_logic_vector(UCM2PL_PHIMOD_LEN -1 downto 0);
    -- o_pl_phimod_dv        : out std_logic;

    o_ucm2pl_v            : out ucm2pl_vt
  );
end entity ucm_cde;

architecture beh of ucm_cde is

    
  signal i_proc_info_r           : ucm_proc_info_rt;
  
  signal i_slc_data_r     : slc_rx_rt;

  signal int_slc_data_v   : slc_rx_vt;
  signal int2_slc_data_v   : slc_rx_vt;
  signal int_slc_data_r   : slc_rx_rt;
  signal int2_slc_data_r   : slc_rx_rt;

  signal o_cde_data_r     : ucm_cde_rt;
  -- signal o_cde_data_null  : ucm_cde_rt;-- := zero(o_cde_data_r);

  signal barrel_r : slc_barrel_rt;

  signal dv_bus : std_logic_vector(3 downto 0);

  type rpc_z_art is array (3 downto 0) of unsigned (SLC_Z_RPC_LEN -1 downto 0);
  signal rpc_z_a : rpc_z_art;

  signal  int_chamb_ieta : chamb_ieta_rpc_aut;

  -- constant phicenter : std_logic_vector

  signal slc_posphi   : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  -- signal int_phimod   : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  -- signal int_phimod_abs : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod_abs_pl : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod_pl: std_logic_vector(UCM2PL_PHIMOD_LEN - 1 downto 0);--(12 -1 downto 0);
  signal int_phimod_pl_dv : std_logic;
  signal int_abs_dv : std_logic;

  -----------------
  signal o_uCM2pl_r : ucm2pl_rt;

begin

  i_proc_info_r <= convert(i_proc_info_v,i_proc_info_r);
  
  i_slc_data_r <= convert(i_slc_data_v,i_slc_data_r);
  o_cde_data_v <= convert(o_cde_data_r,o_cde_data_v);
  -- o_phimod <= int_phimod;

  PL_in : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 2,
      g_PIPELINE_WIDTH    => i_slc_data_v'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => i_slc_data_v,
      o_data      => int_slc_data_v
  );

  -- PHIMOID_EN: if phimod_ena = '1' generate
    
    B_GEN : if c_ST_nBARREL_ENDCAP = '0' generate

      barrel_r <= convert(i_slc_data_r.specific,barrel_r);

      rpc_z_a <= (unsigned(barrel_r.rpc3_posz),unsigned(barrel_r.rpc2_posz),
        unsigned(barrel_r.rpc1_posz),unsigned(barrel_r.rpc0_posz));

      slc_posphi <= std_logic_vector(i_slc_data_r.common.posphi);

      phimod : entity ucm_lib.ucm_phimod
        -- generic map(

        -- )
        port map(
          clk         => clk,
          rst         => rst,
          ena         => ena,

          i_phicenter => i_phicenter,
          i_posphi    => slc_posphi,
          i_dv        => i_slc_data_r.data_valid,

          o_phimod_abs => int_phimod_abs_pl,
          o_abs_dv    => int_abs_dv,
          o_phimod    => int_phimod_pl,
          o_dv        => int_phimod_pl_dv
      );

      int_slc_data_r <= convert(int_slc_data_v,int_slc_data_r);

      IETA_INN : entity ucm_lib.ucm_ieta_calc
        generic map(
          g_STATION => 0,
          g_RESOLUTION_SCALE => SLC_Z_RPC_MULT,
          g_INPUT_WIDTH => rpc_z_a(0)'length

        )
        port map(
          clk           => clk,
          rst           => rst,
          --
          i_chamber_z_org_bus => i_chamber_z_org_bus(0),
          --
          i_z           => rpc_z_a(0),
          i_z_dv        => int_slc_data_r.data_valid,
          --
          o_ieta        => int_chamb_ieta(0),
          o_ieta_dv     => dv_bus(0)
      );

      IETA_MID0 : entity ucm_lib.ucm_ieta_calc
        generic map(
          g_STATION => 1,
          g_RESOLUTION_SCALE => SLC_Z_RPC_MULT,
          g_INPUT_WIDTH => rpc_z_a(1)'length
        )
        port map(
          clk           => clk,
          rst           => rst,
          --
          i_chamber_z_org_bus => i_chamber_z_org_bus(1),
          --
          i_z           => rpc_z_a(1),
          i_z_dv        => int_slc_data_r.data_valid,
          --
          o_ieta        => int_chamb_ieta(1),
          o_ieta_dv     => dv_bus(1)
      );

      IETA_MID1 : entity ucm_lib.ucm_ieta_calc
        generic map(
          g_STATION => 1,
          g_RESOLUTION_SCALE => SLC_Z_RPC_MULT,
          g_INPUT_WIDTH => rpc_z_a(2)'length
        )
        port map(
          clk           => clk,
          rst           => rst,
          --
          i_chamber_z_org_bus => i_chamber_z_org_bus(1),
          --
          i_z           => rpc_z_a(2),
          i_z_dv        => int_slc_data_r.data_valid,
          --
          o_ieta        => int_chamb_ieta(2),
          o_ieta_dv     => dv_bus(2)
      );

      IETA_OUT : entity ucm_lib.ucm_ieta_calc
        generic map(
          g_STATION => 2,
          g_RESOLUTION_SCALE => SLC_Z_RPC_MULT,
          g_INPUT_WIDTH => rpc_z_a(3)'length
        )
        port map(
          clk           => clk,
          rst           => rst,
          --
          i_chamber_z_org_bus => i_chamber_z_org_bus(2),
          --
          i_z           => rpc_z_a(3),
          i_z_dv        => int_slc_data_r.data_valid,
          --
          o_ieta        => int_chamb_ieta(3),
          o_ieta_dv     => dv_bus(3)
      );

      UCM_CDE2CVP_PROC : process(rst,clk) 
        variable ch_i : integer;
        variable rpc_i : integer;
      begin
        if rising_edge(clk) then
          if(rst= '1') then
            o_cde_data_r <= zero(o_cde_data_r);
            -- o_cde_data_r.muid.slcid   <= o_cde_data_null.muid.slcid;
            -- o_cde_data_r.muid.slid    <= o_cde_data_null.muid.slid ;
            -- o_cde_data_r.muid.bcid    <= o_cde_data_null.muid.bcid ;
            -- o_cde_data_r.cointype     <= o_cde_data_null.cointype  ;
            -- o_cde_data_r.specific     <= o_cde_data_null.specific  ;
            -- o_cde_data_r.data_valid     <= '0';--o_cde_data_null.data_valid;
            -- o_cde_data_r.phimod       <= (others => '0');--o_cde_data_null.phimod    ;
            -- o_cde_data_r.posphi       <= o_cde_data_null.posphi    ;
          else
            if int_slc_data_r.data_valid = '1' then
              o_cde_data_r.muid.slcid   <= int_slc_data_r.common.slcid;
              o_cde_data_r.muid.slid    <= int_slc_data_r.common.trailer.slid;
              o_cde_data_r.muid.bcid    <= int_slc_data_r.common.header.bcid;
              o_cde_data_r.cointype     <= int_slc_data_r.common.cointype;
              o_cde_data_r.specific     <= int_slc_data_r.specific;
              o_cde_data_r.data_valid   <= int_slc_data_r.data_valid;
              o_cde_data_r.posphi       <= int_slc_data_r.common.posphi;
              o_cde_data_r.chamb_ieta   <= int_chamb_ieta;
              o_cde_data_r.phimod       <= std_logic_vector(resize(signed(int_phimod_abs_pl),UCM_CDE2CVP_PHIMOD_LEN));
            else
              -- o_cde_data_r <= zero(o_cde_data_r);
              -- o_cde_data_r.muid.slcid   <= o_cde_data_null.muid.slcid;
              -- o_cde_data_r.muid.slid    <= o_cde_data_null.muid.slid ;
              -- o_cde_data_r.muid.bcid    <= o_cde_data_null.muid.bcid ;
              -- o_cde_data_r.cointype     <= o_cde_data_null.cointype  ;
              -- o_cde_data_r.specific     <= o_cde_data_null.specific  ;
              o_cde_data_r.data_valid   <= '0';--o_cde_data_null.data_valid;
              -- o_cde_data_r.posphi       <= o_cde_data_null.posphi    ;
            end if;
          end if;
        end if;
      end process;

    end generate;

  -- end generate PHIMOID_EN;
  ---------------------------------------------------------------
  --
  ---------------------------------------------------------------

   

  -- BYPASS_GEN: if bypass = '1' generate
    SLC_OUT_PL : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 4,
      g_PIPELINE_WIDTH    => int_slc_data_v'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => int_slc_data_v,
      -- i_dv        => int_uCM2pl_ar(sl_i).data_valid,
      o_data      => int2_slc_data_v
      -- o_dv        => o_uCM2pl_ar(sl_i).data_valid
    );


    int2_slc_data_r <= convert(int2_slc_data_v,int2_slc_data_r);

    UCM_CDE2CVP_PROC : process(rst,clk) 
      variable ch_i : integer;
      variable rpc_i : integer;
    begin
      if rising_edge(clk) then
        if(rst= '1') then
          o_uCM2pl_r <= zero(o_uCM2pl_r);
        else
          if int2_slc_data_r.data_valid = '1' then
            o_uCM2pl_r.busy        <= i_proc_info_r.processed;
            o_uCM2pl_r.process_ch   <= i_proc_info_r.ch;

            o_uCM2pl_r.common   <= int2_slc_data_r.common;

            -- o_uCM2pl_r.specific     <= int2_slc_data_r.specific;
            o_uCM2pl_r.data_valid   <= int2_slc_data_r.data_valid;
            -- o_uCM2pl_r.posphi       <= int2_slc_data_r.common.posphi;
            -- o_uCM2pl_r.chamb_ieta   <= int2_chamb_ieta;
            -- if ena = '1' then
              o_uCM2pl_r.phimod       <= resize(signed(int_phimod_pl),UCM2PL_PHIMOD_LEN);
            -- else
            --   o_uCM2pl_r.phimod       <= (others => '0');
            -- end if;

          else
            -- o_uCM2pl_r <= zero(o_uCM2pl_r);
            -- o_cde_data_r.muid.slcid   <= o_cde_data_null.muid.slcid;
            -- o_cde_data_r.muid.slid    <= o_cde_data_null.muid.slid ;
            -- o_cde_data_r.muid.bcid    <= o_cde_data_null.muid.bcid ;
            -- o_cde_data_r.cointype     <= o_cde_data_null.cointype  ;
            -- o_cde_data_r.specific     <= o_cde_data_null.specific  ;
            o_uCM2pl_r.data_valid   <= '0';--o_cde_data_null.data_valid;
            -- o_cde_data_r.posphi       <= o_cde_data_null.posphi    ;
          end if;
        end if;
      end if;
    end process;

    o_uCM2pl_v <= convert(o_uCM2pl_r,o_uCM2pl_v);
  -- end generate BYPASS_GEN;

  


  -- falta el calculo de sl destino?

end beh;