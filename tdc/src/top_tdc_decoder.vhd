library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library textio;
use textio.all;

library tdc;
use tdc.csm_pkg.all;

library xil_defaultlib;

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

entity top_tdc_decoder is
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data : in lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);
    --lpgbt_downlink_data : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- TDC hits from CSM
    tdc_hits_inner  : out TDCPOLMUX_rt_array (c_NUM_POLMUX_INNER-1 downto 0);
    tdc_hits_middle : out TDCPOLMUX_rt_array (c_NUM_POLMUX_MIDDLE-1 downto 0);
    tdc_hits_outer  : out TDCPOLMUX_rt_array (c_NUM_POLMUX_OUTER-1 downto 0)

    );
end top_tdc_decoder;

architecture behavioral of top_tdc_decoder is

  signal tdc_hits_to_polmux : TDCPOLMUX_rt_array (c_NUM_TDC_INPUTS-1 downto 0);

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
    constant even_id : integer := c_TDC_LINK_MAP(I).elink;
    constant odd_id  : integer := func_get_tdc_odd_id (even_id, c_MGT_MAP(idx).mgt_type, c_MASTER_ELINK_MAP, c_SLAVE_ELINK_MAP);
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

    signal tdc_word_to_polmux  : TDC_at;
    signal tdc_valid_to_polmux : std_logic;

  begin

    -- Just create a stupid loop that should tag the TDC inst with an
    -- MGT number that can be easily picked out of the hierarchy
    mgt_tag : for MGT_NUM in idx to idx generate
    begin

      tdc_gen : if (MGT_NUM = idx and
                    c_TDC_LINK_MAP(I).link_id /= -1 and
                    lpgbt_uplink_idx_array(c_TDC_LINK_MAP(I).link_id) /= -1 and
                    idx /= -1 and
                    even_id /= -1)
      generate
      begin

        assert false report " > LINK_ID  =" & integer'image(c_TDC_LINK_MAP(I).link_id) severity note;
        assert false report " > LPGBT_IDX=" & integer'image(lpgbt_uplink_idx_array(c_TDC_LINK_MAP(I).link_id)) severity note;
        assert false report " > LPGBT_ID =" & integer'image(idx) severity note;
        assert false report " > EVEN_ID  =" & integer'image(even_id) severity note;
        assert false report " > ODD_ID   =" & integer'image(odd_id) severity note;

        assert odd_id /= -1 report "Invalid E-link selected for TDC Decoder, TDC#" & integer'image(I) & " elink #" &
          integer'image(even_id) severity error;

        assert I /= 0 report "Generating " & integer'image(c_NUM_TDC_INPUTS) & " TDC Decoders, which will be multiplexed by " &
          integer'image(c_NUM_POLMUX) & " polling muxes" severity note;

        assert (c_MGT_MAP(idx).mgt_type = MGT_LPGBT or c_MGT_MAP(idx).mgt_type = MGT_LPGBT_SIMPLEX) report
          " > TDC_LINK_MAP assigns elink to non-lpgbt MGT" severity error;

        even_data <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(even_id+1)-1 downto 8*even_id);
        odd_data  <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(odd_id +1)-1 downto 8* odd_id);
        valid     <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).valid;


        assert false report " > Generating TDC Decoder #" & integer'image(I) & " on MGT #"
          & integer'image(idx) & " even elink = " & integer'image(even_id) &
          " odd elink = " & integer'image(odd_id) & " legacy=" & str(legacy) severity note;

        new_tdc_gen : if (legacy = false) generate

          tdc_decoder_inst : entity tdc.tdc_decoder
            port map (
              clock       => clock,
              reset       => reset,
              data_even   => even_data,
              data_odd    => odd_data,
              valid_i     => valid,
              tdc_word_o  => tdc_word_to_polmux,
              valid_o     => tdc_valid_to_polmux,
              read_done_i => read_done(I),
              tdc_err_o   => open       -- TODO: connect this to a counter
              );

        end generate;  -- new TDC gen

        legacy_tdc_gen : if (legacy = true) generate
          assert false report "ERROR: we don't support legacy TDC links yet" severity error;
        end generate;  -- new TDC gen

        -- constants
        tdc_hits_to_polmux(I).fiberid   <= std_logic_vector(to_unsigned(idx, TDCPOLMUX_FIBERID_LEN));
        tdc_hits_to_polmux(I).elinkid   <= std_logic_vector(to_unsigned(even_id, TDCPOLMUX_ELINKID_LEN));
        tdc_hits_to_polmux(I).tdc_r     <= tdc_2rf(tdc_word_to_polmux);
        tdc_hits_to_polmux(I).datavalid <= tdc_valid_to_polmux;

      end generate;  -- mgt tag
    end generate;  -- TDC gen
  end generate;  -- TDC loop

  --------------------------------------------------------------------------------
  -- Polling Mux
  --------------------------------------------------------------------------------

  inner_loop : for I in 0 to (c_NUM_POLMUX-1) generate
    assert (false) report " > Inner Polmux IDX (" & integer'image(I) &
      ")=" & integer'image(inner_polmux_idx_array(I)) severity note;
  end generate;
  middle_loop : for I in 0 to (c_NUM_POLMUX-1) generate
    assert (false) report " > Middle Polmux IDX (" & integer'image(I) &
      ")=" & integer'image(middle_polmux_idx_array(I)) severity note;
  end generate;
  outer_loop : for I in 0 to (c_NUM_POLMUX-1) generate
    assert (false) report " > Outer Polmux IDX (" & integer'image(I) &
      ")=" & integer'image(outer_polmux_idx_array(I)) severity note;
  end generate;

  polmux_loop : for I in 0 to (c_NUM_POLMUX-1) generate

    -- extract the polmux station from the polmux index
    function polmux_station (tdc_map : tdc_link_map_array_t; index : integer)
      return station_id_t is
    begin
      for I in 0 to tdc_map'length-1 loop
        if (tdc_map(I).polmux_id = index) then
          return tdc_map(I).station_id;
        end if;
      end loop;
      return NIL;
    end polmux_station;

    -- function to count the number of inputs to a given polmux
    function polmux_size (tdc_map : tdc_link_map_array_t; index : integer; num_tdcs : integer)
      return integer is
      variable count : integer := 0;
    begin
      for I in 0 to num_tdcs-1 loop
        if (tdc_map(I).polmux_id = index) then
          count := count + 1;
        end if;
      end loop;
      return count;
    end polmux_size;

    -- function to create a reverse mapping (take a entry, e.g. 0-19 for a given polmux and return a global index)
    function polmux_reverse_map (tdc_map  : tdc_link_map_array_t;
                                 entry    : integer;
                                 index    : integer;
                                 num_tdcs : integer)
      return integer is
      variable count : integer := 0;
      variable ret   : integer := 0;
    begin
      for I in 0 to num_tdcs-1 loop
        if (tdc_map(I).polmux_id = index) then
          if (count = entry) then
            return I;
          else
            count := count + 1;
          end if;
        end if;
      end loop;
      return ret;
    end polmux_reverse_map;

    function polmux_input_map (in_array : TDCPOLMUX_rt_array;    -- full array of all TDC hits
                               tdc_map  : tdc_link_map_array_t;  -- constant mapping from board pkg
                               index    : integer;               -- # of the polmux
                               size     : integer;               -- size of the polmux
                               num_tdcs : integer)               -- number of tdcs instantiated
      return TDCPOLMUX_rt_array is
      variable count : integer := 0;
      variable ret   : TDCPOLMUX_rt_array (size - 1 downto 0);
    begin
      for I in 0 to num_tdcs-1 loop
        if (tdc_map(I).polmux_id = index) then
          ret(count) := in_array (I);
          count      := count + 1;
        end if;
      end loop;
      return ret;
    end polmux_input_map;

    --------------------------------------------------------------------------------
    -- Constants
    --------------------------------------------------------------------------------

    constant c_POLMUX_WIDTH : integer := polmux_size(c_TDC_LINK_MAP, I, c_NUM_TDC_INPUTS);

    constant c_POLMUX_STATION : station_id_t := polmux_station(c_TDC_LINK_MAP, I);

    -- signals to hold the up to ~20 polmux inputs and outputs for this loop
    signal read_done_polmux : std_logic_vector (c_POLMUX_WIDTH-1 downto 0);
    signal polmux_inputs    : TDCPOLMUX_rt_array (c_POLMUX_WIDTH-1 downto 0);
    signal polmux_output    : TDCPOLMUX_rt;
    signal fifo_output      : TDCPOLMUX_at;

    constant std_logic1 : std_logic := '1';

  begin

    assert (false) report " > Generating Polmux #" & integer'image(I) &
      " with " & integer'image(c_POLMUX_WIDTH) & " inputs" severity note;

    polmux_inputs <= polmux_input_map(tdc_hits_to_polmux, c_TDC_LINK_MAP, I, c_POLMUX_WIDTH, c_NUM_TDC_INPUTS);

    read_done_assign_loop : for J in 0 to c_POLMUX_WIDTH-1 generate
      read_done(polmux_reverse_map (c_TDC_LINK_MAP, J, I, c_NUM_TDC_INPUTS)) <= read_done_polmux(J);
    end generate;  -- read done assign loop

    polling_mux_inst : entity tdc.polling_mux
      generic map (g_WIDTH => c_POLMUX_WIDTH)
      port map (
        clock       => clock,             -- 320MHz system clock
        tdc_hits_i  => polmux_inputs,
        read_done_o => read_done_polmux,  -- will be asserted high once a tdc hit is read, feed back into the tdc hit decoder
        tdc_hit_o   => polmux_output      -- polling mux outputs to cdc
        );

    --------------------------------------------------------------------------------
    -- Clock domain crossing
    --------------------------------------------------------------------------------

    polmux_sync_fifo_inst : entity xil_defaultlib.polmux_sync_fifo
      port map (
        wr_clk => clock,
        rd_clk => pipeline_clock,
        din    => tdcpolmux_2af(polmux_output),
        wr_en  => polmux_output.datavalid,
        rd_en  => std_logic1,
        dout   => fifo_output,
        full   => open,
        empty  => open
        );

    inner_assign : if (c_POLMUX_STATION = INNER) generate
      assert (false) report " > Assigning Output of Polmux #" & integer'image(I) &
        " to INNER tdc stream #" & integer'image(inner_polmux_idx_array(I)) severity note;
      tdc_hits_inner(inner_polmux_idx_array(I)) <= tdcpolmux_2rf (fifo_output);
    end generate;

    middle_assign : if (c_POLMUX_STATION = MIDDLE) generate
      assert (false) report " > Assigning Output of Polmux #" & integer'image(I) &
        " to MIDDLE tdc stream #" & integer'image(middle_polmux_idx_array(I)) severity note;
      tdc_hits_middle(middle_polmux_idx_array(I)) <= tdcpolmux_2rf (fifo_output);
    end generate;

    outer_assign : if (c_POLMUX_STATION = OUTER) generate
      assert (false) report " > Assigning Output of Polmux #" & integer'image(I) &
        " to OUTER tdc stream #" & integer'image(outer_polmux_idx_array(I)) severity note;
      tdc_hits_outer(outer_polmux_idx_array(I)) <= tdcpolmux_2rf (fifo_output);
    end generate;

  end generate;  -- TDC loop

end behavioral;
