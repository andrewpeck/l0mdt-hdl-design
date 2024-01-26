--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: heg_ctrl_roi_b_z.vhd
-- Module: <<moduleName>>
-- File PATH: /heg_ctrl_roi_b_z.vhd
-- -----
-- File Created: Wednesday, 8th June 2022 9:54:44 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 1st December 2022 12:43:52 am
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

entity b_z2roi is
  generic(
    g_STATION_RADIUS     : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_z                 : in unsigned(UCM_Z_ROI_LEN-1 downto 0);
    i_dv                : in std_logic;
    --
    o_roi_center        : out heg_roi_center_aut(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    o_dv                : out std_logic
  );
end entity b_z2roi;

architecture beh of b_z2roi is

  signal addr_mem       : unsigned(UCM_Z_ROI_LEN-1 downto 0); 
  signal mem : roi_z_lut_std_t(0 to get_roi_z_max(g_STATION_RADIUS) - 1) := get_roi_z_tubes_std(g_STATION_RADIUS);
  signal mem_pl0        : std_logic_vector(MDT_TUBE_LEN*2 -1 downto 0) := (others => '0');
  signal centers        : std_logic_vector(MDT_TUBE_LEN*2 -1 downto 0) := (others => '0');
  
  signal int_data_valid : std_logic;
  signal mem_dv0        : std_logic;

  attribute ROM_STYLE : string;
  attribute ROM_STYLE of mem : signal is "block";

begin

  -- mem <= get_roi_z_tubes(g_STATION_RADIUS);

  -- dv_guard : process(i_dv) begin
    int_data_valid <= i_dv;
  -- end process;

  -- mem_guard : process(i_z) begin
    -- if ( to_integer(unsigned(i_z)) > get_roi_z_max(g_STATION_RADIUS)) then
      -- addr_mem <= (others => '0');
    -- else
      addr_mem <= i_z;--(DT2R_LARGE_ADDR_LEN -1 downto 0);
    -- end if;
  -- end process;

  -- INN_GEN: if g_STATION_RADIUS = 0 generate
    DT2R : process(clk)

    begin
      if rising_edge(clk) then
        if rst= '1' then
          centers <= (others => '0');
          o_dv <= '0';
        else
          mem_dv0 <= int_data_valid;
          o_dv <= mem_dv0;
          if(int_data_valid = '1') then
            mem_pl0 <= mem(to_integer(addr_mem));
          end if;
          if(mem_dv0 = '1') then
            centers <= mem_pl0;
          end if;
        end if;
      end if ;
    end process;
  -- end generate;

  OUT_GEN : for l_i in 0 to get_num_layers(g_STATION_RADIUS) -1 generate

    o_roi_center(l_i) <= unsigned(centers(MDT_TUBE_LEN -1 downto 0)) when (l_i mod 2) = 0 else
                         unsigned(centers(MDT_TUBE_LEN*2 -1 downto MDT_TUBE_LEN));

    -- o_roi_center(l_i) <= to_unsigned(centers(0),MDT_TUBE_LEN) when (l_i mod 2) = 0 else
    --                       to_unsigned(centers(1),MDT_TUBE_LEN);
  end generate;

end beh;

