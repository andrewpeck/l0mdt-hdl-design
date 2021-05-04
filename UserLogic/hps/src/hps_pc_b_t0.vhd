--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS T0 compensation ROM reader
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
use shared_lib.hps_rom_b_t0_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;


library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;
library apbus_lib;

entity hps_pc_b_t0 is
  generic(
    -- parameters
    g_STATION_RADIUS    : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --
    ctrl_v              : in std_logic_vector;--H2S_HPS_MDT_T0_MDT_T0_CTRL_t;  
    mon_v               : out std_logic_vector;--H2S_HPS_MDT_T0_MDT_T0_MON_t;  
    --
    i_chamber           : in unsigned(SLC_CHAMBER_LEN-1 downto 0);
    i_dv                : in std_logic;
    o_time_t0           : out unsigned(MDT_TIME_LEN-1 downto 0);
    o_dv                : out std_logic
    
  );
end entity hps_pc_b_t0;

architecture beh of hps_pc_b_t0 is

  -- signal ctrl_v : std_logic_vector(len(ctrl) - 1  downto 0);
  -- signal mon_v : std_logic_vector(len(mon) - 1  downto 0);

  constant ADDR_WIDTH : integer := 4;
  constant DATA_WIDTH : integer := 17;

  type t0LUT_chamber_avt is array (0 to 7) of unsigned(MDT_TIME_LEN-1 downto 0);

  function init_T0_MEM(r , s : integer)return t0LUT_chamber_avt is
    variable y : t0LUT_chamber_avt;
  begin
    for i in 0 to 7 loop
      if r = 0 then
        y(i) := to_unsigned(c_BI_T0(s)(i),MDT_TIME_LEN);
      elsif r = 1 then
        y(i) := to_unsigned(c_BM_T0(s)(i),MDT_TIME_LEN);
      elsif r = 2 then
        y(i) := to_unsigned(c_BO_T0(s)(i),MDT_TIME_LEN);
      -- else
  
      end if;
    end loop;
    return y;
  end function;

  signal mem : t0LUT_chamber_avt := init_T0_MEM(g_STATION_RADIUS,c_SECTOR_ID);

  signal apb_rd_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_wr_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_data_o       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_dv_o         : std_logic;
  signal apb_data_i       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_dv_i         : std_logic;

begin

  -- ctrl_v <= vectorify(ctrl,ctrl_v);
  -- mon <= structify(mon_v,mon);

  apb_mem_interface : entity apbus_lib.apb_mem_int
  generic map(
    g_XML_NODE_NAME         => "MEM_INT_4A17D",
    g_INTERNAL_CLK          => '1',
    g_ADDR_WIDTH            => ADDR_WIDTH,
    g_DATA_WIDTH            => DATA_WIDTH,
    g_APBUS_CTRL_WIDTH      => ctrl_v'length,
    g_APBUS_MON_WIDTH       => mon_v'length
  )
  port map (
    clk           => clk,
    rst           => rst,
    ena           => ena,
    --
    ctrl          => ctrl_v,
    mon           => mon_v,
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

  DT2R : process(clk)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        o_time_t0 <= (others => '0');
        o_dv <= '0';
      else
        if(i_dv = '1') then
          o_time_t0 <= mem(to_integer(i_chamber));
          o_dv <= '1';
        else
          o_time_t0 <= (others => '0');
          o_dv <= '0';
        end if;
        if apb_dv_o = '1' then
          apb_data_i <= std_logic_vector(mem(to_integer(unsigned(apb_rd_addr_o))));
          mem(to_integer(unsigned(apb_rd_addr_o))) <= unsigned(apb_data_o);
          apb_dv_i <= '1';
        else
          apb_dv_i <= '0';
        end if;
      end if;
    end if ;
  end process;

  
end architecture beh;


------------------------------------------------------------------------------
--      OLD
------------------------------------------------------------------------------

-- signal addr_mem : unsigned(SLC_CHAMBER_LEN-1 downto 0); 
-- signal int_data_valid : std_logic;

-- signal BI_T0_mem : t0LUT_chamber_t := c_BI_T0(c_SECTOR_ID);
-- signal BM_T0_mem : t0LUT_chamber_t := c_BM_T0(c_SECTOR_ID);
-- signal BO_T0_mem : t0LUT_chamber_t := c_BO_T0(c_SECTOR_ID);
-- -- signal mem : mem_array := mem_data;

-- attribute syn_rom_style : string;
-- attribute ROM_STYLE : string;
-- -- force rom to be in RAMB
-- -- attribute syn_rom_style of mem : signal is "block_rom";
-- -- attribute ROM_STYLE of mem : signal is "block";
-- -- force rom to be in LUT ROMs
-- -- attribute syn_rom_style of mem : signal is "block_rom";
-- attribute ROM_STYLE of BI_T0_mem : signal is "distributed";
-- attribute ROM_STYLE of BM_T0_mem : signal is "distributed";
-- attribute ROM_STYLE of BO_T0_mem : signal is "distributed";
-- begin

-- dv_guard : process(i_dv) begin
--   int_data_valid <= i_dv;
-- end process;

-- mem_guard : process(i_chamber) begin
--   -- if ( to_integer(unsigned(i_chamber)) > 5) then
--   --   addr_mem <= (others => '0');
--   -- else
--     addr_mem <= i_chamber;--(DT2R_LARGE_ADDR_LEN -1 downto 0);
--   -- end if;
-- end process;

-- INN_GEN: if g_STATION_RADIUS = 0 generate
--   DT2R : process(clk)

--   begin
--     if rising_edge(clk) then
--       if rst= '1' then
--         o_time_t0 <= (others => '0');
--         o_dv <= '0';
--       else
--         o_dv <= int_data_valid;
--         if(int_data_valid = '1') then
--           o_time_t0 <= to_unsigned(integer(BM_T0_mem(to_integer(addr_mem))),MDT_TIME_LEN);
--         else
--           o_time_t0 <= (others => '0');
--         end if;
--       end if;
--     end if ;
--   end process;
-- end generate;

-- MID_GEN: if g_STATION_RADIUS = 1 generate
--   DT2R : process(clk)

--   begin
--     if rising_edge(clk) then
--       if rst= '1' then
--         o_time_t0 <= (others => '0');-
--         o_dv <= '0';
--       else
--         o_dv <= int_data_valid;
--         if(int_data_valid = '1') then
--           o_time_t0 <= to_unsigned(integer(BO_T0_mem(to_integer(addr_mem))),MDT_TIME_LEN);
--         else
--           o_time_t0 <= (others => '0');
--         end if;
--       end if;
--     end if ;
--   end process;
-- end generate;

-- OUT_GEN: if g_STATION_RADIUS = 2 generate
--   DT2R : process(clk)

--   begin
--     if rising_edge(clk) then
--       if rst= '1' then
--         o_time_t0 <= (others => '0');
--         o_dv <= '0';
--       else
--         o_dv <= int_data_valid;
--         if(int_data_valid = '1') then
--           o_time_t0 <= to_unsigned(integer(BI_T0_mem(to_integer(addr_mem))),MDT_TIME_LEN);
--         else
--           o_time_t0 <= (others => '0');
--         end if;
--       end if;
--     end if ;
--   end process;
-- end generate;
