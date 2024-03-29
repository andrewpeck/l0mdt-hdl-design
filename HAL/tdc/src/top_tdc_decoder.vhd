library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library tdc;
use tdc.csm_pkg.all;

library xil_defaultlib;

library hal;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

entity top_tdc_decoder is
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data : in lpgbt_uplink_data_rt_array (c_FELIX_LPGBT_INDEX downto 0);

    -- TDC hits from CSM
    tdc_hits_inner  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN-1 downto 0);
    tdc_hits_middle : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID-1 downto 0);
    tdc_hits_outer  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
    tdc_hits_extra  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT-1 downto 0)

    );
end top_tdc_decoder;

architecture behavioral of top_tdc_decoder is

  type tdc_err_cnt_array_t is array (integer range <>) of std_logic_vector(15 downto 0);
  signal tdc_err_cnt : tdc_err_cnt_array_t (c_NUM_TDC_INPUTS-1 downto 0) := (others => '0');

  signal tdc_hits_to_polmux : tdcpolmux2tar_avt (c_NUM_TDC_INPUTS-1 downto 0);

  signal read_done : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);

  signal i_inner  : integer := 0;
  signal i_middle : integer := 0;
  signal i_outer  : integer := 0;

begin

  tdc_loop : for I in 0 to (c_NUM_TDC_INPUTS-1) generate

    signal even_data : std_logic_vector (7 downto 0);
    signal odd_data  : std_logic_vector (7 downto 0);
    signal valid     : std_logic;

    constant idx     : integer := c_TDC_LINK_MAP(I).link_id;
    constant channel : integer := c_TDC_LINK_MAP(I).ch;
    constant legacy  : boolean := c_TDC_LINK_MAP(I).legacy;

    -- NOTE this library is very nice
    -- http://www.pldworld.com/_hdl/2/_tutor/www.stefanvhdl/vhdl/vhdl/txt_util.vhd
    function str (bool : boolean)
      return string is
    begin
      if (bool) then
        return "true";
      else
        return "false";
      end if;
    end str;

    signal tdc_word_from_decoder  : std_logic_vector (31 downto 0);
    signal tdc_valid_from_decoder : std_logic;
    signal tdc_hit_to_polmux      : MDT_POLMUX_RT;

  begin

    -- Just create a stupid loop that should tag the TDC inst with an
    -- MGT number that can be easily picked out of the hierarchy
    mgt_tag : for MGT_NUM in idx to idx generate
    begin

      tdc_gen : if (MGT_NUM = idx and
                    c_TDC_LINK_MAP(I).link_id /= -1 and
                    lpgbt_uplink_idx_array(c_TDC_LINK_MAP(I).link_id) /= -1 and
                    idx /= -1 and
                    channel /= -1)
      generate
        -- d0 carries the odd bits, d1 carries the even bits
        constant even_elink : integer := elink_pair_map(channel).ch2;
        constant odd_elink  : integer := elink_pair_map(channel).ch1;

        signal tdc_err : std_logic;

      begin

        assert false report " > LINK_ID     =" & integer'image(c_TDC_LINK_MAP(I).link_id) severity note;
        assert false report " > LPGBT #     =" & integer'image(lpgbt_uplink_idx_array(c_TDC_LINK_MAP(I).link_id)) severity note;
        assert false report " > MGT #       =" & integer'image(idx) severity note;
        assert false report " > CHANNEL     =" & integer'image(channel) severity note;
        assert false report " > EVEN_ELINK  =" & integer'image(even_elink) severity note;
        assert false report " > ODD_ELINK   =" & integer'image(odd_elink) severity note;

        assert channel >= 0 and channel <= 17 report "Invalid CSM channel selected for TDC Decoder, TDC#" & integer'image(I) & " channel #" &
                                           integer'image(channel) severity error;

        --assert I /= 0 report "Generating " & integer'image(c_NUM_TDC_INPUTS) & " TDC Decoders, which will be multiplexed by " &
        --  integer'image(c_NUM_POLMUX) & " polling muxes" severity note;

        assert (c_MGT_MAP(idx).mgt_type = MGT_LPGBT or c_MGT_MAP(idx).mgt_type = MGT_LPGBT_SIMPLEX) report
          " > TDC_LINK_MAP assigns elink to non-lpgbt MGT" severity error;

        even_data <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(even_elink+1)-1 downto 8*even_elink);
        odd_data  <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(odd_elink +1)-1 downto 8* odd_elink);
        valid     <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).valid;

        assert false report " > Generating TDC Decoder #" & integer'image(I) & " on MGT #"
          & integer'image(idx) & " even elink = " & integer'image(even_elink) &
          " odd elink = " & integer'image(odd_elink) & " legacy=" & str(legacy) severity note;

        new_tdc_gen : if (legacy = false) generate

          tdc_decoder_inst : entity tdc.tdc_decoder
            port map (
              clock       => clock,
              reset       => reset,
              resync_i    => '0', -- TODO: connect this to AXI
              synced_o    => open, -- TODO: connect this to AXI
              data_even   => even_data,
              data_odd    => odd_data,
              valid_i     => valid,
              tdc_word_o  => tdc_word_from_decoder,
              valid_o     => tdc_valid_from_decoder,
              read_done_i => read_done(I),
              tdc_err_o   => tdc_err
              );

        end generate;  -- new TDC gen

        legacy_tdc_gen : if (legacy = true) generate
          assert false report "ERROR: we don't support legacy TDC links yet" severity error;
        end generate;  -- new TDC gen


        tdc_hit_to_polmux.fiberid    <= std_logic_vector(to_unsigned(idx, MDT_FIBER_LEN));
        tdc_hit_to_polmux.muxid      <= std_logic_vector(to_unsigned(channel, MDT_MUXCH_LEN));  -- FIXME: what is a muxid??
        tdc_hit_to_polmux.tdc        <= convert(tdc_word_from_decoder);
        tdc_hit_to_polmux.data_valid <= tdc_valid_from_decoder;

        tdc_hits_to_polmux(I) <= convert(tdc_hit_to_polmux);

        cnt_err : entity work.counter
          generic map (width => 16)
          port map (
            clk    => clock,
            reset  => '0',
            enable => '1',
            event  => tdc_err,
            count  => tdc_err_cnt(idx),
            at_max => open
            );

      end generate;  -- mgt tag
    end generate;  -- TDC gen
  end generate;  -- TDC loop

  --------------------------------------------------------------------------------
  -- Polling Mux
  --------------------------------------------------------------------------------

  polmux_loop : for I in 0 to (c_NUM_POLMUX) generate
  begin
    is_used_check : if (inner_polmux_idx_array(I) /= -1 or middle_polmux_idx_array(I) /= -1 or
                     outer_polmux_idx_array(I) /= -1 or extra_polmux_idx_array(I) /= -1)
    generate
      -- extract the polmux station from the polmux index
      function get_polmux_station (tdc_map : tdc_link_map_array_t; index : integer)
        return station_id_t is
      begin
        for I in 0 to tdc_map'length-1 loop
          if (tdc_map(I).polmux_id = index) then
            return tdc_map(I).station_id;
          end if;
        end loop;
        return NIL;
      end get_polmux_station;

      -- function to count the number of inputs to a given polmux based on the link mapping
      function get_polmux_size (tdc_map : tdc_link_map_array_t; index : integer; num_tdcs : integer)
        return integer is
        variable count : integer := 0;
      begin
        for I in 0 to num_tdcs-1 loop
          if (tdc_map(I).polmux_id = index) then
            count := count + 1;
          end if;
        end loop;
        return count;
      end get_polmux_size;

      -- function to get a tdc index for a given polmux / entry
      -- i.e. given a polmux entry (e.g. 0-19) for a given polmux
      -- it will return a global index of the tdc number
      function get_tdc_index (tdc_map   : tdc_link_map_array_t;
                              entry     : integer;  -- entry to the polmux (e.g. 0-19)
                              polmux_id : integer)  -- POLMUX #
        return integer is
        variable count : integer := 0;
      begin
        for I in 0 to c_NUM_TDC_INPUTS-1 loop
          if (tdc_map(I).polmux_id = polmux_id) then
            if (count = entry) then
              return I;
            else
              count := count + 1;
            end if;
          end if;
        end loop;
        return 0;
      end get_tdc_index;

      -- function to take create an array of tdc hits correctly mapped and assigned to be
      -- used as input to the polling mux
      function polmux_input_map (in_array  : tdcpolmux2tar_avt;        -- full array of all TDC hits
                                 tdc_map   : tdc_link_map_array_t;  -- constant mapping from board pkg
                                 polmux_id : integer;               -- id # of the polmux
                                 size      : integer)               -- size of the polmux
        return tdcpolmux2tar_avt is
        variable count : integer := 0;
        variable ret   : tdcpolmux2tar_avt (size - 1 downto 0);
      begin
        for I in 0 to c_NUM_TDC_INPUTS-1 loop
          if (tdc_map(I).polmux_id = polmux_id) then
            ret(count) := in_array (I);
            count      := count + 1;
          end if;
        end loop;
        return ret;
      end polmux_input_map;

      function is_valid (a : mdt_polmux_vt)
        return std_logic is
        variable tmp : mdt_polmux_rt;
      begin
        tmp := convert(a);
        return tmp.data_valid;
      end is_valid;

      --------------------------------------------------------------------------------
      -- Constants
      --------------------------------------------------------------------------------

      constant POLMUX_WIDTH : integer := get_polmux_size(c_TDC_LINK_MAP, I, c_NUM_TDC_INPUTS);

      constant POLMUX_STATION : station_id_t := get_polmux_station(c_TDC_LINK_MAP, I);

      -- signals to hold the up to ~20 polmux inputs and outputs for this loop
      signal read_done_polmux : std_logic_vector (POLMUX_WIDTH-1 downto 0);
      signal polmux_inputs    : tdcpolmux2tar_avt (POLMUX_WIDTH-1 downto 0);
      signal polmux_output    : mdt_polmux_vt;
      signal fifo_output      : mdt_polmux_vt;
      signal valid            : std_logic;
      signal din              : std_logic_vector (63 downto 0);
      signal dout             : std_logic_vector (63 downto 0);

    begin

      assert (false) report " > Generating Polmux #" & integer'image(I) &
        " with " & integer'image(POLMUX_WIDTH) & " inputs" severity note;

      polmux_inputs <= polmux_input_map(tdc_hits_to_polmux, c_TDC_LINK_MAP, I, POLMUX_WIDTH);

      read_done_assign_loop : for J in 0 to POLMUX_WIDTH-1 generate
        read_done(get_tdc_index (c_TDC_LINK_MAP, J, I)) <= read_done_polmux(J);
      end generate;  -- read done assign loop

      polling_mux_inst : entity tdc.polling_mux
        generic map (g_WIDTH => POLMUX_WIDTH)
        port map (
          clock       => clock,             -- 320MHz system clock
          tdc_hits_i  => polmux_inputs,
          read_done_o => read_done_polmux,  -- will be asserted high once a tdc hit is read, feed back into the tdc hit decoder
          tdc_hit_o   => polmux_output      -- polling mux outputs to cdc
          );

      --------------------------------------------------------------------------------
      -- Clock domain crossing
      --------------------------------------------------------------------------------

      -- TODO: check the timing of the 'not valid' bit as a valid signal, make sure it is applied to the right clock cycle
      -- TODO: a "smart sync" of some sort..?... can CDC based on a valid bit on certain clock cycles only

      din         <= std_logic_vector(resize(unsigned(polmux_output), din'length));  -- zero pad
      fifo_output <= dout(fifo_output'length-1 downto 0);

      polmux_sync_fifo_inst : entity work.fifo_async
        generic map (
          DEPTH    => 16,
          WR_WIDTH => 64,
          RD_WIDTH => 64)
        port map (
          rst     => std_logic0,
          wr_clk  => clock,
          rd_clk  => pipeline_clock,
          din     => din,
          dout    => dout,
          wr_en   => is_valid(polmux_output),
          rd_en   => std_logic1,        --  FIFO internally gates the read signal with (not EMPTY)
          empty   => open,
          valid   => valid,
          full    => open,
          sbiterr => open,
          dbiterr => open
          );

      inner_assign : if (POLMUX_STATION = INNER) generate
        signal tmp : mdt_polmux_rt;
      begin
        assert (false) report " > Assigning Output of Polmux #" & integer'image(I) &
          " to INNER tdc stream #" & integer'image(inner_polmux_idx_array(I)) severity note;

        tmp.tdc        <= convert (fifo_output).tdc;
        tmp.fiberid    <= convert (fifo_output).fiberid;
        tmp.muxid      <= convert (fifo_output).muxid;
        tmp.data_valid <= valid;

        tdc_hits_inner(inner_polmux_idx_array(I)) <= convert(tmp);
      end generate;

      middle_assign : if (POLMUX_STATION = MIDDLE) generate
        signal tmp : mdt_polmux_rt;
      begin
        assert (false) report " > Assigning Output of Polmux #" & integer'image(I) &
          " to MIDDLE tdc stream #" & integer'image(middle_polmux_idx_array(I)) severity note;

        tmp.tdc        <= convert (fifo_output).tdc;
        tmp.fiberid    <= convert (fifo_output).fiberid;
        tmp.muxid      <= convert (fifo_output).muxid;
        tmp.data_valid <= valid;

        tdc_hits_middle(middle_polmux_idx_array(I)) <= convert(tmp);
      end generate;

      outer_assign : if (POLMUX_STATION = OUTER) generate
        signal tmp : mdt_polmux_rt;
      begin
        assert (false) report " > Assigning Output of Polmux #" & integer'image(I) &
          " to OUTER tdc stream #" & integer'image(outer_polmux_idx_array(I)) severity note;

        tmp.tdc        <= convert (fifo_output).tdc;
        tmp.fiberid    <= convert (fifo_output).fiberid;
        tmp.muxid      <= convert (fifo_output).muxid;
        tmp.data_valid <= valid;

        tdc_hits_outer(outer_polmux_idx_array(I)) <= convert(tmp);
      end generate;

      extra_assign : if (POLMUX_STATION = EXTRA) generate
        signal tmp : mdt_polmux_rt;
      begin
        assert (false) report " > Assigning Output of Polmux #" & integer'image(I) &
          " to EXTRA tdc stream #" & integer'image(extra_polmux_idx_array(I)) severity note;

        tmp.tdc        <= convert (fifo_output).tdc;
        tmp.fiberid    <= convert (fifo_output).fiberid;
        tmp.muxid      <= convert (fifo_output).muxid;
        tmp.data_valid <= valid;

        tdc_hits_extra(extra_polmux_idx_array(I)) <= convert(tmp);
      end generate;

    end generate;  -- check polmux idx array
  end generate;  -- TDC loop

end behavioral;
