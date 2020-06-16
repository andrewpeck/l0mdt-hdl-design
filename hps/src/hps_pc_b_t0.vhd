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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;
use hps_lib.hps_rom_b_t0_pkg.all;

entity hps_pc_b_t0 is
  generic(
    -- parameters
    g_STATION_RADIUS    : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_chamber           : in unsigned(SLC_CHAMBER_LEN-1 downto 0);
    i_dv                : in std_logic;
    o_time_t0           : out unsigned(MDT_TIME_LEN-1 downto 0);
    o_dv                : out std_logic
    
  );
end entity hps_pc_b_t0;

architecture beh of hps_pc_b_t0 is
  signal addr_mem : unsigned(SLC_CHAMBER_LEN-1 downto 0); 
  signal int_data_valid : std_logic;

  signal BI_T0_mem : t0LUT_chamber_t := c_BI_T0(c_SECTOR_ID);
  signal BM_T0_mem : t0LUT_chamber_t := c_BM_T0(c_SECTOR_ID);
  signal BO_T0_mem : t0LUT_chamber_t := c_BO_T0(c_SECTOR_ID);
  -- signal mem : mem_array := mem_data;

  attribute syn_rom_style : string;
  attribute ROM_STYLE : string;
  -- force rom to be in RAMB
  -- attribute syn_rom_style of mem : signal is "block_rom";
  -- attribute ROM_STYLE of mem : signal is "block";
  -- force rom to be in LUT ROMs
  -- attribute syn_rom_style of mem : signal is "block_rom";
  attribute ROM_STYLE of BI_T0_mem : signal is "distributed";
  attribute ROM_STYLE of BM_T0_mem : signal is "distributed";
  attribute ROM_STYLE of BO_T0_mem : signal is "distributed";
begin

  dv_guard : process(i_dv) begin
    int_data_valid <= i_dv;
  end process;

  mem_guard : process(i_chamber) begin
    if ( to_integer(unsigned(i_chamber)) > 5) then
      addr_mem <= (others => '0');
    else
      addr_mem <= i_chamber;--(DT2R_LARGE_ADDR_LEN -1 downto 0);
    end if;
  end process;

  INN_GEN: if g_STATION_RADIUS = 0 generate
    DT2R : process(clk)

    begin
      if rising_edge(clk) then
        if rst= '1' then
          o_time_t0 <= (others => '0');
          o_dv <= '0';
        else
          o_dv <= int_data_valid;
          if(int_data_valid = '1') then
            o_time_t0 <= to_unsigned(integer(BI_T0_mem(to_integer(addr_mem))),MDT_TIME_LEN);
          end if;
        end if;
      end if ;
    end process;
  end generate;
end architecture beh;