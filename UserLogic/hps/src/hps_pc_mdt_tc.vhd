--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

use shared_lib.tdc_mezz_mapping_pkg.all;
use shared_lib.TC_B3A_pkg.all;

-- use shared_lib.vhdl_tb_utils_pkg.all;

-- library project_lib;
-- use project_lib.vhdl_tb_utils_pkg.all;
-- library hp_lib;
-- use hp_lib.hp_pkg.all;
-- library heg_lib;
-- use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library apbus_lib;

entity hps_pc_mdt_tc is
  generic(
    g_CHAMBER         : integer := 0;
    g_STATION_RADIUS  : integer := 0
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    ena               : in std_logic;
    --
    ctrl_v            : in std_logic_vector;  -- HPS_MDT_TC_MDT_TC_CTRL_t;
    mon_v             : out std_logic_vector; -- HPS_MDT_TC_MDT_TC_MON_t;
    --
    i_layer           : in unsigned(TAR2HPS_LAYER_LEN-1 downto 0);  -- 5
    i_tube            : in unsigned(TAR2HPS_TUBE_LEN-1 downto 0);   -- 9
    i_dv              : in std_logic;
    --
    o_global_x        : out unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    o_global_z        : out unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    o_dv              : out std_logic
  );
end entity hps_pc_mdt_tc;

architecture beh of hps_pc_mdt_tc is
  
  -- signal ctrl_v : std_logic_vector(len(ctrl) - 1  downto 0);
  -- signal mon_v : std_logic_vector(len(mon) - 1  downto 0);
  constant ADDR_WIDTH : integer := 10;
  constant DATA_WIDTH : integer := 38;

  constant num_tubes_layer_chamber : integer := get_num_tubes_layer_chamber(g_STATION_RADIUS,g_CHAMBER);
  constant csm_offset_mem : integer := get_csm_accumulated_tubes(g_STATION_RADIUS)(g_CHAMBER);

  type tcLUT_chamber_avt is array (0 to 1023) of std_logic_vector((MDT_GLOBAL_AXI_LEN*2)-1 downto 0);

  impure function init_TC_MEM(s , r , c , tube_o , tube_n: integer)return tcLUT_chamber_avt is
    variable y : tcLUT_chamber_avt;
    variable index : unsigned(9 downto 0);
    variable value : std_logic_vector(37 downto 0);
  begin
    -- puts("s : ",s);
    -- puts("r : ",r);
    -- puts("c : ",c);
    -- puts("to : " ,tube_o);
    -- puts("tn : " , tube_n);

    for it in 0 to tube_n - 1 loop
      if r = 0 then
        for il in 0 to 7 loop
          index := to_unsigned(il,3)  & to_unsigned(it,7) ;
          value := std_logic_vector(to_unsigned(integer(tube_coordinates_inn(tube_o + it)(il)(0)*MDT_GLOBAL_AXI_MULT),19)) &
          std_logic_vector(to_unsigned(integer(tube_coordinates_inn(tube_o + it)(il)(1)*MDT_GLOBAL_AXI_MULT),19));
          y(to_integer(index)) := value;
          -- y(to_integer(index)) := std_logic_vector(to_unsigned(to_integer(index),38));
        end loop;
      elsif r = 1 then
        for il in 0 to 5 loop
          index := to_unsigned(il,3)  & to_unsigned(it,7) ;
          value := std_logic_vector(to_unsigned(integer(tube_coordinates_mid(tube_o + it)(il)(0)*MDT_GLOBAL_AXI_MULT),19)) &
          std_logic_vector(to_unsigned(integer(tube_coordinates_mid(tube_o + it)(il)(1)*MDT_GLOBAL_AXI_MULT),19));
          y(to_integer(index)) := value;
        end loop;
      elsif r = 2 then
        for il in 0 to 5 loop
          index := to_unsigned(il,3)  & to_unsigned(it,7) ;
          value := std_logic_vector(to_unsigned(integer(tube_coordinates_out(tube_o + it)(il)(0)*MDT_GLOBAL_AXI_MULT),19)) &
          std_logic_vector(to_unsigned(integer(tube_coordinates_out(tube_o + it)(il)(1)*MDT_GLOBAL_AXI_MULT),19));
          y(to_integer(index)) := value;
        end loop;
      end if;
    end loop;
    return y;
  end function;

  signal mem : tcLUT_chamber_avt := init_TC_MEM(c_SECTOR_ID,g_STATION_RADIUS,g_CHAMBER,csm_offset_mem,num_tubes_layer_chamber);

  signal local_layer : unsigned(TAR2HPS_LAYER_LEN-1 downto 0); 
  signal local_tube : std_logic_vector(9 downto 0);
  signal local_tube_dv :std_logic;
  signal mem_index_std : std_logic_vector(9 downto 0);
  signal mem_index_int : integer range 0 to 1023;

  signal mem_out : std_logic_vector((MDT_GLOBAL_AXI_LEN*2)-1 downto 0);

  
  -- APB signals
  signal apb_rd_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_wr_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_wr_data_o       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_wr_dv_o         : std_logic;
  signal apb_rd_dv_o         : std_logic;
  signal apb_rd_data_i       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_rd_dv_i         : std_logic;

