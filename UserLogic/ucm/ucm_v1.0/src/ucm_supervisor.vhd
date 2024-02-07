--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_supervisor.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_supervisor.vhd
-- -----
-- File Created: Thursday, 16th March 2022 3:06:53 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 18th May 2023 5:51:03 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.fct_barrel_chamb_z2origin_pkg.all;

-- use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;
use shared_lib.fct_sector_phi_center_pkg.all;

library apbus_lib;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_supervisor is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- AXI to SoC
    ctrl_v              : in  std_logic_vector;--UCM_SUPER_CTRL_t;
    mon_v               : out std_logic_vector;--UCM_SUPER_MON_t;
    --
    o_phicenter             : out unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    o_cde_chamber_z_org_av : out b_chamber_z_origin_station_avt;
    o_cvp_chamber_z_org_av : out b_chamber_z_origin_station_avt;
    --
    i_freeze      : in std_logic := '0';
    o_freeze            : out std_logic;
    --
    o_local_en            : out std_logic;
    o_local_rst           : out std_logic


  );
end entity ucm_supervisor;

architecture beh of ucm_supervisor is

  signal ctrl_r        : UCM_SUPER_CTRL_t;
  signal mon_r         : UCM_SUPER_MON_t;

  signal local_rst : std_logic;
  signal local_en  : std_logic;
  --
  signal int_en   : std_logic;
  signal int_rst  : std_logic := '1';

  signal int_freeze : std_logic;

  constant apb_clk_lat : integer := c_CLK_AXI_MULT;
  signal  apb_clk_cnt : integer;
  signal axi_cnt_reset    : std_logic;
  signal axi_rep_clk      : std_logic;

  --
  signal phicenter  : unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0) := get_sector_phi_center(c_SECTOR_ID,SLC_COMMON_POSPHI_LEN);
  signal PHI_CTRL     : UCM_SUPER_SECTOR_PHI_CTRL_t;
  signal PHI_MON     : UCM_SUPER_SECTOR_PHI_MON_t;
  --
  -- signal cde_z0_apb_rd_addr_o    : std_logic_vector(8 - 1 downto 0);
  -- signal cde_z0_apb_wr_addr_o    : std_logic_vector(8 - 1 downto 0);
  -- signal cde_z0_apb_wr_data_o       : std_logic_vector(16 - 1 downto 0);
  -- signal cde_z0_apb_wr_dv_o         : std_logic;
  -- signal cde_z0_apb_rd_dv_o         : std_logic;
  -- signal cde_z0_apb_rd_data_i       : std_logic_vector(16 - 1 downto 0);
  -- signal cde_z0_apb_rd_dv_i         : std_logic;
  signal cde_ch_z0_org : b_chamber_z_origin_station_aut := get_b_all_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,SLC_Z_RPC_MULT);
  -- signal cde_ch_z0_org : b_chamber_z_origin_station_aut :=  (
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,0,SLC_Z_RPC_MULT),
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,1,SLC_Z_RPC_MULT),
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,2,SLC_Z_RPC_MULT),
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,3,SLC_Z_RPC_MULT)
  --   );
  signal cde_z0_ctrl_r : UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY;
  signal cde_z0_mon_r : UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY;
  -- signal cde_z0_ctrl_v  : std_logic_vector(len(cde_z0_ctrl_r) - 1 downto 0);
  -- signal cde_z0_mon_v   : std_logic_vector(len(cde_z0_mon_r) - 1 downto 0);
  -- signal CDE_states : std_logic_vector(1 downto 0);
  --
  -- signal cvp_z0_apb_rd_addr_o    : std_logic_vector(8 - 1 downto 0);
  -- signal cvp_z0_apb_wr_addr_o    : std_logic_vector(8 - 1 downto 0);
  -- signal cvp_z0_apb_wr_data_o       : std_logic_vector(16 - 1 downto 0);
  -- signal cvp_z0_apb_wr_dv_o         : std_logic;
  -- signal cvp_z0_apb_rd_dv_o         : std_logic;
  -- signal cvp_z0_apb_rd_data_i       : std_logic_vector(16 - 1 downto 0);
  -- signal cvp_z0_apb_rd_dv_i         : std_logic;
  signal cvp_ch_z0_org : b_chamber_z_origin_station_aut:=  get_b_all_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,UCM2HPS_VEC_POS_MULT);
  -- signal cvp_ch_z0_org : b_chamber_z_origin_station_aut :=  (
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,0,UCM2HPS_VEC_POS_MULT),
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,1,UCM2HPS_VEC_POS_MULT),
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,2,UCM2HPS_VEC_POS_MULT),
  --   get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,3,UCM2HPS_VEC_POS_MULT)
  --   );
  signal cvp_z0_ctrl_r : UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY;
  signal cvp_z0_mon_r : UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY;
