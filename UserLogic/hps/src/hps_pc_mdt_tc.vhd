--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS mdt parameters calculation
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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library apbus_lib;

entity hps_pc_mdt_tc is
  generic(
    g_STATION_RADIUS : integer := 0
  );
  port (
    clk         : in std_logic;
    rst         : in std_logic;
    glob_en     : in std_logic;
    --
    ctrl        : in std_logic;  
    mon         : out std_logic;  
    --
    i_layer     : in unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    i_tube      : in unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    --
    o_global_x  : out unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    o_global_z  : out unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    o_dv        : out std_logic
  );
end entity hps_pc_mdt_tc;

architecture beh of hps_pc_mdt_tc is
  
begin

  apb_mem_interface : entity apbus_lib.apb_mem_int
  generic map(
    g_XML_NODE_NAME         => "MEM_INT_9A19D",
    g_INTERNAL_CLK          => '1'
    -- g_ADDR_WIDTH            => ADDR_WIDTH,
    -- g_DATA_WIDTH            => DATA_WIDTH,
    -- g_CTRL_TYPE             => MEM_INT_12A148D_CTRL_t; 
    -- g_MON_TYPE              => MEM_INT_12A148D_MON_t;   
    -- g_APBUS_CTRL_WIDTH      => g_APBUS_CTRL_WIDTH,
    -- g_APBUS_MON_WIDTH       => g_APBUS_MON_WIDTH
  )
  port map (
    clk           => clk,
    rst           => rst,
    ena           => ena,
    --
    ctrl          => ctrl,
    mon           => mon,
    --
    -- i_axi_clk     => ,
    -- i_axi_rst     => ,
    --
    -- i_freeze      => i_freeze,
    -- o_freeze      => int_apb_freeze,
    -- o_out_sel     => sel_out_mem,
    -- o_freeze_1    => int_freeze(1),
    --
    o_rd_addr     => apb_rd_addr_o,  
    o_wr_addr     => apb_wr_addr_o,  
    o_data        => apb_data_o,   
    o_dv          => apb_dv_o, 
    i_data        => apb_data_i,  
    i_dv          => apb_dv_i
  );  
  
  
  
end architecture beh;