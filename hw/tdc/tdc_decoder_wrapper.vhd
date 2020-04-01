library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library textio;
use textio.all;

library tdc;
library xil_defaultlib;

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

entity tdc_decoder_wrapper is
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data : in lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);
    --lpgbt_downlink_data : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- TDC hits from CSM
    tdc_hits : out TDCPOLMUX_rt_array (c_NUM_POLMUX-1 downto 0)

    );
end tdc_decoder_wrapper;

architecture behavioral of tdc_decoder_wrapper is

  signal tdc_hits_to_polmux : TDCPOLMUX_rt_array (c_NUM_TDC_INPUTS-1 downto 0);

  signal read_done : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);

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


begin
  tdc_loop : for I in 0 to (c_NUM_TDC_INPUTS-1) generate

    signal even_data : std_logic_vector (7 downto 0);
    signal odd_data  : std_logic_vector (7 downto 0);
    signal valid     : std_logic;

    constant idx     : integer := c_TDC_LINK_MAP(I).link_id;
    constant even_id : integer := c_TDC_LINK_MAP(I).elink;
    constant odd_id  : integer := c_TDC_LINK_MAP(I).elink+1;
    constant legacy  : boolean := c_TDC_LINK_MAP(I).legacy;

    -- TODO http://www.pldworld.com/_hdl/2/_tutor/www.stefanvhdl/vhdl/vhdl/txt_util.vhd
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


    assert false report " > LINK_ID  =" & integer'image(c_TDC_LINK_MAP(I).link_id) severity note;
    assert false report " > LPGBT_IDX=" & integer'image(lpgbt_uplink_idx_array(c_TDC_LINK_MAP(I).link_id)) severity note;
    assert false report " > LPGBT_ID =" & integer'image(idx) severity note;
    assert false report " > EVEN_ID  =" & integer'image(even_id) severity note;
    assert false report " > ODD_ID   =" & integer'image(odd_id) severity note;

    tdc_gen : if (c_TDC_LINK_MAP(I).link_id /= -1 and
                  lpgbt_uplink_idx_array(c_TDC_LINK_MAP(I).link_id) /= -1 and
                  idx /= -1 and
                  even_id /= -1 and odd_id /= -1)
    generate

      attribute DONT_TOUCH : string;
      attribute MGT_INDEX  : integer;
      -- attribute MGT_INDEX of sync_csm  : label is idx;
      -- attribute DONT_TOUCH of sync_csm : label is "true";

    begin

      assert I /= 0 report "Generating " & integer'image(c_NUM_TDC_INPUTS) & " TDC Decoders, which will be multiplexed by " &
        integer'image(c_NUM_POLMUX) & " polling muxes" severity note;


      assert (c_MGT_MAP(idx).mgt_type = MGT_LPGBT or c_MGT_MAP(idx).mgt_type = MGT_LPGBT_SIMPLEX) report
        " > TDC_LINK_MAP assigns elink to non-lpgbt MGT" severity error;

      even_data <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(even_id+1)-1 downto 8*even_id);
      odd_data  <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(odd_id +1)-1 downto 8* odd_id);
      valid     <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).valid;



      --encoded_control_inst: entity work.encoded_control
      --  port map (
      --    clk_i => clocks.clock40,
      --    dav_i => '1',
      --    rst_i => reset,
      --    trg_i => trg_i(I),
      --    bcr_i => bcr_i(I),
      --    ecr_i => ecr_i(I),
      --    gsr_i => gsr_i(I),
      --    enc_o => enc_o(I)
      --);

      --lpgbt_downlink_data(lpgbt_downlink_idx_array(idx)).data(8*(enc_id+1)-1 downto 8*enc_id);


      assert false report " > Generating TDC Decoder #" & integer'image(I) & " on MGT #"
        & integer'image(idx) & " even elink = " & integer'image(even_id) &
        " odd elink = " & integer'image(odd_id) & " legacy=" & str(legacy) severity note;

      new_tdc_gen : if (legacy = false) generate

        tdc_decoder_v2_inst : entity tdc.tdc_decoder_v2
          port map (
            clock       => clock,
            reset       => reset,
            data_even   => even_data,
            data_odd    => odd_data,
            valid_i     => valid,
            tdc_word_o  => tdc_word_to_polmux,
            valid_o     => tdc_valid_to_polmux,
            read_done_i => read_done(I),
            tdc_err_o   => open         -- TODO: connect this to a counter
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

    end generate;  -- TDC gen
  end generate;  -- TDC loop

  --------------------------------------------------------------------------------
  -- Polling Mux
  --------------------------------------------------------------------------------

  polmux_loop : for I in 0 to (c_NUM_POLMUX-1) generate

    -- extract the size of the polmux in this loop based on the number of inputs assigned
    constant size : integer := polmux_size(c_TDC_LINK_MAP, I, c_NUM_TDC_INPUTS);

    -- signals to hold the up to ~20 polmux inputs and outputs for this loop
    signal read_done_polmux : std_logic_vector (size-1 downto 0);
    signal polmux_inputs    : TDCPOLMUX_rt_array (size-1 downto 0);
    signal polmux_output    : TDCPOLMUX_rt;
    signal fifo_output      : TDCPOLMUX_at;

  begin

    assert (false) report " > Generating Polmux #" & integer'image(I) &
      " with " & integer'image(size) & " inputs" severity note;

    -- polmux_inputs <= polmux_input_map(tdc_hits_to_polmux, c_TDC_LINK_MAP, I, size, c_NUM_TDC_INPUTS);

    read_done_assign_loop : for J in 0 to size-1 generate
      read_done(polmux_reverse_map (c_TDC_LINK_MAP, J, I, c_NUM_TDC_INPUTS)) <= read_done_polmux(J);
    end generate;  -- read done assign loop

    polling_mux_inst : entity tdc.polling_mux
      generic map (g_WIDTH => size)
      port map (
        clock       => clock,                                                                            -- 320MHz system clock
        tdc_hits_i  => polmux_input_map(tdc_hits_to_polmux, c_TDC_LINK_MAP, I, size, c_NUM_TDC_INPUTS),  -- words from TDC
        read_done_o => read_done_polmux,                                                                 -- will be asserted high once a tdc hit is read, feed back into the tdc hit decoder
        tdc_hit_o   => polmux_output                                                                     -- polling mux outputs to cdc
        );

    polmux_sync_fifo_inst : entity xil_defaultlib.polmux_sync_fifo
      port map (
        wr_clk => clock,
        rd_clk => pipeline_clock,
        din    => tdcpolmux_2af(polmux_output),
        wr_en  => polmux_output.datavalid,
        rd_en  => std_logic'('1'),
      dout  => fifo_output,
      full  => open,
      empty => open
      );

    tdc_hits(I) <= tdcpolmux_2rf (fifo_output);

  end generate;  -- TDC loop

  --------------------------------------------------------------------------------
  -- Clock domain crossing
  --------------------------------------------------------------------------------

end behavioral;


-- legacy_tdc_gen : if (legacy = true) generate
--   tdc_hits(I).tdc_r     <= (others => '0');
--   tdc_hits(I).datavalid <= valid;
-- end generate;

-- constants don't need any CDC, only cross clocks with the 32 bit hit
-- data + valid flag

-- we have a fifo valid coming in on the framework clock; this valid is high for 62.5 ns (16MHz)
--                    _________________________________________________________________
-- tdc_hits_i.valid __|
-- cycle            __/================================================================
--
-- pipe_clk has some fixed phase relationship but arbtrary frequency relationship (meaning that rising edges won't
-- necessarily line up)
--
-- we can resample the valid signal onto the pipeline clock and delay it by 1 (or more) clock cycles
-- then sample data_i when we see valid_i asserted high. just need to make sure we apply a datapath only constraint
--                ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____
-- pipe_clk       |  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |
--                      _________________________________________________________________
-- valid_i        ______|
--                            _________________________________________________________________
-- valid_i_dly    ____________|
--                            _________________________________________________________________
-- data_i            _________|
--

--         sync_csm : entity work.sync_cdc
--           generic map (
--             WIDTH    => tdc_hits_pre_cdc'length,
--             N_STAGES => 1
--             )
--           port map (
--             clk_i   => pipeline_clock,
--             valid_i => tdc_hits_pre_cdc_valid,
--             data_i  => tdc_hits_pre_cdc,
--             valid_o => tdc_hits(I).datavalid,
--             data_o  => tdc_hit_vector
--             );

--tdc_hits(I).tdc_r   <=   tdc_2rf(tdc_hit_vector);
