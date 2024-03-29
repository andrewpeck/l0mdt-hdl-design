--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;


library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
library apbus_lib;

entity hps_pc_b_t0 is
  generic(
    -- parameters
    g_DELAY_CYCLES      : integer := 0;
    g_CHAMBER           : integer := 0;
    g_STATION_RADIUS    : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --
    ctrl_v              : in std_logic_vector;--HPS_MDT_T0_MDT_T0_CTRL_t;  
    mon_v               : out std_logic_vector;--HPS_MDT_T0_MDT_T0_MON_t;  
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
        y(i) := to_unsigned(c_BI_T0(s)(i),MDT_TIME_LEN) - 6;
      elsif r = 1 then
        y(i) := to_unsigned(c_BM_T0(s)(i),MDT_TIME_LEN)  - 6;
      elsif r = 2 then
        y(i) := to_unsigned(c_BO_T0(s)(i),MDT_TIME_LEN) - 6;
      -- else
  
      end if;
    end loop;
    return y;
  end function;

  signal time_t0           : unsigned(MDT_TIME_LEN-1 downto 0);
  signal time_t0_dv        : std_logic;

  type time_t0_pl_at is array (g_DELAY_CYCLES -1 downto 0) of unsigned(MDT_TIME_LEN-1 downto 0);
  signal time_t0_pl_a : time_t0_pl_at;
  signal time_t0_dv_pl : std_logic_vector(g_DELAY_CYCLES -1 downto 0);

  signal mem : t0LUT_chamber_avt := init_T0_MEM(g_STATION_RADIUS,c_SECTOR_ID);

  signal apb_rd_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_wr_addr_o    : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal apb_wr_data_o       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_wr_dv_o         : std_logic;
  signal apb_rd_dv_o         : std_logic;
  signal apb_rd_data_i       : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_rd_dv_i         : std_logic;

begin

  apb_mem_interface : entity apbus_lib.apb_imem
  generic map(
    g_XML_NODE_NAME         => "MEM_INT_4A17D",
    g_MEMORY_TYPE           => "distributed",
    g_ADDR_WIDTH            => ADDR_WIDTH,
    g_DATA_WIDTH            => DATA_WIDTH
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

  T0_proc : process(clk)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        time_t0 <= (others => '0');
        time_t0_dv <= '0';
      else
        if apb_wr_dv_o = '1' or apb_rd_dv_o = '1' then
          if apb_wr_dv_o = '1' then
            mem(to_integer(unsigned(apb_wr_addr_o))) <= unsigned(apb_wr_data_o);
          else
          end if;
  
          if apb_rd_dv_o = '1' then
            apb_rd_data_i <= std_logic_vector(mem(to_integer(unsigned(apb_rd_addr_o))));
            apb_rd_dv_i <= '1';
          else
            apb_rd_dv_i <= '0';
          end if;
        else
          if(i_dv = '1') then
            time_t0 <= mem(to_integer(i_chamber));
            time_t0_dv <= '1';
          else
            time_t0 <= (others => '0');
            time_t0_dv <= '0';
          end if;
        end if;
      end if;
    end if ;
  end process;

  OUT_PL_GEN: if g_DELAY_CYCLES = 0 generate
    o_time_t0 <= time_t0;
    o_dv <= time_t0_dv;
  else generate


    out_pl: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          time_t0_pl_a <= (others => (others => '0'));
          time_t0_dv_pl <= (others => '0');
        else
          if g_DELAY_CYCLES = 1 then
            time_t0_pl_a(0)  <= time_t0;
            time_t0_dv_pl(0) <= time_t0_dv;
          else
            time_t0_pl_a(g_DELAY_CYCLES - 1)  <= time_t0;
            time_t0_dv_pl(g_DELAY_CYCLES - 1) <= time_t0_dv;
            for pl_i in g_DELAY_CYCLES - 1 downto 1 loop
              time_t0_pl_a(pl_i - 1)  <= time_t0_pl_a(pl_i );
              time_t0_dv_pl(pl_i - 1) <= time_t0_dv_pl(pl_i);
            end loop;
          end if;
          
        end if;
      end if;
    end process out_pl;
    o_time_t0 <= time_t0_pl_a(0);
    o_dv <= time_t0_dv_pl(0);
  end generate OUT_PL_GEN;
  
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
