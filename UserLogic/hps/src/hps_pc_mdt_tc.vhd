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

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;
library apbus_lib;

entity hps_pc_mdt_tc is
  generic(
    g_STATION_RADIUS : integer := 0
  );
  port (
    clk         : in std_logic;
    rst         : in std_logic;
    ena         : in std_logic;
    --
    ctrl        : in H2S_HPS_MDT_TC_MDT_TC_CTRL_t; 
    mon         : out H2S_HPS_MDT_TC_MDT_TC_MON_t;
    --
    i_layer     : in unsigned(TAR2HPS_LAYER_LEN-1 downto 0); -- 5
    i_tube      : in unsigned(TAR2HPS_TUBE_LEN-1 downto 0); -- 9
    --
    o_global_x  : out unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    o_global_z  : out unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    o_dv        : out std_logic
  );
end entity hps_pc_mdt_tc;

architecture beh of hps_pc_mdt_tc is
  
  -- signal ctrl_v : std_logic_vector(len(ctrl) - 1  downto 0);
  -- signal mon_v : std_logic_vector(len(mon) - 1  downto 0);

  -- constant ADDR_WIDTH : integer := 9;
  -- constant DATA_WIDTH : integer := 19;

  -- type tcLUT_chamber_avt is array (0 to 300) of unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);

  -- -- function init_TC_MEM(r , s : integer)return tcLUT_chamber_avt is
  -- --   variable y : tcLUT_chamber_avt;
  -- -- begin
  -- --   for i in 0 to 7 loop
  -- --     if r = 0 then
  -- --       y(i) := to_unsigned(c_BI_tc(s)(i),MDT_TIME_LEN);
  -- --     elsif r = 1 then
  -- --       y(i) := to_unsigned(c_BM_tc(s)(i),MDT_TIME_LEN);
  -- --     elsif r = 2 then
  -- --       y(i) := to_unsigned(c_BO_tc(s)(i),MDT_TIME_LEN);
  -- --     -- else
  
  -- --     end if;
  -- --   end loop;
  -- --   return y;
  -- -- end function;

  -- signal mem_x : tcLUT_chamber_avt := init_TC_MEM(g_STATION_RADIUS,c_SECTOR_ID);
  -- signal mem_z : tcLUT_chamber_avt := init_TC_MEM(g_STATION_RADIUS,c_SECTOR_ID);

  -- signal apb_rd_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  -- signal apb_wr_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  -- signal apb_data_o       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  -- signal apb_dv_o         : std_logic;
  -- signal apb_data_i       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  -- signal apb_dv_i         : std_logic;

begin

  -- ctrl_v <= vectorify(ctrl,ctrl_v);
  -- mon <= structify(mon_v,mon);

  -- apb_mem_interface : entity apbus_lib.apb_mem_int
  -- generic map(
  --   g_XML_NODE_NAME         => "MEM_INT_9A19D",
  --   g_INTERNAL_CLK          => '1',
  --   g_ADDR_WIDTH            => ADDR_WIDTH,
  --   g_DATA_WIDTH            => DATA_WIDTH,
  --   g_APBUS_CTRL_WIDTH      => ctrl_v'length,
  --   g_APBUS_MON_WIDTH       => mon_v'length
  -- )
  -- port map (
  --   clk           => clk,
  --   rst           => rst,
  --   ena           => ena,
  --   --
  --   ctrl          => ctrl_v,
  --   mon           => mon_v,
  --   --
  --   -- i_axi_clk     => ,
  --   -- i_axi_rst     => ,
  --   --
  --   -- i_freeze      => i_freeze,
  --   -- o_freeze      => int_apb_freeze,
  --   -- o_out_sel     => sel_out_mem,
  --   -- o_freeze_1    => int_freeze(1),
  --   --
  --   o_rd_addr     => apb_rd_addr_o,  
  --   o_wr_addr     => apb_wr_addr_o,  
  --   o_data        => apb_data_o,   
  --   o_dv          => apb_dv_o, 
  --   i_data        => apb_data_i,  
  --   i_dv          => apb_dv_i
  -- );  

  -- DT2R : process(clk)

  -- begin
  --   if rising_edge(clk) then
  --     if rst= '1' then
  --       o_time_tc <= (others => '0');
  --       o_dv <= '0';
  --     else
  --       if(i_dv = '1') then
  --         o_global_x <= mem_x(to_integer(i_chamber));
  --         o_global_z <= mem_z(to_integer(i_chamber));
  --         o_dv <= '1';
  --       else
  --         o_time_tc <= (others => '0');
  --         o_dv <= '0';
  --       end if;
  --       if apb_dv_o = '1' then
  --         apb_data_i <= mem(to_integer(unsigned(apb_rd_addr_o)));
  --         mem(to_integer(unsigned(apb_rd_addr_o))) <= apb_data_o;
  --         apb_dv_i <= '1';
  --       else
  --         apb_dv_i <= '0';
  --       end if;
  --     end if;
  --   end if ;
  -- end process;

  
end architecture beh;