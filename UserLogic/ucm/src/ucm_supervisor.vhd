--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: UCM general supervisor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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
use shared_lib.barrel_chamb_z2origin_pkg.all;

use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

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
    o_cde_chamber_z_org_bus : out b_chamber_z_origin_station_avt;
    o_cvp_chamber_z_org_bus : out b_chamber_z_origin_station_avt;
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
  
  --
  signal cde_ch_z0_org : b_chamber_z_origin_station_aut :=  (
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,0,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,1,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,2,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,3,SLC_Z_RPC_MULT)
    );
  signal CDE_Z0_CTRL : UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY;
  signal CDE_Z0_MON : UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY;
  signal CDE_states : std_logic_vector(1 downto 0);
  --
  signal cvp_ch_z0_org : b_chamber_z_origin_station_aut :=  (
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,0,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,1,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,2,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,3,UCM2HPS_VEC_POS_MULT)
    );
  signal CVP_Z0_CTRL : UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY;
  signal CVP_Z0_MON : UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY;
begin

  ctrl_r <= structify(ctrl_v,ctrl_r);
  mon_v <= vectorify(mon_r,mon_v);
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
          else--if ctrl_r.actions.disable = '1' then
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

  -- PHI_CENTER : process(clk_axi)
  -- begin
  --   if rising_edge(clk_axi) then
  --     o_phicenter <= phicenter;

  --     if axi_rst = '1' then
  --       PHI_MON.rd_data <= (others => '0');
  --     else
  --       if PHI_CTRL.rd_req = '1' then
  --         PHI_MON.rd_data <= resize(std_logic_vector(phicenter),integer(PHI_MON.rd_data'length));
  --       end if;
  --       if PHI_CTRL.wr_req = '1' then
  --         phicenter <= unsigned(PHI_CTRL.wr_data(SLC_COMMON_POSPHI_LEN -1 downto 0));
  --       end if;
  --     end if;
  --   end if;
  -- end process;

  --------------------------------------------
  -- CDE CHAMBER Z0
  --------------------------------------------
  CDE_Z0_CTRL <= ctrl_r.CDE_CHAMB_Z0.CDE_CHAMB_Z0;
  mon_r.CDE_CHAMB_Z0.CDE_CHAMB_Z0 <= CDE_Z0_MON;

  -- CDE_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
  --   -- CDE_LOOP_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate 
  --   CDE_CH_ZO_AXI: process(clk_axi)
  --   begin
  --     if rising_edge(clk_axi) then
  --       if axi_rst = '1' then
  --         CDE_Z0_MON(st_i).rd_data  <= (others => '0');
  --         CDE_Z0_MON(st_i).rd_rdy <= '0';
  --       else
  --         if CDE_Z0_CTRL(st_i).rd_req then
  --           CDE_Z0_MON(st_i).rd_data <=std_logic_vector(resize(cde_ch_z0_org(st_i)(to_integer(unsigned(CDE_Z0_CTRL(st_i).rd_addr))),integer(CDE_Z0_MON(st_i).rd_data'length)));
  --           CDE_Z0_MON(st_i).rd_rdy <= '1';
  --         else
  --           CDE_Z0_MON(st_i).rd_rdy <= '0';
  --         end if;
  --         if CDE_Z0_CTRL(st_i).wr_req then
  --           cde_ch_z0_org(st_i)(to_integer(unsigned(CDE_Z0_CTRL(st_i).wr_addr))) <=resize(unsigned(CDE_Z0_CTRL(st_i).wr_data),cde_ch_z0_org(st_i)(0)'length);
  --         end if;

  --       end if;
  --       o_cde_chamber_z_org_bus(st_i) <= vectorify(cde_ch_z0_org(st_i));
  --     end if;
  --   end process;

  --   -- end generate;
  -- end generate;

  --------------------------------------------
  -- CVP CHAMBER Z0
  --------------------------------------------
  CVP_Z0_CTRL <= ctrl_r.CVP_CHAMB_Z0.CVP_CHAMB_Z0;
  mon_r.CVP_CHAMB_Z0.CVP_CHAMB_Z0 <= CVP_Z0_MON;

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
  --       o_cvp_chamber_z_org_bus(st_i) <= vectorify(cvp_ch_z0_org(st_i));
  --     end if;
  --   end process;
  -- end generate;
  
end architecture beh;