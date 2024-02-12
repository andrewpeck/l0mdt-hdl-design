--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor Hit Matching
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      07/02/2020  0.1     creation
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

-- use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
-- use hp_lib.hp_custom_pkg.all;


entity hp_matching is
  generic(
    g_STATION_RADIUS     : integer
    -- num_layers  : integer;
    -- package hp_pkg is new hp_lib.hp_pkg generic map (num_layers => num_layers)
  );
  port (
    clk                 : in std_logic;
    
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- time_offset         : in unsigned(7 downto 0);
    -- RoI_size            : in unsigned(7 downto 0);
    -- SLc
    -- i_SLC_Window        : in hp_win_tubes_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    i_SLC_Window        : in hp_win_tubes_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);--(hp_win_tubes_rt'w -1 downto 0);

    -- i_SLc_rpc_z         : in SLc_zpos_st;
    i_SLc_BCID          : in unsigned(BCID_LEN-1 downto 0);
    -- i_SLc_z0            : in SLc_zpos_st;
    -- i_SLc_Rho0          : in SLc_zpos_st;
    -- MDT hit
    i_mdt_layer         : in unsigned(MDT_LAYER_LEN -1 downto 0);
    i_mdt_tube          : in unsigned(MDT_TUBE_LEN - 1 downto 0);
    i_mdt_time_real     : in unsigned(MDT_TIME_LEN-1 downto 0);
    i_data_valid         : in std_logic;
    -- to Segment finder
    o_hit_valid         : out std_logic;
    o_data_valid        : out std_logic
  );
end entity hp_matching;

architecture beh of hp_matching is

  attribute keep_hierarchy : string;
  attribute keep_hierarchy of beh : architecture is "yes";

  constant TIME_LOW_ADJUST : integer := 10;--unsigned(MDT_TIME_LEN-1 downto 0) := to_unsigned(10,MDT_TIME_LEN);

  constant c_HP_HITM_NUM_LAYERS : integer := get_num_layers(g_STATION_RADIUS);

  -- signal tube_high_limit, tube_low_limit : unsigned(MDT_TUBE_LEN - 1 downto 0);
  -- signal trLUT_valid : std_logic;

  signal time_lo_aux : integer;

  signal time_high_limit, time_low_limit : unsigned(MDT_TIME_LEN-1 downto 0);

  signal space_valid,time_valid,pl_data_valid : std_logic;

  signal Roi_window : hp_win_tubes_art(get_num_layers(g_STATION_RADIUS) -1 downto 0);

