--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: roi_atan.vhd
-- Module: <<moduleName>>
-- File PATH: /roi_atan.vhd
-- -----
-- File Created: Monday, 5th December 2022 8:52:26 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 6th February 2023 7:22:53 pm
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
use shared_lib.roi_atan_pkg.all;


entity roi_atan is
  generic(
    g_INPUT_LEN         : integer := 11;
    g_OUTPUT_LEN        : integer := 11
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena             : in std_logic;
    --
    i_slope             : in unsigned(g_INPUT_LEN-1 downto 0);
    i_dv                : in std_logic;
    o_mbar              : out unsigned(g_OUTPUT_LEN-1 downto 0);
    o_dv                : out std_logic
  );
end entity roi_atan;

architecture beh of roi_atan is

  signal int_data_valid : std_logic;
  signal addr_mem : unsigned(g_INPUT_LEN-1 downto 0);

  signal mem : roi_atan_lut_t(0 to ROM_ATAN_MAX_SIZE - 1) := ROI_ATAN_MEM;

  attribute ROM_STYLE : string;
  attribute ROM_STYLE of mem : signal is "distributed";

begin

  -- dv_guard : process(i_dv) begin
  --   int_data_valid <= i_dv;
  -- end process;

  -- mem_guard : process(i_slope) begin
  --   -- if ( to_integer(unsigned(i_chamber)) > 1570) then
  --   --   addr_mem <= (others => '0');
  --   -- else
  --     addr_mem <= i_slope;--(DT2R_LARGE_ADDR_LEN -1 downto 0);
  --   -- end if;
  -- end process;
  
  MRAD2SLOPE : process(clk)

  begin
    if rising_edge(clk) then
      if rst= '1' then
        o_mbar <= (others => '0');
        addr_mem <= (others => '0');
        int_data_valid <= '0';
        o_dv <= '0';
      else
        if ena = '1' then
          int_data_valid <= i_dv;
          if i_dv = '1' then
            addr_mem <= i_slope;
          end if;

          o_dv <= int_data_valid;
          if(int_data_valid = '1') then
            o_mbar <= to_unsigned(integer(mem(to_integer(addr_mem))),g_OUTPUT_LEN);
          else
            o_mbar <= (others => '0');
          end if;
        else
          o_mbar <= (others => '0');
          o_dv <= '0';
        end if;
      end if;
    end if ;
  end process;
  
  
end architecture beh;