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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hp_calc_radius is
  generic(
    radius              : integer
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;

    i_SLc_BCID          : in unsigned(BCID_LEN-1 downto 0);
    i_mdt_time_t0       : in unsigned(HP_DRIFT_TIME_LEN -1 downto 0);
    i_data_valid         : in std_logic;
    
    o_tube_radius       : out unsigned(MDT_RADIUS_LEN -1 downto 0)
    -- o_data_valid        : out std_logic
  );
end entity hp_calc_radius;

architecture beh of hp_calc_radius is

  signal drift_time : unsigned(HP_DRIFT_TIME_LEN -1 downto 0);
  signal BCID_exp : unsigned(HP_DRIFT_TIME_LEN -1 downto 0);
  signal int_dv : std_logic;
    
begin

  DT2R_B_GEN: if ST_nBARREL_ENDCAP = '0' generate
    DT2R_BS_GEN: if radius = 0 generate
      HP_DT2R_BS : entity hp_lib.hp_calc_dt2r_small
      generic map(
        radius              => radius
      )
      port map(
        clk                 => clk,
        Reset_b             => Reset_b,
        glob_en             => glob_en,

        i_drift_time        => drift_time,
        i_data_valid        => int_dv,
        o_tube_radius       => o_tube_radius
        -- o_data_valid        => o_data_valid,
      );
    end generate;
    DT2R_BL_GEN: if radius > 0 generate
      HP_DT2R_BL : entity hp_lib.hp_calc_dt2r_large
      generic map(
        radius              => radius
      )
      port map(
        clk                 => clk,
        Reset_b             => Reset_b,
        glob_en             => glob_en,

        i_drift_time        => drift_time,
        i_data_valid        => int_dv,
        o_tube_radius       => o_tube_radius
        -- o_data_valid        => o_data_valid,
      );
    end generate;
  end generate;
  -- DT2R_E_GEN: if ST_nBARREL_ENDCAP = '1' generate
  
  -- end generate;


  BCID_exp <= to_unsigned(0,1) & i_SLc_BCID & to_unsigned(0,5);

  t0_proc: process(Reset_b,clk)
  begin
    if Reset_b = '0' then
      drift_time <= (others => '0');
    elsif rising_edge(clk) then
      int_dv <= i_data_valid;
      if i_data_valid = '1' then
        drift_time <= i_mdt_time_t0 - BCID_exp;
      end if;
    end if;

  end process t0_proc;

end beh;

