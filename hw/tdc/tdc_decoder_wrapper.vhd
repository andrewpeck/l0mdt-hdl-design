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

entity tdc_decoder_wrapper is
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data : in lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);
    --lpgbt_downlink_data : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- TDC hits from CSM
    tdc_hits : out TDCPOLMUX_rt_array (c_NUM_TDC_INPUTS-1 downto 0)

    );
end tdc_decoder_wrapper;

architecture behavioral of tdc_decoder_wrapper is

begin

  assert false report "Generating " & integer'image(c_NUM_TDC_INPUTS) & " TDC Decoders" severity note;

  tdc_loop : for I in 0 to (c_NUM_TDC_INPUTS-1) generate
  begin

    tdc_gen : if (c_TDC_LINK_MAP(I).link_id /= -1 and lpgbt_uplink_idx_array(c_TDC_LINK_MAP(I).link_id) /= -1) generate

      signal even_data        : std_logic_vector (7 downto 0);
      signal odd_data         : std_logic_vector (7 downto 0);
      signal valid            : std_logic;

      signal tdc_hit_vector : TDC_at;

      signal tdc_hits_pre_cdc       : TDC_at;
      signal tdc_hits_pre_cdc_valid : std_logic;

      constant idx     : integer := c_TDC_LINK_MAP(I).link_id;
      constant even_id : integer := c_TDC_LINK_MAP(I).even_elink;
      constant odd_id  : integer := c_TDC_LINK_MAP(I).odd_elink;
      constant legacy  : boolean := c_TDC_LINK_MAP(I).legacy;

    begin

      gen_tdc : if (idx /= -1 and even_id /= -1 and odd_id /= -1) generate

        attribute DONT_TOUCH             : string;
        attribute MGT_INDEX              : integer;
        attribute MGT_INDEX of sync_csm  : label is idx;
        attribute DONT_TOUCH of sync_csm : label is "true";

      begin

        assert false report " > Generating TDC Decoder #" & integer'image(I) & " on MGT #"
          & integer'image(idx) & " even elink = " & integer'image(even_id) &
          " odd elink = " & integer'image(odd_id) severity note;

        assert (c_MGT_MAP(idx).mgt_type = MGT_LPGBT or c_MGT_MAP(idx).mgt_type = MGT_LPGBT_SIMPLEX) report
          " > TDC_LINK_MAP assigns elink to non-lpgbt MGT" severity error;

        even_data        <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(even_id+1)-1 downto 8*even_id);
        odd_data         <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).data(8*(odd_id +1)-1 downto 8* odd_id);
        valid            <= lpgbt_uplink_data(lpgbt_uplink_idx_array(idx)).valid;

        -- constants
        tdc_hits(I).fiberid <= std_logic_vector(to_unsigned(idx, TDCPOLMUX_FIBERID_LEN));
        tdc_hits(I).elinkid <= std_logic_vector(to_unsigned(even_id, TDCPOLMUX_ELINKID_LEN));


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


        tdc_gen : if (legacy = false) generate

          assert false report " > Generating New TDC Decoder #" & integer'image(I) & " on MGT #"
            & integer'image(idx) & " elink = " & integer'image(even_id) severity note;

          tdc_decoder_v2_inst : entity framework.tdc_decoder_v2
            port map (
              clock      => clock,
              reset      => reset,
              data_even  => even_data,
              data_odd   => odd_data,
              valid_i    => valid,
              tdc_word_o => tdc_hits_pre_cdc,
              valid_o    => tdc_hits_pre_cdc_valid,
              tdc_err_o  => open        -- TODO: connect this to a counter
              );

        end generate;

        -- legacy_tdc_gen : if (legacy = true) generate
        --   tdc_hits(I).tdc_r     <= (others => '0');
        --   tdc_hits(I).datavalid <= valid;
        -- end generate;

        -- constants don't need any CDC, only cross clocks with the 32 bit hit
        -- data + valid flag

        sync_csm : entity work.sync_cdc
          generic map (
            WIDTH    => tdc_hits_pre_cdc'length,
            N_STAGES => 1
          )
          port map (
            clk_i   => pipeline_clock,
            valid_i => tdc_hits_pre_cdc_valid,
            data_i  => tdc_hits_pre_cdc,
            valid_o => tdc_hits(I).datavalid,
            data_o  => tdc_hit_vector
            );

        tdc_hits(I).tdc_r <= tdc_2rf(tdc_hit_vector);

      end generate;


    end generate;

  end generate;

end behavioral;