begin

  loop1 : for li in c_HP_HITM_NUM_LAYERS - 1 downto 0 generate
    Roi_window(li) <= convert(i_SLC_Window(li),Roi_window(li));
  end generate ; -- loop1

  time_high_limit <= resize((i_SLc_BCID & "00000") + to_unsigned(HP_BCID_OFFSET_TIME_078res,i_SLc_BCID'length + 5),time_high_limit'length);

  time_lo_aux <= to_integer(i_SLc_BCID & "00000");
  -- t_lo: if 0 < time_lo_aux - TIME_LOW_ADJUST generate
  --   time_low_limit <= resize(i_SLc_BCID & "00000" ,time_low_limit'length); -- BCID 25ns res to 0.78 ns res
  -- else generate
  --   time_low_limit <= resize(i_SLc_BCID & "00000" ,time_low_limit'length); -- BCID 25ns res to 0.78 ns res
  -- end generate;
  time_low_limit <= resize(i_SLc_BCID & "00000" ,time_low_limit'length); -- BCID 25ns res to 0.78 ns res

  -- o_hit_valid <= space_valid and time_valid;

  -- time_low_limit <= to_unsigned( to_integer(i_SLc_BCID) ,17); 
  -- time_high_limit <=to_unsigned( to_integer(i_SLc_BCID) + to_integer(time_offset),17); 

  validation_proc : process(clk,rst)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        --space
        space_valid <= '0';
        -- time
        time_valid <= '0';
        o_data_valid <= '0';
        o_hit_valid <= '0';
      else

        if glob_en = '1' then

          o_hit_valid <= space_valid and time_valid;
          o_data_valid <= pl_data_valid;
          pl_data_valid <= i_data_valid;

          if i_data_valid = '1' then
            -- space
            if i_mdt_tube >= Roi_window(to_integer( i_mdt_layer)).lo and i_mdt_tube <= Roi_window(to_integer( i_mdt_layer)).hi then
              space_valid <= '1';
            else
              space_valid <= '0';
            end if;
            -- time
            if time_lo_aux > TIME_LOW_ADJUST then
              if i_mdt_time_real <= time_high_limit and to_integer(i_mdt_time_real) >= (time_lo_aux - TIME_LOW_ADJUST) then
                time_valid <= '1';
              else
                time_valid <= '0';
              end if;
            else
              if i_mdt_time_real <= time_high_limit and i_mdt_time_real >= 0 then
                time_valid <= '1';
              else
                time_valid <= '0';
              end if;
            end if;
            --valid
            -- o_data_valid <= trLUT_valid;
          else
            space_valid <= '0';
            time_valid <= '0';
          end if;
        else
          o_data_valid <= '0';
          space_valid <= '0';
          time_valid <= '0';

        end if;
      end if;
    end if;
  end process;
    
end beh;

--------------------------------------------------------------------------------
--  Project     : ATLAS L0MDT Trigger 
--  Module      : Hit Processor Hit Matching
--  SubModule   : Tube Range LUT
--  Description :
--
--------------------------------------------------------------------------------
--  Revisions:
--      07/02/2020  0.1     creation
--------------------------------------------------------------------------------



-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;

-- library l0mdt_lib;
-- use l0mdt_lib.common_pkg.all;

-- library hp_lib;
-- use hp_lib.cfg_pkg.all;
-- use hp_lib.hp_pkg.all;
-- use hp_lib.hp_trLUT_s3_pkg.all;

-- entity hp_m_trLUT is
--     generic(
--         g_STATION_RADIUS     : integer;
--         num_layers  : integer;
--         i_SLC_Window        : in SLc_window_at(num_layers -1 downto 0); 
--         tube_min    : integer;
--         tube_max    : integer
--     );
--     port (
--         clk                 : in std_logic;
--         
--         rst            : in std_logic;
--         glob_en             : in std_logic;
--         -- SLc
--         i_SLC_Window        : in SLc_window_at(num_layers -1 downto 0);
--         i_SLc_z_pos         : in SLc_zpos_st;
--         -- MDT hit
--         i_tdc_layer         : in unsigned(MDT_LAYER_LEN -1 downto 0);
--         -- i_tdc_valid         : in std_logic;
--         -- to matching
--         o_tube_high_limit   : out unsigned(MDT_TUBE_LEN - 1 downto 0);
--         o_tube_low_limit    : out unsigned(MDT_TUBE_LEN - 1 downto 0)
--         -- o_data_valid        : out std_logic
--     );
-- end entity hp_m_trLUT;

-- architecture beh of hp_m_trLUT is

--     type LUT_mem_t is array (0 to (tube_max - tube_min) - 1) of trLUT_layer_t;

--     signal LUT_mem : LUT_mem_t;
    
--     signal lut_index : integer;

-- begin

--     cpy_mem : for x in 0 to (tube_max - tube_min - 1)  generate
--         LUT_mem(x) <= trLUT_s3_mem(radius)(tube_min + x);
--     end generate;

--     lut_index <= abs(to_integer(i_SLc_z_pos))  - (tube_max - tube_min)/2;

--     LUT : process(clk,rst)

--     begin
--         if rst= '1' then
--             o_tube_high_limit <= (others => '0');
--             o_tube_low_limit <= (others => '0');
--             -- o_data_valid <= '0';
--         elsif rising_edge(clk) then
--             if lut_index < (tube_max - tube_min - 1) then
--                 o_tube_high_limit <= to_unsigned(LUT_mem(lut_index)(to_integer(i_tdc_layer))(1),MDT_TUBE_LEN);
--                 o_tube_low_limit <= to_unsigned(LUT_mem(lut_index)(to_integer(i_tdc_layer))(0),MDT_TUBE_LEN);
--                 -- o_data_valid <= i_tdc_valid;
--             else

--             end if;
--         end if ;
--     end process;
    
    
-- end beh;







