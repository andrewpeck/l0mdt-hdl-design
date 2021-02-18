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
    ctrl                : in  UCM_CTRL_t;
    mon                 : out UCM_MON_t;
    --
    phicenter             : out unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    cde_chamber_z_org_bus : out b_chamber_z_origin_station_avt;
    cvp_chamber_z_org_bus : out b_chamber_z_origin_station_avt;
    --
    local_en            : out std_logic;
    local_rst           : out std_logic


  );
end entity ucm_supervisor;

architecture beh of ucm_supervisor is
  signal int_en   : std_logic;
  signal int_rst  : std_logic;
  --
  signal cde_ch_z0_org : b_chamber_z_origin_station_aut :=  (
    get_b_chamber_origin_z_u(c_SECTOR_ID,0,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,1,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,2,SLC_Z_RPC_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,3,SLC_Z_RPC_MULT)
    );
  signal CDE_CH_Z0_WR : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY;
  signal CDE_CH_Z0_RD : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY;
  --
  signal cvp_ch_z0_org : b_chamber_z_origin_station_aut :=  (
    get_b_chamber_origin_z_u(c_SECTOR_ID,0,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,1,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,2,UCM2HPS_VEC_POS_MULT),
    get_b_chamber_origin_z_u(c_SECTOR_ID,3,UCM2HPS_VEC_POS_MULT)
    );
  signal CVP_CH_Z0_WR : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY;
  signal CVP_CH_Z0_RD : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY;
begin
  --------------------------------------------
  --    SIGNALING
  --------------------------------------------
  local_en <= glob_en and int_en;
  local_rst <= rst and int_rst;

  signaling: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        int_en <= glob_en;
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
  --    FLAGS
  --------------------------------------------


  --------------------------------------------
  --    Chamber phi center
  --------------------------------------------
  OVERRIDES : process(clk)
  begin
    if rising_edge(clk) then
      if SECTOR_PHI.OVERRIDE = '1' then
        phicenter <= unsigned(SECTOR_PHI.VALUE(SLC_COMMON_POSPHI_LEN -1 downto 0));
      else
        phicenter <= phicenter_Default;
      end if;
    end if;
  end process;

  --------------------------------------------
  -- CDE CHAMBER Z0
  --------------------------------------------
  CDE_CH_Z0_WR <= ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0;--(0).WR;
  mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0 <= CDE_CH_Z0_RD;

  CDE_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    -- CDE_LOOP_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate 
    CDE_CH_ZO_AXI: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          CDE_CH_Z0_RD(st_i).RD.RST_REQ <= '0';
        else
          if CDE_CH_Z0_WR(st_i).WR.ADDR = x"00" then
          else
            CDE_CH_Z0_RD(st_i).RD.VALUE <=std_logic_vector(resize(cde_ch_z0_org(st_i)(to_integer(unsigned(CDE_CH_Z0_WR(st_i).WR.ADDR))),16));
            if CDE_CH_Z0_WR(st_i).WR.WR_EN = '1' then
              CDE_CH_Z0_RD(st_i).RD.RST_REQ <= '1';
              cde_ch_z0_org(st_i)(to_integer(unsigned(CDE_CH_Z0_WR(st_i).WR.ADDR))) <= resize(unsigned(CDE_CH_Z0_WR(st_i).WR.VALUE),cde_ch_z0_org(st_i)(0)'length);
            end if;
          end if;
          
        end if;
        cde_chamber_z_org_bus(st_i) <= vectorify(cde_ch_z0_org(st_i));
      end if;
    end process;

    -- end generate;
  end generate;

  --------------------------------------------
  -- CVP CHAMBER Z0
  --------------------------------------------
  CVP_CH_Z0_WR <= ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0;--(0).WR;
  mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0 <= CVP_CH_Z0_RD;

  CVP_LOOP : for st_i in 0 to c_MAX_POSSIBLE_HPS -1 generate
    -- CVP_LOOP_IF : if c_STATIONS_IN_SECTOR(st_i) = '1' generate 
    CVP_CH_ZO_AXI: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          CVP_CH_Z0_RD(st_i).RD.RST_REQ <= '0';
        else
          if CVP_CH_Z0_WR(st_i).WR.ADDR = x"00" then
          else
            CVP_CH_Z0_RD(st_i).RD.VALUE <=std_logic_vector(resize(cvp_ch_z0_org(st_i)(to_integer(unsigned(CVP_CH_Z0_WR(st_i).WR.ADDR))),16));
            if CVP_CH_Z0_WR(st_i).WR.WR_EN = '1' then
              CVP_CH_Z0_RD(st_i).RD.RST_REQ <= '1';
              cvp_ch_z0_org(st_i)(to_integer(unsigned(CVP_CH_Z0_WR(st_i).WR.ADDR))) <= resize(unsigned(CVP_CH_Z0_WR(st_i).WR.VALUE),cvp_ch_z0_org(st_i)(0)'length);
            end if;
          end if;
          
        end if;
        cvp_chamber_z_org_bus(st_i) <= vectorify(cvp_ch_z0_org(st_i));
      end if;
    end process;

    -- end generate;
  end generate;
  
  
end architecture beh;