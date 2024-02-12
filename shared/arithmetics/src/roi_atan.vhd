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
  generic (
    g_input_len  : integer := 11;
    g_output_len : integer := 11
  );
  port (
    clk : in    std_logic;
    rst : in    std_logic;
    ena : in    std_logic;
    --
    i_slope : in    signed(g_input_len - 1 downto 0);
    i_dv    : in    std_logic;
    o_mbar  : out   std_logic_vector(g_output_len - 1 downto 0);
    o_dv    : out   std_logic
  );
end entity roi_atan;

architecture beh of roi_atan is

  signal int_data_valid : std_logic;
  signal addr_mem       : unsigned(ROI_ATAN_MEM_WIDTH - 1 downto 0);
  signal slope          : unsigned(ROI_ATAN_MEM_WIDTH - 1 downto 0);

  signal mem : roi_atan_lut_t(0 to ROM_ATAN_MAX_SIZE - 1) := ROI_ATAN_MEM;

  attribute rom_style : string;
  attribute rom_style of mem : signal is "distributed";

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

  mrad2slope : process (clk) is

  begin

    -- slope <= resize(when to_integer(unsigned(slope)) < 732387 else to_unsigned(732387,ATAN_SLOPE_LEN);

    if rising_edge(clk) then
      if (rst= '1') then
        o_mbar         <= (others => '0');
        addr_mem       <= (others => '0');
        int_data_valid <= '0';
        o_dv           <= '0';
      else

        if i_slope >= ROI_ATAN_MEM_MIN and to_integer(i_slope) <= ROI_ATAN_MEM_MAX then
          slope <= to_unsigned(to_integer(signed(i_slope)) - ROI_ATAN_MEM_MIN,ROI_ATAN_MEM_WIDTH);
        -- else
        end if; 

        if (ena = '1') then
          int_data_valid <= i_dv;
          if (i_dv = '1') then
            if i_slope >= ROI_ATAN_MEM_MIN and to_integer(i_slope) <= ROI_ATAN_MEM_MAX then
              addr_mem <= to_unsigned(to_integer(signed(i_slope)) - ROI_ATAN_MEM_MIN,ROI_ATAN_MEM_WIDTH);
            -- else
            end if; 
            
            -- addr_mem <= slope;

          end if;

          o_dv <= int_data_valid;
          if (int_data_valid = '1') then
            o_mbar <= std_logic_vector(to_unsigned(integer(mem(to_integer(addr_mem))), g_output_len));
          else
            o_mbar <= (others => '0');
          end if;
        else
          o_mbar <= (others => '0');
          o_dv   <= '0';
        end if;
      end if;
    end if;

  end process mrad2slope;

end architecture beh;
