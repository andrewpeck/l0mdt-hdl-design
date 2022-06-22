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
use shared_lib.barrel_chamb_z2origin_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;
-- use ucm_lib.ucm_function_pkg.all;

-- library ctrl_lib;
-- use ctrl_lib.UCM_CTRL.all;

library  vamc_lib;

entity ucm_phimod is
  -- generic(
  --   bypass                : std_logic  := '1';
  --   phimod_ena            : std_logic  := '1'
  -- );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic;
    -- configuration, control & Monitoring
    -- i_phicenter           : in unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    -- i_chamber_z_org_bus   : in b_chamber_z_origin_station_avt;
    -- -- PAM
    -- i_proc_info_v         : in ucm_proc_info_vt := (others => '0');
    -- -- SLc in
    -- i_slc_data_v          : in slc_rx_vt;
    -- -- pam out
    -- o_cde_data_v          : out ucm_cde_vt;
    -- -- to pipeline
    -- o_pl_phimod           : out std_logic_vector(UCM2PL_PHIMOD_LEN -1 downto 0);
    -- o_pl_phimod_dv        : out std_logic;

    -- o_ucm2pl_v            : out ucm2pl_vt

    i_phicenter : in unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    i_posphi    : in std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
    i_dv        : in std_logic;
    o_phimod_abs : out std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
    o_phimod    : out std_logic_vector(UCM2PL_PHIMOD_LEN -1 downto 0);
    o_dv        : out std_logic
  );
end entity ucm_phimod;

architecture beh of ucm_phimod is

    
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
  signal int_phimod   : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod_abs : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod_abs_pl : std_logic_vector(SLC_COMMON_POSPHI_LEN -1 downto 0);
  signal int_phimod_pl: std_logic_vector(12 -1 downto 0);
  signal int_phimod_dv : std_logic;

  -----------------
  signal o_uCM2pl_r : ucm2pl_rt;

begin

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
            int_phimod_dv <= i_dv ;
            int_phimod_abs_pl <= int_phimod_abs;
            if i_dv = '1' then
              int_phimod      <= std_logic_vector(resize(signed('0'&i_posphi) - signed('0'&i_phicenter),SLC_COMMON_POSPHI_LEN));
              int_phimod_abs  <= std_logic_vector(resize(abs(signed('0'&i_posphi) - signed('0'&i_phicenter)),SLC_COMMON_POSPHI_LEN));
            else
              int_phimod      <= (others => '0');
              int_phimod_abs  <= (others => '0');
            end if;
          end if;
        end if;
      end process;

      o_phimod_abs <= int_phimod_abs_pl;


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
          o_dv        => o_dv
      );

      o_phimod	<= std_logic_vector(resize(signed(int_phimod_pl),UCM2PL_PHIMOD_LEN));

      -- int_slc_data_r <= convert(int_slc_data_v,int_slc_data_r);

    -- end generate;
end beh;