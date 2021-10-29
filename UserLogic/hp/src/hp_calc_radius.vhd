--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module      : Hit Processor 
--  SUb module  : Radius calculation
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

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

use shared_lib.mdt_dt2r_pkg.all;

library apbus_lib;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_calc_radius is
  generic(
    g_STATION_RADIUS             : integer;
    g_CHAMBER_IETA              : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;

    ctrl_v              : in std_logic_vector;
    mon_v               : out std_logic_vector;

    i_SLc_BCID          : in unsigned(BCID_LEN-1 downto 0);
    i_mdt_time_t0       : in unsigned(MDT_TIME_LEN -1 downto 0);
    i_data_valid        : in std_logic;
    
    o_tube_radius       : out unsigned(MDT_RADIUS_LEN -1 downto 0);
    o_data_valid        : out std_logic
  );
end entity hp_calc_radius;

architecture beh of hp_calc_radius is
  -- APB
  -- constant  ack_needed  : std_logic :=  '0';
  -- signal axi_rst      : std_logic;
  -- signal axi_clk      : std_logic;

  -- signal ctrl_r : H2S_HPS_HEG_HEG_HP_HP_MDT_DT2R_CTRL_t;
  -- signal mon_r : H2S_HPS_HEG_HEG_HP_HP_MDT_DT2R_MON_t;

  constant ADDR_WIDTH : integer := 10;
  constant DATA_WIDTH : integer := 9;

  -- signal  wr_data_v : std_logic_vector(len(ctrl_r.wr_data) -1 downto 0);

  signal drift_time : unsigned(MDT_TIME_LEN -1 downto 0);
  signal BCID_exp : unsigned(MDT_TIME_LEN -1 downto 0);
  signal int_dv : std_logic;

  -- signal mem_addr : unsigned(mdt_dt2r_get_addr_len(c_SECTOR_SIDE,g_STATION_RADIUS,g_CHAMBER_IETA) -1 downto 0); 

  -- type dt2r_mem_t is array(mdt_dt2r_get_addr_len(c_SECTOR_SIDE,g_STATION_RADIUS,g_CHAMBER_IETA) -1 downto 0) of unsigned(8 downto 0);
  -- type dt2r_mem_t is array(1024 - 1 downto 0) of unsigned(8 downto 0);
  signal mem : dt2r_mem_t := mdt_dt2r_get_init_data(c_SECTOR_SIDE,g_STATION_RADIUS,g_CHAMBER_IETA);
  attribute RAM_STYLE : string;
  attribute RAM_STYLE of mem : signal is "distributed";

  signal apb_rd_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_wr_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_wr_data_o       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_wr_dv_o         : std_logic;
  signal apb_rd_dv_o         : std_logic;
  signal apb_rd_data_i       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_rd_dv_i         : std_logic;

  signal addr_error  : std_logic;
    
