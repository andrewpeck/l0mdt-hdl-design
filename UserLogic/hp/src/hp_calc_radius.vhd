--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_calc_radius is
  generic(
    g_STATION_RADIUS             : integer;
    g_CHAMBER_IETA              : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst            : in std_logic;
    glob_en             : in std_logic;

    ctrl_v              : in std_logic_vector;
    mon_v               : out std_logic_vector;

    i_SLc_BCID          : in unsigned(BCID_LEN-1 downto 0);
    i_mdt_time_t0       : in unsigned(MDT_TIME_LEN -1 downto 0);
    i_data_valid         : in std_logic;
    
    o_tube_radius       : out unsigned(MDT_RADIUS_LEN -1 downto 0);
    o_data_valid        : out std_logic
  );
end entity hp_calc_radius;

architecture beh of hp_calc_radius is

  signal drift_time : unsigned(MDT_TIME_LEN -1 downto 0);
  signal BCID_exp : unsigned(MDT_TIME_LEN -1 downto 0);
  signal int_dv : std_logic;

  signal mem_addr : unsigned(mdt_dt2r_get_addr_len(c_SECTOR_SIDE,g_STATION_RADIUS,g_CHAMBER_IETA) -1 downto 0); 

  type dt2r_mem_t is array(mdt_dt2r_get_addr_len(c_SECTOR_SIDE,g_STATION_RADIUS,g_CHAMBER_IETA) -1 downto 0) of unsigned(8 downto 0);
  signal mem : dt2r_mem_t := mdt_dt2r_get_init_data(c_SECTOR_SIDE,g_STATION_RADIUS,g_CHAMBER_IETA);
  attribute RAM_STYLE : string;
  attribute RAM_STYLE of mem : signal is "distributed";

    
begin

  -- DT2R_B_GEN: if c_ST_nBARREL_ENDCAP = '0' generate

  -- else generate

  -- end generate;



  -- BCID_exp <= to_unsigned(0,1) & i_SLc_BCID & to_unsigned(0,5);
  BCID_exp <= i_SLc_BCID & to_unsigned(0,5);

  t0_proc: process(rst,clk)
  begin
    if rising_edge(clk) then
      if rst= '1' then
        drift_time <= (others => '0');
        int_dv <= '0';
      else

        int_dv <= i_data_valid;

        if i_data_valid = '1' then
          drift_time <= i_mdt_time_t0 - BCID_exp;
        else
          drift_time <= (others => '0');
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

