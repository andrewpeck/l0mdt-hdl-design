--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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
    ctrl_v              : in  std_logic_vector;--UCM_CTRL_t;
    mon_v               : out std_logic_vector;--UCM_MON_t;
    --
    o_phicenter             : out unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    o_cde_chamber_z_org_bus : out b_chamber_z_origin_station_avt;
    o_cvp_chamber_z_org_bus : out b_chamber_z_origin_station_avt;
    --
    local_en            : out std_logic;
    local_rst           : out std_logic


  );
end entity ucm_supervisor;

architecture beh of ucm_supervisor is

  signal ctrl        : UCM_CTRL_t;
  signal mon         : UCM_MON_t;

  signal axi_rst      : std_logic;
  signal clk_axi      : std_logic;
  -- signal clk_axi_cnt  : integer;
  
  --
  signal int_en   : std_logic;
  signal int_rst  : std_logic := '1';
  --
  signal phicenter  : unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0) := get_sector_phi_center(c_SECTOR_ID);
  signal PHI_CTRL     : UCM_SECTOR_PHI_CTRL_t;
  signal PHI_MON     : UCM_SECTOR_PHI_MON_t;
  --
  
  --
  signal cde_ch_z0_org : b_chamber_z_origin_station_aut :=  (
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,0,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,1,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,2,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,3,SLC_Z_RPC_MULT)
    );
  signal CDE_Z0_CTRL : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY;
  signal CDE_Z0_MON : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY;
  signal CDE_states : std_logic_vector(1 downto 0);
  --
  signal cvp_ch_z0_org : b_chamber_z_origin_station_aut :=  (
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,0,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,1,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,2,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,c_SECTOR_SIDE,3,UCM2HPS_VEC_POS_MULT)
    );
  signal CVP_Z0_CTRL : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY;
  signal CVP_Z0_MON : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY;
begin

  ctrl <= structify(ctrl_v,ctrl);
  mon_v <= vectorify(mon,mon_v);

  --------------------------------------------
  --    AXI CLK
  --------------------------------------------
  APB_MS : entity apbus_lib.apbus_main_sig
  port map(
    clk           => clk,
    rst           => rst,
    ena           => glob_en,
    --
    o_axi_clk     => clk_axi,
    o_axi_rst     => axi_rst
  );

  --------------------------------------------
  --    SIGNALING
  --------------------------------------------
  local_en <= glob_en and int_en;
  local_rst <= rst or int_rst;

  signaling: process(clk_axi)
  begin
    if rising_edge(clk_axi) then
      if axi_rst = '1' then
        int_en <= '1';
        int_rst <= rst;
      else
        if ctrl.actions.reset = '1' then
          int_rst <= '1';
        else
          int_rst <= '0';
        end if;
        if ctrl.actions.enable = '1' then
          int_en <= '1';
        elsif ctrl.actions.disable = '1' then
          int_en <= '0';
        end if;
      end if;
    end if;
  end process signaling;
  --------------------------------------------
  --    status
  --------------------------------------------
  status: process(clk_axi)
  begin
    if rising_edge(clk_axi) then
      if axi_rst = '1' then

      else
        mon.STATUS.ENABLED  <= b"0000000" & local_en;
        mon.STATUS.READY    <= b"0000000" & local_rst;
        mon.STATUS.ERROR    <= x"00";
      end if;
    end if;
  end process status;

  --------------------------------------------
  --    Chamber phi center
  --------------------------------------------
  PHI_CTRL <= ctrl.SECTOR_PHI;
  mon.SECTOR_PHI <= PHI_MON;

  PHI_CENTER : process(clk_axi)
  begin
    if rising_edge(clk_axi) then
      o_phicenter <= phicenter;

      if axi_rst = '1' then

      else
        if PHI_CTRL.rd_req = '1' then
          PHI_MON.rd_data <= resize(std_logic_vector(phicenter),integer(PHI_MON.rd_data'length));
        end if;
        if PHI_CTRL.wr_req = '1' then
          phicenter <= unsigned(PHI_CTRL.wr_data(SLC_COMMON_POSPHI_LEN -1 downto 0));
        end if;
      end if;
    end if;
  end process;

  --------------------------------------------
  -- CDE CHAMBER Z0
  --------------------------------------------
  CDE_Z0_CTRL <= ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0;
  mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0 <= CDE_Z0_MON;

  CDE_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    -- CDE_LOOP_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate 
    CDE_CH_ZO_AXI: process(clk_axi)
    begin
      if rising_edge(clk_axi) then
        if axi_rst = '1' then
          -- CDE_Z0_MON(st_i).RD.RST_REQ <= '0';
        else
          if CDE_Z0_CTRL(st_i).rd_req then
            CDE_Z0_MON(st_i).rd_data <=std_logic_vector(resize(cde_ch_z0_org(st_i)(to_integer(unsigned(CDE_Z0_CTRL(st_i).rd_addr))),integer(CDE_Z0_MON(st_i).rd_data'length)));
            CDE_Z0_MON(st_i).rd_rdy <= '1';
          else
            CDE_Z0_MON(st_i).rd_rdy <= '0';
          end if;
          if CDE_Z0_CTRL(st_i).wr_req then
            cde_ch_z0_org(st_i)(to_integer(unsigned(CDE_Z0_CTRL(st_i).wr_addr))) <=resize(unsigned(CDE_Z0_CTRL(st_i).wr_data),cde_ch_z0_org(st_i)(0)'length);
          end if;

        end if;
        o_cde_chamber_z_org_bus(st_i) <= vectorify(cde_ch_z0_org(st_i));
      end if;
    end process;

    -- end generate;
  end generate;

  --------------------------------------------
  -- CVP CHAMBER Z0
  --------------------------------------------
  CVP_Z0_CTRL <= ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0;
  mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0 <= CVP_Z0_MON;

  CVP_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    -- CVP_LOOP_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate 
    CVP_CH_ZO_AXI: process(clk_axi)
    begin
      if rising_edge(clk_axi) then
        if axi_rst = '1' then
          -- CVP_Z0_MON(st_i).RD.RST_REQ <= '0';
        else
          if CVP_Z0_CTRL(st_i).rd_req then
            CVP_Z0_MON(st_i).rd_data <=std_logic_vector(resize(cvp_ch_z0_org(st_i)(to_integer(unsigned(CVP_Z0_CTRL(st_i).rd_addr))),integer(CVP_Z0_MON(st_i).rd_data'length)));
            CVP_Z0_MON(st_i).rd_rdy <= '1';
          else
            CVP_Z0_MON(st_i).rd_rdy <= '0';
          end if;
          if CVP_Z0_CTRL(st_i).wr_req then
            cvp_ch_z0_org(st_i)(to_integer(unsigned(CVP_Z0_CTRL(st_i).wr_addr))) <=resize(unsigned(CVP_Z0_CTRL(st_i).wr_data),cvp_ch_z0_org(st_i)(0)'length);
          end if;
        end if;
        o_cvp_chamber_z_org_bus(st_i) <= vectorify(cvp_ch_z0_org(st_i));
      end if;
    end process;
  end generate;
  
end architecture beh;