begin

  -- ctrl_v <= vectorify(ctrl,ctrl_v);
  -- mon <= structify(mon_v,mon);

  
  apb_mem_interface : entity apbus_lib.apb_imem
    generic map(
      g_XML_NODE_NAME         => "MEM_INT_10A38D",
      g_MEMORY_TYPE           => "distributed",
      g_ADDR_WIDTH            => ADDR_WIDTH,
      g_DATA_WIDTH            => DATA_WIDTH
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
      ctrl_v        => ctrl_v,
      mon_v         => mon_v,
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
      o_wr_data     => apb_wr_data_o,   
      o_rd_dv       => apb_rd_dv_o, 
      o_wr_dv       => apb_wr_dv_o,  
      i_rd_data     => apb_rd_data_i,  
      i_rd_dv       => apb_rd_dv_i
    );

  -- local_tube <= std_logic_vector(to_unsigned(to_integer(i_tube) - csm_offset_mem,7));
  mem_index_std <= std_logic_vector(local_layer(2 downto 0)) & local_tube(6 downto 0);
  -- mem_index_std(9 downto 7) <= std_logic_vector(i_layer(2 downto 0));
  -- mem_index_std(6 downto 0) <= local_tube(6 downto 0);
  mem_index_int <= to_integer(unsigned(mem_index_std));


  DT2R : process(clk)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        -- o_time_tc <= (others => '0');
        o_dv <= '0';
        mem_out <= (others => '0');
        apb_rd_dv_i <= '0';
        apb_rd_data_i <= (others => '0');
      else
        local_tube_dv <= i_dv;

        if apb_wr_dv_o = '1' or apb_rd_dv_o = '1' then
          if apb_wr_dv_o = '1' then
            -- apb_data_i <= mem(to_integer(unsigned(apb_rd_addr_o)));
            mem(to_integer(unsigned(apb_wr_addr_o))) <= apb_wr_data_o;
            -- apb_dv_i <= '1';
          else
            -- apb_dv_i <= '0';
          end if;
  
          if apb_rd_dv_o = '1' then
            apb_rd_data_i <= mem(to_integer(unsigned(apb_rd_addr_o)));
            -- mem(to_integer(unsigned(apb_rd_addr_o))) <= apb_data_o;
            apb_rd_dv_i <= '1';
          else
            apb_rd_dv_i <= '0';
          end if;
        else
          if i_dv = '1' then
            -- local_tube <= std_logic_vector(to_unsigned(to_integer(i_tube) - csm_offset_mem,7));
            local_tube <= std_logic_vector(resize(i_tube,10) - to_unsigned(csm_offset_mem,10));
            local_layer <= i_layer;
          else
            local_tube <= (others => '0');
            local_layer <= (others => '0');
          end if;
          if(local_tube_dv = '1') then
            mem_out <= mem(mem_index_int);--to_integer(unsigned('0' & mem_index_std)));
            o_dv <= '1';
          else
            mem_out <= (others => '0');
            o_dv <= '0';
          end if;
        end if;




        


        -- if(local_tube_dv = '1') then
        --   mem_out <= mem(mem_index_int);--to_integer(unsigned('0' & mem_index_std)));
        --   o_dv <= '1';
        -- else
        --   mem_out <= (others => '0');
        --   o_dv <= '0';
        -- end if;
        
        -- if apb_dv_o = '1' then
        --   apb_rd_data_i <= mem(to_integer(unsigned(apb_rd_addr_o)));
        --   mem(to_integer(unsigned(apb_wr_addr_o))) <= apb_wr_data_o;
        --   apb_rd_dv_i <= '1';
        -- else
        --   apb_rd_dv_i <= '0';
        -- end if;
      end if;
    end if ;
  end process;

  o_global_z <= unsigned(mem_out((MDT_GLOBAL_AXI_LEN*2)-1 downto MDT_GLOBAL_AXI_LEN));
  o_global_x <= unsigned(mem_out(MDT_GLOBAL_AXI_LEN - 1 downto 0));
  
end architecture beh;
