--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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
use shared_lib.barrel_chamb_z2origin_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;
-- use ucm_lib.ucm_function_pkg.all;

-- library ctrl_lib;
-- use ctrl_lib.UCM_CTRL.all;

library  vamc_lib;

entity ucm_cde is
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena               : in std_logic;
    -- configuration, control & Monitoring
    i_phicenter           : in unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    i_chamber_z_org_bus   : in b_chamber_z_origin_station_avt;
    -- SLc in
    i_slc_data_v          : in slc_rx_rvt;
    -- pam out
    o_cde_data_v          : out ucm_cde_rvt;
    -- to pipeline
    o_pl_phimod           : out std_logic_vector(UCM2PL_PHIMOD_LEN -1 downto 0);
    o_pl_phimod_dv        : out std_logic
  );
end entity ucm_cde;

architecture beh of ucm_cde is
  
  signal i_slc_data_r     : slc_rx_rt;

  signal int_slc_data_v   : slc_rx_rvt;
  signal int_slc_data_r   : slc_rx_rt;

  signal o_cde_data_r     : ucm_cde_rt;
  -- signal o_cde_data_null  : ucm_cde_rt;-- := nullify(o_cde_data_r);

  signal barrel_r : slc_barrel_rt;

  signal dv_bus : std_logic_vector(3 downto 0);

  type rpc_z_at is array (3 downto 0) of unsigned (SLC_Z_RPC_LEN -1 downto 0);
  signal rpc_z_a : rpc_z_at;

  -- constant phicenter : std_logic_vector

  signal slc_posphi   : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod   : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod_abs : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod_pl: std_logic_vector(12 -1 downto 0);
  signal int_phimod_dv : std_logic;
