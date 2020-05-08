--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor 
--          drift time - radius
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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;


entity hp_calc_dt2r_small is
  generic(
    radius      : integer
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;

    i_drift_time        : in unsigned(HP_DRIFT_TIME_LEN -1 downto 0);
    i_data_valid        : in std_logic;
    o_tube_radius       : out unsigned(MDT_RADIUS_LEN -1 downto 0)
    -- o_data_valid        : out std_logic
  );
end entity hp_calc_dt2r_small;

architecture beh of hp_calc_dt2r_small is

  -- signal addr_mem : std_logic_vector(AWIDTH-1 downto 0); 
  -- signal int_data_valid : std_logic;

  -- type mem_array is array (0 to MEM_SIZE-1) of integer; 
  -- signal mem : mem_array := (
  --      0 to  8  => 5, 
  --      9 to 18  => 9, 
  --     19 to 28  => 15, 
  --     29 to 38  => 22, 
  --     39 to 48  => 29, 
  --     49 to 58  => 37
  --      );

  -- attribute syn_rom_style : string;
  -- attribute ROM_STYLE : string;
  -- -- force rom to be in RAMB
  -- attribute syn_rom_style of mem : signal is "block_rom";
  -- attribute ROM_STYLE of mem : signal is "distributed";
  -- -- force rom to be in LUT ROMs
  -- -- attribute syn_rom_style of mem : signal is "block_rom";
  -- -- attribute ROM_STYLE of mem : signal is "distributed";

begin

  -- dv_guard : process(i_data_valid) begin
  --   int_data_valid <= i_data_valid;
  -- end process;

  -- mem_guard : process(i_drift_time) begin
  --   if ( i_drift_time > MAX_DRIF_TIME) then
  --     addr_mem <= (others => '0')
  --   else
  --     addr_mem <= i_drift_time;
  --   end if;
  -- end process;

  -- DT2R : process(clk,Reset_b)

  -- begin
  --   if Reset_b = '0' then
  --     o_tube_radius <= (others => '0');
  --     -- o_data_valid <= '0';
  --   elsif rising_edge(clk) then
  --     -- o_data_valid <= i_data_valid;
  --     if(int_data_valid = '1') then
  --       o_tube_radius <= to_unsigned(mem(to_integer(addr_mem)),MDT_RADIUS_LEN);
  --         -- if ( i_drift_time > MAX_DRIF_TIME) then
  --         --   addr_tmp <= (others => '0')
  --         -- else
  --         --   addr_mem <= i_drift_time;
  --         -- end if;
  --     end if;

  --   end if ;
  -- end process;

end architecture beh;