begin

  -- ctrl_r <= convert(ctrl_v,ctrl_r);
  -- mon_v <= convert(mon_r,mon_v);

  apb_mem_interface : entity apbus_lib.apb_imem
    generic map(
      g_XML_NODE_NAME         => "MEM_INT_10A9D",
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
  -- end generate;



  BCID_exp <= i_SLc_BCID & to_unsigned(0,5);

  normal_proc: process(rst,clk)
  begin
    if rising_edge(clk) then
      if rst= '1' then
        drift_time <= (others => '0');
        int_dv <= '0';

        o_tube_radius <= (others => '0');
        o_data_valid <=  '0';

        addr_error <= '0';
        apb_rd_data_i <= (others => '0');
        apb_rd_dv_i <= '0';


      else

        addr_error <= '0';


        -- if apb_wr_dv_o = '1' then
        --   apb_rd_data_i <= std_logic_vector(mem(to_integer(unsigned(apb_rd_addr_o))));
        --   mem(to_integer(unsigned(apb_rd_addr_o))) <= unsigned(apb_wr_data_o);
        --   apb_rd_dv_i <= '1';
        -- else
        --   apb_rd_dv_i <= '0';
        -- end if;

        if apb_wr_dv_o = '1' or apb_rd_dv_o = '1' then
          if apb_wr_dv_o = '1' then
            -- apb_data_i <= mem(to_integer(unsigned(apb_rd_addr_o)));
            mem(to_integer(unsigned(apb_wr_addr_o))) <= unsigned(apb_wr_data_o);
            -- apb_dv_i <= '1';
          else
            -- apb_dv_i <= '0';
          end if;
  
          if apb_rd_dv_o = '1' then
            apb_rd_data_i <= std_logic_vector(mem(to_integer(unsigned(apb_rd_addr_o))));
            -- mem(to_integer(unsigned(apb_rd_addr_o))) <= apb_data_o;
            apb_rd_dv_i <= '1';
          else
            apb_rd_dv_i <= '0';
          end if;
        else
          if ena  = '1' then
            int_dv <= i_data_valid;
  
            if i_data_valid = '1' then
              drift_time <= i_mdt_time_t0 - BCID_exp;
            else
              drift_time <= (others => '0');
            end if;
  
            if int_dv = '1' then
              if  to_integer(drift_time) < 1023 then
                o_tube_radius <= mem(to_integer(drift_time));
                o_data_valid   <= '1';
              else
                o_tube_radius <= (others => '0');
                o_data_valid <=  '0';
                addr_error <= '1';
              end if;
            else
              o_tube_radius <= (others => '0');
              o_data_valid <=  '0';
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;

end beh;

-- DT2R_B_GEN: if c_ST_nBARREL_ENDCAP = '0' generate

--   -- sMDT
--   -- DT2R_BS_GEN: if g_STATION_RADIUS= 0 generate
--   --   HP_DT2R_BS : entity hp_lib.hp_calc_dt2r_small
--   --   generic map(
--   --     g_STATION_RADIUS             => g_STATION_RADIUS
--   --   )
--   --   port map(
--   --     clk                 => clk,
--   --     rst            => rst,
--   --     glob_en             => glob_en,

--   --     i_drift_time        => drift_time,
--   --     i_data_valid        => int_dv,
--   --     o_tube_radius       => o_tube_radius,
--   --     o_data_valid        => o_data_valid
--   --   );
--   -- end generate;
  
--   -- MDT
--   -- DT2R_BL_GEN: if g_STATION_RADIUS> 0 generate
--     HP_DT2R_BL : entity hp_lib.hp_calc_dt2r_large
--     -- generic map(
--     --   g_STATION_RADIUS             => g_STATION_RADIUS
--     -- )
--     port map(
--       clk                 => clk,
--       rst                 => rst,
--       ena                 => glob_en,

--       i_drift_time        => drift_time,
--       i_data_valid        => int_dv,
--       o_tube_radius       => o_tube_radius,
--       o_data_valid        => o_data_valid
--     );
--   -- end generate;
-- end generate;
-- -- DT2R_E_GEN: if c_ST_nBARREL_ENDCAP = '1' generate

-- -- end generate;


-- -- BCID_exp <= to_unsigned(0,1) & i_SLc_BCID & to_unsigned(0,5);
-- BCID_exp <= i_SLc_BCID & to_unsigned(0,5);

-- t0_proc: process(rst,clk)
-- begin
--   if rising_edge(clk) then
--     if rst= '1' then
--       drift_time <= (others => '0');
--       int_dv <= '0';
--     else

--       int_dv <= i_data_valid;

--       if i_data_valid = '1' then
--         drift_time <= i_mdt_time_t0 - BCID_exp;
--       else
--         drift_time <= (others => '0');
--       end if;
--     end if;

--   end if;

-- end process;


  -- apb_mem_interface : entity apbus_lib.apb_mem_int
  -- generic map(
  --   g_XML_NODE_NAME         => "MEM_INT_10A9D",
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
  --   ctrl_v          => ctrl_v,
  --   mon_v           => mon_v,
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
  --   o_data        => apb_wr_data_o,   
  --   o_dv          => apb_wr_dv_o, 
  --   i_data        => apb_rd_data_i,  
  --   i_dv          => apb_rd_dv_i
  -- );  

  -- wr_data_v  <= convert(ctrl_r.wr_data,wr_data_v);

  -- apb_proc: process(axi_clk)
  -- begin
  --   if rising_edge(axi_clk) then
  --     -- if axi_rst = '1' then
        
  --     -- else
  --     --   --rd
  --     --   if ack_needed = '0' then
  --     --     mon_r.rd_rdy <= '0';
  --     --   else
  --     --     if ctrl_r.rd_ack = '1' then
  --     --       mon_r.rd_rdy <= '0';
  --     --     end if;
  --     --   end if;
  --     --   if ctrl_r.rd_req = '1'  then
  --     --     mon_r.rd_data  <= convert(std_logic_vector(mem(to_integer(unsigned(ctrl_r.rd_addr)))),mon_r.rd_data);
  --     --     mon_r.rd_rdy <= '1';
  --     --   end if;
  --     --   --wr
  --     --   if ctrl_r.wr_req = '1'  then
  --     --     mem(to_integer(unsigned(ctrl_r.wr_addr))) <= unsigned(wr_data_v);
  --     --   end if;

        
  --     end if;
  --   end if;
  -- end process apb_proc;