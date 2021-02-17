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
    chamber_z_org_bus   : out b_chamber_z_origin_station_avt;
    --
    local_en            : out std_logic;
    local_rst           : out std_logic


  );
end entity ucm_supervisor;

architecture beh of ucm_supervisor is
  signal int_en   : std_logic;
  signal int_rst  : std_logic;
  --
  signal cde_ch_z0_org : b_chamber_z_origin_aut :=  get_b_chamber_origin_z_u(c_SECTOR_ID,0,SLC_Z_RPC_MULT);
  signal CDE_CH_Z0_WR : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_WR_CTRL_t;
  signal CDE_CH_Z0_RD : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_RD_MON_t;
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
  -- CDE CHAMBER Z0
  --------------------------------------------
  CDE_CH_Z0_WR <= ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).WR;
  mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).RD <= CDE_CH_Z0_RD;

  CDE_CH_ZO_AXI: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        CDE_CH_Z0_RD.RST_REQ <= '0';
      else
        if CDE_CH_Z0_WR.ADDR = x"00" then
        else
          CDE_CH_Z0_RD.VALUE <=std_logic_vector(resize(cde_ch_z0_org(to_integer(unsigned(CDE_CH_Z0_WR.ADDR))),16));
          if CDE_CH_Z0_WR.WR_EN = '1' then
            CDE_CH_Z0_RD.RST_REQ <= '1';
            cde_ch_z0_org(to_integer(unsigned(CDE_CH_Z0_WR.ADDR))) <= resize(unsigned(CDE_CH_Z0_WR.VALUE),cde_ch_z0_org(0)'length);
          end if;
        end if;
        
      end if;
      chamber_z_org_bus(0) <= vectorify(cde_ch_z0_org);
    end if;
  end process;
  
  
end architecture beh;