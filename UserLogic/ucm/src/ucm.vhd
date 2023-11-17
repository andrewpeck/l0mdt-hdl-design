--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm.vhd
-- Module: Muon Candidate manager
-- File PATH: /ucm.vhd
-- -----
-- File Created: somewhere in 2020
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 16th November 2023 9:39:28 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2023-11-17	GLdL	New V1.2 algorithm
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

use shared_lib.fct_barrel_chamb_z2origin_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

library vamc_lib;

entity ucm is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;
    ttc_commands            : in l0mdt_ttc_rt;
    -- configuration, control & Monitoring
    ctrl_v              : in  std_logic_vector;--UCM_CTRL_t;
    mon_v               : out std_logic_vector;--UCM_MON_t;
    -- SLc in
    i_slc_data_mainA_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_neighborA_v  : in slc_rx_vt;
    i_slc_data_neighborB_v  : in slc_rx_vt;
    -- to TAR
    o_uCM2tar_inn_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_mid_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_out_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_ext_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    -- to hps
    o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    -- pipeline
    o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity ucm;

architecture beh of ucm is

  --  SC
  signal ctrl_r : UCM_CTRL_t;
  signal mon_r  : UCM_MON_t;

  signal super_ctrl_r : UCM_SUPER_CTRL_t;
  signal super_mon_r : UCM_SUPER_MON_t;
  signal super_ctrl_v : std_logic_vector(UCM_SUPER_CTRL_t'w - 1 downto 0);
  signal super_mon_v : std_logic_vector(UCM_SUPER_MON_t'w - 1 downto 0);

  signal r_phi_comp_ctrl_r : UCM_R_PHI_COMP_CTRL_t;
  signal r_phi_comp_ctrl_v : std_logic_vector(UCM_R_PHI_COMP_CTRL_t'w - 1 downto 0);
  signal r_phi_comp_mon_r  : UCM_R_PHI_COMP_MON_t;
  type   r_phi_comp_mon_avt is array (0 to c_NUM_ACCEPTS - 1)of std_logic_vector(UCM_R_PHI_COMP_MON_t'w -1 downto 0);
  signal r_phi_comp_mon_av  : r_phi_comp_mon_avt;
  signal r_phi_comp_mon_null : std_logic_vector(UCM_R_PHI_COMP_MON_t'w -1 downto 0)  := (others => '0');
  -- type   mdt_mon_avt is array (0 to c_NUM_ACCEPTS - 1)of std_logic_vector(UCM_R_PHI_COMP_RPC_MON_t'w -1 downto 0);
  -- signal mdt_mon_av  : mdt_mon_avt;
  -- signal mdt_mon_null : std_logic_vector(UCM_R_PHI_COMP_RPC_MON_t'w -1 downto 0)  := (others => '0');

  -- signal rpc_R_ctrl_r : UCM_RPC_R_COMP_CTRL_t;
  signal rpc_R_mon_r  : UCM_R_PHI_COMP_RPC_MON_t;
  -- signal rpc_R_ctrl_v : std_logic_vector(len(rpc_R_ctrl_r) - 1 downto 0);
  signal rpc_R_mon_v  : std_logic_vector(UCM_R_PHI_COMP_RPC_MON_t'w - 1 downto 0);
  type   rpc_mon_art is array (0 to c_NUM_ACCEPTS - 1) of UCM_R_PHI_COMP_RPC_MON_t;
  signal rpc_mon_a  : rpc_mon_art;
  type   rpc_mon_avt is array (0 to c_NUM_ACCEPTS - 1)of std_logic_vector(UCM_R_PHI_COMP_RPC_MON_t'w -1 downto 0);
  signal rpc_mon_av  : rpc_mon_avt;
  signal rpc_mon_null : std_logic_vector(UCM_R_PHI_COMP_RPC_MON_t'w -1 downto 0)  := (others => '0');
  
  -- signal mdt_R_ctrl_r : UCM_MDT_R_COMP_CTRL_t;
  signal mdt_R_mon_r  : UCM_R_PHI_COMP_MDT_MON_t;
  -- signal mdt_R_ctrl_v : std_logic_vector(len(mdt_R_ctrl_r) - 1 downto 0);
  signal mdt_R_mon_v  : std_logic_vector(UCM_R_PHI_COMP_MDT_MON_t'w - 1 downto 0);
  type   mdt_mon_art is array (0 to c_NUM_ACCEPTS - 1) of UCM_R_PHI_COMP_MDT_MON_t;
  signal mdt_mon_a  : mdt_mon_art;
  type   mdt_mon_avt is array (0 to c_NUM_ACCEPTS - 1)of std_logic_vector(UCM_R_PHI_COMP_MDT_MON_t'w -1 downto 0);
  signal mdt_mon_av  : mdt_mon_avt;
  signal mdt_mon_null : std_logic_vector(UCM_R_PHI_COMP_MDT_MON_t'w -1 downto 0)  := (others => '0');

  --  FC

  signal local_en   : std_logic;
  signal local_rst  : std_logic;

  -- signals

  signal i_slc_data_av        : slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
  --
  signal prepro2ctrl_av       : ucm_prepro2ctrl_avt(c_MAX_NUM_SL -1 downto 0);
  --
  -- signal ucm_prepro_av        : slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
  -- signal csin_slc_data_av    : slc_prepro_avt(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_in_av       : slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
  -- signal csw_main_in_dv      : std_logic;
  signal csw_ctrl_dv      : std_logic;
  
  
  -- signal csw_main_out_ar      : slc_rx_art(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_out_av      : slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_out_dv      : std_logic;

  signal slc_endcap_ar        : slc_endcap_art(c_MAX_NUM_SL -1 downto 0);

  -- signal cde_in_av            : slc_rx_avt(c_NUM_ACCEPTS -1 downto 0);

  -- signal int_uCM2pl_av        : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
  -- signal int_uCM2pl_ar        : ucm2plart(c_MAX_NUM_SL -1 downto 0);
  -- signal o_uCM2pl_ar          : ucm2plart(c_MAX_NUM_SL -1 downto 0);
  -- signal pl_o_uCM2pl_ar       : ucm2plart(c_MAX_NUM_SL -1 downto 0);
  -- signal pl_o_uCM2pl_av       : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
  -- signal o_uCM2pl_av          : pipeline_avt;

  signal cpam_in_av           : ucm_cde_avt(c_MAX_NUM_SL -1 downto 0);
  signal cpam_out_av          : ucm_cde_avt(c_NUM_ACCEPTS -1 downto 0);

  -- signal uCM2pl_av            : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

  signal csw_control_av       : ucm_csw_control_avt(c_MAX_NUM_SL -1 downto 0);
  signal pam_CSW_control      : ucm_pam_control_art(c_NUM_ACCEPTS -1 downto 0);
  signal proc_info_av          : ucm_proc_info_avt(c_MAX_NUM_SL -1 downto 0);

  signal cvp_in_en            : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
  signal cvp_loc_rst          : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);

  -- type cde_phimod_art is array (c_NUM_ACCEPTS - 1 downto 0) of std_logic_vector(UCM2PL_PHIMOD_LEN -1 downto 0);
  -- signal cde_phimod           : cde_phimod_art;
  -- signal cde_phimod_dv        : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);

  -- signal int_slc_data        : slc_prepro_avt(c_MAX_NUM_SL -1 downto 0);
  type ucm2hps_aavt is array (c_NUM_ACCEPTS -1 downto 0) of ucm2hps_avt(c_MAX_POSSIBLE_HPS -1 downto 0);
  signal uCM2hps_data           : ucm2hps_aavt;

  signal cde_chamber_z_org_bus  : b_chamber_z_origin_station_avt;
  signal cvp_chamber_z_org_bus  : b_chamber_z_origin_station_avt;
  signal phicenter              : unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);

  -- type cde_cz0_art is array(c_NUM_ACCEPTS -1 downto 0) of UCM_DP_CHAMB_Z0_DP_CHAMB_Z0_MON_t_ARRAY;
  -- signal cde_cz0_a : cde_cz0_art;

  -- type cvp_cz0_art is array(c_NUM_ACCEPTS -1 downto 0) of UCM_DP_CHAMB_Z0_DP_CHAMB_Z0_MON_t_ARRAY;
  -- signal cvp_cz0_a : cvp_cz0_art;

  signal aux_uCM2hps_inn_r  : ucm2hps_rt;
  signal o_uCM2hps_inn_ar   : ucm2hps_art(c_NUM_ACCEPTS -1 downto 0);
  signal o_uCM2hps_mid_ar   : ucm2hps_art(c_NUM_ACCEPTS -1 downto 0);
  signal o_uCM2hps_out_ar   : ucm2hps_art(c_NUM_ACCEPTS -1 downto 0);
  signal o_uCM2hps_ext_ar   : ucm2hps_art(c_NUM_ACCEPTS -1 downto 0);
  signal o_uCM2pl_ar        : ucm2pl_art(c_MAX_NUM_SL -1 downto 0);
  
  signal int_uCM2pl_av : ucm_cde2pl_avt(c_MAX_NUM_SL -1 downto 0);

begin

  -- SC
  ctrl_r  <= convert(ctrl_v,ctrl_r);
  super_ctrl_r <= ctrl_r.super;

  mon_r.super <= super_mon_r;
  mon_r.R_PHI_COMP.rpc <= rpc_R_mon_r;
  mon_r.R_PHI_COMP.mdt <= mdt_R_mon_r;
  mon_v   <= convert(mon_r,mon_v);

  super_ctrl_v <= convert(super_ctrl_r,super_ctrl_v);
  super_mon_r <= convert(super_mon_v,super_mon_r);


  r_phi_comp_ctrl_r <= ctrl_r.R_PHI_COMP;
  r_phi_comp_ctrl_v <= convert(r_phi_comp_ctrl_r,r_phi_comp_ctrl_v);
  



  mon_arrays: for th_i in 0 to c_NUM_ACCEPTS - 1 generate
    mdt_mon_av(th_i) <= convert(convert(r_phi_comp_mon_av(th_i),r_phi_comp_mon_r).mdt,mdt_mon_av(th_i));
    rpc_mon_av(th_i) <= convert(convert(r_phi_comp_mon_av(th_i),r_phi_comp_mon_r).rpc,rpc_mon_av(th_i));

  end generate mon_arrays;

    mdt_R_mon_v <=  mdt_mon_av(to_integer(unsigned(r_phi_comp_ctrl_r.mdt.sel_thread))) when r_phi_comp_ctrl_r.mdt.ext_ctrl =  '1' else (others => '0');
    rpc_R_mon_v <=  rpc_mon_av(to_integer(unsigned(r_phi_comp_ctrl_r.rpc.sel_thread))) when r_phi_comp_ctrl_r.rpc.ext_ctrl =  '1' else (others => '0');

    -- mdt_R_mon_v <=  mdt_mon_av(0) when r_phi_comp_ctrl_r.mdt.ext_ctrl =  '1' and to_integer(unsigned(r_phi_comp_ctrl_r.mdt.sel_thread)) = 0 else
    --                 mdt_mon_av(1) when r_phi_comp_ctrl_r.mdt.ext_ctrl =  '1' and to_integer(unsigned(r_phi_comp_ctrl_r.mdt.sel_thread)) = 1 else
    --                 mdt_mon_av(2);
    mdt_R_mon_r <= convert(mdt_R_mon_v,mdt_R_mon_r);

    -- rpc_R_mon_v <=  rpc_mon_av(0) when r_phi_comp_ctrl_r.rpc.ext_ctrl =  '1' and to_integer(unsigned(r_phi_comp_ctrl_r.rpc.sel_thread)) = 0 else
    --                 rpc_mon_av(1) when r_phi_comp_ctrl_r.rpc.ext_ctrl =  '1' and to_integer(unsigned(r_phi_comp_ctrl_r.rpc.sel_thread)) = 1 else
    --                 rpc_mon_av(2);
    rpc_R_mon_r <= convert(rpc_R_mon_v,rpc_R_mon_r);


  --------------------------------

  SLC_BoEs : if c_ST_nBARREL_ENDCAP = '0' or c_ENDCAP_nSMALL_LARGE = '0' generate
    i_slc_data_av(c_MAX_NUM_SL -1) <= i_slc_data_mainA_av(2);
    i_slc_data_av(c_MAX_NUM_SL -2) <= i_slc_data_mainA_av(1);
    i_slc_data_av(c_MAX_NUM_SL -3) <= i_slc_data_mainA_av(0);
    SLC1 : if c_ENABLE_NEIGHBORS = '1' generate
      i_slc_data_av(c_MAX_NUM_SL -4) <= i_slc_data_neighborA_v;
      i_slc_data_av(c_MAX_NUM_SL -5) <= i_slc_data_neighborB_v;
    end generate;
  end generate;

  UCM_SUPERVISOR : entity ucm_lib.ucm_supervisor
  port map(
    clk               => clk,
    rst               => rst,
    glob_en           => glob_en,      
    -- AXI to SoC
    ctrl_v              => super_ctrl_v,
    mon_v               => super_mon_v,
    --
    o_phicenter => phicenter,
    o_cde_chamber_z_org_av => cde_chamber_z_org_bus,
    o_cvp_chamber_z_org_av => cvp_chamber_z_org_bus,
    -- 
    o_local_en          => local_en,
    o_local_rst         => local_rst
  );

  --control
  SLC_CTRL : entity ucm_lib.ucm_ctrl_top
  port map(
    clk               => clk,
    rst               => local_rst,
    ena               => local_en,
    --
    i_prepro2ctrl_av  => prepro2ctrl_av,
    --
    o_csw_ctrl_av     => csw_control_av,
    o_csw_ctrl_dv     => csw_ctrl_dv,
    o_pam_ctrl        => pam_CSW_control,
    -- o_proc_info       => proc_info_av,
    o_proc_info_av    => proc_info_av,
    --
    o_cvp_rst         => cvp_loc_rst,
    o_cvp_ctrl        => cvp_in_en
    -- o_pam2heg         => o_uCM2hps_pam_ar
  );

  --input pre processor
  SLC_PP_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    SLC_PP : entity ucm_lib.ucm_prepro
    generic map(
      g_DELAY_CYCLES  => 2
    )
    port map(
      clk               => clk,
      rst               => local_rst,
      ena               => local_en,
      --                =>
      i_slc_data_v      => i_slc_data_av(sl_i),
      o_prepro2ctrl_v   => prepro2ctrl_av(sl_i),
      o_prepro_data_v   => csw_main_in_av(sl_i)
    );
  end generate;

  -- input pipelines
  -- SLC_IN_PL_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
  --   SLC_IN_PL : entity vamc_lib.vamc_spl
  --   generic map(
  --     g_DELAY_CYCLES  => 2,
  --     g_PIPELINE_WIDTH    => SLC_RX_LEN
  --   )
  --   port map(
  --     clk         => clk,
  --     rst         => local_rst,
  --     ena         => local_en,
  --     --
  --     i_data      => ucm_prepro_av(sl_i),
  --     o_data      => csw_main_in_av(sl_i)
  --   );
  -- end generate;

  -- main cross switch
  -- csw_main_in_dv <= or_reduce(csw_control_av); 
  SLC_CSW : entity ucm_lib.ucm_csw
  port map(
    clk         => clk,
    rst         => local_rst,
    glob_en     => local_en,
    
    i_control_av   => csw_control_av,
    -- data
    i_data_av   => csw_main_in_av,
    i_dv        => csw_ctrl_dv,
    o_data_av   => csw_main_out_av,
    o_dv        => csw_main_out_dv
  );


  SLC_CDE_LOOP : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    -- SLC_CDE_TH: if sl_i >= (c_MAX_NUM_SL - c_NUM_ACCEPTS) generate
      SLC_CDE : entity ucm_lib.ucm_cde
      port map(
        clk                   => clk,
        rst                   => local_rst,
        ena                   => local_en,
        --
        i_phicenter           => phicenter,
        i_chamber_z_org_bus   => cde_chamber_z_org_bus,
        --
        -- i_proc_info_v         => proc_info_av(sl_i),-- - (c_MAX_NUM_SL - c_NUM_ACCEPTS) ),
        -- i_proc_info_v         => proc_info_av((c_MAX_NUM_SL - 1) - sl_i + (c_NUM_ACCEPTS - 1) - 2),
        -- i_proc_info_v         => proc_info_av(sl_i),
        --
        i_slc_data_v          => csw_main_out_av(sl_i),
        --
        o_cde_data_v          => cpam_in_av(sl_i),-- - (c_MAX_NUM_SL - c_NUM_ACCEPTS) )
        -- o_cde_data_v          => cpam_in_av((c_MAX_NUM_SL - 1) - sl_i + (c_NUM_ACCEPTS - 1) - 2),
        --
        -- o_pl_phimod           => cde_phimod(sl_i),
        -- o_pl_phimod_dv        => 

        o_ucm2pl_v => int_uCM2pl_av(sl_i)
      );
    -- else generate
    --   SLC_CDE : entity ucm_lib.ucm_cde
    --   generic map(
    --     phimod_ena =>  '0'
    --   )
    --   port map(
    --     clk                   => clk,
    --     rst                   => local_rst,
    --     ena                   => local_en,
    --     --
    --     i_phicenter           => phicenter,
    --     i_chamber_z_org_bus   => cde_chamber_z_org_bus,
    --     --
    --     -- i_proc_info_v         => proc_info_av(sl_i),
    --     --
    --     i_slc_data_v          => csw_main_out_av(sl_i),
    --     --
    --     o_cde_data_v          => cpam_in_av((c_MAX_NUM_SL - 1) - sl_i + (c_NUM_ACCEPTS - 1) - 1)
    --     --
    --     -- o_pl_phimod           => cde_phimod(sl_i),
    --     -- o_pl_phimod_dv        => 

    --     -- o_ucm2pl_v => o_uCM2pl_av(sl_i)
    --   );

    -- end generate;
  end generate;

  -- PAM cross switch
  SLC_PAM_CSW : entity ucm_lib.ucm_pam_csw
    port map(
      clk         => clk,
      rst         => local_rst,
      glob_en     => local_en,
      
      i_control   => pam_CSW_control,
      -- data
      i_data      => cpam_in_av(c_MAX_NUM_SL - 1 downto c_MAX_NUM_SL -c_NUM_ACCEPTS),
      o_data      => cpam_out_av
    );

  OUT2TAR : entity ucm_lib.ucm_out2tar
    port map(
      clk           => clk,
      rst           => local_rst,
      ena           => local_en,
      --
      -- ctrl_v              => r_phi_comp_ctrl_v,
      -- mon_v               => r_phi_comp_mon_av(vp_i),
      --
      i_proc_info_av  => proc_info_av,
      --
      o_uCM2tar_inn_av  => o_uCM2tar_inn_av,
      o_uCM2tar_mid_av  => o_uCM2tar_mid_av,
      o_uCM2tar_out_av  => o_uCM2tar_out_av,
      o_uCM2tar_ext_av  => o_uCM2tar_ext_av

    );


  -- vector processors
  SLC_VP_A : for vp_i in c_NUM_ACCEPTS -1 downto 0 generate
    SLC_VP : entity ucm_lib.ucm_cvp
    port map(
      clk           => clk,
      rst           => local_rst,
      ena       => local_en,
      --
      ctrl_v              => r_phi_comp_ctrl_v,
      mon_v               => r_phi_comp_mon_av(vp_i),
      -- i_phicenter            => phicenter,
      i_chamber_z_org_bus => cvp_chamber_z_org_bus,
      --
      i_local_rst   => cvp_loc_rst(vp_i),
      i_in_en       => cvp_in_en(vp_i),
      --
      i_data_v      => cpam_out_av(vp_i),
      --
      -- o_phimod      => cde_phimod(vp_i),
      o_uCM2hps_av  => uCM2hps_data(vp_i)

    );
  end generate;

  -- -- output pipelines
  -- o_uCM2pl_av <= convert(o_uCM2pl_av);

  -- VP2HPS: for hps_i in c_MAX_NUM_HPS -1 downto 0 generate
    VP2HEG: for th_i in c_NUM_ACCEPTS -1 downto 0 generate
      -- shared variable v_aux_uCM2hps_inn_r  : ucm2hps_rt;
    begin
      VP2HPS_INN : if c_HPS_ENABLE_ST_INN generate
        o_uCM2hps_inn_av(th_i) <= uCM2hps_data(th_i)(0);
        -- v_aux_uCM2hps_inn_r := convert(uCM2hps_data(th_i)(0));
        -- o_uCM2hps_inn_ar(th_i) <= v_aux_uCM2hps_inn_r;
        -- o_uCM2hps_inn_ar(th_i) <= convert(ucm2hps_vt(uCM2hps_data(th_i)(0)));
      end generate;
      VP2HPS_MID : if c_HPS_ENABLE_ST_MID generate
        o_uCM2hps_mid_av(th_i) <= uCM2hps_data(th_i)(1);
      end generate;
      VP2HPS_OUT : if c_HPS_ENABLE_ST_OUT generate
        o_uCM2hps_out_av(th_i) <= uCM2hps_data(th_i)(2);
      end generate;
      VP2HPS_EXT_EN : if c_HPS_ENABLE_ST_EXT generate
        o_uCM2hps_ext_av(th_i) <= uCM2hps_data(th_i)(3);
      end generate;
      VP2HPS_EXT_DIS : if not c_HPS_ENABLE_ST_EXT generate
        o_uCM2hps_ext_av(th_i) <= (others => '0');
      end generate;
      
      --convert(o_uCM2hps_inn_av(th_i));
      -- o_uCM2hps_mid_ar(th_i) <= convert(o_uCM2hps_mid_av(th_i));
      -- o_uCM2hps_out_ar(th_i) <= convert(o_uCM2hps_out_av(th_i));
      -- o_uCM2hps_ext_ar(th_i) <= convert(o_uCM2hps_ext_av(th_i));
      -- o_uCM2hps_data_av(hps_i)(heg_i) <= uCM2hps_data(heg_i)(hps_i);
    end generate;
  -- end generate;
  -- o_uCM2hps_inn_ar <= convert(o_uCM2hps_inn_av,o_uCM2hps_inn_ar);
  -- o_uCM2hps_mid_ar <= convert(o_uCM2hps_mid_av,o_uCM2hps_mid_ar);
  -- o_uCM2hps_out_ar <= convert(o_uCM2hps_out_av,o_uCM2hps_out_ar);
  -- o_uCM2hps_ext_ar <= convert(o_uCM2hps_ext_av,o_uCM2hps_ext_ar);
  -- o_uCM2pl_ar <= convert(o_uCM2pl_av,o_uCM2pl_ar);

  OUT2CPL : entity ucm_lib.ucm_out2cpl
    port map(
      clk           => clk,
      rst           => local_rst,
      ena           => local_en,
      --
      -- ctrl_v              => r_phi_comp_ctrl_v,
      -- mon_v               => r_phi_comp_mon_av(vp_i),
      --
      i_proc_info_av  => proc_info_av,
      i_data_av       => int_uCM2pl_av,
      --
      o_uCM2pl_av => o_uCM2pl_av
    );
  

end architecture;