begin
  
  i_slc_data_r <= structify(i_slc_data_v);
  o_cde_data_v <= vectorify(o_cde_data_r);
  -- o_phimod <= int_phimod;

  B_GEN : if c_ST_nBARREL_ENDCAP = '0' generate

    barrel_r <= structify(i_slc_data_r.specific);

    rpc_z_a <= (
      unsigned(barrel_r.rpc3_posz),
      unsigned(barrel_r.rpc2_posz),
      unsigned(barrel_r.rpc1_posz),
      unsigned(barrel_r.rpc0_posz)
    );

    -- PHIMOD : entity ucm_lib.ucm_cvp_phimod
    --   generic map(
    --     g_PIPELINE => 2
    --   )
    --   port map(
    --     clk         =>clk,
    --     rst         =>rst,
    --     --
    --     i_phicenter   => i_phicenter,
    --     --
    --     i_posphi    => i_slc_data_r.common.posphi,
    --     i_dv        => i_slc_data_r.data_valid,
    --     --
    --     o_phimod    => int_phimod,
    --     o_dv        => int_phimod_dv
    -- );
    slc_posphi <= std_logic_vector(i_slc_data_r.common.posphi);
    -- PHIMOD : entity shared_lib.generic_pipelined_MATH
    --   generic map(
    --     g_OPERATION => "-",
    --     g_IN_PIPE_STAGES  => 1,
    --     -- g_OPERAND_A_WIDTH => SLC_COMMON_POSPHI_LEN,
    --     -- g_OPERAND_B_WIDTH => SLC_COMMON_POSPHI_LEN,
    --     g_OUT_PIPE_STAGES => 1
    --   )
    --   port map(
    --     clk         => clk,
    --     rst         => rst,
    --     --
    --     i_in_A      => slc_posphi,
    --     i_in_B      => std_logic_vector(i_phicenter),
    --     i_in_C      => "0",
    --     i_in_D      => "0",
    --     i_dv        => i_slc_data_r.data_valid,
    --     --
    --     o_result    => int_phimod,
    --     o_dv        => int_phimod_dv
    -- );
    phimod_proc : process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          int_phimod      <= (others => '0');
          int_phimod_abs  <= (others => '0');
          int_phimod_dv <= '0';
        else
          int_phimod_dv <= i_slc_data_r.data_valid ;

          if i_slc_data_r.data_valid = '1' then
            int_phimod      <= std_logic_vector(resize(signed('0'&slc_posphi) - signed('0'&i_phicenter),SLC_COMMON_POSPHI_LEN));
            int_phimod_abs  <= std_logic_vector(resize(abs(signed('0'&slc_posphi) - signed('0'&i_phicenter)),SLC_COMMON_POSPHI_LEN));
          else
            int_phimod      <= (others => '0');
            int_phimod_abs  <= (others => '0');
          end if;
        end if;
      end if;
    end process;


    PHIMOD_SCALE : entity shared_lib.generic_pipelined_MATH
      generic map(
        g_OPERATION => "*",
        g_IN_PIPE_STAGES  => 2,
        -- g_OPERAND_A_WIDTH => SLC_COMMON_POSPHI_LEN,
        -- g_OPERAND_B_WIDTH => 3,
        g_OUT_PIPE_STAGES => 2
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => int_phimod,
        i_in_B      => std_logic_vector(to_unsigned(integer(3),3)),
        i_in_C      => "0",
        i_in_D      => "0",
        i_dv        => int_phimod_dv,
        --
        o_result    => int_phimod_pl,
        o_dv        => o_pl_phimod_dv
    );

    o_pl_phimod	<= std_logic_vector(resize(signed(int_phimod_pl),UCM2PL_PHIMOD_LEN));



    PL_in : entity vamc_lib.vamc_sr
      generic map(
        g_DELAY_CYCLES  => 1,
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
    int_slc_data_r <= structify(int_slc_data_v);

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
        o_ieta        => o_cde_data_r.chamb_ieta(0),
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
        o_ieta        => o_cde_data_r.chamb_ieta(1),
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
        o_ieta        => o_cde_data_r.chamb_ieta(2),
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
        o_ieta        => o_cde_data_r.chamb_ieta(3),
        o_ieta_dv     => dv_bus(3)
    );

    UCM_PRE_PROC : process(rst,clk) 
      variable ch_i : integer;
      variable rpc_i : integer;
    begin
      if rising_edge(clk) then
        if(rst= '1') then
          -- o_cde_data_r <= nullify(o_cde_data_r);
          -- o_cde_data_r.muid.slcid   <= o_cde_data_null.muid.slcid;
          -- o_cde_data_r.muid.slid    <= o_cde_data_null.muid.slid ;
          -- o_cde_data_r.muid.bcid    <= o_cde_data_null.muid.bcid ;
          -- o_cde_data_r.cointype     <= o_cde_data_null.cointype  ;
          -- o_cde_data_r.specific     <= o_cde_data_null.specific  ;
          o_cde_data_r.data_valid     <= '0';--o_cde_data_null.data_valid;
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
            o_cde_data_r.phimod       <= std_logic_vector(resize(signed(int_phimod_abs),5));


            -- -- INN
            -- ch_i := 0;
            -- rpc_i := 0;
            -- o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,0,to_integer(rpc_z_a(0)),SLC_Z_RPC_MULT);
            -- -- MID 1
            -- ch_i := 1;
            -- rpc_i := 1;
            -- o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,1,to_integer(rpc_z_a(1)),SLC_Z_RPC_MULT);
            -- -- MID 2
            -- ch_i := 1;
            -- rpc_i := 2;
            -- o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,1,to_integer(rpc_z_a(2)),SLC_Z_RPC_MULT);
            -- -- OUT
            -- ch_i := 2;
            -- rpc_i := 3;
            -- o_cde_data_r.chamb_ieta(rpc_i) <= get_chamber_ieta(c_SECTOR_ID,2,to_integer(rpc_z_a(3)),SLC_Z_RPC_MULT);


          else
            -- o_cde_data_r <= nullify(o_cde_data_r);
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


  -- falta el calculo de sl destino?

end beh;