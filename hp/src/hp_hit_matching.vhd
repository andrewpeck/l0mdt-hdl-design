--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;


entity hp_matching is
  generic(
    radius      : integer
    -- num_layers  : integer;
    -- package hp_pkg is new hp_lib.hp_pkg generic map (num_layers => num_layers)
  );
  port (
    clk                 : in std_logic;
    
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    time_offset         : in unsigned(7 downto 0);
    -- RoI_size            : in unsigned(7 downto 0);
    -- SLc
    i_SLC_Window        : in hp_heg2hp_window_avt;
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
    o_hit_valid         : out std_logic
    -- o_data_valid        : out std_logic
  );
end entity hp_matching;

architecture beh of hp_matching is

  signal tube_high_limit, tube_low_limit : unsigned(MDT_TUBE_LEN - 1 downto 0);
  signal trLUT_valid : std_logic;

  signal time_high_limit, time_low_limit : unsigned(MDT_TIME_LEN-1 downto 0);

  signal space_valid,time_valid : std_logic;

  signal Roi_window : hp_heg2hp_window_at;

begin

  Roi_window <= structify(i_SLC_Window);

  time_high_limit <= to_unsigned(24,time_high_limit'length);
  time_low_limit <= to_unsigned(0,time_low_limit'length);

  o_hit_valid <= space_valid and time_valid;

  -- time_low_limit <= (others => '0');
  -- time_high_limit <=to_unsigned( to_integer(i_SLc_BCID) + to_integer(time_offset),17); 

  validation_proc : process(clk,rst)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        --space
        space_valid <= '0';
        -- time
        time_valid <= '0';
      else
        -- space
        if i_mdt_tube >= Roi_window(to_integer( i_mdt_layer)).lo and i_mdt_tube <= Roi_window(to_integer( i_mdt_layer)).hi then
          space_valid <= '1';
        end if;
        -- time
        if i_mdt_time_real <= time_high_limit and i_mdt_time_real >= time_low_limit then
          time_valid <= '1';
        end if;
        --valid
        -- o_data_valid <= trLUT_valid;
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
--         radius      : integer;
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







