library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library hal;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;

entity felix_decoder is
  generic(
    -- specify which bit of 224 corresponds to what field
    felix_bcr_bit    : integer := 0;
    felix_ocr_bit    : integer := 1;
    felix_ecr_bit    : integer := 2;
    felix_l0a_bit    : integer := 3;
    felix_l1a_bit    : integer := 4
    );
    port(
      clock          : in std_logic;
      reset          : in std_logic;
      valid_o        : out std_logic;

      -- data from LPGBTs
      lpgbt_uplink_data : in lpgbt_uplink_data_rt;

      l0mdt_ttc : out l0mdt_ttc_rt

      );
end felix_decoder;

architecture behavioral of felix_decoder is
begin
  -- TODO: add some injector, local control, bunch counter, etc... steal from somewhere if possible
  l0mdt_ttc.bcr <= lpgbt_uplink_data.data(felix_bcr_bit);
  l0mdt_ttc.ocr <= lpgbt_uplink_data.data(felix_ocr_bit);
  l0mdt_ttc.ecr <= lpgbt_uplink_data.data(felix_ecr_bit);
  l0mdt_ttc.l0a <= lpgbt_uplink_data.data(felix_l0a_bit);
  l0mdt_ttc.l1a <= lpgbt_uplink_data.data(felix_l1a_bit);
  valid_o       <= lpgbt_uplink_data.valid;

end behavioral;
