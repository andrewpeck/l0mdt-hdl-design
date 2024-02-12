--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: heg_ctrl_roi_b_slope_8l.vhd
-- Module: <<moduleName>>
-- File PATH: /heg_ctrl_roi_b_slope_8l.vhd
-- -----
-- File Created: Wednesday, 8th June 2022 9:54:44 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 29th November 2022 3:27:14 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
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
-- use shared_lib.vhdl2008_functions_pkg.all;
-- use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;
library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;
use heg_roi_lib.roi_func_pkg.all;

entity b_slope2roi_8l is
  generic(
    g_STATION_RADIUS     : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_ang               : in std_logic_vector(UCM_VEC_ANG_LEN-1 downto 0);
    i_dv                : in std_logic;
    --
    o_roi_edges         : out hp_win_tubes_limits_art(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    o_dv                : out std_logic
  );
end entity b_slope2roi_8l;

architecture beh of b_slope2roi_8l is

  -- VHDL2008 -- signal rom_mem  : roi_mbar_lut_t(get_roi_mbar_max(g_STATION_RADIUS) - 1 downto 0)(0 to get_num_layers(g_STATION_RADIUS) -1) := get_roi_mbar_tubes(g_STATION_RADIUS);
  -- signal rom_mem_small  : roi_mbar_lut_small_t(get_roi_mbar_max(g_STATION_RADIUS) - 1 downto 0) := get_roi_mbar_tubes(g_STATION_RADIUS);

  -- signal mem  : roi_mbar_lut_large_t(2048 - 1 downto 0) := get_roi_mbar_tubes(g_STATION_RADIUS);
  
  
  signal mem : roi_mbar_lut_large_std_t := get_roi_mbar_tubes_std(g_STATION_RADIUS);

  -- VHDL2008 -- signal mem_output : roi_mbar_layer_t(0 to get_num_layers(g_STATION_RADIUS) -1);
  -- signal mem_ouput_small : roi_mbar_layer_small_t;
  signal mem_output : std_logic_vector(MDT_TUBE_LEN*16 -1 downto 0);--roi_mbar_layer_large_t;
  signal mem_pl0 : std_logic_vector(MDT_TUBE_LEN*16 -1 downto 0);--roi_mbar_layer_large_t;
  signal mem_dv0 : std_logic;

  signal addr_mem : unsigned(UCM_VEC_ANG_LEN-1 downto 0); 
  signal int_data_valid : std_logic;

  
  attribute ROM_STYLE : string;
  -- attribute ROM_STYLE of rom_mem_small : signal is "distributed";
  attribute ROM_STYLE of mem : signal is "block";

  signal roi_edges : std_logic_vector(MDT_TUBE_LEN * get_num_layers(g_STATION_RADIUS) -1 downto 0);

begin


  -- dv_guard : process(i_dv) begin
    int_data_valid <= i_dv;
  -- end process;

  -- mem_guard : process(i_ang) begin
    -- if ( to_integer(unsigned(i_mbar)) > 5) then
    --   addr_mem <= (others => '0');
    -- else
      addr_mem <= unsigned(i_ang);--(DT2R_LARGE_ADDR_LEN -1 downto 0);
    -- end if;
  -- end process;

  -- LARGE_GEN: if g_STATION_RADIUS = 0 generate
    DT2R : process(clk)

    begin
      if rising_edge(clk) then
        if rst= '1' then
          -- o_spaces <= (others => '0');
          o_dv <= '0';
          mem_output <=  (others => '0');
          mem_pl0 <= (others => '0');
        else
          mem_dv0 <= int_data_valid;
          o_dv <= mem_dv0;
          -- o_dv <= int_data_valid;
          if(int_data_valid = '1') then
            -- mem_output <= get_win_slope_8l(to_integer(addr_mem));
            mem_pl0 <= mem(to_integer(addr_mem));
            -- mem_output <= mem(to_integer(addr_mem));
          end if;
          if(mem_dv0 = '1') then
            mem_output <= mem_pl0;
          end if;
        end if;
      end if ;
    end process;

    OUT_GEN : for l_i in get_num_layers(g_STATION_RADIUS) downto 1 generate
      o_roi_edges(l_i - 1).lo <= signed(mem_output(l_i*MDT_TUBE_LEN*2 - 1 downto l_i*MDT_TUBE_LEN*2 - MDT_TUBE_LEN ));
      o_roi_edges(l_i - 1).hi <= signed(mem_output(l_i*MDT_TUBE_LEN*2 - MDT_TUBE_LEN - 1 downto l_i*MDT_TUBE_LEN*2 - MDT_TUBE_LEN*2));
    end generate;

  -- end generate;

  -- SMALL_GEN: if g_STATION_RADIUS > 0 generate
  --   DT2R : process(clk)

  --   begin
  --     if rising_edge(clk) then
  --       if rst= '1' then
  --         -- o_spaces <= (others => '0');
  --         o_dv <= '0';
  --       else
  --         o_dv <= int_data_valid;
  --         if(int_data_valid = '1') then
  --           mem_ouput_small <= rom_mem_small(to_integer(addr_mem));
  --           -- o_spaces <= to_unsigned(rom_mem(to_integer(addr_mem)),MDT_GLOBAL_AXI_LEN);
  --         end if;
  --       end if;
  --     end if ;
  --   end process;

  --   OUT_GEN : for l_i in 0 to get_num_layers(g_STATION_RADIUS) -1 generate
  --     o_roi_edges(l_i).lo <= to_signed(mem_ouput_small(l_i)(0),MDT_TUBE_LEN);
  --     o_roi_edges(l_i).hi <= to_signed(mem_ouput_small(l_i)(1),MDT_TUBE_LEN);
  --   end generate;

  -- end generate;



end beh;
