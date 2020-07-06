library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library hal;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;

entity felix_decoder is
  generic(
    -- specify which bit of 224 corresponds to what field
    felix_bcr_bit : integer := 0;
    felix_ocr_bit : integer := 1;
    felix_ecr_bit : integer := 2;
    felix_l0a_bit : integer := 3;
    felix_l1a_bit : integer := 4
    );
  port(
    clock   : in  std_logic;
    reset   : in  std_logic;
    valid_o : out std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data : in lpgbt_uplink_data_rt;

    strobe_pipeline : in std_logic;
    strobe_320 : in std_logic;

    l0mdt_ttc_40m      : out l0mdt_ttc_rt;
    l0mdt_ttc_320m     : out l0mdt_ttc_rt;
    l0mdt_ttc_pipeline : out l0mdt_ttc_rt

    );
end felix_decoder;

architecture behavioral of felix_decoder is
  signal l0mdt_ttc : l0mdt_ttc_rt;

  -- function to replicate a std_logic bit some number of times
  -- equivalent to verilog's built in {n{x}} operator
  function repeat(B : std_logic; N : integer) return std_logic_vector is
    variable result : std_logic_vector(1 to N);
  begin
    for i in 1 to N loop
      result(i) := B;
    end loop;
    return result;
  end;

  function gate_ttc (ttc : l0mdt_ttc_rt; gate : std_logic)
    return l0mdt_ttc_rt is
  begin
    return structify(vectorify(ttc) and repeat(gate,L0MDT_TTC_LEN));
  end gate_ttc;
begin

  -- TODO: add some injector, local control, bunch counter, etc... steal from somewhere if possible

  l0mdt_ttc.bcr <= lpgbt_uplink_data.data(felix_bcr_bit);
  l0mdt_ttc.ocr <= lpgbt_uplink_data.data(felix_ocr_bit);
  l0mdt_ttc.ecr <= lpgbt_uplink_data.data(felix_ecr_bit);
  l0mdt_ttc.l0a <= lpgbt_uplink_data.data(felix_l0a_bit);
  l0mdt_ttc.l1a <= lpgbt_uplink_data.data(felix_l1a_bit);

  valid_o <= lpgbt_uplink_data.valid;

  -- create copies of ttc signals gated with different clocks
  l0mdt_ttc_40m      <= l0mdt_ttc;
  l0mdt_ttc_320m     <= gate_ttc(l0mdt_ttc,strobe_320);
  l0mdt_ttc_pipeline <= gate_ttc(l0mdt_ttc,strobe_pipeline);

end behavioral;
