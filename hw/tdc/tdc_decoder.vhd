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
    fiberid   : integer := -1;
    elinkid   : integer := -1;
    stationid : integer := -1
    );
  port(
    clock   : in  std_logic;
    reset   : in  std_logic;
    data    : in  std_logic_vector(15 downto 0);
    valid   : in  std_logic;
    tdc_hit : out TDCFORMAT_rt;
    );
end tdc_decoder;

architecture behavioral of tdc_decoder is

begin

  -- TODO add a real tdc decoder instead of loopback
  tdc_hit.tdc_r     <= tdc_2rf (data & data);
  tdc_hit.datavalid <= valid;

  -- constants
  tdc_hit.fiberid   <= std_logic_vector(to_unsigned(fiberid,   TDCFORMAT_FIBERID_LEN));
  tdc_hit.elinkid   <= std_logic_vector(to_unsigned(elinkid,   TDCFORMAT_ELINKID_LEN));
  tdc_hit.stationid <= std_logic_vector(to_unsigned(stationid, TDCFORMAT_STATIONID_LEN));

end behavioral;
