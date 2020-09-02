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
    ttc_mgt_data_i : in std_logic_vector(31 downto 0);

    strobe_pipeline : in std_logic;
    strobe_320      : in std_logic;

    l0mdt_ttc_40m      : out l0mdt_ttc_rt;
    l0mdt_ttc_320m     : out l0mdt_ttc_rt;
    l0mdt_ttc_pipeline : out l0mdt_ttc_rt

    );
end felix_decoder;

architecture behavioral of felix_decoder is
  signal l0mdt_ttc : l0mdt_ttc_rt;

    signal lpgbt_uplink_data : lpgbt_uplink_data_rt;
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
    return structify(vectorify(ttc) and repeat(gate, L0MDT_TTC_LEN));
  end gate_ttc;
begin


    --uplink_inst : entity lpgbt_fpga.lpgbtfpga_uplink

    --  generic map (
    --    datarate                  => g_UPLINK_DATARATE,
    --    fec                       => g_UPLINK_FEC,
    --    c_multicyledelay          => g_UPLINK_MULTICYCLE_DELAY,
    --    c_clockratio              => g_UPLINK_CLOCK_RATIO,
    --    c_mgtwordwidth            => g_UPLINK_WORD_WIDTH,
    --    c_allowedfalseheader      => g_UPLINK_ALLOWED_FALSE_HEADER,
    --    c_allowedfalseheaderovern => g_UPLINK_ALLOWED_FALSE_HEADER_OVERN,
    --    c_requiredtrueheader      => g_UPLINK_REQUIRED_TRUE_HEADER,
    --    c_bitslip_mindly          => g_UPLINK_BITSLIP_MINDLY,
    --    c_bitslip_waitdly         => g_UPLINK_BITSLIP_WAITDLY
    --    )

    --  port map (
    --    clk_freerunningclk_i       => std_logic0,  -- not used since reset on even feature is
    --                                               -- disabled in frame aligner
    --    uplinkclk_i                => uplink_clk,
    --    uplinkrst_n_i              => uplink_reset,
    --    mgt_word_o                 => mgt_data,
    --    bypassinterleaver_i        => g_LPGBT_BYPASS_INTERLEAVER,
    --    bypassfecencoder_i         => g_LPGBT_BYPASS_FEC,
    --    bypassscrambler_i          => g_LPGBT_BYPASS_SCRAMBLER,
    --    uplinkclkouten_o           => uplink_data.valid,
    --    userdata_o(223 downto 0)   => uplink_data.data,
    --    userdata_o(229 downto 224) => unused_bits,
    --    ecdata_o                   => uplink_data.ec,
    --    icdata_o                   => uplink_data.ic,
    --    mgt_bitslipctrl_o          => bitslip,
    --    datacorrected_o            => datacorrected,
    --    iccorrected_o              => iccorrected,
    --    eccorrected_o              => eccorrected,
    --    rdy_o                      => uplink_ready(I)
    --    );








  process (clock)
  begin
    if (rising_edge(clock)) then
      valid_o <= lpgbt_uplink_data.valid;
      if (lpgbt_uplink_data.valid) then

        -- TODO: add some injector, local control, bunch counter, etc... steal from somewhere if possible
        l0mdt_ttc.bcr <= lpgbt_uplink_data.data(felix_bcr_bit);
        l0mdt_ttc.ocr <= lpgbt_uplink_data.data(felix_ocr_bit);
        l0mdt_ttc.ecr <= lpgbt_uplink_data.data(felix_ecr_bit);
        l0mdt_ttc.l0a <= lpgbt_uplink_data.data(felix_l0a_bit);
        l0mdt_ttc.l1a <= lpgbt_uplink_data.data(felix_l1a_bit);

        -- create copies of ttc signals gated with different clocks
        l0mdt_ttc_40m      <= l0mdt_ttc;
        l0mdt_ttc_320m     <= gate_ttc(l0mdt_ttc, strobe_320);
        l0mdt_ttc_pipeline <= gate_ttc(l0mdt_ttc, strobe_pipeline);

      end if;
    end if;
  end process;

end behavioral;
