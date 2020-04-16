--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor drift time and T0 compensation
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      14/02/2019  0.1     File created
--      18/02/2020  0.11    Time discriminator simple
--                              SLcBXID < MDT_time < SLcBXID + 28
--------------------------------------------------------------------------------
-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

-- library shared_lib;
-- use shared_lib.cfg_pkg.all;
-- use shared_lib.common_pkg.all;

-- library hp_lib;
-- use hp_lib.hp_pkg.all;

-- entity hp_t0_comp is
--     generic(
--         radius      : integer; 
--         tube_min    : integer;
--         tube_max    : integer
--     );
--     port (
--         clk                 : in std_logic;
--         
--         Reset_b             : in std_logic;
--         glob_en             : in std_logic;
--         -- MDT hit
--         i_tdc_layer         : in unsigned(MDT_LAYER_WIDTH -1 downto 0);
--         i_tdc_tube          : in unsigned(MDT_TUBE_WIDTH - 1 downto 0);
--         i_tdc_le            : in mdt_time_le_st;
--         -- i_tdc_valid         : in std_logic;
--         -- to matching
--         o_time_comp         : out mdt_time_le_st
--         -- o_data_valid        : out std_logic
--     );
-- end entity hp_t0_comp;

-- architecture beh of hp_t0_comp is

--     type t0LUT_mem_t is array (0 to (tube_max - tube_min) - 1) of t0LUT_layer_t;

--     signal t0_LUT_mem : t0LUT_mem_t;

--     signal t0 : integer;

    
-- begin

--     cpy_mem : for x in 0 to (tube_max - tube_min - 1)  generate
--         t0_LUT_mem(x) <= t0LUT_e_mem(radius)(tube_min + x);
--     end generate;

--     t0 <= t0_LUT_mem(to_integer(i_tdc_layer) - tube_min)(to_integer(i_tdc_layer));

--     t0_proc: process(Reset_b,clk)
--     begin
--         if not Reset_b then
--             o_time_comp <= (others => '0');
--         elsif rising_edge(clk) then

--             o_time_comp <= to_unsigned(to_integer(i_tdc_le)-t0,17);
            
--         end if;

--     end process t0_proc;

-- end beh;

