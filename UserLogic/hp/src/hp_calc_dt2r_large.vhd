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
--      14/02/2019  0.1     File created
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
use hp_lib.hp_dt2r_large_mem.all;

entity hp_calc_dt2r_large is
  -- generic(
  --   g_STATION_RADIUS     : integer
  -- );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --
    ctrl_v              : in std_logic_vector;
    mon_v               : out std_logic_vector;
    --
    i_drift_time        : in unsigned(MDT_TIME_LEN -1 downto 0);
    i_data_valid        : in std_logic;
    o_tube_radius       : out unsigned(MDT_RADIUS_LEN -1 downto 0);
    o_data_valid        : out std_logic
  );
end entity hp_calc_dt2r_large;

architecture beh of hp_calc_dt2r_large is

  signal addr_mem : unsigned(DT2R_LARGE_ADDR_LEN-1 downto 0); 
  signal int_data_valid : std_logic;

  signal mem : mem_array := mem_data;

  attribute syn_rom_style : string;
  attribute ROM_STYLE : string;
  -- force rom to be in RAMB
  -- attribute syn_rom_style of mem : signal is "block_rom";
  -- attribute ROM_STYLE of mem : signal is "block";
  -- force rom to be in LUT ROMs
  attribute syn_rom_style of mem : signal is "block_rom";
  attribute ROM_STYLE of mem : signal is "distributed";
begin

  dv_guard : process(i_data_valid) begin
    int_data_valid <= i_data_valid;
  end process;

  mem_guard : process(i_drift_time) begin
    if ( i_drift_time > DT2R_LARGE_MEM_SIZE) then
      addr_mem <= (others => '0');
    else
      addr_mem <= i_drift_time(DT2R_LARGE_ADDR_LEN -1 downto 0);
    end if;
  end process;

  DT2R : process(clk,rst)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        o_tube_radius <= (others => '0');
        o_data_valid <= '0';
      else
        o_data_valid <= int_data_valid;
        if(int_data_valid = '1') then
          o_tube_radius <= to_unsigned(mem(to_integer(addr_mem)),MDT_RADIUS_LEN);
        else
          o_tube_radius <= (others => '0');
        end if;
      end if;
    end if ;
  end process;
end architecture beh;
