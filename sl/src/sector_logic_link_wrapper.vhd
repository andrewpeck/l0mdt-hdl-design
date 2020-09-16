--
-- https://cds.cern.ch/record/2703707/files/ATL-COM-DAQ-2019-207.pdf?
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library IEEE;
use IEEE.math_real.all;

library sl;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
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

entity sector_logic_link_wrapper is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD   : integer := 4
    );
  port(

    clock : in std_logic;

    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- 32 bits / bx from mgt
    sl_rx_mgt_word_array_i : in  std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
    -- 32 bits / bx to mgt
    sl_tx_mgt_word_array_o : out std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- Data from SL
    sl_data_o : out slc_rx_bus_avt (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    -- Data to SL
    mtc_i : in mtc_out_bus_avt(c_NUM_MTC-1 downto 0);

    -- from mgt
    sl_rx_ctrl_i : in sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- to mgt
    sl_tx_ctrl_o : out sl_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    sl_rx_slide_o : out std_logic_vector (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0)

    );
end sector_logic_link_wrapper;

architecture Behavioral of sector_logic_link_wrapper is

  -- Received packet from SL
  signal sl_rx_data : sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_data : sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

  signal sl_rx_data_pre_cdc  : sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_data_post_cdc : sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

  attribute DONT_TOUCH                  : string;
  signal rx_reset_tree                  : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0) := (others => '1');
  attribute DONT_TOUCH of rx_reset_tree : signal is "true";
  --signal tx_reset_tree : std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0) := (others => '1');
  --attribute DONT_TOUCH of tx_reset_tree : signal is "true";

  function signed_mag_to_signed (data : std_logic_vector) return signed is
    alias sv                 : std_logic_vector (data'length-1 downto 0) is data;
    variable twos_complement : std_logic_vector(data'length-1 downto 0);
    variable sign            : std_logic;
    variable mag             : std_logic_vector (data'length-2 downto 0);
    variable result          : signed(data'length-1 downto 0);
  begin
    sign := sv(data'length-1);
    mag  := sv(data'length-2 downto 0);
    if (or_reduce(sv)='0') then
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

  rx_reset_fanout : process (clock) is
  begin  -- process reset_fanout
    if rising_edge(clock) then          -- rising clock edge
      rx_reset_tree <= (others => reset); -- TODO: connect to AXI
    end if;
  end process;

  -- unit test on this conversion function...
  assert -3=to_integer(signed_mag_to_signed("011"))
    report "failure in signed magnutude conversion of -3 get=" & integer'image (to_integer(signed_mag_to_signed("011"))) severity error;
  assert -2=to_integer(signed_mag_to_signed("010"))
    report "failure in signed magnutude conversion of -2 get=" & integer'image (to_integer(signed_mag_to_signed("010"))) severity error;
  assert -1=to_integer(signed_mag_to_signed("001"))
    report "failure in signed magnutude conversion of -1 get=" & integer'image (to_integer(signed_mag_to_signed("001"))) severity error;
  assert  0=to_integer(signed_mag_to_signed("000"))
    report "failure in signed magnutude conversion of  0 get=" & integer'image (to_integer(signed_mag_to_signed("000"))) severity error;
  assert  0=to_integer(signed_mag_to_signed("100"))
    report "failure in signed magnutude conversion of  0 get=" & integer'image (to_integer(signed_mag_to_signed("100"))) severity error;
  assert  1=to_integer(signed_mag_to_signed("101"))
    report "failure in signed magnutude conversion of  1 get=" & integer'image (to_integer(signed_mag_to_signed("101"))) severity error;
  assert  2=to_integer(signed_mag_to_signed("110"))
    report "failure in signed magnutude conversion of  2 get=" & integer'image (to_integer(signed_mag_to_signed("110"))) severity error;
  assert  3=to_integer(signed_mag_to_signed("111"))
    report "failure in signed magnutude conversion of  3 get=" & integer'image (to_integer(signed_mag_to_signed("111"))) severity error;

  tx_assignment : for I in 0 to c_NUM_SECTOR_LOGIC_OUTPUTS-1 generate
    signal header  : std_logic_vector (31 downto 0);
    signal trailer : std_logic_vector (31 downto 0);
    signal data    : std_logic_vector (127 downto 0);
    signal mtc     : mtc2sl_rt;
  begin

    sl : if (I < c_NUM_MTC) generate

      mtc <= structify(mtc_i(I));

      header  <= vectorify(mtc.common.header);
      trailer <= vectorify(mtc.common.trailer);

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

      --sl_tx_data(I).valid <= mtc_i(I)(2);
      --sl_tx_data(I).data(191 downto 0) <= mtc_i(I)(191 downto 0);

    end generate;

    nosl : if (I >= c_NUM_MTC) generate

      sl_tx_data(I).data  <= (others => '0');
      sl_tx_data(I).valid <= '0';

    end generate;

  --function structify(x: mtc2sl_rvt) return mtc2sl_rt is
  end generate;

  rx_assignment : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate

    -- intermediate signals to remap
    signal slc_barrel_specific : slc_barrel_rt;
    signal slc_endcap_specific : slc_endcap_rt;
    signal header              : std_logic_vector (31 downto 0);
    signal trailer             : std_logic_vector (31 downto 0);
    signal data                : std_logic_vector (127 downto 0);
    signal sl_data             : slc_rx_rt;
    constant station           : station_t := ENDCAP;

  begin

    header  <= sl_rx_data(I).data(31 downto 0);
    data    <= sl_rx_data(I).data(159 downto 32);
    trailer <= sl_rx_data(I).data(191 downto 160);

    sl_data_o(I) <= vectorify(sl_data);

    sl_data.common.header  <= structify(header);
    sl_data.common.trailer <= structify(trailer);

    sl_data.common.slcid       <= unsigned(data(2 downto 0));
    sl_data.common.tcsent      <= data(3);
    sl_data.common.poseta      <= signed(data(17 downto 4));
    sl_data.common.posphi      <= unsigned(data(26 downto 18));
    sl_data.common.sl_pt       <= unsigned(data(34 downto 27));
    sl_data.common.sl_ptthresh <= unsigned(data(38 downto 35));
    sl_data.common.sl_charge   <= data(39);
    sl_data.common.cointype    <= data (42 downto 40);

    slc_barrel_specific.rpc0_posz  <= signed(data(54 downto 43));
    slc_barrel_specific.rpc1_posz  <= signed(data(66 downto 55));
    slc_barrel_specific.rpc2_posz  <= signed(data(78 downto 67));
    slc_barrel_specific.rpc3_posz  <= signed(data(90 downto 79));
    slc_barrel_specific.b_reserved <= data(127 downto 91);

    slc_endcap_specific.seg_angdtheta    <= signed_mag_to_signed(data(49 downto 43));
    slc_endcap_specific.seg_angdphi      <= signed_mag_to_signed(data(53 downto 50));
    slc_endcap_specific.nswseg_poseta    <= unsigned(data(67 downto 54));
    slc_endcap_specific.nswseg_posphi    <= unsigned(data(75 downto 68));
    slc_endcap_specific.nswseg_angdtheta <= signed(data(80 downto 76));
    slc_endcap_specific.nswseg_mon       <= data(81);
    slc_endcap_specific.e_reserved       <= data(127 downto 82);

    barrel_spec_gen : if (station = BARREL) generate
      sl_data.specific <= vectorify(slc_barrel_specific);
    end generate;

    endcap_spec_gen : if (station = ENDCAP) generate
      sl_data.specific <= vectorify(slc_endcap_specific);
    end generate;

    sl_data.data_valid <= sl_rx_data(I).valid;

  end generate;

  sl_gen : for I in 0 to c_NUM_MGTS-1 generate

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    tx_gen : if (sl_idx_array(I) /= -1) generate
      constant idx : integer := sl_idx_array(I);
    begin

      assert false report "generating SL TX #" & integer'image(idx) & " on MGT#" & integer'image(I) severity note;

      sector_logic_tx_packet_former_inst : entity sl.sector_logic_tx_packet_former
        generic map (
          NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
          NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
        port map (
          tx_usrclk2      => clock,
          userdata_tx     => sl_tx_mgt_word_array_o(idx),
          txctrl0         => sl_tx_ctrl_o(idx).ctrl0,      -- 4 bit to mgt
          txctrl1         => sl_tx_ctrl_o(idx).ctrl1,      -- 4 bit to mgt
          txctrl2         => sl_tx_ctrl_o(idx).ctrl2,      -- 4 bit to mgt
          packet_userdata => sl_tx_data_post_cdc(idx).data,
          packet_valid    => sl_tx_data_post_cdc(idx).valid,
          packet_txctrl0  => std_logic_vector'(x"000000"),
          packet_txctrl1  => std_logic_vector'(x"000000"),
          packet_txctrl2  => std_logic_vector'(x"100000")  -- FIXME this is made up, need to check the txctrl logic
          );

      -- sync from pipeline clock-----------------------------------------------------
      sync_sl_tx : entity work.sync_cdc
        generic map (
          WIDTH    => sl_tx_data_post_cdc(idx).data'length,
          N_STAGES => 2)
        port map (
          clk_i   => clock,
          valid_i => sl_tx_data(idx).valid,
          data_i  => sl_tx_data(idx).data,
          valid_o => sl_tx_data_post_cdc(idx).valid,
          data_o  => sl_tx_data_post_cdc(idx).data
          );

    end generate;

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    rx_gen : if (sl_idx_array(I) /= -1) generate
      constant idx           : integer := sl_idx_array(I);
      signal dec_rxctrl0     : std_logic_vector (NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      signal dec_rxctrl2     : std_logic_vector (NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      signal dec_userdata    : std_logic_vector (31 downto 0);
      signal sl_pre_cdc_vec  : std_logic_vector (sl_rx_data_pre_cdc(idx).data'length + 1 downto 0);
      signal sl_post_cdc_vec : std_logic_vector (sl_rx_data_pre_cdc(idx).data'length + 1 downto 0);
    begin

      assert false report "generating SL RX #" & integer'image(idx) & " on MGT#" & integer'image(I) severity note;

      -- decode 8b10b words
      rx_comma_detector_inst : entity sl.rx_comma_detection
        generic map (
          NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
          NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
        port map (
          reset               => rx_reset_tree(idx),
          clk_in              => clock,
          rx_data_in          => sl_rx_mgt_word_array_i(idx),  -- 32 bit from mgt
          rx_ctrl0_in         => sl_rx_ctrl_i(idx).ctrl0,      -- 4 bit from mgt
          rx_ctrl1_in         => sl_rx_ctrl_i(idx).ctrl1,      -- 4 bit from mgt
          decoded_data_out    => dec_userdata,                 -- 32 bit to packet former
          decoded_charisk_out => dec_rxctrl0,                  -- 4 bit to packet former
          decoded_iscomma_out => dec_rxctrl2,                  -- 4 bit to packet former
          comma_pulse_out     => open,                         --
          lock_out            => open,                         --
          rxslide_out         => sl_rx_slide_o(idx)            -- 1 bit to mgt
          );

      -- form 192 bit packets
      sector_logic_rx_packet_former_inst : entity sl.sector_logic_rx_packet_former

        generic map (
          NUMBER_OF_WORDS_IN_A_PACKET => NUMBER_OF_WORDS_IN_A_PACKET,
          NUMBER_OF_BYTES_IN_A_WORD   => NUMBER_OF_BYTES_IN_A_WORD)
        port map (
          reset => rx_reset_tree (idx),

          rx_usrclk2 => clock,

          userdata_rx => dec_userdata,

          -- 3 downto 0, from rx_comma_detection
          rxctrl0 => dec_rxctrl0,       -- charisk
          rxctrl1 => (others => '0'),
          rxctrl2 => dec_rxctrl2,       -- rxctrl2(0) == is_comma
          rxctrl3 => (others => '0'),

          -- 23 downto 0
          packet_rxctrl0 => open,       -- just connects to led sump
          packet_rxctrl1 => open,
          packet_rxctrl2 => open,
          packet_rxctrl3 => open,

          packet_userdata       => sl_rx_data_pre_cdc(idx).data,
          packet_locked         => sl_rx_data_pre_cdc(idx).locked,
          packet_valid          => sl_rx_data_pre_cdc(idx).valid,
          packet_error_detected => sl_rx_data_pre_cdc(idx).err

          );

      --sync to pipeline clock-------------------------------------------------

      -- convert to a std_logic_vector
      sl_pre_cdc_vec <= sl_rx_data_pre_cdc(idx).data & sl_rx_data_pre_cdc(idx).err & sl_rx_data_pre_cdc(idx).locked;

      -- FIXME: need to make this a smarter cdc.. can't tolerate variable latency due to
      -- metastability... transition only on known good clock edges.. uhgg...
      sync_sl_tx_data : entity work.sync_cdc
        generic map (
          WIDTH    => 1 + 1 + sl_rx_data_pre_cdc(idx).data'length,
          N_STAGES => 4)
        port map (
          clk_i   => pipeline_clock,
          valid_i => sl_rx_data_pre_cdc(idx).valid,
          valid_o => sl_rx_data(idx).valid,
          data_i  => sl_pre_cdc_vec,
          data_o  => sl_post_cdc_vec
          );

      sl_rx_data(idx).data   <= sl_post_cdc_vec(sl_rx_data_pre_cdc(idx).data'length+2-1 downto 2);
      sl_rx_data(idx).err    <= sl_post_cdc_vec(1);
      sl_rx_data(idx).locked <= sl_post_cdc_vec(0);

    end generate;
  end generate;

end Behavioral;
