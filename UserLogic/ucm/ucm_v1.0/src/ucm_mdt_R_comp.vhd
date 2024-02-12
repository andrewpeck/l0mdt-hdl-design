--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Phi radius extractor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

use shared_lib.fct_barrel_r_mdt_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_mdt_R_comp is
  generic(
    g_STATION_RADIUS      : integer := 0; 
    g_STATION_LAYER       : integer := 0; -- only for RPC
    g_OUTPUT_WIDTH        : integer --:= UCM_Z_ROI_LEN
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    ctrl_v        : in std_logic_vector;
    mon_v         : out std_logic_vector;
    --
    i_phimod      : in std_logic_vector(UCM_CDE2CVP_PHIMOD_LEN - 1 downto 0);
    i_dv          : in std_logic;
    --
    o_radius      : out std_logic_vector(g_OUTPUT_WIDTH - 1 downto 0);
    o_dv          : out std_logic
  );
end entity ucm_mdt_R_comp;

architecture beh of ucm_mdt_R_comp is

  signal ctrl_r : UCM_R_PHI_COMP_MDT_CTRL_t;
  signal mon_r  : UCM_R_PHI_COMP_MDT_MON_t; 

  --signal rad_mem : barrel_R_mdt_avt := get_barrel_R_mdt(c_SECTOR_ID,c_SECTOR_SIDE,g_STATION_RADIUS,g_STATION_LAYER,SLC_Z_RPC_MULT,UCM_Z_ROI_LEN,32);
  signal rad_mem : barrel_R_mdt_avt := get_barrel_R_mdt(c_SECTOR_ID,c_SECTOR_SIDE,g_STATION_RADIUS,g_STATION_LAYER,1.0,g_OUTPUT_WIDTH,32);

begin

  mon_v <= convert(mon_r,mon_v);
  ctrl_r <= convert(ctrl_v,ctrl_r);

  process(clk) begin
    if rising_edge(clk) then
      if rst = '1' then
        mon_r  <= zero(mon_r);
        o_dv <= '0';
        o_radius <= (others => '0');
      else
        if ena = '1' then
          if ctrl_r.ext_ctrl = '0' then
            if i_dv  = '1' then
              o_radius <= rad_mem(to_integer(unsigned(i_phimod)));
              o_dv <= '1';
            else
              o_radius <= (others => '0');
              o_dv <= '0';
            end if;
          else
            if to_integer(unsigned(ctrl_r.sel_station)) = g_STATION_RADIUS then
              if to_integer(unsigned(ctrl_r.sel_layer)) = g_STATION_LAYER then
                if ctrl_r.MEM_INTERFACE.rd_req = '1' then
                  mon_r.MEM_INTERFACE.rd_data <= rad_mem(to_integer(unsigned(ctrl_r.MEM_INTERFACE.rd_addr)));
                else
                  mon_r.MEM_INTERFACE.rd_data <= (others => '0');
                end if;
                if ctrl_r.MEM_INTERFACE.wr_req = '1' then
                  rad_mem(to_integer(unsigned(ctrl_r.MEM_INTERFACE.wr_addr))) <= ctrl_r.MEM_INTERFACE.wr_data;
                end if;
              end if;
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture beh;