-- Sector Logic Link Wrapper
--
-- This module is a wrapper around the sector logic tx/rx ips
-- (provided by Yasu, and included as a submodule)
--
-- It is responsible for
--
--  1. instantiating the tx/rx blocks
--  2. doing type conversion between logic vectors and mdt records
--  3. clock domain crossing from 240 --> 320 MHz
--
-- The SL data format is documented in:
--
--    https://cds.cern.ch/record/2703707/files/ATL-COM-DAQ-2019-207.pdf?
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
-- use shared_lib.sl2mdt_constants_pkg.all;
-- use shared_lib.sl2mdt_dataformats_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library work;
use work.system_types_pkg.all;
use work.sector_logic_pkg.all;
use work.constants_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;

library sl;

library ctrl_lib;
use ctrl_lib.hal_ctrl.all;

entity sector_logic_link_wrapper is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD   : integer := 4
    );
  port(

    tx_clk : in std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
    rx_clk : in std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    clk40          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- 32 bits / usrclk from mgt
    sl_rx_mgt_word_array_i : in  std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
    -- 32 bits / usrclk to mgt
    sl_tx_mgt_word_array_o : out std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- Data from SL
    sl_data_o : out slc_rx_avt (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    -- Data to SL
    mtc_i : in mtc_out_avt(c_NUM_MTC-1 downto 0);

    -- from mgt
    sl_rx_ctrl_i : in sl_rx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    sl_rx_init_done_i : in std_logic;

    -- to mgt
    sl_tx_ctrl_o : out sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    sl_rx_slide_o : out std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    sl_re_channel_o : out std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    ctrl : in HAL_SL_CTRL_t;
    mon  : out HAL_SL_MON_t

    );
end sector_logic_link_wrapper;

architecture Behavioral of sector_logic_link_wrapper is

  -- Received packet from SL

  signal sl_rx_data, sl_rx_data_pre_cdc  : sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_data, sl_tx_data_post_cdc : sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

  -- some values in the sector logic data format are represented as
  -- "signed magnitude" numbers, in which the most significant bit is a sign bit and the remaining bits
  -- are the magnitude
  -- c.f. https://en.wikipedia.org/wiki/Signed_number_representations#Signed_magnitude_representation
  -- the l0mdt firmware uses two's complement internally, so this function was written to
  -- convert between the two representations

  function signed_mag_to_signed (data : std_logic_vector) return signed is
    alias sv                 : std_logic_vector (data'length-1 downto 0) is data;
    variable twos_complement : std_logic_vector(data'length-1 downto 0);
    variable sign            : std_logic;
    variable mag             : std_logic_vector (data'length-2 downto 0);
    variable result          : signed(data'length-1 downto 0);
  begin
    sign := sv(data'length-1);
    mag  := sv(data'length-2 downto 0);
    if (or_reduce(sv) = '0') then
      twos_complement := (others => '0');
    elsif (sign = '1') then
      twos_complement := ('0' & mag);
    else
      twos_complement := ('1' & std_logic_vector(unsigned(not mag) + 1));
    end if;
    result := signed(twos_complement);
    return result;
  end;
begin

  --------------------------------------------------------------------------------
  -- TX Dataformat Mapping
  --------------------------------------------------------------------------------

  tx_assignment : for I in 0 to c_NUM_SECTOR_LOGIC_OUTPUTS-1 generate
    signal header  : std_logic_vector (31 downto 0);
    signal trailer : std_logic_vector (31 downto 0);
    signal data    : std_logic_vector (127 downto 0);
    signal mtc     : mtc2sl_rt;

    constant mgt_idx : integer := get_sl_mgt_num(I, c_MGT_MAP);

  begin

    mgt_tag : for MGT_NUM in mgt_idx to mgt_idx generate
    begin

      -- TODO: Check if mtc mapping is the same as Sector Logic, to avoid hard-coded ranges
      --       
      sl : if (I < c_NUM_MTC) generate

        mtc <= convert(mtc_i(I),mtc);

        header  <= convert(mtc.common.header,header);
        trailer <= convert(mtc.common.trailer,trailer);

        data(2 downto 0)    <= std_logic_vector(mtc.common.slcid);
        data(3)             <= mtc.common.tcsent;
        data(17 downto 4)   <= std_logic_vector(mtc.common.poseta);
        data(26 downto 18)  <= std_logic_vector(mtc.common.posphi);
        data(34 downto 27)  <= std_logic_vector(mtc.common.sl_pt);
        data(38 downto 35)  <= std_logic_vector(mtc.common.sl_ptthresh);
        data(39)            <= mtc.common.sl_charge;
        data(42 downto 40)  <= mtc.common.cointype;
        data(56 downto 43)  <= std_logic_vector(mtc.mdt_eta);
        data(64 downto 57)  <= std_logic_vector(mtc.mdt_pt);
        data(68 downto 65)  <= std_logic_vector(mtc.mdt_ptthresh);
        data(69)            <= mtc.mdt_charge;
        data(73 downto 70)  <= mtc.mdt_procflags;
        data(75 downto 74)  <= std_logic_vector(mtc.mdt_nsegments);
        data(78 downto 76)  <= mtc.mdt_quality;
        data(127 downto 79) <= mtc.m_reserved;

        sl_tx_data(I).valid                <= mtc.data_valid;
        sl_tx_data(I).data(31 downto 0)    <= header;
        sl_tx_data(I).data(159 downto 32)  <= data;
        sl_tx_data(I).data(191 downto 160) <= trailer;

      end generate;

      -- drive disconnected SL links with all zero
      nosl : if (I >= c_NUM_MTC) generate
        sl_tx_data(I).data  <= (others => '0');
        sl_tx_data(I).valid <= '0';
      end generate;

    end generate;

  end generate;

  --------------------------------------------------------------------------------
  -- RX Dataformat Mapping
  --------------------------------------------------------------------------------

  rx_assignment : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate

    -- intermediate signals to remap
    signal slc_barrel_specific : slc_barrel_rt;
    signal slc_endcap_specific : slc_endcap_rt;
    signal header              : std_logic_vector (31 downto 0);
    signal trailer             : std_logic_vector (31 downto 0);
    signal data                : std_logic_vector (127 downto 0);
    signal sl_data             : slc_rx_rt;
    constant station           : station_t := ENDCAP;

    constant mgt_idx : integer := get_sl_mgt_num(I, c_MGT_MAP);

  begin

    mgt_tag : for MGT_NUM in mgt_idx to mgt_idx generate
    begin

      process (pipeline_clock) is
      begin
        if (rising_edge(pipeline_clock)) then
          sl_data_o(I) <= convert(sl_data,sl_data_o(I));
        end if;
      end process;

      header  <= sl_rx_data(I).data(31 downto 0);
      data    <= sl_rx_data(I).data(159 downto 32);
      trailer <= sl_rx_data(I).data(191 downto 160);

      sl_data.common.header  <= convert(header,sl_data.common.header);
      sl_data.common.trailer <= convert(trailer,sl_data.common.trailer);

      sl_data.common.slcid       <= unsigned(data(2 downto 0));
      sl_data.common.tcsent      <= data(3);
      sl_data.common.poseta      <= signed(data(17 downto 4));
      sl_data.common.posphi      <= unsigned(data(26 downto 18));
      sl_data.common.sl_pt       <= unsigned(data(34 downto 27));
      sl_data.common.sl_ptthresh <= unsigned(data(38 downto 35));
      sl_data.common.sl_charge   <= data(39);
      sl_data.common.cointype    <= data(42 downto 40);

      slc_barrel_specific.rpc0_posz <= signed(data(54 downto 43));
      slc_barrel_specific.rpc1_posz <= signed(data(66 downto 55));
      slc_barrel_specific.rpc2_posz <= signed(data(78 downto 67));
      slc_barrel_specific.rpc3_posz <= signed(data(90 downto 79));
      -- slc_barrel_specific.b_reserved <= data(127 downto 91);

      slc_endcap_specific.seg_angdtheta    <= signed_mag_to_signed(data(49 downto 43));
      slc_endcap_specific.seg_angdphi      <= signed_mag_to_signed(data(53 downto 50));
      slc_endcap_specific.nswseg_poseta    <= unsigned(data(67 downto 54));
      slc_endcap_specific.nswseg_posphi    <= unsigned(data(75 downto 68));
      slc_endcap_specific.nswseg_angdtheta <= signed(data(80 downto 76));
      slc_endcap_specific.nswseg_mon       <= data(81);
      slc_endcap_specific.e_reserved       <= data(90 downto 82);

      barrel_spec_gen : if (station = BARREL) generate
        sl_data.specific <= convert(slc_barrel_specific,sl_data.specific);
      end generate;

      endcap_spec_gen : if (station = ENDCAP) generate
        sl_data.specific <= convert(slc_endcap_specific,sl_data.specific);
      end generate;

      sl_data.data_valid <= sl_rx_data(I).valid;

    end generate;
  end generate;

  sl_gen : for I in 0 to c_NUM_MGTS-1 generate
    constant mgt_idx : integer := get_sl_mgt_num(I, c_MGT_MAP);
  begin

    mgt_tag : for MGT_NUM in mgt_idx to mgt_idx generate
    begin

      --------------------------------------------------------------------------------
      -- TX Encoder Instantiation
      --------------------------------------------------------------------------------

      tx_gen : if (sl_idx_array(I) /= -1) generate
        constant idx   : integer := sl_idx_array(I);
        signal txctrl0 : std_logic_vector (3 downto 0);
        signal txctrl1 : std_logic_vector (3 downto 0);
        signal txctrl2 : std_logic_vector (3 downto 0);
        -- TX pattern generator
        signal test_tx_packet_valid_i : std_logic;
        signal test_packet_userdata_tx_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
        signal test_packet_txctrl0_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal test_packet_txctrl1_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal test_packet_txctrl2_i : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
    
        signal tx_packet_valid_mux : std_logic;
        signal packet_userdata_tx_mux : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
        signal packet_txctrl0_mux : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal packet_txctrl1_mux : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal packet_txctrl2_mux : std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);

        signal mux_ctrl : std_logic := '1';
      begin

        assert false report "generating SL TX #" & integer'image(idx) & " on MGT#"
          & integer'image(I) severity note;
          patgen_inst : entity sl.tx_test_pattern_generator2
          generic map (
            NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
            NUMBER_OF_BYTES_IN_A_WORD => NUMBER_OF_BYTES_IN_A_WORD)
          port map (
            reset           => reset,
            tx_usrclk2      => tx_clk(idx),
            packet_valid    => test_tx_packet_valid_i,
            packet_userdata => test_packet_userdata_tx_i,
            packet_txctrl0  => test_packet_txctrl0_i,
            packet_txctrl1  => test_packet_txctrl1_i,
            packet_txctrl2  => test_packet_txctrl2_i);
    
        -- select if we want to output a test parttern or not with TX_ENA_TEST_PATTERN
        tx_packet_valid_mux     <= sl_tx_data_post_cdc(idx).valid   when mux_ctrl else test_tx_packet_valid_i;
        packet_userdata_tx_mux  <= sl_tx_data_post_cdc(idx).data    when mux_ctrl else test_packet_userdata_tx_i;
        packet_txctrl0_mux      <= std_logic_vector'(x"000000")     when mux_ctrl else test_packet_txctrl0_i;
        packet_txctrl1_mux      <= std_logic_vector'(x"000000")     when mux_ctrl else test_packet_txctrl1_i;
        packet_txctrl2_mux      <= std_logic_vector'(x"100000")     when mux_ctrl else test_packet_txctrl2_i;

        sector_logic_tx_packet_former_inst : entity sl.sector_logic_tx_packet_former
          generic map (
            NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
            NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
          port map (
            tx_usrclk2      => tx_clk(idx),
            userdata_tx     => sl_tx_mgt_word_array_o(idx),
            txctrl0         => txctrl0,                       -- 4 bit to mgt
            txctrl1         => txctrl1,                       -- 4 bit to mgt
            txctrl2         => txctrl2,                       -- 4 bit to mgt
            packet_userdata => packet_userdata_tx_mux,
            packet_valid    => tx_packet_valid_mux,
            packet_txctrl0  => packet_txctrl0_mux,  --
            packet_txctrl1  => packet_txctrl1_mux,  --
            packet_txctrl2  => packet_txctrl2_mux   --
            );

        sl_tx_ctrl_o(idx).ctrl0 <= x"000" & txctrl0;
        sl_tx_ctrl_o(idx).ctrl1 <= x"000" & txctrl1;
        sl_tx_ctrl_o(idx).ctrl2 <= x"0" & txctrl2;

        -- sync from pipeline clock-----------------------------------------------------
        sync_sl_tx : entity work.sync_cdc
          generic map (
            WIDTH    => sl_tx_data_post_cdc(idx).data'length,
            N_STAGES => 2)
          port map (
            clk_i   => tx_clk(idx),
            valid_i => sl_tx_data(idx).valid,
            data_i  => sl_tx_data(idx).data,
            valid_o => sl_tx_data_post_cdc(idx).valid,
            data_o  => sl_tx_data_post_cdc(idx).data
            );

      end generate;

      --------------------------------------------------------------------------------
      -- RX Decoder Instantiation
      --------------------------------------------------------------------------------

      rx_gen : if (sl_idx_array(I) /= -1) generate
        constant idx           : integer := sl_idx_array(I);
        signal dec_rxctrl0     : std_logic_vector (NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal dec_rxctrl2     : std_logic_vector (NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal dec_userdata    : std_logic_vector (31 downto 0);
        signal rxctrl0         : std_logic_vector (3 downto 0);
        signal rxctrl1         : std_logic_vector (3 downto 0);
        signal sl_pre_cdc_vec  : std_logic_vector (sl_rx_data_pre_cdc(idx).data'length + 1 downto 0);
        signal sl_post_cdc_vec : std_logic_vector (sl_rx_data_pre_cdc(idx).data'length + 1 downto 0);
        signal packet_rxctrl0_i: std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal packet_rxctrl1_i: std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal packet_rxctrl2_i: std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
        signal packet_rxctrl3_i: std_logic_vector(NUMBER_OF_WORDS_IN_A_PACKET*NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      begin

        assert false report "generating SL RX #" & integer'image(idx) & " on MGT#"
          & integer'image(I) severity note;

        rxctrl0 <= sl_rx_ctrl_i(idx).ctrl0(3 downto 0);
        rxctrl1 <= sl_rx_ctrl_i(idx).ctrl1(3 downto 0);

        -- decode 8b10b words
        rx_comma_detector_inst : entity sl.rx_comma_detection
          generic map (
            NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
            NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
          port map (
            reset               => reset OR ctrl.reset.rx_comma,
            clk_in              => rx_clk(idx),
            rx_data_in          => sl_rx_mgt_word_array_i(idx),  -- 32 bit from mgt
            rx_ctrl0_in         => rxctrl0,                      -- 4 bit from mgt
            rx_ctrl1_in         => rxctrl1,                      -- 4 bit from mgt
            decoded_data_out    => dec_userdata,                 -- 32 bit to packet former
            decoded_charisk_out => dec_rxctrl0,                  -- 4 bit to packet former
            decoded_iscomma_out => dec_rxctrl2,                  -- 4 bit to packet former
            comma_pulse_out     => open,                         -- not used in my-sl-gty
            lock_out            => Mon.RX_COMMA_LOCK(idx),                         -- not used in my-sl-gty
            rxslide_out         => sl_rx_slide_o(idx),           -- 1 bit to mgt
            rereset_out         => sl_re_channel_o(idx),         -- 1 bit to mgt
            rx_init_done_in     => sl_rx_init_done_i,            -- 1 bit from mgt
            even_slides_in      => '0'                           -- 1 bit setting
            );

        -- form 192 bit packets
        sector_logic_rx_packet_former_inst : entity sl.sector_logic_rx_packet_former

          generic map (
            NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
            NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
          port map (
            reset => reset OR ctrl.reset.rx_packet_former,

            rx_usrclk2 => rx_clk(idx),

            userdata_rx => dec_userdata,

            -- 3 downto 0, from rx_comma_detection
            rxctrl0 => dec_rxctrl0,     -- charisk
            rxctrl1 => (others => '0'),
            rxctrl2 => dec_rxctrl2,     -- rxctrl2(0) == is_comma
            rxctrl3 => (others => '0'),

            -- 23 downto 0
            packet_rxctrl0 => packet_rxctrl0_i,     -- my-sl-gty just connects to led sump
            packet_rxctrl1 => packet_rxctrl1_i,     -- my-sl-gty just connects to led sump
            packet_rxctrl2 => packet_rxctrl2_i,     -- my-sl-gty just connects to led sump
            packet_rxctrl3 => packet_rxctrl3_i,     -- my-sl-gty just connects to led sump

            packet_userdata       => sl_rx_data_pre_cdc(idx).data,
            packet_locked         => sl_rx_data_pre_cdc(idx).locked,
            packet_valid          => sl_rx_data_pre_cdc(idx).valid,
            packet_error_detected => sl_rx_data_pre_cdc(idx).err

            );

          Mon.RX_COMMA_LOCK(idx) <= sl_rx_data_pre_cdc(idx).locked;

          rx_test_pattern_checker_inst : entity sl.rx_test_pattern_checker
          generic map(
            NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
            NUMBER_OF_BYTES_IN_A_WORD => NUMBER_OF_BYTES_IN_A_WORD)        
          port map(
            reset         => reset OR ctrl.reset.rx_test_pattern,
            rx_usrclk2    => rx_clk(idx),

            packet_rxctrl0 => packet_rxctrl0_i,
            packet_rxctrl1 => packet_rxctrl1_i,
            packet_rxctrl2 => packet_rxctrl2_i,
            packet_rxctrl3 => packet_rxctrl3_i,

            packet_userdata   => sl_rx_data_pre_cdc(idx).data,
            packet_locked     => sl_rx_data_pre_cdc(idx).locked,
            packet_valid      => sl_rx_data_pre_cdc(idx).valid,

            error_counter_out => mon.sl_test.sl_test(idx).error_counter,                -- to be connected to a register
            word_counter_out (63 downto 32) => mon.sl_test.sl_test(idx).WORD_COUNTER_1,
            word_counter_out (31 downto  0) => mon.sl_test.sl_test(idx).WORD_COUNTER_0);               -- to be connected to a register
    
        --------------------------------------------------------------------------------
        -- RX Clock Domain Crossing
        --------------------------------------------------------------------------------

        -- convert to a std_logic_vector
        sl_pre_cdc_vec <= sl_rx_data_pre_cdc(idx).data &
                          sl_rx_data_pre_cdc(idx).err & sl_rx_data_pre_cdc(idx).locked;

        sync_sl_rx_data : entity work.sync_cdc
          generic map (
            WIDTH    => 1 + 1 + sl_rx_data_pre_cdc(idx).data'length,
            N_STAGES => 2)
          port map (
            clk_i   => pipeline_clock,
            valid_i => sl_rx_data_pre_cdc(idx).valid,
            data_i  => sl_pre_cdc_vec,
            valid_o => sl_rx_data(idx).valid,
            data_o  => sl_post_cdc_vec
            );

        sl_rx_data(idx).data   <= sl_post_cdc_vec(sl_rx_data(idx).data'length+2-1 downto 2);
        sl_rx_data(idx).err    <= sl_post_cdc_vec(1);
        sl_rx_data(idx).locked <= sl_post_cdc_vec(0);

      end generate;
    end generate;
  end generate;

  --------------------------------------------------------------------------------
  -- Asserts
  --------------------------------------------------------------------------------

  -- unit test on the signed magnitude conversion function
  assert -3 = to_integer(signed_mag_to_signed("011"))
    report "failure in signed magnutude conversion of -3 get="
    & integer'image (to_integer(signed_mag_to_signed("011"))) severity error;
  assert -2 = to_integer(signed_mag_to_signed("010"))
    report "failure in signed magnutude conversion of -2 get="
    & integer'image (to_integer(signed_mag_to_signed("010"))) severity error;
  assert -1 = to_integer(signed_mag_to_signed("001"))
    report "failure in signed magnutude conversion of -1 get="
    & integer'image (to_integer(signed_mag_to_signed("001"))) severity error;
  assert 0 = to_integer(signed_mag_to_signed("000"))
    report "failure in signed magnutude conversion of  0 get="
    & integer'image (to_integer(signed_mag_to_signed("000"))) severity error;
  assert 0 = to_integer(signed_mag_to_signed("100"))
    report "failure in signed magnutude conversion of  0 get="
    & integer'image (to_integer(signed_mag_to_signed("100"))) severity error;
  assert 1 = to_integer(signed_mag_to_signed("101"))
    report "failure in signed magnutude conversion of  1 get="
    & integer'image (to_integer(signed_mag_to_signed("101"))) severity error;
  assert 2 = to_integer(signed_mag_to_signed("110"))
    report "failure in signed magnutude conversion of  2 get="
    & integer'image (to_integer(signed_mag_to_signed("110"))) severity error;
  assert 3 = to_integer(signed_mag_to_signed("111"))
    report "failure in signed magnutude conversion of  3 get="
    & integer'image (to_integer(signed_mag_to_signed("111"))) severity error;

end Behavioral;
