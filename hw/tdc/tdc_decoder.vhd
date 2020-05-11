library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library framework;
use framework.board_pkg.all;
use framework.board_pkg_common.all;
use framework.constants_pkg.all;
use framework.system_types_pkg.all;
use framework.lpgbt_pkg.all;

entity tdc_decoder is
  generic(
    fiberid : integer := -1;
    elinkid : integer := -1;
    legacy  : boolean := false
    );
  port(
    clock     : in  std_logic;                      -- 320 mhz clock
    reset     : in  std_logic;                      -- reset
    data_i    : in  std_logic_vector(15 downto 0);  -- 16 bits per bx
    valid_i   : in  std_logic;                      -- data valid flag (strobe 1of8 at 320 MHz )
    tdc_hit_o : out TDCPOLMUX_rt                    -- tdc hits out
    );
end tdc_decoder;

architecture behavioral of tdc_decoder is

begin

  tdc_gen : if (legacy = false) generate
    --assert false report " > Generating Legacy TDC Decoder #" & integer'image(idx) & " on MGT #"
    -- & integer'image(I) & " elink = " & integer'image(even_id) severity note;
    -- TODO add a real tdc decoder instead of loopback
    tdc_hit_o.tdc_r     <= tdc_2rf (data_i & data_i);
    tdc_hit_o.datavalid <= valid_i;

    -- constants
    tdc_hit_o.fiberid <= std_logic_vector(to_unsigned(fiberid, TDCPOLMUX_FIBERID_LEN));
    tdc_hit_o.elinkid <= std_logic_vector(to_unsigned(elinkid, TDCPOLMUX_ELINKID_LEN));
  end generate;

  legacy_tdc_gen : if (legacy = true) generate
    tdc_hit_o.tdc_r     <= tdc_2rf (data_i & data_i);
    tdc_hit_o.datavalid <= valid_i;

    -- constants
    tdc_hit_o.fiberid <= std_logic_vector(to_unsigned(fiberid, TDCPOLMUX_FIBERID_LEN));
    tdc_hit_o.elinkid <= std_logic_vector(to_unsigned(elinkid, TDCPOLMUX_ELINKID_LEN));
  end generate;
end behavioral;
