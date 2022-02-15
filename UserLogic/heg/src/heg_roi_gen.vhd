--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
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
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

library heg_lib;
use heg_lib.heg_pkg.all;
use heg_lib.heg_custom_pkg.all;

library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;
use heg_roi_lib.RoI_LUT_pkg.all;

entity heg_roi_gen is
  generic(
    g_STATION_RADIUS      : integer
    -- g_STATION_NUM_LAYERS  : integer
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    glob_en               : in std_logic;

    i_z                   : in unsigned(UCM_Z_ROI_LEN-1 downto 0);
    i_data_valid          : in std_logic;
    o_SLC_Window_v        : out hp_win_tubes_avt;
    o_data_valid          : out std_logic
  );
end entity heg_roi_gen;

architecture beh of heg_roi_gen is

--   signal SLC_window     : hp_win_tubes_art;

--   signal uCM_barrel     : ucm_csf_barrel_rt;
--   -- signal z_barrel       : unsigned(UCM_Z_ROI_LEN-1 downto 0);
-- --   signal z_barrel_max : integer;
--   signal addr_mem       : unsigned(UCM_Z_ROI_LEN-1 downto 0); 
--   signal int_data_valid : std_logic;

--   signal mem_rom  : roi_mdt_lut := roi_set_mdt_mem(3,g_STATION_RADIUS);
--   signal mem_max  : unsigned(UCM_Z_ROI_LEN - 1 downto 0) := to_unsigned(roi_set_max(3, g_STATION_RADIUS),UCM_Z_ROI_LEN);
--   signal window   : roi_mdt_layer;

--   -- attribute syn_rom_style : string;
--   attribute ROM_STYLE : string;
-- --   -- -- force rom to be in RAMB
-- --   -- -- attribute syn_rom_style of mem : signal is "block_rom";
--   attribute ROM_STYLE of mem_rom : signal is "block";
-- --   -- -- force rom to be in LUT ROMs
--   -- attribute syn_rom_style of mem_rom : signal is "block_rom";
--   -- attribute ROM_STYLE of mem_rom : signal is "distributed";
begin

  -- BARREL : if c_ST_nBARREL_ENDCAP = '0' generate

  --   -- uCM_barrel <= structify(i_specific);
  --   -- z_barrel <= uCM_barrel.z;

  --   dv_guard : process(i_data_valid) begin
  --     int_data_valid <= i_data_valid;
  --   end process;

  --   mem_guard : process(i_z) begin
  --     -- if ( z_barrel > mem_max) then
  --     --   addr_mem <= (others => '0');
  --     -- else
  --       addr_mem <= i_z;
  --     -- end if;
  --   end process;

  --   DT2R : process(clk,rst)

  --   begin
  --     if rising_edge(clk) then
  --       if rst= '1' then
  --         -- o_tube_radius <= (others => '0');
  --         o_data_valid <= '0';
  --       else
  --         o_data_valid <= int_data_valid;
  --         if(int_data_valid = '1') then
  --           window <= mem_rom(to_integer(i_z));
  --         end if;
  --       end if;
  --     end if ;
  --   end process;

  --   WC : for il in 5 downto 0 generate
  --     SLC_Window(il).lo <= to_unsigned(window(il)(0),MDT_TUBE_LEN);
  --     SLC_Window(il).hi <= to_unsigned(window(il)(1),MDT_TUBE_LEN);
  --   end generate;

  --   o_SLC_Window_v <= vectorify(SLC_Window);

  -- end generate;


end architecture beh;