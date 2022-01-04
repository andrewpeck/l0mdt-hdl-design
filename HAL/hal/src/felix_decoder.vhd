-- TODO: add some injector, local control, bunch counter, etc... steal from somewhere if possible

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

library lpgbt_fpga;
use lpgbt_fpga.lpgbtfpga_package.all;

library hal;
use hal.lpgbt_pkg.all;
use hal.system_types_pkg.all;

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
    clock40  : in  std_logic;
    clock320 : in  std_logic;
    reset    : in  std_logic;
    valid_o  : out std_logic;

    -- data from LPGBTs
    ttc_mgt_data_i    : in  std_logic_vector(31 downto 0);
    ttc_mgt_bitslip_o : out std_logic;

    strobe_pipeline : in std_logic;
    strobe_320      : in std_logic;

    l0mdt_ttc_40m : out l0mdt_ttc_rt

    );
end felix_decoder;

architecture behavioral of felix_decoder is

  signal l0mdt_ttc, l0mdt_ttc_ff    : l0mdt_ttc_rt;
  attribute max_fanout              : string;
  attribute max_fanout of l0mdt_ttc : signal is "16";

  signal unused_bits : std_logic_vector (5 downto 0);

  signal uplink_ready : std_logic;
  signal uplink_data  : lpgbt_uplink_data_rt;

  -- function to replicate a std_logic bit some number of times
  -- equivalent to verilog's built in {n{x}} operator
  -- function repeat(B   : std_logic; N : integer) return std_logic_vector is
  --   variable result : std_logic_vector(1 to N);
  -- begin
  --   for i in 1 to N loop
  --     result(i) := B;
  --   end loop;
  --   return result;
  -- end;

  -- function gate_ttc (ttc : l0mdt_ttc_rt; gate : std_logic)
  --   return l0mdt_ttc_rt is
  -- begin
  --   return structify(vectorify(ttc) and repeat(gate, L0MDT_TTC_LEN));
  -- end gate_ttc;

begin

  felix_10_gbps_rx_inst : entity lpgbt_fpga.lpgbtfpga_uplink

    generic map (
      datarate                  => DATARATE_10G24,
      fec                       => FEC5,
      c_multicyledelay          => c_UPLINK_MULTICYCLE_DELAY,
      c_clockratio              => c_UPLINK_CLOCK_RATIO,
      c_mgtwordwidth            => c_UPLINK_WORD_WIDTH,
      c_allowedfalseheader      => c_UPLINK_ALLOWED_FALSE_HEADER,
      c_allowedfalseheaderovern => c_UPLINK_ALLOWED_FALSE_HEADER_OVERN,
      c_requiredtrueheader      => c_UPLINK_REQUIRED_TRUE_HEADER,
      c_bitslip_mindly          => c_UPLINK_BITSLIP_MINDLY,
      c_bitslip_waitdly         => c_UPLINK_BITSLIP_WAITDLY
      )

    port map (
      uplinkclk_i                => clock320,
      uplinkrst_n_i              => not reset,  -- TODO: axi
      mgt_word_i                 => ttc_mgt_data_i,
      bypassinterleaver_i        => c_BYPASS_INTERLEAVER,
      bypassfecencoder_i         => c_BYPASS_FEC,
      bypassscrambler_i          => c_BYPASS_SCRAMBLER,
      uplinkclkouten_o           => uplink_data.valid,
      userdata_o(223 downto 0)   => uplink_data.data,
      userdata_o(229 downto 224) => unused_bits,
      ecdata_o                   => uplink_data.ec,
      icdata_o                   => uplink_data.ic,
      mgt_bitslipctrl_o          => ttc_mgt_bitslip_o,
      datacorrected_o            => open,
      iccorrected_o              => open,
      eccorrected_o              => open,
      rdy_o                      => uplink_ready
      );


  process (clock320) is
  begin
    if (rising_edge(clock320)) then
      valid_o <= uplink_ready and uplink_data.valid;

      l0mdt_ttc.bcr <= uplink_data.data(felix_bcr_bit);
      l0mdt_ttc.ocr <= uplink_data.data(felix_ocr_bit);
      l0mdt_ttc.ecr <= uplink_data.data(felix_ecr_bit);
      l0mdt_ttc.l0a <= uplink_data.data(felix_l0a_bit);
      l0mdt_ttc.l1a <= uplink_data.data(felix_l1a_bit);

      l0mdt_ttc_ff <= l0mdt_ttc;

    end if;
  end process;

  process (clock40) is
  begin
    if (rising_edge(clock40)) then
      l0mdt_ttc_40m <= l0mdt_ttc_ff;
    end if;
  end process;

end behavioral;
