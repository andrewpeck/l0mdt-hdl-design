--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module:
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
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
-- use heg_lib.heg_trLUT_s3_pkg.all;
library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;
use heg_roi_lib.roi_func_pkg.all;

entity b_mbar2roi is
  generic(
    g_STATION_RADIUS     : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_mbar              : in unsigned(UCM_MBAR_LEN-1 downto 0);
    i_dv                : in std_logic;
    --
    o_roi_edges         : out hp_window_limits_at(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    o_dv                : out std_logic
  );
end entity b_mbar2roi;

architecture beh of b_mbar2roi is

  -- signal rom_mem  : roi_mbar_lut_std(0 to get_roi_mbar_max(g_STATION_RADIUS) - 1);
  signal rom_mem  : roi_mbar_lut_t(get_roi_mbar_max(g_STATION_RADIUS) - 1 downto 0)(0 to get_num_layers(g_STATION_RADIUS) -1) := get_roi_mbar_tubes(g_STATION_RADIUS);
  signal mem_ouput : roi_mbar_layer_t(0 to get_num_layers(g_STATION_RADIUS) -1);
  signal addr_mem : unsigned(UCM_MBAR_LEN-1 downto 0); 
  signal int_data_valid : std_logic;

  
  attribute ROM_STYLE : string;
  attribute ROM_STYLE of rom_mem : signal is "distributed";

  signal roi_edges : std_logic_vector(MDT_TUBE_LEN * get_num_layers(g_STATION_RADIUS) -1 downto 0);

begin

  -- rom_mem <= get_roi_mbar_tubes(g_STATION_RADIUS);

  dv_guard : process(i_dv) begin
    int_data_valid <= i_dv;
  end process;

  mem_guard : process(i_mbar) begin
    -- if ( to_integer(unsigned(i_mbar)) > 5) then
    --   addr_mem <= (others => '0');
    -- else
      addr_mem <= i_mbar;--(DT2R_LARGE_ADDR_LEN -1 downto 0);
    -- end if;
  end process;

  INN_GEN: if g_STATION_RADIUS = 0 generate
    DT2R : process(clk)

    begin
      if rising_edge(clk) then
        if rst= '1' then
          -- o_spaces <= (others => '0');
          o_dv <= '0';
        else
          o_dv <= int_data_valid;
          if(int_data_valid = '1') then
            mem_ouput <= rom_mem(to_integer(addr_mem));
            -- o_spaces <= to_unsigned(rom_mem(to_integer(addr_mem)),MDT_GLOBAL_AXI_LEN);
          end if;
        end if;
      end if ;
    end process;
  end generate;

  OUT_GEN : for l_i in 0 to get_num_layers(g_STATION_RADIUS) -1 generate
    o_roi_edges(l_i).lo <= to_signed(mem_ouput(l_i)(0),MDT_TUBE_LEN);
    o_roi_edges(l_i).hi <= to_signed(mem_ouput(l_i)(1),MDT_TUBE_LEN);

  end generate;

end beh;
