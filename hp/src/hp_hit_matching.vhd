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

library l0mdt_lib;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.cfg_pkg.all;
use hp_lib.hp_pkg.all;
-- use hp_lib.hp_trLUT_s3_pkg.all;

entity hp_matching is
    generic(
        radius      : integer; 
        tube_min    : integer;
        tube_max    : integer
    );
    port (
        clk                 : in std_logic;
        -- Control
        Reset_b             : in std_logic;
        enable              : in std_logic;
        -- configuration
        time_offset         : in unsigned(7 downto 0);
        RoI_size            : in unsigned(7 downto 0);
        -- SLc
        i_SLc_z_pos         : in SLc_zpos_st;
        i_SLc_BCID          : in SLc_BCID_st;
        -- MDT hit
        i_tdc_layer         : in unsigned(mdt_layer_bits -1 downto 0);
        i_tdc_tube          : in unsigned(mdt_tube_bits - 1 downto 0);
        i_tdc_let0          : in mdt_time_le_st;
        -- i_tdc_valid         : in std_logic;
        -- to Segment finder
        o_hit_valid         : out std_logic
        -- o_data_valid        : out std_logic
    );
end entity hp_matching;

architecture beh of hp_matching is

    component hp_m_trLUT is
        generic(
            radius      : integer; 
            tube_min    : integer;
            tube_max    : integer
        );
        port (
            clk                 : in std_logic;
            -- Control
            Reset_b             : in std_logic;
            enable              : in std_logic;
            -- SLc
            i_SLc_z_pos         : in SLc_zpos_st;
            -- MDT hit
            i_tdc_layer         : in unsigned(mdt_layer_bits -1 downto 0);
            -- i_tdc_valid         : in std_logic;
            -- to Segment finder
            o_tube_high_limit   : out unsigned(mdt_tube_bits - 1 downto 0);
            o_tube_low_limit    : out unsigned(mdt_tube_bits - 1 downto 0)
            -- o_data_valid        : out std_logic
        );
    end component hp_m_trLUT;

    signal tube_high_limit, tube_low_limit : unsigned(mdt_tube_bits - 1 downto 0);
    signal trLUT_valid : std_logic;

    signal time_high_limit, time_low_limit : mdt_time_le_st;

    signal space_valid,time_valid : std_logic;

begin

    HP_HMTRLUT : hp_m_trLUT
    generic map(
        radius      => radius,
        tube_min    => tube_min,
        tube_max    => tube_max
    )
    port map(
        clk                 => clk,
        -- Control
        Reset_b             => Reset_b,
        enable              => enable,
        -- SLc
        i_SLc_z_pos         => i_SLc_z_pos,
        -- MDT hit
        i_tdc_layer         => i_tdc_layer,
        -- i_tdc_valid         => i_tdc_valid,
        -- to Segment finder
        o_tube_high_limit   => tube_high_limit,
        o_tube_low_limit    => tube_low_limit
        -- o_data_valid        => trLUT_valid
    );

    

    o_hit_valid <= space_valid and time_valid;

    time_low_limit <= (others => '0');
    time_high_limit <=to_unsigned( to_integer(i_SLc_BCID) + to_integer(time_offset),17); 

    validation_proc : process(clk,Reset_b)

    begin
        if not Reset_b then
            --space
            space_valid <= '0';
            -- time
            time_valid <= '0';
        elsif rising_edge(clk) then
            -- space
            if i_tdc_tube <= tube_high_limit and i_tdc_tube >= tube_low_limit then
                space_valid <= '1';
            end if;
            -- time
            if i_tdc_let0 <= time_high_limit and i_tdc_let0 >= time_low_limit then
                time_valid <= '1';
            end if;
            --valid
            -- o_data_valid <= trLUT_valid;
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



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library l0mdt_lib;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.cfg_pkg.all;
use hp_lib.hp_pkg.all;
use hp_lib.hp_trLUT_s3_pkg.all;

entity hp_m_trLUT is
    generic(
        radius      : integer; 
        tube_min    : integer;
        tube_max    : integer
    );
    port (
        clk                 : in std_logic;
        -- Control
        Reset_b             : in std_logic;
        enable              : in std_logic;
        -- SLc
        i_SLc_z_pos         : in SLc_zpos_st;
        -- MDT hit
        i_tdc_layer         : in unsigned(mdt_layer_bits -1 downto 0);
        -- i_tdc_valid         : in std_logic;
        -- to matching
        o_tube_high_limit   : out unsigned(mdt_tube_bits - 1 downto 0);
        o_tube_low_limit    : out unsigned(mdt_tube_bits - 1 downto 0)
        -- o_data_valid        : out std_logic
    );
end entity hp_m_trLUT;

architecture beh of hp_m_trLUT is

    type LUT_mem_t is array (0 to (tube_max - tube_min) - 1) of trLUT_layer_t;

    signal LUT_mem : LUT_mem_t;
    
    signal lut_index : integer;

begin

    cpy_mem : for x in 0 to (tube_max - tube_min - 1)  generate
        LUT_mem(x) <= trLUT_s3_mem(radius)(tube_min + x);
    end generate;

    lut_index <= abs(to_integer(i_SLc_z_pos))  - (tube_max - tube_min)/2;

    LUT : process(clk,Reset_b)

    begin
        if not Reset_b then
            o_tube_high_limit <= (others => '0');
            o_tube_low_limit <= (others => '0');
            -- o_data_valid <= '0';
        elsif rising_edge(clk) then
            if lut_index < (tube_max - tube_min - 1) then
                o_tube_high_limit <= to_unsigned(LUT_mem(lut_index)(to_integer(i_tdc_layer))(1),mdt_tube_bits);
                o_tube_low_limit <= to_unsigned(LUT_mem(lut_index)(to_integer(i_tdc_layer))(0),mdt_tube_bits);
                -- o_data_valid <= i_tdc_valid;
            else

            end if;
        end if ;
    end process;
    
    
end beh;