begin

  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);
  
  o_local_en <= local_en;
  o_local_rst <= local_rst;

  local_en <= glob_en and int_en;
  local_rst <= rst or int_rst;

  o_freeze <= i_freeze or int_freeze;

  signaling: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        int_en <= '1';
        int_rst <= rst;
        apb_clk_cnt <= 0;
      else
        --------------------------------------------
        --    AXI CLK CTRL
        --------------------------------------------
        if apb_clk_cnt < apb_clk_lat and axi_cnt_reset = '0' then
          apb_clk_cnt <= apb_clk_cnt + 1;
        else
          apb_clk_cnt <= 0;
          axi_rep_clk <= not axi_rep_clk;
        end if;
        --------------------------------------------
        --    from apb
        --------------------------------------------
        -- if apb_clk_cnt = 0 then
          if ctrl_r.actions.reset = '1' then
            int_rst <= '1';
          else
            int_rst <= '0';
          end if;

          if ctrl_r.actions.enable = '1' then
            int_en <= '1';
          elsif ctrl_r.actions.disable = '1' then
            int_en <= '0';
          end if;
          
          if ctrl_r.actions.freeze = '1' then
            int_freeze <= '1';
          else
            int_freeze <= '0';
          end if;
        -- else
        -- end if;
        --------------------------------------------
        --    to apb
        --------------------------------------------
        mon_r.STATUS.ENABLED <= local_en;
        mon_r.STATUS.READY <= not local_rst;
        mon_r.STATUS.ERROR    <= x"00";
      end if;
    end if;
  end process;

  --------------------------------------------
  --    Chamber phi center
  --------------------------------------------
  PHI_CTRL <= ctrl_r.SECTOR_PHI;
  mon_r.SECTOR_PHI <= PHI_MON;

  PHI_CENTER : process(clk)
  begin
    if rising_edge(clk) then

      if rst = '1' then
        PHI_MON.rd_data <= (others => '0');
      else
        if PHI_CTRL.rd_req = '1' then
          PHI_MON.rd_data <= resize(std_logic_vector(phicenter),integer(PHI_MON.rd_data'length));
        end if;
        if PHI_CTRL.wr_req = '1' then
          phicenter <= unsigned(PHI_CTRL.wr_data(SLC_COMMON_POSPHI_LEN -1 downto 0));
        else
          o_phicenter <= phicenter;
        end if;
      end if;
    end if;
  end process;

  --------------------------------------------
  -- CDE CHAMBER Z0
  --------------------------------------------
  cde_z0_ctrl_r <= ctrl_r.CDE_CHAMB_Z0.CDE_CHAMB_Z0;
  mon_r.CDE_CHAMB_Z0.CDE_CHAMB_Z0 <= cde_z0_mon_r;

  CDE_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    -- signal cde_z0_ctrl_r : UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY;
    -- signal cde_z0_mon_r : UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY;
    signal cde_z0_ctrl_v  : std_logic_vector(UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t'w - 1 downto 0);
    signal cde_z0_mon_v   : std_logic_vector(UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t'w - 1 downto 0);

    signal cde_z0_apb_rd_addr_o    : std_logic_vector(8 - 1 downto 0);
    signal cde_z0_apb_wr_addr_o    : std_logic_vector(8 - 1 downto 0);
    signal cde_z0_apb_wr_data_o       : std_logic_vector(16 - 1 downto 0);
    signal cde_z0_apb_wr_dv_o         : std_logic;
    signal cde_z0_apb_rd_dv_o         : std_logic;
    signal cde_z0_apb_rd_data_i       : std_logic_vector(16 - 1 downto 0);
    signal cde_z0_apb_rd_dv_i         : std_logic;
  begin

    cde_z0_ctrl_v <= convert(cde_z0_ctrl_r(st_i),cde_z0_ctrl_v);
    cde_z0_mon_r(st_i) <= convert(cde_z0_mon_v,cde_z0_mon_r(st_i));

    apb_mem_interface : entity apbus_lib.apb_imem
      generic map(
        g_XML_NODE_NAME         => "MEM_INT_8A16D",
        g_MEMORY_TYPE           => "distributed",
        g_ADDR_WIDTH            => 8,
        g_DATA_WIDTH            => 16
      )
      port map (
        clk           => clk,
        rst           => rst,
        ena           => glob_en,
        --
        ctrl_v        => cde_z0_ctrl_v,
        mon_v         => cde_z0_mon_v,
        --
        -- i_axi_clk     => ,
        -- i_axi_rst     => ,
        --
        -- i_freeze      => i_freeze,
        -- o_freeze      => int_apb_freeze,
        -- o_out_sel     => sel_out_mem,
        -- o_freeze_1    => int_freeze(1),
        --
    
        o_rd_addr     => cde_z0_apb_rd_addr_o,  
        o_wr_addr     => cde_z0_apb_wr_addr_o,  
        o_wr_data     => cde_z0_apb_wr_data_o,   
        o_rd_dv       => cde_z0_apb_rd_dv_o, 
        o_wr_dv       => cde_z0_apb_wr_dv_o,  
        i_rd_data     => cde_z0_apb_rd_data_i,  
        i_rd_dv       => cde_z0_apb_rd_dv_i
    );
    
    CDE_CH_ZO_AXI: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          -- CDE_Z0_MON(st_i).rd_data  <= (others => '0');
          cde_z0_apb_rd_dv_i  <= '0';
        else
          if cde_z0_apb_rd_dv_o  = '1' then
            cde_z0_apb_rd_data_i <=std_logic_vector(resize(cde_ch_z0_org(st_i)(to_integer(unsigned(cde_z0_apb_rd_addr_o))),16));
            cde_z0_apb_rd_dv_i <= '1';
          else
            cde_z0_apb_rd_dv_i <= '0';
          end if;
          if cde_z0_apb_wr_dv_o = '1' then
            cde_ch_z0_org(st_i)(to_integer(unsigned(cde_z0_apb_wr_addr_o))) <=resize(unsigned(cde_z0_apb_wr_data_o),cde_ch_z0_org(st_i)(0)'length);
          else
            o_cde_chamber_z_org_av(st_i) <= convert(cde_ch_z0_org(st_i));
          end if;

        end if;
        
      end if;
    end process;

  end generate;

  -- CDE_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
  --   -- CDE_LOOP_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate 
    -- CDE_CH_ZO_AXI: process(clk)
    -- begin
    --   if rising_edge(clk) then
    --     if rst = '1' then
    --       -- CDE_Z0_MON(st_i).rd_data  <= (others => '0');
    --       cde_z0_apb_rd_dv_i  <= '0';
    --     else
    --       if cde_z0_apb_rd_dv_o  = '1' then
    --         cde_z0_apb_rd_data_i <=std_logic_vector(resize(cde_ch_z0_org(st_i)(to_integer(unsigned(CDE_Z0_CTRL(st_i).rd_addr))),integer(CDE_Z0_MON(st_i).rd_data'length)));
    --         cde_z0_apb_rd_dv_i <= '1';
    --       else
    --         cde_z0_apb_rd_dv_i <= '0';
    --       end if;
    --       if cde_z0_apb_wr_dv_o = '1' then
    --         cde_ch_z0_org(st_i)(to_integer(unsigned(cde_z0_apb_wr_addr_o))) <=resize(unsigned(cde_z0_apb_wr_data_o),cde_ch_z0_org(st_i)(0)'length);
    --       else
    --         o_cde_chamber_z_org_av(st_i) <= convert(cde_ch_z0_org(st_i));
    --       end if;

    --     end if;
        
    --   end if;
    -- end process;

  --   -- end generate;
  -- end generate;

  --------------------------------------------
  -- CVP CHAMBER Z0
  --------------------------------------------
  cvp_z0_ctrl_r <= ctrl_r.CVP_CHAMB_Z0.CVP_CHAMB_Z0;
  mon_r.CVP_CHAMB_Z0.CVP_CHAMB_Z0 <= cvp_z0_mon_r;
  -- cde_z0_ctrl_r <= ctrl_r.CDE_CHAMB_Z0.CDE_CHAMB_Z0;
  -- mon_r.CDE_CHAMB_Z0.CDE_CHAMB_Z0 <= cde_z0_mon_r;

  CVP_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    signal cvp_z0_ctrl_v  : std_logic_vector(UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t'w - 1 downto 0);
    signal cvp_z0_mon_v   : std_logic_vector(UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t'w - 1 downto 0);

    signal cvp_z0_apb_rd_addr_o    : std_logic_vector(8 - 1 downto 0);
    signal cvp_z0_apb_wr_addr_o    : std_logic_vector(8 - 1 downto 0);
    signal cvp_z0_apb_wr_data_o       : std_logic_vector(16 - 1 downto 0);
    signal cvp_z0_apb_wr_dv_o         : std_logic;
    signal cvp_z0_apb_rd_dv_o         : std_logic;
    signal cvp_z0_apb_rd_data_i       : std_logic_vector(16 - 1 downto 0);
    signal cvp_z0_apb_rd_dv_i         : std_logic;
  begin

    cvp_z0_ctrl_v <= convert(cvp_z0_ctrl_r(st_i),cvp_z0_ctrl_v);
    cvp_z0_mon_r(st_i) <= convert(cvp_z0_mon_v,cvp_z0_mon_r(st_i));

    apb_mem_interface : entity apbus_lib.apb_imem
      generic map(
        g_XML_NODE_NAME         => "MEM_INT_8A16D",
        g_MEMORY_TYPE           => "distributed",
        g_ADDR_WIDTH            => 8,
        g_DATA_WIDTH            => 16
      )
      port map (
        clk           => clk,
        rst           => rst,
        ena           => glob_en,
        --
        ctrl_v        => cvp_z0_ctrl_v,
        mon_v         => cvp_z0_mon_v,
        --
        -- i_axi_clk     => ,
        -- i_axi_rst     => ,
        --
        -- i_freeze      => i_freeze,
        -- o_freeze      => int_apb_freeze,
        -- o_out_sel     => sel_out_mem,
        -- o_freeze_1    => int_freeze(1),
        --
    
        o_rd_addr     => cvp_z0_apb_rd_addr_o,  
        o_wr_addr     => cvp_z0_apb_wr_addr_o,  
        o_wr_data     => cvp_z0_apb_wr_data_o,   
        o_rd_dv       => cvp_z0_apb_rd_dv_o, 
        o_wr_dv       => cvp_z0_apb_wr_dv_o,  
        i_rd_data     => cvp_z0_apb_rd_data_i,  
        i_rd_dv       => cvp_z0_apb_rd_dv_i
    );
    
    cvp_CH_ZO_AXI: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          -- cvp_Z0_MON(st_i).rd_data  <= (others => '0');
          cvp_z0_apb_rd_dv_i  <= '0';
        else
          if cvp_z0_apb_rd_dv_o  = '1' then
            cvp_z0_apb_rd_data_i <=std_logic_vector(resize(cvp_ch_z0_org(st_i)(to_integer(unsigned(cvp_z0_apb_rd_addr_o))),16));
            cvp_z0_apb_rd_dv_i <= '1';
          else
            cvp_z0_apb_rd_dv_i <= '0';
          end if;
          if cvp_z0_apb_wr_dv_o = '1' then
            cvp_ch_z0_org(st_i)(to_integer(unsigned(cvp_z0_apb_wr_addr_o))) <=resize(unsigned(cvp_z0_apb_wr_data_o),cvp_ch_z0_org(st_i)(0)'length);
          else
            o_cvp_chamber_z_org_av(st_i) <= convert(cvp_ch_z0_org(st_i));
          end if;

        end if;
        
      end if;
    end process;
  end generate;

  -- CVP_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
  --   -- CVP_LOOP_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate 
  --   CVP_CH_ZO_AXI: process(clk_axi)
  --   begin
  --     if rising_edge(clk_axi) then
  --       if axi_rst = '1' then
  --         CVP_Z0_MON(st_i).rd_data  <= (others => '0');
  --         CVP_Z0_MON(st_i).rd_rdy   <= '1';
  --       else
  --         if CVP_Z0_CTRL(st_i).rd_req then
  --           CVP_Z0_MON(st_i).rd_data <=std_logic_vector(resize(cvp_ch_z0_org(st_i)(to_integer(unsigned(CVP_Z0_CTRL(st_i).rd_addr))),integer(CVP_Z0_MON(st_i).rd_data'length)));
  --           CVP_Z0_MON(st_i).rd_rdy <= '1';
  --         else
  --           CVP_Z0_MON(st_i).rd_rdy <= '0';
  --         end if;
  --         if CVP_Z0_CTRL(st_i).wr_req then
  --           cvp_ch_z0_org(st_i)(to_integer(unsigned(CVP_Z0_CTRL(st_i).wr_addr))) <=resize(unsigned(CVP_Z0_CTRL(st_i).wr_data),cvp_ch_z0_org(st_i)(0)'length);
  --         end if;
  --       end if;
  --       o_cvp_chamber_z_org_av(st_i) <= convert(cvp_ch_z0_org(st_i));
  --     end if;
  --   end process;
  -- end generate;
  
end architecture beh;